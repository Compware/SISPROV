unit uConvertePDFJPG;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uspViewPDF, uspWPViewPDFCompatible, ExtCtrls, StdCtrls, FileCtrl,
  Buttons, JPEG, ComCtrls;

type
  TfrmConvertePDFJPG = class(TForm)
    lsArquivos: TFileListBox;
    ScrollBox1: TScrollBox;
    Image1: TImage;
    spViewPDF1: TspWPViewPDFCompatible;
    btConverter: TBitBtn;
    mmArquivo: TMemo;
    ProgressBar1: TProgressBar;
    Timer1: TTimer;
    procedure btConverterClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    function ConverterPDFTXT:Boolean;
    function ConverterPDFJPG:Boolean;
    function ConverterJPGTXT:Boolean;
    function MoveArquivos:Boolean;
    function Mover(sDe,sPara:String):Boolean;
    procedure FecharViewer;
  end;

var
  frmConvertePDFJPG: TfrmConvertePDFJPG;
  sPDF, sJPG, sTXT : string;

implementation

{$R *.dfm}

function TfrmConvertePDFJPG.ConverterJPGTXT:Boolean;
var sCmd,sFile,sFileN,sPath:string; ct:integer;
begin
  try
    ct := 0;
    sFile := lsArquivos.Directory + '\' + sJPG;
    sCmd := 'c:\Compware\ocr.exe "' + sFile + '"';
    FecharViewer;
    WinExec(pchar(sCmd),0);
    sFile := lsArquivos.Directory + '\' + sTXT;
    while not FileExists(sFile) do
    begin
       inc(ct);
       if ct > 3 then
       begin
         FecharViewer;
         raise Exception.Create('Erro');
       end;
       sleep(1000);
    end;
    result := true;
    FecharViewer;
  except
    result := false;

    sPath := lsArquivos.Directory + '\Erro';
    if not DirectoryExists(sPath) then
     MkDir(sPath);

    sFile  := lsArquivos.Directory + '\' + sPDF;
    sFileN := sPath + '\' + sPDF;
    Mover(sFile, sFileN);

    sFile  := lsArquivos.Directory + '\' + sJPG;
    sFileN := sPath + '\' + sJPG;
    Mover(sFile, sFileN);

    sFile  := lsArquivos.Directory + '\' + sTXT;
    sFileN := sPath + '\' + sTXT;
    Mover(sFile, sFileN);

  end;
end;

function TfrmConvertePDFJPG.ConverterPDFJPG:Boolean;
var ms:TMemoryStream; FJPEGImage:TJPEGImage; sLog:string;
begin
  FJPEGImage := TJPEGImage.Create;
  ms := TMemoryStream.Create;
  try
      spViewPDF1.LoadFromFile(sPDF);
      Image1.Picture := nil;
      Image1.Width := spViewPDF1.GetPBox.Width;
      Image1.Height := spViewPDF1.GetPBox.Height;
      spViewPDF1.RenderizaPagina2(image1.Canvas.Handle);
      FJPEGImage.ProgressiveEncoding := True;
      FJPEGImage.PixelFormat := jf24Bit;
      FJPEGImage.Assign(image1.Picture.Bitmap);
      FJPEGImage.SaveToFile(sJPG);
  finally
    ms.free;
    FJPEGImage.free;
  end;
end;

procedure TfrmConvertePDFJPG.btConverterClick(Sender: TObject);
var i:integer;  sDir:String;
begin
   sDir := lsArquivos.Directory;
   lsArquivos.Directory := 'C:\Compware';
   lsArquivos.Directory := 'C:\Compware\Pdf-Interface\Erro';
   lsArquivos.Directory := 'x:\'; //sDir;
   ProgressBar1.Max := lsArquivos.Items.Count;
   for i := lsArquivos.Items.Count-1 DownTo 0 do
   begin
     Application.ProcessMessages;
     ProgressBar1.Position := i;
     lsArquivos.Refresh;
     sPDF := lsArquivos.Items[i];
     sJPG := StringReplace(sPDF,'.pdf','.jpg',[]);
     sTXT := StringReplace(sJPG,'.jpg','.txt',[]);
     if FileExists(sPDF) then
       ConverterPDFTXT;
     {
     if FileExists(sPDF) then
       ConverterPDFJPG;

     if FileExists(sJPG) then
       ConverterJPGTXT;
     }
     if FileExists(sTXT) then
       MoveArquivos;
   end;

   FecharViewer;
end;

function TfrmConvertePDFJPG.MoveArquivos: Boolean;
var sPath, sFile, sFileN:String;
begin
   mmArquivo.lines.LoadFromFile(sTXT);
   sPath := lsArquivos.Directory;

   if pos('XT-1800i-1',mmArquivo.Text)>0 then
   begin
       sPath := sPath + '\XT1800';
       if not DirectoryExists(sPath) then
         MkDir(sPath);
   end
   else if pos('Hospital Esperança',mmArquivo.Text)>0 then
   begin
       sPath := sPath + '\P80';
       if not DirectoryExists(sPath) then
         MkDir(sPath);
   end
   else
   begin
       sPath := sPath + '\Erro';
       if not DirectoryExists(sPath) then
         MkDir(sPath);
   end;

   spViewPDF1.Clear;
   mmArquivo.Lines.Clear;
   Image1.Picture := nil;

   sFile  := sPDF;
   sFileN := sPath + '\' + sPDF;
   Mover(sFile, sFileN);

   sFile  := sJPG;
   sFileN := sPath + '\' + sJPG;
   Mover(sFile, sFileN);

   sFile  := sTXT;
   sFileN := sPath + '\' + sTXT;
   Mover(sFile, sFileN);
end;

procedure TfrmConvertePDFJPG.FormCreate(Sender: TObject);
begin
  lsArquivos.Directory := 'C:\Compware\Pdf-Interface';
end;

procedure TfrmConvertePDFJPG.Timer1Timer(Sender: TObject);
begin
  Timer1.Enabled := false;
  btConverterClick(sender);
  Timer1.Enabled := true;
end;

function TfrmConvertePDFJPG.Mover(sDe, sPara: String): Boolean;
begin
   if FileExists(sPara) then
     DeleteFile(pChar(sPara));
   MoveFile(pChar(sDe), pChar(sPara));
end;

procedure TfrmConvertePDFJPG.FecharViewer;
var hd : HWND;
begin
   repeat
     hd := FindWindow(nil, 'viewer');
     PostMessage( hd, WM_CLOSE,0,0);
   until hd = 0;
end;

function TfrmConvertePDFJPG.ConverterPDFTXT: Boolean;
begin
  try
    spViewPDF1.LoadFromFile(sPDF);
    mmArquivo.Text := spViewPDF1.GetText;
    mmArquivo.Lines.SaveToFile(sTXT);
  finally

  end;
end;

end.
