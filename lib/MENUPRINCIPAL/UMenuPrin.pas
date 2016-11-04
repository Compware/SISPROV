unit UMenuPrin;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ActnList, Menus, ImgList, ComCtrls, ToolWin, ExtCtrls, Grids,
  XPMan, ActnMan, ActnColorMaps, Buttons, jpeg, RXCtrls,
  TeeProcs, TeEngine, Chart, DbChart,
   DB,  Series, inifiles, IBCustomDataSet, IBQuery,
  Animate, GIFCtrl, ActnCtrls, ActnMenus, StdCtrls, XPStyleActnCtrls,
  AppEvnts, pngextra, shellapi, RxGIF, pngimage, frxClass,frxChBox, frxDBSet,
  GIFImage, ExcMagic, ufrmGridFilter;

type

  TNewDialogFilter = class( TInterfacedObject, IExcMagicFilter )
    function ShowException( ExceptionObject: TObject; Title: String; ExceptionMessage: String; CallStack: TStrings; Registers: TStrings; CustomInfo: TStrings ): Integer;
    function LogException(  ExceptionObject: TObject; Buffer: PChar; BufferSize: Integer; CallStack: TStrings; Registers: TStrings; CustomInfo: TStrings ): Integer;
    function ExceptionMessage( ExceptionObject: TObject; MessageInfo: TExceptionMessageInfo; Buffer: PChar; BufferSize: Integer; CustomInfo: TStrings ): Integer;
  end;

  TfrmMenuPrin = class(TForm)
    ActionList1: TActionList;
    actSair: TAction;
    MainMenu1: TMainMenu;
    Cadstro1: TMenuItem;
    Sair: TMenuItem;
    StatusBar1: TStatusBar;
    Timer1: TTimer;
    XPManifest1: TXPManifest;
    Relatrios1: TMenuItem;
    Cadastro1: TMenuItem;
    Consultas1: TMenuItem;
    N3: TMenuItem;
    Pessoa1: TMenuItem;
    Utente: TMenuItem;
    actEmpresa: TAction;
    ToolBar1: TToolBar;
    btPaciente: TSpeedButton;
    N8: TMenuItem;
    btNotificacao: TSpeedButton;
    btATV: TSpeedButton;
    actUsuario: TAction;
    N2: TMenuItem;
    Usuario: TMenuItem;
    ImageList2: TImageList;
    actUnidade: TAction;
    Unidade: TMenuItem;
    Ferramentas: TMenuItem;
    actAdminPermissao: TAction;
    IBQuery1: TIBQuery;
    imgFundo: TImage;
    Image3: TImage;
    actLogof: TAction;
    EfetuarLogof1: TMenuItem;
    RxLabel2: TRxLabel;
    RxLabel3: TRxLabel;
    N19: TMenuItem;
    ToolButton1: TToolButton;
    btgeralnotificacao: TSpeedButton;
    ToolButton5: TToolButton;
    Configuraes1: TMenuItem;
    actConfRelatorio: TAction;
    Relatorios: TMenuItem;
    actConsultaInventario: TAction;
    Duplicidade: TMenuItem;
    Paciente: TMenuItem;
    ListagemUtente: TMenuItem;
    ToolButton6: TToolButton;
    N41: TMenuItem;
    Parametros: TMenuItem;
    actPais: TAction;
    Pais: TMenuItem;
    Provincia: TMenuItem;
    actProvincia: TAction;
    actMunicipio: TAction;
    Municipio: TMenuItem;
    actNotificacao: TAction;
    Notificacao: TMenuItem;
    actCadDash: TAction;
    BI1: TMenuItem;
    CadastroBI: TMenuItem;
    ControleBI: TMenuItem;
    actViewDash: TAction;
    Fichas1: TMenuItem;
    ATV: TMenuItem;
    Abandonos: TMenuItem;
    N6: TMenuItem;
    Agenda: TMenuItem;
    actPaciente: TAction;
    abelas1: TMenuItem;
    N7: TMenuItem;
    N9: TMenuItem;
    N10: TMenuItem;
    N5: TMenuItem;
    N11: TMenuItem;
    btAgenda: TSpeedButton;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    N12: TMenuItem;
    Ocupacao: TMenuItem;
    actOcupacao: TAction;
    actTipoDocumento: TAction;
    N13: TMenuItem;
    TipoDocumento: TMenuItem;
    actMedico: TAction;
    N14: TMenuItem;
    Medico: TMenuItem;
    btabandono: TSpeedButton;
    btduplicidade: TSpeedButton;
    ToolButton8: TToolButton;
    N15: TMenuItem;
    GeralNotificacao: TMenuItem;
    btSair: TSpeedButton;
    ToolButton9: TToolButton;
    ImageList1: TImageList;
    ApplicationEvents1: TApplicationEvents;
    actParametro: TAction;
    actCadPTV: TAction;
    N4: TMenuItem;
    PTV: TMenuItem;
    actInvestigador: TAction;
    N16: TMenuItem;
    Investigador: TMenuItem;
    TARV: TMenuItem;
    Scripts1: TMenuItem;
    actCaracterizacao: TAction;
    Caracterizacao: TMenuItem;
    actPrograma: TAction;
    N20: TMenuItem;
    PROGRAMA: TMenuItem;
    actRelGeralCaracterizacao: TAction;
    actCoinfeccao: TAction;
    COINFECCAO: TMenuItem;
    actTARVEsquema: TAction;
    TARVEsquema: TMenuItem;
    actEsquema: TAction;
    N24: TMenuItem;
    TabularBI: TMenuItem;
    Esquema: TMenuItem;
    N25: TMenuItem;
    sbTabular: TSpeedButton;
    ToolButton2: TToolButton;
    btCaracterizacao: TSpeedButton;
    ToolButton7: TToolButton;
    actRelGeralPrograma: TAction;
    N26: TMenuItem;
    GeralPrograma: TMenuItem;
    AdministradorPermisso1: TMenuItem;
    actAtendimentos: TAction;
    N27: TMenuItem;
    Atendimentos: TMenuItem;
    btAtendimentos: TSpeedButton;
    actCadTestesPositivos: TAction;
    N28: TMenuItem;
    actTARVAcompanhamento: TAction;
    Acompanhamento: TMenuItem;
    actTARVCD4: TAction;
    TARVCD4: TMenuItem;
    N1: TMenuItem;
    N17: TMenuItem;
    N23: TMenuItem;
    N30: TMenuItem;
    N18: TMenuItem;
    actRelGeralAgenda: TAction;
    actListagemGeralExames: TAction;
    actRelTransferencia: TAction;
    PNGButton1: TPNGButton;
    PNGButton2: TPNGButton;
    Protocolo: TMenuItem;
    ConfirmaoEDI1: TMenuItem;
    N42: TMenuItem;
    Servicos: TMenuItem;
    btConfirmacaoEDI: TSpeedButton;
    ToolButton10: TToolButton;
    EDI2: TMenuItem;
    RelatriodeUnidades1: TMenuItem;
    N21: TMenuItem;
    SpeedButton1: TSpeedButton;
    PNGButton3: TPNGButton;
    qyParametro: TIBQuery;
    qyParametroVALOR: TIBStringField;
    tmEDI: TTimer;
    pEDI: TPanel;
    lStatus: TRxLabel;
    lExportar: TRxLabel;
    lEnviar: TRxLabel;
    lReceber: TRxLabel;
    lImportar: TRxLabel;
    lStatus2: TRxLabel;
    iExportar: TImage;
    iEnviar: TImage;
    iImportar: TImage;
    iReceber: TImage;
    btFecharEDI: TSpeedButton;
    iEDI: TImage;
    actNotGest: TAction;
    N22: TMenuItem;
    NotificaodeGestante1: TMenuItem;
    SpeedButton2: TSpeedButton;
    N31: TMenuItem;
    AuditoriaAnual1: TMenuItem;
    AuditoriadeRelatrios1: TMenuItem;
    SpeedButton3: TSpeedButton;
    RelatriodeUnidades2: TMenuItem;
    RelatriodosRelatrios1: TMenuItem;
    N29: TMenuItem;
    imVersao: TMenuItem;
    LogSQL1: TMenuItem;
    Mapas1: TMenuItem;
    estagem1: TMenuItem;
    Mdico1: TMenuItem;
    N32: TMenuItem;
    ExportNotificao1: TMenuItem;
    Laboratrio1: TMenuItem;
    esteRpido1: TMenuItem;
    ExtratodoPaciente1: TMenuItem;
    ExtratoporPerodo1: TMenuItem;
    N33: TMenuItem;
    Filter1: TMenuItem;
    Farmacia: TMenuItem;
    N34: TMenuItem;
    imCorrecao1: TMenuItem;
    imCorrecao2: TMenuItem;
    imCorrecao3: TMenuItem;
    N35: TMenuItem;
    Forma1: TMenuItem;
    N36: TMenuItem;
    Gestantes1: TMenuItem;
    CrianaExposta: TMenuItem;
    CrianaExposta1: TMenuItem;
    CrianaExpostacommaisde18meses1: TMenuItem;
    N37: TMenuItem;
    ControleGestantes1: TMenuItem;
    N38: TMenuItem;
    RelatriosdeProdutividade1: TMenuItem;
    Farmcia1: TMenuItem;
    Laboratrio2: TMenuItem;
    Agendas1: TMenuItem;
    RelatriosQuantitativo: TMenuItem;
    RelatriosFixos1: TMenuItem;
    procedure actSairExecute(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure actUsuarioExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure actAdminPermissaoExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure actLogofExecute(Sender: TObject);
    procedure actConfRelatorioExecute(Sender: TObject);
    procedure actUnidadeExecute(Sender: TObject);
    procedure actPaisExecute(Sender: TObject);
    procedure actProvinciaExecute(Sender: TObject);
    procedure actMunicipioExecute(Sender: TObject);
    procedure actNotificacaoExecute(Sender: TObject);
    procedure btNotificacaoClick(Sender: TObject);
    procedure actCadDashExecute(Sender: TObject);
    procedure actViewDashExecute(Sender: TObject);
    procedure actPacienteExecute(Sender: TObject);
    procedure btViewDashClick(Sender: TObject);
    procedure btPacienteClick(Sender: TObject);
    procedure DuplicidadeClick(Sender: TObject);
    procedure AbandonosClick(Sender: TObject);
    procedure lbLink4Click(Sender: TObject);
    procedure lbLink5Click(Sender: TObject);
    procedure lbLink6Click(Sender: TObject);
    procedure lbLink1Click(Sender: TObject);
    procedure lbLink3Click(Sender: TObject);
    procedure btATVClick(Sender: TObject);
    procedure actOcupacaoExecute(Sender: TObject);
    procedure actTipoDocumentoExecute(Sender: TObject);
    procedure actMedicoExecute(Sender: TObject);
    procedure GeralNotificacaoClick(Sender: TObject);
    procedure StatusBar1DrawPanel(StatusBar: TStatusBar;
      Panel: TStatusPanel; const Rect: TRect);
    procedure btAgendaClick(Sender: TObject);
    procedure ListagemUtenteClick(Sender: TObject);
    procedure actParametroExecute(Sender: TObject);
    procedure actCadPTVExecute(Sender: TObject);
    procedure actInvestigadorExecute(Sender: TObject);
    procedure TARVClick(Sender: TObject);
    procedure Scripts1Click(Sender: TObject);
    procedure actCaracterizacaoExecute(Sender: TObject);
    procedure actProgramaExecute(Sender: TObject);
    procedure actRelGeralCaracterizacaoExecute(Sender: TObject);
    procedure EDI1Click(Sender: TObject);
    procedure actCoinfeccaoExecute(Sender: TObject);
    procedure actTARVEsquemaExecute(Sender: TObject);
    procedure TabularBIClick(Sender: TObject);
    procedure actRelGeralProgramaExecute(Sender: TObject);
    procedure testeClick(Sender: TObject);
    procedure actAtendimentosExecute(Sender: TObject);
    procedure actCadTestesPositivosExecute(Sender: TObject);
    procedure actEsquemaExecute(Sender: TObject);
    procedure actTARVAcompanhamentoExecute(Sender: TObject);
    procedure actTARVCD4Execute(Sender: TObject);
    procedure actRelGeralAgendaExecute(Sender: TObject);
    procedure Exames1Click(Sender: TObject);
    procedure LogSQL1Click(Sender: TObject);
    procedure CD41Click(Sender: TObject);
    procedure actListagemGeralExamesExecute(Sender: TObject);
    procedure CID101Click(Sender: TObject);
    procedure EsquemasTotal1Click(Sender: TObject);
    procedure ProdutividadeMedicoporPerodo1Click(Sender: TObject);
    procedure EsquemasProcessoTotal1Click(Sender: TObject);
    procedure actRelTransferenciaExecute(Sender: TObject);
    procedure actCadServicosCPNExecute(Sender: TObject);
    procedure actCadCriancaExpostaExecute(Sender: TObject);
    procedure actCadServicosAtExecute(Sender: TObject);
    procedure actCadServicosTARVExecute(Sender: TObject);
    procedure ServicoTARVUnidade1Click(Sender: TObject);
    procedure PNGButton1Click(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure ProtocoloClick(Sender: TObject);
    procedure ConfirmaoEDI1Click(Sender: TObject);
    procedure ServicosClick(Sender: TObject);
    procedure btConfirmacaoEDIClick(Sender: TObject);
    procedure RelatriodeUnidades1Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure PNGButton3Click(Sender: TObject);
    procedure PNGButton2Click(Sender: TObject);
    procedure tmEDITimer(Sender: TObject);
    procedure btFecharEDIClick(Sender: TObject);
    procedure actNotGestExecute(Sender: TObject);
    procedure este1Click(Sender: TObject);
    procedure AtualizaVersaoUnidadesWeb1Click(Sender: TObject);
    procedure RelatriodosRelatrios1Click(Sender: TObject);
    procedure EDIRemoto1Click(Sender: TObject);
    procedure AuditoriaAnual1Click(Sender: TObject);
    procedure AuditoriadeRelatrios1Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure RelatriodeUnidades2Click(Sender: TObject);
    procedure estagem1Click(Sender: TObject);
    procedure Mdico1Click(Sender: TObject);
    procedure ExportNotificao1Click(Sender: TObject);
    procedure Laboratrio1Click(Sender: TObject);
    procedure esteRpido1Click(Sender: TObject);
    procedure ExtratodoPaciente1Click(Sender: TObject);
    procedure ExtratoporPerodo1Click(Sender: TObject);
    procedure Filter1Click(Sender: TObject);
    procedure FarmaciaClick(Sender: TObject);
    procedure imCorrecao1Click(Sender: TObject);
    procedure imCorrecao2Click(Sender: TObject);
    procedure imCorrecao3Click(Sender: TObject);
    procedure Forma1Click(Sender: TObject);
    procedure Gestantes1Click(Sender: TObject);
    procedure CrianaExpostaClick(Sender: TObject);
    procedure CrianaExposta1Click(Sender: TObject);
    procedure CrianaExpostacommaisde18meses1Click(Sender: TObject);
    procedure ControleGestantes1Click(Sender: TObject);
    procedure Farmcia1Click(Sender: TObject);
    procedure Laboratrio2Click(Sender: TObject);
    procedure Agendas1Click(Sender: TObject);
    procedure RelatriosFixos1Click(Sender: TObject);
    procedure RelatriosQuantitativoClick(Sender: TObject);
  private
    { Private declarations }
    procedure Habilita_Menu(bAdmin:boolean);
    procedure ViewDash(codigo:integer);
  public
    { Public declarations }
    MyFilter: IExcMagicFilter;
  end;

var
  frmMenuPrin: TfrmMenuPrin;

implementation

uses UDM, UDMGERAL, UfrmCadPad, UGeral, uEmail, UfrmStatus, UfrmAdminPermissao,
  UfrmLogin, UfrmConfRelatorio, UCadUsuario, uCadUnidade, uCadPais,
  uCadProvincia, uCadMunicipio, uCadNotificacao, uCadDashBoard,
  UViewDashBoard, uCadPaciente, uConsDuplicidade, uConsAbandono,
  uCadAgenda, uCadATV, UCadTipoDocumento, UCadOcupacao, UCadMedico,
  ufrmRelGeralNotificacao, uCadParametro, uCadPTV, uCadInvestigador,
  uGeralSQL, uCadTARV, uMetaDados, uCadCaracterizacao, uCadPROGRAMA, ufrmEDI,
  ufrmRelGeralCaracterizacao, uCadCOINFECCAO, uCadTARVESQUEMA,
  ufrmBITabular, ufrmMenuEDI, ufrmRelGeralPrograma, UCadAtendimento,
  uCadTESTESPOSITIVOS, UCadEsquema, uCadTARVACOMP, uCadTARVCD4,
  ufrmRelGeralAgenda, uCadExame, ULogSQL, ufrmCadCD4,
  ufrmRelListagemGeralExames, uCadCID10, UfrmConEsquemaTotal,
  UfrmConProdutividadeMedico, UfrmConEsquemaProcessoTotal,
  UfrmRelTransferencia,uCadServicosCPN,
  uCadCriancaExposta, uCadServicoAT, uCadServicoTARV,
  uCadServicoTARVUnidade, ufrmProtocoloEnvio,
  ufrmConfirmacaoEDI, uCadServicos, ufrmRelSerieCronologica,
  UfrmRelUnidades, uCadNotGestante, UfrmRR, udmClienteEDI, UfrmPainelAR,
  UfrmAuditoriaRelatorios, UfrmRelUnidadesImp, uCadMapaTestagem,
  uCadMapaMedico, UfrmRelNotificacao, uCadMapaLaboratorio,
  uCadMapaTesteRapido, UfrmRelExtratoPaciente, UfrmRelMapaMedicoPeriodo,
  uCadMapaFarmacia, ufrmCorrecao1, ufrmCorrecao2, ufrmCorrecao3,
  uCadForma, UfrmRelGestante, uCadMapaCriancaExposta, UfrmRelCriancaExpDPIAlto,
  UfrmRelCriancaExpFechamento, UfrmControleGestantes, DateUtils,
  UfrmRelProdFarmacia, UfrmRelProdAgendas, UfrmRelProdLaboratorio, UfrmRelFixos,
  UfrmRelQuantitativo;

{$R *.dfm}

{ TNewDialogFilter }

function TNewDialogFilter.ExceptionMessage(ExceptionObject: TObject;
  MessageInfo: TExceptionMessageInfo; Buffer: PChar; BufferSize: Integer;
  CustomInfo: TStrings): Integer;
begin
//
end;

function TNewDialogFilter.LogException(ExceptionObject: TObject;
  Buffer: PChar; BufferSize: Integer; CallStack, Registers,
  CustomInfo: TStrings): Integer;
begin
//
end;

function TNewDialogFilter.ShowException(ExceptionObject: TObject; Title,
  ExceptionMessage: String; CallStack, Registers,
  CustomInfo: TStrings): Integer;
begin
 if FileExists(ExceptionHook.LogFile) then
 begin
   frmEmail := TfrmEmail.Create(nil);
   frmEmail.mmMsg.Lines.Clear;
   frmEmail.mmMsg.Lines.LoadFromFile(ExceptionHook.LogFile);
   frmEmail.mmMsg.Lines.Add('Computer:' + sLogComputer);
   frmEmail.mmMsg.Lines.Add('Unidade:'  + sLogUnidade);
   frmEmail.mmMsg.Lines.Add('Usuário:'  + sLogUsuario);
   frmEmail.mmMsg.Lines.Add('Sistema:'  + sLogSistema);
   frmEmail.mmMsg.Lines.Add('Local:'    + sPath);
   frmEmail.sSubject := 'SIS PROV - Erro';
   if frmEmail.Enviar then
     DeleteFile(ExceptionHook.LogFile)
   else
     frmEmail.mmMsg.Lines.SaveToFile(ExceptionHook.LogFile);
   frmEmail.Free;
 end;
end;

{ TfrmMenuPrin }

procedure TfrmMenuPrin.Habilita_Menu(bAdmin:boolean);
var i : word;   Sair:Boolean;
begin

  if bAdmin then
  begin
   for i := 0 to ComponentCount - 1 do
    if (Components[i] is TMenuItem) then
    begin
     (Components[i] as TMenuItem).Visible := true;
     (Components[i] as TMenuItem).Enabled := true;
    end;
   Exit;
  end;

  // Variavel que controla se existe permissao para acesso ao modulo
  Sair:=True;
  // desabilita todos os menus com tag 1
  for i := 0 to ComponentCount - 1 do
    if (Components[i] is TMenuItem) then
      if (Components[i] as TMenuItem).Tag = 1 then
        (Components[i] as TMenuItem).Enabled := false;

  // mesmo se não encontrou usuário passa por aqui
  if DM.qyLogin.RecordCount = 0 then
    exit;

  // verifica permissões para o usuário e habilita menu
  with TIBQuery.Create(nil) do
  begin
    Database := DM.DB;
    sql.Add('select cd_permissao from permissao_usuario where cd_usuario = '''+
             inttostr(DM.qyLoginCD_usuario.AsInteger)+'''');
    sql.Add('and ds_modulo = '''+('GERAL')+'''');
    open;

    while not Eof do
    begin
      case FieldByName('cd_permissao').AsInteger of
        100  : Sair:=False; // acesso ao modulo
        1  : Utente.Enabled := true;
        2  : Agenda.Enabled := true;
        //3  : Empresa.Enabled := true;
        4  : Usuario.Enabled := true;
        5  : Municipio.Enabled := true;
        6  : Provincia.Enabled := true;
        7  : Pais.Enabled := true;
        8  : Unidade.Enabled := true;
        9  : Ocupacao.Enabled := true;
        10 : TipoDocumento.Enabled := true;
        11 : Medico.Enabled := true;
        12 : Investigador.Enabled := true;
        13 : Esquema.Enabled := true;
        14 : Caracterizacao.Enabled := true;
        15 : Notificacao.Enabled := true;
        16 : ATV.Enabled := true;
        17 : PTV.Enabled := true;
        18 : TARV.Enabled := true;
        19 : TARVEsquema.Enabled := true;
        20 : COINFECCAO.Enabled := true;
        21 : PROGRAMA.Enabled := true;
        22 : ListagemUtente.Enabled := true;
        23 : Duplicidade.Enabled := true;
        24 : Abandonos.Enabled := true;
        25 : GeralNotificacao.Enabled := true;
        //26 : GeralCaracterizacao.Enabled := true;
        27 : GeralPrograma.Enabled := true;
        28 : CadastroBI.Enabled := true;
        29 : ControleBI.Enabled := true;
        30 : TabularBI.Enabled := true;
        31 : ferramentas.Enabled := true;
{        32 : Consulta.Enabled := true;
        33 : Cadastro.Enabled := true;
        34 : Exclusao.Enabled := true;}
        35 : Atendimentos.Enabled := true;
        //36 : testespositivos.enabled := true;
        37 : Acompanhamento.enabled := true;
        38 : TARVCD4.enabled := true;
        41 : protocolo.enabled := true;
        42 : Mdico1.enabled := true;
        43 : estagem1.enabled := true;
        44 : Laboratrio1.enabled := true;
        45 : esteRpido1.enabled := true;
        46 : Farmacia.enabled := true;
        47 : CrianaExposta.Enabled := true; 
      end;
      Next;
    end;

    case strToInt(prmUnidade) of
      9,203,426,399 : Mapas1.Enabled := true;
    end;

    if Utente.Enabled = true then
      btPaciente.enabled := true
    else
      btPaciente.enabled := false;

    if Caracterizacao.Enabled = true then
      btCaracterizacao.enabled := true
    else
      btCaracterizacao.enabled := false;

   if Notificacao.Enabled = true then
      btNotificacao.enabled := true
    else
      btNotificacao.enabled := false;

   if Atendimentos.Enabled = true then
      btAtendimentos.enabled := true
    else
      btAtendimentos.enabled := false;

   if Agenda.Enabled = true then
      btAgenda.enabled := true
    else
      btAgenda.enabled := false;

   if Abandonos.Enabled = true then
      btabandono.enabled := true
    else
      btabandono.enabled := false;

   if Duplicidade.Enabled = true then
      btduplicidade.enabled := true
    else
      btduplicidade.enabled := false;

   if GeralNotificacao.Enabled = true then
      btgeralnotificacao.enabled := true
    else
      btgeralnotificacao.enabled := false;

    if ATV.Enabled = true then
      btATV.enabled := true
    else
      btATV.enabled := false;

   if TabularBI.Enabled = true then
      sbTabular.Enabled := true
    else
      sbTabular.Enabled := false;

    statusbar1.Panels[2].Text:='Usuário: ' + DM.qyLoginNM_USUARIO.AsString;
    close;
    free;

  end;
  if Sair then
  begin
     ShowMessage('Usuário não tem Permissão!');
     Application.Terminate;
  end;
end;

procedure TfrmMenuPrin.actSairExecute(Sender: TObject);
begin
  close;
end;

procedure TfrmMenuPrin.Timer1Timer(Sender: TObject);
begin
  statusbar1.Panels[0].Text:=''+FormatDateTime('hh:nn:ss',Now);//Exibe a hora atual
  statusbar1.Panels[1].Text:=''+FormatDateTime('dddd '', '' dd '' de '' mmmm '' de '' yyyy',Now);//Exibe a data atual
end;

procedure TfrmMenuPrin.FormClose(Sender: TObject;
  var Action: TCloseAction);
var
 int:Integer;
begin

  //sintaxe: MessageDLG('mensagem', tipo da tela, [botões], indice ajuda);
  if MessageDlg('Deseja Fechar a Aplicação?',mtConfirmation,
    [mbYes,mbNo], 0) = mrYes then
    Begin
      frmStatus:=TfrmStatus.Create(Application);
      frmStatus.Show;
      for Int := frmStatus.pbStatus.Min to frmStatus.pbStatus.Max do
      begin
        frmStatus.pbStatus.Position := Int;
        frmstatus.Update;
        frmStatus.lbStatus.caption:='Finalizando Aplicação...';
        Application.Terminate;
      end;
      frmStatus.close;
    end
    else
      Action:=caNone;//Ação do objeto TcloseAtion para não fechar a tela

end;

procedure TfrmMenuPrin.actUsuarioExecute(Sender: TObject);
begin
  frmCadUsuario:=TfrmCadUsuario.Create(self);//Criação manual
  frmCadUsuario.ShowModal;//exibe a tela no modo modal
  frmCadUsuario.Free;//Libera a tela da memória
end;

procedure TfrmMenuPrin.FormCreate(Sender: TObject);
var sPath:String; fini:TIniFile;
begin
  ExceptionHook.LogFile := 'SISCompware.log';
  MyFilter := TNewDialogFilter.Create;
  ExceptionHook.RegisterExceptionFilter( Exception, MyFilter, False );

  if prmImgFundo <> STRING_INDEFINIDO  then
    imgFundo.Picture.LoadFromFile(prmImgFundo);
    
  spath := ExtractFilePath(Application.ExeName);
  fini := TIniFile.Create(sPath+'\compware.ini');
  fini.Free;
  sPathGrid := spath  + 'Grid\' + sLogin;

  if not DirectoryExists(sPathGrid) then
    MkDir(sPathGrid);
    
end;


procedure TfrmMenuPrin.actAdminPermissaoExecute(Sender: TObject);
begin
  frmAdminPermissao:=TfrmAdminPermissao.Create(self);//Criação manual
  frmAdminPermissao.ShowModal;//exibe a tela no modo modal
  frmAdminPermissao.Free;//Libera a tela da memória
end;

procedure TfrmMenuPrin.FormShow(Sender: TObject);
begin

  frmMenuPrin.Caption := 'SIS - Sistema de Informações da Saúde ( Versão: ' + prmVersao + ' )';
  sPath := ExtractFilePath(Application.ExeName);

  sLogComputer := NomeDoComputador;
  sLogUnidade  := SelectNomeUnidadeParametro;
  sLogUsuario  := DM.qyLoginCD_USUARIO.AsString + '-' +
    DM.qyLoginNM_USUARIO.AsString;
  sLogSistema  := frmMenuPrin.Caption;

  if (DM.qyLoginNM_LOGIN.AsString <> 'ADMIN') and
    (DM.qyLoginDS_SENHA.AsString <> 'COMPWARE') then
    Habilita_Menu(false)
  else
    Habilita_Menu(true);

  sPathTemp := sPath + 'Temp\';
  sPathConsulta := sPath + 'Consulta\';
  sPathScript := sPath + 'Script\';

  if not DirectoryExists(sPathScript) then
   MkDir(sPathScript);

  if not DirectoryExists(sPathTemp) then
   MkDir(sPathTemp);

  if not DirectoryExists(sPathTemp) then
   MkDir(sPathConsulta);

end;

procedure TfrmMenuPrin.actLogofExecute(Sender: TObject);
var
  int:Integer;
begin
  FrmLogin := TFrmLogin.Create(Application);
  if frmLogin.ShowModal = mrok then
  begin
    frmStatus:=TfrmStatus.Create(Application);
    frmStatus.Show;
  for Int := frmStatus.pbStatus.Min to frmStatus.pbStatus.Max do
  begin
    frmStatus.pbStatus.Position := Int;
    frmstatus.Update;
    frmStatus.lbStatus.caption:='Atualizando Permissões...';
    Habilita_Menu(false);
    //Usuario
     StatusBar1.Repaint;

  end;
  frmStatus.close;
  end
  else
  begin
    frmStatus:=TfrmStatus.Create(Application);
    frmStatus.Show;
  for Int := frmStatus.pbStatus.Min to frmStatus.pbStatus.Max do
  begin
    frmStatus.pbStatus.Position := Int;
    frmstatus.Update;
    frmStatus.lbStatus.caption:='Finalizando Aplicação...';
    Application.Terminate;
  end;
  frmStatus.close;
  end;

end;

procedure TfrmMenuPrin.actConfRelatorioExecute(Sender: TObject);
begin
  frmConfRelatorio:=TfrmConfRelatorio.Create(self);//Criação manual
  frmConfRelatorio.ShowModal;//exibe a tela no modo modal
  frmConfRelatorio.Free;//Libera a tela da memória
end;

procedure TfrmMenuPrin.actUnidadeExecute(Sender: TObject);
begin
  frmCadUnidade := TfrmCadUnidade.Create(self);
  frmCadUnidade.ShowModal;
  frmCadUnidade.Free;
end;

procedure TfrmMenuPrin.actPaisExecute(Sender: TObject);
begin
  frmCadPais := TfrmCadPais.Create(self);
  frmCadPais.ShowModal;
  frmCadPais.Free;
end;

procedure TfrmMenuPrin.actProvinciaExecute(Sender: TObject);
begin
  frmCadProvincia := TfrmCadProvincia.Create(self);
  frmCadProvincia.ShowModal;
  frmCadProvincia.Free;
end;

procedure TfrmMenuPrin.actMunicipioExecute(Sender: TObject);
begin
  frmCadMunicipio := TfrmCadMunicipio.Create(self);
  frmCadMunicipio.ShowModal;
  frmCadMunicipio.Free;
end;

procedure TfrmMenuPrin.actNotificacaoExecute(Sender: TObject);
begin
  frmCadNotificacao := TfrmCadNotificacao.Create(self);
  frmCadNotificacao.ShowModal;
  frmCadNotificacao.Free;
end;

procedure TfrmMenuPrin.btNotificacaoClick(Sender: TObject);
begin
   actNotificacao.Execute;
end;

procedure TfrmMenuPrin.actCadDashExecute(Sender: TObject);
begin
  frmCadDashBoard:=TfrmCadDashBoard.Create(self);
  frmCadDashBoard.ShowModal;
  frmCadDashBoard.Free;
end;

procedure TfrmMenuPrin.actViewDashExecute(Sender: TObject);
begin
  ViewDash(0);
end;

procedure TfrmMenuPrin.actPacienteExecute(Sender: TObject);
begin
  sCadastroPaciente := true;
  frmCadPaciente := TfrmCadPaciente.Create(self);
  frmCadPaciente.ShowModal;
  frmCadPaciente.Free;
  sCadastroPaciente := false;
end;

procedure TfrmMenuPrin.btViewDashClick(Sender: TObject);
begin
  actViewDash.Execute;
end;

procedure TfrmMenuPrin.btPacienteClick(Sender: TObject);
begin
  actPaciente.Execute;  
end;

procedure TfrmMenuPrin.DuplicidadeClick(Sender: TObject);
begin
  frmConsDuplicidade := TfrmConsDuplicidade.Create(self);
  frmConsDuplicidade.ShowModal;
  frmConsDuplicidade.Free;
end;

procedure TfrmMenuPrin.AbandonosClick(Sender: TObject);
begin
  frmConsAbandono := TfrmConsAbandono.Create(self);
  frmConsAbandono.ShowModal;
  frmConsAbandono.Free;
end;

procedure TfrmMenuPrin.lbLink4Click(Sender: TObject);
begin
  DuplicidadeClick(self);
end;

procedure TfrmMenuPrin.lbLink5Click(Sender: TObject);
begin
  AbandonosClick(self);
end;

procedure TfrmMenuPrin.lbLink6Click(Sender: TObject);
begin
  AbandonosClick(self);
end;

procedure TfrmMenuPrin.ViewDash(codigo:integer);
begin
  frmViewDash := TfrmViewDash.Create(frmMenuPrin);
  frmViewDash.Codigo := codigo;
  frmViewDash.ShowModal;
  FreeAndNil(frmViewDash);
end;

procedure TfrmMenuPrin.lbLink1Click(Sender: TObject);
begin
  ViewDash(31);
end;

procedure TfrmMenuPrin.lbLink3Click(Sender: TObject);
begin
  ViewDash(32);
end;

procedure TfrmMenuPrin.btATVClick(Sender: TObject);
begin
  frmCadATV := TfrmCadATV.Create(self);
  frmCadATV.ShowModal;
  frmCadATV.Free;
end;

procedure TfrmMenuPrin.actOcupacaoExecute(Sender: TObject);
begin
  frmCadOcupacao := TfrmCadOcupacao.Create(self);
  frmCadOcupacao.ShowModal;
  frmCadOcupacao.Free;
end;

procedure TfrmMenuPrin.actTipoDocumentoExecute(Sender: TObject);
begin
  frmCadTipoDocumento := TfrmCadTipoDocumento.Create(self);
  frmCadTipoDocumento.ShowModal;
  frmCadTipoDocumento.Free;
end;

procedure TfrmMenuPrin.actMedicoExecute(Sender: TObject);
begin
  frmCadMedico := TfrmCadMedico.Create(self);
  frmCadMedico.ShowModal;
  frmCadMedico.Free;
end;

procedure TfrmMenuPrin.GeralNotificacaoClick(Sender: TObject);
begin
  frmRelGeralNotificacao := TfrmRelGeralNotificacao.Create(Application);
  frmRelGeralNotificacao.ShowModal;
  frmRelGeralNotificacao.Free;
end;

procedure TfrmMenuPrin.StatusBar1DrawPanel(StatusBar: TStatusBar;
  Panel: TStatusPanel; const Rect: TRect);
begin
  with StatusBar1.Canvas do
   begin
    FillRect(Rect);
    //Definir Font e Style
    Font.Name := 'Arial';
    Font.Color := ClNavy;
    //Font.Style := [FsBold];
    //Desenha as imagens de acordo com o indice de cada panel
    ImageList1.Draw(StatusBar1.Canvas,Rect.Left+5,Rect.Top+1,Panel.Index);

    //Escreve o texto em cada panel

    //Usuario
    if Panel.Index = 3 then
      TextOut(Rect.Left + 25, Rect.Top + 1,'Usuário: ' + dm.qyLoginNM_USUARIO.AsString);
    //Unidade
    if Panel.Index = 2 then
      TextOut(Rect.Left + 25, Rect.Top + 1,'Unidade: ' + prmUnidade +'-'+ sUnidadeDefautDescricao);

   end;
end;

procedure TfrmMenuPrin.btAgendaClick(Sender: TObject);
begin
  frmCadAgenda := TfrmCadAgenda.Create(Application);
  frmCadAgenda.ShowModal;
  FreeAndNil(frmCadAgenda);
end;

procedure TfrmMenuPrin.ListagemUtenteClick(Sender: TObject);
begin
  sListagemPaciente := true;
  frmCadPaciente := TfrmCadPaciente.Create(self);
  frmCadPaciente.ShowModal;
  frmCadPaciente.Free;
  sListagemPaciente := false;
end;

procedure TfrmMenuPrin.actParametroExecute(Sender: TObject);
begin
  frmCadParametro := TfrmCadParametro.Create(self);
  frmCadParametro.ShowModal;
  frmCadParametro.Free;
end;

procedure TfrmMenuPrin.actCadPTVExecute(Sender: TObject);
begin
  frmCadPTV := TfrmCadPTV.Create(self);
  frmCadPTV.ShowModal;
  frmCadPTV.Free;
end;

procedure TfrmMenuPrin.actInvestigadorExecute(Sender: TObject);
begin
  frmCadInvestigador := TfrmCadInvestigador.Create(self);
  frmCadInvestigador.ShowModal;
  frmCadInvestigador.Free;
end;

procedure TfrmMenuPrin.TARVClick(Sender: TObject);
begin
  frmCadTARV := TfrmCadTARV.Create(self);
  frmCadTARV.ShowModal;
  frmCadTARV.Free;
end;

procedure TfrmMenuPrin.Scripts1Click(Sender: TObject);
begin
  frmMetaDados := TfrmMetaDados.Create(self);
  frmMetaDados.ShowModal;
  frmMetaDados.Free;
end;

procedure TfrmMenuPrin.actCaracterizacaoExecute(Sender: TObject);
begin
  frmCadCaracterizacao := TfrmCadCaracterizacao.Create(self);
  frmCadCaracterizacao.ShowModal;
  frmCadCaracterizacao.Free;
end;

procedure TfrmMenuPrin.actProgramaExecute(Sender: TObject);
begin
  frmCadPrograma := TfrmCadPrograma.Create(self);
  frmCadPrograma.ShowModal;
  frmCadPrograma.Free;

end;

procedure TfrmMenuPrin.actRelGeralCaracterizacaoExecute(Sender: TObject);
begin
  frmRelGeralCaracterizacao := TfrmRelGeralCaracterizacao.Create(self);
  frmRelGeralCaracterizacao.ShowModal;
  frmRelGeralCaracterizacao.Free;
end;

procedure TfrmMenuPrin.EDI1Click(Sender: TObject);
begin
  frmEDI := TfrmEDI.Create(self);
  frmMenuEDI := TfrmMenuEDI.Create(self);
  frmMenuEDI.ShowModal;
  frmEDI.Free;
  frmMenuEDI.Free;
end;

procedure TfrmMenuPrin.actCoinfeccaoExecute(Sender: TObject);
begin
  frmCadCOINFECCAO := TfrmCadCOINFECCAO.Create(self);
  frmCadCOINFECCAO.ShowModal;
  frmCadCOINFECCAO.Free;
end;

procedure TfrmMenuPrin.actTARVEsquemaExecute(Sender: TObject);
begin
  frmCadTARVESQUEMA := TfrmCadTARVESQUEMA.Create(self);
  frmCadTARVESQUEMA.ShowModal;
  frmCadTARVESQUEMA.Free;
end;

procedure TfrmMenuPrin.TabularBIClick(Sender: TObject);
begin
  frmBITabular := TfrmBITabular.Create(self);
  frmBITabular.ShowModal;
  frmBITabular.Free;
end;

procedure TfrmMenuPrin.actRelGeralProgramaExecute(Sender: TObject);
begin
  frmRelGeralPrograma := TfrmRelGeralPrograma.Create(self);
  frmRelGeralPrograma.ShowModal;
  frmRelGeralPrograma.Free;
end;

procedure TfrmMenuPrin.testeClick(Sender: TObject);
begin
  frmEDI := TfrmEDI.Create(self);
  frmEDI.ShowModal;
  frmEDI.Free;
end;

procedure TfrmMenuPrin.actAtendimentosExecute(Sender: TObject);
begin
  frmCadAtendimentos := TfrmCadAtendimentos.Create(self);
  frmCadAtendimentos.ShowModal;
  frmCadAtendimentos.Free;
end;

procedure TfrmMenuPrin.actCadTestesPositivosExecute(Sender: TObject);
begin
  frmCadtestesPositivos := TfrmCadtestesPositivos.Create(self);
  frmCadtestesPositivos.ShowModal;
  frmCadtestesPositivos.Free;
end;

procedure TfrmMenuPrin.actEsquemaExecute(Sender: TObject);
begin
  frmCadEsquema := TfrmCadEsquema.Create(self);
  frmCadEsquema.ShowModal;
  frmCadEsquema.Free;
end;

procedure TfrmMenuPrin.actTARVAcompanhamentoExecute(Sender: TObject);
begin
  frmCadTARVACOMP := TfrmCadTARVACOMP.Create(self);
  frmCadTARVACOMP.ShowModal;
  frmCadTARVACOMP.Free;
end;

procedure TfrmMenuPrin.actTARVCD4Execute(Sender: TObject);
begin
  frmCadTARVCD4 := TfrmCadTARVCD4.Create(self);
  frmCadTARVCD4.ShowModal;
  frmCadTARVCD4.Free;
end;

procedure TfrmMenuPrin.actRelGeralAgendaExecute(Sender: TObject);
begin
  frmRelGeralAgenda := TfrmRelGeralAgenda.Create(self);
  frmRelGeralAgenda.ShowModal;
  frmRelGeralAgenda.Free;
end;

procedure TfrmMenuPrin.Exames1Click(Sender: TObject);
begin
  frmCadExame := TfrmCadExame.Create(Application);
  frmCadExame.ShowModal;
  frmCadExame.Free;
end;

procedure TfrmMenuPrin.LogSQL1Click(Sender: TObject);
begin
  frmLogSQL := TfrmLogSQL.Create(Self);
  frmLogSQL.mmLog.Text := dmGeral.LogSQL.Text;
  frmLogSQL.ShowModal;
  frmLogSQL.Free;
end;

procedure TfrmMenuPrin.CD41Click(Sender: TObject);
begin
  frmCadCD4 := TfrmCadCD4.Create(application);
  frmCadCD4.ShowModal;
  frmCadCD4.Free;
end;

procedure TfrmMenuPrin.actListagemGeralExamesExecute(Sender: TObject);
begin
  frmRelListagemGeralExames := TfrmRelListagemGeralExames.Create(application);
  frmRelListagemGeralExames.ShowModal;
  frmRelListagemGeralExames.Free;
end;

procedure TfrmMenuPrin.CID101Click(Sender: TObject);
begin
  frmCID10 := TfrmCID10.Create(Application);
  frmCID10.ShowModal;
  frmCID10.Free;
end;

procedure TfrmMenuPrin.EsquemasTotal1Click(Sender: TObject);
begin
  frmConEsquemaTotal := TfrmConEsquemaTotal.Create(nil);
  frmConEsquemaTotal.ShowModal;
  frmConEsquemaTotal.Free;
end;

procedure TfrmMenuPrin.ProdutividadeMedicoporPerodo1Click(Sender: TObject);
begin
  frmConProdutividadeMedico := TfrmConProdutividadeMedico.Create(nil);
  frmConProdutividadeMedico.ShowModal;
  frmConProdutividadeMedico.Free;
end;

procedure TfrmMenuPrin.EsquemasProcessoTotal1Click(Sender: TObject);
begin
  frmConEsquemaProcessoTotal := TfrmConEsquemaProcessoTotal.Create(nil);
  frmConEsquemaProcessoTotal.ShowModal;
  frmConEsquemaProcessoTotal.Free;
end;

procedure TfrmMenuPrin.actRelTransferenciaExecute(Sender: TObject);
begin
  frmRelTransferencia := TfrmRelTransferencia.Create(nil);
  frmRelTransferencia.ShowModal;
  frmRelTransferencia.Free;
end;

procedure TfrmMenuPrin.actCadServicosCPNExecute(Sender: TObject);
begin
  frmCadServicosCPN := TfrmCadServicosCPN.Create(nil);
  frmCadServicosCPN.ShowModal;
  frmCadServicosCPN.Free;
end;

procedure TfrmMenuPrin.actCadCriancaExpostaExecute(Sender: TObject);
begin
  frmCadCriancaExposta := TfrmCadCriancaExposta.Create(nil);
  frmCadCriancaExposta.ShowModal;
  frmCadCriancaExposta.Free;
end;

procedure TfrmMenuPrin.actCadServicosAtExecute(Sender: TObject);
begin
  frmCadServicoAT := TfrmCadServicoAT.Create(nil);
  frmCadServicoAT.ShowModal;
  frmCadServicoAT.Free;
end;

procedure TfrmMenuPrin.actCadServicosTARVExecute(Sender: TObject);
begin
  frmCadServicosTARV := TfrmCadServicosTARV.Create(nil);
  frmCadServicosTARV.ShowModal;
  frmCadServicosTARV.Free;
end;

procedure TfrmMenuPrin.ServicoTARVUnidade1Click(Sender: TObject);
begin
  frmCadServicosTARVUnidade := TfrmCadServicosTARVUnidade.Create(nil);
  frmCadServicosTARVUnidade.ShowModal;
  frmCadServicosTARVUnidade.Free;
end;

procedure TfrmMenuPrin.FormResize(Sender: TObject);
begin
  PNGButton3.Left := imgFundo.Width - 100;
  PNGButton3.top := imgFundo.Top + 25;
  PNGButton2.Left := imgFundo.Width - 100;
  PNGButton2.top := PNGButton3.top + 72;
  PNGButton1.Left := imgFundo.Width - 100;
  PNGButton1.top := PNGButton2.top + 72;
  pEDI.Left := imgFundo.Width - 380;
end;

procedure TfrmMenuPrin.PNGButton1Click(Sender: TObject);
begin
  WinExec('c:\Compware\Remoto.exe',sw_show);
end;

procedure TfrmMenuPrin.ProtocoloClick(Sender: TObject);
begin
  frmProtocoloEnvio := TfrmProtocoloEnvio.Create(Application);
  frmProtocoloEnvio.ShowModal;
  frmProtocoloEnvio.Free;
end;

procedure TfrmMenuPrin.ConfirmaoEDI1Click(Sender: TObject);
begin
  frmConfirmacaoEDI := TfrmConfirmacaoEDI.Create(Application);
  frmConfirmacaoEDI.ShowModal;
  frmConfirmacaoEDI.Free;
end;

procedure TfrmMenuPrin.ServicosClick(Sender: TObject);
begin
  frmCadServicos := TfrmCadServicos.Create(Application);
  frmCadServicos.ShowModal;
  frmCadServicos.Free;
end;

procedure TfrmMenuPrin.btConfirmacaoEDIClick(Sender: TObject);
begin
  ConfirmaoEDI1Click(Sender);
end;

procedure TfrmMenuPrin.RelatriodeUnidades1Click(Sender: TObject);
begin
  frmRelUnidadesImp := TfrmRelUnidadesImp.Create(Application);
  frmRelUnidadesImp.ShowModal;
  frmRelUnidadesImp.Free;
end;

procedure TfrmMenuPrin.SpeedButton1Click(Sender: TObject);
begin
    ProtocoloClick(Sender);
end;

procedure TfrmMenuPrin.PNGButton3Click(Sender: TObject);
var sCaminho:String;
begin
  sCaminho := 'c:\compware\EDI.exe';
  tmEDI.Enabled := true;
  qyParametro.Open;
  pEDI.Visible := true;
  PNGButton3.Enabled := false;
  iEDI.Visible := true;
  ShellExecute(Handle,'open',pchar(sCaminho),nil,nil,SW_SHOWMINIMIZED);
end;

procedure TfrmMenuPrin.PNGButton2Click(Sender: TObject);
begin
  WinExec('c:\Compware\SincPen.exe',SW_SHOW);
end;

procedure TfrmMenuPrin.tmEDITimer(Sender: TObject);
var sCaminho:String;
begin
  sCaminho := 'c:\compware\EDI.exe';
  qyParametro.Close;
  qyParametro.Open;

  if qyParametroVALOR.AsString = 'EDI - Inicio:' then
  begin
    //gEDI.Visible := true;
    lStatus.Caption := qyParametroVALOR.AsString + ' ' +
      DateToStr(DM.GetDate) + ' ' + TimeToStr(DM.GetTime);
    lStatus.Visible := true;
  end;

  if qyParametroVALOR.AsString = 'Exportar!' then
  begin
   lExportar.Caption := qyParametroVALOR.AsString;
   lExportar.Visible := true;
   iExportar.Visible := true;
  end;

  if qyParametroVALOR.AsString = 'Enviar!' then
  begin
   lEnviar.Caption := qyParametroVALOR.AsString;
   lEnviar.Visible := true;
   iEnviar.Visible := true;
  end;

  if qyParametroVALOR.AsString = 'Receber!' then
  begin
   lReceber.Caption := qyParametroVALOR.AsString;
   lReceber.Visible := true;
   iReceber.Visible := true;
  end;

  if qyParametroVALOR.AsString = 'Importar!' then
  begin
   lImportar.Caption := qyParametroVALOR.AsString;
   lImportar.Visible := true;
   iImportar.Visible := true;
  end;

  if qyParametroVALOR.AsString = 'EDI - Fim:' then
  begin
    lStatus2.Caption := qyParametroVALOR.AsString + ' ' +
      DateToStr(DM.GetDate) + ' ' + TimeToStr(DM.GetTime);
    lStatus2.Visible := true;
    PostMessage(FindWindow(nil, 'EDI - Data Interchange'), WM_QUIT,0,0);
    tmEDI.Enabled := false;
    //gEDI.Visible := false;
    btFecharEDI.Visible := true;
    qyParametro.Close;
  end;

  if qyParametroVALOR.AsString = 'Erro:' then
  begin
    lStatus2.Caption := qyParametroVALOR.AsString + ' Sem conexão ' +
      DateToStr(DM.GetDate) + ' ' + TimeToStr(DM.GetTime);
    lStatus2.Visible := true;
    lStatus2.Font.Color := clRed;
    PostMessage(FindWindow(nil, 'EDI - Data Interchange'), WM_QUIT,0,0);
    tmEDI.Enabled := false;
    //gEDI.Visible := false;
    btFecharEDI.Visible := true;
    qyParametro.Close;
  end;
end;

procedure TfrmMenuPrin.btFecharEDIClick(Sender: TObject);
begin
  lStatus.Visible := false;
  lStatus2.Visible := false;
  lStatus2.Font.Color := clWhite;
  lExportar.Visible := false;
  iExportar.Visible := false;
  lEnviar.Visible := false;
  iEnviar.Visible := false;
  lReceber.Visible := false;
  iReceber.Visible := false;
  lImportar.Visible := false;
  iImportar.Visible := false;
  btfecharEDI.Visible := false;
  pEDI.Visible := false;
  iEDI.Visible := true;
  PNGButton3.Enabled := true;
end;

procedure TfrmMenuPrin.actNotGestExecute(Sender: TObject);
begin
  frmCadNotGestante := TfrmCadNotGestante.Create(Application);
  frmCadNotGestante.ShowModal;
  frmCadNotGestante.Free;
end;

procedure TfrmMenuPrin.este1Click(Sender: TObject);
begin
  frmRelSerieCronologica := TfrmRelSerieCronologica.Create(Application);
  frmRelSerieCronologica.ShowModal;
  frmRelSerieCronologica.Free;
end;

procedure TfrmMenuPrin.AtualizaVersaoUnidadesWeb1Click(Sender: TObject);
begin
  dmGeral.GetVersaoUnidadesWeb;
end;

procedure TfrmMenuPrin.RelatriodosRelatrios1Click(Sender: TObject);
begin
  frmRR := TfrmRR.Create(Application);
  frmRR.ShowModal;
  frmRR.Free;
end;

procedure TfrmMenuPrin.EDIRemoto1Click(Sender: TObject);
begin
  if not dmClienteEDI.dcmEDI.Connected then
    dmClienteEDI.dcmEDI.Connected := true;
  dmClienteEDI.dcmEDI.AppServer.RodaEDI;
end;

procedure TfrmMenuPrin.AuditoriaAnual1Click(Sender: TObject);
begin
  frmPainelAR := TfrmPainelAR.Create(Application);
  frmPainelAR.ShowModal;
  frmPainelAR.Free;
end;

procedure TfrmMenuPrin.AuditoriadeRelatrios1Click(Sender: TObject);
begin
  frmAuditoriaRelatorios := TfrmAuditoriaRelatorios.Create(Application);
  frmAuditoriaRelatorios.ShowModal;
  frmAuditoriaRelatorios.Free;
end;

procedure TfrmMenuPrin.SpeedButton3Click(Sender: TObject);
begin
  AuditoriadeRelatrios1Click(sender);
end;

procedure TfrmMenuPrin.RelatriodeUnidades2Click(Sender: TObject);
begin
  frmRelUnidades := TfrmRelUnidades.Create(Application);
  frmRelUnidades.ShowModal;
  frmRelUnidades.Free;
end;

procedure TfrmMenuPrin.estagem1Click(Sender: TObject);
begin
  frmCadMapaTestagem := TfrmCadMapaTestagem.Create(Application);
  frmCadMapaTestagem.ShowModal;
  frmCadMapaTestagem.Free;
end;

procedure TfrmMenuPrin.Mdico1Click(Sender: TObject);
begin
  frmCadMapaMedico := TfrmCadMapaMedico.Create(Application);
  frmCadMapaMedico.ShowModal;
  frmCadMapaMedico.Free;
end;

procedure TfrmMenuPrin.ExportNotificao1Click(Sender: TObject);
begin
 frmRelNotificacao := TfrmRelNotificacao.Create(Application);
 frmRelNotificacao.ShowModal;
 frmRelNotificacao.Free;
end;

procedure TfrmMenuPrin.Laboratrio1Click(Sender: TObject);
begin
  frmCadMapaLaboratorio := TfrmCadMapaLaboratorio.Create(Application);
  frmCadMapaLaboratorio.ShowModal;
  frmCadMapaLaboratorio.Free;
end;

procedure TfrmMenuPrin.esteRpido1Click(Sender: TObject);
begin
  frmCadMapaTesteRapido := TfrmCadMapaTesteRapido.Create(Application);
  frmCadMapaTesteRapido.ShowModal;
  frmCadMapaTesteRapido.Free;
end;

procedure TfrmMenuPrin.ExtratodoPaciente1Click(Sender: TObject);
begin
 frmRelExtratoPaciente := TfrmRelExtratoPaciente.Create(Application);
 frmRelExtratoPaciente.ShowModal;
 frmRelExtratoPaciente.Free;
end;

procedure TfrmMenuPrin.ExtratoporPerodo1Click(Sender: TObject);
begin
  frmRelMapaMedicoPeriodo := TfrmRelMapaMedicoPeriodo.Create(Application);
  frmRelMapaMedicoPeriodo.ShowModal;
  frmRelMapaMedicoPeriodo.Free;
end;

procedure TfrmMenuPrin.Filter1Click(Sender: TObject);
begin
  frmGridFilter := TfrmGridFilter.Create(Application);
  frmGridFilter.ShowModal;
  frmGridFilter.Free;
end;

procedure TfrmMenuPrin.FarmaciaClick(Sender: TObject);
begin
 frmCadMapaFarmacia := TfrmCadMapaFarmacia.Create(Application);
 frmCadMapaFarmacia.ShowModal;
 frmCadMapaFarmacia.Free;
end;

procedure TfrmMenuPrin.imCorrecao1Click(Sender: TObject);
begin
  frmCorrecao1 := TfrmCorrecao1.Create(Application);
  frmCorrecao1.ShowModal;
  frmCorrecao1.Free;
end;

procedure TfrmMenuPrin.imCorrecao2Click(Sender: TObject);
begin
  frmCorrecao2 := TfrmCorrecao2.Create(Application);
  frmCorrecao2.ShowModal;
  frmCorrecao2.Free;
end;

procedure TfrmMenuPrin.imCorrecao3Click(Sender: TObject);
begin
  frmCorrecao3 := TfrmCorrecao3.Create(Application);
  frmCorrecao3.ShowModal;
  frmCorrecao3.Free;
end;

procedure TfrmMenuPrin.Forma1Click(Sender: TObject);
begin
  frmCadForma := TfrmCadForma.Create(Application);
  frmCadForma.ShowModal;
  frmCadForma.Free;
end;

procedure TfrmMenuPrin.Gestantes1Click(Sender: TObject);
begin
  frmRelGestante := TfrmRelGestante.Create(Application);
  frmRelGestante.ShowModal;
  frmRelGestante.Free;
end;

procedure TfrmMenuPrin.CrianaExpostaClick(Sender: TObject);
begin
  frmCadMapaCriancaExposta := TfrmCadMapaCriancaExposta.Create(Application);
  frmCadMapaCriancaExposta.ShowModal;
  frmCadMapaCriancaExposta.Free;
end;

procedure TfrmMenuPrin.CrianaExposta1Click(Sender: TObject);
begin
  frmRelCriancaExpDPIAlto := TfrmRelCriancaExpDPIAlto.Create(Application);
  frmRelCriancaExpDPIAlto.ShowModal;
  frmRelCriancaExpDPIAlto.Free;
end;

procedure TfrmMenuPrin.CrianaExpostacommaisde18meses1Click(
  Sender: TObject);
begin
  frmRelCriancaExpFechamento := TfrmRelCriancaExpFechamento.Create(Application);
  frmRelCriancaExpFechamento.ShowModal;
  frmRelCriancaExpFechamento.Free;
end;

procedure TfrmMenuPrin.ControleGestantes1Click(Sender: TObject);
begin
  frmControleGestantes := TfrmControleGestantes.Create(Application);
  frmControleGestantes.ShowModal;
  frmControleGestantes.Free;
end;

procedure TfrmMenuPrin.Farmcia1Click(Sender: TObject);
begin
  frmRelProdFarmacia := TfrmRelProdFarmacia.Create(Application);
  frmRelProdFarmacia.ShowModal;
  frmRelProdFarmacia.Free; 
end;

procedure TfrmMenuPrin.Laboratrio2Click(Sender: TObject);
begin
  frmRelProdLaboratorio := TfrmRelProdLaboratorio.Create(Application);
  frmRelProdLaboratorio.ShowModal;
  frmRelProdLaboratorio.Free;
end;

procedure TfrmMenuPrin.Agendas1Click(Sender: TObject);
begin
  frmRelProdAgendas := TfrmRelProdAgendas.Create(Application);
  frmRelProdAgendas.ShowModal;
  frmRelProdAgendas.Free;
end;

procedure TfrmMenuPrin.RelatriosFixos1Click(Sender: TObject);
begin
  frmRelFixos := TfrmRelFixos.Create(Application);
  frmRelFixos.ShowModal;
  frmRelFixos.Free;
end;

procedure TfrmMenuPrin.RelatriosQuantitativoClick(Sender: TObject);
begin
  frmRelQuantitativo := TfrmRelQuantitativo.Create(Application);
  frmRelQuantitativo.ShowModal;
  frmRelQuantitativo.Free;
end;

end.
