object frmInterfaceDePara: TfrmInterfaceDePara
  Left = 96
  Top = 176
  Width = 545
  Height = 398
  Caption = 'De Para'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object memDE: TMemo
    Left = 8
    Top = 8
    Width = 257
    Height = 297
    TabOrder = 0
  end
  object memPARA: TMemo
    Left = 272
    Top = 8
    Width = 257
    Height = 297
    TabOrder = 1
  end
  object btConfigDE: TButton
    Left = 192
    Top = 312
    Width = 75
    Height = 25
    Caption = 'Configurar'
    TabOrder = 2
    OnClick = btConfigDEClick
  end
  object btConfPARA: TButton
    Left = 456
    Top = 312
    Width = 75
    Height = 25
    Caption = 'Configurar'
    TabOrder = 3
    OnClick = btConfPARAClick
  end
  object btAbrirDE: TButton
    Left = 112
    Top = 312
    Width = 75
    Height = 25
    Caption = 'Abrir'
    TabOrder = 4
  end
  object btAbrirPARA: TButton
    Left = 376
    Top = 312
    Width = 75
    Height = 25
    Caption = 'Abrir'
    TabOrder = 5
  end
  object ComPortDE: TComPort
    BaudRate = br9600
    Port = 'COM1'
    Parity.Bits = prNone
    StopBits = sbOneStopBit
    DataBits = dbEight
    Events = [evRxChar, evTxEmpty, evRxFlag, evRing, evBreak, evCTS, evDSR, evError, evRLSD, evRx80Full]
    FlowControl.OutCTSFlow = False
    FlowControl.OutDSRFlow = False
    FlowControl.ControlDTR = dtrDisable
    FlowControl.ControlRTS = rtsDisable
    FlowControl.XonXoffOut = False
    FlowControl.XonXoffIn = False
    OnRxChar = ComPortDERxChar
    Left = 88
    Top = 16
  end
  object ComPortPARA: TComPort
    BaudRate = br9600
    Port = 'COM1'
    Parity.Bits = prNone
    StopBits = sbOneStopBit
    DataBits = dbEight
    Events = [evRxChar, evTxEmpty, evRxFlag, evRing, evBreak, evCTS, evDSR, evError, evRLSD, evRx80Full]
    FlowControl.OutCTSFlow = False
    FlowControl.OutDSRFlow = False
    FlowControl.ControlDTR = dtrDisable
    FlowControl.ControlRTS = rtsDisable
    FlowControl.XonXoffOut = False
    FlowControl.XonXoffIn = False
    OnRxChar = ComPortPARARxChar
    Left = 88
    Top = 56
  end
end
