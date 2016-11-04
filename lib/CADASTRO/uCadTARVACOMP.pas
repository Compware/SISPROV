unit uCadTARVACOMP;

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
  TfrmCadTARVACOMP = class(TfrmCadPadFichas)
    Panel5: TPanel;
    sgTARV: TStringGrid;
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
    Label21: TLabel;
    Label20: TLabel;
    Label1: TLabel;
    Label4: TLabel;
    btConsultar: TBitBtn;
    ckConsolidar: TCheckBox;
    qyGrid: TIBQuery;
    qyTARV: TIBQuery;
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
    procedure sgTARVKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure sgTARVDrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure sgTARVSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure sgTARVSetEditText(Sender: TObject; ACol, ARow: Integer;
      const Value: String);
    procedure btIncluirClick(Sender: TObject);
    procedure btimprimirClick(Sender: TObject);
    procedure RvProject1Create(Sender: TObject);
    procedure grDadosDblClick(Sender: TObject);
    procedure btCancelarClick(Sender: TObject);
    procedure bteditarClick(Sender: TObject);
    procedure btLimparClick(Sender: TObject);
    procedure ckConsolidarClick(Sender: TObject);
    procedure leProvinciaChange(Sender: TObject);
    procedure leMunicipioChange(Sender: TObject);
    procedure leUnidadeChange(Sender: TObject);
    procedure qyGridCalcFields(DataSet: TDataSet);
    procedure FormDestroy(Sender: TObject);
    procedure cbMesAnoChange(Sender: TObject);
    procedure cbMesAnoKeyPress(Sender: TObject; var Key: Char);
    procedure cbAteChange(Sender: TObject);
    procedure cbAteKeyPress(Sender: TObject; var Key: Char);
    procedure sgTARVKeyPress(Sender: TObject; var Key: Char);
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
    procedure CarregaGrid(TB_TARV_ACOMP:TDataSet);
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
  frmCadTARVACOMP: TfrmCadTARVACOMP;
  bMesclando, bEdit, bConsolidado:Boolean;
  Mes:array[0..7] of TMes;
  sSQLTARV:string;
  Unidade, Provincia, Municipio:Integer;
  MesAno:String;
  PSQL, MSQL, USQL:string;

implementation

uses UDMGERAL, UDM, DateUtils, Ugeral, uRelatorioWEB, uFuncaoContraSenha;

{$R *.dfm}

procedure TfrmCadTARVACOMP.GeraXML;
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
      sXML.Add('<?xml-stylesheet type="text/xsl" href="ACOMPANHAMENTO.xslt"?>');
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

      GridXML(sgTARV);

      sXML.Add('  </Dados>');
      sXML.Add(' </Programa>');

      sXML.SaveToFile(sArq);
   finally
      FreeAndNil(sXML);
   end;
end;


procedure TfrmCadTARVACOMP.CriaGrid;
var r,c:integer;
begin
  for r:=0 to 11 do
   for c:=0 to 8 do
     sgTARV.Cells[c,r] := '';

  sgTARV.RowCount := 12;
  sgTARV.ColCount := 9;
  sgTARV.FixedCols := 2;
  sgTARV.FixedRows := 2;
  sgTARV.Cells[3,0] := 'Casos Mês corrente';
  sgTARV.Cells[0,0] := 'Grupos Etários';
  sgTARV.Cells[1,0] := 'Sexo';
  sgTARV.Cells[2,0] := 'Acumulados';
  sgTARV.Cells[3,1] := 'Novos(+)';
  sgTARV.Cells[4,1] := 'Transferidos(+)';
  sgTARV.Cells[5,1] := 'Abandonam(-)';
  sgTARV.Cells[6,1] := 'Outra Unidade(-)';
  sgTARV.Cells[7,1] := 'Óbito(-)';
  sgTARV.Cells[8,1] := 'Total';

  sgTARV.Cells[0,2] := '1.1 CRIANÇAS';
  sgTARV.Cells[0,3] := '0-14 anos';
  sgTARV.Cells[1,3] := 'Feminino';
  sgTARV.Cells[1,4] := 'Masculino';
  sgTARV.Cells[1,5] := 'Total';

  sgTARV.Cells[0,6] := '1.2 ADULTOS';
  sgTARV.Cells[0,7] := '15 ou mais';
  sgTARV.Cells[1,7] := 'Feminino';
  sgTARV.Cells[1,8] := 'Masculino';
  sgTARV.Cells[1,9] := 'Total';

  sgTARV.Cells[0,10] := '1.3 GESTANTES';
  sgTARV.Cells[0,11] := 'Total Geral';

  sgTARV.DefaultColWidth := 100;
  sgTARV.DefaultRowHeight := 22;
  sgTARV.RowHeights[1] := 22;
  sgTARV.ColWidths[0] := 150;
end;

procedure TfrmCadTARVACOMP.FormShow(Sender: TObject);
begin
  inherited;
  qyGrid.Open;
  CriaGrid;
  pgGeral.ActivePageIndex := 1;
end;

procedure TfrmCadTARVACOMP.btgravarClick(Sender: TObject);
var sOP,sOperacao:String;
begin
  if bConsolidado then
  begin
    MessageDlg('Dados em modo de consolidação, não podem ser modificados!',mtInformation,[mbOK],0);
  end
  else
  begin

    if (dmGeral.TB_TARV_ACOMP.State = dsEdit) then sOP := 'A';
    if (dmGeral.TB_TARV_ACOMP.State = dsInsert) then sOP := 'I';

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
      sArq := sPathConsulta+'RelatorioACOMP'+FormatDateTime('ddmmyyhhnnss',now)+'.xml';
      GeraXML;
      dmGeral.ProtocolaEnvio(dmGeral.TB_TARV_ACOMP, cvACOMP, sOP, sArq);
    finally
      if FileExists(sArq) then
        DeleteFile(sArq);
    end;

  end;
end;

procedure TfrmCadTARVACOMP.Varregrid;
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
  for i:=2 to 10 do
  begin
     if (i in [3,4,7,8,10]) then
     begin
       if not (dmGeral.TB_TARV_ACOMP.State in [dsEdit,dsInsert]) then
         dmGeral.TB_TARV_ACOMP.Insert;

       dmGeral.TB_TARV_ACOMPCD_REGISTRO_GERAL.AsInteger := nRegistro;
       if cdUnidade <> null then
         dmGeral.TB_TARV_ACOMPCD_UNIDADE.AsInteger := cdUnidade;

       dmGeral.TB_TARV_ACOMPCD_PROVINCIA.AsInteger := cdProvincia;

       if cdMunicipio <> null then
         dmGeral.TB_TARV_ACOMPCD_MUNICIPIO.AsInteger := cdMunicipio;

       dmGeral.TB_TARV_ACOMPVL_MESANO.AsString := sMesAno;
       dmGeral.TB_TARV_ACOMPVL_Y.AsInteger := i;
       dmGeral.TB_TARV_ACOMPDT_REGISTRO.AsDateTime := dm.GetDateTime;

       if (i in [10]) then dmGeral.TB_TARV_ACOMPFL_GESTANTE.AsInteger := cvFlSim;
       if (i in [3,4]) then dmGeral.TB_TARV_ACOMPID_FAIXA_ETARIA.AsInteger := cvFaixaEtaria2;
       if (i in [7,8]) then dmGeral.TB_TARV_ACOMPID_FAIXA_ETARIA.AsInteger := cvFaixaEtaria6;
       if (i in [3,7]) then dmGeral.TB_TARV_ACOMPFL_SEXO.AsString := cvFeminino;
       if (i in [4,8]) then dmGeral.TB_TARV_ACOMPFL_SEXO.AsString := cvMasculino;
       if (i in [3,4,7,8,10]) then begin
         dmGeral.TB_TARV_ACOMPVL_ACUMULADOS.AsString := sgTARV.Cells[2,i];
         dmGeral.TB_TARV_ACOMPVL_NOVOS.AsString := sgTARV.Cells[3,i];
         dmGeral.TB_TARV_ACOMPVL_TRANSFERIDOS.AsString := sgTARV.Cells[4,i];
         dmGeral.TB_TARV_ACOMPVL_ABANDONOS.AsString := sgTARV.Cells[5,i];
         dmGeral.TB_TARV_ACOMPVL_TRANSFERIDOS_PARA.AsString := sgTARV.Cells[6,i];
         dmGeral.TB_TARV_ACOMPVL_OBITOS.AsString := sgTARV.Cells[7,i];
       end;

       dmGeral.TB_TARV_ACOMP.Post;
     end;
  end;
end;

procedure TfrmCadTARVACOMP.AbreConsultas;
begin
  PSQL := qyProvincia.sql.text;
  MSQL := qyMunicipio.sql.text;
  USQL := qyUnidade.sql.text;
  qyProvincia.Open;
  qyMunicipio.Open;
  qyUnidade.Open;
end;

procedure TfrmCadTARVACOMP.FechaConsultas;
begin
  qyProvincia.Close;
  qyMunicipio.Close;
  qyUnidade.Close;
end;

procedure TfrmCadTARVACOMP.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  FechaConsultas;
  //dmGeral.TB_TARV_ACOMP.SelectSQL.Text := sSQLTARV;
end;

procedure TfrmCadTARVACOMP.FormCreate(Sender: TObject);
begin
  nRelatorio := cvACOMP;
  inherited;
  FbPermiteMudarPagina := False;
  AbreConsultas;
  CarregaComboMesAno;
  bCarregaGrid := True;
  sSQLTARV := dmGeral.TB_TARV_ACOMP.SelectSQL.Text;
  sNomeTabela := 'REGISTRO_TARV_ACOMP';
end;

procedure TfrmCadTARVACOMP.CarregaDemo;
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
            sgTARV.Cells[j,i] := intToStr(x);
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
            sgTARV.Cells[j,i] := '';
          end;
    end;
  end;
  CalculaTotal;
end;

procedure TfrmCadTARVACOMP.CarregaComboMesAno;
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

procedure TfrmCadTARVACOMP.btConsultarClick(Sender: TObject);
var sSQLWhere, sSQL, sW:String; nB,nE:Integer;
begin
  inherited;
  if (dmGeral.TB_TARV_ACOMP.State in [dsEdit, dsInsert]) then
    Exit;

  dmGeral.TB_TARV_ACOMP.Close;
  dmGeral.TB_TARV_ACOMP.SelectSQL.Text := sSQLTARV;
  sSQL := sSQLTARV;
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
    dmGeral.TB_TARV_ACOMP.SelectSQL.Text := sSQL;
    if (trim(cbMesAno.Text) <> '/') and (trim(cbAte.Text) <> '/') then
    begin
      dmGeral.TB_TARV_ACOMP.ParamByName('de').AsString := FormatDateTime('mm/dd/yyyy',(StrToDate('01/'+cbMesAno.text)));
      dmGeral.TB_TARV_ACOMP.ParamByName('ate').AsString := FormatDateTime('mm/dd/yyyy',(StrToDate('01/'+cbAte.text)));
    end;

    bConsolidado := true;
  end
  else
  begin
    sSQL := StringReplace(sSQL, 'from "REGISTRO_TARV_ACOMP"', 'from '+sNomeTabela+' REGISTRO_TARV_ACOMP',[]);
    dmGeral.TB_TARV_ACOMP.SelectSQL.Text := sSQL;
    bConsolidado := false;
  end;

  //Felipe 08/05/2013 Desabilitado para padronizar. Ref: CriancaExposta

  {if cbProvincia.KeyValue <> Null then
    dmGeral.TB_TARV_ACOMP.ParamByName('CD_PROVINCIA').AsInteger := cbProvincia.KeyValue
      else if not ckConsolidar.Checked then
   begin
     MessageDlg('É necessário informar Provincia!',mtInformation,[mbOK],0);
     cbProvincia.SetFocus;
     Abort;
   end;

  if not ckConsolidar.Checked then
  if cbMesAno.Text <> '' then
    dmGeral.TB_TARV_ACOMP.ParamByName('VL_MESANO').AsString := cbMesAno.Text
  else
   begin
     MessageDlg('É necessário informar Mes/Ano De:!',mtInformation,[mbOK],0);
     cbMesAno.SetFocus;
     Abort;
   end;

  if cbMunicipio.KeyValue <> Null then
    dmGeral.TB_TARV_ACOMP.ParamByName('CD_MUNICIPIO').AsInteger := cbMunicipio.KeyValue
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
    dmGeral.TB_TARV_ACOMP.ParamByName('CD_UNIDADE').AsInteger := cbUnidade.KeyValue
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
    dmGeral.TB_TARV_ACOMP.ParamByName('CD_PROVINCIA').AsInteger := strtoint(leProvincia.LookupValue);
  if (leMunicipio.LookupValue <> '') then
    dmGeral.TB_TARV_ACOMP.ParamByName('CD_MUNICIPIO').AsInteger := StrToInt(leMunicipio.LookupValue);
  if (leUnidade.LookupValue <> '') then
    dmGeral.TB_TARV_ACOMP.ParamByName('CD_UNIDADE').AsInteger := StrToInt(leUnidade.LookupValue);

  if not ckConsolidar.Checked then  
    if (trim(cbMesAno.Text) <> '') then
      dmGeral.TB_TARV_ACOMP.ParamByName('VL_MESANO').AsString := cbMesAno.Text;

  dmGeral.TB_TARV_ACOMP.Open;
  CarregaGrid(dmGeral.TB_TARV_ACOMP);
  {  ConsultaTARV;
     CarregaGrid(qyTARV);}

end;

procedure TfrmCadTARVACOMP.CarregaGrid(TB_TARV_ACOMP:TDataSet);
var rAux:real;
begin
    CriaGrid;
    dmGeral.TB_TARV_ACOMP.First;
    while Not dmGeral.TB_TARV_ACOMP.Eof do
    begin
      raux := valor(sgTARV.Cells[2,dmGeral.TB_TARV_ACOMPVL_Y.AsInteger]) +
              valor(dmGeral.TB_TARV_ACOMPVL_ACUMULADOS.AsString);
      sgTARV.Cells[2,dmGeral.TB_TARV_ACOMPVL_Y.AsInteger] := floattostr(raux);

      raux := valor(sgTARV.Cells[3,dmGeral.TB_TARV_ACOMPVL_Y.AsInteger]) +
              valor(dmGeral.TB_TARV_ACOMPVL_NOVOS.AsString);
      sgTARV.Cells[3,dmGeral.TB_TARV_ACOMPVL_Y.AsInteger] := floattostr(raux);

      raux := valor(sgTARV.Cells[4,dmGeral.TB_TARV_ACOMPVL_Y.AsInteger]) +
              valor(dmGeral.TB_TARV_ACOMPVL_TRANSFERIDOS.AsString);
      sgTARV.Cells[4,dmGeral.TB_TARV_ACOMPVL_Y.AsInteger] := floattostr(raux);

      raux := valor(sgTARV.Cells[5,dmGeral.TB_TARV_ACOMPVL_Y.AsInteger]) +
              valor(dmGeral.TB_TARV_ACOMPVL_ABANDONOS.AsString);
      sgTARV.Cells[5,dmGeral.TB_TARV_ACOMPVL_Y.AsInteger] := floattostr(raux);

      raux := valor(sgTARV.Cells[6,dmGeral.TB_TARV_ACOMPVL_Y.AsInteger]) +
              valor(dmGeral.TB_TARV_ACOMPVL_TRANSFERIDOS_PARA.AsString);
      sgTARV.Cells[6,dmGeral.TB_TARV_ACOMPVL_Y.AsInteger] := floattostr(raux);

      raux := valor(sgTARV.Cells[7,dmGeral.TB_TARV_ACOMPVL_Y.AsInteger]) +
              valor(dmGeral.TB_TARV_ACOMPVL_OBITOS.AsString);
      sgTARV.Cells[7,dmGeral.TB_TARV_ACOMPVL_Y.AsInteger] := floattostr(raux);

      dmGeral.TB_TARV_ACOMP.Next;
    end;
    CalculaTotal;
end;

procedure TfrmCadTARVACOMP.btexcluirClick(Sender: TObject);
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
    dmGeral.TB_TARV_ACOMP.Close;
    if leUnidade.LookupValue <> '' then
      dmGeral.TB_TARV_ACOMP.ParamByName('CD_UNIDADE').AsInteger := StrToInt(leUnidade.LookupValue);
    if leProvincia.LookupValue <> '' then
      dmGeral.TB_TARV_ACOMP.ParamByName('CD_PROVINCIA').AsInteger := strtoint(leProvincia.LookupValue);
    if leMunicipio.LookupValue <> null then
      dmGeral.TB_TARV_ACOMP.ParamByName('CD_MUNICIPIO').AsInteger := StrToInt(leMunicipio.LookupValue);
    dmGeral.TB_TARV_ACOMP.ParamByName('VL_MESANO').AsString := cbMesAno.Text;
    dmGeral.TB_TARV_ACOMP.Open;

  //Felipe 08/05/2013
{
    dmGeral.TB_TARV_ACOMP.First;
    while not dmGeral.TB_TARV_ACOMP.Eof do
      dmGeral.TB_TARV_ACOMP.Delete;

    dmGeral.TB_TARV_ACOMP.Close; dmGeral.TB_TARV_ACOMP.Open;
    if bCarregaGrid then
      CarregaGrid(DMGERAL.TB_TARV_ACOMP);  }

      //Protocolo
      try
        sArq := sPathConsulta+'RelatorioACOMP'+FormatDateTime('ddmmyyhhnnss',now)+'.xml';
        GeraXML;
        dmGeral.ProtocolaEnvio(dmGeral.TB_TARV_ACOMP, cvACOMP, 'E', sArq);
      finally
        if FileExists(sArq) then
          DeleteFile(sArq);
      end;

      inherited;

    end;
  end;
end;

procedure TfrmCadTARVACOMP.sgTARVKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if (key = ord('D')) and (shift = [ssShift, ssCtrl]) then
    CarregaDemo;
end;

procedure TfrmCadTARVACOMP.sgTARVDrawCell(Sender: TObject; ACol, ARow: Integer;
  Rect: TRect; State: TGridDrawState);
var Conteudo:String; x,y,hf,hw,t:integer; c:TColor;   r:TRect;
begin
  inherited;
  Conteudo := sgTARV.Cells[ACol,ARow];
  hf := sgTARV.Canvas.TextHeight('Lj');
  //SetTextAlign(sgTARV.Canvas.Handle, TA_CENTER);

  //Mesclar: Negrito, Centro, Borda
  if (ARow = 0) and (ACol > 2) then
  begin
      if ACol = 3 then
      begin
        Mes[0].gr := Rect;
        Mes[0].sMesclado := Conteudo;
      end;

      if (ACol = 8) then
      begin
        r.Left := Mes[0].gr.Left;
        r.Top := Mes[0].gr.Top;
        r.Bottom := Mes[0].gr.Bottom;
        r.Right := Rect.Right;

        sgTARV.Canvas.Font.Style:=[fsbold];
        sgTARV.Canvas.FillRect(r);
        t := sgTARV.Canvas.TextWidth(Mes[0].sMesclado);
        x := r.Left + (((r.Right - r.Left)-t)  div 2);
        y := r.Top  - ((r.Top + hf - r.Bottom) div 2);
        sgTARV.Canvas.TextRect(r,x,y,Mes[0].sMesclado);
        DesenhaBordas(sgTARV.Canvas,r);
      end;
  end;

{  //Mesclar: Negrito, Centro, Borda
  if (ARow = 6) and (ACol in [0,1]) then
  begin
      if ACol = 0 then
      begin
        Mes[6].gr := Rect;
        Mes[6].sMesclado := Conteudo;
      end;

      if (ACol = 1) then
      begin
        r.Left := Mes[6].gr.Left;
        r.Top := Mes[6].gr.Top;
        r.Bottom := Mes[6].gr.Bottom;
        r.Right := Rect.Right;

        sgTARV.Canvas.Font.Style:=[fsbold];
        sgTARV.Canvas.FillRect(r);
        t := sgTARV.Canvas.TextWidth(Mes[6].sMesclado);
        x := r.Left + (((r.Right - r.Left)-t)  div 2);
        y := r.Top  - ((r.Top + hf - r.Bottom) div 2);
        sgTARV.Canvas.TextRect(r,x,y,Mes[6].sMesclado);
        DesenhaBordas(sgTARV.Canvas,r);
      end;
  end;
}
{
 //Mesclar: Negrito, Centro, Borda
  if (ARow = 2) and (ACol in [0,1]) then
  begin
      if ACol = 0 then
      begin
        Mes[7].gr := Rect;
        Mes[7].sMesclado := Conteudo;
      end;

      if (ACol = 1) then
      begin
        r.Left := Mes[7].gr.Left;
        r.Top := Mes[7].gr.Top;
        r.Bottom := Mes[7].gr.Bottom;
        r.Right := Rect.Right;

        sgTARV.Canvas.Font.Style:=[fsbold];
        sgTARV.Canvas.FillRect(r);
        t := sgTARV.Canvas.TextWidth(Mes[7].sMesclado);
        x := r.Left + (((r.Right - r.Left)-t)  div 2);
        y := r.Top  - ((r.Top + hf - r.Bottom) div 2);
        sgTARV.Canvas.TextRect(r,x,y,Mes[7].sMesclado);
        DrawText(sgTARV.Canvas.Handle,Pchar(Mes[7].sMesclado),-1,r,DT_WORDBREAK+DT_CENTER+DT_VCENTER);
        DesenhaBordas(sgTARV.Canvas,r);
      end;
  end;
}
  //Mesclar: Negrito, Centro, Borda
  if (ARow in [0,1]) and (ACol = 0) then
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

        sgTARV.Canvas.Font.Style:=[fsbold];
        sgTARV.Canvas.FillRect(r);
        t := sgTARV.Canvas.TextWidth(Mes[1].sMesclado);
        x := r.Left + (((r.Right - r.Left)-t)  div 2);
        y := r.Top  - ((r.Top + hf - r.Bottom) div 2);
        sgTARV.Canvas.TextRect(r,x,y,Mes[1].sMesclado);
        //DrawText(sgTARV.Canvas.Handle,Pchar(Mes[1].sMesclado),-1,r,DT_WORDBREAK+DT_CENTER+DT_VCENTER);
        DesenhaBordas(sgTARV.Canvas,r);
      end;
  end;


  //Mesclar: Negrito, Centro, Borda
  if (ARow in [0,1]) and (ACol = 1) then
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

        sgTARV.Canvas.Font.Style:=[fsbold];
        sgTARV.Canvas.FillRect(r);
        t := sgTARV.Canvas.TextWidth(Mes[2].sMesclado);
        x := r.Left + (((r.Right - r.Left)-t)  div 2);
        y := r.Top  - ((r.Top + hf - r.Bottom) div 2);
        sgTARV.Canvas.TextRect(r,x,y,Mes[2].sMesclado);
        //DrawText(sgTARV.Canvas.Handle,Pchar(Mes[2].sMesclado),-1,r,DT_WORDBREAK+DT_CENTER+DT_VCENTER);
        DesenhaBordas(sgTARV.Canvas,r);
      end;
  end;

  //Mesclar: Negrito, Centro, Borda
  if (ARow in [0,1]) and (ACol = 2) then
  begin
      if ARow = 0 then
      begin
        Mes[3].gr := Rect;
        Mes[3].sMesclado := Conteudo;
      end;

      if (ARow = 1) then
      begin
        r.Left := Mes[3].gr.Left;
        r.Top := Mes[3].gr.Top;
        r.Bottom := Rect.Bottom;
        r.Right := Mes[3].gr.Right;

        sgTARV.Canvas.Font.Style:=[fsbold];
        sgTARV.Canvas.FillRect(r);
        t := sgTARV.Canvas.TextWidth(Mes[3].sMesclado);
        x := r.Left + (((r.Right - r.Left)-t)  div 2);
        y := r.Top  - ((r.Top + hf - r.Bottom) div 2);
        //DrawText(sgTARV.Canvas.Handle,Pchar(Mes[3].sMesclado),-1,r,DT_WORDBREAK+DT_CENTER+DT_VCENTER); //
        sgTARV.Canvas.TextRect(r,x,y,Mes[3].sMesclado);
        DesenhaBordas(sgTARV.Canvas,r);
      end;
  end;

  //Mesclar: Negrito, Centro, Borda
  if (ACol in [0]) and (ARow in [3,4,5]) then
  begin
      if ARow = 3 then
      begin
        Mes[4].gr := Rect;
        Mes[4].sMesclado := Conteudo;
      end;

      if (ARow = 5) then
      begin
        r.Left := Mes[4].gr.Left;
        r.Top := Mes[4].gr.Top;
        r.Bottom := Rect.Bottom;
        r.Right := Mes[4].gr.Right;

        sgTARV.Canvas.Font.Style:=[fsbold];
        sgTARV.Canvas.FillRect(r);
        t := sgTARV.Canvas.TextWidth(Mes[4].sMesclado);
        x := r.Left + (((r.Right - r.Left)-t)  div 2);
        y := r.Top  - ((r.Top + hf - r.Bottom) div 2);
        sgTARV.Canvas.TextRect(r,x,y,Mes[4].sMesclado);
        //DrawText(sgTARV.Canvas.Handle,Pchar(Mes[4].sMesclado),-1,r,DT_WORDBREAK+DT_CENTER+DT_VCENTER);
        DesenhaBordas(sgTARV.Canvas,r);
      end;

  end;

  //Mesclar: Negrito, Centro, Borda
  if (ACol in [0]) and (ARow in [7,8,9]) then
  begin
      if ARow = 7 then
      begin
        Mes[5].gr := Rect;
        Mes[5].sMesclado := Conteudo;
      end;

      if (ARow = 9) then
      begin
        r.Left := Mes[5].gr.Left;
        r.Top := Mes[5].gr.Top;
        r.Bottom := Rect.Bottom;
        r.Right := Mes[5].gr.Right;

        sgTARV.Canvas.Font.Style:=[fsbold];
        sgTARV.Canvas.FillRect(r);
        t := sgTARV.Canvas.TextWidth(Mes[5].sMesclado);
        x := r.Left + (((r.Right - r.Left)-t)  div 2);
        y := r.Top  - ((r.Top + hf - r.Bottom) div 2);
        sgTARV.Canvas.TextRect(r,x,y,Mes[5].sMesclado);
        //DrawText(sgTARV.Canvas.Handle,Pchar(Mes[5].sMesclado),-1,r,DT_WORDBREAK+DT_CENTER+DT_VCENTER);
        DesenhaBordas(sgTARV.Canvas,r);
      end;
  end;

  //Titulo: Negrito, Centro, Borda
  if ((ACol in [0,1]) and (ARow >1))or
     ((ACol > 2) and (ARow = 1))then
  begin
     if not((ARow in [3,4,5,7,8,9])and(ACol=0)) then
     begin
       r := Rect;
       sgTARV.Canvas.Font.Style := [fsbold];
       sgTARV.Canvas.FillRect(r);
       t := sgTARV.Canvas.TextWidth(Conteudo);
        x := r.Left + (((r.Right - r.Left)-t)  div 2);
       y := r.Top  - ((r.Top + hf - r.Bottom) div 2);
       sgTARV.Canvas.TextRect(r,x,y,Conteudo);
       //DrawText(sgTARV.Canvas.Handle,Pchar(Conteudo),-1,r,DT_WORDBREAK+DT_CENTER+DT_VCENTER);
       DesenhaBordas(sgTARV.Canvas,r);
     end;
  end;


  //Total: Negrito, Centro, Cor
  if ((ARow in [2,5,6,9,11]) and (ACol >1 ))or
     ((ACol in [8]) and (ARow > 1)) then
  begin
     r := Rect;
     sgTARV.Canvas.Brush.Color := cl3DLight;
     sgTARV.Canvas.Font.Style := [fsbold];
     sgTARV.Canvas.FillRect(r);
     t := sgTARV.Canvas.TextWidth(Conteudo);
     x := r.Left + (((r.Right - r.Left)-t)  div 2);
     y := r.Top  - ((r.Top + hf - r.Bottom) div 2);
     sgTARV.Canvas.TextRect(r,x,y,Conteudo);
  end;

end;

procedure TfrmCadTARVACOMP.sgTARVSelectCell(Sender: TObject; ACol, ARow: Integer;
  var CanSelect: Boolean);
begin
  inherited;
  bEdit := (((ARow in [3,4,7,8,10]) and (ACol>1)) and not((ARow>1)and(ACol=8)));

  if (bEdit) and (dsControle.DataSet.State in [dsEdit,dsInsert]) then
    sgTARV.Options := sgTARV.Options + [goEditing]
  else
    sgTARV.Options := sgTARV.Options - [goEditing];
end;

procedure TfrmCadTARVACOMP.sgTARVSetEditText(Sender: TObject; ACol, ARow: Integer;
  const Value: String);
begin
  inherited;
  CalculaToTal;
end;

procedure TfrmCadTARVACOMP.CalculaTotal;
var r,c:integer; tl,tc,tg:real;
begin
  for r:=3 to 10 do
  begin
    if not(r in [2,5,6,9,11]) then
    begin
      tl :=
        (Valor(sgTARV.Cells[2,r]) +
         Valor(sgTARV.Cells[3,r]) +
         Valor(sgTARV.Cells[4,r]))-
        (Valor(sgTARV.Cells[5,r]) +
         Valor(sgTARV.Cells[6,r]) +
         Valor(sgTARV.Cells[7,r]));
      sgTARV.Cells[8,r] := FloatToStr(tl);
    end;
  end;

  for c:=2 to 7 do
  begin
      tc :=
         Valor(sgTARV.Cells[c,3]) +
         Valor(sgTARV.Cells[c,4]);
      sgTARV.Cells[c,5] := FloatToStr(tc);
      tg := tc;

      tc :=
         Valor(sgTARV.Cells[c,7]) +
         Valor(sgTARV.Cells[c,8]);
      sgTARV.Cells[c,9] := FloatToStr(tc);
      tg := tg + tc;

      tg := tg + Valor(sgTARV.Cells[c,10]);
      sgTARV.Cells[c,11] := FloatToStr(tg);
  end;
end;

procedure TfrmCadTARVACOMP.btIncluirClick(Sender: TObject);
begin
  pgGeral.ActivePageIndex := 1;
  dmGeral.TB_TARV_ACOMP.Close;
  dmGeral.TB_TARV_ACOMP.Open;

  inherited;
  leProvincia.Text := '';
  leUnidade.Text := '';
  leMunicipio.Text := '';
  cbMesAno.ItemIndex := -1;
  ckConsolidar.Checked := false;
  bConsolidado := false;
  CriaGrid;
end;

procedure TfrmCadTARVACOMP.btimprimirClick(Sender: TObject);
begin
  frmRelatorioWEB := TfrmRelatorioWEB.Create(application);
  try
    sArq := sPathConsulta+'RelatorioACOMPANHAMENTO'+FormatDateTime('ddmmyyhhnnss',now)+'.xml';
    GeraXML;
    frmRelatorioWEB.relatorio.Navigate(sArq);
    frmRelatorioWEB.ShowModal;
  finally
    frmRelatorioWEB.Free;
    if FileExists(sArq) then
      DeleteFile(sArq);
  end;
end;

procedure TfrmCadTARVACOMP.CriaDataSet;
var r,c:integer; nome,valor:string;
begin
  //Cria Dataset conforme as linhas e colunas da Grid para depois ser usada no Rave
  {for r:=2 to sgTARV.RowCount do
    for c:=2 to sgTARV.ColCount do
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
  ClientDataSet1.FieldByName('PROVINCIA').AsString := leProvincia.Text;
  ClientDataSet1.FieldByName('MUNICIPIO').AsString := leMunicipio.Text;
  ClientDataSet1.FieldByName('UNIDADE').AsString := leUnidade.Text;
  ClientDataSet1.FieldByName('MESANO').AsString := cbMesAno.Text;

  for r:=2 to sgTARV.RowCount do
    for c:=2 to sgTARV.ColCount do
    begin
      nome := 'L'+ IntToStr(r) + 'C' + IntToStr(c);
      if Assigned(ClientDataSet1.FindField(nome)) then
        ClientDataSet1.FieldByName(nome).AsString := sgTARV.Cells[c,r];
    end;

  ClientDataSet1.Post;
end;

procedure TfrmCadTARVACOMP.RvProject1Create(Sender: TObject);
begin
  inherited;
  RvProject1.ProjectFile := sPathLayout +'\RelATV.rav';
end;

function TfrmCadTARVACOMP.ValidaExclusao: boolean;
begin
  try
    if dmGeral.TB_TARV_ACOMP.State in [dsInsert] then
    begin
      //Primeiro deve Excluir, para depois entao incluir todos
      if dmGeral.TB_TARV_ACOMP.State in dsEditModes then
        dmGeral.TB_TARV_ACOMP.Cancel;

      dmGeral.TB_TARV_ACOMP.Close;
    if leUnidade.LookupValue <> '' then
        dmGeral.TB_TARV_ACOMP.ParamByName('CD_UNIDADE').AsInteger := strtoInt(leUnidade.LookupValue);
    if leProvincia.LookupValue <> '' then
        dmGeral.TB_TARV_ACOMP.ParamByName('CD_PROVINCIA').AsInteger := strtoint(leProvincia.LookupValue);
    if leMunicipio.LookupValue <> '' then
        dmGeral.TB_TARV_ACOMP.ParamByName('CD_MUNICIPIO').AsInteger := StrToInt(leMunicipio.LookupValue);
      dmGeral.TB_TARV_ACOMP.ParamByName('VL_MESANO').AsString := cbMesAno.Text;
      dmGeral.TB_TARV_ACOMP.Open;

      dmGeral.TB_TARV_ACOMP.First;
      while not dmGeral.TB_TARV_ACOMP.Eof do
        dmGeral.TB_TARV_ACOMP.Delete;

      Result := true;
    end;

    if dmGeral.TB_TARV_ACOMP.State in [dsEdit] then
    begin
      //Primeiro deve Excluir, para depois entao incluir todos
      if dmGeral.TB_TARV_ACOMP.State in dsEditModes then
        dmGeral.TB_TARV_ACOMP.Cancel;

      dmGeral.TB_TARV_ACOMP.Close;
    if leUnidade.LookupValue <> '' then
        dmGeral.TB_TARV_ACOMP.ParamByName('CD_UNIDADE').AsInteger := Unidade;
    if leProvincia.LookupValue <> '' then
        dmGeral.TB_TARV_ACOMP.ParamByName('CD_PROVINCIA').AsInteger := Provincia;
    if leMunicipio.LookupValue <> '' then
        dmGeral.TB_TARV_ACOMP.ParamByName('CD_MUNICIPIO').AsInteger := Municipio;
      dmGeral.TB_TARV_ACOMP.ParamByName('VL_MESANO').AsString := MesAno;
      dmGeral.TB_TARV_ACOMP.Open;

      dmGeral.TB_TARV_ACOMP.First;
      while not dmGeral.TB_TARV_ACOMP.Eof do
        dmGeral.TB_TARV_ACOMP.Delete;

      Result := true;
    end;

  except
    Result := false;
  end;
end;

procedure TfrmCadTARVACOMP.grDadosDblClick(Sender: TObject);
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

procedure TfrmCadTARVACOMP.btCancelarClick(Sender: TObject);
begin
  if bConsolidado then
  begin
    MessageDlg('Dados em modo de consolidação, não podem ser modificados!',mtInformation,[mbOK],0);
  end
  else
   inherited;

end;

procedure TfrmCadTARVACOMP.bteditarClick(Sender: TObject);
begin
  pgGeral.ActivePageIndex := 1;
  pgGeralChange(sender);

  if bConsolidado then
  begin
    MessageDlg('Dados em modo de consolidação, não podem ser modificados!',mtInformation,[mbOK],0);
  end
  else
  begin
    Unidade := dmGeral.TB_TARV_ACOMPCD_UNIDADE.AsInteger;
    Provincia := dmGeral.TB_TARV_ACOMPCD_PROVINCIA.AsInteger;
    Municipio := dmGeral.TB_TARV_ACOMPCD_MUNICIPIO.AsInteger;
    MesAno := dmGeral.TB_TARV_ACOMPVL_MESANO.AsString;
    inherited;
  end;
end;

procedure TfrmCadTARVACOMP.btLimparClick(Sender: TObject);
begin
  inherited;
  Limpar;

end;

procedure TfrmCadTARVACOMP.ckConsolidarClick(Sender: TObject);
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

procedure TfrmCadTARVACOMP.Limpar;
begin
  inherited;
  leProvincia.Clear;
  leMunicipio.clear;
  leUnidade.clear;
  cbMesAno.Text := '';
  cbAte.Text := '';
end;

procedure TfrmCadTARVACOMP.leProvinciaChange(Sender: TObject);
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

procedure TfrmCadTARVACOMP.leMunicipioChange(Sender: TObject);
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

procedure TfrmCadTARVACOMP.leUnidadeChange(Sender: TObject);
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

procedure TfrmCadTARVACOMP.qyGridCalcFields(DataSet: TDataSet);
var sAux:String;
begin
  inherited;
  sAux := qyGridVL_MESANO.AsString;
  sAux := Copy(sAux,4,4)+Copy(sAux,1,2);
  qyGridNR_MESANO.AsInteger :=  strToInt(sAux);
end;

procedure TfrmCadTARVACOMP.FormDestroy(Sender: TObject);
begin
  inherited;
  dmGeral.TB_TARV_ACOMP.SelectSQL.Text := sSQLTARV;
end;

procedure TfrmCadTARVACOMP.Validar;
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

procedure TfrmCadTARVACOMP.cbMesAnoChange(Sender: TObject);
var texto: string;
begin
  inherited;
  texto := StringReplace(cbMesAno.Text, '/', '', [rfReplaceAll, rfIgnoreCase]);
  if Length(texto) > 2 then
    texto := Copy(texto, 1, 2) + '/' + Copy(texto,3,Length(texto)-2);
  cbMesAno.Text := texto;
  cbMesAno.SelStart := Length(texto);
end;

procedure TfrmCadTARVACOMP.cbMesAnoKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
    if not (Key in ['0'..'9', #8]) then
    Key := #0
end;

procedure TfrmCadTARVACOMP.cbAteChange(Sender: TObject);
var texto: string;
begin
  inherited;
  texto := StringReplace(cbAte.Text, '/', '', [rfReplaceAll, rfIgnoreCase]);
  if Length(texto) > 2 then
    texto := Copy(texto, 1, 2) + '/' + Copy(texto,3,Length(texto)-2);
  cbAte.Text := texto;
  cbAte.SelStart := Length(texto);
end;

procedure TfrmCadTARVACOMP.cbAteKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
    if not (Key in ['0'..'9', #8]) then
    Key := #0
end;

procedure TfrmCadTARVACOMP.sgTARVKeyPress(Sender: TObject; var Key: Char);
begin
    if not (Key in ['0'..'9', #8, #13, #0, #17, #18, #19, #20]) then
      Key := #0
end;

procedure TfrmCadTARVACOMP.cbMesAnoExit(Sender: TObject);
begin
  if ValidarMesAno(cbMesAno.Text) then
    cbMesAno.SetFocus;
end;

procedure TfrmCadTARVACOMP.cbAteExit(Sender: TObject);
begin
  if ValidarMesAno(cbAte.Text) then
    cbAte.SetFocus;
end;

procedure TfrmCadTARVACOMP.leUnidadeButtonClick(Sender: TObject);
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

procedure TfrmCadTARVACOMP.BitBtn2Click(Sender: TObject);
begin
  if (ValidaContraSenha('Liberar Exportação')) then
  begin
    with TIBQuery.Create(nil) do
    begin
      Database := DM.DB;
      SQL.Clear;
      SQL.Add('update "REGISTRO_TARV_ACOMP" set DT_EXP = NULL, DT_ALTERACAO = ''NOW'', DT_REGISTRO = ''NOW'' '+
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





