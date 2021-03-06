unit uCadMapaTestagem;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UfrmCadPadFichas, dxExEdtr, DB, dxCntner, dxTL, dxDBCtrl, dxDBGrid,
  ComCtrls, StdCtrls, Buttons, ExtCtrls, Grids, IBCustomDataSet, IBQuery,
  RxLookup, Mask, DBCtrls, DBGrids, RxDBComb, RpCon, RpConDS, RpBase,
  RpSystem, RpDefine, RpRave, DBClient, Midaslib, ImgList, ib_parse,
  dxEditor, dxEdLib, UfrmCadPad, ToolEdit, Menus, UfrmCadPadSG, dxDBTLCl,
  dxGrClms,  RXDBCtrl, ufrmLocalizar, uGeralSQL, uCadNotificacao,
  frxClass, frxExportPDF, frxDBSet, CheckLst, ShellApi;

type
  TfrmCadMapaTestagem = class(TfrmCadPad)
    qyGrid: TIBQuery;
    qyGridCD_MAPA_TESTAGEM: TIntegerField;
    qyGridDT_MAPA: TDateField;
    gcCD_MAPA_TESTAGEM: TdxDBGridColumn;
    gcDT_MAPA: TdxDBGridColumn;
    dsMapaPaciente: TDataSource;
    Panel5: TPanel;
    Label4: TLabel;
    btConsultar: TBitBtn;
    dtMapa: TDBDateEdit;
    dxDBGrid1: TdxDBGrid;
    gcCODIGO: TdxDBGridColumn;
    gcNM_PACIENTE: TdxDBGridColumn;
    gcFL_SEXO: TdxDBGridPickColumn;
    gcNR_IDADE: TdxDBGridSpinColumn;
    gcFL_ACONSELHADO: TdxDBGridCheckColumn;
    gcFL_GESTANTE_NOVO: TdxDBGridCheckColumn;
    gcFL_RESULTADO_NEGATIVO: TdxDBGridCheckColumn;
    gcFL_RESULTADO_POSITIVO: TdxDBGridCheckColumn;
    gcFL_RESULTADO_INDETERMINADO: TdxDBGridCheckColumn;
    gcDS_OBSERVACAO: TdxDBGridMemoColumn;
    gcDS_PROVINCIA: TdxDBGridButtonColumn;
    Panel6: TPanel;
    btIns: TSpeedButton;
    btDel: TSpeedButton;
    gcCD_PROVINCIA: TdxDBGridColumn;
    gcNR_NOTIFICACAO: TdxDBGridButtonColumn;
    fxMapa: TfrxReport;
    fxdbMapa: TfrxDBDataset;
    frxPDFExport1: TfrxPDFExport;
    fxdbPaciente: TfrxDBDataset;
    TB_MAPA_TESTAGEM: TIBDataSet;
    TB_MAPA_TESTAGEMCD_MAPA_TESTAGEM: TIntegerField;
    TB_MAPA_TESTAGEMCD_MUNICIPIO: TIntegerField;
    TB_MAPA_TESTAGEMCD_PROVINCIA: TIntegerField;
    TB_MAPA_TESTAGEMCD_UNIDADE: TIntegerField;
    TB_MAPA_TESTAGEMDS_LOCAL: TIBStringField;
    TB_MAPA_TESTAGEMDT_MAPA: TDateField;
    TB_MAPA_TESTAGEM_PACIENTE: TIBDataSet;
    TB_MAPA_TESTAGEM_PACIENTECD_MAPA_TESTAGEM: TIntegerField;
    TB_MAPA_TESTAGEM_PACIENTECD_MAPA_TESTAGEM_PACIENTE: TIntegerField;
    TB_MAPA_TESTAGEM_PACIENTEDS_OBSERVACAO: TIBStringField;
    TB_MAPA_TESTAGEM_PACIENTEFL_ACONSELHADO: TIBStringField;
    TB_MAPA_TESTAGEM_PACIENTEFL_GESTANTE_NOVO: TIBStringField;
    TB_MAPA_TESTAGEM_PACIENTEFL_RESULTADO_INDETERMINADO: TIBStringField;
    TB_MAPA_TESTAGEM_PACIENTEFL_RESULTADO_NEGATIVO: TIBStringField;
    TB_MAPA_TESTAGEM_PACIENTEFL_RESULTADO_POSITIVO: TIBStringField;
    TB_MAPA_TESTAGEM_PACIENTEFL_SEXO: TIBStringField;
    TB_MAPA_TESTAGEM_PACIENTENM_PACIENTE: TIBStringField;
    TB_MAPA_TESTAGEM_PACIENTENR_IDADE: TIntegerField;
    TB_MAPA_TESTAGEM_PACIENTECD_MEDICO: TIntegerField;
    TB_MAPA_TESTAGEM_PACIENTECD_NOTIFICACAO: TIntegerField;
    TB_MAPA_TESTAGEM_PACIENTENR_NOTIFICACAO: TIBStringField;
    dsMapaTestagem: TDataSource;
    TB_MAPA_TESTAGEM_PACIENTENR_IDADE_MESES: TIntegerField;
    gcNR_IDADE_MESES: TdxDBGridColumn;
    TB_MAPA_TESTAGEM_PACIENTECODIGO: TIntegerField;
    TB_MAPA_TESTAGEMDS_UNIDADE: TIBStringField;
    TB_MAPA_TESTAGEMDS_MUNICIPIO: TIBStringField;
    TB_MAPA_TESTAGEMDS_PROVINCIA: TIBStringField;
    TB_MAPA_TESTAGEMNR_LIVRO: TIBStringField;
    TB_MAPA_TESTAGEM_PACIENTEFL_GESTANTE_RETORNO: TIBStringField;
    TB_MAPA_TESTAGEM_PACIENTENR_LIVRO: TIBStringField;
    TB_MAPA_TESTAGEM_PACIENTEDT_REGISTRO: TDateField;
    TB_MAPA_TESTAGEM_PACIENTENM_INVESTIGADOR: TIBStringField;
    TB_MAPA_TESTAGEM_PACIENTENM_DIGITADOR: TIBStringField;
    TB_MAPA_TESTAGEM_PACIENTEDT_INGRESSO_DIG: TDateField;
    TB_MAPA_TESTAGEM_PACIENTEDS_OBSERVACAO_DIG: TIBStringField;
    TB_MAPA_TESTAGEM_PACIENTEDS_LOCAL: TIBStringField;
    gcLIVRO: TdxDBGridColumn;
    gcDT_REGISTRO: TdxDBGridDateColumn;
    gcDS_LOCAL: TdxDBGridColumn;
    gcNM_DIGITADOR: TdxDBGridColumn;
    gcDS_OBSERVACAO_DIG: TdxDBGridColumn;
    gcDT_INGRESSO_DIG: TdxDBGridDateColumn;
    tabExport: TTabSheet;
    grExport: TdxDBGrid;
    dxDBGridColumn1: TdxDBGridColumn;
    dxDBGridColumn2: TdxDBGridColumn;
    dxDBGridDateColumn1: TdxDBGridDateColumn;
    dxDBGridColumn3: TdxDBGridColumn;
    dxDBGridPickColumn1: TdxDBGridPickColumn;
    dxDBGridSpinColumn1: TdxDBGridSpinColumn;
    dxDBGridColumn4: TdxDBGridColumn;
    dxDBGridCheckColumn1: TdxDBGridCheckColumn;
    dxDBGridCheckColumn2: TdxDBGridCheckColumn;
    dxDBGridCheckColumn3: TdxDBGridCheckColumn;
    dxDBGridCheckColumn4: TdxDBGridCheckColumn;
    dxDBGridCheckColumn5: TdxDBGridCheckColumn;
    dxDBGridButtonColumn1: TdxDBGridButtonColumn;
    dxDBGridMemoColumn1: TdxDBGridMemoColumn;
    dxDBGridColumn5: TdxDBGridColumn;
    dxDBGridColumn6: TdxDBGridColumn;
    dxDBGridColumn7: TdxDBGridColumn;
    dxDBGridColumn8: TdxDBGridColumn;
    dxDBGridDateColumn2: TdxDBGridDateColumn;
    dxDBGridColumn9: TdxDBGridColumn;
    qyExport: TIBQuery;
    dsExport: TDataSource;
    grExportColumn22: TdxDBGridColumn;
    N1: TMenuItem;
    Excel1: TMenuItem;
    SaveDialog1: TSaveDialog;
    TB_MAPA_TESTAGEM_PACIENTECD_PROVINCIA: TIntegerField;
    TB_MAPA_TESTAGEM_PACIENTECD_MUNICIPIO: TIntegerField;
    TB_MAPA_TESTAGEM_PACIENTEDS_BAIRRO: TIBStringField;
    TB_MAPA_TESTAGEM_PACIENTEDS_SALA: TIBStringField;
    TB_MAPA_TESTAGEM_PACIENTEDS_PROVINCIA: TIBStringField;
    TB_MAPA_TESTAGEM_PACIENTEDS_MUNICIPIO: TIBStringField;
    gcDS_SALA: TdxDBGridColumn;
    gcCD_MUNICIPIO: TdxDBGridColumn;
    gcDS_MUNICIPIO: TdxDBGridButtonColumn;
    dxDBGridButtonColumn2: TdxDBGridColumn;
    grExportColumn23: TdxDBGridColumn;
    grExportColumn24: TdxDBGridColumn;
    grExportColumn25: TdxDBGridColumn;
    gcNM_INVESTIGADOR: TdxDBGridButtonColumn;
    TB_MAPA_TESTAGEM_PACIENTENR_REGISTRO: TIntegerField;
    gcNR_REGISTRO: TdxDBGridColumn;
    grExportColumn27: TdxDBGridColumn;
    N2: TMenuItem;
    Editar1: TMenuItem;
    qyExportTODOS: TIBStringField;
    qyExportCD_MAPA_TESTAGEM: TIntegerField;
    qyExportDT_MAPA: TDateField;
    qyExportCD_MAPA_TESTAGEM1: TIntegerField;
    qyExportCD_MAPA_TESTAGEM_PACIENTE: TIntegerField;
    qyExportDS_OBSERVACAO: TIBStringField;
    qyExportFL_ACONSELHADO: TIBStringField;
    qyExportFL_GESTANTE_NOVO: TIBStringField;
    qyExportFL_GESTANTE_RETORNO: TIBStringField;
    qyExportFL_RESULTADO_INDETERMINADO: TIBStringField;
    qyExportFL_RESULTADO_NEGATIVO: TIBStringField;
    qyExportFL_RESULTADO_POSITIVO: TIBStringField;
    qyExportFL_SEXO: TIBStringField;
    qyExportNM_PACIENTE: TIBStringField;
    qyExportNR_IDADE: TIntegerField;
    qyExportNR_IDADE_MESES: TIntegerField;
    qyExportCD_MEDICO: TIntegerField;
    qyExportCD_NOTIFICACAO: TIntegerField;
    qyExportNR_LIVRO: TIBStringField;
    qyExportDT_REGISTRO: TDateField;
    qyExportNR_REGISTRO: TIntegerField;
    qyExportNM_INVESTIGADOR: TIBStringField;
    qyExportNM_DIGITADOR: TIBStringField;
    qyExportDT_INGRESSO_DIG: TDateField;
    qyExportDS_OBSERVACAO_DIG: TIBStringField;
    qyExportDS_LOCAL: TIBStringField;
    qyExportCD_PROVINCIA: TIntegerField;
    qyExportCD_MUNICIPIO: TIntegerField;
    qyExportDS_BAIRRO: TIBStringField;
    qyExportDS_SALA: TIBStringField;
    qyExportDS_PROVINCIA: TIBStringField;
    qyExportDS_MUNICIPIO: TIBStringField;
    qyExportNR_NOTIFICACAO: TIBStringField;
    pnCampos: TPanel;
    ckCampos: TCheckListBox;
    btCampos: TBitBtn;
    Imprimir1: TMenuItem;
    procedure btConsultarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btgravarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure btexcluirClick(Sender: TObject);
    procedure btIncluirClick(Sender: TObject);
    procedure bteditarClick(Sender: TObject);
    procedure grDadosDblClick(Sender: TObject);
    procedure btLimparClick(Sender: TObject);
    procedure btimprimirClick(Sender: TObject);
    procedure btCancelarClick(Sender: TObject);
    procedure btInsClick(Sender: TObject);
    procedure btDelClick(Sender: TObject);
    procedure gcDS_PROVINCIAButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure gcNR_NOTIFICACAOButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure dsControleStateChange(Sender: TObject);
    procedure TB_MAPA_TESTAGEM_PACIENTENR_NOTIFICACAOValidate(
      Sender: TField);
    procedure TB_MAPA_TESTAGEM_PACIENTEBeforePost(DataSet: TDataSet);
    procedure TB_MAPA_TESTAGEM_PACIENTECD_NOTIFICACAOValidate(
      Sender: TField);
    procedure TB_MAPA_TESTAGEM_PACIENTEFL_RESULTADO_INDETERMINADOValidate(
      Sender: TField);
    procedure TB_MAPA_TESTAGEM_PACIENTEAfterInsert(DataSet: TDataSet);
    procedure TB_MAPA_TESTAGEMBeforeClose(DataSet: TDataSet);
    procedure TB_MAPA_TESTAGEMAfterOpen(DataSet: TDataSet);
    procedure TB_MAPA_TESTAGEMAfterInsert(DataSet: TDataSet);
    procedure TB_MAPA_TESTAGEM_PACIENTECalcFields(DataSet: TDataSet);
    procedure AtualizarLista1Click(Sender: TObject);
    procedure Excel1Click(Sender: TObject);
    procedure qyExportAfterScroll(DataSet: TDataSet);
    procedure gcDS_MUNICIPIOButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure TB_MAPA_TESTAGEM_PACIENTECD_PROVINCIAValidate(
      Sender: TField);
    procedure TB_MAPA_TESTAGEM_PACIENTECD_MUNICIPIOValidate(
      Sender: TField);
    procedure gcNM_INVESTIGADORButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure TB_MAPA_TESTAGEMBeforeDelete(DataSet: TDataSet);
    procedure TB_MAPA_TESTAGEMDT_MAPAValidate(Sender: TField);
    procedure Editar1Click(Sender: TObject);
    procedure grExportCustomDraw(Sender: TObject; ACanvas: TCanvas;
      ARect: TRect; ANode: TdxTreeListNode; AColumn: TdxDBTreeListColumn;
      const AText: String; AFont: TFont; var AColor: TColor; ASelected,
      AFocused: Boolean; var ADone: Boolean);
    procedure btPesquisarClick(Sender: TObject);
    procedure TB_MAPA_TESTAGEMBeforePost(DataSet: TDataSet);
    procedure pgGeralChange(Sender: TObject);
    procedure btCamposClick(Sender: TObject);
    procedure ckCamposClickCheck(Sender: TObject);
    procedure Imprimir1Click(Sender: TObject);
  private
    procedure ValidarMapa;
    procedure LocalizarMapa;
    { Private declarations }
  public
    { Public declarations }
    sNomeTabela:string;
    procedure AbreConsultas;
    procedure FechaConsultas;
    procedure Validar;
    procedure ValidaResultado(Sender: TField);
  end;

var
  frmCadMapaTestagem: TfrmCadMapaTestagem;
  bEdit, bConsolidado:Boolean;
  sSQLATV:string;
  Unidade, Provincia, Municipio:Integer;
  MesAno:String;
  PSQL, MSQL, USQL:string;
  bExportando:boolean;

implementation

uses UDMGERAL, UDM, DateUtils, Ugeral, uRelatorioWEB, uFuncaoGrid,
  uFuncaoContraSenha;

{$R *.dfm}

procedure TfrmCadMapaTestagem.FormShow(Sender: TObject);
begin
  inherited;
  grExport.LoadFromIniFile(grExport.IniFileName);
  qyGrid.Open;
  pgGeral.ActivePageIndex := 0;
end;

procedure TfrmCadMapaTestagem.btgravarClick(Sender: TObject);
begin
  Validar;
  inherited;
  dsMapaPaciente.AutoEdit := false;
end;

procedure TfrmCadMapaTestagem.AbreConsultas;
begin
end;

procedure TfrmCadMapaTestagem.FechaConsultas;
begin
end;

procedure TfrmCadMapaTestagem.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  FechaConsultas;
end;

procedure TfrmCadMapaTestagem.FormCreate(Sender: TObject);
begin
  inherited;
  FbPermiteMudarPagina := False;
  grExport.IniFileName := sPathGrid + '\' + self.Name + '.ini';
  AbreConsultas;
end;

procedure TfrmCadMapaTestagem.btConsultarClick(Sender: TObject);
begin
  inherited;
  TB_MAPA_TESTAGEM.ParamByName('DT_MAPA').AsDate := dtMapa.Date;
  TB_MAPA_TESTAGEM.Close;
  TB_MAPA_TESTAGEM.Open;
end;

procedure TfrmCadMapaTestagem.btexcluirClick(Sender: TObject);
begin
{TODO:Criar historico ao Excluir}
  if (not VerificaPermissao(51)) then
  begin
    ShowMessage('Usu�rio sem permiss�o para realizar esta opera��o!');
    Exit;
  end;
  pgGeral.ActivePageIndex := 1;
  pgGeralChange(sender);
  inherited;
end;

procedure TfrmCadMapaTestagem.btIncluirClick(Sender: TObject);
begin
  if (not VerificaPermissao(50)) then
  begin
    ShowMessage('Usu�rio sem permiss�o para realizar esta opera��o!');
    Exit;
  end;
  pgGeral.ActivePageIndex := 1;
  dsMapaPaciente.AutoEdit := true;
  inherited;
end;

procedure TfrmCadMapaTestagem.btimprimirClick(Sender: TObject);
begin
  fxMapa.LoadFromFile(sPathLayOut + '\RelMapaTestagem.fr3');
  fxMapa.ShowReport;
end;

procedure TfrmCadMapaTestagem.grDadosDblClick(Sender: TObject);
begin
  inherited;
  LocalizarMapa;
{  if pgGeral.ActivePageIndex=1 then
  begin
    Limpar;
    dsControle.DataSet.Insert;
    dtMapa.Date := qyGridDT_MAPA.AsDateTime;

    btConsultarClick(sender);
  end; }
end;

procedure TfrmCadMapaTestagem.btLimparClick(Sender: TObject);
begin
  inherited;
  Limpar;
end;

procedure TfrmCadMapaTestagem.bteditarClick(Sender: TObject);
begin
  if (not VerificaPermissao(50)) then
  begin
    ShowMessage('Usu�rio sem permiss�o para realizar esta opera��o!');
    Exit;
  end;
  pgGeral.ActivePageIndex := 1;
  pgGeralChange(sender);
  inherited;
  dsMapaPaciente.AutoEdit := true;
end;

procedure TfrmCadMapaTestagem.Validar;
begin
end;

procedure TfrmCadMapaTestagem.btCancelarClick(Sender: TObject);
begin
  inherited;
  dsMapaPaciente.AutoEdit := false;
end;

procedure TfrmCadMapaTestagem.btInsClick(Sender: TObject);
begin
  inherited;
  if btGravar.Enabled then
  begin
    if TB_MAPA_TESTAGEMDT_MAPA.IsNull then
    begin
      ShowMessage('Primeiro preencha o campo data');
      Abort;
    end;
    dsMapaPaciente.DataSet.Append;
  end;
end;

procedure TfrmCadMapaTestagem.btDelClick(Sender: TObject);
begin
  inherited;
  if btGravar.Enabled then
    dsMapaPaciente.DataSet.Delete;
end;

procedure TfrmCadMapaTestagem.gcDS_PROVINCIAButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
begin
{ VG - 18/08/2016 - Os dados da provincia vem automatico quando a linha � inserida e n�o pode ser editado
  inherited;
  if not btGravar.Enabled then Exit;

  if not Assigned(frmLocalizar) then
    frmLocalizar := TfrmLocalizar.Create(application);
  frmLocalizar.Caption := 'Localizar Provincia';
  frmLocalizar.qyDados.Sql.Clear;
  frmLocalizar.qyDados.Sql.Add('select cd_provincia, ds_provincia from provincia');
  try
    frmLocalizar.Where := false;
    SetLength(VCampo,2);
    frmLocalizar.KeyField := 'cd_provincia';
    VCampo[0].Titulo  := 'C�d.';
    VCampo[0].Width := 5;
    VCampo[1].Titulo  := 'Nome';
    VCampo[1].Width := 25;
    VCampo[0].Visivel := True;
    VCampo[1].Visivel := True;
  except
    ShowMessage(frmLocalizar.qyDados.Sql.Text);
  end;
  if frmLocalizar.ShowModal=mrok then
  begin
    if not (TB_MAPA_TESTAGEM_PACIENTE.State in dsEditModes) then
      TB_MAPA_TESTAGEM_PACIENTE.Edit;
    TB_MAPA_TESTAGEM_PACIENTEDS_PROVINCIA.AsString := frmLocalizar.qyDados.FieldByname('ds_provincia').AsString;
    TB_MAPA_TESTAGEM_PACIENTECD_PROVINCIA.AsString := frmLocalizar.qyDados.FieldByname('cd_provincia').AsString;
  end;
  frmLocalizar.qyDados.Close;
  FreeAndNil(frmLocalizar);  }
end;

procedure TfrmCadMapaTestagem.gcNR_NOTIFICACAOButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
begin
  inherited;
  if btGravar.Enabled and
  (TB_MAPA_TESTAGEM_PACIENTEFL_RESULTADO_POSITIVO.AsString='S') then
  begin
   frmCadNotificacao := TfrmCadNotificacao.Create(Application);
   frmCadNotificacao.fsNotificacao := TB_MAPA_TESTAGEM_PACIENTECD_NOTIFICACAO.AsString;
   frmCadNotificacao.fbIncluir := (frmCadNotificacao.fsNotificacao = '');
   frmCadNotificacao.fsPaciente := TB_MAPA_TESTAGEM_PACIENTENM_PACIENTE.AsString;
   frmCadNotificacao.fsIdade := TB_MAPA_TESTAGEM_PACIENTENR_IDADE.AsString;
   frmCadNotificacao.fsSexo := TB_MAPA_TESTAGEM_PACIENTEFL_SEXO.AsString;
   frmCadNotificacao.ShowModal;
   if (frmCadNotificacao.fsNotificacao <>'')and
      (TB_MAPA_TESTAGEM_PACIENTECD_NOTIFICACAO.AsString <>
         frmCadNotificacao.fsNotificacao) then
   begin
      TB_MAPA_TESTAGEM_PACIENTE.Edit;
      TB_MAPA_TESTAGEM_PACIENTECD_NOTIFICACAO.AsString :=
         frmCadNotificacao.fsNotificacao;
      TB_MAPA_TESTAGEM_PACIENTE.Post;
   end;
   frmCadNotificacao.Free;
   if (TB_MAPA_TESTAGEM_PACIENTEFL_RESULTADO_POSITIVO.AsString<>'S') then
    TB_MAPA_TESTAGEM_PACIENTEFL_RESULTADO_POSITIVO.AsString:='S';
  end;
end;

procedure TfrmCadMapaTestagem.ValidaResultado(Sender: TField);
begin
{
 if (TB_MAPA_TESTAGEM_PACIENTEFL_RESULTADO_POSITIVO.AsString = 'S') and
    ((TB_MAPA_TESTAGEM_PACIENTECD_NOTIFICACAO.AsString='')or
     (TB_MAPA_TESTAGEM_PACIENTENR_NOTIFICACAO.AsString='')) then
   gcNR_NOTIFICACAOButtonClick(self,0);
 }
end;

procedure TfrmCadMapaTestagem.dsControleStateChange(Sender: TObject);
begin
  inherited;
  //btexcluir.Enabled := false;
end;

procedure TfrmCadMapaTestagem.TB_MAPA_TESTAGEM_PACIENTENR_NOTIFICACAOValidate(
  Sender: TField);
begin
  inherited;
 if (TB_MAPA_TESTAGEM_PACIENTENR_NOTIFICACAO.AsString='') then
    TB_MAPA_TESTAGEM_PACIENTECD_NOTIFICACAO.Clear;
end;

procedure TfrmCadMapaTestagem.TB_MAPA_TESTAGEM_PACIENTEBeforePost(
  DataSet: TDataSet);
begin
  inherited;
  dm.ValidaCampoObrigatorio(TB_MAPA_TESTAGEM_PACIENTENM_PACIENTE,
      'Utente');
  //Solicitado remocao desta regra em 18/05/2016 - Leandra
  {if (TB_MAPA_TESTAGEM_PACIENTEFL_RESULTADO_POSITIVO.AsString='S') then
  begin
     dm.ValidaCampoObrigatorio(TB_MAPA_TESTAGEM_PACIENTECD_NOTIFICACAO,
      'Notifica��o');
     dm.ValidaCampoObrigatorio(TB_MAPA_TESTAGEM_PACIENTENR_NOTIFICACAO,
      'Notifica��o');
  end;}

  if (TB_MAPA_TESTAGEM_PACIENTECD_NOTIFICACAO.AsString<>'') then
     TB_MAPA_TESTAGEM_PACIENTEFL_RESULTADO_POSITIVO.AsString:='S';
end;

procedure TfrmCadMapaTestagem.TB_MAPA_TESTAGEM_PACIENTECD_NOTIFICACAOValidate(
  Sender: TField);
var v:variant;
begin
  inherited;
  if not TB_MAPA_TESTAGEM_PACIENTECD_NOTIFICACAO.isNull then
  begin
     v :=   PegaValor('NR_NOTIFICACAO','NOTIFICACAO', ['CD_FICHA'],
       [TB_MAPA_TESTAGEM_PACIENTECD_NOTIFICACAO.AsString]);
     if not VarIsNull(v) then
      TB_MAPA_TESTAGEM_PACIENTENR_NOTIFICACAO.AsString := VarToStr(v);
  end;
end;

procedure TfrmCadMapaTestagem.TB_MAPA_TESTAGEM_PACIENTEFL_RESULTADO_INDETERMINADOValidate(
  Sender: TField);
begin
  inherited;
{Solicitado remocao em 14-06-16 }
{
  if (Sender.FieldName = 'FL_RESULTADO_INDETERMINADO') and (Sender.AsString = 'S') then
  begin
    if TB_MAPA_TESTAGEM_PACIENTEFL_RESULTADO_NEGATIVO.AsString = 'S' then
      TB_MAPA_TESTAGEM_PACIENTEFL_RESULTADO_NEGATIVO.AsString := 'N';

    if TB_MAPA_TESTAGEM_PACIENTEFL_RESULTADO_POSITIVO.AsString = 'S' then
      TB_MAPA_TESTAGEM_PACIENTEFL_RESULTADO_POSITIVO.AsString := 'N';
  end;

  if (Sender.FieldName = 'FL_RESULTADO_NEGATIVO') and (Sender.AsString = 'S') then
  begin
    if TB_MAPA_TESTAGEM_PACIENTEFL_RESULTADO_POSITIVO.AsString = 'S' then
      TB_MAPA_TESTAGEM_PACIENTEFL_RESULTADO_POSITIVO.AsString := 'N';

    if TB_MAPA_TESTAGEM_PACIENTEFL_RESULTADO_INDETERMINADO.AsString = 'S' then
      TB_MAPA_TESTAGEM_PACIENTEFL_RESULTADO_INDETERMINADO.AsString := 'N';
  end;

  if (Sender.FieldName = 'FL_RESULTADO_POSITIVO') and (Sender.AsString = 'S') then
  begin
    if TB_MAPA_TESTAGEM_PACIENTEFL_RESULTADO_NEGATIVO.AsString = 'S' then
      TB_MAPA_TESTAGEM_PACIENTEFL_RESULTADO_NEGATIVO.AsString := 'N';

    if TB_MAPA_TESTAGEM_PACIENTEFL_RESULTADO_INDETERMINADO.AsString = 'S' then
      TB_MAPA_TESTAGEM_PACIENTEFL_RESULTADO_INDETERMINADO.AsString := 'N';

    ValidaResultado(Sender);
  end;
}
 ValidaResultado(Sender);
end;

procedure TfrmCadMapaTestagem.TB_MAPA_TESTAGEM_PACIENTEAfterInsert(
  DataSet: TDataSet);
begin
  inherited;
  TB_MAPA_TESTAGEM_PACIENTECD_MAPA_TESTAGEM.AsInteger :=
    TB_MAPA_TESTAGEMCD_MAPA_TESTAGEM.AsInteger;
  TB_MAPA_TESTAGEM_PACIENTEDT_REGISTRO.AsDateTime :=
    TB_MAPA_TESTAGEMDT_MAPA.AsDateTime;

  TB_MAPA_TESTAGEM_PACIENTECD_MUNICIPIO.AsInteger := iMunicipio;
  TB_MAPA_TESTAGEM_PACIENTEDS_MUNICIPIO.AsString :=
      PegaValor('DS_MUNICIPIO', 'MUNICIPIO',['CD_MUNICIPIO'],[iMunicipio]);
  TB_MAPA_TESTAGEM_PACIENTECD_PROVINCIA.AsInteger := iProvincia;
  TB_MAPA_TESTAGEM_PACIENTEDS_PROVINCIA.AsString :=
      PegaValor('DS_PROVINCIA', 'PROVINCIA',['CD_PROVINCIA'],[iProvincia]);
end;

procedure TfrmCadMapaTestagem.TB_MAPA_TESTAGEMBeforeClose(
  DataSet: TDataSet);
begin
  inherited;
  TB_MAPA_TESTAGEM_PACIENTE.Close;
end;

procedure TfrmCadMapaTestagem.TB_MAPA_TESTAGEMAfterOpen(DataSet: TDataSet);
begin
  inherited;
  TB_MAPA_TESTAGEM_PACIENTE.Open;
end;

procedure TfrmCadMapaTestagem.TB_MAPA_TESTAGEMAfterInsert(
  DataSet: TDataSet);
begin
  inherited;
  //TB_MAPA_TESTAGEMDT_MAPA.AsDateTime := DM.GetDate;
  TB_MAPA_TESTAGEMCD_UNIDADE.AsString := prmUnidade;
  TB_MAPA_TESTAGEMCD_PROVINCIA.AsInteger := iProvincia;
  TB_MAPA_TESTAGEMCD_MUNICIPIO.AsInteger := iMunicipio;
end;

procedure TfrmCadMapaTestagem.TB_MAPA_TESTAGEM_PACIENTECalcFields(
  DataSet: TDataSet);
begin
  inherited;
  TB_MAPA_TESTAGEM_PACIENTECODIGO.AsInteger := TB_MAPA_TESTAGEM_PACIENTE.RecNo;
end;

procedure TfrmCadMapaTestagem.AtualizarLista1Click(Sender: TObject);
begin
  qyExport.Close;
  qyExport.Open;
end;

procedure TfrmCadMapaTestagem.Excel1Click(Sender: TObject);
begin
  if not qyExport.Active then
    qyExport.Open;

  qyExport.Prior;
  qyExport.First;

  SaveDialog1.FileName := sPath + 'Temp\Todos.xls';
  if SaveDialog1.Execute then
  begin
    bExportando := true;
    grExport.SaveToXLS(SaveDialog1.FileName,True);
  end;
  bExportando := false;
end;

procedure TfrmCadMapaTestagem.qyExportAfterScroll(DataSet: TDataSet);
begin
  if bExportando then
  begin
    sbPadrao.Panels[0].Text := 'Total:'+ intToStr(qyExport.RecordCount) + ' Atual:' +  intToStr(qyExport.RecNo);
    Application.ProcessMessages;
  end;
end;

procedure TfrmCadMapaTestagem.gcDS_MUNICIPIOButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
begin
{ VG - 18/08/2016 - Os dados do municipio vem automatico quando a linha � inserida e n�o pode ser editado
  inherited;
  if not btGravar.Enabled then Exit;

  if not Assigned(frmLocalizar) then
    frmLocalizar := TfrmLocalizar.Create(application);
  frmLocalizar.Caption := 'Localizar Munic�pio';
  frmLocalizar.qyDados.Sql.Clear;
  frmLocalizar.qyDados.Sql.Add('select cd_municipio, ds_municipio from municipio');
  frmLocalizar.qyDados.Sql.Add('where cd_provincia = ' + TB_MAPA_TESTAGEM_PACIENTECD_PROVINCIA.AsString);
  try
    frmLocalizar.Where := false;
    SetLength(VCampo,2);
    frmLocalizar.KeyField := 'cd_municipio';
    VCampo[0].Titulo  := 'C�d.';
    VCampo[0].Width := 5;
    VCampo[1].Titulo  := 'Nome';
    VCampo[1].Width := 25;
    VCampo[0].Visivel := True;
    VCampo[1].Visivel := True;
  except
    ShowMessage(frmLocalizar.qyDados.Sql.Text);
  end;
  if frmLocalizar.ShowModal=mrok then
  begin
    if not (TB_MAPA_TESTAGEM_PACIENTE.State in dsEditModes) then
      TB_MAPA_TESTAGEM_PACIENTE.Edit;
    TB_MAPA_TESTAGEM_PACIENTEDS_MUNICIPIO.AsString := frmLocalizar.qyDados.FieldByname('ds_municipio').AsString;
    TB_MAPA_TESTAGEM_PACIENTECD_MUNICIPIO.AsString := frmLocalizar.qyDados.FieldByname('cd_municipio').AsString;
  end;
  frmLocalizar.qyDados.Close;
  FreeAndNil(frmLocalizar);
  }
end;

procedure TfrmCadMapaTestagem.TB_MAPA_TESTAGEM_PACIENTECD_PROVINCIAValidate(
  Sender: TField);
begin
{ VG - 18/08/2016 - Dado vem automatico quando a linha � inserida
  inherited;
  TB_MAPA_TESTAGEM_PACIENTEDS_PROVINCIA.AsString :=
     PegaValor('DS_PROVINCIA','PROVINCIA', ['CD_PROVINCIA'],
     [TB_MAPA_TESTAGEM_PACIENTECD_PROVINCIA.AsString]);
 }
end;

procedure TfrmCadMapaTestagem.TB_MAPA_TESTAGEM_PACIENTECD_MUNICIPIOValidate(
  Sender: TField);
begin
{ VG - 18/08/2016 - Dado vem automatico quando a linha � inserida
  inherited;
  TB_MAPA_TESTAGEM_PACIENTEDS_MUNICIPIO.AsString :=
     PegaValor('DS_MUNICIPIO','MUNICIPIO', ['CD_MUNICIPIO'],
     [TB_MAPA_TESTAGEM_PACIENTECD_MUNICIPIO.AsString]);
}
end;

procedure TfrmCadMapaTestagem.gcNM_INVESTIGADORButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
begin
  inherited;
    if not btgravar.Enabled then
      Exit;
      
    frmLocalizar := TfrmLocalizar.Create(application);
    frmLocalizar.Caption := 'Localizar T�cnico';
    frmLocalizar.qyDados.SQL.Text := 'select CD_INVESTIGADOR, NM_INVESTIGADOR from INVESTIGADOR';

    try
      frmLocalizar.Where := false;
      SetLength(VCampo,3);
      frmLocalizar.KeyField := 'CD_INVESTIGADOR';
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
      TB_MAPA_TESTAGEM_PACIENTE.Edit;
      TB_MAPA_TESTAGEM_PACIENTENM_INVESTIGADOR.AsString := frmLocalizar.qyDados.FieldByname('NM_INVESTIGADOR').AsString;
    end;
    frmLocalizar.qyDados.Close;
    FreeAndNil(frmLocalizar);
end;

procedure TfrmCadMapaTestagem.TB_MAPA_TESTAGEMBeforeDelete(
  DataSet: TDataSet);
begin
  inherited;
  while not TB_MAPA_TESTAGEM_PACIENTE.Eof do
     TB_MAPA_TESTAGEM_PACIENTE.Delete;
end;

procedure TfrmCadMapaTestagem.TB_MAPA_TESTAGEMDT_MAPAValidate(
  Sender: TField);
begin
  inherited;
  ValidarMapa;
end;

procedure TfrmCadMapaTestagem.ValidarMapa;
var Codigo:Variant;
begin
 Codigo:= PegaValor('CD_MAPA_TESTAGEM','MAPA_TESTAGEM',
         ['DT_MAPA'],
         [TB_MAPA_TESTAGEMDT_MAPA.AsDateTime]);

 if not VarIsNull(Codigo) then
 begin
    qyGrid.Close;
    qyGrid.Open;
    if qyGrid.Locate('CD_MAPA_TESTAGEM', Codigo,[]) then
    begin
        btCancelar.Click;
        LocalizarMapa;
    end;
 end
 else
 if (TB_MAPA_TESTAGEM_PACIENTE.RecordCount>0)or
    (TB_MAPA_TESTAGEM_PACIENTE.state in dsEditModes)then
 begin
   ShowMessage('A data n�o pode ser alterada!');
   Abort;
 end;
 {
 TB_MAPA_TESTAGEM_PACIENTE.First;
 while Not TB_MAPA_TESTAGEM_PACIENTE.Eof do
 begin
   TB_MAPA_TESTAGEM_PACIENTE.Edit;
   TB_MAPA_TESTAGEM_PACIENTEDT_REGISTRO.AsDateTime :=
     TB_MAPA_TESTAGEMDT_MAPA.AsDateTime;
   TB_MAPA_TESTAGEM_PACIENTE.Post;
   TB_MAPA_TESTAGEM_PACIENTE.Next;
 end;
  }
end;

procedure TfrmCadMapaTestagem.LocalizarMapa;
begin
  if not btgravar.Enabled then
  begin
    TB_MAPA_TESTAGEM.Close;
    TB_MAPA_TESTAGEM.ParamByName('DT_MAPA').AsDate := qyGridDT_MAPA.AsDateTime;
    TB_MAPA_TESTAGEM.Open;
  end;
end;

procedure TfrmCadMapaTestagem.Editar1Click(Sender: TObject);
begin
  inherited;
  if qyGrid.Locate('CD_MAPA_TESTAGEM', qyExport.FieldByName('CD_MAPA_TESTAGEM').AsInteger,[]) then
  begin
     LocalizarMapa;
     bteditar.Click;

     TB_MAPA_TESTAGEM_PACIENTE.Locate('CD_MAPA_TESTAGEM_PACIENTE',
      qyExport.FieldByName('CD_MAPA_TESTAGEM_PACIENTE').AsInteger,[])
  end;
end;

procedure TfrmCadMapaTestagem.grExportCustomDraw(Sender: TObject;
  ACanvas: TCanvas; ARect: TRect; ANode: TdxTreeListNode;
  AColumn: TdxDBTreeListColumn; const AText: String; AFont: TFont;
  var AColor: TColor; ASelected, AFocused: Boolean; var ADone: Boolean);
//var
// i:integer;
begin
  inherited;
  if (AColumn.ClassType <> TdxDBGridCheckColumn)
    and ((AText = '') or (AText = '<N�O INFORMADO>'))
    and (qyExport.RecordCount > 0) then
      AColor := clRed;
  {
  AColor := clWhite;
  i:=0;
  if qyExport.Active then
  begin
    if qyExport.FieldByName('FL_RESULTADO_POSITIVO').AsString = 'S' then
      inc(i);
    if qyExport.FieldByName('FL_RESULTADO_INDETERMINADO').AsString = 'S' then
      inc(i);
    if qyExport.FieldByName('FL_RESULTADO_NEGATIVO').AsString = 'S' then
      inc(i);
    if (i>0) then
     AColor := clRed;
  end;
  }
end;

procedure TfrmCadMapaTestagem.btPesquisarClick(Sender: TObject);
begin
  inherited;
  qyGrid.Close;
  qyGrid.Open;
end;


procedure TfrmCadMapaTestagem.TB_MAPA_TESTAGEMBeforePost(
  DataSet: TDataSet);
begin
  inherited;
  if TB_MAPA_TESTAGEMDT_MAPA.IsNull then
  begin
    ShowMessage('O campo data n�o pode estar vazio');
    Abort;
  end;
end;

procedure TfrmCadMapaTestagem.pgGeralChange(Sender: TObject);
begin
  inherited;
  if pgGeral.ActivePageIndex = 0 then
    AtualizaLista;
end;

procedure TfrmCadMapaTestagem.btCamposClick(Sender: TObject);
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

procedure TfrmCadMapaTestagem.ckCamposClickCheck(Sender: TObject);
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

procedure TfrmCadMapaTestagem.Imprimir1Click(Sender: TObject);
begin
  inherited;
  grExport.SaveToHTML(sPathTemp+'\export.html', true);
  ShellExecute(0, 'open', Pchar(sPathTemp+'\export.html'), nil, nil, SW_SHOW);
end;

end.


