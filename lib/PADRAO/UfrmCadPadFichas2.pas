unit UfrmCadPadFichas2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UfrmCadPadSG, dxExEdtr, Menus, DB, dxCntner, dxTL, dxDBCtrl,
  dxDBGrid, ComCtrls, StdCtrls, Buttons, ExtCtrls, dxDBTLCl, dxGrClms;

type
  TfrmCadPadFichas2 = class(TfrmCadPadSG)
    tabVersao: TTabSheet;
    grVersao: TdxDBGrid;
    Panel6: TPanel;
    dsVersao: TDataSource;
    grVersaoColumn1: TdxDBGridColumn;
    grVersaoColumn2: TdxDBGridColumn;
    grVersaoColumn3: TdxDBGridColumn;
    grVersaoColumn4: TdxDBGridMemoColumn;
    btIncVersao: TBitBtn;
    btImpVersao: TBitBtn;
    btSalvarVersao: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure btIncVersaoClick(Sender: TObject);
    procedure btImpVersaoClick(Sender: TObject);
    procedure dsVersaoStateChange(Sender: TObject);
    procedure btSalvarVersaoClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    sArq:string;
    procedure GeraXML; virtual;
  end;

var
  frmCadPadFichas2: TfrmCadPadFichas2;
  nRelatorio:integer;


implementation

uses UDMGERAL, UGeral, uRelatorioWEB;

{$R *.dfm}

procedure TfrmCadPadFichas2.FormCreate(Sender: TObject);
begin
  inherited;
  dmGeral.TB_VERSAO_RELATORIO.Close;
  dmGeral.TB_VERSAO_RELATORIO.ParamByName('TP_RELATORIO').AsInteger := nRelatorio;
  dmGeral.TB_VERSAO_RELATORIO.Open;
end;

procedure TfrmCadPadFichas2.btIncVersaoClick(Sender: TObject);
begin
  inherited;
   sArq := sPathConsulta+'RelatorioATV'+FormatDateTime('ddmmyyhhnnss',now)+'.xml';
   GeraXML;
   dmGeral.TB_VERSAO_RELATORIO.Insert;
   dmGeral.TB_VERSAO_RELATORIOTP_RELATORIO.AsInteger := nRelatorio;
   dmGeral.TB_VERSAO_RELATORIONM_ARQUIVO.AsString := sArq;
   dmGeral.TB_VERSAO_RELATORIOBL_RELATORIO.LoadFromFile(sArq);
   dmGeral.TB_VERSAO_RELATORIO.Post;
end;

procedure TfrmCadPadFichas2.GeraXML;
begin
//
end;

procedure TfrmCadPadFichas2.btImpVersaoClick(Sender: TObject);
begin
  inherited;
  frmRelatorioWEB := TfrmRelatorioWEB.Create(application);
  try
    sArq := dmGeral.TB_VERSAO_RELATORIONM_ARQUIVO.AsString;
    dmGeral.TB_VERSAO_RELATORIOBL_RELATORIO.SaveToFile(sArq);
    frmRelatorioWEB.relatorio.Navigate(sArq);
    frmRelatorioWEB.ShowModal;
  finally
    frmRelatorioWEB.Free;
    if FileExists(sArq) then
      DeleteFile(sArq);
  end;
end;

procedure TfrmCadPadFichas2.dsVersaoStateChange(Sender: TObject);
begin
  inherited;
  btSalvarVersao.Enabled := (dsVersao.DataSet.State in dsEditModes);
end;

procedure TfrmCadPadFichas2.btSalvarVersaoClick(Sender: TObject);
begin
  inherited;
  if (dsVersao.DataSet.State in dsEditModes) then
    dsVersao.DataSet.Post; 
end;

end.
