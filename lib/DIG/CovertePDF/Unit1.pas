unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  WPPDFR1_src, WPPDFWP, WPRTEDefs, WPCTRMemo, WPCTRRich, StdCtrls;

type
  TConvertePDF = class(TForm)
    editor: TWPRichText;
    pdf: TWPPDFExport;
    btn1: TButton;
    btn2: TButton;
    procedure btn1Click(Sender: TObject);
    procedure btn2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    function Carregar(sFile: string): boolean;
    function Converter(sFile: string): boolean;
  end;

var
  ConvertePDF: TConvertePDF;

implementation

{$R *.DFM}

function TConvertePDF.Carregar(sFile: string): boolean;
begin
  try
    editor.Clear;
    editor.LoadFromFile(sFile);
    result := True;
  except
    on e: Exception do
    begin
      result := False;
      ShowMessage(e.Message);
    end;
  end;
end;

function TConvertePDF.Converter(sFile: string): boolean;
begin
  try
    pdf.Source := editor;
    pdf.Filename := sFile;
    pdf.Execute;
    result := True;
  except
    on e: Exception do
    begin
      result := False;
      ShowMessage(e.Message);
    end;
  end;
end;

procedure TConvertePDF.btn1Click(Sender: TObject);
var
  sFile, sFileTo: string;
begin
  sFile := 'c:\temp\teste.rtf';
  sFileTo := 'c:\temp\converter.rtf';
  CopyFile(PChar(sFile), PChar(sFileTo), False);
  Carregar(sFileTo);
end;

procedure TConvertePDF.btn2Click(Sender: TObject);
var
  sFile: string;
begin
  sFile := 'c:\temp\teste.pdf';
  if FileExists(sFile) then
    DeleteFile(sFile);
  Converter('c:\temp\teste.pdf');
  sFile := 'c:\temp\converter.rtf';
  if FileExists(sFile) then
    DeleteFile(sFile);
end;

end.

