object frmLocAgendamento: TfrmLocAgendamento
  Left = 323
  Top = 172
  Width = 436
  Height = 358
  BorderIcons = [biSystemMenu]
  Caption = 'Localizar Agendamento'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 428
    Height = 283
    Align = alClient
    TabOrder = 0
    object GroupBox3: TGroupBox
      Left = 11
      Top = 185
      Width = 411
      Height = 65
      Caption = 'Per'#237'odo'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Courier New'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      object Label5: TLabel
        Left = 8
        Top = 17
        Width = 48
        Height = 16
        Caption = 'Inicio'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Courier New'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label8: TLabel
        Left = 192
        Top = 17
        Width = 40
        Height = 16
        Caption = 'Final'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Courier New'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object dtde: TdxDateEdit
        Left = 8
        Top = 35
        Width = 167
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Style.BorderColor = clBlack
        Style.BorderStyle = xbsSingle
        Style.ButtonStyle = btsHotFlat
        Style.HotTrack = False
        Style.Shadow = False
        TabOrder = 0
        Date = -700000.000000000000000000
        UseEditMask = True
        StoredValues = 4
      end
      object dtate: TdxDateEdit
        Left = 192
        Top = 35
        Width = 168
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Style.BorderColor = clBlack
        Style.BorderStyle = xbsSingle
        Style.ButtonStyle = btsHotFlat
        Style.HotTrack = False
        Style.Shadow = False
        TabOrder = 1
        Date = -700000.000000000000000000
        UseEditMask = True
        StoredValues = 4
      end
    end
    object GroupBox1: TGroupBox
      Left = 11
      Top = 6
      Width = 410
      Height = 176
      Caption = 'Medico / Utente'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      object Label3: TLabel
        Left = 11
        Top = 17
        Width = 71
        Height = 13
        Caption = 'Atendimento'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label4: TLabel
        Left = 11
        Top = 57
        Width = 39
        Height = 13
        Caption = 'Utente'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label1: TLabel
        Left = 11
        Top = 97
        Width = 70
        Height = 13
        Caption = 'Nr Processo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label2: TLabel
        Left = 11
        Top = 134
        Width = 142
        Height = 13
        Caption = 'Nr Processo Crian'#231'a Exp'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object btLocMedico: TdxButtonEdit
        Left = 12
        Top = 33
        Width = 62
        TabOrder = 0
        OnExit = btLocMedicoExit
        OnChange = btLocMedicoChange
        Buttons = <
          item
            Default = True
            Glyph.Data = {
              36050000424D3605000000000000360400002800000010000000100000000100
              0800000000000001000000000000000000000001000000000000D4600600E06A
              0600AB500B00481C11006A381100AB58110060311600B66A1600A1502A00A158
              31007B583800484040007B584000584848007B58480098734800605850006A58
              5000735850007B6050008F6A50007B50580084505800845858006A6058007360
              5800CA7B58008F6A6000AB7B6A00AB846A00E0AB6A00737373007B7373008F73
              7300A1847B00AB987B00EAB67B0084848400CAAB8400EAC08400F4CA84008F8F
              8F0098988F00CAAB8F00CAB68F00E0B68F00D4C08F00EAC08F00EACA8F00A198
              9800CAAB9800D4B69800D4C09800D4CA9800E0CA9800EAD49800487BA1008F98
              A100A1A1A100ABA1A100F4EAA100ABA1AB00B6A1AB00ABABAB00C0ABAB00B6B6
              AB00CAB6AB00D4D4AB00E0D4AB00E0E0AB00EAE0AB00FFEAAB0084A1B600D4C0
              B600D4E0B600F4F4B600506AC000B6B6C000D4E0C000F4F4C000FFFFC000586A
              CA0073ABCA0098B6CA00B6B6CA00B6C0CA00C0C0CA00EAF4CA005073D400607B
              D400ABCAD400B6CAD400B6D4D400C0D4D400D4E0D400EAF4D400B6CAE000C0CA
              E000C0D4E000C0E0E000E0E0E000C0E0EA00FFFFEA00CAEAF400D4F4F400EAF4
              F400FF00FF0016A1FF002AA1FF0023ABFF008FE0FF00C0EAFF00CAEAFF00CAF4
              FF00D4F4FF00E0F4FF00D4FFFF00E0FFFF00F4FFFF00FFFFFF00000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              00000000000000000000000000000000000000000000000000006A3A102A6A6A
              6A6A6A6A6A6A6A6A6A6A3A535916256A6A6A6A6A6A6A6A6A6A6A6A6E6C511729
              6A6A6A6A6A6A6A6A6A6A6A6A6E6D58153F6A6A6A6A6A6A6A6A6A6A6A6A386B4C
              0B2011190D1F6A6A6A6A6A09090852481C476677771B031A066A6A2775756840
              2F4B4F5F76771871136A6A1E6F5B552B362E4A5E64662339126A6A1E6F5B5532
              2E2C434A4E5726390E6A6A1E6F5B5B324534354344501D5B0E6A6A1E705D5D41
              496944303C2721760C6A6A1E6F5B5B5B3B4236302D225B770C6A6A1E70616262
              654D313D4D6772770C6A6A247165656767677271706768770C6A6A0205050505
              0505050507070714046A6A000101010101010101010101010F6A}
            Kind = bkGlyph
          end>
        OnButtonClick = btLocMedicoButtonClick
        ExistButtons = True
      end
      object edMedico: TdxEdit
        Left = 76
        Top = 33
        Width = 285
        Color = cl3DLight
        TabOrder = 1
        TabStop = False
        ReadOnly = True
        StoredValues = 64
      end
      object btLocUtente: TdxButtonEdit
        Left = 12
        Top = 72
        Width = 62
        TabOrder = 2
        OnExit = btLocUtenteExit
        OnChange = btLocUtenteChange
        Buttons = <
          item
            Default = True
            Glyph.Data = {
              36050000424D3605000000000000360400002800000010000000100000000100
              0800000000000001000000000000000000000001000000000000D4600600E06A
              0600AB500B00481C11006A381100AB58110060311600B66A1600A1502A00A158
              31007B583800484040007B584000584848007B58480098734800605850006A58
              5000735850007B6050008F6A50007B50580084505800845858006A6058007360
              5800CA7B58008F6A6000AB7B6A00AB846A00E0AB6A00737373007B7373008F73
              7300A1847B00AB987B00EAB67B0084848400CAAB8400EAC08400F4CA84008F8F
              8F0098988F00CAAB8F00CAB68F00E0B68F00D4C08F00EAC08F00EACA8F00A198
              9800CAAB9800D4B69800D4C09800D4CA9800E0CA9800EAD49800487BA1008F98
              A100A1A1A100ABA1A100F4EAA100ABA1AB00B6A1AB00ABABAB00C0ABAB00B6B6
              AB00CAB6AB00D4D4AB00E0D4AB00E0E0AB00EAE0AB00FFEAAB0084A1B600D4C0
              B600D4E0B600F4F4B600506AC000B6B6C000D4E0C000F4F4C000FFFFC000586A
              CA0073ABCA0098B6CA00B6B6CA00B6C0CA00C0C0CA00EAF4CA005073D400607B
              D400ABCAD400B6CAD400B6D4D400C0D4D400D4E0D400EAF4D400B6CAE000C0CA
              E000C0D4E000C0E0E000E0E0E000C0E0EA00FFFFEA00CAEAF400D4F4F400EAF4
              F400FF00FF0016A1FF002AA1FF0023ABFF008FE0FF00C0EAFF00CAEAFF00CAF4
              FF00D4F4FF00E0F4FF00D4FFFF00E0FFFF00F4FFFF00FFFFFF00000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              00000000000000000000000000000000000000000000000000006A3A102A6A6A
              6A6A6A6A6A6A6A6A6A6A3A535916256A6A6A6A6A6A6A6A6A6A6A6A6E6C511729
              6A6A6A6A6A6A6A6A6A6A6A6A6E6D58153F6A6A6A6A6A6A6A6A6A6A6A6A386B4C
              0B2011190D1F6A6A6A6A6A09090852481C476677771B031A066A6A2775756840
              2F4B4F5F76771871136A6A1E6F5B552B362E4A5E64662339126A6A1E6F5B5532
              2E2C434A4E5726390E6A6A1E6F5B5B324534354344501D5B0E6A6A1E705D5D41
              496944303C2721760C6A6A1E6F5B5B5B3B4236302D225B770C6A6A1E70616262
              654D313D4D6772770C6A6A247165656767677271706768770C6A6A0205050505
              0505050507070714046A6A000101010101010101010101010F6A}
            Kind = bkGlyph
          end>
        OnButtonClick = btLocUtenteButtonClick
        ExistButtons = True
      end
      object edUtente: TdxEdit
        Left = 76
        Top = 72
        Width = 285
        Color = cl3DLight
        TabOrder = 3
        TabStop = False
        ReadOnly = True
        StoredValues = 64
      end
      object edprocesso: TdxEdit
        Left = 12
        Top = 112
        Width = 141
        TabOrder = 4
        ReadOnly = False
        StoredValues = 64
      end
      object cbatendimento: TCheckBox
        Left = 158
        Top = 113
        Width = 209
        Height = 17
        Caption = 'Ultimo Atendimento'
        TabOrder = 5
      end
      object ednrproccriancaexp: TdxEdit
        Left = 12
        Top = 149
        Width = 141
        TabOrder = 6
        ReadOnly = False
        StoredValues = 64
      end
    end
    object ckConfirmado: TCheckBox
      Left = 113
      Top = 258
      Width = 75
      Height = 17
      Caption = 'Confirmado'
      TabOrder = 3
    end
    object ckRemarcado: TCheckBox
      Left = 192
      Top = 258
      Width = 77
      Height = 17
      Caption = 'Remarcado'
      TabOrder = 4
    end
    object ckRealizado: TCheckBox
      Left = 273
      Top = 258
      Width = 69
      Height = 17
      Caption = 'Realizado'
      TabOrder = 5
    end
    object ckTransferido: TCheckBox
      Left = 347
      Top = 258
      Width = 76
      Height = 17
      Caption = 'Transferido'
      TabOrder = 6
    end
    object ckNaoConfirmado: TCheckBox
      Left = 11
      Top = 258
      Width = 97
      Height = 17
      Caption = 'N'#227'o Confirmado'
      TabOrder = 2
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 283
    Width = 428
    Height = 41
    Align = alBottom
    TabOrder = 1
    object BitBtn1: TBitBtn
      Left = 95
      Top = 8
      Width = 85
      Height = 25
      Caption = 'Confirmar'
      ModalResult = 1
      TabOrder = 0
      OnClick = BitBtn1Click
      Glyph.Data = {
        DE010000424DDE01000000000000760000002800000024000000120000000100
        0400000000006801000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        3333333333333333333333330000333333333333333333333333F33333333333
        00003333344333333333333333388F3333333333000033334224333333333333
        338338F3333333330000333422224333333333333833338F3333333300003342
        222224333333333383333338F3333333000034222A22224333333338F338F333
        8F33333300003222A3A2224333333338F3838F338F33333300003A2A333A2224
        33333338F83338F338F33333000033A33333A222433333338333338F338F3333
        0000333333333A222433333333333338F338F33300003333333333A222433333
        333333338F338F33000033333333333A222433333333333338F338F300003333
        33333333A222433333333333338F338F00003333333333333A22433333333333
        3338F38F000033333333333333A223333333333333338F830000333333333333
        333A333333333333333338330000333333333333333333333333333333333333
        0000}
      NumGlyphs = 2
    end
    object BitBtn2: TBitBtn
      Left = 208
      Top = 8
      Width = 85
      Height = 25
      Caption = 'Cancelar'
      TabOrder = 1
      Kind = bkCancel
    end
  end
end
