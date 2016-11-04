unit uCadMapaTesteRapido;

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
  TfrmCadMapaTesteRapido = class(TfrmCadPad)
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
    TB_MAPA_TESTE_RAPIDO: TIBDataSet;
    TB_MAPA_TESTE_RAPIDO_PACIENTE: TIBDataSet;
    dsMapaLab: TDataSource;
    Label2: TLabel;
    grMapaMedico: TdxDBGrid;
    gcNR_PROCESSO: TdxDBGridColumn;
    gcNM_PACIENTE: TdxDBGridMaskColumn;
    gcTP_SEXO: TdxDBGridColumn;
    gcNR_IDADE: TdxDBGridColumn;
    dtMapa: TDBDateEdit;
    gcDT_MAPA: TdxDBGridColumn;
    gcCODIGO: TdxDBGridColumn;
    TB_MAPA_TESTE_RAPIDOCD_MAPA: TIntegerField;
    TB_MAPA_TESTE_RAPIDOCD_UNIDADE: TIntegerField;
    TB_MAPA_TESTE_RAPIDODT_MAPA: TDateTimeField;
    TB_MAPA_TESTE_RAPIDODS_UNIDADE: TIBStringField;
    TB_MAPA_TESTE_RAPIDODS_MUNICIPIO: TIBStringField;
    TB_MAPA_TESTE_RAPIDODS_PROVINCIA: TIBStringField;
    TB_MAPA_TESTE_RAPIDO_PACIENTECD_MAPA_PACIENTE: TIntegerField;
    TB_MAPA_TESTE_RAPIDO_PACIENTECD_MAPA: TIntegerField;
    TB_MAPA_TESTE_RAPIDO_PACIENTECD_PACIENTE: TIntegerField;
    TB_MAPA_TESTE_RAPIDO_PACIENTENM_PACIENTE: TIBStringField;
    TB_MAPA_TESTE_RAPIDO_PACIENTEFL_SEXO: TIBStringField;
    TB_MAPA_TESTE_RAPIDO_PACIENTENR_IDADE: TIntegerField;
    TB_MAPA_TESTE_RAPIDO_PACIENTEDS_OBSERVACAO: TIBStringField;
    TB_MAPA_TESTE_RAPIDO_PACIENTECD_TECNICO: TIntegerField;
    TB_MAPA_TESTE_RAPIDO_PACIENTENM_INVESTIGADOR: TIBStringField;
    TB_MAPA_TESTE_RAPIDO_PACIENTECODIGO: TIntegerField;
    TB_MAPA_TESTE_RAPIDO_PACIENTENR_PROCESSO: TIBStringField;
    gcDS_OBSERVACAO: TdxDBGridColumn;
    gcVL_RESULTADO_CONFIRMATORIO: TdxDBGridPickColumn;
    qyGridCD_UNIDADE: TIntegerField;
    qyGridDT_MAPA: TDateTimeField;
    qyGridDS_UNIDADE: TIBStringField;
    qyGridDS_MUNICIPIO: TIBStringField;
    qyGridDS_PROVINCIA: TIBStringField;
    grDS_MUNICIPIO: TdxDBGridColumn;
    grDS_UNIDADE: TdxDBGridColumn;
    gcNM_INVESTIGADOR: TdxDBGridButtonColumn;
    TB_MAPA_TESTE_RAPIDO_PACIENTETP_EXAME: TIBStringField;
    TB_MAPA_TESTE_RAPIDO_PACIENTEVL_RESULTADO_DETERMINE: TIBStringField;
    TB_MAPA_TESTE_RAPIDO_PACIENTEVL_RESULTADO_UNIGOLD: TIBStringField;
    TB_MAPA_TESTE_RAPIDO_PACIENTEVL_RESULTADO_FINAL: TIBStringField;
    TB_MAPA_TESTE_RAPIDO_PACIENTEVL_RESULTADO_CONFIRMATORIO: TIBStringField;
    gcVL_RESULTADO_DETERMINE: TdxDBGridPickColumn;
    gcVL_RESULTADO_UNIGOLD: TdxDBGridPickColumn;
    gcVL_RESULTADO_FINAL: TdxDBGridPickColumn;
    tabExport: TTabSheet;
    grExport: TdxDBGrid;
    dxDBGridColumn1: TdxDBGridColumn;
    dxDBGridColumn2: TdxDBGridColumn;
    dxDBGridMaskColumn1: TdxDBGridMaskColumn;
    dxDBGridColumn3: TdxDBGridColumn;
    dxDBGridColumn4: TdxDBGridColumn;
    dxDBGridPickColumn1: TdxDBGridPickColumn;
    dxDBGridPickColumn2: TdxDBGridPickColumn;
    dxDBGridPickColumn3: TdxDBGridPickColumn;
    dxDBGridPickColumn4: TdxDBGridPickColumn;
    dxDBGridColumn5: TdxDBGridColumn;
    dxDBGridButtonColumn1: TdxDBGridButtonColumn;
    N1: TMenuItem;
    Excel1: TMenuItem;
    qyExport: TIBQuery;
    dsExport: TDataSource;
    grExportColumn12: TdxDBGridColumn;
    grExportColumn13: TdxDBGridDateColumn;
    SaveDialog1: TSaveDialog;
    Label1: TLabel;
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
    TB_MAPA_TESTE_RAPIDOCD_MEDICO: TIntegerField;
    TB_MAPA_TESTE_RAPIDONM_MEDICO: TIBStringField;
    TB_MAPA_TESTE_RAPIDO_PACIENTECD_AGENDA: TIntegerField;
    qyGridCD_MAPA: TIntegerField;
    gcCD_MAPA: TdxDBGridColumn;
    N2: TMenuItem;
    Editar1: TMenuItem;
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
    procedure TB_MAPA_TESTE_RAPIDO_PACIENTEAfterInsert(DataSet: TDataSet);
    procedure TB_MAPA_TESTE_RAPIDOBeforeClose(DataSet: TDataSet);
    procedure TB_MAPA_TESTE_RAPIDOAfterOpen(DataSet: TDataSet);
    procedure TB_MAPA_TESTE_RAPIDO_PACIENTEBeforeInsert(DataSet: TDataSet);
    procedure grDadosDblClick(Sender: TObject);
    procedure TB_MAPA_TESTE_RAPIDO_PACIENTENR_PROCESSOValidate(Sender: TField);
    procedure btPesquisarClick(Sender: TObject);
    procedure TB_MAPA_TESTE_RAPIDOAfterInsert(DataSet: TDataSet);
    procedure TB_MAPA_TESTE_RAPIDO_PACIENTECalcFields(DataSet: TDataSet);
    procedure gcNM_INVESTIGADORButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure AtualizarLista1Click(Sender: TObject);
    procedure Excel1Click(Sender: TObject);
    procedure qyExportAfterScroll(DataSet: TDataSet);
    procedure btLocMedicoButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure btAgendaClick(Sender: TObject);
    procedure TB_MAPA_TESTE_RAPIDOBeforeDelete(DataSet: TDataSet);
    procedure TB_MAPA_TESTE_RAPIDOCD_MEDICOValidate(Sender: TField);
    procedure TB_MAPA_TESTE_RAPIDODT_MAPAValidate(Sender: TField);
    procedure Editar1Click(Sender: TObject);
    procedure btLocMedicoChange(Sender: TObject);
    procedure TB_MAPA_TESTE_RAPIDO_PACIENTEBeforePost(DataSet: TDataSet);
    procedure TB_MAPA_TESTE_RAPIDOBeforePost(DataSet: TDataSet);
    procedure pgGeralChange(Sender: TObject);
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
  frmCadMapaTesteRapido: TfrmCadMapaTesteRapido;
  bEdit, bConsolidado:Boolean;
  Unidade :Integer;
  MesAno:String;
  sSQLUnidade, sSQLAgenda:string;
  bExportando:boolean;
  
implementation

uses UDMGERAL, UDM, DateUtils, Ugeral, uRelatorioWEB, uFuncaoGrid,
  uFuncaoContraSenha, UfrmRelMapa, uConsAbandono;

{$R *.dfm}

procedure TfrmCadMapaTesteRapido.FormShow(Sender: TObject);
begin
  inherited;
  grExport.LoadFromIniFile(grExport.IniFileName);
  qyGrid.Open;
  pgGeral.ActivePageIndex := 0;
end;

procedure TfrmCadMapaTesteRapido.btgravarClick(Sender: TObject);
begin
  if TB_MAPA_TESTE_RAPIDO_PACIENTE.state in dsEditModes then
     TB_MAPA_TESTE_RAPIDO_PACIENTE.Post;
  inherited;
  dsMapaLinha.AutoEdit := false;
end;

procedure TfrmCadMapaTesteRapido.AbreConsultas;
begin
  sSQLAgenda := dmGeral.TB_AGENDA.SelectSQL.Text;
  dmGeral.TB_AGENDA.SelectSQL.Text := StringReplace(sSQLAgenda,'/*MEDICO*/',
     'AND  "AGENDA".CD_MEDICO = :CD_MEDICO ' + chr(13) +
     'AND  "AGENDA".CD_PACIENTE = :CD_PACIENTE'
     ,[]);
  dmGeral.TB_AGENDAFL_CONFIRMADO.OnValidate := nil;
end;

procedure TfrmCadMapaTesteRapido.FechaConsultas;
begin
  dmGeral.TB_AGENDA.Close;
  dmGeral.TB_AGENDA.SelectSQL.Text := sSQLAgenda;
  dmGeral.TB_AGENDAFL_CONFIRMADO.OnValidate := dmGeral.TB_AGENDAFL_CONFIRMADOValidate;
end;

procedure TfrmCadMapaTesteRapido.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  FechaConsultas;
end;

procedure TfrmCadMapaTesteRapido.FormCreate(Sender: TObject);
begin
  inherited;
  FbPermiteMudarPagina := False;
  grExport.IniFileName := sPathGrid + '\' + self.Name + '.ini';
  AbreConsultas;
end;

procedure TfrmCadMapaTesteRapido.btexcluirClick(Sender: TObject);
begin
{TODO:Criar historico ao Excluir}
  if (not VerificaPermissao(55)) then
  begin
    ShowMessage('Usuário sem permissão para realizar esta operação!');
    Exit;
  end;
  pgGeral.ActivePageIndex := 1;
  pgGeralChange(sender);
  inherited;
end;

procedure TfrmCadMapaTesteRapido.btIncluirClick(Sender: TObject);
begin
  if (not VerificaPermissao(54)) then
  begin
    ShowMessage('Usuário sem permissão para realizar esta operação!');
    Exit;
  end;
  pgGeral.ActivePageIndex := 1;
  dsMapaLinha.AutoEdit := true;
  inherited;
end;

procedure TfrmCadMapaTesteRapido.btimprimirClick(Sender: TObject);
var sRel:string;
begin
   sRel := '\RelMapaTesteRapido.fr3';
  fxMapa.LoadFromFile(sPathLayOut + sRel);
  fxMapa.ShowReport;
end;

procedure TfrmCadMapaTesteRapido.btLimparClick(Sender: TObject);
begin
  inherited;
  Limpar;
end;

procedure TfrmCadMapaTesteRapido.bteditarClick(Sender: TObject);
begin
  if (not VerificaPermissao(54)) then
  begin
    ShowMessage('Usuário sem permissão para realizar esta operação!');
    Exit;
  end;
  pgGeral.ActivePageIndex := 1;
  pgGeralChange(sender);
  inherited;
  dsMapaLinha.AutoEdit := true;
end;


procedure TfrmCadMapaTesteRapido.btCancelarClick(Sender: TObject);
begin
  inherited;
  dsMapaLinha.AutoEdit := false;
end;

procedure TfrmCadMapaTesteRapido.btInsClick(Sender: TObject);
begin
  inherited;
  if btGravar.Enabled then
    dsMapaLinha.DataSet.Append;
end;

procedure TfrmCadMapaTesteRapido.btDelClick(Sender: TObject);
begin
  inherited;
  if btGravar.Enabled then
    dsMapaLinha.DataSet.Delete;
end;

procedure TfrmCadMapaTesteRapido.dsControleStateChange(Sender: TObject);
begin
  inherited;
  //btexcluir.Enabled := false;
end;

procedure TfrmCadMapaTesteRapido.TB_MAPA_TESTE_RAPIDO_PACIENTEAfterInsert(
  DataSet: TDataSet);
//var dData:TDate;
begin
  inherited;
  TB_MAPA_TESTE_RAPIDO_PACIENTECD_MAPA.AsInteger :=
    TB_MAPA_TESTE_RAPIDOCD_MAPA.AsInteger;
end;

procedure TfrmCadMapaTesteRapido.TB_MAPA_TESTE_RAPIDOBeforeClose(
  DataSet: TDataSet);
begin
  inherited;
  TB_MAPA_TESTE_RAPIDO_PACIENTE.Close;
end;

procedure TfrmCadMapaTesteRapido.TB_MAPA_TESTE_RAPIDOAfterOpen(DataSet: TDataSet);
begin
  inherited;
  TB_MAPA_TESTE_RAPIDO_PACIENTE.Open;
end;

procedure TfrmCadMapaTesteRapido.TB_MAPA_TESTE_RAPIDO_PACIENTEBeforeInsert(
  DataSet: TDataSet);
begin
  inherited;
  if TB_MAPA_TESTE_RAPIDO.state in dsEditModes then
     TB_MAPA_TESTE_RAPIDO.Post;
end;

procedure TfrmCadMapaTesteRapido.grDadosDblClick(Sender: TObject);
begin
  inherited;
  LocalizarMapa;
end;

procedure TfrmCadMapaTesteRapido.TB_MAPA_TESTE_RAPIDO_PACIENTENR_PROCESSOValidate(
  Sender: TField);
begin
  inherited;
  if not TB_MAPA_TESTE_RAPIDO_PACIENTENR_PROCESSO.IsNull then
  with TIBQuery.Create(nil) do
  begin
    Database := dm.DB;
    Transaction := dm.TS;
    SQl.Add('SELECT * FROM PACIENTE');
    SQl.Add('WHERE NR_PROCESSO = ' + TB_MAPA_TESTE_RAPIDO_PACIENTENR_PROCESSO.AsString );
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

    TB_MAPA_TESTE_RAPIDO_PACIENTECD_PACIENTE.AsString := FieldByName('CD_PACIENTE').AsString;
    TB_MAPA_TESTE_RAPIDO_PACIENTENM_PACIENTE.AsString := FieldByName('NM_PACIENTE').AsString;
    TB_MAPA_TESTE_RAPIDO_PACIENTENR_IDADE.AsInteger :=
        YearsBetween(TB_MAPA_TESTE_RAPIDODT_MAPA.AsDateTime, FieldByName('DT_NASCIMENTO').AsDateTime);
    TB_MAPA_TESTE_RAPIDO_PACIENTEFL_SEXO.AsString := FieldByName('TP_SEXO').AsString;

    AtualizaPacienteIdade(FieldByName('CD_PACIENTE').AsInteger);

    Close;
    Free;
  end;
end;

procedure TfrmCadMapaTesteRapido.btPesquisarClick(Sender: TObject);
begin
  inherited;
  qyGrid.Close;
  qyGrid.Open;
end;

procedure TfrmCadMapaTesteRapido.TB_MAPA_TESTE_RAPIDOAfterInsert(DataSet: TDataSet);
begin
  inherited;
  TB_MAPA_TESTE_RAPIDOCD_UNIDADE.AsString := prmUnidade;
  TB_MAPA_TESTE_RAPIDOCD_MEDICO.AsString := prmAgendaTesteRapido;
  TB_MAPA_TESTE_RAPIDONM_MEDICO.AsVariant :=
    PegaValor('NM_MEDICO', 'MEDICO', ['CD_MEDICO'], [prmAgendaTesteRapido]);
end;

procedure TfrmCadMapaTesteRapido.TB_MAPA_TESTE_RAPIDO_PACIENTECalcFields(
  DataSet: TDataSet);
begin
  inherited;
  TB_MAPA_TESTE_RAPIDO_PACIENTECODIGO.AsInteger := TB_MAPA_TESTE_RAPIDO_PACIENTE.RecNo;
end;

procedure TfrmCadMapaTesteRapido.gcNM_INVESTIGADORButtonClick(
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
      TB_MAPA_TESTE_RAPIDO_PACIENTE.Edit;
      TB_MAPA_TESTE_RAPIDO_PACIENTENM_INVESTIGADOR.AsString := frmLocalizar.qyDados.FieldByname('NM_INVESTIGADOR').AsString;
      TB_MAPA_TESTE_RAPIDO_PACIENTECD_TECNICO.AsInteger := frmLocalizar.qyDados.FieldByname('CD_INVESTIGADOR').AsInteger;
    end;
    frmLocalizar.qyDados.Close;
    FreeAndNil(frmLocalizar);
end;

procedure TfrmCadMapaTesteRapido.AtualizarLista1Click(Sender: TObject);
begin
  qyExport.Close;
  qyExport.Open;
end;

procedure TfrmCadMapaTesteRapido.Excel1Click(Sender: TObject);
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

procedure TfrmCadMapaTesteRapido.qyExportAfterScroll(DataSet: TDataSet);
begin
  if bExportando then
  begin
    sbPadrao.Panels[0].Text := 'Total:'+ intToStr(qyExport.RecordCount) + ' Atual:' +  intToStr(qyExport.RecNo);
    Application.ProcessMessages;
  end;
end;

procedure TfrmCadMapaTesteRapido.btLocMedicoButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
begin
  if TB_MAPA_TESTE_RAPIDO.State in [dsEdit, dsInsert] then
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
      TB_MAPA_TESTE_RAPIDONM_MEDICO.AsString := frmLocalizar.qyDados.FieldByname('nm_medico').AsString;
      TB_MAPA_TESTE_RAPIDOCD_MEDICO.AsInteger := frmLocalizar.qyDados.FieldByname('cd_medico').AsInteger;
    end;
    frmLocalizar.qyDados.Close;
    FreeAndNil(frmLocalizar);
  end;
end;

procedure TfrmCadMapaTesteRapido.btAgendaClick(Sender: TObject);
begin
  qyAgenda.Close;
  qyAgenda.ParamByName('CD_MEDICO').AsString :=
    btLocMedico.text;
  qyAgenda.ParamByName('DT_AGENDA').AsDate :=
    Trunc(TB_MAPA_TESTE_RAPIDODT_MAPA.AsDateTime);
  qyAgenda.ParamByName('CD_MAPA').AsInteger :=
    TB_MAPA_TESTE_RAPIDOCD_MAPA.AsInteger;
  qyAgenda.Open;
  if not qyAgenda.IsEmpty then
  begin
     qyAgenda.First;
     while not qyAgenda.Eof do
     begin
       try
         TB_MAPA_TESTE_RAPIDO_PACIENTE.Insert;
         TB_MAPA_TESTE_RAPIDO_PACIENTENR_PROCESSO.AsString :=
           qyAgendaNR_PROCESSO.AsString;
         TB_MAPA_TESTE_RAPIDO_PACIENTECD_AGENDA.AsInteger := qyAgendaCD_AGENDA.AsInteger;
         TB_MAPA_TESTE_RAPIDO_PACIENTECD_PACIENTE.AsInteger := qyAgendaCD_PACIENTE.AsInteger;
         TB_MAPA_TESTE_RAPIDO_PACIENTE.Post;
       finally
         qyAgenda.Next;
       end;
     end;
  end;
  qyAgenda.Close;
end;

procedure TfrmCadMapaTesteRapido.TB_MAPA_TESTE_RAPIDOBeforeDelete(
  DataSet: TDataSet);
begin
  inherited;
  while Not TB_MAPA_TESTE_RAPIDO_PACIENTE.Eof do
    TB_MAPA_TESTE_RAPIDO_PACIENTE.Delete;
end;


procedure TfrmCadMapaTesteRapido.ValidarMapa;
var Codigo:Variant;
begin
 Codigo:= PegaValor('CD_MAPA','MAPA_TESTE_RAPIDO',
         ['DT_MAPA','CD_MEDICO'],
         [TB_MAPA_TESTE_RAPIDODT_MAPA.AsDateTime,
         TB_MAPA_TESTE_RAPIDOCD_MEDICO.AsInteger]);

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
  if (TB_MAPA_TESTE_RAPIDO_PACIENTE.RecordCount>0)or
    (TB_MAPA_TESTE_RAPIDO_PACIENTE.state in dsEditModes) then
 begin
   ShowMessage('A data não pode ser alterada!');
   Abort;
 end;

end;

procedure TfrmCadMapaTesteRapido.LocalizarMapa;
begin
  if not btgravar.Enabled then
  begin
    TB_MAPA_TESTE_RAPIDO.Close;
    TB_MAPA_TESTE_RAPIDO.ParamByName('DT_MAPA').AsDate := qyGridDT_MAPA.AsDateTime;
    TB_MAPA_TESTE_RAPIDO.Open;
  end;
end;

procedure TfrmCadMapaTesteRapido.TB_MAPA_TESTE_RAPIDOCD_MEDICOValidate(
  Sender: TField);
begin
  inherited;
  ValidarMapa;
end;

procedure TfrmCadMapaTesteRapido.TB_MAPA_TESTE_RAPIDODT_MAPAValidate(Sender: TField);
begin
  inherited;
  ValidarMapa;
end;

procedure TfrmCadMapaTesteRapido.Editar1Click(Sender: TObject);
begin
  inherited;
  if qyGrid.Locate('CD_MAPA', qyExport.FieldByName('CD_MAPA').AsInteger,[]) then
  begin
     LocalizarMapa;
     bteditar.Click;

     TB_MAPA_TESTE_RAPIDO_PACIENTE.Locate('CD_MAPA_PACIENTE',
      qyExport.FieldByName('CD_MAPA_PACIENTE').AsInteger,[])
  end;
end;

procedure TfrmCadMapaTesteRapido.btLocMedicoChange(Sender: TObject);
begin
  TB_MAPA_TESTE_RAPIDONM_MEDICO.AsVariant :=
    PegaValor('NM_MEDICO', 'MEDICO', ['CD_MEDICO'], [btLocMedico.Text]);
end;

procedure TfrmCadMapaTesteRapido.LancaAgenda(pDtAgenda:TDate; pnConfirmado:integer);
begin
  inherited;
  if VarIsNull(pDtAgenda) or (pDtAgenda = StrToDate('30/12/1899')) then
  begin
    Exit;
  end;
  dmGeral.TB_AGENDA.Close;
  dmGeral.TB_AGENDA.ParamByName('DT_DE').AsDate := Trunc(pDtAgenda);
  dmGeral.TB_AGENDA.ParamByName('DT_ATE').AsDate := Trunc(pDtAgenda)+1;
  dmGeral.TB_AGENDA.ParamByName('CD_MEDICO').AsString := TB_MAPA_TESTE_RAPIDOCD_MEDICO.AsString;
  dmGeral.TB_AGENDA.ParamByName('CD_PACIENTE').AsString := TB_MAPA_TESTE_RAPIDO_PACIENTECD_PACIENTE.AsString;
  dmGeral.TB_AGENDA.Open;
  if dmGeral.TB_AGENDA.IsEmpty then
  begin
      { antes de agendar confere se tinha agenda anterior
        para o mesmo medico/paciente e preenche DT_REMARCACAO}
     qyConfereAgendamento.Close;
     qyConfereAgendamento.ParamByName('PACIENTE').AsInteger := TB_MAPA_TESTE_RAPIDO_PACIENTECD_PACIENTE.AsInteger;
     qyConfereAgendamento.ParamByName('DATA').AsDate := Trunc(pDtAgenda);
     qyConfereAgendamento.ParamByName('CD_MEDICO').AsInteger := TB_MAPA_TESTE_RAPIDOCD_MEDICO.AsInteger;
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
     dmGeral.TB_AGENDACD_MEDICO.AsString := TB_MAPA_TESTE_RAPIDOCD_MEDICO.AsString;
     dmGeral.TB_AGENDACD_PACIENTE.AsString := TB_MAPA_TESTE_RAPIDO_PACIENTECD_PACIENTE.AsString;
     dmGeral.TB_AGENDANR_PROCESSO.AsString := TB_MAPA_TESTE_RAPIDO_PACIENTENR_PROCESSO.AsString;
     dmGeral.TB_AGENDAFL_REALIZADO.AsInteger := pnConfirmado;
     dmGeral.TB_AGENDAFL_CONFIRMADO.AsInteger := pnConfirmado;
     dmGeral.TB_AGENDA.Post;
     TB_MAPA_TESTE_RAPIDO_PACIENTECD_AGENDA.AsInteger := dmGeral.TB_AGENDACD_AGENDA.AsInteger;
  end
  else
  begin
    DMGERAL.TB_AGENDA.Edit;
    DMGERAL.TB_AGENDAFL_REALIZADO.AsInteger := pnConfirmado;
    DMGERAL.TB_AGENDAFL_REALIZADO.AsInteger := pnConfirmado;
    DMGERAL.TB_AGENDA.Post;
  end;
end;

procedure TfrmCadMapaTesteRapido.TB_MAPA_TESTE_RAPIDO_PACIENTEBeforePost(
  DataSet: TDataSet);
begin
  inherited;
  if TB_MAPA_TESTE_RAPIDO_PACIENTENR_PROCESSO.IsNull then
  begin
    ShowMessage('O campo Nr. Processo deve ser preenchido!');
    Abort;
  end;
  LancaAgenda(TB_MAPA_TESTE_RAPIDODT_MAPA.asDateTime, cvFlSim);
end;

procedure TfrmCadMapaTesteRapido.TB_MAPA_TESTE_RAPIDOBeforePost(
  DataSet: TDataSet);
begin
  inherited;
  if TB_MAPA_TESTE_RAPIDODT_MAPA.IsNull then
  begin
    ShowMessage('O campo data do mapa deve ser preenchido');
    Abort;
  end;

  if TB_MAPA_TESTE_RAPIDOCD_MEDICO.IsNull then
  begin
    ShowMessage('O campo agenda deve ser preenchido');
    Abort;
  end;
end;

procedure TfrmCadMapaTesteRapido.pgGeralChange(Sender: TObject);
begin
  inherited;
  if pgGeral.ActivePageIndex = 0 then
    AtualizaLista;
end;

procedure TfrmCadMapaTesteRapido.btCamposClick(Sender: TObject);
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

procedure TfrmCadMapaTesteRapido.ckCamposClickCheck(Sender: TObject);
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

procedure TfrmCadMapaTesteRapido.Imprimir1Click(Sender: TObject);
begin
  inherited;
  grExport.SaveToHTML(sPathTemp+'\export.html', true);
  ShellExecute(0, 'open', Pchar(sPathTemp+'\export.html'), nil, nil, SW_SHOW);
end;

end.


