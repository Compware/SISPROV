unit uFrameDentario;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, dxCntner, dxEditor, dxEdLib, dxDBELib, StdCtrls, Mask, ToolEdit,
  RXDBCtrl, ExtCtrls, DB, Buttons, Grids, DBGrids, dxExEdtr, dxDBTLCl,
  dxGrClms, dxDBGrid, dxTL, dxDBCtrl;

type
  TframDentario = class(TFrame)
    Panel1: TPanel;
    Label13: TLabel;
    dsDentario: TDataSource;
    Panel2: TPanel;
    btNovo: TSpeedButton;
    btEditar: TSpeedButton;
    btSalvar: TSpeedButton;
    btExcluir: TSpeedButton;
    dxDBGrid1: TdxDBGrid;
    dxDBGrid1CD_DENTARIO: TdxDBGridMaskColumn;
    dxDBGrid1CD_FICHA: TdxDBGridColumn;
    dxDBGrid1DT_DENTARIO: TdxDBGridDateColumn;
    procedure btNovoClick(Sender: TObject);
    procedure btSalvarClick(Sender: TObject);
    procedure btExcluirClick(Sender: TObject);
    procedure btEditarClick(Sender: TObject);
    procedure dsDentarioStateChange(Sender: TObject);
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

procedure TframDentario.btNovoClick(Sender: TObject);
begin
  dsDentario.DataSet.Insert;
end;

procedure TframDentario.btEditarClick(Sender: TObject);
begin
  dsDentario.DataSet.Edit;
end;

procedure TframDentario.btSalvarClick(Sender: TObject);
begin
  dsDentario.DataSet.Post;
end;

procedure TframDentario.btExcluirClick(Sender: TObject);
begin
  dsDentario.DataSet.Delete;
end;

procedure TframDentario.dsDentarioStateChange(Sender: TObject);
begin
  Bloqueia(FbBloqueia);
end;

procedure TframDentario.Bloqueia(bBloqueia: boolean);
var bEditMode:boolean;
begin
  FbBloqueia :=  bBloqueia;
  bEditMode := (dsDentario.DataSet.State in dsEditModes);
  btNovo.Enabled := not bEditMode and not FbBloqueia;
  btEditar.Enabled := not bEditMode and not FbBloqueia;
  btSalvar.Enabled := bEditMode and not FbBloqueia;
  btExcluir.Enabled := not bBloqueia;
end;

end.
