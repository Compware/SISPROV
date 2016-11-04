unit UProcessoExistente;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, DB, ExtCtrls, StdCtrls, Buttons, DBCtrls;

type
  TfrmProcessoExistente = class(TForm)
    Panel1: TPanel;
    DBGrid1: TDBGrid;
    Panel2: TPanel;
    Label1: TLabel;
    Image1: TImage;
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
  frmProcessoExistente: TfrmProcessoExistente;

implementation

{$R *.dfm}

procedure TfrmProcessoExistente.DBGrid1DrawColumnCell(Sender: TObject;
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
      Brush.Color := clSkyBlue;
      FillRect(Rect);
      Font.Style := [fsbold]
      end;

  TDbGrid(Sender).DefaultDrawDataCell(Rect, TDbGrid(Sender).columns[datacol].field, State);


end;

end.
