object frmLocPaciente: TfrmLocPaciente
  Left = 532
  Top = 238
  Width = 517
  Height = 385
  BorderIcons = [biSystemMenu]
  Caption = 'Localizar Utente'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 310
    Width = 509
    Height = 41
    Align = alBottom
    TabOrder = 0
    object btConfirmar: TBitBtn
      Left = 287
      Top = 8
      Width = 105
      Height = 25
      Caption = 'Confirmar'
      ModalResult = 1
      TabOrder = 0
      OnClick = btConfirmarClick
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
    object btCancelar: TBitBtn
      Left = 400
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Cancelar'
      TabOrder = 1
      Kind = bkCancel
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 509
    Height = 310
    Align = alClient
    TabOrder = 1
    object GroupBox1: TGroupBox
      Left = 11
      Top = 190
      Width = 479
      Height = 110
      Caption = 'Local'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      object Label3: TLabel
        Left = 11
        Top = 20
        Width = 123
        Height = 13
        Caption = 'Prov'#237'ncia de Moradia'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label4: TLabel
        Left = 11
        Top = 60
        Width = 124
        Height = 13
        Caption = 'Munic'#237'pio de Moradia'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object btLocProvincia: TdxButtonEdit
        Left = 12
        Top = 36
        Width = 62
        TabOrder = 0
        OnExit = btLocProvinciaExit
        OnChange = btLocProvinciaChange
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
        OnButtonClick = btLocProvinciaButtonClick
        ExistButtons = True
      end
      object edProvincia: TdxEdit
        Left = 76
        Top = 36
        Width = 265
        Color = cl3DLight
        TabOrder = 1
        TabStop = False
        ReadOnly = True
        StoredValues = 64
      end
      object btLocMunicipio: TdxButtonEdit
        Left = 12
        Top = 75
        Width = 62
        TabOrder = 2
        OnExit = btLocMunicipioExit
        OnChange = btLocMunicipioChange
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
        OnButtonClick = btLocMunicipioButtonClick
        ExistButtons = True
      end
      object edMunicipio: TdxEdit
        Left = 76
        Top = 75
        Width = 265
        Color = cl3DLight
        TabOrder = 3
        TabStop = False
        ReadOnly = True
        StoredValues = 64
      end
    end
    object GroupBox2: TGroupBox
      Left = 11
      Top = 11
      Width = 479
      Height = 179
      Caption = 'Pessoais'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      object Label1: TLabel
        Left = 11
        Top = 20
        Width = 93
        Height = 13
        Caption = 'Nome do Utente'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label2: TLabel
        Left = 11
        Top = 57
        Width = 29
        Height = 13
        Caption = 'Sexo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label5: TLabel
        Left = 12
        Top = 96
        Width = 98
        Height = 13
        Caption = 'Data Nascimento'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label6: TLabel
        Left = 143
        Top = 96
        Width = 33
        Height = 13
        Caption = 'Idade'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label7: TLabel
        Left = 11
        Top = 134
        Width = 79
        Height = 13
        Caption = 'Nome da M'#227'e'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label15: TLabel
        Left = 330
        Top = 19
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
      object Label8: TLabel
        Left = 330
        Top = 57
        Width = 146
        Height = 13
        Caption = 'Nr Processo Crian'#231'a Exp.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object edNome: TEdit
        Left = 12
        Top = 34
        Width = 317
        Height = 21
        TabOrder = 0
      end
      object edSexo: TComboBox
        Left = 12
        Top = 71
        Width = 117
        Height = 21
        ItemHeight = 13
        TabOrder = 1
        Items.Strings = (
          'Feminino'
          'Masculino')
      end
      object ckGestante: TCheckBox
        Left = 136
        Top = 72
        Width = 113
        Height = 17
        Alignment = taLeftJustify
        BiDiMode = bdLeftToRight
        Caption = 'Se for Gestante'
        ParentBiDiMode = False
        TabOrder = 2
      end
      object edData: TDateEdit
        Left = 12
        Top = 111
        Width = 121
        Height = 21
        NumGlyphs = 2
        TabOrder = 3
      end
      object edIdade: TEdit
        Left = 143
        Top = 111
        Width = 62
        Height = 21
        TabOrder = 4
      end
      object edNomeMae: TEdit
        Left = 12
        Top = 148
        Width = 333
        Height = 21
        TabOrder = 5
      end
      object edprocesso: TdxEdit
        Left = 331
        Top = 34
        Width = 142
        TabOrder = 6
        ReadOnly = False
        StoredValues = 64
      end
      object edprocessocriancaexp: TdxEdit
        Left = 331
        Top = 71
        Width = 142
        TabOrder = 7
        ReadOnly = False
        StoredValues = 64
      end
    end
  end
end
