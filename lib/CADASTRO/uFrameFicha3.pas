unit uFrameFicha3;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, OleCtrls, SHDocVw, ExtCtrls, ComCtrls, Buttons, DB,  Httpapp, MSHTML,
  Printers;

type
  TframFicha3 = class(TFrame)
    pnToolBar: TPanel;
    pgFicha: TPageControl;
    tabPag1: TTabSheet;
    tabPag2: TTabSheet;
    btNovo: TSpeedButton;
    btEditar: TSpeedButton;
    btCancelEdit: TSpeedButton;
    btSalvar: TSpeedButton;
    dsAvaliacaoInicial: TDataSource;
    wbPag1: TWebBrowser;
    wbPag2: TWebBrowser;
    btConfImp: TSpeedButton;
    btImprimir: TSpeedButton;
    btPreview: TSpeedButton;
    btAnterior: TSpeedButton;
    btProximo: TSpeedButton;
    procedure btSalvarClick(Sender: TObject);
    procedure btEditarClick(Sender: TObject);
    procedure btConfImpClick(Sender: TObject);
    procedure btImprimirClick(Sender: TObject);
    procedure btPreviewClick(Sender: TObject);
    procedure btAnteriorClick(Sender: TObject);
    procedure btProximoClick(Sender: TObject);
    procedure btNovoClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure AbrePaginas;
    procedure AbreConsulta;
    procedure CarregaDadosCabecalho;
    procedure CarregaDados;
    procedure SalvarDados;
    procedure AtualizarDados;
    function  GetElementById(const Doc: IDispatch; const Id: string): IDispatch;
    function  GetElementByName(const Doc: IDispatch; const Name: string): IDispatch;
    function  RetornaValor(wb:TWebBrowser; id,att:string):OleVariant;
    procedure DefineValor(wb:TWebBrowser; id,att:string; oValor:OleVariant);
  end;

implementation

uses UGeral, UDMGERAL, UDM;

{$R *.dfm}

{ TframFicha1 }

procedure TframFicha3.AbreConsulta;
begin
  dmGeral.TB_SEGUIMENTO_ENFERMAGEM.Close;
  dmGeral.TB_SEGUIMENTO_ENFERMAGEM.ParamByName('CD_PACIENTE').AsInteger :=
     dmGeral.TB_PACIENTECD_PACIENTE.AsInteger;
  dmGeral.TB_SEGUIMENTO_ENFERMAGEM.Open;
  dmGeral.TB_SEGUIMENTO_ENFERMAGEM.Last;
  if dmGeral.TB_SEGUIMENTO_ENFERMAGEM.IsEmpty then
    CarregaDadosCabecalho
  else
    CarregaDados;
end;

procedure TframFicha3.AbrePaginas;
var sUrl :string;
begin
  sUrl := sPathConsulta + 'SeguimentoEnfermagem1.html';
  wbPag1.Navigate(sUrl);
  sUrl := sPathConsulta + 'SeguimentoEnfermagem2.html';
  wbPag2.Navigate(sUrl);
end;

function TframFicha3.GetElementById(const Doc: IDispatch; const Id: string): IDispatch;
var
  Document: IHTMLDocument2;     // IHTMLDocument2 interface of Doc
  Body: IHTMLElement2;          // document body element
  Tags: IHTMLElementCollection; // all tags in document body
  Tag: IHTMLElement;            // a tag in document body
  I: Integer;                   // loops thru tags in document body
begin
  Result := nil;
  // Check for valid document: require IHTMLDocument2 interface to it
  if not Supports(Doc, IHTMLDocument2, Document) then
    raise Exception.Create('Invalid HTML document');
  // Check for valid body element: require IHTMLElement2 interface to it
  if not Supports(Document.body, IHTMLElement2, Body) then
    raise Exception.Create('Can''t find <body> element');
  // Get all tags in body element ('*' => any tag name)
  Tags := Body.getElementsByTagName('*');
  // Scan through all tags in body
  for I := 0 to Pred(Tags.length) do
  begin
    // Get reference to a tag
    Tag := Tags.item(I, EmptyParam) as IHTMLElement;
    // Check tag's id and return it if id matches
    if AnsiSameText(Tag.id, Id) then
    begin
      Result := Tag;
      Break;
    end;
  end;
end;

function TframFicha3.GetElementByName(const Doc: IDispatch; const Name: string): IDispatch;
var
  Document: IHTMLDocument2;     // IHTMLDocument2 interface of Doc
  Body: IHTMLElement2;          // document body element
  Tags: IHTMLElementCollection; // all tags in document body
  Tag: IHTMLElement;            // a tag in document body
  I: Integer;                   // loops thru tags in document body
begin
  Result := nil;
  // Check for valid document: require IHTMLDocument2 interface to it
  if not Supports(Doc, IHTMLDocument2, Document) then
    raise Exception.Create('Invalid HTML document');
  // Check for valid body element: require IHTMLElement2 interface to it
  if not Supports(Document.body, IHTMLElement2, Body) then
    raise Exception.Create('Can''t find <body> element');
  // Get all tags in body element ('*' => any tag name)
  Tags := Body.getElementsByTagName('*');
  // Scan through all tags in body
  for I := 0 to Pred(Tags.length) do
  begin
    // Get reference to a tag
    Tag := Tags.item(I, EmptyParam) as IHTMLElement;
    // Check tag's id and return it if id matches
    if AnsiSameText(Tag.tagName, Name) then
    begin
      Result := Tag;
      Break;
    end;
  end;
end;

function TframFicha3.RetornaValor(wb:TWebBrowser; id,att:string):OleVariant;
var
  Elem: IHTMLElement;
  oValor:OleVariant;
begin
  Elem := GetElementById(wb.Document, id) as IHTMLElement;
  if Assigned(Elem) then
  begin
    oValor := Elem.getAttribute(att,0);
    result := oValor;
  end;
end;

procedure  TframFicha3.DefineValor(wb:TWebBrowser; id,att:string; oValor:OleVariant);
var
  Elem: IHTMLElement;
begin
  Elem := GetElementById(wb.Document, id) as IHTMLElement;
  if Assigned(Elem) then
  begin
    if att = 'innerHtml' then
      Elem.innerHTML := oValor
    else
      Elem.setAttribute(att,oValor,0);
  end;
end;

procedure TframFicha3.SalvarDados;
var
  oValor:OleVariant;
  sValor:string;
  i:integer;
begin
  dmGeral.TB_SEGUIMENTO_ENFERMAGEM.Edit;

  dmGeral.TB_SEGUIMENTO_ENFERMAGEMCD_PACIENTE.AsInteger :=
      dmGeral.TB_PACIENTECD_PACIENTE.AsInteger;

//Data Diagnostico
  sValor := RetornaValor(wbPag1, 'txdtdiagnostico', 'value');
  dmGeral.TB_SEGUIMENTO_ENFERMAGEMDT_DIAGNOSTICO.AsString := sValor;

//Inicio ou tratamento
  sValor := '';
  oValor := RetornaValor(wbPag1, 'rbdttarvI','checked');
  if oValor then sValor := RetornaValor(wbPag1, 'rbdttarvI','value');
  oValor := RetornaValor(wbPag1, 'rbdttarvT','checked');
  if oValor then  sValor := RetornaValor(wbPag1, 'rbdttarvT','value');
  dmGeral.TB_SEGUIMENTO_ENFERMAGEMFL_DATA_INICIO.AsString := sValor;

  sValor := RetornaValor(wbPag1, 'txdttarv', 'value');
  dmGeral.TB_SEGUIMENTO_ENFERMAGEMDT_DATA_INICIO.AsString := sValor;

  sValor := '';
  oValor := RetornaValor(wbPag1, 'rbdstarv1','checked');
  if oValor then sValor := RetornaValor(wbPag1, 'rbdstarv1','value');
  oValor := RetornaValor(wbPag1, 'rbdstarv2','checked');
  if oValor then  sValor := RetornaValor(wbPag1, 'rbdstarv2','value');
  oValor := RetornaValor(wbPag1, 'rbdstarv3','checked');
  if oValor then sValor := RetornaValor(wbPag1, 'rbdstarv3','value');
  oValor := RetornaValor(wbPag1, 'rbdstarv4','checked');
  if oValor then  sValor := RetornaValor(wbPag1, 'rbdstarv4','value');
  dmGeral.TB_SEGUIMENTO_ENFERMAGEMFL_INICIO.AsString := sValor;

  sValor := RetornaValor(wbPag1, 'txesquemauso', 'value');
  dmGeral.TB_SEGUIMENTO_ENFERMAGEMTX_ESQUEMA.AsString := sValor;

//Sinais Vitais
  for i := 1 to 7 do
  begin
    sValor := '';
    sValor := RetornaValor(wbPag1, 'txVit'+intTostr(i), 'value');
    dmGeral.TB_SEGUIMENTO_ENFERMAGEM.FieldByName('TX_SINAIS_VITAIS'+intTostr(i)).AsString := sValor;
  end;

  sValor := '';
  oValor := RetornaValor(wbPag1, 'rbperdaS','checked');
  if oValor then sValor := RetornaValor(wbPag1, 'rbperdaS','value');
  oValor := RetornaValor(wbPag1, 'rbperdaN','checked');
  if oValor then  sValor := RetornaValor(wbPag1, 'rbperdaN','value');
  dmGeral.TB_SEGUIMENTO_ENFERMAGEMFL_PERDA.AsString := sValor;

//Compareceu
  sValor := '';
  oValor := RetornaValor(wbPag1, 'rbcompareceuS','checked');
  if oValor then sValor := RetornaValor(wbPag1, 'rbcompareceuS','value');
  oValor := RetornaValor(wbPag1, 'rbcompareceuN','checked');
  if oValor then  sValor := RetornaValor(wbPag1, 'rbcompareceuN','value');
  dmGeral.TB_SEGUIMENTO_ENFERMAGEMFL_COMP_ULTIMA_CONSULTA.AsString := sValor;

  sValor := RetornaValor(wbPag1, 'txcompareceu', 'value');
  dmGeral.TB_SEGUIMENTO_ENFERMAGEMTX_COMP_ULTIMA_CONSULTA.AsString := sValor;


//Analises solicitadas
  sValor := '';
  oValor := RetornaValor(wbPag1, 'rbanalisesS','checked');
  if oValor then sValor := RetornaValor(wbPag1, 'rbanalisesS','value');
  oValor := RetornaValor(wbPag1, 'rbanalisesN','checked');
  if oValor then  sValor := RetornaValor(wbPag1, 'rbanalisesN','value');
  dmGeral.TB_SEGUIMENTO_ENFERMAGEMFL_ANAL_ULTIMA_CONSULTA.AsString := sValor;

  sValor := RetornaValor(wbPag1, 'txanalises', 'value');
  dmGeral.TB_SEGUIMENTO_ENFERMAGEMTX_ANAL_ULTIMA_CONSULTA.AsString := sValor;

//Cotrimoxazol
  sValor := '';
  oValor := RetornaValor(wbPag1, 'rbcotrimoxazolS','checked');
  if oValor then sValor := RetornaValor(wbPag1, 'rbcotrimoxazolS','value');
  oValor := RetornaValor(wbPag1, 'rbcotrimoxazolN','checked');
  if oValor then  sValor := RetornaValor(wbPag1, 'rbcotrimoxazolN','value');
  dmGeral.TB_SEGUIMENTO_ENFERMAGEMFL_USO_COTRIMOXAZOL.AsString := sValor;

//Sinais Paludismo
  sValor := '';
  oValor := RetornaValor(wbPag1, 'rbspaludismoN','checked');
  if oValor then sValor := RetornaValor(wbPag1, 'rbspaludismoN','value');
  oValor := RetornaValor(wbPag1, 'rbspaludismoS','checked');
  if oValor then  sValor := RetornaValor(wbPag1, 'rbspaludismoS','value');
  dmGeral.TB_SEGUIMENTO_ENFERMAGEMFL_SINAIS_PALUDISMO.AsString := sValor;

//Diagnóstico Paludismo
  sValor := '';
  oValor := RetornaValor(wbPag1, 'rbdpaludismoN','checked');
  if oValor then sValor := RetornaValor(wbPag1, 'rbdpaludismoN','value');
  oValor := RetornaValor(wbPag1, 'rbdpaludismoS','checked');
  if oValor then  sValor := RetornaValor(wbPag1, 'rbdpaludismoS','value');
  dmGeral.TB_SEGUIMENTO_ENFERMAGEMFL_DIAG_PALUDISMO.AsString := sValor;

//Sinais tuberculose
  sValor := '';
  oValor := RetornaValor(wbPag1, 'rbstuberculoseN','checked');
  if oValor then sValor := RetornaValor(wbPag1, 'rbstuberculoseN','value');
  oValor := RetornaValor(wbPag1, 'rbstuberculoseS','checked');
  if oValor then  sValor := RetornaValor(wbPag1, 'rbstuberculoseS','value');
  dmGeral.TB_SEGUIMENTO_ENFERMAGEMFL_SINAIS_TUBERCULOSE.AsString := sValor;

//Diagnóstico tuberculose
  sValor := '';
  oValor := RetornaValor(wbPag1, 'rbdtuberculoseN','checked');
  if oValor then sValor := RetornaValor(wbPag1, 'rbdtuberculoseN','value');
  oValor := RetornaValor(wbPag1, 'rbdtuberculoseS','checked');
  if oValor then  sValor := RetornaValor(wbPag1, 'rbdtuberculoseS','value');
  dmGeral.TB_SEGUIMENTO_ENFERMAGEMFL_DIAG_TUBERCULOSE.AsString := sValor;

//Tratamento tuberculose
  sValor := '';
  oValor := RetornaValor(wbPag1, 'rbtratamentoTN','checked');
  if oValor then sValor := RetornaValor(wbPag1, 'rbtratamentoTN','value');
  oValor := RetornaValor(wbPag1, 'rbtratamentoTS','checked');
  if oValor then  sValor := RetornaValor(wbPag1, 'rbtratamentoTS','value');
  dmGeral.TB_SEGUIMENTO_ENFERMAGEMFL_TRAT_TUBERCULOSE.AsString := sValor;

  sValor := RetornaValor(wbPag1, 'txtratamentoT', 'value');
  dmGeral.TB_SEGUIMENTO_ENFERMAGEMTX_TRAT_TUBERCULOSE.AsString := sValor;

//Outras queixas
  sValor := RetornaValor(wbPag1, 'txQueixas', 'value');
  dmGeral.TB_SEGUIMENTO_ENFERMAGEMTX_OUTRAS_QUEIXAS.AsString := sValor;


//Principais analises TX
  for i := 1 to 11 do
  begin
    sValor := '';
    sValor := RetornaValor(wbPag1, 'txPA'+intTostr(i), 'value');
    dmGeral.TB_SEGUIMENTO_ENFERMAGEM.FieldByName('TX_PRINCIPAIS_ANALISES'+intTostr(i)).AsString := sValor;
  end;

//Principais analises DT
  for i := 1 to 6 do
  begin
    sValor := '';
    sValor := RetornaValor(wbPag1, 'txdtPA'+intTostr(i), 'value');
    dmGeral.TB_SEGUIMENTO_ENFERMAGEM.FieldByName('DT_PRINCIPAIS_ANALISES'+intTostr(i)).AsString := sValor;
  end;

//Sem sinais
  sValor := '';
  oValor := RetornaValor(wbPag1, 'cksemsinais', 'checked');
  if oValor then sValor := 'S' else sValor := 'N';
  dmGeral.TB_SEGUIMENTO_ENFERMAGEMFL_SEM_SINAIS_SINTOMAS.AsString := sValor;

//Com sinais
  sValor := '';
  oValor := RetornaValor(wbPag1, 'ckcomsinais', 'checked');
  if oValor then sValor := 'S' else sValor := 'N';
  dmGeral.TB_SEGUIMENTO_ENFERMAGEMFL_COM_SINAIS_SINTOMAS.AsString := sValor;

//Hb maior
  sValor := '';
  oValor := RetornaValor(wbPag1, 'cksehbmaior', 'checked');
  if oValor then sValor := 'S' else sValor := 'N';
  dmGeral.TB_SEGUIMENTO_ENFERMAGEMFL_INICIAR_TARV1.AsString := sValor;

//Hb menor
  sValor := '';
  oValor := RetornaValor(wbPag1, 'cksehbmenor', 'checked');
  if oValor then sValor := 'S' else sValor := 'N';
  dmGeral.TB_SEGUIMENTO_ENFERMAGEMFL_INICIAR_TARV2.AsString := sValor;

//Se CD4
  sValor := '';
  oValor := RetornaValor(wbPag1, 'cksecd4', 'checked');
  if oValor then sValor := 'S' else sValor := 'N';
  dmGeral.TB_SEGUIMENTO_ENFERMAGEMFL_INICIAR_PROFILAXIA1.AsString := sValor;

//cotrimoxazol
  sValor := '';
  oValor := RetornaValor(wbPag1, 'ckcomsinaiscotrimoxazol', 'checked');
  if oValor then sValor := 'S' else sValor := 'N';
  dmGeral.TB_SEGUIMENTO_ENFERMAGEMFL_INICIAR_PROFILAXIA2.AsString := sValor;

//**PG2**

//ckA
  for i := 1 to 2 do
  begin
    sValor := '';
    oValor := RetornaValor(wbPag2, 'ckA'+intToStr(i),'checked');
    if oValor then sValor := 'S' else sValor := 'N';
    dmGeral.TB_SEGUIMENTO_ENFERMAGEM.FieldByName('FL_TRAT_ARV_A'+intToStr(i)).AsString := sValor;
  end;

//ckB
  for i := 1 to 6 do
  begin
    sValor := '';
    oValor := RetornaValor(wbPag2, 'ckB'+intToStr(i),'checked');
    if oValor then sValor := 'S' else sValor := 'N';
    dmGeral.TB_SEGUIMENTO_ENFERMAGEM.FieldByName('FL_TRAT_ARV_B'+intToStr(i)).AsString := sValor;
  end;

  sValor := RetornaValor(wbPag2, 'txB1reacao', 'value');
  dmGeral.TB_SEGUIMENTO_ENFERMAGEMTX_TRAT_ARV_B1_REACAO.AsString := sValor;

  sValor := RetornaValor(wbPag2, 'txB1conduta', 'value');
  dmGeral.TB_SEGUIMENTO_ENFERMAGEMTX_TRAT_ARV_B1_CONDUTA.AsString := sValor;

//ckC
  for i := 1 to 6 do
  begin
    sValor := '';
    oValor := RetornaValor(wbPag2, 'ckC'+intToStr(i),'checked');
    if oValor then sValor := 'S' else sValor := 'N';
    dmGeral.TB_SEGUIMENTO_ENFERMAGEM.FieldByName('FL_TRAT_ARV_C'+intToStr(i)).AsString := sValor;
  end;

//Uso de TARV
  sValor := '';
  oValor := RetornaValor(wbPag2, 'rbnomesarvN','checked');
  if oValor then sValor := RetornaValor(wbPag2, 'rbnomesarvN','value');
  oValor := RetornaValor(wbPag2, 'rbnomesarvS','checked');
  if oValor then  sValor := RetornaValor(wbPag2, 'rbnomesarvS','value');
  dmGeral.TB_SEGUIMENTO_ENFERMAGEMFL_ARV.AsString := sValor;

  sValor := RetornaValor(wbPag2, 'txQuais', 'value');
  dmGeral.TB_SEGUIMENTO_ENFERMAGEMTX_ARV.AsString := sValor;

  sValor := '';
  oValor := RetornaValor(wbPag2, 'rbfrascosarvN','checked');
  if oValor then sValor := RetornaValor(wbPag2, 'rbfrascosarvN','value');
  oValor := RetornaValor(wbPag2, 'rbfrascosarvS','checked');
  if oValor then  sValor := RetornaValor(wbPag2, 'rbfrascosarvS','value');
  dmGeral.TB_SEGUIMENTO_ENFERMAGEMFL_FRASCOS_ARV.AsString := sValor;

  sValor := RetornaValor(wbPag2, 'txcomprimidos', 'value');
  dmGeral.TB_SEGUIMENTO_ENFERMAGEMTX_QUANTOS_TOMA.AsString := sValor;

  sValor := '';
  oValor := RetornaValor(wbPag2, 'rbsenteN','checked');
  if oValor then sValor := RetornaValor(wbPag2, 'rbsenteN','value');
  oValor := RetornaValor(wbPag2, 'rbsenteS','checked');
  if oValor then  sValor := RetornaValor(wbPag2, 'rbsenteS','value');
  dmGeral.TB_SEGUIMENTO_ENFERMAGEMFL_SENTE_ALGO_DIFERENTE.AsString := sValor;

  sValor := RetornaValor(wbPag2, 'txsente', 'value');
  dmGeral.TB_SEGUIMENTO_ENFERMAGEMTX_SENTE_ALGO_DIFERENTE.AsString := sValor;

  sValor := '';
  oValor := RetornaValor(wbPag2, 'rbalimentacaoN','checked');
  if oValor then sValor := RetornaValor(wbPag2, 'rbalimentacaoN','value');
  oValor := RetornaValor(wbPag2, 'rbalimentacaoS','checked');
  if oValor then  sValor := RetornaValor(wbPag2, 'rbalimentacaoS','value');
  dmGeral.TB_SEGUIMENTO_ENFERMAGEMFL_ALIMENTACAO.AsString := sValor;

  sValor := '';
  oValor := RetornaValor(wbPag2, 'rbeliminacaoN','checked');
  if oValor then sValor := RetornaValor(wbPag2, 'rbeliminacaoN','value');
  oValor := RetornaValor(wbPag2, 'rbeliminacaoS','checked');
  if oValor then  sValor := RetornaValor(wbPag2, 'rbeliminacaoS','value');
  dmGeral.TB_SEGUIMENTO_ENFERMAGEMFL_ELIMINACAO.AsString := sValor;

  sValor := RetornaValor(wbPag2, 'txeliminacao', 'value');
  dmGeral.TB_SEGUIMENTO_ENFERMAGEMTX_ELIMINACAO.AsString := sValor;

  sValor := '';
  oValor := RetornaValor(wbPag2, 'rbactividadesN','checked');
  if oValor then sValor := RetornaValor(wbPag2, 'rbactividadesN','value');
  oValor := RetornaValor(wbPag2, 'rbactividadesS','checked');
  if oValor then  sValor := RetornaValor(wbPag2, 'rbactividadesS','value');
  dmGeral.TB_SEGUIMENTO_ENFERMAGEMFL_ACTIVIDADE.AsString := sValor;

  sValor := RetornaValor(wbPag2, 'txactividades', 'value');
  dmGeral.TB_SEGUIMENTO_ENFERMAGEMTX_ACTIVIDADE.AsString := sValor;

  sValor := '';
  oValor := RetornaValor(wbPag2, 'rbpeleN','checked');
  if oValor then sValor := RetornaValor(wbPag2, 'rbpeleN','value');
  oValor := RetornaValor(wbPag2, 'rbpeleS','checked');
  if oValor then  sValor := RetornaValor(wbPag2, 'rbpeleS','value');
  dmGeral.TB_SEGUIMENTO_ENFERMAGEMFL_PELE.AsString := sValor;

  sValor := RetornaValor(wbPag2, 'txpele', 'value');
  dmGeral.TB_SEGUIMENTO_ENFERMAGEMTX_PELE.AsString := sValor;

  sValor := '';
  oValor := RetornaValor(wbPag2, 'rbduvidaN','checked');
  if oValor then sValor := RetornaValor(wbPag2, 'rbduvidaN','value');
  oValor := RetornaValor(wbPag2, 'rbduvidaS','checked');
  if oValor then  sValor := RetornaValor(wbPag2, 'rbduvidaS','value');
  dmGeral.TB_SEGUIMENTO_ENFERMAGEMFL_DUVIDAS.AsString := sValor;

  sValor := RetornaValor(wbPag2, 'txduvida', 'value');
  dmGeral.TB_SEGUIMENTO_ENFERMAGEMTX_DIVIDAS.AsString := sValor;

  sValor := RetornaValor(wbPag2, 'txenfermeiro', 'value');
  dmGeral.TB_SEGUIMENTO_ENFERMAGEMNM_MEDICO.AsString := sValor;

  sValor := RetornaValor(wbPag2, 'txordenfa', 'value');
  dmGeral.TB_SEGUIMENTO_ENFERMAGEMNR_ORDEM.AsString := sValor;

  dmGeral.TB_SEGUIMENTO_ENFERMAGEM.Post;
end;

procedure TframFicha3.CarregaDados;
var
  sValor:string;
  i:integer;
begin

//Processo
  sValor := dmGeral.TB_SEGUIMENTO_ENFERMAGEMNR_PROCESSO.AsString;
  DefineValor(wbPag1, 'lbProcesso','innerHtml',sValor);

//Data
  sValor := DateTostr(trunc(dmGeral.TB_SEGUIMENTO_ENFERMAGEMDT_CADASTRO.AsDateTime));
  DefineValor(wbPag1, 'lbData','innerHtml',sValor);

//Nome
  sValor := dmGeral.TB_SEGUIMENTO_ENFERMAGEMNM_PACIENTE.AsString;
  DefineValor(wbPag1, 'lbNome','innerHtml',sValor);

//Nasc
  sValor := dmGeral.TB_SEGUIMENTO_ENFERMAGEMDT_NASCIMENTO.AsString;
  DefineValor(wbPag1, 'lbDtNasc','innerHtml',sValor);

//Idade
  sValor := dmGeral.TB_SEGUIMENTO_ENFERMAGEMIDADE.AsString;
  DefineValor(wbPag1, 'lbIdade','innerHtml',sValor);

//Sexo
  sValor := dmGeral.TB_SEGUIMENTO_ENFERMAGEMTP_SEXO.AsString;
  if sValor = 'M' then
    DefineValor(wbPag1, 'rbMasc','checked',true);
  if sValor = 'F' then
    DefineValor(wbPag1, 'rbFem','checked',true);

//Nome Mae
  sValor := dmGeral.TB_SEGUIMENTO_ENFERMAGEMNM_MAE.AsString;
  DefineValor(wbPag1, 'lbNmMae','innerHtml',sValor);

//Municipio
  sValor := dmGeral.TB_SEGUIMENTO_ENFERMAGEMDS_MUNICIPIO.AsString;
  DefineValor(wbPag1, 'lbMunicipio','innerHtml',sValor);

//Provincia
  sValor := dmGeral.TB_SEGUIMENTO_ENFERMAGEMDS_PROVINCIA.AsString;
  DefineValor(wbPag1, 'lbProvincia','innerHtml',sValor);

//------------------------------------------------------------------------------

//Data Diagnostico
  sValor := dmGeral.TB_SEGUIMENTO_ENFERMAGEMDT_DIAGNOSTICO.AsString;
  DefineValor(wbPag1, 'txdtdiagnostico', 'value', sValor);

//Inicio ou tratamento
  sValor := dmGeral.TB_SEGUIMENTO_ENFERMAGEMFL_DATA_INICIO.AsString;
  if sValor = 'I' then
    DefineValor(wbPag1, 'rbdttarvI','checked',true);
  if sValor = 'T' then
    DefineValor(wbPag1, 'rbdttarvT','checked',true);

  sValor := dmGeral.TB_SEGUIMENTO_ENFERMAGEMDT_DATA_INICIO.AsString;
  DefineValor(wbPag1, 'txdttarv', 'value', sValor);

  sValor := dmGeral.TB_SEGUIMENTO_ENFERMAGEMFL_INICIO.AsString;
  if sValor = '1' then
    DefineValor(wbPag1, 'rbdstarv1','checked',true);
  if sValor = '2' then
    DefineValor(wbPag1, 'rbdstarv2','checked',true);
  if sValor = '3' then
    DefineValor(wbPag1, 'rbdstarv3','checked',true);
  if sValor = '4' then
    DefineValor(wbPag1, 'rbdstarv4','checked',true);

  sValor := dmGeral.TB_SEGUIMENTO_ENFERMAGEMTX_ESQUEMA.AsString;
  DefineValor(wbPag1, 'txesquemauso', 'value', sValor);

//Sinais Vitais
  for i := 1 to 7 do
  begin
    sValor := dmGeral.TB_SEGUIMENTO_ENFERMAGEM.FieldByName('TX_SINAIS_VITAIS'+intTostr(i)).AsString;
    DefineValor(wbPag1, 'txVit'+intTostr(i), 'value', sValor);
  end;

  sValor := dmGeral.TB_SEGUIMENTO_ENFERMAGEMFL_PERDA.AsString;
  if sValor = 'S' then
    DefineValor(wbPag1, 'rbperdaS','checked',true);
  if sValor = 'N' then
    DefineValor(wbPag1, 'rbperdaN','checked',true);

//Compareceu
  sValor := dmGeral.TB_SEGUIMENTO_ENFERMAGEMFL_COMP_ULTIMA_CONSULTA.AsString;
  if sValor = 'S' then
    DefineValor(wbPag1, 'rbcompareceuS','checked',true);
  if sValor = 'N' then
    DefineValor(wbPag1, 'rbcompareceuN','checked',true);

  sValor := dmGeral.TB_SEGUIMENTO_ENFERMAGEMTX_COMP_ULTIMA_CONSULTA.AsString;
  DefineValor(wbPag1, 'txcompareceu', 'value', sValor);

//Analises solicitadas
  sValor := dmGeral.TB_SEGUIMENTO_ENFERMAGEMFL_ANAL_ULTIMA_CONSULTA.AsString;
  if sValor = 'S' then
    DefineValor(wbPag1, 'rbanalisesS','checked',true);
  if sValor = 'N' then
    DefineValor(wbPag1, 'rbanalisesN','checked',true);

  sValor := dmGeral.TB_SEGUIMENTO_ENFERMAGEMTX_ANAL_ULTIMA_CONSULTA.AsString;
  DefineValor(wbPag1, 'txanalises', 'value', sValor);

//Cotrimoxazol
  sValor := dmGeral.TB_SEGUIMENTO_ENFERMAGEMFL_USO_COTRIMOXAZOL.AsString;
  if sValor = 'S' then
    DefineValor(wbPag1, 'rbcotrimoxazolS','checked',true);
  if sValor = 'N' then
    DefineValor(wbPag1, 'rbcotrimoxazolN','checked',true);

//Sinais Paludismo
  sValor := dmGeral.TB_SEGUIMENTO_ENFERMAGEMFL_SINAIS_PALUDISMO.AsString;
  if sValor = 'S' then
    DefineValor(wbPag1, 'rbspaludismoS','checked',true);
  if sValor = 'N' then
    DefineValor(wbPag1, 'rbspaludismoN','checked',true);

//Diagnóstico Paludismo
  sValor := dmGeral.TB_SEGUIMENTO_ENFERMAGEMFL_DIAG_PALUDISMO.AsString;
  if sValor = 'S' then
    DefineValor(wbPag1, 'rbdpaludismoS','checked',true);
  if sValor = 'N' then
    DefineValor(wbPag1, 'rbdpaludismoN','checked',true);

//Sinais tuberculose
  sValor := dmGeral.TB_SEGUIMENTO_ENFERMAGEMFL_SINAIS_TUBERCULOSE.AsString;
  if sValor = 'S' then
    DefineValor(wbPag1, 'rbstuberculoseS','checked',true);
  if sValor = 'N' then
    DefineValor(wbPag1, 'rbstuberculoseN','checked',true);

//Diagnóstico tuberculose
  sValor := dmGeral.TB_SEGUIMENTO_ENFERMAGEMFL_DIAG_TUBERCULOSE.AsString;
  if sValor = 'S' then
    DefineValor(wbPag1, 'rbdtuberculoseS','checked',true);
  if sValor = 'N' then
    DefineValor(wbPag1, 'rbdtuberculoseN','checked',true);

//Tratamento tuberculose
  sValor := dmGeral.TB_SEGUIMENTO_ENFERMAGEMFL_TRAT_TUBERCULOSE.AsString;
  if sValor = 'S' then
    DefineValor(wbPag1, 'rbtratamentoTS','checked',true);
  if sValor = 'N' then
    DefineValor(wbPag1, 'rbtratamentoTN','checked',true);

  sValor := dmGeral.TB_SEGUIMENTO_ENFERMAGEMTX_TRAT_TUBERCULOSE.AsString;
  DefineValor(wbPag1, 'txtratamentoT', 'value', sValor);

//Outras queixas
  sValor := dmGeral.TB_SEGUIMENTO_ENFERMAGEMTX_OUTRAS_QUEIXAS.AsString;
  DefineValor(wbPag1, 'txQueixas', 'value', sValor);

//Principais analises TX
  for i := 1 to 11 do
  begin
    sValor := dmGeral.TB_SEGUIMENTO_ENFERMAGEM.FieldByName('TX_PRINCIPAIS_ANALISES'+intTostr(i)).AsString;
    DefineValor(wbPag1, 'txPA'+intTostr(i), 'value', sValor);
  end;

//Principais analises DT
  for i := 1 to 6 do
  begin
    sValor := dmGeral.TB_SEGUIMENTO_ENFERMAGEM.FieldByName('DT_PRINCIPAIS_ANALISES'+intTostr(i)).AsString;
    DefineValor(wbPag1, 'txdtPA'+intTostr(i), 'value', sValor);
  end;

//Sem sinais
  sValor := dmGeral.TB_SEGUIMENTO_ENFERMAGEMFL_SEM_SINAIS_SINTOMAS.AsString;
  if sValor = 'S' then
    DefineValor(wbPag1, 'cksemsinais','checked', true)
  else
    DefineValor(wbPag1, 'cksemsinais','checked', false);

//Com sinais
  sValor := dmGeral.TB_SEGUIMENTO_ENFERMAGEMFL_COM_SINAIS_SINTOMAS.AsString;
  if sValor = 'S' then
    DefineValor(wbPag1, 'ckcomsinais','checked', true)
  else
    DefineValor(wbPag1, 'ckcomsinais','checked', false);


//Hb maior
  sValor := dmGeral.TB_SEGUIMENTO_ENFERMAGEMFL_INICIAR_TARV1.AsString;
  if sValor = 'S' then
    DefineValor(wbPag1, 'cksehbmaior','checked', true)
  else
    DefineValor(wbPag1, 'cksehbmaior','checked', false);

//Hb menor
  sValor := dmGeral.TB_SEGUIMENTO_ENFERMAGEMFL_INICIAR_TARV2.AsString;
  if sValor = 'S' then
    DefineValor(wbPag1, 'cksehbmenor','checked', true)
  else
    DefineValor(wbPag1, 'cksehbmenor','checked', false);

//Se CD4
  sValor := dmGeral.TB_SEGUIMENTO_ENFERMAGEMFL_INICIAR_PROFILAXIA1.AsString;
  if sValor = 'S' then
    DefineValor(wbPag1, 'cksecd4','checked', true)
  else
    DefineValor(wbPag1, 'cksecd4','checked', false);

//cotrimoxazol
  sValor := dmGeral.TB_SEGUIMENTO_ENFERMAGEMFL_INICIAR_PROFILAXIA2.AsString;
  if sValor = 'S' then
    DefineValor(wbPag1, 'ckcomsinaiscotrimoxazol','checked', true)
  else
    DefineValor(wbPag1, 'ckcomsinaiscotrimoxazol','checked', false);

//**PG2**

//ckA
  for i := 1 to 2 do
  begin
    sValor := dmGeral.TB_SEGUIMENTO_ENFERMAGEM.FieldByName('FL_TRAT_ARV_A'+intToStr(i)).AsString;
    if sValor = 'S' then
      DefineValor(wbPag2, 'ckA'+intToStr(i),'checked', true)
    else
      DefineValor(wbPag2, 'ckA'+intToStr(i),'checked', false);
  end;

//ckB
  for i := 1 to 6 do
  begin
    sValor := dmGeral.TB_SEGUIMENTO_ENFERMAGEM.FieldByName('FL_TRAT_ARV_B'+intToStr(i)).AsString;
    if sValor = 'S' then
      DefineValor(wbPag2, 'ckB'+intToStr(i),'checked', true)
    else
      DefineValor(wbPag2, 'ckB'+intToStr(i),'checked', false);
  end;

  sValor := dmGeral.TB_SEGUIMENTO_ENFERMAGEMTX_TRAT_ARV_B1_REACAO.AsString;
  DefineValor(wbPag2, 'txB1reacao', 'value', sValor);

  sValor := dmGeral.TB_SEGUIMENTO_ENFERMAGEMTX_TRAT_ARV_B1_CONDUTA.AsString;
  DefineValor(wbPag2, 'txB1conduta', 'value', sValor);

//ckC
  for i := 1 to 6 do
  begin
    sValor := dmGeral.TB_SEGUIMENTO_ENFERMAGEM.FieldByName('FL_TRAT_ARV_C'+intToStr(i)).AsString;
    if sValor = 'S' then
      DefineValor(wbPag2, 'ckC'+intToStr(i),'checked', true)
    else
      DefineValor(wbPag2, 'ckC'+intToStr(i),'checked', false);
  end;

//Uso de TARV
  sValor := dmGeral.TB_SEGUIMENTO_ENFERMAGEMFL_ARV.AsString;
  if sValor = 'S' then
    DefineValor(wbPag2, 'rbnomesarvS','checked',true);
  if sValor = 'N' then
    DefineValor(wbPag2, 'rbnomesarvN','checked',true);

  sValor := dmGeral.TB_SEGUIMENTO_ENFERMAGEMTX_ARV.AsString;
  DefineValor(wbPag2, 'txQuais', 'value', sValor);

  sValor := dmGeral.TB_SEGUIMENTO_ENFERMAGEMFL_FRASCOS_ARV.AsString;
  if sValor = 'S' then
    DefineValor(wbPag2, 'rbnomesarvS','checked',true);
  if sValor = 'N' then
    DefineValor(wbPag2, 'rbnomesarvN','checked',true);

  sValor := dmGeral.TB_SEGUIMENTO_ENFERMAGEMTX_QUANTOS_TOMA.AsString;
  DefineValor(wbPag2, 'txcomprimidos', 'value', sValor);

  sValor := dmGeral.TB_SEGUIMENTO_ENFERMAGEMFL_SENTE_ALGO_DIFERENTE.AsString;
  if sValor = 'S' then
    DefineValor(wbPag2, 'rbsenteS','checked',true);
  if sValor = 'N' then
    DefineValor(wbPag2, 'rbsenteN','checked',true);

  sValor := dmGeral.TB_SEGUIMENTO_ENFERMAGEMTX_SENTE_ALGO_DIFERENTE.AsString;
  DefineValor(wbPag2, 'txsente', 'value', sValor);

  sValor := dmGeral.TB_SEGUIMENTO_ENFERMAGEMFL_ALIMENTACAO.AsString;
  if sValor = 'S' then
    DefineValor(wbPag2, 'rbalimentacaoS','checked',true);
  if sValor = 'N' then
    DefineValor(wbPag2, 'rbalimentacaoN','checked',true);

  sValor := dmGeral.TB_SEGUIMENTO_ENFERMAGEMFL_ELIMINACAO.AsString;
  if sValor = 'S' then
    DefineValor(wbPag2, 'rbeliminacaoS','checked',true);
  if sValor = 'N' then
    DefineValor(wbPag2, 'rbeliminacaoN','checked',true);

  sValor := dmGeral.TB_SEGUIMENTO_ENFERMAGEMTX_ELIMINACAO.AsString;
  DefineValor(wbPag2, 'txeliminacao', 'value', sValor);

  sValor := dmGeral.TB_SEGUIMENTO_ENFERMAGEMFL_ACTIVIDADE.AsString;
  if sValor = 'S' then
    DefineValor(wbPag2, 'rbactividadesS','checked',true);
  if sValor = 'N' then
    DefineValor(wbPag2, 'rbactividadesS','checked',true);

  sValor := dmGeral.TB_SEGUIMENTO_ENFERMAGEMTX_ACTIVIDADE.AsString;
  DefineValor(wbPag2, 'txactividades', 'value', sValor);

  sValor := dmGeral.TB_SEGUIMENTO_ENFERMAGEMFL_PELE.AsString;
  if sValor = 'S' then
    DefineValor(wbPag2, 'rbpeleS','checked',true);
  if sValor = 'N' then
    DefineValor(wbPag2, 'rbpeleN','checked',true);

  sValor := dmGeral.TB_SEGUIMENTO_ENFERMAGEMTX_PELE.AsString;
  DefineValor(wbPag2, 'txpele', 'value', sValor);

  sValor := dmGeral.TB_SEGUIMENTO_ENFERMAGEMFL_DUVIDAS.AsString;
  if sValor = 'S' then
    DefineValor(wbPag2, 'rbduvidaS','checked',true);
  if sValor = 'N' then
    DefineValor(wbPag2, 'rbduvidaS','checked',true);

  sValor := dmGeral.TB_SEGUIMENTO_ENFERMAGEMTX_DIVIDAS.AsString;
  DefineValor(wbPag2, 'txduvida', 'value', sValor);

  sValor := dmGeral.TB_SEGUIMENTO_ENFERMAGEMNM_MEDICO.AsString;
  DefineValor(wbPag2, 'txenfermeiro', 'value', sValor);

  sValor := dmGeral.TB_SEGUIMENTO_ENFERMAGEMNR_ORDEM.AsString;
  DefineValor(wbPag2, 'txordenfa', 'value', sValor);
end;

procedure TframFicha3.btSalvarClick(Sender: TObject);
begin
  SalvarDados;
  btNovo.Enabled := true;
  btEditar.Enabled := true;
  btCancelEdit.Enabled := false;
  btSalvar.Enabled := false;
  btAnterior.Enabled := true;
  btProximo.Enabled := true;
end;

procedure TframFicha3.btEditarClick(Sender: TObject);
begin
  dmGeral.TB_SEGUIMENTO_ENFERMAGEM.Edit;
  AtualizarDados;
  btNovo.Enabled := false;
  btEditar.Enabled := false;
  btCancelEdit.Enabled := false;
  btSalvar.Enabled := true;
  btAnterior.Enabled := false;
  btProximo.Enabled := false;
end;

procedure TframFicha3.btConfImpClick(Sender: TObject);
var wb:TWebBrowser; vIn, vOut:OleVariant;
begin
  case pgFicha.ActivePageIndex of
    0: wb := wbPag1;
    1: wb := wbPag2;
  end;

  wb.ControlInterface.ExecWB(OLECMDID_PAGESETUP,
      OLECMDEXECOPT_PROMPTUSER, vIn, vOut);
end;

procedure TframFicha3.btImprimirClick(Sender: TObject);
var wb:TWebBrowser; vIn, vOut:OleVariant;
begin
  case pgFicha.ActivePageIndex of
    0: wb := wbPag1;
    1: wb := wbPag2;
  end;

  wb.ControlInterface.ExecWB(OLECMDID_PRINT,
      OLECMDEXECOPT_DONTPROMPTUSER, vIn, vOut);
end;

procedure TframFicha3.btPreviewClick(Sender: TObject);
var wb:TWebBrowser; vIn, vOut:OleVariant;
begin
  case pgFicha.ActivePageIndex of
    0: wb := wbPag1;
    1: wb := wbPag2;
  end;

  wb.ControlInterface.ExecWB(OLECMDID_PRINTPREVIEW,
      OLECMDEXECOPT_PROMPTUSER, vIn, vOut);
end;

procedure TframFicha3.CarregaDadosCabecalho;
var
  sValor:string;
  i:integer;
begin

//Processo
  sValor := dmGeral.TB_PACIENTENR_PROCESSO.AsString;
  DefineValor(wbPag1, 'lbProcesso','innerHtml',sValor);

//Data
  sValor := DateToStr(DM.GetDate);
  DefineValor(wbPag1, 'lbData','innerHtml',sValor);

//Nome
  sValor := dmGeral.TB_PACIENTENM_PACIENTE.AsString;
  DefineValor(wbPag1, 'lbNome','innerHtml',sValor);

//Nasc
  sValor := dmGeral.TB_PACIENTEDT_NASCIMENTO.AsString;
  DefineValor(wbPag1, 'lbDtNasc','innerHtml',sValor);

//Idade
  sValor := dmGeral.TB_PACIENTEIDADE.AsString;
  DefineValor(wbPag1, 'lbIdade','innerHtml',sValor);

//Sexo
  sValor := dmGeral.TB_PACIENTETP_SEXO.AsString;
  if sValor = 'M' then
    DefineValor(wbPag1, 'rbMasc','checked',true);
  if sValor = 'F' then
    DefineValor(wbPag1, 'rbFem','checked',true);

//Nome Mae
  sValor := dmGeral.TB_PACIENTENM_MAE.AsString;
  DefineValor(wbPag1, 'lbNmMae','innerHtml',sValor);

//Municipio
  sValor := dmGeral.TB_PACIENTEDS_MUNICIPIO.AsString;
  DefineValor(wbPag1, 'lbMunicipio','innerHtml',sValor);

//Provincia
  sValor := dmGeral.TB_PACIENTEDS_PROVINCIA.AsString;
  DefineValor(wbPag1, 'lbProvincia','innerHtml',sValor);

//------------------------------------------------------------------------------

//Data Diagnostico (Inclusão auto da tabela NOTIFICACAO)
  sValor := DMGERAL.TB_NOTIFICACAODT_DIAGNOSTICO.AsString;
  DefineValor(wbPag1, 'txdtdiagnostico', 'value', sValor);

//Inicio ou tratamento
  DefineValor(wbPag1, 'rbdttarvI','checked',false);
  DefineValor(wbPag1, 'rbdttarvT','checked',false);

  DefineValor(wbPag1, 'txdttarv', 'value', '');

  DefineValor(wbPag1, 'rbdstarv1','checked',false);
  DefineValor(wbPag1, 'rbdstarv2','checked',false);
  DefineValor(wbPag1, 'rbdstarv3','checked',false);
  DefineValor(wbPag1, 'rbdstarv4','checked',false);

  DefineValor(wbPag1, 'txesquemauso', 'value', '');

//Sinais Vitais (Inclusão auto da tabela TRIAGEM_ENFERMAGEM)
  sValor := dmGeral.TB_TRIAGEM_ENFERMAGEM.FieldByName('TX_SINAIS_VITAIS1').AsString;
  DefineValor(wbPag1, 'txVit1', 'value', sValor);

  sValor := dmGeral.TB_TRIAGEM_ENFERMAGEM.FieldByName('TX_SINAIS_VITAIS2').AsString;
  DefineValor(wbPag1, 'txVit2', 'value', sValor);

  sValor := dmGeral.TB_TRIAGEM_ENFERMAGEM.FieldByName('TX_SINAIS_VITAIS3').AsString;
  DefineValor(wbPag1, 'txVit3', 'value', sValor);

  sValor := dmGeral.TB_TRIAGEM_ENFERMAGEM.FieldByName('TX_SINAIS_VITAIS4').AsString;
  DefineValor(wbPag1, 'txVit4', 'value', sValor);

  sValor := dmGeral.TB_TRIAGEM_ENFERMAGEM.FieldByName('TX_SINAIS_VITAIS5').AsString;
  DefineValor(wbPag1, 'txVit5', 'value', sValor);

  sValor := dmGeral.TB_TRIAGEM_ENFERMAGEM.FieldByName('TX_SINAIS_VITAIS6').AsString;
  DefineValor(wbPag1, 'txVit6', 'value', sValor);

  sValor := dmGeral.TB_TRIAGEM_ENFERMAGEM.FieldByName('TX_SINAIS_VITAIS7').AsString;
  DefineValor(wbPag1, 'txVit7', 'value', sValor);

  sValor := dmGeral.TB_TRIAGEM_ENFERMAGEMFL_PERDA.AsString;
  if sValor = 'S' then
    DefineValor(wbPag1, 'rbperdaS','checked',true);
  if sValor = 'N' then
    DefineValor(wbPag1, 'rbperdaN','checked',true);

//Compareceu
  DefineValor(wbPag1, 'rbcompareceuS','checked',false);
  DefineValor(wbPag1, 'rbcompareceuN','checked',false);

  DefineValor(wbPag1, 'txcompareceu', 'value', '');

//Analises solicitadas
  DefineValor(wbPag1, 'rbanalisesS','checked',false);
  DefineValor(wbPag1, 'rbanalisesN','checked',false);

  DefineValor(wbPag1, 'txanalises', 'value', '');

//Cotrimoxazol
  DefineValor(wbPag1, 'rbcotrimoxazolS','checked',false);
  DefineValor(wbPag1, 'rbcotrimoxazolN','checked',false);

//Sinais Paludismo
  DefineValor(wbPag1, 'rbspaludismoS','checked',false);
  DefineValor(wbPag1, 'rbspaludismoN','checked',false);

//Diagnóstico Paludismo
  DefineValor(wbPag1, 'rbdpaludismoS','checked',false);
  DefineValor(wbPag1, 'rbdpaludismoN','checked',false);

//Sinais tuberculose
  DefineValor(wbPag1, 'rbstuberculoseS','checked',false);
  DefineValor(wbPag1, 'rbstuberculoseN','checked',false);

//Diagnóstico tuberculose
  DefineValor(wbPag1, 'rbdtuberculoseS','checked',false);
  DefineValor(wbPag1, 'rbdtuberculoseN','checked',false);

//Tratamento tuberculose
  DefineValor(wbPag1, 'rbtratamentoTS','checked',false);
  DefineValor(wbPag1, 'rbtratamentoTN','checked',false);

  DefineValor(wbPag1, 'txtratamentoT', 'value', '');

//Outras queixas
  DefineValor(wbPag1, 'txQueixas', 'value', '');

//Principais analises TX
  for i := 1 to 11 do
  begin
    DefineValor(wbPag1, 'txPA'+intTostr(i), 'value', '');
  end;

//Principais analises DT
  for i := 1 to 6 do
  begin
    DefineValor(wbPag1, 'txdtPA'+intTostr(i), 'value', '');
  end;

//Sem sinais
  DefineValor(wbPag1, 'cksemsinais','checked', false);

//Com sinais
  DefineValor(wbPag1, 'ckcomsinais','checked', false);

//Hb maior
  DefineValor(wbPag1, 'cksehbmaior','checked', false);

//Hb menor
  DefineValor(wbPag1, 'cksehbmenor','checked', false);

//Se CD4
  DefineValor(wbPag1, 'cksecd4','checked', false);

//cotrimoxazol
  DefineValor(wbPag1, 'ckcomsinaiscotrimoxazol','checked', false);

//**PG2**

//ckA
  for i := 1 to 2 do
  begin
    DefineValor(wbPag2, 'ckA'+intToStr(i),'checked', false);
  end;

//ckB
  for i := 1 to 6 do
  begin
    DefineValor(wbPag2, 'ckB'+intToStr(i),'checked', false);
  end;

  DefineValor(wbPag2, 'txB1reacao', 'value', '');

  DefineValor(wbPag2, 'txB1conduta', 'value', '');

//ckC
  for i := 1 to 6 do
  begin
    DefineValor(wbPag2, 'ckC'+intToStr(i),'checked', false);
  end;

//Uso de TARV
  DefineValor(wbPag2, 'rbnomesarvS','checked',false);
  DefineValor(wbPag2, 'rbnomesarvN','checked',false);

  DefineValor(wbPag2, 'txQuais', 'value', '');

  DefineValor(wbPag2, 'rbnomesarvS','checked',false);
  DefineValor(wbPag2, 'rbnomesarvN','checked',false);

  DefineValor(wbPag2, 'txcomprimidos', 'value', '');

  DefineValor(wbPag2, 'rbsenteS','checked',false);
  DefineValor(wbPag2, 'rbsenteN','checked',false);

  DefineValor(wbPag2, 'txsente', 'value', '');

  DefineValor(wbPag2, 'rbalimentacaoS','checked',false);
  DefineValor(wbPag2, 'rbalimentacaoN','checked',false);

  DefineValor(wbPag2, 'rbeliminacaoS','checked',false);
  DefineValor(wbPag2, 'rbeliminacaoN','checked',false);

  DefineValor(wbPag2, 'txeliminacao', 'value', '');

  DefineValor(wbPag2, 'rbactividadesS','checked',false);
  DefineValor(wbPag2, 'rbactividadesS','checked',false);

  DefineValor(wbPag2, 'txactividades', 'value', '');

  DefineValor(wbPag2, 'rbpeleS','checked',false);
  DefineValor(wbPag2, 'rbpeleN','checked',false);

  DefineValor(wbPag2, 'txpele', 'value', '');

  DefineValor(wbPag2, 'rbduvidaS','checked',false);
  DefineValor(wbPag2, 'rbduvidaS','checked',false);

  DefineValor(wbPag2, 'txduvida', 'value', '');

  DefineValor(wbPag2, 'txenfermeiro', 'value', '');

  DefineValor(wbPag2, 'txordenfa', 'value', '');
end;

procedure TframFicha3.btAnteriorClick(Sender: TObject);
begin
  dmGeral.TB_SEGUIMENTO_ENFERMAGEM.Prior;
  CarregaDados;

end;

procedure TframFicha3.btProximoClick(Sender: TObject);
begin
  dmGeral.TB_SEGUIMENTO_ENFERMAGEM.Next;
  CarregaDados;
end;

procedure TframFicha3.btNovoClick(Sender: TObject);
begin
  dmGeral.TB_SEGUIMENTO_ENFERMAGEM.Insert;
  btNovo.Enabled := false;
  btEditar.Enabled := false;
  btCancelEdit.Enabled := false;
  btSalvar.Enabled := true;
  btAnterior.Enabled := false;
  btProximo.Enabled := false;
end;

procedure TframFicha3.AtualizarDados;
var
  sValor:string;
  i:integer;
begin
//Processo
  sValor := dmGeral.TB_PACIENTENR_PROCESSO.AsString;
  DefineValor(wbPag1, 'lbProcesso','innerHtml',sValor);

//Data
  sValor := DateToStr(DM.GetDate);
  DefineValor(wbPag1, 'lbData','innerHtml',sValor);

//Nome
  sValor := dmGeral.TB_PACIENTENM_PACIENTE.AsString;
  DefineValor(wbPag1, 'lbNome','innerHtml',sValor);

//Nasc
  sValor := dmGeral.TB_PACIENTEDT_NASCIMENTO.AsString;
  DefineValor(wbPag1, 'lbDtNasc','innerHtml',sValor);

//Idade
  sValor := dmGeral.TB_PACIENTEIDADE.AsString;
  DefineValor(wbPag1, 'lbIdade','innerHtml',sValor);

//Sexo
  sValor := dmGeral.TB_PACIENTETP_SEXO.AsString;
  if sValor = 'M' then
    DefineValor(wbPag1, 'rbMasc','checked',true);
  if sValor = 'F' then
    DefineValor(wbPag1, 'rbFem','checked',true);

//Nome Mae
  sValor := dmGeral.TB_PACIENTENM_MAE.AsString;
  DefineValor(wbPag1, 'lbNmMae','innerHtml',sValor);

//Municipio
  sValor := dmGeral.TB_PACIENTEDS_MUNICIPIO.AsString;
  DefineValor(wbPag1, 'lbMunicipio','innerHtml',sValor);

//Provincia
  sValor := dmGeral.TB_PACIENTEDS_PROVINCIA.AsString;
  DefineValor(wbPag1, 'lbProvincia','innerHtml',sValor);

//------------------------------------------------------------------------------

//Data Diagnostico (Inclusão auto da tabela NOTIFICACAO)
  sValor := DMGERAL.TB_NOTIFICACAODT_DIAGNOSTICO.AsString;
  DefineValor(wbPag1, 'txdtdiagnostico', 'value', sValor);

//Sinais Vitais (Inclusão auto da tabela TRIAGEM_ENFERMAGEM)
  if DMGERAL.TB_SEGUIMENTO_ENFERMAGEMTX_SINAIS_VITAIS1.AsString = '' then
  begin
    sValor := dmGeral.TB_TRIAGEM_ENFERMAGEM.FieldByName('TX_SINAIS_VITAIS1').AsString;
    DefineValor(wbPag1, 'txVit1', 'value', sValor);
  end;

  if DMGERAL.TB_SEGUIMENTO_ENFERMAGEMTX_SINAIS_VITAIS2.AsString = '' then
  begin
    sValor := dmGeral.TB_TRIAGEM_ENFERMAGEM.FieldByName('TX_SINAIS_VITAIS2').AsString;
    DefineValor(wbPag1, 'txVit2', 'value', sValor);
  end;

  if DMGERAL.TB_SEGUIMENTO_ENFERMAGEMTX_SINAIS_VITAIS3.AsString = '' then
  begin
    sValor := dmGeral.TB_TRIAGEM_ENFERMAGEM.FieldByName('TX_SINAIS_VITAIS3').AsString;
    DefineValor(wbPag1, 'txVit3', 'value', sValor);
  end;

  if DMGERAL.TB_SEGUIMENTO_ENFERMAGEMTX_SINAIS_VITAIS4.AsString = '' then
  begin
    sValor := dmGeral.TB_TRIAGEM_ENFERMAGEM.FieldByName('TX_SINAIS_VITAIS4').AsString;
    DefineValor(wbPag1, 'txVit4', 'value', sValor);
  end;

  if DMGERAL.TB_SEGUIMENTO_ENFERMAGEMTX_SINAIS_VITAIS5.AsString = '' then
  begin
    sValor := dmGeral.TB_TRIAGEM_ENFERMAGEM.FieldByName('TX_SINAIS_VITAIS5').AsString;
    DefineValor(wbPag1, 'txVit5', 'value', sValor);
  end;

  if DMGERAL.TB_SEGUIMENTO_ENFERMAGEMTX_SINAIS_VITAIS6.AsString = '' then
  begin
    sValor := dmGeral.TB_TRIAGEM_ENFERMAGEM.FieldByName('TX_SINAIS_VITAIS6').AsString;
    DefineValor(wbPag1, 'txVit6', 'value', sValor);
  end;

  if DMGERAL.TB_SEGUIMENTO_ENFERMAGEMTX_SINAIS_VITAIS6.AsString = '' then
  begin
    sValor := dmGeral.TB_TRIAGEM_ENFERMAGEM.FieldByName('TX_SINAIS_VITAIS7').AsString;
    DefineValor(wbPag1, 'txVit7', 'value', sValor);
  end;

  if DMGERAL.TB_SEGUIMENTO_ENFERMAGEMFL_PERDA.AsString = '' then
  begin
    sValor := dmGeral.TB_TRIAGEM_ENFERMAGEMFL_PERDA.AsString;
    if sValor = 'S' then
      DefineValor(wbPag1, 'rbperdaS','checked',true);
    if sValor = 'N' then
      DefineValor(wbPag1, 'rbperdaN','checked',true);
  end;

end;

end.
