unit ufrmInterfaceKX21;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, PReport, PdfDoc, ExtCtrls, StdCtrls, uspViewPDF, CPort, Buttons,
  Grids, ValEdit, ShellAPI, dxExEdtr, dxTL, dxDBCtrl, dxDBGrid, DB,
  dxCntner, IBCustomDataSet, IBQuery, FileCtrl;

type
  TfrmInterfaceKX21 = class(TForm)
    PReport1: TPReport;
    Panel1: TPanel;
    Panel3: TPanel;
    PRPage1: TPRPage;
    PRLayoutPanel1: TPRLayoutPanel;
    PRImage1: TPRImage;
    PRLabel1: TPRLabel;
    PRLabel2: TPRLabel;
    PRLabel3: TPRLabel;
    PRLabel4: TPRLabel;
    PRLabel5: TPRLabel;
    PRLabel6: TPRLabel;
    PRLabel7: TPRLabel;
    PRLabel8: TPRLabel;
    PRLabel9: TPRLabel;
    PRLabel10: TPRLabel;
    PRLabel11: TPRLabel;
    PRLabel12: TPRLabel;
    PRLabel13: TPRLabel;
    PRLabel14: TPRLabel;
    PRLabel15: TPRLabel;
    PRLabel16: TPRLabel;
    PRLabel17: TPRLabel;
    PRLabel18: TPRLabel;
    PRLabel19: TPRLabel;
    PRLabel20: TPRLabel;
    PRLabel21: TPRLabel;
    PRLabel22: TPRLabel;
    PRLabel23: TPRLabel;
    PRLabel24: TPRLabel;
    PRLabel25: TPRLabel;
    PRLabel26: TPRLabel;
    lbNumero: TPRLabel;
    lbData: TPRLabel;
    lbNome: TPRLabel;
    lbWBC: TPRLabel;
    lbRBC: TPRLabel;
    lbHGB: TPRLabel;
    lbHCT: TPRLabel;
    lbMCV: TPRLabel;
    lbMCH: TPRLabel;
    lbMCHC: TPRLabel;
    lbPLT: TPRLabel;
    lbLVM: TPRLabel;
    lbMXD: TPRLabel;
    lbNEUT: TPRLabel;
    lbLVM2: TPRLabel;
    lbMXD2: TPRLabel;
    lbNEUT2: TPRLabel;
    lbRDW_CV: TPRLabel;
    lbRDW_SD: TPRLabel;
    lbMPV: TPRLabel;
    lbPDW: TPRLabel;
    PRLabel27: TPRLabel;
    lbP_LCR: TPRLabel;
    PRLabel28: TPRLabel;
    PDF: TspViewPDF;
    Panel2: TPanel;
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
    btExcluir: TBitBtn;
    qyProcesso: TIBQuery;
    qyProcessoNM_PACIENTE: TIBStringField;
    qyProcessoNR_PROCESSO: TIntegerField;
    qyProcessoCD_AGENDA: TIntegerField;
    lbSatus: TPRLabel;
    btRefazer: TButton;
    lstArquivos: TFileListBox;
    Timer1: TTimer;
    procedure btImprimirClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btConfirmarClick(Sender: TObject);
    procedure tbInterfaceAfterInsert(DataSet: TDataSet);
    procedure tbInterfaceAfterScroll(DataSet: TDataSet);
    procedure btExcluirClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
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
  frmInterfaceKX21: TfrmInterfaceKX21;
  sArquivo:string;


implementation

uses UDMDIG, UDM, UGeral, ufrmSenha;

{$R *.dfm}

procedure TfrmInterfaceKX21.GeraPDF;
var str:string;
  procedure Monta;
  begin
//D1U2013021300000000000807560000000004300429001230037500874002870032800241006341012300243200270000500011004730013600133001050030
//D1U2013021400000000000809191600000011000346000860028100812202492030620303003740*0000*000000410*0000*00000445001470012200098002450
     lbNome.Caption := tbInterfaceNM_PACIENTE.AsString;
     lbProcesso.Caption := tbInterfaceNR_PROCESSO.AsString;

     lbData.Caption := Copy(str,11,2)+'/'+
                       Copy(str,09,2)+'/'+
                       Copy(str,5,4);

     lbNumero.Caption := Copy(str,14,15);
     lbWBC.Caption := Copy(str,36,3)+'.'+
                      Copy(str,39,2)+'x10³/µL';
     lbRBC.Caption := Copy(str,41,2)+'.'+
                      Copy(str,43,3)+'x10³/µL';
     lbHGB.Caption := Copy(str,46,3)+'.'+
                      Copy(str,49,2)+'g/dL';
     lbHCT.Caption := Copy(str,51,3)+'.'+
                      Copy(str,54,2)+'%';
     lbMCV.Caption := Copy(str,56,3)+'.'+
                      Copy(str,59,2)+'fl';
     lbMCH.Caption := Copy(str,61,3)+'.'+
                      Copy(str,64,2)+'pg';
     lbMCHC.Caption := Copy(str,66,3)+'.'+
                      Copy(str,69,2)+'g/dl';
     lbPLT.Caption := Copy(str,71,5)+'x10³/µL';

     lbLVM.Caption := Copy(str,76,3)+'.'+
                      Copy(str,79,2)+'%';
     lbMXD.Caption := Copy(str,81,3)+'.'+
                      Copy(str,84,2)+'%';
     lbNEUT.Caption := Copy(str,86,3)+'.'+
                      Copy(str,89,2)+'%';

     lbLVM2.Caption := Copy(str,91,3)+'.'+
                      Copy(str,94,2)+'x10³/µL';
     lbMXD2.Caption := Copy(str,96,3)+'.'+
                      Copy(str,99,2)+'x10³/µL';
     lbNEUT2.Caption := Copy(str,101,3)+'.'+
                      Copy(str,104,2)+'x10³/µL';

     lbRDW_SD.Caption := Copy(str,106,3)+'.'+
                      Copy(str,109,2)+'fl';
     lbRDW_CV.Caption := Copy(str,111,3)+'.'+
                      Copy(str,114,2)+'%';
     lbPDW.Caption := Copy(str,116,3)+'.'+
                      Copy(str,119,2)+'fl';
     lbMPV.Caption := Copy(str,121,3)+'.'+
                      Copy(str,124,2)+'fl';
     lbP_LCR.Caption := Copy(str,126,3)+'.'+
                      Copy(str,129,2)+'%';
  end;

begin
  str := tbInterfaceDS_INTERFACE.AsString;
  Monta;
  PDF.Clear;
  PReport1.FileName := sArquivo;
  PReport1.BeginDoc;
  PReport1.Print(PRPage1);
  PReport1.EndDoc;
  PDF.LoadFromFile(sArquivo);
end;

procedure TfrmInterfaceKX21.btImprimirClick(Sender: TObject);
begin
  Imprimir;
end;

function TfrmInterfaceKX21.Imprimir: boolean;
begin
  ShellExecute(0, 'open', 'acrord32', PChar('/p /h ' + sArquivo), nil, SW_HIDE);
end;

function TfrmInterfaceKX21.Insere(str: String): boolean;
var i:integer; s:string; lst:TStringList;
begin

   lst := TStringList.Create;
   try
     lst.LoadFromFile(str);
     s := lst.Text;
     s := Copy(s,14,15);
     try
      i := strToInt(s);
      qyProcesso.Close;
      qyProcesso.ParamByName('ID').AsInteger := i;
      qyProcesso.Open;
     except
      i := 0;
     end;

     try
       tbInterface.Insert;
       tbInterfaceDT_INTERFACE.AsDateTime := dm.GetDateTime;
       tbInterfaceCD_MAQUINA.AsString := 'KX21N';
       tbInterfaceDS_INTERFACE.AsString := lst.Text;
       tbInterfaceCD_ID.AsInteger := i;
       tbInterfaceNM_PACIENTE.AsString := qyProcessoNM_PACIENTE.AsString;
       tbInterfaceNR_PROCESSO.AsString := qyProcessoNR_PROCESSO.AsString;
       tbInterface.Post;
       dm.Commit(tbInterface);
       result := true;
     except
       tbInterface.Cancel;
       result := false;
     end;

   finally
     lst.Free;
   end;
end;

procedure TfrmInterfaceKX21.FormCreate(Sender: TObject);
begin
   sArquivo := ExtractFilePath(Application.ExeName) + 'Temp\KX21N.pdf';
   tbInterface.Open;
end;

procedure TfrmInterfaceKX21.tbInterfaceAfterScroll(DataSet: TDataSet);
begin
  if not(tbInterface.State in [dsEdit,dsInsert]) then
    GeraPDF;
end;

procedure TfrmInterfaceKX21.btConfirmarClick(Sender: TObject);
var ms : TMemoryStream;
    nGrupo: Integer;
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

procedure TfrmInterfaceKX21.tbInterfaceAfterInsert(DataSet: TDataSet);
begin
  tbInterfaceFL_CONFIRMADO.AsString := cvNao;
end;

procedure TfrmInterfaceKX21.btExcluirClick(Sender: TObject);
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

procedure TfrmInterfaceKX21.FormDestroy(Sender: TObject);
begin
  tbInterface.Close;
end;

procedure TfrmInterfaceKX21.btRefazerClick(Sender: TObject);
begin
   if lbSatus.Caption = 'Refazer' then
      lbSatus.Caption := ''
   else
      lbSatus.Caption := 'Refazer';

   GeraPDF;
end;

procedure TfrmInterfaceKX21.Timer1Timer(Sender: TObject);
begin
  Timer1.Enabled := false;
  LerArquivos;
  Timer1.Enabled := true;
end;

procedure TfrmInterfaceKX21.LerArquivos;
var i:integer; sDir,sDirBk,sFile,sFilePara:string;
begin
  lstArquivos.Directory := 'c:\compware';
  sDir := 'C:\Compware\Kx21';
  sDirBk := 'C:\Compware\Kx21\Bk';
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
