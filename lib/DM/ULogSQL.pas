unit ULogSQL;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls;

type
  TfrmLogSQL = class(TForm)
    mmLog: TMemo;
    Panel1: TPanel;
    btLimpar: TButton;
    procedure btLimparClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmLogSQL: TfrmLogSQL;

implementation

uses UDMGERAL;

{$R *.dfm}

procedure TfrmLogSQL.btLimparClick(Sender: TObject);
begin
  dmGeral.LogSQL.Clear;
  mmLog.Clear;
end;

end.
