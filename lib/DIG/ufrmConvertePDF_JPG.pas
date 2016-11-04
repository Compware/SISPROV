unit ufrmConvertePDF_JPG;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, uspViewPDF, ExtCtrls, jpeg, uspWPViewPDFCompatible,
  ComCtrls, DB, IBCustomDataSet, DBCtrls;

type
  TfrmConverterPDF_JPG = class(TForm)
    btConverter: TButton;
    ScrollBox1: TScrollBox;
    spViewPDF1: TspWPViewPDFCompatible;
    Image1: TImage;
    ProgressBar1: TProgressBar;
    tbDig_Arquivo: TIBDataSet;
    tbDig_ArquivoCD_ARQUIVO: TIntegerField;
    tbDig_ArquivoBL_ARQUIVO: TBlobField;
    tbDig_ArquivoDS_ARQUIVO: TIBStringField;
    mmLog: TMemo;
    DataSource1: TDataSource;
    DBNavigator1: TDBNavigator;
    StatusBar1: TStatusBar;
    Button1: TButton;
    procedure btConverterClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DBNavigator1Click(Sender: TObject; Button: TNavigateBtn);
    procedure tbDig_ArquivoBeforeOpen(DataSet: TDataSet);
    procedure Button1Click(Sender: TObject);
    procedure ConverterPDFJPG(sPDF, sJPG:string);
  private
    { Private declarations }
  public
    { Public declarations }
    bExterno: boolean;
  end;

var
  frmConverterPDF_JPG: TfrmConverterPDF_JPG;
  bParar:Boolean;

implementation

uses UDMDIG, UDM;

{$R *.dfm}

procedure TfrmConverterPDF_JPG.btConverterClick(Sender: TObject);
var ms:TMemoryStream; FJPEGImage:TJPEGImage; sLog:string;
begin
  bParar := false;
  FJPEGImage := TJPEGImage.Create;
  ms := TMemoryStream.Create;
  try
    tbDig_Arquivo.Last;
    ProgressBar1.Max := tbDig_Arquivo.RecordCount;
    StatusBar1.SimpleText := Format('Total de Registros: %d Lidos: %d',[
      ProgressBar1.Max, ProgressBar1.Position]);
    tbDig_Arquivo.First;
    while not tbDig_Arquivo.Eof do
    begin

      if bParar then Break;
      Application.ProcessMessages;
      ProgressBar1.Position := tbDig_Arquivo.RecNo;
      StatusBar1.SimpleText := Format('Total de Registros: %d Lidos: %d',[
         ProgressBar1.Max, ProgressBar1.Position]);
      Update;
      ms.SetSize(0);
      sLog := FormatDateTime('dd/mm hh:nn:ss - ', now) + ' Arquivo :' +
              tbDig_ArquivoCD_ARQUIVO.AsString + ' - ';
      tbDig_ArquivoBL_ARQUIVO.SaveToStream(ms);
      ms.Position := 0;
      sLog := sLog + 'Old:(' + FormatFloat('0.00', ms.Size / 1024) + ' kb)';
      spViewPDF1.LoadFromStream(ms,0);
      Image1.Picture := nil;
      Image1.Width := spViewPDF1.GetPBox.Width;
      Image1.Height := spViewPDF1.GetPBox.Height;
      spViewPDF1.RenderizaPagina2(image1.Canvas.Handle);
      FJPEGImage.ProgressiveEncoding := True;
      FJPEGImage.PixelFormat := jf24Bit;
      FJPEGImage.Assign(image1.Picture.Bitmap);
      ms.SetSize(0);
      FJPEGImage.SaveToStream(ms);
      ms.Position := 0;
      sLog := sLog + ' New:(' + FormatFloat('0.00', ms.Size / 1024) + ' kb)';
      tbDig_Arquivo.Edit;
      tbDig_ArquivoBL_ARQUIVO.LoadFromStream(ms);
      tbDig_Arquivo.Post;
      ms.SetSize(0);
      tbDig_Arquivo.Next;
      dm.Commit(tbDig_Arquivo);
      mmLog.Lines.Add(sLog);
    end;
  finally
    ms.free;
    FJPEGImage.free;
    mmLog.Lines.SaveToFile('c:\compware\banco\Convert.log');
  end;
end;

procedure TfrmConverterPDF_JPG.FormCreate(Sender: TObject);
begin
  if not bExterno then
    tbDig_Arquivo.Open;
end;

procedure TfrmConverterPDF_JPG.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if not bExterno then
    tbDig_Arquivo.Close;
end;

procedure TfrmConverterPDF_JPG.DBNavigator1Click(Sender: TObject;
  Button: TNavigateBtn);
var ms:TMemoryStream; jpg:TJPEGImage;
begin
  ms := TMemoryStream.Create;
  jpg := TJPEGImage.Create;
  tbDig_ArquivoBL_ARQUIVO.SaveToStream(ms);
  ms.Position := 0;
  jpg.LoadFromStream(ms);
  Image1.Height := jpg.Height;
  Image1.Width := jpg.Width;
  Image1.Canvas.Draw(0,0,jpg);
  ms.Free;
  jpg.Free;
end;

procedure TfrmConverterPDF_JPG.tbDig_ArquivoBeforeOpen(DataSet: TDataSet);
begin
  StatusBar1.SimpleText := tbDig_Arquivo.Database.DatabaseName;
end;

procedure TfrmConverterPDF_JPG.Button1Click(Sender: TObject);
begin
  bParar := true;
end;

procedure TfrmConverterPDF_JPG.ConverterPDFJPG(sPDF, sJPG: string);
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

end.
