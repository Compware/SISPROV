unit ufrmInterfaceConfig;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, CPort;

type
  TfrmInterfaceConfig = class(TForm)
    ComPortAbacus: TComPort;
    ComPortKx21: TComPort;
    GroupBox1: TGroupBox;
    btConfigurarAbacus: TButton;
    shPortaAbacus: TShape;
    lbPortaAbacus: TLabel;
    GroupBox2: TGroupBox;
    shPortaKx21: TShape;
    lbPortaKx21: TLabel;
    btConfigurarKx21: TButton;
    Panel1: TPanel;
    mmLog: TMemo;
    mmLog2: TMemo;
    Splitter1: TSplitter;
    procedure btConfigurarAbacusClick(Sender: TObject);
    procedure btConfigurarKx21Click(Sender: TObject);
    procedure ComPortAbacusAfterClose(Sender: TObject);
    procedure ComPortKx21AfterClose(Sender: TObject);
    procedure ComPortKx21AfterOpen(Sender: TObject);
    procedure ComPortAbacusAfterOpen(Sender: TObject);
    procedure ComPortAbacusRxChar(Sender: TObject; Count: Integer);
    procedure ComPortKx21RxChar(Sender: TObject; Count: Integer);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmInterfaceConfig: TfrmInterfaceConfig;
  sIN: string;
  bInicio, bFim:boolean;
  cnt:integer;
  
implementation

{$R *.dfm}

procedure TfrmInterfaceConfig.btConfigurarAbacusClick(Sender: TObject);
begin
  ComPortAbacus.Close;
  ComPortAbacus.ShowSetupDialog;
  ComPortAbacus.StoreSettings(stRegistry, 'HKEY_LOCAL_MACHINE\Software\Interface\ABACUS');
  ComPortAbacus.Open;
end;

procedure TfrmInterfaceConfig.btConfigurarKx21Click(Sender: TObject);
begin
  ComPortKx21.Close;
  ComPortKx21.ShowSetupDialog;
  ComPortKx21.StoreSettings(stRegistry, 'HKEY_LOCAL_MACHINE\Software\Interface\KX21N');
  ComPortKx21.Open;
end;

procedure TfrmInterfaceConfig.ComPortAbacusAfterClose(Sender: TObject);
begin
  shPortaAbacus.Brush.Color := clRed;
end;

procedure TfrmInterfaceConfig.ComPortKx21AfterClose(Sender: TObject);
begin
  shPortaKx21.Brush.Color := clRed;
end;

procedure TfrmInterfaceConfig.ComPortKx21AfterOpen(Sender: TObject);
begin
  shPortaKx21.Brush.Color := clLime;
  lbPortaKx21.Caption := ComPortKx21.Port;
end;

procedure TfrmInterfaceConfig.ComPortAbacusAfterOpen(Sender: TObject);
begin
  shPortaAbacus.Brush.Color := clLime;
  lbPortaAbacus.Caption := ComPortAbacus.Port;
end;

procedure TfrmInterfaceConfig.ComPortAbacusRxChar(Sender: TObject;
  Count: Integer);
var
  Str, arq: String; ls:TStringList;
begin
  try
    ComPortAbacus.ReadStr(Str, Count);
    sIN := sIN + str;

    //if Pos(chr(1),str)>0 then
    //   mmLog.Lines.Add('****SOH****');

    if Pos(chr(2),str)>0 then
    begin
       //mmLog.Lines.Add('****STX****');
       bInicio := true;
       bFim := false;
    end;

    if Pos(chr(4),str)>0 then
    begin
       //mmLog.Lines.Add('****EOT****');
       bFim := true;
       bInicio := false;
    end;

    //if Pos(chr(3),str)>0 then
    //   mmLog.Lines.Add('****ETX****');

    if Pos(chr(5),str)>0 then
    begin
      ComPortAbacus.TransmitChar(chr(6));
      //mmLog.Lines.Add('****ACK****'+chr(6));
    end;

    if bFim then
    begin
      inc(cnt);
      //mmLog2.Lines.Add('****************');
      if (cnt = 2) then
      begin
        //mmLog.Lines.Clear;
        //mmLog2.Lines.Clear;
        //mmLog2.Lines.Add(sIN);
        ls := TStringList.Create;
        ls.Add(sIN);
        arq := 'c:\compware\abacus\'+
          formatdatetime('ddmmyyyyhhnnss',now)+'.txt';
        //mmLog2.Lines.SaveToFile(arq);
        ls.SaveToFile(arq);
        ls.Free;
        //Insere(sIN);
        sIN := '';
        bFim := false;
        cnt := 0;
      end;
    end;

  except
    on E:Exception do
      mmLog.Lines.Add(e.Message);
  end;
end;

procedure TfrmInterfaceConfig.ComPortKx21RxChar(Sender: TObject;
  Count: Integer);
var
  Str, arq: String; ls :TStringList;
begin
  ComPortKx21.ReadStr(Str, Count);

  if Pos(chr(5),str)>0 then
  begin
    //ShowMessage('Enviando AKC('+chr(6)+')');
    ComPortKx21.TransmitChar(chr(6))
  end;

  if Pos(chr(2),str)>0 then
  begin
     bInicio := True;
     bFim := False;
     sIN := '';
  end;

  if Pos(chr(3),str)>0 then
  begin
     bInicio := False;
     bFim := True;
  end;

  sIN := sIN + str;

  if bFim then
  begin
    ls := TStringList.Create;
    ls.Add(sIN);
    arq := 'c:\compware\KX21\'+
      formatdatetime('ddmmyyyyhhnnss',now)+'.txt';
    ls.SaveToFile(arq);
    ls.Free;
    sIN := '';
  end;

end;

procedure TfrmInterfaceConfig.FormCreate(Sender: TObject);
begin
   ComPortAbacus.LoadSettings(stRegistry, 'HKEY_LOCAL_MACHINE\Software\Interface\ABACUS');
   ComPortKx21.LoadSettings(stRegistry, 'HKEY_LOCAL_MACHINE\Software\Interface\KX21N');
   try
     ComPortAbacus.Open;
   except
     on E:Exception do
       //ShowMessage('Erro:' + e.Message);
   end;

   try
     ComPortKx21.Open;
   except
     on E:Exception do
       //ShowMessage('Erro:' + e.Message);
   end;
end;

procedure TfrmInterfaceConfig.FormDestroy(Sender: TObject);
begin
  ComPortAbacus.Close;
  ComPortKx21.Close;
end;

end.
