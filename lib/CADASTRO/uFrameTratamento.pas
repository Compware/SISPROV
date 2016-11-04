unit uFrameTratamento;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, dxCntner, dxEditor, dxEdLib, dxDBELib, StdCtrls, Mask, ToolEdit,
  RXDBCtrl, ExtCtrls, DB, Buttons, Grids, DBGrids, dxExEdtr, dxDBTLCl,
  dxGrClms, dxDBGrid, dxTL, dxDBCtrl;

type
  TframTratamento = class(TFrame)
    Panel1: TPanel;
    Label13: TLabel;
    dsTratamento: TDataSource;
    Panel2: TPanel;
    btNovo: TSpeedButton;
    btEditar: TSpeedButton;
    btSalvar: TSpeedButton;
    btExcluir: TSpeedButton;
    dxDBGrid1: TdxDBGrid;
    dxDBGrid1CD_INTERV_CIRURGICA: TdxDBGridMaskColumn;
    dxDBGrid1CD_FICHA: TdxDBGridColumn;
    dxDBGrid1DT_CIRURGIA: TdxDBGridDateColumn;
    procedure btNovoClick(Sender: TObject);
    procedure btSalvarClick(Sender: TObject);
    procedure btExcluirClick(Sender: TObject);
    procedure btEditarClick(Sender: TObject);
    procedure dsTratamentoStateChange(Sender: TObject);
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

procedure TframTratamento.btNovoClick(Sender: TObject);
begin
  dsTratamento.DataSet.Insert;
end;

procedure TframTratamento.btEditarClick(Sender: TObject);
begin
  dsTratamento.DataSet.Edit;
end;

procedure TframTratamento.btSalvarClick(Sender: TObject);
begin
  dsTratamento.DataSet.Post;
end;

procedure TframTratamento.btExcluirClick(Sender: TObject);
begin
  dsTratamento.DataSet.Delete;
end;

procedure TframTratamento.dsTratamentoStateChange(Sender: TObject);
begin
  Bloqueia(FbBloqueia);
end;

procedure TframTratamento.Bloqueia(bBloqueia: boolean);
var bEditMode:boolean;
begin
  FbBloqueia :=  bBloqueia;
  bEditMode := (dsTratamento.DataSet.State in dsEditModes);
  btNovo.Enabled := not bEditMode and not FbBloqueia;
  btEditar.Enabled := not bEditMode and not FbBloqueia;
  btSalvar.Enabled := bEditMode and not FbBloqueia;
  btExcluir.Enabled := not bBloqueia;
end;

end.
