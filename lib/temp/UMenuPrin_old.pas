unit UMenuPrin_old;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ActnList, Menus, ImgList, ComCtrls, ToolWin, ExtCtrls, Grids,
  XPMan, ActnMan, ActnColorMaps, Buttons, jpeg, RXCtrls, TeeProcs,
  TeEngine, Chart, DB, DbChart, Series, inifiles, IBCustomDataSet, IBQuery,
  Animate, GIFCtrl, ActnCtrls, ActnMenus, StdCtrls, XPStyleActnCtrls,
  AppEvnts, pngextra, shellapi, RxGIF, pngimage, frxClass,frxChBox, frxDBSet,
  GIFImage;

type
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

  private
    { Private declarations }
    procedure Habilita_Menu(bAdmin:boolean);
    procedure Mostrar(pn,pg:TPanel; bt:TSpeedButton);
    procedure ViewDash(codigo:integer);
    procedure AbreTela(frm:TFormClass);
  public
    { Public declarations }
  end;

var
  frmMenuPrin: TfrmMenuPrin;

implementation

uses UDM, UDMGERAL, UGeral, UfrmStatus, uCadUsuario, uCadUnidade, UfrmLogin,
     uCadPais, uCadProvincia, uCadMunicipio, uCadNotGestante

{
    uCadNotificacao, uCadDashBoard,
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
  ufrmConfirmacaoEDI, uCadServicos,
  UfrmRelUnidades, ;
}
, UfrmAdminPermissao, uCadParametro;


{$R *.dfm}

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
      end;
      Next;
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
        Action:=caFree;//Ação do objeto TcloseAtion para fechar a tela
      end;
      frmStatus.close;
    end
    else
      Action:=caNone;//Ação do objeto TcloseAtion para não fechar a tela

end;

procedure TfrmMenuPrin.actUsuarioExecute(Sender: TObject);
begin
  AbreTela(TfrmCadUsuario);
end;

procedure TfrmMenuPrin.FormCreate(Sender: TObject);
var sPath:String; fini:TIniFile;
begin
  if prmImgFundo <> STRING_INDEFINIDO  then
    imgFundo.Picture.LoadFromFile(prmImgFundo);
    
  frmMenuPrin.Caption := 'SIS - Sistema de Informações da Saúde ( Versão: ' + prmVersao + ' )';
  spath := ExtractFilePath(Application.ExeName);
  fini := TIniFile.Create(sPath+'\compware.ini');
  //sPathLayout := fini.ReadString('Geral','Rave','c:\Compware\Layout');
  fini.Free;
  sPathGrid := spath  + 'Grid\' + sLogin;

  if not DirectoryExists(sPathGrid) then
    MkDir(sPathGrid);

  {for i:=0 to ComponentCount-1 do
    if (Components[i] is TLabel) then
        if((Components[i] as TLabel).Tag = 1) then
           (Components[i] as TLabel).Font.Color := clWhite;}
end;


procedure TfrmMenuPrin.actAdminPermissaoExecute(Sender: TObject);
begin
  frmAdminPermissao:=TfrmAdminPermissao.Create(self);//Criação manual
  frmAdminPermissao.ShowModal;//exibe a tela no modo modal
  frmAdminPermissao.Free;//Libera a tela da memória
end;

procedure TfrmMenuPrin.FormShow(Sender: TObject);
begin
  if (DM.qyLoginNM_LOGIN.AsString <> 'ADMIN') and
    (DM.qyLoginDS_SENHA.AsString <> 'COMPWARE') then
    Habilita_Menu(false)
  else
    Habilita_Menu(true);

  sPathTemp := ExtractFilePath(Application.ExeName)+'\Temp\';
  sPathConsulta := ExtractFilePath(Application.ExeName)+'Consulta\';
  sPathScript := ExtractFilePath(Application.ExeName)+'Script\';

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
  AbreTela(TfrmConfRelatorio);
end;

procedure TfrmMenuPrin.actUnidadeExecute(Sender: TObject);
begin
  AbreTela(TfrmCadUnidade);
end;

procedure TfrmMenuPrin.actPaisExecute(Sender: TObject);
begin
  AbreTela(TfrmCadPais);
end;

procedure TfrmMenuPrin.actProvinciaExecute(Sender: TObject);
begin
  AbreTela(TfrmCadProvincia);
end;

procedure TfrmMenuPrin.actMunicipioExecute(Sender: TObject);
begin
  AbreTela(TfrmCadMunicipio);
end;

procedure TfrmMenuPrin.actNotificacaoExecute(Sender: TObject);
begin
{
  frmCadNotificacao := TfrmCadNotificacao.Create(self);
  frmCadNotificacao.ShowModal;
  frmCadNotificacao.Free;
}
end;

procedure TfrmMenuPrin.btNotificacaoClick(Sender: TObject);
begin
   actNotificacao.Execute;
end;

procedure TfrmMenuPrin.Mostrar(pn,pg:TPanel; bt:TSpeedButton);
var bmp:TBitmap;
begin
  bmp:=TBitmap.Create;
  try
    pn.Visible := not pn.Visible;
    if pn.Visible then
    begin
      pn.top := pg.top + pg.Height;
      imagelist2.GetBitmap(296,bmp);
    end
    else
      imagelist2.GetBitmap(296,bmp);

    bt.Glyph := bmp;
  finally
    FreeAndNil(bmp);
  end;
end;

procedure TfrmMenuPrin.actCadDashExecute(Sender: TObject);
begin
{
  frmCadDashBoard:=TfrmCadDashBoard.Create(self);
  frmCadDashBoard.ShowModal;
  frmCadDashBoard.Free;
}
end;

procedure TfrmMenuPrin.actViewDashExecute(Sender: TObject);
begin
  ViewDash(0);
end;

procedure TfrmMenuPrin.actPacienteExecute(Sender: TObject);
begin
{
  sCadastroPaciente := true;
  frmCadPaciente := TfrmCadPaciente.Create(self);
  frmCadPaciente.ShowModal;
  frmCadPaciente.Free;
  sCadastroPaciente := false;
}
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
{
  frmConsDuplicidade := TfrmConsDuplicidade.Create(self);
  frmConsDuplicidade.ShowModal;
  frmConsDuplicidade.Free;
}
end;

procedure TfrmMenuPrin.AbandonosClick(Sender: TObject);
begin
{
  frmConsAbandono := TfrmConsAbandono.Create(self);
  frmConsAbandono.ShowModal;
  frmConsAbandono.Free;
}
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
{
  frmViewDash := TfrmViewDash.Create(frmMenuPrin);
  frmViewDash.Codigo := codigo;
  frmViewDash.ShowModal;
  FreeAndNil(frmViewDash);
}
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
{
  frmCadATV := TfrmCadATV.Create(self);
  frmCadATV.ShowModal;
  frmCadATV.Free;
}
end;

procedure TfrmMenuPrin.actOcupacaoExecute(Sender: TObject);
begin
{
  frmCadOcupacao := TfrmCadOcupacao.Create(self);
  frmCadOcupacao.ShowModal;
  frmCadOcupacao.Free;
}
end;

procedure TfrmMenuPrin.actTipoDocumentoExecute(Sender: TObject);
begin
{
  frmCadTipoDocumento := TfrmCadTipoDocumento.Create(self);
  frmCadTipoDocumento.ShowModal;
  frmCadTipoDocumento.Free;
}
end;

procedure TfrmMenuPrin.actMedicoExecute(Sender: TObject);
begin
{
  frmCadMedico := TfrmCadMedico.Create(self);
  frmCadMedico.ShowModal;
  frmCadMedico.Free;
}
end;

procedure TfrmMenuPrin.GeralNotificacaoClick(Sender: TObject);
begin
{
  frmRelGeralNotificacao := TfrmRelGeralNotificacao.Create(Application);
  frmRelGeralNotificacao.ShowModal;
  frmRelGeralNotificacao.Free;
}
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
{
  frmCadAgenda := TfrmCadAgenda.Create(self);
  frmCadAgenda.ShowModal;
  frmCadAgenda.Free;
}
end;

procedure TfrmMenuPrin.ListagemUtenteClick(Sender: TObject);
begin
{
  sListagemPaciente := true;
  frmCadPaciente := TfrmCadPaciente.Create(self);
  frmCadPaciente.ShowModal;
  frmCadPaciente.Free;
  sListagemPaciente := false;
}
end;

procedure TfrmMenuPrin.actParametroExecute(Sender: TObject);
begin
  frmCadParametro := TfrmCadParametro.Create(self);
  frmCadParametro.ShowModal;
  frmCadParametro.Free;
end;

procedure TfrmMenuPrin.actCadPTVExecute(Sender: TObject);
begin
{
  frmCadPTV := TfrmCadPTV.Create(self);
  frmCadPTV.ShowModal;
  frmCadPTV.Free;
}
end;

procedure TfrmMenuPrin.actInvestigadorExecute(Sender: TObject);
begin
{
  frmCadInvestigador := TfrmCadInvestigador.Create(self);
  frmCadInvestigador.ShowModal;
  frmCadInvestigador.Free;
}
end;

procedure TfrmMenuPrin.TARVClick(Sender: TObject);
begin
{
  frmCadTARV := TfrmCadTARV.Create(self);
  frmCadTARV.ShowModal;
  frmCadTARV.Free;
}
end;

procedure TfrmMenuPrin.Scripts1Click(Sender: TObject);
begin
{
  frmMetaDados := TfrmMetaDados.Create(self);
  frmMetaDados.ShowModal;
  frmMetaDados.Free;
}
end;

procedure TfrmMenuPrin.actCaracterizacaoExecute(Sender: TObject);
begin
{
  frmCadCaracterizacao := TfrmCadCaracterizacao.Create(self);
  frmCadCaracterizacao.ShowModal;
  frmCadCaracterizacao.Free;
}
end;

procedure TfrmMenuPrin.actProgramaExecute(Sender: TObject);
begin
{
  frmCadPrograma := TfrmCadPrograma.Create(self);
  frmCadPrograma.ShowModal;
  frmCadPrograma.Free;
}
end;

procedure TfrmMenuPrin.actRelGeralCaracterizacaoExecute(Sender: TObject);
begin
{
  frmRelGeralCaracterizacao := TfrmRelGeralCaracterizacao.Create(self);
  frmRelGeralCaracterizacao.ShowModal;
  frmRelGeralCaracterizacao.Free;
}
end;

procedure TfrmMenuPrin.EDI1Click(Sender: TObject);
begin
{
  frmEDI := TfrmEDI.Create(self);
  frmMenuEDI := TfrmMenuEDI.Create(self);
  frmMenuEDI.ShowModal;
  frmEDI.Free;
  frmMenuEDI.Free;
}
end;

procedure TfrmMenuPrin.actCoinfeccaoExecute(Sender: TObject);
begin
{
  frmCadCOINFECCAO := TfrmCadCOINFECCAO.Create(self);
  frmCadCOINFECCAO.ShowModal;
  frmCadCOINFECCAO.Free;
}
end;

procedure TfrmMenuPrin.actTARVEsquemaExecute(Sender: TObject);
begin
{
  frmCadTARVESQUEMA := TfrmCadTARVESQUEMA.Create(self);
  frmCadTARVESQUEMA.ShowModal;
  frmCadTARVESQUEMA.Free;
}
end;

procedure TfrmMenuPrin.TabularBIClick(Sender: TObject);
begin
{
  frmBITabular := TfrmBITabular.Create(self);
  frmBITabular.ShowModal;
  frmBITabular.Free;
}
end;

procedure TfrmMenuPrin.actRelGeralProgramaExecute(Sender: TObject);
begin
{
  frmRelGeralPrograma := TfrmRelGeralPrograma.Create(self);
  frmRelGeralPrograma.ShowModal;
  frmRelGeralPrograma.Free;
}
end;

procedure TfrmMenuPrin.testeClick(Sender: TObject);
begin
{
  frmEDI := TfrmEDI.Create(self);
  frmEDI.ShowModal;
  frmEDI.Free;
}
end;

procedure TfrmMenuPrin.actAtendimentosExecute(Sender: TObject);
begin
{
  frmCadAtendimentos := TfrmCadAtendimentos.Create(self);
  frmCadAtendimentos.ShowModal;
  frmCadAtendimentos.Free;
}
end;

procedure TfrmMenuPrin.actCadTestesPositivosExecute(Sender: TObject);
begin
{
  frmCadtestesPositivos := TfrmCadtestesPositivos.Create(self);
  frmCadtestesPositivos.ShowModal;
  frmCadtestesPositivos.Free;
}
end;

procedure TfrmMenuPrin.actEsquemaExecute(Sender: TObject);
begin
{
  frmCadEsquema := TfrmCadEsquema.Create(self);
  frmCadEsquema.ShowModal;
  frmCadEsquema.Free;
}
end;

procedure TfrmMenuPrin.actTARVAcompanhamentoExecute(Sender: TObject);
begin
{
  frmCadTARVACOMP := TfrmCadTARVACOMP.Create(self);
  frmCadTARVACOMP.ShowModal;
  frmCadTARVACOMP.Free;
}
end;

procedure TfrmMenuPrin.actTARVCD4Execute(Sender: TObject);
begin
{
  frmCadTARVCD4 := TfrmCadTARVCD4.Create(self);
  frmCadTARVCD4.ShowModal;
  frmCadTARVCD4.Free;
}
end;

procedure TfrmMenuPrin.actRelGeralAgendaExecute(Sender: TObject);
begin
{
  frmRelGeralAgenda := TfrmRelGeralAgenda.Create(self);
  frmRelGeralAgenda.ShowModal;
  frmRelGeralAgenda.Free;
}
end;

procedure TfrmMenuPrin.Exames1Click(Sender: TObject);
begin
{
  frmCadExame := TfrmCadExame.Create(Application);
  frmCadExame.ShowModal;
  frmCadExame.Free;
}
end;

procedure TfrmMenuPrin.LogSQL1Click(Sender: TObject);
begin
{
  frmLogSQL := TfrmLogSQL.Create(Self);
  frmLogSQL.mmLog.Text := dmGeral.LogSQL.Text;
  frmLogSQL.ShowModal;
  frmLogSQL.Free;
}
end;

procedure TfrmMenuPrin.CD41Click(Sender: TObject);
begin
{
  frmCadCD4 := TfrmCadCD4.Create(application);
  frmCadCD4.ShowModal;
  frmCadCD4.Free;
}
end;

procedure TfrmMenuPrin.actListagemGeralExamesExecute(Sender: TObject);
begin
{
  frmRelListagemGeralExames := TfrmRelListagemGeralExames.Create(application);
  frmRelListagemGeralExames.ShowModal;
  frmRelListagemGeralExames.Free;
}
end;

procedure TfrmMenuPrin.CID101Click(Sender: TObject);
begin
{
  frmCID10 := TfrmCID10.Create(Application);
  frmCID10.ShowModal;
  frmCID10.Free;
}
end;

procedure TfrmMenuPrin.EsquemasTotal1Click(Sender: TObject);
begin
{
  frmConEsquemaTotal := TfrmConEsquemaTotal.Create(nil);
  frmConEsquemaTotal.ShowModal;
  frmConEsquemaTotal.Free;
}
end;

procedure TfrmMenuPrin.ProdutividadeMedicoporPerodo1Click(Sender: TObject);
begin
{
  frmConProdutividadeMedico := TfrmConProdutividadeMedico.Create(nil);
  frmConProdutividadeMedico.ShowModal;
  frmConProdutividadeMedico.Free;
}
end;

procedure TfrmMenuPrin.EsquemasProcessoTotal1Click(Sender: TObject);
begin
{
  frmConEsquemaProcessoTotal := TfrmConEsquemaProcessoTotal.Create(nil);
  frmConEsquemaProcessoTotal.ShowModal;
  frmConEsquemaProcessoTotal.Free;
}
end;

procedure TfrmMenuPrin.actRelTransferenciaExecute(Sender: TObject);
begin
{
  frmRelTransferencia := TfrmRelTransferencia.Create(nil);
  frmRelTransferencia.ShowModal;
  frmRelTransferencia.Free;
}
end;

procedure TfrmMenuPrin.actCadServicosCPNExecute(Sender: TObject);
begin
{
  frmCadServicosCPN := TfrmCadServicosCPN.Create(nil);
  frmCadServicosCPN.ShowModal;
  frmCadServicosCPN.Free;
}
end;

procedure TfrmMenuPrin.actCadCriancaExpostaExecute(Sender: TObject);
begin
{
  frmCadCriancaExposta := TfrmCadCriancaExposta.Create(nil);
  frmCadCriancaExposta.ShowModal;
  frmCadCriancaExposta.Free;
}
end;

procedure TfrmMenuPrin.actCadServicosAtExecute(Sender: TObject);
begin
{
  frmCadServicoAT := TfrmCadServicoAT.Create(nil);
  frmCadServicoAT.ShowModal;
  frmCadServicoAT.Free;
}
end;

procedure TfrmMenuPrin.actCadServicosTARVExecute(Sender: TObject);
begin
{
  frmCadServicosTARV := TfrmCadServicosTARV.Create(nil);
  frmCadServicosTARV.ShowModal;
  frmCadServicosTARV.Free;
}
end;

procedure TfrmMenuPrin.ServicoTARVUnidade1Click(Sender: TObject);
begin
{
  frmCadServicosTARVUnidade := TfrmCadServicosTARVUnidade.Create(nil);
  frmCadServicosTARVUnidade.ShowModal;
  frmCadServicosTARVUnidade.Free;
}
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
{
  frmProtocoloEnvio := TfrmProtocoloEnvio.Create(Application);
  frmProtocoloEnvio.ShowModal;
  frmProtocoloEnvio.Free;
}
end;

procedure TfrmMenuPrin.ConfirmaoEDI1Click(Sender: TObject);
begin
{
  frmConfirmacaoEDI := TfrmConfirmacaoEDI.Create(Application);
  frmConfirmacaoEDI.ShowModal;
  frmConfirmacaoEDI.Free;
}
end;

procedure TfrmMenuPrin.ServicosClick(Sender: TObject);
begin
{
  frmCadServicos := TfrmCadServicos.Create(Application);
  frmCadServicos.ShowModal;
  frmCadServicos.Free;
}
end;

procedure TfrmMenuPrin.btConfirmacaoEDIClick(Sender: TObject);
begin
  ConfirmaoEDI1Click(Sender);
end;

procedure TfrmMenuPrin.RelatriodeUnidades1Click(Sender: TObject);
begin
{
  frmRelUnidades := TfrmRelUnidades.Create(Application);
  frmRelUnidades.ShowModal;
  frmRelUnidades.Free;
}
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
  AbreTela(TfrmCadNotGestante);
end;

procedure TfrmMenuPrin.AbreTela(frm: TFormClass);
begin
  Try
    TForm(frm) := frm.Create(Application);
    TForm(frm).Showmodal;
  Finally
    FreeAndNil(frm);
  End;
end;

end.
