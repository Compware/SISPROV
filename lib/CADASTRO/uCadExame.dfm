object frmCadExame: TfrmCadExame
  Left = 36
  Top = 171
  Width = 666
  Height = 451
  Caption = 'Cadastro de Exames'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 658
    Height = 417
    ActivePage = TabSheet1
    Align = alClient
    TabOrder = 0
    object TabSheet1: TTabSheet
      Caption = 'Exames'
      object DBGrid1: TDBGrid
        Left = 0
        Top = 25
        Width = 650
        Height = 97
        Align = alTop
        DataSource = DataSource1
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        Columns = <
          item
            Expanded = False
            FieldName = 'CD_EXAME'
            Title.Caption = 'C'#243'digo'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DS_APELIDO'
            Title.Caption = 'Apelido'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DS_NOME'
            Title.Caption = 'Nome'
            Visible = True
          end>
      end
      object DBRichEdit1: TDBRichEdit
        Left = 0
        Top = 122
        Width = 650
        Height = 267
        Align = alClient
        DataField = 'BL_RESULTADO'
        DataSource = DataSource1
        TabOrder = 1
      end
      object DBNavigator1: TDBNavigator
        Left = 0
        Top = 0
        Width = 650
        Height = 25
        DataSource = DataSource1
        Align = alTop
        TabOrder = 2
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'Tipo Resultados'
      ImageIndex = 1
      object DBGrid3: TDBGrid
        Left = 0
        Top = 25
        Width = 650
        Height = 89
        Align = alTop
        DataSource = DataSource3
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        Columns = <
          item
            Expanded = False
            FieldName = 'CD_TIPO'
            Title.Caption = 'C'#243'digo'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DS_TIPO'
            Title.Caption = 'Descri'#231#227'o'
            Width = 300
            Visible = True
          end>
      end
      object Panel1: TPanel
        Left = 0
        Top = 114
        Width = 650
        Height = 63
        Align = alTop
        TabOrder = 1
        object Label1: TLabel
          Left = 16
          Top = 16
          Width = 21
          Height = 13
          Caption = 'Tipo'
        end
        object RxDBComboBox1: TRxDBComboBox
          Left = 16
          Top = 32
          Width = 145
          Height = 21
          Style = csDropDownList
          DataField = 'FL_TIPO'
          DataSource = DataSource3
          EnableValues = True
          ItemHeight = 13
          Items.Strings = (
            'Lista'
            'Valor')
          TabOrder = 0
          Values.Strings = (
            'L'
            'V')
        end
      end
      object Panel2: TPanel
        Left = 0
        Top = 177
        Width = 650
        Height = 212
        Align = alClient
        Caption = 'Panel2'
        TabOrder = 2
        object Splitter1: TSplitter
          Left = 230
          Top = 1
          Height = 210
        end
        object DBRichEdit2: TDBRichEdit
          Left = 233
          Top = 1
          Width = 416
          Height = 210
          Align = alClient
          DataField = 'BL_RESULTADO'
          DataSource = DataSource3
          TabOrder = 0
        end
        object DBMemo1: TDBMemo
          Left = 1
          Top = 1
          Width = 229
          Height = 210
          Align = alLeft
          DataField = 'VL_LISTA'
          DataSource = DataSource3
          TabOrder = 1
        end
      end
      object DBNavigator2: TDBNavigator
        Left = 0
        Top = 0
        Width = 650
        Height = 25
        DataSource = DataSource3
        Align = alTop
        TabOrder = 3
      end
    end
    object TabSheet3: TTabSheet
      Caption = 'Conf. Exames'
      ImageIndex = 2
      object Label2: TLabel
        Left = 123
        Top = 156
        Width = 32
        Height = 13
        Caption = 'Exame'
      end
      object Label3: TLabel
        Left = 109
        Top = 180
        Width = 48
        Height = 13
        Caption = 'Resultado'
      end
      object Label4: TLabel
        Left = 125
        Top = 203
        Width = 31
        Height = 13
        Caption = 'Ordem'
      end
      object DBGrid2: TDBGrid
        Left = 0
        Top = 25
        Width = 650
        Height = 97
        Align = alTop
        DataSource = DataSource2
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
      end
      object DBNavigator3: TDBNavigator
        Left = 0
        Top = 0
        Width = 650
        Height = 25
        DataSource = DataSource2
        Align = alTop
        TabOrder = 1
      end
      object DBLookupComboBox1: TDBLookupComboBox
        Left = 160
        Top = 152
        Width = 257
        Height = 21
        DataField = 'CD_EXAME'
        DataSource = DataSource2
        KeyField = 'CD_EXAME'
        ListField = 'DS_NOME'
        ListSource = DataSource1
        TabOrder = 2
      end
      object DBLookupComboBox2: TDBLookupComboBox
        Left = 160
        Top = 176
        Width = 257
        Height = 21
        DataField = 'CD_TIPO'
        DataSource = DataSource2
        KeyField = 'CD_TIPO'
        ListField = 'DS_TIPO'
        ListSource = DataSource3
        TabOrder = 3
      end
      object DBEdit1: TDBEdit
        Left = 160
        Top = 200
        Width = 145
        Height = 21
        DataField = 'NR_ORDEM'
        DataSource = DataSource2
        TabOrder = 4
      end
    end
  end
  object TB_EXAME: TIBTable
    Database = DM.DB
    Transaction = DM.TS
    Active = True
    BufferChunks = 1000
    CachedUpdates = False
    FieldDefs = <
      item
        Name = 'CD_EXAME'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'DS_APELIDO'
        DataType = ftString
        Size = 5
      end
      item
        Name = 'DS_NOME'
        DataType = ftString
        Size = 70
      end
      item
        Name = 'BL_RESULTADO'
        DataType = ftBlob
        Size = 8
      end>
    IndexDefs = <
      item
        Name = 'RDB$PRIMARY3'
        Fields = 'CD_EXAME'
        Options = [ixPrimary, ixUnique]
      end>
    StoreDefs = True
    TableName = 'EXAME'
    Left = 248
    Top = 184
  end
  object TB_CONF_EXAME: TIBTable
    Database = DM.DB
    Transaction = DM.TS
    Active = True
    BufferChunks = 1000
    CachedUpdates = False
    FieldDefs = <
      item
        Name = 'CD_EXAME'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'CD_TIPO'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'NR_ORDEM'
        DataType = ftInteger
      end>
    IndexDefs = <
      item
        Name = 'RDB$PRIMARY4'
        Fields = 'CD_EXAME;CD_TIPO'
        Options = [ixPrimary, ixUnique]
      end>
    StoreDefs = True
    TableName = 'CONF_EXAME'
    Left = 248
    Top = 224
  end
  object TB_TIPO_RESULTADO: TIBTable
    Database = DM.DB
    Transaction = DM.TS
    Active = True
    BufferChunks = 1000
    CachedUpdates = False
    FieldDefs = <
      item
        Name = 'CD_TIPO'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'VL_LISTA'
        DataType = ftString
        Size = 1000
      end
      item
        Name = 'BL_RESULTADO'
        DataType = ftBlob
        Size = 8
      end
      item
        Name = 'DS_TIPO'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'FL_TIPO'
        Attributes = [faFixed]
        DataType = ftString
        Size = 1
      end>
    IndexDefs = <
      item
        Name = 'RDB$PRIMARY5'
        Fields = 'CD_TIPO'
        Options = [ixPrimary, ixUnique]
      end>
    StoreDefs = True
    TableName = 'TIPO_RESULTADO'
    Left = 248
    Top = 144
  end
  object DataSource1: TDataSource
    DataSet = TB_EXAME
    Left = 208
    Top = 184
  end
  object DataSource2: TDataSource
    DataSet = TB_CONF_EXAME
    Left = 208
    Top = 224
  end
  object DataSource3: TDataSource
    DataSet = TB_TIPO_RESULTADO
    Left = 208
    Top = 144
  end
end
