unit uFrameFicha1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, OleCtrls, SHDocVw, ExtCtrls, ComCtrls, Buttons, DB,  Httpapp, MSHTML,
  Printers;

type
  TframFicha1 = class(TFrame)
    pnToolBar: TPanel;
    pgFicha: TPageControl;
    tabPag1: TTabSheet;
    tabPag2: TTabSheet;
    dsPrimeiraConsulta: TDataSource;
    wbPag1: TWebBrowser;
    wbPag2: TWebBrowser;
    btNovo: TSpeedButton;
    btEditar: TSpeedButton;
    btCancelEdit: TSpeedButton;
    btSalvar: TSpeedButton;
    btConfImp: TSpeedButton;
    btPreview: TSpeedButton;
    btImprimir: TSpeedButton;
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

procedure TframFicha1.AbreConsulta;
begin
  dmGeral.TB_PRIMEIRA_CONSULTA.Close;
  dmGeral.TB_PRIMEIRA_CONSULTA.ParamByName('CD_PACIENTE').AsInteger :=
     dmGeral.TB_PACIENTECD_PACIENTE.AsInteger;
  dmGeral.TB_PRIMEIRA_CONSULTA.Open;
  if dmGeral.TB_PRIMEIRA_CONSULTA.IsEmpty then
    CarregaDadosCabecalho
  else
    CarregaDados;
end;

procedure TframFicha1.AbrePaginas;
var sUrl :string;
begin
  sUrl := sPathConsulta + 'PrimeiraConsulta.html';
  wbPag1.Navigate(sUrl);
  sUrl := sPathConsulta + 'PrimeiraConsulta2.html';
  wbPag2.Navigate(sUrl);
end;

function TframFicha1.GetElementById(const Doc: IDispatch; const Id: string): IDispatch;
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

function TframFicha1.GetElementByName(const Doc: IDispatch; const Name: string): IDispatch;
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

function TframFicha1.RetornaValor(wb:TWebBrowser; id,att:string):OleVariant;
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

procedure  TframFicha1.DefineValor(wb:TWebBrowser; id,att:string; oValor:OleVariant);
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

procedure TframFicha1.SalvarDados;
var
  oValor:OleVariant;
  sValor:string;
  i:integer;
begin
  dmGeral.TB_PRIMEIRA_CONSULTA.Edit;

  dmGeral.TB_PRIMEIRA_CONSULTACD_PACIENTE.AsInteger :=
      dmGeral.TB_PACIENTECD_PACIENTE.AsInteger;

//Data Diagnostico
  sValor := '';
  sValor := RetornaValor(wbPag1, 'txDtDiagnostico', 'value');
  dmGeral.TB_PRIMEIRA_CONSULTADT_DIAGNOSTICO.AsString := sValor;

//Teste
  sValor := '';
  oValor := RetornaValor(wbPag1, 'rbTRap','checked');
  if oValor then sValor := RetornaValor(wbPag1, 'rbTRap','value');
  oValor := RetornaValor(wbPag1, 'rbElisa','checked');
  if oValor then  sValor := RetornaValor(wbPag1, 'rbElisa','value');
  oValor := RetornaValor(wbPag1, 'rbWB','checked');
  if oValor then  sValor := RetornaValor(wbPag1, 'rbWB','value');
  oValor := RetornaValor(wbPag1, 'rbOutro','checked');
  if oValor then  sValor := RetornaValor(wbPag1, 'rbOutro','value');
  dmGeral.TB_PRIMEIRA_CONSULTATP_TESTE.AsString := sValor;

//Puerpa
  sValor := '';
  oValor := RetornaValor(wbPag1, 'rbPurN','checked');
  if oValor then sValor := RetornaValor(wbPag1, 'rbPurN','value');
  oValor := RetornaValor(wbPag1, 'rbPurS','checked');
  if oValor then  sValor := RetornaValor(wbPag1, 'rbPurS','value');
  dmGeral.TB_PRIMEIRA_CONSULTAFL_PUERPERA.AsString := sValor;

//ARVS
  sValor := '';
  oValor := RetornaValor(wbPag1, 'rbARVN','checked');
  if oValor then sValor := RetornaValor(wbPag1, 'rbARVN','value');
  oValor := RetornaValor(wbPag1, 'rbARVS','checked');
  if oValor then  sValor := RetornaValor(wbPag1, 'rbARVS','value');
  dmGeral.TB_PRIMEIRA_CONSULTAFL_ARVS.AsString := sValor;

//PROFIL
  sValor := '';
  oValor := RetornaValor(wbPag1, 'ckProf','checked');
  if oValor then sValor := 'S' else sValor := 'N';
  dmGeral.TB_PRIMEIRA_CONSULTAFL_PROFILAXIA.AsString := sValor;

//TRATAMENTO
  sValor := '';
  oValor := RetornaValor(wbPag1, 'ckTrat','checked');
  if oValor then sValor := 'S' else sValor := 'N';
  dmGeral.TB_PRIMEIRA_CONSULTAFL_TRATAMENTO.AsString := sValor;

//Filho Acomp
  sValor := '';
  oValor := RetornaValor(wbPag1, 'rbFilhoN','checked');
  if oValor then sValor := RetornaValor(wbPag1, 'rbFilhoN','value');
  oValor := RetornaValor(wbPag1, 'rbFilhoS','checked');
  if oValor then  sValor := RetornaValor(wbPag1, 'rbFilhoS','value');
  dmGeral.TB_PRIMEIRA_CONSULTAFL_FILHO_ACOMP.AsString := sValor;

//Sintomas
//ckSint1 , txSint1
  for i := 1 to 13 do
  begin
    sValor := '';
    oValor := RetornaValor(wbPag1, 'ckSint'+intToStr(i),'checked');
    if oValor then sValor := 'S' else sValor := 'N';
    dmGeral.TB_PRIMEIRA_CONSULTA.FieldByName('FL_SINTOMA'+intToStr(i)).AsString := sValor;

    sValor := RetornaValor(wbPag1, 'txSint'+intToStr(i),'value');
    dmGeral.TB_PRIMEIRA_CONSULTA.FieldByName('TX_SINTOMA'+intToStr(i)).AsString := sValor;
  end;

//Obs
  sValor := '';
  sValor := RetornaValor(wbPag1, 'txObs', 'value');
  dmGeral.TB_PRIMEIRA_CONSULTATX_OBS.AsString := sValor;

//-----------------------------------------------------------------------------------------

//Antecedentes
  for i := 1 to 4 do
  begin
    sValor := '';
    sValor := RetornaValor(wbPag2, 'txAnt'+intTostr(i), 'value');
    dmGeral.TB_PRIMEIRA_CONSULTA.FieldByName('TX_ANTECEDENTES'+intTostr(i)).AsString := sValor;
  end;

//Outros
  sValor := '';
  sValor := RetornaValor(wbPag2, 'txAnt5', 'value');
  dmGeral.TB_PRIMEIRA_CONSULTATX_ANTECEDENTES_OUTROS.AsString := sValor;

//Sinais Vitais
  for i := 1 to 5 do
  begin
    sValor := '';
    sValor := RetornaValor(wbPag2, 'txVit'+intTostr(i), 'value');
    dmGeral.TB_PRIMEIRA_CONSULTA.FieldByName('TX_SINAIS_VITAIS'+intTostr(i)).AsString := sValor;
  end;

//Exame Fisico
  sValor := '';
  sValor := RetornaValor(wbPag2, 'txExmFis', 'value');
  dmGeral.TB_PRIMEIRA_CONSULTATX_EXAME_FISICO.AsString := sValor;

//Classificacao
  for i := 1 to 4 do
  begin
    sValor := '';
    sValor := RetornaValor(wbPag2, 'txHip'+intTostr(i), 'value');
    dmGeral.TB_PRIMEIRA_CONSULTA.FieldByName('TX_HIPOTESE'+intTostr(i)).AsString := sValor;
  end;

//Analises
  sValor := '';
  sValor := RetornaValor(wbPag2, 'txAnalise', 'value');
  dmGeral.TB_PRIMEIRA_CONSULTATX_ANALISES.AsString := sValor;

//Conduta
  for i := 1 to 4 do
  begin
    sValor := '';
    sValor := RetornaValor(wbPag2, 'txCon'+intTostr(i), 'value');
    dmGeral.TB_PRIMEIRA_CONSULTA.FieldByName('TX_CONDUTA'+intTostr(i)).AsString := sValor;
  end;

//Retorno Data
  sValor := '';
  sValor := RetornaValor(wbPag2, 'txDtRetorno', 'value');
  try
    dmGeral.TB_PRIMEIRA_CONSULTADT_RETORNO.AsDateTime := strToDate(sValor);
  except
    dmGeral.TB_PRIMEIRA_CONSULTADT_RETORNO.AsString := '';
  end;

//Retorno Tipo Consulta
  sValor := '';
  sValor := RetornaValor(wbPag2, 'txRet2', 'value');
  dmGeral.TB_PRIMEIRA_CONSULTATP_CONSULTA.AsString := sValor;

//Encaminhamento
  sValor := '';
  sValor := RetornaValor(wbPag2, 'txEnc', 'value');
  dmGeral.TB_PRIMEIRA_CONSULTATX_ENCAMINHAMENTO.AsString := sValor;

//Medico
  sValor := '';
  sValor := RetornaValor(wbPag2, 'txMed', 'value');
  dmGeral.TB_PRIMEIRA_CONSULTANM_MEDICO.AsString := sValor;

//Ordem
  sValor := '';
  sValor := RetornaValor(wbPag2, 'txOrd', 'value');
  dmGeral.TB_PRIMEIRA_CONSULTANR_ORDEM.AsString := sValor;

  dmGeral.TB_PRIMEIRA_CONSULTA.Post;
end;

procedure TframFicha1.CarregaDados;
var
  sValor:string;
  i:integer;
begin

//Processo
  sValor := dmGeral.TB_PRIMEIRA_CONSULTANR_PROCESSO.AsString;
  DefineValor(wbPag1, 'lbProcesso','innerHtml',sValor);

//Data
  sValor := DateTostr(trunc(dmGeral.TB_PRIMEIRA_CONSULTADT_CADASTRO.AsDateTime));
  DefineValor(wbPag1, 'lbData','innerHtml',sValor);

//Nome
  sValor := dmGeral.TB_PRIMEIRA_CONSULTANM_PACIENTE.AsString;
  DefineValor(wbPag1, 'lbNome','innerHtml',sValor);

//Nasc
  sValor := dmGeral.TB_PRIMEIRA_CONSULTADT_NASCIMENTO.AsString;
  DefineValor(wbPag1, 'lbDtNasc','innerHtml',sValor);

//Idade
  sValor := dmGeral.TB_PRIMEIRA_CONSULTAIDADE.AsString;
  DefineValor(wbPag1, 'lbIdade','innerHtml',sValor);

//Sexo
  sValor := dmGeral.TB_PRIMEIRA_CONSULTATP_SEXO.AsString;
  if sValor = 'M' then
    DefineValor(wbPag1, 'rbMasc','checked',true);
  if sValor = 'F' then
    DefineValor(wbPag1, 'rbFem','checked',true);

//Nome Mae
  sValor := dmGeral.TB_PRIMEIRA_CONSULTANM_MAE.AsString;
  DefineValor(wbPag1, 'lbNmMae','innerHtml',sValor);

//Municipio
  sValor := dmGeral.TB_PRIMEIRA_CONSULTADS_MUNICIPIO.AsString;
  DefineValor(wbPag1, 'lbMunicipio','innerHtml',sValor);

//Provincia
  sValor := dmGeral.TB_PRIMEIRA_CONSULTADS_PROVINCIA.AsString;
  DefineValor(wbPag1, 'lbProvincia','innerHtml',sValor);


//------------------------------------------------------------------------------
//Data Diagnostico
  sValor := DateToStr(dmGeral.TB_PRIMEIRA_CONSULTADT_DIAGNOSTICO.AsDateTime);
  DefineValor(wbPag1, 'txDtDiagnostico','value',sValor);

//Teste
  sValor := dmGeral.TB_PRIMEIRA_CONSULTATP_TESTE.AsString;
  if sValor = 'R' then
    DefineValor(wbPag1, 'rbTRap','checked',true);
  if sValor = 'E' then
    DefineValor(wbPag1, 'rbElisa','checked',true);
  if sValor = 'W' then
    DefineValor(wbPag1, 'rbWB','checked',true);
  if sValor = 'O' then
    DefineValor(wbPag1, 'rbOutro','checked',true);

//Puerpa
  sValor := dmGeral.TB_PRIMEIRA_CONSULTAFL_PUERPERA.AsString;
  if sValor = 'S' then
    DefineValor(wbPag1, 'rbPurS','checked', true)
  else
    DefineValor(wbPag1, 'rbPurN','checked', true);

//ARVS
  sValor := dmGeral.TB_PRIMEIRA_CONSULTAFL_ARVS.AsString;
  if sValor = 'S' then
    DefineValor(wbPag1, 'rbARVS','checked', true)
  else
    DefineValor(wbPag1, 'rbARVN','checked', true);

//PROFIL
  sValor := dmGeral.TB_PRIMEIRA_CONSULTAFL_PROFILAXIA.AsString;
  if sValor = 'S' then
    DefineValor(wbPag1, 'ckProf','checked', true)
  else
    DefineValor(wbPag1, 'ckProf','checked', false);

//TRATAMENTO
  sValor := dmGeral.TB_PRIMEIRA_CONSULTAFL_TRATAMENTO.AsString;
  if sValor = 'S' then
    DefineValor(wbPag1, 'ckTrat','checked', true)
  else
    DefineValor(wbPag1, 'ckTrat','checked', false);

//Filho Acomp
  sValor := dmGeral.TB_PRIMEIRA_CONSULTAFL_FILHO_ACOMP.AsString;
  if sValor = 'S' then
    DefineValor(wbPag1, 'rbFilhoS','checked', true)
  else
    DefineValor(wbPag1, 'rbFilhoN','checked', true);

//Sintomas
//ckSint1 , txSint1
  for i := 1 to 13 do
  begin
    sValor := dmGeral.TB_PRIMEIRA_CONSULTA.FieldByName('FL_SINTOMA'+intToStr(i)).AsString;
    if sValor = 'S' then
      DefineValor(wbPag1, 'ckSint'+intToStr(i),'checked', true)
    else
      DefineValor(wbPag1, 'ckSint'+intToStr(i),'checked', false);

    sValor := dmGeral.TB_PRIMEIRA_CONSULTA.FieldByName('TX_SINTOMA'+intToStr(i)).AsString;
    DefineValor(wbPag1, 'txSint'+intToStr(i),'value',sValor);
  end;

//Obs
  sValor := dmGeral.TB_PRIMEIRA_CONSULTATX_OBS.AsString;
  DefineValor(wbPag1, 'txObs','value', sValor);

//----------------------------------------------------------------------------------------

//Antecedentes
  for i := 1 to 4 do
  begin
    sValor := dmGeral.TB_PRIMEIRA_CONSULTA.FieldByName('TX_ANTECEDENTES'+intTostr(i)).AsString;
    DefineValor(wbPag2, 'txAnt'+intTostr(i), 'value', sValor);
  end;

//Outros
  sValor := dmGeral.TB_PRIMEIRA_CONSULTATX_ANTECEDENTES_OUTROS.AsString;
  DefineValor(wbPag2, 'txAnt5', 'value', svalor);

//Sinais Vitais
  for i := 1 to 5 do
  begin
    sValor := dmGeral.TB_PRIMEIRA_CONSULTA.FieldByName('TX_SINAIS_VITAIS'+intTostr(i)).AsString;
    DefineValor(wbPag2, 'txVit'+intTostr(i), 'value', sValor);
  end;

//Exame Fisico
  sValor := dmGeral.TB_PRIMEIRA_CONSULTATX_EXAME_FISICO.AsString;
  DefineValor(wbPag2, 'txExmFis', 'value', svalor);

//Classificacao
  for i := 1 to 4 do
  begin
    sValor := dmGeral.TB_PRIMEIRA_CONSULTA.FieldByName('TX_HIPOTESE'+intTostr(i)).AsString;
    DefineValor(wbPag2, 'txHip'+intTostr(i), 'value', sValor);
  end;

//Analises
  sValor := dmGeral.TB_PRIMEIRA_CONSULTATX_ANALISES.AsString;
  DefineValor(wbPag2, 'txAnalise', 'value', sValor);

//Conduta
  for i := 1 to 4 do
  begin
    sValor := dmGeral.TB_PRIMEIRA_CONSULTA.FieldByName('TX_CONDUTA'+intTostr(i)).AsString;
    DefineValor(wbPag2, 'txCon'+intTostr(i), 'value', sValor);
  end;

//Retorno Data
  sValor := dmGeral.TB_PRIMEIRA_CONSULTADT_RETORNO.AsString;
  DefineValor(wbPag2, 'txDtRetorno', 'value', sValor);

//Retorno Tipo Consulta
  sValor := dmGeral.TB_PRIMEIRA_CONSULTATP_CONSULTA.AsString;
  DefineValor(wbPag2, 'txRet2', 'value', sValor);

//Encaminhamento
  sValor := dmGeral.TB_PRIMEIRA_CONSULTATX_ENCAMINHAMENTO.AsString;
  DefineValor(wbPag2, 'txEnc', 'value', sValor);

//Medico
  sValor := dmGeral.TB_PRIMEIRA_CONSULTANM_MEDICO.AsString;
  DefineValor(wbPag2, 'txMed', 'value', sValor);

//Ordem
  sValor := dmGeral.TB_PRIMEIRA_CONSULTANR_ORDEM.AsString;
  DefineValor(wbPag2, 'txOrd', 'value', sValor);

end;

procedure TframFicha1.btSalvarClick(Sender: TObject);
begin
  SalvarDados;
  btEditar.Enabled := true;
  btSalvar.Enabled := false;
end;

procedure TframFicha1.btEditarClick(Sender: TObject);
begin
  dmGeral.TB_PRIMEIRA_CONSULTA.Edit;
  AtualizarDados;
  btEditar.Enabled := false;
  btSalvar.Enabled := true;
end;

procedure TframFicha1.btConfImpClick(Sender: TObject);
var wb:TWebBrowser; vIn, vOut:OleVariant;
begin
  case pgFicha.ActivePageIndex of
    0: wb := wbPag1;
    1: wb := wbPag2;
  end;

  wb.ControlInterface.ExecWB(OLECMDID_PAGESETUP,
      OLECMDEXECOPT_PROMPTUSER, vIn, vOut);
end;

procedure TframFicha1.btImprimirClick(Sender: TObject);
var wb:TWebBrowser; vIn, vOut:OleVariant;
begin
  case pgFicha.ActivePageIndex of
    0: wb := wbPag1;
    1: wb := wbPag2;
  end;

  wb.ControlInterface.ExecWB(OLECMDID_PRINT,
      OLECMDEXECOPT_DONTPROMPTUSER, vIn, vOut);
end;

procedure TframFicha1.btPreviewClick(Sender: TObject);
var wb:TWebBrowser; vIn, vOut:OleVariant;
begin
  case pgFicha.ActivePageIndex of
    0: wb := wbPag1;
    1: wb := wbPag2;
  end;

  wb.ControlInterface.ExecWB(OLECMDID_PRINTPREVIEW,
      OLECMDEXECOPT_PROMPTUSER, vIn, vOut);
end;

procedure TframFicha1.CarregaDadosCabecalho;
var
  sValor:string;
  i:integer;
begin

//Processo
  sValor := dmGeral.TB_PACIENTENR_PROCESSO.AsString;
  DefineValor(wbPag1, 'lbProcesso','innerHtml',sValor);

//Data
  sValor := DateTostr(dm.GetDate);
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
  DefineValor(wbPag1, 'txDtDiagnostico','value',sValor);

//Teste
  DefineValor(wbPag1, 'rbTRap','checked',false);
  DefineValor(wbPag1, 'rbElisa','checked',false);
  DefineValor(wbPag1, 'rbWB','checked',false);
  DefineValor(wbPag1, 'rbOutro','checked',false);

//Puerpa
  DefineValor(wbPag1, 'rbPurS','checked', false);
  DefineValor(wbPag1, 'rbPurN','checked', false);

//ARVS
  DefineValor(wbPag1, 'rbARVS','checked', false);
  DefineValor(wbPag1, 'rbARVN','checked', false);

//PROFIL
  DefineValor(wbPag1, 'ckProf','checked', false);

//TRATAMENTO
  DefineValor(wbPag1, 'ckTrat','checked', false);

//Filho Acomp
  DefineValor(wbPag1, 'rbFilhoS','checked', false);
  DefineValor(wbPag1, 'rbFilhoN','checked', false);

//Sintomas
//ckSint1 , txSint1
  for i := 1 to 13 do
  begin
    DefineValor(wbPag1, 'ckSint'+intToStr(i),'checked', false);
    DefineValor(wbPag1, 'txSint'+intToStr(i),'value','');
  end;

//Obs
  DefineValor(wbPag1, 'txObs','value', '');

//----------------------------------------------------------------------------------------

//Antecedentes
  for i := 1 to 4 do
  begin
    DefineValor(wbPag2, 'txAnt'+intTostr(i), 'value', '');
  end;

//Outros
  DefineValor(wbPag2, 'txAnt5', 'value', '');

//Sinais Vitais (Inclusão auto da tabela TRIAGEM_ENFERMAGEM)
  sValor := dmGeral.TB_TRIAGEM_ENFERMAGEM.FieldByName('TX_SINAIS_VITAIS2').AsString;
  DefineValor(wbPag2, 'txVit1', 'value', sValor);

  sValor := dmGeral.TB_TRIAGEM_ENFERMAGEM.FieldByName('TX_SINAIS_VITAIS3').AsString;
  DefineValor(wbPag2, 'txVit2', 'value', sValor);

  sValor := dmGeral.TB_TRIAGEM_ENFERMAGEM.FieldByName('TX_SINAIS_VITAIS4').AsString;
  DefineValor(wbPag2, 'txVit3', 'value', sValor);

  sValor := dmGeral.TB_TRIAGEM_ENFERMAGEM.FieldByName('TX_SINAIS_VITAIS5').AsString;
  DefineValor(wbPag2, 'txVit4', 'value', sValor);

  sValor := dmGeral.TB_TRIAGEM_ENFERMAGEM.FieldByName('TX_SINAIS_VITAIS6').AsString;
  DefineValor(wbPag2, 'txVit5', 'value', sValor);

//Exame Fisico
  DefineValor(wbPag2, 'txExmFis', 'value', '');

//Classificacao
  for i := 1 to 4 do
  begin
    DefineValor(wbPag2, 'txHip'+intTostr(i), 'value', '');
  end;

//Analises
  sValor := dmGeral.TB_PRIMEIRA_CONSULTATX_ANALISES.AsString;
  DefineValor(wbPag2, 'txAnalise', 'value', '');

//Conduta
  for i := 1 to 4 do
  begin
    DefineValor(wbPag2, 'txCon'+intTostr(i), 'value', '');
  end;

//Retorno Data
  DefineValor(wbPag2, 'txDtRetorno', 'value', '');

//Retorno Tipo Consulta
  DefineValor(wbPag2, 'txRet2', 'value', '');

//Encaminhamento
  DefineValor(wbPag2, 'txEnc', 'value', '');

//Medico
  DefineValor(wbPag2, 'txMed', 'value', '');

//Ordem
  DefineValor(wbPag2, 'txOrd', 'value', '');

end;

procedure TframFicha1.AtualizarDados;
var
  sValor:string;
  i:integer;
begin

//Processo
  sValor := dmGeral.TB_PACIENTENR_PROCESSO.AsString;
  DefineValor(wbPag1, 'lbProcesso','innerHtml',sValor);

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
  if DMGERAL.TB_PRIMEIRA_CONSULTATX_SINAIS_VITAIS1.AsString = '' then
  begin
    sValor := dmGeral.TB_TRIAGEM_ENFERMAGEM.FieldByName('TX_SINAIS_VITAIS2').AsString;
    DefineValor(wbPag2, 'txVit1', 'value', sValor);
  end;

  if DMGERAL.TB_PRIMEIRA_CONSULTATX_SINAIS_VITAIS2.AsString = '' then
  begin
    sValor := dmGeral.TB_TRIAGEM_ENFERMAGEM.FieldByName('TX_SINAIS_VITAIS3').AsString;
    DefineValor(wbPag2, 'txVit2', 'value', sValor);
  end;

  if DMGERAL.TB_PRIMEIRA_CONSULTATX_SINAIS_VITAIS3.AsString = '' then
  begin
    sValor := dmGeral.TB_TRIAGEM_ENFERMAGEM.FieldByName('TX_SINAIS_VITAIS4').AsString;
    DefineValor(wbPag2, 'txVit3', 'value', sValor);
  end;

  if DMGERAL.TB_PRIMEIRA_CONSULTATX_SINAIS_VITAIS4.AsString = '' then
  begin
    sValor := dmGeral.TB_TRIAGEM_ENFERMAGEM.FieldByName('TX_SINAIS_VITAIS5').AsString;
    DefineValor(wbPag2, 'txVit4', 'value', sValor);
  end;

  if DMGERAL.TB_PRIMEIRA_CONSULTATX_SINAIS_VITAIS5.AsString = '' then
  begin
    sValor := dmGeral.TB_TRIAGEM_ENFERMAGEM.FieldByName('TX_SINAIS_VITAIS6').AsString;
    DefineValor(wbPag2, 'txVit5', 'value', sValor);
  end;
end;

end.
