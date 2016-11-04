unit uCadMapaLaboratorio;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, dxExEdtr, DB, dxCntner, dxTL, dxDBCtrl, dxDBGrid,
  ComCtrls, StdCtrls, Buttons, ExtCtrls, Grids, IBCustomDataSet, IBQuery,
  RxLookup, Mask, DBCtrls, DBGrids, RxDBComb, RpCon, RpConDS, RpBase,
  RpSystem, RpDefine, RpRave, DBClient, Midaslib, ImgList, ib_parse,
  dxEditor, dxEdLib, UfrmCadPad, ToolEdit, Menus, UfrmCadPadSG, dxDBTLCl,
  dxGrClms,  RXDBCtrl, ufrmLocalizar, uGeralSQL,  frxClass,
  frxExportPDF, frxDBSet, uCadCID10, dxDBELib, DBLocal, DBLocalI, CheckLst,
  ShellApi;

type

  TDummyDBGrid = class(TCustomdxDBGrid);
  TDummyDBGridFilter = class(TdxDBGridFilter);

  TfrmCadMapaLaboratorio = class(TfrmCadPad)
    qyGrid: TIBQuery;
    gcDS_PROVINCIA: TdxDBGridColumn;
    dsMapaLinha: TDataSource;
    Panel5: TPanel;
    Panel6: TPanel;
    btIns: TSpeedButton;
    btDel: TSpeedButton;
    fxMapa: TfrxReport;
    fxdbMapa: TfrxDBDataset;
    frxPDFExport1: TfrxPDFExport;
    fxdbPaciente: TfrxDBDataset;
    TB_MAPA_LAB: TIBDataSet;
    TB_MAPA_LAB_PACIENTE: TIBDataSet;
    dsMapaLab: TDataSource;
    Label2: TLabel;
    grMapaMedico: TdxDBGrid;
    gcNR_PROCESSO: TdxDBGridColumn;
    gcNM_PACIENTE: TdxDBGridMaskColumn;
    gcTP_SEXO: TdxDBGridColumn;
    gcNR_IDADE: TdxDBGridColumn;
    gcTP_EXAME_CD4: TdxDBGridCheckColumn;
    gcTP_EXAME_CV: TdxDBGridCheckColumn;
    gcTP_EXAME_DPI: TdxDBGridCheckColumn;
    gcTP_EXAME_TB: TdxDBGridCheckColumn;
    dtMapa: TDBDateEdit;
    gcDT_MAPA: TdxDBGridColumn;
    gcCODIGO: TdxDBGridColumn;
    TB_MAPA_LABCD_MAPA: TIntegerField;
    TB_MAPA_LABCD_UNIDADE: TIntegerField;
    TB_MAPA_LABDT_MAPA: TDateTimeField;
    TB_MAPA_LABDS_UNIDADE: TIBStringField;
    TB_MAPA_LABDS_MUNICIPIO: TIBStringField;
    TB_MAPA_LABDS_PROVINCIA: TIBStringField;
    TB_MAPA_LAB_PACIENTECD_MAPA_PACIENTE: TIntegerField;
    TB_MAPA_LAB_PACIENTECD_MAPA: TIntegerField;
    TB_MAPA_LAB_PACIENTECD_PACIENTE: TIntegerField;
    TB_MAPA_LAB_PACIENTENM_PACIENTE: TIBStringField;
    TB_MAPA_LAB_PACIENTEFL_SEXO: TIBStringField;
    TB_MAPA_LAB_PACIENTENR_IDADE: TIntegerField;
    TB_MAPA_LAB_PACIENTEVL_RESULTADO: TIBStringField;
    TB_MAPA_LAB_PACIENTEDS_OBSERVACAO: TIBStringField;
    TB_MAPA_LAB_PACIENTECD_TECNICO: TIntegerField;
    TB_MAPA_LAB_PACIENTENM_INVESTIGADOR: TIBStringField;
    TB_MAPA_LAB_PACIENTECODIGO: TIntegerField;
    TB_MAPA_LAB_PACIENTENR_PROCESSO: TIBStringField;
    TB_MAPA_LAB_PACIENTETP_EXAME_CD4: TIBStringField;
    TB_MAPA_LAB_PACIENTETP_EXAME_CV: TIBStringField;
    TB_MAPA_LAB_PACIENTETP_EXAME_DPI: TIBStringField;
    TB_MAPA_LAB_PACIENTETP_EXAME_TB: TIBStringField;
    gcDS_OBSERVACAO: TdxDBGridColumn;
    gcVL_RESULTADO: TdxDBGridPickColumn;
    qyGridCD_UNIDADE: TIntegerField;
    qyGridDT_MAPA: TDateTimeField;
    qyGridDS_UNIDADE: TIBStringField;
    qyGridDS_MUNICIPIO: TIBStringField;
    qyGridDS_PROVINCIA: TIBStringField;
    grDS_MUNICIPIO: TdxDBGridColumn;
    grDS_UNIDADE: TdxDBGridColumn;
    gcNM_INVESTIGADOR: TdxDBGridButtonColumn;
    tabExport: TTabSheet;
    grExport: TdxDBGrid;
    dxDBGridColumn1: TdxDBGridColumn;
    dxDBGridColumn2: TdxDBGridColumn;
    dxDBGridMaskColumn1: TdxDBGridMaskColumn;
    dxDBGridColumn3: TdxDBGridColumn;
    dxDBGridColumn4: TdxDBGridColumn;
    dxDBGridCheckColumn1: TdxDBGridCheckColumn;
    dxDBGridCheckColumn2: TdxDBGridCheckColumn;
    dxDBGridCheckColumn3: TdxDBGridCheckColumn;
    dxDBGridCheckColumn4: TdxDBGridCheckColumn;
    dxDBGridPickColumn1: TdxDBGridPickColumn;
    dxDBGridColumn5: TdxDBGridColumn;
    dxDBGridButtonColumn1: TdxDBGridButtonColumn;
    qyExport: TIBQuery;
    dsExport: TDataSource;
    grExportColumn14: TdxDBGridDateColumn;
    Excel1: TMenuItem;
    N1: TMenuItem;
    grExportColumn15: TdxDBGridColumn;
    SaveDialog1: TSaveDialog;
    TB_MAPA_LAB_PACIENTETIPO_EXAME: TStringField;
    gcTIPO_EXAME: TdxDBGridColumn;
    btAgenda: TBitBtn;
    Label1: TLabel;
    btLocMedico: TdxDBButtonEdit;
    edMedico: TdxDBEdit;
    qyAgenda: TIBQuery;
    qyAgendaCD_AGENDA: TIntegerField;
    qyAgendaCD_MEDICO: TIntegerField;
    qyAgendaCD_PACIENTE: TIntegerField;
    qyAgendaDS_ESQUEMA: TIBStringField;
    qyAgendaDT_AGENDA: TDateTimeField;
    qyAgendaFL_ESQUEMA: TIntegerField;
    qyAgendaTP_ESQUEMA: TIntegerField;
    qyAgendaVL_CD4: TIntegerField;
    qyAgendaNR_PROCESSO: TIntegerField;
    TB_MAPA_LAB_PACIENTECD_AGENDA: TIntegerField;
    TB_MAPA_LABCD_MEDICO: TIntegerField;
    TB_MAPA_LABNM_MEDICO: TIBStringField;
    qyGridCD_MAPA: TIntegerField;
    gcCD_MAPA: TdxDBGridColumn;
    TB_MAPA_LAB_PACIENTENR_LAB: TIntegerField;
    gcNR_LAB: TdxDBGridColumn;
    grExportColumn16: TdxDBGridColumn;
    N2: TMenuItem;
    Editar1: TMenuItem;
    TB_MAPA_LAB_PACIENTEDT_RESULTADO: TDateTimeField;
    gcDT_RESULTADO: TdxDBGridDateColumn;
    grExportColumn17: TdxDBGridDateColumn;
    qyGridCD_MEDICO: TIntegerField;
    pnCampos: TPanel;
    ckCampos: TCheckListBox;
    btCampos: TBitBtn;
    Imprimir1: TMenuItem;
    qyConfereAgendamento: TIBQuery;
    qyConfereAgendamentoCD_AGENDA: TIntegerField;
    procedure FormShow(Sender: TObject);
    procedure btgravarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure btexcluirClick(Sender: TObject);
    procedure btIncluirClick(Sender: TObject);
    procedure bteditarClick(Sender: TObject);
    procedure btLimparClick(Sender: TObject);
    procedure btimprimirClick(Sender: TObject);
    procedure btCancelarClick(Sender: TObject);
    procedure btInsClick(Sender: TObject);
    procedure btDelClick(Sender: TObject);
    procedure dsControleStateChange(Sender: TObject);
    procedure TB_MAPA_LAB_PACIENTEAfterInsert(DataSet: TDataSet);
    procedure TB_MAPA_LABBeforeClose(DataSet: TDataSet);
    procedure TB_MAPA_LABAfterOpen(DataSet: TDataSet);
    procedure TB_MAPA_LAB_PACIENTEBeforeInsert(DataSet: TDataSet);
    procedure grDadosDblClick(Sender: TObject);
    procedure TB_MAPA_LAB_PACIENTENR_PROCESSOValidate(Sender: TField);
    procedure btPesquisarClick(Sender: TObject);
    procedure TB_MAPA_LABAfterInsert(DataSet: TDataSet);
    procedure TB_MAPA_LAB_PACIENTECalcFields(DataSet: TDataSet);
    procedure TB_MAPA_LAB_PACIENTETP_EXAME_CD4Validate(Sender: TField);
    procedure gcNM_INVESTIGADORButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure Excel1Click(Sender: TObject);
    procedure AtualizarLista1Click(Sender: TObject);
    procedure qyExportAfterScroll(DataSet: TDataSet);
    procedure btLocMedicoButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure btAgendaClick(Sender: TObject);
    procedure TB_MAPA_LABBeforeDelete(DataSet: TDataSet);
    procedure TB_MAPA_LABCD_MEDICOValidate(Sender: TField);
    procedure TB_MAPA_LABDT_MAPAValidate(Sender: TField);
    procedure TB_MAPA_LAB_PACIENTEBeforePost(DataSet: TDataSet);
    procedure Editar1Click(Sender: TObject);
    procedure btLocMedicoChange(Sender: TObject);
    procedure pgGeralChange(Sender: TObject);
    procedure TB_MAPA_LABBeforePost(DataSet: TDataSet);
    procedure btCamposClick(Sender: TObject);
    procedure ckCamposClickCheck(Sender: TObject);
    procedure Imprimir1Click(Sender: TObject);
  private
    procedure LocalizarMapa;
    procedure ValidarMapa;
    procedure LancaAgenda(pDtAgenda: TDate; pnConfirmado: integer);
    { Private declarations }
  public
    { Public declarations }
    sNomeTabela:string;
    procedure AbreConsultas;
    procedure FechaConsultas;
  end;

var
  frmCadMapaLaboratorio: TfrmCadMapaLaboratorio;
  bEdit, bConsolidado:Boolean;
  Unidade :Integer;
  MesAno:String;
  sSQLUnidade, sSQLAgenda:string;
  bExportando:boolean;

implementation

uses UDMGERAL, UDM, DateUtils, Ugeral, uRelatorioWEB, uFuncaoGrid,
  uFuncaoContraSenha, UfrmRelMapa, dxGrFltr, dxFilter, uConsAbandono;

{$R *.dfm}

procedure AddFilter(Column: TdxDBTreeListColumn; Value: Variant; DisplayValue: string;
  Operator: TdxOperatorType = otEqual; NotCriteria: Boolean = False);
var
  Grid: TDummyDBGrid;
  Criteria: TdxCriteria;
begin
  if Column = nil then
    Exit;

  Grid := TDummyDBGrid(Column.TreeList);
  Criteria := TDummyDBGridFilter(Grid.Filter).Criteria;
  with TdxDBGridCriteria(Criteria).AddItem(nil, Column, Operator, Value, DisplayValue, False) do
    if NotCriteria then
      IsNot := True;
  Grid.SetFilterMode;
end;

procedure TfrmCadMapaLaboratorio.FormShow(Sender: TObject);
begin
  inherited;
  grExport.LoadFromIniFile(grExport.IniFileName);
  qyGrid.Open;
  pgGeral.ActivePageIndex := 0;
end;

procedure TfrmCadMapaLaboratorio.btgravarClick(Sender: TObject);
begin
  if TB_MAPA_LAB_PACIENTE.state in dsEditModes then
     TB_MAPA_LAB_PACIENTE.Post;
  inherited;
  dsMapaLinha.AutoEdit := false;
end;

procedure TfrmCadMapaLaboratorio.AbreConsultas;
begin
  sSQLAgenda := dmGeral.TB_AGENDA.SelectSQL.Text;
  dmGeral.TB_AGENDA.SelectSQL.Text := StringReplace(sSQLAgenda,'/*MEDICO*/',
     'AND  "AGENDA".CD_MEDICO = :CD_MEDICO ' + chr(13) +
     'AND  "AGENDA".CD_PACIENTE = :CD_PACIENTE'
     ,[]);
  dmGeral.TB_AGENDAFL_CONFIRMADO.OnValidate := nil;
end;

procedure TfrmCadMapaLaboratorio.FechaConsultas;
begin
  dmGeral.TB_AGENDA.Close;
  dmGeral.TB_AGENDA.SelectSQL.Text := sSQLAgenda;
  dmGeral.TB_AGENDAFL_CONFIRMADO.OnValidate := dmGeral.TB_AGENDAFL_CONFIRMADOValidate;
end;

procedure TfrmCadMapaLaboratorio.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  FechaConsultas;
end;

procedure TfrmCadMapaLaboratorio.FormCreate(Sender: TObject);
begin
  inherited;
  FbPermiteMudarPagina := False;
  grExport.IniFileName := sPathGrid + '\' + self.Name + '.ini';
  AbreConsultas;
end;

procedure TfrmCadMapaLaboratorio.btexcluirClick(Sender: TObject);
begin
{TODO:Criar historico ao Excluir}
  if (not VerificaPermissao(53)) then
  begin
    ShowMessage('Usuário sem permissão para realizar esta operação!');
    Exit;
  end;
  pgGeral.ActivePageIndex := 1;
  pgGeralChange(sender);
  inherited;
end;

procedure TfrmCadMapaLaboratorio.btIncluirClick(Sender: TObject);
begin
  if (not VerificaPermissao(52)) then
  begin
    ShowMessage('Usuário sem permissão para realizar esta operação!');
    Exit;
  end;
  pgGeral.ActivePageIndex := 1;
  dsMapaLinha.AutoEdit := true;
  inherited;
end;

procedure TfrmCadMapaLaboratorio.btimprimirClick(Sender: TObject);
var sRel:string;
begin
  sRel := '\RelMapaLaboratorio.fr3';
  fxMapa.LoadFromFile(sPathLayOut + sRel);
  fxMapa.ShowReport;
end;

procedure TfrmCadMapaLaboratorio.btLimparClick(Sender: TObject);
begin
  inherited;
  Limpar;
end;

procedure TfrmCadMapaLaboratorio.bteditarClick(Sender: TObject);
begin
  if (not VerificaPermissao(52)) then
  begin
    ShowMessage('Usuário sem permissão para realizar esta operação!');
    Exit;
  end;
  pgGeral.ActivePageIndex := 1;
  pgGeralChange(sender);
  inherited;
  dsMapaLinha.AutoEdit := true;
end;


procedure TfrmCadMapaLaboratorio.btCancelarClick(Sender: TObject);
begin
  inherited;
  dsMapaLinha.AutoEdit := false;
end;

procedure TfrmCadMapaLaboratorio.btInsClick(Sender: TObject);
begin
  inherited;
  if btGravar.Enabled then
    dsMapaLinha.DataSet.Append;
end;

procedure TfrmCadMapaLaboratorio.btDelClick(Sender: TObject);
begin
  inherited;
  if btGravar.Enabled then
    dsMapaLinha.DataSet.Delete;
end;

procedure TfrmCadMapaLaboratorio.dsControleStateChange(Sender: TObject);
begin
  inherited;
  //btexcluir.Enabled := false;
end;

procedure TfrmCadMapaLaboratorio.TB_MAPA_LAB_PACIENTEAfterInsert(
  DataSet: TDataSet);
begin
  inherited;
  TB_MAPA_LAB_PACIENTECD_MAPA.AsInteger :=
    TB_MAPA_LABCD_MAPA.AsInteger;
  TB_MAPA_LAB_PACIENTEDT_RESULTADO.AsDateTime :=
    TB_MAPA_LABDT_MAPA.AsDateTime;
end;

procedure TfrmCadMapaLaboratorio.TB_MAPA_LABBeforeClose(
  DataSet: TDataSet);
begin
  inherited;
  TB_MAPA_LAB_PACIENTE.Close;
end;

procedure TfrmCadMapaLaboratorio.TB_MAPA_LABAfterOpen(DataSet: TDataSet);
begin
  inherited;
  TB_MAPA_LAB_PACIENTE.Open;
end;

procedure TfrmCadMapaLaboratorio.TB_MAPA_LAB_PACIENTEBeforeInsert(
  DataSet: TDataSet);
begin
  inherited;
  if TB_MAPA_LAB.state in dsEditModes then
     TB_MAPA_LAB.Post;
end;

procedure TfrmCadMapaLaboratorio.grDadosDblClick(Sender: TObject);
begin
  inherited;
  LocalizarMapa
end;

procedure TfrmCadMapaLaboratorio.TB_MAPA_LAB_PACIENTENR_PROCESSOValidate(
  Sender: TField);
begin
  inherited;
  if not TB_MAPA_LAB_PACIENTENR_PROCESSO.IsNull then
  with TIBQuery.Create(nil) do
  begin
    Database := dm.DB;
    Transaction := dm.TS;
    SQl.Add('SELECT * FROM PACIENTE');

    if Pos('-',TB_MAPA_LAB_PACIENTENR_PROCESSO.AsString) > 0 then // se for crianca exposta
      SQl.Add('WHERE NR_PROCESSO_CRIANCA_EXP = :NR_PROCESSO')
    else
      SQl.Add('WHERE NR_PROCESSO = :NR_PROCESSO');

    ParamByName('NR_PROCESSO').AsString := TB_MAPA_LAB_PACIENTENR_PROCESSO.AsString;
    Open;

    if VerificaUtenteAbandono(FieldByName('CD_PACIENTE').AsInteger) then
    begin
      ShowMessage('Este paciente esta em abandono, antes de inclui-lo no mapa é preciso mudar o status para ACTIVO!');
      frmConsAbandono := TfrmConsAbandono.Create(Application);
      frmConsAbandono.procuraCD_PACIENTE :=  FieldByName('CD_PACIENTE').AsInteger;
      frmConsAbandono.edicaoExterna := True;
      if frmConsAbandono.ShowModal <> mrOk then
        Abort;
    end;

    TB_MAPA_LAB_PACIENTECD_PACIENTE.AsString := FieldByName('CD_PACIENTE').AsString;
    TB_MAPA_LAB_PACIENTENM_PACIENTE.AsString := FieldByName('NM_PACIENTE').AsString;
    TB_MAPA_LAB_PACIENTENR_IDADE.AsInteger :=
        YearsBetween(TB_MAPA_LABDT_MAPA.AsDateTime, FieldByName('DT_NASCIMENTO').AsDateTime);
    TB_MAPA_LAB_PACIENTEFL_SEXO.AsString := FieldByName('TP_SEXO').AsString;

    AtualizaPacienteIdade(FieldByName('CD_PACIENTE').AsInteger);

    Close;
    Free;
  end;
end;

procedure TfrmCadMapaLaboratorio.btPesquisarClick(Sender: TObject);
begin
  inherited;
  qyGrid.Close;
  qyGrid.Open;
end;

procedure TfrmCadMapaLaboratorio.TB_MAPA_LABAfterInsert(DataSet: TDataSet);
begin
  inherited;
  TB_MAPA_LABCD_UNIDADE.AsString := prmUnidade;

  TB_MAPA_LABCD_MEDICO.AsString := prmAgendaLaboratorio;
  TB_MAPA_LABNM_MEDICO.AsVariant :=
    PegaValor('NM_MEDICO', 'MEDICO', ['CD_MEDICO'], [prmAgendaLaboratorio]);
end;

procedure TfrmCadMapaLaboratorio.TB_MAPA_LAB_PACIENTECalcFields(
  DataSet: TDataSet);
begin
  inherited;
  TB_MAPA_LAB_PACIENTECODIGO.AsInteger := TB_MAPA_LAB_PACIENTE.RecNo;

  if TB_MAPA_LAB_PACIENTETP_EXAME_CV.AsString = cvSim then
    TB_MAPA_LAB_PACIENTETIPO_EXAME.AsString := 'CV'
  else if TB_MAPA_LAB_PACIENTETP_EXAME_DPI.AsString = cvSim then
    TB_MAPA_LAB_PACIENTETIPO_EXAME.AsString := 'DPI'
  else if TB_MAPA_LAB_PACIENTETP_EXAME_TB.AsString = cvSim then
    TB_MAPA_LAB_PACIENTETIPO_EXAME.AsString := 'TB'
  else if TB_MAPA_LAB_PACIENTETP_EXAME_CD4.AsString  = cvSim then
    TB_MAPA_LAB_PACIENTETIPO_EXAME.AsString := 'CD4';

end;

procedure TfrmCadMapaLaboratorio.TB_MAPA_LAB_PACIENTETP_EXAME_CD4Validate(
  Sender: TField);
begin
  inherited;

  if (Sender.FieldName = 'TP_EXAME_CD4') and (Sender.AsString = cvSim) then
  begin
    TB_MAPA_LAB_PACIENTETP_EXAME_CV.AsString := cvNao;
    TB_MAPA_LAB_PACIENTETP_EXAME_DPI.AsString := cvNao;
    TB_MAPA_LAB_PACIENTETP_EXAME_TB.AsString := cvNao;
  end;
  if (Sender.FieldName = 'TP_EXAME_CV') and (Sender.AsString = cvSim) then
  begin
    TB_MAPA_LAB_PACIENTETP_EXAME_CD4.AsString := cvNao;
    TB_MAPA_LAB_PACIENTETP_EXAME_DPI.AsString := cvNao;
    TB_MAPA_LAB_PACIENTETP_EXAME_TB.AsString := cvNao;
  end;
  if (Sender.FieldName = 'TP_EXAME_DPI') and (Sender.AsString = cvSim) then
  begin
    TB_MAPA_LAB_PACIENTETP_EXAME_CV.AsString := cvNao;
    TB_MAPA_LAB_PACIENTETP_EXAME_CD4.AsString := cvNao;
    TB_MAPA_LAB_PACIENTETP_EXAME_TB.AsString := cvNao;
  end;
  if (Sender.FieldName = 'TP_EXAME_TB') and (Sender.AsString = cvSim) then
  begin
    TB_MAPA_LAB_PACIENTETP_EXAME_CV.AsString := cvNao;
    TB_MAPA_LAB_PACIENTETP_EXAME_DPI.AsString := cvNao;
    TB_MAPA_LAB_PACIENTETP_EXAME_CD4.AsString := cvNao;
  end;

end;

procedure TfrmCadMapaLaboratorio.gcNM_INVESTIGADORButtonClick(
  Sender: TObject; AbsoluteIndex: Integer);
begin
    if not btgravar.Enabled then
      Exit;
      
    frmLocalizar := TfrmLocalizar.Create(application);
    frmLocalizar.Caption := 'Localizar Técnico';
    frmLocalizar.qyDados.SQL.Text := 'select CD_INVESTIGADOR, NM_INVESTIGADOR from INVESTIGADOR';

    try
      frmLocalizar.Where := false;
      SetLength(VCampo,3);
      frmLocalizar.KeyField := 'CD_INVESTIGADOR';
      VCampo[0].Titulo  := 'Cód.';
      VCampo[0].Width := 5;
      VCampo[1].Titulo  := 'Nome';
      VCampo[1].Width := 25;
      VCampo[0].Visivel := True;
      VCampo[1].Visivel := True;
      VCampo[2].Visivel := false;
    except
      ShowMessage(frmLocalizar.qyDados.Sql.Text);
    end;

    if frmLocalizar.ShowModal=mrok then
    begin
      TB_MAPA_LAB_PACIENTE.Edit;
      TB_MAPA_LAB_PACIENTENM_INVESTIGADOR.AsString := frmLocalizar.qyDados.FieldByname('NM_INVESTIGADOR').AsString;
      TB_MAPA_LAB_PACIENTECD_TECNICO.AsInteger := frmLocalizar.qyDados.FieldByname('CD_INVESTIGADOR').AsInteger;
    end;
    frmLocalizar.qyDados.Close;
    FreeAndNil(frmLocalizar);
end;

procedure TfrmCadMapaLaboratorio.Excel1Click(Sender: TObject);
begin
  if not qyExport.Active then
    qyExport.Open;

  qyExport.Prior;
  qyExport.First;
  SaveDialog1.FileName := sPath + 'Temp\Todos.xls';
  if SaveDialog1.Execute then
  begin
    bExportando := true;
    grExport.SaveToXLS(SaveDialog1.FileName,true);
  end;
  bExportando := false;
end;

procedure TfrmCadMapaLaboratorio.AtualizarLista1Click(Sender: TObject);
begin
  qyExport.Close;
  qyExport.Open;
end;

procedure TfrmCadMapaLaboratorio.qyExportAfterScroll(DataSet: TDataSet);
begin
  if bExportando then
  begin
    sbPadrao.Panels[0].Text := 'Total:'+ intToStr(qyExport.RecordCount) + ' Atual:' +  intToStr(qyExport.RecNo);
    Application.ProcessMessages;
  end;
end;

procedure TfrmCadMapaLaboratorio.btLocMedicoButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
begin
  if TB_MAPA_LAB.State in [dsEdit, dsInsert] then
  begin
    frmLocalizar := TfrmLocalizar.Create(application);
    frmLocalizar.Caption := 'Localizar Médico';
    frmLocalizar.qyDados := SelectDadosMedico;

    try
      frmLocalizar.Where := false;
      SetLength(VCampo,3);
      frmLocalizar.KeyField := 'cd_medico';
      VCampo[0].Titulo  := 'Cód.';
      VCampo[0].Width := 5;
      VCampo[1].Titulo  := 'Nome';
      VCampo[1].Width := 25;
      VCampo[0].Visivel := True;
      VCampo[1].Visivel := True;
      VCampo[2].Visivel := false;
    except
      ShowMessage(frmLocalizar.qyDados.Sql.Text);
    end;
    if frmLocalizar.ShowModal=mrok then
    begin
      TB_MAPA_LABNM_MEDICO.AsString := frmLocalizar.qyDados.FieldByname('nm_medico').AsString;
      TB_MAPA_LABCD_MEDICO.AsInteger := frmLocalizar.qyDados.FieldByname('cd_medico').AsInteger;
    end;
    frmLocalizar.qyDados.Close;
    FreeAndNil(frmLocalizar);
  end;
end;

procedure TfrmCadMapaLaboratorio.btAgendaClick(Sender: TObject);
begin
  qyAgenda.Close;
  qyAgenda.ParamByName('CD_MEDICO').AsString :=
    btLocMedico.text;
  qyAgenda.ParamByName('DT_AGENDA').AsDate :=
    Trunc(TB_MAPA_LABDT_MAPA.AsDateTime);
  qyAgenda.ParamByName('CD_MAPA').AsInteger :=
    TB_MAPA_LABCD_MAPA.AsInteger;
  qyAgenda.Open;
  if not qyAgenda.IsEmpty then
  begin
     qyAgenda.First;
     while not qyAgenda.Eof do
     begin
       try
         TB_MAPA_LAB_PACIENTE.Insert;
         TB_MAPA_LAB_PACIENTENR_PROCESSO.AsString :=
           qyAgendaNR_PROCESSO.AsString;
         TB_MAPA_LAB_PACIENTECD_AGENDA.AsInteger := qyAgendaCD_AGENDA.AsInteger;
         TB_MAPA_LAB_PACIENTECD_PACIENTE.AsInteger := qyAgendaCD_PACIENTE.AsInteger;
         TB_MAPA_LAB_PACIENTE.Post;
       finally
         qyAgenda.Next;
       end;
     end;
  end;
  qyAgenda.Close;
end;

procedure TfrmCadMapaLaboratorio.TB_MAPA_LABBeforeDelete(
  DataSet: TDataSet);
begin
  inherited;
  while Not TB_MAPA_LAB_PACIENTE.Eof do
    TB_MAPA_LAB_PACIENTE.Delete;
end;

procedure TfrmCadMapaLaboratorio.ValidarMapa;
var Codigo:Variant;
begin
 Codigo:= PegaValor('CD_MAPA','MAPA_LAB',
         ['DT_MAPA','CD_MEDICO'],
         [TB_MAPA_LABDT_MAPA.AsDateTime,
         TB_MAPA_LABCD_MEDICO.AsInteger]);

 if not VarIsNull(Codigo) then
 begin
    qyGrid.Close;
    qyGrid.Open;
    if qyGrid.Locate('CD_MAPA', Codigo,[]) then
    begin
        btCancelar.Click;
        LocalizarMapa;
    end;
 end
 else
 if (TB_MAPA_LAB_PACIENTE.RecordCount>0) or
    (TB_MAPA_LAB_PACIENTE.state in dsEditModes)then
 begin
   ShowMessage('A data não pode ser alterada!');
   Abort;
 end;

end;

procedure TfrmCadMapaLaboratorio.LocalizarMapa;
begin
  if not btgravar.Enabled then
  begin
    TB_MAPA_LAB.Close;
    TB_MAPA_LAB.ParamByName('DT_MAPA').AsDate := qyGridDT_MAPA.AsDateTime;
    TB_MAPA_LAB.ParamByName('CD_MEDICO').AsInteger := qyGridCD_MEDICO.AsInteger;
    TB_MAPA_LAB.Open;
  end;
end;

procedure TfrmCadMapaLaboratorio.TB_MAPA_LABCD_MEDICOValidate(
  Sender: TField);
begin
  inherited;
  ValidarMapa;
end;

procedure TfrmCadMapaLaboratorio.TB_MAPA_LABDT_MAPAValidate(Sender: TField);
begin
  inherited;
  ValidarMapa;
end;

procedure TfrmCadMapaLaboratorio.TB_MAPA_LAB_PACIENTEBeforePost(
  DataSet: TDataSet);
var sCampo : string; val:variant;
begin
  inherited;

  if TB_MAPA_LAB_PACIENTENR_PROCESSO.IsNull then
  begin
    ShowMessage('O campo Nr. Processo deve ser preenchido!');
    Abort;
  end;

  if TB_MAPA_LAB_PACIENTETP_EXAME_CD4.AsString = cvSim then
     sCampo := 'CD4';
  if TB_MAPA_LAB_PACIENTETP_EXAME_CV.AsString = cvSim then
     sCampo := 'CV';
  if TB_MAPA_LAB_PACIENTETP_EXAME_DPI.AsString = cvSim then
     sCampo := 'DPI';
  if TB_MAPA_LAB_PACIENTETP_EXAME_TB.AsString = cvSim then
     sCampo := 'TB';

  if (sCampo<>'') then
  begin
    val:=PegaValor('CD_MAPA_PACIENTE','MAPA_LAB_PACIENTE',
        ['TP_EXAME_'+sCampo,'CD_MAPA','CD_PACIENTE'],
        [cvSim,
         TB_MAPA_LAB_PACIENTECD_MAPA.AsInteger,
         TB_MAPA_LAB_PACIENTECD_PACIENTE.AsInteger]);
     if not VarIsNull(val)  then
     if TB_MAPA_LAB_PACIENTECD_MAPA_PACIENTE.AsInteger<>val then
     begin
      ShowMessage('Já existe ' + sCampo + ' para este paciente nesta data!');
      Abort;
     end;
  end;

  LancaAgenda(TB_MAPA_LABDT_MAPA.asDateTime, cvFlSim);
end;

procedure TfrmCadMapaLaboratorio.Editar1Click(Sender: TObject);
begin
  inherited;
  if qyGrid.Locate('CD_MAPA', qyExport.FieldByName('CD_MAPA').AsInteger,[]) then
  begin
     LocalizarMapa;
     bteditar.Click;

     TB_MAPA_LAB_PACIENTE.Locate('CD_MAPA_PACIENTE',
      qyExport.FieldByName('CD_MAPA_PACIENTE').AsInteger,[])
  end;
end;

procedure TfrmCadMapaLaboratorio.btLocMedicoChange(Sender: TObject);
begin
  TB_MAPA_LABNM_MEDICO.AsVariant :=
    PegaValor('NM_MEDICO', 'MEDICO', ['CD_MEDICO'], [btLocMedico.Text]);
end;

procedure TfrmCadMapaLaboratorio.LancaAgenda(pDtAgenda:TDate; pnConfirmado:integer);
begin
  inherited;
  if VarIsNull(pDtAgenda) or (pDtAgenda = StrToDate('30/12/1899')) then
  begin
    Exit;
  end;
  dmGeral.TB_AGENDA.Close;
  dmGeral.TB_AGENDA.ParamByName('DT_DE').AsDate := Trunc(pDtAgenda);
  dmGeral.TB_AGENDA.ParamByName('DT_ATE').AsDate := Trunc(pDtAgenda)+1;
  dmGeral.TB_AGENDA.ParamByName('CD_MEDICO').AsString := TB_MAPA_LABCD_MEDICO.AsString;
  dmGeral.TB_AGENDA.ParamByName('CD_PACIENTE').AsString := TB_MAPA_LAB_PACIENTECD_PACIENTE.AsString;
  dmGeral.TB_AGENDA.Open;
  if dmGeral.TB_AGENDA.IsEmpty then
  begin
      { antes de agendar confere se tinha agenda anterior
        para o mesmo medico/paciente e preenche DT_REMARCACAO}
     qyConfereAgendamento.Close;
     qyConfereAgendamento.ParamByName('PACIENTE').AsInteger := TB_MAPA_LAB_PACIENTECD_PACIENTE.AsInteger;
     qyConfereAgendamento.ParamByName('DATA').AsDate := Trunc(pDtAgenda);
     qyConfereAgendamento.ParamByName('CD_MEDICO').AsInteger := TB_MAPA_LABCD_MEDICO.AsInteger;
     qyConfereAgendamento.Open;

     if qyConfereAgendamento.RecordCount>0 then
     begin
        try
          DMGeral.TB_AGENDAMENTOS.Close;
          DMGeral.TB_AGENDAMENTOS.ParamByName('AGENDA').AsString :=
                            qyConfereAgendamentoCD_AGENDA.AsString;
          DMGERAL.TB_AGENDAMENTOS.Open;
          DMGERAL.TB_AGENDAMENTOS.Edit;
          DMGERAL.TB_AGENDAMENTOSDT_REMARCACAO.AsDateTime :=
            Trunc(pDtAgenda);
          DMGERAL.TB_AGENDAMENTOSFL_REMARCADO.AsInteger := 1;
          DMGERAL.TB_AGENDAMENTOS.Post;
          DM.Commit(DMGERAL.TB_AGENDAMENTOS);
        except
           on Err:Exception do
            ShowMessage(Err.message);
        end;
        DMGeral.TB_AGENDAMENTOS.Close;
     end;
     qyConfereAgendamento.Close;

     dmGeral.TB_AGENDA.Insert;
     dmGeral.TB_AGENDADT_AGENDA.AsDateTime := Trunc(pDtAgenda);
     dmGeral.TB_AGENDACD_MEDICO.AsString := TB_MAPA_LABCD_MEDICO.AsString;
     dmGeral.TB_AGENDACD_PACIENTE.AsString := TB_MAPA_LAB_PACIENTECD_PACIENTE.AsString;
     if Pos('-', TB_MAPA_LAB_PACIENTENR_PROCESSO.AsString) > 0 then // se for crianca exposta
      DMGERAL.TB_AGENDANR_PROCESSO_CRIANCA_EXP.AsString := TB_MAPA_LAB_PACIENTENR_PROCESSO.AsString
     else
      dmGeral.TB_AGENDANR_PROCESSO.AsString := TB_MAPA_LAB_PACIENTENR_PROCESSO.AsString;
     dmGeral.TB_AGENDAFL_REALIZADO.AsInteger := pnConfirmado;
     dmGeral.TB_AGENDAFL_CONFIRMADO.AsInteger := pnConfirmado;
     dmGeral.TB_AGENDA.Post;
     TB_MAPA_LAB_PACIENTECD_AGENDA.AsInteger := dmGeral.TB_AGENDACD_AGENDA.AsInteger;
  end
  else
  begin
    DMGERAL.TB_AGENDA.Edit;
    DMGERAL.TB_AGENDAFL_REALIZADO.AsInteger := pnConfirmado;
    DMGERAL.TB_AGENDAFL_REALIZADO.AsInteger := pnConfirmado;
    DMGERAL.TB_AGENDA.Post;
  end;
end;

procedure TfrmCadMapaLaboratorio.pgGeralChange(Sender: TObject);
begin
  inherited;
  if pgGeral.ActivePageIndex = 0 then
    AtualizaLista;
end;

procedure TfrmCadMapaLaboratorio.TB_MAPA_LABBeforePost(DataSet: TDataSet);
begin
  inherited;
  if TB_MAPA_LABDT_MAPA.IsNull then
  begin
    ShowMessage('O campo data do mapa deve ser preenchido');
    Abort;
  end;

  if TB_MAPA_LABCD_MEDICO.IsNull then
  begin
    ShowMessage('O campo agenda deve ser preenchido');
    Abort;
  end;
end;

procedure TfrmCadMapaLaboratorio.btCamposClick(Sender: TObject);
var i : integer;
begin
  inherited;
  pnCampos.Visible := not pnCampos.Visible;

  if pnCampos.Visible then
  begin
    btCampos.Left := Width - 260;
    ckCampos.Items.Clear;
    for i:=0 to grExport.ColumnCount-1 do
      if not((grExport.Columns[i].FieldName = 'TODOS')
        or (grExport.Columns[i].FieldName = 'DT_ULTIMA_CONSULTA')) then
        ckCampos.Items.Add(grExport.Columns[i].FieldName);
  end
  else
    btCampos.Left := Width - 122;

  for i:=0 to ckCampos.Items.Count -1 do
  begin
    ckCampos.Checked[i] := grExport.ColumnByFieldName(ckCampos.Items[i]).Visible;
  end;
end;

procedure TfrmCadMapaLaboratorio.ckCamposClickCheck(Sender: TObject);
  var i, band:integer; bSel, bandVisible:Boolean;
begin
  i := ckCampos.ItemIndex;
  bSel := ckCampos.Checked[i];
  grExport.ColumnByFieldName(ckCampos.Items[i]).Visible := bSel;
  band := grExport.ColumnByFieldName(ckCampos.Items[i]).BandIndex;

  bandVisible := false;
  for i:=0 to grExport.ColumnCount-1 do
  begin
    if grExport.Columns[i].BandIndex = band then
      if grExport.Columns[i].Visible then
        bandVisible := true;
  end;
  grExport.Bands.Items[band].Visible := bandVisible;
end;

procedure TfrmCadMapaLaboratorio.Imprimir1Click(Sender: TObject);
begin
  inherited;
  grExport.SaveToHTML(sPathTemp+'\export.html', true);
  ShellExecute(0, 'open', Pchar(sPathTemp+'\export.html'), nil, nil, SW_SHOW);
end;

end.


