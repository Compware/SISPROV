inherited frmRelGeralPrograma: TfrmRelGeralPrograma
  Left = 211
  Top = 104
  Caption = 'Relat'#243'rio Geral do Programa'
  OldCreateOrder = True
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label7: TLabel [1]
    Left = 154
    Top = 18
    Width = 190
    Height = 48
    Caption = 'Relat'#243'rio'#13#10'Geral do Programa'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -21
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
  end
  inherited pgFiltros: TPageControl
    Top = 76
    ActivePage = TabSheet1
    object tsFiltro: TTabSheet
      Caption = 'Filtro'
      object GroupBox1: TGroupBox
        Left = 8
        Top = 88
        Width = 417
        Height = 119
        Caption = 'Local'
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
        Visible = False
        object Label2: TLabel
          Left = 8
          Top = 22
          Width = 52
          Height = 13
          Caption = 'Unidade:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label3: TLabel
          Left = 8
          Top = 52
          Width = 60
          Height = 13
          Caption = 'Prov'#237'ncia:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label4: TLabel
          Left = 8
          Top = 80
          Width = 61
          Height = 13
          Caption = 'Munic'#237'pio:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object btLocUnidade: TdxButtonEdit
          Left = 76
          Top = 16
          Width = 62
          TabOrder = 0
          OnExit = btLocUnidadeExit
          OnChange = btLocUnidadeChange
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
          OnButtonClick = btLocUnidadeButtonClick
          ExistButtons = True
        end
        object edUnidade: TdxEdit
          Left = 140
          Top = 16
          Width = 265
          Color = cl3DLight
          TabOrder = 1
          TabStop = False
          ReadOnly = True
          StoredValues = 64
        end
        object btLocProvincia: TdxButtonEdit
          Left = 76
          Top = 48
          Width = 62
          TabOrder = 2
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
          Left = 140
          Top = 48
          Width = 265
          Color = cl3DLight
          TabOrder = 3
          TabStop = False
          ReadOnly = True
          StoredValues = 64
        end
        object btLocMunicipio: TdxButtonEdit
          Left = 76
          Top = 76
          Width = 62
          TabOrder = 4
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
          Left = 140
          Top = 76
          Width = 265
          Color = cl3DLight
          TabOrder = 5
          TabStop = False
          ReadOnly = True
          StoredValues = 64
        end
      end
      object ckGrafico: TCheckBox
        Left = 16
        Top = 216
        Width = 129
        Height = 17
        Caption = 'Imprimir Gr'#225'fico'
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 2
        Visible = False
      end
      object GroupBox3: TGroupBox
        Left = 8
        Top = 10
        Width = 418
        Height = 72
        Caption = 'Per'#237'odo'
        Enabled = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Courier New'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        Visible = False
        object Label5: TLabel
          Left = 8
          Top = 22
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
          Top = 22
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
          Top = 40
          Width = 163
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
          Top = 40
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
      object Panel3: TPanel
        Left = 0
        Top = 0
        Width = 433
        Height = 250
        Align = alClient
        TabOrder = 3
        object GroupBox2: TGroupBox
          Left = 8
          Top = 10
          Width = 418
          Height = 79
          Caption = 'Per'#237'odo Mes/Ano'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 0
          object lbAte: TLabel
            Left = 169
            Top = 40
            Width = 24
            Height = 13
            Caption = 'At'#233':'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label6: TLabel
            Left = 36
            Top = 40
            Width = 21
            Height = 13
            Caption = 'De:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object cbDe: TdxPickEdit
            Left = 61
            Top = 32
            Width = 84
            TabOrder = 0
            EditMask = '!99/0000;1;_'
            ReadOnly = False
            Text = '  /    '
            StoredValues = 68
          end
          object cbAte: TdxPickEdit
            Left = 197
            Top = 32
            Width = 85
            TabOrder = 1
            EditMask = '!99/0000;1;_'
            ReadOnly = False
            Text = '  /    '
            StoredValues = 68
          end
        end
      end
    end
    object tsGrafico: TTabSheet
      Caption = 'Grafico'
      ImageIndex = 1
      object Memo1: TMemo
        Left = 0
        Top = 0
        Width = 433
        Height = 250
        Align = alClient
        Lines.Strings = (
          'Memo1')
        TabOrder = 0
      end
    end
    object TabSheet1: TTabSheet
      Caption = 'Relat'#243'rios'
      ImageIndex = 2
      object lstRelatorios: TRxCheckListBox
        Left = 0
        Top = 0
        Width = 433
        Height = 250
        Align = alClient
        ItemHeight = 13
        TabOrder = 0
        InternalVersion = 202
        Strings = (
          'Todos'
          1
          True
          'Distribui'#231#227'o de adultos * testadas e positivas por prov'#237'ncias'
          0
          True
          'Distribui'#231#227'o de criancas * testadas e positivas por prov'#237'ncias'
          0
          True
          'Distribui'#231#227'o de gestantes * testadas e positivas por prov'#237'ncias'
          0
          True
          'Distribui'#231#227'o de pessoas * testadas e positivas por prov'#237'ncias'
          0
          True
          'Distribui'#231#227'o de gestantes, criancas e adultos ATV por prov'#237'ncias'
          0
          True
          
            'Distribui'#231#227'o de gestantes, criancas e adultos positivas por prov' +
            #237'ncias'
          0
          True
          
            'Distribui'#231#227'o de gestantes, criancas e adultos aconselhadas por p' +
            'rov'#237'ncias'
          0
          True
          
            'Distribui'#231#227'o de gestantes, criancas e adultos aconselhadas e tes' +
            'tadas por prov'#237'ncias'
          0
          True
          
            'Distribui'#231#227'o de gestantes, criancas e adultos testadas por prov'#237 +
            'ncias'
          0
          True
          'Distribui'#231#227'o de pessoas por sexo e prov'#237'ncias'
          0
          True
          
            'Distribui'#231#227'o de adultos testadas e positivas por sexo e prov'#237'nci' +
            'as'
          0
          True
          
            'Distribui'#231#227'o de criancas e adultos em acompanhamento e TARV por ' +
            'prov'#237'ncias'
          0
          True
          'Distribui'#231#227'o de criancas em acompanhamento e TARV por prov'#237'ncias'
          0
          True
          
            'Distribui'#231#227'o de criancas e adultos positivos em TARV por prov'#237'nc' +
            'ias'
          0
          True
          
            'Distribui'#231#227'o de criancas e adultos positivos em acompanhamento p' +
            'or prov'#237'ncias'
          0
          True
          'Distribui'#231#227'o de pessoas acompanhadas prov'#237'ncias'
          0
          True
          'Distribui'#231#227'o de pessoas em TARV por prov'#237'ncias'
          0
          True
          'Distribui'#231#227'o de criancas expostas por prov'#237'ncias'
          0
          True
          'Distribui'#231#227'o de criancas adultos em obito por prov'#237'ncias'
          0
          True
          'Distribui'#231#227'o de gr'#225'vidas positivas em PTV por prov'#237'ncias'
          0
          True
          'Distribui'#231#227'o de criancas e adultos Abandono TARV por prov'#237'ncias'
          0
          True
          
            'Distribui'#231#227'o de criancas e adultos Transferidos TARV por prov'#237'nc' +
            'ias'
          0
          True
          'Distribui'#231#227'o de criancas e adultos Falecidos TARV por prov'#237'ncias'
          0
          True
          
            'Distribui'#231#227'o de adultos em Acompanhamento e em TARV por prov'#237'nci' +
            'as'
          0
          True)
      end
    end
  end
  inherited Panel2: TPanel
    inherited btImprimir: TBitBtn
      OnClick = btImprimirClick
    end
    object ProgressBar1: TProgressBar
      Left = 8
      Top = 9
      Width = 290
      Height = 35
      TabOrder = 2
      Visible = False
    end
  end
  inherited qyGeral: TIBQuery
    SQL.Strings = (
      'select  count(*) TOTAL '
      'from NOTIFICACAO n')
  end
  object qyDashBoard: TIBQuery
    Database = DM.DB
    Transaction = DM.TS
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select DASHBOARD.CD_DASHBOARD'
      '     , DASHBOARD.NM_DASHBOARD'
      '     , DASHBOARD.TX_DASHBOARD'
      '     , DASHBOARD.NM_CAMPO_CHAVE'
      '     , DASHBOARD.TX_CAMPOS'
      '     , DASHBOARD.TX_TABELA'
      '     , DASHBOARD.TX_GRAFICO'
      '     , DASHBOARD.VL_ORDEM'
      '     , DASHBOARD.FL_REL_GERENCIAL'
      'from DASHBOARD'
      'where FL_REL_GERENCIAL = 1'
      'and TP_DASHBOARD = 1'
      'order by VL_ORDEM')
    Left = 424
    Top = 32
  end
end
