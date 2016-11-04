unit UfrmRelTransferencia;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UfrmRelPad, dxEdLib, dxCntner, dxEditor, dxExEdtr, StdCtrls,
  ComCtrls, RpCon, RpConDS, RpBase, RpSystem, RpDefine, RpRave, DB,
  IBCustomDataSet, IBQuery, Buttons, ExtCtrls, RpRenderRTF, RpRenderHTML,
  RpRender, RpRenderPDF;

type
  TfrmRelTransferencia = class(TfrmRelPad)
    TabSheet1: TTabSheet;
    GroupBox1: TGroupBox;
    Label2: TLabel;
    btLocProcesso: TdxButtonEdit;
    edNome: TdxEdit;
    Label3: TLabel;
    Label4: TLabel;
    edData: TdxEdit;
    Label5: TLabel;
    edNomeMae: TdxEdit;
    edCodigo: TdxEdit;
    qyPaciente: TIBQuery;
    rvdtAgenda: TRvDataSetConnection;
    rvdtNotificacao: TRvDataSetConnection;
    qyNotificacao: TIBQuery;
    qyAgenda: TIBQuery;
    qyAgendaDT_AGENDA: TDateTimeField;
    qyAgendaDS_ESQUEMA: TIBStringField;
    qyAgendaNR_PROCESSO: TIntegerField;
    qyAgendaCD4: TIBBCDField;
    qyAgendaPROC_CD4: TIBBCDField;
    qyAgendaDT_RESULTADO: TDateField;
    qyCD4: TIBQuery;
    qyCD4CD_AGENDA: TIntegerField;
    qyCD4DT_CD4: TDateField;
    qyCD4PROC_CD4: TIBBCDField;
    qyCD4CD4: TIBBCDField;
    qyCD4HGB: TIBStringField;
    qyCD4CV: TIBStringField;
    qyCD4VDRL: TIBStringField;
    qyCD4HBsAg: TIBStringField;
    qyCD4VHC: TIBStringField;
    rvdtcd4: TRvDataSetConnection;
    rvdtPaciente: TRvDataSetConnection;
    qyPacienteNR_PROCESSO: TIntegerField;
    qyPacienteNM_PACIENTE: TIBStringField;
    qyPacienteDT_NASCIMENTO: TDateField;
    qyPacienteNM_MAE: TIBStringField;
    qyPacienteCD_PACIENTE: TIntegerField;
    qyPacienteIDADE: TSmallintField;
    qyPacienteTP_SEXO: TIBStringField;
    qyPacienteDS_PROVINCIA: TIBStringField;
    qyNotificacaoDT_DIAGNOSTICO: TDateField;
    qyNotificacaoNR_PROCESSO: TIntegerField;
    qyCD4RESULTADO: TStringField;
    qyCD4DATA_AGENDA: TDateTimeField;
    procedure btLocProcessoButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure btLocProcessoExit(Sender: TObject);
    procedure btImprimirClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure qyCD4CalcFields(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRelTransferencia: TfrmRelTransferencia;

implementation

Uses
  UGeral, UgeralSQL, UDM, UDMGERAL, UfrmLocalizar;
{$R *.dfm}

procedure TfrmRelTransferencia.btLocProcessoButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
begin
  inherited;
  frmLocalizar := TfrmLocalizar.Create(application);
  frmLocalizar.Caption := 'Localizar Utente';
  frmLocalizar.qyDados := SelectDadosPacienteUnidade;

  try
    frmLocalizar.Where := true;
    SetLength(VCampo,5);
    frmLocalizar.KeyField := 'cd_paciente';
    VCampo[0].Titulo  := 'Nr. Processo';
    VCampo[0].Width := 10;
    VCampo[1].Titulo  := 'Utente';
    VCampo[1].Width := 30;
    VCampo[2].Titulo  := 'Dt. Nascimento';
    VCampo[2].Width := 10;
    VCampo[3].Titulo  := 'Mãe';
    VCampo[3].Width := 30;
    VCampo[0].Visivel := True;
    VCampo[1].Visivel := True;
    VCampo[2].Visivel := True;
    VCampo[3].Visivel := True;
    VCampo[4].Visivel := False;
  except
    ShowMessage(frmLocalizar.qyDados.Sql.Text);
  end;
  if frmLocalizar.ShowModal=mrok then
  begin
    btLocProcesso.Text := frmLocalizar.qyDados.FieldByname('nr_processo').AsString;
    edNome.Text := frmLocalizar.qyDados.FieldByname('nm_paciente').AsString;
    edData.Text := frmLocalizar.qyDados.FieldByname('dt_nascimento').AsString;
    edNomeMae.Text := frmLocalizar.qyDados.FieldByname('nm_mae').AsString;
    edCodigo.Text := frmLocalizar.qyDados.FieldByname('cd_paciente').AsString;
  end;
  frmLocalizar.qyDados.Close;
  FreeAndNil(frmLocalizar);

end;

procedure TfrmRelTransferencia.btLocProcessoExit(Sender: TObject);
begin
  inherited;
  if btLocProcesso.Text = '' then
    begin
      btLocProcesso.Clear;
      edNome.Clear;
      edData.Clear;
      edNomeMae.Clear;
      edCodigo.Clear;
    end;

  if btLocProcesso.Text <> '' then
    begin
      qyPaciente.Close;
      qyPaciente.ParamByName('UNIDADE').AsString := prmUnidade;
      qyPaciente.ParamByName('PROCESSO').AsString := btLocProcesso.text;
      qyPaciente.Open;

      if not qyPaciente.eof then
        begin
          btLocProcesso.Text := qyPaciente.FieldByname('nr_processo').AsString;
          edNome.Text := qyPaciente.FieldByname('nm_paciente').AsString;
          edData.Text := qyPaciente.FieldByname('dt_nascimento').AsString;
          edNomeMae.Text := qyPaciente.FieldByname('nm_mae').AsString;
          edCodigo.Text := qyPaciente.FieldByname('cd_paciente').AsString;
        end
        else
        begin
          MessageDlg('Processo não encontrado!',mtWarning,[mbOK],0);
          btLocProcesso.Clear;
          edNome.Clear;
          edData.Clear;
          edNomeMae.Clear;
          edCodigo.Clear;
        end;
    end;

end;

procedure TfrmRelTransferencia.btImprimirClick(Sender: TObject);
begin
  //inherited;
  if btLocProcesso.Text = '' then
  begin
    MessageDlg('É necessário incluir um Nr. de Processo!',mtWarning,[mbOK],0);
    abort;
  end;

  try
    {TODO: prmMedicoIntegraLab - Rever utulizacao deste parametro}
    qyNotificacao.Close;
    qyNotificacao.ParamByName('PACIENTE').AsInteger := StrToInt(edCodigo.text);
    qyNotificacao.ParamByName('UND').AsInteger := StrToInt(prmUnidade);
    qyAgenda.Close;
    qyAgenda.ParamByName('PACIENTE').AsInteger := StrToInt(edCodigo.text);
    qyAgenda.ParamByName('MEDICO').AsInteger := StrToInt(prmMedicoIntegraLab);
    qyCD4.Close;
    qyCD4.ParamByName('PACIENTE').AsInteger := StrToInt(edCodigo.text);
    qyCD4.ParamByName('MEDICO').AsInteger := StrToInt(prmMedicoIntegraLab);
    qyCD4.Open;
    qyAgenda.open;
    qyNotificacao.open;
    RvGeral.Execute;

  finally
    qyNotificacao.Close;
    qyAgenda.Close;
    qyCD4.Close;
  end;

end;

procedure TfrmRelTransferencia.FormCreate(Sender: TObject);
begin
  inherited;
  RvGeral.ProjectFile := sPathLayout +'\RelTransferencia.rav';

end;

procedure TfrmRelTransferencia.qyCD4CalcFields(DataSet: TDataSet);
begin

  if qyCD4DT_CD4.AsString <> '' then
    qyCD4RESULTADO.AsString := qyCD4DT_CD4.AsString
  else
    qyCD4RESULTADO.AsString := qyCD4DATA_AGENDA.AsString;

end;

end.
