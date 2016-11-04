unit uRelatorioWEB;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, OleCtrls, SHDocVw, Menus, ExtDlgs, StdCtrls, ExtCtrls,
  Buttons, ComCtrls, ToolWin, ImgList, mshtml, ActiveX, ClipBrd,  ComObj;

type
  TfrmRelatorioWEB = class(TForm)
    relatorio: TWebBrowser;
    Panel1: TPanel;
    Button1: TButton;
    mmHTML: TMemo;
    btExcel: TSpeedButton;
    procedure FormShow(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure btExcelClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure SalvarIMG(sArq: String);
    procedure SalvarHTML(sArq: String);
  end;

var
  frmRelatorioWEB: TfrmRelatorioWEB;

implementation

{$R *.dfm}

procedure TfrmRelatorioWEB.SalvarHTML(sArq: String);
var Doc : IHtmlDocument2;
begin
  Doc := relatorio.Document as IHtmlDocument2;
  mmHTML.Lines.Text := Doc.body.innerHTML;
  mmHTML.Lines.SaveToFile(sArq);
end;

procedure TfrmRelatorioWEB.SalvarIMG(sArq: String);
var
  ViewObject: IViewObject;
  sourceDrawRect: TRect;
  imgImagem: TImage;
begin
  if relatorio.Document <> nil then
  try
    imgImagem := TImage.Create(Self);
    imgImagem.Width := relatorio.Width;
    imgImagem.Height := relatorio.Height;

    relatorio.Document.QueryInterface(IViewObject, ViewObject);
    if ViewObject <> nil then
    try
    sourceDrawRect := Rect(0, 0, imgImagem.Width, imgImagem.Height);
    ViewObject.Draw(DVASPECT_CONTENT, 1, nil, nil, Self.Handle,
    imgImagem.Canvas.Handle, @sourceDrawRect, nil, nil, 0);
  finally
    ViewObject._Release;
  end;
    imgImagem.Picture.Bitmap.SaveToFile(sArq);
  except

  end;
end;

procedure TfrmRelatorioWEB.FormShow(Sender: TObject);
begin
  Self.WindowState := wsMaximized;
end;

procedure TfrmRelatorioWEB.Button1Click(Sender: TObject);
var
 oStringList: TStringList;
begin
  oStringList := TStringList.Create;
  try
  oStringList.Text := relatorio.OleObject.document.Body.InnerHTML;
  oStringList.SaveToFile('Z:\SIS Compware\RelatorioGeralPrograma.xml');
  finally
  oStringList.Free;
  end;

  end;
procedure TfrmRelatorioWEB.btExcelClick(Sender: TObject);
var
  pvaIn, pvaOut: OleVariant;
  MSExcel: OLEvariant;
  wb: OLEVariant;

begin
  pvaIn := EmptyParam;
  pvaOut := EmptyParam;
  relatorio.ExecWB(OLECMDID_SELECTALL,OLECMDEXECOPT_PROMPTUSER,pvaIn,pvaOut);
  relatorio.ExecWB(OLECMDID_COPY,OLECMDEXECOPT_DONTPROMPTUSER,pvaIn);
  //webbrowser1.SendToBack;

  MSExcel := GetActiveOLEObject('Excel.Application');
  wb := MSExcel.Workbooks.Add;
  try
   wb.WorkSheets[1].Cells[1,1].PasteSpecial;
  finally
  end;
end;

initialization
OleInitialize(nil);

finalization
OleUninitialize;

end.
