unit uFrameFicha4;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, OleCtrls, SHDocVw, ExtCtrls, ComCtrls, Buttons, DB,  Httpapp, MSHTML,
  Printers;

type
  TframFicha4 = class(TFrame)
    pnToolBar: TPanel;
    pgFicha: TPageControl;
    tabPag1: TTabSheet;
    dsAvaliacaoInicial: TDataSource;
    wbPag1: TWebBrowser;
    btNovo: TSpeedButton;
    btEditar: TSpeedButton;
    btCancelEdit: TSpeedButton;
    btSalvar: TSpeedButton;
    btAnterior: TSpeedButton;
    btProximo: TSpeedButton;
    btConfImp: TSpeedButton;
    btPreview: TSpeedButton;
    btImprimir: TSpeedButton;
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

procedure TframFicha4.AbreConsulta;
begin
  dmGeral.TB_TRIAGEM_ENFERMAGEM.Close;
  dmGeral.TB_TRIAGEM_ENFERMAGEM.ParamByName('CD_PACIENTE').AsInteger :=
     dmGeral.TB_PACIENTECD_PACIENTE.AsInteger;
  dmGeral.TB_TRIAGEM_ENFERMAGEM.Open;
  dmGeral.TB_TRIAGEM_ENFERMAGEM.Last;
  if dmGeral.TB_TRIAGEM_ENFERMAGEM.IsEmpty then
    CarregaDadosCabecalho
  else
    CarregaDados;
end;

procedure TframFicha4.AbrePaginas;
var sUrl :string;
begin
  sUrl := sPathConsulta + 'TriagemEnfermagem1.html';
  wbPag1.Navigate(sUrl);
end;

function TframFicha4.GetElementById(const Doc: IDispatch; const Id: string): IDispatch;
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

function TframFicha4.GetElementByName(const Doc: IDispatch; const Name: string): IDispatch;
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

function TframFicha4.RetornaValor(wb:TWebBrowser; id,att:string):OleVariant;
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

procedure  TframFicha4.DefineValor(wb:TWebBrowser; id,att:string; oValor:OleVariant);
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

procedure TframFicha4.SalvarDados;
var
  oValor:OleVariant;
  sValor:string;
  i:integer;
begin
  dmGeral.TB_TRIAGEM_ENFERMAGEM.Edit;

  dmGeral.TB_TRIAGEM_ENFERMAGEMCD_PACIENTE.AsInteger :=
      dmGeral.TB_PACIENTECD_PACIENTE.AsInteger;



//Motivo
  sValor := '';
  oValor := RetornaValor(wbPag1, 'rbmotivoC','checked');
  if oValor then sValor := RetornaValor(wbPag1, 'rbmotivoC','value');
  oValor := RetornaValor(wbPag1, 'rbmotivoT','checked');
  if oValor then  sValor := RetornaValor(wbPag1, 'rbmotivoT','value');
  oValor := RetornaValor(wbPag1, 'rbmotivoD','checked');
  if oValor then sValor := RetornaValor(wbPag1, 'rbmotivoD','value');
  oValor := RetornaValor(wbPag1, 'rbmotivoR','checked');
  if oValor then  sValor := RetornaValor(wbPag1, 'rbmotivoR','value');
  oValor := RetornaValor(wbPag1, 'rbmotivoF','checked');
  if oValor then sValor := RetornaValor(wbPag1, 'rbmotivoF','value');
  oValor := RetornaValor(wbPag1, 'rbmotivoAS','checked');
  if oValor then  sValor := RetornaValor(wbPag1, 'rbmotivoAS','value');
  oValor := RetornaValor(wbPag1, 'rbmotivoAT','checked');
  if oValor then sValor := RetornaValor(wbPag1, 'rbmotivoAT','value');
  oValor := RetornaValor(wbPag1, 'rbmotivoO','checked');
  if oValor then  sValor := RetornaValor(wbPag1, 'rbmotivoO','value');
  dmGeral.TB_TRIAGEM_ENFERMAGEMFL_MOTIVO.AsString := sValor;

  sValor := RetornaValor(wbPag1, 'txmotivo', 'value');
  dmGeral.TB_TRIAGEM_ENFERMAGEMTX_OUTROS.AsString := sValor;

//Abandono
  sValor := RetornaValor(wbPag1, 'txdiagnostico', 'value');
  dmGeral.TB_TRIAGEM_ENFERMAGEMTX_TEMPO.AsString := sValor;

  sValor := '';
  oValor := RetornaValor(wbPag1, 'rbusoarvN','checked');
  if oValor then sValor := RetornaValor(wbPag1, 'rbusoarvN','value');
  oValor := RetornaValor(wbPag1, 'rbusoarvS','checked');
  if oValor then  sValor := RetornaValor(wbPag1, 'rbusoarvS','value');
  dmGeral.TB_TRIAGEM_ENFERMAGEMFL_USO_ARV.AsString := sValor;

//Gestante
  sValor := '';
  oValor := RetornaValor(wbPag1, 'rbgestanteN','checked');
  if oValor then sValor := RetornaValor(wbPag1, 'rbgestanteN','value');
  oValor := RetornaValor(wbPag1, 'rbgestanteS','checked');
  if oValor then  sValor := RetornaValor(wbPag1, 'rbgestanteS','value');
  dmGeral.TB_TRIAGEM_ENFERMAGEMFL_GESTANTE.AsString := sValor;

//Sinais Vitais
  for i := 1 to 7 do
  begin
    sValor := '';
    sValor := RetornaValor(wbPag1, 'txVit'+intTostr(i), 'value');
    dmGeral.TB_TRIAGEM_ENFERMAGEM.FieldByName('TX_SINAIS_VITAIS'+intTostr(i)).AsString := sValor;
  end;

  sValor := '';
  oValor := RetornaValor(wbPag1, 'rbperdaS','checked');
  if oValor then sValor := RetornaValor(wbPag1, 'rbperdaS','value');
  oValor := RetornaValor(wbPag1, 'rbperdaN','checked');
  if oValor then  sValor := RetornaValor(wbPag1, 'rbperdaN','value');
  dmGeral.TB_TRIAGEM_ENFERMAGEMFL_PERDA.AsString := sValor;

//Sinais e Sintomas
  for i := 1 to 16 do
  begin
    sValor := '';
    oValor := RetornaValor(wbPag1, 'ckSint'+intToStr(i),'checked');
    if oValor then sValor := 'S' else sValor := 'N';
    dmGeral.TB_TRIAGEM_ENFERMAGEM.FieldByName('FL_SINAIS_SINTOMAS'+intToStr(i)).AsString := sValor;
  end;

  sValor := RetornaValor(wbPag1, 'txanotacoes', 'value');
  dmGeral.TB_TRIAGEM_ENFERMAGEMTX_ANOTACOES.AsString := sValor;

  sValor := RetornaValor(wbPag1, 'txenfermeiro', 'value');
  dmGeral.TB_TRIAGEM_ENFERMAGEMNM_MEDICO.AsString := sValor;

  sValor := RetornaValor(wbPag1, 'txordenfa', 'value');
  dmGeral.TB_TRIAGEM_ENFERMAGEMNR_ORDEM.AsString := sValor;

  dmGeral.TB_TRIAGEM_ENFERMAGEM.Post;
end;

procedure TframFicha4.CarregaDados;
var
  sValor:string;
  i:integer;
begin

//Processo
  sValor := dmGeral.TB_TRIAGEM_ENFERMAGEMNR_PROCESSO.AsString;
  DefineValor(wbPag1, 'lbProcesso','innerHtml',sValor);

//Data
  sValor := DateTostr(trunc(dmGeral.TB_TRIAGEM_ENFERMAGEMDT_CADASTRO.AsDateTime));
  DefineValor(wbPag1, 'lbData','innerHtml',sValor);

//Nome
  sValor := dmGeral.TB_TRIAGEM_ENFERMAGEMNM_PACIENTE.AsString;
  DefineValor(wbPag1, 'lbNome','innerHtml',sValor);

//Nasc
  sValor := dmGeral.TB_TRIAGEM_ENFERMAGEMDT_NASCIMENTO.AsString;
  DefineValor(wbPag1, 'lbDtNasc','innerHtml',sValor);

//Idade
  sValor := dmGeral.TB_TRIAGEM_ENFERMAGEMIDADE.AsString;
  DefineValor(wbPag1, 'lbIdade','innerHtml',sValor);

//Sexo
  sValor := dmGeral.TB_TRIAGEM_ENFERMAGEMTP_SEXO.AsString;
  if sValor = 'M' then
    DefineValor(wbPag1, 'rbMasc','checked',true);
  if sValor = 'F' then
    DefineValor(wbPag1, 'rbFem','checked',true);

//Nome Mae
  sValor := dmGeral.TB_TRIAGEM_ENFERMAGEMNM_MAE.AsString;
  DefineValor(wbPag1, 'lbNmMae','innerHtml',sValor);

//Municipio
  sValor := dmGeral.TB_TRIAGEM_ENFERMAGEMDS_MUNICIPIO.AsString;
  DefineValor(wbPag1, 'lbMunicipio','innerHtml',sValor);

//Provincia
  sValor := dmGeral.TB_TRIAGEM_ENFERMAGEMDS_PROVINCIA.AsString;
  DefineValor(wbPag1, 'lbProvincia','innerHtml',sValor);

//------------------------------------------------------------------------------
//Motivo
  sValor := dmGeral.TB_TRIAGEM_ENFERMAGEMFL_MOTIVO.AsString;
  if sValor = 'C' then
    DefineValor(wbPag1, 'rbmotivoC','checked',true);
  if sValor = 'T' then
    DefineValor(wbPag1, 'rbmotivoT','checked',true);
  if sValor = 'D' then
    DefineValor(wbPag1, 'rbmotivoD','checked',true);
  if sValor = 'R' then
    DefineValor(wbPag1, 'rbmotivoR','checked',true);
  if sValor = 'F' then
    DefineValor(wbPag1, 'rbmotivoF','checked',true);
  if sValor = 'AS' then
    DefineValor(wbPag1, 'rbmotivoAS','checked',true);
  if sValor = 'AT' then
    DefineValor(wbPag1, 'rbmotivoAT','checked',true);
  if sValor = 'O' then
    DefineValor(wbPag1, 'rbmotivoO','checked',true);

  sValor := dmGeral.TB_TRIAGEM_ENFERMAGEMTX_OUTROS.AsString;
  DefineValor(wbPag1, 'txmotivo', 'value', sValor);

//Abandono
  sValor := dmGeral.TB_TRIAGEM_ENFERMAGEMTX_TEMPO.AsString;
  DefineValor(wbPag1, 'txdiagnostico', 'value', sValor);

  sValor := dmGeral.TB_TRIAGEM_ENFERMAGEMFL_USO_ARV.AsString;
  if sValor = 'N' then
    DefineValor(wbPag1, 'rbusoarvN','checked',true);
  if sValor = 'S' then
    DefineValor(wbPag1, 'rbusoarvS','checked',true);

//Gestante
  sValor := dmGeral.TB_TRIAGEM_ENFERMAGEMFL_GESTANTE.AsString;
  if sValor = 'N' then
    DefineValor(wbPag1, 'rbgestanteN','checked',true);
  if sValor = 'S' then
    DefineValor(wbPag1, 'rbgestanteS','checked',true);

//Sinais Vitais
  for i := 1 to 7 do
  begin
    sValor := dmGeral.TB_TRIAGEM_ENFERMAGEM.FieldByName('TX_SINAIS_VITAIS'+intTostr(i)).AsString;
    DefineValor(wbPag1, 'txVit'+intTostr(i), 'value', sValor);
  end;

  sValor := dmGeral.TB_TRIAGEM_ENFERMAGEMFL_PERDA.AsString;
  if sValor = 'N' then
    DefineValor(wbPag1, 'rbperdaN','checked',true);
  if sValor = 'S' then
    DefineValor(wbPag1, 'rbperdaS','checked',true);

//Sinais e Sintomas
  for i := 1 to 16 do
  begin
    sValor := dmGeral.TB_TRIAGEM_ENFERMAGEM.FieldByName('FL_SINAIS_SINTOMAS'+intToStr(i)).AsString;
    if sValor = 'S' then
      DefineValor(wbPag1, 'ckSint'+intToStr(i),'checked', true)
    else
      DefineValor(wbPag1, 'ckSint'+intToStr(i),'checked', false);
  end;


  sValor := dmGeral.TB_TRIAGEM_ENFERMAGEMTX_ANOTACOES.AsString;
  DefineValor(wbPag1, 'txanotacoes', 'value', sValor);

  sValor := dmGeral.TB_TRIAGEM_ENFERMAGEMNM_MEDICO.AsString;
  DefineValor(wbPag1, 'txenfermeiro', 'value', sValor);

  sValor := dmGeral.TB_TRIAGEM_ENFERMAGEMNR_ORDEM.AsString;
  DefineValor(wbPag1, 'txordenfa', 'value', sValor);


end;

procedure TframFicha4.btSalvarClick(Sender: TObject);
begin
  SalvarDados;
  btNovo.Enabled := true;
  btEditar.Enabled := true;
  btCancelEdit.Enabled := false;
  btSalvar.Enabled := false;
  btAnterior.Enabled := true;
  btProximo.Enabled := true;
end;

procedure TframFicha4.btEditarClick(Sender: TObject);
begin
  dmGeral.TB_TRIAGEM_ENFERMAGEM.Edit;
  AtualizarDados;
  btNovo.Enabled := false;
  btEditar.Enabled := false;
  btCancelEdit.Enabled := false;
  btSalvar.Enabled := true;
  btAnterior.Enabled := false;
  btProximo.Enabled := false;

end;

procedure TframFicha4.btConfImpClick(Sender: TObject);
var wb:TWebBrowser; vIn, vOut:OleVariant;
begin
  case pgFicha.ActivePageIndex of
    0: wb := wbPag1;
  end;

  wb.ControlInterface.ExecWB(OLECMDID_PAGESETUP,
      OLECMDEXECOPT_PROMPTUSER, vIn, vOut);
end;

procedure TframFicha4.btImprimirClick(Sender: TObject);
var wb:TWebBrowser; vIn, vOut:OleVariant;
begin
  case pgFicha.ActivePageIndex of
    0: wb := wbPag1;
  end;

  wb.ControlInterface.ExecWB(OLECMDID_PRINT,
      OLECMDEXECOPT_DONTPROMPTUSER, vIn, vOut);
end;

procedure TframFicha4.btPreviewClick(Sender: TObject);
var wb:TWebBrowser; vIn, vOut:OleVariant;
begin
  case pgFicha.ActivePageIndex of
    0: wb := wbPag1;
  end;

  wb.ControlInterface.ExecWB(OLECMDID_PRINTPREVIEW,
      OLECMDEXECOPT_PROMPTUSER, vIn, vOut);
end;

procedure TframFicha4.CarregaDadosCabecalho;
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
//Motivo
  DefineValor(wbPag1, 'rbmotivoC','checked',false);
  DefineValor(wbPag1, 'rbmotivoT','checked',false);
  DefineValor(wbPag1, 'rbmotivoD','checked',false);
  DefineValor(wbPag1, 'rbmotivoR','checked',false);
  DefineValor(wbPag1, 'rbmotivoF','checked',false);
  DefineValor(wbPag1, 'rbmotivoAS','checked',false);
  DefineValor(wbPag1, 'rbmotivoAT','checked',false);
  DefineValor(wbPag1, 'rbmotivoO','checked',false);

  DefineValor(wbPag1, 'txmotivo', 'value', '');

//Abandono
  DefineValor(wbPag1, 'txdiagnostico', 'value', '');

  DefineValor(wbPag1, 'rbusoarvN','checked',false);
  DefineValor(wbPag1, 'rbusoarvS','checked',false);

//Gestante
  DefineValor(wbPag1, 'rbgestanteN','checked',false);
  DefineValor(wbPag1, 'rbgestanteS','checked',false);

//Sinais Vitais
  for i := 1 to 7 do
  begin
    DefineValor(wbPag1, 'txVit'+intTostr(i), 'value', '');
  end;

  DefineValor(wbPag1, 'rbperdaN','checked',false);
  DefineValor(wbPag1, 'rbperdaS','checked',false);

//Sinais e Sintomas
  for i := 1 to 16 do
  begin
    DefineValor(wbPag1, 'ckSint'+intToStr(i),'checked', false);
  end;

  DefineValor(wbPag1, 'txanotacoes', 'value', '');

  DefineValor(wbPag1, 'txenfermeiro', 'value', '');

  DefineValor(wbPag1, 'txordenfa', 'value', '');
end;

procedure TframFicha4.btAnteriorClick(Sender: TObject);
begin
  dmGeral.TB_TRIAGEM_ENFERMAGEM.Prior;
  CarregaDados;

end;

procedure TframFicha4.btProximoClick(Sender: TObject);
begin
  dmGeral.TB_TRIAGEM_ENFERMAGEM.Next;
  CarregaDados;

end;

procedure TframFicha4.btNovoClick(Sender: TObject);
begin
  dmGeral.TB_TRIAGEM_ENFERMAGEM.Insert;
  btNovo.Enabled := false;
  btEditar.Enabled := false;
  btCancelEdit.Enabled := false;
  btSalvar.Enabled := true;
  btAnterior.Enabled := false;
  btProximo.Enabled := false;

end;

procedure TframFicha4.AtualizarDados;
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

end;

end.
