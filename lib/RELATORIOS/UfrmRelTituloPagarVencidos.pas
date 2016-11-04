unit UfrmRelTituloPagarVencidos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UfrmRelPad, dxCntner, dxEditor, dxExEdtr, dxEdLib, StdCtrls,
  ComCtrls, DB, IBCustomDataSet, RpRave, RpBase, RpSystem, RpDefine, RpCon,
  RpConDS, IBQuery, Buttons, ExtCtrls;

type
  TfrmRelTituloPagarVencidos = class(TfrmRelPad)
    RvDtCnTituloPagarVencidos: TRvDataSetConnection;
    RvDtCnTituloPagarVencidosConfRel: TRvDataSetConnection;
    RvSysTituloPagarVencidos: TRvSystem;
    RvPrjTituloPagarVencidos: TRvProject;
    qyGeralCD_TITULO_PAGAR: TIntegerField;
    qyGeralNR_TITULO: TIBStringField;
    qyGeralCD_PESSOA: TIntegerField;
    qyGeralNM_PESSOA: TIBStringField;
    qyGeralDT_EMISSAO: TDateField;
    qyGeralDT_REFERENCIA: TDateField;
    qyGeralDT_VENCIMENTO: TDateField;
    qyGeralVL_TITULO: TIBBCDField;
    qyGeralCD_NAT_LANCAMENTO: TIntegerField;
    qyGeralDS_NAT_LANCAMENTO: TIBStringField;
    qyGeralCD_FORMA_PAGAMENTO: TIntegerField;
    qyGeralDS_FORMA_PAGAMENTO: TIBStringField;
    qyGeralVL_DESCONTO: TIBBCDField;
    qyGeralVL_ACRESCIMO: TIBBCDField;
    qyGeralVL_MULTA: TIBBCDField;
    qyGeralVL_JUROS: TIBBCDField;
    qyGeralVL_TOTAL: TIBBCDField;
    qyGeralCD_EMPRESA: TIntegerField;
    qyGeralDS_OBS: TIBStringField;
    qyGeralCD_USUARIO: TIntegerField;
    qyGeralNM_USUARIO: TIBStringField;
    qyGeralSG_STATUS: TIBStringField;
    qyGeralCD_BANCO: TIntegerField;
    qyGeralDS_BANCO: TIBStringField;
    qyGeralNR_AGENCIA: TIBStringField;
    qyGeralNR_CONTA: TIBStringField;
    qyGeralNR_TITULO_BANCO: TIBStringField;
    qyGeralDT_EXCLUSAO: TDateTimeField;
    qyGeralDT_BAIXA: TDateField;
    qyGeralDS_EMPRESA: TIBStringField;
    qyGeralDS_STATUS: TIBStringField;
    GroupBox3: TGroupBox;
    TabSheet1: TTabSheet;
    Label3: TLabel;
    Label8: TLabel;
    dtde: TdxDateEdit;
    dtate: TdxDateEdit;
    procedure qyGeralBeforeOpen(DataSet: TDataSet);
    procedure btImprimirClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure RvPrjTituloPagarVencidosCreate(Sender: TObject);
    procedure dtateExit(Sender: TObject);
    procedure dtdeExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRelTituloPagarVencidos: TfrmRelTituloPagarVencidos;

implementation

uses UDM, UDMGERAL, UGERAL, UDMRelatorios;

{$R *.dfm}

procedure TfrmRelTituloPagarVencidos.qyGeralBeforeOpen(DataSet: TDataSet);
begin
  inherited;
  qyGeral.ParamByName('DATA').AsDate := DM.GetDate;
  qyGeral.ParamByName('de').AsDate := dtDe.Date;
  qyGeral.ParamByName('ate').AsDate := dtAte.Date;

end;

procedure TfrmRelTituloPagarVencidos.btImprimirClick(Sender: TObject);
begin
  inherited;
  if (dtDe.Text = '  /  /    ') then
  begin
    MessageDlg('Data (Inicio) inválido! Favor inserir novamente!',mtInformation,
     [mbOK],0);
    dtDe.setfocus;
    Exit;
  end;

  if (dtAte.Text = '  /  /    ') then
  begin
    MessageDlg('Data (Final) inválido! Favor inserir novamente!',mtInformation,
     [mbOK],0);
    dtAte.setfocus;
    Exit;
  end;

  try
    dmRelatorios.tbTmpParametro.Open;
    dmRelatorios.tbTmpParametro.Insert;
    dmRelatorios.tbTmpParametroCD_PARAMETRO.AsInteger := 1;
    dmRelatorios.tbTmpParametroVL_PARAMETRO1.AsString := dtde.text;
    dmRelatorios.tbTmpParametroVL_PARAMETRO2.AsString := dtate.text;
    dmRelatorios.tbTmpParametro.Post;
    qyGeral.open;
    RvPrjTituloPagarVencidos.Execute;
  finally
    qyGeral.Close;
    dmRelatorios.tbTmpParametro.Delete;
    dmRelatorios.tbTmpParametro.Close;
    close;    
  end;

end;

procedure TfrmRelTituloPagarVencidos.FormCreate(Sender: TObject);
begin
  inherited;
  RvPrjTituloPagarVencidos.ProjectFile := sPathLayout +'\RelTituloPagarVencidos.rav';
end;

procedure TfrmRelTituloPagarVencidos.RvPrjTituloPagarVencidosCreate(
  Sender: TObject);
begin
  inherited;
  RvPrjTituloPagarVencidos.ProjectFile := sPathLayout +'\RelTituloPagarVencidos.rav';
end;

procedure TfrmRelTituloPagarVencidos.dtateExit(Sender: TObject);
begin
  inherited;
  if dtate.Date > DM.GetDate then
    begin
      MessageDlg('Data Final não pode ser maior que a data atual! Favor inserir novamente!',mtInformation,
       [mbOK],0);
      dtate.setfocus;
    end;
end;

procedure TfrmRelTituloPagarVencidos.dtdeExit(Sender: TObject);
begin
  inherited;
  if dtde.Date > DM.GetDate then
    begin
      MessageDlg('Data Inicio não pode ser maior que a data atual! Favor inserir novamente!',mtInformation,
       [mbOK],0);
      dtde.setfocus;
    end;

end;

end.
