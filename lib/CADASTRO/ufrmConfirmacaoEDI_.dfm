object frmConfirmacaoEDI: TfrmConfirmacaoEDI
  Left = 222
  Top = 135
  Width = 900
  Height = 501
  Caption = 'Confirma'#231#227'o EDI'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object grDados: TdxDBGrid
    Left = 0
    Top = 0
    Width = 892
    Height = 467
    Bands = <
      item
      end>
    DefaultLayout = True
    HeaderPanelRowCount = 1
    KeyField = 'CD_UNIDADE'
    ShowGroupPanel = True
    SummaryGroups = <>
    SummarySeparator = ', '
    Align = alClient
    BorderStyle = bsNone
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    PopupMenu = PopupMenu1
    TabOrder = 0
    BandFont.Charset = DEFAULT_CHARSET
    BandFont.Color = clWindowText
    BandFont.Height = -11
    BandFont.Name = 'MS Sans Serif'
    BandFont.Style = []
    DataSource = dsDados
    Filter.Criteria = {00000000}
    HeaderFont.Charset = DEFAULT_CHARSET
    HeaderFont.Color = clWindowText
    HeaderFont.Height = -11
    HeaderFont.Name = 'MS Sans Serif'
    HeaderFont.Style = [fsBold]
    OptionsBehavior = [edgoAutoSort, edgoDragScroll, edgoEditing, edgoEnterShowEditor, edgoImmediateEditor, edgoStoreToIniFile, edgoTabThrough, edgoVertThrough]
    OptionsView = [edgoBandHeaderWidth, edgoRowSelect, edgoUseBitmap]
    PreviewFont.Charset = DEFAULT_CHARSET
    PreviewFont.Color = clBlue
    PreviewFont.Height = -11
    PreviewFont.Name = 'MS Sans Serif'
    PreviewFont.Style = []
    object grDadosColumn1: TdxDBGridColumn
      Caption = 'Unidade'
      Width = 150
      BandIndex = 0
      RowIndex = 0
      FieldName = 'DS_UNIDADE'
    end
    object grDadosColumn2: TdxDBGridColumn
      Caption = 'Provincia'
      Width = 172
      BandIndex = 0
      RowIndex = 0
      FieldName = 'DS_PROVINCIA'
    end
    object grDadosColumn3: TdxDBGridColumn
      Caption = 'Municipio'
      Width = 221
      BandIndex = 0
      RowIndex = 0
      FieldName = 'DS_MUNICIPIO'
    end
    object grDadosColumn4: TdxDBGridColumn
      Caption = 'MesAno'
      Width = 62
      BandIndex = 0
      RowIndex = 0
      FieldName = 'VL_MESANO'
    end
    object grDadosColumn5: TdxDBGridColumn
      Caption = 'Aceitar'
      Width = 50
      BandIndex = 0
      RowIndex = 0
      FieldName = 'FL_ACEITAR'
    end
    object grDadosColumn6: TdxDBGridColumn
      Caption = 'Dt.Aceite'
      Width = 63
      BandIndex = 0
      RowIndex = 0
      FieldName = 'DT_ACEITAR'
    end
    object grDadosColumn8: TdxDBGridColumn
      Caption = 'Importar'
      Width = 52
      BandIndex = 0
      RowIndex = 0
      FieldName = 'FL_IMPORTAR'
    end
    object grDadosColumn9: TdxDBGridColumn
      Caption = 'Dt.Importado'
      Width = 70
      BandIndex = 0
      RowIndex = 0
      FieldName = 'DT_IMPORTAR'
    end
    object grDadosColumn7: TdxDBGridColumn
      Caption = 'Tipo'
      Sorted = csUp
      Visible = False
      Width = 60
      BandIndex = 0
      RowIndex = 0
      FieldName = 'DS_TIPO'
      GroupIndex = 0
    end
  end
  object dsDados: TDataSource
    DataSet = TB_REGISTROS
    Left = 424
    Top = 144
  end
  object PopupMenu1: TPopupMenu
    Left = 424
    Top = 208
    object Aceitar1: TMenuItem
      Caption = 'Aceitar'
      OnClick = Aceitar1Click
    end
    object Processar1: TMenuItem
      Caption = 'Processar'
      OnClick = Processar1Click
    end
    object Visualizar1: TMenuItem
      Caption = 'Visualizar'
      OnClick = Visualizar1Click
    end
  end
  object TB_REGISTROS: TIBDataSet
    Database = DM.DB
    Transaction = DM.TS
    BeforeOpen = TB_REGISTROSBeforeOpen
    OnCalcFields = TB_REGISTROSCalcFields
    BufferChunks = 1000
    CachedUpdates = False
    SelectSQL.Strings = (
      'select '
      '      VW_REGISTROS."CD_UNIDADE"'
      '      ,VW_REGISTROS."CD_PROVINCIA"'
      '      ,VW_REGISTROS."CD_MUNICIPIO"'
      '      ,VW_REGISTROS."VL_MESANO"'
      '      ,VW_REGISTROS."FL_ACEITAR"'
      '      ,VW_REGISTROS."FL_IMPORTAR"'
      '      ,VW_REGISTROS."CD_ACEITAR_USU"'
      '      ,VW_REGISTROS."DT_ACEITAR"'
      '      ,VW_REGISTROS."DT_IMPORTAR"'
      '      ,VW_REGISTROS."TIPO"'
      '      ,U.DS_UNIDADE'
      '      ,M.DS_MUNICIPIO'
      '      ,P.DS_PROVINCIA'
      'from VW_REGISTROS'
      '    left outer join MUNICIPIO M on'
      '      VW_REGISTROS.CD_MUNICIPIO = M.CD_MUNICIPIO'
      '    left outer join PROVINCIA P on'
      '      VW_REGISTROS.CD_PROVINCIA = P.CD_PROVINCIA'
      '    left outer join UNIDADE U on '
      '      VW_REGISTROS.CD_UNIDADE = U.CD_UNIDADE'
      ''
      '/**/')
    ModifySQL.Strings = (
      'update "REGISTRO_PROGRAMA_PAI"'
      'set'
      '  "FL_ACEITAR" = :"FL_ACEITAR"'
      ', "CD_ACEITAR_USU" = :"CD_ACEITAR_USU"'
      ', "DT_ACEITAR" = :"DT_ACEITAR"'
      'where 1=2')
    Left = 424
    Top = 176
    object TB_REGISTROSDS_TIPO: TStringField
      DisplayWidth = 50
      FieldKind = fkCalculated
      FieldName = 'DS_TIPO'
      Size = 50
      Calculated = True
    end
    object TB_REGISTROSCD_UNIDADE: TIntegerField
      FieldName = 'CD_UNIDADE'
      Origin = 'VW_REGISTROS.CD_UNIDADE'
    end
    object TB_REGISTROSCD_PROVINCIA: TIntegerField
      FieldName = 'CD_PROVINCIA'
      Origin = 'VW_REGISTROS.CD_PROVINCIA'
    end
    object TB_REGISTROSCD_MUNICIPIO: TIntegerField
      FieldName = 'CD_MUNICIPIO'
      Origin = 'VW_REGISTROS.CD_MUNICIPIO'
    end
    object TB_REGISTROSVL_MESANO: TIBStringField
      FieldName = 'VL_MESANO'
      Origin = 'VW_REGISTROS.VL_MESANO'
      Size = 8
    end
    object TB_REGISTROSFL_ACEITAR: TIBStringField
      FieldName = 'FL_ACEITAR'
      Origin = 'VW_REGISTROS.FL_ACEITAR'
      FixedChar = True
      Size = 1
    end
    object TB_REGISTROSFL_IMPORTAR: TIBStringField
      FieldName = 'FL_IMPORTAR'
      Origin = 'VW_REGISTROS.FL_IMPORTAR'
      FixedChar = True
      Size = 1
    end
    object TB_REGISTROSCD_ACEITAR_USU: TIntegerField
      FieldName = 'CD_ACEITAR_USU'
      Origin = 'VW_REGISTROS.CD_ACEITAR_USU'
    end
    object TB_REGISTROSDT_ACEITAR: TDateTimeField
      FieldName = 'DT_ACEITAR'
      Origin = 'VW_REGISTROS.DT_ACEITAR'
    end
    object TB_REGISTROSDT_IMPORTAR: TDateTimeField
      FieldName = 'DT_IMPORTAR'
      Origin = 'VW_REGISTROS.DT_IMPORTAR'
    end
    object TB_REGISTROSTIPO: TIntegerField
      FieldName = 'TIPO'
      Origin = 'VW_REGISTROS.TIPO'
      ReadOnly = True
    end
    object TB_REGISTROSDS_UNIDADE: TIBStringField
      FieldName = 'DS_UNIDADE'
      Origin = 'UNIDADE.DS_UNIDADE'
      Size = 50
    end
    object TB_REGISTROSDS_MUNICIPIO: TIBStringField
      FieldName = 'DS_MUNICIPIO'
      Origin = 'MUNICIPIO.DS_MUNICIPIO'
      Size = 50
    end
    object TB_REGISTROSDS_PROVINCIA: TIBStringField
      FieldName = 'DS_PROVINCIA'
      Origin = 'PROVINCIA.DS_PROVINCIA'
      Size = 50
    end
  end
  object qyGeral: TIBQuery
    Database = DM.DB
    Transaction = DM.TS
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'update "REGISTRO_PROGRAMA_PAI"'
      'set'
      ' "FL_ACEITAR" = :"FL_ACEITAR"'
      ', "CD_ACEITAR_USU" = :"CD_ACEITAR_USU"'
      ', "DT_ACEITAR" = :"DT_ACEITAR"'
      'where'
      '  "CD_UNIDADE" = :"CD_UNIDADE" and '
      '  "CD_PROVINCIA" = :"CD_PROVINCIA" and '
      '  "CD_MUNICIPIO" = :"CD_MUNICIPIO" and '
      '  "VL_MESANO" = :"VL_MESANO"')
    Left = 424
    Top = 240
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'FL_ACEITAR'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CD_ACEITAR_USU'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DT_ACEITAR'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CD_UNIDADE'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CD_PROVINCIA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CD_MUNICIPIO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'VL_MESANO'
        ParamType = ptUnknown
      end>
  end
  object qySync: TIBQuery
    Database = DM.DB
    Transaction = DM.TS
    BufferChunks = 1000
    CachedUpdates = False
    Left = 424
    Top = 272
  end
  object qyGeral2: TIBQuery
    Database = DM.DB
    Transaction = DM.TS
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'update "REGISTRO_PROGRAMA_PAI"'
      'set'
      ' "FL_IMPORTAR" = :"FL_IMPORTAR"'
      ', "DT_IMPORTAR" = :"DT_IMPORTAR"'
      'where'
      '  "CD_UNIDADE" = :"CD_UNIDADE" and '
      '  "CD_PROVINCIA" = :"CD_PROVINCIA" and '
      '  "CD_MUNICIPIO" = :"CD_MUNICIPIO" and '
      '  "VL_MESANO" = :"VL_MESANO"')
    Left = 456
    Top = 240
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'FL_IMPORTAR'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DT_IMPORTAR'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CD_UNIDADE'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CD_PROVINCIA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CD_MUNICIPIO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'VL_MESANO'
        ParamType = ptUnknown
      end>
  end
  object qyGeral3: TIBQuery
    Database = DM.DB
    Transaction = DM.TS
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'delete "REGISTRO_PROGRAMA_EDI"'
      'where'
      '  "CD_UNIDADE" = :"CD_UNIDADE" and '
      '  "CD_PROVINCIA" = :"CD_PROVINCIA" and '
      '  "CD_MUNICIPIO" = :"CD_MUNICIPIO" and '
      '  "VL_MESANO" = :"VL_MESANO"')
    Left = 496
    Top = 240
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'CD_UNIDADE'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CD_PROVINCIA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CD_MUNICIPIO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'VL_MESANO'
        ParamType = ptUnknown
      end>
  end
end
