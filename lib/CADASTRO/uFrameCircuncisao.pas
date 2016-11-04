unit uFrameCircuncisao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, dxCntner, dxEditor, dxEdLib, dxDBELib, StdCtrls, Mask, ToolEdit,
  RXDBCtrl, ExtCtrls, DB, Buttons, Grids, DBGrids, dxExEdtr, dxDBTLCl,
  dxGrClms, dxDBGrid, dxTL, dxDBCtrl;

type
  TframCircuncisao = class(TFrame)
    Panel1: TPanel;
    Label13: TLabel;
    dsCircuncisao: TDataSource;
    Panel2: TPanel;
    btNovo: TSpeedButton;
    btEditar: TSpeedButton;
    btSalvar: TSpeedButton;
    btExcluir: TSpeedButton;
    dxDBGrid1: TdxDBGrid;
    dxDBGrid1CD_CIRCUNCISAO: TdxDBGridMaskColumn;
    dxDBGrid1CD_FICHA: TdxDBGridColumn;
    dxDBGrid1DT_CIRCUNCISAO: TdxDBGridDateColumn;
    procedure btNovoClick(Sender: TObject);
    procedure btSalvarClick(Sender: TObject);
    procedure btExcluirClick(Sender: TObject);
    procedure btEditarClick(Sender: TObject);
    procedure dsCircuncisaoStateChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    FbBloqueia: boolean;
    procedure Bloqueia(bBloqueia: boolean);
  end;

implementation

uses UDMGERAL;

{$R *.dfm}

procedure TframCircuncisao.btNovoClick(Sender: TObject);
begin
  dsCircuncisao.DataSet.Insert;
end;

procedure TframCircuncisao.btEditarClick(Sender: TObject);
begin
  dsCircuncisao.DataSet.Edit;
end;

procedure TframCircuncisao.btSalvarClick(Sender: TObject);
begin
  dsCircuncisao.DataSet.Post;
end;

procedure TframCircuncisao.btExcluirClick(Sender: TObject);
begin
  dsCircuncisao.DataSet.Delete;
end;

procedure TframCircuncisao.dsCircuncisaoStateChange(Sender: TObject);
begin
  Bloqueia(FbBloqueia);
end;

procedure TframCircuncisao.Bloqueia(bBloqueia: boolean);
var bEditMode:boolean;
begin
  FbBloqueia :=  bBloqueia;
  bEditMode := (dsCircuncisao.DataSet.State in dsEditModes);
  btNovo.Enabled := not bEditMode and not FbBloqueia;
  btEditar.Enabled := not bEditMode and not FbBloqueia;
  btSalvar.Enabled := bEditMode and not FbBloqueia;
  btExcluir.Enabled := not bBloqueia;
end;

end.
