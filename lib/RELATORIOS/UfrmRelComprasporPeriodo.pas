unit UfrmRelComprasporPeriodo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UfrmRelPad, RpRave, RpBase, RpSystem, RpDefine, RpCon, RpConDS,
  DB, IBCustomDataSet, dxCntner, dxEditor, dxExEdtr, dxEdLib, StdCtrls,
  ComCtrls, IBQuery, Buttons, ExtCtrls, dxDBEdtr, dxDBELib;

type
  TfrmRelComprasporPeriodo = class(TfrmRelPad)
    GroupBox3: TGroupBox;
    TabSheet1: TTabSheet;
    Label3: TLabel;
    Label8: TLabel;
    dtDe: TdxDateEdit;
    dtAte: TdxDateEdit;
    dsGeral: TDataSource;
    qyNFProduto: TIBQuery;
    qyNFProdutoCD_NF_PRODUTO: TIntegerField;
    qyNFProdutoCD_NF: TIntegerField;
    qyNFProdutoCD_PRODUTO: TIntegerField;
    qyNFProdutoDS_PRODUTO: TIBStringField;
    qyNFProdutoSG_UNIDADE: TIBStringField;
    qyNFProdutoVL_PRECO: TIBBCDField;
    qyNFProdutoQT_PRODUTO: TIntegerField;
    qyNFProdutoVL_TOTAL: TIBBCDField;
    qyNFProdutoVL_TOTAL_PRODUTOS: TIBBCDField;
    qyNFProdutoCD_EMPRESA: TIntegerField;
    rvDtProduto: TRvDataSetConnection;
    qyGeralCD_NF: TIntegerField;
    qyGeralDT_NF: TDateTimeField;
    qyGeralDT_REFERENCIA: TDateTimeField;
    qyGeralDS_PESSOA: TIBStringField;
    qyGeralDS_OBS: TIBStringField;
    qyGeralVL_TOTAL_BRUTO: TIBBCDField;
    qyGeralVL_TOTAL_LIQUIDO: TIBBCDField;
    qyGeralVL_DESCONTO: TIBBCDField;
    qyGeralVL_ACRESCIMO: TIBBCDField;
    qyGeralNR_NF: TIBStringField;
    qyGeralDS_OPERACAO: TIBStringField;
    qyGeralCD_OPERACAO: TIntegerField;
    qyGeralCD_EMPRESA: TIntegerField;
    qyGeralSG_STATUS: TIBStringField;
    qyGeralDT_CANCELAMENTO: TDateTimeField;
    qyGeralNM_USUARIO_CANCELAMENTO: TIBStringField;
    qyGeralDS_MOTIVO_CANCELAMENTO: TIBStringField;
    qyGeralCD_PRAZO: TIntegerField;
    qyGeralDS_PRAZO: TIBStringField;
    qyGeralCD_PESSOA: TIntegerField;
    qyGeralCD_FORMA_PAGAMENTO: TIntegerField;
    qyGeralDS_FORMA_PAGAMENTO: TIBStringField;
    qyGeralCD_NATUREZA_LANCAMENTO: TIntegerField;
    qyGeralDS_NATUREZA_LANCAMENTO: TIBStringField;
    qyGeralQT_PRODUTO_NF: TIntegerField;
    qyGeralTP_DOCUMENTO: TIBStringField;
    qyGeralDS_HISTORICO: TIBStringField;
    qyGeralCD_EMPRESA_ORIGEM: TIntegerField;
    qyGeralCD_EDI: TIntegerField;
    qyGeralNM_USUARIO: TIBStringField;
    qyGeralDT_CADASTRO: TDateTimeField;
    qyGeralTP_EDI: TIBStringField;
    qyGeralTP_OPERACAO: TIBStringField;
    qyGeralCD_ORIGEM: TIntegerField;
    qyGeralNM_ORIGEM: TIBStringField;
    qyGeralCD_DESTINO: TIntegerField;
    qyGeralNM_DESTINO: TIBStringField;
    procedure btImprimirClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRelComprasporPeriodo: TfrmRelComprasporPeriodo;
  strSQL:string;
implementation

uses
  UGERAL, UDMGERAL;

{$R *.dfm}

procedure TfrmRelComprasporPeriodo.btImprimirClick(Sender: TObject);
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
    qyGeral.Close;
    qyGeral.SQL.Text := strSQL;
    qyGeral.SQL.Add('and DT_NF between :de and :ate');
    qyGeral.ParamByName('de').AsDate := dtDe.Date;
    qyGeral.ParamByName('ate').AsDate := dtAte.Date;
    qyGeral.ParamByName('TP_OPERACAO').AsString := cvOpCompra;
    qyGeral.open;
    qyNFProduto.Open;
    rvGeral.Execute;
  finally
    qyNFProduto.Close;
    qyGeral.Close;
  end;

end;

procedure TfrmRelComprasporPeriodo.FormCreate(Sender: TObject);
begin
  inherited;
  strSQL := qyGeral.SQL.Text;
  rvGeral.ProjectFile := sPathLayout +'\RelComprasporPeriodo.rav';
end;

end.
