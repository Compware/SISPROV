unit ufrmPrecos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, dxEditor, dxExEdtr, dxEdLib, dxCntner, Grids,
  DBGrids, DB, ExtCtrls, RXSpin;

type
  TfrmPrecos = class(TForm)
    Panel1: TPanel;
    dsProduto: TDataSource;
    DBGrid1: TDBGrid;
    Label1: TLabel;
    edFator: TEdit;
    btAplicarAlteracao: TSpeedButton;
    GroupBox1: TGroupBox;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    btUnidade: TSpeedButton;
    btUnidadeLimpar: TSpeedButton;
    btFamilia: TSpeedButton;
    btFamiliaLimpar: TSpeedButton;
    btGrupo: TSpeedButton;
    btGrupoLimpar: TSpeedButton;
    edCodFamilia: TdxEdit;
    edCodGrupo: TdxEdit;
    edCodUnidade: TdxEdit;
    edFamilia: TdxButtonEdit;
    edGrupo: TdxButtonEdit;
    edUnidade: TdxButtonEdit;
    btFiltro: TBitBtn;
    edRound: TRxSpinEdit;
    Label5: TLabel;
    procedure btFamiliaClick(Sender: TObject);
    procedure btFamiliaLimparClick(Sender: TObject);
    procedure btGrupoClick(Sender: TObject);
    procedure btGrupoLimparClick(Sender: TObject);
    procedure btUnidadeClick(Sender: TObject);
    procedure btUnidadeLimparClick(Sender: TObject);
    procedure btFiltroClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btAplicarAlteracaoClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrecos: TfrmPrecos;
  strSQL:string;
  
implementation

uses UDMGERAL, UDM, UfrmLocalizar, Math;

{$R *.dfm}

procedure TfrmPrecos.btFamiliaClick(Sender: TObject);
begin
  frmLocalizar := TfrmLocalizar.Create(application);
  frmLocalizar.Caption := 'Localizar Família';
  frmLocalizar.qyDados.sql.add('select CD_Familia, DS_Familia from FAMILIA');

  try
    frmLocalizar.Where := False;
    frmLocalizar.OrderBy:='CD_FAMILIA';
    SetLength(VCampo,2);
    VCampo[0].Titulo  := 'Código';
    VCampo[1].Titulo  := 'Família';
    VCampo[0].Visivel := True;
    VCampo[1].Visivel := True;

  except
    ShowMessage(frmLocalizar.qyDados.Sql.Text);
  end;
  if frmLocalizar.ShowModal=mrok then
  begin
    edCodFamilia.text := frmLocalizar.qyDados.FieldByname('CD_FAMILIA').AsString;
    edfamilia.text := frmLocalizar.qyDados.FieldByname('DS_FAMILIA').AsString;
  end;
  frmLocalizar.qyDados.Close;
  frmLocalizar.Free;
end;

procedure TfrmPrecos.btFamiliaLimparClick(Sender: TObject);
begin
  edFamilia.Clear;
end;

procedure TfrmPrecos.btGrupoClick(Sender: TObject);
begin
  frmLocalizar := TfrmLocalizar.Create(application);
  frmLocalizar.Caption := 'Localizar Grupo';
  frmLocalizar.qyDados.sql.add('select CD_GRUPO, DS_GRUPO from GRUPO');

  try
    frmLocalizar.Where := False;
    frmLocalizar.OrderBy:='CD_GRUPO';
    SetLength(VCampo,2);
    VCampo[0].Titulo  := 'Código';
    VCampo[1].Titulo  := 'Grupo';
    VCampo[0].Visivel := True;
    VCampo[1].Visivel := True;

  except
    ShowMessage(frmLocalizar.qyDados.Sql.Text);
  end;
  if frmLocalizar.ShowModal=mrok then
  begin
    edCodGrupo.Text := frmLocalizar.qyDados.FieldByname('CD_GRUPO').AsString;
    edGrupo.text := frmLocalizar.qyDados.FieldByname('DS_GRUPO').AsString;
  end;
  frmLocalizar.qyDados.Close;
  frmLocalizar.Free;
end;

procedure TfrmPrecos.btGrupoLimparClick(Sender: TObject);
begin
  edGrupo.Clear;
end;

procedure TfrmPrecos.btUnidadeClick(Sender: TObject);
begin
  frmLocalizar := TfrmLocalizar.Create(application);
  frmLocalizar.Caption := 'Localizar Unidade';
  frmLocalizar.qyDados.sql.add('select SG_UNIDADE, DS_UNIDADE from UNIDADE');

  try
    frmLocalizar.Where := False;
    frmLocalizar.OrderBy:='SG_UNIDADE';
    SetLength(VCampo,2);
    VCampo[0].Titulo  := 'Código';
    VCampo[1].Titulo  := 'Unidade';
    VCampo[0].Visivel := True;
    VCampo[1].Visivel := True;

  except
    ShowMessage(frmLocalizar.qyDados.Sql.Text);
  end;
  if frmLocalizar.ShowModal=mrok then
  begin
    edCodUnidade.text := frmLocalizar.qyDados.FieldByname('SG_UNIDADE').AsString;
    edUnidade.Text := frmLocalizar.qyDados.FieldByname('DS_UNIDADE').AsString;
  end;
  frmLocalizar.qyDados.Close;
  frmLocalizar.Free;
end;

procedure TfrmPrecos.btUnidadeLimparClick(Sender: TObject);
begin
  edUnidade.Clear;
end;

procedure TfrmPrecos.btFiltroClick(Sender: TObject);
begin
  dmGeral.TB_PRODUTO.Close;
  dmGeral.TB_PRODUTO.SelectSQL.Text := strSQL;
  if edUnidade.Text <> '' then
    dmGeral.TB_PRODUTO.SelectSQL.Add('and P.SG_UNIDADE = '''+edCodUnidade.Text+'''');
  if edFamilia.text <> '' then
    dmGeral.TB_PRODUTO.SelectSQL.Add('and P.CD_FAMILIA = '''+edCodFamilia.Text+'''');
  if edGrupo.Text <> '' then
    dmGeral.TB_PRODUTO.SelectSQL.Add('and P.CD_GRUPO = '''+edCodGrupo.Text+'''');
  dmGeral.TB_PRODUTO.Open;
end;

procedure TfrmPrecos.FormCreate(Sender: TObject);
begin
  strSQL := dmGeral.TB_PRODUTO.SelectSQL.Text;
end;

procedure TfrmPrecos.btAplicarAlteracaoClick(Sender: TObject);
var fator,valor:Real; i,rd:Integer;
begin
  try
    fator := strToFloat(edFator.text);
    rd := StrToInt(edRound.text);
  except
    fator := 0;
    edFator.SetFocus;
    Abort;
  end;

  dmGeral.TB_PRODUTO.First;
  while not dmGeral.TB_PRODUTO.Eof do
  begin
    dmGeral.TB_PRODUTO.Edit;
    valor := dmGeral.TB_PRODUTOVL_PRECO_CUSTO.AsFloat * Fator;
    if valor > 0 then rd := rd * -1;
    valor := RoundTo(valor, rd);
    dmGeral.TB_PRODUTOVL_PRECO_VENDA.AsFloat := valor;
    dmGeral.TB_PRODUTO.Post;
    dmGeral.TB_PRODUTO.Next;
  end;
end;

end.
