object frmContraSenha: TfrmContraSenha
  Left = 335
  Top = 264
  Width = 345
  Height = 227
  Caption = 'Contra Senha'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel1: TBevel
    Left = 16
    Top = 48
    Width = 313
    Height = 41
  end
  object Label1: TLabel
    Left = 14
    Top = 19
    Width = 34
    Height = 13
    Caption = 'Senha:'
  end
  object lbContraSenha: TLabel
    Left = 24
    Top = 56
    Width = 7
    Height = 24
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lbSerial: TLabel
    Left = 72
    Top = 136
    Width = 66
    Height = 13
    Caption = 'Numero Serial'
  end
  object edSenha: TEdit
    Left = 56
    Top = 16
    Width = 169
    Height = 21
    TabOrder = 0
  end
  object btGerar: TButton
    Left = 232
    Top = 16
    Width = 75
    Height = 25
    Caption = 'Gerar'
    TabOrder = 1
    OnClick = btGerarClick
  end
  object DriveComboBox1: TDriveComboBox
    Left = 72
    Top = 104
    Width = 145
    Height = 19
    TabOrder = 2
    OnChange = DriveComboBox1Change
  end
end
