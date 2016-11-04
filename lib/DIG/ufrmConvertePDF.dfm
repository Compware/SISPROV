object frmConvertePDF: TfrmConvertePDF
  Left = 400
  Top = 167
  Width = 366
  Height = 347
  Caption = 'Converte RTF para PDF'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object btn1: TButton
    Left = 44
    Top = 14
    Width = 75
    Height = 25
    Caption = 'btn1'
    TabOrder = 0
    OnClick = btn1Click
  end
  object btn2: TButton
    Left = 44
    Top = 46
    Width = 75
    Height = 25
    Caption = 'btn2'
    TabOrder = 1
    OnClick = btn2Click
  end
  object btn4: TButton
    Left = 130
    Top = 48
    Width = 75
    Height = 25
    Caption = 'btn4'
    TabOrder = 2
    OnClick = btn4Click
  end
  object btn5: TButton
    Left = 214
    Top = 16
    Width = 75
    Height = 25
    Caption = 'btn5'
    TabOrder = 3
    OnClick = btn5Click
  end
  object btn6: TButton
    Left = 212
    Top = 46
    Width = 75
    Height = 25
    Caption = 'btn6'
    TabOrder = 4
    OnClick = btn6Click
  end
  object btn7: TButton
    Left = 130
    Top = 14
    Width = 75
    Height = 25
    Caption = 'btn7'
    TabOrder = 5
    OnClick = btn7Click
  end
  object pdf: TspWPViewPDFCompatible
    Left = 40
    Top = 82
    Width = 291
    Height = 213
    TabOrder = 6
    ShowPageFrame = False
    ShowPageShadow = False
  end
end
