unit uCadPTV;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UfrmCadPadFichas, dxExEdtr, ExtCtrls, StdCtrls, RxLookup, DB,
  dxCntner, dxTL, dxDBCtrl, dxDBGrid, ComCtrls, Buttons, Grids,
  IBCustomDataSet, IBQuery, ugeral, ib_parse, dxEditor, dxEdLib, UfrmCadPad,
  Mask, ToolEdit, Menus, dxDBTLCl, dxGrClms;

type
  TfrmCadPTV = class(TfrmCadPadFichas)
    Panel5: TPanel;
    pgGrids: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    Panel7: TPanel;
    Panel9: TPanel;
    Panel11: TPanel;
    sgGestantes: TStringGrid;
    sgPartos: TStringGrid;
    sgCriancas: TStringGrid;
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
    qyPTV: TIBQuery;
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
	
	procedure btConsultarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure sgGestantesSetEditText(Sender: TObject; ACol, ARow: Integer;
      const Value: String);
    procedure sgPartosSetEditText(Sender: TObject; ACol, ARow: Integer;
      const Value: String);
    procedure sgCriancasSetEditText(Sender: TObject; ACol, ARow: Integer;
      const Value: String);
    procedure btIncluirClick(Sender: TObject);
    procedure btexcluirClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btgravarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure sgGestantesDrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure sgGestantesSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure sgPartosDrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure sgPartosSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure sgCriancasDrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure sgCriancasSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure ckConsolidarClick(Sender: TObject);
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
    procedure cbMesAnoChange(Sender: TObject);
    procedure cbMesAnoKeyPress(Sender: TObject; var Key: Char);
    procedure cbAteChange(Sender: TObject);
    procedure cbAteKeyPress(Sender: TObject; var Key: Char);
    procedure sgGestantesKeyPress(Sender: TObject; var Key: Char);
    procedure cbMesAnoExit(Sender: TObject);
    procedure cbAteExit(Sender: TObject);
    procedure leUnidadeButtonClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
    bCarregaGrid :Boolean;
  public
    { Public declarations }
    sNomeTabela:string;
    procedure CriaGrid; override;
    procedure CarregaGrid(TB_PTV:TDataSet);
    procedure CalculaTotalGestante;
    procedure CalculaTotalParto;
    procedure CalculaTotalCrianca;
    procedure AbreConsultas;
    procedure FechaConsultas;
    procedure CarregaComboMesAno;
    procedure Varregrid;
    procedure GeraXML;  override;
    function ValidaExclusao: boolean;
    procedure Limpar; override;
    procedure Validar;
  end;

type
  TMes = Record
    gr:TRect;
    sMesclado:String;
end;

var
  frmCadPTV: TfrmCadPTV;
  bMesclando, bEdit, bConsolidado:Boolean;
  Mes:array[0..2] of TMes;
  sSQLPTV:string;
  Unidade, Provincia, Municipio:Integer;
  MesAno:String;
  PSQL, MSQL, USQL:string;

implementation

uses UDM, UDMGERAL, UfrmCadBase, uFuncaoGrid, uRelatorioWEB,
  uFuncaoContraSenha;

{$R *.dfm}

procedure TfrmCadPTV.GeraXML;
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
      sXML.Add('<?xml-stylesheet type="text/xsl" href="PTV.xslt"?>');
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

      GridXML(sgGestantes);
      GridXML(sgPartos);
      GridXML(sgCriancas);

      sXML.Add('  </Dados>');
      sXML.Add(' </Programa>');

      sXML.SaveToFile(sArq);             
   finally
      FreeAndNil(sXML);
   end;
end;


procedure TfrmCadPTV.CriaGrid;
var r,c:integer;
begin
  //GESTANTES
  for r:=0 to 6 do
   for c:=0 to 4 do
     sgGestantes.Cells[c,r] := '';

  sgGestantes.RowCount := 7;
  sgGestantes.ColCount := 5;
  sgGestantes.FixedCols := 1;
  sgGestantes.FixedRows := 2;

  sgGestantes.Cells[1,0] := 'Admitidos';
  sgGestantes.Cells[0,0] := 'Gestantes';
  sgGestantes.Cells[1,1] := 'Programa do PTV';
  sgGestantes.Cells[2,1] := 'Momento do Parto';
  sgGestantes.Cells[3,1] := 'Programa Pós-Parto';
  sgGestantes.Cells[4,0] := 'Total';

  sgGestantes.Cells[0,2] := 'Menos de 15 anos';
  sgGestantes.Cells[0,3] := '15-24 anos';
  sgGestantes.Cells[0,4] := '25-49 anos';
  sgGestantes.Cells[0,5] := '50 ou mais anos';
  sgGestantes.Cells[0,6] := 'Total de Gestantes Admitidas';

  sgGestantes.DefaultColWidth := 150;
  sgGestantes.DefaultRowHeight := 22;
  //sgGestantes.RowHeights[0] := -1;
  sgGestantes.ColWidths[0] := 200;

  //PARTO
  for r:=0 to 5 do
   for c:=0 to 4 do
     sgPartos.Cells[c,r] := '';

  sgPartos.RowCount := 5;
  sgPartos.ColCount := 4;
  sgPartos.FixedCols := 1;
  sgPartos.FixedRows := 2;

  sgPartos.Cells[0,1] := 'Partos';
  sgPartos.Cells[1,1] := 'Terapia Completa (AZT+3TC+NEP)';
  sgPartos.Cells[2,1] := 'Outro tipo de terapia';
  sgPartos.Cells[3,1] := 'Nenhum tipo de terapia';

  sgPartos.Cells[0,2] := 'Institucionais';
  sgPartos.Cells[0,3] := 'Domiciliar';
  sgPartos.Cells[0,4] := 'Total de Partos';

  sgPartos.DefaultColWidth := 200;
  sgPartos.DefaultRowHeight := 22;
  sgPartos.RowHeights[0] := -1;
  sgPartos.ColWidths[0] := 100;

  //CRIANCAS
  for r:=0 to 5 do
   for c:=0 to 2 do
     sgCriancas.Cells[c,r] := '';

  sgCriancas.RowCount := 5;
  sgCriancas.ColCount := 2;
  sgCriancas.FixedCols := 1;
  sgCriancas.FixedRows := 2;

  sgCriancas.Cells[0,1] := 'Nr. de Crianças nascidas';
  sgCriancas.Cells[1,1] := 'Total';

  sgCriancas.Cells[0,2] := '1. Crianças que receberam AZT oral';
  sgCriancas.Cells[0,3] := '1. Crianças que NÃO receberam AZT oral';
  sgCriancas.Cells[0,4] := 'Total';

  sgCriancas.DefaultColWidth := 100;
  sgCriancas.DefaultRowHeight := 22;
  sgCriancas.RowHeights[0] := -1;
  sgCriancas.ColWidths[0] := 300;

end;


procedure TfrmCadPTV.CarregaGrid(TB_PTV:TDataSet);
var rAux:real;
begin
    CriaGrid;
    dmGeral.TB_PTV.First;
    while Not dmGeral.TB_PTV.Eof do
    begin
      //GESTANTES
      raux := valor(sgGestantes.Cells[1,dmGeral.TB_PTVVL_Y_GESTANTE.AsInteger]) +
        valor(dmGeral.TB_PTVVL_ADMITIDAS_PTV.AsString);
      sgGestantes.Cells[1,dmGeral.TB_PTVVL_Y_GESTANTE.AsInteger] := floattostr(raux);

      raux := valor(sgGestantes.Cells[2,dmGeral.TB_PTVVL_Y_GESTANTE.AsInteger]) +
              valor(dmGeral.TB_PTVVL_ADMITIDAS_PARTO.AsString);
      sgGestantes.Cells[2,dmGeral.TB_PTVVL_Y_GESTANTE.AsInteger] := floattostr(raux);

      raux := valor(sgGestantes.Cells[3,dmGeral.TB_PTVVL_Y_GESTANTE.AsInteger]) +
              valor(dmGeral.TB_PTVVL_ADMITIDAS_POS_PARTO.AsString);
      sgGestantes.Cells[3,dmGeral.TB_PTVVL_Y_GESTANTE.AsInteger] := floattostr(raux);

      //PARTOS
      raux := valor(sgPartos.Cells[1,dmGeral.TB_PTVVL_Y_PARTO.AsInteger]) +
              valor(dmGeral.TB_PTVVL_TERAPIA_COMPLETA.AsString);
      sgPartos.Cells[1,dmGeral.TB_PTVVL_Y_PARTO.AsInteger] := floattostr(raux);

      raux := valor(sgPartos.Cells[2,dmGeral.TB_PTVVL_Y_PARTO.AsInteger]) +
              valor(dmGeral.TB_PTVVL_TERAPIA_OUTRO.AsString);
      sgPartos.Cells[2,dmGeral.TB_PTVVL_Y_PARTO.AsInteger] := floattostr(raux);

      raux := valor(sgPartos.Cells[3,dmGeral.TB_PTVVL_Y_PARTO.AsInteger]) +
              valor(dmGeral.TB_PTVVL_TERAPIA_NENHUM.AsString);
      sgPartos.Cells[3,dmGeral.TB_PTVVL_Y_PARTO.AsInteger] := floattostr(raux);

      //CRIANCAS
      raux := valor(sgCriancas.Cells[1,dmGeral.TB_PTVVL_Y_CRIANCA.AsInteger]) +
              valor(dmGeral.TB_PTVVL_TOTAL_CRIANCA.AsString);
      sgCriancas.Cells[1,dmGeral.TB_PTVVL_Y_CRIANCA.AsInteger] := floattostr(raux);

      dmGeral.TB_PTV.Next;
    end;

    CalculaTotalGestante;
    CalculaTotalParto;
    CalculaTotalCrianca;
end;

procedure TfrmCadPTV.CalculaTotalGestante;
var r,c:integer; tl,tc:real;
begin
  //GESTANTE
  for r:=2 to 6 do
  begin
    if (r=6) then
    for c:=1 to 5 do
    begin
      tc :=
        Valor(sgGestantes.Cells[c,2]) +
        Valor(sgGestantes.Cells[c,3]) +
        Valor(sgGestantes.Cells[c,4]) +
        Valor(sgGestantes.Cells[c,5]);
      sgGestantes.Cells[c,r] := FloatToStr(tc);
    end;
    tl :=
      Valor(sgGestantes.Cells[1,r]) +
      Valor(sgGestantes.Cells[2,r]) +
      Valor(sgGestantes.Cells[3,r]);
    sgGestantes.Cells[4,r] := FloatToStr(tl);
  end;
end;

procedure TfrmCadPTV.CalculaTotalParto;
var r,c:integer; tl,tc:real;
begin
  //PARTO
  for r:=2 to 4 do
  begin
    if (r=4) then
    for c:=1 to 4 do
    begin
      tc :=
        Valor(sgPartos.Cells[c,2]) +
        Valor(sgPartos.Cells[c,3]);
      sgPartos.Cells[c,r] := FloatToStr(tc);
    end;
  end;
end;

procedure TfrmCadPTV.CalculaTotalCrianca;
var r,c:integer; tl,tc:real;
begin
  //CRIANCAS
  for r:=2 to 4 do
  begin
    if (r=4) then
    for c:=1 to 2 do
    begin
      tc :=
        Valor(sgCriancas.Cells[c,2]) +
        Valor(sgCriancas.Cells[c,3]);
      sgCriancas.Cells[c,r] := FloatToStr(tc);
    end;
  end;
end;

procedure TfrmCadPTV.AbreConsultas;
begin
  PSQL := qyProvincia.sql.text;
  MSQL := qyMunicipio.sql.text;
  USQL := qyUnidade.sql.text;
  qyProvincia.Open;
  qyMunicipio.Open;
  qyUnidade.Open;
end;

procedure TfrmCadPTV.FechaConsultas;
begin
  qyProvincia.Close;
  qyMunicipio.Close;
  qyUnidade.Close;
end;

procedure TfrmCadPTV.CarregaComboMesAno;
var data:TDate; i:integer;
begin
  data := dm.GetDate;
  cbMesAno.Items.Add(FormatDateTime('mm/yyyy',data));
  cbAte.Items.Add(FormatDateTime('mm/yyyy',data));
  for i:= 1 to 11 do
  begin
    cbMesAno.Items.Add(FormatDateTime('mm/yyyy',IncMonth(data,-i)));
    cbAte.Items.Add(FormatDateTime('mm/yyyy',IncMonth(data,-i)));
  end;
end;

procedure TfrmCadPTV.Varregrid;
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

  try
  nRegistro := dm.GeraCodigo('GEN_REGISTRO_GERAL');
    for i:=2 to 5 do
    begin

       if not (dmGeral.TB_PTV.State in [dsEdit,dsInsert]) then
       begin
        dmGeral.TB_PTV.Insert;
       dmGeral.TB_PTVCD_REGISTRO_GERAL.AsInteger := nRegistro;
        dmGeral.TB_PTVCD_UNIDADE.AsInteger := cdUnidade;
        dmGeral.TB_PTVCD_PROVINCIA.AsInteger := cdProvincia;
        dmGeral.TB_PTVCD_MUNICIPIO.AsInteger := cdMunicipio;
        dmGeral.TB_PTVVL_MESANO.AsString := sMesAno;
        dmGeral.TB_PTVDT_REGISTRO.AsDateTime := dm.GetDateTime;
       end;

       //GESTANTES
       begin
         if (i in [2,3,4,5]) then
         begin
           dmGeral.TB_PTVFL_GESTANTE.AsInteger := 1;
           dmGeral.TB_PTVVL_Y_GESTANTE.AsInteger := i;

           //Define Faixa Etaria
           if (i in [2]) then dmGeral.TB_PTVID_GRUPOS_GESTANTE.AsInteger := cvFaixaEtaria2;
           if (i in [3]) then dmGeral.TB_PTVID_GRUPOS_GESTANTE.AsInteger := cvFaixaEtaria3;
           if (i in [4]) then dmGeral.TB_PTVID_GRUPOS_GESTANTE.AsInteger := cvFaixaEtaria4;
           if (i in [5]) then dmGeral.TB_PTVID_GRUPOS_GESTANTE.AsInteger := cvFaixaEtaria5;

           dmGeral.TB_PTVVL_ADMITIDAS_PTV.AsString := sgGestantes.Cells[1,i];
           dmGeral.TB_PTVVL_ADMITIDAS_PARTO.AsString := sgGestantes.Cells[2,i];
           dmGeral.TB_PTVVL_ADMITIDAS_POS_PARTO.AsString := sgGestantes.Cells[3,i];
         end;
       end;

       //PARTOS
       begin
         if (i in [2,3]) then
         begin
           dmGeral.TB_PTVFL_PARTO.AsInteger := 1;
           dmGeral.TB_PTVVL_Y_PARTO.AsInteger := i;

           //Define Tipo Parto
           if (i in [2]) then dmGeral.TB_PTVID_GRUPOS_PARTO.AsInteger := cvPartos1;
           if (i in [3]) then dmGeral.TB_PTVID_GRUPOS_PARTO.AsInteger := cvPartos2;

           dmGeral.TB_PTVVL_TERAPIA_COMPLETA.AsString := sgPartos.Cells[1,i];
           dmGeral.TB_PTVVL_TERAPIA_OUTRO.AsString := sgPartos.Cells[2,i];
           dmGeral.TB_PTVVL_TERAPIA_NENHUM.AsString := sgPartos.Cells[3,i];
         end;
       end;

       //CRIANCAS
       begin
         if (i in [2,3]) then
         begin
           dmGeral.TB_PTVFL_CRIANCA.AsInteger := 1;
           dmGeral.TB_PTVVL_Y_CRIANCA.AsInteger := i;

           //Define Criancas que receberam ou nao AZT
           if (i in [2]) then dmGeral.TB_PTVID_GRUPOS_CRIANCA.AsInteger := cvFlSim;
           if (i in [3]) then dmGeral.TB_PTVID_GRUPOS_CRIANCA.AsInteger := cvFlNao;

           dmGeral.TB_PTVVL_TOTAL_CRIANCA.AsString := sgCriancas.Cells[1,i];
         end;
       end;

       dmGeral.TB_PTV.Post;
    end;
  except
    begin
      dmGeral.TB_PTV.Cancel;
      MessageDlg('ERRO: 9999',mtError,  [mbOK],0);
    end;
  end;
end;

procedure TfrmCadPTV.btConsultarClick(Sender: TObject);
var sSQLWhere, sSQL, sW:String; nB,nE:Integer;
begin
  inherited;
  if (dmGeral.TB_PTV.State in [dsEdit, dsInsert]) then
    Exit;

  dmGeral.TB_PTV.Close;
  dmGeral.TB_PTV.SelectSQL.Text := sSQLPTV;
  sSQL := sSQLPTV;
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

    if (trim(cbMesAno.Text) <> '/') and (trim(cbAte.Text) <> '/') then
      begin
        sSQLWhere := sSQLWhere + sW  //'VL_MESANO between :de and :ate';

         + 'CAST(''01-''||SUBSTRING(VL_MESANO FROM 1 FOR 2)||''-''||'
         + 'SUBSTRING(VL_MESANO FROM 4 FOR 4) AS DATE)'
         + 'BETWEEN :de and :ate';
        sW := 'and ';
      end;

    SetSQLWhere(sSQL, sSQLWhere);
    dmGeral.TB_PTV.SelectSQL.Text := sSQL;
    if (trim(cbMesAno.Text) <> '/') and (trim(cbAte.Text) <> '/') then
    begin
      dmGeral.TB_PTV.ParamByName('de').AsString := FormatDateTime('mm/dd/yyyy',(StrToDate('01/'+cbMesAno.text)));
      dmGeral.TB_PTV.ParamByName('ate').AsString := FormatDateTime('mm/dd/yyyy',(StrToDate('01/'+cbAte.text)));
    end;

    bConsolidado := true;
  end
  else
  begin
    sSQL := StringReplace(sSQL, 'from "REGISTRO_PTV"', 'from '+sNomeTabela+' REGISTRO_PTV',[]);
    dmGeral.TB_PTV.SelectSQL.Text := sSQL;
    bConsolidado := false;
  end;

  //if not ckConsolidar.Checked then

  //Felipe 08/05/2013 Desabilitado para padronizar. Ref: CriancaExposta

  {if cbProvincia.KeyValue <> Null then
    dmGeral.TB_PTV.ParamByName('CD_PROVINCIA').AsInteger := cbProvincia.KeyValue
      else if not ckConsolidar.Checked then
   begin
     MessageDlg('É necessário informar Provincia!',mtInformation,[mbOK],0);
     cbProvincia.SetFocus;
     Abort;
   end;

  if not ckConsolidar.Checked then
  if cbMesAno.Text <> '' then
    dmGeral.TB_PTV.ParamByName('VL_MESANO').AsString := cbMesAno.Text
  else
   begin
     MessageDlg('É necessário informar Mes/Ano De:!',mtInformation,[mbOK],0);
     cbMesAno.SetFocus;
     Abort;
   end;

  if cbMunicipio.KeyValue <> Null then
    dmGeral.TB_PTV.ParamByName('CD_MUNICIPIO').AsInteger := cbMunicipio.KeyValue
      else if not ckConsolidar.Checked then
   begin
      if MessageDlg('O Municipio não foi informada, '#13#10'deseja continuar?',mtConfirmation,
          [mbYes,mbNo],0) = mrNo then
        begin
         cbMunicipio.SetFocus;
         Abort;
        end;
   end;

  if cbUnidade.KeyValue <> Null then
    dmGeral.TB_PTV.ParamByName('CD_UNIDADE').AsInteger := cbUnidade.KeyValue
      else if not ckConsolidar.Checked then
   begin
      if MessageDlg('A Unidade não foi informada, '#13#10'deseja continuar?',mtConfirmation,
          [mbYes,mbNo],0) = mrNo then
        begin
          cbUnidade.SetFocus;
          Abort;
        end;
   end;     }

  //Felipe 08/05/2013
  if (leProvincia.LookupValue <> '') then
    dmGeral.TB_PTV.ParamByName('CD_PROVINCIA').AsInteger := strtoint(leProvincia.LookupValue);
  if (leMunicipio.LookupValue <> '') then
    dmGeral.TB_PTV.ParamByName('CD_MUNICIPIO').AsInteger := StrToInt(leMunicipio.LookupValue);
  if (leUnidade.LookupValue <> '') then
    dmGeral.TB_PTV.ParamByName('CD_UNIDADE').AsInteger := StrToInt(leUnidade.LookupValue);

  if not ckConsolidar.Checked then  
    if (trim(cbMesAno.Text) <> '') then
      dmGeral.TB_PTV.ParamByName('VL_MESANO').AsString := cbMesAno.Text;

  dmGeral.TB_PTV.Open;
  CarregaGrid(dmGeral.TB_PTV);

end;

procedure TfrmCadPTV.FormShow(Sender: TObject);
begin
  inherited;
  qyGrid.Open;
  CriaGrid;
  pgGeral.ActivePageIndex := 1;
  pgGrids.ActivePageIndex := 0;
end;

procedure TfrmCadPTV.sgGestantesSetEditText(Sender: TObject; ACol,
  ARow: Integer; const Value: String);
begin
  inherited;
  CalculaToTalGestante;
end;

procedure TfrmCadPTV.sgPartosSetEditText(Sender: TObject; ACol,
  ARow: Integer; const Value: String);
begin
  inherited;
  CalculaToTalParto;
end;

procedure TfrmCadPTV.sgCriancasSetEditText(Sender: TObject; ACol,
  ARow: Integer; const Value: String);
begin
  inherited;
  CalculaToTalCrianca;
end;

procedure TfrmCadPTV.btIncluirClick(Sender: TObject);
begin
  pgGeral.ActivePageIndex := 1;
  dmGeral.TB_PTV.Close;
  dmGeral.TB_PTV.Open;

  inherited;
  leProvincia.text := '';
  leUnidade.text := '';
  leMunicipio.text := '';
  cbMesAno.ItemIndex := -1;
  ckConsolidar.Checked := false;
  bConsolidado := false;
  CriaGrid;
end;

procedure TfrmCadPTV.btexcluirClick(Sender: TObject);
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
        dmGeral.TB_PTV.Close;
        if leUnidade.LookupValue <> '' then
           dmGeral.TB_PTV.ParamByName('CD_UNIDADE').AsInteger := StrToInt(leUnidade.LookupValue);
        if leProvincia.LookupValue <> '' then
           dmGeral.TB_PTV.ParamByName('CD_PROVINCIA').AsInteger := strtoint(leProvincia.LookupValue);
        if leMunicipio.LookupValue <> '' then
           dmGeral.TB_PTV.ParamByName('CD_MUNICIPIO').AsInteger := StrToInt(leMunicipio.LookupValue);
        dmGeral.TB_PTV.ParamByName('VL_MESANO').AsString := cbMesAno.Text;
        dmGeral.TB_PTV.Open;

        //Felipe 08/05/2013
        {
        dmGeral.TB_PTV.First;
        while not dmGeral.TB_PTV.Eof do
          dmGeral.TB_PTV.Delete;

        dmGeral.TB_PTV.Close; dmGeral.TB_PTV.Open;
        if bCarregaGrid then
          CarregaGrid(DMGERAL.TB_PTV);   }

        //Protocolo
        try
          sArq := sPathConsulta+'RelatorioPTV'+FormatDateTime('ddmmyyhhnnss',now)+'.xml';
          GeraXML;
          dmGeral.ProtocolaEnvio(dmGeral.TB_PTV, cvPTV, 'E', sArq);
        finally
          if FileExists(sArq) then
            DeleteFile(sArq);
        end;

        Inherited;

      end;
    end;
end;

procedure TfrmCadPTV.FormCreate(Sender: TObject);
begin
  nRelatorio := cvPTV;
  inherited;
  FbPermiteMudarPagina := False;
  AbreConsultas;
  CarregaComboMesAno;
  bCarregaGrid := True;
  sSQLPTV := dmGeral.TB_PTV.SelectSQL.Text;
  sNomeTabela := 'REGISTRO_PTV';
end;

procedure TfrmCadPTV.btgravarClick(Sender: TObject);
var sOP,sOperacao:String;
begin
  if bConsolidado then
  begin
    MessageDlg('Dados em modo de consolidação, não podem ser modificados!',mtInformation,[mbOK],0);
  end
  else
  begin

    if (dmGeral.TB_PTV.State = dsEdit) then sOP := 'A';
    if (dmGeral.TB_PTV.State = dsInsert) then sOP := 'I';

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
      sArq := sPathConsulta+'RelatorioPTV'+FormatDateTime('ddmmyyhhnnss',now)+'.xml';
      GeraXML;
      dmGeral.ProtocolaEnvio(dmGeral.TB_PTV, cvPTV, sOP, sArq);
    finally
      if FileExists(sArq) then
        DeleteFile(sArq);
    end;
  end;
end;

procedure TfrmCadPTV.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  FechaConsultas;
  //dmGeral.TB_PTV.SelectSQL.Text := sSQLPTV;
end;

procedure TfrmCadPTV.sgGestantesDrawCell(Sender: TObject; ACol,
  ARow: Integer; Rect: TRect; State: TGridDrawState);
var Conteudo:String; x,y,hf:integer; al:Word; c:TColor;   r:TRect;
begin
  inherited;
  Conteudo := sgGestantes.Cells[ACol,ARow];

  //Mesclar: Negrito, Centro, Borda
  if (ARow = 0) and (ACol in [1,2,3]) then
  begin
      if ACol = 1 then
      begin
        Mes[0].gr := Rect;
        Mes[0].sMesclado := Conteudo;
      end;

      if (ACol = 3) then
      begin
        r.Left := Mes[0].gr.Left;
        r.Top := Mes[0].gr.Top;
        r.Bottom := Mes[0].gr.Bottom;
        r.Right := Rect.Right;

        sgGestantes.Canvas.Font.Style:=[fsbold];
        al := SetTextAlign(sgGestantes.Canvas.Handle, TA_CENTER);
        hf := sgGestantes.Canvas.TextHeight('lj');
        sgGestantes.Canvas.FillRect(r);
        x := r.Left + ((r.Right - r.Left)   div 2);
        y := r.Top  - ((r.Top + hf - r.Bottom) div 2);
        sgGestantes.Canvas.TextRect(r,x,y,Mes[0].sMesclado);
        SetTextAlign(sgGestantes.Canvas.Handle, al);
        DesenhaBordas(sgGestantes.Canvas,r);
      end;
  end;

  //Mesclar: Negrito, Centro, Borda
  if (ARow in [0,1]) and (ACol =0) then
  begin
      if ARow = 0 then
      begin
        Mes[1].gr := Rect;
        Mes[1].sMesclado := Conteudo;
      end;

      if (ARow = 1) then
      begin
        r.Left := Mes[1].gr.Left;
        r.Top := Mes[1].gr.Top;
        r.Bottom := Rect.Bottom;
        r.Right := Mes[1].gr.Right;

        sgGestantes.Canvas.Font.Style:=[fsbold];
        al := SetTextAlign(sgGestantes.Canvas.Handle, TA_CENTER);
        hf := sgGestantes.Canvas.TextHeight('lj');
        sgGestantes.Canvas.FillRect(r);
        x := r.Left + ((r.Right - r.Left)   div 2);
        y := r.Top  - ((r.Top + hf - r.Bottom) div 2);
        sgGestantes.Canvas.TextRect(r,x,y,Mes[1].sMesclado);
        SetTextAlign(sgGestantes.Canvas.Handle, al);
        DesenhaBordas(sgGestantes.Canvas,r);
      end;
  end;

  //Mesclar: Negrito, Centro, Borda
  if (ARow in [0,1]) and (ACol = 4) then
  begin
      if ARow = 0 then
      begin
        Mes[2].gr := Rect;
        Mes[2].sMesclado := Conteudo;
      end;

      if (ARow = 1) then
      begin
        r.Left := Mes[2].gr.Left;
        r.Top := Mes[2].gr.Top;
        r.Bottom := Rect.Bottom;
        r.Right := Mes[2].gr.Right;

        sgGestantes.Canvas.Font.Style:=[fsbold];
        al := SetTextAlign(sgGestantes.Canvas.Handle, TA_CENTER);
        hf := sgGestantes.Canvas.TextHeight('lj');
        sgGestantes.Canvas.FillRect(r);
        x := r.Left + ((r.Right - r.Left)   div 2);
        y := r.Top  - ((r.Top + hf - r.Bottom) div 2);
        sgGestantes.Canvas.TextRect(r,x,y,Mes[2].sMesclado);
        SetTextAlign(sgGestantes.Canvas.Handle, al);
        DesenhaBordas(sgGestantes.Canvas,r);
      end;
  end;

  //Titulo: Negrito, Centro, Borda
  if ((ACol in [0]) and (ARow > 1))or
     ((ACol in [1,2,3]) and (ARow = 1))then
  begin
     r := Rect;
     sgGestantes.Canvas.Font.Style := [fsbold];
     al := SetTextAlign(sgGestantes.Canvas.Handle, TA_CENTER);
     hf := sgGestantes.Canvas.TextHeight('lj');
     sgGestantes.Canvas.FillRect(r);
     x := r.Left + ((r.Right - r.Left)   div 2);
     y := r.Top  - ((r.Top + hf - r.Bottom) div 2);
     sgGestantes.Canvas.TextRect(r,x,y,Conteudo);
     SetTextAlign(sgGestantes.Canvas.Handle, al);
     DesenhaBordas(sgGestantes.Canvas,r);
  end;

  //Total: Negrito, Centro, Cor
  if ((ARow in [6]) and (ACol in [1,2,3,4]))or
     ((ACol in [4]) and (ARow > 1)) then
  begin
     r := Rect;
     sgGestantes.Canvas.Brush.Color := cl3DLight;
     sgGestantes.Canvas.Font.Style := [fsbold];
     al := SetTextAlign(sgGestantes.Canvas.Handle, TA_CENTER);
     hf := sgGestantes.Canvas.TextHeight('lj');
     sgGestantes.Canvas.FillRect(r);
     x := r.Left + ((r.Right - r.Left)   div 2);
     y := r.Top  - ((r.Top + hf - r.Bottom) div 2);
     sgGestantes.Canvas.TextRect(r,x,y,Conteudo);
     SetTextAlign(sgGestantes.Canvas.Handle, al);
  end;
end;

procedure TfrmCadPTV.sgGestantesSelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
begin
  inherited;
  bEdit := not((ACol in [0,4]) or (ARow in [0,1,6]));

  if (bEdit) and (dsControle.DataSet.State in [dsEdit,dsInsert]) then
    sgGestantes.Options := sgGestantes.Options + [goEditing]
  else
    sgGestantes.Options := sgGestantes.Options - [goEditing];
end;

procedure TfrmCadPTV.sgPartosDrawCell(Sender: TObject; ACol, ARow: Integer;
  Rect: TRect; State: TGridDrawState);
var Conteudo:String; x,y,hf:integer; al:Word; c:TColor;   r:TRect;
begin
  inherited;
  Conteudo := sgPartos.Cells[ACol,ARow];

  //Titulo: Negrito, Centro
  if ((ACol = 0) or (ARow in [0,1])) then
  begin
     r := Rect;
     sgPartos.Canvas.Font.Style := [fsbold];
     al := SetTextAlign(sgPartos.Canvas.Handle, TA_CENTER);
     hf := sgPartos.Canvas.TextHeight('lj');
     sgPartos.Canvas.FillRect(r);
     x := r.Left + ((r.Right - r.Left)   div 2);
     y := r.Top  - ((r.Top + hf - r.Bottom) div 2);
     sgPartos.Canvas.TextRect(r,x,y,Conteudo);
     SetTextAlign(sgPartos.Canvas.Handle, al);
  end;

  //Total: Negrito, Centro, Cor
  if (ACol >0 ) and (ARow = 4)then
  begin
     r := Rect;
     sgPartos.Canvas.Brush.Color := cl3DLight;
     sgPartos.Canvas.Font.Style := [fsbold];
     al := SetTextAlign(sgPartos.Canvas.Handle, TA_CENTER);
     hf := sgPartos.Canvas.TextHeight('lj');
     sgPartos.Canvas.FillRect(r);
     x := r.Left + ((r.Right - r.Left)   div 2);
     y := r.Top  - ((r.Top + hf - r.Bottom) div 2);
     sgPartos.Canvas.TextRect(r,x,y,Conteudo);
     SetTextAlign(sgPartos.Canvas.Handle, al);
  end;
end;

procedure TfrmCadPTV.sgPartosSelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
begin
  inherited;
  bEdit := not((ACol in [0]) or (ARow in [0,1,4]));

  if (bEdit) and (dsControle.DataSet.State in [dsEdit,dsInsert]) then
    sgPartos.Options := sgPartos.Options + [goEditing]
  else
    sgPartos.Options := sgPartos.Options - [goEditing];
end;

procedure TfrmCadPTV.sgCriancasDrawCell(Sender: TObject; ACol,
  ARow: Integer; Rect: TRect; State: TGridDrawState);
var Conteudo:String; x,y,hf:integer; al:Word; c:TColor;   r:TRect;
begin
  inherited;
  Conteudo := sgCriancas.Cells[ACol,ARow];

  //Titulo: Negrito, Centro
  if ((ACol = 0) or (ARow in [0,1])) then
  begin
     r := Rect;
     sgCriancas.Canvas.Font.Style := [fsbold];
     al := SetTextAlign(sgCriancas.Canvas.Handle, TA_CENTER);
     hf := sgCriancas.Canvas.TextHeight('lj');
     sgCriancas.Canvas.FillRect(r);
     x := r.Left + ((r.Right - r.Left)   div 2);
     y := r.Top  - ((r.Top + hf - r.Bottom) div 2);
     sgCriancas.Canvas.TextRect(r,x,y,Conteudo);
     SetTextAlign(sgCriancas.Canvas.Handle, al);
  end;

  //Total: Negrito, Centro, Cor
  if (ACol > 0) and (ARow = 4)then
  begin
     r := Rect;
     sgCriancas.Canvas.Brush.Color := cl3DLight;
     sgCriancas.Canvas.Font.Style := [fsbold];
     al := SetTextAlign(sgCriancas.Canvas.Handle, TA_CENTER);
     hf := sgCriancas.Canvas.TextHeight('lj');
     sgCriancas.Canvas.FillRect(r);
     x := r.Left + ((r.Right - r.Left)   div 2);
     y := r.Top  - ((r.Top + hf - r.Bottom) div 2);
     sgCriancas.Canvas.TextRect(r,x,y,Conteudo);
     SetTextAlign(sgCriancas.Canvas.Handle, al);
  end;
end;

procedure TfrmCadPTV.sgCriancasSelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
begin
  inherited;
  bEdit := not((ACol in [0]) or (ARow in [0,1,4]));

  if (bEdit) and (dsControle.DataSet.State in [dsEdit,dsInsert]) then
    sgCriancas.Options := sgCriancas.Options + [goEditing]
  else
    sgCriancas.Options := sgCriancas.Options - [goEditing];
end;

function TfrmCadPTV.ValidaExclusao: boolean;
begin
  try
    if dmGeral.TB_PTV.State in [dsInsert] then
    begin
      //Primeiro deve Excluir, para depois entao incluir todos
      if dmGeral.TB_PTV.State in dsEditModes then
        dmGeral.TB_PTV.Cancel;

      dmGeral.TB_PTV.Close;
    if leUnidade.LookupValue <> '' then
        dmGeral.TB_PTV.ParamByName('CD_UNIDADE').AsInteger := strtoInt(leUnidade.LookupValue);
    if leProvincia.LookupValue <> '' then
        dmGeral.TB_PTV.ParamByName('CD_PROVINCIA').AsInteger := strtoint(leProvincia.LookupValue);
    if leMunicipio.LookupValue <> '' then
        dmGeral.TB_PTV.ParamByName('CD_MUNICIPIO').AsInteger := StrToInt(leMunicipio.LookupValue);
      dmGeral.TB_PTV.ParamByName('VL_MESANO').AsString := cbMesAno.Text;
      dmGeral.TB_PTV.Open;

      dmGeral.TB_PTV.First;
      while not dmGeral.TB_PTV.Eof do
        dmGeral.TB_PTV.Delete;

      Result := true;
    end;

    if dmGeral.TB_PTV.State in [dsEdit] then
    begin
      //Primeiro deve Excluir, para depois entao incluir todos
      if dmGeral.TB_PTV.State in dsEditModes then
        dmGeral.TB_PTV.Cancel;

      dmGeral.TB_PTV.Close;
    if leUnidade.LookupValue <> '' then
        dmGeral.TB_PTV.ParamByName('CD_UNIDADE').AsInteger := Unidade;
    if leProvincia.LookupValue <> '' then
        dmGeral.TB_PTV.ParamByName('CD_PROVINCIA').AsInteger := Provincia;
    if leMunicipio.LookupValue <> '' then
        dmGeral.TB_PTV.ParamByName('CD_MUNICIPIO').AsInteger := Municipio;
      dmGeral.TB_PTV.ParamByName('VL_MESANO').AsString := MesAno;
      dmGeral.TB_PTV.Open;

      dmGeral.TB_PTV.First;
      while not dmGeral.TB_PTV.Eof do
        dmGeral.TB_PTV.Delete;

      Result := true;
    end;

  except
    Result := false;
  end;
end;

procedure TfrmCadPTV.ckConsolidarClick(Sender: TObject);
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

procedure TfrmCadPTV.btCancelarClick(Sender: TObject);
begin
  if bConsolidado then
  begin
    MessageDlg('Dados em modo de consolidação, não podem ser modificados!',mtInformation,[mbOK],0);
  end
  else
   inherited;

end;

procedure TfrmCadPTV.bteditarClick(Sender: TObject);
begin
  pgGeral.ActivePageIndex := 1;
  pgGeralChange(sender);

  if bConsolidado then
  begin
    MessageDlg('Dados em modo de consolidação, não podem ser modificados!',mtInformation,[mbOK],0);
  end
  else
  begin
    Unidade := dmGeral.TB_PTVCD_UNIDADE.AsInteger;
    Provincia := dmGeral.TB_PTVCD_PROVINCIA.AsInteger;
    Municipio := dmGeral.TB_PTVCD_MUNICIPIO.AsInteger;
    MesAno := dmGeral.TB_PTVVL_MESANO.AsString;
    inherited;
  end;
end;

procedure TfrmCadPTV.grDadosDblClick(Sender: TObject);
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

procedure TfrmCadPTV.btLimparClick(Sender: TObject);
begin
  inherited;
  Limpar;
end;

procedure TfrmCadPTV.btimprimirClick(Sender: TObject);
begin
  frmRelatorioWEB := TfrmRelatorioWEB.Create(application);
  try
    sArq := sPathConsulta+'RelatorioPTV'+FormatDateTime('ddmmyyhhnnss',now)+'.xml';
    GeraXML;
    frmRelatorioWEB.relatorio.Navigate(sArq);
    frmRelatorioWEB.ShowModal;
  finally
    frmRelatorioWEB.Free;
    if FileExists(sArq) then
      DeleteFile(sArq);
  end;

end;

procedure TfrmCadPTV.Limpar;
begin
  inherited;
  leProvincia.Clear;
  leMunicipio.clear;
  leUnidade.clear;
  cbMesAno.Text := '';
  cbAte.Text := '';
end;

procedure TfrmCadPTV.leProvinciaChange(Sender: TObject);
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

procedure TfrmCadPTV.leMunicipioChange(Sender: TObject);
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

procedure TfrmCadPTV.leUnidadeChange(Sender: TObject);
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

procedure TfrmCadPTV.qyGridCalcFields(DataSet: TDataSet);
var sAux:String;
begin
  inherited;
  sAux := qyGridVL_MESANO.AsString;
  sAux := Copy(sAux,4,4)+Copy(sAux,1,2);
  qyGridNR_MESANO.AsInteger :=  strToInt(sAux);
end;

procedure TfrmCadPTV.FormDestroy(Sender: TObject);
begin
  inherited;
  dmGeral.TB_PTV.SelectSQL.Text := sSQLPTV;
end;

procedure TfrmCadPTV.Validar;
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

procedure TfrmCadPTV.cbMesAnoChange(Sender: TObject);
var texto: string;
begin
  inherited;
  texto := StringReplace(cbMesAno.Text, '/', '', [rfReplaceAll, rfIgnoreCase]);
  if Length(texto) > 2 then
    texto := Copy(texto, 1, 2) + '/' + Copy(texto,3,Length(texto)-2);
  cbMesAno.Text := texto;
  cbMesAno.SelStart := Length(texto);
end;

procedure TfrmCadPTV.cbMesAnoKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
    if not (Key in ['0'..'9', #8]) then
    Key := #0
end;

procedure TfrmCadPTV.cbAteChange(Sender: TObject);
var texto: string;
begin
  inherited;
  texto := StringReplace(cbAte.Text, '/', '', [rfReplaceAll, rfIgnoreCase]);
  if Length(texto) > 2 then
    texto := Copy(texto, 1, 2) + '/' + Copy(texto,3,Length(texto)-2);
  cbAte.Text := texto;
  cbAte.SelStart := Length(texto);
end;

procedure TfrmCadPTV.cbAteKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
    if not (Key in ['0'..'9', #8]) then
    Key := #0
end;

procedure TfrmCadPTV.sgGestantesKeyPress(Sender: TObject; var Key: Char);
begin
    if not (Key in ['0'..'9', #8, #13, #0, #17, #18, #19, #20]) then
      Key := #0
end;

procedure TfrmCadPTV.cbMesAnoExit(Sender: TObject);
begin
  if ValidarMesAno(cbMesAno.Text) then
    cbMesAno.SetFocus;
end;

procedure TfrmCadPTV.cbAteExit(Sender: TObject);
begin
  if ValidarMesAno(cbAte.Text) then
    cbAte.SetFocus;
end;

procedure TfrmCadPTV.leUnidadeButtonClick(Sender: TObject);
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

procedure TfrmCadPTV.BitBtn1Click(Sender: TObject);
begin

  if (ValidaContraSenha('Liberar Exportação')) then
  begin
    with TIBQuery.Create(nil) do
    begin
      Database := DM.DB;
      SQL.Clear;
      SQL.Add('update "REGISTRO_PTV" set DT_EXP = NULL, DT_ALTERACAO = ''NOW'', DT_REGISTRO = ''NOW'' '+
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
