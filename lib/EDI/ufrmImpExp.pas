unit ufrmImpExp;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, OleCtrls, CHILKATUPLOADLib_TLB, CHILKATHTTPLib_TLB, Grids,
  DBGrids, Db, DBClient, SHDocVw, ExtCtrls, ImgList, Menus, ComCtrls,
  RXCtrls, jpeg, DBLocal, DBLocalI,  FileCtrl, shellApi, DateUtils;

type
  TfrmImpExp = class(TForm)
    OpenDialog1: TOpenDialog;
    DataSource1: TDataSource;
    Image1: TImage;
    RxLabel1: TRxLabel;
    pbGeral: TProgressBar;
    PopupMenu1: TPopupMenu;
    Sair1: TMenuItem;
    ImageList1: TImageList;
    Enviar1: TMenuItem;
    Receber1: TMenuItem;
    cds: TIBClientDataSet;
    StatusBar1: TStatusBar;
    Memo1: TMemo;
    N1: TMenuItem;
    procedure btnEnviarArquivoClick(Sender: TObject);
    procedure btnReceberArquivoClick(Sender: TObject);
    procedure Receber1Click(Sender: TObject);
    procedure Enviar1Click(Sender: TObject);
    procedure Sair1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure StatusBar1DrawPanel(StatusBar: TStatusBar;
      Panel: TStatusPanel; const Rect: TRect);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    function ReceberArquivo(sFName:String):string;
    function EnviarArquivo(sFName:String):string;

  public
    { Public declarations }
    bAtivo,bImportando,bExportando,bEnviando, bRecebendo:Boolean;
    procedure AtualizaStatus;
    function Get(sURL:String):string;
  end;

var
  frmImpExp: TfrmImpExp;
  sPathOut, sPathIn, sPathTemp, prmUnidade:string;

const
  sDominio = 'www.';

implementation

//uses ugeral;

{$R *.DFM}

procedure TfrmImpExp.btnEnviarArquivoClick(Sender: TObject);
var i:Integer; sNome,sNomeTo,sPath:string;    fl:TFileListBox;
begin
  fl := TFileListBox.Create(Application);
  try
    fl.Parent := self;
    fl.Directory := sPathOut;
    for i := fl.Items.Count-1 downto 0 do
    begin
        sNome := fl.Items[i];
        sNomeTo := StringReplace(sNome,'.xml','.bkp',[]);
        sPath := sPathOut + FormatDateTime('ddmmyy',date) + '\';
        if not DirectoryExists(sPath) then
           CreateDir(sPath);
        sNomeTo := sPath + ExtractFileName(sNomeTo);
        if EnviarArquivo(sNome) <> 'Erro' then
        begin
          //Rename
          MoveFile(pchar(sNome), pchar(sNomeTo));
        end;
    end;
  finally
    FreeAndNil(fl);
  end;
end;

function TfrmImpExp.EnviarArquivo(sFName:String):string;
var
  upload: TChilkatUpload;
  success: integer;
begin
  //if not OpenDialog1.Execute then Exit;

  upload := TChilkatUpload.Create(Self);

  //  Specify the page (ASP, ASP.NET, Perl, Python, Ruby, CGI, etc)
  //  that will process the HTTP Upload.
  upload.Hostname := sDominio;
  upload.Path := '/edi/ReceiveUpload.aspx';
  upload.Login := 'vertrou';
  upload.Password := 'lilian';

  //  Add one or more files to be uploaded.
  upload.AddFileReference('file1', sFName);

  //  Do the upload.  The method returns when the upload
  //  is completed.
  //  This component also includes asynchronous upload capability,
  //  which is demonstrated in another example.
  success := upload.BlockingUpload();
  if (success <> 1) then
  begin
    frmImpExp.StatusBar1.Panels[2].Text := upload.LastErrorText;
    Result := 'Erro';
  end
  else
  begin
    Get(sDominio + '/dbArquivo.php?op=I&nome=' +
        sFName + '&unidade=' +
        prmUnidade);
    frmImpExp.StatusBar1.Panels[2].Text := 'Arquivo enviado com sucesso!';
    Result := 'OK';
  end;
end;

procedure TfrmImpExp.btnReceberArquivoClick(Sender: TObject);
var sFile:string;  str:TStrings;
begin
  try
    //Gera o arquivos.xml
    str := TStringList.Create;
    str.Text := Get(sDominio + '/dbArquivo.php?op=S&unidade=' + prmUnidade);
    //Faz Download do arquivo
    //Percorre a lista de arquivos fazendo download individual
    //cds.LoadFromStream(str);
    sFile := sPathIn + 'arquivos.xml';
    str.SaveToFile(sFile);
    try
      cds.LoadFromFile(sFile);
    except
      //Tratar erro quando arquivo.xml vier vazio...
    end;

    while not cds.Eof do
    begin
      sFile := cds.Fields[1].AsString;
      if ExtractFileExt(sFile)='.xml' then
      begin
        sFile := StringReplace(sFile,'E:\Home\vertrou\Web','vertrou.info',[]);
        sFile := StringReplace(sFile,'\','/',[rfReplaceAll]);
        sFile := ReceberArquivo(sFile);
        sFile := Copy(sFile,1,Length(sFile)-4);

        //Renomeia arquivo no servidor
        Get(sDominio + '/dbArquivo.php?op=A&edi=' +
          cds.Fields[0].AsString + '&unidade=' +
          prmUnidade);
      end;
      cds.Next;
    end;
  finally
    str.Free;
  end;
end;

function TfrmImpExp.Get(sURL:String):string;
var
  http: TChilkatHttp;
  success: Integer;
begin
  http := TChilkatHttp.Create(Self);
  http.Login := 'vertrou';
  http.Password := 'lilian';

  //  Any string unlocks the component for the 1st 30-days.
  success := http.UnlockComponent('30277129240');
  //success := http.UnlockComponent('Anything for 30-day trial');
  if (success <> 1) then
  begin
    frmImpExp.StatusBar1.Panels[2].Text := http.LastErrorText;
    Exit;
  end;
  result := http.QuickGetStr(sURL);
end;

function TfrmImpExp.ReceberArquivo(sFName:String):string;
var
  http: TChilkatHttp;
  success: Integer;
  sFNameTo:string;
  sList:TStrings;

  function PegaNome:String;
  var sAux:string; i:Integer;
  begin
	  for i:=1 to Length(sFName) do
	  begin
		if sFName[i] = '/' then
		begin
		   sList.Add(sAux);
		   sAux := '';
		end
		else
		   sAux := sAux + sFName[i];
	  end;
	  if sAux <> '' then
		sList.Add(sAux);

	  result := sAux;
  end;

begin
  http := TChilkatHttp.Create(Self);
  http.Login := 'vertrou';
  http.Password := 'lilian';

  //  Any string unlocks the component for the 1st 30-days.
  success := http.UnlockComponent('30277129240'); //Anything for 30-day trial');
  if (success <> 1) then
  begin
    frmImpExp.StatusBar1.Panels[2].Text := http.LastErrorText;
    Exit;
  end;

  //  Download
  sList := TStringList.Create;
  try
    sFNameTo := PegaNome;
  finally
    FreeAndNil(sList);
  end;
  success := http.Download(sFName,sPathIn+sFNameTo);
  if (success <> 1) then
    begin
      frmImpExp.StatusBar1.Panels[2].Text := http.LastErrorText;
    end
  else
  begin
    Result := sFNameTo;
    frmImpExp.StatusBar1.Panels[2].Text := 'Arquivo Recebido com Sucesso!';
  end;
end;

procedure TfrmImpExp.Receber1Click(Sender: TObject);
begin
   if not bRecebendo then
   begin
     bRecebendo := True;
     AtualizaStatus;
     btnReceberArquivoClick(self);
     bRecebendo := False;
     AtualizaStatus;
   end;
end;

procedure TfrmImpExp.Enviar1Click(Sender: TObject);
begin
   if not bEnviando then
   begin
     bEnviando := True;
     AtualizaStatus;
     btnEnviarArquivoClick(self);
     bEnviando := False;
     AtualizaStatus;
   end;
end;

procedure TfrmImpExp.Sair1Click(Sender: TObject);
begin
  Close;
end;

procedure TfrmImpExp.FormCreate(Sender: TObject);
begin
  StatusBar1.Panels[0].Style := psOwnerDraw;
end;

procedure TfrmImpExp.StatusBar1DrawPanel(StatusBar: TStatusBar;
  Panel: TStatusPanel; const Rect: TRect);
begin
 with StatusBar.Canvas do
   begin
     case Panel.Index of
       0: //fist panel
       begin
         if bAtivo then
           Brush.Color := clRed
         else
           Brush.Color := clGreen;
         Font.Color := clNavy;
         Font.Style := [fsBold];
       end;
     end;
     //Panel background color
     FillRect(Rect) ;

   end;
end;

procedure TfrmImpExp.AtualizaStatus;
begin
  if bExportando then
    StatusBar1.Panels[1].Text := 'Exportando...'
  else if bImportando then
    StatusBar1.Panels[1].Text := 'Importando...'
  else if bEnviando then
    StatusBar1.Panels[1].Text := 'Enviando...'
  else if bRecebendo then
    StatusBar1.Panels[1].Text := 'Recebendo...'
  else
    StatusBar1.Panels[1].Text := '';
  bAtivo := bExportando or bImportando or bEnviando or bRecebendo;
  Repaint;
  Sleep(2000);
end;

procedure TfrmImpExp.FormShow(Sender: TObject);
begin
  sPathTemp := ExtractFilePath(Application.ExeName)+'Temp\';
  StatusBar1.Panels[3].Text := prmUnidade;
end;


end.

