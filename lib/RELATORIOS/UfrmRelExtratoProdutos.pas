unit UfrmRelExtratoProdutos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UfrmRelPad, ComCtrls, DB, IBCustomDataSet, IBQuery, StdCtrls,
  Buttons, ExtCtrls, dxExEdtr, dxEdLib, dxCntner, dxEditor, RpRave, RpBase,
  RpSystem, RpDefine, RpCon, RpConDS;

type
  TfrmRelExtratoProdutos = class(TfrmRelPad)
    GroupBox1: TGroupBox;
    Label2: TLabel;
    TabSheet1: TTabSheet;
    Label3: TLabel;
    dtde: TdxDateEdit;
    dtate: TdxDateEdit;
    GroupBox2: TGroupBox;
    Label4: TLabel;
    btProduto: TSpeedButton;
    btProdutoLimpar: TSpeedButton;
    edCod: TEdit;
    edProduto: TEdit;
    qyGeralQT_PRODUTO: TIntegerField;
    qyGeralVL_PRECO: TIBBCDField;
    qyGeralVL_TOTAL: TIBBCDField;
    qyGeralCD_OPERACAO: TIntegerField;
    qyGeralDS_OPERACAO: TIBStringField;
    qyGeralDS_PESSOA: TIBStringField;
    qyGeralDT_NF: TDateTimeField;
    qyGeralNR_NF: TIBStringField;
    qyGeralCD_PRODUTO: TIntegerField;
    rvdtcnExtrato: TRvDataSetConnection;
    rvsysExtrato: TRvSystem;
    rvprjExtrato: TRvProject;
    dsExtrato: TDataSource;
    qyExtrato: TIBQuery;
    qyExtratoDT_ESTOQUE: TDateTimeField;
    qyExtratoNR_PRODUTO: TIBStringField;
    qyExtratoDS_PRODUTO: TIBStringField;
    qyExtratoQT_ESTOQUE: TIBBCDField;
    qyExtratoVL_SALDO: TIBBCDField;
    qyExtratoTP_MOVIMENTO: TIBStringField;
    qyExtratoCD_LOCAL: TIntegerField;
    qyExtratoCD_DOCUMENTO: TIntegerField;
    qyExtratoTP_DOCUMENTO: TIBStringField;
    qyExtratoDS_EMPRESA: TIBStringField;
    qyExtratoVL_SALDO_INI: TIBBCDField;
    qyExtratoNM_LOCAL: TIBStringField;
    procedure btProdutoClick(Sender: TObject);
    procedure btProdutoLimparClick(Sender: TObject);
    procedure btImprimirClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRelExtratoProdutos: TfrmRelExtratoProdutos;

implementation

uses
  UDM, UDMGERAL, UGERAL, UfrmLocalizar, UDMRelatorios;

{$R *.dfm}

procedure TfrmRelExtratoProdutos.btProdutoClick(Sender: TObject);
begin
  inherited;
  frmLocalizar := TfrmLocalizar.Create(application);
  frmLocalizar.Caption := 'Localizar Produto';
  frmLocalizar.qyDados.sql.add('select cd_produto, ds_produto from produto');

  try
    frmLocalizar.Where := False;
    frmLocalizar.OrderBy:='cd_produto';
    SetLength(VCampo,2);
    VCampo[0].Titulo  := 'Código';
    VCampo[1].Titulo  := 'Produto';
    VCampo[0].Visivel := True;
    VCampo[1].Visivel := True;

  except
    ShowMessage(frmLocalizar.qyDados.Sql.Text);
  end;
  if frmLocalizar.ShowModal=mrok then
  begin
    edCod.text := frmLocalizar.qyDados.FieldByname('cd_produto').AsString;
    edProduto.text := frmLocalizar.qyDados.FieldByname('ds_produto').AsString;
  end;
  frmLocalizar.qyDados.Close;
  frmLocalizar.Free;

end;

procedure TfrmRelExtratoProdutos.btProdutoLimparClick(Sender: TObject);
begin
  inherited;
  edCod.Clear;
  edProduto.Clear;
end;

procedure TfrmRelExtratoProdutos.btImprimirClick(Sender: TObject);
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
    MessageDlg('Produto inválido! Favor inserir novamente!',mtInformation,
     [mbOK],0);
    edCod.setfocus;
    Exit;
  end;

  try
    qyExtrato.Close;
    qyExtrato.ParamByName('CD_EMPRESA').AsInteger := dmGeral.qyDadosEmpresaCD_EMPRESA.AsInteger;;
    qyExtrato.ParamByName('CD_PRODUTO').AsInteger := strToInt(edCod.Text);
    qyExtrato.ParamByName('DT_INI').AsDate := dtde.Date;
    qyExtrato.ParamByName('DT_FIM').AsDateTime := dtate.Date+StrToTime('23:59:59');
    qyExtrato.Open;

    dmRelatorios.tbTmpParametro.Open;
    dmRelatorios.tbTmpParametro.Insert;
    dmRelatorios.tbTmpParametroCD_PARAMETRO.AsInteger := 1;
    dmRelatorios.tbTmpParametroVL_PARAMETRO1.AsString := dmGeral.qyDadosEmpresaDS_EMPRESA.AsString;
    dmRelatorios.tbTmpParametroVL_PARAMETRO2.AsString := dtde.text;
    dmRelatorios.tbTmpParametroVL_PARAMETRO3.AsString := dtate.text;
    dmRelatorios.tbTmpParametro.Post;
    RvPrjExtrato.Execute;
  finally
    dmRelatorios.tbTmpParametro.Delete;
    dmRelatorios.tbTmpParametro.Close;
    qyExtrato.Close;
  end;
end;

procedure TfrmRelExtratoProdutos.FormCreate(Sender: TObject);
begin
  inherited;
  rvprjExtrato.ProjectFile := sPathLayout +'\RelExtratoProduto.rav';
end;

end.
