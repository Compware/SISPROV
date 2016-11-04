unit uFrameMAPA;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, OleCtrls, SHDocVw, ExtCtrls, ComCtrls, Buttons, DB,  Httpapp, MSHTML,
  Printers, Grids, DBGrids, StdCtrls, DBCtrls, IBCustomDataSet, IBQuery;

type
  TBrowserClick = class( TComponent, IUnknown, IDispatch)
  private
    { Private declarations }
    FOnClick : TNotifyEvent;
    nID:integer;
    FRefCount : integer;
    Owner : TObject;
    function QueryInterface( const IID : TGUID; out Obj) : Integer; stdcall;
    function _AddRef : Integer; stdcall;
    function _Release : Integer; stdcall;
    function Invoke( DispID : Integer; const IID : TGUID; LocaleID : Integer; Flags : Word; var Params; VarResult, ExcepInfo, ArgErr : Pointer) : HResult; stdcall;
  protected
    { Protected declarations }
  public
    { Public declarations }
    property OnClick : TNotifyEvent read FOnClick write FOnClick;
  published
    { Published declarations }
  end;

type
  TBrowserExit = class( TComponent, IUnknown, IDispatch)
  private
    { Private declarations }
    FOnExit : TNotifyEvent;
    nID:integer;
    FRefCount : integer;
    Owner : TObject;
    function QueryInterface( const IID : TGUID; out Obj) : Integer; stdcall;
    function _AddRef : Integer; stdcall;
    function _Release : Integer; stdcall;
    function Invoke( DispID : Integer; const IID : TGUID; LocaleID : Integer; Flags : Word; var Params; VarResult, ExcepInfo, ArgErr : Pointer) : HResult; stdcall;
  protected
    { Protected declarations }
  public
    { Public declarations }
    property OnExit : TNotifyEvent read FOnExit write FOnExit;
  published
    { Published declarations }
  end;

type
  TframMapaMedico = class(TFrame)
    pnToolBar: TPanel;
    pgMapa: TPageControl;
    tabPag1: TTabSheet;
    dsMapa: TDataSource;
    wbPag1: TWebBrowser;
    btEditar: TSpeedButton;
    btSalvar: TSpeedButton;
    btConfImp: TSpeedButton;
    btPreview: TSpeedButton;
    btImprimir: TSpeedButton;
    tabPag2: TTabSheet;
    wbPag2: TWebBrowser;
    btFiltrarMedicos: TSpeedButton;
    pnFiltroMedicoMapa: TPanel;
    Label7: TLabel;
    cbMedico: TDBLookupComboBox;
    btAtualizarMapa: TSpeedButton;
    dsMedicoMapa: TDataSource;
    qyMedicoMapa: TIBQuery;
    procedure btSalvarClick(Sender: TObject);
    procedure btEditarClick(Sender: TObject);
    procedure btConfImpClick(Sender: TObject);
    procedure btImprimirClick(Sender: TObject);
    procedure btPreviewClick(Sender: TObject);
    procedure btFiltrarMedicosClick(Sender: TObject);
    procedure btAtualizarMapaClick(Sender: TObject);
    procedure wbPag1DocumentComplete(Sender: TObject;
      const pDisp: IDispatch; var URL: OleVariant);
    procedure qyMedicoMapaBeforeOpen(DataSet: TDataSet);
  private
    { Private declarations }

  public
    { Public declarations }
    BClick : TBrowserClick;
    BExit : TBrowserExit;
    procedure CreateFrameMapa;
    procedure DestroyFrameMapa;
    procedure AbrePaginas;
    procedure AbreConsulta;
    procedure LimpaMapa;
    procedure AtualizaDados;
    procedure CarregaDados;
    procedure SalvarDados;
    function  GetElementById(const Doc: IDispatch; const Id: string): IDispatch;
    function  GetElementByName(const Doc: IDispatch; const Name: string): IDispatch;
    function  RetornaValor(wb:TWebBrowser; id,att:string):OleVariant;
    procedure DefineValor(wb:TWebBrowser; id,att:string; oValor:OleVariant);
    procedure SelecionarCID10Exit(Sender: TObject);
    procedure SelecionarCID10(Sender: TObject);
    procedure SelecionarEsquema(Sender: TObject);
    procedure LimparEsquema(Sender: TObject);
  end;

implementation

uses UGeral, UDMGERAL, UDM, ufrmProcessoUtente, uCadCID10, UfrmLocalizar,
  UGeralSQL;

{$R *.dfm}

{ TframFicha1 }

// TBrowserClick
function TBrowserClick.QueryInterface(const IID: TGUID; out Obj): HResult;
begin
  if GetInterface(IID, Obj) then
    Result := S_OK
  else
    Result := E_NOINTERFACE;
end;

function TBrowserClick._AddRef: Integer;
begin
  Inc(FRefCount);
  Result := FRefCount;
end;

function TBrowserClick._Release: Integer;
begin
  Dec(FRefCount);
  Result := FRefCount;
end;

function TBrowserClick.Invoke( DispID: Integer; const IID: TGUID; LocaleID: Integer; Flags: Word; var Params; VarResult, ExcepInfo, ArgErr: Pointer): HResult;
begin
  if Assigned( OnClick) then OnClick( Self);
  Result := S_OK;
end;
/////////////////////////////////////////////////////////////////////////////

// TBrowserExit
function TBrowserExit.QueryInterface(const IID: TGUID; out Obj): HResult;
begin
  if GetInterface(IID, Obj) then
    Result := S_OK
  else
    Result := E_NOINTERFACE;
end;

function TBrowserExit._AddRef: Integer;
begin
  Inc(FRefCount);
  Result := FRefCount;
end;

function TBrowserExit._Release: Integer;
begin
  Dec(FRefCount);
  Result := FRefCount;
end;

function TBrowserExit.Invoke( DispID: Integer; const IID: TGUID; LocaleID: Integer; Flags: Word; var Params; VarResult, ExcepInfo, ArgErr: Pointer): HResult;
begin
  if Assigned( OnExit) then OnExit( Self);
  Result := S_OK;
end;
/////////////////////////////////////////////////////////////////////////////

procedure TframMapaMedico.AbreConsulta;
begin
  dmGeral.TB_MAPA.Close;
  if pnFiltroMedicoMapa.Visible = true then
  dmGeral.TB_MAPA.ParamByName('CD_MEDICO').AsInteger :=
     cbMedico.KeyValue
  else
  dmGeral.TB_MAPA.ParamByName('CD_MEDICO').AsInteger :=
     dm.qyLoginCD_MEDICO.AsInteger;

  dmGeral.TB_MAPA.ParamByName('DT_MAPA').AsDate := trunc(frmProcessoUtente.dtAgenda.Date);

  dmGeral.TB_MAPA.Open;
  dmGeral.TB_MAPA.First;

end;

procedure TframMapaMedico.AbrePaginas;
var sUrl :string;
begin
  sUrl := sPathConsulta + 'MapaMedico.html';
  wbPag1.Navigate(sUrl);
  sUrl := sPathConsulta + 'MapaMedico.html';
  wbPag2.Navigate(sUrl);
  
  pgMapa.ActivePageIndex := 0;
end;

function TframMapaMedico.GetElementById(const Doc: IDispatch; const Id: string): IDispatch;
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

function TframMapaMedico.GetElementByName(const Doc: IDispatch; const Name: string): IDispatch;
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

function TframMapaMedico.RetornaValor(wb:TWebBrowser; id,att:string):OleVariant;
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

procedure  TframMapaMedico.DefineValor(wb:TWebBrowser; id,att:string; oValor:OleVariant);
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

procedure TframMapaMedico.SalvarDados;
var
  oValor:OleVariant;
  sValor:string;
  iLinha1, iLinha2, i:integer;
begin

  dmGeral.TB_MAPA.First;
  iLinha1 := 1;
  iLinha2 := 0;

  while not DMGERAL.TB_MAPA.Eof do
  begin
    if iLinha1 <= 20 then
    begin
      dmGeral.TB_MAPA.Edit;
      //Tipo de consulta
        sValor := '';
        oValor := RetornaValor(wbPag1, 'rbtipoR'+intTostr(iLinha1),'checked');
        if oValor then sValor := RetornaValor(wbPag1, 'rbtipoR'+intTostr(iLinha1),'value');
        oValor := RetornaValor(wbPag1, 'rbtipoT'+intTostr(iLinha1),'checked');
        if oValor then  sValor := RetornaValor(wbPag1, 'rbtipoT'+intTostr(iLinha1),'value');
        dmGeral.TB_MAPATP_CONSULTA.AsString := sValor;

      //Peso
        sValor := RetornaValor(wbPag1, 'txpeso'+intTostr(iLinha1), 'value');
        dmGeral.TB_MAPADS_PESO.AsString := sValor;

      //Tipo Consulta 2
        sValor := '';
        oValor := RetornaValor(wbPag1, 'rbtpconsultaP'+intTostr(iLinha1),'checked');
        if oValor then sValor := RetornaValor(wbPag1, 'rbtpconsultaP'+intTostr(iLinha1),'value');
        oValor := RetornaValor(wbPag1, 'rbtpconsultaR'+intTostr(iLinha1),'checked');
        if oValor then  sValor := RetornaValor(wbPag1, 'rbtpconsultaR'+intTostr(iLinha1),'value');
        dmGeral.TB_MAPATP_CONSULTA2.AsString := sValor;

      //OMS
        sValor := RetornaValor(wbPag1, 'txoms'+intTostr(iLinha1), 'value');
        dmGeral.TB_MAPANR_ESTADIO_OMS.AsString := sValor;

      //CID10
        sValor := RetornaValor(wbPag1, 'edCD'+intTostr(iLinha1), 'value');
        dmGeral.TB_MAPACD_CID10.AsString := sValor;

      //CD4
        sValor := RetornaValor(wbPag1, 'txcd4'+intTostr(iLinha1), 'value');
        dmGeral.TB_MAPANR_CD4.AsString := sValor;

      //TB
        sValor := '';
        oValor := RetornaValor(wbPag1, 'ckTB'+intTostr(iLinha1), 'checked');
        if oValor then sValor := 'S' else sValor := 'N';
        dmGeral.TB_MAPAFL_TB.AsString := sValor;

      //N
        sValor := '';
        oValor := RetornaValor(wbPag1, 'ckN'+intTostr(iLinha1), 'checked');
        if oValor then sValor := 'S' else sValor := 'N';
        dmGeral.TB_MAPAFL_N.AsString := sValor;
      //I
        sValor := '';
        oValor := RetornaValor(wbPag1, 'ckI'+intTostr(iLinha1), 'checked');
        if oValor then sValor := 'S' else sValor := 'N';
        dmGeral.TB_MAPAFL_I.AsString := sValor;
      //T
        sValor := '';
        oValor := RetornaValor(wbPag1, 'ckT'+intTostr(iLinha1), 'checked');
        if oValor then sValor := 'S' else sValor := 'N';
        dmGeral.TB_MAPAFL_T.AsString := sValor;
      //M
        sValor := '';
        oValor := RetornaValor(wbPag1, 'ckM'+intTostr(iLinha1), 'checked');
        if oValor then sValor := 'S' else sValor := 'N';
        dmGeral.TB_MAPAFL_M.AsString := sValor;

      //ESQUEMA
        sValor := RetornaValor(wbPag1, 'txesquema'+intTostr(iLinha1), 'value');
        dmGeral.TB_MAPADS_ESQUEMA.AsString := sValor;

        dmGeral.TB_MAPA.Post;
        DMGERAL.TB_MAPA.Next;
        iLinha1 := iLinha1 + 1;
    end;

    if iLinha1 = 21 then
      iLinha2 := 1;

    if (iLinha2 > 0) and (iLinha2 < 21) then
    begin
      dmGeral.TB_MAPA.Edit;
      //Tipo de consulta
        sValor := '';
        oValor := RetornaValor(wbPag2, 'rbtipoR'+intTostr(iLinha2),'checked');
        if oValor then sValor := RetornaValor(wbPag2, 'rbtipoR'+intTostr(iLinha2),'value');
        oValor := RetornaValor(wbPag2, 'rbtipoT'+intTostr(iLinha2),'checked');
        if oValor then  sValor := RetornaValor(wbPag2, 'rbtipoT'+intTostr(iLinha2),'value');
        dmGeral.TB_MAPATP_CONSULTA.AsString := sValor;

      //Peso
        sValor := RetornaValor(wbPag2, 'txpeso'+intTostr(iLinha2), 'value');
        dmGeral.TB_MAPADS_PESO.AsString := sValor;

      //Tipo Consulta 2
        sValor := '';
        oValor := RetornaValor(wbPag2, 'rbtpconsultaP'+intTostr(iLinha2),'checked');
        if oValor then sValor := RetornaValor(wbPag2, 'rbtpconsultaP'+intTostr(iLinha2),'value');
        oValor := RetornaValor(wbPag2, 'rbtpconsultaR'+intTostr(iLinha2),'checked');
        if oValor then  sValor := RetornaValor(wbPag2, 'rbtpconsultaR'+intTostr(iLinha2),'value');
        dmGeral.TB_MAPATP_CONSULTA2.AsString := sValor;

      //OMS
        sValor := RetornaValor(wbPag2, 'txoms'+intTostr(iLinha2), 'value');
        dmGeral.TB_MAPANR_ESTADIO_OMS.AsString := sValor;

      //CID10
        sValor := RetornaValor(wbPag2, 'edSG'+intTostr(iLinha2), 'value');
        dmGeral.TB_MAPACD_CID10.AsString := sValor;

      //CD4
        sValor := RetornaValor(wbPag2, 'txcd4'+intTostr(iLinha2), 'value');
        dmGeral.TB_MAPANR_CD4.AsString := sValor;

      //TB
        sValor := '';
        oValor := RetornaValor(wbPag2, 'ckTB'+intTostr(iLinha2), 'checked');
        if oValor then sValor := 'S' else sValor := 'N';
        dmGeral.TB_MAPAFL_TB.AsString := sValor;

      //N
        sValor := '';
        oValor := RetornaValor(wbPag2, 'ckN'+intTostr(iLinha2), 'checked');
        if oValor then sValor := 'S' else sValor := 'N';
        dmGeral.TB_MAPAFL_N.AsString := sValor;
      //I
        sValor := '';
        oValor := RetornaValor(wbPag2, 'ckI'+intTostr(iLinha2), 'checked');
        if oValor then sValor := 'S' else sValor := 'N';
        dmGeral.TB_MAPAFL_I.AsString := sValor;
      //T
        sValor := '';
        oValor := RetornaValor(wbPag2, 'ckT'+intTostr(iLinha2), 'checked');
        if oValor then sValor := 'S' else sValor := 'N';
        dmGeral.TB_MAPAFL_T.AsString := sValor;
      //M
        sValor := '';
        oValor := RetornaValor(wbPag2, 'ckM'+intTostr(iLinha2), 'checked');
        if oValor then sValor := 'S' else sValor := 'N';
        dmGeral.TB_MAPAFL_M.AsString := sValor;

      //ESQUEMA
        sValor := RetornaValor(wbPag2, 'txesquema'+intTostr(iLinha2), 'value');
        dmGeral.TB_MAPADS_ESQUEMA.AsString := sValor;

        dmGeral.TB_MAPA.Post;
        DMGERAL.TB_MAPA.Next;
        iLinha2 := iLinha2 + 1;
    end;
  end;

end;

procedure TframMapaMedico.CarregaDados;
var
  sValor:string;
  iLinha1, iLinha2, i:integer;

  procedure CarregaCabecalho;
  begin
    if not DMGERAL.TB_MAPA.Eof then
    begin
      if iLinha1 = 1 then
      begin
        //Médico
          sValor := dmGeral.TB_MAPANM_MEDICO.AsString;
          DefineValor(wbPag1, 'lbmedico','innerHtml',sValor);

        //Tipo de consulta
          sValor := dmGeral.TB_MAPATP_CONSULTA.AsString;
          if sValor = 'R' then
            DefineValor(wbPag1, 'rbtipoR','checked',true);
          if sValor = 'T' then
            DefineValor(wbPag1, 'rbtipoT','checked',true);

        //Data Agenda
          sValor := DateTostr(trunc(dmGeral.TB_MAPADT_MAPA.AsDateTime));
          DefineValor(wbPag1, 'lbdtagenda','innerHtml',sValor);
      end;

      if iLinha2 = 1 then
      begin
        //Médico
          sValor := dmGeral.TB_MAPANM_MEDICO.AsString;
          DefineValor(wbPag2, 'lbmedico','innerHtml',sValor);

        //Tipo de consulta
          sValor := dmGeral.TB_MAPATP_CONSULTA.AsString;
          if sValor = 'R' then
            DefineValor(wbPag2, 'rbtipoR','checked',true);
          if sValor = 'T' then
            DefineValor(wbPag2, 'rbtipoT','checked',true);

        //Data Agenda
          sValor := DateTostr(trunc(dmGeral.TB_MAPADT_MAPA.AsDateTime));
          DefineValor(wbPag2, 'lbdtagenda','innerHtml',sValor);
      end;
    end;
  end;

begin
  AbreConsulta;
  iLinha1 := 1;
  iLinha2 := 0;

  while not DMGERAL.TB_MAPA.Eof do
  begin
    if iLinha1 <= 20 then
    begin
      CarregaCabecalho;
      //Linha
        sValor := IntToStr(iLinha1);
        DefineValor(wbPag1, 'lblinha'+intTostr(iLinha1),'innerHtml',sValor);

      //Processo
        sValor := dmGeral.TB_MAPANR_PROCESSO.AsString;
        DefineValor(wbPag1, 'lbproc'+intTostr(iLinha1),'innerHtml',sValor);

      //Provincia/Municipio
        sValor := dmGeral.TB_MAPADS_PROVINCIA.AsString + ' - ' + dmGeral.TB_MAPADS_MUNICIPIO.AsString;
        DefineValor(wbPag1, 'lbmuni'+intTostr(iLinha1),'innerHtml',sValor);

      //Paciente
        sValor := dmGeral.TB_MAPANM_PACIENTE.AsString;
        DefineValor(wbPag1, 'lbpaci'+intTostr(iLinha1),'innerHtml',sValor);

      //Sexo
        sValor := dmGeral.TB_MAPATP_SEXO.AsString;
        DefineValor(wbPag1, 'lbsexo'+intTostr(iLinha1),'innerHtml',sValor);

      //Idade
        sValor := dmGeral.TB_MAPAIDADE.AsString;
        DefineValor(wbPag1, 'lbidade'+intTostr(iLinha1),'innerHtml',sValor);

      //Peso
        sValor := dmGeral.TB_MAPADS_PESO.AsString;
        DefineValor(wbPag1, 'txpeso'+intTostr(iLinha1), 'value', sValor);

      //Tipo Consulta 2
        sValor := dmGeral.TB_MAPATP_CONSULTA2.AsString;
        if sValor = 'P' then
          DefineValor(wbPag1, 'rbtpconsultaP'+intTostr(iLinha1),'checked',true);
        if sValor = 'R' then
          DefineValor(wbPag1, 'rbtpconsultaR'+intTostr(iLinha1),'checked',true);

      //OMS
        sValor := dmGeral.TB_MAPANR_ESTADIO_OMS.AsString;
        DefineValor(wbPag1, 'txoms'+intTostr(iLinha1), 'value', sValor);

      //CID10
        sValor := dmGeral.TB_MAPACD_CID10.AsString;
        DefineValor(wbPag1, 'edCD'+intTostr(iLinha1), 'value', sValor);

        sValor := dmGeral.TB_MAPACD_SUBCAT.AsString;
        DefineValor(wbPag1, 'edSG'+intTostr(iLinha1), 'value', sValor);

      //CD4
        sValor := dmGeral.TB_MAPANR_CD4.AsString;
        DefineValor(wbPag1, 'txcd4'+intTostr(iLinha1), 'value', sValor);

      //TB
        sValor := dmGeral.TB_MAPAFL_TB.AsString;
        if sValor = 'S' then
          DefineValor(wbPag1, 'ckTB'+intTostr(iLinha1),'checked', true)
        else
          DefineValor(wbPag1, 'ckTB'+intTostr(iLinha1),'checked', false);

      //N
        sValor := dmGeral.TB_MAPAFL_N.AsString;
        if sValor = 'S' then
          DefineValor(wbPag1, 'ckN'+intTostr(iLinha1),'checked', true)
        else
          DefineValor(wbPag1, 'ckN'+intTostr(iLinha1),'checked', false);

      //I
        sValor := dmGeral.TB_MAPAFL_I.AsString;
        if sValor = 'S' then
          DefineValor(wbPag1, 'ckI'+intTostr(iLinha1),'checked', true)
        else
          DefineValor(wbPag1, 'ckI'+intTostr(iLinha1),'checked', false);


      //T
        sValor := dmGeral.TB_MAPAFL_T.AsString;
        if sValor = 'S' then
          DefineValor(wbPag1, 'ckT'+intTostr(iLinha1),'checked', true)
        else
          DefineValor(wbPag1, 'ckT'+intTostr(iLinha1),'checked', false);

      //M
        sValor := dmGeral.TB_MAPAFL_M.AsString;
        if sValor = 'S' then
          DefineValor(wbPag1, 'ckM'+intTostr(iLinha1),'checked', true)
        else
          DefineValor(wbPag1, 'ckM'+intTostr(iLinha1),'checked', false);

      //ESQUEMA
        sValor := dmGeral.TB_MAPADS_ESQUEMA.AsString;
        DefineValor(wbPag1, 'txesquema'+intTostr(iLinha1), 'value', sValor);

        iLinha1 := iLinha1 + 1;
        DMGERAL.TB_MAPA.Next;
    end;

    if iLinha1 = 21 then
      iLinha2 := 1;

    if (iLinha2 > 0) and (iLinha2 < 21) then
    begin
      CarregaCabecalho;
      //Linha
        sValor := IntToStr(iLinha1);
        DefineValor(wbPag2, 'lblinha'+intTostr(iLinha2),'innerHtml',sValor);

      //Processo
        sValor := dmGeral.TB_MAPANR_PROCESSO.AsString;
        DefineValor(wbPag2, 'lbproc'+intTostr(iLinha2),'innerHtml',sValor);

      //Provincia/Municipio
        sValor := dmGeral.TB_MAPADS_PROVINCIA.AsString + ' - ' + dmGeral.TB_MAPADS_MUNICIPIO.AsString;
        DefineValor(wbPag2, 'lbmuni'+intTostr(iLinha2),'innerHtml',sValor);

      //Paciente
        sValor := dmGeral.TB_MAPANM_PACIENTE.AsString;
        DefineValor(wbPag2, 'lbpaci'+intTostr(iLinha2),'innerHtml',sValor);

      //Sexo
        sValor := dmGeral.TB_MAPATP_SEXO.AsString;
        DefineValor(wbPag2, 'lbsexo'+intTostr(iLinha2),'innerHtml',sValor);

      //Idade
        sValor := dmGeral.TB_MAPAIDADE.AsString;
        DefineValor(wbPag2, 'lbidade'+intTostr(iLinha2),'innerHtml',sValor);

      //Peso
        sValor := dmGeral.TB_MAPADS_PESO.AsString;
        DefineValor(wbPag2, 'txpeso'+intTostr(iLinha2), 'value', sValor);

      //Tipo Consulta 2
        sValor := dmGeral.TB_MAPATP_CONSULTA2.AsString;
        if sValor = 'P' then
          DefineValor(wbPag2, 'rbtpconsultaP'+intTostr(iLinha2),'checked',true);
        if sValor = 'R' then
          DefineValor(wbPag2, 'rbtpconsultaR'+intTostr(iLinha2),'checked',true);

      //OMS
        sValor := dmGeral.TB_MAPANR_ESTADIO_OMS.AsString;
        DefineValor(wbPag2, 'txoms'+intTostr(iLinha2), 'value', sValor);

      //CID10
        sValor := dmGeral.TB_MAPACD_CID10.AsString;
        DefineValor(wbPag2, 'edCD'+intTostr(iLinha2), 'value', sValor);

        sValor := dmGeral.TB_MAPACD_SUBCAT.AsString;
        DefineValor(wbPag2, 'edSG'+intTostr(iLinha2), 'value', sValor);

      //CD4
        sValor := dmGeral.TB_MAPANR_CD4.AsString;
        DefineValor(wbPag2, 'txcd4'+intTostr(iLinha2), 'value', sValor);

      //TB
        sValor := dmGeral.TB_MAPAFL_TB.AsString;
        if sValor = 'S' then
          DefineValor(wbPag2, 'ckTB'+intTostr(iLinha2),'checked', true)
        else
          DefineValor(wbPag2, 'ckTB'+intTostr(iLinha2),'checked', false);

      //N
        sValor := dmGeral.TB_MAPAFL_N.AsString;
        if sValor = 'S' then
          DefineValor(wbPag2, 'ckN'+intTostr(iLinha2),'checked', true)
        else
          DefineValor(wbPag2, 'ckN'+intTostr(iLinha2),'checked', false);

      //I
        sValor := dmGeral.TB_MAPAFL_I.AsString;
        if sValor = 'S' then
          DefineValor(wbPag2, 'ckI'+intTostr(iLinha2),'checked', true)
        else
          DefineValor(wbPag2, 'ckI'+intTostr(iLinha2),'checked', false);


      //T
        sValor := dmGeral.TB_MAPAFL_T.AsString;
        if sValor = 'S' then
          DefineValor(wbPag2, 'ckT'+intTostr(iLinha2),'checked', true)
        else
          DefineValor(wbPag2, 'ckT'+intTostr(iLinha2),'checked', false);

      //M
        sValor := dmGeral.TB_MAPAFL_M.AsString;
        if sValor = 'S' then
          DefineValor(wbPag2, 'ckM'+intTostr(iLinha2),'checked', true)
        else
          DefineValor(wbPag2, 'ckM'+intTostr(iLinha2),'checked', false);

      //ESQUEMA
        sValor := dmGeral.TB_MAPADS_ESQUEMA.AsString;
        DefineValor(wbPag2, 'txesquema'+intTostr(iLinha2), 'value', sValor);

      iLinha1 := iLinha1 + 1;
      iLinha2 := iLinha2 + 1;
      DMGERAL.TB_MAPA.Next;
    end;
  end;

end;

procedure TframMapaMedico.LimpaMapa;
var
  sValor:string;
  iLinha1, iLinha2, i:integer;

  procedure CarregaCabecalho;
  begin
      if iLinha1 = 1 then
      begin
        //Médico
          DefineValor(wbPag1, 'lbmedico','innerHtml','');

        //Tipo de consulta
          DefineValor(wbPag1, 'rbtipoT','checked',false);

        //Data Agenda
          DefineValor(wbPag1, 'lbdtagenda','innerHtml','');
      end;

      if iLinha2 = 1 then
      begin
        //Médico
          DefineValor(wbPag2, 'lbmedico','innerHtml','');

        //Tipo de consulta
          DefineValor(wbPag2, 'rbtipoT','checked',false);

        //Data Agenda
          DefineValor(wbPag2, 'lbdtagenda','innerHtml','');
      end;
  end;

begin
  AbreConsulta;
  iLinha1 := 1;
  iLinha2 := 0;

    while iLinha1 <= 20 do
    begin
      CarregaCabecalho;
      //Linha
        DefineValor(wbPag1, 'lblinha'+intTostr(iLinha1),'innerHtml','');

      //Processo
        DefineValor(wbPag1, 'lbproc'+intTostr(iLinha1),'innerHtml','');

      //Provincia/Municipio
        DefineValor(wbPag1, 'lbmuni'+intTostr(iLinha1),'innerHtml','');

      //Paciente
        DefineValor(wbPag1, 'lbpaci'+intTostr(iLinha1),'innerHtml','');

      //Sexo
        DefineValor(wbPag1, 'lbsexo'+intTostr(iLinha1),'innerHtml','');

      //Idade
        DefineValor(wbPag1, 'lbidade'+intTostr(iLinha1),'innerHtml','');

      //Peso
        DefineValor(wbPag1, 'txpeso'+intTostr(iLinha1), 'value', '');

      //Tipo Consulta 2
        DefineValor(wbPag1, 'rbtpconsultaR'+intTostr(iLinha1),'checked',false);

      //OMS
        DefineValor(wbPag1, 'txoms'+intTostr(iLinha1), 'value', '');

      //CID10
        DefineValor(wbPag2, 'txcd'+intTostr(iLinha1), 'value', '');

      //CD4
        DefineValor(wbPag1, 'txcd4'+intTostr(iLinha1), 'value', '');

      //TB
        DefineValor(wbPag1, 'ckTB'+intTostr(iLinha1),'checked', '');

      //N
        DefineValor(wbPag1, 'ckN'+intTostr(iLinha1),'checked', false);

      //I
        DefineValor(wbPag1, 'ckI'+intTostr(iLinha1),'checked', false);


      //T
        DefineValor(wbPag1, 'ckT'+intTostr(iLinha1),'checked', false);

      //M
        DefineValor(wbPag1, 'ckM'+intTostr(iLinha1),'checked', false);

      //ESQUEMA
        DefineValor(wbPag1, 'txesquema'+intTostr(iLinha1), 'value', '');

        iLinha1 := iLinha1 + 1;
    end;

    if iLinha1 = 21 then
      iLinha2 := 1;

    while (iLinha2 > 0) and (iLinha2 < 21) do
    begin
      CarregaCabecalho;
      //Linha
        DefineValor(wbPag2, 'lblinha'+intTostr(iLinha2),'innerHtml','');

      //Processo
        DefineValor(wbPag2, 'lbproc'+intTostr(iLinha2),'innerHtml','');

      //Provincia/Municipio
        DefineValor(wbPag2, 'lbmuni'+intTostr(iLinha2),'innerHtml','');

      //Paciente
        DefineValor(wbPag2, 'lbpaci'+intTostr(iLinha2),'innerHtml','');

      //Sexo
        DefineValor(wbPag2, 'lbsexo'+intTostr(iLinha2),'innerHtml','');

      //Idade
        DefineValor(wbPag2, 'lbidade'+intTostr(iLinha2),'innerHtml','');

      //Peso
        DefineValor(wbPag2, 'txpeso'+intTostr(iLinha2), 'value', '');

      //Tipo Consulta 2
        DefineValor(wbPag2, 'rbtpconsultaR'+intTostr(iLinha2),'checked',false);

      //OMS
        DefineValor(wbPag2, 'txoms'+intTostr(iLinha2), 'value', '');

      //CID10
        DefineValor(wbPag2, 'txcd'+intTostr(iLinha2), 'value', '');

      //CD4
        DefineValor(wbPag2, 'txcd4'+intTostr(iLinha2), 'value', '');

      //TB
        DefineValor(wbPag2, 'ckTB'+intTostr(iLinha2),'checked', false);

      //N
        DefineValor(wbPag2, 'ckN'+intTostr(iLinha2),'checked', false);

      //I
        DefineValor(wbPag2, 'ckI'+intTostr(iLinha2),'checked', false);


      //T
        DefineValor(wbPag2, 'ckT'+intTostr(iLinha2),'checked', false);

      //M
        DefineValor(wbPag2, 'ckM'+intTostr(iLinha2),'checked', false);

      //ESQUEMA
        DefineValor(wbPag2, 'txesquema'+intTostr(iLinha2), 'value', '');

      iLinha1 := iLinha1 + 1;
      iLinha2 := iLinha2 + 1;
    end;

end;

procedure TframMapaMedico.btSalvarClick(Sender: TObject);
begin
  SalvarDados;
  btEditar.Enabled := true;
  btSalvar.Enabled := false;
  btFiltrarMedicos.Enabled := true;  
  wbPag1.Enabled := false;
  wbPag2.Enabled := false;
end;

procedure TframMapaMedico.btEditarClick(Sender: TObject);
begin
  btEditar.Enabled := false;
  btSalvar.Enabled := true;
  btFiltrarMedicos.Enabled := false;
  wbPag1.Enabled := true;
  wbPag2.Enabled := true;
end;

procedure TframMapaMedico.btConfImpClick(Sender: TObject);
var wb:TWebBrowser; vIn, vOut:OleVariant;
begin
  case pgMapa.ActivePageIndex of
    0: wb := wbPag1;
    1: wb := wbPag2;
  end;

  wb.ControlInterface.ExecWB(OLECMDID_PAGESETUP,
      OLECMDEXECOPT_PROMPTUSER, vIn, vOut);
end;

procedure TframMapaMedico.btImprimirClick(Sender: TObject);
var wb:TWebBrowser; vIn, vOut:OleVariant;
begin
  case pgMapa.ActivePageIndex of
    0: wb := wbPag1;
    1: wb := wbPag2;
  end;

  wb.ControlInterface.ExecWB(OLECMDID_PRINT,
      OLECMDEXECOPT_DONTPROMPTUSER, vIn, vOut);
end;

procedure TframMapaMedico.btPreviewClick(Sender: TObject);
var wb:TWebBrowser; vIn, vOut:OleVariant;
begin
  case pgMapa.ActivePageIndex of
    0: wb := wbPag1;
    1: wb := wbPag2;
  end;

  wb.ControlInterface.ExecWB(OLECMDID_PRINTPREVIEW,
      OLECMDEXECOPT_PROMPTUSER, vIn, vOut);
end;

procedure TframMapaMedico.AtualizaDados;
var
  sValor:string;
  i:integer;
begin
  dmGeral.qyMapaMedico.Close;
  if pnFiltroMedicoMapa.Visible = true then
  dmGeral.qyMapaMedico.ParamByName('CDMEDICO').AsInteger :=
     cbMedico.KeyValue
  else
  dmGeral.qyMapaMedico.ParamByName('CDMEDICO').AsInteger :=
     dm.qyLoginCD_MEDICO.AsInteger;

  dmGeral.qyMapaMedico.ParamByName('DTAGENDA').AsDate :=
     trunc(frmProcessoUtente.dtAgenda.Date);
  dmGeral.qyMapaMedico.Open;
  dmGeral.qyMapaMedico.First;
  AbreConsulta;

  while not dmGeral.qyMapaMedico.Eof do
  begin
    if dmGeral.TB_MAPA.Locate('cd_paciente',dmGeral.qyMapaMedicoCD_PACIENTE.AsInteger,[]) then
      dmGeral.qyMapaMedico.next
    else
      begin
        dmGeral.TB_MAPA.Insert;
        dmGeral.TB_MAPACD_PACIENTE.AsInteger :=
          dmGeral.qyMapaMedicoCD_PACIENTE.AsInteger;
        dmGeral.TB_MAPACD_MEDICO.AsInteger :=
          dmGeral.qyMapaMedicoCD_MEDICO.AsInteger;
        dmGeral.TB_MAPADT_MAPA.AsDateTime :=
          dmGeral.qyMapaMedicoDT_AGENDA.AsDateTime;
        dmGeral.TB_MAPA.Post;
        dmGeral.qyMapaMedico.next;
      end;
   end;

end;

procedure TframMapaMedico.btFiltrarMedicosClick(Sender: TObject);
begin
  pnFiltroMedicoMapa.Visible := not pnFiltroMedicoMapa.Visible;
  cbMedico.ListSource.DataSet.Active := pnFiltroMedicoMapa.Visible;
  if pnFiltroMedicoMapa.Visible then
    cbMedico.ListSource.DataSet.Last;

end;

procedure TframMapaMedico.btAtualizarMapaClick(Sender: TObject);
begin
  LimpaMapa;
  AtualizaDados;
  CarregaDados;
  pnFiltroMedicoMapa.Visible := false;
end;

procedure TframMapaMedico.SelecionarCID10(Sender: TObject);
var
  vElem : IHTMLElement;
  wb : TWebBrowser;
  nID:integer;
  sID, sCD, sSG:string;
begin
  wb := TWebBrowser(TBrowserClick(Sender).Owner);
  nID := TBrowserClick(sender).nID;
  if frmCID10.ShowModal = mrOK then
  begin
    sCD := IntToStr(frmCID10.FCID10);
    sID := 'edCD' + intToStr(nID);
    vElem := GetElementById(wb.Document, sID) as IHTMLElement;
    vElem.setAttribute('value',sCD,0);

    sSG := frmCID10.FSG;
    sID := 'edSG' + intToStr(nID);
    vElem := GetElementById(wb.Document, sID) as IHTMLElement;
    vElem.setAttribute('value',sSG,0);
  end;
end;

procedure TframMapaMedico.SelecionarCID10Exit(Sender: TObject);
var
  vElem : IHTMLElement;
  wb : TWebBrowser;
  nID:integer;
  sID, sCD, sSG:string;
begin
  wb := TWebBrowser(TBrowserExit(Sender).Owner);
  nID := TBrowserExit(sender).nID;
  if frmCID10.ShowModal = mrOK then
  begin
    sCD := IntToStr(frmCID10.FCID10);
    sID := 'edCD' + intToStr(nID);
    vElem := GetElementById(wb.Document, sID) as IHTMLElement;
    vElem.setAttribute('value',sCD,0);

    sSG := frmCID10.FSG;
    sID := 'edSG' + intToStr(nID);
    vElem := GetElementById(wb.Document, sID) as IHTMLElement;
    vElem.setAttribute('value',sSG,0);
  end;
end;

procedure TframMapaMedico.wbPag1DocumentComplete(Sender: TObject;
  const pDisp: IDispatch; var URL: OleVariant);
var
  vDoc : OleVariant;
  Document: IHTMLDocument2;     // IHTMLDocument2 interface of Doc
  Body, Tag2: IHTMLElement2;          // document body element
  Tags: IHTMLElementCollection; // all tags in document body
  Tag: IHTMLElement;            // a tag in document body
  I: Integer;                   // loops thru tags in document body
begin
  vDoc := TWebBrowser(sender).Document;
  // Check for valid document: require IHTMLDocument2 interface to it
  if not Supports(vDoc, IHTMLDocument2, Document) then
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
    Tag2 := Tags.item(I, EmptyParam) as IHTMLElement2;

    //Botao Selecionar CID10
    if (Copy(Tag.id,1,5) = 'btCID') then
    begin
      BClick := TBrowserClick.Create( Application);
      BClick.Owner := Sender;
      BClick.OnClick := SelecionarCID10;
      try
        BClick.nID := strToInt(Copy(Tag.id,6,Length(Tag.id)));
        tag.onclick := OleVariant( BClick as IDispatch);
      except
        //
      end;
    end;

    //Editor CID10
    if (Copy(Tag.id,1,4) = 'edSG') then
    begin
      BClick := TBrowserClick.Create( Application);
      BClick.Owner := Sender;
      BClick.OnClick := SelecionarCID10;
      try
        BClick.nID := strToInt(Copy(Tag.id,6,Length(Tag.id)));
        tag.onClick := OleVariant( BClick as IDispatch);
      except
        //
      end;
    end;

    //Botao Montar Esquema
    if (Copy(Tag.id,1,3) = 'btm') then
    begin
      BClick := TBrowserClick.Create( Application);
      BClick.Owner := Sender;
      BClick.OnClick := SelecionarEsquema;
      try
        BClick.nID := strToInt(Copy(Tag.id,4,Length(Tag.id)));
        tag.onclick := OleVariant( BClick as IDispatch);
      except
        //
      end;
    end;

    //Botao Limpar Esquema
    if (Copy(Tag.id,1,3) = 'btl') then
    begin
      BClick := TBrowserClick.Create( Application);
      BClick.Owner := Sender;
      BClick.OnClick := LimparEsquema;
      try
        BClick.nID := strToInt(Copy(Tag.id,4,Length(Tag.id)));
        tag.onclick := OleVariant( BClick as IDispatch);
      except
        //
      end;
    end;
  end;
end;

procedure TframMapaMedico.CreateFrameMapa;
begin
  frmCID10 := TfrmCID10.Create(Application);
  frmCID10.bSelecionar := true;
  qyMedicoMapa.Open;
end;

procedure TframMapaMedico.DestroyFrameMapa;
begin
  frmCID10.Free;
  qyMedicoMapa.Close;
end;

procedure TframMapaMedico.SelecionarEsquema(Sender: TObject);
var
  vElem : IHTMLElement;
  wb : TWebBrowser;
  nID:integer;
  sID, sEsq:string;
begin
  wb := TWebBrowser(TBrowserClick(Sender).Owner);
  nID := TBrowserClick(sender).nID;
  frmLocalizar := TfrmLocalizar.Create(application);
  frmLocalizar.Caption := 'Localizar Esquema';
  frmLocalizar.qyDados := SelectDadosEsquema;

  try
    frmLocalizar.Where := false;
    SetLength(VCampo,5);
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
    sID := 'txesquema' + intToStr(nID);
    vElem := GetElementById(wb.Document, sID) as IHTMLElement;
    sEsq := vElem.getAttribute('value',0);
    if sEsq <> '' then
      sEsq := sEsq + '+' + frmLocalizar.qyDados.FieldByname('DS_SIGLA').AsString
    else
      sEsq := frmLocalizar.qyDados.FieldByname('DS_SIGLA').AsString;
    vElem.setAttribute('value',sEsq,0);
  end;
  frmLocalizar.qyDados.Close;
  FreeAndNil(frmLocalizar);
end;


procedure TframMapaMedico.LimparEsquema(Sender: TObject);
var
  vElem : IHTMLElement;
  wb: TWebBrowser;
  nID:integer;
  sID, sEsq:string;
begin
  wb := TWebBrowser(TBrowserClick(Sender).Owner);
  nID := TBrowserClick(sender).nID;
  sID := 'txesquema' + intToStr(nID);
  vElem := GetElementById(wb.Document, sID) as IHTMLElement;
  vElem.setAttribute('value','',0);
end;

procedure TframMapaMedico.qyMedicoMapaBeforeOpen(DataSet: TDataSet);
begin
  qyMedicoMapa.ParamByName('CD_USUARIO').AsInteger :=
    dm.qyLoginCD_USUARIO.AsInteger;
end;


end.

