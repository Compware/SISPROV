unit uCadATV;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UfrmCadPadFichas, dxExEdtr, DB, dxCntner, dxTL, dxDBCtrl, dxDBGrid,
  ComCtrls, StdCtrls, Buttons, ExtCtrls, Grids, IBCustomDataSet, IBQuery,
  RxLookup, Mask, DBCtrls, DBGrids, RxDBComb, RpCon, RpConDS, RpBase,
  RpSystem, RpDefine, RpRave, DBClient, Midaslib, ImgList, ib_parse,
  dxEditor, dxEdLib, UfrmCadPad, ToolEdit, Menus, UfrmCadPadSG, dxDBTLCl,
  dxGrClms;

type
  TfrmCadATV = class(TfrmCadPadFichas)
    DBGrid1: TDBGrid;
    sgATV: TStringGrid;
    Panel5: TPanel;
    qyProvincia: TIBQuery;
    qyProvinciaCD_PAIS: TIntegerField;
    qyProvinciaCD_PROVINCIA: TIntegerField;
    qyProvinciaDS_PROVINCIA: TIBStringField;
    dsProvincia: TDataSource;
    dsMunicipio: TDataSource;
    qyMunicipio: TIBQuery;
    qyMunicipioCD_MUNICIPIO: TIntegerField;
    qyMunicipioCD_PROVINCIA: TIntegerField;
    qyMunicipioDS_MUNICIPIO: TIBStringField;
    qyUnidade: TIBQuery;
    qyUnidadeCD_UNIDADE: TIntegerField;
    qyUnidadeDS_UNIDADE: TIBStringField;
    dsUnidade: TDataSource;
    Label21: TLabel;
    Label20: TLabel;
    Label1: TLabel;
    Label4: TLabel;
    btConsultar: TBitBtn;
    ckConsolidar: TCheckBox;
    qyGrid: TIBQuery;
    qyATV: TIBQuery;
    grDadosCD_MUNICIPIO: TdxDBGridMaskColumn;
    grDadosCD_PROVINCIA: TdxDBGridMaskColumn;
    grDadosCD_UNIDADE: TdxDBGridMaskColumn;
    grDadosVL_MESANO: TdxDBGridMaskColumn;
    grDadosDS_UNIDADE: TdxDBGridMaskColumn;
    grDadosDS_MUNICIPIO: TdxDBGridMaskColumn;
    grDadosDS_PROVINCIA: TdxDBGridMaskColumn;
    btLimpar: TBitBtn;
    qyGridCD_MUNICIPIO: TIntegerField;
    qyGridCD_PROVINCIA: TIntegerField;
    qyGridCD_UNIDADE: TIntegerField;
    qyGridVL_MESANO: TIBStringField;
    qyGridDS_UNIDADE: TIBStringField;
    qyGridDS_MUNICIPIO: TIBStringField;
    qyGridDS_PROVINCIA: TIBStringField;
    Label2: TLabel;
    cbMesAno: TdxPickEdit;
    lbAte: TLabel;
    cbAte: TdxPickEdit;
    qyGridCHAVE: TIBStringField;
    leProvincia: TRxLookupEdit;
	leMunicipio: TRxLookupEdit;
    leUnidade: TRxLookupEdit;
    qyGridNR_MESANO: TIntegerField;
    qyUnidadeFL_ATIVA: TIBStringField;
    BitBtn1: TBitBtn;
    qyMapaTestagem: TIBQuery;
  
    procedure btConsultarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btgravarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);

    procedure btexcluirClick(Sender: TObject);
    procedure sgATVKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure sgATVDrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure sgATVSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure sgATVSetEditText(Sender: TObject; ACol, ARow: Integer;
      const Value: String);
    procedure btIncluirClick(Sender: TObject);

    procedure ckConsolidarClick(Sender: TObject);
    procedure pgGeralChange(Sender: TObject);
    procedure btCancelarClick(Sender: TObject);
    procedure leProvinciaChange(Sender: TObject);
    procedure leMunicipioChange(Sender: TObject);
    procedure leUnidadeChange(Sender: TObject);

   procedure bteditarClick(Sender: TObject);
    procedure grDadosDblClick(Sender: TObject);
    procedure btLimparClick(Sender: TObject);
    procedure btimprimirClick(Sender: TObject);
    procedure qyGridCalcFields(DataSet: TDataSet);
    procedure FormDestroy(Sender: TObject);
    procedure cbAteChange(Sender: TObject);
    procedure cbAteKeyPress(Sender: TObject; var Key: Char);
    procedure cbMesAnoKeyPress(Sender: TObject; var Key: Char);
    procedure cbMesAnoChange(Sender: TObject);
    procedure sgATVKeyPress(Sender: TObject; var Key: Char);
    procedure cbMesAnoExit(Sender: TObject);
    procedure cbAteExit(Sender: TObject);
    procedure leUnidadeButtonClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
    bCarregaGrid :Boolean;
    function PegaY(TB_ATV:TDataSet): integer;
  public
    { Public declarations }
    sNomeTabela:string;
    procedure CriaGrid; override;
    procedure Varregrid;
    procedure AbreConsultas;
    procedure FechaConsultas;
    procedure CarregaComboMesAno;
    procedure CarregaGrid(TB_ATV:TDataSet; bCriaGrid:boolean = true);
    procedure CarregaDemo;
    procedure CalculaTotal;
    procedure GeraXML; override;
    procedure ConsultaATV;
    function ValidaExclusao:boolean;
    procedure Limpar; override;
    procedure Validar;
  end;

var
  frmCadATV: TfrmCadATV;
  bEdit, bConsolidado:Boolean;
  sSQLATV, sSQLMapa:string;
  Unidade, Provincia, Municipio:Integer;
  MesAno:String;
  PSQL, MSQL, USQL:string;

implementation

uses UDMGERAL, UDM, DateUtils, Ugeral, uRelatorioWEB, uFuncaoGrid,
  uFuncaoContraSenha;

{$R *.dfm}

procedure TfrmCadATV.GeraXML;
var sXML:TStringList;

  procedure GridXML(sg:TStringGrid);
  var r,c:integer; nome,valor:string;
  begin
    for r:=1 to sg.RowCount do
      for c:=1 to sg.ColCount do
      begin
        nome := sg.Name + '_L' + IntToStr(r) + 'C' + IntToStr(c);
        sXML.Add('<'+nome+'>' + sg.Cells[c,r] + '</'+nome+'>');
      end;
  end;

begin
   sXML := TStringList.Create;
   try
      sXML.Add('<?xml version="1.0" encoding="iso-8859-1"?>');
      sXML.Add('<?xml-stylesheet type="text/xsl" href="ATV.xslt"?>');
      sXML.Add('<Programa>');
      sXML.Add('  <Parametros>');
      sXML.Add('    <MUNICIPIO>'+leMunicipio.Text+'</MUNICIPIO>');
      sXML.Add('    <PROVINCIA>'+leProvincia.Text+'</PROVINCIA>');
      sXML.Add('    <UNIDADE>'+leUnidade.Text+'</UNIDADE>');
      sXML.Add('    <PERIODO>'+cbMesAno.Text+'</PERIODO>');
      sXML.Add('    <USU>'+dsControle.DataSet.FieldByName('NM_USU').AsString +'</USU>');
      sXML.Add('    <VERSAO>'+dsControle.DataSet.FieldByName('VL_VERSAO').AsString +'</VERSAO>');
      sXML.Add('  </Parametros>');
      sXML.Add('  <Dados>');

      GridXML(sgATV);

      sXML.Add('  </Dados>');
      sXML.Add(' </Programa>');

      sXML.SaveToFile(sArq);
   finally
      FreeAndNil(sXML);
   end;
end;


procedure TfrmCadATV.CriaGrid;
var r,c:integer;
begin
  for r:=0 to 25 do
   for c:=0 to 6 do
     sgATV.Cells[c,r] := '';

  sgATV.RowCount := 26;
  sgATV.ColCount := 7;
  sgATV.FixedCols := 2;
  sgATV.FixedRows := 2;
  sgATV.Cells[4,0] := ' Resultados dos Testes';
  sgATV.Cells[0,1] := 'Grupos Etários';
  sgATV.Cells[1,1] := 'Sexo';
  sgATV.Cells[2,1] := 'Aconselhados';
  sgATV.Cells[3,1] := 'Positivos';
  sgATV.Cells[4,1] := 'Negativos';
  sgATV.Cells[5,1] := 'Indeterminados';
  sgATV.Cells[6,1] := 'Total';
  sgATV.Cells[0,2] := '1.1 CRIANÇAS';
  sgATV.Cells[0,3] := ' 0-2 anos';
  sgATV.Cells[0,6] := ' 3-14 anos';
  sgATV.Cells[0,9] := '1.2 ADULTOS';
  sgATV.Cells[0,10] := ' 15-24 anos';
  sgATV.Cells[0,13] := ' 25-49 anos';
  sgATV.Cells[0,16] := ' 50 ou mais';
  sgATV.Cells[0,19] := '1.3 GESTANTES';
  sgATV.Cells[0,20] := ' menores de 15';
  sgATV.Cells[0,21] := ' 15-24 anos';
  sgATV.Cells[0,22] := ' 25-49 anos';
  sgATV.Cells[0,23] := ' 50 ou mais';
  sgATV.Cells[0,24] := ' Total';
  sgATV.Cells[0,25] := ' TOTAL GERAL';

  sgATV.Cells[1,3] := ' Feminino';
  sgATV.Cells[1,4] := ' Masculino';
  sgATV.Cells[1,5] := ' Total';

  sgATV.Cells[1,6] := ' Feminino';
  sgATV.Cells[1,7] := ' Masculino';
  sgATV.Cells[1,8] := ' Total';

  sgATV.Cells[1,10] := ' Feminino';
  sgATV.Cells[1,11] := ' Masculino';
  sgATV.Cells[1,12] := ' Total';

  sgATV.Cells[1,13] := ' Feminino';
  sgATV.Cells[1,14] := ' Masculino';
  sgATV.Cells[1,15] := ' Total';

  sgATV.Cells[1,16] := ' Feminino';
  sgATV.Cells[1,17] := ' Masculino';
  sgATV.Cells[1,18] := ' Total';

  sgATV.DefaultColWidth := 100;
  sgATV.DefaultRowHeight := 22;
  sgATV.RowHeights[0] := -1;
  sgATV.ColWidths[0] := 200;
end;

procedure TfrmCadATV.FormShow(Sender: TObject);
begin
  inherited;
  qyGrid.Open;
  CriaGrid;
  pgGeral.ActivePageIndex := 1;
end;

procedure TfrmCadATV.btgravarClick(Sender: TObject);
var sOP,sOperacao:String;
begin
  if bConsolidado then
  begin
    MessageDlg('Dados em modo de consolidação, não podem ser modificados!',mtInformation,[mbOK],0);
  end
  else
  begin

    if (dmGeral.TB_ATV.State = dsEdit) then sOP := 'A';
    if (dmGeral.TB_ATV.State = dsInsert) then sOP := 'I';

    Validar;
    ValidaExclusao;
    VarreGrid;

    sOperacao := 'Gravar Relatório!';
    inherited;

    //AR: 05/01/2015 para todas as Fixas será utilizado a Confirmação EDI do INLS e não mais o Bloqueio.
    {if (prmSistemaUnidades=cvNao) then
       inherited
    else if ((prmSistemaUnidades=cvSim)and(ValidaAnoAtual(cbMesAno.Text)))or
            (not ValidaAnoAtual(cbMesAno.Text) and
            (gContraSenhaGlobal or ValidaContraSenha(sOperacao))) then
    begin
      gContraSenhaGlobal := true;
      inherited;
    end
    else
    begin
      btCancelarClick(Sender);
      ShowMessage('Operação cancelada.');
      Exit;
    end;}

    //Protocolo
    try
      sArq := sPathConsulta+'RelatorioATV'+FormatDateTime('ddmmyyhhnnss',now)+'.xml';
      GeraXML;
      dmGeral.ProtocolaEnvio(dmGeral.TB_ATV, cvATV, sOP, sArq);
    finally
      if FileExists(sArq) then
        DeleteFile(sArq);
    end;
  end;
end;

function TfrmCadATV.PegaY(TB_ATV:TDataSet):integer;
var y:integer;
begin
   y:=0;
   if TB_ATV.FieldByName('FL_GESTANTE').AsInteger = cvFlSim then
   begin
      Case  TB_ATV.FieldByName('ID_FAIXA_ETARIA').AsInteger of
        cvFaixaEtaria2: y:=20;
        cvFaixaEtaria3: y:=21;
        cvFaixaEtaria4: y:=22;
        cvFaixaEtaria5: y:=23;
      end;
   end
   else
   begin
     Case  TB_ATV.FieldByName('ID_FAIXA_ETARIA').AsInteger of
        cvFaixaEtaria1: if TB_ATV.FieldByName('FL_SEXO').AsString = cvFeminino then
                          y:=3
                        else if TB_ATV.FieldByName('FL_SEXO').AsString = cvMasculino then
                          y:=4;
        cvFaixaEtaria2: if TB_ATV.FieldByName('FL_SEXO').AsString = cvFeminino then
                          y:=6
                        else if TB_ATV.FieldByName('FL_SEXO').AsString = cvMasculino then
                          y:=7;
        cvFaixaEtaria3: if TB_ATV.FieldByName('FL_SEXO').AsString = cvFeminino then
                          y:=10
                        else if TB_ATV.FieldByName('FL_SEXO').AsString = cvMasculino then
                          y:=11;
        cvFaixaEtaria4: if TB_ATV.FieldByName('FL_SEXO').AsString = cvFeminino then
                          y:=13
                        else if TB_ATV.FieldByName('FL_SEXO').AsString = cvMasculino then
                          y:=14;
        cvFaixaEtaria5: if TB_ATV.FieldByName('FL_SEXO').AsString = cvFeminino then
                          y:=16
                        else if TB_ATV.FieldByName('FL_SEXO').AsString = cvMasculino then
                          y:=17;
     end;
   end;
   result := y;
end;

procedure TfrmCadATV.Varregrid;
var i, nRegistro:integer;
    cdUnidade, cdProvincia, cdMunicipio:Integer;
    sMesAno:String;
begin

  cdProvincia := strtoint(leProvincia.LookupValue);
  sMesAno := cbMesAno.Text;

  if leMunicipio.Text <> '' then
    cdMunicipio := StrtoInt(leMunicipio.LookupValue);

  if leUnidade.Text <> '' then
    cdUnidade := strtoInt(leUnidade.LookupValue);

  nRegistro := dm.GeraCodigo('GEN_REGISTRO_GERAL');

  for i:=2 to 26 do
  begin
     if (i in [3,4,6,7,10,11,13,14,16,17,20,21,22,23]) then
     begin
       if not (dmGeral.TB_ATV.State in [dsEdit,dsInsert]) then
         dmGeral.TB_ATV.Insert;

       dmGeral.TB_ATVCD_REGISTRO_GERAL.AsInteger := nRegistro;

       if cdUnidade <> null then
         dmGeral.TB_ATVCD_UNIDADE.AsInteger := cdUnidade;

       dmGeral.TB_ATVCD_PROVINCIA.AsInteger := cdProvincia;

       if cdMunicipio <> null then
         dmGeral.TB_ATVCD_MUNICIPIO.AsInteger := cdMunicipio;

       dmGeral.TB_ATVVL_MESANO.AsString := sMesAno;
       dmGeral.TB_ATVVL_Y.AsInteger := i;
       dmGeral.TB_ATVDT_REGISTRO.AsDateTime := dm.GetDateTime;

       if (i in [20,21,22,23]) then dmGeral.TB_ATVFL_GESTANTE.AsInteger := cvFlSim;
       if (i in [3,4]) then dmGeral.TB_ATVID_FAIXA_ETARIA.AsInteger := cvFaixaEtaria1;
       if (i in [6,7,20]) then dmGeral.TB_ATVID_FAIXA_ETARIA.AsInteger := cvFaixaEtaria2;
       if (i in [10,11,21]) then dmGeral.TB_ATVID_FAIXA_ETARIA.AsInteger := cvFaixaEtaria3;
       if (i in [13,14,22]) then dmGeral.TB_ATVID_FAIXA_ETARIA.AsInteger := cvFaixaEtaria4;
       if (i in [16,17,23]) then dmGeral.TB_ATVID_FAIXA_ETARIA.AsInteger := cvFaixaEtaria5;
       if (i in [3,6,10,13,16]) then dmGeral.TB_ATVFL_SEXO.AsString := cvFeminino;
       if (i in [4,7,11,14,17]) then dmGeral.TB_ATVFL_SEXO.AsString := cvMasculino;
       if (i in [3,4,6,7,10,11,13,14,16,17,20,21,22,23]) then begin
         dmGeral.TB_ATVVL_ACONSELHADOS.AsString := sgATV.Cells[2,i];
         dmGeral.TB_ATVVL_POSITIVOS.AsString := sgATV.Cells[3,i];
         dmGeral.TB_ATVVL_NEGATIVOS.AsString := sgATV.Cells[4,i];
         dmGeral.TB_ATVVL_INDETERMINADOS.AsString := sgATV.Cells[5,i];
       end;

       dmGeral.TB_ATV.Post;

     end;
  end;


end;

procedure TfrmCadATV.AbreConsultas;
begin
  PSQL := qyProvincia.sql.text;
  MSQL := qyMunicipio.sql.text;
  USQL := qyUnidade.sql.text;
  qyProvincia.Open;
  qyMunicipio.Open;
  qyUnidade.Open;
end;

procedure TfrmCadATV.FechaConsultas;
begin
  qyProvincia.Close;
  qyMunicipio.Close;
  qyUnidade.Close;
end;

procedure TfrmCadATV.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  FechaConsultas;
  //dmGeral.TB_ATV.SelectSQL.Text := sSQLATV;
end;

procedure TfrmCadATV.FormCreate(Sender: TObject);
begin
  nRelatorio := cvATV;
  inherited;
  FbPermiteMudarPagina := False;
  AbreConsultas;
  CarregaComboMesAno;
  bCarregaGrid := True;
  sSQLATV := dmGeral.TB_ATV.SelectSQL.Text;
  sSQLMapa := qyMapaTestagem.Sql.Text;
  sNomeTabela := 'REGISTRO_ATV';
end;

procedure TfrmCadATV.CarregaDemo;
var i,j,x:integer;
begin
{  //Nao Apagar, Isto server para testar as celulas
  DBGrid1.Visible := not DBGrid1.Visible;
  x:=0;
  if DBGrid1.Visible then
  begin
    for i:= 1 to 26 do
    begin
       if (i in [3,4,6,7,10,11,13,14,16,17,20,21,22,23]) then
          for j:= 2 to 5 do
          begin
            inc(x);
            sgATV.Cells[j,i] := intToStr(x);
          end;
    end;
  end
  else
  begin
    for i:= 1 to 26 do
    begin
       if (i in [3,4,6,7,10,11,13,14,16,17,20,21,22,23]) then
          for j:= 2 to 5 do
          begin
            inc(x);
            sgATV.Cells[j,i] := '';
          end;
    end;
  end;
  CalculaTotal;
}
end;

procedure TfrmCadATV.CarregaComboMesAno;
var data:TDate; i:integer;
begin
  data := dm.GetDateTime;
  cbMesAno.Items.Add(FormatDateTime('mm/yyyy',data));
  cbAte.Items.Add(FormatDateTime('mm/yyyy',data));
  for i:= 1 to 11 do
  begin
    cbMesAno.Items.Add(FormatDateTime('mm/yyyy',IncMonth(data,-i)));
    cbAte.Items.Add(FormatDateTime('mm/yyyy',IncMonth(data,-i)));
  end;
end;

procedure TfrmCadATV.btConsultarClick(Sender: TObject);
var sSQLWhere, sSQL, sW:String; nB,nE:Integer;
  dDe,dAte:TDateTime;
begin
  inherited;
  if (dmGeral.TB_ATV.State in [dsEdit, dsInsert]) then
    Exit;

  dmGeral.TB_ATV.Close;
  dmGeral.TB_ATV.SelectSQL.Text := sSQLATV;
  sSQL := sSQLATV;
  qyMapaTestagem.SQL.Text := sSQLMapa;
  if ckConsolidar.Checked then
  begin
    sSQLWhere := '';
    sW := ' where ';

    if leUnidade.LookupValue <> '' then
    begin
      sSQLWhere := sW + 'CD_UNIDADE = :CD_UNIDADE';
      sW := ' and ';
    end;

    if leProvincia.LookupValue <> '' then
    begin
      sSQLWhere := sSQLWhere + sW + 'CD_PROVINCIA = :CD_PROVINCIA';
      sW := ' and ';
    end;

    if leMunicipio.LookupValue <> '' then
    begin
      sSQLWhere := sSQLWhere + sW + 'CD_MUNICIPIO = :CD_MUNICIPIO';
      sW := ' and ';
    end;

    if sSQLWhere<>'' then
    begin
     qyMapaTestagem.SQL.Add(sSQLWhere);
    end;

    if (trim(cbMesAno.Text) <> '/') and (trim(cbAte.Text) <> '/') then
    begin
      sSQLWhere := sSQLWhere + sW  //'VL_MESANO between :de and :ate';
       + 'CAST(''01-''||SUBSTRING(VL_MESANO FROM 1 FOR 2)||''-''||'
       + 'SUBSTRING(VL_MESANO FROM 4 FOR 4) AS DATE)'
       + 'BETWEEN :de and :ate';

      qyMapaTestagem.SQL.Add(sW + 'MAPA_TESTAGEM.DT_MAPA BETWEEN :DE AND :ATE');

      sW := 'and ';
    end;

    SetSQLWhere(sSQL, sSQLWhere);

    dmGeral.TB_ATV.SelectSQL.Text := sSQL;

    if (trim(cbMesAno.Text) <> '/') and (trim(cbAte.Text) <> '/') then
    begin
      dmGeral.TB_ATV.ParamByName('de').AsString := FormatDateTime('mm/dd/yyyy',(StrToDate('01/'+cbMesAno.text)));
      dmGeral.TB_ATV.ParamByName('ate').AsString := FormatDateTime('mm/dd/yyyy',(StrToDate('01/'+cbAte.text)));
    end;

    bConsolidado := true;
  end
  else
  begin
    sSQL := StringReplace(sSQL, 'from "REGISTRO_ATV"', 'from '+sNomeTabela+' REGISTRO_ATV',[]);
    dmGeral.TB_ATV.SelectSQL.Text := sSQL;
    bConsolidado := false;
  end;


  //Felipe 08/05/2013
  if (leProvincia.LookupValue <> '') then
    dmGeral.TB_ATV.ParamByName('CD_PROVINCIA').AsInteger := strtoint(leProvincia.LookupValue);
  if (leMunicipio.LookupValue <> '') then
    dmGeral.TB_ATV.ParamByName('CD_MUNICIPIO').AsInteger := StrToInt(leMunicipio.LookupValue);
  if (leUnidade.LookupValue <> '') then
    dmGeral.TB_ATV.ParamByName('CD_UNIDADE').AsInteger := StrToInt(leUnidade.LookupValue);

  if not ckConsolidar.Checked then
    if (trim(cbMesAno.Text) <> '') then
      dmGeral.TB_ATV.ParamByName('VL_MESANO').AsString := cbMesAno.Text;

  dmGeral.TB_ATV.Open;
  CarregaGrid(dmGeral.TB_ATV);

  //Consilidacao do Mapa Medico
  if ckConsolidar.Checked then
  begin
    if (trim(cbMesAno.Text) <> '/') and (trim(cbAte.Text) <> '/') then
    begin
      dDe := StrToDate('01/'+cbMesAno.text);
      dAte := StrToDate('01/'+cbAte.text);
      dAte := IncMonth(dAte,1);
      dAte := IncDay(dAte,-1);
      qyMapaTestagem.ParamByName('de').AsDate := dDe;
      qyMapaTestagem.ParamByName('ate').AsDate := dAte;
    end;
    if (leProvincia.LookupValue <> '') then
      qyMapaTestagem.ParamByName('CD_PROVINCIA').AsInteger := strtoint(leProvincia.LookupValue);
    if (leMunicipio.LookupValue <> '') then
      qyMapaTestagem.ParamByName('CD_MUNICIPIO').AsInteger := StrToInt(leMunicipio.LookupValue);
    if (leUnidade.LookupValue <> '') then
      qyMapaTestagem.ParamByName('CD_UNIDADE').AsInteger := StrToInt(leUnidade.LookupValue);
    qyMapaTestagem.Open;
    CarregaGrid(qyMapaTestagem, false);
  end;

end;

procedure TfrmCadATV.CarregaGrid(TB_ATV:TDataSet; bCriaGrid:boolean);
var rAux:real;  y:integer;
begin
    if bCriaGrid then
      CriaGrid;
    TB_ATV.First;
    while Not TB_ATV.Eof do
    begin
      if TB_ATV.FieldByName('VL_Y').IsNull then
        y := PegaY(TB_ATV)
      else
        y := TB_ATV.FieldByName('VL_Y').AsInteger;
      raux := valor(sgATV.Cells[2,y]) +
              valor(TB_ATV.FieldByName('VL_ACONSELHADOS').AsString);
      sgATV.Cells[2,y] := floattostr(raux);

      raux := valor(sgATV.Cells[3,y]) +
              valor(TB_ATV.FieldByName('VL_POSITIVOS').AsString);
      sgATV.Cells[3,y] := floattostr(raux);

      raux := valor(sgATV.Cells[4,y]) +
              valor(TB_ATV.FieldByName('VL_NEGATIVOS').AsString);
      sgATV.Cells[4,y] := floattostr(raux);

      raux := valor(sgATV.Cells[5,y]) +
              valor(TB_ATV.FieldByName('VL_INDETERMINADOS').AsString);
      sgATV.Cells[5,y] := floattostr(raux);

      TB_ATV.Next;
    end;
    CalculaTotal;
end;

procedure TfrmCadATV.btexcluirClick(Sender: TObject);
begin
  pgGeral.ActivePageIndex := 1;
  pgGeralChange(sender);

  if bConsolidado then
  begin
    MessageDlg('Dados em modo de consolidação, não podem ser modificados!',mtInformation,[mbOK],0);
  end
  else
  begin
    if Application.MessageBox('Deseja Excluir este registro?','Excluir', MB_YESNO+MB_ICONQUESTION) <> IDYES then
      Abort
    else
    begin
      dmGeral.TB_ATV.Close;
      if leUnidade.LookupValue <> '' then
        dmGeral.TB_ATV.ParamByName('CD_UNIDADE').AsInteger := StrToInt(leUnidade.LookupValue);
      if leProvincia.LookupValue <> '' then
        dmGeral.TB_ATV.ParamByName('CD_PROVINCIA').AsInteger := strtoint(leProvincia.LookupValue);
      if leMunicipio.LookupValue <> '' then
        dmGeral.TB_ATV.ParamByName('CD_MUNICIPIO').AsInteger := StrToInt(leMunicipio.LookupValue);
      dmGeral.TB_ATV.ParamByName('VL_MESANO').AsString := cbMesAno.Text;
      dmGeral.TB_ATV.Open;

      //Felipe 08/05/2013
      {
      dmGeral.TB_ATV.First;
      while not dmGeral.TB_ATV.Eof do
        dmGeral.TB_ATV.Delete;

      dmGeral.TB_ATV.Close; dmGeral.TB_ATV.Open;
      if bCarregaGrid then
        CarregaGrid(DMGERAL.TB_ATV); }

      //Protocolo
      try
        sArq := sPathConsulta+'RelatorioATV'+FormatDateTime('ddmmyyhhnnss',now)+'.xml';
        GeraXML;
        dmGeral.ProtocolaEnvio(dmGeral.TB_ATV, cvATV, 'E', sArq);
      finally
        if FileExists(sArq) then
          DeleteFile(sArq);
      end;

      inherited;

    end;
  end;

end;

procedure TfrmCadATV.sgATVKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if (key = ord('D')) and (shift = [ssShift, ssCtrl]) then
    CarregaDemo;
end;

procedure TfrmCadATV.sgATVDrawCell(Sender: TObject; ACol, ARow: Integer;
  Rect: TRect; State: TGridDrawState);
var Conteudo:String; x,y,hf:integer; al:Word; c:TColor;
begin
  inherited;
{  Conteudo := sgATV.Cells[ACol,ARow];
  //Titulo: Negrito, Centralizado
  if (ACol in [0,1])or
     (ARow in [0,1]) then
  begin
     sgATV.Canvas.Font.Style := [fsbold];
     al := SetTextAlign(sgATV.Canvas.Handle, TA_CENTER);
     hf := sgATV.Canvas.TextHeight('lj');
     x := Rect.Left + ((Rect.Right - Rect.Left)   div 2);
     y := Rect.Top  - ((Rect.Top + hf - Rect.Bottom) div 2);
     sgATV.Canvas.TextRect(Rect,x,y,Conteudo);
     SetTextAlign(sgATV.Canvas.Handle, x);
  end;

  //Aconcelhados
  if ((ARow in [2,5,8,9,12,15,18,19,24,25]) and (ACol=2))
     or ((ARow>1)and(ACol=6))  then
  begin
    sgATV.Canvas.Font.Style:=[fsbold];
    sgATV.Canvas.Brush.Color := $00BFFFFF;
    sgATV.Canvas.FillRect(Rect);
    sgATV.Canvas.TextRect(Rect,Rect.Left,Rect.Top,Conteudo);
  end;

  //Positivos
  if ((ARow in [2,5,8,9,12,15,18,19,24,25]) and (ACol=3))
     or ((ARow>1)and(ACol=6))  then
  begin
    sgATV.Canvas.Font.Style:=[fsbold];
    sgATV.Canvas.Brush.Color := $00BFBFFF;
    sgATV.Canvas.FillRect(Rect);
    sgATV.Canvas.TextRect(Rect,Rect.Left,Rect.Top,Conteudo);
  end;

  //Negativos
  if ((ARow in [2,5,8,9,12,15,18,19,24,25]) and (ACol=4))
     or ((ARow>1)and(ACol=6))  then
  begin
    sgATV.Canvas.Font.Style:=[fsbold];
    sgATV.Canvas.Brush.Color := $00BFDFBF;
    sgATV.Canvas.FillRect(Rect);
    sgATV.Canvas.TextRect(Rect,Rect.Left,Rect.Top,Conteudo);
  end;

  //Indeterminados
  if ((ARow in [2,5,8,9,12,15,18,19,24,25]) and (ACol=5))
     or ((ARow>1)and(ACol=6))  then
  begin
    sgATV.Canvas.Font.Style:=[fsbold];
    sgATV.Canvas.Brush.Color := $00BFDFFF;
    sgATV.Canvas.FillRect(Rect);
    sgATV.Canvas.TextRect(Rect,Rect.Left,Rect.Top,Conteudo);
  end;

  //Total:Negrito, Centralizado, Fundo
  //Positivos, Negativos e Indeterminados
  if ((ARow in [2,5,8,9,12,15,18,19,24,25]) and (ACol=6))
     or ((ARow>1)and(ACol=6))  then
  begin
    sgATV.Canvas.Brush.Color := $00FFDBDB;
    sgATV.Canvas.Font.Style := [fsbold];
     al := SetTextAlign(sgATV.Canvas.Handle, TA_CENTER);
     hf := sgATV.Canvas.TextHeight('lj');
     x := Rect.Left + ((Rect.Right - Rect.Left)   div 2);
     y := Rect.Top  - ((Rect.Top + hf - Rect.Bottom) div 2);
     sgATV.Canvas.TextRect(Rect,x,y,Conteudo);
     SetTextAlign(sgATV.Canvas.Handle, x);
  end;

 }

  Conteudo := sgATV.Cells[ACol,ARow];
  if (ACol in [0,1])or
     (ARow in [0,1]) then
  begin
     sgATV.Canvas.Font.Style := [fsbold];
     //sgATV.Canvas.Font.Color := clBlue;
     x := SetTextAlign(sgATV.Canvas.Handle, TA_CENTER);
     sgATV.Canvas.TextRect(Rect,
      Rect.Left + (Rect.Right - Rect.Left) div 2, Rect.Top + 2, Conteudo);
     SetTextAlign(sgATV.Canvas.Handle, x);
  end;

  //Aconcelhados
  if ((ARow in [2,5,8,9,12,15,18,19,24,25]) and (ACol=2))
     or ((ARow>1)and(ACol=6))  then
  begin
    sgATV.Canvas.Font.Style:=[fsbold];
    sgATV.Canvas.Brush.Color := cl3DLight;
    sgATV.Canvas.FillRect(Rect);
    sgATV.Canvas.TextRect(Rect,Rect.Left,Rect.Top,Conteudo);
  end;

  //Positivos
  if ((ARow in [2,5,8,9,12,15,18,19,24,25]) and (ACol=3))
     or ((ARow>1)and(ACol=6))  then
  begin
    sgATV.Canvas.Font.Style:=[fsbold];
    sgATV.Canvas.Brush.Color := cl3DLight;
    sgATV.Canvas.FillRect(Rect);
    sgATV.Canvas.TextRect(Rect,Rect.Left,Rect.Top,Conteudo);
  end;

  //Negativos
  if ((ARow in [2,5,8,9,12,15,18,19,24,25]) and (ACol=4))
     or ((ARow>1)and(ACol=6))  then
  begin
    sgATV.Canvas.Font.Style:=[fsbold];
    sgATV.Canvas.Brush.Color := cl3DLight;
    sgATV.Canvas.FillRect(Rect);
    sgATV.Canvas.TextRect(Rect,Rect.Left,Rect.Top,Conteudo);
  end;

  //Indeterminados
  if ((ARow in [2,5,8,9,12,15,18,19,24,25]) and (ACol=5))
     or ((ARow>1)and(ACol=6))  then
  begin
    sgATV.Canvas.Font.Style:=[fsbold];
    sgATV.Canvas.Brush.Color := cl3DLight;
    sgATV.Canvas.FillRect(Rect);
    sgATV.Canvas.TextRect(Rect,Rect.Left,Rect.Top,Conteudo);
  end;

  //Total: Positivos, Negativos e Indeterminados
  if ((ARow in [2,5,8,9,12,15,18,19,24,25]) and (ACol=6))
     or ((ARow>1)and(ACol=6))  then
  begin
    sgATV.Canvas.Font.Style:=[fsbold];
    sgATV.Canvas.Brush.Color := cl3DLight;
    sgATV.Canvas.FillRect(Rect);
    sgATV.Canvas.TextRect(Rect,Rect.Left,Rect.Top,Conteudo);
  end;


end;

procedure TfrmCadATV.sgATVSelectCell(Sender: TObject; ACol, ARow: Integer;
  var CanSelect: Boolean);
begin
  inherited;
  bEdit := not(((ARow in [2,5,8,9,12,15,18,19,24,25]) and (ACol>1))
     or ((ARow>1)and(ACol=6)));

  if (bEdit) and (dsControle.DataSet.State in [dsEdit,dsInsert]) then
    sgATV.Options := sgATV.Options + [goEditing]
  else
    sgATV.Options := sgATV.Options - [goEditing];
end;

procedure TfrmCadATV.sgATVSetEditText(Sender: TObject; ACol, ARow: Integer;
  const Value: String);
begin
  inherited;
  CalculaToTal;
end;

procedure TfrmCadATV.CalculaTotal;
var r,c:integer; tl,tc,tg:real;
begin

  for r:=2 to 25 do
  begin

    if (r=5) then
    for c:=2 to 5 do
    begin
      tc :=
        Valor(sgATV.Cells[c,3]) +
        Valor(sgATV.Cells[c,4]);
      sgATV.Cells[c,r] := FloatToStr(tc);
    end;

    if (r=8) then
    for c:=2 to 5 do
    begin
      tc :=
        Valor(sgATV.Cells[c,6]) +
        Valor(sgATV.Cells[c,7]);
      sgATV.Cells[c,r] := FloatToStr(tc);
    end;

    if (r=12) then
    for c:=2 to 5 do
    begin
      tc :=
        Valor(sgATV.Cells[c,10]) +
        Valor(sgATV.Cells[c,11]);
      sgATV.Cells[c,r] := FloatToStr(tc);
    end;

    if (r=15) then
    for c:=2 to 5 do
    begin
      tc :=
        Valor(sgATV.Cells[c,13]) +
        Valor(sgATV.Cells[c,14]);
      sgATV.Cells[c,r] := FloatToStr(tc);
    end;

    if (r=18) then
    for c:=2 to 5 do
    begin
      tc :=
        Valor(sgATV.Cells[c,16]) +
        Valor(sgATV.Cells[c,17]);
      sgATV.Cells[c,r] := FloatToStr(tc);
    end;

    if (r=24) then
    for c:=2 to 5 do
    begin
      tc :=
        Valor(sgATV.Cells[c,20]) +
        Valor(sgATV.Cells[c,21]) +
        Valor(sgATV.Cells[c,22]) +
        Valor(sgATV.Cells[c,23]);
      sgATV.Cells[c,r] := FloatToStr(tc);
    end;

    if (r=25) then
    for c:=2 to 5 do
    begin
      tg :=
        Valor(sgATV.Cells[c, 5]) +
        Valor(sgATV.Cells[c, 8]) +
        Valor(sgATV.Cells[c,12]) +
        Valor(sgATV.Cells[c,15]) +
        Valor(sgATV.Cells[c,18]) +
        Valor(sgATV.Cells[c,24]);
      sgATV.Cells[c,r] := FloatToStr(tg);
    end;

    tl :=
      //Valor(sgATV.Cells[2,r]) +
      Valor(sgATV.Cells[3,r]) +
      Valor(sgATV.Cells[4,r]) +
      Valor(sgATV.Cells[5,r]);
    sgATV.Cells[6,r] := FloatToStr(tl);
  end;
end;

procedure TfrmCadATV.btIncluirClick(Sender: TObject);
begin
  pgGeral.ActivePageIndex := 1;
  dmGeral.TB_ATV.Close;
  dmGeral.TB_ATV.Open;

  inherited;
  leProvincia.Text := '';
  leUnidade.Text := '';
  leMunicipio.Text := '';
  cbMesAno.ItemIndex := -1;
  ckConsolidar.Checked := false;
  bConsolidado := false;
  CriaGrid;
end;

procedure TfrmCadATV.btimprimirClick(Sender: TObject);
begin
  frmRelatorioWEB := TfrmRelatorioWEB.Create(application);
  try
    sArq := sPathConsulta+'RelatorioATV'+FormatDateTime('ddmmyyhhnnss',now)+'.xml';
    GeraXML;
    frmRelatorioWEB.relatorio.Navigate(sArq);
    frmRelatorioWEB.ShowModal;
  finally
    frmRelatorioWEB.Free;
    if FileExists(sArq) then
      DeleteFile(sArq);
  end;
end;

procedure TfrmCadATV.ConsultaATV;
var sSQL: TStringList; sWhere:String;
begin
    sSQL := TStringList.Create;
    try
      sSQL.Add('select');
      sSQL.Add('       sum(VL_ACONSELHADOS) VL_ACONSELHADOS');
      sSQL.Add('     , sum(VL_POSITIVOS)VL_POSITIVOS');
      sSQL.Add('     , sum(VL_NEGATIVOS)VL_NEGATIVOS');
      sSQL.Add('     , sum(VL_INDETERMINADOS)VL_INDETERMINADOS');
      sSQL.Add('     , FL_SEXO');
      sSQL.Add('     , FL_GESTANTE');
      sSQL.Add('     , ID_FAIXA_ETARIA');
      sSQL.Add('     , VL_X');
      sSQL.Add('     , VL_Y');
      sSQL.Add('from registro_atv');

      sWhere := 'where';
      if leUnidade.LookupValue <> '' then
      begin
        sSQL.Add(sWhere + ' CD_UNIDADE = ' + leUnidade.LookupValue);
        sWhere := 'and';
      end;

      if leProvincia.LookupValue <> '' then
      begin
        sSQL.Add(sWhere + ' CD_PROVINCIA = ' + leProvincia.LookupValue);
        sWhere := ' and';
      end;

      if leMunicipio.LookupValue <> '' then
      begin
        sSQL.Add(sWhere + ' CD_MUNICIPIO = ' + leMunicipio.LookupValue);
        sWhere := ' and';
      end;

      if cbMesAno.Text <> '' then
      begin
        sSQL.Add(sWhere + ' VL_MESANO = ' + QuotedStr(cbMesAno.Text));
      end;

      sSQL.Add('group by');
      sSQL.Add('       ID_FAIXA_ETARIA');
      sSQL.Add('     , FL_SEXO');
      sSQL.Add('     , FL_GESTANTE');
      sSQL.Add('     , VL_X');
      sSQL.Add('     , VL_Y');

      qyATV.Close;
      qyATV.SQL.Text := sSQL.Text;
      qyATV.Open;

    finally
       FreeAndNil(sSQL);
    end;
end;

function TfrmCadATV.ValidaExclusao: boolean;
begin
  try
    if dmGeral.TB_ATV.State in [dsInsert] then
    begin
    //Primeiro deve Excluir, para depois entao incluir todos
    if dmGeral.TB_ATV.State in dsEditModes then
      dmGeral.TB_ATV.Cancel;

    dmGeral.TB_ATV.Close;
    if leUnidade.LookupValue <> '' then
      dmGeral.TB_ATV.ParamByName('CD_UNIDADE').AsInteger := strtoInt(leUnidade.LookupValue);
    if leProvincia.LookupValue <> '' then
      dmGeral.TB_ATV.ParamByName('CD_PROVINCIA').AsInteger := strtoint(leProvincia.LookupValue);
    if leMunicipio.LookupValue <> '' then
      dmGeral.TB_ATV.ParamByName('CD_MUNICIPIO').AsInteger := StrToInt(leMunicipio.LookupValue);
    dmGeral.TB_ATV.ParamByName('VL_MESANO').AsString := cbMesAno.Text;
    dmGeral.TB_ATV.Open;

    dmGeral.TB_ATV.First;
    while not dmGeral.TB_ATV.Eof do
      dmGeral.TB_ATV.Delete;

    Result := true;
    end;

    if dmGeral.TB_ATV.State in [dsEdit] then
    begin
    //Primeiro deve Excluir, para depois entao incluir todos
    if dmGeral.TB_ATV.State in dsEditModes then
      dmGeral.TB_ATV.Cancel;

    dmGeral.TB_ATV.Close;
    if leUnidade.LookupValue <> '' then
      dmGeral.TB_ATV.ParamByName('CD_UNIDADE').AsInteger := Unidade;
    if leProvincia.LookupValue <> '' then
      dmGeral.TB_ATV.ParamByName('CD_PROVINCIA').AsInteger := Provincia;
    if leMunicipio.LookupValue <> '' then
      dmGeral.TB_ATV.ParamByName('CD_MUNICIPIO').AsInteger := Municipio;
    dmGeral.TB_ATV.ParamByName('VL_MESANO').AsString := MesAno;
    dmGeral.TB_ATV.Open;

    dmGeral.TB_ATV.First;
    while not dmGeral.TB_ATV.Eof do
      dmGeral.TB_ATV.Delete;

    Result := true;
    end;

  except
    Result := false;
  end;
end;

procedure TfrmCadATV.grDadosDblClick(Sender: TObject);
begin
  inherited;
  if pgGeral.ActivePageIndex=1 then
  begin
    Limpar;
    if not (qyGridCD_PROVINCIA.IsNull) and (qyGridCD_PROVINCIA.asInteger <> 0) then
      leProvincia.LookupValue := qyGridCD_PROVINCIA.AsString;

    if not (qyGridCD_MUNICIPIO.IsNull) and (qyGridCD_MUNICIPIO.asInteger <> 0) then
      leMunicipio.LookupValue := qyGridCD_MUNICIPIO.AsString;

    if not (qyGridCD_UNIDADE.IsNull) and (qyGridCD_UNIDADE.asInteger <> 0) then
      leUnidade.LookupValue := qyGridCD_UNIDADE.AsString;

    cbMesAno.Text := qyGridVL_MESANO.AsString;
    btConsultarClick(sender);
  end;

end;
procedure TfrmCadATV.ckConsolidarClick(Sender: TObject);
begin
  inherited;
  if ckConsolidar.Checked then
  begin
    lbAte.visible := true;
    cbAte.Visible := true;
  end
  else
  begin
    lbAte.visible := false;
    cbAte.Visible := false;
  end;

end;

procedure TfrmCadATV.btLimparClick(Sender: TObject);
begin
  inherited;
  Limpar;

end;



procedure TfrmCadATV.pgGeralChange(Sender: TObject);
begin
  inherited;
// Felipe - 08/05/2013 - Jogado para o DblClick da Lista. Ref: CriancaExposta
{  if pgGeral.ActivePageIndex=1 then
  begin
    if not qyGridCD_PROVINCIA.IsNull then
      leProvincia.LookupValue := qyGridCD_PROVINCIA.AsInteger;

    if not qyGridCD_MUNICIPIO.IsNull then
      leMunicipio.LookupValue := qyGridCD_MUNICIPIO.AsInteger;

    if not qyGridCD_UNIDADE.IsNull then
      leUnidade.LookupValue := qyGridCD_UNIDADE.AsInteger;

    cbMesAno.Text := qyGridVL_MESANO.AsString;
    btConsultarClick(sender);
  end;    }

end;

procedure TfrmCadATV.bteditarClick(Sender: TObject);
begin
  pgGeral.ActivePageIndex := 1;
  pgGeralChange(sender);

  if bConsolidado then
  begin
    MessageDlg('Dados em modo de consolidação, não podem ser modificados!',mtInformation,[mbOK],0);
  end
  else
  begin
    Unidade := dmGeral.TB_ATVCD_UNIDADE.AsInteger;
    Provincia := dmGeral.TB_ATVCD_PROVINCIA.AsInteger;
    Municipio := dmGeral.TB_ATVCD_MUNICIPIO.AsInteger;
    MesAno := dmGeral.TB_ATVVL_MESANO.AsString;
    inherited;
  end;
end;

procedure TfrmCadATV.btCancelarClick(Sender: TObject);
begin
  if bConsolidado then
  begin
    MessageDlg('Dados em modo de consolidação, não podem ser modificados!',mtInformation,[mbOK],0);
  end
  else
   inherited;

end;

procedure TfrmCadATV.Limpar;
begin
  inherited;
  leProvincia.Clear;
  leMunicipio.clear;
  leUnidade.clear;
  cbMesAno.Text := '';
  cbAte.Text := '';
end;

procedure TfrmCadATV.leProvinciaChange(Sender: TObject);
begin
  inherited;
  if leProvincia.Modified then
  begin
    qyProvincia.Close;
    qyProvincia.SQL.Text := PSQL;
    qyProvincia.SQL.Add('where Upper(ds_provincia) like(''' + '%' + UpperCase(leProvincia.Text) + '%'')');
    qyProvincia.Open;
  end
  else
  begin
    qyProvincia.SQL.Text := PSQL;
    qyProvincia.Open;
  end;

end;

procedure TfrmCadATV.leMunicipioChange(Sender: TObject);
begin
  inherited;
  if leMunicipio.Modified then
  begin
    qyMunicipio.Close;
    qyMunicipio.SQL.Text := MSQL;
    qyMunicipio.SQL.Add('and Upper(ds_municipio) like(''' + '%' + UpperCase(leMunicipio.Text) + '%'')');
    qyMunicipio.Open;
  end
  else
  begin
    qyMunicipio.SQL.Text := MSQL;
    qyMunicipio.Open;
  end;

end;

procedure TfrmCadATV.leUnidadeChange(Sender: TObject);
begin
  inherited;
  if leUnidade.Modified then
  begin
    qyUnidade.Close;
    qyUnidade.SQL.Text := USQL;
    qyUnidade.SQL.Add('and Upper(ds_unidade) like(''' + '%' + UpperCase(leUnidade.Text) + '%'')');
    if dsControle.dataset.State in [dsEdit, dsInsert] then
      qyUnidade.SQL.Add('and fl_ativa = ''S'' ');

    qyUnidade.SQL.Add('order by ds_unidade');
    qyUnidade.Open;
  end
  else
  begin
    qyUnidade.SQL.Text := USQL;
    if leUnidade.Text <> '' then
      qyUnidade.SQL.Add('and Upper(ds_unidade) like(''' + '%' + UpperCase(leUnidade.Text) + '%'')');

    if dsControle.dataset.State in [dsEdit, dsInsert] then
      qyUnidade.SQL.Add('and fl_ativa = ''S'' ');

    qyUnidade.SQL.Add('order by ds_unidade');
    qyUnidade.Open;
  end;
end;

procedure TfrmCadATV.qyGridCalcFields(DataSet: TDataSet);
var sAux:String;
begin
  inherited;
  sAux := qyGridVL_MESANO.AsString;
  sAux := Copy(sAux,4,4)+Copy(sAux,1,2);
  qyGridNR_MESANO.AsInteger :=  strToInt(sAux);
end;

procedure TfrmCadATV.FormDestroy(Sender: TObject);
begin
  inherited;
  dmGeral.TB_ATV.SelectSQL.Text := sSQLATV;
end;

procedure TfrmCadATV.Validar;
begin
  if (leProvincia.LookupValue = '') then
  begin
    MessageDlg('É necessário informar Provincia!',mtInformation,[mbOK],0);
    leProvincia.SetFocus;
    Abort;
  end;

  if (leMunicipio.LookupValue = '') then
  begin
    MessageDlg('É necessário informar o Municipio!',mtConfirmation,[mbOK],0);
    leMunicipio.SetFocus;
    Abort;
  end;

  if (leUnidade.LookupValue = '') then
  begin
    MessageDlg('É necessário informar a Unidade!',mtConfirmation, [mbOK],0);
    leUnidade.SetFocus;
    Abort;
  end;

  if (cbMesAno.Text='  /    ') then
  begin
    MessageDlg('É necessário informar Mes/Ano!',mtInformation,[mbOK],0);
    cbMesAno.SetFocus;
    Abort;
  end;

{25/03/2014 - LH - Nao permite mais gravar consolidado
  if (leMunicipio.LookupValue = '') then
  begin
    if MessageDlg('O Municipio não foi informada, '#13#10'deseja continuar?',mtConfirmation,
        [mbYes,mbNo],0) = mrNo then
      begin
        leMunicipio.SetFocus;
        Abort;
      end;
  end;

  if (leUnidade.LookupValue = '') then
  begin
    if MessageDlg('A Unidade não foi informada, '#13#10'deseja continuar?',mtConfirmation,
        [mbYes,mbNo],0) = mrNo then
      begin
        leUnidade.SetFocus;
        Abort;
      end;
  end;
}

  if (qyUnidadeFL_ATIVA.AsString = cvNao) then
  begin
    MessageDlg('Esta Unidade esta Inativa somente pode ser utilizada para consultas!',mtConfirmation, [mbOK],0);
    leUnidade.SetFocus;
    Abort;
  end;

end;

procedure TfrmCadATV.cbAteChange(Sender: TObject);
var texto: string;
begin
  inherited;
  texto := StringReplace(cbAte.Text, '/', '', [rfReplaceAll, rfIgnoreCase]);
  if Length(texto) > 2 then
    texto := Copy(texto, 1, 2) + '/' + Copy(texto,3,Length(texto)-2);
  cbAte.Text := texto;
  cbAte.SelStart := Length(texto);
end;

procedure TfrmCadATV.cbAteKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
    if not (Key in ['0'..'9', #8]) then
    Key := #0
end;

procedure TfrmCadATV.cbMesAnoKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
    if not (Key in ['0'..'9', #8]) then
    Key := #0
end;

procedure TfrmCadATV.cbMesAnoChange(Sender: TObject);
var texto: string;
begin
  inherited;
  texto := StringReplace(cbMesAno.Text, '/', '', [rfReplaceAll, rfIgnoreCase]);
  if Length(texto) > 2 then
    texto := Copy(texto, 1, 2) + '/' + Copy(texto,3,Length(texto)-2);
  cbMesAno.Text := texto;
  cbMesAno.SelStart := Length(texto);
end;

procedure TfrmCadATV.sgATVKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
    if not (Key in ['0'..'9', #8, #13, #0, #17, #18, #19, #20]) then
      Key := #0

end;

procedure TfrmCadATV.cbMesAnoExit(Sender: TObject);
begin
  if ValidarMesAno(cbMesAno.Text) then
    cbMesAno.SetFocus;
end;

procedure TfrmCadATV.cbAteExit(Sender: TObject);
begin
  if ValidarMesAno(cbAte.Text) then
    cbAte.SetFocus;
end;

procedure TfrmCadATV.leUnidadeButtonClick(Sender: TObject);
begin
  inherited;
  qyUnidade.Close;
  qyUnidade.SQL.Text := USQL;
  if leUnidade.Text <> '' then
    qyUnidade.SQL.Add('and Upper(ds_unidade) like(''' + '%' + UpperCase(leUnidade.Text) + '%'')');

  if dsControle.dataset.State in [dsEdit, dsInsert] then
    qyUnidade.SQL.Add('and fl_ativa = ''S'' ');

  qyUnidade.SQL.Add('order by ds_unidade');
  qyUnidade.Open;

end;

procedure TfrmCadATV.BitBtn1Click(Sender: TObject);
begin

  if (ValidaContraSenha('Liberar Exportação')) then
  begin
    with TIBQuery.Create(nil) do
    begin
      Database := DM.DB;
      SQL.Clear;
      SQL.Add('update "REGISTRO_ATV" set DT_EXP = NULL, DT_ALTERACAO = ''NOW'', DT_REGISTRO = ''NOW'' '+
      ' where CD_PROVINCIA = '+ leProvincia.LookupValue +
      ' and '+
      ' CD_MUNICIPIO = '+ leMunicipio.LookupValue +
      ' and '+
      ' CD_UNIDADE = '+ leUnidade.LookupValue +
      ' and '+
      ' VL_MESANO = '+ QuotedStr(cbMesAno.Text));
      ExecSQL;
    end;
    DM.Commit(dm.IBD);
    ShowMessage('Operação concluída com Sucesso!');
  end
  else
  begin
    btCancelarClick(Sender);
    ShowMessage('Operação cancelada.');
    Exit;
  end;


end;

end.


