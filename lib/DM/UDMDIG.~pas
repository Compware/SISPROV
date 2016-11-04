unit UDMDIG;

interface

uses
  SysUtils, Classes, IBDatabase, DB, IBCustomDataSet, IBTable, IBQuery;

type
  TdmDIG = class(TDataModule)
    dbDig: TIBDatabase;
    tsDig: TIBTransaction;
    tbDig_Arquivo: TIBDataSet;
    tbDig_ArquivoCD_ARQUIVO: TIntegerField;
    tbDig_ArquivoBL_ARQUIVO: TBlobField;
    tbArquivo_Digital: TIBDataSet;
    tbArquivo_DigitalNR_PROCESSO: TIntegerField;
    tbArquivo_DigitalCD_ARQUIVO: TIntegerField;
    tbArquivo_DigitalCD_GRUPO: TIntegerField;
    tbDig_GrupoDoc: TIBDataSet;
    tbDig_GrupoDocCD_GRUPO: TIntegerField;
    tbDig_GrupoDocDS_GRUPO: TIBStringField;
    tbArquivo_DigitalNU_ORDEM: TIntegerField;
    tbArquivo_DigitalDS_GRUPO: TIBStringField;
    tbEdt_Arquivo: TIBDataSet;
    tbEdt_ArquivoCD_ARQUIVO: TIntegerField;
    tbEdt_ArquivoBL_ARQUIVO: TBlobField;
    tbArquivo_DigitalCD_ARQUIVO_EDT: TIntegerField;
    tbArquivo_DigitalTP_ARQUIVO: TIntegerField;
    tbDig_GrupoMod: TIBDataSet;
    tbDig_GrupoModCD_GRUPO: TIntegerField;
    tbDig_GrupoModDS_GRUPO: TIBStringField;
    tbModelo_Documento: TIBDataSet;
    tbModelo_DocumentoCD_MODELO: TIntegerField;
    tbModelo_DocumentoDS_MODELO: TIBStringField;
    tbModelo_DocumentoCD_GRUPO: TIntegerField;
    tbModelo_DocumentoCD_DOCUMENTO: TIntegerField;
    tbModelo_DocumentoDS_GRUPO: TIBStringField;
    qyPaciente: TIBQuery;
    tbDig_Processo: TIBDataSet;
    tbDig_ProcessoNR_PROCESSO: TIntegerField;
    tbDig_ProcessoNM_PACIENTE: TIBStringField;
    tbDig_ProcessoDT_NASCIMENTO: TDateField;
    tbDig_ProcessoIDADE: TSmallintField;
    tbDig_ProcessoNM_MAE: TIBStringField;
    tbDig_ArquivoDS_ARQUIVO: TIBStringField;
    tbArquivo_DigitalNM_ARQUIVO: TIBStringField;
    tbArquivo_DigitalDT_ARQUIVO: TDateTimeField;
    tbHistorico: TIBDataSet;
    tbHistoricoCD_HISTORICO: TIntegerField;
    tbHistoricoCD_PACIENTE: TIntegerField;
    tbHistoricoDT_HISTORICO: TDateTimeField;
    tbHistoricoDS_HISTORICO: TIBStringField;
    tbHistoricoCD_MEDICO: TIntegerField;
    tbHistoricoBL_HISTORICO: TBlobField;
    tbHistoricoCD_GRUPO: TIntegerField;
    tbHistoricoDS_GRUPO: TIBStringField;
    qyMedico: TIBQuery;
    qyMedicoNM_MEDICO: TIBStringField;
    tbHistoricoNM_MEDICO: TStringField;
    qyMedicoCD_MEDICO: TIntegerField;
    dsHistorico: TDataSource;
    tbHistoricoCD_PAI: TIntegerField;
    tbHistoricoFL_FILHO: TIBStringField;
    tbHistoricoCD_ARQUIVO: TIntegerField;
    tbArquivo_DigitalNR_ROTACAO: TIntegerField;
    qyArquivoDigital: TIBQuery;
    tbArquivo_Exame: TIBDataSet;
    tbArquivo_ExameCD_AGENDA: TIntegerField;
    tbArquivo_ExameCD_ARQUIVO: TIntegerField;
    qyGrupo: TIBQuery;
    qyGrupoCD_GRUPO: TIntegerField;
    qyGrupoDS_GRUPO: TIBStringField;
    tbModelo_DocumentoCD_GRUPO_DOC: TIntegerField;
    tbDig_GrupoDocFL_NOVO: TIntegerField;
    dsPaciente: TDataSource;
    qyNotificacao: TIBQuery;
    qyNotificacaoCD_FICHA: TLargeintField;
    qyNotificacaoCD_UND: TIntegerField;
    qyNotificacaoCD_UNIDADE: TIntegerField;
    qyNotificacaoCD_USUARIO: TIntegerField;
    qyNotificacaoCD_MUNICIPIO: TIntegerField;
    qyNotificacaoCD_UNIDADE_TRATAMENTO: TIntegerField;
    qyNotificacaoCD_MUNICIPIO_TRATAMENTO: TIntegerField;
    qyNotificacaoCD_PACIENTE: TIntegerField;
    qyNotificacaoDT_NOTIFICACAO: TDateField;
    qyNotificacaoDT_DIAGNOSTICO: TDateField;
    qyNotificacaoCD_RELACOES_SEXO: TSmallintField;
    qyNotificacaoCD_MAE_POSITIVO: TSmallintField;
    qyNotificacaoCD_USOU_DROGA: TSmallintField;
    qyNotificacaoCD_ACIDENTE_MAT_BIO: TSmallintField;
    qyNotificacaoSN_TRANSFUSAO_SANGUE: TIntegerField;
    qyNotificacaoSN_PERFURACAO: TIntegerField;
    qyNotificacaoSN_TRAT_DENTARIO: TIntegerField;
    qyNotificacaoSN_INTERV_CIRURGICA: TIntegerField;
    qyNotificacaoSN_CIRCUNCISAO: TIntegerField;
    qyNotificacaoCD_TESTE_TRIAGEM: TSmallintField;
    qyNotificacaoDS_TESTE_TRIAGEM: TIBStringField;
    qyNotificacaoCD_OCUPACAO: TSmallintField;
    qyNotificacaoDS_OCUPACAO: TIBStringField;
    qyNotificacaoCD_TESTE_CONFIRMATORIO: TSmallintField;
    qyNotificacaoDS_TESTE_CONFIRMATORIO: TIBStringField;
    qyNotificacaoCD_OMS: TSmallintField;
    qyNotificacaoCD_CD4: TIntegerField;
    qyNotificacaoCD_EVOLUCAO: TSmallintField;
    qyNotificacaoDT_EVOLUCAO: TDateField;
    qyNotificacaoDS_OBSERVACAO: TIBStringField;
    qyNotificacaoCD_NOTIFICACAO: TIntegerField;
    qyNotificacaoREGDUP: TIBStringField;
    qyNotificacaoCD_LOTE: TIntegerField;
    qyNotificacaoNM_ENTREVISTADOR: TIBStringField;
    qyNotificacaoTEL_ENTREVISTADOR: TIBStringField;
    qyNotificacaoFUNCAO_ENTREVISTADOR: TIBStringField;
    qyNotificacaoNM_MEDICO: TIBStringField;
    qyNotificacaoTEL_MEDICO: TIBStringField;
    qyNotificacaoSN_TATUAGEM: TIntegerField;
    qyNotificacaoTP_ENTRADA: TIntegerField;
    qyNotificacaoEVIDENCIA_GESTANTE: TIntegerField;
    qyNotificacaoTB_ATUAL: TIntegerField;
    qyNotificacaoTB_ANTERIOR: TIntegerField;
    qyNotificacaoDT_TRATAMENTO_TB: TDateField;
    qyNotificacaoCD_PROVINCIA_TRATAMENTO: TIntegerField;
    qyNotificacaoCD_PROVINCIA_NOT: TIntegerField;
    qyNotificacaoDT_ALTERACAO: TDateTimeField;
    qyNotificacaoDT_EXPORTACAO: TDateTimeField;
    qyNotificacaoCD_FICHA_ORACLE: TIntegerField;
    qyNotificacaoCD_MEDICO: TIntegerField;
    qyNotificacaoNR_NOTIFICACAO: TIBStringField;
    qyNotificacaoCD_FICHA_SINVS: TLargeintField;
    qyNotificacaoCD_INVESTIGADOR: TIntegerField;
    qyNotificacaoDT_TESTE_TRIAGEM: TDateTimeField;
    qyNotificacaoDT_TESTE_CONFIRMATORIO: TDateTimeField;
    qyNotificacaoNR_PROCESSO_UTENTE: TIBStringField;
    qyNotificacaoDT_EXP: TDateTimeField;
    qyNotificacaoCD_EDI: TIntegerField;
    dsNotificacao: TDataSource;
    procedure dbDigBeforeConnect(Sender: TObject);
    procedure DataModuleCreate(Sender: TObject);
    procedure tbArquivo_DigitalAfterInsert(DataSet: TDataSet);
    procedure tbHistoricoAfterInsert(DataSet: TDataSet);
    procedure tbDig_GrupoDocBeforeClose(DataSet: TDataSet);
    procedure tbHistoricoBeforeEdit(DataSet: TDataSet);
    procedure tbHistoricoFilterRecord(DataSet: TDataSet;
      var Accept: Boolean);
    procedure tbHistoricoCalcFields(DataSet: TDataSet);
    procedure tbHistoricoCD_GRUPOValidate(Sender: TField);
    procedure tbDig_ArquivoAfterDelete(DataSet: TDataSet);
    procedure tbDig_ArquivoAfterPost(DataSet: TDataSet);
    procedure tbArquivo_DigitalAfterPost(DataSet: TDataSet);
    procedure tbArquivo_DigitalAfterDelete(DataSet: TDataSet);
    procedure tbArquivo_ExameAfterDelete(DataSet: TDataSet);
    procedure tbArquivo_ExameAfterPost(DataSet: TDataSet);
    procedure tbArquivo_DigitalAfterOpen(DataSet: TDataSet);
    procedure tbArquivo_DigitalBeforeOpen(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure Commit(DataSet:TDataSet);
    procedure Rollback(DataSet: TDataSet);
    procedure Transacao(DataSet: TDataSet);
  end;

var
  dmDIG: TdmDIG;

implementation

uses UDM, UGeral;

{$R *.dfm}

procedure TdmDIG.dbDigBeforeConnect(Sender: TObject);
var s, sNome:string;
begin
//Ini...
  if sDB_DIG = '' then
  begin
    sNome := dm.db.DatabaseName;
    s := ExtractFileName(sNome);
    sNome := StringReplace(sNome,s,'DIG.GDB',[]);
  end
  else
    sNome := sDB_DIG;

  dbDig.DatabaseName := sNome;
  dbDig.Params := dm.db.Params;
end;

procedure TdmDIG.DataModuleCreate(Sender: TObject);
begin
  dbDig.Open;
  tsDig.Active := true;
end;

procedure TDMDig.Commit(DataSet:TDataSet);
begin
  if tsDig.inTransaction then
  begin
    with dbDig,tsDig do
    begin
      if Assigned(DataSet) then
        ApplyUpdates(DataSet);
      CommitRetaining;
    end;
  end;
end;

procedure TDMDig.Rollback(DataSet: TDataSet);
begin
  if tsDig.inTransaction then
  begin
    with dbDig,tsDig do
    begin
      //TIBDataset(Dataset).CancelUpdates;
      RollbackRetaining;
    end;
  end;
end;

procedure TDMDig.Transacao(DataSet: TDataSet);
begin
  if not tsDig.inTransaction then
   tsDIg.StartTransaction;
end;

procedure TdmDIG.tbArquivo_DigitalAfterInsert(DataSet: TDataSet);
begin
  tbArquivo_DigitalNR_PROCESSO.AsInteger := 0;
  tbArquivo_DigitalDT_ARQUIVO.AsDateTime := dm.GetDateTime;
end;

procedure TdmDIG.tbHistoricoAfterInsert(DataSet: TDataSet);
begin
  tbHistoricoDT_HISTORICO.AsDateTime := dm.GetDateTime;
end;

procedure TdmDIG.tbDig_GrupoDocBeforeClose(DataSet: TDataSet);
begin
 //
end;

procedure TdmDIG.tbHistoricoBeforeEdit(DataSet: TDataSet);
begin
//  if dmDig.tbHistoricoFL_FILHO.AsString = cvSim then  Abort;
end;

procedure TdmDIG.tbHistoricoFilterRecord(DataSet: TDataSet;
  var Accept: Boolean);
begin
//  Accept := (dmDig.tbHistoricoFL_FILHO.AsString<>cvSim);
end;

procedure TdmDIG.tbHistoricoCalcFields(DataSet: TDataSet);
begin
  qyMedico.Close;
  qyMedico.Open;
  tbHistoricoNM_MEDICO.AsString := qyMedicoNM_MEDICO.AsString;
end;

procedure TdmDIG.tbHistoricoCD_GRUPOValidate(Sender: TField);
begin
  if tbHistoricoCD_GRUPO.AsInteger = tbDig_GrupoDocCD_GRUPO.AsInteger then
    tbHistoricoDS_GRUPO.AsString := tbDig_GrupoDocDS_GRUPO.AsString;
end;

procedure TdmDIG.tbDig_ArquivoAfterDelete(DataSet: TDataSet);
begin
  DM.Commit(DataSet);
end;

procedure TdmDIG.tbDig_ArquivoAfterPost(DataSet: TDataSet);
begin
  DM.Commit(DataSet);
end;

procedure TdmDIG.tbArquivo_DigitalAfterPost(DataSet: TDataSet);
begin
  DM.Commit(DataSet);
end;

procedure TdmDIG.tbArquivo_DigitalAfterDelete(DataSet: TDataSet);
begin
  DM.Commit(DataSet);
end;

procedure TdmDIG.tbArquivo_ExameAfterDelete(DataSet: TDataSet);
begin
  DM.Commit(DataSet);
end;

procedure TdmDIG.tbArquivo_ExameAfterPost(DataSet: TDataSet);
begin
  DM.Commit(DataSet);
end;

procedure TdmDIG.tbArquivo_DigitalAfterOpen(DataSet: TDataSet);
begin
  DM.Commit(DataSet);
end;

procedure TdmDIG.tbArquivo_DigitalBeforeOpen(DataSet: TDataSet);
begin
  DM.Commit(DataSet);
end;

end.
