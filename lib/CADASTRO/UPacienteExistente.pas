unit UPacienteExistente;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Buttons, Grids, DBGrids;

type
  TfrmPacienteExistente = class(TForm)
    Panel1: TPanel;
    Image1: TImage;
    Label1: TLabel;
    Panel2: TPanel;
    Panel3: TPanel;
    DBGrid1: TDBGrid;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPacienteExistente: TfrmPacienteExistente;

implementation


{$R *.dfm}

procedure TfrmPacienteExistente.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  if odd(TDBGrid(Sender).DataSource.DataSet.RecNo) then
    DBGrid1.Canvas.Brush.Color:= clmenubar
  else
    DBGrid1.Canvas.Brush.Color:= clCream;

  TDbGrid(Sender).Canvas.font.Color:= clBlack;

  if gdSelected in State then
    with (Sender as TDBGrid).Canvas do
      begin
      Brush.Color := clmoneygreen;
      FillRect(Rect);
      Font.Style := [fsbold]
      end;

  TDbGrid(Sender).DefaultDrawDataCell(Rect, TDbGrid(Sender).columns[datacol].field, State);

end;

end.
