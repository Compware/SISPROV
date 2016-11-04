unit uFrameTatuagem;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, dxCntner, dxEditor, dxEdLib, dxDBELib, StdCtrls, Mask, ToolEdit,
  RXDBCtrl, ExtCtrls, DB, Buttons, Grids, DBGrids, dxExEdtr, dxDBTLCl,
  dxGrClms, dxDBGrid, dxTL, dxDBCtrl;

type
  TframTatuagem = class(TFrame)
    Panel1: TPanel;
    Label13: TLabel;
    dsTatuagem: TDataSource;
    Panel2: TPanel;
    btNovo: TSpeedButton;
    btEditar: TSpeedButton;
    btSalvar: TSpeedButton;
    btExcluir: TSpeedButton;
    dxDBGrid1: TdxDBGrid;
    dxDBGrid1CD_TATUAGEM: TdxDBGridMaskColumn;
    dxDBGrid1CD_FICHA: TdxDBGridColumn;
    dxDBGrid1DT_TATUAGEM: TdxDBGridDateColumn;
    procedure btNovoClick(Sender: TObject);
    procedure btEditarClick(Sender: TObject);
    procedure btSalvarClick(Sender: TObject);
    procedure btExcluirClick(Sender: TObject);
    procedure dsTatuagemStateChange(Sender: TObject);
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

procedure TframTatuagem.btNovoClick(Sender: TObject);
begin
  dsTatuagem.DataSet.Insert;
end;

procedure TframTatuagem.btEditarClick(Sender: TObject);
begin
  dsTatuagem.DataSet.Edit;
end;

procedure TframTatuagem.btSalvarClick(Sender: TObject);
begin
  dsTatuagem.DataSet.Post;
end;

procedure TframTatuagem.btExcluirClick(Sender: TObject);
begin
  dsTatuagem.DataSet.Delete;
end;

procedure TframTatuagem.dsTatuagemStateChange(Sender: TObject);
begin
  Bloqueia(FbBloqueia);
end;

procedure TframTatuagem.Bloqueia(bBloqueia: boolean);
var bEditMode:boolean;
begin
  FbBloqueia :=  bBloqueia;
  bEditMode := (dsTatuagem.DataSet.State in dsEditModes);
  btNovo.Enabled := not bEditMode and not FbBloqueia;
  btEditar.Enabled := not bEditMode and not FbBloqueia;
  btSalvar.Enabled := bEditMode and not FbBloqueia;
  btExcluir.Enabled := not bBloqueia;
end;

end.
