object frmCorrecao3: TfrmCorrecao3
  Left = 326
  Top = 191
  Width = 909
  Height = 472
  Caption = 'Corre'#231#227'o Paciente/Agenda por Processo'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 30
    Top = 19
    Width = 48
    Height = 13
    Caption = 'Agenda:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object BitBtn1: TBitBtn
    Left = 544
    Top = 392
    Width = 113
    Height = 25
    Caption = '&Fechar'
    TabOrder = 0
    Kind = bkClose
  end
  object BitBtn2: TBitBtn
    Left = 312
    Top = 392
    Width = 137
    Height = 25
    Caption = 'Corrigir'
    Default = True
    TabOrder = 1
    OnClick = BitBtn2Click
    Glyph.Data = {
      DE010000424DDE01000000000000760000002800000024000000120000000100
      0400000000006801000000000000000000001000000000000000000000000000
      80000080000000808000800000008000800080800000C0C0C000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
      3333333333333333333333330000333333333333333333333333F33333333333
      00003333344333333333333333388F3333333333000033334224333333333333
      338338F3333333330000333422224333333333333833338F3333333300003342
      222224333333333383333338F3333333000034222A22224333333338F338F333
      8F33333300003222A3A2224333333338F3838F338F33333300003A2A333A2224
      33333338F83338F338F33333000033A33333A222433333338333338F338F3333
      0000333333333A222433333333333338F338F33300003333333333A222433333
      333333338F338F33000033333333333A222433333333333338F338F300003333
      33333333A222433333333333338F338F00003333333333333A22433333333333
      3338F38F000033333333333333A223333333333333338F830000333333333333
      333A333333333333333338330000333333333333333333333333333333333333
      0000}
    NumGlyphs = 2
  end
  object grDados: TdxDBGrid
    Left = 32
    Top = 40
    Width = 857
    Height = 288
    Bands = <
      item
      end>
    DefaultLayout = False
    HeaderPanelRowCount = 1
    KeyField = 'CD_MAPA_LINHA'
    ShowGroupPanel = True
    SummaryGroups = <>
    SummarySeparator = ', '
    ParentShowHint = False
    ShowHint = True
    TabOrder = 2
    DataSource = DataSource1
    Filter.Active = True
    Filter.Criteria = {00000000}
    OptionsBehavior = [edgoAutoSort, edgoDragScroll, edgoEditing, edgoEnterShowEditor, edgoImmediateEditor, edgoStoreToIniFile, edgoTabThrough, edgoVertThrough]
    OptionsView = [edgoBandHeaderWidth, edgoRowSelect, edgoUseBitmap]
    object grDadosCD_MAPA_LINHA: TdxDBGridMaskColumn
      Width = 112
      BandIndex = 0
      RowIndex = 0
      FieldName = 'CD_MAPA_LINHA'
    end
    object grDadosNR_PROCESSO: TdxDBGridMaskColumn
      Width = 104
      BandIndex = 0
      RowIndex = 0
      FieldName = 'NR_PROCESSO'
    end
    object grDadosNM_PACIENTE: TdxDBGridMaskColumn
      Width = 99
      BandIndex = 0
      RowIndex = 0
      FieldName = 'NM_PACIENTE'
    end
    object grDadosCD_PACIENTE: TdxDBGridMaskColumn
      Width = 97
      BandIndex = 0
      RowIndex = 0
      FieldName = 'CD_PACIENTE'
    end
    object grDadosCD_AGENDA: TdxDBGridMaskColumn
      Width = 89
      BandIndex = 0
      RowIndex = 0
      FieldName = 'CD_AGENDA'
    end
    object grDadosCD_MAPA: TdxDBGridMaskColumn
      Width = 74
      BandIndex = 0
      RowIndex = 0
      FieldName = 'CD_MAPA'
    end
    object grDadosDT_MAPA: TdxDBGridDateColumn
      Width = 74
      BandIndex = 0
      RowIndex = 0
      FieldName = 'DT_MAPA'
    end
    object grDadosCD_MEDICO: TdxDBGridMaskColumn
      Width = 86
      BandIndex = 0
      RowIndex = 0
      FieldName = 'CD_MEDICO'
    end
  end
  object rgTipo: TRadioGroup
    Left = 32
    Top = 336
    Width = 857
    Height = 41
    Caption = 'Tipo'
    Columns = 4
    Items.Strings = (
      'M'#233'dico'
      'Laborat'#243'rio'
      'Farm'#225'cia'
      'Teste R'#225'pido')
    TabOrder = 3
    OnClick = rgTipoClick
  end
  object btLocMedico: TdxButtonEdit
    Left = 80
    Top = 16
    Width = 65
    TabOrder = 4
    Buttons = <
      item
        Default = True
      end>
    OnButtonClick = btLocMedicoButtonClick
    ExistButtons = True
  end
  object edMedico: TEdit
    Left = 152
    Top = 16
    Width = 345
    Height = 21
    Color = cl3DLight
    TabOrder = 5
  end
  object qyGeral: TIBQuery
    Database = DM.DB
    Transaction = DM.TS
    BufferChunks = 1000
    CachedUpdates = False
    Left = 72
    Top = 112
  end
  object DataSource1: TDataSource
    DataSet = ibMapa
    Left = 40
    Top = 112
  end
  object ibMapa: TIBDataSet
    Database = DM.DB
    Transaction = DM.TS
    BufferChunks = 1000
    CachedUpdates = False
    SelectSQL.Strings = (
      'select MAPA_MEDICO_LINHA.CD_MAPA_LINHA'
      '     , MAPA_MEDICO_LINHA.NR_PROCESSO'
      '     , MAPA_MEDICO_LINHA.NM_PACIENTE'
      '     , MAPA_MEDICO_LINHA.CD_PACIENTE'
      '     , MAPA_MEDICO_LINHA.CD_AGENDA'
      '     , MAPA_MEDICO.CD_MAPA'
      '     , MAPA_MEDICO.DT_MAPA'
      '     , MAPA_MEDICO.CD_MEDICO'
      'from MAPA_MEDICO_LINHA'
      'join MAPA_MEDICO'
      'on MAPA_MEDICO.CD_MAPA = MAPA_MEDICO_LINHA.CD_MAPA')
    ModifySQL.Strings = (
      'update MAPA_MEDICO_LINHA'
      'set CD_PACIENTE = :CD_PACIENTE'
      '     ,CD_AGENDA = :CD_AGENDA'
      'where CD_MAPA_LINHA = :CD_MAPA_LINHA')
    Left = 104
    Top = 112
    object ibMapaCD_MAPA_LINHA: TIntegerField
      FieldName = 'CD_MAPA_LINHA'
      Origin = 'MAPA_MEDICO_LINHA.CD_MAPA_LINHA'
      Required = True
    end
    object ibMapaNR_PROCESSO: TIBStringField
      FieldName = 'NR_PROCESSO'
      Origin = 'MAPA_MEDICO_LINHA.NR_PROCESSO'
      Size = 15
    end
    object ibMapaNM_PACIENTE: TIBStringField
      FieldName = 'NM_PACIENTE'
      Origin = 'MAPA_MEDICO_LINHA.NM_PACIENTE'
      Size = 50
    end
    object ibMapaCD_PACIENTE: TIntegerField
      FieldName = 'CD_PACIENTE'
      Origin = 'MAPA_MEDICO_LINHA.CD_PACIENTE'
    end
    object ibMapaCD_AGENDA: TIntegerField
      FieldName = 'CD_AGENDA'
      Origin = 'MAPA_MEDICO_LINHA.CD_AGENDA'
    end
    object ibMapaCD_MAPA: TIntegerField
      FieldName = 'CD_MAPA'
      Origin = 'MAPA_MEDICO.CD_MAPA'
      Required = True
    end
    object ibMapaDT_MAPA: TDateTimeField
      FieldName = 'DT_MAPA'
      Origin = 'MAPA_MEDICO.DT_MAPA'
    end
    object ibMapaCD_MEDICO: TIntegerField
      FieldName = 'CD_MEDICO'
      Origin = 'MAPA_MEDICO.CD_MEDICO'
    end
  end
end
