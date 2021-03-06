unit UfrmCadBase;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, dxExEdtr, dxEdLib, dxEditor, dxDBELib, dxCntner, StdCtrls;

type
  TfrmCadBase = class(TForm)
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure ObjetosEditEmMaiusculos(Sender: TControl);
    procedure DesenhaBordas(Area: TCanvas; Rect:TRect);
  end;

var
  frmCadBase: TfrmCadBase;

implementation

uses Types;

{$R *.dfm}

procedure TfrmCadBase.DesenhaBordas(Area: TCanvas; Rect:TRect);
var r:TRect; 
begin
  r := Rect;
  with (Area) do
  begin
    Pen.Width := 2;
    Pen.Color := clWhite;
    //Polyline([Point(r.Left,r.top),Point(r.Left,r.Bottom)]);
    Polyline([Point(r.Left,r.top),Point(r.Right-2,r.Top)]);
    Pen.Color := cl3DDkShadow;
    Polyline([Point(r.Left,r.Bottom),Point(r.Right,r.Bottom)]);
    Polyline([Point(r.Right,r.top),Point(r.Right,r.Bottom)]);
  end;
end;

procedure TfrmCadBase.FormCreate(Sender: TObject);
begin
  ObjetosEditEmMaiusculos(self);
end;

procedure TfrmCadBase.ObjetosEditEmMaiusculos(Sender: TControl);
var i:integer;
begin

  for i:=0 to Sender.ComponentCount-1 do
  begin
    if (Sender.Components[i] is TdxDBButtonEdit) then
      (Sender.Components[i] as TdxDBButtonEdit).CharCase := ecUpperCase;

    if (Sender.Components[i] is TdxEdit) then
      (Sender.Components[i] as TdxEdit).CharCase := ecUpperCase;

    if (Sender.Components[i] is TdxDBEdit) then
      (Sender.Components[i] as TdxDBEdit).CharCase := ecUpperCase;

    if (Sender.Components[i] is TdxDBMemo) then
      (Sender.Components[i] as TdxDBMemo).CharCase := ecUpperCase;

    if (Sender.Components[i] is TFrame) then
      ObjetosEditEmMaiusculos((Sender.Components[i] as TFrame));
  end;
end;

end.
