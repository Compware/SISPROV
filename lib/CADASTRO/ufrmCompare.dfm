object frmCompare: TfrmCompare
  Left = 178
  Top = 53
  Width = 958
  Height = 471
  Caption = 'Comparar'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter1: TSplitter
    Left = 553
    Top = 0
    Width = 5
    Height = 437
  end
  object pnEsquerda: TPanel
    Left = 0
    Top = 0
    Width = 553
    Height = 437
    Align = alLeft
    TabOrder = 0
    object sbEsquerda: TScrollBox
      Left = 1
      Top = 25
      Width = 551
      Height = 411
      HorzScrollBar.Visible = False
      VertScrollBar.Visible = False
      Align = alClient
      TabOrder = 0
      OnResize = sbEsquerdaResize
    end
    object Panel1: TPanel
      Left = 1
      Top = 1
      Width = 551
      Height = 24
      Align = alTop
      Caption = 'Existente'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 8404992
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
    end
  end
  object pnDireita: TPanel
    Left = 558
    Top = 0
    Width = 392
    Height = 437
    Align = alClient
    TabOrder = 1
    object sbDireita: TScrollBox
      Left = 1
      Top = 25
      Width = 390
      Height = 411
      HorzScrollBar.Visible = False
      VertScrollBar.Visible = False
      Align = alClient
      AutoScroll = False
      TabOrder = 0
      OnResize = sbDireitaResize
    end
    object Panel2: TPanel
      Left = 1
      Top = 1
      Width = 390
      Height = 24
      Align = alTop
      Caption = 'Recebido'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 8404992
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
    end
  end
end
