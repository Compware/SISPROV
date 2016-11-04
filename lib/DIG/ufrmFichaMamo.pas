unit ufrmFichaMamo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, OleCtrls, SHDocVw, ExtCtrls, ComCtrls, Buttons, DB,  Httpapp, MSHTML,
  Printers;

type
  TFrmFichaMAMO = class(TFrame)
    pnToolBar: TPanel;
    btNovo: TSpeedButton;
    btEditar: TSpeedButton;
    btCancelEdit: TSpeedButton;
    btSalvar: TSpeedButton;
    btAnterior: TSpeedButton;
    btProximo: TSpeedButton;
    btConfImp: TSpeedButton;
    btPreview: TSpeedButton;
    btImp: TSpeedButton;
    pgFicha: TPageControl;
    wbPag1: TWebBrowser;
    TabPag1: TTabSheet;
    tabpag2: TTabSheet;
    wbpag2: TWebBrowser;
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
    function  GetElementById(const Doc: IDispatch; const Id: string): IDispatch;
    function  GetElementByName(const Doc: IDispatch; const Name: string): IDispatch;
    function  RetornaValor(wb:TWebBrowser; id,att:string):OleVariant;
    procedure DefineValor(wb:TWebBrowser; id,att:string; oValor:OleVariant);
  end;

implementation
uses UGeral, UDMGERAL, UDM;

{$R *.dfm}
{ TframFicha1 }

 procedure TFrmFichaMAMO.AbreConsulta;
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

procedure TfrmFichaMamo.AbrePaginas;
var sUrl :string;
begin
  sUrl := sPathConsulta + 'Mamografia.html';
  wbPag1.Navigate(sUrl);
  sUrl := sPathConsulta + 'Mamografia2.html';
  wbPag2.Navigate(sUrl);
end;

function TfrmFichaMamo.GetElementById(const Doc: IDispatch; const Id: string): IDispatch;
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

function TfrmFichaMamo.GetElementByName(const Doc: IDispatch; const Name: string): IDispatch;
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

procedure TFrmFichaMamo.CarregaDadosCabecalho;
var
  sValor:string;
  i:integer;
begin

//Processo
  //sValor := dmGeral.TB_MAMOGRAFIANR_PROCESSO.AsString;
  //DefineValor(WBfichaMamo, 'lbProcesso','innerHtml',sValor);

//Nome
  sValor := dmGeral.TB_PACIENTENM_PACIENTE.AsString;
  DefineValor(wbPag1, 'Tnome','value',sValor);

//Idade
  sValor := dmGeral.TB_PACIENTEIDADE.AsString;
  DefineValor(wbPag1, 'Nidade','value',sValor);

//Sexo
  sValor := dmGeral.TB_PACIENTETP_SEXO.AsString;
  if sValor = 'M' then
    DefineValor(wbPag1, 'Csexom','checked',true);
  if sValor = 'F' then
    DefineValor(wbPag1, 'Csexof','checked',true);

//Data
  //sValor := '  /  /    ';
  //sValor := dmGeral.TB_MAMOGRAFIADT_CADASTRO.AsString;
  //DefineValor(wbPag1, 'txdtinicio','innerHtml',sValor);


//Nasc
  //sValor := dmGeral.TB_MAMOGRAFIADT_NASCIMENTO.AsString;
  //DefineValor(wbPag1, 'lbDtNasc','innerHtml',sValor);


//Nome Mae
  //sValor := dmGeral.TB_PMAMOGRAFIANM_MAE.AsString;
  //DefineValor(wbPag1, 'lbNmMae','innerHtml',sValor);

//Municipio
  //sValor := dmGeral.TB_MAMOGRAFIADS_MUNICIPIO.AsString;
  //DefineValor(wbPag1, 'lbMunicipio','innerHtml',sValor);

//Provincia
  //sValor := dmGeral.TB_MAMOGRAFIADS_PROVINCIA.AsString;
  //DefineValor(wbPag1, 'lbProvincia','innerHtml',sValor);


end;

procedure TfrmFichaMamo.CarregaDados;
var
  sValor:string;
  i:integer;
begin

//Processo
  //sValor := dmGeral.TB_MAMOGRAFIANR_PROCESSO.AsString;
  //DefineValor(wbPag1, 'lbProcesso','innerHtml',sValor);

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
  DefineValor(wbPag1, 'txtamanho','innerHtml',sValor);

  sValor := dmGeral.TB_MAMOGRAFIATX_NODPROJEC_D.AsString;
  DefineValor(wbPag1, 'txtinfoorla','innerHtml',sValor);

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
  DefineValor(wbPag1, 'txtprojecaodo','innerHtml',sValor);

  //Mama esquerda NÓDULOS

  sValor := dmGeral.TB_MAMOGRAFIAFL_NODULOS_E.AsString;
  if sValor = 'S' then
    DefineValor(wbPag1, 'Cnodulossim2','checked',true);
  if sValor = 'N' then
    DefineValor(wbPag1, 'Cnodulosnao2','checked',true);

  sValor := dmGeral.TB_MAMOGRAFIATX_NODTAMANHO_E.AsString;
  DefineValor(wbPag1, 'txtamanho2','innerHtml',sValor);

  sValor := dmGeral.TB_MAMOGRAFIATX_NODPROJEC_E.AsString;
  DefineValor(wbPag1, 'txtinfoorla2','innerHtml',sValor);

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
  DefineValor(wbPag1, 'Ldtabirads','innerHtml',sValor);

   sValor := dmGeral.TB_MAMOGRAFIATX_EDA_BIRADS.AsString;
  DefineValor(wbPag1, 'Ledabirads','innerHtml',sValor);

//Outras Observações

   sValor := dmGeral.TB_MAMOGRAFIATX_OBSERVACOES.AsString;
  DefineValor(wbPag1, 'TxtObs','innerHtml',sValor);

end;



function TfrmFichaMamo.RetornaValor(wb:TWebBrowser; id,att:string):OleVariant;
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

procedure  TfrmFichaMamo.DefineValor(wb:TWebBrowser; id,att:string; oValor:OleVariant);
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

procedure TfrmFichaMamo.SalvarDados;
var
  oValor:OleVariant;
  sValor:string;
  i:integer;
begin
  dmGeral.TB_MAMOGRAFIA.Edit;

  dmGeral.TB_MAMOGRAFIACD_PACIENTE.AsInteger :=
      dmGeral.TB_PACIENTECD_PACIENTE.AsInteger;

end;

   procedure TfrmFichaMamo.btSalvarClick(Sender: TObject);
begin
  SalvarDados;
  btNovo.Enabled := true;
  btEditar.Enabled := true;
  btCancelEdit.Enabled := false;
  btSalvar.Enabled := false;
  btAnterior.Enabled := true;
  btProximo.Enabled := true;
end;

procedure TfrmFichaMamo.btEditarClick(Sender: TObject);
begin
  dmGeral.TB_MAMOGRAFIA.Edit;
  btNovo.Enabled := false;
  btEditar.Enabled := false;
  btCancelEdit.Enabled := false;
  btSalvar.Enabled := true;
  btAnterior.Enabled := false;
  btProximo.Enabled := false;

end;

procedure TfrmFichaMamo.btConfImpClick(Sender: TObject);
var wb:TWebBrowser; vIn, vOut:OleVariant;
begin
  case pgFicha.ActivePageIndex of
    0: wb := wbPag1;
  end;

  wb.ControlInterface.ExecWB(OLECMDID_PAGESETUP,
      OLECMDEXECOPT_PROMPTUSER, vIn, vOut);
end;

procedure TfrmFichaMamo.btImprimirClick(Sender: TObject);
var wb:TWebBrowser; vIn, vOut:OleVariant;
begin
  case pgFicha.ActivePageIndex of
    0: wb := wbPag1;
  end;

  wb.ControlInterface.ExecWB(OLECMDID_PRINT,
      OLECMDEXECOPT_DONTPROMPTUSER, vIn, vOut);
end;

procedure TfrmFichaMamo.btPreviewClick(Sender: TObject);
var wb:TWebBrowser; vIn, vOut:OleVariant;
begin
  case pgFicha.ActivePageIndex of
    0: wb := wbPag1;
  end;

  wb.ControlInterface.ExecWB(OLECMDID_PRINTPREVIEW,
      OLECMDEXECOPT_PROMPTUSER, vIn, vOut);
end;

procedure TfrmFichaMamo.btAnteriorClick(Sender: TObject);
begin
  dmGeral.TB_MAMOGRAFIA.Prior;
  CarregaDados;

end;

procedure TfrmFichaMamo.btProximoClick(Sender: TObject);
begin
  dmGeral.TB_MAMOGRAFIA.Next;
  CarregaDados;

end;

procedure TfrmFichaMamo.btNovoClick(Sender: TObject);
begin
  dmGeral.TB_MAMOGRAFIA.Insert;
  btNovo.Enabled := false;
  btEditar.Enabled := false;
  btCancelEdit.Enabled := false;
  btSalvar.Enabled := true;
  btAnterior.Enabled := false;
  btProximo.Enabled := false;

end;

end.
