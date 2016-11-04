unit uCadAgenda;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UfrmCadPad, dxExEdtr, DB, dxCntner, dxTL, dxDBCtrl, dxDBGrid,
  ComCtrls, StdCtrls, Buttons, ExtCtrls, dxDBTLCl, dxGrClms,
  IBCustomDataSet, IBQuery, DBCtrls, Grids, DBGrids, dxEdLib, dxEditor,
  RxDBComb, dxDBELib, Mask, ToolEdit, RXDBCtrl, uFramePaciente, XPMan,
  Calendar, OleCtrls, SHDocVw, Menus, DBClient, DBLocal, DBLocalI, RXCtrls,
  ToolWin, ImgList, CheckLst, uspViewPDF, uspWPViewPDFCompatible, MSHTML,
  RpBase, RpSystem, RpRave, RpDefine, RpCon, RpConDS;

type
  TfrmCadAgenda = class(TfrmCadPad)
    grDadosDT_AGENDA: TdxDBGridDateColumn;
    grDadosNM_MEDICO: TdxDBGridMaskColumn;
    grDadosVL_CD4: TdxDBGridMaskColumn;
    grDadosNM_PACIENTE: TdxDBGridMaskColumn;
    grDadosDS_UNIDADE: TdxDBGridMaskColumn;
    qyAgenda: TIBQuery;
    qyPacienteExistente: TIBQuery;
    qyAgendaCD_AGENDA: TIntegerField;
    qyAgendaCD_PACIENTE: TIntegerField;
    qyAgendaDT_AGENDA: TDateTimeField;
    qyAgendaCD_UNIDADE: TIntegerField;
    qyAgendaCD_MEDICO: TIntegerField;
    qyAgendaFL_REMARCADO: TIntegerField;
    qyAgendaFL_REALIZADO: TIntegerField;
    qyAgendaTP_ESQUEMA: TIntegerField;
    qyAgendaVL_CD4: TIntegerField;
    qyAgendaNM_PACIENTE: TIBStringField;
    qyAgendaDS_UNIDADE: TIBStringField;
    qyAgendaNM_MEDICO: TIBStringField;
    qyAgendaCD_UND: TIntegerField;
    qyAgendaDT_REMARCACAO: TDateTimeField;
    qyAgendaCD_BAIRRO: TIntegerField;
    qyAgendaCD_PAIS: TIntegerField;
    qyAgendaCD_MUNICIPIO: TIntegerField;
    qyAgendaCD_MOR_MUNICIPIO: TIntegerField;
    qyAgendaCD_PROVINCIA: TIntegerField;
    qyAgendaCD_COMUNA: TIntegerField;
    qyAgendaDT_NASCIMENTO: TDateField;
    qyAgendaIDADE: TSmallintField;
    qyAgendaNM_MAE: TIBStringField;
    qyAgendaCD_MORADA_PERM: TIBStringField;
    qyAgendaCD_ESCOLARIDADE: TSmallintField;
    qyAgendaDS_ESCOLARIDADE: TIBStringField;
    qyAgendaTP_SEXO: TIBStringField;
    qyAgendaMESES: TIntegerField;
    qyAgendaESTADO_CIVIL: TIntegerField;
    qyAgendaCD_NAR_PROVINCIA: TIntegerField;
    qyAgendaCD_PACIENTE_ORACLE: TIntegerField;
    qyAgendaCD_OCUPACAO: TIntegerField;
    qyAgendaCD_DOCUMENTO: TIntegerField;
    qyAgendaTP_DOCUMENTO: TIBStringField;
    qyAgendaNR_DOCUMENTO: TIBStringField;
    qyAgendaNR_TEL_1: TIBStringField;
    qyAgendaNR_TEL_2: TIBStringField;
    qyAgendaDS_ENDERECO: TIBStringField;
    qyAgendaFL_GESTANTE: TIntegerField;
    qyAgendaFL_NOTIFICACAO: TIntegerField;
    qyAgendaNR_MESES_GESTANTE: TIntegerField;
    qyAgendaFL_RESULTADO: TIBStringField;
    dsPacienteExistente: TDataSource;
    qyAgendaDS_ESQUEMA: TIBStringField;
    grDadosColumn6: TdxDBGridColumn;
    grDadosColumn7: TdxDBGridColumn;
    qyAgendaNR_PROCESSO: TIntegerField;
    qyAgendamento: TIBQuery;
    qyAgendamentoCD_AGENDA: TIntegerField;
    qyAgendamentoCD_PACIENTE: TIntegerField;
    qyAgendamentoDT_AGENDA: TDateTimeField;
    pgDados: TPageControl;
    tblista: TTabSheet;
    grAgenda: TdxDBGrid;
    dxDBGridMaskColumn11: TdxDBGridMaskColumn;
    dxDBGridMaskColumn20: TdxDBGridMaskColumn;
    grAgendaColumn10: TdxDBGridColumn;
    dxDBGridMaskColumn12: TdxDBGridMaskColumn;
    dxDBGridColumn2: TdxDBGridColumn;
    grAgendaColumn9: TdxDBGridMaskColumn;
    dxDBGridMaskColumn17: TdxDBGridMaskColumn;
    dxDBGridMaskColumn18: TdxDBGridMaskColumn;
    grAgendaColumn8: TdxDBGridColumn;
    tbagendamento: TTabSheet;
    ScrollBox1: TScrollBox;
    Panel10: TPanel;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    btLocMedico: TdxDBButtonEdit;
    edMedico: TdxDBEdit;
    framPaciente1: TframPaciente;
    GroupBox2: TGroupBox;
    Label2: TLabel;
    btLocUnidade: TdxDBButtonEdit;
    edUnidade: TdxDBEdit;
    Panel6: TPanel;
    lbatualizando: TLabel;
    Calendario: TMonthCalendar;
    ProgressBar1: TProgressBar;
    Label31: TLabel;
    Label6: TLabel;
    grAgendaColumn11: TdxDBGridColumn;
    grAgendaColumn12: TdxDBGridColumn;
    grDadosColumn8: TdxDBGridColumn;
    grDadosColumn9: TdxDBGridColumn;
    grDadosColumn10: TdxDBGridColumn;
    grDadosColumn11: TdxDBGridColumn;
    qyAgendaFL_CONFIRMADO: TIntegerField;
    qyAgendaFL_TRANSFERIDO: TIntegerField;
    qyAgendaCONFIRMADO: TIBStringField;
    qyAgendaREALIZADO: TIBStringField;
    qyAgendaREMARCADO: TIBStringField;
    qyAgendaTRANSFERIDO: TIBStringField;
    tabAgendaMedico: TTabSheet;
    sgCalendario: TStringGrid;
    qyAtendimento: TIBQuery;
    qyTotalDia: TIBQuery;
    PopupMenu2: TPopupMenu;
    Lista1: TMenuItem;
    Mapa1: TMenuItem;
    tabMapa: TTabSheet;
    wbMapa: TWebBrowser;
    ConfigurarImpresso1: TMenuItem;
    VizualisarImpresso1: TMenuItem;
    Imprimir1: TMenuItem;
    BitBtn1: TBitBtn;
    qyMedico: TIBQuery;
    dsMedico: TDataSource;
    qyMedicoCD_MEDICO: TIntegerField;
    qyMedicoNM_MEDICO: TIBStringField;
    lbPeriodo: TLabel;
    DBLookupListBox1: TDBLookupListBox;
    SecretPanel1: TSecretPanel;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    Label8: TLabel;
    Shape1: TShape;
    Label9: TLabel;
    Shape2: TShape;
    qyAtendimentoDia: TIBQuery;
    qyPacienteExistenteCD_PACIENTE: TIntegerField;
    qyPacienteExistenteCD_UND: TIntegerField;
    qyPacienteExistenteNM_PACIENTE: TIBStringField;
    qyPacienteExistenteDT_NASCIMENTO: TDateField;
    qyPacienteExistenteNM_MAE: TIBStringField;
    qyPacienteExistenteNR_PROCESSO: TIntegerField;
    qyPacienteExistenteCD_AGENDA: TIntegerField;
    qyPacienteExistenteDT_AGENDA: TDateTimeField;
    qyPacienteExistenteCD_UNIDADE: TIntegerField;
    qyPacienteExistenteCD_MEDICO: TIntegerField;
    qyPacienteExistenteDS_UNIDADE: TIBStringField;
    qyPacienteExistenteNM_MEDICO: TIBStringField;
    Label10: TLabel;
    Shape3: TShape;
    Label11: TLabel;
    Shape4: TShape;
    Shape5: TShape;
    Shape6: TShape;
    Label7: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    DBGrid1: TDBGrid;
    DataSource1: TDataSource;
    Shape7: TShape;
    Label15: TLabel;
    qyTotalDia2: TIBQuery;
    qyPacienteAgendado: TIBQuery;
    qyPacienteAgendadoDT_AGENDA: TDateTimeField;
    qyPacienteAgendadoCD_PACIENTE: TIntegerField;
    qyPacienteAgendadoCD_MEDICO: TIntegerField;
    GroupBox3: TGroupBox;
    Label3: TLabel;
    Label5: TLabel;
    dxDBEdit1: TdxDBEdit;
    dbRemarcacao: TDBDateEdit;
    DBCheckBox1: TDBCheckBox;
    Label4: TLabel;
    dxDBButtonEdit1: TdxDBButtonEdit;
    SpeedButton4: TSpeedButton;
    SpeedButton3: TSpeedButton;
    DBCheckBox2: TDBCheckBox;
    ToolBar1: TToolBar;
    tbPgAnt: TToolButton;
    tbPagPrx: TToolButton;
    ToolButton3: TToolButton;
    ImageList1: TImageList;
    qyMedicoDT_ATIVO: TDateTimeField;
    qyMedicoFL_ATIVO: TIntegerField;
    qyMedicoNR_ATENDIMENTO: TIntegerField;
    tabExames: TTabSheet;
    dxDBEdit16: TdxDBEdit;
    Label30: TLabel;
    qyAgendaNR_LAB: TIntegerField;
    qyAgendaFL_PARECER: TIntegerField;
    grDadosColumn12: TdxDBGridColumn;
    grAgendaColumn13: TdxDBGridColumn;
    qyPacienteAgendadoCD_AGENDA: TIntegerField;
    GroupBox4: TGroupBox;
    Label16: TLabel;
    DBText1: TDBText;
    CheckListBox1: TCheckListBox;
    edNrLab: TdxDBEdit;
    btConfirmar: TBitBtn;
    ckRX: TDBCheckBox;
    ckLab: TDBCheckBox;
    GroupBox5: TGroupBox;
    GroupBox6: TGroupBox;
    GroupBox7: TGroupBox;
    GroupBox8: TGroupBox;
    GroupBox9: TGroupBox;
    GroupBox10: TGroupBox;
    GroupBox11: TGroupBox;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    CheckBox3: TCheckBox;
    CheckBox4: TCheckBox;
    CheckBox5: TCheckBox;
    CheckBox6: TCheckBox;
    CheckBox7: TCheckBox;
    CheckBox8: TCheckBox;
    CheckBox9: TCheckBox;
    CheckBox10: TCheckBox;
    CheckBox11: TCheckBox;
    CheckBox12: TCheckBox;
    CheckBox13: TCheckBox;
    CheckBox14: TCheckBox;
    CheckBox15: TCheckBox;
    CheckBox16: TCheckBox;
    CheckBox17: TCheckBox;
    CheckBox18: TCheckBox;
    CheckBox19: TCheckBox;
    CheckBox20: TCheckBox;
    CheckBox21: TCheckBox;
    CheckBox22: TCheckBox;
    CheckBox23: TCheckBox;
    CheckBox24: TCheckBox;
    CheckBox25: TCheckBox;
    CheckBox26: TCheckBox;
    CheckBox27: TCheckBox;
    CheckBox28: TCheckBox;
    CheckBox29: TCheckBox;
    qyExamesAgenda: TIBQuery;
    btGerarNovoProcesso: TBitBtn;
    DBText2: TDBText;
    qyEtiqueta: TIBQuery;
    qyEtiquetaDT_AGENDA: TDateTimeField;
    qyEtiquetaNR_LAB: TIntegerField;
    qyEtiquetaNR_PROCESSO: TIntegerField;
    RvDataSetConnectionEtiqueta: TRvDataSetConnection;
    RvEtiqueta: TRvProject;
    RvSystemEtiqueta: TRvSystem;
    BitBtn2: TBitBtn;
    btImprimirEtiqueta: TBitBtn;
    DBLookupComboBox1: TDBLookupComboBox;
    qyEsquema: TIBQuery;
    dsEsquema: TDataSource;
    grAgendaColumn14: TdxDBGridColumn;
    grAgendaColumn15: TdxDBGridColumn;
    grAgendaColumn16: TdxDBGridDateColumn;
    grDadosColumn13: TdxDBGridColumn;
    grDadosColumn14: TdxDBGridColumn;
    grDadosColumn15: TdxDBGridDateColumn;
    qyAgendaNR_TEL: TIBStringField;
    grDadosColumn16: TdxDBGridColumn;
    qyAgendaNR_PROCESSO_CRIANCA_EXP: TIBStringField;
    grDadosNrCriancaExp: TdxDBGridColumn;
    qyPacienteExistenteNR_PROCESSO_CRIANCA_EXP: TIBStringField;
    procedure CalendarioClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btLocMedicoButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure btLocMedicoChange(Sender: TObject);
    procedure btIncluirClick(Sender: TObject);
    procedure dsControleStateChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btgravarClick(Sender: TObject);
    procedure pgGeralChange(Sender: TObject);
    procedure bteditarClick(Sender: TObject);
    procedure btCancelarClick(Sender: TObject);
    procedure btexcluirClick(Sender: TObject);
    procedure btPesquisarClick(Sender: TObject);
    procedure tabListaShow(Sender: TObject);
    procedure btLocMedicoExit(Sender: TObject);
    procedure grDadosDblClick(Sender: TObject);
    procedure qyAgendaCalcFields(DataSet: TDataSet);
    procedure framPaciente1dxDBEdit2Exit(Sender: TObject);
    procedure framPaciente1dxDBEdit5Exit(Sender: TObject);
    procedure framPaciente1DBDateEdit3Exit(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btLocUnidadeButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure btLocUnidadeChange(Sender: TObject);
    procedure btLocUnidadeExit(Sender: TObject);
    procedure btimprimirClick(Sender: TObject);
    procedure dxDBButtonEdit1ButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure qyAgendamentoBeforeOpen(DataSet: TDataSet);
    procedure grAgendaDblClick(Sender: TObject);
    procedure pgDadosChange(Sender: TObject);
    procedure pgDadosChanging(Sender: TObject; var AllowChange: Boolean);
    procedure framPaciente1dxDBEdit3Exit(Sender: TObject);
    procedure framPaciente1SpeedButton2Click(Sender: TObject);
    procedure framPaciente1dxDBEdit16Exit(Sender: TObject);
    procedure btfecharClick(Sender: TObject);
    procedure sgCalendarioDrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure BitBtn1Click(Sender: TObject);
    procedure DBListBox1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure qyAtendimentoBeforeOpen(DataSet: TDataSet);
    procedure sgCalendarioSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure sgCalendarioClick(Sender: TObject);
    procedure DBLookupListBox1Click(Sender: TObject);
    procedure qyTotalDiaBeforeOpen(DataSet: TDataSet);
    procedure Label13DblClick(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure tbPagPrxClick(Sender: TObject);
    procedure tbPgAntClick(Sender: TObject);
    procedure btConfirmarClick(Sender: TObject);
    procedure qyAgendaBeforeOpen(DataSet: TDataSet);
    procedure btAnteriorClick(Sender: TObject);
    procedure btProximoClick(Sender: TObject);
    procedure tabExamesShow(Sender: TObject);
    procedure btGerarNovoProcessoClick(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure btImprimirEtiquetaClick(Sender: TObject);
    procedure qyEsquemaAfterOpen(DataSet: TDataSet);
    procedure framPaciente1dxDBEdit16Change(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    //FbPermiteMudarPagina: boolean;
    procedure SetNavegaAgenda(bNavega: boolean);
    procedure ConsultaPaciente;
    procedure AbreConsultas;
    procedure VerificarCampos;
    procedure VerificarAgendamento(psTipo:string);
    procedure AtualizaLista; override;
    procedure FocoControle; virtual;
    function  VerificarNrProcesso:Double;
    procedure Mes;
    procedure ConsultaMes(dtIni,dtFim:Tdate);
    procedure ValidaDia(sDia:String; var bIndisponivel: Boolean; var nTipo,nTotal:integer);
    function  DataDaCelula(sDia:String):TDate;
    procedure ConsultaContasDia(pdata:Tdate);
    procedure Mapa(pnPagina:integer=1);
    procedure ApagaArquivoTemporario;
    procedure AtualizaMes;
    procedure PacienteExistente;
    procedure DataInicioFimMes(var Data,dtIni,dtFim:TDate);
    function  ValidaImpedimentoAtivo(pncd_medico:string):Boolean;
    function  ValidaImpedimento(pncd_medico:string):Boolean;
    function  ValidaTotalDia(pncd_medico:string; var pnTotal:integer):Boolean;
    function  ValidaImpedimentoTriagem(pncd_medico:string):Boolean;
    function RetornaTotalDia(pData:TDate):Integer;
    procedure VerificarPacientesAgendados;
    procedure AtualizaExames;
    procedure CarregaImpressaoEtiqueta;
    
  end;

type
TAgenda = Record
  cd_medico, cnt: integer;
  dt_agenda: Tdate;
end;


var
  frmCadAgenda: TfrmCadAgenda;
  sSQL, sSQLAgendamento, sqlOld, strSQL, strConsulta, sPSQL, sNSQL,
  sSQLLista, sNome:String;
  bFiltro, bIndisponivel, bVaga:Boolean;
  gDataCalendario, gDataMedico, gData, sData, gdtIni, gdtFim:TDate;
  gwano, gwmes, gwdia:word;
  nPagina, nTotal:integer;
  vAgenda:array of TAgenda;

  

implementation

uses UDMGERAL, UDM, UfrmLocalizar, UGeralSQL, uFrmLocAgendamento,
  UPacienteExistente, DateUtils, UGeral, WBFuncs, UProcessoExistente,
  ufrmDigitalizar, UDMDIG, ufrmDlgStatus, UfrmAgendamentoExistente,
  UfrmGerarNovoProcesso, uConsAbandono;

{$R *.dfm}

procedure TfrmCadAgenda.PacienteExistente;
begin
  if not qyPacienteExistente.Eof then
  begin

    frmProcessoExistente := TfrmProcessoExistente.Create(application);
    frmProcessoExistente.DBGrid1.DataSource := dsPacienteExistente;
    if frmProcessoExistente.ShowModal = mrok then
    begin

      DMGERAL.TB_PACIENTE.Cancel;
      DMGERAL.TB_PACIENTE.Close;

      if gbLaboratorio then
      begin
        qyPacienteAgendado.Close;
        qyPacienteAgendado.ParamByName('DATA').AsDateTime := Trunc(Calendario.Date);
        qyPacienteAgendado.ParamByName('PACIENTE').AsInteger := qyPacienteExistenteCD_PACIENTE.AsInteger;
        qyPacienteAgendado.ParamByName('MEDICO').AsInteger := strtoint(prmMedicoPadraoAgenda);
        qyPacienteAgendado.Open;
        if not qyPacienteAgendado.Eof then
        begin
          frmAgendamentoExistente := TfrmAgendamentoExistente.Create(application);
          if frmAgendamentoExistente.ShowModal = mrok then
          begin
            if (DMGERAL.TB_AGENDA.state in [dsEdit,dsInsert]) then
            begin
              DMGERAL.TB_AGENDA.Cancel;
              DMGERAL.TB_AGENDA.Locate('CD_AGENDA',
                qyPacienteAgendado.FieldByname('CD_AGENDA').AsInteger,[]);
              DMGERAL.TB_AGENDA.Edit;
              DMGERAL.TB_AGENDACD_PACIENTE.AsInteger :=
                qyPacienteAgendado.FieldByname('cd_paciente').AsInteger;
              qyPacienteAgendado.Close;
            end;
          end
          else
          begin
            DMGERAL.TB_AGENDACD_PACIENTE.AsInteger :=
                  qyPacienteExistente.FieldByname('cd_paciente').AsInteger;
            qyPacienteAgendado.Close;
          end;
          frmAgendamentoExistente.free;
        end
        else
        begin
          DMGERAL.TB_AGENDACD_PACIENTE.AsInteger :=
                qyPacienteExistente.FieldByname('cd_paciente').AsInteger;
          qyPacienteAgendado.Close;
        end;
      end
      else
      begin
        DMGERAL.TB_AGENDACD_PACIENTE.AsInteger :=
              qyPacienteExistente.FieldByname('cd_paciente').AsInteger;
      end;

      DMGERAL.TB_PACIENTE.Open;
      DMGERAL.TB_PACIENTE.Edit;

      strConsulta := '';
      framPaciente1.RxDBLookupCombo1.SetFocus;
    end;
    qyPacienteExistente.Close;
    frmProcessoExistente.Free;
  end;
end;

procedure TfrmCadAgenda.VerificarPacientesAgendados;
begin
  if DMGERAL.TB_AGENDA.State in [dsInsert] then
  begin

    qyPacienteAgendado.Close;
    qyPacienteAgendado.ParamByName('DATA').AsDateTime := Trunc(Calendario.Date);
    qyPacienteAgendado.ParamByName('PACIENTE').AsInteger := DMGERAL.TB_PACIENTECD_PACIENTE.AsInteger;
    qyPacienteAgendado.ParamByName('MEDICO').AsInteger := DMGERAL.TB_AGENDACD_MEDICO.AsInteger;

    qyPacienteAgendado.Open;
    if not qyPacienteAgendado.Eof then
    begin
      MessageDlg('Já existe um atendimento para este Utente, nesta data!',mtInformation,
       [mbOK],0);

      pgDados.TabIndex := 1;
      btLocMedico.SetFocus;
      Abort;
    end;
    qyPacienteAgendado.Close;
  end;
end;

procedure TfrmCadAgenda.FocoControle;
begin
//
end;




procedure TfrmCadAgenda.AtualizaLista;
begin
  //inherited;
  //Atualizar a Consulta do Grid Agenda - Somente se Extiver na Pagina da Lista
  //Leandro - 16/07/2012 - Nao atualizar a lista devido ao acesso de consulta ao banco...
  {if (pgDados.ActivePageIndex = 0) and (dsControle.DataSet <> framPaciente1.dsPaciente.DataSet) then
  begin
    dsControle.DataSet.Close; dsControle.DataSet.Open;
  end;}
end;

function TfrmCadAgenda.VerificarNrProcesso:Double;
var
  bLibera, bEXIT:Boolean;
begin
  Result := 0;
  if DMGERAL.TB_PACIENTENR_PROCESSO.AsString <> '' then
  begin
    bLibera := false;
    bEXIT := true;

    qyPacienteExistente.Close;
    qyPacienteExistente.SQL.Text := sPSQL;
    if (DMGERAL.TB_PACIENTENR_PROCESSO.AsInteger <> null) then
    begin
       qyPacienteExistente.SQL.Add('and NR_PROCESSO =:processo');
       qyPacienteExistente.ParamByName('processo').AsInteger :=
          DMGERAL.TB_PACIENTENR_PROCESSO.AsInteger;

    end;
    qyPacienteExistente.Open;
    qyPacienteExistente.First;

    while not qyPacienteExistente.Eof do
    begin
      bEXIT := false;
      if qyPacienteExistenteCD_PACIENTE.AsInteger = DMGERAL.TB_PACIENTECD_PACIENTE.AsInteger then
      begin
        bLibera := true;
        qyPacienteExistente.Next;
      end
      else
        qyPacienteExistente.Next;
    end;

    if bLibera then
      bEXIT := true;

    if not bEXIT then
    begin
      framPaciente1dxDBEdit16Exit(Self);
      Result := 1;
    end;

  end;
end;

procedure TfrmCadAgenda.VerificarAgendamento(psTipo:string);
var
 dt_remarcacao :TDate;
 sLista,sListaMedico, sDataMenor, sDataIgual:string;
begin
  qyAgendamento.Close;
  if psTipo='T' then //Valida Transferencia
  begin
   sDataMenor := 'DT_AGENDA < :DATA';
   sDataIgual := 'DT_AGENDA = :DATA';
   qyAgendamento.SQL.Text := StringReplace(sSQLAgendamento,sDataMenor,sDataIgual,[]);
  end;

  if psTipo='R' then //Valida Remarcacao
  begin
   sLista  := '/*LISTAMEDICO*/';
   if gbLaboratorio then
     sListaMedico := ' and CD_MEDICO =' + prmMedicoPadraoAgenda 
   else
     sListaMedico := ' and CD_MEDICO =' + dmGeral.TB_AGENDACD_MEDICO.AsString;
   qyAgendamento.SQL.Text := StringReplace(sSQLAgendamento,sLista,sListaMedico,[]);
   //qyAgendamento.SQL.Text := sSQLAgendamento;
  end;

  qyAgendamento.Open;
  if (DMGERAL.TB_AGENDA.State in [dsInsert]) then
  begin
    if qyAgendamento.RecordCount>0 then
    begin
      MessageDlg('Existem agendamentos anteriores para este Utente.'+#13#10+
                 'Atualização automática será iniciada.',mtInformation,[mbOK],0);

      ProgressBar1.Visible := true;
      lbatualizando.Caption := 'Atualização de dados...';
      lbatualizando.Visible := true;

      dt_remarcacao := Trunc(Calendario.Date);//Data Sem a Hora
      dmGeral.TB_AGENDADT_AGENDA.AsDateTime := dt_remarcacao;

      try
        ProgressBar1.Position := 10;
        dsControle.DataSet.Post;
        ProgressBar1.Position := 20;
        DM.Commit(dsControle.DataSet);
        ProgressBar1.Position := 30;
        {Todo: Leandro - 16/07/2012 - Porque Fechar?}
        //DMCliente.TB_AGENDA.Close;
        DMGeral.TB_AGENDAMENTOS.Close;
        DMGeral.TB_AGENDAMENTOS.ParamByName('AGENDA').AsString :=
         qyAgendamentoCD_AGENDA.AsString;
        ProgressBar1.Position := 40;
        DMGERAL.TB_AGENDAMENTOS.Open;
        ProgressBar1.Position := 50;
        DMGERAL.TB_AGENDAMENTOS.Edit;

        if psTipo='R' then //Remarcacao
        begin
          ProgressBar1.Position := 60;
          DMGERAL.TB_AGENDAMENTOSDT_REMARCACAO.AsDateTime := dt_remarcacao;
          ProgressBar1.Position := 70;
          DMGERAL.TB_AGENDAMENTOSFL_REMARCADO.AsInteger := 1;
        end;

        if psTipo='T' then //Transferencia
        begin
          ProgressBar1.Position := 60;
          DMGERAL.TB_AGENDAMENTOSFL_TRANSFERIDO.AsInteger := 1;
        end;

        ProgressBar1.Position := 80;
        DMGERAL.TB_AGENDAMENTOS.Post;
        DM.Commit(DMGERAL.TB_AGENDAMENTOS);
        ProgressBar1.Position := 90;
      except
         on Err:Exception do
          ShowMessage(Err.message);
{        DMGERAL.TB_AGENDAMENTOS.Cancel;
        DMGERAL.TB_AGENDAMENTOS.Close;
}      end;
      ProgressBar1.Position := 100;
      lbatualizando.Caption := 'Concluida!';
      MessageDlg('Atualização concluida com Sucesso!',mtInformation,[mbOK],0);

      lbatualizando.Visible := false;
      ProgressBar1.Visible := false;

      DMGeral.TB_AGENDAMENTOS.Close;
      {Todo: Leandro - 16/07/2012 - Porque Fechar?}
      //DMCliente.TB_AGENDA.Open;
    end;
    {else
      begin
       dmGeral.TB_AGENDADT_AGENDA.AsDateTime := Trunc(Calendario.Date); //Data Sem a Hora
       dsControle.DataSet.Post;
       DM.Commit(dsControle.DataSet);
      end;}
  end;
  {else
  if (DMGERAL.TB_AGENDA.State in [dsEdit]) then
    begin
     dmGeral.TB_AGENDADT_AGENDA.AsDateTime := Trunc(Calendario.Date); //Data Sem a Hora
     dsControle.DataSet.Post;
     DM.Commit(dsControle.DataSet);
    end;
  }
  qyAgendamento.Close;

end;


procedure TfrmCadAgenda.VerificarCampos;
begin
  if DMGERAL.TB_PACIENTENM_PACIENTE.AsString = '' then
  begin

    MessageDlg('É necessário incluir o Nome do Utente!',mtInformation,
     [mbOK],0);

    pgDados.TabIndex := 1;
    framPaciente1.dxDBEdit2.SetFocus;
    Abort;
  end;

  if DMGERAL.TB_PACIENTETP_SEXO.AsString = '' then
  begin
    MessageDlg('É necessário incluir o Sexo do Utente!',mtInformation,
     [mbOK],0);

    pgDados.TabIndex := 1;
    framPaciente1.RxDBComboBox2.SetFocus;
    Abort;
  end;

  if (DMGERAL.TB_PACIENTEIDADE.AsString = '') then
  begin
{   DMGERAL.TB_PACIENTEDT_NASCIMENTO.AsDateTime := DM.GetDate;
   DMGERAL.TB_PACIENTEIDADE.AsInteger := 18;
}    MessageDlg('É necessário incluir a Idade ou Meses do Utente!',mtInformation,
     [mbOK],0);

    pgDados.TabIndex := 1;
    framPaciente1.dxDBEdit3.SetFocus;
    Abort;
  end;

  if DMGERAL.TB_PACIENTENM_MAE.AsString = '' then
  begin
//    DMGERAL.TB_PACIENTENM_MAE.AsString := 'AGENDA - SEM NOME'
    MessageDlg('É necessário incluir o Nome da Mãe do Utente!',mtInformation,
     [mbOK],0);

    pgDados.TabIndex := 1;
    framPaciente1.dxDBEdit5.SetFocus;
    Abort;
  end;

  if DMGERAL.TB_PACIENTECD_UNIDADE.AsString = '' then
  begin
    MessageDlg('É necessário incluir a Unidade Sanitária da Notificação do Utente!',mtInformation,
     [mbOK],0);

    pgDados.TabIndex := 1;
    btLocUnidade.SetFocus;
    Abort;
  end;

  if ((DMGERAL.TB_PACIENTENR_PROCESSO.AsString = '') and
      (DMGERAL.TB_PACIENTECD_UNIDADE.AsString = prmUnidade))and
      (DMGERAL.TB_PACIENTEFL_CASONOVO.AsString <> cvSim ) and
      (DMGERAL.TB_PACIENTEFL_CRIANCA_EXPOSTA.AsString <> cvSim) then
  begin
    MessageDlg('É necessário incluir o número do processo do Utente!',mtInformation,
     [mbOK],0);

    pgDados.TabIndex := 1;
    framPaciente1.dxDBEdit16.SetFocus;
    Abort;
  end;

end;

procedure TfrmCadAgenda.AbreConsultas;
begin
  DMGERAL.TB_PACIENTE.DataSource := dsControle;
  DMGERAL.TB_PACIENTE.Open;
  qyEsquema.Open;
end;

procedure TfrmCadAgenda.ConsultaPaciente;
var sWhere:string;
begin
  if (DMGERAL.TB_AGENDA.State in [dsEdit, dsInsert]) then
  begin
    try
      sWhere := 'AND';
      qyPacienteExistente.Close;
      qyPacienteExistente.SQL.Text := sPSQL;
      if (DMGERAL.TB_PACIENTENM_PACIENTE.AsString <> '') then
      begin
         qyPacienteExistente.SQL.Add(sWhere + ' Upper(NM_PACIENTE) like('''+ UpperCase(DMGERAL.TB_PACIENTENM_PACIENTE.AsString) + '%'')');
         sWhere := 'AND';
      end;

      if (DMGERAL.TB_PACIENTENM_MAE.AsString <> '') then
      begin
         qyPacienteExistente.SQL.Add(sWhere +' Upper(NM_MAE) like('''+ UpperCase(DMGERAL.TB_PACIENTENM_MAE.AsString)+ '%'')');
         sWhere := 'AND';
      end;

      if (DMGERAL.TB_PACIENTEDT_NASCIMENTO.AsString <> '') then
      begin
         qyPacienteExistente.SQL.Add(sWhere + ' DT_NASCIMENTO = :DATA');
         qyPacienteExistente.ParamByName('DATA').AsDate := DMGERAL.TB_PACIENTEDT_NASCIMENTO.AsDateTime;
         sWhere := 'AND';
      end;

      if (DMGERAL.TB_PACIENTENM_PACIENTE.AsString <> '') then
      begin
        qyPacienteExistente.Open;
        PacienteExistente;
      end;

    except
      qyPacienteExistente.close;
    end;
  end;
end;

procedure TfrmCadAgenda.CalendarioClick(Sender: TObject);
var sCONDICAO:string;
  function ListaMedicoIn:String;
  var sLista:String;
  begin
    dmGeral.TB_VINC_USUARIO_MEDICO.Close;
    dmGeral.TB_VINC_USUARIO_MEDICO.ParamByName('CD_USUARIO').AsInteger :=
      DM.qyLoginCD_USUARIO.AsInteger;
    dmGeral.TB_VINC_USUARIO_MEDICO.Open;
    while Not dmGeral.TB_VINC_USUARIO_MEDICO.Eof do
    begin
       sLista := sLista + dmGeral.TB_VINC_USUARIO_MEDICOCD_MEDICO.AsString;
       dmGeral.TB_VINC_USUARIO_MEDICO.Next;
       if Not  dmGeral.TB_VINC_USUARIO_MEDICO.Eof then
         sLista := sLista + ',';
    end;
    Result := sLista;
  end;

begin
  inherited;

  if not (DMGERAL.TB_AGENDA.State in [dsEdit, dsInsert]) then
  begin
    dmGeral.TB_AGENDA.Close;
    if gbLaboratorio then
    begin
       sCONDICAO := ListaMedicoIn;
       if (sCONDICAO <> '') then
       begin
         sCONDICAO :=  'AND  "AGENDA".CD_MEDICO IN( ' + ListaMedicoIn + ')';
         dmGeral.TB_AGENDA.SelectSQL.Text := StringReplace(sSQL,'/*MEDICO*/',
           sCONDICAO,[]);
       end;
    end;
    dmGeral.TB_AGENDA.ParamByName('DT_DE').AsDate := trunc(Calendario.Date);
    dmGeral.TB_AGENDA.ParamByName('DT_ATE').AsDate := trunc(Calendario.Date)+1;
    dmGeral.TB_AGENDA.Open;
  end;

  gDataCalendario := Calendario.Date;
end;

procedure TfrmCadAgenda.FormCreate(Sender: TObject);
var data,dtIni,dtFim:Tdate; wa,wm,wd:word; n:integer; fNome:string;
begin
  inherited;
  //SIS da Unidades nao Apresenta esta tab
  //tabExames.TabVisible :=  not(prmSGEmpresa = cvCNO);
  Calendario.Date := date;

  //Regra da data maxima no final do ano
  if (prmMaxDataAgenda <> STRING_INDEFINIDO) then
  begin
    wd := StrToInt(Copy(prmMaxDataAgenda,1,2));
    wm := StrToInt(Copy(prmMaxDataAgenda,4,2));
    wa := StrToInt(Copy(prmMaxDataAgenda,7,4));
    data := EncodeDate(wa,wm,wd);
    Calendario.MaxDate := data;
  end
  else
  begin
    n := 12-MonthOfTheYear(date);
    data := IncMonth(date,n);
    DataInicioFimMes(data,dtIni,dtFim);
    if MonthOfTheYear(date)>=10 then
    begin
      data := IncYear(dtFim,1);
      Calendario.MaxDate := data;
    end
    else
      Calendario.MaxDate := dtFim;
  end;
  //--------------------------------------

  //FbPermiteMudarPagina := False;
  FbPermiteMudarPagina := True;

  sSQLAgendamento := qyAgendamento.SQL.Text;
  sSQL := dmGeral.TB_AGENDA.SelectSQL.Text;
  sPSQL := qyPacienteExistente.SQL.Text;
  sSQLLista := qyAgenda.SQL.Text;

  dxDBEdit16.Enabled := gbLaboratorio;

  //Log
  fNome := 'c:\compware';
  if not DirectoryExists(fNome) then
    MkDir(fNome);

  fNome := fNome + '\Log';
  if not DirectoryExists(fNome) then
    MkDir(fNome);

  fNome :=  fNome + '\Digitalizacao' + FormatdateTime('ddmmyyhhnnss',now)+ '.log';
  AssignFile(fLog, fNome);
  Rewrite(fLog);
  //Fim Log
end;

procedure TfrmCadAgenda.btLocMedicoButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
begin
  inherited;
  try
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
      //Tem que ser primeiro a descricao, depois o codigo, pois o codigo
      //é usado no Change do Codigo
      dmGeral.TB_AGENDANM_MEDICO.AsString := frmLocalizar.qyDados.FieldByname('nm_medico').AsString;
      dmGeral.TB_AGENDACD_MEDICO.AsString := frmLocalizar.qyDados.FieldByname('cd_medico').AsString;
    end;
  finally
    frmLocalizar.qyDados.Close;
    FreeAndNil(frmLocalizar);
  end;
end;

procedure TfrmCadAgenda.btLocMedicoChange(Sender: TObject);
begin
  inherited;
  if DMGERAL.TB_AGENDA.State in [dsEdit, dsInsert] then
  begin
    if btLocMedico.Text = ''  then
      DMGERAL.TB_AGENDANM_MEDICO.Clear
    else if btLocMedico.Modified then
    begin
      try
        DMGERAL.TB_AGENDANM_MEDICO.AsString := PegaValor('NM_MEDICO','MEDICO',['CD_MEDICO'],
          [btLocMedico.Text],nil);
      except
        DMGERAL.TB_AGENDANM_MEDICO.Clear;
      end;
    end;
  end;
end;


procedure TfrmCadAgenda.btIncluirClick(Sender: TObject);
begin


  if (DayOfTheWeek(Calendario.Date) in [6,7]) and (prmAgendaSabDom=cvSim) then
  begin
    ShowMessage('Não pode ser realizado agendamento no ' + FormatDateTime('dddd',Calendario.Date) + '!');
    Calendario.Date := gDataCalendario;
    Exit;
  end;

  SetNavegaAgenda(false);
  inherited;

  pgGeral.ActivePage := tabGeral;
  if FbPermiteMudarPagina then
    pgDados.ActivePageIndex := 1;

  if not (framPaciente1.dsPaciente.DataSet.State in [dsEdit, dsInsert]) then
  begin
    dm.Transacao(framPaciente1.dsPaciente.DataSet);
    framPaciente1.dsPaciente.DataSet.Insert;
    DMGERAL.TB_PACIENTEFL_RESULTADO.AsInteger := 1;
    strConsulta := 'nome';
    AtualizaExames;
  end;

  Calendario.Enabled := false;
  DMGERAL.TB_AGENDANM_MEDICO.Clear;
  btLocMedico.SetFocus;

  //Versao das Unidades usa Medico Padrao
  //if gbLaboratorio then
  begin
    DMGERAL.TB_AGENDACD_MEDICO.AsString := prmMedicoPadraoAgenda;
    keybd_event(VK_TAB,0,0,0);
  end;


end;

procedure TfrmCadAgenda.dsControleStateChange(Sender: TObject);
begin
  inherited;
  btLocMedico.Enabled := dsControle.State in [dsEdit, dsInsert];
  btLocUnidade.Enabled := (dsControle.State in [dsEdit, dsInsert]);
  btGerarNovoProcesso.Enabled := (dsControle.State in [dsEdit, dsInsert]);

{  if DMGERAL.TB_PACIENTECD_UND.AsInteger = 12 then
    btLocUnidade.Enabled := FALSE and (dsControle.State in [dsEdit, dsInsert]);
}

  btexcluir.Enabled := (pgDados.ActivePageIndex in [0, 1]) and not(dsControle.State in [dsEdit, dsInsert]);
  bteditar.Enabled := (pgDados.ActivePageIndex in [0, 1]) and not(dsControle.State in [dsEdit, dsInsert]);

end;

procedure TfrmCadAgenda.FormShow(Sender: TObject);
begin
  FbPermiteMudarPagina := false;
  inherited;
  FbPermiteMudarPagina := true;
  nPagina := 1;
  strSQL := qyAgenda.SQL.Text;
  pgGeral.ActivePage := tabGeral;
  pgDados.ActivePage := tblista;
  AbreConsultas;
  framPaciente1.AbreConsultas;
  CalendarioClick(Sender);
  dmGeral.tb_Requisicao.DataSource := dsControle;
  dmGeral.tb_Requisicao.Open;
  AtualizaExames;
end;

procedure TfrmCadAgenda.btgravarClick(Sender: TObject);
var i : integer;
begin
  if DMGERAL.TB_AGENDACD_MEDICO.AsInteger <= 0 then
  begin
    MessageDlg('É necessário incluir o Médico!',mtInformation,
     [mbOK],0);

    pgGeral.TabIndex := 1;
    pgDados.TabIndex := 1;
    btLocMedico.SetFocus;
    abort;
  end;

  if VerificarNrProcesso = 1  then
    abort;

  VerificarCampos;

  // verifica se paciente esta em estado de abandono
  if VerificaUtenteAbandono(DMGERAL.TB_PACIENTECD_PACIENTE.AsInteger) then
  begin
    ShowMessage('Este paciente esta em abandono, antes de inclui-lo no mapa é preciso mudar o status para ACTIVO!');
    frmConsAbandono := TfrmConsAbandono.Create(Application);
    frmConsAbandono.procuraCD_PACIENTE :=  DMGERAL.TB_PACIENTECD_PACIENTE.AsInteger;
    frmConsAbandono.ShowModal;

    Abort;
  end;

  if not gbLaboratorio then
    VerificarPacientesAgendados;

  if (DMGERAL.TB_AGENDADS_ESQUEMA.AsString <> '') then
    DMGERAL.TB_AGENDAFL_REALIZADO.AsInteger :=  1;

  //LH - 06/12/2012 - Por Padrao FL_ESQUEMA = 1, esta marcando realizado indevidamente
  //if (DMGERAL.TB_AGENDAFL_ESQUEMA.AsInteger = 1) then
  //  DMGERAL.TB_AGENDAFL_REALIZADO.AsInteger :=  1;

  if (DMGERAL.TB_AGENDAVL_CD4.AsInteger >= 1) then
    DMGERAL.TB_AGENDAFL_REALIZADO.AsInteger :=  1;


  if (DMGERAL.TB_AGENDADT_REMARCACAO.AsString <> '') then
    DMGERAL.TB_AGENDAFL_REMARCADO.AsInteger :=  1;

  DMGERAL.TB_AGENDACD_PACIENTE.AsInteger := DMGERAL.TB_PACIENTECD_PACIENTE.AsInteger;
  DMGERAL.TB_AGENDANM_PACIENTE.AsString  := DMGERAL.TB_PACIENTENM_PACIENTE.AsString;
  DMGERAL.TB_AGENDANR_PROCESSO.AsInteger := DMGERAL.TB_PACIENTENR_PROCESSO.AsInteger;
  DMGERAL.TB_AGENDATP_SEXO.AsString := DMGERAL.TB_PACIENTETP_SEXO.AsString;
  DMGERAL.TB_AGENDAIDADE.AsInteger := DMGERAL.TB_PACIENTEIDADE.AsInteger;


  if (dmGeral.TB_PACIENTE.State in [dsEdit, dsInsert]) then
    dmGeral.TB_PACIENTEFL_NOTIFICACAO.AsInteger := 1;

  if (dmGeral.TB_AGENDA.State in [dsEdit, dsInsert]) then
  begin
    dmGeral.TB_AGENDADT_AGENDA.AsDateTime := Trunc(Calendario.Date); //Data Sem a Hora

    VerificarAgendamento('R');

    if not Existe(dmGeral.TB_AGENDACD_MEDICO.AsInteger,prmLstNaoTransfAgenda) then
       VerificarAgendamento('T');
  end;

  if (dmGeral.TB_PACIENTE.State in [dsEdit, dsInsert]) then
  begin
   dsControle.DataSet.Post;
   DM.Commit(dsControle.DataSet);
  end;

  try
    //Aqui necessita iniciar a transação porque no inherited ocorre o post e consequenteo commit
    dm.Transacao(dsControle.DataSet);
    // deleta todas os aspectos da Agenda
    with TIBQuery.Create(nil) do
    begin
      Database := DM.DB;
      sql.Add('delete from EXAMES_AGENDA');
      sql.Add('where CD_AGENDA = '''+IntToStr(DMGERAL.TB_AGENDACD_AGENDA.AsInteger)+'''');
      ExecSQL;
      close;
      free;
    end;

    // inclui as que estiverem marcadas nos checkboxs
    for i:=0 to (ComponentCount - 1) do
      if (Components[i] is TCheckBox) then
        if (Components[i] as TCheckBox).Checked then
        begin
          qyExamesAgenda.close;
          qyExamesAgenda.SQL.Clear;
          qyExamesAgenda.SQL.Add('insert into EXAMES_AGENDA (CD_EXAMES,' +
                           'CD_AGENDA, CD_UND)');
          qyExamesAgenda.SQL.Add('values(' + IntToStr((Components[i] as TCheckBox).tag) +
                                 ','''+IntToStr(DMGERAL.TB_AGENDACD_AGENDA.asInteger)+'''' + ','''+prmUnidade+''')');
          qyExamesAgenda.ExecSQL;
        end;
    dm.Commit(DMGERAL.TB_AGENDA);
  except
    on Err:Exception do
      ShowMessage(Err.message);
    {
    showmessage('Tag: ' + IntToStr((Components[e] as TCheckBox).tag) +
                '    Hint: ' + (Components[e] as TCheckBox).Hint);   }
  end;
  AtualizaExames;

  {Leandro - 16/07/2012 - Nao deve relizar mudar pagina para nao consultar lista novamente}
  FbPermiteMudarPagina := False;
  InicializaControles;
  FbPermiteMudarPagina := True;

  Calendario.Enabled := true;
  grAgenda.FullExpand;
  SetNavegaAgenda(true);
  pgGeral.ActivePage := tabGeral;
  pgDados.TabIndex := 0;
  if FbPermiteMudarPagina then
    pgDados.ActivePageIndex := 0;

  AtualizaLista;
end;

procedure TfrmCadAgenda.pgGeralChange(Sender: TObject);
begin
  inherited;
  btexcluir.Enabled := (pgGeral.ActivePage = tabGeral) and not(dsControle.State in [dsEdit, dsInsert]);
  bteditar.Enabled := (pgGeral.ActivePage = tabGeral) and not(dsControle.State in [dsEdit, dsInsert]);
end;

procedure TfrmCadAgenda.bteditarClick(Sender: TObject);
begin
  SetNavegaAgenda(false);
  pgGeral.ActivePage := tabGeral;
  AtualizaLista;
  if FbPermiteMudarPagina then
    if pgDados.ActivePageIndex <> 4 then
      pgDados.ActivePageIndex := 1;

  inherited;
  if not (framPaciente1.dsPaciente.DataSet.State in [dsEdit, dsInsert]) then
    begin
      dm.Transacao(framPaciente1.dsPaciente.DataSet);
      framPaciente1.dsPaciente.DataSet.Edit;
    end;

  if DMGERAL.TB_PACIENTECD_UNIDADE.AsString = prmUnidade then
    btLocUnidade.Enabled := false;

  Calendario.Enabled := false;
  AtualizaExames;
end;

procedure TfrmCadAgenda.btCancelarClick(Sender: TObject);
begin
  if (framPaciente1.dsPaciente.DataSet.State in [dsEdit, dsInsert]) then
    begin
      dm.Transacao(framPaciente1.dsPaciente.DataSet);
      framPaciente1.dsPaciente.DataSet.Cancel;
    end;

  inherited;
  AtualizaExames;
  Calendario.Enabled := true;
  SetNavegaAgenda(true);
  pgGeral.ActivePage := tabGeral;
  pgDados.TabIndex := 0;
  AtualizaLista;
  if FbPermiteMudarPagina then
    pgDados.ActivePageIndex := 0;

end;

procedure TfrmCadAgenda.btexcluirClick(Sender: TObject);
begin
  inherited;
  Calendario.Enabled := true;
  SetNavegaAgenda(true);
  if FbPermiteMudarPagina then
    pgDados.ActivePageIndex := 0;

  AtualizaLista;
  AtualizaExames;
end;

procedure TfrmCadAgenda.btPesquisarClick(Sender: TObject);
begin
  inherited;
  bFiltro := not bFiltro;
  if bFiltro then
  begin
    sbPadrao.Panels[0].Text := 'Filtro Ativado!';
    qyAgenda.SQL.Text := sSQLLista;
    frmLocAgendamento := TfrmLocAgendamento.Create(self);
    frmLocAgendamento.ShowModal;
    frmLocAgendamento.Free;
    pgGeral.ActivePageIndex := 0;
    pgGeralChange(sender);
  end
  else
  begin
    sbPadrao.Panels[0].Text := '';
    tabListaShow(sender);
  end;
end;

procedure TfrmCadAgenda.tabListaShow(Sender: TObject);
var chave:integer;
begin
  inherited;
  if not (DMGERAL.TB_AGENDA.State in [dsEdit, dsInsert]) and
    not bFiltro then
  begin
    chave := DMGERAL.TB_AGENDACD_AGENDA.AsInteger;
    qyAgenda.Close;
    qyAgenda.Sql.Text := sSQLLista;
    qyAgenda.SQL.Add(' AND AGENDA.DT_AGENDA between :de and :ate');
    qyAgenda.ParamByName('de').AsDateTime := dm.GetDate;
    qyAgenda.ParamByName('ate').AsDateTime := dm.GetDate;
    qyAgenda.Open;
    qyAgenda.Locate('CD_AGENDA', chave, []);
  end;
end;

procedure TfrmCadAgenda.btLocMedicoExit(Sender: TObject);
var bNaoAtende:Boolean; nTotal:Integer;
//bValida:Boolean
begin
  inherited;
  if DMGERAL.TB_AGENDA.State in [dsEdit,dsInsert] then
  begin
    if btLocMedico.Text <> '' then
    begin
      try
        bNaoAtende := False;
        //bValida := False;

        if ValidaImpedimentoAtivo(btLocMedico.Text) then
        begin
           MessageDlg('Este médico NÃO ESTA ATIVO nesta data!',
           mtInformation,[mbOk], 0);
           bNaoAtende:=True;
        end;

        if ValidaImpedimento(btLocMedico.Text) then
        begin
           MessageDlg('Este médico NÃO ATENDE nesta data!',
           mtInformation,[mbOk], 0);
           bNaoAtende:=True;
        end;

        if ValidaImpedimentoTriagem(btLocMedico.Text) then
        begin
           MessageDlg('Este médico atende apenas na TRIAGEM nesta data!',
           mtInformation,[mbOk], 0);
           bNaoAtende := True;
        end;

        if not bNaoAtende and ValidaTotalDia(btLocMedico.Text, nTotal) and
          not gbLiberaQtdeAgenda then
        begin
           MessageDlg('Este médico já está com '+intTostr(nTotal)+ ' ATENDIMENTOS nesta data!',
           mtInformation,[mbOk], 0);
           if prmMaxAtendAgenda = cvSim then
             bNaoAtende := True;
        end;

        if bNaoAtende then
        begin
           DMGERAL.TB_AGENDACD_MEDICO.Clear;
           DMGERAL.TB_AGENDANM_MEDICO.Clear;
           Exit;
        end;

        DMGERAL.TB_AGENDANM_MEDICO.AsString := PegaValor('NM_MEDICO','MEDICO',['CD_MEDICO'],
          [btLocMedico.Text],nil);

      except
        begin
          MessageDlg('Medico não encontrado!',mtWarning,[mbOK],0);
          DMGERAL.TB_AGENDANM_MEDICO.Clear;
          DMGERAL.TB_AGENDACD_MEDICO.Clear;
        end;
      end;
    end;
  end;

end;

procedure TfrmCadAgenda.grDadosDblClick(Sender: TObject);
begin
  inherited;
  Calendario.date := qyAgendaDT_AGENDA.AsDateTime;
  CalendarioClick(Sender);
  btLocMedico.Text := qyAgendaCD_MEDICO.AsString;
  edMedico.Text := qyAgendaNM_MEDICO.AsString;
  DMGERAL.TB_AGENDA.Locate('cd_agenda', qyAgendaCD_AGENDA.AsInteger, []);
  AtualizaExames;
end;

procedure TfrmCadAgenda.SetNavegaAgenda(bNavega: boolean);
begin
  //Nao permite navegar se esta em modo de Edicao/Insercao
  if bNavega then
    grAgenda.OptionsDB := grAgenda.OptionsDB + [edgoCanNavigation]
  else
    grAgenda.OptionsDB := grAgenda.OptionsDB - [edgoCanNavigation];
end;

procedure TfrmCadAgenda.qyAgendaCalcFields(DataSet: TDataSet);
begin
  inherited;
{  case qyAgendaTP_ESQUEMA.AsInteger of
    1:qyAgendaDS_ESQUEMA.AsString := 'AZT + 3TC + NVP';
    2:qyAgendaDS_ESQUEMA.AsString := 'D4T + 3TC + NVP';
    3:qyAgendaDS_ESQUEMA.AsString := 'AZT + 3TC + EFV';
    4:qyAgendaDS_ESQUEMA.AsString := 'D4T + 3TC + EFV';
    5:qyAgendaDS_ESQUEMA.AsString := 'AZT + 3TC + IDV';
  end;
{
  case qyAgendaFL_REALIZADO.AsInteger of
    0:qyAgendaDS_REALIZADO.AsString := 'NÃO';
    1:qyAgendaDS_REALIZADO.AsString := 'SIM';
  end;

  case qyAgendaFL_REMARCADO.AsInteger of
    0:qyAgendaDS_RECARCADO.AsString := 'NÃO';
    1:qyAgendaDS_RECARCADO.AsString := 'SIM';
  end;
}
end;

procedure TfrmCadAgenda.framPaciente1dxDBEdit2Exit(Sender: TObject);
begin
  inherited;
  if DMGERAL.TB_AGENDA.State in [dsEdit, dsInsert] then
  begin
    ConsultaPaciente;
  end;
end;

procedure TfrmCadAgenda.framPaciente1dxDBEdit5Exit(Sender: TObject);
begin
  inherited;
  if DMGERAL.TB_AGENDA.State in [dsEdit, dsInsert] then
  begin
    ConsultaPaciente;
  end;
end;

procedure TfrmCadAgenda.framPaciente1DBDateEdit3Exit(Sender: TObject);
begin
  inherited;
  if DMGERAL.TB_AGENDA.State in [dsEdit, dsInsert] then
  begin
    framPaciente1.DBDateEdit3Exit(Sender);
    ConsultaPaciente;
  end;
end;

procedure TfrmCadAgenda.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  framPaciente1.FechaConsultas;
  ApagaArquivoTemporario;
  dmGeral.TB_AGENDA.SelectSQL.Text := sSQL;
  qyAgenda.SQL.Text := sSQLLista;
  dmGeral.tb_Requisicao.Close;
  dmGeral.tb_Requisicao.DataSource := nil;
end;

procedure TfrmCadAgenda.btLocUnidadeButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
begin
  inherited;
    if (dsControle.DataSet.State in [dsEdit, dsInsert]) then
    begin
      if not Assigned(frmLocalizar) then
        frmLocalizar := TfrmLocalizar.Create(application);
      try
        frmLocalizar.Caption := 'Localizar Unidade';
        frmLocalizar.qyDados := SelectDadosUnidade;

        try
          frmLocalizar.Where := false;
          SetLength(VCampo,2);
          frmLocalizar.KeyField := 'cd_unidade';
          VCampo[0].Titulo  := 'Unidade';
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
          dmGeral.TB_PACIENTEDS_UNIDADE.AsString := frmLocalizar.qyDados.FieldByname('ds_unidade').AsString;
          dmGeral.TB_PACIENTECD_UNIDADE.AsInteger := frmLocalizar.qyDados.FieldByname('cd_unidade').AsInteger;
        end;
      finally
        frmLocalizar.qyDados.Close;
        FreeAndNil(frmLocalizar);
      end;
     end;
end;

procedure TfrmCadAgenda.btLocUnidadeChange(Sender: TObject);
begin
  inherited;
  if btLocUnidade.Text = '' then
    dmGeral.TB_PACIENTEDS_UNIDADE.Clear
  else if btLocUnidade.Modified then
  begin
    try
      dmGeral.TB_PACIENTEDS_UNIDADE.AsString :=
        PegaValor('DS_UNIDADE','UNIDADE',['CD_UNIDADE'],
        [btLocUnidade.Text],nil);
    except
      begin
        dmGeral.TB_PACIENTEDS_UNIDADE.Clear;
      end;
    end;
  end;

end;

procedure TfrmCadAgenda.btLocUnidadeExit(Sender: TObject);
begin
  inherited;
  if (dsControle.DataSet.State in [dsEdit, dsInsert]) then
  begin
    if btLocUnidade.Text <> '' then
    begin
      try
        dmGeral.TB_PACIENTEDS_UNIDADE.AsString :=
          PegaValor('DS_UNIDADE','UNIDADE',['CD_UNIDADE'],
          [btLocUnidade.Text],nil);
      except
        begin
          MessageDlg('Unidade não encontrada!',mtWarning,[mbOK],0);
          dmGeral.TB_PACIENTECD_UNIDADE.Clear;
          dmGeral.TB_PACIENTEDS_UNIDADE.Clear;
        end;
      end;
    end;

  end;

end;

procedure TfrmCadAgenda.btimprimirClick(Sender: TObject);
begin
  pgGeral.TabIndex := 0;
  inherited;

end;

procedure TfrmCadAgenda.dxDBButtonEdit1ButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
begin
  inherited;
  if not Assigned(frmLocalizar) then
    frmLocalizar := TfrmLocalizar.Create(application);
  try
    frmLocalizar.Caption := 'Localizar Esquema';
    frmLocalizar.qyDados := SelectDadosEsquema;

    try
      frmLocalizar.Where := false;
      SetLength(VCampo,7);
      frmLocalizar.KeyField := 'cd_esquema';
      VCampo[0].Titulo  := 'Cód.';
      VCampo[0].Width := 5;
      VCampo[1].Titulo  := 'Tipo';
      VCampo[1].Width := 5;
      VCampo[2].Titulo  := 'Esquema';
      VCampo[2].Width := 30;

      VCampo[0].Visivel := True;
      VCampo[1].Visivel := True;
      VCampo[2].Visivel := True;
    except
      ShowMessage(frmLocalizar.qyDados.Sql.Text);
    end;
    if frmLocalizar.ShowModal=mrok then
    begin
      dmGeral.TB_AGENDATP_ESQUEMA.AsString := frmLocalizar.qyDados.FieldByname('tp_esquema').AsString;
      dmGeral.TB_AGENDADS_ESQUEMA.AsString := frmLocalizar.qyDados.FieldByname('ds_esquema').AsString;
    end;
  finally
    frmLocalizar.qyDados.Close;
    FreeAndNil(frmLocalizar);
  end;
end;


procedure TfrmCadAgenda.qyAgendamentoBeforeOpen(DataSet: TDataSet);
var
  data:TDate;
begin
  inherited;
  data := trunc(Calendario.Date);
  qyAgendamento.ParamByName('PACIENTE').AsInteger := DMGERAL.TB_PACIENTECD_PACIENTE.AsInteger;
  qyAgendamento.ParamByName('DATA').AsString := DateToStr(data);
end;

procedure TfrmCadAgenda.grAgendaDblClick(Sender: TObject);
begin
  pgDados.ActivePage := tbagendamento;
end;

procedure TfrmCadAgenda.pgDadosChange(Sender: TObject);
begin
  inherited;

  btexcluir.Enabled := (pgDados.ActivePageIndex in [0, 1, 4]) and not(dsControle.State in [dsEdit, dsInsert]);
  bteditar.Enabled := (pgDados.ActivePageIndex in [0, 1, 4]) and not(dsControle.State in [dsEdit, dsInsert]);

  //Este Full Collapse - Este movendo registro, fazendo com que na nova aba tenha referencia errada.
  //grAgenda.FullCollapse;

  if pgDados.ActivePageIndex = 1 then
    FocoControle;

  if pgDados.ActivePageIndex = 2 then
  begin
    if not qyMedico.Active then qyMedico.Open;
    gdata := dm.GetDate;
    Mes;
  end;

  if pgDados.ActivePageIndex = 3 then
    Mapa;
end;

procedure TfrmCadAgenda.pgDadosChanging(Sender: TObject;
  var AllowChange: Boolean);
begin
  inherited;
  //if pgDados.ActivePageIndex in [1,4] then
  //   AllowChange := not(dsControle.DataSet.State in dsEditModes);

end;

procedure TfrmCadAgenda.framPaciente1dxDBEdit3Exit(Sender: TObject);
begin
  inherited;
  framPaciente1.dxDBEdit3Exit(Sender);

end;

procedure TfrmCadAgenda.framPaciente1SpeedButton2Click(Sender: TObject);
begin
  inherited;
  framPaciente1.SpeedButton2Click(Sender);

end;

procedure TfrmCadAgenda.framPaciente1dxDBEdit16Exit(Sender: TObject);
begin
  inherited;
  if (DMGERAL.TB_AGENDA.State in [dsEdit, dsInsert]) then
  begin
    try
      qyPacienteExistente.Close;
      qyPacienteExistente.SQL.Text := sPSQL;
      if (DMGERAL.TB_PACIENTENR_PROCESSO.AsInteger <> null) then
      begin
         qyPacienteExistente.SQL.Add('and NR_PROCESSO =:processo');
         qyPacienteExistente.ParamByName('processo').AsInteger :=
            DMGERAL.TB_PACIENTENR_PROCESSO.AsInteger;

      end;
      qyPacienteExistente.Open;
      PacienteExistente;
    except
      qyPacienteExistente.close;
    end;
  end;
end;

procedure TfrmCadAgenda.btfecharClick(Sender: TObject);
begin
  if (DMGERAL.TB_AGENDA.State in [dsEdit, dsInsert]) then
  begin
    {if MessageDlg('Existe um cadastro em edição, deseja cancelar?',
         mtConfirmation, [mbNo, mbYes], 0) = mrYes then
      begin
        dm.Transacao(framPaciente1.dsPaciente.DataSet);
        framPaciente1.dsPaciente.DataSet.Cancel;
      end
      else
        abort;}
    MessageDlg('Salvamento Automático da Agenda!',
         mtInformation, [mbOk], 0);
    btgravarClick(Sender);
  end;

  inherited;

end;

procedure TfrmCadAgenda.Mes;
var dtIni,dtFim:Tdate;
    wano, wmes, wdia:Word;
    aCol, aRow:Integer;
begin

  Label8.Caption := FormatDateTime('mmm yyyy',gdata);

  for aCol := 0 to 6 do
    sgCalendario.Cols[aCol].Clear;

  sgCalendario.Cells[0,0] := 'Dom';
  sgCalendario.Cells[1,0] := 'Seg';
  sgCalendario.Cells[2,0] := 'Ter';
  sgCalendario.Cells[3,0] := 'Qua';
  sgCalendario.Cells[4,0] := 'Qui';
  sgCalendario.Cells[5,0] := 'Sex';
  sgCalendario.Cells[6,0] := 'Sab';

  DataInicioFimMes(gData,dtIni,dtFim);
  gdtIni := dtIni;
  gdtFim := dtFim;

  aCol := 0;
  aRow := 1;
  while dtIni <= dtfim do
  begin
    DecodeDate(dtIni,wano,wmes,wdia);
    aCol := DayOfTheWeek(dtIni);
    if aCol = 7 then
    begin
      aCol := 0;
      inc(aRow);
    end;
    sgCalendario.Cells[aCol,aRow] := intToStr(wdia);
    dtIni := dtIni + 1;
  end;
end;

procedure TfrmCadAgenda.sgCalendarioDrawCell(Sender: TObject; ACol,
  ARow: Integer; Rect: TRect; State: TGridDrawState);
var
 Conteudo : string;
 R : TRect;
 //cPag, cRec:TColor;
 nTipo:Integer;
begin
  Canvas.Font.Style := [fsBold];
  Canvas.Brush.Color := clWindow;
  if aRow > 0 then
  with sgCalendario do
  begin
      Conteudo := Cells[ACol, ARow];
      R := Rect;
      bIndisponivel := false;
      ValidaDia(Conteudo,bIndisponivel,nTipo,nTotal);
      bVaga := nTotal<16;
      case nTipo of
        1: Canvas.Font.Color := clYellow;
        2: Canvas.Font.Color := clBlue;
        3: Canvas.Font.Color := clAqua;
        5: Canvas.Font.Color := clFuchsia;
      end;
      if bIndisponivel then
      begin
          Canvas.Brush.Color := $00A6A6A6;
          Canvas.TextRect(R, (R.Left + (Rect.Right - Rect.Left) div 2 - Canvas.TextWidth(Conteudo) div 2) - 1,
          R.Top + 3, Conteudo);

          Canvas.Brush.Color := $00A6A6A6;
          R.Right := R.Left + (Rect.Right - Rect.Left) div 2;
          Canvas.TextRect(R, (R.Left + (Rect.Right - Rect.Left) div 2 - Canvas.TextWidth(Conteudo) div 2) - 1,
          R.Top + 3, Conteudo);
      end
      else if not bVaga then
      begin
          Canvas.Brush.Color := $008080FF;
          Canvas.TextRect(R, (R.Left + (Rect.Right - Rect.Left) div 2 - Canvas.TextWidth(Conteudo) div 2) - 1,
          R.Top + 3, Conteudo);

          Canvas.Brush.Color := $008080FF;
          R.Right := R.Left + (Rect.Right - Rect.Left) div 2;
          Canvas.TextRect(R, (R.Left + (Rect.Right - Rect.Left) div 2 - Canvas.TextWidth(Conteudo) div 2) - 1,
          R.Top + 3, Conteudo);
      end
      else if Conteudo <> '' then
      begin
          Canvas.Brush.Color := $008DCC2F;
          Canvas.TextRect(R, (R.Left + (Rect.Right - Rect.Left) div 2 - Canvas.TextWidth(Conteudo) div 2) - 1,
          R.Top + 3, Conteudo);

          Canvas.Brush.Color := $008DCC2F;
          R.Right := R.Left + (Rect.Right - Rect.Left) div 2;
          Canvas.TextRect(R, (R.Left + (Rect.Right - Rect.Left) div 2 - Canvas.TextWidth(Conteudo) div 2) - 1,
          R.Top + 3, Conteudo);
      end;
  end;
end;


procedure TfrmCadAgenda.ConsultaMes(dtIni, dtFim: Tdate);
begin

end;

function TfrmCadAgenda.DataDaCelula(sDia: String): tdate;
var lwdia:word;
begin
  try
    lwdia := StrToInt(sDia);
    DecodeDate(gdata,gwano,gwmes,gwdia);
    sdata := EncodeDate(gwano,gwmes,lwdia);
    //Calendario.Date := gData;
    {TODO: Leandro 16/07/2012 - Porque ativar calendario? Esta disparando consulta!}
    //CalendarioClick(Self);
  except
    sdata := 0;
  end;
  result := sdata;
end;

procedure TfrmCadAgenda.ConsultaContasDia(pdata: Tdate);
begin
  {qyTitulos.Close;
  qyTitulos.ParamByName('data').asdate := pdata;
  qyTitulos.open;}
end;

procedure TfrmCadAgenda.ValidaDia(sDia: String; var bIndisponivel: Boolean; var nTipo,nTotal:integer);
var  data:Tdate; Manha,Tarde: boolean;
begin
   try
     if sDia = '' then Exit;
     data := DataDaCelula(sDia);
     bIndisponivel := DayOfTheWeek(data) in [6,7];

     if not qyAtendimento.Active then qyAtendimento.Open;
     if qyAtendimento.Locate('DT_ATENDIMENTO', data,[]) then
     begin

       nTipo := qyAtendimento.FieldByName('TP_PERIODO').AsInteger;
       bIndisponivel := nTipo = 4;
       if not qyAtendimento.Eof then
       begin
          Manha := false;
          Tarde := false;
          if qyAtendimento.Locate('DT_ATENDIMENTO;tp_periodo',
            VarArrayOf([data,'1']), []) then
            manha := true;

          if qyAtendimento.Locate('DT_ATENDIMENTO;tp_periodo',
            VarArrayOf([data,'2']), []) then
            tarde := true;

          if manha and tarde then
          begin
            nTipo := 5
          end;
       end;
     end;
     {qyTotalDia.Close;
     qyTotalDia.ParamByName('DATA').AsDate := data;
     qyTotalDia.ParamByName('CD_MEDICO').AsInteger :=
       qyMedico.FieldByName('CD_MEDICO').AsInteger;
     qyTotalDia.Open;}
     //nTotal := 0;
     //if qyTotalDia.Locate('DT_AGENDA',data,[]) then
     //  nTotal := qyTotalDia.FieldByName('CNT').AsInteger;
     nTotal := RetornaTotalDia(data);

   except
   end;
end;


procedure TfrmCadAgenda.Mapa(pnPagina:integer);
var s:TStrings;
    //cab:TStrings;
    sTipo,sAux:string;
    //sdata:string;
    p,pi,pf,i,x:integer;  bk:TBookmark;
begin
  s := TStringList.Create;
  try
    ApagaArquivoTemporario;
    //Abre modelo mapa
    s.LoadFromFile(sPathConsulta+'Modelo Mapa.html');
    sNome := sPathConsulta+'mapa'+FormatDateTime('ddmmyyyyhhnnss',Now)+'.html';
    sAux := RPad(dmGeral.TB_AGENDANM_MEDICO.AsString,'_',35);
    sAux := RPad(sAux,' ',60);
    s.Text := StringReplace(s.Text,'Medico', sAux , []);
    x := dmGeral.TB_AGENDACD_MEDICO.AsInteger;
    bk := dmGeral.TB_AGENDA.GetBookmark;
    //if pnPagina = 1 then
      dsControle.DataSet.First;
    i:=0; p:=0;
    pf := pnPagina * 20;
    pi := (pf - 20)+1;
    {TODO:Usar Filtro para Medico ao inves desta estrutura....}
    while not dsControle.DataSet.Eof do
    begin
      if (x = dmGeral.TB_AGENDACD_MEDICO.AsInteger) then
       inc(p);
      if (x = dmGeral.TB_AGENDACD_MEDICO.AsInteger) and
         (p>=pi)and(pi<=pf)then
      begin
        inc(i);
        sTipo := 'F';
        if dmGeral.TB_AGENDAFL_DIGITAL.AsInteger = cvFlSim  then
          sTipo:= 'D';
        s.Text := StringReplace(s.Text,'Num'+inttostr(i), inttostr(p),[]);
        s.Text := StringReplace(s.Text,'Proc'+inttostr(i),
         sTipo+dsControle.DataSet.FieldByName('NR_PROCESSO').AsString ,[]);
        s.Text := StringReplace(s.Text,'Muni'+inttostr(i),
         dsControle.DataSet.FieldByName('DS_PROVINCIA').AsString+ ' ' +
         dsControle.DataSet.FieldByName('DS_MUNICIPIO').AsString,[]);
        s.Text := StringReplace(s.Text,'Paci'+inttostr(i),
         dsControle.DataSet.FieldByName('NM_PACIENTE').AsString,[]);
        s.Text := StringReplace(s.Text,'Sexo'+inttostr(i),
         dsControle.DataSet.FieldByName('TP_SEXO').AsString,[]);
        s.Text := StringReplace(s.Text,'Idade'+inttostr(i),
         dsControle.DataSet.FieldByName('IDADE').AsString,[]);
        if i=20 then Break;
      end;
       dsControle.DataSet.Next;
    end;
    dmGeral.TB_AGENDA.GotoBookmark(bk);
    //Limpa os campos restantes
    for x:=i to 20 do
    begin
      inc(i);
      s.Text := StringReplace(s.Text,'Num'+inttostr(i),'',[]);
      s.Text := StringReplace(s.Text,'Proc'+inttostr(i),'',[]);
      s.Text := StringReplace(s.Text,'Muni'+inttostr(i),'',[]);
      s.Text := StringReplace(s.Text,'Paci'+inttostr(i),'',[]);
      s.Text := StringReplace(s.Text,'Sexo'+inttostr(i),'',[]);
      s.Text := StringReplace(s.Text,'Idade'+inttostr(i),'',[]);
    end;
    //Data Agenda
    s.Text := StringReplace(s.Text,'DataDaAgenda', dsControle.DataSet.FieldByName('DT_AGENDA').AsString,[]);

    s.SaveToFile(sNome);
    wbMapa.Navigate(sNome);
  except
    FreeAndNil(s);
  end;
end;

procedure TfrmCadAgenda.ApagaArquivoTemporario;
begin
  if FileExists(sNome) then
    DeleteFile(sNome);
end;

procedure TfrmCadAgenda.BitBtn1Click(Sender: TObject);
begin
  inherited;
  Mapa(nPagina);
  WB_ShowPrintPreview(wbMapa);
end;

procedure TfrmCadAgenda.DBListBox1Click(Sender: TObject);
begin
  inherited;
  AtualizaMes;
end;

procedure TfrmCadAgenda.SpeedButton2Click(Sender: TObject);
begin
  inherited;
  gdata := IncMonth(gData,1);
  Mes;
  AtualizaMes;
  DBLookupListBox1.SetFocus;
end;

procedure TfrmCadAgenda.SpeedButton1Click(Sender: TObject);
begin
  inherited;
  gdata := IncMonth(gData,-1);
  Mes;
  AtualizaMes;
  DBLookupListBox1.SetFocus;
end;

procedure TfrmCadAgenda.AtualizaMes;
var id:integer;
begin
  qyAtendimento.Close;
  qyAtendimento.Open;
  qyTotalDia.Close;
  qyTotalDia.Open;

  qyTotalDia.Last;
  SetLength(vAgenda,0);
  SetLength(vAgenda, qyTotalDia.RecordCount);

  id := 0;
  qyTotalDia.First;
  while not qyTotalDia.Eof do
  begin
   vAgenda[id].cd_medico := qyTotalDia.FieldByName('cd_medico').asInteger;
   vAgenda[id].cnt := qyTotalDia.FieldByName('cnt').asInteger;
   vAgenda[id].dt_agenda := qyTotalDia.FieldByName('dt_agenda').AsDateTime;
   inc(id);
   qyTotalDia.Next;
  end;
  sgCalendario.Repaint;
end;

procedure TfrmCadAgenda.qyAtendimentoBeforeOpen(DataSet: TDataSet);
var dtIni, dtFim:TDate;
begin
  inherited;
  //DataInicioFimMes(gDataCalendario, dtIni, dtFim);
  DataInicioFimMes(gData, dtIni, dtFim);
  qyAtendimento.ParamByName('CD_MEDICO').AsInteger := qyMedico.FieldByName('CD_MEDICO').AsInteger;
  qyAtendimento.ParamByName('ATE').AsDate := dtFim;
  qyAtendimento.ParamByName('DE').AsDate := dtIni;
end;

procedure TfrmCadAgenda.qyTotalDiaBeforeOpen(DataSet: TDataSet);
var dtIni, dtFim:TDate;
begin
  inherited;
  //DataInicioFimMes(gDataCalendario, dtIni, dtFim);
  DataInicioFimMes(gData, dtIni, dtFim);
  qyTotalDia.ParamByName('CD_MEDICO').AsInteger := qyMedico.FieldByName('CD_MEDICO').AsInteger;
  qyTotalDia.ParamByName('ATE').AsDate := dtFim;
  qyTotalDia.ParamByName('DE').AsDate := dtIni;
end;

procedure TfrmCadAgenda.sgCalendarioSelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
begin
  inherited;
  gDataMedico := DataDaCelula(sgCalendario.Cells[aRow, aCol]);
end;

procedure TfrmCadAgenda.sgCalendarioClick(Sender: TObject);
begin
  inherited;
  //Locate .... lbPeriodo....
end;

procedure TfrmCadAgenda.DBLookupListBox1Click(Sender: TObject);
begin
  inherited;
  AtualizaMes;
end;

procedure TfrmCadAgenda.DataInicioFimMes(var Data,dtIni,dtFim:TDate);
var wano, wmes, wdia:Word;
begin
  DecodeDate(Data,wano,wmes,wdia);
  wdia := 1;
  Data := EncodeDate(wano,wmes,wdia);
  dtIni := Data;
  Data := IncMonth(Data,1)-1;
  dtFim := Data;
end;

function TfrmCadAgenda.ValidaImpedimento(pncd_medico:string):Boolean;
begin
  qyAtendimentoDia.Close;
  qyAtendimentoDia.ParamByName('CD_MEDICO').AsString := pncd_medico;
  qyAtendimentoDia.ParamByName('DATA').AsDate := Calendario.Date;
  qyAtendimentoDia.Open;
  result := qyAtendimentoDia.FieldByName('tp_periodo').AsString = '4';
end;

function TfrmCadAgenda.ValidaImpedimentoTriagem(pncd_medico:string):Boolean;
begin
  qyAtendimentoDia.Close;
  qyAtendimentoDia.ParamByName('CD_MEDICO').AsString := pncd_medico;
  qyAtendimentoDia.ParamByName('DATA').AsDate := Calendario.Date;
  qyAtendimentoDia.Open;
  result := qyAtendimentoDia.FieldByName('tp_periodo').AsString = '3';
end;

function TfrmCadAgenda.ValidaTotalDia(pncd_medico:string; var pnTotal:integer):Boolean;
var sSQL:string;  nr:integer;
begin
try
  qyTotalDia2.Close;
  qyTotalDia2.ParamByName('CD_MEDICO').AsString := pncd_medico;
  qyTotalDia2.ParamByName('DATA').AsDate := Calendario.Date;
  qyTotalDia2.Open;
  pnTotal := qyTotalDia2.FieldByName('CNT').AsInteger;
  //A função RetornaTotalDia esta trazendo valor 0
  //pnTotal := RetornaTotalDia(Calendario.Date);
  nr := 16;
  qyMedico.Close;
  sSQL := qyMedico.SQL.Text;
  qyMedico.SQL.Add('WHERE CD_MEDICO = :CD_MEDICO');
  qyMedico.ParamByName('CD_MEDICO').AsString := pncd_medico;
  qyMedico.Open;
  if (qyMedicoNR_ATENDIMENTO.AsInteger > 0) then
    nr := qyMedicoNR_ATENDIMENTO.AsInteger;
  result := pnTotal >= nr;
finally
  qyMedico.Close;
  qyMedico.SQL.Text := sSQL;
end;
end;

function TfrmCadAgenda.RetornaTotalDia(pData: TDate): Integer;
var i:integer;
begin
 result := 0;
 for i:=Low(vAgenda) to High(vAgenda) do
 begin
    if vAgenda[i].dt_agenda = pData then
    begin
       result := vAgenda[i].cnt;
       Exit;
    end;
 end;
end;

procedure TfrmCadAgenda.Label13DblClick(Sender: TObject);
begin
  inherited;
  dbgrid1.Visible := not dbgrid1.Visible;
end;

procedure TfrmCadAgenda.SpeedButton4Click(Sender: TObject);
begin
  inherited;
    if (dsControle.DataSet.State in [dsEdit, dsInsert]) then
    begin
    if not Assigned(frmLocalizar) then
      frmLocalizar := TfrmLocalizar.Create(application);
    frmLocalizar.Caption := 'Localizar Esquema';
    frmLocalizar.qyDados := SelectDadosEsquema;

    try
      frmLocalizar.Where := false;
      SetLength(VCampo,7);
      frmLocalizar.KeyField := 'cd_esquema';
      VCampo[0].Titulo  := 'Código';
      VCampo[0].Width := 5;
      VCampo[1].Titulo  := 'Nome Medicamento';
      VCampo[1].Width := 30;
      VCampo[2].Titulo  := 'Sigla';
      VCampo[2].Width := 25;
      VCampo[3].Titulo  := 'Apresentação';
      VCampo[3].Width := 30;
      VCampo[4].Titulo  := 'Nome Comercial';
      VCampo[4].Width := 30;
      VCampo[0].Visivel := True;
      VCampo[1].Visivel := True;
      VCampo[2].Visivel := True;
      VCampo[3].Visivel := True;
      VCampo[4].Visivel := True;
    except
      ShowMessage(frmLocalizar.qyDados.Sql.Text);
    end;
    if frmLocalizar.ShowModal=mrok then
    begin
{      if dmGeral.TB_AGENDADS_ESQUEMA.GetAsString = frmLocalizar.qyDados.FieldByname('DS_SIGLA').AsString then
      begin
        MessageDlg('Esquema ( ' + frmLocalizar.qyDados.FieldByname('DS_SIGLA').AsString +
         ' ) já esta sendo utilizado!',mtWarning,[mbOK],0);
        abort;
      end;
}
      if dmGeral.TB_AGENDADS_ESQUEMA.AsString <> '' then
        dmGeral.TB_AGENDADS_ESQUEMA.AsString := dmGeral.TB_AGENDADS_ESQUEMA.AsString + '+' + frmLocalizar.qyDados.FieldByname('DS_SIGLA').AsString
      else
        dmGeral.TB_AGENDADS_ESQUEMA.AsString := frmLocalizar.qyDados.FieldByname('DS_SIGLA').AsString;
    end;
    frmLocalizar.qyDados.Close;
    FreeAndNil(frmLocalizar);
   end;

end;

procedure TfrmCadAgenda.SpeedButton3Click(Sender: TObject);
begin
  inherited;
  if (dsControle.DataSet.State in [dsEdit, dsInsert]) then
  begin
    dmGeral.TB_AGENDADS_ESQUEMA.Clear;
  end;

end;

procedure TfrmCadAgenda.tbPagPrxClick(Sender: TObject);
begin
  inherited;
  inc(nPagina);
  Mapa(nPagina);
end;

procedure TfrmCadAgenda.tbPgAntClick(Sender: TObject);
begin
  inherited;
  if nPagina>0 then
  begin
    dec(nPagina);
    Mapa(nPagina);
  end;
end;

function TfrmCadAgenda.ValidaImpedimentoAtivo(
  pncd_medico: string): Boolean;
var sSQL:string;
begin
  try
  qyMedico.Close;
  sSQL := qyMedico.SQL.Text;
  qyMedico.SQL.Add('WHERE CD_MEDICO = :CD_MEDICO');
  qyMedico.ParamByName('CD_MEDICO').AsString := pncd_medico;
  qyMedico.Open;
  if qyMedicoFL_ATIVO.AsInteger = cvFlSim then
    result := (qyMedicoDT_ATIVO.AsDateTime <  Calendario.Date);
  finally
    qyMedico.Close;
    qyMedico.SQL.Text := sSQL;
  end;
end;

procedure TfrmCadAgenda.btConfirmarClick(Sender: TObject);
begin
  inherited;
  if not(dmGeral.TB_AGENDAFL_LAB.AsString = cvSim)and
     not(dmGeral.TB_AGENDAFL_RX.AsString = cvSim) then
  begin
     MessageDlg('É necessário informar tipo de exame!',mtInformation,mbOKCancel,0);
     Abort;
  end;

  if not(dmGeral.TB_AGENDA.State in [dsEdit,dsInsert]) then
    dmGeral.TB_AGENDA.Edit;

  dmGeral.TB_AGENDAFL_CONFIRMADO.AsInteger := cvFlSim;

  if dmGeral.TB_AGENDAFL_LAB.AsString = cvSim then
    dmGeral.TB_AGENDANR_LAB.AsInteger := dm.GeraCodigo('gen_numero_lab');

  if dmGeral.TB_AGENDAFL_RX.AsString = cvSim then
    dmGeral.TB_AGENDANR_LAB.AsInteger := dm.GeraCodigo('gen_numero_rx');

  if not btgravar.Enabled then
    if (dmGeral.TB_AGENDA.State in [dsEdit,dsInsert]) then
      dmGeral.TB_AGENDA.Post;
end;

procedure TfrmCadAgenda.qyAgendaBeforeOpen(DataSet: TDataSet);
begin
  inherited;
//
end;

procedure TfrmCadAgenda.AtualizaExames;
var c : word;
begin
  inherited;
    // desabilita todos os CheckBoxs
    for c:=0 to ComponentCount - 1 do
      if (Components[c] is TCheckBox) then
        (Components[c] as TCheckBox).Checked := false;

    // habilita os CheckBoxs para para esta Agenda
    with TIBQuery.Create(nil) do
    begin
      Database := DM.DB;
      sql.Add('select CD_EXAMES from EXAMES_AGENDA');
      sql.Add('where CD_AGENDA = '''+IntToStr(DMGERAL.TB_AGENDACD_AGENDA.asInteger)+'''');
      open;
      while not Eof do
      begin
        for c:=0 to frmCadAgenda.ComponentCount - 1 do
        begin
          if (frmCadAgenda.Components[c] is TCheckBox) then
            if ((frmCadAgenda.Components[c] as TCheckBox).Tag =
                                                FieldByName('CD_EXAMES').AsInteger) then
            begin
              (frmCadAgenda.Components[c] as TCheckBox).Checked := true;
              Break;
            end;
        end;
        Next;
      end;
      close;
      free;
    end;

end;

procedure TfrmCadAgenda.btAnteriorClick(Sender: TObject);
begin
  inherited;
  AtualizaExames;
end;

procedure TfrmCadAgenda.btProximoClick(Sender: TObject);
begin
  inherited;
  AtualizaExames;
end;

procedure TfrmCadAgenda.tabExamesShow(Sender: TObject);
begin
  inherited;
  AtualizaExames;
end;

procedure TfrmCadAgenda.btGerarNovoProcessoClick(Sender: TObject);
var
  iPaciente:integer;
begin
//  inherited;

  //Atualizando parametro com Ultimo Processo
  DMGERAL.TB_PARAMETRO.Open;
  DMGERAL.TB_PARAMETRO.Locate('cd_parametro', 24,[]);
  prmUltimoNrProcesso := DMGERAL.TB_PARAMETROVALOR.AsString;
  DMGERAL.TB_PARAMETRO.Close;

  frmGerarNovoProcesso := TfrmGerarNovoProcesso.Create(self);
  if frmGerarNovoProcesso.ShowModal = mrok then
    begin
      iPaciente := DMGERAL.TB_PACIENTECD_PACIENTE.AsInteger;

      DMGERAL.TB_PARAMETRO.Open;
      DMGERAL.TB_PARAMETRO.Locate('cd_parametro', 24,[]);

      //Verificando se o processo já foi utilizado
      if DMGERAL.TB_PARAMETROVALOR.AsInteger > StrToInt(prmUltimoNrProcesso) then
        begin
          ShowMessage('Nr de Processo: '+ DMGERAL.TB_PACIENTENR_PROCESSO.AsString +
            ', já esta sendo Utilizado.' + #13#10 +
            'Este Utente recebera um novo Nr. de Processo: ' + IntToStr(DMGERAL.TB_PARAMETROVALOR.AsInteger + 1));

          DMGERAL.TB_PACIENTENR_PROCESSO.AsString := IntToStr(DMGERAL.TB_PARAMETROVALOR.AsInteger + 1);
        end;

      //Editando PARAMETRO 24 Ultimo Processo
      DMGERAL.TB_PARAMETRO.Edit;
      DMGERAL.TB_PARAMETROVALOR.AsString := DMGERAL.TB_PACIENTENR_PROCESSO.AsString;
      prmUltimoNrProcesso := DMGERAL.TB_PARAMETROVALOR.AsString;
      DMGERAL.TB_PARAMETRO.post;
      DMGERAL.TB_PARAMETRO.Close;
	  {TODO: Verificar se nao he necessario COMMIT aqui, para nao travar o proximo que pegar}

      DMGERAL.TB_PACIENTE.Post;
      DMGERAL.TB_PACIENTE.DataSource := dsControle;
      DMGERAL.TB_AGENDACD_PACIENTE.AsInteger := iPaciente;
      DMGERAL.TB_PACIENTE.Close; DMGERAL.TB_PACIENTE.Open;
      DMGERAL.TB_PACIENTE.Edit;

    end
    else
    begin
      DMGERAL.TB_PACIENTE.Cancel;
      DMGERAL.TB_PACIENTE.DataSource := dsControle;
      DMGERAL.TB_PACIENTE.Insert;
    end;

  frmGerarNovoProcesso.Free;

end;

procedure TfrmCadAgenda.CarregaImpressaoEtiqueta;
begin

end;

procedure TfrmCadAgenda.btImprimirEtiquetaClick(Sender: TObject);
begin
  inherited;
  qyEtiqueta.Close;
  qyEtiqueta.ParamByName('MEDICO').AsString := DMGERAL.TB_AGENDACD_MEDICO.AsString;
  qyEtiqueta.ParamByName('DATA').AsString := DMGERAL.TB_AGENDADT_AGENDA.AsString;
  qyEtiqueta.Open;

  RvEtiqueta.ProjectFile := sPathLayout +'\RelEtiqueta.rav';
  RvEtiqueta.Execute;

end;

procedure TfrmCadAgenda.BitBtn2Click(Sender: TObject);
begin
  inherited;
  //if bteditar.Enabled then bteditarClick(Sender);

  if not (DMGERAL.TB_AGENDA.State in [dsEdit,dsInsert]) then
    DMGERAL.TB_AGENDA.Edit;

  try
    DMGERAL.TB_AGENDAFL_CONFIRMADO.AsInteger := cvFlSim;
  except
    if DMGERAL.TB_AGENDA.State in [dsEdit,dsInsert] then
        DMGERAL.TB_AGENDA.Cancel;
  end;

  if DMGERAL.TB_AGENDA.State in [dsEdit,dsInsert] then
  begin
    DMGERAL.TB_AGENDA.Post;
    dm.Commit(DMGERAL.TB_AGENDA);
  end;

  if gbLaboratorio then
    pgDados.ActivePage := tabExames;

  //if btgravar.Enabled then btgravarClick(Sender);
end;

procedure TfrmCadAgenda.qyEsquemaAfterOpen(DataSet: TDataSet);
begin
  inherited;
  qyEsquema.Last;
end;

procedure TfrmCadAgenda.framPaciente1dxDBEdit16Change(Sender: TObject);
begin
  inherited;
  if Pos('-', framPaciente1.dxDBEdit16.Text) > 0 then
  begin
    if (DMGERAL.TB_AGENDA.State in [dsEdit, dsInsert]) then
    begin
      try
        qyPacienteExistente.Close;
        qyPacienteExistente.SQL.Text := sPSQL;

       qyPacienteExistente.SQL.Add('and NR_PROCESSO_CRIANCA_EXP like :processo');
       qyPacienteExistente.ParamByName('processo').AsString :=
          framPaciente1.dxDBEdit16.Text +'%';

        qyPacienteExistente.Open;
        if qyPacienteExistente.RecordCount > 0 then
          PacienteExistente
        else
        begin
          ShowMessage('Nenhum registro de criança exposta que começe com '+ framPaciente1.dxDBEdit16.Text +' encontrado');
          qyPacienteExistente.Close;
        end;
      except
        qyPacienteExistente.close;
      end;
    end;
    frampaciente1.dxDBEdit16.Clear;
  end;
end;

end.
