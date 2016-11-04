unit UfrmRelTransferencia;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UfrmRelPad, dxDBEdtr, dxDBELib, dxCntner, dxEditor, dxExEdtr,
  dxEdLib, StdCtrls, ComCtrls, DB, IBCustomDataSet, IBQuery, Buttons,
  ExtCtrls, RpRave, RpBase, RpSystem, RpDefine, RpCon, RpConDS;

type
  TfrmRelTransferencia = class(TfrmRelPad)
    GroupBox3: TGroupBox;
    Label3: TLabel;
    Label8: TLabel;
    dtDe: TdxDateEdit;
    dtAte: TdxDateEdit;
    dsGeral: TDataSource;
    rvDtProduto: TRvDataSetConnection;
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
    GroupBox2: TGroupBox;
    Label4: TLabel;
    btEmpOrigem: TSpeedButton;
    btEmpOrigemLimpar: TSpeedButton;
    edCod: TEdit;
    edEmpresaOrigem: TEdit;
    Label2: TLabel;
    btEmpRec: TSpeedButton;
    btEmpRecLimpar: TSpeedButton;
    edCod2: TEdit;
    edEmpresaReceb: TEdit;
    TabSheet1: TTabSheet;
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
    procedure btEmpOrigemClick(Sender: TObject);
    procedure btEmpRecClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btEmpOrigemLimparClick(Sender: TObject);
    procedure btEmpRecLimparClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRelTransferencia: TfrmRelTransferencia;
  strSQL:string;  
implementation

uses
  UGeral, UDMGERAL, UfrmLocalizar, UDMRelatorios;

{$R *.dfm}

procedure TfrmRelTransferencia.btImprimirClick(Sender: TObject);
begin
  inherited;

  if (dtDe.Text = '  /  /    ') then
  begin
    MessageDlg('Data (Inicio) inválido! Favor inserir novamente!',mtInformation,
     [mbOK],0);
    dtDe.setfocus;
    Exit;
  end;

  if (dtAte.Text = '  /  /    ') then
  begin
    MessageDlg('Data (Final) inválido! Favor inserir novamente!',mtInformation,
     [mbOK],0);
    dtAte.setfocus;
    Exit;
  end;

  try
    qyGeral.Close;
    qyGeral.SQL.Text := strSQL;
    qyGeral.SQL.Add('and NF.DT_NF between :de and :ate');
    qyGeral.ParamByName('de').AsDate := dtDe.Date;
    qyGeral.ParamByName('ate').AsDate := dtAte.Date;
    qyGeral.ParamByName('TP_OPERACAO').AsString := cvOpTransferencia;

    if (edCod.Text <> '') then
    begin
      qyGeral.SQL.Add('and E2.CD_PESSOA =:CD_ORIGEM');
      qyGeral.ParamByName('CD_ORIGEM').AsString := edCod.Text;
    end;

    if (edCod2.Text <> '') then
    begin
      qyGeral.SQL.Add('and E1.CD_PESSOA =:CD_DESTINO');
      qyGeral.ParamByName('CD_DESTINO').AsString := edCod2.Text;
    end;

    dmRelatorios.tbTmpParametro.Open;
    dmRelatorios.tbTmpParametro.Insert;
    dmRelatorios.tbTmpParametroCD_PARAMETRO.AsInteger := 1;
    dmRelatorios.tbTmpParametroVL_PARAMETRO1.AsString := dtde.text;
    dmRelatorios.tbTmpParametroVL_PARAMETRO2.AsString := dtate.text;
    dmRelatorios.tbTmpParametroVL_PARAMETRO3.AsString := edEmpresaOrigem.text;
    dmRelatorios.tbTmpParametroVL_PARAMETRO4.AsString := edEmpresaReceb.text;
    dmRelatorios.tbTmpParametro.Post;
    qyGeral.open;
    qyNFProduto.Open;
    rvGeral.Execute;
  finally
    qyNFProduto.Close;
    qyGeral.Close;
    dmRelatorios.tbTmpParametro.Delete;
    dmRelatorios.tbTmpParametro.Close;
    close;    
  end;
end;

procedure TfrmRelTransferencia.btEmpOrigemClick(Sender: TObject);
begin
  inherited;
  frmLocalizar := TfrmLocalizar.Create(application);
  frmLocalizar.Caption := 'Localizar Empresa';
  frmLocalizar.qyDados.sql.add('select CD_PESSOA, NM_PESSOA from PESSOA');
  frmLocalizar.qyDados.sql.add('where FL_ATIVO = '''+('S')+'''');
  frmLocalizar.qyDados.sql.add('and TP_PESSOA = '''+('EM')+'''');

  try
    frmLocalizar.Where := true;
    frmLocalizar.OrderBy:='cd_Pessoa';
    SetLength(VCampo,2);
    VCampo[0].Titulo  := 'Código';
    VCampo[1].Titulo  := 'Empresa';
    VCampo[0].Visivel := True;
    VCampo[1].Visivel := True;

  except
    ShowMessage(frmLocalizar.qyDados.Sql.Text);
  end;
  if frmLocalizar.ShowModal=mrok then
  begin
    edCod.text := frmLocalizar.qyDados.FieldByname('cd_pessoa').AsString;
    edEmpresaOrigem.text := frmLocalizar.qyDados.FieldByname('nm_pessoa').AsString;
  end;
  frmLocalizar.qyDados.Close;
  frmLocalizar.Free;

end;

procedure TfrmRelTransferencia.btEmpRecClick(Sender: TObject);
begin
  inherited;
  frmLocalizar := TfrmLocalizar.Create(application);
  frmLocalizar.Caption := 'Localizar Empresa';
  frmLocalizar.qyDados.sql.add('select CD_PESSOA, NM_PESSOA from PESSOA');
  frmLocalizar.qyDados.sql.add('where FL_ATIVO = '''+('S')+'''');
  frmLocalizar.qyDados.sql.add('and TP_PESSOA = '''+('EM')+'''');

  try
    frmLocalizar.Where := true;
    frmLocalizar.OrderBy:='cd_Pessoa';
    SetLength(VCampo,2);
    VCampo[0].Titulo  := 'Código';
    VCampo[1].Titulo  := 'Empresa';
    VCampo[0].Visivel := True;
    VCampo[1].Visivel := True;

  except
    ShowMessage(frmLocalizar.qyDados.Sql.Text);
  end;
  if frmLocalizar.ShowModal=mrok then
  begin
    edCod2.text := frmLocalizar.qyDados.FieldByname('cd_pessoa').AsString;
    edEmpresaReceb.text := frmLocalizar.qyDados.FieldByname('nm_pessoa').AsString;
  end;
  frmLocalizar.qyDados.Close;
  frmLocalizar.Free;
end;

procedure TfrmRelTransferencia.FormCreate(Sender: TObject);
begin
  inherited;
  strSQL := qyGeral.SQL.Text;
  rvGeral.ProjectFile := sPathLayout +'\RelTransferencia.rav';
end;

procedure TfrmRelTransferencia.btEmpOrigemLimparClick(Sender: TObject);
begin
  inherited;
  edEmpresaOrigem.Clear;
  edCod.Clear;
end;

procedure TfrmRelTransferencia.btEmpRecLimparClick(Sender: TObject);
begin
  inherited;
  edEmpresaReceb.Clear;
  edCod2.Clear;
end;

end.
