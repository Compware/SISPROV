unit ufrmDigitalizar;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, ImageEnView, ImageEnIO, ComCtrls, ieview, DBCtrls,
  DB, IBCustomDataSet, IBTable, Grids, DBGrids, ievect, dbimageen,
  dbimageenvect, uspViewPDF, uspWPViewPDFCompatible, iemview, imageenproc,
  imageen, iemio, Menus, Buttons, jpeg, WPPDFR2, WPPDFR1_src, hyieutils,
  hyiedefs, INIFiles;

const
  nPERFILPRETOBRANCO = 1;
  nPERFILCOLORIDO = 2;
  nPERFILTONSCINZA = 3;

type
  TRecStream = Record
    MyStream: array of TMemoryStream;
    Tipo,Dpi,Scanner:string;
    Salvar: array of boolean;
end;

type
  TfrmDigitalizar = class(TForm)
    Panel1: TPanel;
    GroupBox1: TGroupBox;
    CheckBox1: TCheckBox;
    GroupBox2: TGroupBox;
    ComboBox1: TComboBox;
    Label1: TLabel;
    Edit1: TEdit;
    Label2: TLabel;
    Edit2: TEdit;
    Label3: TLabel;
    ComboBox2: TComboBox;
    CheckBox2: TCheckBox;
    GroupBox3: TGroupBox;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Edit3: TEdit;
    Edit4: TEdit;
    Edit5: TEdit;
    Edit6: TEdit;
    Button1: TButton;
    Button2: TButton;
    ProgressBar1: TProgressBar;
    CheckBox3: TCheckBox;
    CheckBox4: TCheckBox;
    CheckBox5: TCheckBox;
    Button3: TButton;
    Panel2: TPanel;
    ImageEnMView1: TImageEnMView;
    CheckBox6: TCheckBox;
    CheckBox7: TCheckBox;
    CheckBox8: TCheckBox;
    ImageEnVect1: TImageEnVect;
    PopupMenu1: TPopupMenu;
    Excluir1: TMenuItem;
    btRotacionar: TSpeedButton;
    Salvar1: TMenuItem;
    ImageEnProc1: TImageEnProc;
    ImageEnView1: TImageEnView;
    btPaginaBranco: TSpeedButton;
    ImageEnView2: TImageEnView;
    edEqual: TEdit;
    Label8: TLabel;
    N1: TMenuItem;
    Abrir1: TMenuItem;
    lbPaginaBranco: TLabel;
    ckSalvarBranco: TCheckBox;
    lbTamanho: TLabel;
    procedure FormActivate(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure ImageEnIO1Progress(Sender: TObject; per: Integer);
    procedure CheckBox5Click(Sender: TObject);
    procedure GroupBox1DblClick(Sender: TObject);
    procedure CheckBox6Click(Sender: TObject);
    procedure CheckBox7Click(Sender: TObject);
    procedure CheckBox8Click(Sender: TObject);
    procedure ImageEnMView1ImageSelect(Sender: TObject; idx: Integer);
    procedure Excluir1Click(Sender: TObject);
    procedure Salvar1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btRotacionarClick(Sender: TObject);
    procedure btPaginaBrancoClick(Sender: TObject);
    procedure Abrir1Click(Sender: TObject);
  private
    { Private declarations }
    procedure evAq(Sender: TObject; ABitmap:TIEBitmap; var Handled:boolean);
    procedure FillBack; // copy twain parameters to the controls
    procedure FillIn; // copy controls to twain parameters
    function Comparar:Boolean;
  public
    { Public declarations }
    vPaginaBranco:Array of Boolean;
    FnLimiarPretoEBranco: Integer;
    FnRemocaoRuido: Integer;
    FJPEGImage: TJPEGImage;
    FBitmap: TBitmap;
    FImageEnIO: TImageEnIO;
    FImageEnProc: TImageEnProc;
    function RetornaStreamDigitalizado(pbRedigitalizar:boolean):TRecStream;
    procedure CriarPDF(var poStream: TMemoryStream; pnCores: integer;
      pnTamanho, pnLargImg, pnAltImg: integer; pnResolucao: integer = 200);
    procedure ConverteBitmapParaJPG(poStream: TMemoryStream);
    procedure ConverteBitmapParaPDF(poStream: TMemoryStream;
      pnPerfilDoc, pnResolucao: integer; pbTransforma: boolean = True);
    procedure InicializaDigitalizacao;
    procedure FinalizaDigitalizacao;
  end;


var
  frmDigitalizar: TfrmDigitalizar;

implementation

uses ufrmDlgStatus, uGeral;

//uses UDM;

{$R *.DFM}
//{$R WindowsXP.RES}

procedure TfrmDigitalizar.FormActivate(Sender: TObject);
var
  i: integer;
begin
  ImageEnMView1.Clear;

  // fills Twain sources
  for i := 0 to ImageEnMView1.MIO.TwainParams.SourceCount - 1 do
    ComboBox1.Items.Add(ImageEnMView1.MIO.TwainParams.SourceName[i]);
  // Select first scanner
  if ComboBox1.Items.Count > 0 then
  begin
    ComboBox1.ItemIndex := 0;
    i := ComboBox1.Items.IndexOf('HP Scanjet 7500 TWAIN');
    if i>-1 then
      ComboBox1.ItemIndex := i;
    ImageEnMView1.MIO.TwainParams.SelectedSource := ComboBox1.ItemIndex;
  end;
  ImageEnMView1.MIO.TwainParams.AppVersionInfo := '1.0';
  ImageEnMView1.MIO.TwainParams.AppManufacturer := 'HiComponents';
  ImageEnMView1.MIO.TwainParams.AppProductFamily := 'Image processing';
  ImageEnMView1.MIO.TwainParams.AppProductName := 'ImageEn demo';
  FillBack;
end;

// Select scanner

procedure TfrmDigitalizar.ComboBox1Change(Sender: TObject);
begin
  //ImageEnMView1.MIO.AcquireParams.SetSource(ieaTwain, ComboBox1.Items[ComboBox1.ItemIndex]);
  ImageEnMView1.MIO.TwainParams.SelectedSource := ComboBox1.ItemIndex;
  FillBack;
end;

// negotiate parameters (verify that scanner supports Frame rectangle, Dpi...)

procedure TfrmDigitalizar.Button2Click(Sender: TObject);
begin
  FillIn;
  ImageEnMView1.MIO.TwainParams.Update; // verify here...
  FillBack;
end;

// copy twain parameters to the controls

procedure TfrmDigitalizar.FillBack;
const
  COLORS: array[0..9] of string = ('Black&White', 'GrayScale', 'RGB', 'Palette', 'CMY', 'CMYK', 'YUV', 'YUVK', 'CIEXYZ', 'LAB');
var
  i, v: integer;
begin
  {Todo:Capturar do INI}
  CheckBox6.Checked := ImageEnMView1.MIO.TwainParams.FeederEnabled;
  CheckBox7.Checked := ImageEnMView1.MIO.TwainParams.AutoFeed;
  CheckBox8.Checked := ImageEnMView1.MIO.TwainParams.DuplexEnabled;

  Edit1.Text := FloatToStr(ImageEnMView1.MIO.TwainParams.YResolution.CurrentValue);
  Edit2.Text := FloatToStr(ImageEnMView1.MIO.TwainParams.XResolution.CurrentValue);
  // Fill Colors (0=B/W 1=GrayScale 2=RGB) combobox
  ComboBox2.Clear;
  for i := 0 to ImageEnMView1.MIO.TwainParams.PixelType.Count - 1 do
  begin
    v := ImageEnMView1.MIO.TwainParams.PixelType[i];
    if v <= high(COLORS) then
      ComboBox2.Items.Add(COLORS[v]);
  end;
  ComboBox2.ItemIndex := ImageEnMView1.MIO.TwainParams.PixelType.IndexOf(ImageEnMView1.MIO.TwainParams.PixelType.CurrentValue);
  // frame
  Edit3.Text := FloatToStr(ImageEnMView1.MIO.TwainParams.AcquireFrameLeft);
  Edit4.Text := FloatToStr(ImageEnMView1.MIO.TwainParams.AcquireFrameTop);
  Edit5.Text := FloatToStr(ImageEnMView1.MIO.TwainParams.AcquireFrameRight);
  Edit6.Text := FloatToStr(ImageEnMView1.MIO.TwainParams.AcquireFrameBottom);
end;

// copy controls values to twain parameters

procedure TfrmDigitalizar.FillIn;
begin
  ImageEnMView1.MIO.TwainParams.VisibleDialog := CheckBox1.Checked;
  ImageEnMView1.MIO.TwainParams.ProgressIndicators := CheckBox2.Checked;
  ImageEnMView1.MIO.TwainParams.AcquireFrameLeft := StrToFloat(Edit3.Text);
  ImageEnMView1.MIO.TwainParams.AcquireFrameTop := StrToFloat(Edit4.Text);
  ImageEnMView1.MIO.TwainParams.AcquireFrameRight := StrToFloat(Edit5.Text);
  ImageEnMView1.MIO.TwainParams.AcquireFrameBottom := StrToFloat(Edit6.Text);
  ImageEnMView1.MIO.TwainParams.PixelType.CurrentValue := ComboBox2.ItemIndex;
  ImageEnMView1.MIO.TwainParams.YResolution.CurrentValue := StrToInt(edit1.text);
  ImageEnMView1.MIO.TwainParams.XResolution.CurrentValue := StrToInt(edit2.text);
  ImageEnMView1.MIO.TwainParams.BufferedTransfer := CheckBox4.Checked;
  ImageEnMView1.MIO.TwainParams.FeederEnabled := CheckBox6.Checked;
  ImageEnMView1.MIO.TwainParams.AutoFeed := CheckBox7.Checked;
  ImageEnMView1.MIO.TwainParams.DuplexEnabled := CheckBox8.Checked;
end;

// Acquire

procedure TfrmDigitalizar.Button1Click(Sender: TObject);
var i:integer;
begin
  FillIn;
  ImageEnMView1.MIO.Acquire;
  ShowMessage('Acquire - Fim');
  for i := 0 to ImageEnMView1.MIO.ParamsCount-1 do
    ImageEnMView1.MIO.Params[i].PDF_Compression := ioPDF_G4FAX;
  ProgressBar1.Position := 0;
end;

// progress
procedure TfrmDigitalizar.ImageEnIO1Progress(Sender: TObject; per: Integer);
begin
  ProgressBar1.Position := per;
  if CheckBox3.Checked then
  begin
    ImageEnMView1.Update;
    application.processmessages;
  end;
end;

// enable/disable acquire frame

procedure TfrmDigitalizar.CheckBox5Click(Sender: TObject);
begin
  edit3.enabled := CheckBox5.Checked;
  edit4.enabled := CheckBox5.Checked;
  edit5.enabled := CheckBox5.Checked;
  edit6.enabled := CheckBox5.Checked;
  ImageEnMView1.MIO.TWainParams.AcquireFrameEnabled := CheckBox5.Checked;
  ImageEnMView1.MIO.TwainParams.Update;
  FillBack;
end;

procedure TfrmDigitalizar.GroupBox1DblClick(Sender: TObject);
begin
  ImageEnMView1.MIO.SelectAcquireSource();
end;

function TfrmDigitalizar.RetornaStreamDigitalizado(pbRedigitalizar:boolean):TRecStream;
var ms:TMemoryStream; rs:TRecStream; i:integer; bSalvar:boolean;
begin
  try
    if not ckSalvarBranco.Checked then
       btPaginaBrancoClick(self);

    bSalvar := true;
    frmDlgStatus.Show;
    rs.Scanner := ComboBox1.Text;
    rs.Tipo := ComboBox2.Text;
    rs.Dpi := edit2.Text;
    AdicionaLog('RetornaStreamDigitalizado');
    if pbRedigitalizar then
    begin
      i:=1;
      frmDlgStatus.pbStatus.Max := ImageEnMView1.ImageCount;
      frmDlgStatus.pbStatus.Position := i;
      frmDlgStatus.lbStatus.Caption := Format('Salvando imagem %d de %d', [1,ImageEnMView1.ImageCount]);
      AdicionaLog(frmDlgStatus.lbStatus.Caption);
      Application.ProcessMessages;
      SetLength(rs.MyStream, 1);
      ms := TMemoryStream.Create;
      {Todo:JPEG}
      ImageEnMView1.MIO.SaveToStreamPDF(ms);
      rs.MyStream[0] := ms;
    end
    else
    begin
      SetLength(rs.MyStream, ImageEnMView1.ImageCount);
      SetLength(rs.Salvar  , ImageEnMView1.ImageCount);
      for i:=0 to ImageEnMView1.ImageCount-1 do
      begin
         bSalvar := true;
         frmDlgStatus.pbStatus.Max := ImageEnMView1.ImageCount-1;
         frmDlgStatus.pbStatus.Position := i;
         frmDlgStatus.lbStatus.Caption := Format('Preparando imagem %d de %d', [i+1,ImageEnMView1.ImageCount]);
         AdicionaLog(frmDlgStatus.lbStatus.Caption);
         Application.ProcessMessages;

         if high(vPaginaBranco)>=i then
           if not ckSalvarBranco.Checked and vPaginaBranco[i] then
              bSalvar := false;

         rs.Salvar[i] := bSalvar;
         if bSalvar then
         begin
           ms := TMemoryStream.Create;
           FBitmap := ImageEnMView1.GetBitmap(i);
           ConverteBitmapParaPDF(ms,2,100);
           //ConverteBitmapParaJPG(ms);
           rs.MyStream[i] := ms;
         end;
      end;
    end;
    Result := rs;
  finally
    //ms.Free;
    AdicionaLog('RetornaStreamDigitalizado ---- Fim');
  end;
end;

procedure TfrmDigitalizar.CheckBox6Click(Sender: TObject);
begin
  ImageEnMView1.MIO.TwainParams.FeederEnabled := CheckBox6.Checked;
end;

procedure TfrmDigitalizar.CheckBox7Click(Sender: TObject);
begin
  ImageEnMView1.MIO.TwainParams.AutoFeed := CheckBox7.Checked;
end;

procedure TfrmDigitalizar.CheckBox8Click(Sender: TObject);
begin
  ImageEnMView1.MIO.TwainParams.DuplexEnabled := CheckBox8.Checked;
end;

procedure TfrmDigitalizar.ImageEnMView1ImageSelect(Sender: TObject;
  idx: Integer);
var ms:TMemoryStream;
begin
  ImageEnMView1.CopyToIEBitmap( idx, ImageEnVect1.IEBitmap );
  ImageEnVect1.Fit;
  ImageEnVect1.Update;
  if high(vPaginaBranco)>=idx then
    lbPaginaBranco.Visible := vPaginaBranco[idx];

   //Apenas para teste e avaliacao de tamanho 
  {try
    ms := TMemoryStream.Create;
    ImageEnMView1.MIO.SaveToStreamTIFF(ms);
    lbTamanho.Caption := FormatFloat('TIFF 0.00', ms.Size / 1024) + ' kb';

    ImageEnMView1.MIO.SaveToStreamPDF(ms);
    lbTamanho.Caption := lbTamanho.Caption +
                         FormatFloat(' PDF  0.00', ms.Size / 1024) + ' kb';

    FBitmap := ImageEnMView1.GetBitmap(ImageEnMView1.SelectedImage);
    FBitmap.SaveToStream(ms);
    lbTamanho.Caption := lbTamanho.Caption +
                         FormatFloat(' BMP 0.00', ms.Size / 1024) + ' kb';

    FJPEGImage.ProgressiveEncoding := True;
    FJPEGImage.PixelFormat := jf24Bit;
    FJPEGImage.Assign(FBitmap);
    FJPEGImage.SaveToStream(ms);
    lbTamanho.Caption := lbTamanho.Caption +
                         FormatFloat(' JPG 0.00', ms.Size / 1024) + ' kb';

    ConverteBitmapParaPDF(ms,2,100);
    lbTamanho.Caption := lbTamanho.Caption +
                         FormatFloat(' cPDF 0.00', ms.Size / 1024) + ' kb';


  finally
    ms.Free;
  end;}
end;

procedure TfrmDigitalizar.Excluir1Click(Sender: TObject);
begin
  ImageEnMView1.DeleteImage(ImageEnMView1.SelectedImage);
end;

procedure TfrmDigitalizar.Salvar1Click(Sender: TObject);
var jpg:TJPEGImage; bmp : TBitmap; idx: integer; dName:string;
begin
  bmp := TBitmap.Create;
  jpg := TJPEGImage.Create;
  try
    idx := ImageEnMView1.SelectedImage;
    bmp := ImageEnMView1.GetBitmap(idx);
    jpg.CompressionQuality := 40;
    jpg.Compress;
    jpg.Assign(bmp);
    dName := 'c:\compware';
    if not DirectoryExists(dName) then
      mkDir(dName);
    dName := 'c:\compware\temp';
    if not DirectoryExists(dName) then
      mkDir(dName);

    jpg.SaveToFile(dName+'\documento.jpg');
  finally
    jpg.Free;
    bmp.Free;
  end;
end;

{ pncores = nPERFILPRETOBRANCO, preto e branco
  pncores = nPERFILTONSCINZA
 pncores = nPERFILCOLORIDO, colorido}
procedure TfrmDigitalizar.CriarPDF(var poStream: TMemoryStream; pnCores: integer;
  pnTamanho, pnLargImg, pnAltImg: integer; pnResolucao: integer = 200);
var
  WPDFPrinter: TWPPDFPrinter;
  oTMPStream: TMemoryStream;
  nLargTWips: integer;
  nAltTWips: integer;
begin

  //nLargTWips := WPRTEDefs.WPInchToTwips(pnLargImg / pnResolucao);
    nLargTWips := Round((pnLargImg / pnResolucao) * 1440);
  //nAltTWips := WPRTEDefs.WPInchToTwips(pnAltImg / pnResolucao);
    nAltTWips :=  Round((pnAltImg / pnResolucao)  * 1440);

  WPDFPrinter := TWPPDFPrinter.Create(nil);
  try
    oTMPStream := TMemoryStream.Create;
    try
      WPDFPrinter.AutoLaunch := False;
      WPDFPrinter.InMemoryMode := True;
      WPDFPrinter.CompressStreamMethod := wpCompressFlate;
      WPDFPrinter.Stream := oTMPStream;

      WPDFPrinter.BeginDoc;
      WPDFPrinter.StartPage(nLargTWips, nAltTWips, 1440, 1440, 0);

      if pnCores = nPERFILTONSCINZA then
        WPDFPrinter.DrawJPEG(0, 0, nLargTWips, nAltTWips, pnLargImg, pnAltImg,
          poStream.Memory, poStream.Size, wpGrayjpeg)
      else
        WPDFPrinter.DrawJPEG(0, 0, nLargTWips, nAltTWips, pnLargImg, pnAltImg,
          poStream.Memory, poStream.Size, wpRGBjpeg);

      WPDFPrinter.EndPage;
      WPDFPrinter.EndDoc;

    finally
      poStream.Clear;
      oTmpStream.SaveToStream(poStream);
      oTmpStream.Free;
    end;
  finally
    WPDFPrinter.Free;
  end;
end;

procedure TfrmDigitalizar.ConverteBitmapParaPDF(poStream: TMemoryStream;
  pnPerfilDoc, pnResolucao: integer; pbTransforma: boolean = True);
begin
  poStream.Clear;
  if (pnPerfilDoc = nPERFILPRETOBRANCO) then
  begin
    if pbTransforma then
    begin
      FImageEnProc.ConvertToBWThreshold(FnLimiarPretoEBranco); // Max Enthropy
      FImageEnProc.RemoveNoise(FnRemocaoRuido);
    end;
    //FImageEnIo.IEBitmap.pixelformat := ie1g;
    FImageEnIo.Params.BitsPerSample := 1;
    FImageEnIo.Params.DPI := pnResolucao;

    { Converte a imagem para pontos do PDF - 1/72" }
    FImageEnIo.Params.PDF_PaperWidth := round((FImageEnIo.IEBitmap.Width * 72) / pnResolucao);
    FImageEnIo.Params.PDF_PaperHeight := round((FImageEnIo.IEBitmap.Height * 72) / pnResolucao);

    FImageEnIo.SaveToStreamPDF(poStream);
  end
  else
  begin
    FImageEnIo.Params.BitsPerSample := 8;

    FJPEGImage.ProgressiveEncoding := True; // -10% no tons de cinza; -30% no colorido // SOFFA
    FJPEGImage.Grayscale := (pnPerfilDoc = nPERFILTONSCINZA);
    if FJPEGImage.Grayscale then
      FJPEGImage.PixelFormat := jf8Bit
    else
      FJPEGImage.PixelFormat := jf24Bit;
    FJPEGImage.Assign(FBitmap);
    FJPEGImage.SaveToStream(poStream);

    CriarPDF(poStream, pnPerfilDoc, 0, FJPEGImage.Width,
        FJPEGImage.Height, pnResolucao);
  end;
end;

procedure TfrmDigitalizar.InicializaDigitalizacao;
begin
  // Suporte a digitalizacao
  FBitmap := TBitmap.Create;
  FImageEnIO := TImageEnIO.Create(Self);
  FImageEnIO.AttachedBitmap := FBitmap;
  FJPEGImage := TJPEGImage.Create;
  FImageEnProc := TImageEnProc.Create(Self);
  FImageEnProc.AttachedBitmap := FBitmap;

  ImageEnMView1.MIO.OnAcquireBitmap := evAq;
end;

procedure TfrmDigitalizar.FinalizaDigitalizacao;
begin
  FImageEnProc.AttachedIEBitmap := nil;
  FJPEGImage.Free;
  FBitmap.Free;
  FImageEnIo.Free;
  FImageEnProc.Free;
end;

procedure TfrmDigitalizar.FormCreate(Sender: TObject);
var ini:TiniFile; fName:string;
begin
  fName := ExtractFilePath(Application.ExeName) + 'ris.ini';
  ini := TiniFile.Create(fName);
  edEqual.text := ini.ReadString('SCAN','AjusteBranco','35');
  ini.Free;
  InicializaDigitalizacao;
end;

procedure TfrmDigitalizar.FormClose(Sender: TObject;
  var Action: TCloseAction);
var ini:TiniFile; fName:string;
begin
  //FinalizaDigitalizacao;
  fName := ExtractFilePath(Application.ExeName) + 'ris.ini';
  ini := TiniFile.Create(fName);
  ini.WriteString('SCAN','AjusteBranco','35');
  ini.Free;
end;

procedure TfrmDigitalizar.evAq(Sender: TObject; ABitmap: TIEBitmap;
  var Handled: boolean);
begin
  AdicionaLog('Event Acquire Bitmap');
end;

procedure TfrmDigitalizar.btRotacionarClick(Sender: TObject);
begin
  ImageEnProc1.Rotate(-90);
end;

procedure TfrmDigitalizar.btPaginaBrancoClick(Sender: TObject);
var idx:integer;
begin
  ImageEnView1.IO.LoadFromFileJpeg('c:\compware\folha branca.jpg');
  SetLength(vPaginaBranco, ImageEnMView1.ImageCount);
  for idx := 0 to ImageEnMView1.ImageCount-1 do
  begin
    ImageEnMView1.CopyToIEBitmap( idx, ImageEnView2.IEBitmap );
    vPaginaBranco[idx] := Comparar;
  end;
end;

// compare (using ComputeImageEquality)
function TfrmDigitalizar.Comparar:boolean;
var
  psnr_min, psnr_max: double;
  mse_min, mse_max: double;
  rmse_min, rmse_max: double;
  pae_min, pae_max: double;
  mae_min, mae_max: double;
  equal: boolean;
  ww, hh: integer;
begin
  // adjust sizes (make ImageEnView1=ImageEnView2)
  ww := ImageEnView1.Bitmap.Width;
  hh := ImageEnView1.Bitmap.Height;
  if (ww <> ImageEnView2.Bitmap.Width) or (hh <> ImageEnView2.Bitmap.Height) then
    ImageEnView2.Proc.Resample(ww, hh, rfNone);

  equal := ImageEnView1.Proc.ComputeImageEquality(ImageEnView2.IEBitmap, psnr_min, psnr_max, mse_min, mse_max, rmse_min, rmse_max, pae_min, pae_max, mae_min, mae_max);
  result := mse_min <= strToFloat(edEqual.text);
  //label4.caption := floattostr(psnr_min) + ' (min) , ' + floattostr(psnr_max) + ' (max)';
  //label6.caption := floattostr(mse_min) + ' (min) , ' + floattostr(mse_max) + ' (max)';
  //label8.caption := floattostr(rmse_min) + ' (min) , ' + floattostr(rmse_max) + ' (max)';
  //label10.caption := floattostr(pae_min) + ' (min) , ' + floattostr(pae_max) + ' (max)';
  //label12.caption := floattostr(mae_min) + ' (min) , ' + floattostr(mae_max) + ' (max)';
  //if equal then
  //  label14.caption := 'True'
  //else
  //  label14.caption := 'False';
end;

{
// compare using CompareWith

procedure TForm1.Button4Click(Sender: TObject);
var
  ww, hh: integer;
  v: double;
begin
  // adjust sizes (make ImageEnView1=ImageEnView2)
  ww := ImageEnView1.Bitmap.Width;
  hh := ImageEnView1.Bitmap.Height;
  if (ww <> ImageEnView2.Bitmap.Width) or (hh <> ImageEnView2.Bitmap.Height) then
    ImageEnView2.Proc.Resample(ww, hh, rfNone);
  //
  v := ImageEnView1.Proc.CompareWith(ImageEnView2.IEBitmap, nil);
  label16.Caption := floattostr(v * 100) + ' %';
end;


}

procedure TfrmDigitalizar.Abrir1Click(Sender: TObject);
var fName:string;
begin
 fName := ImageEnMView1.MIO.ExecuteOpenDialog;
 ImageEnMView1.MIO.LoadFromFile(fName);
end;

procedure TfrmDigitalizar.ConverteBitmapParaJPG(poStream: TMemoryStream);
begin
  poStream.Clear;
  FImageEnIo.Params.BitsPerSample := 8;
  FJPEGImage.ProgressiveEncoding := True; // -10% no tons de cinza; -30% no colorido // SOFFA
  //FJPEGImage.Grayscale := (pnPerfilDoc = nPERFILTONSCINZA);
  if FJPEGImage.Grayscale then
    FJPEGImage.PixelFormat := jf8Bit
  else
    FJPEGImage.PixelFormat := jf24Bit;
  FJPEGImage.Assign(FBitmap);
  FJPEGImage.SaveToStream(poStream);
end;

end.
