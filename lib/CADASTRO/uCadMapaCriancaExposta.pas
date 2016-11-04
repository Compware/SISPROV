unit uCadMapaCriancaExposta;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UfrmCadPad, dxExEdtr, Menus, DB, dxCntner, dxTL, dxDBCtrl,
  dxDBGrid, ComCtrls, StdCtrls, Buttons, ExtCtrls, IBCustomDataSet, IBQuery,
  dxEdLib, dxDBELib, dxEditor, Mask, ToolEdit, RXDBCtrl, frxClass,
  frxExportPDF, frxDBSet, dxDBTLCl, dxGrClms, CheckLst, ShellApi;

type
  TfrmCadMapaCriancaExposta = class(TfrmCadPad)
    qyGrid: TIBQuery;
    TB_MAPA_CRIANCA_EXPOSTA: TIBDataSet;
    Panel5: TPanel;
    Panel6: TPanel;
    grMapaMedico: TdxDBGrid;
    Label2: TLabel;
    dtMapa: TDBDateEdit;
    Label1: TLabel;
    btLocMedico: TdxDBButtonEdit;
    edMedico: TdxDBEdit;
    TB_MAPA_CRIANCA_EXPOSTACD_UNIDADE: TIntegerField;
    TB_MAPA_CRIANCA_EXPOSTADT_MAPA: TDateTimeField;
    TB_MAPA_CRIANCA_EXPOSTACD_MEDICO: TIntegerField;
    TB_MAPA_CRIANCA_EXPOSTADS_UNIDADE: TIBStringField;
    TB_MAPA_CRIANCA_EXPOSTADS_MUNICIPIO: TIBStringField;
    TB_MAPA_CRIANCA_EXPOSTADS_PROVINCIA: TIBStringField;
    TB_MAPA_CRIANCA_EXPOSTANM_MEDICO: TIBStringField;
    TB_MAPA_CRIANCA_EXPOSTA_LINHA: TIBDataSet;
    dsMapaLinha: TDataSource;
    TB_MAPA_CRIANCA_EXPOSTA_LINHACD_MAPA_CRIANCA_EXPOSTA_LINHA: TIntegerField;
    TB_MAPA_CRIANCA_EXPOSTA_LINHACD_PACIENTE_MAE: TIntegerField;
    TB_MAPA_CRIANCA_EXPOSTA_LINHANR_PROCESSO_CRIANCA_EXPOSTA: TIBStringField;
    TB_MAPA_CRIANCA_EXPOSTA_LINHACODIGO: TIntegerField;
    btIns: TSpeedButton;
    btDel: TSpeedButton;
    qyGridCD_UNIDADE: TIntegerField;
    qyGridDT_MAPA: TDateTimeField;
    qyGridDS_UNIDADE: TIBStringField;
    qyGridDS_MUNICIPIO: TIBStringField;
    qyGridDS_PROVINCIA: TIBStringField;
    grDadosCD_MAPA: TdxDBGridColumn;
    grDadosDT_MAPA: TdxDBGridColumn;
    dsMapaCriancaExp: TDataSource;
    TB_MAPA_CRIANCA_EXPOSTACD_MAPA_CRIANCA_EXPOSTA: TIntegerField;
    TB_MAPA_CRIANCA_EXPOSTA_LINHACD_MAPA_CRIANCA_EXPOSTA: TIntegerField;
    qyGridCD_MAPA_CRIANCA_EXPOSTA: TIntegerField;
    btAgenda: TBitBtn;
    qyAgenda: TIBQuery;
    qyAgendaCD_AGENDA: TIntegerField;
    qyAgendaCD_MEDICO: TIntegerField;
    qyAgendaCD_PACIENTE: TIntegerField;
    qyAgendaDT_AGENDA: TDateTimeField;
    qyAgendaNR_PROCESSO_CRIANCA_EXP: TIBStringField;
    fxMapa: TfrxReport;
    fxdbMapa: TfrxDBDataset;
    fxdbCrianca: TfrxDBDataset;
    frxPDFExport1: TfrxPDFExport;
    TabSheet1: TTabSheet;
    SaveDialog1: TSaveDialog;
    qyExport: TIBQuery;
    dsExport: TDataSource;
    N1: TMenuItem;
    Excel1: TMenuItem;
    N2: TMenuItem;
    Editar1: TMenuItem;
    qyExportCODIGO: TIntegerField;
    TB_MAPA_CRIANCA_EXPOSTA_LINHACD_PACIENTE: TIntegerField;
    TB_MAPA_CRIANCA_EXPOSTA_LINHANM_PACIENTE: TIBStringField;
    TB_MAPA_CRIANCA_EXPOSTA_LINHAFL_SEXO: TIBStringField;
    TB_MAPA_CRIANCA_EXPOSTA_LINHACD_AGENDA: TIntegerField;
    TB_MAPA_CRIANCA_EXPOSTA_LINHANR_IDADE_MESES: TIntegerField;
    TB_MAPA_CRIANCA_EXPOSTA_LINHADT_PRIMEIRA_CONSULTA: TDateTimeField;
    TB_MAPA_CRIANCA_EXPOSTA_LINHAVL_ESTADIO_PC: TIBStringField;
    TB_MAPA_CRIANCA_EXPOSTA_LINHADT_PRIMEIRO_TARV: TDateTimeField;
    TB_MAPA_CRIANCA_EXPOSTA_LINHAVL_PRIMEIRO_ESQUEMA: TIBStringField;
    TB_MAPA_CRIANCA_EXPOSTA_LINHADT_ULTIMA_CONSULTA: TDateTimeField;
    TB_MAPA_CRIANCA_EXPOSTA_LINHAVL_ESTADIO_UC: TIBStringField;
    TB_MAPA_CRIANCA_EXPOSTA_LINHAVL_RASTREIO_TB: TIBStringField;
    TB_MAPA_CRIANCA_EXPOSTA_LINHAVL_TB_NOVO: TIBStringField;
    TB_MAPA_CRIANCA_EXPOSTA_LINHAVL_N: TIBStringField;
    TB_MAPA_CRIANCA_EXPOSTA_LINHAVL_I: TIBStringField;
    TB_MAPA_CRIANCA_EXPOSTA_LINHAVL_M: TIBStringField;
    TB_MAPA_CRIANCA_EXPOSTA_LINHAVL_T: TIBStringField;
    TB_MAPA_CRIANCA_EXPOSTA_LINHAVL_TARV_PADRAO: TIBStringField;
    TB_MAPA_CRIANCA_EXPOSTA_LINHAVL_PRESCRICAO_IONIZADA: TIBStringField;
    TB_MAPA_CRIANCA_EXPOSTA_LINHAVL_PRESCRICAO_COTROMIXAZOL: TIBStringField;
    TB_MAPA_CRIANCA_EXPOSTA_LINHADT_ESTADIO_UC: TDateTimeField;
    TB_MAPA_CRIANCA_EXPOSTA_LINHADT_TR_UC: TDateTimeField;
    TB_MAPA_CRIANCA_EXPOSTA_LINHADT_DPI_UC: TDateTimeField;
    TB_MAPA_CRIANCA_EXPOSTA_LINHAVL_ULTIMA_ESQUEMA: TIBStringField;
    TB_MAPA_CRIANCA_EXPOSTA_LINHADT_INICIO_CRIANCA_EXP: TDateField;
    TB_MAPA_CRIANCA_EXPOSTA_LINHANM_MAE: TIBStringField;
    grMapaMedicoNR_PROCESSO_CRIANCA_EXPOSTA: TdxDBGridMaskColumn;
    grMapaMedicoCODIGO: TdxDBGridColumn;
    grMapaMedicoNM_PACIENTE: TdxDBGridMaskColumn;
    grMapaMedicoFL_SEXO: TdxDBGridMaskColumn;
    grMapaMedicoNR_IDADE_MESES: TdxDBGridMaskColumn;
    grMapaMedicoDT_PRIMEIRA_CONSULTA: TdxDBGridDateColumn;
    grMapaMedicoVL_DPI_PC: TdxDBGridMaskColumn;
    grMapaMedicoDT_PRIMEIRO_TARV: TdxDBGridDateColumn;
    grMapaMedicoVL_PRIMEIRO_ESQUEMA: TdxDBGridMaskColumn;
    grMapaMedicoDT_ULTIMA_CONSULTA: TdxDBGridDateColumn;
    grMapaMedicoVL_DPI_UC: TdxDBGridMaskColumn;
    grMapaMedicoVL_TARV_PADRAO: TdxDBGridMaskColumn;
    grMapaMedicoDT_ESTADIO_UC: TdxDBGridDateColumn;
    grMapaMedicoDT_TR_UC: TdxDBGridDateColumn;
    grMapaMedicoDT_DPI_UC: TdxDBGridDateColumn;
    grMapaMedicoVL_ULTIMA_ESQUEMA: TdxDBGridMaskColumn;
    grMapaMedicoDT_INICIO_CRIANCA_EXP: TdxDBGridDateColumn;
    grMapaMedicoNM_MAE: TdxDBGridMaskColumn;
    grMapaMedicoVL_ESTADIO_PC: TdxDBGridPickColumn;
    grBTEsquema: TdxDBGridButtonColumn;
    grBTUltimoEsquema: TdxDBGridButtonColumn;
    grMapaMedicoVL_ESTADIO_UC: TdxDBGridPickColumn;
    grMapaMedicoVL_RASTREIO_TB: TdxDBGridCheckColumn;
    grMapaMedicoVL_N: TdxDBGridCheckColumn;
    grMapaMedicoVL_T: TdxDBGridCheckColumn;
    grMapaMedicoVL_M: TdxDBGridCheckColumn;
    grMapaMedicoVL_I: TdxDBGridCheckColumn;
    grBT_VL_TARV_PADRAO: TdxDBGridButtonColumn;
    grMapaMedicoVL_PRESCRICAO_IONIZADA: TdxDBGridCheckColumn;
    grMapaMedicoVL_PRESCRICAO_COTROMIXAZOL: TdxDBGridCheckColumn;
    qyPrimeiraConsulta: TIBQuery;
    qyPrimeiraConsultaVL_ESTADIO_PC: TIBStringField;
    qyPrimeiraConsultaDT_PRIMEIRA_CONSULTA: TDateTimeField;
    qyPrimeiraConsultaDT_PRIMEIRO_TARV: TDateTimeField;
    qyPrimeiraConsultaVL_PRIMEIRO_ESQUEMA: TIBStringField;
    qyUltimaConsulta: TIBQuery;
    qyUltimaConsultaVL_PRIMEIRO_ESQUEMA: TIBStringField;
    qyUltimaConsultaVL_TARV_PADRAO: TIBStringField;
    TB_MAPA_CRIANCA_EXPOSTA_LINHAVL_NITM: TStringField;
    qyAgendaFL_ESQUEMA: TIntegerField;
    qyAgendaDS_ESQUEMA: TIBStringField;
    qyAgendaTP_ESQUEMA: TIntegerField;
    qyAgendaVL_CD4: TIntegerField;
    grExport: TdxDBGrid;
    dxDBGridColumn1: TdxDBGridColumn;
    dxDBGridColumn2: TdxDBGridColumn;
    dxDBGridMaskColumn1: TdxDBGridMaskColumn;
    dxDBGridColumn3: TdxDBGridColumn;
    dxDBGridColumn5: TdxDBGridColumn;
    dxDBGridDateColumn1: TdxDBGridDateColumn;
    dxDBGridPickColumn1: TdxDBGridPickColumn;
    dxDBGridColumn6: TdxDBGridColumn;
    dxDBGridColumn7: TdxDBGridColumn;
    dxDBGridDateColumn2: TdxDBGridDateColumn;
    dxDBGridColumn8: TdxDBGridColumn;
    dxDBGridDateColumn3: TdxDBGridDateColumn;
    grExportColumn35: TdxDBGridColumn;
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
    grExportColumn34: TdxDBGridColumn;
    grExportColumn31: TdxDBGridColumn;
    grExportColumn32: TdxDBGridColumn;
    grExportColumn33: TdxDBGridDateColumn;
    qyExportTODOS: TIBStringField;
    qyExportCD_MAPA_CRIANCA_EXPOSTA_LINHA: TIntegerField;
    qyExportCD_MAPA_CRIANCA_EXPOSTA: TIntegerField;
    qyExportCD_PACIENTE: TIntegerField;
    qyExportCD_PACIENTE_MAE: TIntegerField;
    qyExportNR_PROCESSO_CRIANCA_EXPOSTA: TIBStringField;
    qyExportNM_PACIENTE: TIBStringField;
    qyExportFL_SEXO: TIBStringField;
    qyExportCD_AGENDA: TIntegerField;
    qyExportNR_IDADE_MESES: TIntegerField;
    qyExportDT_PRIMEIRA_CONSULTA: TDateTimeField;
    qyExportVL_ESTADIO_PC: TIBStringField;
    qyExportDT_PRIMEIRO_TARV: TDateTimeField;
    qyExportVL_PRIMEIRO_ESQUEMA: TIBStringField;
    qyExportVL_ULTIMA_ESQUEMA: TIBStringField;
    qyExportDT_ULTIMA_CONSULTA: TDateTimeField;
    qyExportVL_ESTADIO_UC: TIBStringField;
    qyExportVL_RASTREIO_TB: TIBStringField;
    qyExportVL_TB_NOVO: TIBStringField;
    qyExportVL_N: TIBStringField;
    qyExportVL_I: TIBStringField;
    qyExportVL_M: TIBStringField;
    qyExportVL_T: TIBStringField;
    qyExportVL_TARV_PADRAO: TIBStringField;
    qyExportVL_PRESCRICAO_IONIZADA: TIBStringField;
    qyExportVL_PRESCRICAO_COTROMIXAZOL: TIBStringField;
    qyExportDT_ESTADIO_UC: TDateTimeField;
    qyExportDT_TR_UC: TDateTimeField;
    qyExportDT_DPI_UC: TDateTimeField;
    qyExportCD_MAPA_CRIANCA_EXPOSTA1: TIntegerField;
    qyExportCD_UNIDADE: TIntegerField;
    qyExportDT_MAPA: TDateTimeField;
    qyExportCD_MEDICO: TIntegerField;
    qyExportNM_MEDICO: TIBStringField;
    qyExportDT_INICIO_CRIANCA_EXP: TDateField;
    qyExportNM_MAE: TIBStringField;
    TB_MAPA_CRIANCA_EXPOSTA_LINHAVL_DPI_PC: TIntegerField;
    TB_MAPA_CRIANCA_EXPOSTA_LINHAVL_DPI_UC: TIntegerField;
    qyExportVL_DPI_PC: TIntegerField;
    qyExportVL_DPI_UC: TIntegerField;
    qyPrimeiraConsultaVL_DPI_PC: TIntegerField;
    TB_MAPA_CRIANCA_EXPOSTA_LINHAVL_TR_PC: TIBStringField;
    TB_MAPA_CRIANCA_EXPOSTA_LINHAVL_TR_UC: TIBStringField;
    qyPrimeiraConsultaVL_TR_PC: TIBStringField;
    grMapaMedicoVL_TR_UC: TdxDBGridPickColumn;
    grMapaMedicoVL_TR_PC: TdxDBGridPickColumn;
    qyExportVL_TR_PC: TIBStringField;
    qyExportVL_TR_UC: TIBStringField;
    qyDPI_Laboratorio: TIBQuery;
    qyDPI_LaboratorioVL_RESULTADO: TIBStringField;
    qyDPI_LaboratorioDT_RESULTADO: TDateTimeField;
    pnCampos: TPanel;
    ckCampos: TCheckListBox;
    btCampos: TBitBtn;
    Imprimir1: TMenuItem;
    qyConfereAgendamento: TIBQuery;
    qyConfereAgendamentoCD_AGENDA: TIntegerField;
    procedure btLocMedicoButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure TB_MAPA_CRIANCA_EXPOSTAAfterInsert(DataSet: TDataSet);
    procedure TB_MAPA_CRIANCA_EXPOSTAAfterOpen(DataSet: TDataSet);
    procedure TB_MAPA_CRIANCA_EXPOSTABeforeClose(DataSet: TDataSet);
    procedure TB_MAPA_CRIANCA_EXPOSTABeforeDelete(DataSet: TDataSet);
    procedure TB_MAPA_CRIANCA_EXPOSTA_LINHABeforeInsert(DataSet: TDataSet);
    procedure TB_MAPA_CRIANCA_EXPOSTA_LINHACalcFields(DataSet: TDataSet);
    procedure TB_MAPA_CRIANCA_EXPOSTA_LINHAAfterInsert(DataSet: TDataSet);
    procedure btInsClick(Sender: TObject);
    procedure btDelClick(Sender: TObject);
    procedure grDadosDblClick(Sender: TObject);
    procedure TB_MAPA_CRIANCA_EXPOSTACD_MEDICOValidate(Sender: TField);
    procedure TB_MAPA_CRIANCA_EXPOSTADT_MAPAValidate(Sender: TField);
    procedure TB_MAPA_CRIANCA_EXPOSTA_LINHANR_PROCESSO_CRIANCA_EXPOSTAValidate(
      Sender: TField);
    procedure FormShow(Sender: TObject);
    procedure btgravarClick(Sender: TObject);
    procedure bteditarClick(Sender: TObject);
    procedure btCancelarClick(Sender: TObject);
    procedure btexcluirClick(Sender: TObject);
    procedure btIncluirClick(Sender: TObject);
    procedure btAgendaClick(Sender: TObject);
    procedure btimprimirClick(Sender: TObject);
    procedure TB_MAPA_CRIANCA_EXPOSTA_LINHABeforePost(DataSet: TDataSet);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure pgGeralChange(Sender: TObject);
    procedure AtualizarLista1Click(Sender: TObject);
    procedure Excel1Click(Sender: TObject);
    procedure Editar1Click(Sender: TObject);
    procedure qyExportCalcFields(DataSet: TDataSet);
    procedure grBTEsquemaButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure grBTUltimoEsquemaButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure grBT_VL_TARV_PADRAOButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure TB_MAPA_CRIANCA_EXPOSTA_LINHAVL_NValidate(Sender: TField);
    procedure TB_MAPA_CRIANCA_EXPOSTA_LINHAVL_IValidate(Sender: TField);
    procedure TB_MAPA_CRIANCA_EXPOSTA_LINHAVL_TValidate(Sender: TField);
    procedure TB_MAPA_CRIANCA_EXPOSTA_LINHAVL_MValidate(Sender: TField);
    procedure qyExportAfterScroll(DataSet: TDataSet);
    procedure btPesquisarClick(Sender: TObject);
    procedure btLocMedicoChange(Sender: TObject);
    procedure TB_MAPA_CRIANCA_EXPOSTABeforePost(DataSet: TDataSet);
    procedure btCamposClick(Sender: TObject);
    procedure ckCamposClickCheck(Sender: TObject);
    procedure Imprimir1Click(Sender: TObject);
  private
    { Private declarations }
    procedure LocalizarMapa;
    procedure ValidarMapa;
    procedure LancaAgenda(pDtAgenda:TDate; pnConfirmado:integer);
    procedure ValidarPaciente;
    function SelecionarEsquema: Boolean;
  public
    { Public declarations }
    procedure AbreConsultas;
    procedure FechaConsultas;
  end;

var
  frmCadMapaCriancaExposta: TfrmCadMapaCriancaExposta;
  sSQLAgenda : String;
  bExportando : boolean;

implementation

uses UDMGERAL, UDM, DateUtils, Ugeral, uFuncaoContraSenha, ufrmLocalizar,
  UfrmRelMapa, uGeralSQL, uConsAbandono;

{$R *.dfm}

procedure TfrmCadMapaCriancaExposta.btLocMedicoButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
begin
  if TB_MAPA_CRIANCA_EXPOSTA.State in [dsEdit, dsInsert] then
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
      TB_MAPA_CRIANCA_EXPOSTANM_MEDICO.AsString := frmLocalizar.qyDados.FieldByname('nm_medico').AsString;
      TB_MAPA_CRIANCA_EXPOSTACD_MEDICO.AsInteger := frmLocalizar.qyDados.FieldByname('cd_medico').AsInteger;
    end;
    frmLocalizar.qyDados.Close;
    FreeAndNil(frmLocalizar);
  end;
end;

procedure TfrmCadMapaCriancaExposta.TB_MAPA_CRIANCA_EXPOSTAAfterInsert(
  DataSet: TDataSet);
begin
  inherited;
  TB_MAPA_CRIANCA_EXPOSTACD_UNIDADE.AsString := prmUnidade;

  TB_MAPA_CRIANCA_EXPOSTACD_MEDICO.AsString := prmAgendaCriancaExposta;
  TB_MAPA_CRIANCA_EXPOSTANM_MEDICO.AsVariant :=
    PegaValor('NM_MEDICO', 'MEDICO', ['CD_MEDICO'], [prmAgendaCriancaExposta]);

end;

procedure TfrmCadMapaCriancaExposta.TB_MAPA_CRIANCA_EXPOSTAAfterOpen(
  DataSet: TDataSet);
begin
  inherited;
  TB_MAPA_CRIANCA_EXPOSTA_LINHA.Open;
end;

procedure TfrmCadMapaCriancaExposta.TB_MAPA_CRIANCA_EXPOSTABeforeClose(
  DataSet: TDataSet);
begin
  inherited;
  TB_MAPA_CRIANCA_EXPOSTA_LINHA.Close;
end;

procedure TfrmCadMapaCriancaExposta.TB_MAPA_CRIANCA_EXPOSTABeforeDelete(
  DataSet: TDataSet);
begin
  inherited;
  while Not TB_MAPA_CRIANCA_EXPOSTA_LINHA.Eof do
    TB_MAPA_CRIANCA_EXPOSTA_LINHA.Delete;
end;

procedure TfrmCadMapaCriancaExposta.TB_MAPA_CRIANCA_EXPOSTA_LINHABeforeInsert(
  DataSet: TDataSet);
begin
  inherited;
    if TB_MAPA_CRIANCA_EXPOSTA.state in dsEditModes then
     TB_MAPA_CRIANCA_EXPOSTA.Post;
end;

procedure TfrmCadMapaCriancaExposta.TB_MAPA_CRIANCA_EXPOSTA_LINHACalcFields(
  DataSet: TDataSet);
begin
  inherited;
  TB_MAPA_CRIANCA_EXPOSTA_LINHACODIGO.AsInteger := TB_MAPA_CRIANCA_EXPOSTA_LINHA.RecNo;

  TB_MAPA_CRIANCA_EXPOSTA_LINHAVL_NITM.AsString :=   '  ' +
    TB_MAPA_CRIANCA_EXPOSTA_LINHAVL_N.AsString + '  ' +
    TB_MAPA_CRIANCA_EXPOSTA_LINHAVL_I.AsString + '  ' +
    TB_MAPA_CRIANCA_EXPOSTA_LINHAVL_T.AsString + '  ' +
    TB_MAPA_CRIANCA_EXPOSTA_LINHAVL_M.AsString + '  ';

end;

procedure TfrmCadMapaCriancaExposta.TB_MAPA_CRIANCA_EXPOSTA_LINHAAfterInsert(
  DataSet: TDataSet);
var dData:TDate;
begin
  inherited;
  TB_MAPA_CRIANCA_EXPOSTA_LINHACD_MAPA_CRIANCA_EXPOSTA.AsInteger :=
    TB_MAPA_CRIANCA_EXPOSTACD_MAPA_CRIANCA_EXPOSTA.AsInteger;

  dData := DM.GetDate;
  TB_MAPA_CRIANCA_EXPOSTA_LINHADT_ESTADIO_UC.AsDateTime := dData;
  TB_MAPA_CRIANCA_EXPOSTA_LINHADT_TR_UC.AsDateTime := dData;
  TB_MAPA_CRIANCA_EXPOSTA_LINHADT_DPI_UC.AsDateTime := dData;
  TB_MAPA_CRIANCA_EXPOSTA_LINHADT_ULTIMA_CONSULTA.AsDateTime := dData;
end;

procedure TfrmCadMapaCriancaExposta.btInsClick(Sender: TObject);
begin
  inherited;
  if btGravar.Enabled then
    dsMapaLinha.DataSet.Append;
end;

procedure TfrmCadMapaCriancaExposta.btDelClick(Sender: TObject);
begin
  inherited;
  if btGravar.Enabled then
    dsMapaLinha.DataSet.Delete;
end;

procedure TfrmCadMapaCriancaExposta.LocalizarMapa;
begin
  if not btgravar.Enabled then
  begin
    TB_MAPA_CRIANCA_EXPOSTA.Close;
    TB_MAPA_CRIANCA_EXPOSTA.ParamByName('DT_MAPA').AsDate := qyGridDT_MAPA.AsDateTime;
    TB_MAPA_CRIANCA_EXPOSTA.Open;
  end;
end;

procedure TfrmCadMapaCriancaExposta.grDadosDblClick(Sender: TObject);
begin
  inherited;
  LocalizarMapa;
end;

procedure TfrmCadMapaCriancaExposta.ValidarMapa;
var Codigo:Variant;
begin
 Codigo:= PegaValor('CD_MAPA_CRIANCA_EXPOSTA','MAPA_CRIANCA_EXPOSTA',
         ['DT_MAPA', 'CD_MEDICO'],
         [TB_MAPA_CRIANCA_EXPOSTADT_MAPA.AsDateTime,
          TB_MAPA_CRIANCA_EXPOSTACD_MEDICO.AsInteger]);

 if not VarIsNull(Codigo) then
 begin
    qyGrid.Close;
    qyGrid.Open;
    if qyGrid.Locate('CD_MAPA_CRIANCA_EXPOSTA', Codigo,[]) then
    begin
        btCancelar.Click;
        LocalizarMapa;
    end;
 end
  else
  if (TB_MAPA_CRIANCA_EXPOSTA_LINHA.RecordCount>0)or
    (TB_MAPA_CRIANCA_EXPOSTA_LINHA.state in dsEditModes) then
 begin
   ShowMessage('Não foi possível alterar!');
   Abort;
 end;

end;

procedure TfrmCadMapaCriancaExposta.TB_MAPA_CRIANCA_EXPOSTACD_MEDICOValidate(
  Sender: TField);
begin
  inherited;
  ValidarMapa;
end;

procedure TfrmCadMapaCriancaExposta.TB_MAPA_CRIANCA_EXPOSTADT_MAPAValidate(
  Sender: TField);
begin
  inherited;
  ValidarMapa;
end;

procedure TfrmCadMapaCriancaExposta.TB_MAPA_CRIANCA_EXPOSTA_LINHANR_PROCESSO_CRIANCA_EXPOSTAValidate(
  Sender: TField);
var
  qy: TIBQuery;
begin
  inherited;

  if TB_MAPA_CRIANCA_EXPOSTA_LINHANR_PROCESSO_CRIANCA_EXPOSTA.AsString <> '' then
  begin
    ValidarPaciente;
    qy := TIBQuery.Create(nil);
    with qy do
    begin
      try
        Database := dm.DB;
        Transaction := dm.TS;
        SQl.Add('SELECT CD_PACIENTE, NM_PACIENTE, MESES, TP_SEXO, CD_PACIENTE_MAE, CD_DESFECHO_CRIANCA_EXP, DT_INICIO_CRIANCA_EXP, DT_NASCIMENTO FROM PACIENTE');
        SQl.Add('WHERE NR_PROCESSO_CRIANCA_EXP = :NR_PROCESSO_CRIANCA_EXP' );
        qy := ExecutaSQL(qy, ['NR_PROCESSO_CRIANCA_EXP'], [TB_MAPA_CRIANCA_EXPOSTA_LINHANR_PROCESSO_CRIANCA_EXPOSTA.AsString]);

        if VerificaUtenteAbandono(FieldByName('CD_PACIENTE').AsInteger) then
        begin
          ShowMessage('Este paciente esta em abandono, antes de inclui-lo no mapa é preciso mudar o status para ACTIVO!');
          frmConsAbandono := TfrmConsAbandono.Create(Application);
          frmConsAbandono.procuraCD_PACIENTE :=  FieldByName('CD_PACIENTE').AsInteger;
          frmConsAbandono.edicaoExterna := True;
          if frmConsAbandono.ShowModal <> mrOk then
            Abort;
        end;

        if RecordCount > 0 then
        begin
          TB_MAPA_CRIANCA_EXPOSTA_LINHACD_PACIENTE.AsInteger := FieldByName('CD_PACIENTE').AsInteger;
          TB_MAPA_CRIANCA_EXPOSTA_LINHACD_PACIENTE_MAE.AsInteger := FieldByName('CD_PACIENTE_MAE').AsInteger;
          TB_MAPA_CRIANCA_EXPOSTA_LINHANM_PACIENTE.AsString := FieldByName('NM_PACIENTE').AsString;
          TB_MAPA_CRIANCA_EXPOSTA_LINHANR_IDADE_MESES.AsInteger :=
              MonthsBetween(TB_MAPA_CRIANCA_EXPOSTADT_MAPA.AsDateTime, FieldByName('DT_NASCIMENTO').AsDateTime);

          TB_MAPA_CRIANCA_EXPOSTA_LINHAFL_SEXO.AsString := FieldByName('TP_SEXO').AsString;
          TB_MAPA_CRIANCA_EXPOSTA_LINHADT_INICIO_CRIANCA_EXP.AsDateTime := FieldByName('DT_INICIO_CRIANCA_EXP').AsDateTime;
          TB_MAPA_CRIANCA_EXPOSTA_LINHANM_MAE.AsString := PegaValor('NM_PACIENTE','PACIENTE',['CD_PACIENTE'],[TB_MAPA_CRIANCA_EXPOSTA_LINHACD_PACIENTE_MAE.AsInteger]);

          AtualizaPacienteIdade(FieldByName('CD_PACIENTE').AsInteger);

          //Primeira Consulta
          qyPrimeiraConsulta.Close;
          qyPrimeiraConsulta.ParamByName('NR_PROCESSO_CRIANCA_EXPOSTA').AsString := TB_MAPA_CRIANCA_EXPOSTA_LINHANR_PROCESSO_CRIANCA_EXPOSTA.AsString;
          qyPrimeiraConsulta.Open;
          if not qyPrimeiraConsulta.IsEmpty then
          begin

            TB_MAPA_CRIANCA_EXPOSTA_LINHAVL_TR_PC.AsString := qyPrimeiraConsultaVL_TR_PC.AsString;
            TB_MAPA_CRIANCA_EXPOSTA_LINHAVL_DPI_PC.AsInteger := qyPrimeiraConsultaVL_DPI_PC.AsInteger;
            TB_MAPA_CRIANCA_EXPOSTA_LINHADT_PRIMEIRA_CONSULTA.AsString := qyPrimeiraConsultaDT_PRIMEIRA_CONSULTA.AsString;
            TB_MAPA_CRIANCA_EXPOSTA_LINHAVL_ESTADIO_PC.AsString := qyPrimeiraConsultaVL_ESTADIO_PC.AsString;
            TB_MAPA_CRIANCA_EXPOSTA_LINHAVL_PRIMEIRO_ESQUEMA.AsString := qyPrimeiraConsultaVL_PRIMEIRO_ESQUEMA.AsString;
            TB_MAPA_CRIANCA_EXPOSTA_LINHADT_PRIMEIRO_TARV.AsString := qyPrimeiraConsultaDT_PRIMEIRO_TARV.AsString;
          end;
          qyPrimeiraConsulta.Close;

          //Ultima Consulta
          qyUltimaConsulta.Close;
          qyUltimaConsulta.ParamByName('NR_PROCESSO_CRIANCA_EXPOSTA').AsString :=
                TB_MAPA_CRIANCA_EXPOSTA_LINHANR_PROCESSO_CRIANCA_EXPOSTA.AsString;
          qyUltimaConsulta.ParamByName('CD_MAPA_CRIANCA_EXPOSTA_LINHA').AsString :=
                TB_MAPA_CRIANCA_EXPOSTA_LINHACD_MAPA_CRIANCA_EXPOSTA_LINHA.AsString;
          qyUltimaConsulta.Open;
          if not qyUltimaConsulta.IsEmpty then
          begin
             if not qyUltimaConsultaVL_TARV_PADRAO.IsNull then
               TB_MAPA_CRIANCA_EXPOSTA_LINHAVL_ULTIMA_ESQUEMA.AsString :=
                 qyUltimaConsultaVL_TARV_PADRAO.AsString;
          end
          else
           TB_MAPA_CRIANCA_EXPOSTA_LINHAVL_ULTIMA_ESQUEMA.AsString :=
               TB_MAPA_CRIANCA_EXPOSTA_LINHAVL_PRIMEIRO_ESQUEMA.AsString ;
          qyUltimaConsulta.Close;

          // pega CD4 do resultado do laboratorio e coloca no CD4 Ultima consulta
          qyDPI_Laboratorio.Close;
          qyDPI_Laboratorio.ParamByName('NR_PROCESSO').AsString :=
            TB_MAPA_CRIANCA_EXPOSTA_LINHANR_PROCESSO_CRIANCA_EXPOSTA.AsString;
          qyDPI_Laboratorio.Open;
          if not qyDPI_Laboratorio.IsEmpty then
          begin
            try
              TB_MAPA_CRIANCA_EXPOSTA_LINHAVL_DPI_UC.AsInteger := qyDPI_LaboratorioVL_RESULTADO.AsInteger;
              TB_MAPA_CRIANCA_EXPOSTA_LINHADT_DPI_UC.AsString := qyDPI_LaboratorioDT_RESULTADO.AsString;
            except
              // Valor do resultado não é inteiro
            end;
          end;
          qyDPI_Laboratorio.Close;

        end else
        begin
          ShowMessage('Nenhuma criança exposta encontrada com este Nr. de Processo');
          Abort;
        end;
      finally
        Close;
        Free;
      end;
    end;
  end
  else
  begin
    TB_MAPA_CRIANCA_EXPOSTA_LINHACD_PACIENTE.AsString := '';
    TB_MAPA_CRIANCA_EXPOSTA_LINHACD_PACIENTE_MAE.AsString := '';
    TB_MAPA_CRIANCA_EXPOSTA_LINHANM_PACIENTE.AsString := '';
    TB_MAPA_CRIANCA_EXPOSTA_LINHANR_IDADE_MESES.AsString := '';
    TB_MAPA_CRIANCA_EXPOSTA_LINHAFL_SEXO.AsString := '';
  end;
end;

procedure TfrmCadMapaCriancaExposta.FormShow(Sender: TObject);
begin
  inherited;
  grExport.LoadFromIniFile(grExport.IniFileName);
  qyGrid.Open;
  pgGeral.ActivePageIndex := 0;
end;

procedure TfrmCadMapaCriancaExposta.btgravarClick(Sender: TObject);
begin
  if TB_MAPA_CRIANCA_EXPOSTA_LINHA.state in dsEditModes then
     TB_MAPA_CRIANCA_EXPOSTA_LINHA.Post;
  inherited;
  dsMapaLinha.AutoEdit := false;
end;

procedure TfrmCadMapaCriancaExposta.bteditarClick(Sender: TObject);
begin
  if (not VerificaPermissao(58)) then
  begin
    ShowMessage('Usuário sem permissão para realizar esta operação!');
    Exit;
  end;

  pgGeral.ActivePageIndex := 1;
  pgGeralChange(sender);
  inherited;
  dsMapaLinha.AutoEdit := true;
end;

procedure TfrmCadMapaCriancaExposta.btCancelarClick(Sender: TObject);
begin
  inherited;
  dsMapaLinha.AutoEdit := false;
end;

procedure TfrmCadMapaCriancaExposta.btexcluirClick(Sender: TObject);
begin
  {TODO:Criar historico ao Excluir}
  if (not VerificaPermissao(59)) then
  begin
    ShowMessage('Usuário sem permissão para realizar esta operação!');
    Exit;
  end;

  pgGeral.ActivePageIndex := 1;
  pgGeralChange(sender);
  inherited;
end;

procedure TfrmCadMapaCriancaExposta.btIncluirClick(Sender: TObject);
begin
  if (not VerificaPermissao(58)) then
  begin
    ShowMessage('Usuário sem permissão para realizar esta operação!');
    Exit;
  end;
  
  pgGeral.ActivePageIndex := 1;
  dsMapaLinha.AutoEdit := true;
  inherited;
end;

procedure TfrmCadMapaCriancaExposta.btAgendaClick(Sender: TObject);
begin
  qyAgenda.Close;
  qyAgenda.ParamByName('CD_MEDICO').AsString :=
    btLocMedico.text;
  qyAgenda.ParamByName('DT_AGENDA').AsDate :=
    Trunc(TB_MAPA_CRIANCA_EXPOSTADT_MAPA.AsDateTime);
  qyAgenda.ParamByName('CD_MAPA').AsInteger :=
    TB_MAPA_CRIANCA_EXPOSTACD_MAPA_CRIANCA_EXPOSTA.AsInteger;
  qyAgenda.Open;
  if not qyAgenda.IsEmpty then
  begin
     qyAgenda.First;
     while not qyAgenda.Eof do
     begin
       try
         if not TB_MAPA_CRIANCA_EXPOSTA_LINHA.Locate('CD_PACIENTE',qyAgendaCD_PACIENTE.AsInteger,[]) then
         begin
           TB_MAPA_CRIANCA_EXPOSTA_LINHA.Insert;
           TB_MAPA_CRIANCA_EXPOSTA_LINHANR_PROCESSO_CRIANCA_EXPOSTA.AsString :=
             qyAgendaNR_PROCESSO_CRIANCA_EXP.AsString;
           if qyAgendaFL_ESQUEMA.AsInteger <> cvFlSim then
              TB_MAPA_CRIANCA_EXPOSTA_LINHAVL_TARV_PADRAO.AsString := qyAgendaDS_ESQUEMA.AsString;
           TB_MAPA_CRIANCA_EXPOSTA_LINHAVL_DPI_UC.AsInteger := qyAgendaVL_CD4.AsInteger;
           TB_MAPA_CRIANCA_EXPOSTA_LINHACD_AGENDA.AsInteger := qyAgendaCD_AGENDA.AsInteger;
           TB_MAPA_CRIANCA_EXPOSTA_LINHACD_PACIENTE.AsInteger := qyAgendaCD_PACIENTE.AsInteger;
           TB_MAPA_CRIANCA_EXPOSTA_LINHA.Post;
         end;
       finally
         qyAgenda.Next;
       end;
     end;
  end;
  qyAgenda.Close;
end;

procedure TfrmCadMapaCriancaExposta.btimprimirClick(Sender: TObject);
var sRel:string;
begin

  frmRelMapa := TfrmRelMapa.Create(Application);
  frmRelMapa.Caption := 'Mapa Criança Exposta';
  frmRelMapa.rbMapaSimples.Caption := 'Mapa Criança Exposta';
  frmRelMapa.rbMapaCompleto.Caption := 'Mapa Criança Exposta - Completo';

  if frmRelMapa.ShowModal = mrOK then
  begin
    if frmRelMapa.rbMapaSimples.Checked then
      sRel := '\RelMapaCriancaExp.fr3';
    if frmRelMapa.rbMapaCompleto.Checked then
      sRel := '\RelMapaCriancaExpCompleto.fr3';
    fxMapa.LoadFromFile(sPathLayOut + sRel);
    fxMapa.ShowReport;
  end;
  FreeAndNil(frmRelMapa);
end;

procedure TfrmCadMapaCriancaExposta.LancaAgenda(pDtAgenda: TDate;
  pnConfirmado: integer);
begin
 inherited;
  dmGeral.TB_AGENDA.Close;
  dmGeral.TB_AGENDA.ParamByName('DT_DE').AsDate := Trunc(pDtAgenda);
  dmGeral.TB_AGENDA.ParamByName('DT_ATE').AsDate := Trunc(pDtAgenda)+1;
  dmGeral.TB_AGENDA.ParamByName('CD_MEDICO').AsString := TB_MAPA_CRIANCA_EXPOSTACD_MEDICO.AsString;
  dmGeral.TB_AGENDA.ParamByName('CD_PACIENTE').AsString := TB_MAPA_CRIANCA_EXPOSTA_LINHACD_PACIENTE.AsString;
  dmGeral.TB_AGENDA.Open;
  if dmGeral.TB_AGENDA.IsEmpty then
  begin
      { antes de agendar confere se tinha agenda anterior
        para o mesmo medico/paciente e preenche DT_REMARCACAO}
     qyConfereAgendamento.Close;
     qyConfereAgendamento.ParamByName('PACIENTE').AsInteger := TB_MAPA_CRIANCA_EXPOSTA_LINHACD_PACIENTE.AsInteger;
     qyConfereAgendamento.ParamByName('DATA').AsDate := Trunc(pDtAgenda);
     qyConfereAgendamento.ParamByName('CD_MEDICO').AsInteger := TB_MAPA_CRIANCA_EXPOSTACD_MEDICO.AsInteger;
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
     dmGeral.TB_AGENDACD_MEDICO.AsString := TB_MAPA_CRIANCA_EXPOSTACD_MEDICO.AsString;
     dmGeral.TB_AGENDACD_PACIENTE.AsString := TB_MAPA_CRIANCA_EXPOSTA_LINHACD_PACIENTE.AsString;
     //dmGeral.TB_AGENDANR_PROCESSO.AsString := TB_MAPA_FARMACIA_LINHANR_PROCESSO.AsString;
     dmGeral.TB_AGENDAFL_REALIZADO.AsInteger := pnConfirmado;
     dmGeral.TB_AGENDAFL_CONFIRMADO.AsInteger := pnConfirmado;
     dmGeral.TB_AGENDA.Post;
     TB_MAPA_CRIANCA_EXPOSTA_LINHACD_AGENDA.AsInteger := dmGeral.TB_AGENDACD_AGENDA.AsInteger;
  end
  else
  begin
    DMGERAL.TB_AGENDA.Edit;
    DMGERAL.TB_AGENDAFL_REALIZADO.AsInteger := pnConfirmado;
    DMGERAL.TB_AGENDAFL_REALIZADO.AsInteger := pnConfirmado;
    DMGERAL.TB_AGENDA.Post;
  end;
end;

procedure TfrmCadMapaCriancaExposta.TB_MAPA_CRIANCA_EXPOSTA_LINHABeforePost(
  DataSet: TDataSet);
begin
  inherited;
  if TB_MAPA_CRIANCA_EXPOSTA_LINHANR_PROCESSO_CRIANCA_EXPOSTA.IsNull then
  begin
    ShowMessage('O campo Nr. Processo Criança Exposta deve ser preenchido!');
    Abort;
  end;
  LancaAgenda(TB_MAPA_CRIANCA_EXPOSTADT_MAPA.asDateTime, cvFlSim);
end;

procedure TfrmCadMapaCriancaExposta.FormCreate(Sender: TObject);
begin
  inherited;
  FbPermiteMudarPagina := False;
  grExport.IniFileName := sPathGrid + '\' + self.Name + '.ini';
  AbreConsultas;
end;

procedure TfrmCadMapaCriancaExposta.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  FechaConsultas;
end;

procedure TfrmCadMapaCriancaExposta.AbreConsultas;
begin
  sSQLAgenda := dmGeral.TB_AGENDA.SelectSQL.Text;
  dmGeral.TB_AGENDA.SelectSQL.Text := StringReplace(sSQLAgenda,'/*MEDICO*/',
     'AND  "AGENDA".CD_MEDICO = :CD_MEDICO ' + chr(13) +
     'AND  "AGENDA".CD_PACIENTE = :CD_PACIENTE'
     ,[]);
  dmGeral.TB_AGENDAFL_CONFIRMADO.OnValidate := nil;
end;

procedure TfrmCadMapaCriancaExposta.FechaConsultas;
begin
  dmGeral.TB_AGENDA.Close;
  dmGeral.TB_AGENDA.SelectSQL.Text := sSQLAgenda;
  dmGeral.TB_AGENDAFL_CONFIRMADO.OnValidate := dmGeral.TB_AGENDAFL_CONFIRMADOValidate;
end;

procedure TfrmCadMapaCriancaExposta.ValidarPaciente;
begin
  if PegaValor('1', 'MAPA_CRIANCA_EXPOSTA_LINHA',
    ['CD_MAPA_CRIANCA_EXPOSTA','NR_PROCESSO_CRIANCA_EXPOSTA'],
    [TB_MAPA_CRIANCA_EXPOSTACD_MAPA_CRIANCA_EXPOSTA.AsString,
     TB_MAPA_CRIANCA_EXPOSTA_LINHANR_PROCESSO_CRIANCA_EXPOSTA.AsString]) = '1' then
  begin
    ShowMessage('Este paciente já esta no mapa!');
    Abort;
  end;
end;

procedure TfrmCadMapaCriancaExposta.pgGeralChange(Sender: TObject);
begin
  inherited;
  if pgGeral.ActivePageIndex = 0 then
    AtualizaLista;
end;

procedure TfrmCadMapaCriancaExposta.AtualizarLista1Click(Sender: TObject);
begin
  qyExport.Close;
  qyExport.Open;
end;

procedure TfrmCadMapaCriancaExposta.Excel1Click(Sender: TObject);
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

procedure TfrmCadMapaCriancaExposta.Editar1Click(Sender: TObject);
begin
  if qyGrid.Locate('CD_MAPA_CRIANCA_EXPOSTA', qyExport.FieldByName('CD_MAPA_CRIANCA_EXPOSTA').AsInteger,[]) then
  begin
     LocalizarMapa;
     bteditar.Click;

     TB_MAPA_CRIANCA_EXPOSTA_LINHA.Locate('CD_MAPA_CRIANCA_EXPOSTA_LINHA',
      qyExport.FieldByName('CD_MAPA_CRIANCA_EXPOSTA_LINHA').AsInteger,[])
  end;
end;

procedure TfrmCadMapaCriancaExposta.qyExportCalcFields(DataSet: TDataSet);
begin
  qyExportCODIGO.AsInteger := qyExport.RecNo;


end;

procedure TfrmCadMapaCriancaExposta.grBTEsquemaButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
begin
  inherited;
  if dsMapaLinha.AutoEdit  then
  begin
    if not(TB_MAPA_CRIANCA_EXPOSTA_LINHA.State in dsEditModes) then
      TB_MAPA_CRIANCA_EXPOSTA_LINHA.Edit;

    Case AbsoluteIndex of
      0:begin
        try
          if SelecionarEsquema then
          begin
            if (not TB_MAPA_CRIANCA_EXPOSTA_LINHAVL_PRIMEIRO_ESQUEMA.IsNull) and
               (frmLocalizar.qyDados.FieldByname('FL_COMPONENTE').AsString<>cvSim) then
            begin
               ShowMessage('Somente pode ser agrupado componente ao esquema!');
               Exit;
            end;

            if TB_MAPA_CRIANCA_EXPOSTA_LINHAVL_PRIMEIRO_ESQUEMA.IsNull then
              TB_MAPA_CRIANCA_EXPOSTA_LINHAVL_PRIMEIRO_ESQUEMA.AsString :=
                frmLocalizar.qyDados.FieldByname('DS_SIGLA').AsString
            else
            if (not TB_MAPA_CRIANCA_EXPOSTA_LINHAVL_PRIMEIRO_ESQUEMA.IsNull) and
               (frmLocalizar.qyDados.FieldByname('FL_COMPONENTE').AsString=cvSim) then
            begin
              TB_MAPA_CRIANCA_EXPOSTA_LINHAVL_PRIMEIRO_ESQUEMA.AsString :=
                 TB_MAPA_CRIANCA_EXPOSTA_LINHAVL_PRIMEIRO_ESQUEMA.AsString + '+' +
                 frmLocalizar.qyDados.FieldByname('DS_SIGLA').AsString;
            end;
          end;
        finally
          frmLocalizar.qyDados.Close;
          FreeAndNil(frmLocalizar);
        end;
      end;
      1: TB_MAPA_CRIANCA_EXPOSTA_LINHAVL_PRIMEIRO_ESQUEMA.Clear;
    end;
  end;
end;

function TfrmCadMapaCriancaExposta.SelecionarEsquema: Boolean;
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

procedure TfrmCadMapaCriancaExposta.grBTUltimoEsquemaButtonClick(
  Sender: TObject; AbsoluteIndex: Integer);
begin
  inherited;
  if dsMapaLinha.AutoEdit then
  begin
    if not(TB_MAPA_CRIANCA_EXPOSTA_LINHA.State in dsEditModes) then
      TB_MAPA_CRIANCA_EXPOSTA_LINHA.Edit;

    Case AbsoluteIndex of
      0:begin
        try
          if SelecionarEsquema then
          begin
            if (not TB_MAPA_CRIANCA_EXPOSTA_LINHAVL_ULTIMA_ESQUEMA.IsNull) and
               (frmLocalizar.qyDados.FieldByname('FL_COMPONENTE').AsString<>cvSim) then
            begin
               ShowMessage('Somente pode ser agrupado componente ao esquema!');
               Exit;
            end;

            if TB_MAPA_CRIANCA_EXPOSTA_LINHAVL_ULTIMA_ESQUEMA.IsNull then
              TB_MAPA_CRIANCA_EXPOSTA_LINHAVL_ULTIMA_ESQUEMA.AsString :=
                frmLocalizar.qyDados.FieldByname('DS_SIGLA').AsString
            else
            if (not TB_MAPA_CRIANCA_EXPOSTA_LINHAVL_ULTIMA_ESQUEMA.IsNull) and
               (frmLocalizar.qyDados.FieldByname('FL_COMPONENTE').AsString=cvSim) then
            begin
              TB_MAPA_CRIANCA_EXPOSTA_LINHAVL_ULTIMA_ESQUEMA.AsString :=
                 TB_MAPA_CRIANCA_EXPOSTA_LINHAVL_ULTIMA_ESQUEMA.AsString + '+' +
                 frmLocalizar.qyDados.FieldByname('DS_SIGLA').AsString;
            end;
          end;
        finally
          frmLocalizar.qyDados.Close;
          FreeAndNil(frmLocalizar);
        end;
      end;
      1: TB_MAPA_CRIANCA_EXPOSTA_LINHAVL_ULTIMA_ESQUEMA.Clear;
    end;
  end;
end;

procedure TfrmCadMapaCriancaExposta.grBT_VL_TARV_PADRAOButtonClick(
  Sender: TObject; AbsoluteIndex: Integer);
begin
  inherited;
  if dsMapaLinha.AutoEdit  then
  begin
    if not(TB_MAPA_CRIANCA_EXPOSTA_LINHA.State in dsEditModes) then
      TB_MAPA_CRIANCA_EXPOSTA_LINHA.Edit;

    Case AbsoluteIndex of
      0:begin
        try
          if SelecionarEsquema then
          begin
            if (not TB_MAPA_CRIANCA_EXPOSTA_LINHAVL_TARV_PADRAO.IsNull) and
               (frmLocalizar.qyDados.FieldByname('FL_COMPONENTE').AsString<>cvSim) then
            begin
               ShowMessage('Somente pode ser agrupado componente ao esquema!');
               Exit;
            end;

            if TB_MAPA_CRIANCA_EXPOSTA_LINHAVL_TARV_PADRAO.IsNull then
              TB_MAPA_CRIANCA_EXPOSTA_LINHAVL_TARV_PADRAO.AsString :=
                frmLocalizar.qyDados.FieldByname('DS_SIGLA').AsString
            else
            if (not TB_MAPA_CRIANCA_EXPOSTA_LINHAVL_TARV_PADRAO.IsNull) and
               (frmLocalizar.qyDados.FieldByname('FL_COMPONENTE').AsString=cvSim) then
            begin
              TB_MAPA_CRIANCA_EXPOSTA_LINHAVL_TARV_PADRAO.AsString :=
                 TB_MAPA_CRIANCA_EXPOSTA_LINHAVL_TARV_PADRAO.AsString + '+' +
                 frmLocalizar.qyDados.FieldByname('DS_SIGLA').AsString;
            end;
          end;
        finally
          frmLocalizar.qyDados.Close;
          FreeAndNil(frmLocalizar);
        end;
      end;
      1: TB_MAPA_CRIANCA_EXPOSTA_LINHAVL_TARV_PADRAO.Clear;
    end;
  end;
end;

procedure TfrmCadMapaCriancaExposta.TB_MAPA_CRIANCA_EXPOSTA_LINHAVL_NValidate(
  Sender: TField);
begin
  inherited;
  if (Sender.FieldName = 'VL_N') and (Sender.AsString = cvSim) then
  begin
    TB_MAPA_CRIANCA_EXPOSTA_LINHAVL_I.AsString := cvNao;
    TB_MAPA_CRIANCA_EXPOSTA_LINHAVL_T.AsString := cvNao;
    TB_MAPA_CRIANCA_EXPOSTA_LINHAVL_M.AsString := cvNao;
  end;
  if (Sender.FieldName = 'VL_I') and (Sender.AsString = cvSim) then
  begin
    TB_MAPA_CRIANCA_EXPOSTA_LINHAVL_N.AsString := cvNao;
    TB_MAPA_CRIANCA_EXPOSTA_LINHAVL_T.AsString := cvNao;
    TB_MAPA_CRIANCA_EXPOSTA_LINHAVL_M.AsString := cvNao;
  end;
  if (Sender.FieldName = 'VL_T') and (Sender.AsString = cvSim) then
  begin
    TB_MAPA_CRIANCA_EXPOSTA_LINHAVL_I.AsString := cvNao;
    TB_MAPA_CRIANCA_EXPOSTA_LINHAVL_N.AsString := cvNao;
    TB_MAPA_CRIANCA_EXPOSTA_LINHAVL_M.AsString := cvNao;
  end;
  if (Sender.FieldName = 'VL_M') and (Sender.AsString = cvSim) then
  begin
    TB_MAPA_CRIANCA_EXPOSTA_LINHAVL_I.AsString := cvNao;
    TB_MAPA_CRIANCA_EXPOSTA_LINHAVL_T.AsString := cvNao;
    TB_MAPA_CRIANCA_EXPOSTA_LINHAVL_N.AsString := cvNao;
  end;
end;

procedure TfrmCadMapaCriancaExposta.TB_MAPA_CRIANCA_EXPOSTA_LINHAVL_IValidate(
  Sender: TField);
begin
  inherited;
  TB_MAPA_CRIANCA_EXPOSTA_LINHAVL_NValidate(Sender);
end;

procedure TfrmCadMapaCriancaExposta.TB_MAPA_CRIANCA_EXPOSTA_LINHAVL_TValidate(
  Sender: TField);
begin
  inherited;
  TB_MAPA_CRIANCA_EXPOSTA_LINHAVL_NValidate(Sender);
end;

procedure TfrmCadMapaCriancaExposta.TB_MAPA_CRIANCA_EXPOSTA_LINHAVL_MValidate(
  Sender: TField);
begin
  inherited;
  TB_MAPA_CRIANCA_EXPOSTA_LINHAVL_NValidate(Sender);
  if TB_MAPA_CRIANCA_EXPOSTA_LINHAVL_M.AsString = 'S' then
  begin
    TB_MAPA_CRIANCA_EXPOSTA_LINHAVL_TARV_PADRAO.AsString :=
     TB_MAPA_CRIANCA_EXPOSTA_LINHAVL_ULTIMA_ESQUEMA.AsString;
  end;
end;

procedure TfrmCadMapaCriancaExposta.qyExportAfterScroll(DataSet: TDataSet);
begin
  inherited;
  if bExportando then
  begin
    sbPadrao.Panels[0].Text := 'Total:'+ intToStr(qyExport.RecordCount) + ' Atual:' +  intToStr(qyExport.RecNo);
    Application.ProcessMessages;
  end;
end;

procedure TfrmCadMapaCriancaExposta.btPesquisarClick(Sender: TObject);
begin
  inherited;
  qyGrid.Close;
  qyGrid.Open;
end;

procedure TfrmCadMapaCriancaExposta.btLocMedicoChange(Sender: TObject);
begin
  inherited;
  TB_MAPA_CRIANCA_EXPOSTANM_MEDICO.AsVariant :=
    PegaValor('NM_MEDICO', 'MEDICO', ['CD_MEDICO'], [btLocMedico.Text]);
end;

procedure TfrmCadMapaCriancaExposta.TB_MAPA_CRIANCA_EXPOSTABeforePost(
  DataSet: TDataSet);
begin
  inherited;
  if TB_MAPA_CRIANCA_EXPOSTADT_MAPA.IsNull then
  begin
    ShowMessage('O campo data do mapa deve ser preenchido');
    Abort;
  end;

  if TB_MAPA_CRIANCA_EXPOSTACD_MEDICO.IsNull then
  begin
    ShowMessage('O campo agenda deve ser preenchido');
    Abort;
  end;
end;

procedure TfrmCadMapaCriancaExposta.btCamposClick(Sender: TObject);
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

procedure TfrmCadMapaCriancaExposta.ckCamposClickCheck(Sender: TObject);
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

procedure TfrmCadMapaCriancaExposta.Imprimir1Click(Sender: TObject);
begin
  inherited;
  grExport.SaveToHTML(sPathTemp+'\export.html', true);
  ShellExecute(0, 'open', Pchar(sPathTemp+'\export.html'), nil, nil, SW_SHOW);
end;

end.
