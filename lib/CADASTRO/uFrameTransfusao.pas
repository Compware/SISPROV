unit uFrameTransfusao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, dxCntner, dxEditor, dxEdLib, dxDBELib, StdCtrls, Mask, ToolEdit,
  RXDBCtrl, ExtCtrls, DB, Buttons, Grids, DBGrids, dxExEdtr, dxDBTLCl,
  dxGrClms, dxDBCtrl, dxDBGrid, dxTL;

type
  TframTransfusao = class(TFrame)
    Panel1: TPanel;
    Label13: TLabel;
    dsTransfusao: TDataSource;
    Panel2: TPanel;
    btNovo: TSpeedButton;
    btEditar: TSpeedButton;
    btSalvar: TSpeedButton;
    btExcluir: TSpeedButton;
    dxDBGrid1: TdxDBGrid;
    dxDBGrid1CD_FICHA: TdxDBGridColumn;
    dxDBGrid1CD_TRANSFUSAO: TdxDBGridMaskColumn;
    dxDBGrid1DT_TRANSFUSAO: TdxDBGridDateColumn;
    dxDBGrid1DS_TRANSFUSAO: TdxDBGridMaskColumn;
    procedure btNovoClick(Sender: TObject);
    procedure btEditarClick(Sender: TObject);
    procedure btSalvarClick(Sender: TObject);
    procedure btExcluirClick(Sender: TObject);
    procedure dsTransfusaoStateChange(Sender: TObject);
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

procedure TframTransfusao.btNovoClick(Sender: TObject);
begin
  dsTransfusao.DataSet.Insert;
end;

procedure TframTransfusao.btEditarClick(Sender: TObject);
begin
  dsTransfusao.DataSet.Edit;
end;

procedure TframTransfusao.btSalvarClick(Sender: TObject);
begin
  dsTransfusao.DataSet.Post;
end;

procedure TframTransfusao.btExcluirClick(Sender: TObject);
begin
  dsTransfusao.DataSet.Delete;
end;

procedure TframTransfusao.dsTransfusaoStateChange(Sender: TObject);
begin
  Bloqueia(FbBloqueia);
end;

procedure TframTransfusao.Bloqueia(bBloqueia: boolean);
var bEditMode:boolean;
begin
  FbBloqueia :=  bBloqueia;
  bEditMode := (dsTransfusao.DataSet.State in dsEditModes);
  btNovo.Enabled := not bEditMode and not FbBloqueia;
  btEditar.Enabled := not bEditMode and not FbBloqueia;
  btSalvar.Enabled := bEditMode and not FbBloqueia;
  btExcluir.Enabled := not bBloqueia;
end;

end.
