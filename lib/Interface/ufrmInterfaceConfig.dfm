object frmInterfaceConfig: TfrmInterfaceConfig
  Left = 172
  Top = 171
  Width = 489
  Height = 384
  Caption = 'Configura'#231#227'o'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox
    Left = 8
    Top = 8
    Width = 209
    Height = 58
    Caption = 'Abacus'
    TabOrder = 0
    object shPortaAbacus: TShape
      Left = 10
      Top = 19
      Width = 34
      Height = 30
      Brush.Color = clRed
      Shape = stCircle
    end
    object lbPortaAbacus: TLabel
      Left = 48
      Top = 29
      Width = 25
      Height = 13
      Caption = 'Porta'
    end
    object btConfigurarAbacus: TButton
      Left = 133
      Top = 21
      Width = 71
      Height = 28
      Caption = 'Configurar'
      TabOrder = 0
      OnClick = btConfigurarAbacusClick
    end
  end
  object GroupBox2: TGroupBox
    Left = 8
    Top = 72
    Width = 209
    Height = 58
    Caption = 'Kx21'
    TabOrder = 1
    object shPortaKx21: TShape
      Left = 10
      Top = 19
      Width = 34
      Height = 30
      Brush.Color = clRed
      Shape = stCircle
    end
    object lbPortaKx21: TLabel
      Left = 48
      Top = 29
      Width = 25
      Height = 13
      Caption = 'Porta'
    end
    object btConfigurarKx21: TButton
      Left = 133
      Top = 21
      Width = 71
      Height = 28
      Caption = 'Configurar'
      TabOrder = 0
      OnClick = btConfigurarKx21Click
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 264
    Width = 481
    Height = 86
    Align = alBottom
    Caption = 'Panel1'
    TabOrder = 2
    object Splitter1: TSplitter
      Left = 225
      Top = 1
      Height = 84
    end
    object mmLog: TMemo
      Left = 1
      Top = 1
      Width = 224
      Height = 84
      Align = alLeft
      TabOrder = 0
    end
    object mmLog2: TMemo
      Left = 228
      Top = 1
      Width = 252
      Height = 84
      Align = alClient
      TabOrder = 1
    end
  end
  object ComPortAbacus: TComPort
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
    OnAfterOpen = ComPortAbacusAfterOpen
    OnAfterClose = ComPortAbacusAfterClose
    OnRxChar = ComPortAbacusRxChar
    Left = 98
    Top = 26
  end
  object ComPortKx21: TComPort
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
    OnAfterOpen = ComPortKx21AfterOpen
    OnAfterClose = ComPortKx21AfterClose
    OnRxChar = ComPortKx21RxChar
    Left = 98
    Top = 90
  end
end
