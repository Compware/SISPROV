object frmLogSQL: TfrmLogSQL
  Left = 385
  Top = 190
  Width = 497
  Height = 353
  Caption = 'Log SQL'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object mmLog: TMemo
    Left = 0
    Top = 0
    Width = 489
    Height = 278
    Align = alClient
    TabOrder = 0
  end
  object Panel1: TPanel
    Left = 0
    Top = 278
    Width = 489
    Height = 41
    Align = alBottom
    TabOrder = 1
    object btLimpar: TButton
      Left = 168
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Limpar'
      TabOrder = 0
      OnClick = btLimparClick
    end
  end
end
