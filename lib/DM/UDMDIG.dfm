object dmDIG: TdmDIG
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 410
  Top = 169
  Height = 372
  Width = 554
  object dbDig: TIBDatabase
    DatabaseName = '10.0.2.2:C:\cOMPWARE\Bases\SISPROV\data\DIG.GDB'
    Params.Strings = (
      'user_name=sysdba'
      'password=masterkey')
    LoginPrompt = False
    DefaultTransaction = tsDig
    IdleTimer = 0
    SQLDialect = 3
    TraceFlags = []
    BeforeConnect = dbDigBeforeConnect
    Left = 24
    Top = 24
  end
  object tsDig: TIBTransaction
    Active = False
    DefaultDatabase = dbDig
    AutoStopAction = saNone
    Left = 64
    Top = 24
  end
  object tbDig_Arquivo: TIBDataSet
    Database = dbDig
    Transaction = tsDig
    AfterDelete = tbDig_ArquivoAfterDelete
    AfterPost = tbDig_ArquivoAfterPost
    BufferChunks = 1000
    CachedUpdates = False
    DeleteSQL.Strings = (
      'delete from "DIG_ARQUIVO"'
      'where'
      '  "CD_ARQUIVO" = :"OLD_CD_ARQUIVO"')
    InsertSQL.Strings = (
      'insert into "DIG_ARQUIVO"'
      '('
      '  "CD_ARQUIVO"'
      ', "BL_ARQUIVO"'
      ', "DS_ARQUIVO")'
      'values'
      '('
      '  :"CD_ARQUIVO"'
      ', :"BL_ARQUIVO"'
      ', :"DS_ARQUIVO"'
      ')')
    SelectSQL.Strings = (
      'select "DIG_ARQUIVO"."CD_ARQUIVO"'
      '      ,"DIG_ARQUIVO"."BL_ARQUIVO"'
      '      ,"DIG_ARQUIVO"."DS_ARQUIVO"'
      'from "DIG_ARQUIVO"'
      'where CD_ARQUIVO = :CD_ARQUIVO')
    ModifySQL.Strings = (
      'update "DIG_ARQUIVO"'
      'set'
      ' "CD_ARQUIVO" = :"CD_ARQUIVO"'
      ', "BL_ARQUIVO" = :"BL_ARQUIVO"'
      ', "DS_ARQUIVO" = :"DS_ARQUIVO"'
      'where'
      '  "CD_ARQUIVO" = :"OLD_CD_ARQUIVO"')
    GeneratorField.Field = 'CD_ARQUIVO'
    GeneratorField.Generator = 'GEN_DIG_ARQUIVO'
    Left = 40
    Top = 88
    object tbDig_ArquivoCD_ARQUIVO: TIntegerField
      FieldName = 'CD_ARQUIVO'
      Origin = 'DIG_ARQUIVO.CD_ARQUIVO'
      Required = True
    end
    object tbDig_ArquivoBL_ARQUIVO: TBlobField
      FieldName = 'BL_ARQUIVO'
      Origin = 'DIG_ARQUIVO.BL_ARQUIVO'
      Size = 8
    end
    object tbDig_ArquivoDS_ARQUIVO: TIBStringField
      FieldName = 'DS_ARQUIVO'
      Origin = 'DIG_ARQUIVO.DS_ARQUIVO'
      Size = 500
    end
  end
  object tbArquivo_Digital: TIBDataSet
    Database = dbDig
    Transaction = tsDig
    AfterDelete = tbArquivo_DigitalAfterDelete
    AfterInsert = tbArquivo_DigitalAfterInsert
    AfterPost = tbArquivo_DigitalAfterPost
    BeforeOpen = tbArquivo_DigitalBeforeOpen
    BufferChunks = 1000
    CachedUpdates = False
    DeleteSQL.Strings = (
      'delete from "ARQUIVO_DIGITAL"'
      'where'
      '  "NR_PROCESSO" = :"OLD_NR_PROCESSO" and '
      '  "CD_ARQUIVO" = :"OLD_CD_ARQUIVO"')
    InsertSQL.Strings = (
      'insert into "ARQUIVO_DIGITAL"'
      '('
      '  "NR_PROCESSO"'
      ', "CD_ARQUIVO"'
      ', "CD_ARQUIVO_EDT"'
      ', "TP_ARQUIVO"'
      ', "CD_GRUPO"'
      ', "NU_ORDEM"'
      ', "NM_ARQUIVO"'
      ', "DT_ARQUIVO"'
      ', "NR_ROTACAO"'
      ')'
      'values'
      '('
      '  :"NR_PROCESSO"'
      ', :"CD_ARQUIVO"'
      ', :"CD_ARQUIVO_EDT"'
      ', :"TP_ARQUIVO"'
      ', :"CD_GRUPO"'
      ', :"NU_ORDEM"'
      ', :"NM_ARQUIVO"'
      ', :"DT_ARQUIVO"'
      ', :"NR_ROTACAO"'
      ')')
    SelectSQL.Strings = (
      'select "ARQUIVO_DIGITAL"."NR_PROCESSO"'
      '      ,"ARQUIVO_DIGITAL"."TP_ARQUIVO"'
      '      ,"ARQUIVO_DIGITAL"."CD_ARQUIVO"'
      '      ,"ARQUIVO_DIGITAL"."CD_ARQUIVO_EDT"'
      '      ,"ARQUIVO_DIGITAL"."CD_GRUPO"'
      '      ,"ARQUIVO_DIGITAL"."NU_ORDEM"'
      '      ,"ARQUIVO_DIGITAL"."NM_ARQUIVO"'
      '      ,"ARQUIVO_DIGITAL"."DT_ARQUIVO"'
      '      ,"ARQUIVO_DIGITAL"."NR_ROTACAO"'
      '      ,G.DS_GRUPO'
      'from "ARQUIVO_DIGITAL", DIG_GRUPO G'
      'where  "ARQUIVO_DIGITAL"."CD_GRUPO" = G.CD_GRUPO'
      'and NR_PROCESSO = :NR_PROCESSO'
      'order by'
      '"ARQUIVO_DIGITAL"."NR_PROCESSO", '
      '"ARQUIVO_DIGITAL"."CD_GRUPO",'
      '"ARQUIVO_DIGITAL"."NU_ORDEM",'
      '"ARQUIVO_DIGITAL"."CD_ARQUIVO"')
    ModifySQL.Strings = (
      'update "ARQUIVO_DIGITAL"'
      'set'
      ' "NR_PROCESSO" = :"NR_PROCESSO"'
      ', "CD_ARQUIVO" = :"CD_ARQUIVO"'
      ', "TP_ARQUIVO" = :"TP_ARQUIVO"'
      ', "CD_ARQUIVO_EDT" = :"CD_ARQUIVO_EDT"'
      ', "CD_GRUPO" = :"CD_GRUPO"'
      ', "NU_ORDEM" = :"NU_ORDEM"'
      ', "NM_ARQUIVO" = :"NM_ARQUIVO"'
      ', "DT_ARQUIVO" = :"DT_ARQUIVO"'
      ', "NR_ROTACAO" = :"NR_ROTACAO"'
      'where'
      '  "NR_PROCESSO" = :"OLD_NR_PROCESSO" and '
      '  "CD_ARQUIVO" = :"OLD_CD_ARQUIVO"')
    Left = 144
    Top = 24
    object tbArquivo_DigitalNR_PROCESSO: TIntegerField
      FieldName = 'NR_PROCESSO'
      Origin = 'ARQUIVO_DIGITAL.NR_PROCESSO'
      Required = True
    end
    object tbArquivo_DigitalCD_ARQUIVO: TIntegerField
      FieldName = 'CD_ARQUIVO'
      Origin = 'ARQUIVO_DIGITAL.CD_ARQUIVO'
      Required = True
    end
    object tbArquivo_DigitalCD_ARQUIVO_EDT: TIntegerField
      FieldName = 'CD_ARQUIVO_EDT'
      Origin = 'ARQUIVO_DIGITAL.CD_ARQUIVO_EDT'
    end
    object tbArquivo_DigitalCD_GRUPO: TIntegerField
      FieldName = 'CD_GRUPO'
      Origin = 'ARQUIVO_DIGITAL.CD_GRUPO'
      Required = True
    end
    object tbArquivo_DigitalNU_ORDEM: TIntegerField
      FieldName = 'NU_ORDEM'
      Origin = 'ARQUIVO_DIGITAL.NU_ORDEM'
    end
    object tbArquivo_DigitalDS_GRUPO: TIBStringField
      FieldName = 'DS_GRUPO'
      Origin = 'DIG_GRUPO.DS_GRUPO'
      Size = 50
    end
    object tbArquivo_DigitalTP_ARQUIVO: TIntegerField
      FieldName = 'TP_ARQUIVO'
      Origin = 'ARQUIVO_DIGITAL.TP_ARQUIVO'
    end
    object tbArquivo_DigitalNM_ARQUIVO: TIBStringField
      FieldName = 'NM_ARQUIVO'
      Origin = 'ARQUIVO_DIGITAL.NM_ARQUIVO'
      Size = 100
    end
    object tbArquivo_DigitalDT_ARQUIVO: TDateTimeField
      FieldName = 'DT_ARQUIVO'
      Origin = 'ARQUIVO_DIGITAL.DT_ARQUIVO'
    end
    object tbArquivo_DigitalNR_ROTACAO: TIntegerField
      FieldName = 'NR_ROTACAO'
      Origin = 'ARQUIVO_DIGITAL.NR_ROTACAO'
    end
  end
  object tbDig_GrupoDoc: TIBDataSet
    Database = dbDig
    Transaction = tsDig
    BeforeClose = tbDig_GrupoDocBeforeClose
    BufferChunks = 1000
    CachedUpdates = False
    DeleteSQL.Strings = (
      'delete from "DIG_GRUPO"'
      'where'
      '  "CD_GRUPO" = :"OLD_CD_GRUPO"')
    InsertSQL.Strings = (
      'insert into "DIG_GRUPO"'
      '('
      '  "CD_GRUPO"'
      ', "DS_GRUPO"'
      ', "FL_NOVO"'
      ')'
      'values'
      '('
      '  :"CD_GRUPO"'
      ', :"DS_GRUPO"'
      ', :"FL_NOVO"'
      ')')
    SelectSQL.Strings = (
      'select "DIG_GRUPO"."CD_GRUPO"'
      '      ,"DIG_GRUPO"."DS_GRUPO"'
      '      ,"DIG_GRUPO"."FL_NOVO"'
      'from "DIG_GRUPO"'
      'order by'
      '"DIG_GRUPO"."CD_GRUPO"')
    ModifySQL.Strings = (
      'update "DIG_GRUPO"'
      'set'
      ' "CD_GRUPO" = :"CD_GRUPO"'
      ', "DS_GRUPO" = :"DS_GRUPO"'
      ', "FL_NOVO" = :"FL_NOVO"'
      'where'
      '  "CD_GRUPO" = :"OLD_CD_GRUPO"')
    GeneratorField.Field = 'CD_GRUPO'
    GeneratorField.Generator = 'GEN_DIG_GRUPO'
    Left = 144
    Top = 80
    object tbDig_GrupoDocCD_GRUPO: TIntegerField
      FieldName = 'CD_GRUPO'
      Origin = 'DIG_GRUPO.CD_GRUPO'
      Required = True
    end
    object tbDig_GrupoDocDS_GRUPO: TIBStringField
      FieldName = 'DS_GRUPO'
      Origin = 'DIG_GRUPO.DS_GRUPO'
      Required = True
      Size = 50
    end
    object tbDig_GrupoDocFL_NOVO: TIntegerField
      FieldName = 'FL_NOVO'
      Origin = 'DIG_GRUPO.FL_NOVO'
    end
  end
  object tbEdt_Arquivo: TIBDataSet
    Database = dbDig
    Transaction = tsDig
    BufferChunks = 1000
    CachedUpdates = False
    DeleteSQL.Strings = (
      'delete from "EDT_ARQUIVO"'
      'where'
      '  "CD_ARQUIVO" = :"OLD_CD_ARQUIVO"')
    InsertSQL.Strings = (
      'insert into "EDT_ARQUIVO"'
      '('
      '  "CD_ARQUIVO"'
      ', "BL_ARQUIVO"'
      ')'
      'values'
      '('
      '  :"CD_ARQUIVO"'
      ', :"BL_ARQUIVO"'
      ')')
    SelectSQL.Strings = (
      'select "EDT_ARQUIVO"."CD_ARQUIVO"'
      '      ,"EDT_ARQUIVO"."BL_ARQUIVO"'
      'from "EDT_ARQUIVO"'
      'where CD_ARQUIVO = :CD_ARQUIVO')
    ModifySQL.Strings = (
      'update "EDT_ARQUIVO"'
      'set'
      ' "CD_ARQUIVO" = :"CD_ARQUIVO"'
      ', "BL_ARQUIVO" = :"BL_ARQUIVO"'
      'where'
      '  "CD_ARQUIVO" = :"OLD_CD_ARQUIVO"')
    GeneratorField.Field = 'CD_ARQUIVO'
    GeneratorField.Generator = 'GEN_EDT_ARQUIVO'
    Left = 40
    Top = 144
    object tbEdt_ArquivoCD_ARQUIVO: TIntegerField
      FieldName = 'CD_ARQUIVO'
      Origin = 'EDT_ARQUIVO.CD_ARQUIVO'
      Required = True
    end
    object tbEdt_ArquivoBL_ARQUIVO: TBlobField
      FieldName = 'BL_ARQUIVO'
      Origin = 'EDT_ARQUIVO.BL_ARQUIVO'
      Size = 8
    end
  end
  object tbDig_GrupoMod: TIBDataSet
    Database = dbDig
    Transaction = tsDig
    BufferChunks = 1000
    CachedUpdates = False
    DeleteSQL.Strings = (
      'delete from "DIG_GRUPO_MODELO"'
      'where'
      '  "CD_GRUPO" = :"OLD_CD_GRUPO"')
    InsertSQL.Strings = (
      'insert into "DIG_GRUPO_MODELO"'
      '('
      '  "CD_GRUPO"'
      ', "DS_GRUPO"'
      ')'
      'values'
      '('
      '  :"CD_GRUPO"'
      ', :"DS_GRUPO"'
      ')')
    SelectSQL.Strings = (
      'select "DIG_GRUPO_MODELO"."CD_GRUPO"'
      '      ,"DIG_GRUPO_MODELO"."DS_GRUPO"'
      'from "DIG_GRUPO_MODELO"'
      'order by'
      '"DIG_GRUPO_MODELO"."CD_GRUPO"')
    ModifySQL.Strings = (
      'update "DIG_GRUPO_MODELO"'
      'set'
      ' "CD_GRUPO" = :"CD_GRUPO"'
      ', "DS_GRUPO" = :"DS_GRUPO"'
      'where'
      '  "CD_GRUPO" = :"OLD_CD_GRUPO"')
    GeneratorField.Field = 'CD_GRUPO'
    GeneratorField.Generator = 'GEN_DIG_GRUPO_MODELO'
    Left = 144
    Top = 136
    object tbDig_GrupoModCD_GRUPO: TIntegerField
      FieldName = 'CD_GRUPO'
      Origin = 'DIG_GRUPO_MODELO.CD_GRUPO'
      Required = True
    end
    object tbDig_GrupoModDS_GRUPO: TIBStringField
      FieldName = 'DS_GRUPO'
      Origin = 'DIG_GRUPO_MODELO.DS_GRUPO'
      Required = True
      Size = 50
    end
  end
  object tbModelo_Documento: TIBDataSet
    Database = dbDig
    Transaction = tsDig
    BufferChunks = 1000
    CachedUpdates = False
    DeleteSQL.Strings = (
      'delete from "MODELO_DOCUMENTO"'
      'where'
      '  "CD_MODELO" = :"OLD_CD_MODELO"')
    InsertSQL.Strings = (
      'insert into "MODELO_DOCUMENTO"'
      '('
      '  "CD_MODELO"'
      ', "DS_MODELO"'
      ', "CD_GRUPO"'
      ', "CD_DOCUMENTO"'
      ', "CD_GRUPO_DOC"'
      ')'
      'values'
      '('
      '  :"CD_MODELO"'
      ', :"DS_MODELO"'
      ', :"CD_GRUPO"'
      ', :"CD_DOCUMENTO"'
      ', :"CD_GRUPO_DOC"'
      ')')
    SelectSQL.Strings = (
      'select "MODELO_DOCUMENTO"."CD_MODELO"'
      '      ,"MODELO_DOCUMENTO"."DS_MODELO"'
      '      ,"MODELO_DOCUMENTO"."CD_GRUPO"'
      '      ,"MODELO_DOCUMENTO"."CD_DOCUMENTO"'
      '      ,"MODELO_DOCUMENTO"."CD_GRUPO_DOC"'
      '      ,"DIG_GRUPO_MODELO"."DS_GRUPO"'
      'from "MODELO_DOCUMENTO"'
      'left outer join  "DIG_GRUPO_MODELO"'
      'on ("MODELO_DOCUMENTO"."CD_GRUPO"="DIG_GRUPO_MODELO"."CD_GRUPO")'
      'order by'
      '"MODELO_DOCUMENTO"."CD_GRUPO",'
      '"MODELO_DOCUMENTO"."DS_MODELO"')
    ModifySQL.Strings = (
      'update "MODELO_DOCUMENTO"'
      'set'
      ' "CD_MODELO" = :"CD_MODELO"'
      ', "DS_MODELO" = :"DS_MODELO"'
      ', "CD_GRUPO" = :"CD_GRUPO"'
      ', "CD_DOCUMENTO" = :"CD_DOCUMENTO"'
      ', "CD_GRUPO_DOC" = :"CD_GRUPO_DOC"'
      'where'
      '  "CD_MODELO" = :"OLD_CD_MODELO"')
    GeneratorField.Field = 'CD_MODELO'
    GeneratorField.Generator = 'GEN_MODELO_DOCUMENTO'
    Left = 40
    Top = 216
    object tbModelo_DocumentoCD_MODELO: TIntegerField
      FieldName = 'CD_MODELO'
      Origin = 'MODELO_DOCUMENTO.CD_MODELO'
      Required = True
    end
    object tbModelo_DocumentoDS_MODELO: TIBStringField
      FieldName = 'DS_MODELO'
      Origin = 'MODELO_DOCUMENTO.DS_MODELO'
      Size = 60
    end
    object tbModelo_DocumentoCD_GRUPO: TIntegerField
      FieldName = 'CD_GRUPO'
      Origin = 'MODELO_DOCUMENTO.CD_GRUPO'
    end
    object tbModelo_DocumentoCD_DOCUMENTO: TIntegerField
      FieldName = 'CD_DOCUMENTO'
      Origin = 'MODELO_DOCUMENTO.CD_DOCUMENTO'
    end
    object tbModelo_DocumentoDS_GRUPO: TIBStringField
      FieldName = 'DS_GRUPO'
      Origin = 'DIG_GRUPO_MODELO.DS_GRUPO'
      Size = 50
    end
    object tbModelo_DocumentoCD_GRUPO_DOC: TIntegerField
      FieldName = 'CD_GRUPO_DOC'
      Origin = 'MODELO_DOCUMENTO.CD_GRUPO_DOC'
    end
  end
  object qyPaciente: TIBQuery
    Database = DM.DB
    Transaction = DM.TS
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select'
      '  NR_PROCESSO,'
      '  CD_PACIENTE,'
      '  CD_UND,'
      '  NM_PACIENTE,'
      '  DT_NASCIMENTO,'
      '  IDADE,'
      '  NM_MAE'
      'from PACIENTE'
      'where NR_PROCESSO = :NR_PROCESSO')
    Left = 328
    Top = 40
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'NR_PROCESSO'
        ParamType = ptUnknown
      end>
  end
  object tbDig_Processo: TIBDataSet
    Database = dbDig
    Transaction = tsDig
    BufferChunks = 1000
    CachedUpdates = False
    DeleteSQL.Strings = (
      'delete from "DIG_PROCESSO"'
      'where'
      '  "NR_PROCESSO" = :"OLD_NR_PROCESSO"')
    InsertSQL.Strings = (
      'insert into "DIG_PROCESSO"'
      '('
      '  "NR_PROCESSO"'
      ', "NM_PACIENTE"'
      ', "DT_NASCIMENTO"'
      ', "IDADE"'
      ', "NM_MAE"'
      ')'
      'values'
      '('
      '  :"NR_PROCESSO"'
      ', :"NM_PACIENTE"'
      ', :"DT_NASCIMENTO"'
      ', :"IDADE"'
      ', :"NM_MAE"'
      ')')
    SelectSQL.Strings = (
      'select "DIG_PROCESSO"."NR_PROCESSO"'
      '      ,"DIG_PROCESSO"."NM_PACIENTE"'
      '      ,"DIG_PROCESSO"."DT_NASCIMENTO"'
      '      ,"DIG_PROCESSO"."IDADE"'
      '      ,"DIG_PROCESSO"."NM_MAE"'
      'from "DIG_PROCESSO"'
      'where NR_PROCESSO = :NR_PROCESSO')
    ModifySQL.Strings = (
      'update "DIG_PROCESSO"'
      'set'
      ' "NR_PROCESSO" = :"NR_PROCESSO"'
      ', "NM_PACIENTE" = :"NM_PACIENTE"'
      ', "DT_NASCIMENTO" = :"DT_NASCIMENTO"'
      ', "IDADE" = :"IDADE"'
      ', "NM_MAE" = :"NM_MAE"'
      'where'
      '  "NR_PROCESSO" = :"OLD_NR_PROCESSO"')
    Left = 328
    Top = 104
    object tbDig_ProcessoNR_PROCESSO: TIntegerField
      FieldName = 'NR_PROCESSO'
      Origin = 'DIG_PROCESSO.NR_PROCESSO'
      Required = True
    end
    object tbDig_ProcessoNM_PACIENTE: TIBStringField
      FieldName = 'NM_PACIENTE'
      Origin = 'DIG_PROCESSO.NM_PACIENTE'
      Required = True
      Size = 50
    end
    object tbDig_ProcessoDT_NASCIMENTO: TDateField
      FieldName = 'DT_NASCIMENTO'
      Origin = 'DIG_PROCESSO.DT_NASCIMENTO'
      Required = True
    end
    object tbDig_ProcessoIDADE: TSmallintField
      FieldName = 'IDADE'
      Origin = 'DIG_PROCESSO.IDADE'
      Required = True
    end
    object tbDig_ProcessoNM_MAE: TIBStringField
      FieldName = 'NM_MAE'
      Origin = 'DIG_PROCESSO.NM_MAE'
      Required = True
      Size = 50
    end
  end
  object tbHistorico: TIBDataSet
    Database = dbDig
    Transaction = tsDig
    AfterInsert = tbHistoricoAfterInsert
    BeforeEdit = tbHistoricoBeforeEdit
    OnCalcFields = tbHistoricoCalcFields
    BufferChunks = 1000
    CachedUpdates = False
    DeleteSQL.Strings = (
      'delete from "HISTORICO"'
      'where'
      '  "CD_HISTORICO" = :"OLD_CD_HISTORICO"')
    InsertSQL.Strings = (
      'insert into "HISTORICO"'
      '('
      '  "CD_HISTORICO"'
      ', "CD_PACIENTE"'
      ', "DT_HISTORICO"'
      ', "DS_HISTORICO"'
      ', "CD_MEDICO"'
      ', "CD_GRUPO"'
      ', "CD_PAI"'
      ', "FL_FILHO"'
      ', "CD_ARQUIVO"'
      ', "BL_HISTORICO"'
      ')'
      'values'
      '('
      '  :"CD_HISTORICO"'
      ', :"CD_PACIENTE"'
      ', :"DT_HISTORICO"'
      ', :"DS_HISTORICO"'
      ', :"CD_MEDICO"'
      ', :"CD_GRUPO"'
      ', :"CD_PAI"'
      ', :"FL_FILHO"'
      ', :"CD_ARQUIVO"'
      ', :"BL_HISTORICO"'
      ')')
    SelectSQL.Strings = (
      'select "HISTORICO"."CD_HISTORICO"'
      '      ,"HISTORICO"."CD_PACIENTE"'
      '      ,"HISTORICO"."DT_HISTORICO"'
      '      ,"HISTORICO"."DS_HISTORICO"'
      '      ,"DIG_GRUPO"."DS_GRUPO"'
      '      ,"HISTORICO"."CD_MEDICO"'
      '      ,"HISTORICO"."CD_GRUPO"'
      '      ,"HISTORICO"."BL_HISTORICO"'
      '      ,"HISTORICO"."CD_PAI"'
      '      ,"HISTORICO"."FL_FILHO"'
      '      ,"HISTORICO"."CD_ARQUIVO"'
      'from "HISTORICO"'
      '  left outer join  DIG_GRUPO'
      '  on (DIG_GRUPO.CD_GRUPO = HISTORICO.CD_GRUPO)'
      'where   CD_PACIENTE = :CD_PACIENTE'
      'order by   CD_GRUPO, DT_HISTORICO desc')
    ModifySQL.Strings = (
      'update "HISTORICO"'
      'set'
      ' "CD_HISTORICO" = :"CD_HISTORICO"'
      ', "CD_PACIENTE" = :"CD_PACIENTE"'
      ', "DT_HISTORICO" = :"DT_HISTORICO"'
      ', "DS_HISTORICO" = :"DS_HISTORICO"'
      ', "CD_MEDICO" = :"CD_MEDICO"'
      ', "CD_GRUPO" =  :"CD_GRUPO"'
      ', "BL_HISTORICO" = :"BL_HISTORICO"'
      ', "CD_PAI" = :"CD_PAI"'
      ', "FL_FILHO" = :"FL_FILHO"'
      ', "CD_ARQUIVO" = :"CD_ARQUIVO"'
      'where'
      '  "CD_HISTORICO" = :"OLD_CD_HISTORICO"')
    GeneratorField.Field = 'CD_HISTORICO'
    GeneratorField.Generator = 'GEN_HISTORICO'
    OnFilterRecord = tbHistoricoFilterRecord
    Left = 328
    Top = 168
    object tbHistoricoCD_HISTORICO: TIntegerField
      FieldName = 'CD_HISTORICO'
      Origin = 'HISTORICO.CD_HISTORICO'
      Required = True
    end
    object tbHistoricoCD_PACIENTE: TIntegerField
      FieldName = 'CD_PACIENTE'
      Origin = 'HISTORICO.CD_PACIENTE'
      Required = True
    end
    object tbHistoricoDT_HISTORICO: TDateTimeField
      FieldName = 'DT_HISTORICO'
      Origin = 'HISTORICO.DT_HISTORICO'
      DisplayFormat = 'dd/mm/yy hh:nn:ss'
    end
    object tbHistoricoDS_HISTORICO: TIBStringField
      FieldName = 'DS_HISTORICO'
      Origin = 'HISTORICO.DS_HISTORICO'
      Size = 100
    end
    object tbHistoricoCD_MEDICO: TIntegerField
      FieldName = 'CD_MEDICO'
      Origin = 'HISTORICO.CD_MEDICO'
    end
    object tbHistoricoBL_HISTORICO: TBlobField
      FieldName = 'BL_HISTORICO'
      Origin = 'HISTORICO.BL_HISTORICO'
      Size = 8
    end
    object tbHistoricoCD_GRUPO: TIntegerField
      FieldName = 'CD_GRUPO'
      Origin = 'HISTORICO.CD_GRUPO'
      OnValidate = tbHistoricoCD_GRUPOValidate
    end
    object tbHistoricoDS_GRUPO: TIBStringField
      FieldName = 'DS_GRUPO'
      Origin = 'DIG_GRUPO.DS_GRUPO'
      Size = 50
    end
    object tbHistoricoNM_MEDICO: TStringField
      FieldKind = fkCalculated
      FieldName = 'NM_MEDICO'
      Size = 50
      Calculated = True
    end
    object tbHistoricoCD_PAI: TIntegerField
      FieldName = 'CD_PAI'
      Origin = 'HISTORICO.CD_PAI'
    end
    object tbHistoricoFL_FILHO: TIBStringField
      FieldName = 'FL_FILHO'
      Origin = 'HISTORICO.FL_FILHO'
      FixedChar = True
      Size = 1
    end
    object tbHistoricoCD_ARQUIVO: TIntegerField
      FieldName = 'CD_ARQUIVO'
      Origin = 'HISTORICO.CD_ARQUIVO'
    end
  end
  object qyMedico: TIBQuery
    Database = DM.DB
    Transaction = DM.TS
    BufferChunks = 1000
    CachedUpdates = False
    DataSource = dsHistorico
    SQL.Strings = (
      'select CD_MEDICO, NM_MEDICO '
      'from MEDICO'
      'where CD_MEDICO = :CD_MEDICO')
    Left = 416
    Top = 40
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'CD_MEDICO'
        ParamType = ptUnknown
      end>
    object qyMedicoNM_MEDICO: TIBStringField
      FieldName = 'NM_MEDICO'
      Origin = 'MEDICO.NM_MEDICO'
      Size = 50
    end
    object qyMedicoCD_MEDICO: TIntegerField
      FieldName = 'CD_MEDICO'
      Origin = 'MEDICO.CD_MEDICO'
      Required = True
    end
  end
  object dsHistorico: TDataSource
    DataSet = tbHistorico
    Left = 400
    Top = 168
  end
  object qyArquivoDigital: TIBQuery
    Database = dbDig
    Transaction = tsDig
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select NR_PROCESSO'
      'from ARQUIVO_DIGITAL'
      'where NR_PROCESSO = :NR_PROCESSO'
      'and CD_GRUPO <> :CD_GRUPO')
    Left = 328
    Top = 232
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'NR_PROCESSO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CD_GRUPO'
        ParamType = ptUnknown
      end>
  end
  object tbArquivo_Exame: TIBDataSet
    Database = dbDig
    Transaction = tsDig
    AfterDelete = tbArquivo_ExameAfterDelete
    AfterPost = tbArquivo_ExameAfterPost
    BufferChunks = 1000
    CachedUpdates = False
    DeleteSQL.Strings = (
      'delete from "ARQUIVO_EXAME"'
      'where'
      '  "CD_ARQUIVO" = :"OLD_CD_ARQUIVO" and '
      '  "CD_AGENDA" = :"OLD_CD_AGENDA"')
    InsertSQL.Strings = (
      'insert into "ARQUIVO_EXAME"'
      '('
      '  "CD_ARQUIVO"'
      ', "CD_AGENDA"'
      ')'
      'values'
      '('
      '  :"CD_ARQUIVO"'
      ', :"CD_AGENDA"'
      ')')
    SelectSQL.Strings = (
      'select CD_AGENDA, CD_ARQUIVO'
      'from ARQUIVO_EXAME'
      'where CD_ARQUIVO = :CD_ARQUIVO')
    ModifySQL.Strings = (
      'update "ARQUIVO_EXAME"'
      'set'
      ' "CD_ARQUIVO" = :"CD_ARQUIVO"'
      ', "CD_AGENDA" = :"CD_AGENDA"'
      'where'
      '  "CD_ARQUIVO" = :"OLD_CD_ARQUIVO" and '
      '  "CD_AGENDA" = :"OLD_CD_AGENDA"')
    Left = 176
    Top = 232
    object tbArquivo_ExameCD_AGENDA: TIntegerField
      FieldName = 'CD_AGENDA'
      Origin = 'ARQUIVO_EXAME.CD_AGENDA'
      Required = True
    end
    object tbArquivo_ExameCD_ARQUIVO: TIntegerField
      FieldName = 'CD_ARQUIVO'
      Origin = 'ARQUIVO_EXAME.CD_ARQUIVO'
      Required = True
    end
  end
  object qyGrupo: TIBQuery
    Database = dbDig
    Transaction = tsDig
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select * from dig_grupo')
    Left = 216
    Top = 40
    object qyGrupoCD_GRUPO: TIntegerField
      FieldName = 'CD_GRUPO'
      Origin = 'DIG_GRUPO.CD_GRUPO'
      Required = True
    end
    object qyGrupoDS_GRUPO: TIBStringField
      FieldName = 'DS_GRUPO'
      Origin = 'DIG_GRUPO.DS_GRUPO'
      Required = True
      Size = 50
    end
  end
  object dsPaciente: TDataSource
    DataSet = qyPaciente
    Left = 424
    Top = 96
  end
  object qyNotificacao: TIBQuery
    Database = DM.DB
    Transaction = DM.TS
    BufferChunks = 1000
    CachedUpdates = False
    DataSource = dsPaciente
    SQL.Strings = (
      'select * from Notificacao'
      'where cd_paciente = :cd_paciente'
      'and cd_und =:cd_und')
    Left = 464
    Top = 144
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'cd_paciente'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cd_und'
        ParamType = ptUnknown
      end>
    object qyNotificacaoCD_FICHA: TLargeintField
      FieldName = 'CD_FICHA'
      Origin = 'NOTIFICACAO.CD_FICHA'
      Required = True
    end
    object qyNotificacaoCD_UND: TIntegerField
      FieldName = 'CD_UND'
      Origin = 'NOTIFICACAO.CD_UND'
      Required = True
    end
    object qyNotificacaoCD_UNIDADE: TIntegerField
      FieldName = 'CD_UNIDADE'
      Origin = 'NOTIFICACAO.CD_UNIDADE'
      Required = True
    end
    object qyNotificacaoCD_USUARIO: TIntegerField
      FieldName = 'CD_USUARIO'
      Origin = 'NOTIFICACAO.CD_USUARIO'
      Required = True
    end
    object qyNotificacaoCD_MUNICIPIO: TIntegerField
      FieldName = 'CD_MUNICIPIO'
      Origin = 'NOTIFICACAO.CD_MUNICIPIO'
      Required = True
    end
    object qyNotificacaoCD_UNIDADE_TRATAMENTO: TIntegerField
      FieldName = 'CD_UNIDADE_TRATAMENTO'
      Origin = 'NOTIFICACAO.CD_UNIDADE_TRATAMENTO'
    end
    object qyNotificacaoCD_MUNICIPIO_TRATAMENTO: TIntegerField
      FieldName = 'CD_MUNICIPIO_TRATAMENTO'
      Origin = 'NOTIFICACAO.CD_MUNICIPIO_TRATAMENTO'
    end
    object qyNotificacaoCD_PACIENTE: TIntegerField
      FieldName = 'CD_PACIENTE'
      Origin = 'NOTIFICACAO.CD_PACIENTE'
      Required = True
    end
    object qyNotificacaoDT_NOTIFICACAO: TDateField
      FieldName = 'DT_NOTIFICACAO'
      Origin = 'NOTIFICACAO.DT_NOTIFICACAO'
      Required = True
    end
    object qyNotificacaoDT_DIAGNOSTICO: TDateField
      FieldName = 'DT_DIAGNOSTICO'
      Origin = 'NOTIFICACAO.DT_DIAGNOSTICO'
      Required = True
    end
    object qyNotificacaoCD_RELACOES_SEXO: TSmallintField
      FieldName = 'CD_RELACOES_SEXO'
      Origin = 'NOTIFICACAO.CD_RELACOES_SEXO'
    end
    object qyNotificacaoCD_MAE_POSITIVO: TSmallintField
      FieldName = 'CD_MAE_POSITIVO'
      Origin = 'NOTIFICACAO.CD_MAE_POSITIVO'
    end
    object qyNotificacaoCD_USOU_DROGA: TSmallintField
      FieldName = 'CD_USOU_DROGA'
      Origin = 'NOTIFICACAO.CD_USOU_DROGA'
    end
    object qyNotificacaoCD_ACIDENTE_MAT_BIO: TSmallintField
      FieldName = 'CD_ACIDENTE_MAT_BIO'
      Origin = 'NOTIFICACAO.CD_ACIDENTE_MAT_BIO'
    end
    object qyNotificacaoSN_TRANSFUSAO_SANGUE: TIntegerField
      FieldName = 'SN_TRANSFUSAO_SANGUE'
      Origin = 'NOTIFICACAO.SN_TRANSFUSAO_SANGUE'
    end
    object qyNotificacaoSN_PERFURACAO: TIntegerField
      FieldName = 'SN_PERFURACAO'
      Origin = 'NOTIFICACAO.SN_PERFURACAO'
    end
    object qyNotificacaoSN_TRAT_DENTARIO: TIntegerField
      FieldName = 'SN_TRAT_DENTARIO'
      Origin = 'NOTIFICACAO.SN_TRAT_DENTARIO'
    end
    object qyNotificacaoSN_INTERV_CIRURGICA: TIntegerField
      FieldName = 'SN_INTERV_CIRURGICA'
      Origin = 'NOTIFICACAO.SN_INTERV_CIRURGICA'
    end
    object qyNotificacaoSN_CIRCUNCISAO: TIntegerField
      FieldName = 'SN_CIRCUNCISAO'
      Origin = 'NOTIFICACAO.SN_CIRCUNCISAO'
    end
    object qyNotificacaoCD_TESTE_TRIAGEM: TSmallintField
      FieldName = 'CD_TESTE_TRIAGEM'
      Origin = 'NOTIFICACAO.CD_TESTE_TRIAGEM'
      Required = True
    end
    object qyNotificacaoDS_TESTE_TRIAGEM: TIBStringField
      FieldName = 'DS_TESTE_TRIAGEM'
      Origin = 'NOTIFICACAO.DS_TESTE_TRIAGEM'
      Size = 50
    end
    object qyNotificacaoCD_OCUPACAO: TSmallintField
      FieldName = 'CD_OCUPACAO'
      Origin = 'NOTIFICACAO.CD_OCUPACAO'
    end
    object qyNotificacaoDS_OCUPACAO: TIBStringField
      FieldName = 'DS_OCUPACAO'
      Origin = 'NOTIFICACAO.DS_OCUPACAO'
      Size = 50
    end
    object qyNotificacaoCD_TESTE_CONFIRMATORIO: TSmallintField
      FieldName = 'CD_TESTE_CONFIRMATORIO'
      Origin = 'NOTIFICACAO.CD_TESTE_CONFIRMATORIO'
      Required = True
    end
    object qyNotificacaoDS_TESTE_CONFIRMATORIO: TIBStringField
      FieldName = 'DS_TESTE_CONFIRMATORIO'
      Origin = 'NOTIFICACAO.DS_TESTE_CONFIRMATORIO'
      Size = 50
    end
    object qyNotificacaoCD_OMS: TSmallintField
      FieldName = 'CD_OMS'
      Origin = 'NOTIFICACAO.CD_OMS'
    end
    object qyNotificacaoCD_CD4: TIntegerField
      FieldName = 'CD_CD4'
      Origin = 'NOTIFICACAO.CD_CD4'
    end
    object qyNotificacaoCD_EVOLUCAO: TSmallintField
      FieldName = 'CD_EVOLUCAO'
      Origin = 'NOTIFICACAO.CD_EVOLUCAO'
    end
    object qyNotificacaoDT_EVOLUCAO: TDateField
      FieldName = 'DT_EVOLUCAO'
      Origin = 'NOTIFICACAO.DT_EVOLUCAO'
    end
    object qyNotificacaoDS_OBSERVACAO: TIBStringField
      FieldName = 'DS_OBSERVACAO'
      Origin = 'NOTIFICACAO.DS_OBSERVACAO'
      Size = 1000
    end
    object qyNotificacaoCD_NOTIFICACAO: TIntegerField
      FieldName = 'CD_NOTIFICACAO'
      Origin = 'NOTIFICACAO.CD_NOTIFICACAO'
      Required = True
    end
    object qyNotificacaoREGDUP: TIBStringField
      FieldName = 'REGDUP'
      Origin = 'NOTIFICACAO.REGDUP'
      FixedChar = True
      Size = 1
    end
    object qyNotificacaoCD_LOTE: TIntegerField
      FieldName = 'CD_LOTE'
      Origin = 'NOTIFICACAO.CD_LOTE'
    end
    object qyNotificacaoNM_ENTREVISTADOR: TIBStringField
      FieldName = 'NM_ENTREVISTADOR'
      Origin = 'NOTIFICACAO.NM_ENTREVISTADOR'
      Size = 50
    end
    object qyNotificacaoTEL_ENTREVISTADOR: TIBStringField
      FieldName = 'TEL_ENTREVISTADOR'
      Origin = 'NOTIFICACAO.TEL_ENTREVISTADOR'
      Size = 10
    end
    object qyNotificacaoFUNCAO_ENTREVISTADOR: TIBStringField
      FieldName = 'FUNCAO_ENTREVISTADOR'
      Origin = 'NOTIFICACAO.FUNCAO_ENTREVISTADOR'
      Size = 50
    end
    object qyNotificacaoNM_MEDICO: TIBStringField
      FieldName = 'NM_MEDICO'
      Origin = 'NOTIFICACAO.NM_MEDICO'
      Size = 50
    end
    object qyNotificacaoTEL_MEDICO: TIBStringField
      FieldName = 'TEL_MEDICO'
      Origin = 'NOTIFICACAO.TEL_MEDICO'
      Size = 10
    end
    object qyNotificacaoSN_TATUAGEM: TIntegerField
      FieldName = 'SN_TATUAGEM'
      Origin = 'NOTIFICACAO.SN_TATUAGEM'
    end
    object qyNotificacaoTP_ENTRADA: TIntegerField
      FieldName = 'TP_ENTRADA'
      Origin = 'NOTIFICACAO.TP_ENTRADA'
    end
    object qyNotificacaoEVIDENCIA_GESTANTE: TIntegerField
      FieldName = 'EVIDENCIA_GESTANTE'
      Origin = 'NOTIFICACAO.EVIDENCIA_GESTANTE'
    end
    object qyNotificacaoTB_ATUAL: TIntegerField
      FieldName = 'TB_ATUAL'
      Origin = 'NOTIFICACAO.TB_ATUAL'
    end
    object qyNotificacaoTB_ANTERIOR: TIntegerField
      FieldName = 'TB_ANTERIOR'
      Origin = 'NOTIFICACAO.TB_ANTERIOR'
    end
    object qyNotificacaoDT_TRATAMENTO_TB: TDateField
      FieldName = 'DT_TRATAMENTO_TB'
      Origin = 'NOTIFICACAO.DT_TRATAMENTO_TB'
    end
    object qyNotificacaoCD_PROVINCIA_TRATAMENTO: TIntegerField
      FieldName = 'CD_PROVINCIA_TRATAMENTO'
      Origin = 'NOTIFICACAO.CD_PROVINCIA_TRATAMENTO'
    end
    object qyNotificacaoCD_PROVINCIA_NOT: TIntegerField
      FieldName = 'CD_PROVINCIA_NOT'
      Origin = 'NOTIFICACAO.CD_PROVINCIA_NOT'
    end
    object qyNotificacaoDT_ALTERACAO: TDateTimeField
      FieldName = 'DT_ALTERACAO'
      Origin = 'NOTIFICACAO.DT_ALTERACAO'
    end
    object qyNotificacaoDT_EXPORTACAO: TDateTimeField
      FieldName = 'DT_EXPORTACAO'
      Origin = 'NOTIFICACAO.DT_EXPORTACAO'
    end
    object qyNotificacaoCD_FICHA_ORACLE: TIntegerField
      FieldName = 'CD_FICHA_ORACLE'
      Origin = 'NOTIFICACAO.CD_FICHA_ORACLE'
    end
    object qyNotificacaoCD_MEDICO: TIntegerField
      FieldName = 'CD_MEDICO'
      Origin = 'NOTIFICACAO.CD_MEDICO'
    end
    object qyNotificacaoNR_NOTIFICACAO: TIBStringField
      FieldName = 'NR_NOTIFICACAO'
      Origin = 'NOTIFICACAO.NR_NOTIFICACAO'
      Size = 10
    end
    object qyNotificacaoCD_FICHA_SINVS: TLargeintField
      FieldName = 'CD_FICHA_SINVS'
      Origin = 'NOTIFICACAO.CD_FICHA_SINVS'
    end
    object qyNotificacaoCD_INVESTIGADOR: TIntegerField
      FieldName = 'CD_INVESTIGADOR'
      Origin = 'NOTIFICACAO.CD_INVESTIGADOR'
    end
    object qyNotificacaoDT_TESTE_TRIAGEM: TDateTimeField
      FieldName = 'DT_TESTE_TRIAGEM'
      Origin = 'NOTIFICACAO.DT_TESTE_TRIAGEM'
    end
    object qyNotificacaoDT_TESTE_CONFIRMATORIO: TDateTimeField
      FieldName = 'DT_TESTE_CONFIRMATORIO'
      Origin = 'NOTIFICACAO.DT_TESTE_CONFIRMATORIO'
    end
    object qyNotificacaoNR_PROCESSO_UTENTE: TIBStringField
      FieldName = 'NR_PROCESSO_UTENTE'
      Origin = 'NOTIFICACAO.NR_PROCESSO_UTENTE'
      Size = 30
    end
    object qyNotificacaoDT_EXP: TDateTimeField
      FieldName = 'DT_EXP'
      Origin = 'NOTIFICACAO.DT_EXP'
    end
    object qyNotificacaoCD_EDI: TIntegerField
      FieldName = 'CD_EDI'
      Origin = 'NOTIFICACAO.CD_EDI'
    end
  end
  object dsNotificacao: TDataSource
    DataSet = qyNotificacao
    Left = 456
    Top = 208
  end
end
