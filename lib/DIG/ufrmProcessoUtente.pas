unit ufrmProcessoUtente;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uspViewPDF, uspWPViewPDFCompatible, ExtCtrls, uframArvore,
  Buttons, StdCtrls, Menus, DB, Grids, DBGrids, ComCtrls, DBCtrls,
  IBCustomDataSet, IBTable, ShellApi, imageenproc, ieview, imageenview,
  imageen, imageenio, iemview, uFramePaciente, WPCTRRich, WPTbar,
  WPRTEDefs, WPCTRMemo, WPRuler, Mask, dxExEdtr, dxCntner, dxTL, dxDBCtrl,
  dxDBGrid, printers, ExtDlgs, WPUtil, WPStrDlg, OleCtrls, SHDocVw, IBQuery,
  ImgList, dxDBTLCl, dxGrClms, uFrameFicha1, uFrameFicha2, uFrameFicha3,
  uFrameFicha4, uFrameMAPA, ToolEdit, RxLookup, Spin, CurrEdit, XPMan,
  uFrameFicha5;


type
  TfrmProcessoUtente = class(TForm)
    pnTopo: TPanel;
    Label1: TLabel;
    edProcesso: TEdit;
    btProcesso: TSpeedButton;
    MainMenu1: TMainMenu;
    Cadastro1: TMenuItem;
    Grupos1: TMenuItem;
    OpenDialog1: TOpenDialog;
    SaveDialog1: TSaveDialog;
    PopupMenu1: TPopupMenu;
    Editar1: TMenuItem;
    Importar1: TMenuItem;
    Redigitalizar1: TMenuItem;
    GruposModelo1: TMenuItem;
    ModeloDocumento1: TMenuItem;
    StatusBar1: TStatusBar;
    lbNome: TLabel;
    Propriedade1: TMenuItem;
    Help1: TMenuItem;
    Verso10021: TMenuItem;
    N1: TMenuItem;
    InfoEstatistica1: TMenuItem;
    pgGeral: TPageControl;
    tabProcesso: TTabSheet;
    tabDados: TTabSheet;
    Panel1: TPanel;
    pnCentro: TPanel;
    Splitter1: TSplitter;
    framArvore1: TframArvore;
    Grupo: TSpeedButton;
    btRotacionar: TSpeedButton;
    btZoomMais: TSpeedButton;
    btZoomMenos: TSpeedButton;
    btExcluir: TSpeedButton;
    btEditor: TSpeedButton;
    btImportar: TSpeedButton;
    btExportar: TSpeedButton;
    tabHistEdt: TTabSheet;
    Panel2: TPanel;
    Panel3: TPanel;
    framPaciente1: TframPaciente;
    WPVertRuler1: TWPVertRuler;
    WPRuler1: TWPRuler;
    editor: TWPRichText;
    WPToolBar2: TWPToolBar;
    dsHistorico: TDataSource;
    Panel4: TPanel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    Label3: TLabel;
    DBEdit2: TDBEdit;
    Panel5: TPanel;
    btSalvarHistorico: TSpeedButton;
    btNovoHistorico: TSpeedButton;
    btExcluirHistorico: TSpeedButton;
    Splitter2: TSplitter;
    cbGrupo: TDBLookupComboBox;
    dsGrupo: TDataSource;
    dxDBGrid1: TdxDBGrid;
    gcData: TdxDBGridColumn;
    gcGrupo: TdxDBGridColumn;
    btRevisao: TSpeedButton;
    gcFilho: TdxDBGridColumn;
    Panel6: TPanel;
    ckMostrarRevisoes: TCheckBox;
    OpenPictureDialog1: TOpenPictureDialog;
    Image1: TImage;
    btImagem: TSpeedButton;
    btHorLine: TSpeedButton;
    btCabecalho: TSpeedButton;
    btRodape: TSpeedButton;
    tabHistorico: TTabSheet;
    Panel7: TPanel;
    dxDBGrid2: TdxDBGrid;
    dxDBGridColumn1: TdxDBGridColumn;
    dxDBGridColumn2: TdxDBGridColumn;
    dxDBGridColumn3: TdxDBGridColumn;
    Panel9: TPanel;
    CheckBox1: TCheckBox;
    Splitter3: TSplitter;
    Panel10: TPanel;
    Panel11: TPanel;
    Label4: TLabel;
    Label5: TLabel;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    dblkGrupo: TDBLookupComboBox;
    rEditor: TRichEdit;
    Panel8: TPanel;
    dxDBGrid2Column4: TdxDBGridColumn;
    tabEditor: TTabSheet;
    wpEditor: TWPRichText;
    SpeedButton1: TSpeedButton;
    tabPDF: TTabSheet;
    spWPViewPDFCompatible1: TspWPViewPDFCompatible;
    PrinterSetupDialog1: TPrinterSetupDialog;
    tabAgenda: TTabSheet;
    dsAgenda: TDataSource;
    grAgenda: TdxDBGrid;
    dxDBGridMaskColumn11: TdxDBGridMaskColumn;
    dxDBGridMaskColumn20: TdxDBGridMaskColumn;
    grAgendaColumn10: TdxDBGridColumn;
    dxDBGridMaskColumn12: TdxDBGridMaskColumn;
    dxDBGridColumn4: TdxDBGridColumn;
    grAgendaColumn9: TdxDBGridMaskColumn;
    dxDBGridMaskColumn17: TdxDBGridMaskColumn;
    dxDBGridMaskColumn18: TdxDBGridMaskColumn;
    grAgendaColumn8: TdxDBGridColumn;
    grAgendaColumn11: TdxDBGridColumn;
    grAgendaColumn12: TdxDBGridColumn;
    dtAgenda: TDateTimePicker;
    Label6: TLabel;
    btAtualizarAgenda: TSpeedButton;
    tabMapa: TTabSheet;
    grAgendaColumn13: TdxDBGridColumn;
    Panel12: TPanel;
    btConverteRTF_PDF: TButton;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    wbMapa: TWebBrowser;
    qyAgenda: TIBQuery;
    dsMapa: TDataSource;
    pnFiltroMedico: TPanel;
    btFiltroMedico: TSpeedButton;
    cbMedico: TDBLookupComboBox;
    Label7: TLabel;
    dsMedico: TDataSource;
    grAgendaColumn15: TdxDBGridImageColumn;
    ImageList1: TImageList;
    grAgendaColumn14: TdxDBGridImageColumn;
    tabFicha1: TTabSheet;
    framFicha11: TframFicha1;
    tabRX: TTabSheet;
    Panel13: TPanel;
    wbRX: TWebBrowser;
    dsRX: TDataSource;
    grRX: TDBGrid;
    qyRX: TIBQuery;
    qyRXNR_LAB: TIntegerField;
    qyRXDT_AGENDA: TDateTimeField;
    tabFicha2: TTabSheet;
    tabFicha4: TTabSheet;
    framFicha21: TframFicha2;
    qySeguimentoEnfermagem: TIBQuery;
    qySeguimentoEnfermagemCD_PACIENTE: TIntegerField;
    qySeguimentoEnfermagemDT_DIAGNOSTICO: TDateField;
    qyTriagemEnfermagem: TIBQuery;
    qyTriagemEnfermagemCD_PACIENTE: TIntegerField;
    qyTriagemEnfermagemDT_CADASTRO_2: TDateTimeField;
    qyModelo: TIBQuery;
    qyModeloCD_MODELO: TIntegerField;
    qyModeloDS_MODELO: TIBStringField;
    qyModeloCD_GRUPO: TIntegerField;
    qyModeloCD_DOCUMENTO: TIntegerField;
    qyModeloCD_GRUPO_DOC: TIntegerField;
    tabMapaMedico: TTabSheet;
    framFicha41: TframFicha4;
    framMapaMedico1: TframMapaMedico;
    qyGrupo: TIBQuery;
    qyGrupoFL_NOVO: TIntegerField;
    Grupos2: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    CID101: TMenuItem;
    N4: TMenuItem;
    DataSource1: TDataSource;
    qyAgenda2: TIBQuery;
    Consultas1: TMenuItem;
    ProdutividadePorPerodo1: TMenuItem;
    N5: TMenuItem;
    EsquemaTotal1: TMenuItem;
    EsquemaProcessoTotal1: TMenuItem;
    Label8: TLabel;
    qyMedicoParametro: TIBQuery;
    qyMedicoParametroCD_MEDICO: TIntegerField;
    qyMedicoParametroNM_MEDICO: TIBStringField;
    dsMedicoParametro: TDataSource;
    lkMedico: TRxLookupEdit;
    btLimparVinculo: TSpeedButton;
    btZoomFitW: TSpeedButton;
    Panel14: TPanel;
    Panel16: TPanel;
    Panel17: TPanel;
    Panel18: TPanel;
    pdf: TspWPViewPDFCompatible;
    Panel15: TPanel;
    Label9: TLabel;
    lbQtdPag: TLabel;
    btPagProxima: TSpeedButton;
    btPagAnterior: TSpeedButton;
    btPagPrimeira: TSpeedButton;
    btPagUltima: TSpeedButton;
    edPaginaAtual: TCurrencyEdit;
    Panel19: TPanel;
    btRecolher: TSpeedButton;
    btExpandir: TSpeedButton;
    Relatrios1: TMenuItem;
    ransferenciaporUtente1: TMenuItem;
    ImageList2: TImageList;
    ImageList3: TImageList;
	  tabNotificacao: TTabSheet;
    SBnotificacao: TScrollBox;
    XPManifest1: TXPManifest;
    Timer1: TTimer;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    SpeedButton5: TSpeedButton;
    btImpTodos: TSpeedButton;
    btImprimir: TSpeedButton;
    btConfImp: TSpeedButton;
    btNovoHist: TSpeedButton;
    btEditarHist: TSpeedButton;
    btCancelEditHist: TSpeedButton;
    btSalvarHist: TSpeedButton;
    tabFicha3: TTabSheet;
    framFicha31: TframFicha3;
    PopupMenu2: TPopupMenu;
    MarcarRealizado1: TMenuItem;
    btProcessarArquivo: TSpeedButton;
    procedure Grupos1Click(Sender: TObject);
    procedure btProcessoClick(Sender: TObject);
    procedure GrupoClick(Sender: TObject);
    procedure btRotacionarClick(Sender: TObject);
    procedure btZoomMaisClick(Sender: TObject);
    procedure btZoomMenosClick(Sender: TObject);
    procedure btEditorClick(Sender: TObject);
    procedure btImportarClick(Sender: TObject);
    procedure btExportarClick(Sender: TObject);
    procedure btExcluirClick(Sender: TObject);
    procedure btRecolherClick(Sender: TObject);
    procedure btExpandirClick(Sender: TObject);
    procedure PopupMenu1Popup(Sender: TObject);
    procedure Editar1Click(Sender: TObject);
    procedure Importar1Click(Sender: TObject);
    procedure GruposModelo1Click(Sender: TObject);
    procedure ModeloDocumento1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Propriedade1Click(Sender: TObject);
    procedure framArvore1tv2Change(Sender: TObject; Node: TTreeNode);
    procedure framArvore1tvChange(Sender: TObject; Node: TTreeNode);
    procedure framArvore1btSalvarGrupoClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure InfoEstatistica1Click(Sender: TObject);
    procedure btNovoHistoricoClick(Sender: TObject);
    procedure btExcluirHistoricoClick(Sender: TObject);
    procedure btSalvarHistoricoClick(Sender: TObject);
    procedure btRevisaoClick(Sender: TObject);
    procedure editorChange(Sender: TObject);
    procedure dxDBGrid1CustomDrawCell(Sender: TObject; ACanvas: TCanvas;
      ARect: TRect; ANode: TdxTreeListNode; AColumn: TdxTreeListColumn;
      ASelected, AFocused, ANewItemRow: Boolean; var AText: String;
      var AColor: TColor; AFont: TFont; var AAlignment: TAlignment;
      var ADone: Boolean);
    procedure ckMostrarRevisoesClick(Sender: TObject);
    procedure btImagemClick(Sender: TObject);
    procedure btHorLineClick(Sender: TObject);
    procedure btCabecalhoClick(Sender: TObject);
    procedure btRodapeClick(Sender: TObject);
    procedure btSalvarHistClick(Sender: TObject);
    procedure btNovoHistClick(Sender: TObject);
    procedure btEditarHistClick(Sender: TObject);
    procedure btCancelEditHistClick(Sender: TObject);
    procedure tabHistoricoShow(Sender: TObject);
    procedure tabHistoricoExit(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure btConverteRTF_PDFClick(Sender: TObject);
    procedure btConfImpClick(Sender: TObject);
    procedure btImpTodosClick(Sender: TObject);
    procedure edProcessoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure grAgendaDblClick(Sender: TObject);
    procedure dtAgendaChange(Sender: TObject);
    procedure btAtualizarAgendaClick(Sender: TObject);
    procedure pgGeralChange(Sender: TObject);
    procedure btFiltroMedicoClick(Sender: TObject);
    procedure edProcessoExit(Sender: TObject);
    procedure framFicha11btSalvarHistClick(Sender: TObject);
    procedure framFicha11btEditarHistClick(Sender: TObject);
    procedure qyRXBeforeOpen(DataSet: TDataSet);
    procedure qyRXAfterScroll(DataSet: TDataSet);
    procedure framFicha31btNovoClick(Sender: TObject);
    procedure framFicha31btSalvarClick(Sender: TObject);
    procedure framFicha31btPreviewClick(Sender: TObject);
    procedure framFicha31btEditarClick(Sender: TObject);
    procedure framFicha41btNovoClick(Sender: TObject);
    procedure framFicha41btAnteriorClick(Sender: TObject);
    procedure framFicha41btProximoClick(Sender: TObject);
    procedure framFicha31btAnteriorClick(Sender: TObject);
    procedure framFicha31btProximoClick(Sender: TObject);
    procedure framFicha21btEditarClick(Sender: TObject);
    procedure framFicha41btSalvarClick(Sender: TObject);
    procedure framFicha41btEditarClick(Sender: TObject);
    procedure framFicha41btConfImpClick(Sender: TObject);
    procedure framFicha41btPreviewClick(Sender: TObject);
    procedure framFicha41btImprimirClick(Sender: TObject);
    procedure framMapaMedico1btEditarClick(Sender: TObject);
    procedure framMapaMedico1btSalvarClick(Sender: TObject);
    procedure CID101Click(Sender: TObject);
    procedure ProdutividadePorPerodo1Click(Sender: TObject);
    procedure EsquemaTotal1Click(Sender: TObject);
    procedure EsquemaProcessoTotal1Click(Sender: TObject);
    procedure btLimparVinculoClick(Sender: TObject);
    procedure btZoomFitWClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure pdfPageChange(Sender: TObject);
    procedure edPaginaAtualChange(Sender: TObject);
    procedure btPagPrimeiraClick(Sender: TObject);
    procedure btPagAnteriorClick(Sender: TObject);
    procedure btPagProximaClick(Sender: TObject);
    procedure btPagUltimaClick(Sender: TObject);
    procedure edPaginaAtualKeyPress(Sender: TObject; var Key: Char);
    procedure edPaginaAtualExit(Sender: TObject);
    procedure ransferenciaporUtente1Click(Sender: TObject);
    procedure StatusBar1DrawPanel(StatusBar: TStatusBar;
      Panel: TStatusPanel; const Rect: TRect);
    procedure framFicha11btEditarClick(Sender: TObject);
    procedure framFicha11btSalvarClick(Sender: TObject);
    procedure framFicha31btConfImpClick(Sender: TObject);
    procedure framFicha31btImprimirClick(Sender: TObject);
    procedure MarcarRealizado1Click(Sender: TObject);
    procedure btProcessarArquivoClick(Sender: TObject);
    procedure framFicha11btNovoClick(Sender: TObject);
  private
    { Private declarations }
    procedure HabilitaBotoes(pbHabilitar:Boolean);
  public
    { Public declarations }
    FbAtualizando:boolean;
    procedure AtualizaDocumento(tv:TTreeView);
    procedure AdicionaLog(s:string);
    procedure tbHistoricoAfterScroll(DataSet: TDataSet);
    function SalvaArquivoDigital(pncdArquivo, pncdGrupo:integer):integer;
    function SalvaArquivoDigital2(pncdArquivo, pncdGrupo:integer):integer;
    function ImprimeRtfPDF:boolean;
    function SalvarDocumento:boolean;
    procedure ConsultaAgenda;
    procedure ConsultaAgendaMapa;
    procedure ApagaArquivoTemporario;
    procedure Mapa;
    //procedure ChangeDefaultPrinter(APrinterIndex: Integer);
  end;

var
  frmProcessoUtente: TfrmProcessoUtente;
  nOrdem:Integer;
  sNome, fNome, sProp, sSQLAgenda:string;
  fLog:TextFile;
  bk:TBookmark;
  bGerarArquivo:Boolean;

implementation

uses ufrmCadGrupoDoc, UDMDIG,  UDM, UfrmLocalizar, ufrmEditor,
  ufrmCadGrupoMod, ufrmCadModelo, ufrmDlgInfoDoc, ufrmCadProcesso,
  ufrmDlgStatus, ufrmInfoEstat, UDMGERAL, UGeral, ufrmConvertePDF,
  UGeralSQL, uCadCID10, UfrmConProdutividadeMedico, UfrmConEsquemaTotal,
  UfrmConEsquemaProcessoTotal, UfrmRelTransferencia, UCadNotificacao;

{$R *.dfm}

function ExisteNodo(tv:TTreeView; psNome:string; var pnd:TTreeNode):boolean;
var i:integer;
begin
   for  i:=0 to tv.Items.Count-1 do
     if tv.Items[i].Level=0 then
       if tv.Items[i].Text = psNome then
       begin
          pnd := tv.Items[i];
          result := true;
          exit;
       end;
end;

function ExisteArquivo(tv:TTreeView; pnArquivo:integer; var pnd:TTreeNode):boolean;
var i:integer;
begin
   for  i:=0 to pnd.Count-1 do
   begin
     pRec := pnd.Item[i].data;
     if (pRec.id = pnArquivo) then
     begin
        pnd := pnd.Item[i];
        result := true;
        exit;
     end;
   end;
end;

procedure TfrmProcessoUtente.Grupos1Click(Sender: TObject);
begin
  frmCadGrupoDoc := TfrmCadGrupoDoc.Create(nil);
  frmCadGrupoDoc.ShowModal;
  frmCadGrupoDoc.Free;
end;

procedure TfrmProcessoUtente.btProcessoClick(Sender: TObject);
var bExiste:Boolean; sNome:String;
begin
  pgGeral.ActivePage := tabProcesso;
  rEditor.Clear;
  framArvore1.tv.Items.Clear;
  pdf.Clear;

  //Validando Paciente
  dmDIG.qyPaciente.Close;
  dmDIG.qyPaciente.ParamByName('NR_PROCESSO').AsString := edProcesso.Text;
  dmDIG.qyPaciente.Open;
  if dmDIG.qyPaciente.IsEmpty then
  begin
    dmDIG.tbDig_Processo.Close;
    dmDIG.tbDig_Processo.ParamByName('NR_PROCESSO').AsString := edProcesso.Text;
    dmDIG.tbDig_Processo.Open;
    if not dmDIG.tbDig_Processo.IsEmpty then
      sNome := dmDIG.tbDig_Processo.FieldByName('NM_PACIENTE').AsString;
  end
  else
  begin
    sNome := dmDIG.qyPaciente.FieldByName('NM_PACIENTE').AsString;
    //Abre Grupo
    dmDig.tbDig_GrupoDoc.Open;
    //Abre Medico
    dmDig.qyMedico.Open;
    //Abre Paciente
    dmGeral.TB_PACIENTE.Close;
    dmGeral.TB_PACIENTE.Params.ByName('CD_PACIENTE').AsString :=
      dmDIG.qyPaciente.FieldByName('CD_PACIENTE').AsString;
    dmGeral.TB_PACIENTE.Params.ByName('CD_UND').AsString :=
      prmUnidade;
    dmGeral.TB_PACIENTE.Open;
    //Abre Historico
    dmDIG.tbHistorico.Close;
    dmDIG.tbHistorico.Params.ByName('CD_PACIENTE').AsString :=
      dmDIG.qyPaciente.FieldByName('CD_PACIENTE').AsString;
    dmDIG.tbHistorico.Open;
  end;
  //Abre Notificacao
  dmDIG.qyNotificacao.Close;
  dmDIG.qyNotificacao.Open;
  DMGERAL.TB_NOTIFICACAO.Close;
  DMGERAL.TB_NOTIFICACAO.DataSource := dmDig.dsNotificacao;
  DMGERAL.TB_NOTIFICACAO.Open;
  lbNome.Caption := sNome;

  if sNome='' then
  begin
    ShowMessage('Processo não cadastrado!');
    Exit;
  end;
  //--------------------
  HabilitaBotoes(sNome<>'');
  dmDIG.tbArquivo_Digital.Close;
  if edProcesso.Text<>'' then
    dmDIG.tbArquivo_Digital.ParamByName('NR_PROCESSO').AsString := edProcesso.Text
  else
    dmDIG.tbArquivo_Digital.ParamByName('NR_PROCESSO').Clear;
  dmDIG.tbArquivo_Digital.Open;
  bExiste := dmDIG.tbArquivo_Digital.RecordCount>0;

  if bExiste then
  begin
    dsHistorico.DataSet.AfterScroll := nil;
    framArvore1.CarregaArvore;
    dsHistorico.DataSet.AfterScroll := tbHistoricoAfterScroll;
  end
  else
  begin
    framArvore1.tv.Items.Clear;
    framArvore1.CarregaGrupo(true, framArvore1.tv);
  end;
  framArvore1.tv.SetFocus;
  tbHistoricoAfterScroll(dmDig.tbHistorico);

  //Abre Grupo
  dmDig.tbDig_GrupoDoc.Open;

  //Abre Medico
  dmDig.qyMedico.Open;

  framFicha11.AbreConsulta;
  framFicha21.AbreConsulta;
  framFicha31.AbreConsulta;
  framFicha41.AbreConsulta;

end;

procedure TfrmProcessoUtente.AtualizaDocumento(tv:TTreeView);
var nd:TTreeNode;
    id, nRotacao:integer;
    ms:TMemoryStream;
begin
  nd := tv.Selected;
  if nd <> nil then
  begin
    if nd.Level <> 0 then
    begin
      pRec := nd.Data;
      id := pRec.id;
      if (id>0) then
      begin
        ms := framArvore1.RetornaStreamBlob(id,sProp);
        try
         if Assigned(ms) then
         begin
           ms.Position := 0;
           pdf.LoadFromStream(ms,0);
           pdf.FitPage;
           nRotacao := 0;
           if dmDIG.tbArquivo_Digital.Locate('CD_ARQUIVO',id,[]) then
              nRotacao := dmDIG.tbArquivo_DigitalNR_ROTACAO.AsInteger;
           if nRotacao<>0 then
             pdf.GiraPagina(nRotacao);
           //StatusBar1.Panels[1].Text := nd.Text + ' - ' +
           //    FormatFloat('0.00', ms.Size / 1024) + ' kb';
         end;
        finally
         ms.Free;
        end;
      end;
    end;
  end;
end;

procedure TfrmProcessoUtente.AdicionaLog(s:string);
var st:string;
begin
   st := FormatDateTime('ddmmyy hhnnss - ',Now) + s;
   WriteLn(fLog,st);
end;

procedure TfrmProcessoUtente.GrupoClick(Sender: TObject);
begin
  frmLocalizar := TfrmLocalizar.Create(Application);
  frmLocalizar.qyDados.SQL.Text := 'SELECT * FROM DIG_GRUPO';
  frmLocalizar.Where := false;
  SetLength(VCampo,2);
  VCampo[0].Titulo  := 'Cód.';
  VCampo[0].Width := 5;
  VCampo[1].Titulo  := 'Nome';
  VCampo[1].Width := 25;
  VCampo[0].Visivel := True;
  VCampo[1].Visivel := True;

  if frmLocalizar.ShowModal = mrOK then
  begin
     New(pRec);
     pRec^.grupo := frmLocalizar.qyDados.FieldByName('CD_GRUPO').AsInteger;
     framArvore1.tv.Items.AddObject(nil,
       frmLocalizar.qyDados.FieldByName('DS_GRUPO').AsString, pRec);
  end;
  frmLocalizar.Free;
end;

procedure TfrmProcessoUtente.btRotacionarClick(Sender: TObject);
{var i,r:integer; ang:double;
begin
  i := pdf.RotacaoAtual;
  inc(i);
  if i>3 then i:=0;
  pdf.GiraPagina(i);
end;}
var nd:TTreeNode;
    i, id:integer;
begin
  i := pdf.RotacaoAtual;
  inc(i);
  if i>3 then i:=0;
  pdf.GiraPagina(i);

  nd := framArvore1.tv.Selected;
  if nd <> nil then
  begin
    if nd.Level <> 0 then
    begin
      pRec := nd.Data;
      id := pRec.id;
      if dmDIG.tbArquivo_Digital.Locate('CD_ARQUIVO',id,[]) then
      begin
         dmDIG.tbArquivo_Digital.Edit;
         dmDIG.tbArquivo_DigitalNR_ROTACAO.AsInteger := i;
         dmDIG.tbArquivo_Digital.Post;
         dmDIG.Commit(dmDIG.tbArquivo_Digital);
      end;
    end;
  end;
end;

procedure TfrmProcessoUtente.btZoomMaisClick(Sender: TObject);
begin
  pdf.ZoomIn;
end;

procedure TfrmProcessoUtente.btZoomMenosClick(Sender: TObject);
begin
  pdf.ZoomOut;
end;

procedure TfrmProcessoUtente.btZoomFitWClick(Sender: TObject);
begin
  pdf.FitWidth;
end;

procedure TfrmProcessoUtente.btEditorClick(Sender: TObject);
var nd,ndc:TTreeNode; ms : TMemoryStream;
    nGrupo, id: Integer;
    bContinuar:Boolean;
begin
  nd := framArvore1.tv.Selected;
  if nd <> nil then
  begin
    if nd.Level <> 0 then
      nd := nd.Parent;

    pRec := nd.data;
    nGrupo := pRec.grupo;

    dmDIG.tbDig_Arquivo.Open;
    dmDIG.tbEdt_Arquivo.Open;
    ms := TMemoryStream.Create;

    frmDlgInfoDoc := TfrmDlgInfoDoc.Create(Application);
    frmEditor := TfrmEditor.Create(Application);
    frmEditor.bPastaDigital := true;
    bContinuar := (frmDlgInfoDoc.ShowModal = mrOk);
    if bContinuar then
    begin
      dmDIG.tbEdt_Arquivo.Close;
      dmDIG.tbEdt_Arquivo.ParamByName('CD_ARQUIVO').AsInteger :=
            frmDlgInfoDoc.Documento;
      dmDIG.tbEdt_Arquivo.Open;
      if dmDIG.tbEdt_Arquivo.RecordCount>0 then
      begin
        dmDIG.tbEdt_ArquivoBL_ARQUIVO.SaveToFile('c:\compware\temp\teste.rtf');
        frmEditor.editor.LoadFromFile('c:\compware\temp\teste.rtf');
        frmEditor.Documento := frmDlgInfoDoc.Documento;
      end;
    end;
    bContinuar := (frmEditor.ShowModal = mrOK);

    if bContinuar then
    begin
      //RTF
      frmEditor.editor.SaveToStream(ms);
      dmDIG.tbEdt_Arquivo.Insert;
      dmDIG.tbEdt_ArquivoBL_ARQUIVO.LoadFromStream(ms);
      dmDIG.tbEdt_Arquivo.Post;

      //PDF
      ms.LoadFromFile('c:\compware\temp\teste.pdf');
      dmDIG.tbDig_Arquivo.Insert;
      dmDIG.tbDig_ArquivoBL_ARQUIVO.LoadFromStream(ms);
      dmDIG.tbDig_Arquivo.Post;

      dmDIG.tbArquivo_Digital.Last;

      dmDIG.tbArquivo_Digital.Insert;
      dmDIG.tbArquivo_DigitalNR_PROCESSO.AsString := edProcesso.Text;
      dmDIG.tbArquivo_DigitalCD_ARQUIVO.AsInteger :=
        dmDIG.tbDig_ArquivoCD_ARQUIVO.AsInteger;
      dmDIG.tbArquivo_DigitalCD_ARQUIVO_EDT.AsInteger :=
        dmDIG.tbEdt_ArquivoCD_ARQUIVO.AsInteger;
      dmDIG.tbArquivo_DigitalCD_GRUPO.AsInteger := nGrupo;
      dmDIG.tbArquivo_DigitalTP_ARQUIVO.AsInteger := 2; //RTF Edt
      dmDIG.tbArquivo_Digital.Post;
      nOrdem := dmDIG.tbArquivo_Digital.RecordCount;
      
      id := dmDIG.tbArquivo_DigitalCD_ARQUIVO.AsInteger;
      ndc := framArvore1.tv.Items.AddChild(nd, 'Documento' + inttostr(nOrdem));
      
      New(pRec);
      pRec^.id := id;
      pRec^.tipo := 2;
      ndc.Data := pRec;
      ndc.Selected := true;
    
      dmDIG.Commit(dmDIG.tbDig_Arquivo);

      try
       ms.Position := 0;
       pdf.LoadFromStream(ms,0);
      except
      end;
    end;

    frmDlgInfoDoc.Free;
    frmEditor.Free;
    ms.Free;
    dmDIG.tbDig_Arquivo.Close;
    dmDIG.tbEdt_Arquivo.Close;
  end;
end;

procedure TfrmProcessoUtente.btImportarClick(Sender: TObject);
var nd:TTreeNode; ms : TMemoryStream;
    nGrupo, id: Integer;
begin
  nd := framArvore1.tv.Selected;
  if nd <> nil then
  begin
    if nd.Level <> 0 then
      nd := nd.Parent;

    pRec := nd.data;
    nGrupo := pRec.grupo;

    dmDIG.tbDig_Arquivo.Open;
    ms := TMemoryStream.Create;
    if OpenDialog1.Execute then
    begin
      ms.LoadFromFile(OpenDialog1.FileName);

      dmDIG.tbDig_Arquivo.Insert;
      dmDIG.tbDig_ArquivoBL_ARQUIVO.LoadFromStream(ms);
      dmDIG.tbDig_Arquivo.Post;

      dmDIG.tbArquivo_Digital.Last;

      dmDIG.tbArquivo_Digital.Insert;
      dmDIG.tbArquivo_DigitalNR_PROCESSO.AsString := edProcesso.Text;
      dmDIG.tbArquivo_DigitalCD_ARQUIVO.AsInteger :=
        dmDIG.tbDig_ArquivoCD_ARQUIVO.AsInteger;
      dmDIG.tbArquivo_DigitalCD_GRUPO.AsInteger := nGrupo;
      dmDIG.tbArquivo_DigitalTP_ARQUIVO.AsInteger := 3; //PDF Imp
      dmDIG.tbArquivo_Digital.Post;
      nOrdem := dmDIG.tbArquivo_Digital.RecordCount;
      
      nd := framArvore1.tv.Items.AddChild(nd, 'Documento' + inttostr(nOrdem));
      id := dmDIG.tbArquivo_DigitalCD_ARQUIVO.AsInteger;
      
      New(pRec);
      pRec^.id := id;
      pRec^.tipo := 3;
      nd.Data := pRec;
      nd.Selected := true;

      dmDIG.Commit(dmDIG.tbDig_Arquivo);
      //dm.Commit(dmDIG.tbArquivo_Digital);
    end;

    try
     ms.Position := 0;
     pdf.LoadFromStream(ms,0);
    except
    end;

    ms.Free;
    dmDIG.tbDig_Arquivo.Close;
  end;
end;

procedure TfrmProcessoUtente.btExportarClick(Sender: TObject);
var nd:TTreeNode;
    id:integer;
    ms:TMemoryStream;
begin
  nd := framArvore1.tv.Selected;
  if nd <> nil then
  begin
    if nd.Level <> 0 then
    begin
    
      pRec := nd.data;
      id := pRec.id;

      ms := framArvore1.RetornaStreamBlob(id, sProp);
      try
       ms.Position := 0;
       pdf.LoadFromStream(ms,0);
       if SaveDialog1.Execute then
         ms.SaveToFile(SaveDialog1.FileName);
      finally
       ms.Free;
      end;
    end;
  end;
end;

procedure TfrmProcessoUtente.btExcluirClick(Sender: TObject);
var id:integer; nd:TTreeNode; bAtualizar:Boolean;
begin
  FbAtualizando := true;
  bAtualizar := false;
  nd := framArvore1.tv.Selected;
  if nd <> nil then
  begin
    if nd.Level <> 0 then
    begin

      pRec := nd.data;
      id := pRec.id;

      dmDIG.tbDig_Arquivo.Close;
      dmDIG.tbDig_Arquivo.ParamByName('CD_ARQUIVO').AsInteger := id;
      dmDIG.tbDig_Arquivo.Open;
      if not dmDIG.tbDig_Arquivo.IsEmpty then
        dmDIG.tbDig_Arquivo.Delete;

      if dmDig.tbArquivo_Digital.Locate('CD_ARQUIVO',id,[]) then
      begin
        if dmDig.tbArquivo_DigitalCD_ARQUIVO_EDT.AsInteger>0 then
        begin
          dmDIG.tbEdt_Arquivo.Close;
          dmDIG.tbEdt_Arquivo.ParamByName('CD_ARQUIVO').AsInteger :=
            dmDig.tbArquivo_DigitalCD_ARQUIVO_EDT.AsInteger;
          dmDIG.tbEdt_Arquivo.Open;
          if not dmDIG.tbEdt_Arquivo.IsEmpty then
            dmDIG.tbEdt_Arquivo.Delete;
        end;

        dmDig.tbArquivo_Digital.Delete;
        nd.Delete;
        bAtualizar := true;
      end;

      dmDIG.Commit(dmDIG.tbDig_Arquivo);

      dmDIG.tbDig_Arquivo.Close;
    end
    else if not nd.HasChildren then
    begin
      nd.Delete;
      bAtualizar :=  true;
    end;
  end;
  FbAtualizando := false;
  if bAtualizar then
    AtualizaDocumento(framArvore1.tv);
end;

procedure TfrmProcessoUtente.HabilitaBotoes(pbHabilitar: Boolean);
var i:integer;
begin
  for i := 0 to ComponentCount-1 do
    if (Components[i] is TSpeedButton) then
      if (Components[i] as TSpeedButton).Tag=1 then
        (Components[i] as TSpeedButton).Enabled := pbHabilitar;
end;

procedure TfrmProcessoUtente.btRecolherClick(Sender: TObject);
var i:integer;
begin
  for i:=0 to framArvore1.tv.Items.Count-1 do
    framArvore1.tv.Items.Item[i].Collapse(true);
end;

procedure TfrmProcessoUtente.btExpandirClick(Sender: TObject);
var i:integer;
begin
  for i:=0 to framArvore1.tv.Items.Count-1 do
    framArvore1.tv.Items.Item[i].Expand(true);
end;

procedure TfrmProcessoUtente.PopupMenu1Popup(Sender: TObject);
var nd:TTreeNode;
begin
  nd := framArvore1.tv.Selected;
  if nd<>nil then
  begin
    pRec := nd.Data;
    Redigitalizar1.Enabled := (nd.Level>0)and(pRec.tipo=1);
    Editar1.Enabled := (nd.Level>0)and(pRec.tipo=2);
    Importar1.Enabled := (nd.Level>0)and(pRec.tipo=3);
  end;
end;

procedure TfrmProcessoUtente.Editar1Click(Sender: TObject);
var nd:TTreeNode; ms : TMemoryStream;
    bContinuar:Boolean;
begin
  nd := framArvore1.tv.Selected;
  if nd <> nil then
  begin
    if nd.Level <> 0 then
    begin
      pRec := nd.data;
      if dmDIG.tbArquivo_Digital.Locate('CD_ARQUIVO',pRec.id,[]) then
      begin
        dmDIG.tbEdt_Arquivo.Close;
        dmDIG.tbEdt_Arquivo.ParamByName('CD_ARQUIVO').AsInteger :=
              dmDIG.tbArquivo_DigitalCD_ARQUIVO_EDT.AsInteger;
        dmDIG.tbEdt_Arquivo.Open;
        if dmDIG.tbEdt_Arquivo.RecordCount>0 then
        begin
          ms := TMemoryStream.Create;
          dmDIG.tbEdt_ArquivoBL_ARQUIVO.SaveToFile('c:\compware\temp\teste.rtf');

          frmEditor := TfrmEditor.Create(Application);
          frmEditor.bPastaDigital := true;
          frmEditor.editor.LoadFromFile('c:\compware\temp\teste.rtf');
          bContinuar := (frmEditor.ShowModal = mrOK);

          if bContinuar then
          begin
            //RTF
            frmEditor.editor.SaveToStream(ms);
            dmDIG.tbEdt_Arquivo.Edit;
            dmDIG.tbEdt_ArquivoBL_ARQUIVO.LoadFromStream(ms);
            dmDIG.tbEdt_Arquivo.Post;

            //PDF
            ms.LoadFromFile('c:\compware\temp\teste.pdf');
            dmDIG.tbDig_Arquivo.Close;
            dmDIG.tbDig_Arquivo.ParamByName('CD_ARQUIVO').AsInteger :=
                   dmDIG.tbArquivo_DigitalCD_ARQUIVO.AsInteger;
            dmDIG.tbDig_Arquivo.Open;
            if dmDIG.tbDig_Arquivo.RecordCount>0 then
            begin
              dmDIG.tbDig_Arquivo.Edit;
              dmDIG.tbDig_ArquivoBL_ARQUIVO.LoadFromStream(ms);
              dmDIG.tbDig_Arquivo.Post;
            end;

            dmDIG.Commit(dmDIG.tbDig_Arquivo);

            try
             ms.Position := 0;
             pdf.LoadFromStream(ms,0);
            except
            end;
          end;

          frmEditor.Free;
          ms.Free;
          dmDIG.tbDig_Arquivo.Close;
        end;
        dmDIG.tbEdt_Arquivo.Close;
      end;
    end;
  end;
end;

procedure TfrmProcessoUtente.Importar1Click(Sender: TObject);
var nd:TTreeNode; ms : TMemoryStream;
begin
  nd := framArvore1.tv.Selected;
  if nd <> nil then
  begin
    if nd.Level <> 0 then
    begin
      pRec := nd.data;
      if dmDIG.tbArquivo_Digital.Locate('CD_ARQUIVO',pRec.id,[]) then
      begin
        dmDIG.tbDig_Arquivo.Close;
        dmDIG.tbDig_Arquivo.ParamByName('CD_ARQUIVO').AsInteger :=
          dmDIG.tbArquivo_DigitalCD_ARQUIVO.AsInteger;
        dmDIG.tbDig_Arquivo.Open;
        if dmDIG.tbDig_Arquivo.RecordCount>0 then
        begin
          ms := TMemoryStream.Create;
          if OpenDialog1.Execute then
          begin
            ms.LoadFromFile(OpenDialog1.FileName);

            dmDIG.tbDig_Arquivo.Edit;
            dmDIG.tbDig_ArquivoBL_ARQUIVO.LoadFromStream(ms);
            dmDIG.tbDig_Arquivo.Post;

            dmDIG.Commit(dmDIG.tbDig_Arquivo);
          end;

          try
           ms.Position := 0;
           pdf.LoadFromStream(ms,0);
          except
          end;

          ms.Free;
        end;
        dmDIG.tbDig_Arquivo.Close;
      end;
    end;
  end;
end;

procedure TfrmProcessoUtente.GruposModelo1Click(Sender: TObject);
begin
  frmCadGrupoMod := TfrmCadGrupoMod.Create(nil);
  frmCadGrupoMod.ShowModal;
  frmCadGrupoMod.Free;
end;

procedure TfrmProcessoUtente.ModeloDocumento1Click(Sender: TObject);
begin
  frmCadModelo := TfrmCadModelo.Create(application);
  frmCadModelo.showmodal;
  frmCadModelo.free;
end;

procedure TfrmProcessoUtente.FormShow(Sender: TObject);
var
  sSQLM:string;
begin
  qyMedicoParametro.Close;
  sSQLM := qyMedicoParametro.SQL.text;
  sSQLM := sSQLM + 'where cd_medico in (' + prmLstNaoTransfAgenda + ')';
  qyMedicoParametro.SQL.text := sSQLM;
  qyMedicoParametro.Open;

  dtAgenda.Date := dm.GetDateTime;
  sSQLAgenda := dmGeral.TB_AGENDA.SelectSQL.Text;
  ConsultaAgenda;

end;

procedure TfrmProcessoUtente.ConsultaAgenda;
var sSQL, sIN:string;
begin
  sIN := '';

  dmGeral.TB_VINC_USUARIO_MEDICO.Close;
  dmGeral.TB_VINC_USUARIO_MEDICO.Params.ByName('CD_USUARIO').AsInteger :=
    dm.qyLoginCD_USUARIO.AsInteger;
  dmGeral.TB_VINC_USUARIO_MEDICO.Open;
  while not dmGeral.TB_VINC_USUARIO_MEDICO.Eof do
  begin
    sIN := sIN + dmGeral.TB_VINC_USUARIO_MEDICOCD_MEDICO.AsString;
    dmGeral.TB_VINC_USUARIO_MEDICO.Next;
    if not dmGeral.TB_VINC_USUARIO_MEDICO.Eof then
      sIN := sIN + ',';
  end;

  if (sIN<>'') then
    sIN := dm.qyLoginCD_MEDICO.AsString + ',' + sIN
  else
    sIN := dm.qyLoginCD_MEDICO.AsString;

  if cbMedico.ListSource.DataSet.Active then
  begin
   if cbMedico.KeyValue<>null then
   begin
     if (sIN<>'') then
      sIN := intToStr(cbMedico.KeyValue) + ',' + sIN
     else
      sIN := intToStr(cbMedico.KeyValue);
   end;
  end;

  sSQL := 'AND  (AGENDA.CD_MEDICO in (' +  sIN + ')' +
          ' AND  AGENDA.FL_CONFIRMADO = 1)';
          //' AND  AGENDA.FL_REALIZADO = 0)';

  sSQL := StringReplace(sSQLAgenda,'/*MEDICO*/', sSQL ,[]);
  dmGeral.TB_AGENDA.SelectSQL.Text := sSQL;
  dmGeral.TB_AGENDA.Close;
  dmGeral.TB_AGENDA.ParamByName('DT_DE').AsDate := trunc(dtAgenda.Date);
  dmGeral.TB_AGENDA.ParamByName('DT_ATE').AsDate := trunc(dtAgenda.Date)+1;
  dmGeral.TB_AGENDA.Open;
end;

procedure TfrmProcessoUtente.Propriedade1Click(Sender: TObject);
begin
  ShowMessage(sProp);
end;

procedure TfrmProcessoUtente.framArvore1tv2Change(Sender: TObject;
  Node: TTreeNode);
begin
  if not FbAtualizando then
    AtualizaDocumento(framArvore1.tv2);
end;

procedure TfrmProcessoUtente.framArvore1tvChange(Sender: TObject;
  Node: TTreeNode);
begin
  if not FbAtualizando then
    AtualizaDocumento(framArvore1.tv);
end;

procedure TfrmProcessoUtente.framArvore1btSalvarGrupoClick(
  Sender: TObject);
begin
  framArvore1.btSalvarGrupoClick(Sender);
  btProcessoClick(sender);
end;

procedure TfrmProcessoUtente.FormCreate(Sender: TObject);
begin
  fNome := ExtractFilePath(Application.ExeName) + 'Log';
  if not DirectoryExists(fNome) then
    MkDir(fNome);

  fNome :=  fNome + '\Digitalizacao' + FormatdateTime('ddmmyyhhnnss',now)+ '.log';
  AssignFile(fLog, fNome);
  Rewrite(fLog);

  pgGeral.ActivePageIndex := 0;

  tabHistEdt.TabVisible := false;
  tabEditor.TabVisible := false;
  tabPDF.TabVisible := false;
  //tabMapa.TabVisible := false;
  framMapaMedico1.CreateFrameMapa;

  framFicha11.AbrePaginas;
  framFicha21.AbrePaginas;
  framFicha31.AbrePaginas;
  framFicha41.AbrePaginas;
  framMapaMedico1.AbrePaginas;

  //Notificacao
  frmCadNotificacao := TfrmCadNotificacao.Create(Application);
  frmCadNotificacao.FBSAP := True;
  frmCadNotificacao.BorderStyle := bsNone;
  frmCadNotificacao.WindowState:= wsNormal;
  frmCadNotificacao.Parent := sbNotificacao;
  frmCadNotificacao.AutoScroll := true;
  frmCadNotificacao.tabLista.Enabled := false;
  //frmCadNotificacao.tabLista.TabVisible := false;
  frmCadNotificacao.Panel6.Visible := false;
  frmCadNotificacao.btFechar.Visible := false;
  frmCadNotificacao.btProximo.Visible := false;
  frmCadNotificacao.btAnterior.Visible := false;
  frmCadNotificacao.btPesquisar.Visible := false;
  frmCadNotificacao.Show;
  frmCadNotificacao.Align := alTop;
end;

procedure TfrmProcessoUtente.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  framMapaMedico1.DestroyFrameMapa;

  CloseFile(fLog);
  dmDig.tbDig_GrupoDoc.Close;
  dmDig.qyMedico.Close;
  dmGeral.TB_AGENDA.SelectSQL.Text := sSQLAgenda;
end;

procedure TfrmProcessoUtente.InfoEstatistica1Click(Sender: TObject);
begin
  frmInfoEstat := TfrmInfoEstat.Create(self);
  frmInfoEstat.ShowModal;
  frmInfoEstat.Free;
end;

procedure TfrmProcessoUtente.btNovoHistoricoClick(Sender: TObject);
var nGrupo:integer; sGrupo:string; ms:TMemoryStream;
    bContinuar:boolean;
begin
  ms := TMemoryStream.Create;
  frmDlgInfoDoc := TfrmDlgInfoDoc.Create(Application);
  try
    editor.Clear;
    dmDIG.tbEdt_Arquivo.Open;
    bContinuar := (frmDlgInfoDoc.ShowModal = mrOk);
    if bContinuar then
    begin
      dmDIG.tbEdt_Arquivo.Close;
      dmDIG.tbEdt_Arquivo.ParamByName('CD_ARQUIVO').AsInteger :=
            frmDlgInfoDoc.Documento;
      dmDIG.tbEdt_Arquivo.Open;
      if dmDIG.tbEdt_Arquivo.RecordCount>0 then
        dmDIG.tbEdt_ArquivoBL_ARQUIVO.SaveToStream(ms);

      nGrupo := dmDIG.tbHistoricoCD_GRUPO.AsInteger;
      sGrupo := dmDIG.tbHistoricoDS_GRUPO.AsString;
      dsHistorico.DataSet.Insert;
      dmDIG.tbHistoricoCD_PACIENTE.AsInteger :=
        DMGERAL.TB_PACIENTECD_PACIENTE.AsInteger;
      dmDIG.tbHistoricoCD_MEDICO.AsInteger :=
        dm.qyLoginCD_MEDICO.AsInteger;
      dmDIG.tbHistoricoNM_MEDICO.AsString :=
        dm.qyLoginNM_MEDICO.AsString;
      dmDIG.tbHistoricoCD_GRUPO.AsInteger := nGrupo;
      dmDIG.tbHistoricoDS_GRUPO.AsString := sGrupo;
      if (ms.size>0) then
      begin
        ms.Position := 0;
        editor.LoadFromStream(ms);
        editor.Modified :=  true;
      end;
    end;
  finally
    dmDIG.tbEdt_Arquivo.Close;
    ms.Free;
    frmDlgInfoDoc.Free;
  end;
end;

procedure TfrmProcessoUtente.btExcluirHistoricoClick(Sender: TObject);
begin
  editor.Clear;
  dsHistorico.DataSet.Delete;
end;

procedure TfrmProcessoUtente.btSalvarHistoricoClick(Sender: TObject);
var ms:TMemoryStream; nOrdem, nCdArquivo, nCdGrupo:integer;
    nd,ndc:TTreeNode;

  function ExisteNodo(tv:TTreeView; psNome:string; var pnd:TTreeNode):boolean;
  var i:integer;
  begin
     for  i:=0 to tv.Items.Count-1 do
       if tv.Items[i].Level=0 then
         if tv.Items[i].Text = psNome then
         begin
            pnd := tv.Items[i];
            result := true;
            exit;
         end;
  end;

  function ExisteArquivo(tv:TTreeView; pnArquivo:integer; var pnd:TTreeNode):boolean;
  var i:integer;
  begin
     for  i:=0 to pnd.Count-1 do
     begin
       pRec := pnd.Item[i].data;
       if (pRec.id = pnArquivo) then
       begin
          pnd := pnd.Item[i];
          result := true;
          exit;
       end;
     end;
  end;
begin
  if not(dmDIG.tbHistorico.State in [dsEdit,dsInsert]) then Exit;
  ms := TMemoryStream.Create;
  try
    nCdArquivo := NUMERO_INDEFINIDO;
    nCdGrupo := NUMERO_INDEFINIDO;
    editor.SaveToStream(ms);
    if ms.size>0 then
    begin
      dmDIG.tbHistoricoBL_HISTORICO.LoadFromStream(ms);
      if (dmDIG.tbHistoricoCD_ARQUIVO.AsString <> '') then
        nCdArquivo := dmDIG.tbHistoricoCD_ARQUIVO.AsInteger;
      if (dmDIG.tbHistoricoCD_GRUPO.AsString <> '') then
        nCdGrupo := dmDIG.tbHistoricoCD_GRUPO.AsInteger;
      nCdArquivo := SalvaArquivoDigital(nCdArquivo, nCdGrupo);
      if (nCdArquivo <> NUMERO_INDEFINIDO) then
        dmDIG.tbHistoricoCD_ARQUIVO.AsInteger := nCdArquivo;
    end;
    dsHistorico.DataSet.Post;

    if ExisteNodo(framArvore1.tv, dmDIG.tbHistoricoDS_GRUPO.AsString, nd) then
    begin
      if not ExisteArquivo(framArvore1.tv, nCdArquivo, nd) then
      begin
        nOrdem := dmDIG.tbArquivo_Digital.RecordCount;
        ndc := framArvore1.tv.Items.AddChild(nd, 'Documento' + inttostr(nOrdem));
        New(pRec);
        pRec^.id := nCdArquivo;
        pRec^.tipo := 2;
        ndc.Data := pRec;
        ndc.Selected := true;
      end
      else
        nd.Selected := true;
    end;
    dm.Commit(dsHistorico.DataSet);
  finally
   ms.Free;
  end;
end;

procedure TfrmProcessoUtente.tbHistoricoAfterScroll(DataSet: TDataSet);
var ms:TMemoryStream;
begin
  ms := TMemoryStream.Create;
  try
    FbAtualizando := false;
    editor.Clear;
    rEditor.Lines.Clear;
    dmDIG.tbHistoricoBL_HISTORICO.SaveToStream(ms);
    if ms.size>0 then
    begin
      ms.Position := 0;
      //editor.LoadFromStream(ms);
      rEditor.Lines.LoadFromStream(ms);
    end;
    editor.Readonly := (dmDig.tbHistoricoFL_FILHO.AsString = cvSim);
  finally
    ms.Free;
  end;
end;

procedure TfrmProcessoUtente.btRevisaoClick(Sender: TObject);
var nCodigo,nGrupo, nArquivo:integer; sGrupo:string;
    ms:TMemoryStream;
begin
  ms := TMemoryStream.Create;
  try
    editor.Clear;
    nArquivo := dmDIG.tbHistoricoCD_ARQUIVO.AsInteger;
    nGrupo := dmDIG.tbHistoricoCD_GRUPO.AsInteger;
    nCodigo := dmDIG.tbHistoricoCD_HISTORICO.AsInteger;
    sGrupo := dmDIG.tbHistoricoDS_GRUPO.AsString;
    dmDIG.tbHistoricoBL_HISTORICO.SaveToStream(ms);
    //Atualiza Registro Atual
    dsHistorico.DataSet.Edit;
    dmDIG.tbHistoricoFL_FILHO.AsString := cvSim;
    if dmDIG.tbHistoricoCD_PAI.AsString = '' then
      dmDIG.tbHistoricoCD_PAI.AsInteger := nCodigo;
    dsHistorico.DataSet.Post;
    //Cria Novo Registro
    dsHistorico.DataSet.Insert;
    dmDIG.tbHistoricoCD_ARQUIVO.AsInteger := nArquivo;
    dmDIG.tbHistoricoCD_PACIENTE.AsInteger :=
      DMGERAL.TB_PACIENTECD_PACIENTE.AsInteger;
    dmDIG.tbHistoricoCD_MEDICO.AsInteger :=
      dm.qyLoginCD_MEDICO.AsInteger;
    dmDIG.tbHistoricoNM_MEDICO.AsString :=
      dm.qyLoginNM_MEDICO.AsString;
    dmDIG.tbHistoricoCD_PAI.AsInteger := nCodigo;
    dmDIG.tbHistoricoCD_GRUPO.AsInteger := nGrupo;
    dmDIG.tbHistoricoDS_GRUPO.AsString := sGrupo;
    ms.Position := 0;
    editor.LoadFromStream(ms);
  finally
    ms.Free;
  end;
end;

procedure TfrmProcessoUtente.editorChange(Sender: TObject);
begin
  if not (dsHistorico.DataSet.State in [dsEdit,dsInsert]) then
    dsHistorico.DataSet.Edit;
end;

function TfrmProcessoUtente.SalvaArquivoDigital(
   pncdArquivo, pncdGrupo:integer): integer;
var ms: TMemoryStream; sFile:string;
begin
  ms := TMemoryStream.Create;
  try
    result := pncdArquivo;
    sFile:='c:\compware\temp\convertido.pdf';
    frmDlgStatus.Show;
    frmDlgStatus.lbStatus.Caption := 'Salvando documento...';
    frmDlgStatus.pbStatus.Max := 100;
    frmDlgStatus.pbStatus.Position := 20;
    frmDlgStatus.Update;
    if ImprimeRtfPDF then
    begin
      frmDlgStatus.pbStatus.Position := 30;
      frmDlgStatus.Update;
      ms.LoadFromFile(sFile);
      ms.Position := 0;
      spWPViewPDFCompatible1.LoadFromStream(ms,0);
      frmDlgStatus.pbStatus.Position := 40;
      frmDlgStatus.Update;
      result := pncdArquivo;
      dmDIG.tbDig_Arquivo.ParamByName('CD_ARQUIVO').AsInteger := pncdArquivo;
      dmDIG.tbDig_Arquivo.Open;
      frmDlgStatus.pbStatus.Position := 50;
      frmDlgStatus.Update;
      if dmDIG.tbDig_Arquivo.IsEmpty then
       dmDIG.tbDig_Arquivo.Insert
      else
       dmDIG.tbDig_Arquivo.Edit;

      dmDIG.tbDig_ArquivoBL_ARQUIVO.LoadFromStream(ms);
      frmDlgStatus.pbStatus.Position := 60;
      frmDlgStatus.Update;
      dmDIG.tbDig_Arquivo.Post;
      frmDlgStatus.pbStatus.Position := 70;
      frmDlgStatus.Update;
      dmDIG.tbArquivo_Digital.ParamByName('NR_PROCESSO').AsString := edProcesso.Text;
      dmDIG.tbArquivo_Digital.Open;
      frmDlgStatus.pbStatus.Position := 80;
      frmDlgStatus.Update;
      if dmDIG.tbArquivo_Digital.Locate('NR_PROCESSO;CD_ARQUIVO',
         varArrayOf([strToInt(edProcesso.Text),pncdArquivo]),[]) then
        dmDIG.tbArquivo_Digital.Edit
      else
        dmDIG.tbArquivo_Digital.Insert;
      dmDIG.tbArquivo_DigitalNR_PROCESSO.AsString := edProcesso.Text;
      dmDIG.tbArquivo_DigitalCD_ARQUIVO.AsInteger :=
        dmDIG.tbDig_ArquivoCD_ARQUIVO.AsInteger;
      dmDIG.tbArquivo_DigitalCD_GRUPO.AsInteger := pncdGrupo;
      dmDIG.tbArquivo_DigitalTP_ARQUIVO.AsInteger := 2; //RTF Edt
//      dmDIG.tbArquivo_DigitalNU_ORDEM.AsInteger := 0;
      dmDIG.tbArquivo_Digital.Post;
      frmDlgStatus.pbStatus.Position := 90;
      frmDlgStatus.Update;
      result := dmDIG.tbDig_ArquivoCD_ARQUIVO.AsInteger;
    end;
  finally
    dmDIG.tbDig_Arquivo.Close;
    dmDIG.tbEdt_Arquivo.Close;
    if (dmDIG.tbArquivo_Digital.State in [dsEdit,dsInsert]) then
      dmDIG.tbArquivo_Digital.Cancel;
    ms.Free;
    frmDlgStatus.pbStatus.Position := 100;
    frmDlgStatus.Update;
    frmDlgStatus.Close;
  end;
end;

function TfrmProcessoUtente.ImprimeRtfPDF:boolean;
var lst:TStringList; dix,ix:integer;
  bSalvamentoPendente:boolean; sPath,sFile,sFileO,sFileN:string;
begin
  bSalvamentoPendente := wpEditor.Modified;
  if bSalvamentoPendente then
    btConverteRTF_PDFClick(self);

{ //DORO PDF
  begin
    lst := TStringList.Create;
    dix := -1;  ix := -1;
    try
      sPath := PastaArquivoProgramas + '\DoroPDFWriter';
      if DirectoryExists(sPath) then
      begin
        sFileO := sPath + '\Doro-.ini';
        sFileN := sPath + '\Doro.ini';
        if FileExists(sFileO) then
          RenameFile(sFileO, sFileN);
        repeat
          frmDlgStatus.Update;
          sleep(3000);
        until FileExists(sFileN);
      end;
      lst.text := Printer.Printers.Text;
      ix := lst.IndexOf('Doro PDF Writer');
      dix := Printer.PrinterIndex;
      if dix<>ix then
        ChangeDefaultPrinter(ix);
      sFile:='c:\compware\temp\teste.pdf';
      if FileExists(sFile) then
        DeleteFile(sFile);
      result := wpEditor.Print;
      if result then
      begin
        repeat
          frmDlgStatus.Update;
          sleep(3000);
        until FileExists(sFile);
        spWPViewPDFCompatible1.LoadFromFile(sFile);
      end;
    finally
      if dix<>ix then
        ChangeDefaultPrinter(dix);
      lst.Free;
      if FileExists(sFileN) then
        RenameFile(sFileN, sFileO);
    end;
  end;
}
end;

{procedure TfrmProcessoUtente.ChangeDefaultPrinter(APrinterIndex: Integer);
var
  Device : array[0..255] of char;
  Driver : array[0..255] of char;
  Port : array[0..255] of char;
  hDeviceMode: THandle;
begin
  Printer.PrinterIndex := APrinterIndex;
  Printer.GetPrinter(Device, Driver, Port, hDeviceMode);
  StrCat( Device, ',');
  StrCat( Device, Driver );
  StrCat( Device, ',');
  StrCat( Device, Port );
  WriteProfileString( 'windows', 'device', Device );
  StrCopy( Device, 'windows' );
  SendMessage( HWND_BROADCAST, WM_WININICHANGE, 0, longint( @Device));
end;}

procedure TfrmProcessoUtente.dxDBGrid1CustomDrawCell(Sender: TObject;
  ACanvas: TCanvas; ARect: TRect; ANode: TdxTreeListNode;
  AColumn: TdxTreeListColumn; ASelected, AFocused, ANewItemRow: Boolean;
  var AText: String; var AColor: TColor; AFont: TFont;
  var AAlignment: TAlignment; var ADone: Boolean);
var
  Value: Variant;
begin
  if ANode.HasChildren then
    Exit;
  if not ASelected and (AColumn = gcData) then
  begin
    Value := ANode.Values[2];
    if not VarIsNull(Value) then
     if Value = cvSim then
      AColor := clYellow;
  end;
end;

procedure TfrmProcessoUtente.ckMostrarRevisoesClick(Sender: TObject);
begin
  dmDig.tbHistorico.Filtered := NOT ckMostrarRevisoes.Checked;
end;

procedure TfrmProcessoUtente.btImagemClick(Sender: TObject);
begin
  if OpenPictureDialog1.Execute then
  begin
    Image1.Picture.LoadFromFile(OpenPictureDialog1.FileName);
    editor.TextObjects.InsertCopy(Image1.Picture.Graphic);
  end;
end;

procedure TfrmProcessoUtente.btHorLineClick(Sender: TObject);
begin
  editor.TextObjects.InsertNewObject(wpobjHorizontalLine,false,false).Height := 4;
end;

procedure TfrmProcessoUtente.btCabecalhoClick(Sender: TObject);
begin
  editor.WorkOnText := wpHeader;
end;

procedure TfrmProcessoUtente.btRodapeClick(Sender: TObject);
begin
  editor.WorkOnText := wpFooter;
end;

procedure TfrmProcessoUtente.btSalvarHistClick(Sender: TObject);
var ms:TMemoryStream; nCodigo:integer;
    sSQLP:String;
begin
  ms := TMemoryStream.Create;
  try
    dsHistorico.DataSet.AfterScroll := nil;
    edProcesso.Enabled := true;
    btProcesso.Enabled := true;

    if not bGerarArquivo then
    begin
      if (dsAgenda.DataSet.FieldByname('NR_PROCESSO').AsString = edProcesso.Text) then
      begin
        dsAgenda.DataSet.Edit;
        dsAgenda.DataSet.FieldByname('FL_PARECER').AsInteger := cvFlSim;
        dsAgenda.DataSet.FieldByname('CD_HISTORICO_PARECER').AsInteger := dmDig.tbHistoricoCD_HISTORICO.AsInteger;
        dsAgenda.DataSet.Post;
      end
      else
      begin
        (* Atendimento extra insere automaticamente na Agenda *)
        if not dsAgenda.DataSet.Locate('NR_PROCESSO', edProcesso.Text,[]) then
        begin
          dsAgenda.DataSet.Insert;
          {Data agenda deve ser preenchida antes do Confirmado em funcao da validacao}
          dsAgenda.DataSet.FieldByname('DT_AGENDA').AsDateTime := dm.GetDate;
          dsAgenda.DataSet.FieldByname('FL_PARECER').AsInteger := cvFlSim;
          dsAgenda.DataSet.FieldByname('FL_CONFIRMADO').AsInteger := cvFlSim;
          dsAgenda.DataSet.FieldByname('FL_REALIZADO').AsInteger := cvFlSim;
          dsAgenda.DataSet.FieldByname('CD_HISTORICO_PARECER').AsInteger := dmDig.tbHistoricoCD_HISTORICO.AsInteger;
          dsAgenda.DataSet.FieldByname('CD_PACIENTE').AsInteger := dmDig.tbHistoricoCD_PACIENTE.AsInteger;
          dsAgenda.DataSet.FieldByname('NM_PACIENTE').AsString := DMGERAL.TB_PACIENTENM_PACIENTE.AsString;
          dsAgenda.DataSet.FieldByname('TP_SEXO').AsString := DMGERAL.TB_PACIENTETP_SEXO.AsString;
          dsAgenda.DataSet.FieldByname('IDADE').AsInteger := DMGERAL.TB_PACIENTEIDADE.AsInteger;
          if lkMedico.LookupValue <> '' then
            dsAgenda.DataSet.FieldByname('CD_MEDICO').AsString := lkMedico.LookupValue
          else
            dsAgenda.DataSet.FieldByname('CD_MEDICO').AsInteger := dmDig.tbHistoricoCD_MEDICO.AsInteger;
          dsAgenda.DataSet.Post;
        end;

        sSQLP := StringReplace(sSQLAgenda,'/*MEDICO*/', '', []);
        dmGeral.TB_AGENDA.SelectSQL.Text := sSQLP;
        dmGeral.TB_AGENDA.Close;
        dmGeral.TB_AGENDA.ParamByName('DT_DE').AsDate := trunc(dtAgenda.Date);
        dmGeral.TB_AGENDA.ParamByName('DT_ATE').AsDate := trunc(dtAgenda.Date)+1;
        dmGeral.TB_AGENDA.Open;

        if lkMedico.LookupValue = '' then
        begin
          if (dsAgenda.DataSet.Locate('NR_PROCESSO', edProcesso.Text,[])) and
            (dsAgenda.DataSet.FieldByname('CD_MEDICO').AsInteger <> dmDig.tbHistoricoCD_MEDICO.AsInteger) then
          begin
            dsAgenda.DataSet.Edit;
            dsAgenda.DataSet.FieldByname('FL_REALIZADO').AsInteger := cvFlSim;
            dsAgenda.DataSet.FieldByname('FL_CONFIRMADO').AsInteger := cvFlSim;
            dsAgenda.DataSet.FieldByname('FL_TRANSFERIDO').AsInteger := cvFlSim;
            dsAgenda.DataSet.Post;
          end;
        end;
        ConsultaAgenda;
      end;
    end;

    btNovoHist.Enabled := true;
    btEditarHist.Enabled := true;
    btCancelEditHist.Enabled := false;
    btSalvarHist.Enabled := false;
    lkMedico.Enabled := false;
    btLimparVinculo.Enabled := false;
    rEditor.lines.SaveToStream(ms);
    ms.Position := 0;
    dmDig.tbHistoricoBL_HISTORICO.LoadFromStream(ms);
    dmDig.tbHistorico.Post;
    nCodigo := dmDig.tbHistoricoCD_HISTORICO.AsInteger;
    //Isto é para ordernar
    dmDig.tbHistorico.Close; dmDig.tbHistorico.Open;
    dmDig.tbHistorico.Locate('CD_HISTORICO',nCodigo,[]);
    bk := dmDig.tbHistorico.GetBookmark;
    FbAtualizando := false;
    rEditor.ReadOnly := true;
    dxDBGrid2.Refresh;
    if SalvarDocumento then
    begin
      dm.Commit(dmDig.tbHistorico);
      dm.Commit(DMGERAL.TB_AGENDA);
    end
    else
    begin
      dm.Rollback(dmDig.tbHistorico);
      dm.Rollback(DMGERAL.TB_AGENDA);
    end;
  finally
    dsHistorico.DataSet.AfterScroll := tbHistoricoAfterScroll;
    ms.Free;
  end;
  btProcessoClick(sender);
end;

procedure TfrmProcessoUtente.btNovoHistClick(Sender: TObject);
var nGrupo, nMedico, nPaciente:integer; sMedico, sGrupo:string;

begin
 if not dmDig.tbHistorico.Active then Exit;

 edProcesso.Enabled := false;
 btProcesso.Enabled := false;

 rEditor.ReadOnly := false;
 rEditor.Lines.Clear;
 rEditor.SetFocus;
 btNovoHist.Enabled := false;
 btEditarHist.Enabled := false;
 btCancelEditHist.Enabled := true;
 btSalvarHist.Enabled := true;
 lkMedico.Enabled := true;
 btLimparVinculo.Enabled := true;

 //****************************GRUPO DEFAUT DO USUARIO**********
 if (prmGruPadrao<>STRING_INDEFINIDO) then
   nGrupo := strToInt(prmGruPadrao)
 else
   nGrupo := dmDig.tbHistoricoCD_GRUPO.AsInteger;

 nMedico := dm.qyLoginCD_MEDICO.AsInteger;
 sMedico := dm.qyLoginNM_MEDICO.AsString;
 nGrupo := dm.qyLoginCD_Grupo.AsInteger;
// sGrupo := dmDig.tbHistoricoDS_GRUPO.AsString;
 nPaciente := DMGERAL.TB_PACIENTECD_PACIENTE.AsInteger;
 dmDig.tbHistorico.Insert;
 dmDig.tbHistoricoCD_GRUPO.AsInteger := nGrupo;
// dmDig.tbHistoricoDS_GRUPO.AsString := sGrupo;
 dmDig.tbHistoricoCD_MEDICO.AsInteger := nMedico;
 dmDig.tbHistoricoNM_MEDICO.AsString := sMedico;
 dmDIG.tbHistoricoCD_PACIENTE.AsInteger := nPaciente;

 //FbAtualizando := true;
end;

procedure TfrmProcessoUtente.btEditarHistClick(Sender: TObject);
begin
 if (dmDig.tbHistoricoCD_MEDICO.AsInteger = dm.qyLoginCD_MEDICO.AsInteger) then
 begin
   edProcesso.Enabled := false;
   btProcesso.Enabled := false;
   rEditor.ReadOnly := false;
   rEditor.SetFocus;
   btNovoHist.Enabled := false;
   btEditarHist.Enabled := false;
   btCancelEditHist.Enabled := true;
   btSalvarHist.Enabled := true;
   lkMedico.Enabled := true;
   btLimparVinculo.Enabled := true;
   dmDig.tbHistorico.Edit;
   FbAtualizando := true;
 end;
end;

procedure TfrmProcessoUtente.btCancelEditHistClick(Sender: TObject);
begin
 edProcesso.Enabled := true;
 btProcesso.Enabled := true;
 rEditor.ReadOnly := true;
 rEditor.Clear;
 if pgGeral.ActivePage = tabHistEdt then
    rEditor.SetFocus;
 btNovoHist.Enabled := true;
 btEditarHist.Enabled := true;
 btCancelEditHist.Enabled := false;
 btSalvarHist.Enabled := false;
 lkMedico.Enabled := false;
 btLimparVinculo.Enabled := false;
 dmDig.tbHistorico.Cancel;
 FbAtualizando := false;
end;

function TfrmProcessoUtente.SalvarDocumento: boolean;
var ms:TMemoryStream; sLinha:string; p:TParagraph;
    nOrdem, nCdArquivo, nCdGrupo:integer;
    nd,ndc:TTreeNode;
    bContinuar:Boolean;
begin
  ms := TMemoryStream.Create;
  try
    nCdArquivo := NUMERO_INDEFINIDO;
    nCdGrupo := NUMERO_INDEFINIDO;
    wpEditor.Clear;
    dmDig.tbHistorico.GotoBookmark(bk);
    nCdGrupo := dmDig.tbHistoricoCD_GRUPO.AsInteger;

    //Verificar se deve gerar um documento por pagina
    qyGrupo.Close;
    qyGrupo.ParamByName('CD_GRUPO').AsInteger := nCdGrupo;
    qyGrupo.Open;

    //Modelo de Documento
	  qyModelo.Close;
    qyModelo.ParamByName('grupo').AsInteger := nCdGrupo;
    qyModelo.Open;


    //Captura Blob do Documento para Mesclar
    if prmDocPadrao <> STRING_INDEFINIDO then
    begin
     if nCdGrupo >= 1 then
       prmDocPadrao := qyModeloCD_DOCUMENTO.AsString;

     dmDIG.tbEdt_Arquivo.Close;
     dmDIG.tbEdt_Arquivo.ParamByName('CD_ARQUIVO').AsString := prmDocPadrao;
     dmDIG.tbEdt_Arquivo.Open;
     if dmDIG.tbEdt_Arquivo.RecordCount>0 then
     begin
       dmDIG.tbEdt_ArquivoBL_ARQUIVO.SaveToStream(ms);
       ms.Position := 0;
       wpEditor.LoadFromStream(ms);
       ms.SetSize(0);
     end;
    end;

    if qyGrupoFL_NOVO.AsInteger =  cvFlNao then
    begin
      dmDig.tbHistorico.First;
      if dmDig.tbHistorico.Locate('CD_GRUPO',nCdGrupo,[]) then
      begin
         wpEditor.CPPosition := Length(wpEditor.Text);
         wpEditor.CurrAttr.Alignment := paralLeft;
         //wpEditor.InsertPointAttr.Bold := [afsBold];
         wpEditor.InputStringW('Nome:');
         wpEditor.CPPosition := Length(wpEditor.Text);
         sLinha := Copy(DMGERAL.TB_PACIENTENM_PACIENTE.AsString,1,30);
         sLinha := sLinha + StringOfChar(' ' , 40-Length(sLinha));
         wpEditor.InputStringW(sLinha);
         wpEditor.CPPosition := Length(wpEditor.Text);
         //wpEditor.InsertPointAttr.Bold;
         wpEditor.InputStringW('Processo:');
         wpEditor.CPPosition := Length(wpEditor.Text);
         sLinha := DMGERAL.TB_PACIENTENR_PROCESSO.AsString;
         sLinha := sLinha + StringOfChar(' ' , 15-Length(sLinha));
         wpEditor.InputStringW(sLinha);
         //wpEditor.InsertPointAttr.Bold;
         wpEditor.InputStringW(#13#10+'Idade:');
         wpEditor.CPPosition := Length(wpEditor.Text);
         wpEditor.InputStringW(DMGERAL.TB_PACIENTEIDADE.AsString);
         wpEditor.InputNewObject(wpobjHorizontalLine);
         wpEditor.InputStringW(#13#10);
         wpEditor.InputStringW(#13#10);
         wpEditor.InputStringW(#13#10);
         wpEditor.CPPosition := Length(wpEditor.Text);
         if (dmDIG.tbHistoricoCD_ARQUIVO.AsString <> '') then
           nCdArquivo := dmDIG.tbHistoricoCD_ARQUIVO.AsInteger;
         repeat
            dmDig.tbHistoricoBL_HISTORICO.SaveToStream(ms);
            ms.Position := 0;
            sLinha := 'Criado em ' +
                      dmDig.tbHistoricoDT_HISTORICO.AsString + ' por ' +
                      dmDig.tbHistoricoNM_MEDICO.AsString;
            wpEditor.CPPosition := Length(wpEditor.Text);

            p := wpEditor.InputParagraph;
            p.LoadFromStream(ms);
            wpEditor.CPPosition := Length(wpEditor.Text);
            wpEditor.InputStringW(#13#10);
            wpEditor.InputStringW(#13#10);
            wpEditor.InputStringW(#13#10);

            wpEditor.InputStringW(sLinha);
            wpEditor.CPPosition := Length(wpEditor.Text);
            wpEditor.InputStringW(#13#10);
            wpEditor.InputNewObject(wpobjHorizontalLine);
            wpEditor.CPPosition := Length(wpEditor.Text);

            ms.SetSize(0);
            bContinuar := not dmDig.tbHistorico.LocateNext('CD_GRUPO',nCdGrupo,[]);
         until bContinuar;

         wpEditor.ReformatAll(true);
         ms.SetSize(0);
         wpEditor.SaveToStream(ms);
         wpEditor.Modified := true;
         ms.Position := 0;

         if ms.size>0 then
         begin
          nCdArquivo := SalvaArquivoDigital(nCdArquivo, nCdGrupo);
          if (nCdArquivo <> NUMERO_INDEFINIDO) then
          begin
            dmDig.tbHistorico.GotoBookmark(bk);
            repeat
              dmDIG.tbHistorico.Edit;
              dmDIG.tbHistoricoCD_ARQUIVO.AsInteger := nCdArquivo;
              dmDIG.tbHistorico.Post;
              bContinuar := not dmDig.tbHistorico.LocateNext('CD_GRUPO',nCdGrupo,[]);
            until bContinuar;
          end;

          if ExisteNodo(framArvore1.tv, dmDIG.tbHistoricoDS_GRUPO.AsString, nd) then
          begin
            if not ExisteArquivo(framArvore1.tv, nCdArquivo, nd) then
            begin
              nOrdem := dmDIG.tbArquivo_Digital.RecordCount;
              ndc := framArvore1.tv.Items.AddChild(nd, 'Documento' + inttostr(nOrdem));
              New(pRec);
              pRec^.id := nCdArquivo;
              pRec^.tipo := 2;
              ndc.Data := pRec;
              ndc.Selected := true;
            end
            else
              nd.Selected := true;
          end;
          result := true;
         end;
      end;
    end
    else
    begin
      wpEditor.CPPosition := 0;
      wpEditor.CurrAttr.Alignment := paralLeft;
      if (dmDIG.tbHistoricoCD_ARQUIVO.AsString <> '') then
        nCdArquivo := dmDIG.tbHistoricoCD_ARQUIVO.AsInteger;
      dmDig.tbHistoricoBL_HISTORICO.SaveToStream(ms);
      ms.Position := 0;
      sLinha := 'Criado em ' +
              dmDig.tbHistoricoDT_HISTORICO.AsString + ' por ' +
              dmDig.tbHistoricoNM_MEDICO.AsString;
      wpEditor.CPPosition := Length(wpEditor.Text);

      p := wpEditor.InputParagraph;
      p.LoadFromStream(ms);
      wpEditor.CPPosition := Length(wpEditor.Text);
      wpEditor.InputStringW(#13#10);
      wpEditor.InputStringW(#13#10);
      wpEditor.InputStringW(#13#10);

      wpEditor.InputStringW(sLinha);
      wpEditor.CPPosition := Length(wpEditor.Text);
      wpEditor.InputStringW(#13#10);
      wpEditor.InputNewObject(wpobjHorizontalLine);
      wpEditor.CPPosition := Length(wpEditor.Text);

      ms.SetSize(0);

      wpEditor.ReformatAll(true);
      ms.SetSize(0);
      wpEditor.SaveToStream(ms);
      wpEditor.Modified := true;
      ms.Position := 0;

      if ms.size>0 then
      begin
        nCdArquivo := SalvaArquivoDigital(nCdArquivo, nCdGrupo);
        if (nCdArquivo <> NUMERO_INDEFINIDO) then
        begin
          dmDig.tbHistorico.GotoBookmark(bk);
          dmDIG.tbHistorico.Edit;
          dmDIG.tbHistoricoCD_ARQUIVO.AsInteger := nCdArquivo;
          dmDIG.tbHistorico.Post;
        end;

        if ExisteNodo(framArvore1.tv, dmDIG.tbHistoricoDS_GRUPO.AsString, nd) then
        begin
          if not ExisteArquivo(framArvore1.tv, nCdArquivo, nd) then
          begin
            nOrdem := dmDIG.tbArquivo_Digital.RecordCount;
            ndc := framArvore1.tv.Items.AddChild(nd, 'Documento' + inttostr(nOrdem));
            New(pRec);
            pRec^.id := nCdArquivo;
            pRec^.tipo := 2;
            ndc.Data := pRec;
            ndc.Selected := true;
          end
          else
            nd.Selected := true;
        end;
        result := true;
      end;
    end;
  finally
    ms.Free;
  end;
end;

procedure TfrmProcessoUtente.tabHistoricoShow(Sender: TObject);
begin
//
  dsHistorico.DataSet.AfterScroll := tbHistoricoAfterScroll;
  dxDBGrid2.SetFocus;
  if dxDBGrid2.SelectedNodes[0]<>nil then
    dxDBGrid2.SelectedNodes[0].Expanded := true;
end;

procedure TfrmProcessoUtente.tabHistoricoExit(Sender: TObject);
begin
  dsHistorico.DataSet.AfterScroll := nil;
end;

procedure TfrmProcessoUtente.SpeedButton1Click(Sender: TObject);
begin
  SalvarDocumento;
end;

procedure TfrmProcessoUtente.Button1Click(Sender: TObject);
var sRTF,sPDF:string;
begin
  sRTF := 'c:\temp\teste.rtf';
  sPDF := 'c:\temp\convertido.pdf';
  wpEditor.SaveToFile(sRTF);
  frmConvertePDF.Caption := 'Abrir';
  frmConvertePDF.Update;
  frmConvertePDF.btn7Click(frmConvertePDF.btn7); //Abrir
end;

procedure TfrmProcessoUtente.Button2Click(Sender: TObject);
begin
  frmConvertePDF.Caption := 'Carregar';
  frmConvertePDF.Update;
  frmConvertePDF.btn1Click(frmConvertePDF.btn1); //Carregar
end;

procedure TfrmProcessoUtente.Button3Click(Sender: TObject);
begin
  frmConvertePDF.Caption := 'Converter';
  frmConvertePDF.Update;
  frmConvertePDF.btn2Click(frmConvertePDF.btn2); //Converter

  pgGeral.ActivePage := tabPDF;
  spWPViewPDFCompatible1.LoadFromFile('c:\temp\teste.pdf');
end;

procedure TfrmProcessoUtente.btConverteRTF_PDFClick(Sender: TObject);
var sRTF,sPDF, sT:string;

  procedure Tempo;
  var i:integer;
  begin
    for i:=1 to 10 do
    begin
      Sleep(100);
      Application.ProcessMessages;
      Update;
    end;
  end;

begin
  spWPViewPDFCompatible1.Clear;
  sT := FormatDateTime('ddmmyyhhnnss',now);
  sRTF := 'c:\compware\temp\teste'+sT+'.rtf';
  sPDF := 'c:\compware\temp\convertido.pdf';
  if FileExists(sPDF) then
    DeleteFile(sPDF);
  wpEditor.SaveToFile(sRTF);
  Tempo;
  Abrir(true);
  Tempo;
  Carregar(sRTF);
  Tempo;
  Converter(sPDF);
  Tempo;
  if FileExists(sRTF) then
    DeleteFile(sRTF);
  spWPViewPDFCompatible1.LoadFromFile(sPDF);
end;

procedure TfrmProcessoUtente.btConfImpClick(Sender: TObject);
begin
  PrinterSetupDialog1.Execute;
end;

procedure TfrmProcessoUtente.btImpTodosClick(Sender: TObject);
var i:integer;
begin
  {for i:=0 to framArvore1.tv.Items.Count-1 do
  begin
    framArvore1.tv.Selected := framArvore1.tv.Items[i];
    wpEditor.Print;
  end;    }

 


end;

procedure TfrmProcessoUtente.edProcessoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if key = VK_RETURN then
    btProcessoClick(sender);
end;

procedure TfrmProcessoUtente.grAgendaDblClick(Sender: TObject);
begin

  if dsHistorico.State IN [dsInsert, dsEdit] then
  begin
    if rEditor.Modified then
      btSalvarHistClick(sender)
    else
      btCancelEditHistClick(sender);
  end;

  edProcesso.Text := dmGeral.TB_AGENDANR_PROCESSO.AsString;
  btProcessoClick(sender);
  pgGeral.ActivePage := tabProcesso;
end;

procedure TfrmProcessoUtente.dtAgendaChange(Sender: TObject);
begin
  ConsultaAgenda;
end;

procedure TfrmProcessoUtente.btAtualizarAgendaClick(Sender: TObject);
begin
  ConsultaAgenda;
end;

procedure TfrmProcessoUtente.pgGeralChange(Sender: TObject);
begin

  qyRX.Active := (pgGeral.ActivePage = tabRX);

  if pgGeral.ActivePage = tabAgenda then
      ConsultaAgenda;

  if pgGeral.ActivePage = tabMapa then
  begin
      ConsultaAgendaMapa;
      Mapa;
  end;

  if pgGeral.ActivePage = tabMapaMedico then
    begin
     framMapaMedico1.AtualizaDados;
     framMapaMedico1.CarregaDados;
     if framMapaMedico1.btEditar.Enabled = true then
     begin
       framMapaMedico1.wbPag1.Enabled := false;
       framMapaMedico1.wbPag2.Enabled := false;
     end;
    end;

  if pgGeral.ActivePage = tabNotificacao then
    frmCadNotificacao.AtualizaAspectosOMS;

end;


procedure TfrmProcessoUtente.Mapa;
var s,cab:TStrings; sTipo,sAux,sdata:string; i,x:integer;  bk:TBookmark;
begin
  s := TStringList.Create;
  try
    ApagaArquivoTemporario;
    {cab.add('<html>');
    cab.add('<head>');
    cab.add('<meta http-equiv=Content-Type content="text/html; charset=utf-8">');
    cab.add('<link rel=Stylesheet href="./Css/stylesheet.css">');
    cab.add('</head>');
    cab.add('<body link=blue vlink=purple class=xl65>');}

    //Abre modelo mapa
    s.LoadFromFile(sPathConsulta+'Modelo Mapa.html');
    sNome := sPathConsulta+'mapa'+FormatDateTime('ddmmyyyyhhnnss',Now)+'.html';
    //dmGeral.TB_AGENDA.DisableControls;
    //dmGeral.TB_AGENDA.Filter := 'CD_MEDICO = ' + dmGeral.TB_AGENDACD_MEDICO.AsString;
    //dmGeral.TB_AGENDA.Filtered := true;
    //cds.CloneCursor(dsControle.DataSet,false,false);

    sAux := RPad(qyAGENDA.FieldByName('NM_MEDICO').AsString,'_',35);
    sAux := RPad(sAux,' ',60);
    s.Text := StringReplace(s.Text,'Medico', sAux , []);
    x := qyAGENDA.FieldByName('CD_MEDICO').AsInteger;
    bk := qyAGENDA.GetBookmark;
    qyAGENDA.First;
    i:=0;
    while not qyAGENDA.Eof do
    begin
      //if (x = qyAGENDA.FieldByName('CD_MEDICO').AsInteger) then
      begin
        inc(i);
        sTipo := 'F';
        dmDig.tbArquivo_Digital.Close;
        dmDig.tbArquivo_Digital.ParamByName('NR_PROCESSO').AsString :=
           qyAGENDA.FieldByName('NR_PROCESSO').AsString;
        dmDig.tbArquivo_Digital.Open;
        if not dmDig.tbArquivo_Digital.IsEmpty then
             sTipo:= 'D';
        s.Text := StringReplace(s.Text,'Proc'+inttostr(i),
         sTipo+qyAGENDA.FieldByName('NR_PROCESSO').AsString ,[]);
        s.Text := StringReplace(s.Text,'Muni'+inttostr(i),
         qyAGENDA.FieldByName('DS_PROVINCIA').AsString+ ' ' +
         qyAGENDA.FieldByName('DS_MUNICIPIO').AsString,[]);
        s.Text := StringReplace(s.Text,'Paci'+inttostr(i),
         qyAGENDA.FieldByName('NM_PACIENTE').AsString,[]);
        if i=20 then Break;
      end;
      qyAGENDA.Next;
    end;
    qyAGENDA.GotoBookmark(bk);
    {TODO:Nao pode limitar somente em 20, deve fazer controle de paginacao}
    for x:=i to 20 do
    begin
      inc(i);
      s.Text := StringReplace(s.Text,'Proc'+inttostr(i),'',[]);
      s.Text := StringReplace(s.Text,'Muni'+inttostr(i),'',[]);
      s.Text := StringReplace(s.Text,'Paci'+inttostr(i),'',[]);
    end;
    //Data Agenda
    s.Text := StringReplace(s.Text,'DataDaAgenda', qyAGENDA.FieldByName('DT_AGENDA').AsString,[]);

    //dmGeral.TB_AGENDA.Filter := '';
    //dmGeral.TB_AGENDA.Filtered := False;
    //dmGeral.TB_AGENDA.EnableControls;
    s.SaveToFile(sNome);
    wbMapa.Navigate(sNome);
  except
    FreeAndNil(s);
  end;
end;

procedure TfrmProcessoUtente.ApagaArquivoTemporario;
begin
  if FileExists(sNome) then
    DeleteFile(sNome);
end;

procedure TfrmProcessoUtente.ConsultaAgendaMapa;
var sSql:string;
begin
  qyAGENDA.Close;
  sSQL := 'AND AGENDA.CD_MEDICO = :CD_MEDICO';
  sSQL := StringReplace(sSQLAgenda,'/*MEDICO*/', sSQL ,[]);
  qyAGENDA.SQL.Text := sSQL;
  qyAGENDA.ParamByName('CD_MEDICO').AsInteger :=
    dm.qyLoginCD_MEDICO.AsInteger;
  qyAGENDA.ParamByName('DT_DE').AsDate := trunc(dtAgenda.Date);
  qyAGENDA.ParamByName('DT_ATE').AsDate := trunc(dtAgenda.Date)+1;  
  qyAGENDA.Open;
end;

procedure TfrmProcessoUtente.btFiltroMedicoClick(Sender: TObject);
begin
  pnFiltroMedico.Visible := not pnFiltroMedico.Visible;
  cbMedico.ListSource.DataSet.Active := pnFiltroMedico.Visible;
  if pnFiltroMedico.Visible then
    cbMedico.ListSource.DataSet.Last;
  btAtualizarAgendaClick(sender);
end;

procedure TfrmProcessoUtente.edProcessoExit(Sender: TObject);
begin
  if edProcesso.Modified then
    btProcessoClick(sender);
end;

procedure TfrmProcessoUtente.framFicha11btSalvarHistClick(Sender: TObject);
begin
  framFicha11.btSalvarClick(sender);
end;
{
var sGrupo:String;
    nOrdem, nCdArquivo, nCdGrupo:integer;
    nd,ndc:TTreeNode;

  procedure ImprimeWb(wb:TWebBrowser);
  var lst:TStringList; dix,ix:integer;
    vIn, vOut:OleVariant;
  begin
    lst := TStringList.Create;
    dix := -1;  ix := -1;
    try
      lst.text := Printer.Printers.Text;
      ix := lst.IndexOf('Doro PDF Writer');
      dix := Printer.PrinterIndex;
      if dix<>ix then
        ChangeDefaultPrinter(ix);

      wb.ControlInterface.ExecWB(OLECMDID_PRINT,
        OLECMDEXECOPT_DONTPROMPTUSER, vIn, vOut);
    finally
      if dix<>ix then
        ChangeDefaultPrinter(dix);
      lst.Free;
    end;
  end;

begin
  if not (dmGeral.TB_PRIMEIRA_CONSULTA.state in [dsEdit, dsInsert]) then
    Exit;

  ncdGrupo := ValorParametro(nParGrupoForm1);
  sGrupo := PegaValor('DS_GRUPO','DIG_GRUPO',['CD_GRUPO'], [ncdGrupo], dmDIG.dbDig);
  dmGeral.TB_PRIMEIRA_CONSULTACD_GRUPO.AsInteger := ncdGrupo;

  framFicha11.btSalvarHistClick(sender);

  ncdArquivo := dmGeral.TB_PRIMEIRA_CONSULTACD_ARQUIVO.AsInteger;
  ImprimeWb(framFicha11.wbPag1);
  Sleep(30000);
  ncdArquivo := SalvaArquivoDigital2(ncdArquivo, ncdGrupo);

  if dmGeral.TB_PRIMEIRA_CONSULTACD_ARQUIVO.AsInteger <> ncdArquivo then
  begin
    dmGeral.TB_PRIMEIRA_CONSULTA.Edit;
    dmGeral.TB_PRIMEIRA_CONSULTACD_ARQUIVO.AsInteger := ncdArquivo;
  end;

  ncdArquivo := dmGeral.TB_PRIMEIRA_CONSULTACD_ARQUIVO2.AsInteger;
  ImprimeWb(framFicha11.wbPag2);
  ncdArquivo := SalvaArquivoDigital2(ncdArquivo, ncdGrupo);
  if dmGeral.TB_PRIMEIRA_CONSULTACD_ARQUIVO2.AsInteger <> ncdArquivo then
  begin
    dmGeral.TB_PRIMEIRA_CONSULTA.Edit;
    dmGeral.TB_PRIMEIRA_CONSULTACD_ARQUIVO2.AsInteger := ncdArquivo;
  end;

  if ExisteNodo(framArvore1.tv, sGrupo, nd) then
  begin
    if not ExisteArquivo(framArvore1.tv, nCdArquivo, nd) then
    begin
      nOrdem := dmDIG.tbArquivo_Digital.RecordCount;
      ndc := framArvore1.tv.Items.AddChild(nd, 'Documento' + inttostr(nOrdem));
      New(pRec);
      pRec^.id := nCdArquivo;
      pRec^.tipo := 2;
      ndc.Data := pRec;
      ndc.Selected := true;
    end
    else
      nd.Selected := true;
  end;
  if (dmGeral.TB_PRIMEIRA_CONSULTA.State in [dsEdit,dsInsert]) then
    dmGeral.TB_PRIMEIRA_CONSULTA.Post;
  dm.Commit(dmGeral.TB_PRIMEIRA_CONSULTA);
end;
}

function TfrmProcessoUtente.SalvaArquivoDigital2(
   pncdArquivo, pncdGrupo:integer): integer;
var ms: TMemoryStream; sFile:string;
begin
  ms := TMemoryStream.Create;
  try
    result := pncdArquivo;
    sFile:='c:\compware\temp\teste.pdf';
    frmDlgStatus.Show;
    frmDlgStatus.lbStatus.Caption := 'Salvando documento...';
    frmDlgStatus.pbStatus.Max := 100;
    frmDlgStatus.pbStatus.Position := 20;
    frmDlgStatus.Update;
    if FileExists(sFile) then
    begin
      frmDlgStatus.pbStatus.Position := 30;
      frmDlgStatus.Update;
      ms.LoadFromFile(sFile);
      ms.Position := 0;
      spWPViewPDFCompatible1.LoadFromStream(ms,0);
      frmDlgStatus.pbStatus.Position := 40;
      frmDlgStatus.Update;
      result := pncdArquivo;
      dmDIG.tbDig_Arquivo.ParamByName('CD_ARQUIVO').AsInteger := pncdArquivo;
      dmDIG.tbDig_Arquivo.Open;
      frmDlgStatus.pbStatus.Position := 50;
      frmDlgStatus.Update;
      if dmDIG.tbDig_Arquivo.IsEmpty then
       dmDIG.tbDig_Arquivo.Insert
      else
       dmDIG.tbDig_Arquivo.Edit;
      dmDIG.tbDig_ArquivoBL_ARQUIVO.LoadFromStream(ms);
      frmDlgStatus.pbStatus.Position := 60;
      frmDlgStatus.Update;
      dmDIG.tbDig_Arquivo.Post;
      frmDlgStatus.pbStatus.Position := 70;
      frmDlgStatus.Update;
      dmDIG.tbArquivo_Digital.ParamByName('NR_PROCESSO').AsString := edProcesso.Text;
      dmDIG.tbArquivo_Digital.Open;
      frmDlgStatus.pbStatus.Position := 80;
      frmDlgStatus.Update;
      if dmDIG.tbArquivo_Digital.Locate('NR_PROCESSO;CD_ARQUIVO',
         varArrayOf([strToInt(edProcesso.Text),pncdArquivo]),[]) then
        dmDIG.tbArquivo_Digital.Edit
      else
        dmDIG.tbArquivo_Digital.Insert;
      dmDIG.tbArquivo_DigitalNR_PROCESSO.AsString := edProcesso.Text;
      dmDIG.tbArquivo_DigitalCD_ARQUIVO.AsInteger :=
        dmDIG.tbDig_ArquivoCD_ARQUIVO.AsInteger;
      dmDIG.tbArquivo_DigitalCD_GRUPO.AsInteger := pncdGrupo;
      dmDIG.tbArquivo_DigitalTP_ARQUIVO.AsInteger := 1; //PDF
      dmDIG.tbArquivo_DigitalNU_ORDEM.AsInteger := 0;
      dmDIG.tbArquivo_Digital.Post;
      frmDlgStatus.pbStatus.Position := 90;
      frmDlgStatus.Update;
      result := dmDIG.tbDig_ArquivoCD_ARQUIVO.AsInteger;
    end;
  finally
    dmDIG.tbDig_Arquivo.Close;
    dmDIG.tbEdt_Arquivo.Close;
    if (dmDIG.tbArquivo_Digital.State in [dsEdit,dsInsert]) then
      dmDIG.tbArquivo_Digital.Cancel;
    ms.Free;
    frmDlgStatus.pbStatus.Position := 100;
    frmDlgStatus.Update;
    frmDlgStatus.Close;
  end;
end;

procedure TfrmProcessoUtente.framFicha11btEditarHistClick(Sender: TObject);
begin
  framFicha11.btEditarClick(Sender);
end;

procedure TfrmProcessoUtente.qyRXBeforeOpen(DataSet: TDataSet);
begin
  qyRX.ParamByName('CD_PACIENTE').AsInteger :=
    dmGeral.TB_PACIENTECD_PACIENTE.AsInteger;
end;

procedure TfrmProcessoUtente.qyRXAfterScroll(DataSet: TDataSet);
var sURL:string;
begin
  sURL := prmURLRX + qyRXNR_LAB.AsString;
  wbRX.Navigate(sURL);
end;

procedure TfrmProcessoUtente.framFicha31btNovoClick(Sender: TObject);
begin
  if dmGeral.TB_SEGUIMENTO_ENFERMAGEMCD_PACIENTE.AsInteger =
    dmGeral.TB_PACIENTECD_PACIENTE.AsInteger then
    begin
      qySeguimentoEnfermagem.ParamByName('paciente').AsInteger :=
      dmGeral.TB_SEGUIMENTO_ENFERMAGEMCD_PACIENTE.AsInteger;
      qySeguimentoEnfermagem.ParamByName('data').AsDateTime := dm.GetDate;
      qySeguimentoEnfermagem.Open;
      if not qySeguimentoEnfermagem.Eof then
        MessageDlg('Cadastro existente, com a data do Diagnóstico igual a data atual!',mtInformation,
            [mbOK],0)
       else
       begin
         framFicha31.CarregaDadosCabecalho;
         framFicha31.btNovoClick(Sender);
       end;


      qySeguimentoEnfermagem.Close;
    end
    else
      begin
      framFicha31.CarregaDadosCabecalho;
      framFicha31.btNovoClick(Sender);
      end
end;

procedure TfrmProcessoUtente.framFicha31btSalvarClick(Sender: TObject);
begin
  framFicha31.btSalvarClick(Sender);

end;

procedure TfrmProcessoUtente.framFicha31btPreviewClick(Sender: TObject);
begin
  framFicha31.btPreviewClick(Sender);

end;

procedure TfrmProcessoUtente.framFicha31btEditarClick(Sender: TObject);
begin
  framFicha31.btEditarClick(Sender);

end;

procedure TfrmProcessoUtente.framFicha41btNovoClick(Sender: TObject);
begin
  if dmGeral.TB_TRIAGEM_ENFERMAGEMCD_PACIENTE.AsInteger =
    dmGeral.TB_PACIENTECD_PACIENTE.AsInteger then
    begin
      qyTriagemEnfermagem.ParamByName('paciente').AsInteger :=
      dmGeral.TB_TRIAGEM_ENFERMAGEMCD_PACIENTE.AsInteger;
      qyTriagemEnfermagem.ParamByName('data').AsDateTime := dm.GetDate;
      qyTriagemEnfermagem.Open;
      if not qyTriagemEnfermagem.Eof then
        MessageDlg('Cadastro existente, com a data atual!',mtInformation,
            [mbOK],0)
       else
       begin
         framFicha41.CarregaDadosCabecalho;
         framFicha41.btNovoClick(Sender);
       end;
      qyTriagemEnfermagem.Close;
    end
    else
      begin
        framFicha41.CarregaDadosCabecalho;
        framFicha41.btNovoClick(Sender);
      end

end;

procedure TfrmProcessoUtente.framFicha41btAnteriorClick(Sender: TObject);
begin
  framFicha41.btAnteriorClick(Sender);

end;

procedure TfrmProcessoUtente.framFicha41btProximoClick(Sender: TObject);
begin
  framFicha41.btProximoClick(Sender);

end;

procedure TfrmProcessoUtente.framFicha31btAnteriorClick(Sender: TObject);
begin
  framFicha31.btAnteriorClick(Sender);

end;

procedure TfrmProcessoUtente.framFicha31btProximoClick(Sender: TObject);
begin
  framFicha31.btProximoClick(Sender);

end;

procedure TfrmProcessoUtente.framFicha21btEditarClick(Sender: TObject);
begin
  framFicha21.btEditarClick(Sender);

end;

procedure TfrmProcessoUtente.framFicha41btSalvarClick(Sender: TObject);
begin
  framFicha41.btSalvarClick(Sender);

end;

procedure TfrmProcessoUtente.framFicha41btEditarClick(Sender: TObject);
begin
  framFicha41.btEditarClick(Sender);

end;

procedure TfrmProcessoUtente.framFicha41btConfImpClick(Sender: TObject);
begin
  framFicha41.btConfImpClick(Sender);

end;

procedure TfrmProcessoUtente.framFicha41btPreviewClick(Sender: TObject);
begin
  framFicha41.btPreviewClick(Sender);

end;

procedure TfrmProcessoUtente.framFicha41btImprimirClick(Sender: TObject);
begin
  framFicha41.btImprimirClick(Sender);

end;

procedure TfrmProcessoUtente.framMapaMedico1btEditarClick(Sender: TObject);
begin
  framMapaMedico1.btEditarClick(Sender);

end;

procedure TfrmProcessoUtente.framMapaMedico1btSalvarClick(Sender: TObject);
begin
  framMapaMedico1.btSalvarClick(Sender);

end;

procedure TfrmProcessoUtente.CID101Click(Sender: TObject);
begin
  frmCID10 := TfrmCID10.Create(nil);
  frmCID10.ShowModal;
  frmCID10.Free;
  framMapaMedico1.qyMedicoMapa.Close;
  frmCID10 := TfrmCID10.Create(Application);
  frmCID10.bSelecionar := true;
  framMapaMedico1.qyMedicoMapa.Open;


end;

procedure TfrmProcessoUtente.ProdutividadePorPerodo1Click(Sender: TObject);
begin
  frmConProdutividadeMedico := TfrmConProdutividadeMedico.Create(nil);
  frmConProdutividadeMedico.ShowModal;
  frmConProdutividadeMedico.Free;

end;

procedure TfrmProcessoUtente.EsquemaTotal1Click(Sender: TObject);
begin
  frmConEsquemaTotal := TfrmConEsquemaTotal.Create(nil);
  frmConEsquemaTotal.ShowModal;
  frmConEsquemaTotal.Free;

end;

procedure TfrmProcessoUtente.EsquemaProcessoTotal1Click(Sender: TObject);
begin
  frmConEsquemaProcessoTotal := TfrmConEsquemaProcessoTotal.Create(nil);
  frmConEsquemaProcessoTotal.ShowModal;
  frmConEsquemaProcessoTotal.Free;

end;

procedure TfrmProcessoUtente.btLimparVinculoClick(Sender: TObject);
begin
  lkMedico.LookupValue := '';
  lkMedico.Text := '';
end;

procedure TfrmProcessoUtente.FormKeyPress(Sender: TObject; var Key: Char);

  // SOLUCAO PARA O ENTER NO TEXTAREA DO TWEBBROWSER
  procedure enter;
  begin
    if key=#13 then
      begin
        Keybd_Event(VK_LCONTROL, 0, 0, 0);    //Ctrl key down
        Keybd_Event(Ord('M'), MapVirtualKey(Ord('M'), 0), 0, 0); // 'M' key down
        Keybd_Event(Ord('M'), MapVirtualKey(Ord('M'), 0), KEYEVENTF_KEYUP, 0); // 'M' Key up
        Keybd_Event(VK_LCONTROL, 0, KEYEVENTF_KEYUP, 0); // Ctrl key up
      end;
  end;

begin
  if pgGeral.ActivePage=tabFicha1 then
    enter;

  if pgGeral.ActivePage=tabFicha2 then
    enter;

  if pgGeral.ActivePage=tabFicha3 then
    enter;

  if pgGeral.ActivePage=tabFicha4 then
    enter;


end;

procedure TfrmProcessoUtente.pdfPageChange(Sender: TObject);
begin
   edPaginaAtual.Text:=inttostr(pdf.PageNumber);

   lbQtdPag.Caption:=inttostr(pdf.PageCount);

   if pdf.PageNumber=1 then
     begin
      btPagPrimeira.Enabled:=false;
      btPagAnterior.Enabled:=false;
     end
   else
     begin
      btPagPrimeira.Enabled:=true;
      btPagAnterior.Enabled:=true;
     end;

   if pdf.PageNumber=pdf.PageCount then
    begin
      btPagUltima.Enabled:=false;
      btPagProxima.Enabled:=false
    end
   else
    begin
      btPagUltima.Enabled:=true;
      btPagProxima.Enabled:=true;
    end;
 { if pdf.PageCount=1 then
      begin    //desativa botoes
        btPagProxima.Enabled:=false; btPagAnterior.Enabled:=false;
        btPagPrimeira.Enabled:=false; btPagUltima.Enabled:=false;
      end
   else
      begin       //ativa botoes
        btPagProxima.Enabled:=true; btPagAnterior.Enabled:=true;
        btPagPrimeira.Enabled:=true; btPagUltima.Enabled:=true;
      end;    }

end;

procedure TfrmProcessoUtente.edPaginaAtualChange(Sender: TObject);
var atual, iPag: integer;
begin


end;

procedure TfrmProcessoUtente.btPagPrimeiraClick(Sender: TObject);
begin
  pdf.PageNumber:=1;
end;

procedure TfrmProcessoUtente.btPagAnteriorClick(Sender: TObject);
begin
  if pdf.PageNumber>1 then
    pdf.PageNumber:=pdf.PageNumber-1;
end;

procedure TfrmProcessoUtente.btPagProximaClick(Sender: TObject);
begin
    if pdf.PageNumber<pdf.PageCount then
      pdf.PageNumber:=pdf.PageNumber+1;
end;

procedure TfrmProcessoUtente.btPagUltimaClick(Sender: TObject);
begin
   pdf.PageNumber:=pdf.PageCount;
end;

procedure TfrmProcessoUtente.edPaginaAtualKeyPress(Sender: TObject;
  var Key: Char);
var atual,iPag: integer;
begin
  if key=#13 then
    begin
      edPaginaAtualExit(sender);
    end;


end;

procedure TfrmProcessoUtente.edPaginaAtualExit(Sender: TObject);
var iPag,atual:integer;
begin
        iPag:=strtoint(edPaginaAtual.Text);
        if iPag> pdf.PageCount then ipag:=pdf.PageCount;
        if iPag<1 then iPag:=1;
        if (iPag>=1) and (iPag<=pdf.PageCount)then
          begin
              atual:=pdf.PageNumber;
              if iPag<>atual then
                    pdf.PageNumber:=iPag;
          end;

        edPaginaAtual.Text:=inttostr(iPag);
        pdfPageChange(self);

        pdf.SetFocus;

end;

procedure TfrmProcessoUtente.ransferenciaporUtente1Click(Sender: TObject);
begin
  frmRelTransferencia := TfrmRelTransferencia.Create(nil);
  frmRelTransferencia.ShowModal;
  frmRelTransferencia.Free;

end;

procedure TfrmProcessoUtente.StatusBar1DrawPanel(StatusBar: TStatusBar;
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
    ImageList2.Draw(StatusBar1.Canvas,Rect.Left+5,Rect.Top+1,Panel.Index);

    //Bases
    if Panel.Index = 0 then
      TextOut(Rect.Left + 25, Rect.Top + 1,'Base DIG:' + dmDIG.dbDig.DatabaseName +
                           '    Base SIS:' + dm.db.DatabaseName);
    //Médico
    if Panel.Index = 1 then
      TextOut(Rect.Left + 25, Rect.Top + 1,'ATM.: ' + dm.qyLoginNM_MEDICO.AsString);

    //Unidade
    if Panel.Index = 2 then
      TextOut(Rect.Left + 25, Rect.Top + 1,'UND: ' + prmUnidade +'-'+ sUnidadeDefautDescricao);

   end;

end;

procedure TfrmProcessoUtente.framFicha11btEditarClick(Sender: TObject);
begin
  framFicha11.btEditarClick(Sender);
end;

procedure TfrmProcessoUtente.framFicha11btSalvarClick(Sender: TObject);
begin
  framFicha11.btSalvarClick(Sender);
end;

procedure TfrmProcessoUtente.framFicha31btConfImpClick(Sender: TObject);
begin
  framFicha31.btConfImpClick(Sender);
end;

procedure TfrmProcessoUtente.framFicha31btImprimirClick(Sender: TObject);
begin
  framFicha31.btImprimirClick(Sender);
end;

procedure TfrmProcessoUtente.MarcarRealizado1Click(Sender: TObject);
begin
  dmGeral.TB_AGENDA.Edit;
  dmGeral.TB_AGENDAFL_REALIZADO.AsString := cvSim;
  dmGeral.TB_AGENDA.Post;
  dm.Commit(dmGeral.TB_AGENDA);
end;

procedure TfrmProcessoUtente.btProcessarArquivoClick(Sender: TObject);
begin
  try
    bGerarArquivo := true;
    SalvarDocumento;
    //btSalvarHistClick(sender);
  finally
    bGerarArquivo := false;
  end;
end;

procedure TfrmProcessoUtente.framFicha11btNovoClick(Sender: TObject);
begin
//  framFicha11.btNovoClick(Sender);

end;

end.
