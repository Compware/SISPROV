inherited frmCadCaracterizacao: TfrmCadCaracterizacao
  Left = 518
  Top = 34
  Caption = 'Formul'#225'rio de Registro ATV (Caracteriza'#231'ao)'
  ClientHeight = 562
  ClientWidth = 784
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited sbPadrao: TStatusBar
    Top = 543
    Width = 784
  end
  inherited Panel1: TPanel
    Width = 784
    inherited btPesquisar: TBitBtn
      OnClick = btPesquisarClick
    end
    inherited btgravar: TBitBtn
      Width = 46
    end
    inherited btfechar: TBitBtn
      Left = 736
    end
  end
  inherited Panel2: TPanel
    Width = 784
    Height = 491
    inherited pgGeral: TPageControl
      Width = 782
      Height = 489
      inherited tabLista: TTabSheet
        OnShow = tabListaShow
        inherited Panel3: TPanel
          Width = 774
          Height = 461
          inherited grDados: TdxDBGrid
            Width = 772
            Height = 459
            KeyField = 'CD_CARACTERIZACAO'
            SummaryGroups = <
              item
                DefaultGroup = False
                SummaryItems = <
                  item
                    ColumnName = 'grDadosColumn10'
                    SummaryFormat = '(Total=0)'
                    SummaryType = cstCount
                  end>
                Name = 'grDadosSummaryGroup1'
              end>
            Filter.Criteria = {00000000}
            ShowRowFooter = True
            object grDadosColumn1: TdxDBGridColumn
              Caption = 'Provincia da Caracteriza'#231#227'o'
              Sorted = csUp
              Visible = False
              Width = 119
              BandIndex = 0
              RowIndex = 0
              FieldName = 'DS_PROVINCIA'
              GroupIndex = 0
            end
            object grDadosColumn3: TdxDBGridColumn
              Caption = 'Unidade da Caracteriza'#231#227'o'
              Sorted = csUp
              Visible = False
              Width = 120
              BandIndex = 0
              RowIndex = 0
              FieldName = 'DS_UNIDADE'
              GroupIndex = 2
            end
            object grDadosColumn2: TdxDBGridColumn
              Caption = 'Municipio da Caracteriza'#231#227'o'
              Sorted = csUp
              Visible = False
              Width = 115
              BandIndex = 0
              RowIndex = 0
              FieldName = 'DS_MUNICIPIO'
              GroupIndex = 1
            end
            object grDadosColumn6: TdxDBGridColumn
              Caption = 'Conselheiro'
              Sorted = csUp
              Visible = False
              Width = 160
              BandIndex = 0
              RowIndex = 0
              FieldName = 'DS_INVESTIGADOR'
              GroupIndex = 3
              SummaryGroupName = 'grDadosSummaryGroup1'
            end
            object grDadosColumn10: TdxDBGridColumn
              Caption = 'Caracteriza'#231#227'o'
              Width = 21
              BandIndex = 0
              RowIndex = 0
              FieldName = 'CD_CARACTERIZACAO'
            end
            object grDadosColumn5: TdxDBGridMaskColumn
              Caption = 'Data Visita'
              Width = 112
              BandIndex = 0
              RowIndex = 0
              FieldName = 'DT_VISITA'
              SummaryGroupName = 'grDadosSummaryGroup1'
            end
            object grDadosColumn12: TdxDBGridColumn
              Caption = 'Sexo'
              Width = 30
              BandIndex = 0
              RowIndex = 0
              FieldName = 'SEXO'
              SummaryGroupName = 'grDadosSummaryGroup1'
            end
            object grDadosColumn9: TdxDBGridColumn
              Caption = 'Teste Hoje'
              Width = 58
              BandIndex = 0
              RowIndex = 0
              FieldName = 'TESTE_HOJE'
              SummaryFooterType = cstCount
              SummaryFooterField = 'CD_CARACTERIZACAO'
              SummaryFooterFormat = 'Total = 0'
              SummaryGroupName = 'grDadosSummaryGroup1'
            end
          end
        end
      end
      inherited tabGeral: TTabSheet
        inherited Panel4: TPanel
          Width = 774
          Height = 461
          object pgCaracterizacao: TPageControl
            Left = 1
            Top = 1
            Width = 772
            Height = 459
            ActivePage = TabSheet5
            Align = alClient
            TabOrder = 0
            object TabSheet5: TTabSheet
              Caption = 'Dados da Caracteriza'#231#227'o'
              ImageIndex = 4
              object GroupBox1: TGroupBox
                Left = 0
                Top = 0
                Width = 764
                Height = 431
                Align = alClient
                TabOrder = 0
                object Label1: TLabel
                  Left = 17
                  Top = 213
                  Width = 167
                  Height = 13
                  Caption = 'C'#243'digo Utente................................:'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  ParentFont = False
                  Visible = False
                end
                object Label2: TLabel
                  Left = 17
                  Top = 47
                  Width = 159
                  Height = 13
                  Caption = 'Data da Visita..............................:'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  ParentFont = False
                end
                object Label3: TLabel
                  Left = 17
                  Top = 69
                  Width = 159
                  Height = 13
                  Caption = 'Prov'#237'ncia da Caracteriza'#231#227'o.......:'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  ParentFont = False
                end
                object Label4: TLabel
                  Left = 17
                  Top = 90
                  Width = 158
                  Height = 13
                  Caption = 'Municipio da Caracteriza'#231#227'o.......:'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  ParentFont = False
                end
                object Label5: TLabel
                  Left = 17
                  Top = 113
                  Width = 159
                  Height = 13
                  Caption = 'Unidade da Caracteriza'#231#227'o.........:'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  ParentFont = False
                end
                object Label6: TLabel
                  Left = 17
                  Top = 134
                  Width = 167
                  Height = 13
                  Caption = 'Local ATV......................................:'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  ParentFont = False
                end
                object Label7: TLabel
                  Left = 18
                  Top = 156
                  Width = 157
                  Height = 13
                  Caption = 'Conselheiro.................................:'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  ParentFont = False
                end
                object Label8: TLabel
                  Left = 17
                  Top = 23
                  Width = 167
                  Height = 13
                  Caption = 'C'#243'digo da Caracteriza'#231'ao..............:'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  ParentFont = False
                end
                object Label70: TLabel
                  Left = 176
                  Top = 44
                  Width = 9
                  Height = 24
                  Caption = '*'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clRed
                  Font.Height = -19
                  Font.Name = 'MS Sans Serif'
                  Font.Style = [fsBold]
                  ParentFont = False
                end
                object Label68: TLabel
                  Left = 176
                  Top = 66
                  Width = 9
                  Height = 24
                  Caption = '*'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clRed
                  Font.Height = -19
                  Font.Name = 'MS Sans Serif'
                  Font.Style = [fsBold]
                  ParentFont = False
                end
                object Label69: TLabel
                  Left = 176
                  Top = 88
                  Width = 9
                  Height = 24
                  Caption = '*'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clRed
                  Font.Height = -19
                  Font.Name = 'MS Sans Serif'
                  Font.Style = [fsBold]
                  ParentFont = False
                end
                object Label71: TLabel
                  Left = 176
                  Top = 110
                  Width = 9
                  Height = 24
                  Caption = '*'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clRed
                  Font.Height = -19
                  Font.Name = 'MS Sans Serif'
                  Font.Style = [fsBold]
                  ParentFont = False
                end
                object Label72: TLabel
                  Left = 176
                  Top = 154
                  Width = 9
                  Height = 24
                  Caption = '*'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clRed
                  Font.Height = -19
                  Font.Name = 'MS Sans Serif'
                  Font.Style = [fsBold]
                  ParentFont = False
                end
                object dxDBEdit1: TdxDBEdit
                  Left = 187
                  Top = 209
                  Width = 121
                  Color = cl3DLight
                  TabOrder = 1
                  TabStop = False
                  Visible = False
                  DataField = 'CD_UTENTE'
                  DataSource = dsControle
                  ReadOnly = True
                  StoredValues = 64
                end
                object DBDateEdit1: TDBDateEdit
                  Left = 187
                  Top = 42
                  Width = 121
                  Height = 21
                  DataField = 'DT_VISITA'
                  DataSource = dsControle
                  NumGlyphs = 2
                  TabOrder = 2
                end
                object RxDBComboBox1: TRxDBComboBox
                  Left = 187
                  Top = 130
                  Width = 145
                  Height = 21
                  Style = csDropDownList
                  DataField = 'CD_LOCAL'
                  DataSource = dsControle
                  EnableValues = True
                  ItemHeight = 13
                  Items.Strings = (
                    'Centro de Sa'#250'de'
                    'Posto M'#243'vel'
                    'Posto de Sa'#250'de'
                    'Cl'#237'nica Privada'
                    'Hospital'
                    'Outro')
                  TabOrder = 6
                  Values.Strings = (
                    '1'
                    '2'
                    '3'
                    '4'
                    '5'
                    '99')
                end
                object btLocProvincia: TdxDBButtonEdit
                  Left = 187
                  Top = 64
                  Width = 69
                  Hint = '(F5) Localizar Pais'
                  ParentShowHint = False
                  ShowHint = True
                  Style.ButtonStyle = bts3D
                  TabOrder = 3
                  OnExit = btLocProvinciaExit
                  DataField = 'CD_PROVINCIA'
                  DataSource = dsControle
                  ReadOnly = False
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
                  ClickKey = 116
                  OnButtonClick = btLocProvinciaButtonClick
                  StoredValues = 64
                  ExistButtons = True
                end
                object btLocMunicipio: TdxDBButtonEdit
                  Left = 187
                  Top = 86
                  Width = 71
                  Hint = '(F5) Localizar Pais'
                  ParentShowHint = False
                  ShowHint = True
                  Style.ButtonStyle = bts3D
                  TabOrder = 4
                  OnExit = btLocMunicipioExit
                  DataField = 'CD_MUNICIPIO'
                  DataSource = dsControle
                  ReadOnly = False
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
                  ClickKey = 116
                  OnButtonClick = btLocMunicipioButtonClick
                  StoredValues = 64
                  ExistButtons = True
                end
                object btLocUnidade: TdxDBButtonEdit
                  Left = 187
                  Top = 108
                  Width = 71
                  Hint = '(F5) Localizar Pais'
                  ParentShowHint = False
                  ShowHint = True
                  Style.ButtonStyle = bts3D
                  TabOrder = 5
                  OnExit = btLocUnidadeExit
                  DataField = 'CD_UNIDADE'
                  DataSource = dsControle
                  ReadOnly = False
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
                  ClickKey = 116
                  OnButtonClick = btLocUnidadeButtonClick
                  StoredValues = 64
                  ExistButtons = True
                end
                object btLocInvestigador: TdxDBButtonEdit
                  Left = 187
                  Top = 152
                  Width = 71
                  Hint = '(F5) Localizar Pais'
                  ParentShowHint = False
                  ShowHint = True
                  Style.ButtonStyle = bts3D
                  TabOrder = 7
                  OnExit = btLocInvestigadorExit
                  DataField = 'CD_INVESTIGADOR'
                  DataSource = dsControle
                  ReadOnly = False
                  OnChange = btLocInvestigadorChange
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
                  ClickKey = 116
                  OnButtonClick = btLocInvestigadorButtonClick
                  StoredValues = 64
                  ExistButtons = True
                end
                object dxDBEdit2: TdxDBEdit
                  Left = 258
                  Top = 152
                  Width = 278
                  Color = cl3DLight
                  TabOrder = 8
                  TabStop = False
                  DataField = 'DS_INVESTIGADOR'
                  DataSource = dsControle
                  ReadOnly = True
                  StoredValues = 64
                end
                object dxDBEdit3: TdxDBEdit
                  Left = 187
                  Top = 19
                  Width = 121
                  Color = cl3DLight
                  TabOrder = 0
                  TabStop = False
                  DataField = 'CD_UTENTE'
                  DataSource = dsControle
                  ReadOnly = True
                  StoredValues = 64
                end
                object edProvincia: TdxDBEdit
                  Left = 259
                  Top = 64
                  Width = 276
                  Color = cl3DLight
                  TabOrder = 9
                  TabStop = False
                  DataField = 'DS_PROVINCIA'
                  DataSource = dsControle
                  ReadOnly = True
                  StoredValues = 64
                end
                object edMunicipio: TdxDBEdit
                  Left = 259
                  Top = 86
                  Width = 278
                  Color = cl3DLight
                  TabOrder = 10
                  TabStop = False
                  DataField = 'DS_MUNICIPIO'
                  DataSource = dsControle
                  ReadOnly = True
                  StoredValues = 64
                end
                object edUnidade: TdxDBEdit
                  Left = 259
                  Top = 108
                  Width = 278
                  Color = cl3DLight
                  TabOrder = 11
                  TabStop = False
                  DataField = 'DS_UNIDADE'
                  DataSource = dsControle
                  ReadOnly = True
                  StoredValues = 64
                end
              end
            end
            object TabSheet1: TTabSheet
              Caption = 'Caracter'#237'sticas do Utente'
              object GroupBox2: TGroupBox
                Left = 0
                Top = 0
                Width = 764
                Height = 431
                Align = alClient
                TabOrder = 0
                object Label12: TLabel
                  Left = 9
                  Top = 15
                  Width = 96
                  Height = 13
                  Caption = '1. Sexo...................:'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  ParentFont = False
                end
                object Label14: TLabel
                  Left = 9
                  Top = 37
                  Width = 96
                  Height = 13
                  Caption = '2. Idade (Anos).......:'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  ParentFont = False
                end
                object Label17: TLabel
                  Left = 8
                  Top = 59
                  Width = 104
                  Height = 13
                  Caption = '3. Tipo de Sess'#227'o.....:'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  ParentFont = False
                end
                object Label10: TLabel
                  Left = 9
                  Top = 81
                  Width = 103
                  Height = 13
                  Caption = '4. Estado Civil...........:'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  ParentFont = False
                end
                object Label11: TLabel
                  Left = 9
                  Top = 103
                  Width = 204
                  Height = 13
                  Caption = '5.Quantos Filhos menores de 18 anos tem?'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  ParentFont = False
                end
                object Label13: TLabel
                  Left = 9
                  Top = 143
                  Width = 288
                  Height = 13
                  Caption = '6. Pensa que est'#225' gr'#225'vida ou que sua parceira est'#225' gr'#225'vida?'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  ParentFont = False
                end
                object Label15: TLabel
                  Left = 9
                  Top = 183
                  Width = 141
                  Height = 13
                  Caption = '6a.Se sim, quantas semanas?'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  ParentFont = False
                end
                object Label16: TLabel
                  Left = 9
                  Top = 223
                  Width = 235
                  Height = 13
                  Caption = '6b. Voc'#234' amamenta?\ A sua parceira amamenta?'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  ParentFont = False
                end
                object Label18: TLabel
                  Left = 9
                  Top = 263
                  Width = 113
                  Height = 13
                  Caption = '7. Nivel de Ecolaridade:'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  ParentFont = False
                end
                object Label19: TLabel
                  Left = 9
                  Top = 303
                  Width = 65
                  Height = 13
                  Caption = '8. Ocupa'#231#227'o:'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  ParentFont = False
                end
                object lbOutrosEscolaridade: TLabel
                  Left = 158
                  Top = 283
                  Width = 37
                  Height = 13
                  Caption = 'Outros.:'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  ParentFont = False
                  Visible = False
                end
                object lbOutrosOcupacao: TLabel
                  Left = 157
                  Top = 323
                  Width = 37
                  Height = 13
                  Caption = 'Outros.:'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  ParentFont = False
                  Visible = False
                end
                object Label9: TLabel
                  Left = 9
                  Top = 343
                  Width = 162
                  Height = 13
                  Caption = '8a. Est'#225' actualmente empregado?'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  ParentFont = False
                end
                object Label22: TLabel
                  Left = 9
                  Top = 383
                  Width = 241
                  Height = 13
                  Caption = '9. Voc'#234' alguma ves ouviu falar sobre o VIH/SIDA?'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  ParentFont = False
                end
                object Label21: TLabel
                  Left = 104
                  Top = 13
                  Width = 9
                  Height = 24
                  Caption = '*'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clRed
                  Font.Height = -19
                  Font.Name = 'MS Sans Serif'
                  Font.Style = [fsBold]
                  ParentFont = False
                end
                object Label24: TLabel
                  Left = 104
                  Top = 35
                  Width = 9
                  Height = 24
                  Caption = '*'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clRed
                  Font.Height = -19
                  Font.Name = 'MS Sans Serif'
                  Font.Style = [fsBold]
                  ParentFont = False
                end
                object RxDBComboBox2: TRxDBComboBox
                  Left = 115
                  Top = 11
                  Width = 145
                  Height = 21
                  Style = csDropDownList
                  DataField = 'FL_SEXO'
                  DataSource = dsControle
                  EnableValues = True
                  ItemHeight = 13
                  Items.Strings = (
                    'Masculino'
                    'Feminino')
                  TabOrder = 0
                  Values.Strings = (
                    '1'
                    '2')
                end
                object RxDBComboBox4: TRxDBComboBox
                  Left = 115
                  Top = 55
                  Width = 145
                  Height = 21
                  Style = csDropDownList
                  DataField = 'TP_SESSAO'
                  DataSource = dsControle
                  EnableValues = True
                  ItemHeight = 13
                  Items.Strings = (
                    'Individual'
                    'Casal'
                    'Familiar')
                  TabOrder = 2
                  Values.Strings = (
                    '1'
                    '2'
                    '3')
                end
                object RxDBComboBox5: TRxDBComboBox
                  Left = 115
                  Top = 77
                  Width = 145
                  Height = 21
                  Style = csDropDownList
                  DataField = 'CD_ESTADO_CIVIL'
                  DataSource = dsControle
                  EnableValues = True
                  ItemHeight = 13
                  Items.Strings = (
                    'Solteiro'
                    'Casado'
                    'Divorciado'
                    'Separado'
                    'Vi'#250'vo'
                    'Vive maritalmente')
                  TabOrder = 3
                  Values.Strings = (
                    '1'
                    '2'
                    '3'
                    '4'
                    '5'
                    '6')
                end
                object dxDBEdit5: TdxDBEdit
                  Left = 115
                  Top = 33
                  Width = 144
                  TabOrder = 1
                  DataField = 'NR_IDADE'
                  DataSource = dsControle
                  ReadOnly = False
                  StoredValues = 64
                end
                object dxDBEdit6: TdxDBEdit
                  Left = 10
                  Top = 119
                  Width = 144
                  TabOrder = 4
                  DataField = 'NR_FILHOS'
                  DataSource = dsControle
                  ReadOnly = False
                  StoredValues = 64
                end
                object RxDBComboBox3: TRxDBComboBox
                  Left = 10
                  Top = 159
                  Width = 145
                  Height = 21
                  Style = csDropDownList
                  DataField = 'FL_GESTANTE'
                  DataSource = dsControle
                  EnableValues = True
                  ItemHeight = 13
                  Items.Strings = (
                    'N'#227'o'
                    'Sim'
                    'N'#227'o Sabe'
                    'N'#227'o se Aplica')
                  TabOrder = 5
                  Values.Strings = (
                    '0'
                    '1'
                    '97'
                    '98')
                end
                object dxDBEdit7: TdxDBEdit
                  Left = 10
                  Top = 199
                  Width = 144
                  TabOrder = 6
                  DataField = 'NR_SEMANAS_GESTANTE'
                  DataSource = dsControle
                  ReadOnly = False
                  StoredValues = 64
                end
                object RxDBComboBox6: TRxDBComboBox
                  Left = 10
                  Top = 239
                  Width = 145
                  Height = 21
                  Style = csDropDownList
                  DataField = 'FL_AMAMENTA'
                  DataSource = dsControle
                  EnableValues = True
                  ItemHeight = 13
                  Items.Strings = (
                    'N'#227'o'
                    'Sim'
                    'N'#227'o se Aplica')
                  TabOrder = 7
                  Values.Strings = (
                    '0'
                    '1'
                    '98')
                end
                object cbEscolaridade: TRxDBComboBox
                  Left = 10
                  Top = 279
                  Width = 145
                  Height = 21
                  Style = csDropDownList
                  DataField = 'CD_ESCOLARIDADE'
                  DataSource = dsControle
                  EnableValues = True
                  ItemHeight = 13
                  Items.Strings = (
                    'Nenhum'
                    'Ensino Geral'
                    'Secund'#225'rio'
                    'Pr'#233' Universit'#225'rio'
                    'Superior'
                    'Outros')
                  TabOrder = 8
                  Values.Strings = (
                    '0'
                    '1'
                    '2'
                    '3'
                    '4'
                    '99')
                end
                object cbOcupacao: TRxDBComboBox
                  Left = 11
                  Top = 319
                  Width = 145
                  Height = 21
                  Style = csDropDownList
                  DataField = 'CD_OCUPACAO'
                  DataSource = dsControle
                  EnableValues = True
                  ItemHeight = 13
                  Items.Strings = (
                    'Estudante'
                    'Policia/Militar/Seguran'#231'a'
                    'Mineiro'
                    'Dom'#233'stica'
                    'Campon'#234's'
                    'Motorista'
                    'Comerciante'
                    'Funcion'#225'rio P'#250'blico'
                    'Outros')
                  TabOrder = 10
                  Values.Strings = (
                    '1'
                    '2'
                    '3'
                    '4'
                    '5'
                    '6'
                    '7'
                    '8'
                    '99')
                end
                object edOutrosEscolaridade: TdxDBEdit
                  Left = 198
                  Top = 279
                  Width = 158
                  TabOrder = 9
                  Visible = False
                  DataField = 'DS_ESCORALIDADE'
                  DataSource = dsControle
                  ReadOnly = False
                  StoredValues = 64
                end
                object edOutrosOcupacao: TdxDBEdit
                  Left = 197
                  Top = 319
                  Width = 158
                  TabOrder = 11
                  Visible = False
                  DataField = 'DS_OCUPACAO'
                  DataSource = dsControle
                  ReadOnly = False
                  StoredValues = 64
                end
                object RxDBComboBox9: TRxDBComboBox
                  Left = 10
                  Top = 359
                  Width = 145
                  Height = 21
                  Style = csDropDownList
                  DataField = 'FL_EMPREGADA'
                  DataSource = dsControle
                  EnableValues = True
                  ItemHeight = 13
                  Items.Strings = (
                    'N'#227'o'
                    'Sim'
                    'N'#227'o se Aplica')
                  TabOrder = 12
                  Values.Strings = (
                    '0'
                    '1'
                    '98')
                end
                object RxDBComboBox10: TRxDBComboBox
                  Left = 10
                  Top = 399
                  Width = 145
                  Height = 21
                  Style = csDropDownList
                  DataField = 'FL_OUVIU_FALAR'
                  DataSource = dsControle
                  EnableValues = True
                  ItemHeight = 13
                  Items.Strings = (
                    'N'#227'o'
                    'Sim'
                    'N'#227'o se Aplica')
                  TabOrder = 13
                  Values.Strings = (
                    '0'
                    '1'
                    '98')
                end
                object Panel5: TPanel
                  Left = 369
                  Top = 15
                  Width = 393
                  Height = 65
                  BevelOuter = bvNone
                  TabOrder = 14
                  object pOutros: TPanel
                    Left = 0
                    Top = 39
                    Width = 393
                    Height = 25
                    Align = alTop
                    BevelOuter = bvNone
                    TabOrder = 0
                    Visible = False
                    object lbOutrosRazao: TLabel
                      Left = 44
                      Top = 10
                      Width = 37
                      Height = 13
                      Caption = 'Outros.:'
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'MS Sans Serif'
                      Font.Style = []
                      ParentFont = False
                    end
                    object edOutrosRazao: TdxDBEdit
                      Left = 83
                      Top = 2
                      Width = 292
                      TabOrder = 0
                      DataField = 'DS_RAZAO'
                      DataSource = dsControle
                      ReadOnly = False
                      StoredValues = 64
                    end
                  end
                  object pServicos: TPanel
                    Left = 0
                    Top = 64
                    Width = 393
                    Height = 25
                    Align = alTop
                    BevelOuter = bvNone
                    TabOrder = 1
                    Visible = False
                    object lbServicoRazao: TLabel
                      Left = 86
                      Top = 10
                      Width = 96
                      Height = 13
                      Caption = 'Servi'#231'os de Sa'#250'de.:'
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'MS Sans Serif'
                      Font.Style = []
                      ParentFont = False
                    end
                    object edServicoRazao: TRxDBComboBox
                      Left = 184
                      Top = 2
                      Width = 192
                      Height = 21
                      Style = csDropDownList
                      DataField = 'FL_SERVICO_SAUDE'
                      DataSource = dsControle
                      EnableValues = True
                      ItemHeight = 13
                      Items.Strings = (
                        'TB'
                        'ITS'
                        'CS'
                        'PN'
                        'Pediatria'
                        'Hospital'
                        'Hemoter')
                      TabOrder = 0
                      Values.Strings = (
                        '1'
                        '2'
                        '3'
                        '4'
                        '5'
                        '6'
                        '7')
                    end
                  end
                  object Panel6: TPanel
                    Left = 0
                    Top = 0
                    Width = 393
                    Height = 39
                    Align = alTop
                    BevelOuter = bvNone
                    TabOrder = 2
                    object Label23: TLabel
                      Left = 43
                      Top = 1
                      Width = 288
                      Height = 13
                      Caption = '10. Qual a raz'#227'o mais importante que o levou a vir aqui hoje?'
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'MS Sans Serif'
                      Font.Style = []
                      ParentFont = False
                    end
                    object cbRazao: TRxDBComboBox
                      Left = 42
                      Top = 17
                      Width = 335
                      Height = 21
                      Style = csDropDownList
                      DataField = 'CD_RAZAO'
                      DataSource = dsControle
                      EnableValues = True
                      ItemHeight = 13
                      Items.Strings = (
                        'Comportamento do utente, arriscado-teve risco'
                        'Comportamento do parceiro, arriscado-teve risco'
                        
                          'Tive um parceiro que '#233' suspeito ter morrido ou est'#225' doente de SI' +
                          'DA'
                        'Tenho uma crian'#231'a doente ou morreu de VIH/SIDA'
                        'Aconselhado pelos amigos/membros da fam'#237'lia'
                        'Penso casar-me'
                        'Penso ter filhos'
                        'Sinto-me doente/adoe'#231'o sempre'
                        'Pedido do parceiro'
                        'para seguran'#231'a de vida'
                        'Para residir no estrangeiro'
                        'Referenciado por um Servi'#231'o de Sa'#250'de'
                        '2'#186' teste (per'#237'odo de janela)'
                        '2'#186' teste (confirma'#231#227'o do estado VIH+)'
                        'Outros')
                      TabOrder = 0
                      Values.Strings = (
                        '1'
                        '2'
                        '3'
                        '4'
                        '5'
                        '6'
                        '7'
                        '8'
                        '9'
                        '10'
                        '11'
                        '12'
                        '13'
                        '14'
                        '99')
                    end
                  end
                end
                object Panel7: TPanel
                  Left = 369
                  Top = 78
                  Width = 393
                  Height = 67
                  BevelOuter = bvNone
                  TabOrder = 15
                  object Label26: TLabel
                    Left = 40
                    Top = 4
                    Width = 295
                    Height = 13
                    Caption = '11. De que forma se apercebeu dos nossos Servi'#231'os de ATV?'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -11
                    Font.Name = 'MS Sans Serif'
                    Font.Style = []
                    ParentFont = False
                  end
                  object lbOutrosIndicacao: TLabel
                    Left = 42
                    Top = 45
                    Width = 37
                    Height = 13
                    Caption = 'Outros.:'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -11
                    Font.Name = 'MS Sans Serif'
                    Font.Style = []
                    ParentFont = False
                    Visible = False
                  end
                  object cbIndicacao: TRxDBComboBox
                    Left = 41
                    Top = 20
                    Width = 335
                    Height = 21
                    Style = csDropDownList
                    DataField = 'CD_INDICACAO'
                    DataSource = dsControle
                    EnableValues = True
                    ItemHeight = 13
                    Items.Strings = (
                      'Membro da fam'#237'lia'
                      'Amigo'
                      'Parceiro'
                      'Cartaz'
                      'TV'
                      'R'#225'dio'
                      'Outro cliente de ATV'
                      'Trabalhador de Sa'#250'de'
                      'Mobilizador comunit'#225'rio'
                      'Activista deste Cantro de ATV'
                      'Outros')
                    TabOrder = 0
                    Values.Strings = (
                      '1'
                      '2'
                      '3'
                      '4'
                      '5'
                      '6'
                      '7'
                      '8'
                      '9'
                      '10'
                      '99')
                  end
                  object edOutrosIndicacao: TdxDBEdit
                    Left = 83
                    Top = 42
                    Width = 292
                    TabOrder = 1
                    Visible = False
                    DataField = 'DS_INDICACAO'
                    DataSource = dsControle
                    ReadOnly = False
                    StoredValues = 64
                  end
                end
              end
            end
            object TabSheet2: TTabSheet
              Caption = 'Avalia'#231#227'o de Risco do Utente'
              ImageIndex = 1
              object GroupBox3: TGroupBox
                Left = 0
                Top = 0
                Width = 764
                Height = 431
                Align = alClient
                TabOrder = 0
                object Label28: TLabel
                  Left = 9
                  Top = 14
                  Width = 242
                  Height = 13
                  Caption = '12. J'#225' alguma vez recebeu sangue por transfus'#227'o?'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  ParentFont = False
                end
                object Label29: TLabel
                  Left = 9
                  Top = 54
                  Width = 244
                  Height = 26
                  Caption = 
                    '12a. Fez tatuagens? Tratamentos tradicionais e/ou '#13#10'com materiai' +
                    's corto-perfurantes?'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  ParentFont = False
                end
                object Label30: TLabel
                  Left = 9
                  Top = 147
                  Width = 185
                  Height = 13
                  Caption = '12c. Fez circuncis'#227'o / excis'#227'o genital?'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  ParentFont = False
                end
                object Label31: TLabel
                  Left = 9
                  Top = 107
                  Width = 89
                  Height = 13
                  Caption = '12b. Fez cirurgias?'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  ParentFont = False
                end
                object Label32: TLabel
                  Left = 9
                  Top = 186
                  Width = 171
                  Height = 13
                  Caption = '12d. Qual '#233' o n'#186' de partos que tem?'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  ParentFont = False
                end
                object Label33: TLabel
                  Left = 9
                  Top = 225
                  Width = 192
                  Height = 13
                  Caption = '12e. Qual '#233' o n'#186' de abortos que j'#225' teve?'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  ParentFont = False
                end
                object Label34: TLabel
                  Left = 9
                  Top = 263
                  Width = 256
                  Height = 26
                  Caption = 
                    '12f. Al'#233'm de seus filhos lembra-se de ter amamentado '#13#10'outras Cr' +
                    'ian'#231'as? '
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  ParentFont = False
                end
                object Label35: TLabel
                  Left = 9
                  Top = 314
                  Width = 211
                  Height = 13
                  Caption = '13. Qual '#233' a idade da 1'#186' experi'#234'ncia sexual?'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  ParentFont = False
                end
                object Label36: TLabel
                  Left = 9
                  Top = 352
                  Width = 218
                  Height = 26
                  Caption = 
                    '14. Nos '#250'ltimos 6 meses, voc'#234' fez sexo sob o '#13#10'efeito do '#225'lcool?' +
                    ' '
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  ParentFont = False
                end
                object Label37: TLabel
                  Left = 338
                  Top = 13
                  Width = 224
                  Height = 26
                  Caption = 
                    '14a. Nos '#250'ltimos 6 meses, voc'#234' fez sexo sob o '#13#10'efeito de drogas' +
                    '?'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  ParentFont = False
                end
                object Label38: TLabel
                  Left = 338
                  Top = 64
                  Width = 271
                  Height = 13
                  Caption = '15. Nos '#250'ltimos 6 meses, recebeu/deu dinheiro por sexo?'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  ParentFont = False
                end
                object Label39: TLabel
                  Left = 338
                  Top = 103
                  Width = 299
                  Height = 13
                  Caption = '15a. Nos '#250'ltimos 6 meses, recebeu/deu algo material por sexo?'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  ParentFont = False
                end
                object Label40: TLabel
                  Left = 338
                  Top = 143
                  Width = 280
                  Height = 13
                  Caption = '16. Voc'#234' teve sintomas/sinais de ITS nos '#250'ltimos 6 meses?'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  ParentFont = False
                end
                object Label41: TLabel
                  Left = 338
                  Top = 183
                  Width = 271
                  Height = 13
                  Caption = '16a. Se sim, descreva os tipos de sintomas da '#250'ltima vez:'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  ParentFont = False
                end
                object lbOutrostipoSintomas: TLabel
                  Left = 487
                  Top = 203
                  Width = 37
                  Height = 13
                  Caption = 'Outros.:'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  ParentFont = False
                  Visible = False
                end
                object Label43: TLabel
                  Left = 337
                  Top = 224
                  Width = 363
                  Height = 13
                  Caption = 
                    '17.Quantos parceiros sexuais (inclusive c'#244'njuge) teve nos '#250'ltimo' +
                    's 12 meses?'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  ParentFont = False
                end
                object Label44: TLabel
                  Left = 338
                  Top = 263
                  Width = 281
                  Height = 13
                  Caption = '18. Voc'#234' tem mais do que um parceiro sexual actualmente?'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  ParentFont = False
                end
                object Label45: TLabel
                  Left = 338
                  Top = 303
                  Width = 339
                  Height = 13
                  Caption = 
                    '19. Com que frequ'#234'ncia voc'#234' usou o preservativo nos '#250'ltimos 3 me' +
                    'ses?'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  ParentFont = False
                end
                object Label46: TLabel
                  Left = 338
                  Top = 343
                  Width = 265
                  Height = 26
                  Caption = 
                    '19a. Com que fr'#234'quencia voc'#234' usou o preservativo com'#13#10'o parceiro' +
                    ' n'#227'o regular nos '#250'ltimos 3 meses?'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  ParentFont = False
                end
                object RxDBComboBox14: TRxDBComboBox
                  Left = 10
                  Top = 30
                  Width = 145
                  Height = 21
                  Style = csDropDownList
                  DataField = 'FL_TRANSFUSAO'
                  DataSource = dsControle
                  EnableValues = True
                  ItemHeight = 13
                  Items.Strings = (
                    'N'#227'o'
                    'Sim'
                    'N'#227'o Sabe')
                  TabOrder = 0
                  Values.Strings = (
                    '0'
                    '1'
                    '97')
                end
                object RxDBComboBox15: TRxDBComboBox
                  Left = 10
                  Top = 83
                  Width = 145
                  Height = 21
                  Style = csDropDownList
                  DataField = 'FL_TATUAGEM'
                  DataSource = dsControle
                  EnableValues = True
                  ItemHeight = 13
                  Items.Strings = (
                    'N'#227'o'
                    'Sim'
                    'N'#227'o se Aplica')
                  TabOrder = 1
                  Values.Strings = (
                    '0'
                    '1'
                    '98')
                end
                object RxDBComboBox16: TRxDBComboBox
                  Left = 10
                  Top = 163
                  Width = 145
                  Height = 21
                  Style = csDropDownList
                  DataField = 'FL_CIRCUNCISAO'
                  DataSource = dsControle
                  EnableValues = True
                  ItemHeight = 13
                  Items.Strings = (
                    'N'#227'o'
                    'Sim'
                    'N'#227'o se Aplica')
                  TabOrder = 3
                  Values.Strings = (
                    '0'
                    '1'
                    '98')
                end
                object RxDBComboBox17: TRxDBComboBox
                  Left = 10
                  Top = 123
                  Width = 145
                  Height = 21
                  Style = csDropDownList
                  DataField = 'FL_CIRURGIA'
                  DataSource = dsControle
                  EnableValues = True
                  ItemHeight = 13
                  Items.Strings = (
                    'N'#227'o'
                    'Sim'
                    'N'#227'o se Aplica')
                  TabOrder = 2
                  Values.Strings = (
                    '0'
                    '1'
                    '98')
                end
                object dxDBEdit11: TdxDBEdit
                  Left = 10
                  Top = 202
                  Width = 144
                  TabOrder = 4
                  DataField = 'NR_PARTOS'
                  DataSource = dsControle
                  ReadOnly = False
                  StoredValues = 64
                end
                object dxDBEdit12: TdxDBEdit
                  Left = 10
                  Top = 241
                  Width = 144
                  TabOrder = 5
                  DataField = 'NR_ABORTOS'
                  DataSource = dsControle
                  ReadOnly = False
                  StoredValues = 64
                end
                object RxDBComboBox18: TRxDBComboBox
                  Left = 10
                  Top = 292
                  Width = 145
                  Height = 21
                  Style = csDropDownList
                  DataField = 'FL_AMAMENTOU_OUTROS'
                  DataSource = dsControle
                  EnableValues = True
                  ItemHeight = 13
                  Items.Strings = (
                    'N'#227'o'
                    'Sim'
                    'N'#227'o Sabe')
                  TabOrder = 6
                  Values.Strings = (
                    '0'
                    '1'
                    '97')
                end
                object dxDBEdit13: TdxDBEdit
                  Left = 10
                  Top = 330
                  Width = 144
                  TabOrder = 7
                  DataField = 'NR_IDADE_EXPERIENCIA'
                  DataSource = dsControle
                  ReadOnly = False
                  StoredValues = 64
                end
                object RxDBComboBox19: TRxDBComboBox
                  Left = 10
                  Top = 381
                  Width = 145
                  Height = 21
                  Style = csDropDownList
                  DataField = 'FL_SEXO_ALCOOL'
                  DataSource = dsControle
                  EnableValues = True
                  ItemHeight = 13
                  Items.Strings = (
                    'N'#227'o'
                    'Sim'
                    'N'#227'o se Aplica')
                  TabOrder = 8
                  Values.Strings = (
                    '0'
                    '1'
                    '98')
                end
                object RxDBComboBox20: TRxDBComboBox
                  Left = 339
                  Top = 42
                  Width = 145
                  Height = 21
                  Style = csDropDownList
                  DataField = 'FL_SEXO_DROGAS'
                  DataSource = dsControle
                  EnableValues = True
                  ItemHeight = 13
                  Items.Strings = (
                    'N'#227'o'
                    'Sim'
                    'N'#227'o se Aplica')
                  TabOrder = 9
                  Values.Strings = (
                    '0'
                    '1'
                    '98')
                end
                object RxDBComboBox21: TRxDBComboBox
                  Left = 339
                  Top = 81
                  Width = 145
                  Height = 21
                  Style = csDropDownList
                  DataField = 'FL_SEXO_DINHEIRO'
                  DataSource = dsControle
                  EnableValues = True
                  ItemHeight = 13
                  Items.Strings = (
                    'N'#227'o'
                    'Sim'
                    'N'#227'o se Aplica')
                  TabOrder = 10
                  Values.Strings = (
                    '0'
                    '1'
                    '98')
                end
                object RxDBComboBox22: TRxDBComboBox
                  Left = 339
                  Top = 119
                  Width = 145
                  Height = 21
                  Style = csDropDownList
                  DataField = 'FL_SEXO_MATERIAL'
                  DataSource = dsControle
                  EnableValues = True
                  ItemHeight = 13
                  Items.Strings = (
                    'N'#227'o'
                    'Sim'
                    'N'#227'o se Aplica')
                  TabOrder = 11
                  Values.Strings = (
                    '0'
                    '1'
                    '98')
                end
                object RxDBComboBox23: TRxDBComboBox
                  Left = 339
                  Top = 159
                  Width = 145
                  Height = 21
                  Style = csDropDownList
                  DataField = 'FL_SINAIS_ITS'
                  DataSource = dsControle
                  EnableValues = True
                  ItemHeight = 13
                  Items.Strings = (
                    'N'#227'o'
                    'Sim'
                    'N'#227'o Sabe')
                  TabOrder = 12
                  Values.Strings = (
                    '0'
                    '1'
                    '97')
                end
                object cbtipoSintomas: TRxDBComboBox
                  Left = 339
                  Top = 199
                  Width = 145
                  Height = 21
                  Style = csDropDownList
                  DataField = 'CD_SINAIS_ITS'
                  DataSource = dsControle
                  EnableValues = True
                  ItemHeight = 13
                  Items.Strings = (
                    'Corrimento Vaginal'
                    'Corrimento Uretral'
                    'Ulcera Genital'
                    'Corrimento Neonatal'
                    'Bub'#227'o Inguinal'
                    'Doen'#231'a Inflamat'#243'ria P'#233'lvica'
                    'Outros'
                    ' ')
                  TabOrder = 13
                  Values.Strings = (
                    '1'
                    '2'
                    '3'
                    '4'
                    '5'
                    '6'
                    '99')
                end
                object edOutrostipoSintomas: TdxDBEdit
                  Left = 527
                  Top = 199
                  Width = 158
                  TabOrder = 14
                  Visible = False
                  DataField = 'DS_SINAIS_ITS'
                  DataSource = dsControle
                  ReadOnly = False
                  StoredValues = 64
                end
                object dxDBEdit15: TdxDBEdit
                  Left = 338
                  Top = 240
                  Width = 144
                  TabOrder = 15
                  DataField = 'NR_PARCEIROS_SEXUAIS'
                  DataSource = dsControle
                  ReadOnly = False
                  StoredValues = 64
                end
                object RxDBComboBox25: TRxDBComboBox
                  Left = 339
                  Top = 279
                  Width = 145
                  Height = 21
                  Style = csDropDownList
                  DataField = 'FL_PARCEIRO_SEXUAL'
                  DataSource = dsControle
                  EnableValues = True
                  ItemHeight = 13
                  Items.Strings = (
                    'N'#227'o'
                    'Sim'
                    'N'#227'o Respondeu')
                  TabOrder = 16
                  Values.Strings = (
                    '0'
                    '1'
                    '100')
                end
                object RxDBComboBox26: TRxDBComboBox
                  Left = 339
                  Top = 319
                  Width = 145
                  Height = 21
                  Style = csDropDownList
                  DataField = 'FL_PRESERVATIVO'
                  DataSource = dsControle
                  EnableValues = True
                  ItemHeight = 13
                  Items.Strings = (
                    'Nunca'
                    'Sempre'
                    #192's vezes'
                    'N'#227'o se Aplica'
                    'N'#227'o Respondeu')
                  TabOrder = 17
                  Values.Strings = (
                    '1'
                    '2'
                    '3'
                    '98'
                    '100')
                end
                object RxDBComboBox27: TRxDBComboBox
                  Left = 339
                  Top = 372
                  Width = 145
                  Height = 21
                  Style = csDropDownList
                  DataField = 'FL_PRESERVATIVO_NAO_REGULAR'
                  DataSource = dsControle
                  EnableValues = True
                  ItemHeight = 13
                  Items.Strings = (
                    'Nunca'
                    'Sempre'
                    #192's vezes'
                    'N'#227'o se Aplica'
                    'N'#227'o Respondeu')
                  TabOrder = 18
                  Values.Strings = (
                    '1'
                    '2'
                    '3'
                    '98'
                    '100')
                end
              end
            end
            object TabSheet3: TTabSheet
              Caption = 'Hist'#243'rico sobre Teste VIH'
              ImageIndex = 2
              object GroupBox4: TGroupBox
                Left = 0
                Top = 0
                Width = 764
                Height = 431
                Align = alClient
                TabOrder = 0
                object Label47: TLabel
                  Left = 9
                  Top = 14
                  Width = 171
                  Height = 13
                  Caption = '20. J'#225' alguma vez fez teste de VIH?'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  ParentFont = False
                end
                object Label48: TLabel
                  Left = 9
                  Top = 54
                  Width = 91
                  Height = 13
                  Caption = '20a. Se sim, onde?'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  ParentFont = False
                end
                object Label49: TLabel
                  Left = 9
                  Top = 94
                  Width = 141
                  Height = 13
                  Caption = '20b. Quando '#233' que fez teste?'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  ParentFont = False
                end
                object Label50: TLabel
                  Left = 9
                  Top = 134
                  Width = 270
                  Height = 13
                  Caption = '20c. Se fez teste, quais s'#227'o os resultados mais recentes?'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  ParentFont = False
                end
                object lbOutrosOndeVIH: TLabel
                  Left = 159
                  Top = 74
                  Width = 37
                  Height = 13
                  Caption = 'Outros.:'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  ParentFont = False
                  Visible = False
                end
                object Label52: TLabel
                  Left = 9
                  Top = 174
                  Width = 252
                  Height = 26
                  Caption = 
                    '21. O seu '#250'ltimo parceiro sexual fez teste de VIH nos '#13#10'ultimos ' +
                    '12 meses?'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  ParentFont = False
                end
                object Label53: TLabel
                  Left = 9
                  Top = 227
                  Width = 174
                  Height = 13
                  Caption = '22. Apresenta sintomas de ITS hoje?'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  ParentFont = False
                end
                object Label54: TLabel
                  Left = 9
                  Top = 267
                  Width = 129
                  Height = 13
                  Caption = '22a. Se sim, que sintomas?'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  ParentFont = False
                end
                object lbOutrosSintomas: TLabel
                  Left = 159
                  Top = 287
                  Width = 37
                  Height = 13
                  Caption = 'Outros.:'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  ParentFont = False
                  Visible = False
                end
                object Label20: TLabel
                  Left = 9
                  Top = 310
                  Width = 331
                  Height = 13
                  Caption = 
                    '23. O Utente fez teste do VIH hoje? Se sim, qual o resultado do ' +
                    'teste?'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  ParentFont = False
                end
                object Label25: TLabel
                  Left = 156
                  Top = 329
                  Width = 9
                  Height = 24
                  Caption = '*'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clRed
                  Font.Height = -19
                  Font.Name = 'MS Sans Serif'
                  Font.Style = [fsBold]
                  ParentFont = False
                end
                object RxDBComboBox28: TRxDBComboBox
                  Left = 10
                  Top = 30
                  Width = 145
                  Height = 21
                  Style = csDropDownList
                  DataField = 'FL_TESTE'
                  DataSource = dsControle
                  EnableValues = True
                  ItemHeight = 13
                  Items.Strings = (
                    'N'#227'o'
                    'Sim'
                    'N'#227'o Sabe')
                  TabOrder = 0
                  Values.Strings = (
                    '0'
                    '1'
                    '97')
                end
                object cbOndeVIH: TRxDBComboBox
                  Left = 10
                  Top = 70
                  Width = 145
                  Height = 21
                  Style = csDropDownList
                  DataField = 'CD_TESTE'
                  DataSource = dsControle
                  EnableValues = True
                  ItemHeight = 13
                  Items.Strings = (
                    'Hospital'
                    'Cl'#237'nica'
                    'Centro de ATV'
                    'Doutor Particular'
                    'Banco de Sangue'
                    'Outros')
                  TabOrder = 1
                  Values.Strings = (
                    '1'
                    '2'
                    '3'
                    '4'
                    '5'
                    '99')
                end
                object DBDateEdit2: TDBDateEdit
                  Left = 10
                  Top = 110
                  Width = 121
                  Height = 21
                  DataField = 'DT_TESTE'
                  DataSource = dsControle
                  NumGlyphs = 2
                  TabOrder = 3
                end
                object RxDBComboBox30: TRxDBComboBox
                  Left = 10
                  Top = 150
                  Width = 145
                  Height = 21
                  Style = csDropDownList
                  DataField = 'FL_TESTE_RECENTES'
                  DataSource = dsControle
                  EnableValues = True
                  ItemHeight = 13
                  Items.Strings = (
                    'Negativo'
                    'Positivo'
                    'Indeterminado'
                    'N'#227'o recebeu'
                    'N'#227'o Sabe')
                  TabOrder = 4
                  Values.Strings = (
                    '0'
                    '1'
                    '2'
                    '3'
                    '97')
                end
                object edOutrosOndeVIH: TdxDBEdit
                  Left = 199
                  Top = 70
                  Width = 158
                  TabOrder = 2
                  Visible = False
                  DataField = 'DS_TESTE'
                  DataSource = dsControle
                  ReadOnly = False
                  StoredValues = 64
                end
                object RxDBComboBox31: TRxDBComboBox
                  Left = 10
                  Top = 203
                  Width = 250
                  Height = 21
                  Style = csDropDownList
                  DataField = 'FL_TESTE_PARCEIROS'
                  DataSource = dsControle
                  EnableValues = True
                  ItemHeight = 13
                  Items.Strings = (
                    'N'#227'o'
                    'Sim, o resultado foi negativo'
                    'Sim o resultado foi positivo'
                    'N'#227'o Sabe'
                    'N'#227'o se Aplica')
                  TabOrder = 5
                  Values.Strings = (
                    '0'
                    '1'
                    '2'
                    '3'
                    '97'
                    '98')
                end
                object RxDBComboBox32: TRxDBComboBox
                  Left = 10
                  Top = 243
                  Width = 145
                  Height = 21
                  Style = csDropDownList
                  DataField = 'FL_ITS'
                  DataSource = dsControle
                  EnableValues = True
                  ItemHeight = 13
                  Items.Strings = (
                    'N'#227'o'
                    'Sim'
                    'N'#227'o se Aplica')
                  TabOrder = 6
                  Values.Strings = (
                    '0'
                    '1'
                    '98')
                end
                object cbSintomas: TRxDBComboBox
                  Left = 10
                  Top = 283
                  Width = 145
                  Height = 21
                  Style = csDropDownList
                  DataField = 'CD_SINTOMAS_ITS'
                  DataSource = dsControle
                  EnableValues = True
                  ItemHeight = 13
                  Items.Strings = (
                    'Corrimento Vaginal'
                    'Corrimento Uretral'
                    'Ulcera Genital'
                    'Prurido Genital'
                    'Bub'#227'o Inguinal'
                    'Doen'#231'a Inflamat'#243'ria P'#233'lvica'
                    'N'#227'o se Aplica'
                    'Outros')
                  TabOrder = 7
                  Values.Strings = (
                    '1'
                    '2'
                    '3'
                    '4'
                    '5'
                    '6'
                    '98'
                    '99')
                end
                object edOutrosSintomas: TdxDBEdit
                  Left = 199
                  Top = 283
                  Width = 158
                  TabOrder = 8
                  Visible = False
                  DataField = 'DS_SINTOMAS_ITS'
                  DataSource = dsControle
                  ReadOnly = False
                  StoredValues = 64
                end
                object RxDBComboBox7: TRxDBComboBox
                  Left = 10
                  Top = 326
                  Width = 145
                  Height = 21
                  Style = csDropDownList
                  DataField = 'FL_TESTE_HOJE'
                  DataSource = dsControle
                  EnableValues = True
                  ItemHeight = 13
                  Items.Strings = (
                    'Negativo'
                    'Positivo'
                    'Indeterminado'
                    '')
                  TabOrder = 9
                  Values.Strings = (
                    '1'
                    '2'
                    '3')
                end
              end
            end
            object TabSheet4: TTabSheet
              Caption = 'Aconselhamento P'#243's-Teste'
              ImageIndex = 3
              object GroupBox5: TGroupBox
                Left = 0
                Top = 0
                Width = 764
                Height = 431
                Align = alClient
                TabOrder = 0
                object Label56: TLabel
                  Left = 9
                  Top = 14
                  Width = 249
                  Height = 13
                  Caption = '24. O utente recebeu os resultados do teste de VIH?'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  ParentFont = False
                end
                object Label57: TLabel
                  Left = 9
                  Top = 54
                  Width = 213
                  Height = 13
                  Caption = '24a. Parceiros com resultados Discordantes?'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  ParentFont = False
                end
                object Label58: TLabel
                  Left = 9
                  Top = 94
                  Width = 171
                  Height = 13
                  Caption = '25. Ir'#225' revelar o seu estado de VIH?'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  ParentFont = False
                end
                object Label59: TLabel
                  Left = 9
                  Top = 133
                  Width = 102
                  Height = 13
                  Caption = '25a. Se sim, a quem?'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  ParentFont = False
                end
                object lbOutrosQuem: TLabel
                  Left = 159
                  Top = 153
                  Width = 37
                  Height = 13
                  Caption = 'Outros.:'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  ParentFont = False
                  Visible = False
                end
                object Label61: TLabel
                  Left = 9
                  Top = 172
                  Width = 326
                  Height = 13
                  Caption = 
                    '26. Foi feito um plano de redu'#231#227'o de risco pelo utente e conselh' +
                    'eiro?'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  ParentFont = False
                end
                object Label62: TLabel
                  Left = 9
                  Top = 212
                  Width = 87
                  Height = 13
                  Caption = '26a. Se sim, qual?'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  ParentFont = False
                end
                object lbOutrosQual: TLabel
                  Left = 159
                  Top = 232
                  Width = 37
                  Height = 13
                  Caption = 'Outros.:'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  ParentFont = False
                  Visible = False
                end
                object Label64: TLabel
                  Left = 9
                  Top = 253
                  Width = 196
                  Height = 13
                  Caption = '27. O utente hoje recebeu preservativos?'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  ParentFont = False
                end
                object Label65: TLabel
                  Left = 9
                  Top = 293
                  Width = 296
                  Height = 13
                  Caption = 
                    '28. O utente foi transferido a outra institui'#231#227'o para assist'#234'nci' +
                    'a?'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  ParentFont = False
                end
                object Label66: TLabel
                  Left = 9
                  Top = 332
                  Width = 97
                  Height = 13
                  Caption = '28a. Se sim, aonde?'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  ParentFont = False
                end
                object lbOutrosOnde: TLabel
                  Left = 10
                  Top = 376
                  Width = 37
                  Height = 13
                  Caption = 'Outros.:'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  ParentFont = False
                  Visible = False
                end
                object RxDBComboBox34: TRxDBComboBox
                  Left = 10
                  Top = 30
                  Width = 145
                  Height = 21
                  Style = csDropDownList
                  DataField = 'FL_TESTE_RESULTADOS'
                  DataSource = dsControle
                  EnableValues = True
                  ItemHeight = 13
                  Items.Strings = (
                    'N'#227'o'
                    'Sim'
                    'N'#227'o se Aplica')
                  TabOrder = 0
                  Values.Strings = (
                    '0'
                    '1'
                    '98')
                end
                object RxDBComboBox35: TRxDBComboBox
                  Left = 10
                  Top = 70
                  Width = 145
                  Height = 21
                  Style = csDropDownList
                  DataField = 'FL_PARCEIROS_RESULTADOS'
                  DataSource = dsControle
                  EnableValues = True
                  ItemHeight = 13
                  Items.Strings = (
                    'N'#227'o'
                    'Sim'
                    'N'#227'o se Aplica')
                  TabOrder = 1
                  Values.Strings = (
                    '0'
                    '1'
                    '98')
                end
                object RxDBComboBox36: TRxDBComboBox
                  Left = 10
                  Top = 110
                  Width = 145
                  Height = 21
                  Style = csDropDownList
                  DataField = 'FL_REVELAR'
                  DataSource = dsControle
                  EnableValues = True
                  ItemHeight = 13
                  Items.Strings = (
                    'N'#227'o'
                    'Sim'
                    'N'#227'o Sabe'
                    'N'#227'o se Aplica')
                  TabOrder = 2
                  Values.Strings = (
                    '0'
                    '1'
                    '97'
                    '98')
                end
                object cbQuem: TRxDBComboBox
                  Left = 10
                  Top = 149
                  Width = 145
                  Height = 21
                  Style = csDropDownList
                  DataField = 'CD_REVELAR'
                  DataSource = dsControle
                  EnableValues = True
                  ItemHeight = 13
                  Items.Strings = (
                    'Esposa'
                    'Amigo'
                    'Trabalhador de Sa'#250'de'
                    'Membro de Fam'#237'lia'
                    'Padre/Pastor'
                    'Parceiro/a'
                    'Outros')
                  TabOrder = 3
                  Values.Strings = (
                    '1'
                    '2'
                    '3'
                    '4'
                    '5'
                    '6'
                    '99')
                end
                object edOutrosQuem: TdxDBEdit
                  Left = 199
                  Top = 149
                  Width = 158
                  TabOrder = 4
                  Visible = False
                  DataField = 'DS_REVELAR'
                  DataSource = dsControle
                  ReadOnly = False
                  StoredValues = 64
                end
                object RxDBComboBox38: TRxDBComboBox
                  Left = 10
                  Top = 188
                  Width = 145
                  Height = 21
                  Style = csDropDownList
                  DataField = 'FL_PLANO_REDUCAO'
                  DataSource = dsControle
                  EnableValues = True
                  ItemHeight = 13
                  Items.Strings = (
                    'N'#227'o'
                    'Sim'
                    'N'#227'o se Aplica')
                  TabOrder = 5
                  Values.Strings = (
                    '0'
                    '1'
                    '98')
                end
                object cbQual: TRxDBComboBox
                  Left = 10
                  Top = 228
                  Width = 145
                  Height = 21
                  Style = csDropDownList
                  DataField = 'CD_PLANO_REDUCAO'
                  DataSource = dsControle
                  EnableValues = True
                  ItemHeight = 13
                  Items.Strings = (
                    'Preservativos'
                    'Monogamia'
                    'Diminui'#231#227'o de Parceiros'
                    'Abstin'#234'ncia sexual'
                    'Tratamento para as ITS'
                    'Aleitamento'
                    'Nenhum'
                    'Outros')
                  TabOrder = 6
                  Values.Strings = (
                    '1'
                    '2'
                    '3'
                    '4'
                    '5'
                    '6'
                    '7'
                    '99')
                end
                object edOutrosQual: TdxDBEdit
                  Left = 199
                  Top = 228
                  Width = 158
                  TabOrder = 7
                  Visible = False
                  DataField = 'DS_PLANO_REDUCAO'
                  DataSource = dsControle
                  ReadOnly = False
                  StoredValues = 64
                end
                object RxDBComboBox40: TRxDBComboBox
                  Left = 10
                  Top = 269
                  Width = 145
                  Height = 21
                  Style = csDropDownList
                  DataField = 'FL_RECEBEU_PRESERVATIVOS'
                  DataSource = dsControle
                  EnableValues = True
                  ItemHeight = 13
                  Items.Strings = (
                    'N'#227'o'
                    'Sim')
                  TabOrder = 8
                  Values.Strings = (
                    '0'
                    '1')
                end
                object RxDBComboBox41: TRxDBComboBox
                  Left = 10
                  Top = 309
                  Width = 145
                  Height = 21
                  Style = csDropDownList
                  DataField = 'FL_TRANSFERENCIA'
                  DataSource = dsControle
                  EnableValues = True
                  ItemHeight = 13
                  Items.Strings = (
                    'N'#227'o'
                    'Sim')
                  TabOrder = 9
                  Values.Strings = (
                    '0'
                    '1')
                end
                object cbOnde: TRxDBComboBox
                  Left = 10
                  Top = 348
                  Width = 351
                  Height = 21
                  Style = csDropDownList
                  DataField = 'CD_TRANSFERENCIA'
                  DataSource = dsControle
                  EnableValues = True
                  ItemHeight = 13
                  Items.Strings = (
                    'Centro de TB'
                    'Programa do Corte de Transmiss'#227'o Vertical'
                    'ITS'
                    'Hospital - Tratamento'
                    'Hospital - Consulta M'#233'dica'
                    'Centro de Sa'#250'de - Cosulta M'#233'dica'
                    'Cuidados Domicili'#225'rios'
                    'Cuidados Sociais'
                    'Apoio Psicol'#243'gico'
                    'Planeamento Familiar'
                    'Nutricionista'
                    'Outros')
                  TabOrder = 10
                  Values.Strings = (
                    '1'
                    '2'
                    '3'
                    '4'
                    '5'
                    '6'
                    '7'
                    '8'
                    '9'
                    '10'
                    '11'
                    '99')
                end
                object edOutrosOnde: TdxDBEdit
                  Left = 50
                  Top = 372
                  Width = 311
                  TabOrder = 11
                  Visible = False
                  DataField = 'DS_TRANSFERENCIA'
                  DataSource = dsControle
                  ReadOnly = False
                  StoredValues = 64
                end
              end
            end
            object tbPessoais: TTabSheet
              Caption = 'Dados Pessoais (Casos Positivos)'
              ImageIndex = 5
              inline framPaciente1: TframPaciente
                Left = 0
                Top = 0
                Width = 764
                Height = 431
                Align = alClient
                AutoScroll = False
                TabOrder = 0
                inherited GroupBox2: TGroupBox
                  inherited DBDateEdit3: TDBDateEdit
                    OnExit = framPaciente1DBDateEdit3Exit
                  end
                  inherited dxDBEdit2: TdxDBEdit
                    OnExit = framPaciente1dxDBEdit2Exit
                  end
                  inherited dxDBEdit5: TdxDBEdit
                    OnExit = framPaciente1dxDBEdit5Exit
                  end
                  inherited btLocProvincia: TdxDBButtonEdit
                    StoredValues = 64
                    ExistButtons = True
                  end
                  inherited btLocMunicipio: TdxDBButtonEdit
                    StoredValues = 64
                    ExistButtons = True
                  end
                  inherited btLocProvinciaMor: TdxDBButtonEdit
                    StoredValues = 64
                    ExistButtons = True
                  end
                  inherited btLocMunicipioMor: TdxDBButtonEdit
                    StoredValues = 64
                    ExistButtons = True
                  end
                  inherited btLocPais: TdxDBButtonEdit
                    StoredValues = 64
                    ExistButtons = True
                  end
                  inherited btLocOcupacao: TdxDBButtonEdit
                    StoredValues = 64
                    ExistButtons = True
                  end
                  inherited dxDBEdit9: TdxDBEdit
                    StoredValues = 64
                  end
                  inherited dxDBEdit10: TdxDBEdit
                    StoredValues = 64
                  end
                  inherited dxDBEdit11: TdxDBEdit
                    StoredValues = 64
                  end
                  inherited dxDBEdit12: TdxDBEdit
                    StoredValues = 64
                  end
                  inherited dxDBEdit13: TdxDBEdit
                    StoredValues = 64
                  end
                  inherited dxDBEdit14: TdxDBEdit
                    StoredValues = 64
                  end
                  inherited pendereco: TPanel
                    inherited Panel1: TPanel
                      inherited dxDBMemo1: TdxDBMemo
                        Height = 54
                      end
                    end
                  end
                  inherited pdica: TSecretPanel
                    Left = 228
                    Top = 174
                  end
                  inherited btCriancaExp: TBitBtn
                    Glyph.Data = {
                      360A0000424D360A000000000000360800002800000010000000100000000100
                      1000030000000002000000000000000000000001000000000000007C0000E003
                      00001F0000000000000000008000008000000080800080000000800080008080
                      0000C0C0C000C0DCC000F0CAA600330000000000330033003300333300001616
                      16001C1C1C002222220029292900555555004D4D4D004242420039393900807C
                      FF005050FF009300D600FFECCC00C6D6EF00D6E7E70090A9AD0000FF33000000
                      6600000099000000CC00003300000033330000336600003399000033CC000033
                      FF00006600000066330000666600006699000066CC000066FF00009900000099
                      330000996600009999000099CC000099FF0000CC000000CC330000CC660000CC
                      990000CCCC0000CCFF0000FF660000FF990000FFCC0033FF0000FF0033003300
                      6600330099003300CC003300FF00FF3300003333330033336600333399003333
                      CC003333FF00336600003366330033666600336699003366CC003366FF003399
                      00003399330033996600339999003399CC003399FF0033CC000033CC330033CC
                      660033CC990033CCCC0033CCFF0033FF330033FF660033FF990033FFCC0033FF
                      FF00660000006600330066006600660099006600CC006600FF00663300006633
                      330066336600663399006633CC006633FF006666000066663300666666006666
                      99006666CC00669900006699330066996600669999006699CC006699FF0066CC
                      000066CC330066CC990066CCCC0066CCFF0066FF000066FF330066FF990066FF
                      CC00CC00FF00FF00CC009999000099339900990099009900CC00990000009933
                      3300990066009933CC009900FF00996600009966330099336600996699009966
                      CC009933FF009999330099996600999999009999CC009999FF0099CC000099CC
                      330066CC660099CC990099CCCC0099CCFF0099FF000099FF330099CC660099FF
                      990099FFCC0099FFFF00CC00000099003300CC006600CC009900CC00CC009933
                      0000CC333300CC336600CC339900CC33CC00CC33FF00CC660000CC6633009966
                      6600CC669900CC66CC009966FF00CC990000CC993300CC996600CC999900CC99
                      CC00CC99FF00CCCC0000CCCC3300CCCC6600CCCC9900CCCCCC00CCCCFF00CCFF
                      0000CCFF330099FF6600CCFF9900CCFFCC00CCFFFF00CC003300FF006600FF00
                      9900CC330000FF333300FF336600FF339900FF33CC00FF33FF00FF660000FF66
                      3300CC666600FF669900FF66CC00CC66FF00FF990000FF993300FF996600FF99
                      9900FF99CC00FF99FF00FFCC0000FFCC3300FFCC6600FFCC9900FFCCCC00FFCC
                      FF00FFFF3300CCFF6600FFFF9900FFFFCC006666FF0066FF660066FFFF00FF66
                      6600FF66FF00FFFF66002100A5005F5F5F00777777008686860096969600CBCB
                      CB00B2B2B200D7D7D700DDDDDD00E3E3E300EAEAEA00F1F1F100F8F8F800F0FB
                      FF00A4A0A000808080000000FF0000FF000000FFFF00FF000000FF00FF00FFFF
                      0000FFFFFF001F7C1F7C1F7C1F7C1F7C1F7C00001F7C1F7C1F7C1F7C1F7C1F7C
                      1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C0000E07F00001F7C1F7C1F7C1F7C1F7C
                      1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C0000FF7F00001F7C1F7C1F7C1F7C1F7C
                      1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C0000E07F000000001F7C1F7C1F7C1F7C
                      1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C0000FF7F0000FF7F000000001F7C1F7C
                      1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C0000E07F0000E07F0000E07F00001F7C
                      1F7C1F7C1F7C1F7C1F7C1F7C1F7C00000000FF7F0000FF7F0000FF7F00001F7C
                      1F7C1F7C1F7C1F7C1F7C1F7C0000E07F0000E07FFF7FE07FFF7FE07F00001F7C
                      1F7C1F7C1F7C1F7C1F7C1F7C0000FF7F0000FF7FE07FFF7FE07FFF7F00001F7C
                      1F7C1F7C1F7C1F7C1F7C1F7C0000E07FFF7FE07FFF7FE07FFF7FE07F00001F7C
                      1F7C1F7C1F7C1F7C1F7C1F7C1F7C0000E07FFF7FE07FFF7FE07F00001F7C1F7C
                      1F7C1F7C1F7C1F7C1F7C1F7C1F7C000000000000000000000000000000001F7C
                      1F7C1F7C1F7C1F7C1F7C1F7C1F7C0000FF03FF03FF03FF03FF03FF0300001F7C
                      1F7C1F7C1F7C1F7C1F7C1F7C1F7C000000000000000000000000000000000000
                      1F7C1F7C1F7C1F7C1F7C1F7C1F7C0000000000000000000000000000E07F0000
                      1F7C1F7C1F7C1F7C1F7C1F7C1F7C000000000000000000000000000000000000
                      1F7C1F7C1F7C}
                  end
                  inherited pcriancaexp: TPanel
                    inherited dxDBEdit17: TdxDBEdit
                      StoredValues = 64
                    end
                  end
                end
              end
              object Panel8: TPanel
                Left = 0
                Top = 0
                Width = 764
                Height = 431
                Align = alClient
                BevelInner = bvLowered
                BevelOuter = bvNone
                TabOrder = 1
                inline framPaciente2: TframPaciente
                  Left = 1
                  Top = 1
                  Width = 762
                  Height = 429
                  Align = alClient
                  AutoScroll = False
                  AutoSize = True
                  TabOrder = 0
                  inherited GroupBox2: TGroupBox
                    inherited DBDateEdit3: TDBDateEdit
                      OnExit = framPaciente1DBDateEdit3Exit
                    end
                    inherited dxDBEdit2: TdxDBEdit
                      OnExit = framPaciente1dxDBEdit2Exit
                    end
                    inherited dxDBEdit5: TdxDBEdit
                      OnExit = framPaciente1dxDBEdit5Exit
                    end
                    inherited btLocProvincia: TdxDBButtonEdit
                      StoredValues = 64
                      ExistButtons = True
                    end
                    inherited btLocMunicipio: TdxDBButtonEdit
                      StoredValues = 64
                      ExistButtons = True
                    end
                    inherited btLocProvinciaMor: TdxDBButtonEdit
                      StoredValues = 64
                      ExistButtons = True
                    end
                    inherited btLocMunicipioMor: TdxDBButtonEdit
                      StoredValues = 64
                      ExistButtons = True
                    end
                    inherited btLocPais: TdxDBButtonEdit
                      StoredValues = 64
                      ExistButtons = True
                    end
                    inherited btLocOcupacao: TdxDBButtonEdit
                      StoredValues = 64
                      ExistButtons = True
                    end
                    inherited dxDBEdit9: TdxDBEdit
                      StoredValues = 64
                    end
                    inherited dxDBEdit10: TdxDBEdit
                      StoredValues = 64
                    end
                    inherited dxDBEdit11: TdxDBEdit
                      StoredValues = 64
                    end
                    inherited dxDBEdit12: TdxDBEdit
                      StoredValues = 64
                    end
                    inherited dxDBEdit13: TdxDBEdit
                      StoredValues = 64
                    end
                    inherited dxDBEdit14: TdxDBEdit
                      StoredValues = 64
                    end
                    inherited pendereco: TPanel
                      inherited Panel1: TPanel
                        inherited dxDBMemo1: TdxDBMemo
                          Height = 54
                        end
                      end
                    end
                    inherited dxDBEdit16: TdxDBEdit
                      OnExit = framPaciente2dxDBEdit16Exit
                    end
                    inherited pdica: TSecretPanel
                      inherited Label23: TLabel
                        Top = 12
                      end
                    end
                    inherited btCriancaExp: TBitBtn
                      Glyph.Data = {
                        360A0000424D360A000000000000360800002800000010000000100000000100
                        1000030000000002000000000000000000000001000000000000007C0000E003
                        00001F0000000000000000008000008000000080800080000000800080008080
                        0000C0C0C000C0DCC000F0CAA600330000000000330033003300333300001616
                        16001C1C1C002222220029292900555555004D4D4D004242420039393900807C
                        FF005050FF009300D600FFECCC00C6D6EF00D6E7E70090A9AD0000FF33000000
                        6600000099000000CC00003300000033330000336600003399000033CC000033
                        FF00006600000066330000666600006699000066CC000066FF00009900000099
                        330000996600009999000099CC000099FF0000CC000000CC330000CC660000CC
                        990000CCCC0000CCFF0000FF660000FF990000FFCC0033FF0000FF0033003300
                        6600330099003300CC003300FF00FF3300003333330033336600333399003333
                        CC003333FF00336600003366330033666600336699003366CC003366FF003399
                        00003399330033996600339999003399CC003399FF0033CC000033CC330033CC
                        660033CC990033CCCC0033CCFF0033FF330033FF660033FF990033FFCC0033FF
                        FF00660000006600330066006600660099006600CC006600FF00663300006633
                        330066336600663399006633CC006633FF006666000066663300666666006666
                        99006666CC00669900006699330066996600669999006699CC006699FF0066CC
                        000066CC330066CC990066CCCC0066CCFF0066FF000066FF330066FF990066FF
                        CC00CC00FF00FF00CC009999000099339900990099009900CC00990000009933
                        3300990066009933CC009900FF00996600009966330099336600996699009966
                        CC009933FF009999330099996600999999009999CC009999FF0099CC000099CC
                        330066CC660099CC990099CCCC0099CCFF0099FF000099FF330099CC660099FF
                        990099FFCC0099FFFF00CC00000099003300CC006600CC009900CC00CC009933
                        0000CC333300CC336600CC339900CC33CC00CC33FF00CC660000CC6633009966
                        6600CC669900CC66CC009966FF00CC990000CC993300CC996600CC999900CC99
                        CC00CC99FF00CCCC0000CCCC3300CCCC6600CCCC9900CCCCCC00CCCCFF00CCFF
                        0000CCFF330099FF6600CCFF9900CCFFCC00CCFFFF00CC003300FF006600FF00
                        9900CC330000FF333300FF336600FF339900FF33CC00FF33FF00FF660000FF66
                        3300CC666600FF669900FF66CC00CC66FF00FF990000FF993300FF996600FF99
                        9900FF99CC00FF99FF00FFCC0000FFCC3300FFCC6600FFCC9900FFCCCC00FFCC
                        FF00FFFF3300CCFF6600FFFF9900FFFFCC006666FF0066FF660066FFFF00FF66
                        6600FF66FF00FFFF66002100A5005F5F5F00777777008686860096969600CBCB
                        CB00B2B2B200D7D7D700DDDDDD00E3E3E300EAEAEA00F1F1F100F8F8F800F0FB
                        FF00A4A0A000808080000000FF0000FF000000FFFF00FF000000FF00FF00FFFF
                        0000FFFFFF001F7C1F7C1F7C1F7C1F7C1F7C00001F7C1F7C1F7C1F7C1F7C1F7C
                        1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C0000E07F00001F7C1F7C1F7C1F7C1F7C
                        1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C0000FF7F00001F7C1F7C1F7C1F7C1F7C
                        1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C0000E07F000000001F7C1F7C1F7C1F7C
                        1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C0000FF7F0000FF7F000000001F7C1F7C
                        1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C0000E07F0000E07F0000E07F00001F7C
                        1F7C1F7C1F7C1F7C1F7C1F7C1F7C00000000FF7F0000FF7F0000FF7F00001F7C
                        1F7C1F7C1F7C1F7C1F7C1F7C0000E07F0000E07FFF7FE07FFF7FE07F00001F7C
                        1F7C1F7C1F7C1F7C1F7C1F7C0000FF7F0000FF7FE07FFF7FE07FFF7F00001F7C
                        1F7C1F7C1F7C1F7C1F7C1F7C0000E07FFF7FE07FFF7FE07FFF7FE07F00001F7C
                        1F7C1F7C1F7C1F7C1F7C1F7C1F7C0000E07FFF7FE07FFF7FE07F00001F7C1F7C
                        1F7C1F7C1F7C1F7C1F7C1F7C1F7C000000000000000000000000000000001F7C
                        1F7C1F7C1F7C1F7C1F7C1F7C1F7C0000FF03FF03FF03FF03FF03FF0300001F7C
                        1F7C1F7C1F7C1F7C1F7C1F7C1F7C000000000000000000000000000000000000
                        1F7C1F7C1F7C1F7C1F7C1F7C1F7C0000000000000000000000000000E07F0000
                        1F7C1F7C1F7C1F7C1F7C1F7C1F7C000000000000000000000000000000000000
                        1F7C1F7C1F7C}
                    end
                    inherited pcriancaexp: TPanel
                      inherited dxDBEdit17: TdxDBEdit
                        StoredValues = 64
                      end
                    end
                  end
                end
              end
            end
          end
        end
      end
    end
  end
  inherited dsControle: TDataSource
    DataSet = DMGERAL.TB_CARACTERIZACAO
    OnDataChange = dsControleDataChange
    Left = 493
    Top = 13
  end
  inherited dsGrid: TDataSource
    DataSet = qyCaracterizacao
    Left = 461
    Top = 13
  end
  object ImageList1: TImageList
    Left = 722
    Top = 208
    Bitmap = {
      494C010103000400040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000001000000001002000000000000010
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FF00
      0000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF00
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000F2F2F200F5F5F5000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000FFFF00000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FF00
      000000FF0000FF000000FF000000FF000000FF000000FF000000FF000000FF00
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000E3E3E300237F2300D5D5D5000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFF00000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FF00
      0000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF00
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FEFEFE00D0D0D0000A7F0A000F790F00D7D7D7000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000FFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FF00000000FF000000FF000000FF000000FF000000FF000000FF00007366
      300000000000000000000000000000000000000000000000000000000000FBFB
      FB00DDDDDD00ADADAD007D887D00087F08005FF15F00167216009B9B9B00DDDD
      DD00FBFBFB000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFF0000000000FFFFFF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF00
      0000000000000000000000000000000000000000000000000000E2E2E2006088
      60001287120029B0290046D5460059EC5A0059EC5A0030B63000138613003961
      39008D8D8D00E2E2E20000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000FFFF000000000000FFFF000000000000FFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FF00000020DFDF00FFDFDF0020DFDF00FFDFDF0020DFDF00FF00
      00000000000000000000000000000000000000000000D2D5D2001487140022B8
      220030C731003DD23D0047DB47004DE14E004DE24D0048DB47003DD23D002FC3
      2F001285130062666200D7D7D700000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFF0000000000FFFFFF0000000000FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FF00000000FFFF000000000000FFFF000000000000FFFF00FFDFDF0000FF
      FF00FF000000000000000000000000000000ECECEC000C8F0C0017AF17001FB7
      1F0029C0280032C832003BD03B003FD53F003FD43F003AD03B0032C9320028C0
      28001EB61E000D8F0D006C6C6C00ECECEC000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000FFFF000000000000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FF0000000000000000FFFF000000000000FFFF0000000000FF0000000000
      0000FF000000000000000000000000000000358D350015AE150015AE150018B2
      18001FB8200027BE27002DC42D0030C7300031C730002DC42D0027BE260020B7
      200019B2190015AE150018701800B1B1B1000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF0000000000FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FF00000000FFFF00FFDFDF0000FFFF00FFDFDF0000FFFF00FF00000020DF
      DF00FF0000000000000000000000000000000F9A0F0015AE150015AE150015AE
      150018B118001DB51C0020B8210023BB230022BB230021B920001DB51C0018B0
      180015AE150015AE15000F9A0F00838383000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FF000000FFDFDF00FF000000FFC3C300FF000000FFDFDF00FF000000FF00
      00000000000000000000000000000000000014AB140015AE15001BB01B004BC1
      4B006CCC6C0069CB690066CB660062CA63005EC95E0057C657004FC24F0041BD
      410024B3240015AE150014AB1400787878000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FF00000020DFDF00FF00000058A7A700FF00000020DFDF00FF0000000000
      00000000000000000000000000000000000012A4120058C558007CD27C007BD1
      7B0079D1790075CF750072CE72006CCC6C0067CA670060C8600059C6590052C3
      52004AC04A0043BE430019A71900969696000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FF000000FF000000FFC3C300FF000000FFDFDF00FF0000000000
      0000000000000000000000000000000000002B9D2B008AD68A008AD68A0088D6
      880086D5860082D482007ED27E0078D0780072CE72006BCC6B0063C963005CC6
      5C0053C453004AC04A001A951A00D1D1D1000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF00000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FF000000FF00000020DFDF00FF0000000000
      000000000000000000000000000000000000A5CFA5007BCD7B0096DB960095DA
      950093DA93008FD88F008AD68A0084D484007DD27D0075CF75006DCC6D0065CA
      65005CC65C0044B844006B966B00FBFBFB000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FF000000FFDFDF00FF0000000000
      0000000000000000000000000000000000000000000077B7770081CE8100A2DF
      A200A0DEA0009BDC9B0096DB96008FD88F0088D6880080D3800077D077006ECD
      6E004EBA4E0051915100F7F7F700000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000000000FF
      FF00000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FF00000020DFDF00FF0000000000
      0000000000000000000000000000000000000000000000000000B5D7B50037A0
      370098D99800A8E1A800A1DFA1009BDC9B0093DA93008AD68A0071CB71002899
      28009CBE9C00FBFBFB0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FF000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000D5E8D5006CB06C00278D270009800900268B260065A86500C8DCC800FDFD
      FD00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000100000000100010000000000800000000000000000000000
      000000000000000000000000FFFFFF00FDFFE00FFF9F0000F8FFE00FFF1F0000
      F8FFE00FFC1F0000F87FF00FE0070000F81FF00FC0030000F80FF80F80010000
      F00FF28700000000E00FF55700000000E00FF00700000000E00FF00F00000000
      F01FF01F00000000F00FF81F00000000F00FFE1F00000000F007FF1F80010000
      F007FF1FC0030000F007FFBFF00F000000000000000000000000000000000000
      000000000000}
  end
  object qyCaracterizacao: TIBQuery
    Database = DM.DB
    Transaction = DM.TS
    OnCalcFields = qyCaracterizacaoCalcFields
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select '
      'CARACTERIZACAO.*,'
      '(SELECT DS_PROVINCIA FROM PROVINCIA'
      'WHERE CD_PROVINCIA = CARACTERIZACAO.CD_PROVINCIA)DS_PROVINCIA,'
      '(SELECT DS_MUNICIPIO FROM MUNICIPIO'
      'WHERE CD_MUNICIPIO = CARACTERIZACAO.CD_MUNICIPIO)DS_MUNICIPIO,'
      '(SELECT DS_UNIDADE FROM UNIDADE'
      'WHERE CD_UNIDADE = CARACTERIZACAO.CD_UNIDADE)DS_UNIDADE,'
      '(SELECT NM_INVESTIGADOR FROM INVESTIGADOR'
      
        'WHERE CD_INVESTIGADOR = CARACTERIZACAO.CD_INVESTIGADOR)DS_INVEST' +
        'IGADOR'
      'from CARACTERIZACAO'
      'where 1=2')
    Left = 490
    Top = 200
    object qyCaracterizacaoCD_CARACTERIZACAO: TIntegerField
      FieldName = 'CD_CARACTERIZACAO'
      Origin = 'CARACTERIZACAO.CD_CARACTERIZACAO'
      Required = True
    end
    object qyCaracterizacaoCD_PROVINCIA: TIntegerField
      FieldName = 'CD_PROVINCIA'
      Origin = 'CARACTERIZACAO.CD_PROVINCIA'
    end
    object qyCaracterizacaoCD_MUNICIPIO: TIntegerField
      FieldName = 'CD_MUNICIPIO'
      Origin = 'CARACTERIZACAO.CD_MUNICIPIO'
    end
    object qyCaracterizacaoCD_UNIDADE: TIntegerField
      FieldName = 'CD_UNIDADE'
      Origin = 'CARACTERIZACAO.CD_UNIDADE'
    end
    object qyCaracterizacaoCD_LOCAL: TIntegerField
      FieldName = 'CD_LOCAL'
      Origin = 'CARACTERIZACAO.CD_LOCAL'
    end
    object qyCaracterizacaoCD_UTENTE: TIntegerField
      FieldName = 'CD_UTENTE'
      Origin = 'CARACTERIZACAO.CD_UTENTE'
    end
    object qyCaracterizacaoCD_INVESTIGADOR: TIntegerField
      FieldName = 'CD_INVESTIGADOR'
      Origin = 'CARACTERIZACAO.CD_INVESTIGADOR'
    end
    object qyCaracterizacaoDT_VISITA: TDateTimeField
      FieldName = 'DT_VISITA'
      Origin = 'CARACTERIZACAO.DT_VISITA'
    end
    object qyCaracterizacaoFL_SEXO: TIntegerField
      FieldName = 'FL_SEXO'
      Origin = 'CARACTERIZACAO.FL_SEXO'
    end
    object qyCaracterizacaoNR_IDADE: TIntegerField
      FieldName = 'NR_IDADE'
      Origin = 'CARACTERIZACAO.NR_IDADE'
    end
    object qyCaracterizacaoTP_SESSAO: TIntegerField
      FieldName = 'TP_SESSAO'
      Origin = 'CARACTERIZACAO.TP_SESSAO'
    end
    object qyCaracterizacaoCD_ESTADO_CIVIL: TIntegerField
      FieldName = 'CD_ESTADO_CIVIL'
      Origin = 'CARACTERIZACAO.CD_ESTADO_CIVIL'
    end
    object qyCaracterizacaoNR_FILHOS: TIntegerField
      FieldName = 'NR_FILHOS'
      Origin = 'CARACTERIZACAO.NR_FILHOS'
    end
    object qyCaracterizacaoFL_GESTANTE: TIntegerField
      FieldName = 'FL_GESTANTE'
      Origin = 'CARACTERIZACAO.FL_GESTANTE'
    end
    object qyCaracterizacaoNR_SEMANAS_GESTANTE: TIntegerField
      FieldName = 'NR_SEMANAS_GESTANTE'
      Origin = 'CARACTERIZACAO.NR_SEMANAS_GESTANTE'
    end
    object qyCaracterizacaoFL_AMAMENTA: TIntegerField
      FieldName = 'FL_AMAMENTA'
      Origin = 'CARACTERIZACAO.FL_AMAMENTA'
    end
    object qyCaracterizacaoCD_ESCOLARIDADE: TIntegerField
      FieldName = 'CD_ESCOLARIDADE'
      Origin = 'CARACTERIZACAO.CD_ESCOLARIDADE'
    end
    object qyCaracterizacaoDS_ESCORALIDADE: TIBStringField
      FieldName = 'DS_ESCORALIDADE'
      Origin = 'CARACTERIZACAO.DS_ESCORALIDADE'
      Size = 50
    end
    object qyCaracterizacaoCD_OCUPACAO: TIntegerField
      FieldName = 'CD_OCUPACAO'
      Origin = 'CARACTERIZACAO.CD_OCUPACAO'
    end
    object qyCaracterizacaoDS_OCUPACAO: TIBStringField
      FieldName = 'DS_OCUPACAO'
      Origin = 'CARACTERIZACAO.DS_OCUPACAO'
      Size = 50
    end
    object qyCaracterizacaoFL_EMPREGADA: TIntegerField
      FieldName = 'FL_EMPREGADA'
      Origin = 'CARACTERIZACAO.FL_EMPREGADA'
    end
    object qyCaracterizacaoFL_OUVIU_FALAR: TIntegerField
      FieldName = 'FL_OUVIU_FALAR'
      Origin = 'CARACTERIZACAO.FL_OUVIU_FALAR'
    end
    object qyCaracterizacaoCD_RAZAO: TIntegerField
      FieldName = 'CD_RAZAO'
      Origin = 'CARACTERIZACAO.CD_RAZAO'
    end
    object qyCaracterizacaoDS_RAZAO: TIBStringField
      FieldName = 'DS_RAZAO'
      Origin = 'CARACTERIZACAO.DS_RAZAO'
      Size = 100
    end
    object qyCaracterizacaoCD_INDICACAO: TIntegerField
      FieldName = 'CD_INDICACAO'
      Origin = 'CARACTERIZACAO.CD_INDICACAO'
    end
    object qyCaracterizacaoDS_INDICACAO: TIBStringField
      FieldName = 'DS_INDICACAO'
      Origin = 'CARACTERIZACAO.DS_INDICACAO'
      Size = 100
    end
    object qyCaracterizacaoFL_TRANSFUSAO: TIntegerField
      FieldName = 'FL_TRANSFUSAO'
      Origin = 'CARACTERIZACAO.FL_TRANSFUSAO'
    end
    object qyCaracterizacaoFL_TATUAGEM: TIntegerField
      FieldName = 'FL_TATUAGEM'
      Origin = 'CARACTERIZACAO.FL_TATUAGEM'
    end
    object qyCaracterizacaoFL_CIRURGIA: TIntegerField
      FieldName = 'FL_CIRURGIA'
      Origin = 'CARACTERIZACAO.FL_CIRURGIA'
    end
    object qyCaracterizacaoFL_CIRCUNCISAO: TIntegerField
      FieldName = 'FL_CIRCUNCISAO'
      Origin = 'CARACTERIZACAO.FL_CIRCUNCISAO'
    end
    object qyCaracterizacaoNR_PARTOS: TIntegerField
      FieldName = 'NR_PARTOS'
      Origin = 'CARACTERIZACAO.NR_PARTOS'
    end
    object qyCaracterizacaoNR_ABORTOS: TIntegerField
      FieldName = 'NR_ABORTOS'
      Origin = 'CARACTERIZACAO.NR_ABORTOS'
    end
    object qyCaracterizacaoFL_AMAMENTOU_OUTROS: TIntegerField
      FieldName = 'FL_AMAMENTOU_OUTROS'
      Origin = 'CARACTERIZACAO.FL_AMAMENTOU_OUTROS'
    end
    object qyCaracterizacaoNR_IDADE_EXPERIENCIA: TIntegerField
      FieldName = 'NR_IDADE_EXPERIENCIA'
      Origin = 'CARACTERIZACAO.NR_IDADE_EXPERIENCIA'
    end
    object qyCaracterizacaoFL_SEXO_ALCOOL: TIntegerField
      FieldName = 'FL_SEXO_ALCOOL'
      Origin = 'CARACTERIZACAO.FL_SEXO_ALCOOL'
    end
    object qyCaracterizacaoFL_SEXO_DROGAS: TIntegerField
      FieldName = 'FL_SEXO_DROGAS'
      Origin = 'CARACTERIZACAO.FL_SEXO_DROGAS'
    end
    object qyCaracterizacaoFL_SEXO_DINHEIRO: TIntegerField
      FieldName = 'FL_SEXO_DINHEIRO'
      Origin = 'CARACTERIZACAO.FL_SEXO_DINHEIRO'
    end
    object qyCaracterizacaoFL_SEXO_MATERIAL: TIntegerField
      FieldName = 'FL_SEXO_MATERIAL'
      Origin = 'CARACTERIZACAO.FL_SEXO_MATERIAL'
    end
    object qyCaracterizacaoFL_SINAIS_ITS: TIntegerField
      FieldName = 'FL_SINAIS_ITS'
      Origin = 'CARACTERIZACAO.FL_SINAIS_ITS'
    end
    object qyCaracterizacaoCD_SINAIS_ITS: TIntegerField
      FieldName = 'CD_SINAIS_ITS'
      Origin = 'CARACTERIZACAO.CD_SINAIS_ITS'
    end
    object qyCaracterizacaoDS_SINAIS_ITS: TIBStringField
      FieldName = 'DS_SINAIS_ITS'
      Origin = 'CARACTERIZACAO.DS_SINAIS_ITS'
      Size = 30
    end
    object qyCaracterizacaoNR_PARCEIROS_SEXUAIS: TIntegerField
      FieldName = 'NR_PARCEIROS_SEXUAIS'
      Origin = 'CARACTERIZACAO.NR_PARCEIROS_SEXUAIS'
    end
    object qyCaracterizacaoFL_PARCEIRO_SEXUAL: TIntegerField
      FieldName = 'FL_PARCEIRO_SEXUAL'
      Origin = 'CARACTERIZACAO.FL_PARCEIRO_SEXUAL'
    end
    object qyCaracterizacaoFL_PRESERVATIVO: TIntegerField
      FieldName = 'FL_PRESERVATIVO'
      Origin = 'CARACTERIZACAO.FL_PRESERVATIVO'
    end
    object qyCaracterizacaoFL_PRESERVATIVO_NAO_REGULAR: TIntegerField
      FieldName = 'FL_PRESERVATIVO_NAO_REGULAR'
      Origin = 'CARACTERIZACAO.FL_PRESERVATIVO_NAO_REGULAR'
    end
    object qyCaracterizacaoFL_TESTE: TIntegerField
      FieldName = 'FL_TESTE'
      Origin = 'CARACTERIZACAO.FL_TESTE'
    end
    object qyCaracterizacaoCD_TESTE: TIntegerField
      FieldName = 'CD_TESTE'
      Origin = 'CARACTERIZACAO.CD_TESTE'
    end
    object qyCaracterizacaoDS_TESTE: TIBStringField
      FieldName = 'DS_TESTE'
      Origin = 'CARACTERIZACAO.DS_TESTE'
      Size = 50
    end
    object qyCaracterizacaoDT_TESTE: TDateTimeField
      FieldName = 'DT_TESTE'
      Origin = 'CARACTERIZACAO.DT_TESTE'
    end
    object qyCaracterizacaoFL_TESTE_RECENTES: TIntegerField
      FieldName = 'FL_TESTE_RECENTES'
      Origin = 'CARACTERIZACAO.FL_TESTE_RECENTES'
    end
    object qyCaracterizacaoFL_TESTE_PARCEIROS: TIntegerField
      FieldName = 'FL_TESTE_PARCEIROS'
      Origin = 'CARACTERIZACAO.FL_TESTE_PARCEIROS'
    end
    object qyCaracterizacaoFL_ITS: TIntegerField
      FieldName = 'FL_ITS'
      Origin = 'CARACTERIZACAO.FL_ITS'
    end
    object qyCaracterizacaoCD_SINTOMAS_ITS: TIntegerField
      FieldName = 'CD_SINTOMAS_ITS'
      Origin = 'CARACTERIZACAO.CD_SINTOMAS_ITS'
    end
    object qyCaracterizacaoDS_SINTOMAS_ITS: TIBStringField
      FieldName = 'DS_SINTOMAS_ITS'
      Origin = 'CARACTERIZACAO.DS_SINTOMAS_ITS'
      Size = 30
    end
    object qyCaracterizacaoFL_TESTE_HOJE: TIntegerField
      FieldName = 'FL_TESTE_HOJE'
      Origin = 'CARACTERIZACAO.FL_TESTE_HOJE'
    end
    object qyCaracterizacaoFL_TESTE_RESULTADOS: TIntegerField
      FieldName = 'FL_TESTE_RESULTADOS'
      Origin = 'CARACTERIZACAO.FL_TESTE_RESULTADOS'
    end
    object qyCaracterizacaoFL_PARCEIROS_RESULTADOS: TIntegerField
      FieldName = 'FL_PARCEIROS_RESULTADOS'
      Origin = 'CARACTERIZACAO.FL_PARCEIROS_RESULTADOS'
    end
    object qyCaracterizacaoFL_REVELAR: TIntegerField
      FieldName = 'FL_REVELAR'
      Origin = 'CARACTERIZACAO.FL_REVELAR'
    end
    object qyCaracterizacaoCD_REVELAR: TIntegerField
      FieldName = 'CD_REVELAR'
      Origin = 'CARACTERIZACAO.CD_REVELAR'
    end
    object qyCaracterizacaoDS_REVELAR: TIBStringField
      FieldName = 'DS_REVELAR'
      Origin = 'CARACTERIZACAO.DS_REVELAR'
      Size = 50
    end
    object qyCaracterizacaoFL_PLANO_REDUCAO: TIntegerField
      FieldName = 'FL_PLANO_REDUCAO'
      Origin = 'CARACTERIZACAO.FL_PLANO_REDUCAO'
    end
    object qyCaracterizacaoCD_PLANO_REDUCAO: TIntegerField
      FieldName = 'CD_PLANO_REDUCAO'
      Origin = 'CARACTERIZACAO.CD_PLANO_REDUCAO'
    end
    object qyCaracterizacaoDS_PLANO_REDUCAO: TIBStringField
      FieldName = 'DS_PLANO_REDUCAO'
      Origin = 'CARACTERIZACAO.DS_PLANO_REDUCAO'
      Size = 50
    end
    object qyCaracterizacaoFL_RECEBEU_PRESERVATIVOS: TIntegerField
      FieldName = 'FL_RECEBEU_PRESERVATIVOS'
      Origin = 'CARACTERIZACAO.FL_RECEBEU_PRESERVATIVOS'
    end
    object qyCaracterizacaoFL_TRANSFERENCIA: TIntegerField
      FieldName = 'FL_TRANSFERENCIA'
      Origin = 'CARACTERIZACAO.FL_TRANSFERENCIA'
    end
    object qyCaracterizacaoCD_TRANSFERENCIA: TIntegerField
      FieldName = 'CD_TRANSFERENCIA'
      Origin = 'CARACTERIZACAO.CD_TRANSFERENCIA'
    end
    object qyCaracterizacaoDS_TRANSFERENCIA: TIBStringField
      FieldName = 'DS_TRANSFERENCIA'
      Origin = 'CARACTERIZACAO.DS_TRANSFERENCIA'
      Size = 100
    end
    object qyCaracterizacaoFL_SERVICO_SAUDE: TIntegerField
      FieldName = 'FL_SERVICO_SAUDE'
      Origin = 'CARACTERIZACAO.FL_SERVICO_SAUDE'
    end
    object qyCaracterizacaoCD_PACIENTE: TIntegerField
      FieldName = 'CD_PACIENTE'
      Origin = 'CARACTERIZACAO.CD_PACIENTE'
    end
    object qyCaracterizacaoDS_PROVINCIA: TIBStringField
      FieldName = 'DS_PROVINCIA'
      Size = 50
    end
    object qyCaracterizacaoDS_MUNICIPIO: TIBStringField
      FieldName = 'DS_MUNICIPIO'
      Size = 50
    end
    object qyCaracterizacaoDS_UNIDADE: TIBStringField
      FieldName = 'DS_UNIDADE'
      Size = 50
    end
    object qyCaracterizacaoDS_INVESTIGADOR: TIBStringField
      FieldName = 'DS_INVESTIGADOR'
      Size = 50
    end
    object qyCaracterizacaoSEXO: TStringField
      FieldKind = fkCalculated
      FieldName = 'SEXO'
      Size = 1
      Calculated = True
    end
    object qyCaracterizacaoTESTE_HOJE: TStringField
      FieldKind = fkCalculated
      FieldName = 'TESTE_HOJE'
      Size = 1
      Calculated = True
    end
  end
  object dsPacienteExistente: TDataSource
    AutoEdit = False
    DataSet = qyPacienteExistente
    Left = 722
    Top = 191
  end
  object qyPacienteExistente: TIBQuery
    Database = DM.DB
    Transaction = DM.TS
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select "PACIENTE"."CD_PACIENTE"'
      '      ,"PACIENTE"."NM_PACIENTE"'
      '      ,"PACIENTE"."DT_NASCIMENTO"'
      '      ,"PACIENTE"."NM_MAE"'
      'from "PACIENTE"'
      ''
      '')
    Left = 716
    Top = 149
    object qyPacienteExistenteCD_PACIENTE: TIntegerField
      FieldName = 'CD_PACIENTE'
      Origin = 'PACIENTE.CD_PACIENTE'
      Required = True
    end
    object qyPacienteExistenteNM_PACIENTE: TIBStringField
      FieldName = 'NM_PACIENTE'
      Origin = 'PACIENTE.NM_PACIENTE'
      Required = True
      Size = 50
    end
    object qyPacienteExistenteDT_NASCIMENTO: TDateField
      FieldName = 'DT_NASCIMENTO'
      Origin = 'PACIENTE.DT_NASCIMENTO'
      Required = True
    end
    object qyPacienteExistenteNM_MAE: TIBStringField
      FieldName = 'NM_MAE'
      Origin = 'PACIENTE.NM_MAE'
      Required = True
      Size = 50
    end
  end
end
