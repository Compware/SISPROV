unit uCadMapaFarmacia;

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
  TfrmCadMapaFarmacia = class(TfrmCadPad)
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
    TB_MAPA_FARMACIA: TIBDataSet;
    TB_MAPA_FARMACIA_LINHA: TIBDataSet;
    dsMapaFarmacia: TDataSource;
    TB_MAPA_FARMACIACD_UNIDADE: TIntegerField;
    Label2: TLabel;
    grMapaFarmacia: TdxDBGrid;
    grMapaFarmaciaNR_PROCESSO: TdxDBGridColumn;
    grMapaFarmaciaNM_PACIENTE: TdxDBGridMaskColumn;
    grMapaFarmaciaTP_SEXO: TdxDBGridColumn;
    grMapaFarmaciaNR_IDADE: TdxDBGridColumn;
    grMapaFarmaciaVL_ARV1: TdxDBGridColumn;
    grMapaFarmaciaVL_ESQUEMA: TdxDBGridColumn;
    grMapaFarmaciaBTEsq: TdxDBGridButtonColumn;
    TB_MAPA_FARMACIADT_MAPA: TDateTimeField;
    dtMapa: TDBDateEdit;
    Label3: TLabel;
    gcNM_RESPONSAVEL: TdxDBGridColumn;
    gcDT_MAPA: TdxDBGridColumn;
    TB_MAPA_FARMACIADS_UNIDADE: TIBStringField;
    TB_MAPA_FARMACIADS_MUNICIPIO: TIBStringField;
    TB_MAPA_FARMACIADS_PROVINCIA: TIBStringField;
    grMapaFarmaciaCODIGO: TdxDBGridColumn;
    tabExport: TTabSheet;
    qyExport: TIBQuery;
    dsExport: TDataSource;
    SaveDialog1: TSaveDialog;
    N1: TMenuItem;
    Excel1: TMenuItem;
    qyGridCD_MAPA_FARMACIA: TIntegerField;
    qyGridCD_UNIDADE: TIntegerField;
    qyGridDT_MAPA: TDateTimeField;
    qyGridNM_RESPONSAVEL: TIBStringField;
    TB_MAPA_FARMACIACD_MAPA_FARMACIA: TIntegerField;
    TB_MAPA_FARMACIANM_RESPONSAVEL: TIBStringField;
    DBEdit1: TDBEdit;
    TB_MAPA_FARMACIA_LINHACD_MAPA_FARMACIA_LINHA: TIntegerField;
    TB_MAPA_FARMACIA_LINHACD_MAPA_FARMACIA: TIntegerField;
    TB_MAPA_FARMACIA_LINHACD_PACIENTE: TIntegerField;
    TB_MAPA_FARMACIA_LINHANR_PROCESSO: TIBStringField;
    TB_MAPA_FARMACIA_LINHANM_PACIENTE: TIBStringField;
    TB_MAPA_FARMACIA_LINHAFL_SEXO: TIBStringField;
    TB_MAPA_FARMACIA_LINHANR_IDADE: TIntegerField;
    TB_MAPA_FARMACIA_LINHAVL_ESQUEMA: TIBStringField;
    TB_MAPA_FARMACIA_LINHAVL_ARV1: TIBStringField;
    TB_MAPA_FARMACIA_LINHAQT_DISPENSADA_ARV1: TIBBCDField;
    TB_MAPA_FARMACIA_LINHADS_FORMA_ARV1: TIBStringField;
    TB_MAPA_FARMACIA_LINHADS_DOSAGEM_ARV1: TIBStringField;
    TB_MAPA_FARMACIA_LINHANR_LOTE_ARV1: TIBStringField;
    TB_MAPA_FARMACIA_LINHAVL_VALIDADE_ARV1: TIBStringField;
    TB_MAPA_FARMACIA_LINHAQT_DIAS_ATENDIDOS_ARV1: TIntegerField;
    TB_MAPA_FARMACIA_LINHAVL_ARV2: TIBStringField;
    TB_MAPA_FARMACIA_LINHAQT_DISPENSADA_ARV2: TIBBCDField;
    TB_MAPA_FARMACIA_LINHADS_FORMA_ARV2: TIBStringField;
    TB_MAPA_FARMACIA_LINHADS_DOSAGEM_ARV2: TIBStringField;
    TB_MAPA_FARMACIA_LINHANR_LOTE_ARV2: TIBStringField;
    TB_MAPA_FARMACIA_LINHAVL_VALIDADE_ARV2: TIBStringField;
    TB_MAPA_FARMACIA_LINHAQT_DIAS_ATENDIDOS_ARV2: TIntegerField;
    TB_MAPA_FARMACIA_LINHAVL_ARV3: TIBStringField;
    TB_MAPA_FARMACIA_LINHAQT_DISPENSADA_ARV3: TIBBCDField;
    TB_MAPA_FARMACIA_LINHADS_FORMA_ARV3: TIBStringField;
    TB_MAPA_FARMACIA_LINHADS_DOSAGEM_ARV3: TIBStringField;
    TB_MAPA_FARMACIA_LINHANR_LOTE_ARV3: TIBStringField;
    TB_MAPA_FARMACIA_LINHAVL_VALIDADE_ARV3: TIBStringField;
    TB_MAPA_FARMACIA_LINHAQT_DIAS_ATENDIDOS_ARV3: TIntegerField;
    TB_MAPA_FARMACIA_LINHAVL_ARV4: TIBStringField;
    TB_MAPA_FARMACIA_LINHAQT_DISPENSADA_ARV4: TIBBCDField;
    TB_MAPA_FARMACIA_LINHADS_FORMA_ARV4: TIBStringField;
    TB_MAPA_FARMACIA_LINHADS_DOSAGEM_ARV4: TIBStringField;
    TB_MAPA_FARMACIA_LINHANR_LOTE_ARV4: TIBStringField;
    TB_MAPA_FARMACIA_LINHAVL_VALIDADE_ARV4: TIBStringField;
    TB_MAPA_FARMACIA_LINHAQT_DIAS_ATENDIDOS_ARV4: TIntegerField;
    TB_MAPA_FARMACIA_LINHAVL_ARV5: TIBStringField;
    TB_MAPA_FARMACIA_LINHAQT_DISPENSADA_ARV5: TIBBCDField;
    TB_MAPA_FARMACIA_LINHADS_FORMA_ARV5: TIBStringField;
    TB_MAPA_FARMACIA_LINHADS_DOSAGEM_ARV5: TIBStringField;
    TB_MAPA_FARMACIA_LINHANR_LOTE_ARV5: TIBStringField;
    TB_MAPA_FARMACIA_LINHAVL_VALIDADE_ARV5: TIBStringField;
    TB_MAPA_FARMACIA_LINHAQT_DIAS_ATENDIDOS_ARV5: TIntegerField;
    TB_MAPA_FARMACIA_LINHAVL_OUTROS_FARMACOS: TIBStringField;
    TB_MAPA_FARMACIA_LINHAQT_DISPENSADA_OUTROS: TIBBCDField;
    TB_MAPA_FARMACIA_LINHADS_FORMA_OUTROS: TIBStringField;
    TB_MAPA_FARMACIA_LINHADS_DOSAGEM_OUTROS: TIBStringField;
    TB_MAPA_FARMACIA_LINHANR_LOTE_OUTROS: TIBStringField;
    TB_MAPA_FARMACIA_LINHAVL_VALIDADE_OUTROS: TIBStringField;
    TB_MAPA_FARMACIA_LINHAQT_DIAS_ATENDIDOS_OUTROS: TIntegerField;
    TB_MAPA_FARMACIA_LINHADT_PROX_RETIRADA: TDateTimeField;
    TB_MAPA_FARMACIA_LINHACODIGO: TIntegerField;
    grMapaFarmaciaDS_FORMA_ARV1: TdxDBGridMaskColumn;
    grMapaFarmaciaDS_DOSAGEM_ARV1: TdxDBGridMaskColumn;
    grMapaFarmaciaNR_LOTE_ARV1: TdxDBGridMaskColumn;
    grMapaFarmaciaVL_VALIDADE_ARV1: TdxDBGridMaskColumn;
    grMapaFarmaciaQT_DIAS_ATENDIDOS_ARV1: TdxDBGridMaskColumn;
    grMapaFarmaciaVL_ARV2: TdxDBGridMaskColumn;
    grMapaFarmaciaDS_FORMA_ARV2: TdxDBGridMaskColumn;
    grMapaFarmaciaDS_DOSAGEM_ARV2: TdxDBGridMaskColumn;
    grMapaFarmaciaNR_LOTE_ARV2: TdxDBGridMaskColumn;
    grMapaFarmaciaVL_VALIDADE_ARV2: TdxDBGridMaskColumn;
    grMapaFarmaciaQT_DIAS_ATENDIDOS_ARV2: TdxDBGridMaskColumn;
    grMapaFarmaciaVL_ARV3: TdxDBGridMaskColumn;
    grMapaFarmaciaDS_FORMA_ARV3: TdxDBGridMaskColumn;
    grMapaFarmaciaDS_DOSAGEM_ARV3: TdxDBGridMaskColumn;
    grMapaFarmaciaNR_LOTE_ARV3: TdxDBGridMaskColumn;
    grMapaFarmaciaVL_VALIDADE_ARV3: TdxDBGridMaskColumn;
    grMapaFarmaciaQT_DIAS_ATENDIDOS_ARV3: TdxDBGridMaskColumn;
    grMapaFarmaciaVL_ARV4: TdxDBGridMaskColumn;
    grMapaFarmaciaDS_FORMA_ARV4: TdxDBGridMaskColumn;
    grMapaFarmaciaDS_DOSAGEM_ARV4: TdxDBGridMaskColumn;
    grMapaFarmaciaNR_LOTE_ARV4: TdxDBGridMaskColumn;
    grMapaFarmaciaVL_VALIDADE_ARV4: TdxDBGridMaskColumn;
    grMapaFarmaciaQT_DIAS_ATENDIDOS_ARV4: TdxDBGridMaskColumn;
    grMapaFarmaciaVL_ARV5: TdxDBGridMaskColumn;
    grMapaFarmaciaDS_FORMA_ARV5: TdxDBGridMaskColumn;
    grMapaFarmaciaDS_DOSAGEM_ARV5: TdxDBGridMaskColumn;
    grMapaFarmaciaNR_LOTE_ARV5: TdxDBGridMaskColumn;
    grMapaFarmaciaVL_VALIDADE_ARV5: TdxDBGridMaskColumn;
    grMapaFarmaciaQT_DIAS_ATENDIDOS_ARV5: TdxDBGridMaskColumn;
    grMapaFarmaciaVL_OUTROS_FARMACOS: TdxDBGridMaskColumn;
    grMapaFarmaciaDS_FORMA_OUTROS: TdxDBGridMaskColumn;
    grMapaFarmaciaDS_DOSAGEM_OUTROS: TdxDBGridMaskColumn;
    grMapaFarmaciaNR_LOTE_OUTROS: TdxDBGridMaskColumn;
    grMapaFarmaciaVL_VALIDADE_OUTROS: TdxDBGridMaskColumn;
    grMapaFarmaciaQT_DIAS_ATENDIDOS_OUTROS: TdxDBGridMaskColumn;
    grMapaFarmaciaDT_PROX_RETIRADA: TdxDBGridDateColumn;
    grExport: TdxDBGrid;
    dxDBGridColumn1: TdxDBGridColumn;
    dxDBGridColumn2: TdxDBGridColumn;
    dxDBGridMaskColumn1: TdxDBGridMaskColumn;
    dxDBGridColumn3: TdxDBGridColumn;
    dxDBGridColumn4: TdxDBGridColumn;
    dxDBGridColumn5: TdxDBGridColumn;
    dxDBGridMaskColumn2: TdxDBGridMaskColumn;
    dxDBGridMaskColumn6: TdxDBGridMaskColumn;
    dxDBGridDateColumn1: TdxDBGridDateColumn;
    TB_MAPA_FARMACIACD_PROVINCIA: TIntegerField;
    TB_MAPA_FARMACIACD_MUNICIPIO: TIntegerField;
    grExportColumn51: TdxDBGridColumn;
    grExportColumn52: TdxDBGridColumn;
    grExportColumn53: TdxDBGridColumn;
    grMapaFarmaciaQT_DISPENSADA_ARV2: TdxDBGridMaskColumn;
    grMapaFarmaciaQT_DISPENSADA_ARV1: TdxDBGridMaskColumn;
    grMapaFarmaciaQT_DISPENSADA_ARV3: TdxDBGridMaskColumn;
    grMapaFarmaciaQT_DISPENSADA_ARV4: TdxDBGridMaskColumn;
    grMapaFarmaciaQT_DISPENSADA_ARV5: TdxDBGridMaskColumn;
    grMapaFarmaciaQT_DISPENSADA_OUTROS: TdxDBGridMaskColumn;
    qyGridCD_PROVINCIA: TIntegerField;
    qyGridDS_PROVINCIA: TIBStringField;
    qyGridCD_MUNICIPIO: TIntegerField;
    qyGridDS_MUNICIPIO: TIBStringField;
    qyGridDS_UNIDADE: TIBStringField;
    Label6: TLabel;
    btLocMedico: TdxDBButtonEdit;
    edMedico: TdxDBEdit;
    btAgenda: TBitBtn;
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
    TB_MAPA_FARMACIANM_MEDICO: TIBStringField;
    TB_MAPA_FARMACIACD_MEDICO: TIntegerField;
    TB_MAPA_FARMACIA_LINHACD_AGENDA: TIntegerField;
    N2: TMenuItem;
    Editar1: TMenuItem;
    TB_MAPA_FARMACIA_LINHAFL_CRIANCA_EXPOSTA: TIBStringField;
    TB_MAPA_FARMACIA_LINHAFL_GESTANTE: TIntegerField;
    TB_MAPA_FARMACIA_LINHACD_FORMA_ARV1: TIntegerField;
    grMapaFarmaciaFL_CRIANCA_EXPOSTA: TdxDBGridCheckColumn;
    grMapaFarmaciaFL_GESTANTE: TdxDBGridCheckColumn;
    grMapaFarmaciaCD_FORMA_ARV1: TdxDBGridButtonColumn;
    grExportColumn13: TdxDBGridColumn;
    grExportColumn14: TdxDBGridColumn;
    qyExportTODOS: TIBStringField;
    qyExportCD_MAPA_FARMACIA_LINHA: TIntegerField;
    qyExportCD_MAPA_FARMACIA: TIntegerField;
    qyExportCD_PACIENTE: TIntegerField;
    qyExportNR_PROCESSO: TIBStringField;
    qyExportNM_PACIENTE: TIBStringField;
    qyExportFL_SEXO: TIBStringField;
    qyExportNR_IDADE: TIntegerField;
    qyExportVL_ESQUEMA: TIBStringField;
    qyExportVL_ARV1: TIBStringField;
    qyExportQT_DISPENSADA_ARV1: TIBBCDField;
    qyExportDS_FORMA_ARV1: TIBStringField;
    qyExportQT_DIAS_ATENDIDOS_ARV1: TIntegerField;
    qyExportDT_PROX_RETIRADA: TDateTimeField;
    qyExportFL_GESTANTE: TIntegerField;
    qyExportFL_CRIANCA_EXPOSTA: TIBStringField;
    qyExportCD_MAPA_FARMACIA1: TIntegerField;
    qyExportCD_UNIDADE: TIntegerField;
    qyExportDT_MAPA: TDateTimeField;
    qyExportNM_RESPONSAVEL: TIBStringField;
    qyExportCD_PROVINCIA: TIntegerField;
    qyExportDS_PROVINCIA: TIBStringField;
    qyExportCD_MUNICIPIO: TIntegerField;
    qyExportDS_MUNICIPIO: TIBStringField;
    qyExportDS_UNIDADE: TIBStringField;
    grExportColumn15: TdxDBGridColumn;
    grExportColumn16: TdxDBGridColumn;
    qyExportCD_FORMA_ARV1: TIntegerField;
    qyAgendaNR_PROCESSO_CRIANCA_EXP: TIBStringField;
    qyAgendaFL_CRIANCA_EXPOSTA: TIBStringField;
    qyExportFL_GESTANTE_CALC: TStringField;
    qyTARV_MEDICO: TIBQuery;
    qyTARV_MEDICOVL_TARV_PADRAO: TIBStringField;
    qyTARV_MEDICODT_MAPA: TDateTimeField;
    qyTARV_CRIANCA_EXP: TIBQuery;
    qyTARV_CRIANCA_EXPVL_TARV_PADRAO: TIBStringField;
    qyTARV_CRIANCA_EXPDT_MAPA: TDateTimeField;
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
    procedure TB_MAPA_FARMACIA_LINHAAfterInsert(DataSet: TDataSet);
    procedure TB_MAPA_FARMACIABeforeClose(DataSet: TDataSet);
    procedure TB_MAPA_FARMACIAAfterOpen(DataSet: TDataSet);
    procedure TB_MAPA_FARMACIA_LINHABeforeInsert(DataSet: TDataSet);
    procedure grDadosDblClick(Sender: TObject);
    procedure TB_MAPA_FARMACIA_LINHANR_PROCESSOValidate(Sender: TField);
    procedure grMapaFarmaciaBTEsqButtonClick(Sender: TObject; AbsoluteIndex: Integer);
    procedure btPesquisarClick(Sender: TObject);
    procedure TB_MAPA_FARMACIA_LINHACalcFields(DataSet: TDataSet);
    procedure Excel1Click(Sender: TObject);
    procedure qyExportAfterScroll(DataSet: TDataSet);
    procedure AtualizarLista1Click(Sender: TObject);
    procedure qyExportBeforeOpen(DataSet: TDataSet);
    procedure pgGeralChange(Sender: TObject);
    procedure btAgendaClick(Sender: TObject);
    procedure btLocMedicoButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure TB_MAPA_FARMACIAAfterInsert(DataSet: TDataSet);
    procedure TB_MAPA_FARMACIABeforeDelete(DataSet: TDataSet);
    procedure TB_MAPA_FARMACIACD_MEDICOValidate(Sender: TField);
    procedure TB_MAPA_FARMACIADT_MAPAValidate(Sender: TField);
    procedure Editar1Click(Sender: TObject);
    procedure grMapaFarmaciaCD_FORMA_ARV1ButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure TB_MAPA_FARMACIA_LINHABeforePost(DataSet: TDataSet);
    procedure qyExportAfterOpen(DataSet: TDataSet);
    procedure qyExportFL_GESTANTEGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure qyExportCalcFields(DataSet: TDataSet);
    procedure btLocMedicoChange(Sender: TObject);
    procedure TB_MAPA_FARMACIABeforePost(DataSet: TDataSet);
    procedure btCamposClick(Sender: TObject);
    procedure ckCamposClickCheck(Sender: TObject);
    procedure Imprimir1Click(Sender: TObject);
  private
    importandoAgenda : Boolean;
    function SelecionarEsquema: Boolean;
    procedure LocalizarMapa;
    procedure ValidarMapa;
    procedure LancaAgenda(pDtAgenda:TDate; pnConfirmado:integer);
    procedure ValidarPacienteExiste;
    { Private declarations }
  public
    { Public declarations }
    sNomeTabela:string;
    procedure AbreConsultas;
    procedure FechaConsultas;
  end;

var
  frmCadMapaFarmacia: TfrmCadMapaFarmacia;
  bEdit, bConsolidado:Boolean;
  Unidade :Integer;
  MesAno:String;
  sSQLUnidade, sSQLAgenda, sSQLExport:string;
  bExportando:boolean;

implementation

uses UDMGERAL, UDM, DateUtils, Ugeral, uRelatorioWEB, uFuncaoGrid,
  uFuncaoContraSenha, UfrmRelMapa, UfrmLocPad, Math, uConsAbandono;

{$R *.dfm}

procedure TfrmCadMapaFarmacia.FormShow(Sender: TObject);
begin
  inherited;
  grExport.LoadFromIniFile(grExport.IniFileName);
  qyGrid.Open;
  pgGeral.ActivePageIndex := 0;
end;

procedure TfrmCadMapaFarmacia.btgravarClick(Sender: TObject);
begin
  if TB_MAPA_FARMACIA_LINHA.state in dsEditModes then
     TB_MAPA_FARMACIA_LINHA.Post;
  inherited;
  dsMapaLinha.AutoEdit := false;
end;

procedure TfrmCadMapaFarmacia.AbreConsultas;
begin
  sSQLExport := qyExport.SQL.Text;
  sSQLAgenda := dmGeral.TB_AGENDA.SelectSQL.Text;
  dmGeral.TB_AGENDA.SelectSQL.Text := StringReplace(sSQLAgenda,'/*MEDICO*/',
     'AND  "AGENDA".CD_MEDICO = :CD_MEDICO ' + chr(13) +
     'AND  "AGENDA".CD_PACIENTE = :CD_PACIENTE'
     ,[]);
  dmGeral.TB_AGENDAFL_CONFIRMADO.OnValidate := nil;
end;

procedure TfrmCadMapaFarmacia.FechaConsultas;
begin
  dmGeral.TB_AGENDA.Close;
  dmGeral.TB_AGENDA.SelectSQL.Text := sSQLAgenda;
  dmGeral.TB_AGENDAFL_CONFIRMADO.OnValidate := dmGeral.TB_AGENDAFL_CONFIRMADOValidate;
end;

procedure TfrmCadMapaFarmacia.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  FechaConsultas;
end;

procedure TfrmCadMapaFarmacia.FormCreate(Sender: TObject);
begin
  inherited;
  FbPermiteMudarPagina := False;
  importandoAgenda := False;
  grExport.IniFileName := sPathGrid + '\' + self.Name + '.ini';
  AbreConsultas;
end;

procedure TfrmCadMapaFarmacia.btexcluirClick(Sender: TObject);
begin
{TODO:Criar historico ao Excluir}
  if (not VerificaPermissao(57)) then
  begin
    ShowMessage('Usuário sem permissão para realizar esta operação!');
    Exit;
  end;
  pgGeral.ActivePageIndex := 1;
  pgGeralChange(sender);
  inherited;
end;

procedure TfrmCadMapaFarmacia.btIncluirClick(Sender: TObject);
begin
  if (not VerificaPermissao(56)) then
  begin
    ShowMessage('Usuário sem permissão para realizar esta operação!');
    Exit;
  end;
  pgGeral.ActivePageIndex := 1;
  dsMapaLinha.AutoEdit := true;
  inherited;
end;

procedure TfrmCadMapaFarmacia.btimprimirClick(Sender: TObject);
var sRel:string;
begin
  sRel := '\RelMapaFarmacia.fr3';
  fxMapa.LoadFromFile(sPathLayOut + sRel);
  fxMapa.ShowReport;
end;

procedure TfrmCadMapaFarmacia.btLimparClick(Sender: TObject);
begin
  inherited;
  Limpar;
end;

procedure TfrmCadMapaFarmacia.bteditarClick(Sender: TObject);
begin
  if (not VerificaPermissao(56)) then
  begin
    ShowMessage('Usuário sem permissão para realizar esta operação!');
    Exit;
  end;
  pgGeral.ActivePageIndex := 1;
  pgGeralChange(sender);
  inherited;
  dsMapaLinha.AutoEdit := true;
end;


procedure TfrmCadMapaFarmacia.btCancelarClick(Sender: TObject);
begin
  inherited;
  dsMapaLinha.AutoEdit := false;
end;

procedure TfrmCadMapaFarmacia.btInsClick(Sender: TObject);
begin
  inherited;
  if btGravar.Enabled then
    dsMapaLinha.DataSet.Append;
end;

procedure TfrmCadMapaFarmacia.btDelClick(Sender: TObject);
begin
  inherited;
  try
    if btGravar.Enabled then
      dsMapaLinha.DataSet.Delete;
  except
    on E : EDatabaseError do
    begin
      //
    end;
  end;
  {if btgravar.Enabled then
    if dsMapaLinha.DataSet.State = dsInsert then
      dsMapaLinha.DataSet.Cancel
    else
      dsMapaLinha.DataSet.Delete; }
end;

procedure TfrmCadMapaFarmacia.dsControleStateChange(Sender: TObject);
begin
  inherited;
  //btexcluir.Enabled := false;
end;

procedure TfrmCadMapaFarmacia.TB_MAPA_FARMACIA_LINHAAfterInsert(
  DataSet: TDataSet);
begin
  inherited;
  TB_MAPA_FARMACIA_LINHACD_MAPA_FARMACIA.AsInteger :=
    TB_MAPA_FARMACIACD_MAPA_FARMACIA.AsInteger;
end;

procedure TfrmCadMapaFarmacia.TB_MAPA_FARMACIABeforeClose(
  DataSet: TDataSet);
begin
  inherited;
  TB_MAPA_FARMACIA_LINHA.Close;
end;

procedure TfrmCadMapaFarmacia.TB_MAPA_FARMACIAAfterOpen(DataSet: TDataSet);
begin
  inherited;
  TB_MAPA_FARMACIA_LINHA.Open;
end;

procedure TfrmCadMapaFarmacia.TB_MAPA_FARMACIA_LINHABeforeInsert(
  DataSet: TDataSet);
begin
  inherited;
  if TB_MAPA_FARMACIA.state in dsEditModes then
     TB_MAPA_FARMACIA.Post;
end;

procedure TfrmCadMapaFarmacia.grDadosDblClick(Sender: TObject);
begin
  inherited;
  LocalizarMapa;
end;

procedure TfrmCadMapaFarmacia.TB_MAPA_FARMACIA_LINHANR_PROCESSOValidate(
  Sender: TField);
begin
  inherited;
  if trim(TB_MAPA_FARMACIA_LINHANR_PROCESSO.AsString) <> '' then
  begin

     ValidarPacienteExiste;

    with TIBQuery.Create(nil) do
    begin
      try
        Database := dm.DB;
        Transaction := dm.TS;
        SQl.Add('SELECT * FROM PACIENTE');
        if Pos('-',TB_MAPA_FARMACIA_LINHANR_PROCESSO.AsString) > 0 then // se for crianca exposta
          SQl.Add('WHERE NR_PROCESSO_CRIANCA_EXP = :NR_PROCESSO')
        else
          SQl.Add('WHERE NR_PROCESSO = :NR_PROCESSO');
        ParamByName('NR_PROCESSO').AsString := TB_MAPA_FARMACIA_LINHANR_PROCESSO.AsString;
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

        TB_MAPA_FARMACIA_LINHACD_PACIENTE.AsString := FieldByName('CD_PACIENTE').AsString;
        TB_MAPA_FARMACIA_LINHANM_PACIENTE.AsString := FieldByName('NM_PACIENTE').AsString;
        TB_MAPA_FARMACIA_LINHANR_IDADE.AsInteger :=
            YearsBetween(TB_MAPA_FARMACIADT_MAPA.AsDateTime, FieldByName('DT_NASCIMENTO').AsDateTime);
        TB_MAPA_FARMACIA_LINHAFL_SEXO.AsString := FieldByName('TP_SEXO').AsString;
        TB_MAPA_FARMACIA_LINHAFL_GESTANTE.AsString := FieldByName('FL_GESTANTE').AsString;
        TB_MAPA_FARMACIA_LINHAFL_CRIANCA_EXPOSTA.AsString := FieldByName('FL_CRIANCA_EXPOSTA').AsString;

        AtualizaPacienteIdade(FieldByName('CD_PACIENTE').AsInteger);

        if Pos('-',TB_MAPA_FARMACIA_LINHANR_PROCESSO.AsString) > 0 then
        begin
          qyTARV_CRIANCA_EXP.Close;
          qyTARV_CRIANCA_EXP.ParamByName('NR_PROCESSO').AsString := TB_MAPA_FARMACIA_LINHANR_PROCESSO.AsString;
          qyTARV_CRIANCA_EXP.Open;

          TB_MAPA_FARMACIA_LINHAVL_ESQUEMA.AsString := qyTARV_CRIANCA_EXPVL_TARV_PADRAO.AsString;
          qyTARV_CRIANCA_EXP.Close;
        end
        else
        begin
          qyTARV_MEDICO.Close;
          qyTARV_MEDICO.ParamByName('NR_PROCESSO').AsString := TB_MAPA_FARMACIA_LINHANR_PROCESSO.AsString;
          qyTARV_MEDICO.Open;

          TB_MAPA_FARMACIA_LINHAVL_ESQUEMA.AsString := qyTARV_MEDICOVL_TARV_PADRAO.AsString;
          qyTARV_MEDICO.Close;
        end;
      finally
        Close;
        Free;
      end;
    end;
  end;
end;

procedure TfrmCadMapaFarmacia.grMapaFarmaciaBTEsqButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
begin
  inherited;
  if dsMapaLinha.AutoEdit  then
  begin
    try
      if not(TB_MAPA_FARMACIA_LINHA.State in dsEditModes) then
        TB_MAPA_FARMACIA_LINHA.Edit;

      Case AbsoluteIndex of
        0:begin
            if SelecionarEsquema then
            begin
              if (not TB_MAPA_FARMACIA_LINHAVL_ESQUEMA.IsNull) and
                 (frmLocalizar.qyDados.FieldByname('FL_COMPONENTE').AsString<>cvSim) then
              begin
                 ShowMessage('Somente pode ser agrupado componente ao esquema!');
                 Exit;
              end;

              if TB_MAPA_FARMACIA_LINHAVL_ESQUEMA.IsNull then
                TB_MAPA_FARMACIA_LINHAVL_ESQUEMA.AsString :=
                  frmLocalizar.qyDados.FieldByname('DS_SIGLA').AsString
              else
              if (not TB_MAPA_FARMACIA_LINHAVL_ESQUEMA.IsNull) and
                 (frmLocalizar.qyDados.FieldByname('FL_COMPONENTE').AsString=cvSim) then
              begin
                TB_MAPA_FARMACIA_LINHAVL_ESQUEMA.AsString :=
                   TB_MAPA_FARMACIA_LINHAVL_ESQUEMA.AsString + '+' +
                   frmLocalizar.qyDados.FieldByname('DS_SIGLA').AsString;
              end;
            end;
        end;
        1: TB_MAPA_FARMACIA_LINHAVL_ESQUEMA.Clear;
      end;
    finally
      if Assigned(frmLocalizar) then
      begin
        frmLocalizar.qyDados.Close;
        FreeAndNil(frmLocalizar);
      end;
    end;
  end;
end;

function TfrmCadMapaFarmacia.SelecionarEsquema: Boolean;
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
        VCampo[0].Titulo  := 'Código';
        VCampo[0].Width := 5;
        VCampo[1].Titulo  := 'Sigla';
        VCampo[1].Width := 30;
        VCampo[2].Titulo  := 'Nome Medicamento';
        VCampo[2].Width := 40;
        VCampo[3].Titulo  := 'Apresentação';
        VCampo[3].Width := 40;
        VCampo[4].Titulo  := 'Nome Comercial';
        VCampo[4].Width := 40;
        VCampo[5].Titulo  := 'Tipo';
        VCampo[5].Width := 10;
        VCampo[6].Titulo  := 'ARV';
        VCampo[6].Width := 10;
        VCampo[0].Visivel := True;
        VCampo[1].Visivel := True;
        VCampo[2].Visivel := True;
        VCampo[3].Visivel := True;
        VCampo[4].Visivel := True;
        VCampo[5].Visivel := True;
        VCampo[5].Grupo := True;
        VCampo[6].Visivel := True;

        //frmLocalizar.bAutoExpand := true;
        //frmLocalizar.bAutoAjust := true;
      except
        ShowMessage(frmLocalizar.qyDados.Sql.Text);
      end;
   end;
   result := frmLocalizar.ShowModal=mrok;
end;

procedure TfrmCadMapaFarmacia.btPesquisarClick(Sender: TObject);
begin
  inherited;
  qyGrid.Close;
  qyGrid.Open;
end;

procedure TfrmCadMapaFarmacia.TB_MAPA_FARMACIA_LINHACalcFields(
  DataSet: TDataSet);
begin
  inherited;
  TB_MAPA_FARMACIA_LINHACODIGO.AsInteger := TB_MAPA_FARMACIA_LINHA.RecNo;
end;

procedure TfrmCadMapaFarmacia.Excel1Click(Sender: TObject);
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

procedure TfrmCadMapaFarmacia.qyExportAfterScroll(DataSet: TDataSet);
begin
  if bExportando then
  begin
    sbPadrao.Panels[0].Text := 'Total:'+ intToStr(qyExport.RecordCount) + ' Atual:' +  intToStr(qyExport.RecNo);
    Application.ProcessMessages;
  end;
end;

procedure TfrmCadMapaFarmacia.AtualizarLista1Click(Sender: TObject);
begin
  qyExport.Close;
  qyExport.Open;
end;

procedure TfrmCadMapaFarmacia.qyExportBeforeOpen(DataSet: TDataSet);
begin
  inherited;
  //qyExport.SQL.Text := sSQLExport;
  //qyExport.SQL.Text := StringReplace(sSQLExport,'/*CONDICAO*/',
  //    '', []);
end;

procedure TfrmCadMapaFarmacia.pgGeralChange(Sender: TObject);
begin
  inherited;
  if pgGeral.ActivePageIndex = 0 then
    AtualizaLista;
end;

procedure TfrmCadMapaFarmacia.btAgendaClick(Sender: TObject);
begin
  qyAgenda.Close;
  qyAgenda.ParamByName('CD_MEDICO').AsString :=
    btLocMedico.text;
  qyAgenda.ParamByName('DT_AGENDA').AsDate :=
    Trunc(TB_MAPA_FARMACIADT_MAPA.AsDateTime);
  qyAgenda.ParamByName('CD_MAPA_FARMACIA').AsInteger :=
    TB_MAPA_FARMACIACD_MAPA_FARMACIA.AsInteger;
  qyAgenda.Open;
  importandoAgenda := True;
  try
    if not qyAgenda.IsEmpty then
    begin
       qyAgenda.First;
       while not qyAgenda.Eof do
       begin
         try
           if not TB_MAPA_FARMACIA_LINHA.Locate('CD_PACIENTE',qyAgendaCD_PACIENTE.AsInteger,[]) then
           begin
             TB_MAPA_FARMACIA_LINHA.Insert;
             if qyAgendaFL_CRIANCA_EXPOSTA.AsString = cvSim then // se for crianca exposta
              TB_MAPA_FARMACIA_LINHANR_PROCESSO.AsString := qyAgendaNR_PROCESSO_CRIANCA_EXP.AsString
             else
              TB_MAPA_FARMACIA_LINHANR_PROCESSO.AsString := qyAgendaNR_PROCESSO.AsString;
             TB_MAPA_FARMACIA_LINHACD_AGENDA.AsInteger := qyAgendaCD_AGENDA.AsInteger;
             TB_MAPA_FARMACIA_LINHACD_PACIENTE.AsInteger := qyAgendaCD_PACIENTE.AsInteger;
             TB_MAPA_FARMACIA_LINHA.Post;
           end;
         finally
           qyAgenda.Next;
         end;
       end;
    end;
  finally
    importandoAgenda := False;
  end;
  qyAgenda.Close;
end;

procedure TfrmCadMapaFarmacia.btLocMedicoButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
begin
  if TB_MAPA_FARMACIA.State in [dsEdit, dsInsert] then
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
      TB_MAPA_FARMACIANM_MEDICO.AsString := frmLocalizar.qyDados.FieldByname('nm_medico').AsString;
      TB_MAPA_FARMACIACD_MEDICO.AsInteger := frmLocalizar.qyDados.FieldByname('cd_medico').AsInteger;
    end;
    frmLocalizar.qyDados.Close;
    FreeAndNil(frmLocalizar);
  end;
end;

procedure TfrmCadMapaFarmacia.TB_MAPA_FARMACIAAfterInsert(
  DataSet: TDataSet);
begin
  inherited;
  TB_MAPA_FARMACIACD_MEDICO.AsString := prmAgendaFarmacia;
  TB_MAPA_FARMACIANM_MEDICO.AsVariant :=
    PegaValor('NM_MEDICO', 'MEDICO', ['CD_MEDICO'], [prmAgendaFarmacia]);

  TB_MAPA_FARMACIACD_UNIDADE.AsString := prmUnidade;
end;

procedure TfrmCadMapaFarmacia.TB_MAPA_FARMACIABeforeDelete(
  DataSet: TDataSet);
begin
  inherited;
  while Not TB_MAPA_FARMACIA_LINHA.Eof do
  begin
    try
      TB_MAPA_FARMACIA_LINHA.Delete;
    except
    on E : EDatabaseError do
    begin
      //
    end;
  end;
  end;
end;


procedure TfrmCadMapaFarmacia.ValidarMapa;
var Codigo:Variant;
begin
 Codigo:= PegaValor('CD_MAPA_FARMACIA','MAPA_FARMACIA',
         ['DT_MAPA','CD_MEDICO'],
         [TB_MAPA_FARMACIADT_MAPA.AsDateTime,
          TB_MAPA_FARMACIACD_MEDICO.AsInteger]);

 if not VarIsNull(Codigo) then
 begin
    qyGrid.Close;
    qyGrid.Open;
    if qyGrid.Locate('CD_MAPA_FARMACIA', Codigo,[]) then
    begin
        btCancelar.Click;
        LocalizarMapa;
    end;
 end
 else
 if (TB_MAPA_FARMACIA_LINHA.RecordCount>0) or
    (TB_MAPA_FARMACIA_LINHA.state in dsEditModes)then
 begin
   ShowMessage('A data não pode ser alterada!');
   Abort;
 end;
 
end;

procedure TfrmCadMapaFarmacia.LocalizarMapa;
begin
  if not btgravar.Enabled then
  begin
    TB_MAPA_FARMACIA.Close;
    TB_MAPA_FARMACIA.ParamByName('CD_MAPA_FARMACIA').AsInteger :=
      qyGridCD_MAPA_FARMACIA.AsInteger;
    TB_MAPA_FARMACIA.Open;
  end;
end;

procedure TfrmCadMapaFarmacia.TB_MAPA_FARMACIACD_MEDICOValidate(
  Sender: TField);
begin
  inherited;
  ValidarMapa;
end;

procedure TfrmCadMapaFarmacia.TB_MAPA_FARMACIADT_MAPAValidate(Sender: TField);
begin
  inherited;
  ValidarMapa;
end;

procedure TfrmCadMapaFarmacia.Editar1Click(Sender: TObject);
begin
  inherited;
  if qyGrid.Locate('CD_MAPA_FARMACIA', qyExport.FieldByName('CD_MAPA_FARMACIA').AsInteger,[]) then
  begin
     LocalizarMapa;
     bteditar.Click;

     TB_MAPA_FARMACIA_LINHA.Locate('CD_MAPA_FARMACIA_LINHA',
      qyExport.FieldByName('CD_MAPA_FARMACIA_LINHA').AsInteger,[])
  end;
end;

{ Vinicius 06/07/16
  Correção: Antes era possivel clicar no botao procurar/limpar Forma fora do modo edição.
            A função limpar forma não estava funcionando, ao clicar em limpar Forma o
            sistema abria a tela de procura de Forma }
procedure TfrmCadMapaFarmacia.grMapaFarmaciaCD_FORMA_ARV1ButtonClick(
  Sender: TObject; AbsoluteIndex: Integer);
begin
  if dsMapaLinha.AutoEdit  then
  begin
    try
      if not(TB_MAPA_FARMACIA_LINHA.State in dsEditModes) then
        TB_MAPA_FARMACIA_LINHA.Edit;

      Case AbsoluteIndex of
        0:begin
          if not Assigned(frmLocalizar) then
           frmLocalizar := TfrmLocalizar.Create(application);
          begin
            frmLocalizar.Caption := 'Localizar Forma';
            frmLocalizar.qyDados := SelectDadosForma;
            try
              frmLocalizar.Where := false;
              SetLength(VCampo,2);
              frmLocalizar.KeyField := 'cd_forma';
              VCampo[0].Titulo  := 'Código';
              VCampo[0].Width := 5;
              VCampo[1].Titulo  := 'Forma';
              VCampo[1].Width := 30;
              VCampo[0].Visivel := True;
              VCampo[1].Visivel := True;
            except
              ShowMessage(frmLocalizar.qyDados.Sql.Text);
            end;
          end;

          if frmLocalizar.ShowModal=mrok then
          begin
           TB_MAPA_FARMACIA_LINHACD_FORMA_ARV1.AsInteger :=
            frmLocalizar.qyDados.FieldByName('CD_FORMA').AsInteger;
            TB_MAPA_FARMACIA_LINHADS_FORMA_ARV1.AsString :=
            frmLocalizar.qyDados.FieldByName('DS_FORMA').AsString;
          end;
        end;
        1: begin
          TB_MAPA_FARMACIA_LINHADS_FORMA_ARV1.Clear;
          TB_MAPA_FARMACIA_LINHACD_FORMA_ARV1.Clear;
        end;
      end;
    finally
      if Assigned(frmLocalizar) then
      begin
        frmLocalizar.qyDados.Close;
        FreeAndNil(frmLocalizar);
      end;
    end;
  end;
end;

{ Vinicius 07/06/16
  Modificado para só deixar selecionar Paciente que ainda não está no mapa}
procedure TfrmCadMapaFarmacia.ValidarPacienteExiste;
begin
    if PegaValor('1', 'MAPA_FARMACIA_LINHA',
      ['CD_MAPA_FARMACIA','NR_PROCESSO'],
      [TB_MAPA_FARMACIACD_MAPA_FARMACIA.AsString,
       TB_MAPA_FARMACIA_LINHANR_PROCESSO.AsString]) = '1' then
    begin
      ShowMessage('Este paciente já esta no mapa!');
      Abort;
    end;
end;

procedure TfrmCadMapaFarmacia.LancaAgenda(pDtAgenda:TDate; pnConfirmado:integer);
begin
  inherited;
  if VarIsNull(pDtAgenda) or (pDtAgenda = StrToDate('30/12/1899')) then
  begin
    Exit;
  end;
  dmGeral.TB_AGENDA.Close;
  dmGeral.TB_AGENDA.ParamByName('DT_DE').AsDate := Trunc(pDtAgenda);
  dmGeral.TB_AGENDA.ParamByName('DT_ATE').AsDate := Trunc(pDtAgenda)+1;
  dmGeral.TB_AGENDA.ParamByName('CD_MEDICO').AsString := TB_MAPA_FARMACIACD_MEDICO.AsString;
  dmGeral.TB_AGENDA.ParamByName('CD_PACIENTE').AsString := TB_MAPA_FARMACIA_LINHACD_PACIENTE.AsString;
  dmGeral.TB_AGENDA.Open;
  if dmGeral.TB_AGENDA.IsEmpty then
  begin
      { antes de agendar confere se tinha agenda anterior
        para o mesmo medico/paciente e preenche DT_REMARCACAO}
     qyConfereAgendamento.Close;
     qyConfereAgendamento.ParamByName('PACIENTE').AsInteger := TB_MAPA_FARMACIA_LINHACD_PACIENTE.AsInteger;
     qyConfereAgendamento.ParamByName('DATA').AsDate := Trunc(pDtAgenda);
     qyConfereAgendamento.ParamByName('CD_MEDICO').AsInteger := TB_MAPA_FARMACIACD_MEDICO.AsInteger;
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
     { // }

     dmGeral.TB_AGENDA.Insert;
     dmGeral.TB_AGENDADT_AGENDA.AsDateTime := Trunc(pDtAgenda);
     dmGeral.TB_AGENDACD_MEDICO.AsString := TB_MAPA_FARMACIACD_MEDICO.AsString;
     dmGeral.TB_AGENDACD_PACIENTE.AsString := TB_MAPA_FARMACIA_LINHACD_PACIENTE.AsString;
     if Pos('-', TB_MAPA_FARMACIA_LINHANR_PROCESSO.AsString) > 0 then // se for crianca exposta
      DMGERAL.TB_AGENDANR_PROCESSO_CRIANCA_EXP.AsString := TB_MAPA_FARMACIA_LINHANR_PROCESSO.AsString
     else
      dmGeral.TB_AGENDANR_PROCESSO.AsString := TB_MAPA_FARMACIA_LINHANR_PROCESSO.AsString;
     dmGeral.TB_AGENDAFL_REALIZADO.AsInteger := pnConfirmado;
     dmGeral.TB_AGENDAFL_CONFIRMADO.AsInteger := pnConfirmado;
     if not TB_MAPA_FARMACIA_LINHAVL_ESQUEMA.IsNull then
     begin
       dmGeral.TB_AGENDAFL_ESQUEMA.AsInteger := cvFlSim;
       dmGeral.TB_AGENDADS_ESQUEMA.AsString := TB_MAPA_FARMACIA_LINHAVL_ESQUEMA.AsString;
     end;
     dmGeral.TB_AGENDA.Post;
     TB_MAPA_FARMACIA_LINHACD_AGENDA.AsInteger := dmGeral.TB_AGENDACD_AGENDA.AsInteger;
  end
  else
  begin
    DMGERAL.TB_AGENDA.Edit;
    DMGERAL.TB_AGENDAFL_REALIZADO.AsInteger := pnConfirmado;
    DMGERAL.TB_AGENDAFL_REALIZADO.AsInteger := pnConfirmado;
    DMGERAL.TB_AGENDA.Post;
  end;
end;

procedure TfrmCadMapaFarmacia.TB_MAPA_FARMACIA_LINHABeforePost(
  DataSet: TDataSet);
begin
  inherited;

  if TB_MAPA_FARMACIA_LINHANR_PROCESSO.IsNull then
  begin
    ShowMessage('O campo Nr. Processo deve ser preenchido!');
    Abort;
  end;

  if TB_MAPA_FARMACIA_LINHADT_PROX_RETIRADA.IsNull then
  begin
    if not importandoAgenda then
    begin
      ShowMessage('O campo data da próxima retirada deve ser preenchido!');
      TB_MAPA_FARMACIA_LINHADT_PROX_RETIRADA.FocusControl;
      Abort;
    end;
  end
  else if DayOfTheWeek(TB_MAPA_FARMACIA_LINHADT_PROX_RETIRADA.AsDateTime) in [6,7] then
  begin
    ShowMessage('A data da próxima retirada não pode ser em finais de semana');
    Abort;
  end;

  //Lanca Agenda no Dia - Mapa
  LancaAgenda(TB_MAPA_FARMACIADT_MAPA.asDateTime, cvFlSim);
  //Lanca Agenda Futura - Proxima Retirada
  LancaAgenda(TB_MAPA_FARMACIA_LINHADT_PROX_RETIRADA.asDateTime, cvFlNao);
end;

procedure TfrmCadMapaFarmacia.qyExportAfterOpen(DataSet: TDataSet);
begin
  inherited;
  
  {DataSet.First;

  while not DataSet.Eof do
  begin
    if qyExportFL_GESTANTE.AsString = '1' then
      qyExportFL_GESTANTE.AsString := 'S'
    else
      qyExportFL_GESTANTE.AsString := 'N';

    DataSet.Next;
  end;

  DataSet.First;  }
end;

procedure TfrmCadMapaFarmacia.qyExportFL_GESTANTEGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
  inherited;
  If Sender.AsString = '1' then
    Text := 'S'
  else
    Text := 'N';
end;

procedure TfrmCadMapaFarmacia.qyExportCalcFields(DataSet: TDataSet);
begin
  qyExportFL_GESTANTE_CALC.AsString := qyExportFL_GESTANTE.Text;
end;

procedure TfrmCadMapaFarmacia.btLocMedicoChange(Sender: TObject);
begin
  TB_MAPA_FARMACIANM_MEDICO.AsVariant :=
    PegaValor('NM_MEDICO', 'MEDICO', ['CD_MEDICO'], [btLocMedico.Text]);
end;

procedure TfrmCadMapaFarmacia.TB_MAPA_FARMACIABeforePost(
  DataSet: TDataSet);
begin
  inherited;
  if TB_MAPA_FARMACIADT_MAPA.IsNull then
  begin
    ShowMessage('O campo data do mapa deve ser preenchido');
    Abort;
  end;

  if TB_MAPA_FARMACIACD_MEDICO.IsNull then
  begin
    ShowMessage('O campo agenda deve ser preenchido');
    Abort;
  end;
end;

procedure TfrmCadMapaFarmacia.btCamposClick(Sender: TObject);
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

procedure TfrmCadMapaFarmacia.ckCamposClickCheck(Sender: TObject);
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

procedure TfrmCadMapaFarmacia.Imprimir1Click(Sender: TObject);
begin
  inherited;
  grExport.SaveToHTML(sPathTemp+'\export.html', true);
  ShellExecute(0, 'open', Pchar(sPathTemp+'\export.html'), nil, nil, SW_SHOW);
end;

end.


