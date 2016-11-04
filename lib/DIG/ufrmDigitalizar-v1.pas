unit ufrmDigitalizar;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, ImageEnView, ImageEnIO, ComCtrls, ieview, DBCtrls,
  DB, IBCustomDataSet, IBTable, Grids, DBGrids, ievect, dbimageen,
  dbimageenvect, uspViewPDF, uspWPViewPDFCompatible, iemview, imageenproc,
  imageen, iemio;

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
    ImageEnView1: TImageEnView;
    ImageEnMIO1: TImageEnMIO;
    ImageEn1: TImageEn;
    ImageEnProc1: TImageEnProc;
    ImageEnMView1: TImageEnMView;
    procedure FormActivate(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure ImageEnIO1Progress(Sender: TObject; per: Integer);
    procedure CheckBox5Click(Sender: TObject);
    procedure GroupBox1DblClick(Sender: TObject);
  private
    { Private declarations }
    procedure FillBack; // copy twain parameters to the controls
    procedure FillIn; // copy controls to twain parameters
  public
    { Public declarations }
    function RetornaStreamDigitalizado:TMemoryStream;
  end;


var
  frmDigitalizar: TfrmDigitalizar;

implementation

//uses UDM;

{$R *.DFM}
{$R WindowsXP.RES}

procedure TfrmDigitalizar.FormActivate(Sender: TObject);
var
  i: integer;
begin
  // fills Twain sources
  for i := 0 to ImageEnView1.IO.TwainParams.SourceCount - 1 do
    ComboBox1.Items.Add(ImageEnView1.IO.TwainParams.SourceName[i]);
  // Select first scanner
  if ComboBox1.Items.Count > 0 then
  begin
    ComboBox1.ItemIndex := 0;
    ImageEnView1.IO.TwainParams.SelectedSource := ComboBox1.ItemIndex;
  end;
  ImageEnView1.IO.TwainParams.AppVersionInfo := '1.0';
  ImageEnView1.IO.TwainParams.AppManufacturer := 'HiComponents';
  ImageEnView1.IO.TwainParams.AppProductFamily := 'Image processing';
  ImageEnView1.IO.TwainParams.AppProductName := 'ImageEn demo';
  FillBack;
end;

// Select scanner

procedure TfrmDigitalizar.ComboBox1Change(Sender: TObject);
begin
  //ImageEnView1.IO.AcquireParams.SetSource(ieaTwain, ComboBox1.Items[ComboBox1.ItemIndex]);
  ImageEnView1.IO.TwainParams.SelectedSource := ComboBox1.ItemIndex;
  FillBack;
end;

// negotiate parameters (verify that scanner supports Frame rectangle, Dpi...)

procedure TfrmDigitalizar.Button2Click(Sender: TObject);
begin
  FillIn;
  ImageEnView1.IO.TwainParams.Update; // verify here...
  FillBack;
end;

// copy twain parameters to the controls

procedure TfrmDigitalizar.FillBack;
const
  COLORS: array[0..9] of string = ('Black&White', 'GrayScale', 'RGB', 'Palette', 'CMY', 'CMYK', 'YUV', 'YUVK', 'CIEXYZ', 'LAB');
var
  i, v: integer;
begin
  Edit1.Text := FloatToStr(ImageEnView1.IO.TwainParams.YResolution.CurrentValue);
  Edit2.Text := FloatToStr(ImageEnView1.IO.TwainParams.XResolution.CurrentValue);
  // Fill Colors (0=B/W 1=GrayScale 2=RGB) combobox
  ComboBox2.Clear;
  for i := 0 to ImageEnView1.IO.TwainParams.PixelType.Count - 1 do
  begin
    v := ImageEnView1.IO.TwainParams.PixelType[i];
    if v <= high(COLORS) then
      ComboBox2.Items.Add(COLORS[v]);
  end;
  ComboBox2.ItemIndex := ImageEnView1.IO.TwainParams.PixelType.IndexOf(ImageEnView1.IO.TwainParams.PixelType.CurrentValue);
  // frame
  Edit3.Text := FloatToStr(ImageEnView1.IO.TwainParams.AcquireFrameLeft);
  Edit4.Text := FloatToStr(ImageEnView1.IO.TwainParams.AcquireFrameTop);
  Edit5.Text := FloatToStr(ImageEnView1.IO.TwainParams.AcquireFrameRight);
  Edit6.Text := FloatToStr(ImageEnView1.IO.TwainParams.AcquireFrameBottom);
end;

// copy controls values to twain parameters

procedure TfrmDigitalizar.FillIn;
begin
  ImageEnView1.IO.TwainParams.VisibleDialog := CheckBox1.Checked;
  ImageEnView1.IO.TwainParams.ProgressIndicators := CheckBox2.Checked;
  ImageEnView1.IO.TwainParams.AcquireFrameLeft := StrToFloat(Edit3.Text);
  ImageEnView1.IO.TwainParams.AcquireFrameTop := StrToFloat(Edit4.Text);
  ImageEnView1.IO.TwainParams.AcquireFrameRight := StrToFloat(Edit5.Text);
  ImageEnView1.IO.TwainParams.AcquireFrameBottom := StrToFloat(Edit6.Text);
  ImageEnView1.IO.TwainParams.PixelType.CurrentValue := ComboBox2.ItemIndex;
  ImageEnView1.IO.TwainParams.YResolution.CurrentValue := StrToInt(edit1.text);
  ImageEnView1.IO.TwainParams.XResolution.CurrentValue := StrToInt(edit2.text);
  ImageEnView1.IO.TwainParams.BufferedTransfer := CheckBox4.Checked;
end;

// Acquire

procedure TfrmDigitalizar.Button1Click(Sender: TObject);
begin
  FillIn;
  ImageEnMIO1.Acquire;
  ImageEnMIO1.Params.PDF_Compression := ioPDF_G4FAX;
  //ImageEnView1.IO.Acquire;
  //ImageEnView1.IO.Params.PDF_Compression := ioPDF_G4FAX;
  ProgressBar1.Position := 0;
end;

// progress
procedure TfrmDigitalizar.ImageEnIO1Progress(Sender: TObject; per: Integer);
begin
  ProgressBar1.Position := per;
  if CheckBox3.Checked then
  begin
    //ImageEnView1.Update;
    ImageEnMIO1.Update;
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
  ImageEnMIO1.TWainParams.AcquireFrameEnabled := CheckBox5.Checked;
  ImageEnMIO1.TwainParams.Update;
  //ImageEnView1.IO.TwainParams.AcquireFrameEnabled := CheckBox5.Checked;
  //ImageEnView1.IO.TwainParams.Update;
  FillBack;
end;

procedure TfrmDigitalizar.GroupBox1DblClick(Sender: TObject);
begin
  ImageEnView1.IO.SelectAcquireSource();//  ImageEnView1.IO.AcquireParams.SelectSource
end;

function TfrmDigitalizar.RetornaStreamDigitalizado:TMemoryStream;
var ms:TMemoryStream;
begin
  ms := TMemoryStream.Create;
  ImageEnView1.IO.SaveToStreamPDF(ms);
  Result := ms;
end;

end.


