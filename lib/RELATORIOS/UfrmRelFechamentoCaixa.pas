unit UfrmRelFechamentoCaixa;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UfrmRelPad, ComCtrls, DB, IBCustomDataSet, IBQuery, StdCtrls,
  Buttons, ExtCtrls, RpRave, RpBase, RpSystem, RpDefine, RpCon, RpConDS,
  dxCntner, dxEditor, dxExEdtr, dxEdLib, Grids, DBGrids, dxDBEdtr, dxDBELib;

type
  TfrmRelFechamentoCaixa = class(TfrmRelPad)
    RvDtCnFechamento: TRvDataSetConnection;
    RvSysFechamento: TRvSystem;
    RvPrjFechamento: TRvProject;
    qyVenda: TIBQuery;
    qyVendaCD_VENDA: TIntegerField;
    qyVendaCD_PESSOA: TIntegerField;
    qyVendaNR_VENDA: TIBStringField;
    qyVendaDT_VENDA: TDateTimeField;
    qyVendaCD_OPERACAO: TIntegerField;
    qyVendaCD_INDEXADOR: TIntegerField;
    qyVendaQT_PRODUTO_VENDA: TIntegerField;
    qyVendaVL_TOTAL_BRUTO: TIBBCDField;
    qyVendaVL_TOTAL_LIQUIDO: TIBBCDField;
    qyVendaVL_DESCONTO: TIBBCDField;
    qyVendaVL_ACRESCIMO: TIBBCDField;
    qyVendaVL_PAGO: TIBBCDField;
    qyVendaVL_TROCO: TIBBCDField;
    qyVendaNM_CLIENTE: TIBStringField;
    qyVendaCD_CLIENTE: TIntegerField;
    qyVendaDATA_HORA: TDateTimeField;
    qyVendaDS_TERMINAL: TIBStringField;
    qyVendaNM_OPERADOR: TIBStringField;
    qyVendaCD_CONFERENCIA: TIntegerField;
    qyVendaTP_DINHEIRO: TIBStringField;
    qyVendaDS_DINHEIRO: TIBStringField;
    qyVendaTP_CARTAO: TIBStringField;
    qyVendaDS_CARTAO: TIBStringField;
    qyVendaTP_OUTROS: TIBStringField;
    qyVendaDS_OUTROS: TIBStringField;
    qyVendaVL_DINHEIRO: TIBBCDField;
    qyVendaVL_CARTAO: TIBBCDField;
    qyVendaVL_OUTROS: TIBBCDField;
    qyVendaDS_OBS: TIBStringField;
    qyVendaProduto: TIBQuery;
    qyVendaProdutoCD_PRODUTO_VENDA: TIntegerField;
    qyVendaProdutoCD_VENDA: TIntegerField;
    qyVendaProdutoCD_PRODUTO: TIntegerField;
    qyVendaProdutoDS_PRODUTO: TIBStringField;
    qyVendaProdutoVL_PRODUTO: TIBBCDField;
    qyVendaProdutoQT_PRODUTO: TIntegerField;
    qyVendaProdutoVL_DESCONTO: TIBBCDField;
    qyVendaProdutoVL_ACRESCIMO: TIBBCDField;
    qyVendaProdutoVL_TOTAL_BRUTO: TIBBCDField;
    qyVendaProdutoCD_INDEXADOR: TIntegerField;
    qyVendaProdutoCD_CONFERENCIA: TIntegerField;
    qyVendaProdutoNR_SERIE: TIBStringField;
    RvDtCnProduto: TRvDataSetConnection;
    RvDtCnVenda: TRvDataSetConnection;
    dsConferencia: TDataSource;
    qyGeralCD_CONFERENCIA: TIntegerField;
    qyGeralCD_TERMINAL: TIntegerField;
    qyGeralDS_TERMINAL: TIBStringField;
    qyGeralDT_ABERTURA: TDateField;
    qyGeralHR_ABERTURA: TTimeField;
    qyGeralCD_OPERADOR_A: TIntegerField;
    qyGeralDS_OPERADOR_A: TIBStringField;
    qyGeralVL_ABERTURA: TIBBCDField;
    qyGeralCD_OPERADOR_F: TIntegerField;
    qyGeralDS_OPERADOR_F: TIBStringField;
    qyGeralVL_FECHAMENTO: TIBBCDField;
    qyGeralDT_FECHAMENTO: TDateField;
    qyGeralHR_FECHAMENTO: TTimeField;
    qyGeralST_STATUS: TIBStringField;
    qyGeralDS_OBS_SANGRIA: TIBStringField;
    qyGeralDS_OBS_SUPRIMENTO: TIBStringField;
    qyGeralVL_SANGRIA: TIBBCDField;
    qyGeralVL_SUPRIMENTO: TIBBCDField;
    eddata: TdxDateEdit;
    TabSheet1: TTabSheet;
    Label2: TLabel;
    RvDtCnABCFechamentoCaixaConfRel: TRvDataSetConnection;
    dsVenda: TDataSource;
    dsTerminal: TDataSource;
    edTerminal: TdxLookupEdit;
    Label3: TLabel;
    ckTodos: TCheckBox;
    RvDtCnFechamentoSuprimento: TRvDataSetConnection;
    RvDtCnFechamentoSangria: TRvDataSetConnection;
    qySangria: TIBQuery;
    qySuprimento: TIBQuery;
    qySangriaCD_CONFERENCIA: TIntegerField;
    qySangriaCD_SANGRIA: TIntegerField;
    qySangriaTP_SANGRIA: TIBStringField;
    qySangriaDS_SANGRIA: TIBStringField;
    qySangriaVL_SANGRIA: TIBBCDField;
    qySangriaCD_EMPRESA: TIntegerField;
    qySuprimentoCD_CONFERENCIA: TIntegerField;
    qySuprimentoCD_SUPRIMENTO: TIntegerField;
    qySuprimentoTP_SUPRIMENTO: TIBStringField;
    qySuprimentoDS_SUPRIMENTO: TIBStringField;
    qySuprimentoVL_SUPRIMENTO: TIBBCDField;
    qySuprimentoCD_EMPRESA: TIntegerField;
    procedure qyGeralBeforeOpen(DataSet: TDataSet);
    procedure btImprimirClick(Sender: TObject);
    procedure eddataExit(Sender: TObject);
    procedure RvPrjFechamentoCreate(Sender: TObject);
    procedure eddataKeyPress(Sender: TObject; var Key: Char);
    procedure qyGeralAfterScroll(DataSet: TDataSet);
    procedure qyVendaAfterScroll(DataSet: TDataSet);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRelFechamentoCaixa: TfrmRelFechamentoCaixa;

implementation

uses
  Ugeral, UDMGERAL, UDM, UDMRelatorios;

{$R *.dfm}

procedure TfrmRelFechamentoCaixa.qyGeralBeforeOpen(DataSet: TDataSet);
begin
  inherited;
  qyGeral.ParamByName('DATA').AsDate := edData.Date;

  if ckTodos.Checked then
    qyGeral.Sql[2] := ''
  else
    qyGeral.Sql[2] := 'and cd_terminal = ' + intToStr(edTerminal.LookupKeyValue);
end;

procedure TfrmRelFechamentoCaixa.btImprimirClick(Sender: TObject);
begin
  inherited;
  if eddata.Text <> '' then
  begin
    qyGeral.Open;
    qySangria.Open;
    qySuprimento.Open;
    RvPrjFechamento.Execute;
    qySangria.Close;
    qySuprimento.Close;
    qyGeral.close;
    qyVenda.close;
    qyVendaProduto.close;
  end
  else
  begin
    MessageDlg('Data inválido! Favor inserir novamente!',mtInformation,
     [mbOK],0);
    eddata.setfocus;
  end;

end;

procedure TfrmRelFechamentoCaixa.eddataExit(Sender: TObject);
begin
  inherited;
  btImprimir.SetFocus;
end;

procedure TfrmRelFechamentoCaixa.RvPrjFechamentoCreate(Sender: TObject);
begin
  inherited;
  RvPrjFechamento.ProjectFile := sPathLayout +'\RelFechamentoCaixa.rav';
end;

procedure TfrmRelFechamentoCaixa.eddataKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if Key=#13 then
  begin
     keybd_event(9,0,0,0);
  end;

end;

procedure TfrmRelFechamentoCaixa.qyGeralAfterScroll(DataSet: TDataSet);
begin
  inherited;
  qyVenda.Close;
  qyVenda.ParamByName('CD_CONFERENCIA').AsInteger := qyGeralCD_CONFERENCIA.AsInteger;
  qyVenda.Open;
end;

procedure TfrmRelFechamentoCaixa.qyVendaAfterScroll(DataSet: TDataSet);
begin
  inherited;
  qyVendaProduto.Close;
  qyVendaProduto.ParamByName('CD_CONFERENCIA').AsInteger := qyVendaCD_CONFERENCIA.AsInteger;
  qyVendaProduto.ParamByName('CD_VENDA').AsInteger := qyVendaCD_VENDA.AsInteger;
  qyVendaProduto.Open;
end;

procedure TfrmRelFechamentoCaixa.FormCreate(Sender: TObject);
begin
  inherited;
  dmGeral.TB_TERMINAL.Open;
end;

procedure TfrmRelFechamentoCaixa.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  dmGeral.TB_TERMINAL.Close;
end;

end.
