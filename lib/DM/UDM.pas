unit UDM;

interface

uses
  SysUtils, Classes, DB, IBCustomDataSet, IBDatabase,Dialogs, messages, controls,Graphics,
  IBTable, IBQuery, inifiles, forms, windows, WinInet;

type
  TDM = class(TDataModule)
    DB: TIBDatabase;
    TS: TIBTransaction;
    qyGeral: TIBQuery;
    qyLogin: TIBQuery;
    qyEmpresas: TIBQuery;
    qyEmpresasCD_EMPRESA: TIntegerField;
    qyEmpresasDS_EMPRESA: TIBStringField;
    qyEmpresasTP_EMPRESA: TIBStringField;
    qyEmpresasCD_PESSOA: TIntegerField;
    qyParametro: TIBQuery;
    qyParametroVALOR: TIBStringField;
    qyLoginCD_USUARIO: TIntegerField;
    qyLoginCD_UND: TIntegerField;
    qyLoginNM_USUARIO: TIBStringField;
    qyLoginNM_LOGIN: TIBStringField;
    qyLoginDS_SENHA: TIBStringField;
    qyLoginDT_CADASTRO: TDateTimeField;
    qyLoginCD_MEDICO: TIntegerField;
    qyLoginNM_MEDICO: TIBStringField;
    IBD: TIBDataSet;
    qyLoginCD_GRUPO: TIntegerField;
    procedure DBBeforeConnect(Sender: TObject);
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    function SelectGenerator(pNome:string):double;
    function GetDate:TDate;
    function GetTime:TTime;
    function GetDateTime:TDateTime;
    function GeraCodigo(nmGen:String):Integer;
    procedure Commit(DataSet:TDataSet);
    procedure Rollback(DataSet:TDataSet);
    procedure Transacao(DataSet:TDataSet);
    procedure ConfirmaDelecao;
    function ValorParametro(pID:integer):string;
    procedure ValidaCampoObrigatorio(pCampo:TField;psDescricao:string);
    function EstaNaInternet: boolean;
  end;

var
  DM: TDM;
  sLoginAuto, sSenhaAuto, sDB_DIG, sDB_LAB, sServidorLAB:string;

implementation

uses Math, UGeral;

{$R *.dfm}

function TDM.GetDate:TDate;
begin
  Result:=0;
  with TIBQuery.Create(nil) do
  begin
     Database:=DM.DB;
     Sql.Text:='select Cast(''now'' as date) from dual';
     Open;
     try
       Result:=Trunc(Fields[0].Value);
     except
      MessageDlg('Erro GetDate : ' + Sql.Text, mtError,
       [mbOK],0);
       Close;
       Abort;
     end;
     Close;
     Free;
  end;
end;

function TDM.GetTime:TTime;
begin
  Result:=0;
  with TIBQuery.Create(nil) do
  begin
     Database:=DM.DB;
     Sql.Text:='select Cast(''now'' as time) from dual';
     Open;
     try
       Result:=Fields[0].Value;
     except
       MessageDlg('Erro GetTime : ' + Sql.Text, mtError,
        [mbOK],0);
       Close;
       Abort;
     end;
     Close;
     Free;
  end;
end;


function TDM.GetDateTime:TDateTime;
begin
  Result:=0;
  with TIBQuery.Create(nil) do
  begin
     Database:=DM.DB;
     Sql.Text:='select Cast(''now'' as timeStamp) from dual';
     Open;
     try
       Result:=Fields[0].Value;
     except
       MessageDlg('Erro GetDateTime : ' + Sql.Text, mtError,
        [mbOK],0);
       Close;
       Abort;
     end;
     Close;
     Free;
  end;
end;

function Tdm.GeraCodigo(nmGen: String): Integer;
begin
  qyGeral.SQL.Text := 'select gen_id('+nmGen+',1) from dual';
  qyGeral.Open;
  Result := qyGeral.Fields[0].AsInteger;
  qyGeral.Close;
end;

Procedure TDM.ConfirmaDelecao;
Begin
  if Application.MessageBox('Deseja Excluir este registro?','Excluir', MB_YESNO+MB_ICONQUESTION) <> IDYES then
    Abort;
end;


procedure TDM.DBBeforeConnect(Sender: TObject);
var ini:TiniFile; Arq, sDB, sAux:String;
begin
  Arq := ExtractFilePath(Application.ExeName) + 'ris.ini';
  ini := TIniFile.Create(Arq);
  sDB := ini.ReadString('Geral','DB','');
  sDB_DIG := ini.ReadString('Geral','DB_DIG','');
  sPathLayout := ini.ReadString('Geral','Rave','');
  sLoginAuto := ini.ReadString('Geral','USUARIO','');
  sSenhaAuto := ini.ReadString('Geral','SENHA','');
//  sScreenWidth := ini.ReadString('Geral','ScreenWidth','');
//  sScreenHeight := ini.ReadString('Geral','ScreenHeight','');
  sDB_LAB := ini.ReadString('LAB','Servidor','');
  sServidorLAB := sDB_LAB;

  sComputerName := ini.ReadString('Geral','ComputarName','LocalHost');

  sAux := ini.ReadString('LAB','Laboratorio','NAO');
  gbLaboratorio := (sAux = cvESIM);
  sAux := ini.ReadString('Geral','LiberaQtdeAgenda','NAO');
  gbLiberaQtdeAgenda := (sAux = cvESIM);
  db.databasename := sDB;
  ini.Free;
end;


function TDM.SelectGenerator(pNome:string):double;
var ibSelect:TIBQuery;
begin
  result := 0;
  ibSelect:=TIbQuery.Create(nil);
  With ibSelect do
  begin
     try
      DataBase := DM.DB;
      sql.add('select gen_id('+ pNome+ ',1) from dual');
      try
        open;
      except
        ShowMessage('Erro:'+char(13)+Sql.Text);
        raise;
      end;
      result := Fields[0].AsFloat;
     finally
      close;
      Free;
     end;
  end;
end;

procedure TDM.Commit(DataSet:TDataSet);
begin
  if TIBDataSet(DataSet).Transaction.inTransaction then
  begin
    with TIBDataSet(DataSet).Transaction,
         TIBDataSet(DataSet).Database do
    begin
      //if Assigned(DataSet) then ApplyUpdates(DataSet);
      CommitRetaining;
    end;
  end;
end;

procedure TDM.Rollback(DataSet: TDataSet);
begin
   if TIBDataSet(DataSet).Transaction.inTransaction then
  begin
    with TIBDataSet(DataSet).Transaction,
         TIBDataSet(DataSet).Database do
    begin
      //TIBDataset(Dataset).CancelUpdates;
      RollbackRetaining;
    end;
  end;
end;

procedure TDM.Transacao(DataSet: TDataSet);
begin
  if not TIBDataSet(DataSet).Transaction.inTransaction then
    TIBDataSet(DataSet).Transaction.StartTransaction;
end;

procedure TDM.DataModuleCreate(Sender: TObject);
begin
  //Confirgura��es Iniciais
  ThousandSeparator := '.';
  DecimalSeparator  := ',';
  DateSeparator := '/';
  ListSeparator := ';';
  ShortDateFormat := 'dd/MM/yyyy';
  ShortTimeFormat := 'HH:mm:ss';
  //

  sPath := ExtractFilePath(Application.ExeName);
  sPathConsulta := sPath+'Consulta\';
  try
    db.Open;
  except
    on E: Exception do
    begin
      MessageDlg(E.Message, mtError, [mbOK], 0);
      halt;
      //Application.Terminate;
    end;
  end;
  ts.Active := true;
end;

function TDM.ValorParametro(pID: integer): string;
begin
  dm.qyParametro.Close;
  dm.qyParametro.ParamByName('CD_PARAMETRO').AsInteger := pID;
  dm.qyParametro.Open;
  result := dm.qyParametro.FieldByName('VALOR').AsString;
  dm.qyParametro.Close;
end;

function TDM.EstaNaInternet: boolean;
var
  Flags : Cardinal;
begin
  Result := False;
  if InternetGetConnectedState(@Flags, 0) then
    Result := True;
end;
procedure TDM.ValidaCampoObrigatorio(pCampo: TField; psDescricao: string);
begin
  if pCampo.IsNull then
  begin
    ShowMessage('Campo ' + psDescricao + ' � obrigat�rio!');
    Abort;
  end;
end;

end.

