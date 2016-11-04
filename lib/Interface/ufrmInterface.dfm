object frmInterface: TfrmInterface
  Left = 4
  Top = 115
  Width = 974
  Height = 534
  Caption = 'Interfaces - Compware'
  Color = clWhite
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  WindowState = wsMaximized
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 162
    Height = 500
    Align = alLeft
    ParentColor = True
    TabOrder = 0
    object lbPentra80: TLabel
      Left = 8
      Top = 192
      Width = 79
      Height = 20
      Cursor = crHandPoint
      Caption = 'Pentra 80'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold, fsUnderline]
      ParentColor = False
      ParentFont = False
      OnClick = lbPentra80Click
    end
    object lbKX21: TLabel
      Left = 8
      Top = 216
      Width = 54
      Height = 20
      Cursor = crHandPoint
      Caption = 'KX21n'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold, fsUnderline]
      ParentColor = False
      ParentFont = False
      OnClick = lbKX21Click
    end
    object lbAbacus: TLabel
      Left = 8
      Top = 240
      Width = 61
      Height = 20
      Cursor = crHandPoint
      Caption = 'Abacus'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold, fsUnderline]
      ParentColor = False
      ParentFont = False
      OnClick = lbAbacusClick
    end
    object lbConfigurar: TLabel
      Left = 8
      Top = 360
      Width = 142
      Height = 20
      Cursor = crHandPoint
      Caption = 'Configurar Portas'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold, fsUnderline]
      ParentColor = False
      ParentFont = False
      OnClick = lbConfigurarClick
    end
    object lbFacscount: TLabel
      Left = 8
      Top = 264
      Width = 88
      Height = 20
      Cursor = crHandPoint
      Caption = 'FacsCount'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold, fsUnderline]
      ParentColor = False
      ParentFont = False
      OnClick = lbFacscountClick
    end
    object imMaquina: TImage
      Left = 1
      Top = 1
      Width = 160
      Height = 160
      Align = alTop
      Center = True
    end
    object lbXT8000: TLabel
      Left = 8
      Top = 288
      Width = 63
      Height = 20
      Cursor = crHandPoint
      Caption = 'XT8000'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold, fsUnderline]
      ParentColor = False
      ParentFont = False
      OnClick = lbXT8000Click
    end
  end
  object sbConteudo: TScrollBox
    Left = 162
    Top = 0
    Width = 804
    Height = 500
    Align = alClient
    TabOrder = 1
  end
end
