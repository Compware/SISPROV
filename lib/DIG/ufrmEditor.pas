unit ufrmEditor;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, WPRTEDefs, WPCTRMemo, WPCTRRich, WPTbar, Buttons, imageenio,
  ExtCtrls, printers, WPRuler, WPPanel, ExtDlgs;

type
  TfrmEditor = class(TForm)
    editor: TWPRichText;
    Panel1: TPanel;
    btSalvar: TSpeedButton;
    btSair: TSpeedButton;
    WPRuler1: TWPRuler;
    WPVertRuler1: TWPVertRuler;
    WPToolPanel1: TWPToolPanel;
    WPToolBar2: TWPToolBar;
    WPToolBar1: TWPToolBar;
    WPToolBar3: TWPToolBar;
    Image1: TImage;
    OpenPictureDialog1: TOpenPictureDialog;
    btImagem: TSpeedButton;
    btHorLine: TSpeedButton;
    btCabecalho: TSpeedButton;
    btRodape: TSpeedButton;
    SpeedButton1: TSpeedButton;
    procedure btSalvarClick(Sender: TObject);
    procedure btSairClick(Sender: TObject);
    procedure btImagemClick(Sender: TObject);
    procedure btHorLineClick(Sender: TObject);
    procedure btCabecalhoClick(Sender: TObject);
    procedure btRodapeClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    Documento:integer;
    bPastaDigital:Boolean;
    //procedure ChangeDefaultPrinter(APrinterIndex: Integer);
  end;

var
  frmEditor: TfrmEditor;
  bSalvo, bSalvamentoPendente:Boolean;

implementation

uses UGeral;

{$R *.dfm}

procedure TfrmEditor.btSalvarClick(Sender: TObject);
var lst:TStringList; dix,ix:integer;
begin
  bSalvamentoPendente := editor.Modified;
  bSalvo := not bPastaDigital;
  if bSalvamentoPendente and bPastaDigital then
  begin
    lst := TStringList.Create;
    dix := -1;  ix := -1;
    try
      lst.text := Printer.Printers.Text;
      ix := lst.IndexOf('Doro PDF Writer');
      dix := Printer.PrinterIndex;
      if dix<>ix then
        ChangeDefaultPrinter(ix);
      editor.Print;
      bSalvo := true;
    finally
      if dix<>ix then
        ChangeDefaultPrinter(dix);
      lst.Free;
    end;
  end;
end;

{procedure TfrmEditor.ChangeDefaultPrinter(APrinterIndex: Integer);
var
  Device : array[0..255] of char;
  Driver : array[0..255] of char;
  Port : array[0..255] of char;
  hDeviceMode: THandle;
begin
  Printer.PrinterIndex := APrinterIndex;
  Printer.GetPrinter(Device, Driver, Port, hDeviceMode);
  StrCat( Device, ',');
  StrCat( Device, Driver );
  StrCat( Device, ',');
  StrCat( Device, Port );
  WriteProfileString( 'windows', 'device', Device );
  StrCopy( Device, 'windows' );
  SendMessage( HWND_BROADCAST, WM_WININICHANGE, 0, longint( @Device));
end;}

procedure TfrmEditor.btSairClick(Sender: TObject);
begin
   if bSalvo then
     ModalResult := mrOk
   else
     ModalResult := mrNo;
end;

procedure TfrmEditor.btImagemClick(Sender: TObject);
begin
  if OpenPictureDialog1.Execute then
  begin
    Image1.Picture.LoadFromFile(OpenPictureDialog1.FileName);
    editor.TextObjects.InsertCopy(Image1.Picture.Graphic);
  end;
end;

procedure TfrmEditor.btHorLineClick(Sender: TObject);
begin
  editor.TextObjects.InsertNewObject(wpobjHorizontalLine,false,false).Height := 4;
end;

procedure TfrmEditor.btCabecalhoClick(Sender: TObject);
begin
  editor.WorkOnText := wpHeader;
end;

procedure TfrmEditor.btRodapeClick(Sender: TObject);
begin
  editor.WorkOnText := wpFooter;
end;

procedure TfrmEditor.SpeedButton1Click(Sender: TObject);
var sNome, sMascara:string;
begin
   sNome := InputBox('Campo','Nome','');
   sMascara := InputBox('Campo','Mascara','');
   editor.InputTextFieldName(sNome, sMascara);
end;

end.
