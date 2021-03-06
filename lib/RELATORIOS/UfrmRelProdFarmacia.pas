unit UfrmRelProdFarmacia;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UfrmRelPadFast, frxExportImage, frxExportRTF, frxExportHTML,
  frxExportPDF, frxClass, frxExportXLS, frxDBSet, DB, IBCustomDataSet,
  IBQuery, StdCtrls, Buttons, ExtCtrls, ComCtrls, Mask, ToolEdit, DBCtrls,
  dxExEdtr, dxCntner, dxTL, dxDBCtrl, dxDBGrid, dxDBTLCl, dxGrClms;

type
  TfrmRelProdFarmacia = class(TfrmRelPadFast)
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
    qyGeralN_PACIENTES: TIntegerField;
    DBText1: TDBText;
    Label5: TLabel;
    Label6: TLabel;
    DBText2: TDBText;
    dxDBGrid1: TdxDBGrid;
    qyNaoRetiraramMedicacao: TIBQuery;
    qyNaoRetiraramMedicacaoN_NAO_RETIRARAM: TIntegerField;
    dsNaoRetiraramMedicacao: TDataSource;
    Label7: TLabel;
    qyEsquemas: TIBQuery;
    dsEsquemas: TDataSource;
    qyEsquemasVL_ESQUEMA: TIBStringField;
    dxDBGrid1VL_ESQUEMA: TdxDBGridMaskColumn;
    dxDBGrid1Total_Dispensado: TdxDBGridMaskColumn;
    qyEsquemasTOTAL: TIBBCDField;
    frxDBNaoRetiraramMedicacao: TfrxDBDataset;
    frxDBEsquemas: TfrxDBDataset;
    qyUnidade: TIBQuery;
    qyUnidadeDS_UNIDADE: TIBStringField;
    dsUnidade: TDataSource;
    frxDBUnidade: TfrxDBDataset;
    procedure btGerarRelatorioClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btImprimirClick(Sender: TObject);
    procedure edDataFinalKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
    procedure validaFiltro;
    procedure geraRelatorio;
  public
    { Public declarations }
  end;

var
  frmRelProdFarmacia: TfrmRelProdFarmacia;


implementation

uses UGeral;

{$R *.dfm}

procedure TfrmRelProdFarmacia.btGerarRelatorioClick(Sender: TObject);
begin
  inherited;
{  validaFiltro;
  geraRelatorio;

  pgRelatorio.TabVisible := True;
  pgFiltro.TabVisible := False;
  btImprimir.Visible := True;  }
end;

procedure TfrmRelProdFarmacia.validaFiltro;
begin
  if edDataInicio.Text = '  /  /    ' then
  begin
    ShowMessage('Digite a data de in�cio!');
    Abort;
  end;

  if edDataFinal.Text = '  /  /    ' then
  begin
    ShowMessage('Digite a data final!');
    Abort;
  end;

  if edDataInicio.Date > edDataFinal.Date then
  begin
    ShowMessage('A data final deve ser maior que a data in�cio!');
    Abort;
  end;
end;

procedure TfrmRelProdFarmacia.FormCreate(Sender: TObject);
begin
  inherited;
  pgFiltros.ActivePage := pgFiltro;
  pgRelatorio.TabVisible := False;
  edDataInicio.Date := IncMonth(Now, -1);
  edDataFinal.Date := Now;
end;

procedure TfrmRelProdFarmacia.btImprimirClick(Sender: TObject);
begin
  inherited;
  validaFiltro;
  geraRelatorio;
  
  frxReport1.LoadFromFile(sPathLayOut + '\RelProdFarmacia.fr3');
  TfrxMemoView(frxReport1.FindObject('MemoPeriodo')).Text  := 'Pe�odo de '+edDataInicio.Text + ' at� '+ edDataFinal.Text;
  frxReport1.ShowReport;
end;

procedure TfrmRelProdFarmacia.geraRelatorio;
begin
 // lblPeriodo.Caption := 'Per�odo: ' + edDataInicio.Text + ' at� ' + edDataFinal.Text;
  qyGeral.Close;
  qyNaoRetiraramMedicacao.Close;
  qyEsquemas.Close;
  qyUnidade.Close;

  qyGeral.ParamByName('data_inicio').AsDateTime := edDataInicio.Date;
  qyGeral.ParamByName('data_fim').AsDateTime := edDataFinal.Date;
  qyNaoRetiraramMedicacao.ParamByName('data_inicio').AsDateTime := edDataInicio.Date;
  qyNaoRetiraramMedicacao.ParamByName('data_fim').AsDateTime := edDataFinal.Date;
  qyEsquemas.ParamByName('data_inicio').AsDateTime := edDataInicio.Date;
  qyEsquemas.ParamByName('data_fim').AsDateTime := edDataFinal.Date;
  qyUnidade.ParamByName('prmUnidade').AsString := prmUnidade;

  qyGeral.Open;
  qyNaoRetiraramMedicacao.Open;
  qyEsquemas.Open;
  qyUnidade.Open;
end;

procedure TfrmRelProdFarmacia.edDataFinalKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if Key=#13 then
  begin
     btImprimir.Click;
  end;
end;

end.
