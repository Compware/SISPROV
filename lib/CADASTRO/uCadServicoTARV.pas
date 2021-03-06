unit uCadServicoTARV;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UfrmCadPadSG, dxExEdtr, RpRave, RpBase, RpSystem, RpDefine, RpCon,
  RpConDS, DBClient, DB, IBCustomDataSet, IBQuery, DBGrids, Grids,
  dxCntner, dxEditor, dxEdLib, StdCtrls, RxLookup, dxTL, dxDBCtrl,
  dxDBGrid, ComCtrls, Buttons, ExtCtrls, ib_parse, UfrmCadPad, Mask,
  ToolEdit, Menus;

type
  TfrmCadServicosTARV = class(TfrmCadPadSG)
    Panel5: TPanel;
    Label21: TLabel;
    Label20: TLabel;
    Label1: TLabel;
    lbPeriodo: TLabel;
    lbDe: TLabel;
    lbAte: TLabel;
    btConsultar: TBitBtn;
    cbAno: TdxPickEdit;
    cbAte: TdxPickEdit;
    sgServicosTARV: TStringGrid;
    DBGrid1: TDBGrid;
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
    qyServicosTARV: TIBQuery;
    qyGrid: TIBQuery;
    qyGridCHAVE: TIBStringField;
    qyGridCD_MUNICIPIO: TIntegerField;
    qyGridCD_PROVINCIA: TIntegerField;
    qyGridCD_UNIDADE: TIntegerField;
    qyGridDS_UNIDADE: TIBStringField;
    qyGridDS_MUNICIPIO: TIBStringField;
    qyGridDS_PROVINCIA: TIBStringField;
    grDadosCHAVE: TdxDBGridMaskColumn;
    grDadosCD_MUNICIPIO: TdxDBGridMaskColumn;
    grDadosCD_PROVINCIA: TdxDBGridMaskColumn;
    grDadosCD_UNIDADE: TdxDBGridMaskColumn;
    grDadosDS_UNIDADE: TdxDBGridMaskColumn;
    grDadosDS_MUNICIPIO: TdxDBGridMaskColumn;
    grDadosDS_PROVINCIA: TdxDBGridMaskColumn;
    ckConsolidar: TCheckBox;
    btLimpar: TBitBtn;
    leProvincia: TRxLookupEdit;
    leMunicipio: TRxLookupEdit;
    leUnidade: TRxLookupEdit;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure sgServicosTARVDrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure FormCreate(Sender: TObject);
    procedure btIncluirClick(Sender: TObject);
    procedure sgServicosTARVSelectCell(Sender: TObject;
  ACol, ARow: Integer; var CanSelect: Boolean);
    procedure btgravarClick(Sender: TObject);
    procedure sgServicosTARVSetEditText(Sender: TObject; ACol,
      ARow: Integer; const Value: String);
    procedure pgGeralChange(Sender: TObject);
    procedure btConsultarClick(Sender: TObject);
    procedure grDadosDblClick(Sender: TObject);
    procedure leProvinciaChange(Sender: TObject);
    procedure leMunicipioChange(Sender: TObject);
    procedure leUnidadeChange(Sender: TObject);
    procedure ckConsolidarClick(Sender: TObject);
    procedure cbAnoChange(Sender: TObject);
    procedure btexcluirClick(Sender: TObject);
    procedure btCancelarClick(Sender: TObject);
    procedure btLimparClick(Sender: TObject);
    procedure bteditarClick(Sender: TObject);
    procedure btimprimirClick(Sender: TObject);
  private
    { Private declarations }
    bCarregaGrid :Boolean;
  public
    { Public declarations }
    procedure GeraXML;
    procedure CriaGrid; override;
    procedure CarregaComboAno;
    function ValidaExclusao: boolean;
    procedure Varregrid;
    procedure AbreConsultas;
    procedure FechaConsultas;
    procedure CalculaTotal;
    procedure CarregaGrid(TB_SERVICOS_TARV:TDataSet);
    procedure Limpar; override;
  end;

type
  TMes = Record
    gr:TRect;
    sMesclado:String;
end;

var
  frmCadServicosTARV: TfrmCadServicosTARV;

  bMesclando, bEdit, bConsolidado:Boolean;
  Mes:array[0..7] of TMes;
  sArq, sSQLServicosTARV:string;
  Unidade, Provincia, Municipio:Integer;
  Ano:String;
  PSQL, MSQL, USQL:string;


implementation

uses UDMGERAL, UDM, DateUtils, Ugeral, uRelatorioWEB;

{$R *.dfm}

procedure TfrmCadServicosTARV.GeraXML;
var sXML:TStringList;

  procedure GridXML(sg:TStringGrid);
  var r,c:integer; nome,valor:string;
  begin
    for r:=2 to sg.RowCount do
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
      sXML.Add('<?xml-stylesheet type="text/xsl" href="SERVICOSTARV.xslt"?>');
      sXML.Add('<Programa>');
      sXML.Add('  <Parametros>');
      sXML.Add('    <MUNICIPIO>'+leMunicipio.Text+'</MUNICIPIO>');
      sXML.Add('    <PROVINCIA>'+LEProvincia.Text+'</PROVINCIA>');
      sXML.Add('    <UNIDADE>'+LEUnidade.Text+'</UNIDADE>');
      sXML.Add('  </Parametros>');
      sXML.Add('  <Dados>');

      GridXML(sgServicosTARV);

      sXML.Add('  </Dados>');
      sXML.Add(' </Programa>');

      sXML.SaveToFile(sArq);
   finally
      FreeAndNil(sXML);
   end;
end;
procedure TfrmCadServicosTARV.CarregaComboAno;
var data:TDate; i:integer;
begin
  data := dm.GetDateTime;
  cbAno.Items.Add(FormatDateTime('yyyy',data));
  cbAte.Items.Add(FormatDateTime('yyyy',data));
  for i:= 1 to 9 do
  begin
    cbAno.Items.Add(FormatDateTime('yyyy',IncYear(data,-i)));
    cbAte.Items.Add(FormatDateTime('yyyy',IncYear(data,-i)));
  end;
end;

procedure TfrmCadServicosTARV.CriaGrid;
var r,c:integer;  data:TDateTime; i,iDe,iAte, calc:integer;
begin
  for r:=0 to 12 do
   for c:=0 to 18 do
     sgServicosTARV.Cells[c,r] := '';

  sgServicosTARV.RowCount := 13;
  sgServicosTARV.ColCount := 20;
  sgServicosTARV.FixedCols := 1;
  sgServicosTARV.FixedRows := 2;
  sgServicosTARV.Cells[0,0]  := 'Ano';
  sgServicosTARV.Cells[1,0]  := '<18m';
  sgServicosTARV.Cells[3,0]  := '>18m � 4a';
  sgServicosTARV.Cells[5,0]  := '5 � 14a';
  sgServicosTARV.Cells[7,0]  := '15 � 19a';
  sgServicosTARV.Cells[9,0]  := '20 � 29a';
  sgServicosTARV.Cells[11,0]  := '30 � 39a';
  sgServicosTARV.Cells[13,0]  := '40 � 49a';
  sgServicosTARV.Cells[15,0]  := '50 � 59a';
  sgServicosTARV.Cells[17,0]  := '>60a';
  sgServicosTARV.Cells[19,0]  := 'Total';

  sgServicosTARV.Cells[1,1]  := 'F';
  sgServicosTARV.Cells[2,1]  := 'M';
  sgServicosTARV.Cells[3,1]  := 'F';
  sgServicosTARV.Cells[4,1]  := 'M';
  sgServicosTARV.Cells[5,1]  := 'F';
  sgServicosTARV.Cells[6,1]  := 'M';
  sgServicosTARV.Cells[7,1]  := 'F';
  sgServicosTARV.Cells[8,1]  := 'M';
  sgServicosTARV.Cells[9,1]  := 'F';
  sgServicosTARV.Cells[10,1]  := 'M';
  sgServicosTARV.Cells[11,1]  := 'F';
  sgServicosTARV.Cells[12,1]  := 'M';
  sgServicosTARV.Cells[13,1]  := 'F';
  sgServicosTARV.Cells[14,1]  := 'M';
  sgServicosTARV.Cells[15,1]  := 'F';
  sgServicosTARV.Cells[16,1]  := 'M';
  sgServicosTARV.Cells[17,1]  := 'F';
  sgServicosTARV.Cells[18,1]  := 'M';

 sgServicosTARV.Cells[0,12] := 'Total';

  sgServicosTARV.DefaultColWidth := 40;
  sgServicosTARV.DefaultRowHeight := 22;
  sgServicosTARV.RowHeights[1] := 22;
  sgServicosTARV.ColWidths[0] := 60;





  data := dm.GetDateTime;
  iAte := StrToInt(FormatDateTime('yyyy',data));
  iDe := (iAte - 9);

  calc := 1;
  for i:= iDe to iAte do
  begin
    sgServicosTARV.Cells[0,(calc + 1)]  := IntToStr(i);
    calc := calc + 1;
  end;
  sgServicosTARV.Repaint;
end;

function TfrmCadServicosTARV.ValidaExclusao: boolean;
begin
  try
    if dmGeral.TB_SERVICOS_TARV.State in [dsInsert] then
    begin
      //Primeiro deve Excluir, para depois entao incluir todos
      if dmGeral.TB_SERVICOS_TARV.State in dsEditModes then
        dmGeral.TB_SERVICOS_TARV.Cancel;

      dmGeral.TB_SERVICOS_TARV.Close;

      if leUnidade.lookupValue <> '' then
        dmGeral.TB_SERVICOS_TARV.ParamByName('CD_UNIDADE').AsInteger := strtoint(leUnidade.lookupValue);
      if leProvincia.lookupValue <> '' then
        dmGeral.TB_SERVICOS_TARV.ParamByName('CD_PROVINCIA').AsInteger := strtoint(leProvincia.lookupValue);
      if leMunicipio.lookupValue <> '' then
        dmGeral.TB_SERVICOS_TARV.ParamByName('CD_MUNICIPIO').AsInteger := strtoint(leMunicipio.lookupValue);
      //dmGeral.TB_SERVICOS_TARV.ParamByName('VL_ANO').AsString := cbAno.Text;
      dmGeral.TB_SERVICOS_TARV.Open;

      dmGeral.TB_SERVICOS_TARV.First;
      while not dmGeral.TB_SERVICOS_TARV.Eof do
        dmGeral.TB_SERVICOS_TARV.Delete;

      Result := true;
    end;

    if dmGeral.TB_SERVICOS_TARV.State in [dsEdit] then
    begin
      //Primeiro deve Excluir, para depois entao incluir todos
      if dmGeral.TB_SERVICOS_TARV.State in dsEditModes then
        dmGeral.TB_SERVICOS_TARV.Cancel;

      dmGeral.TB_SERVICOS_TARV.Close;
      if leUnidade.lookupValue <> '' then
        dmGeral.TB_SERVICOS_TARV.ParamByName('CD_UNIDADE').AsInteger := Unidade;
      if leProvincia.lookupValue <> '' then
        dmGeral.TB_SERVICOS_TARV.ParamByName('CD_PROVINCIA').AsInteger := Provincia;
      if leMunicipio.lookupValue <> '' then
        dmGeral.TB_SERVICOS_TARV.ParamByName('CD_MUNICIPIO').AsInteger := Municipio;
      //dmGeral.TB_SERVICOS_TARV.ParamByName('VL_ANO').AsString := Ano;
      dmGeral.TB_SERVICOS_TARV.Open;

      dmGeral.TB_SERVICOS_TARV.First;
      while not dmGeral.TB_SERVICOS_TARV.Eof do
        dmGeral.TB_SERVICOS_TARV.Delete;

      Result := true;
    end;

  except
    Result := false;
  end;
end;

procedure TfrmCadServicosTARV.Varregrid;
var i:integer;
    cdUnidade, cdProvincia, cdMunicipio:Integer;
    sAno:String;
begin
  if (leProvincia.lookupValue = '') then
  begin
    MessageDlg('� necess�rio informar Provincia!',mtInformation,[mbOK],0);
    leProvincia.SetFocus;
    Abort;
  end;

  if (leMunicipio.lookupValue = '') then
  begin
    if MessageDlg('O Municipio n�o foi informada, '#13#10'deseja continuar?',mtConfirmation,
        [mbYes,mbNo],0) = mrNo then
      begin
        leMunicipio.SetFocus;
        Abort;
      end;
  end;

  if (leUnidade.lookupValue = '') then
  begin
    if MessageDlg('A Unidade n�o foi informada, '#13#10'deseja continuar?',mtConfirmation,
        [mbYes,mbNo],0) = mrNo then
      begin
        leUnidade.SetFocus;
        Abort;
      end;
  end;
{
  if (cbAno.ItemIndex = -1) then
  begin
    MessageDlg('� necess�rio informar Ano!',mtInformation,[mbOK],0);
    cbAno.SetFocus;
    Abort;
  end;
}

  cdProvincia := strtoint(leProvincia.lookupValue);
  sAno := cbAno.Text;

  if leMunicipio.Text <> '' then
    cdMunicipio := strtoint(leMunicipio.lookupValue);

  if leUnidade.Text <> '' then
    cdUnidade := strtoint(leUnidade.lookupValue);

  for i:=2 to 11 do
  begin
    //if (sgServicosTARV.Cells[0,i] = cbAno.text ) then
      Begin
         begin
           if not (dmGeral.TB_SERVICOS_TARV.State in [dsEdit,dsInsert]) then
             dmGeral.TB_SERVICOS_TARV.Insert;

           if cdUnidade <> null then
             dmGeral.TB_SERVICOS_TARVCD_UNIDADE.AsInteger := cdUnidade;

           dmGeral.TB_SERVICOS_TARVCD_PROVINCIA.AsInteger := cdProvincia;

           if cdMunicipio <> null then
             dmGeral.TB_SERVICOS_TARVCD_MUNICIPIO.AsInteger := cdMunicipio;

           sAno := sgServicosTARV.Cells[0,i];
           dmGeral.TB_SERVICOS_TARVVL_ANO.AsString := sAno;
           dmGeral.TB_SERVICOS_TARVVL_Y.AsInteger := i;
           dmGeral.TB_SERVICOS_TARVDT_REGISTRO.AsDateTime := dm.GetDateTime;

         dmGeral.TB_SERVICOS_TARVVL_F_18.AsString := sgServicosTARV.Cells[1,i];
         dmGeral.TB_SERVICOS_TARVVL_M_18.AsString := sgServicosTARV.Cells[2,i];
         dmGeral.TB_SERVICOS_TARVVL_F_18X4.AsString := sgServicosTARV.Cells[3,i];
         dmGeral.TB_SERVICOS_TARVVL_M_18X4.AsString := sgServicosTARV.Cells[4,i];
         dmGeral.TB_SERVICOS_TARVVL_F_5X14.AsString := sgServicosTARV.Cells[5,i];
         dmGeral.TB_SERVICOS_TARVVL_M_5X14.AsString := sgServicosTARV.Cells[6,i];
         dmGeral.TB_SERVICOS_TARVVL_F_15X19.AsString := sgServicosTARV.Cells[7,i];
         dmGeral.TB_SERVICOS_TARVVL_M_15X19.AsString := sgServicosTARV.Cells[8,i];
         dmGeral.TB_SERVICOS_TARVVL_F_20X29.AsString := sgServicosTARV.Cells[9,i];
         dmGeral.TB_SERVICOS_TARVVL_M_20x29.AsString := sgServicosTARV.Cells[10,i];
         dmGeral.TB_SERVICOS_TARVVL_F_30x39.AsString := sgServicosTARV.Cells[11,i];
         dmGeral.TB_SERVICOS_TARVVL_M_30x99.AsString := sgServicosTARV.Cells[12,i];
         dmGeral.TB_SERVICOS_TARVVL_F_40x49.AsString := sgServicosTARV.Cells[13,i];
         dmGeral.TB_SERVICOS_TARVVL_M_40x49.AsString := sgServicosTARV.Cells[14,i];
         dmGeral.TB_SERVICOS_TARVVL_F_50x59.AsString := sgServicosTARV.Cells[15,i];
         dmGeral.TB_SERVICOS_TARVVL_M_50x59.AsString := sgServicosTARV.Cells[16,i];
         dmGeral.TB_SERVICOS_TARVVL_F_60.AsString := sgServicosTARV.Cells[17,i];
         dmGeral.TB_SERVICOS_TARVVL_M_60.AsString := sgServicosTARV.Cells[18,i];

           dmGeral.TB_SERVICOS_TARV.Post;
         end;
       end;
  end;
end;

procedure TfrmCadServicosTARV.AbreConsultas;
begin
  PSQL := qyProvincia.sql.text;
  MSQL := qyMunicipio.sql.text;
  USQL := qyUnidade.sql.text;
  qyProvincia.Open;
  qyMunicipio.Open;
  qyUnidade.Open;
end;

procedure TfrmCadServicosTARV.FechaConsultas;
begin
  qyProvincia.Close;
  qyMunicipio.Close;
  qyUnidade.Close;
end;

procedure TfrmCadServicosTARV.CalculaTotal;
var l,r,c:integer; tl,tc,tg:real;
begin
  for c:=1 to 18 do
  begin
      tc :=
         Valor(sgServicosTARV.Cells[c,2]) +
         Valor(sgServicosTARV.Cells[c,3]) +
         Valor(sgServicosTARV.Cells[c,4]) +
         Valor(sgServicosTARV.Cells[c,5]) +
         Valor(sgServicosTARV.Cells[c,6]) +
         Valor(sgServicosTARV.Cells[c,7]) +
         Valor(sgServicosTARV.Cells[c,8]) +
         Valor(sgServicosTARV.Cells[c,9]) +
         Valor(sgServicosTARV.Cells[c,10])+
		 Valor(sgServicosTARV.Cells[c,11]);
      sgServicosTARV.Cells[c,12] := FloatToStr(tc);
      tg := tc;
  end;
  for l:=2 to 12 do
  begin
      tc:=0;
      for c:=1 to 18 do
        tc := tc+ Valor(sgServicosTARV.Cells[c,l]);
      sgServicosTARV.Cells[19,l] := FloatToStr(tc);
      tg := tc;
  end;
end;

procedure TfrmCadServicosTARV.CarregaGrid(TB_SERVICOS_TARV:TDataSet);
var rAux:real; y:integer;
begin
    CriaGrid;
    dmGeral.TB_SERVICOS_TARV.First;
    while Not dmGeral.TB_SERVICOS_TARV.Eof do
    begin
      //raux := valor(sgServicosTARV.Cells[0,dmGeral.TB_SERVICOS_TARVVL_Y.AsInteger]) +
      //        valor(dmGeral.TB_SERVICOS_TARVVL_ANO.AsString);
      //sgServicosTARV.Cells[0,dmGeral.TB_SERVICOS_TARVVL_Y.AsInteger] := floattostr(raux);
     y := sgServicosTARV.Cols[0].IndexOf(dmGeral.TB_SERVICOS_TARVVL_ANO.AsString);
      raux := valor(sgServicosTARV.Cells[1,Y]) +
              valor(DMGERAL.TB_SERVICOS_TARVVL_F_18.AsString);
      sgServicosTARV.Cells[1,Y] := floattostr(raux);

      raux := valor(sgServicosTARV.Cells[2,Y]) +
              valor(DMGERAL.TB_SERVICOS_TARVVL_M_18.AsString);
      sgServicosTARV.Cells[2,Y] := floattostr(raux);

      raux := valor(sgServicosTARV.Cells[3,Y]) +
              valor(DMGERAL.TB_SERVICOS_TARVVL_F_18X4.AsString);
      sgServicosTARV.Cells[3,Y] := floattostr(raux);

      raux := valor(sgServicosTARV.Cells[4,Y]) +
              valor(DMGERAL.TB_SERVICOS_TARVVL_M_18X4.AsString);
      sgServicosTARV.Cells[4,Y] := floattostr(raux);

      raux := valor(sgServicosTARV.Cells[5,Y]) +
              valor(DMGERAL.TB_SERVICOS_TARVVL_F_5X14.AsString);
      sgServicosTARV.Cells[5,Y] := floattostr(raux);

      raux := valor(sgServicosTARV.Cells[6,Y]) +
              valor(DMGERAL.TB_SERVICOS_TARVVL_M_5X14.AsString);
      sgServicosTARV.Cells[6,Y] := floattostr(raux);

      raux := valor(sgServicosTARV.Cells[7,Y]) +
              valor(DMGERAL.TB_SERVICOS_TARVVL_F_15X19.AsString);
      sgServicosTARV.Cells[7,Y] := floattostr(raux);

      raux := valor(sgServicosTARV.Cells[8,Y]) +
              valor(DMGERAL.TB_SERVICOS_TARVVL_M_15X19.AsString);
      sgServicosTARV.Cells[8,Y] := floattostr(raux);

      raux := valor(sgServicosTARV.Cells[9,Y]) +
              valor(DMGERAL.TB_SERVICOS_TARVVL_F_20X29.AsString);
      sgServicosTARV.Cells[9,Y] := floattostr(raux);

      raux := valor(sgServicosTARV.Cells[10,Y]) +
              valor(DMGERAL.TB_SERVICOS_TARVVL_M_20x29.AsString);
      sgServicosTARV.Cells[10,Y] := floattostr(raux);

      raux := valor(sgServicosTARV.Cells[11,Y]) +
              valor(DMGERAL.TB_SERVICOS_TARVVL_F_30x39.AsString);
      sgServicosTARV.Cells[11,Y] := floattostr(raux);

      raux := valor(sgServicosTARV.Cells[12,Y]) +
              valor(DMGERAL.TB_SERVICOS_TARVVL_M_30x99.AsString);
      sgServicosTARV.Cells[12,Y] := floattostr(raux);

      raux := valor(sgServicosTARV.Cells[13,Y]) +
              valor(DMGERAL.TB_SERVICOS_TARVVL_F_40x49.AsString);
      sgServicosTARV.Cells[13,Y] := floattostr(raux);

      raux := valor(sgServicosTARV.Cells[14,Y]) +
              valor(DMGERAL.TB_SERVICOS_TARVVL_M_40x49.AsString);
      sgServicosTARV.Cells[14,Y] := floattostr(raux);

      raux := valor(sgServicosTARV.Cells[15,Y]) +
              valor(DMGERAL.TB_SERVICOS_TARVVL_F_50x59.AsString);
      sgServicosTARV.Cells[15,Y] := floattostr(raux);

      raux := valor(sgServicosTARV.Cells[16,Y]) +
              valor(DMGERAL.TB_SERVICOS_TARVVL_M_50x59.AsString);
      sgServicosTARV.Cells[16,Y] := floattostr(raux);

      raux := valor(sgServicosTARV.Cells[17,Y]) +
              valor(DMGERAL.TB_SERVICOS_TARVVL_F_60.AsString);
      sgServicosTARV.Cells[17,Y] := floattostr(raux);

      raux := valor(sgServicosTARV.Cells[18,Y]) +
              valor(DMGERAL.TB_SERVICOS_TARVVL_M_60.AsString);
      sgServicosTARV.Cells[18,Y] := floattostr(raux);


      dmGeral.TB_SERVICOS_TARV.Next;
    end;

    sgServicosTARV.Repaint;
    CalculaTotal;

end;

procedure TfrmCadServicosTARV.FormShow(Sender: TObject);
begin
  inherited;
  qyGrid.Open;
  CriaGrid;
  pgGeral.ActivePageIndex := 1;
end;

procedure TfrmCadServicosTARV.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  FechaConsultas;
  dmGeral.TB_SERVICOS_TARV.SelectSQL.Text := sSQLServicosTARV;

end;

procedure TfrmCadServicosTARV.sgServicosTARVDrawCell(Sender: TObject; ACol,
  ARow: Integer; Rect: TRect; State: TGridDrawState);
var Conteudo:String; x,y,hf,hw,t,calc,i:integer; c:TColor;   r:TRect;
begin
  inherited;
  Conteudo := sgServicosTARV.Cells[ACol,ARow];
  hf := sgServicosTARV.Canvas.TextHeight('Lj');
  //SetTextAlign(sgServicosTARV.Canvas.Handle, TA_CENTER);

  //Mesclar: Negrito, Centro, Borda
  if (ARow = 0) and (ACol > 0) then
  begin
      //-----MESCLAGEM 1 LINHA 1--------------------------------------------------
      if ACol = 1 then
      begin
        Mes[4].gr := Rect; Mes[4].sMesclado := Conteudo;
      end;
      if (ACol = 2) then
      begin
        r.Left := Mes[4].gr.Left;  r.Top := Mes[4].gr.Top;
        r.Bottom := Mes[4].gr.Bottom;   r.Right := Rect.Right;
        sgServicosTARV.Canvas.Font.Style:=[fsbold]; sgServicosTARV.Canvas.FillRect(r);
        t := sgServicosTARV.Canvas.TextWidth(Mes[4].sMesclado);  x := r.Left + (((r.Right - r.Left)-t)  div 2);
        y := r.Top  - ((r.Top + hf - r.Bottom) div 2);   sgServicosTARV.Canvas.TextRect(r,x,y,Mes[4].sMesclado);
        DesenhaBordas(sgServicosTARV.Canvas,r);
      end;

      //-----MESCLAGEM 1 LINHA 2--------------------------------------------------
      if ACol = 3 then
      begin
        Mes[4].gr := Rect; Mes[4].sMesclado := Conteudo;
      end;
      if (ACol = 4) then
      begin
        r.Left := Mes[4].gr.Left;  r.Top := Mes[4].gr.Top;
        r.Bottom := Mes[4].gr.Bottom;   r.Right := Rect.Right;
        sgServicosTARV.Canvas.Font.Style:=[fsbold]; sgServicosTARV.Canvas.FillRect(r);
        t := sgServicosTARV.Canvas.TextWidth(Mes[4].sMesclado);  x := r.Left + (((r.Right - r.Left)-t)  div 2);
        y := r.Top  - ((r.Top + hf - r.Bottom) div 2);   sgServicosTARV.Canvas.TextRect(r,x,y,Mes[4].sMesclado);
        DesenhaBordas(sgServicosTARV.Canvas,r);
      end;
      //-----MESCLAGEM 1 LINHA 3--------------------------------------------------
      if ACol = 5 then
      begin
        Mes[4].gr := Rect; Mes[4].sMesclado := Conteudo;
      end;
      if (ACol = 6) then
      begin
        r.Left := Mes[4].gr.Left;  r.Top := Mes[4].gr.Top;
        r.Bottom := Mes[4].gr.Bottom;   r.Right := Rect.Right;
        sgServicosTARV.Canvas.Font.Style:=[fsbold]; sgServicosTARV.Canvas.FillRect(r);
        t := sgServicosTARV.Canvas.TextWidth(Mes[4].sMesclado);  x := r.Left + (((r.Right - r.Left)-t)  div 2);
        y := r.Top  - ((r.Top + hf - r.Bottom) div 2);   sgServicosTARV.Canvas.TextRect(r,x,y,Mes[4].sMesclado);
        DesenhaBordas(sgServicosTARV.Canvas,r);
      end;
      //-----MESCLAGEM 1 LINHA 4--------------------------------------------------
      if ACol = 7 then
      begin
        Mes[4].gr := Rect; Mes[4].sMesclado := Conteudo;
      end;
      if (ACol = 8) then
      begin
        r.Left := Mes[4].gr.Left;  r.Top := Mes[4].gr.Top;
        r.Bottom := Mes[4].gr.Bottom;   r.Right := Rect.Right;
        sgServicosTARV.Canvas.Font.Style:=[fsbold]; sgServicosTARV.Canvas.FillRect(r);
        t := sgServicosTARV.Canvas.TextWidth(Mes[4].sMesclado);  x := r.Left + (((r.Right - r.Left)-t)  div 2);
        y := r.Top  - ((r.Top + hf - r.Bottom) div 2);   sgServicosTARV.Canvas.TextRect(r,x,y,Mes[4].sMesclado);
        DesenhaBordas(sgServicosTARV.Canvas,r);
      end;
      //-----MESCLAGEM 1 LINHA 5--------------------------------------------------
      if ACol = 9 then
      begin
        Mes[4].gr := Rect; Mes[4].sMesclado := Conteudo;
      end;
      if (ACol = 10) then
      begin
        r.Left := Mes[4].gr.Left;  r.Top := Mes[4].gr.Top;
        r.Bottom := Mes[4].gr.Bottom;   r.Right := Rect.Right;
        sgServicosTARV.Canvas.Font.Style:=[fsbold]; sgServicosTARV.Canvas.FillRect(r);
        t := sgServicosTARV.Canvas.TextWidth(Mes[4].sMesclado);  x := r.Left + (((r.Right - r.Left)-t)  div 2);
        y := r.Top  - ((r.Top + hf - r.Bottom) div 2);   sgServicosTARV.Canvas.TextRect(r,x,y,Mes[4].sMesclado);
        DesenhaBordas(sgServicosTARV.Canvas,r);
      end;
      //-----MESCLAGEM 1 LINHA 6--------------------------------------------------
      if ACol = 11 then
      begin
        Mes[4].gr := Rect; Mes[4].sMesclado := Conteudo;
      end;
      if (ACol = 12) then
      begin
        r.Left := Mes[4].gr.Left;  r.Top := Mes[4].gr.Top;
        r.Bottom := Mes[4].gr.Bottom;   r.Right := Rect.Right;
        sgServicosTARV.Canvas.Font.Style:=[fsbold]; sgServicosTARV.Canvas.FillRect(r);
        t := sgServicosTARV.Canvas.TextWidth(Mes[4].sMesclado);  x := r.Left + (((r.Right - r.Left)-t)  div 2);
        y := r.Top  - ((r.Top + hf - r.Bottom) div 2);   sgServicosTARV.Canvas.TextRect(r,x,y,Mes[4].sMesclado);
        DesenhaBordas(sgServicosTARV.Canvas,r);
      end;
      //-----MESCLAGEM 1 LINHA 7--------------------------------------------------
      if ACol = 13 then
      begin
        Mes[4].gr := Rect; Mes[4].sMesclado := Conteudo;
      end;
      if (ACol = 14) then
      begin
        r.Left := Mes[4].gr.Left;  r.Top := Mes[4].gr.Top;
        r.Bottom := Mes[4].gr.Bottom;   r.Right := Rect.Right;
        sgServicosTARV.Canvas.Font.Style:=[fsbold]; sgServicosTARV.Canvas.FillRect(r);
        t := sgServicosTARV.Canvas.TextWidth(Mes[4].sMesclado);  x := r.Left + (((r.Right - r.Left)-t)  div 2);
        y := r.Top  - ((r.Top + hf - r.Bottom) div 2);   sgServicosTARV.Canvas.TextRect(r,x,y,Mes[4].sMesclado);
        DesenhaBordas(sgServicosTARV.Canvas,r);
      end;
      //-----MESCLAGEM 1 LINHA 7--------------------------------------------------
      if ACol = 15 then
      begin
        Mes[4].gr := Rect; Mes[4].sMesclado := Conteudo;
      end;
      if (ACol = 16) then
      begin
        r.Left := Mes[4].gr.Left;  r.Top := Mes[4].gr.Top;
        r.Bottom := Mes[4].gr.Bottom;   r.Right := Rect.Right;
        sgServicosTARV.Canvas.Font.Style:=[fsbold]; sgServicosTARV.Canvas.FillRect(r);
        t := sgServicosTARV.Canvas.TextWidth(Mes[4].sMesclado);  x := r.Left + (((r.Right - r.Left)-t)  div 2);
        y := r.Top  - ((r.Top + hf - r.Bottom) div 2);   sgServicosTARV.Canvas.TextRect(r,x,y,Mes[4].sMesclado);
        DesenhaBordas(sgServicosTARV.Canvas,r);
      end;
      //-----MESCLAGEM 1 LINHA 8--------------------------------------------------
      if ACol = 17 then
      begin
        Mes[4].gr := Rect; Mes[4].sMesclado := Conteudo;
      end;
      if (ACol = 18) then
      begin
        r.Left := Mes[4].gr.Left;  r.Top := Mes[4].gr.Top;
        r.Bottom := Mes[4].gr.Bottom;   r.Right := Rect.Right;
        sgServicosTARV.Canvas.Font.Style:=[fsbold]; sgServicosTARV.Canvas.FillRect(r);
        t := sgServicosTARV.Canvas.TextWidth(Mes[4].sMesclado);  x := r.Left + (((r.Right - r.Left)-t)  div 2);
        y := r.Top  - ((r.Top + hf - r.Bottom) div 2);   sgServicosTARV.Canvas.TextRect(r,x,y,Mes[4].sMesclado);
        DesenhaBordas(sgServicosTARV.Canvas,r);
      end;
      //-----MESCLAGEM 1 LINHA 9 TOTAL--------------------------------------------------
      if ACol = 19 then
      begin
        Mes[4].gr := Rect; Mes[4].sMesclado := Conteudo;
      end;
      if (ACol = 19) then
      begin
        r.Left := Mes[4].gr.Left;  r.Top := Mes[4].gr.Top;
        r.Bottom := Mes[4].gr.Bottom;   r.Right := Rect.Right;
        sgServicosTARV.Canvas.Font.Style:=[fsbold]; sgServicosTARV.Canvas.FillRect(r);
        t := sgServicosTARV.Canvas.TextWidth(Mes[4].sMesclado);  x := r.Left + (((r.Right - r.Left)-t)  div 2);
        y := r.Top  - ((r.Top + hf - r.Bottom) div 2);   sgServicosTARV.Canvas.TextRect(r,x,y,Mes[4].sMesclado);
        DesenhaBordas(sgServicosTARV.Canvas,r);
      end;
    {  //-----MESCLAGEM 1 LINHA 10 --------------------------------------------------
      if ACol = 19 then
      begin
        Mes[4].gr := Rect; Mes[4].sMesclado := Conteudo;
      end;
      if (ACol = 19) then
      begin
        r.Left := Mes[4].gr.Left;  r.Top := Mes[4].gr.Top;
        r.Bottom := Mes[4].gr.Bottom;   r.Right := Rect.Right;
        sgServicosTARV.Canvas.Font.Style:=[fsbold]; sgServicosTARV.Canvas.FillRect(r);
        t := sgServicosTARV.Canvas.TextWidth(Mes[4].sMesclado);  x := r.Left + (((r.Right - r.Left)-t)  div 2);
        y := r.Top  - ((r.Top + hf - r.Bottom) div 2);   sgServicosTARV.Canvas.TextRect(r,x,y,Mes[4].sMesclado);
        DesenhaBordas(sgServicosTARV.Canvas,r);
      end;                                        }


  end;


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

        sgServicosTARV.Canvas.Font.Style:=[fsbold];
        sgServicosTARV.Canvas.FillRect(r);
        t := sgServicosTARV.Canvas.TextWidth(Mes[1].sMesclado);
        x := r.Left + (((r.Right - r.Left)-t)  div 2);
        y := r.Top  - ((r.Top + hf - r.Bottom) div 2);
        sgServicosTARV.Canvas.TextRect(r,x,y,Mes[1].sMesclado);

        //DrawText(sgServicosTARV.Canvas.Handle,Pchar(Mes[1].sMesclado),-1,r,DT_WORDBREAK+DT_CENTER+DT_VCENTER);
        DesenhaBordas(sgServicosTARV.Canvas,r);
      end;
  end;


{  //Mesclar: Negrito, Centro, Borda
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

        sgServicosTARV.Canvas.Font.Style:=[fsbold];
        sgServicosTARV.Canvas.FillRect(r);
        t := sgServicosTARV.Canvas.TextWidth(Mes[2].sMesclado);
        x := r.Left + (((r.Right - r.Left)-t)  div 2);
        y := r.Top  - ((r.Top + hf - r.Bottom) div 2);
        sgServicosTARV.Canvas.TextRect(r,x,y,Mes[2].sMesclado);
        //DrawText(sgServicosTARV.Canvas.Handle,Pchar(Mes[2].sMesclado),-1,r,DT_WORDBREAK+DT_CENTER+DT_VCENTER);
        DesenhaBordas(sgServicosTARV.Canvas,r);
      end;
  end;


 }
{  //Mesclar: Negrito, Centro, Borda
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

        sgServicosTARV.Canvas.Font.Style:=[fsbold];
        sgServicosTARV.Canvas.FillRect(r);
        t := sgServicosTARV.Canvas.TextWidth(Mes[5].sMesclado);
        x := r.Left + (((r.Right - r.Left)-t)  div 2);
        y := r.Top  - ((r.Top + hf - r.Bottom) div 2);
        sgServicosTARV.Canvas.TextRect(r,x,y,Mes[5].sMesclado);
        //
        DesenhaBordas(sgServicosTARV.Canvas,r);
      end;
  end;      }

  //Titulo: Negrito, Centro, Borda
  if ((ACol in [0]) and (ARow >1))or
     ((ACol > 0) and (ARow = 1))then
  begin
     if not((ARow in [0])and(ACol=0)) then
     begin
       r := Rect;
       sgServicosTARV.Canvas.Font.Style := [fsbold];
       sgServicosTARV.Canvas.FillRect(r);
       t := sgServicosTARV.Canvas.TextWidth(Conteudo);
        x := r.Left + (((r.Right - r.Left)-t)  div 2);
       y := r.Top  - ((r.Top + hf - r.Bottom) div 2);
       sgServicosTARV.Canvas.TextRect(r,x,y,Conteudo);
       //DrawText(sgServicosTARV.Canvas.Handle,Pchar(Conteudo),-1,r,DT_WORDBREAK+DT_CENTER+DT_VCENTER);
       DesenhaBordas(sgServicosTARV.Canvas,r);
     end;
  end;


  //Total: Negrito, Centro, Cor
  if ((ARow in [12]) and (ACol >0 ))or
     ((ACol in [19]) and (ARow > 1)) then
  begin
     r := Rect;
     sgServicosTARV.Canvas.Brush.Color := cl3DLight;
     sgServicosTARV.Canvas.Font.Style := [fsbold];
     sgServicosTARV.Canvas.FillRect(r);
     t := sgServicosTARV.Canvas.TextWidth(Conteudo);
     x := r.Left + (((r.Right - r.Left)-t)  div 2);
     y := r.Top  - ((r.Top + hf - r.Bottom) div 2);
     sgServicosTARV.Canvas.TextRect(r,x,y,Conteudo);
  end;
{
  //Linhas Ano sem preenchimento: Cor
  if DMGERAL.TB_SERVICOS_TARV.State in [dsEdit, dsInsert] then
  begin
    for i:=2 to 11 do
    begin
      if (sgServicosTARV.Cells[0,i] <> cbAno.text ) then
      Begin
        if ((ARow>=2)and(ARow<=12) and (ACol >0 ))then
        begin
           r := Rect;
           sgServicosTARV.Canvas.Brush.Color := cl3DLight;
           sgServicosTARV.Canvas.Font.Style := [fsbold];
           sgServicosTARV.Canvas.FillRect(r);
           t := sgServicosTARV.Canvas.TextWidth(Conteudo);
           x := r.Left + (((r.Right - r.Left)-t)  div 2);
           y := r.Top  - ((r.Top + hf - r.Bottom) div 2);
           sgServicosTARV.Canvas.TextRect(r,x,y,Conteudo);
        end;
      end;

    end;
  end;
}
  //Total: Negrito, Centro, Cor
  if ((ARow in [12]) and (ACol >0 ))then
  begin
     r := Rect;
     sgServicosTARV.Canvas.Brush.Color := cl3DLight;
     sgServicosTARV.Canvas.Font.Style := [fsbold];
     sgServicosTARV.Canvas.FillRect(r);
     t := sgServicosTARV.Canvas.TextWidth(Conteudo);
     x := r.Left + (((r.Right - r.Left)-t)  div 2);
     y := r.Top  - ((r.Top + hf - r.Bottom) div 2);
     sgServicosTARV.Canvas.TextRect(r,x,y,Conteudo);
  end;

end;

procedure TfrmCadServicosTARV.FormCreate(Sender: TObject);
begin
  inherited;
  FbPermiteMudarPagina := False;
  AbreConsultas;
  CarregaComboAno;
  bCarregaGrid := True;
  sSQLServicosTARV := dmGeral.TB_SERVICOS_TARV.SelectSQL.Text;
end;

procedure TfrmCadServicosTARV.btIncluirClick(Sender: TObject);
begin
  pgGeral.ActivePageIndex := 1;
  dmGeral.TB_SERVICOS_TARV.Close;
  dmGeral.TB_SERVICOS_TARV.Open;

  inherited;
  leProvincia.lookupValue := '';
  leUnidade.lookupValue := '';
  leMunicipio.lookupValue := '';
  cbAno.ItemIndex := -1;
  cbAte.ItemIndex := -1;
  bConsolidado := false;

  CriaGrid;
{
  //Controle de Usuario (RELATORIOS NAO TEM TRIGGERS) (Operacao INSERT)
  with TIBQuery.Create(nil) do
    begin
      Database := DM.DB;
      sql.Add('INSERT INTO AUDITORIA	(CD_AUDITORIA, CD_UND, CD_USU,DT_AUDITORIA, NM_TABELA, TP_OPERACAO)');
      sql.Add('VALUES 	(GEN_ID(GEN_AUDITORIA,1),'+QuotedStr(prmUnidade)+','+QuotedStr(DM.qyLoginCD_USUARIO.AsString)+', ''NOW'', ''REGISTRO_SERVICOS_TARV'', ''I'')');
      ExecSQL;
      close;
      free;
    end;
}
end;

procedure TfrmCadServicosTARV.sgServicosTARVSelectCell(Sender: TObject;
  ACol, ARow: Integer; var CanSelect: Boolean);
var
  i:integer;
begin
  //for i:=2 to 11 do
  begin
    //if (sgServicosTARV.Cells[0,i] = cbAno.text ) then
    Begin
      bEdit := (((ARow>=2)and(ARow<=12)) and (ACol >0 ));
      if (bEdit) and (dsControle.DataSet.State in [dsEdit,dsInsert]) then
        sgServicosTARV.Options := sgServicosTARV.Options + [goEditing]
      else
        sgServicosTARV.Options := sgServicosTARV.Options - [goEditing];
    end
    {else
      if (bEdit) and (dsControle.DataSet.State in [dsEdit,dsInsert]) then
        sgServicosTARV.Options := sgServicosTARV.Options + [goEditing]
      else
        sgServicosTARV.Options := sgServicosTARV.Options - [goEditing];}
  end;

end;

procedure TfrmCadServicosTARV.btgravarClick(Sender: TObject);
begin
  if bConsolidado then
  begin
    MessageDlg('Dados em modo de consolida��o, n�o podem ser modificados!',mtInformation,[mbOK],0);
  end
  else
  begin
    ValidaExclusao;
    VarreGrid;
    inherited;
  end;

end;

procedure TfrmCadServicosTARV.sgServicosTARVSetEditText(
  Sender: TObject; ACol, ARow: Integer; const Value: String);
var
  i:integer;

begin
  inherited;

  begin
    //if (sgServicosTARV.Cells[0,i] = cbAno.text ) then
    Begin
      bEdit := (not(ARow in [0,1,12]) and (ACol >0 ));
      if (bEdit) and (dsControle.DataSet.State in [dsEdit,dsInsert]) then
        sgServicosTARV.Options := sgServicosTARV.Options + [goEditing]
      else
        sgServicosTARV.Options := sgServicosTARV.Options - [goEditing];
    end
    {else
      if (bEdit) and (dsControle.DataSet.State in [dsEdit,dsInsert]) then
        sgServicosTARV.Options := sgServicosTARV.Options + [goEditing]
      else
        sgServicosTARV.Options := sgServicosTARV.Options - [goEditing];}
  end;


  CalculaToTal;

end;

procedure TfrmCadServicosTARV.pgGeralChange(Sender: TObject);
//var  i:integer;
begin
  inherited;
{

  if pgGeral.ActivePageIndex=1 then
  begin
    if not qyGridCD_PROVINCIA.IsNull then
      leProvincia.lookupValue := qyGridCD_PROVINCIA.AsInteger;

    if not qyGridCD_MUNICIPIO.IsNull then
      leMunicipio.lookupValue := qyGridCD_MUNICIPIO.AsInteger;

    if not qyGridCD_UNIDADE.IsNull then
      leUnidade.lookupValue := qyGridCD_UNIDADE.AsInteger;

    if not qyGridVL_ANO.IsNull then
      begin
        cbAno.text := qyGridVL_ANO.AsString;
        cbAte.text := qyGridVL_ANO.AsString;
      end
      else
        begin
          cbAno.ItemIndex := -1;
          cbAte.ItemIndex := -1;
        end;

    btConsultarClick(sender);
  end;
}
end;

procedure TfrmCadServicosTARV.btConsultarClick(Sender: TObject);
var sSQLWhere, sSQL, sW:String; nB,nE:Integer;
begin
  inherited;
  if (dmGeral.TB_SERVICOS_TARV.State in [dsEdit, dsInsert]) then
    Exit;

  dmGeral.TB_SERVICOS_TARV.Close;
  dmGeral.TB_SERVICOS_TARV.SelectSQL.Text := sSQLServicosTARV;
  sSQL := sSQLServicosTARV;;
  if ckConsolidar.Checked then
  begin
    sSQLWhere := '';
    sW := ' where ';

    if leUnidade.lookupValue <> '' then
    begin
      sSQLWhere := sW + 'CD_UNIDADE = :CD_UNIDADE';
      sW := ' and ';
    end;

    if leProvincia.lookupValue <> '' then
    begin
      sSQLWhere := sSQLWhere + sW + 'CD_PROVINCIA = :CD_PROVINCIA';
      sW := ' and ';
    end;

    if leMunicipio.lookupValue <> '' then
    begin
      sSQLWhere := sSQLWhere + sW + 'CD_MUNICIPIO = :CD_MUNICIPIO';
      sW := ' and ';
    end;

    if (trim(cbAno.Text) <> '') and (trim(cbAte.Text) <> '') then
      begin
        sSQLWhere := sSQLWhere + sW + 'VL_ANO between :de and :ate';
        sW := 'and ';
      end;

    SetSQLWhere(sSQL, sSQLWhere);
    dmGeral.TB_SERVICOS_TARV.SelectSQL.Text := sSQL;
    if (trim(cbAno.Text) <> '') and (trim(cbAte.Text) <> '') then
    begin
      dmGeral.TB_SERVICOS_TARV.ParamByName('de').AsString := cbAno.text;
      dmGeral.TB_SERVICOS_TARV.ParamByName('ate').AsString := cbAte.text;
    end;

    bConsolidado := true;
  end
  else
    bConsolidado := false;


  //Leandro 07/05/2013 - Nao � obrigatorio nenhum dos parametros
  if (leProvincia.lookupValue <> '') then
     dmGeral.TB_SERVICOS_TARV.ParamByName('CD_PROVINCIA').Value := strtoint(leProvincia.lookupValue);
  if (leMunicipio.lookupValue <> '') then
    dmGeral.TB_SERVICOS_TARV.ParamByName('CD_MUNICIPIO').Value := strtoint(leMunicipio.lookupValue);
  if (leUnidade.lookupValue <> '') then
    dmGeral.TB_SERVICOS_TARV.ParamByName('CD_UNIDADE').Value := strtoint(leUnidade.lookupValue);


  dmGeral.TB_SERVICOS_TARV.Open;
  CarregaGrid(dmGeral.TB_SERVICOS_TARV);
end;
procedure TfrmCadServicosTARV.grDadosDblClick(Sender: TObject);
begin

  if not qyGridCD_PROVINCIA.IsNull then
    leProvincia.lookupValue := inttostr(qyGridCD_PROVINCIA.AsInteger);

  if not qyGridCD_MUNICIPIO.IsNull then
    leMunicipio.lookupValue := inttostr(qyGridCD_MUNICIPIO.AsInteger);

  if not qyGridCD_UNIDADE.IsNull then
    leUnidade.lookupValue := inttostr(qyGridCD_UNIDADE.AsInteger);

  //cbAno.Text := qyGridVL_ANO.AsString;
  btConsultarClick(sender);
  inherited;

end;
procedure TfrmCadServicosTARV.ckConsolidarClick(Sender: TObject);
begin
  inherited;
  lbAte.visible := ckConsolidar.Checked;
  cbAte.visible := ckConsolidar.Checked;
  lbDe.visible := ckConsolidar.Checked;
  cbAno.visible := ckConsolidar.Checked;
  lbPeriodo.visible := ckConsolidar.Checked;
end;
procedure TfrmCadServicosTARV.cbAnoChange(Sender: TObject);
begin
  inherited;
  sgServicosTARV.Repaint;

end;
procedure TfrmCadServicosTARV.btexcluirClick(Sender: TObject);
var bExisteRegistro: Boolean;
begin
  pgGeral.ActivePageIndex := 1;
  pgGeralChange(sender);

{
  bExisteRegistro:=false;
  with TIBQuery.Create(nil) do // FAZ VERIFICACAO SE OS DADOS DOS CB TEM NA TABELA
    begin
      Database := DM.DB;

      sql.Add('select CD_UNIDADE, CD_PROVINCIA, CD_MUNICIPIO, VL_ANO');
      sql.Add('from REGISTRO_SERVICOS_TARV');
      sql.Add('where CD_UNIDADE ='+leUnidade.lookupValue+' and CD_PROVINCIA = '+leProvincia.lookupValue+' and CD_MUNICIPIO ='+leMunicipio.lookupValue+' and VL_ANO = '+QuotedStr(cbAno.Text)+'');
      Open;
      while not Eof do //S� verificar se encontrou registro
        begin
          bExisteRegistro:=true;
          Last;
        end;
      close;
      free;
    end;
}

  if bConsolidado then
  begin
    MessageDlg('Dados em modo de consolida��o, n�o podem ser modificados!',mtInformation,[mbOK],0);
  end
  else{
  if  not bExisteRegistro then
    begin
      btLimpar.click;
    end
  else}
  begin
    if Application.MessageBox('Deseja Excluir este registro?','Excluir', MB_YESNO+MB_ICONQUESTION) <> IDYES then
      Abort
    else
    begin

    dmGeral.TB_SERVICOS_TARV.Close;
    if leUnidade.lookupValue <> '' then
      dmGeral.TB_SERVICOS_TARV.ParamByName('CD_UNIDADE').AsInteger := strtoint(leUnidade.lookupValue);
    if leProvincia.lookupValue <> '' then
      dmGeral.TB_SERVICOS_TARV.ParamByName('CD_PROVINCIA').AsInteger := strtoint(leProvincia.lookupValue);
    if leMunicipio.lookupValue <> '' then
      dmGeral.TB_SERVICOS_TARV.ParamByName('CD_MUNICIPIO').AsInteger := strtoint(leMunicipio.lookupValue);
    //dmGeral.TB_SERVICOS_TARV.ParamByName('VL_ANO').AsString := cbAno.Text;
    dmGeral.TB_SERVICOS_TARV.Open;
{
    dmGeral.TB_SERVICOS_TARV.First;
    while not dmGeral.TB_SERVICOS_TARV.Eof do
      dmGeral.TB_SERVICOS_TARV.Delete;

    dmGeral.TB_SERVICOS_TARV.Close; dmGeral.TB_SERVICOS_TARV.Open;
}
    //if bCarregaGrid then  CarregaGrid(DMGERAL.TB_SERVICOS_TARV);
{
    //Controle de Usuario (RELATORIOS NAO TEM TRIGGERS) (Operacao DELETE)
        with TIBQuery.Create(nil) do
          begin
            Database := DM.DB;
            sql.Add('INSERT INTO AUDITORIA	(CD_AUDITORIA, CD_UND, CD_USU,DT_AUDITORIA, NM_TABELA, TP_OPERACAO)');
            sql.Add('VALUES 	(GEN_ID(GEN_AUDITORIA,1),'+QuotedStr(prmUnidade)+','+QuotedStr(DM.qyLoginCD_USUARIO.AsString)+', ''NOW'', ''REGISTRO_SERVICOS_TARV'', ''D'')');
            ExecSQL;
            close;
            free;
          end;
}
        inherited;

        //pgGeral.ActivePageIndex:=0;
        //pgGeralChange(sender);
    end;
  end;
end;

procedure TfrmCadServicosTARV.btLimparClick(Sender: TObject);
begin
  inherited;
  Limpar;
end;

procedure TfrmCadServicosTARV.btCancelarClick(Sender: TObject);
begin
  if bConsolidado then
  begin
    MessageDlg('Dados em modo de consolida��o, n�o podem ser modificados!',mtInformation,[mbOK],0);
  end
  else
   inherited;

end;
procedure TfrmCadServicosTARV.bteditarClick(Sender: TObject);
begin
  pgGeral.ActivePageIndex := 1;
  if not bConsolidado then
  pgGeralChange(sender);

  if bConsolidado then
  begin
    MessageDlg('Dados em modo de consolida��o, n�o podem ser modificados!',mtInformation,[mbOK],0);
  end
  else
  begin
    Unidade := dmGeral.TB_SERVICOS_TARVCD_UNIDADE.AsInteger;
    Provincia := dmGeral.TB_SERVICOS_TARVCD_PROVINCIA.AsInteger;
    Municipio := dmGeral.TB_SERVICOS_TARVCD_MUNICIPIO.AsInteger;
    Ano := dmGeral.TB_SERVICOS_TARVVL_ANO.AsString;
    inherited;
{
    //Controle de Usuario (RELATORIOS NAO TEM TRIGGERS) (Operacao UPDATE)
    with TIBQuery.Create(nil) do
      begin
        Database := DM.DB;
        sql.Add('INSERT INTO AUDITORIA	(CD_AUDITORIA, CD_UND, CD_USU,DT_AUDITORIA, NM_TABELA, TP_OPERACAO)');
        sql.Add('VALUES 	(GEN_ID(GEN_AUDITORIA,1),'+QuotedStr(prmUnidade)+','+QuotedStr(DM.qyLoginCD_USUARIO.AsString)+', ''NOW'', ''REGISTRO_SERVICOS_TARV'', ''U'')');
        ExecSQL;
        close;
        free;
      end;
}
  end;


end;
procedure TfrmCadServicosTARV.btimprimirClick(Sender: TObject);
begin
  frmRelatorioWEB := TfrmRelatorioWEB.Create(application);
  try
    sArq := sPathConsulta+'RelatorioSERVICOSTARV'+FormatDateTime('ddmmyyhhnnss',now)+'.xml';
    GeraXML;
    frmRelatorioWEB.relatorio.Navigate(sArq);
    frmRelatorioWEB.ShowModal;
  finally
    frmRelatorioWEB.Free;
    if FileExists(sArq) then
      DeleteFile(sArq);
  end;
end;

procedure TfrmCadServicosTARV.Limpar;
begin
  inherited;
  leProvincia.text:='';
  leMunicipio.text:='';
  leUnidade.text:='';
  cbAno.Text := '';
  cbAte.Text := '';
end;


procedure TfrmCadServicosTARV.leProvinciaChange(Sender: TObject);
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

procedure TfrmCadServicosTARV.leMunicipioChange(Sender: TObject);
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

procedure TfrmCadServicosTARV.leUnidadeChange(Sender: TObject);
begin
  inherited;
  if leUnidade.Modified then
  begin
    qyUnidade.Close;
    qyUnidade.SQL.Text := USQL;
    qyUnidade.SQL.Add('and Upper(ds_unidade) like(''' + '%' + UpperCase(leUnidade.Text) + '%'')');
    qyUnidade.Open;
  end
  else
  begin
    qyUnidade.SQL.Text := USQL;
    qyUnidade.Open;
  end;
end;




end.
