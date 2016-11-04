unit UfrmStatus;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, jpeg, ExtCtrls, RXCtrls, StdCtrls, ComCtrls;

type
  TfrmStatus = class(TForm)
    Image1: TImage;
    pbStatus: TProgressBar;
    lbStatus: TLabel;
    mmLog: TMemo;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmStatus: TfrmStatus;

implementation

{$R *.dfm}

end.
