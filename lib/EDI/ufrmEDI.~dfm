object frmEDI: TfrmEDI
  Left = 244
  Top = 155
  Width = 429
  Height = 331
  Caption = 'EDI - Intercambio de Dados'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 48
    Top = 96
    Width = 44
    Height = 13
    Caption = 'Tabela:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lbLog: TLabel
    Left = 48
    Top = 120
    Width = 3
    Height = 13
  end
  object btOrdem: TButton
    Left = 8
    Top = 8
    Width = 75
    Height = 25
    Caption = 'Ordem'
    TabOrder = 0
    Visible = False
    OnClick = btOrdemClick
  end
  object btExportar: TButton
    Left = 8
    Top = 40
    Width = 75
    Height = 25
    Caption = 'Exportar'
    TabOrder = 1
    OnClick = btExportarClick
  end
  object RichEdit1: TRichEdit
    Left = 160
    Top = 264
    Width = 249
    Height = 25
    Lines.Strings = (
      'RichEdit1')
    TabOrder = 2
    Visible = False
  end
  object btLimparDtExp: TButton
    Left = 88
    Top = 8
    Width = 75
    Height = 25
    Caption = 'Limpar DtExp'
    TabOrder = 3
    OnClick = btLimparDtExpClick
  end
  object DBGrid1: TDBGrid
    Left = 160
    Top = 96
    Width = 249
    Height = 161
    DataSource = DataSource3
    TabOrder = 4
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Visible = False
  end
  object btImportar: TButton
    Left = 88
    Top = 40
    Width = 75
    Height = 25
    Caption = 'Importar'
    TabOrder = 5
    OnClick = btImportarClick
  end
  object lstArquivos: TFileListBox
    Left = 8
    Top = 112
    Width = 137
    Height = 177
    ItemHeight = 13
    TabOrder = 6
    Visible = False
    OnClick = lstArquivosClick
    OnDblClick = lstArquivosDblClick
  end
  object CDSTabela: TIBClientDataSet
    CommandText = 'select * from  TABELA_EDI'
    Aggregates = <>
    Options = [poAllowCommandText]
    Params = <>
    DBConnection = DM.DB
    DBTransaction = DM.TS
    Left = 264
    Top = 8
    object CDSTabelaORDEM: TIntegerField
      FieldKind = fkInternalCalc
      FieldName = 'ORDEM'
    end
    object CDSTabelaNM_TABELA: TStringField
      FieldName = 'NM_TABELA'
      Origin = 'TABELA_EDI.NM_TABELA'
      Required = True
      FixedChar = True
      Size = 31
    end
    object CDSTabelaNM_ALIAS: TStringField
      DisplayWidth = 50
      FieldName = 'NM_ALIAS'
      Origin = 'TABELA_EDI.NM_ALIAS'
      FixedChar = True
      Size = 50
    end
    object CDSTabelaFL_ENVIAR: TStringField
      FieldName = 'FL_ENVIAR'
      Origin = 'TABELA_EDI.FL_ENVIAR'
      FixedChar = True
      Size = 1
    end
    object CDSTabelaFL_RECEBER: TStringField
      FieldName = 'FL_RECEBER'
      Origin = 'TABELA_EDI.FL_RECEBER'
      FixedChar = True
      Size = 1
    end
    object CDSTabelaFL_VALIDAR_RECEBIMENTO: TStringField
      FieldName = 'FL_VALIDAR_RECEBIMENTO'
      Origin = 'TABELA_EDI.FL_VALIDAR_RECEBIMENTO'
      Size = 1
    end
    object CDSTabelaNR_ORDEM: TIntegerField
      FieldName = 'NR_ORDEM'
      Origin = 'TABELA_EDI.NR_ORDEM'
    end
    object CDSTabelaFL_MARCAR_EXP: TStringField
      FieldName = 'FL_MARCAR_EXP'
      FixedChar = True
      Size = 1
    end
    object CDSTabelaFL_ATUALIZAR_EDI: TStringField
      FieldName = 'FL_ATUALIZAR_EDI'
      FixedChar = True
      Size = 1
    end
  end
  object DataSource1: TDataSource
    DataSet = CDSTabela
    Left = 296
    Top = 8
  end
  object CDSIndice: TIBClientDataSet
    CommandText = 
      'select v1.tabela tabela, v2.tabela rel'#13#10'   from vwIndices v1'#13#10'  ' +
      '  inner join vwIndices v2'#13#10'    on v2.chave = v1.nome'
    Aggregates = <>
    Options = [poAllowCommandText]
    Params = <>
    DBConnection = DM.DB
    DBTransaction = DM.TS
    Left = 328
    Top = 8
    object CDSIndiceTABELA2: TStringField
      FieldName = 'TABELA'
      FixedChar = True
      Size = 93
    end
    object CDSIndiceREL: TStringField
      FieldName = 'REL'
      FixedChar = True
      Size = 93
    end
  end
  object DataSource2: TDataSource
    DataSet = TB
    Left = 360
    Top = 8
  end
  object cds: TIBClientDataSet
    Aggregates = <>
    Options = [poAllowCommandText]
    Params = <>
    Left = 392
    Top = 8
  end
  object cds2: TIBClientDataSet
    Aggregates = <>
    Options = [poAllowCommandText]
    Params = <>
    Left = 424
    Top = 8
  end
  object TB: TIBClientDataSet
    Aggregates = <>
    Options = [poAllowCommandText]
    Params = <>
    DBConnection = DM.DB
    DBTransaction = DM.TS
    Left = 232
    Top = 8
  end
  object oSQL: TIBSQL
    Database = DM.DB
    ParamCheck = True
    Transaction = DM.TS
    Left = 232
    Top = 40
  end
  object DataSource3: TDataSource
    DataSet = cds
    Left = 264
    Top = 40
  end
  object ibds: TIBDataSet
    Database = DM.DB
    Transaction = DM.TS
    BufferChunks = 1000
    CachedUpdates = False
    Left = 296
    Top = 40
  end
  object qyCampos: TIBQuery
    Database = DM.DB
    Transaction = DM.TS
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select rdb$field_name NM_CAMPO'
      'from rdb$relation_constraints c,'
      '     rdb$index_segments i'
      'where c.rdb$relation_name = :NM_TABELA'
      'and c.rdb$constraint_type='#39'PRIMARY KEY'#39
      'and c.rdb$index_name = i.rdb$index_name')
    Left = 328
    Top = 40
    ParamData = <
      item
        DataType = ftString
        Name = 'NM_TABELA'
        ParamType = ptInput
      end>
    object qyCamposNM_CAMPO: TIBStringField
      FieldName = 'NM_CAMPO'
      Origin = 'RDB$INDEX_SEGMENTS.RDB$FIELD_NAME'
      FixedChar = True
      Size = 93
    end
  end
  object qyGENTABELA: TIBQuery
    Database = DM.DB
    Transaction = DM.TS
    BufferChunks = 1000
    CachedUpdates = False
    Left = 360
    Top = 40
  end
end
