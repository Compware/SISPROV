unit ufrmConvertePDF;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, uspViewPDF, uspWPViewPDFCompatible;

type
  TfrmConvertePDF = class(TForm)
    btn1: TButton;
    btn2: TButton;
    btn4: TButton;
    btn5: TButton;
    btn6: TButton;
    btn7: TButton;
    pdf: TspWPViewPDFCompatible;
    procedure btn1Click(Sender: TObject);
    procedure btn2Click(Sender: TObject);
    procedure btn4Click(Sender: TObject);
    procedure btn5Click(Sender: TObject);
    procedure btn6Click(Sender: TObject);
    procedure btn7Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

function Carregar(sFile: string): boolean; stdcall;
function Converter(sFile: string): boolean; stdcall;
procedure Abrir(bShow: boolean); stdcall;
procedure Fechar; stdcall;
procedure CarregarBt; stdcall;
procedure ConverterBt; stdcall;

var
  frmConvertePDF: TfrmConvertePDF;

implementation

{$R *.DFM}

function Carregar(sFile: string): boolean; stdcall; external 'ConvertePDF.dll';
function Converter(sFile: string): boolean; stdcall; external 'ConvertePDF.dll';
procedure Abrir(bShow: boolean); stdcall; external 'ConvertePDF.dll';
procedure Fechar; stdcall; external 'ConvertePDF.dll';
procedure CarregarBt; stdcall; external 'ConvertePDF.dll';
procedure ConverterBt; stdcall; external 'ConvertePDF.dll';

procedure TfrmConvertePDF.btn1Click(Sender: TObject);
begin
  Carregar('c:\temp\teste.rtf');
end;

procedure TfrmConvertePDF.btn2Click(Sender: TObject);
var
  sFile, sFileTo: string;
begin
  sFile := 'c:\temp\teste.pdf';
  sFileTo := 'c:\temp\convertido.pdf';
  if FileExists(sFile) then
    DeleteFile(sFile);
  //if Converter(sFile) then
  ConverterBt;
  begin
    if FileExists(sFile) then
    begin
      CopyFile(PChar(sFile), PChar(sFileTo), False);
      pdf.LoadFromFile(sFileTo);
    end;
  end;
end;

procedure TfrmConvertePDF.btn4Click(Sender: TObject);
begin
  Fechar;
end;

procedure TfrmConvertePDF.btn5Click(Sender: TObject);
begin
  CarregarBt;
end;

procedure TfrmConvertePDF.btn6Click(Sender: TObject);
begin
  ConverterBt;
end;

procedure TfrmConvertePDF.btn7Click(Sender: TObject);
begin
  Abrir(True);
end;

end.

