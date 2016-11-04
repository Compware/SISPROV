object frmConvertePDFJPG: TfrmConvertePDFJPG
  Left = 8
  Top = 121
  Width = 725
  Height = 502
  Caption = 'Converte PDF => JPG => TXT'
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
  object lsArquivos: TFileListBox
    Left = 552
    Top = 16
    Width = 145
    Height = 281
    ItemHeight = 13
    Mask = '*.pdf'
    TabOrder = 0
  end
  object ScrollBox1: TScrollBox
    Left = 291
    Top = 15
    Width = 257
    Height = 313
    TabOrder = 1
    object Image1: TImage
      Left = 8
      Top = 4
      Width = 105
      Height = 105
    end
  end
  object spViewPDF1: TspWPViewPDFCompatible
    Left = 16
    Top = 16
    Width = 273
    Height = 313
    TabOrder = 2
    ShowPageFrame = False
    ShowPageShadow = False
  end
  object btConverter: TBitBtn
    Left = 624
    Top = 304
    Width = 75
    Height = 25
    Caption = 'Converter'
    TabOrder = 3
    OnClick = btConverterClick
  end
  object mmArquivo: TMemo
    Left = 16
    Top = 336
    Width = 681
    Height = 112
    TabOrder = 4
    WordWrap = False
  end
  object ProgressBar1: TProgressBar
    Left = 0
    Top = 451
    Width = 717
    Height = 17
    Align = alBottom
    TabOrder = 5
  end
  object Timer1: TTimer
    Interval = 5000
    OnTimer = Timer1Timer
    Left = 136
    Top = 344
  end
end
