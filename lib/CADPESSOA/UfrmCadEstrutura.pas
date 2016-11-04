unit UfrmCadEstrutura;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UfrmCadPad, dxExEdtr, DB, dxCntner, dxTL, dxDBCtrl, dxDBGrid,
  ComCtrls, StdCtrls, Buttons, ExtCtrls, Mask, DBCtrls, IBCustomDataSet,
  IBQuery;

type
  TfrmCadEstrutura = class(TfrmCadPad)
    tvEstrutura: TTreeView;
    Panel5: TPanel;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    DBEdit6: TDBEdit;
    DBEdit7: TDBEdit;
    DBEdit8: TDBEdit;
    grDadosCD_PRODUTO: TdxDBGridMaskColumn;
    grDadosDS_PRODUTO: TdxDBGridMaskColumn;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    btIns: TSpeedButton;
    btDel: TSpeedButton;
    procedure pgGeralChange(Sender: TObject);
    procedure tabGeralEnter(Sender: TObject);
    procedure tvEstruturaClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure tvEstruturaChanging(Sender: TObject; Node: TTreeNode;
      var AllowChange: Boolean);
    procedure btIncluirClick(Sender: TObject);
    procedure btexcluirClick(Sender: TObject);
    procedure btCancelarClick(Sender: TObject);
    procedure grDadosDblClick(Sender: TObject);
    procedure btInsClick(Sender: TObject);
    procedure btDelClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure MontaEstrutura;
    procedure MontaEstruturaGeral(Codigo:Integer; node:TTreeNode);
  end;

var
  frmCadEstrutura: TfrmCadEstrutura;

implementation

uses UfrmLocalizar, UDM, udmProducao;

{$R *.dfm}
procedure TfrmCadEstrutura.MontaEstrutura;
begin
  dmProducao.TB_ESTRUTURA.Close;
  dmProducao.TB_ESTRUTURA.ParamByName('CD_PRODUTO_PAI').AsInteger :=
     dmProducao.qyEstruturaCD_PRODUTO.AsInteger;
  dmProducao.TB_ESTRUTURA.Open;
  tvEstrutura.Items.Clear;
  tvEstrutura.Items.BeginUpdate;
  MontaEstruturaGeral(dmProducao.qyEstruturaCD_PRODUTO.AsInteger,nil);
  tvEstrutura.Items.EndUpdate;
end;

procedure TfrmCadEstrutura.MontaEstruturaGeral(Codigo:Integer; node:TTreeNode);
var bk:TBookmark; sAux : String; nd:TTreeNode; qy:TIBQuery;
begin
  qy := TIBQuery.Create(nil);
  try
    qy.Database := dm.DB;
    qy.sql.Text := 'select cd_produto,cd_produto_pai from estrutura ' +
                   'where cd_produto_pai = :cd_produto_pai';
    qy.ParamByName('CD_PRODUTO_PAI').AsInteger := Codigo;
    qy.Open;

    while not qy.Eof do
    begin
      if dmProducao.TB_ESTRUTURA.Locate('CD_PRODUTO;CD_PRODUTO_PAI',
        varArrayOf([qy.FieldByName('CD_PRODUTO').AsInteger,
                    qy.FieldByName('CD_PRODUTO_PAI').AsInteger]),[]) then
      begin
        bk := dmProducao.TB_ESTRUTURA.GetBookmark;
        sAux := dmProducao.TB_ESTRUTURACD_PRODUTO.AsString + ' - ' +
                dmProducao.TB_ESTRUTURADS_PRODUTO.AsString;
        nd := tvEstrutura.Items.AddChildObject(node, sAux, bk);
        //Recursividade
        MontaEstruturaGeral(dmProducao.TB_ESTRUTURACD_PRODUTO.AsInteger,nd);
      end;
      qy.Next;
    end;
  finally
    qy.Close;
    qy.Free;
  end;
end;

procedure TfrmCadEstrutura.pgGeralChange(Sender: TObject);
begin
  inherited;
  if pgGeral.ActivePage = tabGeral then
  begin
     MontaEstrutura;
  end;
end;

procedure TfrmCadEstrutura.tabGeralEnter(Sender: TObject);
begin
  inherited;
  //MontaEstrutura;
end;

procedure TfrmCadEstrutura.tvEstruturaClick(Sender: TObject);
var bk:TBookmark; node:TTreeNode;
begin
  inherited;
  if not(dsControle.State in dsEditModes) then
  begin
    node := tvEstrutura.Selected;
    if (node<>nil) then
    begin
      bk := node.Data;

      if not (bk = nil) then
        dmProducao.TB_ESTRUTURA.GotoBookmark(bk);
    end;
  end;
end;

procedure TfrmCadEstrutura.FormShow(Sender: TObject);
begin
  inherited;
  if not dsGrid.DataSet.Active then
    dsGrid.DataSet.Open;
end;

procedure TfrmCadEstrutura.tvEstruturaChanging(Sender: TObject;
  Node: TTreeNode; var AllowChange: Boolean);
begin
  inherited;
  AllowChange := not(dmProducao.TB_ESTRUTURA.State in dsEditModes);
end;

procedure TfrmCadEstrutura.btIncluirClick(Sender: TObject);
var bk:TBookmark;  sAux:String;
begin
  inherited;
  frmLocalizar := TfrmLocalizar.Create(application);
  frmLocalizar.Caption := 'Localizar Produto';
  frmLocalizar.qyDados.sql.add('select cd_produto, ds_produto from produto where fl_Ativo = ''S'' ');

  try
    frmLocalizar.Where := True;
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
    dmProducao.TB_ESTRUTURACD_PRODUTO_PAI.AsInteger := dmProducao.qyEstruturaCD_PRODUTO.AsInteger;
    dmProducao.TB_ESTRUTURACD_PRODUTO.AsInteger := frmLocalizar.qyDados.FieldByname('cd_produto').AsInteger;
    dmProducao.TB_ESTRUTURADS_PRODUTO.AsString := frmLocalizar.qyDados.FieldByname('ds_produto').AsString;
    dmProducao.TB_ESTRUTURANR_NIVEL.AsInteger := 1;
    sAux := dmProducao.TB_ESTRUTURACD_PRODUTO.AsString +'-'+ dmProducao.TB_ESTRUTURADS_PRODUTO.AsString;
    bk := dmProducao.TB_ESTRUTURA.GetBookmark;
    tvEstrutura.Items.AddChildObject(nil, sAux, bk);
  end;
  frmLocalizar.qyDados.Close;
  frmLocalizar.Free;
end;

procedure TfrmCadEstrutura.btexcluirClick(Sender: TObject);
var node:TTreeNode;
begin
  inherited;
  node := tvEstrutura.Selected;
  node.Delete;
end;

procedure TfrmCadEstrutura.btCancelarClick(Sender: TObject);
var node:TTreeNode;
begin
  inherited;
  node := tvEstrutura.Selected;
  node.Delete;
end;

procedure TfrmCadEstrutura.grDadosDblClick(Sender: TObject);
begin
  inherited;
  pgGeralChange(Sender);
end;

procedure TfrmCadEstrutura.btInsClick(Sender: TObject);
var node,ndf:TTreeNode; bk:TBookmark;  sAux:String; cod:Integer;
begin
  if (tvEstrutura.Selected = nil) then Exit;

  cod := dmProducao.TB_ESTRUTURACD_PRODUTO.AsInteger;
  frmLocalizar := TfrmLocalizar.Create(application);
  frmLocalizar.Caption := 'Localizar Produto';
  frmLocalizar.qyDados.sql.add('select cd_produto, ds_produto from produto where fl_Ativo = ''S'' ');

  try
    frmLocalizar.Where := True;
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
    node := tvEstrutura.Selected;
    dmProducao.TB_ESTRUTURA.Insert;
    dmProducao.TB_ESTRUTURACD_PRODUTO_PAI.AsInteger := cod;
    dmProducao.TB_ESTRUTURACD_PRODUTO.AsInteger := frmLocalizar.qyDados.FieldByname('cd_produto').AsInteger;
    dmProducao.TB_ESTRUTURADS_PRODUTO.AsString := frmLocalizar.qyDados.FieldByname('ds_produto').AsString;
    dmProducao.TB_ESTRUTURANR_NIVEL.AsInteger := node.Level + 1;
    //dmGeral.TB_ESTRUTURA.Post;
    sAux := dmProducao.TB_ESTRUTURACD_PRODUTO.AsString +'-'+ dmProducao.TB_ESTRUTURADS_PRODUTO.AsString;
    bk := dmProducao.TB_ESTRUTURA.GetBookmark;
    ndf := tvEstrutura.Items.AddChildObject(node, sAux, bk);
    node.Expand(true);
    ndf.Selected := true;
    ndf.Focused := true;
  end;
  frmLocalizar.qyDados.Close;
  frmLocalizar.Free;
end;

procedure TfrmCadEstrutura.btDelClick(Sender: TObject);
var node:TTreeNode;
begin
  inherited;
  if (tvEstrutura.Selected = nil) then Exit;
  node := tvEstrutura.Selected;
  node.Delete;
  dmProducao.TB_ESTRUTURA.Delete;
end;

end.
