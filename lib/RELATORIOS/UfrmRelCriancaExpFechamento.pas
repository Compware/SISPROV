unit UfrmRelCriancaExpFechamento;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, IBCustomDataSet, IBQuery, frxClass, frxDBSet, frxExportPDF,
  StdCtrls, Buttons, dxExEdtr, dxEdLib, dxCntner, dxEditor, ExtCtrls;

type
  TfrmRelCriancaExpFechamento = class(TForm)
    Panel1: TPanel;
    Image1: TImage;
    Label1: TLabel;
    Panel2: TPanel;
    btCancelar: TBitBtn;
    btImprimir: TBitBtn;
    frxPDFExport1: TfrxPDFExport;
    fxdbRelatorio: TfrxDBDataset;
    fxRelatorio: TfrxReport;
    qyRelCriancaExp: TIBQuery;
    qyRelCriancaExpCODIGO: TIntegerField;
    dsRelatorio: TDataSource;
    edNMPaciente: TdxEdit;
    Label3: TLabel;
    edNrProcessoPaciente: TdxEdit;
    Label4: TLabel;
    Label7: TLabel;
    dtNascimento: TdxDateEdit;
    dtInicioRelatorio: TdxDateEdit;
    Label8: TLabel;
    edNMMae: TdxEdit;
    Label9: TLabel;
    Label10: TLabel;
    edNrProcessoMae: TdxEdit;
    qyRelCriancaExpNR_PROCESSO_CRIANCA_EXP: TIBStringField;
    qyRelCriancaExpNM_PACIENTE: TIBStringField;
    qyRelCriancaExpTP_SEXO: TIBStringField;
    qyRelCriancaExpIDADE: TSmallintField;
    rgTipoRelatorio: TRadioGroup;
    GroupBox1: TGroupBox;
    fxdbUnidade: TfrxDBDataset;
    qyUnidade: TIBQuery;
    qyUnidadeDS_UNIDADE: TIBStringField;
    qyUnidadeDS_MUNICIPIO: TIBStringField;
    qyUnidadeDS_PROVINCIA: TIBStringField;
    dsUnidade: TDataSource;
    qyRelCriancaExpCD_DESFECHO_CRIANCA_EXP: TIntegerField;
    qyRelCriancaExpDT_INICIO_CRIANCA_EXP: TDateField;
    qyRelCriancaExpDT_FIM_CRIANCA_EXP: TDateField;
    qyRelCriancaExpNM_MAE: TIBStringField;
    qyRelCriancaExpDS_DESFECHO: TStringField;
    procedure btImprimirClick(Sender: TObject);
    procedure qyRelCriancaExpCalcFields(DataSet: TDataSet);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    procedure GerarRelatorio;
  public
    { Public declarations }
  end;

var
  frmRelCriancaExpFechamento: TfrmRelCriancaExpFechamento;
   sSQL : string;
   
implementation

uses UGeral;

{$R *.dfm}

procedure TfrmRelCriancaExpFechamento.btImprimirClick(Sender: TObject);
begin
  GerarRelatorio;
end;

procedure TfrmRelCriancaExpFechamento.GerarRelatorio;
var
  sRel: String;
  sCondicao: TStringList;
begin
  sCondicao := TStringList.Create;
  if rgTipoRelatorio.ItemIndex = 1 then
    sCondicao.Add('and P.DT_INICIO_CRIANCA_EXP <= :DT_MENOS_18_MESES and P.DT_FIM_CRIANCA_EXP is NULL');

  if edNMPaciente.Text <> '' then
    sCondicao.Add('and Upper(P.NM_PACIENTE) like :NM_PACIENTE');

  if edNrProcessoPaciente.Text <> '' then
    sCondicao.Add('and P.NR_PROCESSO_CRIANCA_EXP = :NR_PROC_CRIANCA_EXP');

  if dtNascimento.Text <> '  /  /    ' then
    sCondicao.Add('and P.DT_NASCIMENTO = :DT_NASCIMENTO');

  if edNMMae.Text <> '' then
    sCondicao.Add('and Upper(P.NM_MAE) like :NM_MAE');

  if edNrProcessoMae.Text <> '' then
    sCondicao.Add('and P2.NR_PROCESSO = :NR_PROCESSO_MAE');

  if dtInicioRelatorio.Text <> '  /  /    ' then
    sCondicao.Add('and P.DT_INICIO_CRIANCA_EXP >= :DT_INICIO');

  try
  with qyRelCriancaExp do
    begin
      Close;

      qyRelCriancaExp.SQL.Text := StringReplace(sSQL, '/*CONDICAO*/', sCondicao.Text, []);
      qyRelCriancaExp.Prepare;

      if rgTipoRelatorio.ItemIndex = 1 then
        qyRelCriancaExp.ParamByName('DT_MENOS_18_MESES').AsDate := IncMonth(NOW, -18);

      if edNMPaciente.Text <> '' then
        qyRelCriancaExp.ParamByName('NM_PACIENTE').AsString := '%' + UpperCase(edNMPaciente.Text) + '%';

      if edNrProcessoPaciente.Text <> '' then
        qyRelCriancaExp.ParamByName('NR_PROC_CRIANCA_EXP').AsString := edNrProcessoPaciente.Text;

      if dtNascimento.Text <> '  /  /    ' then
        qyRelCriancaExp.ParamByName('DT_NASCIMENTO').AsDate := dtNascimento.Date;

      if edNMMae.Text <> '' then
        qyRelCriancaExp.ParamByName('NM_MAE').AsString := '%' + UpperCase(edNMMae.Text) + '%';

      if edNrProcessoMae.Text <> '' then
        qyRelCriancaExp.ParamByName('NR_PROCESSO_MAE').AsString := edNrProcessoMae.Text;

      if dtInicioRelatorio.Text <> '  /  /    ' then
        qyRelCriancaExp.ParamByName('DT_INICIO').AsDate := dtInicioRelatorio.Date;

      Open;

      qyUnidade.Close;
      qyUnidade.ParamByName('cd_unidade').AsString := prmUnidade;
      qyUnidade.Open;

      sRel := '\RelCriancaExpFechamento.fr3';
      fxRelatorio.LoadFromFile(sPathLayOut + sRel);
      fxRelatorio.ShowReport;

      qyUnidade.Close;
      Close;
    end;
  except
    ShowMessage(qyRelCriancaExp.SQL.Text);
  end;
end;

procedure TfrmRelCriancaExpFechamento.qyRelCriancaExpCalcFields(
  DataSet: TDataSet);
begin
  qyRelCriancaExpCODIGO.AsInteger := qyRelCriancaExp.RecNo;
  Case qyRelCriancaExpCD_DESFECHO_CRIANCA_EXP.AsInteger of
    1: qyRelCriancaExpDS_DESFECHO.AsString := 'Criança infectada';
    2: qyRelCriancaExpDS_DESFECHO.AsString := 'Criança não infectada';
    3: qyRelCriancaExpDS_DESFECHO.AsString := 'Obito';
    4: qyRelCriancaExpDS_DESFECHO.AsString := 'Transferência';
    5: qyRelCriancaExpDS_DESFECHO.AsString := 'Perda de segmento';
    6: qyRelCriancaExpDS_DESFECHO.AsString := 'Em acompanhamento';
    7: qyRelCriancaExpDS_DESFECHO.AsString := 'Não sabe';
  end;
end;

procedure TfrmRelCriancaExpFechamento.FormCreate(Sender: TObject);
begin
  sSQL := qyRelCriancaExp.SQL.Text;
end;

end.
