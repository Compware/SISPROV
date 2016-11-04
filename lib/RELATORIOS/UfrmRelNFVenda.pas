unit UfrmRelNFVenda;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UfrmRelPad, DB, IBCustomDataSet, IBQuery, StdCtrls, Buttons,
  ExtCtrls, ComCtrls, RpRave, RpBase, RpSystem, RpDefine, RpCon, RpConDS,
  dxCntner, dxEditor, dxExEdtr, dxEdLib;

type
  TfrmRelNFVenda = class(TfrmRelPad)
    RvDtCnNFVENDA: TRvDataSetConnection;
    RvSysNFVENDA: TRvSystem;
    RvPrjNFVenda: TRvProject;
    qyGeralCD_NF: TIntegerField;
    qyGeralDT_NF: TDateTimeField;
    qyGeralDT_REFERENCIA: TDateTimeField;
    qyGeralDS_PESSOA: TIBStringField;
    qyGeralDS_OBS: TIBStringField;
    qyGeralVL_TOTAL_BRUTO: TIBBCDField;
    qyGeralVL_TOTAL_LIQUIDO: TIBBCDField;
    qyGeralVL_DESCONTO: TIBBCDField;
    qyGeralVL_ACRESCIMO: TIBBCDField;
    qyGeralNR_NF: TIBStringField;
    qyGeralDS_OPERACAO: TIBStringField;
    qyGeralCD_OPERACAO: TIntegerField;
    qyGeralTP_OPERACAO: TIBStringField;
    GroupBox1: TGroupBox;
    TabSheet1: TTabSheet;
    Label2: TLabel;
    edINICIO: TdxDateEdit;
    Label3: TLabel;
    edFINAL: TdxDateEdit;
    RvDtCnFatConfRel: TRvDataSetConnection;
    qyGeralSG_STATUS: TIBStringField;
    qyGeralTP_DOCUMENTO: TIBStringField;
    procedure qyGeralBeforeOpen(DataSet: TDataSet);
    procedure edINICIOKeyPress(Sender: TObject; var Key: Char);
    procedure RvPrjNFVendaCreate(Sender: TObject);
    procedure btImprimirClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRelNFVenda: TfrmRelNFVenda;

implementation

uses
  Ugeral, UDM, UDMGERAL, UDMRelatorios;

{$R *.dfm}

procedure TfrmRelNFVenda.qyGeralBeforeOpen(DataSet: TDataSet);
begin
  inherited;
  qyGeral.ParamByName('INICIO').AsDateTime := edINICIO.Date;
  qyGeral.ParamByName('FINAL').AsDateTime := edFINAL.Date;
end;

procedure TfrmRelNFVenda.edINICIOKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if Key=#13 then
  begin
     keybd_event(9,0,0,0);
  end;

end;

procedure TfrmRelNFVenda.RvPrjNFVendaCreate(Sender: TObject);
begin
  inherited;
  RvPrjNFVenda.ProjectFile := sPathLayout +'\RelFaturamento.rav';
end;

procedure TfrmRelNFVenda.btImprimirClick(Sender: TObject);
begin
  inherited;
  if edInicio.Text = '  /  /    ' then
  begin
    MessageDlg('Data (Inicio) inválido! Favor inserir novamente!',mtInformation,
     [mbOK],0);
    edInicio.setfocus;
    Exit;
  end;

  if edFinal.Text = '  /  /    ' then
  begin
    MessageDlg('Data (Final) inválido! Favor inserir novamente!',mtInformation,
     [mbOK],0);
    edFinal.setfocus;
    Exit;
  end;

  try
    qyGeral.Open;
    dmRelatorios.tbTmpParametro.Open;
    dmRelatorios.tbTmpParametro.Insert;
    dmRelatorios.tbTmpParametroCD_PARAMETRO.AsInteger := 1;
    dmRelatorios.tbTmpParametroVL_PARAMETRO1.AsString := edInicio.text;
    dmRelatorios.tbTmpParametroVL_PARAMETRO2.AsString := edFinal.text;
    dmRelatorios.tbTmpParametro.Post;
    RvPrjNFVenda.Execute;
  finally
    dmRelatorios.tbTmpParametro.Delete;
    dmRelatorios.tbTmpParametro.Close;
    qyGeral.close;
  end;
end;

end.
