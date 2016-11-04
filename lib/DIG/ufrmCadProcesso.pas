unit ufrmCadProcesso;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UfrmCadPad, dxExEdtr, uframeDigPaciente,
  DB, dxCntner, dxTL, dxDBCtrl, dxDBGrid, ComCtrls, StdCtrls, Buttons, ExtCtrls;

type
  TfrmCadProcesso = class(TfrmCadPad)
    framPaciente1: TframDigPaciente;
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    fnProcesso:integer;
  end;

var
  frmCadProcesso: TfrmCadProcesso;

implementation

uses UDMDIG;

{$R *.dfm}

procedure TfrmCadProcesso.FormShow(Sender: TObject);
begin
  inherited;
  pgGeral.ActivePage := tabGeral;
  if fnProcesso > -999 then
  begin
    btIncluirClick(sender);
    dsControle.DataSet.FieldByName('NR_PROCESSO').AsInteger := fnProcesso;
  end;
end;

procedure TfrmCadProcesso.FormCreate(Sender: TObject);
begin
  inherited;
  fnProcesso := -999;
end;

end.
