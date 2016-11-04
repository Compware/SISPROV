unit ufrmInterfaceAbacus;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, PReport, PdfDoc, ExtCtrls, StdCtrls, uspViewPDF, CPort, Buttons,
  Grids, ValEdit, ShellAPI, dxExEdtr, dxTL, dxDBCtrl, dxDBGrid, DB,
  dxCntner, IBCustomDataSet, IBQuery, FileCtrl;

type
  TfrmInterfaceAbacus = class(TForm)
    PReport1: TPReport;
    Panel1: TPanel;
    Panel3: TPanel;
    PRPage1: TPRPage;
    PRLayoutPanel1: TPRLayoutPanel;
    PRImage1: TPRImage;
    PRLabel1: TPRLabel;
    PRLabel4: TPRLabel;
    PRLabel26: TPRLabel;
    lbNome: TPRLabel;
    PDF: TspViewPDF;
    Panel2: TPanel;
    btConfigurar: TButton;
    btConfirmar: TBitBtn;
    btImprimir: TBitBtn;
    dxDBGrid1: TdxDBGrid;
    DataSource1: TDataSource;
    dxDBGrid1Column1: TdxDBGridColumn;
    dxDBGrid1Column2: TdxDBGridColumn;
    PRLabel29: TPRLabel;
    lbProcesso: TPRLabel;
    tbInterface: TIBDataSet;
    tbInterfaceCD_INTERFACE: TIntegerField;
    tbInterfaceCD_ID: TIntegerField;
    tbInterfaceDT_INTERFACE: TDateTimeField;
    tbInterfaceCD_MAQUINA: TIBStringField;
    tbInterfaceDS_INTERFACE: TIBStringField;
    tbInterfaceNM_PACIENTE: TIBStringField;
    tbInterfaceNR_PROCESSO: TIntegerField;
    tbInterfaceCD_AGENDA: TIntegerField;
    tbInterfaceFL_CONFIRMADO: TIBStringField;
    txInterface: TPRText;
    qyProcesso: TIBQuery;
    qyProcessoNM_PACIENTE: TIBStringField;
    qyProcessoNR_PROCESSO: TIntegerField;
    qyProcessoCD_AGENDA: TIntegerField;
    btExcluir: TBitBtn;
    lbSatus: TPRLabel;
    btRefazer: TButton;
    Splitter1: TSplitter;
    edID: TEdit;
    edIni: TEdit;
    edTam: TEdit;
    Timer1: TTimer;
    lstArquivos: TFileListBox;
    procedure btImprimirClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btConfirmarClick(Sender: TObject);
    procedure tbInterfaceAfterInsert(DataSet: TDataSet);
    procedure tbInterfaceAfterScroll(DataSet: TDataSet);
    procedure FormDestroy(Sender: TObject);
    procedure btExcluirClick(Sender: TObject);
    procedure btRefazerClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    function Imprimir:boolean;
    function Insere(str:String):boolean;
    procedure GeraPDF;
    procedure LerArquivos;
  end;

var
  frmInterfaceAbacus: TfrmInterfaceAbacus;
  sArquivo:string;


implementation

uses UDMDIG, UDM, UGeral, ufrmSenha;

{$R *.dfm}

procedure TfrmInterfaceAbacus.GeraPDF;
var str:string;
  procedure Monta;
  var i:integer;
  begin
     try
       lbNome.Caption := tbInterfaceNM_PACIENTE.AsString;
       lbProcesso.Caption := tbInterfaceNR_PROCESSO.AsString;
       txInterface.Lines.text := str;

       if trim(str)<>'' then
         for i:=0 to 7 do
           txInterface.Lines.Delete(i);
     except
        on e:exception do
          showmessage('Monta:' + e.message);
     end;
  end;

begin
  //mmLog.Lines.Add('GeraPDF');
  str := tbInterfaceDS_INTERFACE.AsString;
  Monta;
  PDF.Clear;
  PReport1.FileName := sArquivo;
  PReport1.BeginDoc;
  PReport1.Print(PRPage1);
  PReport1.EndDoc;
  PDF.LoadFromFile(sArquivo);
end;

procedure TfrmInterfaceAbacus.btImprimirClick(Sender: TObject);
begin
  Imprimir;
end;

function TfrmInterfaceAbacus.Imprimir: boolean;
begin
  ShellExecute(0, 'open', 'acrord32', PChar('/p /h ' + sArquivo), nil, SW_HIDE);
end;

function TfrmInterfaceAbacus.Insere(str: String): boolean;
var i,j,k:integer; s:string; lst:TStringList;
begin
   lst := TStringList.Create;
   try
     lst.LoadFromFile(str);
     try
      i := 11;  //strToInt(edID.text);
      j := 12; //strToInt(edIni.text);
      k := 10; //strToInt(edTam.text);

      s := lst.Strings[i];
      //mmLog.Lines.Add('ID:' + s);
      s := Copy(s,j,k);
      //mmLog.Lines.Add('ID:' + s);
      i := strToInt(trim(s));

      qyProcesso.Close;
      qyProcesso.ParamByName('ID').AsInteger := i;
      qyProcesso.Open;
      //mmLog.Lines.Add('Abrir....');
      //if qyProcesso.IsEmpty then
      //  mmLog.Lines.Add('Sem Processo! ' + s);
     except
      on e:exception do
      begin
        i := 0;
        //mmLog.Lines.Add('ID: Erro' + e.message);
      end;
     end;

     //mmLog.Lines.Add('Inserindo...');
     try
       tbInterface.Insert;
       tbInterfaceDT_INTERFACE.AsDateTime := dm.GetDateTime;
       tbInterfaceCD_MAQUINA.AsString := 'ABACUS';
       tbInterfaceDS_INTERFACE.AsString := lst.text;
       tbInterfaceCD_ID.AsInteger := i;
       tbInterfaceNM_PACIENTE.AsString := qyProcessoNM_PACIENTE.AsString;
       tbInterfaceNR_PROCESSO.AsString := qyProcessoNR_PROCESSO.AsString;
       tbInterface.Post;
       //mmLog.Lines.Add('Post');
       GeraPdf;
       dm.Commit(tbInterface);
       //mmLog.Lines.Add('Commit');
     except
       on e:exception do
       begin
          tbInterface.Cancel;
          //mmLog.Lines.Add('Cancelando:' + e.Message);
       end;
     end;
   finally
     lst.Free;
   end;
end;

procedure TfrmInterfaceAbacus.FormCreate(Sender: TObject);
begin
   sArquivo := ExtractFilePath(Application.ExeName) + 'Temp\ABACUS.pdf';
   tbInterface.Open;
end;

procedure TfrmInterfaceAbacus.tbInterfaceAfterScroll(DataSet: TDataSet);
begin
  if not(tbInterface.State in [dsEdit,dsInsert]) then
    GeraPDF;
end;

procedure TfrmInterfaceAbacus.btConfirmarClick(Sender: TObject);
var ms : TMemoryStream;  sAux:string;
    nGrupo: Integer; bArq:Boolean;
begin
    nGrupo := ValorParametro(nParGrupoExames);

    if (tbInterfaceNM_PACIENTE.AsString = '') then
    begin
       ShowMessage('Exame sem Utente. Verificar agenda do mesmo!');
       Abort;
    end;

    if (tbInterfaceNR_PROCESSO.AsString = '') then
    begin
       ShowMessage('Utente sem processo!'+chr(13)+'Este exame será impresso!');
       Imprimir;
    end;

    dmDIG.tbDig_Arquivo.Open;
    dmDIG.tbArquivo_Exame.Open;
    ms := TMemoryStream.Create;
    try
      ms.LoadFromFile(sArquivo);

      dmDIG.tbDig_Arquivo.Insert;
      dmDIG.tbDig_ArquivoBL_ARQUIVO.LoadFromStream(ms);
      dmDIG.tbDig_Arquivo.Post;

      if (tbInterfaceNR_PROCESSO.AsString <> '') then
      begin
        dmDIG.tbArquivo_Digital.Close;
        dmDIG.tbArquivo_Digital.ParamByName('NR_PROCESSO').AsString :=
          tbInterfaceNR_PROCESSO.AsString;
        dmDIG.tbArquivo_Digital.Open;

        dmDIG.tbArquivo_Digital.Insert;
        dmDIG.tbArquivo_DigitalNR_PROCESSO.AsString := tbInterfaceNR_PROCESSO.AsString;
        dmDIG.tbArquivo_DigitalCD_ARQUIVO.AsInteger :=
          dmDIG.tbDig_ArquivoCD_ARQUIVO.AsInteger;
        dmDIG.tbArquivo_DigitalCD_GRUPO.AsInteger := nGrupo;
        dmDIG.tbArquivo_DigitalTP_ARQUIVO.AsInteger := 3; //PDF Imp
        dmDIG.tbArquivo_Digital.Post;
      end
      else
      begin
        dmDIG.tbArquivo_Exame.Insert;
        dmDIG.tbArquivo_ExameCD_AGENDA.AsString := tbInterfaceCD_AGENDA.AsString;
        dmDIG.tbArquivo_ExameCD_ARQUIVO.AsInteger :=
          dmDIG.tbDig_ArquivoCD_ARQUIVO.AsInteger;
        dmDIG.tbArquivo_Exame.Post;
      end;

      tbInterface.Edit;
      tbInterfaceFL_CONFIRMADO.AsString := cvSim;
      tbInterface.Post;
      dmDIG.Commit(dmDIG.tbDig_Arquivo);
      pdf.Clear;
      tbInterface.Close; tbInterface.Open;
      lbSatus.Caption := '';

    finally
      ms.Free;
      dmDIG.tbDig_Arquivo.Close;
      dmDIG.tbArquivo_Exame.Close;
    end;
end;

procedure TfrmInterfaceAbacus.tbInterfaceAfterInsert(DataSet: TDataSet);
begin
  tbInterfaceFL_CONFIRMADO.AsString := cvNao;
end;

procedure TfrmInterfaceAbacus.FormDestroy(Sender: TObject);
begin
  tbInterface.Close;
end;

procedure TfrmInterfaceAbacus.btExcluirClick(Sender: TObject);
begin
  if Application.MessageBox('Deseja Excluir este registro?','Excluir', MB_YESNO+MB_ICONQUESTION) = IDYES then
  begin
    if frmSenha.ShowModal = mrOK then
    begin
      tbInterface.Delete;
      dm.Commit(tbInterface);
    end;
  end;
end;

procedure TfrmInterfaceAbacus.btRefazerClick(Sender: TObject);
begin
   if lbSatus.Caption = 'Refazer' then
      lbSatus.Caption := ''
   else
      lbSatus.Caption := 'Refazer';

   GeraPDF;
end;

procedure TfrmInterfaceAbacus.Timer1Timer(Sender: TObject);
begin
  Timer1.Enabled := false;
  LerArquivos;
  Timer1.Enabled := true;
end;

procedure TfrmInterfaceAbacus.LerArquivos;
var i:integer; sDir,sDirBk,sFile,sFilePara:string;
begin
  lstArquivos.Directory := 'c:\compware';
  sDir := 'C:\Compware\abacus';
  sDirBk := 'C:\Compware\abacus\Bk';
  lstArquivos.Directory := sDir;
  lstArquivos.Refresh;
  for i:=0 to lstArquivos.Count-1 do
  begin
     sFile := lstArquivos.Directory + '\' + lstArquivos.Items[i];
     if Insere(sFile) then
     begin
       if DirectoryExists(sDirBk) then
          MkDir(sDirBk);
       sFilePara := sDirBk + '\' + lstArquivos.Items[i];
       MoveFile(pChar(sFile),pChar(sFilePara));
       GeraPDF;
     end;
  end;
end;

end.
