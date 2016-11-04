object frmSenha: TfrmSenha
  Left = 290
  Top = 255
  Width = 208
  Height = 123
  Caption = 'Senha'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 16
    Top = 20
    Width = 34
    Height = 13
    Caption = 'Senha:'
  end
  object edSenha: TEdit
    Left = 56
    Top = 16
    Width = 121
    Height = 21
    PasswordChar = '*'
    TabOrder = 0
  end
  object btConfirmar: TButton
    Left = 64
    Top = 48
    Width = 75
    Height = 25
    Caption = 'Confirmar'
    TabOrder = 1
    OnClick = btConfirmarClick
  end
end
