unit ufrmBITabular;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  dxDBCtrl, dxDBGrid, dxDBTLCl, dxGrClms, dxTL, Db, dxCntner,
  IBCustomDataSet, IBQuery, IBDatabase, StdCtrls, Grids, DBGrids, dxExEdtr,
  OleCtrls, SHDocVw, ComCtrls, CheckLst, Buttons, dxEdLib, dxDBELib,
  dxEditor, DBClient, DBLocal, DBLocalI, ExtCtrls, Mask, ToolEdit, RXCtrls,
  ImgList;

type
  TfrmBITabular = class(TForm)
    DataSource2: TDataSource;
    IBQuery2: TIBQuery;
    PageControl1: TPageControl;
    tabIndicadores: TTabSheet;
    tabFiltros: TTabSheet;
    tabTabela: TTabSheet;
    tabGrafico: TTabSheet;
    paginaWeb: TWebBrowser;
    lbLinha: TCheckListBox;
    lbColuna: TCheckListBox;
    Label1: TLabel;
    Label2: TLabel;
    cbIndicador: TComboBox;
    tabAux: TTabSheet;
    DBGrid1: TDBGrid;
    StringGrid1: TStringGrid;
    StringGrid2: TStringGrid;
    Memo1: TMemo;
    Memo2: TMemo;
    Button2: TButton;
    Memo3: TMemo;
    SpeedButton1: TSpeedButton;
    qyOcupacao: TIBQuery;
    qyEscolaridade: TIBQuery;
    SpeedButton2: TSpeedButton;
    gbLocal: TGroupBox;
    Label26: TLabel;
    btLocProvincia: TdxButtonEdit;
    edProvincia: TdxEdit;
    Label27: TLabel;
    btLocMunicipio: TdxButtonEdit;
    edMunicipio: TdxEdit;
    Label28: TLabel;
    btLocUnidade: TdxButtonEdit;
    edUnidade: TdxEdit;
    gbPeriodo: TGroupBox;
    cbMesAnoDe: TComboBox;
    cbMesAnoAte: TComboBox;
    lbMesAnoAte: TLabel;
    lbMesAnoDe: TLabel;
    Memo5: TMemo;
    pnSexo: TPanel;
    pnTrasnmissaoVertical: TPanel;
    Label5: TLabel;
    lstSexo: TCheckListBox;
    pnFaixaEtaria: TPanel;
    Label6: TLabel;
    lstFaixaEtaria: TCheckListBox;
    pnTbAnterior: TPanel;
    Label13: TLabel;
    lstTBAnterior: TCheckListBox;
    pnTatuagem: TPanel;
    Label17: TLabel;
    lstTatuagem: TCheckListBox;
    pnCircuncisao: TPanel;
    Label21: TLabel;
    lstCircuncisao: TCheckListBox;
    pnOcupacao: TPanel;
    Label3: TLabel;
    lstOcupacao: TCheckListBox;
    pnEscolaridade: TPanel;
    Label4: TLabel;
    lstEscolaridade: TCheckListBox;
    pnTbAtual: TPanel;
    Label12: TLabel;
    lstTBAtual: TCheckListBox;
    pnIntervencaoCirurgica: TPanel;
    Label18: TLabel;
    lstCirurgica: TCheckListBox;
    pnTratamentoDentario: TPanel;
    Label22: TLabel;
    lstDentario: TCheckListBox;
    pnEstadoCivil: TPanel;
    Label7: TLabel;
    lstEstadoCivil: TCheckListBox;
    pnEstadioClinico: TPanel;
    Label8: TLabel;
    lstEstadioClinico: TCheckListBox;
    pnTesteTriagem: TPanel;
    Label16: TLabel;
    lstTesteTriagem: TCheckListBox;
    pnTratamentoTradicional: TPanel;
    Label19: TLabel;
    lstTradicional: TCheckListBox;
    pnTransfusaoSangue: TPanel;
    Label23: TLabel;
    lstTransfusao: TCheckListBox;
    pnRelacoesSexo: TPanel;
    Label9: TLabel;
    lstRelacoesSexo: TCheckListBox;
    pnEvidenciaGestante: TPanel;
    Label10: TLabel;
    lstEvidenciaGestante: TCheckListBox;
    pnTesteConfirmatorio: TPanel;
    Label15: TLabel;
    lstTesteConfirmatorio: TCheckListBox;
    pnAcidenteBiologico: TPanel;
    Label20: TLabel;
    lstAcidente: TCheckListBox;
    pnDrogaInjetavel: TPanel;
    Label24: TLabel;
    lstDroga: TCheckListBox;
    pnGestante: TPanel;
    Label29: TLabel;
    lstGestante: TCheckListBox;
    pnResultado: TPanel;
    Label30: TLabel;
    lstResultado: TCheckListBox;
    pnEvolucao: TPanel;
    Label11: TLabel;
    lstEvolucao: TCheckListBox;
    pnTipoEntrada: TPanel;
    Label14: TLabel;
    lstTPEntrada: TCheckListBox;
    Label25: TLabel;
    lstTransmissaoVertical: TCheckListBox;
    dtDE: TDateEdit;
    dtATE: TDateEdit;
    tabFiltroCaract: TTabSheet;
    SpeedButton3: TSpeedButton;
    Memo4: TMemo;
    pnAmamenta: TPanel;
    Label31: TLabel;
    lstAmamenta: TCheckListBox;
    RxLabel2: TRxLabel;
    StatusBar1: TStatusBar;
    ImageList1: TImageList;
    Timer1: TTimer;
    procedure Pesquisar(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button2Click(Sender: TObject);
    procedure lbLinhaClickCheck(Sender: TObject);
    procedure lbColunaClickCheck(Sender: TObject);
    procedure btLocProvinciaButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure btLocMunicipioButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure btLocUnidadeButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure btLocProvinciaChange(Sender: TObject);
    procedure btLocProvinciaExit(Sender: TObject);
    procedure btLocUnidadeChange(Sender: TObject);
    procedure btLocUnidadeExit(Sender: TObject);
    procedure btLocMunicipioExit(Sender: TObject);
    procedure btLocMunicipioChange(Sender: TObject);
    procedure tabFiltrosMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure cbIndicadorChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure StatusBar1DrawPanel(StatusBar: TStatusBar;
      Panel: TStatusPanel; const Rect: TRect);
  private
    { Private declarations }
    function PreparaSQL:string;
    function DefineFiltro:String;
    function DefineFiltroCaract:String;
    procedure CarregaCombo;
    function FormataListaComAspas(sLista: string): string;
    function MontaSQLNotificacao:string;
    function MontaSQLAgenda:string;
    function MontaSQLCaracterizacao:string;
    procedure CarregaComboMesAno;
    procedure CarregaCampos;
    procedure HabilitaFiltros;
    procedure PosicaoDefaultFiltros;
    procedure PosicionaFiltros;
    procedure LimpaFiltros;
    function Existe(s:String;lst:TStringList):boolean;
  public
    { Public declarations }
  end;

type TMyRec= record
   pn:TPanel;
   Left,Top:integer;
end;

const
 cNotificacao=1;
 cAgenda=2;
 cCaracterizacao=3;
 cRelatorioPrograma=4;

var
  frmBITabular: TfrmBITabular;
  slLinha, slColuna, slAux, lstFiltro:TStringList;
  sArq:String;
  nLinhas,nColunas:integer;
  nTipoBI:integer;
  MyRec:array of TMyRec;

implementation

uses UDM, uSQLNotificacao, UGeral, UfrmLocalizar, UGeralSQL, DateUtils;

{$R *.DFM}

procedure TfrmBITabular.Pesquisar(Sender: TObject);
var fLinha, fColuna, nLinha, nColuna:Integer; sAux:string;  nAux:integer; bAux:boolean;
  function NIF(s:String):string;
  begin
     if s = '' then s := 'NIF';
     result := s;
  end;

  function RetornaValorCampos(qy:TIBQuery;sl:TStringList;lb:TCheckListBox):integer;
  var n, i:integer; sAux:string;
  begin
     n := -1;
     for i:=0 to lb.Items.Count-1 do
       if lb.Checked[i] then
       begin
         sAux := NIF(qy.FieldByName(lb.Items[i]).AsString);
         n  := sl.IndexOf(sAux);
         if n = -1 then
           n := sl.Add(sAux);
       end;
     result := n;
  end;

  function CountCheck(lb:TCheckListBox):integer;
  var i,n:integer;
  begin
     n:=0;
     for i:=0 to lb.Items.Count-1 do
       if lb.Checked[i] then
        inc(n);
     result := n;
  end;

begin
  //Marca Quantidade como Default caso nao tenha nenhum selecionado
  nAux:=-1;
  bAux:=false;
  for nLinha:=0 to lbLinha.Count-1 do
  begin
    if lbLinha.Items[nLinha] = 'QUANTIDADE' then
        nAux := nLinha;

    if lbLinha.Checked[nLinha] then
      bAux := true;
  end;
  if (not bAux) AND (nAux>-1) then
   lbLinha.Checked[nAux] := true;

  nAux:=-1;
  bAux:=false;
  for nColuna:=0 to lbColuna.Count-1 do
  begin
    if lbColuna.Items[nColuna] = 'QUANTIDADE' then
        nAux := nColuna;

    if lbColuna.Checked[nColuna] then
      bAux := true;
  end;
  if (not bAux) AND (nAux>-1) then
   lbColuna.Checked[nAux] := true;

  //Zerar
  for nLinha:=0 to StringGrid1.RowCount-1 do
    StringGrid1.Rows[nLinha].Clear;
  slLinha.Clear;
  slColuna.Clear;

  flinha := CountCheck(lbLinha);
  fColuna := CountCheck(lbColuna);
  StringGrid1.ColCount := fColuna+1;
  StringGrid1.RowCount := flinha+1;
  StringGrid1.FixedCols := fColuna;
  StringGrid1.FixedRows := flinha;

  IBQuery2.Close;
  IBQuery2.SQL.Text := PreparaSQL;
  Memo4.Text:=IBQuery2.SQL.Text;
  try
   IBQuery2.Open;
  except
   on E:Exception do
   begin
     Memo4.Lines.Add(E.Message);
     Exit;
   end;
  end;
  IBQuery2.First;
  while not IBQuery2.Eof do
  begin
     nLinha := RetornaValorCampos(IBQuery2,slLinha,lbLinha);
     nColuna := RetornaValorCampos(IBQuery2,slColuna,lbColuna);
     memo2.Lines := slLinha;
     memo3.Lines := slColuna;
     if (StringGrid1.RowCount < nLinha + fLinha + 1) then
       StringGrid1.RowCount := nLinha + fLinha + 1;
     if (StringGrid1.ColCount < nColuna + fColuna + 1) then
       StringGrid1.ColCount := nColuna + fColuna + 1;

     nAux := IBQuery2.FieldByName('CNT').AsInteger;
     StringGrid1.Cells[nColuna+fColuna,nLinha+fLinha] := intToStr(
          StrToIntDef(StringGrid1.Cells[nColuna+fColuna,nLinha+fLinha],0) +
          nAux);
     IBQuery2.Next;
  end;

  //Titulos Colunas
  begin
    for nColuna := 1 to slColuna.Count do
    begin
      sAux := slColuna[nColuna-1];
      slAux.Clear;
      if Pos(',',sAux)>0 then
      begin
        slAux.Delimiter := ',';
        slAux.DelimitedText := sAux;
        for nAux:=0 to slAux.Count-1 do
          StringGrid1.Cells[nColuna,nAux] := slAux[nAux];
      end
      else
      begin
        StringGrid1.Cells[nColuna,0] := sAux;
      end;
    end;
  end;

  //Titulos Linhas
  begin
    for nLinha := 1 to slLinha.Count do
    begin
      sAux := slLinha[nLinha-1];
      slAux.Clear;
      if Pos(',',sAux)>0 then
      begin
        slAux.Delimiter := ',';
        slAux.DelimitedText := sAux;
        for nAux:=0 to slAux.Count-1 do
          StringGrid1.Cells[nAux,nLinha] := slAux[nAux];
      end
      else
      begin
        StringGrid1.Cells[0,nLinha] := sAux;
      end;
    end;
  end;

  Memo1.Lines := slColuna;

  //Ordenar Colunas
  StringGrid2.RowCount := StringGrid1.RowCount;
  StringGrid2.ColCount := StringGrid1.ColCount;
  StringGrid2.FixedCols := StringGrid1.FixedCols;
  StringGrid2.FixedRows := StringGrid1.FixedRows;
  slAux.Text := slColuna.Text;
  slAux.Sorted := True;
  slAux.Sort;
  for nColuna:=1 to slColuna.Count do
  begin
    nAux := slColuna.IndexOf(slAux[nColuna-1]);
    StringGrid2.Cols[nColuna] := StringGrid1.Cols[nAux+1];
  end;
  for nColuna:=1 to slColuna.Count do
    StringGrid1.Cols[nColuna] := StringGrid2.Cols[nColuna];

  Memo1.Lines := slColuna;
  Memo2.Lines := slAux;
  slAux.Sorted := False;

  //Total
  StringGrid1.RowCount := StringGrid1.RowCount +1;
  StringGrid1.ColCount := StringGrid1.ColCount +1;
  nColuna := StringGrid1.ColCount-1;
  StringGrid1.Cells[nColuna, 0] := 'Total';
  nlinha := StringGrid1.RowCount-1;
  StringGrid1.Cells[0, nLinha] := 'Total';

  for nLinha := StringGrid1.FixedRows to StringGrid1.RowCount-1 do
  begin
    nAux:=0;
    for nColuna := StringGrid1.FixedCols to StringGrid1.ColCount-1 do
      nAux := nAux + StrToIntDef(StringGrid1.Cells[nColuna, nLinha],0);
    nColuna := StringGrid1.ColCount-1;
    StringGrid1.Cells[nColuna, nLinha] := intToStr(nAux);
  end;

  for nColuna := StringGrid1.FixedCols to StringGrid1.ColCount-1 do
  begin
    nAux:=0;
    for nLinha := StringGrid1.FixedRows to StringGrid1.RowCount-1 do
      nAux := nAux + StrToIntDef(StringGrid1.Cells[nColuna, nLinha],0);
    nLinha := StringGrid1.RowCount-1;
    StringGrid1.Cells[nColuna, nLinha] := intToStr(nAux);
  end;

  Button2Click(Sender);

  PageControl1.ActivePage := tabTabela;
end;

procedure TfrmBITabular.FormCreate(Sender: TObject);
begin
  PageControl1.ActivePageIndex := 0;
  PageControl1.Align := alClient;
  slLinha := TStringList.Create;
  slColuna := TStringList.Create;
  slAux := TStringList.Create;
  lstFiltro := TStringList.Create;
  CarregaCampos;
  CarregaCombo;
  InicializaConstantes;
  //dtDe.Date := date;
  //dtAte.Date := date;
end;

procedure TfrmBITabular.FormClose(Sender: TObject; var Action: TCloseAction);
var i:integer;
begin
 FreeAndNil(slLinha);
 FreeAndNil(slColuna);
 FreeAndNil(slAux);
 FreeAndNil(lstFiltro);
 if FileExists(sArq) then
    DeleteFile(sArq);

 SetLength(MyRec,0);
end;

procedure TfrmBITabular.Button2Click(Sender: TObject);
var i, j, nLinha, nColuna:integer; rAux:real;
    sAux,sAux2, sAux5,sTD, sTD2, sTD5, sTR, sTR0, sTR1, sTR2, sTR3, sTR4, sTR5:String;
    sRotulo, nmGrafico, sGrafico, sRotuloG:string;
begin
  memo3.Lines.Clear;
  memo3.Lines.Add('<html>');
  memo3.Lines.Add('<head>');
	memo3.Lines.Add('<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1"/>');
	memo3.Lines.Add('<link href="css/ConsultaXML.css" type="text/css" rel="stylesheet"/>');
	memo3.Lines.Add('<link href="css/grafico.css" type="text/css" rel="stylesheet"/>');
	memo3.Lines.Add('<script type="text/JavaScript"  language="javascript" src="scripts/ConsultaXML.js"></script>');
	memo3.Lines.Add('<script language="javascript">AC_FL_RunContent = 0;</script>');
	memo3.Lines.Add('<script language="javascript"> DetectFlashVer = 0; </script>');
	memo3.Lines.Add('<script src="AC_RunActiveContent.js" language="javascript"></script>');
	memo3.Lines.Add('<script language="JavaScript" type="text/javascript">');
	memo3.Lines.Add('<!--');
	memo3.Lines.Add('var requiredMajorVersion = 10;');
	memo3.Lines.Add('var requiredMinorVersion = 0;');
	memo3.Lines.Add('var requiredRevision = 45;');
	memo3.Lines.Add('-->');
	memo3.Lines.Add('</script>');

  memo3.Lines.Add('</head>');
  memo3.Lines.Add('<body>');
  memo3.Lines.Add('<table align="center" height="23" cellSpacing="0" cellPadding="0" width="98%" >');
	memo3.Lines.Add('<tbody>');

  sTD := '<td class="%s"> %s </td>';
  sTR := '<tr class="%s"> %s </tr>';

  sAux := '<td width="23"><img height="23" src="imagens/Pasta.gif" width="23" border="0"/></td>'+
          '<td class="ExpTit" colspan="%d" background="imagens/PastaFundo.gif">%s</td>'+
          '<td width="10"><img height="23" src="imagens/PastaFinal.gif" width="10"/></td>';
  sTR0 := '<tr> ' + sAux + ' </tr>';
  sAux := '<td width="23"><img height="23" src="imagens/Dados.gif" width="23" border="0"/></td>'+
          '<td class="ExpTit" colspan="%d" background="imagens/DadosFundo.gif">%s</td>'+
          '<td width="10"><img height="24" src="imagens/DadosFinal.gif" width="10"/></td>';
  sTR1 := '<tr> ' + sAux + ' </tr>';
  sTR2 := '<tr class="ExpSubTit"> %s </tr>';
  sTR3 := '<tr class="ExpCabLn2" valign="top"> %s </tr>';
  sTR4 := '<tr class="TabTit"><td rowspan="%d" align="center" '+
          'style="writing-mode: tb-rl; filter: flipv fliph;">%s</td></tr>';

  sTD5 := '<tr><td class="value first"><div class="gradient" style="width:%spx; height:16px"></div>'+
          '<div class="rotulo">%s</div></td></tr>';
  sTR5 := '<tr> ' +
          '    <td class="first">%s</td>' +
          '    <td><table class="grafico" cellSpacing="0" cellPadding="0">%s</table></td> ' +
          '</tr> ';

  //Titulo Relatorio
  if (cbIndicador.Text='NOTIFICACAO') then
    sAux := Format(sTR0,[StringGrid1.ColCount,'Notificação']);

  if (cbIndicador.Text='AGENDA') then
    sAux := Format(sTR0,[StringGrid1.ColCount,'Agenda']);

  if (cbIndicador.Text='CARACTERIZACAO') then
    sAux := Format(sTR0,[StringGrid1.ColCount,'Caracterização']);

  memo3.Lines.Add(sAux);

  //Rotulos Colunas
  for i := 0 to lbColuna.Count-1 do
  begin
    if lbColuna.Checked[i] then
    begin
      sAux := lbColuna.Items[i];
      sAux := Format(sTR1,[StringGrid1.ColCount,sAux]);
      memo3.Lines.Add(sAux);
    end;
  end;
  memo3.Lines.Add('<table class="sample" align="center" height="23"  width="100%" >');

  //Rotulos Linhas
  sAux := '';
  for i := 0 to lbLinha.Count-1 do
  begin
    if lblinha.Checked[i] then
    begin
      sAux2 := lbLinha.Items[i];
      sAux := sAux2;
      sAux := Format(sTR4,[StringGrid1.RowCount+1,sAux]);
      memo3.Lines.Add(sAux);
      sRotuloG := sRotuloG + sAux2;
    end;
  end;

  //Linhas
  sTD2 := '';
  sAux5:='';
  sRotulo:='';
  memo5.Clear;
  for nLinha := 0 to StringGrid1.RowCount-1 do
  begin
   for nColuna := 0 to StringGrid1.ColCount-1 do
   begin
      sAux := StringGrid1.Cells[nColuna,nLinha];
      if sAux = '' then sAux := '&nbsp';
      if (nColuna = 0)or(nLinha <= StringGrid1.FixedRows-1) then
      begin
         sTD2 := sTD2 + Format(sTD,['ExpSubTit',sAux]);
         if (nColuna = 0) then
           sRotulo:=sAux;
      end
      else if (nColuna=StringGrid1.ColCount-1)or(nLinha=StringGrid1.RowCount-1) then
      begin
        sTD2 := sTD2 + Format(sTD,['TabCabVlr',sAux]);
      end
      else
      begin
        sTD2 := sTD2 + Format(sTD,['ExpCabLn2',sAux]);
        rAux := Valor(StringGrid1.Cells[nColuna,StringGrid1.RowCount-1]);
        if rAux>0 then
        begin
          rAux := Valor(sAux)/rAux;
          rAux := trunc(350 * rAux);
        end;
        if (sAux<>'&nbsp') then
          sAux := sAux + '-' + StringGrid1.Cells[nColuna,0];
        sAux5 := sAux5 + Format(sTD5,[FloatToStr(rAux),sAux]);
      end;
   end;
   sAux := Format(sTR,['',sTD2]);
   memo3.lines.Add(sAux);
   if (sRotulo<>'Total')and(sRotulo<>'&nbsp') then
   begin
     sAux5 := Format(sTR5,[sRotulo,sAux5]);
     memo5.lines.Add(sAux5);
     sRotulo:='';
   end;
   sAux5:='';
   sTD2 := '';
  end;
  memo3.Lines.Add('</table>');
  memo3.Lines.Add('</tbody>');
  memo3.Lines.Add('</table>');

  //Grafico
    memo5.Lines.Clear;
    for nColuna := 0 to StringGrid1.ColCount-2 do
    begin
     memo5.Lines.Add('<row>');
     for nLinha := 0 to StringGrid1.RowCount-2 do
     begin
       if (nColuna=0) and (nLinha=0) then
         memo5.Lines.Add('<null/>')
       else if (nColuna=0) or (nLinha=0) then
         memo5.Lines.Add('<string>'+StringGrid1.Cells[nColuna,nLinha]+'</string>')
       else
         memo5.Lines.Add('<number>'+StringGrid1.Cells[nColuna,nLinha]+'</number>');
     end;
     memo5.Lines.Add('</row>');
    end;
    sGrafico := memo5.Lines.Text;
    memo5.Lines.LoadFromFile(sPathConsulta+'barrasBI.xml');
    sAux := memo5.Lines.Text;
    sAux := StringReplace(sAux,'<ROTULO>',sRotuloG,[]);
    sAux := StringReplace(sAux,'<ESCALA>','N.Casos',[]);
    memo5.Lines.Text := StringReplace(sAux,'<DADOS>',sGrafico,[]);
    nmGrafico := 'barrasTmp.xml';
    memo5.Lines.SaveToFile(sPathConsulta+nmGrafico);

    memo3.Lines.Add('</br>');
    memo3.Lines.Add('  <table class="grafico" cellspacing="0" cellpadding="0" align="center">');
    memo3.Lines.Add('  <tbody>');
    memo3.Lines.Add('<script language="JavaScript" type="text/javascript">');
    memo3.Lines.Add('if (AC_FL_RunContent == 0 || DetectFlashVer == 0) {');
    memo3.Lines.Add('	alert("This page requires AC_RunActiveContent.js.");');
    memo3.Lines.Add('} else {');
    memo3.Lines.Add('	var hasRightVersion = DetectFlashVer(requiredMajorVersion, requiredMinorVersion, requiredRevision);');
    memo3.Lines.Add('	if(hasRightVersion) {');
    memo3.Lines.Add('		AC_FL_RunContent(');
    memo3.Lines.Add('			''codebase'', ''http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=10,0,45,2'',');
    memo3.Lines.Add('			''width'', ''700'',');
    memo3.Lines.Add('			''height'', ''400'',');
    memo3.Lines.Add('			''scale'', ''noscale'',');
    memo3.Lines.Add('			''salign'', ''TL'',');
    memo3.Lines.Add('			''bgcolor'', ''#777788'',');
    memo3.Lines.Add('			''wmode'', ''opaque'',');
    memo3.Lines.Add('			''movie'', ''charts'',');
    memo3.Lines.Add('			''src'', ''charts'',');
    memo3.Lines.Add('			''FlashVars'', ''library_path=charts_library&xml_source='+nmGrafico+''',');
    memo3.Lines.Add('			''id'', ''my_chart'',');
    memo3.Lines.Add('			''name'', ''my_chart'',');
    memo3.Lines.Add('			''menu'', ''true'',');
    memo3.Lines.Add('			''allowFullScreen'', ''true'',');
    memo3.Lines.Add('			''allowScriptAccess'',''sameDomain'',');
    memo3.Lines.Add('			''quality'', ''high'',');
    memo3.Lines.Add('			''align'', ''middle'',');
    memo3.Lines.Add('			''pluginspage'', ''http://www.macromedia.com/go/getflashplayer'',');
    memo3.Lines.Add('			''play'', ''true'',');
    memo3.Lines.Add('			''devicefont'', ''false''');
    memo3.Lines.Add('			);');
    memo3.Lines.Add('	} else {');
    memo3.Lines.Add('		var alternateContent = ''This content requires the Adobe Flash Player. ''');
    memo3.Lines.Add('		+ ''<u><a href=http://www.macromedia.com/go/getflash/>Get Flash</a></u>.'';');
    memo3.Lines.Add('		document.write(alternateContent);');
    memo3.Lines.Add('	}');
    memo3.Lines.Add('}');
    memo3.Lines.Add('</script>');
    //memo3.Lines.Add(memo5.Lines.Text);
    memo3.Lines.Add('  </tbody>');
    memo3.Lines.Add('  </table>');
  //Fim Grafico

  memo3.Lines.Add('</body>');
  memo3.Lines.Add('</html>');

  if FileExists(sArq) then
    DeleteFile(sArq);
  sArq := ExtractFilePath(Application.ExeName)+'Consulta\BI'+FormatDateTime('hhnnss',now)+'.html';
  memo3.Lines.SaveToFile(sArq);
  paginaWeb.Navigate(sArq);
end;

function TfrmBITabular.PreparaSQL: string;
var s:array[1..4] of string; i,x:integer;
begin


  if cbIndicador.Text = 'NOTIFICACAO' then
  begin
    s[4] := DefineFiltro;
    s[2] := MontaSQLNotificacao;
  end;

  if cbIndicador.Text = 'AGENDA' then
  begin
    s[4] := DefineFiltro;
    s[2] := MontaSQLAgenda;
  end;

  if cbIndicador.Text = 'CARACTERIZACAO' then
  begin
    s[4] := DefineFiltroCaract;
    s[2] := MontaSQLCaracterizacao;
  end;

  x := 0;
  nLinhas := 0;
  nColunas := 0;
  //Linhas
  for i:=0 to lbLinha.Items.Count-1 do
    if lbLinha.Checked[i] then
    begin
       inc(x);
       s[1] := s[1] + lbLinha.Items[i] + ',';
       s[3] := s[3] + intToStr(x) + ',';
       inc(nLinhas);
    end;
  //Colunas
  for i:=0 to lbColuna.Items.Count-1 do
    if lbColuna.Checked[i] then
    begin
      inc(x);
       s[1] := s[1] + lbColuna.Items[i] + ',';
       s[3] := s[3] + intToStr(x) + ',';
       inc(nColunas);
    end;
  Delete(s[3],Length(s[3]),1);

  result := Format('SELECT %s COUNT(*) CNT FROM (%s) N %s GROUP BY %s',
    [s[1],s[2],s[4],s[3]]);
end;

procedure TfrmBITabular.lbLinhaClickCheck(Sender: TObject);
var i:integer;
begin
  for i:=0 to lbLinha.Count-1 do
    if not lblinha.Selected[i] then
       lblinha.Checked[i] := false;
end;

procedure TfrmBITabular.lbColunaClickCheck(Sender: TObject);
var i:integer;
begin
  for i:=0 to lbColuna.Count-1 do
    if not lbColuna.Selected[i] then
       lbColuna.Checked[i] := false;
end;

procedure TfrmBITabular.CarregaCombo;
var bk:TBookmark; sAux:string;
begin
  //Ocupacao
  qyOcupacao.SQL.Text := 'select CD_OCUPACAO,DS_OCUPACAO from OCUPACAO';
  qyOcupacao.Active := true;
  while not qyOcupacao.Eof do
  begin
    bk := qyOcupacao.GetBookmark;
    sAux :=  qyOcupacao.FieldByName('DS_OCUPACAO').AsString;
    lstOcupacao.Items.AddObject(sAux,bk);
    qyOcupacao.Next;
  end;
  lstOcupacao.Items.Add('NIF');

  //Escolaridade
  qyEscolaridade.SQL.Text := 'select CD_CODIGO ,DS_DESCRICAO  from TABELA_AUXILIAR' +
    ' where CD_TABELA = 1';
  qyEscolaridade.Active := true;
  while not qyEscolaridade.Eof do
  begin
    bk := qyEscolaridade.GetBookmark;
    sAux :=  qyEscolaridade.FieldByName('DS_DESCRICAO').AsString;
    lstEscolaridade.Items.AddObject(sAux,bk);
    qyEscolaridade.Next;
  end;
  lstEscolaridade.Items.Add('NIF');

  //CarregaComboMesAno;
end;

function TfrmBITabular.DefineFiltro: String;
var i:integer; bk:TBookMark; lst:TStringList;
  sAux,sCond,sWhere,sDE,sATE:string;
  bNIF:boolean;
begin
  lst := TStringList.Create;
  try
    sWhere := ' where ';
    lst.Delimiter := ',';

    //OCUPACAO
    lst.Clear;
    bNIF := False;
    sCond := '';
    for i:=0 to lstOcupacao.Count-1 do
      if lstOcupacao.Checked[i] then
      begin
         if lstOcupacao.Items[i] = 'NIF' then
           bNIF := True
         else
         begin
           bk:=lstOcupacao.Items.Objects[i];
           qyOcupacao.GotoBookmark(bk);
           lst.Add(qyOcupacao.Fields[0].AsString);
         end;
      end;
    if (lst.DelimitedText<>'') then
       sCond := ' CC_OCUPACAO IN('+ lst.DelimitedText +')';
    if bNIF then
    begin
      if sCond <> '' then
       sCond := sCond + ' OR ';
      sCond := sCond + 'CC_OCUPACAO IS NULL';
    end;
    if (sCond <> '') then
    begin
      sAux := sAux + sWhere + '('+ sCond +')';
      sWhere := ' and ';
      lstFiltro.Add('OCUPACAO');
    end;

    //ESCOLARIDADE
    lst.Clear;
    bNIF := False;
    sCond := '';
    for i:=0 to lstEscolaridade.Count-1 do
      if lstEscolaridade.Checked[i] then
      begin
         if lstEscolaridade.Items[i] = 'NIF' then
           bNIF := True
         else
         begin
           bk:=lstEscolaridade.Items.Objects[i];
           qyEscolaridade.GotoBookmark(bk);
           lst.Add(qyEscolaridade.Fields[0].AsString);
         end;
      end;
    if (lst.DelimitedText<>'') then
       sCond := ' CC_ESCOLARIDADE IN('+ lst.DelimitedText +')';
    if bNIF then
    begin
      if sCond <> '' then
       sCond := sCond + ' OR ';
      sCond := sCond + 'CC_ESCOLARIDADE IS NULL';
    end;
    if (sCond <> '') then
    begin
      sAux := sAux + sWhere + '('+ sCond +')';
      sWhere := ' and ';
      lstFiltro.Add('ESCOLARIDADE');
    end;

    //SEXO
    lst.Clear;
    for i:=0 to lstSexo.Count-1 do
      if lstSexo.Checked[i] then
      begin
         case i of
          0: lst.Add('M');
          1: lst.Add('F');
          2: lst.Add('NIF');
         end;
      end;
    if lst.DelimitedText<>'' then
    begin
       sAux := sAux + sWhere + ' CC_SEXO IN('+
         FormataListaComAspas(lst.DelimitedText) +')';
       sWhere := ' and ';
       lstFiltro.Add('SEXO');
    end;

    //FAIXA ETARIA
    lst.Clear;
    for i:=0 to lstFaixaEtaria.Count-1 do
      if lstFaixaEtaria.Checked[i] then
         lst.Add(lstFaixaEtaria.Items[i]);
    if lst.DelimitedText<>'' then
    begin
       sAux := sAux + sWhere + ' FAIXA_ETARIA IN('+
         FormataListaComAspas(lst.DelimitedText) +')';
       sWhere := ' and ';
       lstFiltro.Add('FAIXA_ETARIA');
    end;

    //ESTADO CIVIL
    lst.Clear;
    bNIF := False;
    sCond := '';
    for i:=0 to lstEstadoCivil.Count-1 do
      if lstEstadoCivil.Checked[i] then
      begin
         case i of
          0..5: lst.Add(intToStr(i+1));
          6: bNIF:=True;
         end;
      end;
    if (lst.DelimitedText<>'') then
       sCond := 'CC_ESTADO_CIVIL IN('+
         FormataListaComAspas(lst.DelimitedText) +')';
    if bNIF then
    begin
      if sCond <> '' then
       sCond := sCond + ' OR ';
      sCond := sCond + 'CC_ESTADO_CIVIL IS NULL';
    end;
    if (sCond <> '') then
    begin
      sAux := sAux + sWhere + '('+ sCond +')';
      sWhere := ' and ';
      lstFiltro.Add('ESTADO_CIVIL');
    end;

    //ESTADIO CLINICO
    lst.Clear;
    bNIF := False;
    sCond := '';
    for i:=0 to lstEstadioClinico.Count-1 do
      if lstEstadioClinico.Checked[i] then
      begin
         case i of
          0..3: lst.Add(intToStr(i+1));
          4: bNIF:=True;
         end;
      end;
    if (lst.DelimitedText<>'') then
       sCond := 'CC_ESTADIO_CLINICO IN('+
         FormataListaComAspas(lst.DelimitedText) +')';
    if bNIF then
    begin
      if sCond <> '' then
       sCond := sCond + ' OR ';
      sCond := sCond + 'CC_ESTADIO_CLINICO IS NULL';
      sCond := sCond + ' OR CC_ESTADIO_CLINICO=0';
    end;
    if (sCond <> '') then
    begin
      sAux := sAux + sWhere + '('+ sCond +')';
      sWhere := ' and ';
      lstFiltro.Add('ESTADIO_CLINICO');
    end;

    //RELACOES SEXO
    lst.Clear;
    bNIF := False;
    sCond := '';
    for i:=0 to lstRelacoesSexo.Count-1 do
      if lstRelacoesSexo.Checked[i] then
      begin
         case i of
          0..2: lst.Add(intToStr(i+1));
          3: bNIF:=True;
         end;
      end;
    if (lst.DelimitedText<>'') then
       sCond := 'CC_RELACOES_SEXO IN('+
         FormataListaComAspas(lst.DelimitedText) +')';
    if bNIF then
    begin
      if sCond <> '' then
       sCond := sCond + ' OR ';
      sCond := sCond + 'CC_RELACOES_SEXO IS NULL';
      sCond := sCond + ' OR CC_RELACOES_SEXO=98';
    end;
    if (sCond <> '') then
    begin
      sAux := sAux + sWhere + '('+ sCond +')';
      sWhere := ' and ';
      lstFiltro.Add('RELACOES_SEXO');
    end;

    //EVIDENCIA GESTANTE
    lst.Clear;
    bNIF := False;
    sCond := '';
    for i:=0 to lstEvidenciaGestante.Count-1 do
      if lstEvidenciaGestante.Checked[i] then
      begin
         case i of
          0..3: lst.Add(intToStr(i+1));
          4: bNIF:=True;
         end;
      end;
    if (lst.DelimitedText<>'') then
       sCond := 'CC_EVIDENCIA_GESTANTE IN('+
         FormataListaComAspas(lst.DelimitedText) +')';
    if bNIF then
    begin
      if sCond <> '' then
       sCond := sCond + ' OR ';
      sCond := sCond + 'CC_EVIDENCIA_GESTANTE IS NULL';
    end;
    if (sCond <> '') then
    begin
      sAux := sAux + sWhere + '('+ sCond +')';
      sWhere := ' and ';
      lstFiltro.Add('EVIDENCIA_GESTANTE');
    end;

    //GESTANTE
    lst.Clear;
    bNIF := False;
    sCond := '';
    for i:=0 to lstGestante.Count-1 do
      if lstGestante.Checked[i] then
      begin
         case i of
          0..1: lst.Add(intToStr(i));
          2: bNIF:=True;
         end;
      end;
    if (lst.DelimitedText<>'') then
       sCond := 'CC_GESTANTE IN('+
         FormataListaComAspas(lst.DelimitedText) +')';
    if bNIF then
    begin
      if sCond <> '' then
       sCond := sCond + ' OR ';
      sCond := sCond + 'CC_GESTANTE IS NULL';
    end;
    if (sCond <> '') then
    begin
      sAux := sAux + sWhere + '('+ sCond +')';
      sWhere := ' and ';
      lstFiltro.Add('GESTANTE');
    end;

    //RESULTADO
    lst.Clear;
    bNIF := False;
    sCond := '';
    for i:=0 to lstResultado.Count-1 do
      if lstResultado.Checked[i] then
      begin
         case i of
          0..2: lst.Add(intToStr(i+1));
          3: bNIF:=True;
         end;
      end;
    if (lst.DelimitedText<>'') then
       sCond := 'CC_RESULTADO IN('+
         FormataListaComAspas(lst.DelimitedText) +')';
    if bNIF then
    begin
      if sCond <> '' then
       sCond := sCond + ' OR ';
      sCond := sCond + 'CC_RESULTADO IS NULL';
    end;
    if (sCond <> '') then
    begin
      sAux := sAux + sWhere + '('+ sCond +')';
      sWhere := ' and ';
      lstFiltro.Add('RESULTADO');
    end;

    //EVOLUCAO
    lst.Clear;
    bNIF := False;
    sCond := '';
    for i:=0 to lstEvolucao.Count-1 do
      if lstEvolucao.Checked[i] then
      begin
         case i of
          0..4: lst.Add(intToStr(i+1));
          5: bNIF:=True;
         end;
      end;
    if (lst.DelimitedText<>'') then
       sCond := 'CC_EVOLUCAO IN('+
         FormataListaComAspas(lst.DelimitedText) +')';
    if bNIF then
    begin
      if sCond <> '' then
       sCond := sCond + ' OR ';
      sCond := sCond + 'CC_EVOLUCAO IS NULL';
    end;
    if (sCond <> '') then
    begin
      sAux := sAux + sWhere + '('+ sCond +')';
      sWhere := ' and ';
      lstFiltro.Add('EVOLUCAO');
    end;

    //TB Anterior
    lst.Clear;
    bNIF := False;
    sCond := '';
    for i:=0 to lstTBAnterior.Count-1 do
      if lstTBAnterior.Checked[i] then
      begin
         case i of
          0..2: lst.Add(intToStr(i+1));
          3: bNIF:=True;
         end;
      end;
    if (lst.DelimitedText<>'') then
       sCond := 'CC_TB_ANTERIOR IN('+
         FormataListaComAspas(lst.DelimitedText) +')';
    if bNIF then
    begin
      if sCond <> '' then
       sCond := sCond + ' OR ';
      sCond := sCond + 'CC_TB_ANTERIOR IS NULL';
    end;
    if (sCond <> '') then
    begin
      sAux := sAux + sWhere + '('+ sCond +')';
      sWhere := ' and ';
      lstFiltro.Add('TB_ANTERIOR');
    end;

    //TB Atual
    lst.Clear;
    bNIF := False;
    sCond := '';
    for i:=0 to lstTBAtual.Count-1 do
      if lstTBAtual.Checked[i] then
      begin
         case i of
          0..2: lst.Add(intToStr(i+1));
          3: bNIF:=True;
         end;
      end;
    if (lst.DelimitedText<>'') then
       sCond := 'CC_TB_ATUAL IN('+
         FormataListaComAspas(lst.DelimitedText) +')';
    if bNIF then
    begin
      if sCond <> '' then
       sCond := sCond + ' OR ';
      sCond := sCond + 'CC_TB_ATUAL IS NULL';
    end;
    if (sCond <> '') then
    begin
      sAux := sAux + sWhere + '('+ sCond +')';
      sWhere := ' and ';
      lstFiltro.Add('TB_ATUAL');
    end;

    //TP Entrada
    lst.Clear;
    bNIF := False;
    sCond := '';
    for i:=0 to lstTPEntrada.Count-1 do
      if lstTPEntrada.Checked[i] then
      begin
         case i of
          0..3: lst.Add(intToStr(i+1));
          4: bNIF:=True;
         end;
      end;
    if (lst.DelimitedText<>'') then
       sCond := 'CC_TP_ENTRADA IN('+
         FormataListaComAspas(lst.DelimitedText) +')';
    if bNIF then
    begin
      if sCond <> '' then
       sCond := sCond + ' OR ';
      sCond := sCond + 'CC_TP_ENTRADA IS NULL';
    end;
    if (sCond <> '') then
    begin
      sAux := sAux + sWhere + '('+ sCond +')';
      sWhere := ' and ';
      lstFiltro.Add('TP_ENTRADA');
    end;

    //Teste Triagem
    lst.Clear;
    bNIF := False;
    sCond := '';
    for i:=0 to lstTesteTriagem.Count-1 do
      if lstTesteTriagem.Checked[i] then
      begin
         case i of
          0: lst.Add(intToStr(i+1));
          1: lst.Add('98');
          2: bNIF:=True;
         end;
      end;
    if (lst.DelimitedText<>'') then
       sCond := 'CC_TESTE_TRIAGEM IN('+
         FormataListaComAspas(lst.DelimitedText) +')';
    if bNIF then
    begin
      if sCond <> '' then
       sCond := sCond + ' OR ';
      sCond := sCond + 'CC_TESTE_TRIAGEM IS NULL';
    end;
    if (sCond <> '') then
    begin
      sAux := sAux + sWhere + '('+ sCond +')';
      sWhere := ' and ';
      lstFiltro.Add('TESTE_TRIAGEM');
    end;

    //Teste Confirmatorio
    lst.Clear;
    bNIF := False;
    sCond := '';
    for i:=0 to lstTesteConfirmatorio.Count-1 do
      if lstTesteConfirmatorio.Checked[i] then
      begin
         case i of
          0: lst.Add(intToStr(i+1));
          1: lst.Add('98');
          2: bNIF:=True;
         end;
      end;
    if (lst.DelimitedText<>'') then
       sCond := 'CC_TESTE_CONFIRMATORIO IN('+
         FormataListaComAspas(lst.DelimitedText) +')';
    if bNIF then
    begin
      if sCond <> '' then
       sCond := sCond + ' OR ';
      sCond := sCond + 'CC_TESTE_CONFIRMATORIO IS NULL';
    end;
    if (sCond <> '') then
    begin
      sAux := sAux + sWhere + '('+ sCond +')';
      sWhere := ' and ';
      lstFiltro.Add('TESTE_CONFIRMATORIO');
    end;

    //Tatuagem
    lst.Clear;
    bNIF := False;
    sCond := '';
    for i:=0 to lstTatuagem.Count-1 do
      if lstTatuagem.Checked[i] then
      begin
         case i of
          0: begin
               lst.Add('0');
               lst.Add('2');
             end;
          1: lst.Add('1');
          2: bNIF:=True;
         end;
      end;
    if (lst.DelimitedText<>'') then
       sCond := 'CC_TATUAGEM IN('+
         lst.DelimitedText +')';
    if bNIF then
    begin
      if sCond <> '' then
       sCond := sCond + ' OR ';
      sCond := sCond + 'CC_TATUAGEM IS NULL';
    end;
    if (sCond <> '') then
    begin
      sAux := sAux + sWhere + '('+ sCond +')';
      sWhere := ' and ';
      lstFiltro.Add('TATUAGEM');
    end;

    //Tratamento Tradicional
    lst.Clear;
    bNIF := False;
    sCond := '';
    for i:=0 to lstTradicional.Count-1 do
      if lstTradicional.Checked[i] then
      begin
         case i of
          0: begin
               lst.Add('0');
               lst.Add('2');
             end;
          1: lst.Add('1');
          2: bNIF:=True;
         end;
      end;
    if (lst.DelimitedText<>'') then
       sCond := 'CC_TRATAMENTO_TRADICIONAL IN('+
         lst.DelimitedText +')';
    if bNIF then
    begin
      if sCond <> '' then
       sCond := sCond + ' OR ';
      sCond := sCond + 'CC_TRATAMENTO_TRADICIONAL IS NULL';
    end;
    if (sCond <> '') then
    begin
      sAux := sAux + sWhere + '('+ sCond +')';
      sWhere := ' and ';
      lstFiltro.Add('TRATAMENTO_TRADICIONAL');
    end;

    //Tratamento Dentario
    lst.Clear;
    bNIF := False;
    sCond := '';
    for i:=0 to lstDentario.Count-1 do
      if lstDentario.Checked[i] then
      begin
         case i of
          0: begin
               lst.Add('0');
               lst.Add('2');
             end;
          1: lst.Add('1');
          2: bNIF:=True;
         end;
      end;
    if (lst.DelimitedText<>'') then
       sCond := 'CC_TRATAMENTO_DENTARIO IN('+
         lst.DelimitedText +')';
    if bNIF then
    begin
      if sCond <> '' then
       sCond := sCond + ' OR ';
      sCond := sCond + 'CC_TRATAMENTO_DENTARIO IS NULL';
    end;
    if (sCond <> '') then
    begin
      sAux := sAux + sWhere + '('+ sCond +')';
      sWhere := ' and ';
      lstFiltro.Add('TRATAMENTO_DENTARIO');
    end;

    //Intervencao Cirurgica
    lst.Clear;
    bNIF := False;
    sCond := '';
    for i:=0 to lstCirurgica.Count-1 do
      if lstCirurgica.Checked[i] then
      begin
         case i of
          0: begin
               lst.Add('0');
               lst.Add('2');
             end;
          1: lst.Add('1');
          2: bNIF:=True;
         end;
      end;
    if (lst.DelimitedText<>'') then
       sCond := 'CC_INTERVENCAO_CIRURGICA IN('+
         lst.DelimitedText +')';
    if bNIF then
    begin
      if sCond <> '' then
       sCond := sCond + ' OR ';
      sCond := sCond + 'CC_INTERVENCAO_CIRURGICA IS NULL';
    end;
    if (sCond <> '') then
    begin
      sAux := sAux + sWhere + '('+ sCond +')';
      sWhere := ' and ';
      lstFiltro.Add('INTERVENCAO_CIRURGICA');
    end;

    //Circuncisao
    lst.Clear;
    bNIF := False;
    sCond := '';
    for i:=0 to lstCircuncisao.Count-1 do
      if lstCircuncisao.Checked[i] then
      begin
         case i of
          0: begin
               lst.Add('0');
               lst.Add('2');
             end;
          1: lst.Add('1');
          2: bNIF:=True;
         end;
      end;
    if (lst.DelimitedText<>'') then
       sCond := 'CC_CIRCUNCISAO IN('+
         lst.DelimitedText +')';
    if bNIF then
    begin
      if sCond <> '' then
       sCond := sCond + ' OR ';
      sCond := sCond + 'CC_CIRCUNCISAO IS NULL';
    end;
    if (sCond <> '') then
    begin
      sAux := sAux + sWhere + '('+ sCond +')';
      sWhere := ' and ';
      lstFiltro.Add('CIRCUNCISAO');
    end;

    //Acidente Biologico
    lst.Clear;
    bNIF := False;
    sCond := '';
    for i:=0 to lstAcidente.Count-1 do
      if lstAcidente.Checked[i] then
      begin
         case i of
          0: begin
               lst.Add('0');
               lst.Add('2');
             end;
          1: lst.Add('1');
          2: bNIF:=True;
         end;
      end;
    if (lst.DelimitedText<>'') then
       sCond := 'CC_ACIDENTE_BIOLOGICO IN('+
         lst.DelimitedText +')';
    if bNIF then
    begin
      if sCond <> '' then
       sCond := sCond + ' OR ';
      sCond := sCond + 'CC_ACIDENTE_BIOLOGICO IS NULL';
    end;
    if (sCond <> '') then
    begin
      sAux := sAux + sWhere + '('+ sCond +')';
      sWhere := ' and ';
      lstFiltro.Add('ACIDENTE_BIOLOGICO');
    end;

    //Droga
    lst.Clear;
    bNIF := False;
    sCond := '';
    for i:=0 to lstDroga.Count-1 do
      if lstDroga.Checked[i] then
      begin
         case i of
          0: begin
               lst.Add('0');
               lst.Add('2');
             end;
          1: lst.Add('1');
          2: bNIF:=True;
         end;
      end;
    if (lst.DelimitedText<>'') then
       sCond := 'CC_DROGA_INJETAVEL IN('+
         lst.DelimitedText +')';
    if bNIF then
    begin
      if sCond <> '' then
       sCond := sCond + ' OR ';
      sCond := sCond + 'CC_DROGA_INJETAVEL IS NULL OR CC_DROGA_INJETAVEL=98';
    end;
    if (sCond <> '') then
    begin
      sAux := sAux + sWhere + '('+ sCond +')';
      sWhere := ' and ';
      lstFiltro.Add('DROGA_INJETAVEL');
    end;

    //Transfusao Sangue
    lst.Clear;
    bNIF := False;
    sCond := '';
    for i:=0 to lstTransfusao.Count-1 do
      if lstTransfusao.Checked[i] then
      begin
         case i of
          0: begin
               lst.Add('0');
               lst.Add('2');
             end;
          1: lst.Add('1');
          2: bNIF:=True;
         end;
      end;
    if (lst.DelimitedText<>'') then
       sCond := 'CC_TRANSFUSAO_SANGUE IN('+
         lst.DelimitedText +')';
    if bNIF then
    begin
      if sCond <> '' then
       sCond := sCond + ' OR ';
      sCond := sCond + 'CC_TRANSFUSAO_SANGUE IS NULL';
    end;
    if (sCond <> '') then
    begin
      sAux := sAux + sWhere + '('+ sCond +')';
      sWhere := ' and ';
      lstFiltro.Add('TRANSFUSAO_SANGUE');
    end;

    //Transmissao Vertical
    lst.Clear;
    bNIF := False;
    sCond := '';
    for i:=0 to lstTransmissaoVertical.Count-1 do
      if lstTransmissaoVertical.Checked[i] then
      begin
         case i of
          0: begin
               lst.Add('0');
               lst.Add('2');
             end;
          1: lst.Add('1');
          2: bNIF:=True;
         end;
      end;
    if (lst.DelimitedText<>'') then
       sCond := 'CC_TRANSMISSAO_VERTICAL IN('+
         lst.DelimitedText +')';
    if bNIF then
    begin
      if sCond <> '' then
       sCond := sCond + ' OR ';
      sCond := sCond + 'CC_TRANSMISSAO_VERTICAL IS NULL';
    end;
    if (sCond <> '') then
    begin
      sAux := sAux + sWhere + '('+ sCond +')';
      sWhere := ' and ';
      lstFiltro.Add('TRANSMISSAO_VERTICAL');
    end;

    //Provincia
    sCond := '';
    if (btLocProvincia.Text <> '') then
      sCond := 'CC_PROVINCIA = ' + btLocProvincia.Text;
    if (sCond <> '') then
    begin
      sAux := sAux + sWhere + '('+ sCond +')';
      sWhere := ' and ';
      lstFiltro.Add('PROVINCIA');
    end;

    //Municipio
    sCond := '';
    if (btLocMunicipio.Text <> '') then
      sCond := 'CC_MUNICIPIO = ' + btLocMunicipio.Text;
    if (sCond <> '') then
    begin
      sAux := sAux + sWhere + '('+ sCond +')';
      sWhere := ' and ';
      lstFiltro.Add('MUNICIPIO');
    end;

    //Unidade
    sCond := '';
    if (btLocUnidade.Text <> '') then
      sCond := 'CC_UNIDADE = ' + btLocUnidade.Text;
    if (sCond <> '') then
    begin
      sAux := sAux + sWhere + '('+ sCond +')';
      sWhere := ' and ';
      lstFiltro.Add('UNIDADE');
    end;

    //MesAno
    sCond := '';
    if (dtDE.Text <> '  /  /    ')and(dtate.Text <> '  /  /    ') then
    begin
       //sDE := Copy(cbMesAnoDe.Text,1,2) + '-01-' + Copy(cbMesAnoDe.Text,4,4);
       //sATE := Copy(cbMesAnoAte.Text,1,2) + '-30-' + Copy(cbMesAnoAte.Text,4,4);
       sDE := FormatDateTime('mm-dd-yyyy',dtDe.DATE);
       sAtE := FormatDateTime('mm-dd-yyyy',dtAte.DATE);
       sCond := '(CC_DATA BETWEEN ' + QuotedStr(sDe) + ' AND' +
            QuotedStr(sAte) + ')';
    end;
    if (sCond <> '') then
    begin
      sAux := sAux + sWhere + '('+ sCond +')';
      sWhere := ' and ';
      lstFiltro.Add('MESANO');
    end;

    result  := sAux;
  finally
    FreeAndNil(lst);
  end;
end;

function TfrmBITabular.FormataListaComAspas(sLista: string): string;
var
  s1, s2: TStringList;
  i: integer;
begin
  // O texto passado como parâmetro devem ter seus campos entre aspas e
  // separados por vírgula
  result := '';
  s1 := TStringList.Create;
  s2 := TStringList.Create;
  try
    s1.CommaText := sLista;
    for i := 0 to s1.Count - 1 do
      s2.add(QuotedStr(s1.Strings[i]));
    result := s2.CommaText;
  finally
    FreeAndNil(s1);
    FreeAndNil(s2);
  end;
end;

function TfrmBITabular.MontaSQLNotificacao: string;
var i,x:integer; lst, sSQL, sFROM, sWHERE:TStringlist;
begin
  lst := TStringlist.Create;
  sSQL := TStringlist.Create;
  sFROM := TStringlist.Create;
  sWHERE := TStringlist.Create;
  try

    lst.Text := lstFiltro.Text;

    for i:=0 to lbLinha.Items.Count-1 do
      if lbLinha.Checked[i] then
        if not Existe(lbLinha.Items[i],lst) then
          lst.Add(lbLinha.Items[i]);

    for i:=0 to lbColuna.Items.Count-1 do
      if lbColuna.Checked[i] then
        if not Existe(lbColuna.Items[i],lst) then
          lst.Add(lbColuna.Items[i]);

    sSQL.Add('SELECT');
//' N.CD_UND CC_UND,                              '+chr(13)+
    for i:=0 to lst.Count-1 do
    begin
      if i>0 then
        sSQL.Text := sSQL.Text + ',';

      if lst.Strings[i]='QUANTIDADE' then
        sSQL.Add('''NR.'' QUANTIDADE');

      if lst.Strings[i]='CD4' then
        sSQL.Add('N.CD_CD4 CD4');

      if lst.Strings[i]='CC_PROVINCIA' then
        sSQL.Add('N.CD_PROVINCIA_NOT CC_PROVINCIA');

      if lst.Strings[i]='CC_MUNICIPIO' then
        sSQL.Add('N.CD_MUNICIPIO CC_MUNICIPIO');

      if lst.Strings[i]='CC_UNIDADE' then
        sSQL.Add('N.CD_UNIDADE CC_UNIDADE');

      if lst.Strings[i]='DATA' then
        sSQL.Add('EXTRACT (day FROM DT_NOTIFICACAO)||''/''||'+
                 'EXTRACT (month FROM DT_NOTIFICACAO)||''/''||'+
                 'EXTRACT (year FROM DT_NOTIFICACAO) AS DATA');

      if lst.Strings[i]='MESANO' then
      begin
          sSQL.Add('(TRIM(SUBSTRING(CAST(DT_NOTIFICACAO AS VARCHAR(10)) FROM 6 FOR 2)||''/''||' +
                   'SUBSTRING(CAST(DT_NOTIFICACAO AS VARCHAR(10)) FROM 1 FOR 4))) MESANO,');
          sSQL.Add('DT_NOTIFICACAO AS CC_DATA');
      end;

      if lst.Strings[i]='OCUPACAO' then
      begin
        sSQL.Add('N.CD_OCUPACAO CC_OCUPACAO,');
        sSQL.Add('O.DS_OCUPACAO OCUPACAO');
        sFrom.Add('LEFT OUTER JOIN OCUPACAO O ON');
        sFrom.Add('O.CD_OCUPACAO = N.CD_OCUPACAO');
        //sFrom.Add('AND O.CD_UND = N.CD_UND');
      end;

      if lst.Strings[i]='UNIDADE' then
      begin
        sSQL.Add('U.DS_UNIDADE   UNIDADE,');
        sSQL.Add('N.CD_UNIDADE   CC_UNIDADE');
        sFrom.Add('LEFT OUTER JOIN UNIDADE U ON');
        sFrom.Add('U.CD_UNIDADE = N.CD_UNIDADE');
        //sFrom.Add('AND U.CD_UND = N.CD_UND');
      end;

      if lst.Strings[i]='MUNICIPIO' then
      begin
        sSQL.Add('N.CD_MUNICIPIO CC_MUNICIPIO,');
        sSQL.Add('M.DS_MUNICIPIO MUNICIPIO');
        sFrom.Add('LEFT OUTER JOIN MUNICIPIO M ON');
        sFrom.Add('M.CD_MUNICIPIO = N.CD_MUNICIPIO');
        //sFrom.Add('AND M.CD_UND = N.CD_UND');
      end;

      if lst.Strings[i]='PROVINCIA' then
      begin
        sSQL.Add('N.CD_PROVINCIA_NOT CC_PROVINCIA,');
        sSQL.Add('P.DS_PROVINCIA PROVINCIA');
        sFrom.Add('LEFT OUTER JOIN PROVINCIA P ON');
        sFrom.Add('P.CD_PROVINCIA = N.CD_PROVINCIA_NOT');
        //sFrom.Add('AND P.CD_UND = N.CD_UND');
      end;

      if lst.Strings[i]='UNIDADE_TRATAMENTO' then
      begin
        sSQL.Add('U2.DS_UNIDADE UNIDADE_TRATAMENTO,');
        sSQL.Add('N.CD_UNIDADE_TRATAMENTO CC_UNIDADE_TRATAMENTO');
        sFrom.Add('LEFT OUTER JOIN UNIDADE U2 ON');
        sFrom.Add('U2.CD_UNIDADE = N.CD_UNIDADE_TRATAMENTO');
        //sFrom.Add('AND U2.CD_UND = N.CD_UND');
      end;

      if lst.Strings[i]='MUNICIPIO_TRATAMENTO' then
      begin
        sSQL.Add('N.CD_MUNICIPIO_TRATAMENTO CC_MUNICIPIO_TRATAMENTO,');
        sSQL.Add('M2.DS_MUNICIPIO MUNICIPIO_TRATAMENTO');
        sFrom.Add('LEFT OUTER JOIN MUNICIPIO M2 ON');
        sFrom.Add('M2.CD_MUNICIPIO = N.CD_MUNICIPIO_TRATAMENTO');
        //sFrom.Add('AND M2.CD_UND = N.CD_UND');
      end;

      if lst.Strings[i]='INVESTIGADOR' then
      begin
        sSQL.Add('I.NM_INVESTIGADOR INVESTIGADOR');
        sFrom.Add('LEFT OUTER JOIN INVESTIGADOR I ON');
        sFrom.Add('N.CD_INVESTIGADOR = I.CD_INVESTIGADOR');
        //sFrom.Add('AND C.CD_UND = I.CD_UND');
      end;

      if lst.Strings[i]='MEDICO' then
      begin
        sSQL.Add('N.CD_MEDICO CC_MEDICO,');
        sSQL.Add('ME.NM_MEDICO MEDICO');
        sFrom.Add('LEFT OUTER JOIN MEDICO ME ON');
        sFrom.Add('ME.CD_MEDICO = N.CD_MEDICO');
        //sFrom.Add('AND ME.CD_UND = N.CD_UND');
      end;

      if lst.Strings[i]='RELACOES_SEXO' then
      begin
        sSQL.Add('N.CD_RELACOES_SEXO CC_RELACOES_SEXO,');
        sSQL.Add(sSQLRELACOES_SEXO);
      end;

      if lst.Strings[i]='TRANSMISSAO_VERTICAL' then
      begin
        sSQL.Add('N.CD_MAE_POSITIVO CC_TRANSMISSAO_VERTICAL,');
        sSQL.Add(sSQLTRANSMISSAO_VERTICAL);
      end;

      if lst.Strings[i]='DROGA_INJETAVEL' then
      begin
        sSQL.Add('N.CD_USOU_DROGA CC_DROGA_INJETAVEL,');
        sSQL.Add(sSQLDROGA_INJETAVEL);
      end;

      if lst.Strings[i]='ACIDENTE_BIOLOGICO' then
      begin
        sSQL.Add('N.CD_ACIDENTE_MAT_BIO CC_ACIDENTE_BIOLOGICO,');
        sSQL.Add(sSQLACIDENTE_BIOLOGICO);
      end;

      if lst.Strings[i]='EVOLUCAO' then
      begin
        sSQL.Add('N.CD_EVOLUCAO CC_EVOLUCAO,');
        sSQL.Add(sSQLEVOLUCAO);
      end;

      if lst.Strings[i]='TRANSFUSAO_SANGUE' then
      begin
        sSQL.Add('N.SN_TRANSFUSAO_SANGUE CC_TRANSFUSAO_SANGUE,');
        sSQL.Add(sSQLTRANSFUSAO_SANGUE);
      end;

      if lst.Strings[i]='TRATAMENTO_TRADICIONAL' then
      begin
        sSQL.Add('N.SN_PERFURACAO CC_TRATAMENTO_TRADICIONAL,');
        sSQL.Add(sSQLTRATAMENTO_TRADICIONAL);
      end;

      if lst.Strings[i]='TRATAMENTO_DENTARIO' then
      begin
        sSQL.Add('N.SN_TRAT_DENTARIO CC_TRATAMENTO_DENTARIO,');
        sSQL.Add(sSQLTRATAMENTO_DENTARIO);
      end;

      if lst.Strings[i]='INTERVENCAO_CIRURGICA' then
      begin
        sSQL.Add('N.SN_INTERV_CIRURGICA CC_INTERVENCAO_CIRURGICA,');
        sSQL.Add(sSQLINTERVENCAO_CIRURGICA);
      end;

      if lst.Strings[i]='CIRCUNCISAO' then
      begin
        sSQL.Add('N.SN_CIRCUNCISAO CC_CIRCUNCISAO,');
        sSQL.Add(sSQLCIRCUNCISAO);
      end;

      if lst.Strings[i]='TESTE_TRIAGEM' then
      begin
        sSQL.Add('N.CD_TESTE_TRIAGEM CC_TESTE_TRIAGEM,');
        sSQL.Add(sSQLTESTE_TRIAGEM);
      end;

      if lst.Strings[i]='TESTE_CONFIRMATORIO' then
      begin
        sSQL.Add('N.CD_TESTE_CONFIRMATORIO CC_TESTE_CONFIRMATORIO,');
        sSQL.Add(sSQLTESTE_CONFIRMATORIO);
      end;

      if lst.Strings[i]='ESTADIO_CLINICO' then
      begin
        sSQL.Add('N.CD_OMS CC_ESTADIO_CLINICO,');
        sSQL.Add(sSQLOMS);
      end;

      if lst.Strings[i]='TATUAGEM' then
      begin
        sSQL.Add('N.SN_TATUAGEM CC_TATUAGEM,');
        sSQL.Add(sSQLTATUAGEM);
      end;

      if lst.Strings[i]='EVIDENCIA_GESTANTE' then
      begin
        sSQL.Add('N.EVIDENCIA_GESTANTE CC_EVIDENCIA_GESTANTE,');
        sSQL.Add(sSQLEVIDENCIA_GESTANTE);
      end;

      if lst.Strings[i]='TB_ATUAL' then
      begin
        sSQL.Add('N.TB_ATUAL CC_TB_ATUAL,');
        sSQL.Add(sSQLTB_ATUAL);
      end;

      if lst.Strings[i]='TB_ANTERIOR' then
      begin
        sSQL.Add('N.TB_ATUAL CC_TB_ANTERIOR,');
        sSQL.Add(sSQLTB_ANTERIOR);
      end;

      if lst.Strings[i]='TP_ENTRADA' then
      begin
        sSQL.Add('N.TP_ENTRADA CC_TP_ENTRADA,');
        sSQL.Add(sSQLTP_ENTRADA);
      end;

      if lst.Strings[i]='ESCOLARIDADE' then
      begin
        sSQL.Add('TRIM(TA1.DS_DESCRICAO)ESCOLARIDADE,');
        sSQL.Add('P2.CD_ESCOLARIDADE CC_ESCOLARIDADE');
        sFrom.Add('LEFT OUTER JOIN TABELA_AUXILIAR TA1 ON');
        sFrom.Add('P2.CD_ESCOLARIDADE = TA1.CD_CODIGO');
        sFrom.Add('AND TA1.CD_TABELA = 1');
      end;

      if lst.Strings[i]='ESTADO_CIVIL' then
      begin
        sSQL.Add('P2.ESTADO_CIVIL CC_ESTADO_CIVIL,');
        sSQL.Add(sSQLESTADO_CIVIL);
      end;

      if lst.Strings[i]='SEXO' then
      begin
        sSQL.Add('P2.TP_SEXO CC_SEXO,');
        sSQL.Add(sSQLSEXO);
      end;

      if lst.Strings[i]='GESTANTE' then
      begin
        sSQL.Add('P2.FL_GESTANTE CC_GESTANTE,');
        sSQL.Add(sSQLGESTANTE);
      end;

      if lst.Strings[i]='RESULTADO' then
      begin
        sSQL.Add('P2.FL_RESULTADO CC_RESULTADO,');
        sSQL.Add(sSQLRESULTADO);
      end;

      if lst.Strings[i]='FAIXA_ETARIA' then
        sSQL.Add(sSQLFAIXA_ETARIA);
    end;

    sSQL.Add('FROM NOTIFICACAO N');
    sSQL.Add(' LEFT OUTER JOIN PACIENTE P2 ON');
    sSQL.Add(' P2.CD_PACIENTE = N.CD_PACIENTE');
//    sSQL.Add(' AND P2.CD_UND = N.CD_UND');
    sSQL.Add(sFrom.Text);
    result := sSQL.Text;
  finally
    lstFiltro.Clear;
    FreeAndNil(lst);
    FreeAndNil(sSQL);
    FreeAndNil(sFROM);
    FreeAndNil(sWHERE);
  end;
end;

procedure TfrmBITabular.CarregaComboMesAno;
var data:TDate; i:integer;
begin
  data := dm.GetDateTime;
  cbMesAnoDe.Items.Add(FormatDateTime('mm/yyyy',data));
  cbMesAnoAte.Items.Add(FormatDateTime('mm/yyyy',data));
  for i:= 1 to 11 do
    cbMesAnoDe.Items.Add(FormatDateTime('mm/yyyy',IncMonth(data,-i)));

  cbMesAnoAte.Items.Text := cbMesAnoDe.Items.Text;
end;

procedure TfrmBITabular.btLocProvinciaButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
begin
  frmLocalizar := TfrmLocalizar.Create(application);
  frmLocalizar.Caption := 'Localizar Provincia';
  frmLocalizar.qyDados := SelectDadosProvincia;
  try
    frmLocalizar.Where := false;
    SetLength(VCampo,2);
    frmLocalizar.KeyField := 'cd_provincia';
    VCampo[0].Titulo  := 'Cód.';
    VCampo[0].Width := 5;
    VCampo[1].Titulo  := 'Provincia';
    VCampo[1].Width := 25;
    VCampo[0].Visivel := True;
    VCampo[1].Visivel := True;
  except
    ShowMessage(frmLocalizar.qyDados.Sql.Text);
  end;
  if frmLocalizar.ShowModal=mrok then
  begin
    btLocProvincia.text := frmLocalizar.qyDados.FieldByname('cd_provincia').AsString;
    edProvincia.text := frmLocalizar.qyDados.FieldByname('ds_provincia').AsString;
    btLocMunicipio.Clear;
    edMunicipio.Clear;
    btLocUnidade.Clear;
    edUnidade.Clear;
  end;
  frmLocalizar.qyDados.Close;
  frmLocalizar.Free;
end;

procedure TfrmBITabular.btLocMunicipioButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
begin
  frmLocalizar := TfrmLocalizar.Create(application);
  frmLocalizar.Caption := 'Localizar Município';
  try
    if (btLocProvincia.Text<>'')then
    begin
      frmLocalizar.qyDados := SelectDadosMunicipio(strToInt(btLocProvincia.Text));
      frmLocalizar.Where := true;
    end;
    SetLength(VCampo,2);
    frmLocalizar.KeyField := 'cd_municipio';
    VCampo[0].Titulo  := 'Cód.';
    VCampo[0].Width := 5;
    VCampo[1].Titulo  := 'Município';
    VCampo[1].Width := 25;
    VCampo[0].Visivel := True;
    VCampo[1].Visivel := True;
  except
    ShowMessage(frmLocalizar.qyDados.Sql.Text);
  end;
  if frmLocalizar.ShowModal=mrok then
  begin
    btLocMunicipio.text := frmLocalizar.qyDados.FieldByname('cd_municipio').AsString;
    edMunicipio.text := frmLocalizar.qyDados.FieldByname('ds_municipio').AsString;
  end;
  frmLocalizar.qyDados.Close;
  frmLocalizar.Free;
end;

procedure TfrmBITabular.btLocUnidadeButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
begin
  frmLocalizar := TfrmLocalizar.Create(application);
  frmLocalizar.Caption := 'Localizar Unidade';
  frmLocalizar.qyDados := SelectDadosUnidade(strToInt(btLocProvincia.Text));

  try
    frmLocalizar.Where := false;
    SetLength(VCampo,2);
    frmLocalizar.KeyField := 'cd_unidade';
    VCampo[0].Titulo  := 'Cód.';
    VCampo[0].Width := 5;
    VCampo[1].Titulo  := 'Unidade';
    VCampo[1].Width := 25;
    VCampo[0].Visivel := True;
    VCampo[1].Visivel := True;
  except
    ShowMessage(frmLocalizar.qyDados.Sql.Text);
  end;
  if frmLocalizar.ShowModal=mrok then
  begin
    btLocUnidade.Text := frmLocalizar.qyDados.FieldByname('cd_unidade').AsString;
    edUnidade.Text := frmLocalizar.qyDados.FieldByname('ds_unidade').AsString;
  end;
  frmLocalizar.qyDados.Close;
  frmLocalizar.Free;
end;

procedure TfrmBITabular.btLocProvinciaChange(Sender: TObject);
begin
  if btLocProvincia.Text = '' then
    edProvincia.Clear
  else if btLocProvincia.Modified then
  begin
    try
      edProvincia.Text := PegaValor('DS_PROVINCIA','PROVINCIA',['CD_PROVINCIA'],
        [btLocProvincia.Text]);
    except
      begin
        edProvincia.Clear;
      end;
    end;
    btLocMunicipio.Clear;
    edMunicipio.Clear;
  end;
end;

procedure TfrmBITabular.btLocProvinciaExit(Sender: TObject);
begin
  if btLocProvincia.Text <> '' then
  begin
    try
      edProvincia.Text := PegaValor('DS_PROVINCIA','PROVINCIA',['CD_PROVINCIA'],
        [btLocProvincia.Text]);
    except
      begin
        MessageDlg('Provincia não encontrada!',mtWarning,[mbOK],0);
        btLocProvincia.Clear;
        edProvincia.Clear;
      end;
    end;
  end;
end;

procedure TfrmBITabular.btLocUnidadeChange(Sender: TObject);
begin
  if btLocUnidade.Text = '' then
    edUnidade.Clear
  else if btLocUnidade.Modified then
  begin
    try
      edUnidade.Text := PegaValor('DS_UNIDADE','UNIDADE',['CD_UNIDADE'],
        [btLocUnidade.Text]);
    except
      begin
        edUnidade.Clear;
      end;
    end;
  end;
end;

procedure TfrmBITabular.btLocUnidadeExit(Sender: TObject);
begin
  if btLocUnidade.Text <> '' then
  begin
    try
      edUnidade.Text := PegaValor('DS_UNIDADE','UNIDADE',['CD_UNIDADE'],
        [btLocUnidade.Text]);
    except
      begin
        MessageDlg('Unidade não encontrada!',mtWarning,[mbOK],0);
        btLocUnidade.Clear;
        edUnidade.Clear;
      end;
    end;
  end;
end;

procedure TfrmBITabular.btLocMunicipioExit(Sender: TObject);
begin
  if btLocMunicipio.Text <> '' then
    begin
        try
          edMunicipio.Text := PegaValor('DS_MUNICIPIO','MUNICIPIO',['CD_MUNICIPIO'],
            [btLocMunicipio.Text]);
         except
            begin
              MessageDlg('Municipio não encontrado!',mtWarning,[mbOK],0);
              btLocMunicipio.Clear;
              edMunicipio.Clear;
            end;
         end;
    end;
end;

procedure TfrmBITabular.btLocMunicipioChange(Sender: TObject);
begin
  if btLocMunicipio.Text = '' then
    edMunicipio.Clear
  else if btLocMunicipio.Modified then
  begin
    if btLocProvincia.text <> '' then
    begin
      try
        edMunicipio.Text := PegaValor('DS_MUNICIPIO','MUNICIPIO',['CD_MUNICIPIO'],
          [btLocMunicipio.Text]);
       except
          begin
            edMunicipio.Clear;
          end;
       end;
      end
    else
      begin
        btLocMunicipio.Clear;
        edMunicipio.Clear;
        MessageDlg('É necessário incluir uma Provincia!',mtInformation,[mbOK],0);
      end;
  end;
end;

procedure TfrmBITabular.tabFiltrosMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  if (ssshift in Shift) and (ssCtrl in shift) then
  begin
    memo4.Visible := not memo4.Visible;
    if nTipoBI in ([cNotificacao, cAgenda]) then
      memo4.Parent := tabFiltros
    else
      memo4.Parent := tabFiltroCaract;
  end;
end;

procedure TfrmBITabular.CarregaCampos;
var i:integer;
begin
  lbLinha.Clear;

  //Campos Paciente
  if (cbIndicador.Text <> 'CARACTERIZACAO')  then
    for i:= Low(cCamposPaciente) to High(cCamposPaciente) do
      lbLinha.items.Add(cCamposPaciente[i]);

  //Campos Notificacao
  if (cbIndicador.Text = 'NOTIFICACAO')  then
  begin
    nTipoBI := cNotificacao;
    for i:= Low(cCamposNotificacao) to High(cCamposNotificacao) do
      lbLinha.items.Add(cCamposNotificacao[i]);
  end
  //Campos Agenda
  else if (cbIndicador.Text = 'AGENDA')  then
  begin
    nTipoBI := cAgenda;
    for i:= Low(cCamposAgenda) to High(cCamposAgenda) do
      lbLinha.items.Add(cCamposAgenda[i]);
  end
  //Campos Caracterizacao
  else if (cbIndicador.Text = 'CARACTERIZACAO')  then
  begin
    nTipoBI := cCaracterizacao;
    for i:= Low(cCamposCaracterizacao) to High(cCamposCaracterizacao) do
      lbLinha.items.Add(cCamposCaracterizacao[i]);
  end;

  lbColuna.items := lbLinha.items;
  lbColuna.Sorted := true;
  lbLinha.Sorted := true;

  lbColuna.Checked[0]:=true;
  lbLinha.Checked[0]:=true;

  HabilitaFiltros;
end;

procedure TfrmBITabular.cbIndicadorChange(Sender: TObject);
begin
  CarregaCampos;
  LimpaFiltros;
end;

function TfrmBITabular.MontaSQLAgenda: string;
var i,x:integer; lst, sSQL, sFROM, sWHERE:TStringlist;
begin
  lst := TStringlist.Create;
  sSQL := TStringlist.Create;
  sFROM := TStringlist.Create;
  sWHERE := TStringlist.Create;
  try

    lst.Text := lstFiltro.Text;

    for i:=0 to lbLinha.Items.Count-1 do
      if lbLinha.Checked[i] then
        if not Existe(lbLinha.Items[i],lst) then
          lst.Add(lbLinha.Items[i]);

    for i:=0 to lbColuna.Items.Count-1 do
      if lbColuna.Checked[i] then
        if not Existe(lbColuna.Items[i],lst) then
          lst.Add(lbColuna.Items[i]);

    sSQL.Add('SELECT');
//' N.CD_UND CC_UND,                              '+chr(13)+
    for i:=0 to lst.Count-1 do
    begin
      if (i>0) and (sSQL.Count>1) then
        sSQL.Text := sSQL.Text + ',';

      if lst.Strings[i]='QUANTIDADE' then
        sSQL.Add('''NR.'' QUANTIDADE');

      if lst.Strings[i]='CD4' then
        sSQL.Add('A.VL_CD4 CD4');

      if lst.Strings[i]='ESQUEMA' then
        sSQL.Add('A.DS_ESQUEMA ESQUEMA');

      if lst.Strings[i]='DATA' then
        sSQL.Add('EXTRACT (day FROM DT_AGENDA)||''/''||'+
                 'EXTRACT (month FROM DT_AGENDA)||''/''||'+
                 'EXTRACT (year FROM DT_AGENDA) AS DATA');

      if lst.Strings[i]='MESANO' then
      begin
        sSQL.Add('(TRIM(SUBSTRING(CAST(A.DT_AGENDA AS VARCHAR(24)) FROM 6 FOR 2)||''/''||' +
                 'SUBSTRING(CAST(A.DT_AGENDA AS VARCHAR(24)) FROM 1 FOR 4))) MESANO,');
        sSQL.Add('A.DT_AGENDA AS CC_DATA');
      end;

{     if lst.Strings[i]='UNIDADE_TRATAMENTO' then
      begin
        sSQL.Add('U2.DS_UNIDADE   UNIDADE_TRATAMENTO,');
        sSQL.Add('A.CD_UNIDADE   CC_UNIDADE_TRATAMENTO');
        sFrom.Add('LEFT OUTER JOIN UNIDADE U2 ON');
        sFrom.Add('U2.CD_UNIDADE = A.CD_UNIDADE');
        //sFrom.Add('AND U2.CD_UND = A.CD_UND');
      end;
}
      if lst.Strings[i]='UNIDADE' then
      begin
        sSQL.Add('U.DS_UNIDADE   UNIDADE,');
        sSQL.Add('A.CD_UNIDADE   CC_UNIDADE');
        sFrom.Add('LEFT OUTER JOIN UNIDADE U ON');
        sFrom.Add('U.CD_UNIDADE = P2.CD_UND');
      end;

      if lst.Strings[i]='MUNICIPIO' then
      begin
        sSQL.Add('P2.CD_MUNICIPIO CC_MUNICIPIO,');
        sSQL.Add('M.DS_MUNICIPIO MUNICIPIO');
        sFrom.Add('LEFT OUTER JOIN MUNICIPIO M ON');
        sFrom.Add('M.CD_MUNICIPIO = P2.CD_MUNICIPIO');
        //sFrom.Add('AND M.CD_UND = P2.CD_UND');
      end;

      if lst.Strings[i]='PROVINCIA' then
      begin
        sSQL.Add('P2.CD_PROVINCIA CC_PROVINCIA,');
        sSQL.Add('P.DS_PROVINCIA PROVINCIA');
        sFrom.Add('LEFT OUTER JOIN PROVINCIA P ON');
        sFrom.Add('P.CD_PROVINCIA = P2.CD_PROVINCIA');
        //sFrom.Add('AND P.CD_UND = P2.CD_UND');
      end;

      if lst.Strings[i]='MEDICO' then
      begin
        sSQL.Add('A.CD_MEDICO CC_MEDICO,');
        sSQL.Add('ME.NM_MEDICO MEDICO');
        sFrom.Add('LEFT OUTER JOIN MEDICO ME ON');
        sFrom.Add('ME.CD_MEDICO = A.CD_MEDICO');
        //sFrom.Add('AND ME.CD_UND = A.CD_UND');
      end;

      if lst.Strings[i]='REMARCADO' then
      begin
        sSQL.Add('A.FL_REMARCADO CC_REMARCADO,');
        sSQL.Add(sSQLREMARCADO);
      end;

      if lst.Strings[i]='REALIZADO' then
      begin
        sSQL.Add('A.FL_REALIZADO CC_REALIZADO,');
        sSQL.Add(sSQLREALIZADO);
      end;

      if lst.Strings[i]='OCUPACAO' then
      begin
        sSQL.Add('P2.CD_OCUPACAO CC_OCUPACAO,');
        sSQL.Add('O.DS_OCUPACAO OCUPACAO');
        sFrom.Add('LEFT OUTER JOIN OCUPACAO O ON');
        sFrom.Add('O.CD_OCUPACAO = P2.CD_OCUPACAO');
        //sFrom.Add('AND O.CD_UND = P2.CD_UND');
      end;

      if lst.Strings[i]='ESCOLARIDADE' then
      begin
        sSQL.Add('TRIM(TA1.DS_DESCRICAO)ESCOLARIDADE,');
        sSQL.Add('P2.CD_ESCOLARIDADE CC_ESCOLARIDADE');
        sFrom.Add('LEFT OUTER JOIN TABELA_AUXILIAR TA1 ON');
        sFrom.Add('P2.CD_ESCOLARIDADE = TA1.CD_CODIGO');
        sFrom.Add('AND TA1.CD_TABELA = 1');
      end;

      if lst.Strings[i]='ESTADO_CIVIL' then
      begin
        sSQL.Add('P2.ESTADO_CIVIL CC_ESTADO_CIVIL,');
        sSQL.Add(sSQLESTADO_CIVIL);
      end;

      if lst.Strings[i]='SEXO' then
      begin
        sSQL.Add('P2.TP_SEXO CC_SEXO,');
        sSQL.Add(sSQLSEXO);
      end;

      if lst.Strings[i]='GESTANTE' then
      begin
        sSQL.Add('P2.FL_GESTANTE CC_GESTANTE,');
        sSQL.Add(sSQLGESTANTE);
      end;

      if lst.Strings[i]='RESULTADO' then
      begin
        sSQL.Add('P2.FL_RESULTADO CC_RESULTADO,');
        sSQL.Add(sSQLRESULTADO);
      end;

      if lst.Strings[i]='FAIXA_ETARIA' then
        sSQL.Add(sSQLFAIXA_ETARIA);
    end;

    sSQL.Add('FROM AGENDA A');
    sSQL.Add(' LEFT OUTER JOIN PACIENTE P2 ON');
    sSQL.Add(' P2.CD_PACIENTE = A.CD_PACIENTE');
//    sSQL.Add(' AND P2.CD_UND = A.CD_UND');
    sSQL.Add(sFrom.Text);
    result := sSQL.Text;
  finally
    lstFiltro.Clear;
    FreeAndNil(lst);
    FreeAndNil(sSQL);
    FreeAndNil(sFROM);
    FreeAndNil(sWHERE);
  end;
end;

procedure TfrmBITabular.HabilitaFiltros;
begin
  tabFiltros.TabVisible := (nTipoBI in [cNotificacao,cAgenda]);
  tabFiltroCaract.TabVisible := (nTipoBI in [cCaracterizacao]);

  if (nTipoBI = cAgenda) then
  begin
    pnSexo.Top := 0;
    pnSexo.Left := 8;
    pnOcupacao.Top := 0;
    pnOcupacao.Left := 152;
    pnEscolaridade.Top := 0;
    pnEscolaridade.Left := 294;
    pnEstadoCivil.Top := 0;
    pnEstadoCivil.Left := 440;
    pnGestante.Top := 0;
    pnGestante.Left := 584;
    pnResultado.Top := 88;
    pnResultado.Left := 8;
    pnEvolucao.Top := 88;
    pnEvolucao.Left := 152;
  end;

  if (nTipoBI = cCaracterizacao) then
  begin
    pnSexo.Parent := tabFiltroCaract;
    pnSexo.Top := 0;
    pnSexo.Left := 8;
    pnOcupacao.Parent := tabFiltroCaract;
    //pnOcupacao.Top := 0;
    //pnOcupacao.Left := 152;
    {pnEscolaridade.Top := 0;
    pnEscolaridade.Left := 294;
    pnEstadoCivil.Top := 0;
    pnEstadoCivil.Left := 440;
    pnGestante.Top := 0;
    pnGestante.Left := 584;
    pnResultado.Top := 88;
    pnResultado.Left := 8;
    pnEvolucao.Top := 88;
    pnEvolucao.Left := 152;}
  end;
    PosicionaFiltros;

  pnSexo.Visible := (nTipoBI in [cNotificacao,cAgenda, cCaracterizacao]);
  pnOcupacao.Visible := (nTipoBI in [cNotificacao,cAgenda, cCaracterizacao]);
  pnEscolaridade.Visible := (nTipoBI in [cNotificacao,cAgenda]);
  pnEstadoCivil.Visible := (nTipoBI in [cNotificacao,cAgenda]);
  pnGestante.Visible := (nTipoBI in [cNotificacao,cAgenda]);
  pnResultado.Visible := (nTipoBI in [cNotificacao,cAgenda]);
  pnEvolucao.Visible := (nTipoBI in [cNotificacao,cAgenda]);

  pnTrasnmissaoVertical.Visible := (nTipoBI = cNotificacao);
  pnFaixaEtaria.Visible := (nTipoBI = cNotificacao);
  pnTatuagem.Visible := (nTipoBI = cNotificacao);
  pnCircuncisao.Visible := (nTipoBI = cNotificacao);
  pnIntervencaoCirurgica.Visible := (nTipoBI = cNotificacao);
  pnTratamentoDentario.Visible := (nTipoBI = cNotificacao);
  pnEstadioClinico.Visible := (nTipoBI = cNotificacao);
  pnTesteTriagem.Visible := (nTipoBI = cNotificacao);
  pnTratamentoTradicional.Visible := (nTipoBI = cNotificacao);
  pnTransfusaoSangue.Visible := (nTipoBI = cNotificacao);
  pnRelacoesSexo.Visible := (nTipoBI = cNotificacao);
  pnEvidenciaGestante.Visible := (nTipoBI = cNotificacao);
  pnTesteConfirmatorio.Visible := (nTipoBI = cNotificacao);
  pnAcidenteBiologico.Visible := (nTipoBI = cNotificacao);
  pnDrogaInjetavel.Visible := (nTipoBI = cNotificacao);
  pnTipoEntrada.Visible := (nTipoBI = cNotificacao);
  pnTbAnterior.Visible := (nTipoBI = cNotificacao);
  pnTbAtual.Visible := (nTipoBI = cNotificacao);
end;

procedure TfrmBITabular.PosicaoDefaultFiltros;
var i,x:integer; pn:TPanel;
begin
  for i:=0 to frmBITabular.ComponentCount-1 do
  begin
   if (frmBITabular.Components[i] is TPanel) then
   if (frmBITabular.Components[i] as TPanel).Tag = 1 then
   begin
      x := High(MyRec)+2;
      SetLength(MyRec, x);
      x := High(MyRec);
      pn := (frmBITabular.Components[i] as TPanel);
      Myrec[x].pn := pn;
      Myrec[x].Left := pn.Left;
      Myrec[x].Top := pn.Top;
   end;
  end;
  tabFiltroCaract.TabVisible := False;
end;

procedure TfrmBITabular.PosicionaFiltros;
var i:integer; pn:TPanel;
begin
 for i:=Low(MyRec) to High(MyRec) do
 begin
    pn := MyRec[i].pn;
    if (nTipoBI in [cNotificacao, cAgenda]) then
      pn.Parent := tabFiltros;

    if (nTipoBI = cNotificacao) then
    begin
      pn.Left := MyRec[i].Left;
      pn.Top := MyRec[i].Top;
    end;
 end;
end;

procedure TfrmBITabular.FormShow(Sender: TObject);
begin
  PosicaoDefaultFiltros;
end;

procedure TfrmBITabular.LimpaFiltros;
var i,j:integer; lst:TCheckListBox;
begin
  for i:=0 to frmBITabular.ComponentCount-1 do
    if (frmBITabular.Components[i] is TCheckListBox) then
    begin
      lst := (frmBITabular.Components[i] as TCheckListBox);
      for j:=0 to lst.items.Count-1 do
        lst.Checked[j] := False;
    end;
end;

function TfrmBITabular.Existe(s: String; lst: TStringList): boolean;
var i:integer;
begin
  for i:=0 to lst.Count-1 do
    if s=lst[i] then
    begin
      result := true;
      exit;
    end;
end;

function TfrmBITabular.MontaSQLCaracterizacao: string;
var i,x:integer; lst, sSQL, sFROM, sWHERE:TStringlist;
begin
  lst := TStringlist.Create;
  sSQL := TStringlist.Create;
  sFROM := TStringlist.Create;
  sWHERE := TStringlist.Create;
  try

    lst.Text := lstFiltro.Text;

    for i:=0 to lbLinha.Items.Count-1 do
      if lbLinha.Checked[i] then
        if not Existe(lbLinha.Items[i],lst) then
          lst.Add(lbLinha.Items[i]);

    for i:=0 to lbColuna.Items.Count-1 do
      if lbColuna.Checked[i] then
        if not Existe(lbColuna.Items[i],lst) then
          lst.Add(lbColuna.Items[i]);

    sSQL.Add('SELECT');
//' N.CD_UND CC_UND,                              '+chr(13)+
    for i:=0 to lst.Count-1 do
    begin
      if (i>0) and (sSQL.Count>1) then
        sSQL.Text := sSQL.Text + ',';

      if lst.Strings[i]='QUANTIDADE' then
        sSQL.Add('''NR.'' QUANTIDADE');

      if lst.Strings[i]='ABORTOS' then
        sSQL.Add('C.NR_ABORTOS ABORTOS');

      if lst.Strings[i]='PARTOS' then
        sSQL.Add('C.NR_PARTOS PARTOS');

      if lst.Strings[i]='PARCEIROS_SEXUAIS' then
        sSQL.Add('C.NR_PARCEIROS_SEXUAIS PARCEIROS_SEXUAIS');

      if lst.Strings[i]='LOCAL' then
        sSQL.Add(sSQLLocal);

      if lst.Strings[i]='SESSAO' then
        sSQL.Add(sSQLSessaoCaract);

      if lst.Strings[i]='SEXO' then
      begin
        sSQL.Add('C.FL_SEXO CC_SEXO,');
        sSQL.Add(sSQLSexoCaract);
      end;

      if lst.Strings[i]='ESTADO_CIVIL' then
        sSQL.Add(sSQLEstadoCivilCaract);

      if lst.Strings[i]='GESTANTE' then
        sSQL.Add(sSQLGestanteCaract);

      if lst.Strings[i]='AMAMENTA' then
        sSQL.Add(sSQLAmamentaCaract);

      if lst.Strings[i]='ESCOLARIDADE' then
        sSQL.Add(sSQLEscolaridadeCaract);

      if lst.Strings[i]='MESANO' then
      begin
          sSQL.Add('(TRIM(SUBSTRING(CAST(DT_VISITA AS VARCHAR(24)) FROM 6 FOR 2)||''/''||' +
                   'SUBSTRING(CAST(DT_VISITA AS VARCHAR(24)) FROM 1 FOR 4))) MESANO,');
          sSQL.Add('DT_VISITA AS CC_DATA');
      end;

      if lst.Strings[i]='DATA' then
        sSQL.Add('EXTRACT (day FROM DT_VISITA)||''/''||'+
                 'EXTRACT (month FROM DT_VISITA)||''/''||'+
                 'EXTRACT (year FROM DT_VISITA) AS DATA');
      if lst.Strings[i]='OCUPACAO' then
      begin
        sSQL.Add('C.CD_OCUPACAO CC_OCUPACAO,');
        sSQL.Add('O.DS_OCUPACAO OCUPACAO');
        sFrom.Add('LEFT OUTER JOIN OCUPACAO O ON');
        sFrom.Add('O.CD_OCUPACAO = C.CD_OCUPACAO');
        //sFrom.Add('AND O.CD_UND = C.CD_UND');
      end;

      if lst.Strings[i]='MUNICIPIO' then
      begin
        sSQL.Add('C.CD_MUNICIPIO CC_MUNICIPIO,');
        sSQL.Add('M.DS_MUNICIPIO MUNICIPIO');
        sFrom.Add('LEFT OUTER JOIN MUNICIPIO M ON');
        sFrom.Add('M.CD_MUNICIPIO = C.CD_MUNICIPIO');
        //sFrom.Add('AND M.CD_UND = C.CD_UND');
      end;

      if lst.Strings[i]='PROVINCIA' then
      begin
        sSQL.Add('C.CD_PROVINCIA CC_PROVINCIA,');
        sSQL.Add('P.DS_PROVINCIA PROVINCIA');
        sFrom.Add('LEFT OUTER JOIN PROVINCIA P ON');
        sFrom.Add('P.CD_PROVINCIA = C.CD_PROVINCIA');
        //sFrom.Add('AND P.CD_UND = C.CD_UND');
      end;

      if lst.Strings[i]='UNIDADE' then
      begin
        sSQL.Add('U.DS_UNIDADE   UNIDADE,');
        sSQL.Add('C.CD_UNIDADE   CC_UNIDADE');
        sFrom.Add('LEFT OUTER JOIN UNIDADE U ON');
        sFrom.Add('U.CD_UNIDADE = C.CD_UNIDADE');
        //sFrom.Add('AND U.CD_UND = C.CD_UND');
      end;

      if lst.Strings[i]='INVESTIGADOR' then
      begin
        sSQL.Add('I.NM_INVESTIGADOR INVESTIGADOR');
        sFrom.Add('LEFT OUTER JOIN INVESTIGADOR I ON');
        sFrom.Add('C.CD_INVESTIGADOR = I.CD_INVESTIGADOR');
//        sFrom.Add('AND C.CD_UND = I.CD_UND');
      end;

      if lst.Strings[i]='EMPREGADA' then
        sSQL.Add(sSQLEmpregadaCaract);

      if lst.Strings[i]='OUVIU_FALAR' then
        sSQL.Add(sSQLOuviuFalarCaract);

      if lst.Strings[i]='RAZAO' then
        sSQL.Add(sSQLRazaoCaract);

      if lst.Strings[i]='INDICACAO' then
        sSQL.Add(sSQLIndicacaoCaract);


      if lst.Strings[i]='TRANSFUSAO' then
        sSQL.Add(sSQLTransfusaoCaract);

      if lst.Strings[i]='TATUAGEM' then
        sSQL.Add(sSQLTatuagemCaract);

      if lst.Strings[i]='CIRURGIA' then
        sSQL.Add(sSQLCirurgiaCaract);

      if lst.Strings[i]='CIRCUNCISAO' then
        sSQL.Add(sSQLCircuncisaoCaract);

      if lst.Strings[i]='AMAMENTOU_OUTROS' then
        sSQL.Add(sSQLAmamentouOutrosCaract);

      if lst.Strings[i]='SEXO_DROGAS' then
        sSQL.Add(sSQLSexoDrogasCaract);

      if lst.Strings[i]='SEXO_ALCOOL' then
        sSQL.Add(sSQLSexoAlcoolCaract);

      if lst.Strings[i]='SEXO_DINHEIRO' then
        sSQL.Add(sSQLSexoDinheiroCaract);

      if lst.Strings[i]='SEXO_MATERIAL' then
        sSQL.Add(sSQLSexoMaterialCaract);

      if lst.Strings[i]='SINAIS_ITS' then
        sSQL.Add(sSQLSinaisITSCaract);

      if lst.Strings[i]='ITS_HOJE' then
        sSQL.Add(sSQLITSCaract);
      if lst.Strings[i]='PARCEIRO_SEXUAL' then
        sSQL.Add(sSQLParceiroSexualCaract);

      if lst.Strings[i]='PRESERVATIVO' then
        sSQL.Add(sSQLPreservativoCaract);

      if lst.Strings[i]='PRESERVATIVO_NAO_REGULAR' then
        sSQL.Add(sSQLPreservativoNaoRegularCaract);

      if lst.Strings[i]='FAIXA_ETARIA' then
        sSQL.Add(sSQLFaixaEtariaCaract);

      if lst.Strings[i]='SINTOMAS_ITS' then
        sSQL.Add(sSQLSintomasITSCaract);

      if lst.Strings[i]='PARCEIROS_RESULTADOS' then
        sSQL.Add(sSQLParceirosResultadosCaract);

      if lst.Strings[i]='PLANO_REDUCAO' then
        sSQL.Add(sSQLPlanoReducaoCaract);

      if lst.Strings[i]='RECEBEU_PRESERVATIVOS' then
        sSQL.Add(sSQLRecebeuPreservativosCaract);

      if lst.Strings[i]='TRANSFERENCIA' then
        sSQL.Add(sSQLTransferenciaCaract);

      if lst.Strings[i]='TESTE' then
        sSQL.Add(sSQLTesteCaract);

      if lst.Strings[i]='TESTE_RECENTES' then
        sSQL.Add(sSQLTesteRecentesCaract);

      if lst.Strings[i]='TESTE_PARCEIROS' then
        sSQL.Add(sSQLTesteParceirosCaract);

      if lst.Strings[i]='TESTE_HOJE' then
        sSQL.Add(sSQLTesteHojeCaract);

      if lst.Strings[i]='TESTE_RESULTADOS' then
        sSQL.Add(sSQLTesteResultadosCaract);

      if lst.Strings[i]='REVELAR' then
        sSQL.Add(sSQLRevelarCaract);

    end;

    sSQL.Add('FROM CARACTERIZACAO C');
    sSQL.Add(sFrom.Text);
    result := sSQL.Text;
  finally
    lstFiltro.Clear;
    FreeAndNil(lst);
    FreeAndNil(sSQL);
    FreeAndNil(sFROM);
    FreeAndNil(sWHERE);
  end;

end;

function TfrmBITabular.DefineFiltroCaract: String;
var i:integer; bk:TBookMark; lst:TStringList;
  sAux,sCond,sWhere,sDE,sATE:string;
  bNIF:boolean;
begin
  lst := TStringList.Create;
  try
    sWhere := ' where ';
    lst.Delimiter := ',';

    //OCUPACAO
    lst.Clear;
    bNIF := False;
    sCond := '';
    for i:=0 to lstOcupacao.Count-1 do
      if lstOcupacao.Checked[i] then
      begin
         if lstOcupacao.Items[i] = 'NIF' then
           bNIF := True
         else
         begin
           bk:=lstOcupacao.Items.Objects[i];
           qyOcupacao.GotoBookmark(bk);
           lst.Add(qyOcupacao.Fields[0].AsString);
         end;
      end;
    if (lst.DelimitedText<>'') then
       sCond := ' CC_OCUPACAO IN('+ lst.DelimitedText +')';
    if bNIF then
    begin
      if sCond <> '' then
       sCond := sCond + ' OR ';
      sCond := sCond + 'CC_OCUPACAO IS NULL';
    end;
    if (sCond <> '') then
    begin
      sAux := sAux + sWhere + '('+ sCond +')';
      sWhere := ' and ';
      lstFiltro.Add('OCUPACAO');
    end;

    //ESCOLARIDADE
    lst.Clear;
    bNIF := False;
    sCond := '';
    for i:=0 to lstEscolaridade.Count-1 do
      if lstEscolaridade.Checked[i] then
      begin
         if lstEscolaridade.Items[i] = 'NIF' then
           bNIF := True
         else
         begin
           bk:=lstEscolaridade.Items.Objects[i];
           qyEscolaridade.GotoBookmark(bk);
           lst.Add(qyEscolaridade.Fields[0].AsString);
         end;
      end;
    if (lst.DelimitedText<>'') then
       sCond := ' CC_ESCOLARIDADE IN('+ lst.DelimitedText +')';
    if bNIF then
    begin
      if sCond <> '' then
       sCond := sCond + ' OR ';
      sCond := sCond + 'CC_ESCOLARIDADE IS NULL';
    end;
    if (sCond <> '') then
    begin
      sAux := sAux + sWhere + '('+ sCond +')';
      sWhere := ' and ';
      lstFiltro.Add('ESCOLARIDADE');
    end;

    //SEXO
    lst.Clear;
    for i:=0 to lstSexo.Count-1 do
      if lstSexo.Checked[i] then
      begin
         case i of
          0: lst.Add('1');
          1: lst.Add('2');
          2: bNIF := True;
         end;
      end;

    if (lst.DelimitedText<>'') then
       sCond := 'CC_SEXO IN('+
         FormataListaComAspas(lst.DelimitedText) +')';
    if bNIF then
    begin
      if sCond <> '' then
       sCond := sCond + ' OR ';
      sCond := sCond + 'CC_SEXO IS NULL';
    end;
    if (sCond <> '') then
    begin
      sAux := sAux + sWhere + '('+ sCond +')';
      sWhere := ' and ';
      lstFiltro.Add('SEXO');
    end;

    //AMAMENTA

    //FAIXA ETARIA
    lst.Clear;
    for i:=0 to lstFaixaEtaria.Count-1 do
      if lstFaixaEtaria.Checked[i] then
         lst.Add(lstFaixaEtaria.Items[i]);
    if lst.DelimitedText<>'' then
    begin
       sAux := sAux + sWhere + ' FAIXA_ETARIA IN('+
         FormataListaComAspas(lst.DelimitedText) +')';
       sWhere := ' and ';
       lstFiltro.Add('FAIXA_ETARIA');
    end;

    //ESTADO CIVIL
    lst.Clear;
    bNIF := False;
    sCond := '';
    for i:=0 to lstEstadoCivil.Count-1 do
      if lstEstadoCivil.Checked[i] then
      begin
         case i of
          0..5: lst.Add(intToStr(i+1));
          6: bNIF:=True;
         end;
      end;
    if (lst.DelimitedText<>'') then
       sCond := 'CC_ESTADO_CIVIL IN('+
         FormataListaComAspas(lst.DelimitedText) +')';
    if bNIF then
    begin
      if sCond <> '' then
       sCond := sCond + ' OR ';
      sCond := sCond + 'CC_ESTADO_CIVIL IS NULL';
    end;
    if (sCond <> '') then
    begin
      sAux := sAux + sWhere + '('+ sCond +')';
      sWhere := ' and ';
      lstFiltro.Add('ESTADO_CIVIL');
    end;

    //ESTADIO CLINICO
    lst.Clear;
    bNIF := False;
    sCond := '';
    for i:=0 to lstEstadioClinico.Count-1 do
      if lstEstadioClinico.Checked[i] then
      begin
         case i of
          0..3: lst.Add(intToStr(i+1));
          4: bNIF:=True;
         end;
      end;
    if (lst.DelimitedText<>'') then
       sCond := 'CC_ESTADIO_CLINICO IN('+
         FormataListaComAspas(lst.DelimitedText) +')';
    if bNIF then
    begin
      if sCond <> '' then
       sCond := sCond + ' OR ';
      sCond := sCond + 'CC_ESTADIO_CLINICO IS NULL';
      sCond := sCond + ' OR CC_ESTADIO_CLINICO=0';
    end;
    if (sCond <> '') then
    begin
      sAux := sAux + sWhere + '('+ sCond +')';
      sWhere := ' and ';
      lstFiltro.Add('ESTADIO_CLINICO');
    end;

    //RELACOES SEXO
    lst.Clear;
    bNIF := False;
    sCond := '';
    for i:=0 to lstRelacoesSexo.Count-1 do
      if lstRelacoesSexo.Checked[i] then
      begin
         case i of
          0..2: lst.Add(intToStr(i+1));
          3: bNIF:=True;
         end;
      end;
    if (lst.DelimitedText<>'') then
       sCond := 'CC_RELACOES_SEXO IN('+
         FormataListaComAspas(lst.DelimitedText) +')';
    if bNIF then
    begin
      if sCond <> '' then
       sCond := sCond + ' OR ';
      sCond := sCond + 'CC_RELACOES_SEXO IS NULL';
      sCond := sCond + ' OR CC_RELACOES_SEXO=98';
    end;
    if (sCond <> '') then
    begin
      sAux := sAux + sWhere + '('+ sCond +')';
      sWhere := ' and ';
      lstFiltro.Add('RELACOES_SEXO');
    end;

    //EVIDENCIA GESTANTE
    lst.Clear;
    bNIF := False;
    sCond := '';
    for i:=0 to lstEvidenciaGestante.Count-1 do
      if lstEvidenciaGestante.Checked[i] then
      begin
         case i of
          0..3: lst.Add(intToStr(i+1));
          4: bNIF:=True;
         end;
      end;
    if (lst.DelimitedText<>'') then
       sCond := 'CC_EVIDENCIA_GESTANTE IN('+
         FormataListaComAspas(lst.DelimitedText) +')';
    if bNIF then
    begin
      if sCond <> '' then
       sCond := sCond + ' OR ';
      sCond := sCond + 'CC_EVIDENCIA_GESTANTE IS NULL';
    end;
    if (sCond <> '') then
    begin
      sAux := sAux + sWhere + '('+ sCond +')';
      sWhere := ' and ';
      lstFiltro.Add('EVIDENCIA_GESTANTE');
    end;

    //GESTANTE
    lst.Clear;
    bNIF := False;
    sCond := '';
    for i:=0 to lstGestante.Count-1 do
      if lstGestante.Checked[i] then
      begin
         case i of
          0..1: lst.Add(intToStr(i));
          2: bNIF:=True;
         end;
      end;
    if (lst.DelimitedText<>'') then
       sCond := 'CC_GESTANTE IN('+
         FormataListaComAspas(lst.DelimitedText) +')';
    if bNIF then
    begin
      if sCond <> '' then
       sCond := sCond + ' OR ';
      sCond := sCond + 'CC_GESTANTE IS NULL';
    end;
    if (sCond <> '') then
    begin
      sAux := sAux + sWhere + '('+ sCond +')';
      sWhere := ' and ';
      lstFiltro.Add('GESTANTE');
    end;

    //RESULTADO
    lst.Clear;
    bNIF := False;
    sCond := '';
    for i:=0 to lstResultado.Count-1 do
      if lstResultado.Checked[i] then
      begin
         case i of
          0..2: lst.Add(intToStr(i+1));
          3: bNIF:=True;
         end;
      end;
    if (lst.DelimitedText<>'') then
       sCond := 'CC_RESULTADO IN('+
         FormataListaComAspas(lst.DelimitedText) +')';
    if bNIF then
    begin
      if sCond <> '' then
       sCond := sCond + ' OR ';
      sCond := sCond + 'CC_RESULTADO IS NULL';
    end;
    if (sCond <> '') then
    begin
      sAux := sAux + sWhere + '('+ sCond +')';
      sWhere := ' and ';
      lstFiltro.Add('RESULTADO');
    end;

    //EVOLUCAO
    lst.Clear;
    bNIF := False;
    sCond := '';
    for i:=0 to lstEvolucao.Count-1 do
      if lstEvolucao.Checked[i] then
      begin
         case i of
          0..4: lst.Add(intToStr(i+1));
          5: bNIF:=True;
         end;
      end;
    if (lst.DelimitedText<>'') then
       sCond := 'CC_EVOLUCAO IN('+
         FormataListaComAspas(lst.DelimitedText) +')';
    if bNIF then
    begin
      if sCond <> '' then
       sCond := sCond + ' OR ';
      sCond := sCond + 'CC_EVOLUCAO IS NULL';
    end;
    if (sCond <> '') then
    begin
      sAux := sAux + sWhere + '('+ sCond +')';
      sWhere := ' and ';
      lstFiltro.Add('EVOLUCAO');
    end;

    //TB Anterior
    lst.Clear;
    bNIF := False;
    sCond := '';
    for i:=0 to lstTBAnterior.Count-1 do
      if lstTBAnterior.Checked[i] then
      begin
         case i of
          0..2: lst.Add(intToStr(i+1));
          3: bNIF:=True;
         end;
      end;
    if (lst.DelimitedText<>'') then
       sCond := 'CC_TB_ANTERIOR IN('+
         FormataListaComAspas(lst.DelimitedText) +')';
    if bNIF then
    begin
      if sCond <> '' then
       sCond := sCond + ' OR ';
      sCond := sCond + 'CC_TB_ANTERIOR IS NULL';
    end;
    if (sCond <> '') then
    begin
      sAux := sAux + sWhere + '('+ sCond +')';
      sWhere := ' and ';
      lstFiltro.Add('TB_ANTERIOR');
    end;

    //TB Atual
    lst.Clear;
    bNIF := False;
    sCond := '';
    for i:=0 to lstTBAtual.Count-1 do
      if lstTBAtual.Checked[i] then
      begin
         case i of
          0..2: lst.Add(intToStr(i+1));
          3: bNIF:=True;
         end;
      end;
    if (lst.DelimitedText<>'') then
       sCond := 'CC_TB_ATUAL IN('+
         FormataListaComAspas(lst.DelimitedText) +')';
    if bNIF then
    begin
      if sCond <> '' then
       sCond := sCond + ' OR ';
      sCond := sCond + 'CC_TB_ATUAL IS NULL';
    end;
    if (sCond <> '') then
    begin
      sAux := sAux + sWhere + '('+ sCond +')';
      sWhere := ' and ';
      lstFiltro.Add('TB_ATUAL');
    end;

    //TP Entrada
    lst.Clear;
    bNIF := False;
    sCond := '';
    for i:=0 to lstTPEntrada.Count-1 do
      if lstTPEntrada.Checked[i] then
      begin
         case i of
          0..3: lst.Add(intToStr(i+1));
          4: bNIF:=True;
         end;
      end;
    if (lst.DelimitedText<>'') then
       sCond := 'CC_TP_ENTRADA IN('+
         FormataListaComAspas(lst.DelimitedText) +')';
    if bNIF then
    begin
      if sCond <> '' then
       sCond := sCond + ' OR ';
      sCond := sCond + 'CC_TP_ENTRADA IS NULL';
    end;
    if (sCond <> '') then
    begin
      sAux := sAux + sWhere + '('+ sCond +')';
      sWhere := ' and ';
      lstFiltro.Add('TP_ENTRADA');
    end;

    //Teste Triagem
    lst.Clear;
    bNIF := False;
    sCond := '';
    for i:=0 to lstTesteTriagem.Count-1 do
      if lstTesteTriagem.Checked[i] then
      begin
         case i of
          0: lst.Add(intToStr(i+1));
          1: lst.Add('98');
          2: bNIF:=True;
         end;
      end;
    if (lst.DelimitedText<>'') then
       sCond := 'CC_TESTE_TRIAGEM IN('+
         FormataListaComAspas(lst.DelimitedText) +')';
    if bNIF then
    begin
      if sCond <> '' then
       sCond := sCond + ' OR ';
      sCond := sCond + 'CC_TESTE_TRIAGEM IS NULL';
    end;
    if (sCond <> '') then
    begin
      sAux := sAux + sWhere + '('+ sCond +')';
      sWhere := ' and ';
      lstFiltro.Add('TESTE_TRIAGEM');
    end;

    //Teste Confirmatorio
    lst.Clear;
    bNIF := False;
    sCond := '';
    for i:=0 to lstTesteConfirmatorio.Count-1 do
      if lstTesteConfirmatorio.Checked[i] then
      begin
         case i of
          0: lst.Add(intToStr(i+1));
          1: lst.Add('98');
          2: bNIF:=True;
         end;
      end;
    if (lst.DelimitedText<>'') then
       sCond := 'CC_TESTE_CONFIRMATORIO IN('+
         FormataListaComAspas(lst.DelimitedText) +')';
    if bNIF then
    begin
      if sCond <> '' then
       sCond := sCond + ' OR ';
      sCond := sCond + 'CC_TESTE_CONFIRMATORIO IS NULL';
    end;
    if (sCond <> '') then
    begin
      sAux := sAux + sWhere + '('+ sCond +')';
      sWhere := ' and ';
      lstFiltro.Add('TESTE_CONFIRMATORIO');
    end;

    //Tatuagem
    lst.Clear;
    bNIF := False;
    sCond := '';
    for i:=0 to lstTatuagem.Count-1 do
      if lstTatuagem.Checked[i] then
      begin
         case i of
          0: begin
               lst.Add('0');
               lst.Add('2');
             end;
          1: lst.Add('1');
          2: bNIF:=True;
         end;
      end;
    if (lst.DelimitedText<>'') then
       sCond := 'CC_TATUAGEM IN('+
         lst.DelimitedText +')';
    if bNIF then
    begin
      if sCond <> '' then
       sCond := sCond + ' OR ';
      sCond := sCond + 'CC_TATUAGEM IS NULL';
    end;
    if (sCond <> '') then
    begin
      sAux := sAux + sWhere + '('+ sCond +')';
      sWhere := ' and ';
      lstFiltro.Add('TATUAGEM');
    end;

    //Tratamento Tradicional
    lst.Clear;
    bNIF := False;
    sCond := '';
    for i:=0 to lstTradicional.Count-1 do
      if lstTradicional.Checked[i] then
      begin
         case i of
          0: begin
               lst.Add('0');
               lst.Add('2');
             end;
          1: lst.Add('1');
          2: bNIF:=True;
         end;
      end;
    if (lst.DelimitedText<>'') then
       sCond := 'CC_TRATAMENTO_TRADICIONAL IN('+
         lst.DelimitedText +')';
    if bNIF then
    begin
      if sCond <> '' then
       sCond := sCond + ' OR ';
      sCond := sCond + 'CC_TRATAMENTO_TRADICIONAL IS NULL';
    end;
    if (sCond <> '') then
    begin
      sAux := sAux + sWhere + '('+ sCond +')';
      sWhere := ' and ';
      lstFiltro.Add('TRATAMENTO_TRADICIONAL');
    end;

    //Tratamento Dentario
    lst.Clear;
    bNIF := False;
    sCond := '';
    for i:=0 to lstDentario.Count-1 do
      if lstDentario.Checked[i] then
      begin
         case i of
          0: begin
               lst.Add('0');
               lst.Add('2');
             end;
          1: lst.Add('1');
          2: bNIF:=True;
         end;
      end;
    if (lst.DelimitedText<>'') then
       sCond := 'CC_TRATAMENTO_DENTARIO IN('+
         lst.DelimitedText +')';
    if bNIF then
    begin
      if sCond <> '' then
       sCond := sCond + ' OR ';
      sCond := sCond + 'CC_TRATAMENTO_DENTARIO IS NULL';
    end;
    if (sCond <> '') then
    begin
      sAux := sAux + sWhere + '('+ sCond +')';
      sWhere := ' and ';
      lstFiltro.Add('TRATAMENTO_DENTARIO');
    end;

    //Intervencao Cirurgica
    lst.Clear;
    bNIF := False;
    sCond := '';
    for i:=0 to lstCirurgica.Count-1 do
      if lstCirurgica.Checked[i] then
      begin
         case i of
          0: begin
               lst.Add('0');
               lst.Add('2');
             end;
          1: lst.Add('1');
          2: bNIF:=True;
         end;
      end;
    if (lst.DelimitedText<>'') then
       sCond := 'CC_INTERVENCAO_CIRURGICA IN('+
         lst.DelimitedText +')';
    if bNIF then
    begin
      if sCond <> '' then
       sCond := sCond + ' OR ';
      sCond := sCond + 'CC_INTERVENCAO_CIRURGICA IS NULL';
    end;
    if (sCond <> '') then
    begin
      sAux := sAux + sWhere + '('+ sCond +')';
      sWhere := ' and ';
      lstFiltro.Add('INTERVENCAO_CIRURGICA');
    end;

    //Circuncisao
    lst.Clear;
    bNIF := False;
    sCond := '';
    for i:=0 to lstCircuncisao.Count-1 do
      if lstCircuncisao.Checked[i] then
      begin
         case i of
          0: begin
               lst.Add('0');
               lst.Add('2');
             end;
          1: lst.Add('1');
          2: bNIF:=True;
         end;
      end;
    if (lst.DelimitedText<>'') then
       sCond := 'CC_CIRCUNCISAO IN('+
         lst.DelimitedText +')';
    if bNIF then
    begin
      if sCond <> '' then
       sCond := sCond + ' OR ';
      sCond := sCond + 'CC_CIRCUNCISAO IS NULL';
    end;
    if (sCond <> '') then
    begin
      sAux := sAux + sWhere + '('+ sCond +')';
      sWhere := ' and ';
      lstFiltro.Add('CIRCUNCISAO');
    end;

    //Acidente Biologico
    lst.Clear;
    bNIF := False;
    sCond := '';
    for i:=0 to lstAcidente.Count-1 do
      if lstAcidente.Checked[i] then
      begin
         case i of
          0: begin
               lst.Add('0');
               lst.Add('2');
             end;
          1: lst.Add('1');
          2: bNIF:=True;
         end;
      end;
    if (lst.DelimitedText<>'') then
       sCond := 'CC_ACIDENTE_BIOLOGICO IN('+
         lst.DelimitedText +')';
    if bNIF then
    begin
      if sCond <> '' then
       sCond := sCond + ' OR ';
      sCond := sCond + 'CC_ACIDENTE_BIOLOGICO IS NULL';
    end;
    if (sCond <> '') then
    begin
      sAux := sAux + sWhere + '('+ sCond +')';
      sWhere := ' and ';
      lstFiltro.Add('ACIDENTE_BIOLOGICO');
    end;

    //Droga
    lst.Clear;
    bNIF := False;
    sCond := '';
    for i:=0 to lstDroga.Count-1 do
      if lstDroga.Checked[i] then
      begin
         case i of
          0: begin
               lst.Add('0');
               lst.Add('2');
             end;
          1: lst.Add('1');
          2: bNIF:=True;
         end;
      end;
    if (lst.DelimitedText<>'') then
       sCond := 'CC_DROGA_INJETAVEL IN('+
         lst.DelimitedText +')';
    if bNIF then
    begin
      if sCond <> '' then
       sCond := sCond + ' OR ';
      sCond := sCond + 'CC_DROGA_INJETAVEL IS NULL OR CC_DROGA_INJETAVEL=98';
    end;
    if (sCond <> '') then
    begin
      sAux := sAux + sWhere + '('+ sCond +')';
      sWhere := ' and ';
      lstFiltro.Add('DROGA_INJETAVEL');
    end;

    //Transfusao Sangue
    lst.Clear;
    bNIF := False;
    sCond := '';
    for i:=0 to lstTransfusao.Count-1 do
      if lstTransfusao.Checked[i] then
      begin
         case i of
          0: begin
               lst.Add('0');
               lst.Add('2');
             end;
          1: lst.Add('1');
          2: bNIF:=True;
         end;
      end;
    if (lst.DelimitedText<>'') then
       sCond := 'CC_TRANSFUSAO_SANGUE IN('+
         lst.DelimitedText +')';
    if bNIF then
    begin
      if sCond <> '' then
       sCond := sCond + ' OR ';
      sCond := sCond + 'CC_TRANSFUSAO_SANGUE IS NULL';
    end;
    if (sCond <> '') then
    begin
      sAux := sAux + sWhere + '('+ sCond +')';
      sWhere := ' and ';
      lstFiltro.Add('TRANSFUSAO_SANGUE');
    end;

    //Transmissao Vertical
    lst.Clear;
    bNIF := False;
    sCond := '';
    for i:=0 to lstTransmissaoVertical.Count-1 do
      if lstTransmissaoVertical.Checked[i] then
      begin
         case i of
          0: begin
               lst.Add('0');
               lst.Add('2');
             end;
          1: lst.Add('1');
          2: bNIF:=True;
         end;
      end;
    if (lst.DelimitedText<>'') then
       sCond := 'CC_TRANSMISSAO_VERTICAL IN('+
         lst.DelimitedText +')';
    if bNIF then
    begin
      if sCond <> '' then
       sCond := sCond + ' OR ';
      sCond := sCond + 'CC_TRANSMISSAO_VERTICAL IS NULL';
    end;
    if (sCond <> '') then
    begin
      sAux := sAux + sWhere + '('+ sCond +')';
      sWhere := ' and ';
      lstFiltro.Add('TRANSMISSAO_VERTICAL');
    end;

    //Provincia
    sCond := '';
    if (btLocProvincia.Text <> '') then
      sCond := 'CC_PROVINCIA = ' + btLocProvincia.Text;
    if (sCond <> '') then
    begin
      sAux := sAux + sWhere + '('+ sCond +')';
      sWhere := ' and ';
      lstFiltro.Add('PROVINCIA');
    end;

    //Municipio
    sCond := '';
    if (btLocMunicipio.Text <> '') then
      sCond := 'CC_MUNICIPIO = ' + btLocMunicipio.Text;
    if (sCond <> '') then
    begin
      sAux := sAux + sWhere + '('+ sCond +')';
      sWhere := ' and ';
      lstFiltro.Add('MUNICIPIO');
    end;

    //Unidade
    sCond := '';
    if (btLocUnidade.Text <> '') then
      sCond := 'CC_UNIDADE = ' + btLocUnidade.Text;
    if (sCond <> '') then
    begin
      sAux := sAux + sWhere + '('+ sCond +')';
      sWhere := ' and ';
      lstFiltro.Add('UNIDADE');
    end;


    //MesAno
    sCond := '';
    if (dtDE.Text <> '  /  /    ')and(dtate.Text <> '  /  /    ') then
    begin
       //sDE := Copy(cbMesAnoDe.Text,1,2) + '-01-' + Copy(cbMesAnoDe.Text,4,4);
       //sATE := Copy(cbMesAnoAte.Text,1,2) + '-30-' + Copy(cbMesAnoAte.Text,4,4);
       sDE := FormatDateTime('mm-dd-yyyy',dtDe.DATE);
       sAtE := FormatDateTime('mm-dd-yyyy',dtAte.DATE);
       sCond := '(CC_DATA BETWEEN ' + QuotedStr(sDe) + ' AND' +
            QuotedStr(sAte) + ')';
    end;
    if (sCond <> '') then
    begin
      sAux := sAux + sWhere + '('+ sCond +')';
      sWhere := ' and ';
      lstFiltro.Add('MESANO');
    end;

{    //MesAno - Notificacao
    sCond := '';
    if (cbMesAnoDe.Text <> '')and(cbMesAnoAte.Text <> '') then
      sCond := '(MESANO BETWEEN ' + QuotedStr(cbMesAnoDe.Text) + ' AND' +
          QuotedStr(cbMesAnoAte.Text) + ')';
    if (sCond <> '') then
    begin
      sAux := sAux + sWhere + '('+ sCond +')';
      sWhere := ' and ';
      lstFiltro.Add('MESANO');
    end;
}
    result  := sAux;
  finally
    FreeAndNil(lst);
  end;
end;
procedure TfrmBITabular.Timer1Timer(Sender: TObject);
begin
  statusbar1.Panels[0].Text:=''+FormatDateTime('hh:nn:ss',Now);//Exibe a hora atual
  statusbar1.Panels[1].Text:=''+FormatDateTime('dddd '', '' dd '' de '' mmmm '' de '' yyyy',Now);//Exibe a data atual

end;

procedure TfrmBITabular.StatusBar1DrawPanel(StatusBar: TStatusBar;
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

end.

