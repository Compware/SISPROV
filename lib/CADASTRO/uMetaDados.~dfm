object frmMetaDados: TfrmMetaDados
  Left = 411
  Top = 115
  Width = 716
  Height = 502
  Caption = 'Gerenciamento Banco de Dados'
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
  object Splitter2: TSplitter
    Left = 273
    Top = 0
    Width = 2
    Height = 468
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 273
    Height = 468
    Align = alLeft
    Caption = 'Panel1'
    TabOrder = 0
    object PageControl1: TPageControl
      Left = 1
      Top = 57
      Width = 271
      Height = 335
      ActivePage = TabSheet1
      Align = alClient
      TabOrder = 0
      object TabSheet1: TTabSheet
        Caption = 'Itens'
        object lsScripts: TListBox
          Left = 0
          Top = 0
          Width = 263
          Height = 307
          Align = alClient
          ItemHeight = 13
          TabOrder = 0
          OnClick = lsScriptsClick
        end
      end
      object TabSheet2: TTabSheet
        Caption = 'Outros'
        ImageIndex = 1
        object DBGrid1: TDBGrid
          Left = 0
          Top = 0
          Width = 263
          Height = 307
          Align = alClient
          DataSource = DataSource1
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
        end
      end
    end
    object Panel3: TPanel
      Left = 1
      Top = 392
      Width = 271
      Height = 75
      Align = alBottom
      TabOrder = 1
      object btLog: TSpeedButton
        Left = 168
        Top = 9
        Width = 29
        Height = 26
        Hint = 'Salvar LOG'
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000130B0000130B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333330070
          7700333333337777777733333333008088003333333377F73377333333330088
          88003333333377FFFF7733333333000000003FFFFFFF77777777000000000000
          000077777777777777770FFFFFFF0FFFFFF07F3333337F3333370FFFFFFF0FFF
          FFF07F3FF3FF7FFFFFF70F00F0080CCC9CC07F773773777777770FFFFFFFF039
          99337F3FFFF3F7F777F30F0000F0F09999937F7777373777777F0FFFFFFFF999
          99997F3FF3FFF77777770F00F000003999337F773777773777F30FFFF0FF0339
          99337F3FF7F3733777F30F08F0F0337999337F7737F73F7777330FFFF0039999
          93337FFFF7737777733300000033333333337777773333333333}
        NumGlyphs = 2
        OnClick = btLogClick
      end
      object btExecutar: TButton
        Left = 8
        Top = 10
        Width = 75
        Height = 25
        Caption = 'Executar'
        TabOrder = 0
        OnClick = btExecutarClick
      end
      object Button1: TButton
        Left = 8
        Top = 42
        Width = 75
        Height = 25
        Caption = 'Commit'
        TabOrder = 1
        OnClick = Button1Click
      end
      object btTodos: TButton
        Left = 88
        Top = 10
        Width = 75
        Height = 25
        Caption = 'Todos'
        TabOrder = 2
        OnClick = btTodosClick
      end
      object Button2: TButton
        Left = 88
        Top = 42
        Width = 75
        Height = 25
        Caption = 'Roolback'
        TabOrder = 3
        OnClick = Button2Click
      end
      object ckTodos: TCheckBox
        Left = 208
        Top = 48
        Width = 54
        Height = 17
        Caption = 'Todos'
        Checked = True
        State = cbChecked
        TabOrder = 4
      end
      object ckID: TCheckBox
        Left = 208
        Top = 16
        Width = 55
        Height = 17
        Caption = 'Ck ID'
        Checked = True
        State = cbChecked
        TabOrder = 5
      end
    end
    object Panel4: TPanel
      Left = 1
      Top = 1
      Width = 271
      Height = 56
      Align = alTop
      TabOrder = 2
      object Label1: TLabel
        Left = 8
        Top = 8
        Width = 33
        Height = 13
        Caption = 'Vers'#227'o'
      end
      object cbVersao: TComboBox
        Left = 8
        Top = 24
        Width = 185
        Height = 21
        ItemHeight = 13
        TabOrder = 0
        OnChange = cbVersaoChange
        Items.Strings = (
          '2.0.1-07')
      end
    end
  end
  object Panel2: TPanel
    Left = 275
    Top = 0
    Width = 433
    Height = 468
    Align = alClient
    Caption = 'Panel2'
    TabOrder = 1
    object Splitter1: TSplitter
      Left = 1
      Top = 311
      Width = 431
      Height = 3
      Cursor = crVSplit
      Align = alBottom
    end
    object mLog: TMemo
      Left = 1
      Top = 314
      Width = 431
      Height = 153
      Align = alBottom
      TabOrder = 0
    end
    object mSQL: TMemo
      Left = 1
      Top = 1
      Width = 431
      Height = 310
      Align = alClient
      TabOrder = 1
    end
  end
  object IBSQL: TIBSQL
    Database = DM.DB
    ParamCheck = True
    Transaction = DM.TS
    Left = 313
    Top = 112
  end
  object SaveDialog1: TSaveDialog
    Left = 353
    Top = 112
  end
  object IBQ: TIBQuery
    Database = DM.DB
    Transaction = DM.TS
    AfterScroll = IBQAfterScroll
    BufferChunks = 1000
    CachedUpdates = False
    Left = 313
    Top = 152
  end
  object DataSource1: TDataSource
    DataSet = IBQ
    Left = 313
    Top = 184
  end
  object IBQ2: TIBQuery
    Database = DM.DB
    Transaction = DM.TS
    BufferChunks = 1000
    CachedUpdates = False
    Left = 403
    Top = 160
  end
  object tbDe: TIBDataSet
    Database = DM.DB
    Transaction = DM.TS
    BufferChunks = 1000
    CachedUpdates = False
    Left = 344
    Top = 240
  end
  object tbPara: TIBDataSet
    Database = DM.DB
    Transaction = DM.TS
    BufferChunks = 1000
    CachedUpdates = False
    Left = 384
    Top = 240
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
      'and c.rdb$index_name = i.rdb$index_name'
      'UNION'
      'select rdb$field_name NM_CAMPO'
      'from RDB$INDICES c,'
      '     rdb$index_segments i'
      'where c.rdb$relation_name = :NM_TABELA'
      'and c.RDB$UNIQUE_FLAG = 1'
      'and c.rdb$index_name = i.rdb$index_name')
    Left = 416
    Top = 240
    ParamData = <
      item
        DataType = ftString
        Name = 'NM_TABELA'
        ParamType = ptInput
      end
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
end
