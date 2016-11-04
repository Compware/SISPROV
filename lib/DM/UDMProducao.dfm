object dmProducao: TdmProducao
  OldCreateOrder = False
  Left = 268
  Top = 26
  Height = 599
  Width = 644
  object TB_OPERACAO_PRODUCAO: TIBDataSet
    Database = DM.DB
    Transaction = DM.TS
    AfterDelete = TB_OPERACAO_PRODUCAOAfterDelete
    AfterInsert = TB_OPERACAO_PRODUCAOAfterInsert
    AfterPost = TB_OPERACAO_PRODUCAOAfterPost
    BeforeDelete = TB_OPERACAO_PRODUCAOBeforeDelete
    BufferChunks = 1000
    CachedUpdates = False
    DeleteSQL.Strings = (
      'delete from OPERACAO_PRODUCAO'
      'where'
      '  CD_OPERACAO_PRODUCAO = :OLD_CD_OPERACAO_PRODUCAO')
    InsertSQL.Strings = (
      'insert into OPERACAO_PRODUCAO'
      '  (CD_EMPRESA, CD_LOCAL, CD_OPERACAO_PRODUCAO, DS_OPERACAO, '
      'FL_ATIVO, FL_MOVIMENTA_ESTOQUE, '
      '   CD_USU_RESP, FL_PRODUCAO)'
      'values'
      '  (:CD_EMPRESA, :CD_LOCAL, :CD_OPERACAO_PRODUCAO, :DS_OPERACAO, '
      ':FL_ATIVO, '
      '   :FL_MOVIMENTA_ESTOQUE, :CD_USU_RESP, :FL_PRODUCAO)')
    SelectSQL.Strings = (
      'select '
      '  OP.CD_EMPRESA, '
      '  OP.CD_LOCAL, '
      '  OP.CD_OPERACAO_PRODUCAO, '
      '  OP.DS_OPERACAO, '
      '  OP.FL_ATIVO, '
      '  OP.FL_MOVIMENTA_ESTOQUE,'
      '  OP.CD_USU_RESP,'
      '  OP.FL_PRODUCAO,'
      '  U.NM_USUARIO,'
      '  L.NM_LOCAL'
      'from OPERACAO_PRODUCAO OP'
      '  LEFT OUTER JOIN LOCAL L'
      '  ON (L.CD_LOCAL = OP.CD_LOCAL)'
      '  LEFT OUTER JOIN USUARIO U'
      '  ON (U.CD_USUARIO = OP.CD_USU_RESP)')
    ModifySQL.Strings = (
      'update OPERACAO_PRODUCAO'
      'set'
      '  CD_EMPRESA = :CD_EMPRESA,'
      '  CD_LOCAL = :CD_LOCAL,'
      '  CD_OPERACAO_PRODUCAO = :CD_OPERACAO_PRODUCAO,'
      '  DS_OPERACAO = :DS_OPERACAO,'
      '  FL_ATIVO = :FL_ATIVO,'
      '  FL_MOVIMENTA_ESTOQUE = :FL_MOVIMENTA_ESTOQUE,'
      '  CD_USU_RESP = :CD_USU_RESP,'
      '  FL_PRODUCAO = :FL_PRODUCAO'
      'where'
      '  CD_OPERACAO_PRODUCAO = :OLD_CD_OPERACAO_PRODUCAO')
    DataSource = dsProducao
    Left = 73
    Top = 16
    object TB_OPERACAO_PRODUCAOCD_OPERACAO_PRODUCAO: TIntegerField
      FieldName = 'CD_OPERACAO_PRODUCAO'
      Origin = 'OPERACAO_PRODUCAO.CD_OPERACAO_PRODUCAO'
      Required = True
    end
    object TB_OPERACAO_PRODUCAODS_OPERACAO: TIBStringField
      FieldName = 'DS_OPERACAO'
      Origin = 'OPERACAO_PRODUCAO.DS_OPERACAO'
      Size = 100
    end
    object TB_OPERACAO_PRODUCAOFL_ATIVO: TIBStringField
      FieldName = 'FL_ATIVO'
      Origin = 'OPERACAO_PRODUCAO.FL_ATIVO'
      FixedChar = True
      Size = 1
    end
    object TB_OPERACAO_PRODUCAOCD_EMPRESA: TIntegerField
      FieldName = 'CD_EMPRESA'
      Origin = 'OPERACAO_PRODUCAO.CD_EMPRESA'
    end
    object TB_OPERACAO_PRODUCAOCD_LOCAL: TIntegerField
      FieldName = 'CD_LOCAL'
      Origin = 'OPERACAO_PRODUCAO.CD_LOCAL'
    end
    object TB_OPERACAO_PRODUCAOFL_MOVIMENTA_ESTOQUE: TIBStringField
      FieldName = 'FL_MOVIMENTA_ESTOQUE'
      Origin = 'OPERACAO_PRODUCAO.FL_MOVIMENTA_ESTOQUE'
      FixedChar = True
      Size = 1
    end
    object TB_OPERACAO_PRODUCAONM_LOCAL: TIBStringField
      FieldName = 'NM_LOCAL'
      Origin = 'LOCAL.NM_LOCAL'
    end
    object TB_OPERACAO_PRODUCAOCD_USU_RESP: TIntegerField
      FieldName = 'CD_USU_RESP'
      Origin = 'OPERACAO_PRODUCAO.CD_USU_RESP'
    end
    object TB_OPERACAO_PRODUCAONM_USUARIO: TIBStringField
      FieldName = 'NM_USUARIO'
      Origin = 'USUARIO.NM_USUARIO'
      Size = 100
    end
    object TB_OPERACAO_PRODUCAOFL_PRODUCAO: TIBStringField
      FieldName = 'FL_PRODUCAO'
      Origin = 'OPERACAO_PRODUCAO.FL_PRODUCAO'
      FixedChar = True
      Size = 1
    end
  end
  object TB_OPERACAO_PRODUTO: TIBDataSet
    Database = DM.DB
    Transaction = DM.TS
    AfterDelete = TB_OPERACAO_PRODUTOAfterDelete
    AfterInsert = TB_OPERACAO_PRODUTOAfterInsert
    AfterPost = TB_OPERACAO_PRODUTOAfterPost
    BeforeDelete = TB_OPERACAO_PRODUTOBeforeDelete
    BufferChunks = 1000
    CachedUpdates = False
    DeleteSQL.Strings = (
      'delete from OPERACAO_PRODUTO'
      'where'
      '  CD_OPERACAO_PRODUTO = :OLD_CD_OPERACAO_PRODUTO')
    InsertSQL.Strings = (
      'insert into OPERACAO_PRODUTO'
      '  (CD_OPERACAO_PRODUTO, CD_PRODUTO, CD_OPERACAO, NR_SEQUENCIA, '
      'VL_TEMPO, '
      '   CD_USU_RESP, NM_RESPONSAVEL, FL_ATIVO, CD_EMPRESA, CD_LOCAL, '
      'FL_MOVIMENTA_ESTOQUE)'
      'values'
      '  (:CD_OPERACAO_PRODUTO, :CD_PRODUTO, :CD_OPERACAO, '
      ':NR_SEQUENCIA, :VL_TEMPO, '
      
        '   :CD_USU_RESP, :NM_RESPONSAVEL, :FL_ATIVO, :CD_EMPRESA, :CD_LO' +
        'CAL, '
      ':FL_MOVIMENTA_ESTOQUE)')
    SelectSQL.Strings = (
      'select OP.CD_OPERACAO_PRODUTO'
      '      ,OP.CD_PRODUTO'
      '      ,OP.CD_OPERACAO'
      '      ,OP.NR_SEQUENCIA'
      '      ,OP.VL_TEMPO'
      '      ,OP.CD_USU_RESP'
      '      ,OP.NM_RESPONSAVEL'
      '      ,OP.FL_ATIVO'
      '      ,OP.CD_EMPRESA'
      '      ,P.DS_PRODUTO'
      '      ,O.DS_OPERACAO'
      '      ,OP.CD_LOCAL'
      '      ,OP.FL_MOVIMENTA_ESTOQUE'
      '      ,L.NM_LOCAL'
      'from OPERACAO_PRODUTO OP'
      '  left outer join OPERACAO_PRODUCAO O'
      '  on (OP.CD_OPERACAO = O.CD_OPERACAO_PRODUCAO)'
      '  left outer join PRODUTO P'
      '  ON (OP.CD_PRODUTO = P.CD_PRODUTO)'
      '  LEFT OUTER JOIN LOCAL L'
      '  ON (L.CD_LOCAL = OP.CD_LOCAL)'
      'where  '
      '  OP.CD_PRODUTO = :CD_PRODUTO')
    ModifySQL.Strings = (
      'update OPERACAO_PRODUTO'
      'set'
      '  CD_OPERACAO_PRODUTO = :CD_OPERACAO_PRODUTO,'
      '  CD_PRODUTO = :CD_PRODUTO,'
      '  CD_OPERACAO = :CD_OPERACAO,'
      '  NR_SEQUENCIA = :NR_SEQUENCIA,'
      '  VL_TEMPO = :VL_TEMPO,'
      '  CD_USU_RESP = :CD_USU_RESP,'
      '  NM_RESPONSAVEL = :NM_RESPONSAVEL,'
      '  FL_ATIVO = :FL_ATIVO,'
      '  CD_EMPRESA = :CD_EMPRESA,'
      '  CD_LOCAL = :CD_LOCAL,'
      '  FL_MOVIMENTA_ESTOQUE = :FL_MOVIMENTA_ESTOQUE'
      'where'
      '  CD_OPERACAO_PRODUTO = :OLD_CD_OPERACAO_PRODUTO')
    GeneratorField.Field = 'CD_OPERACAO_PRODUTO'
    GeneratorField.Generator = 'GEN_OPERACAO_PRODUTO'
    DataSource = dsProducao
    Left = 72
    Top = 80
    object TB_OPERACAO_PRODUTOCD_OPERACAO_PRODUTO: TIntegerField
      FieldName = 'CD_OPERACAO_PRODUTO'
      Origin = 'OPERACAO_PRODUTO.CD_OPERACAO_PRODUTO'
      Required = True
    end
    object TB_OPERACAO_PRODUTOCD_PRODUTO: TIntegerField
      FieldName = 'CD_PRODUTO'
      Origin = 'OPERACAO_PRODUTO.CD_PRODUTO'
    end
    object TB_OPERACAO_PRODUTOCD_OPERACAO: TIntegerField
      FieldName = 'CD_OPERACAO'
      Origin = 'OPERACAO_PRODUTO.CD_OPERACAO'
    end
    object TB_OPERACAO_PRODUTONR_SEQUENCIA: TIntegerField
      AutoGenerateValue = arAutoInc
      FieldName = 'NR_SEQUENCIA'
      Origin = 'OPERACAO_PRODUTO.NR_SEQUENCIA'
    end
    object TB_OPERACAO_PRODUTOVL_TEMPO: TIntegerField
      FieldName = 'VL_TEMPO'
      Origin = 'OPERACAO_PRODUTO.VL_TEMPO'
    end
    object TB_OPERACAO_PRODUTONM_RESPONSAVEL: TIBStringField
      FieldName = 'NM_RESPONSAVEL'
      Origin = 'OPERACAO_PRODUTO.NM_RESPONSAVEL'
      Size = 100
    end
    object TB_OPERACAO_PRODUTOFL_ATIVO: TIBStringField
      FieldName = 'FL_ATIVO'
      Origin = 'OPERACAO_PRODUTO.FL_ATIVO'
      FixedChar = True
      Size = 1
    end
    object TB_OPERACAO_PRODUTOCD_EMPRESA: TIntegerField
      FieldName = 'CD_EMPRESA'
      Origin = 'OPERACAO_PRODUTO.CD_EMPRESA'
    end
    object TB_OPERACAO_PRODUTODS_PRODUTO: TIBStringField
      FieldName = 'DS_PRODUTO'
      Origin = 'PRODUTO.DS_PRODUTO'
      Size = 100
    end
    object TB_OPERACAO_PRODUTODS_OPERACAO: TIBStringField
      FieldName = 'DS_OPERACAO'
      Origin = 'OPERACAO.DS_OPERACAO'
      Size = 50
    end
    object TB_OPERACAO_PRODUTOCD_USU_RESP: TIntegerField
      FieldName = 'CD_USU_RESP'
      Origin = 'OPERACAO_PRODUTO.CD_USU_RESP'
    end
    object TB_OPERACAO_PRODUTOCD_LOCAL: TIntegerField
      FieldName = 'CD_LOCAL'
      Origin = 'OPERACAO_PRODUTO.CD_LOCAL'
    end
    object TB_OPERACAO_PRODUTOFL_MOVIMENTA_ESTOQUE: TIBStringField
      FieldName = 'FL_MOVIMENTA_ESTOQUE'
      Origin = 'OPERACAO_PRODUTO.FL_MOVIMENTA_ESTOQUE'
      FixedChar = True
      Size = 1
    end
    object TB_OPERACAO_PRODUTONM_LOCAL: TIBStringField
      FieldName = 'NM_LOCAL'
      Origin = 'LOCAL.NM_LOCAL'
    end
  end
  object dsProducao: TDataSource
    DataSet = qyProducao
    Left = 72
    Top = 312
  end
  object TB_OPERACAO_PRODUTO_MAT: TIBDataSet
    Database = DM.DB
    Transaction = DM.TS
    AfterDelete = TB_OPERACAO_PRODUTO_MATAfterDelete
    AfterInsert = TB_OPERACAO_PRODUTO_MATAfterInsert
    AfterPost = TB_OPERACAO_PRODUTO_MATAfterPost
    BeforeDelete = TB_OPERACAO_PRODUTO_MATBeforeDelete
    BufferChunks = 1000
    CachedUpdates = False
    DeleteSQL.Strings = (
      'delete from OPERACAO_PRODUTO_MAT'
      'where'
      '  CD_OPERACAO_PRODUTO_MAT = :OLD_CD_OPERACAO_PRODUTO_MAT')
    InsertSQL.Strings = (
      'insert into "OPERACAO_PRODUTO_MAT"'
      '('
      '  "CD_OPERACAO_PRODUTO_MAT"'
      ', "CD_OPERACAO_PRODUTO"'
      ', "CD_PRODUTO"'
      ', "NR_QUANTIDADE"'
      ', "CD_EMPRESA"'
      ')'
      'values'
      '('
      '  :"CD_OPERACAO_PRODUTO_MAT"'
      ', :"CD_OPERACAO_PRODUTO"'
      ', :"CD_PRODUTO"'
      ', :"NR_QUANTIDADE"'
      ', :"CD_EMPRESA"'
      ')')
    SelectSQL.Strings = (
      'select OPM.CD_OPERACAO_PRODUTO_MAT'
      '      ,OPM.CD_OPERACAO_PRODUTO'
      '      ,OPM.CD_PRODUTO'
      '      ,OPM.NR_QUANTIDADE'
      '      ,OPM.CD_EMPRESA'
      '      ,P.DS_PRODUTO'
      'from OPERACAO_PRODUTO_MAT OPM'
      ' LEFT OUTER JOIN PRODUTO P'
      ' on (OPM.CD_PRODUTO=P.CD_PRODUTO)'
      'where'
      '  CD_OPERACAO_PRODUTO=:CD_OPERACAO_PRODUTO')
    ModifySQL.Strings = (
      'update "OPERACAO_PRODUTO_MAT"'
      'set'
      ' "CD_OPERACAO_PRODUTO_MAT" = :"CD_OPERACAO_PRODUTO_MAT"'
      ', "CD_OPERACAO_PRODUTO" = :"CD_OPERACAO_PRODUTO"'
      ', "CD_PRODUTO" = :"CD_PRODUTO"'
      ', "NR_QUANTIDADE" = :"NR_QUANTIDADE"'
      ', "CD_EMPRESA" = :"CD_EMPRESA"'
      'where'
      '  "CD_OPERACAO_PRODUTO_MAT" = :"OLD_CD_OPERACAO_PRODUTO_MAT"')
    GeneratorField.Field = 'CD_OPERACAO_PRODUTO_MAT'
    GeneratorField.Generator = 'GEN_OPERACAO_PRODUTO_MAT'
    DataSource = dsOperacaoProduto
    Left = 248
    Top = 16
    object TB_OPERACAO_PRODUTO_MATCD_OPERACAO_PRODUTO_MAT: TIntegerField
      FieldName = 'CD_OPERACAO_PRODUTO_MAT'
      Origin = 'OPERACAO_PRODUTO_MAT.CD_OPERACAO_PRODUTO_MAT'
      Required = True
    end
    object TB_OPERACAO_PRODUTO_MATCD_OPERACAO_PRODUTO: TIntegerField
      FieldName = 'CD_OPERACAO_PRODUTO'
      Origin = 'OPERACAO_PRODUTO_MAT.CD_OPERACAO_PRODUTO'
    end
    object TB_OPERACAO_PRODUTO_MATCD_PRODUTO: TIntegerField
      FieldName = 'CD_PRODUTO'
      Origin = 'OPERACAO_PRODUTO_MAT.CD_PRODUTO'
    end
    object TB_OPERACAO_PRODUTO_MATNR_QUANTIDADE: TIntegerField
      FieldName = 'NR_QUANTIDADE'
      Origin = 'OPERACAO_PRODUTO_MAT.NR_QUANTIDADE'
    end
    object TB_OPERACAO_PRODUTO_MATCD_EMPRESA: TIntegerField
      FieldName = 'CD_EMPRESA'
      Origin = 'OPERACAO_PRODUTO_MAT.CD_EMPRESA'
    end
    object TB_OPERACAO_PRODUTO_MATDS_PRODUTO: TIBStringField
      FieldName = 'DS_PRODUTO'
      Origin = 'PRODUTO.DS_PRODUTO'
      Size = 100
    end
  end
  object TB_ORDEM_SERVICO: TIBDataSet
    Database = DM.DB
    Transaction = DM.TS
    AfterDelete = TB_ORDEM_SERVICOAfterDelete
    AfterInsert = TB_ORDEM_SERVICOAfterInsert
    AfterPost = TB_ORDEM_SERVICOAfterPost
    BeforeDelete = TB_ORDEM_SERVICOBeforeDelete
    BufferChunks = 1000
    CachedUpdates = False
    DeleteSQL.Strings = (
      'delete from ORDEM_SERVICO'
      'where'
      '  CD_ORDEM_SERVICO = :OLD_CD_ORDEM_SERVICO')
    InsertSQL.Strings = (
      'insert into ORDEM_SERVICO'
      
        '  (CD_EMPRESA, CD_ORDEM_SERVICO, CD_PEDIDO, CD_STATUS, DT_INICIO' +
        '_PREVISTO, '
      '   DT_INICIO_REAL, DT_ORDEM, QT_ORDEM)'
      'values'
      
        '  (:CD_EMPRESA, :CD_ORDEM_SERVICO, :CD_PEDIDO, :CD_STATUS, :DT_I' +
        'NICIO_PREVISTO, '
      '   :DT_INICIO_REAL, :DT_ORDEM, :QT_ORDEM)')
    SelectSQL.Strings = (
      'select '
      '  OS.CD_EMPRESA, '
      '  OS.CD_ORDEM_SERVICO, '
      '  OS.CD_PEDIDO, '
      '  OS.CD_STATUS, '
      '  OS.DT_INICIO_PREVISTO, '
      '  OS.DT_INICIO_REAL, '
      '  OS.DT_ORDEM,'
      '  OS.QT_ORDEM,'
      '  S.DS_STATUS'
      'from ORDEM_SERVICO OS'
      ' LEFT OUTER JOIN STATUS S'
      ' ON (S.CD_STATUS = OS.CD_STATUS)')
    ModifySQL.Strings = (
      'update ORDEM_SERVICO'
      'set'
      '  CD_EMPRESA = :CD_EMPRESA,'
      '  CD_ORDEM_SERVICO = :CD_ORDEM_SERVICO,'
      '  CD_PEDIDO = :CD_PEDIDO,'
      '  CD_STATUS = :CD_STATUS,'
      '  DT_INICIO_PREVISTO = :DT_INICIO_PREVISTO,'
      '  DT_INICIO_REAL = :DT_INICIO_REAL,'
      '  DT_ORDEM = :DT_ORDEM,'
      '  QT_ORDEM = :QT_ORDEM'
      'where'
      '  CD_ORDEM_SERVICO = :OLD_CD_ORDEM_SERVICO')
    GeneratorField.Field = 'CD_ORDEM_SERVICO'
    GeneratorField.Generator = 'GEN_ORDEM_SERVICO'
    Left = 248
    Top = 80
    object TB_ORDEM_SERVICOCD_ORDEM_SERVICO: TIntegerField
      FieldName = 'CD_ORDEM_SERVICO'
      Origin = 'ORDEM_SERVICO.CD_ORDEM_SERVICO'
      Required = True
    end
    object TB_ORDEM_SERVICODT_ORDEM: TDateField
      FieldName = 'DT_ORDEM'
      Origin = 'ORDEM_SERVICO.DT_ORDEM'
    end
    object TB_ORDEM_SERVICODT_INICIO_PREVISTO: TDateField
      FieldName = 'DT_INICIO_PREVISTO'
      Origin = 'ORDEM_SERVICO.DT_INICIO_PREVISTO'
    end
    object TB_ORDEM_SERVICODT_INICIO_REAL: TDateTimeField
      FieldName = 'DT_INICIO_REAL'
      Origin = 'ORDEM_SERVICO.DT_INICIO_REAL'
    end
    object TB_ORDEM_SERVICOCD_PEDIDO: TIntegerField
      FieldName = 'CD_PEDIDO'
      Origin = 'ORDEM_SERVICO.CD_PEDIDO'
    end
    object TB_ORDEM_SERVICOCD_STATUS: TIntegerField
      FieldName = 'CD_STATUS'
      Origin = 'ORDEM_SERVICO.CD_STATUS'
    end
    object TB_ORDEM_SERVICOCD_EMPRESA: TIntegerField
      FieldName = 'CD_EMPRESA'
      Origin = 'ORDEM_SERVICO.CD_EMPRESA'
    end
    object TB_ORDEM_SERVICODS_STATUS: TIBStringField
      FieldName = 'DS_STATUS'
      Origin = 'STATUS.DS_STATUS'
      Size = 30
    end
    object TB_ORDEM_SERVICOQT_ORDEM: TFloatField
      FieldName = 'QT_ORDEM'
      Origin = 'ORDEM_SERVICO.QT_ORDEM'
    end
  end
  object TB_OPERACAO_OS: TIBDataSet
    Database = DM.DB
    Transaction = DM.TS
    AfterDelete = TB_OPERACAO_OSAfterDelete
    AfterInsert = TB_OPERACAO_OSAfterInsert
    AfterPost = TB_OPERACAO_OSAfterPost
    BeforeDelete = TB_OPERACAO_OSBeforeDelete
    BufferChunks = 1000
    CachedUpdates = False
    DeleteSQL.Strings = (
      'delete from OPERACAO_OS'
      'where'
      '  CD_OPERACAO_OS = :OLD_CD_OPERACAO_OS')
    InsertSQL.Strings = (
      'insert into OPERACAO_OS'
      '  (CD_OPERACAO_OS, CD_OS, CD_OPERACAO_PRODUTO, NR_SEQUENCIA, '
      'CD_EMPRESA, '
      '   CD_OPERACAO, CD_PRODUTO, CD_USU_RESP, CD_STATUS, CD_LOCAL, '
      'FL_MOVIMENTA_ESTOQUE, '
      '   QT_PRODUTO)'
      'values'
      
        '  (:CD_OPERACAO_OS, :CD_OS, :CD_OPERACAO_PRODUTO, :NR_SEQUENCIA,' +
        ' '
      ':CD_EMPRESA, '
      
        '   :CD_OPERACAO, :CD_PRODUTO, :CD_USU_RESP, :CD_STATUS, :CD_LOCA' +
        'L, '
      ':FL_MOVIMENTA_ESTOQUE, '
      '   :QT_PRODUTO)')
    SelectSQL.Strings = (
      'select OS.CD_OPERACAO_OS'
      '      ,OS.CD_OS'
      '      ,OS.CD_OPERACAO_PRODUTO'
      '      ,OS.NR_SEQUENCIA'
      '      ,OS.CD_EMPRESA'
      '      ,OS.CD_OPERACAO'
      '      ,OS.CD_PRODUTO'
      '      ,O.DS_OPERACAO'
      '      ,OS.CD_USU_RESP'
      '      ,OS.CD_STATUS'
      '      ,U.NM_USUARIO'
      '      ,OS.CD_LOCAL'
      '      ,OS.FL_MOVIMENTA_ESTOQUE'
      '      ,OS.QT_PRODUTO'
      '      ,L.NM_LOCAL'
      'from  OPERACAO_OS OS'
      '  LEFT OUTER JOIN   OPERACAO_PRODUTO OP'
      '  ON (OP.CD_OPERACAO_PRODUTO = OS.CD_OPERACAO_PRODUTO'
      '   AND OP.CD_PRODUTO = OS.CD_PRODUTO)'
      '  LEFT OUTER JOIN  OPERACAO_PRODUCAO O'
      '  ON (O.CD_OPERACAO_PRODUCAO = OS.CD_OPERACAO)'
      '  LEFT OUTER JOIN USUARIO U'
      '  ON (U.CD_USUARIO = OS.CD_USU_RESP)'
      '  LEFT OUTER JOIN LOCAL L'
      '  ON (L.CD_LOCAL = OS.CD_LOCAL)'
      'WHERE OS.CD_OS = :CD_ORDEM_SERVICO'
      'AND OS.CD_PRODUTO = :CD_PRODUTO'
      ''
      '')
    ModifySQL.Strings = (
      'update OPERACAO_OS'
      'set'
      '  CD_OPERACAO_OS = :CD_OPERACAO_OS,'
      '  CD_OS = :CD_OS,'
      '  CD_OPERACAO_PRODUTO = :CD_OPERACAO_PRODUTO,'
      '  NR_SEQUENCIA = :NR_SEQUENCIA,'
      '  CD_EMPRESA = :CD_EMPRESA,'
      '  CD_OPERACAO = :CD_OPERACAO,'
      '  CD_PRODUTO = :CD_PRODUTO,'
      '  CD_USU_RESP = :CD_USU_RESP,'
      '  CD_STATUS = :CD_STATUS,'
      '  CD_LOCAL = :CD_LOCAL,'
      '  FL_MOVIMENTA_ESTOQUE = :FL_MOVIMENTA_ESTOQUE,'
      '  QT_PRODUTO = :QT_PRODUTO'
      'where'
      '  CD_OPERACAO_OS = :OLD_CD_OPERACAO_OS')
    GeneratorField.Field = 'CD_OPERACAO_OS'
    GeneratorField.Generator = 'GEN_OPERACAO_OS'
    DataSource = dsOsProduto
    Left = 248
    Top = 208
    object TB_OPERACAO_OSCD_OPERACAO_OS: TIntegerField
      FieldName = 'CD_OPERACAO_OS'
      Origin = 'OPERACAO_OS.CD_OPERACAO_OS'
      Required = True
    end
    object TB_OPERACAO_OSCD_OS: TIntegerField
      FieldName = 'CD_OS'
      Origin = 'OPERACAO_OS.CD_OS'
    end
    object TB_OPERACAO_OSCD_OPERACAO_PRODUTO: TIntegerField
      FieldName = 'CD_OPERACAO_PRODUTO'
      Origin = 'OPERACAO_OS.CD_OPERACAO_PRODUTO'
    end
    object TB_OPERACAO_OSNR_SEQUENCIA: TIntegerField
      FieldName = 'NR_SEQUENCIA'
      Origin = 'OPERACAO_OS.NR_SEQUENCIA'
    end
    object TB_OPERACAO_OSCD_EMPRESA: TIntegerField
      FieldName = 'CD_EMPRESA'
      Origin = 'OPERACAO_OS.CD_EMPRESA'
    end
    object TB_OPERACAO_OSDS_OPERACAO: TIBStringField
      FieldName = 'DS_OPERACAO'
      Origin = 'OPERACAO_PRODUCAO.DS_OPERACAO'
      Size = 100
    end
    object TB_OPERACAO_OSCD_OPERACAO: TIntegerField
      FieldName = 'CD_OPERACAO'
      Origin = 'OPERACAO_PRODUTO.CD_OPERACAO'
    end
    object TB_OPERACAO_OSCD_PRODUTO: TIntegerField
      FieldName = 'CD_PRODUTO'
      Origin = 'OPERACAO_OS.CD_PRODUTO'
    end
    object TB_OPERACAO_OSCD_USU_RESP: TIntegerField
      FieldName = 'CD_USU_RESP'
      Origin = 'OPERACAO_OS.CD_USU_RESP'
    end
    object TB_OPERACAO_OSNM_USUARIO: TIBStringField
      FieldName = 'NM_USUARIO'
      Origin = 'USUARIO.NM_USUARIO'
      Size = 100
    end
    object TB_OPERACAO_OSCD_LOCAL: TIntegerField
      FieldName = 'CD_LOCAL'
      Origin = 'OPERACAO_OS.CD_LOCAL'
    end
    object TB_OPERACAO_OSFL_MOVIMENTA_ESTOQUE: TIBStringField
      FieldName = 'FL_MOVIMENTA_ESTOQUE'
      Origin = 'OPERACAO_OS.FL_MOVIMENTA_ESTOQUE'
      FixedChar = True
      Size = 1
    end
    object TB_OPERACAO_OSNM_LOCAL: TIBStringField
      FieldName = 'NM_LOCAL'
      Origin = 'LOCAL.NM_LOCAL'
    end
    object TB_OPERACAO_OSCD_STATUS: TIntegerField
      FieldName = 'CD_STATUS'
      Origin = 'OPERACAO_OS.CD_STATUS'
    end
    object TB_OPERACAO_OSQT_PRODUTO: TFloatField
      FieldName = 'QT_PRODUTO'
      Origin = 'OPERACAO_OS.QT_PRODUTO'
    end
  end
  object TB_MATERIAL_OS: TIBDataSet
    Database = DM.DB
    Transaction = DM.TS
    AfterDelete = TB_MATERIAL_OSAfterDelete
    AfterInsert = TB_MATERIAL_OSAfterInsert
    AfterPost = TB_MATERIAL_OSAfterPost
    BeforeDelete = TB_MATERIAL_OSBeforeDelete
    BufferChunks = 1000
    CachedUpdates = False
    DeleteSQL.Strings = (
      'delete from "MATERIAL_OS"'
      'where'
      '  "CD_MATERIAL_OS" = :"OLD_CD_MATERIAL_OS"')
    InsertSQL.Strings = (
      'insert into "MATERIAL_OS"'
      '('
      '  "CD_MATERIAL_OS"'
      ', "CD_OPERACAO_OS"'
      ', "CD_OS"'
      ', "CD_PRODUTO"'
      ', "NR_QUANTIDADE"'
      ', "CD_EMPRESA"'
      ')'
      'values'
      '('
      '  :"CD_MATERIAL_OS"'
      ', :"CD_OPERACAO_OS"'
      ', :"CD_OS"'
      ', :"CD_PRODUTO"'
      ', :"NR_QUANTIDADE"'
      ', :"CD_EMPRESA"'
      ')')
    SelectSQL.Strings = (
      'select M.CD_MATERIAL_OS'
      '      ,M.CD_OPERACAO_OS'
      '      ,M.CD_OS'
      '      ,M.CD_PRODUTO'
      '      ,M.NR_QUANTIDADE'
      '      ,M.CD_EMPRESA'
      '      ,P.DS_PRODUTO'
      '      ,P.FL_PRODUCAO'
      'from MATERIAL_OS M'
      '  left outer join produto p'
      '  on (p.cd_produto = m.cd_produto)'
      'WHERE  M.CD_OPERACAO_OS = :CD_OPERACAO_OS'
      'AND    M.CD_OS = :CD_OS')
    ModifySQL.Strings = (
      'update "MATERIAL_OS"'
      'set'
      ' "CD_MATERIAL_OS" = :"CD_MATERIAL_OS"'
      ', "CD_OPERACAO_OS" = :"CD_OPERACAO_OS"'
      ', "CD_OS" = :"CD_OS"'
      ', "CD_PRODUTO" = :"CD_PRODUTO"'
      ', "NR_QUANTIDADE" = :"NR_QUANTIDADE"'
      ', "CD_EMPRESA" = :"CD_EMPRESA"'
      'where'
      '  "CD_MATERIAL_OS" = :"OLD_CD_MATERIAL_OS"')
    GeneratorField.Field = 'CD_MATERIAL_OS'
    GeneratorField.Generator = 'GEN_MATERIAL_OS'
    DataSource = dsOperacaoOS
    Left = 248
    Top = 272
    object TB_MATERIAL_OSCD_MATERIAL_OS: TIntegerField
      FieldName = 'CD_MATERIAL_OS'
      Origin = 'MATERIAL_OS.CD_MATERIAL_OS'
      Required = True
    end
    object TB_MATERIAL_OSCD_OPERACAO_OS: TIntegerField
      FieldName = 'CD_OPERACAO_OS'
      Origin = 'MATERIAL_OS.CD_OPERACAO_OS'
    end
    object TB_MATERIAL_OSCD_OS: TIntegerField
      FieldName = 'CD_OS'
      Origin = 'MATERIAL_OS.CD_OS'
    end
    object TB_MATERIAL_OSCD_PRODUTO: TIntegerField
      FieldName = 'CD_PRODUTO'
      Origin = 'MATERIAL_OS.CD_PRODUTO'
    end
    object TB_MATERIAL_OSNR_QUANTIDADE: TIntegerField
      FieldName = 'NR_QUANTIDADE'
      Origin = 'MATERIAL_OS.NR_QUANTIDADE'
    end
    object TB_MATERIAL_OSCD_EMPRESA: TIntegerField
      FieldName = 'CD_EMPRESA'
      Origin = 'MATERIAL_OS.CD_EMPRESA'
    end
    object TB_MATERIAL_OSDS_PRODUTO: TIBStringField
      FieldName = 'DS_PRODUTO'
      Origin = 'PRODUTO.DS_PRODUTO'
      Size = 100
    end
    object TB_MATERIAL_OSFL_PRODUCAO: TIBStringField
      FieldName = 'FL_PRODUCAO'
      Origin = 'PRODUTO.FL_PRODUCAO'
      FixedChar = True
      Size = 1
    end
  end
  object qyProducao: TIBQuery
    Database = DM.DB
    Transaction = DM.TS
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select '
      '  CD_PRODUTO, '
      '  DS_PRODUTO'
      'from PRODUTO'
      'WHERE FL_PRODUCAO  = '#39'S'#39)
    Left = 72
    Top = 205
    object qyProducaoCD_PRODUTO: TIntegerField
      FieldName = 'CD_PRODUTO'
      Origin = 'PRODUTO.CD_PRODUTO'
      Required = True
    end
    object qyProducaoDS_PRODUTO: TIBStringField
      FieldName = 'DS_PRODUTO'
      Origin = 'PRODUTO.DS_PRODUTO'
      Required = True
      Size = 100
    end
  end
  object dsOperacaoProduto: TDataSource
    DataSet = TB_OPERACAO_PRODUTO
    Left = 74
    Top = 256
  end
  object TB_ESTRUTURA: TIBDataSet
    Database = DM.DB
    Transaction = DM.TS
    AfterDelete = TB_ESTRUTURAAfterDelete
    AfterPost = TB_ESTRUTURAAfterPost
    BufferChunks = 1000
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM ESTRUTURA'
      'WHERE CD_PRODUTO = :CD_PRODUTO'
      'AND CD_PRODUTO_PAI = :CD_PRODUTO_PAI')
    InsertSQL.Strings = (
      
        'INSERT INTO ESTRUTURA(CD_PRODUTO, CD_PRODUTO_PAI,CD_UNIDADE, QT_' +
        'PRODUTO,   NR_NIVEL)'
      
        'VALUES(:CD_PRODUTO, :CD_PRODUTO_PAI,:CD_UNIDADE, :QT_PRODUTO, :N' +
        'R_NIVEL)')
    SelectSQL.Strings = (
      'SELECT '
      '  CD_PRODUTO, '
      '  CD_PRODUTO_PAI, '
      '  DS_PRODUTO, '
      '  DS_PRODUTO_PAI,'
      '  CD_UNIDADE, '
      '  SG_UNIDADE, '
      '  QT_PRODUTO,'
      '  NR_NIVEL'
      'FROM PROC_SEL_ESTRUTURA_COMPLETA (:CD_PRODUTO_PAI, 1)'
      'ORDER BY   NR_NIVEL')
    ModifySQL.Strings = (
      'UPDATE ESTRUTURA'
      'SET CD_PRODUTO = :CD_PRODUTO, '
      '        CD_PRODUTO_PAI = :CD_PRODUTO_PAI,'
      '        CD_UNIDADE = :CD_UNIDADE, '
      '        QT_PRODUTO = :QT_PRODUTO,'
      '        NR_NIVEL = :NR_NIVEL'
      'WHERE CD_PRODUTO = :CD_PRODUTO'
      'AND CD_PRODUTO_PAI = :CD_PRODUTO_PAI')
    Left = 416
    Top = 16
    object TB_ESTRUTURACD_PRODUTO: TIntegerField
      FieldName = 'CD_PRODUTO'
      Origin = 'PROC_SEL_ESTRUTURA_COMPLETA.CD_PRODUTO'
    end
    object TB_ESTRUTURACD_PRODUTO_PAI: TIntegerField
      FieldName = 'CD_PRODUTO_PAI'
      Origin = 'PROC_SEL_ESTRUTURA_COMPLETA.CD_PRODUTO_PAI'
    end
    object TB_ESTRUTURADS_PRODUTO: TIBStringField
      FieldName = 'DS_PRODUTO'
      Origin = 'PROC_SEL_ESTRUTURA_COMPLETA.DS_PRODUTO'
      Size = 100
    end
    object TB_ESTRUTURADS_PRODUTO_PAI: TIBStringField
      FieldName = 'DS_PRODUTO_PAI'
      Origin = 'PROC_SEL_ESTRUTURA_COMPLETA.DS_PRODUTO_PAI'
      Size = 100
    end
    object TB_ESTRUTURACD_UNIDADE: TIBStringField
      FieldName = 'CD_UNIDADE'
      Origin = 'PROC_SEL_ESTRUTURA_COMPLETA.CD_UNIDADE'
      Size = 5
    end
    object TB_ESTRUTURASG_UNIDADE: TIBStringField
      FieldName = 'SG_UNIDADE'
      Origin = 'PROC_SEL_ESTRUTURA_COMPLETA.SG_UNIDADE'
      Size = 5
    end
    object TB_ESTRUTURAQT_PRODUTO: TFloatField
      FieldName = 'QT_PRODUTO'
      Origin = 'PROC_SEL_ESTRUTURA_COMPLETA.QT_PRODUTO'
    end
    object TB_ESTRUTURANR_NIVEL: TIntegerField
      FieldName = 'NR_NIVEL'
      Origin = 'PROC_SEL_ESTRUTURA_COMPLETA.NR_NIVEL'
    end
  end
  object qyEstrutura: TIBQuery
    Database = DM.DB
    Transaction = DM.TS
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select '
      '  CD_PRODUTO, '
      '  DS_PRODUTO'
      'from PRODUTO'
      'WHERE FL_COMPOSTO  = '#39'S'#39)
    Left = 72
    Top = 148
    object qyEstruturaCD_PRODUTO: TIntegerField
      FieldName = 'CD_PRODUTO'
      Origin = 'PRODUTO.CD_PRODUTO'
      Required = True
    end
    object qyEstruturaDS_PRODUTO: TIBStringField
      FieldName = 'DS_PRODUTO'
      Origin = 'PRODUTO.DS_PRODUTO'
      Required = True
      Size = 100
    end
  end
  object TB_OS_PRODUTO: TIBDataSet
    Database = DM.DB
    Transaction = DM.TS
    AfterDelete = TB_OS_PRODUTOAfterDelete
    AfterInsert = TB_OS_PRODUTOAfterInsert
    AfterPost = TB_ORDEM_SERVICOAfterPost
    BeforeDelete = TB_ORDEM_SERVICOBeforeDelete
    BufferChunks = 1000
    CachedUpdates = False
    DeleteSQL.Strings = (
      'delete from ORDEM_SERVICO_PRODUTO'
      'where'
      '  CD_OS_PRODUTO = :OLD_CD_OS_PRODUTO')
    InsertSQL.Strings = (
      'insert into ORDEM_SERVICO_PRODUTO'
      '  (CD_ORDEM_SERVICO, CD_OS_PRODUTO, CD_PRODUTO, QT_PRODUTO)'
      'values'
      '  (:CD_ORDEM_SERVICO, :CD_OS_PRODUTO, :CD_PRODUTO, :QT_PRODUTO)')
    SelectSQL.Strings = (
      'select '
      '  OSP.CD_ORDEM_SERVICO, '
      '  OSP.CD_OS_PRODUTO, '
      '  OSP.CD_PRODUTO ,'
      '  OSP.QT_PRODUTO,'
      '  P.DS_PRODUTO'
      'from ORDEM_SERVICO_PRODUTO OSP'
      ' LEFT OUTER JOIN PRODUTO P'
      ' ON (OSP.CD_PRODUTO = P.CD_PRODUTO)'
      'WHERE OSP.CD_ORDEM_SERVICO = :CD_ORDEM_SERVICO')
    ModifySQL.Strings = (
      'update ORDEM_SERVICO_PRODUTO'
      'set'
      '  CD_ORDEM_SERVICO = :CD_ORDEM_SERVICO,'
      '  CD_OS_PRODUTO = :CD_OS_PRODUTO,'
      '  CD_PRODUTO = :CD_PRODUTO,'
      '  QT_PRODUTO = :QT_PRODUTO'
      'where'
      '  CD_OS_PRODUTO = :OLD_CD_OS_PRODUTO')
    GeneratorField.Field = 'CD_OS_PRODUTO'
    GeneratorField.Generator = 'GEN_OS_PRODUTO'
    DataSource = dsOs
    Left = 248
    Top = 136
    object TB_OS_PRODUTOCD_ORDEM_SERVICO: TIntegerField
      FieldName = 'CD_ORDEM_SERVICO'
      Origin = 'ORDEM_SERVICO_PRODUTO.CD_ORDEM_SERVICO'
    end
    object TB_OS_PRODUTOCD_OS_PRODUTO: TIntegerField
      FieldName = 'CD_OS_PRODUTO'
      Origin = 'ORDEM_SERVICO_PRODUTO.CD_OS_PRODUTO'
      Required = True
    end
    object TB_OS_PRODUTOCD_PRODUTO: TIntegerField
      FieldName = 'CD_PRODUTO'
      Origin = 'ORDEM_SERVICO_PRODUTO.CD_PRODUTO'
    end
    object TB_OS_PRODUTODS_PRODUTO: TIBStringField
      FieldName = 'DS_PRODUTO'
      Origin = 'PRODUTO.DS_PRODUTO'
      Size = 100
    end
    object TB_OS_PRODUTOQT_PRODUTO: TFloatField
      FieldName = 'QT_PRODUTO'
      Origin = 'ORDEM_SERVICO_PRODUTO.QT_PRODUTO'
    end
  end
  object dsOs: TDataSource
    DataSet = TB_ORDEM_SERVICO
    Left = 336
    Top = 120
  end
  object dsOsProduto: TDataSource
    DataSet = TB_OS_PRODUTO
    Left = 336
    Top = 184
  end
  object dsOperacaoOS: TDataSource
    DataSet = TB_OPERACAO_OS
    Left = 336
    Top = 256
  end
  object qyProdutosNF: TIBQuery
    Database = DM.DB
    Transaction = DM.TS
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'SELECT P.CD_PRODUTO, P.DS_PRODUTO, N.QT_PRODUTO'
      'FROM NF_PRODUTO N, PRODUTO P'
      'WHERE N.CD_PRODUTO = P.CD_PRODUTO'
      'AND P.FL_PRODUCAO = '#39'S'#39
      'AND N.CD_NF = :CD_NF')
    Left = 240
    Top = 400
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'CD_NF'
        ParamType = ptUnknown
      end>
    object qyProdutosNFCD_PRODUTO: TIntegerField
      FieldName = 'CD_PRODUTO'
      Origin = 'PRODUTO.CD_PRODUTO'
      Required = True
    end
    object qyProdutosNFDS_PRODUTO: TIBStringField
      FieldName = 'DS_PRODUTO'
      Origin = 'PRODUTO.DS_PRODUTO'
      Required = True
      Size = 100
    end
    object qyProdutosNFQT_PRODUTO: TIntegerField
      FieldName = 'QT_PRODUTO'
      Origin = 'NF_PRODUTO.QT_PRODUTO'
    end
  end
  object TB_COMPOSTO: TIBDataSet
    Database = DM.DB
    Transaction = DM.TS
    AfterDelete = TB_COMPOSTOAfterDelete
    AfterInsert = TB_COMPOSTOAfterInsert
    AfterPost = TB_COMPOSTOAfterPost
    BeforeDelete = TB_COMPOSTOBeforeDelete
    BufferChunks = 1000
    CachedUpdates = False
    DeleteSQL.Strings = (
      'delete from COMPOSTO'
      'where'
      '  CD_COMPOSTO = :OLD_CD_COMPOSTO')
    InsertSQL.Strings = (
      'insert into COMPOSTO'
      
        '  (CD_COMPOSTO, CD_EMPRESA, CD_PEDIDO, CD_PRODUTO, DS_COMPOSTO, ' +
        'DT_CADASTRO, '
      '   QT_QTDE)'
      'values'
      
        '  (:CD_COMPOSTO, :CD_EMPRESA, :CD_PEDIDO, :CD_PRODUTO, :DS_COMPO' +
        'STO, :DT_CADASTRO, '
      '   :QT_QTDE)')
    SelectSQL.Strings = (
      
        'select CD_COMPOSTO, CD_EMPRESA, CD_PEDIDO, CD_PRODUTO, DS_COMPOS' +
        'TO, DT_CADASTRO, QT_QTDE from COMPOSTO')
    ModifySQL.Strings = (
      'update COMPOSTO'
      'set'
      '  CD_COMPOSTO = :CD_COMPOSTO,'
      '  CD_EMPRESA = :CD_EMPRESA,'
      '  CD_PEDIDO = :CD_PEDIDO,'
      '  CD_PRODUTO = :CD_PRODUTO,'
      '  DS_COMPOSTO = :DS_COMPOSTO,'
      '  DT_CADASTRO = :DT_CADASTRO,'
      '  QT_QTDE = :QT_QTDE'
      'where'
      '  CD_COMPOSTO = :OLD_CD_COMPOSTO')
    GeneratorField.Field = 'CD_COMPOSTO'
    GeneratorField.Generator = 'GEN_COMPOSTO'
    GeneratorField.ApplyEvent = gamOnPost
    Left = 64
    Top = 392
    object TB_COMPOSTOCD_COMPOSTO: TIntegerField
      FieldName = 'CD_COMPOSTO'
      Origin = 'COMPOSTO.CD_COMPOSTO'
      Required = True
    end
    object TB_COMPOSTODS_COMPOSTO: TIBStringField
      FieldName = 'DS_COMPOSTO'
      Origin = 'COMPOSTO.DS_COMPOSTO'
      Size = 100
    end
    object TB_COMPOSTOCD_PRODUTO: TIntegerField
      FieldName = 'CD_PRODUTO'
      Origin = 'COMPOSTO.CD_PRODUTO'
    end
    object TB_COMPOSTODT_CADASTRO: TDateField
      FieldName = 'DT_CADASTRO'
      Origin = 'COMPOSTO.DT_CADASTRO'
    end
    object TB_COMPOSTOQT_QTDE: TFloatField
      FieldName = 'QT_QTDE'
      Origin = 'COMPOSTO.QT_QTDE'
    end
    object TB_COMPOSTOCD_EMPRESA: TIntegerField
      FieldName = 'CD_EMPRESA'
      Origin = 'COMPOSTO.CD_EMPRESA'
    end
    object TB_COMPOSTOCD_PEDIDO: TIntegerField
      FieldName = 'CD_PEDIDO'
      Origin = 'COMPOSTO.CD_PEDIDO'
    end
  end
  object qyEstruturaCompleta: TIBQuery
    Database = DM.DB
    Transaction = DM.TS
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      
        'select * from PROC_SEL_ESTRUTURA_COMPLETA(:CD_PRODUTO, :QT_PRODU' +
        'TO)')
    Left = 248
    Top = 336
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'CD_PRODUTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'QT_PRODUTO'
        ParamType = ptUnknown
      end>
    object qyEstruturaCompletaCD_PRODUTO: TIntegerField
      FieldName = 'CD_PRODUTO'
      Origin = 'PROC_SEL_ESTRUTURA_COMPLETA.CD_PRODUTO'
    end
    object qyEstruturaCompletaCD_PRODUTO_PAI: TIntegerField
      FieldName = 'CD_PRODUTO_PAI'
      Origin = 'PROC_SEL_ESTRUTURA_COMPLETA.CD_PRODUTO_PAI'
    end
    object qyEstruturaCompletaDS_PRODUTO: TIBStringField
      FieldName = 'DS_PRODUTO'
      Origin = 'PROC_SEL_ESTRUTURA_COMPLETA.DS_PRODUTO'
      Size = 100
    end
    object qyEstruturaCompletaDS_PRODUTO_PAI: TIBStringField
      FieldName = 'DS_PRODUTO_PAI'
      Origin = 'PROC_SEL_ESTRUTURA_COMPLETA.DS_PRODUTO_PAI'
      Size = 100
    end
    object qyEstruturaCompletaCD_UNIDADE: TIBStringField
      FieldName = 'CD_UNIDADE'
      Origin = 'PROC_SEL_ESTRUTURA_COMPLETA.CD_UNIDADE'
      Size = 5
    end
    object qyEstruturaCompletaSG_UNIDADE: TIBStringField
      FieldName = 'SG_UNIDADE'
      Origin = 'PROC_SEL_ESTRUTURA_COMPLETA.SG_UNIDADE'
      Size = 5
    end
    object qyEstruturaCompletaQT_PRODUTO: TFloatField
      FieldName = 'QT_PRODUTO'
      Origin = 'PROC_SEL_ESTRUTURA_COMPLETA.QT_PRODUTO'
    end
    object qyEstruturaCompletaQT_TOTAL: TFloatField
      FieldName = 'QT_TOTAL'
      Origin = 'PROC_SEL_ESTRUTURA_COMPLETA.QT_TOTAL'
    end
    object qyEstruturaCompletaNR_NIVEL: TIntegerField
      FieldName = 'NR_NIVEL'
      Origin = 'PROC_SEL_ESTRUTURA_COMPLETA.NR_NIVEL'
    end
  end
  object tbApontamentoOS: TIBDataSet
    Database = DM.DB
    Transaction = DM.TS
    AfterPost = tbApontamentoOSAfterPost
    BeforeOpen = tbApontamentoOSBeforeOpen
    BufferChunks = 1000
    CachedUpdates = False
    DeleteSQL.Strings = (
      'delete from OPERACAO_OS'
      'where'
      '  CD_OPERACAO_OS = :OLD_CD_OPERACAO_OS')
    InsertSQL.Strings = (
      'insert into OPERACAO_OS'
      
        '  (CD_OPERACAO_OS, CD_OS, CD_OPERACAO_PRODUTO, NR_SEQUENCIA, CD_' +
        'EMPRESA, '
      
        '   CD_OPERACAO, CD_PRODUTO, CD_USU_RESP, FL_MOVIMENTA_ESTOQUE, C' +
        'D_LOCAL, '
      '   CD_STATUS)'
      'values'
      
        '  (:CD_OPERACAO_OS, :CD_OS, :CD_OPERACAO_PRODUTO, :NR_SEQUENCIA,' +
        ' :CD_EMPRESA, '
      
        '   :CD_OPERACAO, :CD_PRODUTO, :CD_USU_RESP, :FL_MOVIMENTA_ESTOQU' +
        'E, :CD_LOCAL, '
      '   :CD_STATUS)')
    RefreshSQL.Strings = (
      '')
    SelectSQL.Strings = (
      'select '
      ' OP.CD_EMPRESA, '
      ' OP.CD_LOCAL, '
      ' OP.CD_OPERACAO, '
      ' OP.CD_OPERACAO_OS, '
      ' OP.CD_OPERACAO_PRODUTO, '
      ' OP.CD_OS, '
      ' OP.CD_PRODUTO, '
      ' OP.CD_STATUS, '
      ' OP.CD_USU_RESP, '
      ' OP.FL_MOVIMENTA_ESTOQUE, '
      ' OP.NR_SEQUENCIA ,'
      ' OP.QT_PRODUTO,'
      ' s.ds_status,'
      ' o.ds_operacao,'
      ' O.FL_PRODUCAO,'
      ' u.nm_usuario,'
      ' l.nm_local,'
      ' OS.CD_PEDIDO,'
      ' OS.CD_ORDEM_SERVICO,'
      ' OS.DT_ORDEM, '
      ' OS.DT_INICIO_PREVISTO, '
      ' OS.DT_INICIO_REAL,'
      ' OS.QT_ORDEM'
      'from OPERACAO_OS OP'
      ' inner join ORDEM_SERVICO OS'
      ' ON (OP.CD_OS = OS.CD_ORDEM_SERVICO)'
      ' left outer join status s'
      ' on (s.cd_status = op.cd_status)'
      ' left outer join operacao_producao o'
      ' on (o.cd_operacao_producao = op.cd_operacao) '
      ' left outer join usuario u'
      ' on (u.cd_usuario = op.cd_usu_resp)'
      '  left outer join local l'
      ' on (l.cd_local = op.cd_local)'
      'where OP.CD_STATUS = 1'
      'AND (OP.CD_USU_RESP = :CD_USUARIO'
      'OR EXISTS (SELECT 1 FROM USUARIO_LOCAL '
      '                     WHERE CD_USUARIO = :CD_USUARIO '
      '                      AND CD_LOCAL IN (OP.CD_LOCAL)))')
    ModifySQL.Strings = (
      'update OPERACAO_OS'
      'set'
      '  CD_OPERACAO_OS = :CD_OPERACAO_OS,'
      '  CD_OS = :CD_OS,'
      '  CD_OPERACAO_PRODUTO = :CD_OPERACAO_PRODUTO,'
      '  NR_SEQUENCIA = :NR_SEQUENCIA,'
      '  CD_EMPRESA = :CD_EMPRESA,'
      '  CD_OPERACAO = :CD_OPERACAO,'
      '  CD_PRODUTO = :CD_PRODUTO,'
      '  CD_USU_RESP = :CD_USU_RESP,'
      '  FL_MOVIMENTA_ESTOQUE = :FL_MOVIMENTA_ESTOQUE,'
      '  CD_LOCAL = :CD_LOCAL,'
      '  CD_STATUS = :CD_STATUS'
      'where'
      '  CD_OPERACAO_OS = :OLD_CD_OPERACAO_OS')
    Left = 61
    Top = 461
    object tbApontamentoOSCD_EMPRESA: TIntegerField
      FieldName = 'CD_EMPRESA'
      Origin = 'OPERACAO_OS.CD_EMPRESA'
    end
    object tbApontamentoOSCD_LOCAL: TIntegerField
      FieldName = 'CD_LOCAL'
      Origin = 'OPERACAO_OS.CD_LOCAL'
    end
    object tbApontamentoOSCD_OPERACAO: TIntegerField
      FieldName = 'CD_OPERACAO'
      Origin = 'OPERACAO_OS.CD_OPERACAO'
    end
    object tbApontamentoOSCD_OPERACAO_OS: TIntegerField
      FieldName = 'CD_OPERACAO_OS'
      Origin = 'OPERACAO_OS.CD_OPERACAO_OS'
      Required = True
    end
    object tbApontamentoOSCD_OPERACAO_PRODUTO: TIntegerField
      FieldName = 'CD_OPERACAO_PRODUTO'
      Origin = 'OPERACAO_OS.CD_OPERACAO_PRODUTO'
    end
    object tbApontamentoOSCD_OS: TIntegerField
      FieldName = 'CD_OS'
      Origin = 'OPERACAO_OS.CD_OS'
    end
    object tbApontamentoOSCD_PRODUTO: TIntegerField
      FieldName = 'CD_PRODUTO'
      Origin = 'OPERACAO_OS.CD_PRODUTO'
    end
    object tbApontamentoOSCD_STATUS: TIntegerField
      FieldName = 'CD_STATUS'
      Origin = 'OPERACAO_OS.CD_STATUS'
    end
    object tbApontamentoOSCD_USU_RESP: TIntegerField
      FieldName = 'CD_USU_RESP'
      Origin = 'OPERACAO_OS.CD_USU_RESP'
    end
    object tbApontamentoOSFL_MOVIMENTA_ESTOQUE: TIBStringField
      FieldName = 'FL_MOVIMENTA_ESTOQUE'
      Origin = 'OPERACAO_OS.FL_MOVIMENTA_ESTOQUE'
      FixedChar = True
      Size = 1
    end
    object tbApontamentoOSNR_SEQUENCIA: TIntegerField
      FieldName = 'NR_SEQUENCIA'
      Origin = 'OPERACAO_OS.NR_SEQUENCIA'
    end
    object tbApontamentoOSDS_STATUS: TIBStringField
      FieldName = 'DS_STATUS'
      Origin = 'STATUS.DS_STATUS'
      Size = 30
    end
    object tbApontamentoOSDS_OPERACAO: TIBStringField
      FieldName = 'DS_OPERACAO'
      Origin = 'OPERACAO_PRODUCAO.DS_OPERACAO'
      Size = 100
    end
    object tbApontamentoOSNM_USUARIO: TIBStringField
      FieldName = 'NM_USUARIO'
      Origin = 'USUARIO.NM_USUARIO'
      Size = 100
    end
    object tbApontamentoOSNM_LOCAL: TIBStringField
      FieldName = 'NM_LOCAL'
      Origin = 'LOCAL.NM_LOCAL'
    end
    object tbApontamentoOSCD_PEDIDO: TIntegerField
      FieldName = 'CD_PEDIDO'
      Origin = 'ORDEM_SERVICO.CD_PEDIDO'
    end
    object tbApontamentoOSDT_INICIO_PREVISTO: TDateField
      FieldName = 'DT_INICIO_PREVISTO'
      Origin = 'ORDEM_SERVICO.DT_INICIO_PREVISTO'
    end
    object tbApontamentoOSDT_INICIO_REAL: TDateTimeField
      FieldName = 'DT_INICIO_REAL'
      Origin = 'ORDEM_SERVICO.DT_INICIO_REAL'
    end
    object tbApontamentoOSCD_ORDEM_SERVICO: TIntegerField
      FieldName = 'CD_ORDEM_SERVICO'
      Origin = 'ORDEM_SERVICO.CD_ORDEM_SERVICO'
      Required = True
    end
    object tbApontamentoOSDT_ORDEM: TDateField
      FieldName = 'DT_ORDEM'
      Origin = 'ORDEM_SERVICO.DT_ORDEM'
    end
    object tbApontamentoOSFL_PRODUCAO: TIBStringField
      FieldName = 'FL_PRODUCAO'
      Origin = 'OPERACAO_PRODUCAO.FL_PRODUCAO'
      FixedChar = True
      Size = 1
    end
    object tbApontamentoOSQT_ORDEM: TFloatField
      FieldName = 'QT_ORDEM'
      Origin = 'ORDEM_SERVICO.QT_ORDEM'
    end
    object tbApontamentoOSQT_PRODUTO: TFloatField
      FieldName = 'QT_PRODUTO'
      Origin = 'OPERACAO_OS.QT_PRODUTO'
    end
  end
end
