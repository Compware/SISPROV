unit ufrmDlgStatus;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls;

type
  TfrmDlgStatus = class(TForm)
    pbStatus: TProgressBar;
    lbStatus: TLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmDlgStatus: TfrmDlgStatus;

implementation

{$R *.dfm}

end.
