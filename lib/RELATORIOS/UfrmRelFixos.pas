unit UfrmRelFixos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UfrmRelPadFast, frxExportImage, frxExportRTF, frxExportHTML,
  frxExportPDF, frxClass, frxExportXLS, frxDBSet, DB, IBCustomDataSet,
  IBQuery, StdCtrls, Buttons, ExtCtrls, ComCtrls, Mask, ToolEdit, DBCtrls;

const Obito = 2;
      Novos = 1;
      Entrada = 2;
      Saida = 3;
      Abandono = 4;
      TARV = 99;
      Gestante = 98;
      Menores10 = 97;
      cd4500 = 96;
      Estadio3e4 = 95;
      CargaViralSem = 93;
      CargaViralMenos1000 = 92;

type
  TfrmRelFixos = class(TfrmRelPadFast)
    pgFiltro: TTabSheet;
    Label2: TLabel;
    GroupBox1: TGroupBox;
    edDataInicio: TDateEdit;
    edDataFinal: TDateEdit;
    Label3: TLabel;
    Label4: TLabel;
    dsRelatorio: TDataSource;
    GroupBox2: TGroupBox;
    rbNovos: TRadioButton;
    rbObito: TRadioButton;
    rbTranfSaida: TRadioButton;
    rbAbandono: TRadioButton;
    rbCd4500: TRadioButton;
    rbestadio3e4: TRadioButton;
    rbGestante: TRadioButton;
    rbTARV: TRadioButton;
    rbCargaViralSem: TRadioButton;
    rbCargaViralMenos1000: TRadioButton;
    rbCriancasMenores10: TRadioButton;
    qyUnidade: TIBQuery;
    dsUnidade: TDataSource;
    frxDBUnidade: TfrxDBDataset;
    qyUnidadeDS_UNIDADE: TIBStringField;
    procedure FormCreate(Sender: TObject);
    procedure btImprimirClick(Sender: TObject);
    procedure frxReport1BeforePrint(Sender: TfrxReportComponent);
  private
    { Private declarations }
    procedure validaFiltro;
    procedure PreparaSQL(cd_evolucao : Integer);
    function SqlEvolucao:String;
    function SqlAbandono: String;
    function SqlTARV: String;
    function SqlCasoNovoTraferenciaEntrada: String;
    function SqlTraferenciaSaida: String;
    function SqlGestantes: String;
    function SqlEstadio3e4semTarv : String;
    function SqlCD4menoreigual500 : string;
    function SqlCriancasMenores10 : String;
    function SqlCargaViralSem : string;
    function sqlCargaViralMenos1000 : string;
  public
    { Public declarations }
  end;

var
  frmRelFixos: TfrmRelFixos;


implementation

uses UGeral, UGeralSQL;

{$R *.dfm}

procedure TfrmRelFixos.validaFiltro;
begin
  if edDataInicio.Text = '  /  /    ' then
  begin
    ShowMessage('Digite a data de início!');
    Abort;
  end;

  if edDataFinal.Text = '  /  /    ' then
  begin
    ShowMessage('Digite a data final!');
    Abort;
  end;

  if edDataInicio.Date > edDataFinal.Date then
  begin
    ShowMessage('A data final deve ser maior que a data início!');
    Abort;
  end;
end;

procedure TfrmRelFixos.FormCreate(Sender: TObject);
begin
  inherited;
  edDataInicio.Date := IncMonth(Now, -1);
  edDataFinal.Date := Now;
  qyUnidade.ParamByName('prmUnidade').Value := prmUnidade;
  qyUnidade.Open;
end;

procedure TfrmRelFixos.btImprimirClick(Sender: TObject);
var pcd_evolucao : Integer;
begin

  inherited;
  validaFiltro;
  if rbNovos.Checked then pcd_evolucao            := Novos
  else if rbObito.Checked then pcd_evolucao       := Obito
  else if rbTranfSaida.Checked then pcd_evolucao  := Saida
  else if rbAbandono.Checked then pcd_evolucao    := Abandono
  else if rbTARV.Checked then pcd_evolucao        := TARV
  else if rbGestante.Checked then pcd_evolucao    := Gestante
  else if rbestadio3e4.Checked then pcd_evolucao  := Estadio3e4
  else if rbCd4500.Checked then pcd_evolucao      := cd4500
  else if rbCriancasMenores10.Checked then pcd_evolucao  := Menores10
  else if rbCargaViralMenos1000.Checked then pcd_evolucao := CargaViralMenos1000
  else if rbCargaViralSem.Checked then pcd_evolucao := CargaViralSem;

  PreparaSQL(pcd_evolucao);

  frxReport1.ShowReport;
end;

procedure TfrmRelFixos.PreparaSQL(cd_evolucao : Integer);
begin
   qyGeral.Close;
   qyGeral.SQL.Clear;

   case cd_evolucao of
      Novos : qyGeral.SQL.Text := SqlCasoNovoTraferenciaEntrada;
      Obito : qyGeral.SQL.Text := SqlEvolucao;
      Saida : qyGeral.SQL.Text := SqlTraferenciaSaida;
      TARV  : qyGeral.SQL.Text := SqlTARV;
      Gestante : qyGeral.SQL.Text := SqlGestantes;
      Abandono : begin
                   qyGeral.SQL.Text := SqlAbandono;
                   AtualizaTodosAbandono;
                 end;
      Menores10 :   qyGeral.SQL.Text := SqlCriancasMenores10;
      cd4500 :      qyGeral.SQL.Text := SqlCD4menoreigual500;
      Estadio3e4:   qyGeral.SQL.Text := SqlEstadio3e4semTarv;
      CargaViralSem : qyGeral.SQL.Text := SqlCargaViralSem;
      CargaViralMenos1000 : qyGeral.SQL.Text := sqlCargaViralMenos1000;
   end;

   if not (cd_evolucao in [Novos, TARV, Gestante, Estadio3e4, cd4500, Menores10, CargaViralSem, CargaViralMenos1000]) then
      qyGeral.ParamByName('CD_EVOLUCAO').AsInteger := cd_evolucao;
   
   qyGeral.ParamByName('INICIO').AsDate := edDataInicio.Date;
  // if not (cd_evolucao in [Estadio3e4]) then
      qyGeral.ParamByName('FINAL').AsDate := edDataFinal.Date;
   qyGeral.Open;

   case cd_evolucao of
      Novos :    frxReport1.LoadFromFile(sPathLayOut  + '\RelFixoCasoNovo.fr3');
      Obito :    frxReport1.LoadFromFile(sPathLayOut  + '\RelFixoObito.fr3');
      Saida :    frxReport1.LoadFromFile(sPathLayOut  + '\RelFixoTransferidoSaida.fr3');
      Abandono : frxReport1.LoadFromFile(sPathLayOut  + '\RelFixoAbandono.fr3');
      TARV  :    frxReport1.LoadFromFile(sPathLayOut  + '\RelFixoTARV.fr3');
      Gestante : frxReport1.LoadFromFile(sPathLayOut  + '\RelFixoGestante.fr3');
      Menores10 : frxReport1.LoadFromFile(sPathLayOut + '\RelFixoCriancasMenores10SemTARV.fr3');
      cd4500 : frxReport1.LoadFromFile(sPathLayOut    + '\RelFixoCD4Maior500SemTARV.fr3');
      Estadio3e4: frxReport1.LoadFromFile(sPathLayOut  + '\RelFixoEstagio2e4OMSSemTARV.fr3');
      CargaViralSem : frxReport1.LoadFromFile(sPathLayOut  + '\RelFixoSemCargaViral.fr3');
      CargaViralMenos1000 : frxReport1.LoadFromFile(sPathLayOut  + '\RelFixoCargaViral1000.fr3');
   end;
end;


procedure TfrmRelFixos.frxReport1BeforePrint(Sender: TfrxReportComponent);
begin
  inherited;
  TfrxMemoView(frxReport1.FindObject('INICIO')).Text  := 'DE '+edDataInicio.Text;
  TfrxMemoView(frxReport1.FindObject('FIM')).Text     := 'ATÉ '+edDataFinal.Text;
end;

function TfrmRelFixos.SqlCasoNovoTraferenciaEntrada: String;
begin
  Result :=
           ' select DISTINCT N.TP_ENTRADA, P.NR_PROCESSO, N.cd_paciente, N.DT_DIAGNOSTICO, '
          +'        P.NM_PACIENTE, P.DT_NASCIMENTO, P.DT_INCLUSAO, '
          +'        CASE P.TP_SEXO WHEN ''M'' THEN ''MASCULINO'' WHEN ''F'' THEN ''FEMININO'' END TP_SEXO, '
          +'        MML.DT_PRIMEIRA_CONSULTA'
          +' from NOTIFICACAO N'
          +' inner join paciente p on n.CD_PACIENTE = p.CD_PACIENTE'
          +' left outer join MAPA_MEDICO_LINHA mml on mml.CD_PACIENTE = p.CD_PACIENTE'
          +' where (N.TP_ENTRADA = 1 or  N.TP_ENTRADA = 2) AND  mml.DT_PRIMEIRA_CONSULTA BETWEEN :INICIO AND :FINAL';
end;

function TfrmRelFixos.SqlEvolucao: String;
begin

Result :=
         'select DISTINCT P.NR_PROCESSO, N.cd_paciente, N.DT_DIAGNOSTICO,                                       '
         +'       P.NM_PACIENTE, P.DT_NASCIMENTO, P.DT_INCLUSAO,                                                '
         +'       CASE P.TP_SEXO WHEN ''M'' THEN ''MASCULINO'' WHEN ''F'' THEN ''FEMININO'' END TP_SEXO,        '
         +'       (SELECT FIRST 1 DT_PRIMEIRA_CONSULTA FROM MAPA_MEDICO_LINHA                                   '
         +'         WHERE CD_PACIENTE = N.CD_PACIENTE ORDER BY DT_PRIMEIRA_CONSULTA ASC) DT_PRIMEIRA_CONSULTA,  '
         +'       (SELECT FIRST 1 DT_MAPA FROM MAPA_MEDICO MM2 join MAPA_MEDICO_LINHA MML2                      '
         +'           ON MM2.cd_mapa = MML2.CD_MAPA WHERE CD_PACIENTE = N.CD_PACIENTE                           '
         +'           ORDER BY DT_MAPA DESC) DT_ULTIMA_CONSULTA,                                                '
         +'       (SELECT FIRST 1 VL_TARV_PADRAO FROM MAPA_MEDICO MM2 join MAPA_MEDICO_LINHA MML2               '
         +'           ON MM2.cd_mapa = MML2.CD_MAPA WHERE CD_PACIENTE = N.CD_PACIENTE                           '
         +'           ORDER BY DT_MAPA DESC) VL_TARV_PADRAO                                   '
         +'from NOTIFICACAO N                                                                                   '
         +'inner join paciente p on n.CD_PACIENTE = p.CD_PACIENTE                                               '
         +'where N.CD_EVOLUCAO = :CD_EVOLUCAO AND  N.DT_EVOLUCAO_2 BETWEEN :INICIO AND :FINAL';


end;

function TfrmRelFixos.SqlAbandono: String;
begin

Result :=
           ' select DISTINCT P.NR_PROCESSO, N.cd_paciente, N.DT_DIAGNOSTICO, '
          +'        P.NM_PACIENTE, P.DT_NASCIMENTO, P.DT_INCLUSAO, '
          +'        CASE P.TP_SEXO WHEN ''M'' THEN ''MASCULINO'' WHEN ''F'' THEN ''FEMININO'' END TP_SEXO, m.NM_MEDICO,'
          +'        (SELECT FIRST 1 DT_PRIMEIRA_CONSULTA FROM MAPA_MEDICO_LINHA'
          +'           WHERE CD_PACIENTE = N.CD_PACIENTE ORDER BY DT_PRIMEIRA_CONSULTA ASC) DT_PRIMEIRA_CONSULTA,'
          +'        (SELECT FIRST 1 DT_MAPA FROM MAPA_MEDICO MM2 join MAPA_MEDICO_LINHA MML2'
          +'             ON MM2.cd_mapa = MML2.CD_MAPA WHERE CD_PACIENTE = N.CD_PACIENTE'
          +'             ORDER BY DT_MAPA DESC) DT_ULTIMA_CONSULTA'
          +' from NOTIFICACAO N'
          +' inner join paciente p on n.CD_PACIENTE = p.CD_PACIENTE'
          +' left outer join AGENDA a on a.CD_PACIENTE = N.CD_PACIENTE AND (A.fl_realizado = 0'
          +'               and ((A.fl_parecer = 0) or (A.fl_parecer is null))'
          +'               and ((A.fl_remarcado = 0) or (A.fl_remarcado is null)))'
          +'               and  not exists(select 1 from agenda X'
          +'                 where X.cd_paciente = A.cd_paciente'
          +'                 and X.dt_agenda > A.dt_agenda) '
          +' left outer join MEDICO m on m.CD_MEDICO = a.CD_MEDICO '
          +' where N.CD_EVOLUCAO = :CD_EVOLUCAO AND  N.DT_EVOLUCAO_2 BETWEEN :INICIO AND :FINAL';

end;

function TfrmRelFixos.SqlTARV: String;
begin

Result :=
           ' select m.VL_TARV_PADRAO, count(m.VL_TARV_PADRAO) total from MAPA_MEDICO_LINHA m '
          +' INNER JOIN MAPA_MEDICO MM ON MM.CD_MAPA = M.CD_MAPA '
          +' where DT_MAPA BETWEEN :INICIO AND :FINAL AND M.VL_TARV_PADRAO IS NOT NULL AND TRIM(VL_TARV_PADRAO) <> '''' '
          +' group by m.VL_TARV_PADRAO '
end;



function TfrmRelFixos.SqlTraferenciaSaida: String;
begin
result := ' select DISTINCT P.NR_PROCESSO, N.cd_paciente, N.DT_DIAGNOSTICO,'
          +'        P.NM_PACIENTE, P.DT_NASCIMENTO, P.DT_INCLUSAO,'
          +'        CASE P.TP_SEXO WHEN ''M'' THEN ''MASCULINO'' WHEN ''F'' THEN ''FEMININO'' END TP_SEXO,'
          +'        (SELECT FIRST 1 DT_PRIMEIRA_CONSULTA FROM MAPA_MEDICO_LINHA'
          +' 		  WHERE CD_PACIENTE = N.CD_PACIENTE ORDER BY DT_PRIMEIRA_CONSULTA ASC) DT_PRIMEIRA_CONSULTA,'
          +' 		(SELECT FIRST 1 DT_MAPA FROM MAPA_MEDICO MM2 join MAPA_MEDICO_LINHA MML2'
          +' 			ON MM2.cd_mapa = MML2.CD_MAPA WHERE CD_PACIENTE = N.CD_PACIENTE'
          +' 			ORDER BY DT_MAPA DESC) DT_ULTIMA_CONSULTA,'
          +' 		(SELECT FIRST 1 VL_TARV_PADRAO FROM MAPA_MEDICO MM2 join MAPA_MEDICO_LINHA MML2'
          +' 			ON MM2.cd_mapa = MML2.CD_MAPA WHERE CD_PACIENTE = N.CD_PACIENTE'
          +' 			ORDER BY DT_MAPA DESC) VL_TARV_PADRAO'
          +' from NOTIFICACAO N'
          +' inner join paciente p on n.CD_PACIENTE = p.CD_PACIENTE'
          +' where N.CD_EVOLUCAO = :CD_EVOLUCAO AND N.DT_EVOLUCAO_2 BETWEEN :INICIO AND :FINAL';

end;

function TfrmRelFixos.SqlGestantes: String;
begin
result := 'select distinct P.NR_PROCESSO, N.DT_DIAGNOSTICO,  '
          +'P.NM_PACIENTE, P.DT_NASCIMENTO, '
          +'CASE P.TP_SEXO WHEN ''M'' THEN ''MASCULINO'' WHEN ''F'' THEN ''FEMININO'' END TP_SEXO, '
          +'mml.vl_tarv_padrao, '
          +'mml.dt_primeiro_tarv, '
          +'G.DT_INICIO_GESTACAO, '
          +'G.DT_FIM_GESTACAO, '
          +'G.NR_MESES  '
   +'from NOTIFICACAO N   '
   +'inner join paciente p on n.CD_PACIENTE = p.CD_PACIENTE '
   +'inner join MAPA_MEDICO_LINHA mml on mml.CD_PACIENTE = p.CD_PACIENTE '
   +'inner join mapa_medico mm on mm.CD_MAPA = mml.CD_MAPA '
   +'left outer join GESTANTE G on G.CD_PACIENTE = MML.CD_PACIENTE '
   +'                AND MML.DT_PREV_GESTACAO BETWEEN G.DT_INICIO_GESTACAO AND G.DT_FIM_GESTACAO '
   +'where mm.DT_MAPA BETWEEN :INICIO AND :FINAL '
   +'and MM.DT_MAPA =  mml.DT_PRIMEIRA_CONSULTA '
   +'and MML.vl_gestante = ''S''  ';
end;

function TfrmRelFixos.SQLCriancasMenores10: String;
begin
result := 'SELECT DISTINCT '
    +'P.NR_PROCESSO, '
    +'P.NM_PACIENTE, '
    +'P.DT_NASCIMENTO, '
    +'P.IDADE, '
    +'CASE P.TP_SEXO WHEN ''M'' THEN ''MASCULINO'' WHEN ''F'' THEN ''FEMININO'' END TP_SEXO, '
    +'N.DT_DIAGNOSTICO, '
    +'CASE N.TP_ENTRADA '
        +'WHEN 1 THEN ''Caso Novo'''
        +'WHEN 2 THEN ''Transferência'''
        +'WHEN 3 THEN ''Retorno após abandono'''
        +'WHEN 4 THEN ''Ignorado'''
        +'WHEN 5 THEN ''Mãe de criança exposta'''
        +'WHEN 6 THEN ''Caso novo-Internamento'''
    +'END TP_ENTRADA, '
    +'MML.DT_PRIMEIRA_CONSULTA '
+'FROM NOTIFICACAO N '
+'INNER JOIN PACIENTE P '
    +'ON P.CD_PACIENTE = N.CD_PACIENTE '
+'INNER JOIN MAPA_MEDICO_LINHA MML '
    +'ON MML.CD_PACIENTE = N.CD_PACIENTE '
+'INNER JOIN MAPA_MEDICO MM '
    +'ON MM.CD_MAPA = MML.CD_MAPA '
+'WHERE '
    +'MM.DT_MAPA BETWEEN :INICIO AND :FINAL '
 +'AND P.IDADE <= 10 '
 +'AND (MML.VL_TARV_PADRAO IS NULL OR MML.VL_TARV_PADRAO = '''') '
end;

function TfrmRelFixos.SqlCD4menoreigual500: string;
begin
result := 'SELECT DISTINCT  '
 +'P.NR_PROCESSO, '
    +'P.NM_PACIENTE, '
    +'P.DT_NASCIMENTO, '
    +'P.IDADE, '
    +'CASE P.TP_SEXO WHEN ''M'' THEN ''MASCULINO'' WHEN ''F'' THEN ''FEMININO'' END TP_SEXO, '
    +'N.DT_DIAGNOSTICO, '
    +'CASE N.TP_ENTRADA '
        +'WHEN 1 THEN ''Caso Novo'''
        +'WHEN 2 THEN ''Transferência'''
        +'WHEN 3 THEN ''Retorno após abandono'''
        +'WHEN 4 THEN ''Ignorado'''
        +'WHEN 5 THEN ''Mãe de criança exposta'''
        +'WHEN 6 THEN ''Caso novo-Internamento'''
        +'END TP_ENTRADA, '
    +'MML.DT_PRIMEIRA_CONSULTA, '
    +'MML.VL_CD4_PC '
+'FROM NOTIFICACAO N  '
+'INNER JOIN PACIENTE P '
    +'ON P.CD_PACIENTE = N.CD_PACIENTE '
+'INNER JOIN MAPA_MEDICO_LINHA MML '
    +'ON MML.CD_PACIENTE = N.CD_PACIENTE '
+'INNER JOIN MAPA_MEDICO MM  '
    +'ON MM.CD_MAPA = MML.CD_MAPA AND MML.DT_PRIMEIRA_CONSULTA = MM.DT_MAPA '
+'WHERE '
    +'MM.DT_MAPA BETWEEN :INICIO AND :FINAL  '
    +'AND (MML.VL_CD4_PC >= 500) '
    +'AND (MML.VL_TARV_PADRAO IS NULL OR MML.VL_TARV_PADRAO = '''') ';
end;

function TfrmRelFixos.SqlEstadio3e4semTarv: String;
begin
result :='SELECT DISTINCT '
          +'P.NR_PROCESSO, '
          +'P.NM_PACIENTE, '
          +'P.DT_NASCIMENTO, '
          +'P.IDADE, '
          +'CASE P.TP_SEXO WHEN ''M'' THEN ''MASCULINO'' WHEN ''F'' THEN ''FEMININO'' END TP_SEXO, '
          +'N.DT_DIAGNOSTICO, '
          +'CASE N.TP_ENTRADA '
              +'WHEN 1 THEN ''Caso Novo'''
              +'WHEN 2 THEN ''Transferência'''
              +'WHEN 3 THEN ''Retorno após abandono'''
              +'WHEN 4 THEN ''Ignorado'''
              +'WHEN 5 THEN ''Mãe de criança exposta'''
              +'WHEN 6 THEN ''Caso novo-Internamento'''
        +'END TP_ENTRADA, '
        +'MML.DT_PRIMEIRA_CONSULTA, '
        +'MML.VL_ESTADIO_PC '
    +'FROM NOTIFICACAO N '
    +'INNER JOIN PACIENTE P '
      +'ON P.CD_PACIENTE = N.CD_PACIENTE '
    +'INNER JOIN MAPA_MEDICO_LINHA MML '
        +'ON MML.CD_PACIENTE = N.CD_PACIENTE '
    +'INNER JOIN MAPA_MEDICO MM '
        +'ON MM.CD_MAPA = MML.CD_MAPA AND MML.DT_PRIMEIRA_CONSULTA = MM.DT_MAPA '
    +'WHERE '
        +'MM.DT_MAPA BETWEEN :INICIO AND :FINAL '
        +'AND (MML.VL_ESTADIO_PC = ''III'' OR MML.VL_ESTADIO_PC = ''IV'') '
        +'AND (MML.VL_TARV_PADRAO IS NULL OR MML.VL_TARV_PADRAO = '''') ' ;
end;

function TfrmRelFixos.sqlCargaViralMenos1000: string;
begin
result := 'SELECT    '
          +' NR_PROCESSO, '
          +' MAX(NM_PACIENTE) NM_PACIENTE, '
          +' MAX(DT_NASCIMENTO) DT_NASCIMENTO, '
          +' MAX(IDADE) IDADE, '
          +' MAX(TP_SEXO) TP_SEXO, '
          +' MAX(DT_DIAGNOSTICO) DT_DIAGNOSTICO,'
          +' MAX(TP_ENTRADA) TP_ENTRADA, '
          +' MIN(DT_PRIMEIRA_CONSULTA) DT_PRIMEIRA_CONSULTA, '
          +' MAX(PRIMEIRO_TARV) PRIMEIRO_TARV,'
          +' MAX(DT_ULTIMA_CONSULTA) DT_ULTIMA_CONSULTA, '
          +' MAX(ULTIMO_TARV) ULTIMO_TARV,  '
          +' MAX(DT_COLETA_EXAME) DT_COLETA_EXAME,'
          +' MAX(VL_CV_UC) VL_CV_UC '
          +'FROM  '
          +' (SELECT DISTINCT '
          +'  P.NR_PROCESSO,  '
          +'  P.NM_PACIENTE,  '
          +'  P.DT_NASCIMENTO,'
          +'  P.IDADE,   '
          +'  CASE P.TP_SEXO WHEN ''M'' THEN ''MASCULINO'' WHEN ''F'' THEN ''FEMININO'' END TP_SEXO,'
          +'  N.DT_DIAGNOSTICO, '
          +' CASE N.TP_ENTRADA '
          +' WHEN 1 THEN ''Caso Novo'''
          +' WHEN 2 THEN ''Transferência'''
          +' WHEN 3 THEN ''Retorno após abandono'''
          +' WHEN 4 THEN ''Ignorado'''
          +' WHEN 5 THEN ''Mãe de criança exposta'''
          +'   WHEN 6 THEN ''Caso novo-Internamento'''
          +'  END TP_ENTRADA, '
          +'  (SELECT FIRST 1 DT_PRIMEIRA_CONSULTA FROM MAPA_MEDICO_LINHA '
          +'   WHERE CD_PACIENTE = N.CD_PACIENTE ORDER BY DT_PRIMEIRA_CONSULTA ASC) DT_PRIMEIRA_CONSULTA, '
          +'  (SELECT FIRST 1 DT_PRIMEIRO_TARV FROM MAPA_MEDICO_LINHA '
          +'   WHERE CD_PACIENTE = N.CD_PACIENTE ORDER BY DT_PRIMEIRO_TARV ASC) PRIMEIRO_TARV, '
          +'  (SELECT FIRST 1 DT_ULTIMA_CONSULTA FROM MAPA_MEDICO_LINHA '
          +'   WHERE CD_PACIENTE = N.CD_PACIENTE ORDER BY DT_ULTIMA_CONSULTA DESC) DT_ULTIMA_CONSULTA, '
          +'  (SELECT FIRST 1 VL_ULTIMA_ESQUEMA FROM MAPA_MEDICO_LINHA '
          +'   WHERE CD_PACIENTE = N.CD_PACIENTE ORDER BY DT_ULTIMA_CONSULTA DESC) ULTIMO_TARV, '
          +'  DT_CV_UC DT_COLETA_EXAME, '
          +'  VL_CV_UC '
          +' FROM NOTIFICACAO N '
          +' INNER JOIN PACIENTE P '
          +'  ON P.CD_PACIENTE = N.CD_PACIENTE '
          +' INNER JOIN MAPA_MEDICO_LINHA MML '
          +'  ON MML.CD_PACIENTE = N.CD_PACIENTE '
          +' INNER JOIN MAPA_MEDICO MM '
          +'  ON MM.CD_MAPA = MML.CD_MAPA '
          +' WHERE '
          +'  MML.DT_CV_UC BETWEEN :INICIO AND :FINAL '
          +'  AND (TRIM(VL_CV_UC) SIMILAR TO ''[0-9]+'' AND VL_CV_UC >= 1000)) '
          +' GROUP BY NR_PROCESSO '
end;

function TfrmRelFixos.SqlCargaViralSem: string;
begin
result := 'SELECT   '
+'    NR_PROCESSO,   '
+'    NM_PACIENTE,  '
+'    DT_NASCIMENTO, '
+'    IDADE, '
+'    TP_SEXO, '
+'    DT_DIAGNOSTICO, '
+'    TP_ENTRADA, '
+'    (SELECT FIRST 1 DT_PRIMEIRA_CONSULTA FROM MAPA_MEDICO_LINHA '
+'        WHERE CD_PACIENTE = R.CD_PACIENTE ORDER BY DT_PRIMEIRA_CONSULTA ASC) DT_PRIMEIRA_CONSULTA, '
+'    (SELECT FIRST 1 DT_PRIMEIRO_TARV FROM MAPA_MEDICO_LINHA '
+'        WHERE CD_PACIENTE = R.CD_PACIENTE ORDER BY DT_PRIMEIRO_TARV ASC) PRIMEIRO_TARV, '
+'    (SELECT FIRST 1 DT_ULTIMA_CONSULTA FROM MAPA_MEDICO_LINHA '
+'        WHERE CD_PACIENTE = R.CD_PACIENTE ORDER BY DT_ULTIMA_CONSULTA DESC) DT_ULTIMA_CONSULTA, '
+'    (SELECT FIRST 1 VL_ULTIMA_ESQUEMA FROM MAPA_MEDICO_LINHA '
+'        WHERE CD_PACIENTE = R.CD_PACIENTE ORDER BY DT_ULTIMA_CONSULTA DESC) ULTIMO_TARV  '
+'FROM  '
+'    (SELECT DISTINCT  '
+'        P.CD_PACIENTE, '
+'        P.NR_PROCESSO, '
+'        P.NM_PACIENTE, '
+'        P.DT_NASCIMENTO, '
+'        P.IDADE, '
+'        DT_CV_UC, '
+'        CASE P.TP_SEXO WHEN ''M'' THEN ''MASCULINO'' WHEN ''F'' THEN ''FEMININO'' END TP_SEXO, '
+'        N.DT_DIAGNOSTICO,  '
+'        CASE N.TP_ENTRADA '
+'            WHEN 1 THEN ''Caso Novo'''
+'            WHEN 2 THEN ''Transferência'''
+'            WHEN 3 THEN ''Retorno após abandono'''
+'            WHEN 4 THEN ''Ignorado'''
+'            WHEN 5 THEN ''Mãe de criança exposta'''
+'            WHEN 6 THEN ''Caso novo-Internamento'''
+'        END TP_ENTRADA '
+'    FROM NOTIFICACAO N  '
+'    INNER JOIN PACIENTE P '
+'       ON P.CD_PACIENTE = N.CD_PACIENTE  '
+'   INNER JOIN MAPA_MEDICO_LINHA MML  '
+'       ON MML.CD_PACIENTE = N.CD_PACIENTE  '
+'   INNER JOIN MAPA_MEDICO MM  '
+'       ON MM.CD_MAPA = MML.CD_MAPA '
+'   WHERE '
+'       MM.DT_MAPA BETWEEN :INICIO AND :FINAL '
+'       AND (TRIM(VL_CV_UC) = '''' OR VL_CV_UC IS NULL)) R '
+' ORDER BY NR_PROCESSO ASC ';
end;

end.
