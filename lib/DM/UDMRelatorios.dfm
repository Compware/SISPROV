object DMRelatorios: TDMRelatorios
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Left = 512
  Top = 419
  Height = 235
  Width = 325
  object rvDtConfRel: TRvDataSetConnection
    RuntimeVisibility = rtDeveloper
    DataSet = qyConfRelatorio
    Left = 40
    Top = 22
  end
  object rvDtParametros: TRvDataSetConnection
    RuntimeVisibility = rtDeveloper
    DataSet = tbTmpParametro
    Left = 38
    Top = 72
  end
  object tbTmpParametro: TIBTable
    Database = DM.DB
    Transaction = DM.TS
    BufferChunks = 1000
    CachedUpdates = False
    FieldDefs = <
      item
        Name = 'CD_PARAMETRO'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'VL_PARAMETRO1'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'VL_PARAMETRO2'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'VL_PARAMETRO3'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'VL_PARAMETRO4'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'VL_PARAMETRO5'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'VL_PARAMETRO6'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'VL_PARAMETRO7'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'VL_PARAMETRO8'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'VL_PARAMETRO9'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'VL_PARAMETRO10'
        DataType = ftString
        Size = 100
      end>
    IndexDefs = <
      item
        Name = 'RDB$PRIMARY13'
        Fields = 'CD_PARAMETRO'
        Options = [ixPrimary, ixUnique]
      end>
    StoreDefs = True
    TableName = 'TMPPARAMETRO'
    Left = 128
    Top = 72
    object tbTmpParametroCD_PARAMETRO: TIntegerField
      FieldName = 'CD_PARAMETRO'
    end
    object tbTmpParametroVL_PARAMETRO1: TIBStringField
      FieldName = 'VL_PARAMETRO1'
      Size = 100
    end
    object tbTmpParametroVL_PARAMETRO2: TIBStringField
      FieldName = 'VL_PARAMETRO2'
      Size = 100
    end
    object tbTmpParametroVL_PARAMETRO3: TIBStringField
      FieldName = 'VL_PARAMETRO3'
      Size = 100
    end
    object tbTmpParametroVL_PARAMETRO4: TIBStringField
      FieldName = 'VL_PARAMETRO4'
      Size = 100
    end
    object tbTmpParametroVL_PARAMETRO5: TIBStringField
      FieldName = 'VL_PARAMETRO5'
      Size = 100
    end
    object tbTmpParametroVL_PARAMETRO6: TIBStringField
      FieldName = 'VL_PARAMETRO6'
      Size = 100
    end
    object tbTmpParametroVL_PARAMETRO7: TIBStringField
      FieldName = 'VL_PARAMETRO7'
      Size = 100
    end
    object tbTmpParametroVL_PARAMETRO8: TIBStringField
      FieldName = 'VL_PARAMETRO8'
      Size = 100
    end
    object tbTmpParametroVL_PARAMETRO9: TIBStringField
      FieldName = 'VL_PARAMETRO9'
      Size = 100
    end
    object tbTmpParametroVL_PARAMETRO10: TIBStringField
      FieldName = 'VL_PARAMETRO10'
      Size = 100
    end
  end
  object qyConfRelatorio: TIBQuery
    Database = DM.DB
    Transaction = DM.TS
    BeforeOpen = qyConfRelatorioBeforeOpen
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select * from CONF_RELATORIO'
      'where'
      '  cd_empresa =:cd_Empresa')
    Left = 129
    Top = 20
    ParamData = <
      item
        DataType = ftInteger
        Name = 'CD_EMPRESA'
        ParamType = ptUnknown
        Size = 4
      end>
    object qyConfRelatorioCD_CONF_RELATORIO: TIntegerField
      FieldName = 'CD_CONF_RELATORIO'
      Origin = 'CONF_RELATORIO.CD_CONF_RELATORIO'
      Required = True
    end
    object qyConfRelatorioCD_PESSOA: TIntegerField
      FieldName = 'CD_PESSOA'
      Origin = 'CONF_RELATORIO.CD_PESSOA'
    end
    object qyConfRelatorioNM_PESSOA: TIBStringField
      FieldName = 'NM_PESSOA'
      Origin = 'CONF_RELATORIO.NM_PESSOA'
      Size = 100
    end
    object qyConfRelatorioBL_LOGO: TBlobField
      FieldName = 'BL_LOGO'
      Origin = 'CONF_RELATORIO.BL_LOGO'
      Size = 8
    end
    object qyConfRelatorioNR_DOCUMENTO: TIBStringField
      FieldName = 'NR_DOCUMENTO'
      Origin = 'CONF_RELATORIO.NR_DOCUMENTO'
    end
    object qyConfRelatorioDS_ENDERECO: TIBStringField
      FieldName = 'DS_ENDERECO'
      Origin = 'CONF_RELATORIO.DS_ENDERECO'
      Size = 100
    end
    object qyConfRelatorioDS_BAIRRO: TIBStringField
      FieldName = 'DS_BAIRRO'
      Origin = 'CONF_RELATORIO.DS_BAIRRO'
      Size = 100
    end
    object qyConfRelatorioDS_CIDADE: TIBStringField
      FieldName = 'DS_CIDADE'
      Origin = 'CONF_RELATORIO.DS_CIDADE'
      Size = 100
    end
    object qyConfRelatorioNR_TELEFONE: TIBStringField
      FieldName = 'NR_TELEFONE'
      Origin = 'CONF_RELATORIO.NR_TELEFONE'
    end
    object qyConfRelatorioCD_EMPRESA: TIntegerField
      FieldName = 'CD_EMPRESA'
      Origin = 'CONF_RELATORIO.CD_EMPRESA'
    end
  end
end
