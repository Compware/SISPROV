object frmDlgInfoDoc: TfrmDlgInfoDoc
  Left = 396
  Top = 172
  Width = 314
  Height = 369
  Caption = 'Informa'#231#227'o'
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
    Left = 8
    Top = 64
    Width = 29
    Height = 13
    Caption = 'Grupo'
  end
  object rgDocumento: TRadioGroup
    Left = 8
    Top = 8
    Width = 289
    Height = 49
    Caption = 'Novo Documento'
    TabOrder = 0
  end
  object rbVazio: TRadioButton
    Left = 24
    Top = 32
    Width = 113
    Height = 17
    Caption = 'Vazio'
    TabOrder = 1
    OnClick = rbModeloClick
  end
  object rbModelo: TRadioButton
    Left = 144
    Top = 32
    Width = 113
    Height = 17
    Caption = 'Modelo'
    TabOrder = 2
    OnClick = rbModeloClick
  end
  object grDados: TdxDBGrid
    Left = 8
    Top = 88
    Width = 289
    Height = 209
    Bands = <
      item
      end>
    DefaultLayout = True
    HeaderPanelRowCount = 1
    KeyField = 'CD_MODELO'
    SummaryGroups = <>
    SummarySeparator = ', '
    BorderStyle = bsNone
    TabOrder = 3
    DataSource = dsModelo
    Filter.Criteria = {00000000}
    OptionsBehavior = [edgoAutoSort, edgoDragScroll, edgoEditing, edgoEnterShowEditor, edgoImmediateEditor, edgoStoreToIniFile, edgoTabThrough, edgoVertThrough]
    OptionsView = [edgoBandHeaderWidth, edgoRowSelect, edgoUseBitmap]
    object grDadosColumn2: TdxDBGridColumn
      Caption = 'C'#243'digo'
      Width = 59
      BandIndex = 0
      RowIndex = 0
      FieldName = 'CD_MODELO'
    end
    object grDadosColumn1: TdxDBGridColumn
      Caption = 'Modelo'
      Width = 202
      BandIndex = 0
      RowIndex = 0
      FieldName = 'DS_MODELO'
    end
  end
  object btSelecionar: TBitBtn
    Left = 16
    Top = 304
    Width = 81
    Height = 25
    Caption = 'Selecionar'
    TabOrder = 4
    OnClick = btSelecionarClick
    Kind = bkOK
  end
  object btCancelar: TBitBtn
    Left = 97
    Top = 304
    Width = 81
    Height = 25
    Caption = 'Cancelar'
    TabOrder = 5
    Kind = bkCancel
  end
  object DBLookupComboBox1: TDBLookupComboBox
    Left = 48
    Top = 60
    Width = 249
    Height = 21
    KeyField = 'CD_GRUPO'
    ListField = 'DS_GRUPO'
    ListSource = dsGrupo
    TabOrder = 6
  end
  object qyModelo: TIBQuery
    Database = dmDIG.dbDig
    Transaction = dmDIG.tsDig
    BufferChunks = 1000
    CachedUpdates = False
    DataSource = dsGrupo
    SQL.Strings = (
      
        'select CD_DOCUMENTO, CD_GRUPO, CD_MODELO, DS_MODELO from MODELO_' +
        'DOCUMENTO'
      'where CD_GRUPO = :CD_GRUPO')
    Left = 200
    Top = 176
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'CD_GRUPO'
        ParamType = ptUnknown
      end>
    object qyModeloCD_DOCUMENTO: TIntegerField
      FieldName = 'CD_DOCUMENTO'
      Origin = 'MODELO_DOCUMENTO.CD_DOCUMENTO'
    end
    object qyModeloCD_GRUPO: TIntegerField
      FieldName = 'CD_GRUPO'
      Origin = 'MODELO_DOCUMENTO.CD_GRUPO'
    end
    object qyModeloCD_MODELO: TIntegerField
      FieldName = 'CD_MODELO'
      Origin = 'MODELO_DOCUMENTO.CD_MODELO'
      Required = True
    end
    object qyModeloDS_MODELO: TIBStringField
      FieldName = 'DS_MODELO'
      Origin = 'MODELO_DOCUMENTO.DS_MODELO'
      Size = 60
    end
  end
  object qyGrupo: TIBQuery
    Database = dmDIG.dbDig
    Transaction = dmDIG.tsDig
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select CD_GRUPO, DS_GRUPO from DIG_GRUPO_MODELO')
    Left = 200
    Top = 144
    object qyGrupoCD_GRUPO: TIntegerField
      FieldName = 'CD_GRUPO'
      Origin = 'DIG_GRUPO_MODELO.CD_GRUPO'
      Required = True
    end
    object qyGrupoDS_GRUPO: TIBStringField
      FieldName = 'DS_GRUPO'
      Origin = 'DIG_GRUPO_MODELO.DS_GRUPO'
      Required = True
      Size = 50
    end
  end
  object dsGrupo: TDataSource
    DataSet = qyGrupo
    Left = 232
    Top = 144
  end
  object dsModelo: TDataSource
    DataSet = qyModelo
    Left = 232
    Top = 176
  end
end
