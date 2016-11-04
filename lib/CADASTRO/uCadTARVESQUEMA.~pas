unit uCadTARVESQUEMA;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, dxExEdtr, DB, dxCntner, dxTL, dxDBCtrl, dxDBGrid,
  ComCtrls, StdCtrls, Buttons, ExtCtrls, Grids, IBCustomDataSet, IBQuery,
  RxLookup, Mask, DBCtrls, DBGrids, RxDBComb, RpCon, RpConDS, RpBase,
  RpSystem, RpDefine, RpRave, DBClient, Midaslib, ImgList, ib_parse,
  dxEditor, dxEdLib, ToolEdit, Menus, UfrmCadPadFichas,
  dxDBTLCl, dxGrClms;

type
  TfrmCadTARVESQUEMA = class(TfrmCadPadFichas)
    Panel5: TPanel;
    sgTARVESQUEMA: TStringGrid;
    DBGrid1: TDBGrid;
    RvProject1: TRvProject;
    RvSystem1: TRvSystem;
    RvDataSetConnection1: TRvDataSetConnection;
    ClientDataSet1: TClientDataSet;
    ClientDataSet1L2C2: TStringField;
    ClientDataSet1L2C3: TStringField;
    ClientDataSet1L2C4: TStringField;
    ClientDataSet1L2C5: TStringField;
    ClientDataSet1L2C6: TStringField;
    ClientDataSet1L3C2: TStringField;
    ClientDataSet1L3C3: TStringField;
    ClientDataSet1L3C4: TStringField;
    ClientDataSet1L3C5: TStringField;
    ClientDataSet1L3C6: TStringField;
    ClientDataSet1L4C2: TStringField;
    ClientDataSet1L4C3: TStringField;
    ClientDataSet1L4C4: TStringField;
    ClientDataSet1L4C5: TStringField;
    ClientDataSet1L4C6: TStringField;
    ClientDataSet1L5C2: TStringField;
    ClientDataSet1L5C3: TStringField;
    ClientDataSet1L5C4: TStringField;
    ClientDataSet1L5C5: TStringField;
    ClientDataSet1L5C6: TStringField;
    ClientDataSet1L6C2: TStringField;
    ClientDataSet1L6C3: TStringField;
    ClientDataSet1L6C4: TStringField;
    ClientDataSet1L6C5: TStringField;
    ClientDataSet1L6C6: TStringField;
    ClientDataSet1L7C2: TStringField;
    ClientDataSet1L7C3: TStringField;
    ClientDataSet1L7C4: TStringField;
    ClientDataSet1L7C5: TStringField;
    ClientDataSet1L7C6: TStringField;
    ClientDataSet1L8C2: TStringField;
    ClientDataSet1L8C3: TStringField;
    ClientDataSet1L8C4: TStringField;
    ClientDataSet1L8C5: TStringField;
    ClientDataSet1L8C6: TStringField;
    ClientDataSet1L9C2: TStringField;
    ClientDataSet1L9C3: TStringField;
    ClientDataSet1L9C4: TStringField;
    ClientDataSet1L9C5: TStringField;
    ClientDataSet1L9C6: TStringField;
    ClientDataSet1L10C2: TStringField;
    ClientDataSet1L10C3: TStringField;
    ClientDataSet1L10C4: TStringField;
    ClientDataSet1L10C5: TStringField;
    ClientDataSet1L10C6: TStringField;
    ClientDataSet1L11C2: TStringField;
    ClientDataSet1L11C3: TStringField;
    ClientDataSet1L11C4: TStringField;
    ClientDataSet1L11C5: TStringField;
    ClientDataSet1L11C6: TStringField;
    ClientDataSet1L12C2: TStringField;
    ClientDataSet1L12C3: TStringField;
    ClientDataSet1L12C4: TStringField;
    ClientDataSet1L12C5: TStringField;
    ClientDataSet1L12C6: TStringField;
    ClientDataSet1L13C2: TStringField;
    ClientDataSet1L13C3: TStringField;
    ClientDataSet1L13C4: TStringField;
    ClientDataSet1L13C5: TStringField;
    ClientDataSet1L13C6: TStringField;
    ClientDataSet1L14C2: TStringField;
    ClientDataSet1L14C3: TStringField;
    ClientDataSet1L14C4: TStringField;
    ClientDataSet1L14C5: TStringField;
    ClientDataSet1L14C6: TStringField;
    ClientDataSet1L15C2: TStringField;
    ClientDataSet1L15C3: TStringField;
    ClientDataSet1L15C4: TStringField;
    ClientDataSet1L15C5: TStringField;
    ClientDataSet1L15C6: TStringField;
    ClientDataSet1L16C2: TStringField;
    ClientDataSet1L16C3: TStringField;
    ClientDataSet1L16C4: TStringField;
    ClientDataSet1L16C5: TStringField;
    ClientDataSet1L16C6: TStringField;
    ClientDataSet1L17C2: TStringField;
    ClientDataSet1L17C3: TStringField;
    ClientDataSet1L17C4: TStringField;
    ClientDataSet1L17C5: TStringField;
    ClientDataSet1L17C6: TStringField;
    ClientDataSet1L18C2: TStringField;
    ClientDataSet1L18C3: TStringField;
    ClientDataSet1L18C4: TStringField;
    ClientDataSet1L18C5: TStringField;
    ClientDataSet1L18C6: TStringField;
    ClientDataSet1L19C2: TStringField;
    ClientDataSet1L19C3: TStringField;
    ClientDataSet1L19C4: TStringField;
    ClientDataSet1L19C5: TStringField;
    ClientDataSet1L19C6: TStringField;
    ClientDataSet1L20C2: TStringField;
    ClientDataSet1L20C3: TStringField;
    ClientDataSet1L20C4: TStringField;
    ClientDataSet1L20C5: TStringField;
    ClientDataSet1L20C6: TStringField;
    ClientDataSet1L21C2: TStringField;
    ClientDataSet1L21C3: TStringField;
    ClientDataSet1L21C4: TStringField;
    ClientDataSet1L21C5: TStringField;
    ClientDataSet1L21C6: TStringField;
    ClientDataSet1L22C2: TStringField;
    ClientDataSet1L22C3: TStringField;
    ClientDataSet1L22C4: TStringField;
    ClientDataSet1L22C5: TStringField;
    ClientDataSet1L22C6: TStringField;
    ClientDataSet1L23C2: TStringField;
    ClientDataSet1L23C3: TStringField;
    ClientDataSet1L23C4: TStringField;
    ClientDataSet1L23C5: TStringField;
    ClientDataSet1L23C6: TStringField;
    ClientDataSet1L24C2: TStringField;
    ClientDataSet1L24C3: TStringField;
    ClientDataSet1L24C4: TStringField;
    ClientDataSet1L24C5: TStringField;
    ClientDataSet1L24C6: TStringField;
    ClientDataSet1L25C2: TStringField;
    ClientDataSet1L25C3: TStringField;
    ClientDataSet1L25C4: TStringField;
    ClientDataSet1L25C5: TStringField;
    ClientDataSet1L25C6: TStringField;
    ClientDataSet1L26C2: TStringField;
    ClientDataSet1L26C3: TStringField;
    ClientDataSet1L26C4: TStringField;
    ClientDataSet1L26C5: TStringField;
    ClientDataSet1L26C6: TStringField;
    ClientDataSet1PROVINCIA: TStringField;
    ClientDataSet1MUNICIPIO: TStringField;
    ClientDataSet1UNIDADE: TStringField;
    ClientDataSet1MESANO: TStringField;
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
    qyGrid: TIBQuery;
    qyTARVesquema: TIBQuery;
    Label21: TLabel;
    Label20: TLabel;
    Label1: TLabel;
    Label4: TLabel;
    btConsultar: TBitBtn;
    ckConsolidar: TCheckBox;
    qyGridCD_MUNICIPIO: TIntegerField;
    qyGridCD_PROVINCIA: TIntegerField;
    qyGridCD_UNIDADE: TIntegerField;
    qyGridVL_MESANO: TIBStringField;
    qyGridDS_UNIDADE: TIBStringField;
    qyGridDS_MUNICIPIO: TIBStringField;
    qyGridDS_PROVINCIA: TIBStringField;
    grDadosCD_MUNICIPIO: TdxDBGridMaskColumn;
    grDadosCD_PROVINCIA: TdxDBGridMaskColumn;
    grDadosCD_UNIDADE: TdxDBGridMaskColumn;
    grDadosVL_MESANO: TdxDBGridMaskColumn;
    grDadosDS_UNIDADE: TdxDBGridMaskColumn;
    grDadosDS_MUNICIPIO: TdxDBGridMaskColumn;
    grDadosDS_PROVINCIA: TdxDBGridMaskColumn;
    btLimpar: TBitBtn;
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
    BitBtn2: TBitBtn;
    procedure FormShow(Sender: TObject);
    procedure btgravarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure btConsultarClick(Sender: TObject);
    procedure btexcluirClick(Sender: TObject);
    procedure sgTARVESQUEMAKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure sgTARVESQUEMADrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure sgTARVESQUEMASelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure sgTARVESQUEMASetEditText(Sender: TObject; ACol, ARow: Integer;
      const Value: String);
    procedure btIncluirClick(Sender: TObject);
    procedure btimprimirClick(Sender: TObject);
    procedure RvProject1Create(Sender: TObject);
    procedure ckConsolidarClick(Sender: TObject);
    procedure leProvinciaChange(Sender: TObject);
    procedure leMunicipioChange(Sender: TObject);
    procedure leUnidadeChange(Sender: TObject);
    procedure btLimparClick(Sender: TObject);
    procedure btCancelarClick(Sender: TObject);
    procedure bteditarClick(Sender: TObject);
    procedure grDadosDblClick(Sender: TObject);
    procedure qyGridCalcFields(DataSet: TDataSet);
    procedure FormDestroy(Sender: TObject);
    procedure cbMesAnoKeyPress(Sender: TObject; var Key: Char);
    procedure cbMesAnoChange(Sender: TObject);
    procedure cbAteKeyPress(Sender: TObject; var Key: Char);
    procedure cbAteChange(Sender: TObject);
    procedure sgTARVESQUEMAKeyPress(Sender: TObject; var Key: Char);
    procedure cbMesAnoExit(Sender: TObject);
    procedure cbAteExit(Sender: TObject);
    procedure leUnidadeButtonClick(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
  private
    { Private declarations }
    bCarregaGrid :Boolean;
  public
    { Public declarations }
    sNomeTabela:string;
    procedure CriaGrid; override;
    procedure Varregrid;
    procedure AbreConsultas;
    procedure FechaConsultas;
    procedure CarregaComboMesAno;
    procedure CarregaGrid(TB_TARV_ESQUEMA:TDataSet);
    procedure CarregaDemo;
    procedure CalculaTotal;
    procedure CriaDataSet;
    function ValidaExclusao: boolean;
    procedure GeraXML;  override;
    procedure Limpar; override;
    procedure Validar;
  end;

type
  TMes = Record
    gr:TRect;
    sMesclado:String;
end;

var
  frmCadTARVESQUEMA: TfrmCadTARVESQUEMA;
  bMesclando, bEdit, bConsolidado:Boolean;
  Mes:array[0..7] of TMes;
  sSQLTARVESQUEMA:string;
  Unidade, Provincia, Municipio:Integer;
  MesAno:String;
  PSQL, MSQL, USQL:string;

implementation

uses UDMGERAL, UDM, DateUtils, Ugeral, uRelatorioWEB, uFuncaoContraSenha;

{$R *.dfm}

procedure TfrmCadTARVESQUEMA.GeraXML;
var sXML:TStringList;

  procedure GridXML(sg:TStringGrid);
  var r,c:integer; nome,valor:string;
  begin
    for r:=1 to sg.RowCount do
      for c:=0 to sg.ColCount do
      begin
        nome := sg.Name + '_L' + IntToStr(r) + 'C' + IntToStr(c);
        sXML.Add('<'+nome+'>' + sg.Cells[c,r] + '</'+nome+'>');
      end;
  end;

begin
   sXML := TStringList.Create;
   try
      sXML.Add('<?xml version="1.0" encoding="iso-8859-1"?>');
      sXML.Add('<?xml-stylesheet type="text/xsl" href="TARVESQUEMA.xslt"?>');
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

      GridXML(sgTARVESQUEMA);

      sXML.Add('  </Dados>');
      sXML.Add(' </Programa>');

      sXML.SaveToFile(sArq);
   finally
      FreeAndNil(sXML);
   end;
end;


procedure TfrmCadTARVESQUEMA.CriaGrid;
var r,c:integer;
begin
  for r:=0 to 16 do
   for c:=0 to 12 do
     sgTARVESQUEMA.Cells[c,r] := '';

  sgTARVESQUEMA.RowCount := 16;
  sgTARVESQUEMA.ColCount := 12;
  sgTARVESQUEMA.FixedCols := 0;
  sgTARVESQUEMA.FixedRows := 2;
  sgTARVESQUEMA.Cells[0,0] := 'Pacientes em TARV por Esquema';
  sgTARVESQUEMA.Cells[0,1] := 'Tipo de Esquema';

  sgTARVESQUEMA.Cells[1,0] := 'Casos Mês Anterior';
  sgTARVESQUEMA.Cells[1,1] := 'Crianças';
  sgTARVESQUEMA.Cells[2,1] := 'Adultos';
  sgTARVESQUEMA.Cells[3,1] := 'Total';

  sgTARVESQUEMA.Cells[5,0] := 'Casos Mês Corrente';
  sgTARVESQUEMA.Cells[5,1] := 'Crianças';
  sgTARVESQUEMA.Cells[6,1] := 'Adultos';
  sgTARVESQUEMA.Cells[7,1] := 'Total';

  sgTARVESQUEMA.Cells[9,0] := 'Total';
  sgTARVESQUEMA.Cells[9,1] := 'Crianças';
  sgTARVESQUEMA.Cells[10,1] := 'Adultos';
  sgTARVESQUEMA.Cells[11,1] := 'Total';

  sgTARVESQUEMA.Cells[0,2] := 'Regime da 1º linha';

  sgTARVESQUEMA.Cells[0,3] := 'a. AZT + 3TC + NVP';
  sgTARVESQUEMA.Cells[0,4] := 'b. D4T + 3TC + NVP';
  sgTARVESQUEMA.Cells[0,5] := 'c. AZT + 3TC + EFV';
  sgTARVESQUEMA.Cells[0,6] := 'd. D4T + 3TC + EFV';
  sgTARVESQUEMA.Cells[0,7] := 'e. AZT + 3TC + IDV';
  sgTARVESQUEMA.Cells[0,8] := '';

  sgTARVESQUEMA.Cells[0,10] := 'Regime da 2º linha';
  sgTARVESQUEMA.Cells[0,11] := '';
  sgTARVESQUEMA.Cells[0,12] := '';
  sgTARVESQUEMA.Cells[0,13] := '';

  sgTARVESQUEMA.Cells[0,15] := 'Total';

  sgTARVESQUEMA.DefaultColWidth := 90;
  sgTARVESQUEMA.DefaultRowHeight := 22;
//  sgTARVESQUEMA.RowHeights[0] := 22;
  sgTARVESQUEMA.ColWidths[0] := 200;
  sgTARVESQUEMA.ColWidths[4] := 1;
  sgTARVESQUEMA.ColWidths[8] := 1;

end;

procedure TfrmCadTARVESQUEMA.FormShow(Sender: TObject);
begin
  inherited;
  qyGrid.Open;
  CriaGrid;
  pgGeral.ActivePageIndex := 1;
end;

procedure TfrmCadTARVESQUEMA.btgravarClick(Sender: TObject);
var sOP,sOperacao:String;
begin
  if bConsolidado then
  begin
    MessageDlg('Dados em modo de consolidação, não podem ser modificados!',mtInformation,[mbOK],0);
  end
  else
  begin

    if (dmGeral.TB_TARV_ESQUEMA.State = dsEdit) then sOP := 'A';
    if (dmGeral.TB_TARV_ESQUEMA.State = dsInsert) then sOP := 'I';

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
      sArq := sPathConsulta+'RelatorioTARVESQ'+FormatDateTime('ddmmyyhhnnss',now)+'.xml';
      GeraXML;
      dmGeral.ProtocolaEnvio(dmGeral.TB_TARV_ESQUEMA, cvTARVESQ, sOP, sArq);
    finally
      if FileExists(sArq) then
        DeleteFile(sArq);
    end;
  end;
end;

procedure TfrmCadTARVESQUEMA.Varregrid;
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
  for i:=2 to 15 do
  begin
     if (i in [3,4,5,6,7,8,9,11,12,13,14]) then
     begin
       if not (dmGeral.TB_TARV_ESQUEMA.State in [dsEdit,dsInsert]) then
         dmGeral.TB_TARV_ESQUEMA.Insert;

       dmGeral.TB_TARV_ESQUEMACD_REGISTRO_GERAL.AsInteger := nRegistro;
       if cdUnidade <> null then
         dmGeral.TB_TARV_ESQUEMACD_UNIDADE.AsInteger := cdUnidade;

       dmGeral.TB_TARV_ESQUEMACD_PROVINCIA.AsInteger := cdProvincia;

       if cdMunicipio <> null then
         dmGeral.TB_TARV_ESQUEMACD_MUNICIPIO.AsInteger := cdMunicipio;

       dmGeral.TB_TARV_ESQUEMAVL_MESANO.AsString := sMesAno;
       dmGeral.TB_TARV_ESQUEMAVL_Y.AsInteger := i;
       dmGeral.TB_TARV_ESQUEMADT_REGISTRO.AsDateTime := dm.GetDateTime;

       if (i in [3,4,5,6,7,8,9,11,12,13,14]) then begin
         dmGeral.TB_TARV_ESQUEMAVL_ESQUEMA.AsString := sgTARVESQUEMA.Cells[0,i];
         dmGeral.TB_TARV_ESQUEMAVL_ANTERIOR_CRIANCA.AsString := sgTARVESQUEMA.Cells[1,i];
         dmGeral.TB_TARV_ESQUEMAVL_ANTERIOR_ADULTO.AsString := sgTARVESQUEMA.Cells[2,i];
         dmGeral.TB_TARV_ESQUEMAVL_CORRENTE_CRIANCA.AsString := sgTARVESQUEMA.Cells[5,i];
         dmGeral.TB_TARV_ESQUEMAVL_CORRENTE_ADULTO.AsString := sgTARVESQUEMA.Cells[6,i];
       end;

       dmGeral.TB_TARV_ESQUEMA.Post;
     end;
  end;
end;

procedure TfrmCadTARVESQUEMA.AbreConsultas;
begin
  PSQL := qyProvincia.sql.text;
  MSQL := qyMunicipio.sql.text;
  USQL := qyUnidade.sql.text;
  qyProvincia.Open;
  qyMunicipio.Open;
  qyUnidade.Open;
end;

procedure TfrmCadTARVESQUEMA.FechaConsultas;
begin
  qyProvincia.Close;
  qyMunicipio.Close;
  qyUnidade.Close;
end;

procedure TfrmCadTARVESQUEMA.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  FechaConsultas;
  //dmGeral.TB_TARV_ESQUEMA.SelectSQL.Text := sSQLTARVESQUEMA;  
end;

procedure TfrmCadTARVESQUEMA.FormCreate(Sender: TObject);
begin
  nRelatorio := cvTARVESQ;
  inherited;
  FbPermiteMudarPagina := False;
  AbreConsultas;
  CarregaComboMesAno;
  bCarregaGrid := True;
  sSQLTARVESQUEMA := dmGeral.TB_TARV_ESQUEMA.SelectSQL.Text;
  sNomeTabela := 'REGISTRO_TARV_ESQUEMA';
end;

procedure TfrmCadTARVESQUEMA.CarregaDemo;
var i,j,x:integer;
begin
  //Nao Apagar, Isto server para testar as celulas
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
            sgTARVESQUEMA.Cells[j,i] := intToStr(x);
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
            sgTARVESQUEMA.Cells[j,i] := '';
          end;
    end;
  end;
  CalculaTotal;
end;

procedure TfrmCadTARVESQUEMA.CarregaComboMesAno;
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

procedure TfrmCadTARVESQUEMA.btConsultarClick(Sender: TObject);
var sSQLWhere, sSQL, sW:String; nB,nE:Integer;
begin
  inherited;
  if (dmGeral.TB_TARV_ESQUEMA.State in [dsEdit, dsInsert]) then
    Exit;

  dmGeral.TB_TARV_ESQUEMA.Close;
  dmGeral.TB_TARV_ESQUEMA.SelectSQL.Text := sSQLTARVESQUEMA;
  sSQL := sSQLTARVESQUEMA;
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
    dmGeral.TB_TARV_ESQUEMA.SelectSQL.Text := sSQL;
   if (trim(cbMesAno.Text) <> '/') and (trim(cbAte.Text) <> '/') then
    begin
      dmGeral.TB_TARV_ESQUEMA.ParamByName('de').AsString := FormatDateTime('mm/dd/yyyy',(StrToDate('01/'+cbMesAno.text)));
      dmGeral.TB_TARV_ESQUEMA.ParamByName('ate').AsString := FormatDateTime('mm/dd/yyyy',(StrToDate('01/'+cbAte.text)));
    end;

    bConsolidado := true;
  end
  else
  begin
    sSQL := StringReplace(sSQL, 'from "REGISTRO_TARV_ESQUEMA"', 'from '+sNomeTabela+' REGISTRO_TARV_ESQUEMA',[]);
    dmGeral.TB_TARV_ESQUEMA.SelectSQL.Text := sSQL;
    bConsolidado := false;
  end;

  //Felipe 08/05/2013 Desabilitado para padronizar. Ref: CriancaExposta

  {if cbProvincia.KeyValue <> Null then
    dmGeral.TB_TARV_ESQUEMA.ParamByName('CD_PROVINCIA').AsInteger := cbProvincia.KeyValue
      else if not ckConsolidar.Checked then
   begin
     MessageDlg('É necessário informar Provincia!',mtInformation,[mbOK],0);
     cbProvincia.SetFocus;
     Abort;
   end;

  if not ckConsolidar.Checked then
  if cbMesAno.Text <> '' then
    dmGeral.TB_TARV_ESQUEMA.ParamByName('VL_MESANO').AsString := cbMesAno.Text
  else
   begin
     MessageDlg('É necessário informar Mes/Ano De:!',mtInformation,[mbOK],0);
     cbMesAno.SetFocus;
     Abort;
   end;

  if cbMunicipio.KeyValue <> Null then
    dmGeral.TB_TARV_ESQUEMA.ParamByName('CD_MUNICIPIO').AsInteger := cbMunicipio.KeyValue
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
    dmGeral.TB_TARV_ESQUEMA.ParamByName('CD_UNIDADE').AsInteger := cbUnidade.KeyValue
      else if not ckConsolidar.Checked then
   begin
      if MessageDlg('A Unidade não foi informada, '#13#10'deseja continuar?',mtConfirmation,
          [mbYes,mbNo],0) = mrNo then
        begin
          cbUnidade.SetFocus;
          Abort;
        end;
   end;         }

  //Felipe 08/05/2013
  if (leProvincia.LookupValue <> '') then
    dmGeral.TB_TARV_ESQUEMA.ParamByName('CD_PROVINCIA').AsInteger := strtoint(leProvincia.LookupValue);
  if (leMunicipio.LookupValue <> '') then
    dmGeral.TB_TARV_ESQUEMA.ParamByName('CD_MUNICIPIO').AsInteger := StrToInt(leMunicipio.LookupValue);
  if (leUnidade.LookupValue <> '') then
    dmGeral.TB_TARV_ESQUEMA.ParamByName('CD_UNIDADE').AsInteger := StrToInt(leUnidade.LookupValue);

  if not ckConsolidar.Checked then  
    if (trim(cbMesAno.Text) <> '') then
      dmGeral.TB_TARV_ESQUEMA.ParamByName('VL_MESANO').AsString := cbMesAno.Text;

  dmGeral.TB_TARV_ESQUEMA.Open;
  CarregaGrid(dmGeral.TB_TARV_ESQUEMA);
end;

procedure TfrmCadTARVESQUEMA.CarregaGrid(TB_TARV_ESQUEMA:TDataSet);
var rAux:real;
    rAux2:string;
begin
    CriaGrid;
    dmGeral.TB_TARV_ESQUEMA.First;
    while Not dmGeral.TB_TARV_ESQUEMA.Eof do
    begin
{      raux := valor(sgTARVESQUEMA.Cells[0,dmGeral.TB_TARV_ESQUEMAVL_Y.AsInteger]) +
              valor(dmGeral.TB_TARV_ESQUEMAVL_ESQUEMA.AsString);
      sgTARVESQUEMA.Cells[0,dmGeral.TB_TARV_ESQUEMAVL_Y.AsInteger] := floattostr(raux);
}
      sgTARVESQUEMA.Cells[0,dmGeral.TB_TARV_ESQUEMAVL_Y.AsInteger] := dmGeral.TB_TARV_ESQUEMAVL_ESQUEMA.AsString;

      raux := valor(sgTARVESQUEMA.Cells[1,dmGeral.TB_TARV_ESQUEMAVL_Y.AsInteger]) +
              valor(dmGeral.TB_TARV_ESQUEMAVL_ANTERIOR_CRIANCA.AsString);
      sgTARVESQUEMA.Cells[1,dmGeral.TB_TARV_ESQUEMAVL_Y.AsInteger] := floattostr(raux);

      raux := valor(sgTARVESQUEMA.Cells[2,dmGeral.TB_TARV_ESQUEMAVL_Y.AsInteger]) +
              valor(dmGeral.TB_TARV_ESQUEMAVL_ANTERIOR_ADULTO.AsString);
      sgTARVESQUEMA.Cells[2,dmGeral.TB_TARV_ESQUEMAVL_Y.AsInteger] := floattostr(raux);

      raux := valor(sgTARVESQUEMA.Cells[5,dmGeral.TB_TARV_ESQUEMAVL_Y.AsInteger]) +
              valor(dmGeral.TB_TARV_ESQUEMAVL_CORRENTE_CRIANCA.AsString);
      sgTARVESQUEMA.Cells[5,dmGeral.TB_TARV_ESQUEMAVL_Y.AsInteger] := floattostr(raux);

      raux := valor(sgTARVESQUEMA.Cells[6,dmGeral.TB_TARV_ESQUEMAVL_Y.AsInteger]) +
              valor(dmGeral.TB_TARV_ESQUEMAVL_CORRENTE_ADULTO.AsString);
      sgTARVESQUEMA.Cells[6,dmGeral.TB_TARV_ESQUEMAVL_Y.AsInteger] := floattostr(raux);


      dmGeral.TB_TARV_ESQUEMA.Next;
    end;
    CalculaTotal;
end;

procedure TfrmCadTARVESQUEMA.btexcluirClick(Sender: TObject);
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
    dmGeral.TB_TARV_ESQUEMA.Close;
    if leUnidade.LookupValue <> '' then
      dmGeral.TB_TARV_ESQUEMA.ParamByName('CD_UNIDADE').AsInteger := StrToInt(leUnidade.LookupValue);
    if leProvincia.LookupValue <> '' then
      dmGeral.TB_TARV_ESQUEMA.ParamByName('CD_PROVINCIA').AsInteger := strtoint(leProvincia.LookupValue);
    if leMunicipio.LookupValue <> '' then
      dmGeral.TB_TARV_ESQUEMA.ParamByName('CD_MUNICIPIO').AsInteger := StrToInt(leMunicipio.LookupValue);
    dmGeral.TB_TARV_ESQUEMA.ParamByName('VL_MESANO').AsString := cbMesAno.Text;
    dmGeral.TB_TARV_ESQUEMA.Open;

    //Felipe 08/05/2013
{
    dmGeral.TB_TARV_ESQUEMA.First;
    while not dmGeral.TB_TARV_ESQUEMA.Eof do
      dmGeral.TB_TARV_ESQUEMA.Delete;

    dmGeral.TB_TARV_ESQUEMA.Close; dmGeral.TB_TARV_ESQUEMA.Open;
    if bCarregaGrid then
      CarregaGrid(DMGERAL.TB_TARV_ESQUEMA); }


      //Protocolo
      try
        sArq := sPathConsulta+'RelatorioTARVESQ'+FormatDateTime('ddmmyyhhnnss',now)+'.xml';
        GeraXML;
        dmGeral.ProtocolaEnvio(dmGeral.TB_TARV_ESQUEMA, cvTARVESQ, 'E', sArq);
      finally
        if FileExists(sArq) then
          DeleteFile(sArq);
      end;

      inherited;

    end;
  end;
end;

procedure TfrmCadTARVESQUEMA.sgTARVESQUEMAKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if (key = ord('D')) and (shift = [ssShift, ssCtrl]) then
    CarregaDemo;
end;

procedure TfrmCadTARVESQUEMA.sgTARVESQUEMADrawCell(Sender: TObject; ACol, ARow: Integer;
  Rect: TRect; State: TGridDrawState);
var Conteudo:String; x,y,hf,hw,t:integer; al:Word; c:TColor;   r:TRect;
begin
  inherited;
  Conteudo := sgTARVESQUEMA.Cells[ACol,ARow];
  hf := sgTARVESQUEMA.Canvas.TextHeight('Lj');
  //SetTextAlign(sgTARVESQUEMA.Canvas.Handle, TA_CENTER);

  //Mesclar: Negrito, Centro, Borda

  if (ARow = 0) and (ACol in [1,2,3]) or
     (ARow = 0) and (ACol in [5,6,7]) or
     (ARow = 0) and (ACol in [9,10,11]) then
  begin
      if (ACol in [1,5,9]) then
      begin
        Mes[0].gr := Rect;
        Mes[0].sMesclado := Conteudo;
      end;

      if (ACol in [3,7,11]) then
      begin
        r.Left := Mes[0].gr.Left;
        r.Top := Mes[0].gr.Top;
        r.Bottom := Mes[0].gr.Bottom;
        r.Right := Rect.Right;

        sgTARVESQUEMA.Canvas.Font.Style:=[fsbold];
        sgTARVESQUEMA.Canvas.FillRect(r);
        t := sgTARVESQUEMA.Canvas.TextWidth(Mes[0].sMesclado);
        x := r.Left + (((r.Right - r.Left)-t)  div 2);
        y := r.Top  - ((r.Top + hf - r.Bottom) div 2);
        sgTARVESQUEMA.Canvas.TextRect(r,x,y,Mes[0].sMesclado);
        DesenhaBordas(sgTARVESQUEMA.Canvas,r);

      end;
  end;

  //Titulo: Negrito, Centro, Borda
  if ((ACol = 0) and (ARow = 0))or
     ((ACol in [0,1,2,3,5,6,7,9,10,11]) and (ARow = 1))then
  begin
     r := Rect;
     sgTARVESQUEMA.Canvas.Font.Style := [fsbold];
     al := SetTextAlign(sgTARVESQUEMA.Canvas.Handle, TA_CENTER);
     hf := sgTARVESQUEMA.Canvas.TextHeight('lj');
     sgTARVESQUEMA.Canvas.FillRect(r);
     x := r.Left + ((r.Right - r.Left)   div 2);
     y := r.Top  - ((r.Top + hf - r.Bottom) div 2);
     sgTARVESQUEMA.Canvas.TextRect(r,x,y,Conteudo);
     SetTextAlign(sgTARVESQUEMA.Canvas.Handle, al);
     DesenhaBordas(sgTARVESQUEMA.Canvas,r);
  end;

  if ((ACol in [4,8]) and (ARow > 1)) then
  begin
     r := Rect;
     sgTARVESQUEMA.Canvas.Font.Style := [fsbold];
     al := SetTextAlign(sgTARVESQUEMA.Canvas.Handle, TA_CENTER);
     hf := sgTARVESQUEMA.Canvas.TextHeight('lj');
     sgTARVESQUEMA.Canvas.FillRect(r);
     x := r.Left + ((r.Right - r.Left)   div 2);
     y := r.Top  - ((r.Top + hf - r.Bottom) div 2);
     sgTARVESQUEMA.Canvas.TextRect(r,x,y,Conteudo);
     SetTextAlign(sgTARVESQUEMA.Canvas.Handle, al);
     DesenhaBordas(sgTARVESQUEMA.Canvas,r);
  end;


  //Total: Negrito, Centro, Cor
  if ((ARow in [2,10,15]) and (ACol >=0 ))or
     ((ACol in [0]) and (ARow in [3,4,5,6,7,8,11,12,13])) or
     ((ACol in [3,4,7,8,9,10,11]) and (ARow > 1)) then
  begin
     r := Rect;
     sgTARVESQUEMA.Canvas.Brush.Color := cl3DLight;
     sgTARVESQUEMA.Canvas.Font.Style := [fsbold];
     sgTARVESQUEMA.Canvas.FillRect(r);
     t := sgTARVESQUEMA.Canvas.TextWidth(Conteudo);
     x := r.Left + (((r.Right - r.Left)-t)  div 2);
     y := r.Top  - ((r.Top + hf - r.Bottom) div 2);
     sgTARVESQUEMA.Canvas.TextRect(r,x,y,Conteudo);
  end;

end;

procedure TfrmCadTARVESQUEMA.sgTARVESQUEMASelectCell(Sender: TObject; ACol, ARow: Integer;
  var CanSelect: Boolean);
begin
  inherited;
  bEdit := (((ARow in [3,4,5,6,7,8,11,12,13]) and (ACol>=0)) and
    not((ARow in [3,4,5,6,7,8,11,12,13])and(ACol=0)));

  if (bEdit) and (dsControle.DataSet.State in [dsEdit,dsInsert]) then
    sgTARVESQUEMA.Options := sgTARVESQUEMA.Options + [goEditing]
  else
    sgTARVESQUEMA.Options := sgTARVESQUEMA.Options - [goEditing];
end;

procedure TfrmCadTARVESQUEMA.sgTARVESQUEMASetEditText(Sender: TObject; ACol, ARow: Integer;
  const Value: String);
begin
  inherited;
  CalculaToTal;
end;

procedure TfrmCadTARVESQUEMA.CalculaTotal;
var r,c:integer; tl,tc,tg:real;
begin

  for r:=3 to 15 do
  begin
    if r in [3,4,5,6,7,8,9,11,12,13,14] then
    begin
        tl :=
           Valor(sgTARVESQUEMA.Cells[1,r]) +
           Valor(sgTARVESQUEMA.Cells[2,r]);
        sgTARVESQUEMA.Cells[3,r] := FloatToStr(tl);


        tl :=
           Valor(sgTARVESQUEMA.Cells[5,r]) +
           Valor(sgTARVESQUEMA.Cells[6,r]);
        sgTARVESQUEMA.Cells[7,r] := FloatToStr(tl);

        tl :=
           Valor(sgTARVESQUEMA.Cells[1,r]) +
           Valor(sgTARVESQUEMA.Cells[5,r]);
        sgTARVESQUEMA.Cells[9,r] := FloatToStr(tl);

        tl :=
           Valor(sgTARVESQUEMA.Cells[2,r]) +
           Valor(sgTARVESQUEMA.Cells[6,r]);
        sgTARVESQUEMA.Cells[10,r] := FloatToStr(tl);

        tl :=
           Valor(sgTARVESQUEMA.Cells[3,r]) +
           Valor(sgTARVESQUEMA.Cells[7,r]);
        sgTARVESQUEMA.Cells[11,r] := FloatToStr(tl);

    end;
  end;

  for c:=1 to 11 do
  begin
      tg :=
         Valor(sgTARVESQUEMA.Cells[c,3]) +
         Valor(sgTARVESQUEMA.Cells[c,4]) +
         Valor(sgTARVESQUEMA.Cells[c,5]) +
         Valor(sgTARVESQUEMA.Cells[c,6]) +
         Valor(sgTARVESQUEMA.Cells[c,7]) +
         Valor(sgTARVESQUEMA.Cells[c,8]) +
         Valor(sgTARVESQUEMA.Cells[c,9]) +
         Valor(sgTARVESQUEMA.Cells[c,11]) +
         Valor(sgTARVESQUEMA.Cells[c,12]) +
         Valor(sgTARVESQUEMA.Cells[c,13]) +
         Valor(sgTARVESQUEMA.Cells[c,14]);
      sgTARVESQUEMA.Cells[c,15] := FloatToStr(tg);
  end;

end;

procedure TfrmCadTARVESQUEMA.btIncluirClick(Sender: TObject);
begin
  pgGeral.ActivePageIndex := 1;
  dmGeral.TB_TARV_ESQUEMA.Close;
  dmGeral.TB_TARV_ESQUEMA.Open;

  inherited;
  leProvincia.Text := '';
  leUnidade.Text := '';
  leMunicipio.Text := '';
  cbMesAno.ItemIndex := -1;
  ckConsolidar.Checked := false;
  bConsolidado := false;
  CriaGrid;
end;

procedure TfrmCadTARVESQUEMA.btimprimirClick(Sender: TObject);
begin
  frmRelatorioWEB := TfrmRelatorioWEB.Create(application);
  try
    sArq := sPathConsulta+'RelatorioTARVESQUEMA'+FormatDateTime('ddmmyyhhnnss',now)+'.xml';
    GeraXML;
    frmRelatorioWEB.relatorio.Navigate(sArq);
    frmRelatorioWEB.ShowModal;
  finally
    frmRelatorioWEB.Free;
    if FileExists(sArq) then
      DeleteFile(sArq);
  end;
end;

procedure TfrmCadTARVESQUEMA.CriaDataSet;
var r,c:integer; nome,valor:string;
begin
  //Cria Dataset conforme as linhas e colunas da Grid para depois ser usada no Rave
  {for r:=2 to sgTARVESQUEMA.RowCount do
    for c:=2 to sgTARVESQUEMA.ColCount do
    begin
      nome := 'CR'+ IntToStr(c) + '_' + IntToStr(r);
      ClientDataSet1.FieldDefs.Add(nome,ftString,10,False);
    end;

  //Cria Tabela em memoria
  ClientDataSet1.CreateDataSet;
  }
  //Cria um unico registro com todas as celulas da grid em forma de colunas
  ClientDataSet1.Insert;

  //atribuir os 4 campos
  ClientDataSet1.FieldByName('PROVINCIA').AsString := leProvincia.LookupValue;
  ClientDataSet1.FieldByName('MUNICIPIO').AsString := leMunicipio.LookupValue;
  ClientDataSet1.FieldByName('UNIDADE').AsString := leUnidade.LookupValue;
  ClientDataSet1.FieldByName('MESANO').AsString := cbMesAno.Text;

  for r:=2 to sgTARVESQUEMA.RowCount do
    for c:=2 to sgTARVESQUEMA.ColCount do
    begin
      nome := 'L'+ IntToStr(r) + 'C' + IntToStr(c);
      if Assigned(ClientDataSet1.FindField(nome)) then
        ClientDataSet1.FieldByName(nome).AsString := sgTARVESQUEMA.Cells[c,r];
    end;

  ClientDataSet1.Post;
end;

procedure TfrmCadTARVESQUEMA.RvProject1Create(Sender: TObject);
begin
  inherited;
  RvProject1.ProjectFile := sPathLayout +'\RelATV.rav';
end;

function TfrmCadTARVESQUEMA.ValidaExclusao: boolean;
begin
  try
    if dmGeral.TB_TARV_ESQUEMA.State in [dsInsert] then
    begin
      //Primeiro deve Excluir, para depois entao incluir todos
      if dmGeral.TB_TARV_ESQUEMA.State in dsEditModes then
        dmGeral.TB_TARV_ESQUEMA.Cancel;

    dmGeral.TB_TARV_ESQUEMA.Close;
    if leUnidade.LookupValue <> '' then
      dmGeral.TB_TARV_ESQUEMA.ParamByName('CD_UNIDADE').AsInteger := strtoInt(leUnidade.LookupValue);
    if leProvincia.LookupValue <> '' then
      dmGeral.TB_TARV_ESQUEMA.ParamByName('CD_PROVINCIA').AsInteger := strtoint(leProvincia.LookupValue);
    if leMunicipio.LookupValue <> '' then
      dmGeral.TB_TARV_ESQUEMA.ParamByName('CD_MUNICIPIO').AsInteger := StrToInt(leMunicipio.LookupValue);
    dmGeral.TB_TARV_ESQUEMA.ParamByName('VL_MESANO').AsString := cbMesAno.Text;
    dmGeral.TB_TARV_ESQUEMA.Open;

      dmGeral.TB_TARV_ESQUEMA.First;
      while not dmGeral.TB_TARV_ESQUEMA.Eof do
        dmGeral.TB_TARV_ESQUEMA.Delete;

      Result := true;
    end;

    if dmGeral.TB_TARV_ESQUEMA.State in [dsEdit] then
    begin
      //Primeiro deve Excluir, para depois entao incluir todos
      if dmGeral.TB_TARV_ESQUEMA.State in dsEditModes then
        dmGeral.TB_TARV_ESQUEMA.Cancel;

    dmGeral.TB_TARV_ESQUEMA.Close;
    if leUnidade.LookupValue <> '' then
      dmGeral.TB_TARV_ESQUEMA.ParamByName('CD_UNIDADE').AsInteger := Unidade;
    if leProvincia.LookupValue <> '' then
      dmGeral.TB_TARV_ESQUEMA.ParamByName('CD_PROVINCIA').AsInteger := Provincia;
    if leMunicipio.LookupValue <> '' then
      dmGeral.TB_TARV_ESQUEMA.ParamByName('CD_MUNICIPIO').AsInteger := Municipio;
    dmGeral.TB_TARV_ESQUEMA.ParamByName('VL_MESANO').AsString := MesAno;
    dmGeral.TB_TARV_ESQUEMA.Open;

      dmGeral.TB_TARV_ESQUEMA.First;
      while not dmGeral.TB_TARV_ESQUEMA.Eof do
        dmGeral.TB_TARV_ESQUEMA.Delete;

      Result := true;
    end;

  except
    Result := false;
  end;
end;

procedure TfrmCadTARVESQUEMA.grDadosDblClick(Sender: TObject);
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
procedure TfrmCadTARVESQUEMA.ckConsolidarClick(Sender: TObject);
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

procedure TfrmCadTARVESQUEMA.btLimparClick(Sender: TObject);
begin
  inherited;
  Limpar;
end;



procedure TfrmCadTARVESQUEMA.bteditarClick(Sender: TObject);
begin
  pgGeral.ActivePageIndex := 1;
  pgGeralChange(sender);

  if bConsolidado then
  begin
    MessageDlg('Dados em modo de consolidação, não podem ser modificados!',mtInformation,[mbOK],0);
  end
  else
  begin
    Unidade := dmGeral.TB_TARV_ESQUEMACD_UNIDADE.AsInteger;
    Provincia := dmGeral.TB_TARV_ESQUEMACD_PROVINCIA.AsInteger;
    Municipio := dmGeral.TB_TARV_ESQUEMACD_MUNICIPIO.AsInteger;
    MesAno := dmGeral.TB_TARV_ESQUEMAVL_MESANO.AsString;
    inherited;
  end;
end;

procedure TfrmCadTARVESQUEMA.btCancelarClick(Sender: TObject);
begin
  if bConsolidado then
  begin
    MessageDlg('Dados em modo de consolidação, não podem ser modificados!',mtInformation,[mbOK],0);
  end
  else
   inherited;
   
end;



procedure TfrmCadTARVESQUEMA.Limpar;
begin
  inherited;
  leProvincia.Clear;
  leMunicipio.clear;
  leUnidade.clear;
  cbMesAno.Text := '';
  cbAte.Text := '';
end;

procedure TfrmCadTARVESQUEMA.leProvinciaChange(Sender: TObject);
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

procedure TfrmCadTARVESQUEMA.leMunicipioChange(Sender: TObject);
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

procedure TfrmCadTARVESQUEMA.leUnidadeChange(Sender: TObject);
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

procedure TfrmCadTARVESQUEMA.qyGridCalcFields(DataSet: TDataSet);
var sAux:String;
begin
  inherited;
  sAux := qyGridVL_MESANO.AsString;
  sAux := Copy(sAux,4,4)+Copy(sAux,1,2);
  qyGridNR_MESANO.AsInteger :=  strToInt(sAux);
end;

procedure TfrmCadTARVESQUEMA.FormDestroy(Sender: TObject);
begin
  inherited;
  dmGeral.TB_TARV_ESQUEMA.SelectSQL.Text := sSQLTARVESQUEMA;
end;

procedure TfrmCadTARVESQUEMA.Validar;
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

procedure TfrmCadTARVESQUEMA.cbMesAnoKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
    if not (Key in ['0'..'9', #8]) then
    Key := #0
end;

procedure TfrmCadTARVESQUEMA.cbMesAnoChange(Sender: TObject);
var texto: string;
begin
  inherited;
  texto := StringReplace(cbMesAno.Text, '/', '', [rfReplaceAll, rfIgnoreCase]);
  if Length(texto) > 2 then
    texto := Copy(texto, 1, 2) + '/' + Copy(texto,3,Length(texto)-2);
  cbMesAno.Text := texto;
  cbMesAno.SelStart := Length(texto);

end;

procedure TfrmCadTARVESQUEMA.cbAteKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
    if not (Key in ['0'..'9', #8]) then
    Key := #0
end;

procedure TfrmCadTARVESQUEMA.cbAteChange(Sender: TObject);
var texto: string;
begin
  inherited;
  texto := StringReplace(cbAte.Text, '/', '', [rfReplaceAll, rfIgnoreCase]);
  if Length(texto) > 2 then
    texto := Copy(texto, 1, 2) + '/' + Copy(texto,3,Length(texto)-2);
  cbAte.Text := texto;
  cbAte.SelStart := Length(texto);

end;

procedure TfrmCadTARVESQUEMA.sgTARVESQUEMAKeyPress(Sender: TObject;
  var Key: Char);
begin
    if not (Key in ['0'..'9', #8, #13, #0, #17, #18, #19, #20]) then
      Key := #0
end;

procedure TfrmCadTARVESQUEMA.cbMesAnoExit(Sender: TObject);
begin
  if ValidarMesAno(cbMesAno.Text) then
    cbMesAno.SetFocus;
end;

procedure TfrmCadTARVESQUEMA.cbAteExit(Sender: TObject);
begin
  if ValidarMesAno(cbAte.Text) then
    cbAte.SetFocus;
end;

procedure TfrmCadTARVESQUEMA.leUnidadeButtonClick(Sender: TObject);
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

procedure TfrmCadTARVESQUEMA.BitBtn2Click(Sender: TObject);
begin

  if (ValidaContraSenha('Liberar Exportação')) then
  begin
    with TIBQuery.Create(nil) do
    begin
      Database := DM.DB;
      SQL.Clear;
      SQL.Add('update "REGISTRO_TARV_ESQUEMA" set DT_EXP = NULL, DT_ALTERACAO = ''NOW'', DT_REGISTRO = ''NOW'' '+
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





