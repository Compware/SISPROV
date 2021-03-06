unit uCadMapaMedico;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UfrmCadPadFichas, dxExEdtr, DB, dxCntner, dxTL, dxDBCtrl, dxDBGrid,
  ComCtrls, StdCtrls, Buttons, ExtCtrls, Grids, IBCustomDataSet, IBQuery,
  RxLookup, Mask, DBCtrls, DBGrids, RxDBComb, RpCon, RpConDS, RpBase,
  RpSystem, RpDefine, RpRave, DBClient, Midaslib, ImgList, ib_parse,
  dxEditor, dxEdLib, UfrmCadPad, ToolEdit, Menus, UfrmCadPadSG, dxDBTLCl,
  dxGrClms,  RXDBCtrl, ufrmLocalizar, uGeralSQL, uCadNotificacao, frxClass,
  frxExportPDF, frxDBSet, uCadCID10, dxDBELib, CheckLst, ShellApi;

type
  TfrmCadMapaMedico = class(TfrmCadPad)
    qyGrid: TIBQuery;
    gcCD_MAPA: TdxDBGridColumn;
    dsMapaLinha: TDataSource;
    Panel5: TPanel;
    Panel6: TPanel;
    btIns: TSpeedButton;
    btDel: TSpeedButton;
    fxMapa: TfrxReport;
    fxdbMapa: TfrxDBDataset;
    frxPDFExport1: TfrxPDFExport;
    fxdbPaciente: TfrxDBDataset;
    TB_MAPA_MEDICO: TIBDataSet;
    TB_MAPA_MEDICO_LINHA: TIBDataSet;
    dsMapaMedico: TDataSource;
    TB_MAPA_MEDICOCD_MAPA: TIntegerField;
    TB_MAPA_MEDICOCD_UNIDADE: TIntegerField;
    Label2: TLabel;
    TB_MAPA_MEDICO_LINHACD_MAPA_LINHA: TIntegerField;
    TB_MAPA_MEDICO_LINHACD_MAPA: TIntegerField;
    TB_MAPA_MEDICO_LINHANR_PROCESSO: TIBStringField;
    TB_MAPA_MEDICO_LINHADT_CONSULTA: TDateTimeField;
    TB_MAPA_MEDICO_LINHATP_CONSULTA: TIntegerField;
    TB_MAPA_MEDICO_LINHANM_PACIENTE: TIBStringField;
    TB_MAPA_MEDICO_LINHAFL_SEXO: TIBStringField;
    TB_MAPA_MEDICO_LINHANR_IDADE_ANOS: TIntegerField;
    TB_MAPA_MEDICO_LINHANR_IDADE_MESES: TIntegerField;
    TB_MAPA_MEDICO_LINHAVL_GESTANTE: TIBStringField;
    TB_MAPA_MEDICO_LINHADT_PRIMEIRA_CONSULTA: TDateTimeField;
    TB_MAPA_MEDICO_LINHAVL_ESTADIO_PC: TIBStringField;
    TB_MAPA_MEDICO_LINHAVL_CV_PC: TIBStringField;
    TB_MAPA_MEDICO_LINHADT_PRIMEIRO_TARV: TDateTimeField;
    TB_MAPA_MEDICO_LINHAVL_PRIMEIRO_ESQUEMA: TIBStringField;
    TB_MAPA_MEDICO_LINHADT_ULTIMA_CONSULTA: TDateTimeField;
    TB_MAPA_MEDICO_LINHAVL_ESTADIO_UC: TIBStringField;
    TB_MAPA_MEDICO_LINHAVL_CV_UC: TIBStringField;
    TB_MAPA_MEDICO_LINHAVL_RASTREIO_TB: TIBStringField;
    TB_MAPA_MEDICO_LINHAVL_DIAGNOSTICO_TB: TIBStringField;
    TB_MAPA_MEDICO_LINHAVL_TB_NOVO: TIBStringField;
    TB_MAPA_MEDICO_LINHAVL_TB_RECAIDA: TIBStringField;
    TB_MAPA_MEDICO_LINHAVL_TB_FRACASSADO: TIBStringField;
    TB_MAPA_MEDICO_LINHAVL_TB_REAPARECIDO: TIBStringField;
    TB_MAPA_MEDICO_LINHAVL_TB_SI: TIBStringField;
    TB_MAPA_MEDICO_LINHACD_UND_REF_TB: TIntegerField;
    TB_MAPA_MEDICO_LINHAVL_N: TIBStringField;
    TB_MAPA_MEDICO_LINHAVL_I: TIBStringField;
    TB_MAPA_MEDICO_LINHAVL_M: TIBStringField;
    TB_MAPA_MEDICO_LINHAVL_T: TIBStringField;
    TB_MAPA_MEDICO_LINHAVL_TARV_PADRAO: TIBStringField;
    TB_MAPA_MEDICO_LINHAVL_PRESCRICAO_IONIZADA: TIBStringField;
    TB_MAPA_MEDICO_LINHAVL_PRESCRICAO_COTROMIXAZOL: TIBStringField;
    grMapaMedico: TdxDBGrid;
    gcNR_PROCESSO: TdxDBGridColumn;
    gcNM_PACIENTE: TdxDBGridMaskColumn;
    gcTP_SEXO: TdxDBGridColumn;
    gcNR_IDADE_ANOS: TdxDBGridColumn;
    gcNR_IDADE_MESES: TdxDBGridColumn;
    gcVL_CD4_PC: TdxDBGridColumn;
    gcVL_CV_PC: TdxDBGridColumn;
    gcVL_N: TdxDBGridCheckColumn;
    gcVL_I: TdxDBGridCheckColumn;
    gcVL_T: TdxDBGridCheckColumn;
    gcVL_M: TdxDBGridCheckColumn;
    gcVL_PRIMEIRO_ESQUEMA: TdxDBGridColumn;
    gcBTEsq: TdxDBGridButtonColumn;
    gcVL_CD4_UC: TdxDBGridColumn;
    gcDT_PRIMEIRA_CONSULTA: TdxDBGridDateColumn;
    gcDT_PRIMEIRO_TARV: TdxDBGridDateColumn;
    gcDT_ULTIMA_CONSULTA: TdxDBGridDateColumn;
    gcVL_CV_UC: TdxDBGridColumn;
    qyGridCD_MAPA: TIntegerField;
    qyGridCD_UNIDADE: TIntegerField;
    TB_MAPA_MEDICOCD_MEDICO: TIntegerField;
    TB_MAPA_MEDICONM_MEDICO: TIBStringField;
    TB_MAPA_MEDICODT_MAPA: TDateTimeField;
    dtMapa: TDBDateEdit;
    btLocMedico: TdxDBButtonEdit;
    edMedico: TdxDBEdit;
    Label3: TLabel;
    qyGridDT_MAPA: TDateTimeField;
    qyGridCD_MEDICO: TIntegerField;
    qyGridNM_MEDICO: TIBStringField;
    gcNM_MEDICO: TdxDBGridColumn;
    gcDT_MAPA: TdxDBGridColumn;
    gcVL_GESTANTE: TdxDBGridCheckColumn;
    gcVL_ESTADIO_PC: TdxDBGridPickColumn;
    TB_MAPA_MEDICO_LINHADT_ESTADIO_UC: TDateTimeField;
    TB_MAPA_MEDICO_LINHADT_CD4_UC: TDateTimeField;
    TB_MAPA_MEDICO_LINHADT_CV_UC: TDateTimeField;
    gcDT_ESTADIO_UC: TdxDBGridDateColumn;
    gcDT_CD4_UC: TdxDBGridDateColumn;
    gcDT_CV_UC: TdxDBGridDateColumn;
    gcVL_ESTADIO_UC: TdxDBGridPickColumn;
    gcVL_RASTREIO_TB: TdxDBGridCheckColumn;
    gcBTEsq2: TdxDBGridButtonColumn;
    gcVL_PRESCRICAO_IONIZADA: TdxDBGridCheckColumn;
    gcVL_PRESCRICAO_COTROMIXAZOL: TdxDBGridCheckColumn;
    qyPrimeiraConsulta: TIBQuery;
    qyPrimeiraConsultaVL_ESTADIO_PC: TIBStringField;
    qyPrimeiraConsultaVL_CV_PC: TIBStringField;
    qyPrimeiraConsultaDT_PRIMEIRA_CONSULTA: TDateTimeField;
    gcVL_TARV_PADRAO: TdxDBGridColumn;
    qyUltimaConsulta: TIBQuery;
    qyUltimaConsultaVL_PRIMEIRO_ESQUEMA: TIBStringField;
    qyUltimaConsultaVL_TARV_PADRAO: TIBStringField;
    TB_MAPA_MEDICO_LINHACD_PACIENTE: TIntegerField;
    TB_MAPA_MEDICO_LINHACD_AGENDA: TIntegerField;
    TB_MAPA_MEDICODS_UNIDADE: TIBStringField;
    TB_MAPA_MEDICODS_MUNICIPIO: TIBStringField;
    TB_MAPA_MEDICODS_PROVINCIA: TIBStringField;
    TB_MAPA_MEDICO_LINHACODIGO: TIntegerField;
    qyAgenda: TIBQuery;
    qyAgendaCD_AGENDA: TIntegerField;
    qyAgendaCD_MEDICO: TIntegerField;
    qyAgendaCD_PACIENTE: TIntegerField;
    qyAgendaDS_ESQUEMA: TIBStringField;
    qyAgendaDT_AGENDA: TDateTimeField;
    qyAgendaFL_ESQUEMA: TIntegerField;
    qyAgendaTP_ESQUEMA: TIntegerField;
    qyAgendaVL_CD4: TIntegerField;
    btAgenda: TBitBtn;
    qyAgendaNR_PROCESSO: TIntegerField;
    gcCODIGO: TdxDBGridColumn;
    TB_MAPA_MEDICO_LINHAVL_NITM: TStringField;
    tabExport: TTabSheet;
    grExport: TdxDBGrid;
    dxDBGridColumn1: TdxDBGridColumn;
    dxDBGridColumn2: TdxDBGridColumn;
    dxDBGridMaskColumn1: TdxDBGridMaskColumn;
    dxDBGridColumn3: TdxDBGridColumn;
    dxDBGridColumn4: TdxDBGridColumn;
    dxDBGridColumn5: TdxDBGridColumn;
    dxDBGridCheckColumn1: TdxDBGridCheckColumn;
    dxDBGridDateColumn1: TdxDBGridDateColumn;
    dxDBGridPickColumn1: TdxDBGridPickColumn;
    dxDBGridColumn6: TdxDBGridColumn;
    dxDBGridColumn7: TdxDBGridColumn;
    dxDBGridDateColumn2: TdxDBGridDateColumn;
    dxDBGridColumn8: TdxDBGridColumn;
    dxDBGridDateColumn3: TdxDBGridDateColumn;
    dxDBGridPickColumn2: TdxDBGridPickColumn;
    dxDBGridDateColumn4: TdxDBGridDateColumn;
    dxDBGridColumn9: TdxDBGridColumn;
    dxDBGridDateColumn5: TdxDBGridDateColumn;
    dxDBGridColumn10: TdxDBGridColumn;
    dxDBGridDateColumn6: TdxDBGridDateColumn;
    dxDBGridCheckColumn2: TdxDBGridCheckColumn;
    dxDBGridCheckColumn3: TdxDBGridCheckColumn;
    dxDBGridCheckColumn4: TdxDBGridCheckColumn;
    dxDBGridCheckColumn5: TdxDBGridCheckColumn;
    dxDBGridCheckColumn6: TdxDBGridCheckColumn;
    dxDBGridColumn11: TdxDBGridColumn;
    dxDBGridCheckColumn7: TdxDBGridCheckColumn;
    dxDBGridCheckColumn8: TdxDBGridCheckColumn;
    qyExport: TIBQuery;
    dsExport: TDataSource;
    grExportColumn31: TdxDBGridColumn;
    grExportColumn32: TdxDBGridColumn;
    grExportColumn33: TdxDBGridDateColumn;
    grExportColumn34: TdxDBGridColumn;
    SaveDialog1: TSaveDialog;
    N1: TMenuItem;
    Excel1: TMenuItem;
    TB_MAPA_MEDICO_LINHAVL_CD4_PC: TIntegerField;
    TB_MAPA_MEDICO_LINHAVL_CD4_UC: TIntegerField;
    qyPrimeiraConsultaVL_CD4_PC: TIntegerField;
    Panel7: TPanel;
    ckHistorico: TCheckBox;
    TB_MAPA_MEDICO_LINHAVL_ULTIMA_ESQUEMA: TIBStringField;
    gcVL_ULTIMA_ESQUEMA: TdxDBGridColumn;
    gcBTEsq3: TdxDBGridButtonColumn;
    grExportColumn35: TdxDBGridColumn;
    N2: TMenuItem;
    Editar1: TMenuItem;
    gcDT_PREV_GEST: TdxDBGridDateColumn;
    grExportDTPrevGest: TdxDBGridDateColumn;
    TB_MAPA_MEDICO_LINHADT_PREV_GESTACAO: TDateField;
    TB_MAPA_MEDICO_LINHANR_MESES: TIntegerField;
    gcNR_MESES: TdxDBGridColumn;
    qyExportNR_MESES: TIntegerField;
    grExportNR_MESES: TdxDBGridColumn;
    qyExportTODOS: TIBStringField;
    qyExportCD_MAPA_LINHA: TIntegerField;
    qyExportCD_MAPA: TIntegerField;
    qyExportNR_PROCESSO: TIBStringField;
    qyExportDT_CONSULTA: TDateTimeField;
    qyExportTP_CONSULTA: TIntegerField;
    qyExportCD_PACIENTE: TIntegerField;
    qyExportNM_PACIENTE: TIBStringField;
    qyExportFL_SEXO: TIBStringField;
    qyExportNR_IDADE_ANOS: TIntegerField;
    qyExportNR_IDADE_MESES: TIntegerField;
    qyExportVL_GESTANTE: TIBStringField;
    qyExportDT_PRIMEIRA_CONSULTA: TDateTimeField;
    qyExportVL_ESTADIO_PC: TIBStringField;
    qyExportVL_CD4_PC: TIntegerField;
    qyExportVL_CV_PC: TIBStringField;
    qyExportDT_PRIMEIRO_TARV: TDateTimeField;
    qyExportVL_PRIMEIRO_ESQUEMA: TIBStringField;
    qyExportVL_ULTIMA_ESQUEMA: TIBStringField;
    qyExportDT_ULTIMA_CONSULTA: TDateTimeField;
    qyExportVL_ESTADIO_UC: TIBStringField;
    qyExportVL_CD4_UC: TIntegerField;
    qyExportVL_CV_UC: TIBStringField;
    qyExportVL_RASTREIO_TB: TIBStringField;
    qyExportVL_DIAGNOSTICO_TB: TIBStringField;
    qyExportVL_TB_NOVO: TIBStringField;
    qyExportVL_TB_RECAIDA: TIBStringField;
    qyExportVL_TB_FRACASSADO: TIBStringField;
    qyExportVL_TB_REAPARECIDO: TIBStringField;
    qyExportVL_TB_SI: TIBStringField;
    qyExportCD_UND_REF_TB: TIntegerField;
    qyExportVL_N: TIBStringField;
    qyExportVL_I: TIBStringField;
    qyExportVL_M: TIBStringField;
    qyExportVL_T: TIBStringField;
    qyExportVL_TARV_PADRAO: TIBStringField;
    qyExportVL_PRESCRICAO_IONIZADA: TIBStringField;
    qyExportVL_PRESCRICAO_COTROMIXAZOL: TIBStringField;
    qyExportDT_ESTADIO_UC: TDateTimeField;
    qyExportDT_CD4_UC: TDateTimeField;
    qyExportDT_CV_UC: TDateTimeField;
    qyExportCD_AGENDA: TIntegerField;
    qyExportDT_PREV_GESTACAO: TDateField;
    qyExportCD_MAPA1: TIntegerField;
    qyExportCD_UNIDADE: TIntegerField;
    qyExportDT_MAPA: TDateTimeField;
    qyExportCD_MEDICO: TIntegerField;
    qyExportNM_MEDICO: TIBStringField;
    qyCD4_Laboratorio: TIBQuery;
    qyCV_Laboratorio: TIBQuery;
    qyCD4_LaboratorioVL_RESULTADO: TIBStringField;
    qyCV_LaboratorioVL_RESULTADO: TIBStringField;
    TB_MAPA_MEDICO_LINHAVL_RASTREIO_ITS: TIBStringField;
    gcVL_RASTREIO_ITS: TdxDBGridCheckColumn;
    gcVL_DIAGNOSTICO_TB: TdxDBGridCheckColumn;
    qyUltimaConsultaVL_RASTREIO_TB: TIBStringField;
    qyUltimaConsultaVL_DIAGNOSTICO_TB: TIBStringField;
    qyCD4_LaboratorioDT_RESULTADO: TDateTimeField;
    qyCV_LaboratorioDT_RESULTADO: TDateTimeField;
    Imprimir1: TMenuItem;
    pnCampos: TPanel;
    ckCampos: TCheckListBox;
    btCampos: TBitBtn;
    Panel8: TPanel;
    qyUltimaConsultaDT_MAPA: TDateTimeField;
    qyPrimeiroTarv: TIBQuery;
    qyPrimeiroTarvDT_PRIMEIRO_TARV: TDateTimeField;
    qyPrimeiroTarvVL_PRIMEIRO_ESQUEMA: TIBStringField;
    qyExportVL_RASTREIO_ITS: TIBStringField;
    grExportColumn36: TdxDBGridCheckColumn;
    grExportColumn37: TdxDBGridCheckColumn;
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
    procedure TB_MAPA_MEDICO_LINHAAfterInsert(DataSet: TDataSet);
    procedure TB_MAPA_MEDICOBeforeClose(DataSet: TDataSet);
    procedure TB_MAPA_MEDICOAfterOpen(DataSet: TDataSet);
    procedure TB_MAPA_MEDICO_LINHABeforeInsert(DataSet: TDataSet);
    procedure grDadosDblClick(Sender: TObject);
    procedure TB_MAPA_MEDICO_LINHANR_PROCESSOValidate(Sender: TField);
    procedure gcBTEsqButtonClick(Sender: TObject; AbsoluteIndex: Integer);
    procedure gcBTCIDPCButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure gcBTEsq2ButtonClick(Sender: TObject; AbsoluteIndex: Integer);
    procedure btLocMedicoButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure btPesquisarClick(Sender: TObject);
    procedure TB_MAPA_MEDICO_LINHAVL_NValidate(Sender: TField);
    procedure TB_MAPA_MEDICOAfterInsert(DataSet: TDataSet);
    procedure TB_MAPA_MEDICO_LINHAVL_MValidate(Sender: TField);
    procedure TB_MAPA_MEDICO_LINHAVL_IValidate(Sender: TField);
    procedure TB_MAPA_MEDICO_LINHAVL_TValidate(Sender: TField);
    procedure TB_MAPA_MEDICO_LINHABeforePost(DataSet: TDataSet);
    procedure TB_MAPA_MEDICO_LINHACalcFields(DataSet: TDataSet);
    procedure btAgendaClick(Sender: TObject);
    procedure Excel1Click(Sender: TObject);
    procedure qyExportAfterScroll(DataSet: TDataSet);
    procedure AtualizarLista1Click(Sender: TObject);
    procedure qyExportBeforeOpen(DataSet: TDataSet);
    procedure pgGeralChange(Sender: TObject);
    procedure TB_MAPA_MEDICOBeforeDelete(DataSet: TDataSet);
    procedure TB_MAPA_MEDICODT_MAPAValidate(Sender: TField);
    procedure TB_MAPA_MEDICOCD_MEDICOValidate(Sender: TField);
    procedure gcBTEsq3ButtonClick(Sender: TObject; AbsoluteIndex: Integer);
    procedure Editar1Click(Sender: TObject);
    procedure TB_MAPA_MEDICO_LINHAVL_GESTANTEValidate(Sender: TField);
    procedure qyExportCalcFields(DataSet: TDataSet);
    procedure btLocMedicoChange(Sender: TObject);
    procedure TB_MAPA_MEDICOBeforePost(DataSet: TDataSet);
    procedure Imprimir1Click(Sender: TObject);
    procedure btCamposClick(Sender: TObject);
    procedure ckCamposClickCheck(Sender: TObject);
  private
    function SelecionarEsquema: Boolean;
    procedure LancaAgenda;
    procedure ValidarMapa;
    procedure LocalizarMapa;
    procedure BuscaDT_PREV_GESTACAO;
    procedure ValidarPacienteExiste;
    { Private declarations }
  public
    { Public declarations }
    sNomeTabela:string;
    procedure AbreConsultas;
    procedure FechaConsultas;
  end;

var
  frmCadMapaMedico: TfrmCadMapaMedico;
  bEdit, bConsolidado:Boolean;
  Unidade :Integer;
  MesAno:String;
  sSQLUnidade, sSQLAgenda, sSQLExport:string;
  bExportando:boolean;

implementation

uses UDMGERAL, UDM, DateUtils, Ugeral, uRelatorioWEB, uFuncaoGrid,
  uFuncaoContraSenha, UfrmRelMapa, UfrmControleGestantes, uConsAbandono;

{$R *.dfm}

procedure TfrmCadMapaMedico.FormShow(Sender: TObject);
begin
  inherited;
  grExport.LoadFromIniFile(grExport.IniFileName);
  qyGrid.Open;
  pgGeral.ActivePageIndex := 0;
end;

procedure TfrmCadMapaMedico.btgravarClick(Sender: TObject);
begin
  if TB_MAPA_MEDICO_LINHA.state in dsEditModes then
     TB_MAPA_MEDICO_LINHA.Post;
  inherited;
  dsMapaLinha.AutoEdit := false;
end;

procedure TfrmCadMapaMedico.AbreConsultas;
begin
  sSQLExport := qyExport.SQL.Text;
  sSQLAgenda := dmGeral.TB_AGENDA.SelectSQL.Text;
  dmGeral.TB_AGENDA.SelectSQL.Text := StringReplace(sSQLAgenda,'/*MEDICO*/',
     'AND  "AGENDA".CD_MEDICO = :CD_MEDICO ' + chr(13) +
     'AND  "AGENDA".CD_PACIENTE = :CD_PACIENTE'
     ,[]);
  dmGeral.TB_AGENDAFL_CONFIRMADO.OnValidate := nil;
end;

procedure TfrmCadMapaMedico.FechaConsultas;
begin
  dmGeral.TB_AGENDA.Close;
  dmGeral.TB_AGENDA.SelectSQL.Text := sSQLAgenda;
  dmGeral.TB_AGENDAFL_CONFIRMADO.OnValidate := dmGeral.TB_AGENDAFL_CONFIRMADOValidate;
end;

procedure TfrmCadMapaMedico.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  FechaConsultas;
  frmCID10.Free;
end;

procedure TfrmCadMapaMedico.FormCreate(Sender: TObject);
begin
  inherited;
  FbPermiteMudarPagina := False;
  grExport.IniFileName := sPathGrid + '\' + self.Name + '.ini';
  AbreConsultas;
end;

procedure TfrmCadMapaMedico.btexcluirClick(Sender: TObject);
begin
  {TODO:Criar historico ao Excluir}
  if (not VerificaPermissao(49)) then
  begin
    ShowMessage('Usu�rio sem permiss�o para realizar esta opera��o!');
    Exit;
  end;
  pgGeral.ActivePageIndex := 1;
  pgGeralChange(sender);
  inherited;
end;

procedure TfrmCadMapaMedico.btIncluirClick(Sender: TObject);
begin
  if (not VerificaPermissao(48)) then
  begin
    ShowMessage('Usu�rio sem permiss�o para realizar esta opera��o!');
    Exit;
  end;
  pgGeral.ActivePageIndex := 1;
  dsMapaLinha.AutoEdit := true;
  inherited;
end;

procedure TfrmCadMapaMedico.btimprimirClick(Sender: TObject);
var sRel:string;
begin
  frmRelMapa := TfrmRelMapa.Create(Application);
  if frmRelMapa.ShowModal = mrOK then
  begin
    if frmRelMapa.rbMapaSimples.Checked then
      sRel := '\RelMapaMedico.fr3';
    if frmRelMapa.rbMapaCompleto.Checked then
      sRel := '\RelMapaMedicoCompleto.fr3';
    fxMapa.LoadFromFile(sPathLayOut + sRel);
    fxMapa.ShowReport;
  end;
  FreeAndNil(frmRelMapa);
end;

procedure TfrmCadMapaMedico.btLimparClick(Sender: TObject);
begin
  inherited;
  Limpar;
end;

procedure TfrmCadMapaMedico.bteditarClick(Sender: TObject);
begin
  if (not VerificaPermissao(48)) then
  begin
    ShowMessage('Usu�rio sem permiss�o para realizar esta opera��o!');
    Exit;
  end;
  pgGeral.ActivePageIndex := 1;
  pgGeralChange(sender);
  inherited;
  dsMapaLinha.AutoEdit := true;
end;


procedure TfrmCadMapaMedico.btCancelarClick(Sender: TObject);
begin
  inherited;
  dsMapaLinha.AutoEdit := false;
end;

procedure TfrmCadMapaMedico.btInsClick(Sender: TObject);
begin
  inherited;
  if btGravar.Enabled then
    dsMapaLinha.DataSet.Append;
end;

procedure TfrmCadMapaMedico.btDelClick(Sender: TObject);
begin
  inherited;
  if btGravar.Enabled then
    dsMapaLinha.DataSet.Delete;
end;

procedure TfrmCadMapaMedico.dsControleStateChange(Sender: TObject);
begin
  inherited;
  //btexcluir.Enabled := false;
end;

procedure TfrmCadMapaMedico.TB_MAPA_MEDICO_LINHAAfterInsert(
  DataSet: TDataSet);
var dData:TDate;
begin
  inherited;
  TB_MAPA_MEDICO_LINHACD_MAPA.AsInteger :=
    TB_MAPA_MEDICOCD_MAPA.AsInteger;

  dData := DM.GetDate;
  TB_MAPA_MEDICO_LINHADT_ESTADIO_UC.AsDateTime := dData;
  TB_MAPA_MEDICO_LINHADT_CD4_UC.AsDateTime := dData;
  TB_MAPA_MEDICO_LINHADT_CV_UC.AsDateTime := dData;
  TB_MAPA_MEDICO_LINHADT_ULTIMA_CONSULTA.AsDateTime := dData;
end;

procedure TfrmCadMapaMedico.TB_MAPA_MEDICOBeforeClose(
  DataSet: TDataSet);
begin
  inherited;
  TB_MAPA_MEDICO_LINHA.Close;
end;

procedure TfrmCadMapaMedico.TB_MAPA_MEDICOAfterOpen(DataSet: TDataSet);
begin
  inherited;
  TB_MAPA_MEDICO_LINHA.Open;
end;

procedure TfrmCadMapaMedico.TB_MAPA_MEDICO_LINHABeforeInsert(
  DataSet: TDataSet);
begin
  inherited;
  if TB_MAPA_MEDICO.state in dsEditModes then
     TB_MAPA_MEDICO.Post;
end;

procedure TfrmCadMapaMedico.grDadosDblClick(Sender: TObject);
begin
  inherited;
  LocalizarMapa;
end;

procedure TfrmCadMapaMedico.TB_MAPA_MEDICO_LINHANR_PROCESSOValidate(
  Sender: TField);
var
  evento : TFieldNotifyEvent;
begin
  inherited;
  if not TB_MAPA_MEDICO_LINHANR_PROCESSO.IsNull then
  begin
    ValidarPacienteExiste;
    with TIBQuery.Create(nil) do
    begin
      Database := dm.DB;
      Transaction := dm.TS;
      SQl.Add('SELECT * FROM PACIENTE');
      SQl.Add('WHERE NR_PROCESSO = ' + TB_MAPA_MEDICO_LINHANR_PROCESSO.AsString );
      Open;

      if VerificaUtenteAbandono(FieldByName('CD_PACIENTE').AsInteger) then
      begin
        ShowMessage('Este paciente esta em abandono, antes de inclui-lo no mapa � preciso mudar o status para ACTIVO!');
        frmConsAbandono := TfrmConsAbandono.Create(Application);
        frmConsAbandono.procuraCD_PACIENTE :=  FieldByName('CD_PACIENTE').AsInteger;
        frmConsAbandono.edicaoExterna := True;
        if frmConsAbandono.ShowModal <> mrOk then
          Abort;
      end;

      TB_MAPA_MEDICO_LINHACD_PACIENTE.AsString := FieldByName('CD_PACIENTE').AsString;
      TB_MAPA_MEDICO_LINHANM_PACIENTE.AsString := FieldByName('NM_PACIENTE').AsString;
      TB_MAPA_MEDICO_LINHANR_IDADE_ANOS.AsInteger :=
          YearsBetween(TB_MAPA_MEDICODT_MAPA.AsDateTime, FieldByName('DT_NASCIMENTO').AsDateTime);
      if TB_MAPA_MEDICO_LINHANR_IDADE_ANOS.AsInteger = 0 then
        TB_MAPA_MEDICO_LINHANR_IDADE_MESES.AsInteger :=
          MonthsBetween(TB_MAPA_MEDICODT_MAPA.AsDateTime, FieldByName('DT_NASCIMENTO').AsDateTime)
      else
        TB_MAPA_MEDICO_LINHANR_IDADE_MESES.AsInteger := 0;
      TB_MAPA_MEDICO_LINHAFL_SEXO.AsString := FieldByName('TP_SEXO').AsString;

      AtualizaPacienteIdade(FieldByName('CD_PACIENTE').AsInteger);

      evento := TB_MAPA_MEDICO_LINHAVL_GESTANTE.OnValidate;
      TB_MAPA_MEDICO_LINHAVL_GESTANTE.OnValidate := nil;
      if FieldByName('FL_GESTANTE').AsInteger = 1 then
        TB_MAPA_MEDICO_LINHAVL_GESTANTE.AsString := 'S'
      else
        TB_MAPA_MEDICO_LINHAVL_GESTANTE.AsString := 'N';
      BuscaDT_PREV_GESTACAO;
      TB_MAPA_MEDICO_LINHAVL_GESTANTE.OnValidate := evento;

      //Primeira Consulta
      qyPrimeiraConsulta.Close;
      qyPrimeiraConsulta.ParamByName('NR_PROCESSO').AsString := TB_MAPA_MEDICO_LINHANR_PROCESSO.AsString;
      qyPrimeiraConsulta.Open;
      if not qyPrimeiraConsulta.IsEmpty then
      begin
          TB_MAPA_MEDICO_LINHAVL_CD4_PC.AsString := qyPrimeiraConsultaVL_CD4_PC.AsString;
          TB_MAPA_MEDICO_LINHAVL_CV_PC.AsString := qyPrimeiraConsultaVL_CV_PC.AsString;
          TB_MAPA_MEDICO_LINHADT_PRIMEIRA_CONSULTA.AsString := qyPrimeiraConsultaDT_PRIMEIRA_CONSULTA.AsString;
          TB_MAPA_MEDICO_LINHAVL_ESTADIO_PC.AsString := qyPrimeiraConsultaVL_ESTADIO_PC.AsString;
      end;
      qyPrimeiraConsulta.Close;

      //Primeiro TARV
      qyPrimeiroTarv.Close;
      qyPrimeiroTarv.ParamByName('NR_PROCESSO').AsString := TB_MAPA_MEDICO_LINHANR_PROCESSO.AsString;
      qyPrimeiroTarv.Open;
      if not qyPrimeiroTarv.IsEmpty then
      begin
          TB_MAPA_MEDICO_LINHAVL_PRIMEIRO_ESQUEMA.AsString := qyPrimeiroTarvVL_PRIMEIRO_ESQUEMA.AsString;
          TB_MAPA_MEDICO_LINHADT_PRIMEIRO_TARV.AsString := qyPrimeiroTarvDT_PRIMEIRO_TARV.AsString;
      end;
      qyPrimeiroTarv.Close;

      //Ultima Consulta
      qyUltimaConsulta.Close;
      qyUltimaConsulta.ParamByName('NR_PROCESSO').AsString :=
            TB_MAPA_MEDICO_LINHANR_PROCESSO.AsString;
      qyUltimaConsulta.ParamByName('CD_MAPA_LINHA').AsString :=
            TB_MAPA_MEDICO_LINHACD_MAPA_LINHA.AsString;
      qyUltimaConsulta.Open;

      TB_MAPA_MEDICO_LINHAVL_RASTREIO_TB.AsString := 'N';
      TB_MAPA_MEDICO_LINHAVL_DIAGNOSTICO_TB.AsString := 'N';

      if not qyUltimaConsulta.IsEmpty then
      begin
         if not qyUltimaConsultaVL_TARV_PADRAO.IsNull then
           TB_MAPA_MEDICO_LINHAVL_ULTIMA_ESQUEMA.AsString :=
             qyUltimaConsultaVL_TARV_PADRAO.AsString;
         if not qyUltimaConsultaDT_MAPA.IsNull then
          TB_MAPA_MEDICO_LINHADT_ULTIMA_CONSULTA.AsString :=
            qyUltimaConsultaDT_MAPA.AsString;
         //if qyUltimaConsultaVL_RASTREIO_TB.AsString = 'S' then
        //  TB_MAPA_MEDICO_LINHAVL_RASTREIO_TB.AsString := 'N';
         if qyUltimaConsultaVL_DIAGNOSTICO_TB.AsString = 'S' then
          TB_MAPA_MEDICO_LINHAVL_DIAGNOSTICO_TB.AsString := 'S';
      end
      else
       TB_MAPA_MEDICO_LINHAVL_ULTIMA_ESQUEMA.AsString :=
           TB_MAPA_MEDICO_LINHAVL_PRIMEIRO_ESQUEMA.AsString ;
      qyUltimaConsulta.Close;

      // pega CD4 do resultado do laboratorio e coloca no CD4 Ultima consulta
      qyCD4_Laboratorio.Close;
      qyCD4_Laboratorio.ParamByName('NR_PROCESSO').AsString :=
        TB_MAPA_MEDICO_LINHANR_PROCESSO.AsString;
      qyCD4_Laboratorio.ParamByName('DT_MAPA').AsDateTime :=
        TB_MAPA_MEDICODT_MAPA.AsDateTime;
      qyCD4_Laboratorio.Open;
      if not qyCD4_Laboratorio.IsEmpty then
      begin
        try
          TB_MAPA_MEDICO_LINHAVL_CD4_UC.AsInteger := qyCD4_LaboratorioVL_RESULTADO.AsInteger;
          TB_MAPA_MEDICO_LINHADT_CD4_UC.AsString := qyCD4_LaboratorioDT_RESULTADO.AsString;
        except
          // Valor do resultado n�o � inteiro
        end;
      end;
      qyCD4_Laboratorio.Close;

      // pega o CV do resultado do laboratorio e coloca no CV Ultima consulta
      qyCV_Laboratorio.Close;
      qyCV_Laboratorio.ParamByName('NR_PROCESSO').AsString :=
        TB_MAPA_MEDICO_LINHANR_PROCESSO.AsString;
      qyCV_Laboratorio.ParamByName('DT_MAPA').AsDateTime :=
        TB_MAPA_MEDICODT_MAPA.AsDateTime;
      qyCV_Laboratorio.Open;
      if not qyCV_Laboratorio.IsEmpty then
      begin
        TB_MAPA_MEDICO_LINHAVL_CV_UC.AsString := qyCV_LaboratorioVL_RESULTADO.AsString;
        TB_MAPA_MEDICO_LINHADT_CV_UC.AsString := qyCV_LaboratorioDT_RESULTADO.AsString;
      end;
      qyCV_Laboratorio.Close;

      Close;
      Free;
    end;
  end;
end;

procedure TfrmCadMapaMedico.gcBTEsqButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
begin
  inherited;
  if dsMapaLinha.AutoEdit  then
  begin
    if not(TB_MAPA_MEDICO_LINHA.State in dsEditModes) then
      TB_MAPA_MEDICO_LINHA.Edit;

    Case AbsoluteIndex of
      0:begin
        try
          if SelecionarEsquema then
          begin
            if (not TB_MAPA_MEDICO_LINHAVL_PRIMEIRO_ESQUEMA.IsNull) and
               (frmLocalizar.qyDados.FieldByname('FL_COMPONENTE').AsString<>cvSim) then
            begin
               ShowMessage('Somente pode ser agrupado componente ao esquema!');
               Exit;
            end;

            if TB_MAPA_MEDICO_LINHAVL_PRIMEIRO_ESQUEMA.IsNull then
              TB_MAPA_MEDICO_LINHAVL_PRIMEIRO_ESQUEMA.AsString :=
                frmLocalizar.qyDados.FieldByname('DS_SIGLA').AsString
            else
            if (not TB_MAPA_MEDICO_LINHAVL_PRIMEIRO_ESQUEMA.IsNull) and
               (frmLocalizar.qyDados.FieldByname('FL_COMPONENTE').AsString=cvSim) then
            begin
              TB_MAPA_MEDICO_LINHAVL_PRIMEIRO_ESQUEMA.AsString :=
                 TB_MAPA_MEDICO_LINHAVL_PRIMEIRO_ESQUEMA.AsString + '+' +
                 frmLocalizar.qyDados.FieldByname('DS_SIGLA').AsString;
            end;
          end;
        finally
          frmLocalizar.qyDados.Close;
          FreeAndNil(frmLocalizar);
        end;
      end;
      1: TB_MAPA_MEDICO_LINHAVL_PRIMEIRO_ESQUEMA.Clear;
    end;
  end;
end;

function TfrmCadMapaMedico.SelecionarEsquema: Boolean;
begin
   if not Assigned(frmLocalizar) then
     frmLocalizar := TfrmLocalizar.Create(application);

   begin
      frmLocalizar.Caption := 'Localizar Esquema';
      frmLocalizar.qyDados := SelectDadosEsquema;
      try
        frmLocalizar.Where := false;
        SetLength(VCampo,7);
        frmLocalizar.KeyField := 'cd_esquema';
        VCampo[0].Titulo  := 'C�digo';
        VCampo[0].Width := 5;
        VCampo[1].Titulo  := 'Sigla';
        VCampo[1].Width := 30;
        VCampo[2].Titulo  := 'Nome Medicamento';
        VCampo[2].Width := 40;
        VCampo[3].Titulo  := 'Apresenta��o';
        VCampo[3].Width := 40;
        VCampo[4].Titulo  := 'Nome Comercial';
        VCampo[4].Width := 40;
        VCampo[5].Titulo  := 'Tipo';
        VCampo[5].Width := 10;
        VCampo[0].Visivel := True;
        VCampo[1].Visivel := True;
        VCampo[2].Visivel := True;
        VCampo[3].Visivel := True;
        VCampo[4].Visivel := True;
        VCampo[5].Visivel := True;
        VCampo[5].Grupo := True;

        //frmLocalizar.bAutoExpand := true;
        //frmLocalizar.bAutoAjust := true;
      except
        ShowMessage(frmLocalizar.qyDados.Sql.Text);
      end;
   end;
   result := frmLocalizar.ShowModal=mrok;
end;

procedure TfrmCadMapaMedico.gcBTCIDPCButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
begin
  inherited;
  if dsMapaLinha.AutoEdit then
  begin
    if not(TB_MAPA_MEDICO_LINHA.State in dsEditModes) then
      TB_MAPA_MEDICO_LINHA.Edit;

    Case AbsoluteIndex of
      0: if frmCID10.ShowModal = mrOK then
           TB_MAPA_MEDICO_LINHAVL_ESTADIO_PC.AsString := TB_MAPA_MEDICO_LINHAVL_ESTADIO_PC.AsString + frmCID10.FSG;
      1: TB_MAPA_MEDICO_LINHAVL_ESTADIO_PC.Clear;
    end;
  end;
end;

procedure TfrmCadMapaMedico.gcBTEsq2ButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
begin
  inherited;
  if dsMapaLinha.AutoEdit  then
  begin
    if not(TB_MAPA_MEDICO_LINHA.State in dsEditModes) then
      TB_MAPA_MEDICO_LINHA.Edit;

    Case AbsoluteIndex of
      0:begin
        try
          if SelecionarEsquema then
          begin
            if (not TB_MAPA_MEDICO_LINHAVL_TARV_PADRAO.IsNull) and
               (frmLocalizar.qyDados.FieldByname('FL_COMPONENTE').AsString<>cvSim) then
            begin
               ShowMessage('Somente pode ser agrupado componente ao esquema!');
               Exit;
            end;

            if TB_MAPA_MEDICO_LINHAVL_TARV_PADRAO.IsNull then
              TB_MAPA_MEDICO_LINHAVL_TARV_PADRAO.AsString :=
                frmLocalizar.qyDados.FieldByname('DS_SIGLA').AsString
            else
            if (not TB_MAPA_MEDICO_LINHAVL_TARV_PADRAO.IsNull) and
               (frmLocalizar.qyDados.FieldByname('FL_COMPONENTE').AsString=cvSim) then
            begin
              TB_MAPA_MEDICO_LINHAVL_TARV_PADRAO.AsString :=
                 TB_MAPA_MEDICO_LINHAVL_TARV_PADRAO.AsString + '+' +
                 frmLocalizar.qyDados.FieldByname('DS_SIGLA').AsString;
            end;
          end;
        finally
          frmLocalizar.qyDados.Close;
          FreeAndNil(frmLocalizar);
        end;
      end;
      1: TB_MAPA_MEDICO_LINHAVL_TARV_PADRAO.Clear;
    end;
  end;
end;

procedure TfrmCadMapaMedico.btLocMedicoButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
begin
  inherited;
  if TB_MAPA_MEDICO.State in [dsEdit, dsInsert] then
  begin
    frmLocalizar := TfrmLocalizar.Create(application);
    frmLocalizar.Caption := 'Localizar M�dico';
    frmLocalizar.qyDados := SelectDadosMedico;

    try
      frmLocalizar.Where := false;
      SetLength(VCampo,3);
      frmLocalizar.KeyField := 'cd_medico';
      VCampo[0].Titulo  := 'C�d.';
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
      TB_MAPA_MEDICONM_MEDICO.AsString := frmLocalizar.qyDados.FieldByname('nm_medico').AsString;
      TB_MAPA_MEDICOCD_MEDICO.AsInteger := frmLocalizar.qyDados.FieldByname('cd_medico').AsInteger;
    end;
    frmLocalizar.qyDados.Close;
    FreeAndNil(frmLocalizar);
  end;
end;

procedure TfrmCadMapaMedico.btPesquisarClick(Sender: TObject);
begin
  inherited;
  qyGrid.Close;
  qyGrid.Open;
end;

procedure TfrmCadMapaMedico.TB_MAPA_MEDICO_LINHAVL_NValidate(
  Sender: TField);
begin
  inherited;
  if (Sender.FieldName = 'VL_N') and (Sender.AsString = cvSim) then
  begin
    TB_MAPA_MEDICO_LINHAVL_I.AsString := cvNao;
    TB_MAPA_MEDICO_LINHAVL_T.AsString := cvNao;
    TB_MAPA_MEDICO_LINHAVL_M.AsString := cvNao;
  end;
  if (Sender.FieldName = 'VL_I') and (Sender.AsString = cvSim) then
  begin
    TB_MAPA_MEDICO_LINHAVL_N.AsString := cvNao;
    TB_MAPA_MEDICO_LINHAVL_T.AsString := cvNao;
    TB_MAPA_MEDICO_LINHAVL_M.AsString := cvNao;
  end;
  if (Sender.FieldName = 'VL_T') and (Sender.AsString = cvSim) then
  begin
    TB_MAPA_MEDICO_LINHAVL_I.AsString := cvNao;
    TB_MAPA_MEDICO_LINHAVL_N.AsString := cvNao;
    TB_MAPA_MEDICO_LINHAVL_M.AsString := cvNao;
  end;
  if (Sender.FieldName = 'VL_M') and (Sender.AsString = cvSim) then
  begin
    TB_MAPA_MEDICO_LINHAVL_I.AsString := cvNao;
    TB_MAPA_MEDICO_LINHAVL_T.AsString := cvNao;
    TB_MAPA_MEDICO_LINHAVL_N.AsString := cvNao;
  end;
end;

procedure TfrmCadMapaMedico.TB_MAPA_MEDICOAfterInsert(DataSet: TDataSet);
begin
  inherited;
  TB_MAPA_MEDICOCD_UNIDADE.AsString := prmUnidade;
end;

procedure TfrmCadMapaMedico.TB_MAPA_MEDICO_LINHAVL_MValidate(
  Sender: TField);
begin
  inherited;
  TB_MAPA_MEDICO_LINHAVL_NValidate(Sender);
  if TB_MAPA_MEDICO_LINHAVL_M.AsString = 'S' then
  begin
    TB_MAPA_MEDICO_LINHAVL_TARV_PADRAO.AsString :=
     TB_MAPA_MEDICO_LINHAVL_ULTIMA_ESQUEMA.AsString;
  end;
end;

procedure TfrmCadMapaMedico.TB_MAPA_MEDICO_LINHAVL_IValidate(
  Sender: TField);
begin
  inherited;
  TB_MAPA_MEDICO_LINHAVL_NValidate(Sender);
  if TB_MAPA_MEDICO_LINHAVL_I.AsString = 'S' then
  begin
    TB_MAPA_MEDICO_LINHAVL_TARV_PADRAO.AsString :=
     TB_MAPA_MEDICO_LINHAVL_PRIMEIRO_ESQUEMA.AsString;
  end;
end;

procedure TfrmCadMapaMedico.TB_MAPA_MEDICO_LINHAVL_TValidate(
  Sender: TField);
begin
  inherited;
  TB_MAPA_MEDICO_LINHAVL_NValidate(Sender);
end;

procedure TfrmCadMapaMedico.LancaAgenda;
begin
  inherited;
  dmGeral.TB_AGENDA.Close;
  dmGeral.TB_AGENDA.ParamByName('DT_DE').AsDate := Trunc(TB_MAPA_MEDICODT_MAPA.AsDateTime);
  dmGeral.TB_AGENDA.ParamByName('DT_ATE').AsDate := Trunc(TB_MAPA_MEDICODT_MAPA.AsDateTime)+1;
  dmGeral.TB_AGENDA.ParamByName('CD_MEDICO').AsString := TB_MAPA_MEDICOCD_MEDICO.AsString;
  dmGeral.TB_AGENDA.ParamByName('CD_PACIENTE').AsString := TB_MAPA_MEDICO_LINHACD_PACIENTE.AsString;
  dmGeral.TB_AGENDA.Open;
  if dmGeral.TB_AGENDA.IsEmpty then
  begin

      { antes de agendar confere se tinha agenda anterior
        para o mesmo medico/paciente e preenche DT_REMARCACAO}
     qyConfereAgendamento.Close;
     qyConfereAgendamento.ParamByName('PACIENTE').AsInteger := TB_MAPA_MEDICO_LINHACD_PACIENTE.AsInteger;
     qyConfereAgendamento.ParamByName('DATA').AsDateTime := TB_MAPA_MEDICODT_MAPA.AsDateTime;
     qyConfereAgendamento.ParamByName('CD_MEDICO').AsInteger := TB_MAPA_MEDICOCD_MEDICO.AsInteger;
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
            TB_MAPA_MEDICODT_MAPA.AsDateTime;
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
     dmGeral.TB_AGENDADT_AGENDA.AsDateTime := TB_MAPA_MEDICODT_MAPA.AsDateTime;
     dmGeral.TB_AGENDACD_MEDICO.AsString := TB_MAPA_MEDICOCD_MEDICO.AsString;
     dmGeral.TB_AGENDACD_PACIENTE.AsString := TB_MAPA_MEDICO_LINHACD_PACIENTE.AsString;
     dmGeral.TB_AGENDANR_PROCESSO.AsString := TB_MAPA_MEDICO_LINHANR_PROCESSO.AsString;
     dmGeral.TB_AGENDAFL_REALIZADO.AsInteger := cvFlSim;
     dmGeral.TB_AGENDAFL_CONFIRMADO.AsInteger := cvFlSim;
     if not TB_MAPA_MEDICO_LINHAVL_TARV_PADRAO.IsNull then
     begin
       dmGeral.TB_AGENDAFL_ESQUEMA.AsInteger := cvFlSim;
       dmGeral.TB_AGENDADS_ESQUEMA.AsString := TB_MAPA_MEDICO_LINHAVL_TARV_PADRAO.AsString;
     end;
     dmGeral.TB_AGENDA.Post;
     TB_MAPA_MEDICO_LINHACD_AGENDA.AsInteger := dmGeral.TB_AGENDACD_AGENDA.AsInteger;
  end
  else
  begin
    DMGERAL.TB_AGENDA.Edit;
    DMGERAL.TB_AGENDAFL_REALIZADO.AsInteger := cvFlSim;
    DMGERAL.TB_AGENDAFL_REALIZADO.AsInteger := cvFlSim;
    DMGERAL.TB_AGENDA.Post;
  end;
end;

procedure TfrmCadMapaMedico.TB_MAPA_MEDICO_LINHABeforePost(
  DataSet: TDataSet);
begin
  inherited;
  if TB_MAPA_MEDICO_LINHANR_PROCESSO.IsNull then
  begin
    ShowMessage('O campo Nr. Processo deve ser preenchido!');
    Abort;
  end;
  LancaAgenda;
end;

procedure TfrmCadMapaMedico.TB_MAPA_MEDICO_LINHACalcFields(
  DataSet: TDataSet);
begin
  inherited;
  TB_MAPA_MEDICO_LINHACODIGO.AsInteger := TB_MAPA_MEDICO_LINHA.RecNo;
  TB_MAPA_MEDICO_LINHAVL_NITM.AsString :=   '  ' +
    TB_MAPA_MEDICO_LINHAVL_N.AsString + '  ' +
    TB_MAPA_MEDICO_LINHAVL_I.AsString + '  ' +
    TB_MAPA_MEDICO_LINHAVL_T.AsString + '  ' +
    TB_MAPA_MEDICO_LINHAVL_M.AsString + '  ';

  if not TB_MAPA_MEDICO_LINHADT_PREV_GESTACAO.IsNull then
  begin
    if IncMonth(TB_MAPA_MEDICO_LINHADT_PREV_GESTACAO.AsDateTime, -9) >= TB_MAPA_MEDICODT_MAPA.AsDateTime then
      TB_MAPA_MEDICO_LINHANR_MESES.Clear
    else
    begin
      //TB_MAPA_MEDICO_LINHANR_MESES.AsInteger := StrToInt(FormatDateTime('mm', TB_MAPA_MEDICODT_MAPA.AsDateTime - IncMonth(TB_MAPA_MEDICO_LINHADT_PREV_GESTACAO.AsDateTime, -9)));
      TB_MAPA_MEDICO_LINHANR_MESES.AsInteger := (MonthsBetween(TB_MAPA_MEDICODT_MAPA.AsDateTime, IncMonth(TB_MAPA_MEDICO_LINHADT_PREV_GESTACAO.AsDateTime, -9)));
    end;
    if TB_MAPA_MEDICO_LINHANR_MESES.AsInteger > 9 then
      TB_MAPA_MEDICO_LINHANR_MESES.AsInteger := 9;
  end
  else
    TB_MAPA_MEDICO_LINHANR_MESES.Clear;

  if TB_MAPA_MEDICO_LINHAVL_GESTANTE.IsNull then
    TB_MAPA_MEDICO_LINHAVL_GESTANTE.AsString := 'N';
end;

procedure TfrmCadMapaMedico.btAgendaClick(Sender: TObject);
begin
  inherited;
  qyAgenda.Close;
  qyAgenda.ParamByName('CD_MEDICO').AsInteger :=
    TB_MAPA_MEDICOCD_MEDICO.AsInteger;
  qyAgenda.ParamByName('DT_AGENDA').AsDate :=
    Trunc(TB_MAPA_MEDICODT_MAPA.AsDateTime);
  qyAgenda.ParamByName('CD_MAPA').AsInteger :=
    TB_MAPA_MEDICOCD_MAPA.AsInteger;
  qyAgenda.Open;
  if not qyAgenda.IsEmpty then
  begin
     qyAgenda.First;
     while not qyAgenda.Eof do
     begin
       try
         if not TB_MAPA_MEDICO_LINHA.Locate('CD_PACIENTE',qyAgendaCD_PACIENTE.AsInteger,[]) then
         begin
           TB_MAPA_MEDICO_LINHA.Insert;
           TB_MAPA_MEDICO_LINHANR_PROCESSO.AsString :=
             qyAgendaNR_PROCESSO.AsString;
           if qyAgendaFL_ESQUEMA.AsInteger <> cvFlSim then
              TB_MAPA_MEDICO_LINHAVL_TARV_PADRAO.AsString := qyAgendaDS_ESQUEMA.AsString;
           TB_MAPA_MEDICO_LINHAVL_CD4_UC.AsString := qyAgendaVL_CD4.AsString;
           TB_MAPA_MEDICO_LINHACD_AGENDA.AsInteger := qyAgendaCD_AGENDA.AsInteger;
           TB_MAPA_MEDICO_LINHACD_PACIENTE.AsInteger := qyAgendaCD_PACIENTE.AsInteger;
           TB_MAPA_MEDICO_LINHA.Post;
         end;
       finally
         qyAgenda.Next;
       end;
     end;
  end;
  qyAgenda.Close;
end;

procedure TfrmCadMapaMedico.Excel1Click(Sender: TObject);
begin
  if not qyExport.Active then
    qyExport.Open;

  qyExport.Prior;
  qyExport.First;
  SaveDialog1.FileName := sPath + 'Temp\Todos.xls';
  if SaveDialog1.Execute then
  begin
    bExportando := true;
    dxDBGridMaskColumn1.Visible :=  true;
    grExport.SaveToXLS(SaveDialog1.FileName,true);
  end;
  dxDBGridMaskColumn1.Visible :=  false;
  bExportando := false;
end;

procedure TfrmCadMapaMedico.qyExportAfterScroll(DataSet: TDataSet);
begin
  if bExportando then
  begin
    sbPadrao.Panels[0].Text := 'Total:'+ intToStr(qyExport.RecordCount) + ' Atual:' +  intToStr(qyExport.RecNo);
    Application.ProcessMessages;
  end;
end;

procedure TfrmCadMapaMedico.AtualizarLista1Click(Sender: TObject);
begin
  qyExport.Close;
  qyExport.Open;
end;

procedure TfrmCadMapaMedico.qyExportBeforeOpen(DataSet: TDataSet);
begin
  inherited;
  qyExport.SQL.Text := sSQLExport;
  if not ckHistorico.Checked then
  begin
    qyExport.SQL.Text := StringReplace(sSQLExport,'/*CONDICAO*/',
      'WHERE ' +
      '"CD_MAPA_LINHA" =           '+
      '(SELECT MAX(CD_MAPA_LINHA)  '+
      ' FROM "MAPA_MEDICO_LINHA" M '+
      ' WHERE M.NR_PROCESSO = "MAPA_MEDICO_LINHA"."NR_PROCESSO")',
      []);
  end;
end;

procedure TfrmCadMapaMedico.pgGeralChange(Sender: TObject);
begin
  inherited;
  if pgGeral.ActivePageIndex = 0 then
    AtualizaLista;
end;

procedure TfrmCadMapaMedico.TB_MAPA_MEDICOBeforeDelete(DataSet: TDataSet);
begin
  inherited;
  while Not TB_MAPA_MEDICO_LINHA.Eof do
    TB_MAPA_MEDICO_LINHA.Delete;
end;

procedure TfrmCadMapaMedico.ValidarMapa;
var Codigo:Variant;
begin
 Codigo:= PegaValor('CD_MAPA','MAPA_MEDICO',
         ['DT_MAPA','CD_MEDICO'],
         [TB_MAPA_MEDICODT_MAPA.AsDateTime,
         TB_MAPA_MEDICOCD_MEDICO.AsInteger]);

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
 if (TB_MAPA_MEDICO_LINHA.RecordCount>0) or
    (TB_MAPA_MEDICO_LINHA.state in dsEditModes)then
 begin
   ShowMessage('A data n�o pode ser alterada!');
   Abort;
 end;

end;

procedure TfrmCadMapaMedico.LocalizarMapa;
begin
    if not btgravar.Enabled then
    begin
      TB_MAPA_MEDICO.Close;
      TB_MAPA_MEDICO.ParamByName('CD_MEDICO').AsInteger := qyGridCD_MEDICO.AsInteger;
      TB_MAPA_MEDICO.ParamByName('DT_MAPA').AsDate := qyGridDT_MAPA.AsDateTime;
      TB_MAPA_MEDICO.Open;
    end;
end;

procedure TfrmCadMapaMedico.TB_MAPA_MEDICOCD_MEDICOValidate(
  Sender: TField);
begin
  inherited;
  ValidarMapa;
end;

procedure TfrmCadMapaMedico.TB_MAPA_MEDICODT_MAPAValidate(Sender: TField);
begin
  inherited;
  ValidarMapa;
end;

procedure TfrmCadMapaMedico.gcBTEsq3ButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
begin
  inherited;
  if dsMapaLinha.AutoEdit  then
  begin
    if not(TB_MAPA_MEDICO_LINHA.State in dsEditModes) then
      TB_MAPA_MEDICO_LINHA.Edit;

    Case AbsoluteIndex of
      0:begin
        try
          if SelecionarEsquema then
          begin
            if (not TB_MAPA_MEDICO_LINHAVL_ULTIMA_ESQUEMA.IsNull) and
               (frmLocalizar.qyDados.FieldByname('FL_COMPONENTE').AsString<>cvSim) then
            begin
               ShowMessage('Somente pode ser agrupado componente ao esquema!');
               Exit;
            end;

            if TB_MAPA_MEDICO_LINHAVL_ULTIMA_ESQUEMA.IsNull then
              TB_MAPA_MEDICO_LINHAVL_ULTIMA_ESQUEMA.AsString :=
                frmLocalizar.qyDados.FieldByname('DS_SIGLA').AsString
            else
            if (not TB_MAPA_MEDICO_LINHAVL_ULTIMA_ESQUEMA.IsNull) and
               (frmLocalizar.qyDados.FieldByname('FL_COMPONENTE').AsString=cvSim) then
            begin
              TB_MAPA_MEDICO_LINHAVL_ULTIMA_ESQUEMA.AsString :=
                 TB_MAPA_MEDICO_LINHAVL_ULTIMA_ESQUEMA.AsString + '+' +
                 frmLocalizar.qyDados.FieldByname('DS_SIGLA').AsString;
            end;
          end;
        finally
          frmLocalizar.qyDados.Close;
          FreeAndNil(frmLocalizar);
        end;
      end;
      1: TB_MAPA_MEDICO_LINHAVL_ULTIMA_ESQUEMA.Clear;
    end;
  end;
end;

procedure TfrmCadMapaMedico.Editar1Click(Sender: TObject);
begin
  inherited;
  if qyGrid.Locate('CD_MAPA', qyExport.FieldByName('CD_MAPA').AsInteger,[]) then
  begin
     LocalizarMapa;
     bteditar.Click;

     TB_MAPA_MEDICO_LINHA.Locate('CD_MAPA_LINHA',
      qyExport.FieldByName('CD_MAPA_LINHA').AsInteger,[])
  end;
end;

procedure TfrmCadMapaMedico.TB_MAPA_MEDICO_LINHAVL_GESTANTEValidate(
  Sender: TField);
begin
  if TB_MAPA_MEDICO_LINHAVL_GESTANTE.AsString = 'S' then
  begin
    frmControleGestantes := TfrmControleGestantes.Create(Application);
    frmControleGestantes.frameControleGestante1.dtBaseCalculo := TB_MAPA_MEDICODT_MAPA.AsDateTime;
    frmControleGestantes.btPesquisar.Enabled := False;
    frmControleGestantes.qyProcuraPaciente.Close;
    frmControleGestantes.qyProcuraPaciente.ParamByName('CD_PACIENTE').AsInteger := TB_MAPA_MEDICO_LINHACD_PACIENTE.AsInteger;
    frmControleGestantes.qyProcuraPaciente.Open;
    frmControleGestantes.ShowModal;
    frmControleGestantes.Free;

    BuscaDT_PREV_GESTACAO;
    if TB_MAPA_MEDICO_LINHADT_PREV_GESTACAO.IsNull then
    begin
      TB_MAPA_MEDICO_LINHAVL_GESTANTE.AsString := 'N';
      Abort;
    end;
  end
  else
    TB_MAPA_MEDICO_LINHADT_PREV_GESTACAO.Clear;
end;

procedure TfrmCadMapaMedico.BuscaDT_PREV_GESTACAO;
var
  qy: TIBQuery;
begin
  qy := TIBQuery.Create(nil);
  with qy do
  begin
    try
      Database := dm.DB;
      Transaction := dm.TS;
      SQl.Add('SELECT MAX(DT_INICIO_GESTACAO) DT_INICIO_GESTACAO FROM GESTANTE');
      SQl.Add('WHERE GESTANTE.CD_PACIENTE = :CD_PACIENTE AND FL_GESTANTE = 1' );
      qy := ExecutaSQL(qy, ['CD_PACIENTE'], [TB_MAPA_MEDICO_LINHACD_PACIENTE.AsInteger]);

      if not FieldByName('DT_INICIO_GESTACAO').IsNull then
        TB_MAPA_MEDICO_LINHADT_PREV_GESTACAO.AsDateTime := IncMonth(FieldByName('DT_INICIO_GESTACAO').AsDateTime, 9)
      else
        TB_MAPA_MEDICO_LINHADT_PREV_GESTACAO.Clear;
    finally
      Close;
      Free;
    end;
  end;
end;

procedure TfrmCadMapaMedico.qyExportCalcFields(DataSet: TDataSet);
begin
  if not qyExportDT_PREV_GESTACAO.IsNull then
  begin
    if IncMonth(qyExportDT_PREV_GESTACAO.AsDateTime, -9) >= qyExportDT_MAPA.AsDateTime then
      qyExportNR_MESES.Clear
    else
      //qyExportNR_MESES.AsInteger := StrToInt(FormatDateTime('mm', Date - IncMonth(qyExportDT_PREV_GESTACAO.AsDateTime, -9)));
      qyExportNR_MESES.AsInteger := (MonthsBetween(qyExportDT_MAPA.AsDateTime, IncMonth(qyExportDT_PREV_GESTACAO.AsDateTime, -9)));
    if qyExportNR_MESES.AsInteger > 9 then
      qyExportNR_MESES.AsInteger := 9;
  end
  else
    qyExportNR_MESES.Clear;
end;

procedure TfrmCadMapaMedico.btLocMedicoChange(Sender: TObject);
begin
  TB_MAPA_MEDICONM_MEDICO.AsVariant :=
    PegaValor('NM_MEDICO', 'MEDICO', ['CD_MEDICO'], [btLocMedico.Text]);
end;

procedure TfrmCadMapaMedico.TB_MAPA_MEDICOBeforePost(DataSet: TDataSet);
begin
  inherited;
  if TB_MAPA_MEDICODT_MAPA.IsNull then
  begin
    ShowMessage('O campo data do mapa deve ser preenchido');
    Abort;
  end;

  if TB_MAPA_MEDICOCD_MEDICO.IsNull then
  begin
    ShowMessage('O campo agenda deve ser preenchido');
    Abort;
  end;
end;

procedure TfrmCadMapaMedico.Imprimir1Click(Sender: TObject);
begin
  inherited;
  grExport.SaveToHTML(sPathTemp+'\export.html', true);
  ShellExecute(0, 'open', Pchar(sPathTemp+'\export.html'), nil, nil, SW_SHOW);
end;

procedure TfrmCadMapaMedico.btCamposClick(Sender: TObject);
var i : integer;
begin
  inherited;
  pnCampos.Visible := not pnCampos.Visible;

  if pnCampos.Visible then
  begin
    ckCampos.Items.Clear;
    for i:=0 to grExport.ColumnCount-1 do
      if not((grExport.Columns[i].FieldName = 'TODOS')) then
        ckCampos.Items.Add(grExport.Columns[i].FieldName);
  end;

  for i:=0 to ckCampos.Items.Count -1 do
  begin
    ckCampos.Checked[i] := grExport.ColumnByFieldName(ckCampos.Items[i]).Visible;
  end;
end;

procedure TfrmCadMapaMedico.ckCamposClickCheck(Sender: TObject);
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

procedure TfrmCadMapaMedico.ValidarPacienteExiste;
begin
  if PegaValor('1', 'MAPA_MEDICO_LINHA',
    ['CD_MAPA','NR_PROCESSO'],
    [TB_MAPA_MEDICOCD_MAPA.AsString,
     TB_MAPA_MEDICO_LINHANR_PROCESSO.AsString]) = '1' then
  begin
    ShowMessage('Este paciente j� esta no mapa!');
    Abort;
  end;
end;

end.


