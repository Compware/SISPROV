object frmRelSerieCronologica: TfrmRelSerieCronologica
  Left = 277
  Top = 252
  Width = 955
  Height = 390
  Caption = 'S'#233'rie Cronol'#243'gica'
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
  object lbProvincia: TLabel
    Left = 16
    Top = 8
    Width = 72
    Height = 13
    Caption = 'PROVINCIA:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object TabControl1: TTabControl
    Left = 8
    Top = 32
    Width = 929
    Height = 313
    TabOrder = 0
    TabPosition = tpBottom
    Tabs.Strings = (
      'Total'
      '1'
      '2'
      '3'
      '4'
      '5'
      '6'
      '7'
      '8'
      '9'
      '10'
      '11'
      '12'
      '13'
      '14'
      '15'
      '16'
      '17'
      '18')
    TabIndex = 0
    OnChange = TabControl1Change
    object sgDados: TStringGrid
      Left = 4
      Top = 45
      Width = 921
      Height = 246
      Align = alClient
      Options = [goVertLine, goHorzLine, goRangeSelect, goEditing]
      ScrollBars = ssNone
      TabOrder = 0
      OnDrawCell = sgDadosDrawCell
    end
    object ScrollBox1: TScrollBox
      Left = 4
      Top = 4
      Width = 921
      Height = 41
      HorzScrollBar.Visible = False
      VertScrollBar.Visible = False
      Align = alTop
      TabOrder = 1
      object Panel1: TPanel
        Left = 16
        Top = 8
        Width = 905
        Height = 24
        TabOrder = 0
        object Label1: TLabel
          Left = -43
          Top = 11
          Width = 582
          Height = 13
          Caption = 
            '................................................................' +
            '............,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,' +
            ',,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,' +
            ',,'
        end
      end
    end
  end
  object Button1: TButton
    Left = 344
    Top = 3
    Width = 75
    Height = 25
    Caption = 'Pesquisar'
    TabOrder = 1
    OnClick = Button1Click
  end
  object ScrollBar1: TScrollBar
    Left = 448
    Top = 8
    Width = 409
    Height = 17
    PageSize = 0
    TabOrder = 2
    OnScroll = ScrollBar1Scroll
  end
  object Button2: TButton
    Left = 264
    Top = 4
    Width = 75
    Height = 25
    Caption = 'Button2'
    TabOrder = 3
    OnClick = Button2Click
  end
  object qyDados: TIBQuery
    Database = DM.DB
    Transaction = DM.TS
    BufferChunks = 1000
    CachedUpdates = False
    Left = 368
    Top = 88
  end
end
