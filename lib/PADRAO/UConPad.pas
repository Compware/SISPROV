unit UConPad;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, dxExEdtr, dxCntner, dxTL, dxDBCtrl, dxDBGrid, ComCtrls,
  StdCtrls, Buttons, ExtCtrls, DB;

type
  TfrmConPad = class(TForm)
    Panel2: TPanel;
    StatusBar1: TStatusBar;
    Panel1: TPanel;
    btAnterior: TBitBtn;
    btProximo: TBitBtn;
    btPesquisar: TBitBtn;
    btimprimir: TBitBtn;
    pgGeral: TPageControl;
    tabLista: TTabSheet;
    Panel3: TPanel;
    grDados: TdxDBGrid;
    dsGrid: TDataSource;
    Panel4: TPanel;
    btfechar: TBitBtn;
    procedure btfecharClick(Sender: TObject);
    procedure btimprimirClick(Sender: TObject);
    procedure btProximoClick(Sender: TObject);
    procedure btAnteriorClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmConPad: TfrmConPad;

implementation

uses UDM, UGeral, uRelatorioWEB, ufuncaoGrid;

{$R *.dfm}

procedure TfrmConPad.btfecharClick(Sender: TObject);
begin
  close;
end;

procedure TfrmConPad.btimprimirClick(Sender: TObject);
var sArq, sExt, sAux, sAuxDe, sAuxPara:string; s:TStringList; ix:integer;
begin
  frmRelatorioWEB := TfrmRelatorioWEB.Create(application);
  s := TStringList.Create;
  try
    sExt := '.html';
    sArq := sPathConsulta + FormatDateTime('ddmmyyhhnnss',now) + sExt;
    sArqGridHtml := sArq;
    grDados.SaveToHTML(sArq, false);
    s.LoadFromFile(sArq);
    sAuxDe := '<TITLE>grDados</TITLE>';
    sAuxPara := '<TITLE>'+caption+'</TITLE>';
    s.text := StringReplace(s.Text,sAuxDe,sAuxPara,[]);
    sAuxDe := '<TABLE BORDER=1 CELLSPACING=0 CELLPADDING=1 BGCOLOR=#C0C0C0>';
    sAuxPara := sAuxDe +
       '<TR class="Header"><TD HEIGHT=30 COLSPAN="'+intToStr(grDados.ColumnCount)
       +'" ALIGN="CENTER" BGCOLOR=#ECE9D8><b>'+Caption+'</b></TD></TR>';
    s.text := StringReplace(s.Text,sAuxDe,sAuxPara,[]);
    s.SaveToFile(sArq);
    //ImprimeGrid(grDados, Self.Caption);
    frmRelatorioWEB.relatorio.Navigate(sArq);
    frmRelatorioWEB.ShowModal;
  finally
    frmRelatorioWEB.Free;
    if FileExists(sArq) then
      DeleteFile(sArq);
    FreeAndNil(s);
  end;
end;

procedure TfrmConPad.btProximoClick(Sender: TObject);
begin
  if not dsGrid.DataSet.Eof then
    dsGrid.DataSet.Next;

end;

procedure TfrmConPad.btAnteriorClick(Sender: TObject);
begin
  if not dsGrid.DataSet.Eof then
    dsGrid.DataSet.Prior;

end;

end.
