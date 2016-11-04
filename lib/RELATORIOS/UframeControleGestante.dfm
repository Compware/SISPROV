object frameControleGestante: TframeControleGestante
  Left = 0
  Top = 0
  Width = 334
  Height = 124
  TabOrder = 0
  object Panel1: TPanel
    Left = 304
    Top = 0
    Width = 30
    Height = 124
    Align = alRight
    TabOrder = 0
    object btExcluir: TSpeedButton
      Left = 4
      Top = 29
      Width = 23
      Height = 22
      Hint = 'Excluir'
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        0400000000000001000000000000000000001000000000000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        333333333333333333FF33333333333330003333333333333777333333333333
        300033FFFFFF3333377739999993333333333777777F3333333F399999933333
        3300377777733333337733333333333333003333333333333377333333333333
        3333333333333333333F333333333333330033333F33333333773333C3333333
        330033337F3333333377333CC3333333333333F77FFFFFFF3FF33CCCCCCCCCC3
        993337777777777F77F33CCCCCCCCCC399333777777777737733333CC3333333
        333333377F33333333FF3333C333333330003333733333333777333333333333
        3000333333333333377733333333333333333333333333333333}
      NumGlyphs = 2
      OnClick = btExcluirClick
    end
    object btInserir: TSpeedButton
      Left = 4
      Top = 6
      Width = 23
      Height = 22
      Hint = 'Incluir'
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        0400000000000001000000000000000000001000000000000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        33333333FF33333333FF333993333333300033377F3333333777333993333333
        300033F77FFF3333377739999993333333333777777F3333333F399999933333
        33003777777333333377333993333333330033377F3333333377333993333333
        3333333773333333333F333333333333330033333333F33333773333333C3333
        330033333337FF3333773333333CC333333333FFFFF77FFF3FF33CCCCCCCCCC3
        993337777777777F77F33CCCCCCCCCC3993337777777777377333333333CC333
        333333333337733333FF3333333C333330003333333733333777333333333333
        3000333333333333377733333333333333333333333333333333}
      NumGlyphs = 2
      OnClick = btInserirClick
    end
  end
  object grGestante: TdxDBGrid
    Left = 0
    Top = 0
    Width = 304
    Height = 124
    Bands = <
      item
        Caption = 'Gesta'#231#245'es'
        DisableCustomizing = True
        DisableDragging = True
        Width = 238
      end>
    DefaultLayout = False
    HeaderPanelRowCount = 1
    KeyField = 'CD_GESTANTE'
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
    ParentShowHint = False
    ShowHint = True
    TabOrder = 1
    BandColor = 8404992
    BandFont.Charset = DEFAULT_CHARSET
    BandFont.Color = clWhite
    BandFont.Height = -13
    BandFont.Name = 'MS Sans Serif'
    BandFont.Style = [fsBold]
    DataSource = dsGestante
    Filter.AutoDataSetFilter = True
    Filter.Criteria = {00000000}
    GroupPanelColor = 12615680
    HeaderColor = 15983825
    HeaderFont.Charset = DEFAULT_CHARSET
    HeaderFont.Color = clWindowText
    HeaderFont.Height = -11
    HeaderFont.Name = 'MS Sans Serif'
    HeaderFont.Style = [fsBold]
    OptionsBehavior = [edgoDragScroll, edgoEditing, edgoEnterShowEditor, edgoImmediateEditor, edgoStoreToIniFile, edgoTabThrough, edgoVertThrough]
    OptionsDB = [edgoCanNavigation, edgoLoadAllRecords, edgoUseBookmarks]
    OptionsView = [edgoBandHeaderWidth, edgoIndicator, edgoPreview, edgoUseBitmap]
    PreviewFont.Charset = DEFAULT_CHARSET
    PreviewFont.Color = clBlue
    PreviewFont.Height = -11
    PreviewFont.Name = 'MS Sans Serif'
    PreviewFont.Style = []
    PreviewLines = 0
    ShowBands = True
    ShowPreviewGrid = False
    ShowRowFooter = True
    object grGestanteDT_GESTANTE: TdxDBGridDateColumn
      Caption = 'Inicio Gesta'#231#227'o'
      Width = 97
      BandIndex = 0
      RowIndex = 0
      FieldName = 'DT_INICIO_GESTACAO'
    end
    object grGestanteFimGestacao: TdxDBGridDateColumn
      Caption = 'Fim Gesta'#231#227'o'
      Width = 88
      BandIndex = 0
      RowIndex = 0
      FieldName = 'DT_FIM_GESTACAO'
    end
    object grGestanteFL_Gestante: TdxDBGridCheckColumn
      Caption = 'Gestante'
      Width = 60
      BandIndex = 0
      RowIndex = 0
      FieldName = 'FL_GESTANTE'
      ValueChecked = '1'
      ValueUnchecked = '0'
    end
    object grGestanteNrMeses: TdxDBGridColumn
      Caption = 'Meses'
      Width = 42
      BandIndex = 0
      RowIndex = 0
      FieldName = 'NR_MESES'
    end
    object grGestanteColumn5: TdxDBGridColumn
      Sorted = csDown
      Visible = False
      BandIndex = 0
      RowIndex = 0
      FieldName = 'CODIGO'
    end
  end
  object qyGestante: TIBDataSet
    Database = DM.DB
    Transaction = DM.TS
    AfterDelete = qyGestanteAfterDelete
    AfterInsert = qyGestanteAfterInsert
    AfterPost = qyGestanteAfterPost
    OnCalcFields = qyGestanteCalcFields
    BufferChunks = 1000
    CachedUpdates = False
    DeleteSQL.Strings = (
      'delete from "GESTANTE"'
      'where'
      '  "CD_GESTANTE" = :"OLD_CD_GESTANTE"')
    InsertSQL.Strings = (
      'insert into "GESTANTE"'
      '('
      '  "CD_GESTANTE"'
      ', "DT_INICIO_GESTACAO"'
      ', "NR_PROCESSO"'
      ', "CD_PACIENTE"'
      ', "NR_MESES"'
      ', "CD_USUARIO"'
      ', "FL_GESTANTE"'
      ', "DT_FIM_GESTACAO"'
      ')'
      'values'
      '('
      '  :"CD_GESTANTE"'
      ', :"DT_INICIO_GESTACAO"'
      ', :"NR_PROCESSO"'
      ', :"CD_PACIENTE"'
      ', :"NR_MESES"'
      ', :"CD_USUARIO"'
      ', :"FL_GESTANTE"'
      ', :"DT_FIM_GESTACAO"'
      ')')
    SelectSQL.Strings = (
      'select "GESTANTE"."CD_GESTANTE"'
      '      ,"GESTANTE"."DT_INICIO_GESTACAO"'
      '      ,"GESTANTE"."NR_PROCESSO"'
      '      ,"GESTANTE"."CD_PACIENTE"'
      '      ,"GESTANTE"."NR_MESES"'
      '      ,"GESTANTE"."CD_USUARIO"'
      '      ,"GESTANTE"."FL_GESTANTE"'
      '      ,"GESTANTE"."DT_FIM_GESTACAO"'
      'from "GESTANTE"'
      'WHERE GESTANTE.CD_PACIENTE = :CD_PACIENTE'
      'order by'
      '"GESTANTE"."DT_INICIO_GESTACAO"  asc')
    ModifySQL.Strings = (
      'update "GESTANTE"'
      'set'
      ' "CD_GESTANTE" = :"CD_GESTANTE"'
      ', "DT_INICIO_GESTACAO" = :"DT_INICIO_GESTACAO"'
      ', "NR_PROCESSO" = :"NR_PROCESSO"'
      ', "CD_PACIENTE" = :"CD_PACIENTE"'
      ', "NR_MESES" = :"NR_MESES"'
      ', "CD_USUARIO" = :"CD_USUARIO"'
      ', "FL_GESTANTE" = :"FL_GESTANTE"'
      ', "DT_FIM_GESTACAO" = :"DT_FIM_GESTACAO"'
      'where'
      '  "CD_GESTANTE" = :"OLD_CD_GESTANTE"')
    GeneratorField.Field = 'CD_GESTANTE'
    GeneratorField.Generator = 'GEN_GESTANTE'
    Left = 152
    Top = 73
    object qyGestanteCD_GESTANTE: TIntegerField
      FieldName = 'CD_GESTANTE'
      Origin = 'GESTANTE.CD_GESTANTE'
      Required = True
    end
    object qyGestanteDT_INICIO_GESTACAO: TDateField
      FieldName = 'DT_INICIO_GESTACAO'
      Origin = 'GESTANTE.DT_INICIO_GESTACAO'
    end
    object qyGestanteNR_PROCESSO: TIBStringField
      FieldName = 'NR_PROCESSO'
      Origin = 'GESTANTE.NR_PROCESSO'
      Size = 15
    end
    object qyGestanteCD_PACIENTE: TIntegerField
      FieldName = 'CD_PACIENTE'
      Origin = 'GESTANTE.CD_PACIENTE'
    end
    object qyGestanteNR_MESES: TIntegerField
      FieldName = 'NR_MESES'
      Origin = 'GESTANTE.NR_MESES'
      OnValidate = qyGestanteNR_MESESValidate
    end
    object qyGestanteCD_USUARIO: TIntegerField
      FieldName = 'CD_USUARIO'
      Origin = 'GESTANTE.CD_USUARIO'
    end
    object qyGestanteFL_GESTANTE: TIntegerField
      FieldName = 'FL_GESTANTE'
      Origin = 'GESTANTE.FL_GESTANTE'
    end
    object qyGestanteDT_FIM_GESTACAO: TDateField
      FieldName = 'DT_FIM_GESTACAO'
      Origin = 'GESTANTE.DT_FIM_GESTACAO'
      OnValidate = qyGestanteDT_FIM_GESTACAOValidate
    end
    object qyGestanteCODIGO: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'CODIGO'
      Calculated = True
    end
  end
  object dsGestante: TDataSource
    AutoEdit = False
    DataSet = qyGestante
    Left = 181
    Top = 73
  end
end
