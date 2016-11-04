unit uFrameIntervencaoCirurgica;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, dxCntner, dxEditor, dxEdLib, dxDBELib, StdCtrls, Mask, ToolEdit,
  RXDBCtrl, ExtCtrls, DB, Buttons, Grids, DBGrids, dxExEdtr, dxDBTLCl,
  dxGrClms, dxDBGrid, dxTL, dxDBCtrl;

type
  TframIntervencaoCirurgica = class(TFrame)
    Panel1: TPanel;
    Label13: TLabel;
    dsIntevCirurgica: TDataSource;
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
    procedure dsIntevCirurgicaStateChange(Sender: TObject);
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

procedure TframIntervencaoCirurgica.btNovoClick(Sender: TObject);
begin
  dsIntevCirurgica.DataSet.Insert;
end;

procedure TframIntervencaoCirurgica.btEditarClick(Sender: TObject);
begin
  dsIntevCirurgica.DataSet.Edit;
end;

procedure TframIntervencaoCirurgica.btSalvarClick(Sender: TObject);
begin
  dsIntevCirurgica.DataSet.Post;
end;

procedure TframIntervencaoCirurgica.btExcluirClick(Sender: TObject);
begin
  dsIntevCirurgica.DataSet.Delete;
end;

procedure TframIntervencaoCirurgica.dsIntevCirurgicaStateChange(
  Sender: TObject);
begin
  Bloqueia(FbBloqueia);
end;

procedure TframIntervencaoCirurgica.Bloqueia(bBloqueia: boolean);
var bEditMode:boolean;
begin
  FbBloqueia :=  bBloqueia;
  bEditMode := (dsIntevCirurgica.DataSet.State in dsEditModes);
  btNovo.Enabled := not bEditMode and not FbBloqueia;
  btEditar.Enabled := not bEditMode and not FbBloqueia;
  btSalvar.Enabled := bEditMode and not FbBloqueia;
  btExcluir.Enabled := not bBloqueia;
end;

end.
