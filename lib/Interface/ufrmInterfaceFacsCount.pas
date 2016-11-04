unit ufrmInterfaceFacsCount;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, PReport, PdfDoc, ExtCtrls, StdCtrls, uspViewPDF, CPort, Buttons,
  Grids, ValEdit, ShellAPI, dxExEdtr, dxTL, dxDBCtrl, dxDBGrid, DB,
  dxCntner, IBCustomDataSet, IBQuery, FileCtrl;

type
  TfrmInterfaceFacsCount = class(TForm)
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
    procedure CadastroCD4(str:String);
  end;

var
  frmInterfaceFacsCount: TfrmInterfaceFacsCount;
  sIN, sArquivo:string;
  bInicio, bFim:boolean;

implementation

uses UDMDIG, UDM, UGeral, ufrmCadCD4, UDMGERAL;

{$R *.dfm}

procedure TfrmInterfaceFacsCount.GeraPDF;
var str:string;
  procedure Monta;
  var i:integer;
  begin
     lbNome.Caption := tbInterfaceNM_PACIENTE.AsString;
     lbProcesso.Caption := tbInterfaceNR_PROCESSO.AsString;
     txInterface.Lines.Text := str;
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

procedure TfrmInterfaceFacsCount.btImprimirClick(Sender: TObject);
begin
  Imprimir;
end;

function TfrmInterfaceFacsCount.Imprimir: boolean;
begin
  ShellExecute(0, 'open', 'acrord32', PChar('/p /h ' + sArquivo), nil, SW_HIDE);
end;

function TfrmInterfaceFacsCount.Insere(str: String): boolean;
var i:integer; s:string; lst:TStringList;
begin

   lst := TStringList.Create;
   try
     lst.LoadFromFile(str);
     s := lst.Strings[1];
     s := Copy(s,14,Length(s)-13);
     try
      i := strToInt(s);
      qyProcesso.Close;
      qyProcesso.ParamByName('ID').AsInteger := i;
      qyProcesso.Open;
     except
      i := 0;
     end;

     tbInterface.Insert;
     tbInterfaceDT_INTERFACE.AsDateTime := dm.GetDateTime;
     tbInterfaceCD_MAQUINA.AsString := 'FACSCOUNT';
     tbInterfaceDS_INTERFACE.AsString := lst.Text;
     tbInterfaceCD_ID.AsInteger := i;
     tbInterfaceNM_PACIENTE.AsString := qyProcessoNM_PACIENTE.AsString;
     tbInterfaceNR_PROCESSO.AsString := qyProcessoNR_PROCESSO.AsString;
     tbInterface.Post;

     dm.Commit(tbInterface);

   finally
     lst.Free;
   end;
end;

procedure TfrmInterfaceFacsCount.FormCreate(Sender: TObject);
begin
   sArquivo := ExtractFilePath(Application.ExeName) + 'Temp\FACSCOUNT.pdf';
   tbInterface.Open;
end;

procedure TfrmInterfaceFacsCount.tbInterfaceAfterScroll(DataSet: TDataSet);
begin
  GeraPDF;
end;

procedure TfrmInterfaceFacsCount.btConfirmarClick(Sender: TObject);
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

    CadastroCD4(tbInterfaceDS_INTERFACE.AsString);

    tbInterface.Edit;
    tbInterfaceFL_CONFIRMADO.AsString := cvSim;
    tbInterface.Post;
    dm.Commit(tbInterface);
    pdf.Clear;
    tbInterface.Close; tbInterface.Open;

    lbSatus.Caption := '';
{
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

    finally
      ms.Free;
      dmDIG.tbDig_Arquivo.Close;
      dmDIG.tbArquivo_Exame.Close;
    end;
}
end;

procedure TfrmInterfaceFacsCount.tbInterfaceAfterInsert(DataSet: TDataSet);
begin
  tbInterfaceFL_CONFIRMADO.AsString := cvNao;
end;

procedure TfrmInterfaceFacsCount.FormDestroy(Sender: TObject);
begin
  tbInterface.Close;
end;

procedure TfrmInterfaceFacsCount.btExcluirClick(Sender: TObject);
begin
  if Application.MessageBox('Deseja Excluir este registro?','Excluir', MB_YESNO+MB_ICONQUESTION) = IDYES then
  begin
    tbInterface.Delete;
    dm.Commit(tbInterface);
  end;
end;

procedure TfrmInterfaceFacsCount.btRefazerClick(Sender: TObject);
begin
   if lbSatus.Caption = 'Refazer' then
      lbSatus.Caption := ''
   else
      lbSatus.Caption := 'Refazer';

   GeraPDF;
end;

procedure TfrmInterfaceFacsCount.Timer1Timer(Sender: TObject);
begin
  Timer1.Enabled := false;
  LerArquivos;
  Timer1.Enabled := true;
end;

procedure TfrmInterfaceFacsCount.LerArquivos;
var i:integer; s:string;
begin
  lstArquivos.Directory := 'c:\compware';
  lstArquivos.Directory := 'C:\Compware\Facscount';
  lstArquivos.Refresh;
  for i:=0 to lstArquivos.Count-1 do
  begin
     s := lstArquivos.Directory + '\' + lstArquivos.Items[i];
     Insere(s);
     DeleteFile(s);
     GeraPDF;
  end;
end;

{
FACSCount
Accession #: 1345555
CD4 : xxxx
CD8 : xxxx
CD3 : xxxx
CD4CD8 : xxxx
Reagent Lot ID : 20212121
CD4 Tube : 1014
CD8 Tube : 2012
Control Run Date :  1/31/13  10:03
Control Lot ID   : 19061721
}
procedure TfrmInterfaceFacsCount.CadastroCD4(str: String);
var i:integer; ls:TStringList;  s:string;
begin
  ls := TStringList.Create;
  try
    ls.Text := str;
    frmCadCD4.btIncluirClick(self);
    frmCadCD4.btNumLab.Text := tbInterfaceCD_ID.AsString;
    frmCadCD4.btNumLabButtonClick(self,0);

    if not(dmGeral.TB_RESULTADO_CD4.State in [dsEdit,dsInsert]) then
      dmGeral.TB_RESULTADO_CD4.Edit;
      
    frmCadCD4.ckRefazer.Checked := (lbSatus.Caption = 'Refazer');
    dmGeral.TB_RESULTADO_CD4DT_RESULTADO.AsDateTime := dm.GetDateTime;
    try
      s := Copy(ls.Strings[2],6,4);
      i := StrToInt(s);
      frmCadCD4.edCD4.Text := s;
    except
      frmCadCD4.edCD4.Text := '';
    end;

    try
      s := Copy(ls.Strings[3],6,4);
      i := StrToInt(s);
      frmCadCD4.edCD8.Text := s;
    except
      frmCadCD4.edCD8.Text := '';
    end;

    try
      s := Copy(ls.Strings[4],6,4);
      i := StrToInt(s);
      frmCadCD4.edCD3.Text := s;
    except
      frmCadCD4.edCD3.Text := '';
    end;

    frmCadCD4.btgravarClick(self);

  finally
    ls.Free;
  end;
end;

end.
