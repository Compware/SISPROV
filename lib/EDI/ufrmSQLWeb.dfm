object frmSQL: TfrmSQL
  Left = 123
  Top = 152
  Width = 512
  Height = 386
  Caption = 'SQL'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter1: TSplitter
    Left = 0
    Top = 122
    Width = 504
    Height = 3
    Cursor = crVSplit
    Align = alTop
  end
  object mmSQL: TMemo
    Left = 0
    Top = 33
    Width = 504
    Height = 89
    Align = alTop
    TabOrder = 0
  end
  object web: TWebBrowser
    Left = 0
    Top = 125
    Width = 504
    Height = 227
    Align = alClient
    TabOrder = 1
    ControlData = {
      4C00000017340000761700000000000000000000000000000000000000000000
      000000004C000000000000000000000001000000E0D057007335CF11AE690800
      2B2E126208000000000000004C0000000114020000000000C000000000000046
      8000000000000000000000000000000000000000000000000000000000000000
      00000000000000000100000000000000000000000000000000000000}
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 504
    Height = 33
    Align = alTop
    TabOrder = 2
    object btExecutar: TBitBtn
      Left = 6
      Top = 5
      Width = 75
      Height = 25
      Caption = 'Executar'
      TabOrder = 0
      OnClick = btExecutarClick
    end
    object rbSelect: TRadioButton
      Left = 112
      Top = 8
      Width = 55
      Height = 17
      Caption = 'Select'
      TabOrder = 1
    end
    object rbQuery: TRadioButton
      Left = 176
      Top = 8
      Width = 129
      Height = 17
      Caption = 'Insert/Update/Delete'
      TabOrder = 2
    end
  end
end
