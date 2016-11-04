unit UfrmCadProdutoComposto;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UfrmCadPad, dxExEdtr, dxEdLib, dxDBELib, dxCntner, dxEditor,
  StdCtrls, Mask, DBCtrls, dxDBTLCl, dxGrClms, dxTL, dxDBCtrl, dxDBGrid,
  DB, ComCtrls, Buttons, ExtCtrls;

type
  TfrmCadProdutoComposto = class(TfrmCadPad)
    grDadosCD_COMPOSTO: TdxDBGridMaskColumn;
    grDadosDS_COMPOSTO: TdxDBGridMaskColumn;
    grDadosCD_PRODUTO: TdxDBGridMaskColumn;
    grDadosDT_CADASTRO: TdxDBGridDateColumn;
    grDadosQT_QTDE: TdxDBGridMaskColumn;
    grDadosCD_EMPRESA: TdxDBGridMaskColumn;
    Label1: TLabel;
    edCodigo: TDBEdit;
    edNome: TDBEdit;
    Label3: TLabel;
    Label4: TLabel;
    dxDBDateEdit1: TdxDBDateEdit;
    Label5: TLabel;
    DBEdit2: TDBEdit;
    edProduto: TdxDBButtonEdit;
    Label2: TLabel;
    DBEdit1: TDBEdit;
    grDadosCD_PEDIDO: TdxDBGridColumn;
    procedure edProdutoButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure FormShow(Sender: TObject);
    procedure btIncluirClick(Sender: TObject);
    procedure btexcluirClick(Sender: TObject);
    procedure bteditarClick(Sender: TObject);
    procedure btgravarClick(Sender: TObject);
    procedure btCancelarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadProdutoComposto: TfrmCadProdutoComposto;

implementation

Uses
  UDM, UDMProducao, UfrmLocalizar, UGeral;

{$R *.dfm}

procedure TfrmCadProdutoComposto.edProdutoButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
begin
  inherited;
  frmLocalizar := TfrmLocalizar.Create(application);
  {TODO:Mudar para SQL....}
  frmLocalizar.Caption := 'Localizar Produto';
  frmLocalizar.qyDados.sql.add('select p.CD_PRODUTO, p.DS_PRODUTO, p.SG_UNIDADE,');
  frmLocalizar.qyDados.sql.add('f.DS_FAMILIA, g.DS_GRUPO');
  frmLocalizar.qyDados.sql.add('from Produto P');
  frmLocalizar.qyDados.sql.add('left outer join FAMILIA F on(f.cd_familia = p.cd_familia)');
  frmLocalizar.qyDados.sql.add('left outer join GRUPO G on(g.cd_GRUPO = p.cd_GRUPO)');
  frmLocalizar.qyDados.sql.add('where p.fl_ativo = '+ QuotedStr(cvSim));
  frmLocalizar.qyDados.sql.add('and p.fl_composto = '+ QuotedStr(cvSim));

  try
    frmLocalizar.Where := true;
    frmLocalizar.OrderBy:='p.CD_PRODUTO';
    SetLength(VCampo,7);
    VCampo[0].Titulo  := 'Código';
    VCampo[0].Width := 5;
    VCampo[1].Titulo  := 'Produto';
    VCampo[1].Width := 25;
    VCampo[2].Titulo  := 'Unidade';
    VCampo[2].Width := 5;
    VCampo[3].Titulo  := 'Família';
    VCampo[3].Width := 15;
    VCampo[4].Titulo  := 'Grupo';
    VCampo[4].Width := 15;
    VCampo[0].Visivel := True;
    VCampo[1].Visivel := True;
    VCampo[2].Visivel := True;
    VCampo[3].Visivel := True;
    VCampo[4].Visivel := True;
  except
    ShowMessage(frmLocalizar.qyDados.Sql.Text);
  end;
  if frmLocalizar.ShowModal=mrok then
  begin
    dmProducao.TB_COMPOSTOCD_PRODUTO.AsInteger := frmLocalizar.qyDados.FieldByname('cd_produto').AsInteger;
    dmProducao.TB_COMPOSTODS_COMPOSTO.AsString := frmLocalizar.qyDados.FieldByname('ds_produto').AsString;
  end;
  frmLocalizar.qyDados.Close;
  frmLocalizar.Free;
end;

procedure TfrmCadProdutoComposto.FormShow(Sender: TObject);
begin
  inherited;
  btIncluir.Enabled := true;
  btexcluir.Enabled := true;
  bteditar.Enabled := true;
  btgravar.Enabled := false;
  btimprimir.Enabled := true;
  btAnterior.Enabled := true;
  btProximo.Enabled := true;
  btPesquisar.Enabled := true;
  edProduto.Buttons[0].Visible := false;
  dsControle.AutoEdit := false;
  tabLista.TabVisible := true;
end;

procedure TfrmCadProdutoComposto.btIncluirClick(Sender: TObject);
begin
  inherited;
  edProduto.Buttons[0].Visible := true;
end;

procedure TfrmCadProdutoComposto.btexcluirClick(Sender: TObject);
begin
  inherited;
  edProduto.Buttons[0].Visible := false;
end;

procedure TfrmCadProdutoComposto.bteditarClick(Sender: TObject);
begin
  inherited;
  edProduto.Buttons[0].Visible := true;
end;

procedure TfrmCadProdutoComposto.btgravarClick(Sender: TObject);
begin
  inherited;
  edProduto.Buttons[0].Visible := false;
  dmProducao.GeraMovimentoEstoquePC;
end;

procedure TfrmCadProdutoComposto.btCancelarClick(Sender: TObject);
begin
  inherited;
  edProduto.Buttons[0].Visible := false;  
end;

end.
