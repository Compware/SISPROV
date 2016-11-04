object frmViewDash: TfrmViewDash
  Left = 140
  Top = 126
  Width = 818
  Height = 469
  Caption = 'BI - DashBoard'#39's'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter1: TSplitter
    Left = 377
    Top = 28
    Height = 407
  end
  object scrEsquerda: TScrollBox
    Left = 0
    Top = 28
    Width = 377
    Height = 407
    VertScrollBar.Style = ssFlat
    Align = alLeft
    Color = clWhite
    ParentColor = False
    TabOrder = 0
  end
  object scrDireita: TScrollBox
    Left = 380
    Top = 28
    Width = 430
    Height = 407
    Align = alClient
    Color = clWhite
    ParentColor = False
    TabOrder = 1
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 810
    Height = 28
    Align = alTop
    TabOrder = 2
    object btPainelDireito: TSpeedButton
      Left = 1
      Top = 3
      Width = 23
      Height = 22
      Hint = 'Oculta/Apresenta - Painel Direito'
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        33333FFFFFFFFFFFFFFF000000000000000077777777777777770FFFFFFFFFFF
        FFF07F3FF3FF3FFF3FF70F00F00F000F00F07F773773777377370FFFFFFFFFFF
        FFF07F3FF3FF33FFFFF70F00F00FF00000F07F773773377777F70FEEEEEFF0F9
        FCF07F33333337F7F7F70FFFFFFFF0F9FCF07F3FFFF337F737F70F0000FFF0FF
        FCF07F7777F337F337370F0000FFF0FFFFF07F777733373333370FFFFFFFFFFF
        FFF07FFFFFFFFFFFFFF70CCCCCCCCCCCCCC07777777777777777088CCCCCCCCC
        C880733777777777733700000000000000007777777777777777333333333333
        3333333333333333333333333333333333333333333333333333}
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
    end
  end
  object qyDash: TIBQuery
    Database = DM.DB
    Transaction = DM.TS
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select CD_DASHBOARD, NM_DASHBOARD '
      'from DASHBOARD'
      'where  (CD_DASHBOARD = :CODIGO OR :CODIGO = 0)'
      'and TP_DASHBOARD = 3'
      'order by 1')
    Left = 544
    Top = 48
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'CODIGO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CODIGO'
        ParamType = ptUnknown
      end>
    object qyDashCD_DASHBOARD: TIntegerField
      FieldName = 'CD_DASHBOARD'
      Origin = 'DASHBOARD.CD_DASHBOARD'
      Required = True
    end
    object qyDashNM_DASHBOARD: TIBStringField
      FieldName = 'NM_DASHBOARD'
      Origin = 'DASHBOARD.NM_DASHBOARD'
      Required = True
      Size = 100
    end
  end
end
