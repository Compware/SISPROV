unit UfrmRelABCProdutos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UfrmRelPad, ComCtrls, DB, IBCustomDataSet, IBQuery, StdCtrls,
  Buttons, ExtCtrls, Grids, DBGrids, RpRave, RpBase, RpSystem, RpDefine,
  RpCon, RpConDS, dxDBEdtr, dxDBELib, dxCntner, dxEditor, dxExEdtr, dxEdLib;

type
  TfrmRelABCProdutos = class(TfrmRelPad)
    RvDtCnABCProduto: TRvDataSetConnection;
    RvSysABCProduto: TRvSystem;
    RvPrjABCProduto: TRvProject;
    TabSheet2: TTabSheet;
    GroupBox3: TGroupBox;
    Label3: TLabel;
    Label8: TLabel;
    dtde: TdxDateEdit;
    dtate: TdxDateEdit;
    RvDtCnABCProdutoConfRel: TRvDataSetConnection;
    qyGeralCD_PRODUTO: TIntegerField;
    qyGeralDS_PRODUTO: TIBStringField;
    qyGeralQTDE_TOTAL: TLargeintField;
    qyGeralVALOR_TOTAL: TIBBCDField;
    rgordenar: TRadioGroup;
    procedure btImprimirClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure qyGeralBeforeOpen(DataSet: TDataSet);
    procedure RvPrjABCProdutoCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRelABCProdutos: TfrmRelABCProdutos;
  strSQL:string;
implementation

uses
  UDM, UDMGERAL, Ugeral, UfrmLocalizar, UDMRelatorios;

{$R *.dfm}

procedure TfrmRelABCProdutos.btImprimirClick(Sender: TObject);
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
    dmRelatorios.tbTmpParametro.Open;
    dmRelatorios.tbTmpParametro.Insert;
    dmRelatorios.tbTmpParametroCD_PARAMETRO.AsInteger := 1;
    dmRelatorios.tbTmpParametroVL_PARAMETRO1.AsString := dtde.text;
    dmRelatorios.tbTmpParametroVL_PARAMETRO2.AsString := dtate.text;
    dmRelatorios.tbTmpParametro.Post;
    qyGeral.Close;
    qyGeral.SQL.Text := strSQL;
    if rgordenar.ItemIndex = 0 then
      qyGeral.SQL.Add('order by VALOR_TOTAL');

    if rgordenar.ItemIndex = 1 then
      qyGeral.SQL.Add('order by QTDE_TOTAL');

    qyGeral.open;
    RvPrjABCProduto.Execute;

   finally
    qyGeral.Close;
    dmRelatorios.tbTmpParametro.Delete;
    dmRelatorios.tbTmpParametro.Close;
    close;
  end;
end;

procedure TfrmRelABCProdutos.FormCreate(Sender: TObject);
begin
  inherited;
  strSQL := qyGeral.SQL.Text;
  RvPrjABCProduto.ProjectFile := sPathLayout +'\RelABCProdutos.rav';
end;

procedure TfrmRelABCProdutos.qyGeralBeforeOpen(DataSet: TDataSet);
begin
  inherited;
  qyGeral.ParamByName('de').AsDate := dtDe.Date;
  qyGeral.ParamByName('ate').AsDate := dtAte.Date;

end;

procedure TfrmRelABCProdutos.RvPrjABCProdutoCreate(Sender: TObject);
begin
  inherited;
  RvPrjABCProduto.ProjectFile := sPathLayout +'\RelABCProdutos.rav';
end;

end.
