unit uFramePerfuracao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, dxCntner, dxEditor, dxEdLib, dxDBELib, StdCtrls, Mask, ToolEdit,
  RXDBCtrl, ExtCtrls, DB, Buttons, Grids, DBGrids, dxExEdtr, dxDBTLCl,
  dxGrClms, dxDBGrid, dxTL, dxDBCtrl;

type
  TframPerfuracao = class(TFrame)
    Panel1: TPanel;
    Label13: TLabel;
    dsPerfuracao: TDataSource;
    Panel2: TPanel;
    btNovo: TSpeedButton;
    btEditar: TSpeedButton;
    btSalvar: TSpeedButton;
    btExcluir: TSpeedButton;
    dxDBGrid1: TdxDBGrid;
    dxDBGrid1CD_PERFURACAO: TdxDBGridMaskColumn;
    dxDBGrid1CD_FICHA: TdxDBGridColumn;
    dxDBGrid1DT_PERFURACAO: TdxDBGridDateColumn;
    procedure btNovoClick(Sender: TObject);
    procedure btEditarClick(Sender: TObject);
    procedure btSalvarClick(Sender: TObject);
    procedure btExcluirClick(Sender: TObject);
    procedure dsPerfuracaoStateChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    FbBloqueia: boolean;
    procedure Bloqueia(bBloqueia:boolean);
  end;

implementation

uses UDMGERAL;

{$R *.dfm}

procedure TframPerfuracao.btNovoClick(Sender: TObject);
begin
  dsPerfuracao.DataSet.Insert;
end;

procedure TframPerfuracao.btEditarClick(Sender: TObject);
begin
  dsPerfuracao.DataSet.Edit;
end;

procedure TframPerfuracao.btSalvarClick(Sender: TObject);
begin
  dsPerfuracao.DataSet.Post;
end;

procedure TframPerfuracao.btExcluirClick(Sender: TObject);
begin
  dsPerfuracao.DataSet.Delete;
end;

procedure TframPerfuracao.dsPerfuracaoStateChange(Sender: TObject);
begin
  Bloqueia(FbBloqueia);
end;

procedure TframPerfuracao.Bloqueia(bBloqueia: boolean);
var bEditMode:boolean;
begin
  FbBloqueia :=  bBloqueia;
  bEditMode := (dsPerfuracao.DataSet.State in dsEditModes);
  btNovo.Enabled := not bEditMode and not FbBloqueia;
  btEditar.Enabled := not bEditMode and not FbBloqueia;
  btSalvar.Enabled := bEditMode and not FbBloqueia;
  btExcluir.Enabled := not bBloqueia;
end;

end.
