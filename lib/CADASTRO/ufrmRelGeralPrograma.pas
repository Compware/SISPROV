unit ufrmRelGeralPrograma;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UfrmRelPad, OleCtrls, SHDocVw, ComCtrls, RpCon, RpConDS, RpBase,
  RpSystem, RpDefine, RpRave, DB, IBCustomDataSet, IBQuery, StdCtrls,
  Buttons, ExtCtrls, dxCntner, dxEditor, dxExEdtr, dxEdLib, ugeral,
  uFrameDashBoard, JPEG, IB_PARSE, RXCtrls, Grids, DBGrids, dxDBTLCl,
  dxGrClms, dxTL, dxDBCtrl, dxDBGrid, RpRenderRTF, RpRenderHTML, RpRender,
  RpRenderPDF;

type
  TfrmRelGeralPrograma = class(TfrmRelPad)
    tsFiltro: TTabSheet;
    Label7: TLabel;
    GroupBox3: TGroupBox;
    Label5: TLabel;
    Label8: TLabel;
    dtde: TdxDateEdit;
    dtate: TdxDateEdit;
    GroupBox1: TGroupBox;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    qyDashBoard: TIBQuery;
    tsGrafico: TTabSheet;
    ckGrafico: TCheckBox;
    btLocUnidade: TdxButtonEdit;
    edUnidade: TdxEdit;
    btLocProvincia: TdxButtonEdit;
    edProvincia: TdxEdit;
    btLocMunicipio: TdxButtonEdit;
    edMunicipio: TdxEdit;
    ProgressBar1: TProgressBar;
    Memo1: TMemo;
    Panel3: TPanel;
    GroupBox2: TGroupBox;
    lbAte: TLabel;
    Label6: TLabel;
    cbDe: TdxPickEdit;
    cbAte: TdxPickEdit;
    TabSheet1: TTabSheet;
    lstRelatorios: TRxCheckListBox;
    tbConsolidar: TTabSheet;
    TabSheet2: TTabSheet;
    Panel4: TPanel;
    Panel5: TPanel;
    DBGrid1: TDBGrid;
    GroupBox4: TGroupBox;
    ckATV: TCheckBox;
    ckPTV: TCheckBox;
    ckCaracterizacao: TCheckBox;
    ckNotificacao: TCheckBox;
    ckTARV: TCheckBox;
    ckPrograma: TCheckBox;
    ckTARV_ESQ: TCheckBox;
    ckAcomp: TCheckBox;
    tbVersao: TTabSheet;
    Panel6: TPanel;
    btIncVersao: TBitBtn;
    btImpVersao: TBitBtn;
    btSalvarVersao: TBitBtn;
    grVersao: TdxDBGrid;
    grVersaoColumn1: TdxDBGridColumn;
    grVersaoColumn2: TdxDBGridColumn;
    grVersaoColumn3: TdxDBGridColumn;
    grVersaoColumn4: TdxDBGridMemoColumn;
    dsVersao: TDataSource;
    procedure btImprimirClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btLocUnidadeButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure btLocProvinciaButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure btLocMunicipioButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure btLocUnidadeChange(Sender: TObject);
    procedure btLocProvinciaChange(Sender: TObject);
    procedure btLocMunicipioChange(Sender: TObject);
    procedure btLocUnidadeExit(Sender: TObject);
    procedure btLocProvinciaExit(Sender: TObject);
    procedure btLocMunicipioExit(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btIncVersaoClick(Sender: TObject);
    procedure btImpVersaoClick(Sender: TObject);
    procedure btSalvarVersaoClick(Sender: TObject);
    procedure dsVersaoStateChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure CriaRelatorioWEB;
    function BMPtoJPG(var BMPpic, JPGpic: string):boolean;
    function DefineFiltro:string;
    procedure CarregaComboMesAno;
    procedure verificarPeriodo;
    function DefineTipo(sCondicao:String):String;
  end;

  {function Relatorio(sql,parametro, titulo:string;id:integer):string;
  function Relatorio2(sql,parametro,tipo,titulo:string;id:integer):string;
  function Relatorio3(sql,parametro,tipo,titulo:string;id:integer):string;}

var
  frmRelGeralPrograma: TfrmRelGeralPrograma;
  sArqWEB, sArqLog, dir:String; sLog:TStringList;
  gdtDe, gdtAte:Tdate;

implementation

uses uRelatorioWEB, UGeralSQL, UfrmLocalizar, UDMGERAL, uSQLPrograma, Math,
  DateUtils, UDM;

{$R *.dfm}

procedure TfrmRelGeralPrograma.VerificarPeriodo;
var d,m,y:word;
begin
  if cbDe.Text = '  /    ' then
  begin
    MessageDlg('� necess�rio, incluir o per�odo DE:!',mtWarning,[mbOK],0);
    abort;
  end;
  if cbAte.Text = '  /    ' then
  begin
    MessageDlg('� necess�rio, incluir o per�odo AT�:!',mtWarning,[mbOK],0);
    abort;
  end;
  d := 1;
  y := strToint(copy(cbDe.Text,4,4));
  m := strToint(copy(cbDe.Text,1,2));
  gdtDe := EncodeDateTime(y,m,d,0,0,0,0);

  y := strToint(copy(cbAte.Text,4,4));
  m := strToint(copy(cbAte.Text,1,2));
  gdtAte := EncodeDateTime(y,m,d,0,0,0,0);
end;

procedure TfrmRelGeralPrograma.CarregaComboMesAno;
var data:TDate; i:integer;
begin
  data := dm.GetDateTime;
  cbDe.Items.Add(FormatDateTime('mm/yyyy',data));
  cbAte.Items.Add(FormatDateTime('mm/yyyy',data));
  for i:= 1 to 11 do
  begin
    cbDe.Items.Add(FormatDateTime('mm/yyyy',IncMonth(data,-i)));
    cbAte.Items.Add(FormatDateTime('mm/yyyy',IncMonth(data,-i)));
  end;
end;


procedure TfrmRelGeralPrograma.btImprimirClick(Sender: TObject);
begin
  verificarPeriodo;

  inherited;
  ProgressBar1.Visible := true;
  try
   ProgressBar1.Max := lstRelatorios.Items.Count-1;
   ProgressBar1.Position := 0;
   CriaRelatorioWEB;
  except
   on E:Exception do
     ShowMessage(e.Message);
  end;
  //ShowMessage('Gerando Arquivo:'+sArqLog);
  if DirectoryExists(ExtractFilePath(sArqLog)) then
    sLog.SaveToFile(sArqLog)
  else
    ShowMessage('Erro Arquivo:'+sArqLog);
  frmRelatorioWEB := TfrmRelatorioWEB.Create(Application);
  frmRelatorioWEB.relatorio.Navigate(sArqWEB);
  frmRelatorioWEB.ShowModal;
  frmRelatorioWEB.Free;
  ProgressBar1.Visible := false;
end;

procedure TfrmRelGeralPrograma.CriaRelatorioWEB;
var
  sRel, sExcel:TStringList;
  sCondicao,sTitulo,sAux:string;
  idRel:integer;

  type
    TValor = Record
      Posi, Test, Perc:real;
    end;
  RValor = TValor;

  type
    TGrafico = Record
       x,y:string;
       v:real;
    end;

  function Existe(v:array of string;s:string):integer;
  var i:integer;
  begin
    result := -1;
    for i:=Low(v) to High(v) do
       if v[i] = s then
       begin
         result := i;
         exit;
       end;
  end;

  function Extenso(m:string;Tipo:integer):string;
  begin
    if m<>'' then
    case Tipo of
    cAdultoTestPosiProvincias,cCriancaTestPosiProvincias,
    cGestanteTestPosiProvincias,cPessoasTestPosiProvincias,
    cCriancaAcompTarvProvincia,cCriancasExpostasTrimestral,
    cObitoTrimestral,cGravidasPosiPTVTrimestral,
    cAdultoAcompTarvProvincias,cGestantePTVAdmissao:
      case strToint(m) of
         1: result := 'Janeiro';
         2: result := 'Fevereiro';
         3: result := 'Marco';
         4: result := 'Abril';
         5: result := 'Maio';
         6: result := 'Junho';
         7: result := 'Julho';
         8: result := 'Agosto';
         9: result := 'Setembro';
        10: result := 'Outubro';
        11: result := 'Novembro';
        12: result := 'Dezembro';
      else
         result := '';
      end;

    cPessoasPosiProvincias,cPessoasAconProvincias,
    cPessoasTestProvincias, cAcompTarvProvincia,
    cPessoasAconTestProvincias,cAcompProvincia,
    cTarvProvincia,cAcompPosiProvincia,
    cPosiTarvProvincia, cAbanTarvProvincia,
    cTransTarvProvincia, cObitoTarvProvincia,
    cPessoasGeralProvincias, cPessoasAconTestPosProvincias:
      case strToint(m) of
         1: result := 'Gestante';
         2: result := 'Crianca';
         3: result := 'Adulto';
      else
         result := '';
      end;

    cAdultoSexoPosiProvincias, cAdultoSexoTestPosiProvincias:
      case strToint(m) of
         1: result := 'Feminino';
         2: result := 'Masculino';
      else
         result := '';
      end;

     cGestantePTVLocal:
      case strToint(m) of
         1: result := 'Nesta Inst.';
         2: result := 'Outra Inst.';
         3: result := 'Domiciliar';
      else
         result := '';
      end;
    end;
  end;

  function Round(r:real; d:integer):real;
  var i,n:Extended; m:integer;  f:real; s:string;
  begin
     i := int(r);
     f := frac(r);
     s := '1'+StringOfChar('0',d);
     m := strToInt(s);
     f := f * m;
     n := int(f);
     f := n/m;
     result := i+f;
  end;

  function Grafico(nm,tx:string; id, Tipo:integer):string;
  var s:TStrings; sAux:string;
  begin
    s := TStringList.Create;
    try
      //Abre modelo xml
      if Tipo=2 then
        s.LoadFromFile(sPathConsulta+'Pizza.xml')
      else if Tipo=3 then
        s.LoadFromFile(sPathConsulta+'Linha.xml')
      else
        s.LoadFromFile(sPathConsulta+'Barras.xml');

      s.Text := StringReplace(s.Text,'<DADOS>',tx,[]);
      sAux := 'Percentagem';
      s.Text := StringReplace(s.Text,'<TEXTO>',sAux,[]);
      sAux := '';
      s.Text := StringReplace(s.Text,'<TITULO>',sAux,[]);
      sAux := '';
      s.Text := StringReplace(s.Text,'<FUNDO>',sAux,[]);
      {<DADOS>
      <TITULO>
      <TEXTO>
      <FUNDO>}
      //Salva Dados Grafico
      s.SaveToFile(sPathConsulta+'Grafico'+nm+'.xml');

      //Carrega Grafico
      s.Clear;
      s.add('<script language="JavaScript" type="text/javascript">');
      s.add('if (AC_FL_RunContent == 0 || DetectFlashVer == 0) {');
      s.add('    alert("This page requires AC_RunActiveContent.js.");');
      s.add('} else {');
      s.add('    var hasRightVersion = DetectFlashVer(requiredMajorVersion, requiredMinorVersion, requiredRevision);');
      s.add('    if(hasRightVersion) {');
      s.add('        AC_FL_RunContent(');
      s.add('            ''codebase'', ''http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=10,0,45,2'',');
      s.add('            ''width'', ''700'',');
      s.add('            ''height'', ''350'',');
      s.add('            ''scale'', ''noscale'',');
      s.add('            ''salign'', ''TL'',');
      s.add('            ''bgcolor'', ''#777788'',');
      s.add('            ''wmode'', ''opaque'',');
      s.add('            ''movie'', ''charts'',');
      s.add('            ''src'', ''charts'',');
      s.add('            ''FlashVars'', ''library_path=charts_library&xml_source=Grafico'+nm+'.xml'',');
      s.add('            ''id'', ''my_chart'',');
      s.add('            ''name'', ''my_chart'',');
      s.add('            ''menu'', ''true'',');
      s.add('            ''allowFullScreen'', ''true'',');
      s.add('            ''allowScriptAccess'',''sameDomain'',');
      s.add('            ''quality'', ''high'',');
      s.add('            ''align'', ''middle'',');
      s.add('            ''pluginspage'', ''http://www.macromedia.com/go/getflashplayer'',');
      s.add('            ''play'', ''true'',');
      s.add('            ''devicefont'', ''false''');
      s.add('            );');
      s.add('    } else {');
      s.add('        var alternateContent = ''This content requires the Adobe Flash Player. ''');
      s.add('        + ''<u><a href=http://www.macromedia.com/go/getflash/>Get Flash</a></u>.'';');
      s.add('        document.write(alternateContent);');
      s.add('    }');
      s.add('}');
      s.add('</script>');

      result := s.Text;
    finally
     FreeAndNil(s);
    end;
  end;

//************************RELATORIO*********************************************
function Relatorio(sql,parametro, titulo:string;id:integer):string;
var Mes,Provincia:array of string;
    MesPro:array of array[0..11] of array[1..3] of real;
    cSpan, ctMes, ixMes, ixProvincia, x, y, z:integer;
    vValor, TGeral: RValor;
      Total: array [0..11] of RValor;
    sAux,nmRel:string;
    sRel,sGra:TStringList;
    vGrafico:array of TGrafico;

  procedure Ordenar(ix:integer);
  var i,j:integer; x:TGrafico;
      n1,n2:real;
  begin
     for I := Low(vGrafico) to (High(vGrafico)-1) do
     begin
         for J := I+1 to High(vGrafico) do
         begin
              n1 := vGrafico[I].v;
              n2 := vGrafico[J].v;
              if n1 > n2 then
              begin
                   X.x := vGrafico[I].x;
                   X.y := vGrafico[I].y;
                   X.v := vGrafico[I].v;
                   vGrafico[I].x := vGrafico[J].x;
                   vGrafico[I].y := vGrafico[J].y;
                   vGrafico[I].v := vGrafico[J].v;
                   vGrafico[J].x := X.x;
                   vGrafico[J].y := X.y;
                   vGrafico[J].v := X.v;
              end;
         end;
     end;
  end;

  function MesesEntre(de,ate:TDate):integer;
  var m:integer;
  begin
   m := 1;
   repeat
     inc(m);
     de := IncMonth(de,1);
   until (de>=ate);
   result := m;
  end;

begin
sRel := TStringList.Create;
sGra := TStringList.Create;
try
  inc(idRel);
  nmRel := 'rel' + intToStr(idRel);

  sAux := sCondicao;
  if (Parametro <> '') and (sAux <> '') then
    sAux := sAux + ' AND ' + Parametro
  else if (Parametro <> '') and (sAux = '') then
    sAux := Parametro;

  if sAux <> '' then
    sAux :=  ' AND ' + sAux;

  sAux := DefineTipo(sAux);

  if id in [cAcompTarvProvincia,cAcompPosiProvincia,
            cPosiTarvProvincia,cCriancaAcompTarvProvincia,
            cObitoTarvProvincia,cGravidasPosiPTVTrimestral,
            cAdultoAcompTarvProvincias] then
  begin
    if id = cGravidasPosiPTVTrimestral then
      sql := Format(sql,[sAux,sAux,sAux])
    else
      sql := Format(sql,[sAux,sAux]);
  end
  else if id=cAbanTarvProvincia then
    sql := Format(sql,[cFaixaAbandono,sAux,sAux])
  else if id in [cTransTarvProvincia]then
    sql := Format(sql,[cFaixaTransferencia,sAux,sAux]);

  qyGeral.Close;
  qyGeral.SQL.Text:= Format(sql, [sAux]);
  qyGeral.Open;
  qyGeral.First;
  while not qyGeral.Eof do
  begin
    try
     try
      ixMes := Existe(Mes, qyGeral.FieldByName('MES').AsString);
      if ixMes = -1 then
      begin
        SetLength(Mes, High(Mes)+2);
        ixMes := High(Mes);
        Mes[ixMes] := qyGeral.FieldByName('MES').AsString;
      end;

      ixProvincia := Existe(Provincia, qyGeral.FieldByName('PROVINCIA').AsString);
      if ixProvincia = -1 then
      begin
        SetLength(MesPro, High(Provincia)+2);
        SetLength(Provincia, High(Provincia)+2);
        ixProvincia := High(Provincia);
        Provincia[ixProvincia] := qyGeral.FieldByName('PROVINCIA').AsString;
      end;

      if id in [cPessoasAconTestProvincias] then
      begin
        MesPro[ixProvincia][ixMes][1]  := qyGeral.FieldByName('ACONS').AsFloat;
        MesPro[ixProvincia][ixMes][2]  := qyGeral.FieldByName('TEST').AsFloat;
      end
      else if id in [cObitoTarvProvincia] then
      begin
        MesPro[ixProvincia][ixMes][1]  := qyGeral.FieldByName('TEST').AsFloat;
        MesPro[ixProvincia][ixMes][2]  := qyGeral.FieldByName('POSIT').AsFloat;
      end
      else if id in [cPessoasAconTestPosProvincias] then
      begin
        MesPro[ixProvincia][ixMes][1]  := qyGeral.FieldByName('ACONS').AsFloat;
        MesPro[ixProvincia][ixMes][2]  := qyGeral.FieldByName('TEST').AsFloat;
        MesPro[ixProvincia][ixMes][3]  := qyGeral.FieldByName('POSIT').AsFloat;
      end
      else if id in [cObitoTrimestral] then
      begin
        MesPro[ixProvincia][ixMes][1]  := qyGeral.FieldByName('POSIT').AsFloat;
        MesPro[ixProvincia][ixMes][2]  := qyGeral.FieldByName('TEST').AsFloat;
      end
      else if id in [cAcompTarvProvincia,cCriancaAcompTarvProvincia,
            cAdultoAcompTarvProvincias,cGravidasPosiPTVTrimestral] then
      begin
        MesPro[ixProvincia][ixMes][1]  := qyGeral.FieldByName('POSIT').AsFloat;
        MesPro[ixProvincia][ixMes][2]  := qyGeral.FieldByName('TEST').AsFloat;
      end
      else
      begin
        MesPro[ixProvincia][ixMes][1]  := qyGeral.FieldByName('TEST').AsFloat;
        MesPro[ixProvincia][ixMes][2]  := qyGeral.FieldByName('POSIT').AsFloat;
      end;

      if id in [cAcompPosiProvincia, cPosiTarvProvincia,
                cCriancasExpostasTrimestral,
                cAbanTarvProvincia,
                cTransTarvProvincia,cObitoTarvProvincia] then
      begin
        if (MesPro[ixProvincia][ixMes][2]) > 0 then
        MesPro[ixProvincia][ixMes][3]  := Round(((MesPro[ixProvincia][ixMes][1] /
                                                  MesPro[ixProvincia][ixMes][2]) * 100), 2);
      end
      else if id=cObitoTrimestral then
      begin
        MesPro[ixProvincia][ixMes][3]  := (MesPro[ixProvincia][ixMes][1] +
                                           MesPro[ixProvincia][ixMes][2]);
      end
      else if not (id in [cPessoasAconTestPosProvincias]) then
      begin
        if (MesPro[ixProvincia][ixMes][1]) > 0 then
        MesPro[ixProvincia][ixMes][3]  := Round(((MesPro[ixProvincia][ixMes][2] /
                                                  MesPro[ixProvincia][ixMes][1]) * 100), 2);
      end
      else if not (id in [cAcompTarvProvincia,cCriancaAcompTarvProvincia,
                      cAdultoAcompTarvProvincias,cGravidasPosiPTVTrimestral]) then
      begin
        if (MesPro[ixProvincia][ixMes][1]) > 0 then
        MesPro[ixProvincia][ixMes][3]  := Round(((MesPro[ixProvincia][ixMes][2] /
                                                  MesPro[ixProvincia][ixMes][1]) * 100), 2);
      end;

     except
       on E:Exception do
         ShowMessage('Erro:' + inttostr(ixProvincia) + ' x ' +
         inttostr(ixMes) + chr(13) + e.message);
     end;
   finally
    qyGeral.Next;
   end;
  end;
  qyGeral.Close;

  sRel.Add('<table align="center" height="23" cellSpacing="0" cellPadding="0" width="100%" >');
  sRel.Add('<tr>');
  sRel.Add('  <td width="23">');
  sRel.Add('      <img onmouseover="this.style.cursor=''pointer''" onclick="AbreFecha(' + nmRel +
               ')" height="23" src="imagens/Dados.gif" width="23" border="0"/>');
  sRel.Add('  </td>');
  sRel.Add('<td class="ExpTit" colspan="11" background="imagens/PastaFundo.gif">');
  sRel.Add(Titulo+'</td>');
  sRel.Add('</tr>');

  sRel.Add('<tr id="' + nmRel + '" style="display:none"><td></td><td colspan="12">');
  sRel.Add('<table class="sample" align="center" height="23"  width="100%" >');
  sRel.Add('<tr class="TabTit"><td class="ExpSubTit" rowspan="3" align="center">Provincia</td>');

  cSpan := 12;

  if id=cPessoasAconTestProvincias then
  begin
    sAux := 'Aconselhados e Testados';
    ctMes := 3;
  end
  else
  if id=cPessoasAconTestPosProvincias then
  begin
    sAux := 'Aconselhados, Testados e Positivos';
    ctMes := 3;
  end
  else
  if id=cGestantePTVLocal then
  begin
    sAux := 'PTV segundo local do parto';
    ctMes := 3;
  end
  else
  if id=cAdultoSexoTestPosiProvincias then
  begin
    sAux := 'Sexo';
    ctMes := 2;
  end
  else
  if id=cAcompTarvProvincia then
  begin
    sAux := 'Em acompanhamento e em TARV';
    ctMes := 2;
  end
  else
  if id=cPosiTarvProvincia then
  begin
    sAux := 'Positivo e em TARV';
    ctMes := 2;
  end
  else
  if id=cAcompPosiProvincia then
  begin
    sAux := 'Positivo em acompanhamento';
    ctMes := 2;
  end
  else
  if id=cTransTarvProvincia then
  begin
    sAux := 'Trasnferecia TARV';
    ctMes := 2;
  end
  else
  if id=cAbanTarvProvincia then
  begin
    sAux := 'Abandono TARV';
    ctMes := 2;
  end
  else
  if id=cObitoTarvProvincia then
  begin
    sAux := 'Obito TARV';
    ctMes := 2;
  end
  else
  begin
    sAux := 'M�s do Relatorio';
    //ctMes := 2;
    ctMes := MesesEntre(gdtDe, gdtAte);
    cSpan := ctMes * 3;
    cSpan := cSpan + 3; //Total
  end;

  sRel.Add('<td colspan="'+intTostr(cSpan)+'" class="ExpSubTit" align="center">'+sAux+'</td></tr>');
  sRel.Add('<tr class="TabTit">');
  try
    for x:= 0 to ctMes-1 do
      begin
        sAux := '<td colspan="3" class="ExpSubTit" align="center">%s</td>';
        if x > High(Mes) then
        begin
          z := strToInt(Mes[High(Mes)])+1;
          sRel.Add(Format(sAux,[Extenso(intToStr(z),id)]));
        end
        else
        sRel.Add(Format(sAux,[Extenso(Mes[x],id)]));
      end;
      sRel.Add('<td colspan="3" class="ExpSubTit" align="center">Total</td>');
  except
{     on E:Exception do
       ShowMessage(titulo + chr(13) + e.message);
}  end;

  sRel.Add('</tr><tr>');
  if id=cPessoasAconTestProvincias then
  begin
     sAux := '<td class="ExpSubTit" align="center">Acon.</td>'+
             '<td class="ExpSubTit" align="center">Test.</td>'+
             '<td class="ExpSubTit" align="center">%</td>'
  end
  else if id=cPessoasAconTestPosProvincias then
  begin
     sAux := '<td class="ExpSubTit" align="center">Acon.</td>'+
             '<td class="ExpSubTit" align="center">Test.</td>'+
             '<td class="ExpSubTit" align="center">Posit.</td>';
  end
  else if id in [cGestantePTVAdmissao,cGestantePTVLocal] then
  begin
     sAux := '<td class="ExpSubTit" align="center">Grav.</td>'+
             '<td class="ExpSubTit" align="center">Pos.</td>'+
             '<td class="ExpSubTit" align="center">%</td>';
  end
  else
  begin
     sAux := '<td class="ExpSubTit" align="center">Test.</td>'+
             '<td class="ExpSubTit" align="center">Posit.</td>'+
             '<td class="ExpSubTit" align="center">%</td>';
  end;

  if id in [cAdultoAcompTarvProvincias, cAcompTarvProvincia, cCriancaAcompTarvProvincia] then
    sAux := '<td class="ExpSubTit" align="center">Acomp.</td>'+
            '<td class="ExpSubTit" align="center">TARV</td>'+
            '<td class="ExpSubTit" align="center">%</td>';

  if id=cAcompPosiProvincia then
    sAux := '<td class="ExpSubTit" align="center">Acomp.</td>'+
            '<td class="ExpSubTit" align="center">Posi.</td>'+
            '<td class="ExpSubTit" align="center">%</td>';

  if id=cPosiTarvProvincia then
    sAux := '<td class="ExpSubTit" align="center">TARV.</td>'+
            '<td class="ExpSubTit" align="center">Posi.</td>'+
            '<td class="ExpSubTit" align="center">%</td>';

  if id=cCriancasExpostasTrimestral then
    sAux := '<td class="ExpSubTit" align="center">NReceb.</td>'+
            '<td class="ExpSubTit" align="center">Receb.</td>'+
            '<td class="ExpSubTit" align="center">%</td>';

  if id=cObitoTrimestral then
    sAux := '<td class="ExpSubTit" align="center">Crian�a</td>'+
            '<td class="ExpSubTit" align="center">Adulto</td>'+
            '<td class="ExpSubTit" align="center">Total</td>';

  if id=cGravidasPosiPTVTrimestral then
    sAux := '<td class="ExpSubTit" align="center">Posi.</td>'+
            '<td class="ExpSubTit" align="center">PTV</td>'+
            '<td class="ExpSubTit" align="center">%</td>';

  if id=cAbanTarvProvincia then
    sAux := '<td class="ExpSubTit" align="center">Aban.</td>'+
            '<td class="ExpSubTit" align="center">TARV.</td>'+
            '<td class="ExpSubTit" align="center">%</td>';

  if id=cTransTarvProvincia then
    sAux := '<td class="ExpSubTit" align="center">Transf.</td>'+
            '<td class="ExpSubTit" align="center">TARV</td>'+
            '<td class="ExpSubTit" align="center">%</td>';

  if id=cObitoTarvProvincia then
    sAux := '<td class="ExpSubTit" align="center">Obito</td>'+
            '<td class="ExpSubTit" align="center">TARV</td>'+
            '<td class="ExpSubTit" align="center">%</td>';

  for x:= 0 to ctMes-1 do
    sRel.Add(sAux);
  sRel.Add(sAux);
  sRel.Add('</tr>');

  try
    TGeral.Posi := 0;
    TGeral.Test := 0;
    TGeral.Perc := 0;
    SetLength(vGrafico, High(Provincia)+2);
    for x:= Low(Provincia) to High(Provincia) do
    begin
      sAux := '<tr><td class="ExpSubTit">%s</td>';
      sRel.Add(Format(sAux,[Provincia[x]]));
      vValor.Posi := 0;
      vValor.Test := 0;
      vValor.Perc := 0;
      for y := 0 to ctMes-1 do
      begin
         if (y <= High(MesPro[x])) then
         begin
           sAux := '<td class="ExpCabLn2">%8.0f</td>'; //TabCabVlr
           sRel.Add(Format(sAux,[MesPro[x][y][1]]));
           sRel.Add(Format(sAux,[MesPro[x][y][2]]));
           sAux := '<td class="ExpCabLn2">%8.2f</td>'; //TabCabVlr
           sRel.Add(Format(sAux,[MesPro[x][y][3]]));

           if y > High(Mes) then
           begin
             Total[y].Posi := 0;
             Total[y].Test := 0;
           end
           else
           begin
             vValor.Posi := vValor.Posi + MesPro[x][y][1];
             vValor.Test := vValor.Test + MesPro[x][y][2];
             Total[y].Posi := Total[y].Posi + MesPro[x][y][1];
             Total[y].Test := Total[y].Test + MesPro[x][y][2];

             if id in [cPessoasAconTestPosProvincias, cAcompTarvProvincia,cCriancaAcompTarvProvincia,
                      cAdultoAcompTarvProvincias] then
             begin
               vValor.Perc := vValor.Perc + MesPro[x][y][3];
               Total[y].Perc := Total[y].Perc + MesPro[x][y][3];
             end;
           end;
         end
         else
         begin
           sRel.Add('<td class="ExpCabLn2">0,00</td>');
           sRel.Add('<td class="ExpCabLn2">0,00</td>');
           sRel.Add('<td class="ExpCabLn2">0,00</td>');
           Total[y].Posi := 0;
           Total[y].Test := 0;
         end;
      end;
      //Total Linha
      sAux := '<td class="TabCabVlr">%8.0f</td>';
      sRel.Add(Format(sAux,[vValor.Posi]));
      sRel.Add(Format(sAux,[vValor.Test]));
      sAux := '<td class="TabCabVlr">%8.2f</td>';
      //cAdultoTestPosiProvincias,cPessoasTestPosiProvincias
      if id in [cPosiTarvProvincia,
                cCriancasExpostasTrimestral,
                cAbanTarvProvincia,
                cTransTarvProvincia,cObitoTarvProvincia] then
      begin
        if vValor.Test> 0 then
          vValor.Perc :=  (vValor.Posi/vValor.Test)*100;
          //vValor.Perc :=  (vValor.Test/vValor.Posi)*100;
      end
      else if id in [cAcompTarvProvincia,cCriancaAcompTarvProvincia,
                      cAdultoAcompTarvProvincias, cGravidasPosiPTVTrimestral] then
      begin
        if vValor.Posi> 0 then
          //vValor.Perc :=  (vValor.Posi/vValor.Test)*100;
          vValor.Perc :=  (vValor.Test/vValor.Posi)*100;
      end
      else if id in [cObitoTrimestral] then
      begin
        vValor.Perc :=  (vValor.Posi+vValor.Test);
      end
      else if not(id in [cPessoasAconTestPosProvincias]) then
      begin
        if vValor.Posi > 0 then
          vValor.Perc :=  (vValor.Test/vValor.Posi)*100;
          //vValor.Perc :=  (vValor.Posi/vValor.Test)*100;
      end;
      sRel.Add(Format(sAux,[vValor.Perc]));

      //Dados Grafico
      sAux := '<string>%s</string>';
      vGrafico[x].y := Format(sAux,[Provincia[x]]);
      sAux := FloatToStr(Round(vValor.Perc,2));
      sAux := StringReplace(sAux,',','.',[]);
      sAux := '<number bevel=''data''>'+sAux+'</number>';
      vGrafico[x].x := sAux;
      vGrafico[x].v := vValor.Perc;

      sRel.Add('  </tr>');
    end;
  except
   on E:Exception do
     ShowMessage(titulo + chr(13) + e.message);
  end;

  sRel.Add('  <tr><td class="ExpSubTit">Total</td>');
  for y:=0 to ctMes-1 do
  begin
    TGeral.Posi := TGeral.Posi + Total[y].Posi;
    TGeral.Test := TGeral.Test + Total[y].Test;

    if id in [cPessoasAconTestPosProvincias] then
      TGeral.Perc := TGeral.Perc + Total[y].Perc;

    sAux := '<td class="TabCabVlr">%8.0f</td>'; //TabCabVlr
    sRel.Add(Format(sAux,[Total[y].Posi]));
    sRel.Add(Format(sAux,[Total[y].Test]));
    if id in [cAcompPosiProvincia, cPosiTarvProvincia,
                cCriancasExpostasTrimestral,
                cAbanTarvProvincia,
                cTransTarvProvincia,cObitoTarvProvincia] then
    begin
      if Total[y].Test > 0 then
        Total[y].Perc := Round(((Total[y].Posi / Total[y].Test) * 100), 2);
    end
    else if id in [cObitoTrimestral] then
    begin
      Total[y].Perc :=  (Total[y].Posi+Total[y].Test);
    end
    else if not(id in [cPessoasAconTestPosProvincias]) then
    begin
      if Total[y].Posi > 0 then
        Total[y].Perc := Round(((Total[y].Test / Total[y].Posi) * 100), 2);
    end
    else if not(id in [cAcompTarvProvincia, cCriancaAcompTarvProvincia, cGravidasPosiPTVTrimestral, cAdultoAcompTarvProvincias]) then
    begin
      if Total[y].Posi > 0 then
        Total[y].Perc := Round(((Total[y].Test / Total[y].Posi) * 100), 2);
    end;
      sAux := '<td class="TabCabVlr">%8.2f</td>'; //TabCabVlr
      sRel.Add(Format(sAux,[Total[y].Perc]));
  end;

  //Total Geral
  sAux := '<td class="TabCabVlr">%8.0f</td>'; //TabCabVlr
  sRel.Add(Format(sAux,[TGeral.Posi]));
  sRel.Add(Format(sAux,[TGeral.Test]));
  sAux := '<td class="TabCabVlr">%8.2f</td>'; //TabCabVlr
  if id in [cAcompPosiProvincia, cPosiTarvProvincia,
                cCriancasExpostasTrimestral,
                cAbanTarvProvincia,
                cTransTarvProvincia,cObitoTarvProvincia] then
  begin
    if TGeral.Test > 0 then
      TGeral.Perc := (TGeral.Posi / TGeral.Test) * 100;
  end
  else if id in [cObitoTrimestral] then
  begin
    TGeral.Perc :=  (TGeral.Posi+TGeral.Test);
  end
  else if not(id in [cPessoasAconTestPosProvincias])  then
  begin
    if TGeral.Posi > 0 then
      TGeral.Perc := (TGeral.Test / TGeral.Posi) * 100;
  end;
  sRel.Add(Format(sAux,[TGeral.Perc]));
  sRel.Add('   </tr>');

  //Ordernar por vValor
  Ordenar(1);
{
  //Grafico
  sGra.Add('<row>');
  sGra.Add('<null/>');
  for x:= Low(vGrafico) to High(vGrafico) do
     sGra.Add(vGrafico[x].y);
  sGra.Add('</row>');

  sGra.Add('<row>');
  sGra.Add('<string>region A</string>');
  for x:= Low(vGrafico) to High(vGrafico) do
     sGra.Add(vGrafico[x].x);
  sGra.Add('</row>');
  sRel.Add('<tr class="TabTit">');
  sRel.Add('<td width="20">');
    sRel.Add('  <img onmouseover="this.style.cursor=''pointer''" onclick="AbreFecha(G' + nmRel +')" height="20" src="imagens/grafico.jpg" width="20" border="0"/>');
  sRel.Add('</td>');
  sRel.Add('<td colspan="12">Gr�fico</tr>');
  sRel.Add('</tr>');
  sRel.Add('<tr id="G' + nmRel + '" style="display:none"><td colspan="13">');
  sRel.Add('<div height="300" width="450" align="center">'+Grafico(nmRel, sGra.Text, id, 1)+'</div>');
  sRel.Add('</td></tr>');
}
  sRel.Add('  </table>');
  sRel.Add(' </td></tr>');
  sRel.Add('</table>');

  result := sRel.Text;
finally
  FreeAndNil(sRel);
  FreeAndNil(sGra);
  SetLength(Provincia,0);
  SetLength(Mes,0);
  SetLength(MesPro,0);
  SetLength(vGrafico,0);
end;
end;
//******************************************************************************

//******************************RELATORIO2**************************************
function Relatorio2(sql,parametro,tipo,titulo:string;id:integer):string;
var Mes,Provincia:array of string;
    MesPro:array of array[0..2] of array[1..3] of real;
    ctMes, ixMes, ixProvincia, x, y, z:integer;
    Perc, Total, TGeral: Real;
    sAux,nmRel, sCampo:string;
    sRelat,sGra:TStringList;
    TLinha: array of Real;
    TColuna:array[0..2] of Real;
    vGrafico:array[0..2] of array of TGrafico;

  procedure Ordenar(ix:integer);
  var i,j:integer; x:TGrafico;
      n1,n2:real;
  begin
     for I := Low(vGrafico[ix]) to (High(vGrafico[ix])-1) do
     begin
         for J := I+1 to High(vGrafico[ix]) do
         begin
              n1 := vGrafico[ix][I].v;
              n2 := vGrafico[ix][J].v;
              if n1 > n2 then
              begin
                   X.x := vGrafico[ix][I].x;
                   X.y := vGrafico[ix][I].y;
                   X.v := vGrafico[ix][I].v;
                   vGrafico[ix][I].x := vGrafico[ix][J].x;
                   vGrafico[ix][I].y := vGrafico[ix][J].y;
                   vGrafico[ix][I].v := vGrafico[ix][J].v;
                   vGrafico[ix][J].x := X.x;
                   vGrafico[ix][J].y := X.y;
                   vGrafico[ix][J].v := X.v;
              end;
         end;
     end;
  end;

begin
sRelat := TStringList.Create;
sGra := TStringList.Create;
try
  try
  inc(idRel);
  nmRel := 'rel' + intToStr(idRel);
  sAux := sCondicao;

  if (Parametro <> '') and (sAux <> '') then
    sAux :=  sAux + ' AND ' + Parametro
  else if (Parametro <> '') and (sAux = '') then
    sAux :=  Parametro;

  if sAux <> '' then
    sAux :=  ' AND ' + sAux;

  sAux := DefineTipo(sAux);
  
  case id of
   cPessoasPosiProvincias, cAdultoSexoPosiProvincias : sCampo := 'POSITIVO';
   cPessoasAconProvincias : sCampo := 'ACONSELHADOS';
   cPessoasTestProvincias : sCampo := '(NEGATIVO+POSITIVO+INDETERMINADO)';
  end;

  ctMes := 2;
  if id in[cAdultoSexoPosiProvincias,cAcompProvincia,cTarvProvincia] then
    ctMes := 1;

  qyGeral.Close;
  if sCampo<>'' then
    qyGeral.SQL.Text:= Format(sql, [sCampo, sAux])
  else
    qyGeral.SQL.Text:= Format(sql, [sAux]);
  qyGeral.Open;
  qyGeral.First;
  while not qyGeral.Eof do
  begin
    try
     try
      ixMes := Existe(Mes, qyGeral.FieldByName('MES').AsString);
      if ixMes = -1 then
      begin
        SetLength(Mes, High(Mes)+2);
        ixMes := High(Mes);
        Mes[ixMes] := qyGeral.FieldByName('MES').AsString;
      end;

      ixProvincia := Existe(Provincia, qyGeral.FieldByName('PROVINCIA').AsString);
      if ixProvincia = -1 then
      begin
        SetLength(MesPro, High(Provincia)+2);
        SetLength(Provincia, High(Provincia)+2);
        ixProvincia := High(Provincia);
        Provincia[ixProvincia] := qyGeral.FieldByName('PROVINCIA').AsString;
      end;

      MesPro[ixProvincia][ixMes][1]  := qyGeral.FieldByName('POSIT').AsFloat;
      MesPro[ixProvincia][ixMes][2]  := 0;
     except
{       on E:Exception do
         ShowMessage('Erro:' + inttostr(ixProvincia) + ' x ' +
         inttostr(ixMes) + chr(13) + titulo + chr(13) + e.message);
}     end;
   finally
    qyGeral.Next;
   end;
  end;
  qyGeral.Close;

  sRel.Add('<table align="center" height="23" cellSpacing="0" cellPadding="0" width="100%" >');
  sRel.Add('<tr>');
  sRel.Add('  <td width="23">');
  sRel.Add('      <img onmouseover="this.style.cursor=''pointer''" onclick="AbreFecha(' + nmRel +
               ')" height="23" src="imagens/Dados.gif" width="23" border="0"/>');
  sRel.Add('  </td>');
  sRel.Add('<td class="ExpTit" colspan="12" background="imagens/PastaFundo.gif">');
  sRel.Add(Titulo+'</td>');
  sRel.Add('</tr>');
  sRel.Add('<tr id="' + nmRel + '" style="display:none"><td></td><td colspan="12">');
  sRel.Add('<table class="sample" align="center" height="23"  width="100%" >');
  sRel.Add('<tr class="TabTit"><td class="ExpSubTit" rowspan="3" align="center">Provincia</td>');
  sAux := '<td colspan="12" class="ExpSubTit" align="center">Pessoas %s</td></tr>';
  if tipo=cAconselhados then sAux := Format(sAux,['Aconselhadas']);
  if tipo=cPositivos then sAux := Format(sAux,['Positivas']);
  if tipo=cTestados then sAux := Format(sAux,['Testadas']);
  if id=cAcompProvincia then sAux := Format(sAux,['Acompanhadas']);
  if id=cTarvProvincia then sAux := Format(sAux,['em TARV']);

  sRel.Add(sAux);
  sRel.Add('<tr class="TabTit">');

  try

   //Grafico Pizza
    Setlength(vGrafico[1],ctMes+1);
    for x:= 0 to ctMes do
      begin
        sAux := '<td colspan="2" class="ExpSubTit" align="center">%s</td>';
        if x > High(Mes) then
        begin
          z := strToInt(Mes[High(Mes)])+1;
          sAux := Format(sAux,[Extenso(intToStr(z),id)]);
          sRelat.Add(sAux);
          sAux := '<string>%s</string>';
          sAux := Format(sAux,[Extenso(intToStr(z),id)]);
          vGrafico[1][High(Mes)].x := sAux;
        end
        else
        begin
          sAux := Format(sAux,[Extenso(Mes[x],id)]);
          sRelat.Add(sAux);
          sAux := '<string>%s</string>';
          sAux := Format(sAux,[Extenso(Mes[x],id)]);
          vGrafico[1][x].x := sAux;
        end;
      end;

      sRelat.Add('<td colspan="2" class="ExpSubTit" align="center">Total</td>');
  except
{     on E:Exception do
       ShowMessage(titulo + chr(13) + e.message);
}  end;

  if tipo=cAconselhados then sAux := 'Acon.';
  if tipo=cPositivos then sAux := 'Posit.';
  if tipo=cTestados then sAux := 'Test.';
  if id=cAcompProvincia then sAux := 'Acomp.';
  if id=cTarvProvincia then sAux := 'TARV';

  sAux := '<td class="ExpSubTit" align="center">'+sAux+'</td><td class="ExpSubTit" align="center">%</td>';
  sRelat.Add('</tr><tr>');
  for x:=0 to ctMes do
    sRelat.Add(sAux);
  sRelat.Add(sAux);
  sRelat.Add('</tr>');

  try
    //#1 - Total
    SetLength(TLinha, High(Provincia)+1);
    SetLength(vGrafico[0], High(Provincia)+2);

    //Calculo dos Totais
    Total := 0;
    TGeral:= 0;
    for x:= Low(Provincia) to High(Provincia) do
    begin
      //Total Linha
      for y := 0 to ctMes do
        if (y <= High(MesPro[x])) then
        begin
           Total := Total + MesPro[x][y][1];
           //Total Coluna
           TColuna[y] := TColuna[y] + MesPro[x][y][1];
        end;
      TLinha[x] := Total;
      TGeral := TGeral + Total;
      Total := 0;
    end;

    for x:= Low(Provincia) to High(Provincia) do
    begin
      sAux := '<tr><td class="ExpSubTit">%s</td>';
      sRelat.Add(Format(sAux,[Provincia[x]]));

      for y := 0 to ctMes do
      begin
         if (y <= High(MesPro[x])) then
         begin
           sAux := '<td class="ExpCabLn2">%8.0f</td>'; //TabCabVlr
           sRelat.Add(Format(sAux,[MesPro[x][y][1]]));
           sAux := '<td class="ExpCabLn2">%8.2f</td>'; //TabCabVlr
           //#1 - Calcula % Linha
           if TLinha[x]>0 then
             MesPro[x][y][3] := (MesPro[x][y][1] / TLinha[x])*100;
           sRelat.Add(Format(sAux,[MesPro[x][y][3]]));
         end
         else
         begin
           sRelat.Add('<td class="ExpCabLn2">0,00</td>');
           sRelat.Add('<td class="ExpCabLn2">0,00</td>');
         end;
      end;
      //Total Linha
      sAux := '<td class="TabCabVlr">%8.0f</td>';
      sRelat.Add(Format(sAux,[TLinha[x]]));
      sAux := '<td class="TabCabVlr">%8.2f</td>';
      Perc := (TLinha[x]/TGeral) * 100;
      sRelat.Add(Format(sAux,[Perc]));

      //Dados Grafico 1
      sAux := '<string>%s</string>';
      vGrafico[0][x].y := Format(sAux,[Provincia[x]]);
      sAux := FloatToStr(Round(Perc,2));
      sAux := StringReplace(sAux,',','.',[]);
      sAux := '<number bevel=''data''>'+sAux+'</number>';
      vGrafico[0][x].x := sAux;
      vGrafico[0][x].v := Perc;

      sRelat.Add('  </tr>');
    end;
  except
{   on E:Exception do
     ShowMessage(titulo + chr(13) + e.message);
}  end;

  //Total Coluna
  sRelat.Add('  <tr><td class="ExpSubTit">Total</td>');
  for y:=0 to ctMes do
  begin
    sAux := '<td class="TabCabVlr">%8.0f</td>'; //TabCabVlr
    sRelat.Add(Format(sAux,[TColuna[y]]));
    sAux := '<td class="TabCabVlr">%8.2f</td>'; //TabCabVlr
    Perc := 0;
    if TGeral>0 then
     Perc := (TColuna[y]/TGeral) * 100;
    sRelat.Add(Format(sAux,[Perc]));
    vGrafico[1][y].v := TColuna[y];
    sAux := '<number bevel=''data''>%8.2f</number>';
    sAux := Format(sAux,[TColuna[y]]);
    sAux := StringReplace(sAux,',','.',[]);
    vGrafico[1][y].y := sAux;
  end;

  //Total Geral
  sAux := '<td class="TabCabVlr">%8.0f</td>'; //TabCabVlr
  sRelat.Add(Format(sAux,[TGeral]));
  sAux := '<td class="TabCabVlr">%8.2f</td>'; //TabCabVlr
  Perc := 0;
  if TGeral>0 then
    Perc := (TGeral / TGeral) * 100;
  sRelat.Add(Format(sAux,[Perc]));

  //Ordernar por vValor
  Ordenar(0);

  //Grafico Barras
  sGra.Clear;
  sGra.Add('<row>');
  sGra.Add('<null/>');
  for x:= Low(vGrafico[0]) to High(vGrafico[0]) do
     sGra.Add(vGrafico[0][x].y);
  sGra.Add('</row>');

  sGra.Add('<row>');
  sGra.Add('<string>Region A</string>');
  for x:= Low(vGrafico[0]) to High(vGrafico[0]) do
     sGra.Add(vGrafico[0][x].x);
  sGra.Add('</row>');
{
  sRelat.Add('<tr class="TabTit">');
  sRelat.Add('<td width="20">');
    sRelat.Add('  <img onmouseover="this.style.cursor=''pointer''" onclick="AbreFecha(G' + nmRel +'1)" height="20" src="imagens/grafico.jpg" width="20" border="0"/>');
  sRelat.Add('</td>');
  sRelat.Add('<td colspan="12">Gr�fico Barras</tr>');
  sRelat.Add('</tr>');
  sRelat.Add('<tr id="G' + nmRel + '1" style="display:none"><td colspan="13">');
  sRelat.Add('<div height="300" width="450" align="center">'+Grafico(nmRel+'1', sGra.Text, id, 1)+'</div>');
  sRelat.Add('</td></tr>');
}
  //Grafico Pizza
  sGra.Clear;
  sGra.Add('<row>');
  sGra.Add('<null/>');
  for x:= Low(vGrafico[1]) to High(vGrafico[1]) do
     sGra.Add(vGrafico[1][x].x);
  sGra.Add('</row>');

  sGra.Add('<row>');
  sGra.Add('<string></string>');
  for x:= Low(vGrafico[1]) to High(vGrafico[1]) do
     sGra.Add(vGrafico[1][x].y);
  sGra.Add('</row>');
{
  sRelat.Add('<tr class="TabTit">');
  sRelat.Add('<td width="20">');
    sRelat.Add('  <img onmouseover="this.style.cursor=''pointer''" onclick="AbreFecha(G' + nmRel +'2)" height="20" src="imagens/grafico.jpg" width="20" border="0"/>');
  sRelat.Add('</td>');
  sRelat.Add('<td colspan="12">Gr�fico Pizza</tr>');
  sRelat.Add('</tr>');
  sRelat.Add('<tr id="G' + nmRel + '2" style="display:none"><td colspan="13">');
  sRelat.Add('<div height="300" width="450" align="center">'+Grafico(nmRel+'2', sGra.Text, id, 2)+'</div>');
  sRelat.Add('</td></tr>');
}
  //Grafico Linha
  SetLength(vGrafico[2],High(vGrafico[0])+2);
  vGrafico[2] := vGrafico[0];

  sGra.Clear;
  sGra.Add('<row>');
  sGra.Add('<null/>');
  for x:= Low(vGrafico[2]) to High(vGrafico[2]) do
     sGra.Add(vGrafico[2][x].y);
  sGra.Add('</row>');

  sGra.Add('<row>');
  sGra.Add('<string>region A</string>');
  for x:= Low(vGrafico[2]) to High(vGrafico[2]) do
     sGra.Add(vGrafico[2][x].x);
  sGra.Add('</row>');
{
  sRelat.Add('<tr class="TabTit">');
  sRelat.Add('<td width="20">');
    sRelat.Add('  <img onmouseover="this.style.cursor=''pointer''" onclick="AbreFecha(G' + nmRel +'3)" height="20" src="imagens/grafico.jpg" width="20" border="0"/>');
  sRelat.Add('</td>');
  sRelat.Add('<td colspan="12">Gr�fico Linha</tr>');
  sRelat.Add('</tr>');
  sRelat.Add('<tr id="G' + nmRel + '3" style="display:none"><td colspan="13">');
  sRelat.Add('<div height="300" width="450" align="center">'+Grafico(nmRel+'3', sGra.Text, id, 3)+'</div>');
  sRelat.Add('</td></tr>');
}
  sRelat.Add('  </table>');
  sRelat.Add(' </td></tr>');
  sRelat.Add('</table>');

  result := sRelat.Text;
  except
    on E:Exception do
     Showmessage(titulo + chr(13) + E.Message);
  end;
finally
  FreeAndNil(sRelat);
  FreeAndNil(sGra);
  SetLength(Provincia,0);
  SetLength(Mes,0);
  SetLength(MesPro,0);
  SetLength(TLinha,0);
  SetLength(vGrafico[0],0);
  SetLength(vGrafico[1],0);
  SetLength(vGrafico[2],0);
end;
end;
//******************************************************************************

//******************************RELATORIO3**************************************
function Relatorio3(sql,parametro,tipo,titulo:string;id:integer):string;
var Mes,Provincia:array of string;
    MesPro:array of array[0..2] of array[1..4] of real;
    ctMes, ixMes, ixProvincia, x, y, z:integer;
    Perc, Total, TGeral: Real;
    sAux,nmRel, sCampo:string;
    sRelat,sGra:TStringList;
    TLinha: array of array[1..4] of Real;
    TColuna:array[0..3] of array[1..4] of Real;

begin
sRelat := TStringList.Create;
sGra := TStringList.Create;
try
  try
  inc(idRel);
  nmRel := 'rel' + intToStr(idRel);
  sAux := sCondicao;

  if (Parametro <> '') and (sAux <> '') then
    sAux :=  sAux + ' AND ' + Parametro
  else if (Parametro <> '') and (sAux = '') then
    sAux :=  Parametro;

  if sAux <> '' then
    sAux :=  ' AND ' + sAux;

  //AR 28/10/2014
  sAux := DefineTipo(sAux);

  ctMes := 2;

  qyGeral.Close;
  qyGeral.SQL.Text:= Format(sql, [sAux]);
  qyGeral.Open;
  qyGeral.First;
  while not qyGeral.Eof do
  begin
    try
     try
      ixMes := Existe(Mes, qyGeral.FieldByName('MES').AsString);
      if ixMes = -1 then
      begin
        SetLength(Mes, High(Mes)+2);
        ixMes := High(Mes);
        Mes[ixMes] := qyGeral.FieldByName('MES').AsString;
      end;

      ixProvincia := Existe(Provincia, qyGeral.FieldByName('PROVINCIA').AsString);
      if ixProvincia = -1 then
      begin
        SetLength(MesPro, High(Provincia)+2);
        SetLength(Provincia, High(Provincia)+2);
        SetLength(TLinha, High(Provincia)+2);
        ixProvincia := High(Provincia);
        Provincia[ixProvincia] := qyGeral.FieldByName('PROVINCIA').AsString;
      end;

      MesPro[ixProvincia][ixMes][1]  := qyGeral.FieldByName('ACONSELHADOS').AsFloat;
      MesPro[ixProvincia][ixMes][2]  := qyGeral.FieldByName('POSITIVO').AsFloat;
      MesPro[ixProvincia][ixMes][3]  := qyGeral.FieldByName('NEGATIVO').AsFloat;
      MesPro[ixProvincia][ixMes][4]  := qyGeral.FieldByName('INDETERMINADO').AsFloat;

      TLinha[ixProvincia][1] := TLinha[ixProvincia][1] + MesPro[ixProvincia][ixMes][1] ;
      TLinha[ixProvincia][2] := TLinha[ixProvincia][2] + MesPro[ixProvincia][ixMes][2] ;
      TLinha[ixProvincia][3] := TLinha[ixProvincia][3] + MesPro[ixProvincia][ixMes][3] ;
      TLinha[ixProvincia][4] := TLinha[ixProvincia][4] + MesPro[ixProvincia][ixMes][4] ;

      TColuna[ixMes][1] := TColuna[ixMes][1] + MesPro[ixProvincia][ixMes][1] ;
      TColuna[ixMes][2] := TColuna[ixMes][2] + MesPro[ixProvincia][ixMes][2] ;
      TColuna[ixMes][3] := TColuna[ixMes][3] + MesPro[ixProvincia][ixMes][3] ;
      TColuna[ixMes][4] := TColuna[ixMes][4] + MesPro[ixProvincia][ixMes][4] ;

     except
       on E:Exception do
         ShowMessage('Erro:' + inttostr(ixProvincia) + ' x ' +
         inttostr(ixMes) + chr(13) + titulo + chr(13) + e.message);
     end;
   finally
    qyGeral.Next;
   end;
  end;
  qyGeral.Close;

  sRel.Add('<table align="center" height="23" cellSpacing="0" cellPadding="0" width="100%" >');
  sRel.Add('<tr>');
  sRel.Add('  <td width="23">');
  sRel.Add('      <img onmouseover="this.style.cursor=''pointer''" onclick="AbreFecha(' + nmRel +
               ')" height="23" src="imagens/Dados.gif" width="23" border="0"/>');
  sRel.Add('  </td>');
  sRel.Add('<td class="ExpTit" colspan="12" background="imagens/PastaFundo.gif">');
  sRel.Add(Titulo+'</td>');
  sRel.Add('</tr>');
  sRel.Add('<tr id="' + nmRel + '" style="display:none"><td></td><td colspan="12">');
  sRel.Add('<table class="sample" align="center" height="23"  width="100%" >');
  sRel.Add('<tr class="TabTit"><td class="ExpSubTit" rowspan="3" align="center">Provincia</td>');
  sAux := '<td colspan="16" class="ExpSubTit" align="center">Aconselhados, Positivos, Negativos, Indeterminados</td></tr>';
  sRel.Add(sAux);
  sRel.Add('<tr class="TabTit">');

  try

    for x:= 0 to ctMes do
      begin
        sAux := '<td colspan="4" class="ExpSubTit" align="center">%s</td>';
        if x > High(Mes) then
        begin
          z := strToInt(Mes[High(Mes)])+1;
          sAux := Format(sAux,[Extenso(intToStr(z),id)]);
          sRelat.Add(sAux);
        end
        else
        begin
          sAux := Format(sAux,[Extenso(Mes[x],id)]);
          sRelat.Add(sAux);
        end;
      end;

      sRelat.Add('<td colspan="4" class="ExpSubTit" align="center">Total</td>');
  except
     on E:Exception do
       ShowMessage(titulo + chr(13) + e.message);
  end;

  sAux := '<td class="ExpSubTit" align="center">Acons.</td>'+
          '<td class="ExpSubTit" align="center">Positivo</td>'+
          '<td class="ExpSubTit" align="center">Negativo</td>'+
          '<td class="ExpSubTit" align="center">Indet.</td>';
  sRelat.Add('</tr><tr>');
  for x:=0 to ctMes  do
    sRelat.Add(sAux);
  sRelat.Add(sAux);
  sRelat.Add('</tr>');

  try
    for x:= Low(Provincia) to High(Provincia) do
    begin
      sAux := '<tr><td class="ExpSubTit">%s</td>';
      sRelat.Add(Format(sAux,[Provincia[x]]));

      for y := 0 to ctMes + 1 do
      begin
         if (y <= High(MesPro[x])) then
         begin
           sAux := '<td class="ExpCabLn2">%8.0f</td>'; //TabCabVlr
           sRelat.Add(Format(sAux,[MesPro[x][y][1]]));
           sRelat.Add(Format(sAux,[MesPro[x][y][2]]));
           sRelat.Add(Format(sAux,[MesPro[x][y][3]]));
           sRelat.Add(Format(sAux,[MesPro[x][y][4]]));
         end
         else
         begin
           sAux := '<td class="ExpCabLn2">%8.0f</td>'; //TabCabVlr
           sRelat.Add(Format(sAux,[TLinha[x][1]]));
           sRelat.Add(Format(sAux,[TLinha[x][2]]));
           sRelat.Add(Format(sAux,[TLinha[x][3]]));
           sRelat.Add(Format(sAux,[TLinha[x][4]]));
         end;
      end;
      sRelat.Add('  </tr>');
    end;
  except
   on E:Exception do
     ShowMessage(titulo + chr(13) + e.message);
  end;

  //Total Coluna
  sRelat.Add('  <tr><td class="ExpSubTit">Total</td>');
  sAux := '<td class="ExpCabLn2">%8.0f</td>'; //TabCabVlr
  for y := 0 to ctMes do
  begin
    TColuna[3][1] := TColuna[3][1] + TColuna[y][1];
    TColuna[3][2] := TColuna[3][2] + TColuna[y][2];
    TColuna[3][3] := TColuna[3][3] + TColuna[y][3];
    TColuna[3][4] := TColuna[3][4] + TColuna[y][4];

    sRelat.Add(Format(sAux,[TColuna[y][1]]));
    sRelat.Add(Format(sAux,[TColuna[y][2]]));
    sRelat.Add(Format(sAux,[TColuna[y][3]]));
    sRelat.Add(Format(sAux,[TColuna[y][4]]));
  end;
  sRelat.Add(Format(sAux,[TColuna[3][1]]));
  sRelat.Add(Format(sAux,[TColuna[3][2]]));
  sRelat.Add(Format(sAux,[TColuna[3][3]]));
  sRelat.Add(Format(sAux,[TColuna[3][4]]));
  sRelat.Add('</tr>');

  sRelat.Add('  </table>');
  sRelat.Add(' </td></tr>');
  sRelat.Add('</table>');

  result := sRelat.Text;
  except
    on E:Exception do
     Showmessage(titulo + chr(13) + E.Message);
  end;
finally
  FreeAndNil(sRelat);
  SetLength(Provincia,0);
  SetLength(Mes,0);
  SetLength(MesPro,0);
  SetLength(TLinha,0);
end;
end;

  function IncluirRelatorio(piRelatorio:integer):boolean;
  var i:integer;
  begin
    case piRelatorio of
      cAdultoTestPosiProvincias : i:=1;
      cCriancaTestPosiProvincias : i:=2;
      cGestanteTestPosiProvincias : i:=3;
      cPessoasTestPosiProvincias : i:=4;
      cPessoasGeralProvincias : i:=5;

      cPessoasAconProvincias : i:=6;
      cPessoasTestProvincias : i:=7;
      cPessoasPosiProvincias : i:=8;

      cPessoasAconTestProvincias : i:=9;
      cPessoasAconTestPosProvincias : i:=10;

      cAdultoSexoPosiProvincias : i:=11;
      cAdultoSexoTestPosiProvincias : i:=12;
      cAcompTarvProvincia : i:=13;
      cCriancaAcompTarvProvincia : i:=14;
      cPosiTarvProvincia : i:=15;
      cAcompPosiProvincia : i:=16;
      cAcompProvincia : i:=17;
      cTarvProvincia : i:=18;
      cCriancasExpostasTrimestral : i:=19;
      cObitoTrimestral : i:=20;
      cGravidasPosiPTVTrimestral : i:=21;
      cAbanTarvProvincia : i:=22;
      cTransTarvProvincia : i:=23;
      cObitoTarvProvincia : i:=24;
      cAdultoAcompTarvProvincias : i:=25;
      cGestantePTVAdmissao : i:=26;
      cGestantePTVLocal : i:=27;
    end;
    ProgressBar1.Position := ProgressBar1.Position + 1;
    Application.ProcessMessages;
    result := lstRelatorios.Checked[i] or lstRelatorios.Checked[0];
  end;

//******************************************************************************

begin
  sRel := TStringList.Create;
  sExcel := TStringList.Create;
  try
    sCondicao := DefineFiltro;
    idRel := 0;
    sRel.Clear;
    sRel.Add('<html>');
    sRel.Add('<head>');
    sRel.Add('<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1"/>');
    sRel.Add('<link href="css/ConsultaXML.css" type="text/css" rel="stylesheet"/>');
    sRel.Add('<link href="css/grafico.css" type="text/css" rel="stylesheet"/>');
    sRel.Add('<script type="text/JavaScript"  language="javascript" src="scripts/ConsultaXML.js"></script>');
    sRel.Add('<script language="javascript">AC_FL_RunContent = 0;</script>');
    sRel.Add('<script language="javascript"> DetectFlashVer = 0;</script>');
    sRel.Add('<script src="AC_RunActiveContent.js" language="javascript"></script>');
    sRel.Add('<script language="JavaScript" type="text/javascript">');
    sRel.Add('<!--');
    sRel.Add('var requiredMajorVersion = 10;');
    sRel.Add('var requiredMinorVersion = 0;');
    sRel.Add('var requiredRevision = 45;');
    sRel.Add('-->');
    sRel.Add('</script>');
    sRel.Add('</head>');
    sRel.Add('<body>');
    sRel.Add('<div id="dv">');
    sRel.Add('<div style="display:none"> Data/Hora:'+FormatDateTime('dd/mm/yyyy hh:nn:ss',Now)+
    ' Computador:'+ NomeDoComputador +'</div>');
    {sRel.Add('      <img onmouseover="this.style.cursor=''pointer''" onclick="ExportHTMLTableToExcel()" '+
             '         height="23" src="imagens/excel.jpg" width="23" border="0"/>');
    }
    sTitulo := 'Distribui��o de adultos * testadas e positivas por prov�ncias';
    try
      if IncluirRelatorio(cAdultoTestPosiProvincias) then
      begin
        sAux := Relatorio(sSQLProvinciaTrimestral, cFaixaAdultoNaoGestante, sTitulo, cAdultoTestPosiProvincias);
        sRel.Add(sAux);
      end;
    except
{      on E:Exception do
        ShowMessage(stitulo + chr(13) + e.Message);
}    end;


    sTitulo := 'Distribui��o de criancas * testadas e positivas por prov�ncias';
    try
      if IncluirRelatorio(cCriancaTestPosiProvincias) then
      begin
        sAux := Relatorio(sSQLProvinciaTrimestral, cFaixaCriancaNaoGestante, sTitulo, cCriancaTestPosiProvincias);
        sRel.Add(sAux);
      end;
    except
{      on E:Exception do
        ShowMessage(stitulo + chr(13) + e.Message);
}    end;

    stitulo := 'Distribui��o de gestantes * testadas e positivas por prov�ncias';
    try
      if IncluirRelatorio(cGestanteTestPosiProvincias)then
      begin
        sAux := Relatorio(sSQLProvinciaTrimestral, cFaixaGestante, sTitulo, cGestanteTestPosiProvincias);
        sRel.Add(sAux);
      end;
    except
{      on E:Exception do
        ShowMessage(stitulo + chr(13) + e.Message);
}    end;

    sTitulo := 'Distribui��o de pessoas * testadas e positivas por prov�ncias';
    try
      if IncluirRelatorio(cPessoasTestPosiProvincias) then
      begin
        sAux := Relatorio(sSQLProvinciaTrimestral, cFaixaPessoas, sTitulo, cPessoasTestPosiProvincias);
        sRel.Add(sAux);
      end;
    except
{      on E:Exception do
        ShowMessage(stitulo + chr(13) + e.Message);
}    end;

    sTitulo := 'Distribui��o de gestantes, criancas e adultos ATV por prov�ncias';
    try
      if IncluirRelatorio(cPessoasGeralProvincias) then
      begin
        sAux := Relatorio3(sSQLGeralProvinciaTrimestral, '',cPositivos, sTitulo, cPessoasGeralProvincias);
        sRel.Add(sAux);
      end;
    except
{      on E:Exception do
        ShowMessage(stitulo + chr(13) + e.Message);
}    end;

    sTitulo := 'Distribui��o de gestantes, criancas e adultos aconselhadas por prov�ncias';
    try
      if IncluirRelatorio(cPessoasAconProvincias) then
      begin
        sAux := Relatorio2(sSQLPosiProvinciaTrimestral, '',cAconselhados, sTitulo, cPessoasAconProvincias);
        sRel.Add(sAux);
      end;
    except
{      on E:Exception do
        ShowMessage(stitulo + chr(13) + e.Message);
}    end;

    sTitulo := 'Distribui��o de gestantes, criancas e adultos testadas por prov�ncias';
    try
      if IncluirRelatorio(cPessoasTestProvincias) then
      begin
        sAux := Relatorio2(sSQLPosiProvinciaTrimestral, '',cTestados, sTitulo, cPessoasTestProvincias);
        sRel.Add(sAux);
      end;
    except
{      on E:Exception do
        ShowMessage(stitulo + chr(13) + e.Message);
}    end;

    sTitulo := 'Distribui��o de gestantes, criancas e adultos positivas por prov�ncias';
    try
      if IncluirRelatorio(cPessoasPosiProvincias) then
      begin
        sAux := Relatorio2(sSQLPosiProvinciaTrimestral, '',cPositivos, sTitulo, cPessoasPosiProvincias);
        sRel.Add(sAux);
      end;
    except
{      on E:Exception do
        ShowMessage(stitulo + chr(13) + e.Message);
}    end;

    sTitulo := 'Distribui��o de gestantes, criancas e adultos aconselhadas e testadas por prov�ncias'; ///FALTA ADULTOS
    try
      if IncluirRelatorio(cPessoasAconTestProvincias) then
      begin
        sAux := Relatorio(sSQLAconTestPosProvincia, '',sTitulo, cPessoasAconTestProvincias);
        sRel.Add(sAux);
      end;
    except
{      on E:Exception do
        ShowMessage(stitulo + chr(13) + e.Message);
}    end;

//AR 28/10/2014 Indicador com tabela duplicada
//*******Inicio*****
{    sTitulo := 'Distribui��o de gestantes, criancas e adultos aconselhadas, testadas e positivas por prov�ncias';/// FALTA ADULTOS
    try
      if IncluirRelatorio(cPessoasAconTestPosProvincias) then
      begin
        sAux := Relatorio(sSQLAconTestPosProvincia, '',sTitulo, cPessoasAconTestPosProvincias);
        sRel.Add(sAux);
      end;
    except
      on E:Exception do
        ShowMessage(stitulo + chr(13) + e.Message);
    end;
}
//*******Fim*****
    sTitulo := 'Distribui��o de Pessoas por sexo e prov�ncias';
    try
      if IncluirRelatorio(cAdultoSexoPosiProvincias) then
      begin
        sAux := Relatorio2(sSQLPosiProvinciaSexo, cFaixaPessoas, cPositivos, sTitulo, cAdultoSexoPosiProvincias);
        sRel.Add(sAux);
      end;
    except
{      on E:Exception do
        ShowMessage(stitulo + chr(13) + e.Message);
}    end;

    sTitulo := 'Distribui��o de adultos testadas e positivas por sexo e prov�ncias';
    try
      if IncluirRelatorio(cAdultoSexoTestPosiProvincias) then
      begin
        sAux := Relatorio(sSQLTestPosiProvinciaSexo, '', sTitulo, cAdultoSexoTestPosiProvincias);
        sRel.Add(sAux);
      end;
    except
{      on E:Exception do
        ShowMessage(stitulo + chr(13) + e.Message);
}    end;

    sTitulo := 'Distribui��o de criancas e adultos em acompanhamento e TARV por prov�ncias';
    try
      if IncluirRelatorio(cAcompTarvProvincia) then
      begin
        sAux := Relatorio(sSQLAcompTarvProvincia, '', sTitulo, cAcompTarvProvincia);
        sRel.Add(sAux);
      end;
    except
{      on E:Exception do
        ShowMessage(stitulo + chr(13) + e.Message);
}    end;

    sTitulo := 'Distribui��o de criancas em acompanhamento e TARV por prov�ncias';
    try
      if IncluirRelatorio(cCriancaAcompTarvProvincia) then
      begin
        sAux := Relatorio(sSQLCriancaAcompTarvProvincia, '', sTitulo, cCriancaAcompTarvProvincia);
        sRel.Add(sAux);
      end;
    except
{      on E:Exception do
        ShowMessage(stitulo + chr(13) + e.Message);
}    end;

    sTitulo := 'Distribui��o de criancas e adultos positivos em TARV por prov�ncias';
    try
      if IncluirRelatorio(cPosiTarvProvincia) then
      begin
        sAux := Relatorio(sSQLPosiTarvProvincia, '', sTitulo, cPosiTarvProvincia);
        sRel.Add(sAux);
      end;
    except
{      on E:Exception do
        ShowMessage(stitulo + chr(13) + e.Message);
}    end;

    sTitulo := 'Distribui��o de criancas e adultos positivos em acompanhamento por prov�ncias';
    try
      if IncluirRelatorio(cAcompPosiProvincia) then
      begin
        sAux := Relatorio(sSQLAcompPosiProvincia, '', sTitulo, cAcompPosiProvincia);
        sRel.Add(sAux);
      end;
    except
{      on E:Exception do
        ShowMessage(stitulo + chr(13) + e.Message);
}    end;

    sTitulo := 'Distribui��o de pessoas acompanhadas prov�ncias';
    try
      if IncluirRelatorio(cAcompProvincia) then
      begin
        sAux := Relatorio2(sSQLAcompProvincia, '','', sTitulo, cAcompProvincia);
        sRel.Add(sAux);
      end;
    except
{      on E:Exception do
        ShowMessage(stitulo + chr(13) + e.Message);
}    end;

    sTitulo := 'Distribui��o de pessoas em TARV por prov�ncias';
    try
      if IncluirRelatorio(cTarvProvincia) then
      begin
        sAux := Relatorio2(sSQLTarvProvincia, '','', sTitulo, cTarvProvincia);
        sRel.Add(sAux);
      end;
    except
{      on E:Exception do
        ShowMessage(stitulo + chr(13) + e.Message);
}    end;

    sTitulo := 'Distribui��o de criancas expostas por prov�ncias';
    try
      if IncluirRelatorio(cCriancasExpostasTrimestral) then
      begin
        sAux := Relatorio(sSQLCriancasExpostasTrimestral, '', sTitulo, cCriancasExpostasTrimestral);
        sRel.Add(sAux);
      end;
    except
{      on E:Exception do
        ShowMessage(stitulo + chr(13) + e.Message);
}    end;

    sTitulo := 'Distribui��o de criancas e adultos em obito por prov�ncias';
    try
      if IncluirRelatorio(cObitoTrimestral) then
      begin
        sAux := Relatorio(sSQLObitoTrimestral, '', sTitulo, cObitoTrimestral);
        sRel.Add(sAux);
      end;
    except
{      on E:Exception do
        ShowMessage(stitulo + chr(13) + e.Message);
}    end;

    sTitulo := 'Distribui��o de gestantes positivas em PTV por prov�ncias';
    try
      if IncluirRelatorio(cGravidasPosiPTVTrimestral) then
      begin
        sAux := Relatorio(sSQLGravidasPosiPTVTrimestral, '', sTitulo, cGravidasPosiPTVTrimestral);
        sRel.Add(sAux);
      end;
    except
{      on E:Exception do
        ShowMessage(stitulo + chr(13) + e.Message);
}    end;

    sTitulo := 'Distribui��o de criancas e adultos Abandono TARV por prov�ncias';
    try
      if IncluirRelatorio(cAbanTarvProvincia) then
      begin
        sAux := Relatorio(sSQLAbanTarvProvincia, '', sTitulo, cAbanTarvProvincia);
        sRel.Add(sAux);
      end;
    except
{      on E:Exception do
        ShowMessage(stitulo + chr(13) + e.Message);
}    end;

    sTitulo := 'Distribui��o de criancas e adultos Transferidos TARV por prov�ncias';
    try
      if IncluirRelatorio(cTransTarvProvincia) then
      begin
        sAux := Relatorio(sSQLAbanTarvProvincia, '', sTitulo, cTransTarvProvincia);
        sRel.Add(sAux);
      end;
    except
{      on E:Exception do
        ShowMessage(stitulo + chr(13) + e.Message);
}    end;

    sTitulo := 'Distribui��o de criancas e adultos em �bito TARV por prov�ncias';
    try
      if IncluirRelatorio(cObitoTarvProvincia) then
      begin
        sAux := Relatorio(sSQLObitoTarvProvincia, '', sTitulo, cObitoTarvProvincia);
        sRel.Add(sAux);
      end;
    except
{      on E:Exception do
        ShowMessage(stitulo + chr(13) + e.Message);
}    end;

    sTitulo := 'Distribui��o de adultos em Acompanhamento e em TARV por prov�ncias';
    try
      if IncluirRelatorio(cAdultoAcompTarvProvincias) then
      begin
        sAux := Relatorio(sSQLAdultoAcompTarvProvincia, '', sTitulo, cAdultoAcompTarvProvincias);
        sRel.Add(sAux);
      end;
    except
{      on E:Exception do
        ShowMessage(stitulo + chr(13) + e.Message);
}   end;

{    sTitulo := 'Distribui��o de gestantes em PTV segundo momento de admiss�o por prov�ncias';
    try
      if IncluirRelatorio(cGestantePTVAdmissao) then
      begin
        sAux := Relatorio(sSQLGestantePTVAdmissao, '', sTitulo, cGestantePTVAdmissao);
        sRel.Add(sAux);
      end;
    except
      on E:Exception do
        ShowMessage(stitulo + chr(13) + e.Message);
   end;
}
{    sTitulo := 'Distribui��o de gestantes em PTV segundo local do parto por prov�ncias';
    try
      if IncluirRelatorio(cGestantePTVLocal) then
      begin
        sAux := Relatorio(sSQLGestantePTVLocal, '', sTitulo, cGestantePTVLocal);
        sRel.Add(sAux);
      end;
    except
      on E:Exception do
        ShowMessage(stitulo + chr(13) + e.Message);
   end;
}
    sRel.Add('</div>');
    sRel.Add('</body>');
    sRel.Add('</html>');

    memo1.Text := sRel.Text;

  finally
    sRel.SaveToFile(sArqWEB);
    FreeAndNil(sRel);
    FreeAndNil(sExcel);
  end;
end;

procedure TfrmRelGeralPrograma.FormCreate(Sender: TObject);
begin
  inherited;
  sArqWEB := sPathConsulta + FormatDateTime('ddmmyyyyhhnnss',Date) + '.html';
  sArqLog := sPathTemp + FormatDateTime('ddmmyyyyhhnnss',Date) + '.txt';
  tsGrafico.TabVisible := False;
  sLog := TStringList.Create;
  CarregaComboMesAno;
//  dtDe.date := strtodate('01/01/2012');
//  dtAte.date := strtodate('31/03/2012');
  dmGeral.TB_VERSAO_RELATORIO.Close;
  dmGeral.TB_VERSAO_RELATORIO.ParamByName('TP_RELATORIO').AsInteger := cvGERALPROGRAMA;
  dmGeral.TB_VERSAO_RELATORIO.Open;
end;


procedure TfrmRelGeralPrograma.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  if FileExists(sArqWEB) then
    DeleteFile(sArqWEB);

  FreeAndNil(sLog);
end;

function TfrmRelGeralPrograma.BMPtoJPG
   (var BMPpic, JPGpic: string):boolean;
var Bitmap: TBitmap;
    JpegImg: TJpegImage;
begin
  Result:=False;
  Bitmap := TBitmap.Create;
  try
   Bitmap.LoadFromFile(BMPpic) ;
   JpegImg := TJpegImage.Create;
   try
    JpegImg.Assign(Bitmap) ;
    JpegImg.SaveToFile(JPGpic) ;
    Result:=True;
   finally
    JpegImg.Free
   end;
  finally
   Bitmap.Free;
   DeleteFile(BMPpic);
  end;
end;

procedure TfrmRelGeralPrograma.btLocUnidadeButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
begin
  inherited;
  frmLocalizar := TfrmLocalizar.Create(application);
  frmLocalizar.Caption := 'Localizar Unidade';
  frmLocalizar.qyDados := SelectDadosUnidade;

  try
    frmLocalizar.Where := false;
    SetLength(VCampo,2);
    frmLocalizar.KeyField := 'cd_unidade';
    VCampo[0].Titulo  := 'C�d.';
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
  FreeAndNil(frmLocalizar);
end;

procedure TfrmRelGeralPrograma.btLocProvinciaButtonClick(
  Sender: TObject; AbsoluteIndex: Integer);
begin
  inherited;
  frmLocalizar := TfrmLocalizar.Create(application);
  frmLocalizar.Caption := 'Localizar Provincia';
  frmLocalizar.qyDados := SelectDadosProvincia;
  try
    frmLocalizar.Where := false;
    SetLength(VCampo,2);
    frmLocalizar.KeyField := 'cd_provincia';
    VCampo[0].Titulo  := 'C�d.';
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
  end;
  frmLocalizar.qyDados.Close;
  FreeAndNil(frmLocalizar);
end;

procedure TfrmRelGeralPrograma.btLocMunicipioButtonClick(
  Sender: TObject; AbsoluteIndex: Integer);
begin
  inherited;
  frmLocalizar := TfrmLocalizar.Create(application);
  frmLocalizar.Caption := 'Localizar Munic�pio';
  try
    if (btLocProvincia.Text<>'')then
    begin
      frmLocalizar.qyDados := SelectDadosMunicipio(strToInt(btLocProvincia.Text));
      frmLocalizar.Where := true;
    end;
    SetLength(VCampo,2);
    frmLocalizar.KeyField := 'cd_municipio';
    VCampo[0].Titulo  := 'C�d.';
    VCampo[0].Width := 5;
    VCampo[1].Titulo  := 'Munic�pio';
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
  FreeAndNil(frmLocalizar);
end;

procedure TfrmRelGeralPrograma.btLocUnidadeChange(Sender: TObject);
begin
  inherited;
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

procedure TfrmRelGeralPrograma.btLocProvinciaChange(Sender: TObject);
begin
  inherited;
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

procedure TfrmRelGeralPrograma.btLocMunicipioChange(Sender: TObject);
begin
  inherited;
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
        MessageDlg('� necess�rio incluir uma Provincia!',mtInformation,[mbOK],0);
      end;
  end;
end;

procedure TfrmRelGeralPrograma.btLocUnidadeExit(Sender: TObject);
begin
  inherited;
  if btLocUnidade.Text <> '' then
  begin
    try
      edUnidade.Text := PegaValor('DS_UNIDADE','UNIDADE',['CD_UNIDADE'],
        [btLocUnidade.Text]);
    except
      begin
        MessageDlg('Unidade n�o encontrada!',mtWarning,[mbOK],0);
        btLocUnidade.Clear;
        edUnidade.Clear;
      end;
    end;
  end;
end;

procedure TfrmRelGeralPrograma.btLocProvinciaExit(Sender: TObject);
begin
  inherited;
  if btLocProvincia.Text <> '' then
  begin
    try
      edProvincia.Text := PegaValor('DS_PROVINCIA','PROVINCIA',['CD_PROVINCIA'],
        [btLocProvincia.Text]);
    except
      begin
        MessageDlg('Provincia n�o encontrada!',mtWarning,[mbOK],0);
        btLocProvincia.Clear;
        edProvincia.Clear;
      end;
    end;
  end;

end;

procedure TfrmRelGeralPrograma.btLocMunicipioExit(Sender: TObject);
begin
  inherited;
  if btLocMunicipio.Text <> '' then
    begin
        try
          edMunicipio.Text := PegaValor('DS_MUNICIPIO','MUNICIPIO',['CD_MUNICIPIO'],
            [btLocMunicipio.Text]);
         except
            begin
              MessageDlg('Municipio n�o encontrado!',mtWarning,[mbOK],0);
              btLocMunicipio.Clear;
              edMunicipio.Clear;
            end;
         end;
    end;
end;


function TfrmRelGeralPrograma.DefineFiltro: string;
var sAux, sAnd:string;
begin
  if btLocProvincia.Text <> '' then
  begin
    sAux := ' REGISTRO_PROGRAMA.CD_PROVINCIA = ' + btLocProvincia.Text;
    sAnd := ' and ';
  end;

  if btLocMunicipio.Text <> '' then
  begin
    sAux := sAux + ' REGISTRO_PROGRAMA.CD_MUNICIPIO = ' + btLocMunicipio.Text;
    sAnd := ' and ';
  end;

  if btLocUnidade.Text <> '' then
  begin
    sAux := sAux + ' REGISTRO_PROGRAMA.CD_UNIDADE = ' + btLocUnidade.Text;
    sAnd := ' and ';
  end;

  if (cbde.Text <> '  /    ') and (cbate.Text <> '  /    ')then
    if cbde.Text = cbate.Text then
    begin
      sAux := sAux + ' REGISTRO_PROGRAMA.VL_MESANO = ' +
        QuotedStr(cbDe.text);
    end
    else
    begin
      {sAux := sAux + ' REGISTRO_PROGRAMA.VL_MESANO between ' +
        QuotedStr(cbde.text) + ' and ' +
        QuotedStr(cbAte.text);}
      sAux := sAux + ' ((REGISTRO_PROGRAMA.VL_MES between ' +
        QuotedStr(copy(cbde.text,1,2)) + ' and ' +
        QuotedStr(copy(cbAte.text,1,2));
      sAux := sAux + ') AND (REGISTRO_PROGRAMA.VL_ANO between ' +
        QuotedStr(copy(cbde.text,4,4)) + ' and ' +
        QuotedStr(copy(cbAte.text,4,4)) + '))';
    end;
  result := sAux;

end;

function TfrmRelGeralPrograma.DefineTipo(sCondicao: String): String;
var sTipo:String;
    lstTipo:TStringList;
begin
  //****** Tipo *****
  lstTipo := TStringList.Create;
  try
    sTipo := '';
    lstTipo.Clear;

//AR 28/10/2014 Incluir apenas relatorios e retirar CATV e NOT. Deixar pesquisa fixa e ocultar Aba
//******Inicio********
{    if ckTARV.Checked then
      lstTipo.Add(QuotedStr('TARV'));

    if ckAcomp.Checked then
      lstTipo.Add(QuotedStr('ACP'));

    if ckTARV_ESQ.Checked then
      lstTipo.Add(QuotedStr('ESQ'));

    if ckPrograma.Checked then
      lstTipo.Add(QuotedStr('PRG'));

    if ckATV.Checked then
      lstTipo.Add(QuotedStr('ATV'));

    if ckPTV.Checked then
      lstTipo.Add(QuotedStr('PTV'));

    if ckCaracterizacao.Checked then
      lstTipo.Add(QuotedStr('CRT'));

    if ckNotificacao.Checked then
    begin
      lstTipo.Add(QuotedStr('NTF'));
      lstTipo.Add(QuotedStr('NTA'));
      lstTipo.Add(QuotedStr('NTP'));
      lstTipo.Add(QuotedStr('ABD'));
      lstTipo.Add(QuotedStr('TRA'));
      lstTipo.Add(QuotedStr('OBT'));
    end;}

    lstTipo.Add(QuotedStr('ATV'));
    lstTipo.Add(QuotedStr('PTV'));
    lstTipo.Add(QuotedStr('TARV'));
    lstTipo.Add(QuotedStr('ACP'));
    lstTipo.Add(QuotedStr('ESQ'));
    lstTipo.Add(QuotedStr('PRG'));
//*******Fim******

    sTipo := lstTipo.DelimitedText;
    result := sCondicao;
    if (sTipo<>'') then
    begin
      sTipo := ' TIPO in (' + sTipo + ')';
      if (sCondicao <> '') then
         sCondicao := sCondicao + ' AND ' + sTipo
      else
         sCondicao := sTipo;

      result := sCondicao;
    end;
  finally
    lstTipo.Free;
  end;
  //****** Tipo *****
end;

procedure TfrmRelGeralPrograma.btIncVersaoClick(Sender: TObject);
begin
  inherited;
   dmGeral.TB_VERSAO_RELATORIO.Insert;
   dmGeral.TB_VERSAO_RELATORIOTP_RELATORIO.AsInteger := cvGERALPROGRAMA;
   dmGeral.TB_VERSAO_RELATORIONM_ARQUIVO.AsString := sArqWEB;
   dmGeral.TB_VERSAO_RELATORIOBL_RELATORIO.LoadFromFile(sArqWEB);
   dmGeral.TB_VERSAO_RELATORIO.Post;
end;

procedure TfrmRelGeralPrograma.btImpVersaoClick(Sender: TObject);
begin
  inherited;
   frmRelatorioWEB := TfrmRelatorioWEB.Create(application);
  try
    sArqWEB := dmGeral.TB_VERSAO_RELATORIONM_ARQUIVO.AsString;
    dmGeral.TB_VERSAO_RELATORIOBL_RELATORIO.SaveToFile(sArqWEB);
    frmRelatorioWEB.relatorio.Navigate(sArqWEB);
    frmRelatorioWEB.ShowModal;
  finally
    frmRelatorioWEB.Free;
    if FileExists(sArqWEB) then
      DeleteFile(sArqWEB);
  end;
end;

procedure TfrmRelGeralPrograma.btSalvarVersaoClick(Sender: TObject);
begin
  inherited;
  if (dsVersao.DataSet.State in dsEditModes) then
    dsVersao.DataSet.Post;
end;

procedure TfrmRelGeralPrograma.dsVersaoStateChange(Sender: TObject);
begin
  inherited;
  btSalvarVersao.Enabled := (dsVersao.DataSet.State in dsEditModes);
end;

end.
