
unit UfrmRelComprasporFornecedor;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UfrmRelPad, RpRave, RpBase, RpSystem, RpDefine, RpCon, RpConDS,
  DB, IBCustomDataSet, ComCtrls, IBQuery, StdCtrls, Buttons, ExtCtrls,
  dxDBEdtr, dxDBELib, dxCntner, dxEditor, dxExEdtr, dxEdLib;

type
  TfrmRelComprasporFornecedor = class(TfrmRelPad)
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
    dsGeral: TDataSource;
    rvDtProduto: TRvDataSetConnection;
    GroupBox3: TGroupBox;
    TabSheet1: TTabSheet;
    Label3: TLabel;
    Label8: TLabel;
    dtde: TdxDateEdit;
    dtate: TdxDateEdit;
    GroupBox2: TGroupBox;
    Label4: TLabel;
    btFornecedor: TSpeedButton;
    btFornecedorLimpar: TSpeedButton;
    edCod: TEdit;
    edFornecedor: TEdit;
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
    procedure FormCreate(Sender: TObject);
    procedure btImprimirClick(Sender: TObject);
    procedure btFornecedorClick(Sender: TObject);
    procedure btFornecedorLimparClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRelComprasporFornecedor: TfrmRelComprasporFornecedor;
  strSQL:string;

implementation

Uses
  UDMGERAL, UGERAL, UfrmLocalizar;

{$R *.dfm}

procedure TfrmRelComprasporFornecedor.FormCreate(Sender: TObject);
begin
  inherited;
  strSQL := qyGeral.SQL.Text;
  rvGeral.ProjectFile := sPathLayout +'\RelComprasporFornecedor.rav';
end;

procedure TfrmRelComprasporFornecedor.btImprimirClick(Sender: TObject);
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

  if (edCod.Text = '') then
  begin
    MessageDlg('Fornecedor inválido! Favor inserir novamente!',mtInformation,
     [mbOK],0);
    edFornecedor.setfocus;
    Exit;
  end;

  try
    qyGeral.Close;
    qyGeral.SQL.Text := strSQL;
    qyGeral.SQL.Add('and DT_NF between :de and :ate');
    qyGeral.ParamByName('de').AsDate := dtDe.Date;
    qyGeral.ParamByName('ate').AsDate := dtAte.Date;
    qyGeral.ParamByName('TP_OPERACAO').AsString := cvOpCompra;

    if (edCod.Text <> '') then
    begin
      qyGeral.SQL.Add('and E1.CD_PESSOA =:CD_FORNECEDOR');
      qyGeral.ParamByName('CD_FORNECEDOR').AsString := edCod.Text;
    end;

    qyGeral.open;
    qyNFProduto.Open;
    rvGeral.Execute;
  finally
    qyNFProduto.Close;
    qyGeral.Close;
  end;
end;

procedure TfrmRelComprasporFornecedor.btFornecedorClick(Sender: TObject);
begin
  inherited;
  frmLocalizar := TfrmLocalizar.Create(application);
  frmLocalizar.Caption := 'Localizar Fornecedor';
  frmLocalizar.qyDados.sql.add('select CD_PESSOA, NM_PESSOA from PESSOA');
  frmLocalizar.qyDados.sql.add('where FL_ATIVO = '''+('S')+'''');
  frmLocalizar.qyDados.sql.add('and TP_PESSOA = '''+('FO')+'''');

  try
    frmLocalizar.Where := true;
    frmLocalizar.OrderBy:='cd_Pessoa';
    SetLength(VCampo,2);
    VCampo[0].Titulo  := 'Código';
    VCampo[1].Titulo  := 'Fornecedor';
    VCampo[0].Visivel := True;
    VCampo[1].Visivel := True;

  except
    ShowMessage(frmLocalizar.qyDados.Sql.Text);
  end;
  if frmLocalizar.ShowModal=mrok then
  begin
    edCod.text := frmLocalizar.qyDados.FieldByname('cd_pessoa').AsString;
    edFornecedor.text := frmLocalizar.qyDados.FieldByname('nm_pessoa').AsString;
  end;
  frmLocalizar.qyDados.Close;
  frmLocalizar.Free;


end;

procedure TfrmRelComprasporFornecedor.btFornecedorLimparClick(
  Sender: TObject);
begin
  inherited;
  edCod.Clear;
  edFornecedor.Clear;
end;

end.
