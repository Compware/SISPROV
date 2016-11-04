unit uFrameFicha5;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, OleCtrls, SHDocVw, ExtCtrls, ComCtrls, Buttons, DB,  Httpapp, MSHTML,
  Printers;

type
  TframFicha5 = class(TFrame)
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

procedure TframFicha5.AbreConsulta;
begin
  dmGeral.TB_MAMOGRAFIA.Close;
  dmGeral.TB_MAMOGRAFIA.ParamByName('CD_PACIENTE').AsInteger :=
     dmGeral.TB_PACIENTECD_PACIENTE.AsInteger;
  dmGeral.TB_MAMOGRAFIA.Open;
  dmGeral.TB_MAMOGRAFIA.Last;
  if dmGeral.TB_MAMOGRAFIA.IsEmpty then
    CarregaDadosCabecalho
  else
    CarregaDados;
end;

procedure TframFicha5.AbrePaginas;
var sUrl :string;
begin
  sUrl := sPathConsulta + 'Mamografia.html';
  wbPag1.Navigate(sUrl);
  sUrl := sPathConsulta + 'Mamografia2.html';
  wbPag2.Navigate(sUrl);
end;

function TframFicha5.GetElementById(const Doc: IDispatch; const Id: string): IDispatch;
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

function TframFicha5.GetElementByName(const Doc: IDispatch; const Name: string): IDispatch;
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

function TframFicha5.RetornaValor(wb:TWebBrowser; id,att:string):OleVariant;
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

procedure  TframFicha5.DefineValor(wb:TWebBrowser; id,att:string; oValor:OleVariant);
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

procedure TframFicha5.SalvarDados;
var
  oValor:OleVariant;
  sValor:string;
  i:integer;
begin
  dmGeral.TB_MAMOGRAFIA.Edit;

  dmGeral.TB_MAMOGRAFIACD_PACIENTE.AsInteger :=
      dmGeral.TB_PACIENTECD_PACIENTE.AsInteger;

//Data
  sValor := RetornaValor(wbPag1, 'lbData','innerHtml');
  dmGeral.TB_MAMOGRAFIADT_CADASTRO.AsString := sValor;

//Densidades mamárias simétricas
  oValor := RetornaValor(wbPag1, 'Csimetricasim','checked');
  if oValor then sValor := RetornaValor(wbPag1, 'Csimetricasim','value');
  oValor := RetornaValor(wbPag1, 'Csimetricanao','checked');
  if oValor then  sValor := RetornaValor(wbPag1, 'Csimetricanao','value');
  dmGeral.TB_MAMOGRAFIAFL_DENSMAMARIA.AsString := sValor;

//Checkbox 1 ao 72

  for i := 1 to 72 do
  begin
    sValor := '';
    oValor := RetornaValor(wbPag1, 'check'+intToStr(i),'checked');
    if oValor then sValor := 'S' else sValor := 'N';
    dmGeral.TB_MAMOGRAFIA.FieldByName('FL_CHECK'+intToStr(i)).AsString := sValor;
  end;

//Mama direita NÓDULOS
  oValor := RetornaValor(wbPag1, 'Cnodulossim','checked');
  if oValor then sValor := RetornaValor(wbPag1, 'Cnodulossim','value');
  oValor := RetornaValor(wbPag1, 'Cnodulosnao','checked');
  if oValor then  sValor := RetornaValor(wbPag1, 'Cnodulosnao','value');
  dmGeral.TB_MAMOGRAFIAFL_NODULOS_D.AsString := sValor;

  sValor := RetornaValor(wbPag1, 'txtamanho','value');
  dmGeral.TB_MAMOGRAFIATX_NODTAMANHO_D.AsString := sValor;

  sValor := RetornaValor(wbPag1, 'txtinfoorla','value');
  dmGeral.TB_MAMOGRAFIATX_NODPROJEC_D.AsString := sValor;

  oValor := RetornaValor(wbPag1, 'Corlagordsim','checked');
  if oValor then sValor := RetornaValor(wbPag1, 'Corlagordsim','value');
  oValor := RetornaValor(wbPag1, 'Corlagordnao','checked');
  if oValor then  sValor := RetornaValor(wbPag1, 'Corlagordnao','value');
  dmGeral.TB_MAMOGRAFIAFL_ORLAGORD_D.AsString := sValor;

//Mama direita PECTORAL
  oValor := RetornaValor(wbPag1, 'Clinfonodulossim','checked');
  if oValor then sValor := RetornaValor(wbPag1, 'Clinfonodulossim','value');
  oValor := RetornaValor(wbPag1, 'Clinfonodulosnao','checked');
  if oValor then  sValor := RetornaValor(wbPag1, 'Clinfonodulosnao','value');
  dmGeral.TB_MAMOGRAFIAFL_PECTLINF_D.AsString := sValor;

//Mama direita CALCIFICAÇÕES
  oValor := RetornaValor(wbPag1, 'Ccalcificsim','checked');
  if oValor then sValor := RetornaValor(wbPag1, 'Ccalcificsim','value');
  oValor := RetornaValor(wbPag1, 'Ccalcificnao','checked');
  if oValor then  sValor := RetornaValor(wbPag1, 'Ccalcificnao','value');
  dmGeral.TB_MAMOGRAFIAFL_CALCIFIC_D.AsString := sValor;

  sValor := RetornaValor(wbPag1, 'txtprojecaodo','value');
  dmGeral.TB_MAMOGRAFIATX_CALCIFICPROJEC_D.AsString := sValor;

//Mama esquerda NÓDULOS
  oValor := RetornaValor(wbPag1, 'Cnodulossim2','checked');
  if oValor then sValor := RetornaValor(wbPag1, 'Cnodulossim2','value');
  oValor := RetornaValor(wbPag1, 'Cnodulosnao2','checked');
  if oValor then  sValor := RetornaValor(wbPag1, 'Cnodulosnao2','value');
  dmGeral.TB_MAMOGRAFIAFL_NODULOS_E.AsString := sValor;

  sValor := RetornaValor(wbPag1, 'txtamanho2','value');
  dmGeral.TB_MAMOGRAFIATX_NODTAMANHO_E.AsString := sValor;

  sValor := RetornaValor(wbPag1, 'txtinfoorla2','value');
  dmGeral.TB_MAMOGRAFIATX_NODPROJEC_E.AsString := sValor;

  oValor := RetornaValor(wbPag1, 'Corlagordsim2','checked');
  if oValor then sValor := RetornaValor(wbPag1, 'Corlagordsim2','value');
  oValor := RetornaValor(wbPag1, 'Corlagordnao2','checked');
  if oValor then  sValor := RetornaValor(wbPag1, 'Corlagordnao2','value');
  dmGeral.TB_MAMOGRAFIAFL_ORLAGORD_E.AsString := sValor;

//Mama esquerda PECTORAL
  oValor := RetornaValor(wbPag1, 'Clinfonodulossim2','checked');
  if oValor then sValor := RetornaValor(wbPag1, 'Clinfonodulossim2','value');
  oValor := RetornaValor(wbPag1, 'Clinfonodulosnao2','checked');
  if oValor then  sValor := RetornaValor(wbPag1, 'Clinfonodulosnao2','value');
  dmGeral.TB_MAMOGRAFIAFL_PECTLINF_E.AsString := sValor;

//Mama esquerda CALCIFICAÇÕES
  oValor := RetornaValor(wbPag1, 'Ccalcificsim2','checked');
  if oValor then sValor := RetornaValor(wbPag1, 'Ccalcificsim2','value');
  oValor := RetornaValor(wbPag1, 'Ccalcificnao2','checked');
  if oValor then  sValor := RetornaValor(wbPag1, 'Ccalcificnao2','value');
  dmGeral.TB_MAMOGRAFIAFL_CALCIFIC_E.AsString := sValor;

  sValor := RetornaValor(wbPag1, 'txtprojecaodo2','value');
  dmGeral.TB_MAMOGRAFIATX_CALCIFICPROJEC_E.AsString := sValor;

//Conclusões
  sValor := RetornaValor(wbPag1, 'Ldtabirads','value');
  dmGeral.TB_MAMOGRAFIATX_DTA_BIRADS.AsString := sValor;

  sValor := RetornaValor(wbPag1, 'Ledabirads','value');
  dmGeral.TB_MAMOGRAFIATX_EDA_BIRADS.AsString := sValor;

//Outras Observações
  sValor := RetornaValor(wbPag1, 'TxtObs','value');
  dmGeral.TB_MAMOGRAFIATX_OBSERVACOES.AsString := sValor;

  dmGeral.TB_MAMOGRAFIA.Post;
end;

procedure TframFicha5.CarregaDados;
var
  sValor:string;
  i:integer;
begin

//Nome
  sValor := dmGeral.TB_MAMOGRAFIANM_PACIENTE.AsString;
  DefineValor(wbPag1, 'lbNome','innerHtml',sValor);

//Data
  sValor := DateTostr(trunc(dmGeral.TB_MAMOGRAFIADT_CADASTRO.AsDateTime));
  DefineValor(wbPag1, 'lbData','innerHtml',sValor);

//Idade
  sValor := dmGeral.TB_MAMOGRAFIAIDADE.AsString;
  DefineValor(wbPag1, 'lbIdade','innerHtml',sValor);

//Sexo
  sValor := dmGeral.TB_MAMOGRAFIATP_SEXO.AsString;
  if sValor = 'M' then
    DefineValor(wbPag1, 'rbMasc','checked',true);
  if sValor = 'F' then
    DefineValor(wbPag1, 'rbFem','checked',true);

//------------------------------------------------------------------------------

//Densidades mamárias simétricas
  sValor := dmGeral.TB_MAMOGRAFIAFL_DENSMAMARIA.AsString;
  if sValor = 'S' then
    DefineValor(wbPag1, 'Csimetricasim','checked',true);
  if sValor = 'N' then
    DefineValor(wbPag1, 'Csimetricanao','checked',true);

//Checkbox 1 ao 72
  for i := 1 to 72 do
  begin
    sValor := dmGeral.TB_MAMOGRAFIA.FieldByName('FL_CHECK'+intToStr(i)).AsString;
    if sValor = 'S' then
      DefineValor(wbPag1, 'check'+intToStr(i),'checked', true)
    else
      DefineValor(wbPag1, 'check'+intToStr(i),'checked', false);
  end;

//Mama direita NÓDULOS
  sValor := dmGeral.TB_MAMOGRAFIAFL_NODULOS_D.AsString;
  if sValor = 'S' then
    DefineValor(wbPag1, 'Cnodulossim','checked',true);
  if sValor = 'N' then
    DefineValor(wbPag1, 'Cnodulosnao','checked',true);

  sValor := dmGeral.TB_MAMOGRAFIATX_NODTAMANHO_D.AsString;
  DefineValor(wbPag1, 'txtamanho','value',sValor);

  sValor := dmGeral.TB_MAMOGRAFIATX_NODPROJEC_D.AsString;
  DefineValor(wbPag1, 'txtinfoorla','value',sValor);

  sValor := dmGeral.TB_MAMOGRAFIAFL_ORLAGORD_D.AsString;
  if sValor = 'S' then
    DefineValor(wbPag1, 'Corlagordsim','checked',true);
  if sValor = 'N' then
    DefineValor(wbPag1, 'Corlagordnao','checked',true);

//Mama direita PECTORAL
  sValor := dmGeral.TB_MAMOGRAFIAFL_PECTLINF_D.AsString;
  if sValor = 'S' then
    DefineValor(wbPag1, 'Clinfonodulossim','checked',true);
  if sValor = 'N' then
    DefineValor(wbPag1, 'Clinfonodulosnao','checked',true);

//Mama direita CALCIFICAÇÕES
  sValor := dmGeral.TB_MAMOGRAFIAFL_CALCIFIC_D.AsString;
  if sValor = 'N' then
    DefineValor(wbPag1, 'Ccalcificnao','checked',true);
  if sValor = 'S' then
    DefineValor(wbPag1, 'Ccalcificsim','checked',true);

  sValor := dmGeral.TB_MAMOGRAFIATX_CALCIFICPROJEC_D.AsString;
  DefineValor(wbPag1, 'txtprojecaodo','value',sValor);

//Mama esquerda NÓDULOS
  sValor := dmGeral.TB_MAMOGRAFIAFL_NODULOS_E.AsString;
  if sValor = 'S' then
    DefineValor(wbPag1, 'Cnodulossim2','checked',true);
  if sValor = 'N' then
    DefineValor(wbPag1, 'Cnodulosnao2','checked',true);

  sValor := dmGeral.TB_MAMOGRAFIATX_NODTAMANHO_E.AsString;
  DefineValor(wbPag1, 'txtamanho2','value',sValor);

  sValor := dmGeral.TB_MAMOGRAFIATX_NODPROJEC_E.AsString;
  DefineValor(wbPag1, 'txtinfoorla2','value',sValor);

  sValor := dmGeral.TB_MAMOGRAFIAFL_ORLAGORD_E.AsString;
  if sValor = 'S' then
    DefineValor(wbPag1, 'Corlagordsim2','checked',true);
  if sValor = 'N' then
    DefineValor(wbPag1, 'Corlagordnao2','checked',true);

//Mama esquerda PECTORAL
  sValor := dmGeral.TB_MAMOGRAFIAFL_PECTLINF_E.AsString;
  if sValor = 'S' then
    DefineValor(wbPag1, 'Clinfonodulossim2','checked',true);
  if sValor = 'N' then
    DefineValor(wbPag1, 'Clinfonodulosnao2','checked',true);

//Mama esquerda CALCIFICAÇÕES
  sValor := dmGeral.TB_MAMOGRAFIAFL_CALCIFIC_E.AsString;
  if sValor = 'N' then
    DefineValor(wbPag1, 'Ccalcificnao2','checked',true);
  if sValor = 'S' then
    DefineValor(wbPag1, 'Ccalcificsim2','checked',true);

  sValor := dmGeral.TB_MAMOGRAFIATX_CALCIFICPROJEC_E.AsString;
  DefineValor(wbPag1, 'txtprojecaodo2','innerHtml',sValor);

//Conclusões
  sValor := dmGeral.TB_MAMOGRAFIATX_DTA_BIRADS.AsString;
  DefineValor(wbPag1, 'Ldtabirads','value',sValor);

  sValor := dmGeral.TB_MAMOGRAFIATX_EDA_BIRADS.AsString;
  DefineValor(wbPag1, 'Ledabirads','value',sValor);

//Outras Observações
  sValor := dmGeral.TB_MAMOGRAFIATX_OBSERVACOES.AsString;
  DefineValor(wbPag2, 'TxtObs','value',sValor);

end;

procedure TframFicha5.btSalvarClick(Sender: TObject);
begin
  SalvarDados;
  btNovo.Enabled := true;
  btEditar.Enabled := true;
  btCancelEdit.Enabled := false;
  btSalvar.Enabled := false;
  btAnterior.Enabled := true;
  btProximo.Enabled := true;
end;

procedure TframFicha5.btEditarClick(Sender: TObject);
begin
  dmGeral.TB_MAMOGRAFIA.Edit;
  AtualizarDados;
  btNovo.Enabled := false;
  btEditar.Enabled := false;
  btCancelEdit.Enabled := false;
  btSalvar.Enabled := true;
  btAnterior.Enabled := false;
  btProximo.Enabled := false;
end;

procedure TframFicha5.btConfImpClick(Sender: TObject);
var wb:TWebBrowser; vIn, vOut:OleVariant;
begin
  case pgFicha.ActivePageIndex of
    0: wb := wbPag1;
    1: wb := wbPag2;
  end;

  wb.ControlInterface.ExecWB(OLECMDID_PAGESETUP,
      OLECMDEXECOPT_PROMPTUSER, vIn, vOut);
end;

procedure TframFicha5.btImprimirClick(Sender: TObject);
var wb:TWebBrowser; vIn, vOut:OleVariant;
begin
  case pgFicha.ActivePageIndex of
    0: wb := wbPag1;
    1: wb := wbPag2;
  end;

  wb.ControlInterface.ExecWB(OLECMDID_PRINT,
      OLECMDEXECOPT_DONTPROMPTUSER, vIn, vOut);
end;

procedure TframFicha5.btPreviewClick(Sender: TObject);
var wb:TWebBrowser; vIn, vOut:OleVariant;
begin
  case pgFicha.ActivePageIndex of
    0: wb := wbPag1;
    1: wb := wbPag2;
  end;

  wb.ControlInterface.ExecWB(OLECMDID_PRINTPREVIEW,
      OLECMDEXECOPT_PROMPTUSER, vIn, vOut);
end;

procedure TframFicha5.CarregaDadosCabecalho;
var
  sValor:string;
  i:integer;
begin

//Nome
  sValor := dmGeral.TB_PACIENTENM_PACIENTE.AsString;
  DefineValor(wbPag1, 'lbNome','innerHtml',sValor);

//Data
  sValor := DateToStr(DM.GetDate);
  DefineValor(wbPag1, 'lbData','innerHtml',sValor);

//Idade
  sValor := dmGeral.TB_PACIENTEIDADE.AsString;
  DefineValor(wbPag1, 'lbIdade','innerHtml',sValor);

//Sexo
  sValor := dmGeral.TB_PACIENTETP_SEXO.AsString;
  if sValor = 'M' then
    DefineValor(wbPag1, 'rbMasc','checked',true);
  if sValor = 'F' then
    DefineValor(wbPag1, 'rbFem','checked',true);

//------------------------------------------------------------------------------

//Densidades mamárias simétricas
  DefineValor(wbPag1, 'Csimetricasim','checked',false);
  DefineValor(wbPag1, 'Csimetricanao','checked',false);

//Checkbox 1 ao 72
  for i := 1 to 72 do
  begin
      DefineValor(wbPag1, 'check'+intToStr(i),'checked', false);
  end;

//Mama direita NÓDULOS
  DefineValor(wbPag1, 'Cnodulossim','checked',false);
  DefineValor(wbPag1, 'Cnodulosnao','checked',false);

  DefineValor(wbPag1, 'txtamanho','value','');

  DefineValor(wbPag1, 'txtinfoorla','value','');

  DefineValor(wbPag1, 'Corlagordsim','checked',false);
  DefineValor(wbPag1, 'Corlagordnao','checked',false);

//Mama direita PECTORAL
  DefineValor(wbPag1, 'Clinfonodulossim','checked',false);
  DefineValor(wbPag1, 'Clinfonodulosnao','checked',false);

//Mama direita CALCIFICAÇÕES
  DefineValor(wbPag1, 'Ccalcificnao','checked',false);
  DefineValor(wbPag1, 'Ccalcificsim','checked',false);

  DefineValor(wbPag1, 'txtprojecaodo','value','');

//Mama esquerda NÓDULOS
  DefineValor(wbPag1, 'Cnodulossim2','checked',false);
  DefineValor(wbPag1, 'Cnodulosnao2','checked',false);

  DefineValor(wbPag1, 'txtamanho2','value','');

  DefineValor(wbPag1, 'txtinfoorla2','value','');

  DefineValor(wbPag1, 'Corlagordsim2','checked',false);
  DefineValor(wbPag1, 'Corlagordnao2','checked',false);

//Mama esquerda PECTORAL
  DefineValor(wbPag1, 'Clinfonodulossim2','checked',false);
  DefineValor(wbPag1, 'Clinfonodulosnao2','checked',false);

//Mama esquerda CALCIFICAÇÕES
  DefineValor(wbPag1, 'Ccalcificnao2','checked',false);
  DefineValor(wbPag1, 'Ccalcificsim2','checked',false);

  DefineValor(wbPag1, 'txtprojecaodo2','innerHtml','');

//Conclusões
  DefineValor(wbPag1, 'Ldtabirads','value','');

  DefineValor(wbPag1, 'Ledabirads','value','');

//Outras Observações
  DefineValor(wbPag2, 'TxtObs','value','');

end;

procedure TframFicha5.btAnteriorClick(Sender: TObject);
begin
  dmGeral.TB_MAMOGRAFIA.Prior;
  CarregaDados;

end;

procedure TframFicha5.btProximoClick(Sender: TObject);
begin
  dmGeral.TB_MAMOGRAFIA.Next;
  CarregaDados;
end;

procedure TframFicha5.btNovoClick(Sender: TObject);
begin
  dmGeral.TB_MAMOGRAFIA.Insert;
  btNovo.Enabled := false;
  btEditar.Enabled := false;
  btCancelEdit.Enabled := false;
  btSalvar.Enabled := true;
  btAnterior.Enabled := false;
  btProximo.Enabled := false;
end;

procedure TframFicha5.AtualizarDados;
var
  sValor:string;
  i:integer;
begin

//Nome
  sValor := dmGeral.TB_PACIENTENM_PACIENTE.AsString;
  DefineValor(wbPag1, 'lbNome','innerHtml',sValor);

//Data
  sValor := DateToStr(DM.GetDate);
  DefineValor(wbPag1, 'lbData','innerHtml',sValor);

//Idade
  sValor := dmGeral.TB_PACIENTEIDADE.AsString;
  DefineValor(wbPag1, 'lbIdade','innerHtml',sValor);

//Sexo
  sValor := dmGeral.TB_PACIENTETP_SEXO.AsString;
  if sValor = 'M' then
    DefineValor(wbPag1, 'rbMasc','checked',true);
  if sValor = 'F' then
    DefineValor(wbPag1, 'rbFem','checked',true);

end;

end.
