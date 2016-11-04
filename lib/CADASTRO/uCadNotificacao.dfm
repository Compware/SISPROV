inherited frmCadNotificacao: TfrmCadNotificacao
  Left = 457
  Top = 164
  Caption = 'Identifica'#231#227'o'
  ClientHeight = 581
  ClientWidth = 840
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited sbPadrao: TStatusBar
    Top = 562
    Width = 840
  end
  inherited Panel1: TPanel
    Width = 840
    inherited btPesquisar: TBitBtn
      OnClick = btPesquisarClick
    end
    inherited btfechar: TBitBtn
      Left = 792
    end
    object btatualizaNR: TBitBtn
      Left = 632
      Top = 3
      Width = 153
      Height = 45
      Hint = 'Atualizar Nr Notifica'#231#227'o'
      Anchors = [akLeft, akTop, akBottom]
      Caption = 'Atualizar Nr Notifica'#231#227'o'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 10
      Visible = False
      OnClick = btatualizaNRClick
    end
  end
  inherited Panel2: TPanel
    Top = 77
    Width = 840
    Height = 485
    object Label11: TLabel [0]
      Left = 64
      Top = 8
      Width = 38
      Height = 13
      Caption = 'Label11'
    end
    inherited pgGeral: TPageControl
      Width = 838
      Height = 483
      OnChange = nil
      OnChanging = nil
      inherited tabLista: TTabSheet
        OnShow = tabListaShow
        inherited Panel3: TPanel
          Width = 830
          Height = 455
          inherited grDados: TdxDBGrid
            Width = 828
            Height = 453
            KeyField = 'CHAVE'
            SummaryGroups = <
              item
                DefaultGroup = False
                SummaryItems = <
                  item
                    SummaryField = 'CD_PACIENTE'
                    SummaryFormat = '(TOTAL=0)'
                    SummaryType = cstCount
                  end>
                Name = 'grDadosSummaryGroup1'
              end>
            Filter.Criteria = {00000000}
            GroupPanelColor = 10070188
            GroupPanelFontColor = 14215660
            ShowRowFooter = True
            object grDadosColumn2: TdxDBGridColumn
              Caption = 'Notifica'#231#227'o'
              BandIndex = 0
              RowIndex = 0
              FieldName = 'NR_NOTIFICACAO'
            end
            object grDadosColumn4: TdxDBGridColumn
              Caption = 'Data Notfica'#231#227'o'
              Width = 59
              BandIndex = 0
              RowIndex = 0
              FieldName = 'DT_NOTIFICACAO'
            end
            object grDadosColumn10: TdxDBGridColumn
              Caption = 'N'#186' Processo'
              Width = 65
              BandIndex = 0
              RowIndex = 0
              FieldName = 'NR_PROCESSO'
            end
            object grDadosColumn13: TdxDBGridColumn
              Caption = 'Idade na Identifica'#231#227'o'
              BandIndex = 0
              RowIndex = 0
              FieldName = 'NR_IDADE_IDENTIFICACAO'
            end
            object grDadosColumn7: TdxDBGridColumn
              Caption = 'Utente'
              Width = 194
              BandIndex = 0
              RowIndex = 0
              FieldName = 'NM_PACIENTE'
            end
            object grDadosColumn5: TdxDBGridColumn
              Caption = 'M'#233'dico'
              Width = 175
              BandIndex = 0
              RowIndex = 0
              FieldName = 'NM_MEDICO'
            end
            object grDadosColumn8: TdxDBGridColumn
              Visible = False
              Width = 50
              BandIndex = 0
              RowIndex = 0
              FieldName = 'CHAVE'
            end
            object grDadosColumn6: TdxDBGridColumn
              Caption = 'Entrevistador'
              Width = 191
              BandIndex = 0
              RowIndex = 0
              FieldName = 'NM_ENTREVISTADOR'
            end
            object grDadosColumn9: TdxDBGridColumn
              Caption = 'Unidade'
              Sorted = csUp
              Visible = False
              Width = 293
              BandIndex = 0
              RowIndex = 0
              FieldName = 'DS_UNIDADE'
              GroupIndex = 0
              SummaryGroupName = 'grDadosSummaryGroup1'
            end
            object grDadosColumn12: TdxDBGridColumn
              Caption = 'Ficha'
              Width = 34
              BandIndex = 0
              RowIndex = 0
              FieldName = 'CD_FICHA'
            end
            object grDadosColumn11: TdxDBGridColumn
              Visible = False
              Width = 91
              BandIndex = 0
              RowIndex = 0
              FieldName = 'CD_FICHA'
            end
          end
        end
      end
      inherited tabGeral: TTabSheet
        Caption = 'Notifica'#231#227'o'
        inherited Panel4: TPanel
          Width = 830
          Height = 455
          object pgNotificacao: TPageControl
            Left = 1
            Top = 1
            Width = 828
            Height = 453
            ActivePage = tbNotificacao
            Align = alClient
            TabOrder = 0
            object tbNotificacao: TTabSheet
              Caption = 'Dados Gerais'
              OnShow = tbNotificacaoShow
              object GroupBox1: TGroupBox
                Left = 6
                Top = 4
                Width = 610
                Height = 248
                TabOrder = 0
                object Label1: TLabel
                  Left = 9
                  Top = 17
                  Width = 214
                  Height = 13
                  Caption = '1. Numero da Notifica'#231#227'o..............................:'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  ParentFont = False
                end
                object Label2: TLabel
                  Left = 9
                  Top = 39
                  Width = 206
                  Height = 13
                  Caption = '2. Data da Notifica'#231#227'o................................:'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  ParentFont = False
                end
                object Label3: TLabel
                  Left = 9
                  Top = 61
                  Width = 205
                  Height = 13
                  Caption = '3. Prov'#237'ncia da Notifica'#231#227'o........................:'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  ParentFont = False
                end
                object Label4: TLabel
                  Left = 8
                  Top = 82
                  Width = 206
                  Height = 13
                  Caption = '4. Munic'#237'pio da Notifica'#231#227'o........................:'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  ParentFont = False
                end
                object Label5: TLabel
                  Left = 7
                  Top = 106
                  Width = 207
                  Height = 13
                  Caption = '5. Unidade Sanit'#225'ria de Notifica'#231#227'o............:'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  ParentFont = False
                end
                object Label6: TLabel
                  Left = 9
                  Top = 129
                  Width = 205
                  Height = 13
                  Caption = '6. Tipo de Entrada......................................:'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  ParentFont = False
                end
                object Label7: TLabel
                  Left = 9
                  Top = 150
                  Width = 205
                  Height = 13
                  Caption = '7. Data do Diagn'#243'stico VIH........................:'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  ParentFont = False
                end
                object Label8: TLabel
                  Left = 9
                  Top = 222
                  Width = 587
                  Height = 13
                  Caption = 
                    '(Considerar comprova'#231#227'o documentada: an'#225'lise laboratorial ou rel' +
                    'at'#243'rio m'#233'dico, na aus'#234'ncia, fazer nova an'#225'lise laboratorial)'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clNavy
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  ParentFont = False
                end
                object Label70: TLabel
                  Left = 214
                  Top = 37
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
                  Left = 214
                  Top = 58
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
                  Left = 214
                  Top = 80
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
                object Label73: TLabel
                  Left = 214
                  Top = 102
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
                object Label74: TLabel
                  Left = 214
                  Top = 146
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
                object DBText1: TDBText
                  Left = 354
                  Top = 13
                  Width = 50
                  Height = 13
                  AutoSize = True
                  DataField = 'CD_FICHA'
                  DataSource = dsControle
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clRed
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = [fsBold]
                  ParentFont = False
                end
                object Label81: TLabel
                  Left = 392
                  Top = 127
                  Width = 44
                  Height = 13
                  Caption = '6a. Data:'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  ParentFont = False
                end
                object Label82: TLabel
                  Left = 214
                  Top = 124
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
                object Label84: TLabel
                  Left = 20
                  Top = 170
                  Width = 194
                  Height = 13
                  Caption = 'Idade no momento da Identifica'#231#227'o........:'
                end
                object lblNR_IDADE_IDENTIFICACAO: TLabel
                  Left = 226
                  Top = 170
                  Width = 3
                  Height = 13
                end
                object dxDBEdit1: TdxDBEdit
                  Left = 225
                  Top = 12
                  Width = 121
                  Color = cl3DLight
                  TabOrder = 0
                  TabStop = False
                  OnKeyDown = dxDBEdit1KeyDown
                  DataField = 'NR_NOTIFICACAO'
                  DataSource = dsControle
                  ReadOnly = True
                  StoredValues = 64
                end
                object DBDateEdit1: TDBDateEdit
                  Left = 225
                  Top = 34
                  Width = 121
                  Height = 21
                  DataField = 'DT_NOTIFICACAO'
                  DataSource = dsControle
                  NumGlyphs = 2
                  TabOrder = 1
                  OnChange = DBDateEdit1Change
                end
                object DBDateEdit2: TDBDateEdit
                  Left = 225
                  Top = 144
                  Width = 121
                  Height = 21
                  DataField = 'DT_DIAGNOSTICO'
                  DataSource = dsControle
                  GlyphKind = gkCustom
                  Glyph.Data = {
                    76050000424D760500000000000036000000280000001C0000000C0000000100
                    2000000000004005000000000000000000000000000000000000FF00FF00FF00
                    FF00FF00FF008080800080808000808080008080800080808000808080008080
                    800080808000808080008080800080808000FF00FF00FF00FF00FFFFFF00FFFF
                    FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                    FF00FFFFFF00FFFFFF00FF00FF00FF00FF000000000000000000800000000000
                    0000800000008000000000000000800000000000000000000000800000008080
                    8000FF00FF008080800080808000808080008080800080808000808080008080
                    80008080800080808000808080008080800080808000FFFFFF00FF00FF00FF00
                    FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                    FF00FFFFFF00FFFFFF008000000080808000FF00FF0080808000FFFFFF00FF00
                    FF00FFFFFF00FFFFFF00FFFFFF00FF00FF00FFFFFF00FFFFFF00FFFFFF00FF00
                    FF0080808000FFFFFF00FF00FF00FF00FF00FFFFFF0000000000000000000000
                    0000FFFFFF00000000000000000000000000C0C0C000FFFFFF00800000008080
                    8000FF00FF0080808000FFFFFF00808080008080800080808000FF00FF008080
                    80008080800080808000FF00FF00FFFFFF0080808000FFFFFF00FF00FF00FF00
                    FF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF00C0C0C000FFFFFF00C0C0
                    C00000000000FFFFFF008000000080808000FF00FF0080808000FFFFFF00FF00
                    FF0080808000FFFFFF00FF00FF00FF00FF00FF00FF00FF00FF0080808000FFFF
                    FF0080808000FFFFFF00FF00FF00FF00FF00FFFFFF00FFFFFF0000000000FFFF
                    FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF00800000008080
                    8000FF00FF0080808000FFFFFF00FF00FF0080808000FFFFFF00FF00FF00FF00
                    FF00FFFFFF00FFFFFF0080808000FF00FF0080808000FFFFFF00FF00FF00FF00
                    FF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF0000000000000000000000
                    0000C0C0C000FFFFFF008000000080808000FF00FF0080808000FFFFFF00FF00
                    FF0080808000FFFFFF00FF00FF00808080008080800080808000FF00FF00FF00
                    FF0080808000FFFFFF00FF00FF00FF00FF00FFFFFF000000000000000000FFFF
                    FF00FFFFFF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00800000008080
                    8000FF00FF0080808000FFFFFF008080800080808000FFFFFF00FF00FF008080
                    8000FFFFFF00FFFFFF00FFFFFF00FFFFFF0080808000FFFFFF00FF00FF00FF00
                    FF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF0000000000000000000000
                    000000000000FFFFFF008000000080808000FF00FF0080808000FFFFFF00FF00
                    FF0080808000FF00FF00FF00FF0080808000808080008080800080808000FF00
                    FF0080808000FFFFFF00FF00FF00FF00FF00FFFFFF00FFFFFF00FFFFFF00FFFF
                    FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00800000008080
                    8000FF00FF0080808000FFFFFF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                    FF00FF00FF00FF00FF00FF00FF00FF00FF0080808000FFFFFF00FF00FF00FF00
                    FF00FFFFFF00C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
                    C000C0C0C000FFFFFF008000000080808000FF00FF0080808000FFFFFF00FFFF
                    FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                    FF0080808000FFFFFF00FF00FF00FF00FF000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000FF00FF00FF00
                    FF00FF00FF008080800080808000808080008080800080808000808080008080
                    80008080800080808000808080008080800080808000FF00FF00}
                  NumGlyphs = 2
                  TabOrder = 10
                end
                object RxDBComboBox1: TRxDBComboBox
                  Left = 225
                  Top = 122
                  Width = 145
                  Height = 21
                  Style = csDropDownList
                  DataField = 'TP_ENTRADA'
                  DataSource = dsControle
                  EnableValues = True
                  ItemHeight = 13
                  Items.Strings = (
                    ''
                    'Caso Novo'
                    'Transfer'#234'ncia'
                    'M'#227'e da Crian'#231'a Exposta'
                    'Caso Novo-Internamento')
                  TabOrder = 8
                  Values.Strings = (
                    ''
                    '1'
                    '2'
                    '5'
                    '6')
                end
                object btLocProvincia: TdxDBButtonEdit
                  Left = 225
                  Top = 56
                  Width = 71
                  Hint = '(F5) Localizar Pais'
                  ParentShowHint = False
                  ShowHint = True
                  Style.ButtonStyle = bts3D
                  TabOrder = 2
                  OnExit = btLocProvinciaExit
                  DataField = 'CD_PROVINCIA_NOT'
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
                  Left = 225
                  Top = 78
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
                  Left = 225
                  Top = 100
                  Width = 71
                  Hint = '(F5) Localizar Pais'
                  ParentShowHint = False
                  ShowHint = True
                  Style.ButtonStyle = bts3D
                  TabOrder = 6
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
                object edProvincia: TdxDBEdit
                  Left = 296
                  Top = 56
                  Width = 278
                  Color = cl3DLight
                  TabOrder = 3
                  TabStop = False
                  DataField = 'DS_PROVINCIA_NOT'
                  DataSource = dsControle
                  ReadOnly = True
                  StoredValues = 64
                end
                object edMunicipio: TdxDBEdit
                  Left = 296
                  Top = 78
                  Width = 278
                  Color = cl3DLight
                  TabOrder = 5
                  TabStop = False
                  DataField = 'DS_MUNICIPIO_NOT'
                  DataSource = dsControle
                  ReadOnly = True
                  StoredValues = 64
                end
                object edUnidade: TdxDBEdit
                  Left = 296
                  Top = 100
                  Width = 278
                  Color = cl3DLight
                  TabOrder = 7
                  TabStop = False
                  DataField = 'DS_UNIDADE'
                  DataSource = dsControle
                  ReadOnly = True
                  StoredValues = 64
                end
                object DBDateEdit8: TDBDateEdit
                  Left = 451
                  Top = 123
                  Width = 121
                  Height = 21
                  DataField = 'DT_ENTRADA'
                  DataSource = dsControle
                  NumGlyphs = 2
                  TabOrder = 9
                end
              end
            end
            object tbPessoais: TTabSheet
              Caption = 'Dados Pessoais'
              ImageIndex = 1
              inline framPaciente1: TframPaciente
                Left = 0
                Top = 0
                Width = 820
                Height = 425
                Align = alClient
                AutoScroll = False
                AutoSize = True
                TabOrder = 0
                inherited GroupBox2: TGroupBox
                  inherited SpeedButton1: TSpeedButton
                    OnClick = framPaciente1SpeedButton1Click
                  end
                  inherited SpeedButton2: TSpeedButton
                    OnClick = framPaciente1SpeedButton2Click
                  end
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
                    OnExit = framPaciente1dxDBEdit16Exit
                  end
                  inherited DBCheckBox1: TDBCheckBox [53]
                  end
                  inherited pdica: TSecretPanel
                    inherited Label23: TLabel
                      Top = 12
                    end
                  end
                  inherited ckCasoNovo: TDBCheckBox [55]
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
                inherited dsPaciente: TDataSource
                  OnStateChange = framPaciente1dsPacienteStateChange
                end
              end
            end
            object tbPerfil: TTabSheet
              Caption = 'Perfil Epidemiol'#243'gico'
              ImageIndex = 2
              object ScrollBox1: TScrollBox
                Left = 0
                Top = 0
                Width = 820
                Height = 423
                HorzScrollBar.Visible = False
                VertScrollBar.ButtonSize = 2
                VertScrollBar.Style = ssFlat
                VertScrollBar.Tracking = True
                Align = alTop
                AutoScroll = False
                BevelInner = bvNone
                BevelOuter = bvNone
                BorderStyle = bsNone
                ParentBackground = True
                TabOrder = 0
                object pnTransfusao: TPanel
                  Left = 0
                  Top = 267
                  Width = 820
                  Height = 0
                  Align = alTop
                  AutoSize = True
                  BevelOuter = bvNone
                  TabOrder = 6
                end
                object pnPerfuracao: TPanel
                  Left = 0
                  Top = 267
                  Width = 820
                  Height = 0
                  Align = alTop
                  AutoSize = True
                  BevelOuter = bvNone
                  TabOrder = 7
                end
                object pnIntervencao: TPanel
                  Left = 0
                  Top = 267
                  Width = 820
                  Height = 0
                  Align = alTop
                  AutoSize = True
                  BevelOuter = bvNone
                  TabOrder = 8
                end
                object pnDentario: TPanel
                  Left = 0
                  Top = 267
                  Width = 820
                  Height = 0
                  Align = alTop
                  AutoSize = True
                  BevelOuter = bvNone
                  TabOrder = 9
                end
                object pnTatuagem: TPanel
                  Left = 0
                  Top = 267
                  Width = 820
                  Height = 0
                  Align = alTop
                  AutoSize = True
                  BevelOuter = bvNone
                  TabOrder = 10
                end
                object pnCircuncisao: TPanel
                  Left = 0
                  Top = 267
                  Width = 820
                  Height = 0
                  Align = alTop
                  AutoSize = True
                  BevelOuter = bvNone
                  TabOrder = 11
                end
                object Panel8: TPanel
                  Left = 0
                  Top = 244
                  Width = 820
                  Height = 23
                  Align = alTop
                  BevelOuter = bvNone
                  TabOrder = 5
                  object Label35: TLabel
                    Left = 17
                    Top = 6
                    Width = 343
                    Height = 13
                    Caption = 
                      '28. Circuncis'#227'o/excis'#227'o genital?................................' +
                      '..............................:'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -11
                    Font.Name = 'MS Sans Serif'
                    Font.Style = []
                    ParentFont = False
                  end
                  object Label69: TLabel
                    Left = 420
                    Top = 4
                    Width = 83
                    Height = 13
                    Caption = 'Se sim, informar : '
                  end
                  object sbCircuncisao: TSpeedButton
                    Left = 502
                    Top = 1
                    Width = 23
                    Height = 20
                    Flat = True
                    Glyph.Data = {
                      76010000424D7601000000000000760000002800000020000000100000000100
                      04000000000000010000120B0000120B00001000000000000000000000000000
                      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
                      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333033333
                      33333333373F33333333333330B03333333333337F7F33333333333330F03333
                      333333337F7FF3333333333330B00333333333337F773FF33333333330F0F003
                      333333337F7F773F3333333330B0B0B0333333337F7F7F7F3333333300F0F0F0
                      333333377F73737F33333330B0BFBFB03333337F7F33337F33333330F0FBFBF0
                      3333337F7333337F33333330BFBFBFB033333373F3333373333333330BFBFB03
                      33333337FFFFF7FF3333333300000000333333377777777F333333330EEEEEE0
                      33333337FFFFFF7FF3333333000000000333333777777777F33333330000000B
                      03333337777777F7F33333330000000003333337777777773333}
                    Margin = 3
                    NumGlyphs = 2
                    Spacing = 3
                    OnClick = sbCircuncisaoClick
                  end
                  object RxDBComboBox12: TRxDBComboBox
                    Left = 363
                    Top = 1
                    Width = 54
                    Height = 21
                    Style = csDropDownList
                    DataField = 'SN_CIRCUNCISAO'
                    DataSource = dsControle
                    EnableValues = True
                    ItemHeight = 13
                    Items.Strings = (
                      ''
                      'Sim'
                      'N'#227'o')
                    TabOrder = 0
                    Values.Strings = (
                      ''
                      '1'
                      '2')
                  end
                end
                object Panel9: TPanel
                  Left = 0
                  Top = 155
                  Width = 820
                  Height = 22
                  Align = alTop
                  BevelOuter = bvNone
                  TabOrder = 1
                  object Label36: TLabel
                    Left = 17
                    Top = 5
                    Width = 343
                    Height = 13
                    Caption = 
                      '24. Tratamento tradicional com perfura'#231#227'o/escarifica'#231#227'o?........' +
                      '..............:'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -11
                    Font.Name = 'MS Sans Serif'
                    Font.Style = []
                    ParentFont = False
                  end
                  object sbPerfuracao: TSpeedButton
                    Left = 502
                    Top = 1
                    Width = 23
                    Height = 20
                    Flat = True
                    Glyph.Data = {
                      76010000424D7601000000000000760000002800000020000000100000000100
                      04000000000000010000120B0000120B00001000000000000000000000000000
                      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
                      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333033333
                      33333333373F33333333333330B03333333333337F7F33333333333330F03333
                      333333337F7FF3333333333330B00333333333337F773FF33333333330F0F003
                      333333337F7F773F3333333330B0B0B0333333337F7F7F7F3333333300F0F0F0
                      333333377F73737F33333330B0BFBFB03333337F7F33337F33333330F0FBFBF0
                      3333337F7333337F33333330BFBFBFB033333373F3333373333333330BFBFB03
                      33333337FFFFF7FF3333333300000000333333377777777F333333330EEEEEE0
                      33333337FFFFFF7FF3333333000000000333333777777777F33333330000000B
                      03333337777777F7F33333330000000003333337777777773333}
                    Margin = 3
                    NumGlyphs = 2
                    Spacing = 3
                    OnClick = sbPerfuracaoClick
                  end
                  object Label16: TLabel
                    Left = 420
                    Top = 5
                    Width = 83
                    Height = 13
                    Caption = 'Se sim, informar : '
                  end
                  object RxDBComboBox13: TRxDBComboBox
                    Left = 363
                    Top = 1
                    Width = 54
                    Height = 21
                    Style = csDropDownList
                    DataField = 'SN_PERFURACAO'
                    DataSource = dsControle
                    EnableValues = True
                    ItemHeight = 13
                    Items.Strings = (
                      ''
                      'Sim'
                      'N'#227'o')
                    TabOrder = 0
                    Values.Strings = (
                      ''
                      '1'
                      '2')
                  end
                end
                object Panel12: TPanel
                  Left = 0
                  Top = 177
                  Width = 820
                  Height = 22
                  Align = alTop
                  BevelOuter = bvNone
                  TabOrder = 2
                  object Label37: TLabel
                    Left = 17
                    Top = 6
                    Width = 342
                    Height = 13
                    Caption = 
                      '25. Tatuagem?...................................................' +
                      '......................................:'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -11
                    Font.Name = 'MS Sans Serif'
                    Font.Style = []
                    ParentFont = False
                  end
                  object Label66: TLabel
                    Left = 420
                    Top = 4
                    Width = 83
                    Height = 13
                    Caption = 'Se sim, informar : '
                  end
                  object sbTatuagem: TSpeedButton
                    Left = 502
                    Top = 1
                    Width = 23
                    Height = 20
                    Flat = True
                    Glyph.Data = {
                      76010000424D7601000000000000760000002800000020000000100000000100
                      04000000000000010000120B0000120B00001000000000000000000000000000
                      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
                      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333033333
                      33333333373F33333333333330B03333333333337F7F33333333333330F03333
                      333333337F7FF3333333333330B00333333333337F773FF33333333330F0F003
                      333333337F7F773F3333333330B0B0B0333333337F7F7F7F3333333300F0F0F0
                      333333377F73737F33333330B0BFBFB03333337F7F33337F33333330F0FBFBF0
                      3333337F7333337F33333330BFBFBFB033333373F3333373333333330BFBFB03
                      33333337FFFFF7FF3333333300000000333333377777777F333333330EEEEEE0
                      33333337FFFFFF7FF3333333000000000333333777777777F33333330000000B
                      03333337777777F7F33333330000000003333337777777773333}
                    Margin = 3
                    NumGlyphs = 2
                    Spacing = 3
                    OnClick = sbTatuagemClick
                  end
                  object RxDBComboBox14: TRxDBComboBox
                    Left = 363
                    Top = 1
                    Width = 54
                    Height = 21
                    Style = csDropDownList
                    DataField = 'SN_TATUAGEM'
                    DataSource = dsControle
                    EnableValues = True
                    ItemHeight = 13
                    Items.Strings = (
                      ''
                      'Sim'
                      'N'#227'o')
                    TabOrder = 0
                    Values.Strings = (
                      ''
                      '1'
                      '2')
                  end
                end
                object Panel11: TPanel
                  Left = 0
                  Top = 199
                  Width = 820
                  Height = 22
                  Align = alTop
                  BevelOuter = bvNone
                  TabOrder = 3
                  object Label38: TLabel
                    Left = 17
                    Top = 5
                    Width = 341
                    Height = 13
                    Caption = 
                      '26. Tratamento dent'#225'rio?........................................' +
                      '.................................:'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -11
                    Font.Name = 'MS Sans Serif'
                    Font.Style = []
                    ParentFont = False
                  end
                  object Label67: TLabel
                    Left = 420
                    Top = 4
                    Width = 83
                    Height = 13
                    Caption = 'Se sim, informar : '
                  end
                  object sbDentario: TSpeedButton
                    Left = 502
                    Top = 1
                    Width = 23
                    Height = 20
                    Flat = True
                    Glyph.Data = {
                      76010000424D7601000000000000760000002800000020000000100000000100
                      04000000000000010000120B0000120B00001000000000000000000000000000
                      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
                      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333033333
                      33333333373F33333333333330B03333333333337F7F33333333333330F03333
                      333333337F7FF3333333333330B00333333333337F773FF33333333330F0F003
                      333333337F7F773F3333333330B0B0B0333333337F7F7F7F3333333300F0F0F0
                      333333377F73737F33333330B0BFBFB03333337F7F33337F33333330F0FBFBF0
                      3333337F7333337F33333330BFBFBFB033333373F3333373333333330BFBFB03
                      33333337FFFFF7FF3333333300000000333333377777777F333333330EEEEEE0
                      33333337FFFFFF7FF3333333000000000333333777777777F33333330000000B
                      03333337777777F7F33333330000000003333337777777773333}
                    Margin = 3
                    NumGlyphs = 2
                    Spacing = 3
                    OnClick = sbDentarioClick
                  end
                  object RxDBComboBox15: TRxDBComboBox
                    Left = 363
                    Top = 1
                    Width = 54
                    Height = 21
                    Style = csDropDownList
                    DataField = 'SN_TRAT_DENTARIO'
                    DataSource = dsControle
                    EnableValues = True
                    ItemHeight = 13
                    Items.Strings = (
                      ''
                      'Sim'
                      'N'#227'o')
                    TabOrder = 0
                    Values.Strings = (
                      ''
                      '1'
                      '2')
                  end
                end
                object Panel7: TPanel
                  Left = 0
                  Top = 0
                  Width = 820
                  Height = 155
                  Align = alTop
                  BevelOuter = bvNone
                  TabOrder = 0
                  object Label19: TLabel
                    Left = 8
                    Top = 8
                    Width = 472
                    Height = 13
                    Caption = 
                      'INVESTIGA'#199#195'O DE ASPECTOS RELACIONADOS COM POSS'#205'VEIS MODOS DE TRA' +
                      'NSMISS'#195'O'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clNavy
                    Font.Height = -11
                    Font.Name = 'MS Sans Serif'
                    Font.Style = []
                    ParentFont = False
                  end
                  object Label29: TLabel
                    Left = 8
                    Top = 24
                    Width = 515
                    Height = 13
                    Caption = 
                      '(verificar todas as possibilidades abaixo. Se houver mais de um ' +
                      'modo de transmiss'#227'o poss'#237'vel, apontar todos)'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clNavy
                    Font.Height = -11
                    Font.Name = 'MS Sans Serif'
                    Font.Style = []
                    ParentFont = False
                  end
                  object Label30: TLabel
                    Left = 19
                    Top = 52
                    Width = 341
                    Height = 13
                    Caption = 
                      '19. Mant'#233'm rela'#231#245'es sexuais.....................................' +
                      '..............................:'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -11
                    Font.Name = 'MS Sans Serif'
                    Font.Style = []
                    ParentFont = False
                  end
                  object Label31: TLabel
                    Left = 19
                    Top = 73
                    Width = 340
                    Height = 13
                    Caption = 
                      '20. '#201' um caso de transmiss'#227'o vertical?..........................' +
                      '.........................:'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -11
                    Font.Name = 'MS Sans Serif'
                    Font.Style = []
                    ParentFont = False
                  end
                  object Label32: TLabel
                    Left = 19
                    Top = 95
                    Width = 341
                    Height = 13
                    Caption = 
                      '21. Usa/Usou drogas inject'#225'veis?................................' +
                      '...........................:'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -11
                    Font.Name = 'MS Sans Serif'
                    Font.Style = []
                    ParentFont = False
                  end
                  object Label33: TLabel
                    Left = 18
                    Top = 117
                    Width = 342
                    Height = 13
                    Caption = 
                      '22. Houve acidente com material biol'#243'gico?......................' +
                      '......................:'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -11
                    Font.Name = 'MS Sans Serif'
                    Font.Style = []
                    ParentFont = False
                  end
                  object Label34: TLabel
                    Left = 17
                    Top = 139
                    Width = 343
                    Height = 13
                    Caption = 
                      '23. Recebeu transfus'#227'o de sangue e/ou hemoderivados?............' +
                      '..........:'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -11
                    Font.Name = 'MS Sans Serif'
                    Font.Style = []
                    ParentFont = False
                  end
                  object Label39: TLabel
                    Left = 420
                    Top = 139
                    Width = 83
                    Height = 13
                    Caption = 'Se sim, informar : '
                  end
                  object SpeedButton1: TSpeedButton
                    Left = 722
                    Top = 169
                    Width = 23
                    Height = 22
                    Flat = True
                    Glyph.Data = {
                      76010000424D7601000000000000760000002800000020000000100000000100
                      04000000000000010000120B0000120B00001000000000000000000000000000
                      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
                      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333033333
                      33333333373F33333333333330B03333333333337F7F33333333333330F03333
                      333333337F7FF3333333333330B00333333333337F773FF33333333330F0F003
                      333333337F7F773F3333333330B0B0B0333333337F7F7F7F3333333300F0F0F0
                      333333377F73737F33333330B0BFBFB03333337F7F33337F33333330F0FBFBF0
                      3333337F7333337F33333330BFBFBFB033333373F3333373333333330BFBFB03
                      33333337FFFFF7FF3333333300000000333333377777777F333333330EEEEEE0
                      33333337FFFFFF7FF3333333000000000333333777777777F33333330000000B
                      03333337777777F7F33333330000000003333337777777773333}
                    Margin = 3
                    NumGlyphs = 2
                    Spacing = 3
                  end
                  object sbtransfusao: TSpeedButton
                    Left = 502
                    Top = 134
                    Width = 23
                    Height = 20
                    Flat = True
                    Glyph.Data = {
                      76010000424D7601000000000000760000002800000020000000100000000100
                      04000000000000010000120B0000120B00001000000000000000000000000000
                      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
                      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333033333
                      33333333373F33333333333330B03333333333337F7F33333333333330F03333
                      333333337F7FF3333333333330B00333333333337F773FF33333333330F0F003
                      333333337F7F773F3333333330B0B0B0333333337F7F7F7F3333333300F0F0F0
                      333333377F73737F33333330B0BFBFB03333337F7F33337F33333330F0FBFBF0
                      3333337F7333337F33333330BFBFBFB033333373F3333373333333330BFBFB03
                      33333337FFFFF7FF3333333300000000333333377777777F333333330EEEEEE0
                      33333337FFFFFF7FF3333333000000000333333777777777F33333330000000B
                      03333337777777F7F33333330000000003333337777777773333}
                    Margin = 3
                    NumGlyphs = 2
                    Spacing = 3
                    OnClick = sbtransfusaoClick
                  end
                  object RxDBComboBox7: TRxDBComboBox
                    Left = 363
                    Top = 47
                    Width = 145
                    Height = 21
                    Style = csDropDownList
                    DataField = 'CD_RELACOES_SEXO'
                    DataSource = dsControle
                    EnableValues = True
                    ItemHeight = 13
                    Items.Strings = (
                      'Com Homens'
                      'Com Mulheres'
                      'Com Homens e Mulheres'
                      'N'#227'o se aplica')
                    TabOrder = 0
                    Values.Strings = (
                      '1'
                      '2'
                      '3'
                      '98')
                  end
                  object RxDBComboBox8: TRxDBComboBox
                    Left = 363
                    Top = 69
                    Width = 54
                    Height = 21
                    Style = csDropDownList
                    DataField = 'CD_MAE_POSITIVO'
                    DataSource = dsControle
                    EnableValues = True
                    ItemHeight = 13
                    Items.Strings = (
                      ''
                      'Sim'
                      'N'#227'o')
                    TabOrder = 1
                    Values.Strings = (
                      ''
                      '1'
                      '2')
                  end
                  object RxDBComboBox9: TRxDBComboBox
                    Left = 363
                    Top = 91
                    Width = 86
                    Height = 21
                    Style = csDropDownList
                    DataField = 'CD_USOU_DROGA'
                    DataSource = dsControle
                    EnableValues = True
                    ItemHeight = 13
                    Items.Strings = (
                      ''
                      'Sim'
                      'N'#227'o'
                      'N'#227'o se aplica')
                    TabOrder = 2
                    Values.Strings = (
                      ''
                      '1'
                      '2'
                      '98')
                  end
                  object RxDBComboBox10: TRxDBComboBox
                    Left = 363
                    Top = 113
                    Width = 54
                    Height = 21
                    Style = csDropDownList
                    DataField = 'CD_ACIDENTE_MAT_BIO'
                    DataSource = dsControle
                    EnableValues = True
                    ItemHeight = 13
                    Items.Strings = (
                      ''
                      'Sim'
                      'N'#227'o')
                    TabOrder = 3
                    Values.Strings = (
                      ''
                      '1'
                      '2')
                  end
                  object RxDBComboBox11: TRxDBComboBox
                    Left = 363
                    Top = 135
                    Width = 54
                    Height = 21
                    Style = csDropDownList
                    DataField = 'SN_TRANSFUSAO_SANGUE'
                    DataSource = dsControle
                    EnableValues = True
                    ItemHeight = 13
                    Items.Strings = (
                      ''
                      'Sim'
                      'N'#227'o')
                    TabOrder = 4
                    Values.Strings = (
                      ''
                      '1'
                      '2')
                  end
                end
                object Panel10: TPanel
                  Left = 0
                  Top = 221
                  Width = 820
                  Height = 23
                  Align = alTop
                  BevelOuter = bvNone
                  TabOrder = 4
                  object Label40: TLabel
                    Left = 17
                    Top = 5
                    Width = 343
                    Height = 13
                    Caption = 
                      '27. Interven'#231#227'o cir'#250'rgica?......................................' +
                      '..................................:'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -11
                    Font.Name = 'MS Sans Serif'
                    Font.Style = []
                    ParentFont = False
                  end
                  object Label68: TLabel
                    Left = 420
                    Top = 4
                    Width = 83
                    Height = 13
                    Caption = 'Se sim, informar : '
                  end
                  object sbIntervencaoCirurgica: TSpeedButton
                    Left = 502
                    Top = 1
                    Width = 23
                    Height = 20
                    Flat = True
                    Glyph.Data = {
                      76010000424D7601000000000000760000002800000020000000100000000100
                      04000000000000010000120B0000120B00001000000000000000000000000000
                      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
                      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333033333
                      33333333373F33333333333330B03333333333337F7F33333333333330F03333
                      333333337F7FF3333333333330B00333333333337F773FF33333333330F0F003
                      333333337F7F773F3333333330B0B0B0333333337F7F7F7F3333333300F0F0F0
                      333333377F73737F33333330B0BFBFB03333337F7F33337F33333330F0FBFBF0
                      3333337F7333337F33333330BFBFBFB033333373F3333373333333330BFBFB03
                      33333337FFFFF7FF3333333300000000333333377777777F333333330EEEEEE0
                      33333337FFFFFF7FF3333333000000000333333777777777F33333330000000B
                      03333337777777F7F33333330000000003333337777777773333}
                    Margin = 3
                    NumGlyphs = 2
                    Spacing = 3
                    OnClick = sbIntervencaoCirurgicaClick
                  end
                  object RxDBComboBox16: TRxDBComboBox
                    Left = 363
                    Top = 1
                    Width = 54
                    Height = 21
                    Style = csDropDownList
                    DataField = 'SN_INTERV_CIRURGICA'
                    DataSource = dsControle
                    EnableValues = True
                    ItemHeight = 13
                    Items.Strings = (
                      ''
                      'Sim'
                      'N'#227'o')
                    TabOrder = 0
                    Values.Strings = (
                      ''
                      '1'
                      '2')
                  end
                end
              end
            end
            object tbLaboratorio: TTabSheet
              Caption = 'Dados do Laborat'#243'rio'
              ImageIndex = 3
              object GroupBox2: TGroupBox
                Left = 8
                Top = 8
                Width = 809
                Height = 148
                TabOrder = 0
                object Label26: TLabel
                  Left = 16
                  Top = 16
                  Width = 159
                  Height = 13
                  Caption = '29. Evid'#234'ncia Laboratorial do VHI'
                end
                object Label46: TLabel
                  Left = 24
                  Top = 41
                  Width = 125
                  Height = 13
                  Caption = 'Teste de Triagem.............:'
                end
                object Label47: TLabel
                  Left = 25
                  Top = 64
                  Width = 124
                  Height = 13
                  Caption = 'Teste Confirmat'#243'rio..........:'
                end
                object Label48: TLabel
                  Left = 16
                  Top = 96
                  Width = 292
                  Height = 13
                  Caption = '29a. Se gestante VIH positivo, evid'#234'ncia laboratorial do VIH..:'
                end
                object lbteste2: TLabel
                  Left = 313
                  Top = 63
                  Width = 72
                  Height = 13
                  Caption = 'Tipo de Teste.:'
                end
                object lbteste1: TLabel
                  Left = 313
                  Top = 41
                  Width = 72
                  Height = 13
                  Caption = 'Tipo de Teste.:'
                end
                object Label9: TLabel
                  Left = 42
                  Top = 117
                  Width = 266
                  Height = 13
                  Caption = 
                    'Meses de Gesta'#231#227'o...............................................' +
                    '.........:'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  ParentFont = False
                end
                object Label77: TLabel
                  Left = 522
                  Top = 41
                  Width = 74
                  Height = 13
                  Caption = 'Data do Teste.:'
                end
                object Label78: TLabel
                  Left = 522
                  Top = 63
                  Width = 74
                  Height = 13
                  Caption = 'Data do Teste.:'
                end
                object Label75: TLabel
                  Left = 152
                  Top = 39
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
                object Label76: TLabel
                  Left = 152
                  Top = 61
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
                object dbtesteconfirmatorio: TRxDBComboBox
                  Left = 161
                  Top = 59
                  Width = 145
                  Height = 21
                  Style = csDropDownList
                  DataField = 'CD_TESTE_CONFIRMATORIO'
                  DataSource = dsControle
                  EnableValues = True
                  ItemHeight = 13
                  Items.Strings = (
                    'Positivo'
                    'N'#227'o realizado'
                    'N'#227'o informado')
                  TabOrder = 2
                  Values.Strings = (
                    '1'
                    '98'
                    '0')
                end
                object dbtestetriagem: TRxDBComboBox
                  Left = 161
                  Top = 37
                  Width = 145
                  Height = 21
                  Style = csDropDownList
                  DataField = 'CD_TESTE_TRIAGEM'
                  DataSource = dsControle
                  EnableValues = True
                  ItemHeight = 13
                  Items.Strings = (
                    'Positivo'
                    'N'#227'o realizado'
                    'N'#227'o informado')
                  TabOrder = 0
                  Values.Strings = (
                    '1'
                    '98'
                    '0')
                end
                object RxDBComboBox3: TRxDBComboBox
                  Left = 311
                  Top = 91
                  Width = 206
                  Height = 21
                  Style = csDropDownList
                  DataField = 'EVIDENCIA_GESTANTE'
                  DataSource = dsControle
                  EnableValues = True
                  ItemHeight = 13
                  Items.Strings = (
                    'Antes do pr'#233'-natal'#13
                    'Durante o pr'#233'-natal'#13
                    'Durante o trabalho de parto'#13
                    'Ap'#243's o parto')
                  TabOrder = 4
                  Values.Strings = (
                    '1'
                    '2'
                    '3'
                    '4')
                end
                object dxDBEdit8: TdxDBEdit
                  Left = 311
                  Top = 113
                  Width = 52
                  TabOrder = 5
                  DataField = 'NR_MESES_GESTANTE'
                  DataSource = framPaciente1.dsPaciente
                end
                object RxDBComboBox2: TRxDBComboBox
                  Left = 389
                  Top = 37
                  Width = 128
                  Height = 21
                  Style = csDropDownList
                  DataField = 'DS_TESTE_TRIAGEM'
                  DataSource = dsControle
                  EnableValues = False
                  ItemHeight = 13
                  Items.Strings = (
                    'Determini'
                    'Unigold')
                  TabOrder = 1
                end
                object RxDBComboBox4: TRxDBComboBox
                  Left = 389
                  Top = 59
                  Width = 128
                  Height = 21
                  Style = csDropDownList
                  DataField = 'DS_TESTE_CONFIRMATORIO'
                  DataSource = dsControle
                  EnableValues = False
                  ItemHeight = 13
                  Items.Strings = (
                    'Determini'
                    'Unigold')
                  TabOrder = 3
                end
                object DBDateEdit5: TDBDateEdit
                  Left = 597
                  Top = 37
                  Width = 121
                  Height = 21
                  DataField = 'DT_TESTE_TRIAGEM'
                  DataSource = dsControle
                  GlyphKind = gkCustom
                  Glyph.Data = {
                    76050000424D760500000000000036000000280000001C0000000C0000000100
                    2000000000004005000000000000000000000000000000000000FF00FF00FF00
                    FF00FF00FF008080800080808000808080008080800080808000808080008080
                    800080808000808080008080800080808000FF00FF00FF00FF00FFFFFF00FFFF
                    FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                    FF00FFFFFF00FFFFFF00FF00FF00FF00FF000000000000000000800000000000
                    0000800000008000000000000000800000000000000000000000800000008080
                    8000FF00FF008080800080808000808080008080800080808000808080008080
                    80008080800080808000808080008080800080808000FFFFFF00FF00FF00FF00
                    FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                    FF00FFFFFF00FFFFFF008000000080808000FF00FF0080808000FFFFFF00FF00
                    FF00FFFFFF00FFFFFF00FFFFFF00FF00FF00FFFFFF00FFFFFF00FFFFFF00FF00
                    FF0080808000FFFFFF00FF00FF00FF00FF00FFFFFF0000000000000000000000
                    0000FFFFFF00000000000000000000000000C0C0C000FFFFFF00800000008080
                    8000FF00FF0080808000FFFFFF00808080008080800080808000FF00FF008080
                    80008080800080808000FF00FF00FFFFFF0080808000FFFFFF00FF00FF00FF00
                    FF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF00C0C0C000FFFFFF00C0C0
                    C00000000000FFFFFF008000000080808000FF00FF0080808000FFFFFF00FF00
                    FF0080808000FFFFFF00FF00FF00FF00FF00FF00FF00FF00FF0080808000FFFF
                    FF0080808000FFFFFF00FF00FF00FF00FF00FFFFFF00FFFFFF0000000000FFFF
                    FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF00800000008080
                    8000FF00FF0080808000FFFFFF00FF00FF0080808000FFFFFF00FF00FF00FF00
                    FF00FFFFFF00FFFFFF0080808000FF00FF0080808000FFFFFF00FF00FF00FF00
                    FF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF0000000000000000000000
                    0000C0C0C000FFFFFF008000000080808000FF00FF0080808000FFFFFF00FF00
                    FF0080808000FFFFFF00FF00FF00808080008080800080808000FF00FF00FF00
                    FF0080808000FFFFFF00FF00FF00FF00FF00FFFFFF000000000000000000FFFF
                    FF00FFFFFF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00800000008080
                    8000FF00FF0080808000FFFFFF008080800080808000FFFFFF00FF00FF008080
                    8000FFFFFF00FFFFFF00FFFFFF00FFFFFF0080808000FFFFFF00FF00FF00FF00
                    FF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF0000000000000000000000
                    000000000000FFFFFF008000000080808000FF00FF0080808000FFFFFF00FF00
                    FF0080808000FF00FF00FF00FF0080808000808080008080800080808000FF00
                    FF0080808000FFFFFF00FF00FF00FF00FF00FFFFFF00FFFFFF00FFFFFF00FFFF
                    FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00800000008080
                    8000FF00FF0080808000FFFFFF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                    FF00FF00FF00FF00FF00FF00FF00FF00FF0080808000FFFFFF00FF00FF00FF00
                    FF00FFFFFF00C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
                    C000C0C0C000FFFFFF008000000080808000FF00FF0080808000FFFFFF00FFFF
                    FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                    FF0080808000FFFFFF00FF00FF00FF00FF000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000FF00FF00FF00
                    FF00FF00FF008080800080808000808080008080800080808000808080008080
                    80008080800080808000808080008080800080808000FF00FF00}
                  NumGlyphs = 2
                  TabOrder = 6
                end
                object DBDateEdit6: TDBDateEdit
                  Left = 597
                  Top = 59
                  Width = 121
                  Height = 21
                  DataField = 'DT_TESTE_CONFIRMATORIO'
                  DataSource = dsControle
                  GlyphKind = gkCustom
                  Glyph.Data = {
                    76050000424D760500000000000036000000280000001C0000000C0000000100
                    2000000000004005000000000000000000000000000000000000FF00FF00FF00
                    FF00FF00FF008080800080808000808080008080800080808000808080008080
                    800080808000808080008080800080808000FF00FF00FF00FF00FFFFFF00FFFF
                    FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                    FF00FFFFFF00FFFFFF00FF00FF00FF00FF000000000000000000800000000000
                    0000800000008000000000000000800000000000000000000000800000008080
                    8000FF00FF008080800080808000808080008080800080808000808080008080
                    80008080800080808000808080008080800080808000FFFFFF00FF00FF00FF00
                    FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                    FF00FFFFFF00FFFFFF008000000080808000FF00FF0080808000FFFFFF00FF00
                    FF00FFFFFF00FFFFFF00FFFFFF00FF00FF00FFFFFF00FFFFFF00FFFFFF00FF00
                    FF0080808000FFFFFF00FF00FF00FF00FF00FFFFFF0000000000000000000000
                    0000FFFFFF00000000000000000000000000C0C0C000FFFFFF00800000008080
                    8000FF00FF0080808000FFFFFF00808080008080800080808000FF00FF008080
                    80008080800080808000FF00FF00FFFFFF0080808000FFFFFF00FF00FF00FF00
                    FF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF00C0C0C000FFFFFF00C0C0
                    C00000000000FFFFFF008000000080808000FF00FF0080808000FFFFFF00FF00
                    FF0080808000FFFFFF00FF00FF00FF00FF00FF00FF00FF00FF0080808000FFFF
                    FF0080808000FFFFFF00FF00FF00FF00FF00FFFFFF00FFFFFF0000000000FFFF
                    FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF00800000008080
                    8000FF00FF0080808000FFFFFF00FF00FF0080808000FFFFFF00FF00FF00FF00
                    FF00FFFFFF00FFFFFF0080808000FF00FF0080808000FFFFFF00FF00FF00FF00
                    FF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF0000000000000000000000
                    0000C0C0C000FFFFFF008000000080808000FF00FF0080808000FFFFFF00FF00
                    FF0080808000FFFFFF00FF00FF00808080008080800080808000FF00FF00FF00
                    FF0080808000FFFFFF00FF00FF00FF00FF00FFFFFF000000000000000000FFFF
                    FF00FFFFFF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00800000008080
                    8000FF00FF0080808000FFFFFF008080800080808000FFFFFF00FF00FF008080
                    8000FFFFFF00FFFFFF00FFFFFF00FFFFFF0080808000FFFFFF00FF00FF00FF00
                    FF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF0000000000000000000000
                    000000000000FFFFFF008000000080808000FF00FF0080808000FFFFFF00FF00
                    FF0080808000FF00FF00FF00FF0080808000808080008080800080808000FF00
                    FF0080808000FFFFFF00FF00FF00FF00FF00FFFFFF00FFFFFF00FFFFFF00FFFF
                    FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00800000008080
                    8000FF00FF0080808000FFFFFF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                    FF00FF00FF00FF00FF00FF00FF00FF00FF0080808000FFFFFF00FF00FF00FF00
                    FF00FFFFFF00C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
                    C000C0C0C000FFFFFF008000000080808000FF00FF0080808000FFFFFF00FFFF
                    FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                    FF0080808000FFFFFF00FF00FF00FF00FF000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000FF00FF00FF00
                    FF00FF00FF008080800080808000808080008080800080808000808080008080
                    80008080800080808000808080008080800080808000FF00FF00}
                  NumGlyphs = 2
                  TabOrder = 7
                end
              end
            end
            object tbInvestigador: TTabSheet
              Caption = 'Dados do Investigador'
              ImageIndex = 4
              object GroupBox3: TGroupBox
                Left = 8
                Top = 8
                Width = 513
                Height = 129
                TabOrder = 0
                object Label54: TLabel
                  Left = 17
                  Top = 39
                  Width = 120
                  Height = 13
                  Caption = 'Nome Completo..............:'
                end
                object Label49: TLabel
                  Left = 17
                  Top = 61
                  Width = 120
                  Height = 13
                  Caption = 'Telefone.........................:'
                end
                object Label50: TLabel
                  Left = 17
                  Top = 83
                  Width = 120
                  Height = 13
                  Caption = 'Fun'#231#227'o...........................:'
                end
                object SpeedButton3: TSpeedButton
                  Left = 139
                  Top = 11
                  Width = 74
                  Height = 21
                  Hint = 'Cadastrar M'#233'dico'
                  Caption = 'Cadastrar'
                  Glyph.Data = {
                    76010000424D7601000000000000760000002800000020000000100000000100
                    04000000000000010000130B0000130B00001000000000000000000000000000
                    800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
                    FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF0033333333B333
                    333B33F333337F3333373B33333BB33333B337FF33377F33337F3BB3333BB333
                    3BB3377FF3377F33377333BB777BB777BB333377FFF77FFF7733330000000000
                    B3333377777777777333330FFFFFFFF03333337F3FF3FFF7F333330F00F000F0
                    33333F7F77377737FFFFBB0FFF8FFFF0BBB3777F3F33FFF7777F3B0F08700000
                    000B377F73F7777777773308880FFFFFF033337F377333333733330807FFFFF8
                    033333737FFFFFFF7F33333000000000B3333337777777777FF333BB333BB333
                    BB33337733377F3377FF3BB3333BB3333BB3377333377F33377F3B33333BB333
                    33B33733333773333373B333333B3333333B7333333733333337}
                  NumGlyphs = 2
                  ParentShowHint = False
                  ShowHint = True
                  OnClick = SpeedButton3Click
                end
                object dxDBEdit2: TdxDBEdit
                  Left = 139
                  Top = 57
                  Width = 354
                  Color = cl3DLight
                  TabOrder = 2
                  TabStop = False
                  CharCase = ecUpperCase
                  DataField = 'TEL_ENTREVISTADOR'
                  DataSource = dsControle
                  ReadOnly = True
                  StoredValues = 64
                end
                object dxDBEdit4: TdxDBEdit
                  Left = 139
                  Top = 79
                  Width = 354
                  Color = cl3DLight
                  TabOrder = 3
                  TabStop = False
                  CharCase = ecUpperCase
                  DataField = 'FUNCAO_ENTREVISTADOR'
                  DataSource = dsControle
                  ReadOnly = True
                  StoredValues = 64
                end
                object btLocInvestigador: TdxDBButtonEdit
                  Left = 139
                  Top = 35
                  Width = 75
                  Hint = '(F5) Localizar'
                  ParentShowHint = False
                  ShowHint = True
                  Style.ButtonStyle = bts3D
                  TabOrder = 0
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
                object dxDBEdit6: TdxDBEdit
                  Left = 215
                  Top = 35
                  Width = 278
                  Color = cl3DLight
                  TabOrder = 1
                  TabStop = False
                  DataField = 'NM_ENTREVISTADOR'
                  DataSource = dsControle
                  ReadOnly = True
                  StoredValues = 64
                end
              end
            end
            object tbEvolucao: TTabSheet
              Caption = 'Evolu'#231#227'o/Tratamento'
              ImageIndex = 5
              object GroupBox4: TGroupBox
                Left = 8
                Top = 8
                Width = 657
                Height = 82
                TabOrder = 0
                object Label52: TLabel
                  Left = 15
                  Top = 17
                  Width = 118
                  Height = 13
                  Caption = '30. Co-infec'#231#227'o TB/VHI:'
                end
                object Label53: TLabel
                  Left = 248
                  Top = 37
                  Width = 250
                  Height = 13
                  Caption = '30c. Se sim, informar a data do inicio do tratamento..:'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  ParentFont = False
                end
                object Label56: TLabel
                  Left = 24
                  Top = 37
                  Width = 139
                  Height = 13
                  Caption = '30a. TB atual........................:'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  ParentFont = False
                end
                object Label57: TLabel
                  Left = 23
                  Top = 59
                  Width = 140
                  Height = 13
                  Caption = '30b. TB '#218'ltimos 2 anos.........:'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  ParentFont = False
                end
                object RxDBComboBox5: TRxDBComboBox
                  Left = 166
                  Top = 32
                  Width = 80
                  Height = 21
                  Style = csDropDownList
                  DataField = 'TB_ATUAL'
                  DataSource = dsControle
                  EnableValues = True
                  ItemHeight = 13
                  Items.Strings = (
                    'N'#227'o'
                    'Sim'
                    'Ignorado')
                  TabOrder = 0
                  Values.Strings = (
                    '1'
                    '2'
                    '3')
                end
                object RxDBComboBox17: TRxDBComboBox
                  Left = 166
                  Top = 54
                  Width = 80
                  Height = 21
                  Style = csDropDownList
                  DataField = 'TB_ANTERIOR'
                  DataSource = dsControle
                  EnableValues = True
                  ItemHeight = 13
                  Items.Strings = (
                    'N'#227'o'
                    'Sim'
                    'Ignorado')
                  TabOrder = 1
                  Values.Strings = (
                    '1'
                    '2'
                    '3')
                end
                object DBDateEdit3: TDBDateEdit
                  Left = 501
                  Top = 32
                  Width = 145
                  Height = 21
                  DataField = 'DT_TRATAMENTO_TB'
                  DataSource = dsControle
                  NumGlyphs = 2
                  TabOrder = 2
                end
              end
              object GroupBox7: TGroupBox
                Left = 8
                Top = 90
                Width = 657
                Height = 111
                TabOrder = 1
                object Label61: TLabel
                  Left = 13
                  Top = 37
                  Width = 180
                  Height = 13
                  Caption = '32. Prov'#237'ncia de tratamento...............:'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  ParentFont = False
                end
                object Label62: TLabel
                  Left = 13
                  Top = 59
                  Width = 181
                  Height = 13
                  Caption = '33. Munic'#237'pio de tratamento...............:'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  ParentFont = False
                end
                object Label63: TLabel
                  Left = 13
                  Top = 81
                  Width = 182
                  Height = 13
                  Caption = '34. Unidade Sanit'#225'ria de tratamento...:'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  ParentFont = False
                end
                object Label55: TLabel
                  Left = 240
                  Top = 15
                  Width = 50
                  Height = 13
                  Caption = '31a. Data:'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  ParentFont = False
                end
                object Label51: TLabel
                  Left = 14
                  Top = 15
                  Width = 134
                  Height = 13
                  Caption = '31. Situa'#231#227'o atual...............:'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  ParentFont = False
                end
                object Label80: TLabel
                  Left = 425
                  Top = 15
                  Width = 93
                  Height = 13
                  Caption = '31b. Se '#243'bito, data:'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  ParentFont = False
                end
                object Label83: TLabel
                  Left = 149
                  Top = 12
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
                object RxDBComboBox18: TRxDBComboBox
                  Left = 157
                  Top = 11
                  Width = 80
                  Height = 21
                  Style = csDropDownList
                  DataField = 'CD_EVOLUCAO'
                  DataSource = dsControle
                  EnableValues = True
                  ItemHeight = 13
                  Items.Strings = (
                    'Activo'
                    'Morto'
                    'Transferido'
                    'Abandono'
                    'Recusado')
                  TabOrder = 0
                  Values.Strings = (
                    '1'
                    '2'
                    '3'
                    '4'
                    '6')
                end
                object btLocProvinciaTra: TdxDBButtonEdit
                  Left = 197
                  Top = 33
                  Width = 71
                  Hint = '(F5) Localizar Pais'
                  ParentShowHint = False
                  ShowHint = True
                  Style.ButtonStyle = bts3D
                  TabOrder = 3
                  OnExit = btLocProvinciaTraExit
                  DataField = 'CD_PROVINCIA_TRATAMENTO'
                  DataSource = dsControle
                  ReadOnly = False
                  OnChange = btLocProvinciaTraChange
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
                  OnButtonClick = btLocProvinciaTraButtonClick
                  StoredValues = 64
                  ExistButtons = True
                end
                object btLocMunicipioTra: TdxDBButtonEdit
                  Left = 197
                  Top = 55
                  Width = 71
                  Hint = '(F5) Localizar Pais'
                  ParentShowHint = False
                  ShowHint = True
                  Style.ButtonStyle = bts3D
                  TabOrder = 5
                  OnExit = btLocMunicipioTraExit
                  DataField = 'CD_MUNICIPIO_TRATAMENTO'
                  DataSource = dsControle
                  ReadOnly = False
                  OnChange = btLocMunicipioTraChange
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
                  OnButtonClick = btLocMunicipioTraButtonClick
                  StoredValues = 64
                  ExistButtons = True
                end
                object btLocUnidadeTra: TdxDBButtonEdit
                  Left = 197
                  Top = 77
                  Width = 71
                  Hint = '(F5) Localizar Pais'
                  ParentShowHint = False
                  ShowHint = True
                  Style.ButtonStyle = bts3D
                  TabOrder = 7
                  OnExit = btLocUnidadeTraExit
                  DataField = 'CD_UNIDADE_TRATAMENTO'
                  DataSource = dsControle
                  ReadOnly = False
                  OnChange = btLocUnidadeTraChange
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
                  OnButtonClick = btLocUnidadeTraButtonClick
                  StoredValues = 64
                  ExistButtons = True
                end
                object DBDateEdit4: TDBDateEdit
                  Left = 526
                  Top = 11
                  Width = 121
                  Height = 21
                  DataField = 'DT_EVOLUCAO'
                  DataSource = dsControle
                  NumGlyphs = 2
                  TabOrder = 2
                end
                object dxDBEdit11: TdxDBEdit
                  Left = 269
                  Top = 33
                  Width = 278
                  Color = cl3DLight
                  TabOrder = 4
                  TabStop = False
                  DataField = 'DS_PROVINCIA_TRATAMENTO'
                  DataSource = dsControle
                  ReadOnly = True
                  StoredValues = 64
                end
                object dxDBEdit12: TdxDBEdit
                  Left = 269
                  Top = 55
                  Width = 278
                  Color = cl3DLight
                  TabOrder = 6
                  TabStop = False
                  DataField = 'DS_MUNICIPIO_TRATAMENTO'
                  DataSource = dsControle
                  ReadOnly = True
                  StoredValues = 64
                end
                object dxDBEdit13: TdxDBEdit
                  Left = 269
                  Top = 77
                  Width = 278
                  Color = cl3DLight
                  TabOrder = 8
                  TabStop = False
                  DataField = 'DS_UNIDADE_TRATAMENTO'
                  DataSource = dsControle
                  ReadOnly = True
                  StoredValues = 64
                end
                object DBDateEdit7: TDBDateEdit
                  Left = 294
                  Top = 11
                  Width = 121
                  Height = 21
                  DataField = 'DT_EVOLUCAO_2'
                  DataSource = dsControle
                  NumGlyphs = 2
                  TabOrder = 1
                end
              end
            end
          end
        end
      end
      object tbAspectos: TTabSheet
        Caption = 'Aspectos da OMS'
        ImageIndex = 2
        object Panel5: TPanel
          Left = 0
          Top = 0
          Width = 830
          Height = 455
          Align = alClient
          BevelInner = bvLowered
          BevelOuter = bvNone
          TabOrder = 0
          object pgOms: TPageControl
            Left = 1
            Top = 1
            Width = 828
            Height = 453
            ActivePage = tbOMS_Adultos
            Align = alClient
            TabOrder = 0
            object tbOMS_Crianca: TTabSheet
              Caption = 'Crian'#231'as (At'#233' 14 anos)'
              object Label12: TLabel
                Left = 8
                Top = 2
                Width = 116
                Height = 13
                Caption = 'EST'#193'DIO CL'#205'NICO I'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clNavy
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object Label13: TLabel
                Left = 8
                Top = 50
                Width = 120
                Height = 13
                Caption = 'EST'#193'DIO CL'#205'NICO II'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clNavy
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object Label14: TLabel
                Left = 8
                Top = 258
                Width = 124
                Height = 13
                Caption = 'EST'#193'DIO CL'#205'NICO III'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clNavy
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object Label15: TLabel
                Left = 419
                Top = 53
                Width = 124
                Height = 13
                Caption = 'EST'#193'DIO CL'#205'NICO IV'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clNavy
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object Label17: TLabel
                Left = 438
                Top = 213
                Width = 278
                Height = 26
                Caption = 
                  'Infec'#231#227'o pelo CMV (0ritinite oun infec'#231#227'o em '#243'rg'#227'os que '#13#10'n'#227'o f'#237 +
                  'gado, ba'#231'o e linfonodos, in'#237'cio ap'#243's 1 m'#234's de idade)'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
              end
              object Label18: TLabel
                Left = 438
                Top = 243
                Width = 319
                Height = 26
                Caption = 
                  'Infec'#231#245'es presumidamente bacteriana, grave e recorrente '#13#10'(empie' +
                  'ma, piomiosite, '#243'steo-arteites, meningite, excepto pneumonia)'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
              end
              object Label20: TLabel
                Left = 438
                Top = 322
                Width = 291
                Height = 26
                Caption = 
                  'Micose end'#233'mica disseminada (histoplasmose extrapulmonar, '#13#10'cocc' +
                  'idiomicose, penicilinose)'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
              end
              object Label79: TLabel
                Left = 27
                Top = 272
                Width = 276
                Height = 26
                Caption = 
                  'Anemia inexplicada (<8g/dl) e/ou neutropenia (<500/mm'#179') '#13#10'e/ tro' +
                  'mbocitopenia (<50.00/mm'#179')>1 m'#234's '
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
              end
              object CheckBox1: TCheckBox
                Tag = 1
                Left = 8
                Top = 17
                Width = 113
                Height = 17
                Caption = 'Assintom'#225'tico'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 0
              end
              object CheckBox2: TCheckBox
                Tag = 2
                Left = 8
                Top = 33
                Width = 193
                Height = 17
                Caption = 'Linfadenopatia generalizada'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 1
              end
              object CheckBox3: TCheckBox
                Tag = 3
                Left = 8
                Top = 65
                Width = 177
                Height = 17
                Caption = 'Dermatite seborreica'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 2
              end
              object CheckBox4: TCheckBox
                Tag = 4
                Left = 8
                Top = 81
                Width = 185
                Height = 17
                Caption = 'Eritema gengival linear'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 3
              end
              object CheckBox5: TCheckBox
                Tag = 6
                Left = 8
                Top = 113
                Width = 185
                Height = 18
                Caption = 'Hepatoesplenomegalia'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 4
              end
              object CheckBox6: TCheckBox
                Tag = 5
                Left = 8
                Top = 97
                Width = 185
                Height = 18
                Caption = 'Erup'#231#227'o papular pruriginosa'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 5
              end
              object CheckBox7: TCheckBox
                Tag = 7
                Left = 8
                Top = 129
                Width = 177
                Height = 17
                Caption = 'Herpes zoster'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 6
              end
              object CheckBox8: TCheckBox
                Tag = 8
                Left = 8
                Top = 145
                Width = 185
                Height = 17
                Caption = 'Hipertrofia de par'#243'tidas'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 7
              end
              object CheckBox9: TCheckBox
                Tag = 10
                Left = 8
                Top = 177
                Width = 185
                Height = 18
                Caption = 'Infec'#231#245'es f'#250'ngicas em unhas'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 8
              end
              object CheckBox10: TCheckBox
                Tag = 9
                Left = 8
                Top = 161
                Width = 225
                Height = 18
                Caption = 'Infec'#231#227'o extensa por ppilomav'#237'rus'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 9
              end
              object CheckBox11: TCheckBox
                Tag = 11
                Left = 8
                Top = 193
                Width = 385
                Height = 17
                Caption = 
                  'Infec'#231#245'es recorrentes ou cr'#244'nicas de VAS(otite m'#233'dia, otorrhoea,' +
                  ' sinusite)'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 10
              end
              object CheckBox12: TCheckBox
                Tag = 12
                Left = 8
                Top = 209
                Width = 185
                Height = 17
                Caption = 'Molusco contagiosos disseminado'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 11
              end
              object CheckBox13: TCheckBox
                Tag = 14
                Left = 8
                Top = 241
                Width = 185
                Height = 18
                Caption = #218'lceras orais recorrentes'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 12
              end
              object CheckBox14: TCheckBox
                Tag = 13
                Left = 8
                Top = 225
                Width = 225
                Height = 18
                Caption = 'Quelite angular'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 13
              end
              object CheckBox15: TCheckBox
                Tag = 15
                Left = 8
                Top = 273
                Width = 17
                Height = 17
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 14
              end
              object CheckBox16: TCheckBox
                Tag = 16
                Left = 8
                Top = 301
                Width = 361
                Height = 17
                Caption = 'Candid'#237'ase oral (al'#233'm do per'#237'odo neonatal)'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 15
              end
              object CheckBox17: TCheckBox
                Tag = 18
                Left = 8
                Top = 333
                Width = 209
                Height = 18
                Caption = 'Diarr'#233'ia persistente (>14 dias)'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 16
              end
              object CheckBox18: TCheckBox
                Tag = 17
                Left = 8
                Top = 317
                Width = 377
                Height = 18
                Caption = 'Desnutri'#231#227'o moderada que n'#227'o responde ao tratamento usual'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 17
              end
              object CheckBox19: TCheckBox
                Tag = 19
                Left = 8
                Top = 349
                Width = 409
                Height = 17
                Caption = 
                  'Doen'#231'a pulmonar cr'#244'nica, relacionada ao VIH (inclui bronquiectas' +
                  'ia)'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 18
              end
              object CheckBox20: TCheckBox
                Tag = 21
                Left = 8
                Top = 365
                Width = 401
                Height = 17
                Caption = 'Febre persistente (intermitente ou constante, > 1 m'#234's)'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 19
              end
              object CheckBox21: TCheckBox
                Tag = 22
                Left = 8
                Top = 381
                Width = 401
                Height = 18
                Caption = 'Gengivite/periodontite aguda necrotizante'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 20
              end
              object CheckBox22: TCheckBox
                Tag = 23
                Left = 8
                Top = 397
                Width = 409
                Height = 17
                Caption = 'Leucoplastia pilosa oral'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 21
              end
              object CheckBox23: TCheckBox
                Tag = 24
                Left = 419
                Top = 3
                Width = 401
                Height = 17
                Caption = 'Pneumonia linf'#243'ide intersticial (LIP) sintom'#225'tica'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 22
              end
              object CheckBox26: TCheckBox
                Tag = 27
                Left = 419
                Top = 68
                Width = 177
                Height = 17
                Caption = 'Candid'#237'ase esof'#225'gica'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 23
              end
              object CheckBox27: TCheckBox
                Tag = 28
                Left = 419
                Top = 84
                Width = 382
                Height = 17
                Caption = 'Candid'#237'ase de traqu'#233'ia, br'#244'nquios ou pulm'#227'o'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 24
              end
              object CheckBox28: TCheckBox
                Tag = 30
                Left = 419
                Top = 116
                Width = 185
                Height = 18
                Caption = 'Cryptosporidiose'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 25
              end
              object CheckBox29: TCheckBox
                Tag = 29
                Left = 419
                Top = 100
                Width = 390
                Height = 18
                Caption = 'Criptococose extra pulmonar inclu'#237'ndo meningite'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 26
              end
              object CheckBox30: TCheckBox
                Tag = 31
                Left = 419
                Top = 132
                Width = 382
                Height = 17
                Caption = 'Desnutri'#231#227'o grave que n'#227'o responde ao tratamento usual'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 27
              end
              object CheckBox31: TCheckBox
                Tag = 32
                Left = 419
                Top = 148
                Width = 185
                Height = 17
                Caption = 'Encefalopatia pelo HIV'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 28
              end
              object CheckBox32: TCheckBox
                Tag = 34
                Left = 419
                Top = 180
                Width = 214
                Height = 18
                Caption = 'Infec'#231#245'es cr'#244'nica por herpes simplex'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 29
              end
              object CheckBox33: TCheckBox
                Tag = 33
                Left = 419
                Top = 164
                Width = 366
                Height = 18
                Caption = 'F'#237'stula reto vaginal adquirida, associada ao VIH'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 30
              end
              object CheckBox34: TCheckBox
                Tag = 35
                Left = 419
                Top = 196
                Width = 398
                Height = 17
                Caption = 
                  'Infec'#231#227'o cr'#243'nica por herpes siplex (oro labial ou cut'#226'nea > 1 m'#234 +
                  's)'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 31
              end
              object CheckBox35: TCheckBox
                Tag = 36
                Left = 419
                Top = 212
                Width = 14
                Height = 17
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 32
              end
              object CheckBox36: TCheckBox
                Tag = 38
                Left = 419
                Top = 272
                Width = 185
                Height = 18
                Caption = 'Isospor'#237'ase'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 33
              end
              object CheckBox37: TCheckBox
                Tag = 37
                Left = 419
                Top = 242
                Width = 14
                Height = 18
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 34
              end
              object CheckBox38: TCheckBox
                Tag = 39
                Left = 419
                Top = 288
                Width = 385
                Height = 17
                Caption = 'Linfoma do SNC ou linfoma de c'#233'lulas B n'#227'o-Hodgkin'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 35
              end
              object CheckBox39: TCheckBox
                Tag = 40
                Left = 419
                Top = 304
                Width = 361
                Height = 17
                Caption = 'Micobacteriose n'#227'o-tuberculosa disseminada'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 36
              end
              object CheckBox40: TCheckBox
                Tag = 81
                Left = 419
                Top = 352
                Width = 294
                Height = 18
                Caption = 'Pneumonia por Pneumocystis Carinii'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 37
              end
              object CheckBox41: TCheckBox
                Tag = 80
                Left = 419
                Top = 320
                Width = 14
                Height = 18
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 38
              end
              object CheckBox42: TCheckBox
                Tag = 82
                Left = 419
                Top = 368
                Width = 409
                Height = 17
                Caption = 'Sarcoma de Kaposi'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 39
              end
              object CheckBox43: TCheckBox
                Tag = 83
                Left = 419
                Top = 384
                Width = 222
                Height = 17
                Caption = 'TB extra-pulmonar'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 40
              end
              object CheckBox44: TCheckBox
                Tag = 84
                Left = 419
                Top = 400
                Width = 401
                Height = 18
                Caption = 'Toxoplasmose SNC (al'#233'm do per'#237'odo neonatal)'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 41
              end
              object CheckBox24: TCheckBox
                Tag = 25
                Left = 419
                Top = 19
                Width = 385
                Height = 17
                Caption = 'Pneumonia presumumidamente bacteriana, grave e recorrente'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 42
              end
              object CheckBox25: TCheckBox
                Tag = 26
                Left = 419
                Top = 35
                Width = 121
                Height = 17
                Caption = 'TB pulmonar'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 43
              end
            end
            object tbOMS_Adultos: TTabSheet
              Caption = 'Adolescentes e Adultos'
              ImageIndex = 1
              object Label21: TLabel
                Left = 8
                Top = 2
                Width = 116
                Height = 13
                Caption = 'EST'#193'DIO CL'#205'NICO I'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clNavy
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object Label22: TLabel
                Left = 8
                Top = 50
                Width = 120
                Height = 13
                Caption = 'EST'#193'DIO CL'#205'NICO II'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clNavy
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object Label23: TLabel
                Left = 8
                Top = 194
                Width = 124
                Height = 13
                Caption = 'EST'#193'DIO CL'#205'NICO III'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clNavy
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object Label24: TLabel
                Left = 419
                Top = 2
                Width = 124
                Height = 13
                Caption = 'EST'#193'DIO CL'#205'NICO IV'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clNavy
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object Label25: TLabel
                Tag = 66
                Left = 438
                Top = 146
                Width = 282
                Height = 26
                Caption = 
                  'Infec'#231#227'o por citomegalovirus (retinite ou infec'#231#227'o de outros '#13#10#243 +
                  'rg'#227'os)'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
              end
              object Label27: TLabel
                Tag = 74
                Left = 438
                Top = 288
                Width = 240
                Height = 26
                Caption = 
                  'Micose disemina da (histoplasmose extrapulmonar, '#13#10'paracoccidioi' +
                  'domicose)'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
              end
              object Label28: TLabel
                Tag = 43
                Left = 27
                Top = 66
                Width = 293
                Height = 26
                Caption = 
                  'Perda inexplicada de peso (<10% do peso corporal presumido '#13#10'ou ' +
                  'verificado)'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
              end
              object Label41: TLabel
                Tag = 50
                Left = 27
                Top = 212
                Width = 267
                Height = 26
                Caption = 
                  'Perda grave de peso (>10% do peso corporal presumido '#13#10'ou verifi' +
                  'cado)'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
              end
              object Label42: TLabel
                Tag = 52
                Left = 27
                Top = 259
                Width = 307
                Height = 26
                Caption = 
                  'Febre persistente inexplicada (intermitente ou constante por mai' +
                  's '#13#10'de um m'#234's)'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
              end
              object Label43: TLabel
                Tag = 56
                Left = 28
                Top = 339
                Width = 314
                Height = 26
                Caption = 
                  'Infec'#231#245'es bacterianas graves(ex. pneumonia, impiema, piomiosite,' +
                  ' '#13#10'infec'#231#227'o '#243'ssea ou das articula'#231#245'es, meningite bacterimia)'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
              end
              object Label44: TLabel
                Tag = 58
                Left = 27
                Top = 387
                Width = 279
                Height = 26
                Caption = 
                  'Anemia inexplicada (<8g/dl) e/ou neutropenia (<500/mm3) '#13#10'durant' +
                  'e mais de um m'#234's'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
              end
              object Label45: TLabel
                Tag = 62
                Left = 438
                Top = 66
                Width = 253
                Height = 26
                Caption = 
                  'Infec'#231#227'o por Herpes Simplex (orolabial, genital ou '#13#10'anorectal >' +
                  ' 1 m'#234's, ou visceral com qualquer dura'#231#227'o)'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
              end
              object CheckBox45: TCheckBox
                Tag = 41
                Left = 8
                Top = 17
                Width = 113
                Height = 17
                Caption = 'Assintom'#225'tico'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 0
              end
              object CheckBox46: TCheckBox
                Tag = 42
                Left = 8
                Top = 33
                Width = 264
                Height = 17
                Caption = 'Linfadenopatia generalizada persistente'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 1
              end
              object CheckBox47: TCheckBox
                Tag = 43
                Left = 8
                Top = 65
                Width = 17
                Height = 17
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
                TabOrder = 2
              end
              object CheckBox48: TCheckBox
                Tag = 44
                Left = 8
                Top = 97
                Width = 185
                Height = 17
                Caption = 'Herper zoster'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 3
              end
              object CheckBox49: TCheckBox
                Tag = 46
                Left = 8
                Top = 129
                Width = 185
                Height = 18
                Caption = 'Ulcera'#231#245'es orais recorrentes'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 4
              end
              object CheckBox50: TCheckBox
                Tag = 45
                Left = 8
                Top = 113
                Width = 185
                Height = 18
                Caption = 'Queilite comissural'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 5
              end
              object CheckBox51: TCheckBox
                Tag = 47
                Left = 8
                Top = 145
                Width = 281
                Height = 17
                Caption = 'Erup'#231#245'es papilares pruriginosas'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 6
              end
              object CheckBox52: TCheckBox
                Tag = 48
                Left = 8
                Top = 161
                Width = 185
                Height = 17
                Caption = 'Dermatite seborreica'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 7
              end
              object CheckBox53: TCheckBox
                Tag = 50
                Left = 8
                Top = 209
                Width = 17
                Height = 18
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
                TabOrder = 8
              end
              object CheckBox54: TCheckBox
                Tag = 49
                Left = 8
                Top = 177
                Width = 305
                Height = 18
                Caption = 'Infec'#231#245'es f'#250'ngicas nas unhas das m'#227'os'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 9
              end
              object CheckBox56: TCheckBox
                Tag = 51
                Left = 8
                Top = 241
                Width = 345
                Height = 17
                Caption = 'Diarr'#233'ia cr'#243'nica inexplicada durante mais de um m'#234's'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 10
              end
              object CheckBox58: TCheckBox
                Tag = 52
                Left = 8
                Top = 257
                Width = 17
                Height = 18
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
                TabOrder = 11
              end
              object CheckBox59: TCheckBox
                Tag = 53
                Left = 8
                Top = 289
                Width = 385
                Height = 17
                Caption = 'Candidiase oral persistente'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 12
              end
              object CheckBox60: TCheckBox
                Tag = 54
                Left = 8
                Top = 305
                Width = 361
                Height = 17
                Caption = 'Leucoplaquia pilosa oral'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 13
              end
              object CheckBox61: TCheckBox
                Tag = 56
                Left = 8
                Top = 337
                Width = 17
                Height = 18
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
                TabOrder = 14
              end
              object CheckBox62: TCheckBox
                Tag = 55
                Left = 8
                Top = 321
                Width = 393
                Height = 18
                Caption = 'Tuberculose pulmonar (TB) diagnosticada nos '#250'ltimos dois anos'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 15
              end
              object CheckBox64: TCheckBox
                Tag = 57
                Left = 8
                Top = 369
                Width = 401
                Height = 17
                Caption = 'Estomatite, gengivite ou periodontite ulcerativa necr'#243'tica aguda'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 16
              end
              object CheckBox65: TCheckBox
                Tag = 58
                Left = 8
                Top = 385
                Width = 17
                Height = 18
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
                TabOrder = 17
              end
              object CheckBox67: TCheckBox
                Tag = 59
                Left = 419
                Top = 17
                Width = 398
                Height = 17
                Caption = 'S'#237'ndrome consumptiva ("wasting syndrome - CDC")'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 18
              end
              object CheckBox68: TCheckBox
                Tag = 60
                Left = 419
                Top = 33
                Width = 382
                Height = 17
                Caption = 'Pneumonia por Pneumocystus Carinii'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 19
              end
              object CheckBox69: TCheckBox
                Tag = 62
                Left = 419
                Top = 65
                Width = 14
                Height = 18
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 20
              end
              object CheckBox70: TCheckBox
                Tag = 61
                Left = 419
                Top = 49
                Width = 390
                Height = 18
                Caption = 'Pneumonia bacteriana severa recorrente (mais que duas/ano)'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 21
              end
              object CheckBox72: TCheckBox
                Tag = 63
                Left = 419
                Top = 97
                Width = 390
                Height = 17
                Caption = 'Candid'#237'ase do es'#243'fago, traqueia, br'#244'nquios ou pulm'#244'es'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 22
              end
              object CheckBox73: TCheckBox
                Tag = 65
                Left = 419
                Top = 129
                Width = 185
                Height = 18
                Caption = 'Sarcoma de Kaposi'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 23
              end
              object CheckBox74: TCheckBox
                Tag = 64
                Left = 419
                Top = 113
                Width = 366
                Height = 18
                Caption = 'Tuberculose extra pulmonar'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 24
              end
              object CheckBox75: TCheckBox
                Tag = 67
                Left = 419
                Top = 175
                Width = 406
                Height = 16
                Caption = 'Toxoplasmose ou sistema nervoso central'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 25
              end
              object CheckBox76: TCheckBox
                Tag = 66
                Left = 419
                Top = 145
                Width = 14
                Height = 17
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 26
              end
              object CheckBox77: TCheckBox
                Tag = 69
                Left = 419
                Top = 206
                Width = 398
                Height = 18
                Caption = 'Criptocose extrapulmonar (inclui meningite)'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 27
              end
              object CheckBox79: TCheckBox
                Tag = 70
                Left = 419
                Top = 222
                Width = 385
                Height = 17
                Caption = 'Infec'#231#227'o dissemindada por outras micobact'#233'rias'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 28
              end
              object CheckBox80: TCheckBox
                Tag = 71
                Left = 419
                Top = 238
                Width = 361
                Height = 17
                Caption = 'Leucoencefalopatia multifocal progressiva (LEMP)'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 29
              end
              object CheckBox81: TCheckBox
                Tag = 72
                Left = 419
                Top = 254
                Width = 294
                Height = 18
                Caption = 'Criptosporid'#237'ase cr'#244'nica'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 30
              end
              object CheckBox82: TCheckBox
                Tag = 74
                Left = 419
                Top = 286
                Width = 14
                Height = 18
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 31
              end
              object CheckBox83: TCheckBox
                Tag = 73
                Left = 419
                Top = 270
                Width = 352
                Height = 17
                Caption = 'Isopor'#237'ase cr'#244'nica'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 32
              end
              object CheckBox84: TCheckBox
                Tag = 75
                Left = 419
                Top = 318
                Width = 382
                Height = 17
                Caption = 'Septicemia recorrente (inclui Salmonela n'#227'o-typhi)'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 33
              end
              object CheckBox85: TCheckBox
                Tag = 76
                Left = 419
                Top = 334
                Width = 401
                Height = 18
                Caption = 'Linfoma (cerebral ou de c'#233'lulas B n'#227'o-Hodgkin)'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 34
              end
              object CheckBox55: TCheckBox
                Tag = 68
                Left = 419
                Top = 191
                Width = 406
                Height = 16
                Caption = 'Encefalopatia pelo VIH'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 35
              end
              object CheckBox57: TCheckBox
                Tag = 77
                Left = 419
                Top = 350
                Width = 382
                Height = 17
                Caption = 'Carcioma invasivo do colo uterino'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 36
              end
              object CheckBox63: TCheckBox
                Tag = 78
                Left = 419
                Top = 367
                Width = 401
                Height = 18
                Caption = 'Leishmaniose disseminada at'#237'pica'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 37
              end
              object CheckBox66: TCheckBox
                Tag = 79
                Left = 420
                Top = 383
                Width = 401
                Height = 18
                Caption = 'Nefropatia ou cardiomiopatia associada ao VIH'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 38
              end
            end
            object tbClassificacao: TTabSheet
              Caption = 'Classifica'#231#227'o'
              ImageIndex = 2
              object GroupBox5: TGroupBox
                Left = 8
                Top = 8
                Width = 809
                Height = 153
                TabOrder = 0
                object Label58: TLabel
                  Left = 17
                  Top = 42
                  Width = 196
                  Height = 13
                  Caption = '36. Contagem de T CD4 no diagn'#243'stico..:'
                end
                object Label59: TLabel
                  Left = 26
                  Top = 103
                  Width = 194
                  Height = 13
                  Caption = 'Nome completo.......................................:'
                end
                object Label60: TLabel
                  Left = 26
                  Top = 126
                  Width = 195
                  Height = 13
                  Caption = 'Telefone..................................................:'
                end
                object Label64: TLabel
                  Left = 17
                  Top = 20
                  Width = 197
                  Height = 13
                  Caption = '35. Classifica'#231#227'o Cl'#237'nica da OMS............:'
                end
                object Label65: TLabel
                  Left = 19
                  Top = 80
                  Width = 188
                  Height = 13
                  Caption = 'M'#233'dico que fez a classifica'#231#227'o da OMS'
                end
                object SpeedButton2: TSpeedButton
                  Left = 223
                  Top = 75
                  Width = 74
                  Height = 21
                  Hint = 'Cadastrar M'#233'dico'
                  Caption = 'Cadastrar'
                  Glyph.Data = {
                    76010000424D7601000000000000760000002800000020000000100000000100
                    04000000000000010000130B0000130B00001000000000000000000000000000
                    800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
                    FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF0033333333B333
                    333B33F333337F3333373B33333BB33333B337FF33377F33337F3BB3333BB333
                    3BB3377FF3377F33377333BB777BB777BB333377FFF77FFF7733330000000000
                    B3333377777777777333330FFFFFFFF03333337F3FF3FFF7F333330F00F000F0
                    33333F7F77377737FFFFBB0FFF8FFFF0BBB3777F3F33FFF7777F3B0F08700000
                    000B377F73F7777777773308880FFFFFF033337F377333333733330807FFFFF8
                    033333737FFFFFFF7F33333000000000B3333337777777777FF333BB333BB333
                    BB33337733377F3377FF3BB3333BB3333BB3377333377F33377F3B33333BB333
                    33B33733333773333373B333333B3333333B7333333733333337}
                  NumGlyphs = 2
                  ParentShowHint = False
                  ShowHint = True
                  OnClick = SpeedButton2Click
                end
                object dxDBEdit5: TdxDBEdit
                  Left = 217
                  Top = 37
                  Width = 271
                  TabOrder = 0
                  CharCase = ecUpperCase
                  DataField = 'CD_CD4'
                  DataSource = dsControle
                end
                object dxDBEdit7: TdxDBEdit
                  Left = 223
                  Top = 121
                  Width = 354
                  Color = cl3DLight
                  TabOrder = 3
                  TabStop = False
                  CharCase = ecUpperCase
                  DataField = 'TEL_MEDICO'
                  DataSource = dsControle
                  ReadOnly = True
                  StoredValues = 64
                end
                object btLocMedico: TdxDBButtonEdit
                  Left = 223
                  Top = 99
                  Width = 75
                  Hint = '(F5) Localizar Pais'
                  ParentShowHint = False
                  ShowHint = True
                  Style.ButtonStyle = bts3D
                  TabOrder = 1
                  OnExit = btLocMedicoExit
                  DataField = 'CD_MEDICO'
                  DataSource = dsControle
                  ReadOnly = False
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
                  ClickKey = 116
                  OnButtonClick = btLocMedicoButtonClick
                  StoredValues = 64
                  ExistButtons = True
                end
                object dxDBEdit9: TdxDBEdit
                  Left = 299
                  Top = 99
                  Width = 278
                  Color = cl3DLight
                  TabOrder = 2
                  TabStop = False
                  DataField = 'NM_MEDICO'
                  DataSource = dsControle
                  ReadOnly = True
                  StoredValues = 64
                end
                object RxDBComboBox6: TRxDBComboBox
                  Left = 217
                  Top = 15
                  Width = 163
                  Height = 21
                  Style = csDropDownList
                  DataField = 'CD_OMS'
                  DataSource = dsControle
                  EnableValues = True
                  ItemHeight = 13
                  Items.Strings = (
                    'Estado Cl'#237'nico I'
                    'Estado Cl'#237'nico II'
                    'Estado Cl'#237'nico III'
                    'Estado Cl'#237'nico IV')
                  TabOrder = 4
                  Values.Strings = (
                    '1'
                    '2'
                    '3'
                    '4')
                end
              end
              object GroupBox6: TGroupBox
                Left = 8
                Top = 170
                Width = 809
                Height = 245
                Caption = 'Observa'#231#245'es'
                TabOrder = 1
                object dxDBMemo1: TdxDBMemo
                  Left = 8
                  Top = 17
                  Width = 791
                  TabOrder = 0
                  CharCase = ecUpperCase
                  DataField = 'DS_OBSERVACAO'
                  DataSource = dsControle
                  Height = 217
                end
              end
            end
          end
        end
      end
    end
  end
  object Panel6: TPanel [3]
    Left = 0
    Top = 52
    Width = 840
    Height = 25
    Align = alTop
    BevelOuter = bvLowered
    TabOrder = 3
    object Label10: TLabel
      Left = 381
      Top = 6
      Width = 81
      Height = 13
      Caption = 'Nome do Utente:'
    end
    object edPaciente: TEdit
      Left = 465
      Top = 2
      Width = 121
      Height = 21
      CharCase = ecUpperCase
      TabOrder = 3
    end
    object BitBtn1: TBitBtn
      Left = 594
      Top = 2
      Width = 75
      Height = 21
      BiDiMode = bdRightToLeft
      Caption = 'Consultar'
      ParentBiDiMode = False
      TabOrder = 4
      OnClick = BitBtn1Click
      Glyph.Data = {
        36060000424D3606000000000000360000002800000020000000100000000100
        1800000000000006000000000000000000000000000000000000FF00FF314860
        AB7B7BFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FF5251524B4B4B7E7E7E52515252515252515252515252
        51525251525251525251525251525251525251525251525251525084B60B73E0
        31608FB67B7BFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FF8B8B8B8484846767677F7F7F52515252515252515252
        515252515252515252515252515252515252515252515252515231A1FF38A1FF
        1173EA31608FB67B7BFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFAEAEAEAEAEAE8787876767677F7F7F52515252515252
        5152525152525152525152525152525152525152525152525152FF00FF38A1FF
        38A1FF0B6AE031608FB67B7BFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FF525152AEAEAEAEAEAE7E7E7E6767677F7F7F52515252
        5152525152525152525152525152525152525152525152525152FF00FFFF00FF
        38A1FF31A1FF0B73E031608FAB7B7BFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FF525152525152AEAEAEAEAEAE8484846767677E7E7E52
        5152525152525152525152525152525152525152525152525152FF00FFFF00FF
        FF00FF38A1FF31A1FF116AD4405058FF00FF986058B68F84CAA18FC08F84FF00
        FFFF00FFFF00FFFF00FF525152525152525152AEAEAEAEAEAE7B7B7B50505052
        51526262628F8F8FA0A0A0909090525152525152525152525152FF00FFFF00FF
        FF00FFFF00FF38ABFFA1CAEA8F7B73A18473F4E0C0FFFFCAFFFFCAFFFFCAE0D4
        ABC0988FFF00FFFF00FF525152525152525152525152B5B5B5CECECE7A7A7A82
        8282DADADAF2F2F2F2F2F2F2F2F2CBCBCB999999525152525152FF00FFFF00FF
        FF00FFFF00FFFF00FFC0A1A1CAA18FFFEAB6FFFFCAFFFFCAFFFFCAFFFFD4FFFF
        EAF4F4EAA17373FF00FF525152525152525152525152525152A3A3A3A0A0A0DF
        DFDFF2F2F2F2F2F2F2F2F2F4F4F4F9F9F9F1F1F1767676525152FF00FFFF00FF
        FF00FFFF00FFFF00FFB67B73F4D4A1F4CA8FFFF4C0FFFFCAFFFFD4FFFFEAFFFF
        F4FFFFFFD4CAABFF00FF5251525251525251525251525251527D7D7DCACACABF
        BFBFE8E8E8F2F2F2F4F4F4F9F9F9FCFCFCFFFFFFC3C3C3525152FF00FFFF00FF
        FF00FFFF00FFFF00FFD4AB8FFFE098F4C07BFFF4C0FFFFD4FFFFE0FFFFF4FFFF
        F4FFFFEAF4EACAB6847B525152525152525152525152525152A7A7A7D1D1D1B3
        B3B3E8E8E8F4F4F4F7F7F7FCFCFCFCFCFCF9F9F9E3E3E3858585FF00FFFF00FF
        FF00FFFF00FFFF00FFE0B698FFD498EAAB6AF4E0A1FFFFCAFFFFD4FFFFE0FFFF
        E0FFFFD4F4F4CAB69884525152525152525152525152525152B2B2B2C9C9C9A0
        A0A0D2D2D2F2F2F2F4F4F4F7F7F7F7F7F7F4F4F4E9E9E9959595FF00FFFF00FF
        FF00FFFF00FFFF00FFD4AB98FFE0A1EAAB6AF4C07BFFEAB6FFFFD4FFFFD4FFFF
        D4FFFFD4F4EACAB68F84525152525152525152525152525152A9A9A9D3D3D3A0
        A0A0B3B3B3DFDFDFF4F4F4F4F4F4F4F4F4F4F4F4E3E3E38F8F8FFF00FFFF00FF
        FF00FFFF00FFFF00FFB6847BFFEAB6FFEAB6F4CA8FF4C084F4E0A1FFF4C0FFF4
        CAFFFFCAE0D4ABFF00FF525152525152525152525152525152858585DFDFDFDF
        DFDFBFBFBFB5B5B5D2D2D2E8E8E8EAEAEAF2F2F2CBCBCB525152FF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFD4B698FFFFFFFFF4EAF4C07BEAAB6AF4C084FFE0
        A1FFF4B6AB8473FF00FF525152525152525152525152525152525152B1B1B1FF
        FFFFF2F2F2B3B3B3A0A0A0B5B5B5D3D3D3E6E6E6838383525152FF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFCAABABF4EACAFFEAB6FFE098FFE0A1F4D4
        A1C09884FF00FFFF00FF525152525152525152525152525152525152525152AD
        ADADE3E3E3DFDFDFD1D1D1D3D3D3CACACA969696525152525152FF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFC0987BC09884D4AB8FD4AB8FFF00
        FFFF00FFFF00FFFF00FF52515252515252515252515252515252515252515252
        5152949494969696A7A7A7A7A7A7525152525152525152525152}
      NumGlyphs = 2
    end
    object edNotificacao: TEdit
      Left = 238
      Top = 2
      Width = 121
      Height = 21
      TabOrder = 2
    end
    object rbficha: TRadioButton
      Left = 4
      Top = 4
      Width = 113
      Height = 17
      Caption = 'C'#243'digo da Ficha'
      Checked = True
      TabOrder = 0
      TabStop = True
      OnClick = rbfichaClick
    end
    object rbnumero: TRadioButton
      Left = 115
      Top = 4
      Width = 113
      Height = 17
      Caption = 'N'#250'mero Notifica'#231#227'o'
      TabOrder = 1
      OnClick = rbnumeroClick
    end
  end
  inherited dsControle: TDataSource
    DataSet = DMGERAL.TB_NOTIFICACAO
    OnDataChange = dsControleDataChange
    Left = 493
    Top = 13
  end
  inherited dsGrid: TDataSource
    DataSet = qyLocalizarNotificacao
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
      00000000000000000000000000000000000000000000F7F7F700F7F7F7000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000FFFF00000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FF00
      000000FF0000FF000000FF000000FF000000FF000000FF000000FF000000FF00
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000E7E7E700217B2100D6D6D6000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFF00000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FF00
      0000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF00
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFF00D6D6D600087B0800087B0800D6D6D6000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000FFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FF00000000FF000000FF000000FF000000FF000000FF000000FF00007363
      310000000000000000000000000000000000000000000000000000000000FFFF
      FF00DEDEDE00ADADAD007B8C7B00087B08005AF75A00107310009C9C9C00DEDE
      DE00FFFFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFF0000000000FFFFFF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF00
      0000000000000000000000000000000000000000000000000000E7E7E700638C
      63001084100029B5290042D642005AEF5A005AEF5A0031B53100108410003963
      39008C8C8C00E7E7E70000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000FFFF000000000000FFFF000000000000FFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FF00000021DEDE00FFDEDE0021DEDE00FFDEDE0021DEDE00FF00
      00000000000000000000000000000000000000000000D6D6D6001084100021BD
      210031C6310039D6390042DE42004AE74A004AE74A004ADE420039D6390029C6
      29001084100063636300D6D6D600000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFF0000000000FFFFFF0000000000FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FF00000000FFFF000000000000FFFF000000000000FFFF00FFDEDE0000FF
      FF00FF000000000000000000000000000000EFEFEF00088C080010AD100018B5
      180029C6290031CE310039D6390039D6390039D6390039D6390031CE310029C6
      290018B51800088C08006B6B6B00EFEFEF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000FFFF000000000000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FF0000000000000000FFFF000000000000FFFF0000000000FF0000000000
      0000FF000000000000000000000000000000318C310010AD100010AD100018B5
      180018BD210021BD210029C6290031C6310031C6310029C6290021BD210021B5
      210018B5180010AD100018731800B5B5B5000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF0000000000FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FF00000000FFFF00FFDEDE0000FFFF00FFDEDE0000FFFF00FF00000021DE
      DE00FF000000000000000000000000000000089C080010AD100010AD100010AD
      100018B5180018B5180021BD210021BD210021BD210021BD210018B5180018B5
      180010AD100010AD1000089C0800848484000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FF000000FFDEDE00FF000000FFC6C600FF000000FFDEDE00FF000000FF00
      00000000000000000000000000000000000010AD100010AD100018B518004AC6
      4A006BCE6B006BCE6B0063CE630063CE63005ACE5A0052C652004AC64A0042BD
      420021B5210010AD100010AD10007B7B7B000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FF00000021DEDE00FF0000005AA5A500FF00000021DEDE00FF0000000000
      00000000000000000000000000000000000010A510005AC65A007BD67B007BD6
      7B007BD67B0073CE730073CE73006BCE6B0063CE630063CE63005AC65A0052C6
      52004AC64A0042BD420018A51800949494000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FF000000FF000000FFC6C600FF000000FFDEDE00FF0000000000
      000000000000000000000000000000000000299C29008CD68C008CD68C008CD6
      8C0084D6840084D684007BD67B007BD67B0073CE73006BCE6B0063CE63005AC6
      5A0052C652004AC64A0018941800D6D6D6000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF00000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FF000000FF00000021DEDE00FF0000000000
      000000000000000000000000000000000000A5CEA5007BCE7B0094DE940094DE
      940094DE94008CDE8C008CD68C0084D684007BD67B0073CE73006BCE6B0063CE
      63005AC65A0042BD42006B946B00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FF000000FFDEDE00FF0000000000
      0000000000000000000000000000000000000000000073B5730084CE8400A5DE
      A500A5DEA5009CDE9C0094DE94008CDE8C008CD68C0084D6840073D673006BCE
      6B004ABD4A0052945200F7F7F700000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000000000FF
      FF00000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FF00000021DEDE00FF0000000000
      0000000000000000000000000000000000000000000000000000B5D6B50031A5
      31009CDE9C00ADE7AD00A5DEA5009CDE9C0094DE94008CD68C0073CE7300299C
      29009CBD9C00FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FF000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000D6EFD6006BB56B00218C210008840800218C210063AD6300CEDECE00FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
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
  object qyAspecto_Notificacao: TIBQuery
    Database = DM.DB
    Transaction = DM.TS
    BufferChunks = 1000
    CachedUpdates = False
    Left = 723
    Top = 241
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
    Top = 141
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
  object dsPacienteExistente: TDataSource
    AutoEdit = False
    DataSet = qyPacienteExistente
    Left = 717
    Top = 176
  end
  object RvNotificacao: TRvProject
    Engine = RvSysNotificaocao
    ProjectFile = 'C:\Compware\layout\RelNotificacao.rav'
    OnCreate = RvNotificacaoCreate
    Left = 21
    Top = 144
  end
  object RvSysNotificaocao: TRvSystem
    TitleSetup = 'Output Options'
    TitleStatus = 'Report Status'
    TitlePreview = 'Report Preview'
    SystemFiler.StatusFormat = 'Generating page %p'
    SystemPreview.ZoomFactor = 100.000000000000000000
    SystemPrinter.ScaleX = 100.000000000000000000
    SystemPrinter.ScaleY = 100.000000000000000000
    SystemPrinter.StatusFormat = 'Printing page %p'
    SystemPrinter.Title = 'ReportPrinter Report'
    SystemPrinter.UnitsFactor = 1.000000000000000000
    Left = 61
    Top = 144
  end
  object rvdsNotificacao: TRvDataSetConnection
    RuntimeVisibility = rtDeveloper
    DataSet = qyRelNotificacao
    Left = 93
    Top = 144
  end
  object rvdsPerfuracao: TRvDataSetConnection
    RuntimeVisibility = rtDeveloper
    DataSet = qyPerfuracao
    Left = 93
    Top = 176
  end
  object rvdsTatuagem: TRvDataSetConnection
    RuntimeVisibility = rtDeveloper
    DataSet = qyTatuagem
    Left = 93
    Top = 208
  end
  object qyTransfusao: TIBQuery
    Database = DM.DB
    Transaction = DM.TS
    BeforeOpen = qyTransfusaoBeforeOpen
    BufferChunks = 1000
    CachedUpdates = False
    DataSource = dsRelNotificacao
    SQL.Strings = (
      'select DT_TRANSFUSAO, DS_TRANSFUSAO from TRANSFUSAO'
      'WHERE CD_FICHA = :FICHA')
    Left = 125
    Top = 239
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'FICHA'
        ParamType = ptUnknown
      end>
    object qyTransfusaoDT_TRANSFUSAO: TDateField
      FieldName = 'DT_TRANSFUSAO'
      Origin = 'TRANSFUSAO.DT_TRANSFUSAO'
    end
    object qyTransfusaoDS_TRANSFUSAO: TIBStringField
      FieldName = 'DS_TRANSFUSAO'
      Origin = 'TRANSFUSAO.DS_TRANSFUSAO'
      Size = 255
    end
  end
  object qyPerfuracao: TIBQuery
    Database = DM.DB
    Transaction = DM.TS
    BeforeOpen = qyPerfuracaoBeforeOpen
    BufferChunks = 1000
    CachedUpdates = False
    DataSource = dsRelNotificacao
    SQL.Strings = (
      'select DT_PERFURACAO from PERFURACAO'
      'WHERE CD_FICHA = :FICHA'
      '')
    Left = 125
    Top = 177
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'FICHA'
        ParamType = ptUnknown
      end>
    object qyPerfuracaoDT_PERFURACAO: TDateField
      FieldName = 'DT_PERFURACAO'
      Origin = 'PERFURACAO.DT_PERFURACAO'
      Required = True
    end
  end
  object qyTatuagem: TIBQuery
    Database = DM.DB
    Transaction = DM.TS
    BeforeOpen = qyTatuagemBeforeOpen
    BufferChunks = 1000
    CachedUpdates = False
    DataSource = dsRelNotificacao
    SQL.Strings = (
      'select DT_TATUAGEM from TATUAGEM'
      'WHERE CD_FICHA = :FICHA')
    Left = 125
    Top = 209
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'FICHA'
        ParamType = ptUnknown
      end>
    object qyTatuagemDT_TATUAGEM: TDateField
      FieldName = 'DT_TATUAGEM'
      Origin = 'TATUAGEM.DT_TATUAGEM'
    end
  end
  object qyRelNotificacao: TIBQuery
    Database = DM.DB
    Transaction = DM.TS
    BeforeOpen = qyRelNotificacaoBeforeOpen
    OnCalcFields = qyRelNotificacaoCalcFields
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select N.*, P.*,'
      '(SELECT DS_PROVINCIA FROM PROVINCIA'
      'WHERE CD_PROVINCIA = N.CD_PROVINCIA_NOT)DS_PROVINCIA_NOT,'
      '(SELECT DS_MUNICIPIO FROM MUNICIPIO'
      'WHERE CD_MUNICIPIO = N.CD_MUNICIPIO)DS_MUNICIPIO_NOT,'
      '(SELECT DS_UNIDADE FROM UNIDADE'
      'WHERE CD_UNIDADE = N.CD_UNIDADE)DS_UNIDADE,'
      '(SELECT DS_PROVINCIA FROM PROVINCIA'
      
        'WHERE CD_PROVINCIA = N.CD_PROVINCIA_TRATAMENTO)DS_PROVINCIA_TRAT' +
        'AMENTO,'
      '(SELECT DS_MUNICIPIO FROM MUNICIPIO'
      
        'WHERE CD_MUNICIPIO = N.CD_MUNICIPIO_TRATAMENTO)DS_MUNICIPIO_TRAT' +
        'AMENTO,'
      '(SELECT DS_UNIDADE FROM UNIDADE'
      
        'WHERE CD_UNIDADE = N.CD_UNIDADE_TRATAMENTO)DS_UNIDADE_TRATAMENTO' +
        ','
      '(SELECT DS_PROVINCIA FROM PROVINCIA'
      'WHERE CD_PROVINCIA = P.CD_PROVINCIA)DS_PROVINCIA_P_NATURALIDADE,'
      '(SELECT DS_MUNICIPIO FROM MUNICIPIO'
      'WHERE CD_MUNICIPIO = P.CD_MUNICIPIO)DS_MUNICIPIO_P_NATURALIZADE,'
      '(SELECT DS_PROVINCIA FROM PROVINCIA'
      'WHERE CD_PROVINCIA = P.CD_NAR_PROVINCIA)DS_PROVINCIA_P_MORADIA,'
      '(SELECT DS_MUNICIPIO FROM MUNICIPIO'
      'WHERE CD_MUNICIPIO = P.CD_MOR_MUNICIPIO)DS_MUNICIPIO_P_MORADIA,'
      '(SELECT DS_PAIS FROM PAIS'
      'WHERE CD_PAIS = P.CD_PAIS)DS_PAIS_P'
      'from NOTIFICACAO N, PACIENTE P'
      'WHERE N.CD_FICHA = :CD_FICHA'
      'AND N.CD_UND = :CD_UND'
      'AND P.CD_PACIENTE = N.CD_PACIENTE'
      'AND P.CD_UNIDADE = N.CD_UNIDADE')
    Left = 125
    Top = 145
    ParamData = <
      item
        DataType = ftLargeint
        Name = 'CD_FICHA'
        ParamType = ptUnknown
        Size = 8
      end
      item
        DataType = ftInteger
        Name = 'CD_UND'
        ParamType = ptUnknown
        Size = 4
      end>
    object qyRelNotificacaoCD_FICHA: TLargeintField
      FieldName = 'CD_FICHA'
      Origin = 'NOTIFICACAO.CD_FICHA'
      Required = True
    end
    object qyRelNotificacaoCD_UNIDADE: TIntegerField
      FieldName = 'CD_UNIDADE'
      Origin = 'NOTIFICACAO.CD_UNIDADE'
      Required = True
    end
    object qyRelNotificacaoCD_USUARIO: TIntegerField
      FieldName = 'CD_USUARIO'
      Origin = 'NOTIFICACAO.CD_USUARIO'
      Required = True
    end
    object qyRelNotificacaoCD_MUNICIPIO: TIntegerField
      FieldName = 'CD_MUNICIPIO'
      Origin = 'NOTIFICACAO.CD_MUNICIPIO'
      Required = True
    end
    object qyRelNotificacaoCD_UNIDADE_TRATAMENTO: TIntegerField
      FieldName = 'CD_UNIDADE_TRATAMENTO'
      Origin = 'NOTIFICACAO.CD_UNIDADE_TRATAMENTO'
    end
    object qyRelNotificacaoCD_MUNICIPIO_TRATAMENTO: TIntegerField
      FieldName = 'CD_MUNICIPIO_TRATAMENTO'
      Origin = 'NOTIFICACAO.CD_MUNICIPIO_TRATAMENTO'
    end
    object qyRelNotificacaoCD_PACIENTE: TIntegerField
      FieldName = 'CD_PACIENTE'
      Origin = 'NOTIFICACAO.CD_PACIENTE'
      Required = True
    end
    object qyRelNotificacaoDT_NOTIFICACAO: TDateField
      FieldName = 'DT_NOTIFICACAO'
      Origin = 'NOTIFICACAO.DT_NOTIFICACAO'
      Required = True
    end
    object qyRelNotificacaoDT_DIAGNOSTICO: TDateField
      FieldName = 'DT_DIAGNOSTICO'
      Origin = 'NOTIFICACAO.DT_DIAGNOSTICO'
      Required = True
    end
    object qyRelNotificacaoCD_RELACOES_SEXO: TSmallintField
      FieldName = 'CD_RELACOES_SEXO'
      Origin = 'NOTIFICACAO.CD_RELACOES_SEXO'
    end
    object qyRelNotificacaoCD_MAE_POSITIVO: TSmallintField
      FieldName = 'CD_MAE_POSITIVO'
      Origin = 'NOTIFICACAO.CD_MAE_POSITIVO'
    end
    object qyRelNotificacaoCD_USOU_DROGA: TSmallintField
      FieldName = 'CD_USOU_DROGA'
      Origin = 'NOTIFICACAO.CD_USOU_DROGA'
    end
    object qyRelNotificacaoCD_ACIDENTE_MAT_BIO: TSmallintField
      FieldName = 'CD_ACIDENTE_MAT_BIO'
      Origin = 'NOTIFICACAO.CD_ACIDENTE_MAT_BIO'
    end
    object qyRelNotificacaoSN_TRANSFUSAO_SANGUE: TIntegerField
      FieldName = 'SN_TRANSFUSAO_SANGUE'
      Origin = 'NOTIFICACAO.SN_TRANSFUSAO_SANGUE'
    end
    object qyRelNotificacaoSN_PERFURACAO: TIntegerField
      FieldName = 'SN_PERFURACAO'
      Origin = 'NOTIFICACAO.SN_PERFURACAO'
    end
    object qyRelNotificacaoSN_TRAT_DENTARIO: TIntegerField
      FieldName = 'SN_TRAT_DENTARIO'
      Origin = 'NOTIFICACAO.SN_TRAT_DENTARIO'
    end
    object qyRelNotificacaoSN_INTERV_CIRURGICA: TIntegerField
      FieldName = 'SN_INTERV_CIRURGICA'
      Origin = 'NOTIFICACAO.SN_INTERV_CIRURGICA'
    end
    object qyRelNotificacaoSN_CIRCUNCISAO: TIntegerField
      FieldName = 'SN_CIRCUNCISAO'
      Origin = 'NOTIFICACAO.SN_CIRCUNCISAO'
    end
    object qyRelNotificacaoCD_TESTE_TRIAGEM: TSmallintField
      FieldName = 'CD_TESTE_TRIAGEM'
      Origin = 'NOTIFICACAO.CD_TESTE_TRIAGEM'
      Required = True
    end
    object qyRelNotificacaoDS_TESTE_TRIAGEM: TIBStringField
      FieldName = 'DS_TESTE_TRIAGEM'
      Origin = 'NOTIFICACAO.DS_TESTE_TRIAGEM'
      Size = 50
    end
    object qyRelNotificacaoCD_OCUPACAO: TSmallintField
      FieldName = 'CD_OCUPACAO'
      Origin = 'NOTIFICACAO.CD_OCUPACAO'
    end
    object qyRelNotificacaoDS_OCUPACAO: TIBStringField
      FieldName = 'DS_OCUPACAO'
      Origin = 'NOTIFICACAO.DS_OCUPACAO'
      Size = 50
    end
    object qyRelNotificacaoCD_TESTE_CONFIRMATORIO: TSmallintField
      FieldName = 'CD_TESTE_CONFIRMATORIO'
      Origin = 'NOTIFICACAO.CD_TESTE_CONFIRMATORIO'
      Required = True
    end
    object qyRelNotificacaoDS_TESTE_CONFIRMATORIO: TIBStringField
      FieldName = 'DS_TESTE_CONFIRMATORIO'
      Origin = 'NOTIFICACAO.DS_TESTE_CONFIRMATORIO'
      Size = 50
    end
    object qyRelNotificacaoCD_OMS: TSmallintField
      FieldName = 'CD_OMS'
      Origin = 'NOTIFICACAO.CD_OMS'
    end
    object qyRelNotificacaoCD_CD4: TIntegerField
      FieldName = 'CD_CD4'
      Origin = 'NOTIFICACAO.CD_CD4'
    end
    object qyRelNotificacaoCD_EVOLUCAO: TSmallintField
      FieldName = 'CD_EVOLUCAO'
      Origin = 'NOTIFICACAO.CD_EVOLUCAO'
    end
    object qyRelNotificacaoDT_EVOLUCAO: TDateField
      FieldName = 'DT_EVOLUCAO'
      Origin = 'NOTIFICACAO.DT_EVOLUCAO'
    end
    object qyRelNotificacaoDS_OBSERVACAO: TIBStringField
      FieldName = 'DS_OBSERVACAO'
      Origin = 'NOTIFICACAO.DS_OBSERVACAO'
      Size = 1000
    end
    object qyRelNotificacaoCD_NOTIFICACAO: TIntegerField
      FieldName = 'CD_NOTIFICACAO'
      Origin = 'NOTIFICACAO.CD_NOTIFICACAO'
      Required = True
    end
    object qyRelNotificacaoREGDUP: TIBStringField
      FieldName = 'REGDUP'
      Origin = 'NOTIFICACAO.REGDUP'
      FixedChar = True
      Size = 1
    end
    object qyRelNotificacaoCD_LOTE: TIntegerField
      FieldName = 'CD_LOTE'
      Origin = 'NOTIFICACAO.CD_LOTE'
    end
    object qyRelNotificacaoNM_ENTREVISTADOR: TIBStringField
      FieldName = 'NM_ENTREVISTADOR'
      Origin = 'NOTIFICACAO.NM_ENTREVISTADOR'
      Size = 50
    end
    object qyRelNotificacaoTEL_ENTREVISTADOR: TIBStringField
      FieldName = 'TEL_ENTREVISTADOR'
      Origin = 'NOTIFICACAO.TEL_ENTREVISTADOR'
      Size = 10
    end
    object qyRelNotificacaoFUNCAO_ENTREVISTADOR: TIBStringField
      FieldName = 'FUNCAO_ENTREVISTADOR'
      Origin = 'NOTIFICACAO.FUNCAO_ENTREVISTADOR'
      Size = 50
    end
    object qyRelNotificacaoNM_MEDICO: TIBStringField
      FieldName = 'NM_MEDICO'
      Origin = 'NOTIFICACAO.NM_MEDICO'
      Size = 50
    end
    object qyRelNotificacaoTEL_MEDICO: TIBStringField
      FieldName = 'TEL_MEDICO'
      Origin = 'NOTIFICACAO.TEL_MEDICO'
      Size = 10
    end
    object qyRelNotificacaoSN_TATUAGEM: TIntegerField
      FieldName = 'SN_TATUAGEM'
      Origin = 'NOTIFICACAO.SN_TATUAGEM'
    end
    object qyRelNotificacaoTP_ENTRADA: TIntegerField
      FieldName = 'TP_ENTRADA'
      Origin = 'NOTIFICACAO.TP_ENTRADA'
    end
    object qyRelNotificacaoEVIDENCIA_GESTANTE: TIntegerField
      FieldName = 'EVIDENCIA_GESTANTE'
      Origin = 'NOTIFICACAO.EVIDENCIA_GESTANTE'
    end
    object qyRelNotificacaoTB_ATUAL: TIntegerField
      FieldName = 'TB_ATUAL'
      Origin = 'NOTIFICACAO.TB_ATUAL'
    end
    object qyRelNotificacaoTB_ANTERIOR: TIntegerField
      FieldName = 'TB_ANTERIOR'
      Origin = 'NOTIFICACAO.TB_ANTERIOR'
    end
    object qyRelNotificacaoDT_TRATAMENTO_TB: TDateField
      FieldName = 'DT_TRATAMENTO_TB'
      Origin = 'NOTIFICACAO.DT_TRATAMENTO_TB'
    end
    object qyRelNotificacaoCD_PROVINCIA_TRATAMENTO: TIntegerField
      FieldName = 'CD_PROVINCIA_TRATAMENTO'
      Origin = 'NOTIFICACAO.CD_PROVINCIA_TRATAMENTO'
    end
    object qyRelNotificacaoCD_PROVINCIA_NOT: TIntegerField
      FieldName = 'CD_PROVINCIA_NOT'
      Origin = 'NOTIFICACAO.CD_PROVINCIA_NOT'
    end
    object qyRelNotificacaoDT_ALTERACAO: TDateTimeField
      FieldName = 'DT_ALTERACAO'
      Origin = 'NOTIFICACAO.DT_ALTERACAO'
    end
    object qyRelNotificacaoDT_EXPORTACAO: TDateTimeField
      FieldName = 'DT_EXPORTACAO'
      Origin = 'NOTIFICACAO.DT_EXPORTACAO'
    end
    object qyRelNotificacaoCD_FICHA_ORACLE: TIntegerField
      FieldName = 'CD_FICHA_ORACLE'
      Origin = 'NOTIFICACAO.CD_FICHA_ORACLE'
    end
    object qyRelNotificacaoCD_MEDICO: TIntegerField
      FieldName = 'CD_MEDICO'
      Origin = 'NOTIFICACAO.CD_MEDICO'
    end
    object qyRelNotificacaoNR_NOTIFICACAO: TIBStringField
      FieldName = 'NR_NOTIFICACAO'
      Origin = 'NOTIFICACAO.NR_NOTIFICACAO'
      Size = 10
    end
    object qyRelNotificacaoCD_FICHA_SINVS: TLargeintField
      FieldName = 'CD_FICHA_SINVS'
      Origin = 'NOTIFICACAO.CD_FICHA_SINVS'
    end
    object qyRelNotificacaoCD_PACIENTE1: TIntegerField
      FieldName = 'CD_PACIENTE1'
      Origin = 'PACIENTE.CD_PACIENTE'
      Required = True
    end
    object qyRelNotificacaoCD_BAIRRO: TIntegerField
      FieldName = 'CD_BAIRRO'
      Origin = 'PACIENTE.CD_BAIRRO'
    end
    object qyRelNotificacaoCD_PAIS: TIntegerField
      FieldName = 'CD_PAIS'
      Origin = 'PACIENTE.CD_PAIS'
    end
    object qyRelNotificacaoCD_MUNICIPIO1: TIntegerField
      FieldName = 'CD_MUNICIPIO1'
      Origin = 'PACIENTE.CD_MUNICIPIO'
    end
    object qyRelNotificacaoCD_MOR_MUNICIPIO: TIntegerField
      FieldName = 'CD_MOR_MUNICIPIO'
      Origin = 'PACIENTE.CD_MOR_MUNICIPIO'
    end
    object qyRelNotificacaoCD_PROVINCIA: TIntegerField
      FieldName = 'CD_PROVINCIA'
      Origin = 'PACIENTE.CD_PROVINCIA'
    end
    object qyRelNotificacaoCD_COMUNA: TIntegerField
      FieldName = 'CD_COMUNA'
      Origin = 'PACIENTE.CD_COMUNA'
    end
    object qyRelNotificacaoNM_PACIENTE: TIBStringField
      FieldName = 'NM_PACIENTE'
      Origin = 'PACIENTE.NM_PACIENTE'
      Required = True
      Size = 50
    end
    object qyRelNotificacaoDT_NASCIMENTO: TDateField
      FieldName = 'DT_NASCIMENTO'
      Origin = 'PACIENTE.DT_NASCIMENTO'
      Required = True
    end
    object qyRelNotificacaoIDADE: TSmallintField
      FieldName = 'IDADE'
      Origin = 'PACIENTE.IDADE'
      Required = True
    end
    object qyRelNotificacaoNM_MAE: TIBStringField
      FieldName = 'NM_MAE'
      Origin = 'PACIENTE.NM_MAE'
      Required = True
      Size = 50
    end
    object qyRelNotificacaoCD_MORADA_PERM: TIBStringField
      FieldName = 'CD_MORADA_PERM'
      Origin = 'PACIENTE.CD_MORADA_PERM'
      FixedChar = True
      Size = 1
    end
    object qyRelNotificacaoCD_ESCOLARIDADE: TSmallintField
      FieldName = 'CD_ESCOLARIDADE'
      Origin = 'PACIENTE.CD_ESCOLARIDADE'
    end
    object qyRelNotificacaoDS_ESCOLARIDADE: TIBStringField
      FieldName = 'DS_ESCOLARIDADE'
      Origin = 'PACIENTE.DS_ESCOLARIDADE'
      Size = 50
    end
    object qyRelNotificacaoTP_SEXO: TIBStringField
      FieldName = 'TP_SEXO'
      Origin = 'PACIENTE.TP_SEXO'
      Required = True
      FixedChar = True
      Size = 1
    end
    object qyRelNotificacaoMESES: TIntegerField
      FieldName = 'MESES'
      Origin = 'PACIENTE.MESES'
    end
    object qyRelNotificacaoESTADO_CIVIL: TIntegerField
      FieldName = 'ESTADO_CIVIL'
      Origin = 'PACIENTE.ESTADO_CIVIL'
    end
    object qyRelNotificacaoCD_NAR_PROVINCIA: TIntegerField
      FieldName = 'CD_NAR_PROVINCIA'
      Origin = 'PACIENTE.CD_NAR_PROVINCIA'
    end
    object qyRelNotificacaoCD_PACIENTE_ORACLE: TIntegerField
      FieldName = 'CD_PACIENTE_ORACLE'
      Origin = 'PACIENTE.CD_PACIENTE_ORACLE'
    end
    object qyRelNotificacaoCD_OCUPACAO1: TIntegerField
      FieldName = 'CD_OCUPACAO1'
      Origin = 'PACIENTE.CD_OCUPACAO'
    end
    object qyRelNotificacaoCD_DOCUMENTO: TIntegerField
      FieldName = 'CD_DOCUMENTO'
      Origin = 'PACIENTE.CD_DOCUMENTO'
    end
    object qyRelNotificacaoTP_DOCUMENTO: TIBStringField
      FieldName = 'TP_DOCUMENTO'
      Origin = 'PACIENTE.TP_DOCUMENTO'
    end
    object qyRelNotificacaoNR_DOCUMENTO: TIBStringField
      FieldName = 'NR_DOCUMENTO'
      Origin = 'PACIENTE.NR_DOCUMENTO'
    end
    object qyRelNotificacaoNR_TEL_1: TIBStringField
      FieldName = 'NR_TEL_1'
      Origin = 'PACIENTE.NR_TEL_1'
    end
    object qyRelNotificacaoNR_TEL_2: TIBStringField
      FieldName = 'NR_TEL_2'
      Origin = 'PACIENTE.NR_TEL_2'
    end
    object qyRelNotificacaoDS_ENDERECO: TIBStringField
      FieldName = 'DS_ENDERECO'
      Origin = 'PACIENTE.DS_ENDERECO'
      Size = 200
    end
    object qyRelNotificacaoFL_GESTANTE: TIntegerField
      FieldName = 'FL_GESTANTE'
      Origin = 'PACIENTE.FL_GESTANTE'
    end
    object qyRelNotificacaoFL_NOTIFICACAO: TIntegerField
      FieldName = 'FL_NOTIFICACAO'
      Origin = 'PACIENTE.FL_NOTIFICACAO'
    end
    object qyRelNotificacaoDS_PROVINCIA_NOT: TIBStringField
      FieldName = 'DS_PROVINCIA_NOT'
      Size = 50
    end
    object qyRelNotificacaoDS_MUNICIPIO_NOT: TIBStringField
      FieldName = 'DS_MUNICIPIO_NOT'
      Size = 50
    end
    object qyRelNotificacaoDS_UNIDADE: TIBStringField
      FieldName = 'DS_UNIDADE'
      Size = 50
    end
    object qyRelNotificacaoDS_PROVINCIA_TRATAMENTO: TIBStringField
      FieldName = 'DS_PROVINCIA_TRATAMENTO'
      Size = 50
    end
    object qyRelNotificacaoDS_MUNICIPIO_TRATAMENTO: TIBStringField
      FieldName = 'DS_MUNICIPIO_TRATAMENTO'
      Size = 50
    end
    object qyRelNotificacaoDS_UNIDADE_TRATAMENTO: TIBStringField
      FieldName = 'DS_UNIDADE_TRATAMENTO'
      Size = 50
    end
    object qyRelNotificacaoDS_PROVINCIA_P_NATURALIDADE: TIBStringField
      FieldName = 'DS_PROVINCIA_P_NATURALIDADE'
      Size = 50
    end
    object qyRelNotificacaoDS_MUNICIPIO_P_NATURALIZADE: TIBStringField
      FieldName = 'DS_MUNICIPIO_P_NATURALIZADE'
      Size = 50
    end
    object qyRelNotificacaoDS_PROVINCIA_P_MORADIA: TIBStringField
      FieldName = 'DS_PROVINCIA_P_MORADIA'
      Size = 50
    end
    object qyRelNotificacaoDS_MUNICIPIO_P_MORADIA: TIBStringField
      FieldName = 'DS_MUNICIPIO_P_MORADIA'
      Size = 50
    end
    object qyRelNotificacaoDS_PAIS_P: TIBStringField
      FieldName = 'DS_PAIS_P'
      Size = 50
    end
    object qyRelNotificacaoDT_ENTRADA: TDateField
      FieldName = 'DT_ENTRADA'
      Origin = 'NOTIFICACAO.DT_ENTRADA'
    end
    object qyRelNotificacaoDT_EVOLUCAO_2: TDateField
      FieldName = 'DT_EVOLUCAO_2'
      Origin = 'NOTIFICACAO.DT_EVOLUCAO_2'
    end
    object qyRelNotificacaoNR_IDADE_IDENTIFICACAO: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'NR_IDADE_IDENTIFICACAO'
      Calculated = True
    end
  end
  object rvdsTransfusao: TRvDataSetConnection
    RuntimeVisibility = rtDeveloper
    DataSet = qyTransfusao
    Left = 93
    Top = 240
  end
  object rvdsAspectosOMSCriancas: TRvDataSetConnection
    RuntimeVisibility = rtDeveloper
    DataSet = qyAspectosOMSCriancas
    Left = 93
    Top = 271
  end
  object qyAspectosOMSCriancas: TIBQuery
    Database = DM.DB
    Transaction = DM.TS
    BeforeOpen = qyAspectosOMSCriancasBeforeOpen
    BufferChunks = 1000
    CachedUpdates = False
    DataSource = dsRelNotificacao
    SQL.Strings = (
      'select  CD_ESTAGIO_CLINICO, DS_ASPECTO'
      'from ASPECTO_OMS AO, ASPECTO_NOTIFICACAO AN'
      'WHERE AO.CD_ASPECTO = AN.CD_ASPECTO'
      'AND AO.SN_CRIANCA = 1'
      'AND AN.CD_FICHA = :FICHA')
    Left = 125
    Top = 270
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'FICHA'
        ParamType = ptUnknown
      end>
    object qyAspectosOMSCriancasCD_ESTAGIO_CLINICO: TSmallintField
      FieldName = 'CD_ESTAGIO_CLINICO'
      Origin = 'ASPECTO_OMS.CD_ESTAGIO_CLINICO'
      Required = True
    end
    object qyAspectosOMSCriancasDS_ASPECTO: TIBStringField
      FieldName = 'DS_ASPECTO'
      Origin = 'ASPECTO_OMS.DS_ASPECTO'
      Required = True
      Size = 255
    end
  end
  object dsRelNotificacao: TDataSource
    DataSet = qyRelNotificacao
    Left = 254
    Top = 146
  end
  object qyAspectosOMSAdultos: TIBQuery
    Database = DM.DB
    Transaction = DM.TS
    BeforeOpen = qyAspectosOMSAdultosBeforeOpen
    BufferChunks = 1000
    CachedUpdates = False
    DataSource = dsRelNotificacao
    SQL.Strings = (
      'select  CD_ESTAGIO_CLINICO, DS_ASPECTO'
      'from ASPECTO_OMS AO, ASPECTO_NOTIFICACAO AN'
      'WHERE AO.CD_ASPECTO = AN.CD_ASPECTO'
      'AND AO.SN_CRIANCA = 0'
      'AND AN.CD_FICHA =:FICHA')
    Left = 293
    Top = 255
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'FICHA'
        ParamType = ptUnknown
      end>
    object qyAspectosOMSAdultosCD_ESTAGIO_CLINICO: TSmallintField
      FieldName = 'CD_ESTAGIO_CLINICO'
      Origin = 'ASPECTO_OMS.CD_ESTAGIO_CLINICO'
      Required = True
    end
    object qyAspectosOMSAdultosDS_ASPECTO: TIBStringField
      FieldName = 'DS_ASPECTO'
      Origin = 'ASPECTO_OMS.DS_ASPECTO'
      Required = True
      Size = 255
    end
  end
  object rvdsAspectosOMSAdultos: TRvDataSetConnection
    RuntimeVisibility = rtDeveloper
    DataSet = qyAspectosOMSAdultos
    Left = 261
    Top = 255
  end
  object qyLocalizarNotificacao: TIBQuery
    Database = DM.DB
    Transaction = DM.TS
    OnCalcFields = qyLocalizarNotificacaoCalcFields
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select'
      'notificacao.cd_ficha||notificacao.cd_und  chave,'
      'notificacao.*,'
      'paciente.*,'
      '(select ds_unidade from Unidade'
      'where cd_unidade = notificacao.cd_unidade)ds_unidade'
      'from NOTIFICACAO, PACIENTE'
      'where paciente.CD_PACIENTE = notificacao.CD_PACIENTE'
      'and paciente.cd_und = notificacao.cd_und'
      'and 1=2')
    Left = 322
    Top = 135
    object qyLocalizarNotificacaoNR_NOTIFICACAO: TIBStringField
      FieldName = 'NR_NOTIFICACAO'
      Origin = 'NOTIFICACAO.NR_NOTIFICACAO'
      Size = 10
    end
    object qyLocalizarNotificacaoDT_NOTIFICACAO: TDateField
      FieldName = 'DT_NOTIFICACAO'
      Origin = 'NOTIFICACAO.DT_NOTIFICACAO'
      Required = True
    end
    object qyLocalizarNotificacaoNM_ENTREVISTADOR: TIBStringField
      FieldName = 'NM_ENTREVISTADOR'
      Origin = 'NOTIFICACAO.NM_ENTREVISTADOR'
      Size = 50
    end
    object qyLocalizarNotificacaoNM_MEDICO: TIBStringField
      FieldName = 'NM_MEDICO'
      Origin = 'NOTIFICACAO.NM_MEDICO'
      Size = 50
    end
    object qyLocalizarNotificacaoNM_PACIENTE: TIBStringField
      FieldName = 'NM_PACIENTE'
      Origin = 'PACIENTE.NM_PACIENTE'
      Required = True
      Size = 50
    end
    object qyLocalizarNotificacaoNR_PROCESSO: TIntegerField
      FieldName = 'NR_PROCESSO'
      Origin = 'PACIENTE.NR_PROCESSO'
    end
    object qyLocalizarNotificacaoDS_UNIDADE: TIBStringField
      FieldName = 'DS_UNIDADE'
      Size = 50
    end
    object qyLocalizarNotificacaoCD_FICHA: TLargeintField
      FieldName = 'CD_FICHA'
      Origin = 'NOTIFICACAO.CD_FICHA'
      Required = True
    end
    object qyLocalizarNotificacaoCD_UND: TIntegerField
      FieldName = 'CD_UND'
      Origin = 'NOTIFICACAO.CD_UND'
      Required = True
    end
    object qyLocalizarNotificacaoCD_UNIDADE: TIntegerField
      FieldName = 'CD_UNIDADE'
      Origin = 'NOTIFICACAO.CD_UNIDADE'
      Required = True
    end
    object qyLocalizarNotificacaoCD_USUARIO: TIntegerField
      FieldName = 'CD_USUARIO'
      Origin = 'NOTIFICACAO.CD_USUARIO'
      Required = True
    end
    object qyLocalizarNotificacaoCD_MUNICIPIO: TIntegerField
      FieldName = 'CD_MUNICIPIO'
      Origin = 'NOTIFICACAO.CD_MUNICIPIO'
      Required = True
    end
    object qyLocalizarNotificacaoCD_UNIDADE_TRATAMENTO: TIntegerField
      FieldName = 'CD_UNIDADE_TRATAMENTO'
      Origin = 'NOTIFICACAO.CD_UNIDADE_TRATAMENTO'
    end
    object qyLocalizarNotificacaoCD_MUNICIPIO_TRATAMENTO: TIntegerField
      FieldName = 'CD_MUNICIPIO_TRATAMENTO'
      Origin = 'NOTIFICACAO.CD_MUNICIPIO_TRATAMENTO'
    end
    object qyLocalizarNotificacaoCD_PACIENTE: TIntegerField
      FieldName = 'CD_PACIENTE'
      Origin = 'NOTIFICACAO.CD_PACIENTE'
      Required = True
    end
    object qyLocalizarNotificacaoDT_DIAGNOSTICO: TDateField
      FieldName = 'DT_DIAGNOSTICO'
      Origin = 'NOTIFICACAO.DT_DIAGNOSTICO'
      Required = True
    end
    object qyLocalizarNotificacaoCD_RELACOES_SEXO: TSmallintField
      FieldName = 'CD_RELACOES_SEXO'
      Origin = 'NOTIFICACAO.CD_RELACOES_SEXO'
    end
    object qyLocalizarNotificacaoCD_MAE_POSITIVO: TSmallintField
      FieldName = 'CD_MAE_POSITIVO'
      Origin = 'NOTIFICACAO.CD_MAE_POSITIVO'
    end
    object qyLocalizarNotificacaoCD_USOU_DROGA: TSmallintField
      FieldName = 'CD_USOU_DROGA'
      Origin = 'NOTIFICACAO.CD_USOU_DROGA'
    end
    object qyLocalizarNotificacaoCD_ACIDENTE_MAT_BIO: TSmallintField
      FieldName = 'CD_ACIDENTE_MAT_BIO'
      Origin = 'NOTIFICACAO.CD_ACIDENTE_MAT_BIO'
    end
    object qyLocalizarNotificacaoSN_TRANSFUSAO_SANGUE: TIntegerField
      FieldName = 'SN_TRANSFUSAO_SANGUE'
      Origin = 'NOTIFICACAO.SN_TRANSFUSAO_SANGUE'
    end
    object qyLocalizarNotificacaoSN_PERFURACAO: TIntegerField
      FieldName = 'SN_PERFURACAO'
      Origin = 'NOTIFICACAO.SN_PERFURACAO'
    end
    object qyLocalizarNotificacaoSN_TRAT_DENTARIO: TIntegerField
      FieldName = 'SN_TRAT_DENTARIO'
      Origin = 'NOTIFICACAO.SN_TRAT_DENTARIO'
    end
    object qyLocalizarNotificacaoSN_INTERV_CIRURGICA: TIntegerField
      FieldName = 'SN_INTERV_CIRURGICA'
      Origin = 'NOTIFICACAO.SN_INTERV_CIRURGICA'
    end
    object qyLocalizarNotificacaoSN_CIRCUNCISAO: TIntegerField
      FieldName = 'SN_CIRCUNCISAO'
      Origin = 'NOTIFICACAO.SN_CIRCUNCISAO'
    end
    object qyLocalizarNotificacaoCD_TESTE_TRIAGEM: TSmallintField
      FieldName = 'CD_TESTE_TRIAGEM'
      Origin = 'NOTIFICACAO.CD_TESTE_TRIAGEM'
      Required = True
    end
    object qyLocalizarNotificacaoDS_TESTE_TRIAGEM: TIBStringField
      FieldName = 'DS_TESTE_TRIAGEM'
      Origin = 'NOTIFICACAO.DS_TESTE_TRIAGEM'
      Size = 50
    end
    object qyLocalizarNotificacaoCD_OCUPACAO: TSmallintField
      FieldName = 'CD_OCUPACAO'
      Origin = 'NOTIFICACAO.CD_OCUPACAO'
    end
    object qyLocalizarNotificacaoDS_OCUPACAO: TIBStringField
      FieldName = 'DS_OCUPACAO'
      Origin = 'NOTIFICACAO.DS_OCUPACAO'
      Size = 50
    end
    object qyLocalizarNotificacaoCD_TESTE_CONFIRMATORIO: TSmallintField
      FieldName = 'CD_TESTE_CONFIRMATORIO'
      Origin = 'NOTIFICACAO.CD_TESTE_CONFIRMATORIO'
      Required = True
    end
    object qyLocalizarNotificacaoDS_TESTE_CONFIRMATORIO: TIBStringField
      FieldName = 'DS_TESTE_CONFIRMATORIO'
      Origin = 'NOTIFICACAO.DS_TESTE_CONFIRMATORIO'
      Size = 50
    end
    object qyLocalizarNotificacaoCD_OMS: TSmallintField
      FieldName = 'CD_OMS'
      Origin = 'NOTIFICACAO.CD_OMS'
    end
    object qyLocalizarNotificacaoCD_CD4: TIntegerField
      FieldName = 'CD_CD4'
      Origin = 'NOTIFICACAO.CD_CD4'
    end
    object qyLocalizarNotificacaoCD_EVOLUCAO: TSmallintField
      FieldName = 'CD_EVOLUCAO'
      Origin = 'NOTIFICACAO.CD_EVOLUCAO'
    end
    object qyLocalizarNotificacaoDT_EVOLUCAO: TDateField
      FieldName = 'DT_EVOLUCAO'
      Origin = 'NOTIFICACAO.DT_EVOLUCAO'
    end
    object qyLocalizarNotificacaoDS_OBSERVACAO: TIBStringField
      FieldName = 'DS_OBSERVACAO'
      Origin = 'NOTIFICACAO.DS_OBSERVACAO'
      Size = 1000
    end
    object qyLocalizarNotificacaoCD_NOTIFICACAO: TIntegerField
      FieldName = 'CD_NOTIFICACAO'
      Origin = 'NOTIFICACAO.CD_NOTIFICACAO'
      Required = True
    end
    object qyLocalizarNotificacaoREGDUP: TIBStringField
      FieldName = 'REGDUP'
      Origin = 'NOTIFICACAO.REGDUP'
      FixedChar = True
      Size = 1
    end
    object qyLocalizarNotificacaoCD_LOTE: TIntegerField
      FieldName = 'CD_LOTE'
      Origin = 'NOTIFICACAO.CD_LOTE'
    end
    object qyLocalizarNotificacaoTEL_ENTREVISTADOR: TIBStringField
      FieldName = 'TEL_ENTREVISTADOR'
      Origin = 'NOTIFICACAO.TEL_ENTREVISTADOR'
      Size = 10
    end
    object qyLocalizarNotificacaoFUNCAO_ENTREVISTADOR: TIBStringField
      FieldName = 'FUNCAO_ENTREVISTADOR'
      Origin = 'NOTIFICACAO.FUNCAO_ENTREVISTADOR'
      Size = 50
    end
    object qyLocalizarNotificacaoTEL_MEDICO: TIBStringField
      FieldName = 'TEL_MEDICO'
      Origin = 'NOTIFICACAO.TEL_MEDICO'
      Size = 10
    end
    object qyLocalizarNotificacaoSN_TATUAGEM: TIntegerField
      FieldName = 'SN_TATUAGEM'
      Origin = 'NOTIFICACAO.SN_TATUAGEM'
    end
    object qyLocalizarNotificacaoTP_ENTRADA: TIntegerField
      FieldName = 'TP_ENTRADA'
      Origin = 'NOTIFICACAO.TP_ENTRADA'
    end
    object qyLocalizarNotificacaoEVIDENCIA_GESTANTE: TIntegerField
      FieldName = 'EVIDENCIA_GESTANTE'
      Origin = 'NOTIFICACAO.EVIDENCIA_GESTANTE'
    end
    object qyLocalizarNotificacaoTB_ATUAL: TIntegerField
      FieldName = 'TB_ATUAL'
      Origin = 'NOTIFICACAO.TB_ATUAL'
    end
    object qyLocalizarNotificacaoTB_ANTERIOR: TIntegerField
      FieldName = 'TB_ANTERIOR'
      Origin = 'NOTIFICACAO.TB_ANTERIOR'
    end
    object qyLocalizarNotificacaoDT_TRATAMENTO_TB: TDateField
      FieldName = 'DT_TRATAMENTO_TB'
      Origin = 'NOTIFICACAO.DT_TRATAMENTO_TB'
    end
    object qyLocalizarNotificacaoCD_PROVINCIA_TRATAMENTO: TIntegerField
      FieldName = 'CD_PROVINCIA_TRATAMENTO'
      Origin = 'NOTIFICACAO.CD_PROVINCIA_TRATAMENTO'
    end
    object qyLocalizarNotificacaoCD_PROVINCIA_NOT: TIntegerField
      FieldName = 'CD_PROVINCIA_NOT'
      Origin = 'NOTIFICACAO.CD_PROVINCIA_NOT'
    end
    object qyLocalizarNotificacaoDT_ALTERACAO: TDateTimeField
      FieldName = 'DT_ALTERACAO'
      Origin = 'NOTIFICACAO.DT_ALTERACAO'
    end
    object qyLocalizarNotificacaoDT_EXPORTACAO: TDateTimeField
      FieldName = 'DT_EXPORTACAO'
      Origin = 'NOTIFICACAO.DT_EXPORTACAO'
    end
    object qyLocalizarNotificacaoCD_FICHA_ORACLE: TIntegerField
      FieldName = 'CD_FICHA_ORACLE'
      Origin = 'NOTIFICACAO.CD_FICHA_ORACLE'
    end
    object qyLocalizarNotificacaoCD_MEDICO: TIntegerField
      FieldName = 'CD_MEDICO'
      Origin = 'NOTIFICACAO.CD_MEDICO'
    end
    object qyLocalizarNotificacaoCD_FICHA_SINVS: TLargeintField
      FieldName = 'CD_FICHA_SINVS'
      Origin = 'NOTIFICACAO.CD_FICHA_SINVS'
    end
    object qyLocalizarNotificacaoCD_INVESTIGADOR: TIntegerField
      FieldName = 'CD_INVESTIGADOR'
      Origin = 'NOTIFICACAO.CD_INVESTIGADOR'
    end
    object qyLocalizarNotificacaoDT_TESTE_TRIAGEM: TDateTimeField
      FieldName = 'DT_TESTE_TRIAGEM'
      Origin = 'NOTIFICACAO.DT_TESTE_TRIAGEM'
    end
    object qyLocalizarNotificacaoDT_TESTE_CONFIRMATORIO: TDateTimeField
      FieldName = 'DT_TESTE_CONFIRMATORIO'
      Origin = 'NOTIFICACAO.DT_TESTE_CONFIRMATORIO'
    end
    object qyLocalizarNotificacaoNR_PROCESSO_UTENTE: TIBStringField
      FieldName = 'NR_PROCESSO_UTENTE'
      Origin = 'NOTIFICACAO.NR_PROCESSO_UTENTE'
      Size = 30
    end
    object qyLocalizarNotificacaoCD_BAIRRO: TIntegerField
      FieldName = 'CD_BAIRRO'
      Origin = 'PACIENTE.CD_BAIRRO'
    end
    object qyLocalizarNotificacaoCD_PAIS: TIntegerField
      FieldName = 'CD_PAIS'
      Origin = 'PACIENTE.CD_PAIS'
    end
    object qyLocalizarNotificacaoCD_MOR_MUNICIPIO: TIntegerField
      FieldName = 'CD_MOR_MUNICIPIO'
      Origin = 'PACIENTE.CD_MOR_MUNICIPIO'
    end
    object qyLocalizarNotificacaoCD_PROVINCIA: TIntegerField
      FieldName = 'CD_PROVINCIA'
      Origin = 'PACIENTE.CD_PROVINCIA'
    end
    object qyLocalizarNotificacaoCD_COMUNA: TIntegerField
      FieldName = 'CD_COMUNA'
      Origin = 'PACIENTE.CD_COMUNA'
    end
    object qyLocalizarNotificacaoDT_NASCIMENTO: TDateField
      FieldName = 'DT_NASCIMENTO'
      Origin = 'PACIENTE.DT_NASCIMENTO'
      Required = True
    end
    object qyLocalizarNotificacaoIDADE: TSmallintField
      FieldName = 'IDADE'
      Origin = 'PACIENTE.IDADE'
      Required = True
    end
    object qyLocalizarNotificacaoNM_MAE: TIBStringField
      FieldName = 'NM_MAE'
      Origin = 'PACIENTE.NM_MAE'
      Required = True
      Size = 50
    end
    object qyLocalizarNotificacaoCD_MORADA_PERM: TIBStringField
      FieldName = 'CD_MORADA_PERM'
      Origin = 'PACIENTE.CD_MORADA_PERM'
      FixedChar = True
      Size = 1
    end
    object qyLocalizarNotificacaoCD_ESCOLARIDADE: TSmallintField
      FieldName = 'CD_ESCOLARIDADE'
      Origin = 'PACIENTE.CD_ESCOLARIDADE'
    end
    object qyLocalizarNotificacaoDS_ESCOLARIDADE: TIBStringField
      FieldName = 'DS_ESCOLARIDADE'
      Origin = 'PACIENTE.DS_ESCOLARIDADE'
      Size = 50
    end
    object qyLocalizarNotificacaoTP_SEXO: TIBStringField
      FieldName = 'TP_SEXO'
      Origin = 'PACIENTE.TP_SEXO'
      Required = True
      FixedChar = True
      Size = 1
    end
    object qyLocalizarNotificacaoMESES: TIntegerField
      FieldName = 'MESES'
      Origin = 'PACIENTE.MESES'
    end
    object qyLocalizarNotificacaoESTADO_CIVIL: TIntegerField
      FieldName = 'ESTADO_CIVIL'
      Origin = 'PACIENTE.ESTADO_CIVIL'
    end
    object qyLocalizarNotificacaoCD_NAR_PROVINCIA: TIntegerField
      FieldName = 'CD_NAR_PROVINCIA'
      Origin = 'PACIENTE.CD_NAR_PROVINCIA'
    end
    object qyLocalizarNotificacaoCD_DOCUMENTO: TIntegerField
      FieldName = 'CD_DOCUMENTO'
      Origin = 'PACIENTE.CD_DOCUMENTO'
    end
    object qyLocalizarNotificacaoTP_DOCUMENTO: TIBStringField
      FieldName = 'TP_DOCUMENTO'
      Origin = 'PACIENTE.TP_DOCUMENTO'
    end
    object qyLocalizarNotificacaoNR_DOCUMENTO: TIBStringField
      FieldName = 'NR_DOCUMENTO'
      Origin = 'PACIENTE.NR_DOCUMENTO'
    end
    object qyLocalizarNotificacaoNR_TEL_1: TIBStringField
      FieldName = 'NR_TEL_1'
      Origin = 'PACIENTE.NR_TEL_1'
    end
    object qyLocalizarNotificacaoNR_TEL_2: TIBStringField
      FieldName = 'NR_TEL_2'
      Origin = 'PACIENTE.NR_TEL_2'
    end
    object qyLocalizarNotificacaoDS_ENDERECO: TIBStringField
      FieldName = 'DS_ENDERECO'
      Origin = 'PACIENTE.DS_ENDERECO'
      Size = 200
    end
    object qyLocalizarNotificacaoFL_GESTANTE: TIntegerField
      FieldName = 'FL_GESTANTE'
      Origin = 'PACIENTE.FL_GESTANTE'
    end
    object qyLocalizarNotificacaoFL_NOTIFICACAO: TIntegerField
      FieldName = 'FL_NOTIFICACAO'
      Origin = 'PACIENTE.FL_NOTIFICACAO'
    end
    object qyLocalizarNotificacaoNR_MESES_GESTANTE: TIntegerField
      FieldName = 'NR_MESES_GESTANTE'
      Origin = 'PACIENTE.NR_MESES_GESTANTE'
    end
    object qyLocalizarNotificacaoFL_RESULTADO: TIBStringField
      FieldName = 'FL_RESULTADO'
      Origin = 'PACIENTE.FL_RESULTADO'
      FixedChar = True
      Size = 1
    end
    object qyLocalizarNotificacaoCHAVE: TIBStringField
      FieldName = 'CHAVE'
      Required = True
      Size = 31
    end
    object qyLocalizarNotificacaoNR_IDADE_IDENTIFICACAO: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'NR_IDADE_IDENTIFICACAO'
      Calculated = True
    end
  end
  object qyDentario: TIBQuery
    Database = DM.DB
    Transaction = DM.TS
    BeforeOpen = qyDentarioBeforeOpen
    BufferChunks = 1000
    CachedUpdates = False
    DataSource = dsRelNotificacao
    SQL.Strings = (
      'select DT_DENTARIO from DENTARIO'
      'WHERE CD_FICHA = :FICHA'
      '')
    Left = 397
    Top = 159
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'FICHA'
        ParamType = ptUnknown
      end>
    object qyDentarioDT_DENTARIO: TDateField
      FieldName = 'DT_DENTARIO'
      Origin = 'DENTARIO.DT_DENTARIO'
      Required = True
    end
  end
  object dvdsDentario: TRvDataSetConnection
    RuntimeVisibility = rtDeveloper
    DataSet = qyDentario
    Left = 253
    Top = 176
  end
  object qyIntervencao: TIBQuery
    Database = DM.DB
    Transaction = DM.TS
    BeforeOpen = qyIntervencaoBeforeOpen
    BufferChunks = 1000
    CachedUpdates = False
    DataSource = dsRelNotificacao
    SQL.Strings = (
      'select DT_CIRURGIA from INTERV_CIRURGICA'
      'WHERE CD_FICHA = :FICHA'
      '')
    Left = 349
    Top = 177
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'FICHA'
        ParamType = ptUnknown
      end>
    object qyIntervencaoDT_CIRURGIA: TDateField
      FieldName = 'DT_CIRURGIA'
      Origin = 'INTERV_CIRURGICA.DT_CIRURGIA'
      Required = True
    end
  end
  object rvdsIntervencao: TRvDataSetConnection
    RuntimeVisibility = rtDeveloper
    DataSet = qyIntervencao
    Left = 317
    Top = 176
  end
  object qyCircuncisao: TIBQuery
    Database = DM.DB
    Transaction = DM.TS
    BeforeOpen = qyCircuncisaoBeforeOpen
    BufferChunks = 1000
    CachedUpdates = False
    DataSource = dsRelNotificacao
    SQL.Strings = (
      'select DT_CIRCUNCISAO from CIRCUNCISAO'
      'WHERE CD_FICHA = :FICHA'
      '')
    Left = 413
    Top = 177
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'FICHA'
        ParamType = ptUnknown
      end>
    object qyCircuncisaoDT_CIRCUNCISAO: TDateField
      FieldName = 'DT_CIRCUNCISAO'
      Origin = 'CIRCUNCISAO.DT_CIRCUNCISAO'
      Required = True
    end
  end
  object rvdsCircuncisao: TRvDataSetConnection
    RuntimeVisibility = rtDeveloper
    DataSet = qyCircuncisao
    Left = 381
    Top = 176
  end
  object dsLocNotificacao: TDataSource
    DataSet = qyLocalizarNotificacao
    Left = 666
    Top = 327
  end
end
