object DM: TDM
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 455
  Top = 245
  Height = 199
  Width = 344
  object DB: TIBDatabase
    DatabaseName = '10.0.2.2:C:\Compware\Bases\SISPROV\data\desen\RIS.GDB'
    Params.Strings = (
      'user_name=SYSDBA'
      'password=masterkey')
    LoginPrompt = False
    DefaultTransaction = TS
    IdleTimer = 0
    SQLDialect = 3
    TraceFlags = [tfQExecute, tfError, tfTransact]
    BeforeConnect = DBBeforeConnect
    Left = 32
    Top = 24
  end
  object TS: TIBTransaction
    Active = False
    DefaultDatabase = DB
    Params.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    AutoStopAction = saNone
    Left = 72
    Top = 24
  end
  object qyGeral: TIBQuery
    Database = DB
    Transaction = TS
    BufferChunks = 1000
    CachedUpdates = False
    Left = 120
    Top = 24
  end
  object qyLogin: TIBQuery
    Database = DB
    Transaction = TS
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select u.*, m.nm_medico'
      ' from usuario_cmp u'
      '  left outer join medico m'
      '  on u.cd_medico = m.cd_medico'
      'where NM_LOGIN = :NM_LOGIN')
    Left = 176
    Top = 24
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'NM_LOGIN'
        ParamType = ptUnknown
      end>
    object qyLoginCD_USUARIO: TIntegerField
      FieldName = 'CD_USUARIO'
      Origin = 'USUARIO_CMP.CD_USUARIO'
      Required = True
    end
    object qyLoginCD_UND: TIntegerField
      FieldName = 'CD_UND'
      Origin = 'USUARIO_CMP.CD_UND'
      Required = True
    end
    object qyLoginNM_USUARIO: TIBStringField
      FieldName = 'NM_USUARIO'
      Origin = 'USUARIO_CMP.NM_USUARIO'
      Size = 100
    end
    object qyLoginNM_LOGIN: TIBStringField
      FieldName = 'NM_LOGIN'
      Origin = 'USUARIO_CMP.NM_LOGIN'
      Size = 15
    end
    object qyLoginDS_SENHA: TIBStringField
      FieldName = 'DS_SENHA'
      Origin = 'USUARIO_CMP.DS_SENHA'
      Size = 15
    end
    object qyLoginDT_CADASTRO: TDateTimeField
      FieldName = 'DT_CADASTRO'
      Origin = 'USUARIO_CMP.DT_CADASTRO'
    end
    object qyLoginCD_MEDICO: TIntegerField
      FieldName = 'CD_MEDICO'
      Origin = 'USUARIO_CMP.CD_MEDICO'
    end
    object qyLoginNM_MEDICO: TIBStringField
      FieldName = 'NM_MEDICO'
      Origin = 'MEDICO.NM_MEDICO'
      Size = 50
    end
    object qyLoginCD_GRUPO: TIntegerField
      FieldName = 'CD_GRUPO'
      Origin = 'USUARIO_CMP.CD_GRUPO'
    end
  end
  object qyEmpresas: TIBQuery
    Database = DB
    Transaction = TS
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select * from empresa')
    Left = 229
    Top = 24
    object qyEmpresasCD_EMPRESA: TIntegerField
      FieldName = 'CD_EMPRESA'
      Origin = 'EMPRESA.CD_EMPRESA'
      Required = True
    end
    object qyEmpresasDS_EMPRESA: TIBStringField
      FieldName = 'DS_EMPRESA'
      Origin = 'EMPRESA.DS_EMPRESA'
      Size = 30
    end
    object qyEmpresasTP_EMPRESA: TIBStringField
      FieldName = 'TP_EMPRESA'
      Origin = 'EMPRESA.TP_EMPRESA'
      FixedChar = True
      Size = 2
    end
    object qyEmpresasCD_PESSOA: TIntegerField
      FieldName = 'CD_PESSOA'
      Origin = 'EMPRESA.CD_PESSOA'
    end
  end
  object qyParametro: TIBQuery
    Database = DB
    Transaction = TS
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select  VALOR from PARAMETRO where CD_PARAMETRO = :CD_PARAMETRO')
    Left = 56
    Top = 80
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'CD_PARAMETRO'
        ParamType = ptUnknown
      end>
    object qyParametroVALOR: TIBStringField
      FieldName = 'VALOR'
      Origin = 'PARAMETRO.VALOR'
      Size = 200
    end
  end
  object IBD: TIBDataSet
    Database = DB
    Transaction = TS
    BufferChunks = 1000
    CachedUpdates = False
    Left = 224
    Top = 88
  end
end
