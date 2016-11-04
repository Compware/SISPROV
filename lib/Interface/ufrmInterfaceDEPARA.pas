unit ufrmInterfaceDEPARA;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, CPort;

type
  TfrmInterfaceDePara = class(TForm)
    ComPortDE: TComPort;
    ComPortPARA: TComPort;
    memDE: TMemo;
    memPARA: TMemo;
    btConfigDE: TButton;
    btConfPARA: TButton;
    btAbrirDE: TButton;
    btAbrirPARA: TButton;
    procedure btConfigDEClick(Sender: TObject);
    procedure btConfPARAClick(Sender: TObject);
    procedure ComPortDERxChar(Sender: TObject; Count: Integer);
    procedure ComPortPARARxChar(Sender: TObject; Count: Integer);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmInterfaceDePara: TfrmInterfaceDePara;

implementation

{$R *.dfm}

procedure TfrmInterfaceDePara.btConfigDEClick(Sender: TObject);
begin
  ComPortDE.Close;
  ComPortDE.ShowSetupDialog;
  ComPortDE.StoreSettings(stRegistry, 'HKEY_LOCAL_MACHINE\Software\Interface\DEPARA');
end;

procedure TfrmInterfaceDePara.btConfPARAClick(Sender: TObject);
begin
  ComPortPARA.Close;
  ComPortPARA.LoadSettings(stRegistry, 'HKEY_LOCAL_MACHINE\Software\Interface\DEPARA');
  ComPortPARA.ShowSetupDialog;
end;

procedure TfrmInterfaceDePara.ComPortDERxChar(Sender: TObject; Count: Integer);
var
  Str: String;
begin
  ComPortDE.ReadStr(Str, Count);
  ComPortPARA.WriteStr(Str);
  memDE.Lines.Add(FormatDateTime('hh:ni:ss', time)+ ' - ' + Str);
end;

procedure TfrmInterfaceDePara.ComPortPARARxChar(Sender: TObject; Count: Integer);
var
  Str: String;
begin
  ComPortPARA.ReadStr(Str, Count);
  ComPortDE.WriteStr(Str);
  memPARA.Lines.Add(FormatDateTime('hh:ni:ss', time)+ ' - ' + Str);
end;

end.
