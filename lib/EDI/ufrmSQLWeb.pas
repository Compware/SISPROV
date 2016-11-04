unit ufrmSQLWeb;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons, OleCtrls, SHDocVw;

type
  TfrmSQL = class(TForm)
    mmSQL: TMemo;
    web: TWebBrowser;
    Panel1: TPanel;
    btExecutar: TBitBtn;
    Splitter1: TSplitter;
    rbSelect: TRadioButton;
    rbQuery: TRadioButton;
    procedure btExecutarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSQL: TfrmSQL;

implementation

uses ufrmMenuEDI, UGeral;

{$R *.dfm}

procedure TfrmSQL.btExecutarClick(Sender: TObject);
var sNome, sOP:string; sFile:TStrings;
begin
  try
    if rbSelect.Checked then
      sOP := 'S';
    if rbQuery.Checked then
      sOP := 'Q';

    sFile := TStringList.Create;
    sFile.Text := frmMenuEDI.Get(sDominio + '/dbSQL.php?op='+sOP+'&sql=' +
            mmSQl.Text);
    sNome := sPathTemp+'tmpSQL.html';
    sFile.SaveToFile(sNome);
    web.Navigate(sNome);
  except
    sFile.Free;
  end;
end;

end.
