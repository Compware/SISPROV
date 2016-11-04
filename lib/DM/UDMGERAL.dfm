object DMGERAL: TDMGERAL
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Left = 5
  Top = 108
  Height = 709
  Width = 1315
  object qyDadosEmpresa: TIBQuery
    Database = DM.DB
    Transaction = DM.TS
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select EMP.*,  P.NM_PESSOA,'
      'E.DS_ENDERECO,E.DS_BAIRRO,E.DS_CIDADE,'
      'NR_DOCUMENTO, TP_DOCUMENTO, NR_TELEFONE'
      'from EMPRESA EMP'
      'Left outer join PESSOA P'
      'on(P.CD_PESSOA = EMP.CD_PESSOA)'
      'Left outer join ENDERECO E'
      'on(P.CD_PESSOA = E.CD_PESSOA'
      'and E.FL_PRINCIPAL = '#39'S'#39')'
      'left outer join DOCUMENTO D'
      'on(P.CD_PESSOA = D.CD_PESSOA'
      'and D.FL_PRINCIPAL = '#39'S'#39')'
      'left outer join TELEFONE T'
      'on(P.CD_PESSOA = T.CD_PESSOA'
      'and T.FL_PRINCIPAL = '#39'S'#39')'
      'where EMP.CD_EMPRESA = :CD_EMPRESA')
    Left = 624
    Top = 347
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'CD_EMPRESA'
        ParamType = ptUnknown
      end>
    object qyDadosEmpresaNM_PESSOA: TIBStringField
      FieldName = 'NM_PESSOA'
      Origin = 'PESSOA.NM_PESSOA'
      Size = 100
    end
    object qyDadosEmpresaDS_ENDERECO: TIBStringField
      FieldName = 'DS_ENDERECO'
      Origin = 'ENDERECO.DS_ENDERECO'
      Size = 100
    end
    object qyDadosEmpresaDS_BAIRRO: TIBStringField
      FieldName = 'DS_BAIRRO'
      Origin = 'ENDERECO.DS_BAIRRO'
      Size = 100
    end
    object qyDadosEmpresaDS_CIDADE: TIBStringField
      FieldName = 'DS_CIDADE'
      Origin = 'ENDERECO.DS_CIDADE'
      Size = 100
    end
    object qyDadosEmpresaTP_DOCUMENTO: TIBStringField
      FieldName = 'TP_DOCUMENTO'
      Origin = 'DOCUMENTO.TP_DOCUMENTO'
    end
    object qyDadosEmpresaNR_DOCUMENTO: TIBStringField
      FieldName = 'NR_DOCUMENTO'
      Origin = 'ENDERECO.DS_CIDADE'
    end
    object qyDadosEmpresaNR_TELEFONE: TIBStringField
      FieldName = 'NR_TELEFONE'
      Origin = 'TELEFONE.NR_TELEFONE'
    end
    object qyDadosEmpresaCD_EMPRESA: TIntegerField
      FieldName = 'CD_EMPRESA'
      Origin = 'EMPRESA.CD_EMPRESA'
      Required = True
    end
    object qyDadosEmpresaDS_EMPRESA: TIBStringField
      FieldName = 'DS_EMPRESA'
      Origin = 'EMPRESA.DS_EMPRESA'
      Size = 30
    end
    object qyDadosEmpresaTP_EMPRESA: TIBStringField
      FieldName = 'TP_EMPRESA'
      Origin = 'EMPRESA.TP_EMPRESA'
      FixedChar = True
      Size = 2
    end
    object qyDadosEmpresaCD_PESSOA: TIntegerField
      FieldName = 'CD_PESSOA'
      Origin = 'EMPRESA.CD_PESSOA'
    end
  end
  object qyValorParametro: TIBQuery
    Database = DM.DB
    Transaction = DM.TS
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select * from VALOR_PARAMETRO'
      'where CD_PARAMETRO = :CD_PARAMETRO')
    Left = 624
    Top = 163
    ParamData = <
      item
        DataType = ftInteger
        Name = 'CD_PARAMETRO'
        ParamType = ptInput
      end>
    object qyValorParametroCD_PARAMETRO: TIntegerField
      FieldName = 'CD_PARAMETRO'
      Origin = 'VALOR_PARAMETRO.CD_PARAMETRO'
      Required = True
    end
    object qyValorParametroCD_VALOR: TIntegerField
      FieldName = 'CD_VALOR'
      Origin = 'VALOR_PARAMETRO.CD_VALOR'
      Required = True
    end
    object qyValorParametroTP_VALOR: TIBStringField
      FieldName = 'TP_VALOR'
      Origin = 'VALOR_PARAMETRO.TP_VALOR'
      Size = 10
    end
    object qyValorParametroVL_PARAMETRO: TIBStringField
      FieldName = 'VL_PARAMETRO'
      Origin = 'VALOR_PARAMETRO.VL_PARAMETRO'
      Size = 100
    end
  end
  object qyStatus: TIBQuery
    Database = DM.DB
    Transaction = DM.TS
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select SG_STATUS, DS_STATUS from STATUS')
    Left = 624
    Top = 275
    object qyStatusSG_STATUS: TIBStringField
      FieldName = 'SG_STATUS'
      Origin = 'STATUS.SG_STATUS'
      Required = True
      FixedChar = True
      Size = 2
    end
    object qyStatusDS_STATUS: TIBStringField
      FieldName = 'DS_STATUS'
      Origin = 'STATUS.DS_STATUS'
      Size = 30
    end
  end
  object dsDadosEmpresa: TDataSource
    AutoEdit = False
    DataSet = qyDadosEmpresa
    Left = 536
    Top = 299
  end
  object TB_PESSOA: TIBDataSet
    Database = DM.DB
    Transaction = DM.TS
    AfterDelete = TB_PESSOAAfterDelete
    AfterInsert = TB_PESSOAAfterInsert
    AfterPost = TB_PESSOAAfterPost
    BeforeDelete = TB_PESSOABeforeDelete
    OnDeleteError = TB_PARAMETRODeleteError
    OnEditError = TB_PARAMETROEditError
    OnPostError = TB_PARAMETROPostError
    OnUpdateError = TB_PARAMETROUpdateError
    BufferChunks = 1000
    CachedUpdates = False
    DeleteSQL.Strings = (
      'delete from "PESSOA"'
      'where'
      '  "CD_PESSOA" = :"OLD_CD_PESSOA"')
    InsertSQL.Strings = (
      'insert into "PESSOA"'
      '('
      '  "CD_PESSOA"'
      ', "CD_UND"'
      ', "NM_PESSOA"'
      ', "TP_PESSOA"'
      ', "BL_IMAGEM"'
      ', "FL_ATIVO"'
      ', "FL_PRINCIPAL"'
      ', "FL_PADRAO"'
      ', "CD_EMPRESA"'
      ')'
      'values'
      '('
      '  :"CD_PESSOA"'
      ', :"CD_UND"'
      ', :"NM_PESSOA"'
      ', :"TP_PESSOA"'
      ', :"BL_IMAGEM"'
      ', :"FL_ATIVO"'
      ', :"FL_PRINCIPAL"'
      ', :"FL_PADRAO"'
      ', :"CD_EMPRESA"'
      ')')
    SelectSQL.Strings = (
      'select P.CD_PESSOA, P.NM_PESSOA, P.TP_PESSOA,'
      
        'NR_DOCUMENTO, TP_DOCUMENTO, NR_TELEFONE, TP_TELEFONE,FL_ATIVO,BL' +
        '_IMAGEM,P.FL_PRINCIPAL,'
      'P.FL_PADRAO,P.CD_EMPRESA,P.CD_UND,E.DS_ENDERECO,E.DS_BAIRRO,'
      'E.DS_CIDADE'
      'from PESSOA P'
      'left outer join DOCUMENTO D'
      'on(P.CD_PESSOA = D.CD_PESSOA'
      'and D.FL_PRINCIPAL = '#39'S'#39')'
      'left outer join ENDERECO E'
      'on(P.CD_PESSOA = E.CD_PESSOA'
      'and E.FL_PRINCIPAL = '#39'S'#39')'
      'left outer join TELEFONE T'
      'on(P.CD_PESSOA = T.CD_PESSOA'
      'and T.FL_PRINCIPAL = '#39'S'#39')'
      'where P.TP_PESSOA  = :TP_PESSOA')
    ModifySQL.Strings = (
      'update "PESSOA"'
      'set'
      ' "CD_PESSOA" = :"CD_PESSOA"'
      ', "NM_PESSOA" = :"NM_PESSOA"'
      ', "TP_PESSOA" = :"TP_PESSOA"'
      ', "BL_IMAGEM" = :"BL_IMAGEM"'
      ', "FL_ATIVO" = :"FL_ATIVO"'
      ', "FL_PRINCIPAL" = :"FL_PRINCIPAL"'
      ', "FL_PADRAO" = :"FL_PADRAO"'
      ', "CD_EMPRESA" = :"CD_EMPRESA"'
      ', "CD_UND" = :"CD_UND"'
      'where'
      '  "CD_PESSOA" = :"OLD_CD_PESSOA"')
    Left = 80
    Top = 259
    object TB_PESSOACD_PESSOA: TIntegerField
      FieldName = 'CD_PESSOA'
      Origin = 'PESSOA.CD_PESSOA'
      Required = True
    end
    object TB_PESSOANM_PESSOA: TIBStringField
      FieldName = 'NM_PESSOA'
      Origin = 'PESSOA.NM_PESSOA'
      Size = 100
    end
    object TB_PESSOATP_PESSOA: TIBStringField
      FieldName = 'TP_PESSOA'
      Origin = 'PESSOA.TP_PESSOA'
      FixedChar = True
      Size = 2
    end
    object TB_PESSOABL_IMAGEM: TBlobField
      FieldName = 'BL_IMAGEM'
      Origin = 'PESSOA.BL_IMAGEM'
      Size = 8
    end
    object TB_PESSOAFL_ATIVO: TIBStringField
      FieldName = 'FL_ATIVO'
      Origin = 'PESSOA.FL_ATIVO'
      FixedChar = True
      Size = 1
    end
    object TB_PESSOAFL_PRINCIPAL: TIBStringField
      FieldName = 'FL_PRINCIPAL'
      Origin = 'PESSOA.FL_PRINCIPAL'
      FixedChar = True
      Size = 1
    end
    object TB_PESSOAFL_PADRAO: TIBStringField
      FieldName = 'FL_PADRAO'
      Origin = 'PESSOA.FL_PADRAO'
      FixedChar = True
      Size = 1
    end
    object TB_PESSOACD_EMPRESA: TIntegerField
      FieldName = 'CD_EMPRESA'
      Origin = 'PESSOA.CD_EMPRESA'
    end
    object TB_PESSOACD_UND: TIntegerField
      FieldName = 'CD_UND'
      Origin = 'PESSOA.CD_UND'
      Required = True
    end
  end
  object TB_PESSOA_DOC: TIBDataSet
    Database = DM.DB
    Transaction = DM.TS
    AfterDelete = TB_PESSOA_DOCAfterDelete
    AfterInsert = TB_PESSOA_DOCAfterInsert
    AfterPost = TB_PESSOA_DOCAfterPost
    BeforeDelete = TB_PESSOA_DOCBeforeDelete
    OnDeleteError = TB_PARAMETRODeleteError
    OnEditError = TB_PARAMETROEditError
    OnPostError = TB_PARAMETROPostError
    OnUpdateError = TB_PARAMETROUpdateError
    BufferChunks = 1000
    CachedUpdates = False
    DeleteSQL.Strings = (
      'delete from "PESSOA_DOC"'
      'where'
      '  "CD_PESSOA" = :"OLD_CD_PESSOA" and '
      '  "CD_DOCUMENTO" = :"OLD_CD_DOCUMENTO"')
    InsertSQL.Strings = (
      'insert into "PESSOA_DOC"'
      '('
      '  "CD_PESSOA"'
      ', "CD_UND"'
      ', "CD_DOCUMENTO"'
      ', "FL_PRINCIPAL"'
      ', "CD_EMPRESA"'
      ')'
      'values'
      '('
      '  :"CD_PESSOA"'
      ', :"CD_UND"'
      ', :"CD_DOCUMENTO"'
      ', :"FL_PRINCIPAL"'
      ', :"CD_EMPRESA"'
      ')')
    SelectSQL.Strings = (
      
        'select CD_DOCUMENTO, CD_PESSOA, NR_DOCUMENTO, TP_DOCUMENTO, FL_P' +
        'RINCIPAL,CD_EMPRESA'
      'from DOCUMENTO'
      'where CD_PESSOA = :CD_PESSOA'
      'and TP_DOCUMENTO = :TP_DOC')
    ModifySQL.Strings = (
      'update "PESSOA_DOC"'
      'set'
      ' "CD_PESSOA" = :"CD_PESSOA"'
      ', "CD_DOCUMENTO" = :"CD_DOCUMENTO"'
      ', "FL_PRINCIPAL" = :"FL_PRINCIPAL"'
      ', "CD_EMPRESA" = :"CD_EMPRESA"'
      'where'
      '  "CD_PESSOA" = :"OLD_CD_PESSOA" and '
      '  "CD_DOCUMENTO" = :"OLD_CD_DOCUMENTO"')
    DataSource = dsPessoa
    Left = 216
    Top = 219
    object TB_PESSOA_DOCCD_PESSOA: TIntegerField
      FieldName = 'CD_PESSOA'
      Origin = 'PESSOA_DOC.CD_PESSOA'
      Required = True
    end
    object TB_PESSOA_DOCCD_DOCUMENTO: TIntegerField
      FieldName = 'CD_DOCUMENTO'
      Origin = 'PESSOA_DOC.CD_DOCUMENTO'
      Required = True
    end
    object TB_PESSOA_DOCFL_PRINCIPAL: TIBStringField
      FieldName = 'FL_PRINCIPAL'
      Origin = 'PESSOA_DOC.FL_PRINCIPAL'
      FixedChar = True
      Size = 1
    end
    object TB_PESSOA_DOCCD_EMPRESA: TIntegerField
      FieldName = 'CD_EMPRESA'
      Origin = 'PESSOA_DOC.CD_EMPRESA'
    end
  end
  object TB_PESSOA_ENDERECO: TIBDataSet
    Database = DM.DB
    Transaction = DM.TS
    AfterDelete = TB_PESSOA_ENDERECOAfterDelete
    AfterInsert = TB_PESSOA_ENDERECOAfterInsert
    AfterPost = TB_PESSOA_ENDERECOAfterPost
    BeforeDelete = TB_PESSOA_ENDERECOBeforeDelete
    OnDeleteError = TB_PARAMETRODeleteError
    OnEditError = TB_PARAMETROEditError
    OnPostError = TB_PARAMETROPostError
    OnUpdateError = TB_PARAMETROUpdateError
    BufferChunks = 1000
    CachedUpdates = False
    DeleteSQL.Strings = (
      'delete from "PESSOA_ENDERECO"'
      'where'
      '  "CD_PESSOA" = :"OLD_CD_PESSOA" and '
      '  "CD_ENDERECO" = :"OLD_CD_ENDERECO"')
    InsertSQL.Strings = (
      'insert into "PESSOA_ENDERECO"'
      '('
      '  "CD_PESSOA"'
      ', "CD_UND"'
      ', "CD_ENDERECO"'
      ', "FL_PRINCIPAL"'
      ', "CD_EMPRESA"'
      ')'
      'values'
      '('
      '  :"CD_PESSOA"'
      ', :"CD_UND"'
      ', :"CD_ENDERECO"'
      ', :"FL_PRINCIPAL"'
      ', :"CD_EMPRESA"'
      ')')
    SelectSQL.Strings = (
      
        'select CD_ENDERECO, CD_PESSOA, DS_BAIRRO, DS_CIDADE, DS_COMPLEME' +
        'NTO, DS_ENDERECO, TP_ENDERECO, FL_PRINCIPAL,CD_EMPRESA'
      'from ENDERECO'
      'where CD_PESSOA = :CD_PESSOA'
      'and TP_ENDERECO = :TP_ENDERECO')
    ModifySQL.Strings = (
      'update "PESSOA_ENDERECO"'
      'set'
      ' "CD_PESSOA" = :"CD_PESSOA"'
      ', "CD_ENDERECO" = :"CD_ENDERECO"'
      ', "FL_PRINCIPAL" = :"FL_PRINCIPAL"'
      ', "CD_EMPRESA" = :"CD_EMPRESA"'
      'where'
      '  "CD_PESSOA" = :"OLD_CD_PESSOA" and '
      '  "CD_ENDERECO" = :"OLD_CD_ENDERECO"')
    DataSource = dsPessoa
    Left = 216
    Top = 275
    object TB_PESSOA_ENDERECOCD_PESSOA: TIntegerField
      FieldName = 'CD_PESSOA'
      Origin = 'PESSOA_ENDERECO.CD_PESSOA'
      Required = True
    end
    object TB_PESSOA_ENDERECOCD_ENDERECO: TIntegerField
      FieldName = 'CD_ENDERECO'
      Origin = 'PESSOA_ENDERECO.CD_ENDERECO'
      Required = True
    end
    object TB_PESSOA_ENDERECOFL_PRINCIPAL: TIBStringField
      FieldName = 'FL_PRINCIPAL'
      Origin = 'PESSOA_ENDERECO.FL_PRINCIPAL'
      Required = True
      FixedChar = True
      Size = 1
    end
    object TB_PESSOA_ENDERECOCD_EMPRESA: TIntegerField
      FieldName = 'CD_EMPRESA'
      Origin = 'PESSOA_ENDERECO.CD_EMPRESA'
    end
  end
  object TB_ENDERECO: TIBDataSet
    Database = DM.DB
    Transaction = DM.TS
    AfterDelete = TB_ENDERECOAfterDelete
    AfterInsert = TB_ENDERECOAfterInsert
    AfterPost = TB_ENDERECOAfterPost
    BeforeDelete = TB_ENDERECOBeforeDelete
    OnDeleteError = TB_PARAMETRODeleteError
    OnEditError = TB_PARAMETROEditError
    OnPostError = TB_PARAMETROPostError
    OnUpdateError = TB_PARAMETROUpdateError
    BufferChunks = 1000
    CachedUpdates = False
    DeleteSQL.Strings = (
      'delete from "ENDERECO"'
      'where'
      '  "CD_ENDERECO" = :"OLD_CD_ENDERECO"')
    InsertSQL.Strings = (
      'insert into "ENDERECO"'
      '('
      '  "CD_ENDERECO"'
      ', "CD_UND"'
      ', "DS_ENDERECO"'
      ', "DS_BAIRRO"'
      ', "DS_CIDADE"'
      ', "DS_COMPLEMENTO"'
      ', "TP_ENDERECO"'
      ', "CD_PESSOA"'
      ', "FL_PRINCIPAL"'
      ', "CD_EMPRESA"'
      ')'
      'values'
      '('
      '  :"CD_ENDERECO"'
      ', :"CD_UND"'
      ', :"DS_ENDERECO"'
      ', :"DS_BAIRRO"'
      ', :"DS_CIDADE"'
      ', :"DS_COMPLEMENTO"'
      ', :"TP_ENDERECO"'
      ', :"CD_PESSOA"'
      ', :"FL_PRINCIPAL"'
      ', :"CD_EMPRESA"'
      ')')
    SelectSQL.Strings = (
      'select "ENDERECO"."CD_ENDERECO"'
      '      ,"ENDERECO"."DS_ENDERECO"'
      '      ,"ENDERECO"."DS_BAIRRO"'
      '      ,"ENDERECO"."DS_CIDADE"'
      '      ,"ENDERECO"."DS_COMPLEMENTO"'
      '      ,"ENDERECO"."TP_ENDERECO"'
      '      ,"ENDERECO"."CD_PESSOA"'
      '      ,"ENDERECO"."FL_PRINCIPAL"'
      '      ,"ENDERECO"."CD_EMPRESA"'
      'from "ENDERECO"'
      'where  CD_ENDERECO =:CD_ENDERECO')
    ModifySQL.Strings = (
      'update "ENDERECO"'
      'set'
      ' "CD_ENDERECO" = :"CD_ENDERECO"'
      ', "DS_ENDERECO" = :"DS_ENDERECO"'
      ', "DS_BAIRRO" = :"DS_BAIRRO"'
      ', "DS_CIDADE" = :"DS_CIDADE"'
      ', "DS_COMPLEMENTO" = :"DS_COMPLEMENTO"'
      ', "TP_ENDERECO" = :"TP_ENDERECO"'
      ', "CD_PESSOA" = :"CD_PESSOA"'
      ', "FL_PRINCIPAL" = :"FL_PRINCIPAL"'
      ', "CD_EMPRESA" = :"CD_EMPRESA"'
      'where'
      '  "CD_ENDERECO" = :"OLD_CD_ENDERECO"')
    Left = 216
    Top = 331
    object TB_ENDERECOCD_ENDERECO: TIntegerField
      FieldName = 'CD_ENDERECO'
      Origin = 'ENDERECO.CD_ENDERECO'
      Required = True
    end
    object TB_ENDERECODS_ENDERECO: TIBStringField
      FieldName = 'DS_ENDERECO'
      Origin = 'ENDERECO.DS_ENDERECO'
      Size = 100
    end
    object TB_ENDERECODS_BAIRRO: TIBStringField
      FieldName = 'DS_BAIRRO'
      Origin = 'ENDERECO.DS_BAIRRO'
      Size = 100
    end
    object TB_ENDERECODS_CIDADE: TIBStringField
      FieldName = 'DS_CIDADE'
      Origin = 'ENDERECO.DS_CIDADE'
      Size = 100
    end
    object TB_ENDERECODS_COMPLEMENTO: TIBStringField
      FieldName = 'DS_COMPLEMENTO'
      Origin = 'ENDERECO.DS_COMPLEMENTO'
      Size = 200
    end
    object TB_ENDERECOTP_ENDERECO: TIBStringField
      FieldName = 'TP_ENDERECO'
      Origin = 'ENDERECO.TP_ENDERECO'
    end
    object TB_ENDERECOCD_PESSOA: TIntegerField
      FieldName = 'CD_PESSOA'
      Origin = 'ENDERECO.CD_PESSOA'
      Required = True
    end
    object TB_ENDERECOFL_PRINCIPAL: TIBStringField
      FieldName = 'FL_PRINCIPAL'
      Origin = 'ENDERECO.FL_PRINCIPAL'
      Required = True
      FixedChar = True
      Size = 1
    end
    object TB_ENDERECOCD_EMPRESA: TIntegerField
      FieldName = 'CD_EMPRESA'
      Origin = 'ENDERECO.CD_EMPRESA'
    end
  end
  object TB_DOCUMENTO: TIBDataSet
    Database = DM.DB
    Transaction = DM.TS
    AfterDelete = TB_DOCUMENTOAfterDelete
    AfterInsert = TB_DOCUMENTOAfterInsert
    AfterPost = TB_DOCUMENTOAfterPost
    BeforeDelete = TB_DOCUMENTOBeforeDelete
    OnDeleteError = TB_PARAMETRODeleteError
    OnEditError = TB_PARAMETROEditError
    OnPostError = TB_PARAMETROPostError
    OnUpdateError = TB_PARAMETROUpdateError
    BufferChunks = 1000
    CachedUpdates = False
    DeleteSQL.Strings = (
      'delete from "DOCUMENTO"'
      'where'
      '  "CD_DOCUMENTO" = :"OLD_CD_DOCUMENTO"')
    InsertSQL.Strings = (
      'insert into "DOCUMENTO"'
      '('
      '  "CD_DOCUMENTO"'
      ', "CD_UND"'
      ', "TP_DOCUMENTO"'
      ', "NR_DOCUMENTO"'
      ', "CD_PESSOA"'
      ', "FL_PRINCIPAL"'
      ', "CD_EMPRESA"'
      ')'
      'values'
      '('
      '  :"CD_DOCUMENTO"'
      ', :"CD_UND"'
      ', :"TP_DOCUMENTO"'
      ', :"NR_DOCUMENTO"'
      ', :"CD_PESSOA"'
      ', :"FL_PRINCIPAL"'
      ', :"CD_EMPRESA"'
      ')')
    SelectSQL.Strings = (
      'select "DOCUMENTO"."CD_DOCUMENTO"'
      '      ,"DOCUMENTO"."TP_DOCUMENTO"'
      '      ,"DOCUMENTO"."NR_DOCUMENTO"'
      '      ,"DOCUMENTO"."CD_PESSOA"'
      '      ,"DOCUMENTO"."FL_PRINCIPAL"'
      '      ,"DOCUMENTO"."CD_EMPRESA"'
      '      ,"DOCUMENTO"."CD_UND"'
      'from "DOCUMENTO"'
      'where CD_DOCUMENTO =:CD_DOCUMENTO')
    ModifySQL.Strings = (
      'update "DOCUMENTO"'
      'set'
      ' "CD_DOCUMENTO" = :"CD_DOCUMENTO"'
      ', "TP_DOCUMENTO" = :"TP_DOCUMENTO"'
      ', "NR_DOCUMENTO" = :"NR_DOCUMENTO"'
      ', "CD_PESSOA" = :"CD_PESSOA"'
      ', "FL_PRINCIPAL" = :"FL_PRINCIPAL"'
      ', "CD_EMPRESA" = :"CD_EMPRESA"'
      ', "CD_UND" = :"CD_UND"'
      'where'
      '  "CD_DOCUMENTO" = :"OLD_CD_DOCUMENTO"')
    Left = 80
    Top = 307
    object TB_DOCUMENTOCD_DOCUMENTO: TIntegerField
      FieldName = 'CD_DOCUMENTO'
      Origin = 'DOCUMENTO.CD_DOCUMENTO'
      Required = True
    end
    object TB_DOCUMENTOTP_DOCUMENTO: TIBStringField
      FieldName = 'TP_DOCUMENTO'
      Origin = 'DOCUMENTO.TP_DOCUMENTO'
    end
    object TB_DOCUMENTONR_DOCUMENTO: TIBStringField
      FieldName = 'NR_DOCUMENTO'
      Origin = 'DOCUMENTO.NR_DOCUMENTO'
    end
    object TB_DOCUMENTOCD_PESSOA: TIntegerField
      FieldName = 'CD_PESSOA'
      Origin = 'DOCUMENTO.CD_PESSOA'
      Required = True
    end
    object TB_DOCUMENTOFL_PRINCIPAL: TIBStringField
      FieldName = 'FL_PRINCIPAL'
      Origin = 'DOCUMENTO.FL_PRINCIPAL'
      Required = True
      FixedChar = True
      Size = 1
    end
    object TB_DOCUMENTOCD_EMPRESA: TIntegerField
      FieldName = 'CD_EMPRESA'
      Origin = 'DOCUMENTO.CD_EMPRESA'
    end
    object TB_DOCUMENTOCD_UND: TIntegerField
      FieldName = 'CD_UND'
      Origin = 'DOCUMENTO.CD_UND'
      Required = True
    end
  end
  object TB_USUARIO: TIBDataSet
    Database = DM.DB
    Transaction = DM.TS
    AfterDelete = TB_USUARIOAfterDelete
    AfterInsert = TB_USUARIOAfterInsert
    AfterPost = TB_USUARIOAfterPost
    BeforeDelete = TB_USUARIOBeforeDelete
    OnDeleteError = TB_PARAMETRODeleteError
    OnEditError = TB_PARAMETROEditError
    OnPostError = TB_PARAMETROPostError
    OnUpdateError = TB_PARAMETROUpdateError
    BufferChunks = 1000
    CachedUpdates = False
    DeleteSQL.Strings = (
      'delete from "USUARIO"'
      'where'
      '  "CD_USUARIO" = :"OLD_CD_USUARIO" and '
      '  "CD_UND" = :"OLD_CD_UND"')
    InsertSQL.Strings = (
      'insert into "USUARIO"'
      '('
      '  "CD_USUARIO"'
      ', "CD_UND"'
      ', "EMAIL"'
      ', "NOME"'
      ', "SENHA"'
      ', "DT_EXP"'
      ', "CD_EDI"'
      ', "NM_LOGIN"'
      ', "DT_CADASTRO"'
      ')'
      'values'
      '('
      '  :"CD_USUARIO"'
      ', :"CD_UND"'
      ', :"EMAIL"'
      ', :"NOME"'
      ', :"SENHA"'
      ', :"DT_EXP"'
      ', :"CD_EDI"'
      ', :"NM_LOGIN"'
      ', :"DT_CADASTRO"'
      ')')
    SelectSQL.Strings = (
      'select "USUARIO"."CD_USUARIO"'
      '      ,"USUARIO"."CD_UND"'
      '      ,"USUARIO"."EMAIL"'
      '      ,"USUARIO"."NOME"'
      '      ,"USUARIO"."SENHA"'
      '      ,"USUARIO"."DT_EXP"'
      '      ,"USUARIO"."CD_EDI"'
      '      ,"USUARIO"."NM_LOGIN"'
      '      ,"USUARIO"."DT_CADASTRO"'
      'from "USUARIO"'
      '')
    ModifySQL.Strings = (
      'update "USUARIO"'
      'set'
      ' "CD_USUARIO" = :"CD_USUARIO"'
      ', "CD_UND" = :"CD_UND"'
      ', "EMAIL" = :"EMAIL"'
      ', "NOME" = :"NOME"'
      ', "SENHA" = :"SENHA"'
      ', "DT_EXP" = :"DT_EXP"'
      ', "CD_EDI" = :"CD_EDI"'
      ', "NM_LOGIN" = :"NM_LOGIN"'
      ', "DT_CADASTRO" = :"DT_CADASTRO"'
      'where'
      '  "CD_USUARIO" = :"OLD_CD_USUARIO" and '
      '  "CD_UND" = :"OLD_CD_UND"')
    GeneratorField.ApplyEvent = gamOnServer
    Left = 80
    Top = 163
    object TB_USUARIOCD_USUARIO: TIntegerField
      FieldName = 'CD_USUARIO'
      Origin = 'USUARIO.CD_USUARIO'
      Required = True
    end
    object TB_USUARIOEMAIL: TIBStringField
      FieldName = 'EMAIL'
      Origin = 'USUARIO.EMAIL'
      Required = True
      Size = 50
    end
    object TB_USUARIONOME: TIBStringField
      FieldName = 'NOME'
      Origin = 'USUARIO.NOME'
      Required = True
      Size = 50
    end
    object TB_USUARIOSENHA: TIBStringField
      FieldName = 'SENHA'
      Origin = 'USUARIO.SENHA'
      Required = True
      FixedChar = True
      Size = 32
    end
    object TB_USUARIONM_LOGIN: TIBStringField
      FieldName = 'NM_LOGIN'
      Origin = 'USUARIO.NM_LOGIN'
    end
    object TB_USUARIODT_CADASTRO: TDateTimeField
      FieldName = 'DT_CADASTRO'
      Origin = 'USUARIO.DT_CADASTRO'
    end
    object TB_USUARIOCD_UND: TIntegerField
      FieldName = 'CD_UND'
      Origin = 'USUARIO.CD_UND'
      Required = True
    end
  end
  object TB_PERMISSAO_USUARIO: TIBDataSet
    Database = DM.DB
    Transaction = DM.TS
    OnDeleteError = TB_PARAMETRODeleteError
    OnEditError = TB_PARAMETROEditError
    OnPostError = TB_PARAMETROPostError
    OnUpdateError = TB_PARAMETROUpdateError
    BufferChunks = 1000
    CachedUpdates = False
    DeleteSQL.Strings = (
      'delete from "PERMISSAO_USUARIO"'
      'where'
      '  "CD_PERUSU" = :"OLD_CD_PERUSU" and '
      '  "CD_UND" = :"OLD_CD_UND"')
    InsertSQL.Strings = (
      'insert into "PERMISSAO_USUARIO"'
      '('
      '  "CD_PERUSU"'
      ', "CD_UND"'
      ', "CD_PERMISSAO"'
      ', "DS_MODULO"'
      ', "CD_USUARIO"'
      ', "CD_EMPRESA"'
      ', "CD_EMPRESA_ORIGEM"'
      ', "CD_EDI"'
      ', "NM_USUARIO"'
      ', "DT_CADASTRO"'
      ', "TP_EDI"'
      ', "DT_EXP"'
      ')'
      'values'
      '('
      '  :"CD_PERUSU"'
      ', :"CD_UND"'
      ', :"CD_PERMISSAO"'
      ', :"DS_MODULO"'
      ', :"CD_USUARIO"'
      ', :"CD_EMPRESA"'
      ', :"CD_EMPRESA_ORIGEM"'
      ', :"CD_EDI"'
      ', :"NM_USUARIO"'
      ', :"DT_CADASTRO"'
      ', :"TP_EDI"'
      ', :"DT_EXP"'
      ')')
    SelectSQL.Strings = (
      'select "PERMISSAO_USUARIO"."CD_PERUSU"'
      '      ,"PERMISSAO_USUARIO"."CD_UND"'
      '      ,"PERMISSAO_USUARIO"."CD_PERMISSAO"'
      '      ,"PERMISSAO_USUARIO"."DS_MODULO"'
      '      ,"PERMISSAO_USUARIO"."CD_USUARIO"'
      '      ,"PERMISSAO_USUARIO"."CD_EMPRESA"'
      '      ,"PERMISSAO_USUARIO"."CD_EMPRESA_ORIGEM"'
      '      ,"PERMISSAO_USUARIO"."CD_EDI"'
      '      ,"PERMISSAO_USUARIO"."NM_USUARIO"'
      '      ,"PERMISSAO_USUARIO"."DT_CADASTRO"'
      '      ,"PERMISSAO_USUARIO"."TP_EDI"'
      '      ,"PERMISSAO_USUARIO"."DT_EXP"'
      'from "PERMISSAO_USUARIO"')
    ModifySQL.Strings = (
      'update "PERMISSAO_USUARIO"'
      'set'
      ' "CD_PERUSU" = :"CD_PERUSU"'
      ', "CD_UND" = :"CD_UND"'
      ', "CD_PERMISSAO" = :"CD_PERMISSAO"'
      ', "DS_MODULO" = :"DS_MODULO"'
      ', "CD_USUARIO" = :"CD_USUARIO"'
      ', "CD_EMPRESA" = :"CD_EMPRESA"'
      ', "CD_EMPRESA_ORIGEM" = :"CD_EMPRESA_ORIGEM"'
      ', "CD_EDI" = :"CD_EDI"'
      ', "NM_USUARIO" = :"NM_USUARIO"'
      ', "DT_CADASTRO" = :"DT_CADASTRO"'
      ', "TP_EDI" = :"TP_EDI"'
      ', "DT_EXP" = :"DT_EXP"'
      'where'
      '  "CD_PERUSU" = :"OLD_CD_PERUSU" and '
      '  "CD_UND" = :"OLD_CD_UND"')
    Left = 216
    Top = 163
    object TB_PERMISSAO_USUARIOCD_PERMISSAO: TIntegerField
      FieldName = 'CD_PERMISSAO'
      Origin = 'PERMISSAO_USUARIO.CD_PERMISSAO'
      Required = True
    end
    object TB_PERMISSAO_USUARIODS_MODULO: TIBStringField
      FieldName = 'DS_MODULO'
      Origin = 'PERMISSAO_USUARIO.DS_MODULO'
      Required = True
      Size = 15
    end
    object TB_PERMISSAO_USUARIOCD_USUARIO: TIntegerField
      FieldName = 'CD_USUARIO'
      Origin = 'PERMISSAO_USUARIO.CD_USUARIO'
      Required = True
    end
  end
  object qyUsuario: TIBQuery
    Database = DM.DB
    Transaction = DM.TS
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select * from USUARIO'
      'where NM_LOGIN = :NM_LOGIN')
    Left = 624
    Top = 219
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'NM_LOGIN'
        ParamType = ptUnknown
      end>
    object qyUsuarioCD_USUARIO: TIntegerField
      FieldName = 'CD_USUARIO'
      Origin = 'USUARIO.CD_USUARIO'
      Required = True
    end
    object qyUsuarioNM_USUARIO: TIBStringField
      FieldName = 'NM_USUARIO'
      Origin = 'USUARIO.NM_USUARIO'
      Size = 100
    end
    object qyUsuarioNM_LOGIN: TIBStringField
      FieldName = 'NM_LOGIN'
      Origin = 'USUARIO.NM_LOGIN'
      Size = 15
    end
    object qyUsuarioDS_SENHA: TIBStringField
      FieldName = 'DS_SENHA'
      Origin = 'USUARIO.DS_SENHA'
      Size = 15
    end
    object qyUsuarioCD_EMPRESA: TIntegerField
      FieldName = 'CD_EMPRESA'
      Origin = 'USUARIO.CD_EMPRESA'
    end
  end
  object dsPessoa: TDataSource
    AutoEdit = False
    DataSet = TB_PESSOA
    Left = 536
    Top = 355
  end
  object TB_PESSOA_TEL: TIBDataSet
    Database = DM.DB
    Transaction = DM.TS
    AfterDelete = TB_PESSOA_TELAfterDelete
    AfterInsert = TB_PESSOA_TELAfterInsert
    AfterPost = TB_PESSOA_TELAfterPost
    BeforeDelete = TB_PESSOA_TELBeforeDelete
    OnDeleteError = TB_PARAMETRODeleteError
    OnEditError = TB_PARAMETROEditError
    OnPostError = TB_PARAMETROPostError
    OnUpdateError = TB_PARAMETROUpdateError
    BufferChunks = 1000
    CachedUpdates = False
    DeleteSQL.Strings = (
      'delete from "TELEFONE"'
      'where'
      '  "CD_TELEFONE" = :"OLD_CD_TELEFONE"')
    InsertSQL.Strings = (
      'insert into "TELEFONE"'
      '('
      '  "CD_TELEFONE"'
      ', "CD_PESSOA"'
      ', "NR_TELEFONE"'
      ', "TP_TELEFONE"'
      ', "FL_PRINCIPAL"'
      ', "CD_EMPRESA"'
      ')'
      'values'
      '('
      '  :"CD_TELEFONE"'
      ', :"CD_PESSOA"'
      ', :"NR_TELEFONE"'
      ', :"TP_TELEFONE"'
      ', :"FL_PRINCIPAL"'
      ', :"CD_EMPRESA"'
      ')')
    SelectSQL.Strings = (
      
        'select  CD_PESSOA, CD_TELEFONE, NR_TELEFONE, TP_TELEFONE, FL_PRI' +
        'NCIPAL,CD_EMPRESA'
      'from TELEFONE'
      'where CD_PESSOA = :CD_PESSOA')
    ModifySQL.Strings = (
      'update "TELEFONE"'
      'set'
      ' "CD_TELEFONE" = :"CD_TELEFONE"'
      ', "CD_PESSOA" = :"CD_PESSOA"'
      ', "NR_TELEFONE" = :"NR_TELEFONE"'
      ', "TP_TELEFONE" = :"TP_TELEFONE"'
      ', "FL_PRINCIPAL" = :"FL_PRINCIPAL"'
      ', "CD_EMPRESA" = :"CD_EMPRESA"'
      'where'
      '  "CD_TELEFONE" = :"OLD_CD_TELEFONE"')
    GeneratorField.Field = 'CD_TELEFONE'
    GeneratorField.Generator = 'GEN_TELEFONE'
    GeneratorField.ApplyEvent = gamOnPost
    DataSource = dsPessoa
    Left = 216
    Top = 387
    object TB_PESSOA_TELCD_PESSOA: TIntegerField
      FieldName = 'CD_PESSOA'
      Origin = 'TELEFONE.CD_PESSOA'
      Required = True
    end
    object TB_PESSOA_TELCD_TELEFONE: TIntegerField
      FieldName = 'CD_TELEFONE'
      Origin = 'TELEFONE.CD_TELEFONE'
      Required = True
    end
    object TB_PESSOA_TELNR_TELEFONE: TIBStringField
      DisplayLabel = 'N'#250'mero'
      FieldName = 'NR_TELEFONE'
      Origin = 'TELEFONE.NR_TELEFONE'
    end
    object TB_PESSOA_TELTP_TELEFONE: TIBStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TP_TELEFONE'
      Origin = 'TELEFONE.TP_TELEFONE'
    end
    object TB_PESSOA_TELFL_PRINCIPAL: TIBStringField
      DisplayLabel = 'Principal'
      FieldName = 'FL_PRINCIPAL'
      Origin = 'TELEFONE.FL_PRINCIPAL'
      Required = True
      FixedChar = True
      Size = 1
    end
    object TB_PESSOA_TELCD_EMPRESA: TIntegerField
      FieldName = 'CD_EMPRESA'
      Origin = 'TELEFONE.CD_EMPRESA'
    end
  end
  object TB_UNIDADE: TIBDataSet
    Database = DM.DB
    Transaction = DM.TS
    AfterDelete = TB_UNIDADEAfterDelete
    AfterInsert = TB_UNIDADEAfterInsert
    AfterPost = TB_UNIDADEAfterPost
    BeforeDelete = TB_UNIDADEBeforeDelete
    OnDeleteError = TB_PARAMETRODeleteError
    OnEditError = TB_PARAMETROEditError
    OnPostError = TB_PARAMETROPostError
    OnUpdateError = TB_PARAMETROUpdateError
    BufferChunks = 1000
    CachedUpdates = False
    DeleteSQL.Strings = (
      'delete from "UNIDADE"'
      'where'
      '  "CD_UNIDADE" = :"OLD_CD_UNIDADE"'
      'AND "CD_UND" =:"OLD_CD_UND"')
    InsertSQL.Strings = (
      'insert into "UNIDADE"'
      '('
      '  "CD_UNIDADE"'
      ', "CD_UND"'
      ', "CD_PROVINCIA"'
      ', "DS_UNIDADE"'
      ', "CD_MUNICIPIO"'
      ', "FL_ATIVA"'
      ', "VL_VERSAO"'
      ')'
      'values'
      '('
      '  :"CD_UNIDADE"'
      ', :"CD_UND"'
      ', :"CD_PROVINCIA"'
      ', :"DS_UNIDADE"'
      ', :"CD_MUNICIPIO"'
      ', :"FL_ATIVA"'
      ', :"VL_VERSAO"'
      ')')
    SelectSQL.Strings = (
      'select "UNIDADE"."CD_UNIDADE"'
      '      ,"UNIDADE"."CD_UND"'
      '      ,"UNIDADE"."DS_UNIDADE"'
      '      ,"UNIDADE"."CD_PROVINCIA"'
      '      ,"UNIDADE"."CD_MUNICIPIO"'
      '      ,"UNIDADE"."FL_ATIVA"'
      '      ,"UNIDADE"."VL_VERSAO"'
      '      ,"PROVINCIA"."DS_PROVINCIA"'
      '      ,"MUNICIPIO"."DS_MUNICIPIO"'
      'from "UNIDADE"'
      ' LEFT OUTER JOIN "PROVINCIA" ON'
      '      "UNIDADE"."CD_PROVINCIA" = "PROVINCIA"."CD_PROVINCIA"'
      'AND '
      '      "UNIDADE"."CD_UND"   = "PROVINCIA"."CD_UND"  '
      ''
      ' LEFT OUTER JOIN "MUNICIPIO" ON'
      '      "UNIDADE"."CD_MUNICIPIO" = "MUNICIPIO"."CD_MUNICIPIO"'
      'AND '
      '      "UNIDADE"."CD_UND"   = "PROVINCIA"."CD_UND"  '
      'order by'
      '"UNIDADE"."CD_UNIDADE"')
    ModifySQL.Strings = (
      'update "UNIDADE"'
      'set'
      ' "CD_UNIDADE" = :"CD_UNIDADE"'
      ', "CD_UND" =:"CD_UND"'
      ', "DS_UNIDADE" = :"DS_UNIDADE"'
      ', "CD_PROVINCIA" = :"CD_PROVINCIA"'
      ', "CD_MUNICIPIO" = :"CD_MUNICIPIO"'
      ', "FL_ATIVA" =:"FL_ATIVA"'
      ', "VL_VERSAO" = :"VL_VERSAO"'
      'where'
      '  "CD_UNIDADE" = :"OLD_CD_UNIDADE"'
      'AND '
      '  "CD_UND" =:"OLD_CD_UND"')
    GeneratorField.Field = 'CD_UNIDADE'
    Left = 80
    Top = 211
    object TB_UNIDADECD_UNIDADE: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'CD_UNIDADE'
      Origin = 'UNIDADE.CD_UNIDADE'
      Required = True
    end
    object TB_UNIDADEDS_UNIDADE: TIBStringField
      DisplayLabel = 'Nome da Unidade'
      FieldName = 'DS_UNIDADE'
      Origin = 'UNIDADE.DS_UNIDADE'
      Required = True
      Size = 50
    end
    object TB_UNIDADECD_UND: TIntegerField
      FieldName = 'CD_UND'
      Origin = 'UNIDADE.CD_UND'
      Required = True
    end
    object TB_UNIDADECD_PROVINCIA: TIntegerField
      FieldName = 'CD_PROVINCIA'
      Origin = 'UNIDADE.CD_PROVINCIA'
    end
    object TB_UNIDADEDS_PROVINCIA: TIBStringField
      FieldName = 'DS_PROVINCIA'
      Origin = 'PROVINCIA.DS_PROVINCIA'
      Size = 50
    end
    object TB_UNIDADECD_MUNICIPIO: TIntegerField
      FieldName = 'CD_MUNICIPIO'
      Origin = 'UNIDADE.CD_MUNICIPIO'
    end
    object TB_UNIDADEDS_MUNICIPIO: TIBStringField
      FieldName = 'DS_MUNICIPIO'
      Origin = 'MUNICIPIO.DS_MUNICIPIO'
      Size = 50
    end
    object TB_UNIDADEFL_ATIVA: TIBStringField
      FieldName = 'FL_ATIVA'
      Origin = 'UNIDADE.FL_ATIVA'
      FixedChar = True
      Size = 1
    end
    object TB_UNIDADEVL_VERSAO: TIBStringField
      FieldName = 'VL_VERSAO'
      Origin = 'UNIDADE.VL_VERSAO'
    end
  end
  object qyUsuarios: TIBQuery
    Database = DM.DB
    Transaction = DM.TS
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select CD_USUARIO, NM_USUARIO from USUARIO')
    Left = 535
    Top = 240
    object qyUsuariosCD_USUARIO: TIntegerField
      FieldName = 'CD_USUARIO'
      Origin = 'USUARIO.CD_USUARIO'
      Required = True
    end
    object qyUsuariosNM_USUARIO: TIBStringField
      FieldName = 'NM_USUARIO'
      Origin = 'USUARIO.NM_USUARIO'
      Size = 100
    end
  end
  object dsUsuarios: TDataSource
    DataSet = qyUsuarios
    Left = 536
    Top = 179
  end
  object TB_PAIS: TIBDataSet
    Database = DM.DB
    Transaction = DM.TS
    AfterDelete = TB_PAISAfterDelete
    AfterInsert = TB_PAISAfterInsert
    AfterPost = TB_PAISAfterPost
    BeforeDelete = TB_PAISBeforeDelete
    OnDeleteError = TB_PARAMETRODeleteError
    OnEditError = TB_PARAMETROEditError
    OnPostError = TB_PARAMETROPostError
    OnUpdateError = TB_PARAMETROUpdateError
    BufferChunks = 1000
    CachedUpdates = False
    DeleteSQL.Strings = (
      'delete from "PAIS"'
      'where'
      '  "CD_PAIS" = :"OLD_CD_PAIS"')
    InsertSQL.Strings = (
      'insert into "PAIS"'
      '('
      '  "CD_PAIS"'
      ', "DS_PAIS"'
      ', "CD_UND"'
      ''
      ')'
      'values'
      '('
      '  :"CD_PAIS"'
      ', :"DS_PAIS"'
      ', :"CD_UND"'
      ')')
    SelectSQL.Strings = (
      'select "PAIS"."CD_PAIS"'
      '      ,"PAIS"."DS_PAIS"'
      '      ,"PAIS"."CD_UND"'
      'from "PAIS"'
      'order by'
      '"PAIS"."CD_PAIS"')
    ModifySQL.Strings = (
      'update "PAIS"'
      'set'
      ' "CD_PAIS" = :"CD_PAIS"'
      ', "DS_PAIS" = :"DS_PAIS"'
      ', "CD_UND" = :"CD_UND"'
      'where'
      '  "CD_PAIS" = :"OLD_CD_PAIS"')
    GeneratorField.Field = 'CD_UNIDADE'
    Left = 80
    Top = 363
    object TB_PAISCD_PAIS: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'CD_PAIS'
      Origin = 'PAIS.CD_PAIS'
      Required = True
    end
    object TB_PAISDS_PAIS: TIBStringField
      DisplayLabel = 'Nome do Pais'
      FieldName = 'DS_PAIS'
      Origin = 'PAIS.DS_PAIS'
      Required = True
      Size = 50
    end
    object TB_PAISCD_UND: TIntegerField
      FieldName = 'CD_UND'
      Origin = 'PAIS.CD_UND'
      Required = True
    end
  end
  object TB_PROVINCIA: TIBDataSet
    Database = DM.DB
    Transaction = DM.TS
    AfterDelete = TB_PROVINCIAAfterDelete
    AfterInsert = TB_PROVINCIAAfterInsert
    AfterPost = TB_PROVINCIAAfterPost
    BeforeDelete = TB_PROVINCIABeforeDelete
    OnDeleteError = TB_PARAMETRODeleteError
    OnEditError = TB_PARAMETROEditError
    OnPostError = TB_PARAMETROPostError
    OnUpdateError = TB_PARAMETROUpdateError
    BufferChunks = 1000
    CachedUpdates = False
    DeleteSQL.Strings = (
      'delete from "PROVINCIA"'
      'where'
      '  "CD_PROVINCIA" = :"OLD_CD_PROVINCIA"')
    InsertSQL.Strings = (
      'insert into "PROVINCIA"'
      '('
      '  "CD_PROVINCIA"'
      ', "CD_PAIS"'
      ', "DS_PROVINCIA"'
      ', "CD_UND"'
      ')'
      'values'
      '('
      '  :"CD_PROVINCIA"'
      ', :"CD_PAIS"'
      ', :"DS_PROVINCIA"'
      ', :"CD_UND"'
      ')')
    SelectSQL.Strings = (
      'select "PROVINCIA"."CD_PROVINCIA"'
      '      ,"PROVINCIA"."CD_PAIS"'
      '      ,"PROVINCIA"."DS_PROVINCIA"'
      '      ,"PAIS"."DS_PAIS"'
      '      ,"PAIS"."CD_UND"'
      'from "PROVINCIA", "PAIS"'
      'where       "PROVINCIA"."CD_PAIS" = "PAIS"."CD_PAIS"'
      'order by'
      '"PAIS"."CD_PAIS",'
      '"PROVINCIA"."CD_PROVINCIA"')
    ModifySQL.Strings = (
      'update "PROVINCIA"'
      'set'
      ' "CD_PROVINCIA" = :"CD_PROVINCIA"'
      ', "CD_PAIS" = :"CD_PAIS"'
      ', "DS_PROVINCIA" = :"DS_PROVINCIA"'
      ', "CD_UND" = :"CD_UND"'
      'where'
      '  "CD_PROVINCIA" = :"OLD_CD_PROVINCIA"')
    GeneratorField.Field = 'CD_UNIDADE'
    Left = 80
    Top = 419
    object TB_PROVINCIACD_PROVINCIA: TIntegerField
      DisplayLabel = 'C'#243'd. Prov.'
      FieldName = 'CD_PROVINCIA'
      Origin = 'PROVINCIA.CD_PROVINCIA'
      Required = True
    end
    object TB_PROVINCIADS_PROVINCIA: TIBStringField
      DisplayLabel = 'Nome da Provincia'
      FieldName = 'DS_PROVINCIA'
      Origin = 'PROVINCIA.DS_PROVINCIA'
      Required = True
      Size = 50
    end
    object TB_PROVINCIACD_PAIS: TIntegerField
      DisplayLabel = 'C'#243'd.Pais'
      FieldName = 'CD_PAIS'
      Origin = 'PROVINCIA.CD_PAIS'
      Required = True
    end
    object TB_PROVINCIADS_PAIS: TIBStringField
      DisplayLabel = 'Nome do Pais'
      FieldName = 'DS_PAIS'
      Origin = 'PAIS.DS_PAIS'
      Required = True
      Size = 50
    end
    object TB_PROVINCIACD_UND: TIntegerField
      FieldName = 'CD_UND'
      Origin = 'PAIS.CD_UND'
      Required = True
    end
  end
  object TB_MUNICIPIO: TIBDataSet
    Database = DM.DB
    Transaction = DM.TS
    AfterDelete = TB_MUNICIPIOAfterDelete
    AfterInsert = TB_MUNICIPIOAfterInsert
    AfterPost = TB_MUNICIPIOAfterPost
    BeforeDelete = TB_MUNICIPIOBeforeDelete
    OnDeleteError = TB_PARAMETRODeleteError
    OnEditError = TB_PARAMETROEditError
    OnPostError = TB_PARAMETROPostError
    OnUpdateError = TB_PARAMETROUpdateError
    BufferChunks = 1000
    CachedUpdates = False
    DeleteSQL.Strings = (
      'delete from "MUNICIPIO"'
      'where'
      '  "CD_MUNICIPIO" = :"OLD_CD_MUNICIPIO"')
    InsertSQL.Strings = (
      'insert into "MUNICIPIO"'
      '('
      '  "CD_MUNICIPIO"'
      ', "CD_PROVINCIA"'
      ', "DS_MUNICIPIO"'
      ', "CD_UND"'
      ')'
      'values'
      '('
      '  :"CD_MUNICIPIO"'
      ', :"CD_PROVINCIA"'
      ', :"DS_MUNICIPIO"'
      ', :"CD_UND"'
      ')')
    SelectSQL.Strings = (
      'select "MUNICIPIO"."CD_MUNICIPIO"'
      '      ,"MUNICIPIO"."CD_PROVINCIA"'
      '      ,"MUNICIPIO"."DS_MUNICIPIO"'
      '       ,"MUNICIPIO"."CD_UND"'
      '      ,"PROVINCIA"."DS_PROVINCIA"'
      '      ,"PAIS"."CD_PAIS"'
      '      ,"PAIS"."DS_PAIS"'
      'from "MUNICIPIO", "PROVINCIA", "PAIS"'
      'where     "PROVINCIA"."CD_PAIS" = "PAIS"."CD_PAIS"'
      
        'AND       "MUNICIPIO"."CD_PROVINCIA" = "PROVINCIA"."CD_PROVINCIA' +
        '"'
      'order by'
      '"PAIS"."DS_PAIS",'
      '"PROVINCIA"."DS_PROVINCIA",'
      '"MUNICIPIO"."CD_MUNICIPIO"')
    ModifySQL.Strings = (
      'update "MUNICIPIO"'
      'set'
      ' "CD_MUNICIPIO" = :"CD_MUNICIPIO"'
      ', "CD_PROVINCIA" = :"CD_PROVINCIA"'
      ', "DS_MUNICIPIO" = :"DS_MUNICIPIO"'
      ', "CD_UND" = :"CD_UND"'
      'where'
      '  "CD_MUNICIPIO" = :"OLD_CD_MUNICIPIO"')
    GeneratorField.Field = 'CD_UNIDADE'
    Left = 80
    Top = 473
    object TB_MUNICIPIOCD_MUNICIPIO: TIntegerField
      DisplayLabel = 'C'#243'd.'
      FieldName = 'CD_MUNICIPIO'
      Origin = 'MUNICIPIO.CD_MUNICIPIO'
      Required = True
    end
    object TB_MUNICIPIOCD_PROVINCIA: TIntegerField
      DisplayLabel = 'C'#243'd.Provincia'
      FieldName = 'CD_PROVINCIA'
      Origin = 'MUNICIPIO.CD_PROVINCIA'
      Required = True
    end
    object TB_MUNICIPIODS_MUNICIPIO: TIBStringField
      DisplayLabel = 'Nome do Municipio'
      FieldName = 'DS_MUNICIPIO'
      Origin = 'MUNICIPIO.DS_MUNICIPIO'
      Required = True
      Size = 50
    end
    object TB_MUNICIPIODS_PROVINCIA: TIBStringField
      DisplayLabel = 'Nome da Provincia'
      FieldName = 'DS_PROVINCIA'
      Origin = 'PROVINCIA.DS_PROVINCIA'
      Required = True
      Size = 50
    end
    object TB_MUNICIPIODS_PAIS: TIBStringField
      DisplayLabel = 'Nome do Pais'
      FieldName = 'DS_PAIS'
      Origin = 'PAIS.DS_PAIS'
      Required = True
      Size = 50
    end
    object TB_MUNICIPIOCD_PAIS: TIntegerField
      DisplayLabel = 'Pais'
      FieldName = 'CD_PAIS'
      Origin = 'PAIS.CD_PAIS'
      Required = True
    end
    object TB_MUNICIPIOCD_UND: TIntegerField
      FieldName = 'CD_UND'
      Origin = 'MUNICIPIO.CD_UND'
      Required = True
    end
  end
  object TB_NOTIFICACAO: TIBDataSet
    Database = DM.DB
    Transaction = DM.TS
    AfterDelete = TB_NOTIFICACAOAfterDelete
    AfterInsert = TB_NOTIFICACAOAfterInsert
    AfterPost = TB_NOTIFICACAOAfterPost
    BeforeDelete = TB_NOTIFICACAOBeforeDelete
    BeforeOpen = TB_NOTIFICACAOBeforeOpen
    BeforePost = TB_NOTIFICACAOBeforePost
    OnDeleteError = TB_PARAMETRODeleteError
    OnEditError = TB_PARAMETROEditError
    OnPostError = TB_PARAMETROPostError
    OnUpdateError = TB_PARAMETROUpdateError
    BufferChunks = 1000
    CachedUpdates = False
    DeleteSQL.Strings = (
      'delete from "NOTIFICACAO"'
      'where'
      '  "CD_FICHA" = :"OLD_CD_FICHA"')
    InsertSQL.Strings = (
      'insert into "NOTIFICACAO"'
      '('
      '  "CD_FICHA"'
      ', "CD_UNIDADE"'
      ', "CD_USUARIO"'
      ', "CD_MUNICIPIO"'
      ', "CD_UNIDADE_TRATAMENTO"'
      ', "CD_MUNICIPIO_TRATAMENTO"'
      ', "CD_PACIENTE"'
      ', "DT_NOTIFICACAO"'
      ', "DT_DIAGNOSTICO"'
      ', "CD_RELACOES_SEXO"'
      ', "CD_MAE_POSITIVO"'
      ', "CD_USOU_DROGA"'
      ', "CD_ACIDENTE_MAT_BIO"'
      ', "SN_TRANSFUSAO_SANGUE"'
      ', "SN_PERFURACAO"'
      ', "SN_TRAT_DENTARIO"'
      ', "SN_INTERV_CIRURGICA"'
      ', "SN_CIRCUNCISAO"'
      ', "CD_TESTE_TRIAGEM"'
      ', "DS_TESTE_TRIAGEM"'
      ', "CD_OCUPACAO"'
      ', "DS_OCUPACAO"'
      ', "CD_TESTE_CONFIRMATORIO"'
      ', "DS_TESTE_CONFIRMATORIO"'
      ', "CD_OMS"'
      ', "CD_CD4"'
      ', "CD_EVOLUCAO"'
      ', "DT_EVOLUCAO"'
      ', "DS_OBSERVACAO"'
      ', "CD_NOTIFICACAO"'
      ', "REGDUP"'
      ', "CD_LOTE"'
      ', "NM_ENTREVISTADOR"'
      ', "TEL_ENTREVISTADOR"'
      ', "FUNCAO_ENTREVISTADOR"'
      ', "NM_MEDICO"'
      ', "TEL_MEDICO"'
      ', "SN_TATUAGEM"'
      ', "TP_ENTRADA"'
      ', "EVIDENCIA_GESTANTE"'
      ', "TB_ATUAL"'
      ', "TB_ANTERIOR"'
      ', "DT_TRATAMENTO_TB"'
      ', "CD_PROVINCIA_TRATAMENTO"'
      ', "CD_PROVINCIA_NOT"'
      ', "DT_ALTERACAO"'
      ', "DT_EXPORTACAO"'
      ', "CD_FICHA_ORACLE"'
      ', "CD_MEDICO"'
      ', "NR_NOTIFICACAO"'
      ', "CD_FICHA_SINVS"'
      ', "CD_INVESTIGADOR"'
      ', "DT_TESTE_TRIAGEM"'
      ', "DT_TESTE_CONFIRMATORIO"'
      ', "NR_PROCESSO_UTENTE"'
      ', "CD_UND"'
      ', "DT_ENTRADA"'
      ', "DT_EVOLUCAO_2"'
      ')'
      'values'
      '('
      '  :"CD_FICHA"'
      ', :"CD_UNIDADE"'
      ', :"CD_USUARIO"'
      ', :"CD_MUNICIPIO"'
      ', :"CD_UNIDADE_TRATAMENTO"'
      ', :"CD_MUNICIPIO_TRATAMENTO"'
      ', :"CD_PACIENTE"'
      ', :"DT_NOTIFICACAO"'
      ', :"DT_DIAGNOSTICO"'
      ', :"CD_RELACOES_SEXO"'
      ', :"CD_MAE_POSITIVO"'
      ', :"CD_USOU_DROGA"'
      ', :"CD_ACIDENTE_MAT_BIO"'
      ', :"SN_TRANSFUSAO_SANGUE"'
      ', :"SN_PERFURACAO"'
      ', :"SN_TRAT_DENTARIO"'
      ', :"SN_INTERV_CIRURGICA"'
      ', :"SN_CIRCUNCISAO"'
      ', :"CD_TESTE_TRIAGEM"'
      ', :"DS_TESTE_TRIAGEM"'
      ', :"CD_OCUPACAO"'
      ', :"DS_OCUPACAO"'
      ', :"CD_TESTE_CONFIRMATORIO"'
      ', :"DS_TESTE_CONFIRMATORIO"'
      ', :"CD_OMS"'
      ', :"CD_CD4"'
      ', :"CD_EVOLUCAO"'
      ', :"DT_EVOLUCAO"'
      ', :"DS_OBSERVACAO"'
      ', :"CD_NOTIFICACAO"'
      ', :"REGDUP"'
      ', :"CD_LOTE"'
      ', :"NM_ENTREVISTADOR"'
      ', :"TEL_ENTREVISTADOR"'
      ', :"FUNCAO_ENTREVISTADOR"'
      ', :"NM_MEDICO"'
      ', :"TEL_MEDICO"'
      ', :"SN_TATUAGEM"'
      ', :"TP_ENTRADA"'
      ', :"EVIDENCIA_GESTANTE"'
      ', :"TB_ATUAL"'
      ', :"TB_ANTERIOR"'
      ', :"DT_TRATAMENTO_TB"'
      ', :"CD_PROVINCIA_TRATAMENTO"'
      ', :"CD_PROVINCIA_NOT"'
      ', :"DT_ALTERACAO"'
      ', :"DT_EXPORTACAO"'
      ', :"CD_FICHA_ORACLE"'
      ', :"CD_MEDICO"'
      ', :"NR_NOTIFICACAO"'
      ', :"CD_FICHA_SINVS"'
      ', :"CD_INVESTIGADOR"'
      ', :"DT_TESTE_TRIAGEM"'
      ', :"DT_TESTE_CONFIRMATORIO"'
      ', :"NR_PROCESSO_UTENTE"'
      ', :"CD_UND"'
      ', :"DT_ENTRADA"'
      ', :"DT_EVOLUCAO_2")')
    SelectSQL.Strings = (
      'select "NOTIFICACAO"."CD_FICHA"'
      '      ,"NOTIFICACAO"."CD_UNIDADE"'
      '      ,"NOTIFICACAO"."CD_USUARIO"'
      '      ,"NOTIFICACAO"."CD_MUNICIPIO"'
      '      ,"NOTIFICACAO"."CD_UNIDADE_TRATAMENTO"'
      '      ,"NOTIFICACAO"."CD_MUNICIPIO_TRATAMENTO"'
      '      ,"NOTIFICACAO"."CD_PACIENTE"'
      '      ,"NOTIFICACAO"."DT_NOTIFICACAO"'
      '      ,"NOTIFICACAO"."DT_DIAGNOSTICO"'
      '      ,"NOTIFICACAO"."CD_RELACOES_SEXO"'
      '      ,"NOTIFICACAO"."CD_MAE_POSITIVO"'
      '      ,"NOTIFICACAO"."CD_USOU_DROGA"'
      '      ,"NOTIFICACAO"."CD_ACIDENTE_MAT_BIO"'
      '      ,"NOTIFICACAO"."SN_TRANSFUSAO_SANGUE"'
      '      ,"NOTIFICACAO"."SN_PERFURACAO"'
      '      ,"NOTIFICACAO"."SN_TRAT_DENTARIO"'
      '      ,"NOTIFICACAO"."SN_INTERV_CIRURGICA"'
      '      ,"NOTIFICACAO"."SN_CIRCUNCISAO"'
      '      ,"NOTIFICACAO"."CD_TESTE_TRIAGEM"'
      '      ,"NOTIFICACAO"."DS_TESTE_TRIAGEM"'
      '      ,"NOTIFICACAO"."CD_OCUPACAO"'
      '      ,"NOTIFICACAO"."DS_OCUPACAO"'
      '      ,"NOTIFICACAO"."CD_TESTE_CONFIRMATORIO"'
      '      ,"NOTIFICACAO"."DS_TESTE_CONFIRMATORIO"'
      '      ,"NOTIFICACAO"."CD_OMS"'
      '      ,"NOTIFICACAO"."CD_CD4"'
      '      ,"NOTIFICACAO"."CD_EVOLUCAO"'
      '      ,"NOTIFICACAO"."DT_EVOLUCAO"'
      '      ,"NOTIFICACAO"."DS_OBSERVACAO"'
      '      ,"NOTIFICACAO"."CD_NOTIFICACAO"'
      '      ,"NOTIFICACAO"."REGDUP"'
      '      ,"NOTIFICACAO"."CD_LOTE"'
      '      ,"NOTIFICACAO"."NM_ENTREVISTADOR"'
      '      ,"NOTIFICACAO"."TEL_ENTREVISTADOR"'
      '      ,"NOTIFICACAO"."FUNCAO_ENTREVISTADOR"'
      '      ,"NOTIFICACAO"."NM_MEDICO"'
      '      ,"NOTIFICACAO"."TEL_MEDICO"'
      '      ,"NOTIFICACAO"."SN_TATUAGEM"'
      '      ,"NOTIFICACAO"."TP_ENTRADA"'
      '      ,"NOTIFICACAO"."EVIDENCIA_GESTANTE"'
      '      ,"NOTIFICACAO"."TB_ATUAL"'
      '      ,"NOTIFICACAO"."TB_ANTERIOR"'
      '      ,"NOTIFICACAO"."DT_TRATAMENTO_TB"'
      '      ,"NOTIFICACAO"."CD_PROVINCIA_TRATAMENTO"'
      '      ,"NOTIFICACAO"."CD_PROVINCIA_NOT"'
      '      ,"NOTIFICACAO"."DT_ALTERACAO"'
      '      ,"NOTIFICACAO"."DT_EXPORTACAO"'
      '      ,"NOTIFICACAO"."CD_FICHA_ORACLE"'
      '      ,"NOTIFICACAO"."CD_MEDICO"'
      '      ,"NOTIFICACAO"."NR_NOTIFICACAO"'
      '      ,"NOTIFICACAO"."CD_FICHA_SINVS"'
      '      ,"NOTIFICACAO"."CD_INVESTIGADOR"'
      '      ,"NOTIFICACAO"."DT_TESTE_TRIAGEM"'
      '      ,"NOTIFICACAO"."DT_TESTE_CONFIRMATORIO"'
      '      ,"NOTIFICACAO"."NR_PROCESSO_UTENTE"'
      '      ,"NOTIFICACAO"."CD_UND"'
      '      ,"NOTIFICACAO"."DT_ENTRADA"'
      '      ,"NOTIFICACAO"."DT_EVOLUCAO_2"'
      '      ,PACIENTE.NM_PACIENTE '
      '      ,'
      '(SELECT DS_PROVINCIA FROM PROVINCIA'
      
        'WHERE CD_PROVINCIA = NOTIFICACAO.CD_PROVINCIA_NOT)DS_PROVINCIA_N' +
        'OT,'
      '(SELECT DS_MUNICIPIO FROM MUNICIPIO'
      'WHERE CD_MUNICIPIO = NOTIFICACAO.CD_MUNICIPIO)DS_MUNICIPIO_NOT,'
      '(SELECT DS_UNIDADE FROM UNIDADE'
      'WHERE CD_UNIDADE = NOTIFICACAO.CD_UNIDADE)DS_UNIDADE,'
      '(SELECT DS_PROVINCIA FROM PROVINCIA'
      
        'WHERE CD_PROVINCIA = NOTIFICACAO.CD_PROVINCIA_TRATAMENTO)DS_PROV' +
        'INCIA_TRATAMENTO,'
      '(SELECT DS_MUNICIPIO FROM MUNICIPIO'
      
        'WHERE CD_MUNICIPIO = NOTIFICACAO.CD_MUNICIPIO_TRATAMENTO)DS_MUNI' +
        'CIPIO_TRATAMENTO,'
      '(SELECT DS_UNIDADE FROM UNIDADE'
      
        'WHERE CD_UNIDADE = NOTIFICACAO.CD_UNIDADE_TRATAMENTO)DS_UNIDADE_' +
        'TRATAMENTO'
      'from "NOTIFICACAO",'
      ' PACIENTE'
      'WHERE NOTIFICACAO.CD_FICHA =:CD_FICHA'
      'AND NOTIFICACAO.CD_UND = :CD_UND'
      'AND PACIENTE.CD_PACIENTE = NOTIFICACAO.CD_PACIENTE'
      'AND PACIENTE.CD_UND = NOTIFICACAO.CD_UND')
    ModifySQL.Strings = (
      'update "NOTIFICACAO"'
      'set'
      ' "CD_FICHA" = :"CD_FICHA"'
      ', "CD_UNIDADE" = :"CD_UNIDADE"'
      ', "CD_USUARIO" = :"CD_USUARIO"'
      ', "CD_MUNICIPIO" = :"CD_MUNICIPIO"'
      ', "CD_UNIDADE_TRATAMENTO" = :"CD_UNIDADE_TRATAMENTO"'
      ', "CD_MUNICIPIO_TRATAMENTO" = :"CD_MUNICIPIO_TRATAMENTO"'
      ', "CD_PACIENTE" = :"CD_PACIENTE"'
      ', "DT_NOTIFICACAO" = :"DT_NOTIFICACAO"'
      ', "DT_DIAGNOSTICO" = :"DT_DIAGNOSTICO"'
      ', "CD_RELACOES_SEXO" = :"CD_RELACOES_SEXO"'
      ', "CD_MAE_POSITIVO" = :"CD_MAE_POSITIVO"'
      ', "CD_USOU_DROGA" = :"CD_USOU_DROGA"'
      ', "CD_ACIDENTE_MAT_BIO" = :"CD_ACIDENTE_MAT_BIO"'
      ', "SN_TRANSFUSAO_SANGUE" = :"SN_TRANSFUSAO_SANGUE"'
      ', "SN_PERFURACAO" = :"SN_PERFURACAO"'
      ', "SN_TRAT_DENTARIO" = :"SN_TRAT_DENTARIO"'
      ', "SN_INTERV_CIRURGICA" = :"SN_INTERV_CIRURGICA"'
      ', "SN_CIRCUNCISAO" = :"SN_CIRCUNCISAO"'
      ', "CD_TESTE_TRIAGEM" = :"CD_TESTE_TRIAGEM"'
      ', "DS_TESTE_TRIAGEM" = :"DS_TESTE_TRIAGEM"'
      ', "CD_OCUPACAO" = :"CD_OCUPACAO"'
      ', "DS_OCUPACAO" = :"DS_OCUPACAO"'
      ', "CD_TESTE_CONFIRMATORIO" = :"CD_TESTE_CONFIRMATORIO"'
      ', "DS_TESTE_CONFIRMATORIO" = :"DS_TESTE_CONFIRMATORIO"'
      ', "CD_OMS" = :"CD_OMS"'
      ', "CD_CD4" = :"CD_CD4"'
      ', "CD_EVOLUCAO" = :"CD_EVOLUCAO"'
      ', "DT_EVOLUCAO" = :"DT_EVOLUCAO"'
      ', "DS_OBSERVACAO" = :"DS_OBSERVACAO"'
      ', "CD_NOTIFICACAO" = :"CD_NOTIFICACAO"'
      ', "REGDUP" = :"REGDUP"'
      ', "CD_LOTE" = :"CD_LOTE"'
      ', "NM_ENTREVISTADOR" = :"NM_ENTREVISTADOR"'
      ', "TEL_ENTREVISTADOR" = :"TEL_ENTREVISTADOR"'
      ', "FUNCAO_ENTREVISTADOR" = :"FUNCAO_ENTREVISTADOR"'
      ', "NM_MEDICO" = :"NM_MEDICO"'
      ', "TEL_MEDICO" = :"TEL_MEDICO"'
      ', "SN_TATUAGEM" = :"SN_TATUAGEM"'
      ', "TP_ENTRADA" = :"TP_ENTRADA"'
      ', "EVIDENCIA_GESTANTE" = :"EVIDENCIA_GESTANTE"'
      ', "TB_ATUAL" = :"TB_ATUAL"'
      ', "TB_ANTERIOR" = :"TB_ANTERIOR"'
      ', "DT_TRATAMENTO_TB" = :"DT_TRATAMENTO_TB"'
      ', "CD_PROVINCIA_TRATAMENTO" = :"CD_PROVINCIA_TRATAMENTO"'
      ', "CD_PROVINCIA_NOT" = :"CD_PROVINCIA_NOT"'
      ', "DT_ALTERACAO" = :"DT_ALTERACAO"'
      ', "DT_EXPORTACAO" = :"DT_EXPORTACAO"'
      ', "CD_FICHA_ORACLE" = :"CD_FICHA_ORACLE"'
      ', "CD_MEDICO" = :"CD_MEDICO"'
      ', "NR_NOTIFICACAO" = :"NR_NOTIFICACAO"'
      ', "CD_FICHA_SINVS" = :"CD_FICHA_SINVS"'
      ', "CD_INVESTIGADOR" = :"CD_INVESTIGADOR"'
      ', "DT_TESTE_TRIAGEM" = :"DT_TESTE_TRIAGEM"'
      ', "DT_TESTE_CONFIRMATORIO" = :"DT_TESTE_CONFIRMATORIO"'
      ', "NR_PROCESSO_UTENTE" = :"NR_PROCESSO_UTENTE"'
      ', "CD_UND" = :"CD_UND"'
      ', "DT_ENTRADA" = :"DT_ENTRADA"'
      ', "DT_EVOLUCAO_2" = :"DT_EVOLUCAO_2"'
      'where'
      '  "CD_FICHA" = :"OLD_CD_FICHA"')
    GeneratorField.Field = 'CD_UNIDADE'
    Left = 216
    Top = 443
    object TB_NOTIFICACAOCD_FICHA: TLargeintField
      FieldName = 'CD_FICHA'
      Origin = 'NOTIFICACAO.CD_FICHA'
      Required = True
    end
    object TB_NOTIFICACAOCD_UNIDADE: TIntegerField
      FieldName = 'CD_UNIDADE'
      Origin = 'NOTIFICACAO.CD_UNIDADE'
      Required = True
    end
    object TB_NOTIFICACAOCD_USUARIO: TIntegerField
      FieldName = 'CD_USUARIO'
      Origin = 'NOTIFICACAO.CD_USUARIO'
      Required = True
    end
    object TB_NOTIFICACAOCD_MUNICIPIO: TIntegerField
      FieldName = 'CD_MUNICIPIO'
      Origin = 'NOTIFICACAO.CD_MUNICIPIO'
      Required = True
    end
    object TB_NOTIFICACAOCD_UNIDADE_TRATAMENTO: TIntegerField
      FieldName = 'CD_UNIDADE_TRATAMENTO'
      Origin = 'NOTIFICACAO.CD_UNIDADE_TRATAMENTO'
    end
    object TB_NOTIFICACAOCD_MUNICIPIO_TRATAMENTO: TIntegerField
      FieldName = 'CD_MUNICIPIO_TRATAMENTO'
      Origin = 'NOTIFICACAO.CD_MUNICIPIO_TRATAMENTO'
    end
    object TB_NOTIFICACAOCD_PACIENTE: TIntegerField
      FieldName = 'CD_PACIENTE'
      Origin = 'NOTIFICACAO.CD_PACIENTE'
      Required = True
    end
    object TB_NOTIFICACAODT_NOTIFICACAO: TDateField
      FieldName = 'DT_NOTIFICACAO'
      Origin = 'NOTIFICACAO.DT_NOTIFICACAO'
      Required = True
    end
    object TB_NOTIFICACAODT_DIAGNOSTICO: TDateField
      FieldName = 'DT_DIAGNOSTICO'
      Origin = 'NOTIFICACAO.DT_DIAGNOSTICO'
      Required = True
    end
    object TB_NOTIFICACAOCD_RELACOES_SEXO: TSmallintField
      FieldName = 'CD_RELACOES_SEXO'
      Origin = 'NOTIFICACAO.CD_RELACOES_SEXO'
    end
    object TB_NOTIFICACAOCD_MAE_POSITIVO: TSmallintField
      FieldName = 'CD_MAE_POSITIVO'
      Origin = 'NOTIFICACAO.CD_MAE_POSITIVO'
    end
    object TB_NOTIFICACAOCD_USOU_DROGA: TSmallintField
      FieldName = 'CD_USOU_DROGA'
      Origin = 'NOTIFICACAO.CD_USOU_DROGA'
    end
    object TB_NOTIFICACAOCD_ACIDENTE_MAT_BIO: TSmallintField
      FieldName = 'CD_ACIDENTE_MAT_BIO'
      Origin = 'NOTIFICACAO.CD_ACIDENTE_MAT_BIO'
    end
    object TB_NOTIFICACAOSN_TRANSFUSAO_SANGUE: TIntegerField
      FieldName = 'SN_TRANSFUSAO_SANGUE'
      Origin = 'NOTIFICACAO.SN_TRANSFUSAO_SANGUE'
    end
    object TB_NOTIFICACAOSN_PERFURACAO: TIntegerField
      FieldName = 'SN_PERFURACAO'
      Origin = 'NOTIFICACAO.SN_PERFURACAO'
    end
    object TB_NOTIFICACAOSN_TRAT_DENTARIO: TIntegerField
      FieldName = 'SN_TRAT_DENTARIO'
      Origin = 'NOTIFICACAO.SN_TRAT_DENTARIO'
    end
    object TB_NOTIFICACAOSN_INTERV_CIRURGICA: TIntegerField
      FieldName = 'SN_INTERV_CIRURGICA'
      Origin = 'NOTIFICACAO.SN_INTERV_CIRURGICA'
    end
    object TB_NOTIFICACAOSN_CIRCUNCISAO: TIntegerField
      FieldName = 'SN_CIRCUNCISAO'
      Origin = 'NOTIFICACAO.SN_CIRCUNCISAO'
    end
    object TB_NOTIFICACAOCD_TESTE_TRIAGEM: TSmallintField
      FieldName = 'CD_TESTE_TRIAGEM'
      Origin = 'NOTIFICACAO.CD_TESTE_TRIAGEM'
      Required = True
    end
    object TB_NOTIFICACAODS_TESTE_TRIAGEM: TIBStringField
      FieldName = 'DS_TESTE_TRIAGEM'
      Origin = 'NOTIFICACAO.DS_TESTE_TRIAGEM'
      Size = 50
    end
    object TB_NOTIFICACAOCD_OCUPACAO: TSmallintField
      FieldName = 'CD_OCUPACAO'
      Origin = 'NOTIFICACAO.CD_OCUPACAO'
    end
    object TB_NOTIFICACAODS_OCUPACAO: TIBStringField
      FieldName = 'DS_OCUPACAO'
      Origin = 'NOTIFICACAO.DS_OCUPACAO'
      Size = 50
    end
    object TB_NOTIFICACAOCD_TESTE_CONFIRMATORIO: TSmallintField
      FieldName = 'CD_TESTE_CONFIRMATORIO'
      Origin = 'NOTIFICACAO.CD_TESTE_CONFIRMATORIO'
      Required = True
    end
    object TB_NOTIFICACAODS_TESTE_CONFIRMATORIO: TIBStringField
      FieldName = 'DS_TESTE_CONFIRMATORIO'
      Origin = 'NOTIFICACAO.DS_TESTE_CONFIRMATORIO'
      Size = 50
    end
    object TB_NOTIFICACAOCD_OMS: TSmallintField
      FieldName = 'CD_OMS'
      Origin = 'NOTIFICACAO.CD_OMS'
    end
    object TB_NOTIFICACAOCD_CD4: TIntegerField
      FieldName = 'CD_CD4'
      Origin = 'NOTIFICACAO.CD_CD4'
    end
    object TB_NOTIFICACAOCD_EVOLUCAO: TSmallintField
      FieldName = 'CD_EVOLUCAO'
      Origin = 'NOTIFICACAO.CD_EVOLUCAO'
    end
    object TB_NOTIFICACAODT_EVOLUCAO: TDateField
      FieldName = 'DT_EVOLUCAO'
      Origin = 'NOTIFICACAO.DT_EVOLUCAO'
    end
    object TB_NOTIFICACAODS_OBSERVACAO: TIBStringField
      FieldName = 'DS_OBSERVACAO'
      Origin = 'NOTIFICACAO.DS_OBSERVACAO'
      Size = 1000
    end
    object TB_NOTIFICACAOCD_NOTIFICACAO: TIntegerField
      FieldName = 'CD_NOTIFICACAO'
      Origin = 'NOTIFICACAO.CD_NOTIFICACAO'
      Required = True
    end
    object TB_NOTIFICACAOREGDUP: TIBStringField
      FieldName = 'REGDUP'
      Origin = 'NOTIFICACAO.REGDUP'
      FixedChar = True
      Size = 1
    end
    object TB_NOTIFICACAOCD_LOTE: TIntegerField
      FieldName = 'CD_LOTE'
      Origin = 'NOTIFICACAO.CD_LOTE'
    end
    object TB_NOTIFICACAONM_ENTREVISTADOR: TIBStringField
      FieldName = 'NM_ENTREVISTADOR'
      Origin = 'NOTIFICACAO.NM_ENTREVISTADOR'
      Size = 50
    end
    object TB_NOTIFICACAOTEL_ENTREVISTADOR: TIBStringField
      FieldName = 'TEL_ENTREVISTADOR'
      Origin = 'NOTIFICACAO.TEL_ENTREVISTADOR'
      Size = 10
    end
    object TB_NOTIFICACAOFUNCAO_ENTREVISTADOR: TIBStringField
      FieldName = 'FUNCAO_ENTREVISTADOR'
      Origin = 'NOTIFICACAO.FUNCAO_ENTREVISTADOR'
      Size = 50
    end
    object TB_NOTIFICACAONM_MEDICO: TIBStringField
      FieldName = 'NM_MEDICO'
      Origin = 'NOTIFICACAO.NM_MEDICO'
      Size = 50
    end
    object TB_NOTIFICACAOTEL_MEDICO: TIBStringField
      FieldName = 'TEL_MEDICO'
      Origin = 'NOTIFICACAO.TEL_MEDICO'
      Size = 10
    end
    object TB_NOTIFICACAOSN_TATUAGEM: TIntegerField
      FieldName = 'SN_TATUAGEM'
      Origin = 'NOTIFICACAO.SN_TATUAGEM'
    end
    object TB_NOTIFICACAOTP_ENTRADA: TIntegerField
      FieldName = 'TP_ENTRADA'
      Origin = 'NOTIFICACAO.TP_ENTRADA'
    end
    object TB_NOTIFICACAOEVIDENCIA_GESTANTE: TIntegerField
      FieldName = 'EVIDENCIA_GESTANTE'
      Origin = 'NOTIFICACAO.EVIDENCIA_GESTANTE'
    end
    object TB_NOTIFICACAOTB_ATUAL: TIntegerField
      FieldName = 'TB_ATUAL'
      Origin = 'NOTIFICACAO.TB_ATUAL'
    end
    object TB_NOTIFICACAOTB_ANTERIOR: TIntegerField
      FieldName = 'TB_ANTERIOR'
      Origin = 'NOTIFICACAO.TB_ANTERIOR'
    end
    object TB_NOTIFICACAODT_TRATAMENTO_TB: TDateField
      FieldName = 'DT_TRATAMENTO_TB'
      Origin = 'NOTIFICACAO.DT_TRATAMENTO_TB'
    end
    object TB_NOTIFICACAOCD_PROVINCIA_TRATAMENTO: TIntegerField
      FieldName = 'CD_PROVINCIA_TRATAMENTO'
      Origin = 'NOTIFICACAO.CD_PROVINCIA_TRATAMENTO'
    end
    object TB_NOTIFICACAOCD_PROVINCIA_NOT: TIntegerField
      FieldName = 'CD_PROVINCIA_NOT'
      Origin = 'NOTIFICACAO.CD_PROVINCIA_NOT'
    end
    object TB_NOTIFICACAODT_ALTERACAO: TDateTimeField
      FieldName = 'DT_ALTERACAO'
      Origin = 'NOTIFICACAO.DT_ALTERACAO'
    end
    object TB_NOTIFICACAODT_EXPORTACAO: TDateTimeField
      FieldName = 'DT_EXPORTACAO'
      Origin = 'NOTIFICACAO.DT_EXPORTACAO'
    end
    object TB_NOTIFICACAOCD_FICHA_ORACLE: TIntegerField
      FieldName = 'CD_FICHA_ORACLE'
      Origin = 'NOTIFICACAO.CD_FICHA_ORACLE'
    end
    object TB_NOTIFICACAONM_PACIENTE: TIBStringField
      FieldName = 'NM_PACIENTE'
      Origin = 'PACIENTE.NM_PACIENTE'
      Size = 50
    end
    object TB_NOTIFICACAODS_PROVINCIA_NOT: TIBStringField
      FieldName = 'DS_PROVINCIA_NOT'
      Size = 50
    end
    object TB_NOTIFICACAODS_MUNICIPIO_NOT: TIBStringField
      FieldName = 'DS_MUNICIPIO_NOT'
      Size = 50
    end
    object TB_NOTIFICACAODS_UNIDADE: TIBStringField
      FieldName = 'DS_UNIDADE'
      Size = 50
    end
    object TB_NOTIFICACAODS_PROVINCIA_TRATAMENTO: TIBStringField
      FieldName = 'DS_PROVINCIA_TRATAMENTO'
      Size = 50
    end
    object TB_NOTIFICACAODS_MUNICIPIO_TRATAMENTO: TIBStringField
      FieldName = 'DS_MUNICIPIO_TRATAMENTO'
      Size = 50
    end
    object TB_NOTIFICACAODS_UNIDADE_TRATAMENTO: TIBStringField
      FieldName = 'DS_UNIDADE_TRATAMENTO'
      Size = 50
    end
    object TB_NOTIFICACAONR_NOTIFICACAO: TIBStringField
      FieldName = 'NR_NOTIFICACAO'
      Origin = 'NOTIFICACAO.NR_NOTIFICACAO'
      Size = 10
    end
    object TB_NOTIFICACAOCD_MEDICO: TIntegerField
      FieldName = 'CD_MEDICO'
      Origin = 'NOTIFICACAO.CD_MEDICO'
    end
    object TB_NOTIFICACAOCD_INVESTIGADOR: TIntegerField
      FieldName = 'CD_INVESTIGADOR'
      Origin = 'NOTIFICACAO.CD_INVESTIGADOR'
    end
    object TB_NOTIFICACAOCD_FICHA_SINVS: TLargeintField
      FieldName = 'CD_FICHA_SINVS'
      Origin = 'NOTIFICACAO.CD_FICHA_SINVS'
    end
    object TB_NOTIFICACAODT_TESTE_TRIAGEM: TDateTimeField
      FieldName = 'DT_TESTE_TRIAGEM'
      Origin = 'NOTIFICACAO.DT_TESTE_TRIAGEM'
    end
    object TB_NOTIFICACAODT_TESTE_CONFIRMATORIO: TDateTimeField
      FieldName = 'DT_TESTE_CONFIRMATORIO'
      Origin = 'NOTIFICACAO.DT_TESTE_CONFIRMATORIO'
    end
    object TB_NOTIFICACAONR_PROCESSO_UTENTE: TIBStringField
      FieldName = 'NR_PROCESSO_UTENTE'
      Origin = 'NOTIFICACAO.NR_PROCESSO_UTENTE'
      Size = 30
    end
    object TB_NOTIFICACAOCD_UND: TIntegerField
      FieldName = 'CD_UND'
      Origin = 'NOTIFICACAO.CD_UND'
      Required = True
    end
    object TB_NOTIFICACAODT_ENTRADA: TDateField
      FieldName = 'DT_ENTRADA'
      Origin = 'NOTIFICACAO.DT_ENTRADA'
    end
    object TB_NOTIFICACAODT_EVOLUCAO_2: TDateField
      FieldName = 'DT_EVOLUCAO_2'
      Origin = 'NOTIFICACAO.DT_EVOLUCAO_2'
    end
  end
  object TB_PACIENTE: TIBDataSet
    Database = DM.DB
    Transaction = DM.TS
    AfterDelete = TB_PACIENTEAfterDelete
    AfterEdit = TB_PACIENTEAfterEdit
    AfterInsert = TB_PACIENTEAfterInsert
    AfterPost = TB_PACIENTEAfterPost
    AfterScroll = TB_PACIENTEAfterScroll
    BeforeCancel = TB_PACIENTEBeforeCancel
    BeforeDelete = TB_PACIENTEBeforeDelete
    BeforePost = TB_PACIENTEBeforePost
    BeforeScroll = TB_PACIENTEBeforeScroll
    OnDeleteError = TB_PARAMETRODeleteError
    OnEditError = TB_PARAMETROEditError
    OnPostError = TB_PARAMETROPostError
    OnUpdateError = TB_PARAMETROUpdateError
    BufferChunks = 1000
    CachedUpdates = False
    DeleteSQL.Strings = (
      'delete from "PACIENTE"'
      'where'
      '  "CD_PACIENTE" = :"OLD_CD_PACIENTE"')
    InsertSQL.Strings = (
      'insert into "PACIENTE"'
      '('
      '  "CD_PACIENTE"'
      ', "CD_BAIRRO"'
      ', "CD_PAIS"'
      ', "CD_MUNICIPIO"'
      ', "CD_MOR_MUNICIPIO"'
      ', "CD_PROVINCIA"'
      ', "CD_COMUNA"'
      ', "NM_PACIENTE"'
      ', "DT_NASCIMENTO"'
      ', "IDADE"'
      ', "NM_MAE"'
      ', "CD_MORADA_PERM"'
      ', "CD_ESCOLARIDADE"'
      ', "DS_ESCOLARIDADE"'
      ', "TP_SEXO"'
      ', "MESES"'
      ', "ESTADO_CIVIL"'
      ', "CD_NAR_PROVINCIA"'
      ', "CD_PACIENTE_ORACLE"'
      ', "CD_OCUPACAO"'
      ', "CD_DOCUMENTO"'
      ', "TP_DOCUMENTO"'
      ', "NR_DOCUMENTO"'
      ', "NR_TEL_1"'
      ', "NR_TEL_2"'
      ', "DS_ENDERECO"'
      ', "FL_GESTANTE"'
      ', "FL_NOTIFICACAO"'
      ', "NR_MESES_GESTANTE"'
      ', "FL_RESULTADO"'
      ', "CD_UND"'
      ', "CD_UNIDADE"'
      ', "NR_PROCESSO"'
      ', "FL_LAB"'
      ', "FL_CASONOVO"'
      ', "FL_TRANS"'
      ', "FL_OBITO"'
      ', "DT_OBITO"'
      ', "FL_CRIANCA_EXPOSTA"'
      ', "NR_PROCESSO_CRIANCA_EXP"'
      ', "CD_PACIENTE_MAE"'
      ', "DT_INICIO_CRIANCA_EXP"'
      ', "DT_FIM_CRIANCA_EXP"'
      ', "CD_DESFECHO_CRIANCA_EXP"'
      ')'
      'values'
      '('
      '  :"CD_PACIENTE"'
      ', :"CD_BAIRRO"'
      ', :"CD_PAIS"'
      ', :"CD_MUNICIPIO"'
      ', :"CD_MOR_MUNICIPIO"'
      ', :"CD_PROVINCIA"'
      ', :"CD_COMUNA"'
      ', :"NM_PACIENTE"'
      ', :"DT_NASCIMENTO"'
      ', :"IDADE"'
      ', :"NM_MAE"'
      ', :"CD_MORADA_PERM"'
      ', :"CD_ESCOLARIDADE"'
      ', :"DS_ESCOLARIDADE"'
      ', :"TP_SEXO"'
      ', :"MESES"'
      ', :"ESTADO_CIVIL"'
      ', :"CD_NAR_PROVINCIA"'
      ', :"CD_PACIENTE_ORACLE"'
      ', :"CD_OCUPACAO"'
      ', :"CD_DOCUMENTO"'
      ', :"TP_DOCUMENTO"'
      ', :"NR_DOCUMENTO"'
      ', :"NR_TEL_1"'
      ', :"NR_TEL_2"'
      ', :"DS_ENDERECO"'
      ', :"FL_GESTANTE"'
      ', :"FL_NOTIFICACAO"'
      ', :"NR_MESES_GESTANTE"'
      ', :"FL_RESULTADO"'
      ', :"CD_UND"'
      ', :"CD_UNIDADE"'
      ', :"NR_PROCESSO"'
      ', :"FL_LAB"'
      ', :"FL_CASONOVO"'
      ', :"FL_TRANS"'
      ', :"FL_OBITO"'
      ', :"DT_OBITO"'
      ', :"FL_CRIANCA_EXPOSTA"'
      ', :"NR_PROCESSO_CRIANCA_EXP"'
      ', :"CD_PACIENTE_MAE"'
      ', current_date'
      ', :"DT_FIM_CRIANCA_EXP"'
      ', :"CD_DESFECHO_CRIANCA_EXP"'
      ')')
    SelectSQL.Strings = (
      'select "PACIENTE"."CD_PACIENTE"'
      '      ,"PACIENTE"."CD_BAIRRO"'
      '      ,"PACIENTE"."CD_PAIS"'
      '      ,"PACIENTE"."CD_MUNICIPIO"'
      '      ,"PACIENTE"."CD_MOR_MUNICIPIO"'
      '      ,"PACIENTE"."CD_PROVINCIA"'
      '      ,"PACIENTE"."CD_COMUNA"'
      '      ,"PACIENTE"."NM_PACIENTE"'
      '      ,"PACIENTE"."DT_NASCIMENTO"'
      '      ,"PACIENTE"."IDADE"'
      '      ,"PACIENTE"."NM_MAE"'
      '      ,"PACIENTE"."CD_MORADA_PERM"'
      '      ,"PACIENTE"."CD_ESCOLARIDADE"'
      '      ,"PACIENTE"."DS_ESCOLARIDADE"'
      '      ,"PACIENTE"."TP_SEXO"'
      '      ,"PACIENTE"."MESES"'
      '      ,"PACIENTE"."ESTADO_CIVIL"'
      '      ,"PACIENTE"."CD_NAR_PROVINCIA"'
      '      ,"PACIENTE"."CD_PACIENTE_ORACLE"'
      '      ,"PACIENTE"."CD_OCUPACAO"'
      '      ,"PACIENTE"."CD_DOCUMENTO"'
      '      ,"PACIENTE"."TP_DOCUMENTO"'
      '      ,"PACIENTE"."NR_DOCUMENTO"'
      '      ,"PACIENTE"."NR_TEL_1"'
      '      ,"PACIENTE"."NR_TEL_2"'
      '      ,"PACIENTE"."DS_ENDERECO"'
      '      ,"PACIENTE"."FL_GESTANTE"'
      '      ,"PACIENTE"."FL_NOTIFICACAO"'
      '      ,"PACIENTE"."NR_MESES_GESTANTE"'
      '      ,"PACIENTE"."FL_RESULTADO"'
      '      ,"PACIENTE"."CD_UND"'
      '      ,"PACIENTE"."CD_UNIDADE"'
      '      ,"PACIENTE"."NR_PROCESSO"'
      '      , "PACIENTE"."FL_LAB"'
      '      , "PACIENTE"."FL_CASONOVO"'
      '      , "PACIENTE"."FL_TRANS"'
      '      , "PACIENTE"."FL_OBITO"'
      '      , "PACIENTE"."FL_CRIANCA_EXPOSTA"'
      '      , "PACIENTE"."NR_PROCESSO_CRIANCA_EXP"'
      '      , "PACIENTE"."CD_PACIENTE_MAE"'
      '      , "PACIENTE"."CD_DESFECHO_CRIANCA_EXP"'
      '      , "PACIENTE"."DT_INICIO_CRIANCA_EXP"'
      '      , "PACIENTE"."DT_FIM_CRIANCA_EXP"'
      '      , "PACIENTE"."DT_OBITO",'
      '(SELECT DS_PROVINCIA FROM PROVINCIA'
      'WHERE CD_PROVINCIA = PACIENTE.CD_PROVINCIA)DS_PROVINCIA,'
      '(SELECT DS_MUNICIPIO FROM MUNICIPIO'
      'WHERE CD_MUNICIPIO = PACIENTE.CD_MUNICIPIO)DS_MUNICIPIO,'
      '(SELECT DS_PAIS FROM PAIS'
      'WHERE CD_PAIS = PACIENTE.CD_PAIS)DS_PAIS,'
      '(SELECT DS_PROVINCIA FROM PROVINCIA'
      
        'WHERE CD_PROVINCIA = PACIENTE.CD_NAR_PROVINCIA)DS_PROVINCIA_MORA' +
        'DA,'
      '(SELECT DS_MUNICIPIO FROM MUNICIPIO'
      
        'WHERE CD_MUNICIPIO = PACIENTE.CD_MOR_MUNICIPIO)DS_MUNICIPIO_MORA' +
        'DA,'
      '(SELECT DS_OCUPACAO FROM OCUPACAO'
      ' WHERE CD_OCUPACAO = PACIENTE.CD_OCUPACAO'
      ' AND   CD_UND = PACIENTE.CD_UND)DS_OCUPACAO,'
      '(SELECT DS_UNIDADE FROM UNIDADE'
      'WHERE CD_UNIDADE = PACIENTE.CD_UNIDADE)DS_UNIDADE'
      'from "PACIENTE"'
      'where CD_PACIENTE = :CD_PACIENTE'
      'and CD_UND = :CD_UND'
      'order by'
      '"PACIENTE"."CD_PACIENTE"')
    ModifySQL.Strings = (
      'update "PACIENTE"'
      'set'
      ' "CD_PACIENTE" = :"CD_PACIENTE"'
      ', "CD_BAIRRO" = :"CD_BAIRRO"'
      ', "CD_PAIS" = :"CD_PAIS"'
      ', "CD_MUNICIPIO" = :"CD_MUNICIPIO"'
      ', "CD_MOR_MUNICIPIO" = :"CD_MOR_MUNICIPIO"'
      ', "CD_PROVINCIA" = :"CD_PROVINCIA"'
      ', "CD_COMUNA" = :"CD_COMUNA"'
      ', "NM_PACIENTE" = :"NM_PACIENTE"'
      ', "DT_NASCIMENTO" = :"DT_NASCIMENTO"'
      ', "IDADE" = :"IDADE"'
      ', "NM_MAE" = :"NM_MAE"'
      ', "CD_MORADA_PERM" = :"CD_MORADA_PERM"'
      ', "CD_ESCOLARIDADE" = :"CD_ESCOLARIDADE"'
      ', "DS_ESCOLARIDADE" = :"DS_ESCOLARIDADE"'
      ', "TP_SEXO" = :"TP_SEXO"'
      ', "MESES" = :"MESES"'
      ', "ESTADO_CIVIL" = :"ESTADO_CIVIL"'
      ', "CD_NAR_PROVINCIA" = :"CD_NAR_PROVINCIA"'
      ', "CD_PACIENTE_ORACLE" = :"CD_PACIENTE_ORACLE"'
      ', "CD_OCUPACAO" = :"CD_OCUPACAO"'
      ', "CD_DOCUMENTO" = :"CD_DOCUMENTO"'
      ', "TP_DOCUMENTO" = :"TP_DOCUMENTO"'
      ', "NR_DOCUMENTO" = :"NR_DOCUMENTO"'
      ', "NR_TEL_1" = :"NR_TEL_1"'
      ', "NR_TEL_2" = :"NR_TEL_2"'
      ', "DS_ENDERECO" = :"DS_ENDERECO"'
      ', "FL_GESTANTE" = :"FL_GESTANTE"'
      ', "FL_NOTIFICACAO" = :"FL_NOTIFICACAO"'
      ', "NR_MESES_GESTANTE" = :"NR_MESES_GESTANTE"'
      ', "FL_RESULTADO" = :"FL_RESULTADO"'
      ', "CD_UND" = :"CD_UND"'
      ', "CD_UNIDADE" = :"CD_UNIDADE"'
      ', "NR_PROCESSO" = :"NR_PROCESSO"'
      ', "FL_LAB" = :"FL_LAB"'
      ', "FL_CASONOVO" = :"FL_CASONOVO"'
      ', "FL_TRANS" = :"FL_TRANS"'
      ', "FL_OBITO" = :"FL_OBITO"'
      ', "DT_OBITO" = :"DT_OBITO"'
      ', "FL_CRIANCA_EXPOSTA" = :"FL_CRIANCA_EXPOSTA"'
      ', "NR_PROCESSO_CRIANCA_EXP" = :"NR_PROCESSO_CRIANCA_EXP"'
      ', "CD_PACIENTE_MAE" = :"CD_PACIENTE_MAE"'
      ', "DT_INICIO_CRIANCA_EXP" = :"DT_INICIO_CRIANCA_EXP"'
      ', "DT_FIM_CRIANCA_EXP" = :"DT_FIM_CRIANCA_EXP"'
      ', "CD_DESFECHO_CRIANCA_EXP" = :"CD_DESFECHO_CRIANCA_EXP"'
      'where'
      '  "CD_PACIENTE" = :"OLD_CD_PACIENTE"')
    GeneratorField.Field = 'CD_UNIDADE'
    Left = 216
    Top = 497
    object TB_PACIENTECD_PACIENTE: TIntegerField
      FieldName = 'CD_PACIENTE'
      Origin = 'PACIENTE.CD_PACIENTE'
      Required = True
    end
    object TB_PACIENTECD_BAIRRO: TIntegerField
      FieldName = 'CD_BAIRRO'
      Origin = 'PACIENTE.CD_BAIRRO'
    end
    object TB_PACIENTECD_PAIS: TIntegerField
      FieldName = 'CD_PAIS'
      Origin = 'PACIENTE.CD_PAIS'
    end
    object TB_PACIENTECD_MUNICIPIO: TIntegerField
      FieldName = 'CD_MUNICIPIO'
      Origin = 'PACIENTE.CD_MUNICIPIO'
    end
    object TB_PACIENTECD_MOR_MUNICIPIO: TIntegerField
      FieldName = 'CD_MOR_MUNICIPIO'
      Origin = 'PACIENTE.CD_MOR_MUNICIPIO'
    end
    object TB_PACIENTECD_PROVINCIA: TIntegerField
      FieldName = 'CD_PROVINCIA'
      Origin = 'PACIENTE.CD_PROVINCIA'
    end
    object TB_PACIENTECD_COMUNA: TIntegerField
      FieldName = 'CD_COMUNA'
      Origin = 'PACIENTE.CD_COMUNA'
    end
    object TB_PACIENTENM_PACIENTE: TIBStringField
      FieldName = 'NM_PACIENTE'
      Origin = 'PACIENTE.NM_PACIENTE'
      Required = True
      Size = 50
    end
    object TB_PACIENTEDT_NASCIMENTO: TDateField
      FieldName = 'DT_NASCIMENTO'
      Origin = 'PACIENTE.DT_NASCIMENTO'
      Required = True
    end
    object TB_PACIENTEIDADE: TSmallintField
      FieldName = 'IDADE'
      Origin = 'PACIENTE.IDADE'
      Required = True
    end
    object TB_PACIENTENM_MAE: TIBStringField
      FieldName = 'NM_MAE'
      Origin = 'PACIENTE.NM_MAE'
      Required = True
      Size = 50
    end
    object TB_PACIENTECD_MORADA_PERM: TIBStringField
      FieldName = 'CD_MORADA_PERM'
      Origin = 'PACIENTE.CD_MORADA_PERM'
      FixedChar = True
      Size = 1
    end
    object TB_PACIENTECD_ESCOLARIDADE: TSmallintField
      FieldName = 'CD_ESCOLARIDADE'
      Origin = 'PACIENTE.CD_ESCOLARIDADE'
    end
    object TB_PACIENTEDS_ESCOLARIDADE: TIBStringField
      FieldName = 'DS_ESCOLARIDADE'
      Origin = 'PACIENTE.DS_ESCOLARIDADE'
      Size = 50
    end
    object TB_PACIENTETP_SEXO: TIBStringField
      FieldName = 'TP_SEXO'
      Origin = 'PACIENTE.TP_SEXO'
      Required = True
      FixedChar = True
      Size = 1
    end
    object TB_PACIENTEMESES: TIntegerField
      FieldName = 'MESES'
      Origin = 'PACIENTE.MESES'
    end
    object TB_PACIENTEESTADO_CIVIL: TIntegerField
      FieldName = 'ESTADO_CIVIL'
      Origin = 'PACIENTE.ESTADO_CIVIL'
    end
    object TB_PACIENTECD_NAR_PROVINCIA: TIntegerField
      FieldName = 'CD_NAR_PROVINCIA'
      Origin = 'PACIENTE.CD_NAR_PROVINCIA'
    end
    object TB_PACIENTECD_PACIENTE_ORACLE: TIntegerField
      FieldName = 'CD_PACIENTE_ORACLE'
      Origin = 'PACIENTE.CD_PACIENTE_ORACLE'
    end
    object TB_PACIENTECD_OCUPACAO: TIntegerField
      FieldName = 'CD_OCUPACAO'
      Origin = 'PACIENTE.CD_OCUPACAO'
    end
    object TB_PACIENTECD_DOCUMENTO: TIntegerField
      FieldName = 'CD_DOCUMENTO'
      Origin = 'PACIENTE.CD_DOCUMENTO'
    end
    object TB_PACIENTETP_DOCUMENTO: TIBStringField
      FieldName = 'TP_DOCUMENTO'
      Origin = 'PACIENTE.TP_DOCUMENTO'
    end
    object TB_PACIENTENR_DOCUMENTO: TIBStringField
      FieldName = 'NR_DOCUMENTO'
      Origin = 'PACIENTE.NR_DOCUMENTO'
    end
    object TB_PACIENTENR_TEL_1: TIBStringField
      FieldName = 'NR_TEL_1'
      Origin = 'PACIENTE.NR_TEL_1'
    end
    object TB_PACIENTENR_TEL_2: TIBStringField
      FieldName = 'NR_TEL_2'
      Origin = 'PACIENTE.NR_TEL_2'
    end
    object TB_PACIENTEDS_ENDERECO: TIBStringField
      FieldName = 'DS_ENDERECO'
      Origin = 'PACIENTE.DS_ENDERECO'
      Size = 200
    end
    object TB_PACIENTEDS_PROVINCIA: TIBStringField
      FieldName = 'DS_PROVINCIA'
      Size = 50
    end
    object TB_PACIENTEDS_MUNICIPIO: TIBStringField
      FieldName = 'DS_MUNICIPIO'
      Size = 50
    end
    object TB_PACIENTEDS_PROVINCIA_MORADA: TIBStringField
      FieldName = 'DS_PROVINCIA_MORADA'
      Size = 50
    end
    object TB_PACIENTEDS_MUNICIPIO_MORADA: TIBStringField
      FieldName = 'DS_MUNICIPIO_MORADA'
      Size = 50
    end
    object TB_PACIENTEDS_OCUPACAO: TIBStringField
      FieldName = 'DS_OCUPACAO'
      Size = 50
    end
    object TB_PACIENTEDS_PAIS: TIBStringField
      FieldName = 'DS_PAIS'
      Size = 50
    end
    object TB_PACIENTEFL_GESTANTE: TIntegerField
      FieldName = 'FL_GESTANTE'
      Origin = 'PACIENTE.FL_GESTANTE'
    end
    object TB_PACIENTEFL_NOTIFICACAO: TIntegerField
      FieldName = 'FL_NOTIFICACAO'
      Origin = 'PACIENTE.FL_NOTIFICACAO'
    end
    object TB_PACIENTENR_MESES_GESTANTE: TIntegerField
      FieldName = 'NR_MESES_GESTANTE'
      Origin = 'PACIENTE.NR_MESES_GESTANTE'
    end
    object TB_PACIENTEFL_RESULTADO: TIBStringField
      FieldName = 'FL_RESULTADO'
      Origin = 'PACIENTE.FL_RESULTADO'
      FixedChar = True
      Size = 1
    end
    object TB_PACIENTECD_UND: TIntegerField
      FieldName = 'CD_UND'
      Origin = 'PACIENTE.CD_UND'
      Required = True
    end
    object TB_PACIENTEDS_UNIDADE: TIBStringField
      FieldName = 'DS_UNIDADE'
      Size = 50
    end
    object TB_PACIENTENR_PROCESSO: TIntegerField
      FieldName = 'NR_PROCESSO'
      Origin = 'PACIENTE.NR_PROCESSO'
    end
    object TB_PACIENTEFL_LAB: TIBStringField
      FieldName = 'FL_LAB'
      Origin = 'PACIENTE.FL_LAB'
      FixedChar = True
      Size = 1
    end
    object TB_PACIENTECD_UNIDADE: TIntegerField
      FieldName = 'CD_UNIDADE'
      Origin = 'PACIENTE.CD_UNIDADE'
    end
    object TB_PACIENTEFL_CASONOVO: TIBStringField
      FieldName = 'FL_CASONOVO'
      Origin = 'PACIENTE.FL_CASONOVO'
      FixedChar = True
      Size = 1
    end
    object TB_PACIENTEFL_TRANS: TIntegerField
      FieldName = 'FL_TRANS'
      Origin = 'PACIENTE.FL_TRANS'
    end
    object TB_PACIENTEFL_OBITO: TIntegerField
      FieldName = 'FL_OBITO'
      Origin = 'PACIENTE.FL_OBITO'
    end
    object TB_PACIENTEDT_OBITO: TDateTimeField
      FieldName = 'DT_OBITO'
      Origin = 'PACIENTE.DT_OBITO'
    end
    object TB_PACIENTEFL_CRIANCA_EXPOSTA: TIBStringField
      FieldName = 'FL_CRIANCA_EXPOSTA'
      Origin = 'PACIENTE.FL_CRIANCA_EXPOSTA'
      OnValidate = TB_PACIENTEFL_CRIANCA_EXPOSTAValidate
      FixedChar = True
      Size = 1
    end
    object TB_PACIENTENR_PROCESSO_CRIANCA_EXP: TIBStringField
      FieldName = 'NR_PROCESSO_CRIANCA_EXP'
      Origin = 'PACIENTE.NR_PROCESSO_CRIANCA_EXP'
      OnValidate = TB_PACIENTENR_PROCESSO_CRIANCA_EXPValidate
      Size = 15
    end
    object TB_PACIENTECD_PACIENTE_MAE: TIntegerField
      FieldName = 'CD_PACIENTE_MAE'
      Origin = 'PACIENTE.CD_PACIENTE_MAE'
    end
    object TB_PACIENTECD_DESFECHO_CRIANCA_EXP: TIntegerField
      FieldName = 'CD_DESFECHO_CRIANCA_EXP'
      Origin = 'PACIENTE.CD_DESFECHO_CRIANCA_EXP'
    end
    object TB_PACIENTEDT_INICIO_CRIANCA_EXP: TDateField
      FieldName = 'DT_INICIO_CRIANCA_EXP'
      Origin = 'PACIENTE.DT_INICIO_CRIANCA_EXP'
    end
    object TB_PACIENTEDT_FIM_CRIANCA_EXP: TDateField
      FieldName = 'DT_FIM_CRIANCA_EXP'
      Origin = 'PACIENTE.DT_FIM_CRIANCA_EXP'
    end
  end
  object TB_TRANSFUSAO: TIBDataSet
    Database = DM.DB
    Transaction = DM.TS
    AfterInsert = TB_TRANSFUSAOAfterInsert
    BeforeDelete = TB_TRANSFUSAOBeforeDelete
    OnDeleteError = TB_PARAMETRODeleteError
    OnEditError = TB_PARAMETROEditError
    OnPostError = TB_PARAMETROPostError
    OnUpdateError = TB_PARAMETROUpdateError
    BufferChunks = 1000
    CachedUpdates = False
    DeleteSQL.Strings = (
      'delete from "TRANSFUSAO"'
      'where'
      '  "CD_FICHA" = :"OLD_CD_FICHA" and '
      '  "CD_TRANSFUSAO" = :"OLD_CD_TRANSFUSAO"')
    InsertSQL.Strings = (
      'insert into "TRANSFUSAO"'
      '('
      '  "CD_FICHA"'
      ', "CD_TRANSFUSAO"'
      ', "DT_TRANSFUSAO"'
      ', "DS_TRANSFUSAO"'
      ', "CD_UND"'
      ')'
      'values'
      '('
      '  :"CD_FICHA"'
      ', :"CD_TRANSFUSAO"'
      ', :"DT_TRANSFUSAO"'
      ', :"DS_TRANSFUSAO"'
      ', :"CD_UND"'
      ')')
    SelectSQL.Strings = (
      'select "TRANSFUSAO"."CD_FICHA"'
      '      ,"TRANSFUSAO"."CD_TRANSFUSAO"'
      '      ,"TRANSFUSAO"."DT_TRANSFUSAO"'
      '      ,"TRANSFUSAO"."DS_TRANSFUSAO"'
      '      ,"TRANSFUSAO"."CD_UND"'
      'from "TRANSFUSAO"'
      'where "TRANSFUSAO"."CD_FICHA" = :CD_FICHA'
      '')
    ModifySQL.Strings = (
      'update "TRANSFUSAO"'
      'set'
      ' "CD_FICHA" = :"CD_FICHA"'
      ', "CD_TRANSFUSAO" = :"CD_TRANSFUSAO"'
      ', "DT_TRANSFUSAO" = :"DT_TRANSFUSAO"'
      ', "DS_TRANSFUSAO" = :"DS_TRANSFUSAO"'
      ', "CD_UND" = :"CD_UND"'
      'where'
      '  "CD_FICHA" = :"OLD_CD_FICHA" and '
      '  "CD_TRANSFUSAO" = :"OLD_CD_TRANSFUSAO"')
    GeneratorField.Field = 'CD_UNIDADE'
    Left = 352
    Top = 161
    object TB_TRANSFUSAOCD_FICHA: TLargeintField
      FieldName = 'CD_FICHA'
      Origin = 'TRANSFUSAO.CD_FICHA'
      Required = True
    end
    object TB_TRANSFUSAOCD_TRANSFUSAO: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'CD_TRANSFUSAO'
      Origin = 'TRANSFUSAO.CD_TRANSFUSAO'
      Required = True
    end
    object TB_TRANSFUSAODT_TRANSFUSAO: TDateField
      DisplayLabel = 'Data'
      FieldName = 'DT_TRANSFUSAO'
      Origin = 'TRANSFUSAO.DT_TRANSFUSAO'
      EditMask = '!99/99/0000;1;_'
    end
    object TB_TRANSFUSAODS_TRANSFUSAO: TIBStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'DS_TRANSFUSAO'
      Origin = 'TRANSFUSAO.DS_TRANSFUSAO'
      Size = 255
    end
    object TB_TRANSFUSAOCD_UND: TIntegerField
      FieldName = 'CD_UND'
      Origin = 'TRANSFUSAO.CD_UND'
      Required = True
    end
  end
  object TB_PERFURACAO: TIBDataSet
    Database = DM.DB
    Transaction = DM.TS
    AfterInsert = TB_PERFURACAOAfterInsert
    BeforeDelete = TB_PERFURACAOBeforeDelete
    OnDeleteError = TB_PARAMETRODeleteError
    OnEditError = TB_PARAMETROEditError
    OnPostError = TB_PARAMETROPostError
    OnUpdateError = TB_PARAMETROUpdateError
    BufferChunks = 1000
    CachedUpdates = False
    DeleteSQL.Strings = (
      'delete from "PERFURACAO"'
      'where'
      '  "CD_PERFURACAO" = :"OLD_CD_PERFURACAO" and '
      '  "CD_FICHA" = :"OLD_CD_FICHA"')
    InsertSQL.Strings = (
      'insert into "PERFURACAO"'
      '('
      '  "CD_PERFURACAO"'
      ', "CD_FICHA"'
      ', "DT_PERFURACAO"'
      ', "CD_UND"'
      ')'
      'values'
      '('
      '  :"CD_PERFURACAO"'
      ', :"CD_FICHA"'
      ', :"DT_PERFURACAO"'
      ', :"CD_UND"'
      ')')
    SelectSQL.Strings = (
      'select "PERFURACAO"."CD_PERFURACAO"'
      '      ,"PERFURACAO"."CD_FICHA"'
      '      ,"PERFURACAO"."DT_PERFURACAO"'
      '      ,"PERFURACAO"."CD_UND"'
      'from "PERFURACAO"'
      'where "PERFURACAO"."CD_FICHA" = :CD_FICHA')
    ModifySQL.Strings = (
      'update "PERFURACAO"'
      'set'
      ' "CD_PERFURACAO" = :"CD_PERFURACAO"'
      ', "CD_FICHA" = :"CD_FICHA"'
      ', "DT_PERFURACAO" = :"DT_PERFURACAO"'
      ', "CD_UND" = :"CD_UND"'
      'where'
      '  "CD_PERFURACAO" = :"OLD_CD_PERFURACAO" and '
      '  "CD_FICHA" = :"OLD_CD_FICHA"')
    GeneratorField.Field = 'CD_UNIDADE'
    Left = 360
    Top = 217
    object TB_PERFURACAOCD_PERFURACAO: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'CD_PERFURACAO'
      Origin = 'PERFURACAO.CD_PERFURACAO'
      Required = True
    end
    object TB_PERFURACAOCD_FICHA: TLargeintField
      FieldName = 'CD_FICHA'
      Origin = 'PERFURACAO.CD_FICHA'
      Required = True
    end
    object TB_PERFURACAODT_PERFURACAO: TDateField
      DisplayLabel = 'Data'
      FieldName = 'DT_PERFURACAO'
      Origin = 'PERFURACAO.DT_PERFURACAO'
      Required = True
      EditMask = '!99/99/0000;1;_'
    end
    object TB_PERFURACAOCD_UND: TIntegerField
      FieldName = 'CD_UND'
      Origin = 'PERFURACAO.CD_UND'
      Required = True
    end
  end
  object TB_TATUAGEM: TIBDataSet
    Database = DM.DB
    Transaction = DM.TS
    AfterInsert = TB_TATUAGEMAfterInsert
    BeforeDelete = TB_TATUAGEMBeforeDelete
    OnDeleteError = TB_PARAMETRODeleteError
    OnEditError = TB_PARAMETROEditError
    OnPostError = TB_PARAMETROPostError
    OnUpdateError = TB_PARAMETROUpdateError
    BufferChunks = 1000
    CachedUpdates = False
    DeleteSQL.Strings = (
      'delete from "TATUAGEM"'
      'where'
      '  "CD_TATUAGEM" = :"OLD_CD_TATUAGEM" and '
      '  "CD_FICHA" = :"OLD_CD_FICHA"')
    InsertSQL.Strings = (
      'insert into "TATUAGEM"'
      '('
      '  "CD_TATUAGEM"'
      ', "CD_FICHA"'
      ', "DT_TATUAGEM"'
      ', "CD_UND"'
      ')'
      'values'
      '('
      '  :"CD_TATUAGEM"'
      ', :"CD_FICHA"'
      ', :"DT_TATUAGEM"'
      ', :"CD_UND"'
      ')')
    SelectSQL.Strings = (
      'select "TATUAGEM"."CD_TATUAGEM"'
      '      ,"TATUAGEM"."CD_FICHA"'
      '      ,"TATUAGEM"."DT_TATUAGEM"'
      '      ,"TATUAGEM"."CD_UND"'
      'from "TATUAGEM"'
      'where "TATUAGEM"."CD_FICHA" = :CD_FICHA'
      '')
    ModifySQL.Strings = (
      'update "TATUAGEM"'
      'set'
      ' "CD_TATUAGEM" = :"CD_TATUAGEM"'
      ', "CD_FICHA" = :"CD_FICHA"'
      ', "DT_TATUAGEM" = :"DT_TATUAGEM"'
      ', "CD_UND" = :"CD_UND"'
      'where'
      '  "CD_TATUAGEM" = :"OLD_CD_TATUAGEM" and '
      '  "CD_FICHA" = :"OLD_CD_FICHA"')
    GeneratorField.Field = 'CD_UNIDADE'
    Left = 360
    Top = 273
    object TB_TATUAGEMCD_TATUAGEM: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'CD_TATUAGEM'
      Origin = 'TATUAGEM.CD_TATUAGEM'
      Required = True
    end
    object TB_TATUAGEMCD_FICHA: TLargeintField
      FieldName = 'CD_FICHA'
      Origin = 'TATUAGEM.CD_FICHA'
      Required = True
    end
    object TB_TATUAGEMDT_TATUAGEM: TDateField
      DisplayLabel = 'Data'
      FieldName = 'DT_TATUAGEM'
      Origin = 'TATUAGEM.DT_TATUAGEM'
      EditMask = '!99/99/0000;1;_'
    end
    object TB_TATUAGEMCD_UND: TIntegerField
      FieldName = 'CD_UND'
      Origin = 'TATUAGEM.CD_UND'
      Required = True
    end
  end
  object TB_AGENDA: TIBDataSet
    Database = DM.DB
    Transaction = DM.TS
    AfterInsert = TB_AGENDAAfterInsert
    AfterPost = TB_AGENDAAfterPost
    BeforeDelete = TB_AGENDABeforeDelete
    BeforePost = TB_AGENDABeforePost
    OnCalcFields = TB_AGENDACalcFields
    OnDeleteError = TB_PARAMETRODeleteError
    OnEditError = TB_PARAMETROEditError
    OnPostError = TB_PARAMETROPostError
    OnUpdateError = TB_PARAMETROUpdateError
    BufferChunks = 1000
    CachedUpdates = False
    DeleteSQL.Strings = (
      'delete from "AGENDA"'
      'where'
      '  "CD_AGENDA" = :"OLD_CD_AGENDA"')
    InsertSQL.Strings = (
      'insert into "AGENDA"'
      '('
      '  "CD_AGENDA"'
      ', "CD_UND"'
      ', "CD_PACIENTE"'
      ', "DT_AGENDA"'
      ', "CD_UNIDADE"'
      ', "FL_REMARCADO"'
      ', "FL_REALIZADO"'
      ', "TP_ESQUEMA"'
      ', "VL_CD4"'
      ', "CD_MEDICO"'
      ', "DT_REMARCACAO"'
      ', "DT_CONFIRMACAO"'
      ', "DS_ESQUEMA"'
      ', "FL_CONFIRMADO"'
      ', "FL_TRANSFERIDO"'
      ', "FL_ESQUEMA"'
      ', "FL_PARECER"'
      ', "CD_USU_INCLUSAO"'
      ', "DT_INCLUSAO"'
      ', "CD_USU_ALTERACAO"'
      ', "DT_ALTERACAO"'
      ', "FL_LAB"'
      ', "FL_RX"'
      ', "NR_LAB"'
      ', "FL_EXAME1"'
      ', "FL_EXAME2"'
      ', "FL_EXAME3"'
      ', "FL_EXAME4"'
      ', "FL_EXAME5"'
      ', "FL_EXAME6"'
      ', "DS_EXAME"'
      ', "CD_HISTORICO_PARECER"'
      ')'
      'values'
      '('
      '  :"CD_AGENDA"'
      ', :"CD_UND"'
      ', :"CD_PACIENTE"'
      ', :"DT_AGENDA"'
      ', :"CD_UNIDADE"'
      ', :"FL_REMARCADO"'
      ', :"FL_REALIZADO"'
      ', :"TP_ESQUEMA"'
      ', :"VL_CD4"'
      ', :"CD_MEDICO"'
      ', :"DT_REMARCACAO"'
      ', :"DT_CONFIRMACAO"'
      ', :"DS_ESQUEMA"'
      ', :"FL_CONFIRMADO"'
      ', :"FL_TRANSFERIDO"'
      ', :"FL_ESQUEMA"'
      ', :"FL_PARECER"'
      ', :"CD_USU_INCLUSAO"'
      ', :"DT_INCLUSAO"'
      ', :"CD_USU_ALTERACAO"'
      ', :"DT_ALTERACAO"'
      ', :"FL_LAB"'
      ', :"FL_RX"'
      ', :"NR_LAB"'
      ', :"FL_EXAME1"'
      ', :"FL_EXAME2"'
      ', :"FL_EXAME3"'
      ', :"FL_EXAME4"'
      ', :"FL_EXAME5"'
      ', :"FL_EXAME6"'
      ', :"DS_EXAME"'
      ', :"CD_HISTORICO_PARECER")')
    SelectSQL.Strings = (
      'select'
      '       "AGENDA"."CD_AGENDA"'
      '      ,"AGENDA"."CD_UND"'
      '      ,"AGENDA"."CD_PACIENTE"'
      '      ,"AGENDA"."DT_AGENDA"'
      '      ,"AGENDA"."CD_UNIDADE"'
      '      ,"AGENDA"."FL_REMARCADO"'
      '      ,"AGENDA"."FL_REALIZADO"'
      '      ,"AGENDA"."FL_CONFIRMADO"'
      '      ,"AGENDA"."FL_TRANSFERIDO"'
      '      ,"AGENDA"."TP_ESQUEMA"'
      '      ,"AGENDA"."VL_CD4"'
      '      ,"AGENDA"."CD_MEDICO"'
      '     ,"AGENDA"."DS_ESQUEMA"'
      '      ,"AGENDA"."DT_REMARCACAO"'
      '      ,"AGENDA"."DT_CONFIRMACAO"'
      '      ,"AGENDA"."FL_ESQUEMA"'
      '      ,"AGENDA"."FL_PARECER"'
      '      ,"AGENDA"."CD_USU_INCLUSAO"'
      '      ,"AGENDA"."DT_INCLUSAO"'
      '      ,"AGENDA"."CD_USU_ALTERACAO"'
      '      ,"AGENDA"."DT_ALTERACAO"'
      '      ,"AGENDA"."FL_LAB"'
      '      ,"AGENDA"."FL_RX"'
      '      ,"AGENDA"."NR_LAB"'
      '      ,"AGENDA".fl_exame1'
      '      ,"AGENDA".fl_exame2'
      '      ,"AGENDA".fl_exame3'
      '      ,"AGENDA".fl_exame4'
      '      ,"AGENDA".fl_exame5'
      '      ,"AGENDA".fl_exame6'
      '      ,"AGENDA".ds_exame'
      '      ,"AGENDA".CD_HISTORICO_PARECER'
      '       ,PACIENTE.NM_PACIENTE'
      '       ,PACIENTE.NR_PROCESSO'
      '       ,PACIENTE.NR_PROCESSO_CRIANCA_EXP'
      '       ,PACIENTE.TP_SEXO'
      '       ,PACIENTE.IDADE'
      '       ,PACIENTE.DT_NASCIMENTO'
      '       ,(PACIENTE.NR_TEL_1 || '#39' '#39' || PACIENTE.NR_TEL_2) NR_TEL'
      '      , UNIDADE.DS_UNIDADE'
      '      , MEDICO.NM_MEDICO'
      
        '      ,(SELECT FL_DIGITAL FROM PROCESSO WHERE PROCESSO.NR_PROCES' +
        'SO = PACIENTE.NR_PROCESSO)  DIGITAL'
      
        '      ,(select distinct DS_PROVINCIA from PROVINCIA p where p.CD' +
        '_PROVINCIA = PACIENTE.CD_PROVINCIA) DS_PROVINCIA'
      
        '      ,(select distinct DS_MUNICIPIO from MUNICIPIO m where m.CD' +
        '_MUNICIPIO = PACIENTE.CD_MUNICIPIO) DS_MUNICIPIO'
      'from AGENDA'
      '  inner join PACIENTE'
      '  on PACIENTE.CD_PACIENTE = AGENDA.CD_PACIENTE'
      ' and PACIENTE.CD_UND = AGENDA.CD_UND'
      '  inner join UNIDADE'
      '  on UNIDADE.CD_UNIDADE = AGENDA.CD_UNIDADE'
      '  inner join MEDICO'
      '  on MEDICO.CD_MEDICO = AGENDA.CD_MEDICO'
      
        'where ("AGENDA".DT_AGENDA >= :DT_DE and "AGENDA".DT_AGENDA < :DT' +
        '_ATE)'
      '/*MEDICO*/'
      'order by'
      '"AGENDA"."CD_AGENDA"')
    ModifySQL.Strings = (
      'update "AGENDA"'
      'set'
      ' "CD_AGENDA" = :"CD_AGENDA"'
      ', "CD_UND" = :"CD_UND"'
      ', "CD_PACIENTE" = :"CD_PACIENTE"'
      ', "DT_AGENDA" = :"DT_AGENDA"'
      ', "CD_UNIDADE" = :"CD_UNIDADE"'
      ', "FL_REMARCADO" = :"FL_REMARCADO"'
      ', "FL_REALIZADO" = :"FL_REALIZADO"'
      ', "TP_ESQUEMA" = :"TP_ESQUEMA"'
      ', "VL_CD4" = :"VL_CD4"'
      ', "CD_MEDICO" = :"CD_MEDICO"'
      ', "DT_REMARCACAO" = :"DT_REMARCACAO"'
      ', "DT_CONFIRMACAO" = :"DT_CONFIRMACAO"'
      ', "DS_ESQUEMA" = :"DS_ESQUEMA"'
      ', "FL_CONFIRMADO" = :"FL_CONFIRMADO"'
      ', "FL_TRANSFERIDO" = :"FL_TRANSFERIDO"'
      ', "FL_ESQUEMA" = :"FL_ESQUEMA"'
      ', "FL_PARECER" = :"FL_PARECER"'
      ', "CD_USU_INCLUSAO" = :"CD_USU_INCLUSAO"'
      ', "DT_INCLUSAO" = :"DT_INCLUSAO"'
      ', "CD_USU_ALTERACAO" = :"CD_USU_ALTERACAO"'
      ', "DT_ALTERACAO" = :"DT_ALTERACAO"'
      ', "FL_LAB" = :"FL_LAB"'
      ', "FL_RX" = :"FL_RX"'
      ', "NR_LAB" = :"NR_LAB"'
      ', "FL_EXAME1" = :"FL_EXAME1"'
      ', "FL_EXAME2" = :"FL_EXAME2"'
      ', "FL_EXAME3" = :"FL_EXAME3"'
      ', "FL_EXAME4" = :"FL_EXAME4"'
      ', "FL_EXAME5" = :"FL_EXAME5"'
      ', "FL_EXAME6" = :"FL_EXAME6"'
      ', "DS_EXAME" = :"DS_EXAME"'
      ', "CD_HISTORICO_PARECER" = :"CD_HISTORICO_PARECER"'
      'where'
      '  "CD_AGENDA" = :"OLD_CD_AGENDA"')
    Left = 361
    Top = 331
    object TB_AGENDACD_AGENDA: TIntegerField
      FieldName = 'CD_AGENDA'
      Origin = 'AGENDA.CD_AGENDA'
      Required = True
    end
    object TB_AGENDACD_UND: TIntegerField
      FieldName = 'CD_UND'
      Origin = 'AGENDA.CD_UND'
      Required = True
    end
    object TB_AGENDACD_PACIENTE: TIntegerField
      FieldName = 'CD_PACIENTE'
      Origin = 'AGENDA.CD_PACIENTE'
    end
    object TB_AGENDADT_AGENDA: TDateTimeField
      FieldName = 'DT_AGENDA'
      Origin = 'AGENDA.DT_AGENDA'
    end
    object TB_AGENDACD_UNIDADE: TIntegerField
      FieldName = 'CD_UNIDADE'
      Origin = 'AGENDA.CD_UNIDADE'
    end
    object TB_AGENDAFL_REMARCADO: TIntegerField
      FieldName = 'FL_REMARCADO'
      Origin = 'AGENDA.FL_REMARCADO'
    end
    object TB_AGENDAFL_REALIZADO: TIntegerField
      FieldName = 'FL_REALIZADO'
      Origin = 'AGENDA.FL_REALIZADO'
    end
    object TB_AGENDAFL_CONFIRMADO: TIntegerField
      FieldName = 'FL_CONFIRMADO'
      Origin = 'AGENDA.FL_CONFIRMADO'
      OnValidate = TB_AGENDAFL_CONFIRMADOValidate
    end
    object TB_AGENDAFL_TRANSFERIDO: TIntegerField
      FieldName = 'FL_TRANSFERIDO'
      Origin = 'AGENDA.FL_TRANSFERIDO'
    end
    object TB_AGENDATP_ESQUEMA: TIntegerField
      FieldName = 'TP_ESQUEMA'
      Origin = 'AGENDA.TP_ESQUEMA'
    end
    object TB_AGENDAVL_CD4: TIntegerField
      FieldName = 'VL_CD4'
      Origin = 'AGENDA.VL_CD4'
    end
    object TB_AGENDACD_MEDICO: TIntegerField
      FieldName = 'CD_MEDICO'
      Origin = 'AGENDA.CD_MEDICO'
    end
    object TB_AGENDADS_ESQUEMA: TIBStringField
      FieldName = 'DS_ESQUEMA'
      Origin = 'AGENDA.DS_ESQUEMA'
      Size = 30
    end
    object TB_AGENDADT_REMARCACAO: TDateTimeField
      FieldName = 'DT_REMARCACAO'
      Origin = 'AGENDA.DT_REMARCACAO'
    end
    object TB_AGENDADT_CONFIRMACAO: TDateTimeField
      FieldName = 'DT_CONFIRMACAO'
      Origin = 'AGENDA.DT_CONFIRMACAO'
    end
    object TB_AGENDAFL_ESQUEMA: TIntegerField
      FieldName = 'FL_ESQUEMA'
      Origin = 'AGENDA.FL_ESQUEMA'
    end
    object TB_AGENDAFL_PARECER: TIntegerField
      FieldName = 'FL_PARECER'
      Origin = 'AGENDA.FL_PARECER'
    end
    object TB_AGENDACD_USU_INCLUSAO: TIntegerField
      FieldName = 'CD_USU_INCLUSAO'
      Origin = 'AGENDA.CD_USU_INCLUSAO'
    end
    object TB_AGENDADT_INCLUSAO: TDateTimeField
      FieldName = 'DT_INCLUSAO'
      Origin = 'AGENDA.DT_INCLUSAO'
    end
    object TB_AGENDACD_USU_ALTERACAO: TIntegerField
      FieldName = 'CD_USU_ALTERACAO'
      Origin = 'AGENDA.CD_USU_ALTERACAO'
    end
    object TB_AGENDADT_ALTERACAO: TDateTimeField
      FieldName = 'DT_ALTERACAO'
      Origin = 'AGENDA.DT_ALTERACAO'
    end
    object TB_AGENDAFL_LAB: TIBStringField
      FieldName = 'FL_LAB'
      Origin = 'AGENDA.FL_LAB'
      FixedChar = True
      Size = 1
    end
    object TB_AGENDAFL_RX: TIBStringField
      FieldName = 'FL_RX'
      Origin = 'AGENDA.FL_RX'
      FixedChar = True
      Size = 1
    end
    object TB_AGENDANR_LAB: TIntegerField
      FieldName = 'NR_LAB'
      Origin = 'AGENDA.NR_LAB'
    end
    object TB_AGENDAFL_EXAME1: TIBStringField
      FieldName = 'FL_EXAME1'
      Origin = 'AGENDA.FL_EXAME1'
      FixedChar = True
      Size = 1
    end
    object TB_AGENDAFL_EXAME2: TIBStringField
      FieldName = 'FL_EXAME2'
      Origin = 'AGENDA.FL_EXAME2'
      FixedChar = True
      Size = 1
    end
    object TB_AGENDAFL_EXAME3: TIBStringField
      FieldName = 'FL_EXAME3'
      Origin = 'AGENDA.FL_EXAME3'
      FixedChar = True
      Size = 1
    end
    object TB_AGENDAFL_EXAME4: TIBStringField
      FieldName = 'FL_EXAME4'
      Origin = 'AGENDA.FL_EXAME4'
      FixedChar = True
      Size = 1
    end
    object TB_AGENDAFL_EXAME5: TIBStringField
      FieldName = 'FL_EXAME5'
      Origin = 'AGENDA.FL_EXAME5'
      FixedChar = True
      Size = 1
    end
    object TB_AGENDAFL_EXAME6: TIBStringField
      FieldName = 'FL_EXAME6'
      Origin = 'AGENDA.FL_EXAME6'
      FixedChar = True
      Size = 1
    end
    object TB_AGENDADS_EXAME: TIBStringField
      FieldName = 'DS_EXAME'
      Origin = 'AGENDA.DS_EXAME'
      Size = 200
    end
    object TB_AGENDACD_HISTORICO_PARECER: TIntegerField
      FieldName = 'CD_HISTORICO_PARECER'
      Origin = 'AGENDA.CD_HISTORICO_PARECER'
    end
    object TB_AGENDANM_PACIENTE: TIBStringField
      FieldName = 'NM_PACIENTE'
      Origin = 'PACIENTE.NM_PACIENTE'
      Size = 50
    end
    object TB_AGENDANR_PROCESSO: TIntegerField
      FieldName = 'NR_PROCESSO'
      Origin = 'PACIENTE.NR_PROCESSO'
    end
    object TB_AGENDATP_SEXO: TIBStringField
      FieldName = 'TP_SEXO'
      Origin = 'PACIENTE.TP_SEXO'
      FixedChar = True
      Size = 1
    end
    object TB_AGENDAIDADE: TSmallintField
      FieldName = 'IDADE'
      Origin = 'PACIENTE.IDADE'
    end
    object TB_AGENDADS_UNIDADE: TIBStringField
      FieldName = 'DS_UNIDADE'
      Origin = 'UNIDADE.DS_UNIDADE'
      Size = 50
    end
    object TB_AGENDANM_MEDICO: TIBStringField
      FieldName = 'NM_MEDICO'
      Origin = 'MEDICO.NM_MEDICO'
      Size = 50
    end
    object TB_AGENDADIGITAL: TIntegerField
      FieldName = 'DIGITAL'
    end
    object TB_AGENDADS_PROVINCIA: TIBStringField
      FieldName = 'DS_PROVINCIA'
      Size = 50
    end
    object TB_AGENDADS_MUNICIPIO: TIBStringField
      FieldName = 'DS_MUNICIPIO'
      Size = 50
    end
    object TB_AGENDACALC_STATUS: TStringField
      FieldKind = fkCalculated
      FieldName = 'CALC_STATUS'
      Size = 50
      Calculated = True
    end
    object TB_AGENDADS_CONFIRMADO: TStringField
      FieldKind = fkCalculated
      FieldName = 'DS_CONFIRMADO'
      Size = 3
      Calculated = True
    end
    object TB_AGENDADS_REALIZADO: TStringField
      FieldKind = fkCalculated
      FieldName = 'DS_REALIZADO'
      Size = 3
      Calculated = True
    end
    object TB_AGENDADS_REMARCADO: TStringField
      FieldKind = fkCalculated
      FieldName = 'DS_REMARCADO'
      Size = 3
      Calculated = True
    end
    object TB_AGENDADS_TRANSFERIDO: TStringField
      FieldKind = fkCalculated
      FieldName = 'DS_TRANSFERIDO'
      Size = 3
      Calculated = True
    end
    object TB_AGENDAFL_DIGITAL: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'FL_DIGITAL'
      Calculated = True
    end
    object TB_AGENDADT_NASCIMENTO: TDateField
      FieldName = 'DT_NASCIMENTO'
      Origin = 'PACIENTE.DT_NASCIMENTO'
    end
    object TB_AGENDANR_TEL: TIBStringField
      FieldName = 'NR_TEL'
      Size = 41
    end
    object TB_AGENDANR_PROCESSO_CRIANCA_EXP: TIBStringField
      FieldName = 'NR_PROCESSO_CRIANCA_EXP'
      Origin = 'PACIENTE.NR_PROCESSO_CRIANCA_EXP'
      Size = 15
    end
  end
  object qyPaciente: TIBQuery
    Database = DM.DB
    Transaction = DM.TS
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select CD_PACIENTE, NM_PACIENTE from PACIENTE')
    Left = 543
    Top = 408
    object qyPacienteCD_PACIENTE: TIntegerField
      FieldName = 'CD_PACIENTE'
      Origin = 'PACIENTE.CD_PACIENTE'
      Required = True
    end
    object qyPacienteNM_PACIENTE: TIBStringField
      FieldName = 'NM_PACIENTE'
      Origin = 'PACIENTE.NM_PACIENTE'
      Required = True
      Size = 50
    end
  end
  object TB_ABANDONO: TIBDataSet
    Database = DM.DB
    Transaction = DM.TS
    AfterDelete = TB_ABANDONOAfterDelete
    AfterInsert = TB_ABANDONOAfterInsert
    AfterPost = TB_ABANDONOAfterPost
    BeforeDelete = TB_ABANDONOBeforeDelete
    BufferChunks = 1000
    CachedUpdates = False
    DeleteSQL.Strings = (
      'delete from "ABANDONO_HIST"'
      'where'
      '  "CD_ABANDONO_HIST" = :"OLD_CD_ABANDONO_HIST"')
    InsertSQL.Strings = (
      'insert into "ABANDONO_HIST"'
      '('
      '  "CD_ABANDONO_HIST"'
      ', "DT_CONTATO"'
      ', "NM_RESP_CONTATO"'
      ', "TP_ABANDONO"'
      ', "DS_DETALHE_ABANDONO"'
      ', "FL_ENCONTRADO"'
      ', "NM_INFORMANTE"'
      ', "CD_PACIENTE"'
      ', "CD_UND"'
      ')'
      'values'
      '('
      '  :"CD_ABANDONO_HIST"'
      ', :"DT_CONTATO"'
      ', :"NM_RESP_CONTATO"'
      ', :"TP_ABANDONO"'
      ', :"DS_DETALHE_ABANDONO"'
      ', :"FL_ENCONTRADO"'
      ', :"NM_INFORMANTE"'
      ', :"CD_PACIENTE"'
      ', :"CD_UND"'
      ')')
    SelectSQL.Strings = (
      'select ABANDONO_HIST.*,'
      ' PACIENTE.NM_PACIENTE,'
      ' PACIENTE.NR_TEL_1,'
      ' PACIENTE.NR_TEL_2,'
      '(select DS_TIPO_ABANDONO from TIPO_ABANDONO'
      
        ' where CD_TIPO_ABANDONO = "ABANDONO_HIST"."TP_ABANDONO")DS_TIPO_' +
        'ABANDONO'
      'from ABANDONO_HIST'
      ' inner join PACIENTE'
      ' on PACIENTE.CD_PACIENTE = ABANDONO_HIST.CD_PACIENTE'
      ' and PACIENTE.CD_UND = ABANDONO_HIST.CD_UND'
      'WHERE CD_ABANDONO_HIST = :CD_ABANDONO_HIST')
    ModifySQL.Strings = (
      'update "ABANDONO_HIST"'
      'set'
      ' "CD_ABANDONO_HIST" = :"CD_ABANDONO_HIST"'
      ', "DT_CONTATO" = :"DT_CONTATO"'
      ', "NM_RESP_CONTATO" = :"NM_RESP_CONTATO"'
      ', "TP_ABANDONO" = :"TP_ABANDONO"'
      ', "DS_DETALHE_ABANDONO" = :"DS_DETALHE_ABANDONO"'
      ', "FL_ENCONTRADO" = :"FL_ENCONTRADO"'
      ', "NM_INFORMANTE" = :"NM_INFORMANTE"'
      ', "CD_PACIENTE" = :"CD_PACIENTE"'
      ', "CD_UND" = :"CD_UND"'
      'where'
      '  "CD_ABANDONO_HIST" = :"OLD_CD_ABANDONO_HIST"')
    GeneratorField.Field = 'CD_ABANDONO_HIST'
    GeneratorField.Generator = 'GEN_ABANDONO_HIST'
    Left = 361
    Top = 386
    object TB_ABANDONOCD_ABANDONO_HIST: TIntegerField
      FieldName = 'CD_ABANDONO_HIST'
      Origin = 'ABANDONO_HIST.CD_ABANDONO_HIST'
      Required = True
    end
    object TB_ABANDONOCD_UND: TIntegerField
      FieldName = 'CD_UND'
      Origin = 'ABANDONO_HIST.CD_UND'
      Required = True
    end
    object TB_ABANDONODT_CONTATO: TDateTimeField
      FieldName = 'DT_CONTATO'
      Origin = 'ABANDONO_HIST.DT_CONTATO'
    end
    object TB_ABANDONONM_RESP_CONTATO: TIBStringField
      FieldName = 'NM_RESP_CONTATO'
      Origin = 'ABANDONO_HIST.NM_RESP_CONTATO'
      Size = 50
    end
    object TB_ABANDONOTP_ABANDONO: TIntegerField
      FieldName = 'TP_ABANDONO'
      Origin = 'ABANDONO_HIST.TP_ABANDONO'
    end
    object TB_ABANDONODS_DETALHE_ABANDONO: TIBStringField
      FieldName = 'DS_DETALHE_ABANDONO'
      Origin = 'ABANDONO_HIST.DS_DETALHE_ABANDONO'
      Size = 500
    end
    object TB_ABANDONOFL_ENCONTRADO: TIntegerField
      FieldName = 'FL_ENCONTRADO'
      Origin = 'ABANDONO_HIST.FL_ENCONTRADO'
    end
    object TB_ABANDONONM_INFORMANTE: TIBStringField
      FieldName = 'NM_INFORMANTE'
      Origin = 'ABANDONO_HIST.NM_INFORMANTE'
      Size = 100
    end
    object TB_ABANDONOCD_PACIENTE: TIntegerField
      FieldName = 'CD_PACIENTE'
      Origin = 'ABANDONO_HIST.CD_PACIENTE'
    end
    object TB_ABANDONODT_EXP: TDateTimeField
      FieldName = 'DT_EXP'
      Origin = 'ABANDONO_HIST.DT_EXP'
    end
    object TB_ABANDONOCD_EDI: TIntegerField
      FieldName = 'CD_EDI'
      Origin = 'ABANDONO_HIST.CD_EDI'
    end
    object TB_ABANDONOCD_USU_INCLUSAO: TIntegerField
      FieldName = 'CD_USU_INCLUSAO'
      Origin = 'ABANDONO_HIST.CD_USU_INCLUSAO'
    end
    object TB_ABANDONODT_INCLUSAO: TDateTimeField
      FieldName = 'DT_INCLUSAO'
      Origin = 'ABANDONO_HIST.DT_INCLUSAO'
    end
    object TB_ABANDONOCD_USU_ALTERACAO: TIntegerField
      FieldName = 'CD_USU_ALTERACAO'
      Origin = 'ABANDONO_HIST.CD_USU_ALTERACAO'
    end
    object TB_ABANDONODT_ALTERACAO: TDateTimeField
      FieldName = 'DT_ALTERACAO'
      Origin = 'ABANDONO_HIST.DT_ALTERACAO'
    end
    object TB_ABANDONONM_PACIENTE: TIBStringField
      FieldName = 'NM_PACIENTE'
      Origin = 'PACIENTE.NM_PACIENTE'
      Required = True
      Size = 50
    end
    object TB_ABANDONONR_TEL_1: TIBStringField
      FieldName = 'NR_TEL_1'
      Origin = 'PACIENTE.NR_TEL_1'
    end
    object TB_ABANDONONR_TEL_2: TIBStringField
      FieldName = 'NR_TEL_2'
      Origin = 'PACIENTE.NR_TEL_2'
    end
    object TB_ABANDONODS_TIPO_ABANDONO: TIBStringField
      FieldName = 'DS_TIPO_ABANDONO'
      Size = 100
    end
  end
  object TB_ATV: TIBDataSet
    Database = DM.DB
    Transaction = DM.TS
    AfterInsert = TB_ATVAfterInsert
    BeforePost = TB_ATVBeforePost
    BufferChunks = 1000
    CachedUpdates = False
    DeleteSQL.Strings = (
      'delete from "REGISTRO_ATV"'
      'where  "REGISTRO_ATV"."CD_UNIDADE" = :CD_UNIDADE'
      'and      "REGISTRO_ATV"."CD_PROVINCIA" = :CD_PROVINCIA'
      'and      "REGISTRO_ATV"."CD_MUNICIPIO" = :CD_MUNICIPIO'
      'and      "REGISTRO_ATV"."VL_MESANO" = :VL_MESANO')
    InsertSQL.Strings = (
      'insert into "REGISTRO_ATV"'
      '('
      '  "CD_REGISTRO_ATV"'
      ', "CD_UND"'
      ', "DT_REGISTRO"'
      ', "CD_UNIDADE"'
      ', "CD_PROVINCIA"'
      ', "CD_MUNICIPIO"'
      ', "VL_MESANO"'
      ', "VL_ACONSELHADOS"'
      ', "VL_POSITIVOS"'
      ', "VL_NEGATIVOS"'
      ', "VL_INDETERMINADOS"'
      ', "ID_FAIXA_ETARIA"'
      ', "FL_SEXO"'
      ', "FL_GESTANTE"'
      ', "VL_X"'
      ', "VL_Y"'
      ', "CD_USU_INCLUSAO"'
      ', "DT_INCLUSAO"'
      ', "CD_USU_ALTERACAO"'
      ', "DT_ALTERACAO"'
      ', "CD_REGISTRO_GERAL"'
      ', "NM_USU"'
      ', "VL_VERSAO"'
      ')'
      'values'
      '('
      '  :"CD_REGISTRO_ATV"'
      ', :"CD_UND"'
      ', :"DT_REGISTRO"'
      ', :"CD_UNIDADE"'
      ', :"CD_PROVINCIA"'
      ', :"CD_MUNICIPIO"'
      ', :"VL_MESANO"'
      ', :"VL_ACONSELHADOS"'
      ', :"VL_POSITIVOS"'
      ', :"VL_NEGATIVOS"'
      ', :"VL_INDETERMINADOS"'
      ', :"ID_FAIXA_ETARIA"'
      ', :"FL_SEXO"'
      ', :"FL_GESTANTE"'
      ', :"VL_X"'
      ', :"VL_Y"'
      ', :"CD_USU_INCLUSAO"'
      ', :"DT_INCLUSAO"'
      ', :"CD_USU_ALTERACAO"'
      ', :"DT_ALTERACAO"'
      ', :"CD_REGISTRO_GERAL"'
      ', :"NM_USU"'
      ', :"VL_VERSAO"'
      ')')
    SelectSQL.Strings = (
      'select "REGISTRO_ATV"."CD_REGISTRO_ATV"'
      '      ,"REGISTRO_ATV"."DT_REGISTRO"'
      '      ,"REGISTRO_ATV"."CD_UNIDADE"'
      '      ,"REGISTRO_ATV"."CD_PROVINCIA"'
      '      ,"REGISTRO_ATV"."CD_MUNICIPIO"'
      '      ,"REGISTRO_ATV"."VL_MESANO"'
      '      ,"REGISTRO_ATV"."VL_ACONSELHADOS"'
      '      ,"REGISTRO_ATV"."VL_POSITIVOS"'
      '      ,"REGISTRO_ATV"."VL_NEGATIVOS"'
      '      ,"REGISTRO_ATV"."VL_INDETERMINADOS"'
      '      ,"REGISTRO_ATV"."ID_FAIXA_ETARIA"'
      '      ,"REGISTRO_ATV"."FL_SEXO"'
      '      ,"REGISTRO_ATV"."FL_GESTANTE"'
      '      ,"REGISTRO_ATV"."VL_X"'
      '      ,"REGISTRO_ATV"."VL_Y"'
      '      ,"REGISTRO_ATV"."CD_UND"'
      '      ,"REGISTRO_ATV"."CD_REGISTRO_GERAL"'
      '      ,"REGISTRO_ATV"."NM_USU"'
      '      ,"REGISTRO_ATV"."VL_VERSAO"'
      '      ,"REGISTRO_ATV"."CD_USU_INCLUSAO"'
      '      ,"REGISTRO_ATV"."DT_INCLUSAO"'
      '      ,"REGISTRO_ATV"."CD_USU_ALTERACAO"'
      '      ,"REGISTRO_ATV"."DT_ALTERACAO"'
      'from "REGISTRO_ATV"'
      'where  "REGISTRO_ATV"."CD_UNIDADE" = :CD_UNIDADE'
      'and      "REGISTRO_ATV"."CD_PROVINCIA" = :CD_PROVINCIA'
      'and      "REGISTRO_ATV"."CD_MUNICIPIO" = :CD_MUNICIPIO'
      'and      "REGISTRO_ATV"."VL_MESANO" = :VL_MESANO')
    ModifySQL.Strings = (
      'update "REGISTRO_ATV"'
      'set'
      ' "CD_REGISTRO_ATV" = :"CD_REGISTRO_ATV"'
      ', "CD_UND" = :"CD_UND"'
      ', "DT_REGISTRO" = :"DT_REGISTRO"'
      ', "CD_UNIDADE" = :"CD_UNIDADE"'
      ', "CD_PROVINCIA" = :"CD_PROVINCIA"'
      ', "CD_MUNICIPIO" = :"CD_MUNICIPIO"'
      ', "VL_MESANO" = :"VL_MESANO"'
      ', "VL_ACONSELHADOS" = :"VL_ACONSELHADOS"'
      ', "VL_POSITIVOS" = :"VL_POSITIVOS"'
      ', "VL_NEGATIVOS" = :"VL_NEGATIVOS"'
      ', "VL_INDETERMINADOS" = :"VL_INDETERMINADOS"'
      ', "ID_FAIXA_ETARIA" = :"ID_FAIXA_ETARIA"'
      ', "FL_SEXO" = :"FL_SEXO"'
      ', "FL_GESTANTE" = :"FL_GESTANTE"'
      ', "VL_X" = :"VL_X"'
      ', "VL_Y" = :"VL_Y"'
      ', "CD_USU_INCLUSAO" = :"CD_USU_INCLUSAO"'
      ', "DT_INCLUSAO" = :"DT_INCLUSAO"'
      ', "CD_USU_ALTERACAO" = :"CD_USU_ALTERACAO"'
      ', "DT_ALTERACAO" = :"DT_ALTERACAO"'
      ', "CD_REGISTRO_GERAL" = :"CD_REGISTRO_GERAL"'
      ', "NM_USU" = :"NM_USU"'
      ', "VL_VERSAO" = :"VL_VERSAO"'
      'where'
      '  "CD_REGISTRO_ATV" = :"OLD_CD_REGISTRO_ATV" and '
      '  "CD_UND" = :"OLD_CD_UND"')
    GeneratorField.Field = 'CD_REGISTRO_ATV'
    GeneratorField.Generator = 'GEN_REGISTRO_ATV'
    Left = 361
    Top = 442
    object TB_ATVCD_REGISTRO_ATV: TIntegerField
      FieldName = 'CD_REGISTRO_ATV'
      Origin = 'REGISTRO_ATV.CD_REGISTRO_ATV'
      Required = True
    end
    object TB_ATVDT_REGISTRO: TDateTimeField
      FieldName = 'DT_REGISTRO'
      Origin = 'REGISTRO_ATV.DT_REGISTRO'
    end
    object TB_ATVCD_UNIDADE: TIntegerField
      FieldName = 'CD_UNIDADE'
      Origin = 'REGISTRO_ATV.CD_UNIDADE'
      Required = True
    end
    object TB_ATVCD_PROVINCIA: TIntegerField
      FieldName = 'CD_PROVINCIA'
      Origin = 'REGISTRO_ATV.CD_PROVINCIA'
      Required = True
    end
    object TB_ATVCD_MUNICIPIO: TIntegerField
      FieldName = 'CD_MUNICIPIO'
      Origin = 'REGISTRO_ATV.CD_MUNICIPIO'
      Required = True
    end
    object TB_ATVVL_MESANO: TIBStringField
      FieldName = 'VL_MESANO'
      Origin = 'REGISTRO_ATV.VL_MESANO'
      Required = True
      Size = 8
    end
    object TB_ATVVL_ACONSELHADOS: TIntegerField
      FieldName = 'VL_ACONSELHADOS'
      Origin = 'REGISTRO_ATV.VL_ACONSELHADOS'
    end
    object TB_ATVVL_POSITIVOS: TIntegerField
      FieldName = 'VL_POSITIVOS'
      Origin = 'REGISTRO_ATV.VL_POSITIVOS'
    end
    object TB_ATVVL_NEGATIVOS: TIntegerField
      FieldName = 'VL_NEGATIVOS'
      Origin = 'REGISTRO_ATV.VL_NEGATIVOS'
    end
    object TB_ATVVL_INDETERMINADOS: TIntegerField
      FieldName = 'VL_INDETERMINADOS'
      Origin = 'REGISTRO_ATV.VL_INDETERMINADOS'
    end
    object TB_ATVID_FAIXA_ETARIA: TIntegerField
      FieldName = 'ID_FAIXA_ETARIA'
      Origin = 'REGISTRO_ATV.ID_FAIXA_ETARIA'
    end
    object TB_ATVFL_SEXO: TIBStringField
      FieldName = 'FL_SEXO'
      Origin = 'REGISTRO_ATV.FL_SEXO'
      FixedChar = True
      Size = 1
    end
    object TB_ATVFL_GESTANTE: TIntegerField
      FieldName = 'FL_GESTANTE'
      Origin = 'REGISTRO_ATV.FL_GESTANTE'
    end
    object TB_ATVVL_X: TIntegerField
      FieldName = 'VL_X'
      Origin = 'REGISTRO_ATV.VL_X'
    end
    object TB_ATVVL_Y: TIntegerField
      FieldName = 'VL_Y'
      Origin = 'REGISTRO_ATV.VL_Y'
    end
    object TB_ATVCD_UND: TIntegerField
      FieldName = 'CD_UND'
      Origin = 'REGISTRO_ATV.CD_UND'
      Required = True
    end
    object TB_ATVCD_REGISTRO_GERAL: TIntegerField
      FieldName = 'CD_REGISTRO_GERAL'
      Origin = 'REGISTRO_ATV.CD_REGISTRO_GERAL'
    end
    object TB_ATVNM_USU: TIBStringField
      FieldName = 'NM_USU'
      Origin = 'REGISTRO_ATV.NM_USU'
      Size = 50
    end
    object TB_ATVVL_VERSAO: TIBStringField
      FieldName = 'VL_VERSAO'
      Origin = 'REGISTRO_ATV.VL_VERSAO'
    end
    object TB_ATVCD_USU_INCLUSAO: TIntegerField
      FieldName = 'CD_USU_INCLUSAO'
      Origin = 'REGISTRO_ATV.CD_USU_INCLUSAO'
    end
    object TB_ATVDT_INCLUSAO: TDateTimeField
      FieldName = 'DT_INCLUSAO'
      Origin = 'REGISTRO_ATV.DT_INCLUSAO'
    end
    object TB_ATVCD_USU_ALTERACAO: TIntegerField
      FieldName = 'CD_USU_ALTERACAO'
      Origin = 'REGISTRO_ATV.CD_USU_ALTERACAO'
    end
    object TB_ATVDT_ALTERACAO: TDateTimeField
      FieldName = 'DT_ALTERACAO'
      Origin = 'REGISTRO_ATV.DT_ALTERACAO'
    end
  end
  object TB_OCUPACAO: TIBDataSet
    Database = DM.DB
    Transaction = DM.TS
    AfterDelete = TB_OCUPACAOAfterDelete
    AfterInsert = TB_OCUPACAOAfterInsert
    AfterPost = TB_OCUPACAOAfterPost
    BeforeDelete = TB_OCUPACAOBeforeDelete
    OnDeleteError = TB_PARAMETRODeleteError
    OnEditError = TB_PARAMETROEditError
    OnPostError = TB_PARAMETROPostError
    OnUpdateError = TB_PARAMETROUpdateError
    BufferChunks = 1000
    CachedUpdates = False
    DeleteSQL.Strings = (
      'delete from "OCUPACAO"'
      'where'
      '  "CD_OCUPACAO" = :"OLD_CD_OCUPACAO"')
    InsertSQL.Strings = (
      'insert into "OCUPACAO"'
      '('
      '  "CD_OCUPACAO"'
      ', "DS_OCUPACAO"'
      ', "CD_UND"'
      ')'
      'values'
      '('
      '  :"CD_OCUPACAO"'
      ', :"DS_OCUPACAO"'
      ', :"CD_UND"'
      ')')
    SelectSQL.Strings = (
      'select "OCUPACAO"."CD_OCUPACAO"'
      '      ,"OCUPACAO"."DS_OCUPACAO"'
      '      ,"OCUPACAO"."CD_UND"'
      'from "OCUPACAO"'
      'order by'
      '"OCUPACAO"."CD_OCUPACAO"')
    ModifySQL.Strings = (
      'update "OCUPACAO"'
      'set'
      ' "CD_OCUPACAO" = :"CD_OCUPACAO"'
      ', "DS_OCUPACAO" = :"DS_OCUPACAO"'
      ', "CD_UND" = :"CD_UND"'
      'where'
      '  "CD_OCUPACAO" = :"OLD_CD_OCUPACAO"')
    GeneratorField.Field = 'CD_UNIDADE'
    Left = 80
    Top = 521
    object TB_OCUPACAOCD_OCUPACAO: TIntegerField
      FieldName = 'CD_OCUPACAO'
      Origin = 'OCUPACAO.CD_OCUPACAO'
      Required = True
    end
    object TB_OCUPACAODS_OCUPACAO: TIBStringField
      FieldName = 'DS_OCUPACAO'
      Origin = 'OCUPACAO.DS_OCUPACAO'
      Size = 50
    end
    object TB_OCUPACAOCD_UND: TIntegerField
      FieldName = 'CD_UND'
      Origin = 'OCUPACAO.CD_UND'
      Required = True
    end
  end
  object TB_TIPO_DOCUMENTO: TIBDataSet
    Database = DM.DB
    Transaction = DM.TS
    AfterDelete = TB_TIPO_DOCUMENTOAfterDelete
    AfterInsert = TB_TIPO_DOCUMENTOAfterInsert
    AfterPost = TB_TIPO_DOCUMENTOAfterPost
    BeforeDelete = TB_TIPO_DOCUMENTOBeforeDelete
    OnDeleteError = TB_PARAMETRODeleteError
    OnEditError = TB_PARAMETROEditError
    OnPostError = TB_PARAMETROPostError
    OnUpdateError = TB_PARAMETROUpdateError
    BufferChunks = 1000
    CachedUpdates = False
    DeleteSQL.Strings = (
      'delete from "TIPO_DOCUMENTO"'
      'where'
      '  "CD_TIPO_DOCUMENTO" = :"OLD_CD_TIPO_DOCUMENTO"')
    InsertSQL.Strings = (
      'insert into "TIPO_DOCUMENTO"'
      '('
      '  "CD_TIPO_DOCUMENTO"'
      ', "DS_TIPO_DOCUMENTO"'
      ', "CD_UND"'
      ')'
      'values'
      '('
      '  :"CD_TIPO_DOCUMENTO"'
      ', :"DS_TIPO_DOCUMENTO"'
      ', :"CD_UND"'
      ')')
    SelectSQL.Strings = (
      'select "TIPO_DOCUMENTO"."CD_TIPO_DOCUMENTO"'
      '      ,"TIPO_DOCUMENTO"."DS_TIPO_DOCUMENTO"'
      '      ,"CD_UND"."CD_UND"'
      'from "TIPO_DOCUMENTO"'
      'order by'
      '"TIPO_DOCUMENTO"."CD_TIPO_DOCUMENTO"')
    ModifySQL.Strings = (
      'update "TIPO_DOCUMENTO"'
      'set'
      ' "CD_TIPO_DOCUMENTO" = :"CD_TIPO_DOCUMENTO"'
      ', "DS_TIPO_DOCUMENTO" = :"DS_TIPO_DOCUMENTO"'
      ', "CD_UND" = :"CD_UND"'
      'where'
      '  "CD_TIPO_DOCUMENTO" = :"OLD_CD_TIPO_DOCUMENTO"')
    GeneratorField.Field = 'CD_UNIDADE'
    Left = 80
    Top = 569
    object TB_TIPO_DOCUMENTOCD_TIPO_DOCUMENTO: TIntegerField
      FieldName = 'CD_TIPO_DOCUMENTO'
      Origin = 'TIPO_DOCUMENTO.CD_TIPO_DOCUMENTO'
      Required = True
    end
    object TB_TIPO_DOCUMENTODS_TIPO_DOCUMENTO: TIBStringField
      FieldName = 'DS_TIPO_DOCUMENTO'
      Origin = 'TIPO_DOCUMENTO.DS_TIPO_DOCUMENTO'
    end
  end
  object TB_MEDICO: TIBDataSet
    Database = DM.DB
    Transaction = DM.TS
    AfterDelete = TB_MEDICOAfterDelete
    AfterInsert = TB_MEDICOAfterInsert
    AfterPost = TB_MEDICOAfterPost
    BeforeDelete = TB_MEDICOBeforeDelete
    OnDeleteError = TB_PARAMETRODeleteError
    OnEditError = TB_PARAMETROEditError
    OnPostError = TB_PARAMETROPostError
    OnUpdateError = TB_PARAMETROUpdateError
    BufferChunks = 1000
    CachedUpdates = False
    DeleteSQL.Strings = (
      'delete from "MEDICO"'
      'where'
      '  "CD_MEDICO" = :"OLD_CD_MEDICO"')
    InsertSQL.Strings = (
      'insert into "MEDICO"'
      '('
      '  "CD_MEDICO"'
      ', "NM_MEDICO"'
      ', "NR_TELEFONE"'
      ', "CD_UND"'
      ', "FL_ATIVO"'
      ', "DT_ATIVO"'
      ', "NR_ATENDIMENTO"'
      ')'
      'values'
      '('
      '  :"CD_MEDICO"'
      ', :"NM_MEDICO"'
      ', :"NR_TELEFONE"'
      ', :"CD_UND"'
      ', :"FL_ATIVO"'
      ', :"DT_ATIVO"'
      ', :"NR_ATENDIMENTO"'
      ')')
    SelectSQL.Strings = (
      'select "MEDICO"."CD_MEDICO"'
      '      ,"MEDICO"."NM_MEDICO"'
      '      ,"MEDICO"."NR_TELEFONE"'
      '      ,"MEDICO"."CD_UND"'
      '      ,"MEDICO"."FL_ATIVO"'
      '      ,"MEDICO"."DT_ATIVO"'
      '      ,"MEDICO"."NR_ATENDIMENTO"'
      'from "MEDICO"'
      'order by'
      '"MEDICO"."CD_MEDICO"')
    ModifySQL.Strings = (
      'update "MEDICO"'
      'set'
      ' "CD_MEDICO" = :"CD_MEDICO"'
      ', "NM_MEDICO" = :"NM_MEDICO"'
      ', "NR_TELEFONE" = :"NR_TELEFONE"'
      ', "CD_UND" = :"CD_UND"'
      ', "FL_ATIVO" = :"FL_ATIVO"'
      ', "DT_ATIVO" = :"DT_ATIVO"'
      ', "NR_ATENDIMENTO" = :"NR_ATENDIMENTO"'
      'where'
      '  "CD_MEDICO" = :"OLD_CD_MEDICO"')
    GeneratorField.Field = 'CD_UNIDADE'
    Left = 216
    Top = 553
    object TB_MEDICOCD_MEDICO: TIntegerField
      FieldName = 'CD_MEDICO'
      Origin = 'MEDICO.CD_MEDICO'
      Required = True
    end
    object TB_MEDICONM_MEDICO: TIBStringField
      FieldName = 'NM_MEDICO'
      Origin = 'MEDICO.NM_MEDICO'
      Size = 50
    end
    object TB_MEDICONR_TELEFONE: TIBStringField
      FieldName = 'NR_TELEFONE'
      Origin = 'MEDICO.NR_TELEFONE'
    end
    object TB_MEDICOCD_UND: TIntegerField
      FieldName = 'CD_UND'
      Origin = 'MEDICO.CD_UND'
      Required = True
    end
    object TB_MEDICOFL_ATIVO: TIntegerField
      FieldName = 'FL_ATIVO'
      Origin = 'MEDICO.FL_ATIVO'
    end
    object TB_MEDICODT_ATIVO: TDateTimeField
      FieldName = 'DT_ATIVO'
      Origin = 'MEDICO.DT_ATIVO'
    end
    object TB_MEDICONR_ATENDIMENTO: TIntegerField
      FieldName = 'NR_ATENDIMENTO'
      Origin = 'MEDICO.NR_ATENDIMENTO'
    end
  end
  object qyParametro: TIBQuery
    Database = DM.DB
    Transaction = DM.TS
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select * from PARAMETRO'
      'where CD_PARAMETRO =:CD_PARAMETRO')
    Left = 616
    Top = 403
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'CD_PARAMETRO'
        ParamType = ptUnknown
      end>
    object qyParametroCD_PARAMETRO: TIntegerField
      FieldName = 'CD_PARAMETRO'
      Origin = 'PARAMETRO.CD_PARAMETRO'
      Required = True
    end
    object qyParametroDS_PARAMETRO: TIBStringField
      FieldName = 'DS_PARAMETRO'
      Origin = 'PARAMETRO.DS_PARAMETRO'
      Required = True
      Size = 50
    end
    object qyParametroVALOR: TIBStringField
      FieldName = 'VALOR'
      Origin = 'PARAMETRO.VALOR'
      Size = 50
    end
  end
  object TB_INTERV_CIRURGICA: TIBDataSet
    Database = DM.DB
    Transaction = DM.TS
    AfterInsert = TB_INTERV_CIRURGICAAfterInsert
    BeforeDelete = TB_INTERV_CIRURGICABeforeDelete
    BufferChunks = 1000
    CachedUpdates = False
    DeleteSQL.Strings = (
      'delete from "INTERV_CIRURGICA"'
      'where'
      '  "CD_INTERV_CIRURGICA" = :"OLD_CD_INTERV_CIRURGICA" and '
      '  "CD_FICHA" = :"OLD_CD_FICHA"')
    InsertSQL.Strings = (
      'insert into "INTERV_CIRURGICA"'
      '('
      '  "CD_INTERV_CIRURGICA"'
      ', "CD_FICHA"'
      ', "DT_CIRURGIA"'
      ', "CD_UND"'
      ')'
      'values'
      '('
      '  :"CD_INTERV_CIRURGICA"'
      ', :"CD_FICHA"'
      ', :"DT_CIRURGIA"'
      ', :"CD_UND"'
      ')')
    SelectSQL.Strings = (
      'select "INTERV_CIRURGICA"."CD_INTERV_CIRURGICA"'
      '      ,"INTERV_CIRURGICA"."CD_FICHA"'
      '      ,"INTERV_CIRURGICA"."DT_CIRURGIA"'
      '      ,"INTERV_CIRURGICA"."CD_UND"'
      'from "INTERV_CIRURGICA"'
      'where "INTERV_CIRURGICA"."CD_FICHA" = :CD_FICHA')
    ModifySQL.Strings = (
      'update "INTERV_CIRURGICA"'
      'set'
      ' "CD_INTERV_CIRURGICA" = :"CD_INTERV_CIRURGICA"'
      ', "CD_FICHA" = :"CD_FICHA"'
      ', "DT_CIRURGIA" = :"DT_CIRURGIA"'
      ', "CD_UND" = :"CD_UND"'
      'where'
      '  "CD_INTERV_CIRURGICA" = :"OLD_CD_INTERV_CIRURGICA" and '
      '  "CD_FICHA" = :"OLD_CD_FICHA"')
    GeneratorField.Field = 'CD_UNIDADE'
    Left = 456
    Top = 321
    object TB_INTERV_CIRURGICACD_INTERV_CIRURGICA: TIntegerField
      FieldName = 'CD_INTERV_CIRURGICA'
      Origin = 'INTERV_CIRURGICA.CD_INTERV_CIRURGICA'
      Required = True
    end
    object TB_INTERV_CIRURGICACD_FICHA: TLargeintField
      FieldName = 'CD_FICHA'
      Origin = 'INTERV_CIRURGICA.CD_FICHA'
      Required = True
    end
    object TB_INTERV_CIRURGICADT_CIRURGIA: TDateField
      FieldName = 'DT_CIRURGIA'
      Origin = 'INTERV_CIRURGICA.DT_CIRURGIA'
      Required = True
    end
    object TB_INTERV_CIRURGICACD_UND: TIntegerField
      FieldName = 'CD_UND'
      Origin = 'INTERV_CIRURGICA.CD_UND'
      Required = True
    end
  end
  object TB_DENTARIO: TIBDataSet
    Database = DM.DB
    Transaction = DM.TS
    AfterInsert = TB_DENTARIOAfterInsert
    BeforeDelete = TB_DENTARIOBeforeDelete
    BufferChunks = 1000
    CachedUpdates = False
    DeleteSQL.Strings = (
      'delete from "DENTARIO"'
      'where'
      '  "CD_DENTARIO" = :"OLD_CD_DENTARIO" and '
      '  "CD_FICHA" = :"OLD_CD_FICHA"')
    InsertSQL.Strings = (
      'insert into "DENTARIO"'
      '('
      '  "CD_DENTARIO"'
      ', "CD_FICHA"'
      ', "DT_DENTARIO"'
      ', "CD_UND"'
      ')'
      'values'
      '('
      '  :"CD_DENTARIO"'
      ', :"CD_FICHA"'
      ', :"DT_DENTARIO"'
      ', :"CD_UND"'
      ')')
    SelectSQL.Strings = (
      'select "DENTARIO"."CD_DENTARIO"'
      '      ,"DENTARIO"."CD_FICHA"'
      '      ,"DENTARIO"."DT_DENTARIO"'
      '      ,"DENTARIO"."CD_UND"'
      'from "DENTARIO"'
      'where "DENTARIO"."CD_FICHA" = :CD_FICHA')
    ModifySQL.Strings = (
      'update "DENTARIO"'
      'set'
      ' "CD_DENTARIO" = :"CD_DENTARIO"'
      ', "CD_FICHA" = :"CD_FICHA"'
      ', "DT_DENTARIO" = :"DT_DENTARIO"'
      ', "CD_UND" = :"CD_UND"'
      'where'
      '  "CD_DENTARIO" = :"OLD_CD_DENTARIO" and '
      '  "CD_FICHA" = :"OLD_CD_FICHA"')
    GeneratorField.Field = 'CD_UNIDADE'
    Left = 464
    Top = 161
    object TB_DENTARIOCD_DENTARIO: TIntegerField
      FieldName = 'CD_DENTARIO'
      Origin = 'DENTARIO.CD_DENTARIO'
      Required = True
    end
    object TB_DENTARIOCD_FICHA: TLargeintField
      FieldName = 'CD_FICHA'
      Origin = 'DENTARIO.CD_FICHA'
      Required = True
    end
    object TB_DENTARIODT_DENTARIO: TDateField
      FieldName = 'DT_DENTARIO'
      Origin = 'DENTARIO.DT_DENTARIO'
      Required = True
    end
    object TB_DENTARIOCD_UND: TIntegerField
      FieldName = 'CD_UND'
      Origin = 'DENTARIO.CD_UND'
      Required = True
    end
  end
  object TB_CIRCUNCISAO: TIBDataSet
    Database = DM.DB
    Transaction = DM.TS
    AfterInsert = TB_CIRCUNCISAOAfterInsert
    BeforeDelete = TB_CIRCUNCISAOBeforeDelete
    BufferChunks = 1000
    CachedUpdates = False
    DeleteSQL.Strings = (
      'delete from "CIRCUNCISAO"'
      'where'
      '  "CD_CIRCUNCISAO" = :"OLD_CD_CIRCUNCISAO" and '
      '  "CD_FICHA" = :"OLD_CD_FICHA"')
    InsertSQL.Strings = (
      'insert into "CIRCUNCISAO"'
      '('
      '  "CD_CIRCUNCISAO"'
      ', "CD_FICHA"'
      ', "DT_CIRCUNCISAO"'
      ', "CD_UND"'
      ')'
      'values'
      '('
      '  :"CD_CIRCUNCISAO"'
      ', :"CD_FICHA"'
      ', :"DT_CIRCUNCISAO"'
      ', :"CD_UND"'
      ')')
    SelectSQL.Strings = (
      'select "CIRCUNCISAO"."CD_CIRCUNCISAO"'
      '      ,"CIRCUNCISAO"."CD_FICHA"'
      '      ,"CIRCUNCISAO"."DT_CIRCUNCISAO"'
      '      ,"CIRCUNCISAO"."CD_UND"'
      'from "CIRCUNCISAO"'
      'where "CIRCUNCISAO"."CD_FICHA" = :CD_FICHA')
    ModifySQL.Strings = (
      'update "CIRCUNCISAO"'
      'set'
      ' "CD_CIRCUNCISAO" = :"CD_CIRCUNCISAO"'
      ', "CD_FICHA" = :"CD_FICHA"'
      ', "DT_CIRCUNCISAO" = :"DT_CIRCUNCISAO"'
      ', "CD_UND" = :"CD_UND"'
      'where'
      '  "CD_CIRCUNCISAO" = :"OLD_CD_CIRCUNCISAO" and '
      '  "CD_FICHA" = :"OLD_CD_FICHA"')
    GeneratorField.Field = 'CD_UNIDADE'
    Left = 456
    Top = 273
    object TB_CIRCUNCISAOCD_CIRCUNCISAO: TIntegerField
      FieldName = 'CD_CIRCUNCISAO'
      Origin = 'CIRCUNCISAO.CD_CIRCUNCISAO'
      Required = True
    end
    object TB_CIRCUNCISAOCD_FICHA: TLargeintField
      FieldName = 'CD_FICHA'
      Origin = 'CIRCUNCISAO.CD_FICHA'
      Required = True
    end
    object TB_CIRCUNCISAODT_CIRCUNCISAO: TDateField
      FieldName = 'DT_CIRCUNCISAO'
      Origin = 'CIRCUNCISAO.DT_CIRCUNCISAO'
      Required = True
    end
    object TB_CIRCUNCISAOCD_UND: TIntegerField
      FieldName = 'CD_UND'
      Origin = 'CIRCUNCISAO.CD_UND'
      Required = True
    end
  end
  object TB_PARAMETRO: TIBDataSet
    Database = DM.DB
    Transaction = DM.TS
    AfterDelete = TB_PARAMETROAfterDelete
    AfterInsert = TB_PARAMETROAfterInsert
    AfterPost = TB_PARAMETROAfterPost
    BeforeDelete = TB_PARAMETROBeforeDelete
    OnDeleteError = TB_PARAMETRODeleteError
    OnEditError = TB_PARAMETROEditError
    OnPostError = TB_PARAMETROPostError
    OnUpdateError = TB_PARAMETROUpdateError
    BufferChunks = 1000
    CachedUpdates = False
    DeleteSQL.Strings = (
      'delete from "PARAMETRO"'
      'where'
      '  "CD_PARAMETRO" = :"OLD_CD_PARAMETRO"')
    InsertSQL.Strings = (
      'insert into "PARAMETRO"'
      '('
      '  "CD_PARAMETRO"'
      ', "CD_UND"'
      ', "DS_PARAMETRO"'
      ', "VALOR"'
      ')'
      'values'
      '('
      '  :"CD_PARAMETRO"'
      ', :"CD_UND"'
      ', :"DS_PARAMETRO"'
      ', :"VALOR"'
      ')')
    SelectSQL.Strings = (
      'select "PARAMETRO"."CD_PARAMETRO"'
      '      ,"PARAMETRO"."DS_PARAMETRO"'
      '      ,"PARAMETRO"."VALOR"'
      '      ,"PARAMETRO"."CD_UND"'
      'from "PARAMETRO"'
      'order by'
      '"PARAMETRO"."CD_PARAMETRO"')
    ModifySQL.Strings = (
      'update "PARAMETRO"'
      'set'
      ' "CD_PARAMETRO" = :"CD_PARAMETRO"'
      ', "DS_PARAMETRO" = :"DS_PARAMETRO"'
      ', "VALOR" = :"VALOR"'
      ', "CD_UND" = :"CD_UND"'
      'where'
      '  "CD_PARAMETRO" = :"OLD_CD_PARAMETRO"')
    Left = 360
    Top = 499
    object TB_PARAMETROCD_PARAMETRO: TIntegerField
      FieldName = 'CD_PARAMETRO'
      Origin = 'PARAMETRO.CD_PARAMETRO'
      Required = True
    end
    object TB_PARAMETRODS_PARAMETRO: TIBStringField
      FieldName = 'DS_PARAMETRO'
      Origin = 'PARAMETRO.DS_PARAMETRO'
      Required = True
      Size = 50
    end
    object TB_PARAMETROVALOR: TIBStringField
      FieldName = 'VALOR'
      Origin = 'PARAMETRO.VALOR'
      Size = 200
    end
    object TB_PARAMETROCD_UND: TIntegerField
      FieldName = 'CD_UND'
      Origin = 'PARAMETRO.CD_UND'
      Required = True
    end
  end
  object TB_TESTE: TIBDataSet
    Database = DM.DB
    Transaction = DM.TS
    AfterDelete = TB_TESTEAfterDelete
    AfterPost = TB_TESTEAfterPost
    BufferChunks = 1000
    CachedUpdates = False
    DeleteSQL.Strings = (
      'delete from "PACIENTE"'
      'where'
      '  "CD_PACIENTE" = :"OLD_CD_PACIENTE"'
      '')
    InsertSQL.Strings = (
      'insert into "PACIENTE"'
      '('
      '  "CD_PACIENTE"'
      ', "CD_BAIRRO"'
      ', "CD_PAIS"'
      ', "CD_MUNICIPIO"'
      ', "CD_MOR_MUNICIPIO"'
      ', "CD_PROVINCIA"'
      ', "CD_COMUNA"'
      ', "NM_PACIENTE"'
      ', "DT_NASCIMENTO"'
      ', "IDADE"'
      ', "NM_MAE"'
      ', "CD_MORADA_PERM"'
      ', "CD_ESCOLARIDADE"'
      ', "DS_ESCOLARIDADE"'
      ', "TP_SEXO"'
      ', "MESES"'
      ', "ESTADO_CIVIL"'
      ', "CD_NAR_PROVINCIA"'
      ', "CD_PACIENTE_ORACLE"'
      ', "CD_OCUPACAO"'
      ', "CD_DOCUMENTO"'
      ', "TP_DOCUMENTO"'
      ', "NR_DOCUMENTO"'
      ', "NR_TEL_1"'
      ', "NR_TEL_2"'
      ', "DS_ENDERECO"'
      ', "FL_GESTANTE"'
      ', "FL_NOTIFICACAO"'
      ', "NR_MESES_GESTANTE"'
      ', "FL_RESULTADO"'
      ')'
      'values'
      '('
      '  :"CD_PACIENTE"'
      ', :"CD_BAIRRO"'
      ', :"CD_PAIS"'
      ', :"CD_MUNICIPIO"'
      ', :"CD_MOR_MUNICIPIO"'
      ', :"CD_PROVINCIA"'
      ', :"CD_COMUNA"'
      ', :"NM_PACIENTE"'
      ', :"DT_NASCIMENTO"'
      ', :"IDADE"'
      ', :"NM_MAE"'
      ', :"CD_MORADA_PERM"'
      ', :"CD_ESCOLARIDADE"'
      ', :"DS_ESCOLARIDADE"'
      ', :"TP_SEXO"'
      ', :"MESES"'
      ', :"ESTADO_CIVIL"'
      ', :"CD_NAR_PROVINCIA"'
      ', :"CD_PACIENTE_ORACLE"'
      ', :"CD_OCUPACAO"'
      ', :"CD_DOCUMENTO"'
      ', :"TP_DOCUMENTO"'
      ', :"NR_DOCUMENTO"'
      ', :"NR_TEL_1"'
      ', :"NR_TEL_2"'
      ', :"DS_ENDERECO"'
      ', :"FL_GESTANTE"'
      ', :"FL_NOTIFICACAO"'
      ', :"NR_MESES_GESTANTE"'
      ', :"FL_RESULTADO"'
      ')'
      '')
    SelectSQL.Strings = (
      'SELECT FL_GESTANTE FROM PACIENTE')
    ModifySQL.Strings = (
      'update "PACIENTE"'
      'set'
      ' "CD_PACIENTE" = :"CD_PACIENTE"'
      ', "CD_BAIRRO" = :"CD_BAIRRO"'
      ', "CD_PAIS" = :"CD_PAIS"'
      ', "CD_MUNICIPIO" = :"CD_MUNICIPIO"'
      ', "CD_MOR_MUNICIPIO" = :"CD_MOR_MUNICIPIO"'
      ', "CD_PROVINCIA" = :"CD_PROVINCIA"'
      ', "CD_COMUNA" = :"CD_COMUNA"'
      ', "NM_PACIENTE" = :"NM_PACIENTE"'
      ', "DT_NASCIMENTO" = :"DT_NASCIMENTO"'
      ', "IDADE" = :"IDADE"'
      ', "NM_MAE" = :"NM_MAE"'
      ', "CD_MORADA_PERM" = :"CD_MORADA_PERM"'
      ', "CD_ESCOLARIDADE" = :"CD_ESCOLARIDADE"'
      ', "DS_ESCOLARIDADE" = :"DS_ESCOLARIDADE"'
      ', "TP_SEXO" = :"TP_SEXO"'
      ', "MESES" = :"MESES"'
      ', "ESTADO_CIVIL" = :"ESTADO_CIVIL"'
      ', "CD_NAR_PROVINCIA" = :"CD_NAR_PROVINCIA"'
      ', "CD_PACIENTE_ORACLE" = :"CD_PACIENTE_ORACLE"'
      ', "CD_OCUPACAO" = :"CD_OCUPACAO"'
      ', "CD_DOCUMENTO" = :"CD_DOCUMENTO"'
      ', "TP_DOCUMENTO" = :"TP_DOCUMENTO"'
      ', "NR_DOCUMENTO" = :"NR_DOCUMENTO"'
      ', "NR_TEL_1" = :"NR_TEL_1"'
      ', "NR_TEL_2" = :"NR_TEL_2"'
      ', "DS_ENDERECO" = :"DS_ENDERECO"'
      ', "FL_GESTANTE" = :"FL_GESTANTE"'
      ', "FL_NOTIFICACAO" = :"FL_NOTIFICACAO"'
      ', "NR_MESES_GESTANTE" = :"NR_MESES_GESTANTE"'
      ', "FL_RESULTADO" = :"FL_RESULTADO"'
      'where'
      '  "CD_PACIENTE" = :"OLD_CD_PACIENTE"'
      '')
    Left = 464
    Top = 211
    object TB_TESTEFL_GESTANTE: TIntegerField
      FieldName = 'FL_GESTANTE'
      Origin = 'PACIENTE.FL_GESTANTE'
    end
  end
  object TB_PTV: TIBDataSet
    Database = DM.DB
    Transaction = DM.TS
    AfterInsert = TB_PTVAfterInsert
    BeforePost = TB_PTVBeforePost
    BufferChunks = 1000
    CachedUpdates = False
    DeleteSQL.Strings = (
      'delete from "REGISTRO_PTV"'
      'where  "REGISTRO_PTV"."CD_UNIDADE" = :CD_UNIDADE'
      'and      "REGISTRO_PTV"."CD_PROVINCIA" = :CD_PROVINCIA'
      'and      "REGISTRO_PTV"."CD_MUNICIPIO" = :CD_MUNICIPIO'
      'and      "REGISTRO_PTV"."VL_MESANO" = :VL_MESANO')
    InsertSQL.Strings = (
      'insert into "REGISTRO_PTV"'
      '('
      '  "CD_REGISTRO_PTV"'
      ', "CD_UND"'
      ', "DT_REGISTRO"'
      ', "CD_UNIDADE"'
      ', "CD_PROVINCIA"'
      ', "CD_MUNICIPIO"'
      ', "VL_MESANO"'
      ', "FL_GESTANTE"'
      ', "ID_GRUPOS_GESTANTE"'
      ', "VL_ADMITIDAS_PTV"'
      ', "VL_ADMITIDAS_PARTO"'
      ', "VL_ADMITIDAS_POS_PARTO"'
      ', "VL_X_GESTANTE"'
      ', "VL_Y_GESTANTE"'
      ', "FL_PARTO"'
      ', "ID_GRUPOS_PARTO"'
      ', "VL_TERAPIA_COMPLETA"'
      ', "VL_TERAPIA_OUTRO"'
      ', "VL_TERAPIA_NENHUM"'
      ', "VL_X_PARTO"'
      ', "VL_Y_PARTO"'
      ', "FL_CRIANCA"'
      ', "ID_GRUPOS_CRIANCA"'
      ', "VL_TOTAL_CRIANCA"'
      ', "VL_X_CRIANCA"'
      ', "VL_Y_CRIANCA"'
      ', "CD_USU_INCLUSAO"'
      ', "DT_INCLUSAO"'
      ', "CD_USU_ALTERACAO"'
      ', "DT_ALTERACAO"'
      ', "CD_REGISTRO_GERAL"'
      ', "NM_USU"'
      ', "VL_VERSAO"'
      ')'
      'values'
      '('
      '  :"CD_REGISTRO_PTV"'
      ', :"CD_UND"'
      ', :"DT_REGISTRO"'
      ', :"CD_UNIDADE"'
      ', :"CD_PROVINCIA"'
      ', :"CD_MUNICIPIO"'
      ', :"VL_MESANO"'
      ', :"FL_GESTANTE"'
      ', :"ID_GRUPOS_GESTANTE"'
      ', :"VL_ADMITIDAS_PTV"'
      ', :"VL_ADMITIDAS_PARTO"'
      ', :"VL_ADMITIDAS_POS_PARTO"'
      ', :"VL_X_GESTANTE"'
      ', :"VL_Y_GESTANTE"'
      ', :"FL_PARTO"'
      ', :"ID_GRUPOS_PARTO"'
      ', :"VL_TERAPIA_COMPLETA"'
      ', :"VL_TERAPIA_OUTRO"'
      ', :"VL_TERAPIA_NENHUM"'
      ', :"VL_X_PARTO"'
      ', :"VL_Y_PARTO"'
      ', :"FL_CRIANCA"'
      ', :"ID_GRUPOS_CRIANCA"'
      ', :"VL_TOTAL_CRIANCA"'
      ', :"VL_X_CRIANCA"'
      ', :"VL_Y_CRIANCA"'
      ', :"CD_USU_INCLUSAO"'
      ', :"DT_INCLUSAO"'
      ', :"CD_USU_ALTERACAO"'
      ', :"DT_ALTERACAO"'
      ', :"CD_REGISTRO_GERAL"'
      ', :"NM_USU"'
      ', :"VL_VERSAO"'
      ')')
    SelectSQL.Strings = (
      'select "REGISTRO_PTV"."CD_REGISTRO_PTV"'
      '      ,"REGISTRO_PTV"."DT_REGISTRO"'
      '      ,"REGISTRO_PTV"."CD_UNIDADE"'
      '      ,"REGISTRO_PTV"."CD_PROVINCIA"'
      '      ,"REGISTRO_PTV"."CD_MUNICIPIO"'
      '      ,"REGISTRO_PTV"."VL_MESANO"'
      '      ,"REGISTRO_PTV"."FL_GESTANTE"'
      '      ,"REGISTRO_PTV"."ID_GRUPOS_GESTANTE"'
      '      ,"REGISTRO_PTV"."VL_ADMITIDAS_PTV"'
      '      ,"REGISTRO_PTV"."VL_ADMITIDAS_PARTO"'
      '      ,"REGISTRO_PTV"."VL_ADMITIDAS_POS_PARTO"'
      '      ,"REGISTRO_PTV"."VL_X_GESTANTE"'
      '      ,"REGISTRO_PTV"."VL_Y_GESTANTE"'
      '      ,"REGISTRO_PTV"."FL_PARTO"'
      '      ,"REGISTRO_PTV"."ID_GRUPOS_PARTO"'
      '      ,"REGISTRO_PTV"."VL_TERAPIA_COMPLETA"'
      '      ,"REGISTRO_PTV"."VL_TERAPIA_OUTRO"'
      '      ,"REGISTRO_PTV"."VL_TERAPIA_NENHUM"'
      '      ,"REGISTRO_PTV"."VL_X_PARTO"'
      '      ,"REGISTRO_PTV"."VL_Y_PARTO"'
      '      ,"REGISTRO_PTV"."FL_CRIANCA"'
      '      ,"REGISTRO_PTV"."ID_GRUPOS_CRIANCA"'
      '      ,"REGISTRO_PTV"."VL_TOTAL_CRIANCA"'
      '      ,"REGISTRO_PTV"."VL_X_CRIANCA"'
      '      ,"REGISTRO_PTV"."VL_Y_CRIANCA"'
      '      ,"REGISTRO_PTV"."CD_UND"'
      '      ,"REGISTRO_PTV"."CD_REGISTRO_GERAL"'
      '      ,"REGISTRO_PTV"."NM_USU"'
      '      ,"REGISTRO_PTV"."VL_VERSAO"'
      '      ,"REGISTRO_PTV"."CD_USU_INCLUSAO"'
      '      ,"REGISTRO_PTV"."DT_INCLUSAO"'
      '      ,"REGISTRO_PTV"."CD_USU_ALTERACAO"'
      '      ,"REGISTRO_PTV"."DT_ALTERACAO"'
      'from "REGISTRO_PTV"'
      'where  "REGISTRO_PTV"."CD_UNIDADE" = :CD_UNIDADE'
      'and      "REGISTRO_PTV"."CD_PROVINCIA" = :CD_PROVINCIA'
      'and      "REGISTRO_PTV"."CD_MUNICIPIO" = :CD_MUNICIPIO'
      'and      "REGISTRO_PTV"."VL_MESANO" = :VL_MESANO'
      'order by'
      '"REGISTRO_PTV"."CD_REGISTRO_PTV"')
    ModifySQL.Strings = (
      'update "REGISTRO_PTV"'
      'set'
      ' "CD_REGISTRO_PTV" = :"CD_REGISTRO_PTV"'
      ', "CD_UND" = :"CD_UND"'
      ', "DT_REGISTRO" = :"DT_REGISTRO"'
      ', "CD_UNIDADE" = :"CD_UNIDADE"'
      ', "CD_PROVINCIA" = :"CD_PROVINCIA"'
      ', "CD_MUNICIPIO" = :"CD_MUNICIPIO"'
      ', "VL_MESANO" = :"VL_MESANO"'
      ', "FL_GESTANTE" = :"FL_GESTANTE"'
      ', "ID_GRUPOS_GESTANTE" = :"ID_GRUPOS_GESTANTE"'
      ', "VL_ADMITIDAS_PTV" = :"VL_ADMITIDAS_PTV"'
      ', "VL_ADMITIDAS_PARTO" = :"VL_ADMITIDAS_PARTO"'
      ', "VL_ADMITIDAS_POS_PARTO" = :"VL_ADMITIDAS_POS_PARTO"'
      ', "VL_X_GESTANTE" = :"VL_X_GESTANTE"'
      ', "VL_Y_GESTANTE" = :"VL_Y_GESTANTE"'
      ', "FL_PARTO" = :"FL_PARTO"'
      ', "ID_GRUPOS_PARTO" = :"ID_GRUPOS_PARTO"'
      ', "VL_TERAPIA_COMPLETA" = :"VL_TERAPIA_COMPLETA"'
      ', "VL_TERAPIA_OUTRO" = :"VL_TERAPIA_OUTRO"'
      ', "VL_TERAPIA_NENHUM" = :"VL_TERAPIA_NENHUM"'
      ', "VL_X_PARTO" = :"VL_X_PARTO"'
      ', "VL_Y_PARTO" = :"VL_Y_PARTO"'
      ', "FL_CRIANCA" = :"FL_CRIANCA"'
      ', "ID_GRUPOS_CRIANCA" = :"ID_GRUPOS_CRIANCA"'
      ', "VL_TOTAL_CRIANCA" = :"VL_TOTAL_CRIANCA"'
      ', "VL_X_CRIANCA" = :"VL_X_CRIANCA"'
      ', "VL_Y_CRIANCA" = :"VL_Y_CRIANCA"'
      ', "CD_USU_INCLUSAO" = :"CD_USU_INCLUSAO"'
      ', "DT_INCLUSAO" = :"DT_INCLUSAO"'
      ', "CD_USU_ALTERACAO" = :"CD_USU_ALTERACAO"'
      ', "DT_ALTERACAO" = :"DT_ALTERACAO"'
      ', "CD_REGISTRO_GERAL" = :"CD_REGISTRO_GERAL"'
      ', "NM_USU" = :"NM_USU"'
      ', "VL_VERSAO" = :"VL_VERSAO"'
      'where'
      '  "CD_REGISTRO_PTV" = :"OLD_CD_REGISTRO_PTV" and '
      '  "CD_UND" = :"OLD_CD_UND"')
    GeneratorField.Field = 'CD_REGISTRO_PTV'
    GeneratorField.Generator = 'GEN_REGISTRO_PTV'
    Left = 456
    Top = 387
    object TB_PTVCD_REGISTRO_PTV: TIntegerField
      FieldName = 'CD_REGISTRO_PTV'
      Origin = 'REGISTRO_PTV.CD_REGISTRO_PTV'
      Required = True
    end
    object TB_PTVDT_REGISTRO: TDateTimeField
      FieldName = 'DT_REGISTRO'
      Origin = 'REGISTRO_PTV.DT_REGISTRO'
    end
    object TB_PTVCD_UNIDADE: TIntegerField
      FieldName = 'CD_UNIDADE'
      Origin = 'REGISTRO_PTV.CD_UNIDADE'
      Required = True
    end
    object TB_PTVCD_PROVINCIA: TIntegerField
      FieldName = 'CD_PROVINCIA'
      Origin = 'REGISTRO_PTV.CD_PROVINCIA'
      Required = True
    end
    object TB_PTVCD_MUNICIPIO: TIntegerField
      FieldName = 'CD_MUNICIPIO'
      Origin = 'REGISTRO_PTV.CD_MUNICIPIO'
      Required = True
    end
    object TB_PTVVL_MESANO: TIBStringField
      FieldName = 'VL_MESANO'
      Origin = 'REGISTRO_PTV.VL_MESANO'
      Required = True
      Size = 8
    end
    object TB_PTVFL_GESTANTE: TIntegerField
      FieldName = 'FL_GESTANTE'
      Origin = 'REGISTRO_PTV.FL_GESTANTE'
    end
    object TB_PTVID_GRUPOS_GESTANTE: TIntegerField
      FieldName = 'ID_GRUPOS_GESTANTE'
      Origin = 'REGISTRO_PTV.ID_GRUPOS_GESTANTE'
    end
    object TB_PTVVL_ADMITIDAS_PTV: TIntegerField
      FieldName = 'VL_ADMITIDAS_PTV'
      Origin = 'REGISTRO_PTV.VL_ADMITIDAS_PTV'
    end
    object TB_PTVVL_ADMITIDAS_PARTO: TIntegerField
      FieldName = 'VL_ADMITIDAS_PARTO'
      Origin = 'REGISTRO_PTV.VL_ADMITIDAS_PARTO'
    end
    object TB_PTVVL_ADMITIDAS_POS_PARTO: TIntegerField
      FieldName = 'VL_ADMITIDAS_POS_PARTO'
      Origin = 'REGISTRO_PTV.VL_ADMITIDAS_POS_PARTO'
    end
    object TB_PTVVL_X_GESTANTE: TIntegerField
      FieldName = 'VL_X_GESTANTE'
      Origin = 'REGISTRO_PTV.VL_X_GESTANTE'
    end
    object TB_PTVVL_Y_GESTANTE: TIntegerField
      FieldName = 'VL_Y_GESTANTE'
      Origin = 'REGISTRO_PTV.VL_Y_GESTANTE'
    end
    object TB_PTVFL_PARTO: TIntegerField
      FieldName = 'FL_PARTO'
      Origin = 'REGISTRO_PTV.FL_PARTO'
    end
    object TB_PTVID_GRUPOS_PARTO: TIntegerField
      FieldName = 'ID_GRUPOS_PARTO'
      Origin = 'REGISTRO_PTV.ID_GRUPOS_PARTO'
    end
    object TB_PTVVL_TERAPIA_COMPLETA: TIntegerField
      FieldName = 'VL_TERAPIA_COMPLETA'
      Origin = 'REGISTRO_PTV.VL_TERAPIA_COMPLETA'
    end
    object TB_PTVVL_TERAPIA_OUTRO: TIntegerField
      FieldName = 'VL_TERAPIA_OUTRO'
      Origin = 'REGISTRO_PTV.VL_TERAPIA_OUTRO'
    end
    object TB_PTVVL_TERAPIA_NENHUM: TIntegerField
      FieldName = 'VL_TERAPIA_NENHUM'
      Origin = 'REGISTRO_PTV.VL_TERAPIA_NENHUM'
    end
    object TB_PTVVL_X_PARTO: TIntegerField
      FieldName = 'VL_X_PARTO'
      Origin = 'REGISTRO_PTV.VL_X_PARTO'
    end
    object TB_PTVVL_Y_PARTO: TIntegerField
      FieldName = 'VL_Y_PARTO'
      Origin = 'REGISTRO_PTV.VL_Y_PARTO'
    end
    object TB_PTVFL_CRIANCA: TIntegerField
      FieldName = 'FL_CRIANCA'
      Origin = 'REGISTRO_PTV.FL_CRIANCA'
    end
    object TB_PTVID_GRUPOS_CRIANCA: TIntegerField
      FieldName = 'ID_GRUPOS_CRIANCA'
      Origin = 'REGISTRO_PTV.ID_GRUPOS_CRIANCA'
    end
    object TB_PTVVL_TOTAL_CRIANCA: TIntegerField
      FieldName = 'VL_TOTAL_CRIANCA'
      Origin = 'REGISTRO_PTV.VL_TOTAL_CRIANCA'
    end
    object TB_PTVVL_X_CRIANCA: TIntegerField
      FieldName = 'VL_X_CRIANCA'
      Origin = 'REGISTRO_PTV.VL_X_CRIANCA'
    end
    object TB_PTVVL_Y_CRIANCA: TIntegerField
      FieldName = 'VL_Y_CRIANCA'
      Origin = 'REGISTRO_PTV.VL_Y_CRIANCA'
    end
    object TB_PTVCD_UND: TIntegerField
      FieldName = 'CD_UND'
      Origin = 'REGISTRO_PTV.CD_UND'
      Required = True
    end
    object TB_PTVCD_REGISTRO_GERAL: TIntegerField
      FieldName = 'CD_REGISTRO_GERAL'
      Origin = 'REGISTRO_PTV.CD_REGISTRO_GERAL'
    end
    object TB_PTVNM_USU: TIBStringField
      FieldName = 'NM_USU'
      Origin = 'REGISTRO_PTV.NM_USU'
      Size = 50
    end
    object TB_PTVVL_VERSAO: TIBStringField
      FieldName = 'VL_VERSAO'
      Origin = 'REGISTRO_PTV.VL_VERSAO'
    end
    object TB_PTVCD_USU_INCLUSAO: TIntegerField
      FieldName = 'CD_USU_INCLUSAO'
      Origin = 'REGISTRO_PTV.CD_USU_INCLUSAO'
    end
    object TB_PTVDT_INCLUSAO: TDateTimeField
      FieldName = 'DT_INCLUSAO'
      Origin = 'REGISTRO_PTV.DT_INCLUSAO'
    end
    object TB_PTVCD_USU_ALTERACAO: TIntegerField
      FieldName = 'CD_USU_ALTERACAO'
      Origin = 'REGISTRO_PTV.CD_USU_ALTERACAO'
    end
    object TB_PTVDT_ALTERACAO: TDateTimeField
      FieldName = 'DT_ALTERACAO'
      Origin = 'REGISTRO_PTV.DT_ALTERACAO'
    end
  end
  object TB_INVESTIGADOR: TIBDataSet
    Database = DM.DB
    Transaction = DM.TS
    AfterDelete = TB_INVESTIGADORAfterDelete
    AfterInsert = TB_INVESTIGADORAfterInsert
    BeforeDelete = TB_INVESTIGADORBeforeDelete
    BufferChunks = 1000
    CachedUpdates = False
    DeleteSQL.Strings = (
      'delete from "INVESTIGADOR"'
      'where'
      '  "CD_INVESTIGADOR" = :"OLD_CD_INVESTIGADOR"')
    InsertSQL.Strings = (
      'insert into "INVESTIGADOR"'
      '('
      '  "CD_INVESTIGADOR"'
      ', "NM_INVESTIGADOR"'
      ', "NM_FUNCAO"'
      ', "NR_TELEFONE"'
      ', "CD_UND"'
      ')'
      'values'
      '('
      '  :"CD_INVESTIGADOR"'
      ', :"NM_INVESTIGADOR"'
      ', :"NM_FUNCAO"'
      ', :"NR_TELEFONE"'
      ', :"CD_UND"'
      ')')
    SelectSQL.Strings = (
      'select "INVESTIGADOR"."CD_INVESTIGADOR"'
      '      ,"INVESTIGADOR"."NM_INVESTIGADOR"'
      '      ,"INVESTIGADOR"."NM_FUNCAO"'
      '      ,"INVESTIGADOR"."NR_TELEFONE"'
      '      ,"INVESTIGADOR"."CD_UND"'
      'from "INVESTIGADOR"')
    ModifySQL.Strings = (
      'update "INVESTIGADOR"'
      'set'
      ' "CD_INVESTIGADOR" = :"CD_INVESTIGADOR"'
      ', "NM_INVESTIGADOR" = :"NM_INVESTIGADOR"'
      ', "NM_FUNCAO" = :"NM_FUNCAO"'
      ', "NR_TELEFONE" = :"NR_TELEFONE"'
      ', "CD_UND" = :"CD_UND"'
      'where'
      '  "CD_INVESTIGADOR" = :"OLD_CD_INVESTIGADOR"')
    Left = 360
    Top = 555
    object TB_INVESTIGADORCD_INVESTIGADOR: TIntegerField
      FieldName = 'CD_INVESTIGADOR'
      Origin = 'INVESTIGADOR.CD_INVESTIGADOR'
      Required = True
    end
    object TB_INVESTIGADORNM_INVESTIGADOR: TIBStringField
      FieldName = 'NM_INVESTIGADOR'
      Origin = 'INVESTIGADOR.NM_INVESTIGADOR'
      Size = 50
    end
    object TB_INVESTIGADORNM_FUNCAO: TIBStringField
      FieldName = 'NM_FUNCAO'
      Origin = 'INVESTIGADOR.NM_FUNCAO'
      Size = 50
    end
    object TB_INVESTIGADORNR_TELEFONE: TIBStringField
      FieldName = 'NR_TELEFONE'
      Origin = 'INVESTIGADOR.NR_TELEFONE'
    end
    object TB_INVESTIGADORCD_UND: TIntegerField
      FieldName = 'CD_UND'
      Origin = 'INVESTIGADOR.CD_UND'
      Required = True
    end
  end
  object TB_TARV: TIBDataSet
    Database = DM.DB
    Transaction = DM.TS
    AfterInsert = TB_TARVAfterInsert
    BeforePost = TB_TARVBeforePost
    BufferChunks = 1000
    CachedUpdates = False
    DeleteSQL.Strings = (
      'delete from "REGISTRO_TARV"'
      'where  "REGISTRO_TARV"."CD_UNIDADE" = :CD_UNIDADE'
      'and      "REGISTRO_TARV"."CD_PROVINCIA" = :CD_PROVINCIA'
      'and      "REGISTRO_TARV"."CD_MUNICIPIO" = :CD_MUNICIPIO'
      'and      "REGISTRO_TARV"."VL_MESANO" = :VL_MESANO')
    InsertSQL.Strings = (
      'insert into "REGISTRO_TARV"'
      '('
      '  "CD_REGISTRO_TARV"'
      ', "CD_UND"'
      ', "DT_REGISTRO"'
      ', "CD_UNIDADE"'
      ', "CD_PROVINCIA"'
      ', "CD_MUNICIPIO"'
      ', "VL_MESANO"'
      ', "VL_ACUMULADOS"'
      ', "VL_NOVOS"'
      ', "VL_TRANSFERIDOS"'
      ', "VL_ABANDONOS"'
      ', "VL_TRANSFERIDOS_PARA"'
      ', "VL_OBITOS"'
      ', "ID_FAIXA_ETARIA"'
      ', "FL_SEXO"'
      ', "FL_GESTANTE"'
      ', "VL_X"'
      ', "VL_Y"'
      ', "CD_USU_INCLUSAO"'
      ', "DT_INCLUSAO"'
      ', "CD_USU_ALTERACAO"'
      ', "DT_ALTERACAO"'
      ', "CD_REGISTRO_GERAL"'
      ', "NM_USU"'
      ', "VL_VERSAO"'
      ')'
      'values'
      '('
      '  :"CD_REGISTRO_TARV"'
      ', :"CD_UND"'
      ', :"DT_REGISTRO"'
      ', :"CD_UNIDADE"'
      ', :"CD_PROVINCIA"'
      ', :"CD_MUNICIPIO"'
      ', :"VL_MESANO"'
      ', :"VL_ACUMULADOS"'
      ', :"VL_NOVOS"'
      ', :"VL_TRANSFERIDOS"'
      ', :"VL_ABANDONOS"'
      ', :"VL_TRANSFERIDOS_PARA"'
      ', :"VL_OBITOS"'
      ', :"ID_FAIXA_ETARIA"'
      ', :"FL_SEXO"'
      ', :"FL_GESTANTE"'
      ', :"VL_X"'
      ', :"VL_Y"'
      ', :"CD_USU_INCLUSAO"'
      ', :"DT_INCLUSAO"'
      ', :"CD_USU_ALTERACAO"'
      ', :"DT_ALTERACAO"'
      ', :"CD_REGISTRO_GERAL"'
      ', :"NM_USU"'
      ', :"VL_VERSAO"'
      ')')
    SelectSQL.Strings = (
      'select "REGISTRO_TARV"."CD_REGISTRO_TARV"'
      '      ,"REGISTRO_TARV"."DT_REGISTRO"'
      '      ,"REGISTRO_TARV"."CD_UNIDADE"'
      '      ,"REGISTRO_TARV"."CD_PROVINCIA"'
      '      ,"REGISTRO_TARV"."CD_MUNICIPIO"'
      '      ,"REGISTRO_TARV"."VL_MESANO"'
      '      ,"REGISTRO_TARV"."VL_ACUMULADOS"'
      '      ,"REGISTRO_TARV"."VL_NOVOS"'
      '      ,"REGISTRO_TARV"."VL_TRANSFERIDOS"'
      '      ,"REGISTRO_TARV"."VL_ABANDONOS"'
      '      ,"REGISTRO_TARV"."VL_TRANSFERIDOS_PARA"'
      '      ,"REGISTRO_TARV"."VL_OBITOS"'
      '      ,"REGISTRO_TARV"."ID_FAIXA_ETARIA"'
      '      ,"REGISTRO_TARV"."FL_SEXO"'
      '      ,"REGISTRO_TARV"."FL_GESTANTE"'
      '      ,"REGISTRO_TARV"."VL_X"'
      '      ,"REGISTRO_TARV"."VL_Y"'
      '      ,"REGISTRO_TARV"."CD_UND"'
      '      ,"REGISTRO_TARV"."CD_REGISTRO_GERAL"'
      '      ,"REGISTRO_TARV"."NM_USU"'
      '      ,"REGISTRO_TARV"."VL_VERSAO"'
      '      ,"REGISTRO_TARV"."CD_USU_INCLUSAO"'
      '      ,"REGISTRO_TARV"."DT_INCLUSAO"'
      '      ,"REGISTRO_TARV"."CD_USU_ALTERACAO"'
      '      ,"REGISTRO_TARV"."DT_ALTERACAO"'
      'from "REGISTRO_TARV"'
      'where  "REGISTRO_TARV"."CD_UNIDADE" = :CD_UNIDADE'
      'and      "REGISTRO_TARV"."CD_PROVINCIA" = :CD_PROVINCIA'
      'and      "REGISTRO_TARV"."CD_MUNICIPIO" = :CD_MUNICIPIO'
      'and      "REGISTRO_TARV"."VL_MESANO" = :VL_MESANO')
    ModifySQL.Strings = (
      'update "REGISTRO_TARV"'
      'set'
      ' "CD_REGISTRO_TARV" = :"CD_REGISTRO_TARV"'
      ', "CD_UND" = :"CD_UND"'
      ', "DT_REGISTRO" = :"DT_REGISTRO"'
      ', "CD_UNIDADE" = :"CD_UNIDADE"'
      ', "CD_PROVINCIA" = :"CD_PROVINCIA"'
      ', "CD_MUNICIPIO" = :"CD_MUNICIPIO"'
      ', "VL_MESANO" = :"VL_MESANO"'
      ', "VL_ACUMULADOS" = :"VL_ACUMULADOS"'
      ', "VL_NOVOS" = :"VL_NOVOS"'
      ', "VL_TRANSFERIDOS" = :"VL_TRANSFERIDOS"'
      ', "VL_ABANDONOS" = :"VL_ABANDONOS"'
      ', "VL_TRANSFERIDOS_PARA" = :"VL_TRANSFERIDOS_PARA"'
      ', "VL_OBITOS" = :"VL_OBITOS"'
      ', "ID_FAIXA_ETARIA" = :"ID_FAIXA_ETARIA"'
      ', "FL_SEXO" = :"FL_SEXO"'
      ', "FL_GESTANTE" = :"FL_GESTANTE"'
      ', "VL_X" = :"VL_X"'
      ', "VL_Y" = :"VL_Y"'
      ', "CD_USU_INCLUSAO" = :"CD_USU_INCLUSAO"'
      ', "DT_INCLUSAO" = :"DT_INCLUSAO"'
      ', "CD_USU_ALTERACAO" = :"CD_USU_ALTERACAO"'
      ', "DT_ALTERACAO" = :"DT_ALTERACAO"'
      ', "CD_REGISTRO_GERAL" = :"CD_REGISTRO_GERAL"'
      ', "NM_USU" = :"NM_USU"'
      ', "VL_VERSAO" = :"VL_VERSAO"'
      'where'
      '  "CD_REGISTRO_TARV" = :"OLD_CD_REGISTRO_TARV" and '
      '  "CD_UND" = :"OLD_CD_UND"')
    GeneratorField.Field = 'CD_REGISTRO_TARV'
    GeneratorField.Generator = 'GEN_REGISTRO_TARV'
    Left = 456
    Top = 443
    object TB_TARVCD_REGISTRO_TARV: TIntegerField
      FieldName = 'CD_REGISTRO_TARV'
      Origin = 'REGISTRO_TARV.CD_REGISTRO_TARV'
      Required = True
    end
    object TB_TARVDT_REGISTRO: TDateTimeField
      FieldName = 'DT_REGISTRO'
      Origin = 'REGISTRO_TARV.DT_REGISTRO'
      Required = True
    end
    object TB_TARVCD_UNIDADE: TIntegerField
      FieldName = 'CD_UNIDADE'
      Origin = 'REGISTRO_TARV.CD_UNIDADE'
      Required = True
    end
    object TB_TARVCD_PROVINCIA: TIntegerField
      FieldName = 'CD_PROVINCIA'
      Origin = 'REGISTRO_TARV.CD_PROVINCIA'
      Required = True
    end
    object TB_TARVCD_MUNICIPIO: TIntegerField
      FieldName = 'CD_MUNICIPIO'
      Origin = 'REGISTRO_TARV.CD_MUNICIPIO'
      Required = True
    end
    object TB_TARVVL_MESANO: TIBStringField
      FieldName = 'VL_MESANO'
      Origin = 'REGISTRO_TARV.VL_MESANO'
      Required = True
      Size = 8
    end
    object TB_TARVVL_ACUMULADOS: TIntegerField
      FieldName = 'VL_ACUMULADOS'
      Origin = 'REGISTRO_TARV.VL_ACUMULADOS'
    end
    object TB_TARVVL_NOVOS: TIntegerField
      FieldName = 'VL_NOVOS'
      Origin = 'REGISTRO_TARV.VL_NOVOS'
    end
    object TB_TARVVL_TRANSFERIDOS: TIntegerField
      FieldName = 'VL_TRANSFERIDOS'
      Origin = 'REGISTRO_TARV.VL_TRANSFERIDOS'
    end
    object TB_TARVVL_ABANDONOS: TIntegerField
      FieldName = 'VL_ABANDONOS'
      Origin = 'REGISTRO_TARV.VL_ABANDONOS'
    end
    object TB_TARVVL_TRANSFERIDOS_PARA: TIntegerField
      FieldName = 'VL_TRANSFERIDOS_PARA'
      Origin = 'REGISTRO_TARV.VL_TRANSFERIDOS_PARA'
    end
    object TB_TARVVL_OBITOS: TIntegerField
      FieldName = 'VL_OBITOS'
      Origin = 'REGISTRO_TARV.VL_OBITOS'
    end
    object TB_TARVID_FAIXA_ETARIA: TIntegerField
      FieldName = 'ID_FAIXA_ETARIA'
      Origin = 'REGISTRO_TARV.ID_FAIXA_ETARIA'
    end
    object TB_TARVFL_SEXO: TIBStringField
      FieldName = 'FL_SEXO'
      Origin = 'REGISTRO_TARV.FL_SEXO'
      FixedChar = True
      Size = 1
    end
    object TB_TARVFL_GESTANTE: TIntegerField
      FieldName = 'FL_GESTANTE'
      Origin = 'REGISTRO_TARV.FL_GESTANTE'
    end
    object TB_TARVVL_X: TIntegerField
      FieldName = 'VL_X'
      Origin = 'REGISTRO_TARV.VL_X'
    end
    object TB_TARVVL_Y: TIntegerField
      FieldName = 'VL_Y'
      Origin = 'REGISTRO_TARV.VL_Y'
    end
    object TB_TARVCD_UND: TIntegerField
      FieldName = 'CD_UND'
      Origin = 'REGISTRO_TARV.CD_UND'
      Required = True
    end
    object TB_TARVCD_REGISTRO_GERAL: TIntegerField
      FieldName = 'CD_REGISTRO_GERAL'
      Origin = 'REGISTRO_TARV.CD_REGISTRO_GERAL'
    end
    object TB_TARVNM_USU: TIBStringField
      FieldName = 'NM_USU'
      Origin = 'REGISTRO_TARV.NM_USU'
      Size = 50
    end
    object TB_TARVVL_VERSAO: TIBStringField
      FieldName = 'VL_VERSAO'
      Origin = 'REGISTRO_TARV.VL_VERSAO'
    end
    object TB_TARVCD_USU_INCLUSAO: TIntegerField
      FieldName = 'CD_USU_INCLUSAO'
      Origin = 'REGISTRO_TARV.CD_USU_INCLUSAO'
    end
    object TB_TARVDT_INCLUSAO: TDateTimeField
      FieldName = 'DT_INCLUSAO'
      Origin = 'REGISTRO_TARV.DT_INCLUSAO'
    end
    object TB_TARVCD_USU_ALTERACAO: TIntegerField
      FieldName = 'CD_USU_ALTERACAO'
      Origin = 'REGISTRO_TARV.CD_USU_ALTERACAO'
    end
    object TB_TARVDT_ALTERACAO: TDateTimeField
      FieldName = 'DT_ALTERACAO'
      Origin = 'REGISTRO_TARV.DT_ALTERACAO'
    end
  end
  object TB_CARACTERIZACAO: TIBDataSet
    Database = DM.DB
    Transaction = DM.TS
    AfterDelete = TB_CARACTERIZACAOAfterDelete
    AfterInsert = TB_CARACTERIZACAOAfterInsert
    AfterPost = TB_CARACTERIZACAOAfterPost
    BeforeDelete = TB_CARACTERIZACAOBeforeDelete
    BeforePost = TB_CARACTERIZACAOBeforePost
    BufferChunks = 1000
    CachedUpdates = False
    DeleteSQL.Strings = (
      'delete from "CARACTERIZACAO"'
      'where'
      '  "CD_CARACTERIZACAO" = :"OLD_CD_CARACTERIZACAO"')
    InsertSQL.Strings = (
      'insert into "CARACTERIZACAO"'
      '('
      '  "CD_CARACTERIZACAO"'
      ', "CD_PROVINCIA"'
      ', "CD_MUNICIPIO"'
      ', "CD_UNIDADE"'
      ', "CD_LOCAL"'
      ', "CD_UTENTE"'
      ', "CD_PACIENTE"'
      ', "CD_INVESTIGADOR"'
      ', "DT_VISITA"'
      ', "FL_SEXO"'
      ', "NR_IDADE"'
      ', "TP_SESSAO"'
      ', "CD_ESTADO_CIVIL"'
      ', "NR_FILHOS"'
      ', "FL_GESTANTE"'
      ', "NR_SEMANAS_GESTANTE"'
      ', "FL_AMAMENTA"'
      ', "CD_ESCOLARIDADE"'
      ', "DS_ESCORALIDADE"'
      ', "CD_OCUPACAO"'
      ', "DS_OCUPACAO"'
      ', "FL_EMPREGADA"'
      ', "FL_OUVIU_FALAR"'
      ', "CD_RAZAO"'
      ', "DS_RAZAO"'
      ', "CD_INDICACAO"'
      ', "DS_INDICACAO"'
      ', "FL_TRANSFUSAO"'
      ', "FL_TATUAGEM"'
      ', "FL_CIRURGIA"'
      ', "FL_CIRCUNCISAO"'
      ', "NR_PARTOS"'
      ', "NR_ABORTOS"'
      ', "FL_AMAMENTOU_OUTROS"'
      ', "NR_IDADE_EXPERIENCIA"'
      ', "FL_SEXO_ALCOOL"'
      ', "FL_SEXO_DROGAS"'
      ', "FL_SEXO_DINHEIRO"'
      ', "FL_SEXO_MATERIAL"'
      ', "FL_SINAIS_ITS"'
      ', "CD_SINAIS_ITS"'
      ', "DS_SINAIS_ITS"'
      ', "NR_PARCEIROS_SEXUAIS"'
      ', "FL_PARCEIRO_SEXUAL"'
      ', "FL_PRESERVATIVO"'
      ', "FL_PRESERVATIVO_NAO_REGULAR"'
      ', "FL_TESTE"'
      ', "CD_TESTE"'
      ', "DS_TESTE"'
      ', "DT_TESTE"'
      ', "FL_TESTE_RECENTES"'
      ', "FL_TESTE_PARCEIROS"'
      ', "FL_ITS"'
      ', "CD_SINTOMAS_ITS"'
      ', "DS_SINTOMAS_ITS"'
      ', "FL_TESTE_HOJE"'
      ', "FL_TESTE_RESULTADOS"'
      ', "FL_PARCEIROS_RESULTADOS"'
      ', "FL_REVELAR"'
      ', "CD_REVELAR"'
      ', "DS_REVELAR"'
      ', "FL_PLANO_REDUCAO"'
      ', "CD_PLANO_REDUCAO"'
      ', "DS_PLANO_REDUCAO"'
      ', "FL_RECEBEU_PRESERVATIVOS"'
      ', "FL_TRANSFERENCIA"'
      ', "CD_TRANSFERENCIA"'
      ', "DS_TRANSFERENCIA"'
      ', "FL_SERVICO_SAUDE"'
      ', "CD_UND"'
      ')'
      'values'
      '('
      '  :"CD_CARACTERIZACAO"'
      ', :"CD_PROVINCIA"'
      ', :"CD_MUNICIPIO"'
      ', :"CD_UNIDADE"'
      ', :"CD_LOCAL"'
      ', :"CD_UTENTE"'
      ', :"CD_PACIENTE"'
      ', :"CD_INVESTIGADOR"'
      ', :"DT_VISITA"'
      ', :"FL_SEXO"'
      ', :"NR_IDADE"'
      ', :"TP_SESSAO"'
      ', :"CD_ESTADO_CIVIL"'
      ', :"NR_FILHOS"'
      ', :"FL_GESTANTE"'
      ', :"NR_SEMANAS_GESTANTE"'
      ', :"FL_AMAMENTA"'
      ', :"CD_ESCOLARIDADE"'
      ', :"DS_ESCORALIDADE"'
      ', :"CD_OCUPACAO"'
      ', :"DS_OCUPACAO"'
      ', :"FL_EMPREGADA"'
      ', :"FL_OUVIU_FALAR"'
      ', :"CD_RAZAO"'
      ', :"DS_RAZAO"'
      ', :"CD_INDICACAO"'
      ', :"DS_INDICACAO"'
      ', :"FL_TRANSFUSAO"'
      ', :"FL_TATUAGEM"'
      ', :"FL_CIRURGIA"'
      ', :"FL_CIRCUNCISAO"'
      ', :"NR_PARTOS"'
      ', :"NR_ABORTOS"'
      ', :"FL_AMAMENTOU_OUTROS"'
      ', :"NR_IDADE_EXPERIENCIA"'
      ', :"FL_SEXO_ALCOOL"'
      ', :"FL_SEXO_DROGAS"'
      ', :"FL_SEXO_DINHEIRO"'
      ', :"FL_SEXO_MATERIAL"'
      ', :"FL_SINAIS_ITS"'
      ', :"CD_SINAIS_ITS"'
      ', :"DS_SINAIS_ITS"'
      ', :"NR_PARCEIROS_SEXUAIS"'
      ', :"FL_PARCEIRO_SEXUAL"'
      ', :"FL_PRESERVATIVO"'
      ', :"FL_PRESERVATIVO_NAO_REGULAR"'
      ', :"FL_TESTE"'
      ', :"CD_TESTE"'
      ', :"DS_TESTE"'
      ', :"DT_TESTE"'
      ', :"FL_TESTE_RECENTES"'
      ', :"FL_TESTE_PARCEIROS"'
      ', :"FL_ITS"'
      ', :"CD_SINTOMAS_ITS"'
      ', :"DS_SINTOMAS_ITS"'
      ', :"FL_TESTE_HOJE"'
      ', :"FL_TESTE_RESULTADOS"'
      ', :"FL_PARCEIROS_RESULTADOS"'
      ', :"FL_REVELAR"'
      ', :"CD_REVELAR"'
      ', :"DS_REVELAR"'
      ', :"FL_PLANO_REDUCAO"'
      ', :"CD_PLANO_REDUCAO"'
      ', :"DS_PLANO_REDUCAO"'
      ', :"FL_RECEBEU_PRESERVATIVOS"'
      ', :"FL_TRANSFERENCIA"'
      ', :"CD_TRANSFERENCIA"'
      ', :"DS_TRANSFERENCIA"'
      ', :"FL_SERVICO_SAUDE"'
      ', :"CD_UND"'
      ')')
    SelectSQL.Strings = (
      'select "CARACTERIZACAO"."CD_CARACTERIZACAO"'
      '      ,"CARACTERIZACAO"."CD_PROVINCIA"'
      '      ,"CARACTERIZACAO"."CD_MUNICIPIO"'
      '      ,"CARACTERIZACAO"."CD_UNIDADE"'
      '      ,"CARACTERIZACAO"."CD_LOCAL"'
      '      ,"CARACTERIZACAO"."CD_UTENTE"'
      '      ,"CARACTERIZACAO"."CD_PACIENTE"'
      '      ,"CARACTERIZACAO"."CD_INVESTIGADOR"'
      '      ,"CARACTERIZACAO"."DT_VISITA"'
      '      ,"CARACTERIZACAO"."FL_SEXO"'
      '      ,"CARACTERIZACAO"."NR_IDADE"'
      '      ,"CARACTERIZACAO"."TP_SESSAO"'
      '      ,"CARACTERIZACAO"."CD_ESTADO_CIVIL"'
      '      ,"CARACTERIZACAO"."NR_FILHOS"'
      '      ,"CARACTERIZACAO"."FL_GESTANTE"'
      '      ,"CARACTERIZACAO"."NR_SEMANAS_GESTANTE"'
      '      ,"CARACTERIZACAO"."FL_AMAMENTA"'
      '      ,"CARACTERIZACAO"."CD_ESCOLARIDADE"'
      '      ,"CARACTERIZACAO"."DS_ESCORALIDADE"'
      '      ,"CARACTERIZACAO"."CD_OCUPACAO"'
      '      ,"CARACTERIZACAO"."DS_OCUPACAO"'
      '      ,"CARACTERIZACAO"."FL_EMPREGADA"'
      '      ,"CARACTERIZACAO"."FL_OUVIU_FALAR"'
      '      ,"CARACTERIZACAO"."CD_RAZAO"'
      '      ,"CARACTERIZACAO"."DS_RAZAO"'
      '      ,"CARACTERIZACAO"."CD_INDICACAO"'
      '      ,"CARACTERIZACAO"."DS_INDICACAO"'
      '      ,"CARACTERIZACAO"."FL_TRANSFUSAO"'
      '      ,"CARACTERIZACAO"."FL_TATUAGEM"'
      '      ,"CARACTERIZACAO"."FL_CIRURGIA"'
      '      ,"CARACTERIZACAO"."FL_CIRCUNCISAO"'
      '      ,"CARACTERIZACAO"."NR_PARTOS"'
      '      ,"CARACTERIZACAO"."NR_ABORTOS"'
      '      ,"CARACTERIZACAO"."FL_AMAMENTOU_OUTROS"'
      '      ,"CARACTERIZACAO"."NR_IDADE_EXPERIENCIA"'
      '      ,"CARACTERIZACAO"."FL_SEXO_ALCOOL"'
      '      ,"CARACTERIZACAO"."FL_SEXO_DROGAS"'
      '      ,"CARACTERIZACAO"."FL_SEXO_DINHEIRO"'
      '      ,"CARACTERIZACAO"."FL_SEXO_MATERIAL"'
      '      ,"CARACTERIZACAO"."FL_SINAIS_ITS"'
      '      ,"CARACTERIZACAO"."CD_SINAIS_ITS"'
      '      ,"CARACTERIZACAO"."DS_SINAIS_ITS"'
      '      ,"CARACTERIZACAO"."NR_PARCEIROS_SEXUAIS"'
      '      ,"CARACTERIZACAO"."FL_PARCEIRO_SEXUAL"'
      '      ,"CARACTERIZACAO"."FL_PRESERVATIVO"'
      '      ,"CARACTERIZACAO"."FL_PRESERVATIVO_NAO_REGULAR"'
      '      ,"CARACTERIZACAO"."FL_TESTE"'
      '      ,"CARACTERIZACAO"."CD_TESTE"'
      '      ,"CARACTERIZACAO"."DS_TESTE"'
      '      ,"CARACTERIZACAO"."DT_TESTE"'
      '      ,"CARACTERIZACAO"."FL_TESTE_RECENTES"'
      '      ,"CARACTERIZACAO"."FL_TESTE_PARCEIROS"'
      '      ,"CARACTERIZACAO"."FL_ITS"'
      '      ,"CARACTERIZACAO"."CD_SINTOMAS_ITS"'
      '      ,"CARACTERIZACAO"."DS_SINTOMAS_ITS"'
      '      ,"CARACTERIZACAO"."FL_TESTE_HOJE"'
      '      ,"CARACTERIZACAO"."FL_TESTE_RESULTADOS"'
      '      ,"CARACTERIZACAO"."FL_PARCEIROS_RESULTADOS"'
      '      ,"CARACTERIZACAO"."FL_REVELAR"'
      '      ,"CARACTERIZACAO"."CD_REVELAR"'
      '      ,"CARACTERIZACAO"."DS_REVELAR"'
      '      ,"CARACTERIZACAO"."FL_PLANO_REDUCAO"'
      '      ,"CARACTERIZACAO"."CD_PLANO_REDUCAO"'
      '      ,"CARACTERIZACAO"."DS_PLANO_REDUCAO"'
      '      ,"CARACTERIZACAO"."FL_RECEBEU_PRESERVATIVOS"'
      '      ,"CARACTERIZACAO"."FL_TRANSFERENCIA"'
      '      ,"CARACTERIZACAO"."CD_TRANSFERENCIA"'
      '      ,"CARACTERIZACAO"."DS_TRANSFERENCIA"'
      '      ,"CARACTERIZACAO"."FL_SERVICO_SAUDE"'
      '      ,"CARACTERIZACAO"."CD_UND",'
      '(SELECT DS_PROVINCIA FROM PROVINCIA'
      'WHERE CD_PROVINCIA = CARACTERIZACAO.CD_PROVINCIA)DS_PROVINCIA,'
      '(SELECT DS_MUNICIPIO FROM MUNICIPIO'
      'WHERE CD_MUNICIPIO = CARACTERIZACAO.CD_MUNICIPIO)DS_MUNICIPIO,'
      '(SELECT DS_UNIDADE FROM UNIDADE'
      'WHERE CD_UNIDADE = CARACTERIZACAO.CD_UNIDADE)DS_UNIDADE,'
      '(SELECT NM_INVESTIGADOR FROM INVESTIGADOR'
      
        'WHERE CD_INVESTIGADOR = CARACTERIZACAO.CD_INVESTIGADOR)DS_INVEST' +
        'IGADOR'
      'from "CARACTERIZACAO"'
      'where CD_CARACTERIZACAO =:CD_CARACTERIZACAO ')
    ModifySQL.Strings = (
      'update "CARACTERIZACAO"'
      'set'
      ' "CD_CARACTERIZACAO" = :"CD_CARACTERIZACAO"'
      ', "CD_PROVINCIA" = :"CD_PROVINCIA"'
      ', "CD_MUNICIPIO" = :"CD_MUNICIPIO"'
      ', "CD_UNIDADE" = :"CD_UNIDADE"'
      ', "CD_LOCAL" = :"CD_LOCAL"'
      ', "CD_UTENTE" = :"CD_UTENTE"'
      ', "CD_PACIENTE" = :"CD_PACIENTE"'
      ', "CD_INVESTIGADOR" = :"CD_INVESTIGADOR"'
      ', "DT_VISITA" = :"DT_VISITA"'
      ', "FL_SEXO" = :"FL_SEXO"'
      ', "NR_IDADE" = :"NR_IDADE"'
      ', "TP_SESSAO" = :"TP_SESSAO"'
      ', "CD_ESTADO_CIVIL" = :"CD_ESTADO_CIVIL"'
      ', "NR_FILHOS" = :"NR_FILHOS"'
      ', "FL_GESTANTE" = :"FL_GESTANTE"'
      ', "NR_SEMANAS_GESTANTE" = :"NR_SEMANAS_GESTANTE"'
      ', "FL_AMAMENTA" = :"FL_AMAMENTA"'
      ', "CD_ESCOLARIDADE" = :"CD_ESCOLARIDADE"'
      ', "DS_ESCORALIDADE" = :"DS_ESCORALIDADE"'
      ', "CD_OCUPACAO" = :"CD_OCUPACAO"'
      ', "DS_OCUPACAO" = :"DS_OCUPACAO"'
      ', "FL_EMPREGADA" = :"FL_EMPREGADA"'
      ', "FL_OUVIU_FALAR" = :"FL_OUVIU_FALAR"'
      ', "CD_RAZAO" = :"CD_RAZAO"'
      ', "DS_RAZAO" = :"DS_RAZAO"'
      ', "CD_INDICACAO" = :"CD_INDICACAO"'
      ', "DS_INDICACAO" = :"DS_INDICACAO"'
      ', "FL_TRANSFUSAO" = :"FL_TRANSFUSAO"'
      ', "FL_TATUAGEM" = :"FL_TATUAGEM"'
      ', "FL_CIRURGIA" = :"FL_CIRURGIA"'
      ', "FL_CIRCUNCISAO" = :"FL_CIRCUNCISAO"'
      ', "NR_PARTOS" = :"NR_PARTOS"'
      ', "NR_ABORTOS" = :"NR_ABORTOS"'
      ', "FL_AMAMENTOU_OUTROS" = :"FL_AMAMENTOU_OUTROS"'
      ', "NR_IDADE_EXPERIENCIA" = :"NR_IDADE_EXPERIENCIA"'
      ', "FL_SEXO_ALCOOL" = :"FL_SEXO_ALCOOL"'
      ', "FL_SEXO_DROGAS" = :"FL_SEXO_DROGAS"'
      ', "FL_SEXO_DINHEIRO" = :"FL_SEXO_DINHEIRO"'
      ', "FL_SEXO_MATERIAL" = :"FL_SEXO_MATERIAL"'
      ', "FL_SINAIS_ITS" = :"FL_SINAIS_ITS"'
      ', "CD_SINAIS_ITS" = :"CD_SINAIS_ITS"'
      ', "DS_SINAIS_ITS" = :"DS_SINAIS_ITS"'
      ', "NR_PARCEIROS_SEXUAIS" = :"NR_PARCEIROS_SEXUAIS"'
      ', "FL_PARCEIRO_SEXUAL" = :"FL_PARCEIRO_SEXUAL"'
      ', "FL_PRESERVATIVO" = :"FL_PRESERVATIVO"'
      ', "FL_PRESERVATIVO_NAO_REGULAR" = :"FL_PRESERVATIVO_NAO_REGULAR"'
      ', "FL_TESTE" = :"FL_TESTE"'
      ', "CD_TESTE" = :"CD_TESTE"'
      ', "DS_TESTE" = :"DS_TESTE"'
      ', "DT_TESTE" = :"DT_TESTE"'
      ', "FL_TESTE_RECENTES" = :"FL_TESTE_RECENTES"'
      ', "FL_TESTE_PARCEIROS" = :"FL_TESTE_PARCEIROS"'
      ', "FL_ITS" = :"FL_ITS"'
      ', "CD_SINTOMAS_ITS" = :"CD_SINTOMAS_ITS"'
      ', "DS_SINTOMAS_ITS" = :"DS_SINTOMAS_ITS"'
      ', "FL_TESTE_HOJE" = :"FL_TESTE_HOJE"'
      ', "FL_TESTE_RESULTADOS" = :"FL_TESTE_RESULTADOS"'
      ', "FL_PARCEIROS_RESULTADOS" = :"FL_PARCEIROS_RESULTADOS"'
      ', "FL_REVELAR" = :"FL_REVELAR"'
      ', "CD_REVELAR" = :"CD_REVELAR"'
      ', "DS_REVELAR" = :"DS_REVELAR"'
      ', "FL_PLANO_REDUCAO" = :"FL_PLANO_REDUCAO"'
      ', "CD_PLANO_REDUCAO" = :"CD_PLANO_REDUCAO"'
      ', "DS_PLANO_REDUCAO" = :"DS_PLANO_REDUCAO"'
      ', "FL_RECEBEU_PRESERVATIVOS" = :"FL_RECEBEU_PRESERVATIVOS"'
      ', "FL_TRANSFERENCIA" = :"FL_TRANSFERENCIA"'
      ', "CD_TRANSFERENCIA" = :"CD_TRANSFERENCIA"'
      ', "DS_TRANSFERENCIA" = :"DS_TRANSFERENCIA"'
      ', "FL_SERVICO_SAUDE" = :"FL_SERVICO_SAUDE"'
      ', "CD_UND" = :"CD_UND"'
      'where'
      '  "CD_CARACTERIZACAO" = :"OLD_CD_CARACTERIZACAO"')
    GeneratorField.Field = 'CD_CARACTERIZACAO'
    GeneratorField.Generator = 'GEN_CARACTERIZACAO'
    GeneratorField.ApplyEvent = gamOnPost
    Left = 488
    Top = 507
    object TB_CARACTERIZACAOCD_CARACTERIZACAO: TIntegerField
      FieldName = 'CD_CARACTERIZACAO'
      Origin = 'CARACTERIZACAO.CD_CARACTERIZACAO'
      Required = True
    end
    object TB_CARACTERIZACAOCD_PROVINCIA: TIntegerField
      FieldName = 'CD_PROVINCIA'
      Origin = 'CARACTERIZACAO.CD_PROVINCIA'
    end
    object TB_CARACTERIZACAOCD_MUNICIPIO: TIntegerField
      FieldName = 'CD_MUNICIPIO'
      Origin = 'CARACTERIZACAO.CD_MUNICIPIO'
    end
    object TB_CARACTERIZACAOCD_UNIDADE: TIntegerField
      FieldName = 'CD_UNIDADE'
      Origin = 'CARACTERIZACAO.CD_UNIDADE'
    end
    object TB_CARACTERIZACAOCD_LOCAL: TIntegerField
      FieldName = 'CD_LOCAL'
      Origin = 'CARACTERIZACAO.CD_LOCAL'
    end
    object TB_CARACTERIZACAOCD_UTENTE: TIntegerField
      FieldName = 'CD_UTENTE'
      Origin = 'CARACTERIZACAO.CD_UTENTE'
    end
    object TB_CARACTERIZACAOCD_INVESTIGADOR: TIntegerField
      FieldName = 'CD_INVESTIGADOR'
      Origin = 'CARACTERIZACAO.CD_INVESTIGADOR'
    end
    object TB_CARACTERIZACAODT_VISITA: TDateTimeField
      FieldName = 'DT_VISITA'
      Origin = 'CARACTERIZACAO.DT_VISITA'
    end
    object TB_CARACTERIZACAOFL_SEXO: TIntegerField
      FieldName = 'FL_SEXO'
      Origin = 'CARACTERIZACAO.FL_SEXO'
    end
    object TB_CARACTERIZACAONR_IDADE: TIntegerField
      FieldName = 'NR_IDADE'
      Origin = 'CARACTERIZACAO.NR_IDADE'
    end
    object TB_CARACTERIZACAOTP_SESSAO: TIntegerField
      FieldName = 'TP_SESSAO'
      Origin = 'CARACTERIZACAO.TP_SESSAO'
    end
    object TB_CARACTERIZACAOCD_ESTADO_CIVIL: TIntegerField
      FieldName = 'CD_ESTADO_CIVIL'
      Origin = 'CARACTERIZACAO.CD_ESTADO_CIVIL'
    end
    object TB_CARACTERIZACAONR_FILHOS: TIntegerField
      FieldName = 'NR_FILHOS'
      Origin = 'CARACTERIZACAO.NR_FILHOS'
    end
    object TB_CARACTERIZACAOFL_GESTANTE: TIntegerField
      FieldName = 'FL_GESTANTE'
      Origin = 'CARACTERIZACAO.FL_GESTANTE'
    end
    object TB_CARACTERIZACAONR_SEMANAS_GESTANTE: TIntegerField
      FieldName = 'NR_SEMANAS_GESTANTE'
      Origin = 'CARACTERIZACAO.NR_SEMANAS_GESTANTE'
    end
    object TB_CARACTERIZACAOFL_AMAMENTA: TIntegerField
      FieldName = 'FL_AMAMENTA'
      Origin = 'CARACTERIZACAO.FL_AMAMENTA'
    end
    object TB_CARACTERIZACAOCD_ESCOLARIDADE: TIntegerField
      FieldName = 'CD_ESCOLARIDADE'
      Origin = 'CARACTERIZACAO.CD_ESCOLARIDADE'
    end
    object TB_CARACTERIZACAODS_ESCORALIDADE: TIBStringField
      FieldName = 'DS_ESCORALIDADE'
      Origin = 'CARACTERIZACAO.DS_ESCORALIDADE'
      Size = 50
    end
    object TB_CARACTERIZACAOCD_OCUPACAO: TIntegerField
      FieldName = 'CD_OCUPACAO'
      Origin = 'CARACTERIZACAO.CD_OCUPACAO'
    end
    object TB_CARACTERIZACAODS_OCUPACAO: TIBStringField
      FieldName = 'DS_OCUPACAO'
      Origin = 'CARACTERIZACAO.DS_OCUPACAO'
      Size = 50
    end
    object TB_CARACTERIZACAOFL_EMPREGADA: TIntegerField
      FieldName = 'FL_EMPREGADA'
      Origin = 'CARACTERIZACAO.FL_EMPREGADA'
    end
    object TB_CARACTERIZACAOFL_OUVIU_FALAR: TIntegerField
      FieldName = 'FL_OUVIU_FALAR'
      Origin = 'CARACTERIZACAO.FL_OUVIU_FALAR'
    end
    object TB_CARACTERIZACAOCD_RAZAO: TIntegerField
      FieldName = 'CD_RAZAO'
      Origin = 'CARACTERIZACAO.CD_RAZAO'
    end
    object TB_CARACTERIZACAODS_RAZAO: TIBStringField
      FieldName = 'DS_RAZAO'
      Origin = 'CARACTERIZACAO.DS_RAZAO'
      Size = 100
    end
    object TB_CARACTERIZACAOCD_INDICACAO: TIntegerField
      FieldName = 'CD_INDICACAO'
      Origin = 'CARACTERIZACAO.CD_INDICACAO'
    end
    object TB_CARACTERIZACAODS_INDICACAO: TIBStringField
      FieldName = 'DS_INDICACAO'
      Origin = 'CARACTERIZACAO.DS_INDICACAO'
      Size = 100
    end
    object TB_CARACTERIZACAOFL_TRANSFUSAO: TIntegerField
      FieldName = 'FL_TRANSFUSAO'
      Origin = 'CARACTERIZACAO.FL_TRANSFUSAO'
    end
    object TB_CARACTERIZACAOFL_TATUAGEM: TIntegerField
      FieldName = 'FL_TATUAGEM'
      Origin = 'CARACTERIZACAO.FL_TATUAGEM'
    end
    object TB_CARACTERIZACAOFL_CIRURGIA: TIntegerField
      FieldName = 'FL_CIRURGIA'
      Origin = 'CARACTERIZACAO.FL_CIRURGIA'
    end
    object TB_CARACTERIZACAOFL_CIRCUNCISAO: TIntegerField
      FieldName = 'FL_CIRCUNCISAO'
      Origin = 'CARACTERIZACAO.FL_CIRCUNCISAO'
    end
    object TB_CARACTERIZACAONR_PARTOS: TIntegerField
      FieldName = 'NR_PARTOS'
      Origin = 'CARACTERIZACAO.NR_PARTOS'
    end
    object TB_CARACTERIZACAONR_ABORTOS: TIntegerField
      FieldName = 'NR_ABORTOS'
      Origin = 'CARACTERIZACAO.NR_ABORTOS'
    end
    object TB_CARACTERIZACAOFL_AMAMENTOU_OUTROS: TIntegerField
      FieldName = 'FL_AMAMENTOU_OUTROS'
      Origin = 'CARACTERIZACAO.FL_AMAMENTOU_OUTROS'
    end
    object TB_CARACTERIZACAONR_IDADE_EXPERIENCIA: TIntegerField
      FieldName = 'NR_IDADE_EXPERIENCIA'
      Origin = 'CARACTERIZACAO.NR_IDADE_EXPERIENCIA'
    end
    object TB_CARACTERIZACAOFL_SEXO_ALCOOL: TIntegerField
      FieldName = 'FL_SEXO_ALCOOL'
      Origin = 'CARACTERIZACAO.FL_SEXO_ALCOOL'
    end
    object TB_CARACTERIZACAOFL_SEXO_DROGAS: TIntegerField
      FieldName = 'FL_SEXO_DROGAS'
      Origin = 'CARACTERIZACAO.FL_SEXO_DROGAS'
    end
    object TB_CARACTERIZACAOFL_SEXO_DINHEIRO: TIntegerField
      FieldName = 'FL_SEXO_DINHEIRO'
      Origin = 'CARACTERIZACAO.FL_SEXO_DINHEIRO'
    end
    object TB_CARACTERIZACAOFL_SEXO_MATERIAL: TIntegerField
      FieldName = 'FL_SEXO_MATERIAL'
      Origin = 'CARACTERIZACAO.FL_SEXO_MATERIAL'
    end
    object TB_CARACTERIZACAOFL_SINAIS_ITS: TIntegerField
      FieldName = 'FL_SINAIS_ITS'
      Origin = 'CARACTERIZACAO.FL_SINAIS_ITS'
    end
    object TB_CARACTERIZACAOCD_SINAIS_ITS: TIntegerField
      FieldName = 'CD_SINAIS_ITS'
      Origin = 'CARACTERIZACAO.CD_SINAIS_ITS'
    end
    object TB_CARACTERIZACAODS_SINAIS_ITS: TIBStringField
      FieldName = 'DS_SINAIS_ITS'
      Origin = 'CARACTERIZACAO.DS_SINAIS_ITS'
      Size = 30
    end
    object TB_CARACTERIZACAONR_PARCEIROS_SEXUAIS: TIntegerField
      FieldName = 'NR_PARCEIROS_SEXUAIS'
      Origin = 'CARACTERIZACAO.NR_PARCEIROS_SEXUAIS'
    end
    object TB_CARACTERIZACAOFL_PARCEIRO_SEXUAL: TIntegerField
      FieldName = 'FL_PARCEIRO_SEXUAL'
      Origin = 'CARACTERIZACAO.FL_PARCEIRO_SEXUAL'
    end
    object TB_CARACTERIZACAOFL_PRESERVATIVO: TIntegerField
      FieldName = 'FL_PRESERVATIVO'
      Origin = 'CARACTERIZACAO.FL_PRESERVATIVO'
    end
    object TB_CARACTERIZACAOFL_PRESERVATIVO_NAO_REGULAR: TIntegerField
      FieldName = 'FL_PRESERVATIVO_NAO_REGULAR'
      Origin = 'CARACTERIZACAO.FL_PRESERVATIVO_NAO_REGULAR'
    end
    object TB_CARACTERIZACAOFL_TESTE: TIntegerField
      FieldName = 'FL_TESTE'
      Origin = 'CARACTERIZACAO.FL_TESTE'
    end
    object TB_CARACTERIZACAOCD_TESTE: TIntegerField
      FieldName = 'CD_TESTE'
      Origin = 'CARACTERIZACAO.CD_TESTE'
    end
    object TB_CARACTERIZACAODS_TESTE: TIBStringField
      FieldName = 'DS_TESTE'
      Origin = 'CARACTERIZACAO.DS_TESTE'
      Size = 50
    end
    object TB_CARACTERIZACAODT_TESTE: TDateTimeField
      FieldName = 'DT_TESTE'
      Origin = 'CARACTERIZACAO.DT_TESTE'
    end
    object TB_CARACTERIZACAOFL_TESTE_RECENTES: TIntegerField
      FieldName = 'FL_TESTE_RECENTES'
      Origin = 'CARACTERIZACAO.FL_TESTE_RECENTES'
    end
    object TB_CARACTERIZACAOFL_TESTE_PARCEIROS: TIntegerField
      FieldName = 'FL_TESTE_PARCEIROS'
      Origin = 'CARACTERIZACAO.FL_TESTE_PARCEIROS'
    end
    object TB_CARACTERIZACAOFL_ITS: TIntegerField
      FieldName = 'FL_ITS'
      Origin = 'CARACTERIZACAO.FL_ITS'
    end
    object TB_CARACTERIZACAOCD_SINTOMAS_ITS: TIntegerField
      FieldName = 'CD_SINTOMAS_ITS'
      Origin = 'CARACTERIZACAO.CD_SINTOMAS_ITS'
    end
    object TB_CARACTERIZACAODS_SINTOMAS_ITS: TIBStringField
      FieldName = 'DS_SINTOMAS_ITS'
      Origin = 'CARACTERIZACAO.DS_SINTOMAS_ITS'
      Size = 30
    end
    object TB_CARACTERIZACAOFL_TESTE_HOJE: TIntegerField
      FieldName = 'FL_TESTE_HOJE'
      Origin = 'CARACTERIZACAO.FL_TESTE_HOJE'
    end
    object TB_CARACTERIZACAOFL_TESTE_RESULTADOS: TIntegerField
      FieldName = 'FL_TESTE_RESULTADOS'
      Origin = 'CARACTERIZACAO.FL_TESTE_RESULTADOS'
    end
    object TB_CARACTERIZACAOFL_PARCEIROS_RESULTADOS: TIntegerField
      FieldName = 'FL_PARCEIROS_RESULTADOS'
      Origin = 'CARACTERIZACAO.FL_PARCEIROS_RESULTADOS'
    end
    object TB_CARACTERIZACAOFL_REVELAR: TIntegerField
      FieldName = 'FL_REVELAR'
      Origin = 'CARACTERIZACAO.FL_REVELAR'
    end
    object TB_CARACTERIZACAOCD_REVELAR: TIntegerField
      FieldName = 'CD_REVELAR'
      Origin = 'CARACTERIZACAO.CD_REVELAR'
    end
    object TB_CARACTERIZACAODS_REVELAR: TIBStringField
      FieldName = 'DS_REVELAR'
      Origin = 'CARACTERIZACAO.DS_REVELAR'
      Size = 50
    end
    object TB_CARACTERIZACAOFL_PLANO_REDUCAO: TIntegerField
      FieldName = 'FL_PLANO_REDUCAO'
      Origin = 'CARACTERIZACAO.FL_PLANO_REDUCAO'
    end
    object TB_CARACTERIZACAOCD_PLANO_REDUCAO: TIntegerField
      FieldName = 'CD_PLANO_REDUCAO'
      Origin = 'CARACTERIZACAO.CD_PLANO_REDUCAO'
    end
    object TB_CARACTERIZACAODS_PLANO_REDUCAO: TIBStringField
      FieldName = 'DS_PLANO_REDUCAO'
      Origin = 'CARACTERIZACAO.DS_PLANO_REDUCAO'
      Size = 50
    end
    object TB_CARACTERIZACAOFL_RECEBEU_PRESERVATIVOS: TIntegerField
      FieldName = 'FL_RECEBEU_PRESERVATIVOS'
      Origin = 'CARACTERIZACAO.FL_RECEBEU_PRESERVATIVOS'
    end
    object TB_CARACTERIZACAOFL_TRANSFERENCIA: TIntegerField
      FieldName = 'FL_TRANSFERENCIA'
      Origin = 'CARACTERIZACAO.FL_TRANSFERENCIA'
    end
    object TB_CARACTERIZACAOCD_TRANSFERENCIA: TIntegerField
      FieldName = 'CD_TRANSFERENCIA'
      Origin = 'CARACTERIZACAO.CD_TRANSFERENCIA'
    end
    object TB_CARACTERIZACAODS_TRANSFERENCIA: TIBStringField
      FieldName = 'DS_TRANSFERENCIA'
      Origin = 'CARACTERIZACAO.DS_TRANSFERENCIA'
      Size = 100
    end
    object TB_CARACTERIZACAODS_PROVINCIA: TIBStringField
      FieldName = 'DS_PROVINCIA'
      Size = 50
    end
    object TB_CARACTERIZACAODS_MUNICIPIO: TIBStringField
      FieldName = 'DS_MUNICIPIO'
      Size = 50
    end
    object TB_CARACTERIZACAODS_UNIDADE: TIBStringField
      FieldName = 'DS_UNIDADE'
      Size = 50
    end
    object TB_CARACTERIZACAODS_INVESTIGADOR: TIBStringField
      FieldName = 'DS_INVESTIGADOR'
      Size = 50
    end
    object TB_CARACTERIZACAOFL_SERVICO_SAUDE: TIntegerField
      FieldName = 'FL_SERVICO_SAUDE'
      Origin = 'CARACTERIZACAO.FL_SERVICO_SAUDE'
    end
    object TB_CARACTERIZACAOCD_UND: TIntegerField
      FieldName = 'CD_UND'
      Origin = 'CARACTERIZACAO.CD_UND'
      Required = True
    end
    object TB_CARACTERIZACAOCD_PACIENTE: TIntegerField
      FieldName = 'CD_PACIENTE'
      Origin = 'CARACTERIZACAO.CD_PACIENTE'
    end
  end
  object TB_PROGRAMA: TIBDataSet
    Database = DM.DB
    Transaction = DM.TS
    AfterDelete = TB_PROGRAMAAfterDelete
    AfterInsert = TB_PROGRAMAAfterInsert
    BeforePost = TB_PROGRAMABeforePost
    BufferChunks = 1000
    CachedUpdates = False
    DeleteSQL.Strings = (
      'delete from "REGISTRO_PROGRAMA"'
      'where  "REGISTRO_PROGRAMA"."CD_UNIDADE" = :CD_UNIDADE'
      'and      "REGISTRO_PROGRAMA"."CD_PROVINCIA" = :CD_PROVINCIA'
      'and      "REGISTRO_PROGRAMA"."CD_MUNICIPIO" = :CD_MUNICIPIO'
      'and      "REGISTRO_PROGRAMA"."VL_MESANO" = :VL_MESANO')
    InsertSQL.Strings = (
      'insert into "REGISTRO_PROGRAMA"'
      '('
      '  "CD_REGISTRO_PROGRAMA"'
      ', "CD_UND"'
      ', "DT_REGISTRO"'
      ', "CD_UNIDADE"'
      ', "CD_PROVINCIA"'
      ', "CD_MUNICIPIO"'
      ', "VL_MESANO"'
      ', "VL_ACONSELHADOS"'
      ', "VL_POSITIVOS"'
      ', "VL_NEGATIVOS"'
      ', "VL_INDETERMINADOS"'
      ', "ID_FAIXA_ETARIA_1"'
      ', "FL_SEXO"'
      ', "FL_GESTANTE"'
      ', "VL_X_1"'
      ', "VL_Y_1"'
      ', "VL_FEMININO_2"'
      ', "VL_MASCULINO_2"'
      ', "ID_FAIXA_ETARIA_2"'
      ', "VL_X_2"'
      ', "VL_Y_2"'
      ', "VL_GESTANTE_3"'
      ', "VL_POS_PARTO_3"'
      ', "VL_PARTOS_3"'
      ', "VL_X_3"'
      ', "VL_Y_3"'
      ', "VL_REGISTRAD0S_4"'
      ', "VL_TARV_4"'
      ', "VL_X_4"'
      ', "VL_Y_4"'
      ', "VL_REGISTRADOS_51"'
      ', "VL_TARV_51"'
      ', "VL_X_51"'
      ', "VL_Y_51"'
      ', "ID_FAIXA_ETARIA_52"'
      ', "VL_FEMININO_52"'
      ', "VL_MASCULINO_52"'
      ', "VL_X_52"'
      ', "VL_Y_52"'
      ', "VL_NR1_53"'
      ', "VL_NR2_53"'
      ', "VL_X_53"'
      ', "VL_Y_53"'
      ', "VL_FEMININO_54"'
      ', "VL_MASCULINO_54"'
      ', "VL_X_54"'
      ', "VL_Y_54"'
      ', "VL_FEMININO_6"'
      ', "VL_MASCULINO_6"'
      ', "VL_X_6"'
      ', "VL_Y_6"'
      ', "VL_ESQUEMA1_53"'
      ', "VL_ESQUEMA2_53"'
      ', "ID_FAIXA_ETARIA_3"'
      ', "CD_USU_INCLUSAO"'
      ', "DT_INCLUSAO"'
      ', "CD_USU_ALTERACAO"'
      ', "DT_ALTERACAO"'
      ', "CD_REGISTRO_GERAL"'
      ', "CD_USU_EXCLUSAO"'
      ', "NM_USU"'
      ', "VL_VERSAO"'
      ')'
      'values'
      '('
      '  :"CD_REGISTRO_PROGRAMA"'
      ', :"CD_UND"'
      ', :"DT_REGISTRO"'
      ', :"CD_UNIDADE"'
      ', :"CD_PROVINCIA"'
      ', :"CD_MUNICIPIO"'
      ', :"VL_MESANO"'
      ', :"VL_ACONSELHADOS"'
      ', :"VL_POSITIVOS"'
      ', :"VL_NEGATIVOS"'
      ', :"VL_INDETERMINADOS"'
      ', :"ID_FAIXA_ETARIA_1"'
      ', :"FL_SEXO"'
      ', :"FL_GESTANTE"'
      ', :"VL_X_1"'
      ', :"VL_Y_1"'
      ', :"VL_FEMININO_2"'
      ', :"VL_MASCULINO_2"'
      ', :"ID_FAIXA_ETARIA_2"'
      ', :"VL_X_2"'
      ', :"VL_Y_2"'
      ', :"VL_GESTANTE_3"'
      ', :"VL_POS_PARTO_3"'
      ', :"VL_PARTOS_3"'
      ', :"VL_X_3"'
      ', :"VL_Y_3"'
      ', :"VL_REGISTRAD0S_4"'
      ', :"VL_TARV_4"'
      ', :"VL_X_4"'
      ', :"VL_Y_4"'
      ', :"VL_REGISTRADOS_51"'
      ', :"VL_TARV_51"'
      ', :"VL_X_51"'
      ', :"VL_Y_51"'
      ', :"ID_FAIXA_ETARIA_52"'
      ', :"VL_FEMININO_52"'
      ', :"VL_MASCULINO_52"'
      ', :"VL_X_52"'
      ', :"VL_Y_52"'
      ', :"VL_NR1_53"'
      ', :"VL_NR2_53"'
      ', :"VL_X_53"'
      ', :"VL_Y_53"'
      ', :"VL_FEMININO_54"'
      ', :"VL_MASCULINO_54"'
      ', :"VL_X_54"'
      ', :"VL_Y_54"'
      ', :"VL_FEMININO_6"'
      ', :"VL_MASCULINO_6"'
      ', :"VL_X_6"'
      ', :"VL_Y_6"'
      ', :"VL_ESQUEMA1_53"'
      ', :"VL_ESQUEMA2_53"'
      ', :"ID_FAIXA_ETARIA_3"'
      ', :"CD_USU_INCLUSAO"'
      ', :"DT_INCLUSAO"'
      ', :"CD_USU_ALTERACAO"'
      ', :"DT_ALTERACAO"'
      ', :"CD_REGISTRO_GERAL"'
      ', :"CD_USU_EXCLUSAO"'
      ', :"NM_USU"'
      ', :"VL_VERSAO"'
      ')')
    SelectSQL.Strings = (
      'select "REGISTRO_PROGRAMA"."CD_REGISTRO_PROGRAMA"'
      '      ,"REGISTRO_PROGRAMA"."CD_UND"'
      '      ,"REGISTRO_PROGRAMA"."DT_REGISTRO"'
      '      ,"REGISTRO_PROGRAMA"."CD_UNIDADE"'
      '      ,"REGISTRO_PROGRAMA"."CD_PROVINCIA"'
      '      ,"REGISTRO_PROGRAMA"."CD_MUNICIPIO"'
      '      ,"REGISTRO_PROGRAMA"."VL_MESANO"'
      '      ,"REGISTRO_PROGRAMA"."VL_ACONSELHADOS"'
      '      ,"REGISTRO_PROGRAMA"."VL_POSITIVOS"'
      '      ,"REGISTRO_PROGRAMA"."VL_NEGATIVOS"'
      '      ,"REGISTRO_PROGRAMA"."VL_INDETERMINADOS"'
      '      ,"REGISTRO_PROGRAMA"."ID_FAIXA_ETARIA_1"'
      '      ,"REGISTRO_PROGRAMA"."FL_SEXO"'
      '      ,"REGISTRO_PROGRAMA"."FL_GESTANTE"'
      '      ,"REGISTRO_PROGRAMA"."VL_X_1"'
      '      ,"REGISTRO_PROGRAMA"."VL_Y_1"'
      '      ,"REGISTRO_PROGRAMA"."VL_FEMININO_2"'
      '      ,"REGISTRO_PROGRAMA"."VL_MASCULINO_2"'
      '      ,"REGISTRO_PROGRAMA"."ID_FAIXA_ETARIA_2"'
      '      ,"REGISTRO_PROGRAMA"."VL_X_2"'
      '      ,"REGISTRO_PROGRAMA"."VL_Y_2"'
      '      ,"REGISTRO_PROGRAMA"."VL_GESTANTE_3"'
      '      ,"REGISTRO_PROGRAMA"."VL_POS_PARTO_3"'
      '      ,"REGISTRO_PROGRAMA"."VL_PARTOS_3"'
      '      ,"REGISTRO_PROGRAMA"."VL_X_3"'
      '      ,"REGISTRO_PROGRAMA"."VL_Y_3"'
      '      ,"REGISTRO_PROGRAMA"."VL_REGISTRAD0S_4"'
      '      ,"REGISTRO_PROGRAMA"."VL_TARV_4"'
      '      ,"REGISTRO_PROGRAMA"."VL_X_4"'
      '      ,"REGISTRO_PROGRAMA"."VL_Y_4"'
      '      ,"REGISTRO_PROGRAMA"."VL_REGISTRADOS_51"'
      '      ,"REGISTRO_PROGRAMA"."VL_TARV_51"'
      '      ,"REGISTRO_PROGRAMA"."VL_X_51"'
      '      ,"REGISTRO_PROGRAMA"."VL_Y_51"'
      '      ,"REGISTRO_PROGRAMA"."ID_FAIXA_ETARIA_52"'
      '      ,"REGISTRO_PROGRAMA"."VL_FEMININO_52"'
      '      ,"REGISTRO_PROGRAMA"."VL_MASCULINO_52"'
      '      ,"REGISTRO_PROGRAMA"."VL_X_52"'
      '      ,"REGISTRO_PROGRAMA"."VL_Y_52"'
      '      ,"REGISTRO_PROGRAMA"."VL_NR1_53"'
      '      ,"REGISTRO_PROGRAMA"."VL_NR2_53"'
      '      ,"REGISTRO_PROGRAMA"."VL_X_53"'
      '      ,"REGISTRO_PROGRAMA"."VL_Y_53"'
      '      ,"REGISTRO_PROGRAMA"."VL_FEMININO_54"'
      '      ,"REGISTRO_PROGRAMA"."VL_MASCULINO_54"'
      '      ,"REGISTRO_PROGRAMA"."VL_X_54"'
      '      ,"REGISTRO_PROGRAMA"."VL_Y_54"'
      '      ,"REGISTRO_PROGRAMA"."VL_FEMININO_6"'
      '      ,"REGISTRO_PROGRAMA"."VL_MASCULINO_6"'
      '      ,"REGISTRO_PROGRAMA"."VL_X_6"'
      '      ,"REGISTRO_PROGRAMA"."VL_Y_6"'
      '      ,"REGISTRO_PROGRAMA"."VL_ESQUEMA1_53"'
      '      ,"REGISTRO_PROGRAMA"."VL_ESQUEMA2_53"'
      '      ,"REGISTRO_PROGRAMA"."ID_FAIXA_ETARIA_3"'
      '      ,"REGISTRO_PROGRAMA"."CD_REGISTRO_GERAL"'
      '      ,"REGISTRO_PROGRAMA"."NM_USU"'
      '      ,"REGISTRO_PROGRAMA"."VL_VERSAO"'
      '/*CAMPOS*/'
      'from "REGISTRO_PROGRAMA"'
      'where  "REGISTRO_PROGRAMA"."CD_UNIDADE" = :CD_UNIDADE'
      'and      "REGISTRO_PROGRAMA"."CD_PROVINCIA" = :CD_PROVINCIA'
      'and      "REGISTRO_PROGRAMA"."CD_MUNICIPIO" = :CD_MUNICIPIO'
      'and      "REGISTRO_PROGRAMA"."VL_MESANO" = :VL_MESANO')
    ModifySQL.Strings = (
      'update "REGISTRO_PROGRAMA"'
      'set'
      ' "CD_REGISTRO_PROGRAMA" = :"CD_REGISTRO_PROGRAMA"'
      ', "CD_UND" = :"CD_UND"'
      ', "DT_REGISTRO" = :"DT_REGISTRO"'
      ', "CD_UNIDADE" = :"CD_UNIDADE"'
      ', "CD_PROVINCIA" = :"CD_PROVINCIA"'
      ', "CD_MUNICIPIO" = :"CD_MUNICIPIO"'
      ', "VL_MESANO" = :"VL_MESANO"'
      ', "VL_ACONSELHADOS" = :"VL_ACONSELHADOS"'
      ', "VL_POSITIVOS" = :"VL_POSITIVOS"'
      ', "VL_NEGATIVOS" = :"VL_NEGATIVOS"'
      ', "VL_INDETERMINADOS" = :"VL_INDETERMINADOS"'
      ', "ID_FAIXA_ETARIA_1" = :"ID_FAIXA_ETARIA_1"'
      ', "FL_SEXO" = :"FL_SEXO"'
      ', "FL_GESTANTE" = :"FL_GESTANTE"'
      ', "VL_X_1" = :"VL_X_1"'
      ', "VL_Y_1" = :"VL_Y_1"'
      ', "VL_FEMININO_2" = :"VL_FEMININO_2"'
      ', "VL_MASCULINO_2" = :"VL_MASCULINO_2"'
      ', "ID_FAIXA_ETARIA_2" = :"ID_FAIXA_ETARIA_2"'
      ', "VL_X_2" = :"VL_X_2"'
      ', "VL_Y_2" = :"VL_Y_2"'
      ', "VL_GESTANTE_3" = :"VL_GESTANTE_3"'
      ', "VL_POS_PARTO_3" = :"VL_POS_PARTO_3"'
      ', "VL_PARTOS_3" = :"VL_PARTOS_3"'
      ', "VL_X_3" = :"VL_X_3"'
      ', "VL_Y_3" = :"VL_Y_3"'
      ', "VL_REGISTRAD0S_4" = :"VL_REGISTRAD0S_4"'
      ', "VL_TARV_4" = :"VL_TARV_4"'
      ', "VL_X_4" = :"VL_X_4"'
      ', "VL_Y_4" = :"VL_Y_4"'
      ', "VL_REGISTRADOS_51" = :"VL_REGISTRADOS_51"'
      ', "VL_TARV_51" = :"VL_TARV_51"'
      ', "VL_X_51" = :"VL_X_51"'
      ', "VL_Y_51" = :"VL_Y_51"'
      ', "ID_FAIXA_ETARIA_52" = :"ID_FAIXA_ETARIA_52"'
      ', "VL_FEMININO_52" = :"VL_FEMININO_52"'
      ', "VL_MASCULINO_52" = :"VL_MASCULINO_52"'
      ', "VL_X_52" = :"VL_X_52"'
      ', "VL_Y_52" = :"VL_Y_52"'
      ', "VL_NR1_53" = :"VL_NR1_53"'
      ', "VL_NR2_53" = :"VL_NR2_53"'
      ', "VL_X_53" = :"VL_X_53"'
      ', "VL_Y_53" = :"VL_Y_53"'
      ', "VL_FEMININO_54" = :"VL_FEMININO_54"'
      ', "VL_MASCULINO_54" = :"VL_MASCULINO_54"'
      ', "VL_X_54" = :"VL_X_54"'
      ', "VL_Y_54" = :"VL_Y_54"'
      ', "VL_FEMININO_6" = :"VL_FEMININO_6"'
      ', "VL_MASCULINO_6" = :"VL_MASCULINO_6"'
      ', "VL_X_6" = :"VL_X_6"'
      ', "VL_Y_6" = :"VL_Y_6"'
      ', "VL_ESQUEMA1_53" = :"VL_ESQUEMA1_53"'
      ', "VL_ESQUEMA2_53" = :"VL_ESQUEMA2_53"'
      ', "ID_FAIXA_ETARIA_3" = :"ID_FAIXA_ETARIA_3"'
      ', "CD_USU_INCLUSAO" = :"CD_USU_INCLUSAO"'
      ', "DT_INCLUSAO" = :"DT_INCLUSAO"'
      ', "CD_USU_ALTERACAO" = :"CD_USU_ALTERACAO"'
      ', "DT_ALTERACAO" = :"DT_ALTERACAO"'
      ', "CD_REGISTRO_GERAL" = :"CD_REGISTRO_GERAL"'
      ', "CD_USU_EXCLUSAO" = :"CD_USU_EXCLUSAO"'
      ', "NM_USU" = :"NM_USU"'
      ', "VL_VERSAO" = :"VL_VERSAO"'
      'where'
      '  "CD_REGISTRO_PROGRAMA" = :"OLD_CD_REGISTRO_PROGRAMA" and '
      '  "CD_UND" = :"OLD_CD_UND"')
    GeneratorField.Field = 'CD_REGISTRO_PROGRAMA'
    GeneratorField.Generator = 'GEN_REGISTRO_PROGRAMA'
    Left = 488
    Top = 563
  end
  object TB_COINFECCAO: TIBDataSet
    Database = DM.DB
    Transaction = DM.TS
    AfterInsert = TB_COINFECCAOAfterInsert
    BeforePost = TB_COINFECCAOBeforePost
    BufferChunks = 1000
    CachedUpdates = False
    DeleteSQL.Strings = (
      'delete from "REGISTRO_COINFECCAO"'
      'where  "REGISTRO_COINFECCAO"."CD_UNIDADE" = :CD_UNIDADE'
      'and      "REGISTRO_COINFECCAO"."CD_PROVINCIA" = :CD_PROVINCIA'
      'and      "REGISTRO_COINFECCAO"."CD_MUNICIPIO" = :CD_MUNICIPIO'
      'and      "REGISTRO_COINFECCAO"."VL_MESANO" = :VL_MESANO')
    InsertSQL.Strings = (
      'insert into "REGISTRO_COINFECCAO"'
      '('
      '  "CD_REGISTRO_COINFECCAO"'
      ', "CD_UND"'
      ', "DT_REGISTRO"'
      ', "CD_UNIDADE"'
      ', "CD_PROVINCIA"'
      ', "CD_MUNICIPIO"'
      ', "VL_MESANO"'
      ', "VL_VIH_POSITIVOS"'
      ', "VL_TRATAMENTO_ARVS"'
      ', "ID_FAIXA_ETARIA"'
      ', "FL_SEXO"'
      ', "FL_GESTANTE"'
      ', "VL_X"'
      ', "VL_Y"'
      ', "CD_USU_INCLUSAO"'
      ', "DT_INCLUSAO"'
      ', "CD_USU_ALTERACAO"'
      ', "DT_ALTERACAO"'
      ', "CD_REGISTRO_GERAL"'
      ', "NM_USU"'
      ', "VL_VERSAO"'
      ')'
      'values'
      '('
      '  :"CD_REGISTRO_COINFECCAO"'
      ', :"CD_UND"'
      ', :"DT_REGISTRO"'
      ', :"CD_UNIDADE"'
      ', :"CD_PROVINCIA"'
      ', :"CD_MUNICIPIO"'
      ', :"VL_MESANO"'
      ', :"VL_VIH_POSITIVOS"'
      ', :"VL_TRATAMENTO_ARVS"'
      ', :"ID_FAIXA_ETARIA"'
      ', :"FL_SEXO"'
      ', :"FL_GESTANTE"'
      ', :"VL_X"'
      ', :"VL_Y"'
      ', :"CD_USU_INCLUSAO"'
      ', :"DT_INCLUSAO"'
      ', :"CD_USU_ALTERACAO"'
      ', :"DT_ALTERACAO"'
      ', :"CD_REGISTRO_GERAL"'
      ', :"NM_USU"'
      ', :"VL_VERSAO"'
      ')')
    SelectSQL.Strings = (
      'select "REGISTRO_COINFECCAO"."CD_REGISTRO_COINFECCAO"'
      '      ,"REGISTRO_COINFECCAO"."CD_UND"'
      '      ,"REGISTRO_COINFECCAO"."DT_REGISTRO"'
      '      ,"REGISTRO_COINFECCAO"."CD_UNIDADE"'
      '      ,"REGISTRO_COINFECCAO"."CD_PROVINCIA"'
      '      ,"REGISTRO_COINFECCAO"."CD_MUNICIPIO"'
      '      ,"REGISTRO_COINFECCAO"."VL_MESANO"'
      '      ,"REGISTRO_COINFECCAO"."VL_VIH_POSITIVOS"'
      '      ,"REGISTRO_COINFECCAO"."VL_TRATAMENTO_ARVS"'
      '      ,"REGISTRO_COINFECCAO"."ID_FAIXA_ETARIA"'
      '      ,"REGISTRO_COINFECCAO"."FL_SEXO"'
      '      ,"REGISTRO_COINFECCAO"."FL_GESTANTE"'
      '      ,"REGISTRO_COINFECCAO"."VL_X"'
      '      ,"REGISTRO_COINFECCAO"."VL_Y"'
      '      ,"REGISTRO_COINFECCAO"."CD_REGISTRO_GERAL"'
      '      ,"REGISTRO_COINFECCAO"."NM_USU"'
      '      ,"REGISTRO_COINFECCAO"."VL_VERSAO"'
      '      ,"REGISTRO_COINFECCAO"."CD_USU_INCLUSAO"'
      '      ,"REGISTRO_COINFECCAO"."DT_INCLUSAO"'
      '      ,"REGISTRO_COINFECCAO"."CD_USU_ALTERACAO"'
      '      ,"REGISTRO_COINFECCAO"."DT_ALTERACAO"'
      'from "REGISTRO_COINFECCAO"'
      'where  "REGISTRO_COINFECCAO"."CD_UNIDADE" = :CD_UNIDADE'
      'and      "REGISTRO_COINFECCAO"."CD_PROVINCIA" = :CD_PROVINCIA'
      'and      "REGISTRO_COINFECCAO"."CD_MUNICIPIO" = :CD_MUNICIPIO'
      'and      "REGISTRO_COINFECCAO"."VL_MESANO" = :VL_MESANO'
      'order by'
      '"REGISTRO_COINFECCAO"."CD_REGISTRO_COINFECCAO"')
    ModifySQL.Strings = (
      'update "REGISTRO_COINFECCAO"'
      'set'
      ' "CD_REGISTRO_COINFECCAO" = :"CD_REGISTRO_COINFECCAO"'
      ', "CD_UND" = :"CD_UND"'
      ', "DT_REGISTRO" = :"DT_REGISTRO"'
      ', "CD_UNIDADE" = :"CD_UNIDADE"'
      ', "CD_PROVINCIA" = :"CD_PROVINCIA"'
      ', "CD_MUNICIPIO" = :"CD_MUNICIPIO"'
      ', "VL_MESANO" = :"VL_MESANO"'
      ', "VL_VIH_POSITIVOS" = :"VL_VIH_POSITIVOS"'
      ', "VL_TRATAMENTO_ARVS" = :"VL_TRATAMENTO_ARVS"'
      ', "ID_FAIXA_ETARIA" = :"ID_FAIXA_ETARIA"'
      ', "FL_SEXO" = :"FL_SEXO"'
      ', "FL_GESTANTE" = :"FL_GESTANTE"'
      ', "VL_X" = :"VL_X"'
      ', "VL_Y" = :"VL_Y"'
      ', "CD_USU_INCLUSAO" = :"CD_USU_INCLUSAO"'
      ', "DT_INCLUSAO" = :"DT_INCLUSAO"'
      ', "CD_USU_ALTERACAO" = :"CD_USU_ALTERACAO"'
      ', "DT_ALTERACAO" = :"DT_ALTERACAO"'
      ', "CD_REGISTRO_GERAL" = :"CD_REGISTRO_GERAL"'
      ', "NM_USU" = :"NM_USU"'
      ', "VL_VERSAO" = :"VL_VERSAO"'
      'where'
      '  "CD_REGISTRO_COINFECCAO" = :"OLD_CD_REGISTRO_COINFECCAO" and '
      '  "CD_UND" = :"OLD_CD_UND"')
    GeneratorField.Field = 'CD_REGISTRO_COINFECCAO'
    GeneratorField.Generator = 'GEN_REGISTRO_COINFECCAO'
    Left = 576
    Top = 491
    object TB_COINFECCAOCD_REGISTRO_COINFECCAO: TIntegerField
      FieldName = 'CD_REGISTRO_COINFECCAO'
      Origin = 'REGISTRO_COINFECCAO.CD_REGISTRO_COINFECCAO'
      Required = True
    end
    object TB_COINFECCAOCD_UND: TIntegerField
      FieldName = 'CD_UND'
      Origin = 'REGISTRO_COINFECCAO.CD_UND'
      Required = True
    end
    object TB_COINFECCAODT_REGISTRO: TDateTimeField
      FieldName = 'DT_REGISTRO'
      Origin = 'REGISTRO_COINFECCAO.DT_REGISTRO'
      Required = True
    end
    object TB_COINFECCAOCD_UNIDADE: TIntegerField
      FieldName = 'CD_UNIDADE'
      Origin = 'REGISTRO_COINFECCAO.CD_UNIDADE'
      Required = True
    end
    object TB_COINFECCAOCD_PROVINCIA: TIntegerField
      FieldName = 'CD_PROVINCIA'
      Origin = 'REGISTRO_COINFECCAO.CD_PROVINCIA'
      Required = True
    end
    object TB_COINFECCAOCD_MUNICIPIO: TIntegerField
      FieldName = 'CD_MUNICIPIO'
      Origin = 'REGISTRO_COINFECCAO.CD_MUNICIPIO'
      Required = True
    end
    object TB_COINFECCAOVL_MESANO: TIBStringField
      FieldName = 'VL_MESANO'
      Origin = 'REGISTRO_COINFECCAO.VL_MESANO'
      Required = True
      Size = 8
    end
    object TB_COINFECCAOVL_VIH_POSITIVOS: TIntegerField
      FieldName = 'VL_VIH_POSITIVOS'
      Origin = 'REGISTRO_COINFECCAO.VL_VIH_POSITIVOS'
    end
    object TB_COINFECCAOID_FAIXA_ETARIA: TIntegerField
      FieldName = 'ID_FAIXA_ETARIA'
      Origin = 'REGISTRO_COINFECCAO.ID_FAIXA_ETARIA'
    end
    object TB_COINFECCAOFL_SEXO: TIBStringField
      FieldName = 'FL_SEXO'
      Origin = 'REGISTRO_COINFECCAO.FL_SEXO'
      FixedChar = True
      Size = 1
    end
    object TB_COINFECCAOFL_GESTANTE: TIntegerField
      FieldName = 'FL_GESTANTE'
      Origin = 'REGISTRO_COINFECCAO.FL_GESTANTE'
    end
    object TB_COINFECCAOVL_X: TIntegerField
      FieldName = 'VL_X'
      Origin = 'REGISTRO_COINFECCAO.VL_X'
    end
    object TB_COINFECCAOVL_Y: TIntegerField
      FieldName = 'VL_Y'
      Origin = 'REGISTRO_COINFECCAO.VL_Y'
    end
    object TB_COINFECCAOVL_TRATAMENTO_ARVS: TIntegerField
      FieldName = 'VL_TRATAMENTO_ARVS'
      Origin = 'REGISTRO_COINFECCAO.VL_TRATAMENTO_ARVS'
    end
    object TB_COINFECCAOCD_REGISTRO_GERAL: TIntegerField
      FieldName = 'CD_REGISTRO_GERAL'
      Origin = 'REGISTRO_COINFECCAO.CD_REGISTRO_GERAL'
    end
    object TB_COINFECCAONM_USU: TIBStringField
      FieldName = 'NM_USU'
      Origin = 'REGISTRO_COINFECCAO.NM_USU'
      Size = 50
    end
    object TB_COINFECCAOVL_VERSAO: TIBStringField
      FieldName = 'VL_VERSAO'
      Origin = 'REGISTRO_COINFECCAO.VL_VERSAO'
    end
    object TB_COINFECCAOCD_USU_INCLUSAO: TIntegerField
      FieldName = 'CD_USU_INCLUSAO'
      Origin = 'REGISTRO_COINFECCAO.CD_USU_INCLUSAO'
    end
    object TB_COINFECCAODT_INCLUSAO: TDateTimeField
      FieldName = 'DT_INCLUSAO'
      Origin = 'REGISTRO_COINFECCAO.DT_INCLUSAO'
    end
    object TB_COINFECCAOCD_USU_ALTERACAO: TIntegerField
      FieldName = 'CD_USU_ALTERACAO'
      Origin = 'REGISTRO_COINFECCAO.CD_USU_ALTERACAO'
    end
    object TB_COINFECCAODT_ALTERACAO: TDateTimeField
      FieldName = 'DT_ALTERACAO'
      Origin = 'REGISTRO_COINFECCAO.DT_ALTERACAO'
    end
  end
  object TB_TARV_ESQUEMA: TIBDataSet
    Database = DM.DB
    Transaction = DM.TS
    AfterInsert = TB_TARV_ESQUEMAAfterInsert
    BeforePost = TB_TARV_ESQUEMABeforePost
    BufferChunks = 1000
    CachedUpdates = False
    DeleteSQL.Strings = (
      'delete from "REGISTRO_TARV_ESQUEMA"'
      'where  "REGISTRO_TARV_ESQUEMA"."CD_UNIDADE" = :CD_UNIDADE'
      'and      "REGISTRO_TARV_ESQUEMA"."CD_PROVINCIA" = :CD_PROVINCIA'
      'and      "REGISTRO_TARV_ESQUEMA"."CD_MUNICIPIO" = :CD_MUNICIPIO'
      'and      "REGISTRO_TARV_ESQUEMA"."VL_MESANO" = :VL_MESANO')
    InsertSQL.Strings = (
      'insert into "REGISTRO_TARV_ESQUEMA"'
      '('
      '  "CD_REGISTRO_TARV_ESQUEMA"'
      ', "CD_UND"'
      ', "DT_REGISTRO"'
      ', "CD_UNIDADE"'
      ', "CD_PROVINCIA"'
      ', "CD_MUNICIPIO"'
      ', "VL_MESANO"'
      ', "VL_ANTERIOR_CRIANCA"'
      ', "VL_ANTERIOR_ADULTO"'
      ', "VL_CORRENTE_CRIANCA"'
      ', "VL_CORRENTE_ADULTO"'
      ', "VL_ESQUEMA"'
      ', "VL_X"'
      ', "VL_Y"'
      ', "CD_USU_INCLUSAO"'
      ', "DT_INCLUSAO"'
      ', "CD_USU_ALTERACAO"'
      ', "DT_ALTERACAO"'
      ', "CD_REGISTRO_GERAL"'
      ', "NM_USU"'
      ', "VL_VERSAO"'
      ')'
      'values'
      '('
      '  :"CD_REGISTRO_TARV_ESQUEMA"'
      ', :"CD_UND"'
      ', :"DT_REGISTRO"'
      ', :"CD_UNIDADE"'
      ', :"CD_PROVINCIA"'
      ', :"CD_MUNICIPIO"'
      ', :"VL_MESANO"'
      ', :"VL_ANTERIOR_CRIANCA"'
      ', :"VL_ANTERIOR_ADULTO"'
      ', :"VL_CORRENTE_CRIANCA"'
      ', :"VL_CORRENTE_ADULTO"'
      ', :"VL_ESQUEMA"'
      ', :"VL_X"'
      ', :"VL_Y"'
      ', :"CD_USU_INCLUSAO"'
      ', :"DT_INCLUSAO"'
      ', :"CD_USU_ALTERACAO"'
      ', :"DT_ALTERACAO"'
      ', :"CD_REGISTRO_GERAL"'
      ', :"NM_USU"'
      ', :"VL_VERSAO"'
      ')')
    SelectSQL.Strings = (
      'select "REGISTRO_TARV_ESQUEMA"."CD_REGISTRO_TARV_ESQUEMA"'
      '      ,"REGISTRO_TARV_ESQUEMA"."CD_UND"'
      '      ,"REGISTRO_TARV_ESQUEMA"."DT_REGISTRO"'
      '      ,"REGISTRO_TARV_ESQUEMA"."CD_UNIDADE"'
      '      ,"REGISTRO_TARV_ESQUEMA"."CD_PROVINCIA"'
      '      ,"REGISTRO_TARV_ESQUEMA"."CD_MUNICIPIO"'
      '      ,"REGISTRO_TARV_ESQUEMA"."VL_MESANO"'
      '      ,"REGISTRO_TARV_ESQUEMA"."VL_ANTERIOR_CRIANCA"'
      '      ,"REGISTRO_TARV_ESQUEMA"."VL_ANTERIOR_ADULTO"'
      '      ,"REGISTRO_TARV_ESQUEMA"."VL_CORRENTE_CRIANCA"'
      '      ,"REGISTRO_TARV_ESQUEMA"."VL_CORRENTE_ADULTO"'
      '      ,"REGISTRO_TARV_ESQUEMA"."VL_ESQUEMA"'
      '      ,"REGISTRO_TARV_ESQUEMA"."VL_X"'
      '      ,"REGISTRO_TARV_ESQUEMA"."VL_Y"'
      '      ,"REGISTRO_TARV_ESQUEMA"."CD_REGISTRO_GERAL"'
      '      ,"REGISTRO_TARV_ESQUEMA"."NM_USU"'
      '      ,"REGISTRO_TARV_ESQUEMA"."VL_VERSAO"'
      '      ,"REGISTRO_TARV_ESQUEMA"."CD_USU_INCLUSAO"'
      '      ,"REGISTRO_TARV_ESQUEMA"."DT_INCLUSAO"'
      '      ,"REGISTRO_TARV_ESQUEMA"."CD_USU_ALTERACAO"'
      '      ,"REGISTRO_TARV_ESQUEMA"."DT_ALTERACAO"'
      'from "REGISTRO_TARV_ESQUEMA"'
      'where  "REGISTRO_TARV_ESQUEMA"."CD_UNIDADE" = :CD_UNIDADE'
      'and      "REGISTRO_TARV_ESQUEMA"."CD_PROVINCIA" = :CD_PROVINCIA'
      'and      "REGISTRO_TARV_ESQUEMA"."CD_MUNICIPIO" = :CD_MUNICIPIO'
      'and      "REGISTRO_TARV_ESQUEMA"."VL_MESANO" = :VL_MESANO'
      'order by'
      '"REGISTRO_TARV_ESQUEMA"."CD_REGISTRO_TARV_ESQUEMA"')
    ModifySQL.Strings = (
      'update "REGISTRO_TARV_ESQUEMA"'
      'set'
      ' "CD_REGISTRO_TARV_ESQUEMA" = :"CD_REGISTRO_TARV_ESQUEMA"'
      ', "CD_UND" = :"CD_UND"'
      ', "DT_REGISTRO" = :"DT_REGISTRO"'
      ', "CD_UNIDADE" = :"CD_UNIDADE"'
      ', "CD_PROVINCIA" = :"CD_PROVINCIA"'
      ', "CD_MUNICIPIO" = :"CD_MUNICIPIO"'
      ', "VL_MESANO" = :"VL_MESANO"'
      ', "VL_ANTERIOR_CRIANCA" = :"VL_ANTERIOR_CRIANCA"'
      ', "VL_ANTERIOR_ADULTO" = :"VL_ANTERIOR_ADULTO"'
      ', "VL_CORRENTE_CRIANCA" = :"VL_CORRENTE_CRIANCA"'
      ', "VL_CORRENTE_ADULTO" = :"VL_CORRENTE_ADULTO"'
      ', "VL_ESQUEMA" = :"VL_ESQUEMA"'
      ', "VL_X" = :"VL_X"'
      ', "VL_Y" = :"VL_Y"'
      ', "CD_REGISTRO_GERAL" = :"CD_REGISTRO_GERAL"'
      'where'
      '  "CD_REGISTRO_TARV_ESQUEMA" = :"OLD_CD_REGISTRO_TARV_ESQUEMA"')
    GeneratorField.Field = 'CD_REGISTRO_TARV_ESQUEMA'
    GeneratorField.Generator = 'GEN_REGISTRO_TARV_ESQUEMA'
    Left = 544
    Top = 451
    object TB_TARV_ESQUEMACD_REGISTRO_TARV_ESQUEMA: TIntegerField
      FieldName = 'CD_REGISTRO_TARV_ESQUEMA'
      Origin = 'REGISTRO_TARV_ESQUEMA.CD_REGISTRO_TARV_ESQUEMA'
      Required = True
    end
    object TB_TARV_ESQUEMACD_UND: TIntegerField
      FieldName = 'CD_UND'
      Origin = 'REGISTRO_TARV_ESQUEMA.CD_UND'
      Required = True
    end
    object TB_TARV_ESQUEMADT_REGISTRO: TDateTimeField
      FieldName = 'DT_REGISTRO'
      Origin = 'REGISTRO_TARV_ESQUEMA.DT_REGISTRO'
      Required = True
    end
    object TB_TARV_ESQUEMACD_UNIDADE: TIntegerField
      FieldName = 'CD_UNIDADE'
      Origin = 'REGISTRO_TARV_ESQUEMA.CD_UNIDADE'
      Required = True
    end
    object TB_TARV_ESQUEMACD_PROVINCIA: TIntegerField
      FieldName = 'CD_PROVINCIA'
      Origin = 'REGISTRO_TARV_ESQUEMA.CD_PROVINCIA'
      Required = True
    end
    object TB_TARV_ESQUEMACD_MUNICIPIO: TIntegerField
      FieldName = 'CD_MUNICIPIO'
      Origin = 'REGISTRO_TARV_ESQUEMA.CD_MUNICIPIO'
      Required = True
    end
    object TB_TARV_ESQUEMAVL_MESANO: TIBStringField
      FieldName = 'VL_MESANO'
      Origin = 'REGISTRO_TARV_ESQUEMA.VL_MESANO'
      Required = True
      Size = 8
    end
    object TB_TARV_ESQUEMAVL_ANTERIOR_CRIANCA: TIntegerField
      FieldName = 'VL_ANTERIOR_CRIANCA'
      Origin = 'REGISTRO_TARV_ESQUEMA.VL_ANTERIOR_CRIANCA'
    end
    object TB_TARV_ESQUEMAVL_ANTERIOR_ADULTO: TIntegerField
      FieldName = 'VL_ANTERIOR_ADULTO'
      Origin = 'REGISTRO_TARV_ESQUEMA.VL_ANTERIOR_ADULTO'
    end
    object TB_TARV_ESQUEMAVL_CORRENTE_CRIANCA: TIntegerField
      FieldName = 'VL_CORRENTE_CRIANCA'
      Origin = 'REGISTRO_TARV_ESQUEMA.VL_CORRENTE_CRIANCA'
    end
    object TB_TARV_ESQUEMAVL_CORRENTE_ADULTO: TIntegerField
      FieldName = 'VL_CORRENTE_ADULTO'
      Origin = 'REGISTRO_TARV_ESQUEMA.VL_CORRENTE_ADULTO'
    end
    object TB_TARV_ESQUEMAVL_X: TIntegerField
      FieldName = 'VL_X'
      Origin = 'REGISTRO_TARV_ESQUEMA.VL_X'
    end
    object TB_TARV_ESQUEMAVL_Y: TIntegerField
      FieldName = 'VL_Y'
      Origin = 'REGISTRO_TARV_ESQUEMA.VL_Y'
    end
    object TB_TARV_ESQUEMAVL_ESQUEMA: TStringField
      FieldName = 'VL_ESQUEMA'
    end
    object TB_TARV_ESQUEMACD_REGISTRO_GERAL: TIntegerField
      FieldName = 'CD_REGISTRO_GERAL'
      Origin = 'REGISTRO_TARV_ESQUEMA.CD_REGISTRO_GERAL'
    end
    object TB_TARV_ESQUEMANM_USU: TIBStringField
      FieldName = 'NM_USU'
      Origin = 'REGISTRO_TARV_ESQUEMA.NM_USU'
      Size = 50
    end
    object TB_TARV_ESQUEMAVL_VERSAO: TIBStringField
      FieldName = 'VL_VERSAO'
      Origin = 'REGISTRO_TARV_ESQUEMA.VL_VERSAO'
    end
    object TB_TARV_ESQUEMACD_USU_INCLUSAO: TIntegerField
      FieldName = 'CD_USU_INCLUSAO'
      Origin = 'REGISTRO_TARV_ESQUEMA.CD_USU_INCLUSAO'
    end
    object TB_TARV_ESQUEMADT_INCLUSAO: TDateTimeField
      FieldName = 'DT_INCLUSAO'
      Origin = 'REGISTRO_TARV_ESQUEMA.DT_INCLUSAO'
    end
    object TB_TARV_ESQUEMACD_USU_ALTERACAO: TIntegerField
      FieldName = 'CD_USU_ALTERACAO'
      Origin = 'REGISTRO_TARV_ESQUEMA.CD_USU_ALTERACAO'
    end
    object TB_TARV_ESQUEMADT_ALTERACAO: TDateTimeField
      FieldName = 'DT_ALTERACAO'
      Origin = 'REGISTRO_TARV_ESQUEMA.DT_ALTERACAO'
    end
  end
  object TB_ESQUEMA: TIBDataSet
    Database = DM.DB
    Transaction = DM.TS
    AfterDelete = TB_ESQUEMAAfterDelete
    AfterInsert = TB_ESQUEMAAfterInsert
    BeforeDelete = TB_ESQUEMABeforeDelete
    BufferChunks = 1000
    CachedUpdates = False
    DeleteSQL.Strings = (
      'delete from "ESQUEMA"'
      'where'
      '  "CD_ESQUEMA" = :"OLD_CD_ESQUEMA"')
    InsertSQL.Strings = (
      'insert into "ESQUEMA"'
      '('
      '  "CD_ESQUEMA"'
      ', "DS_NOME_MEDICAMENTO"'
      ', "DS_SIGLA"'
      ', "DS_APRESENTACAO"'
      ', "DS_NOME_COMERCIAL"'
      ', "CD_UND"'
      ', "DT_EXP"'
      ', "CD_EDI"'
      ', "FL_COMPONENTE"'
      ', "VL_ARV"'
      ')'
      'values'
      '('
      '  :"CD_ESQUEMA"'
      ', :"DS_NOME_MEDICAMENTO"'
      ', :"DS_SIGLA"'
      ', :"DS_APRESENTACAO"'
      ', :"DS_NOME_COMERCIAL"'
      ', :"CD_UND"'
      ', :"DT_EXP"'
      ', :"CD_EDI"'
      ', :"FL_COMPONENTE"'
      ', :"VL_ARV")')
    SelectSQL.Strings = (
      'select "ESQUEMA"."CD_ESQUEMA"'
      '      ,"ESQUEMA"."DS_NOME_MEDICAMENTO"'
      '      ,"ESQUEMA"."DS_SIGLA"'
      '      ,"ESQUEMA"."DS_APRESENTACAO"'
      '      ,"ESQUEMA"."DS_NOME_COMERCIAL"'
      '      ,"ESQUEMA"."CD_UND"'
      '      ,"ESQUEMA"."FL_COMPONENTE"'
      '      ,"ESQUEMA"."VL_ARV"'
      'from "ESQUEMA"'
      'order by'
      '"ESQUEMA"."CD_ESQUEMA"')
    ModifySQL.Strings = (
      'update "ESQUEMA"'
      'set'
      ' "CD_ESQUEMA" = :"CD_ESQUEMA"'
      ', "DS_NOME_MEDICAMENTO" = :"DS_NOME_MEDICAMENTO"'
      ', "DS_SIGLA" = :"DS_SIGLA"'
      ', "DS_APRESENTACAO" = :"DS_APRESENTACAO"'
      ', "DS_NOME_COMERCIAL" = :"DS_NOME_COMERCIAL"'
      ', "CD_UND" = :"CD_UND"'
      ', "DT_EXP" = :"DT_EXP"'
      ', "CD_EDI" = :"CD_EDI"'
      ', "FL_COMPONENTE" = :"FL_COMPONENTE"'
      ', "VL_ARV" = :"VL_ARV"'
      'where'
      '  "CD_ESQUEMA" = :"OLD_CD_ESQUEMA"')
    GeneratorField.Field = 'CD_ESQUEMA'
    GeneratorField.Generator = 'GEN_ESQUEMA'
    GeneratorField.ApplyEvent = gamOnPost
    Left = 280
    Top = 579
    object TB_ESQUEMACD_ESQUEMA: TIntegerField
      FieldName = 'CD_ESQUEMA'
      Origin = 'ESQUEMA.CD_ESQUEMA'
      Required = True
    end
    object TB_ESQUEMADS_NOME_MEDICAMENTO: TIBStringField
      FieldName = 'DS_NOME_MEDICAMENTO'
      Origin = 'ESQUEMA.DS_NOME_MEDICAMENTO'
      Size = 100
    end
    object TB_ESQUEMADS_SIGLA: TIBStringField
      FieldName = 'DS_SIGLA'
      Origin = 'ESQUEMA.DS_SIGLA'
      Size = 50
    end
    object TB_ESQUEMADS_APRESENTACAO: TIBStringField
      FieldName = 'DS_APRESENTACAO'
      Origin = 'ESQUEMA.DS_APRESENTACAO'
      Size = 50
    end
    object TB_ESQUEMADS_NOME_COMERCIAL: TIBStringField
      FieldName = 'DS_NOME_COMERCIAL'
      Origin = 'ESQUEMA.DS_NOME_COMERCIAL'
      Size = 100
    end
    object TB_ESQUEMACD_UND: TIntegerField
      FieldName = 'CD_UND'
      Origin = 'ESQUEMA.CD_UND'
    end
    object TB_ESQUEMAFL_COMPONENTE: TIBStringField
      FieldName = 'FL_COMPONENTE'
      Origin = 'ESQUEMA.FL_COMPONENTE'
      FixedChar = True
      Size = 1
    end
    object TB_ESQUEMAVL_ARV: TIBStringField
      FieldName = 'VL_ARV'
      Origin = 'ESQUEMA.VL_ARV'
      Size = 10
    end
  end
  object TB_AGENDAMENTOS: TIBDataSet
    Database = DM.DB
    Transaction = DM.TS
    AfterPost = TB_AGENDAMENTOSAfterPost
    BeforePost = TB_AGENDAMENTOSBeforePost
    OnDeleteError = TB_PARAMETRODeleteError
    OnEditError = TB_PARAMETROEditError
    OnPostError = TB_PARAMETROPostError
    OnUpdateError = TB_PARAMETROUpdateError
    BufferChunks = 1000
    CachedUpdates = False
    DeleteSQL.Strings = (
      'delete from "AGENDA"'
      'where'
      '  "CD_AGENDA" = :"OLD_CD_AGENDA"')
    InsertSQL.Strings = (
      'insert into "AGENDA"'
      '('
      '  "CD_AGENDA"'
      ', "CD_UND"'
      ', "CD_PACIENTE"'
      ', "DT_AGENDA"'
      ', "CD_UNIDADE"'
      ', "FL_REMARCADO"'
      ', "FL_REALIZADO"'
      ', "TP_ESQUEMA"'
      ', "VL_CD4"'
      ', "CD_MEDICO"'
      ', "DT_REMARCACAO"'
      ', "DS_ESQUEMA"'
      ', "FL_CONFIRMADO"'
      ', "FL_TRANSFERIDO"'
      ')'
      'values'
      '('
      '  :"CD_AGENDA"'
      ', :"CD_UND"'
      ', :"CD_PACIENTE"'
      ', :"DT_AGENDA"'
      ', :"CD_UNIDADE"'
      ', :"FL_REMARCADO"'
      ', :"FL_REALIZADO"'
      ', :"TP_ESQUEMA"'
      ', :"VL_CD4"'
      ', :"CD_MEDICO"'
      ', :"DT_REMARCACAO"'
      ', :"DS_ESQUEMA"'
      ', :"FL_CONFIRMADO"'
      ', :"FL_TRANSFERIDO"'
      ')')
    SelectSQL.Strings = (
      'select "AGENDA"."CD_AGENDA"'
      '      ,"AGENDA"."CD_UND"'
      '      ,"AGENDA"."CD_PACIENTE"'
      '      ,"AGENDA"."DT_AGENDA"'
      '      ,"AGENDA"."CD_UNIDADE"'
      '      ,"AGENDA"."FL_REMARCADO"'
      '      ,"AGENDA"."FL_REALIZADO"'
      '      ,"AGENDA"."TP_ESQUEMA"'
      '      ,"AGENDA"."VL_CD4"'
      '      ,"AGENDA"."CD_MEDICO"'
      '     ,"AGENDA"."DS_ESQUEMA"'
      '      ,"AGENDA"."DT_REMARCACAO"'
      '      ,"AGENDA"."FL_CONFIRMADO"'
      '      ,"AGENDA"."FL_TRANSFERIDO"'
      '       ,PACIENTE.NM_PACIENTE'
      '       ,PACIENTE.NR_PROCESSO'
      '      , UNIDADE.DS_UNIDADE'
      '      , MEDICO.NM_MEDICO'
      'from "AGENDA",  PACIENTE, UNIDADE, MEDICO'
      'where "AGENDA".CD_PACIENTE = PACIENTE.CD_PACIENTE'
      'AND  "AGENDA".CD_UNIDADE = UNIDADE.CD_UNIDADE'
      'AND  "AGENDA".CD_MEDICO = MEDICO.CD_MEDICO'
      'AND  "AGENDA".CD_AGENDA =:AGENDA')
    ModifySQL.Strings = (
      'update "AGENDA"'
      'set'
      ' "CD_AGENDA" = :"CD_AGENDA"'
      ', "CD_UND" = :"CD_UND"'
      ', "CD_PACIENTE" = :"CD_PACIENTE"'
      ', "DT_AGENDA" = :"DT_AGENDA"'
      ', "CD_UNIDADE" = :"CD_UNIDADE"'
      ', "FL_REMARCADO" = :"FL_REMARCADO"'
      ', "FL_REALIZADO" = :"FL_REALIZADO"'
      ', "TP_ESQUEMA" = :"TP_ESQUEMA"'
      ', "VL_CD4" = :"VL_CD4"'
      ', "CD_MEDICO" = :"CD_MEDICO"'
      ', "DT_REMARCACAO" = :"DT_REMARCACAO"'
      ', "DS_ESQUEMA" = :"DS_ESQUEMA"'
      ', "FL_CONFIRMADO" = :"FL_CONFIRMADO"'
      ', "FL_TRANSFERIDO" = :"FL_TRANSFERIDO"'
      'where'
      '  "CD_AGENDA" = :"OLD_CD_AGENDA"')
    Left = 697
    Top = 555
    object TB_AGENDAMENTOSCD_AGENDA: TIntegerField
      FieldName = 'CD_AGENDA'
      Origin = 'AGENDA.CD_AGENDA'
      Required = True
    end
    object TB_AGENDAMENTOSCD_UND: TIntegerField
      FieldName = 'CD_UND'
      Origin = 'AGENDA.CD_UND'
      Required = True
    end
    object TB_AGENDAMENTOSCD_PACIENTE: TIntegerField
      FieldName = 'CD_PACIENTE'
      Origin = 'AGENDA.CD_PACIENTE'
    end
    object TB_AGENDAMENTOSDT_AGENDA: TDateTimeField
      FieldName = 'DT_AGENDA'
      Origin = 'AGENDA.DT_AGENDA'
    end
    object TB_AGENDAMENTOSCD_UNIDADE: TIntegerField
      FieldName = 'CD_UNIDADE'
      Origin = 'AGENDA.CD_UNIDADE'
    end
    object TB_AGENDAMENTOSFL_REMARCADO: TIntegerField
      FieldName = 'FL_REMARCADO'
      Origin = 'AGENDA.FL_REMARCADO'
    end
    object TB_AGENDAMENTOSFL_REALIZADO: TIntegerField
      FieldName = 'FL_REALIZADO'
      Origin = 'AGENDA.FL_REALIZADO'
    end
    object TB_AGENDAMENTOSTP_ESQUEMA: TIntegerField
      FieldName = 'TP_ESQUEMA'
      Origin = 'AGENDA.TP_ESQUEMA'
    end
    object TB_AGENDAMENTOSVL_CD4: TIntegerField
      FieldName = 'VL_CD4'
      Origin = 'AGENDA.VL_CD4'
    end
    object TB_AGENDAMENTOSCD_MEDICO: TIntegerField
      FieldName = 'CD_MEDICO'
      Origin = 'AGENDA.CD_MEDICO'
    end
    object TB_AGENDAMENTOSDS_ESQUEMA: TIBStringField
      FieldName = 'DS_ESQUEMA'
      Origin = 'AGENDA.DS_ESQUEMA'
      Size = 30
    end
    object TB_AGENDAMENTOSDT_REMARCACAO: TDateTimeField
      FieldName = 'DT_REMARCACAO'
      Origin = 'AGENDA.DT_REMARCACAO'
    end
    object TB_AGENDAMENTOSNM_PACIENTE: TIBStringField
      FieldName = 'NM_PACIENTE'
      Origin = 'PACIENTE.NM_PACIENTE'
      Required = True
      Size = 50
    end
    object TB_AGENDAMENTOSNR_PROCESSO: TIntegerField
      FieldName = 'NR_PROCESSO'
      Origin = 'PACIENTE.NR_PROCESSO'
    end
    object TB_AGENDAMENTOSDS_UNIDADE: TIBStringField
      FieldName = 'DS_UNIDADE'
      Origin = 'UNIDADE.DS_UNIDADE'
      Required = True
      Size = 50
    end
    object TB_AGENDAMENTOSNM_MEDICO: TIBStringField
      FieldName = 'NM_MEDICO'
      Origin = 'MEDICO.NM_MEDICO'
      Size = 50
    end
    object TB_AGENDAMENTOSFL_CONFIRMADO: TIntegerField
      FieldName = 'FL_CONFIRMADO'
      Origin = 'AGENDA.FL_CONFIRMADO'
    end
    object TB_AGENDAMENTOSFL_TRANSFERIDO: TIntegerField
      FieldName = 'FL_TRANSFERIDO'
      Origin = 'AGENDA.FL_TRANSFERIDO'
    end
  end
  object TB_USUARIO_CMP: TIBDataSet
    Database = DM.DB
    Transaction = DM.TS
    AfterDelete = TB_USUARIO_CMPAfterDelete
    AfterInsert = TB_USUARIO_CMPAfterInsert
    BeforeDelete = TB_USUARIO_CMPBeforeDelete
    OnDeleteError = TB_USUARIO_CMPDeleteError
    OnEditError = TB_PARAMETROEditError
    OnPostError = TB_PARAMETROPostError
    OnUpdateError = TB_PARAMETROUpdateError
    BufferChunks = 1000
    CachedUpdates = False
    DeleteSQL.Strings = (
      'delete from "USUARIO_CMP"'
      'where'
      '  "CD_USUARIO" = :"OLD_CD_USUARIO" and '
      '  "CD_UND" = :"OLD_CD_UND"')
    InsertSQL.Strings = (
      'insert into "USUARIO_CMP"'
      '('
      '  "CD_USUARIO"'
      ', "CD_UND"'
      ', "CD_MEDICO"'
      ', "NM_USUARIO"'
      ', "NM_LOGIN"'
      ', "DS_SENHA"'
      ', "DT_CADASTRO"'
      ', "DT_EXP"'
      ', "CD_EDI"'
      ', "CD_GRUPO"'
      ')'
      'values'
      '('
      '  :"CD_USUARIO"'
      ', :"CD_UND"'
      ', :"CD_MEDICO"'
      ', :"NM_USUARIO"'
      ', :"NM_LOGIN"'
      ', :"DS_SENHA"'
      ', :"DT_CADASTRO"'
      ', :"DT_EXP"'
      ', :"CD_EDI"'
      ', :"CD_GRUPO"'
      ')')
    SelectSQL.Strings = (
      'select'
      '       "USUARIO_CMP"."CD_USUARIO"'
      '      ,"USUARIO_CMP"."CD_MEDICO"'
      '      ,"USUARIO_CMP"."CD_UND"'
      '      ,"USUARIO_CMP"."NM_USUARIO"'
      '      ,"USUARIO_CMP"."NM_LOGIN"'
      '      ,"USUARIO_CMP"."DS_SENHA"'
      '      ,"USUARIO_CMP"."DT_CADASTRO"'
      '      ,"USUARIO_CMP"."DT_EXP"'
      '      ,"USUARIO_CMP"."CD_EDI"'
      '      ,"USUARIO_CMP"."CD_GRUPO"'
      'from "USUARIO_CMP"'
      'order by'
      '"USUARIO_CMP"."CD_USUARIO", '
      '"USUARIO_CMP"."CD_UND"')
    ModifySQL.Strings = (
      'update "USUARIO_CMP"'
      'set'
      ' "CD_USUARIO" = :"CD_USUARIO"'
      ', "CD_UND" = :"CD_UND"'
      ', "CD_MEDICO"= :"CD_MEDICO"'
      ', "NM_USUARIO" = :"NM_USUARIO"'
      ', "NM_LOGIN" = :"NM_LOGIN"'
      ', "DS_SENHA" = :"DS_SENHA"'
      ', "DT_CADASTRO" = :"DT_CADASTRO"'
      ', "DT_EXP" = :"DT_EXP"'
      ', "CD_EDI" = :"CD_EDI"'
      ', "CD_GRUPO" = :"CD_GRUPO"'
      'where'
      '  "CD_USUARIO" = :"OLD_CD_USUARIO" and '
      '  "CD_UND" = :"OLD_CD_UND"')
    GeneratorField.ApplyEvent = gamOnServer
    Left = 72
    Top = 619
    object TB_USUARIO_CMPCD_USUARIO: TIntegerField
      FieldName = 'CD_USUARIO'
      Origin = 'USUARIO_CMP.CD_USUARIO'
      Required = True
    end
    object TB_USUARIO_CMPCD_UND: TIntegerField
      FieldName = 'CD_UND'
      Origin = 'USUARIO_CMP.CD_UND'
      Required = True
    end
    object TB_USUARIO_CMPNM_USUARIO: TIBStringField
      FieldName = 'NM_USUARIO'
      Origin = 'USUARIO_CMP.NM_USUARIO'
      Size = 100
    end
    object TB_USUARIO_CMPNM_LOGIN: TIBStringField
      FieldName = 'NM_LOGIN'
      Origin = 'USUARIO_CMP.NM_LOGIN'
      Size = 15
    end
    object TB_USUARIO_CMPDS_SENHA: TIBStringField
      FieldName = 'DS_SENHA'
      Origin = 'USUARIO_CMP.DS_SENHA'
      Size = 15
    end
    object TB_USUARIO_CMPDT_CADASTRO: TDateTimeField
      FieldName = 'DT_CADASTRO'
      Origin = 'USUARIO_CMP.DT_CADASTRO'
    end
    object TB_USUARIO_CMPDT_EXP: TDateTimeField
      FieldName = 'DT_EXP'
      Origin = 'USUARIO_CMP.DT_EXP'
    end
    object TB_USUARIO_CMPCD_EDI: TIntegerField
      FieldName = 'CD_EDI'
      Origin = 'USUARIO_CMP.CD_EDI'
    end
    object TB_USUARIO_CMPCD_MEDICO: TIntegerField
      FieldName = 'CD_MEDICO'
      Origin = 'USUARIO_CMP.CD_MEDICO'
    end
    object TB_USUARIO_CMPCD_GRUPO: TIntegerField
      FieldName = 'CD_GRUPO'
      Origin = 'USUARIO_CMP.CD_GRUPO'
    end
  end
  object TB_ATENDIMENTO: TIBDataSet
    Database = DM.DB
    Transaction = DM.TS
    AfterDelete = TB_ATENDIMENTOAfterDelete
    AfterInsert = TB_ATENDIMENTOAfterInsert
    AfterPost = TB_ATENDIMENTOAfterPost
    BeforeDelete = TB_ATENDIMENTOBeforeDelete
    BufferChunks = 1000
    CachedUpdates = False
    DeleteSQL.Strings = (
      'delete from "ATENDIMENTO"'
      'where'
      '  "CD_ATENDIMENTO" = :"OLD_CD_ATENDIMENTO" and '
      '  "CD_UND" = :"OLD_CD_UND"')
    InsertSQL.Strings = (
      'insert into "ATENDIMENTO"'
      '('
      '  "CD_ATENDIMENTO"'
      ', "CD_UND"'
      ', "CD_MEDICO"'
      ', "DT_ATENDIMENTO"'
      ', "TP_PERIODO"'
      ')'
      'values'
      '('
      '  :"CD_ATENDIMENTO"'
      ', :"CD_UND"'
      ', :"CD_MEDICO"'
      ', :"DT_ATENDIMENTO"'
      ', :"TP_PERIODO"'
      ')')
    SelectSQL.Strings = (
      'select "ATENDIMENTO"."CD_ATENDIMENTO"'
      '      ,"ATENDIMENTO"."CD_UND"'
      '      ,"ATENDIMENTO"."CD_MEDICO"'
      '      ,"ATENDIMENTO"."DT_ATENDIMENTO"'
      '      ,"ATENDIMENTO"."TP_PERIODO",'
      
        '(select nm_medico from medico where cd_medico = atendimento.cd_m' +
        'edico)NM_MEDICO'
      'from "ATENDIMENTO"'
      
        'where ("ATENDIMENTO".DT_ATENDIMENTO >= :DT_DE and "ATENDIMENTO".' +
        'DT_ATENDIMENTO < :DT_ATE)'
      'and "ATENDIMENTO".CD_MEDICO = :MEDICO'
      'order by'
      '"ATENDIMENTO"."CD_ATENDIMENTO"')
    ModifySQL.Strings = (
      'update "ATENDIMENTO"'
      'set'
      ' "CD_ATENDIMENTO" = :"CD_ATENDIMENTO"'
      ', "CD_UND" = :"CD_UND"'
      ', "CD_MEDICO" = :"CD_MEDICO"'
      ', "DT_ATENDIMENTO" = :"DT_ATENDIMENTO"'
      ', "TP_PERIODO" = :"TP_PERIODO"'
      'where'
      '  "CD_ATENDIMENTO" = :"OLD_CD_ATENDIMENTO" and '
      '  "CD_UND" = :"OLD_CD_UND"')
    Left = 488
    Top = 611
    object TB_ATENDIMENTOCD_ATENDIMENTO: TIntegerField
      FieldName = 'CD_ATENDIMENTO'
      Origin = 'ATENDIMENTO.CD_ATENDIMENTO'
      Required = True
    end
    object TB_ATENDIMENTOCD_UND: TIntegerField
      FieldName = 'CD_UND'
      Origin = 'ATENDIMENTO.CD_UND'
      Required = True
    end
    object TB_ATENDIMENTOCD_MEDICO: TIntegerField
      FieldName = 'CD_MEDICO'
      Origin = 'ATENDIMENTO.CD_MEDICO'
    end
    object TB_ATENDIMENTONM_MEDICO: TIBStringField
      FieldName = 'NM_MEDICO'
      Origin = 'MEDICO.NM_MEDICO'
      Size = 50
    end
    object TB_ATENDIMENTODT_ATENDIMENTO: TDateTimeField
      FieldName = 'DT_ATENDIMENTO'
      Origin = 'ATENDIMENTO.DT_ATENDIMENTO'
    end
    object TB_ATENDIMENTOTP_PERIODO: TIntegerField
      FieldName = 'TP_PERIODO'
      Origin = 'ATENDIMENTO.TP_PERIODO'
    end
  end
  object qyUnidade: TIBQuery
    Database = DM.DB
    Transaction = DM.TS
    BeforeOpen = qyUnidadeBeforeOpen
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select UNIDADE.*'
      '      ,"PROVINCIA"."DS_PROVINCIA"'
      '      ,"MUNICIPIO"."DS_MUNICIPIO"'
      'from "UNIDADE"'
      ' LEFT OUTER JOIN "PROVINCIA" ON'
      '      "UNIDADE"."CD_PROVINCIA" = "PROVINCIA"."CD_PROVINCIA"'
      'AND '
      '      "UNIDADE"."CD_UND"   = "PROVINCIA"."CD_UND"  '
      ''
      ' LEFT OUTER JOIN "MUNICIPIO" ON'
      '      "UNIDADE"."CD_MUNICIPIO" = "MUNICIPIO"."CD_MUNICIPIO"'
      'AND '
      '      "UNIDADE"."CD_UND"   = "PROVINCIA"."CD_UND"  '
      'where cd_unidade =:Unidade'
      ''
      '')
    Left = 640
    Top = 451
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Unidade'
        ParamType = ptUnknown
      end>
    object qyUnidadeCD_UNIDADE: TIntegerField
      FieldName = 'CD_UNIDADE'
      Origin = 'UNIDADE.CD_UNIDADE'
      Required = True
    end
    object qyUnidadeCD_UND: TIntegerField
      FieldName = 'CD_UND'
      Origin = 'UNIDADE.CD_UND'
      Required = True
    end
    object qyUnidadeDS_UNIDADE: TIBStringField
      FieldName = 'DS_UNIDADE'
      Origin = 'UNIDADE.DS_UNIDADE'
      Required = True
      Size = 50
    end
    object qyUnidadeDT_EXP: TDateTimeField
      FieldName = 'DT_EXP'
      Origin = 'UNIDADE.DT_EXP'
    end
    object qyUnidadeCD_EDI: TIntegerField
      FieldName = 'CD_EDI'
      Origin = 'UNIDADE.CD_EDI'
    end
    object qyUnidadeCD_PROVINCIA: TIntegerField
      FieldName = 'CD_PROVINCIA'
      Origin = 'UNIDADE.CD_PROVINCIA'
    end
    object qyUnidadeCD_MUNICIPIO: TIntegerField
      FieldName = 'CD_MUNICIPIO'
      Origin = 'UNIDADE.CD_MUNICIPIO'
    end
    object qyUnidadeDS_PROVINCIA: TIBStringField
      FieldName = 'DS_PROVINCIA'
      Origin = 'PROVINCIA.DS_PROVINCIA'
      Size = 50
    end
    object qyUnidadeDS_MUNICIPIO: TIBStringField
      FieldName = 'DS_MUNICIPIO'
      Origin = 'MUNICIPIO.DS_MUNICIPIO'
      Size = 50
    end
  end
  object TB_TESTES_POSITIVOS: TIBDataSet
    Database = DM.DB
    Transaction = DM.TS
    AfterInsert = TB_TESTES_POSITIVOSAfterInsert
    BufferChunks = 1000
    CachedUpdates = False
    DeleteSQL.Strings = (
      'delete from "REGISTRO_TESTES_POSITIVOS"'
      'where'
      
        '  "CD_REGISTRO_TESTES_POSITIVOS" = :"OLD_CD_REGISTRO_TESTES_POSI' +
        'TIVOS" and '
      '  "CD_UND" = :"OLD_CD_UND"')
    InsertSQL.Strings = (
      'insert into "REGISTRO_TESTES_POSITIVOS"'
      '('
      '  "CD_REGISTRO_TESTES_POSITIVOS"'
      ', "CD_UND"'
      ', "DT_REGISTRO"'
      ', "CD_UNIDADE"'
      ', "CD_PROVINCIA"'
      ', "CD_MUNICIPIO"'
      ', "VL_MESANO"'
      ', "VL_MASCULINO"'
      ', "VL_FEMININO"'
      ', "VL_NAO_INFORMADO"'
      ', "ID_FAIXA_ETARIA"'
      ', "VL_X"'
      ', "VL_Y"'
      ', "DT_EXP"'
      ', "CD_EDI"'
      ')'
      'values'
      '('
      '  :"CD_REGISTRO_TESTES_POSITIVOS"'
      ', :"CD_UND"'
      ', :"DT_REGISTRO"'
      ', :"CD_UNIDADE"'
      ', :"CD_PROVINCIA"'
      ', :"CD_MUNICIPIO"'
      ', :"VL_MESANO"'
      ', :"VL_MASCULINO"'
      ', :"VL_FEMININO"'
      ', :"VL_NAO_INFORMADO"'
      ', :"ID_FAIXA_ETARIA"'
      ', :"VL_X"'
      ', :"VL_Y"'
      ', :"DT_EXP"'
      ', :"CD_EDI"'
      ')')
    SelectSQL.Strings = (
      
        'select "REGISTRO_TESTES_POSITIVOS"."CD_REGISTRO_TESTES_POSITIVOS' +
        '"'
      '      ,"REGISTRO_TESTES_POSITIVOS"."CD_UND"'
      '      ,"REGISTRO_TESTES_POSITIVOS"."DT_REGISTRO"'
      '      ,"REGISTRO_TESTES_POSITIVOS"."CD_UNIDADE"'
      '      ,"REGISTRO_TESTES_POSITIVOS"."CD_PROVINCIA"'
      '      ,"REGISTRO_TESTES_POSITIVOS"."CD_MUNICIPIO"'
      '      ,"REGISTRO_TESTES_POSITIVOS"."VL_MESANO"'
      '      ,"REGISTRO_TESTES_POSITIVOS"."VL_MASCULINO"'
      '      ,"REGISTRO_TESTES_POSITIVOS"."VL_FEMININO"'
      '      ,"REGISTRO_TESTES_POSITIVOS"."VL_NAO_INFORMADO"'
      '      ,"REGISTRO_TESTES_POSITIVOS"."ID_FAIXA_ETARIA"'
      '      ,"REGISTRO_TESTES_POSITIVOS"."VL_X"'
      '      ,"REGISTRO_TESTES_POSITIVOS"."VL_Y"'
      '      ,"REGISTRO_TESTES_POSITIVOS"."DT_EXP"'
      '      ,"REGISTRO_TESTES_POSITIVOS"."CD_EDI"'
      'from "REGISTRO_TESTES_POSITIVOS"'
      'where  "REGISTRO_TESTES_POSITIVOS"."CD_UNIDADE" = :CD_UNIDADE'
      
        'and      "REGISTRO_TESTES_POSITIVOS"."CD_PROVINCIA" = :CD_PROVIN' +
        'CIA'
      
        'and      "REGISTRO_TESTES_POSITIVOS"."CD_MUNICIPIO" = :CD_MUNICI' +
        'PIO'
      'and      "REGISTRO_TESTES_POSITIVOS"."VL_MESANO" = :VL_MESANO'
      '')
    ModifySQL.Strings = (
      'update "REGISTRO_TESTES_POSITIVOS"'
      'set'
      
        ' "CD_REGISTRO_TESTES_POSITIVOS" = :"CD_REGISTRO_TESTES_POSITIVOS' +
        '"'
      ', "CD_UND" = :"CD_UND"'
      ', "DT_REGISTRO" = :"DT_REGISTRO"'
      ', "CD_UNIDADE" = :"CD_UNIDADE"'
      ', "CD_PROVINCIA" = :"CD_PROVINCIA"'
      ', "CD_MUNICIPIO" = :"CD_MUNICIPIO"'
      ', "VL_MESANO" = :"VL_MESANO"'
      ', "VL_MASCULINO" = :"VL_MASCULINO"'
      ', "VL_FEMININO" = :"VL_FEMININO"'
      ', "VL_NAO_INFORMADO" = :"VL_NAO_INFORMADO"'
      ', "ID_FAIXA_ETARIA" = :"ID_FAIXA_ETARIA"'
      ', "VL_X" = :"VL_X"'
      ', "VL_Y" = :"VL_Y"'
      ', "DT_EXP" = :"DT_EXP"'
      ', "CD_EDI" = :"CD_EDI"'
      'where'
      
        '  "CD_REGISTRO_TESTES_POSITIVOS" = :"OLD_CD_REGISTRO_TESTES_POSI' +
        'TIVOS" and '
      '  "CD_UND" = :"OLD_CD_UND"')
    GeneratorField.Field = 'CD_REGISTRO_TESTES_POSITIVOS'
    GeneratorField.Generator = 'GEN_REGISTRO_TESTES_POSITIVOS'
    Left = 376
    Top = 542
    object TB_TESTES_POSITIVOSCD_REGISTRO_TESTES_POSITIVOS: TIntegerField
      FieldName = 'CD_REGISTRO_TESTES_POSITIVOS'
      Origin = 'REGISTRO_TESTES_POSITIVOS.CD_REGISTRO_TESTES_POSITIVOS'
      Required = True
    end
    object TB_TESTES_POSITIVOSCD_UND: TIntegerField
      FieldName = 'CD_UND'
      Origin = 'REGISTRO_TESTES_POSITIVOS.CD_UND'
      Required = True
    end
    object TB_TESTES_POSITIVOSDT_REGISTRO: TDateTimeField
      FieldName = 'DT_REGISTRO'
      Origin = 'REGISTRO_TESTES_POSITIVOS.DT_REGISTRO'
      Required = True
    end
    object TB_TESTES_POSITIVOSCD_UNIDADE: TIntegerField
      FieldName = 'CD_UNIDADE'
      Origin = 'REGISTRO_TESTES_POSITIVOS.CD_UNIDADE'
      Required = True
    end
    object TB_TESTES_POSITIVOSCD_PROVINCIA: TIntegerField
      FieldName = 'CD_PROVINCIA'
      Origin = 'REGISTRO_TESTES_POSITIVOS.CD_PROVINCIA'
      Required = True
    end
    object TB_TESTES_POSITIVOSCD_MUNICIPIO: TIntegerField
      FieldName = 'CD_MUNICIPIO'
      Origin = 'REGISTRO_TESTES_POSITIVOS.CD_MUNICIPIO'
      Required = True
    end
    object TB_TESTES_POSITIVOSVL_MESANO: TIBStringField
      FieldName = 'VL_MESANO'
      Origin = 'REGISTRO_TESTES_POSITIVOS.VL_MESANO'
      Required = True
      Size = 8
    end
    object TB_TESTES_POSITIVOSVL_MASCULINO: TIntegerField
      FieldName = 'VL_MASCULINO'
      Origin = 'REGISTRO_TESTES_POSITIVOS.VL_MASCULINO'
    end
    object TB_TESTES_POSITIVOSVL_FEMININO: TIntegerField
      FieldName = 'VL_FEMININO'
      Origin = 'REGISTRO_TESTES_POSITIVOS.VL_FEMININO'
    end
    object TB_TESTES_POSITIVOSVL_NAO_INFORMADO: TIntegerField
      FieldName = 'VL_NAO_INFORMADO'
      Origin = 'REGISTRO_TESTES_POSITIVOS.VL_NAO_INFORMADO'
    end
    object TB_TESTES_POSITIVOSID_FAIXA_ETARIA: TIntegerField
      FieldName = 'ID_FAIXA_ETARIA'
      Origin = 'REGISTRO_TESTES_POSITIVOS.ID_FAIXA_ETARIA'
    end
    object TB_TESTES_POSITIVOSVL_X: TIntegerField
      FieldName = 'VL_X'
      Origin = 'REGISTRO_TESTES_POSITIVOS.VL_X'
    end
    object TB_TESTES_POSITIVOSVL_Y: TIntegerField
      FieldName = 'VL_Y'
      Origin = 'REGISTRO_TESTES_POSITIVOS.VL_Y'
    end
    object TB_TESTES_POSITIVOSDT_EXP: TDateTimeField
      FieldName = 'DT_EXP'
      Origin = 'REGISTRO_TESTES_POSITIVOS.DT_EXP'
    end
    object TB_TESTES_POSITIVOSCD_EDI: TIntegerField
      FieldName = 'CD_EDI'
      Origin = 'REGISTRO_TESTES_POSITIVOS.CD_EDI'
    end
  end
  object TB_NR_NOTIFICACAO: TIBDataSet
    Database = DM.DB
    Transaction = DM.TS
    AfterDelete = TB_NR_NOTIFICACAOAfterDelete
    AfterPost = TB_NR_NOTIFICACAOAfterPost
    BufferChunks = 1000
    CachedUpdates = False
    DeleteSQL.Strings = (
      'delete from "NOTIFICACAO"'
      'where'
      '  "CD_FICHA" = :"OLD_CD_FICHA"'
      '')
    InsertSQL.Strings = (
      'insert into "NOTIFICACAO"'
      '('
      '  "CD_FICHA"'
      ', "CD_UNIDADE"'
      ', "CD_USUARIO"'
      ', "CD_MUNICIPIO"'
      ', "CD_UNIDADE_TRATAMENTO"'
      ', "CD_MUNICIPIO_TRATAMENTO"'
      ', "CD_PACIENTE"'
      ', "DT_NOTIFICACAO"'
      ', "DT_DIAGNOSTICO"'
      ', "CD_RELACOES_SEXO"'
      ', "CD_MAE_POSITIVO"'
      ', "CD_USOU_DROGA"'
      ', "CD_ACIDENTE_MAT_BIO"'
      ', "SN_TRANSFUSAO_SANGUE"'
      ', "SN_PERFURACAO"'
      ', "SN_TRAT_DENTARIO"'
      ', "SN_INTERV_CIRURGICA"'
      ', "SN_CIRCUNCISAO"'
      ', "CD_TESTE_TRIAGEM"'
      ', "DS_TESTE_TRIAGEM"'
      ', "CD_OCUPACAO"'
      ', "DS_OCUPACAO"'
      ', "CD_TESTE_CONFIRMATORIO"'
      ', "DS_TESTE_CONFIRMATORIO"'
      ', "CD_OMS"'
      ', "CD_CD4"'
      ', "CD_EVOLUCAO"'
      ', "DT_EVOLUCAO"'
      ', "DS_OBSERVACAO"'
      ', "CD_NOTIFICACAO"'
      ', "REGDUP"'
      ', "CD_LOTE"'
      ', "NM_ENTREVISTADOR"'
      ', "TEL_ENTREVISTADOR"'
      ', "FUNCAO_ENTREVISTADOR"'
      ', "NM_MEDICO"'
      ', "TEL_MEDICO"'
      ', "SN_TATUAGEM"'
      ', "TP_ENTRADA"'
      ', "EVIDENCIA_GESTANTE"'
      ', "TB_ATUAL"'
      ', "TB_ANTERIOR"'
      ', "DT_TRATAMENTO_TB"'
      ', "CD_PROVINCIA_TRATAMENTO"'
      ', "CD_PROVINCIA_NOT"'
      ', "DT_ALTERACAO"'
      ', "DT_EXPORTACAO"'
      ', "CD_FICHA_ORACLE"'
      ', "CD_MEDICO"'
      ', "NR_NOTIFICACAO"'
      ', "CD_FICHA_SINVS"'
      ', "CD_INVESTIGADOR"'
      ', "DT_TESTE_TRIAGEM"'
      ', "DT_TESTE_CONFIRMATORIO"'
      ', "NR_PROCESSO_UTENTE"'
      ', "CD_UND"'
      ')'
      'values'
      '('
      '  :"CD_FICHA"'
      ', :"CD_UNIDADE"'
      ', :"CD_USUARIO"'
      ', :"CD_MUNICIPIO"'
      ', :"CD_UNIDADE_TRATAMENTO"'
      ', :"CD_MUNICIPIO_TRATAMENTO"'
      ', :"CD_PACIENTE"'
      ', :"DT_NOTIFICACAO"'
      ', :"DT_DIAGNOSTICO"'
      ', :"CD_RELACOES_SEXO"'
      ', :"CD_MAE_POSITIVO"'
      ', :"CD_USOU_DROGA"'
      ', :"CD_ACIDENTE_MAT_BIO"'
      ', :"SN_TRANSFUSAO_SANGUE"'
      ', :"SN_PERFURACAO"'
      ', :"SN_TRAT_DENTARIO"'
      ', :"SN_INTERV_CIRURGICA"'
      ', :"SN_CIRCUNCISAO"'
      ', :"CD_TESTE_TRIAGEM"'
      ', :"DS_TESTE_TRIAGEM"'
      ', :"CD_OCUPACAO"'
      ', :"DS_OCUPACAO"'
      ', :"CD_TESTE_CONFIRMATORIO"'
      ', :"DS_TESTE_CONFIRMATORIO"'
      ', :"CD_OMS"'
      ', :"CD_CD4"'
      ', :"CD_EVOLUCAO"'
      ', :"DT_EVOLUCAO"'
      ', :"DS_OBSERVACAO"'
      ', :"CD_NOTIFICACAO"'
      ', :"REGDUP"'
      ', :"CD_LOTE"'
      ', :"NM_ENTREVISTADOR"'
      ', :"TEL_ENTREVISTADOR"'
      ', :"FUNCAO_ENTREVISTADOR"'
      ', :"NM_MEDICO"'
      ', :"TEL_MEDICO"'
      ', :"SN_TATUAGEM"'
      ', :"TP_ENTRADA"'
      ', :"EVIDENCIA_GESTANTE"'
      ', :"TB_ATUAL"'
      ', :"TB_ANTERIOR"'
      ', :"DT_TRATAMENTO_TB"'
      ', :"CD_PROVINCIA_TRATAMENTO"'
      ', :"CD_PROVINCIA_NOT"'
      ', :"DT_ALTERACAO"'
      ', :"DT_EXPORTACAO"'
      ', :"CD_FICHA_ORACLE"'
      ', :"CD_MEDICO"'
      ', :"NR_NOTIFICACAO"'
      ', :"CD_FICHA_SINVS"'
      ', :"CD_INVESTIGADOR"'
      ', :"DT_TESTE_TRIAGEM"'
      ', :"DT_TESTE_CONFIRMATORIO"'
      ', :"NR_PROCESSO_UTENTE"'
      ', :"CD_UND"'
      ')'
      '')
    SelectSQL.Strings = (
      'SELECT * FROM NOTIFICACAO'
      'WHERE NR_NOTIFICACAO IS NULL')
    ModifySQL.Strings = (
      'update "NOTIFICACAO"'
      'set'
      ' "CD_FICHA" = :"CD_FICHA"'
      ', "CD_UNIDADE" = :"CD_UNIDADE"'
      ', "CD_USUARIO" = :"CD_USUARIO"'
      ', "CD_MUNICIPIO" = :"CD_MUNICIPIO"'
      ', "CD_UNIDADE_TRATAMENTO" = :"CD_UNIDADE_TRATAMENTO"'
      ', "CD_MUNICIPIO_TRATAMENTO" = :"CD_MUNICIPIO_TRATAMENTO"'
      ', "CD_PACIENTE" = :"CD_PACIENTE"'
      ', "DT_NOTIFICACAO" = :"DT_NOTIFICACAO"'
      ', "DT_DIAGNOSTICO" = :"DT_DIAGNOSTICO"'
      ', "CD_RELACOES_SEXO" = :"CD_RELACOES_SEXO"'
      ', "CD_MAE_POSITIVO" = :"CD_MAE_POSITIVO"'
      ', "CD_USOU_DROGA" = :"CD_USOU_DROGA"'
      ', "CD_ACIDENTE_MAT_BIO" = :"CD_ACIDENTE_MAT_BIO"'
      ', "SN_TRANSFUSAO_SANGUE" = :"SN_TRANSFUSAO_SANGUE"'
      ', "SN_PERFURACAO" = :"SN_PERFURACAO"'
      ', "SN_TRAT_DENTARIO" = :"SN_TRAT_DENTARIO"'
      ', "SN_INTERV_CIRURGICA" = :"SN_INTERV_CIRURGICA"'
      ', "SN_CIRCUNCISAO" = :"SN_CIRCUNCISAO"'
      ', "CD_TESTE_TRIAGEM" = :"CD_TESTE_TRIAGEM"'
      ', "DS_TESTE_TRIAGEM" = :"DS_TESTE_TRIAGEM"'
      ', "CD_OCUPACAO" = :"CD_OCUPACAO"'
      ', "DS_OCUPACAO" = :"DS_OCUPACAO"'
      ', "CD_TESTE_CONFIRMATORIO" = :"CD_TESTE_CONFIRMATORIO"'
      ', "DS_TESTE_CONFIRMATORIO" = :"DS_TESTE_CONFIRMATORIO"'
      ', "CD_OMS" = :"CD_OMS"'
      ', "CD_CD4" = :"CD_CD4"'
      ', "CD_EVOLUCAO" = :"CD_EVOLUCAO"'
      ', "DT_EVOLUCAO" = :"DT_EVOLUCAO"'
      ', "DS_OBSERVACAO" = :"DS_OBSERVACAO"'
      ', "CD_NOTIFICACAO" = :"CD_NOTIFICACAO"'
      ', "REGDUP" = :"REGDUP"'
      ', "CD_LOTE" = :"CD_LOTE"'
      ', "NM_ENTREVISTADOR" = :"NM_ENTREVISTADOR"'
      ', "TEL_ENTREVISTADOR" = :"TEL_ENTREVISTADOR"'
      ', "FUNCAO_ENTREVISTADOR" = :"FUNCAO_ENTREVISTADOR"'
      ', "NM_MEDICO" = :"NM_MEDICO"'
      ', "TEL_MEDICO" = :"TEL_MEDICO"'
      ', "SN_TATUAGEM" = :"SN_TATUAGEM"'
      ', "TP_ENTRADA" = :"TP_ENTRADA"'
      ', "EVIDENCIA_GESTANTE" = :"EVIDENCIA_GESTANTE"'
      ', "TB_ATUAL" = :"TB_ATUAL"'
      ', "TB_ANTERIOR" = :"TB_ANTERIOR"'
      ', "DT_TRATAMENTO_TB" = :"DT_TRATAMENTO_TB"'
      ', "CD_PROVINCIA_TRATAMENTO" = :"CD_PROVINCIA_TRATAMENTO"'
      ', "CD_PROVINCIA_NOT" = :"CD_PROVINCIA_NOT"'
      ', "DT_ALTERACAO" = :"DT_ALTERACAO"'
      ', "DT_EXPORTACAO" = :"DT_EXPORTACAO"'
      ', "CD_FICHA_ORACLE" = :"CD_FICHA_ORACLE"'
      ', "CD_MEDICO" = :"CD_MEDICO"'
      ', "NR_NOTIFICACAO" = :"NR_NOTIFICACAO"'
      ', "CD_FICHA_SINVS" = :"CD_FICHA_SINVS"'
      ', "CD_INVESTIGADOR" = :"CD_INVESTIGADOR"'
      ', "DT_TESTE_TRIAGEM" = :"DT_TESTE_TRIAGEM"'
      ', "DT_TESTE_CONFIRMATORIO" = :"DT_TESTE_CONFIRMATORIO"'
      ', "NR_PROCESSO_UTENTE" = :"NR_PROCESSO_UTENTE"'
      ', "CD_UND" = :"CD_UND"'
      'where'
      '  "CD_FICHA" = :"OLD_CD_FICHA"'
      '')
    Left = 696
    Top = 499
    object TB_NR_NOTIFICACAONR_NOTIFICACAO: TIBStringField
      FieldName = 'NR_NOTIFICACAO'
      Origin = 'NOTIFICACAO.NR_NOTIFICACAO'
      Size = 10
    end
    object TB_NR_NOTIFICACAOCD_UNIDADE: TIntegerField
      FieldName = 'CD_UNIDADE'
      Origin = 'NOTIFICACAO.CD_UNIDADE'
      Required = True
    end
    object TB_NR_NOTIFICACAOCD_FICHA: TLargeintField
      FieldName = 'CD_FICHA'
      Origin = 'NOTIFICACAO.CD_FICHA'
      Required = True
    end
    object TB_NR_NOTIFICACAOCD_UND: TIntegerField
      FieldName = 'CD_UND'
      Origin = 'NOTIFICACAO.CD_UND'
      Required = True
    end
    object TB_NR_NOTIFICACAOCD_USUARIO: TIntegerField
      FieldName = 'CD_USUARIO'
      Origin = 'NOTIFICACAO.CD_USUARIO'
      Required = True
    end
    object TB_NR_NOTIFICACAOCD_MUNICIPIO: TIntegerField
      FieldName = 'CD_MUNICIPIO'
      Origin = 'NOTIFICACAO.CD_MUNICIPIO'
      Required = True
    end
    object TB_NR_NOTIFICACAOCD_UNIDADE_TRATAMENTO: TIntegerField
      FieldName = 'CD_UNIDADE_TRATAMENTO'
      Origin = 'NOTIFICACAO.CD_UNIDADE_TRATAMENTO'
    end
    object TB_NR_NOTIFICACAOCD_MUNICIPIO_TRATAMENTO: TIntegerField
      FieldName = 'CD_MUNICIPIO_TRATAMENTO'
      Origin = 'NOTIFICACAO.CD_MUNICIPIO_TRATAMENTO'
    end
    object TB_NR_NOTIFICACAOCD_PACIENTE: TIntegerField
      FieldName = 'CD_PACIENTE'
      Origin = 'NOTIFICACAO.CD_PACIENTE'
      Required = True
    end
    object TB_NR_NOTIFICACAODT_NOTIFICACAO: TDateField
      FieldName = 'DT_NOTIFICACAO'
      Origin = 'NOTIFICACAO.DT_NOTIFICACAO'
      Required = True
    end
    object TB_NR_NOTIFICACAODT_DIAGNOSTICO: TDateField
      FieldName = 'DT_DIAGNOSTICO'
      Origin = 'NOTIFICACAO.DT_DIAGNOSTICO'
      Required = True
    end
    object TB_NR_NOTIFICACAOCD_RELACOES_SEXO: TSmallintField
      FieldName = 'CD_RELACOES_SEXO'
      Origin = 'NOTIFICACAO.CD_RELACOES_SEXO'
    end
    object TB_NR_NOTIFICACAOCD_MAE_POSITIVO: TSmallintField
      FieldName = 'CD_MAE_POSITIVO'
      Origin = 'NOTIFICACAO.CD_MAE_POSITIVO'
    end
    object TB_NR_NOTIFICACAOCD_USOU_DROGA: TSmallintField
      FieldName = 'CD_USOU_DROGA'
      Origin = 'NOTIFICACAO.CD_USOU_DROGA'
    end
    object TB_NR_NOTIFICACAOCD_ACIDENTE_MAT_BIO: TSmallintField
      FieldName = 'CD_ACIDENTE_MAT_BIO'
      Origin = 'NOTIFICACAO.CD_ACIDENTE_MAT_BIO'
    end
    object TB_NR_NOTIFICACAOSN_TRANSFUSAO_SANGUE: TIntegerField
      FieldName = 'SN_TRANSFUSAO_SANGUE'
      Origin = 'NOTIFICACAO.SN_TRANSFUSAO_SANGUE'
    end
    object TB_NR_NOTIFICACAOSN_PERFURACAO: TIntegerField
      FieldName = 'SN_PERFURACAO'
      Origin = 'NOTIFICACAO.SN_PERFURACAO'
    end
    object TB_NR_NOTIFICACAOSN_TRAT_DENTARIO: TIntegerField
      FieldName = 'SN_TRAT_DENTARIO'
      Origin = 'NOTIFICACAO.SN_TRAT_DENTARIO'
    end
    object TB_NR_NOTIFICACAOSN_INTERV_CIRURGICA: TIntegerField
      FieldName = 'SN_INTERV_CIRURGICA'
      Origin = 'NOTIFICACAO.SN_INTERV_CIRURGICA'
    end
    object TB_NR_NOTIFICACAOSN_CIRCUNCISAO: TIntegerField
      FieldName = 'SN_CIRCUNCISAO'
      Origin = 'NOTIFICACAO.SN_CIRCUNCISAO'
    end
    object TB_NR_NOTIFICACAOCD_TESTE_TRIAGEM: TSmallintField
      FieldName = 'CD_TESTE_TRIAGEM'
      Origin = 'NOTIFICACAO.CD_TESTE_TRIAGEM'
      Required = True
    end
    object TB_NR_NOTIFICACAODS_TESTE_TRIAGEM: TIBStringField
      FieldName = 'DS_TESTE_TRIAGEM'
      Origin = 'NOTIFICACAO.DS_TESTE_TRIAGEM'
      Size = 50
    end
    object TB_NR_NOTIFICACAOCD_OCUPACAO: TSmallintField
      FieldName = 'CD_OCUPACAO'
      Origin = 'NOTIFICACAO.CD_OCUPACAO'
    end
    object TB_NR_NOTIFICACAODS_OCUPACAO: TIBStringField
      FieldName = 'DS_OCUPACAO'
      Origin = 'NOTIFICACAO.DS_OCUPACAO'
      Size = 50
    end
    object TB_NR_NOTIFICACAOCD_TESTE_CONFIRMATORIO: TSmallintField
      FieldName = 'CD_TESTE_CONFIRMATORIO'
      Origin = 'NOTIFICACAO.CD_TESTE_CONFIRMATORIO'
      Required = True
    end
    object TB_NR_NOTIFICACAODS_TESTE_CONFIRMATORIO: TIBStringField
      FieldName = 'DS_TESTE_CONFIRMATORIO'
      Origin = 'NOTIFICACAO.DS_TESTE_CONFIRMATORIO'
      Size = 50
    end
    object TB_NR_NOTIFICACAOCD_OMS: TSmallintField
      FieldName = 'CD_OMS'
      Origin = 'NOTIFICACAO.CD_OMS'
    end
    object TB_NR_NOTIFICACAOCD_CD4: TIntegerField
      FieldName = 'CD_CD4'
      Origin = 'NOTIFICACAO.CD_CD4'
    end
    object TB_NR_NOTIFICACAOCD_EVOLUCAO: TSmallintField
      FieldName = 'CD_EVOLUCAO'
      Origin = 'NOTIFICACAO.CD_EVOLUCAO'
    end
    object TB_NR_NOTIFICACAODT_EVOLUCAO: TDateField
      FieldName = 'DT_EVOLUCAO'
      Origin = 'NOTIFICACAO.DT_EVOLUCAO'
    end
    object TB_NR_NOTIFICACAODS_OBSERVACAO: TIBStringField
      FieldName = 'DS_OBSERVACAO'
      Origin = 'NOTIFICACAO.DS_OBSERVACAO'
      Size = 1000
    end
    object TB_NR_NOTIFICACAOCD_NOTIFICACAO: TIntegerField
      FieldName = 'CD_NOTIFICACAO'
      Origin = 'NOTIFICACAO.CD_NOTIFICACAO'
      Required = True
    end
    object TB_NR_NOTIFICACAOREGDUP: TIBStringField
      FieldName = 'REGDUP'
      Origin = 'NOTIFICACAO.REGDUP'
      FixedChar = True
      Size = 1
    end
    object TB_NR_NOTIFICACAOCD_LOTE: TIntegerField
      FieldName = 'CD_LOTE'
      Origin = 'NOTIFICACAO.CD_LOTE'
    end
    object TB_NR_NOTIFICACAONM_ENTREVISTADOR: TIBStringField
      FieldName = 'NM_ENTREVISTADOR'
      Origin = 'NOTIFICACAO.NM_ENTREVISTADOR'
      Size = 50
    end
    object TB_NR_NOTIFICACAOTEL_ENTREVISTADOR: TIBStringField
      FieldName = 'TEL_ENTREVISTADOR'
      Origin = 'NOTIFICACAO.TEL_ENTREVISTADOR'
      Size = 10
    end
    object TB_NR_NOTIFICACAOFUNCAO_ENTREVISTADOR: TIBStringField
      FieldName = 'FUNCAO_ENTREVISTADOR'
      Origin = 'NOTIFICACAO.FUNCAO_ENTREVISTADOR'
      Size = 50
    end
    object TB_NR_NOTIFICACAONM_MEDICO: TIBStringField
      FieldName = 'NM_MEDICO'
      Origin = 'NOTIFICACAO.NM_MEDICO'
      Size = 50
    end
    object TB_NR_NOTIFICACAOTEL_MEDICO: TIBStringField
      FieldName = 'TEL_MEDICO'
      Origin = 'NOTIFICACAO.TEL_MEDICO'
      Size = 10
    end
    object TB_NR_NOTIFICACAOSN_TATUAGEM: TIntegerField
      FieldName = 'SN_TATUAGEM'
      Origin = 'NOTIFICACAO.SN_TATUAGEM'
    end
    object TB_NR_NOTIFICACAOTP_ENTRADA: TIntegerField
      FieldName = 'TP_ENTRADA'
      Origin = 'NOTIFICACAO.TP_ENTRADA'
    end
    object TB_NR_NOTIFICACAOEVIDENCIA_GESTANTE: TIntegerField
      FieldName = 'EVIDENCIA_GESTANTE'
      Origin = 'NOTIFICACAO.EVIDENCIA_GESTANTE'
    end
    object TB_NR_NOTIFICACAOTB_ATUAL: TIntegerField
      FieldName = 'TB_ATUAL'
      Origin = 'NOTIFICACAO.TB_ATUAL'
    end
    object TB_NR_NOTIFICACAOTB_ANTERIOR: TIntegerField
      FieldName = 'TB_ANTERIOR'
      Origin = 'NOTIFICACAO.TB_ANTERIOR'
    end
    object TB_NR_NOTIFICACAODT_TRATAMENTO_TB: TDateField
      FieldName = 'DT_TRATAMENTO_TB'
      Origin = 'NOTIFICACAO.DT_TRATAMENTO_TB'
    end
    object TB_NR_NOTIFICACAOCD_PROVINCIA_TRATAMENTO: TIntegerField
      FieldName = 'CD_PROVINCIA_TRATAMENTO'
      Origin = 'NOTIFICACAO.CD_PROVINCIA_TRATAMENTO'
    end
    object TB_NR_NOTIFICACAOCD_PROVINCIA_NOT: TIntegerField
      FieldName = 'CD_PROVINCIA_NOT'
      Origin = 'NOTIFICACAO.CD_PROVINCIA_NOT'
    end
    object TB_NR_NOTIFICACAODT_ALTERACAO: TDateTimeField
      FieldName = 'DT_ALTERACAO'
      Origin = 'NOTIFICACAO.DT_ALTERACAO'
    end
    object TB_NR_NOTIFICACAODT_EXPORTACAO: TDateTimeField
      FieldName = 'DT_EXPORTACAO'
      Origin = 'NOTIFICACAO.DT_EXPORTACAO'
    end
    object TB_NR_NOTIFICACAOCD_FICHA_ORACLE: TIntegerField
      FieldName = 'CD_FICHA_ORACLE'
      Origin = 'NOTIFICACAO.CD_FICHA_ORACLE'
    end
    object TB_NR_NOTIFICACAOCD_MEDICO: TIntegerField
      FieldName = 'CD_MEDICO'
      Origin = 'NOTIFICACAO.CD_MEDICO'
    end
    object TB_NR_NOTIFICACAOCD_FICHA_SINVS: TLargeintField
      FieldName = 'CD_FICHA_SINVS'
      Origin = 'NOTIFICACAO.CD_FICHA_SINVS'
    end
    object TB_NR_NOTIFICACAOCD_INVESTIGADOR: TIntegerField
      FieldName = 'CD_INVESTIGADOR'
      Origin = 'NOTIFICACAO.CD_INVESTIGADOR'
    end
    object TB_NR_NOTIFICACAODT_TESTE_TRIAGEM: TDateTimeField
      FieldName = 'DT_TESTE_TRIAGEM'
      Origin = 'NOTIFICACAO.DT_TESTE_TRIAGEM'
    end
    object TB_NR_NOTIFICACAODT_TESTE_CONFIRMATORIO: TDateTimeField
      FieldName = 'DT_TESTE_CONFIRMATORIO'
      Origin = 'NOTIFICACAO.DT_TESTE_CONFIRMATORIO'
    end
    object TB_NR_NOTIFICACAONR_PROCESSO_UTENTE: TIBStringField
      FieldName = 'NR_PROCESSO_UTENTE'
      Origin = 'NOTIFICACAO.NR_PROCESSO_UTENTE'
      Size = 30
    end
    object TB_NR_NOTIFICACAODT_EXP: TDateTimeField
      FieldName = 'DT_EXP'
      Origin = 'NOTIFICACAO.DT_EXP'
    end
    object TB_NR_NOTIFICACAOCD_EDI: TIntegerField
      FieldName = 'CD_EDI'
      Origin = 'NOTIFICACAO.CD_EDI'
    end
  end
  object TB_TARV_ACOMP: TIBDataSet
    Database = DM.DB
    Transaction = DM.TS
    AfterInsert = TB_TARV_ACOMPAfterInsert
    BeforePost = TB_TARV_ACOMPBeforePost
    BufferChunks = 1000
    CachedUpdates = False
    DeleteSQL.Strings = (
      'delete from "REGISTRO_TARV_ACOMP"'
      'where  "REGISTRO_TARV_ACOMP"."CD_UNIDADE" = :CD_UNIDADE'
      'and      "REGISTRO_TARV_ACOMP"."CD_PROVINCIA" = :CD_PROVINCIA'
      'and      "REGISTRO_TARV_ACOMP"."CD_MUNICIPIO" = :CD_MUNICIPIO'
      'and      "REGISTRO_TARV_ACOMP"."VL_MESANO" = :VL_MESANO')
    InsertSQL.Strings = (
      'insert into "REGISTRO_TARV_ACOMP"'
      '('
      '  "CD_REGISTRO_TARV_ACOMP"'
      ', "CD_UND"'
      ', "DT_REGISTRO"'
      ', "CD_UNIDADE"'
      ', "CD_PROVINCIA"'
      ', "CD_MUNICIPIO"'
      ', "VL_MESANO"'
      ', "VL_ACUMULADOS"'
      ', "VL_NOVOS"'
      ', "VL_TRANSFERIDOS"'
      ', "VL_ABANDONOS"'
      ', "VL_TRANSFERIDOS_PARA"'
      ', "VL_OBITOS"'
      ', "ID_FAIXA_ETARIA"'
      ', "FL_SEXO"'
      ', "FL_GESTANTE"'
      ', "VL_X"'
      ', "VL_Y"'
      ', "CD_USU_INCLUSAO"'
      ', "DT_INCLUSAO"'
      ', "CD_USU_ALTERACAO"'
      ', "DT_ALTERACAO"'
      ', "CD_REGISTRO_GERAL"'
      ', "NM_USU"'
      ', "VL_VERSAO"'
      ')'
      'values'
      '('
      '  :"CD_REGISTRO_TARV_ACOMP"'
      ', :"CD_UND"'
      ', :"DT_REGISTRO"'
      ', :"CD_UNIDADE"'
      ', :"CD_PROVINCIA"'
      ', :"CD_MUNICIPIO"'
      ', :"VL_MESANO"'
      ', :"VL_ACUMULADOS"'
      ', :"VL_NOVOS"'
      ', :"VL_TRANSFERIDOS"'
      ', :"VL_ABANDONOS"'
      ', :"VL_TRANSFERIDOS_PARA"'
      ', :"VL_OBITOS"'
      ', :"ID_FAIXA_ETARIA"'
      ', :"FL_SEXO"'
      ', :"FL_GESTANTE"'
      ', :"VL_X"'
      ', :"VL_Y"'
      ', :"CD_USU_INCLUSAO"'
      ', :"DT_INCLUSAO"'
      ', :"CD_USU_ALTERACAO"'
      ', :"DT_ALTERACAO"'
      ', :"CD_REGISTRO_GERAL"'
      ', :"NM_USU"'
      ', :"VL_VERSAO"'
      ')')
    SelectSQL.Strings = (
      'select "REGISTRO_TARV_ACOMP"."CD_REGISTRO_TARV_ACOMP"'
      '      ,"REGISTRO_TARV_ACOMP"."DT_REGISTRO"'
      '      ,"REGISTRO_TARV_ACOMP"."CD_UNIDADE"'
      '      ,"REGISTRO_TARV_ACOMP"."CD_PROVINCIA"'
      '      ,"REGISTRO_TARV_ACOMP"."CD_MUNICIPIO"'
      '      ,"REGISTRO_TARV_ACOMP"."VL_MESANO"'
      '      ,"REGISTRO_TARV_ACOMP"."VL_ACUMULADOS"'
      '      ,"REGISTRO_TARV_ACOMP"."VL_NOVOS"'
      '      ,"REGISTRO_TARV_ACOMP"."VL_TRANSFERIDOS"'
      '      ,"REGISTRO_TARV_ACOMP"."VL_ABANDONOS"'
      '      ,"REGISTRO_TARV_ACOMP"."VL_TRANSFERIDOS_PARA"'
      '      ,"REGISTRO_TARV_ACOMP"."VL_OBITOS"'
      '      ,"REGISTRO_TARV_ACOMP"."ID_FAIXA_ETARIA"'
      '      ,"REGISTRO_TARV_ACOMP"."FL_SEXO"'
      '      ,"REGISTRO_TARV_ACOMP"."FL_GESTANTE"'
      '      ,"REGISTRO_TARV_ACOMP"."VL_X"'
      '      ,"REGISTRO_TARV_ACOMP"."VL_Y"'
      '      ,"REGISTRO_TARV_ACOMP"."CD_UND"'
      '      ,"REGISTRO_TARV_ACOMP"."CD_REGISTRO_GERAL"'
      '      ,"REGISTRO_TARV_ACOMP"."NM_USU"'
      '      ,"REGISTRO_TARV_ACOMP"."VL_VERSAO"'
      '      ,"REGISTRO_TARV_ACOMP"."CD_USU_INCLUSAO"'
      '      ,"REGISTRO_TARV_ACOMP"."DT_INCLUSAO"'
      '      ,"REGISTRO_TARV_ACOMP"."CD_USU_ALTERACAO"'
      '      ,"REGISTRO_TARV_ACOMP"."DT_ALTERACAO"'
      'from "REGISTRO_TARV_ACOMP"'
      'where  "REGISTRO_TARV_ACOMP"."CD_UNIDADE" = :CD_UNIDADE'
      'and      "REGISTRO_TARV_ACOMP"."CD_PROVINCIA" = :CD_PROVINCIA'
      'and      "REGISTRO_TARV_ACOMP"."CD_MUNICIPIO" = :CD_MUNICIPIO'
      'and      "REGISTRO_TARV_ACOMP"."VL_MESANO" = :VL_MESANO')
    ModifySQL.Strings = (
      'update "REGISTRO_TARV_ACOMP"'
      'set'
      ' "CD_REGISTRO_TARV_ACOMP" = :"CD_REGISTRO_TARV_ACOMP"'
      ', "CD_UND" = :"CD_UND"'
      ', "DT_REGISTRO" = :"DT_REGISTRO"'
      ', "CD_UNIDADE" = :"CD_UNIDADE"'
      ', "CD_PROVINCIA" = :"CD_PROVINCIA"'
      ', "CD_MUNICIPIO" = :"CD_MUNICIPIO"'
      ', "VL_MESANO" = :"VL_MESANO"'
      ', "VL_ACUMULADOS" = :"VL_ACUMULADOS"'
      ', "VL_NOVOS" = :"VL_NOVOS"'
      ', "VL_TRANSFERIDOS" = :"VL_TRANSFERIDOS"'
      ', "VL_ABANDONOS" = :"VL_ABANDONOS"'
      ', "VL_TRANSFERIDOS_PARA" = :"VL_TRANSFERIDOS_PARA"'
      ', "VL_OBITOS" = :"VL_OBITOS"'
      ', "ID_FAIXA_ETARIA" = :"ID_FAIXA_ETARIA"'
      ', "FL_SEXO" = :"FL_SEXO"'
      ', "FL_GESTANTE" = :"FL_GESTANTE"'
      ', "VL_X" = :"VL_X"'
      ', "VL_Y" = :"VL_Y"'
      ', "CD_USU_INCLUSAO" = :"CD_USU_INCLUSAO"'
      ', "DT_INCLUSAO" = :"DT_INCLUSAO"'
      ', "CD_USU_ALTERACAO" = :"CD_USU_ALTERACAO"'
      ', "DT_ALTERACAO" = :"DT_ALTERACAO"'
      ', "CD_REGISTRO_GERAL" = :"CD_REGISTRO_GERAL"'
      ', "NM_USU" = :"NM_USU"'
      ', "VL_VERSAO" = :"VL_VERSAO"'
      'where'
      '  "CD_REGISTRO_TARV_ACOMP" = :"OLD_CD_REGISTRO_TARV_ACOMP" and '
      '  "CD_UND" = :"OLD_CD_UND"')
    GeneratorField.Field = 'CD_REGISTRO_TARV_ACOMP'
    GeneratorField.Generator = 'GEN_REGISTRO_TARV_ACOMP'
    Left = 296
    Top = 459
    object TB_TARV_ACOMPCD_REGISTRO_TARV_ACOMP: TIntegerField
      FieldName = 'CD_REGISTRO_TARV_ACOMP'
      Origin = 'REGISTRO_TARV_ACOMP.CD_REGISTRO_TARV_ACOMP'
      Required = True
    end
    object TB_TARV_ACOMPDT_REGISTRO: TDateTimeField
      FieldName = 'DT_REGISTRO'
      Origin = 'REGISTRO_TARV_ACOMP.DT_REGISTRO'
      Required = True
    end
    object TB_TARV_ACOMPCD_UNIDADE: TIntegerField
      FieldName = 'CD_UNIDADE'
      Origin = 'REGISTRO_TARV_ACOMP.CD_UNIDADE'
      Required = True
    end
    object TB_TARV_ACOMPCD_PROVINCIA: TIntegerField
      FieldName = 'CD_PROVINCIA'
      Origin = 'REGISTRO_TARV_ACOMP.CD_PROVINCIA'
      Required = True
    end
    object TB_TARV_ACOMPCD_MUNICIPIO: TIntegerField
      FieldName = 'CD_MUNICIPIO'
      Origin = 'REGISTRO_TARV_ACOMP.CD_MUNICIPIO'
      Required = True
    end
    object TB_TARV_ACOMPVL_MESANO: TIBStringField
      FieldName = 'VL_MESANO'
      Origin = 'REGISTRO_TARV_ACOMP.VL_MESANO'
      Required = True
      Size = 8
    end
    object TB_TARV_ACOMPVL_ACUMULADOS: TIntegerField
      FieldName = 'VL_ACUMULADOS'
      Origin = 'REGISTRO_TARV_ACOMP.VL_ACUMULADOS'
    end
    object TB_TARV_ACOMPVL_NOVOS: TIntegerField
      FieldName = 'VL_NOVOS'
      Origin = 'REGISTRO_TARV_ACOMP.VL_NOVOS'
    end
    object TB_TARV_ACOMPVL_TRANSFERIDOS: TIntegerField
      FieldName = 'VL_TRANSFERIDOS'
      Origin = 'REGISTRO_TARV_ACOMP.VL_TRANSFERIDOS'
    end
    object TB_TARV_ACOMPVL_ABANDONOS: TIntegerField
      FieldName = 'VL_ABANDONOS'
      Origin = 'REGISTRO_TARV_ACOMP.VL_ABANDONOS'
    end
    object TB_TARV_ACOMPVL_TRANSFERIDOS_PARA: TIntegerField
      FieldName = 'VL_TRANSFERIDOS_PARA'
      Origin = 'REGISTRO_TARV_ACOMP.VL_TRANSFERIDOS_PARA'
    end
    object TB_TARV_ACOMPVL_OBITOS: TIntegerField
      FieldName = 'VL_OBITOS'
      Origin = 'REGISTRO_TARV_ACOMP.VL_OBITOS'
    end
    object TB_TARV_ACOMPID_FAIXA_ETARIA: TIntegerField
      FieldName = 'ID_FAIXA_ETARIA'
      Origin = 'REGISTRO_TARV_ACOMP.ID_FAIXA_ETARIA'
    end
    object TB_TARV_ACOMPFL_SEXO: TIBStringField
      FieldName = 'FL_SEXO'
      Origin = 'REGISTRO_TARV_ACOMP.FL_SEXO'
      FixedChar = True
      Size = 1
    end
    object TB_TARV_ACOMPFL_GESTANTE: TIntegerField
      FieldName = 'FL_GESTANTE'
      Origin = 'REGISTRO_TARV_ACOMP.FL_GESTANTE'
    end
    object TB_TARV_ACOMPVL_X: TIntegerField
      FieldName = 'VL_X'
      Origin = 'REGISTRO_TARV_ACOMP.VL_X'
    end
    object TB_TARV_ACOMPVL_Y: TIntegerField
      FieldName = 'VL_Y'
      Origin = 'REGISTRO_TARV_ACOMP.VL_Y'
    end
    object TB_TARV_ACOMPCD_UND: TIntegerField
      FieldName = 'CD_UND'
      Origin = 'REGISTRO_TARV_ACOMP.CD_UND'
      Required = True
    end
    object TB_TARV_ACOMPCD_REGISTRO_GERAL: TIntegerField
      FieldName = 'CD_REGISTRO_GERAL'
      Origin = 'REGISTRO_TARV_ACOMP.CD_REGISTRO_GERAL'
    end
    object TB_TARV_ACOMPNM_USU: TIBStringField
      FieldName = 'NM_USU'
      Origin = 'REGISTRO_TARV_ACOMP.NM_USU'
      Size = 50
    end
    object TB_TARV_ACOMPVL_VERSAO: TIBStringField
      FieldName = 'VL_VERSAO'
      Origin = 'REGISTRO_TARV_ACOMP.VL_VERSAO'
    end
    object TB_TARV_ACOMPCD_USU_INCLUSAO: TIntegerField
      FieldName = 'CD_USU_INCLUSAO'
      Origin = 'REGISTRO_TARV_ACOMP.CD_USU_INCLUSAO'
    end
    object TB_TARV_ACOMPDT_INCLUSAO: TDateTimeField
      FieldName = 'DT_INCLUSAO'
      Origin = 'REGISTRO_TARV_ACOMP.DT_INCLUSAO'
    end
    object TB_TARV_ACOMPCD_USU_ALTERACAO: TIntegerField
      FieldName = 'CD_USU_ALTERACAO'
      Origin = 'REGISTRO_TARV_ACOMP.CD_USU_ALTERACAO'
    end
    object TB_TARV_ACOMPDT_ALTERACAO: TDateTimeField
      FieldName = 'DT_ALTERACAO'
      Origin = 'REGISTRO_TARV_ACOMP.DT_ALTERACAO'
    end
  end
  object TB_TARV_CD4: TIBDataSet
    Database = DM.DB
    Transaction = DM.TS
    AfterInsert = TB_TARV_CD4AfterInsert
    BeforePost = TB_TARV_CD4BeforePost
    BufferChunks = 1000
    CachedUpdates = False
    DeleteSQL.Strings = (
      'delete from "REGISTRO_TARV_CD4"'
      'where  "REGISTRO_TARV_CD4"."CD_UNIDADE" = :CD_UNIDADE'
      'and      "REGISTRO_TARV_CD4"."CD_PROVINCIA" = :CD_PROVINCIA'
      'and      "REGISTRO_TARV_CD4"."CD_MUNICIPIO" = :CD_MUNICIPIO'
      'and      "REGISTRO_TARV_CD4"."VL_MESANO" = :VL_MESANO')
    InsertSQL.Strings = (
      'insert into "REGISTRO_TARV_CD4"'
      '('
      '  "CD_REGISTRO_TARV_CD4"'
      ', "CD_UND"'
      ', "DT_REGISTRO"'
      ', "CD_UNIDADE"'
      ', "CD_PROVINCIA"'
      ', "CD_MUNICIPIO"'
      ', "VL_MESANO"'
      ', "VL_CD4_MENOR_350"'
      ', "VL_CD4_MAIOR_350"'
      ', "VL_ESTADO_CLINICO_1"'
      ', "VL_ESTADO_CLINICO_2"'
      ', "VL_ESTADO_CLINICO_3"'
      ', "VL_ESTADO_CLINICO_4"'
      ', "ID_FAIXA_ETARIA"'
      ', "FL_SEXO"'
      ', "FL_GESTANTE"'
      ', "VL_X"'
      ', "VL_Y"'
      ', "DT_EXP"'
      ', "CD_EDI"'
      ', "CD_USU_INCLUSAO"'
      ', "DT_INCLUSAO"'
      ', "CD_USU_ALTERACAO"'
      ', "DT_ALTERACAO"'
      ', "CD_REGISTRO_GERAL"'
      ', "NM_USU"'
      ', "VL_VERSAO"'
      ')'
      'values'
      '('
      '  :"CD_REGISTRO_TARV_CD4"'
      ', :"CD_UND"'
      ', :"DT_REGISTRO"'
      ', :"CD_UNIDADE"'
      ', :"CD_PROVINCIA"'
      ', :"CD_MUNICIPIO"'
      ', :"VL_MESANO"'
      ', :"VL_CD4_MENOR_350"'
      ', :"VL_CD4_MAIOR_350"'
      ', :"VL_ESTADO_CLINICO_1"'
      ', :"VL_ESTADO_CLINICO_2"'
      ', :"VL_ESTADO_CLINICO_3"'
      ', :"VL_ESTADO_CLINICO_4"'
      ', :"ID_FAIXA_ETARIA"'
      ', :"FL_SEXO"'
      ', :"FL_GESTANTE"'
      ', :"VL_X"'
      ', :"VL_Y"'
      ', :"DT_EXP"'
      ', :"CD_EDI"'
      ', :"CD_USU_INCLUSAO"'
      ', :"DT_INCLUSAO"'
      ', :"CD_USU_ALTERACAO"'
      ', :"DT_ALTERACAO"'
      ', :"CD_REGISTRO_GERAL"'
      ', :"NM_USU"'
      ', :"VL_VERSAO"'
      ')')
    SelectSQL.Strings = (
      'select "REGISTRO_TARV_CD4"."CD_REGISTRO_TARV_CD4"'
      '      ,"REGISTRO_TARV_CD4"."CD_UND"'
      '      ,"REGISTRO_TARV_CD4"."DT_REGISTRO"'
      '      ,"REGISTRO_TARV_CD4"."CD_UNIDADE"'
      '      ,"REGISTRO_TARV_CD4"."CD_PROVINCIA"'
      '      ,"REGISTRO_TARV_CD4"."CD_MUNICIPIO"'
      '      ,"REGISTRO_TARV_CD4"."VL_MESANO"'
      '      ,"REGISTRO_TARV_CD4"."VL_CD4_MENOR_350"'
      '      ,"REGISTRO_TARV_CD4"."VL_CD4_MAIOR_350"'
      '      ,"REGISTRO_TARV_CD4"."VL_ESTADO_CLINICO_1"'
      '      ,"REGISTRO_TARV_CD4"."VL_ESTADO_CLINICO_2"'
      '      ,"REGISTRO_TARV_CD4"."VL_ESTADO_CLINICO_3"'
      '      ,"REGISTRO_TARV_CD4"."VL_ESTADO_CLINICO_4"'
      '      ,"REGISTRO_TARV_CD4"."ID_FAIXA_ETARIA"'
      '      ,"REGISTRO_TARV_CD4"."FL_SEXO"'
      '      ,"REGISTRO_TARV_CD4"."FL_GESTANTE"'
      '      ,"REGISTRO_TARV_CD4"."VL_X"'
      '      ,"REGISTRO_TARV_CD4"."VL_Y"'
      '      ,"REGISTRO_TARV_CD4"."DT_EXP"'
      '      ,"REGISTRO_TARV_CD4"."CD_EDI"'
      '      ,"REGISTRO_TARV_CD4"."CD_REGISTRO_GERAL"'
      '      ,"REGISTRO_TARV_CD4"."NM_USU"'
      '      ,"REGISTRO_TARV_CD4"."VL_VERSAO"'
      '      ,"REGISTRO_TARV_CD4"."CD_USU_INCLUSAO"'
      '      ,"REGISTRO_TARV_CD4"."DT_INCLUSAO"'
      '      ,"REGISTRO_TARV_CD4"."CD_USU_ALTERACAO"'
      '      ,"REGISTRO_TARV_CD4"."DT_ALTERACAO"'
      'from "REGISTRO_TARV_CD4"'
      'where  "REGISTRO_TARV_CD4"."CD_UNIDADE" = :CD_UNIDADE'
      'and      "REGISTRO_TARV_CD4"."CD_PROVINCIA" = :CD_PROVINCIA'
      'and      "REGISTRO_TARV_CD4"."CD_MUNICIPIO" = :CD_MUNICIPIO'
      'and      "REGISTRO_TARV_CD4"."VL_MESANO" = :VL_MESANO'
      'order by'
      '"REGISTRO_TARV_CD4"."CD_REGISTRO_TARV_CD4"')
    ModifySQL.Strings = (
      'update "REGISTRO_TARV_CD4"'
      'set'
      ' "CD_REGISTRO_TARV_CD4" = :"CD_REGISTRO_TARV_CD4"'
      ', "CD_UND" = :"CD_UND"'
      ', "DT_REGISTRO" = :"DT_REGISTRO"'
      ', "CD_UNIDADE" = :"CD_UNIDADE"'
      ', "CD_PROVINCIA" = :"CD_PROVINCIA"'
      ', "CD_MUNICIPIO" = :"CD_MUNICIPIO"'
      ', "VL_MESANO" = :"VL_MESANO"'
      ', "VL_CD4_MENOR_350" = :"VL_CD4_MENOR_350"'
      ', "VL_CD4_MAIOR_350" = :"VL_CD4_MAIOR_350"'
      ', "VL_ESTADO_CLINICO_1" = :"VL_ESTADO_CLINICO_1"'
      ', "VL_ESTADO_CLINICO_2" = :"VL_ESTADO_CLINICO_2"'
      ', "VL_ESTADO_CLINICO_3" = :"VL_ESTADO_CLINICO_3"'
      ', "VL_ESTADO_CLINICO_4" = :"VL_ESTADO_CLINICO_4"'
      ', "ID_FAIXA_ETARIA" = :"ID_FAIXA_ETARIA"'
      ', "FL_SEXO" = :"FL_SEXO"'
      ', "FL_GESTANTE" = :"FL_GESTANTE"'
      ', "VL_X" = :"VL_X"'
      ', "VL_Y" = :"VL_Y"'
      ', "DT_EXP" = :"DT_EXP"'
      ', "CD_EDI" = :"CD_EDI"'
      ', "CD_USU_INCLUSAO" = :"CD_USU_INCLUSAO"'
      ', "DT_INCLUSAO" = :"DT_INCLUSAO"'
      ', "CD_USU_ALTERACAO" = :"CD_USU_ALTERACAO"'
      ', "DT_ALTERACAO" = :"DT_ALTERACAO"'
      ', "CD_REGISTRO_GERAL" = :"CD_REGISTRO_GERAL"'
      ', "NM_USU" = :"NM_USU"'
      ', "VL_VERSAO" = :"VL_VERSAO"'
      'where'
      '  "CD_REGISTRO_TARV_CD4" = :"OLD_CD_REGISTRO_TARV_CD4" and '
      '  "CD_UND" = :"OLD_CD_UND"')
    GeneratorField.Field = 'CD_REGISTRO_TARV_CD4'
    GeneratorField.Generator = 'GEN_REGISTRO_TARV_CD4'
    Left = 576
    Top = 547
    object TB_TARV_CD4CD_REGISTRO_TARV_CD4: TIntegerField
      FieldName = 'CD_REGISTRO_TARV_CD4'
      Origin = 'REGISTRO_TARV_CD4.CD_REGISTRO_TARV_CD4'
      Required = True
    end
    object TB_TARV_CD4CD_UND: TIntegerField
      FieldName = 'CD_UND'
      Origin = 'REGISTRO_TARV_CD4.CD_UND'
      Required = True
    end
    object TB_TARV_CD4DT_REGISTRO: TDateTimeField
      FieldName = 'DT_REGISTRO'
      Origin = 'REGISTRO_TARV_CD4.DT_REGISTRO'
      Required = True
    end
    object TB_TARV_CD4CD_UNIDADE: TIntegerField
      FieldName = 'CD_UNIDADE'
      Origin = 'REGISTRO_TARV_CD4.CD_UNIDADE'
      Required = True
    end
    object TB_TARV_CD4CD_PROVINCIA: TIntegerField
      FieldName = 'CD_PROVINCIA'
      Origin = 'REGISTRO_TARV_CD4.CD_PROVINCIA'
      Required = True
    end
    object TB_TARV_CD4CD_MUNICIPIO: TIntegerField
      FieldName = 'CD_MUNICIPIO'
      Origin = 'REGISTRO_TARV_CD4.CD_MUNICIPIO'
      Required = True
    end
    object TB_TARV_CD4VL_MESANO: TIBStringField
      FieldName = 'VL_MESANO'
      Origin = 'REGISTRO_TARV_CD4.VL_MESANO'
      Required = True
      Size = 8
    end
    object TB_TARV_CD4VL_CD4_MENOR_350: TIntegerField
      FieldName = 'VL_CD4_MENOR_350'
      Origin = 'REGISTRO_TARV_CD4.VL_CD4_MENOR_350'
    end
    object TB_TARV_CD4VL_CD4_MAIOR_350: TIntegerField
      FieldName = 'VL_CD4_MAIOR_350'
      Origin = 'REGISTRO_TARV_CD4.VL_CD4_MAIOR_350'
    end
    object TB_TARV_CD4VL_ESTADO_CLINICO_1: TIntegerField
      FieldName = 'VL_ESTADO_CLINICO_1'
      Origin = 'REGISTRO_TARV_CD4.VL_ESTADO_CLINICO_1'
    end
    object TB_TARV_CD4VL_ESTADO_CLINICO_2: TIntegerField
      FieldName = 'VL_ESTADO_CLINICO_2'
      Origin = 'REGISTRO_TARV_CD4.VL_ESTADO_CLINICO_2'
    end
    object TB_TARV_CD4VL_ESTADO_CLINICO_3: TIntegerField
      FieldName = 'VL_ESTADO_CLINICO_3'
      Origin = 'REGISTRO_TARV_CD4.VL_ESTADO_CLINICO_3'
    end
    object TB_TARV_CD4VL_ESTADO_CLINICO_4: TIntegerField
      FieldName = 'VL_ESTADO_CLINICO_4'
      Origin = 'REGISTRO_TARV_CD4.VL_ESTADO_CLINICO_4'
    end
    object TB_TARV_CD4ID_FAIXA_ETARIA: TIntegerField
      FieldName = 'ID_FAIXA_ETARIA'
      Origin = 'REGISTRO_TARV_CD4.ID_FAIXA_ETARIA'
    end
    object TB_TARV_CD4FL_SEXO: TIBStringField
      FieldName = 'FL_SEXO'
      Origin = 'REGISTRO_TARV_CD4.FL_SEXO'
      FixedChar = True
      Size = 1
    end
    object TB_TARV_CD4FL_GESTANTE: TIntegerField
      FieldName = 'FL_GESTANTE'
      Origin = 'REGISTRO_TARV_CD4.FL_GESTANTE'
    end
    object TB_TARV_CD4VL_X: TIntegerField
      FieldName = 'VL_X'
      Origin = 'REGISTRO_TARV_CD4.VL_X'
    end
    object TB_TARV_CD4VL_Y: TIntegerField
      FieldName = 'VL_Y'
      Origin = 'REGISTRO_TARV_CD4.VL_Y'
    end
    object TB_TARV_CD4DT_EXP: TDateTimeField
      FieldName = 'DT_EXP'
      Origin = 'REGISTRO_TARV_CD4.DT_EXP'
    end
    object TB_TARV_CD4CD_EDI: TIntegerField
      FieldName = 'CD_EDI'
      Origin = 'REGISTRO_TARV_CD4.CD_EDI'
    end
    object TB_TARV_CD4CD_REGISTRO_GERAL: TIntegerField
      FieldName = 'CD_REGISTRO_GERAL'
      Origin = 'REGISTRO_TARV_CD4.CD_REGISTRO_GERAL'
    end
    object TB_TARV_CD4NM_USU: TIBStringField
      FieldName = 'NM_USU'
      Origin = 'REGISTRO_TARV_CD4.NM_USU'
      Size = 50
    end
    object TB_TARV_CD4VL_VERSAO: TIBStringField
      FieldName = 'VL_VERSAO'
      Origin = 'REGISTRO_TARV_CD4.VL_VERSAO'
    end
    object TB_TARV_CD4CD_USU_INCLUSAO: TIntegerField
      FieldName = 'CD_USU_INCLUSAO'
      Origin = 'REGISTRO_TARV_CD4.CD_USU_INCLUSAO'
    end
    object TB_TARV_CD4DT_INCLUSAO: TDateTimeField
      FieldName = 'DT_INCLUSAO'
      Origin = 'REGISTRO_TARV_CD4.DT_INCLUSAO'
    end
    object TB_TARV_CD4CD_USU_ALTERACAO: TIntegerField
      FieldName = 'CD_USU_ALTERACAO'
      Origin = 'REGISTRO_TARV_CD4.CD_USU_ALTERACAO'
    end
    object TB_TARV_CD4DT_ALTERACAO: TDateTimeField
      FieldName = 'DT_ALTERACAO'
      Origin = 'REGISTRO_TARV_CD4.DT_ALTERACAO'
    end
  end
  object qyMedico: TIBQuery
    Database = DM.DB
    Transaction = DM.TS
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'SELECT * FROM MEDICO')
    Left = 696
    Top = 211
  end
  object TB_VINC_USUARIO_MEDICO: TIBDataSet
    Database = DM.DB
    Transaction = DM.TS
    BufferChunks = 1000
    CachedUpdates = False
    DeleteSQL.Strings = (
      'delete from "VINC_USUARIO_MEDICO"'
      'where'
      '  "CD_USUARIO" = :"OLD_CD_USUARIO" and '
      '  "CD_MEDICO" = :"OLD_CD_MEDICO"')
    InsertSQL.Strings = (
      'insert into "VINC_USUARIO_MEDICO"'
      '('
      '  "CD_USUARIO"'
      ', "CD_MEDICO"'
      ')'
      'values'
      '('
      '  :"CD_USUARIO"'
      ', :"CD_MEDICO"'
      ')')
    SelectSQL.Strings = (
      'select '
      '      "VINC_USUARIO_MEDICO"."CD_USUARIO"'
      '      ,"VINC_USUARIO_MEDICO"."CD_MEDICO"'
      '      ,NM_MEDICO'
      'from "VINC_USUARIO_MEDICO", "MEDICO"'
      'WHERE "VINC_USUARIO_MEDICO".CD_USUARIO =  :CD_USUARIO'
      'AND'
      '      "VINC_USUARIO_MEDICO"."CD_MEDICO" =  "MEDICO"."CD_MEDICO"')
    ModifySQL.Strings = (
      'update "VINC_USUARIO_MEDICO"'
      'set'
      ' "CD_USUARIO" = :"CD_USUARIO"'
      ', "CD_MEDICO" = :"CD_MEDICO"'
      'where'
      '  "CD_USUARIO" = :"OLD_CD_USUARIO" and '
      '  "CD_MEDICO" = :"OLD_CD_MEDICO"')
    Left = 696
    Top = 611
    object TB_VINC_USUARIO_MEDICOCD_USUARIO: TIntegerField
      FieldName = 'CD_USUARIO'
      Origin = 'VINC_USUARIO_MEDICO.CD_USUARIO'
      Required = True
    end
    object TB_VINC_USUARIO_MEDICOCD_MEDICO: TIntegerField
      FieldName = 'CD_MEDICO'
      Origin = 'VINC_USUARIO_MEDICO.CD_MEDICO'
      Required = True
    end
    object TB_VINC_USUARIO_MEDICONM_MEDICO: TIBStringField
      FieldName = 'NM_MEDICO'
      Origin = 'MEDICO.NM_MEDICO'
      Size = 50
    end
  end
  object IBSQLMonitor1: TIBSQLMonitor
    OnSQL = IBSQLMonitor1SQL
    TraceFlags = [tfQExecute, tfError, tfStmt, tfConnect, tfTransact, tfService, tfMisc]
    Left = 784
    Top = 307
  end
  object TB_PRIMEIRA_CONSULTA: TIBDataSet
    Database = DM.DB
    Transaction = DM.TS
    AfterInsert = TB_PRIMEIRA_CONSULTAAfterInsert
    BeforeDelete = TB_PRIMEIRA_CONSULTABeforeDelete
    BeforePost = TB_PRIMEIRA_CONSULTABeforePost
    BufferChunks = 1000
    CachedUpdates = False
    DeleteSQL.Strings = (
      'delete from "PRIMEIRA_CONSULTA"'
      'where'
      '  "CD_PRIMEIRA_CONSULTA" = :"OLD_CD_PRIMEIRA_CONSULTA"')
    InsertSQL.Strings = (
      'insert into "PRIMEIRA_CONSULTA"'
      '('
      '  "CD_PRIMEIRA_CONSULTA"'
      ', "CD_PACIENTE"'
      ', "DT_DIAGNOSTICO"'
      ', "TP_TESTE"'
      ', "FL_PUERPERA"'
      ', "FL_ARVS"'
      ', "FL_PROFILAXIA"'
      ', "FL_TRATAMENTO"'
      ', "FL_FILHO_ACOMP"'
      ', "FL_SINTOMA1"'
      ', "TX_SINTOMA1"'
      ', "FL_SINTOMA2"'
      ', "TX_SINTOMA2"'
      ', "FL_SINTOMA3"'
      ', "TX_SINTOMA3"'
      ', "FL_SINTOMA4"'
      ', "TX_SINTOMA4"'
      ', "FL_SINTOMA5"'
      ', "TX_SINTOMA5"'
      ', "FL_SINTOMA6"'
      ', "TX_SINTOMA6"'
      ', "FL_SINTOMA7"'
      ', "TX_SINTOMA7"'
      ', "FL_SINTOMA8"'
      ', "TX_SINTOMA8"'
      ', "FL_SINTOMA9"'
      ', "TX_SINTOMA9"'
      ', "FL_SINTOMA10"'
      ', "TX_SINTOMA10"'
      ', "FL_SINTOMA11"'
      ', "TX_SINTOMA11"'
      ', "FL_SINTOMA12"'
      ', "TX_SINTOMA12"'
      ', "FL_SINTOMA13"'
      ', "TX_SINTOMA13"'
      ', "FL_SINTOMA14"'
      ', "TX_SINTOMA14"'
      ', "FL_SINTOMA15"'
      ', "TX_SINTOMA15"'
      ', "TX_OBS"'
      ', "TX_ANTECEDENTES1"'
      ', "TX_ANTECEDENTES2"'
      ', "TX_ANTECEDENTES3"'
      ', "TX_ANTECEDENTES4"'
      ', "TX_ANTECEDENTES_OUTROS"'
      ', "TX_SINAIS_VITAIS1"'
      ', "TX_SINAIS_VITAIS2"'
      ', "TX_SINAIS_VITAIS3"'
      ', "TX_SINAIS_VITAIS4"'
      ', "TX_SINAIS_VITAIS5"'
      ', "TX_EXAME_FISICO"'
      ', "TX_HIPOTESE1"'
      ', "TX_HIPOTESE2"'
      ', "TX_HIPOTESE3"'
      ', "TX_HIPOTESE4"'
      ', "TX_ANALISES"'
      ', "TX_CONDUTA1"'
      ', "TX_CONDUTA2"'
      ', "TX_CONDUTA3"'
      ', "TX_CONDUTA4"'
      ', "DT_RETORNO"'
      ', "TP_CONSULTA"'
      ', "TX_ENCAMINHAMENTO"'
      ', "NM_MEDICO"'
      ', "NR_ORDEM"'
      ', "CD_USUARIO_CADASTRO"'
      ', "DT_CADASTRO"'
      ', "CD_USUARIO_ALTERACAO"'
      ', "DT_ALTERACAO"'
      ', "CD_USUARIO_EXCLUSAO"'
      ', "DT_EXCLUSAO"'
      ', "CD_ARQUIVO"'
      ', "CD_ARQUIVO2"'
      ', "CD_GRUPO"'
      ')'
      'values'
      '('
      '  :"CD_PRIMEIRA_CONSULTA"'
      ', :"CD_PACIENTE"'
      ', :"DT_DIAGNOSTICO"'
      ', :"TP_TESTE"'
      ', :"FL_PUERPERA"'
      ', :"FL_ARVS"'
      ', :"FL_PROFILAXIA"'
      ', :"FL_TRATAMENTO"'
      ', :"FL_FILHO_ACOMP"'
      ', :"FL_SINTOMA1"'
      ', :"TX_SINTOMA1"'
      ', :"FL_SINTOMA2"'
      ', :"TX_SINTOMA2"'
      ', :"FL_SINTOMA3"'
      ', :"TX_SINTOMA3"'
      ', :"FL_SINTOMA4"'
      ', :"TX_SINTOMA4"'
      ', :"FL_SINTOMA5"'
      ', :"TX_SINTOMA5"'
      ', :"FL_SINTOMA6"'
      ', :"TX_SINTOMA6"'
      ', :"FL_SINTOMA7"'
      ', :"TX_SINTOMA7"'
      ', :"FL_SINTOMA8"'
      ', :"TX_SINTOMA8"'
      ', :"FL_SINTOMA9"'
      ', :"TX_SINTOMA9"'
      ', :"FL_SINTOMA10"'
      ', :"TX_SINTOMA10"'
      ', :"FL_SINTOMA11"'
      ', :"TX_SINTOMA11"'
      ', :"FL_SINTOMA12"'
      ', :"TX_SINTOMA12"'
      ', :"FL_SINTOMA13"'
      ', :"TX_SINTOMA13"'
      ', :"FL_SINTOMA14"'
      ', :"TX_SINTOMA14"'
      ', :"FL_SINTOMA15"'
      ', :"TX_SINTOMA15"'
      ', :"TX_OBS"'
      ', :"TX_ANTECEDENTES1"'
      ', :"TX_ANTECEDENTES2"'
      ', :"TX_ANTECEDENTES3"'
      ', :"TX_ANTECEDENTES4"'
      ', :"TX_ANTECEDENTES_OUTROS"'
      ', :"TX_SINAIS_VITAIS1"'
      ', :"TX_SINAIS_VITAIS2"'
      ', :"TX_SINAIS_VITAIS3"'
      ', :"TX_SINAIS_VITAIS4"'
      ', :"TX_SINAIS_VITAIS5"'
      ', :"TX_EXAME_FISICO"'
      ', :"TX_HIPOTESE1"'
      ', :"TX_HIPOTESE2"'
      ', :"TX_HIPOTESE3"'
      ', :"TX_HIPOTESE4"'
      ', :"TX_ANALISES"'
      ', :"TX_CONDUTA1"'
      ', :"TX_CONDUTA2"'
      ', :"TX_CONDUTA3"'
      ', :"TX_CONDUTA4"'
      ', :"DT_RETORNO"'
      ', :"TP_CONSULTA"'
      ', :"TX_ENCAMINHAMENTO"'
      ', :"NM_MEDICO"'
      ', :"NR_ORDEM"'
      ', :"CD_USUARIO_CADASTRO"'
      ', :"DT_CADASTRO"'
      ', :"CD_USUARIO_ALTERACAO"'
      ', :"DT_ALTERACAO"'
      ', :"CD_USUARIO_EXCLUSAO"'
      ', :"DT_EXCLUSAO"'
      ', :"CD_ARQUIVO"'
      ', :"CD_ARQUIVO2"'
      ', :"CD_GRUPO"'
      ')')
    SelectSQL.Strings = (
      'select "PRIMEIRA_CONSULTA"."CD_PRIMEIRA_CONSULTA"'
      '      ,"PRIMEIRA_CONSULTA"."CD_PACIENTE"'
      '      ,"PRIMEIRA_CONSULTA"."DT_DIAGNOSTICO"'
      '      ,"PRIMEIRA_CONSULTA"."TP_TESTE"'
      '      ,"PRIMEIRA_CONSULTA"."FL_PUERPERA"'
      '      ,"PRIMEIRA_CONSULTA"."FL_ARVS"'
      '      ,"PRIMEIRA_CONSULTA"."FL_PROFILAXIA"'
      '      ,"PRIMEIRA_CONSULTA"."FL_TRATAMENTO"'
      '      ,"PRIMEIRA_CONSULTA"."FL_FILHO_ACOMP"'
      '      ,"PRIMEIRA_CONSULTA"."FL_SINTOMA1"'
      '      ,"PRIMEIRA_CONSULTA"."TX_SINTOMA1"'
      '      ,"PRIMEIRA_CONSULTA"."FL_SINTOMA2"'
      '      ,"PRIMEIRA_CONSULTA"."TX_SINTOMA2"'
      '      ,"PRIMEIRA_CONSULTA"."FL_SINTOMA3"'
      '      ,"PRIMEIRA_CONSULTA"."TX_SINTOMA3"'
      '      ,"PRIMEIRA_CONSULTA"."FL_SINTOMA4"'
      '      ,"PRIMEIRA_CONSULTA"."TX_SINTOMA4"'
      '      ,"PRIMEIRA_CONSULTA"."FL_SINTOMA5"'
      '      ,"PRIMEIRA_CONSULTA"."TX_SINTOMA5"'
      '      ,"PRIMEIRA_CONSULTA"."FL_SINTOMA6"'
      '      ,"PRIMEIRA_CONSULTA"."TX_SINTOMA6"'
      '      ,"PRIMEIRA_CONSULTA"."FL_SINTOMA7"'
      '      ,"PRIMEIRA_CONSULTA"."TX_SINTOMA7"'
      '      ,"PRIMEIRA_CONSULTA"."FL_SINTOMA8"'
      '      ,"PRIMEIRA_CONSULTA"."TX_SINTOMA8"'
      '      ,"PRIMEIRA_CONSULTA"."FL_SINTOMA9"'
      '      ,"PRIMEIRA_CONSULTA"."TX_SINTOMA9"'
      '      ,"PRIMEIRA_CONSULTA"."FL_SINTOMA10"'
      '      ,"PRIMEIRA_CONSULTA"."TX_SINTOMA10"'
      '      ,"PRIMEIRA_CONSULTA"."FL_SINTOMA11"'
      '      ,"PRIMEIRA_CONSULTA"."TX_SINTOMA11"'
      '      ,"PRIMEIRA_CONSULTA"."FL_SINTOMA12"'
      '      ,"PRIMEIRA_CONSULTA"."TX_SINTOMA12"'
      '      ,"PRIMEIRA_CONSULTA"."FL_SINTOMA13"'
      '      ,"PRIMEIRA_CONSULTA"."TX_SINTOMA13"'
      '      ,"PRIMEIRA_CONSULTA"."FL_SINTOMA14"'
      '      ,"PRIMEIRA_CONSULTA"."TX_SINTOMA14"'
      '      ,"PRIMEIRA_CONSULTA"."FL_SINTOMA15"'
      '      ,"PRIMEIRA_CONSULTA"."TX_SINTOMA15"'
      '      ,"PRIMEIRA_CONSULTA"."TX_OBS"'
      '      ,"PRIMEIRA_CONSULTA"."TX_ANTECEDENTES1"'
      '      ,"PRIMEIRA_CONSULTA"."TX_ANTECEDENTES2"'
      '      ,"PRIMEIRA_CONSULTA"."TX_ANTECEDENTES3"'
      '      ,"PRIMEIRA_CONSULTA"."TX_ANTECEDENTES4"'
      '      ,"PRIMEIRA_CONSULTA"."TX_ANTECEDENTES_OUTROS"'
      '      ,"PRIMEIRA_CONSULTA"."TX_SINAIS_VITAIS1"'
      '      ,"PRIMEIRA_CONSULTA"."TX_SINAIS_VITAIS2"'
      '      ,"PRIMEIRA_CONSULTA"."TX_SINAIS_VITAIS3"'
      '      ,"PRIMEIRA_CONSULTA"."TX_SINAIS_VITAIS4"'
      '      ,"PRIMEIRA_CONSULTA"."TX_SINAIS_VITAIS5"'
      '      ,"PRIMEIRA_CONSULTA"."TX_EXAME_FISICO"'
      '      ,"PRIMEIRA_CONSULTA"."TX_HIPOTESE1"'
      '      ,"PRIMEIRA_CONSULTA"."TX_HIPOTESE2"'
      '      ,"PRIMEIRA_CONSULTA"."TX_HIPOTESE3"'
      '      ,"PRIMEIRA_CONSULTA"."TX_HIPOTESE4"'
      '      ,"PRIMEIRA_CONSULTA"."TX_ANALISES"'
      '      ,"PRIMEIRA_CONSULTA"."TX_CONDUTA1"'
      '      ,"PRIMEIRA_CONSULTA"."TX_CONDUTA2"'
      '      ,"PRIMEIRA_CONSULTA"."TX_CONDUTA3"'
      '      ,"PRIMEIRA_CONSULTA"."TX_CONDUTA4"'
      '      ,"PRIMEIRA_CONSULTA"."DT_RETORNO"'
      '      ,"PRIMEIRA_CONSULTA"."TP_CONSULTA"'
      '      ,"PRIMEIRA_CONSULTA"."TX_ENCAMINHAMENTO"'
      '      ,"PRIMEIRA_CONSULTA"."NM_MEDICO"'
      '      ,"PRIMEIRA_CONSULTA"."NR_ORDEM"'
      '      ,"PRIMEIRA_CONSULTA"."CD_USUARIO_CADASTRO"'
      '      ,"PRIMEIRA_CONSULTA"."DT_CADASTRO"'
      '      ,"PRIMEIRA_CONSULTA"."CD_USUARIO_ALTERACAO"'
      '      ,"PRIMEIRA_CONSULTA"."DT_ALTERACAO"'
      '      ,"PRIMEIRA_CONSULTA"."CD_USUARIO_EXCLUSAO"'
      '      ,"PRIMEIRA_CONSULTA"."DT_EXCLUSAO"'
      '      ,"PRIMEIRA_CONSULTA"."CD_ARQUIVO"'
      '      ,"PRIMEIRA_CONSULTA"."CD_ARQUIVO2"'
      '      ,"PRIMEIRA_CONSULTA"."CD_GRUPO"'
      '      ,PACIENTE.NR_PROCESSO'
      '      ,PACIENTE.NM_PACIENTE'
      '      ,(select DS_MUNICIPIO from MUNICIPIO '
      '        where CD_MUNICIPIO = PACIENTE.CD_MUNICIPIO) DS_MUNICIPIO'
      '      ,(select DS_PROVINCIA from PROVINCIA'
      '        where CD_PROVINCIA = PACIENTE.CD_PROVINCIA) DS_PROVINCIA'
      '      ,PACIENTE.DT_NASCIMENTO'
      '      ,PACIENTE.IDADE'
      '      ,PACIENTE.TP_SEXO'
      '      ,PACIENTE.NM_MAE'
      'from "PRIMEIRA_CONSULTA"'
      '  left outer join PACIENTE'
      '  on PACIENTE.CD_PACIENTE = "PRIMEIRA_CONSULTA"."CD_PACIENTE"'
      'where "PRIMEIRA_CONSULTA"."CD_PACIENTE" = :CD_PACIENTE')
    ModifySQL.Strings = (
      'update "PRIMEIRA_CONSULTA"'
      'set'
      ' "CD_PRIMEIRA_CONSULTA" = :"CD_PRIMEIRA_CONSULTA"'
      ', "CD_PACIENTE" = :"CD_PACIENTE"'
      ', "DT_DIAGNOSTICO" = :"DT_DIAGNOSTICO"'
      ', "TP_TESTE" = :"TP_TESTE"'
      ', "FL_PUERPERA" = :"FL_PUERPERA"'
      ', "FL_ARVS" = :"FL_ARVS"'
      ', "FL_PROFILAXIA" = :"FL_PROFILAXIA"'
      ', "FL_TRATAMENTO" = :"FL_TRATAMENTO"'
      ', "FL_FILHO_ACOMP" = :"FL_FILHO_ACOMP"'
      ', "FL_SINTOMA1" = :"FL_SINTOMA1"'
      ', "TX_SINTOMA1" = :"TX_SINTOMA1"'
      ', "FL_SINTOMA2" = :"FL_SINTOMA2"'
      ', "TX_SINTOMA2" = :"TX_SINTOMA2"'
      ', "FL_SINTOMA3" = :"FL_SINTOMA3"'
      ', "TX_SINTOMA3" = :"TX_SINTOMA3"'
      ', "FL_SINTOMA4" = :"FL_SINTOMA4"'
      ', "TX_SINTOMA4" = :"TX_SINTOMA4"'
      ', "FL_SINTOMA5" = :"FL_SINTOMA5"'
      ', "TX_SINTOMA5" = :"TX_SINTOMA5"'
      ', "FL_SINTOMA6" = :"FL_SINTOMA6"'
      ', "TX_SINTOMA6" = :"TX_SINTOMA6"'
      ', "FL_SINTOMA7" = :"FL_SINTOMA7"'
      ', "TX_SINTOMA7" = :"TX_SINTOMA7"'
      ', "FL_SINTOMA8" = :"FL_SINTOMA8"'
      ', "TX_SINTOMA8" = :"TX_SINTOMA8"'
      ', "FL_SINTOMA9" = :"FL_SINTOMA9"'
      ', "TX_SINTOMA9" = :"TX_SINTOMA9"'
      ', "FL_SINTOMA10" = :"FL_SINTOMA10"'
      ', "TX_SINTOMA10" = :"TX_SINTOMA10"'
      ', "FL_SINTOMA11" = :"FL_SINTOMA11"'
      ', "TX_SINTOMA11" = :"TX_SINTOMA11"'
      ', "FL_SINTOMA12" = :"FL_SINTOMA12"'
      ', "TX_SINTOMA12" = :"TX_SINTOMA12"'
      ', "FL_SINTOMA13" = :"FL_SINTOMA13"'
      ', "TX_SINTOMA13" = :"TX_SINTOMA13"'
      ', "FL_SINTOMA14" = :"FL_SINTOMA14"'
      ', "TX_SINTOMA14" = :"TX_SINTOMA14"'
      ', "FL_SINTOMA15" = :"FL_SINTOMA15"'
      ', "TX_SINTOMA15" = :"TX_SINTOMA15"'
      ', "TX_OBS" = :"TX_OBS"'
      ', "TX_ANTECEDENTES1" = :"TX_ANTECEDENTES1"'
      ', "TX_ANTECEDENTES2" = :"TX_ANTECEDENTES2"'
      ', "TX_ANTECEDENTES3" = :"TX_ANTECEDENTES3"'
      ', "TX_ANTECEDENTES4" = :"TX_ANTECEDENTES4"'
      ', "TX_ANTECEDENTES_OUTROS" = :"TX_ANTECEDENTES_OUTROS"'
      ', "TX_SINAIS_VITAIS1" = :"TX_SINAIS_VITAIS1"'
      ', "TX_SINAIS_VITAIS2" = :"TX_SINAIS_VITAIS2"'
      ', "TX_SINAIS_VITAIS3" = :"TX_SINAIS_VITAIS3"'
      ', "TX_SINAIS_VITAIS4" = :"TX_SINAIS_VITAIS4"'
      ', "TX_SINAIS_VITAIS5" = :"TX_SINAIS_VITAIS5"'
      ', "TX_EXAME_FISICO" = :"TX_EXAME_FISICO"'
      ', "TX_HIPOTESE1" = :"TX_HIPOTESE1"'
      ', "TX_HIPOTESE2" = :"TX_HIPOTESE2"'
      ', "TX_HIPOTESE3" = :"TX_HIPOTESE3"'
      ', "TX_HIPOTESE4" = :"TX_HIPOTESE4"'
      ', "TX_ANALISES" = :"TX_ANALISES"'
      ', "TX_CONDUTA1" = :"TX_CONDUTA1"'
      ', "TX_CONDUTA2" = :"TX_CONDUTA2"'
      ', "TX_CONDUTA3" = :"TX_CONDUTA3"'
      ', "TX_CONDUTA4" = :"TX_CONDUTA4"'
      ', "DT_RETORNO" = :"DT_RETORNO"'
      ', "TP_CONSULTA" = :"TP_CONSULTA"'
      ', "TX_ENCAMINHAMENTO" = :"TX_ENCAMINHAMENTO"'
      ', "NM_MEDICO" = :"NM_MEDICO"'
      ', "NR_ORDEM" = :"NR_ORDEM"'
      ', "CD_USUARIO_CADASTRO" = :"CD_USUARIO_CADASTRO"'
      ', "DT_CADASTRO" = :"DT_CADASTRO"'
      ', "CD_USUARIO_ALTERACAO" = :"CD_USUARIO_ALTERACAO"'
      ', "DT_ALTERACAO" = :"DT_ALTERACAO"'
      ', "CD_USUARIO_EXCLUSAO" = :"CD_USUARIO_EXCLUSAO"'
      ', "DT_EXCLUSAO" = :"DT_EXCLUSAO"'
      ', "CD_ARQUIVO" = :"CD_ARQUIVO"'
      ', "CD_ARQUIVO2" = :"CD_ARQUIVO2"'
      ', "CD_GRUPO" = :"CD_GRUPO"'
      'where'
      '  "CD_PRIMEIRA_CONSULTA" = :"OLD_CD_PRIMEIRA_CONSULTA"')
    GeneratorField.Field = 'CD_PRIMEIRA_CONSULTA'
    GeneratorField.Generator = 'GEN_PRIMEIRA_CONSULTA'
    Left = 832
    Top = 515
    object TB_PRIMEIRA_CONSULTACD_PRIMEIRA_CONSULTA: TIntegerField
      FieldName = 'CD_PRIMEIRA_CONSULTA'
      Origin = 'PRIMEIRA_CONSULTA.CD_PRIMEIRA_CONSULTA'
      Required = True
    end
    object TB_PRIMEIRA_CONSULTACD_PACIENTE: TIntegerField
      FieldName = 'CD_PACIENTE'
      Origin = 'PRIMEIRA_CONSULTA.CD_PACIENTE'
    end
    object TB_PRIMEIRA_CONSULTADT_DIAGNOSTICO: TDateField
      FieldName = 'DT_DIAGNOSTICO'
      Origin = 'PRIMEIRA_CONSULTA.DT_DIAGNOSTICO'
    end
    object TB_PRIMEIRA_CONSULTATP_TESTE: TIBStringField
      FieldName = 'TP_TESTE'
      Origin = 'PRIMEIRA_CONSULTA.TP_TESTE'
      FixedChar = True
      Size = 1
    end
    object TB_PRIMEIRA_CONSULTAFL_PUERPERA: TIBStringField
      FieldName = 'FL_PUERPERA'
      Origin = 'PRIMEIRA_CONSULTA.FL_PUERPERA'
      FixedChar = True
      Size = 1
    end
    object TB_PRIMEIRA_CONSULTAFL_ARVS: TIBStringField
      FieldName = 'FL_ARVS'
      Origin = 'PRIMEIRA_CONSULTA.FL_ARVS'
      FixedChar = True
      Size = 1
    end
    object TB_PRIMEIRA_CONSULTAFL_PROFILAXIA: TIBStringField
      FieldName = 'FL_PROFILAXIA'
      Origin = 'PRIMEIRA_CONSULTA.FL_PROFILAXIA'
      FixedChar = True
      Size = 1
    end
    object TB_PRIMEIRA_CONSULTAFL_TRATAMENTO: TIBStringField
      FieldName = 'FL_TRATAMENTO'
      Origin = 'PRIMEIRA_CONSULTA.FL_TRATAMENTO'
      FixedChar = True
      Size = 1
    end
    object TB_PRIMEIRA_CONSULTAFL_FILHO_ACOMP: TIBStringField
      FieldName = 'FL_FILHO_ACOMP'
      Origin = 'PRIMEIRA_CONSULTA.FL_FILHO_ACOMP'
      FixedChar = True
      Size = 1
    end
    object TB_PRIMEIRA_CONSULTAFL_SINTOMA1: TIBStringField
      FieldName = 'FL_SINTOMA1'
      Origin = 'PRIMEIRA_CONSULTA.FL_SINTOMA1'
      FixedChar = True
      Size = 1
    end
    object TB_PRIMEIRA_CONSULTATX_SINTOMA1: TIBStringField
      FieldName = 'TX_SINTOMA1'
      Origin = 'PRIMEIRA_CONSULTA.TX_SINTOMA1'
      Size = 100
    end
    object TB_PRIMEIRA_CONSULTAFL_SINTOMA2: TIBStringField
      FieldName = 'FL_SINTOMA2'
      Origin = 'PRIMEIRA_CONSULTA.FL_SINTOMA2'
      FixedChar = True
      Size = 1
    end
    object TB_PRIMEIRA_CONSULTATX_SINTOMA2: TIBStringField
      FieldName = 'TX_SINTOMA2'
      Origin = 'PRIMEIRA_CONSULTA.TX_SINTOMA2'
      Size = 100
    end
    object TB_PRIMEIRA_CONSULTAFL_SINTOMA3: TIBStringField
      FieldName = 'FL_SINTOMA3'
      Origin = 'PRIMEIRA_CONSULTA.FL_SINTOMA3'
      FixedChar = True
      Size = 1
    end
    object TB_PRIMEIRA_CONSULTATX_SINTOMA3: TIBStringField
      FieldName = 'TX_SINTOMA3'
      Origin = 'PRIMEIRA_CONSULTA.TX_SINTOMA3'
      Size = 100
    end
    object TB_PRIMEIRA_CONSULTAFL_SINTOMA4: TIBStringField
      FieldName = 'FL_SINTOMA4'
      Origin = 'PRIMEIRA_CONSULTA.FL_SINTOMA4'
      FixedChar = True
      Size = 1
    end
    object TB_PRIMEIRA_CONSULTATX_SINTOMA4: TIBStringField
      FieldName = 'TX_SINTOMA4'
      Origin = 'PRIMEIRA_CONSULTA.TX_SINTOMA4'
      Size = 100
    end
    object TB_PRIMEIRA_CONSULTAFL_SINTOMA5: TIBStringField
      FieldName = 'FL_SINTOMA5'
      Origin = 'PRIMEIRA_CONSULTA.FL_SINTOMA5'
      FixedChar = True
      Size = 1
    end
    object TB_PRIMEIRA_CONSULTATX_SINTOMA5: TIBStringField
      FieldName = 'TX_SINTOMA5'
      Origin = 'PRIMEIRA_CONSULTA.TX_SINTOMA5'
      Size = 100
    end
    object TB_PRIMEIRA_CONSULTAFL_SINTOMA6: TIBStringField
      FieldName = 'FL_SINTOMA6'
      Origin = 'PRIMEIRA_CONSULTA.FL_SINTOMA6'
      FixedChar = True
      Size = 1
    end
    object TB_PRIMEIRA_CONSULTATX_SINTOMA6: TIBStringField
      FieldName = 'TX_SINTOMA6'
      Origin = 'PRIMEIRA_CONSULTA.TX_SINTOMA6'
      Size = 100
    end
    object TB_PRIMEIRA_CONSULTAFL_SINTOMA7: TIBStringField
      FieldName = 'FL_SINTOMA7'
      Origin = 'PRIMEIRA_CONSULTA.FL_SINTOMA7'
      FixedChar = True
      Size = 1
    end
    object TB_PRIMEIRA_CONSULTATX_SINTOMA7: TIBStringField
      FieldName = 'TX_SINTOMA7'
      Origin = 'PRIMEIRA_CONSULTA.TX_SINTOMA7'
      Size = 100
    end
    object TB_PRIMEIRA_CONSULTAFL_SINTOMA8: TIBStringField
      FieldName = 'FL_SINTOMA8'
      Origin = 'PRIMEIRA_CONSULTA.FL_SINTOMA8'
      FixedChar = True
      Size = 1
    end
    object TB_PRIMEIRA_CONSULTATX_SINTOMA8: TIBStringField
      FieldName = 'TX_SINTOMA8'
      Origin = 'PRIMEIRA_CONSULTA.TX_SINTOMA8'
      Size = 100
    end
    object TB_PRIMEIRA_CONSULTAFL_SINTOMA9: TIBStringField
      FieldName = 'FL_SINTOMA9'
      Origin = 'PRIMEIRA_CONSULTA.FL_SINTOMA9'
      FixedChar = True
      Size = 1
    end
    object TB_PRIMEIRA_CONSULTATX_SINTOMA9: TIBStringField
      FieldName = 'TX_SINTOMA9'
      Origin = 'PRIMEIRA_CONSULTA.TX_SINTOMA9'
      Size = 100
    end
    object TB_PRIMEIRA_CONSULTAFL_SINTOMA10: TIBStringField
      FieldName = 'FL_SINTOMA10'
      Origin = 'PRIMEIRA_CONSULTA.FL_SINTOMA10'
      FixedChar = True
      Size = 1
    end
    object TB_PRIMEIRA_CONSULTATX_SINTOMA10: TIBStringField
      FieldName = 'TX_SINTOMA10'
      Origin = 'PRIMEIRA_CONSULTA.TX_SINTOMA10'
      Size = 100
    end
    object TB_PRIMEIRA_CONSULTAFL_SINTOMA11: TIBStringField
      FieldName = 'FL_SINTOMA11'
      Origin = 'PRIMEIRA_CONSULTA.FL_SINTOMA11'
      FixedChar = True
      Size = 1
    end
    object TB_PRIMEIRA_CONSULTATX_SINTOMA11: TIBStringField
      FieldName = 'TX_SINTOMA11'
      Origin = 'PRIMEIRA_CONSULTA.TX_SINTOMA11'
      Size = 100
    end
    object TB_PRIMEIRA_CONSULTAFL_SINTOMA12: TIBStringField
      FieldName = 'FL_SINTOMA12'
      Origin = 'PRIMEIRA_CONSULTA.FL_SINTOMA12'
      FixedChar = True
      Size = 1
    end
    object TB_PRIMEIRA_CONSULTATX_SINTOMA12: TIBStringField
      FieldName = 'TX_SINTOMA12'
      Origin = 'PRIMEIRA_CONSULTA.TX_SINTOMA12'
      Size = 100
    end
    object TB_PRIMEIRA_CONSULTAFL_SINTOMA13: TIBStringField
      FieldName = 'FL_SINTOMA13'
      Origin = 'PRIMEIRA_CONSULTA.FL_SINTOMA13'
      FixedChar = True
      Size = 1
    end
    object TB_PRIMEIRA_CONSULTATX_SINTOMA13: TIBStringField
      FieldName = 'TX_SINTOMA13'
      Origin = 'PRIMEIRA_CONSULTA.TX_SINTOMA13'
      Size = 100
    end
    object TB_PRIMEIRA_CONSULTAFL_SINTOMA14: TIBStringField
      FieldName = 'FL_SINTOMA14'
      Origin = 'PRIMEIRA_CONSULTA.FL_SINTOMA14'
      FixedChar = True
      Size = 1
    end
    object TB_PRIMEIRA_CONSULTATX_SINTOMA14: TIBStringField
      FieldName = 'TX_SINTOMA14'
      Origin = 'PRIMEIRA_CONSULTA.TX_SINTOMA14'
      Size = 100
    end
    object TB_PRIMEIRA_CONSULTAFL_SINTOMA15: TIBStringField
      FieldName = 'FL_SINTOMA15'
      Origin = 'PRIMEIRA_CONSULTA.FL_SINTOMA15'
      FixedChar = True
      Size = 1
    end
    object TB_PRIMEIRA_CONSULTATX_SINTOMA15: TIBStringField
      FieldName = 'TX_SINTOMA15'
      Origin = 'PRIMEIRA_CONSULTA.TX_SINTOMA15'
      Size = 100
    end
    object TB_PRIMEIRA_CONSULTATX_OBS: TIBStringField
      FieldName = 'TX_OBS'
      Origin = 'PRIMEIRA_CONSULTA.TX_OBS'
      Size = 500
    end
    object TB_PRIMEIRA_CONSULTATX_ANTECEDENTES1: TIBStringField
      FieldName = 'TX_ANTECEDENTES1'
      Origin = 'PRIMEIRA_CONSULTA.TX_ANTECEDENTES1'
    end
    object TB_PRIMEIRA_CONSULTATX_ANTECEDENTES2: TIBStringField
      FieldName = 'TX_ANTECEDENTES2'
      Origin = 'PRIMEIRA_CONSULTA.TX_ANTECEDENTES2'
    end
    object TB_PRIMEIRA_CONSULTATX_ANTECEDENTES3: TIBStringField
      FieldName = 'TX_ANTECEDENTES3'
      Origin = 'PRIMEIRA_CONSULTA.TX_ANTECEDENTES3'
    end
    object TB_PRIMEIRA_CONSULTATX_ANTECEDENTES4: TIBStringField
      FieldName = 'TX_ANTECEDENTES4'
      Origin = 'PRIMEIRA_CONSULTA.TX_ANTECEDENTES4'
    end
    object TB_PRIMEIRA_CONSULTATX_ANTECEDENTES_OUTROS: TIBStringField
      FieldName = 'TX_ANTECEDENTES_OUTROS'
      Origin = 'PRIMEIRA_CONSULTA.TX_ANTECEDENTES_OUTROS'
      Size = 200
    end
    object TB_PRIMEIRA_CONSULTATX_SINAIS_VITAIS1: TIBStringField
      FieldName = 'TX_SINAIS_VITAIS1'
      Origin = 'PRIMEIRA_CONSULTA.TX_SINAIS_VITAIS1'
    end
    object TB_PRIMEIRA_CONSULTATX_SINAIS_VITAIS2: TIBStringField
      FieldName = 'TX_SINAIS_VITAIS2'
      Origin = 'PRIMEIRA_CONSULTA.TX_SINAIS_VITAIS2'
    end
    object TB_PRIMEIRA_CONSULTATX_SINAIS_VITAIS3: TIBStringField
      FieldName = 'TX_SINAIS_VITAIS3'
      Origin = 'PRIMEIRA_CONSULTA.TX_SINAIS_VITAIS3'
    end
    object TB_PRIMEIRA_CONSULTATX_SINAIS_VITAIS4: TIBStringField
      FieldName = 'TX_SINAIS_VITAIS4'
      Origin = 'PRIMEIRA_CONSULTA.TX_SINAIS_VITAIS4'
    end
    object TB_PRIMEIRA_CONSULTATX_SINAIS_VITAIS5: TIBStringField
      FieldName = 'TX_SINAIS_VITAIS5'
      Origin = 'PRIMEIRA_CONSULTA.TX_SINAIS_VITAIS5'
    end
    object TB_PRIMEIRA_CONSULTATX_EXAME_FISICO: TIBStringField
      FieldName = 'TX_EXAME_FISICO'
      Origin = 'PRIMEIRA_CONSULTA.TX_EXAME_FISICO'
      Size = 200
    end
    object TB_PRIMEIRA_CONSULTATX_HIPOTESE1: TIBStringField
      FieldName = 'TX_HIPOTESE1'
      Origin = 'PRIMEIRA_CONSULTA.TX_HIPOTESE1'
      Size = 100
    end
    object TB_PRIMEIRA_CONSULTATX_HIPOTESE2: TIBStringField
      FieldName = 'TX_HIPOTESE2'
      Origin = 'PRIMEIRA_CONSULTA.TX_HIPOTESE2'
      Size = 100
    end
    object TB_PRIMEIRA_CONSULTATX_HIPOTESE3: TIBStringField
      FieldName = 'TX_HIPOTESE3'
      Origin = 'PRIMEIRA_CONSULTA.TX_HIPOTESE3'
      Size = 100
    end
    object TB_PRIMEIRA_CONSULTATX_HIPOTESE4: TIBStringField
      FieldName = 'TX_HIPOTESE4'
      Origin = 'PRIMEIRA_CONSULTA.TX_HIPOTESE4'
      Size = 100
    end
    object TB_PRIMEIRA_CONSULTATX_ANALISES: TIBStringField
      FieldName = 'TX_ANALISES'
      Origin = 'PRIMEIRA_CONSULTA.TX_ANALISES'
      Size = 200
    end
    object TB_PRIMEIRA_CONSULTATX_CONDUTA1: TIBStringField
      FieldName = 'TX_CONDUTA1'
      Origin = 'PRIMEIRA_CONSULTA.TX_CONDUTA1'
      Size = 100
    end
    object TB_PRIMEIRA_CONSULTATX_CONDUTA2: TIBStringField
      FieldName = 'TX_CONDUTA2'
      Origin = 'PRIMEIRA_CONSULTA.TX_CONDUTA2'
      Size = 100
    end
    object TB_PRIMEIRA_CONSULTATX_CONDUTA3: TIBStringField
      FieldName = 'TX_CONDUTA3'
      Origin = 'PRIMEIRA_CONSULTA.TX_CONDUTA3'
      Size = 100
    end
    object TB_PRIMEIRA_CONSULTATX_CONDUTA4: TIBStringField
      FieldName = 'TX_CONDUTA4'
      Origin = 'PRIMEIRA_CONSULTA.TX_CONDUTA4'
      Size = 100
    end
    object TB_PRIMEIRA_CONSULTADT_RETORNO: TDateTimeField
      FieldName = 'DT_RETORNO'
      Origin = 'PRIMEIRA_CONSULTA.DT_RETORNO'
    end
    object TB_PRIMEIRA_CONSULTATP_CONSULTA: TIBStringField
      FieldName = 'TP_CONSULTA'
      Origin = 'PRIMEIRA_CONSULTA.TP_CONSULTA'
      Size = 100
    end
    object TB_PRIMEIRA_CONSULTATX_ENCAMINHAMENTO: TIBStringField
      FieldName = 'TX_ENCAMINHAMENTO'
      Origin = 'PRIMEIRA_CONSULTA.TX_ENCAMINHAMENTO'
      Size = 200
    end
    object TB_PRIMEIRA_CONSULTANM_MEDICO: TIBStringField
      FieldName = 'NM_MEDICO'
      Origin = 'PRIMEIRA_CONSULTA.NM_MEDICO'
      Size = 100
    end
    object TB_PRIMEIRA_CONSULTANR_ORDEM: TIBStringField
      FieldName = 'NR_ORDEM'
      Origin = 'PRIMEIRA_CONSULTA.NR_ORDEM'
    end
    object TB_PRIMEIRA_CONSULTACD_USUARIO_CADASTRO: TIntegerField
      FieldName = 'CD_USUARIO_CADASTRO'
      Origin = 'PRIMEIRA_CONSULTA.CD_USUARIO_CADASTRO'
    end
    object TB_PRIMEIRA_CONSULTADT_CADASTRO: TDateTimeField
      FieldName = 'DT_CADASTRO'
      Origin = 'PRIMEIRA_CONSULTA.DT_CADASTRO'
    end
    object TB_PRIMEIRA_CONSULTACD_USUARIO_ALTERACAO: TIntegerField
      FieldName = 'CD_USUARIO_ALTERACAO'
      Origin = 'PRIMEIRA_CONSULTA.CD_USUARIO_ALTERACAO'
    end
    object TB_PRIMEIRA_CONSULTADT_ALTERACAO: TDateTimeField
      FieldName = 'DT_ALTERACAO'
      Origin = 'PRIMEIRA_CONSULTA.DT_ALTERACAO'
    end
    object TB_PRIMEIRA_CONSULTACD_USUARIO_EXCLUSAO: TIntegerField
      FieldName = 'CD_USUARIO_EXCLUSAO'
      Origin = 'PRIMEIRA_CONSULTA.CD_USUARIO_EXCLUSAO'
    end
    object TB_PRIMEIRA_CONSULTADT_EXCLUSAO: TDateTimeField
      FieldName = 'DT_EXCLUSAO'
      Origin = 'PRIMEIRA_CONSULTA.DT_EXCLUSAO'
    end
    object TB_PRIMEIRA_CONSULTACD_ARQUIVO: TIntegerField
      FieldName = 'CD_ARQUIVO'
      Origin = 'PRIMEIRA_CONSULTA.CD_ARQUIVO'
    end
    object TB_PRIMEIRA_CONSULTACD_GRUPO: TIntegerField
      FieldName = 'CD_GRUPO'
      Origin = 'PRIMEIRA_CONSULTA.CD_GRUPO'
    end
    object TB_PRIMEIRA_CONSULTACD_ARQUIVO2: TIntegerField
      FieldName = 'CD_ARQUIVO2'
      Origin = 'PRIMEIRA_CONSULTA.CD_ARQUIVO2'
    end
    object TB_PRIMEIRA_CONSULTANR_PROCESSO: TIntegerField
      FieldName = 'NR_PROCESSO'
      Origin = 'PACIENTE.NR_PROCESSO'
    end
    object TB_PRIMEIRA_CONSULTANM_PACIENTE: TIBStringField
      FieldName = 'NM_PACIENTE'
      Origin = 'PACIENTE.NM_PACIENTE'
      Size = 50
    end
    object TB_PRIMEIRA_CONSULTADS_MUNICIPIO: TIBStringField
      FieldName = 'DS_MUNICIPIO'
      Size = 50
    end
    object TB_PRIMEIRA_CONSULTADS_PROVINCIA: TIBStringField
      FieldName = 'DS_PROVINCIA'
      Size = 50
    end
    object TB_PRIMEIRA_CONSULTADT_NASCIMENTO: TDateField
      FieldName = 'DT_NASCIMENTO'
      Origin = 'PACIENTE.DT_NASCIMENTO'
    end
    object TB_PRIMEIRA_CONSULTAIDADE: TSmallintField
      FieldName = 'IDADE'
      Origin = 'PACIENTE.IDADE'
    end
    object TB_PRIMEIRA_CONSULTATP_SEXO: TIBStringField
      FieldName = 'TP_SEXO'
      Origin = 'PACIENTE.TP_SEXO'
      FixedChar = True
      Size = 1
    end
    object TB_PRIMEIRA_CONSULTANM_MAE: TIBStringField
      FieldName = 'NM_MAE'
      Origin = 'PACIENTE.NM_MAE'
      Size = 50
    end
  end
  object TB_REQUISICAO: TIBDataSet
    Database = DM.DB
    Transaction = DM.TS
    BufferChunks = 1000
    CachedUpdates = False
    DeleteSQL.Strings = (
      'delete from "REQUISICAO"'
      'where'
      '  "CD_AGENDA" = :"OLD_CD_AGENDA"')
    InsertSQL.Strings = (
      'insert into "REQUISICAO"'
      '('
      '  "CD_AGENDA"'
      ', "BL_REQUISICAO"'
      ')'
      'values'
      '('
      '  :"CD_AGENDA"'
      ', :"BL_REQUISICAO"'
      ')')
    SelectSQL.Strings = (
      'select "REQUISICAO"."CD_AGENDA"'
      '      ,"REQUISICAO"."BL_REQUISICAO"'
      'from "REQUISICAO"'
      'WHERE CD_AGENDA = :CD_AGENDA')
    ModifySQL.Strings = (
      'update "REQUISICAO"'
      'set'
      ' "CD_AGENDA" = :"CD_AGENDA"'
      ', "BL_REQUISICAO" = :"BL_REQUISICAO"'
      'where'
      '  "CD_AGENDA" = :"OLD_CD_AGENDA"')
    Left = 808
    Top = 243
    object TB_REQUISICAOCD_AGENDA: TIntegerField
      FieldName = 'CD_AGENDA'
      Origin = 'REQUISICAO.CD_AGENDA'
      Required = True
    end
    object TB_REQUISICAOBL_REQUISICAO: TBlobField
      FieldName = 'BL_REQUISICAO'
      Origin = 'REQUISICAO.BL_REQUISICAO'
      Size = 8
    end
  end
  object TB_RESULTADO_CD4: TIBDataSet
    Database = DM.DB
    Transaction = DM.TS
    AfterDelete = TB_RESULTADO_CD4AfterDelete
    AfterPost = TB_RESULTADO_CD4AfterPost
    BeforeOpen = TB_RESULTADO_CD4BeforeOpen
    OnCalcFields = TB_RESULTADO_CD4CalcFields
    BufferChunks = 1000
    CachedUpdates = False
    DeleteSQL.Strings = (
      'delete from "RESULTADO_CD4"'
      'where'
      '  "CD_AGENDA" = :"OLD_CD_AGENDA"')
    InsertSQL.Strings = (
      'insert into "RESULTADO_CD4"'
      '('
      '  "CD_AGENDA"'
      ', "NR_CD3"'
      ', "NR_CD4"'
      ', "NR_CD8"'
      ', "CD_RESPONSAVEL"'
      ', "DT_RESULTADO"'
      ', "CD_ARQUIVO"'
      ', "FL_REFAZER"'
      ')'
      'values'
      '('
      '  :"CD_AGENDA"'
      ', :"NR_CD3"'
      ', :"NR_CD4"'
      ', :"NR_CD8"'
      ', :"CD_RESPONSAVEL"'
      ', :"DT_RESULTADO"'
      ', :"CD_ARQUIVO"'
      ', :"FL_REFAZER")')
    SelectSQL.Strings = (
      'select'
      '      "RESULTADO_CD4"."CD_AGENDA"'
      '      ,"RESULTADO_CD4"."NR_CD3"'
      '      ,"RESULTADO_CD4"."NR_CD4"'
      '      ,"RESULTADO_CD4"."NR_CD8"'
      '      ,"RESULTADO_CD4"."CD_RESPONSAVEL"'
      '      ,"RESULTADO_CD4"."DT_RESULTADO"'
      '      ,"RESULTADO_CD4"."CD_ARQUIVO"'
      '      ,"RESULTADO_CD4"."FL_REFAZER"'
      '      , AGENDA.CD_PACIENTE'
      '     , NR_PROCESSO'
      '      , NM_PACIENTE'
      '      , IDADE'
      '      , TP_SEXO'
      '      , DT_AGENDA'
      '      , DT_CONFIRMACAO'
      '      , NR_LAB'
      ',(SELECT  DS_DESCRICAO from TABELA_AUXILIAR '
      '  where  CD_CODIGO = "RESULTADO_CD4"."CD_RESPONSAVEL"'
      '  and CD_TABELA = :CD_TABELA) NM_RESPONSAVEL'
      'from AGENDA'
      ' LEFT OUTER JOIN "RESULTADO_CD4"'
      ' ON "RESULTADO_CD4"."CD_AGENDA" = AGENDA."CD_AGENDA"'
      ' LEFT OUTER JOIN PACIENTE'
      ' ON AGENDA.CD_PACIENTE = PACIENTE.CD_PACIENTE'
      'WHERE NR_LAB = :NR_LAB')
    ModifySQL.Strings = (
      'update "RESULTADO_CD4"'
      'set'
      ' "CD_AGENDA" = :"CD_AGENDA"'
      ', "NR_CD3" = :"NR_CD3"'
      ', "NR_CD4" = :"NR_CD4"'
      ', "NR_CD8" = :"NR_CD8"'
      ', "CD_RESPONSAVEL" = :"CD_RESPONSAVEL"'
      ', "DT_RESULTADO" = :"DT_RESULTADO"'
      ', "CD_ARQUIVO" = :"CD_ARQUIVO"'
      ', "FL_REFAZER" = :"FL_REFAZER"'
      'where'
      '  "CD_AGENDA" = :"OLD_CD_AGENDA"')
    Left = 824
    Top = 563
    object TB_RESULTADO_CD4CD_AGENDA: TIntegerField
      FieldName = 'CD_AGENDA'
      Origin = 'RESULTADO_CD4.CD_AGENDA'
      Required = True
    end
    object TB_RESULTADO_CD4NR_CD3: TIBBCDField
      FieldName = 'NR_CD3'
      Origin = 'RESULTADO_CD4.NR_CD3'
      Precision = 18
      Size = 4
    end
    object TB_RESULTADO_CD4NR_CD4: TIBBCDField
      FieldName = 'NR_CD4'
      Origin = 'RESULTADO_CD4.NR_CD4'
      Precision = 18
      Size = 4
    end
    object TB_RESULTADO_CD4NR_CD8: TIBBCDField
      FieldName = 'NR_CD8'
      Origin = 'RESULTADO_CD4.NR_CD8'
      Precision = 18
      Size = 4
    end
    object TB_RESULTADO_CD4DT_RESULTADO: TDateField
      FieldName = 'DT_RESULTADO'
      Origin = 'RESULTADO_CD4.DT_RESULTADO'
    end
    object TB_RESULTADO_CD4CD_RESPONSAVEL: TIntegerField
      FieldName = 'CD_RESPONSAVEL'
      Origin = 'RESULTADO_CD4.CD_RESPONSAVEL'
    end
    object TB_RESULTADO_CD4CD_PACIENTE: TIntegerField
      FieldName = 'CD_PACIENTE'
      Origin = 'AGENDA.CD_PACIENTE'
    end
    object TB_RESULTADO_CD4NM_PACIENTE: TIBStringField
      FieldName = 'NM_PACIENTE'
      Origin = 'PACIENTE.NM_PACIENTE'
      Required = True
      Size = 50
    end
    object TB_RESULTADO_CD4IDADE: TSmallintField
      FieldName = 'IDADE'
      Origin = 'PACIENTE.IDADE'
      Required = True
    end
    object TB_RESULTADO_CD4DT_AGENDA: TDateTimeField
      FieldName = 'DT_AGENDA'
      Origin = 'AGENDA.DT_AGENDA'
    end
    object TB_RESULTADO_CD4NR_PRCD4: TFloatField
      FieldKind = fkCalculated
      FieldName = 'NR_PRCD4'
      DisplayFormat = '0.00'
      Calculated = True
    end
    object TB_RESULTADO_CD4NR_PRCD8: TFloatField
      FieldKind = fkCalculated
      FieldName = 'NR_PRCD8'
      DisplayFormat = '0.00'
      Calculated = True
    end
    object TB_RESULTADO_CD4NR_RCD4CD8: TFloatField
      FieldKind = fkCalculated
      FieldName = 'NR_RCD4CD8'
      DisplayFormat = '0.00'
      Calculated = True
    end
    object TB_RESULTADO_CD4NR_PROCESSO: TIntegerField
      FieldName = 'NR_PROCESSO'
      Origin = 'PACIENTE.NR_PROCESSO'
    end
    object TB_RESULTADO_CD4TP_SEXO: TIBStringField
      FieldName = 'TP_SEXO'
      Origin = 'PACIENTE.TP_SEXO'
      Required = True
      FixedChar = True
      Size = 1
    end
    object TB_RESULTADO_CD4NR_LAB: TIntegerField
      FieldName = 'NR_LAB'
      Origin = 'AGENDA.NR_LAB'
    end
    object TB_RESULTADO_CD4DT_CONFIRMACAO: TDateTimeField
      FieldName = 'DT_CONFIRMACAO'
      Origin = 'AGENDA.DT_CONFIRMACAO'
    end
    object TB_RESULTADO_CD4CD_ARQUIVO: TIntegerField
      FieldName = 'CD_ARQUIVO'
      Origin = 'RESULTADO_CD4.CD_ARQUIVO'
    end
    object TB_RESULTADO_CD4NM_RESPONSAVEL: TIBStringField
      FieldName = 'NM_RESPONSAVEL'
      Size = 100
    end
    object TB_RESULTADO_CD4FL_REFAZER: TIBStringField
      FieldName = 'FL_REFAZER'
      Origin = 'RESULTADO_CD4.FL_REFAZER'
      FixedChar = True
      Size = 1
    end
    object TB_RESULTADO_CD4CTX_REFAZER: TStringField
      FieldKind = fkCalculated
      FieldName = 'CTX_REFAZER'
      Size = 10
      Calculated = True
    end
  end
  object TB_AVALIACAO_INICIAL: TIBDataSet
    Database = DM.DB
    Transaction = DM.TS
    AfterInsert = TB_AVALIACAO_INICIALAfterInsert
    BeforeDelete = TB_AVALIACAO_INICIALBeforeDelete
    BeforePost = TB_AVALIACAO_INICIALBeforePost
    BufferChunks = 1000
    CachedUpdates = False
    DeleteSQL.Strings = (
      'delete from "AVALIACAO_INICIAL"'
      'where'
      '  "CD_AVALIACAO_INICIAL" = :"OLD_CD_AVALIACAO_INICIAL"')
    InsertSQL.Strings = (
      'insert into "AVALIACAO_INICIAL"'
      '('
      '  "CD_AVALIACAO_INICIAL"'
      ', "CD_PACIENTE"'
      ', "FL_MOTIVO"'
      ', "DT_DIAGNOSTICO"'
      ', "NR_FILHO"'
      ', "FL_TESTE"'
      ', "FL_PARCEIRO_TESTE"'
      ', "TX_RESULTADO"'
      ', "FL_MAIS_PARCEIRO"'
      ', "FL_GRAVIDA"'
      ', "TX_SINAIS_VITAIS1"'
      ', "TX_SINAIS_VITAIS2"'
      ', "TX_SINAIS_VITAIS3"'
      ', "TX_SINAIS_VITAIS4"'
      ', "TX_SINAIS_VITAIS5"'
      ', "TX_SINAIS_VITAIS6"'
      ', "FL_SINAIS_PALUDISMO"'
      ', "FL_SINAIS_TUBERCULOSE"'
      ', "FL_DIAG_PALUDISMO"'
      ', "FL_DIAG_TUBERCULOSE"'
      ', "TX_SINAIS_CONDUTA"'
      ', "FL_QUADRO_OMS1"'
      ', "FL_QUADRO_OMS2"'
      ', "FL_QUADRO_OMS3"'
      ', "FL_QUADRO_OMS4"'
      ', "FL_QUADRO_OMS5"'
      ', "FL_QUADRO_OMS6"'
      ', "FL_QUADRO_OMS7"'
      ', "FL_QUADRO_OMS8"'
      ', "FL_QUADRO_OMS9"'
      ', "FL_QUADRO_OMS10"'
      ', "FL_QUADRO_OMS11"'
      ', "FL_QUADRO_OMS12"'
      ', "FL_QUADRO_OMS13"'
      ', "FL_QUADRO_OMS14"'
      ', "FL_QUADRO_OMS15"'
      ', "FL_QUADRO_OMS16"'
      ', "FL_QUADRO_OMS17"'
      ', "FL_QUADRO_OMS18"'
      ', "FL_QUADRO_OMS19"'
      ', "FL_QUADRO_OMS20"'
      ', "FL_QUADRO_OMS21"'
      ', "FL_QUADRO_OMS22"'
      ', "FL_QUADRO_OMS23"'
      ', "FL_QUADRO_OMS24"'
      ', "FL_QUADRO_OMS25"'
      ', "FL_QUADRO_OMS26"'
      ', "FL_QUADRO_OMS27"'
      ', "FL_QUADRO_OMS28"'
      ', "FL_QUADRO_OMS29"'
      ', "FL_QUADRO_OMS30"'
      ', "FL_QUADRO_OMS31"'
      ', "FL_QUADRO_OMS32"'
      ', "FL_QUADRO_OMS33"'
      ', "FL_QUADRO_OMS34"'
      ', "FL_QUADRO_OMS35"'
      ', "FL_QUADRO_OMS36"'
      ', "FL_QUADRO_OMS37"'
      ', "FL_QUADRO_OMS38"'
      ', "FL_QUADRO_OMS39"'
      ', "FL_CONCLUSAO_MENOR"'
      ', "FL_CONCLUSAO_MAIOR"'
      ', "TX_CLASSIFICACAO"'
      ', "FL_CLASSIFICACAO"'
      ', "TX_OUTRAS_QUEIXAS"'
      ', "DT_PRINCIPAIS_ANALISES1"'
      ', "DT_PRINCIPAIS_ANALISES2"'
      ', "DT_PRINCIPAIS_ANALISES3"'
      ', "DT_PRINCIPAIS_ANALISES4"'
      ', "DT_PRINCIPAIS_ANALISES5"'
      ', "DT_PRINCIPAIS_ANALISES6"'
      ', "FL_SEGUIMENTO_ROTINA"'
      ', "FL_VAGA_ABERTA"'
      ', "DT_VAGA_ABERTA"'
      ', "FL_CD4_HEMOGRAMA"'
      ', "TX_CD4_HEMOGRAMA"'
      ', "FL_INICIO_IMEDIATO"'
      ', "FL_INICIO_IMEDIATO1"'
      ', "FL_INICIO_IMEDIATO2"'
      ', "DT_INICIO_IMEDIATO"'
      ', "FL_SINTOMAS_GRAVES"'
      ', "TX_SINTOMAS_GRAVES"'
      ', "FL_INICIO_IMEDIATO3"'
      ', "TX_INICIO_IMEDIATO3"'
      ', "FL_INICIO_IMEDIATO4"'
      ', "DT_INICIO_IMEDIATO4"'
      ', "TX_INICIO_IMEDIATO4"'
      ', "FL_PUERPERA"'
      ', "TX_ESQUEMA_EM_USO"'
      ', "DT_INICIO_ARV"'
      ', "DT_PARTO"'
      ', "FL_PROFILAXIA"'
      ', "FL_TRATAMENTO_ARV"'
      ', "FL_PROFILAXIA_CONDUTA"'
      ', "FL_ALEITAMENTO_ARTIFICIAL"'
      ', "FL_ALEITAMENTO_MATERNO"'
      ', "FL_TRATAMENTO_ARV2"'
      ', "FL_SINTOMAS_GRAVES2"'
      ', "TX_SINTOMAS_GRAVES2"'
      ', "DT_PUERPERA_RETORNO"'
      ', "FL_CRIANCA_EXPOSTA"'
      ', "DT_CRIANCA_EXPOSTA"'
      ', "FL_SEGUIMENTO"'
      ', "TX_SEGUIMENTO"'
      ', "FL_EM_USO_PROFILAXIA"'
      ', "TX_AOTACOES_ENFERMAGEM"'
      ', "NM_MEDICO"'
      ', "NR_ORDEM"'
      ', "CD_USUARIO_CADASTRO"'
      ', "DT_CADASTRO"'
      ', "CD_USUARIO_ALTERACAO"'
      ', "DT_ALTERACAO"'
      ', "CD_USUARIO_EXCLUSAO"'
      ', "DT_EXCLUSAO"'
      ', "CD_ARQUIVO"'
      ', "CD_GRUPO"'
      ', "CD_ARQUIVO2"'
      ', "TX_PRINCIPAIS_ANALISES1"'
      ', "TX_PRINCIPAIS_ANALISES2"'
      ', "TX_PRINCIPAIS_ANALISES3"'
      ', "TX_PRINCIPAIS_ANALISES4"'
      ', "TX_PRINCIPAIS_ANALISES5"'
      ', "TX_PRINCIPAIS_ANALISES6"'
      ', "TX_PRINCIPAIS_ANALISES7"'
      ', "FL_ANALISES_ALTERADAS"'
      ', "TX_ANALISES_ALTERADAS"'
      ''
      ')'
      'values'
      '('
      '  :"CD_AVALIACAO_INICIAL"'
      ', :"CD_PACIENTE"'
      ', :"FL_MOTIVO"'
      ', :"DT_DIAGNOSTICO"'
      ', :"NR_FILHO"'
      ', :"FL_TESTE"'
      ', :"FL_PARCEIRO_TESTE"'
      ', :"TX_RESULTADO"'
      ', :"FL_MAIS_PARCEIRO"'
      ', :"FL_GRAVIDA"'
      ', :"TX_SINAIS_VITAIS1"'
      ', :"TX_SINAIS_VITAIS2"'
      ', :"TX_SINAIS_VITAIS3"'
      ', :"TX_SINAIS_VITAIS4"'
      ', :"TX_SINAIS_VITAIS5"'
      ', :"TX_SINAIS_VITAIS6"'
      ', :"FL_SINAIS_PALUDISMO"'
      ', :"FL_SINAIS_TUBERCULOSE"'
      ', :"FL_DIAG_PALUDISMO"'
      ', :"FL_DIAG_TUBERCULOSE"'
      ', :"TX_SINAIS_CONDUTA"'
      ', :"FL_QUADRO_OMS1"'
      ', :"FL_QUADRO_OMS2"'
      ', :"FL_QUADRO_OMS3"'
      ', :"FL_QUADRO_OMS4"'
      ', :"FL_QUADRO_OMS5"'
      ', :"FL_QUADRO_OMS6"'
      ', :"FL_QUADRO_OMS7"'
      ', :"FL_QUADRO_OMS8"'
      ', :"FL_QUADRO_OMS9"'
      ', :"FL_QUADRO_OMS10"'
      ', :"FL_QUADRO_OMS11"'
      ', :"FL_QUADRO_OMS12"'
      ', :"FL_QUADRO_OMS13"'
      ', :"FL_QUADRO_OMS14"'
      ', :"FL_QUADRO_OMS15"'
      ', :"FL_QUADRO_OMS16"'
      ', :"FL_QUADRO_OMS17"'
      ', :"FL_QUADRO_OMS18"'
      ', :"FL_QUADRO_OMS19"'
      ', :"FL_QUADRO_OMS20"'
      ', :"FL_QUADRO_OMS21"'
      ', :"FL_QUADRO_OMS22"'
      ', :"FL_QUADRO_OMS23"'
      ', :"FL_QUADRO_OMS24"'
      ', :"FL_QUADRO_OMS25"'
      ', :"FL_QUADRO_OMS26"'
      ', :"FL_QUADRO_OMS27"'
      ', :"FL_QUADRO_OMS28"'
      ', :"FL_QUADRO_OMS29"'
      ', :"FL_QUADRO_OMS30"'
      ', :"FL_QUADRO_OMS31"'
      ', :"FL_QUADRO_OMS32"'
      ', :"FL_QUADRO_OMS33"'
      ', :"FL_QUADRO_OMS34"'
      ', :"FL_QUADRO_OMS35"'
      ', :"FL_QUADRO_OMS36"'
      ', :"FL_QUADRO_OMS37"'
      ', :"FL_QUADRO_OMS38"'
      ', :"FL_QUADRO_OMS39"'
      ', :"FL_CONCLUSAO_MENOR"'
      ', :"FL_CONCLUSAO_MAIOR"'
      ', :"TX_CLASSIFICACAO"'
      ', :"FL_CLASSIFICACAO"'
      ', :"TX_OUTRAS_QUEIXAS"'
      ', :"DT_PRINCIPAIS_ANALISES1"'
      ', :"DT_PRINCIPAIS_ANALISES2"'
      ', :"DT_PRINCIPAIS_ANALISES3"'
      ', :"DT_PRINCIPAIS_ANALISES4"'
      ', :"DT_PRINCIPAIS_ANALISES5"'
      ', :"DT_PRINCIPAIS_ANALISES6"'
      ', :"FL_SEGUIMENTO_ROTINA"'
      ', :"FL_VAGA_ABERTA"'
      ', :"DT_VAGA_ABERTA"'
      ', :"FL_CD4_HEMOGRAMA"'
      ', :"TX_CD4_HEMOGRAMA"'
      ', :"FL_INICIO_IMEDIATO"'
      ', :"FL_INICIO_IMEDIATO1"'
      ', :"FL_INICIO_IMEDIATO2"'
      ', :"DT_INICIO_IMEDIATO"'
      ', :"FL_SINTOMAS_GRAVES"'
      ', :"TX_SINTOMAS_GRAVES"'
      ', :"FL_INICIO_IMEDIATO3"'
      ', :"TX_INICIO_IMEDIATO3"'
      ', :"FL_INICIO_IMEDIATO4"'
      ', :"DT_INICIO_IMEDIATO4"'
      ', :"TX_INICIO_IMEDIATO4"'
      ', :"FL_PUERPERA"'
      ', :"TX_ESQUEMA_EM_USO"'
      ', :"DT_INICIO_ARV"'
      ', :"DT_PARTO"'
      ', :"FL_PROFILAXIA"'
      ', :"FL_TRATAMENTO_ARV"'
      ', :"FL_PROFILAXIA_CONDUTA"'
      ', :"FL_ALEITAMENTO_ARTIFICIAL"'
      ', :"FL_ALEITAMENTO_MATERNO"'
      ', :"FL_TRATAMENTO_ARV2"'
      ', :"FL_SINTOMAS_GRAVES2"'
      ', :"TX_SINTOMAS_GRAVES2"'
      ', :"DT_PUERPERA_RETORNO"'
      ', :"FL_CRIANCA_EXPOSTA"'
      ', :"DT_CRIANCA_EXPOSTA"'
      ', :"FL_SEGUIMENTO"'
      ', :"TX_SEGUIMENTO"'
      ', :"FL_EM_USO_PROFILAXIA"'
      ', :"TX_AOTACOES_ENFERMAGEM"'
      ', :"NM_MEDICO"'
      ', :"NR_ORDEM"'
      ', :"CD_USUARIO_CADASTRO"'
      ', :"DT_CADASTRO"'
      ', :"CD_USUARIO_ALTERACAO"'
      ', :"DT_ALTERACAO"'
      ', :"CD_USUARIO_EXCLUSAO"'
      ', :"DT_EXCLUSAO"'
      ', :"CD_ARQUIVO"'
      ', :"CD_GRUPO"'
      ', :"CD_ARQUIVO2"'
      ', :"TX_PRINCIPAIS_ANALISES1"'
      ', :"TX_PRINCIPAIS_ANALISES2"'
      ', :"TX_PRINCIPAIS_ANALISES3"'
      ', :"TX_PRINCIPAIS_ANALISES4"'
      ', :"TX_PRINCIPAIS_ANALISES5"'
      ', :"TX_PRINCIPAIS_ANALISES6"'
      ', :"TX_PRINCIPAIS_ANALISES7"'
      ', :"FL_ANALISES_ALTERADAS"'
      ', :"TX_ANALISES_ALTERADAS"'
      ''
      ')')
    SelectSQL.Strings = (
      'select "AVALIACAO_INICIAL"."CD_AVALIACAO_INICIAL"'
      '      ,"AVALIACAO_INICIAL"."CD_PACIENTE"'
      '      ,"AVALIACAO_INICIAL"."FL_MOTIVO"'
      '      ,"AVALIACAO_INICIAL"."DT_DIAGNOSTICO"'
      '      ,"AVALIACAO_INICIAL"."NR_FILHO"'
      '      ,"AVALIACAO_INICIAL"."FL_TESTE"'
      '      ,"AVALIACAO_INICIAL"."FL_PARCEIRO_TESTE"'
      '      ,"AVALIACAO_INICIAL"."TX_RESULTADO"'
      '      ,"AVALIACAO_INICIAL"."FL_MAIS_PARCEIRO"'
      '      ,"AVALIACAO_INICIAL"."FL_GRAVIDA"'
      '      ,"AVALIACAO_INICIAL"."TX_SINAIS_VITAIS1"'
      '      ,"AVALIACAO_INICIAL"."TX_SINAIS_VITAIS2"'
      '      ,"AVALIACAO_INICIAL"."TX_SINAIS_VITAIS3"'
      '      ,"AVALIACAO_INICIAL"."TX_SINAIS_VITAIS4"'
      '      ,"AVALIACAO_INICIAL"."TX_SINAIS_VITAIS5"'
      '      ,"AVALIACAO_INICIAL"."TX_SINAIS_VITAIS6"'
      '      ,"AVALIACAO_INICIAL"."FL_SINAIS_PALUDISMO"'
      '      ,"AVALIACAO_INICIAL"."FL_SINAIS_TUBERCULOSE"'
      '      ,"AVALIACAO_INICIAL"."FL_DIAG_PALUDISMO"'
      '      ,"AVALIACAO_INICIAL"."FL_DIAG_TUBERCULOSE"'
      '      ,"AVALIACAO_INICIAL"."TX_SINAIS_CONDUTA"'
      '      ,"AVALIACAO_INICIAL"."FL_QUADRO_OMS1"'
      '      ,"AVALIACAO_INICIAL"."FL_QUADRO_OMS2"'
      '      ,"AVALIACAO_INICIAL"."FL_QUADRO_OMS3"'
      '      ,"AVALIACAO_INICIAL"."FL_QUADRO_OMS4"'
      '      ,"AVALIACAO_INICIAL"."FL_QUADRO_OMS5"'
      '      ,"AVALIACAO_INICIAL"."FL_QUADRO_OMS6"'
      '      ,"AVALIACAO_INICIAL"."FL_QUADRO_OMS7"'
      '      ,"AVALIACAO_INICIAL"."FL_QUADRO_OMS8"'
      '      ,"AVALIACAO_INICIAL"."FL_QUADRO_OMS9"'
      '      ,"AVALIACAO_INICIAL"."FL_QUADRO_OMS10"'
      '      ,"AVALIACAO_INICIAL"."FL_QUADRO_OMS11"'
      '      ,"AVALIACAO_INICIAL"."FL_QUADRO_OMS12"'
      '      ,"AVALIACAO_INICIAL"."FL_QUADRO_OMS13"'
      '      ,"AVALIACAO_INICIAL"."FL_QUADRO_OMS14"'
      '      ,"AVALIACAO_INICIAL"."FL_QUADRO_OMS15"'
      '      ,"AVALIACAO_INICIAL"."FL_QUADRO_OMS16"'
      '      ,"AVALIACAO_INICIAL"."FL_QUADRO_OMS17"'
      '      ,"AVALIACAO_INICIAL"."FL_QUADRO_OMS18"'
      '      ,"AVALIACAO_INICIAL"."FL_QUADRO_OMS19"'
      '      ,"AVALIACAO_INICIAL"."FL_QUADRO_OMS20"'
      '      ,"AVALIACAO_INICIAL"."FL_QUADRO_OMS21"'
      '      ,"AVALIACAO_INICIAL"."FL_QUADRO_OMS22"'
      '      ,"AVALIACAO_INICIAL"."FL_QUADRO_OMS23"'
      '      ,"AVALIACAO_INICIAL"."FL_QUADRO_OMS24"'
      '      ,"AVALIACAO_INICIAL"."FL_QUADRO_OMS25"'
      '      ,"AVALIACAO_INICIAL"."FL_QUADRO_OMS26"'
      '      ,"AVALIACAO_INICIAL"."FL_QUADRO_OMS27"'
      '      ,"AVALIACAO_INICIAL"."FL_QUADRO_OMS28"'
      '      ,"AVALIACAO_INICIAL"."FL_QUADRO_OMS29"'
      '      ,"AVALIACAO_INICIAL"."FL_QUADRO_OMS30"'
      '      ,"AVALIACAO_INICIAL"."FL_QUADRO_OMS31"'
      '      ,"AVALIACAO_INICIAL"."FL_QUADRO_OMS32"'
      '      ,"AVALIACAO_INICIAL"."FL_QUADRO_OMS33"'
      '      ,"AVALIACAO_INICIAL"."FL_QUADRO_OMS34"'
      '      ,"AVALIACAO_INICIAL"."FL_QUADRO_OMS35"'
      '      ,"AVALIACAO_INICIAL"."FL_QUADRO_OMS36"'
      '      ,"AVALIACAO_INICIAL"."FL_QUADRO_OMS37"'
      '      ,"AVALIACAO_INICIAL"."FL_QUADRO_OMS38"'
      '      ,"AVALIACAO_INICIAL"."FL_QUADRO_OMS39"'
      '      ,"AVALIACAO_INICIAL"."FL_CONCLUSAO_MENOR"'
      '      ,"AVALIACAO_INICIAL"."FL_CONCLUSAO_MAIOR"'
      '      ,"AVALIACAO_INICIAL"."TX_CLASSIFICACAO"'
      '      ,"AVALIACAO_INICIAL"."FL_CLASSIFICACAO"'
      '      ,"AVALIACAO_INICIAL"."TX_OUTRAS_QUEIXAS"'
      '      ,"AVALIACAO_INICIAL"."DT_PRINCIPAIS_ANALISES1"'
      '      ,"AVALIACAO_INICIAL"."DT_PRINCIPAIS_ANALISES2"'
      '      ,"AVALIACAO_INICIAL"."DT_PRINCIPAIS_ANALISES3"'
      '      ,"AVALIACAO_INICIAL"."DT_PRINCIPAIS_ANALISES4"'
      '      ,"AVALIACAO_INICIAL"."DT_PRINCIPAIS_ANALISES5"'
      '      ,"AVALIACAO_INICIAL"."DT_PRINCIPAIS_ANALISES6"'
      '      ,"AVALIACAO_INICIAL"."FL_SEGUIMENTO_ROTINA"'
      '      ,"AVALIACAO_INICIAL"."FL_VAGA_ABERTA"'
      '      ,"AVALIACAO_INICIAL"."DT_VAGA_ABERTA"'
      '      ,"AVALIACAO_INICIAL"."FL_CD4_HEMOGRAMA"'
      '      ,"AVALIACAO_INICIAL"."TX_CD4_HEMOGRAMA"'
      '      ,"AVALIACAO_INICIAL"."FL_INICIO_IMEDIATO"'
      '      ,"AVALIACAO_INICIAL"."FL_INICIO_IMEDIATO1"'
      '      ,"AVALIACAO_INICIAL"."FL_INICIO_IMEDIATO2"'
      '      ,"AVALIACAO_INICIAL"."DT_INICIO_IMEDIATO"'
      '      ,"AVALIACAO_INICIAL"."FL_SINTOMAS_GRAVES"'
      '      ,"AVALIACAO_INICIAL"."TX_SINTOMAS_GRAVES"'
      '      ,"AVALIACAO_INICIAL"."FL_INICIO_IMEDIATO3"'
      '      ,"AVALIACAO_INICIAL"."TX_INICIO_IMEDIATO3"'
      '      ,"AVALIACAO_INICIAL"."FL_INICIO_IMEDIATO4"'
      '      ,"AVALIACAO_INICIAL"."DT_INICIO_IMEDIATO4"'
      '      ,"AVALIACAO_INICIAL"."TX_INICIO_IMEDIATO4"'
      '      ,"AVALIACAO_INICIAL"."FL_PUERPERA"'
      '      ,"AVALIACAO_INICIAL"."TX_ESQUEMA_EM_USO"'
      '      ,"AVALIACAO_INICIAL"."DT_INICIO_ARV"'
      '      ,"AVALIACAO_INICIAL"."DT_PARTO"'
      '      ,"AVALIACAO_INICIAL"."FL_PROFILAXIA"'
      '      ,"AVALIACAO_INICIAL"."FL_TRATAMENTO_ARV"'
      '      ,"AVALIACAO_INICIAL"."FL_PROFILAXIA_CONDUTA"'
      '      ,"AVALIACAO_INICIAL"."FL_ALEITAMENTO_ARTIFICIAL"'
      '      ,"AVALIACAO_INICIAL"."FL_ALEITAMENTO_MATERNO"'
      '      ,"AVALIACAO_INICIAL"."FL_TRATAMENTO_ARV2"'
      '      ,"AVALIACAO_INICIAL"."FL_SINTOMAS_GRAVES2"'
      '      ,"AVALIACAO_INICIAL"."TX_SINTOMAS_GRAVES2"'
      '      ,"AVALIACAO_INICIAL"."DT_PUERPERA_RETORNO"'
      '      ,"AVALIACAO_INICIAL"."FL_CRIANCA_EXPOSTA"'
      '      ,"AVALIACAO_INICIAL"."DT_CRIANCA_EXPOSTA"'
      '      ,"AVALIACAO_INICIAL"."FL_SEGUIMENTO"'
      '      ,"AVALIACAO_INICIAL"."TX_SEGUIMENTO"'
      '      ,"AVALIACAO_INICIAL"."FL_EM_USO_PROFILAXIA"'
      '      ,"AVALIACAO_INICIAL"."TX_AOTACOES_ENFERMAGEM"'
      '      ,"AVALIACAO_INICIAL"."NM_MEDICO"'
      '      ,"AVALIACAO_INICIAL"."NR_ORDEM"'
      '      ,"AVALIACAO_INICIAL"."CD_USUARIO_CADASTRO"'
      '      ,"AVALIACAO_INICIAL"."DT_CADASTRO"'
      '      ,"AVALIACAO_INICIAL"."CD_USUARIO_ALTERACAO"'
      '      ,"AVALIACAO_INICIAL"."DT_ALTERACAO"'
      '      ,"AVALIACAO_INICIAL"."CD_USUARIO_EXCLUSAO"'
      '      ,"AVALIACAO_INICIAL"."DT_EXCLUSAO"'
      '      ,"AVALIACAO_INICIAL"."CD_ARQUIVO"'
      '      ,"AVALIACAO_INICIAL"."CD_GRUPO"'
      '      ,"AVALIACAO_INICIAL"."CD_ARQUIVO2"'
      '      ,"AVALIACAO_INICIAL"."TX_PRINCIPAIS_ANALISES1"'
      '      ,"AVALIACAO_INICIAL"."TX_PRINCIPAIS_ANALISES2"'
      '      ,"AVALIACAO_INICIAL"."TX_PRINCIPAIS_ANALISES3"'
      '      ,"AVALIACAO_INICIAL"."TX_PRINCIPAIS_ANALISES4"'
      '      ,"AVALIACAO_INICIAL"."TX_PRINCIPAIS_ANALISES5"'
      '      ,"AVALIACAO_INICIAL"."TX_PRINCIPAIS_ANALISES6"'
      '      ,"AVALIACAO_INICIAL"."TX_PRINCIPAIS_ANALISES7"'
      '      ,"AVALIACAO_INICIAL"."FL_ANALISES_ALTERADAS"'
      '      ,"AVALIACAO_INICIAL"."TX_ANALISES_ALTERADAS"'
      '      ,PACIENTE.NR_PROCESSO'
      '      ,PACIENTE.NM_PACIENTE'
      '      ,(select DS_MUNICIPIO from MUNICIPIO '
      '        where CD_MUNICIPIO = PACIENTE.CD_MUNICIPIO) DS_MUNICIPIO'
      '      ,(select DS_PROVINCIA from PROVINCIA'
      '        where CD_PROVINCIA = PACIENTE.CD_PROVINCIA) DS_PROVINCIA'
      '      ,PACIENTE.DT_NASCIMENTO'
      '      ,PACIENTE.IDADE'
      '      ,PACIENTE.TP_SEXO'
      '      ,PACIENTE.NM_MAE'
      'from "AVALIACAO_INICIAL"'
      '  left outer join PACIENTE'
      '  on PACIENTE.CD_PACIENTE = "AVALIACAO_INICIAL"."CD_PACIENTE"'
      'where "AVALIACAO_INICIAL"."CD_PACIENTE" = :CD_PACIENTE')
    ModifySQL.Strings = (
      'update "AVALIACAO_INICIAL"'
      'set'
      ' "CD_AVALIACAO_INICIAL" = :"CD_AVALIACAO_INICIAL"'
      ', "CD_PACIENTE" = :"CD_PACIENTE"'
      ', "FL_MOTIVO" = :"FL_MOTIVO"'
      ', "DT_DIAGNOSTICO" = :"DT_DIAGNOSTICO"'
      ', "NR_FILHO" = :"NR_FILHO"'
      ', "FL_TESTE" = :"FL_TESTE"'
      ', "FL_PARCEIRO_TESTE" = :"FL_PARCEIRO_TESTE"'
      ', "TX_RESULTADO" = :"TX_RESULTADO"'
      ', "FL_MAIS_PARCEIRO" = :"FL_MAIS_PARCEIRO"'
      ', "FL_GRAVIDA" = :"FL_GRAVIDA"'
      ', "TX_SINAIS_VITAIS1" = :"TX_SINAIS_VITAIS1"'
      ', "TX_SINAIS_VITAIS2" = :"TX_SINAIS_VITAIS2"'
      ', "TX_SINAIS_VITAIS3" = :"TX_SINAIS_VITAIS3"'
      ', "TX_SINAIS_VITAIS4" = :"TX_SINAIS_VITAIS4"'
      ', "TX_SINAIS_VITAIS5" = :"TX_SINAIS_VITAIS5"'
      ', "TX_SINAIS_VITAIS6" = :"TX_SINAIS_VITAIS6"'
      ', "FL_SINAIS_PALUDISMO" = :"FL_SINAIS_PALUDISMO"'
      ', "FL_SINAIS_TUBERCULOSE" = :"FL_SINAIS_TUBERCULOSE"'
      ', "FL_DIAG_PALUDISMO" = :"FL_DIAG_PALUDISMO"'
      ', "FL_DIAG_TUBERCULOSE" = :"FL_DIAG_TUBERCULOSE"'
      ', "TX_SINAIS_CONDUTA" = :"TX_SINAIS_CONDUTA"'
      ', "FL_QUADRO_OMS1" = :"FL_QUADRO_OMS1"'
      ', "FL_QUADRO_OMS2" = :"FL_QUADRO_OMS2"'
      ', "FL_QUADRO_OMS3" = :"FL_QUADRO_OMS3"'
      ', "FL_QUADRO_OMS4" = :"FL_QUADRO_OMS4"'
      ', "FL_QUADRO_OMS5" = :"FL_QUADRO_OMS5"'
      ', "FL_QUADRO_OMS6" = :"FL_QUADRO_OMS6"'
      ', "FL_QUADRO_OMS7" = :"FL_QUADRO_OMS7"'
      ', "FL_QUADRO_OMS8" = :"FL_QUADRO_OMS8"'
      ', "FL_QUADRO_OMS9" = :"FL_QUADRO_OMS9"'
      ', "FL_QUADRO_OMS10" = :"FL_QUADRO_OMS10"'
      ', "FL_QUADRO_OMS11" = :"FL_QUADRO_OMS11"'
      ', "FL_QUADRO_OMS12" = :"FL_QUADRO_OMS12"'
      ', "FL_QUADRO_OMS13" = :"FL_QUADRO_OMS13"'
      ', "FL_QUADRO_OMS14" = :"FL_QUADRO_OMS14"'
      ', "FL_QUADRO_OMS15" = :"FL_QUADRO_OMS15"'
      ', "FL_QUADRO_OMS16" = :"FL_QUADRO_OMS16"'
      ', "FL_QUADRO_OMS17" = :"FL_QUADRO_OMS17"'
      ', "FL_QUADRO_OMS18" = :"FL_QUADRO_OMS18"'
      ', "FL_QUADRO_OMS19" = :"FL_QUADRO_OMS19"'
      ', "FL_QUADRO_OMS20" = :"FL_QUADRO_OMS20"'
      ', "FL_QUADRO_OMS21" = :"FL_QUADRO_OMS21"'
      ', "FL_QUADRO_OMS22" = :"FL_QUADRO_OMS22"'
      ', "FL_QUADRO_OMS23" = :"FL_QUADRO_OMS23"'
      ', "FL_QUADRO_OMS24" = :"FL_QUADRO_OMS24"'
      ', "FL_QUADRO_OMS25" = :"FL_QUADRO_OMS25"'
      ', "FL_QUADRO_OMS26" = :"FL_QUADRO_OMS26"'
      ', "FL_QUADRO_OMS27" = :"FL_QUADRO_OMS27"'
      ', "FL_QUADRO_OMS28" = :"FL_QUADRO_OMS28"'
      ', "FL_QUADRO_OMS29" = :"FL_QUADRO_OMS29"'
      ', "FL_QUADRO_OMS30" = :"FL_QUADRO_OMS30"'
      ', "FL_QUADRO_OMS31" = :"FL_QUADRO_OMS31"'
      ', "FL_QUADRO_OMS32" = :"FL_QUADRO_OMS32"'
      ', "FL_QUADRO_OMS33" = :"FL_QUADRO_OMS33"'
      ', "FL_QUADRO_OMS34" = :"FL_QUADRO_OMS34"'
      ', "FL_QUADRO_OMS35" = :"FL_QUADRO_OMS35"'
      ', "FL_QUADRO_OMS36" = :"FL_QUADRO_OMS36"'
      ', "FL_QUADRO_OMS37" = :"FL_QUADRO_OMS37"'
      ', "FL_QUADRO_OMS38" = :"FL_QUADRO_OMS38"'
      ', "FL_QUADRO_OMS39" = :"FL_QUADRO_OMS39"'
      ', "FL_CONCLUSAO_MENOR" = :"FL_CONCLUSAO_MENOR"'
      ', "FL_CONCLUSAO_MAIOR" = :"FL_CONCLUSAO_MAIOR"'
      ', "TX_CLASSIFICACAO" = :"TX_CLASSIFICACAO"'
      ', "FL_CLASSIFICACAO" = :"FL_CLASSIFICACAO"'
      ', "TX_OUTRAS_QUEIXAS" = :"TX_OUTRAS_QUEIXAS"'
      ', "DT_PRINCIPAIS_ANALISES1" = :"DT_PRINCIPAIS_ANALISES1"'
      ', "DT_PRINCIPAIS_ANALISES2" = :"DT_PRINCIPAIS_ANALISES2"'
      ', "DT_PRINCIPAIS_ANALISES3" = :"DT_PRINCIPAIS_ANALISES3"'
      ', "DT_PRINCIPAIS_ANALISES4" = :"DT_PRINCIPAIS_ANALISES4"'
      ', "DT_PRINCIPAIS_ANALISES5" = :"DT_PRINCIPAIS_ANALISES5"'
      ', "DT_PRINCIPAIS_ANALISES6" = :"DT_PRINCIPAIS_ANALISES6"'
      ', "FL_SEGUIMENTO_ROTINA" = :"FL_SEGUIMENTO_ROTINA"'
      ', "FL_VAGA_ABERTA" = :"FL_VAGA_ABERTA"'
      ', "DT_VAGA_ABERTA" = :"DT_VAGA_ABERTA"'
      ', "FL_CD4_HEMOGRAMA" = :"FL_CD4_HEMOGRAMA"'
      ', "TX_CD4_HEMOGRAMA" = :"TX_CD4_HEMOGRAMA"'
      ', "FL_INICIO_IMEDIATO" = :"FL_INICIO_IMEDIATO"'
      ', "FL_INICIO_IMEDIATO1" = :"FL_INICIO_IMEDIATO1"'
      ', "FL_INICIO_IMEDIATO2" = :"FL_INICIO_IMEDIATO2"'
      ', "DT_INICIO_IMEDIATO" = :"DT_INICIO_IMEDIATO"'
      ', "FL_SINTOMAS_GRAVES" = :"FL_SINTOMAS_GRAVES"'
      ', "TX_SINTOMAS_GRAVES" = :"TX_SINTOMAS_GRAVES"'
      ', "FL_INICIO_IMEDIATO3" = :"FL_INICIO_IMEDIATO3"'
      ', "TX_INICIO_IMEDIATO3" = :"TX_INICIO_IMEDIATO3"'
      ', "FL_INICIO_IMEDIATO4" = :"FL_INICIO_IMEDIATO4"'
      ', "DT_INICIO_IMEDIATO4" = :"DT_INICIO_IMEDIATO4"'
      ', "TX_INICIO_IMEDIATO4" = :"TX_INICIO_IMEDIATO4"'
      ', "FL_PUERPERA" = :"FL_PUERPERA"'
      ', "TX_ESQUEMA_EM_USO" = :"TX_ESQUEMA_EM_USO"'
      ', "DT_INICIO_ARV" = :"DT_INICIO_ARV"'
      ', "DT_PARTO" = :"DT_PARTO"'
      ', "FL_PROFILAXIA" = :"FL_PROFILAXIA"'
      ', "FL_TRATAMENTO_ARV" = :"FL_TRATAMENTO_ARV"'
      ', "FL_PROFILAXIA_CONDUTA" = :"FL_PROFILAXIA_CONDUTA"'
      ', "FL_ALEITAMENTO_ARTIFICIAL" = :"FL_ALEITAMENTO_ARTIFICIAL"'
      ', "FL_ALEITAMENTO_MATERNO" = :"FL_ALEITAMENTO_MATERNO"'
      ', "FL_TRATAMENTO_ARV2" = :"FL_TRATAMENTO_ARV2"'
      ', "FL_SINTOMAS_GRAVES2" = :"FL_SINTOMAS_GRAVES2"'
      ', "TX_SINTOMAS_GRAVES2" = :"TX_SINTOMAS_GRAVES2"'
      ', "DT_PUERPERA_RETORNO" = :"DT_PUERPERA_RETORNO"'
      ', "FL_CRIANCA_EXPOSTA" = :"FL_CRIANCA_EXPOSTA"'
      ', "DT_CRIANCA_EXPOSTA" = :"DT_CRIANCA_EXPOSTA"'
      ', "FL_SEGUIMENTO" = :"FL_SEGUIMENTO"'
      ', "TX_SEGUIMENTO" = :"TX_SEGUIMENTO"'
      ', "FL_EM_USO_PROFILAXIA" = :"FL_EM_USO_PROFILAXIA"'
      ', "TX_AOTACOES_ENFERMAGEM" = :"TX_AOTACOES_ENFERMAGEM"'
      ', "NM_MEDICO" = :"NM_MEDICO"'
      ', "NR_ORDEM" = :"NR_ORDEM"'
      ', "CD_USUARIO_CADASTRO" = :"CD_USUARIO_CADASTRO"'
      ', "DT_CADASTRO" = :"DT_CADASTRO"'
      ', "CD_USUARIO_ALTERACAO" = :"CD_USUARIO_ALTERACAO"'
      ', "DT_ALTERACAO" = :"DT_ALTERACAO"'
      ', "CD_USUARIO_EXCLUSAO" = :"CD_USUARIO_EXCLUSAO"'
      ', "DT_EXCLUSAO" = :"DT_EXCLUSAO"'
      ', "CD_ARQUIVO" = :"CD_ARQUIVO"'
      ', "CD_GRUPO" = :"CD_GRUPO"'
      ', "CD_ARQUIVO2" = :"CD_ARQUIVO2"'
      ', "TX_PRINCIPAIS_ANALISES1" = :"TX_PRINCIPAIS_ANALISES1"'
      ', "TX_PRINCIPAIS_ANALISES2" = :"TX_PRINCIPAIS_ANALISES2"'
      ', "TX_PRINCIPAIS_ANALISES3" = :"TX_PRINCIPAIS_ANALISES3"'
      ', "TX_PRINCIPAIS_ANALISES4" = :"TX_PRINCIPAIS_ANALISES4"'
      ', "TX_PRINCIPAIS_ANALISES5" = :"TX_PRINCIPAIS_ANALISES5"'
      ', "TX_PRINCIPAIS_ANALISES6" = :"TX_PRINCIPAIS_ANALISES6"'
      ', "TX_PRINCIPAIS_ANALISES7" = :"TX_PRINCIPAIS_ANALISES7"'
      ', "FL_ANALISES_ALTERADAS" = :"FL_ANALISES_ALTERADAS"'
      ', "TX_ANALISES_ALTERADAS" = :"TX_ANALISES_ALTERADAS"'
      'where'
      '  "CD_AVALIACAO_INICIAL" = :"OLD_CD_AVALIACAO_INICIAL"')
    GeneratorField.Field = 'CD_AVALIACAO_INICIAL'
    GeneratorField.Generator = 'GEN_AVALIACAO_INICIAL'
    Left = 824
    Top = 459
    object TB_AVALIACAO_INICIALCD_AVALIACAO_INICIAL: TIntegerField
      FieldName = 'CD_AVALIACAO_INICIAL'
      Origin = 'AVALIACAO_INICIAL.CD_AVALIACAO_INICIAL'
      Required = True
    end
    object TB_AVALIACAO_INICIALCD_PACIENTE: TIntegerField
      FieldName = 'CD_PACIENTE'
      Origin = 'AVALIACAO_INICIAL.CD_PACIENTE'
    end
    object TB_AVALIACAO_INICIALFL_MOTIVO: TIBStringField
      FieldName = 'FL_MOTIVO'
      Origin = 'AVALIACAO_INICIAL.FL_MOTIVO'
      FixedChar = True
      Size = 1
    end
    object TB_AVALIACAO_INICIALDT_DIAGNOSTICO: TDateField
      FieldName = 'DT_DIAGNOSTICO'
      Origin = 'AVALIACAO_INICIAL.DT_DIAGNOSTICO'
    end
    object TB_AVALIACAO_INICIALNR_FILHO: TIntegerField
      FieldName = 'NR_FILHO'
      Origin = 'AVALIACAO_INICIAL.NR_FILHO'
    end
    object TB_AVALIACAO_INICIALFL_TESTE: TIBStringField
      FieldName = 'FL_TESTE'
      Origin = 'AVALIACAO_INICIAL.FL_TESTE'
      FixedChar = True
      Size = 1
    end
    object TB_AVALIACAO_INICIALFL_PARCEIRO_TESTE: TIBStringField
      FieldName = 'FL_PARCEIRO_TESTE'
      Origin = 'AVALIACAO_INICIAL.FL_PARCEIRO_TESTE'
      FixedChar = True
      Size = 1
    end
    object TB_AVALIACAO_INICIALTX_RESULTADO: TIBStringField
      FieldName = 'TX_RESULTADO'
      Origin = 'AVALIACAO_INICIAL.TX_RESULTADO'
      Size = 50
    end
    object TB_AVALIACAO_INICIALFL_MAIS_PARCEIRO: TIBStringField
      FieldName = 'FL_MAIS_PARCEIRO'
      Origin = 'AVALIACAO_INICIAL.FL_MAIS_PARCEIRO'
      FixedChar = True
      Size = 1
    end
    object TB_AVALIACAO_INICIALFL_GRAVIDA: TIBStringField
      FieldName = 'FL_GRAVIDA'
      Origin = 'AVALIACAO_INICIAL.FL_GRAVIDA'
      FixedChar = True
      Size = 1
    end
    object TB_AVALIACAO_INICIALTX_SINAIS_VITAIS1: TIBStringField
      FieldName = 'TX_SINAIS_VITAIS1'
      Origin = 'AVALIACAO_INICIAL.TX_SINAIS_VITAIS1'
    end
    object TB_AVALIACAO_INICIALTX_SINAIS_VITAIS2: TIBStringField
      FieldName = 'TX_SINAIS_VITAIS2'
      Origin = 'AVALIACAO_INICIAL.TX_SINAIS_VITAIS2'
    end
    object TB_AVALIACAO_INICIALTX_SINAIS_VITAIS3: TIBStringField
      FieldName = 'TX_SINAIS_VITAIS3'
      Origin = 'AVALIACAO_INICIAL.TX_SINAIS_VITAIS3'
    end
    object TB_AVALIACAO_INICIALTX_SINAIS_VITAIS4: TIBStringField
      FieldName = 'TX_SINAIS_VITAIS4'
      Origin = 'AVALIACAO_INICIAL.TX_SINAIS_VITAIS4'
    end
    object TB_AVALIACAO_INICIALTX_SINAIS_VITAIS5: TIBStringField
      FieldName = 'TX_SINAIS_VITAIS5'
      Origin = 'AVALIACAO_INICIAL.TX_SINAIS_VITAIS5'
    end
    object TB_AVALIACAO_INICIALTX_SINAIS_VITAIS6: TIBStringField
      FieldName = 'TX_SINAIS_VITAIS6'
      Origin = 'AVALIACAO_INICIAL.TX_SINAIS_VITAIS6'
    end
    object TB_AVALIACAO_INICIALFL_SINAIS_PALUDISMO: TIBStringField
      FieldName = 'FL_SINAIS_PALUDISMO'
      Origin = 'AVALIACAO_INICIAL.FL_SINAIS_PALUDISMO'
      FixedChar = True
      Size = 1
    end
    object TB_AVALIACAO_INICIALFL_SINAIS_TUBERCULOSE: TIBStringField
      FieldName = 'FL_SINAIS_TUBERCULOSE'
      Origin = 'AVALIACAO_INICIAL.FL_SINAIS_TUBERCULOSE'
      FixedChar = True
      Size = 1
    end
    object TB_AVALIACAO_INICIALFL_DIAG_PALUDISMO: TIBStringField
      FieldName = 'FL_DIAG_PALUDISMO'
      Origin = 'AVALIACAO_INICIAL.FL_DIAG_PALUDISMO'
      FixedChar = True
      Size = 1
    end
    object TB_AVALIACAO_INICIALFL_DIAG_TUBERCULOSE: TIBStringField
      FieldName = 'FL_DIAG_TUBERCULOSE'
      Origin = 'AVALIACAO_INICIAL.FL_DIAG_TUBERCULOSE'
      FixedChar = True
      Size = 1
    end
    object TB_AVALIACAO_INICIALTX_SINAIS_CONDUTA: TIBStringField
      FieldName = 'TX_SINAIS_CONDUTA'
      Origin = 'AVALIACAO_INICIAL.TX_SINAIS_CONDUTA'
      Size = 200
    end
    object TB_AVALIACAO_INICIALFL_QUADRO_OMS1: TIBStringField
      FieldName = 'FL_QUADRO_OMS1'
      Origin = 'AVALIACAO_INICIAL.FL_QUADRO_OMS1'
      FixedChar = True
      Size = 1
    end
    object TB_AVALIACAO_INICIALFL_QUADRO_OMS2: TIBStringField
      FieldName = 'FL_QUADRO_OMS2'
      Origin = 'AVALIACAO_INICIAL.FL_QUADRO_OMS2'
      FixedChar = True
      Size = 1
    end
    object TB_AVALIACAO_INICIALFL_QUADRO_OMS3: TIBStringField
      FieldName = 'FL_QUADRO_OMS3'
      Origin = 'AVALIACAO_INICIAL.FL_QUADRO_OMS3'
      FixedChar = True
      Size = 1
    end
    object TB_AVALIACAO_INICIALFL_QUADRO_OMS4: TIBStringField
      FieldName = 'FL_QUADRO_OMS4'
      Origin = 'AVALIACAO_INICIAL.FL_QUADRO_OMS4'
      FixedChar = True
      Size = 1
    end
    object TB_AVALIACAO_INICIALFL_QUADRO_OMS5: TIBStringField
      FieldName = 'FL_QUADRO_OMS5'
      Origin = 'AVALIACAO_INICIAL.FL_QUADRO_OMS5'
      FixedChar = True
      Size = 1
    end
    object TB_AVALIACAO_INICIALFL_QUADRO_OMS6: TIBStringField
      FieldName = 'FL_QUADRO_OMS6'
      Origin = 'AVALIACAO_INICIAL.FL_QUADRO_OMS6'
      FixedChar = True
      Size = 1
    end
    object TB_AVALIACAO_INICIALFL_QUADRO_OMS7: TIBStringField
      FieldName = 'FL_QUADRO_OMS7'
      Origin = 'AVALIACAO_INICIAL.FL_QUADRO_OMS7'
      FixedChar = True
      Size = 1
    end
    object TB_AVALIACAO_INICIALFL_QUADRO_OMS8: TIBStringField
      FieldName = 'FL_QUADRO_OMS8'
      Origin = 'AVALIACAO_INICIAL.FL_QUADRO_OMS8'
      FixedChar = True
      Size = 1
    end
    object TB_AVALIACAO_INICIALFL_QUADRO_OMS9: TIBStringField
      FieldName = 'FL_QUADRO_OMS9'
      Origin = 'AVALIACAO_INICIAL.FL_QUADRO_OMS9'
      FixedChar = True
      Size = 1
    end
    object TB_AVALIACAO_INICIALFL_QUADRO_OMS10: TIBStringField
      FieldName = 'FL_QUADRO_OMS10'
      Origin = 'AVALIACAO_INICIAL.FL_QUADRO_OMS10'
      FixedChar = True
      Size = 1
    end
    object TB_AVALIACAO_INICIALFL_QUADRO_OMS11: TIBStringField
      FieldName = 'FL_QUADRO_OMS11'
      Origin = 'AVALIACAO_INICIAL.FL_QUADRO_OMS11'
      FixedChar = True
      Size = 1
    end
    object TB_AVALIACAO_INICIALFL_QUADRO_OMS12: TIBStringField
      FieldName = 'FL_QUADRO_OMS12'
      Origin = 'AVALIACAO_INICIAL.FL_QUADRO_OMS12'
      FixedChar = True
      Size = 1
    end
    object TB_AVALIACAO_INICIALFL_QUADRO_OMS13: TIBStringField
      FieldName = 'FL_QUADRO_OMS13'
      Origin = 'AVALIACAO_INICIAL.FL_QUADRO_OMS13'
      FixedChar = True
      Size = 1
    end
    object TB_AVALIACAO_INICIALFL_QUADRO_OMS14: TIBStringField
      FieldName = 'FL_QUADRO_OMS14'
      Origin = 'AVALIACAO_INICIAL.FL_QUADRO_OMS14'
      FixedChar = True
      Size = 1
    end
    object TB_AVALIACAO_INICIALFL_QUADRO_OMS15: TIBStringField
      FieldName = 'FL_QUADRO_OMS15'
      Origin = 'AVALIACAO_INICIAL.FL_QUADRO_OMS15'
      FixedChar = True
      Size = 1
    end
    object TB_AVALIACAO_INICIALFL_QUADRO_OMS16: TIBStringField
      FieldName = 'FL_QUADRO_OMS16'
      Origin = 'AVALIACAO_INICIAL.FL_QUADRO_OMS16'
      FixedChar = True
      Size = 1
    end
    object TB_AVALIACAO_INICIALFL_QUADRO_OMS17: TIBStringField
      FieldName = 'FL_QUADRO_OMS17'
      Origin = 'AVALIACAO_INICIAL.FL_QUADRO_OMS17'
      FixedChar = True
      Size = 1
    end
    object TB_AVALIACAO_INICIALFL_QUADRO_OMS18: TIBStringField
      FieldName = 'FL_QUADRO_OMS18'
      Origin = 'AVALIACAO_INICIAL.FL_QUADRO_OMS18'
      FixedChar = True
      Size = 1
    end
    object TB_AVALIACAO_INICIALFL_QUADRO_OMS19: TIBStringField
      FieldName = 'FL_QUADRO_OMS19'
      Origin = 'AVALIACAO_INICIAL.FL_QUADRO_OMS19'
      FixedChar = True
      Size = 1
    end
    object TB_AVALIACAO_INICIALFL_QUADRO_OMS20: TIBStringField
      FieldName = 'FL_QUADRO_OMS20'
      Origin = 'AVALIACAO_INICIAL.FL_QUADRO_OMS20'
      FixedChar = True
      Size = 1
    end
    object TB_AVALIACAO_INICIALFL_QUADRO_OMS21: TIBStringField
      FieldName = 'FL_QUADRO_OMS21'
      Origin = 'AVALIACAO_INICIAL.FL_QUADRO_OMS21'
      FixedChar = True
      Size = 1
    end
    object TB_AVALIACAO_INICIALFL_QUADRO_OMS22: TIBStringField
      FieldName = 'FL_QUADRO_OMS22'
      Origin = 'AVALIACAO_INICIAL.FL_QUADRO_OMS22'
      FixedChar = True
      Size = 1
    end
    object TB_AVALIACAO_INICIALFL_QUADRO_OMS23: TIBStringField
      FieldName = 'FL_QUADRO_OMS23'
      Origin = 'AVALIACAO_INICIAL.FL_QUADRO_OMS23'
      FixedChar = True
      Size = 1
    end
    object TB_AVALIACAO_INICIALFL_QUADRO_OMS24: TIBStringField
      FieldName = 'FL_QUADRO_OMS24'
      Origin = 'AVALIACAO_INICIAL.FL_QUADRO_OMS24'
      FixedChar = True
      Size = 1
    end
    object TB_AVALIACAO_INICIALFL_QUADRO_OMS25: TIBStringField
      FieldName = 'FL_QUADRO_OMS25'
      Origin = 'AVALIACAO_INICIAL.FL_QUADRO_OMS25'
      FixedChar = True
      Size = 1
    end
    object TB_AVALIACAO_INICIALFL_QUADRO_OMS26: TIBStringField
      FieldName = 'FL_QUADRO_OMS26'
      Origin = 'AVALIACAO_INICIAL.FL_QUADRO_OMS26'
      FixedChar = True
      Size = 1
    end
    object TB_AVALIACAO_INICIALFL_QUADRO_OMS27: TIBStringField
      FieldName = 'FL_QUADRO_OMS27'
      Origin = 'AVALIACAO_INICIAL.FL_QUADRO_OMS27'
      FixedChar = True
      Size = 1
    end
    object TB_AVALIACAO_INICIALFL_QUADRO_OMS28: TIBStringField
      FieldName = 'FL_QUADRO_OMS28'
      Origin = 'AVALIACAO_INICIAL.FL_QUADRO_OMS28'
      FixedChar = True
      Size = 1
    end
    object TB_AVALIACAO_INICIALFL_QUADRO_OMS29: TIBStringField
      FieldName = 'FL_QUADRO_OMS29'
      Origin = 'AVALIACAO_INICIAL.FL_QUADRO_OMS29'
      FixedChar = True
      Size = 1
    end
    object TB_AVALIACAO_INICIALFL_QUADRO_OMS30: TIBStringField
      FieldName = 'FL_QUADRO_OMS30'
      Origin = 'AVALIACAO_INICIAL.FL_QUADRO_OMS30'
      FixedChar = True
      Size = 1
    end
    object TB_AVALIACAO_INICIALFL_QUADRO_OMS31: TIBStringField
      FieldName = 'FL_QUADRO_OMS31'
      Origin = 'AVALIACAO_INICIAL.FL_QUADRO_OMS31'
      FixedChar = True
      Size = 1
    end
    object TB_AVALIACAO_INICIALFL_QUADRO_OMS32: TIBStringField
      FieldName = 'FL_QUADRO_OMS32'
      Origin = 'AVALIACAO_INICIAL.FL_QUADRO_OMS32'
      FixedChar = True
      Size = 1
    end
    object TB_AVALIACAO_INICIALFL_QUADRO_OMS33: TIBStringField
      FieldName = 'FL_QUADRO_OMS33'
      Origin = 'AVALIACAO_INICIAL.FL_QUADRO_OMS33'
      FixedChar = True
      Size = 1
    end
    object TB_AVALIACAO_INICIALFL_QUADRO_OMS34: TIBStringField
      FieldName = 'FL_QUADRO_OMS34'
      Origin = 'AVALIACAO_INICIAL.FL_QUADRO_OMS34'
      FixedChar = True
      Size = 1
    end
    object TB_AVALIACAO_INICIALFL_QUADRO_OMS35: TIBStringField
      FieldName = 'FL_QUADRO_OMS35'
      Origin = 'AVALIACAO_INICIAL.FL_QUADRO_OMS35'
      FixedChar = True
      Size = 1
    end
    object TB_AVALIACAO_INICIALFL_QUADRO_OMS36: TIBStringField
      FieldName = 'FL_QUADRO_OMS36'
      Origin = 'AVALIACAO_INICIAL.FL_QUADRO_OMS36'
      FixedChar = True
      Size = 1
    end
    object TB_AVALIACAO_INICIALFL_QUADRO_OMS37: TIBStringField
      FieldName = 'FL_QUADRO_OMS37'
      Origin = 'AVALIACAO_INICIAL.FL_QUADRO_OMS37'
      FixedChar = True
      Size = 1
    end
    object TB_AVALIACAO_INICIALFL_QUADRO_OMS38: TIBStringField
      FieldName = 'FL_QUADRO_OMS38'
      Origin = 'AVALIACAO_INICIAL.FL_QUADRO_OMS38'
      FixedChar = True
      Size = 1
    end
    object TB_AVALIACAO_INICIALFL_QUADRO_OMS39: TIBStringField
      FieldName = 'FL_QUADRO_OMS39'
      Origin = 'AVALIACAO_INICIAL.FL_QUADRO_OMS39'
      FixedChar = True
      Size = 1
    end
    object TB_AVALIACAO_INICIALFL_CONCLUSAO_MENOR: TIBStringField
      FieldName = 'FL_CONCLUSAO_MENOR'
      Origin = 'AVALIACAO_INICIAL.FL_CONCLUSAO_MENOR'
      FixedChar = True
      Size = 1
    end
    object TB_AVALIACAO_INICIALFL_CONCLUSAO_MAIOR: TIBStringField
      FieldName = 'FL_CONCLUSAO_MAIOR'
      Origin = 'AVALIACAO_INICIAL.FL_CONCLUSAO_MAIOR'
      FixedChar = True
      Size = 1
    end
    object TB_AVALIACAO_INICIALTX_CLASSIFICACAO: TIBStringField
      FieldName = 'TX_CLASSIFICACAO'
      Origin = 'AVALIACAO_INICIAL.TX_CLASSIFICACAO'
      Size = 10
    end
    object TB_AVALIACAO_INICIALFL_CLASSIFICACAO: TIBStringField
      FieldName = 'FL_CLASSIFICACAO'
      Origin = 'AVALIACAO_INICIAL.FL_CLASSIFICACAO'
      FixedChar = True
      Size = 1
    end
    object TB_AVALIACAO_INICIALTX_OUTRAS_QUEIXAS: TIBStringField
      FieldName = 'TX_OUTRAS_QUEIXAS'
      Origin = 'AVALIACAO_INICIAL.TX_OUTRAS_QUEIXAS'
      Size = 300
    end
    object TB_AVALIACAO_INICIALDT_PRINCIPAIS_ANALISES1: TDateField
      FieldName = 'DT_PRINCIPAIS_ANALISES1'
      Origin = 'AVALIACAO_INICIAL.DT_PRINCIPAIS_ANALISES1'
    end
    object TB_AVALIACAO_INICIALDT_PRINCIPAIS_ANALISES2: TDateField
      FieldName = 'DT_PRINCIPAIS_ANALISES2'
      Origin = 'AVALIACAO_INICIAL.DT_PRINCIPAIS_ANALISES2'
    end
    object TB_AVALIACAO_INICIALDT_PRINCIPAIS_ANALISES3: TDateField
      FieldName = 'DT_PRINCIPAIS_ANALISES3'
      Origin = 'AVALIACAO_INICIAL.DT_PRINCIPAIS_ANALISES3'
    end
    object TB_AVALIACAO_INICIALDT_PRINCIPAIS_ANALISES4: TDateField
      FieldName = 'DT_PRINCIPAIS_ANALISES4'
      Origin = 'AVALIACAO_INICIAL.DT_PRINCIPAIS_ANALISES4'
    end
    object TB_AVALIACAO_INICIALDT_PRINCIPAIS_ANALISES5: TDateField
      FieldName = 'DT_PRINCIPAIS_ANALISES5'
      Origin = 'AVALIACAO_INICIAL.DT_PRINCIPAIS_ANALISES5'
    end
    object TB_AVALIACAO_INICIALDT_PRINCIPAIS_ANALISES6: TDateField
      FieldName = 'DT_PRINCIPAIS_ANALISES6'
      Origin = 'AVALIACAO_INICIAL.DT_PRINCIPAIS_ANALISES6'
    end
    object TB_AVALIACAO_INICIALFL_SEGUIMENTO_ROTINA: TIBStringField
      FieldName = 'FL_SEGUIMENTO_ROTINA'
      Origin = 'AVALIACAO_INICIAL.FL_SEGUIMENTO_ROTINA'
      FixedChar = True
      Size = 1
    end
    object TB_AVALIACAO_INICIALFL_VAGA_ABERTA: TIBStringField
      FieldName = 'FL_VAGA_ABERTA'
      Origin = 'AVALIACAO_INICIAL.FL_VAGA_ABERTA'
      FixedChar = True
      Size = 1
    end
    object TB_AVALIACAO_INICIALDT_VAGA_ABERTA: TDateField
      FieldName = 'DT_VAGA_ABERTA'
      Origin = 'AVALIACAO_INICIAL.DT_VAGA_ABERTA'
    end
    object TB_AVALIACAO_INICIALFL_CD4_HEMOGRAMA: TIBStringField
      FieldName = 'FL_CD4_HEMOGRAMA'
      Origin = 'AVALIACAO_INICIAL.FL_CD4_HEMOGRAMA'
      FixedChar = True
      Size = 1
    end
    object TB_AVALIACAO_INICIALTX_CD4_HEMOGRAMA: TIBStringField
      FieldName = 'TX_CD4_HEMOGRAMA'
      Origin = 'AVALIACAO_INICIAL.TX_CD4_HEMOGRAMA'
      Size = 100
    end
    object TB_AVALIACAO_INICIALFL_INICIO_IMEDIATO: TIBStringField
      FieldName = 'FL_INICIO_IMEDIATO'
      Origin = 'AVALIACAO_INICIAL.FL_INICIO_IMEDIATO'
      FixedChar = True
      Size = 1
    end
    object TB_AVALIACAO_INICIALFL_INICIO_IMEDIATO1: TIBStringField
      FieldName = 'FL_INICIO_IMEDIATO1'
      Origin = 'AVALIACAO_INICIAL.FL_INICIO_IMEDIATO1'
      FixedChar = True
      Size = 1
    end
    object TB_AVALIACAO_INICIALFL_INICIO_IMEDIATO2: TIBStringField
      FieldName = 'FL_INICIO_IMEDIATO2'
      Origin = 'AVALIACAO_INICIAL.FL_INICIO_IMEDIATO2'
      FixedChar = True
      Size = 1
    end
    object TB_AVALIACAO_INICIALDT_INICIO_IMEDIATO: TDateField
      FieldName = 'DT_INICIO_IMEDIATO'
      Origin = 'AVALIACAO_INICIAL.DT_INICIO_IMEDIATO'
    end
    object TB_AVALIACAO_INICIALFL_SINTOMAS_GRAVES: TIBStringField
      FieldName = 'FL_SINTOMAS_GRAVES'
      Origin = 'AVALIACAO_INICIAL.FL_SINTOMAS_GRAVES'
      FixedChar = True
      Size = 1
    end
    object TB_AVALIACAO_INICIALTX_SINTOMAS_GRAVES: TIBStringField
      FieldName = 'TX_SINTOMAS_GRAVES'
      Origin = 'AVALIACAO_INICIAL.TX_SINTOMAS_GRAVES'
      Size = 100
    end
    object TB_AVALIACAO_INICIALFL_INICIO_IMEDIATO3: TIBStringField
      FieldName = 'FL_INICIO_IMEDIATO3'
      Origin = 'AVALIACAO_INICIAL.FL_INICIO_IMEDIATO3'
      FixedChar = True
      Size = 1
    end
    object TB_AVALIACAO_INICIALTX_INICIO_IMEDIATO3: TIBStringField
      FieldName = 'TX_INICIO_IMEDIATO3'
      Origin = 'AVALIACAO_INICIAL.TX_INICIO_IMEDIATO3'
      Size = 100
    end
    object TB_AVALIACAO_INICIALFL_INICIO_IMEDIATO4: TIBStringField
      FieldName = 'FL_INICIO_IMEDIATO4'
      Origin = 'AVALIACAO_INICIAL.FL_INICIO_IMEDIATO4'
      FixedChar = True
      Size = 1
    end
    object TB_AVALIACAO_INICIALDT_INICIO_IMEDIATO4: TDateField
      FieldName = 'DT_INICIO_IMEDIATO4'
      Origin = 'AVALIACAO_INICIAL.DT_INICIO_IMEDIATO4'
    end
    object TB_AVALIACAO_INICIALTX_INICIO_IMEDIATO4: TIBStringField
      FieldName = 'TX_INICIO_IMEDIATO4'
      Origin = 'AVALIACAO_INICIAL.TX_INICIO_IMEDIATO4'
      Size = 100
    end
    object TB_AVALIACAO_INICIALFL_PUERPERA: TIBStringField
      FieldName = 'FL_PUERPERA'
      Origin = 'AVALIACAO_INICIAL.FL_PUERPERA'
      FixedChar = True
      Size = 1
    end
    object TB_AVALIACAO_INICIALTX_ESQUEMA_EM_USO: TIBStringField
      FieldName = 'TX_ESQUEMA_EM_USO'
      Origin = 'AVALIACAO_INICIAL.TX_ESQUEMA_EM_USO'
      Size = 50
    end
    object TB_AVALIACAO_INICIALDT_INICIO_ARV: TDateField
      FieldName = 'DT_INICIO_ARV'
      Origin = 'AVALIACAO_INICIAL.DT_INICIO_ARV'
    end
    object TB_AVALIACAO_INICIALDT_PARTO: TDateField
      FieldName = 'DT_PARTO'
      Origin = 'AVALIACAO_INICIAL.DT_PARTO'
    end
    object TB_AVALIACAO_INICIALFL_PROFILAXIA: TIBStringField
      FieldName = 'FL_PROFILAXIA'
      Origin = 'AVALIACAO_INICIAL.FL_PROFILAXIA'
      FixedChar = True
      Size = 1
    end
    object TB_AVALIACAO_INICIALFL_TRATAMENTO_ARV: TIBStringField
      FieldName = 'FL_TRATAMENTO_ARV'
      Origin = 'AVALIACAO_INICIAL.FL_TRATAMENTO_ARV'
      FixedChar = True
      Size = 1
    end
    object TB_AVALIACAO_INICIALFL_PROFILAXIA_CONDUTA: TIBStringField
      FieldName = 'FL_PROFILAXIA_CONDUTA'
      Origin = 'AVALIACAO_INICIAL.FL_PROFILAXIA_CONDUTA'
      FixedChar = True
      Size = 1
    end
    object TB_AVALIACAO_INICIALFL_ALEITAMENTO_ARTIFICIAL: TIBStringField
      FieldName = 'FL_ALEITAMENTO_ARTIFICIAL'
      Origin = 'AVALIACAO_INICIAL.FL_ALEITAMENTO_ARTIFICIAL'
      FixedChar = True
      Size = 1
    end
    object TB_AVALIACAO_INICIALFL_ALEITAMENTO_MATERNO: TIBStringField
      FieldName = 'FL_ALEITAMENTO_MATERNO'
      Origin = 'AVALIACAO_INICIAL.FL_ALEITAMENTO_MATERNO'
      FixedChar = True
      Size = 1
    end
    object TB_AVALIACAO_INICIALFL_TRATAMENTO_ARV2: TIBStringField
      FieldName = 'FL_TRATAMENTO_ARV2'
      Origin = 'AVALIACAO_INICIAL.FL_TRATAMENTO_ARV2'
      FixedChar = True
      Size = 1
    end
    object TB_AVALIACAO_INICIALFL_SINTOMAS_GRAVES2: TIBStringField
      FieldName = 'FL_SINTOMAS_GRAVES2'
      Origin = 'AVALIACAO_INICIAL.FL_SINTOMAS_GRAVES2'
      FixedChar = True
      Size = 1
    end
    object TB_AVALIACAO_INICIALTX_SINTOMAS_GRAVES2: TIBStringField
      FieldName = 'TX_SINTOMAS_GRAVES2'
      Origin = 'AVALIACAO_INICIAL.TX_SINTOMAS_GRAVES2'
      Size = 100
    end
    object TB_AVALIACAO_INICIALDT_PUERPERA_RETORNO: TDateField
      FieldName = 'DT_PUERPERA_RETORNO'
      Origin = 'AVALIACAO_INICIAL.DT_PUERPERA_RETORNO'
    end
    object TB_AVALIACAO_INICIALFL_CRIANCA_EXPOSTA: TIBStringField
      FieldName = 'FL_CRIANCA_EXPOSTA'
      Origin = 'AVALIACAO_INICIAL.FL_CRIANCA_EXPOSTA'
      FixedChar = True
      Size = 1
    end
    object TB_AVALIACAO_INICIALDT_CRIANCA_EXPOSTA: TDateField
      FieldName = 'DT_CRIANCA_EXPOSTA'
      Origin = 'AVALIACAO_INICIAL.DT_CRIANCA_EXPOSTA'
    end
    object TB_AVALIACAO_INICIALFL_SEGUIMENTO: TIBStringField
      FieldName = 'FL_SEGUIMENTO'
      Origin = 'AVALIACAO_INICIAL.FL_SEGUIMENTO'
      FixedChar = True
      Size = 1
    end
    object TB_AVALIACAO_INICIALTX_SEGUIMENTO: TIBStringField
      FieldName = 'TX_SEGUIMENTO'
      Origin = 'AVALIACAO_INICIAL.TX_SEGUIMENTO'
      Size = 100
    end
    object TB_AVALIACAO_INICIALFL_EM_USO_PROFILAXIA: TIBStringField
      FieldName = 'FL_EM_USO_PROFILAXIA'
      Origin = 'AVALIACAO_INICIAL.FL_EM_USO_PROFILAXIA'
      FixedChar = True
      Size = 1
    end
    object TB_AVALIACAO_INICIALTX_AOTACOES_ENFERMAGEM: TIBStringField
      FieldName = 'TX_AOTACOES_ENFERMAGEM'
      Origin = 'AVALIACAO_INICIAL.TX_AOTACOES_ENFERMAGEM'
      Size = 300
    end
    object TB_AVALIACAO_INICIALNM_MEDICO: TIBStringField
      FieldName = 'NM_MEDICO'
      Origin = 'AVALIACAO_INICIAL.NM_MEDICO'
      Size = 100
    end
    object TB_AVALIACAO_INICIALNR_ORDEM: TIBStringField
      FieldName = 'NR_ORDEM'
      Origin = 'AVALIACAO_INICIAL.NR_ORDEM'
    end
    object TB_AVALIACAO_INICIALCD_USUARIO_CADASTRO: TIntegerField
      FieldName = 'CD_USUARIO_CADASTRO'
      Origin = 'AVALIACAO_INICIAL.CD_USUARIO_CADASTRO'
    end
    object TB_AVALIACAO_INICIALDT_CADASTRO: TDateTimeField
      FieldName = 'DT_CADASTRO'
      Origin = 'AVALIACAO_INICIAL.DT_CADASTRO'
    end
    object TB_AVALIACAO_INICIALCD_USUARIO_ALTERACAO: TIntegerField
      FieldName = 'CD_USUARIO_ALTERACAO'
      Origin = 'AVALIACAO_INICIAL.CD_USUARIO_ALTERACAO'
    end
    object TB_AVALIACAO_INICIALDT_ALTERACAO: TDateTimeField
      FieldName = 'DT_ALTERACAO'
      Origin = 'AVALIACAO_INICIAL.DT_ALTERACAO'
    end
    object TB_AVALIACAO_INICIALCD_USUARIO_EXCLUSAO: TIntegerField
      FieldName = 'CD_USUARIO_EXCLUSAO'
      Origin = 'AVALIACAO_INICIAL.CD_USUARIO_EXCLUSAO'
    end
    object TB_AVALIACAO_INICIALDT_EXCLUSAO: TDateTimeField
      FieldName = 'DT_EXCLUSAO'
      Origin = 'AVALIACAO_INICIAL.DT_EXCLUSAO'
    end
    object TB_AVALIACAO_INICIALCD_ARQUIVO: TIntegerField
      FieldName = 'CD_ARQUIVO'
      Origin = 'AVALIACAO_INICIAL.CD_ARQUIVO'
    end
    object TB_AVALIACAO_INICIALCD_GRUPO: TIntegerField
      FieldName = 'CD_GRUPO'
      Origin = 'AVALIACAO_INICIAL.CD_GRUPO'
    end
    object TB_AVALIACAO_INICIALCD_ARQUIVO2: TIntegerField
      FieldName = 'CD_ARQUIVO2'
      Origin = 'AVALIACAO_INICIAL.CD_ARQUIVO2'
    end
    object TB_AVALIACAO_INICIALTX_PRINCIPAIS_ANALISES1: TIBStringField
      FieldName = 'TX_PRINCIPAIS_ANALISES1'
      Origin = 'AVALIACAO_INICIAL.TX_PRINCIPAIS_ANALISES1'
    end
    object TB_AVALIACAO_INICIALTX_PRINCIPAIS_ANALISES2: TIBStringField
      FieldName = 'TX_PRINCIPAIS_ANALISES2'
      Origin = 'AVALIACAO_INICIAL.TX_PRINCIPAIS_ANALISES2'
    end
    object TB_AVALIACAO_INICIALTX_PRINCIPAIS_ANALISES3: TIBStringField
      FieldName = 'TX_PRINCIPAIS_ANALISES3'
      Origin = 'AVALIACAO_INICIAL.TX_PRINCIPAIS_ANALISES3'
    end
    object TB_AVALIACAO_INICIALTX_PRINCIPAIS_ANALISES4: TIBStringField
      FieldName = 'TX_PRINCIPAIS_ANALISES4'
      Origin = 'AVALIACAO_INICIAL.TX_PRINCIPAIS_ANALISES4'
    end
    object TB_AVALIACAO_INICIALTX_PRINCIPAIS_ANALISES5: TIBStringField
      FieldName = 'TX_PRINCIPAIS_ANALISES5'
      Origin = 'AVALIACAO_INICIAL.TX_PRINCIPAIS_ANALISES5'
    end
    object TB_AVALIACAO_INICIALTX_PRINCIPAIS_ANALISES6: TIBStringField
      FieldName = 'TX_PRINCIPAIS_ANALISES6'
      Origin = 'AVALIACAO_INICIAL.TX_PRINCIPAIS_ANALISES6'
    end
    object TB_AVALIACAO_INICIALTX_PRINCIPAIS_ANALISES7: TIBStringField
      FieldName = 'TX_PRINCIPAIS_ANALISES7'
      Origin = 'AVALIACAO_INICIAL.TX_PRINCIPAIS_ANALISES7'
      Size = 100
    end
    object TB_AVALIACAO_INICIALFL_ANALISES_ALTERADAS: TIBStringField
      FieldName = 'FL_ANALISES_ALTERADAS'
      Origin = 'AVALIACAO_INICIAL.FL_ANALISES_ALTERADAS'
      FixedChar = True
      Size = 1
    end
    object TB_AVALIACAO_INICIALTX_ANALISES_ALTERADAS: TIBStringField
      FieldName = 'TX_ANALISES_ALTERADAS'
      Origin = 'AVALIACAO_INICIAL.TX_ANALISES_ALTERADAS'
      Size = 100
    end
    object TB_AVALIACAO_INICIALNR_PROCESSO: TIntegerField
      FieldName = 'NR_PROCESSO'
      Origin = 'PACIENTE.NR_PROCESSO'
    end
    object TB_AVALIACAO_INICIALNM_PACIENTE: TIBStringField
      FieldName = 'NM_PACIENTE'
      Origin = 'PACIENTE.NM_PACIENTE'
      Size = 50
    end
    object TB_AVALIACAO_INICIALDS_MUNICIPIO: TIBStringField
      FieldName = 'DS_MUNICIPIO'
      Size = 50
    end
    object TB_AVALIACAO_INICIALDS_PROVINCIA: TIBStringField
      FieldName = 'DS_PROVINCIA'
      Size = 50
    end
    object TB_AVALIACAO_INICIALDT_NASCIMENTO: TDateField
      FieldName = 'DT_NASCIMENTO'
      Origin = 'PACIENTE.DT_NASCIMENTO'
    end
    object TB_AVALIACAO_INICIALIDADE: TSmallintField
      FieldName = 'IDADE'
      Origin = 'PACIENTE.IDADE'
    end
    object TB_AVALIACAO_INICIALTP_SEXO: TIBStringField
      FieldName = 'TP_SEXO'
      Origin = 'PACIENTE.TP_SEXO'
      FixedChar = True
      Size = 1
    end
    object TB_AVALIACAO_INICIALNM_MAE: TIBStringField
      FieldName = 'NM_MAE'
      Origin = 'PACIENTE.NM_MAE'
      Size = 50
    end
  end
  object TB_SEGUIMENTO_ENFERMAGEM: TIBDataSet
    Database = DM.DB
    Transaction = DM.TS
    AfterInsert = TB_SEGUIMENTO_ENFERMAGEMAfterInsert
    BeforeDelete = TB_SEGUIMENTO_ENFERMAGEMBeforeDelete
    BeforePost = TB_SEGUIMENTO_ENFERMAGEMBeforePost
    BufferChunks = 1000
    CachedUpdates = False
    DeleteSQL.Strings = (
      'delete from "SEGUIMENTO_ENFERMAGEM"'
      'where'
      '  "CD_SEGUIMENTO_ENFERMAGEM" = :"OLD_CD_SEGUIMENTO_ENFERMAGEM"')
    InsertSQL.Strings = (
      'insert into "SEGUIMENTO_ENFERMAGEM"'
      '('
      '  "CD_SEGUIMENTO_ENFERMAGEM"'
      ', "CD_PACIENTE"'
      ', "DT_DIAGNOSTICO"'
      ', "FL_DATA_INICIO"'
      ', "DT_DATA_INICIO"'
      ', "FL_INICIO"'
      ', "TX_ESQUEMA"'
      ', "TX_SINAIS_VITAIS1"'
      ', "TX_SINAIS_VITAIS2"'
      ', "FL_PERDA"'
      ', "TX_SINAIS_VITAIS3"'
      ', "TX_SINAIS_VITAIS4"'
      ', "TX_SINAIS_VITAIS5"'
      ', "TX_SINAIS_VITAIS6"'
      ', "TX_SINAIS_VITAIS7"'
      ', "FL_COMP_ULTIMA_CONSULTA"'
      ', "TX_COMP_ULTIMA_CONSULTA"'
      ', "FL_ANAL_ULTIMA_CONSULTA"'
      ', "TX_ANAL_ULTIMA_CONSULTA"'
      ', "FL_USO_COTRIMOXAZOL"'
      ', "FL_SINAIS_PALUDISMO"'
      ', "FL_SINAIS_TUBERCULOSE"'
      ', "FL_DIAG_PALUDISMO"'
      ', "FL_DIAG_TUBERCULOSE"'
      ', "FL_TRAT_TUBERCULOSE"'
      ', "TX_TRAT_TUBERCULOSE"'
      ', "TX_OUTRAS_QUEIXAS"'
      ', "TX_PRINCIPAIS_ANALISES1"'
      ', "DT_PRINCIPAIS_ANALISES1"'
      ', "TX_PRINCIPAIS_ANALISES2"'
      ', "DT_PRINCIPAIS_ANALISES2"'
      ', "TX_PRINCIPAIS_ANALISES3"'
      ', "DT_PRINCIPAIS_ANALISES3"'
      ', "TX_PRINCIPAIS_ANALISES4"'
      ', "DT_PRINCIPAIS_ANALISES4"'
      ', "TX_PRINCIPAIS_ANALISES5"'
      ', "DT_PRINCIPAIS_ANALISES5"'
      ', "TX_PRINCIPAIS_ANALISES6"'
      ', "DT_PRINCIPAIS_ANALISES6"'
      ', "TX_PRINCIPAIS_ANALISES7"'
      ', "TX_PRINCIPAIS_ANALISES8"'
      ', "TX_PRINCIPAIS_ANALISES9"'
      ', "TX_PRINCIPAIS_ANALISES10"'
      ', "TX_PRINCIPAIS_ANALISES11"'
      ', "FL_SEM_SINAIS_SINTOMAS"'
      ', "FL_COM_SINAIS_SINTOMAS"'
      ', "FL_INICIAR_TARV1"'
      ', "FL_INICIAR_TARV2"'
      ', "FL_INICIAR_PROFILAXIA1"'
      ', "FL_INICIAR_PROFILAXIA2"'
      ', "FL_TRAT_ARV_A1"'
      ', "FL_TRAT_ARV_A2"'
      ', "FL_TRAT_ARV_B1"'
      ', "TX_TRAT_ARV_B1_REACAO"'
      ', "TX_TRAT_ARV_B1_CONDUTA"'
      ', "FL_TRAT_ARV_B2"'
      ', "FL_TRAT_ARV_B3"'
      ', "FL_TRAT_ARV_B4"'
      ', "FL_TRAT_ARV_B5"'
      ', "FL_TRAT_ARV_B6"'
      ', "FL_TRAT_ARV_C1"'
      ', "FL_TRAT_ARV_C2"'
      ', "FL_TRAT_ARV_C3"'
      ', "FL_TRAT_ARV_C4"'
      ', "FL_TRAT_ARV_C5"'
      ', "FL_TRAT_ARV_C6"'
      ', "FL_ARV"'
      ', "TX_ARV"'
      ', "FL_FRASCOS_ARV"'
      ', "TX_QUANTOS_TOMA"'
      ', "FL_SENTE_ALGO_DIFERENTE"'
      ', "TX_SENTE_ALGO_DIFERENTE"'
      ', "FL_ALIMENTACAO"'
      ', "FL_ELIMINACAO"'
      ', "TX_ELIMINACAO"'
      ', "FL_ACTIVIDADE"'
      ', "TX_ACTIVIDADE"'
      ', "FL_PELE"'
      ', "TX_PELE"'
      ', "FL_DUVIDAS"'
      ', "TX_DIVIDAS"'
      ', "NM_MEDICO"'
      ', "NR_ORDEM"'
      ', "CD_USUARIO_CADASTRO"'
      ', "DT_CADASTRO"'
      ', "CD_USUARIO_ALTERACAO"'
      ', "DT_ALTERACAO"'
      ', "CD_USUARIO_EXCLUSAO"'
      ', "DT_EXCLUSAO"'
      ', "CD_ARQUIVO"'
      ', "CD_GRUPO"'
      ', "CD_ARQUIVO2"'
      ')'
      'values'
      '('
      '  :"CD_SEGUIMENTO_ENFERMAGEM"'
      ', :"CD_PACIENTE"'
      ', :"DT_DIAGNOSTICO"'
      ', :"FL_DATA_INICIO"'
      ', :"DT_DATA_INICIO"'
      ', :"FL_INICIO"'
      ', :"TX_ESQUEMA"'
      ', :"TX_SINAIS_VITAIS1"'
      ', :"TX_SINAIS_VITAIS2"'
      ', :"FL_PERDA"'
      ', :"TX_SINAIS_VITAIS3"'
      ', :"TX_SINAIS_VITAIS4"'
      ', :"TX_SINAIS_VITAIS5"'
      ', :"TX_SINAIS_VITAIS6"'
      ', :"TX_SINAIS_VITAIS7"'
      ', :"FL_COMP_ULTIMA_CONSULTA"'
      ', :"TX_COMP_ULTIMA_CONSULTA"'
      ', :"FL_ANAL_ULTIMA_CONSULTA"'
      ', :"TX_ANAL_ULTIMA_CONSULTA"'
      ', :"FL_USO_COTRIMOXAZOL"'
      ', :"FL_SINAIS_PALUDISMO"'
      ', :"FL_SINAIS_TUBERCULOSE"'
      ', :"FL_DIAG_PALUDISMO"'
      ', :"FL_DIAG_TUBERCULOSE"'
      ', :"FL_TRAT_TUBERCULOSE"'
      ', :"TX_TRAT_TUBERCULOSE"'
      ', :"TX_OUTRAS_QUEIXAS"'
      ', :"TX_PRINCIPAIS_ANALISES1"'
      ', :"DT_PRINCIPAIS_ANALISES1"'
      ', :"TX_PRINCIPAIS_ANALISES2"'
      ', :"DT_PRINCIPAIS_ANALISES2"'
      ', :"TX_PRINCIPAIS_ANALISES3"'
      ', :"DT_PRINCIPAIS_ANALISES3"'
      ', :"TX_PRINCIPAIS_ANALISES4"'
      ', :"DT_PRINCIPAIS_ANALISES4"'
      ', :"TX_PRINCIPAIS_ANALISES5"'
      ', :"DT_PRINCIPAIS_ANALISES5"'
      ', :"TX_PRINCIPAIS_ANALISES6"'
      ', :"DT_PRINCIPAIS_ANALISES6"'
      ', :"TX_PRINCIPAIS_ANALISES7"'
      ', :"TX_PRINCIPAIS_ANALISES8"'
      ', :"TX_PRINCIPAIS_ANALISES9"'
      ', :"TX_PRINCIPAIS_ANALISES10"'
      ', :"TX_PRINCIPAIS_ANALISES11"'
      ', :"FL_SEM_SINAIS_SINTOMAS"'
      ', :"FL_COM_SINAIS_SINTOMAS"'
      ', :"FL_INICIAR_TARV1"'
      ', :"FL_INICIAR_TARV2"'
      ', :"FL_INICIAR_PROFILAXIA1"'
      ', :"FL_INICIAR_PROFILAXIA2"'
      ', :"FL_TRAT_ARV_A1"'
      ', :"FL_TRAT_ARV_A2"'
      ', :"FL_TRAT_ARV_B1"'
      ', :"TX_TRAT_ARV_B1_REACAO"'
      ', :"TX_TRAT_ARV_B1_CONDUTA"'
      ', :"FL_TRAT_ARV_B2"'
      ', :"FL_TRAT_ARV_B3"'
      ', :"FL_TRAT_ARV_B4"'
      ', :"FL_TRAT_ARV_B5"'
      ', :"FL_TRAT_ARV_B6"'
      ', :"FL_TRAT_ARV_C1"'
      ', :"FL_TRAT_ARV_C2"'
      ', :"FL_TRAT_ARV_C3"'
      ', :"FL_TRAT_ARV_C4"'
      ', :"FL_TRAT_ARV_C5"'
      ', :"FL_TRAT_ARV_C6"'
      ', :"FL_ARV"'
      ', :"TX_ARV"'
      ', :"FL_FRASCOS_ARV"'
      ', :"TX_QUANTOS_TOMA"'
      ', :"FL_SENTE_ALGO_DIFERENTE"'
      ', :"TX_SENTE_ALGO_DIFERENTE"'
      ', :"FL_ALIMENTACAO"'
      ', :"FL_ELIMINACAO"'
      ', :"TX_ELIMINACAO"'
      ', :"FL_ACTIVIDADE"'
      ', :"TX_ACTIVIDADE"'
      ', :"FL_PELE"'
      ', :"TX_PELE"'
      ', :"FL_DUVIDAS"'
      ', :"TX_DIVIDAS"'
      ', :"NM_MEDICO"'
      ', :"NR_ORDEM"'
      ', :"CD_USUARIO_CADASTRO"'
      ', :"DT_CADASTRO"'
      ', :"CD_USUARIO_ALTERACAO"'
      ', :"DT_ALTERACAO"'
      ', :"CD_USUARIO_EXCLUSAO"'
      ', :"DT_EXCLUSAO"'
      ', :"CD_ARQUIVO"'
      ', :"CD_GRUPO"'
      ', :"CD_ARQUIVO2"'
      ')')
    SelectSQL.Strings = (
      'select "SEGUIMENTO_ENFERMAGEM"."CD_SEGUIMENTO_ENFERMAGEM"'
      '      ,"SEGUIMENTO_ENFERMAGEM"."CD_PACIENTE"'
      '      ,"SEGUIMENTO_ENFERMAGEM"."DT_DIAGNOSTICO"'
      '      ,"SEGUIMENTO_ENFERMAGEM"."FL_DATA_INICIO"'
      '      ,"SEGUIMENTO_ENFERMAGEM"."DT_DATA_INICIO"'
      '      ,"SEGUIMENTO_ENFERMAGEM"."FL_INICIO"'
      '      ,"SEGUIMENTO_ENFERMAGEM"."TX_ESQUEMA"'
      '      ,"SEGUIMENTO_ENFERMAGEM"."TX_SINAIS_VITAIS1"'
      '      ,"SEGUIMENTO_ENFERMAGEM"."TX_SINAIS_VITAIS2"'
      '      ,"SEGUIMENTO_ENFERMAGEM"."FL_PERDA"'
      '      ,"SEGUIMENTO_ENFERMAGEM"."TX_SINAIS_VITAIS3"'
      '      ,"SEGUIMENTO_ENFERMAGEM"."TX_SINAIS_VITAIS4"'
      '      ,"SEGUIMENTO_ENFERMAGEM"."TX_SINAIS_VITAIS5"'
      '      ,"SEGUIMENTO_ENFERMAGEM"."TX_SINAIS_VITAIS6"'
      '      ,"SEGUIMENTO_ENFERMAGEM"."TX_SINAIS_VITAIS7"'
      '      ,"SEGUIMENTO_ENFERMAGEM"."FL_COMP_ULTIMA_CONSULTA"'
      '      ,"SEGUIMENTO_ENFERMAGEM"."TX_COMP_ULTIMA_CONSULTA"'
      '      ,"SEGUIMENTO_ENFERMAGEM"."FL_ANAL_ULTIMA_CONSULTA"'
      '      ,"SEGUIMENTO_ENFERMAGEM"."TX_ANAL_ULTIMA_CONSULTA"'
      '      ,"SEGUIMENTO_ENFERMAGEM"."FL_USO_COTRIMOXAZOL"'
      '      ,"SEGUIMENTO_ENFERMAGEM"."FL_SINAIS_PALUDISMO"'
      '      ,"SEGUIMENTO_ENFERMAGEM"."FL_SINAIS_TUBERCULOSE"'
      '      ,"SEGUIMENTO_ENFERMAGEM"."FL_DIAG_PALUDISMO"'
      '      ,"SEGUIMENTO_ENFERMAGEM"."FL_DIAG_TUBERCULOSE"'
      '      ,"SEGUIMENTO_ENFERMAGEM"."FL_TRAT_TUBERCULOSE"'
      '      ,"SEGUIMENTO_ENFERMAGEM"."TX_TRAT_TUBERCULOSE"'
      '      ,"SEGUIMENTO_ENFERMAGEM"."TX_OUTRAS_QUEIXAS"'
      '      ,"SEGUIMENTO_ENFERMAGEM"."TX_PRINCIPAIS_ANALISES1"'
      '      ,"SEGUIMENTO_ENFERMAGEM"."DT_PRINCIPAIS_ANALISES1"'
      '      ,"SEGUIMENTO_ENFERMAGEM"."TX_PRINCIPAIS_ANALISES2"'
      '      ,"SEGUIMENTO_ENFERMAGEM"."DT_PRINCIPAIS_ANALISES2"'
      '      ,"SEGUIMENTO_ENFERMAGEM"."TX_PRINCIPAIS_ANALISES3"'
      '      ,"SEGUIMENTO_ENFERMAGEM"."DT_PRINCIPAIS_ANALISES3"'
      '      ,"SEGUIMENTO_ENFERMAGEM"."TX_PRINCIPAIS_ANALISES4"'
      '      ,"SEGUIMENTO_ENFERMAGEM"."DT_PRINCIPAIS_ANALISES4"'
      '      ,"SEGUIMENTO_ENFERMAGEM"."TX_PRINCIPAIS_ANALISES5"'
      '      ,"SEGUIMENTO_ENFERMAGEM"."DT_PRINCIPAIS_ANALISES5"'
      '      ,"SEGUIMENTO_ENFERMAGEM"."TX_PRINCIPAIS_ANALISES6"'
      '      ,"SEGUIMENTO_ENFERMAGEM"."DT_PRINCIPAIS_ANALISES6"'
      '      ,"SEGUIMENTO_ENFERMAGEM"."TX_PRINCIPAIS_ANALISES7"'
      '      ,"SEGUIMENTO_ENFERMAGEM"."TX_PRINCIPAIS_ANALISES8"'
      '      ,"SEGUIMENTO_ENFERMAGEM"."TX_PRINCIPAIS_ANALISES9"'
      '      ,"SEGUIMENTO_ENFERMAGEM"."TX_PRINCIPAIS_ANALISES10"'
      '      ,"SEGUIMENTO_ENFERMAGEM"."TX_PRINCIPAIS_ANALISES11"'
      '      ,"SEGUIMENTO_ENFERMAGEM"."FL_SEM_SINAIS_SINTOMAS"'
      '      ,"SEGUIMENTO_ENFERMAGEM"."FL_COM_SINAIS_SINTOMAS"'
      '      ,"SEGUIMENTO_ENFERMAGEM"."FL_INICIAR_TARV1"'
      '      ,"SEGUIMENTO_ENFERMAGEM"."FL_INICIAR_TARV2"'
      '      ,"SEGUIMENTO_ENFERMAGEM"."FL_INICIAR_PROFILAXIA1"'
      '      ,"SEGUIMENTO_ENFERMAGEM"."FL_INICIAR_PROFILAXIA2"'
      '      ,"SEGUIMENTO_ENFERMAGEM"."FL_TRAT_ARV_A1"'
      '      ,"SEGUIMENTO_ENFERMAGEM"."FL_TRAT_ARV_A2"'
      '      ,"SEGUIMENTO_ENFERMAGEM"."FL_TRAT_ARV_B1"'
      '      ,"SEGUIMENTO_ENFERMAGEM"."TX_TRAT_ARV_B1_REACAO"'
      '      ,"SEGUIMENTO_ENFERMAGEM"."TX_TRAT_ARV_B1_CONDUTA"'
      '      ,"SEGUIMENTO_ENFERMAGEM"."FL_TRAT_ARV_B2"'
      '      ,"SEGUIMENTO_ENFERMAGEM"."FL_TRAT_ARV_B3"'
      '      ,"SEGUIMENTO_ENFERMAGEM"."FL_TRAT_ARV_B4"'
      '      ,"SEGUIMENTO_ENFERMAGEM"."FL_TRAT_ARV_B5"'
      '      ,"SEGUIMENTO_ENFERMAGEM"."FL_TRAT_ARV_B6"'
      '      ,"SEGUIMENTO_ENFERMAGEM"."FL_TRAT_ARV_C1"'
      '      ,"SEGUIMENTO_ENFERMAGEM"."FL_TRAT_ARV_C2"'
      '      ,"SEGUIMENTO_ENFERMAGEM"."FL_TRAT_ARV_C3"'
      '      ,"SEGUIMENTO_ENFERMAGEM"."FL_TRAT_ARV_C4"'
      '      ,"SEGUIMENTO_ENFERMAGEM"."FL_TRAT_ARV_C5"'
      '      ,"SEGUIMENTO_ENFERMAGEM"."FL_TRAT_ARV_C6"'
      '      ,"SEGUIMENTO_ENFERMAGEM"."FL_ARV"'
      '      ,"SEGUIMENTO_ENFERMAGEM"."TX_ARV"'
      '      ,"SEGUIMENTO_ENFERMAGEM"."FL_FRASCOS_ARV"'
      '      ,"SEGUIMENTO_ENFERMAGEM"."TX_QUANTOS_TOMA"'
      '      ,"SEGUIMENTO_ENFERMAGEM"."FL_SENTE_ALGO_DIFERENTE"'
      '      ,"SEGUIMENTO_ENFERMAGEM"."TX_SENTE_ALGO_DIFERENTE"'
      '      ,"SEGUIMENTO_ENFERMAGEM"."FL_ALIMENTACAO"'
      '      ,"SEGUIMENTO_ENFERMAGEM"."FL_ELIMINACAO"'
      '      ,"SEGUIMENTO_ENFERMAGEM"."TX_ELIMINACAO"'
      '      ,"SEGUIMENTO_ENFERMAGEM"."FL_ACTIVIDADE"'
      '      ,"SEGUIMENTO_ENFERMAGEM"."TX_ACTIVIDADE"'
      '      ,"SEGUIMENTO_ENFERMAGEM"."FL_PELE"'
      '      ,"SEGUIMENTO_ENFERMAGEM"."TX_PELE"'
      '      ,"SEGUIMENTO_ENFERMAGEM"."FL_DUVIDAS"'
      '      ,"SEGUIMENTO_ENFERMAGEM"."TX_DIVIDAS"'
      '      ,"SEGUIMENTO_ENFERMAGEM"."NM_MEDICO"'
      '      ,"SEGUIMENTO_ENFERMAGEM"."NR_ORDEM"'
      '      ,"SEGUIMENTO_ENFERMAGEM"."CD_USUARIO_CADASTRO"'
      '      ,"SEGUIMENTO_ENFERMAGEM"."DT_CADASTRO"'
      '      ,"SEGUIMENTO_ENFERMAGEM"."CD_USUARIO_ALTERACAO"'
      '      ,"SEGUIMENTO_ENFERMAGEM"."DT_ALTERACAO"'
      '      ,"SEGUIMENTO_ENFERMAGEM"."CD_USUARIO_EXCLUSAO"'
      '      ,"SEGUIMENTO_ENFERMAGEM"."DT_EXCLUSAO"'
      '      ,"SEGUIMENTO_ENFERMAGEM"."CD_ARQUIVO"'
      '      ,"SEGUIMENTO_ENFERMAGEM"."CD_GRUPO"'
      '      ,"SEGUIMENTO_ENFERMAGEM"."CD_ARQUIVO2"'
      '      ,PACIENTE.NR_PROCESSO'
      '      ,PACIENTE.NM_PACIENTE'
      '      ,(select DS_MUNICIPIO from MUNICIPIO '
      '        where CD_MUNICIPIO = PACIENTE.CD_MUNICIPIO) DS_MUNICIPIO'
      '      ,(select DS_PROVINCIA from PROVINCIA'
      '        where CD_PROVINCIA = PACIENTE.CD_PROVINCIA) DS_PROVINCIA'
      '      ,PACIENTE.DT_NASCIMENTO'
      '      ,PACIENTE.IDADE'
      '      ,PACIENTE.TP_SEXO'
      '      ,PACIENTE.NM_MAE'
      'from "SEGUIMENTO_ENFERMAGEM"'
      '  left outer join PACIENTE'
      
        '  on PACIENTE.CD_PACIENTE = "SEGUIMENTO_ENFERMAGEM"."CD_PACIENTE' +
        '"'
      'where "SEGUIMENTO_ENFERMAGEM"."CD_PACIENTE" = :CD_PACIENTE')
    ModifySQL.Strings = (
      'update "SEGUIMENTO_ENFERMAGEM"'
      'set'
      ' "CD_SEGUIMENTO_ENFERMAGEM" = :"CD_SEGUIMENTO_ENFERMAGEM"'
      ', "CD_PACIENTE" = :"CD_PACIENTE"'
      ', "DT_DIAGNOSTICO" = :"DT_DIAGNOSTICO"'
      ', "FL_DATA_INICIO" = :"FL_DATA_INICIO"'
      ', "DT_DATA_INICIO" = :"DT_DATA_INICIO"'
      ', "FL_INICIO" = :"FL_INICIO"'
      ', "TX_ESQUEMA" = :"TX_ESQUEMA"'
      ', "TX_SINAIS_VITAIS1" = :"TX_SINAIS_VITAIS1"'
      ', "TX_SINAIS_VITAIS2" = :"TX_SINAIS_VITAIS2"'
      ', "FL_PERDA" = :"FL_PERDA"'
      ', "TX_SINAIS_VITAIS3" = :"TX_SINAIS_VITAIS3"'
      ', "TX_SINAIS_VITAIS4" = :"TX_SINAIS_VITAIS4"'
      ', "TX_SINAIS_VITAIS5" = :"TX_SINAIS_VITAIS5"'
      ', "TX_SINAIS_VITAIS6" = :"TX_SINAIS_VITAIS6"'
      ', "TX_SINAIS_VITAIS7" = :"TX_SINAIS_VITAIS7"'
      ', "FL_COMP_ULTIMA_CONSULTA" = :"FL_COMP_ULTIMA_CONSULTA"'
      ', "TX_COMP_ULTIMA_CONSULTA" = :"TX_COMP_ULTIMA_CONSULTA"'
      ', "FL_ANAL_ULTIMA_CONSULTA" = :"FL_ANAL_ULTIMA_CONSULTA"'
      ', "TX_ANAL_ULTIMA_CONSULTA" = :"TX_ANAL_ULTIMA_CONSULTA"'
      ', "FL_USO_COTRIMOXAZOL" = :"FL_USO_COTRIMOXAZOL"'
      ', "FL_SINAIS_PALUDISMO" = :"FL_SINAIS_PALUDISMO"'
      ', "FL_SINAIS_TUBERCULOSE" = :"FL_SINAIS_TUBERCULOSE"'
      ', "FL_DIAG_PALUDISMO" = :"FL_DIAG_PALUDISMO"'
      ', "FL_DIAG_TUBERCULOSE" = :"FL_DIAG_TUBERCULOSE"'
      ', "FL_TRAT_TUBERCULOSE" = :"FL_TRAT_TUBERCULOSE"'
      ', "TX_TRAT_TUBERCULOSE" = :"TX_TRAT_TUBERCULOSE"'
      ', "TX_OUTRAS_QUEIXAS" = :"TX_OUTRAS_QUEIXAS"'
      ', "TX_PRINCIPAIS_ANALISES1" = :"TX_PRINCIPAIS_ANALISES1"'
      ', "DT_PRINCIPAIS_ANALISES1" = :"DT_PRINCIPAIS_ANALISES1"'
      ', "TX_PRINCIPAIS_ANALISES2" = :"TX_PRINCIPAIS_ANALISES2"'
      ', "DT_PRINCIPAIS_ANALISES2" = :"DT_PRINCIPAIS_ANALISES2"'
      ', "TX_PRINCIPAIS_ANALISES3" = :"TX_PRINCIPAIS_ANALISES3"'
      ', "DT_PRINCIPAIS_ANALISES3" = :"DT_PRINCIPAIS_ANALISES3"'
      ', "TX_PRINCIPAIS_ANALISES4" = :"TX_PRINCIPAIS_ANALISES4"'
      ', "DT_PRINCIPAIS_ANALISES4" = :"DT_PRINCIPAIS_ANALISES4"'
      ', "TX_PRINCIPAIS_ANALISES5" = :"TX_PRINCIPAIS_ANALISES5"'
      ', "DT_PRINCIPAIS_ANALISES5" = :"DT_PRINCIPAIS_ANALISES5"'
      ', "TX_PRINCIPAIS_ANALISES6" = :"TX_PRINCIPAIS_ANALISES6"'
      ', "DT_PRINCIPAIS_ANALISES6" = :"DT_PRINCIPAIS_ANALISES6"'
      ', "TX_PRINCIPAIS_ANALISES7" = :"TX_PRINCIPAIS_ANALISES7"'
      ', "TX_PRINCIPAIS_ANALISES8" = :"TX_PRINCIPAIS_ANALISES8"'
      ', "TX_PRINCIPAIS_ANALISES9" = :"TX_PRINCIPAIS_ANALISES9"'
      ', "TX_PRINCIPAIS_ANALISES10" = :"TX_PRINCIPAIS_ANALISES10"'
      ', "TX_PRINCIPAIS_ANALISES11" = :"TX_PRINCIPAIS_ANALISES11"'
      ', "FL_SEM_SINAIS_SINTOMAS" = :"FL_SEM_SINAIS_SINTOMAS"'
      ', "FL_COM_SINAIS_SINTOMAS" = :"FL_COM_SINAIS_SINTOMAS"'
      ', "FL_INICIAR_TARV1" = :"FL_INICIAR_TARV1"'
      ', "FL_INICIAR_TARV2" = :"FL_INICIAR_TARV2"'
      ', "FL_INICIAR_PROFILAXIA1" = :"FL_INICIAR_PROFILAXIA1"'
      ', "FL_INICIAR_PROFILAXIA2" = :"FL_INICIAR_PROFILAXIA2"'
      ', "FL_TRAT_ARV_A1" = :"FL_TRAT_ARV_A1"'
      ', "FL_TRAT_ARV_A2" = :"FL_TRAT_ARV_A2"'
      ', "FL_TRAT_ARV_B1" = :"FL_TRAT_ARV_B1"'
      ', "TX_TRAT_ARV_B1_REACAO" = :"TX_TRAT_ARV_B1_REACAO"'
      ', "TX_TRAT_ARV_B1_CONDUTA" = :"TX_TRAT_ARV_B1_CONDUTA"'
      ', "FL_TRAT_ARV_B2" = :"FL_TRAT_ARV_B2"'
      ', "FL_TRAT_ARV_B3" = :"FL_TRAT_ARV_B3"'
      ', "FL_TRAT_ARV_B4" = :"FL_TRAT_ARV_B4"'
      ', "FL_TRAT_ARV_B5" = :"FL_TRAT_ARV_B5"'
      ', "FL_TRAT_ARV_B6" = :"FL_TRAT_ARV_B6"'
      ', "FL_TRAT_ARV_C1" = :"FL_TRAT_ARV_C1"'
      ', "FL_TRAT_ARV_C2" = :"FL_TRAT_ARV_C2"'
      ', "FL_TRAT_ARV_C3" = :"FL_TRAT_ARV_C3"'
      ', "FL_TRAT_ARV_C4" = :"FL_TRAT_ARV_C4"'
      ', "FL_TRAT_ARV_C5" = :"FL_TRAT_ARV_C5"'
      ', "FL_TRAT_ARV_C6" = :"FL_TRAT_ARV_C6"'
      ', "FL_ARV" = :"FL_ARV"'
      ', "TX_ARV" = :"TX_ARV"'
      ', "FL_FRASCOS_ARV" = :"FL_FRASCOS_ARV"'
      ', "TX_QUANTOS_TOMA" = :"TX_QUANTOS_TOMA"'
      ', "FL_SENTE_ALGO_DIFERENTE" = :"FL_SENTE_ALGO_DIFERENTE"'
      ', "TX_SENTE_ALGO_DIFERENTE" = :"TX_SENTE_ALGO_DIFERENTE"'
      ', "FL_ALIMENTACAO" = :"FL_ALIMENTACAO"'
      ', "FL_ELIMINACAO" = :"FL_ELIMINACAO"'
      ', "TX_ELIMINACAO" = :"TX_ELIMINACAO"'
      ', "FL_ACTIVIDADE" = :"FL_ACTIVIDADE"'
      ', "TX_ACTIVIDADE" = :"TX_ACTIVIDADE"'
      ', "FL_PELE" = :"FL_PELE"'
      ', "TX_PELE" = :"TX_PELE"'
      ', "FL_DUVIDAS" = :"FL_DUVIDAS"'
      ', "TX_DIVIDAS" = :"TX_DIVIDAS"'
      ', "NM_MEDICO" = :"NM_MEDICO"'
      ', "NR_ORDEM" = :"NR_ORDEM"'
      ', "CD_USUARIO_CADASTRO" = :"CD_USUARIO_CADASTRO"'
      ', "DT_CADASTRO" = :"DT_CADASTRO"'
      ', "CD_USUARIO_ALTERACAO" = :"CD_USUARIO_ALTERACAO"'
      ', "DT_ALTERACAO" = :"DT_ALTERACAO"'
      ', "CD_USUARIO_EXCLUSAO" = :"CD_USUARIO_EXCLUSAO"'
      ', "DT_EXCLUSAO" = :"DT_EXCLUSAO"'
      ', "CD_ARQUIVO" = :"CD_ARQUIVO"'
      ', "CD_GRUPO" = :"CD_GRUPO"'
      ', "CD_ARQUIVO2" = :"CD_ARQUIVO2"'
      'where'
      '  "CD_SEGUIMENTO_ENFERMAGEM" = :"OLD_CD_SEGUIMENTO_ENFERMAGEM"')
    GeneratorField.Field = 'CD_SEGUIMENTO_ENFERMAGEM'
    GeneratorField.Generator = 'GEN_SEGUIMENTO_ENFERMAGEM'
    Left = 800
    Top = 411
    object TB_SEGUIMENTO_ENFERMAGEMCD_SEGUIMENTO_ENFERMAGEM: TIntegerField
      FieldName = 'CD_SEGUIMENTO_ENFERMAGEM'
      Origin = 'SEGUIMENTO_ENFERMAGEM.CD_SEGUIMENTO_ENFERMAGEM'
      Required = True
    end
    object TB_SEGUIMENTO_ENFERMAGEMCD_PACIENTE: TIntegerField
      FieldName = 'CD_PACIENTE'
      Origin = 'SEGUIMENTO_ENFERMAGEM.CD_PACIENTE'
    end
    object TB_SEGUIMENTO_ENFERMAGEMDT_DIAGNOSTICO: TDateField
      FieldName = 'DT_DIAGNOSTICO'
      Origin = 'SEGUIMENTO_ENFERMAGEM.DT_DIAGNOSTICO'
    end
    object TB_SEGUIMENTO_ENFERMAGEMFL_DATA_INICIO: TIBStringField
      FieldName = 'FL_DATA_INICIO'
      Origin = 'SEGUIMENTO_ENFERMAGEM.FL_DATA_INICIO'
      FixedChar = True
      Size = 1
    end
    object TB_SEGUIMENTO_ENFERMAGEMDT_DATA_INICIO: TDateField
      FieldName = 'DT_DATA_INICIO'
      Origin = 'SEGUIMENTO_ENFERMAGEM.DT_DATA_INICIO'
    end
    object TB_SEGUIMENTO_ENFERMAGEMFL_INICIO: TIBStringField
      FieldName = 'FL_INICIO'
      Origin = 'SEGUIMENTO_ENFERMAGEM.FL_INICIO'
      FixedChar = True
      Size = 1
    end
    object TB_SEGUIMENTO_ENFERMAGEMTX_ESQUEMA: TIBStringField
      FieldName = 'TX_ESQUEMA'
      Origin = 'SEGUIMENTO_ENFERMAGEM.TX_ESQUEMA'
      Size = 100
    end
    object TB_SEGUIMENTO_ENFERMAGEMTX_SINAIS_VITAIS1: TIBStringField
      FieldName = 'TX_SINAIS_VITAIS1'
      Origin = 'SEGUIMENTO_ENFERMAGEM.TX_SINAIS_VITAIS1'
    end
    object TB_SEGUIMENTO_ENFERMAGEMTX_SINAIS_VITAIS2: TIBStringField
      FieldName = 'TX_SINAIS_VITAIS2'
      Origin = 'SEGUIMENTO_ENFERMAGEM.TX_SINAIS_VITAIS2'
    end
    object TB_SEGUIMENTO_ENFERMAGEMFL_PERDA: TIBStringField
      FieldName = 'FL_PERDA'
      Origin = 'SEGUIMENTO_ENFERMAGEM.FL_PERDA'
      FixedChar = True
      Size = 1
    end
    object TB_SEGUIMENTO_ENFERMAGEMTX_SINAIS_VITAIS3: TIBStringField
      FieldName = 'TX_SINAIS_VITAIS3'
      Origin = 'SEGUIMENTO_ENFERMAGEM.TX_SINAIS_VITAIS3'
    end
    object TB_SEGUIMENTO_ENFERMAGEMTX_SINAIS_VITAIS4: TIBStringField
      FieldName = 'TX_SINAIS_VITAIS4'
      Origin = 'SEGUIMENTO_ENFERMAGEM.TX_SINAIS_VITAIS4'
    end
    object TB_SEGUIMENTO_ENFERMAGEMTX_SINAIS_VITAIS5: TIBStringField
      FieldName = 'TX_SINAIS_VITAIS5'
      Origin = 'SEGUIMENTO_ENFERMAGEM.TX_SINAIS_VITAIS5'
    end
    object TB_SEGUIMENTO_ENFERMAGEMTX_SINAIS_VITAIS6: TIBStringField
      FieldName = 'TX_SINAIS_VITAIS6'
      Origin = 'SEGUIMENTO_ENFERMAGEM.TX_SINAIS_VITAIS6'
    end
    object TB_SEGUIMENTO_ENFERMAGEMTX_SINAIS_VITAIS7: TIBStringField
      FieldName = 'TX_SINAIS_VITAIS7'
      Origin = 'SEGUIMENTO_ENFERMAGEM.TX_SINAIS_VITAIS7'
    end
    object TB_SEGUIMENTO_ENFERMAGEMFL_COMP_ULTIMA_CONSULTA: TIBStringField
      FieldName = 'FL_COMP_ULTIMA_CONSULTA'
      Origin = 'SEGUIMENTO_ENFERMAGEM.FL_COMP_ULTIMA_CONSULTA'
      FixedChar = True
      Size = 1
    end
    object TB_SEGUIMENTO_ENFERMAGEMTX_COMP_ULTIMA_CONSULTA: TIBStringField
      FieldName = 'TX_COMP_ULTIMA_CONSULTA'
      Origin = 'SEGUIMENTO_ENFERMAGEM.TX_COMP_ULTIMA_CONSULTA'
      Size = 50
    end
    object TB_SEGUIMENTO_ENFERMAGEMFL_ANAL_ULTIMA_CONSULTA: TIBStringField
      FieldName = 'FL_ANAL_ULTIMA_CONSULTA'
      Origin = 'SEGUIMENTO_ENFERMAGEM.FL_ANAL_ULTIMA_CONSULTA'
      FixedChar = True
      Size = 1
    end
    object TB_SEGUIMENTO_ENFERMAGEMTX_ANAL_ULTIMA_CONSULTA: TIBStringField
      FieldName = 'TX_ANAL_ULTIMA_CONSULTA'
      Origin = 'SEGUIMENTO_ENFERMAGEM.TX_ANAL_ULTIMA_CONSULTA'
      Size = 50
    end
    object TB_SEGUIMENTO_ENFERMAGEMFL_USO_COTRIMOXAZOL: TIBStringField
      FieldName = 'FL_USO_COTRIMOXAZOL'
      Origin = 'SEGUIMENTO_ENFERMAGEM.FL_USO_COTRIMOXAZOL'
      FixedChar = True
      Size = 1
    end
    object TB_SEGUIMENTO_ENFERMAGEMFL_SINAIS_PALUDISMO: TIBStringField
      FieldName = 'FL_SINAIS_PALUDISMO'
      Origin = 'SEGUIMENTO_ENFERMAGEM.FL_SINAIS_PALUDISMO'
      FixedChar = True
      Size = 1
    end
    object TB_SEGUIMENTO_ENFERMAGEMFL_SINAIS_TUBERCULOSE: TIBStringField
      FieldName = 'FL_SINAIS_TUBERCULOSE'
      Origin = 'SEGUIMENTO_ENFERMAGEM.FL_SINAIS_TUBERCULOSE'
      FixedChar = True
      Size = 1
    end
    object TB_SEGUIMENTO_ENFERMAGEMFL_DIAG_PALUDISMO: TIBStringField
      FieldName = 'FL_DIAG_PALUDISMO'
      Origin = 'SEGUIMENTO_ENFERMAGEM.FL_DIAG_PALUDISMO'
      FixedChar = True
      Size = 1
    end
    object TB_SEGUIMENTO_ENFERMAGEMFL_DIAG_TUBERCULOSE: TIBStringField
      FieldName = 'FL_DIAG_TUBERCULOSE'
      Origin = 'SEGUIMENTO_ENFERMAGEM.FL_DIAG_TUBERCULOSE'
      FixedChar = True
      Size = 1
    end
    object TB_SEGUIMENTO_ENFERMAGEMFL_TRAT_TUBERCULOSE: TIBStringField
      FieldName = 'FL_TRAT_TUBERCULOSE'
      Origin = 'SEGUIMENTO_ENFERMAGEM.FL_TRAT_TUBERCULOSE'
      FixedChar = True
      Size = 1
    end
    object TB_SEGUIMENTO_ENFERMAGEMTX_TRAT_TUBERCULOSE: TIBStringField
      FieldName = 'TX_TRAT_TUBERCULOSE'
      Origin = 'SEGUIMENTO_ENFERMAGEM.TX_TRAT_TUBERCULOSE'
      Size = 100
    end
    object TB_SEGUIMENTO_ENFERMAGEMTX_OUTRAS_QUEIXAS: TIBStringField
      FieldName = 'TX_OUTRAS_QUEIXAS'
      Origin = 'SEGUIMENTO_ENFERMAGEM.TX_OUTRAS_QUEIXAS'
      Size = 500
    end
    object TB_SEGUIMENTO_ENFERMAGEMTX_PRINCIPAIS_ANALISES1: TIBStringField
      FieldName = 'TX_PRINCIPAIS_ANALISES1'
      Origin = 'SEGUIMENTO_ENFERMAGEM.TX_PRINCIPAIS_ANALISES1'
    end
    object TB_SEGUIMENTO_ENFERMAGEMDT_PRINCIPAIS_ANALISES1: TDateField
      FieldName = 'DT_PRINCIPAIS_ANALISES1'
      Origin = 'SEGUIMENTO_ENFERMAGEM.DT_PRINCIPAIS_ANALISES1'
    end
    object TB_SEGUIMENTO_ENFERMAGEMTX_PRINCIPAIS_ANALISES2: TIBStringField
      FieldName = 'TX_PRINCIPAIS_ANALISES2'
      Origin = 'SEGUIMENTO_ENFERMAGEM.TX_PRINCIPAIS_ANALISES2'
    end
    object TB_SEGUIMENTO_ENFERMAGEMDT_PRINCIPAIS_ANALISES2: TDateField
      FieldName = 'DT_PRINCIPAIS_ANALISES2'
      Origin = 'SEGUIMENTO_ENFERMAGEM.DT_PRINCIPAIS_ANALISES2'
    end
    object TB_SEGUIMENTO_ENFERMAGEMTX_PRINCIPAIS_ANALISES3: TIBStringField
      FieldName = 'TX_PRINCIPAIS_ANALISES3'
      Origin = 'SEGUIMENTO_ENFERMAGEM.TX_PRINCIPAIS_ANALISES3'
    end
    object TB_SEGUIMENTO_ENFERMAGEMDT_PRINCIPAIS_ANALISES3: TDateField
      FieldName = 'DT_PRINCIPAIS_ANALISES3'
      Origin = 'SEGUIMENTO_ENFERMAGEM.DT_PRINCIPAIS_ANALISES3'
    end
    object TB_SEGUIMENTO_ENFERMAGEMTX_PRINCIPAIS_ANALISES4: TIBStringField
      FieldName = 'TX_PRINCIPAIS_ANALISES4'
      Origin = 'SEGUIMENTO_ENFERMAGEM.TX_PRINCIPAIS_ANALISES4'
    end
    object TB_SEGUIMENTO_ENFERMAGEMDT_PRINCIPAIS_ANALISES4: TDateField
      FieldName = 'DT_PRINCIPAIS_ANALISES4'
      Origin = 'SEGUIMENTO_ENFERMAGEM.DT_PRINCIPAIS_ANALISES4'
    end
    object TB_SEGUIMENTO_ENFERMAGEMTX_PRINCIPAIS_ANALISES5: TIBStringField
      FieldName = 'TX_PRINCIPAIS_ANALISES5'
      Origin = 'SEGUIMENTO_ENFERMAGEM.TX_PRINCIPAIS_ANALISES5'
    end
    object TB_SEGUIMENTO_ENFERMAGEMDT_PRINCIPAIS_ANALISES5: TDateField
      FieldName = 'DT_PRINCIPAIS_ANALISES5'
      Origin = 'SEGUIMENTO_ENFERMAGEM.DT_PRINCIPAIS_ANALISES5'
    end
    object TB_SEGUIMENTO_ENFERMAGEMTX_PRINCIPAIS_ANALISES6: TIBStringField
      FieldName = 'TX_PRINCIPAIS_ANALISES6'
      Origin = 'SEGUIMENTO_ENFERMAGEM.TX_PRINCIPAIS_ANALISES6'
    end
    object TB_SEGUIMENTO_ENFERMAGEMDT_PRINCIPAIS_ANALISES6: TDateField
      FieldName = 'DT_PRINCIPAIS_ANALISES6'
      Origin = 'SEGUIMENTO_ENFERMAGEM.DT_PRINCIPAIS_ANALISES6'
    end
    object TB_SEGUIMENTO_ENFERMAGEMTX_PRINCIPAIS_ANALISES7: TIBStringField
      FieldName = 'TX_PRINCIPAIS_ANALISES7'
      Origin = 'SEGUIMENTO_ENFERMAGEM.TX_PRINCIPAIS_ANALISES7'
    end
    object TB_SEGUIMENTO_ENFERMAGEMTX_PRINCIPAIS_ANALISES8: TIBStringField
      FieldName = 'TX_PRINCIPAIS_ANALISES8'
      Origin = 'SEGUIMENTO_ENFERMAGEM.TX_PRINCIPAIS_ANALISES8'
    end
    object TB_SEGUIMENTO_ENFERMAGEMTX_PRINCIPAIS_ANALISES9: TIBStringField
      FieldName = 'TX_PRINCIPAIS_ANALISES9'
      Origin = 'SEGUIMENTO_ENFERMAGEM.TX_PRINCIPAIS_ANALISES9'
    end
    object TB_SEGUIMENTO_ENFERMAGEMTX_PRINCIPAIS_ANALISES10: TIBStringField
      FieldName = 'TX_PRINCIPAIS_ANALISES10'
      Origin = 'SEGUIMENTO_ENFERMAGEM.TX_PRINCIPAIS_ANALISES10'
    end
    object TB_SEGUIMENTO_ENFERMAGEMTX_PRINCIPAIS_ANALISES11: TIBStringField
      FieldName = 'TX_PRINCIPAIS_ANALISES11'
      Origin = 'SEGUIMENTO_ENFERMAGEM.TX_PRINCIPAIS_ANALISES11'
    end
    object TB_SEGUIMENTO_ENFERMAGEMFL_SEM_SINAIS_SINTOMAS: TIBStringField
      FieldName = 'FL_SEM_SINAIS_SINTOMAS'
      Origin = 'SEGUIMENTO_ENFERMAGEM.FL_SEM_SINAIS_SINTOMAS'
      FixedChar = True
      Size = 1
    end
    object TB_SEGUIMENTO_ENFERMAGEMFL_COM_SINAIS_SINTOMAS: TIBStringField
      FieldName = 'FL_COM_SINAIS_SINTOMAS'
      Origin = 'SEGUIMENTO_ENFERMAGEM.FL_COM_SINAIS_SINTOMAS'
      FixedChar = True
      Size = 1
    end
    object TB_SEGUIMENTO_ENFERMAGEMFL_INICIAR_TARV1: TIBStringField
      FieldName = 'FL_INICIAR_TARV1'
      Origin = 'SEGUIMENTO_ENFERMAGEM.FL_INICIAR_TARV1'
      FixedChar = True
      Size = 1
    end
    object TB_SEGUIMENTO_ENFERMAGEMFL_INICIAR_TARV2: TIBStringField
      FieldName = 'FL_INICIAR_TARV2'
      Origin = 'SEGUIMENTO_ENFERMAGEM.FL_INICIAR_TARV2'
      FixedChar = True
      Size = 1
    end
    object TB_SEGUIMENTO_ENFERMAGEMFL_INICIAR_PROFILAXIA1: TIBStringField
      FieldName = 'FL_INICIAR_PROFILAXIA1'
      Origin = 'SEGUIMENTO_ENFERMAGEM.FL_INICIAR_PROFILAXIA1'
      FixedChar = True
      Size = 1
    end
    object TB_SEGUIMENTO_ENFERMAGEMFL_INICIAR_PROFILAXIA2: TIBStringField
      FieldName = 'FL_INICIAR_PROFILAXIA2'
      Origin = 'SEGUIMENTO_ENFERMAGEM.FL_INICIAR_PROFILAXIA2'
      FixedChar = True
      Size = 1
    end
    object TB_SEGUIMENTO_ENFERMAGEMFL_TRAT_ARV_A1: TIBStringField
      FieldName = 'FL_TRAT_ARV_A1'
      Origin = 'SEGUIMENTO_ENFERMAGEM.FL_TRAT_ARV_A1'
      FixedChar = True
      Size = 1
    end
    object TB_SEGUIMENTO_ENFERMAGEMFL_TRAT_ARV_A2: TIBStringField
      FieldName = 'FL_TRAT_ARV_A2'
      Origin = 'SEGUIMENTO_ENFERMAGEM.FL_TRAT_ARV_A2'
      FixedChar = True
      Size = 1
    end
    object TB_SEGUIMENTO_ENFERMAGEMFL_TRAT_ARV_B1: TIBStringField
      FieldName = 'FL_TRAT_ARV_B1'
      Origin = 'SEGUIMENTO_ENFERMAGEM.FL_TRAT_ARV_B1'
      FixedChar = True
      Size = 1
    end
    object TB_SEGUIMENTO_ENFERMAGEMTX_TRAT_ARV_B1_REACAO: TIBStringField
      FieldName = 'TX_TRAT_ARV_B1_REACAO'
      Origin = 'SEGUIMENTO_ENFERMAGEM.TX_TRAT_ARV_B1_REACAO'
      Size = 200
    end
    object TB_SEGUIMENTO_ENFERMAGEMTX_TRAT_ARV_B1_CONDUTA: TIBStringField
      FieldName = 'TX_TRAT_ARV_B1_CONDUTA'
      Origin = 'SEGUIMENTO_ENFERMAGEM.TX_TRAT_ARV_B1_CONDUTA'
      Size = 200
    end
    object TB_SEGUIMENTO_ENFERMAGEMFL_TRAT_ARV_B2: TIBStringField
      FieldName = 'FL_TRAT_ARV_B2'
      Origin = 'SEGUIMENTO_ENFERMAGEM.FL_TRAT_ARV_B2'
      FixedChar = True
      Size = 1
    end
    object TB_SEGUIMENTO_ENFERMAGEMFL_TRAT_ARV_B3: TIBStringField
      FieldName = 'FL_TRAT_ARV_B3'
      Origin = 'SEGUIMENTO_ENFERMAGEM.FL_TRAT_ARV_B3'
      FixedChar = True
      Size = 1
    end
    object TB_SEGUIMENTO_ENFERMAGEMFL_TRAT_ARV_B4: TIBStringField
      FieldName = 'FL_TRAT_ARV_B4'
      Origin = 'SEGUIMENTO_ENFERMAGEM.FL_TRAT_ARV_B4'
      FixedChar = True
      Size = 1
    end
    object TB_SEGUIMENTO_ENFERMAGEMFL_TRAT_ARV_B5: TIBStringField
      FieldName = 'FL_TRAT_ARV_B5'
      Origin = 'SEGUIMENTO_ENFERMAGEM.FL_TRAT_ARV_B5'
      FixedChar = True
      Size = 1
    end
    object TB_SEGUIMENTO_ENFERMAGEMFL_TRAT_ARV_B6: TIBStringField
      FieldName = 'FL_TRAT_ARV_B6'
      Origin = 'SEGUIMENTO_ENFERMAGEM.FL_TRAT_ARV_B6'
      FixedChar = True
      Size = 1
    end
    object TB_SEGUIMENTO_ENFERMAGEMFL_TRAT_ARV_C1: TIBStringField
      FieldName = 'FL_TRAT_ARV_C1'
      Origin = 'SEGUIMENTO_ENFERMAGEM.FL_TRAT_ARV_C1'
      FixedChar = True
      Size = 1
    end
    object TB_SEGUIMENTO_ENFERMAGEMFL_TRAT_ARV_C2: TIBStringField
      FieldName = 'FL_TRAT_ARV_C2'
      Origin = 'SEGUIMENTO_ENFERMAGEM.FL_TRAT_ARV_C2'
      FixedChar = True
      Size = 1
    end
    object TB_SEGUIMENTO_ENFERMAGEMFL_TRAT_ARV_C3: TIBStringField
      FieldName = 'FL_TRAT_ARV_C3'
      Origin = 'SEGUIMENTO_ENFERMAGEM.FL_TRAT_ARV_C3'
      FixedChar = True
      Size = 1
    end
    object TB_SEGUIMENTO_ENFERMAGEMFL_TRAT_ARV_C4: TIBStringField
      FieldName = 'FL_TRAT_ARV_C4'
      Origin = 'SEGUIMENTO_ENFERMAGEM.FL_TRAT_ARV_C4'
      FixedChar = True
      Size = 1
    end
    object TB_SEGUIMENTO_ENFERMAGEMFL_TRAT_ARV_C5: TIBStringField
      FieldName = 'FL_TRAT_ARV_C5'
      Origin = 'SEGUIMENTO_ENFERMAGEM.FL_TRAT_ARV_C5'
      FixedChar = True
      Size = 1
    end
    object TB_SEGUIMENTO_ENFERMAGEMFL_TRAT_ARV_C6: TIBStringField
      FieldName = 'FL_TRAT_ARV_C6'
      Origin = 'SEGUIMENTO_ENFERMAGEM.FL_TRAT_ARV_C6'
      FixedChar = True
      Size = 1
    end
    object TB_SEGUIMENTO_ENFERMAGEMFL_ARV: TIBStringField
      FieldName = 'FL_ARV'
      Origin = 'SEGUIMENTO_ENFERMAGEM.FL_ARV'
      FixedChar = True
      Size = 1
    end
    object TB_SEGUIMENTO_ENFERMAGEMTX_ARV: TIBStringField
      FieldName = 'TX_ARV'
      Origin = 'SEGUIMENTO_ENFERMAGEM.TX_ARV'
      Size = 200
    end
    object TB_SEGUIMENTO_ENFERMAGEMFL_FRASCOS_ARV: TIBStringField
      FieldName = 'FL_FRASCOS_ARV'
      Origin = 'SEGUIMENTO_ENFERMAGEM.FL_FRASCOS_ARV'
      FixedChar = True
      Size = 1
    end
    object TB_SEGUIMENTO_ENFERMAGEMTX_QUANTOS_TOMA: TIBStringField
      FieldName = 'TX_QUANTOS_TOMA'
      Origin = 'SEGUIMENTO_ENFERMAGEM.TX_QUANTOS_TOMA'
      Size = 200
    end
    object TB_SEGUIMENTO_ENFERMAGEMFL_SENTE_ALGO_DIFERENTE: TIBStringField
      FieldName = 'FL_SENTE_ALGO_DIFERENTE'
      Origin = 'SEGUIMENTO_ENFERMAGEM.FL_SENTE_ALGO_DIFERENTE'
      FixedChar = True
      Size = 1
    end
    object TB_SEGUIMENTO_ENFERMAGEMTX_SENTE_ALGO_DIFERENTE: TIBStringField
      FieldName = 'TX_SENTE_ALGO_DIFERENTE'
      Origin = 'SEGUIMENTO_ENFERMAGEM.TX_SENTE_ALGO_DIFERENTE'
      Size = 200
    end
    object TB_SEGUIMENTO_ENFERMAGEMFL_ALIMENTACAO: TIBStringField
      FieldName = 'FL_ALIMENTACAO'
      Origin = 'SEGUIMENTO_ENFERMAGEM.FL_ALIMENTACAO'
      FixedChar = True
      Size = 1
    end
    object TB_SEGUIMENTO_ENFERMAGEMFL_ELIMINACAO: TIBStringField
      FieldName = 'FL_ELIMINACAO'
      Origin = 'SEGUIMENTO_ENFERMAGEM.FL_ELIMINACAO'
      FixedChar = True
      Size = 1
    end
    object TB_SEGUIMENTO_ENFERMAGEMTX_ELIMINACAO: TIBStringField
      FieldName = 'TX_ELIMINACAO'
      Origin = 'SEGUIMENTO_ENFERMAGEM.TX_ELIMINACAO'
      Size = 100
    end
    object TB_SEGUIMENTO_ENFERMAGEMFL_ACTIVIDADE: TIBStringField
      FieldName = 'FL_ACTIVIDADE'
      Origin = 'SEGUIMENTO_ENFERMAGEM.FL_ACTIVIDADE'
      FixedChar = True
      Size = 1
    end
    object TB_SEGUIMENTO_ENFERMAGEMTX_ACTIVIDADE: TIBStringField
      FieldName = 'TX_ACTIVIDADE'
      Origin = 'SEGUIMENTO_ENFERMAGEM.TX_ACTIVIDADE'
      Size = 100
    end
    object TB_SEGUIMENTO_ENFERMAGEMFL_PELE: TIBStringField
      FieldName = 'FL_PELE'
      Origin = 'SEGUIMENTO_ENFERMAGEM.FL_PELE'
      FixedChar = True
      Size = 1
    end
    object TB_SEGUIMENTO_ENFERMAGEMTX_PELE: TIBStringField
      FieldName = 'TX_PELE'
      Origin = 'SEGUIMENTO_ENFERMAGEM.TX_PELE'
      Size = 100
    end
    object TB_SEGUIMENTO_ENFERMAGEMFL_DUVIDAS: TIBStringField
      FieldName = 'FL_DUVIDAS'
      Origin = 'SEGUIMENTO_ENFERMAGEM.FL_DUVIDAS'
      FixedChar = True
      Size = 1
    end
    object TB_SEGUIMENTO_ENFERMAGEMTX_DIVIDAS: TIBStringField
      FieldName = 'TX_DIVIDAS'
      Origin = 'SEGUIMENTO_ENFERMAGEM.TX_DIVIDAS'
      Size = 100
    end
    object TB_SEGUIMENTO_ENFERMAGEMNM_MEDICO: TIBStringField
      FieldName = 'NM_MEDICO'
      Origin = 'SEGUIMENTO_ENFERMAGEM.NM_MEDICO'
      Size = 100
    end
    object TB_SEGUIMENTO_ENFERMAGEMNR_ORDEM: TIBStringField
      FieldName = 'NR_ORDEM'
      Origin = 'SEGUIMENTO_ENFERMAGEM.NR_ORDEM'
    end
    object TB_SEGUIMENTO_ENFERMAGEMCD_USUARIO_CADASTRO: TIntegerField
      FieldName = 'CD_USUARIO_CADASTRO'
      Origin = 'SEGUIMENTO_ENFERMAGEM.CD_USUARIO_CADASTRO'
    end
    object TB_SEGUIMENTO_ENFERMAGEMDT_CADASTRO: TDateTimeField
      FieldName = 'DT_CADASTRO'
      Origin = 'SEGUIMENTO_ENFERMAGEM.DT_CADASTRO'
    end
    object TB_SEGUIMENTO_ENFERMAGEMCD_USUARIO_ALTERACAO: TIntegerField
      FieldName = 'CD_USUARIO_ALTERACAO'
      Origin = 'SEGUIMENTO_ENFERMAGEM.CD_USUARIO_ALTERACAO'
    end
    object TB_SEGUIMENTO_ENFERMAGEMDT_ALTERACAO: TDateTimeField
      FieldName = 'DT_ALTERACAO'
      Origin = 'SEGUIMENTO_ENFERMAGEM.DT_ALTERACAO'
    end
    object TB_SEGUIMENTO_ENFERMAGEMCD_USUARIO_EXCLUSAO: TIntegerField
      FieldName = 'CD_USUARIO_EXCLUSAO'
      Origin = 'SEGUIMENTO_ENFERMAGEM.CD_USUARIO_EXCLUSAO'
    end
    object TB_SEGUIMENTO_ENFERMAGEMDT_EXCLUSAO: TDateTimeField
      FieldName = 'DT_EXCLUSAO'
      Origin = 'SEGUIMENTO_ENFERMAGEM.DT_EXCLUSAO'
    end
    object TB_SEGUIMENTO_ENFERMAGEMCD_ARQUIVO: TIntegerField
      FieldName = 'CD_ARQUIVO'
      Origin = 'SEGUIMENTO_ENFERMAGEM.CD_ARQUIVO'
    end
    object TB_SEGUIMENTO_ENFERMAGEMCD_GRUPO: TIntegerField
      FieldName = 'CD_GRUPO'
      Origin = 'SEGUIMENTO_ENFERMAGEM.CD_GRUPO'
    end
    object TB_SEGUIMENTO_ENFERMAGEMCD_ARQUIVO2: TIntegerField
      FieldName = 'CD_ARQUIVO2'
      Origin = 'SEGUIMENTO_ENFERMAGEM.CD_ARQUIVO2'
    end
    object TB_SEGUIMENTO_ENFERMAGEMNR_PROCESSO: TIntegerField
      FieldName = 'NR_PROCESSO'
      Origin = 'PACIENTE.NR_PROCESSO'
    end
    object TB_SEGUIMENTO_ENFERMAGEMNM_PACIENTE: TIBStringField
      FieldName = 'NM_PACIENTE'
      Origin = 'PACIENTE.NM_PACIENTE'
      Size = 50
    end
    object TB_SEGUIMENTO_ENFERMAGEMDS_MUNICIPIO: TIBStringField
      FieldName = 'DS_MUNICIPIO'
      Size = 50
    end
    object TB_SEGUIMENTO_ENFERMAGEMDS_PROVINCIA: TIBStringField
      FieldName = 'DS_PROVINCIA'
      Size = 50
    end
    object TB_SEGUIMENTO_ENFERMAGEMDT_NASCIMENTO: TDateField
      FieldName = 'DT_NASCIMENTO'
      Origin = 'PACIENTE.DT_NASCIMENTO'
    end
    object TB_SEGUIMENTO_ENFERMAGEMIDADE: TSmallintField
      FieldName = 'IDADE'
      Origin = 'PACIENTE.IDADE'
    end
    object TB_SEGUIMENTO_ENFERMAGEMTP_SEXO: TIBStringField
      FieldName = 'TP_SEXO'
      Origin = 'PACIENTE.TP_SEXO'
      FixedChar = True
      Size = 1
    end
    object TB_SEGUIMENTO_ENFERMAGEMNM_MAE: TIBStringField
      FieldName = 'NM_MAE'
      Origin = 'PACIENTE.NM_MAE'
      Size = 50
    end
  end
  object TB_TRIAGEM_ENFERMAGEM: TIBDataSet
    Database = DM.DB
    Transaction = DM.TS
    AfterInsert = TB_TRIAGEM_ENFERMAGEMAfterInsert
    BeforeDelete = TB_TRIAGEM_ENFERMAGEMBeforeDelete
    BeforePost = TB_TRIAGEM_ENFERMAGEMBeforePost
    BufferChunks = 1000
    CachedUpdates = False
    DeleteSQL.Strings = (
      'delete from "TRIAGEM_ENFERMAGEM"'
      'where'
      '  "CD_TRIAGEM_ENFERMAGEM" = :"OLD_CD_TRIAGEM_ENFERMAGEM"')
    InsertSQL.Strings = (
      'insert into "TRIAGEM_ENFERMAGEM"'
      '('
      '  "CD_TRIAGEM_ENFERMAGEM"'
      ', "CD_PACIENTE"'
      ', "FL_MOTIVO"'
      ', "TX_OUTROS"'
      ', "TX_TEMPO"'
      ', "FL_USO_ARV"'
      ', "FL_GESTANTE"'
      ', "TX_SINAIS_VITAIS1"'
      ', "TX_SINAIS_VITAIS2"'
      ', "FL_PERDA"'
      ', "TX_SINAIS_VITAIS3"'
      ', "TX_SINAIS_VITAIS4"'
      ', "TX_SINAIS_VITAIS5"'
      ', "TX_SINAIS_VITAIS6"'
      ', "TX_SINAIS_VITAIS7"'
      ', "FL_SINAIS_SINTOMAS1"'
      ', "FL_SINAIS_SINTOMAS2"'
      ', "FL_SINAIS_SINTOMAS3"'
      ', "FL_SINAIS_SINTOMAS4"'
      ', "FL_SINAIS_SINTOMAS5"'
      ', "FL_SINAIS_SINTOMAS6"'
      ', "FL_SINAIS_SINTOMAS7"'
      ', "FL_SINAIS_SINTOMAS8"'
      ', "FL_SINAIS_SINTOMAS9"'
      ', "FL_SINAIS_SINTOMAS10"'
      ', "FL_SINAIS_SINTOMAS11"'
      ', "FL_SINAIS_SINTOMAS12"'
      ', "FL_SINAIS_SINTOMAS13"'
      ', "FL_SINAIS_SINTOMAS14"'
      ', "FL_SINAIS_SINTOMAS15"'
      ', "FL_SINAIS_SINTOMAS16"'
      ', "TX_ANOTACOES"'
      ', "NM_MEDICO"'
      ', "NR_ORDEM"'
      ', "CD_USUARIO_CADASTRO"'
      ', "DT_CADASTRO"'
      ', "CD_USUARIO_ALTERACAO"'
      ', "DT_ALTERACAO"'
      ', "CD_USUARIO_EXCLUSAO"'
      ', "DT_EXCLUSAO"'
      ', "CD_ARQUIVO"'
      ', "CD_GRUPO"'
      ', "CD_ARQUIVO2"'
      ', "DT_CADASTRO_2"'
      ')'
      'values'
      '('
      '  :"CD_TRIAGEM_ENFERMAGEM"'
      ', :"CD_PACIENTE"'
      ', :"FL_MOTIVO"'
      ', :"TX_OUTROS"'
      ', :"TX_TEMPO"'
      ', :"FL_USO_ARV"'
      ', :"FL_GESTANTE"'
      ', :"TX_SINAIS_VITAIS1"'
      ', :"TX_SINAIS_VITAIS2"'
      ', :"FL_PERDA"'
      ', :"TX_SINAIS_VITAIS3"'
      ', :"TX_SINAIS_VITAIS4"'
      ', :"TX_SINAIS_VITAIS5"'
      ', :"TX_SINAIS_VITAIS6"'
      ', :"TX_SINAIS_VITAIS7"'
      ', :"FL_SINAIS_SINTOMAS1"'
      ', :"FL_SINAIS_SINTOMAS2"'
      ', :"FL_SINAIS_SINTOMAS3"'
      ', :"FL_SINAIS_SINTOMAS4"'
      ', :"FL_SINAIS_SINTOMAS5"'
      ', :"FL_SINAIS_SINTOMAS6"'
      ', :"FL_SINAIS_SINTOMAS7"'
      ', :"FL_SINAIS_SINTOMAS8"'
      ', :"FL_SINAIS_SINTOMAS9"'
      ', :"FL_SINAIS_SINTOMAS10"'
      ', :"FL_SINAIS_SINTOMAS11"'
      ', :"FL_SINAIS_SINTOMAS12"'
      ', :"FL_SINAIS_SINTOMAS13"'
      ', :"FL_SINAIS_SINTOMAS14"'
      ', :"FL_SINAIS_SINTOMAS15"'
      ', :"FL_SINAIS_SINTOMAS16"'
      ', :"TX_ANOTACOES"'
      ', :"NM_MEDICO"'
      ', :"NR_ORDEM"'
      ', :"CD_USUARIO_CADASTRO"'
      ', :"DT_CADASTRO"'
      ', :"CD_USUARIO_ALTERACAO"'
      ', :"DT_ALTERACAO"'
      ', :"CD_USUARIO_EXCLUSAO"'
      ', :"DT_EXCLUSAO"'
      ', :"CD_ARQUIVO"'
      ', :"CD_GRUPO"'
      ', :"CD_ARQUIVO2"'
      ', :"DT_CADASTRO_2"'
      ')')
    SelectSQL.Strings = (
      'select "TRIAGEM_ENFERMAGEM"."CD_TRIAGEM_ENFERMAGEM"'
      '      ,"TRIAGEM_ENFERMAGEM"."CD_PACIENTE"'
      '      ,"TRIAGEM_ENFERMAGEM"."FL_MOTIVO"'
      '      ,"TRIAGEM_ENFERMAGEM"."TX_OUTROS"'
      '      ,"TRIAGEM_ENFERMAGEM"."TX_TEMPO"'
      '      ,"TRIAGEM_ENFERMAGEM"."FL_USO_ARV"'
      '      ,"TRIAGEM_ENFERMAGEM"."FL_GESTANTE"'
      '      ,"TRIAGEM_ENFERMAGEM"."TX_SINAIS_VITAIS1"'
      '      ,"TRIAGEM_ENFERMAGEM"."TX_SINAIS_VITAIS2"'
      '      ,"TRIAGEM_ENFERMAGEM"."FL_PERDA"'
      '      ,"TRIAGEM_ENFERMAGEM"."TX_SINAIS_VITAIS3"'
      '      ,"TRIAGEM_ENFERMAGEM"."TX_SINAIS_VITAIS4"'
      '      ,"TRIAGEM_ENFERMAGEM"."TX_SINAIS_VITAIS5"'
      '      ,"TRIAGEM_ENFERMAGEM"."TX_SINAIS_VITAIS6"'
      '      ,"TRIAGEM_ENFERMAGEM"."TX_SINAIS_VITAIS7"'
      '      ,"TRIAGEM_ENFERMAGEM"."FL_SINAIS_SINTOMAS1"'
      '      ,"TRIAGEM_ENFERMAGEM"."FL_SINAIS_SINTOMAS2"'
      '      ,"TRIAGEM_ENFERMAGEM"."FL_SINAIS_SINTOMAS3"'
      '      ,"TRIAGEM_ENFERMAGEM"."FL_SINAIS_SINTOMAS4"'
      '      ,"TRIAGEM_ENFERMAGEM"."FL_SINAIS_SINTOMAS5"'
      '      ,"TRIAGEM_ENFERMAGEM"."FL_SINAIS_SINTOMAS6"'
      '      ,"TRIAGEM_ENFERMAGEM"."FL_SINAIS_SINTOMAS7"'
      '      ,"TRIAGEM_ENFERMAGEM"."FL_SINAIS_SINTOMAS8"'
      '      ,"TRIAGEM_ENFERMAGEM"."FL_SINAIS_SINTOMAS9"'
      '      ,"TRIAGEM_ENFERMAGEM"."FL_SINAIS_SINTOMAS10"'
      '      ,"TRIAGEM_ENFERMAGEM"."FL_SINAIS_SINTOMAS11"'
      '      ,"TRIAGEM_ENFERMAGEM"."FL_SINAIS_SINTOMAS12"'
      '      ,"TRIAGEM_ENFERMAGEM"."FL_SINAIS_SINTOMAS13"'
      '      ,"TRIAGEM_ENFERMAGEM"."FL_SINAIS_SINTOMAS14"'
      '      ,"TRIAGEM_ENFERMAGEM"."FL_SINAIS_SINTOMAS15"'
      '      ,"TRIAGEM_ENFERMAGEM"."FL_SINAIS_SINTOMAS16"'
      '      ,"TRIAGEM_ENFERMAGEM"."TX_ANOTACOES"'
      '      ,"TRIAGEM_ENFERMAGEM"."NM_MEDICO"'
      '      ,"TRIAGEM_ENFERMAGEM"."NR_ORDEM"'
      '      ,"TRIAGEM_ENFERMAGEM"."CD_USUARIO_CADASTRO"'
      '      ,"TRIAGEM_ENFERMAGEM"."DT_CADASTRO"'
      '      ,"TRIAGEM_ENFERMAGEM"."CD_USUARIO_ALTERACAO"'
      '      ,"TRIAGEM_ENFERMAGEM"."DT_ALTERACAO"'
      '      ,"TRIAGEM_ENFERMAGEM"."CD_USUARIO_EXCLUSAO"'
      '      ,"TRIAGEM_ENFERMAGEM"."DT_EXCLUSAO"'
      '      ,"TRIAGEM_ENFERMAGEM"."CD_ARQUIVO"'
      '      ,"TRIAGEM_ENFERMAGEM"."CD_GRUPO"'
      '      ,"TRIAGEM_ENFERMAGEM"."CD_ARQUIVO2"'
      '      ,"TRIAGEM_ENFERMAGEM"."DT_CADASTRO_2"'
      '      ,PACIENTE.NR_PROCESSO'
      '      ,PACIENTE.NM_PACIENTE'
      '      ,(select DS_MUNICIPIO from MUNICIPIO '
      '        where CD_MUNICIPIO = PACIENTE.CD_MUNICIPIO) DS_MUNICIPIO'
      '      ,(select DS_PROVINCIA from PROVINCIA'
      '        where CD_PROVINCIA = PACIENTE.CD_PROVINCIA) DS_PROVINCIA'
      '      ,PACIENTE.DT_NASCIMENTO'
      '      ,PACIENTE.IDADE'
      '      ,PACIENTE.TP_SEXO'
      '      ,PACIENTE.NM_MAE'
      'from "TRIAGEM_ENFERMAGEM"'
      '  left outer join PACIENTE'
      '  on PACIENTE.CD_PACIENTE = "TRIAGEM_ENFERMAGEM"."CD_PACIENTE"'
      'where "TRIAGEM_ENFERMAGEM"."CD_PACIENTE" = :CD_PACIENTE')
    ModifySQL.Strings = (
      'update "TRIAGEM_ENFERMAGEM"'
      'set'
      ' "CD_TRIAGEM_ENFERMAGEM" = :"CD_TRIAGEM_ENFERMAGEM"'
      ', "CD_PACIENTE" = :"CD_PACIENTE"'
      ', "FL_MOTIVO" = :"FL_MOTIVO"'
      ', "TX_OUTROS" = :"TX_OUTROS"'
      ', "TX_TEMPO" = :"TX_TEMPO"'
      ', "FL_USO_ARV" = :"FL_USO_ARV"'
      ', "FL_GESTANTE" = :"FL_GESTANTE"'
      ', "TX_SINAIS_VITAIS1" = :"TX_SINAIS_VITAIS1"'
      ', "TX_SINAIS_VITAIS2" = :"TX_SINAIS_VITAIS2"'
      ', "FL_PERDA" = :"FL_PERDA"'
      ', "TX_SINAIS_VITAIS3" = :"TX_SINAIS_VITAIS3"'
      ', "TX_SINAIS_VITAIS4" = :"TX_SINAIS_VITAIS4"'
      ', "TX_SINAIS_VITAIS5" = :"TX_SINAIS_VITAIS5"'
      ', "TX_SINAIS_VITAIS6" = :"TX_SINAIS_VITAIS6"'
      ', "TX_SINAIS_VITAIS7" = :"TX_SINAIS_VITAIS7"'
      ', "FL_SINAIS_SINTOMAS1" = :"FL_SINAIS_SINTOMAS1"'
      ', "FL_SINAIS_SINTOMAS2" = :"FL_SINAIS_SINTOMAS2"'
      ', "FL_SINAIS_SINTOMAS3" = :"FL_SINAIS_SINTOMAS3"'
      ', "FL_SINAIS_SINTOMAS4" = :"FL_SINAIS_SINTOMAS4"'
      ', "FL_SINAIS_SINTOMAS5" = :"FL_SINAIS_SINTOMAS5"'
      ', "FL_SINAIS_SINTOMAS6" = :"FL_SINAIS_SINTOMAS6"'
      ', "FL_SINAIS_SINTOMAS7" = :"FL_SINAIS_SINTOMAS7"'
      ', "FL_SINAIS_SINTOMAS8" = :"FL_SINAIS_SINTOMAS8"'
      ', "FL_SINAIS_SINTOMAS9" = :"FL_SINAIS_SINTOMAS9"'
      ', "FL_SINAIS_SINTOMAS10" = :"FL_SINAIS_SINTOMAS10"'
      ', "FL_SINAIS_SINTOMAS11" = :"FL_SINAIS_SINTOMAS11"'
      ', "FL_SINAIS_SINTOMAS12" = :"FL_SINAIS_SINTOMAS12"'
      ', "FL_SINAIS_SINTOMAS13" = :"FL_SINAIS_SINTOMAS13"'
      ', "FL_SINAIS_SINTOMAS14" = :"FL_SINAIS_SINTOMAS14"'
      ', "FL_SINAIS_SINTOMAS15" = :"FL_SINAIS_SINTOMAS15"'
      ', "FL_SINAIS_SINTOMAS16" = :"FL_SINAIS_SINTOMAS16"'
      ', "TX_ANOTACOES" = :"TX_ANOTACOES"'
      ', "NM_MEDICO" = :"NM_MEDICO"'
      ', "NR_ORDEM" = :"NR_ORDEM"'
      ', "CD_USUARIO_CADASTRO" = :"CD_USUARIO_CADASTRO"'
      ', "DT_CADASTRO" = :"DT_CADASTRO"'
      ', "CD_USUARIO_ALTERACAO" = :"CD_USUARIO_ALTERACAO"'
      ', "DT_ALTERACAO" = :"DT_ALTERACAO"'
      ', "CD_USUARIO_EXCLUSAO" = :"CD_USUARIO_EXCLUSAO"'
      ', "DT_EXCLUSAO" = :"DT_EXCLUSAO"'
      ', "CD_ARQUIVO" = :"CD_ARQUIVO"'
      ', "CD_GRUPO" = :"CD_GRUPO"'
      ', "CD_ARQUIVO2" = :"CD_ARQUIVO2"'
      ', "DT_CADASTRO_2" = :"DT_CADASTRO_2"'
      'where'
      '  "CD_TRIAGEM_ENFERMAGEM" = :"OLD_CD_TRIAGEM_ENFERMAGEM"')
    GeneratorField.Field = 'CD_TRIAGEM_ENFERMAGEM'
    GeneratorField.Generator = 'GEN_TRIAGEM_ENFERMAGEM'
    Left = 752
    Top = 355
    object TB_TRIAGEM_ENFERMAGEMCD_TRIAGEM_ENFERMAGEM: TIntegerField
      FieldName = 'CD_TRIAGEM_ENFERMAGEM'
      Origin = 'TRIAGEM_ENFERMAGEM.CD_TRIAGEM_ENFERMAGEM'
      Required = True
    end
    object TB_TRIAGEM_ENFERMAGEMCD_PACIENTE: TIntegerField
      FieldName = 'CD_PACIENTE'
      Origin = 'TRIAGEM_ENFERMAGEM.CD_PACIENTE'
    end
    object TB_TRIAGEM_ENFERMAGEMFL_MOTIVO: TIBStringField
      FieldName = 'FL_MOTIVO'
      Origin = 'TRIAGEM_ENFERMAGEM.FL_MOTIVO'
      FixedChar = True
      Size = 1
    end
    object TB_TRIAGEM_ENFERMAGEMTX_OUTROS: TIBStringField
      FieldName = 'TX_OUTROS'
      Origin = 'TRIAGEM_ENFERMAGEM.TX_OUTROS'
      Size = 100
    end
    object TB_TRIAGEM_ENFERMAGEMTX_TEMPO: TIBStringField
      FieldName = 'TX_TEMPO'
      Origin = 'TRIAGEM_ENFERMAGEM.TX_TEMPO'
    end
    object TB_TRIAGEM_ENFERMAGEMFL_USO_ARV: TIBStringField
      FieldName = 'FL_USO_ARV'
      Origin = 'TRIAGEM_ENFERMAGEM.FL_USO_ARV'
      FixedChar = True
      Size = 1
    end
    object TB_TRIAGEM_ENFERMAGEMFL_GESTANTE: TIBStringField
      FieldName = 'FL_GESTANTE'
      Origin = 'TRIAGEM_ENFERMAGEM.FL_GESTANTE'
      FixedChar = True
      Size = 1
    end
    object TB_TRIAGEM_ENFERMAGEMTX_SINAIS_VITAIS1: TIBStringField
      FieldName = 'TX_SINAIS_VITAIS1'
      Origin = 'TRIAGEM_ENFERMAGEM.TX_SINAIS_VITAIS1'
    end
    object TB_TRIAGEM_ENFERMAGEMTX_SINAIS_VITAIS2: TIBStringField
      FieldName = 'TX_SINAIS_VITAIS2'
      Origin = 'TRIAGEM_ENFERMAGEM.TX_SINAIS_VITAIS2'
    end
    object TB_TRIAGEM_ENFERMAGEMFL_PERDA: TIBStringField
      FieldName = 'FL_PERDA'
      Origin = 'TRIAGEM_ENFERMAGEM.FL_PERDA'
      FixedChar = True
      Size = 1
    end
    object TB_TRIAGEM_ENFERMAGEMTX_SINAIS_VITAIS3: TIBStringField
      FieldName = 'TX_SINAIS_VITAIS3'
      Origin = 'TRIAGEM_ENFERMAGEM.TX_SINAIS_VITAIS3'
    end
    object TB_TRIAGEM_ENFERMAGEMTX_SINAIS_VITAIS4: TIBStringField
      FieldName = 'TX_SINAIS_VITAIS4'
      Origin = 'TRIAGEM_ENFERMAGEM.TX_SINAIS_VITAIS4'
    end
    object TB_TRIAGEM_ENFERMAGEMTX_SINAIS_VITAIS5: TIBStringField
      FieldName = 'TX_SINAIS_VITAIS5'
      Origin = 'TRIAGEM_ENFERMAGEM.TX_SINAIS_VITAIS5'
    end
    object TB_TRIAGEM_ENFERMAGEMTX_SINAIS_VITAIS6: TIBStringField
      FieldName = 'TX_SINAIS_VITAIS6'
      Origin = 'TRIAGEM_ENFERMAGEM.TX_SINAIS_VITAIS6'
    end
    object TB_TRIAGEM_ENFERMAGEMTX_SINAIS_VITAIS7: TIBStringField
      FieldName = 'TX_SINAIS_VITAIS7'
      Origin = 'TRIAGEM_ENFERMAGEM.TX_SINAIS_VITAIS7'
    end
    object TB_TRIAGEM_ENFERMAGEMFL_SINAIS_SINTOMAS1: TIBStringField
      FieldName = 'FL_SINAIS_SINTOMAS1'
      Origin = 'TRIAGEM_ENFERMAGEM.FL_SINAIS_SINTOMAS1'
      FixedChar = True
      Size = 1
    end
    object TB_TRIAGEM_ENFERMAGEMFL_SINAIS_SINTOMAS2: TIBStringField
      FieldName = 'FL_SINAIS_SINTOMAS2'
      Origin = 'TRIAGEM_ENFERMAGEM.FL_SINAIS_SINTOMAS2'
      FixedChar = True
      Size = 1
    end
    object TB_TRIAGEM_ENFERMAGEMFL_SINAIS_SINTOMAS3: TIBStringField
      FieldName = 'FL_SINAIS_SINTOMAS3'
      Origin = 'TRIAGEM_ENFERMAGEM.FL_SINAIS_SINTOMAS3'
      FixedChar = True
      Size = 1
    end
    object TB_TRIAGEM_ENFERMAGEMFL_SINAIS_SINTOMAS4: TIBStringField
      FieldName = 'FL_SINAIS_SINTOMAS4'
      Origin = 'TRIAGEM_ENFERMAGEM.FL_SINAIS_SINTOMAS4'
      FixedChar = True
      Size = 1
    end
    object TB_TRIAGEM_ENFERMAGEMFL_SINAIS_SINTOMAS5: TIBStringField
      FieldName = 'FL_SINAIS_SINTOMAS5'
      Origin = 'TRIAGEM_ENFERMAGEM.FL_SINAIS_SINTOMAS5'
      FixedChar = True
      Size = 1
    end
    object TB_TRIAGEM_ENFERMAGEMFL_SINAIS_SINTOMAS6: TIBStringField
      FieldName = 'FL_SINAIS_SINTOMAS6'
      Origin = 'TRIAGEM_ENFERMAGEM.FL_SINAIS_SINTOMAS6'
      FixedChar = True
      Size = 1
    end
    object TB_TRIAGEM_ENFERMAGEMFL_SINAIS_SINTOMAS7: TIBStringField
      FieldName = 'FL_SINAIS_SINTOMAS7'
      Origin = 'TRIAGEM_ENFERMAGEM.FL_SINAIS_SINTOMAS7'
      FixedChar = True
      Size = 1
    end
    object TB_TRIAGEM_ENFERMAGEMFL_SINAIS_SINTOMAS8: TIBStringField
      FieldName = 'FL_SINAIS_SINTOMAS8'
      Origin = 'TRIAGEM_ENFERMAGEM.FL_SINAIS_SINTOMAS8'
      FixedChar = True
      Size = 1
    end
    object TB_TRIAGEM_ENFERMAGEMFL_SINAIS_SINTOMAS9: TIBStringField
      FieldName = 'FL_SINAIS_SINTOMAS9'
      Origin = 'TRIAGEM_ENFERMAGEM.FL_SINAIS_SINTOMAS9'
      FixedChar = True
      Size = 1
    end
    object TB_TRIAGEM_ENFERMAGEMFL_SINAIS_SINTOMAS10: TIBStringField
      FieldName = 'FL_SINAIS_SINTOMAS10'
      Origin = 'TRIAGEM_ENFERMAGEM.FL_SINAIS_SINTOMAS10'
      FixedChar = True
      Size = 1
    end
    object TB_TRIAGEM_ENFERMAGEMFL_SINAIS_SINTOMAS11: TIBStringField
      FieldName = 'FL_SINAIS_SINTOMAS11'
      Origin = 'TRIAGEM_ENFERMAGEM.FL_SINAIS_SINTOMAS11'
      FixedChar = True
      Size = 1
    end
    object TB_TRIAGEM_ENFERMAGEMFL_SINAIS_SINTOMAS12: TIBStringField
      FieldName = 'FL_SINAIS_SINTOMAS12'
      Origin = 'TRIAGEM_ENFERMAGEM.FL_SINAIS_SINTOMAS12'
      FixedChar = True
      Size = 1
    end
    object TB_TRIAGEM_ENFERMAGEMFL_SINAIS_SINTOMAS13: TIBStringField
      FieldName = 'FL_SINAIS_SINTOMAS13'
      Origin = 'TRIAGEM_ENFERMAGEM.FL_SINAIS_SINTOMAS13'
      FixedChar = True
      Size = 1
    end
    object TB_TRIAGEM_ENFERMAGEMFL_SINAIS_SINTOMAS14: TIBStringField
      FieldName = 'FL_SINAIS_SINTOMAS14'
      Origin = 'TRIAGEM_ENFERMAGEM.FL_SINAIS_SINTOMAS14'
      FixedChar = True
      Size = 1
    end
    object TB_TRIAGEM_ENFERMAGEMFL_SINAIS_SINTOMAS15: TIBStringField
      FieldName = 'FL_SINAIS_SINTOMAS15'
      Origin = 'TRIAGEM_ENFERMAGEM.FL_SINAIS_SINTOMAS15'
      FixedChar = True
      Size = 1
    end
    object TB_TRIAGEM_ENFERMAGEMFL_SINAIS_SINTOMAS16: TIBStringField
      FieldName = 'FL_SINAIS_SINTOMAS16'
      Origin = 'TRIAGEM_ENFERMAGEM.FL_SINAIS_SINTOMAS16'
      FixedChar = True
      Size = 1
    end
    object TB_TRIAGEM_ENFERMAGEMTX_ANOTACOES: TIBStringField
      FieldName = 'TX_ANOTACOES'
      Origin = 'TRIAGEM_ENFERMAGEM.TX_ANOTACOES'
      Size = 600
    end
    object TB_TRIAGEM_ENFERMAGEMNM_MEDICO: TIBStringField
      FieldName = 'NM_MEDICO'
      Origin = 'TRIAGEM_ENFERMAGEM.NM_MEDICO'
      Size = 100
    end
    object TB_TRIAGEM_ENFERMAGEMNR_ORDEM: TIBStringField
      FieldName = 'NR_ORDEM'
      Origin = 'TRIAGEM_ENFERMAGEM.NR_ORDEM'
    end
    object TB_TRIAGEM_ENFERMAGEMCD_USUARIO_CADASTRO: TIntegerField
      FieldName = 'CD_USUARIO_CADASTRO'
      Origin = 'TRIAGEM_ENFERMAGEM.CD_USUARIO_CADASTRO'
    end
    object TB_TRIAGEM_ENFERMAGEMDT_CADASTRO: TDateTimeField
      FieldName = 'DT_CADASTRO'
      Origin = 'TRIAGEM_ENFERMAGEM.DT_CADASTRO'
    end
    object TB_TRIAGEM_ENFERMAGEMCD_USUARIO_ALTERACAO: TIntegerField
      FieldName = 'CD_USUARIO_ALTERACAO'
      Origin = 'TRIAGEM_ENFERMAGEM.CD_USUARIO_ALTERACAO'
    end
    object TB_TRIAGEM_ENFERMAGEMDT_ALTERACAO: TDateTimeField
      FieldName = 'DT_ALTERACAO'
      Origin = 'TRIAGEM_ENFERMAGEM.DT_ALTERACAO'
    end
    object TB_TRIAGEM_ENFERMAGEMCD_USUARIO_EXCLUSAO: TIntegerField
      FieldName = 'CD_USUARIO_EXCLUSAO'
      Origin = 'TRIAGEM_ENFERMAGEM.CD_USUARIO_EXCLUSAO'
    end
    object TB_TRIAGEM_ENFERMAGEMDT_EXCLUSAO: TDateTimeField
      FieldName = 'DT_EXCLUSAO'
      Origin = 'TRIAGEM_ENFERMAGEM.DT_EXCLUSAO'
    end
    object TB_TRIAGEM_ENFERMAGEMCD_ARQUIVO: TIntegerField
      FieldName = 'CD_ARQUIVO'
      Origin = 'TRIAGEM_ENFERMAGEM.CD_ARQUIVO'
    end
    object TB_TRIAGEM_ENFERMAGEMCD_GRUPO: TIntegerField
      FieldName = 'CD_GRUPO'
      Origin = 'TRIAGEM_ENFERMAGEM.CD_GRUPO'
    end
    object TB_TRIAGEM_ENFERMAGEMCD_ARQUIVO2: TIntegerField
      FieldName = 'CD_ARQUIVO2'
      Origin = 'TRIAGEM_ENFERMAGEM.CD_ARQUIVO2'
    end
    object TB_TRIAGEM_ENFERMAGEMNR_PROCESSO: TIntegerField
      FieldName = 'NR_PROCESSO'
      Origin = 'PACIENTE.NR_PROCESSO'
    end
    object TB_TRIAGEM_ENFERMAGEMNM_PACIENTE: TIBStringField
      FieldName = 'NM_PACIENTE'
      Origin = 'PACIENTE.NM_PACIENTE'
      Size = 50
    end
    object TB_TRIAGEM_ENFERMAGEMDS_MUNICIPIO: TIBStringField
      FieldName = 'DS_MUNICIPIO'
      Size = 50
    end
    object TB_TRIAGEM_ENFERMAGEMDS_PROVINCIA: TIBStringField
      FieldName = 'DS_PROVINCIA'
      Size = 50
    end
    object TB_TRIAGEM_ENFERMAGEMDT_NASCIMENTO: TDateField
      FieldName = 'DT_NASCIMENTO'
      Origin = 'PACIENTE.DT_NASCIMENTO'
    end
    object TB_TRIAGEM_ENFERMAGEMIDADE: TSmallintField
      FieldName = 'IDADE'
      Origin = 'PACIENTE.IDADE'
    end
    object TB_TRIAGEM_ENFERMAGEMTP_SEXO: TIBStringField
      FieldName = 'TP_SEXO'
      Origin = 'PACIENTE.TP_SEXO'
      FixedChar = True
      Size = 1
    end
    object TB_TRIAGEM_ENFERMAGEMNM_MAE: TIBStringField
      FieldName = 'NM_MAE'
      Origin = 'PACIENTE.NM_MAE'
      Size = 50
    end
    object TB_TRIAGEM_ENFERMAGEMDT_CADASTRO_2: TDateTimeField
      FieldName = 'DT_CADASTRO_2'
      Origin = 'TRIAGEM_ENFERMAGEM.DT_CADASTRO_2'
    end
  end
  object TB_CID10: TIBDataSet
    Database = DM.DB
    Transaction = DM.TS
    BufferChunks = 1000
    CachedUpdates = False
    SelectSQL.Strings = (
      'select '
      '      "CID10_SUBCATEGORIA"."CD_SUBCATEGORIA"'
      '      ,"CID10_SUBCATEGORIA"."CD_SUBCAT"'
      '      ,"CID10_SUBCATEGORIA"."CD_CAPITULO"'
      '      ,"CID10_SUBCATEGORIA"."CD_GRUPO"'
      '      ,"CID10_SUBCATEGORIA"."CD_CATEGORIA"'
      '      ,"CID10_SUBCATEGORIA"."FL_USAR"'
      '      ,"CID10_SUBCATEGORIA"."DS_DESCRICAO"'
      '      ,"CID10_SUBCATEGORIA"."DS_DESCRABREV"'
      '      ,"CID10_CAPITULO"."DS_DESCRABREV" DS_CAPITULO'
      '      ,"CID10_CATEGORIA"."DS_DESCRABREV" DS_CATEGORIA'
      'from "CID10_SUBCATEGORIA"'
      '    join "CID10_CAPITULO"'
      
        '    on "CID10_CAPITULO"."CD_CAPITULO" = "CID10_SUBCATEGORIA"."CD' +
        '_CAPITULO"'
      '    join "CID10_CATEGORIA" '
      
        '    on "CID10_CATEGORIA"."CD_CATEGORIA" = "CID10_SUBCATEGORIA"."' +
        'CD_CATEGORIA"'
      '/*WHERE*/'
      'order by'
      '      "CID10_SUBCATEGORIA"."CD_CAPITULO"'
      '      ,"CID10_SUBCATEGORIA"."CD_GRUPO"'
      '      ,"CID10_SUBCATEGORIA"."CD_CATEGORIA"'
      '      ,"CID10_SUBCATEGORIA"."CD_SUBCATEGORIA"')
    ModifySQL.Strings = (
      'update "CID10_SUBCATEGORIA"'
      'set'
      ' "FL_USAR" = :"FL_USAR"'
      'where'
      '  "CD_SUBCATEGORIA" = :"OLD_CD_SUBCATEGORIA"')
    Left = 704
    Top = 283
    object TB_CID10CD_SUBCATEGORIA: TIntegerField
      FieldName = 'CD_SUBCATEGORIA'
      Origin = 'CID10_SUBCATEGORIA.CD_SUBCATEGORIA'
      Required = True
    end
    object TB_CID10CD_SUBCAT: TIBStringField
      FieldName = 'CD_SUBCAT'
      Origin = 'CID10_SUBCATEGORIA.CD_SUBCAT'
      FixedChar = True
      Size = 5
    end
    object TB_CID10CD_CAPITULO: TIntegerField
      FieldName = 'CD_CAPITULO'
      Origin = 'CID10_SUBCATEGORIA.CD_CAPITULO'
    end
    object TB_CID10CD_GRUPO: TIntegerField
      FieldName = 'CD_GRUPO'
      Origin = 'CID10_SUBCATEGORIA.CD_GRUPO'
    end
    object TB_CID10CD_CATEGORIA: TIntegerField
      FieldName = 'CD_CATEGORIA'
      Origin = 'CID10_SUBCATEGORIA.CD_CATEGORIA'
    end
    object TB_CID10FL_USAR: TIBStringField
      FieldName = 'FL_USAR'
      Origin = 'CID10_SUBCATEGORIA.FL_USAR'
      FixedChar = True
      Size = 1
    end
    object TB_CID10DS_DESCRICAO: TIBStringField
      FieldName = 'DS_DESCRICAO'
      Origin = 'CID10_SUBCATEGORIA.DS_DESCRICAO'
      Size = 300
    end
    object TB_CID10DS_DESCRABREV: TIBStringField
      FieldName = 'DS_DESCRABREV'
      Origin = 'CID10_SUBCATEGORIA.DS_DESCRABREV'
      Size = 300
    end
    object TB_CID10DS_CAPITULO: TIBStringField
      FieldName = 'DS_CAPITULO'
      Origin = 'CID10_CAPITULO.DS_DESCRABREV'
      Size = 300
    end
    object TB_CID10DS_CATEGORIA: TIBStringField
      FieldName = 'DS_CATEGORIA'
      Origin = 'CID10_CATEGORIA.DS_DESCRABREV'
      Size = 300
    end
  end
  object TB_MAPA: TIBDataSet
    Database = DM.DB
    Transaction = DM.TS
    AfterInsert = TB_MAPAAfterInsert
    BeforeDelete = TB_MAPABeforeDelete
    BeforePost = TB_MAPABeforePost
    BufferChunks = 1000
    CachedUpdates = False
    DeleteSQL.Strings = (
      'delete from "MAPA"'
      'where'
      '  "CD_MAPA" = :"OLD_CD_MAPA"')
    InsertSQL.Strings = (
      'insert into "MAPA"'
      '('
      '  "CD_MAPA"'
      ', "CD_MEDICO"'
      ', "TP_CONSULTA"'
      ', "DT_MAPA"'
      ', "CD_PACIENTE"'
      ', "DS_PESO"'
      ', "TP_CONSULTA2"'
      ', "FL_RETORNO"'
      ', "NR_ESTADIO_OMS"'
      ', "CD_CID10"'
      ', "NR_CD4"'
      ', "FL_TB"'
      ', "FL_N"'
      ', "FL_I"'
      ', "FL_T"'
      ', "FL_M"'
      ', "DS_ESQUEMA"'
      ', "CD_USUARIO_CADASTRO"'
      ', "DT_CADASTRO"'
      ', "CD_USUARIO_ALTERACAO"'
      ', "DT_ALTERACAO"'
      ', "CD_USUARIO_EXCLUSAO"'
      ', "DT_EXCLUSAO"'
      ')'
      'values'
      '('
      '  :"CD_MAPA"'
      ', :"CD_MEDICO"'
      ', :"TP_CONSULTA"'
      ', :"DT_MAPA"'
      ', :"CD_PACIENTE"'
      ', :"DS_PESO"'
      ', :"TP_CONSULTA2"'
      ', :"FL_RETORNO"'
      ', :"NR_ESTADIO_OMS"'
      ', :"CD_CID10"'
      ', :"NR_CD4"'
      ', :"FL_TB"'
      ', :"FL_N"'
      ', :"FL_I"'
      ', :"FL_T"'
      ', :"FL_M"'
      ', :"DS_ESQUEMA"'
      ', :"CD_USUARIO_CADASTRO"'
      ', :"DT_CADASTRO"'
      ', :"CD_USUARIO_ALTERACAO"'
      ', :"DT_ALTERACAO"'
      ', :"CD_USUARIO_EXCLUSAO"'
      ', :"DT_EXCLUSAO"'
      ')')
    SelectSQL.Strings = (
      'select "MAPA"."CD_MAPA"'
      '      ,"MAPA"."CD_MEDICO"'
      '      ,"MAPA"."TP_CONSULTA"'
      '      ,"MAPA"."DT_MAPA"'
      '      ,"MAPA"."CD_PACIENTE"'
      '      ,"MAPA"."DS_PESO"'
      '      ,"MAPA"."TP_CONSULTA2"'
      '      ,"MAPA"."FL_RETORNO"'
      '      ,"MAPA"."NR_ESTADIO_OMS"'
      '      ,"MAPA"."CD_CID10"'
      '      ,"MAPA"."NR_CD4"'
      '      ,"MAPA"."FL_TB"'
      '      ,"MAPA"."FL_N"'
      '      ,"MAPA"."FL_I"'
      '      ,"MAPA"."FL_T"'
      '      ,"MAPA"."FL_M"'
      '      ,"MAPA"."DS_ESQUEMA"'
      '      ,"MAPA"."CD_USUARIO_CADASTRO"'
      '      ,"MAPA"."DT_CADASTRO"'
      '      ,"MAPA"."CD_USUARIO_ALTERACAO"'
      '      ,"MAPA"."DT_ALTERACAO"'
      '      ,"MAPA"."CD_USUARIO_EXCLUSAO"'
      '      ,"MAPA"."DT_EXCLUSAO"'
      '      ,PACIENTE.NR_PROCESSO'
      '      ,PACIENTE.NM_PACIENTE'
      '      ,(select DS_MUNICIPIO from MUNICIPIO '
      '        where CD_MUNICIPIO = PACIENTE.CD_MUNICIPIO) DS_MUNICIPIO'
      '      ,(select DS_PROVINCIA from PROVINCIA'
      '        where CD_PROVINCIA = PACIENTE.CD_PROVINCIA) DS_PROVINCIA'
      '      ,PACIENTE.IDADE'
      '      ,PACIENTE.TP_SEXO'
      '      ,MEDICO.NM_MEDICO'
      '      ,"CID10_SUBCATEGORIA".CD_SUBCAT'
      'from "MAPA"'
      '  left outer join PACIENTE'
      '  on PACIENTE.CD_PACIENTE = "MAPA"."CD_PACIENTE"'
      '  inner join MEDICO'
      '  on MEDICO.CD_MEDICO = MAPA.CD_MEDICO'
      '  left outer join  CID10_SUBCATEGORIA'
      '  on CID10_SUBCATEGORIA.CD_SUBCATEGORIA ='
      '  "MAPA".CD_CID10'
      'WHERE MAPA.CD_MEDICO = :CD_MEDICO'
      'AND MAPA.DT_MAPA = :DT_MAPA'
      'order by'
      '"MAPA"."CD_MAPA"')
    ModifySQL.Strings = (
      'update "MAPA"'
      'set'
      ' "CD_MAPA" = :"CD_MAPA"'
      ', "CD_MEDICO" = :"CD_MEDICO"'
      ', "TP_CONSULTA" = :"TP_CONSULTA"'
      ', "DT_MAPA" = :"DT_MAPA"'
      ', "CD_PACIENTE" = :"CD_PACIENTE"'
      ', "DS_PESO" = :"DS_PESO"'
      ', "TP_CONSULTA2" = :"TP_CONSULTA2"'
      ', "FL_RETORNO" = :"FL_RETORNO"'
      ', "NR_ESTADIO_OMS" = :"NR_ESTADIO_OMS"'
      ', "CD_CID10" = :"CD_CID10"'
      ', "NR_CD4" = :"NR_CD4"'
      ', "FL_TB" = :"FL_TB"'
      ', "FL_N" = :"FL_N"'
      ', "FL_I" = :"FL_I"'
      ', "FL_T" = :"FL_T"'
      ', "FL_M" = :"FL_M"'
      ', "DS_ESQUEMA" = :"DS_ESQUEMA"'
      ', "CD_USUARIO_CADASTRO" = :"CD_USUARIO_CADASTRO"'
      ', "DT_CADASTRO" = :"DT_CADASTRO"'
      ', "CD_USUARIO_ALTERACAO" = :"CD_USUARIO_ALTERACAO"'
      ', "DT_ALTERACAO" = :"DT_ALTERACAO"'
      ', "CD_USUARIO_EXCLUSAO" = :"CD_USUARIO_EXCLUSAO"'
      ', "DT_EXCLUSAO" = :"DT_EXCLUSAO"'
      'where'
      '  "CD_MAPA" = :"OLD_CD_MAPA"')
    GeneratorField.Field = 'CD_MAPA'
    GeneratorField.Generator = 'GEN_MAPA'
    Left = 800
    Top = 195
    object TB_MAPACD_MAPA: TIntegerField
      FieldName = 'CD_MAPA'
      Origin = 'MAPA.CD_MAPA'
      Required = True
    end
    object TB_MAPACD_MEDICO: TIntegerField
      FieldName = 'CD_MEDICO'
      Origin = 'MAPA.CD_MEDICO'
    end
    object TB_MAPATP_CONSULTA: TIBStringField
      FieldName = 'TP_CONSULTA'
      Origin = 'MAPA.TP_CONSULTA'
      FixedChar = True
      Size = 1
    end
    object TB_MAPADT_MAPA: TDateTimeField
      FieldName = 'DT_MAPA'
      Origin = 'MAPA.DT_MAPA'
    end
    object TB_MAPACD_PACIENTE: TIntegerField
      FieldName = 'CD_PACIENTE'
      Origin = 'MAPA.CD_PACIENTE'
    end
    object TB_MAPADS_PESO: TIntegerField
      FieldName = 'DS_PESO'
      Origin = 'MAPA.DS_PESO'
    end
    object TB_MAPATP_CONSULTA2: TIBStringField
      FieldName = 'TP_CONSULTA2'
      Origin = 'MAPA.TP_CONSULTA2'
      FixedChar = True
      Size = 1
    end
    object TB_MAPAFL_RETORNO: TIBStringField
      FieldName = 'FL_RETORNO'
      Origin = 'MAPA.FL_RETORNO'
      FixedChar = True
      Size = 1
    end
    object TB_MAPANR_ESTADIO_OMS: TIntegerField
      FieldName = 'NR_ESTADIO_OMS'
      Origin = 'MAPA.NR_ESTADIO_OMS'
    end
    object TB_MAPACD_CID10: TIBStringField
      FieldName = 'CD_CID10'
      Origin = 'MAPA.CD_CID10'
      Size = 10
    end
    object TB_MAPANR_CD4: TIntegerField
      FieldName = 'NR_CD4'
      Origin = 'MAPA.NR_CD4'
    end
    object TB_MAPAFL_TB: TIBStringField
      FieldName = 'FL_TB'
      Origin = 'MAPA.FL_TB'
      FixedChar = True
      Size = 1
    end
    object TB_MAPAFL_N: TIBStringField
      FieldName = 'FL_N'
      Origin = 'MAPA.FL_N'
      FixedChar = True
      Size = 1
    end
    object TB_MAPAFL_I: TIBStringField
      FieldName = 'FL_I'
      Origin = 'MAPA.FL_I'
      FixedChar = True
      Size = 1
    end
    object TB_MAPAFL_T: TIBStringField
      FieldName = 'FL_T'
      Origin = 'MAPA.FL_T'
      FixedChar = True
      Size = 1
    end
    object TB_MAPAFL_M: TIBStringField
      FieldName = 'FL_M'
      Origin = 'MAPA.FL_M'
      FixedChar = True
      Size = 1
    end
    object TB_MAPADS_ESQUEMA: TIBStringField
      FieldName = 'DS_ESQUEMA'
      Origin = 'MAPA.DS_ESQUEMA'
    end
    object TB_MAPACD_USUARIO_CADASTRO: TIntegerField
      FieldName = 'CD_USUARIO_CADASTRO'
      Origin = 'MAPA.CD_USUARIO_CADASTRO'
    end
    object TB_MAPADT_CADASTRO: TDateTimeField
      FieldName = 'DT_CADASTRO'
      Origin = 'MAPA.DT_CADASTRO'
    end
    object TB_MAPACD_USUARIO_ALTERACAO: TIntegerField
      FieldName = 'CD_USUARIO_ALTERACAO'
      Origin = 'MAPA.CD_USUARIO_ALTERACAO'
    end
    object TB_MAPADT_ALTERACAO: TDateTimeField
      FieldName = 'DT_ALTERACAO'
      Origin = 'MAPA.DT_ALTERACAO'
    end
    object TB_MAPACD_USUARIO_EXCLUSAO: TIntegerField
      FieldName = 'CD_USUARIO_EXCLUSAO'
      Origin = 'MAPA.CD_USUARIO_EXCLUSAO'
    end
    object TB_MAPADT_EXCLUSAO: TDateTimeField
      FieldName = 'DT_EXCLUSAO'
      Origin = 'MAPA.DT_EXCLUSAO'
    end
    object TB_MAPANR_PROCESSO: TIntegerField
      FieldName = 'NR_PROCESSO'
      Origin = 'PACIENTE.NR_PROCESSO'
    end
    object TB_MAPANM_PACIENTE: TIBStringField
      FieldName = 'NM_PACIENTE'
      Origin = 'PACIENTE.NM_PACIENTE'
      Size = 50
    end
    object TB_MAPADS_MUNICIPIO: TIBStringField
      FieldName = 'DS_MUNICIPIO'
      Size = 50
    end
    object TB_MAPADS_PROVINCIA: TIBStringField
      FieldName = 'DS_PROVINCIA'
      Size = 50
    end
    object TB_MAPAIDADE: TSmallintField
      FieldName = 'IDADE'
      Origin = 'PACIENTE.IDADE'
    end
    object TB_MAPATP_SEXO: TIBStringField
      FieldName = 'TP_SEXO'
      Origin = 'PACIENTE.TP_SEXO'
      FixedChar = True
      Size = 1
    end
    object TB_MAPANM_MEDICO: TIBStringField
      FieldName = 'NM_MEDICO'
      Origin = 'MEDICO.NM_MEDICO'
      Size = 50
    end
    object TB_MAPACD_SUBCAT: TIBStringField
      FieldName = 'CD_SUBCAT'
      Origin = 'CID10_SUBCATEGORIA.CD_SUBCAT'
      FixedChar = True
      Size = 5
    end
  end
  object qyMapaMedico: TIBQuery
    Database = DM.DB
    Transaction = DM.TS
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select  AGENDA.DT_AGENDA'
      '       ,AGENDA.FL_CONFIRMADO'
      '       ,AGENDA.FL_REALIZADO'
      '       ,MEDICO.CD_MEDICO'
      '       ,MEDICO.NM_MEDICO'
      '       ,PACIENTE.CD_PACIENTE'
      
        '       ,(SELECT FL_DIGITAL FROM PROCESSO WHERE PROCESSO.NR_PROCE' +
        'SSO = PACIENTE.NR_PROCESSO)  DIGITAL'
      '       ,PACIENTE.NR_PROCESSO'
      '       ,PACIENTE.NM_PACIENTE'
      '       ,PACIENTE.TP_SEXO'
      '       ,PACIENTE.IDADE'
      
        '       ,(select distinct DS_PROVINCIA from PROVINCIA p where p.C' +
        'D_PROVINCIA = PACIENTE.CD_PROVINCIA) DS_PROVINCIA'
      
        '       ,(select distinct DS_MUNICIPIO from MUNICIPIO m where m.C' +
        'D_MUNICIPIO = PACIENTE.CD_MUNICIPIO) DS_MUNICIPIO'
      'from AGENDA'
      '  inner join PACIENTE'
      '  on PACIENTE.CD_PACIENTE = AGENDA.CD_PACIENTE'
      ' and PACIENTE.CD_UND = AGENDA.CD_UND'
      '  inner join MEDICO'
      '  on MEDICO.CD_MEDICO = AGENDA.CD_MEDICO'
      'where "AGENDA".DT_AGENDA = :DTAGENDA'
      'AND  AGENDA.CD_MEDICO = :CDMEDICO'
      'AND AGENDA.FL_CONFIRMADO = 1'
      'AND AGENDA.FL_REALIZADO = 1'
      'AND AGENDA.FL_PARECER = 1'
      'order by'
      '"AGENDA"."CD_AGENDA"')
    Left = 744
    Top = 163
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'DTAGENDA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CDMEDICO'
        ParamType = ptUnknown
      end>
    object qyMapaMedicoDT_AGENDA: TDateTimeField
      FieldName = 'DT_AGENDA'
      Origin = 'AGENDA.DT_AGENDA'
    end
    object qyMapaMedicoFL_CONFIRMADO: TIntegerField
      FieldName = 'FL_CONFIRMADO'
      Origin = 'AGENDA.FL_CONFIRMADO'
    end
    object qyMapaMedicoFL_REALIZADO: TIntegerField
      FieldName = 'FL_REALIZADO'
      Origin = 'AGENDA.FL_REALIZADO'
    end
    object qyMapaMedicoCD_MEDICO: TIntegerField
      FieldName = 'CD_MEDICO'
      Origin = 'MEDICO.CD_MEDICO'
      Required = True
    end
    object qyMapaMedicoNM_MEDICO: TIBStringField
      FieldName = 'NM_MEDICO'
      Origin = 'MEDICO.NM_MEDICO'
      Size = 50
    end
    object qyMapaMedicoCD_PACIENTE: TIntegerField
      FieldName = 'CD_PACIENTE'
      Origin = 'PACIENTE.CD_PACIENTE'
      Required = True
    end
    object qyMapaMedicoDIGITAL: TIntegerField
      FieldName = 'DIGITAL'
    end
    object qyMapaMedicoNR_PROCESSO: TIntegerField
      FieldName = 'NR_PROCESSO'
      Origin = 'PACIENTE.NR_PROCESSO'
    end
    object qyMapaMedicoNM_PACIENTE: TIBStringField
      FieldName = 'NM_PACIENTE'
      Origin = 'PACIENTE.NM_PACIENTE'
      Required = True
      Size = 50
    end
    object qyMapaMedicoTP_SEXO: TIBStringField
      FieldName = 'TP_SEXO'
      Origin = 'PACIENTE.TP_SEXO'
      Required = True
      FixedChar = True
      Size = 1
    end
    object qyMapaMedicoIDADE: TSmallintField
      FieldName = 'IDADE'
      Origin = 'PACIENTE.IDADE'
      Required = True
    end
    object qyMapaMedicoDS_PROVINCIA: TIBStringField
      FieldName = 'DS_PROVINCIA'
      Size = 50
    end
    object qyMapaMedicoDS_MUNICIPIO: TIBStringField
      FieldName = 'DS_MUNICIPIO'
      Size = 50
    end
  end
  object TB_VERSAO_RELATORIO: TIBDataSet
    Database = DM.DB
    Transaction = DM.TS
    AfterInsert = TB_VERSAO_RELATORIOAfterInsert
    BufferChunks = 1000
    CachedUpdates = False
    DeleteSQL.Strings = (
      'delete from "VERSAO_RELATORIO"'
      'where'
      '  "CD_VERSAO" = :"OLD_CD_VERSAO"')
    InsertSQL.Strings = (
      'insert into "VERSAO_RELATORIO"'
      '('
      '  "CD_VERSAO"'
      ', "DT_VERSAO"'
      ', "CD_USUARIO"'
      ', "NM_USUARIO"'
      ', "DS_OBSERVACAO"'
      ', "TP_RELATORIO"'
      ', "NM_ARQUIVO"'
      ', "BL_RELATORIO"'
      ')'
      'values'
      '('
      '  :"CD_VERSAO"'
      ', :"DT_VERSAO"'
      ', :"CD_USUARIO"'
      ', :"NM_USUARIO"'
      ', :"DS_OBSERVACAO"'
      ', :"TP_RELATORIO"'
      ', :"NM_ARQUIVO"'
      ', :"BL_RELATORIO"'
      ')')
    SelectSQL.Strings = (
      'select "VERSAO_RELATORIO"."CD_VERSAO"'
      '      ,"VERSAO_RELATORIO"."DT_VERSAO"'
      '      ,"VERSAO_RELATORIO"."CD_USUARIO"'
      '      ,"VERSAO_RELATORIO"."NM_USUARIO"'
      '      ,"VERSAO_RELATORIO"."DS_OBSERVACAO"'
      '      ,"VERSAO_RELATORIO"."TP_RELATORIO"'
      '      ,"VERSAO_RELATORIO"."NM_ARQUIVO"'
      '      ,"VERSAO_RELATORIO"."BL_RELATORIO"'
      'from "VERSAO_RELATORIO"'
      'WHERE "VERSAO_RELATORIO"."TP_RELATORIO" = :TP_RELATORIO')
    ModifySQL.Strings = (
      'update "VERSAO_RELATORIO"'
      'set'
      ' "CD_VERSAO" = :"CD_VERSAO"'
      ', "DT_VERSAO" = :"DT_VERSAO"'
      ', "CD_USUARIO" = :"CD_USUARIO"'
      ', "NM_USUARIO" = :"NM_USUARIO"'
      ', "DS_OBSERVACAO" = :"DS_OBSERVACAO"'
      ', "TP_RELATORIO" = :"TP_RELATORIO"'
      ', "NM_ARQUIVO" = :"NM_ARQUIVO"'
      ', "BL_RELATORIO" = :"BL_RELATORIO"'
      'where'
      '  "CD_VERSAO" = :"OLD_CD_VERSAO"')
    GeneratorField.Field = 'CD_VERSAO'
    GeneratorField.Generator = 'GEN_VERSAO_RELATORIO'
    Left = 880
    Top = 299
    object TB_VERSAO_RELATORIOCD_VERSAO: TIntegerField
      FieldName = 'CD_VERSAO'
      Origin = 'VERSAO_RELATORIO.CD_VERSAO'
      Required = True
    end
    object TB_VERSAO_RELATORIODT_VERSAO: TDateTimeField
      FieldName = 'DT_VERSAO'
      Origin = 'VERSAO_RELATORIO.DT_VERSAO'
    end
    object TB_VERSAO_RELATORIOCD_USUARIO: TIntegerField
      FieldName = 'CD_USUARIO'
      Origin = 'VERSAO_RELATORIO.CD_USUARIO'
    end
    object TB_VERSAO_RELATORIONM_USUARIO: TIBStringField
      FieldName = 'NM_USUARIO'
      Origin = 'VERSAO_RELATORIO.NM_USUARIO'
      Size = 100
    end
    object TB_VERSAO_RELATORIODS_OBSERVACAO: TIBStringField
      FieldName = 'DS_OBSERVACAO'
      Origin = 'VERSAO_RELATORIO.DS_OBSERVACAO'
      Size = 500
    end
    object TB_VERSAO_RELATORIOTP_RELATORIO: TIntegerField
      FieldName = 'TP_RELATORIO'
      Origin = 'VERSAO_RELATORIO.TP_RELATORIO'
    end
    object TB_VERSAO_RELATORIONM_ARQUIVO: TIBStringField
      FieldName = 'NM_ARQUIVO'
      Origin = 'VERSAO_RELATORIO.NM_ARQUIVO'
      Size = 100
    end
    object TB_VERSAO_RELATORIOBL_RELATORIO: TBlobField
      FieldName = 'BL_RELATORIO'
      Origin = 'VERSAO_RELATORIO.BL_RELATORIO'
      Size = 8
    end
  end
  object TB_CRIANCAS_EXP: TIBDataSet
    Database = DM.DB
    Transaction = DM.TS
    AfterInsert = TB_CRIANCAS_EXPAfterInsert
    BufferChunks = 1000
    CachedUpdates = False
    DeleteSQL.Strings = (
      'delete from "REGISTRO_CRIANCAS_EXP"'
      'where  "REGISTRO_CRIANCAS_EXP"."CD_UNIDADE" = :CD_UNIDADE'
      'and      "REGISTRO_CRIANCAS_EXP"."CD_PROVINCIA" = :CD_PROVINCIA'
      'and      "REGISTRO_CRIANCAS_EXP"."CD_MUNICIPIO" = :CD_MUNICIPIO'
      '')
    InsertSQL.Strings = (
      'insert into "REGISTRO_CRIANCAS_EXP"'
      '('
      '  "CD_REGISTRO_CRIANCAS_EXP"'
      ', "CD_UND"'
      ', "DT_REGISTRO"'
      ', "CD_UNIDADE"'
      ', "CD_PROVINCIA"'
      ', "CD_MUNICIPIO"'
      ', "VL_MESANO"'
      ', "VL_ANO"'
      ', "VL_GRAVIDAS"'
      ', "VL_CRI_POSITIVA"'
      ', "VL_CRI_NEGATIVA"'
      ', "VL_CRI_SEM_INFORMACAO"'
      ', "VL_X"'
      ', "VL_Y"'
      ', "DT_EXP"'
      ', "CD_EDI"'
      ', "CD_USU_INCLUSAO"'
      ', "DT_INCLUSAO"'
      ', "CD_USU_ALTERACAO"'
      ', "DT_ALTERACAO"'
      ', "CD_USU_EXCLUSAO"'
      ')'
      'values'
      '('
      '  :"CD_REGISTRO_CRIANCAS_EXP"'
      ', :"CD_UND"'
      ', :"DT_REGISTRO"'
      ', :"CD_UNIDADE"'
      ', :"CD_PROVINCIA"'
      ', :"CD_MUNICIPIO"'
      ', :"VL_MESANO"'
      ', :"VL_ANO"'
      ', :"VL_GRAVIDAS"'
      ', :"VL_CRI_POSITIVA"'
      ', :"VL_CRI_NEGATIVA"'
      ', :"VL_CRI_SEM_INFORMACAO"'
      ', :"VL_X"'
      ', :"VL_Y"'
      ', :"DT_EXP"'
      ', :"CD_EDI"'
      ', :"CD_USU_INCLUSAO"'
      ', :"DT_INCLUSAO"'
      ', :"CD_USU_ALTERACAO"'
      ', :"DT_ALTERACAO"'
      ', :"CD_USU_EXCLUSAO"'
      ')')
    SelectSQL.Strings = (
      'select "REGISTRO_CRIANCAS_EXP"."CD_REGISTRO_CRIANCAS_EXP"'
      '      ,"REGISTRO_CRIANCAS_EXP"."CD_UND"'
      '      ,"REGISTRO_CRIANCAS_EXP"."DT_REGISTRO"'
      '      ,"REGISTRO_CRIANCAS_EXP"."CD_UNIDADE"'
      '      ,"REGISTRO_CRIANCAS_EXP"."CD_PROVINCIA"'
      '      ,"REGISTRO_CRIANCAS_EXP"."CD_MUNICIPIO"'
      '      ,"REGISTRO_CRIANCAS_EXP"."VL_MESANO"'
      '      ,"REGISTRO_CRIANCAS_EXP"."VL_ANO"'
      '      ,"REGISTRO_CRIANCAS_EXP"."VL_GRAVIDAS"'
      '      ,"REGISTRO_CRIANCAS_EXP"."VL_CRI_POSITIVA"'
      '      ,"REGISTRO_CRIANCAS_EXP"."VL_CRI_NEGATIVA"'
      '      ,"REGISTRO_CRIANCAS_EXP"."VL_CRI_SEM_INFORMACAO"'
      '      ,"REGISTRO_CRIANCAS_EXP"."VL_X"'
      '      ,"REGISTRO_CRIANCAS_EXP"."VL_Y"'
      '      ,"REGISTRO_CRIANCAS_EXP"."DT_EXP"'
      '      ,"REGISTRO_CRIANCAS_EXP"."CD_EDI"'
      '      ,"REGISTRO_CRIANCAS_EXP"."CD_USU_INCLUSAO"'
      '      ,"REGISTRO_CRIANCAS_EXP"."DT_INCLUSAO"'
      '      ,"REGISTRO_CRIANCAS_EXP"."CD_USU_ALTERACAO"'
      '      ,"REGISTRO_CRIANCAS_EXP"."DT_ALTERACAO"'
      '      ,"REGISTRO_CRIANCAS_EXP"."CD_USU_EXCLUSAO"'
      'from "REGISTRO_CRIANCAS_EXP"'
      'where  "REGISTRO_CRIANCAS_EXP"."CD_UNIDADE" = :CD_UNIDADE'
      'and      "REGISTRO_CRIANCAS_EXP"."CD_PROVINCIA" = :CD_PROVINCIA'
      'and      "REGISTRO_CRIANCAS_EXP"."CD_MUNICIPIO" = :CD_MUNICIPIO')
    ModifySQL.Strings = (
      'update "REGISTRO_CRIANCAS_EXP"'
      'set'
      ' "CD_REGISTRO_CRIANCAS_EXP" = :"CD_REGISTRO_CRIANCAS_EXP"'
      ', "CD_UND" = :"CD_UND"'
      ', "DT_REGISTRO" = :"DT_REGISTRO"'
      ', "CD_UNIDADE" = :"CD_UNIDADE"'
      ', "CD_PROVINCIA" = :"CD_PROVINCIA"'
      ', "CD_MUNICIPIO" = :"CD_MUNICIPIO"'
      ', "VL_MESANO" = :"VL_MESANO"'
      ', "VL_ANO" = :"VL_ANO"'
      ', "VL_GRAVIDAS" = :"VL_GRAVIDAS"'
      ', "VL_CRI_POSITIVA" = :"VL_CRI_POSITIVA"'
      ', "VL_CRI_NEGATIVA" = :"VL_CRI_NEGATIVA"'
      ', "VL_CRI_SEM_INFORMACAO" = :"VL_CRI_SEM_INFORMACAO"'
      ', "VL_X" = :"VL_X"'
      ', "VL_Y" = :"VL_Y"'
      ', "DT_EXP" = :"DT_EXP"'
      ', "CD_EDI" = :"CD_EDI"'
      ', "CD_USU_INCLUSAO" = :"CD_USU_INCLUSAO"'
      ', "DT_INCLUSAO" = :"DT_INCLUSAO"'
      ', "CD_USU_ALTERACAO" = :"CD_USU_ALTERACAO"'
      ', "DT_ALTERACAO" = :"DT_ALTERACAO"'
      ', "CD_USU_EXCLUSAO" = :"CD_USU_EXCLUSAO"'
      'where'
      
        '  "CD_REGISTRO_CRIANCAS_EXP" = :"OLD_CD_REGISTRO_CRIANCAS_EXP" a' +
        'nd '
      '  "CD_UND" = :"OLD_CD_UND"')
    GeneratorField.Field = 'CD_REGISTRO_CRIANCAS_EXP'
    GeneratorField.Generator = 'GEN_REGISTRO_CRIANCAS_EXP'
    Left = 976
    Top = 243
    object TB_CRIANCAS_EXPCD_REGISTRO_CRIANCAS_EXP: TIntegerField
      FieldName = 'CD_REGISTRO_CRIANCAS_EXP'
      Origin = 'REGISTRO_CRIANCAS_EXP.CD_REGISTRO_CRIANCAS_EXP'
      Required = True
    end
    object TB_CRIANCAS_EXPCD_UND: TIntegerField
      FieldName = 'CD_UND'
      Origin = 'REGISTRO_CRIANCAS_EXP.CD_UND'
      Required = True
    end
    object TB_CRIANCAS_EXPDT_REGISTRO: TDateTimeField
      FieldName = 'DT_REGISTRO'
      Origin = 'REGISTRO_CRIANCAS_EXP.DT_REGISTRO'
      Required = True
    end
    object TB_CRIANCAS_EXPCD_UNIDADE: TIntegerField
      FieldName = 'CD_UNIDADE'
      Origin = 'REGISTRO_CRIANCAS_EXP.CD_UNIDADE'
      Required = True
    end
    object TB_CRIANCAS_EXPCD_PROVINCIA: TIntegerField
      FieldName = 'CD_PROVINCIA'
      Origin = 'REGISTRO_CRIANCAS_EXP.CD_PROVINCIA'
      Required = True
    end
    object TB_CRIANCAS_EXPCD_MUNICIPIO: TIntegerField
      FieldName = 'CD_MUNICIPIO'
      Origin = 'REGISTRO_CRIANCAS_EXP.CD_MUNICIPIO'
      Required = True
    end
    object TB_CRIANCAS_EXPVL_ANO: TIntegerField
      FieldName = 'VL_ANO'
      Origin = 'REGISTRO_CRIANCAS_EXP.VL_ANO'
    end
    object TB_CRIANCAS_EXPVL_GRAVIDAS: TIntegerField
      FieldName = 'VL_GRAVIDAS'
      Origin = 'REGISTRO_CRIANCAS_EXP.VL_GRAVIDAS'
    end
    object TB_CRIANCAS_EXPVL_CRI_POSITIVA: TIntegerField
      FieldName = 'VL_CRI_POSITIVA'
      Origin = 'REGISTRO_CRIANCAS_EXP.VL_CRI_POSITIVA'
    end
    object TB_CRIANCAS_EXPVL_CRI_NEGATIVA: TIntegerField
      FieldName = 'VL_CRI_NEGATIVA'
      Origin = 'REGISTRO_CRIANCAS_EXP.VL_CRI_NEGATIVA'
    end
    object TB_CRIANCAS_EXPVL_CRI_SEM_INFORMACAO: TIntegerField
      FieldName = 'VL_CRI_SEM_INFORMACAO'
      Origin = 'REGISTRO_CRIANCAS_EXP.VL_CRI_SEM_INFORMACAO'
    end
    object TB_CRIANCAS_EXPVL_X: TIntegerField
      FieldName = 'VL_X'
      Origin = 'REGISTRO_CRIANCAS_EXP.VL_X'
    end
    object TB_CRIANCAS_EXPVL_Y: TIntegerField
      FieldName = 'VL_Y'
      Origin = 'REGISTRO_CRIANCAS_EXP.VL_Y'
    end
    object TB_CRIANCAS_EXPDT_EXP: TDateTimeField
      FieldName = 'DT_EXP'
      Origin = 'REGISTRO_CRIANCAS_EXP.DT_EXP'
    end
    object TB_CRIANCAS_EXPCD_EDI: TIntegerField
      FieldName = 'CD_EDI'
      Origin = 'REGISTRO_CRIANCAS_EXP.CD_EDI'
    end
    object TB_CRIANCAS_EXPCD_USU_INCLUSAO: TIntegerField
      FieldName = 'CD_USU_INCLUSAO'
      Origin = 'REGISTRO_CRIANCAS_EXP.CD_USU_INCLUSAO'
    end
    object TB_CRIANCAS_EXPDT_INCLUSAO: TDateTimeField
      FieldName = 'DT_INCLUSAO'
      Origin = 'REGISTRO_CRIANCAS_EXP.DT_INCLUSAO'
    end
    object TB_CRIANCAS_EXPCD_USU_ALTERACAO: TIntegerField
      FieldName = 'CD_USU_ALTERACAO'
      Origin = 'REGISTRO_CRIANCAS_EXP.CD_USU_ALTERACAO'
    end
    object TB_CRIANCAS_EXPDT_ALTERACAO: TDateTimeField
      FieldName = 'DT_ALTERACAO'
      Origin = 'REGISTRO_CRIANCAS_EXP.DT_ALTERACAO'
    end
    object TB_CRIANCAS_EXPCD_USU_EXCLUSAO: TIntegerField
      FieldName = 'CD_USU_EXCLUSAO'
      Origin = 'REGISTRO_CRIANCAS_EXP.CD_USU_EXCLUSAO'
    end
  end
  object TB_PRE_NATAL: TIBDataSet
    Database = DM.DB
    Transaction = DM.TS
    AfterInsert = TB_PRE_NATALAfterInsert
    BufferChunks = 1000
    CachedUpdates = False
    DeleteSQL.Strings = (
      'delete from "REGISTRO_PRE_NATAL"'
      'where  "REGISTRO_PRE_NATAL"."CD_UNIDADE" = :CD_UNIDADE'
      'and      "REGISTRO_PRE_NATAL"."CD_PROVINCIA" = :CD_PROVINCIA'
      'and      "REGISTRO_PRE_NATAL"."CD_MUNICIPIO" = :CD_MUNICIPIO')
    InsertSQL.Strings = (
      'insert into "REGISTRO_PRE_NATAL"'
      '('
      '  "CD_REGISTRO_PRE_NATAL"'
      ', "CD_UND"'
      ', "DT_REGISTRO"'
      ', "CD_UNIDADE"'
      ', "CD_PROVINCIA"'
      ', "CD_MUNICIPIO"'
      ', "VL_MESANO"'
      ', "VL_ANO"'
      ', "VL_UNIDADE"'
      ', "VL_CPN_SEM_PTV"'
      ', "VL_CPN_COM_PTV"'
      ', "VL_AT"'
      ', "VL_TARV"'
      ', "VL_X"'
      ', "VL_Y"'
      ', "DT_EXP"'
      ', "CD_EDI"'
      ', "CD_USU_INCLUSAO"'
      ', "DT_INCLUSAO"'
      ', "CD_USU_ALTERACAO"'
      ', "DT_ALTERACAO"'
      ', "CD_USU_EXCLUSAO"'
      ')'
      'values'
      '('
      '  :"CD_REGISTRO_PRE_NATAL"'
      ', :"CD_UND"'
      ', :"DT_REGISTRO"'
      ', :"CD_UNIDADE"'
      ', :"CD_PROVINCIA"'
      ', :"CD_MUNICIPIO"'
      ', :"VL_MESANO"'
      ', :"VL_ANO"'
      ', :"VL_UNIDADE"'
      ', :"VL_CPN_SEM_PTV"'
      ', :"VL_CPN_COM_PTV"'
      ', :"VL_AT"'
      ', :"VL_TARV"'
      ', :"VL_X"'
      ', :"VL_Y"'
      ', :"DT_EXP"'
      ', :"CD_EDI"'
      ', :"CD_USU_INCLUSAO"'
      ', :"DT_INCLUSAO"'
      ', :"CD_USU_ALTERACAO"'
      ', :"DT_ALTERACAO"'
      ', :"CD_USU_EXCLUSAO"'
      ')')
    SelectSQL.Strings = (
      'select "REGISTRO_PRE_NATAL"."CD_REGISTRO_PRE_NATAL"'
      '      ,"REGISTRO_PRE_NATAL"."CD_UND"'
      '      ,"REGISTRO_PRE_NATAL"."DT_REGISTRO"'
      '      ,"REGISTRO_PRE_NATAL"."CD_UNIDADE"'
      '      ,"REGISTRO_PRE_NATAL"."CD_PROVINCIA"'
      '      ,"REGISTRO_PRE_NATAL"."CD_MUNICIPIO"'
      '      ,"REGISTRO_PRE_NATAL"."VL_MESANO"'
      '      ,"REGISTRO_PRE_NATAL"."VL_ANO"'
      '      ,"REGISTRO_PRE_NATAL"."VL_UNIDADE"'
      '      ,"REGISTRO_PRE_NATAL"."VL_CPN_SEM_PTV"'
      '      ,"REGISTRO_PRE_NATAL"."VL_CPN_COM_PTV"'
      '      ,"REGISTRO_PRE_NATAL"."VL_AT"'
      '      ,"REGISTRO_PRE_NATAL"."VL_TARV"'
      '      ,"REGISTRO_PRE_NATAL"."VL_X"'
      '      ,"REGISTRO_PRE_NATAL"."VL_Y"'
      '      ,"REGISTRO_PRE_NATAL"."DT_EXP"'
      '      ,"REGISTRO_PRE_NATAL"."CD_EDI"'
      '      ,"REGISTRO_PRE_NATAL"."CD_USU_INCLUSAO"'
      '      ,"REGISTRO_PRE_NATAL"."DT_INCLUSAO"'
      '      ,"REGISTRO_PRE_NATAL"."CD_USU_ALTERACAO"'
      '      ,"REGISTRO_PRE_NATAL"."DT_ALTERACAO"'
      '      ,"REGISTRO_PRE_NATAL"."CD_USU_EXCLUSAO"'
      'from "REGISTRO_PRE_NATAL"'
      'where  "REGISTRO_PRE_NATAL"."CD_UNIDADE" = :CD_UNIDADE'
      'and      "REGISTRO_PRE_NATAL"."CD_PROVINCIA" = :CD_PROVINCIA'
      'and      "REGISTRO_PRE_NATAL"."CD_MUNICIPIO" = :CD_MUNICIPIO')
    ModifySQL.Strings = (
      'update "REGISTRO_PRE_NATAL"'
      'set'
      ' "CD_REGISTRO_PRE_NATAL" = :"CD_REGISTRO_PRE_NATAL"'
      ', "CD_UND" = :"CD_UND"'
      ', "DT_REGISTRO" = :"DT_REGISTRO"'
      ', "CD_UNIDADE" = :"CD_UNIDADE"'
      ', "CD_PROVINCIA" = :"CD_PROVINCIA"'
      ', "CD_MUNICIPIO" = :"CD_MUNICIPIO"'
      ', "VL_MESANO" = :"VL_MESANO"'
      ', "VL_ANO" = :"VL_ANO"'
      ', "VL_UNIDADE" = :"VL_UNIDADE"'
      ', "VL_CPN_SEM_PTV" = :"VL_CPN_SEM_PTV"'
      ', "VL_CPN_COM_PTV" = :"VL_CPN_COM_PTV"'
      ', "VL_AT" = :"VL_AT"'
      ', "VL_TARV" = :"VL_TARV"'
      ', "VL_X" = :"VL_X"'
      ', "VL_Y" = :"VL_Y"'
      ', "DT_EXP" = :"DT_EXP"'
      ', "CD_EDI" = :"CD_EDI"'
      ', "CD_USU_INCLUSAO" = :"CD_USU_INCLUSAO"'
      ', "DT_INCLUSAO" = :"DT_INCLUSAO"'
      ', "CD_USU_ALTERACAO" = :"CD_USU_ALTERACAO"'
      ', "DT_ALTERACAO" = :"DT_ALTERACAO"'
      ', "CD_USU_EXCLUSAO" = :"CD_USU_EXCLUSAO"'
      'where'
      '  "CD_REGISTRO_PRE_NATAL" = :"OLD_CD_REGISTRO_PRE_NATAL" and '
      '  "CD_UND" = :"OLD_CD_UND"')
    GeneratorField.Field = 'CD_REGISTRO_PRE_NATAL'
    GeneratorField.Generator = 'GEN_REGISTRO_PRE_NATAL'
    Left = 976
    Top = 323
    object TB_PRE_NATALCD_REGISTRO_PRE_NATAL: TIntegerField
      FieldName = 'CD_REGISTRO_PRE_NATAL'
      Origin = 'REGISTRO_PRE_NATAL.CD_REGISTRO_PRE_NATAL'
      Required = True
    end
    object TB_PRE_NATALCD_UND: TIntegerField
      FieldName = 'CD_UND'
      Origin = 'REGISTRO_PRE_NATAL.CD_UND'
      Required = True
    end
    object TB_PRE_NATALDT_REGISTRO: TDateTimeField
      FieldName = 'DT_REGISTRO'
      Origin = 'REGISTRO_PRE_NATAL.DT_REGISTRO'
      Required = True
    end
    object TB_PRE_NATALCD_UNIDADE: TIntegerField
      FieldName = 'CD_UNIDADE'
      Origin = 'REGISTRO_PRE_NATAL.CD_UNIDADE'
      Required = True
    end
    object TB_PRE_NATALCD_PROVINCIA: TIntegerField
      FieldName = 'CD_PROVINCIA'
      Origin = 'REGISTRO_PRE_NATAL.CD_PROVINCIA'
      Required = True
    end
    object TB_PRE_NATALCD_MUNICIPIO: TIntegerField
      FieldName = 'CD_MUNICIPIO'
      Origin = 'REGISTRO_PRE_NATAL.CD_MUNICIPIO'
      Required = True
    end
    object TB_PRE_NATALVL_ANO: TIntegerField
      FieldName = 'VL_ANO'
      Origin = 'REGISTRO_PRE_NATAL.VL_ANO'
    end
    object TB_PRE_NATALVL_UNIDADE: TIntegerField
      FieldName = 'VL_UNIDADE'
      Origin = 'REGISTRO_PRE_NATAL.VL_UNIDADE'
    end
    object TB_PRE_NATALVL_CPN_SEM_PTV: TIntegerField
      FieldName = 'VL_CPN_SEM_PTV'
      Origin = 'REGISTRO_PRE_NATAL.VL_CPN_SEM_PTV'
    end
    object TB_PRE_NATALVL_CPN_COM_PTV: TIntegerField
      FieldName = 'VL_CPN_COM_PTV'
      Origin = 'REGISTRO_PRE_NATAL.VL_CPN_COM_PTV'
    end
    object TB_PRE_NATALVL_AT: TIntegerField
      FieldName = 'VL_AT'
      Origin = 'REGISTRO_PRE_NATAL.VL_AT'
    end
    object TB_PRE_NATALVL_TARV: TIntegerField
      FieldName = 'VL_TARV'
      Origin = 'REGISTRO_PRE_NATAL.VL_TARV'
    end
    object TB_PRE_NATALVL_X: TIntegerField
      FieldName = 'VL_X'
      Origin = 'REGISTRO_PRE_NATAL.VL_X'
    end
    object TB_PRE_NATALVL_Y: TIntegerField
      FieldName = 'VL_Y'
      Origin = 'REGISTRO_PRE_NATAL.VL_Y'
    end
    object TB_PRE_NATALDT_EXP: TDateTimeField
      FieldName = 'DT_EXP'
      Origin = 'REGISTRO_PRE_NATAL.DT_EXP'
    end
    object TB_PRE_NATALCD_EDI: TIntegerField
      FieldName = 'CD_EDI'
      Origin = 'REGISTRO_PRE_NATAL.CD_EDI'
    end
    object TB_PRE_NATALCD_USU_INCLUSAO: TIntegerField
      FieldName = 'CD_USU_INCLUSAO'
      Origin = 'REGISTRO_PRE_NATAL.CD_USU_INCLUSAO'
    end
    object TB_PRE_NATALDT_INCLUSAO: TDateTimeField
      FieldName = 'DT_INCLUSAO'
      Origin = 'REGISTRO_PRE_NATAL.DT_INCLUSAO'
    end
    object TB_PRE_NATALCD_USU_ALTERACAO: TIntegerField
      FieldName = 'CD_USU_ALTERACAO'
      Origin = 'REGISTRO_PRE_NATAL.CD_USU_ALTERACAO'
    end
    object TB_PRE_NATALDT_ALTERACAO: TDateTimeField
      FieldName = 'DT_ALTERACAO'
      Origin = 'REGISTRO_PRE_NATAL.DT_ALTERACAO'
    end
    object TB_PRE_NATALCD_USU_EXCLUSAO: TIntegerField
      FieldName = 'CD_USU_EXCLUSAO'
      Origin = 'REGISTRO_PRE_NATAL.CD_USU_EXCLUSAO'
    end
  end
  object TB_SERVICOS_ACOMP: TIBDataSet
    Database = DM.DB
    Transaction = DM.TS
    AfterInsert = TB_SERVICOS_ACOMPAfterInsert
    BufferChunks = 1000
    CachedUpdates = False
    DeleteSQL.Strings = (
      'delete from "REGISTRO_SERVICOS_ACOMP"'
      'where  "REGISTRO_SERVICOS_ACOMP"."CD_UNIDADE" = :CD_UNIDADE'
      
        'and      "REGISTRO_SERVICOS_ACOMP"."CD_PROVINCIA" = :CD_PROVINCI' +
        'A'
      
        'and      "REGISTRO_SERVICOS_ACOMP"."CD_MUNICIPIO" = :CD_MUNICIPI' +
        'O')
    InsertSQL.Strings = (
      'insert into "REGISTRO_SERVICOS_ACOMP"'
      '('
      '  "CD_REGISTRO_SERVICOS_ACOMP"'
      ', "CD_UND"'
      ', "DT_REGISTRO"'
      ', "CD_UNIDADE"'
      ', "CD_PROVINCIA"'
      ', "CD_MUNICIPIO"'
      ', "VL_MESANO"'
      ', "VL_ANO"'
      ', "VL_F_18"'
      ', "VL_M_18"'
      ', "VL_F_18X4"'
      ', "VL_M_18X4"'
      ', "VL_F_5X14"'
      ', "VL_M_5X14"'
      ', "VL_F_15X19"'
      ', "VL_M_15X19"'
      ', "VL_F_20X29"'
      ', "VL_M_20x29"'
      ', "VL_F_30x39"'
      ', "VL_M_30x99"'
      ', "VL_F_40x49"'
      ', "VL_M_40x49"'
      ', "VL_F_50x59"'
      ', "VL_M_50x59"'
      ', "VL_F_60"'
      ', "VL_M_60"'
      ', "VL_X"'
      ', "VL_Y"'
      ', "DT_EXP"'
      ', "CD_EDI"'
      ', "CD_USU_INCLUSAO"'
      ', "DT_INCLUSAO"'
      ', "CD_USU_ALTERACAO"'
      ', "DT_ALTERACAO"'
      ', "CD_USU_EXCLUSAO"'
      ')'
      'values'
      '('
      '  :"CD_REGISTRO_SERVICOS_ACOMP"'
      ', :"CD_UND"'
      ', :"DT_REGISTRO"'
      ', :"CD_UNIDADE"'
      ', :"CD_PROVINCIA"'
      ', :"CD_MUNICIPIO"'
      ', :"VL_MESANO"'
      ', :"VL_ANO"'
      ', :"VL_F_18"'
      ', :"VL_M_18"'
      ', :"VL_F_18X4"'
      ', :"VL_M_18X4"'
      ', :"VL_F_5X14"'
      ', :"VL_M_5X14"'
      ', :"VL_F_15X19"'
      ', :"VL_M_15X19"'
      ', :"VL_F_20X29"'
      ', :"VL_M_20x29"'
      ', :"VL_F_30x39"'
      ', :"VL_M_30x99"'
      ', :"VL_F_40x49"'
      ', :"VL_M_40x49"'
      ', :"VL_F_50x59"'
      ', :"VL_M_50x59"'
      ', :"VL_F_60"'
      ', :"VL_M_60"'
      ', :"VL_X"'
      ', :"VL_Y"'
      ', :"DT_EXP"'
      ', :"CD_EDI"'
      ', :"CD_USU_INCLUSAO"'
      ', :"DT_INCLUSAO"'
      ', :"CD_USU_ALTERACAO"'
      ', :"DT_ALTERACAO"'
      ', :"CD_USU_EXCLUSAO"'
      ')')
    SelectSQL.Strings = (
      'select "REGISTRO_SERVICOS_ACOMP"."CD_REGISTRO_SERVICOS_ACOMP"'
      '      ,"REGISTRO_SERVICOS_ACOMP"."CD_UND"'
      '      ,"REGISTRO_SERVICOS_ACOMP"."DT_REGISTRO"'
      '      ,"REGISTRO_SERVICOS_ACOMP"."CD_UNIDADE"'
      '      ,"REGISTRO_SERVICOS_ACOMP"."CD_PROVINCIA"'
      '      ,"REGISTRO_SERVICOS_ACOMP"."CD_MUNICIPIO"'
      '      ,"REGISTRO_SERVICOS_ACOMP"."VL_MESANO"'
      '      ,"REGISTRO_SERVICOS_ACOMP"."VL_ANO"'
      '      ,"REGISTRO_SERVICOS_ACOMP"."VL_F_18"'
      '      ,"REGISTRO_SERVICOS_ACOMP"."VL_M_18"'
      '      ,"REGISTRO_SERVICOS_ACOMP"."VL_F_18X4"'
      '      ,"REGISTRO_SERVICOS_ACOMP"."VL_M_18X4"'
      '      ,"REGISTRO_SERVICOS_ACOMP"."VL_F_5X14"'
      '      ,"REGISTRO_SERVICOS_ACOMP"."VL_M_5X14"'
      '      ,"REGISTRO_SERVICOS_ACOMP"."VL_F_15X19"'
      '      ,"REGISTRO_SERVICOS_ACOMP"."VL_M_15X19"'
      '      ,"REGISTRO_SERVICOS_ACOMP"."VL_F_20X29"'
      '      ,"REGISTRO_SERVICOS_ACOMP"."VL_M_20x29"'
      '      ,"REGISTRO_SERVICOS_ACOMP"."VL_F_30x39"'
      '      ,"REGISTRO_SERVICOS_ACOMP"."VL_M_30x99"'
      '      ,"REGISTRO_SERVICOS_ACOMP"."VL_F_40x49"'
      '      ,"REGISTRO_SERVICOS_ACOMP"."VL_M_40x49"'
      '      ,"REGISTRO_SERVICOS_ACOMP"."VL_F_50x59"'
      '      ,"REGISTRO_SERVICOS_ACOMP"."VL_M_50x59"'
      '      ,"REGISTRO_SERVICOS_ACOMP"."VL_F_60"'
      '      ,"REGISTRO_SERVICOS_ACOMP"."VL_M_60"'
      '      ,"REGISTRO_SERVICOS_ACOMP"."VL_X"'
      '      ,"REGISTRO_SERVICOS_ACOMP"."VL_Y"'
      '      ,"REGISTRO_SERVICOS_ACOMP"."DT_EXP"'
      '      ,"REGISTRO_SERVICOS_ACOMP"."CD_EDI"'
      '      ,"REGISTRO_SERVICOS_ACOMP"."CD_USU_INCLUSAO"'
      '      ,"REGISTRO_SERVICOS_ACOMP"."DT_INCLUSAO"'
      '      ,"REGISTRO_SERVICOS_ACOMP"."CD_USU_ALTERACAO"'
      '      ,"REGISTRO_SERVICOS_ACOMP"."DT_ALTERACAO"'
      '      ,"REGISTRO_SERVICOS_ACOMP"."CD_USU_EXCLUSAO"'
      'from "REGISTRO_SERVICOS_ACOMP"'
      'where  "REGISTRO_SERVICOS_ACOMP"."CD_UNIDADE" = :CD_UNIDADE'
      
        'and      "REGISTRO_SERVICOS_ACOMP"."CD_PROVINCIA" = :CD_PROVINCI' +
        'A'
      
        'and      "REGISTRO_SERVICOS_ACOMP"."CD_MUNICIPIO" = :CD_MUNICIPI' +
        'O')
    ModifySQL.Strings = (
      'update "REGISTRO_SERVICOS_ACOMP"'
      'set'
      ' "CD_REGISTRO_SERVICOS_ACOMP" = :"CD_REGISTRO_SERVICOS_ACOMP"'
      ', "CD_UND" = :"CD_UND"'
      ', "DT_REGISTRO" = :"DT_REGISTRO"'
      ', "CD_UNIDADE" = :"CD_UNIDADE"'
      ', "CD_PROVINCIA" = :"CD_PROVINCIA"'
      ', "CD_MUNICIPIO" = :"CD_MUNICIPIO"'
      ', "VL_MESANO" = :"VL_MESANO"'
      ', "VL_ANO" = :"VL_ANO"'
      ', "VL_F_18" = :"VL_F_18"'
      ', "VL_M_18" = :"VL_M_18"'
      ', "VL_F_18X4" = :"VL_F_18X4"'
      ', "VL_M_18X4" = :"VL_M_18X4"'
      ', "VL_F_5X14" = :"VL_F_5X14"'
      ', "VL_M_5X14" = :"VL_M_5X14"'
      ', "VL_F_15X19" = :"VL_F_15X19"'
      ', "VL_M_15X19" = :"VL_M_15X19"'
      ', "VL_F_20X29" = :"VL_F_20X29"'
      ', "VL_M_20x29" = :"VL_M_20x29"'
      ', "VL_F_30x39" = :"VL_F_30x39"'
      ', "VL_M_30x99" = :"VL_M_30x99"'
      ', "VL_F_40x49" = :"VL_F_40x49"'
      ', "VL_M_40x49" = :"VL_M_40x49"'
      ', "VL_F_50x59" = :"VL_F_50x59"'
      ', "VL_M_50x59" = :"VL_M_50x59"'
      ', "VL_F_60" = :"VL_F_60"'
      ', "VL_M_60" = :"VL_M_60"'
      ', "VL_X" = :"VL_X"'
      ', "VL_Y" = :"VL_Y"'
      ', "DT_EXP" = :"DT_EXP"'
      ', "CD_EDI" = :"CD_EDI"'
      ', "CD_USU_INCLUSAO" = :"CD_USU_INCLUSAO"'
      ', "DT_INCLUSAO" = :"DT_INCLUSAO"'
      ', "CD_USU_ALTERACAO" = :"CD_USU_ALTERACAO"'
      ', "DT_ALTERACAO" = :"DT_ALTERACAO"'
      ', "CD_USU_EXCLUSAO" = :"CD_USU_EXCLUSAO"'
      'where'
      
        '  "CD_REGISTRO_SERVICOS_ACOMP" = :"OLD_CD_REGISTRO_SERVICOS_ACOM' +
        'P" and '
      '  "CD_UND" = :"OLD_CD_UND"')
    GeneratorField.Field = 'CD_REGISTRO_SERVICOS_ACOMP'
    GeneratorField.Generator = 'GEN_REGISTRO_SERVICOS_ACOMP'
    Left = 961
    Top = 459
    object TB_SERVICOS_ACOMPCD_REGISTRO_SERVICOS_ACOMP: TIntegerField
      FieldName = 'CD_REGISTRO_SERVICOS_ACOMP'
      Origin = 'REGISTRO_SERVICOS_ACOMP.CD_REGISTRO_SERVICOS_ACOMP'
      Required = True
    end
    object TB_SERVICOS_ACOMPCD_UND: TIntegerField
      FieldName = 'CD_UND'
      Origin = 'REGISTRO_SERVICOS_ACOMP.CD_UND'
      Required = True
    end
    object TB_SERVICOS_ACOMPDT_REGISTRO: TDateTimeField
      FieldName = 'DT_REGISTRO'
      Origin = 'REGISTRO_SERVICOS_ACOMP.DT_REGISTRO'
      Required = True
    end
    object TB_SERVICOS_ACOMPCD_UNIDADE: TIntegerField
      FieldName = 'CD_UNIDADE'
      Origin = 'REGISTRO_SERVICOS_ACOMP.CD_UNIDADE'
      Required = True
    end
    object TB_SERVICOS_ACOMPCD_PROVINCIA: TIntegerField
      FieldName = 'CD_PROVINCIA'
      Origin = 'REGISTRO_SERVICOS_ACOMP.CD_PROVINCIA'
      Required = True
    end
    object TB_SERVICOS_ACOMPCD_MUNICIPIO: TIntegerField
      FieldName = 'CD_MUNICIPIO'
      Origin = 'REGISTRO_SERVICOS_ACOMP.CD_MUNICIPIO'
      Required = True
    end
    object TB_SERVICOS_ACOMPVL_ANO: TIntegerField
      FieldName = 'VL_ANO'
      Origin = 'REGISTRO_SERVICOS_ACOMP.VL_ANO'
    end
    object TB_SERVICOS_ACOMPVL_F_18: TIntegerField
      FieldName = 'VL_F_18'
      Origin = 'REGISTRO_SERVICOS_ACOMP.VL_F_18'
    end
    object TB_SERVICOS_ACOMPVL_M_18: TIntegerField
      FieldName = 'VL_M_18'
      Origin = 'REGISTRO_SERVICOS_ACOMP.VL_M_18'
    end
    object TB_SERVICOS_ACOMPVL_F_18X4: TIntegerField
      FieldName = 'VL_F_18X4'
      Origin = 'REGISTRO_SERVICOS_ACOMP.VL_F_18X4'
    end
    object TB_SERVICOS_ACOMPVL_M_18X4: TIntegerField
      FieldName = 'VL_M_18X4'
      Origin = 'REGISTRO_SERVICOS_ACOMP.VL_M_18X4'
    end
    object TB_SERVICOS_ACOMPVL_F_5X14: TIntegerField
      FieldName = 'VL_F_5X14'
      Origin = 'REGISTRO_SERVICOS_ACOMP.VL_F_5X14'
    end
    object TB_SERVICOS_ACOMPVL_M_5X14: TIntegerField
      FieldName = 'VL_M_5X14'
      Origin = 'REGISTRO_SERVICOS_ACOMP.VL_M_5X14'
    end
    object TB_SERVICOS_ACOMPVL_F_15X19: TIntegerField
      FieldName = 'VL_F_15X19'
      Origin = 'REGISTRO_SERVICOS_ACOMP.VL_F_15X19'
    end
    object TB_SERVICOS_ACOMPVL_M_15X19: TIntegerField
      FieldName = 'VL_M_15X19'
      Origin = 'REGISTRO_SERVICOS_ACOMP.VL_M_15X19'
    end
    object TB_SERVICOS_ACOMPVL_F_20X29: TIntegerField
      FieldName = 'VL_F_20X29'
      Origin = 'REGISTRO_SERVICOS_ACOMP.VL_F_20X29'
    end
    object TB_SERVICOS_ACOMPVL_M_20x29: TIntegerField
      FieldName = 'VL_M_20x29'
      Origin = 'REGISTRO_SERVICOS_ACOMP.VL_M_20x29'
    end
    object TB_SERVICOS_ACOMPVL_F_30x39: TIntegerField
      FieldName = 'VL_F_30x39'
      Origin = 'REGISTRO_SERVICOS_ACOMP.VL_F_30x39'
    end
    object TB_SERVICOS_ACOMPVL_M_30x99: TIntegerField
      FieldName = 'VL_M_30x99'
      Origin = 'REGISTRO_SERVICOS_ACOMP.VL_M_30x99'
    end
    object TB_SERVICOS_ACOMPVL_F_40x49: TIntegerField
      FieldName = 'VL_F_40x49'
      Origin = 'REGISTRO_SERVICOS_ACOMP.VL_F_40x49'
    end
    object TB_SERVICOS_ACOMPVL_M_40x49: TIntegerField
      FieldName = 'VL_M_40x49'
      Origin = 'REGISTRO_SERVICOS_ACOMP.VL_M_40x49'
    end
    object TB_SERVICOS_ACOMPVL_F_50x59: TIntegerField
      FieldName = 'VL_F_50x59'
      Origin = 'REGISTRO_SERVICOS_ACOMP.VL_F_50x59'
    end
    object TB_SERVICOS_ACOMPVL_M_50x59: TIntegerField
      FieldName = 'VL_M_50x59'
      Origin = 'REGISTRO_SERVICOS_ACOMP.VL_M_50x59'
    end
    object TB_SERVICOS_ACOMPVL_F_60: TIntegerField
      FieldName = 'VL_F_60'
      Origin = 'REGISTRO_SERVICOS_ACOMP.VL_F_60'
    end
    object TB_SERVICOS_ACOMPVL_M_60: TIntegerField
      FieldName = 'VL_M_60'
      Origin = 'REGISTRO_SERVICOS_ACOMP.VL_M_60'
    end
    object TB_SERVICOS_ACOMPVL_X: TIntegerField
      FieldName = 'VL_X'
      Origin = 'REGISTRO_SERVICOS_ACOMP.VL_X'
    end
    object TB_SERVICOS_ACOMPVL_Y: TIntegerField
      FieldName = 'VL_Y'
      Origin = 'REGISTRO_SERVICOS_ACOMP.VL_Y'
    end
    object TB_SERVICOS_ACOMPDT_EXP: TDateTimeField
      FieldName = 'DT_EXP'
      Origin = 'REGISTRO_SERVICOS_ACOMP.DT_EXP'
    end
    object TB_SERVICOS_ACOMPCD_EDI: TIntegerField
      FieldName = 'CD_EDI'
      Origin = 'REGISTRO_SERVICOS_ACOMP.CD_EDI'
    end
    object TB_SERVICOS_ACOMPCD_USU_INCLUSAO: TIntegerField
      FieldName = 'CD_USU_INCLUSAO'
      Origin = 'REGISTRO_SERVICOS_ACOMP.CD_USU_INCLUSAO'
    end
    object TB_SERVICOS_ACOMPDT_INCLUSAO: TDateTimeField
      FieldName = 'DT_INCLUSAO'
      Origin = 'REGISTRO_SERVICOS_ACOMP.DT_INCLUSAO'
    end
    object TB_SERVICOS_ACOMPCD_USU_ALTERACAO: TIntegerField
      FieldName = 'CD_USU_ALTERACAO'
      Origin = 'REGISTRO_SERVICOS_ACOMP.CD_USU_ALTERACAO'
    end
    object TB_SERVICOS_ACOMPDT_ALTERACAO: TDateTimeField
      FieldName = 'DT_ALTERACAO'
      Origin = 'REGISTRO_SERVICOS_ACOMP.DT_ALTERACAO'
    end
    object TB_SERVICOS_ACOMPCD_USU_EXCLUSAO: TIntegerField
      FieldName = 'CD_USU_EXCLUSAO'
      Origin = 'REGISTRO_SERVICOS_ACOMP.CD_USU_EXCLUSAO'
    end
  end
  object TB_SERVICOS_TARV: TIBDataSet
    Database = DM.DB
    Transaction = DM.TS
    AfterInsert = TB_SERVICOS_TARVAfterInsert
    BufferChunks = 1000
    CachedUpdates = False
    DeleteSQL.Strings = (
      'delete from "REGISTRO_SERVICOS_TARV"'
      'where  "REGISTRO_SERVICOS_TARV"."CD_UNIDADE" = :CD_UNIDADE'
      'and      "REGISTRO_SERVICOS_TARV"."CD_PROVINCIA" = :CD_PROVINCIA'
      'and      "REGISTRO_SERVICOS_TARV"."CD_MUNICIPIO" = :CD_MUNICIPIO')
    InsertSQL.Strings = (
      'insert into "REGISTRO_SERVICOS_TARV"'
      '('
      '  "CD_REGISTRO_SERVICOS_TARV"'
      ', "CD_UND"'
      ', "DT_REGISTRO"'
      ', "CD_UNIDADE"'
      ', "CD_PROVINCIA"'
      ', "CD_MUNICIPIO"'
      ', "VL_MESANO"'
      ', "VL_ANO"'
      ', "VL_F_18"'
      ', "VL_M_18"'
      ', "VL_F_18X4"'
      ', "VL_M_18X4"'
      ', "VL_F_5X14"'
      ', "VL_M_5X14"'
      ', "VL_F_15X19"'
      ', "VL_M_15X19"'
      ', "VL_F_20X29"'
      ', "VL_M_20x29"'
      ', "VL_F_30x39"'
      ', "VL_M_30x99"'
      ', "VL_F_40x49"'
      ', "VL_M_40x49"'
      ', "VL_F_50x59"'
      ', "VL_M_50x59"'
      ', "VL_F_60"'
      ', "VL_M_60"'
      ', "VL_X"'
      ', "VL_Y"'
      ', "DT_EXP"'
      ', "CD_EDI"'
      ', "CD_USU_INCLUSAO"'
      ', "DT_INCLUSAO"'
      ', "CD_USU_ALTERACAO"'
      ', "DT_ALTERACAO"'
      ', "CD_USU_EXCLUSAO"'
      ')'
      'values'
      '('
      '  :"CD_REGISTRO_SERVICOS_TARV"'
      ', :"CD_UND"'
      ', :"DT_REGISTRO"'
      ', :"CD_UNIDADE"'
      ', :"CD_PROVINCIA"'
      ', :"CD_MUNICIPIO"'
      ', :"VL_MESANO"'
      ', :"VL_ANO"'
      ', :"VL_F_18"'
      ', :"VL_M_18"'
      ', :"VL_F_18X4"'
      ', :"VL_M_18X4"'
      ', :"VL_F_5X14"'
      ', :"VL_M_5X14"'
      ', :"VL_F_15X19"'
      ', :"VL_M_15X19"'
      ', :"VL_F_20X29"'
      ', :"VL_M_20x29"'
      ', :"VL_F_30x39"'
      ', :"VL_M_30x99"'
      ', :"VL_F_40x49"'
      ', :"VL_M_40x49"'
      ', :"VL_F_50x59"'
      ', :"VL_M_50x59"'
      ', :"VL_F_60"'
      ', :"VL_M_60"'
      ', :"VL_X"'
      ', :"VL_Y"'
      ', :"DT_EXP"'
      ', :"CD_EDI"'
      ', :"CD_USU_INCLUSAO"'
      ', :"DT_INCLUSAO"'
      ', :"CD_USU_ALTERACAO"'
      ', :"DT_ALTERACAO"'
      ', :"CD_USU_EXCLUSAO"'
      ')')
    SelectSQL.Strings = (
      'select "REGISTRO_SERVICOS_TARV"."CD_REGISTRO_SERVICOS_TARV"'
      '      ,"REGISTRO_SERVICOS_TARV"."CD_UND"'
      '      ,"REGISTRO_SERVICOS_TARV"."DT_REGISTRO"'
      '      ,"REGISTRO_SERVICOS_TARV"."CD_UNIDADE"'
      '      ,"REGISTRO_SERVICOS_TARV"."CD_PROVINCIA"'
      '      ,"REGISTRO_SERVICOS_TARV"."CD_MUNICIPIO"'
      '      ,"REGISTRO_SERVICOS_TARV"."VL_MESANO"'
      '      ,"REGISTRO_SERVICOS_TARV"."VL_ANO"'
      '      ,"REGISTRO_SERVICOS_TARV"."VL_F_18"'
      '      ,"REGISTRO_SERVICOS_TARV"."VL_M_18"'
      '      ,"REGISTRO_SERVICOS_TARV"."VL_F_18X4"'
      '      ,"REGISTRO_SERVICOS_TARV"."VL_M_18X4"'
      '      ,"REGISTRO_SERVICOS_TARV"."VL_F_5X14"'
      '      ,"REGISTRO_SERVICOS_TARV"."VL_M_5X14"'
      '      ,"REGISTRO_SERVICOS_TARV"."VL_F_15X19"'
      '      ,"REGISTRO_SERVICOS_TARV"."VL_M_15X19"'
      '      ,"REGISTRO_SERVICOS_TARV"."VL_F_20X29"'
      '      ,"REGISTRO_SERVICOS_TARV"."VL_M_20x29"'
      '      ,"REGISTRO_SERVICOS_TARV"."VL_F_30x39"'
      '      ,"REGISTRO_SERVICOS_TARV"."VL_M_30x99"'
      '      ,"REGISTRO_SERVICOS_TARV"."VL_F_40x49"'
      '      ,"REGISTRO_SERVICOS_TARV"."VL_M_40x49"'
      '      ,"REGISTRO_SERVICOS_TARV"."VL_F_50x59"'
      '      ,"REGISTRO_SERVICOS_TARV"."VL_M_50x59"'
      '      ,"REGISTRO_SERVICOS_TARV"."VL_F_60"'
      '      ,"REGISTRO_SERVICOS_TARV"."VL_M_60"'
      '      ,"REGISTRO_SERVICOS_TARV"."VL_X"'
      '      ,"REGISTRO_SERVICOS_TARV"."VL_Y"'
      '      ,"REGISTRO_SERVICOS_TARV"."DT_EXP"'
      '      ,"REGISTRO_SERVICOS_TARV"."CD_EDI"'
      '      ,"REGISTRO_SERVICOS_TARV"."CD_USU_INCLUSAO"'
      '      ,"REGISTRO_SERVICOS_TARV"."DT_INCLUSAO"'
      '      ,"REGISTRO_SERVICOS_TARV"."CD_USU_ALTERACAO"'
      '      ,"REGISTRO_SERVICOS_TARV"."DT_ALTERACAO"'
      '      ,"REGISTRO_SERVICOS_TARV"."CD_USU_EXCLUSAO"'
      'from "REGISTRO_SERVICOS_TARV"'
      'where  "REGISTRO_SERVICOS_TARV"."CD_UNIDADE" = :CD_UNIDADE'
      'and      "REGISTRO_SERVICOS_TARV"."CD_PROVINCIA" = :CD_PROVINCIA'
      'and      "REGISTRO_SERVICOS_TARV"."CD_MUNICIPIO" = :CD_MUNICIPIO')
    ModifySQL.Strings = (
      'update "REGISTRO_SERVICOS_TARV"'
      'set'
      ' "CD_REGISTRO_SERVICOS_TARV" = :"CD_REGISTRO_SERVICOS_TARV"'
      ', "CD_UND" = :"CD_UND"'
      ', "DT_REGISTRO" = :"DT_REGISTRO"'
      ', "CD_UNIDADE" = :"CD_UNIDADE"'
      ', "CD_PROVINCIA" = :"CD_PROVINCIA"'
      ', "CD_MUNICIPIO" = :"CD_MUNICIPIO"'
      ', "VL_MESANO" = :"VL_MESANO"'
      ', "VL_ANO" = :"VL_ANO"'
      ', "VL_F_18" = :"VL_F_18"'
      ', "VL_M_18" = :"VL_M_18"'
      ', "VL_F_18X4" = :"VL_F_18X4"'
      ', "VL_M_18X4" = :"VL_M_18X4"'
      ', "VL_F_5X14" = :"VL_F_5X14"'
      ', "VL_M_5X14" = :"VL_M_5X14"'
      ', "VL_F_15X19" = :"VL_F_15X19"'
      ', "VL_M_15X19" = :"VL_M_15X19"'
      ', "VL_F_20X29" = :"VL_F_20X29"'
      ', "VL_M_20x29" = :"VL_M_20x29"'
      ', "VL_F_30x39" = :"VL_F_30x39"'
      ', "VL_M_30x99" = :"VL_M_30x99"'
      ', "VL_F_40x49" = :"VL_F_40x49"'
      ', "VL_M_40x49" = :"VL_M_40x49"'
      ', "VL_F_50x59" = :"VL_F_50x59"'
      ', "VL_M_50x59" = :"VL_M_50x59"'
      ', "VL_F_60" = :"VL_F_60"'
      ', "VL_M_60" = :"VL_M_60"'
      ', "VL_X" = :"VL_X"'
      ', "VL_Y" = :"VL_Y"'
      ', "DT_EXP" = :"DT_EXP"'
      ', "CD_EDI" = :"CD_EDI"'
      ', "CD_USU_INCLUSAO" = :"CD_USU_INCLUSAO"'
      ', "DT_INCLUSAO" = :"DT_INCLUSAO"'
      ', "CD_USU_ALTERACAO" = :"CD_USU_ALTERACAO"'
      ', "DT_ALTERACAO" = :"DT_ALTERACAO"'
      ', "CD_USU_EXCLUSAO" = :"CD_USU_EXCLUSAO"'
      'where'
      
        '  "CD_REGISTRO_SERVICOS_TARV" = :"OLD_CD_REGISTRO_SERVICOS_TARV"' +
        ' and '
      '  "CD_UND" = :"OLD_CD_UND"')
    GeneratorField.Field = 'CD_REGISTRO_SERVICOS_TARV'
    GeneratorField.Generator = 'GEN_REGISTRO_SERVICOS_TARV'
    Left = 968
    Top = 387
    object TB_SERVICOS_TARVCD_REGISTRO_SERVICOS_TARV: TIntegerField
      FieldName = 'CD_REGISTRO_SERVICOS_TARV'
      Origin = 'REGISTRO_SERVICOS_TARV.CD_REGISTRO_SERVICOS_TARV'
      Required = True
    end
    object TB_SERVICOS_TARVCD_UND: TIntegerField
      FieldName = 'CD_UND'
      Origin = 'REGISTRO_SERVICOS_TARV.CD_UND'
      Required = True
    end
    object TB_SERVICOS_TARVDT_REGISTRO: TDateTimeField
      FieldName = 'DT_REGISTRO'
      Origin = 'REGISTRO_SERVICOS_TARV.DT_REGISTRO'
      Required = True
    end
    object TB_SERVICOS_TARVCD_UNIDADE: TIntegerField
      FieldName = 'CD_UNIDADE'
      Origin = 'REGISTRO_SERVICOS_TARV.CD_UNIDADE'
      Required = True
    end
    object TB_SERVICOS_TARVCD_PROVINCIA: TIntegerField
      FieldName = 'CD_PROVINCIA'
      Origin = 'REGISTRO_SERVICOS_TARV.CD_PROVINCIA'
      Required = True
    end
    object TB_SERVICOS_TARVCD_MUNICIPIO: TIntegerField
      FieldName = 'CD_MUNICIPIO'
      Origin = 'REGISTRO_SERVICOS_TARV.CD_MUNICIPIO'
      Required = True
    end
    object TB_SERVICOS_TARVVL_ANO: TIntegerField
      FieldName = 'VL_ANO'
      Origin = 'REGISTRO_SERVICOS_TARV.VL_ANO'
    end
    object TB_SERVICOS_TARVVL_F_18: TIntegerField
      FieldName = 'VL_F_18'
      Origin = 'REGISTRO_SERVICOS_TARV.VL_F_18'
    end
    object TB_SERVICOS_TARVVL_M_18: TIntegerField
      FieldName = 'VL_M_18'
      Origin = 'REGISTRO_SERVICOS_TARV.VL_M_18'
    end
    object TB_SERVICOS_TARVVL_F_18X4: TIntegerField
      FieldName = 'VL_F_18X4'
      Origin = 'REGISTRO_SERVICOS_TARV.VL_F_18X4'
    end
    object TB_SERVICOS_TARVVL_M_18X4: TIntegerField
      FieldName = 'VL_M_18X4'
      Origin = 'REGISTRO_SERVICOS_TARV.VL_M_18X4'
    end
    object TB_SERVICOS_TARVVL_F_5X14: TIntegerField
      FieldName = 'VL_F_5X14'
      Origin = 'REGISTRO_SERVICOS_TARV.VL_F_5X14'
    end
    object TB_SERVICOS_TARVVL_M_5X14: TIntegerField
      FieldName = 'VL_M_5X14'
      Origin = 'REGISTRO_SERVICOS_TARV.VL_M_5X14'
    end
    object TB_SERVICOS_TARVVL_F_15X19: TIntegerField
      FieldName = 'VL_F_15X19'
      Origin = 'REGISTRO_SERVICOS_TARV.VL_F_15X19'
    end
    object TB_SERVICOS_TARVVL_M_15X19: TIntegerField
      FieldName = 'VL_M_15X19'
      Origin = 'REGISTRO_SERVICOS_TARV.VL_M_15X19'
    end
    object TB_SERVICOS_TARVVL_F_20X29: TIntegerField
      FieldName = 'VL_F_20X29'
      Origin = 'REGISTRO_SERVICOS_TARV.VL_F_20X29'
    end
    object TB_SERVICOS_TARVVL_M_20x29: TIntegerField
      FieldName = 'VL_M_20x29'
      Origin = 'REGISTRO_SERVICOS_TARV.VL_M_20x29'
    end
    object TB_SERVICOS_TARVVL_F_30x39: TIntegerField
      FieldName = 'VL_F_30x39'
      Origin = 'REGISTRO_SERVICOS_TARV.VL_F_30x39'
    end
    object TB_SERVICOS_TARVVL_M_30x99: TIntegerField
      FieldName = 'VL_M_30x99'
      Origin = 'REGISTRO_SERVICOS_TARV.VL_M_30x99'
    end
    object TB_SERVICOS_TARVVL_F_40x49: TIntegerField
      FieldName = 'VL_F_40x49'
      Origin = 'REGISTRO_SERVICOS_TARV.VL_F_40x49'
    end
    object TB_SERVICOS_TARVVL_M_40x49: TIntegerField
      FieldName = 'VL_M_40x49'
      Origin = 'REGISTRO_SERVICOS_TARV.VL_M_40x49'
    end
    object TB_SERVICOS_TARVVL_F_50x59: TIntegerField
      FieldName = 'VL_F_50x59'
      Origin = 'REGISTRO_SERVICOS_TARV.VL_F_50x59'
    end
    object TB_SERVICOS_TARVVL_M_50x59: TIntegerField
      FieldName = 'VL_M_50x59'
      Origin = 'REGISTRO_SERVICOS_TARV.VL_M_50x59'
    end
    object TB_SERVICOS_TARVVL_F_60: TIntegerField
      FieldName = 'VL_F_60'
      Origin = 'REGISTRO_SERVICOS_TARV.VL_F_60'
    end
    object TB_SERVICOS_TARVVL_M_60: TIntegerField
      FieldName = 'VL_M_60'
      Origin = 'REGISTRO_SERVICOS_TARV.VL_M_60'
    end
    object TB_SERVICOS_TARVVL_X: TIntegerField
      FieldName = 'VL_X'
      Origin = 'REGISTRO_SERVICOS_TARV.VL_X'
    end
    object TB_SERVICOS_TARVVL_Y: TIntegerField
      FieldName = 'VL_Y'
      Origin = 'REGISTRO_SERVICOS_TARV.VL_Y'
    end
    object TB_SERVICOS_TARVDT_EXP: TDateTimeField
      FieldName = 'DT_EXP'
      Origin = 'REGISTRO_SERVICOS_TARV.DT_EXP'
    end
    object TB_SERVICOS_TARVCD_EDI: TIntegerField
      FieldName = 'CD_EDI'
      Origin = 'REGISTRO_SERVICOS_TARV.CD_EDI'
    end
    object TB_SERVICOS_TARVCD_USU_INCLUSAO: TIntegerField
      FieldName = 'CD_USU_INCLUSAO'
      Origin = 'REGISTRO_SERVICOS_TARV.CD_USU_INCLUSAO'
    end
    object TB_SERVICOS_TARVDT_INCLUSAO: TDateTimeField
      FieldName = 'DT_INCLUSAO'
      Origin = 'REGISTRO_SERVICOS_TARV.DT_INCLUSAO'
    end
    object TB_SERVICOS_TARVCD_USU_ALTERACAO: TIntegerField
      FieldName = 'CD_USU_ALTERACAO'
      Origin = 'REGISTRO_SERVICOS_TARV.CD_USU_ALTERACAO'
    end
    object TB_SERVICOS_TARVDT_ALTERACAO: TDateTimeField
      FieldName = 'DT_ALTERACAO'
      Origin = 'REGISTRO_SERVICOS_TARV.DT_ALTERACAO'
    end
    object TB_SERVICOS_TARVCD_USU_EXCLUSAO: TIntegerField
      FieldName = 'CD_USU_EXCLUSAO'
      Origin = 'REGISTRO_SERVICOS_TARV.CD_USU_EXCLUSAO'
    end
  end
  object TB_PROTOCOLO_ENVIO: TIBDataSet
    Database = DM.DB
    Transaction = DM.TS
    BufferChunks = 1000
    CachedUpdates = False
    DeleteSQL.Strings = (
      'delete from "PROTOCOLO_ENVIO"'
      'where'
      '  "CD_PROTOCOLO" = :"OLD_CD_PROTOCOLO" and '
      '  "CD_UND" = :"OLD_CD_UND"')
    InsertSQL.Strings = (
      'insert into "PROTOCOLO_ENVIO"'
      '('
      '  "CD_PROTOCOLO"'
      ', "CD_UND"'
      ', "TP_PROTOCOLO"'
      ', "CD_UNIDADE"'
      ', "CD_PROVINCIA"'
      ', "CD_MUNICIPIO"'
      ', "VL_MESANO"'
      ', "BL_PROTOCOLO"'
      ', "DT_EXP"'
      ', "CD_EDI"'
      ', "CD_USU_INCLUSAO"'
      ', "DT_INCLUSAO"'
      ', "CD_USU_ALTERACAO"'
      ', "DT_ALTERACAO"'
      ', "CD_USU_EXCLUSAO"'
      ', "DT_EXCLUSAO"'
      ', "FL_ENVIADO"'
      ', "CD_REGISTRO_GERAL"'
      ', "FL_ACEITAR"'
      ', "FL_IMPORTADO"'
      ', "CD_ARQUIVO"'
      ')'
      'values'
      '('
      '  :"CD_PROTOCOLO"'
      ', :"CD_UND"'
      ', :"TP_PROTOCOLO"'
      ', :"CD_UNIDADE"'
      ', :"CD_PROVINCIA"'
      ', :"CD_MUNICIPIO"'
      ', :"VL_MESANO"'
      ', :"BL_PROTOCOLO"'
      ', :"DT_EXP"'
      ', :"CD_EDI"'
      ', :"CD_USU_INCLUSAO"'
      ', :"DT_INCLUSAO"'
      ', :"CD_USU_ALTERACAO"'
      ', :"DT_ALTERACAO"'
      ', :"CD_USU_EXCLUSAO"'
      ', :"DT_EXCLUSAO"'
      ', :"FL_ENVIADO"'
      ', :"CD_REGISTRO_GERAL"'
      ', :"FL_ACEITAR"'
      ', :"FL_IMPORTADO"'
      ', :"CD_ARQUIVO"'
      ')')
    SelectSQL.Strings = (
      'select "PROTOCOLO_ENVIO"."CD_PROTOCOLO"'
      '      ,"PROTOCOLO_ENVIO"."CD_UND"'
      '      ,"PROTOCOLO_ENVIO"."TP_PROTOCOLO"'
      '      ,"PROTOCOLO_ENVIO"."CD_UNIDADE"'
      '      ,"PROTOCOLO_ENVIO"."CD_PROVINCIA"'
      '      ,"PROTOCOLO_ENVIO"."CD_MUNICIPIO"'
      '      ,"PROTOCOLO_ENVIO"."VL_MESANO"'
      '      ,"PROTOCOLO_ENVIO"."BL_PROTOCOLO"'
      '      ,"PROTOCOLO_ENVIO"."FL_ENVIADO"'
      '      ,"PROTOCOLO_ENVIO"."FL_ACEITAR"'
      '      ,"PROTOCOLO_ENVIO"."DT_EXP"'
      '      ,"PROTOCOLO_ENVIO"."CD_EDI"'
      '      ,"PROTOCOLO_ENVIO"."CD_REGISTRO_GERAL"'
      '      ,"PROTOCOLO_ENVIO"."CD_USU_INCLUSAO"'
      '      ,"PROTOCOLO_ENVIO"."DT_INCLUSAO"'
      '      ,"PROTOCOLO_ENVIO"."CD_USU_ALTERACAO"'
      '      ,"PROTOCOLO_ENVIO"."DT_ALTERACAO"'
      '      ,"PROTOCOLO_ENVIO"."CD_USU_EXCLUSAO"'
      '      ,"PROTOCOLO_ENVIO"."DT_EXCLUSAO"'
      '      ,"PROTOCOLO_ENVIO"."FL_IMPORTADO"'
      '      ,"PROTOCOLO_ENVIO"."CD_ARQUIVO"'
      '      ,U.DS_UNIDADE'
      '      ,M.DS_MUNICIPIO'
      '      ,P.DS_PROVINCIA'
      'from "PROTOCOLO_ENVIO"'
      '    left outer join MUNICIPIO M on'
      '      PROTOCOLO_ENVIO.CD_MUNICIPIO = M.CD_MUNICIPIO'
      '    left outer join PROVINCIA P on'
      '      PROTOCOLO_ENVIO.CD_PROVINCIA = P.CD_PROVINCIA'
      '    left outer join UNIDADE U on '
      '      PROTOCOLO_ENVIO.CD_UNIDADE = U.CD_UNIDADE'
      'where  PROTOCOLO_ENVIO.CD_UNIDADE = :CD_UNIDADE'
      'and     PROTOCOLO_ENVIO.CD_PROVINCIA = :CD_PROVINCIA'
      'and     PROTOCOLO_ENVIO.CD_MUNICIPIO = :CD_MUNICIPIO'
      'and     PROTOCOLO_ENVIO.VL_MESANO = :VL_MESANO'
      'and     PROTOCOLO_ENVIO.TP_PROTOCOLO = :TP_PROTOCOLO')
    ModifySQL.Strings = (
      'update "PROTOCOLO_ENVIO"'
      'set'
      ' "CD_PROTOCOLO" = :"CD_PROTOCOLO"'
      ', "CD_UND" = :"CD_UND"'
      ', "TP_PROTOCOLO" = :"TP_PROTOCOLO"'
      ', "CD_UNIDADE" = :"CD_UNIDADE"'
      ', "CD_PROVINCIA" = :"CD_PROVINCIA"'
      ', "CD_MUNICIPIO" = :"CD_MUNICIPIO"'
      ', "VL_MESANO" = :"VL_MESANO"'
      ', "BL_PROTOCOLO" = :"BL_PROTOCOLO"'
      ', "DT_EXP" = :"DT_EXP"'
      ', "CD_EDI" = :"CD_EDI"'
      ', "CD_USU_INCLUSAO" = :"CD_USU_INCLUSAO"'
      ', "DT_INCLUSAO" = :"DT_INCLUSAO"'
      ', "CD_USU_ALTERACAO" = :"CD_USU_ALTERACAO"'
      ', "DT_ALTERACAO" = :"DT_ALTERACAO"'
      ', "CD_USU_EXCLUSAO" = :"CD_USU_EXCLUSAO"'
      ', "DT_EXCLUSAO" = :"DT_EXCLUSAO"'
      ', "FL_ENVIADO" = :"FL_ENVIADO"'
      ', "CD_REGISTRO_GERAL" = :"CD_REGISTRO_GERAL"'
      ', "FL_ACEITAR" = :"FL_ACEITAR"'
      ', "FL_IMPORTADO" = :"FL_IMPORTADO"'
      ', "CD_ARQUIVO" = :"CD_ARQUIVO"'
      'where'
      '  "CD_PROTOCOLO" = :"OLD_CD_PROTOCOLO" and '
      '  "CD_UND" = :"OLD_CD_UND"')
    GeneratorField.Field = 'CD_PROTOCOLO'
    GeneratorField.Generator = 'GEN_PROTOCOLO_ENVIO'
    Left = 968
    Top = 587
    object TB_PROTOCOLO_ENVIOCD_PROTOCOLO: TIntegerField
      FieldName = 'CD_PROTOCOLO'
      Origin = 'PROTOCOLO_ENVIO.CD_PROTOCOLO'
      Required = True
    end
    object TB_PROTOCOLO_ENVIOCD_UND: TIntegerField
      FieldName = 'CD_UND'
      Origin = 'PROTOCOLO_ENVIO.CD_UND'
      Required = True
    end
    object TB_PROTOCOLO_ENVIOTP_PROTOCOLO: TIntegerField
      FieldName = 'TP_PROTOCOLO'
      Origin = 'PROTOCOLO_ENVIO.TP_PROTOCOLO'
      Required = True
    end
    object TB_PROTOCOLO_ENVIOCD_UNIDADE: TIntegerField
      FieldName = 'CD_UNIDADE'
      Origin = 'PROTOCOLO_ENVIO.CD_UNIDADE'
      Required = True
    end
    object TB_PROTOCOLO_ENVIOCD_PROVINCIA: TIntegerField
      FieldName = 'CD_PROVINCIA'
      Origin = 'PROTOCOLO_ENVIO.CD_PROVINCIA'
      Required = True
    end
    object TB_PROTOCOLO_ENVIOCD_MUNICIPIO: TIntegerField
      FieldName = 'CD_MUNICIPIO'
      Origin = 'PROTOCOLO_ENVIO.CD_MUNICIPIO'
      Required = True
    end
    object TB_PROTOCOLO_ENVIOVL_MESANO: TIBStringField
      FieldName = 'VL_MESANO'
      Origin = 'PROTOCOLO_ENVIO.VL_MESANO'
      Required = True
      Size = 8
    end
    object TB_PROTOCOLO_ENVIOBL_PROTOCOLO: TBlobField
      FieldName = 'BL_PROTOCOLO'
      Origin = 'PROTOCOLO_ENVIO.BL_PROTOCOLO'
      Size = 8
    end
    object TB_PROTOCOLO_ENVIODT_EXP: TDateTimeField
      FieldName = 'DT_EXP'
      Origin = 'PROTOCOLO_ENVIO.DT_EXP'
    end
    object TB_PROTOCOLO_ENVIOCD_EDI: TIntegerField
      FieldName = 'CD_EDI'
      Origin = 'PROTOCOLO_ENVIO.CD_EDI'
    end
    object TB_PROTOCOLO_ENVIOCD_USU_INCLUSAO: TIntegerField
      FieldName = 'CD_USU_INCLUSAO'
      Origin = 'PROTOCOLO_ENVIO.CD_USU_INCLUSAO'
    end
    object TB_PROTOCOLO_ENVIODT_INCLUSAO: TDateTimeField
      FieldName = 'DT_INCLUSAO'
      Origin = 'PROTOCOLO_ENVIO.DT_INCLUSAO'
    end
    object TB_PROTOCOLO_ENVIOCD_USU_ALTERACAO: TIntegerField
      FieldName = 'CD_USU_ALTERACAO'
      Origin = 'PROTOCOLO_ENVIO.CD_USU_ALTERACAO'
    end
    object TB_PROTOCOLO_ENVIODT_ALTERACAO: TDateTimeField
      FieldName = 'DT_ALTERACAO'
      Origin = 'PROTOCOLO_ENVIO.DT_ALTERACAO'
    end
    object TB_PROTOCOLO_ENVIOCD_USU_EXCLUSAO: TIntegerField
      FieldName = 'CD_USU_EXCLUSAO'
      Origin = 'PROTOCOLO_ENVIO.CD_USU_EXCLUSAO'
    end
    object TB_PROTOCOLO_ENVIODT_EXCLUSAO: TDateTimeField
      FieldName = 'DT_EXCLUSAO'
      Origin = 'PROTOCOLO_ENVIO.DT_EXCLUSAO'
    end
    object TB_PROTOCOLO_ENVIOFL_ENVIADO: TIBStringField
      FieldName = 'FL_ENVIADO'
      Origin = 'PROTOCOLO_ENVIO.FL_ENVIADO'
      FixedChar = True
      Size = 1
    end
    object TB_PROTOCOLO_ENVIOCD_REGISTRO_GERAL: TIntegerField
      FieldName = 'CD_REGISTRO_GERAL'
      Origin = 'PROTOCOLO_ENVIO.CD_REGISTRO_GERAL'
    end
    object TB_PROTOCOLO_ENVIOFL_ACEITAR: TIBStringField
      FieldName = 'FL_ACEITAR'
      Origin = 'PROTOCOLO_ENVIO.FL_ACEITAR'
      FixedChar = True
      Size = 1
    end
    object TB_PROTOCOLO_ENVIOFL_IMPORTADO: TIBStringField
      FieldName = 'FL_IMPORTADO'
      Origin = 'PROTOCOLO_ENVIO.FL_IMPORTADO'
      FixedChar = True
      Size = 1
    end
    object TB_PROTOCOLO_ENVIOCD_ARQUIVO: TIntegerField
      FieldName = 'CD_ARQUIVO'
      Origin = 'PROTOCOLO_ENVIO.CD_ARQUIVO'
    end
    object TB_PROTOCOLO_ENVIODS_UNIDADE: TIBStringField
      FieldName = 'DS_UNIDADE'
      Origin = 'UNIDADE.DS_UNIDADE'
      Size = 50
    end
    object TB_PROTOCOLO_ENVIODS_MUNICIPIO: TIBStringField
      FieldName = 'DS_MUNICIPIO'
      Origin = 'MUNICIPIO.DS_MUNICIPIO'
      Size = 50
    end
    object TB_PROTOCOLO_ENVIODS_PROVINCIA: TIBStringField
      FieldName = 'DS_PROVINCIA'
      Origin = 'PROVINCIA.DS_PROVINCIA'
      Size = 50
    end
  end
  object TB_ARQUIVO_EDI: TIBDataSet
    Database = DM.DB
    Transaction = DM.TS
    BufferChunks = 1000
    CachedUpdates = False
    DeleteSQL.Strings = (
      'delete from "ARQUIVO_EDI"'
      'where'
      '  "CD_ARQUIVO" = :"OLD_CD_ARQUIVO"')
    InsertSQL.Strings = (
      'insert into "ARQUIVO_EDI"'
      '('
      '  "CD_ARQUIVO"'
      ', "NM_ARQUIVO"'
      ', "FL_IMPORTADO"'
      ', "BL_ARQUIVO"'
      ')'
      'values'
      '('
      '  :"CD_ARQUIVO"'
      ', :"NM_ARQUIVO"'
      ', :"FL_IMPORTADO"'
      ', :"BL_ARQUIVO"'
      ')')
    SelectSQL.Strings = (
      'select "ARQUIVO_EDI"."CD_ARQUIVO"'
      '      ,"ARQUIVO_EDI"."NM_ARQUIVO"'
      '      ,"ARQUIVO_EDI"."FL_IMPORTADO"'
      '      ,"ARQUIVO_EDI"."BL_ARQUIVO"'
      'from "ARQUIVO_EDI"'
      'WHERE (FL_IMPORTADO <> '#39'S'#39' or (FL_IMPORTADO IS NULL))'
      '/**/')
    ModifySQL.Strings = (
      'update "ARQUIVO_EDI"'
      'set'
      ' "CD_ARQUIVO" = :"CD_ARQUIVO"'
      ', "NM_ARQUIVO" = :"NM_ARQUIVO"'
      ', "FL_IMPORTADO" = :"FL_IMPORTADO"'
      ', "BL_ARQUIVO" = :"BL_ARQUIVO"'
      'where'
      '  "CD_ARQUIVO" = :"OLD_CD_ARQUIVO"')
    GeneratorField.Field = 'CD_ARQUIVO'
    GeneratorField.Generator = 'GEN_ARQUIVO_EDI'
    Left = 968
    Top = 523
    object TB_ARQUIVO_EDICD_ARQUIVO: TIntegerField
      FieldName = 'CD_ARQUIVO'
      Origin = 'ARQUIVO_EDI.CD_ARQUIVO'
      Required = True
    end
    object TB_ARQUIVO_EDIBL_ARQUIVO: TBlobField
      FieldName = 'BL_ARQUIVO'
      Origin = 'ARQUIVO_EDI.BL_ARQUIVO'
      Size = 8
    end
    object TB_ARQUIVO_EDINM_ARQUIVO: TIBStringField
      FieldName = 'NM_ARQUIVO'
      Origin = 'ARQUIVO_EDI.NM_ARQUIVO'
      Size = 100
    end
    object TB_ARQUIVO_EDIFL_IMPORTADO: TIBStringField
      FieldName = 'FL_IMPORTADO'
      Origin = 'ARQUIVO_EDI.FL_IMPORTADO'
      FixedChar = True
      Size = 1
    end
  end
  object qyProtocolo: TIBQuery
    Database = DM.DB
    Transaction = DM.TS
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select '
      '  CD_UNIDADE,'
      '  CD_PROVINCIA,'
      '  CD_MUNICIPIO,'
      '  VL_MESANO,'
      '  CD_REGISTRO_GERAL,'
      '  FL_ACEITAR,'
      '  FL_IMPORTADO,'
      '  TP_PROTOCOLO'
      'from PROTOCOLO_ENVIO'
      'where CD_REGISTRO_GERAL  = :CD_REGISTRO_GERAL ')
    Left = 840
    Top = 500
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'CD_REGISTRO_GERAL'
        ParamType = ptUnknown
      end>
    object qyProtocoloCD_UNIDADE: TIntegerField
      FieldName = 'CD_UNIDADE'
      Origin = 'PROTOCOLO_ENVIO.CD_UNIDADE'
      Required = True
    end
    object qyProtocoloCD_PROVINCIA: TIntegerField
      FieldName = 'CD_PROVINCIA'
      Origin = 'PROTOCOLO_ENVIO.CD_PROVINCIA'
      Required = True
    end
    object qyProtocoloCD_MUNICIPIO: TIntegerField
      FieldName = 'CD_MUNICIPIO'
      Origin = 'PROTOCOLO_ENVIO.CD_MUNICIPIO'
      Required = True
    end
    object qyProtocoloVL_MESANO: TIBStringField
      FieldName = 'VL_MESANO'
      Origin = 'PROTOCOLO_ENVIO.VL_MESANO'
      Required = True
      Size = 8
    end
    object qyProtocoloCD_REGISTRO_GERAL: TIntegerField
      FieldName = 'CD_REGISTRO_GERAL'
      Origin = 'PROTOCOLO_ENVIO.CD_REGISTRO_GERAL'
    end
    object qyProtocoloFL_ACEITAR: TIBStringField
      FieldName = 'FL_ACEITAR'
      Origin = 'PROTOCOLO_ENVIO.FL_ACEITAR'
      FixedChar = True
      Size = 1
    end
    object qyProtocoloFL_IMPORTADO: TIBStringField
      FieldName = 'FL_IMPORTADO'
      Origin = 'PROTOCOLO_ENVIO.FL_IMPORTADO'
      FixedChar = True
      Size = 1
    end
    object qyProtocoloTP_PROTOCOLO: TIntegerField
      FieldName = 'TP_PROTOCOLO'
      Origin = 'PROTOCOLO_ENVIO.TP_PROTOCOLO'
      Required = True
    end
  end
  object TB_SERVICOS: TIBDataSet
    Database = DM.DB
    Transaction = DM.TS
    BufferChunks = 1000
    CachedUpdates = False
    DeleteSQL.Strings = (
      'delete from "SERVICOS"'
      'where'
      '  "CD_SERVICO" = :"OLD_CD_SERVICO"')
    InsertSQL.Strings = (
      'insert into "SERVICOS"'
      '('
      '  "CD_SERVICO"'
      ', "DS_SERVICO"'
      ')'
      'values'
      '('
      '  :"CD_SERVICO"'
      ', :"DS_SERVICO"'
      ')')
    SelectSQL.Strings = (
      'select "SERVICOS"."CD_SERVICO"'
      '      ,"SERVICOS"."DS_SERVICO"'
      'from "SERVICOS"'
      'order by'
      '"SERVICOS"."CD_SERVICO"')
    ModifySQL.Strings = (
      'update "SERVICOS"'
      'set'
      ' "CD_SERVICO" = :"CD_SERVICO"'
      ', "DS_SERVICO" = :"DS_SERVICO"'
      'where'
      '  "CD_SERVICO" = :"OLD_CD_SERVICO"')
    GeneratorField.Field = 'CD_SERVICO'
    GeneratorField.Generator = 'GEN_SERVICOS'
    Left = 864
    Top = 171
    object TB_SERVICOSCD_SERVICO: TIntegerField
      FieldName = 'CD_SERVICO'
      Origin = 'SERVICOS.CD_SERVICO'
      Required = True
    end
    object TB_SERVICOSDS_SERVICO: TIBStringField
      FieldName = 'DS_SERVICO'
      Origin = 'SERVICOS.DS_SERVICO'
      Size = 100
    end
  end
  object TB_UNIDADE_SERVICOS: TIBDataSet
    Database = DM.DB
    Transaction = DM.TS
    BufferChunks = 1000
    CachedUpdates = False
    DeleteSQL.Strings = (
      'delete from "UNIDADE_SERVICOS"'
      'where'
      '  "CD_UNIDADE" = :"OLD_CD_UNIDADE" and '
      '  "CD_SERVICO" = :"OLD_CD_SERVICO"')
    InsertSQL.Strings = (
      'insert into "UNIDADE_SERVICOS"'
      '('
      '  "CD_UNIDADE"'
      ', "CD_SERVICO"'
      ', "DT_EXP"'
      ', "CD_EDI"'
      ', "CD_UND"'
      ', "DT_INICIO"'
      ')'
      'values'
      '('
      '  :"CD_UNIDADE"'
      ', :"CD_SERVICO"'
      ', :"DT_EXP"'
      ', :"CD_EDI"'
      ', :"CD_UND"'
      ', :"DT_INICIO"'
      ')')
    SelectSQL.Strings = (
      'select "UNIDADE_SERVICOS"."CD_UNIDADE"'
      '      ,"UNIDADE_SERVICOS"."CD_SERVICO"'
      '      ,"UNIDADE_SERVICOS"."DT_EXP"'
      '      ,"UNIDADE_SERVICOS"."CD_EDI"'
      '      ,"UNIDADE_SERVICOS"."CD_UND"'
      '      ,"UNIDADE_SERVICOS"."DT_INICIO"'
      '      ,"SERVICOS"."DS_SERVICO"'
      'from "UNIDADE_SERVICOS"'
      'left outer join "SERVICOS"'
      'on  "UNIDADE_SERVICOS"."CD_SERVICO" = "SERVICOS"."CD_SERVICO"'
      'where  CD_UNIDADE = :CD_UNIDADE'
      '')
    ModifySQL.Strings = (
      'update "UNIDADE_SERVICOS"'
      'set'
      ' "CD_UNIDADE" = :"CD_UNIDADE"'
      ', "CD_SERVICO" = :"CD_SERVICO"'
      ', "DT_EXP" = :"DT_EXP"'
      ', "CD_EDI" = :"CD_EDI"'
      ', "CD_UND" = :"CD_UND"'
      ', "DT_INICIO" = :"DT_INICIO"'
      'where'
      '  "CD_UNIDADE" = :"OLD_CD_UNIDADE" and '
      '  "CD_SERVICO" = :"OLD_CD_SERVICO"')
    DataSource = dsUnidade
    Left = 984
    Top = 171
    object TB_UNIDADE_SERVICOSCD_UNIDADE: TIntegerField
      FieldName = 'CD_UNIDADE'
      Origin = 'UNIDADE_SERVICOS.CD_UNIDADE'
      Required = True
    end
    object TB_UNIDADE_SERVICOSCD_SERVICO: TIntegerField
      FieldName = 'CD_SERVICO'
      Origin = 'UNIDADE_SERVICOS.CD_SERVICO'
      Required = True
    end
    object TB_UNIDADE_SERVICOSDS_SERVICO: TIBStringField
      FieldName = 'DS_SERVICO'
      Origin = 'SERVICOS.DS_SERVICO'
      Size = 100
    end
    object TB_UNIDADE_SERVICOSDT_INICIO: TDateField
      FieldName = 'DT_INICIO'
      Origin = 'UNIDADE_SERVICOS.DT_INICIO'
    end
  end
  object dsUnidade: TDataSource
    DataSet = TB_UNIDADE
    Left = 904
    Top = 227
  end
  object TB_ST_UNIDADE: TIBDataSet
    Database = DM.DB
    Transaction = DM.TS
    AfterInsert = TB_ST_UNIDADEAfterInsert
    AfterPost = TB_ST_UNIDADEAfterPost
    BufferChunks = 1000
    CachedUpdates = False
    DeleteSQL.Strings = (
      'delete from "ST_UNIDADE"'
      'where'
      '  "CD_ST_UNIDADE" = :"OLD_CD_ST_UNIDADE" and '
      '  "CD_UND" = :"OLD_CD_UND"')
    InsertSQL.Strings = (
      'insert into "ST_UNIDADE"'
      '('
      '  "CD_ST_UNIDADE"'
      ', "CD_UND"'
      ', "CD_UNIDADE"'
      ', "DS_UNIDADE"'
      ', "DT_EXP"'
      ', "CD_EDI"'
      ', "CD_PROVINCIA"'
      ', "CD_MUNICIPIO"'
      ', "FL_ATIVA"'
      ', "ST_STATUS"'
      ', "CD_ATIP"'
      ', "CD_PTV"'
      ', "CD_TARV_I"'
      ', "CD_TARV_A"'
      ', "CD_USU_INCLUSAO"'
      ', "DT_INCLUSAO"'
      ', "CD_USU_ALTERACAO"'
      ', "DT_ALTERACAO"'
      ', "CD_COINF"'
      ', "NM_USU"'
      ', "VL_VERSAO"'
      ', "DT_INI_ATIP"'
      ', "DT_INI_PTV"'
      ', "DT_INI_TARV_I"'
      ', "DT_INI_TARV_A"'
      ', "DT_INI_COINF"'
      ')'
      'values'
      '('
      '  :"CD_ST_UNIDADE"'
      ', :"CD_UND"'
      ', :"CD_UNIDADE"'
      ', :"DS_UNIDADE"'
      ', :"DT_EXP"'
      ', :"CD_EDI"'
      ', :"CD_PROVINCIA"'
      ', :"CD_MUNICIPIO"'
      ', :"FL_ATIVA"'
      ', :"ST_STATUS"'
      ', :"CD_ATIP"'
      ', :"CD_PTV"'
      ', :"CD_TARV_I"'
      ', :"CD_TARV_A"'
      ', :"CD_USU_INCLUSAO"'
      ', :"DT_INCLUSAO"'
      ', :"CD_USU_ALTERACAO"'
      ', :"DT_ALTERACAO"'
      ', :"CD_COINF"'
      ', :"NM_USU"'
      ', :"VL_VERSAO"'
      ', :"DT_INI_ATIP"'
      ', :"DT_INI_PTV"'
      ', :"DT_INI_TARV_I"'
      ', :"DT_INI_TARV_A"'
      ', :"DT_INI_COINF"'
      ')')
    SelectSQL.Strings = (
      'select "ST_UNIDADE"."CD_ST_UNIDADE"'
      '      ,"ST_UNIDADE"."CD_UND"'
      '      ,"ST_UNIDADE"."CD_UNIDADE"'
      '      ,"ST_UNIDADE"."DS_UNIDADE"'
      '      ,"ST_UNIDADE"."DT_EXP"'
      '      ,"ST_UNIDADE"."CD_EDI"'
      '      ,"ST_UNIDADE"."CD_PROVINCIA"'
      '      ,"ST_UNIDADE"."CD_MUNICIPIO"'
      '      ,"ST_UNIDADE"."FL_ATIVA"'
      '      ,"ST_UNIDADE"."ST_STATUS"'
      '      ,"ST_UNIDADE"."CD_ATIP"'
      '      ,"ST_UNIDADE"."CD_PTV"'
      '      ,"ST_UNIDADE"."CD_TARV_I"'
      '      ,"ST_UNIDADE"."CD_TARV_A"'
      '      ,"ST_UNIDADE"."CD_USU_INCLUSAO"'
      '      ,"ST_UNIDADE"."DT_INCLUSAO"'
      '      ,"ST_UNIDADE"."CD_USU_ALTERACAO"'
      '      ,"ST_UNIDADE"."DT_ALTERACAO"'
      '      ,"ST_UNIDADE"."CD_COINF"'
      '      ,"ST_UNIDADE"."NM_USU"'
      '      ,"ST_UNIDADE"."VL_VERSAO"'
      '      ,"ST_UNIDADE"."DT_INI_ATIP"'
      '      ,"ST_UNIDADE"."DT_INI_PTV"'
      '      ,"ST_UNIDADE"."DT_INI_TARV_I"'
      '      ,"ST_UNIDADE"."DT_INI_TARV_A"'
      '      ,"ST_UNIDADE"."DT_INI_COINF"'
      '      ,"PROVINCIA"."DS_PROVINCIA"'
      '      ,"MUNICIPIO"."DS_MUNICIPIO"'
      '      ,"UNIDADE"."DS_UNIDADE" UNIDADE_ENVIO'
      'from "ST_UNIDADE"'
      ' LEFT OUTER JOIN "PROVINCIA" ON'
      '      "ST_UNIDADE"."CD_PROVINCIA" = "PROVINCIA"."CD_PROVINCIA"'
      ''
      ' LEFT OUTER JOIN "MUNICIPIO" ON'
      '      "ST_UNIDADE"."CD_MUNICIPIO" = "MUNICIPIO"."CD_MUNICIPIO"'
      ''
      ' LEFT OUTER JOIN "UNIDADE" ON'
      '      "ST_UNIDADE"."CD_UND" = "UNIDADE"."CD_UNIDADE"'
      
        'where st_unidade.cd_und = (select valor from parametro where cd_' +
        'parametro = 1)')
    ModifySQL.Strings = (
      'update "ST_UNIDADE"'
      'set'
      ' "CD_ST_UNIDADE" = :"CD_ST_UNIDADE"'
      ', "CD_UND" = :"CD_UND"'
      ', "CD_UNIDADE" = :"CD_UNIDADE"'
      ', "DS_UNIDADE" = :"DS_UNIDADE"'
      ', "DT_EXP" = :"DT_EXP"'
      ', "CD_EDI" = :"CD_EDI"'
      ', "CD_PROVINCIA" = :"CD_PROVINCIA"'
      ', "CD_MUNICIPIO" = :"CD_MUNICIPIO"'
      ', "FL_ATIVA" = :"FL_ATIVA"'
      ', "ST_STATUS" = :"ST_STATUS"'
      ', "CD_ATIP" = :"CD_ATIP"'
      ', "CD_PTV" = :"CD_PTV"'
      ', "CD_TARV_I" = :"CD_TARV_I"'
      ', "CD_TARV_A" = :"CD_TARV_A"'
      ', "CD_USU_INCLUSAO" = :"CD_USU_INCLUSAO"'
      ', "DT_INCLUSAO" = :"DT_INCLUSAO"'
      ', "CD_USU_ALTERACAO" = :"CD_USU_ALTERACAO"'
      ', "DT_ALTERACAO" = :"DT_ALTERACAO"'
      ', "CD_COINF" = :"CD_COINF"'
      ', "NM_USU" = :"NM_USU"'
      ', "VL_VERSAO" = :"VL_VERSAO"'
      ', "DT_INI_ATIP" = :"DT_INI_ATIP"'
      ', "DT_INI_PTV" = :"DT_INI_PTV"'
      ', "DT_INI_TARV_I" = :"DT_INI_TARV_I"'
      ', "DT_INI_TARV_A" = :"DT_INI_TARV_A"'
      ', "DT_INI_COINF" = :"DT_INI_COINF"'
      'where'
      '  "CD_ST_UNIDADE" = :"OLD_CD_ST_UNIDADE" and '
      '  "CD_UND" = :"OLD_CD_UND"')
    GeneratorField.Field = 'CD_ST_UNIDADE'
    GeneratorField.Generator = 'GEN_ST_UNIDADE'
    GeneratorField.ApplyEvent = gamOnPost
    Left = 992
    Top = 107
    object TB_ST_UNIDADECD_ST_UNIDADE: TIntegerField
      FieldName = 'CD_ST_UNIDADE'
      Origin = 'ST_UNIDADE.CD_ST_UNIDADE'
      Required = True
    end
    object TB_ST_UNIDADECD_UND: TIntegerField
      FieldName = 'CD_UND'
      Origin = 'ST_UNIDADE.CD_UND'
      Required = True
    end
    object TB_ST_UNIDADECD_UNIDADE: TIntegerField
      FieldName = 'CD_UNIDADE'
      Origin = 'ST_UNIDADE.CD_UNIDADE'
    end
    object TB_ST_UNIDADEDS_UNIDADE: TIBStringField
      FieldName = 'DS_UNIDADE'
      Origin = 'ST_UNIDADE.DS_UNIDADE'
      Size = 50
    end
    object TB_ST_UNIDADEDT_EXP: TDateTimeField
      FieldName = 'DT_EXP'
      Origin = 'ST_UNIDADE.DT_EXP'
    end
    object TB_ST_UNIDADECD_EDI: TIntegerField
      FieldName = 'CD_EDI'
      Origin = 'ST_UNIDADE.CD_EDI'
    end
    object TB_ST_UNIDADECD_PROVINCIA: TIntegerField
      FieldName = 'CD_PROVINCIA'
      Origin = 'ST_UNIDADE.CD_PROVINCIA'
    end
    object TB_ST_UNIDADECD_MUNICIPIO: TIntegerField
      FieldName = 'CD_MUNICIPIO'
      Origin = 'ST_UNIDADE.CD_MUNICIPIO'
    end
    object TB_ST_UNIDADEFL_ATIVA: TIBStringField
      FieldName = 'FL_ATIVA'
      Origin = 'ST_UNIDADE.FL_ATIVA'
      FixedChar = True
      Size = 1
    end
    object TB_ST_UNIDADECD_ATIP: TIntegerField
      FieldName = 'CD_ATIP'
      Origin = 'ST_UNIDADE.CD_ATIP'
    end
    object TB_ST_UNIDADECD_PTV: TIntegerField
      FieldName = 'CD_PTV'
      Origin = 'ST_UNIDADE.CD_PTV'
    end
    object TB_ST_UNIDADECD_TARV_I: TIntegerField
      FieldName = 'CD_TARV_I'
      Origin = 'ST_UNIDADE.CD_TARV_I'
    end
    object TB_ST_UNIDADECD_TARV_A: TIntegerField
      FieldName = 'CD_TARV_A'
      Origin = 'ST_UNIDADE.CD_TARV_A'
    end
    object TB_ST_UNIDADECD_USU_INCLUSAO: TIntegerField
      FieldName = 'CD_USU_INCLUSAO'
      Origin = 'ST_UNIDADE.CD_USU_INCLUSAO'
    end
    object TB_ST_UNIDADEDT_INCLUSAO: TDateTimeField
      FieldName = 'DT_INCLUSAO'
      Origin = 'ST_UNIDADE.DT_INCLUSAO'
    end
    object TB_ST_UNIDADECD_USU_ALTERACAO: TIntegerField
      FieldName = 'CD_USU_ALTERACAO'
      Origin = 'ST_UNIDADE.CD_USU_ALTERACAO'
    end
    object TB_ST_UNIDADEDT_ALTERACAO: TDateTimeField
      FieldName = 'DT_ALTERACAO'
      Origin = 'ST_UNIDADE.DT_ALTERACAO'
    end
    object TB_ST_UNIDADEST_STATUS: TIBStringField
      FieldName = 'ST_STATUS'
      Origin = 'ST_UNIDADE.ST_STATUS'
      FixedChar = True
      Size = 1
    end
    object TB_ST_UNIDADEDS_PROVINCIA: TIBStringField
      FieldName = 'DS_PROVINCIA'
      Origin = 'PROVINCIA.DS_PROVINCIA'
      Size = 50
    end
    object TB_ST_UNIDADEDS_MUNICIPIO: TIBStringField
      FieldName = 'DS_MUNICIPIO'
      Origin = 'MUNICIPIO.DS_MUNICIPIO'
      Size = 50
    end
    object TB_ST_UNIDADEUNIDADE_ENVIO: TIBStringField
      FieldName = 'UNIDADE_ENVIO'
      Origin = 'UNIDADE.DS_UNIDADE'
      Size = 50
    end
    object TB_ST_UNIDADECD_COINF: TIntegerField
      FieldName = 'CD_COINF'
      Origin = 'ST_UNIDADE.CD_COINF'
    end
    object TB_ST_UNIDADENM_USU: TStringField
      FieldName = 'NM_USU'
      Size = 50
    end
    object TB_ST_UNIDADEVL_VERSAO: TIBStringField
      FieldName = 'VL_VERSAO'
      Origin = 'ST_UNIDADE.VL_VERSAO'
    end
    object TB_ST_UNIDADEDT_INI_ATIP: TDateTimeField
      FieldName = 'DT_INI_ATIP'
      Origin = 'ST_UNIDADE.DT_INI_ATIP'
    end
    object TB_ST_UNIDADEDT_INI_PTV: TDateTimeField
      FieldName = 'DT_INI_PTV'
      Origin = 'ST_UNIDADE.DT_INI_PTV'
    end
    object TB_ST_UNIDADEDT_INI_TARV_I: TDateTimeField
      FieldName = 'DT_INI_TARV_I'
      Origin = 'ST_UNIDADE.DT_INI_TARV_I'
    end
    object TB_ST_UNIDADEDT_INI_TARV_A: TDateTimeField
      FieldName = 'DT_INI_TARV_A'
      Origin = 'ST_UNIDADE.DT_INI_TARV_A'
    end
    object TB_ST_UNIDADEDT_INI_COINF: TDateTimeField
      FieldName = 'DT_INI_COINF'
      Origin = 'ST_UNIDADE.DT_INI_COINF'
    end
  end
  object TB_NOT_GESTANTE: TIBDataSet
    Database = DM.DB
    Transaction = DM.TS
    AfterDelete = TB_NOT_GESTANTEAfterDelete
    AfterInsert = TB_NOT_GESTANTEAfterInsert
    AfterPost = TB_NOT_GESTANTEAfterPost
    BeforeDelete = TB_NOT_GESTANTEBeforeDelete
    BufferChunks = 1000
    CachedUpdates = False
    DeleteSQL.Strings = (
      'delete from "NOTIFICACAO_GESTANTE"'
      'where'
      '  "CD_NOT_GESTANTE" = :"OLD_CD_NOT_GESTANTE" and '
      '  "CD_UND" = :"OLD_CD_UND"')
    InsertSQL.Strings = (
      'insert into "NOTIFICACAO_GESTANTE"'
      '('
      '  "CD_NOT_GESTANTE"'
      ', "CD_NR_NOFITICACAO"'
      ', "DT_NOTIFICACAO"'
      ', "CD_PROVINCIA"'
      ', "DS_PROVINCIA"'
      ', "CD_MUNICIPIO"'
      ', "DS_MUNICIPIO"'
      ', "CD_UNIDADE"'
      ', "DS_UNIDADE"'
      ', "NM_GEST"'
      ', "DT_NASC_GEST"'
      ', "IDADE_GEST"'
      ', "NR_PROCESSO_GEST"'
      ', "DT_APROX_GEST"'
      ', "FL_SIT_ACTUAL"'
      ', "DS_SIT_ACTUAL"'
      ', "FL_ESTADO_CIVIL"'
      ', "DS_ESTADO_CIVIL"'
      ', "CD_PROV_NASC"'
      ', "DS_PROV_NASC"'
      ', "CD_PAIS_NASC"'
      ', "DS_PAIS_NASC"'
      ', "DS_ENDERECO_NASC"'
      ', "NR_TELEMOVEL"'
      ', "CD_PROV_MORADA"'
      ', "DS_PROV_MORADA"'
      ', "CD_MUN_MORADA"'
      ', "DS_MUN_MORADA"'
      ', "DS_BAIRRO_MORADA"'
      ', "DS_COMUNA_MORADA"'
      ', "FL_NIVEL_ESCO"'
      ', "DS_NIVEL_ESCO"'
      ', "DS_OUTRO_ESCO"'
      ', "FL_FUNCAO"'
      ', "DS_FUNCAO"'
      ', "DS_OUTRA_FUNC"'
      ', "NM_MAE_GEST"'
      ', "FL_MOM_DIAG_VIH_1"'
      ', "DS_MOM_DIAG_VIH_1"'
      ', "DT_DIAG_VIH_1"'
      ', "FL_SIT_SEROLOGICA_1"'
      ', "DS_SIT_SEROLOGICA_1"'
      ', "FL_OCUP_PARCEIRO_1"'
      ', "DS_OCUP_PARCEIRO_1"'
      ', "DS_OCUP_OUTROS_1"'
      ', "FL_PRENATAL_CPN_2"'
      ', "DS_PRENATAL_CPN_2"'
      ', "DT_PRIMEIRA_CON_2"'
      ', "CD_UND_CPN_2"'
      ', "DS_UND_CPN_2"'
      ', "CD_MUN_CPN_2"'
      ', "DS_MUN_CPN_2"'
      ', "CD_PROV_CPN_2"'
      ', "DS_PROV_CPN_2"'
      ', "DT_ULT_MESTRUACAO_2"'
      ', "FL_IDADE_GES_2"'
      ', "DT_PROVAVEL_PARTO_2"'
      ', "FL_ANT_GESTACOES_2"'
      ', "FL_ANT_ABORTOS_2"'
      ', "FL_ANT_NADO_2"'
      ', "FL_USA_ANTVIRAL_2"'
      ', "DS_USA_ANTVIRAL_2"'
      ', "DS_QUAIS_ANTVIRAL_2"'
      ', "DS_SIGLA_ANTVIRAL_2"'
      ', "DT_INI_ANTVIRAL_2"'
      ', "FL_NAO_MOTIVOS_2"'
      ', "DS_NAO_MOTIVOS_2"'
      ', "DS_OUTROS_MOTIVOS_2"'
      ', "DT_PARTO_3"'
      ', "FL_LOCAL_PARTO"'
      ', "DS_LOCAL_PARTO"'
      ', "CD_UND_PARTO_3"'
      ', "DS_UND_PARTO_3"'
      ', "CD_MUN_PARTO_3"'
      ', "DS_MUN_PARTO_3"'
      ', "CD_PROV_PARTO_3"'
      ', "DS_PROV_PARTO_3"'
      ', "FL_TP_PARTO_3"'
      ', "DS_TP_PARTO_3"'
      ', "FL_TP_GEMELAR_3"'
      ', "DS_TP_GEMELAR_3"'
      ', "DS_QUAL_GEMELAR_3"'
      ', "ST_TP_GEMELAR_3"'
      ', "FL_EST_SEROLOGICO_3"'
      ', "DS_EST_SEROLOGICO_3"'
      ', "FL_USA_ANTVIRAL_3"'
      ', "DS_USA_ANTVIRAL_3"'
      ', "FL_NAO_PORQUE_3"'
      ', "DS_NAO_PORQUE_3"'
      ', "DS_OUTROS_MOTIVOS_3"'
      ', "FL_OBITO_MATERNO_3"'
      ', "DS_OBITO_MATERNO_3"'
      ', "FL_DESF_GEST_3"'
      ', "DS_DESF_GEST_3"'
      ', "FL_NADO_VIVO_3"'
      ', "DS_NADO_VIVO_3"'
      ', "NR_PROCESSO_CRI"'
      ', "ST_RN"'
      ', "NM_CRI"'
      ', "DT_NASC_CRI"'
      ', "IDADE_CRI"'
      ', "FL_IDADE_CRI"'
      ', "DS_IDADE_CRI"'
      ', "CD_IDADE_CRI"'
      ', "FL_SEXO_CRI"'
      ', "DS_SEXO_CRI"'
      ', "DT_PRI_CONS_4"'
      ', "FL_INI_PROFILAXIA_4"'
      ', "DS_INI_PROFILAXIA_4"'
      ', "FL_ALEITAMENTO_4"'
      ', "DS_ALEITAMENTO_4"'
      ', "FL_ALEI_TEMPO_4"'
      ', "FL_MAE_USO_TARV_4"'
      ', "DS_MAE_USO_TARV_4"'
      ', "FL_NAO_USO_MOTIVO_4"'
      ', "DS_NAO_USO_MOTIVO_4"'
      ', "DS_OUTROS_MOTIVO_4"'
      ', "FL_ALEIT_MATERNO_4"'
      ', "DS_ALEIT_MATERNO_4"'
      ', "FL_ALEI_MATER_TEMPO_4"'
      ', "FL_USO_PROFILAXIA_4"'
      ', "DS_USO_PROFILAXIA_4"'
      ', "FL_TEMPO_USO_PROF_4"'
      ', "DS_TEMPO_USO_PROF_4"'
      ', "FL_PROF_CTX_4"'
      ', "DS_PROF_CTX_4"'
      ', "DT_INICIO_CTX_4"'
      ', "FL_PRI_CV_5"'
      ', "DS_PRI_CV_5"'
      ', "DT_PRI_CV_5"'
      ', "FL_SEG_CV_5"'
      ', "DS_SEG_CV_5"'
      ', "DT_SEG_CV_5"'
      ', "FL_TER_CV_5"'
      ', "DS_TER_CV_5"'
      ', "DT_TER_CV_5"'
      ', "FL_PRI_TEST_5"'
      ', "DS_PRI_TEST_5"'
      ', "DT_PRI_TEST_5"'
      ', "FL_SEG_TEST_5"'
      ', "DS_SEG_TEST_5"'
      ', "DT_SEG_TEST_5"'
      ', "FL_TER_TEST_5"'
      ', "DS_TER_TEST_5"'
      ', "DT_TER_TEST_5"'
      ', "FL_QUA_TEST_5"'
      ', "DS_QUA_TEST_5"'
      ', "DT_QUA_TEST_5"'
      ', "FL_DESFECHO_5"'
      ', "DS_DESFECHO_5"'
      ', "DT_DESF_DIAG_5"'
      ', "DT_DESF_ENCE_5"'
      ', "DS_LOCAL_TRANS_5"'
      ', "DT_DESF_OBITO_5"'
      ', "CD_PROV_US_5"'
      ', "DS_PROV_US_5"'
      ', "CD_MUN_US_5"'
      ', "DS_MUN_US_5"'
      ', "CD_UND_US_5"'
      ', "DS_UND_US_5"'
      ', "CD_INVESTIGADOR"'
      ', "NM_INVESTIGADOR"'
      ', "NR_TEL_INVES"'
      ', "CD_UND"'
      ', "DT_EXP"'
      ', "CD_EDI"'
      ', "CD_USU_INCLUSAO"'
      ', "DT_INCLUSAO"'
      ', "CD_USU_ALTERACAO"'
      ', "DT_ALTERACAO"'
      ', "CD_REGISTRO_GERAL"'
      ')'
      'values'
      '('
      '  :"CD_NOT_GESTANTE"'
      ', :"CD_NR_NOFITICACAO"'
      ', :"DT_NOTIFICACAO"'
      ', :"CD_PROVINCIA"'
      ', :"DS_PROVINCIA"'
      ', :"CD_MUNICIPIO"'
      ', :"DS_MUNICIPIO"'
      ', :"CD_UNIDADE"'
      ', :"DS_UNIDADE"'
      ', :"NM_GEST"'
      ', :"DT_NASC_GEST"'
      ', :"IDADE_GEST"'
      ', :"NR_PROCESSO_GEST"'
      ', :"DT_APROX_GEST"'
      ', :"FL_SIT_ACTUAL"'
      ', :"DS_SIT_ACTUAL"'
      ', :"FL_ESTADO_CIVIL"'
      ', :"DS_ESTADO_CIVIL"'
      ', :"CD_PROV_NASC"'
      ', :"DS_PROV_NASC"'
      ', :"CD_PAIS_NASC"'
      ', :"DS_PAIS_NASC"'
      ', :"DS_ENDERECO_NASC"'
      ', :"NR_TELEMOVEL"'
      ', :"CD_PROV_MORADA"'
      ', :"DS_PROV_MORADA"'
      ', :"CD_MUN_MORADA"'
      ', :"DS_MUN_MORADA"'
      ', :"DS_BAIRRO_MORADA"'
      ', :"DS_COMUNA_MORADA"'
      ', :"FL_NIVEL_ESCO"'
      ', :"DS_NIVEL_ESCO"'
      ', :"DS_OUTRO_ESCO"'
      ', :"FL_FUNCAO"'
      ', :"DS_FUNCAO"'
      ', :"DS_OUTRA_FUNC"'
      ', :"NM_MAE_GEST"'
      ', :"FL_MOM_DIAG_VIH_1"'
      ', :"DS_MOM_DIAG_VIH_1"'
      ', :"DT_DIAG_VIH_1"'
      ', :"FL_SIT_SEROLOGICA_1"'
      ', :"DS_SIT_SEROLOGICA_1"'
      ', :"FL_OCUP_PARCEIRO_1"'
      ', :"DS_OCUP_PARCEIRO_1"'
      ', :"DS_OCUP_OUTROS_1"'
      ', :"FL_PRENATAL_CPN_2"'
      ', :"DS_PRENATAL_CPN_2"'
      ', :"DT_PRIMEIRA_CON_2"'
      ', :"CD_UND_CPN_2"'
      ', :"DS_UND_CPN_2"'
      ', :"CD_MUN_CPN_2"'
      ', :"DS_MUN_CPN_2"'
      ', :"CD_PROV_CPN_2"'
      ', :"DS_PROV_CPN_2"'
      ', :"DT_ULT_MESTRUACAO_2"'
      ', :"FL_IDADE_GES_2"'
      ', :"DT_PROVAVEL_PARTO_2"'
      ', :"FL_ANT_GESTACOES_2"'
      ', :"FL_ANT_ABORTOS_2"'
      ', :"FL_ANT_NADO_2"'
      ', :"FL_USA_ANTVIRAL_2"'
      ', :"DS_USA_ANTVIRAL_2"'
      ', :"DS_QUAIS_ANTVIRAL_2"'
      ', :"DS_SIGLA_ANTVIRAL_2"'
      ', :"DT_INI_ANTVIRAL_2"'
      ', :"FL_NAO_MOTIVOS_2"'
      ', :"DS_NAO_MOTIVOS_2"'
      ', :"DS_OUTROS_MOTIVOS_2"'
      ', :"DT_PARTO_3"'
      ', :"FL_LOCAL_PARTO"'
      ', :"DS_LOCAL_PARTO"'
      ', :"CD_UND_PARTO_3"'
      ', :"DS_UND_PARTO_3"'
      ', :"CD_MUN_PARTO_3"'
      ', :"DS_MUN_PARTO_3"'
      ', :"CD_PROV_PARTO_3"'
      ', :"DS_PROV_PARTO_3"'
      ', :"FL_TP_PARTO_3"'
      ', :"DS_TP_PARTO_3"'
      ', :"FL_TP_GEMELAR_3"'
      ', :"DS_TP_GEMELAR_3"'
      ', :"DS_QUAL_GEMELAR_3"'
      ', :"ST_TP_GEMELAR_3"'
      ', :"FL_EST_SEROLOGICO_3"'
      ', :"DS_EST_SEROLOGICO_3"'
      ', :"FL_USA_ANTVIRAL_3"'
      ', :"DS_USA_ANTVIRAL_3"'
      ', :"FL_NAO_PORQUE_3"'
      ', :"DS_NAO_PORQUE_3"'
      ', :"DS_OUTROS_MOTIVOS_3"'
      ', :"FL_OBITO_MATERNO_3"'
      ', :"DS_OBITO_MATERNO_3"'
      ', :"FL_DESF_GEST_3"'
      ', :"DS_DESF_GEST_3"'
      ', :"FL_NADO_VIVO_3"'
      ', :"DS_NADO_VIVO_3"'
      ', :"NR_PROCESSO_CRI"'
      ', :"ST_RN"'
      ', :"NM_CRI"'
      ', :"DT_NASC_CRI"'
      ', :"IDADE_CRI"'
      ', :"FL_IDADE_CRI"'
      ', :"DS_IDADE_CRI"'
      ', :"CD_IDADE_CRI"'
      ', :"FL_SEXO_CRI"'
      ', :"DS_SEXO_CRI"'
      ', :"DT_PRI_CONS_4"'
      ', :"FL_INI_PROFILAXIA_4"'
      ', :"DS_INI_PROFILAXIA_4"'
      ', :"FL_ALEITAMENTO_4"'
      ', :"DS_ALEITAMENTO_4"'
      ', :"FL_ALEI_TEMPO_4"'
      ', :"FL_MAE_USO_TARV_4"'
      ', :"DS_MAE_USO_TARV_4"'
      ', :"FL_NAO_USO_MOTIVO_4"'
      ', :"DS_NAO_USO_MOTIVO_4"'
      ', :"DS_OUTROS_MOTIVO_4"'
      ', :"FL_ALEIT_MATERNO_4"'
      ', :"DS_ALEIT_MATERNO_4"'
      ', :"FL_ALEI_MATER_TEMPO_4"'
      ', :"FL_USO_PROFILAXIA_4"'
      ', :"DS_USO_PROFILAXIA_4"'
      ', :"FL_TEMPO_USO_PROF_4"'
      ', :"DS_TEMPO_USO_PROF_4"'
      ', :"FL_PROF_CTX_4"'
      ', :"DS_PROF_CTX_4"'
      ', :"DT_INICIO_CTX_4"'
      ', :"FL_PRI_CV_5"'
      ', :"DS_PRI_CV_5"'
      ', :"DT_PRI_CV_5"'
      ', :"FL_SEG_CV_5"'
      ', :"DS_SEG_CV_5"'
      ', :"DT_SEG_CV_5"'
      ', :"FL_TER_CV_5"'
      ', :"DS_TER_CV_5"'
      ', :"DT_TER_CV_5"'
      ', :"FL_PRI_TEST_5"'
      ', :"DS_PRI_TEST_5"'
      ', :"DT_PRI_TEST_5"'
      ', :"FL_SEG_TEST_5"'
      ', :"DS_SEG_TEST_5"'
      ', :"DT_SEG_TEST_5"'
      ', :"FL_TER_TEST_5"'
      ', :"DS_TER_TEST_5"'
      ', :"DT_TER_TEST_5"'
      ', :"FL_QUA_TEST_5"'
      ', :"DS_QUA_TEST_5"'
      ', :"DT_QUA_TEST_5"'
      ', :"FL_DESFECHO_5"'
      ', :"DS_DESFECHO_5"'
      ', :"DT_DESF_DIAG_5"'
      ', :"DT_DESF_ENCE_5"'
      ', :"DS_LOCAL_TRANS_5"'
      ', :"DT_DESF_OBITO_5"'
      ', :"CD_PROV_US_5"'
      ', :"DS_PROV_US_5"'
      ', :"CD_MUN_US_5"'
      ', :"DS_MUN_US_5"'
      ', :"CD_UND_US_5"'
      ', :"DS_UND_US_5"'
      ', :"CD_INVESTIGADOR"'
      ', :"NM_INVESTIGADOR"'
      ', :"NR_TEL_INVES"'
      ', :"CD_UND"'
      ', :"DT_EXP"'
      ', :"CD_EDI"'
      ', :"CD_USU_INCLUSAO"'
      ', :"DT_INCLUSAO"'
      ', :"CD_USU_ALTERACAO"'
      ', :"DT_ALTERACAO"'
      ', :"CD_REGISTRO_GERAL"'
      ')')
    SelectSQL.Strings = (
      'select "NOTIFICACAO_GESTANTE"."CD_NOT_GESTANTE"'
      '      ,"NOTIFICACAO_GESTANTE"."CD_NR_NOFITICACAO"'
      '      ,"NOTIFICACAO_GESTANTE"."DT_NOTIFICACAO"'
      '      ,"NOTIFICACAO_GESTANTE"."CD_PROVINCIA"'
      '      ,"NOTIFICACAO_GESTANTE"."DS_PROVINCIA"'
      '      ,"NOTIFICACAO_GESTANTE"."CD_MUNICIPIO"'
      '      ,"NOTIFICACAO_GESTANTE"."DS_MUNICIPIO"'
      '      ,"NOTIFICACAO_GESTANTE"."CD_UNIDADE"'
      '      ,"NOTIFICACAO_GESTANTE"."DS_UNIDADE"'
      '      ,"NOTIFICACAO_GESTANTE"."NM_GEST"'
      '      ,"NOTIFICACAO_GESTANTE"."DT_NASC_GEST"'
      '      ,"NOTIFICACAO_GESTANTE"."IDADE_GEST"'
      '      ,"NOTIFICACAO_GESTANTE"."NR_PROCESSO_GEST"'
      '      ,"NOTIFICACAO_GESTANTE"."DT_APROX_GEST"'
      '      ,"NOTIFICACAO_GESTANTE"."FL_SIT_ACTUAL"'
      '      ,"NOTIFICACAO_GESTANTE"."DS_SIT_ACTUAL"'
      '      ,"NOTIFICACAO_GESTANTE"."FL_ESTADO_CIVIL"'
      '      ,"NOTIFICACAO_GESTANTE"."DS_ESTADO_CIVIL"'
      '      ,"NOTIFICACAO_GESTANTE"."CD_PROV_NASC"'
      '      ,"NOTIFICACAO_GESTANTE"."DS_PROV_NASC"'
      '      ,"NOTIFICACAO_GESTANTE"."CD_PAIS_NASC"'
      '      ,"NOTIFICACAO_GESTANTE"."DS_PAIS_NASC"'
      '      ,"NOTIFICACAO_GESTANTE"."DS_ENDERECO_NASC"'
      '      ,"NOTIFICACAO_GESTANTE"."NR_TELEMOVEL"'
      '      ,"NOTIFICACAO_GESTANTE"."CD_PROV_MORADA"'
      '      ,"NOTIFICACAO_GESTANTE"."DS_PROV_MORADA"'
      '      ,"NOTIFICACAO_GESTANTE"."CD_MUN_MORADA"'
      '      ,"NOTIFICACAO_GESTANTE"."DS_MUN_MORADA"'
      '      ,"NOTIFICACAO_GESTANTE"."DS_BAIRRO_MORADA"'
      '      ,"NOTIFICACAO_GESTANTE"."DS_COMUNA_MORADA"'
      '      ,"NOTIFICACAO_GESTANTE"."FL_NIVEL_ESCO"'
      '      ,"NOTIFICACAO_GESTANTE"."DS_NIVEL_ESCO"'
      '      ,"NOTIFICACAO_GESTANTE"."DS_OUTRO_ESCO"'
      '      ,"NOTIFICACAO_GESTANTE"."FL_FUNCAO"'
      '      ,"NOTIFICACAO_GESTANTE"."DS_FUNCAO"'
      '      ,"NOTIFICACAO_GESTANTE"."DS_OUTRA_FUNC"'
      '      ,"NOTIFICACAO_GESTANTE"."NM_MAE_GEST"'
      '      ,"NOTIFICACAO_GESTANTE"."FL_MOM_DIAG_VIH_1"'
      '      ,"NOTIFICACAO_GESTANTE"."DS_MOM_DIAG_VIH_1"'
      '      ,"NOTIFICACAO_GESTANTE"."DT_DIAG_VIH_1"'
      '      ,"NOTIFICACAO_GESTANTE"."FL_SIT_SEROLOGICA_1"'
      '      ,"NOTIFICACAO_GESTANTE"."DS_SIT_SEROLOGICA_1"'
      '      ,"NOTIFICACAO_GESTANTE"."FL_OCUP_PARCEIRO_1"'
      '      ,"NOTIFICACAO_GESTANTE"."DS_OCUP_PARCEIRO_1"'
      '      ,"NOTIFICACAO_GESTANTE"."DS_OCUP_OUTROS_1"'
      '      ,"NOTIFICACAO_GESTANTE"."FL_PRENATAL_CPN_2"'
      '      ,"NOTIFICACAO_GESTANTE"."DS_PRENATAL_CPN_2"'
      '      ,"NOTIFICACAO_GESTANTE"."DT_PRIMEIRA_CON_2"'
      '      ,"NOTIFICACAO_GESTANTE"."CD_UND_CPN_2"'
      '      ,"NOTIFICACAO_GESTANTE"."DS_UND_CPN_2"'
      '      ,"NOTIFICACAO_GESTANTE"."CD_MUN_CPN_2"'
      '      ,"NOTIFICACAO_GESTANTE"."DS_MUN_CPN_2"'
      '      ,"NOTIFICACAO_GESTANTE"."CD_PROV_CPN_2"'
      '      ,"NOTIFICACAO_GESTANTE"."DS_PROV_CPN_2"'
      '      ,"NOTIFICACAO_GESTANTE"."DT_ULT_MESTRUACAO_2"'
      '      ,"NOTIFICACAO_GESTANTE"."FL_IDADE_GES_2"'
      '      ,"NOTIFICACAO_GESTANTE"."DT_PROVAVEL_PARTO_2"'
      '      ,"NOTIFICACAO_GESTANTE"."FL_ANT_GESTACOES_2"'
      '      ,"NOTIFICACAO_GESTANTE"."FL_ANT_ABORTOS_2"'
      '      ,"NOTIFICACAO_GESTANTE"."FL_ANT_NADO_2"'
      '      ,"NOTIFICACAO_GESTANTE"."FL_USA_ANTVIRAL_2"'
      '      ,"NOTIFICACAO_GESTANTE"."DS_USA_ANTVIRAL_2"'
      '      ,"NOTIFICACAO_GESTANTE"."DS_QUAIS_ANTVIRAL_2"'
      '      ,"NOTIFICACAO_GESTANTE"."DS_SIGLA_ANTVIRAL_2"'
      '      ,"NOTIFICACAO_GESTANTE"."DT_INI_ANTVIRAL_2"'
      '      ,"NOTIFICACAO_GESTANTE"."FL_NAO_MOTIVOS_2"'
      '      ,"NOTIFICACAO_GESTANTE"."DS_NAO_MOTIVOS_2"'
      '      ,"NOTIFICACAO_GESTANTE"."DS_OUTROS_MOTIVOS_2"'
      '      ,"NOTIFICACAO_GESTANTE"."DT_PARTO_3"'
      '      ,"NOTIFICACAO_GESTANTE"."FL_LOCAL_PARTO"'
      '      ,"NOTIFICACAO_GESTANTE"."DS_LOCAL_PARTO"'
      '      ,"NOTIFICACAO_GESTANTE"."CD_UND_PARTO_3"'
      '      ,"NOTIFICACAO_GESTANTE"."DS_UND_PARTO_3"'
      '      ,"NOTIFICACAO_GESTANTE"."CD_MUN_PARTO_3"'
      '      ,"NOTIFICACAO_GESTANTE"."DS_MUN_PARTO_3"'
      '      ,"NOTIFICACAO_GESTANTE"."CD_PROV_PARTO_3"'
      '      ,"NOTIFICACAO_GESTANTE"."DS_PROV_PARTO_3"'
      '      ,"NOTIFICACAO_GESTANTE"."FL_TP_PARTO_3"'
      '      ,"NOTIFICACAO_GESTANTE"."DS_TP_PARTO_3"'
      '      ,"NOTIFICACAO_GESTANTE"."FL_TP_GEMELAR_3"'
      '      ,"NOTIFICACAO_GESTANTE"."DS_TP_GEMELAR_3"'
      '      ,"NOTIFICACAO_GESTANTE"."DS_QUAL_GEMELAR_3"'
      '      ,"NOTIFICACAO_GESTANTE"."ST_TP_GEMELAR_3"'
      '      ,"NOTIFICACAO_GESTANTE"."FL_EST_SEROLOGICO_3"'
      '      ,"NOTIFICACAO_GESTANTE"."DS_EST_SEROLOGICO_3"'
      '      ,"NOTIFICACAO_GESTANTE"."FL_USA_ANTVIRAL_3"'
      '      ,"NOTIFICACAO_GESTANTE"."DS_USA_ANTVIRAL_3"'
      '      ,"NOTIFICACAO_GESTANTE"."FL_NAO_PORQUE_3"'
      '      ,"NOTIFICACAO_GESTANTE"."DS_NAO_PORQUE_3"'
      '      ,"NOTIFICACAO_GESTANTE"."DS_OUTROS_MOTIVOS_3"'
      '      ,"NOTIFICACAO_GESTANTE"."FL_OBITO_MATERNO_3"'
      '      ,"NOTIFICACAO_GESTANTE"."DS_OBITO_MATERNO_3"'
      '      ,"NOTIFICACAO_GESTANTE"."FL_DESF_GEST_3"'
      '      ,"NOTIFICACAO_GESTANTE"."DS_DESF_GEST_3"'
      '      ,"NOTIFICACAO_GESTANTE"."FL_NADO_VIVO_3"'
      '      ,"NOTIFICACAO_GESTANTE"."DS_NADO_VIVO_3"'
      '      ,"NOTIFICACAO_GESTANTE"."NR_PROCESSO_CRI"'
      '      ,"NOTIFICACAO_GESTANTE"."ST_RN"'
      '      ,"NOTIFICACAO_GESTANTE"."NM_CRI"'
      '      ,"NOTIFICACAO_GESTANTE"."DT_NASC_CRI"'
      '      ,"NOTIFICACAO_GESTANTE"."IDADE_CRI"'
      '      ,"NOTIFICACAO_GESTANTE"."FL_IDADE_CRI"'
      '      ,"NOTIFICACAO_GESTANTE"."DS_IDADE_CRI"'
      '      ,"NOTIFICACAO_GESTANTE"."CD_IDADE_CRI"'
      '      ,"NOTIFICACAO_GESTANTE"."FL_SEXO_CRI"'
      '      ,"NOTIFICACAO_GESTANTE"."DS_SEXO_CRI"'
      '      ,"NOTIFICACAO_GESTANTE"."DT_PRI_CONS_4"'
      '      ,"NOTIFICACAO_GESTANTE"."FL_INI_PROFILAXIA_4"'
      '      ,"NOTIFICACAO_GESTANTE"."DS_INI_PROFILAXIA_4"'
      '      ,"NOTIFICACAO_GESTANTE"."FL_ALEITAMENTO_4"'
      '      ,"NOTIFICACAO_GESTANTE"."DS_ALEITAMENTO_4"'
      '      ,"NOTIFICACAO_GESTANTE"."FL_ALEI_TEMPO_4"'
      '      ,"NOTIFICACAO_GESTANTE"."FL_MAE_USO_TARV_4"'
      '      ,"NOTIFICACAO_GESTANTE"."DS_MAE_USO_TARV_4"'
      '      ,"NOTIFICACAO_GESTANTE"."FL_NAO_USO_MOTIVO_4"'
      '      ,"NOTIFICACAO_GESTANTE"."DS_NAO_USO_MOTIVO_4"'
      '      ,"NOTIFICACAO_GESTANTE"."DS_OUTROS_MOTIVO_4"'
      '      ,"NOTIFICACAO_GESTANTE"."FL_ALEIT_MATERNO_4"'
      '      ,"NOTIFICACAO_GESTANTE"."DS_ALEIT_MATERNO_4"'
      '      ,"NOTIFICACAO_GESTANTE"."FL_ALEI_MATER_TEMPO_4"'
      '      ,"NOTIFICACAO_GESTANTE"."FL_USO_PROFILAXIA_4"'
      '      ,"NOTIFICACAO_GESTANTE"."DS_USO_PROFILAXIA_4"'
      '      ,"NOTIFICACAO_GESTANTE"."FL_TEMPO_USO_PROF_4"'
      '      ,"NOTIFICACAO_GESTANTE"."DS_TEMPO_USO_PROF_4"'
      '      ,"NOTIFICACAO_GESTANTE"."FL_PROF_CTX_4"'
      '      ,"NOTIFICACAO_GESTANTE"."DS_PROF_CTX_4"'
      '      ,"NOTIFICACAO_GESTANTE"."DT_INICIO_CTX_4"'
      '      ,"NOTIFICACAO_GESTANTE"."FL_PRI_CV_5"'
      '      ,"NOTIFICACAO_GESTANTE"."DS_PRI_CV_5"'
      '      ,"NOTIFICACAO_GESTANTE"."DT_PRI_CV_5"'
      '      ,"NOTIFICACAO_GESTANTE"."FL_SEG_CV_5"'
      '      ,"NOTIFICACAO_GESTANTE"."DS_SEG_CV_5"'
      '      ,"NOTIFICACAO_GESTANTE"."DT_SEG_CV_5"'
      '      ,"NOTIFICACAO_GESTANTE"."FL_TER_CV_5"'
      '      ,"NOTIFICACAO_GESTANTE"."DS_TER_CV_5"'
      '      ,"NOTIFICACAO_GESTANTE"."DT_TER_CV_5"'
      '      ,"NOTIFICACAO_GESTANTE"."FL_PRI_TEST_5"'
      '      ,"NOTIFICACAO_GESTANTE"."DS_PRI_TEST_5"'
      '      ,"NOTIFICACAO_GESTANTE"."DT_PRI_TEST_5"'
      '      ,"NOTIFICACAO_GESTANTE"."FL_SEG_TEST_5"'
      '      ,"NOTIFICACAO_GESTANTE"."DS_SEG_TEST_5"'
      '      ,"NOTIFICACAO_GESTANTE"."DT_SEG_TEST_5"'
      '      ,"NOTIFICACAO_GESTANTE"."FL_TER_TEST_5"'
      '      ,"NOTIFICACAO_GESTANTE"."DS_TER_TEST_5"'
      '      ,"NOTIFICACAO_GESTANTE"."DT_TER_TEST_5"'
      '      ,"NOTIFICACAO_GESTANTE"."FL_QUA_TEST_5"'
      '      ,"NOTIFICACAO_GESTANTE"."DS_QUA_TEST_5"'
      '      ,"NOTIFICACAO_GESTANTE"."DT_QUA_TEST_5"'
      '      ,"NOTIFICACAO_GESTANTE"."FL_DESFECHO_5"'
      '      ,"NOTIFICACAO_GESTANTE"."DS_DESFECHO_5"'
      '      ,"NOTIFICACAO_GESTANTE"."DT_DESF_DIAG_5"'
      '      ,"NOTIFICACAO_GESTANTE"."DT_DESF_ENCE_5"'
      '      ,"NOTIFICACAO_GESTANTE"."DS_LOCAL_TRANS_5"'
      '      ,"NOTIFICACAO_GESTANTE"."DT_DESF_OBITO_5"'
      '      ,"NOTIFICACAO_GESTANTE"."CD_PROV_US_5"'
      '      ,"NOTIFICACAO_GESTANTE"."DS_PROV_US_5"'
      '      ,"NOTIFICACAO_GESTANTE"."CD_MUN_US_5"'
      '      ,"NOTIFICACAO_GESTANTE"."DS_MUN_US_5"'
      '      ,"NOTIFICACAO_GESTANTE"."CD_UND_US_5"'
      '      ,"NOTIFICACAO_GESTANTE"."DS_UND_US_5"'
      '      ,"NOTIFICACAO_GESTANTE"."CD_INVESTIGADOR"'
      '      ,"NOTIFICACAO_GESTANTE"."NM_INVESTIGADOR"'
      '      ,"NOTIFICACAO_GESTANTE"."NR_TEL_INVES"'
      '      ,"NOTIFICACAO_GESTANTE"."CD_UND"'
      '      ,"NOTIFICACAO_GESTANTE"."DT_EXP"'
      '      ,"NOTIFICACAO_GESTANTE"."CD_EDI"'
      '      ,"NOTIFICACAO_GESTANTE"."CD_USU_INCLUSAO"'
      '      ,"NOTIFICACAO_GESTANTE"."DT_INCLUSAO"'
      '      ,"NOTIFICACAO_GESTANTE"."CD_USU_ALTERACAO"'
      '      ,"NOTIFICACAO_GESTANTE"."DT_ALTERACAO"'
      '      ,"NOTIFICACAO_GESTANTE"."CD_REGISTRO_GERAL"'
      'from "NOTIFICACAO_GESTANTE"'
      'WHERE cd_not_gestante =:CD_NOT_GESTANTE'
      'AND cd_und = :CD_UND')
    ModifySQL.Strings = (
      'update "NOTIFICACAO_GESTANTE"'
      'set'
      ' "CD_NOT_GESTANTE" = :"CD_NOT_GESTANTE"'
      ', "CD_NR_NOFITICACAO" = :"CD_NR_NOFITICACAO"'
      ', "DT_NOTIFICACAO" = :"DT_NOTIFICACAO"'
      ', "CD_PROVINCIA" = :"CD_PROVINCIA"'
      ', "DS_PROVINCIA" = :"DS_PROVINCIA"'
      ', "CD_MUNICIPIO" = :"CD_MUNICIPIO"'
      ', "DS_MUNICIPIO" = :"DS_MUNICIPIO"'
      ', "CD_UNIDADE" = :"CD_UNIDADE"'
      ', "DS_UNIDADE" = :"DS_UNIDADE"'
      ', "NM_GEST" = :"NM_GEST"'
      ', "DT_NASC_GEST" = :"DT_NASC_GEST"'
      ', "IDADE_GEST" = :"IDADE_GEST"'
      ', "NR_PROCESSO_GEST" = :"NR_PROCESSO_GEST"'
      ', "DT_APROX_GEST" = :"DT_APROX_GEST"'
      ', "FL_SIT_ACTUAL" = :"FL_SIT_ACTUAL"'
      ', "DS_SIT_ACTUAL" = :"DS_SIT_ACTUAL"'
      ', "FL_ESTADO_CIVIL" = :"FL_ESTADO_CIVIL"'
      ', "DS_ESTADO_CIVIL" = :"DS_ESTADO_CIVIL"'
      ', "CD_PROV_NASC" = :"CD_PROV_NASC"'
      ', "DS_PROV_NASC" = :"DS_PROV_NASC"'
      ', "CD_PAIS_NASC" = :"CD_PAIS_NASC"'
      ', "DS_PAIS_NASC" = :"DS_PAIS_NASC"'
      ', "DS_ENDERECO_NASC" = :"DS_ENDERECO_NASC"'
      ', "NR_TELEMOVEL" = :"NR_TELEMOVEL"'
      ', "CD_PROV_MORADA" = :"CD_PROV_MORADA"'
      ', "DS_PROV_MORADA" = :"DS_PROV_MORADA"'
      ', "CD_MUN_MORADA" = :"CD_MUN_MORADA"'
      ', "DS_MUN_MORADA" = :"DS_MUN_MORADA"'
      ', "DS_BAIRRO_MORADA" = :"DS_BAIRRO_MORADA"'
      ', "DS_COMUNA_MORADA" = :"DS_COMUNA_MORADA"'
      ', "FL_NIVEL_ESCO" = :"FL_NIVEL_ESCO"'
      ', "DS_NIVEL_ESCO" = :"DS_NIVEL_ESCO"'
      ', "DS_OUTRO_ESCO" = :"DS_OUTRO_ESCO"'
      ', "FL_FUNCAO" = :"FL_FUNCAO"'
      ', "DS_FUNCAO" = :"DS_FUNCAO"'
      ', "DS_OUTRA_FUNC" = :"DS_OUTRA_FUNC"'
      ', "NM_MAE_GEST" = :"NM_MAE_GEST"'
      ', "FL_MOM_DIAG_VIH_1" = :"FL_MOM_DIAG_VIH_1"'
      ', "DS_MOM_DIAG_VIH_1" = :"DS_MOM_DIAG_VIH_1"'
      ', "DT_DIAG_VIH_1" = :"DT_DIAG_VIH_1"'
      ', "FL_SIT_SEROLOGICA_1" = :"FL_SIT_SEROLOGICA_1"'
      ', "DS_SIT_SEROLOGICA_1" = :"DS_SIT_SEROLOGICA_1"'
      ', "FL_OCUP_PARCEIRO_1" = :"FL_OCUP_PARCEIRO_1"'
      ', "DS_OCUP_PARCEIRO_1" = :"DS_OCUP_PARCEIRO_1"'
      ', "DS_OCUP_OUTROS_1" = :"DS_OCUP_OUTROS_1"'
      ', "FL_PRENATAL_CPN_2" = :"FL_PRENATAL_CPN_2"'
      ', "DS_PRENATAL_CPN_2" = :"DS_PRENATAL_CPN_2"'
      ', "DT_PRIMEIRA_CON_2" = :"DT_PRIMEIRA_CON_2"'
      ', "CD_UND_CPN_2" = :"CD_UND_CPN_2"'
      ', "DS_UND_CPN_2" = :"DS_UND_CPN_2"'
      ', "CD_MUN_CPN_2" = :"CD_MUN_CPN_2"'
      ', "DS_MUN_CPN_2" = :"DS_MUN_CPN_2"'
      ', "CD_PROV_CPN_2" = :"CD_PROV_CPN_2"'
      ', "DS_PROV_CPN_2" = :"DS_PROV_CPN_2"'
      ', "DT_ULT_MESTRUACAO_2" = :"DT_ULT_MESTRUACAO_2"'
      ', "FL_IDADE_GES_2" = :"FL_IDADE_GES_2"'
      ', "DT_PROVAVEL_PARTO_2" = :"DT_PROVAVEL_PARTO_2"'
      ', "FL_ANT_GESTACOES_2" = :"FL_ANT_GESTACOES_2"'
      ', "FL_ANT_ABORTOS_2" = :"FL_ANT_ABORTOS_2"'
      ', "FL_ANT_NADO_2" = :"FL_ANT_NADO_2"'
      ', "FL_USA_ANTVIRAL_2" = :"FL_USA_ANTVIRAL_2"'
      ', "DS_USA_ANTVIRAL_2" = :"DS_USA_ANTVIRAL_2"'
      ', "DS_QUAIS_ANTVIRAL_2" = :"DS_QUAIS_ANTVIRAL_2"'
      ', "DS_SIGLA_ANTVIRAL_2" = :"DS_SIGLA_ANTVIRAL_2"'
      ', "DT_INI_ANTVIRAL_2" = :"DT_INI_ANTVIRAL_2"'
      ', "FL_NAO_MOTIVOS_2" = :"FL_NAO_MOTIVOS_2"'
      ', "DS_NAO_MOTIVOS_2" = :"DS_NAO_MOTIVOS_2"'
      ', "DS_OUTROS_MOTIVOS_2" = :"DS_OUTROS_MOTIVOS_2"'
      ', "DT_PARTO_3" = :"DT_PARTO_3"'
      ', "FL_LOCAL_PARTO" = :"FL_LOCAL_PARTO"'
      ', "DS_LOCAL_PARTO" = :"DS_LOCAL_PARTO"'
      ', "CD_UND_PARTO_3" = :"CD_UND_PARTO_3"'
      ', "DS_UND_PARTO_3" = :"DS_UND_PARTO_3"'
      ', "CD_MUN_PARTO_3" = :"CD_MUN_PARTO_3"'
      ', "DS_MUN_PARTO_3" = :"DS_MUN_PARTO_3"'
      ', "CD_PROV_PARTO_3" = :"CD_PROV_PARTO_3"'
      ', "DS_PROV_PARTO_3" = :"DS_PROV_PARTO_3"'
      ', "FL_TP_PARTO_3" = :"FL_TP_PARTO_3"'
      ', "DS_TP_PARTO_3" = :"DS_TP_PARTO_3"'
      ', "FL_TP_GEMELAR_3" = :"FL_TP_GEMELAR_3"'
      ', "DS_TP_GEMELAR_3" = :"DS_TP_GEMELAR_3"'
      ', "DS_QUAL_GEMELAR_3" = :"DS_QUAL_GEMELAR_3"'
      ', "ST_TP_GEMELAR_3" = :"ST_TP_GEMELAR_3"'
      ', "FL_EST_SEROLOGICO_3" = :"FL_EST_SEROLOGICO_3"'
      ', "DS_EST_SEROLOGICO_3" = :"DS_EST_SEROLOGICO_3"'
      ', "FL_USA_ANTVIRAL_3" = :"FL_USA_ANTVIRAL_3"'
      ', "DS_USA_ANTVIRAL_3" = :"DS_USA_ANTVIRAL_3"'
      ', "FL_NAO_PORQUE_3" = :"FL_NAO_PORQUE_3"'
      ', "DS_NAO_PORQUE_3" = :"DS_NAO_PORQUE_3"'
      ', "DS_OUTROS_MOTIVOS_3" = :"DS_OUTROS_MOTIVOS_3"'
      ', "FL_OBITO_MATERNO_3" = :"FL_OBITO_MATERNO_3"'
      ', "DS_OBITO_MATERNO_3" = :"DS_OBITO_MATERNO_3"'
      ', "FL_DESF_GEST_3" = :"FL_DESF_GEST_3"'
      ', "DS_DESF_GEST_3" = :"DS_DESF_GEST_3"'
      ', "FL_NADO_VIVO_3" = :"FL_NADO_VIVO_3"'
      ', "DS_NADO_VIVO_3" = :"DS_NADO_VIVO_3"'
      ', "NR_PROCESSO_CRI" = :"NR_PROCESSO_CRI"'
      ', "ST_RN" = :"ST_RN"'
      ', "NM_CRI" = :"NM_CRI"'
      ', "DT_NASC_CRI" = :"DT_NASC_CRI"'
      ', "IDADE_CRI" = :"IDADE_CRI"'
      ', "FL_IDADE_CRI" = :"FL_IDADE_CRI"'
      ', "DS_IDADE_CRI" = :"DS_IDADE_CRI"'
      ', "CD_IDADE_CRI" = :"CD_IDADE_CRI"'
      ', "FL_SEXO_CRI" = :"FL_SEXO_CRI"'
      ', "DS_SEXO_CRI" = :"DS_SEXO_CRI"'
      ', "DT_PRI_CONS_4" = :"DT_PRI_CONS_4"'
      ', "FL_INI_PROFILAXIA_4" = :"FL_INI_PROFILAXIA_4"'
      ', "DS_INI_PROFILAXIA_4" = :"DS_INI_PROFILAXIA_4"'
      ', "FL_ALEITAMENTO_4" = :"FL_ALEITAMENTO_4"'
      ', "DS_ALEITAMENTO_4" = :"DS_ALEITAMENTO_4"'
      ', "FL_ALEI_TEMPO_4" = :"FL_ALEI_TEMPO_4"'
      ', "FL_MAE_USO_TARV_4" = :"FL_MAE_USO_TARV_4"'
      ', "DS_MAE_USO_TARV_4" = :"DS_MAE_USO_TARV_4"'
      ', "FL_NAO_USO_MOTIVO_4" = :"FL_NAO_USO_MOTIVO_4"'
      ', "DS_NAO_USO_MOTIVO_4" = :"DS_NAO_USO_MOTIVO_4"'
      ', "DS_OUTROS_MOTIVO_4" = :"DS_OUTROS_MOTIVO_4"'
      ', "FL_ALEIT_MATERNO_4" = :"FL_ALEIT_MATERNO_4"'
      ', "DS_ALEIT_MATERNO_4" = :"DS_ALEIT_MATERNO_4"'
      ', "FL_ALEI_MATER_TEMPO_4" = :"FL_ALEI_MATER_TEMPO_4"'
      ', "FL_USO_PROFILAXIA_4" = :"FL_USO_PROFILAXIA_4"'
      ', "DS_USO_PROFILAXIA_4" = :"DS_USO_PROFILAXIA_4"'
      ', "FL_TEMPO_USO_PROF_4" = :"FL_TEMPO_USO_PROF_4"'
      ', "DS_TEMPO_USO_PROF_4" = :"DS_TEMPO_USO_PROF_4"'
      ', "FL_PROF_CTX_4" = :"FL_PROF_CTX_4"'
      ', "DS_PROF_CTX_4" = :"DS_PROF_CTX_4"'
      ', "DT_INICIO_CTX_4" = :"DT_INICIO_CTX_4"'
      ', "FL_PRI_CV_5" = :"FL_PRI_CV_5"'
      ', "DS_PRI_CV_5" = :"DS_PRI_CV_5"'
      ', "DT_PRI_CV_5" = :"DT_PRI_CV_5"'
      ', "FL_SEG_CV_5" = :"FL_SEG_CV_5"'
      ', "DS_SEG_CV_5" = :"DS_SEG_CV_5"'
      ', "DT_SEG_CV_5" = :"DT_SEG_CV_5"'
      ', "FL_TER_CV_5" = :"FL_TER_CV_5"'
      ', "DS_TER_CV_5" = :"DS_TER_CV_5"'
      ', "DT_TER_CV_5" = :"DT_TER_CV_5"'
      ', "FL_PRI_TEST_5" = :"FL_PRI_TEST_5"'
      ', "DS_PRI_TEST_5" = :"DS_PRI_TEST_5"'
      ', "DT_PRI_TEST_5" = :"DT_PRI_TEST_5"'
      ', "FL_SEG_TEST_5" = :"FL_SEG_TEST_5"'
      ', "DS_SEG_TEST_5" = :"DS_SEG_TEST_5"'
      ', "DT_SEG_TEST_5" = :"DT_SEG_TEST_5"'
      ', "FL_TER_TEST_5" = :"FL_TER_TEST_5"'
      ', "DS_TER_TEST_5" = :"DS_TER_TEST_5"'
      ', "DT_TER_TEST_5" = :"DT_TER_TEST_5"'
      ', "FL_QUA_TEST_5" = :"FL_QUA_TEST_5"'
      ', "DS_QUA_TEST_5" = :"DS_QUA_TEST_5"'
      ', "DT_QUA_TEST_5" = :"DT_QUA_TEST_5"'
      ', "FL_DESFECHO_5" = :"FL_DESFECHO_5"'
      ', "DS_DESFECHO_5" = :"DS_DESFECHO_5"'
      ', "DT_DESF_DIAG_5" = :"DT_DESF_DIAG_5"'
      ', "DT_DESF_ENCE_5" = :"DT_DESF_ENCE_5"'
      ', "DS_LOCAL_TRANS_5" = :"DS_LOCAL_TRANS_5"'
      ', "DT_DESF_OBITO_5" = :"DT_DESF_OBITO_5"'
      ', "CD_PROV_US_5" = :"CD_PROV_US_5"'
      ', "DS_PROV_US_5" = :"DS_PROV_US_5"'
      ', "CD_MUN_US_5" = :"CD_MUN_US_5"'
      ', "DS_MUN_US_5" = :"DS_MUN_US_5"'
      ', "CD_UND_US_5" = :"CD_UND_US_5"'
      ', "DS_UND_US_5" = :"DS_UND_US_5"'
      ', "CD_INVESTIGADOR" = :"CD_INVESTIGADOR"'
      ', "NM_INVESTIGADOR" = :"NM_INVESTIGADOR"'
      ', "NR_TEL_INVES" = :"NR_TEL_INVES"'
      ', "CD_UND" = :"CD_UND"'
      ', "DT_EXP" = :"DT_EXP"'
      ', "CD_EDI" = :"CD_EDI"'
      ', "CD_USU_INCLUSAO" = :"CD_USU_INCLUSAO"'
      ', "DT_INCLUSAO" = :"DT_INCLUSAO"'
      ', "CD_USU_ALTERACAO" = :"CD_USU_ALTERACAO"'
      ', "DT_ALTERACAO" = :"DT_ALTERACAO"'
      ', "CD_REGISTRO_GERAL" = :"CD_REGISTRO_GERAL"'
      'where'
      '  "CD_NOT_GESTANTE" = :"OLD_CD_NOT_GESTANTE" and '
      '  "CD_UND" = :"OLD_CD_UND"')
    GeneratorField.Field = 'CD_NOT_GESTANTE'
    GeneratorField.Generator = 'GEN_NOT_GESTANTE'
    Left = 1120
    Top = 267
    object TB_NOT_GESTANTECD_NOT_GESTANTE: TIntegerField
      FieldName = 'CD_NOT_GESTANTE'
      Origin = 'NOTIFICACAO_GESTANTE.CD_NOT_GESTANTE'
      Required = True
    end
    object TB_NOT_GESTANTECD_NR_NOFITICACAO: TIBStringField
      FieldName = 'CD_NR_NOFITICACAO'
      Origin = 'NOTIFICACAO_GESTANTE.CD_NR_NOFITICACAO'
    end
    object TB_NOT_GESTANTEDT_NOTIFICACAO: TDateTimeField
      FieldName = 'DT_NOTIFICACAO'
      Origin = 'NOTIFICACAO_GESTANTE.DT_NOTIFICACAO'
    end
    object TB_NOT_GESTANTECD_PROVINCIA: TIntegerField
      FieldName = 'CD_PROVINCIA'
      Origin = 'NOTIFICACAO_GESTANTE.CD_PROVINCIA'
    end
    object TB_NOT_GESTANTEDS_PROVINCIA: TIBStringField
      FieldName = 'DS_PROVINCIA'
      Origin = 'NOTIFICACAO_GESTANTE.DS_PROVINCIA'
      Size = 50
    end
    object TB_NOT_GESTANTECD_MUNICIPIO: TIntegerField
      FieldName = 'CD_MUNICIPIO'
      Origin = 'NOTIFICACAO_GESTANTE.CD_MUNICIPIO'
    end
    object TB_NOT_GESTANTEDS_MUNICIPIO: TIBStringField
      FieldName = 'DS_MUNICIPIO'
      Origin = 'NOTIFICACAO_GESTANTE.DS_MUNICIPIO'
      Size = 50
    end
    object TB_NOT_GESTANTECD_UNIDADE: TIntegerField
      FieldName = 'CD_UNIDADE'
      Origin = 'NOTIFICACAO_GESTANTE.CD_UNIDADE'
    end
    object TB_NOT_GESTANTEDS_UNIDADE: TIBStringField
      FieldName = 'DS_UNIDADE'
      Origin = 'NOTIFICACAO_GESTANTE.DS_UNIDADE'
      Size = 50
    end
    object TB_NOT_GESTANTENM_GEST: TIBStringField
      FieldName = 'NM_GEST'
      Origin = 'NOTIFICACAO_GESTANTE.NM_GEST'
      Size = 50
    end
    object TB_NOT_GESTANTEDT_NASC_GEST: TDateTimeField
      FieldName = 'DT_NASC_GEST'
      Origin = 'NOTIFICACAO_GESTANTE.DT_NASC_GEST'
    end
    object TB_NOT_GESTANTEIDADE_GEST: TIntegerField
      FieldName = 'IDADE_GEST'
      Origin = 'NOTIFICACAO_GESTANTE.IDADE_GEST'
    end
    object TB_NOT_GESTANTENR_PROCESSO_GEST: TIntegerField
      FieldName = 'NR_PROCESSO_GEST'
      Origin = 'NOTIFICACAO_GESTANTE.NR_PROCESSO_GEST'
    end
    object TB_NOT_GESTANTEDT_APROX_GEST: TDateTimeField
      FieldName = 'DT_APROX_GEST'
      Origin = 'NOTIFICACAO_GESTANTE.DT_APROX_GEST'
    end
    object TB_NOT_GESTANTEFL_SIT_ACTUAL: TIntegerField
      FieldName = 'FL_SIT_ACTUAL'
      Origin = 'NOTIFICACAO_GESTANTE.FL_SIT_ACTUAL'
    end
    object TB_NOT_GESTANTEDS_SIT_ACTUAL: TIBStringField
      FieldName = 'DS_SIT_ACTUAL'
      Origin = 'NOTIFICACAO_GESTANTE.DS_SIT_ACTUAL'
      Size = 100
    end
    object TB_NOT_GESTANTEFL_ESTADO_CIVIL: TIntegerField
      FieldName = 'FL_ESTADO_CIVIL'
      Origin = 'NOTIFICACAO_GESTANTE.FL_ESTADO_CIVIL'
    end
    object TB_NOT_GESTANTEDS_ESTADO_CIVIL: TIBStringField
      FieldName = 'DS_ESTADO_CIVIL'
      Origin = 'NOTIFICACAO_GESTANTE.DS_ESTADO_CIVIL'
      Size = 100
    end
    object TB_NOT_GESTANTECD_PROV_NASC: TIntegerField
      FieldName = 'CD_PROV_NASC'
      Origin = 'NOTIFICACAO_GESTANTE.CD_PROV_NASC'
    end
    object TB_NOT_GESTANTEDS_PROV_NASC: TIBStringField
      FieldName = 'DS_PROV_NASC'
      Origin = 'NOTIFICACAO_GESTANTE.DS_PROV_NASC'
      Size = 50
    end
    object TB_NOT_GESTANTECD_PAIS_NASC: TIntegerField
      FieldName = 'CD_PAIS_NASC'
      Origin = 'NOTIFICACAO_GESTANTE.CD_PAIS_NASC'
    end
    object TB_NOT_GESTANTEDS_PAIS_NASC: TIBStringField
      FieldName = 'DS_PAIS_NASC'
      Origin = 'NOTIFICACAO_GESTANTE.DS_PAIS_NASC'
      Size = 50
    end
    object TB_NOT_GESTANTEDS_ENDERECO_NASC: TIBStringField
      FieldName = 'DS_ENDERECO_NASC'
      Origin = 'NOTIFICACAO_GESTANTE.DS_ENDERECO_NASC'
      Size = 100
    end
    object TB_NOT_GESTANTENR_TELEMOVEL: TIBStringField
      FieldName = 'NR_TELEMOVEL'
      Origin = 'NOTIFICACAO_GESTANTE.NR_TELEMOVEL'
    end
    object TB_NOT_GESTANTECD_PROV_MORADA: TIntegerField
      FieldName = 'CD_PROV_MORADA'
      Origin = 'NOTIFICACAO_GESTANTE.CD_PROV_MORADA'
    end
    object TB_NOT_GESTANTEDS_PROV_MORADA: TIBStringField
      FieldName = 'DS_PROV_MORADA'
      Origin = 'NOTIFICACAO_GESTANTE.DS_PROV_MORADA'
      Size = 50
    end
    object TB_NOT_GESTANTECD_MUN_MORADA: TIntegerField
      FieldName = 'CD_MUN_MORADA'
      Origin = 'NOTIFICACAO_GESTANTE.CD_MUN_MORADA'
    end
    object TB_NOT_GESTANTEDS_MUN_MORADA: TIBStringField
      FieldName = 'DS_MUN_MORADA'
      Origin = 'NOTIFICACAO_GESTANTE.DS_MUN_MORADA'
      Size = 50
    end
    object TB_NOT_GESTANTEDS_BAIRRO_MORADA: TIBStringField
      FieldName = 'DS_BAIRRO_MORADA'
      Origin = 'NOTIFICACAO_GESTANTE.DS_BAIRRO_MORADA'
      Size = 50
    end
    object TB_NOT_GESTANTEDS_COMUNA_MORADA: TIBStringField
      FieldName = 'DS_COMUNA_MORADA'
      Origin = 'NOTIFICACAO_GESTANTE.DS_COMUNA_MORADA'
      Size = 50
    end
    object TB_NOT_GESTANTEFL_NIVEL_ESCO: TIntegerField
      FieldName = 'FL_NIVEL_ESCO'
      Origin = 'NOTIFICACAO_GESTANTE.FL_NIVEL_ESCO'
    end
    object TB_NOT_GESTANTEDS_NIVEL_ESCO: TIBStringField
      FieldName = 'DS_NIVEL_ESCO'
      Origin = 'NOTIFICACAO_GESTANTE.DS_NIVEL_ESCO'
      Size = 100
    end
    object TB_NOT_GESTANTEDS_OUTRO_ESCO: TIBStringField
      FieldName = 'DS_OUTRO_ESCO'
      Origin = 'NOTIFICACAO_GESTANTE.DS_OUTRO_ESCO'
      Size = 50
    end
    object TB_NOT_GESTANTEFL_FUNCAO: TIntegerField
      FieldName = 'FL_FUNCAO'
      Origin = 'NOTIFICACAO_GESTANTE.FL_FUNCAO'
    end
    object TB_NOT_GESTANTEDS_FUNCAO: TIBStringField
      FieldName = 'DS_FUNCAO'
      Origin = 'NOTIFICACAO_GESTANTE.DS_FUNCAO'
      Size = 100
    end
    object TB_NOT_GESTANTEDS_OUTRA_FUNC: TIBStringField
      FieldName = 'DS_OUTRA_FUNC'
      Origin = 'NOTIFICACAO_GESTANTE.DS_OUTRA_FUNC'
      Size = 50
    end
    object TB_NOT_GESTANTENM_MAE_GEST: TIBStringField
      FieldName = 'NM_MAE_GEST'
      Origin = 'NOTIFICACAO_GESTANTE.NM_MAE_GEST'
      Size = 50
    end
    object TB_NOT_GESTANTEFL_MOM_DIAG_VIH_1: TIntegerField
      FieldName = 'FL_MOM_DIAG_VIH_1'
      Origin = 'NOTIFICACAO_GESTANTE.FL_MOM_DIAG_VIH_1'
    end
    object TB_NOT_GESTANTEDS_MOM_DIAG_VIH_1: TIBStringField
      FieldName = 'DS_MOM_DIAG_VIH_1'
      Origin = 'NOTIFICACAO_GESTANTE.DS_MOM_DIAG_VIH_1'
      Size = 100
    end
    object TB_NOT_GESTANTEDT_DIAG_VIH_1: TDateTimeField
      FieldName = 'DT_DIAG_VIH_1'
      Origin = 'NOTIFICACAO_GESTANTE.DT_DIAG_VIH_1'
    end
    object TB_NOT_GESTANTEFL_SIT_SEROLOGICA_1: TIntegerField
      FieldName = 'FL_SIT_SEROLOGICA_1'
      Origin = 'NOTIFICACAO_GESTANTE.FL_SIT_SEROLOGICA_1'
    end
    object TB_NOT_GESTANTEDS_SIT_SEROLOGICA_1: TIBStringField
      FieldName = 'DS_SIT_SEROLOGICA_1'
      Origin = 'NOTIFICACAO_GESTANTE.DS_SIT_SEROLOGICA_1'
      Size = 100
    end
    object TB_NOT_GESTANTEFL_OCUP_PARCEIRO_1: TIntegerField
      FieldName = 'FL_OCUP_PARCEIRO_1'
      Origin = 'NOTIFICACAO_GESTANTE.FL_OCUP_PARCEIRO_1'
    end
    object TB_NOT_GESTANTEDS_OCUP_PARCEIRO_1: TIBStringField
      FieldName = 'DS_OCUP_PARCEIRO_1'
      Origin = 'NOTIFICACAO_GESTANTE.DS_OCUP_PARCEIRO_1'
      Size = 100
    end
    object TB_NOT_GESTANTEDS_OCUP_OUTROS_1: TIBStringField
      FieldName = 'DS_OCUP_OUTROS_1'
      Origin = 'NOTIFICACAO_GESTANTE.DS_OCUP_OUTROS_1'
      Size = 50
    end
    object TB_NOT_GESTANTEFL_PRENATAL_CPN_2: TIntegerField
      FieldName = 'FL_PRENATAL_CPN_2'
      Origin = 'NOTIFICACAO_GESTANTE.FL_PRENATAL_CPN_2'
    end
    object TB_NOT_GESTANTEDS_PRENATAL_CPN_2: TIBStringField
      FieldName = 'DS_PRENATAL_CPN_2'
      Origin = 'NOTIFICACAO_GESTANTE.DS_PRENATAL_CPN_2'
      Size = 100
    end
    object TB_NOT_GESTANTEDT_PRIMEIRA_CON_2: TDateTimeField
      FieldName = 'DT_PRIMEIRA_CON_2'
      Origin = 'NOTIFICACAO_GESTANTE.DT_PRIMEIRA_CON_2'
    end
    object TB_NOT_GESTANTECD_UND_CPN_2: TIntegerField
      FieldName = 'CD_UND_CPN_2'
      Origin = 'NOTIFICACAO_GESTANTE.CD_UND_CPN_2'
    end
    object TB_NOT_GESTANTEDS_UND_CPN_2: TIBStringField
      FieldName = 'DS_UND_CPN_2'
      Origin = 'NOTIFICACAO_GESTANTE.DS_UND_CPN_2'
      Size = 50
    end
    object TB_NOT_GESTANTECD_MUN_CPN_2: TIntegerField
      FieldName = 'CD_MUN_CPN_2'
      Origin = 'NOTIFICACAO_GESTANTE.CD_MUN_CPN_2'
    end
    object TB_NOT_GESTANTEDS_MUN_CPN_2: TIBStringField
      FieldName = 'DS_MUN_CPN_2'
      Origin = 'NOTIFICACAO_GESTANTE.DS_MUN_CPN_2'
      Size = 50
    end
    object TB_NOT_GESTANTECD_PROV_CPN_2: TIntegerField
      FieldName = 'CD_PROV_CPN_2'
      Origin = 'NOTIFICACAO_GESTANTE.CD_PROV_CPN_2'
    end
    object TB_NOT_GESTANTEDS_PROV_CPN_2: TIBStringField
      FieldName = 'DS_PROV_CPN_2'
      Origin = 'NOTIFICACAO_GESTANTE.DS_PROV_CPN_2'
      Size = 50
    end
    object TB_NOT_GESTANTEDT_ULT_MESTRUACAO_2: TDateTimeField
      FieldName = 'DT_ULT_MESTRUACAO_2'
      Origin = 'NOTIFICACAO_GESTANTE.DT_ULT_MESTRUACAO_2'
    end
    object TB_NOT_GESTANTEFL_IDADE_GES_2: TIntegerField
      FieldName = 'FL_IDADE_GES_2'
      Origin = 'NOTIFICACAO_GESTANTE.FL_IDADE_GES_2'
    end
    object TB_NOT_GESTANTEDT_PROVAVEL_PARTO_2: TDateTimeField
      FieldName = 'DT_PROVAVEL_PARTO_2'
      Origin = 'NOTIFICACAO_GESTANTE.DT_PROVAVEL_PARTO_2'
    end
    object TB_NOT_GESTANTEFL_ANT_GESTACOES_2: TIntegerField
      FieldName = 'FL_ANT_GESTACOES_2'
      Origin = 'NOTIFICACAO_GESTANTE.FL_ANT_GESTACOES_2'
    end
    object TB_NOT_GESTANTEFL_ANT_ABORTOS_2: TIntegerField
      FieldName = 'FL_ANT_ABORTOS_2'
      Origin = 'NOTIFICACAO_GESTANTE.FL_ANT_ABORTOS_2'
    end
    object TB_NOT_GESTANTEFL_ANT_NADO_2: TIntegerField
      FieldName = 'FL_ANT_NADO_2'
      Origin = 'NOTIFICACAO_GESTANTE.FL_ANT_NADO_2'
    end
    object TB_NOT_GESTANTEFL_USA_ANTVIRAL_2: TIntegerField
      FieldName = 'FL_USA_ANTVIRAL_2'
      Origin = 'NOTIFICACAO_GESTANTE.FL_USA_ANTVIRAL_2'
    end
    object TB_NOT_GESTANTEDS_USA_ANTVIRAL_2: TIBStringField
      FieldName = 'DS_USA_ANTVIRAL_2'
      Origin = 'NOTIFICACAO_GESTANTE.DS_USA_ANTVIRAL_2'
      Size = 100
    end
    object TB_NOT_GESTANTEDS_QUAIS_ANTVIRAL_2: TIBStringField
      FieldName = 'DS_QUAIS_ANTVIRAL_2'
      Origin = 'NOTIFICACAO_GESTANTE.DS_QUAIS_ANTVIRAL_2'
      Size = 50
    end
    object TB_NOT_GESTANTEDS_SIGLA_ANTVIRAL_2: TIBStringField
      FieldName = 'DS_SIGLA_ANTVIRAL_2'
      Origin = 'NOTIFICACAO_GESTANTE.DS_SIGLA_ANTVIRAL_2'
      Size = 50
    end
    object TB_NOT_GESTANTEDT_INI_ANTVIRAL_2: TDateTimeField
      FieldName = 'DT_INI_ANTVIRAL_2'
      Origin = 'NOTIFICACAO_GESTANTE.DT_INI_ANTVIRAL_2'
    end
    object TB_NOT_GESTANTEFL_NAO_MOTIVOS_2: TIntegerField
      FieldName = 'FL_NAO_MOTIVOS_2'
      Origin = 'NOTIFICACAO_GESTANTE.FL_NAO_MOTIVOS_2'
    end
    object TB_NOT_GESTANTEDS_NAO_MOTIVOS_2: TIBStringField
      FieldName = 'DS_NAO_MOTIVOS_2'
      Origin = 'NOTIFICACAO_GESTANTE.DS_NAO_MOTIVOS_2'
      Size = 100
    end
    object TB_NOT_GESTANTEDS_OUTROS_MOTIVOS_2: TIBStringField
      FieldName = 'DS_OUTROS_MOTIVOS_2'
      Origin = 'NOTIFICACAO_GESTANTE.DS_OUTROS_MOTIVOS_2'
      Size = 100
    end
    object TB_NOT_GESTANTEDT_PARTO_3: TDateTimeField
      FieldName = 'DT_PARTO_3'
      Origin = 'NOTIFICACAO_GESTANTE.DT_PARTO_3'
    end
    object TB_NOT_GESTANTEFL_LOCAL_PARTO: TIntegerField
      FieldName = 'FL_LOCAL_PARTO'
      Origin = 'NOTIFICACAO_GESTANTE.FL_LOCAL_PARTO'
    end
    object TB_NOT_GESTANTEDS_LOCAL_PARTO: TIBStringField
      FieldName = 'DS_LOCAL_PARTO'
      Origin = 'NOTIFICACAO_GESTANTE.DS_LOCAL_PARTO'
      Size = 30
    end
    object TB_NOT_GESTANTECD_UND_PARTO_3: TIntegerField
      FieldName = 'CD_UND_PARTO_3'
      Origin = 'NOTIFICACAO_GESTANTE.CD_UND_PARTO_3'
    end
    object TB_NOT_GESTANTEDS_UND_PARTO_3: TIBStringField
      FieldName = 'DS_UND_PARTO_3'
      Origin = 'NOTIFICACAO_GESTANTE.DS_UND_PARTO_3'
      Size = 50
    end
    object TB_NOT_GESTANTECD_MUN_PARTO_3: TIntegerField
      FieldName = 'CD_MUN_PARTO_3'
      Origin = 'NOTIFICACAO_GESTANTE.CD_MUN_PARTO_3'
    end
    object TB_NOT_GESTANTEDS_MUN_PARTO_3: TIBStringField
      FieldName = 'DS_MUN_PARTO_3'
      Origin = 'NOTIFICACAO_GESTANTE.DS_MUN_PARTO_3'
      Size = 50
    end
    object TB_NOT_GESTANTECD_PROV_PARTO_3: TIntegerField
      FieldName = 'CD_PROV_PARTO_3'
      Origin = 'NOTIFICACAO_GESTANTE.CD_PROV_PARTO_3'
    end
    object TB_NOT_GESTANTEDS_PROV_PARTO_3: TIBStringField
      FieldName = 'DS_PROV_PARTO_3'
      Origin = 'NOTIFICACAO_GESTANTE.DS_PROV_PARTO_3'
      Size = 50
    end
    object TB_NOT_GESTANTEFL_TP_PARTO_3: TIntegerField
      FieldName = 'FL_TP_PARTO_3'
      Origin = 'NOTIFICACAO_GESTANTE.FL_TP_PARTO_3'
    end
    object TB_NOT_GESTANTEDS_TP_PARTO_3: TIBStringField
      FieldName = 'DS_TP_PARTO_3'
      Origin = 'NOTIFICACAO_GESTANTE.DS_TP_PARTO_3'
      Size = 30
    end
    object TB_NOT_GESTANTEFL_TP_GEMELAR_3: TIntegerField
      FieldName = 'FL_TP_GEMELAR_3'
      Origin = 'NOTIFICACAO_GESTANTE.FL_TP_GEMELAR_3'
    end
    object TB_NOT_GESTANTEDS_TP_GEMELAR_3: TIBStringField
      FieldName = 'DS_TP_GEMELAR_3'
      Origin = 'NOTIFICACAO_GESTANTE.DS_TP_GEMELAR_3'
      Size = 30
    end
    object TB_NOT_GESTANTEDS_QUAL_GEMELAR_3: TIBStringField
      FieldName = 'DS_QUAL_GEMELAR_3'
      Origin = 'NOTIFICACAO_GESTANTE.DS_QUAL_GEMELAR_3'
      Size = 30
    end
    object TB_NOT_GESTANTEST_TP_GEMELAR_3: TIBStringField
      FieldName = 'ST_TP_GEMELAR_3'
      Origin = 'NOTIFICACAO_GESTANTE.ST_TP_GEMELAR_3'
      FixedChar = True
      Size = 3
    end
    object TB_NOT_GESTANTEFL_EST_SEROLOGICO_3: TIntegerField
      FieldName = 'FL_EST_SEROLOGICO_3'
      Origin = 'NOTIFICACAO_GESTANTE.FL_EST_SEROLOGICO_3'
    end
    object TB_NOT_GESTANTEDS_EST_SEROLOGICO_3: TIBStringField
      FieldName = 'DS_EST_SEROLOGICO_3'
      Origin = 'NOTIFICACAO_GESTANTE.DS_EST_SEROLOGICO_3'
      Size = 100
    end
    object TB_NOT_GESTANTEFL_USA_ANTVIRAL_3: TIntegerField
      FieldName = 'FL_USA_ANTVIRAL_3'
      Origin = 'NOTIFICACAO_GESTANTE.FL_USA_ANTVIRAL_3'
    end
    object TB_NOT_GESTANTEDS_USA_ANTVIRAL_3: TIBStringField
      FieldName = 'DS_USA_ANTVIRAL_3'
      Origin = 'NOTIFICACAO_GESTANTE.DS_USA_ANTVIRAL_3'
      Size = 50
    end
    object TB_NOT_GESTANTEFL_NAO_PORQUE_3: TIntegerField
      FieldName = 'FL_NAO_PORQUE_3'
      Origin = 'NOTIFICACAO_GESTANTE.FL_NAO_PORQUE_3'
    end
    object TB_NOT_GESTANTEDS_NAO_PORQUE_3: TIBStringField
      FieldName = 'DS_NAO_PORQUE_3'
      Origin = 'NOTIFICACAO_GESTANTE.DS_NAO_PORQUE_3'
      Size = 100
    end
    object TB_NOT_GESTANTEDS_OUTROS_MOTIVOS_3: TIBStringField
      FieldName = 'DS_OUTROS_MOTIVOS_3'
      Origin = 'NOTIFICACAO_GESTANTE.DS_OUTROS_MOTIVOS_3'
      Size = 100
    end
    object TB_NOT_GESTANTEFL_OBITO_MATERNO_3: TIntegerField
      FieldName = 'FL_OBITO_MATERNO_3'
      Origin = 'NOTIFICACAO_GESTANTE.FL_OBITO_MATERNO_3'
    end
    object TB_NOT_GESTANTEDS_OBITO_MATERNO_3: TIBStringField
      FieldName = 'DS_OBITO_MATERNO_3'
      Origin = 'NOTIFICACAO_GESTANTE.DS_OBITO_MATERNO_3'
      Size = 30
    end
    object TB_NOT_GESTANTEFL_DESF_GEST_3: TIntegerField
      FieldName = 'FL_DESF_GEST_3'
      Origin = 'NOTIFICACAO_GESTANTE.FL_DESF_GEST_3'
    end
    object TB_NOT_GESTANTEDS_DESF_GEST_3: TIBStringField
      FieldName = 'DS_DESF_GEST_3'
      Origin = 'NOTIFICACAO_GESTANTE.DS_DESF_GEST_3'
      Size = 30
    end
    object TB_NOT_GESTANTEFL_NADO_VIVO_3: TIntegerField
      FieldName = 'FL_NADO_VIVO_3'
      Origin = 'NOTIFICACAO_GESTANTE.FL_NADO_VIVO_3'
    end
    object TB_NOT_GESTANTEDS_NADO_VIVO_3: TIBStringField
      FieldName = 'DS_NADO_VIVO_3'
      Origin = 'NOTIFICACAO_GESTANTE.DS_NADO_VIVO_3'
      Size = 30
    end
    object TB_NOT_GESTANTENR_PROCESSO_CRI: TIntegerField
      FieldName = 'NR_PROCESSO_CRI'
      Origin = 'NOTIFICACAO_GESTANTE.NR_PROCESSO_CRI'
    end
    object TB_NOT_GESTANTEST_RN: TIBStringField
      FieldName = 'ST_RN'
      Origin = 'NOTIFICACAO_GESTANTE.ST_RN'
      FixedChar = True
      Size = 2
    end
    object TB_NOT_GESTANTENM_CRI: TIBStringField
      FieldName = 'NM_CRI'
      Origin = 'NOTIFICACAO_GESTANTE.NM_CRI'
      Size = 50
    end
    object TB_NOT_GESTANTEDT_NASC_CRI: TDateTimeField
      FieldName = 'DT_NASC_CRI'
      Origin = 'NOTIFICACAO_GESTANTE.DT_NASC_CRI'
    end
    object TB_NOT_GESTANTEIDADE_CRI: TIntegerField
      FieldName = 'IDADE_CRI'
      Origin = 'NOTIFICACAO_GESTANTE.IDADE_CRI'
    end
    object TB_NOT_GESTANTEFL_IDADE_CRI: TIntegerField
      FieldName = 'FL_IDADE_CRI'
      Origin = 'NOTIFICACAO_GESTANTE.FL_IDADE_CRI'
    end
    object TB_NOT_GESTANTEDS_IDADE_CRI: TIBStringField
      FieldName = 'DS_IDADE_CRI'
      Origin = 'NOTIFICACAO_GESTANTE.DS_IDADE_CRI'
      Size = 30
    end
    object TB_NOT_GESTANTECD_IDADE_CRI: TIntegerField
      FieldName = 'CD_IDADE_CRI'
      Origin = 'NOTIFICACAO_GESTANTE.CD_IDADE_CRI'
    end
    object TB_NOT_GESTANTEFL_SEXO_CRI: TIntegerField
      FieldName = 'FL_SEXO_CRI'
      Origin = 'NOTIFICACAO_GESTANTE.FL_SEXO_CRI'
    end
    object TB_NOT_GESTANTEDS_SEXO_CRI: TIBStringField
      FieldName = 'DS_SEXO_CRI'
      Origin = 'NOTIFICACAO_GESTANTE.DS_SEXO_CRI'
      Size = 40
    end
    object TB_NOT_GESTANTEDT_PRI_CONS_4: TDateTimeField
      FieldName = 'DT_PRI_CONS_4'
      Origin = 'NOTIFICACAO_GESTANTE.DT_PRI_CONS_4'
    end
    object TB_NOT_GESTANTEFL_INI_PROFILAXIA_4: TIntegerField
      FieldName = 'FL_INI_PROFILAXIA_4'
      Origin = 'NOTIFICACAO_GESTANTE.FL_INI_PROFILAXIA_4'
    end
    object TB_NOT_GESTANTEDS_INI_PROFILAXIA_4: TIBStringField
      FieldName = 'DS_INI_PROFILAXIA_4'
      Origin = 'NOTIFICACAO_GESTANTE.DS_INI_PROFILAXIA_4'
      Size = 30
    end
    object TB_NOT_GESTANTEFL_ALEITAMENTO_4: TIntegerField
      FieldName = 'FL_ALEITAMENTO_4'
      Origin = 'NOTIFICACAO_GESTANTE.FL_ALEITAMENTO_4'
    end
    object TB_NOT_GESTANTEDS_ALEITAMENTO_4: TIBStringField
      FieldName = 'DS_ALEITAMENTO_4'
      Origin = 'NOTIFICACAO_GESTANTE.DS_ALEITAMENTO_4'
      Size = 50
    end
    object TB_NOT_GESTANTEFL_ALEI_TEMPO_4: TIntegerField
      FieldName = 'FL_ALEI_TEMPO_4'
      Origin = 'NOTIFICACAO_GESTANTE.FL_ALEI_TEMPO_4'
    end
    object TB_NOT_GESTANTEFL_MAE_USO_TARV_4: TIntegerField
      FieldName = 'FL_MAE_USO_TARV_4'
      Origin = 'NOTIFICACAO_GESTANTE.FL_MAE_USO_TARV_4'
    end
    object TB_NOT_GESTANTEDS_MAE_USO_TARV_4: TIBStringField
      FieldName = 'DS_MAE_USO_TARV_4'
      Origin = 'NOTIFICACAO_GESTANTE.DS_MAE_USO_TARV_4'
      Size = 40
    end
    object TB_NOT_GESTANTEFL_NAO_USO_MOTIVO_4: TIntegerField
      FieldName = 'FL_NAO_USO_MOTIVO_4'
      Origin = 'NOTIFICACAO_GESTANTE.FL_NAO_USO_MOTIVO_4'
    end
    object TB_NOT_GESTANTEDS_NAO_USO_MOTIVO_4: TIBStringField
      FieldName = 'DS_NAO_USO_MOTIVO_4'
      Origin = 'NOTIFICACAO_GESTANTE.DS_NAO_USO_MOTIVO_4'
      Size = 100
    end
    object TB_NOT_GESTANTEDS_OUTROS_MOTIVO_4: TIBStringField
      FieldName = 'DS_OUTROS_MOTIVO_4'
      Origin = 'NOTIFICACAO_GESTANTE.DS_OUTROS_MOTIVO_4'
      Size = 100
    end
    object TB_NOT_GESTANTEFL_ALEIT_MATERNO_4: TIntegerField
      FieldName = 'FL_ALEIT_MATERNO_4'
      Origin = 'NOTIFICACAO_GESTANTE.FL_ALEIT_MATERNO_4'
    end
    object TB_NOT_GESTANTEDS_ALEIT_MATERNO_4: TIBStringField
      FieldName = 'DS_ALEIT_MATERNO_4'
      Origin = 'NOTIFICACAO_GESTANTE.DS_ALEIT_MATERNO_4'
      Size = 30
    end
    object TB_NOT_GESTANTEFL_ALEI_MATER_TEMPO_4: TIntegerField
      FieldName = 'FL_ALEI_MATER_TEMPO_4'
      Origin = 'NOTIFICACAO_GESTANTE.FL_ALEI_MATER_TEMPO_4'
    end
    object TB_NOT_GESTANTEFL_USO_PROFILAXIA_4: TIntegerField
      FieldName = 'FL_USO_PROFILAXIA_4'
      Origin = 'NOTIFICACAO_GESTANTE.FL_USO_PROFILAXIA_4'
    end
    object TB_NOT_GESTANTEDS_USO_PROFILAXIA_4: TIBStringField
      FieldName = 'DS_USO_PROFILAXIA_4'
      Origin = 'NOTIFICACAO_GESTANTE.DS_USO_PROFILAXIA_4'
      Size = 30
    end
    object TB_NOT_GESTANTEFL_TEMPO_USO_PROF_4: TIntegerField
      FieldName = 'FL_TEMPO_USO_PROF_4'
      Origin = 'NOTIFICACAO_GESTANTE.FL_TEMPO_USO_PROF_4'
    end
    object TB_NOT_GESTANTEDS_TEMPO_USO_PROF_4: TIBStringField
      FieldName = 'DS_TEMPO_USO_PROF_4'
      Origin = 'NOTIFICACAO_GESTANTE.DS_TEMPO_USO_PROF_4'
      Size = 50
    end
    object TB_NOT_GESTANTEFL_PROF_CTX_4: TIntegerField
      FieldName = 'FL_PROF_CTX_4'
      Origin = 'NOTIFICACAO_GESTANTE.FL_PROF_CTX_4'
    end
    object TB_NOT_GESTANTEDS_PROF_CTX_4: TIBStringField
      FieldName = 'DS_PROF_CTX_4'
      Origin = 'NOTIFICACAO_GESTANTE.DS_PROF_CTX_4'
      Size = 30
    end
    object TB_NOT_GESTANTEDT_INICIO_CTX_4: TDateTimeField
      FieldName = 'DT_INICIO_CTX_4'
      Origin = 'NOTIFICACAO_GESTANTE.DT_INICIO_CTX_4'
    end
    object TB_NOT_GESTANTEFL_PRI_CV_5: TIntegerField
      FieldName = 'FL_PRI_CV_5'
      Origin = 'NOTIFICACAO_GESTANTE.FL_PRI_CV_5'
    end
    object TB_NOT_GESTANTEDS_PRI_CV_5: TIBStringField
      FieldName = 'DS_PRI_CV_5'
      Origin = 'NOTIFICACAO_GESTANTE.DS_PRI_CV_5'
      Size = 30
    end
    object TB_NOT_GESTANTEDT_PRI_CV_5: TDateTimeField
      FieldName = 'DT_PRI_CV_5'
      Origin = 'NOTIFICACAO_GESTANTE.DT_PRI_CV_5'
    end
    object TB_NOT_GESTANTEFL_SEG_CV_5: TIntegerField
      FieldName = 'FL_SEG_CV_5'
      Origin = 'NOTIFICACAO_GESTANTE.FL_SEG_CV_5'
    end
    object TB_NOT_GESTANTEDS_SEG_CV_5: TIBStringField
      FieldName = 'DS_SEG_CV_5'
      Origin = 'NOTIFICACAO_GESTANTE.DS_SEG_CV_5'
      Size = 30
    end
    object TB_NOT_GESTANTEDT_SEG_CV_5: TDateTimeField
      FieldName = 'DT_SEG_CV_5'
      Origin = 'NOTIFICACAO_GESTANTE.DT_SEG_CV_5'
    end
    object TB_NOT_GESTANTEFL_TER_CV_5: TIntegerField
      FieldName = 'FL_TER_CV_5'
      Origin = 'NOTIFICACAO_GESTANTE.FL_TER_CV_5'
    end
    object TB_NOT_GESTANTEDS_TER_CV_5: TIBStringField
      FieldName = 'DS_TER_CV_5'
      Origin = 'NOTIFICACAO_GESTANTE.DS_TER_CV_5'
      Size = 30
    end
    object TB_NOT_GESTANTEDT_TER_CV_5: TDateTimeField
      FieldName = 'DT_TER_CV_5'
      Origin = 'NOTIFICACAO_GESTANTE.DT_TER_CV_5'
    end
    object TB_NOT_GESTANTEFL_PRI_TEST_5: TIntegerField
      FieldName = 'FL_PRI_TEST_5'
      Origin = 'NOTIFICACAO_GESTANTE.FL_PRI_TEST_5'
    end
    object TB_NOT_GESTANTEDS_PRI_TEST_5: TIBStringField
      FieldName = 'DS_PRI_TEST_5'
      Origin = 'NOTIFICACAO_GESTANTE.DS_PRI_TEST_5'
      Size = 30
    end
    object TB_NOT_GESTANTEDT_PRI_TEST_5: TDateTimeField
      FieldName = 'DT_PRI_TEST_5'
      Origin = 'NOTIFICACAO_GESTANTE.DT_PRI_TEST_5'
    end
    object TB_NOT_GESTANTEFL_SEG_TEST_5: TIntegerField
      FieldName = 'FL_SEG_TEST_5'
      Origin = 'NOTIFICACAO_GESTANTE.FL_SEG_TEST_5'
    end
    object TB_NOT_GESTANTEDS_SEG_TEST_5: TIBStringField
      FieldName = 'DS_SEG_TEST_5'
      Origin = 'NOTIFICACAO_GESTANTE.DS_SEG_TEST_5'
      Size = 30
    end
    object TB_NOT_GESTANTEDT_SEG_TEST_5: TDateTimeField
      FieldName = 'DT_SEG_TEST_5'
      Origin = 'NOTIFICACAO_GESTANTE.DT_SEG_TEST_5'
    end
    object TB_NOT_GESTANTEFL_TER_TEST_5: TIntegerField
      FieldName = 'FL_TER_TEST_5'
      Origin = 'NOTIFICACAO_GESTANTE.FL_TER_TEST_5'
    end
    object TB_NOT_GESTANTEDS_TER_TEST_5: TIBStringField
      FieldName = 'DS_TER_TEST_5'
      Origin = 'NOTIFICACAO_GESTANTE.DS_TER_TEST_5'
      Size = 30
    end
    object TB_NOT_GESTANTEDT_TER_TEST_5: TDateTimeField
      FieldName = 'DT_TER_TEST_5'
      Origin = 'NOTIFICACAO_GESTANTE.DT_TER_TEST_5'
    end
    object TB_NOT_GESTANTEFL_QUA_TEST_5: TIntegerField
      FieldName = 'FL_QUA_TEST_5'
      Origin = 'NOTIFICACAO_GESTANTE.FL_QUA_TEST_5'
    end
    object TB_NOT_GESTANTEDS_QUA_TEST_5: TIBStringField
      FieldName = 'DS_QUA_TEST_5'
      Origin = 'NOTIFICACAO_GESTANTE.DS_QUA_TEST_5'
      Size = 30
    end
    object TB_NOT_GESTANTEDT_QUA_TEST_5: TDateTimeField
      FieldName = 'DT_QUA_TEST_5'
      Origin = 'NOTIFICACAO_GESTANTE.DT_QUA_TEST_5'
    end
    object TB_NOT_GESTANTEFL_DESFECHO_5: TIntegerField
      FieldName = 'FL_DESFECHO_5'
      Origin = 'NOTIFICACAO_GESTANTE.FL_DESFECHO_5'
    end
    object TB_NOT_GESTANTEDS_DESFECHO_5: TIBStringField
      FieldName = 'DS_DESFECHO_5'
      Origin = 'NOTIFICACAO_GESTANTE.DS_DESFECHO_5'
      Size = 40
    end
    object TB_NOT_GESTANTEDT_DESF_DIAG_5: TDateTimeField
      FieldName = 'DT_DESF_DIAG_5'
      Origin = 'NOTIFICACAO_GESTANTE.DT_DESF_DIAG_5'
    end
    object TB_NOT_GESTANTEDT_DESF_ENCE_5: TDateTimeField
      FieldName = 'DT_DESF_ENCE_5'
      Origin = 'NOTIFICACAO_GESTANTE.DT_DESF_ENCE_5'
    end
    object TB_NOT_GESTANTEDS_LOCAL_TRANS_5: TIBStringField
      FieldName = 'DS_LOCAL_TRANS_5'
      Origin = 'NOTIFICACAO_GESTANTE.DS_LOCAL_TRANS_5'
      Size = 50
    end
    object TB_NOT_GESTANTEDT_DESF_OBITO_5: TDateTimeField
      FieldName = 'DT_DESF_OBITO_5'
      Origin = 'NOTIFICACAO_GESTANTE.DT_DESF_OBITO_5'
    end
    object TB_NOT_GESTANTECD_PROV_US_5: TIntegerField
      FieldName = 'CD_PROV_US_5'
      Origin = 'NOTIFICACAO_GESTANTE.CD_PROV_US_5'
    end
    object TB_NOT_GESTANTEDS_PROV_US_5: TIBStringField
      FieldName = 'DS_PROV_US_5'
      Origin = 'NOTIFICACAO_GESTANTE.DS_PROV_US_5'
      Size = 50
    end
    object TB_NOT_GESTANTECD_MUN_US_5: TIntegerField
      FieldName = 'CD_MUN_US_5'
      Origin = 'NOTIFICACAO_GESTANTE.CD_MUN_US_5'
    end
    object TB_NOT_GESTANTEDS_MUN_US_5: TIBStringField
      FieldName = 'DS_MUN_US_5'
      Origin = 'NOTIFICACAO_GESTANTE.DS_MUN_US_5'
      Size = 50
    end
    object TB_NOT_GESTANTECD_UND_US_5: TIntegerField
      FieldName = 'CD_UND_US_5'
      Origin = 'NOTIFICACAO_GESTANTE.CD_UND_US_5'
    end
    object TB_NOT_GESTANTEDS_UND_US_5: TIBStringField
      FieldName = 'DS_UND_US_5'
      Origin = 'NOTIFICACAO_GESTANTE.DS_UND_US_5'
      Size = 50
    end
    object TB_NOT_GESTANTECD_INVESTIGADOR: TIntegerField
      FieldName = 'CD_INVESTIGADOR'
      Origin = 'NOTIFICACAO_GESTANTE.CD_INVESTIGADOR'
    end
    object TB_NOT_GESTANTENM_INVESTIGADOR: TIBStringField
      FieldName = 'NM_INVESTIGADOR'
      Origin = 'NOTIFICACAO_GESTANTE.NM_INVESTIGADOR'
      Size = 50
    end
    object TB_NOT_GESTANTENR_TEL_INVES: TIBStringField
      FieldName = 'NR_TEL_INVES'
      Origin = 'NOTIFICACAO_GESTANTE.NR_TEL_INVES'
    end
    object TB_NOT_GESTANTECD_UND: TIntegerField
      FieldName = 'CD_UND'
      Origin = 'NOTIFICACAO_GESTANTE.CD_UND'
      Required = True
    end
    object TB_NOT_GESTANTEDT_EXP: TDateTimeField
      FieldName = 'DT_EXP'
      Origin = 'NOTIFICACAO_GESTANTE.DT_EXP'
    end
    object TB_NOT_GESTANTECD_EDI: TIntegerField
      FieldName = 'CD_EDI'
      Origin = 'NOTIFICACAO_GESTANTE.CD_EDI'
    end
    object TB_NOT_GESTANTECD_USU_INCLUSAO: TIntegerField
      FieldName = 'CD_USU_INCLUSAO'
      Origin = 'NOTIFICACAO_GESTANTE.CD_USU_INCLUSAO'
    end
    object TB_NOT_GESTANTEDT_INCLUSAO: TDateTimeField
      FieldName = 'DT_INCLUSAO'
      Origin = 'NOTIFICACAO_GESTANTE.DT_INCLUSAO'
    end
    object TB_NOT_GESTANTECD_USU_ALTERACAO: TIntegerField
      FieldName = 'CD_USU_ALTERACAO'
      Origin = 'NOTIFICACAO_GESTANTE.CD_USU_ALTERACAO'
    end
    object TB_NOT_GESTANTEDT_ALTERACAO: TDateTimeField
      FieldName = 'DT_ALTERACAO'
      Origin = 'NOTIFICACAO_GESTANTE.DT_ALTERACAO'
    end
    object TB_NOT_GESTANTECD_REGISTRO_GERAL: TIntegerField
      FieldName = 'CD_REGISTRO_GERAL'
      Origin = 'NOTIFICACAO_GESTANTE.CD_REGISTRO_GERAL'
    end
  end
  object cds: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 880
    Top = 363
  end
  object TB_ATV_AR: TIBDataSet
    Database = DM.DB
    Transaction = DM.TS
    BufferChunks = 1000
    CachedUpdates = False
    DeleteSQL.Strings = (
      'delete from "REGISTRO_ATV_AR"'
      'where'
      '  "CD_REGISTRO_ATV" = :"OLD_CD_REGISTRO_ATV" and '
      '  "CD_UND" = :"OLD_CD_UND"')
    InsertSQL.Strings = (
      'insert into "REGISTRO_ATV_AR"'
      '('
      '  "CD_REGISTRO_ATV"'
      ', "CD_UND"'
      ', "DT_REGISTRO"'
      ', "CD_UNIDADE"'
      ', "CD_PROVINCIA"'
      ', "CD_MUNICIPIO"'
      ', "VL_MESANO"'
      ', "VL_ACONSELHADOS"'
      ', "VL_POSITIVOS"'
      ', "VL_NEGATIVOS"'
      ', "VL_INDETERMINADOS"'
      ', "FL_ACEITAR"'
      ', "FL_STATUS"'
      ', "DT_EXP"'
      ', "CD_EDI"'
      ', "CD_USU_INCLUSAO"'
      ', "DT_INCLUSAO"'
      ', "CD_USU_ALTERACAO"'
      ', "DT_ALTERACAO"'
      ', "CD_REGISTRO_GERAL"'
      ')'
      'values'
      '('
      '  :"CD_REGISTRO_ATV"'
      ', :"CD_UND"'
      ', :"DT_REGISTRO"'
      ', :"CD_UNIDADE"'
      ', :"CD_PROVINCIA"'
      ', :"CD_MUNICIPIO"'
      ', :"VL_MESANO"'
      ', :"VL_ACONSELHADOS"'
      ', :"VL_POSITIVOS"'
      ', :"VL_NEGATIVOS"'
      ', :"VL_INDETERMINADOS"'
      ', :"FL_ACEITAR"'
      ', :"FL_STATUS"'
      ', :"DT_EXP"'
      ', :"CD_EDI"'
      ', :"CD_USU_INCLUSAO"'
      ', :"DT_INCLUSAO"'
      ', :"CD_USU_ALTERACAO"'
      ', :"DT_ALTERACAO"'
      ', :"CD_REGISTRO_GERAL"'
      ')')
    SelectSQL.Strings = (
      'select "REGISTRO_ATV_AR"."CD_REGISTRO_ATV"'
      '      ,"REGISTRO_ATV_AR"."CD_UND"'
      '      ,"REGISTRO_ATV_AR"."DT_REGISTRO"'
      '      ,"REGISTRO_ATV_AR"."CD_UNIDADE"'
      '      ,"REGISTRO_ATV_AR"."CD_PROVINCIA"'
      '      ,"REGISTRO_ATV_AR"."CD_MUNICIPIO"'
      '      ,"REGISTRO_ATV_AR"."VL_MESANO"'
      '      ,"REGISTRO_ATV_AR"."VL_ACONSELHADOS"'
      '      ,"REGISTRO_ATV_AR"."VL_POSITIVOS"'
      '      ,"REGISTRO_ATV_AR"."VL_NEGATIVOS"'
      '      ,"REGISTRO_ATV_AR"."VL_INDETERMINADOS"'
      '      ,"REGISTRO_ATV_AR"."FL_ACEITAR"'
      '      ,"REGISTRO_ATV_AR"."FL_STATUS"'
      '      ,"REGISTRO_ATV_AR"."DT_EXP"'
      '      ,"REGISTRO_ATV_AR"."CD_EDI"'
      '      ,"REGISTRO_ATV_AR"."CD_USU_INCLUSAO"'
      '      ,"REGISTRO_ATV_AR"."DT_INCLUSAO"'
      '      ,"REGISTRO_ATV_AR"."CD_USU_ALTERACAO"'
      '      ,"REGISTRO_ATV_AR"."DT_ALTERACAO"'
      '      ,"REGISTRO_ATV_AR"."CD_REGISTRO_GERAL"'
      'from "REGISTRO_ATV_AR"')
    ModifySQL.Strings = (
      'update "REGISTRO_ATV_AR"'
      'set'
      ' "CD_REGISTRO_ATV" = :"CD_REGISTRO_ATV"'
      ', "CD_UND" = :"CD_UND"'
      ', "DT_REGISTRO" = :"DT_REGISTRO"'
      ', "CD_UNIDADE" = :"CD_UNIDADE"'
      ', "CD_PROVINCIA" = :"CD_PROVINCIA"'
      ', "CD_MUNICIPIO" = :"CD_MUNICIPIO"'
      ', "VL_MESANO" = :"VL_MESANO"'
      ', "VL_ACONSELHADOS" = :"VL_ACONSELHADOS"'
      ', "VL_POSITIVOS" = :"VL_POSITIVOS"'
      ', "VL_NEGATIVOS" = :"VL_NEGATIVOS"'
      ', "VL_INDETERMINADOS" = :"VL_INDETERMINADOS"'
      ', "FL_ACEITAR" = :"FL_ACEITAR"'
      ', "FL_STATUS" = :"FL_STATUS"'
      ', "DT_EXP" = :"DT_EXP"'
      ', "CD_EDI" = :"CD_EDI"'
      ', "CD_USU_INCLUSAO" = :"CD_USU_INCLUSAO"'
      ', "DT_INCLUSAO" = :"DT_INCLUSAO"'
      ', "CD_USU_ALTERACAO" = :"CD_USU_ALTERACAO"'
      ', "DT_ALTERACAO" = :"DT_ALTERACAO"'
      ', "CD_REGISTRO_GERAL" = :"CD_REGISTRO_GERAL"'
      'where'
      '  "CD_REGISTRO_ATV" = :"OLD_CD_REGISTRO_ATV" and '
      '  "CD_UND" = :"OLD_CD_UND"')
    Left = 56
    Top = 16
    object TB_ATV_ARCD_REGISTRO_ATV: TIntegerField
      FieldName = 'CD_REGISTRO_ATV'
      Origin = 'REGISTRO_ATV_AR.CD_REGISTRO_ATV'
      Required = True
    end
    object TB_ATV_ARCD_UND: TIntegerField
      FieldName = 'CD_UND'
      Origin = 'REGISTRO_ATV_AR.CD_UND'
      Required = True
    end
    object TB_ATV_ARDT_REGISTRO: TDateTimeField
      FieldName = 'DT_REGISTRO'
      Origin = 'REGISTRO_ATV_AR.DT_REGISTRO'
      Required = True
    end
    object TB_ATV_ARCD_UNIDADE: TIntegerField
      FieldName = 'CD_UNIDADE'
      Origin = 'REGISTRO_ATV_AR.CD_UNIDADE'
      Required = True
    end
    object TB_ATV_ARCD_PROVINCIA: TIntegerField
      FieldName = 'CD_PROVINCIA'
      Origin = 'REGISTRO_ATV_AR.CD_PROVINCIA'
      Required = True
    end
    object TB_ATV_ARCD_MUNICIPIO: TIntegerField
      FieldName = 'CD_MUNICIPIO'
      Origin = 'REGISTRO_ATV_AR.CD_MUNICIPIO'
      Required = True
    end
    object TB_ATV_ARVL_MESANO: TIBStringField
      FieldName = 'VL_MESANO'
      Origin = 'REGISTRO_ATV_AR.VL_MESANO'
      Required = True
      Size = 8
    end
    object TB_ATV_ARVL_ACONSELHADOS: TIntegerField
      FieldName = 'VL_ACONSELHADOS'
      Origin = 'REGISTRO_ATV_AR.VL_ACONSELHADOS'
    end
    object TB_ATV_ARVL_POSITIVOS: TIntegerField
      FieldName = 'VL_POSITIVOS'
      Origin = 'REGISTRO_ATV_AR.VL_POSITIVOS'
    end
    object TB_ATV_ARVL_NEGATIVOS: TIntegerField
      FieldName = 'VL_NEGATIVOS'
      Origin = 'REGISTRO_ATV_AR.VL_NEGATIVOS'
    end
    object TB_ATV_ARVL_INDETERMINADOS: TIntegerField
      FieldName = 'VL_INDETERMINADOS'
      Origin = 'REGISTRO_ATV_AR.VL_INDETERMINADOS'
    end
    object TB_ATV_ARFL_ACEITAR: TIntegerField
      FieldName = 'FL_ACEITAR'
      Origin = 'REGISTRO_ATV_AR.FL_ACEITAR'
    end
    object TB_ATV_ARFL_STATUS: TIBStringField
      FieldName = 'FL_STATUS'
      Origin = 'REGISTRO_ATV_AR.FL_STATUS'
      FixedChar = True
      Size = 1
    end
    object TB_ATV_ARDT_EXP: TDateTimeField
      FieldName = 'DT_EXP'
      Origin = 'REGISTRO_ATV_AR.DT_EXP'
    end
    object TB_ATV_ARCD_EDI: TIntegerField
      FieldName = 'CD_EDI'
      Origin = 'REGISTRO_ATV_AR.CD_EDI'
    end
    object TB_ATV_ARCD_USU_INCLUSAO: TIntegerField
      FieldName = 'CD_USU_INCLUSAO'
      Origin = 'REGISTRO_ATV_AR.CD_USU_INCLUSAO'
    end
    object TB_ATV_ARDT_INCLUSAO: TDateTimeField
      FieldName = 'DT_INCLUSAO'
      Origin = 'REGISTRO_ATV_AR.DT_INCLUSAO'
    end
    object TB_ATV_ARCD_USU_ALTERACAO: TIntegerField
      FieldName = 'CD_USU_ALTERACAO'
      Origin = 'REGISTRO_ATV_AR.CD_USU_ALTERACAO'
    end
    object TB_ATV_ARDT_ALTERACAO: TDateTimeField
      FieldName = 'DT_ALTERACAO'
      Origin = 'REGISTRO_ATV_AR.DT_ALTERACAO'
    end
    object TB_ATV_ARCD_REGISTRO_GERAL: TIntegerField
      FieldName = 'CD_REGISTRO_GERAL'
      Origin = 'REGISTRO_ATV_AR.CD_REGISTRO_GERAL'
    end
  end
  object TB_PTV_AR: TIBDataSet
    Database = DM.DB
    Transaction = DM.TS
    BufferChunks = 1000
    CachedUpdates = False
    DeleteSQL.Strings = (
      'delete from "REGISTRO_PTV_AR"'
      'where'
      '  "CD_REGISTRO_PTV" = :"OLD_CD_REGISTRO_PTV" and '
      '  "CD_UND" = :"OLD_CD_UND"')
    InsertSQL.Strings = (
      'insert into "REGISTRO_PTV_AR"'
      '('
      '  "CD_REGISTRO_PTV"'
      ', "CD_UND"'
      ', "DT_REGISTRO"'
      ', "CD_UNIDADE"'
      ', "CD_PROVINCIA"'
      ', "CD_MUNICIPIO"'
      ', "VL_MESANO"'
      ', "VL_ADMITIDAS_PTV"'
      ', "VL_ADMITIDAS_PARTO"'
      ', "VL_ADMITIDAS_POS_PARTO"'
      ', "VL_TERAPIA_COMPLETA"'
      ', "VL_TERAPIA_OUTRO"'
      ', "VL_TERAPIA_NENHUM"'
      ', "VL_TOTAL_CRIANCA"'
      ', "FL_ACEITAR"'
      ', "FL_STATUS"'
      ', "DT_EXP"'
      ', "CD_EDI"'
      ', "CD_USU_INCLUSAO"'
      ', "DT_INCLUSAO"'
      ', "CD_USU_ALTERACAO"'
      ', "DT_ALTERACAO"'
      ', "CD_REGISTRO_GERAL"'
      ')'
      'values'
      '('
      '  :"CD_REGISTRO_PTV"'
      ', :"CD_UND"'
      ', :"DT_REGISTRO"'
      ', :"CD_UNIDADE"'
      ', :"CD_PROVINCIA"'
      ', :"CD_MUNICIPIO"'
      ', :"VL_MESANO"'
      ', :"VL_ADMITIDAS_PTV"'
      ', :"VL_ADMITIDAS_PARTO"'
      ', :"VL_ADMITIDAS_POS_PARTO"'
      ', :"VL_TERAPIA_COMPLETA"'
      ', :"VL_TERAPIA_OUTRO"'
      ', :"VL_TERAPIA_NENHUM"'
      ', :"VL_TOTAL_CRIANCA"'
      ', :"FL_ACEITAR"'
      ', :"FL_STATUS"'
      ', :"DT_EXP"'
      ', :"CD_EDI"'
      ', :"CD_USU_INCLUSAO"'
      ', :"DT_INCLUSAO"'
      ', :"CD_USU_ALTERACAO"'
      ', :"DT_ALTERACAO"'
      ', :"CD_REGISTRO_GERAL"'
      ')')
    SelectSQL.Strings = (
      'select "REGISTRO_PTV_AR"."CD_REGISTRO_PTV"'
      '      ,"REGISTRO_PTV_AR"."CD_UND"'
      '      ,"REGISTRO_PTV_AR"."DT_REGISTRO"'
      '      ,"REGISTRO_PTV_AR"."CD_UNIDADE"'
      '      ,"REGISTRO_PTV_AR"."CD_PROVINCIA"'
      '      ,"REGISTRO_PTV_AR"."CD_MUNICIPIO"'
      '      ,"REGISTRO_PTV_AR"."VL_MESANO"'
      '      ,"REGISTRO_PTV_AR"."VL_ADMITIDAS_PTV"'
      '      ,"REGISTRO_PTV_AR"."VL_ADMITIDAS_PARTO"'
      '      ,"REGISTRO_PTV_AR"."VL_ADMITIDAS_POS_PARTO"'
      '      ,"REGISTRO_PTV_AR"."VL_TERAPIA_COMPLETA"'
      '      ,"REGISTRO_PTV_AR"."VL_TERAPIA_OUTRO"'
      '      ,"REGISTRO_PTV_AR"."VL_TERAPIA_NENHUM"'
      '      ,"REGISTRO_PTV_AR"."VL_TOTAL_CRIANCA"'
      '      ,"REGISTRO_PTV_AR"."FL_ACEITAR"'
      '      ,"REGISTRO_PTV_AR"."FL_STATUS"'
      '      ,"REGISTRO_PTV_AR"."DT_EXP"'
      '      ,"REGISTRO_PTV_AR"."CD_EDI"'
      '      ,"REGISTRO_PTV_AR"."CD_USU_INCLUSAO"'
      '      ,"REGISTRO_PTV_AR"."DT_INCLUSAO"'
      '      ,"REGISTRO_PTV_AR"."CD_USU_ALTERACAO"'
      '      ,"REGISTRO_PTV_AR"."DT_ALTERACAO"'
      '      ,"REGISTRO_PTV_AR"."CD_REGISTRO_GERAL"'
      'from "REGISTRO_PTV_AR"')
    ModifySQL.Strings = (
      'update "REGISTRO_PTV_AR"'
      'set'
      ' "CD_REGISTRO_PTV" = :"CD_REGISTRO_PTV"'
      ', "CD_UND" = :"CD_UND"'
      ', "DT_REGISTRO" = :"DT_REGISTRO"'
      ', "CD_UNIDADE" = :"CD_UNIDADE"'
      ', "CD_PROVINCIA" = :"CD_PROVINCIA"'
      ', "CD_MUNICIPIO" = :"CD_MUNICIPIO"'
      ', "VL_MESANO" = :"VL_MESANO"'
      ', "VL_ADMITIDAS_PTV" = :"VL_ADMITIDAS_PTV"'
      ', "VL_ADMITIDAS_PARTO" = :"VL_ADMITIDAS_PARTO"'
      ', "VL_ADMITIDAS_POS_PARTO" = :"VL_ADMITIDAS_POS_PARTO"'
      ', "VL_TERAPIA_COMPLETA" = :"VL_TERAPIA_COMPLETA"'
      ', "VL_TERAPIA_OUTRO" = :"VL_TERAPIA_OUTRO"'
      ', "VL_TERAPIA_NENHUM" = :"VL_TERAPIA_NENHUM"'
      ', "VL_TOTAL_CRIANCA" = :"VL_TOTAL_CRIANCA"'
      ', "FL_ACEITAR" = :"FL_ACEITAR"'
      ', "FL_STATUS" = :"FL_STATUS"'
      ', "DT_EXP" = :"DT_EXP"'
      ', "CD_EDI" = :"CD_EDI"'
      ', "CD_USU_INCLUSAO" = :"CD_USU_INCLUSAO"'
      ', "DT_INCLUSAO" = :"DT_INCLUSAO"'
      ', "CD_USU_ALTERACAO" = :"CD_USU_ALTERACAO"'
      ', "DT_ALTERACAO" = :"DT_ALTERACAO"'
      ', "CD_REGISTRO_GERAL" = :"CD_REGISTRO_GERAL"'
      'where'
      '  "CD_REGISTRO_PTV" = :"OLD_CD_REGISTRO_PTV" and '
      '  "CD_UND" = :"OLD_CD_UND"')
    Left = 152
    Top = 16
    object TB_PTV_ARCD_REGISTRO_PTV: TIntegerField
      FieldName = 'CD_REGISTRO_PTV'
      Origin = 'REGISTRO_PTV_AR.CD_REGISTRO_PTV'
      Required = True
    end
    object TB_PTV_ARCD_UND: TIntegerField
      FieldName = 'CD_UND'
      Origin = 'REGISTRO_PTV_AR.CD_UND'
      Required = True
    end
    object TB_PTV_ARDT_REGISTRO: TDateTimeField
      FieldName = 'DT_REGISTRO'
      Origin = 'REGISTRO_PTV_AR.DT_REGISTRO'
    end
    object TB_PTV_ARCD_UNIDADE: TIntegerField
      FieldName = 'CD_UNIDADE'
      Origin = 'REGISTRO_PTV_AR.CD_UNIDADE'
      Required = True
    end
    object TB_PTV_ARCD_PROVINCIA: TIntegerField
      FieldName = 'CD_PROVINCIA'
      Origin = 'REGISTRO_PTV_AR.CD_PROVINCIA'
      Required = True
    end
    object TB_PTV_ARCD_MUNICIPIO: TIntegerField
      FieldName = 'CD_MUNICIPIO'
      Origin = 'REGISTRO_PTV_AR.CD_MUNICIPIO'
      Required = True
    end
    object TB_PTV_ARVL_MESANO: TIBStringField
      FieldName = 'VL_MESANO'
      Origin = 'REGISTRO_PTV_AR.VL_MESANO'
      Required = True
      Size = 8
    end
    object TB_PTV_ARVL_ADMITIDAS_PTV: TIntegerField
      FieldName = 'VL_ADMITIDAS_PTV'
      Origin = 'REGISTRO_PTV_AR.VL_ADMITIDAS_PTV'
    end
    object TB_PTV_ARVL_ADMITIDAS_PARTO: TIntegerField
      FieldName = 'VL_ADMITIDAS_PARTO'
      Origin = 'REGISTRO_PTV_AR.VL_ADMITIDAS_PARTO'
    end
    object TB_PTV_ARVL_ADMITIDAS_POS_PARTO: TIntegerField
      FieldName = 'VL_ADMITIDAS_POS_PARTO'
      Origin = 'REGISTRO_PTV_AR.VL_ADMITIDAS_POS_PARTO'
    end
    object TB_PTV_ARVL_TERAPIA_COMPLETA: TIntegerField
      FieldName = 'VL_TERAPIA_COMPLETA'
      Origin = 'REGISTRO_PTV_AR.VL_TERAPIA_COMPLETA'
    end
    object TB_PTV_ARVL_TERAPIA_OUTRO: TIntegerField
      FieldName = 'VL_TERAPIA_OUTRO'
      Origin = 'REGISTRO_PTV_AR.VL_TERAPIA_OUTRO'
    end
    object TB_PTV_ARVL_TERAPIA_NENHUM: TIntegerField
      FieldName = 'VL_TERAPIA_NENHUM'
      Origin = 'REGISTRO_PTV_AR.VL_TERAPIA_NENHUM'
    end
    object TB_PTV_ARVL_TOTAL_CRIANCA: TIntegerField
      FieldName = 'VL_TOTAL_CRIANCA'
      Origin = 'REGISTRO_PTV_AR.VL_TOTAL_CRIANCA'
    end
    object TB_PTV_ARFL_ACEITAR: TIntegerField
      FieldName = 'FL_ACEITAR'
      Origin = 'REGISTRO_PTV_AR.FL_ACEITAR'
    end
    object TB_PTV_ARFL_STATUS: TIBStringField
      FieldName = 'FL_STATUS'
      Origin = 'REGISTRO_PTV_AR.FL_STATUS'
      FixedChar = True
      Size = 1
    end
    object TB_PTV_ARDT_EXP: TDateTimeField
      FieldName = 'DT_EXP'
      Origin = 'REGISTRO_PTV_AR.DT_EXP'
    end
    object TB_PTV_ARCD_EDI: TIntegerField
      FieldName = 'CD_EDI'
      Origin = 'REGISTRO_PTV_AR.CD_EDI'
    end
    object TB_PTV_ARCD_USU_INCLUSAO: TIntegerField
      FieldName = 'CD_USU_INCLUSAO'
      Origin = 'REGISTRO_PTV_AR.CD_USU_INCLUSAO'
    end
    object TB_PTV_ARDT_INCLUSAO: TDateTimeField
      FieldName = 'DT_INCLUSAO'
      Origin = 'REGISTRO_PTV_AR.DT_INCLUSAO'
    end
    object TB_PTV_ARCD_USU_ALTERACAO: TIntegerField
      FieldName = 'CD_USU_ALTERACAO'
      Origin = 'REGISTRO_PTV_AR.CD_USU_ALTERACAO'
    end
    object TB_PTV_ARDT_ALTERACAO: TDateTimeField
      FieldName = 'DT_ALTERACAO'
      Origin = 'REGISTRO_PTV_AR.DT_ALTERACAO'
    end
    object TB_PTV_ARCD_REGISTRO_GERAL: TIntegerField
      FieldName = 'CD_REGISTRO_GERAL'
      Origin = 'REGISTRO_PTV_AR.CD_REGISTRO_GERAL'
    end
  end
  object TB_TARV_AR: TIBDataSet
    Database = DM.DB
    Transaction = DM.TS
    BufferChunks = 1000
    CachedUpdates = False
    DeleteSQL.Strings = (
      'delete from "REGISTRO_TARV_AR"'
      'where'
      '  "CD_REGISTRO_TARV" = :"OLD_CD_REGISTRO_TARV" and '
      '  "CD_UND" = :"OLD_CD_UND"')
    InsertSQL.Strings = (
      'insert into "REGISTRO_TARV_AR"'
      '('
      '  "CD_REGISTRO_TARV"'
      ', "CD_UND"'
      ', "DT_REGISTRO"'
      ', "CD_UNIDADE"'
      ', "CD_PROVINCIA"'
      ', "CD_MUNICIPIO"'
      ', "VL_MESANO"'
      ', "VL_ACUMULADOS"'
      ', "VL_NOVOS"'
      ', "VL_TRANSFERIDOS"'
      ', "VL_ABANDONOS"'
      ', "VL_TRANSFERIDOS_PARA"'
      ', "VL_OBITOS"'
      ', "FL_ACEITAR"'
      ', "FL_STATUS"'
      ', "DT_EXP"'
      ', "CD_EDI"'
      ', "CD_USU_INCLUSAO"'
      ', "DT_INCLUSAO"'
      ', "CD_USU_ALTERACAO"'
      ', "DT_ALTERACAO"'
      ', "CD_REGISTRO_GERAL"'
      ')'
      'values'
      '('
      '  :"CD_REGISTRO_TARV"'
      ', :"CD_UND"'
      ', :"DT_REGISTRO"'
      ', :"CD_UNIDADE"'
      ', :"CD_PROVINCIA"'
      ', :"CD_MUNICIPIO"'
      ', :"VL_MESANO"'
      ', :"VL_ACUMULADOS"'
      ', :"VL_NOVOS"'
      ', :"VL_TRANSFERIDOS"'
      ', :"VL_ABANDONOS"'
      ', :"VL_TRANSFERIDOS_PARA"'
      ', :"VL_OBITOS"'
      ', :"FL_ACEITAR"'
      ', :"FL_STATUS"'
      ', :"DT_EXP"'
      ', :"CD_EDI"'
      ', :"CD_USU_INCLUSAO"'
      ', :"DT_INCLUSAO"'
      ', :"CD_USU_ALTERACAO"'
      ', :"DT_ALTERACAO"'
      ', :"CD_REGISTRO_GERAL"'
      ')')
    SelectSQL.Strings = (
      'select "REGISTRO_TARV_AR"."CD_REGISTRO_TARV"'
      '      ,"REGISTRO_TARV_AR"."CD_UND"'
      '      ,"REGISTRO_TARV_AR"."DT_REGISTRO"'
      '      ,"REGISTRO_TARV_AR"."CD_UNIDADE"'
      '      ,"REGISTRO_TARV_AR"."CD_PROVINCIA"'
      '      ,"REGISTRO_TARV_AR"."CD_MUNICIPIO"'
      '      ,"REGISTRO_TARV_AR"."VL_MESANO"'
      '      ,"REGISTRO_TARV_AR"."VL_ACUMULADOS"'
      '      ,"REGISTRO_TARV_AR"."VL_NOVOS"'
      '      ,"REGISTRO_TARV_AR"."VL_TRANSFERIDOS"'
      '      ,"REGISTRO_TARV_AR"."VL_ABANDONOS"'
      '      ,"REGISTRO_TARV_AR"."VL_TRANSFERIDOS_PARA"'
      '      ,"REGISTRO_TARV_AR"."VL_OBITOS"'
      '      ,"REGISTRO_TARV_AR"."FL_ACEITAR"'
      '      ,"REGISTRO_TARV_AR"."FL_STATUS"'
      '      ,"REGISTRO_TARV_AR"."DT_EXP"'
      '      ,"REGISTRO_TARV_AR"."CD_EDI"'
      '      ,"REGISTRO_TARV_AR"."CD_USU_INCLUSAO"'
      '      ,"REGISTRO_TARV_AR"."DT_INCLUSAO"'
      '      ,"REGISTRO_TARV_AR"."CD_USU_ALTERACAO"'
      '      ,"REGISTRO_TARV_AR"."DT_ALTERACAO"'
      '      ,"REGISTRO_TARV_AR"."CD_REGISTRO_GERAL"'
      'from "REGISTRO_TARV_AR"')
    ModifySQL.Strings = (
      'update "REGISTRO_TARV_AR"'
      'set'
      ' "CD_REGISTRO_TARV" = :"CD_REGISTRO_TARV"'
      ', "CD_UND" = :"CD_UND"'
      ', "DT_REGISTRO" = :"DT_REGISTRO"'
      ', "CD_UNIDADE" = :"CD_UNIDADE"'
      ', "CD_PROVINCIA" = :"CD_PROVINCIA"'
      ', "CD_MUNICIPIO" = :"CD_MUNICIPIO"'
      ', "VL_MESANO" = :"VL_MESANO"'
      ', "VL_ACUMULADOS" = :"VL_ACUMULADOS"'
      ', "VL_NOVOS" = :"VL_NOVOS"'
      ', "VL_TRANSFERIDOS" = :"VL_TRANSFERIDOS"'
      ', "VL_ABANDONOS" = :"VL_ABANDONOS"'
      ', "VL_TRANSFERIDOS_PARA" = :"VL_TRANSFERIDOS_PARA"'
      ', "VL_OBITOS" = :"VL_OBITOS"'
      ', "FL_ACEITAR" = :"FL_ACEITAR"'
      ', "FL_STATUS" = :"FL_STATUS"'
      ', "DT_EXP" = :"DT_EXP"'
      ', "CD_EDI" = :"CD_EDI"'
      ', "CD_USU_INCLUSAO" = :"CD_USU_INCLUSAO"'
      ', "DT_INCLUSAO" = :"DT_INCLUSAO"'
      ', "CD_USU_ALTERACAO" = :"CD_USU_ALTERACAO"'
      ', "DT_ALTERACAO" = :"DT_ALTERACAO"'
      ', "CD_REGISTRO_GERAL" = :"CD_REGISTRO_GERAL"'
      'where'
      '  "CD_REGISTRO_TARV" = :"OLD_CD_REGISTRO_TARV" and '
      '  "CD_UND" = :"OLD_CD_UND"')
    Left = 240
    Top = 16
    object TB_TARV_ARCD_REGISTRO_TARV: TIntegerField
      FieldName = 'CD_REGISTRO_TARV'
      Origin = 'REGISTRO_TARV_AR.CD_REGISTRO_TARV'
      Required = True
    end
    object TB_TARV_ARCD_UND: TIntegerField
      FieldName = 'CD_UND'
      Origin = 'REGISTRO_TARV_AR.CD_UND'
      Required = True
    end
    object TB_TARV_ARDT_REGISTRO: TDateTimeField
      FieldName = 'DT_REGISTRO'
      Origin = 'REGISTRO_TARV_AR.DT_REGISTRO'
      Required = True
    end
    object TB_TARV_ARCD_UNIDADE: TIntegerField
      FieldName = 'CD_UNIDADE'
      Origin = 'REGISTRO_TARV_AR.CD_UNIDADE'
      Required = True
    end
    object TB_TARV_ARCD_PROVINCIA: TIntegerField
      FieldName = 'CD_PROVINCIA'
      Origin = 'REGISTRO_TARV_AR.CD_PROVINCIA'
      Required = True
    end
    object TB_TARV_ARCD_MUNICIPIO: TIntegerField
      FieldName = 'CD_MUNICIPIO'
      Origin = 'REGISTRO_TARV_AR.CD_MUNICIPIO'
      Required = True
    end
    object TB_TARV_ARVL_MESANO: TIBStringField
      FieldName = 'VL_MESANO'
      Origin = 'REGISTRO_TARV_AR.VL_MESANO'
      Required = True
      Size = 8
    end
    object TB_TARV_ARVL_ACUMULADOS: TIntegerField
      FieldName = 'VL_ACUMULADOS'
      Origin = 'REGISTRO_TARV_AR.VL_ACUMULADOS'
    end
    object TB_TARV_ARVL_NOVOS: TIntegerField
      FieldName = 'VL_NOVOS'
      Origin = 'REGISTRO_TARV_AR.VL_NOVOS'
    end
    object TB_TARV_ARVL_TRANSFERIDOS: TIntegerField
      FieldName = 'VL_TRANSFERIDOS'
      Origin = 'REGISTRO_TARV_AR.VL_TRANSFERIDOS'
    end
    object TB_TARV_ARVL_ABANDONOS: TIntegerField
      FieldName = 'VL_ABANDONOS'
      Origin = 'REGISTRO_TARV_AR.VL_ABANDONOS'
    end
    object TB_TARV_ARVL_TRANSFERIDOS_PARA: TIntegerField
      FieldName = 'VL_TRANSFERIDOS_PARA'
      Origin = 'REGISTRO_TARV_AR.VL_TRANSFERIDOS_PARA'
    end
    object TB_TARV_ARVL_OBITOS: TIntegerField
      FieldName = 'VL_OBITOS'
      Origin = 'REGISTRO_TARV_AR.VL_OBITOS'
    end
    object TB_TARV_ARFL_ACEITAR: TIntegerField
      FieldName = 'FL_ACEITAR'
      Origin = 'REGISTRO_TARV_AR.FL_ACEITAR'
    end
    object TB_TARV_ARFL_STATUS: TIBStringField
      FieldName = 'FL_STATUS'
      Origin = 'REGISTRO_TARV_AR.FL_STATUS'
      FixedChar = True
      Size = 1
    end
    object TB_TARV_ARDT_EXP: TDateTimeField
      FieldName = 'DT_EXP'
      Origin = 'REGISTRO_TARV_AR.DT_EXP'
    end
    object TB_TARV_ARCD_EDI: TIntegerField
      FieldName = 'CD_EDI'
      Origin = 'REGISTRO_TARV_AR.CD_EDI'
    end
    object TB_TARV_ARCD_USU_INCLUSAO: TIntegerField
      FieldName = 'CD_USU_INCLUSAO'
      Origin = 'REGISTRO_TARV_AR.CD_USU_INCLUSAO'
    end
    object TB_TARV_ARDT_INCLUSAO: TDateTimeField
      FieldName = 'DT_INCLUSAO'
      Origin = 'REGISTRO_TARV_AR.DT_INCLUSAO'
    end
    object TB_TARV_ARCD_USU_ALTERACAO: TIntegerField
      FieldName = 'CD_USU_ALTERACAO'
      Origin = 'REGISTRO_TARV_AR.CD_USU_ALTERACAO'
    end
    object TB_TARV_ARDT_ALTERACAO: TDateTimeField
      FieldName = 'DT_ALTERACAO'
      Origin = 'REGISTRO_TARV_AR.DT_ALTERACAO'
    end
    object TB_TARV_ARCD_REGISTRO_GERAL: TIntegerField
      FieldName = 'CD_REGISTRO_GERAL'
      Origin = 'REGISTRO_TARV_AR.CD_REGISTRO_GERAL'
    end
  end
  object TB_TARV_ACOMP_AR: TIBDataSet
    Database = DM.DB
    Transaction = DM.TS
    BufferChunks = 1000
    CachedUpdates = False
    DeleteSQL.Strings = (
      'delete from "REGISTRO_TARV_ACOMP_AR"'
      'where'
      '  "CD_REGISTRO_TARV_ACOMP" = :"OLD_CD_REGISTRO_TARV_ACOMP" and '
      '  "CD_UND" = :"OLD_CD_UND"')
    InsertSQL.Strings = (
      'insert into "REGISTRO_TARV_ACOMP_AR"'
      '('
      '  "CD_REGISTRO_TARV_ACOMP"'
      ', "CD_UND"'
      ', "DT_REGISTRO"'
      ', "CD_UNIDADE"'
      ', "CD_PROVINCIA"'
      ', "CD_MUNICIPIO"'
      ', "VL_MESANO"'
      ', "VL_ACUMULADOS"'
      ', "VL_NOVOS"'
      ', "VL_TRANSFERIDOS"'
      ', "VL_ABANDONOS"'
      ', "VL_TRANSFERIDOS_PARA"'
      ', "VL_OBITOS"'
      ', "FL_ACEITAR"'
      ', "FL_STATUS"'
      ', "DT_EXP"'
      ', "CD_EDI"'
      ', "CD_USU_INCLUSAO"'
      ', "DT_INCLUSAO"'
      ', "CD_USU_ALTERACAO"'
      ', "DT_ALTERACAO"'
      ', "CD_REGISTRO_GERAL"'
      ')'
      'values'
      '('
      '  :"CD_REGISTRO_TARV_ACOMP"'
      ', :"CD_UND"'
      ', :"DT_REGISTRO"'
      ', :"CD_UNIDADE"'
      ', :"CD_PROVINCIA"'
      ', :"CD_MUNICIPIO"'
      ', :"VL_MESANO"'
      ', :"VL_ACUMULADOS"'
      ', :"VL_NOVOS"'
      ', :"VL_TRANSFERIDOS"'
      ', :"VL_ABANDONOS"'
      ', :"VL_TRANSFERIDOS_PARA"'
      ', :"VL_OBITOS"'
      ', :"FL_ACEITAR"'
      ', :"FL_STATUS"'
      ', :"DT_EXP"'
      ', :"CD_EDI"'
      ', :"CD_USU_INCLUSAO"'
      ', :"DT_INCLUSAO"'
      ', :"CD_USU_ALTERACAO"'
      ', :"DT_ALTERACAO"'
      ', :"CD_REGISTRO_GERAL"'
      ')')
    SelectSQL.Strings = (
      'select "REGISTRO_TARV_ACOMP_AR"."CD_REGISTRO_TARV_ACOMP"'
      '      ,"REGISTRO_TARV_ACOMP_AR"."CD_UND"'
      '      ,"REGISTRO_TARV_ACOMP_AR"."DT_REGISTRO"'
      '      ,"REGISTRO_TARV_ACOMP_AR"."CD_UNIDADE"'
      '      ,"REGISTRO_TARV_ACOMP_AR"."CD_PROVINCIA"'
      '      ,"REGISTRO_TARV_ACOMP_AR"."CD_MUNICIPIO"'
      '      ,"REGISTRO_TARV_ACOMP_AR"."VL_MESANO"'
      '      ,"REGISTRO_TARV_ACOMP_AR"."VL_ACUMULADOS"'
      '      ,"REGISTRO_TARV_ACOMP_AR"."VL_NOVOS"'
      '      ,"REGISTRO_TARV_ACOMP_AR"."VL_TRANSFERIDOS"'
      '      ,"REGISTRO_TARV_ACOMP_AR"."VL_ABANDONOS"'
      '      ,"REGISTRO_TARV_ACOMP_AR"."VL_TRANSFERIDOS_PARA"'
      '      ,"REGISTRO_TARV_ACOMP_AR"."VL_OBITOS"'
      '      ,"REGISTRO_TARV_ACOMP_AR"."FL_ACEITAR"'
      '      ,"REGISTRO_TARV_ACOMP_AR"."FL_STATUS"'
      '      ,"REGISTRO_TARV_ACOMP_AR"."DT_EXP"'
      '      ,"REGISTRO_TARV_ACOMP_AR"."CD_EDI"'
      '      ,"REGISTRO_TARV_ACOMP_AR"."CD_USU_INCLUSAO"'
      '      ,"REGISTRO_TARV_ACOMP_AR"."DT_INCLUSAO"'
      '      ,"REGISTRO_TARV_ACOMP_AR"."CD_USU_ALTERACAO"'
      '      ,"REGISTRO_TARV_ACOMP_AR"."DT_ALTERACAO"'
      '      ,"REGISTRO_TARV_ACOMP_AR"."CD_REGISTRO_GERAL"'
      'from "REGISTRO_TARV_ACOMP_AR"')
    ModifySQL.Strings = (
      'update "REGISTRO_TARV_ACOMP_AR"'
      'set'
      ' "CD_REGISTRO_TARV_ACOMP" = :"CD_REGISTRO_TARV_ACOMP"'
      ', "CD_UND" = :"CD_UND"'
      ', "DT_REGISTRO" = :"DT_REGISTRO"'
      ', "CD_UNIDADE" = :"CD_UNIDADE"'
      ', "CD_PROVINCIA" = :"CD_PROVINCIA"'
      ', "CD_MUNICIPIO" = :"CD_MUNICIPIO"'
      ', "VL_MESANO" = :"VL_MESANO"'
      ', "VL_ACUMULADOS" = :"VL_ACUMULADOS"'
      ', "VL_NOVOS" = :"VL_NOVOS"'
      ', "VL_TRANSFERIDOS" = :"VL_TRANSFERIDOS"'
      ', "VL_ABANDONOS" = :"VL_ABANDONOS"'
      ', "VL_TRANSFERIDOS_PARA" = :"VL_TRANSFERIDOS_PARA"'
      ', "VL_OBITOS" = :"VL_OBITOS"'
      ', "FL_ACEITAR" = :"FL_ACEITAR"'
      ', "FL_STATUS" = :"FL_STATUS"'
      ', "DT_EXP" = :"DT_EXP"'
      ', "CD_EDI" = :"CD_EDI"'
      ', "CD_USU_INCLUSAO" = :"CD_USU_INCLUSAO"'
      ', "DT_INCLUSAO" = :"DT_INCLUSAO"'
      ', "CD_USU_ALTERACAO" = :"CD_USU_ALTERACAO"'
      ', "DT_ALTERACAO" = :"DT_ALTERACAO"'
      ', "CD_REGISTRO_GERAL" = :"CD_REGISTRO_GERAL"'
      'where'
      '  "CD_REGISTRO_TARV_ACOMP" = :"OLD_CD_REGISTRO_TARV_ACOMP" and '
      '  "CD_UND" = :"OLD_CD_UND"')
    Left = 360
    Top = 16
    object TB_TARV_ACOMP_ARCD_REGISTRO_TARV_ACOMP: TIntegerField
      FieldName = 'CD_REGISTRO_TARV_ACOMP'
      Origin = 'REGISTRO_TARV_ACOMP_AR.CD_REGISTRO_TARV_ACOMP'
      Required = True
    end
    object TB_TARV_ACOMP_ARCD_UND: TIntegerField
      FieldName = 'CD_UND'
      Origin = 'REGISTRO_TARV_ACOMP_AR.CD_UND'
      Required = True
    end
    object TB_TARV_ACOMP_ARDT_REGISTRO: TDateTimeField
      FieldName = 'DT_REGISTRO'
      Origin = 'REGISTRO_TARV_ACOMP_AR.DT_REGISTRO'
      Required = True
    end
    object TB_TARV_ACOMP_ARCD_UNIDADE: TIntegerField
      FieldName = 'CD_UNIDADE'
      Origin = 'REGISTRO_TARV_ACOMP_AR.CD_UNIDADE'
      Required = True
    end
    object TB_TARV_ACOMP_ARCD_PROVINCIA: TIntegerField
      FieldName = 'CD_PROVINCIA'
      Origin = 'REGISTRO_TARV_ACOMP_AR.CD_PROVINCIA'
      Required = True
    end
    object TB_TARV_ACOMP_ARCD_MUNICIPIO: TIntegerField
      FieldName = 'CD_MUNICIPIO'
      Origin = 'REGISTRO_TARV_ACOMP_AR.CD_MUNICIPIO'
      Required = True
    end
    object TB_TARV_ACOMP_ARVL_MESANO: TIBStringField
      FieldName = 'VL_MESANO'
      Origin = 'REGISTRO_TARV_ACOMP_AR.VL_MESANO'
      Required = True
      Size = 8
    end
    object TB_TARV_ACOMP_ARVL_ACUMULADOS: TIntegerField
      FieldName = 'VL_ACUMULADOS'
      Origin = 'REGISTRO_TARV_ACOMP_AR.VL_ACUMULADOS'
    end
    object TB_TARV_ACOMP_ARVL_NOVOS: TIntegerField
      FieldName = 'VL_NOVOS'
      Origin = 'REGISTRO_TARV_ACOMP_AR.VL_NOVOS'
    end
    object TB_TARV_ACOMP_ARVL_TRANSFERIDOS: TIntegerField
      FieldName = 'VL_TRANSFERIDOS'
      Origin = 'REGISTRO_TARV_ACOMP_AR.VL_TRANSFERIDOS'
    end
    object TB_TARV_ACOMP_ARVL_ABANDONOS: TIntegerField
      FieldName = 'VL_ABANDONOS'
      Origin = 'REGISTRO_TARV_ACOMP_AR.VL_ABANDONOS'
    end
    object TB_TARV_ACOMP_ARVL_TRANSFERIDOS_PARA: TIntegerField
      FieldName = 'VL_TRANSFERIDOS_PARA'
      Origin = 'REGISTRO_TARV_ACOMP_AR.VL_TRANSFERIDOS_PARA'
    end
    object TB_TARV_ACOMP_ARVL_OBITOS: TIntegerField
      FieldName = 'VL_OBITOS'
      Origin = 'REGISTRO_TARV_ACOMP_AR.VL_OBITOS'
    end
    object TB_TARV_ACOMP_ARFL_ACEITAR: TIntegerField
      FieldName = 'FL_ACEITAR'
      Origin = 'REGISTRO_TARV_ACOMP_AR.FL_ACEITAR'
    end
    object TB_TARV_ACOMP_ARFL_STATUS: TIBStringField
      FieldName = 'FL_STATUS'
      Origin = 'REGISTRO_TARV_ACOMP_AR.FL_STATUS'
      FixedChar = True
      Size = 1
    end
    object TB_TARV_ACOMP_ARDT_EXP: TDateTimeField
      FieldName = 'DT_EXP'
      Origin = 'REGISTRO_TARV_ACOMP_AR.DT_EXP'
    end
    object TB_TARV_ACOMP_ARCD_EDI: TIntegerField
      FieldName = 'CD_EDI'
      Origin = 'REGISTRO_TARV_ACOMP_AR.CD_EDI'
    end
    object TB_TARV_ACOMP_ARCD_USU_INCLUSAO: TIntegerField
      FieldName = 'CD_USU_INCLUSAO'
      Origin = 'REGISTRO_TARV_ACOMP_AR.CD_USU_INCLUSAO'
    end
    object TB_TARV_ACOMP_ARDT_INCLUSAO: TDateTimeField
      FieldName = 'DT_INCLUSAO'
      Origin = 'REGISTRO_TARV_ACOMP_AR.DT_INCLUSAO'
    end
    object TB_TARV_ACOMP_ARCD_USU_ALTERACAO: TIntegerField
      FieldName = 'CD_USU_ALTERACAO'
      Origin = 'REGISTRO_TARV_ACOMP_AR.CD_USU_ALTERACAO'
    end
    object TB_TARV_ACOMP_ARDT_ALTERACAO: TDateTimeField
      FieldName = 'DT_ALTERACAO'
      Origin = 'REGISTRO_TARV_ACOMP_AR.DT_ALTERACAO'
    end
    object TB_TARV_ACOMP_ARCD_REGISTRO_GERAL: TIntegerField
      FieldName = 'CD_REGISTRO_GERAL'
      Origin = 'REGISTRO_TARV_ACOMP_AR.CD_REGISTRO_GERAL'
    end
  end
  object TB_TARV_ESQUEMA_AR: TIBDataSet
    Database = DM.DB
    Transaction = DM.TS
    BufferChunks = 1000
    CachedUpdates = False
    DeleteSQL.Strings = (
      'delete from "REGISTRO_TARV_ESQUEMA_AR"'
      'where'
      
        '  "CD_REGISTRO_TARV_ESQUEMA" = :"OLD_CD_REGISTRO_TARV_ESQUEMA" a' +
        'nd '
      '  "CD_UND" = :"OLD_CD_UND"')
    InsertSQL.Strings = (
      'insert into "REGISTRO_TARV_ESQUEMA_AR"'
      '('
      '  "CD_REGISTRO_TARV_ESQUEMA"'
      ', "CD_UND"'
      ', "DT_REGISTRO"'
      ', "CD_UNIDADE"'
      ', "CD_PROVINCIA"'
      ', "CD_MUNICIPIO"'
      ', "VL_MESANO"'
      ', "VL_ANTERIOR_CRIANCA"'
      ', "VL_ANTERIOR_ADULTO"'
      ', "VL_CORRENTE_CRIANCA"'
      ', "VL_CORRENTE_ADULTO"'
      ', "FL_ACEITAR"'
      ', "FL_STATUS"'
      ', "DT_EXP"'
      ', "CD_EDI"'
      ', "CD_USU_INCLUSAO"'
      ', "DT_INCLUSAO"'
      ', "CD_USU_ALTERACAO"'
      ', "DT_ALTERACAO"'
      ', "CD_REGISTRO_GERAL"'
      ')'
      'values'
      '('
      '  :"CD_REGISTRO_TARV_ESQUEMA"'
      ', :"CD_UND"'
      ', :"DT_REGISTRO"'
      ', :"CD_UNIDADE"'
      ', :"CD_PROVINCIA"'
      ', :"CD_MUNICIPIO"'
      ', :"VL_MESANO"'
      ', :"VL_ANTERIOR_CRIANCA"'
      ', :"VL_ANTERIOR_ADULTO"'
      ', :"VL_CORRENTE_CRIANCA"'
      ', :"VL_CORRENTE_ADULTO"'
      ', :"FL_ACEITAR"'
      ', :"FL_STATUS"'
      ', :"DT_EXP"'
      ', :"CD_EDI"'
      ', :"CD_USU_INCLUSAO"'
      ', :"DT_INCLUSAO"'
      ', :"CD_USU_ALTERACAO"'
      ', :"DT_ALTERACAO"'
      ', :"CD_REGISTRO_GERAL"'
      ')')
    SelectSQL.Strings = (
      'select "REGISTRO_TARV_ESQUEMA_AR"."CD_REGISTRO_TARV_ESQUEMA"'
      '      ,"REGISTRO_TARV_ESQUEMA_AR"."CD_UND"'
      '      ,"REGISTRO_TARV_ESQUEMA_AR"."DT_REGISTRO"'
      '      ,"REGISTRO_TARV_ESQUEMA_AR"."CD_UNIDADE"'
      '      ,"REGISTRO_TARV_ESQUEMA_AR"."CD_PROVINCIA"'
      '      ,"REGISTRO_TARV_ESQUEMA_AR"."CD_MUNICIPIO"'
      '      ,"REGISTRO_TARV_ESQUEMA_AR"."VL_MESANO"'
      '      ,"REGISTRO_TARV_ESQUEMA_AR"."VL_ANTERIOR_CRIANCA"'
      '      ,"REGISTRO_TARV_ESQUEMA_AR"."VL_ANTERIOR_ADULTO"'
      '      ,"REGISTRO_TARV_ESQUEMA_AR"."VL_CORRENTE_CRIANCA"'
      '      ,"REGISTRO_TARV_ESQUEMA_AR"."VL_CORRENTE_ADULTO"'
      '      ,"REGISTRO_TARV_ESQUEMA_AR"."FL_ACEITAR"'
      '      ,"REGISTRO_TARV_ESQUEMA_AR"."FL_STATUS"'
      '      ,"REGISTRO_TARV_ESQUEMA_AR"."DT_EXP"'
      '      ,"REGISTRO_TARV_ESQUEMA_AR"."CD_EDI"'
      '      ,"REGISTRO_TARV_ESQUEMA_AR"."CD_USU_INCLUSAO"'
      '      ,"REGISTRO_TARV_ESQUEMA_AR"."DT_INCLUSAO"'
      '      ,"REGISTRO_TARV_ESQUEMA_AR"."CD_USU_ALTERACAO"'
      '      ,"REGISTRO_TARV_ESQUEMA_AR"."DT_ALTERACAO"'
      '      ,"REGISTRO_TARV_ESQUEMA_AR"."CD_REGISTRO_GERAL"'
      'from "REGISTRO_TARV_ESQUEMA_AR"')
    ModifySQL.Strings = (
      'update "REGISTRO_TARV_ESQUEMA_AR"'
      'set'
      ' "CD_REGISTRO_TARV_ESQUEMA" = :"CD_REGISTRO_TARV_ESQUEMA"'
      ', "CD_UND" = :"CD_UND"'
      ', "DT_REGISTRO" = :"DT_REGISTRO"'
      ', "CD_UNIDADE" = :"CD_UNIDADE"'
      ', "CD_PROVINCIA" = :"CD_PROVINCIA"'
      ', "CD_MUNICIPIO" = :"CD_MUNICIPIO"'
      ', "VL_MESANO" = :"VL_MESANO"'
      ', "VL_ANTERIOR_CRIANCA" = :"VL_ANTERIOR_CRIANCA"'
      ', "VL_ANTERIOR_ADULTO" = :"VL_ANTERIOR_ADULTO"'
      ', "VL_CORRENTE_CRIANCA" = :"VL_CORRENTE_CRIANCA"'
      ', "VL_CORRENTE_ADULTO" = :"VL_CORRENTE_ADULTO"'
      ', "FL_ACEITAR" = :"FL_ACEITAR"'
      ', "FL_STATUS" = :"FL_STATUS"'
      ', "DT_EXP" = :"DT_EXP"'
      ', "CD_EDI" = :"CD_EDI"'
      ', "CD_USU_INCLUSAO" = :"CD_USU_INCLUSAO"'
      ', "DT_INCLUSAO" = :"DT_INCLUSAO"'
      ', "CD_USU_ALTERACAO" = :"CD_USU_ALTERACAO"'
      ', "DT_ALTERACAO" = :"DT_ALTERACAO"'
      ', "CD_REGISTRO_GERAL" = :"CD_REGISTRO_GERAL"'
      'where'
      
        '  "CD_REGISTRO_TARV_ESQUEMA" = :"OLD_CD_REGISTRO_TARV_ESQUEMA" a' +
        'nd '
      '  "CD_UND" = :"OLD_CD_UND"')
    Left = 496
    Top = 16
    object TB_TARV_ESQUEMA_ARCD_REGISTRO_TARV_ESQUEMA: TIntegerField
      FieldName = 'CD_REGISTRO_TARV_ESQUEMA'
      Origin = 'REGISTRO_TARV_ESQUEMA_AR.CD_REGISTRO_TARV_ESQUEMA'
      Required = True
    end
    object TB_TARV_ESQUEMA_ARCD_UND: TIntegerField
      FieldName = 'CD_UND'
      Origin = 'REGISTRO_TARV_ESQUEMA_AR.CD_UND'
      Required = True
    end
    object TB_TARV_ESQUEMA_ARDT_REGISTRO: TDateTimeField
      FieldName = 'DT_REGISTRO'
      Origin = 'REGISTRO_TARV_ESQUEMA_AR.DT_REGISTRO'
      Required = True
    end
    object TB_TARV_ESQUEMA_ARCD_UNIDADE: TIntegerField
      FieldName = 'CD_UNIDADE'
      Origin = 'REGISTRO_TARV_ESQUEMA_AR.CD_UNIDADE'
      Required = True
    end
    object TB_TARV_ESQUEMA_ARCD_PROVINCIA: TIntegerField
      FieldName = 'CD_PROVINCIA'
      Origin = 'REGISTRO_TARV_ESQUEMA_AR.CD_PROVINCIA'
      Required = True
    end
    object TB_TARV_ESQUEMA_ARCD_MUNICIPIO: TIntegerField
      FieldName = 'CD_MUNICIPIO'
      Origin = 'REGISTRO_TARV_ESQUEMA_AR.CD_MUNICIPIO'
      Required = True
    end
    object TB_TARV_ESQUEMA_ARVL_MESANO: TIBStringField
      FieldName = 'VL_MESANO'
      Origin = 'REGISTRO_TARV_ESQUEMA_AR.VL_MESANO'
      Required = True
      Size = 8
    end
    object TB_TARV_ESQUEMA_ARVL_ANTERIOR_CRIANCA: TIntegerField
      FieldName = 'VL_ANTERIOR_CRIANCA'
      Origin = 'REGISTRO_TARV_ESQUEMA_AR.VL_ANTERIOR_CRIANCA'
    end
    object TB_TARV_ESQUEMA_ARVL_ANTERIOR_ADULTO: TIntegerField
      FieldName = 'VL_ANTERIOR_ADULTO'
      Origin = 'REGISTRO_TARV_ESQUEMA_AR.VL_ANTERIOR_ADULTO'
    end
    object TB_TARV_ESQUEMA_ARVL_CORRENTE_CRIANCA: TIntegerField
      FieldName = 'VL_CORRENTE_CRIANCA'
      Origin = 'REGISTRO_TARV_ESQUEMA_AR.VL_CORRENTE_CRIANCA'
    end
    object TB_TARV_ESQUEMA_ARVL_CORRENTE_ADULTO: TIntegerField
      FieldName = 'VL_CORRENTE_ADULTO'
      Origin = 'REGISTRO_TARV_ESQUEMA_AR.VL_CORRENTE_ADULTO'
    end
    object TB_TARV_ESQUEMA_ARFL_ACEITAR: TIntegerField
      FieldName = 'FL_ACEITAR'
      Origin = 'REGISTRO_TARV_ESQUEMA_AR.FL_ACEITAR'
    end
    object TB_TARV_ESQUEMA_ARFL_STATUS: TIBStringField
      FieldName = 'FL_STATUS'
      Origin = 'REGISTRO_TARV_ESQUEMA_AR.FL_STATUS'
      FixedChar = True
      Size = 1
    end
    object TB_TARV_ESQUEMA_ARDT_EXP: TDateTimeField
      FieldName = 'DT_EXP'
      Origin = 'REGISTRO_TARV_ESQUEMA_AR.DT_EXP'
    end
    object TB_TARV_ESQUEMA_ARCD_EDI: TIntegerField
      FieldName = 'CD_EDI'
      Origin = 'REGISTRO_TARV_ESQUEMA_AR.CD_EDI'
    end
    object TB_TARV_ESQUEMA_ARCD_USU_INCLUSAO: TIntegerField
      FieldName = 'CD_USU_INCLUSAO'
      Origin = 'REGISTRO_TARV_ESQUEMA_AR.CD_USU_INCLUSAO'
    end
    object TB_TARV_ESQUEMA_ARDT_INCLUSAO: TDateTimeField
      FieldName = 'DT_INCLUSAO'
      Origin = 'REGISTRO_TARV_ESQUEMA_AR.DT_INCLUSAO'
    end
    object TB_TARV_ESQUEMA_ARCD_USU_ALTERACAO: TIntegerField
      FieldName = 'CD_USU_ALTERACAO'
      Origin = 'REGISTRO_TARV_ESQUEMA_AR.CD_USU_ALTERACAO'
    end
    object TB_TARV_ESQUEMA_ARDT_ALTERACAO: TDateTimeField
      FieldName = 'DT_ALTERACAO'
      Origin = 'REGISTRO_TARV_ESQUEMA_AR.DT_ALTERACAO'
    end
    object TB_TARV_ESQUEMA_ARCD_REGISTRO_GERAL: TIntegerField
      FieldName = 'CD_REGISTRO_GERAL'
      Origin = 'REGISTRO_TARV_ESQUEMA_AR.CD_REGISTRO_GERAL'
    end
  end
  object TB_TARV_CD4_AR: TIBDataSet
    Database = DM.DB
    Transaction = DM.TS
    BufferChunks = 1000
    CachedUpdates = False
    DeleteSQL.Strings = (
      'delete from "REGISTRO_TARV_CD4_AR"'
      'where'
      '  "CD_REGISTRO_TARV_CD4" = :"OLD_CD_REGISTRO_TARV_CD4" and '
      '  "CD_UND" = :"OLD_CD_UND"')
    InsertSQL.Strings = (
      'insert into "REGISTRO_TARV_CD4_AR"'
      '('
      '  "CD_REGISTRO_TARV_CD4"'
      ', "CD_UND"'
      ', "DT_REGISTRO"'
      ', "CD_UNIDADE"'
      ', "CD_PROVINCIA"'
      ', "CD_MUNICIPIO"'
      ', "VL_MESANO"'
      ', "VL_CD4_MENOR_350"'
      ', "VL_CD4_MAIOR_350"'
      ', "VL_ESTADO_CLINICO_1"'
      ', "VL_ESTADO_CLINICO_2"'
      ', "VL_ESTADO_CLINICO_3"'
      ', "VL_ESTADO_CLINICO_4"'
      ', "FL_ACEITAR"'
      ', "FL_STATUS"'
      ', "DT_EXP"'
      ', "CD_EDI"'
      ', "CD_USU_INCLUSAO"'
      ', "DT_INCLUSAO"'
      ', "CD_USU_ALTERACAO"'
      ', "DT_ALTERACAO"'
      ', "CD_REGISTRO_GERAL"'
      ')'
      'values'
      '('
      '  :"CD_REGISTRO_TARV_CD4"'
      ', :"CD_UND"'
      ', :"DT_REGISTRO"'
      ', :"CD_UNIDADE"'
      ', :"CD_PROVINCIA"'
      ', :"CD_MUNICIPIO"'
      ', :"VL_MESANO"'
      ', :"VL_CD4_MENOR_350"'
      ', :"VL_CD4_MAIOR_350"'
      ', :"VL_ESTADO_CLINICO_1"'
      ', :"VL_ESTADO_CLINICO_2"'
      ', :"VL_ESTADO_CLINICO_3"'
      ', :"VL_ESTADO_CLINICO_4"'
      ', :"FL_ACEITAR"'
      ', :"FL_STATUS"'
      ', :"DT_EXP"'
      ', :"CD_EDI"'
      ', :"CD_USU_INCLUSAO"'
      ', :"DT_INCLUSAO"'
      ', :"CD_USU_ALTERACAO"'
      ', :"DT_ALTERACAO"'
      ', :"CD_REGISTRO_GERAL"'
      ')')
    SelectSQL.Strings = (
      'select "REGISTRO_TARV_CD4_AR"."CD_REGISTRO_TARV_CD4"'
      '      ,"REGISTRO_TARV_CD4_AR"."CD_UND"'
      '      ,"REGISTRO_TARV_CD4_AR"."DT_REGISTRO"'
      '      ,"REGISTRO_TARV_CD4_AR"."CD_UNIDADE"'
      '      ,"REGISTRO_TARV_CD4_AR"."CD_PROVINCIA"'
      '      ,"REGISTRO_TARV_CD4_AR"."CD_MUNICIPIO"'
      '      ,"REGISTRO_TARV_CD4_AR"."VL_MESANO"'
      '      ,"REGISTRO_TARV_CD4_AR"."VL_CD4_MENOR_350"'
      '      ,"REGISTRO_TARV_CD4_AR"."VL_CD4_MAIOR_350"'
      '      ,"REGISTRO_TARV_CD4_AR"."VL_ESTADO_CLINICO_1"'
      '      ,"REGISTRO_TARV_CD4_AR"."VL_ESTADO_CLINICO_2"'
      '      ,"REGISTRO_TARV_CD4_AR"."VL_ESTADO_CLINICO_3"'
      '      ,"REGISTRO_TARV_CD4_AR"."VL_ESTADO_CLINICO_4"'
      '      ,"REGISTRO_TARV_CD4_AR"."FL_ACEITAR"'
      '      ,"REGISTRO_TARV_CD4_AR"."FL_STATUS"'
      '      ,"REGISTRO_TARV_CD4_AR"."DT_EXP"'
      '      ,"REGISTRO_TARV_CD4_AR"."CD_EDI"'
      '      ,"REGISTRO_TARV_CD4_AR"."CD_USU_INCLUSAO"'
      '      ,"REGISTRO_TARV_CD4_AR"."DT_INCLUSAO"'
      '      ,"REGISTRO_TARV_CD4_AR"."CD_USU_ALTERACAO"'
      '      ,"REGISTRO_TARV_CD4_AR"."DT_ALTERACAO"'
      '      ,"REGISTRO_TARV_CD4_AR"."CD_REGISTRO_GERAL"'
      'from "REGISTRO_TARV_CD4_AR"')
    ModifySQL.Strings = (
      'update "REGISTRO_TARV_CD4_AR"'
      'set'
      ' "CD_REGISTRO_TARV_CD4" = :"CD_REGISTRO_TARV_CD4"'
      ', "CD_UND" = :"CD_UND"'
      ', "DT_REGISTRO" = :"DT_REGISTRO"'
      ', "CD_UNIDADE" = :"CD_UNIDADE"'
      ', "CD_PROVINCIA" = :"CD_PROVINCIA"'
      ', "CD_MUNICIPIO" = :"CD_MUNICIPIO"'
      ', "VL_MESANO" = :"VL_MESANO"'
      ', "VL_CD4_MENOR_350" = :"VL_CD4_MENOR_350"'
      ', "VL_CD4_MAIOR_350" = :"VL_CD4_MAIOR_350"'
      ', "VL_ESTADO_CLINICO_1" = :"VL_ESTADO_CLINICO_1"'
      ', "VL_ESTADO_CLINICO_2" = :"VL_ESTADO_CLINICO_2"'
      ', "VL_ESTADO_CLINICO_3" = :"VL_ESTADO_CLINICO_3"'
      ', "VL_ESTADO_CLINICO_4" = :"VL_ESTADO_CLINICO_4"'
      ', "FL_ACEITAR" = :"FL_ACEITAR"'
      ', "FL_STATUS" = :"FL_STATUS"'
      ', "DT_EXP" = :"DT_EXP"'
      ', "CD_EDI" = :"CD_EDI"'
      ', "CD_USU_INCLUSAO" = :"CD_USU_INCLUSAO"'
      ', "DT_INCLUSAO" = :"DT_INCLUSAO"'
      ', "CD_USU_ALTERACAO" = :"CD_USU_ALTERACAO"'
      ', "DT_ALTERACAO" = :"DT_ALTERACAO"'
      ', "CD_REGISTRO_GERAL" = :"CD_REGISTRO_GERAL"'
      'where'
      '  "CD_REGISTRO_TARV_CD4" = :"OLD_CD_REGISTRO_TARV_CD4" and '
      '  "CD_UND" = :"OLD_CD_UND"')
    Left = 624
    Top = 16
    object TB_TARV_CD4_ARCD_REGISTRO_TARV_CD4: TIntegerField
      FieldName = 'CD_REGISTRO_TARV_CD4'
      Origin = 'REGISTRO_TARV_CD4_AR.CD_REGISTRO_TARV_CD4'
      Required = True
    end
    object TB_TARV_CD4_ARCD_UND: TIntegerField
      FieldName = 'CD_UND'
      Origin = 'REGISTRO_TARV_CD4_AR.CD_UND'
      Required = True
    end
    object TB_TARV_CD4_ARDT_REGISTRO: TDateTimeField
      FieldName = 'DT_REGISTRO'
      Origin = 'REGISTRO_TARV_CD4_AR.DT_REGISTRO'
      Required = True
    end
    object TB_TARV_CD4_ARCD_UNIDADE: TIntegerField
      FieldName = 'CD_UNIDADE'
      Origin = 'REGISTRO_TARV_CD4_AR.CD_UNIDADE'
      Required = True
    end
    object TB_TARV_CD4_ARCD_PROVINCIA: TIntegerField
      FieldName = 'CD_PROVINCIA'
      Origin = 'REGISTRO_TARV_CD4_AR.CD_PROVINCIA'
      Required = True
    end
    object TB_TARV_CD4_ARCD_MUNICIPIO: TIntegerField
      FieldName = 'CD_MUNICIPIO'
      Origin = 'REGISTRO_TARV_CD4_AR.CD_MUNICIPIO'
      Required = True
    end
    object TB_TARV_CD4_ARVL_MESANO: TIBStringField
      FieldName = 'VL_MESANO'
      Origin = 'REGISTRO_TARV_CD4_AR.VL_MESANO'
      Required = True
      Size = 8
    end
    object TB_TARV_CD4_ARVL_CD4_MENOR_350: TIntegerField
      FieldName = 'VL_CD4_MENOR_350'
      Origin = 'REGISTRO_TARV_CD4_AR.VL_CD4_MENOR_350'
    end
    object TB_TARV_CD4_ARVL_CD4_MAIOR_350: TIntegerField
      FieldName = 'VL_CD4_MAIOR_350'
      Origin = 'REGISTRO_TARV_CD4_AR.VL_CD4_MAIOR_350'
    end
    object TB_TARV_CD4_ARVL_ESTADO_CLINICO_1: TIntegerField
      FieldName = 'VL_ESTADO_CLINICO_1'
      Origin = 'REGISTRO_TARV_CD4_AR.VL_ESTADO_CLINICO_1'
    end
    object TB_TARV_CD4_ARVL_ESTADO_CLINICO_2: TIntegerField
      FieldName = 'VL_ESTADO_CLINICO_2'
      Origin = 'REGISTRO_TARV_CD4_AR.VL_ESTADO_CLINICO_2'
    end
    object TB_TARV_CD4_ARVL_ESTADO_CLINICO_3: TIntegerField
      FieldName = 'VL_ESTADO_CLINICO_3'
      Origin = 'REGISTRO_TARV_CD4_AR.VL_ESTADO_CLINICO_3'
    end
    object TB_TARV_CD4_ARVL_ESTADO_CLINICO_4: TIntegerField
      FieldName = 'VL_ESTADO_CLINICO_4'
      Origin = 'REGISTRO_TARV_CD4_AR.VL_ESTADO_CLINICO_4'
    end
    object TB_TARV_CD4_ARFL_ACEITAR: TIntegerField
      FieldName = 'FL_ACEITAR'
      Origin = 'REGISTRO_TARV_CD4_AR.FL_ACEITAR'
    end
    object TB_TARV_CD4_ARFL_STATUS: TIBStringField
      FieldName = 'FL_STATUS'
      Origin = 'REGISTRO_TARV_CD4_AR.FL_STATUS'
      FixedChar = True
      Size = 1
    end
    object TB_TARV_CD4_ARDT_EXP: TDateTimeField
      FieldName = 'DT_EXP'
      Origin = 'REGISTRO_TARV_CD4_AR.DT_EXP'
    end
    object TB_TARV_CD4_ARCD_EDI: TIntegerField
      FieldName = 'CD_EDI'
      Origin = 'REGISTRO_TARV_CD4_AR.CD_EDI'
    end
    object TB_TARV_CD4_ARCD_USU_INCLUSAO: TIntegerField
      FieldName = 'CD_USU_INCLUSAO'
      Origin = 'REGISTRO_TARV_CD4_AR.CD_USU_INCLUSAO'
    end
    object TB_TARV_CD4_ARDT_INCLUSAO: TDateTimeField
      FieldName = 'DT_INCLUSAO'
      Origin = 'REGISTRO_TARV_CD4_AR.DT_INCLUSAO'
    end
    object TB_TARV_CD4_ARCD_USU_ALTERACAO: TIntegerField
      FieldName = 'CD_USU_ALTERACAO'
      Origin = 'REGISTRO_TARV_CD4_AR.CD_USU_ALTERACAO'
    end
    object TB_TARV_CD4_ARDT_ALTERACAO: TDateTimeField
      FieldName = 'DT_ALTERACAO'
      Origin = 'REGISTRO_TARV_CD4_AR.DT_ALTERACAO'
    end
    object TB_TARV_CD4_ARCD_REGISTRO_GERAL: TIntegerField
      FieldName = 'CD_REGISTRO_GERAL'
      Origin = 'REGISTRO_TARV_CD4_AR.CD_REGISTRO_GERAL'
    end
  end
  object TB_COINFECCAO_AR: TIBDataSet
    Database = DM.DB
    Transaction = DM.TS
    BufferChunks = 1000
    CachedUpdates = False
    DeleteSQL.Strings = (
      'delete from "REGISTRO_COINFECCAO_AR"'
      'where'
      '  "CD_REGISTRO_COINFECCAO" = :"OLD_CD_REGISTRO_COINFECCAO" and '
      '  "CD_UND" = :"OLD_CD_UND"')
    InsertSQL.Strings = (
      'insert into "REGISTRO_COINFECCAO_AR"'
      '('
      '  "CD_REGISTRO_COINFECCAO"'
      ', "CD_UND"'
      ', "DT_REGISTRO"'
      ', "CD_UNIDADE"'
      ', "CD_PROVINCIA"'
      ', "CD_MUNICIPIO"'
      ', "VL_MESANO"'
      ', "VL_VIH_POSITIVOS"'
      ', "VL_TRATAMENTO_ARVS"'
      ', "FL_ACEITAR"'
      ', "FL_STATUS"'
      ', "DT_EXP"'
      ', "CD_EDI"'
      ', "CD_USU_INCLUSAO"'
      ', "DT_INCLUSAO"'
      ', "CD_USU_ALTERACAO"'
      ', "DT_ALTERACAO"'
      ', "CD_REGISTRO_GERAL"'
      ')'
      'values'
      '('
      '  :"CD_REGISTRO_COINFECCAO"'
      ', :"CD_UND"'
      ', :"DT_REGISTRO"'
      ', :"CD_UNIDADE"'
      ', :"CD_PROVINCIA"'
      ', :"CD_MUNICIPIO"'
      ', :"VL_MESANO"'
      ', :"VL_VIH_POSITIVOS"'
      ', :"VL_TRATAMENTO_ARVS"'
      ', :"FL_ACEITAR"'
      ', :"FL_STATUS"'
      ', :"DT_EXP"'
      ', :"CD_EDI"'
      ', :"CD_USU_INCLUSAO"'
      ', :"DT_INCLUSAO"'
      ', :"CD_USU_ALTERACAO"'
      ', :"DT_ALTERACAO"'
      ', :"CD_REGISTRO_GERAL"'
      ')')
    SelectSQL.Strings = (
      'select "REGISTRO_COINFECCAO_AR"."CD_REGISTRO_COINFECCAO"'
      '      ,"REGISTRO_COINFECCAO_AR"."CD_UND"'
      '      ,"REGISTRO_COINFECCAO_AR"."DT_REGISTRO"'
      '      ,"REGISTRO_COINFECCAO_AR"."CD_UNIDADE"'
      '      ,"REGISTRO_COINFECCAO_AR"."CD_PROVINCIA"'
      '      ,"REGISTRO_COINFECCAO_AR"."CD_MUNICIPIO"'
      '      ,"REGISTRO_COINFECCAO_AR"."VL_MESANO"'
      '      ,"REGISTRO_COINFECCAO_AR"."VL_VIH_POSITIVOS"'
      '      ,"REGISTRO_COINFECCAO_AR"."VL_TRATAMENTO_ARVS"'
      '      ,"REGISTRO_COINFECCAO_AR"."FL_ACEITAR"'
      '      ,"REGISTRO_COINFECCAO_AR"."FL_STATUS"'
      '      ,"REGISTRO_COINFECCAO_AR"."DT_EXP"'
      '      ,"REGISTRO_COINFECCAO_AR"."CD_EDI"'
      '      ,"REGISTRO_COINFECCAO_AR"."CD_USU_INCLUSAO"'
      '      ,"REGISTRO_COINFECCAO_AR"."DT_INCLUSAO"'
      '      ,"REGISTRO_COINFECCAO_AR"."CD_USU_ALTERACAO"'
      '      ,"REGISTRO_COINFECCAO_AR"."DT_ALTERACAO"'
      '      ,"REGISTRO_COINFECCAO_AR"."CD_REGISTRO_GERAL"'
      'from "REGISTRO_COINFECCAO_AR"')
    ModifySQL.Strings = (
      'update "REGISTRO_COINFECCAO_AR"'
      'set'
      ' "CD_REGISTRO_COINFECCAO" = :"CD_REGISTRO_COINFECCAO"'
      ', "CD_UND" = :"CD_UND"'
      ', "DT_REGISTRO" = :"DT_REGISTRO"'
      ', "CD_UNIDADE" = :"CD_UNIDADE"'
      ', "CD_PROVINCIA" = :"CD_PROVINCIA"'
      ', "CD_MUNICIPIO" = :"CD_MUNICIPIO"'
      ', "VL_MESANO" = :"VL_MESANO"'
      ', "VL_VIH_POSITIVOS" = :"VL_VIH_POSITIVOS"'
      ', "VL_TRATAMENTO_ARVS" = :"VL_TRATAMENTO_ARVS"'
      ', "FL_ACEITAR" = :"FL_ACEITAR"'
      ', "FL_STATUS" = :"FL_STATUS"'
      ', "DT_EXP" = :"DT_EXP"'
      ', "CD_EDI" = :"CD_EDI"'
      ', "CD_USU_INCLUSAO" = :"CD_USU_INCLUSAO"'
      ', "DT_INCLUSAO" = :"DT_INCLUSAO"'
      ', "CD_USU_ALTERACAO" = :"CD_USU_ALTERACAO"'
      ', "DT_ALTERACAO" = :"DT_ALTERACAO"'
      ', "CD_REGISTRO_GERAL" = :"CD_REGISTRO_GERAL"'
      'where'
      '  "CD_REGISTRO_COINFECCAO" = :"OLD_CD_REGISTRO_COINFECCAO" and '
      '  "CD_UND" = :"OLD_CD_UND"')
    Left = 736
    Top = 16
    object TB_COINFECCAO_ARCD_REGISTRO_COINFECCAO: TIntegerField
      FieldName = 'CD_REGISTRO_COINFECCAO'
      Origin = 'REGISTRO_COINFECCAO_AR.CD_REGISTRO_COINFECCAO'
      Required = True
    end
    object TB_COINFECCAO_ARCD_UND: TIntegerField
      FieldName = 'CD_UND'
      Origin = 'REGISTRO_COINFECCAO_AR.CD_UND'
      Required = True
    end
    object TB_COINFECCAO_ARDT_REGISTRO: TDateTimeField
      FieldName = 'DT_REGISTRO'
      Origin = 'REGISTRO_COINFECCAO_AR.DT_REGISTRO'
      Required = True
    end
    object TB_COINFECCAO_ARCD_UNIDADE: TIntegerField
      FieldName = 'CD_UNIDADE'
      Origin = 'REGISTRO_COINFECCAO_AR.CD_UNIDADE'
      Required = True
    end
    object TB_COINFECCAO_ARCD_PROVINCIA: TIntegerField
      FieldName = 'CD_PROVINCIA'
      Origin = 'REGISTRO_COINFECCAO_AR.CD_PROVINCIA'
      Required = True
    end
    object TB_COINFECCAO_ARCD_MUNICIPIO: TIntegerField
      FieldName = 'CD_MUNICIPIO'
      Origin = 'REGISTRO_COINFECCAO_AR.CD_MUNICIPIO'
      Required = True
    end
    object TB_COINFECCAO_ARVL_MESANO: TIBStringField
      FieldName = 'VL_MESANO'
      Origin = 'REGISTRO_COINFECCAO_AR.VL_MESANO'
      Required = True
      Size = 8
    end
    object TB_COINFECCAO_ARVL_VIH_POSITIVOS: TIntegerField
      FieldName = 'VL_VIH_POSITIVOS'
      Origin = 'REGISTRO_COINFECCAO_AR.VL_VIH_POSITIVOS'
    end
    object TB_COINFECCAO_ARVL_TRATAMENTO_ARVS: TIntegerField
      FieldName = 'VL_TRATAMENTO_ARVS'
      Origin = 'REGISTRO_COINFECCAO_AR.VL_TRATAMENTO_ARVS'
    end
    object TB_COINFECCAO_ARFL_ACEITAR: TIntegerField
      FieldName = 'FL_ACEITAR'
      Origin = 'REGISTRO_COINFECCAO_AR.FL_ACEITAR'
    end
    object TB_COINFECCAO_ARFL_STATUS: TIBStringField
      FieldName = 'FL_STATUS'
      Origin = 'REGISTRO_COINFECCAO_AR.FL_STATUS'
      FixedChar = True
      Size = 1
    end
    object TB_COINFECCAO_ARDT_EXP: TDateTimeField
      FieldName = 'DT_EXP'
      Origin = 'REGISTRO_COINFECCAO_AR.DT_EXP'
    end
    object TB_COINFECCAO_ARCD_EDI: TIntegerField
      FieldName = 'CD_EDI'
      Origin = 'REGISTRO_COINFECCAO_AR.CD_EDI'
    end
    object TB_COINFECCAO_ARCD_USU_INCLUSAO: TIntegerField
      FieldName = 'CD_USU_INCLUSAO'
      Origin = 'REGISTRO_COINFECCAO_AR.CD_USU_INCLUSAO'
    end
    object TB_COINFECCAO_ARDT_INCLUSAO: TDateTimeField
      FieldName = 'DT_INCLUSAO'
      Origin = 'REGISTRO_COINFECCAO_AR.DT_INCLUSAO'
    end
    object TB_COINFECCAO_ARCD_USU_ALTERACAO: TIntegerField
      FieldName = 'CD_USU_ALTERACAO'
      Origin = 'REGISTRO_COINFECCAO_AR.CD_USU_ALTERACAO'
    end
    object TB_COINFECCAO_ARDT_ALTERACAO: TDateTimeField
      FieldName = 'DT_ALTERACAO'
      Origin = 'REGISTRO_COINFECCAO_AR.DT_ALTERACAO'
    end
    object TB_COINFECCAO_ARCD_REGISTRO_GERAL: TIntegerField
      FieldName = 'CD_REGISTRO_GERAL'
      Origin = 'REGISTRO_COINFECCAO_AR.CD_REGISTRO_GERAL'
    end
  end
  object TB_PROGRAMA_AR: TIBDataSet
    Database = DM.DB
    Transaction = DM.TS
    BufferChunks = 1000
    CachedUpdates = False
    DeleteSQL.Strings = (
      'delete from "REGISTRO_PROGRAMA_AR"'
      'where'
      '  "CD_REGISTRO_PROGRAMA" = :"OLD_CD_REGISTRO_PROGRAMA" and '
      '  "CD_UND" = :"OLD_CD_UND"')
    InsertSQL.Strings = (
      'insert into "REGISTRO_PROGRAMA_AR"'
      '('
      '  "CD_REGISTRO_PROGRAMA"'
      ', "CD_UND"'
      ', "DT_REGISTRO"'
      ', "CD_UNIDADE"'
      ', "CD_PROVINCIA"'
      ', "CD_MUNICIPIO"'
      ', "VL_MESANO"'
      ', "VL_ACONSELHADOS"'
      ', "VL_POSITIVOS"'
      ', "VL_NEGATIVOS"'
      ', "VL_INDETERMINADOS"'
      ', "VL_FEMININO_2"'
      ', "VL_MASCULINO_2"'
      ', "VL_GESTANTE_3"'
      ', "VL_POS_PARTO_3"'
      ', "VL_PARTOS_3"'
      ', "VL_FEMININO_52"'
      ', "VL_MASCULINO_52"'
      ', "FL_ACEITAR"'
      ', "FL_STATUS"'
      ', "DT_EXP"'
      ', "CD_EDI"'
      ', "CD_USU_INCLUSAO"'
      ', "DT_INCLUSAO"'
      ', "CD_USU_ALTERACAO"'
      ', "DT_ALTERACAO"'
      ', "CD_USU_EXCLUSAO"'
      ', "CD_REGISTRO_GERAL"'
      ')'
      'values'
      '('
      '  :"CD_REGISTRO_PROGRAMA"'
      ', :"CD_UND"'
      ', :"DT_REGISTRO"'
      ', :"CD_UNIDADE"'
      ', :"CD_PROVINCIA"'
      ', :"CD_MUNICIPIO"'
      ', :"VL_MESANO"'
      ', :"VL_ACONSELHADOS"'
      ', :"VL_POSITIVOS"'
      ', :"VL_NEGATIVOS"'
      ', :"VL_INDETERMINADOS"'
      ', :"VL_FEMININO_2"'
      ', :"VL_MASCULINO_2"'
      ', :"VL_GESTANTE_3"'
      ', :"VL_POS_PARTO_3"'
      ', :"VL_PARTOS_3"'
      ', :"VL_FEMININO_52"'
      ', :"VL_MASCULINO_52"'
      ', :"FL_ACEITAR"'
      ', :"FL_STATUS"'
      ', :"DT_EXP"'
      ', :"CD_EDI"'
      ', :"CD_USU_INCLUSAO"'
      ', :"DT_INCLUSAO"'
      ', :"CD_USU_ALTERACAO"'
      ', :"DT_ALTERACAO"'
      ', :"CD_USU_EXCLUSAO"'
      ', :"CD_REGISTRO_GERAL"'
      ')')
    SelectSQL.Strings = (
      'select "REGISTRO_PROGRAMA_AR"."CD_REGISTRO_PROGRAMA"'
      '      ,"REGISTRO_PROGRAMA_AR"."CD_UND"'
      '      ,"REGISTRO_PROGRAMA_AR"."DT_REGISTRO"'
      '      ,"REGISTRO_PROGRAMA_AR"."CD_UNIDADE"'
      '      ,"REGISTRO_PROGRAMA_AR"."CD_PROVINCIA"'
      '      ,"REGISTRO_PROGRAMA_AR"."CD_MUNICIPIO"'
      '      ,"REGISTRO_PROGRAMA_AR"."VL_MESANO"'
      '      ,"REGISTRO_PROGRAMA_AR"."VL_ACONSELHADOS"'
      '      ,"REGISTRO_PROGRAMA_AR"."VL_POSITIVOS"'
      '      ,"REGISTRO_PROGRAMA_AR"."VL_NEGATIVOS"'
      '      ,"REGISTRO_PROGRAMA_AR"."VL_INDETERMINADOS"'
      '      ,"REGISTRO_PROGRAMA_AR"."VL_FEMININO_2"'
      '      ,"REGISTRO_PROGRAMA_AR"."VL_MASCULINO_2"'
      '      ,"REGISTRO_PROGRAMA_AR"."VL_GESTANTE_3"'
      '      ,"REGISTRO_PROGRAMA_AR"."VL_POS_PARTO_3"'
      '      ,"REGISTRO_PROGRAMA_AR"."VL_PARTOS_3"'
      '      ,"REGISTRO_PROGRAMA_AR"."VL_FEMININO_52"'
      '      ,"REGISTRO_PROGRAMA_AR"."VL_MASCULINO_52"'
      '      ,"REGISTRO_PROGRAMA_AR"."FL_ACEITAR"'
      '      ,"REGISTRO_PROGRAMA_AR"."FL_STATUS"'
      '      ,"REGISTRO_PROGRAMA_AR"."DT_EXP"'
      '      ,"REGISTRO_PROGRAMA_AR"."CD_EDI"'
      '      ,"REGISTRO_PROGRAMA_AR"."CD_USU_INCLUSAO"'
      '      ,"REGISTRO_PROGRAMA_AR"."DT_INCLUSAO"'
      '      ,"REGISTRO_PROGRAMA_AR"."CD_USU_ALTERACAO"'
      '      ,"REGISTRO_PROGRAMA_AR"."DT_ALTERACAO"'
      '      ,"REGISTRO_PROGRAMA_AR"."CD_USU_EXCLUSAO"'
      '      ,"REGISTRO_PROGRAMA_AR"."CD_REGISTRO_GERAL"'
      'from "REGISTRO_PROGRAMA_AR"')
    ModifySQL.Strings = (
      'update "REGISTRO_PROGRAMA_AR"'
      'set'
      ' "CD_REGISTRO_PROGRAMA" = :"CD_REGISTRO_PROGRAMA"'
      ', "CD_UND" = :"CD_UND"'
      ', "DT_REGISTRO" = :"DT_REGISTRO"'
      ', "CD_UNIDADE" = :"CD_UNIDADE"'
      ', "CD_PROVINCIA" = :"CD_PROVINCIA"'
      ', "CD_MUNICIPIO" = :"CD_MUNICIPIO"'
      ', "VL_MESANO" = :"VL_MESANO"'
      ', "VL_ACONSELHADOS" = :"VL_ACONSELHADOS"'
      ', "VL_POSITIVOS" = :"VL_POSITIVOS"'
      ', "VL_NEGATIVOS" = :"VL_NEGATIVOS"'
      ', "VL_INDETERMINADOS" = :"VL_INDETERMINADOS"'
      ', "VL_FEMININO_2" = :"VL_FEMININO_2"'
      ', "VL_MASCULINO_2" = :"VL_MASCULINO_2"'
      ', "VL_GESTANTE_3" = :"VL_GESTANTE_3"'
      ', "VL_POS_PARTO_3" = :"VL_POS_PARTO_3"'
      ', "VL_PARTOS_3" = :"VL_PARTOS_3"'
      ', "VL_FEMININO_52" = :"VL_FEMININO_52"'
      ', "VL_MASCULINO_52" = :"VL_MASCULINO_52"'
      ', "FL_ACEITAR" = :"FL_ACEITAR"'
      ', "FL_STATUS" = :"FL_STATUS"'
      ', "DT_EXP" = :"DT_EXP"'
      ', "CD_EDI" = :"CD_EDI"'
      ', "CD_USU_INCLUSAO" = :"CD_USU_INCLUSAO"'
      ', "DT_INCLUSAO" = :"DT_INCLUSAO"'
      ', "CD_USU_ALTERACAO" = :"CD_USU_ALTERACAO"'
      ', "DT_ALTERACAO" = :"DT_ALTERACAO"'
      ', "CD_USU_EXCLUSAO" = :"CD_USU_EXCLUSAO"'
      ', "CD_REGISTRO_GERAL" = :"CD_REGISTRO_GERAL"'
      'where'
      '  "CD_REGISTRO_PROGRAMA" = :"OLD_CD_REGISTRO_PROGRAMA" and '
      '  "CD_UND" = :"OLD_CD_UND"')
    Left = 856
    Top = 16
    object TB_PROGRAMA_ARCD_REGISTRO_PROGRAMA: TIntegerField
      FieldName = 'CD_REGISTRO_PROGRAMA'
      Origin = 'REGISTRO_PROGRAMA_AR.CD_REGISTRO_PROGRAMA'
      Required = True
    end
    object TB_PROGRAMA_ARCD_UND: TIntegerField
      FieldName = 'CD_UND'
      Origin = 'REGISTRO_PROGRAMA_AR.CD_UND'
      Required = True
    end
    object TB_PROGRAMA_ARDT_REGISTRO: TDateTimeField
      FieldName = 'DT_REGISTRO'
      Origin = 'REGISTRO_PROGRAMA_AR.DT_REGISTRO'
      Required = True
    end
    object TB_PROGRAMA_ARCD_UNIDADE: TIntegerField
      FieldName = 'CD_UNIDADE'
      Origin = 'REGISTRO_PROGRAMA_AR.CD_UNIDADE'
    end
    object TB_PROGRAMA_ARCD_PROVINCIA: TIntegerField
      FieldName = 'CD_PROVINCIA'
      Origin = 'REGISTRO_PROGRAMA_AR.CD_PROVINCIA'
    end
    object TB_PROGRAMA_ARCD_MUNICIPIO: TIntegerField
      FieldName = 'CD_MUNICIPIO'
      Origin = 'REGISTRO_PROGRAMA_AR.CD_MUNICIPIO'
    end
    object TB_PROGRAMA_ARVL_MESANO: TIBStringField
      FieldName = 'VL_MESANO'
      Origin = 'REGISTRO_PROGRAMA_AR.VL_MESANO'
      Size = 8
    end
    object TB_PROGRAMA_ARVL_ACONSELHADOS: TIntegerField
      FieldName = 'VL_ACONSELHADOS'
      Origin = 'REGISTRO_PROGRAMA_AR.VL_ACONSELHADOS'
    end
    object TB_PROGRAMA_ARVL_POSITIVOS: TIntegerField
      FieldName = 'VL_POSITIVOS'
      Origin = 'REGISTRO_PROGRAMA_AR.VL_POSITIVOS'
    end
    object TB_PROGRAMA_ARVL_NEGATIVOS: TIntegerField
      FieldName = 'VL_NEGATIVOS'
      Origin = 'REGISTRO_PROGRAMA_AR.VL_NEGATIVOS'
    end
    object TB_PROGRAMA_ARVL_INDETERMINADOS: TIntegerField
      FieldName = 'VL_INDETERMINADOS'
      Origin = 'REGISTRO_PROGRAMA_AR.VL_INDETERMINADOS'
    end
    object TB_PROGRAMA_ARVL_FEMININO_2: TIntegerField
      FieldName = 'VL_FEMININO_2'
      Origin = 'REGISTRO_PROGRAMA_AR.VL_FEMININO_2'
    end
    object TB_PROGRAMA_ARVL_MASCULINO_2: TIntegerField
      FieldName = 'VL_MASCULINO_2'
      Origin = 'REGISTRO_PROGRAMA_AR.VL_MASCULINO_2'
    end
    object TB_PROGRAMA_ARVL_GESTANTE_3: TIntegerField
      FieldName = 'VL_GESTANTE_3'
      Origin = 'REGISTRO_PROGRAMA_AR.VL_GESTANTE_3'
    end
    object TB_PROGRAMA_ARVL_POS_PARTO_3: TIntegerField
      FieldName = 'VL_POS_PARTO_3'
      Origin = 'REGISTRO_PROGRAMA_AR.VL_POS_PARTO_3'
    end
    object TB_PROGRAMA_ARVL_PARTOS_3: TIntegerField
      FieldName = 'VL_PARTOS_3'
      Origin = 'REGISTRO_PROGRAMA_AR.VL_PARTOS_3'
    end
    object TB_PROGRAMA_ARVL_FEMININO_52: TIntegerField
      FieldName = 'VL_FEMININO_52'
      Origin = 'REGISTRO_PROGRAMA_AR.VL_FEMININO_52'
    end
    object TB_PROGRAMA_ARVL_MASCULINO_52: TIntegerField
      FieldName = 'VL_MASCULINO_52'
      Origin = 'REGISTRO_PROGRAMA_AR.VL_MASCULINO_52'
    end
    object TB_PROGRAMA_ARFL_ACEITAR: TIntegerField
      FieldName = 'FL_ACEITAR'
      Origin = 'REGISTRO_PROGRAMA_AR.FL_ACEITAR'
    end
    object TB_PROGRAMA_ARFL_STATUS: TIBStringField
      FieldName = 'FL_STATUS'
      Origin = 'REGISTRO_PROGRAMA_AR.FL_STATUS'
      FixedChar = True
      Size = 1
    end
    object TB_PROGRAMA_ARDT_EXP: TDateTimeField
      FieldName = 'DT_EXP'
      Origin = 'REGISTRO_PROGRAMA_AR.DT_EXP'
    end
    object TB_PROGRAMA_ARCD_EDI: TIntegerField
      FieldName = 'CD_EDI'
      Origin = 'REGISTRO_PROGRAMA_AR.CD_EDI'
    end
    object TB_PROGRAMA_ARCD_USU_INCLUSAO: TIntegerField
      FieldName = 'CD_USU_INCLUSAO'
      Origin = 'REGISTRO_PROGRAMA_AR.CD_USU_INCLUSAO'
    end
    object TB_PROGRAMA_ARDT_INCLUSAO: TDateTimeField
      FieldName = 'DT_INCLUSAO'
      Origin = 'REGISTRO_PROGRAMA_AR.DT_INCLUSAO'
    end
    object TB_PROGRAMA_ARCD_USU_ALTERACAO: TIntegerField
      FieldName = 'CD_USU_ALTERACAO'
      Origin = 'REGISTRO_PROGRAMA_AR.CD_USU_ALTERACAO'
    end
    object TB_PROGRAMA_ARDT_ALTERACAO: TDateTimeField
      FieldName = 'DT_ALTERACAO'
      Origin = 'REGISTRO_PROGRAMA_AR.DT_ALTERACAO'
    end
    object TB_PROGRAMA_ARCD_USU_EXCLUSAO: TIntegerField
      FieldName = 'CD_USU_EXCLUSAO'
      Origin = 'REGISTRO_PROGRAMA_AR.CD_USU_EXCLUSAO'
    end
    object TB_PROGRAMA_ARCD_REGISTRO_GERAL: TIntegerField
      FieldName = 'CD_REGISTRO_GERAL'
      Origin = 'REGISTRO_PROGRAMA_AR.CD_REGISTRO_GERAL'
    end
  end
  object TB_ATV_ARE: TIBDataSet
    Database = DM.DB
    Transaction = DM.TS
    AfterInsert = TB_ATV_AREAfterInsert
    AfterPost = TB_ATV_AREAfterPost
    BufferChunks = 1000
    CachedUpdates = False
    DeleteSQL.Strings = (
      'delete from "REGISTRO_ATV_ARE"'
      'where'
      '  "CD_REGISTRO_ATV" = :"OLD_CD_REGISTRO_ATV" and '
      '  "CD_UND" = :"OLD_CD_UND"')
    InsertSQL.Strings = (
      'insert into "REGISTRO_ATV_ARE"'
      '('
      '  "CD_REGISTRO_ATV"'
      ', "CD_UND"'
      ', "DT_REGISTRO"'
      ', "CD_UNIDADE"'
      ', "CD_PROVINCIA"'
      ', "CD_MUNICIPIO"'
      ', "VL_MESANO"'
      ', "VL_ACONSELHADOS"'
      ', "VL_POSITIVOS"'
      ', "VL_NEGATIVOS"'
      ', "VL_INDETERMINADOS"'
      ', "FL_ACEITAR"'
      ', "FL_STATUS"'
      ', "DT_EXP"'
      ', "CD_EDI"'
      ', "CD_USU_INCLUSAO"'
      ', "DT_INCLUSAO"'
      ', "CD_USU_ALTERACAO"'
      ', "DT_ALTERACAO"'
      ', "CD_REGISTRO_GERAL"'
      ')'
      'values'
      '('
      '  :"CD_REGISTRO_ATV"'
      ', :"CD_UND"'
      ', :"DT_REGISTRO"'
      ', :"CD_UNIDADE"'
      ', :"CD_PROVINCIA"'
      ', :"CD_MUNICIPIO"'
      ', :"VL_MESANO"'
      ', :"VL_ACONSELHADOS"'
      ', :"VL_POSITIVOS"'
      ', :"VL_NEGATIVOS"'
      ', :"VL_INDETERMINADOS"'
      ', :"FL_ACEITAR"'
      ', :"FL_STATUS"'
      ', :"DT_EXP"'
      ', :"CD_EDI"'
      ', :"CD_USU_INCLUSAO"'
      ', :"DT_INCLUSAO"'
      ', :"CD_USU_ALTERACAO"'
      ', :"DT_ALTERACAO"'
      ', :"CD_REGISTRO_GERAL"'
      ')')
    SelectSQL.Strings = (
      'select "REGISTRO_ATV_ARE"."CD_REGISTRO_ATV"'
      '      ,"REGISTRO_ATV_ARE"."CD_UND"'
      '      ,"REGISTRO_ATV_ARE"."DT_REGISTRO"'
      '      ,"REGISTRO_ATV_ARE"."CD_UNIDADE"'
      '      ,"REGISTRO_ATV_ARE"."CD_PROVINCIA"'
      '      ,"REGISTRO_ATV_ARE"."CD_MUNICIPIO"'
      '      ,"REGISTRO_ATV_ARE"."VL_MESANO"'
      '      ,"REGISTRO_ATV_ARE"."VL_ACONSELHADOS"'
      '      ,"REGISTRO_ATV_ARE"."VL_POSITIVOS"'
      '      ,"REGISTRO_ATV_ARE"."VL_NEGATIVOS"'
      '      ,"REGISTRO_ATV_ARE"."VL_INDETERMINADOS"'
      '      ,"REGISTRO_ATV_ARE"."FL_ACEITAR"'
      '      ,"REGISTRO_ATV_ARE"."FL_STATUS"'
      '      ,"REGISTRO_ATV_ARE"."DT_EXP"'
      '      ,"REGISTRO_ATV_ARE"."CD_EDI"'
      '      ,"REGISTRO_ATV_ARE"."CD_USU_INCLUSAO"'
      '      ,"REGISTRO_ATV_ARE"."DT_INCLUSAO"'
      '      ,"REGISTRO_ATV_ARE"."CD_USU_ALTERACAO"'
      '      ,"REGISTRO_ATV_ARE"."DT_ALTERACAO"'
      '      ,"REGISTRO_ATV_ARE"."CD_REGISTRO_GERAL"'
      'from "REGISTRO_ATV_ARE"')
    ModifySQL.Strings = (
      'update "REGISTRO_ATV_ARE"'
      'set'
      ' "CD_REGISTRO_ATV" = :"CD_REGISTRO_ATV"'
      ', "CD_UND" = :"CD_UND"'
      ', "DT_REGISTRO" = :"DT_REGISTRO"'
      ', "CD_UNIDADE" = :"CD_UNIDADE"'
      ', "CD_PROVINCIA" = :"CD_PROVINCIA"'
      ', "CD_MUNICIPIO" = :"CD_MUNICIPIO"'
      ', "VL_MESANO" = :"VL_MESANO"'
      ', "VL_ACONSELHADOS" = :"VL_ACONSELHADOS"'
      ', "VL_POSITIVOS" = :"VL_POSITIVOS"'
      ', "VL_NEGATIVOS" = :"VL_NEGATIVOS"'
      ', "VL_INDETERMINADOS" = :"VL_INDETERMINADOS"'
      ', "FL_ACEITAR" = :"FL_ACEITAR"'
      ', "FL_STATUS" = :"FL_STATUS"'
      ', "DT_EXP" = :"DT_EXP"'
      ', "CD_EDI" = :"CD_EDI"'
      ', "CD_USU_INCLUSAO" = :"CD_USU_INCLUSAO"'
      ', "DT_INCLUSAO" = :"DT_INCLUSAO"'
      ', "CD_USU_ALTERACAO" = :"CD_USU_ALTERACAO"'
      ', "DT_ALTERACAO" = :"DT_ALTERACAO"'
      ', "CD_REGISTRO_GERAL" = :"CD_REGISTRO_GERAL"'
      'where'
      '  "CD_REGISTRO_ATV" = :"OLD_CD_REGISTRO_ATV" and '
      '  "CD_UND" = :"OLD_CD_UND"')
    GeneratorField.Field = 'CD_REGISTRO_ATV'
    GeneratorField.Generator = 'GEN_REGISTRO_ATV_ARE'
    Left = 64
    Top = 72
    object TB_ATV_ARECD_REGISTRO_ATV: TIntegerField
      FieldName = 'CD_REGISTRO_ATV'
      Origin = 'REGISTRO_ATV_ARE.CD_REGISTRO_ATV'
      Required = True
    end
    object TB_ATV_ARECD_UND: TIntegerField
      FieldName = 'CD_UND'
      Origin = 'REGISTRO_ATV_ARE.CD_UND'
      Required = True
    end
    object TB_ATV_AREDT_REGISTRO: TDateTimeField
      FieldName = 'DT_REGISTRO'
      Origin = 'REGISTRO_ATV_ARE.DT_REGISTRO'
      Required = True
    end
    object TB_ATV_ARECD_UNIDADE: TIntegerField
      FieldName = 'CD_UNIDADE'
      Origin = 'REGISTRO_ATV_ARE.CD_UNIDADE'
      Required = True
    end
    object TB_ATV_ARECD_PROVINCIA: TIntegerField
      FieldName = 'CD_PROVINCIA'
      Origin = 'REGISTRO_ATV_ARE.CD_PROVINCIA'
      Required = True
    end
    object TB_ATV_ARECD_MUNICIPIO: TIntegerField
      FieldName = 'CD_MUNICIPIO'
      Origin = 'REGISTRO_ATV_ARE.CD_MUNICIPIO'
      Required = True
    end
    object TB_ATV_AREVL_MESANO: TIBStringField
      FieldName = 'VL_MESANO'
      Origin = 'REGISTRO_ATV_ARE.VL_MESANO'
      Required = True
      Size = 8
    end
    object TB_ATV_AREVL_ACONSELHADOS: TIntegerField
      FieldName = 'VL_ACONSELHADOS'
      Origin = 'REGISTRO_ATV_ARE.VL_ACONSELHADOS'
    end
    object TB_ATV_AREVL_POSITIVOS: TIntegerField
      FieldName = 'VL_POSITIVOS'
      Origin = 'REGISTRO_ATV_ARE.VL_POSITIVOS'
    end
    object TB_ATV_AREVL_NEGATIVOS: TIntegerField
      FieldName = 'VL_NEGATIVOS'
      Origin = 'REGISTRO_ATV_ARE.VL_NEGATIVOS'
    end
    object TB_ATV_AREVL_INDETERMINADOS: TIntegerField
      FieldName = 'VL_INDETERMINADOS'
      Origin = 'REGISTRO_ATV_ARE.VL_INDETERMINADOS'
    end
    object TB_ATV_AREFL_ACEITAR: TIntegerField
      FieldName = 'FL_ACEITAR'
      Origin = 'REGISTRO_ATV_ARE.FL_ACEITAR'
    end
    object TB_ATV_AREFL_STATUS: TIBStringField
      FieldName = 'FL_STATUS'
      Origin = 'REGISTRO_ATV_ARE.FL_STATUS'
      FixedChar = True
      Size = 1
    end
    object TB_ATV_AREDT_EXP: TDateTimeField
      FieldName = 'DT_EXP'
      Origin = 'REGISTRO_ATV_ARE.DT_EXP'
    end
    object TB_ATV_ARECD_EDI: TIntegerField
      FieldName = 'CD_EDI'
      Origin = 'REGISTRO_ATV_ARE.CD_EDI'
    end
    object TB_ATV_ARECD_USU_INCLUSAO: TIntegerField
      FieldName = 'CD_USU_INCLUSAO'
      Origin = 'REGISTRO_ATV_ARE.CD_USU_INCLUSAO'
    end
    object TB_ATV_AREDT_INCLUSAO: TDateTimeField
      FieldName = 'DT_INCLUSAO'
      Origin = 'REGISTRO_ATV_ARE.DT_INCLUSAO'
    end
    object TB_ATV_ARECD_USU_ALTERACAO: TIntegerField
      FieldName = 'CD_USU_ALTERACAO'
      Origin = 'REGISTRO_ATV_ARE.CD_USU_ALTERACAO'
    end
    object TB_ATV_AREDT_ALTERACAO: TDateTimeField
      FieldName = 'DT_ALTERACAO'
      Origin = 'REGISTRO_ATV_ARE.DT_ALTERACAO'
    end
    object TB_ATV_ARECD_REGISTRO_GERAL: TIntegerField
      FieldName = 'CD_REGISTRO_GERAL'
      Origin = 'REGISTRO_ATV_ARE.CD_REGISTRO_GERAL'
    end
  end
  object TB_PTV_ARE: TIBDataSet
    Database = DM.DB
    Transaction = DM.TS
    AfterInsert = TB_PTV_AREAfterInsert
    AfterPost = TB_ATV_AREAfterPost
    BufferChunks = 1000
    CachedUpdates = False
    DeleteSQL.Strings = (
      'delete from "REGISTRO_PTV_ARE"'
      'where'
      '  "CD_REGISTRO_PTV" = :"OLD_CD_REGISTRO_PTV" and '
      '  "CD_UND" = :"OLD_CD_UND"')
    InsertSQL.Strings = (
      'insert into "REGISTRO_PTV_ARE"'
      '('
      '  "CD_REGISTRO_PTV"'
      ', "CD_UND"'
      ', "DT_REGISTRO"'
      ', "CD_UNIDADE"'
      ', "CD_PROVINCIA"'
      ', "CD_MUNICIPIO"'
      ', "VL_MESANO"'
      ', "VL_ADMITIDAS_PTV"'
      ', "VL_ADMITIDAS_PARTO"'
      ', "VL_ADMITIDAS_POS_PARTO"'
      ', "VL_TERAPIA_COMPLETA"'
      ', "VL_TERAPIA_OUTRO"'
      ', "VL_TERAPIA_NENHUM"'
      ', "VL_TOTAL_CRIANCA"'
      ', "FL_ACEITAR"'
      ', "FL_STATUS"'
      ', "DT_EXP"'
      ', "CD_EDI"'
      ', "CD_USU_INCLUSAO"'
      ', "DT_INCLUSAO"'
      ', "CD_USU_ALTERACAO"'
      ', "DT_ALTERACAO"'
      ', "CD_REGISTRO_GERAL"'
      ')'
      'values'
      '('
      '  :"CD_REGISTRO_PTV"'
      ', :"CD_UND"'
      ', :"DT_REGISTRO"'
      ', :"CD_UNIDADE"'
      ', :"CD_PROVINCIA"'
      ', :"CD_MUNICIPIO"'
      ', :"VL_MESANO"'
      ', :"VL_ADMITIDAS_PTV"'
      ', :"VL_ADMITIDAS_PARTO"'
      ', :"VL_ADMITIDAS_POS_PARTO"'
      ', :"VL_TERAPIA_COMPLETA"'
      ', :"VL_TERAPIA_OUTRO"'
      ', :"VL_TERAPIA_NENHUM"'
      ', :"VL_TOTAL_CRIANCA"'
      ', :"FL_ACEITAR"'
      ', :"FL_STATUS"'
      ', :"DT_EXP"'
      ', :"CD_EDI"'
      ', :"CD_USU_INCLUSAO"'
      ', :"DT_INCLUSAO"'
      ', :"CD_USU_ALTERACAO"'
      ', :"DT_ALTERACAO"'
      ', :"CD_REGISTRO_GERAL"'
      ')')
    SelectSQL.Strings = (
      'select "REGISTRO_PTV_ARE"."CD_REGISTRO_PTV"'
      '      ,"REGISTRO_PTV_ARE"."CD_UND"'
      '      ,"REGISTRO_PTV_ARE"."DT_REGISTRO"'
      '      ,"REGISTRO_PTV_ARE"."CD_UNIDADE"'
      '      ,"REGISTRO_PTV_ARE"."CD_PROVINCIA"'
      '      ,"REGISTRO_PTV_ARE"."CD_MUNICIPIO"'
      '      ,"REGISTRO_PTV_ARE"."VL_MESANO"'
      '      ,"REGISTRO_PTV_ARE"."VL_ADMITIDAS_PTV"'
      '      ,"REGISTRO_PTV_ARE"."VL_ADMITIDAS_PARTO"'
      '      ,"REGISTRO_PTV_ARE"."VL_ADMITIDAS_POS_PARTO"'
      '      ,"REGISTRO_PTV_ARE"."VL_TERAPIA_COMPLETA"'
      '      ,"REGISTRO_PTV_ARE"."VL_TERAPIA_OUTRO"'
      '      ,"REGISTRO_PTV_ARE"."VL_TERAPIA_NENHUM"'
      '      ,"REGISTRO_PTV_ARE"."VL_TOTAL_CRIANCA"'
      '      ,"REGISTRO_PTV_ARE"."FL_ACEITAR"'
      '      ,"REGISTRO_PTV_ARE"."FL_STATUS"'
      '      ,"REGISTRO_PTV_ARE"."DT_EXP"'
      '      ,"REGISTRO_PTV_ARE"."CD_EDI"'
      '      ,"REGISTRO_PTV_ARE"."CD_USU_INCLUSAO"'
      '      ,"REGISTRO_PTV_ARE"."DT_INCLUSAO"'
      '      ,"REGISTRO_PTV_ARE"."CD_USU_ALTERACAO"'
      '      ,"REGISTRO_PTV_ARE"."DT_ALTERACAO"'
      '      ,"REGISTRO_PTV_ARE"."CD_REGISTRO_GERAL"'
      'from "REGISTRO_PTV_ARE"')
    ModifySQL.Strings = (
      'update "REGISTRO_PTV_ARE"'
      'set'
      ' "CD_REGISTRO_PTV" = :"CD_REGISTRO_PTV"'
      ', "CD_UND" = :"CD_UND"'
      ', "DT_REGISTRO" = :"DT_REGISTRO"'
      ', "CD_UNIDADE" = :"CD_UNIDADE"'
      ', "CD_PROVINCIA" = :"CD_PROVINCIA"'
      ', "CD_MUNICIPIO" = :"CD_MUNICIPIO"'
      ', "VL_MESANO" = :"VL_MESANO"'
      ', "VL_ADMITIDAS_PTV" = :"VL_ADMITIDAS_PTV"'
      ', "VL_ADMITIDAS_PARTO" = :"VL_ADMITIDAS_PARTO"'
      ', "VL_ADMITIDAS_POS_PARTO" = :"VL_ADMITIDAS_POS_PARTO"'
      ', "VL_TERAPIA_COMPLETA" = :"VL_TERAPIA_COMPLETA"'
      ', "VL_TERAPIA_OUTRO" = :"VL_TERAPIA_OUTRO"'
      ', "VL_TERAPIA_NENHUM" = :"VL_TERAPIA_NENHUM"'
      ', "VL_TOTAL_CRIANCA" = :"VL_TOTAL_CRIANCA"'
      ', "FL_ACEITAR" = :"FL_ACEITAR"'
      ', "FL_STATUS" = :"FL_STATUS"'
      ', "DT_EXP" = :"DT_EXP"'
      ', "CD_EDI" = :"CD_EDI"'
      ', "CD_USU_INCLUSAO" = :"CD_USU_INCLUSAO"'
      ', "DT_INCLUSAO" = :"DT_INCLUSAO"'
      ', "CD_USU_ALTERACAO" = :"CD_USU_ALTERACAO"'
      ', "DT_ALTERACAO" = :"DT_ALTERACAO"'
      ', "CD_REGISTRO_GERAL" = :"CD_REGISTRO_GERAL"'
      'where'
      '  "CD_REGISTRO_PTV" = :"OLD_CD_REGISTRO_PTV" and '
      '  "CD_UND" = :"OLD_CD_UND"')
    GeneratorField.Field = 'CD_REGISTRO_PTV'
    GeneratorField.Generator = 'GEN_REGISTRO_PTV_ARE'
    Left = 152
    Top = 72
    object TB_PTV_ARECD_REGISTRO_PTV: TIntegerField
      FieldName = 'CD_REGISTRO_PTV'
      Origin = 'REGISTRO_PTV_ARE.CD_REGISTRO_PTV'
      Required = True
    end
    object TB_PTV_ARECD_UND: TIntegerField
      FieldName = 'CD_UND'
      Origin = 'REGISTRO_PTV_ARE.CD_UND'
      Required = True
    end
    object TB_PTV_AREDT_REGISTRO: TDateTimeField
      FieldName = 'DT_REGISTRO'
      Origin = 'REGISTRO_PTV_ARE.DT_REGISTRO'
    end
    object TB_PTV_ARECD_UNIDADE: TIntegerField
      FieldName = 'CD_UNIDADE'
      Origin = 'REGISTRO_PTV_ARE.CD_UNIDADE'
      Required = True
    end
    object TB_PTV_ARECD_PROVINCIA: TIntegerField
      FieldName = 'CD_PROVINCIA'
      Origin = 'REGISTRO_PTV_ARE.CD_PROVINCIA'
      Required = True
    end
    object TB_PTV_ARECD_MUNICIPIO: TIntegerField
      FieldName = 'CD_MUNICIPIO'
      Origin = 'REGISTRO_PTV_ARE.CD_MUNICIPIO'
      Required = True
    end
    object TB_PTV_AREVL_MESANO: TIBStringField
      FieldName = 'VL_MESANO'
      Origin = 'REGISTRO_PTV_ARE.VL_MESANO'
      Required = True
      Size = 8
    end
    object TB_PTV_AREVL_ADMITIDAS_PTV: TIntegerField
      FieldName = 'VL_ADMITIDAS_PTV'
      Origin = 'REGISTRO_PTV_ARE.VL_ADMITIDAS_PTV'
    end
    object TB_PTV_AREVL_ADMITIDAS_PARTO: TIntegerField
      FieldName = 'VL_ADMITIDAS_PARTO'
      Origin = 'REGISTRO_PTV_ARE.VL_ADMITIDAS_PARTO'
    end
    object TB_PTV_AREVL_ADMITIDAS_POS_PARTO: TIntegerField
      FieldName = 'VL_ADMITIDAS_POS_PARTO'
      Origin = 'REGISTRO_PTV_ARE.VL_ADMITIDAS_POS_PARTO'
    end
    object TB_PTV_AREVL_TERAPIA_COMPLETA: TIntegerField
      FieldName = 'VL_TERAPIA_COMPLETA'
      Origin = 'REGISTRO_PTV_ARE.VL_TERAPIA_COMPLETA'
    end
    object TB_PTV_AREVL_TERAPIA_OUTRO: TIntegerField
      FieldName = 'VL_TERAPIA_OUTRO'
      Origin = 'REGISTRO_PTV_ARE.VL_TERAPIA_OUTRO'
    end
    object TB_PTV_AREVL_TERAPIA_NENHUM: TIntegerField
      FieldName = 'VL_TERAPIA_NENHUM'
      Origin = 'REGISTRO_PTV_ARE.VL_TERAPIA_NENHUM'
    end
    object TB_PTV_AREVL_TOTAL_CRIANCA: TIntegerField
      FieldName = 'VL_TOTAL_CRIANCA'
      Origin = 'REGISTRO_PTV_ARE.VL_TOTAL_CRIANCA'
    end
    object TB_PTV_AREFL_ACEITAR: TIntegerField
      FieldName = 'FL_ACEITAR'
      Origin = 'REGISTRO_PTV_ARE.FL_ACEITAR'
    end
    object TB_PTV_AREFL_STATUS: TIBStringField
      FieldName = 'FL_STATUS'
      Origin = 'REGISTRO_PTV_ARE.FL_STATUS'
      FixedChar = True
      Size = 1
    end
    object TB_PTV_AREDT_EXP: TDateTimeField
      FieldName = 'DT_EXP'
      Origin = 'REGISTRO_PTV_ARE.DT_EXP'
    end
    object TB_PTV_ARECD_EDI: TIntegerField
      FieldName = 'CD_EDI'
      Origin = 'REGISTRO_PTV_ARE.CD_EDI'
    end
    object TB_PTV_ARECD_USU_INCLUSAO: TIntegerField
      FieldName = 'CD_USU_INCLUSAO'
      Origin = 'REGISTRO_PTV_ARE.CD_USU_INCLUSAO'
    end
    object TB_PTV_AREDT_INCLUSAO: TDateTimeField
      FieldName = 'DT_INCLUSAO'
      Origin = 'REGISTRO_PTV_ARE.DT_INCLUSAO'
    end
    object TB_PTV_ARECD_USU_ALTERACAO: TIntegerField
      FieldName = 'CD_USU_ALTERACAO'
      Origin = 'REGISTRO_PTV_ARE.CD_USU_ALTERACAO'
    end
    object TB_PTV_AREDT_ALTERACAO: TDateTimeField
      FieldName = 'DT_ALTERACAO'
      Origin = 'REGISTRO_PTV_ARE.DT_ALTERACAO'
    end
    object TB_PTV_ARECD_REGISTRO_GERAL: TIntegerField
      FieldName = 'CD_REGISTRO_GERAL'
      Origin = 'REGISTRO_PTV_ARE.CD_REGISTRO_GERAL'
    end
  end
  object TB_TARV_ARE: TIBDataSet
    Database = DM.DB
    Transaction = DM.TS
    AfterInsert = TB_TARV_AREAfterInsert
    AfterPost = TB_ATV_AREAfterPost
    BufferChunks = 1000
    CachedUpdates = False
    DeleteSQL.Strings = (
      'delete from "REGISTRO_TARV_ARE"'
      'where'
      '  "CD_REGISTRO_TARV" = :"OLD_CD_REGISTRO_TARV" and '
      '  "CD_UND" = :"OLD_CD_UND"')
    InsertSQL.Strings = (
      'insert into "REGISTRO_TARV_ARE"'
      '('
      '  "CD_REGISTRO_TARV"'
      ', "CD_UND"'
      ', "DT_REGISTRO"'
      ', "CD_UNIDADE"'
      ', "CD_PROVINCIA"'
      ', "CD_MUNICIPIO"'
      ', "VL_MESANO"'
      ', "VL_ACUMULADOS"'
      ', "VL_NOVOS"'
      ', "VL_TRANSFERIDOS"'
      ', "VL_ABANDONOS"'
      ', "VL_TRANSFERIDOS_PARA"'
      ', "VL_OBITOS"'
      ', "FL_ACEITAR"'
      ', "FL_STATUS"'
      ', "DT_EXP"'
      ', "CD_EDI"'
      ', "CD_USU_INCLUSAO"'
      ', "DT_INCLUSAO"'
      ', "CD_USU_ALTERACAO"'
      ', "DT_ALTERACAO"'
      ', "CD_REGISTRO_GERAL"'
      ')'
      'values'
      '('
      '  :"CD_REGISTRO_TARV"'
      ', :"CD_UND"'
      ', :"DT_REGISTRO"'
      ', :"CD_UNIDADE"'
      ', :"CD_PROVINCIA"'
      ', :"CD_MUNICIPIO"'
      ', :"VL_MESANO"'
      ', :"VL_ACUMULADOS"'
      ', :"VL_NOVOS"'
      ', :"VL_TRANSFERIDOS"'
      ', :"VL_ABANDONOS"'
      ', :"VL_TRANSFERIDOS_PARA"'
      ', :"VL_OBITOS"'
      ', :"FL_ACEITAR"'
      ', :"FL_STATUS"'
      ', :"DT_EXP"'
      ', :"CD_EDI"'
      ', :"CD_USU_INCLUSAO"'
      ', :"DT_INCLUSAO"'
      ', :"CD_USU_ALTERACAO"'
      ', :"DT_ALTERACAO"'
      ', :"CD_REGISTRO_GERAL"'
      ')')
    SelectSQL.Strings = (
      'select "REGISTRO_TARV_ARE"."CD_REGISTRO_TARV"'
      '      ,"REGISTRO_TARV_ARE"."CD_UND"'
      '      ,"REGISTRO_TARV_ARE"."DT_REGISTRO"'
      '      ,"REGISTRO_TARV_ARE"."CD_UNIDADE"'
      '      ,"REGISTRO_TARV_ARE"."CD_PROVINCIA"'
      '      ,"REGISTRO_TARV_ARE"."CD_MUNICIPIO"'
      '      ,"REGISTRO_TARV_ARE"."VL_MESANO"'
      '      ,"REGISTRO_TARV_ARE"."VL_ACUMULADOS"'
      '      ,"REGISTRO_TARV_ARE"."VL_NOVOS"'
      '      ,"REGISTRO_TARV_ARE"."VL_TRANSFERIDOS"'
      '      ,"REGISTRO_TARV_ARE"."VL_ABANDONOS"'
      '      ,"REGISTRO_TARV_ARE"."VL_TRANSFERIDOS_PARA"'
      '      ,"REGISTRO_TARV_ARE"."VL_OBITOS"'
      '      ,"REGISTRO_TARV_ARE"."FL_ACEITAR"'
      '      ,"REGISTRO_TARV_ARE"."FL_STATUS"'
      '      ,"REGISTRO_TARV_ARE"."DT_EXP"'
      '      ,"REGISTRO_TARV_ARE"."CD_EDI"'
      '      ,"REGISTRO_TARV_ARE"."CD_USU_INCLUSAO"'
      '      ,"REGISTRO_TARV_ARE"."DT_INCLUSAO"'
      '      ,"REGISTRO_TARV_ARE"."CD_USU_ALTERACAO"'
      '      ,"REGISTRO_TARV_ARE"."DT_ALTERACAO"'
      '      ,"REGISTRO_TARV_ARE"."CD_REGISTRO_GERAL"'
      'from "REGISTRO_TARV_ARE"')
    ModifySQL.Strings = (
      'update "REGISTRO_TARV_ARE"'
      'set'
      ' "CD_REGISTRO_TARV" = :"CD_REGISTRO_TARV"'
      ', "CD_UND" = :"CD_UND"'
      ', "DT_REGISTRO" = :"DT_REGISTRO"'
      ', "CD_UNIDADE" = :"CD_UNIDADE"'
      ', "CD_PROVINCIA" = :"CD_PROVINCIA"'
      ', "CD_MUNICIPIO" = :"CD_MUNICIPIO"'
      ', "VL_MESANO" = :"VL_MESANO"'
      ', "VL_ACUMULADOS" = :"VL_ACUMULADOS"'
      ', "VL_NOVOS" = :"VL_NOVOS"'
      ', "VL_TRANSFERIDOS" = :"VL_TRANSFERIDOS"'
      ', "VL_ABANDONOS" = :"VL_ABANDONOS"'
      ', "VL_TRANSFERIDOS_PARA" = :"VL_TRANSFERIDOS_PARA"'
      ', "VL_OBITOS" = :"VL_OBITOS"'
      ', "FL_ACEITAR" = :"FL_ACEITAR"'
      ', "FL_STATUS" = :"FL_STATUS"'
      ', "DT_EXP" = :"DT_EXP"'
      ', "CD_EDI" = :"CD_EDI"'
      ', "CD_USU_INCLUSAO" = :"CD_USU_INCLUSAO"'
      ', "DT_INCLUSAO" = :"DT_INCLUSAO"'
      ', "CD_USU_ALTERACAO" = :"CD_USU_ALTERACAO"'
      ', "DT_ALTERACAO" = :"DT_ALTERACAO"'
      ', "CD_REGISTRO_GERAL" = :"CD_REGISTRO_GERAL"'
      'where'
      '  "CD_REGISTRO_TARV" = :"OLD_CD_REGISTRO_TARV" and '
      '  "CD_UND" = :"OLD_CD_UND"')
    GeneratorField.Field = 'CD_REGISTRO_TARV'
    GeneratorField.Generator = 'GEN_REGISTRO_TARV_ARE'
    Left = 240
    Top = 72
    object TB_TARV_ARECD_REGISTRO_TARV: TIntegerField
      FieldName = 'CD_REGISTRO_TARV'
      Origin = 'REGISTRO_TARV_ARE.CD_REGISTRO_TARV'
      Required = True
    end
    object TB_TARV_ARECD_UND: TIntegerField
      FieldName = 'CD_UND'
      Origin = 'REGISTRO_TARV_ARE.CD_UND'
      Required = True
    end
    object TB_TARV_AREDT_REGISTRO: TDateTimeField
      FieldName = 'DT_REGISTRO'
      Origin = 'REGISTRO_TARV_ARE.DT_REGISTRO'
      Required = True
    end
    object TB_TARV_ARECD_UNIDADE: TIntegerField
      FieldName = 'CD_UNIDADE'
      Origin = 'REGISTRO_TARV_ARE.CD_UNIDADE'
      Required = True
    end
    object TB_TARV_ARECD_PROVINCIA: TIntegerField
      FieldName = 'CD_PROVINCIA'
      Origin = 'REGISTRO_TARV_ARE.CD_PROVINCIA'
      Required = True
    end
    object TB_TARV_ARECD_MUNICIPIO: TIntegerField
      FieldName = 'CD_MUNICIPIO'
      Origin = 'REGISTRO_TARV_ARE.CD_MUNICIPIO'
      Required = True
    end
    object TB_TARV_AREVL_MESANO: TIBStringField
      FieldName = 'VL_MESANO'
      Origin = 'REGISTRO_TARV_ARE.VL_MESANO'
      Required = True
      Size = 8
    end
    object TB_TARV_AREVL_ACUMULADOS: TIntegerField
      FieldName = 'VL_ACUMULADOS'
      Origin = 'REGISTRO_TARV_ARE.VL_ACUMULADOS'
    end
    object TB_TARV_AREVL_NOVOS: TIntegerField
      FieldName = 'VL_NOVOS'
      Origin = 'REGISTRO_TARV_ARE.VL_NOVOS'
    end
    object TB_TARV_AREVL_TRANSFERIDOS: TIntegerField
      FieldName = 'VL_TRANSFERIDOS'
      Origin = 'REGISTRO_TARV_ARE.VL_TRANSFERIDOS'
    end
    object TB_TARV_AREVL_ABANDONOS: TIntegerField
      FieldName = 'VL_ABANDONOS'
      Origin = 'REGISTRO_TARV_ARE.VL_ABANDONOS'
    end
    object TB_TARV_AREVL_TRANSFERIDOS_PARA: TIntegerField
      FieldName = 'VL_TRANSFERIDOS_PARA'
      Origin = 'REGISTRO_TARV_ARE.VL_TRANSFERIDOS_PARA'
    end
    object TB_TARV_AREVL_OBITOS: TIntegerField
      FieldName = 'VL_OBITOS'
      Origin = 'REGISTRO_TARV_ARE.VL_OBITOS'
    end
    object TB_TARV_AREFL_ACEITAR: TIntegerField
      FieldName = 'FL_ACEITAR'
      Origin = 'REGISTRO_TARV_ARE.FL_ACEITAR'
    end
    object TB_TARV_AREFL_STATUS: TIBStringField
      FieldName = 'FL_STATUS'
      Origin = 'REGISTRO_TARV_ARE.FL_STATUS'
      FixedChar = True
      Size = 1
    end
    object TB_TARV_AREDT_EXP: TDateTimeField
      FieldName = 'DT_EXP'
      Origin = 'REGISTRO_TARV_ARE.DT_EXP'
    end
    object TB_TARV_ARECD_EDI: TIntegerField
      FieldName = 'CD_EDI'
      Origin = 'REGISTRO_TARV_ARE.CD_EDI'
    end
    object TB_TARV_ARECD_USU_INCLUSAO: TIntegerField
      FieldName = 'CD_USU_INCLUSAO'
      Origin = 'REGISTRO_TARV_ARE.CD_USU_INCLUSAO'
    end
    object TB_TARV_AREDT_INCLUSAO: TDateTimeField
      FieldName = 'DT_INCLUSAO'
      Origin = 'REGISTRO_TARV_ARE.DT_INCLUSAO'
    end
    object TB_TARV_ARECD_USU_ALTERACAO: TIntegerField
      FieldName = 'CD_USU_ALTERACAO'
      Origin = 'REGISTRO_TARV_ARE.CD_USU_ALTERACAO'
    end
    object TB_TARV_AREDT_ALTERACAO: TDateTimeField
      FieldName = 'DT_ALTERACAO'
      Origin = 'REGISTRO_TARV_ARE.DT_ALTERACAO'
    end
    object TB_TARV_ARECD_REGISTRO_GERAL: TIntegerField
      FieldName = 'CD_REGISTRO_GERAL'
      Origin = 'REGISTRO_TARV_ARE.CD_REGISTRO_GERAL'
    end
  end
  object TB_TARV_ACOMP_ARE: TIBDataSet
    Database = DM.DB
    Transaction = DM.TS
    AfterInsert = TB_TARV_ACOMP_AREAfterInsert
    AfterPost = TB_ATV_AREAfterPost
    BufferChunks = 1000
    CachedUpdates = False
    DeleteSQL.Strings = (
      'delete from "REGISTRO_TARV_ACOMP_ARE"'
      'where'
      '  "CD_REGISTRO_TARV_ACOMP" = :"OLD_CD_REGISTRO_TARV_ACOMP" and '
      '  "CD_UND" = :"OLD_CD_UND"')
    InsertSQL.Strings = (
      'insert into "REGISTRO_TARV_ACOMP_ARE"'
      '('
      '  "CD_REGISTRO_TARV_ACOMP"'
      ', "CD_UND"'
      ', "DT_REGISTRO"'
      ', "CD_UNIDADE"'
      ', "CD_PROVINCIA"'
      ', "CD_MUNICIPIO"'
      ', "VL_MESANO"'
      ', "VL_ACUMULADOS"'
      ', "VL_NOVOS"'
      ', "VL_TRANSFERIDOS"'
      ', "VL_ABANDONOS"'
      ', "VL_TRANSFERIDOS_PARA"'
      ', "VL_OBITOS"'
      ', "FL_ACEITAR"'
      ', "FL_STATUS"'
      ', "DT_EXP"'
      ', "CD_EDI"'
      ', "CD_USU_INCLUSAO"'
      ', "DT_INCLUSAO"'
      ', "CD_USU_ALTERACAO"'
      ', "DT_ALTERACAO"'
      ', "CD_REGISTRO_GERAL"'
      ')'
      'values'
      '('
      '  :"CD_REGISTRO_TARV_ACOMP"'
      ', :"CD_UND"'
      ', :"DT_REGISTRO"'
      ', :"CD_UNIDADE"'
      ', :"CD_PROVINCIA"'
      ', :"CD_MUNICIPIO"'
      ', :"VL_MESANO"'
      ', :"VL_ACUMULADOS"'
      ', :"VL_NOVOS"'
      ', :"VL_TRANSFERIDOS"'
      ', :"VL_ABANDONOS"'
      ', :"VL_TRANSFERIDOS_PARA"'
      ', :"VL_OBITOS"'
      ', :"FL_ACEITAR"'
      ', :"FL_STATUS"'
      ', :"DT_EXP"'
      ', :"CD_EDI"'
      ', :"CD_USU_INCLUSAO"'
      ', :"DT_INCLUSAO"'
      ', :"CD_USU_ALTERACAO"'
      ', :"DT_ALTERACAO"'
      ', :"CD_REGISTRO_GERAL"'
      ')')
    SelectSQL.Strings = (
      'select "REGISTRO_TARV_ACOMP_ARE"."CD_REGISTRO_TARV_ACOMP"'
      '      ,"REGISTRO_TARV_ACOMP_ARE"."CD_UND"'
      '      ,"REGISTRO_TARV_ACOMP_ARE"."DT_REGISTRO"'
      '      ,"REGISTRO_TARV_ACOMP_ARE"."CD_UNIDADE"'
      '      ,"REGISTRO_TARV_ACOMP_ARE"."CD_PROVINCIA"'
      '      ,"REGISTRO_TARV_ACOMP_ARE"."CD_MUNICIPIO"'
      '      ,"REGISTRO_TARV_ACOMP_ARE"."VL_MESANO"'
      '      ,"REGISTRO_TARV_ACOMP_ARE"."VL_ACUMULADOS"'
      '      ,"REGISTRO_TARV_ACOMP_ARE"."VL_NOVOS"'
      '      ,"REGISTRO_TARV_ACOMP_ARE"."VL_TRANSFERIDOS"'
      '      ,"REGISTRO_TARV_ACOMP_ARE"."VL_ABANDONOS"'
      '      ,"REGISTRO_TARV_ACOMP_ARE"."VL_TRANSFERIDOS_PARA"'
      '      ,"REGISTRO_TARV_ACOMP_ARE"."VL_OBITOS"'
      '      ,"REGISTRO_TARV_ACOMP_ARE"."FL_ACEITAR"'
      '      ,"REGISTRO_TARV_ACOMP_ARE"."FL_STATUS"'
      '      ,"REGISTRO_TARV_ACOMP_ARE"."DT_EXP"'
      '      ,"REGISTRO_TARV_ACOMP_ARE"."CD_EDI"'
      '      ,"REGISTRO_TARV_ACOMP_ARE"."CD_USU_INCLUSAO"'
      '      ,"REGISTRO_TARV_ACOMP_ARE"."DT_INCLUSAO"'
      '      ,"REGISTRO_TARV_ACOMP_ARE"."CD_USU_ALTERACAO"'
      '      ,"REGISTRO_TARV_ACOMP_ARE"."DT_ALTERACAO"'
      '      ,"REGISTRO_TARV_ACOMP_ARE"."CD_REGISTRO_GERAL"'
      'from "REGISTRO_TARV_ACOMP_ARE"')
    ModifySQL.Strings = (
      'update "REGISTRO_TARV_ACOMP_ARE"'
      'set'
      ' "CD_REGISTRO_TARV_ACOMP" = :"CD_REGISTRO_TARV_ACOMP"'
      ', "CD_UND" = :"CD_UND"'
      ', "DT_REGISTRO" = :"DT_REGISTRO"'
      ', "CD_UNIDADE" = :"CD_UNIDADE"'
      ', "CD_PROVINCIA" = :"CD_PROVINCIA"'
      ', "CD_MUNICIPIO" = :"CD_MUNICIPIO"'
      ', "VL_MESANO" = :"VL_MESANO"'
      ', "VL_ACUMULADOS" = :"VL_ACUMULADOS"'
      ', "VL_NOVOS" = :"VL_NOVOS"'
      ', "VL_TRANSFERIDOS" = :"VL_TRANSFERIDOS"'
      ', "VL_ABANDONOS" = :"VL_ABANDONOS"'
      ', "VL_TRANSFERIDOS_PARA" = :"VL_TRANSFERIDOS_PARA"'
      ', "VL_OBITOS" = :"VL_OBITOS"'
      ', "FL_ACEITAR" = :"FL_ACEITAR"'
      ', "FL_STATUS" = :"FL_STATUS"'
      ', "DT_EXP" = :"DT_EXP"'
      ', "CD_EDI" = :"CD_EDI"'
      ', "CD_USU_INCLUSAO" = :"CD_USU_INCLUSAO"'
      ', "DT_INCLUSAO" = :"DT_INCLUSAO"'
      ', "CD_USU_ALTERACAO" = :"CD_USU_ALTERACAO"'
      ', "DT_ALTERACAO" = :"DT_ALTERACAO"'
      ', "CD_REGISTRO_GERAL" = :"CD_REGISTRO_GERAL"'
      'where'
      '  "CD_REGISTRO_TARV_ACOMP" = :"OLD_CD_REGISTRO_TARV_ACOMP" and '
      '  "CD_UND" = :"OLD_CD_UND"')
    GeneratorField.Field = 'CD_REGISTRO_TARV_ACOMP'
    GeneratorField.Generator = 'GEN_REGISTRO_TARV_ACOMP_ARE'
    Left = 360
    Top = 72
    object TB_TARV_ACOMP_ARECD_REGISTRO_TARV_ACOMP: TIntegerField
      FieldName = 'CD_REGISTRO_TARV_ACOMP'
      Origin = 'REGISTRO_TARV_ACOMP_ARE.CD_REGISTRO_TARV_ACOMP'
      Required = True
    end
    object TB_TARV_ACOMP_ARECD_UND: TIntegerField
      FieldName = 'CD_UND'
      Origin = 'REGISTRO_TARV_ACOMP_ARE.CD_UND'
      Required = True
    end
    object TB_TARV_ACOMP_AREDT_REGISTRO: TDateTimeField
      FieldName = 'DT_REGISTRO'
      Origin = 'REGISTRO_TARV_ACOMP_ARE.DT_REGISTRO'
      Required = True
    end
    object TB_TARV_ACOMP_ARECD_UNIDADE: TIntegerField
      FieldName = 'CD_UNIDADE'
      Origin = 'REGISTRO_TARV_ACOMP_ARE.CD_UNIDADE'
      Required = True
    end
    object TB_TARV_ACOMP_ARECD_PROVINCIA: TIntegerField
      FieldName = 'CD_PROVINCIA'
      Origin = 'REGISTRO_TARV_ACOMP_ARE.CD_PROVINCIA'
      Required = True
    end
    object TB_TARV_ACOMP_ARECD_MUNICIPIO: TIntegerField
      FieldName = 'CD_MUNICIPIO'
      Origin = 'REGISTRO_TARV_ACOMP_ARE.CD_MUNICIPIO'
      Required = True
    end
    object TB_TARV_ACOMP_AREVL_MESANO: TIBStringField
      FieldName = 'VL_MESANO'
      Origin = 'REGISTRO_TARV_ACOMP_ARE.VL_MESANO'
      Required = True
      Size = 8
    end
    object TB_TARV_ACOMP_AREVL_ACUMULADOS: TIntegerField
      FieldName = 'VL_ACUMULADOS'
      Origin = 'REGISTRO_TARV_ACOMP_ARE.VL_ACUMULADOS'
    end
    object TB_TARV_ACOMP_AREVL_NOVOS: TIntegerField
      FieldName = 'VL_NOVOS'
      Origin = 'REGISTRO_TARV_ACOMP_ARE.VL_NOVOS'
    end
    object TB_TARV_ACOMP_AREVL_TRANSFERIDOS: TIntegerField
      FieldName = 'VL_TRANSFERIDOS'
      Origin = 'REGISTRO_TARV_ACOMP_ARE.VL_TRANSFERIDOS'
    end
    object TB_TARV_ACOMP_AREVL_ABANDONOS: TIntegerField
      FieldName = 'VL_ABANDONOS'
      Origin = 'REGISTRO_TARV_ACOMP_ARE.VL_ABANDONOS'
    end
    object TB_TARV_ACOMP_AREVL_TRANSFERIDOS_PARA: TIntegerField
      FieldName = 'VL_TRANSFERIDOS_PARA'
      Origin = 'REGISTRO_TARV_ACOMP_ARE.VL_TRANSFERIDOS_PARA'
    end
    object TB_TARV_ACOMP_AREVL_OBITOS: TIntegerField
      FieldName = 'VL_OBITOS'
      Origin = 'REGISTRO_TARV_ACOMP_ARE.VL_OBITOS'
    end
    object TB_TARV_ACOMP_AREFL_ACEITAR: TIntegerField
      FieldName = 'FL_ACEITAR'
      Origin = 'REGISTRO_TARV_ACOMP_ARE.FL_ACEITAR'
    end
    object TB_TARV_ACOMP_AREFL_STATUS: TIBStringField
      FieldName = 'FL_STATUS'
      Origin = 'REGISTRO_TARV_ACOMP_ARE.FL_STATUS'
      FixedChar = True
      Size = 1
    end
    object TB_TARV_ACOMP_AREDT_EXP: TDateTimeField
      FieldName = 'DT_EXP'
      Origin = 'REGISTRO_TARV_ACOMP_ARE.DT_EXP'
    end
    object TB_TARV_ACOMP_ARECD_EDI: TIntegerField
      FieldName = 'CD_EDI'
      Origin = 'REGISTRO_TARV_ACOMP_ARE.CD_EDI'
    end
    object TB_TARV_ACOMP_ARECD_USU_INCLUSAO: TIntegerField
      FieldName = 'CD_USU_INCLUSAO'
      Origin = 'REGISTRO_TARV_ACOMP_ARE.CD_USU_INCLUSAO'
    end
    object TB_TARV_ACOMP_AREDT_INCLUSAO: TDateTimeField
      FieldName = 'DT_INCLUSAO'
      Origin = 'REGISTRO_TARV_ACOMP_ARE.DT_INCLUSAO'
    end
    object TB_TARV_ACOMP_ARECD_USU_ALTERACAO: TIntegerField
      FieldName = 'CD_USU_ALTERACAO'
      Origin = 'REGISTRO_TARV_ACOMP_ARE.CD_USU_ALTERACAO'
    end
    object TB_TARV_ACOMP_AREDT_ALTERACAO: TDateTimeField
      FieldName = 'DT_ALTERACAO'
      Origin = 'REGISTRO_TARV_ACOMP_ARE.DT_ALTERACAO'
    end
    object TB_TARV_ACOMP_ARECD_REGISTRO_GERAL: TIntegerField
      FieldName = 'CD_REGISTRO_GERAL'
      Origin = 'REGISTRO_TARV_ACOMP_ARE.CD_REGISTRO_GERAL'
    end
  end
  object TB_TARV_ESQUEMA_ARE: TIBDataSet
    Database = DM.DB
    Transaction = DM.TS
    AfterInsert = TB_TARV_ESQUEMA_AREAfterInsert
    AfterPost = TB_ATV_AREAfterPost
    BufferChunks = 1000
    CachedUpdates = False
    DeleteSQL.Strings = (
      'delete from "REGISTRO_TARV_ESQUEMA_ARE"'
      'where'
      
        '  "CD_REGISTRO_TARV_ESQUEMA" = :"OLD_CD_REGISTRO_TARV_ESQUEMA" a' +
        'nd '
      '  "CD_UND" = :"OLD_CD_UND"')
    InsertSQL.Strings = (
      'insert into "REGISTRO_TARV_ESQUEMA_ARE"'
      '('
      '  "CD_REGISTRO_TARV_ESQUEMA"'
      ', "CD_UND"'
      ', "DT_REGISTRO"'
      ', "CD_UNIDADE"'
      ', "CD_PROVINCIA"'
      ', "CD_MUNICIPIO"'
      ', "VL_MESANO"'
      ', "VL_ANTERIOR_CRIANCA"'
      ', "VL_ANTERIOR_ADULTO"'
      ', "VL_CORRENTE_CRIANCA"'
      ', "VL_CORRENTE_ADULTO"'
      ', "FL_ACEITAR"'
      ', "FL_STATUS"'
      ', "DT_EXP"'
      ', "CD_EDI"'
      ', "CD_USU_INCLUSAO"'
      ', "DT_INCLUSAO"'
      ', "CD_USU_ALTERACAO"'
      ', "DT_ALTERACAO"'
      ', "CD_REGISTRO_GERAL"'
      ')'
      'values'
      '('
      '  :"CD_REGISTRO_TARV_ESQUEMA"'
      ', :"CD_UND"'
      ', :"DT_REGISTRO"'
      ', :"CD_UNIDADE"'
      ', :"CD_PROVINCIA"'
      ', :"CD_MUNICIPIO"'
      ', :"VL_MESANO"'
      ', :"VL_ANTERIOR_CRIANCA"'
      ', :"VL_ANTERIOR_ADULTO"'
      ', :"VL_CORRENTE_CRIANCA"'
      ', :"VL_CORRENTE_ADULTO"'
      ', :"FL_ACEITAR"'
      ', :"FL_STATUS"'
      ', :"DT_EXP"'
      ', :"CD_EDI"'
      ', :"CD_USU_INCLUSAO"'
      ', :"DT_INCLUSAO"'
      ', :"CD_USU_ALTERACAO"'
      ', :"DT_ALTERACAO"'
      ', :"CD_REGISTRO_GERAL"'
      ')')
    SelectSQL.Strings = (
      'select "REGISTRO_TARV_ESQUEMA_ARE"."CD_REGISTRO_TARV_ESQUEMA"'
      '      ,"REGISTRO_TARV_ESQUEMA_ARE"."CD_UND"'
      '      ,"REGISTRO_TARV_ESQUEMA_ARE"."DT_REGISTRO"'
      '      ,"REGISTRO_TARV_ESQUEMA_ARE"."CD_UNIDADE"'
      '      ,"REGISTRO_TARV_ESQUEMA_ARE"."CD_PROVINCIA"'
      '      ,"REGISTRO_TARV_ESQUEMA_ARE"."CD_MUNICIPIO"'
      '      ,"REGISTRO_TARV_ESQUEMA_ARE"."VL_MESANO"'
      '      ,"REGISTRO_TARV_ESQUEMA_ARE"."VL_ANTERIOR_CRIANCA"'
      '      ,"REGISTRO_TARV_ESQUEMA_ARE"."VL_ANTERIOR_ADULTO"'
      '      ,"REGISTRO_TARV_ESQUEMA_ARE"."VL_CORRENTE_CRIANCA"'
      '      ,"REGISTRO_TARV_ESQUEMA_ARE"."VL_CORRENTE_ADULTO"'
      '      ,"REGISTRO_TARV_ESQUEMA_ARE"."FL_ACEITAR"'
      '      ,"REGISTRO_TARV_ESQUEMA_ARE"."FL_STATUS"'
      '      ,"REGISTRO_TARV_ESQUEMA_ARE"."DT_EXP"'
      '      ,"REGISTRO_TARV_ESQUEMA_ARE"."CD_EDI"'
      '      ,"REGISTRO_TARV_ESQUEMA_ARE"."CD_USU_INCLUSAO"'
      '      ,"REGISTRO_TARV_ESQUEMA_ARE"."DT_INCLUSAO"'
      '      ,"REGISTRO_TARV_ESQUEMA_ARE"."CD_USU_ALTERACAO"'
      '      ,"REGISTRO_TARV_ESQUEMA_ARE"."DT_ALTERACAO"'
      '      ,"REGISTRO_TARV_ESQUEMA_ARE"."CD_REGISTRO_GERAL"'
      'from "REGISTRO_TARV_ESQUEMA_ARE"')
    ModifySQL.Strings = (
      'update "REGISTRO_TARV_ESQUEMA_ARE"'
      'set'
      ' "CD_REGISTRO_TARV_ESQUEMA" = :"CD_REGISTRO_TARV_ESQUEMA"'
      ', "CD_UND" = :"CD_UND"'
      ', "DT_REGISTRO" = :"DT_REGISTRO"'
      ', "CD_UNIDADE" = :"CD_UNIDADE"'
      ', "CD_PROVINCIA" = :"CD_PROVINCIA"'
      ', "CD_MUNICIPIO" = :"CD_MUNICIPIO"'
      ', "VL_MESANO" = :"VL_MESANO"'
      ', "VL_ANTERIOR_CRIANCA" = :"VL_ANTERIOR_CRIANCA"'
      ', "VL_ANTERIOR_ADULTO" = :"VL_ANTERIOR_ADULTO"'
      ', "VL_CORRENTE_CRIANCA" = :"VL_CORRENTE_CRIANCA"'
      ', "VL_CORRENTE_ADULTO" = :"VL_CORRENTE_ADULTO"'
      ', "FL_ACEITAR" = :"FL_ACEITAR"'
      ', "FL_STATUS" = :"FL_STATUS"'
      ', "DT_EXP" = :"DT_EXP"'
      ', "CD_EDI" = :"CD_EDI"'
      ', "CD_USU_INCLUSAO" = :"CD_USU_INCLUSAO"'
      ', "DT_INCLUSAO" = :"DT_INCLUSAO"'
      ', "CD_USU_ALTERACAO" = :"CD_USU_ALTERACAO"'
      ', "DT_ALTERACAO" = :"DT_ALTERACAO"'
      ', "CD_REGISTRO_GERAL" = :"CD_REGISTRO_GERAL"'
      'where'
      
        '  "CD_REGISTRO_TARV_ESQUEMA" = :"OLD_CD_REGISTRO_TARV_ESQUEMA" a' +
        'nd '
      '  "CD_UND" = :"OLD_CD_UND"')
    GeneratorField.Field = 'CD_REGISTRO_TARV_ESQUEMA'
    GeneratorField.Generator = 'GEN_REGISTRO_TARV_ESQUEMA_ARE'
    Left = 496
    Top = 72
    object TB_TARV_ESQUEMA_ARECD_REGISTRO_TARV_ESQUEMA: TIntegerField
      FieldName = 'CD_REGISTRO_TARV_ESQUEMA'
      Origin = 'REGISTRO_TARV_ESQUEMA_ARE.CD_REGISTRO_TARV_ESQUEMA'
      Required = True
    end
    object TB_TARV_ESQUEMA_ARECD_UND: TIntegerField
      FieldName = 'CD_UND'
      Origin = 'REGISTRO_TARV_ESQUEMA_ARE.CD_UND'
      Required = True
    end
    object TB_TARV_ESQUEMA_AREDT_REGISTRO: TDateTimeField
      FieldName = 'DT_REGISTRO'
      Origin = 'REGISTRO_TARV_ESQUEMA_ARE.DT_REGISTRO'
      Required = True
    end
    object TB_TARV_ESQUEMA_ARECD_UNIDADE: TIntegerField
      FieldName = 'CD_UNIDADE'
      Origin = 'REGISTRO_TARV_ESQUEMA_ARE.CD_UNIDADE'
      Required = True
    end
    object TB_TARV_ESQUEMA_ARECD_PROVINCIA: TIntegerField
      FieldName = 'CD_PROVINCIA'
      Origin = 'REGISTRO_TARV_ESQUEMA_ARE.CD_PROVINCIA'
      Required = True
    end
    object TB_TARV_ESQUEMA_ARECD_MUNICIPIO: TIntegerField
      FieldName = 'CD_MUNICIPIO'
      Origin = 'REGISTRO_TARV_ESQUEMA_ARE.CD_MUNICIPIO'
      Required = True
    end
    object TB_TARV_ESQUEMA_AREVL_MESANO: TIBStringField
      FieldName = 'VL_MESANO'
      Origin = 'REGISTRO_TARV_ESQUEMA_ARE.VL_MESANO'
      Required = True
      Size = 8
    end
    object TB_TARV_ESQUEMA_AREVL_ANTERIOR_CRIANCA: TIntegerField
      FieldName = 'VL_ANTERIOR_CRIANCA'
      Origin = 'REGISTRO_TARV_ESQUEMA_ARE.VL_ANTERIOR_CRIANCA'
    end
    object TB_TARV_ESQUEMA_AREVL_ANTERIOR_ADULTO: TIntegerField
      FieldName = 'VL_ANTERIOR_ADULTO'
      Origin = 'REGISTRO_TARV_ESQUEMA_ARE.VL_ANTERIOR_ADULTO'
    end
    object TB_TARV_ESQUEMA_AREVL_CORRENTE_CRIANCA: TIntegerField
      FieldName = 'VL_CORRENTE_CRIANCA'
      Origin = 'REGISTRO_TARV_ESQUEMA_ARE.VL_CORRENTE_CRIANCA'
    end
    object TB_TARV_ESQUEMA_AREVL_CORRENTE_ADULTO: TIntegerField
      FieldName = 'VL_CORRENTE_ADULTO'
      Origin = 'REGISTRO_TARV_ESQUEMA_ARE.VL_CORRENTE_ADULTO'
    end
    object TB_TARV_ESQUEMA_AREFL_ACEITAR: TIntegerField
      FieldName = 'FL_ACEITAR'
      Origin = 'REGISTRO_TARV_ESQUEMA_ARE.FL_ACEITAR'
    end
    object TB_TARV_ESQUEMA_AREFL_STATUS: TIBStringField
      FieldName = 'FL_STATUS'
      Origin = 'REGISTRO_TARV_ESQUEMA_ARE.FL_STATUS'
      FixedChar = True
      Size = 1
    end
    object TB_TARV_ESQUEMA_AREDT_EXP: TDateTimeField
      FieldName = 'DT_EXP'
      Origin = 'REGISTRO_TARV_ESQUEMA_ARE.DT_EXP'
    end
    object TB_TARV_ESQUEMA_ARECD_EDI: TIntegerField
      FieldName = 'CD_EDI'
      Origin = 'REGISTRO_TARV_ESQUEMA_ARE.CD_EDI'
    end
    object TB_TARV_ESQUEMA_ARECD_USU_INCLUSAO: TIntegerField
      FieldName = 'CD_USU_INCLUSAO'
      Origin = 'REGISTRO_TARV_ESQUEMA_ARE.CD_USU_INCLUSAO'
    end
    object TB_TARV_ESQUEMA_AREDT_INCLUSAO: TDateTimeField
      FieldName = 'DT_INCLUSAO'
      Origin = 'REGISTRO_TARV_ESQUEMA_ARE.DT_INCLUSAO'
    end
    object TB_TARV_ESQUEMA_ARECD_USU_ALTERACAO: TIntegerField
      FieldName = 'CD_USU_ALTERACAO'
      Origin = 'REGISTRO_TARV_ESQUEMA_ARE.CD_USU_ALTERACAO'
    end
    object TB_TARV_ESQUEMA_AREDT_ALTERACAO: TDateTimeField
      FieldName = 'DT_ALTERACAO'
      Origin = 'REGISTRO_TARV_ESQUEMA_ARE.DT_ALTERACAO'
    end
    object TB_TARV_ESQUEMA_ARECD_REGISTRO_GERAL: TIntegerField
      FieldName = 'CD_REGISTRO_GERAL'
      Origin = 'REGISTRO_TARV_ESQUEMA_ARE.CD_REGISTRO_GERAL'
    end
  end
  object TB_TARV_CD4_ARE: TIBDataSet
    Database = DM.DB
    Transaction = DM.TS
    AfterInsert = TB_TARV_CD4_AREAfterInsert
    AfterPost = TB_ATV_AREAfterPost
    BufferChunks = 1000
    CachedUpdates = False
    DeleteSQL.Strings = (
      'delete from "REGISTRO_TARV_CD4_ARE"'
      'where'
      '  "CD_REGISTRO_TARV_CD4" = :"OLD_CD_REGISTRO_TARV_CD4" and '
      '  "CD_UND" = :"OLD_CD_UND"')
    InsertSQL.Strings = (
      'insert into "REGISTRO_TARV_CD4_ARE"'
      '('
      '  "CD_REGISTRO_TARV_CD4"'
      ', "CD_UND"'
      ', "DT_REGISTRO"'
      ', "CD_UNIDADE"'
      ', "CD_PROVINCIA"'
      ', "CD_MUNICIPIO"'
      ', "VL_MESANO"'
      ', "VL_CD4_MENOR_350"'
      ', "VL_CD4_MAIOR_350"'
      ', "VL_ESTADO_CLINICO_1"'
      ', "VL_ESTADO_CLINICO_2"'
      ', "VL_ESTADO_CLINICO_3"'
      ', "VL_ESTADO_CLINICO_4"'
      ', "FL_ACEITAR"'
      ', "FL_STATUS"'
      ', "DT_EXP"'
      ', "CD_EDI"'
      ', "CD_USU_INCLUSAO"'
      ', "DT_INCLUSAO"'
      ', "CD_USU_ALTERACAO"'
      ', "DT_ALTERACAO"'
      ', "CD_REGISTRO_GERAL"'
      ')'
      'values'
      '('
      '  :"CD_REGISTRO_TARV_CD4"'
      ', :"CD_UND"'
      ', :"DT_REGISTRO"'
      ', :"CD_UNIDADE"'
      ', :"CD_PROVINCIA"'
      ', :"CD_MUNICIPIO"'
      ', :"VL_MESANO"'
      ', :"VL_CD4_MENOR_350"'
      ', :"VL_CD4_MAIOR_350"'
      ', :"VL_ESTADO_CLINICO_1"'
      ', :"VL_ESTADO_CLINICO_2"'
      ', :"VL_ESTADO_CLINICO_3"'
      ', :"VL_ESTADO_CLINICO_4"'
      ', :"FL_ACEITAR"'
      ', :"FL_STATUS"'
      ', :"DT_EXP"'
      ', :"CD_EDI"'
      ', :"CD_USU_INCLUSAO"'
      ', :"DT_INCLUSAO"'
      ', :"CD_USU_ALTERACAO"'
      ', :"DT_ALTERACAO"'
      ', :"CD_REGISTRO_GERAL"'
      ')')
    SelectSQL.Strings = (
      'select "REGISTRO_TARV_CD4_ARE"."CD_REGISTRO_TARV_CD4"'
      '      ,"REGISTRO_TARV_CD4_ARE"."CD_UND"'
      '      ,"REGISTRO_TARV_CD4_ARE"."DT_REGISTRO"'
      '      ,"REGISTRO_TARV_CD4_ARE"."CD_UNIDADE"'
      '      ,"REGISTRO_TARV_CD4_ARE"."CD_PROVINCIA"'
      '      ,"REGISTRO_TARV_CD4_ARE"."CD_MUNICIPIO"'
      '      ,"REGISTRO_TARV_CD4_ARE"."VL_MESANO"'
      '      ,"REGISTRO_TARV_CD4_ARE"."VL_CD4_MENOR_350"'
      '      ,"REGISTRO_TARV_CD4_ARE"."VL_CD4_MAIOR_350"'
      '      ,"REGISTRO_TARV_CD4_ARE"."VL_ESTADO_CLINICO_1"'
      '      ,"REGISTRO_TARV_CD4_ARE"."VL_ESTADO_CLINICO_2"'
      '      ,"REGISTRO_TARV_CD4_ARE"."VL_ESTADO_CLINICO_3"'
      '      ,"REGISTRO_TARV_CD4_ARE"."VL_ESTADO_CLINICO_4"'
      '      ,"REGISTRO_TARV_CD4_ARE"."FL_ACEITAR"'
      '      ,"REGISTRO_TARV_CD4_ARE"."FL_STATUS"'
      '      ,"REGISTRO_TARV_CD4_ARE"."DT_EXP"'
      '      ,"REGISTRO_TARV_CD4_ARE"."CD_EDI"'
      '      ,"REGISTRO_TARV_CD4_ARE"."CD_USU_INCLUSAO"'
      '      ,"REGISTRO_TARV_CD4_ARE"."DT_INCLUSAO"'
      '      ,"REGISTRO_TARV_CD4_ARE"."CD_USU_ALTERACAO"'
      '      ,"REGISTRO_TARV_CD4_ARE"."DT_ALTERACAO"'
      '      ,"REGISTRO_TARV_CD4_ARE"."CD_REGISTRO_GERAL"'
      'from "REGISTRO_TARV_CD4_ARE"')
    ModifySQL.Strings = (
      'update "REGISTRO_TARV_CD4_ARE"'
      'set'
      ' "CD_REGISTRO_TARV_CD4" = :"CD_REGISTRO_TARV_CD4"'
      ', "CD_UND" = :"CD_UND"'
      ', "DT_REGISTRO" = :"DT_REGISTRO"'
      ', "CD_UNIDADE" = :"CD_UNIDADE"'
      ', "CD_PROVINCIA" = :"CD_PROVINCIA"'
      ', "CD_MUNICIPIO" = :"CD_MUNICIPIO"'
      ', "VL_MESANO" = :"VL_MESANO"'
      ', "VL_CD4_MENOR_350" = :"VL_CD4_MENOR_350"'
      ', "VL_CD4_MAIOR_350" = :"VL_CD4_MAIOR_350"'
      ', "VL_ESTADO_CLINICO_1" = :"VL_ESTADO_CLINICO_1"'
      ', "VL_ESTADO_CLINICO_2" = :"VL_ESTADO_CLINICO_2"'
      ', "VL_ESTADO_CLINICO_3" = :"VL_ESTADO_CLINICO_3"'
      ', "VL_ESTADO_CLINICO_4" = :"VL_ESTADO_CLINICO_4"'
      ', "FL_ACEITAR" = :"FL_ACEITAR"'
      ', "FL_STATUS" = :"FL_STATUS"'
      ', "DT_EXP" = :"DT_EXP"'
      ', "CD_EDI" = :"CD_EDI"'
      ', "CD_USU_INCLUSAO" = :"CD_USU_INCLUSAO"'
      ', "DT_INCLUSAO" = :"DT_INCLUSAO"'
      ', "CD_USU_ALTERACAO" = :"CD_USU_ALTERACAO"'
      ', "DT_ALTERACAO" = :"DT_ALTERACAO"'
      ', "CD_REGISTRO_GERAL" = :"CD_REGISTRO_GERAL"'
      'where'
      '  "CD_REGISTRO_TARV_CD4" = :"OLD_CD_REGISTRO_TARV_CD4" and '
      '  "CD_UND" = :"OLD_CD_UND"')
    GeneratorField.Field = 'CD_REGISTRO_TARV_CD4'
    GeneratorField.Generator = 'GEN_REGISTRO_TARV_CD4_ARE'
    Left = 624
    Top = 72
    object TB_TARV_CD4_ARECD_REGISTRO_TARV_CD4: TIntegerField
      FieldName = 'CD_REGISTRO_TARV_CD4'
      Origin = 'REGISTRO_TARV_CD4_ARE.CD_REGISTRO_TARV_CD4'
      Required = True
    end
    object TB_TARV_CD4_ARECD_UND: TIntegerField
      FieldName = 'CD_UND'
      Origin = 'REGISTRO_TARV_CD4_ARE.CD_UND'
      Required = True
    end
    object TB_TARV_CD4_AREDT_REGISTRO: TDateTimeField
      FieldName = 'DT_REGISTRO'
      Origin = 'REGISTRO_TARV_CD4_ARE.DT_REGISTRO'
      Required = True
    end
    object TB_TARV_CD4_ARECD_UNIDADE: TIntegerField
      FieldName = 'CD_UNIDADE'
      Origin = 'REGISTRO_TARV_CD4_ARE.CD_UNIDADE'
      Required = True
    end
    object TB_TARV_CD4_ARECD_PROVINCIA: TIntegerField
      FieldName = 'CD_PROVINCIA'
      Origin = 'REGISTRO_TARV_CD4_ARE.CD_PROVINCIA'
      Required = True
    end
    object TB_TARV_CD4_ARECD_MUNICIPIO: TIntegerField
      FieldName = 'CD_MUNICIPIO'
      Origin = 'REGISTRO_TARV_CD4_ARE.CD_MUNICIPIO'
      Required = True
    end
    object TB_TARV_CD4_AREVL_MESANO: TIBStringField
      FieldName = 'VL_MESANO'
      Origin = 'REGISTRO_TARV_CD4_ARE.VL_MESANO'
      Required = True
      Size = 8
    end
    object TB_TARV_CD4_AREVL_CD4_MENOR_350: TIntegerField
      FieldName = 'VL_CD4_MENOR_350'
      Origin = 'REGISTRO_TARV_CD4_ARE.VL_CD4_MENOR_350'
    end
    object TB_TARV_CD4_AREVL_CD4_MAIOR_350: TIntegerField
      FieldName = 'VL_CD4_MAIOR_350'
      Origin = 'REGISTRO_TARV_CD4_ARE.VL_CD4_MAIOR_350'
    end
    object TB_TARV_CD4_AREVL_ESTADO_CLINICO_1: TIntegerField
      FieldName = 'VL_ESTADO_CLINICO_1'
      Origin = 'REGISTRO_TARV_CD4_ARE.VL_ESTADO_CLINICO_1'
    end
    object TB_TARV_CD4_AREVL_ESTADO_CLINICO_2: TIntegerField
      FieldName = 'VL_ESTADO_CLINICO_2'
      Origin = 'REGISTRO_TARV_CD4_ARE.VL_ESTADO_CLINICO_2'
    end
    object TB_TARV_CD4_AREVL_ESTADO_CLINICO_3: TIntegerField
      FieldName = 'VL_ESTADO_CLINICO_3'
      Origin = 'REGISTRO_TARV_CD4_ARE.VL_ESTADO_CLINICO_3'
    end
    object TB_TARV_CD4_AREVL_ESTADO_CLINICO_4: TIntegerField
      FieldName = 'VL_ESTADO_CLINICO_4'
      Origin = 'REGISTRO_TARV_CD4_ARE.VL_ESTADO_CLINICO_4'
    end
    object TB_TARV_CD4_AREFL_ACEITAR: TIntegerField
      FieldName = 'FL_ACEITAR'
      Origin = 'REGISTRO_TARV_CD4_ARE.FL_ACEITAR'
    end
    object TB_TARV_CD4_AREFL_STATUS: TIBStringField
      FieldName = 'FL_STATUS'
      Origin = 'REGISTRO_TARV_CD4_ARE.FL_STATUS'
      FixedChar = True
      Size = 1
    end
    object TB_TARV_CD4_AREDT_EXP: TDateTimeField
      FieldName = 'DT_EXP'
      Origin = 'REGISTRO_TARV_CD4_ARE.DT_EXP'
    end
    object TB_TARV_CD4_ARECD_EDI: TIntegerField
      FieldName = 'CD_EDI'
      Origin = 'REGISTRO_TARV_CD4_ARE.CD_EDI'
    end
    object TB_TARV_CD4_ARECD_USU_INCLUSAO: TIntegerField
      FieldName = 'CD_USU_INCLUSAO'
      Origin = 'REGISTRO_TARV_CD4_ARE.CD_USU_INCLUSAO'
    end
    object TB_TARV_CD4_AREDT_INCLUSAO: TDateTimeField
      FieldName = 'DT_INCLUSAO'
      Origin = 'REGISTRO_TARV_CD4_ARE.DT_INCLUSAO'
    end
    object TB_TARV_CD4_ARECD_USU_ALTERACAO: TIntegerField
      FieldName = 'CD_USU_ALTERACAO'
      Origin = 'REGISTRO_TARV_CD4_ARE.CD_USU_ALTERACAO'
    end
    object TB_TARV_CD4_AREDT_ALTERACAO: TDateTimeField
      FieldName = 'DT_ALTERACAO'
      Origin = 'REGISTRO_TARV_CD4_ARE.DT_ALTERACAO'
    end
    object TB_TARV_CD4_ARECD_REGISTRO_GERAL: TIntegerField
      FieldName = 'CD_REGISTRO_GERAL'
      Origin = 'REGISTRO_TARV_CD4_ARE.CD_REGISTRO_GERAL'
    end
  end
  object TB_COINFECCAO_ARE: TIBDataSet
    Database = DM.DB
    Transaction = DM.TS
    AfterInsert = TB_COINFECCAO_AREAfterInsert
    AfterPost = TB_ATV_AREAfterPost
    BufferChunks = 1000
    CachedUpdates = False
    DeleteSQL.Strings = (
      'delete from "REGISTRO_COINFECCAO_ARE"'
      'where'
      '  "CD_REGISTRO_COINFECCAO" = :"OLD_CD_REGISTRO_COINFECCAO" and '
      '  "CD_UND" = :"OLD_CD_UND"')
    InsertSQL.Strings = (
      'insert into "REGISTRO_COINFECCAO_ARE"'
      '('
      '  "CD_REGISTRO_COINFECCAO"'
      ', "CD_UND"'
      ', "DT_REGISTRO"'
      ', "CD_UNIDADE"'
      ', "CD_PROVINCIA"'
      ', "CD_MUNICIPIO"'
      ', "VL_MESANO"'
      ', "VL_VIH_POSITIVOS"'
      ', "VL_TRATAMENTO_ARVS"'
      ', "FL_ACEITAR"'
      ', "FL_STATUS"'
      ', "DT_EXP"'
      ', "CD_EDI"'
      ', "CD_USU_INCLUSAO"'
      ', "DT_INCLUSAO"'
      ', "CD_USU_ALTERACAO"'
      ', "DT_ALTERACAO"'
      ', "CD_REGISTRO_GERAL"'
      ')'
      'values'
      '('
      '  :"CD_REGISTRO_COINFECCAO"'
      ', :"CD_UND"'
      ', :"DT_REGISTRO"'
      ', :"CD_UNIDADE"'
      ', :"CD_PROVINCIA"'
      ', :"CD_MUNICIPIO"'
      ', :"VL_MESANO"'
      ', :"VL_VIH_POSITIVOS"'
      ', :"VL_TRATAMENTO_ARVS"'
      ', :"FL_ACEITAR"'
      ', :"FL_STATUS"'
      ', :"DT_EXP"'
      ', :"CD_EDI"'
      ', :"CD_USU_INCLUSAO"'
      ', :"DT_INCLUSAO"'
      ', :"CD_USU_ALTERACAO"'
      ', :"DT_ALTERACAO"'
      ', :"CD_REGISTRO_GERAL"'
      ')')
    SelectSQL.Strings = (
      'select "REGISTRO_COINFECCAO_ARE"."CD_REGISTRO_COINFECCAO"'
      '      ,"REGISTRO_COINFECCAO_ARE"."CD_UND"'
      '      ,"REGISTRO_COINFECCAO_ARE"."DT_REGISTRO"'
      '      ,"REGISTRO_COINFECCAO_ARE"."CD_UNIDADE"'
      '      ,"REGISTRO_COINFECCAO_ARE"."CD_PROVINCIA"'
      '      ,"REGISTRO_COINFECCAO_ARE"."CD_MUNICIPIO"'
      '      ,"REGISTRO_COINFECCAO_ARE"."VL_MESANO"'
      '      ,"REGISTRO_COINFECCAO_ARE"."VL_VIH_POSITIVOS"'
      '      ,"REGISTRO_COINFECCAO_ARE"."VL_TRATAMENTO_ARVS"'
      '      ,"REGISTRO_COINFECCAO_ARE"."FL_ACEITAR"'
      '      ,"REGISTRO_COINFECCAO_ARE"."FL_STATUS"'
      '      ,"REGISTRO_COINFECCAO_ARE"."DT_EXP"'
      '      ,"REGISTRO_COINFECCAO_ARE"."CD_EDI"'
      '      ,"REGISTRO_COINFECCAO_ARE"."CD_USU_INCLUSAO"'
      '      ,"REGISTRO_COINFECCAO_ARE"."DT_INCLUSAO"'
      '      ,"REGISTRO_COINFECCAO_ARE"."CD_USU_ALTERACAO"'
      '      ,"REGISTRO_COINFECCAO_ARE"."DT_ALTERACAO"'
      '      ,"REGISTRO_COINFECCAO_ARE"."CD_REGISTRO_GERAL"'
      'from "REGISTRO_COINFECCAO_ARE"')
    ModifySQL.Strings = (
      'update "REGISTRO_COINFECCAO_ARE"'
      'set'
      ' "CD_REGISTRO_COINFECCAO" = :"CD_REGISTRO_COINFECCAO"'
      ', "CD_UND" = :"CD_UND"'
      ', "DT_REGISTRO" = :"DT_REGISTRO"'
      ', "CD_UNIDADE" = :"CD_UNIDADE"'
      ', "CD_PROVINCIA" = :"CD_PROVINCIA"'
      ', "CD_MUNICIPIO" = :"CD_MUNICIPIO"'
      ', "VL_MESANO" = :"VL_MESANO"'
      ', "VL_VIH_POSITIVOS" = :"VL_VIH_POSITIVOS"'
      ', "VL_TRATAMENTO_ARVS" = :"VL_TRATAMENTO_ARVS"'
      ', "FL_ACEITAR" = :"FL_ACEITAR"'
      ', "FL_STATUS" = :"FL_STATUS"'
      ', "DT_EXP" = :"DT_EXP"'
      ', "CD_EDI" = :"CD_EDI"'
      ', "CD_USU_INCLUSAO" = :"CD_USU_INCLUSAO"'
      ', "DT_INCLUSAO" = :"DT_INCLUSAO"'
      ', "CD_USU_ALTERACAO" = :"CD_USU_ALTERACAO"'
      ', "DT_ALTERACAO" = :"DT_ALTERACAO"'
      ', "CD_REGISTRO_GERAL" = :"CD_REGISTRO_GERAL"'
      'where'
      '  "CD_REGISTRO_COINFECCAO" = :"OLD_CD_REGISTRO_COINFECCAO" and '
      '  "CD_UND" = :"OLD_CD_UND"')
    GeneratorField.Field = 'CD_REGISTRO_COINFECCAO'
    GeneratorField.Generator = 'GEN_REGISTRO_COINFECCAO_ARE'
    Left = 736
    Top = 72
    object TB_COINFECCAO_ARECD_REGISTRO_COINFECCAO: TIntegerField
      FieldName = 'CD_REGISTRO_COINFECCAO'
      Origin = 'REGISTRO_COINFECCAO_ARE.CD_REGISTRO_COINFECCAO'
      Required = True
    end
    object TB_COINFECCAO_ARECD_UND: TIntegerField
      FieldName = 'CD_UND'
      Origin = 'REGISTRO_COINFECCAO_ARE.CD_UND'
      Required = True
    end
    object TB_COINFECCAO_AREDT_REGISTRO: TDateTimeField
      FieldName = 'DT_REGISTRO'
      Origin = 'REGISTRO_COINFECCAO_ARE.DT_REGISTRO'
      Required = True
    end
    object TB_COINFECCAO_ARECD_UNIDADE: TIntegerField
      FieldName = 'CD_UNIDADE'
      Origin = 'REGISTRO_COINFECCAO_ARE.CD_UNIDADE'
      Required = True
    end
    object TB_COINFECCAO_ARECD_PROVINCIA: TIntegerField
      FieldName = 'CD_PROVINCIA'
      Origin = 'REGISTRO_COINFECCAO_ARE.CD_PROVINCIA'
      Required = True
    end
    object TB_COINFECCAO_ARECD_MUNICIPIO: TIntegerField
      FieldName = 'CD_MUNICIPIO'
      Origin = 'REGISTRO_COINFECCAO_ARE.CD_MUNICIPIO'
      Required = True
    end
    object TB_COINFECCAO_AREVL_MESANO: TIBStringField
      FieldName = 'VL_MESANO'
      Origin = 'REGISTRO_COINFECCAO_ARE.VL_MESANO'
      Required = True
      Size = 8
    end
    object TB_COINFECCAO_AREVL_VIH_POSITIVOS: TIntegerField
      FieldName = 'VL_VIH_POSITIVOS'
      Origin = 'REGISTRO_COINFECCAO_ARE.VL_VIH_POSITIVOS'
    end
    object TB_COINFECCAO_AREVL_TRATAMENTO_ARVS: TIntegerField
      FieldName = 'VL_TRATAMENTO_ARVS'
      Origin = 'REGISTRO_COINFECCAO_ARE.VL_TRATAMENTO_ARVS'
    end
    object TB_COINFECCAO_AREFL_ACEITAR: TIntegerField
      FieldName = 'FL_ACEITAR'
      Origin = 'REGISTRO_COINFECCAO_ARE.FL_ACEITAR'
    end
    object TB_COINFECCAO_AREFL_STATUS: TIBStringField
      FieldName = 'FL_STATUS'
      Origin = 'REGISTRO_COINFECCAO_ARE.FL_STATUS'
      FixedChar = True
      Size = 1
    end
    object TB_COINFECCAO_AREDT_EXP: TDateTimeField
      FieldName = 'DT_EXP'
      Origin = 'REGISTRO_COINFECCAO_ARE.DT_EXP'
    end
    object TB_COINFECCAO_ARECD_EDI: TIntegerField
      FieldName = 'CD_EDI'
      Origin = 'REGISTRO_COINFECCAO_ARE.CD_EDI'
    end
    object TB_COINFECCAO_ARECD_USU_INCLUSAO: TIntegerField
      FieldName = 'CD_USU_INCLUSAO'
      Origin = 'REGISTRO_COINFECCAO_ARE.CD_USU_INCLUSAO'
    end
    object TB_COINFECCAO_AREDT_INCLUSAO: TDateTimeField
      FieldName = 'DT_INCLUSAO'
      Origin = 'REGISTRO_COINFECCAO_ARE.DT_INCLUSAO'
    end
    object TB_COINFECCAO_ARECD_USU_ALTERACAO: TIntegerField
      FieldName = 'CD_USU_ALTERACAO'
      Origin = 'REGISTRO_COINFECCAO_ARE.CD_USU_ALTERACAO'
    end
    object TB_COINFECCAO_AREDT_ALTERACAO: TDateTimeField
      FieldName = 'DT_ALTERACAO'
      Origin = 'REGISTRO_COINFECCAO_ARE.DT_ALTERACAO'
    end
    object TB_COINFECCAO_ARECD_REGISTRO_GERAL: TIntegerField
      FieldName = 'CD_REGISTRO_GERAL'
      Origin = 'REGISTRO_COINFECCAO_ARE.CD_REGISTRO_GERAL'
    end
  end
  object TB_PROGRAMA_ARE: TIBDataSet
    Database = DM.DB
    Transaction = DM.TS
    AfterInsert = TB_PROGRAMA_AREAfterInsert
    AfterPost = TB_ATV_AREAfterPost
    BufferChunks = 1000
    CachedUpdates = False
    DeleteSQL.Strings = (
      'delete from "REGISTRO_PROGRAMA_ARE"'
      'where'
      '  "CD_REGISTRO_PROGRAMA" = :"OLD_CD_REGISTRO_PROGRAMA" and '
      '  "CD_UND" = :"OLD_CD_UND"')
    InsertSQL.Strings = (
      'insert into "REGISTRO_PROGRAMA_ARE"'
      '('
      '  "CD_REGISTRO_PROGRAMA"'
      ', "CD_UND"'
      ', "DT_REGISTRO"'
      ', "CD_UNIDADE"'
      ', "CD_PROVINCIA"'
      ', "CD_MUNICIPIO"'
      ', "VL_MESANO"'
      ', "VL_ACONSELHADOS"'
      ', "VL_POSITIVOS"'
      ', "VL_NEGATIVOS"'
      ', "VL_INDETERMINADOS"'
      ', "VL_FEMININO_2"'
      ', "VL_MASCULINO_2"'
      ', "VL_GESTANTE_3"'
      ', "VL_POS_PARTO_3"'
      ', "VL_PARTOS_3"'
      ', "VL_FEMININO_52"'
      ', "VL_MASCULINO_52"'
      ', "FL_ACEITAR"'
      ', "FL_STATUS"'
      ', "DT_EXP"'
      ', "CD_EDI"'
      ', "CD_USU_INCLUSAO"'
      ', "DT_INCLUSAO"'
      ', "CD_USU_ALTERACAO"'
      ', "DT_ALTERACAO"'
      ', "CD_USU_EXCLUSAO"'
      ', "CD_REGISTRO_GERAL"'
      ')'
      'values'
      '('
      '  :"CD_REGISTRO_PROGRAMA"'
      ', :"CD_UND"'
      ', :"DT_REGISTRO"'
      ', :"CD_UNIDADE"'
      ', :"CD_PROVINCIA"'
      ', :"CD_MUNICIPIO"'
      ', :"VL_MESANO"'
      ', :"VL_ACONSELHADOS"'
      ', :"VL_POSITIVOS"'
      ', :"VL_NEGATIVOS"'
      ', :"VL_INDETERMINADOS"'
      ', :"VL_FEMININO_2"'
      ', :"VL_MASCULINO_2"'
      ', :"VL_GESTANTE_3"'
      ', :"VL_POS_PARTO_3"'
      ', :"VL_PARTOS_3"'
      ', :"VL_FEMININO_52"'
      ', :"VL_MASCULINO_52"'
      ', :"FL_ACEITAR"'
      ', :"FL_STATUS"'
      ', :"DT_EXP"'
      ', :"CD_EDI"'
      ', :"CD_USU_INCLUSAO"'
      ', :"DT_INCLUSAO"'
      ', :"CD_USU_ALTERACAO"'
      ', :"DT_ALTERACAO"'
      ', :"CD_USU_EXCLUSAO"'
      ', :"CD_REGISTRO_GERAL"'
      ')')
    SelectSQL.Strings = (
      'select "REGISTRO_PROGRAMA_ARE"."CD_REGISTRO_PROGRAMA"'
      '      ,"REGISTRO_PROGRAMA_ARE"."CD_UND"'
      '      ,"REGISTRO_PROGRAMA_ARE"."DT_REGISTRO"'
      '      ,"REGISTRO_PROGRAMA_ARE"."CD_UNIDADE"'
      '      ,"REGISTRO_PROGRAMA_ARE"."CD_PROVINCIA"'
      '      ,"REGISTRO_PROGRAMA_ARE"."CD_MUNICIPIO"'
      '      ,"REGISTRO_PROGRAMA_ARE"."VL_MESANO"'
      '      ,"REGISTRO_PROGRAMA_ARE"."VL_ACONSELHADOS"'
      '      ,"REGISTRO_PROGRAMA_ARE"."VL_POSITIVOS"'
      '      ,"REGISTRO_PROGRAMA_ARE"."VL_NEGATIVOS"'
      '      ,"REGISTRO_PROGRAMA_ARE"."VL_INDETERMINADOS"'
      '      ,"REGISTRO_PROGRAMA_ARE"."VL_FEMININO_2"'
      '      ,"REGISTRO_PROGRAMA_ARE"."VL_MASCULINO_2"'
      '      ,"REGISTRO_PROGRAMA_ARE"."VL_GESTANTE_3"'
      '      ,"REGISTRO_PROGRAMA_ARE"."VL_POS_PARTO_3"'
      '      ,"REGISTRO_PROGRAMA_ARE"."VL_PARTOS_3"'
      '      ,"REGISTRO_PROGRAMA_ARE"."VL_FEMININO_52"'
      '      ,"REGISTRO_PROGRAMA_ARE"."VL_MASCULINO_52"'
      '      ,"REGISTRO_PROGRAMA_ARE"."FL_ACEITAR"'
      '      ,"REGISTRO_PROGRAMA_ARE"."FL_STATUS"'
      '      ,"REGISTRO_PROGRAMA_ARE"."DT_EXP"'
      '      ,"REGISTRO_PROGRAMA_ARE"."CD_EDI"'
      '      ,"REGISTRO_PROGRAMA_ARE"."CD_USU_INCLUSAO"'
      '      ,"REGISTRO_PROGRAMA_ARE"."DT_INCLUSAO"'
      '      ,"REGISTRO_PROGRAMA_ARE"."CD_USU_ALTERACAO"'
      '      ,"REGISTRO_PROGRAMA_ARE"."DT_ALTERACAO"'
      '      ,"REGISTRO_PROGRAMA_ARE"."CD_USU_EXCLUSAO"'
      '      ,"REGISTRO_PROGRAMA_ARE"."CD_REGISTRO_GERAL"'
      'from "REGISTRO_PROGRAMA_ARE"')
    ModifySQL.Strings = (
      'update "REGISTRO_PROGRAMA_ARE"'
      'set'
      ' "CD_REGISTRO_PROGRAMA" = :"CD_REGISTRO_PROGRAMA"'
      ', "CD_UND" = :"CD_UND"'
      ', "DT_REGISTRO" = :"DT_REGISTRO"'
      ', "CD_UNIDADE" = :"CD_UNIDADE"'
      ', "CD_PROVINCIA" = :"CD_PROVINCIA"'
      ', "CD_MUNICIPIO" = :"CD_MUNICIPIO"'
      ', "VL_MESANO" = :"VL_MESANO"'
      ', "VL_ACONSELHADOS" = :"VL_ACONSELHADOS"'
      ', "VL_POSITIVOS" = :"VL_POSITIVOS"'
      ', "VL_NEGATIVOS" = :"VL_NEGATIVOS"'
      ', "VL_INDETERMINADOS" = :"VL_INDETERMINADOS"'
      ', "VL_FEMININO_2" = :"VL_FEMININO_2"'
      ', "VL_MASCULINO_2" = :"VL_MASCULINO_2"'
      ', "VL_GESTANTE_3" = :"VL_GESTANTE_3"'
      ', "VL_POS_PARTO_3" = :"VL_POS_PARTO_3"'
      ', "VL_PARTOS_3" = :"VL_PARTOS_3"'
      ', "VL_FEMININO_52" = :"VL_FEMININO_52"'
      ', "VL_MASCULINO_52" = :"VL_MASCULINO_52"'
      ', "FL_ACEITAR" = :"FL_ACEITAR"'
      ', "FL_STATUS" = :"FL_STATUS"'
      ', "DT_EXP" = :"DT_EXP"'
      ', "CD_EDI" = :"CD_EDI"'
      ', "CD_USU_INCLUSAO" = :"CD_USU_INCLUSAO"'
      ', "DT_INCLUSAO" = :"DT_INCLUSAO"'
      ', "CD_USU_ALTERACAO" = :"CD_USU_ALTERACAO"'
      ', "DT_ALTERACAO" = :"DT_ALTERACAO"'
      ', "CD_USU_EXCLUSAO" = :"CD_USU_EXCLUSAO"'
      ', "CD_REGISTRO_GERAL" = :"CD_REGISTRO_GERAL"'
      'where'
      '  "CD_REGISTRO_PROGRAMA" = :"OLD_CD_REGISTRO_PROGRAMA" and '
      '  "CD_UND" = :"OLD_CD_UND"')
    GeneratorField.Field = 'CD_REGISTRO_PROGRAMA'
    GeneratorField.Generator = 'GEN_REGISTRO_PROGRAMA_ARE'
    Left = 856
    Top = 72
    object TB_PROGRAMA_ARECD_REGISTRO_PROGRAMA: TIntegerField
      FieldName = 'CD_REGISTRO_PROGRAMA'
      Origin = 'REGISTRO_PROGRAMA_ARE.CD_REGISTRO_PROGRAMA'
      Required = True
    end
    object TB_PROGRAMA_ARECD_UND: TIntegerField
      FieldName = 'CD_UND'
      Origin = 'REGISTRO_PROGRAMA_ARE.CD_UND'
      Required = True
    end
    object TB_PROGRAMA_AREDT_REGISTRO: TDateTimeField
      FieldName = 'DT_REGISTRO'
      Origin = 'REGISTRO_PROGRAMA_ARE.DT_REGISTRO'
      Required = True
    end
    object TB_PROGRAMA_ARECD_UNIDADE: TIntegerField
      FieldName = 'CD_UNIDADE'
      Origin = 'REGISTRO_PROGRAMA_ARE.CD_UNIDADE'
    end
    object TB_PROGRAMA_ARECD_PROVINCIA: TIntegerField
      FieldName = 'CD_PROVINCIA'
      Origin = 'REGISTRO_PROGRAMA_ARE.CD_PROVINCIA'
    end
    object TB_PROGRAMA_ARECD_MUNICIPIO: TIntegerField
      FieldName = 'CD_MUNICIPIO'
      Origin = 'REGISTRO_PROGRAMA_ARE.CD_MUNICIPIO'
    end
    object TB_PROGRAMA_AREVL_MESANO: TIBStringField
      FieldName = 'VL_MESANO'
      Origin = 'REGISTRO_PROGRAMA_ARE.VL_MESANO'
      Size = 8
    end
    object TB_PROGRAMA_AREVL_ACONSELHADOS: TIntegerField
      FieldName = 'VL_ACONSELHADOS'
      Origin = 'REGISTRO_PROGRAMA_ARE.VL_ACONSELHADOS'
    end
    object TB_PROGRAMA_AREVL_POSITIVOS: TIntegerField
      FieldName = 'VL_POSITIVOS'
      Origin = 'REGISTRO_PROGRAMA_ARE.VL_POSITIVOS'
    end
    object TB_PROGRAMA_AREVL_NEGATIVOS: TIntegerField
      FieldName = 'VL_NEGATIVOS'
      Origin = 'REGISTRO_PROGRAMA_ARE.VL_NEGATIVOS'
    end
    object TB_PROGRAMA_AREVL_INDETERMINADOS: TIntegerField
      FieldName = 'VL_INDETERMINADOS'
      Origin = 'REGISTRO_PROGRAMA_ARE.VL_INDETERMINADOS'
    end
    object TB_PROGRAMA_AREVL_FEMININO_2: TIntegerField
      FieldName = 'VL_FEMININO_2'
      Origin = 'REGISTRO_PROGRAMA_ARE.VL_FEMININO_2'
    end
    object TB_PROGRAMA_AREVL_MASCULINO_2: TIntegerField
      FieldName = 'VL_MASCULINO_2'
      Origin = 'REGISTRO_PROGRAMA_ARE.VL_MASCULINO_2'
    end
    object TB_PROGRAMA_AREVL_GESTANTE_3: TIntegerField
      FieldName = 'VL_GESTANTE_3'
      Origin = 'REGISTRO_PROGRAMA_ARE.VL_GESTANTE_3'
    end
    object TB_PROGRAMA_AREVL_POS_PARTO_3: TIntegerField
      FieldName = 'VL_POS_PARTO_3'
      Origin = 'REGISTRO_PROGRAMA_ARE.VL_POS_PARTO_3'
    end
    object TB_PROGRAMA_AREVL_PARTOS_3: TIntegerField
      FieldName = 'VL_PARTOS_3'
      Origin = 'REGISTRO_PROGRAMA_ARE.VL_PARTOS_3'
    end
    object TB_PROGRAMA_AREVL_FEMININO_52: TIntegerField
      FieldName = 'VL_FEMININO_52'
      Origin = 'REGISTRO_PROGRAMA_ARE.VL_FEMININO_52'
    end
    object TB_PROGRAMA_AREVL_MASCULINO_52: TIntegerField
      FieldName = 'VL_MASCULINO_52'
      Origin = 'REGISTRO_PROGRAMA_ARE.VL_MASCULINO_52'
    end
    object TB_PROGRAMA_AREFL_ACEITAR: TIntegerField
      FieldName = 'FL_ACEITAR'
      Origin = 'REGISTRO_PROGRAMA_ARE.FL_ACEITAR'
    end
    object TB_PROGRAMA_AREFL_STATUS: TIBStringField
      FieldName = 'FL_STATUS'
      Origin = 'REGISTRO_PROGRAMA_ARE.FL_STATUS'
      FixedChar = True
      Size = 1
    end
    object TB_PROGRAMA_AREDT_EXP: TDateTimeField
      FieldName = 'DT_EXP'
      Origin = 'REGISTRO_PROGRAMA_ARE.DT_EXP'
    end
    object TB_PROGRAMA_ARECD_EDI: TIntegerField
      FieldName = 'CD_EDI'
      Origin = 'REGISTRO_PROGRAMA_ARE.CD_EDI'
    end
    object TB_PROGRAMA_ARECD_USU_INCLUSAO: TIntegerField
      FieldName = 'CD_USU_INCLUSAO'
      Origin = 'REGISTRO_PROGRAMA_ARE.CD_USU_INCLUSAO'
    end
    object TB_PROGRAMA_AREDT_INCLUSAO: TDateTimeField
      FieldName = 'DT_INCLUSAO'
      Origin = 'REGISTRO_PROGRAMA_ARE.DT_INCLUSAO'
    end
    object TB_PROGRAMA_ARECD_USU_ALTERACAO: TIntegerField
      FieldName = 'CD_USU_ALTERACAO'
      Origin = 'REGISTRO_PROGRAMA_ARE.CD_USU_ALTERACAO'
    end
    object TB_PROGRAMA_AREDT_ALTERACAO: TDateTimeField
      FieldName = 'DT_ALTERACAO'
      Origin = 'REGISTRO_PROGRAMA_ARE.DT_ALTERACAO'
    end
    object TB_PROGRAMA_ARECD_USU_EXCLUSAO: TIntegerField
      FieldName = 'CD_USU_EXCLUSAO'
      Origin = 'REGISTRO_PROGRAMA_ARE.CD_USU_EXCLUSAO'
    end
    object TB_PROGRAMA_ARECD_REGISTRO_GERAL: TIntegerField
      FieldName = 'CD_REGISTRO_GERAL'
      Origin = 'REGISTRO_PROGRAMA_ARE.CD_REGISTRO_GERAL'
    end
  end
  object TB_TABELA_EDI: TIBDataSet
    Database = DM.DB
    Transaction = DM.TS
    AfterPost = TB_TABELA_EDIAfterPost
    BufferChunks = 1000
    CachedUpdates = False
    DeleteSQL.Strings = (
      'delete from "TABELA_EDI"'
      'where'
      '  "NM_TABELA" = :"OLD_NM_TABELA"')
    InsertSQL.Strings = (
      'insert into "TABELA_EDI"'
      '('
      '  "NM_TABELA"'
      ', "FL_ENVIAR"'
      ', "FL_RECEBER"'
      ', "DT_EXP"'
      ', "CD_EDI"'
      ', "CD_USU_INCLUSAO"'
      ', "DT_INCLUSAO"'
      ', "CD_USU_ALTERACAO"'
      ', "DT_ALTERACAO"'
      ', "CD_USU_EXCLUSAO"'
      ', "FL_VALIDAR_RECEBIMENTO"'
      ', "NR_ORDEM"'
      ', "NM_ALIAS"'
      ', "FL_MARCAR_EXP"'
      ', "TP_TABELA_EDI"'
      ', "FL_ATUALIZAR_EDI"'
      ')'
      'values'
      '('
      '  :"NM_TABELA"'
      ', :"FL_ENVIAR"'
      ', :"FL_RECEBER"'
      ', :"DT_EXP"'
      ', :"CD_EDI"'
      ', :"CD_USU_INCLUSAO"'
      ', :"DT_INCLUSAO"'
      ', :"CD_USU_ALTERACAO"'
      ', :"DT_ALTERACAO"'
      ', :"CD_USU_EXCLUSAO"'
      ', :"FL_VALIDAR_RECEBIMENTO"'
      ', :"NR_ORDEM"'
      ', :"NM_ALIAS"'
      ', :"FL_MARCAR_EXP"'
      ', :"TP_TABELA_EDI"'
      ', :"FL_ATUALIZAR_EDI"'
      ')')
    SelectSQL.Strings = (
      'select "TABELA_EDI"."NM_TABELA"'
      '      ,"TABELA_EDI"."FL_ENVIAR"'
      '      ,"TABELA_EDI"."FL_RECEBER"'
      '      ,"TABELA_EDI"."DT_EXP"'
      '      ,"TABELA_EDI"."CD_EDI"'
      '      ,"TABELA_EDI"."CD_USU_INCLUSAO"'
      '      ,"TABELA_EDI"."DT_INCLUSAO"'
      '      ,"TABELA_EDI"."CD_USU_ALTERACAO"'
      '      ,"TABELA_EDI"."DT_ALTERACAO"'
      '      ,"TABELA_EDI"."CD_USU_EXCLUSAO"'
      '      ,"TABELA_EDI"."FL_VALIDAR_RECEBIMENTO"'
      '      ,"TABELA_EDI"."NR_ORDEM"'
      '      ,"TABELA_EDI"."NM_ALIAS"'
      '      ,"TABELA_EDI"."FL_MARCAR_EXP"'
      '      ,"TABELA_EDI"."TP_TABELA_EDI"'
      '      ,"TABELA_EDI"."FL_ATUALIZAR_EDI"'
      'from "TABELA_EDI"'
      'WHERE "NM_TABELA" = :NM_TABELA')
    ModifySQL.Strings = (
      'update "TABELA_EDI"'
      'set'
      ' "NM_TABELA" = :"NM_TABELA"'
      ', "FL_ENVIAR" = :"FL_ENVIAR"'
      ', "FL_RECEBER" = :"FL_RECEBER"'
      ', "DT_EXP" = :"DT_EXP"'
      ', "CD_EDI" = :"CD_EDI"'
      ', "CD_USU_INCLUSAO" = :"CD_USU_INCLUSAO"'
      ', "DT_INCLUSAO" = :"DT_INCLUSAO"'
      ', "CD_USU_ALTERACAO" = :"CD_USU_ALTERACAO"'
      ', "DT_ALTERACAO" = :"DT_ALTERACAO"'
      ', "CD_USU_EXCLUSAO" = :"CD_USU_EXCLUSAO"'
      ', "FL_VALIDAR_RECEBIMENTO" = :"FL_VALIDAR_RECEBIMENTO"'
      ', "NR_ORDEM" = :"NR_ORDEM"'
      ', "NM_ALIAS" = :"NM_ALIAS"'
      ', "FL_MARCAR_EXP" = :"FL_MARCAR_EXP"'
      ', "TP_TABELA_EDI" = :"TP_TABELA_EDI"'
      ', "FL_ATUALIZAR_EDI" = :"FL_ATUALIZAR_EDI"'
      'where'
      '  "NM_TABELA" = :"OLD_NM_TABELA"')
    GeneratorField.ApplyEvent = gamOnPost
    Left = 1120
    Top = 211
    object TB_TABELA_EDINM_TABELA: TIBStringField
      FieldName = 'NM_TABELA'
      Origin = 'TABELA_EDI.NM_TABELA'
      Required = True
      FixedChar = True
      Size = 31
    end
    object TB_TABELA_EDIFL_ENVIAR: TIBStringField
      FieldName = 'FL_ENVIAR'
      Origin = 'TABELA_EDI.FL_ENVIAR'
      FixedChar = True
      Size = 1
    end
    object TB_TABELA_EDIFL_RECEBER: TIBStringField
      FieldName = 'FL_RECEBER'
      Origin = 'TABELA_EDI.FL_RECEBER'
      FixedChar = True
      Size = 1
    end
    object TB_TABELA_EDIDT_EXP: TDateTimeField
      FieldName = 'DT_EXP'
      Origin = 'TABELA_EDI.DT_EXP'
    end
    object TB_TABELA_EDICD_EDI: TIntegerField
      FieldName = 'CD_EDI'
      Origin = 'TABELA_EDI.CD_EDI'
    end
    object TB_TABELA_EDICD_USU_INCLUSAO: TIntegerField
      FieldName = 'CD_USU_INCLUSAO'
      Origin = 'TABELA_EDI.CD_USU_INCLUSAO'
    end
    object TB_TABELA_EDIDT_INCLUSAO: TDateTimeField
      FieldName = 'DT_INCLUSAO'
      Origin = 'TABELA_EDI.DT_INCLUSAO'
    end
    object TB_TABELA_EDICD_USU_ALTERACAO: TIntegerField
      FieldName = 'CD_USU_ALTERACAO'
      Origin = 'TABELA_EDI.CD_USU_ALTERACAO'
    end
    object TB_TABELA_EDIDT_ALTERACAO: TDateTimeField
      FieldName = 'DT_ALTERACAO'
      Origin = 'TABELA_EDI.DT_ALTERACAO'
    end
    object TB_TABELA_EDICD_USU_EXCLUSAO: TIntegerField
      FieldName = 'CD_USU_EXCLUSAO'
      Origin = 'TABELA_EDI.CD_USU_EXCLUSAO'
    end
    object TB_TABELA_EDIFL_VALIDAR_RECEBIMENTO: TIBStringField
      FieldName = 'FL_VALIDAR_RECEBIMENTO'
      Origin = 'TABELA_EDI.FL_VALIDAR_RECEBIMENTO'
      FixedChar = True
      Size = 1
    end
    object TB_TABELA_EDINR_ORDEM: TIntegerField
      FieldName = 'NR_ORDEM'
      Origin = 'TABELA_EDI.NR_ORDEM'
    end
    object TB_TABELA_EDINM_ALIAS: TIBStringField
      FieldName = 'NM_ALIAS'
      Origin = 'TABELA_EDI.NM_ALIAS'
      Size = 50
    end
    object TB_TABELA_EDIFL_MARCAR_EXP: TIBStringField
      FieldName = 'FL_MARCAR_EXP'
      Origin = 'TABELA_EDI.FL_MARCAR_EXP'
      FixedChar = True
      Size = 1
    end
    object TB_TABELA_EDITP_TABELA_EDI: TIBStringField
      FieldName = 'TP_TABELA_EDI'
      Origin = 'TABELA_EDI.TP_TABELA_EDI'
      FixedChar = True
      Size = 1
    end
    object TB_TABELA_EDIFL_ATUALIZAR_EDI: TIBStringField
      FieldName = 'FL_ATUALIZAR_EDI'
      Origin = 'TABELA_EDI.FL_ATUALIZAR_EDI'
      FixedChar = True
      Size = 1
    end
  end
  object TB_FORMA: TIBDataSet
    Database = DM.DB
    Transaction = DM.TS
    AfterInsert = TB_FORMAAfterInsert
    BufferChunks = 1000
    CachedUpdates = False
    DeleteSQL.Strings = (
      'delete from "FORMA"'
      'where'
      '  "CD_FORMA" = :"OLD_CD_FORMA"')
    InsertSQL.Strings = (
      'insert into "FORMA"'
      '('
      '  "CD_FORMA"'
      ', "CD_UND"'
      ', "DS_FORMA"'
      ', "DT_EXP"'
      ', "CD_EDI"'
      ')'
      'values'
      '('
      '  :"CD_FORMA"'
      ', :"CD_UND"'
      ', :"DS_FORMA"'
      ', :"DT_EXP"'
      ', :"CD_EDI"'
      ')')
    SelectSQL.Strings = (
      'select "FORMA"."CD_FORMA"'
      '      ,"FORMA"."CD_UND"'
      '      ,"FORMA"."DS_FORMA"'
      '      ,"FORMA"."DT_EXP"'
      '      ,"FORMA"."CD_EDI"'
      'from "FORMA"'
      'order by'
      '"FORMA"."CD_FORMA"')
    ModifySQL.Strings = (
      'update "FORMA"'
      'set'
      ' "CD_FORMA" = :"CD_FORMA"'
      ', "CD_UND" = :"CD_UND"'
      ', "DS_FORMA" = :"DS_FORMA"'
      ', "DT_EXP" = :"DT_EXP"'
      ', "CD_EDI" = :"CD_EDI"'
      'where'
      '  "CD_FORMA" = :"OLD_CD_FORMA"')
    GeneratorField.Field = 'CD_FORMA'
    GeneratorField.Generator = 'GEN_FORMA'
    Left = 1128
    Top = 48
    object TB_FORMACD_FORMA: TIntegerField
      FieldName = 'CD_FORMA'
      Origin = 'FORMA.CD_FORMA'
      Required = True
    end
    object TB_FORMADS_FORMA: TIBStringField
      FieldName = 'DS_FORMA'
      Origin = 'FORMA.DS_FORMA'
      Size = 50
    end
    object TB_FORMACD_UND: TIntegerField
      FieldName = 'CD_UND'
      Origin = 'FORMA.CD_UND'
    end
    object TB_FORMADT_EXP: TDateTimeField
      FieldName = 'DT_EXP'
      Origin = 'FORMA.DT_EXP'
    end
    object TB_FORMACD_EDI: TIntegerField
      FieldName = 'CD_EDI'
      Origin = 'FORMA.CD_EDI'
    end
  end
end
