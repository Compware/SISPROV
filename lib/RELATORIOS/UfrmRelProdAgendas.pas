unit UfrmRelProdAgendas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UfrmRelPadFast, frxExportImage, frxExportRTF, frxExportHTML,
  frxExportPDF, frxClass, frxExportXLS, frxDBSet, DB, IBCustomDataSet,
  IBQuery, StdCtrls, Buttons, ExtCtrls, ComCtrls, Mask, ToolEdit, dxExEdtr,
  dxDBGrid, dxTL, dxDBCtrl, dxCntner, dxDBTLCl, dxGrClms;

type
  TfrmRelProdAgendas = class(TfrmRelPadFast)
    pgFiltro: TTabSheet;
    Label2: TLabel;
    GroupBox1: TGroupBox;
    edDataInicio: TDateEdit;
    edDataFinal: TDateEdit;
    Label3: TLabel;
    Label4: TLabel;
    btGerarRelatorio: TBitBtn;
    pgRelatorio: TTabSheet;
    dsRelatorio: TDataSource;
    lblPeriodo: TLabel;
    dxDBGrid1: TdxDBGrid;
    qyGeralNM_MEDICO: TIBStringField;
    qyGeralMAPAS_VINCULADOS: TIBStringField;
    qyGeralAGENDADOS: TIntegerField;
    qyGeralNAO_CONFIRMADOS: TIntegerField;
    qyGeralREALIZADO: TLargeintField;
    dxDBGrid1NM_MEDICO: TdxDBGridMaskColumn;
    dxDBGrid1MAPAS_VINCULADOS: TdxDBGridMaskColumn;
    dxDBGrid1AGENDADOS: TdxDBGridMaskColumn;
    dxDBGrid1NAO_CONFIRMADOS: TdxDBGridMaskColumn;
    dxDBGrid1REALIZADO: TdxDBGridColumn;
    frxDBUnidade: TfrxDBDataset;
    qyUnidade: TIBQuery;
    qyUnidadeDS_UNIDADE: TIBStringField;
    dsUnidade: TDataSource;
    procedure btGerarRelatorioClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btImprimirClick(Sender: TObject);
    procedure edDataFinalKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
    procedure validaFiltro;
    procedure gerarRelatorio;
  public
    { Public declarations }
  end;

var
  frmRelProdAgendas: TfrmRelProdAgendas;


implementation

uses UGeral;

{$R *.dfm}

procedure TfrmRelProdAgendas.btGerarRelatorioClick(Sender: TObject);
begin
  inherited;
{  validaFiltro;
  gerarRelatorio;

  pgRelatorio.TabVisible := True;
  pgFiltro.TabVisible := False;
  btImprimir.Visible := True; }
end;

procedure TfrmRelProdAgendas.validaFiltro;
begin
  if edDataInicio.Text = '  /  /    ' then
  begin
    ShowMessage('Digite a data de início!');
    Abort;
  end;

  if edDataFinal.Text = '  /  /    ' then
  begin
    ShowMessage('Digite a data final!');
    Abort;
  end;

  if edDataInicio.Date > edDataFinal.Date then
  begin
    ShowMessage('A data final deve ser maior que a data início!');
    Abort;
  end;
end;

procedure TfrmRelProdAgendas.FormCreate(Sender: TObject);
begin
  inherited;
  pgFiltros.ActivePage := pgFiltro;
  pgRelatorio.TabVisible := False;
  edDataInicio.Date := IncMonth(Now, -1);
  edDataFinal.Date := Now;
end;

procedure TfrmRelProdAgendas.btImprimirClick(Sender: TObject);
begin
  inherited;
  validaFiltro;
  gerarRelatorio;
  
  frxReport1.LoadFromFile(sPathLayOut + '\RelProdAgendas.fr3');
  TfrxMemoView(frxReport1.FindObject('MemoPeriodo')).Text  := 'Peíodo de '+edDataInicio.Text + ' até '+ edDataFinal.Text;
  frxReport1.ShowReport;
end;

procedure TfrmRelProdAgendas.edDataFinalKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if Key=#13 then
  begin
     btImprimir.Click;
  end;
end;

procedure TfrmRelProdAgendas.gerarRelatorio;
begin
 //lblPeriodo.Caption := 'Período: ' + edDataInicio.Text + ' até ' + edDataFinal.Text;
  qyGeral.Close;
  qyUnidade.Close;

  qyGeral.ParamByName('data_inicio').AsDateTime := edDataInicio.Date;
  qyGeral.ParamByName('data_fim').AsDateTime := edDataFinal.Date;
  qyUnidade.ParamByName('prmUnidade').AsString := prmUnidade;

  qyGeral.Open;
  qyUnidade.Open;
end;

end.
