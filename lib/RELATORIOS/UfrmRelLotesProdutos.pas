unit UfrmRelLotesProdutos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UfrmRelPad, ComCtrls, DB, IBCustomDataSet, IBQuery, StdCtrls,
  Buttons, ExtCtrls, dxExEdtr, dxEdLib, dxCntner, dxEditor, RpRave, RpBase,
  RpSystem, RpDefine, RpCon, RpConDS, Grids, DBGrids;

type
  TfrmRelLotesProdutos = class(TfrmRelPad)
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
    RvDtCnLotesProduto: TRvDataSetConnection;
    RvSysLotesProduto: TRvSystem;
    RvPrjLotesProduto: TRvProject;
    dsGeral: TDataSource;
    ckSaldoZero: TCheckBox;
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
  frmRelLotesProdutos: TfrmRelLotesProdutos;
  strSQL:string;

implementation

uses
  UDM, UDMGERAL, UGERAL, UfrmLocalizar, UDMRelatorios;

{$R *.dfm}

procedure TfrmRelLotesProdutos.btProdutoClick(Sender: TObject);
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

procedure TfrmRelLotesProdutos.btProdutoLimparClick(Sender: TObject);
begin
  inherited;
  edCod.Clear;
  edProduto.Clear;
end;

procedure TfrmRelLotesProdutos.btImprimirClick(Sender: TObject);
begin
  inherited;
  try
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


    qyGeral.Close;
    qyGeral.SQL.Text := strSQL;
    qyGeral.ParamByName('de').AsDate := dtDe.Date;
    qyGeral.ParamByName('ate').AsDate := dtAte.Date;

    if edProduto.Text <> '' then
    begin
      qyGeral.SQL.Add('and nfp.CD_PRODUTO =:CD_PRODUTO');
      qyGeral.ParamByName('CD_PRODUTO').AsInteger := StrToInt(edCod.Text);
    end;

    if ckSaldoZero.Checked then
      qyGeral.SQL.Add('and l.QT_SALDO>0');

    try
      qyGeral.open;
      dmRelatorios.tbTmpParametro.Open;
      dmRelatorios.tbTmpParametro.Insert;
      dmRelatorios.tbTmpParametroCD_PARAMETRO.AsInteger := 1;
      dmRelatorios.tbTmpParametroVL_PARAMETRO1.AsString := edProduto.text;
      dmRelatorios.tbTmpParametroVL_PARAMETRO2.AsString := dtde.text;
      dmRelatorios.tbTmpParametroVL_PARAMETRO3.AsString := dtate.text;
      dmRelatorios.tbTmpParametro.Post;
      RvPrjLotesProduto.Execute;
    finally
      dmRelatorios.tbTmpParametro.Delete;
      dmRelatorios.tbTmpParametro.Close;
      qyGeral.Close;
    end;
  except
    qyGeral.Close;
  end;

end;

procedure TfrmRelLotesProdutos.FormCreate(Sender: TObject);
begin
  inherited;
  strSQL := qyGeral.SQL.Text;
  RvPrjLotesProduto.ProjectFile := sPathLayout +'\RelLotesProduto.rav';
end;

end.
