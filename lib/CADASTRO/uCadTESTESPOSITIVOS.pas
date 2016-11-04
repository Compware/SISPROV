unit uCadTESTESPOSITIVOS;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UfrmCadPadFichas, dxExEdtr, DB, dxCntner, dxTL, dxDBCtrl, dxDBGrid,
  ComCtrls, StdCtrls, Buttons, ExtCtrls, Grids, IBCustomDataSet, IBQuery,
  RxLookup, Mask, DBCtrls, DBGrids, RxDBComb, RpCon, RpConDS, RpBase,
  RpSystem, RpDefine, RpRave, DBClient, Midaslib, ImgList, ib_parse,
  dxEditor, dxEdLib, Menus, dxDBTLCl, dxGrClms;

type
  TfrmCadTESTESPOSITIVOS = class(TfrmCadPadFichas)
    DBGrid1: TDBGrid;
    sgTESTESPOSITIVOS: TStringGrid;
    qyTESTESPOSITIVOS: TIBQuery;
    Panel5: TPanel;
    Label21: TLabel;
    Label20: TLabel;
    Label1: TLabel;
    Label4: TLabel;
    cbMunicipio: TRxDBLookupCombo;
    cbProvincia: TRxDBLookupCombo;
    cbUnidade: TRxDBLookupCombo;
    btConsultar: TBitBtn;
    ckConsolidar: TCheckBox;
    qyGrid: TIBQuery;
    grDadosCD_MUNICIPIO: TdxDBGridMaskColumn;
    grDadosCD_PROVINCIA: TdxDBGridMaskColumn;
    grDadosCD_UNIDADE: TdxDBGridMaskColumn;
    grDadosVL_MESANO: TdxDBGridMaskColumn;
    grDadosDS_UNIDADE: TdxDBGridMaskColumn;
    grDadosDS_MUNICIPIO: TdxDBGridMaskColumn;
    grDadosDS_PROVINCIA: TdxDBGridMaskColumn;
    btLimpar: TBitBtn;
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
    qyGridNR_MESANO: TIntegerField;
    procedure FormShow(Sender: TObject);
    procedure btgravarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure btConsultarClick(Sender: TObject);
    procedure btexcluirClick(Sender: TObject);
    procedure sgTESTESPOSITIVOSKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure sgTESTESPOSITIVOSDrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure sgTESTESPOSITIVOSSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure sgTESTESPOSITIVOSSetEditText(Sender: TObject; ACol, ARow: Integer;
      const Value: String);
    procedure btIncluirClick(Sender: TObject);
    procedure btimprimirClick(Sender: TObject);
    procedure ckConsolidarClick(Sender: TObject);
    procedure btLimparClick(Sender: TObject);
    procedure grDadosDblClick(Sender: TObject);
    procedure pgGeralChange(Sender: TObject);
    procedure bteditarClick(Sender: TObject);
    procedure btCancelarClick(Sender: TObject);
    procedure qyGridCalcFields(DataSet: TDataSet);
  private
    { Private declarations }
    bCarregaGrid :Boolean;
  public
    { Public declarations }
    procedure CriaGrid;
    procedure Varregrid;
    procedure AbreConsultas;
    procedure FechaConsultas;
    procedure CarregaComboMesAno;
    procedure CarregaGrid(TB_TESTES_POSITIVOS:TDataSet);
    procedure CarregaDemo;
    procedure CalculaTotal;
    procedure GeraXML;  override;
    procedure ConsultaTESTESPOSITIVOS;
    function ValidaExclusao:boolean;
  end;

var
  frmCadTESTESPOSITIVOS: TfrmCadTESTESPOSITIVOS;
  bEdit, bConsolidado:Boolean;
  sArq, sSQLTESTESPOSITIVOS:string;
  Unidade, Provincia, Municipio:Integer;
  MesAno:String;

implementation

uses UDMGERAL, UDM, DateUtils, Ugeral, uRelatorioWEB, uFuncaoGrid;

{$R *.dfm}

procedure TfrmCadTESTESPOSITIVOS.GeraXML;
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
      sXML.Add('<?xml-stylesheet type="text/xsl" href="TESTESPOSITIVOS.xslt"?>');
      sXML.Add('<Programa>');
      sXML.Add('  <Parametros>');
      sXML.Add('    <MUNICIPIO>'+cbMunicipio.Text+'</MUNICIPIO>');
      sXML.Add('    <PROVINCIA>'+cbProvincia.Text+'</PROVINCIA>');
      sXML.Add('    <UNIDADE>'+cbUnidade.Text+'</UNIDADE>');
      sXML.Add('    <PERIODO>'+cbMesAno.Text+'</PERIODO>');
      sXML.Add('  </Parametros>');
      sXML.Add('  <Dados>');

      GridXML(sgTESTESPOSITIVOS);

      sXML.Add('  </Dados>');
      sXML.Add(' </Programa>');

      sXML.SaveToFile(sArq);
   finally
      FreeAndNil(sXML);
   end;
end;

procedure TfrmCadTESTESPOSITIVOS.CriaGrid;
var r,c:integer;
begin
  for r:=0 to 11 do
   for c:=0 to 6 do
     sgTESTESPOSITIVOS.Cells[c,r] := '';

  sgTESTESPOSITIVOS.RowCount := 11;
  sgTESTESPOSITIVOS.ColCount := 6;
  sgTESTESPOSITIVOS.FixedCols := 1;
  sgTESTESPOSITIVOS.FixedRows := 2;
  sgTESTESPOSITIVOS.Cells[0,1] := 'Idade';
  sgTESTESPOSITIVOS.Cells[1,1] := 'Masculino';
  sgTESTESPOSITIVOS.Cells[2,1] := 'Feminino';
  sgTESTESPOSITIVOS.Cells[3,1] := 'S/I';
  sgTESTESPOSITIVOS.Cells[4,1] := 'Total';
  sgTESTESPOSITIVOS.Cells[5,1] := '%';
  sgTESTESPOSITIVOS.Cells[0,2] := ' 0-4 anos';
  sgTESTESPOSITIVOS.Cells[0,3] := ' 4-14 anos';
  sgTESTESPOSITIVOS.Cells[0,4] := ' 15-19 anos';
  sgTESTESPOSITIVOS.Cells[0,5] := ' 20-29 anos';
  sgTESTESPOSITIVOS.Cells[0,6] := ' 30-39 anos';
  sgTESTESPOSITIVOS.Cells[0,7] := ' 40-49 anos';
  sgTESTESPOSITIVOS.Cells[0,8] := ' 50-59 anos';
  sgTESTESPOSITIVOS.Cells[0,9] := ' 60 ou mais';
  sgTESTESPOSITIVOS.Cells[0,10] := ' TOTAL ';

  sgTESTESPOSITIVOS.DefaultColWidth := 100;
  sgTESTESPOSITIVOS.DefaultRowHeight := 22;
  sgTESTESPOSITIVOS.RowHeights[0] := -1;
  sgTESTESPOSITIVOS.ColWidths[0] := 200;
end;

procedure TfrmCadTESTESPOSITIVOS.FormShow(Sender: TObject);
begin
  inherited;
  qyGrid.Open;
  CriaGrid;
  pgGeral.ActivePageIndex := 1;
end;

procedure TfrmCadTESTESPOSITIVOS.btgravarClick(Sender: TObject);
begin
  if bConsolidado then
  begin
    MessageDlg('Dados em modo de consolidação, não podem ser modificados!',mtInformation,[mbOK],0);
  end
  else
  begin
    ValidaExclusao;
    VarreGrid;
    inherited;
  end;
end;

procedure TfrmCadTESTESPOSITIVOS.Varregrid;
var i:integer;
    cdUnidade, cdProvincia, cdMunicipio:Integer;
    sMesAno:String;
begin
  if (cbProvincia.KeyValue = null) then
  begin
    MessageDlg('É necessário informar Provincia!',mtInformation,[mbOK],0);
    cbProvincia.SetFocus;
    Abort;
  end;

  if (cbMesAno.Text='  /    ') then
  begin
    MessageDlg('É necessário informar Mes/Ano!',mtInformation,[mbOK],0);
    cbMesAno.SetFocus;
    Abort;
  end;

  if (cbMunicipio.KeyValue = null) then
  begin
    if MessageDlg('O Municipio não foi informada, '#13#10'deseja continuar?',mtConfirmation,
        [mbYes,mbNo],0) = mrNo then
      begin
        cbMunicipio.SetFocus;
        Abort;
      end;
  end;

  if (cbUnidade.KeyValue = null) then
  begin
    if MessageDlg('A Unidade não foi informada, '#13#10'deseja continuar?',mtConfirmation,
        [mbYes,mbNo],0) = mrNo then
      begin
        cbUnidade.SetFocus;
        Abort;
      end;
  end;

  cdProvincia := cbProvincia.KeyValue;
  sMesAno := cbMesAno.Text;

  if cbMunicipio.Text <> '' then
    cdMunicipio := cbMunicipio.KeyValue;

  if cbUnidade.Text <> '' then
    cdUnidade := cbUnidade.KeyValue;

  {if bCarregaGrid then
    CarregaGrid(dmGeral.TB_ATV);
  bCarregaGrid := True;}

  for i:=1 to 11 do
  begin
     if (i in [2,3,4,5,6,7,8,9]) then
     begin
       if not (dmGeral.TB_TESTES_POSITIVOS.State in [dsEdit,dsInsert]) then
         dmGeral.TB_TESTES_POSITIVOS.Insert;

       if cdUnidade <> null then
         dmGeral.TB_TESTES_POSITIVOSCD_UNIDADE.AsInteger := cdUnidade;

       dmGeral.TB_TESTES_POSITIVOSCD_PROVINCIA.AsInteger := cdProvincia;

       if cdMunicipio <> null then
         dmGeral.TB_TESTES_POSITIVOSCD_MUNICIPIO.AsInteger := cdMunicipio;

       dmGeral.TB_TESTES_POSITIVOSVL_MESANO.AsString := sMesAno;
       dmGeral.TB_TESTES_POSITIVOSVL_Y.AsInteger := i;
       dmGeral.TB_TESTES_POSITIVOSDT_REGISTRO.AsDateTime := dm.GetDateTime;

       if (i in [2]) then dmGeral.TB_TESTES_POSITIVOSID_FAIXA_ETARIA.AsInteger := cvFaixaEtaria18;
       if (i in [3]) then dmGeral.TB_TESTES_POSITIVOSID_FAIXA_ETARIA.AsInteger := cvFaixaEtaria19;
       if (i in [4]) then dmGeral.TB_TESTES_POSITIVOSID_FAIXA_ETARIA.AsInteger := cvFaixaEtaria10;
       if (i in [5]) then dmGeral.TB_TESTES_POSITIVOSID_FAIXA_ETARIA.AsInteger := cvFaixaEtaria11;
       if (i in [6]) then dmGeral.TB_TESTES_POSITIVOSID_FAIXA_ETARIA.AsInteger := cvFaixaEtaria12;
       if (i in [7]) then dmGeral.TB_TESTES_POSITIVOSID_FAIXA_ETARIA.AsInteger := cvFaixaEtaria13;
       if (i in [8]) then dmGeral.TB_TESTES_POSITIVOSID_FAIXA_ETARIA.AsInteger := cvFaixaEtaria14;
       if (i in [9]) then dmGeral.TB_TESTES_POSITIVOSID_FAIXA_ETARIA.AsInteger := cvFaixaEtaria16;
       if (i in [2,3,4,5,6,7,8,9]) then begin
         dmGeral.TB_TESTES_POSITIVOSVL_MASCULINO.AsString := sgTESTESPOSITIVOS.Cells[1,i];
         dmGeral.TB_TESTES_POSITIVOSVL_FEMININO.AsString := sgTESTESPOSITIVOS.Cells[2,i];
         dmGeral.TB_TESTES_POSITIVOSVL_NAO_INFORMADO.AsString := sgTESTESPOSITIVOS.Cells[3,i];
       end;

       dmGeral.TB_TESTES_POSITIVOS.Post;
     end;
  end;
end;

procedure TfrmCadTESTESPOSITIVOS.AbreConsultas;
begin
  qyProvincia.Open;
  qyMunicipio.Open;
  qyUnidade.Open;
end;

procedure TfrmCadTESTESPOSITIVOS.FechaConsultas;
begin
  qyProvincia.Close;
  qyMunicipio.Close;
  qyUnidade.Close;
end;

procedure TfrmCadTESTESPOSITIVOS.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  FechaConsultas;
  dmGeral.TB_TESTES_POSITIVOS.SelectSQL.Text := sSQLTESTESPOSITIVOS;
end;

procedure TfrmCadTESTESPOSITIVOS.FormCreate(Sender: TObject);
begin
  inherited;
  FbPermiteMudarPagina := False;
  AbreConsultas;
  CarregaComboMesAno;
  bCarregaGrid := True;
  sSQLTESTESPOSITIVOS := dmGeral.TB_TESTES_POSITIVOS.SelectSQL.Text;

end;

procedure TfrmCadTESTESPOSITIVOS.CarregaDemo;
var i,j,x:integer;
begin
end;

procedure TfrmCadTESTESPOSITIVOS.CarregaComboMesAno;
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

procedure TfrmCadTESTESPOSITIVOS.btConsultarClick(Sender: TObject);
var sSQLWhere, sSQL, sW:String; nB,nE:Integer;
begin
  inherited;
  if (dmGeral.TB_TESTES_POSITIVOS.State in [dsEdit, dsInsert]) then
    Exit;

  dmGeral.TB_TESTES_POSITIVOS.Close;
  dmGeral.TB_TESTES_POSITIVOS.SelectSQL.Text := sSQLTESTESPOSITIVOS;
  sSQL := sSQLTESTESPOSITIVOS;
  if ckConsolidar.Checked then
  begin
    sSQLWhere := '';
    sW := ' where ';

    if cbUnidade.KeyValue <> Null then
    begin
      sSQLWhere := sW + 'CD_UNIDADE = :CD_UNIDADE';
      sW := ' and ';
    end;

    if cbProvincia.KeyValue <> Null then
    begin
      sSQLWhere := sSQLWhere + sW + 'CD_PROVINCIA = :CD_PROVINCIA';
      sW := ' and ';
    end;

    if cbMunicipio.KeyValue <> Null then
    begin
      sSQLWhere := sSQLWhere + sW + 'CD_MUNICIPIO = :CD_MUNICIPIO';
      sW := ' and ';
    end;

    if (cbMesAno.Text <> '') and (cbAte.Text <> '') then
      begin
        sSQLWhere := sSQLWhere + sW + 'VL_MESANO between :de and :ate';
        sW := 'and ';
      end;

    SetSQLWhere(sSQL, sSQLWhere);
    dmGeral.TB_TESTES_POSITIVOS.SelectSQL.Text := sSQL;
    if (cbMesAno.Text <> '') and (cbAte.Text <> '') then
    begin
      dmGeral.TB_TESTES_POSITIVOS.ParamByName('de').AsString := cbMesAno.text;
      dmGeral.TB_TESTES_POSITIVOS.ParamByName('ate').AsString := cbAte.text;
    end;

    bConsolidado := true;
  end
  else
    bConsolidado := false;

  //if not ckConsolidar.Checked then

  if cbProvincia.KeyValue <> Null then
    dmGeral.TB_TESTES_POSITIVOS.ParamByName('CD_PROVINCIA').AsInteger := cbProvincia.KeyValue
      else if not ckConsolidar.Checked then
   begin
     MessageDlg('É necessário informar Provincia!',mtInformation,[mbOK],0);
     cbProvincia.SetFocus;
     Abort;
   end;

  if not ckConsolidar.Checked then
  if cbMesAno.Text <> '' then
    dmGeral.TB_TESTES_POSITIVOS.ParamByName('VL_MESANO').AsString := cbMesAno.Text
  else
   begin
     MessageDlg('É necessário informar Mes/Ano De:!',mtInformation,[mbOK],0);
     cbMesAno.SetFocus;
     Abort;
   end;

  if cbMunicipio.KeyValue <> Null then
    dmGeral.TB_TESTES_POSITIVOS.ParamByName('CD_MUNICIPIO').AsInteger := cbMunicipio.KeyValue
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
    dmGeral.TB_TESTES_POSITIVOS.ParamByName('CD_UNIDADE').AsInteger := cbUnidade.KeyValue
      else if not ckConsolidar.Checked then
   begin
      if MessageDlg('A Unidade não foi informada, '#13#10'deseja continuar?',mtConfirmation,
          [mbYes,mbNo],0) = mrNo then
        begin
          cbUnidade.SetFocus;
          Abort;
        end;
   end;

  dmGeral.TB_TESTES_POSITIVOS.Open;
  CarregaGrid(dmGeral.TB_TESTES_POSITIVOS);
  {  ConsultaTESTESPOSITIVOS;
     CarregaGrid(qyTESTESPOSITIVOS);}

end;

procedure TfrmCadTESTESPOSITIVOS.CarregaGrid(TB_TESTES_POSITIVOS:TDataSet);
var rAux:real;
begin
    CriaGrid;
    TB_TESTES_POSITIVOS.First;
    while Not TB_TESTES_POSITIVOS.Eof do
    begin
      raux := valor(sgTESTESPOSITIVOS.Cells[1,TB_TESTES_POSITIVOS.FieldByName('VL_Y').AsInteger]) +
              valor(TB_TESTES_POSITIVOS.FieldByName('VL_MASCULINO').AsString);
      sgTESTESPOSITIVOS.Cells[1,TB_TESTES_POSITIVOS.FieldByName('VL_Y').AsInteger] := floattostr(raux);

      raux := valor(sgTESTESPOSITIVOS.Cells[2,TB_TESTES_POSITIVOS.FieldByName('VL_Y').AsInteger]) +
              valor(TB_TESTES_POSITIVOS.FieldByName('VL_FEMININO').AsString);
      sgTESTESPOSITIVOS.Cells[2,TB_TESTES_POSITIVOS.FieldByName('VL_Y').AsInteger] := floattostr(raux);

      raux := valor(sgTESTESPOSITIVOS.Cells[3,TB_TESTES_POSITIVOS.FieldByName('VL_Y').AsInteger]) +
              valor(TB_TESTES_POSITIVOS.FieldByName('VL_NAO_INFORMADO').AsString);
      sgTESTESPOSITIVOS.Cells[3,TB_TESTES_POSITIVOS.FieldByName('VL_Y').AsInteger] := floattostr(raux);

      TB_TESTES_POSITIVOS.Next;
    end;
    CalculaTotal;
end;

procedure TfrmCadTESTESPOSITIVOS.btexcluirClick(Sender: TObject);
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

    dmGeral.TB_TESTES_POSITIVOS.Close;
    if cbUnidade.KeyValue <> null then
      dmGeral.TB_TESTES_POSITIVOS.ParamByName('CD_UNIDADE').AsInteger := cbUnidade.KeyValue;
    if cbProvincia.KeyValue <> Null then
      dmGeral.TB_TESTES_POSITIVOS.ParamByName('CD_PROVINCIA').AsInteger := cbProvincia.KeyValue;
    if cbMunicipio.KeyValue <> null then
      dmGeral.TB_TESTES_POSITIVOS.ParamByName('CD_MUNICIPIO').AsInteger := cbMunicipio.KeyValue;
    dmGeral.TB_TESTES_POSITIVOS.ParamByName('VL_MESANO').AsString := cbMesAno.Text;
    dmGeral.TB_TESTES_POSITIVOS.Open;

    dmGeral.TB_TESTES_POSITIVOS.First;
    while not dmGeral.TB_TESTES_POSITIVOS.Eof do
      dmGeral.TB_TESTES_POSITIVOS.Delete;

    dmGeral.TB_TESTES_POSITIVOS.Close; dmGeral.TB_TESTES_POSITIVOS.Open;
    if bCarregaGrid then
      CarregaGrid(DMGERAL.TB_TESTES_POSITIVOS);
    end;
  end;

end;

procedure TfrmCadTESTESPOSITIVOS.sgTESTESPOSITIVOSKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if (key = ord('D')) and (shift = [ssShift, ssCtrl]) then
    CarregaDemo;
end;

procedure TfrmCadTESTESPOSITIVOS.sgTESTESPOSITIVOSDrawCell(Sender: TObject; ACol, ARow: Integer;
  Rect: TRect; State: TGridDrawState);
var Conteudo:String; x,y,hf:integer; al:Word; c:TColor;
begin
  inherited;
  Conteudo := sgTESTESPOSITIVOS.Cells[ACol,ARow];
  if (ACol in [0])or
     (ARow in [0,1]) then
  begin
     sgTESTESPOSITIVOS.Canvas.Font.Style := [fsbold];
     //sgATV.Canvas.Font.Color := clBlue;
     x := SetTextAlign(sgTESTESPOSITIVOS.Canvas.Handle, TA_CENTER);
     sgTESTESPOSITIVOS.Canvas.TextRect(Rect,
      Rect.Left + (Rect.Right - Rect.Left) div 2, Rect.Top + 2, Conteudo);
     SetTextAlign(sgTESTESPOSITIVOS.Canvas.Handle, x);
  end;

  //TOTAL
  if ((ARow in [2,3,4,5,6,7,8,9,10]) and (ACol=4))
     or ((ARow>1)and(ACol=6))  then
  begin
    sgTESTESPOSITIVOS.Canvas.Font.Style:=[fsbold];
    sgTESTESPOSITIVOS.Canvas.Brush.Color := cl3DLight;
    sgTESTESPOSITIVOS.Canvas.FillRect(Rect);
    sgTESTESPOSITIVOS.Canvas.TextRect(Rect,Rect.Left,Rect.Top,Conteudo);
  end;

  //PERCENTUAL
  if ((ARow in [2,3,4,5,6,7,8,9,10]) and (ACol=5))
     or ((ARow>1)and(ACol=6))  then
  begin
    sgTESTESPOSITIVOS.Canvas.Font.Style:=[fsbold];

    sgTESTESPOSITIVOS.Canvas.Brush.Color := cl3DLight;
    sgTESTESPOSITIVOS.Canvas.FillRect(Rect);
    sgTESTESPOSITIVOS.Canvas.TextRect(Rect,Rect.Left,Rect.Top,Conteudo);
  end;

  //TOTAL
  if ((ARow in [10]) and (ACol>0))
     or ((ARow=10)and(ACol>0))  then
  begin
    sgTESTESPOSITIVOS.Canvas.Font.Style:=[fsbold];
    sgTESTESPOSITIVOS.Canvas.Brush.Color := cl3DLight;
    sgTESTESPOSITIVOS.Canvas.FillRect(Rect);
    sgTESTESPOSITIVOS.Canvas.TextRect(Rect,Rect.Left,Rect.Top,Conteudo);
  end;

end;

procedure TfrmCadTESTESPOSITIVOS.sgTESTESPOSITIVOSSelectCell(Sender: TObject; ACol, ARow: Integer;
  var CanSelect: Boolean);
begin
  inherited;
  bEdit := not(((ARow in [10]) and (ACol>0))
     or ((ARow>1)and(ACol>3)));

  if (bEdit) and (dsControle.DataSet.State in [dsEdit,dsInsert]) then
    sgTESTESPOSITIVOS.Options := sgTESTESPOSITIVOS.Options + [goEditing]
  else
    sgTESTESPOSITIVOS.Options := sgTESTESPOSITIVOS.Options - [goEditing];
end;

procedure TfrmCadTESTESPOSITIVOS.sgTESTESPOSITIVOSSetEditText(Sender: TObject; ACol, ARow: Integer;
  const Value: String);
begin
  inherited;
  CalculaToTal;
end;

procedure TfrmCadTESTESPOSITIVOS.CalculaTotal;
var r,c:integer; tl,tc,tg:real;
begin

  for r:=2 to 10 do
  begin

    if (r=10) then
    for c:=1 to 5 do
    begin
      tg :=
        Valor(sgTESTESPOSITIVOS.Cells[c,2]) +
        Valor(sgTESTESPOSITIVOS.Cells[c,3]) +
        Valor(sgTESTESPOSITIVOS.Cells[c,4]) +
        Valor(sgTESTESPOSITIVOS.Cells[c,5]) +
        Valor(sgTESTESPOSITIVOS.Cells[c,6]) +
        Valor(sgTESTESPOSITIVOS.Cells[c,7]) +
        Valor(sgTESTESPOSITIVOS.Cells[c,8]) +
        Valor(sgTESTESPOSITIVOS.Cells[c,9]);
      sgTESTESPOSITIVOS.Cells[c,r] := FloatToStr(tg);
    end;

    tl :=
      Valor(sgTESTESPOSITIVOS.Cells[1,r]) +
      Valor(sgTESTESPOSITIVOS.Cells[2,r]) +
      Valor(sgTESTESPOSITIVOS.Cells[3,r]);
    sgTESTESPOSITIVOS.Cells[4,r] := FloatToStr(tl);

{    tl :=
      Valor(sgTESTESPOSITIVOS.Cells[1,r]) /
      Valor(sgTESTESPOSITIVOS.Cells[3,r]) * 100;
    sgTESTESPOSITIVOS.Cells[5,r] := FloatToStr(tl);
}
  end;
end;

procedure TfrmCadTESTESPOSITIVOS.btIncluirClick(Sender: TObject);
begin
  pgGeral.ActivePageIndex := 1;
  dmGeral.TB_TESTES_POSITIVOS.Close;
  dmGeral.TB_TESTES_POSITIVOS.Open;

  inherited;
  cbProvincia.KeyValue := '';
  cbUnidade.KeyValue := '';
  cbMunicipio.KeyValue := '';
  cbMesAno.ItemIndex := -1;
  ckConsolidar.Checked := false;
  bConsolidado := false;
  CriaGrid;
end;

procedure TfrmCadTESTESPOSITIVOS.btimprimirClick(Sender: TObject);
begin
  frmRelatorioWEB := TfrmRelatorioWEB.Create(application);
  try
    sArq := sPathConsulta+'RelatorioTESTESPOSITIVOS'+FormatDateTime('ddmmyyhhnnss',now)+'.xml';
    GeraXML;
    frmRelatorioWEB.relatorio.Navigate(sArq);
    frmRelatorioWEB.ShowModal;
  finally
    frmRelatorioWEB.Free;
    if FileExists(sArq) then
      DeleteFile(sArq);
  end;
end;

procedure TfrmCadTESTESPOSITIVOS.ConsultaTESTESPOSITIVOS;
var sSQL: TStringList; sWhere:String;
begin
    sSQL := TStringList.Create;
    try
      sSQL.Add('select');
      sSQL.Add('       sum(VL_MASCULINO) VL_MASCULINO');
      sSQL.Add('     , sum(VL_FEMININO)VL_FEMININO');
      sSQL.Add('     , sum(VL_NAO_INFORMADO)VL_NAO_INFORMADO');
      sSQL.Add('     , ID_FAIXA_ETARIA');
      sSQL.Add('     , VL_X');
      sSQL.Add('     , VL_Y');
      sSQL.Add('from registro_testes_positivos');

      sWhere := 'where';
      if cbUnidade.KeyValue <> null then
      begin
        sSQL.Add(sWhere + ' CD_UNIDADE = ' + VarToStr(cbUnidade.KeyValue));
        sWhere := 'and';
      end;

      if cbProvincia.KeyValue <> null then
      begin
        sSQL.Add(sWhere + ' CD_PROVINCIA = ' + VarToStr(cbProvincia.KeyValue));
        sWhere := ' and';
      end;

      if cbMunicipio.KeyValue <> null then
      begin
        sSQL.Add(sWhere + ' CD_MUNICIPIO = ' + VarToStr(cbMunicipio.KeyValue));
        sWhere := ' and';
      end;

      if cbMesAno.Text <> '' then
      begin
        sSQL.Add(sWhere + ' VL_MESANO = ' + QuotedStr(cbMesAno.Text));
      end;

      sSQL.Add('group by');
      sSQL.Add('       ID_FAIXA_ETARIA');
      sSQL.Add('     , VL_X');
      sSQL.Add('     , VL_Y');

      qyTESTESPOSITIVOS.Close;
      qyTESTESPOSITIVOS.SQL.Text := sSQL.Text;
      qyTESTESPOSITIVOS.Open;

    finally
       FreeAndNil(sSQL);
    end;
end;

function TfrmCadTESTESPOSITIVOS.ValidaExclusao: boolean;
begin
  try
    if dmGeral.TB_TESTES_POSITIVOS.State in [dsInsert] then
    begin
      //Primeiro deve Excluir, para depois entao incluir todos
      if dmGeral.TB_TESTES_POSITIVOS.State in dsEditModes then
        dmGeral.TB_TESTES_POSITIVOS.Cancel;

      dmGeral.TB_TESTES_POSITIVOS.Close;
      if cbUnidade.KeyValue <> null then
        dmGeral.TB_TESTES_POSITIVOS.ParamByName('CD_UNIDADE').AsInteger := cbUnidade.KeyValue;
      if cbProvincia.KeyValue <> Null then
        dmGeral.TB_TESTES_POSITIVOS.ParamByName('CD_PROVINCIA').AsInteger := cbProvincia.KeyValue;
      if cbMunicipio.KeyValue <> null then
        dmGeral.TB_TESTES_POSITIVOS.ParamByName('CD_MUNICIPIO').AsInteger := cbMunicipio.KeyValue;
      dmGeral.TB_TESTES_POSITIVOS.ParamByName('VL_MESANO').AsString := cbMesAno.Text;
      dmGeral.TB_TESTES_POSITIVOS.Open;

      dmGeral.TB_TESTES_POSITIVOS.First;
      while not dmGeral.TB_TESTES_POSITIVOS.Eof do
        dmGeral.TB_TESTES_POSITIVOS.Delete;

      Result := true;
    end;

    if dmGeral.TB_TESTES_POSITIVOS.State in [dsEdit] then
    begin
      //Primeiro deve Excluir, para depois entao incluir todos
      if dmGeral.TB_TESTES_POSITIVOS.State in dsEditModes then
        dmGeral.TB_TESTES_POSITIVOS.Cancel;

      dmGeral.TB_TESTES_POSITIVOS.Close;
      if cbUnidade.KeyValue <> null then
        dmGeral.TB_TESTES_POSITIVOS.ParamByName('CD_UNIDADE').AsInteger := Unidade;
      if cbProvincia.KeyValue <> Null then
        dmGeral.TB_TESTES_POSITIVOS.ParamByName('CD_PROVINCIA').AsInteger := Provincia;
      if cbMunicipio.KeyValue <> null then
        dmGeral.TB_TESTES_POSITIVOS.ParamByName('CD_MUNICIPIO').AsInteger := Municipio;
      dmGeral.TB_TESTES_POSITIVOS.ParamByName('VL_MESANO').AsString := MesAno;
      dmGeral.TB_TESTES_POSITIVOS.Open;

      dmGeral.TB_TESTES_POSITIVOS.First;
      while not dmGeral.TB_TESTES_POSITIVOS.Eof do
        dmGeral.TB_TESTES_POSITIVOS.Delete;

      Result := true;
    end;

  except
    Result := false;
  end;
end;

procedure TfrmCadTESTESPOSITIVOS.ckConsolidarClick(Sender: TObject);
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

procedure TfrmCadTESTESPOSITIVOS.btLimparClick(Sender: TObject);
begin
  inherited;
  cbProvincia.ClearValue;
  cbMunicipio.ClearValue;
  cbUnidade.ClearValue;
  cbMesAno.Text := '';
  cbAte.Text := '';

end;

procedure TfrmCadTESTESPOSITIVOS.grDadosDblClick(Sender: TObject);
begin
  inherited;
  pgGeralChange(sender);

end;

procedure TfrmCadTESTESPOSITIVOS.pgGeralChange(Sender: TObject);
begin
  inherited;
  if pgGeral.ActivePageIndex=1 then
  begin
    if not qyGridCD_PROVINCIA.IsNull then
      cbProvincia.KeyValue := qyGridCD_PROVINCIA.AsInteger;

    if not qyGridCD_MUNICIPIO.IsNull then
      cbMunicipio.KeyValue := qyGridCD_MUNICIPIO.AsInteger;

    if not qyGridCD_UNIDADE.IsNull then
      cbUnidade.KeyValue := qyGridCD_UNIDADE.AsInteger;

    cbMesAno.Text := qyGridVL_MESANO.AsString;
    btConsultarClick(sender);
  end;

end;

procedure TfrmCadTESTESPOSITIVOS.bteditarClick(Sender: TObject);
begin
  pgGeral.ActivePageIndex := 1;
  pgGeralChange(sender);

  if bConsolidado then
  begin
    MessageDlg('Dados em modo de consolidação, não podem ser modificados!',mtInformation,[mbOK],0);
  end
  else
  begin
    Unidade := dmGeral.TB_TESTES_POSITIVOSCD_UNIDADE.AsInteger;
    Provincia := dmGeral.TB_TESTES_POSITIVOSCD_PROVINCIA.AsInteger;
    Municipio := dmGeral.TB_TESTES_POSITIVOSCD_MUNICIPIO.AsInteger;
    MesAno := dmGeral.TB_TESTES_POSITIVOSVL_MESANO.AsString;
    inherited;
  end;
end;

procedure TfrmCadTESTESPOSITIVOS.btCancelarClick(Sender: TObject);
begin
  if bConsolidado then
  begin
    MessageDlg('Dados em modo de consolidação, não podem ser modificados!',mtInformation,[mbOK],0);
  end
  else
   inherited;

end;

procedure TfrmCadTESTESPOSITIVOS.qyGridCalcFields(DataSet: TDataSet);
var sAux:String;
begin
  inherited;
  sAux := qyGridVL_MESANO.AsString;
  sAux := Copy(sAux,4,4)+Copy(sAux,1,2);
  qyGridNR_MESANO.AsInteger :=  strToInt(sAux);
end;

end.
