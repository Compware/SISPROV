unit uFrameFicha2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, OleCtrls, SHDocVw, ExtCtrls, ComCtrls, Buttons, DB,  Httpapp, MSHTML,
  Printers;

type
  TframFicha2 = class(TFrame)
    pnToolBar: TPanel;
    pgFicha: TPageControl;
    tabPag1: TTabSheet;
    tabPag2: TTabSheet;
    dsAvaliacaoInicial: TDataSource;
    wbPag1: TWebBrowser;
    wbPag2: TWebBrowser;
    btImprimir: TSpeedButton;
    btPreview: TSpeedButton;
    btConfImp: TSpeedButton;
    btSalvar: TSpeedButton;
    btCancelEdit: TSpeedButton;
    btEditar: TSpeedButton;
    btNovo: TSpeedButton;
    procedure btSalvarClick(Sender: TObject);
    procedure btEditarClick(Sender: TObject);
    procedure btConfImpClick(Sender: TObject);
    procedure btImprimirClick(Sender: TObject);
    procedure btPreviewClick(Sender: TObject);
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

procedure TframFicha2.AbreConsulta;
begin
  dmGeral.TB_AVALIACAO_INICIAL.Close;
  dmGeral.TB_AVALIACAO_INICIAL.ParamByName('CD_PACIENTE').AsInteger :=
     dmGeral.TB_PACIENTECD_PACIENTE.AsInteger;
  dmGeral.TB_AVALIACAO_INICIAL.Open;
  if dmGeral.TB_AVALIACAO_INICIAL.IsEmpty then
    CarregaDadosCabecalho
  else
    CarregaDados;
end;

procedure TframFicha2.AbrePaginas;
var sUrl :string;
begin
  sUrl := sPathConsulta + 'AvaliacaoInicial1.html';
  wbPag1.Navigate(sUrl);
  sUrl := sPathConsulta + 'AvaliacaoInicial2.html';
  wbPag2.Navigate(sUrl);
end;

function TframFicha2.GetElementById(const Doc: IDispatch; const Id: string): IDispatch;
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

function TframFicha2.GetElementByName(const Doc: IDispatch; const Name: string): IDispatch;
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

function TframFicha2.RetornaValor(wb:TWebBrowser; id,att:string):OleVariant;
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

procedure  TframFicha2.DefineValor(wb:TWebBrowser; id,att:string; oValor:OleVariant);
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

procedure TframFicha2.SalvarDados;
var
  oValor:OleVariant;
  sValor:string;
  i:integer;
begin
  dmGeral.TB_AVALIACAO_INICIAL.Edit;

  dmGeral.TB_AVALIACAO_INICIALCD_PACIENTE.AsInteger :=
      dmGeral.TB_PACIENTECD_PACIENTE.AsInteger;

//Motivo
  sValor := '';
  oValor := RetornaValor(wbPag1, 'rbmotivoC','checked');
  if oValor then sValor := RetornaValor(wbPag1, 'rbmotivoC','value');
  oValor := RetornaValor(wbPag1, 'rbmotivoT','checked');
  if oValor then  sValor := RetornaValor(wbPag1, 'rbmotivoT','value');
  dmGeral.TB_AVALIACAO_INICIALFL_MOTIVO.AsString := sValor;

//Data Diagnostico
  sValor := '';
  sValor := RetornaValor(wbPag1, 'txdtdiagnostico', 'value');
  dmGeral.TB_AVALIACAO_INICIALDT_DIAGNOSTICO.AsString := sValor;

//Nr Filhos e fez teste
  sValor := RetornaValor(wbPag1, 'txnrfilhos', 'value');
  dmGeral.TB_AVALIACAO_INICIALNR_FILHO.AsString := sValor;

  sValor := '';
  oValor := RetornaValor(wbPag1, 'rbtestehojeN','checked');
  if oValor then sValor := RetornaValor(wbPag1, 'rbtestehojeN','value');
  oValor := RetornaValor(wbPag1, 'rbtestehojeS','checked');
  if oValor then  sValor := RetornaValor(wbPag1, 'rbtestehojeS','value');
  dmGeral.TB_AVALIACAO_INICIALFL_TESTE.AsString := sValor;

//Parceiro fez teste
  sValor := '';
  oValor := RetornaValor(wbPag1, 'rbptestehojeN','checked');
  if oValor then sValor := RetornaValor(wbPag1, 'rbptestehojeN','value');
  oValor := RetornaValor(wbPag1, 'rbptestehojeS','checked');
  if oValor then  sValor := RetornaValor(wbPag1, 'rbptestehojeS','value');
  dmGeral.TB_AVALIACAO_INICIALFL_PARCEIRO_TESTE.AsString := sValor;

  sValor := RetornaValor(wbPag1, 'txresultado', 'value');
  dmGeral.TB_AVALIACAO_INICIALTX_RESULTADO.AsString := sValor;

//Mais de um Parceiro
  sValor := '';
  oValor := RetornaValor(wbPag1, 'rbparceiroN','checked');
  if oValor then sValor := RetornaValor(wbPag1, 'rbparceiroN','value');
  oValor := RetornaValor(wbPag1, 'rbparceiroS','checked');
  if oValor then  sValor := RetornaValor(wbPag1, 'rbparceiroS','value');
  dmGeral.TB_AVALIACAO_INICIALFL_MAIS_PARCEIRO.AsString := sValor;

//Esta Grávida
  sValor := '';
  oValor := RetornaValor(wbPag1, 'rbgravidaN','checked');
  if oValor then sValor := RetornaValor(wbPag1, 'rbgravidaN','value');
  oValor := RetornaValor(wbPag1, 'rbgravidaS','checked');
  if oValor then  sValor := RetornaValor(wbPag1, 'rbgravidaS','value');
  oValor := RetornaValor(wbPag1, 'rbgravidaNA','checked');
  if oValor then  sValor := RetornaValor(wbPag1, 'rbgravidaNA','value');
  dmGeral.TB_AVALIACAO_INICIALFL_GRAVIDA.AsString := sValor;


//Sinais Vitais
  for i := 1 to 6 do
  begin
    sValor := '';
    sValor := RetornaValor(wbPag1, 'txVit'+intTostr(i), 'value');
    dmGeral.TB_AVALIACAO_INICIAL.FieldByName('TX_SINAIS_VITAIS'+intTostr(i)).AsString := sValor;
  end;

//Sinais Paludismo
  sValor := '';
  oValor := RetornaValor(wbPag1, 'rbspaludismoN','checked');
  if oValor then sValor := RetornaValor(wbPag1, 'rbspaludismoN','value');
  oValor := RetornaValor(wbPag1, 'rbspaludismoS','checked');
  if oValor then  sValor := RetornaValor(wbPag1, 'rbspaludismoS','value');
  dmGeral.TB_AVALIACAO_INICIALFL_SINAIS_PALUDISMO.AsString := sValor;

//Diagnóstico Paludismo
  sValor := '';
  oValor := RetornaValor(wbPag1, 'rbdpaludismoN','checked');
  if oValor then sValor := RetornaValor(wbPag1, 'rbdpaludismoN','value');
  oValor := RetornaValor(wbPag1, 'rbdpaludismoS','checked');
  if oValor then  sValor := RetornaValor(wbPag1, 'rbdpaludismoS','value');
  dmGeral.TB_AVALIACAO_INICIALFL_DIAG_PALUDISMO.AsString := sValor;

//Sinais tuberculose
  sValor := '';
  oValor := RetornaValor(wbPag1, 'rbstuberculoseN','checked');
  if oValor then sValor := RetornaValor(wbPag1, 'rbstuberculoseN','value');
  oValor := RetornaValor(wbPag1, 'rbstuberculoseS','checked');
  if oValor then  sValor := RetornaValor(wbPag1, 'rbstuberculoseS','value');
  dmGeral.TB_AVALIACAO_INICIALFL_SINAIS_TUBERCULOSE.AsString := sValor;

//Diagnóstico tuberculose
  sValor := '';
  oValor := RetornaValor(wbPag1, 'rbdtuberculoseN','checked');
  if oValor then sValor := RetornaValor(wbPag1, 'rbdtuberculoseN','value');
  oValor := RetornaValor(wbPag1, 'rbdtuberculoseS','checked');
  if oValor then  sValor := RetornaValor(wbPag1, 'rbdtuberculoseS','value');
  dmGeral.TB_AVALIACAO_INICIALFL_DIAG_TUBERCULOSE.AsString := sValor;

//Conduta
  sValor := RetornaValor(wbPag1, 'txconduta', 'value');
  dmGeral.TB_AVALIACAO_INICIALTX_SINAIS_CONDUTA.AsString := sValor;

//ckSint1
  for i := 1 to 39 do
  begin
    sValor := '';
    oValor := RetornaValor(wbPag1, 'ckSint'+intToStr(i),'checked');
    if oValor then sValor := 'S' else sValor := 'N';
    dmGeral.TB_AVALIACAO_INICIAL.FieldByName('FL_QUADRO_OMS'+intToStr(i)).AsString := sValor;
  end;

//Conclusão Menor
  sValor := '';
  oValor := RetornaValor(wbPag1, 'rbcmenorZ','checked');
  if oValor then sValor := RetornaValor(wbPag1, 'rbcmenorZ','value');
  oValor := RetornaValor(wbPag1, 'rbcmenorD','checked');
  if oValor then  sValor := RetornaValor(wbPag1, 'rbcmenorD','value');
  dmGeral.TB_AVALIACAO_INICIALFL_CONCLUSAO_MENOR.AsString := sValor;

//Conclusão Maior
  sValor := '';
  oValor := RetornaValor(wbPag1, 'rbcmaiorZ','checked');
  if oValor then sValor := RetornaValor(wbPag1, 'rbcmaiorZ','value');
  oValor := RetornaValor(wbPag1, 'rbcmaiorD','checked');
  if oValor then  sValor := RetornaValor(wbPag1, 'rbcmaiorD','value');
  dmGeral.TB_AVALIACAO_INICIALFL_CONCLUSAO_MAIOR.AsString := sValor;

//Classificação OMS segundo Sinais e Sintomas
  sValor := RetornaValor(wbPag1, 'txclassificacaoOMS', 'value');
  dmGeral.TB_AVALIACAO_INICIALTX_CLASSIFICACAO.AsString := sValor;

  sValor := '';
  oValor := RetornaValor(wbPag1, 'ckCD4', 'checked');
  if oValor then sValor := 'S' else sValor := 'N';
  dmGeral.TB_AVALIACAO_INICIALFL_CLASSIFICACAO.AsString := sValor;

//Outras Queixas
  sValor := RetornaValor(wbPag1, 'txQueixas', 'value');
  dmGeral.TB_AVALIACAO_INICIALTX_OUTRAS_QUEIXAS.AsString := sValor;

//Principais analises TX
  for i := 1 to 7 do
  begin
    sValor := '';
    sValor := RetornaValor(wbPag2, 'txPA'+intTostr(i), 'value');
    dmGeral.TB_AVALIACAO_INICIAL.FieldByName('TX_PRINCIPAIS_ANALISES'+intTostr(i)).AsString := sValor;
  end;

//Principais analises DT
  for i := 1 to 6 do
  begin
    sValor := '';
    sValor := RetornaValor(wbPag2, 'txDTPA'+intTostr(i), 'value');
    dmGeral.TB_AVALIACAO_INICIAL.FieldByName('DT_PRINCIPAIS_ANALISES'+intTostr(i)).AsString := sValor;
  end;

//Seguimento de Rotina
  sValor := '';
  oValor := RetornaValor(wbPag2, 'ckrotina', 'checked');
  if oValor then sValor := 'S' else sValor := 'N';
  dmGeral.TB_AVALIACAO_INICIALFL_SEGUIMENTO_ROTINA.AsString := sValor;

//Retorno
  sValor := '';
  oValor := RetornaValor(wbPag2, 'rbretornoS','checked');
  if oValor then sValor := RetornaValor(wbPag2, 'rbretornoS','value');
  oValor := RetornaValor(wbPag2, 'rbretornoN','checked');
  if oValor then  sValor := RetornaValor(wbPag2, 'rbretornoN','value');
  dmGeral.TB_AVALIACAO_INICIALFL_VAGA_ABERTA.AsString := sValor;

  sValor := RetornaValor(wbPag2, 'txdtretorno', 'value');
  dmGeral.TB_AVALIACAO_INICIALDT_VAGA_ABERTA.AsString := sValor;

//Solicitado
  sValor := '';
  oValor := RetornaValor(wbPag2, 'rbsolicitadoS','checked');
  if oValor then sValor := RetornaValor(wbPag2, 'rbsolicitadoS','value');
  oValor := RetornaValor(wbPag2, 'rbsolicitadoN','checked');
  if oValor then  sValor := RetornaValor(wbPag2, 'rbsolicitadoN','value');
  dmGeral.TB_AVALIACAO_INICIALFL_CD4_HEMOGRAMA.AsString := sValor;

  sValor := RetornaValor(wbPag2, 'txsolicitado', 'value');
  dmGeral.TB_AVALIACAO_INICIALTX_CD4_HEMOGRAMA.AsString := sValor;

//Alteradas
  sValor := '';
  oValor := RetornaValor(wbPag2, 'rbalteradasS','checked');
  if oValor then sValor := RetornaValor(wbPag2, 'rbalteradasS','value');
  oValor := RetornaValor(wbPag2, 'rbalteradasN','checked');
  if oValor then  sValor := RetornaValor(wbPag2, 'rbalteradasN','value');
  dmGeral.TB_AVALIACAO_INICIALFL_ANALISES_ALTERADAS.AsString := sValor;

  sValor := RetornaValor(wbPag2, 'txalteradas', 'value');
  dmGeral.TB_AVALIACAO_INICIALTX_ANALISES_ALTERADAS.AsString := sValor;

//Inicio Imediato
  sValor := '';
  oValor := RetornaValor(wbPag2, 'ckrotina2', 'checked');
  if oValor then sValor := 'S' else sValor := 'N';
  dmGeral.TB_AVALIACAO_INICIALFL_INICIO_IMEDIATO.AsString := sValor;


  sValor := '';
  oValor := RetornaValor(wbPag2, 'rbmaiorH','checked');
  if oValor then sValor := RetornaValor(wbPag2, 'rbmaiorH','value');
  oValor := RetornaValor(wbPag2, 'rbmaiorM','checked');
  if oValor then  sValor := RetornaValor(wbPag2, 'rbmaiorM','value');
  dmGeral.TB_AVALIACAO_INICIALFL_INICIO_IMEDIATO1.AsString := sValor;

  sValor := '';
  oValor := RetornaValor(wbPag2, 'rbmenorH','checked');
  if oValor then sValor := RetornaValor(wbPag2, 'rbmmenorH','value');
  oValor := RetornaValor(wbPag2, 'rbmenorM','checked');
  if oValor then  sValor := RetornaValor(wbPag2, 'rbmenorM','value');
  dmGeral.TB_AVALIACAO_INICIALFL_INICIO_IMEDIATO2.AsString := sValor;

  sValor := RetornaValor(wbPag2, 'txdtinicio', 'value');
  dmGeral.TB_AVALIACAO_INICIALDT_INICIO_IMEDIATO.AsString := sValor;

//Sinais e sintomas Graves
  sValor := '';
  oValor := RetornaValor(wbPag2, 'rbsgravesS','checked');
  if oValor then sValor := RetornaValor(wbPag2, 'rbsgravesS','value');
  oValor := RetornaValor(wbPag2, 'rbsgravesN','checked');
  if oValor then  sValor := RetornaValor(wbPag2, 'rbsgravesN','value');
  dmGeral.TB_AVALIACAO_INICIALFL_SINTOMAS_GRAVES.AsString := sValor;

  sValor := RetornaValor(wbPag2, 'txsgraves', 'value');
  dmGeral.TB_AVALIACAO_INICIALTX_SINTOMAS_GRAVES.AsString := sValor;

//Solicitacao analises
  sValor := '';
  oValor := RetornaValor(wbPag2, 'rbsanalisesS','checked');
  if oValor then sValor := RetornaValor(wbPag2, 'rbsanalisesS','value');
  oValor := RetornaValor(wbPag2, 'rbsanalisesN','checked');
  if oValor then  sValor := RetornaValor(wbPag2, 'rbsanalisesN','value');
  dmGeral.TB_AVALIACAO_INICIALFL_INICIO_IMEDIATO3.AsString := sValor;

  sValor := RetornaValor(wbPag2, 'txsanalises', 'value');
  dmGeral.TB_AVALIACAO_INICIALTX_INICIO_IMEDIATO3.AsString := sValor;

//Retorno
  sValor := '';
  oValor := RetornaValor(wbPag2, 'rbvalidacaoS','checked');
  if oValor then sValor := RetornaValor(wbPag2, 'rbvalidacaoS','value');
  oValor := RetornaValor(wbPag2, 'rbvalidacaoN','checked');
  if oValor then  sValor := RetornaValor(wbPag2, 'rbvalidacaoN','value');
  dmGeral.TB_AVALIACAO_INICIALFL_INICIO_IMEDIATO4.AsString := sValor;

  sValor := RetornaValor(wbPag2, 'txdtvalidacao', 'value');
  dmGeral.TB_AVALIACAO_INICIALDT_INICIO_IMEDIATO4.AsString := sValor;

  dmGeral.TB_AVALIACAO_INICIALTX_INICIO_IMEDIATO4.AsString := sValor;
  sValor := RetornaValor(wbPag2, 'txvalidacao', 'value');

//Puerpera
  sValor := '';
  oValor := RetornaValor(wbPag2, 'ckpuerpera', 'checked');
  if oValor then sValor := 'S' else sValor := 'N';
  dmGeral.TB_AVALIACAO_INICIALFL_PUERPERA.AsString := sValor;

  sValor := RetornaValor(wbPag2, 'txarvuso', 'value');
  dmGeral.TB_AVALIACAO_INICIALTX_ESQUEMA_EM_USO.AsString := sValor;

  sValor := RetornaValor(wbPag2, 'txdtarv', 'value');
  dmGeral.TB_AVALIACAO_INICIALDT_INICIO_ARV.AsString := sValor;

  sValor := RetornaValor(wbPag2, 'txdtparto', 'value');
  dmGeral.TB_AVALIACAO_INICIALDT_PARTO.AsString := sValor;

  sValor := '';
  oValor := RetornaValor(wbPag2, 'ckprofilaxiaarv', 'checked');
  if oValor then sValor := 'S' else sValor := 'N';
  dmGeral.TB_AVALIACAO_INICIALFL_PROFILAXIA.AsString := sValor;

  sValor := '';
  oValor := RetornaValor(wbPag2, 'cktratamentoarv', 'checked');
  if oValor then sValor := 'S' else sValor := 'N';
  dmGeral.TB_AVALIACAO_INICIALFL_TRATAMENTO_ARV.AsString := sValor;

  sValor := '';
  oValor := RetornaValor(wbPag2, 'ckprofilaxiaconduta', 'checked');
  if oValor then sValor := 'S' else sValor := 'N';
  dmGeral.TB_AVALIACAO_INICIALFL_PROFILAXIA_CONDUTA.AsString := sValor;

  sValor := '';
  oValor := RetornaValor(wbPag2, 'ckaleitamentoartificial', 'checked');
  if oValor then sValor := 'S' else sValor := 'N';
  dmGeral.TB_AVALIACAO_INICIALFL_ALEITAMENTO_ARTIFICIAL.AsString := sValor;

  sValor := '';
  oValor := RetornaValor(wbPag2, 'ckaleitamentomaterno', 'checked');
  if oValor then sValor := 'S' else sValor := 'N';
  dmGeral.TB_AVALIACAO_INICIALFL_ALEITAMENTO_MATERNO.AsString := sValor;

  sValor := '';
  oValor := RetornaValor(wbPag2, 'ckemtratamento', 'checked');
  if oValor then sValor := 'S' else sValor := 'N';
  dmGeral.TB_AVALIACAO_INICIALFL_TRATAMENTO_ARV2.AsString := sValor;

  sValor := '';
  oValor := RetornaValor(wbPag2, 'rbarvsgravesS','checked');
  if oValor then sValor := RetornaValor(wbPag2, 'rbarvsgravesS','value');
  oValor := RetornaValor(wbPag2, 'rbarvsgravesN','checked');
  if oValor then  sValor := RetornaValor(wbPag2, 'rbarvsgravesN','value');
  dmGeral.TB_AVALIACAO_INICIALFL_SINTOMAS_GRAVES2.AsString := sValor;

  sValor := RetornaValor(wbPag2, 'txarvsgraves', 'value');
  dmGeral.TB_AVALIACAO_INICIALTX_SINTOMAS_GRAVES2.AsString := sValor;

  sValor := RetornaValor(wbPag2, 'txmretorno', 'value');
  dmGeral.TB_AVALIACAO_INICIALDT_PUERPERA_RETORNO.AsString := sValor;

  sValor := '';
  oValor := RetornaValor(wbPag2, 'rbddefinitivoS','checked');
  if oValor then sValor := RetornaValor(wbPag2, 'rbddefinitivoS','value');
  oValor := RetornaValor(wbPag2, 'rbddefinitivoN','checked');
  if oValor then  sValor := RetornaValor(wbPag2, 'rbddefinitivoN','value');
  dmGeral.TB_AVALIACAO_INICIALFL_CRIANCA_EXPOSTA.AsString := sValor;

  sValor := RetornaValor(wbPag2, 'txddefinitivo', 'value');
  dmGeral.TB_AVALIACAO_INICIALDT_CRIANCA_EXPOSTA.AsString := sValor;

  sValor := '';
  oValor := RetornaValor(wbPag2, 'rbrseguimentoS','checked');
  if oValor then sValor := RetornaValor(wbPag2, 'rbrseguimentoS','value');
  oValor := RetornaValor(wbPag2, 'rbrseguimentoN','checked');
  if oValor then  sValor := RetornaValor(wbPag2, 'rbrseguimentoN','value');
  dmGeral.TB_AVALIACAO_INICIALFL_SEGUIMENTO.AsString := sValor;

  dmGeral.TB_AVALIACAO_INICIALTX_SEGUIMENTO.AsString := sValor;
  sValor := RetornaValor(wbPag2, 'txrseguimento', 'value');

  sValor := '';
  oValor := RetornaValor(wbPag2, 'rbemusoprofilaxiaS','checked');
  if oValor then sValor := RetornaValor(wbPag2, 'rbemusoprofilaxiaS','value');
  oValor := RetornaValor(wbPag2, 'rbemusoprofilaxiaN','checked');
  if oValor then  sValor := RetornaValor(wbPag2, 'rbemusoprofilaxiaN','value');
  dmGeral.TB_AVALIACAO_INICIALFL_EM_USO_PROFILAXIA.AsString := sValor;

  sValor := RetornaValor(wbPag2, 'txanotacoes', 'value');
  dmGeral.TB_AVALIACAO_INICIALTX_AOTACOES_ENFERMAGEM.AsString := sValor;

  sValor := RetornaValor(wbPag2, 'txenfermeiro', 'value');
  dmGeral.TB_AVALIACAO_INICIALNM_MEDICO.AsString := sValor;

  sValor := RetornaValor(wbPag2, 'txordenfa', 'value');
  dmGeral.TB_AVALIACAO_INICIALNR_ORDEM.AsString := sValor;

  dmGeral.TB_AVALIACAO_INICIAL.Post;
end;

procedure TframFicha2.CarregaDados;
var
  sValor:string;
  i:integer;
begin

//Processo
  sValor := dmGeral.TB_AVALIACAO_INICIALNR_PROCESSO.AsString;
  DefineValor(wbPag1, 'lbProcesso','innerHtml',sValor);

//Data
  sValor := DateTostr(trunc(dmGeral.TB_AVALIACAO_INICIALDT_CADASTRO.AsDateTime));
  DefineValor(wbPag1, 'lbData','innerHtml',sValor);

//Nome
  sValor := dmGeral.TB_AVALIACAO_INICIALNM_PACIENTE.AsString;
  DefineValor(wbPag1, 'lbNome','innerHtml',sValor);

//Nasc
  sValor := dmGeral.TB_AVALIACAO_INICIALDT_NASCIMENTO.AsString;
  DefineValor(wbPag1, 'lbDtNasc','innerHtml',sValor);

//Idade
  sValor := dmGeral.TB_AVALIACAO_INICIALIDADE.AsString;
  DefineValor(wbPag1, 'lbIdade','innerHtml',sValor);

//Sexo
  sValor := dmGeral.TB_AVALIACAO_INICIALTP_SEXO.AsString;
  if sValor = 'M' then
    DefineValor(wbPag1, 'rbMasc','checked',true);
  if sValor = 'F' then
    DefineValor(wbPag1, 'rbFem','checked',true);

//Nome Mae
  sValor := dmGeral.TB_AVALIACAO_INICIALNM_MAE.AsString;
  DefineValor(wbPag1, 'lbNmMae','innerHtml',sValor);

//Municipio
  sValor := dmGeral.TB_AVALIACAO_INICIALDS_MUNICIPIO.AsString;
  DefineValor(wbPag1, 'lbMunicipio','innerHtml',sValor);

//Provincia
  sValor := dmGeral.TB_AVALIACAO_INICIALDS_PROVINCIA.AsString;
  DefineValor(wbPag1, 'lbProvincia','innerHtml',sValor);

//------------------------------------------------------------------------------

//Motivo
  sValor := dmGeral.TB_AVALIACAO_INICIALFL_MOTIVO.AsString;
  if sValor = 'C' then
    DefineValor(wbPag1, 'rbmotivoC','checked',true);
  if sValor = 'T' then
    DefineValor(wbPag1, 'rbmotivoT','checked',true);

//Data Diagnostico
  sValor := dmGeral.TB_AVALIACAO_INICIALDT_DIAGNOSTICO.AsString;
  DefineValor(wbPag1, 'txdtdiagnostico', 'value', sValor);

//Nr Filhos e fez teste
  sValor := dmGeral.TB_AVALIACAO_INICIALNR_FILHO.AsString;
  DefineValor(wbPag1, 'txnrfilhos', 'value', sValor);

  sValor := dmGeral.TB_AVALIACAO_INICIALFL_TESTE.AsString;
  if sValor = 'S' then
    DefineValor(wbPag1, 'rbtestehojeS','checked',true);
  if sValor = 'N' then
    DefineValor(wbPag1, 'rbtestehojeN','checked',true);

//Parceiro fez teste
  sValor := dmGeral.TB_AVALIACAO_INICIALFL_PARCEIRO_TESTE.AsString;
  if sValor = 'S' then
    DefineValor(wbPag1, 'rbptestehojeS','checked',true);
  if sValor = 'N' then
    DefineValor(wbPag1, 'rbptestehojeN','checked',true);

  sValor := dmGeral.TB_AVALIACAO_INICIALTX_RESULTADO.AsString;
  DefineValor(wbPag1, 'txresultado', 'value', sValor);

//Mais de um Parceiro
  sValor := dmGeral.TB_AVALIACAO_INICIALFL_MAIS_PARCEIRO.AsString;
  if sValor = 'S' then
    DefineValor(wbPag1, 'rbparceiroS','checked',true);
  if sValor = 'N' then
    DefineValor(wbPag1, 'rbparceiroN','checked',true);

//Esta Grávida
  sValor := dmGeral.TB_AVALIACAO_INICIALFL_GRAVIDA.AsString;
  if sValor = 'S' then
    DefineValor(wbPag1, 'rbgravidaS','checked',true);
  if sValor = 'N' then
    DefineValor(wbPag1, 'rbgravidaN','checked',true);
  if sValor = 'NA' then
    DefineValor(wbPag1, 'rbgravidaNA','checked',true);

//Sinais Vitais
  for i := 1 to 6 do
  begin
    sValor := dmGeral.TB_AVALIACAO_INICIAL.FieldByName('TX_SINAIS_VITAIS'+intTostr(i)).AsString;
    DefineValor(wbPag1, 'txVit'+intTostr(i), 'value', sValor);
  end;

//Sinais Paludismo
  sValor := dmGeral.TB_AVALIACAO_INICIALFL_SINAIS_PALUDISMO.AsString;
  if sValor = 'S' then
    DefineValor(wbPag1, 'rbspaludismoS','checked',true);
  if sValor = 'N' then
    DefineValor(wbPag1, 'rbspaludismoN','checked',true);

//Diagnóstico Paludismo
  sValor := dmGeral.TB_AVALIACAO_INICIALFL_DIAG_PALUDISMO.AsString;
  if sValor = 'S' then
    DefineValor(wbPag1, 'rbdpaludismoS','checked',true);
  if sValor = 'N' then
    DefineValor(wbPag1, 'rbdpaludismoN','checked',true);

//Sinais tuberculose
  sValor := dmGeral.TB_AVALIACAO_INICIALFL_SINAIS_TUBERCULOSE.AsString;
  if sValor = 'S' then
    DefineValor(wbPag1, 'rbstuberculoseS','checked',true);
  if sValor = 'N' then
    DefineValor(wbPag1, 'rbstuberculoseN','checked',true);

//Diagnóstico tuberculose
  sValor := dmGeral.TB_AVALIACAO_INICIALFL_DIAG_TUBERCULOSE.AsString;
  if sValor = 'S' then
    DefineValor(wbPag1, 'rbdtuberculoseS','checked',true);
  if sValor = 'N' then
    DefineValor(wbPag1, 'rbdtuberculoseN','checked',true);

//Conduta
  sValor := dmGeral.TB_AVALIACAO_INICIALTX_SINAIS_CONDUTA.AsString;
  DefineValor(wbPag1, 'txconduta', 'value', sValor);

//ckSint1
  for i := 1 to 39 do
  begin
    sValor := dmGeral.TB_AVALIACAO_INICIAL.FieldByName('FL_QUADRO_OMS'+intToStr(i)).AsString;
    if sValor = 'S' then
      DefineValor(wbPag1, 'ckSint'+intToStr(i),'checked', true)
    else
      DefineValor(wbPag1, 'ckSint'+intToStr(i),'checked', false);
  end;

//Conclusão Menor
  sValor := dmGeral.TB_AVALIACAO_INICIALFL_CONCLUSAO_MENOR.AsString;
  if sValor = 'Z' then
    DefineValor(wbPag1, 'rbcmenorZ','checked',true);
  if sValor = 'D' then
    DefineValor(wbPag1, 'rbcmenorD','checked',true);

//Conclusão Maior
  sValor := dmGeral.TB_AVALIACAO_INICIALFL_CONCLUSAO_MAIOR.AsString;
  if sValor = 'Z' then
    DefineValor(wbPag1, 'rbcmaiorZ','checked',true);
  if sValor = 'D' then
    DefineValor(wbPag1, 'rbcmaiorD','checked',true);

//Classificação OMS segundo Sinais e Sintomas
  sValor := dmGeral.TB_AVALIACAO_INICIALTX_CLASSIFICACAO.AsString;
  DefineValor(wbPag1, 'txclassificacaoOMS', 'value', sValor);

  sValor := dmGeral.TB_AVALIACAO_INICIALFL_CLASSIFICACAO.AsString;
  if sValor = 'S' then
    DefineValor(wbPag1, 'ckCD4','checked', true)
  else
    DefineValor(wbPag1, 'ckCD4','checked', false);

//Outras Queixas
  sValor := dmGeral.TB_AVALIACAO_INICIALTX_OUTRAS_QUEIXAS.AsString;
  DefineValor(wbPag1, 'txQueixas', 'value', sValor);

//Principais analises TX
  for i := 1 to 7 do
  begin
    sValor := dmGeral.TB_AVALIACAO_INICIAL.FieldByName('TX_PRINCIPAIS_ANALISES'+intTostr(i)).AsString;
    DefineValor(wbPag2, 'txPA'+intTostr(i), 'value', sValor);
  end;

//Principais analises DT
  for i := 1 to 6 do
  begin
    sValor := dmGeral.TB_AVALIACAO_INICIAL.FieldByName('DT_PRINCIPAIS_ANALISES'+intTostr(i)).AsString;
    DefineValor(wbPag2, 'txDTPA'+intTostr(i), 'value', sValor);
  end;

//Seguimento de Rotina
  sValor := dmGeral.TB_AVALIACAO_INICIALFL_SEGUIMENTO_ROTINA.AsString;
  if sValor = 'S' then
    DefineValor(wbPag2, 'ckrotina','checked', true)
  else
    DefineValor(wbPag2, 'ckrotina','checked', false);

//Retorno
  sValor := dmGeral.TB_AVALIACAO_INICIALFL_VAGA_ABERTA.AsString;
  if sValor = 'S' then
    DefineValor(wbPag2, 'rbretornoS','checked',true);
  if sValor = 'N' then
    DefineValor(wbPag2, 'rbretornoN','checked',true);

  sValor := dmGeral.TB_AVALIACAO_INICIALDT_VAGA_ABERTA.AsString;
  DefineValor(wbPag2, 'txdtretorno', 'value', sValor);

//Solicitado
  sValor := dmGeral.TB_AVALIACAO_INICIALFL_CD4_HEMOGRAMA.AsString;
  if sValor = 'S' then
    DefineValor(wbPag2, 'rbsolicitadoS','checked',true);
  if sValor = 'N' then
    DefineValor(wbPag2, 'rbsolicitadoN','checked',true);

  sValor := dmGeral.TB_AVALIACAO_INICIALTX_CD4_HEMOGRAMA.AsString;
  DefineValor(wbPag2, 'txsolicitado', 'value', sValor);

//Alteradas
  sValor := dmGeral.TB_AVALIACAO_INICIALFL_ANALISES_ALTERADAS.AsString;
  if sValor = 'S' then
    DefineValor(wbPag2, 'rbalteradasS','checked',true);
  if sValor = 'N' then
    DefineValor(wbPag2, 'rbalteradasN','checked',true);

  sValor := dmGeral.TB_AVALIACAO_INICIALTX_ANALISES_ALTERADAS.AsString;
  DefineValor(wbPag2, 'txalteradas', 'value', sValor);

//Inicio Imediato
  sValor := dmGeral.TB_AVALIACAO_INICIALFL_INICIO_IMEDIATO.AsString;
  if sValor = 'S' then
    DefineValor(wbPag2, 'ckrotina2','checked', true)
  else
    DefineValor(wbPag2, 'ckrotina2','checked', false);

  sValor := dmGeral.TB_AVALIACAO_INICIALFL_INICIO_IMEDIATO1.AsString;
  if sValor = 'H' then
    DefineValor(wbPag2, 'rbmaiorH','checked',true);
  if sValor = 'M' then
    DefineValor(wbPag2, 'rbmaiorM','checked',true);

  sValor := dmGeral.TB_AVALIACAO_INICIALFL_INICIO_IMEDIATO2.AsString;
  if sValor = 'H' then
    DefineValor(wbPag2, 'rbmenorH','checked',true);
  if sValor = 'M' then
    DefineValor(wbPag2, 'rbmenorM','checked',true);

  sValor := dmGeral.TB_AVALIACAO_INICIALDT_INICIO_IMEDIATO.AsString;
  DefineValor(wbPag2, 'txdtinicio', 'value', sValor);

//Sinais e sintomas Graves
  sValor := dmGeral.TB_AVALIACAO_INICIALFL_SINTOMAS_GRAVES.AsString;
  if sValor = 'S' then
    DefineValor(wbPag2, 'rbsgravesS','checked',true);
  if sValor = 'N' then
    DefineValor(wbPag2, 'rbsgravesN','checked',true);

  sValor := dmGeral.TB_AVALIACAO_INICIALTX_SINTOMAS_GRAVES.AsString;
  DefineValor(wbPag2, 'txsgraves', 'value', sValor);

//Solicitacao analises
  sValor := dmGeral.TB_AVALIACAO_INICIALFL_INICIO_IMEDIATO3.AsString;
  if sValor = 'S' then
    DefineValor(wbPag2, 'rbsanalisesS','checked',true);
  if sValor = 'N' then
    DefineValor(wbPag2, 'rbsanalisesN','checked',true);

  sValor := dmGeral.TB_AVALIACAO_INICIALTX_INICIO_IMEDIATO3.AsString;
  DefineValor(wbPag2, 'txsanalises', 'value', sValor);

//Retorno
  sValor := dmGeral.TB_AVALIACAO_INICIALFL_INICIO_IMEDIATO4.AsString;
  if sValor = 'S' then
    DefineValor(wbPag2, 'rbvalidacaoS','checked',true);
  if sValor = 'N' then
    DefineValor(wbPag2, 'rbvalidacaoN','checked',true);

  sValor := dmGeral.TB_AVALIACAO_INICIALDT_INICIO_IMEDIATO4.AsString;
  DefineValor(wbPag2, 'txdtvalidacao', 'value', sValor);

  sValor := dmGeral.TB_AVALIACAO_INICIALTX_INICIO_IMEDIATO4.AsString;
  DefineValor(wbPag2, 'txvalidacao', 'value', sValor);

//Puerpera
  sValor := dmGeral.TB_AVALIACAO_INICIALFL_PUERPERA.AsString;
  if sValor = 'S' then
    DefineValor(wbPag2, 'ckpuerpera','checked', true)
  else
    DefineValor(wbPag2, 'ckpuerpera','checked', false);

  sValor := dmGeral.TB_AVALIACAO_INICIALTX_ESQUEMA_EM_USO.AsString;
  DefineValor(wbPag2, 'txarvuso', 'value', sValor);

  sValor := dmGeral.TB_AVALIACAO_INICIALDT_INICIO_ARV.AsString;
  DefineValor(wbPag2, 'txdtarv', 'value', sValor);

  sValor := dmGeral.TB_AVALIACAO_INICIALDT_PARTO.AsString;
  DefineValor(wbPag2, 'txdtparto', 'value', sValor);

  sValor := dmGeral.TB_AVALIACAO_INICIALFL_PROFILAXIA.AsString;
  if sValor = 'S' then
    DefineValor(wbPag2, 'ckprofilaxiaarv','checked', true)
  else
    DefineValor(wbPag2, 'ckprofilaxiaarv','checked', false);

  sValor := dmGeral.TB_AVALIACAO_INICIALFL_TRATAMENTO_ARV.AsString;
  if sValor = 'S' then
    DefineValor(wbPag2, 'cktratamentoarv','checked', true)
  else
    DefineValor(wbPag2, 'cktratamentoarv','checked', false);

  sValor := dmGeral.TB_AVALIACAO_INICIALFL_PROFILAXIA_CONDUTA.AsString;
  if sValor = 'S' then
    DefineValor(wbPag2, 'ckprofilaxiaconduta','checked', true)
  else
    DefineValor(wbPag2, 'ckprofilaxiaconduta','checked', false);

  sValor := dmGeral.TB_AVALIACAO_INICIALFL_ALEITAMENTO_ARTIFICIAL.AsString;
  if sValor = 'S' then
    DefineValor(wbPag2, 'ckaleitamentoartificial','checked', true)
  else
    DefineValor(wbPag2, 'ckaleitamentoartificial','checked', false);

  sValor := dmGeral.TB_AVALIACAO_INICIALFL_ALEITAMENTO_MATERNO.AsString;
  if sValor = 'S' then
    DefineValor(wbPag2, 'ckaleitamentomaterno','checked', true)
  else
    DefineValor(wbPag2, 'ckaleitamentomaterno','checked', false);

  sValor := dmGeral.TB_AVALIACAO_INICIALFL_TRATAMENTO_ARV2.AsString;
  if sValor = 'S' then
    DefineValor(wbPag2, 'ckemtratamento','checked', true)
  else
    DefineValor(wbPag2, 'ckemtratamento','checked', false);

  sValor := dmGeral.TB_AVALIACAO_INICIALFL_SINTOMAS_GRAVES2.AsString;
  if sValor = 'S' then
    DefineValor(wbPag2, 'rbarvsgravesS','checked',true);
  if sValor = 'N' then
    DefineValor(wbPag2, 'rbarvsgravesN','checked',true);

  sValor := dmGeral.TB_AVALIACAO_INICIALTX_SINTOMAS_GRAVES2.AsString;
  DefineValor(wbPag2, 'txarvsgraves', 'value', sValor);

  sValor := dmGeral.TB_AVALIACAO_INICIALDT_PUERPERA_RETORNO.AsString;
  DefineValor(wbPag2, 'txmretorno', 'value', sValor);

  sValor := dmGeral.TB_AVALIACAO_INICIALFL_CRIANCA_EXPOSTA.AsString;
  if sValor = 'S' then
    DefineValor(wbPag2, 'rbddefinitivoS','checked',true);
  if sValor = 'N' then
    DefineValor(wbPag2, 'rbddefinitivoN','checked',true);

  sValor := dmGeral.TB_AVALIACAO_INICIALDT_CRIANCA_EXPOSTA.AsString;
  DefineValor(wbPag2, 'txddefinitivo', 'value', sValor);

  sValor := dmGeral.TB_AVALIACAO_INICIALFL_CRIANCA_EXPOSTA.AsString;
  if sValor = 'S' then
    DefineValor(wbPag2, 'rbddefinitivoS','checked',true);
  if sValor = 'N' then
    DefineValor(wbPag2, 'rbddefinitivoN','checked',true);

  sValor := dmGeral.TB_AVALIACAO_INICIALFL_SEGUIMENTO.AsString;
  if sValor = 'S' then
    DefineValor(wbPag2, 'rbrseguimentoS','checked',true);
  if sValor = 'N' then
    DefineValor(wbPag2, 'rbrseguimentoN','checked',true);

  sValor := dmGeral.TB_AVALIACAO_INICIALTX_SEGUIMENTO.AsString;
  DefineValor(wbPag2, 'txrseguimento', 'value', sValor);

  sValor := dmGeral.TB_AVALIACAO_INICIALFL_EM_USO_PROFILAXIA.AsString;
  if sValor = 'S' then
    DefineValor(wbPag2, 'rbemusoprofilaxiaS','checked',true);
  if sValor = 'N' then
    DefineValor(wbPag2, 'rbemusoprofilaxiaN','checked',true);

  sValor := dmGeral.TB_AVALIACAO_INICIALTX_AOTACOES_ENFERMAGEM.AsString;
  DefineValor(wbPag2, 'txanotacoes', 'value', sValor);

  sValor := dmGeral.TB_AVALIACAO_INICIALNM_MEDICO.AsString;
  DefineValor(wbPag2, 'txenfermeiro', 'value', sValor);

  sValor := dmGeral.TB_AVALIACAO_INICIALNR_ORDEM.AsString;
  DefineValor(wbPag2, 'txordenfa', 'value', sValor);
end;

procedure TframFicha2.btSalvarClick(Sender: TObject);
begin
  SalvarDados;
  btEditar.Enabled := true;
  btSalvar.Enabled := false;
end;

procedure TframFicha2.btEditarClick(Sender: TObject);
begin
  dmGeral.TB_AVALIACAO_INICIAL.Edit;
  AtualizarDados;
  btEditar.Enabled := false;
  btSalvar.Enabled := true;
end;

procedure TframFicha2.btConfImpClick(Sender: TObject);
var wb:TWebBrowser; vIn, vOut:OleVariant;
begin
  case pgFicha.ActivePageIndex of
    0: wb := wbPag1;
    1: wb := wbPag2;
  end;

  wb.ControlInterface.ExecWB(OLECMDID_PAGESETUP,
      OLECMDEXECOPT_PROMPTUSER, vIn, vOut);
end;

procedure TframFicha2.btImprimirClick(Sender: TObject);
var wb:TWebBrowser; vIn, vOut:OleVariant;
begin
  case pgFicha.ActivePageIndex of
    0: wb := wbPag1;
    1: wb := wbPag2;
  end;

  wb.ControlInterface.ExecWB(OLECMDID_PRINT,
      OLECMDEXECOPT_DONTPROMPTUSER, vIn, vOut);
end;

procedure TframFicha2.btPreviewClick(Sender: TObject);
var wb:TWebBrowser; vIn, vOut:OleVariant;
begin
  case pgFicha.ActivePageIndex of
    0: wb := wbPag1;
    1: wb := wbPag2;
  end;

  wb.ControlInterface.ExecWB(OLECMDID_PRINTPREVIEW,
      OLECMDEXECOPT_PROMPTUSER, vIn, vOut);
end;

procedure TframFicha2.CarregaDadosCabecalho;
var
  sValor:string;
  i:integer;
begin

//Processo
  sValor := dmGeral.TB_PACIENTENR_PROCESSO.AsString;
  DefineValor(wbPag1, 'lbProcesso','innerHtml',sValor);

//Data Cadastro
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


//Motivo
  DefineValor(wbPag1, 'rbmotivoC','checked',FALSE);
  DefineValor(wbPag1, 'rbmotivoT','checked',FALSE);

//Data Diagnostico (Inclusão auto da tabela NOTIFICACAO)
  sValor := DMGERAL.TB_NOTIFICACAODT_DIAGNOSTICO.AsString;
  DefineValor(wbPag1, 'txdtdiagnostico', 'value', sValor);

//Nr Filhos e fez teste
  DefineValor(wbPag1, 'txnrfilhos', 'value', '');

  DefineValor(wbPag1, 'rbtestehojeS','checked',FALSE);
  DefineValor(wbPag1, 'rbtestehojeN','checked',FALSE);

//Parceiro fez teste
  DefineValor(wbPag1, 'rbptestehojeS','checked',FALSE);
  DefineValor(wbPag1, 'rbptestehojeN','checked',FALSE);

  DefineValor(wbPag1, 'txresultado', 'value', '');

//Mais de um Parceiro
  DefineValor(wbPag1, 'rbparceiroS','checked',FALSE);
  DefineValor(wbPag1, 'rbparceiroN','checked',FALSE);

//Esta Grávida
  DefineValor(wbPag1, 'rbgravidaS','checked',FALSE);
  DefineValor(wbPag1, 'rbgravidaN','checked',FALSE);
  DefineValor(wbPag1, 'rbgravidaNA','checked',FALSE);

//Sinais Vitais (Inclusão auto da tabela TRIAGEM_ENFERMAGEM)
  sValor := dmGeral.TB_TRIAGEM_ENFERMAGEM.FieldByName('TX_SINAIS_VITAIS2').AsString;
  DefineValor(wbPag1, 'txVit1', 'value', sValor);

  sValor := dmGeral.TB_TRIAGEM_ENFERMAGEM.FieldByName('TX_SINAIS_VITAIS3').AsString;
  DefineValor(wbPag1, 'txVit2', 'value', sValor);

  sValor := dmGeral.TB_TRIAGEM_ENFERMAGEM.FieldByName('TX_SINAIS_VITAIS4').AsString;
  DefineValor(wbPag1, 'txVit3', 'value', sValor);

  sValor := dmGeral.TB_TRIAGEM_ENFERMAGEM.FieldByName('TX_SINAIS_VITAIS5').AsString;
  DefineValor(wbPag1, 'txVit4', 'value', sValor);

  sValor := dmGeral.TB_TRIAGEM_ENFERMAGEM.FieldByName('TX_SINAIS_VITAIS6').AsString;
  DefineValor(wbPag1, 'txVit5', 'value', sValor);

  sValor := dmGeral.TB_TRIAGEM_ENFERMAGEM.FieldByName('TX_SINAIS_VITAIS7').AsString;
  DefineValor(wbPag1, 'txVit6', 'value', sValor);

//Sinais Paludismo
  DefineValor(wbPag1, 'rbspaludismoS','checked',FALSE);
  DefineValor(wbPag1, 'rbspaludismoN','checked',FALSE);

//Diagnóstico Paludismo
  DefineValor(wbPag1, 'rbdpaludismoS','checked',FALSE);
  DefineValor(wbPag1, 'rbdpaludismoN','checked',FALSE);

//Sinais tuberculose
  DefineValor(wbPag1, 'rbstuberculoseS','checked',FALSE);
  DefineValor(wbPag1, 'rbstuberculoseN','checked',FALSE);

//Diagnóstico tuberculose
  DefineValor(wbPag1, 'rbdtuberculoseS','checked',FALSE);
  DefineValor(wbPag1, 'rbdtuberculoseN','checked',FALSE);

//Conduta
  DefineValor(wbPag1, 'txconduta', 'value', '');

//ckSint1
  for i := 1 to 39 do
  begin
      DefineValor(wbPag1, 'ckSint'+intToStr(i),'checked', false);
  end;

//Conclusão Menor
  DefineValor(wbPag1, 'rbcmenorZ','checked',FALSE);
  DefineValor(wbPag1, 'rbcmenorD','checked',FALSE);

//Conclusão Maior
  DefineValor(wbPag1, 'rbcmaiorZ','checked',FALSE);
  DefineValor(wbPag1, 'rbcmaiorD','checked',FALSE);

//Classificação OMS segundo Sinais e Sintomas
  DefineValor(wbPag1, 'txclassificacaoOMS', 'value', '');

  DefineValor(wbPag1, 'ckCD4','checked', false);

//Outras Queixas
  DefineValor(wbPag1, 'txQueixas', 'value', '');

//Principais analises TX
  for i := 1 to 7 do
  begin
    DefineValor(wbPag2, 'txPA'+intTostr(i), 'VALUE', '');
  end;

//Principais analises DT
  for i := 1 to 6 do
  begin
    DefineValor(wbPag2, 'txDTPA'+intTostr(i), 'VALUE', '');
  end;

//Seguimento de Rotina
  DefineValor(wbPag2, 'ckrotina','checked', FALSE);

//Retorno
  DefineValor(wbPag2, 'rbretornoS','checked',FALSE);
  DefineValor(wbPag2, 'rbretornoN','chcked',FALSE);

  DefineValor(wbPag2, 'txdtretorno', 'value', '');

//Solicitado
  DefineValor(wbPag2, 'rbsolicitadoS','checked',FALSE);
  DefineValor(wbPag2, 'rbsolicitadoN','checked',FALSE);

  DefineValor(wbPag2, 'txsolicitado', 'value', sValor);

//Alteradas
  DefineValor(wbPag2, 'rbalteradasS','checked',FALSE);
  DefineValor(wbPag2, 'rbalteradasN','checked',FALSE);

  DefineValor(wbPag2, 'txalteradas', 'value', '');

//Inicio Imediato
  DefineValor(wbPag2, 'ckrotina2','checked', FALSE);

  DefineValor(wbPag2, 'rbmaiorH','checked',FALSE);
  DefineValor(wbPag2, 'rbmaiorM','checked',FALSE);

  DefineValor(wbPag2, 'rbmenorH','checked',FALSE);
  DefineValor(wbPag2, 'rbmenorM','checked',FALSE);

  DefineValor(wbPag2, 'txdtinicio', 'value', '');

//Sinais e sintomas Graves
  DefineValor(wbPag2, 'rbsgravesS','checked',FALSE);
  DefineValor(wbPag2, 'rbsgravesN','checked',FALSE);

  DefineValor(wbPag2, 'txsgraves', 'value', '');

//Solicitacao analises
  DefineValor(wbPag2, 'rbsanalisesS','checked',FALSE);
  DefineValor(wbPag2, 'rbsanalisesN','checked',FALSE);

  DefineValor(wbPag2, 'txsanalises', 'value', '');

//Retorno
  DefineValor(wbPag2, 'rbvalidacaoS','checked',FALSE);
  DefineValor(wbPag2, 'rbvalidacaoN','checked',FALSE);

  DefineValor(wbPag2, 'txdtvalidacao', 'value', '');

  DefineValor(wbPag2, 'txvalidacao', 'value', '');

//Puerpera
  DefineValor(wbPag2, 'ckpuerpera','checked', false);

  DefineValor(wbPag2, 'txarvuso', 'value', '');

  DefineValor(wbPag2, 'txdtarv', 'value', '');

  DefineValor(wbPag2, 'txdtparto', 'value', '');

  DefineValor(wbPag2, 'ckprofilaxiaarv','checked', false);

  DefineValor(wbPag2, 'cktratamentoarv','checked', false);

  DefineValor(wbPag2, 'ckprofilaxiaconduta','checked', false);

  DefineValor(wbPag2, 'ckaleitamentoartificial','checked', false);

  DefineValor(wbPag2, 'ckaleitamentomaterno','checked', false);

  DefineValor(wbPag2, 'ckemtratamento','checked', false);

  DefineValor(wbPag2, 'rbarvsgravesS','checked',FALSE);
  DefineValor(wbPag2, 'rbarvsgravesN','checked',FALSE);

  DefineValor(wbPag2, 'txarvsgraves', 'value', '');

  DefineValor(wbPag2, 'txmretorno', 'value', '');

  DefineValor(wbPag2, 'rbddefinitivoS','checked',FALSE);
  DefineValor(wbPag2, 'rbddefinitivoN','checked',FALSE);

  DefineValor(wbPag2, 'txddefinitivo', 'value', '');

  DefineValor(wbPag2, 'rbddefinitivoS','checked',FALSE);
  DefineValor(wbPag2, 'rbddefinitivoN','checked',FALSE);

  DefineValor(wbPag2, 'rbrseguimentoS','checked',FALSE);
  DefineValor(wbPag2, 'rbrseguimentoN','checked',FALSE);

  DefineValor(wbPag2, 'txrseguimento', 'value', '');

  DefineValor(wbPag2, 'rbemusoprofilaxiaS','checked',FALSE);
  DefineValor(wbPag2, 'rbemusoprofilaxiaN','checked',FALSE);

  DefineValor(wbPag2, 'txanotacoes', 'value', '');

  DefineValor(wbPag2, 'txenfermeiro', 'value', '');

  DefineValor(wbPag2, 'txordenfa', 'value', '');

end;

procedure TframFicha2.AtualizarDados;
var
  sValor:string;
  i:integer;
begin
//Processo
  sValor := dmGeral.TB_PACIENTENR_PROCESSO.AsString;
  DefineValor(wbPag1, 'lbProcesso','innerHtml',sValor);

//Data Cadastro
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

//Data Diagnostico (Inclusão auto da tabela NOTIFICACAO)
  sValor := DateToStr(dmGeral.TB_NOTIFICACAODT_DIAGNOSTICO.AsDateTime);
  DefineValor(wbPag1, 'txDtDiagnostico','value',sValor);

//Sinais Vitais (Inclusão auto da tabela TRIAGEM_ENFERMAGEM)
  if DMGERAL.TB_AVALIACAO_INICIALTX_SINAIS_VITAIS1.AsString = '' then
  begin
    sValor := dmGeral.TB_TRIAGEM_ENFERMAGEM.FieldByName('TX_SINAIS_VITAIS2').AsString;
    DefineValor(wbPag1, 'txVit1', 'value', sValor);
  end;

  if DMGERAL.TB_AVALIACAO_INICIALTX_SINAIS_VITAIS2.AsString = '' then
  begin
    sValor := dmGeral.TB_TRIAGEM_ENFERMAGEM.FieldByName('TX_SINAIS_VITAIS3').AsString;
    DefineValor(wbPag1, 'txVit2', 'value', sValor);
  end;

  if DMGERAL.TB_AVALIACAO_INICIALTX_SINAIS_VITAIS3.AsString = '' then
  begin
    sValor := dmGeral.TB_TRIAGEM_ENFERMAGEM.FieldByName('TX_SINAIS_VITAIS4').AsString;
    DefineValor(wbPag1, 'txVit3', 'value', sValor);
  end;

  if DMGERAL.TB_AVALIACAO_INICIALTX_SINAIS_VITAIS4.AsString = '' then
  begin
    sValor := dmGeral.TB_TRIAGEM_ENFERMAGEM.FieldByName('TX_SINAIS_VITAIS5').AsString;
    DefineValor(wbPag1, 'txVit4', 'value', sValor);
  end;

  if DMGERAL.TB_AVALIACAO_INICIALTX_SINAIS_VITAIS5.AsString = '' then
  begin
    sValor := dmGeral.TB_TRIAGEM_ENFERMAGEM.FieldByName('TX_SINAIS_VITAIS6').AsString;
    DefineValor(wbPag1, 'txVit5', 'value', sValor);
  end;

  if DMGERAL.TB_AVALIACAO_INICIALTX_SINAIS_VITAIS6.AsString = '' then
  begin
    sValor := dmGeral.TB_TRIAGEM_ENFERMAGEM.FieldByName('TX_SINAIS_VITAIS7').AsString;
    DefineValor(wbPag1, 'txVit6', 'value', sValor);
  end;

end;

end.
