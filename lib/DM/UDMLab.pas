unit UDMLab;

interface

uses
  SysUtils, Classes, ADODB, DB;

type
  TdmLAB = class(TDataModule)
    ADOCON: TADOConnection;
    ADOComand: TADOCommand;
    ADODS: TADODataSet;
    procedure DataModuleCreate(Sender: TObject);
    procedure ADOCONBeforeConnect(Sender: TObject);
  private
    function VerificaPaciente(picd_paciente: integer): boolean;
    { Private declarations }
  public
    { Public declarations }
    function Roolback:boolean;
    function Commit:boolean;
    function IniciarTransacao:boolean;
    function Conectar:boolean;
    function IncluiAgenda(picd_paciente:integer):boolean;
    function IncluiPaciente(picd_paciente:integer):boolean;
    function Executa(psSQL:string):boolean;
  end;

var
  dmLAB: TdmLAB;

implementation

uses UDM, UDMGERAL, UGeral;

{$R *.dfm}

{ TdmLAB }

function TdmLAB.VerificaPaciente(picd_paciente: integer): boolean;
begin
//
end;

procedure TdmLAB.DataModuleCreate(Sender: TObject);
begin
//
end;

procedure TdmLAB.ADOCONBeforeConnect(Sender: TObject);
begin
  ADOCON.ConnectionString := sServidorLAB;
end;

function TdmLAB.Conectar: boolean;
begin
  if not ADOCON.Connected then
    ADOCON.Connected := true;
  result := ADOCON.Connected;
end;

function TdmLAB.IniciarTransacao: boolean;
begin
  ADOCON.BeginTrans;
end;

function TdmLAB.Commit: boolean;
begin
  ADOCON.CommitTrans;
end;

function TdmLAB.Roolback: boolean;
begin
  ADOCON.RollbackTrans;
end;

function TdmLAB.Executa(psSQL: string): boolean;
begin
  ADOComand.CommandText := psSQL;
  ADOComand.Execute;
end;

function TdmLAB.IncluiPaciente(picd_paciente: integer): boolean;
var icd_paciente:integer;
begin
  Conectar;
  if picd_paciente = numero_indefinido then
     icd_paciente := DMGERAL.TB_PACIENTECD_PACIENTE.AsInteger
  else
     icd_paciente := picd_paciente;
  ADODS.Active := false;
  ADODS.CommandText := 'select CliCodigo from Cliente where CliCodigo = ' +
     intToStr(icd_paciente);
  ADODS.Active := true;
  if ADODS.IsEmpty then
  begin
     if picd_paciente <> numero_indefinido then
     begin
       DMGERAL.TB_PACIENTE.Close;
       DMGERAL.TB_PACIENTE.ParamByName('CD_PACIENTE').AsInteger := icd_paciente;
       DMGERAL.TB_PACIENTE.Open;
     end;

     ADOComand.CommandText :=
       'INSERT INTO CLIENTE(CLICODIGO,CLINOME,CLISEXO,CLIRG)'+
       'VALUES(' + DMGERAL.TB_PACIENTECD_PACIENTE.AsString + ',''' +
       DMGERAL.TB_PACIENTENM_PACIENTE.AsString + ''',''' +
       DMGERAL.TB_PACIENTETP_SEXO.AsString + ''',''' +
       DMGERAL.TB_PACIENTENR_PROCESSO.AsString + ''')';
     ADOComand.Execute;
     if not (DMGERAL.TB_PACIENTE.state in [dsEdit,dsInsert]) then
       DMGERAL.TB_PACIENTE.Edit;
     //DMGERAL.TB_PACIENTEFL_LAB.AsString := cvSim;
     if picd_paciente <> numero_indefinido then
       if (DMGERAL.TB_PACIENTE.state in [dsEdit,dsInsert]) then
         DMGERAL.TB_PACIENTE.Post;
  end;
end;

function TdmLAB.IncluiAgenda(picd_paciente: integer): boolean;
var sData:string;
begin
  Conectar;
  picd_paciente := DMGERAL.TB_AGENDACD_PACIENTE.AsInteger;
  IncluiPaciente(picd_paciente);
  ADODS.Active := false;
  sData := QuotedStr(
     FormatDateTime('dd-mm-yyyy hh:nn:ss',DMGERAL.TB_AGENDADT_AGENDA.AsDateTime));
  ADODS.CommandText := 'SELECT 1 FROM GUIAAGENDA WHERE CLICODIGO = ' +
     intToStr(picd_paciente) + ' AND DATAHORA = ' +  sData;
  ADODS.Active := true;
  if ADODS.IsEmpty then
  begin
     IniciarTransacao;
     ADOComand.CommandText :=
       'INSERT INTO GUIAAGENDA(CLICODIGO,DATAHORA)'+
       'VALUES(' + DMGERAL.TB_AGENDACD_PACIENTE.AsString + ',' + sData +')';
     ADOComand.Execute;
     //if DMGERAL.TB_AGENDA.state in [dsEdit,dsInsert] then
     //  DMGERAL.TB_AGENDAFL_LAB.AsString := cvSim;
  end;
end;

end.

