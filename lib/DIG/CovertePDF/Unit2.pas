unit Unit2;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, uspViewPDF, uspWPViewPDFCompatible;

type
  TForm2 = class(TForm)
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

var
  Form2: TForm2;

implementation

{$R *.DFM}

function Carregar(sFile: string): boolean; stdcall; external 'ConvertePDF.dll';
function Converter(sFile: string): boolean; stdcall; external 'ConvertePDF.dll';
procedure Abrir(bShow: boolean); stdcall; external 'ConvertePDF.dll';
procedure Fechar; stdcall; external 'ConvertePDF.dll';
procedure CarregarBt; stdcall; external 'ConvertePDF.dll';
procedure ConverterBt; stdcall; external 'ConvertePDF.dll';

procedure TForm2.btn1Click(Sender: TObject);
begin
  Carregar('c:\temp\teste.rtf');
end;

procedure TForm2.btn2Click(Sender: TObject);
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

procedure TForm2.btn4Click(Sender: TObject);
begin
  Fechar;
end;

procedure TForm2.btn5Click(Sender: TObject);
begin
  CarregarBt;
end;

procedure TForm2.btn6Click(Sender: TObject);
begin
  ConverterBt;
end;

procedure TForm2.btn7Click(Sender: TObject);
begin
  Abrir(True);
end;

end.

