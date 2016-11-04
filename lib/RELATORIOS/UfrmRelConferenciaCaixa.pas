unit UfrmRelConferenciaCaixa;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UfrmRelPad, ComCtrls, RpCon, RpConDS, RpBase, RpSystem,
  RpDefine, RpRave, DB, IBCustomDataSet, IBQuery, StdCtrls, Buttons,
  ExtCtrls, dxDBEdtr, dxDBELib, dxCntner, dxEditor, dxExEdtr, dxEdLib;

type
  TfrmRelConferenciaCaixa = class(TfrmRelPad)
    TabSheet1: TTabSheet;
    GroupBox3: TGroupBox;
    Label3: TLabel;
    Label8: TLabel;
    dtDe: TdxDateEdit;
    dtAte: TdxDateEdit;
    Label2: TLabel;
    edTerminal: TdxLookupEdit;
    ckTodos: TCheckBox;
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
    qyGeralCD_EMPRESA: TIntegerField;
    qyGeralNM_USUARIO: TIBStringField;
    qyGeralDT_CADASTRO: TDateTimeField;
    dsConferencia: TDataSource;
    dsVenda: TDataSource;
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
    dsTerminal: TDataSource;
    RvDtCnProduto: TRvDataSetConnection;
    RvDtCnVenda: TRvDataSetConnection;
    RvDtConferencia: TRvDataSetConnection;
    qySangria: TIBQuery;
    qySangriaCD_CONFERENCIA: TIntegerField;
    qySangriaCD_SANGRIA: TIntegerField;
    qySangriaTP_SANGRIA: TIBStringField;
    qySangriaDS_SANGRIA: TIBStringField;
    qySangriaVL_SANGRIA: TIBBCDField;
    qySangriaCD_EMPRESA: TIntegerField;
    qySuprimento: TIBQuery;
    qySuprimentoCD_CONFERENCIA: TIntegerField;
    qySuprimentoCD_SUPRIMENTO: TIntegerField;
    qySuprimentoTP_SUPRIMENTO: TIBStringField;
    qySuprimentoDS_SUPRIMENTO: TIBStringField;
    qySuprimentoVL_SUPRIMENTO: TIBBCDField;
    qySuprimentoCD_EMPRESA: TIntegerField;
    RvDtCnConferenciaSangria: TRvDataSetConnection;
    RvDtCnConferenciaSuprimento: TRvDataSetConnection;
    procedure btImprimirClick(Sender: TObject);
    procedure qyGeralAfterScroll(DataSet: TDataSet);
    procedure qyVendaAfterScroll(DataSet: TDataSet);
    procedure qyGeralBeforeOpen(DataSet: TDataSet);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure rvGeralCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRelConferenciaCaixa: TfrmRelConferenciaCaixa;

implementation

Uses
  UGeral, UDMGERAL, UDMRelatorios;

{$R *.dfm}

procedure TfrmRelConferenciaCaixa.btImprimirClick(Sender: TObject);
begin
  inherited;

  if dtDe.Text = '  /  /    ' then
  begin
    MessageDlg('Data (Inicio) inválido! Favor inserir novamente!',mtInformation,
     [mbOK],0);
    dtde.setfocus;
    Exit;
  end;

  if dtAte.Text = '  /  /    ' then
  begin
    MessageDlg('Data (Final) inválido! Favor inserir novamente!',mtInformation,
     [mbOK],0);
    dtate.setfocus;
    Exit;
  end;

  try
    qyGeral.Open;
    qySangria.Open;
    qySuprimento.Open;
    dmRelatorios.tbTmpParametro.Open;
    dmRelatorios.tbTmpParametro.Insert;
    dmRelatorios.tbTmpParametroCD_PARAMETRO.AsInteger := 1;
    dmRelatorios.tbTmpParametroVL_PARAMETRO1.AsString := dtde.text;
    dmRelatorios.tbTmpParametroVL_PARAMETRO2.AsString := dtate.text;
    dmRelatorios.tbTmpParametro.Post;
    rvGeral.Execute;
  finally
    dmRelatorios.tbTmpParametro.Delete;
    dmRelatorios.tbTmpParametro.Close;
    qyGeral.close;
    qySangria.Close;
    qySuprimento.Close;
    qyVenda.close;
    qyVendaProduto.close;
  end;

end;

procedure TfrmRelConferenciaCaixa.qyGeralAfterScroll(DataSet: TDataSet);
begin
  inherited;
  qyVenda.Close;
  qyVenda.ParamByName('CD_CONFERENCIA').AsInteger := qyGeralCD_CONFERENCIA.AsInteger;
  qyVenda.Open;

end;

procedure TfrmRelConferenciaCaixa.qyVendaAfterScroll(DataSet: TDataSet);
begin
  inherited;
  qyVendaProduto.Close;
  qyVendaProduto.ParamByName('CD_CONFERENCIA').AsInteger := qyVendaCD_CONFERENCIA.AsInteger;
  qyVendaProduto.ParamByName('CD_VENDA').AsInteger := qyVendaCD_VENDA.AsInteger;
  qyVendaProduto.Open;

end;

procedure TfrmRelConferenciaCaixa.qyGeralBeforeOpen(DataSet: TDataSet);
begin
  inherited;

  qyGeral.ParamByName('de').AsDate := dtDe.Date;
  qyGeral.ParamByName('ate').AsDate := dtAte.Date;

  if ckTodos.Checked then
    qyGeral.Sql[2] := ''
  else
    qyGeral.Sql[2] := 'and cd_terminal = ' + intToStr(edTerminal.LookupKeyValue);

end;

procedure TfrmRelConferenciaCaixa.FormCreate(Sender: TObject);
begin
  inherited;
  dmGeral.TB_TERMINAL.Open;
end;

procedure TfrmRelConferenciaCaixa.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  dmGeral.TB_TERMINAL.Close;
end;

procedure TfrmRelConferenciaCaixa.rvGeralCreate(Sender: TObject);
begin
  inherited;
  RvGeral.ProjectFile := sPathLayout +'\RelConferenciaCaixa.rav';
end;

end.
