unit uCadPROGRAMA;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UfrmCadPadFichas, dxExEdtr, DB, dxCntner, dxTL, dxDBCtrl, dxDBGrid,
  ComCtrls, StdCtrls, Buttons, ExtCtrls, Grids, IBCustomDataSet, IBQuery,
  RxLookup, Mask, DBCtrls, DBGrids, RxDBComb, RpCon, RpConDS, RpBase,
  RpSystem, RpDefine, RpRave, DBClient, Midaslib, ImgList, ib_parse,
  ToolEdit, dxEditor, dxEdLib, UfrmCadPad, Menus, dxDBTLCl, dxGrClms;

type
  TfrmCadPrograma = class(TfrmCadPadFichas)
    Panel5: TPanel;
    Label20: TLabel;
    Label21: TLabel;
    qyProvincia: TIBQuery;
    qyMunicipio: TIBQuery;
    dsProvincia: TDataSource;
    dsMunicipio: TDataSource;
    qyUnidade: TIBQuery;
    dsUnidade: TDataSource;
    Label1: TLabel;
    qyProvinciaCD_PAIS: TIntegerField;
    qyProvinciaCD_PROVINCIA: TIntegerField;
    qyProvinciaDS_PROVINCIA: TIBStringField;
    qyMunicipioCD_MUNICIPIO: TIntegerField;
    qyMunicipioCD_PROVINCIA: TIntegerField;
    qyMunicipioDS_MUNICIPIO: TIBStringField;
    qyUnidadeCD_UNIDADE: TIntegerField;
    qyUnidadeDS_UNIDADE: TIBStringField;
    btConsultar: TBitBtn;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    TabSheet4: TTabSheet;
    TabSheet5: TTabSheet;
    TabSheet6: TTabSheet;
    sg2: TStringGrid;
    sg3: TStringGrid;
    sg4: TStringGrid;
    sg6: TStringGrid;
    PageControl2: TPageControl;
    TabSheet7: TTabSheet;
    TabSheet8: TTabSheet;
    TabSheet9: TTabSheet;
    TabSheet10: TTabSheet;
    sg1: TStringGrid;
    DBGrid2: TDBGrid;
    sg51: TStringGrid;
    sg52: TStringGrid;
    sg53: TStringGrid;
    sg54: TStringGrid;
    qyPrograma: TIBQuery;
    ckConsolidar: TCheckBox;
    btLimpar: TBitBtn;
    Label2: TLabel;
    lbAte: TLabel;
    Label4: TLabel;
    qyGrid: TIBQuery;
    qyGridCD_MUNICIPIO: TIntegerField;
    qyGridCD_PROVINCIA: TIntegerField;
    qyGridCD_UNIDADE: TIntegerField;
    qyGridVL_MESANO: TIBStringField;
    qyGridDS_UNIDADE: TIBStringField;
    qyGridDS_MUNICIPIO: TIBStringField;
    qyGridDS_PROVINCIA: TIBStringField;
    BitBtn1: TBitBtn;
    tbConsolidar: TTabSheet;
    ckATV: TCheckBox;
    ckPTV: TCheckBox;
    cbMesAno: TdxPickEdit;
    cbAte: TdxPickEdit;
    ckCaracterizacao: TCheckBox;
    ckNotificacao: TCheckBox;
    grDadoschave: TdxDBGridColumn;
    grDadosVL_MESANO: TdxDBGridMaskColumn;
    grDadosCD_PROVINCIA: TdxDBGridMaskColumn;
    grDadosDS_PROVINCIA: TdxDBGridMaskColumn;
    grDadosCD_MUNICIPIO: TdxDBGridMaskColumn;
    grDadosDS_MUNICIPIO: TdxDBGridMaskColumn;
    grDadosCD_UNIDADE: TdxDBGridMaskColumn;
    grDadosDS_UNIDADE: TdxDBGridMaskColumn;
    leUnidade: TRxLookupEdit;
    leMunicipio: TRxLookupEdit;
    leProvincia: TRxLookupEdit;
    qyGridCHAVE: TIBStringField;
    ckTARV: TCheckBox;
    ckPrograma: TCheckBox;
    btGravarConsolidado: TBitBtn;
    ckTARV_ESQ: TCheckBox;
   	ProgressBar1: TProgressBar;
    ckAcomp: TCheckBox;
    qyGridNR_MESANO: TIntegerField;
    qyUnidadeFL_ATIVA: TIBStringField;
    BitBtn2: TBitBtn;
    procedure FormShow(Sender: TObject);
    procedure btgravarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure btConsultarClick(Sender: TObject);
    procedure btexcluirClick(Sender: TObject);
    procedure btIncluirClick(Sender: TObject);
    procedure btimprimirClick(Sender: TObject);
    procedure sg1SetEditText(Sender: TObject; ACol, ARow: Integer;
      const Value: String);
    procedure sg2SetEditText(Sender: TObject; ACol, ARow: Integer;
      const Value: String);
    procedure sg52SetEditText(Sender: TObject; ACol, ARow: Integer;
      const Value: String);
    procedure sg54SetEditText(Sender: TObject; ACol, ARow: Integer;
      const Value: String);
    procedure sg6SetEditText(Sender: TObject; ACol, ARow: Integer;
      const Value: String);
    procedure sg2DrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure sg3DrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure sg52DrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure sg53DrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure sg54DrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure sg6DrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure sg1DrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure sg1SelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure sg2SelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure sg3SelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure sg4SelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure sg51SelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure sg52SelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure sg53SelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure sg54SelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure sg6SelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure btLimparClick(Sender: TObject);
    procedure btCancelarClick(Sender: TObject);
    procedure bteditarClick(Sender: TObject);
    procedure ckConsolidarClick(Sender: TObject);
    procedure grDadosDblClick(Sender: TObject);
    procedure sg4DrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure sg51DrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure sg4SetEditText(Sender: TObject; ACol, ARow: Integer;
      const Value: String);
    procedure sg51SetEditText(Sender: TObject; ACol, ARow: Integer;
      const Value: String);
    procedure qyGridCalcFields(DataSet: TDataSet);
    procedure TabSheet5Show(Sender: TObject);
    procedure leUnidadeChange(Sender: TObject);
    procedure leProvinciaChange(Sender: TObject);
    procedure leMunicipioChange(Sender: TObject);
    procedure btGravarConsolidadoClick(Sender: TObject);
    procedure sg3SetEditText(Sender: TObject; ACol, ARow: Integer;
      const Value: String);
    procedure FormDestroy(Sender: TObject);
    procedure cbAteChange(Sender: TObject);
    procedure cbAteKeyPress(Sender: TObject; var Key: Char);
    procedure cbMesAnoKeyPress(Sender: TObject; var Key: Char);
    procedure cbMesAnoChange(Sender: TObject);
    procedure sg1KeyPress(Sender: TObject; var Key: Char);
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
    procedure CarregaGrid(TB_PROGRAMA:TDataSet);
    procedure CarregaDemo;
    procedure CalculaTotalSg1;
    procedure CalculaTotalSg2;
    procedure CalculaTotalSg3;
    procedure CalculaTotalSg4;
    procedure CalculaTotalSg51;
    procedure CalculaTotalSg52;
    procedure CalculaTotalSg54;
    procedure CalculaTotalSg6;
    procedure GeraXML;   override;
    procedure ConsultaPrograma;
    function ValidaExclusao:boolean;
    function Valor(s:String):real;
    procedure Limpar; override;
    procedure Validar;
  end;

type
  TMes = Record
    gr:TRect;
    sMesclado:String;
end;

var
  frmCadPrograma: TfrmCadPrograma;
  bMesclando, bEdit, bConsolidado:Boolean;
  Mes:array[0..7] of TMes;
  sSQLPrograma:String;
  Unidade, Provincia, Municipio:Integer;
  MesAno:String;
  chave:integer;
  PSQL, MSQL, USQL:string;

implementation

uses MaskUtils, UDM, DateUtils, Ugeral, uRelatorioWEB, Math, UGeralSQL,
  UDMGERAL, uFuncaoContraSenha;

{$R *.dfm}

procedure TfrmCadPrograma.CriaGrid;
var r,c:integer;
begin

  //1
  for r:=0 to 12 do
   for c:=0 to 5 do
     sg1.Cells[c,r] := '';

  sg1.RowCount := 12;
  sg1.ColCount := 6;
  sg1.FixedCols := 2;
  sg1.FixedRows := 2;
  sg1.Cells[0,0] := 'Tipo de População';
  sg1.ColWidths[0] := 130;
  sg1.Cells[2,1] := 'Aconselhados';
  sg1.ColWidths[2] := 100;
  sg1.Cells[3,0] := 'Testados (Resumidos)';
  sg1.Cells[3,1] := 'Positivos';
  sg1.ColWidths[3] := 140;
  sg1.Cells[4,1] := 'Negativos';
  sg1.ColWidths[4] := 100;
  sg1.Cells[5,1] := 'Indeterminados';
  sg1.ColWidths[5] := 100;

  sg1.Cells[0,2] := '1.1 GESTANTES';

  sg1.Cells[0,3] := '1.2 ADULTOS';
  sg1.Cells[0,4] := '15 ou mais';
  sg1.Cells[1,4] := 'Feminino';
  sg1.Cells[1,5] := 'Masculino';
  sg1.Cells[1,6] := 'Total';

  sg1.Cells[0,7] := '1.3 CRIANÇAS';
  sg1.Cells[0,8] := '18 meses a 14 anos';
  sg1.Cells[1,8] := 'Feminino';
  sg1.Cells[1,9] := 'Masculino';
  sg1.Cells[1,10] := 'Total';
  sg1.Cells[0,11] := 'Total Geral';

  //2
  for r:=0 to 12 do
   for c:=0 to 5 do
     sg2.Cells[c,r] := '';

  sg2.RowCount := 12;
  sg2.ColCount := 5;
  sg2.FixedCols := 2;
  sg2.FixedRows := 2;
  sg2.Cells[0,0] := 'Faixa Etária';
  sg2.ColWidths[0] := 160;
  sg2.Cells[2,0] := 'Acompanhamentos';
  sg2.ColWidths[2] := 120;
  sg2.Cells[2,1] := 'Feminino';
  sg2.ColWidths[3] := 120;
  sg2.Cells[3,1] := 'Masculino';
  sg2.ColWidths[4] := 120;
  sg2.Cells[4,1] := 'Total';

  sg2.Cells[0,3] := '2.1 Crianças (VIH/SIDA)';
  sg2.Cells[0,5] := '2.2 Adultos';

  sg2.ColWidths[1] := 210;
  sg2.Cells[1,2] := 'Menor de 18 meses (critério clínico)';
  sg2.Cells[1,3] := '18 meses a 4 anos';
  sg2.Cells[1,4] := '5 a 14 anos';
  sg2.Cells[1,5] := '15 a 19 anos';
  sg2.Cells[1,6] := '20 a 29 anos';
  sg2.Cells[1,7] := '30 a 39 anos';
  sg2.Cells[1,8] := '40 a 49';
  sg2.Cells[1,9] := '50 a 59 anos';
  sg2.Cells[1,10] := '60 e mais';
  sg2.Cells[0,11] := 'Total';

  //3
  for r:=0 to 11 do
   for c:=0 to 5 do
     sg3.Cells[c,r] := '';

  sg3.RowCount := 12;
  sg3.ColCount := 5;
  sg3.FixedCols := 3;
  sg3.FixedRows := 1;
  sg3.Cells[1,0] := 'Tópico';
  sg3.ColWidths[1] := 100;
  sg3.Cells[3,0] := 'Gestantes';
  sg3.Cells[4,0] := 'Pós-Parto';

  sg3.ColWidths[0] := 210;
  sg3.Cells[0,1] := '3.1 Casos admitidos neste período';
  sg3.Cells[0,2] := '3.2 Idade';
  sg3.Cells[0,4] := '3.3 Partos';

  sg3.ColWidths[1] := 230;
  sg3.Cells[1,2] := 'Menor de 15 anos';
  sg3.Cells[1,3] := '15 anos ou mais';
  sg3.Cells[1,4] := 'Total de partos ocorridos neste periodo';
  sg3.Cells[1,5] := 'Local';
  sg3.Cells[1,8] := 'Tipo';
  sg3.Cells[1,10] := 'Terapia recebida';

  sg3.ColWidths[2] := 200;
  sg3.Cells[2,5] := 'a. Nesta Instituição';
  sg3.Cells[2,6] := 'b. Outras que não tem PTV';
  sg3.Cells[2,7] := 'c. Domiciliares';
  sg3.Cells[2,8] := 'a. Normal ou trans-pelvico';
  sg3.Cells[2,9] := 'b. Cesariana';
  sg3.Cells[2,10] := 'a. Algum tipo de terapia';
  sg3.Cells[2,11] := 'b. Nenhum tipo de terapia';

  //4
  for r:=0 to 3 do
   for c:=0 to 1 do
     sg4.Cells[c,r] := '';

  sg4.RowCount := 4;
  sg4.ColCount := 2;
  sg4.FixedCols := 1;
  sg4.FixedRows := 1;
  sg4.ColWidths[0] := 250;
  sg4.ColWidths[1] := 110;
  sg4.Cells[0,0] := '4. Crianças Expostas';
  sg4.Cells[0,1] := 'Nr. de Crianças registradas neste período';
  sg4.Cells[0,2] := 'Crianças que receberam AZT, oral';
  sg4.Cells[0,3] := 'Crianças que não receberam AZT, oral';

  //51
  for r:=0 to 3 do
   for c:=0 to 4 do
     sg51.Cells[c,r] := '';

  sg51.RowCount := 4;
  sg51.ColCount := 2;
  sg51.FixedCols := 1;
  sg51.FixedRows := 1;
  sg51.ColWidths[0] := 290;
  sg51.ColWidths[1] := 110;
  sg51.Cells[0,0] := '5.1 Casos que iniciaram TARV nesta Unidade';
  sg51.Cells[0,2] := 'Nr. de Pacientes que iniciaram TARV pela 1º vez';
  sg51.Cells[0,3] := 'Nr. de pacientes que já fazem uso do TARV';
  sg51.Cells[0,1] := 'Nr. Total de pacientes registrados neste periodo';

  //52
  for r:=0 to 12 do
   for c:=0 to 5 do
     sg52.Cells[c,r] := '';

  sg52.RowCount := 12;
  sg52.ColCount := 5;
  sg52.FixedCols := 2;
  sg52.FixedRows := 2;
  sg52.Cells[0,0] := '5.2 Caracteristicas';
  sg52.ColWidths[0] := 150;
  sg52.Cells[0,1] := 'Faixa Etária';
  sg52.Cells[2,1] := 'Feminino';
  sg52.Cells[3,1] := 'Masculino';
  sg52.Cells[4,1] := 'Total';

  sg52.Cells[0,3] := '5.2.1 Crianças';
  sg52.Cells[0,6] := '5.2.2 Adultos';


  sg52.Cells[1,2] := 'Menor de 18 meses (critério clínico)';
  sg52.ColWidths[1] := 220;
  sg52.Cells[1,3] := '18 meses a 4 anos';
  sg52.Cells[1,4] := '5 a 14 anos';
  sg52.Cells[1,5] := '15 a 19 anos';
  sg52.Cells[1,6] := '20 a 29 anos';
  sg52.Cells[1,7] := '30 a 39 anos';
  sg52.Cells[1,8] := '40 a 49';
  sg52.Cells[1,9] := '50 a 59 anos';
  sg52.Cells[1,10] := '60 e mais';
  sg52.Cells[0,11] := 'Total';

  //53
  for r:=0 to 12 do
   for c:=0 to 6 do
     sg53.Cells[c,r] := '';

  sg53.RowCount := 12;
  sg53.ColCount := 6;
  sg53.FixedCols := 0;
  sg53.FixedRows := 2;
  sg53.ColWidths[0] := 20;
  sg53.ColWidths[1] := 200;
  sg53.ColWidths[3] := 20;
  sg53.ColWidths[4] := 200;
  sg53.Cells[1,0] := '5.3 Esquemas que foram iniciados';
  sg53.Cells[1,1] := 'Esquema';
  sg53.Cells[2,1] := 'Nr. Pacientes';
  sg53.ColWidths[2] := 110;
  sg53.Cells[4,1] := 'Esquema';
  sg53.ColWidths[5] := 110;
  sg53.Cells[5,1] := 'Nr. Pacientes';

  sg53.Cells[1,2] := 'Esquemas de Adultos';

  sg53.Cells[0,3] := 'a.';
  sg53.Cells[0,4] := 'b.';
  sg53.Cells[0,5] := 'c.';
  sg53.Cells[0,6] := 'd.';
  sg53.Cells[0,7] := 'e.';

  sg53.Cells[1,3] := 'AZT + 3TC + NVP';
  sg53.Cells[1,4] := 'D4T + 3TC + NVP';
  sg53.Cells[1,5] := 'AZT + 3TC + EFV';
  sg53.Cells[1,6] := 'D4T + 3TC + EFV';
  sg53.Cells[1,7] := 'AZT + 3TC + IDV';

  sg53.Cells[3,3] := 'f.';
  sg53.Cells[3,4] := 'g.';
  sg53.Cells[3,5] := 'h.';
  sg53.Cells[3,6] := 'i.';
  sg53.Cells[3,7] := 'j.';

  sg53.Cells[1,8] := 'Esquemas Pediátricos';

  sg53.Cells[0,9] := 'a.';
  sg53.Cells[0,10] := 'b';
  sg53.Cells[0,11] := 'c.';

  sg53.Cells[3,9] := 'd.';
  sg53.Cells[3,10] := 'e.';
  sg53.Cells[3,11] := 'f.';


  //54
  for r:=0 to 6 do
   for c:=0 to 5 do
     sg54.Cells[c,r] := '';

  sg54.RowCount := 6;
  sg54.ColCount := 5;
  sg54.FixedCols := 2;
  sg54.FixedRows := 1;
  sg54.ColWidths[0] := 210;
  sg54.Cells[0,0] := '5.4 Pacientes que sairam da TARV';
  sg54.Cells[2,0] := 'Feminino';
  sg54.Cells[3,0] := 'Masculino';
  sg54.Cells[4,0] := 'Total';


  sg54.Cells[0,1] := '5.4.1 Abandonos';
  sg54.Cells[0,3] := '5.4.2 Transferências';
  sg54.Cells[0,5] := 'Total';

  sg54.ColWidths[1] := 90;
  sg54.Cells[1,1] := 'Crianças';
  sg54.Cells[1,2] := 'Adultos';
  sg54.Cells[1,3] := 'Crianças';
  sg54.Cells[1,4] := 'Adultos';

  //6
  for r:=0 to 6 do
   for c:=0 to 5 do
     sg6.Cells[c,r] := '';

  sg6.RowCount := 6;
  sg6.ColCount := 5;
  sg6.FixedCols := 2;
  sg6.FixedRows := 1;
  sg6.ColWidths[0] := 230;
  sg6.Cells[0,0] := 'Situação em relação a TARV';
  sg6.Cells[1,0] := 'Faixa etária';
  sg6.Cells[2,0] := 'Feminino';
  sg6.Cells[3,0] := 'Masculino';

  sg6.ColWidths[4] := 120;
  sg6.Cells[4,0] := 'Total Geral de Óbito';

  sg6.Cells[0,1] := '6.1 Paciente já fez o uso do TARV';
  sg6.Cells[0,3] := '6.2 Paciente NÃO fez o uso do TARV';
  sg6.Cells[0,5] := 'Total de Óbito';

  sg6.ColWidths[1] := 110;
  sg6.Cells[1,1] := 'Crianças';
  sg6.Cells[1,2] := 'Adultos';
  sg6.Cells[1,3] := 'Crianças';
  sg6.Cells[1,4] := 'Adultos';

  end;

procedure TfrmCadPrograma.FormShow(Sender: TObject);
begin
  inherited;
  qyGrid.Open;
  CriaGrid;
  PageControl1.ActivePageIndex := 0;
  PageControl2.ActivePageIndex := 0;
end;

procedure TfrmCadPrograma.btgravarClick(Sender: TObject);
var sOP,sOperacao:String;
begin
  if bConsolidado then
  begin
    MessageDlg('Dados em modo de consolidação, não podem ser modificados!',mtInformation,[mbOK],0);
  end
  else
  begin

    if (dmGeral.TB_PROGRAMA.State = dsEdit) then sOP := 'A';
    if (dmGeral.TB_PROGRAMA.State = dsInsert) then sOP := 'I';

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
      sArq := sPathConsulta+'RelatorioPROG'+FormatDateTime('ddmmyyhhnnss',now)+'.xml';
      GeraXML;
      dmGeral.ProtocolaEnvio(dmGeral.TB_PROGRAMA, cvPROG, sOP, sArq);
    finally
      if FileExists(sArq) then
        DeleteFile(sArq);
    end;

    pgGeral.ActivePageIndex := 1;
    PageControl1.ActivePageIndex := 0;
  end;
end;

procedure TfrmCadPrograma.Varregrid;
var i, nRegistro:integer;
    cdUnidade, cdProvincia, cdMunicipio:Integer;
    sMesAno:String;
begin

  cdProvincia := strtoint(leProvincia.LookupValue);
  sMesAno := cbMesAno.Text;

  if leMunicipio.Text <> '' then
    cdMunicipio := strtoint(leMunicipio.LookupValue);

  if leUnidade.Text <> '' then
    cdUnidade := strtoint(leUnidade.LookupValue);

  nRegistro := dm.GeraCodigo('GEN_REGISTRO_GERAL');


  try
    for i:=1 to 12 do
    begin

       if not (dmGeral.TB_PROGRAMA.State in [dsEdit,dsInsert]) then
       begin
        dmGeral.TB_PROGRAMA.Insert;
        dmGeral.TB_PROGRAMA.FieldByName('CD_UNIDADE').AsInteger := cdUnidade;
        dmGeral.TB_PROGRAMA.FieldByName('CD_PROVINCIA').AsInteger := cdProvincia;
        dmGeral.TB_PROGRAMA.FieldByName('CD_MUNICIPIO').AsInteger := cdMunicipio;
        dmGeral.TB_PROGRAMA.FieldByName('VL_MESANO').AsString := sMesAno;
        dmGeral.TB_PROGRAMA.FieldByName('DT_REGISTRO').AsDateTime := dm.GetDateTime;
		    dmGeral.TB_PROGRAMA.FieldByName('CD_REGISTRO_GERAL').AsInteger := nRegistro;
       end;

       //sg1
       begin
         if (i in [2,4,5,8,9]) then
         begin
           dmGeral.TB_PROGRAMA.FieldByName('VL_Y_1').AsInteger := i;

           //Gestante
           if (i in [2]) then dmGeral.TB_PROGRAMA.FieldByName('FL_GESTANTE').AsInteger := cvFlSim;

           //Define Faixa Etaria
           if (i in [4,5]) then dmGeral.TB_PROGRAMA.FieldByName('ID_FAIXA_ETARIA_1').AsInteger := cvFaixaEtaria6;
           if (i in [8,9]) then dmGeral.TB_PROGRAMA.FieldByName('ID_FAIXA_ETARIA_1').AsInteger := cvFaixaEtaria16;

           //sexo
           if (i in [4,8]) then dmGeral.TB_PROGRAMA.FieldByName('FL_SEXO').AsString := cvFeminino;
           if (i in [5,9]) then dmGeral.TB_PROGRAMA.FieldByName('FL_SEXO').AsString := cvMasculino;

           dmGeral.TB_PROGRAMA.FieldByName('VL_ACONSELHADOS').AsString := sg1.Cells[2,i];
           dmGeral.TB_PROGRAMA.FieldByName('VL_POSITIVOS').AsString := sg1.Cells[3,i];
           dmGeral.TB_PROGRAMA.FieldByName('VL_NEGATIVOS').AsString := sg1.Cells[4,i];
           dmGeral.TB_PROGRAMA.FieldByName('VL_INDETERMINADOS').AsString := sg1.Cells[5,i];

         end;
       end;

       //sg2
       begin
         if (i in [2,3,4,5,6,7,8,9,10]) then
         begin
           dmGeral.TB_PROGRAMA.FieldByName('VL_Y_2').AsInteger := i;

           //Define Faixa Etaria
           if (i in [2]) then dmGeral.TB_PROGRAMA.FieldByName('ID_FAIXA_ETARIA_2').AsInteger := cvFaixaEtaria7;
           if (i in [3]) then dmGeral.TB_PROGRAMA.FieldByName('ID_FAIXA_ETARIA_2').AsInteger := cvFaixaEtaria8;
           if (i in [4]) then dmGeral.TB_PROGRAMA.FieldByName('ID_FAIXA_ETARIA_2').AsInteger := cvFaixaEtaria9;
           if (i in [5]) then dmGeral.TB_PROGRAMA.FieldByName('ID_FAIXA_ETARIA_2').AsInteger := cvFaixaEtaria10;
           if (i in [6]) then dmGeral.TB_PROGRAMA.FieldByName('ID_FAIXA_ETARIA_2').AsInteger := cvFaixaEtaria11;
           if (i in [7]) then dmGeral.TB_PROGRAMA.FieldByName('ID_FAIXA_ETARIA_2').AsInteger := cvFaixaEtaria12;
           if (i in [8]) then dmGeral.TB_PROGRAMA.FieldByName('ID_FAIXA_ETARIA_2').AsInteger := cvFaixaEtaria13;
           if (i in [9]) then dmGeral.TB_PROGRAMA.FieldByName('ID_FAIXA_ETARIA_2').AsInteger := cvFaixaEtaria14;
           if (i in [10]) then dmGeral.TB_PROGRAMA.FieldByName('ID_FAIXA_ETARIA_2').AsInteger := cvFaixaEtaria15;

           dmGeral.TB_PROGRAMA.FieldByName('VL_FEMININO_2').AsString := sg2.Cells[2,i];
           dmGeral.TB_PROGRAMA.FieldByName('VL_MASCULINO_2').AsString := sg2.Cells[3,i];

         end;
       end;


       //sg3
       begin
         if (i in [1,2,3,4,5,6,7,8,9,10,11]) then
         begin
           dmGeral.TB_PROGRAMA.FieldByName('VL_Y_3').AsInteger := i;

           //Define Faixa Etaria
           if (i in [2]) then dmGeral.TB_PROGRAMA.FieldByName('ID_FAIXA_ETARIA_3').AsInteger := cvFaixaEtaria17;
           if (i in [3]) then dmGeral.TB_PROGRAMA.FieldByName('ID_FAIXA_ETARIA_3').AsInteger := cvFaixaEtaria6;

           dmGeral.TB_PROGRAMA.FieldByName('VL_GESTANTE_3').AsString := sg3.Cells[3,i];
           dmGeral.TB_PROGRAMA.FieldByName('VL_POS_PARTO_3').AsString := sg3.Cells[4,i];

         end;
       end;

       //sg4
       begin
         if (i in [1,2,3]) then
         begin

           dmGeral.TB_PROGRAMA.FieldByName('VL_Y_4').AsInteger := i;

           dmGeral.TB_PROGRAMA.FieldByName('VL_TARV_4').AsString := sg4.Cells[1,i];
         end;
       end;

       //sg51
       begin
         if (i in [1,2,3]) then
         begin

           dmGeral.TB_PROGRAMA.FieldByName('VL_Y_51').AsInteger := i;

           dmGeral.TB_PROGRAMA.FieldByName('VL_TARV_51').AsString := sg51.Cells[1,i];
         end;
       end;

       //sg52
       begin
         if (i in [2,3,4,5,6,7,8,9,10]) then
         begin
           dmGeral.TB_PROGRAMA.FieldByName('VL_Y_52').AsInteger := i;

           //Define Faixa Etaria
           if (i in [2]) then dmGeral.TB_PROGRAMA.FieldByName('ID_FAIXA_ETARIA_52').AsInteger := cvFaixaEtaria7;
           if (i in [3]) then dmGeral.TB_PROGRAMA.FieldByName('ID_FAIXA_ETARIA_52').AsInteger := cvFaixaEtaria8;
           if (i in [4]) then dmGeral.TB_PROGRAMA.FieldByName('ID_FAIXA_ETARIA_52').AsInteger := cvFaixaEtaria9;
           if (i in [5]) then dmGeral.TB_PROGRAMA.FieldByName('ID_FAIXA_ETARIA_52').AsInteger := cvFaixaEtaria10;
           if (i in [6]) then dmGeral.TB_PROGRAMA.FieldByName('ID_FAIXA_ETARIA_52').AsInteger := cvFaixaEtaria11;
           if (i in [7]) then dmGeral.TB_PROGRAMA.FieldByName('ID_FAIXA_ETARIA_52').AsInteger := cvFaixaEtaria12;
           if (i in [8]) then dmGeral.TB_PROGRAMA.FieldByName('ID_FAIXA_ETARIA_52').AsInteger := cvFaixaEtaria13;
           if (i in [9]) then dmGeral.TB_PROGRAMA.FieldByName('ID_FAIXA_ETARIA_52').AsInteger := cvFaixaEtaria14;
           if (i in [10]) then dmGeral.TB_PROGRAMA.FieldByName('ID_FAIXA_ETARIA_52').AsInteger := cvFaixaEtaria15;

           dmGeral.TB_PROGRAMA.FieldByName('VL_FEMININO_52').AsString := sg52.Cells[2,i];
           dmGeral.TB_PROGRAMA.FieldByName('VL_MASCULINO_52').AsString := sg52.Cells[3,i];

         end;
       end;

       //sg53
       begin
         if (i in [2,3,4,5,6,7,8,9,10,11]) then
         begin
           dmGeral.TB_PROGRAMA.FieldByName('VL_Y_53').AsInteger := i;

           dmGeral.TB_PROGRAMA.FieldByName('VL_ESQUEMA1_53').AsString := sg53.Cells[1,i];
           dmGeral.TB_PROGRAMA.FieldByName('VL_NR1_53').AsString := sg53.Cells[2,i];
           dmGeral.TB_PROGRAMA.FieldByName('VL_ESQUEMA2_53').AsString := sg53.Cells[4,i];
           dmGeral.TB_PROGRAMA.FieldByName('VL_NR2_53').AsString := sg53.Cells[5,i];

         end;
       end;

       //sg54
       begin
         if (i in [1,2,3,4]) then
         begin
           dmGeral.TB_PROGRAMA.FieldByName('VL_Y_54').AsInteger := i;

           dmGeral.TB_PROGRAMA.FieldByName('VL_FEMININO_54').AsString := sg54.Cells[2,i];
           dmGeral.TB_PROGRAMA.FieldByName('VL_MASCULINO_54').AsString := sg54.Cells[3,i];

         end;
       end;

       //sg6
       begin
         if (i in [1,2,3,4]) then
         begin
           dmGeral.TB_PROGRAMA.FieldByName('VL_Y_6').AsInteger := i;

           dmGeral.TB_PROGRAMA.FieldByName('VL_FEMININO_6').AsString := sg6.Cells[2,i];
           dmGeral.TB_PROGRAMA.FieldByName('VL_MASCULINO_6').AsString := sg6.Cells[3,i];

         end;
       end;

       dmGeral.TB_PROGRAMA.Post;
    end;
    except
    begin
      MessageDlg('Os dados não foram inseridos corretamente.'+ #10#13 + 'Favor verificar o Cadastro, e incluir novamente',mtWarning,  [mbOK],0);
      dmGeral.TB_PROGRAMA.Cancel;
    end;
  end;
end;

procedure TfrmCadPrograma.AbreConsultas;
begin
  PSQL := qyProvincia.sql.text;
  MSQL := qyMunicipio.sql.text;
  USQL := qyUnidade.sql.text;
  qyProvincia.Open;
  qyMunicipio.Open;
  qyUnidade.Open;
end;

procedure TfrmCadPrograma.FechaConsultas;
begin
  qyProvincia.Close;
  qyMunicipio.Close;
  qyUnidade.Close;
end;

procedure TfrmCadPrograma.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  FechaConsultas;
  //dmGeral.TB_PROGRAMA.SelectSQL.Text := sSQLPrograma;
end;

procedure TfrmCadPrograma.FormCreate(Sender: TObject);
begin
  nRelatorio := cvPROG;
  inherited;
  FbPermiteMudarPagina := False;
  AbreConsultas;
  CarregaComboMesAno;
  bCarregaGrid := True;
  sSQLPrograma := dmGeral.TB_PROGRAMA.SelectSQL.Text;
  sNomeTabela := 'VW_REGISTRO_PROGRAMA';
  chave := 0;
end;

procedure TfrmCadPrograma.CarregaDemo;
var i,j,x:integer;
begin
{
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
}

end;

procedure TfrmCadPrograma.CarregaComboMesAno;
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

procedure TfrmCadPrograma.btConsultarClick(Sender: TObject);
var sSQLWhere, sSQL, sW, sTipo:String; nB,nE:Integer;
    lstTipo:TStringList;
begin
  inherited;
  if (dmGeral.TB_PROGRAMA.State in [dsEdit, dsInsert]) then
    Exit;
  lstTipo := TStringList.Create;
  dmGeral.TB_PROGRAMA.Close;
  dmGeral.TB_PROGRAMA.SelectSQL.Text := sSQLPrograma;
  sSQL := sSQLPrograma;
  if ckConsolidar.Checked then
  begin
    sSQLWhere := '';
    sW := ' where ';

    //****** Tipo *****
    sTipo := '';
    lstTipo.Clear;

    if ckTARV.Checked then
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
      BEGIN
        ProgressBar1.Visible := true;
        ProgressBar1.Position := 0;
        lstTipo.Add(QuotedStr('NTF'));
        ProgressBar1.Position := 10;
        lstTipo.Add(QuotedStr('NTA'));
        ProgressBar1.Position := 20;
        lstTipo.Add(QuotedStr('NTP'));
        ProgressBar1.Position := 30;
        lstTipo.Add(QuotedStr('ABD'));
        ProgressBar1.Position := 40;
        lstTipo.Add(QuotedStr('TRA'));
        ProgressBar1.Position := 50;
        lstTipo.Add(QuotedStr('OBT'));
        ProgressBar1.Position := 60;
      END;
      //sTipo := sTipo + ',' + QuotedStr('NTF');
      ProgressBar1.Position := 70;
    sTipo := lstTipo.DelimitedText;
    if (sTipo<>'') then
    begin
      sTipo := ' TIPO in (' + sTipo + ')';
      sSQLWhere := sW + sTipo;
      sW := ' and ';
    end;
    lstTipo.Free;
    //****** Tipo *****

    if leUnidade.LookupValue <> '' then
    begin
      sSQLWhere := sSQLWhere + sW + 'CD_UNIDADE = :CD_UNIDADE';
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

    sSQL := StringReplace(sSQL, 'from "REGISTRO_PROGRAMA"', 'from '+sNomeTabela+' REGISTRO_PROGRAMA',[]);
    sSQL := StringReplace(sSQL, '/*CAMPOS*/',
            ',"REGISTRO_PROGRAMA"."VL_GESTANTE_32"   ' +
            ',"REGISTRO_PROGRAMA"."VL_POS_PARTO_32"  ' +
            ',"REGISTRO_PROGRAMA"."VL_PARTOS_32"     ' +
            ',"REGISTRO_PROGRAMA"."VL_X_32"          ' +
            ',"REGISTRO_PROGRAMA"."VL_Y_32"          ' +
            ',"REGISTRO_PROGRAMA"."VL_GESTANTE_33"   ' +
            ',"REGISTRO_PROGRAMA"."VL_POS_PARTO_33"  ' +
            ',"REGISTRO_PROGRAMA"."VL_PARTOS_33"     ' +
            ',"REGISTRO_PROGRAMA"."VL_X_33"          ' +
            ',"REGISTRO_PROGRAMA"."VL_Y_33"          ' +
            ',"REGISTRO_PROGRAMA"."VL_TERAPIA"       ' +
            ',"REGISTRO_PROGRAMA"."VL_Y_33a1"        ' +
            ',"REGISTRO_PROGRAMA"."VL_TERAPIA_NENHUM"' +
            ',"REGISTRO_PROGRAMA"."VL_Y_33a2"        ' +
            ',"REGISTRO_PROGRAMA"."TIPO"             ' , []);

    SetSQLWhere(sSQL, sSQLWhere);
    dmGeral.TB_PROGRAMA.SelectSQL.Text := sSQL;

    if (trim(cbMesAno.Text) <> '/') and (trim(cbAte.Text) <> '/') then
    begin
      dmGeral.TB_PROGRAMA.ParamByName('de').AsString := FormatDateTime('mm/dd/yyyy',(StrToDate('01/'+cbMesAno.text)));
      dmGeral.TB_PROGRAMA.ParamByName('ate').AsString := FormatDateTime('mm/dd/yyyy',(StrToDate('01/'+cbAte.text)));
    end;


    bConsolidado := true;
  end
  else
  begin
    sSQL := StringReplace(sSQL, 'from "REGISTRO_PROGRAMA"', 'from '+sNomeTabela+' REGISTRO_PROGRAMA',[]);
    dmGeral.TB_PROGRAMA.SelectSQL.Text := sSQL;
    bConsolidado := false;
  end;


  if leProvincia.LookupValue <> '' then
    dmGeral.TB_PROGRAMA.ParamByName('CD_PROVINCIA').AsInteger := strtoint(leProvincia.LookupValue)
      else if not ckConsolidar.Checked then
   begin
     MessageDlg('É necessário informar Provincia!',mtInformation,[mbOK],0);
     leProvincia.SetFocus;
     Abort;
   end;

  if not ckConsolidar.Checked then

  if cbMesAno.Text <> '' then
      dmGeral.TB_PROGRAMA.ParamByName('VL_MESANO').AsString := cbMesAno.Text
  else
   begin
     MessageDlg('É necessário informar Mes/Ano De:!',mtInformation,[mbOK],0);
     cbMesAno.SetFocus;
     Abort;
   end;

  if leMunicipio.LookupValue <> '' then
    dmGeral.TB_PROGRAMA.ParamByName('CD_MUNICIPIO').AsInteger := strtoint(leMunicipio.LookupValue)
      else if not ckConsolidar.Checked then
   begin
      if MessageDlg('O Municipio não foi informada, '#13#10'deseja continuar?',mtConfirmation,
          [mbYes,mbNo],0) = mrNo then
        begin
         leMunicipio.SetFocus;
         Abort;
        end;
   end;

  if leUnidade.LookupValue <> '' then
    dmGeral.TB_PROGRAMA.ParamByName('CD_UNIDADE').AsInteger := strtoint(leUnidade.LookupValue)
      else if not ckConsolidar.Checked then
   begin
      if MessageDlg('A Unidade não foi informada, '#13#10'deseja continuar?',mtConfirmation,
          [mbYes,mbNo],0) = mrNo then
        begin
          leUnidade.SetFocus;
          Abort;
        end;
   end;

  ProgressBar1.Position := 80;
  dmGeral.TB_PROGRAMA.Open;
  ProgressBar1.Position := 90;
  CarregaGrid(dmGeral.TB_PROGRAMA);
  CalculaTotalSg4;
  CalculaTotalSg51;
  ProgressBar1.Position := 100;
  ProgressBar1.Visible := false;

end;

procedure TfrmCadPrograma.CarregaGrid(TB_PROGRAMA:TDataSet);
var rAux:real;
begin
    CriaGrid;
    //TB_PROGRAMA.Fields.Clear;
    while Not TB_PROGRAMA.Eof do
    begin
      //sg1
      if TB_PROGRAMA.FieldByName('VL_y_1').AsString <> '' then
      begin

        raux := valor(sg1.Cells[2,TB_PROGRAMA.FieldByName('VL_y_1').AsInteger]) +
                valor(TB_PROGRAMA.FieldByName('VL_ACONSELHADOS').AsString);
        sg1.Cells[2,TB_PROGRAMA.FieldByName('VL_y_1').AsInteger] := floattostr(raux);

        raux := valor(sg1.Cells[3,TB_PROGRAMA.FieldByName('VL_y_1').AsInteger]) +
                valor(TB_PROGRAMA.FieldByName('VL_POSITIVOS').AsString);
        sg1.Cells[3,TB_PROGRAMA.FieldByName('VL_y_1').AsInteger] := floattostr(raux);

        raux := valor(sg1.Cells[4,TB_PROGRAMA.FieldByName('VL_y_1').AsInteger]) +
                valor(TB_PROGRAMA.FieldByName('VL_NEGATIVOS').AsString);
        sg1.Cells[4,TB_PROGRAMA.FieldByName('VL_y_1').AsInteger] := floattostr(raux);

        raux := valor(sg1.Cells[5,TB_PROGRAMA.FieldByName('VL_y_1').AsInteger]) +
                valor(TB_PROGRAMA.FieldByName('VL_INDETERMINADOS').AsString);
        sg1.Cells[5,TB_PROGRAMA.FieldByName('VL_y_1').AsInteger] := floattostr(raux);

      end;
      TB_PROGRAMA.Next;
    end;

    TB_PROGRAMA.First;
    while Not TB_PROGRAMA.Eof do
    begin
      //sg2
      if TB_PROGRAMA.FieldByName('VL_y_2').AsString <> '' then
      begin

        raux := valor(sg2.Cells[2,TB_PROGRAMA.FieldByName('VL_y_2').AsInteger]) +
                valor(TB_PROGRAMA.FieldByName('VL_FEMININO_2').AsString);
        sg2.Cells[2,TB_PROGRAMA.FieldByName('VL_y_2').AsInteger] := floattostr(raux);

        raux := valor(sg2.Cells[3,TB_PROGRAMA.FieldByName('VL_y_2').AsInteger]) +
                valor(TB_PROGRAMA.FieldByName('VL_MASCULINO_2').AsString);
        sg2.Cells[3,TB_PROGRAMA.FieldByName('VL_y_2').AsInteger] := floattostr(raux);

      end;
      TB_PROGRAMA.Next;
    end;

    TB_PROGRAMA.First;
    while Not TB_PROGRAMA.Eof do
    begin
      //sg3
      if TB_PROGRAMA.FieldByName('VL_y_3') <> nil then
      begin

        if (TB_PROGRAMA.FieldByName('VL_y_3').AsString <> '') then
        begin

          if (TB_PROGRAMA.FieldByName('VL_y_3').AsInteger in [3]) then
          begin
            //Total 3.2 em 3.1
            raux := valor(sg3.Cells[3,2]) +
                    valor(TB_PROGRAMA.FieldByName('VL_GESTANTE_3').AsString);
            sg3.Cells[3,1] := floattostr(raux);

            //Total 3.2 em 3.1
            raux := valor(sg3.Cells[4,2]) +
                    valor(TB_PROGRAMA.FieldByName('VL_PARTOS_3').AsString) +
                    valor(TB_PROGRAMA.FieldByName('VL_POS_PARTO_3').AsString);
            sg3.Cells[4,1] := floattostr(raux);
          end;

          //Dados
          raux := valor(sg3.Cells[3,TB_PROGRAMA.FieldByName('VL_y_3').AsInteger]) +
                  valor(TB_PROGRAMA.FieldByName('VL_GESTANTE_3').AsString);
          sg3.Cells[3,TB_PROGRAMA.FieldByName('VL_y_3').AsInteger] := floattostr(raux);

          raux := valor(sg3.Cells[4,TB_PROGRAMA.FieldByName('VL_y_3').AsInteger]) +
                  valor(TB_PROGRAMA.FieldByName('VL_PARTOS_3').AsString) +
                  valor(TB_PROGRAMA.FieldByName('VL_POS_PARTO_3').AsString);
          sg3.Cells[4,TB_PROGRAMA.FieldByName('VL_y_3').AsInteger] := floattostr(raux);
        end;

      end;

      //sg3.2
      if TB_PROGRAMA.FindField('VL_y_32') <> nil then
      begin
        if TB_PROGRAMA.FieldByName('VL_y_32').AsString <> '' then
        begin

          //Total 3.2 em 3.1
          raux := valor(sg3.Cells[3,1]) +
                valor(TB_PROGRAMA.FieldByName('VL_GESTANTE_32').AsString);
          sg3.Cells[3,1] := floattostr(raux);

          //Total 3.2 em 3.1
          raux := valor(sg3.Cells[4,1]) +
                  valor(TB_PROGRAMA.FieldByName('VL_PARTOS_32').AsString) +
                  valor(TB_PROGRAMA.FieldByName('VL_POS_PARTO_32').AsString);
          sg3.Cells[4,1] := floattostr(raux);

          //Valores por faixa etaria
          raux := valor(sg3.Cells[3,TB_PROGRAMA.FieldByName('VL_y_32').AsInteger]) +
                  valor(TB_PROGRAMA.FieldByName('VL_GESTANTE_32').AsString);
          sg3.Cells[3,TB_PROGRAMA.FieldByName('VL_y_32').AsInteger] := floattostr(raux);

          raux := valor(sg3.Cells[4,TB_PROGRAMA.FieldByName('VL_y_32').AsInteger]) +
                  valor(TB_PROGRAMA.FieldByName('VL_PARTOS_32').AsString) +
                  valor(TB_PROGRAMA.FieldByName('VL_POS_PARTO_32').AsString);
          sg3.Cells[4,TB_PROGRAMA.FieldByName('VL_y_32').AsInteger] := floattostr(raux);

        end;
      end;

      //sg3.3
      if TB_PROGRAMA.FindField('VL_y_33') <> nil then
      begin
        if TB_PROGRAMA.FieldByName('VL_y_33').AsString <> '' then
        begin

          raux := valor(sg3.Cells[3,TB_PROGRAMA.FieldByName('VL_y_33').AsInteger]) +
                  valor(TB_PROGRAMA.FieldByName('VL_GESTANTE_33').AsString);
          sg3.Cells[3,TB_PROGRAMA.FieldByName('VL_y_33').AsInteger] := floattostr(raux);

          raux := valor(sg3.Cells[4,TB_PROGRAMA.FieldByName('VL_y_33').AsInteger]) +
                  valor(TB_PROGRAMA.FieldByName('VL_PARTOS_33').AsString) +
                  valor(TB_PROGRAMA.FieldByName('VL_POS_PARTO_33').AsString);
          sg3.Cells[4,TB_PROGRAMA.FieldByName('VL_y_33').AsInteger] := floattostr(raux);

        end;
      end;

      //sg3.3a
      if TB_PROGRAMA.FindField('VL_y_33a1') <> nil then
      begin
        if TB_PROGRAMA.FieldByName('VL_y_33a1').AsString <> '' then
        begin
          raux := valor(sg3.Cells[4,TB_PROGRAMA.FieldByName('VL_y_33a1').AsInteger]) +
                  valor(TB_PROGRAMA.FieldByName('VL_TERAPIA').AsString);
          sg3.Cells[4,TB_PROGRAMA.FieldByName('VL_y_33a1').AsInteger] := floattostr(raux);
        end;
      end;

      //sg3.3b
      if TB_PROGRAMA.FindField('VL_y_33a2') <> nil then
      begin
        if TB_PROGRAMA.FieldByName('VL_y_33a2').AsString <> '' then
        begin
          raux := valor(sg3.Cells[4,TB_PROGRAMA.FieldByName('VL_y_33a2').AsInteger]) +
                  valor(TB_PROGRAMA.FieldByName('VL_TERAPIA_NENHUM').AsString);
          sg3.Cells[4,TB_PROGRAMA.FieldByName('VL_y_33a2').AsInteger] := floattostr(raux);
        end;
      end;

      TB_PROGRAMA.Next;
    end;

    TB_PROGRAMA.First;
    while Not TB_PROGRAMA.Eof do
    begin
      //sg4
      if TB_PROGRAMA.FieldByName('VL_y_4').AsString <> '' then
      begin

        raux := valor(sg4.Cells[1,TB_PROGRAMA.FieldByName('VL_y_4').AsInteger]) +
                valor(TB_PROGRAMA.FieldByName('VL_TARV_4').AsString);
        sg4.Cells[1,TB_PROGRAMA.FieldByName('VL_y_4').AsInteger] := floattostr(raux);

      end;
      TB_PROGRAMA.Next;
    end;

    TB_PROGRAMA.First;
    while Not TB_PROGRAMA.Eof do
    begin
      //sg51
      if TB_PROGRAMA.FieldByName('VL_y_51').AsString <> '' then
      begin

        raux := valor(sg51.Cells[1,TB_PROGRAMA.FieldByName('VL_y_51').AsInteger]) +
                valor(TB_PROGRAMA.FieldByName('VL_TARV_51').AsString);
        sg51.Cells[1,TB_PROGRAMA.FieldByName('VL_y_51').AsInteger] := floattostr(raux);

      end;
      TB_PROGRAMA.Next;
    end;

    TB_PROGRAMA.First;
    while Not TB_PROGRAMA.Eof do
    begin
      //sg52
      if TB_PROGRAMA.FieldByName('VL_y_52').AsString <> '' then
      begin

        raux := valor(sg52.Cells[2,TB_PROGRAMA.FieldByName('VL_y_52').AsInteger]) +
                valor(TB_PROGRAMA.FieldByName('VL_FEMININO_52').AsString);
        sg52.Cells[2,TB_PROGRAMA.FieldByName('VL_y_52').AsInteger] := floattostr(raux);

        raux := valor(sg52.Cells[3,TB_PROGRAMA.FieldByName('VL_y_52').AsInteger]) +
                valor(TB_PROGRAMA.FieldByName('VL_MASCULINO_52').AsString);
        sg52.Cells[3,TB_PROGRAMA.FieldByName('VL_y_52').AsInteger] := floattostr(raux);

      end;
      TB_PROGRAMA.Next;
    end;

    TB_PROGRAMA.First;
    while Not TB_PROGRAMA.Eof do
    begin
      //sg53
      if TB_PROGRAMA.FieldByName('VL_y_53').AsString <> '' then
      begin

        raux := valor(sg53.Cells[2,TB_PROGRAMA.FieldByName('VL_y_53').AsInteger]) +
                valor(TB_PROGRAMA.FieldByName('VL_NR1_53').AsString);
        sg53.Cells[2,TB_PROGRAMA.FieldByName('VL_y_53').AsInteger] := floattostr(raux);

        raux := valor(sg53.Cells[5,TB_PROGRAMA.FieldByName('VL_y_53').AsInteger]) +
                valor(TB_PROGRAMA.FieldByName('VL_NR2_53').AsString);
        sg53.Cells[5,TB_PROGRAMA.FieldByName('VL_y_53').AsInteger] := floattostr(raux);

      end;
      TB_PROGRAMA.Next;
    end;

    TB_PROGRAMA.First;
    while Not TB_PROGRAMA.Eof do
    begin
      //sg54
      if TB_PROGRAMA.FieldByName('VL_y_54').AsString <> '' then
      begin

        raux := valor(sg54.Cells[2,TB_PROGRAMA.FieldByName('VL_y_54').AsInteger]) +
                valor(TB_PROGRAMA.FieldByName('VL_FEMININO_54').AsString);
        sg54.Cells[2,TB_PROGRAMA.FieldByName('VL_y_54').AsInteger] := floattostr(raux);

        raux := valor(sg54.Cells[3,TB_PROGRAMA.FieldByName('VL_y_54').AsInteger]) +
                valor(TB_PROGRAMA.FieldByName('VL_MASCULINO_54').AsString);
        sg54.Cells[3,TB_PROGRAMA.FieldByName('VL_y_54').AsInteger] := floattostr(raux);

      end;
      TB_PROGRAMA.Next;
    end;

    TB_PROGRAMA.First;
    while Not TB_PROGRAMA.Eof do
    begin
      //sg6
      if TB_PROGRAMA.FieldByName('VL_y_6').AsString <> '' then
      begin

        raux := valor(sg6.Cells[2,TB_PROGRAMA.FieldByName('VL_y_6').AsInteger]) +
                valor(TB_PROGRAMA.FieldByName('VL_FEMININO_6').AsString);
        sg6.Cells[2,TB_PROGRAMA.FieldByName('VL_y_6').AsInteger] := floattostr(raux);

        raux := valor(sg6.Cells[3,TB_PROGRAMA.FieldByName('VL_y_6').AsInteger]) +
                valor(TB_PROGRAMA.FieldByName('VL_MASCULINO_6').AsString);
        sg6.Cells[3,TB_PROGRAMA.FieldByName('VL_y_6').AsInteger] := floattostr(raux);

      end;
      TB_PROGRAMA.Next;
    end;

    CalculaTotalsg1;
    CalculaTotalsg2;
    CalculaTotalSg3;
    CalculaTotalsg52;
    CalculaTotalsg54;
    CalculaTotalsg6;
end;

procedure TfrmCadPrograma.btexcluirClick(Sender: TObject);
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
      dmGeral.TB_PROGRAMA.Close;
      if leUnidade.LookupValue <> '' then
        dmGeral.TB_PROGRAMA.ParamByName('CD_UNIDADE').AsInteger := strtoint(leUnidade.LookupValue);
      if leProvincia.LookupValue <> '' then
        dmGeral.TB_PROGRAMA.ParamByName('CD_PROVINCIA').AsInteger := strtoint(leProvincia.LookupValue);
      if leMunicipio.LookupValue <> '' then
        dmGeral.TB_PROGRAMA.ParamByName('CD_MUNICIPIO').AsInteger := strtoint(leMunicipio.LookupValue);
      dmGeral.TB_PROGRAMA.ParamByName('VL_MESANO').AsString := cbMesAno.Text;
      dmGeral.TB_PROGRAMA.Open;

      {
      dmGeral.TB_PROGRAMA.First;
      while not dmGeral.TB_PROGRAMA.Eof do
        dmGeral.TB_PROGRAMA.Delete;

      dmGeral.TB_PROGRAMA.Close; dmGeral.TB_PROGRAMA.Open;
      if bCarregaGrid then
        CarregaGrid(DMGERAL.TB_PROGRAMA);}

      //Protocolo
      try
        sArq := sPathConsulta+'RelatorioPROG'+FormatDateTime('ddmmyyhhnnss',now)+'.xml';
        GeraXML;
        dmGeral.ProtocolaEnvio(dmGeral.TB_PROGRAMA, cvPROG, 'E', sArq);
      finally
        if FileExists(sArq) then
          DeleteFile(sArq);
      end;

      Inherited;
    end;
  end;

end;

procedure TfrmCadPrograma.CalculaTotalSg1;
var r,c:integer; tl,tc,tg:real;
begin

  //sg1
  for c:=2 to 12 do
  begin
      tc :=
         Valor(sg1.Cells[c,4]) +
         Valor(sg1.Cells[c,5]);
      sg1.Cells[c,6] := FloatToStr(tc);
  end;

  for c:=2 to 12 do
  begin
      tc :=
         Valor(sg1.Cells[c,8]) +
         Valor(sg1.Cells[c,9]);
      sg1.Cells[c,10] := FloatToStr(tc);
  end;

  for c:=2 to 12 do
  begin
      tg :=
         Valor(sg1.Cells[c,2]) +
         Valor(sg1.Cells[c,4]) +
         Valor(sg1.Cells[c,5]) +
         Valor(sg1.Cells[c,8]) +
         Valor(sg1.Cells[c,9]);
      sg1.Cells[c,11] := FloatToStr(tg);
  end;

end;

procedure TfrmCadPrograma.CalculaTotalSg4;
var r,c:integer; tl,tc,tg:real;
begin

  for c:=1 to 1 do
  begin
      tc :=
         Valor(sg4.Cells[c,2]) +
         Valor(sg4.Cells[c,3]);
      sg4.Cells[c,1] := FloatToStr(tc);
  end;

end;

procedure TfrmCadPrograma.CalculaTotalSg51;
var r,c:integer; tl,tc,tg:real;
begin

  for c:=1 to 1 do
  begin
      tc := Valor(sg51.Cells[c,2]) + Valor(sg51.Cells[c,3]);
      //tc := Valor(sg51.Cells[c,2]);
      sg51.Cells[c,1] := FloatToStr(tc);
  end;


end;

procedure TfrmCadPrograma.CalculaTotalSg2;
var r,c:integer; tl,tc,tg:real;
begin
  //sg2
  for r:=2 to 11 do
  begin
    if r in [2,3,4,5,6,7,8,9,10] then
    begin
        tl :=
           Valor(sg2.Cells[2,r]) +
           Valor(sg2.Cells[3,r]);
        sg2.Cells[4,r] := FloatToStr(tl);
    end;
  end;

  for c:=2 to 11 do
  begin
      tg :=
         Valor(sg2.Cells[c,2]) +
         Valor(sg2.Cells[c,3]) +
         Valor(sg2.Cells[c,4]) +
         Valor(sg2.Cells[c,5]) +
         Valor(sg2.Cells[c,6]) +
         Valor(sg2.Cells[c,7]) +
         Valor(sg2.Cells[c,8]) +
         Valor(sg2.Cells[c,9]) +
         Valor(sg2.Cells[c,10]);
      sg2.Cells[c,11] := FloatToStr(tg);
  end;

end;



procedure TfrmCadPrograma.CalculaTotalSg52;
var r,c:integer; tl,tc,tg:real;
begin

  //sg52
  for r:=2 to 11 do
  begin
    if r in [2,3,4,5,6,7,8,9,10] then
    begin
        tl :=
           Valor(sg52.Cells[2,r]) +
           Valor(sg52.Cells[3,r]);
        sg52.Cells[4,r] := FloatToStr(tl);
    end;
  end;

  for c:=2 to 11 do
  begin
      tg :=
         Valor(sg52.Cells[c,2]) +
         Valor(sg52.Cells[c,3]) +
         Valor(sg52.Cells[c,4]) +
         Valor(sg52.Cells[c,5]) +
         Valor(sg52.Cells[c,6]) +
         Valor(sg52.Cells[c,7]) +
         Valor(sg52.Cells[c,8]) +
         Valor(sg52.Cells[c,9]) +
         Valor(sg52.Cells[c,10]);
      sg52.Cells[c,11] := FloatToStr(tg);
  end;


end;


procedure TfrmCadPrograma.CalculaTotalSg54;
var r,c:integer; tl,tc,tg:real;
begin

  //sg52
  for r:=1 to 5 do
  begin
    if r in [1,2,3,4,5] then
    begin
        tl :=
           Valor(sg54.Cells[2,r]) +
           Valor(sg54.Cells[3,r]);
        sg54.Cells[4,r] := FloatToStr(tl);
    end;
  end;

  for c:=2 to 5 do
  begin
      tg :=
         Valor(sg54.Cells[c,1]) +
         Valor(sg54.Cells[c,2]) +
         Valor(sg54.Cells[c,3]) +
         Valor(sg54.Cells[c,4]);
      sg54.Cells[c,5] := FloatToStr(tg);
  end;

end;

procedure TfrmCadPrograma.CalculaTotalSg6;
var r,c:integer; tl,tc,tg:real;
begin

  //sg6
  for c:=2 to 6 do
  begin
      tc :=
         Valor(sg6.Cells[c,1]) +
         Valor(sg6.Cells[c,2]) +
         Valor(sg6.Cells[c,3]) +
         Valor(sg6.Cells[c,4]);
      sg6.Cells[c,5] := FloatToStr(tc);
  end;

  for r:=5 to 5 do
  begin
    if r in [5] then
    begin
        tl :=
           Valor(sg6.Cells[2,r]) +
           Valor(sg6.Cells[3,r]);
        sg6.Cells[4,r] := FloatToStr(tl);
    end;
  end;

end;

procedure TfrmCadPrograma.btIncluirClick(Sender: TObject);
begin
  pgGeral.ActivePageIndex := 1;
  PageControl1.ActivePageIndex := 0;
  dmGeral.TB_PROGRAMA.Close;
  dmGeral.TB_PROGRAMA.Open;

  inherited;
  leProvincia.text := '';
  leUnidade.text := '';
  leMunicipio.text := '';
  cbMesAno.ItemIndex := -1;
  ckConsolidar.Checked := false;
  bConsolidado := false;
  CriaGrid;
end;

procedure TfrmCadPrograma.btimprimirClick(Sender: TObject);
begin
  if pgGeral.ActivePageIndex=0 then
  begin
     inherited;
  end
  else
  begin
    frmRelatorioWEB := TfrmRelatorioWEB.Create(application);
    try
      sArq := sPathConsulta+'RelatorioPrograma'+FormatDateTime('ddmmyyhhnnss',now)+'.xml';
      GeraXML;
      frmRelatorioWEB.relatorio.Navigate(sArq);
      frmRelatorioWEB.ShowModal;
    finally
      frmRelatorioWEB.Free;
      if FileExists(sArq) then
        DeleteFile(sArq);
    end;
  end;
end;

procedure TfrmCadPrograma.sg1SetEditText(Sender: TObject; ACol,
  ARow: Integer; const Value: String);
begin
  inherited;
  CalculaTotalSg1;
end;

procedure TfrmCadPrograma.sg2SetEditText(Sender: TObject; ACol,
  ARow: Integer; const Value: String);
begin
  inherited;
  CalculaTotalSg2;
end;

procedure TfrmCadPrograma.sg52SetEditText(Sender: TObject; ACol,
  ARow: Integer; const Value: String);
begin
  inherited;
  CalculaTotalSg52;
end;

procedure TfrmCadPrograma.sg54SetEditText(Sender: TObject; ACol,
  ARow: Integer; const Value: String);
begin
  inherited;
  CalculaTotalSg54;
end;

procedure TfrmCadPrograma.sg6SetEditText(Sender: TObject; ACol,
  ARow: Integer; const Value: String);
begin
  inherited;
  CalculaTotalSg6;
end;

procedure TfrmCadPrograma.sg2DrawCell(Sender: TObject; ACol, ARow: Integer;
  Rect: TRect; State: TGridDrawState);
var Conteudo:String; x,y,hf,hw,t:integer; al:Word; c:TColor;   r:TRect;
begin
  inherited;

  Conteudo := sg2.Cells[ACol,ARow];
  //Valores: Centro
  if ((ARow > 1) and (ACol > 1)) then
  begin
     r := Rect;
     al := SetTextAlign(sg2.Canvas.Handle, TA_CENTER);
     hf := sg2.Canvas.TextHeight('lj');
     sg2.Canvas.FillRect(r);
     x := r.Left + ((r.Right - r.Left)   div 2);
     y := r.Top  - ((r.Top + hf - r.Bottom) div 2);
     sg2.Canvas.TextRect(r,x,y,Conteudo);
     SetTextAlign(sg2.Canvas.Handle, al);
  end;

  //Total: Negrito, Centro, Cor
  if ((ARow in [11]) and (ACol in [2,3]))or
     ((ACol in [4]) and (ARow > 1)) then
  begin
     r := Rect;
     sg2.Canvas.Brush.Color := cl3DLight;
     sg2.Canvas.Font.Style := [fsbold];
     al := SetTextAlign(sg2.Canvas.Handle, TA_CENTER);
     hf := sg2.Canvas.TextHeight('lj');
     sg2.Canvas.FillRect(r);
     x := r.Left + ((r.Right - r.Left)   div 2);
     y := r.Top  - ((r.Top + hf - r.Bottom) div 2);
     sg2.Canvas.TextRect(r,x,y,Conteudo);
     SetTextAlign(sg2.Canvas.Handle, al);
  end;

end;

procedure TfrmCadPrograma.sg3DrawCell(Sender: TObject; ACol, ARow: Integer;
  Rect: TRect; State: TGridDrawState);
var Conteudo:String; x,y,hf,hw,t:integer; al:Word; c:TColor;   r:TRect;
begin
  inherited;
  Conteudo := sg3.Cells[ACol,ARow];
  //Valores: Centro
  if ((ARow > 0) and (ACol > 2)) then
  begin
     r := Rect;
     al := SetTextAlign(sg3.Canvas.Handle, TA_CENTER);
     hf := sg3.Canvas.TextHeight('lj');
     sg3.Canvas.FillRect(r);
     x := r.Left + ((r.Right - r.Left)   div 2);
     y := r.Top  - ((r.Top + hf - r.Bottom) div 2);
     sg3.Canvas.TextRect(r,x,y,Conteudo);
     SetTextAlign(sg3.Canvas.Handle, al);
  end;

  //Total: Negrito, Centro, Cor
  if ((ACol in [3,4]) and (ARow = 4)) or
     ((ACol in [3,4]) and (ARow = 1)) then
  begin
     r := Rect;
     sg3.Canvas.Brush.Color := cl3DLight;
     sg3.Canvas.Font.Style := [fsbold];
     al := SetTextAlign(sg3.Canvas.Handle, TA_CENTER);
     hf := sg3.Canvas.TextHeight('lj');
     sg3.Canvas.FillRect(r);
     x := r.Left + ((r.Right - r.Left)   div 2);
     y := r.Top  - ((r.Top + hf - r.Bottom) div 2);
     sg3.Canvas.TextRect(r,x,y,Conteudo);
     SetTextAlign(sg3.Canvas.Handle, al);
  end;

  

end;

procedure TfrmCadPrograma.sg52DrawCell(Sender: TObject; ACol,
  ARow: Integer; Rect: TRect; State: TGridDrawState);
var Conteudo:String; x,y,hf,hw,t:integer; al:Word; c:TColor;   r:TRect;
begin
  inherited;

  Conteudo := sg52.Cells[ACol,ARow];
  //Valores: Centro
  if ((ARow > 1) and (ACol > 1)) then
  begin
     r := Rect;
     al := SetTextAlign(sg52.Canvas.Handle, TA_CENTER);
     hf := sg52.Canvas.TextHeight('lj');
     sg52.Canvas.FillRect(r);
     x := r.Left + ((r.Right - r.Left)   div 2);
     y := r.Top  - ((r.Top + hf - r.Bottom) div 2);
     sg52.Canvas.TextRect(r,x,y,Conteudo);
     SetTextAlign(sg52.Canvas.Handle, al);
  end;

  //Total: Negrito, Centro, Cor
  if ((ARow in [11]) and (ACol in [2,3]))or
     ((ACol in [4]) and (ARow > 1)) then
  begin
     r := Rect;
     sg52.Canvas.Brush.Color := cl3DLight;
     sg52.Canvas.Font.Style := [fsbold];
     al := SetTextAlign(sg52.Canvas.Handle, TA_CENTER);
     hf := sg52.Canvas.TextHeight('lj');
     sg52.Canvas.FillRect(r);
     x := r.Left + ((r.Right - r.Left)   div 2);
     y := r.Top  - ((r.Top + hf - r.Bottom) div 2);
     sg52.Canvas.TextRect(r,x,y,Conteudo);
     SetTextAlign(sg52.Canvas.Handle, al);
  end;

end;

procedure TfrmCadPrograma.sg53DrawCell(Sender: TObject; ACol,
  ARow: Integer; Rect: TRect; State: TGridDrawState);
var Conteudo:String; x,y,hf,hw,t:integer; al:Word; c:TColor;   r:TRect;
begin
  inherited;

  Conteudo := sg53.Cells[ACol,ARow];
  //Valores: Centro
  if ((ARow > 1) and (ACol > 0)) then
  begin
     r := Rect;
     al := SetTextAlign(sg53.Canvas.Handle, TA_CENTER);
     hf := sg53.Canvas.TextHeight('lj');
     sg53.Canvas.FillRect(r);
     x := r.Left + ((r.Right - r.Left)   div 2);
     y := r.Top  - ((r.Top + hf - r.Bottom) div 2);
     sg53.Canvas.TextRect(r,x,y,Conteudo);
     SetTextAlign(sg53.Canvas.Handle, al);
  end;

  //Total: Negrito, Centro, Cor
  if ((ARow in [2,8]) and (ACol in [0,1,2,3,4,5])) or
     ((ACol in [0,1,3,4]) and (ARow > 2)) then
  begin
     r := Rect;
     sg53.Canvas.Brush.Color := cl3DLight;
     sg53.Canvas.Font.Style := [fsbold];
     al := SetTextAlign(sg53.Canvas.Handle, TA_CENTER);
     hf := sg53.Canvas.TextHeight('lj');
     sg53.Canvas.FillRect(r);
     x := r.Left + ((r.Right - r.Left)   div 2);
     y := r.Top  - ((r.Top + hf - r.Bottom) div 2);
     sg53.Canvas.TextRect(r,x,y,Conteudo);
     SetTextAlign(sg53.Canvas.Handle, al);
  end;

end;

procedure TfrmCadPrograma.sg54DrawCell(Sender: TObject; ACol,
  ARow: Integer; Rect: TRect; State: TGridDrawState);
var Conteudo:String; x,y,hf,hw,t:integer; al:Word; c:TColor;   r:TRect;
begin
  inherited;

  Conteudo := sg54.Cells[ACol,ARow];
  //Valores: Centro
  if ((ARow > 0) and (ACol > 1)) then
  begin
     r := Rect;
     al := SetTextAlign(sg54.Canvas.Handle, TA_CENTER);
     hf := sg54.Canvas.TextHeight('lj');
     sg54.Canvas.FillRect(r);
     x := r.Left + ((r.Right - r.Left)   div 2);
     y := r.Top  - ((r.Top + hf - r.Bottom) div 2);
     sg54.Canvas.TextRect(r,x,y,Conteudo);
     SetTextAlign(sg54.Canvas.Handle, al);
  end;

  //Total: Negrito, Centro, Cor
  if ((ARow in [5]) and (ACol in [2,3]))or
     ((ACol in [4]) and (ARow > 0)) then
  begin
     r := Rect;
     sg54.Canvas.Brush.Color := cl3DLight;
     sg54.Canvas.Font.Style := [fsbold];
     al := SetTextAlign(sg54.Canvas.Handle, TA_CENTER);
     hf := sg54.Canvas.TextHeight('lj');
     sg54.Canvas.FillRect(r);
     x := r.Left + ((r.Right - r.Left)   div 2);
     y := r.Top  - ((r.Top + hf - r.Bottom) div 2);
     sg54.Canvas.TextRect(r,x,y,Conteudo);
     SetTextAlign(sg54.Canvas.Handle, al);
  end;

end;

procedure TfrmCadPrograma.sg6DrawCell(Sender: TObject; ACol, ARow: Integer;
  Rect: TRect; State: TGridDrawState);
var Conteudo:String; x,y,hf,hw,t:integer; al:Word; c:TColor;   r:TRect;
begin
  inherited;

  Conteudo := sg6.Cells[ACol,ARow];
  //Valores: Centro
  if ((ARow > 0) and (ACol > 1)) then
  begin
     r := Rect;
     al := SetTextAlign(sg6.Canvas.Handle, TA_CENTER);
     hf := sg6.Canvas.TextHeight('lj');
     sg6.Canvas.FillRect(r);
     x := r.Left + ((r.Right - r.Left)   div 2);
     y := r.Top  - ((r.Top + hf - r.Bottom) div 2);
     sg6.Canvas.TextRect(r,x,y,Conteudo);
     SetTextAlign(sg6.Canvas.Handle, al);
  end;

  //Total: Negrito, Centro, Cor
  if ((ARow in [5]) and (ACol in [2,3]))or
     ((ACol in [4]) and (ARow > 0)) then
  begin
     r := Rect;
     sg6.Canvas.Brush.Color := cl3DLight;
     sg6.Canvas.Font.Style := [fsbold];
     al := SetTextAlign(sg6.Canvas.Handle, TA_CENTER);
     hf := sg6.Canvas.TextHeight('lj');
     sg6.Canvas.FillRect(r);
     x := r.Left + ((r.Right - r.Left)   div 2);
     y := r.Top  - ((r.Top + hf - r.Bottom) div 2);
     sg6.Canvas.TextRect(r,x,y,Conteudo);
     SetTextAlign(sg6.Canvas.Handle, al);
  end;

end;

procedure TfrmCadPrograma.sg1DrawCell(Sender: TObject; ACol, ARow: Integer;
  Rect: TRect; State: TGridDrawState);
var Conteudo:String; x,y,hf,hw,t:integer; al:Word; c:TColor;   r:TRect;
begin
  inherited;

  Conteudo := sg1.Cells[ACol,ARow];
  //Valores: Centro
  if ((ARow > 1) and (ACol > 1)) then
  begin
     r := Rect;
     al := SetTextAlign(sg1.Canvas.Handle, TA_CENTER);
     hf := sg1.Canvas.TextHeight('lj');
     sg1.Canvas.FillRect(r);
     x := r.Left + ((r.Right - r.Left)   div 2);
     y := r.Top  - ((r.Top + hf - r.Bottom) div 2);
     sg1.Canvas.TextRect(r,x,y,Conteudo);
     SetTextAlign(sg1.Canvas.Handle, al);
  end;

  //Total: Negrito, Centro, Cor
  if ((ARow in [3,6,7,10,11]) and (ACol in [2,3,4,5])) then
  begin
     r := Rect;
     sg1.Canvas.Brush.Color := cl3DLight;
     sg1.Canvas.Font.Style := [fsbold];
     al := SetTextAlign(sg1.Canvas.Handle, TA_CENTER);
     hf := sg1.Canvas.TextHeight('lj');
     sg1.Canvas.FillRect(r);
     x := r.Left + ((r.Right - r.Left)   div 2);
     y := r.Top  - ((r.Top + hf - r.Bottom) div 2);
     sg1.Canvas.TextRect(r,x,y,Conteudo);
     SetTextAlign(sg1.Canvas.Handle, al);
  end;

end;

procedure TfrmCadPrograma.sg1SelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
begin
  inherited;
  bEdit := (((ARow in [2,4,5,8,9]) and (ACol>1)) and not((ARow>1)and(ACol=7)));

  if (bEdit) and (dsControle.DataSet.State in [dsEdit,dsInsert]) then
    sg1.Options := sg1.Options + [goEditing]
  else
    sg1.Options := sg1.Options - [goEditing];

end;

procedure TfrmCadPrograma.sg2SelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
begin
  inherited;
  bEdit := (((ARow in [2,3,4,5,6,7,8,9,10]) and (ACol>1)) and not((ARow>1)and(ACol=4)));

  if (bEdit) and (dsControle.DataSet.State in [dsEdit,dsInsert]) then
    sg2.Options := sg2.Options + [goEditing]
  else
    sg2.Options := sg2.Options - [goEditing];

end;

procedure TfrmCadPrograma.sg3SelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
begin
  inherited;
  bEdit := (((ARow in [2,3,4,5,6,7,8,9,10,11]) and (ACol>2)) and not((ARow=4)and(ACol=4)));

  if (bEdit) and (dsControle.DataSet.State in [dsEdit,dsInsert]) then
    sg3.Options := sg3.Options + [goEditing]
  else
    sg3.Options := sg3.Options - [goEditing];

end;

procedure TfrmCadPrograma.sg4SelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
begin
  inherited;
  bEdit := (((ARow in [2,3]) and (ACol>0)));

  if (bEdit) and (dsControle.DataSet.State in [dsEdit,dsInsert]) then
    sg4.Options := sg4.Options + [goEditing]
  else
    sg4.Options := sg4.Options - [goEditing];

end;

procedure TfrmCadPrograma.sg51SelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
begin
  inherited;
  bEdit := (((ARow in [2,3]) and (ACol>0)));

  if (bEdit) and (dsControle.DataSet.State in [dsEdit,dsInsert]) then
    sg51.Options := sg51.Options + [goEditing]
  else
    sg51.Options := sg51.Options - [goEditing];

end;

procedure TfrmCadPrograma.sg52SelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
begin
  inherited;
  bEdit := (((ARow in [2,3,4,5,6,7,8,9,10]) and (ACol>1)) and not((ARow>1)and(ACol=4)));

  if (bEdit) and (dsControle.DataSet.State in [dsEdit,dsInsert]) then
    sg52.Options := sg52.Options + [goEditing]
  else
    sg52.Options := sg52.Options - [goEditing];

end;

procedure TfrmCadPrograma.sg53SelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
begin
  inherited;
  bEdit := (((ARow in [3,4,5,6,7,9,10,11]) and (ACol in [2,5])) and not((ARow in [2,8]) and (ACol in [0,1,2,3])));

  if (bEdit) and (dsControle.DataSet.State in [dsEdit,dsInsert]) then
    sg53.Options := sg52.Options + [goEditing]
  else
    sg53.Options := sg52.Options - [goEditing];

end;

procedure TfrmCadPrograma.sg54SelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
begin
  inherited;
  bEdit := (((ARow in [1,2,3,4]) and (ACol>1)) and not((ARow>0)and(ACol=4)));

  if (bEdit) and (dsControle.DataSet.State in [dsEdit,dsInsert]) then
    sg54.Options := sg54.Options + [goEditing]
  else
    sg54.Options := sg54.Options - [goEditing];

end;

procedure TfrmCadPrograma.sg6SelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
begin
  inherited;
  bEdit := (((ARow in [1,2,3,4]) and (ACol>1)) and not((ARow>0)and(ACol=4)));

  if (bEdit) and (dsControle.DataSet.State in [dsEdit,dsInsert]) then
    sg6.Options := sg6.Options + [goEditing]
  else
    sg6.Options := sg6.Options - [goEditing];

end;

procedure TfrmCadPrograma.GeraXML;
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
      sXML.Add('<?xml-stylesheet type="text/xsl" href="programa.xslt"?>');
      sXML.Add('<Programa>');
      sXML.Add('  <Parametros>');
      sXML.Add('    <MUNICIPIO>'+leMunicipio.Text+'</MUNICIPIO>');
      sXML.Add('    <PROVINCIA>'+leProvincia.Text+'</PROVINCIA>');
      sXML.Add('    <UNIDADE>'+leUnidade.Text+'</UNIDADE>');
      sXML.Add('    <PERIODO>'+cbMesAno.Text+'</PERIODO>');
      sXML.Add('    <PERIODO2>'+cbAte.Text+'</PERIODO2>');
      sXML.Add('    <USU>'+dsControle.DataSet.FieldByName('NM_USU').AsString +'</USU>');
      sXML.Add('    <VERSAO>'+dsControle.DataSet.FieldByName('VL_VERSAO').AsString +'</VERSAO>');
      sXML.Add('  </Parametros>');
      sXML.Add('  <Dados>');

      GridXML(sg1);
      GridXML(sg2);
      GridXML(sg3);
      GridXML(sg4);
      GridXML(sg51);
      GridXML(sg52);
      GridXML(sg53);
      GridXML(sg54);
      GridXML(sg6);

      sXML.Add('  </Dados>');
      sXML.Add(' </Programa>');

      sXML.SaveToFile(sArq);
   finally
      FreeAndNil(sXML);
   end;
end;

procedure TfrmCadPrograma.ConsultaPrograma;
var sSQL: TStringList; sWhere:String;
begin
    sSQL := TStringList.Create;
    try
      sSQL.Add('select');
      sSQL.Add('       sum(VL_ACONSELHADOS) VL_ACONSELHADOS');
      sSQL.Add('     , sum(VL_POSITIVOS)VL_POSITIVOS');
      sSQL.Add('     , sum(VL_NEGATIVOS)VL_NEGATIVOS');
      sSQL.Add('     , sum(VL_INDETERMINADOS)VL_INDETERMINADOS');
      sSQL.Add('     , sum(VL_FEMININO_2)VL_FEMININO_2');
      sSQL.Add('     , sum(VL_MASCULINO_2)VL_MASCULINO_2');
      sSQL.Add('     , sum(VL_GESTANTE_3)VL_GESTANTE_3');
      sSQL.Add('     , sum(VL_POS_PARTO_3)VL_POS_PARTO_3');
      sSQL.Add('     , sum(VL_PARTOS_3)VL_PARTOS_3');
      sSQL.Add('     , sum(VL_REGISTRAD0S_4)VL_REGISTRAD0S_4');
      sSQL.Add('     , sum(VL_TARV_4)VL_TARV_4');
      sSQL.Add('     , sum(VL_REGISTRADOS_51)VL_REGISTRADOS_51');
      sSQL.Add('     , sum(VL_TARV_51)VL_TARV_51');
      sSQL.Add('     , sum(VL_FEMININO_52)VL_FEMININO_52');
      sSQL.Add('     , sum(VL_MASCULINO_52)VL_MASCULINO_52');
      sSQL.Add('     , sum(VL_NR1_53)VL_NR1_53');
      sSQL.Add('     , sum(VL_NR2_53)VL_NR2_53');
      sSQL.Add('     , sum(VL_FEMININO_54)VL_FEMININO_54');
      sSQL.Add('     , sum(VL_MASCULINO_54)VL_MASCULINO_54');
      sSQL.Add('     , sum(VL_FEMININO_6)VL_FEMININO_6');
      sSQL.Add('     , sum(VL_MASCULINO_6)VL_MASCULINO_6');
      sSQL.Add('     , VL_ESQUEMA1_53');
      sSQL.Add('     , VL_ESQUEMA2_53');
      sSQL.Add('     , ID_FAIXA_ETARIA_1');
      sSQL.Add('     , ID_FAIXA_ETARIA_2');
      sSQL.Add('     , ID_FAIXA_ETARIA_3');
      sSQL.Add('     , ID_FAIXA_ETARIA_52');
      sSQL.Add('     , FL_SEXO');
      sSQL.Add('     , FL_GESTANTE');
      sSQL.Add('     , VL_X_1');
      sSQL.Add('     , VL_Y_1');
      sSQL.Add('     , VL_X_2');
      sSQL.Add('     , VL_Y_2');
      sSQL.Add('     , VL_X_3');
      sSQL.Add('     , VL_Y_3');
      sSQL.Add('     , VL_X_4');
      sSQL.Add('     , VL_Y_4');
      sSQL.Add('     , VL_X_51');
      sSQL.Add('     , VL_Y_51');
      sSQL.Add('     , VL_X_52');
      sSQL.Add('     , VL_Y_52');
      sSQL.Add('     , VL_X_53');
      sSQL.Add('     , VL_Y_53');
      sSQL.Add('     , VL_X_54');
      sSQL.Add('     , VL_Y_54');
      sSQL.Add('     , VL_X_6');
      sSQL.Add('     , VL_Y_6');
      sSQL.Add('from registro_programa');

      sWhere := 'where';
      if leUnidade.LookupValue <> '' then
      begin
        sSQL.Add(sWhere + ' CD_UNIDADE = ' + VarToStr(leUnidade.LookupValue));
        sWhere := 'and';
      end;

      if leProvincia.LookupValue <> '' then
      begin
        sSQL.Add(sWhere + ' CD_PROVINCIA = ' + VarToStr(leProvincia.LookupValue));
        sWhere := ' and';
      end;

      if leMunicipio.LookupValue <> '' then
      begin
        sSQL.Add(sWhere + ' CD_MUNICIPIO = ' + VarToStr(leMunicipio.LookupValue));
        sWhere := ' and';
      end;

      if cbMesAno.Text <> '' then
      begin
        sSQL.Add(sWhere + ' VL_MESANO = ' + QuotedStr(cbMesAno.Text));
      end;

      sSQL.Add('group by');
      sSQL.Add('       ID_FAIXA_ETARIA_1');
      sSQL.Add('     , FL_SEXO');
      sSQL.Add('     , FL_GESTANTE');
      sSQL.Add('     , VL_X_1');
      sSQL.Add('     , VL_Y_1');
      sSQL.Add('     , ID_FAIXA_ETARIA_2');
      sSQL.Add('     , VL_X_2');
      sSQL.Add('     , VL_Y_2');
      sSQL.Add('     , VL_X_3');
      sSQL.Add('     , VL_Y_3');
      sSQL.Add('     , VL_X_4');
      sSQL.Add('     , VL_Y_4');
      sSQL.Add('     , VL_X_51');
      sSQL.Add('     , VL_Y_51');
      sSQL.Add('     , ID_FAIXA_ETARIA_52');
      sSQL.Add('     , VL_X_52');
      sSQL.Add('     , VL_Y_52');
      sSQL.Add('     , VL_X_53');
      sSQL.Add('     , VL_Y_53');
      sSQL.Add('     , VL_X_54');
      sSQL.Add('     , VL_Y_54');
      sSQL.Add('     , VL_X_6');
      sSQL.Add('     , VL_Y_6');
      sSQL.Add('     , VL_ESQUEMA1_53');
      sSQL.Add('     , VL_ESQUEMA2_53');
      sSQL.Add('     , ID_FAIXA_ETARIA_3');

      qyPrograma.Close;
      qyPrograma.SQL.Text := sSQL.Text;
      qyPrograma.Open;

    finally
       FreeAndNil(sSQL);
    end;
end;

function TfrmCadPrograma.ValidaExclusao: boolean;
begin
  try
    if dmGeral.TB_PROGRAMA.State in [dsInsert] then
    begin
      //Primeiro deve Excluir, para depois entao incluir todos
      if dmGeral.TB_PROGRAMA.State in dsEditModes then
        dmGeral.TB_PROGRAMA.Cancel;

      dmGeral.TB_PROGRAMA.Close;
      dmGeral.TB_PROGRAMA.SelectSQL.Text := sSQLPrograma;

        if leUnidade.LookupValue <> '' then
          dmGeral.TB_PROGRAMA.ParamByName('CD_UNIDADE').AsInteger := strtoint(leUnidade.LookupValue);
        if leProvincia.LookupValue <> '' then
          dmGeral.TB_PROGRAMA.ParamByName('CD_PROVINCIA').AsInteger := strtoint(leProvincia.LookupValue);
        if leMunicipio.LookupValue <> '' then
          dmGeral.TB_PROGRAMA.ParamByName('CD_MUNICIPIO').AsInteger := strtoint(leMunicipio.LookupValue);
        dmGeral.TB_PROGRAMA.ParamByName('VL_MESANO').AsString := cbMesAno.Text;

      dmGeral.TB_PROGRAMA.Open;

    dmGeral.TB_PROGRAMA.First;
    while not dmGeral.TB_PROGRAMA.Eof do
      dmGeral.TB_PROGRAMA.Delete;

      Result := true;
    end;

    if dmGeral.TB_PROGRAMA.State in [dsEdit] then
    begin
      //Primeiro deve Excluir, para depois entao incluir todos
      if dmGeral.TB_PROGRAMA.State in dsEditModes then
        dmGeral.TB_PROGRAMA.Cancel;

      dmGeral.TB_PROGRAMA.Close;
        if leUnidade.LookupValue <> '' then
          dmGeral.TB_PROGRAMA.ParamByName('CD_UNIDADE').AsInteger := Unidade;
        if leProvincia.LookupValue <> '' then
          dmGeral.TB_PROGRAMA.ParamByName('CD_PROVINCIA').AsInteger := Provincia;
        if leMunicipio.LookupValue <> '' then
          dmGeral.TB_PROGRAMA.ParamByName('CD_MUNICIPIO').AsInteger := Municipio;
        dmGeral.TB_PROGRAMA.ParamByName('VL_MESANO').AsString := MesAno;

      dmGeral.TB_PROGRAMA.Open;

      dmGeral.TB_PROGRAMA.First;
      while not dmGeral.TB_PROGRAMA.Eof do
        dmGeral.TB_PROGRAMA.Delete;

      Result := true;
    end;

  except
    Result := false;
  end;
end;

function TfrmCadPrograma.Valor(s: String): real;
begin
  result := StrToFloatDef(s,0);
end;

procedure TfrmCadPrograma.btLimparClick(Sender: TObject);
begin
  inherited;
  leProvincia.Clear;
  leMunicipio.Clear;
  leUnidade.Clear;
  cbMesAno.Text := '';
  cbAte.Text := '';
end;

procedure TfrmCadPrograma.btCancelarClick(Sender: TObject);
begin
  if bConsolidado then
  begin
    MessageDlg('Dados em modo de consolidação, não podem ser modificados!',mtInformation,[mbOK],0);
  end
  else
   inherited;

end;

procedure TfrmCadPrograma.bteditarClick(Sender: TObject);
begin
  pgGeral.ActivePageIndex := 1;
  pgGeralChange(sender);

  if bConsolidado then
  begin
    MessageDlg('Dados em modo de consolidação, não podem ser modificados!',mtInformation,[mbOK],0);
  end
  else
  begin
    Unidade := dmGeral.TB_PROGRAMA.FieldByName('CD_UNIDADE').AsInteger;
    Provincia := dmGeral.TB_PROGRAMA.FieldByName('CD_PROVINCIA').AsInteger;
    Municipio := dmGeral.TB_PROGRAMA.FieldByName('CD_MUNICIPIO').AsInteger;
    MesAno := dmGeral.TB_PROGRAMA.FieldByName('VL_MESANO').AsString;
    inherited;
  end;

end;

procedure TfrmCadPrograma.ckConsolidarClick(Sender: TObject);
begin
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

procedure TfrmCadPrograma.grDadosDblClick(Sender: TObject);
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
  inherited;

end;

procedure TfrmCadPrograma.sg4DrawCell(Sender: TObject; ACol, ARow: Integer;
  Rect: TRect; State: TGridDrawState);
var Conteudo:String; x,y,hf,hw,t:integer; al:Word; c:TColor;   r:TRect;
begin
  inherited;
  Conteudo := sg4.Cells[ACol,ARow];
  //Valores: Centro
  if ((ARow > 0) and (ACol > -1)) then
  begin
     r := Rect;
     al := SetTextAlign(sg4.Canvas.Handle, TA_CENTER);
     hf := sg4.Canvas.TextHeight('lj');
     sg4.Canvas.FillRect(r);
     x := r.Left + ((r.Right - r.Left)   div 2);
     y := r.Top  - ((r.Top + hf - r.Bottom) div 2);
     sg4.Canvas.TextRect(r,x,y,Conteudo);
     SetTextAlign(sg4.Canvas.Handle, al);
  end;

  //Total: Negrito, Centro, Cor
  if ((ACol in [1]) and (ARow = 1)) then
  begin
     r := Rect;
     sg4.Canvas.Brush.Color := cl3DLight;
     sg4.Canvas.Font.Style := [fsbold];
     al := SetTextAlign(sg4.Canvas.Handle, TA_CENTER);
     hf := sg4.Canvas.TextHeight('lj');
     sg4.Canvas.FillRect(r);
     x := r.Left + ((r.Right - r.Left)   div 2);
     y := r.Top  - ((r.Top + hf - r.Bottom) div 2);
     sg4.Canvas.TextRect(r,x,y,Conteudo);
     SetTextAlign(sg4.Canvas.Handle, al);
  end;

end;

procedure TfrmCadPrograma.sg51DrawCell(Sender: TObject; ACol,
  ARow: Integer; Rect: TRect; State: TGridDrawState);
var Conteudo:String; x,y,hf,hw,t:integer; al:Word; c:TColor;   r:TRect;
begin
  inherited;
  Conteudo := sg51.Cells[ACol,ARow];
  //Valores: Centro
  if ((ARow > 0) and (ACol > -1)) then
  begin
     r := Rect;
     al := SetTextAlign(sg51.Canvas.Handle, TA_CENTER);
     hf := sg51.Canvas.TextHeight('lj');
     sg51.Canvas.FillRect(r);
     x := r.Left + ((r.Right - r.Left)   div 2);
     y := r.Top  - ((r.Top + hf - r.Bottom) div 2);
     sg51.Canvas.TextRect(r,x,y,Conteudo);
     SetTextAlign(sg51.Canvas.Handle, al);
  end;

  //Total: Negrito, Centro, Cor
  if ((ACol in [1]) and (ARow = 1)) then
  begin
     r := Rect;
     sg51.Canvas.Brush.Color := cl3DLight;
     sg51.Canvas.Font.Style := [fsbold];
     al := SetTextAlign(sg51.Canvas.Handle, TA_CENTER);
     hf := sg51.Canvas.TextHeight('lj');
     sg51.Canvas.FillRect(r);
     x := r.Left + ((r.Right - r.Left)   div 2);
     y := r.Top  - ((r.Top + hf - r.Bottom) div 2);
     sg51.Canvas.TextRect(r,x,y,Conteudo);
     SetTextAlign(sg51.Canvas.Handle, al);
  end;

end;

procedure TfrmCadPrograma.sg4SetEditText(Sender: TObject; ACol,
  ARow: Integer; const Value: String);
begin
  inherited;
  CalculaTotalSg4;
end;

procedure TfrmCadPrograma.sg51SetEditText(Sender: TObject; ACol,
  ARow: Integer; const Value: String);
begin
  inherited;
  CalculaTotalSg51;
end;

procedure TfrmCadPrograma.qyGridCalcFields(DataSet: TDataSet);
var sAux:String;
begin
  inherited;
  sAux := qyGridVL_MESANO.AsString;
  sAux := Copy(sAux,4,4)+Copy(sAux,1,2);
  qyGridNR_MESANO.AsInteger :=  strToInt(sAux);
end;

procedure TfrmCadPrograma.TabSheet5Show(Sender: TObject);
begin
  inherited;
  PageControl2.ActivePageIndex := 0;
end;

procedure TfrmCadPrograma.leUnidadeChange(Sender: TObject);
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

procedure TfrmCadPrograma.leProvinciaChange(Sender: TObject);
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

procedure TfrmCadPrograma.leMunicipioChange(Sender: TObject);
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

procedure TfrmCadPrograma.btGravarConsolidadoClick(Sender: TObject);
begin
  inherited;
  bConsolidado := false;
  begin
    //dmGeral.TB_PROGRAMA.Close;
    //dmGeral.TB_PROGRAMA.SelectSQL.Text := sSQLPrograma;
    //dmGeral.TB_PROGRAMA.Open;
    dmGeral.TB_PROGRAMA.Insert;
    ValidaExclusao;
    VarreGrid;
    inherited;
    pgGeral.ActivePageIndex := 1;
    PageControl1.ActivePageIndex := 0;
  end;
end;

procedure TfrmCadPrograma.sg3SetEditText(Sender: TObject; ACol,
  ARow: Integer; const Value: String);
begin
  inherited;
  CalculaTotalSg3;
end;

procedure TfrmCadPrograma.CalculaTotalSg3;
var r,c:integer; tl,tc,tg:real;
begin
  //sg3
  sg3.Cells[3,1]:=FloatToStr(valor(sg3.Cells[3,2])+valor(sg3.Cells[3,3]));
  sg3.Cells[4,1]:=FloatToStr(valor(sg3.Cells[4,2])+valor(sg3.Cells[4,3]));

  sg3.Cells[3,4]:=FloatToStr(valor(sg3.Cells[3,5])+valor(sg3.Cells[3,6])+valor(sg3.Cells[3,7]));
  sg3.Cells[4,4]:=FloatToStr(valor(sg3.Cells[4,5])+valor(sg3.Cells[4,6])+valor(sg3.Cells[4,7]));

{  for c:=3 to 4 do
  begin
      tg :=
         Valor(sg3.Cells[c,2]) +
         Valor(sg3.Cells[c,3]) ;
      sg3.Cells[c,1] := FloatToStr(tg);
  end;}
end;

procedure TfrmCadPrograma.Limpar;
begin
  inherited;
  leProvincia.clear;
  leMunicipio.Clear;
  leUnidade.Clear;
  cbMesAno.Text := '';
  cbAte.Text := '';
end;


procedure TfrmCadPrograma.FormDestroy(Sender: TObject);
begin
  inherited;
  dmGeral.TB_PROGRAMA.SelectSQL.Text := sSQLPrograma;
end;

procedure TfrmCadPrograma.Validar;
begin
  if (leProvincia.LookupValue = '') then
  begin
    MessageDlg('É necessário informar a Provincia!',mtInformation,[mbOK],0);
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
    if MessageDlg('O Municipio não foi informado, '#13#10'deseja continuar?',mtConfirmation,
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

procedure TfrmCadPrograma.cbAteChange(Sender: TObject);
var texto: string;
begin
  inherited;
  texto := StringReplace(cbAte.Text, '/', '', [rfReplaceAll, rfIgnoreCase]);
  if Length(texto) > 2 then
    texto := Copy(texto, 1, 2) + '/' + Copy(texto,3,Length(texto)-2);
  cbAte.Text := texto;
  cbAte.SelStart := Length(texto);
end;

procedure TfrmCadPrograma.cbAteKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
    if not (Key in ['0'..'9', #8]) then
    Key := #0
end;

procedure TfrmCadPrograma.cbMesAnoKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
    if not (Key in ['0'..'9', #8]) then
    Key := #0
end;

procedure TfrmCadPrograma.cbMesAnoChange(Sender: TObject);
var texto: string;
begin
  inherited;
  texto := StringReplace(cbMesAno.Text, '/', '', [rfReplaceAll, rfIgnoreCase]);
  if Length(texto) > 2 then
    texto := Copy(texto, 1, 2) + '/' + Copy(texto,3,Length(texto)-2);
  cbMesAno.Text := texto;
  cbMesAno.SelStart := Length(texto);

end;

procedure TfrmCadPrograma.sg1KeyPress(Sender: TObject; var Key: Char);
begin
    if not (Key in ['0'..'9', #8, #13, #0, #17, #18, #19, #20]) then
      Key := #0
end;

procedure TfrmCadPrograma.cbMesAnoExit(Sender: TObject);
begin
  if ValidarMesAno(cbMesAno.Text) then
    cbMesAno.SetFocus;
end;

procedure TfrmCadPrograma.cbAteExit(Sender: TObject);
begin
  if ValidarMesAno(cbAte.Text) then
    cbAte.SetFocus;
end;

procedure TfrmCadPrograma.leUnidadeButtonClick(Sender: TObject);
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

procedure TfrmCadPrograma.BitBtn2Click(Sender: TObject);
begin

  if (ValidaContraSenha('Liberar Exportação')) then
  begin
    with TIBQuery.Create(nil) do
    begin
      Database := DM.DB;
      SQL.Clear;
      SQL.Add('update "REGISTRO_PROGRAMA" set DT_EXP = NULL, DT_ALTERACAO = ''NOW'', DT_REGISTRO = ''NOW'' '+
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





