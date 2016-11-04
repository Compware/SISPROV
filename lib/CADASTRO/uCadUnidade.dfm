inherited frmCadUnidade: TfrmCadUnidade
  Left = 316
  Top = 159
  Caption = 'Unidades'
  ClientWidth = 607
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited sbPadrao: TStatusBar
    Width = 607
  end
  inherited Panel1: TPanel
    Width = 607
    inherited btfechar: TBitBtn
      Left = 559
    end
  end
  inherited Panel2: TPanel
    Width = 607
    inherited pgGeral: TPageControl
      Width = 605
      inherited tabLista: TTabSheet
        inherited Panel3: TPanel
          Width = 597
          inherited grDados: TdxDBGrid
            Width = 595
            KeyField = 'CD_UNIDADE'
            Filter.Criteria = {00000000}
            object grDadosColumn1: TdxDBGridColumn
              Caption = 'Cd.Unidade'
              BandIndex = 0
              RowIndex = 0
              FieldName = 'CD_UNIDADE'
            end
            object grDadosColumn2: TdxDBGridColumn
              Width = 304
              BandIndex = 0
              RowIndex = 0
              FieldName = 'DS_UNIDADE'
            end
            object grDadosColumn3: TdxDBGridColumn
              Caption = 'Municipio'
              Sorted = csUp
              Visible = False
              Width = 285
              BandIndex = 0
              RowIndex = 0
              FieldName = 'DS_MUNICIPIO'
              GroupIndex = 1
            end
            object grDadosColumn4: TdxDBGridColumn
              Caption = 'Provincia'
              Sorted = csUp
              Visible = False
              Width = 285
              BandIndex = 0
              RowIndex = 0
              FieldName = 'DS_PROVINCIA'
              GroupIndex = 0
            end
            object grDadosColumn5: TdxDBGridColumn
              Caption = 'C'#243'd. Munic'#237'pio'
              Width = 78
              BandIndex = 0
              RowIndex = 0
              FieldName = 'CD_MUNICIPIO'
            end
            object grDadosColumn6: TdxDBGridColumn
              Caption = 'Vers'#227'o'
              Width = 89
              BandIndex = 0
              RowIndex = 0
              FieldName = 'VL_VERSAO'
            end
          end
        end
      end
      inherited tabGeral: TTabSheet
        inherited Panel4: TPanel
          Width = 597
          object Label1: TLabel
            Left = 121
            Top = 104
            Width = 86
            Height = 13
            Caption = 'Nome da Unidade'
          end
          object Label2: TLabel
            Left = 40
            Top = 104
            Width = 33
            Height = 13
            Caption = 'C'#243'digo'
          end
          object Label3: TLabel
            Left = 40
            Top = 25
            Width = 90
            Height = 13
            Caption = 'Nome da Provincia'
          end
          object Label4: TLabel
            Left = 40
            Top = 64
            Width = 91
            Height = 13
            Caption = 'Nome da Municipio'
          end
          object Label5: TLabel
            Left = 121
            Top = 152
            Width = 33
            Height = 13
            Caption = 'Vers'#227'o'
          end
          object DBEdit1: TDBEdit
            Left = 121
            Top = 120
            Width = 400
            Height = 21
            CharCase = ecUpperCase
            DataField = 'DS_UNIDADE'
            DataSource = dsControle
            TabOrder = 0
          end
          object edCodigo: TDBEdit
            Left = 40
            Top = 120
            Width = 80
            Height = 21
            TabStop = False
            Color = cl3DLight
            DataField = 'CD_UNIDADE'
            DataSource = dsControle
            ReadOnly = True
            TabOrder = 1
          end
          object btLocProvincia: TdxDBButtonEdit
            Left = 40
            Top = 39
            Width = 71
            Hint = '(F5) Localizar Pais'
            ParentShowHint = False
            ShowHint = True
            Style.ButtonStyle = bts3D
            TabOrder = 2
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
          object edProvincia: TdxDBEdit
            Left = 112
            Top = 39
            Width = 377
            Color = cl3DLight
            TabOrder = 3
            TabStop = False
            CharCase = ecUpperCase
            DataField = 'DS_PROVINCIA'
            DataSource = dsControle
            ReadOnly = True
            StoredValues = 64
          end
          object btLocMunicipio: TdxDBButtonEdit
            Left = 40
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
          object edMunicipio: TdxDBEdit
            Left = 112
            Top = 78
            Width = 377
            Color = cl3DLight
            TabOrder = 5
            TabStop = False
            CharCase = ecUpperCase
            DataField = 'DS_MUNICIPIO'
            DataSource = dsControle
            ReadOnly = True
            StoredValues = 64
          end
          object ckAtiva: TDBCheckBox
            Left = 40
            Top = 160
            Width = 65
            Height = 17
            Caption = 'Ativa'
            DataField = 'FL_ATIVA'
            DataSource = dsControle
            TabOrder = 6
            ValueChecked = 'S'
            ValueUnchecked = 'N'
          end
          object DBEdit2: TDBEdit
            Left = 121
            Top = 168
            Width = 136
            Height = 21
            CharCase = ecUpperCase
            DataField = 'VL_VERSAO'
            DataSource = dsControle
            TabOrder = 7
          end
        end
      end
      object tabServicos: TTabSheet
        Caption = 'Servi'#231'os'
        ImageIndex = 2
        object dxDBGrid1: TdxDBGrid
          Left = 0
          Top = 0
          Width = 522
          Height = 315
          Bands = <
            item
            end>
          DefaultLayout = True
          HeaderPanelRowCount = 1
          KeyField = 'CD_SERVICO'
          SummaryGroups = <>
          SummarySeparator = ', '
          Align = alClient
          BorderStyle = bsNone
          TabOrder = 0
          OnDblClick = grDadosDblClick
          DataSource = dsUnidadeServ
          Filter.Criteria = {00000000}
          OptionsBehavior = [edgoAutoSort, edgoDragScroll, edgoEditing, edgoEnterShowEditor, edgoImmediateEditor, edgoStoreToIniFile, edgoTabThrough, edgoVertThrough]
          OptionsDB = [edgoCanAppend, edgoCancelOnExit, edgoCanNavigation, edgoConfirmDelete, edgoUseBookmarks]
          object dxDBGrid1Column1: TdxDBGridColumn
            Caption = 'C'#243'digo'
            Color = cl3DLight
            DisableEditor = True
            BandIndex = 0
            RowIndex = 0
            FieldName = 'CD_SERVICO'
          end
          object dxDBGrid1Column2: TdxDBGridColumn
            Caption = 'Servi'#231'o'
            Color = cl3DLight
            DisableEditor = True
            Width = 254
            BandIndex = 0
            RowIndex = 0
            FieldName = 'DS_SERVICO'
          end
          object dxDBGrid1Column3: TdxDBGridDateColumn
            Caption = 'Inicio'
            BandIndex = 0
            RowIndex = 0
            FieldName = 'DT_INICIO'
          end
        end
        object Panel5: TPanel
          Left = 522
          Top = 0
          Width = 75
          Height = 315
          Align = alRight
          TabOrder = 1
          object btIncServico: TSpeedButton
            Left = 3
            Top = 3
            Width = 68
            Height = 22
            Hint = 'Incluir Servi'#231'o'
            Caption = 'Incluir'
            Enabled = False
            Glyph.Data = {
              76010000424D7601000000000000760000002800000020000000100000000100
              04000000000000010000130B0000130B00001000000000000000000000000000
              800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF0033333333B333
              333B33FF33337F3333F73BB3777BB7777BB3377FFFF77FFFF77333B000000000
              0B3333777777777777333330FFFFFFFF07333337F33333337F333330FFFFFFFF
              07333337F33333337F333330FFFFFFFF07333337F33333337F333330FFFFFFFF
              07333FF7F33333337FFFBBB0FFFFFFFF0BB37777F3333333777F3BB0FFFFFFFF
              0BBB3777F3333FFF77773330FFFF000003333337F333777773333330FFFF0FF0
              33333337F3337F37F3333330FFFF0F0B33333337F3337F77FF333330FFFF003B
              B3333337FFFF77377FF333B000000333BB33337777777F3377FF3BB3333BB333
              3BB33773333773333773B333333B3333333B7333333733333337}
            NumGlyphs = 2
            OnClick = btIncServicoClick
          end
          object btGravarServico: TSpeedButton
            Left = 3
            Top = 26
            Width = 68
            Height = 22
            Hint = 'Gravar Servi'#231'o'
            Caption = 'Gravar'
            Enabled = False
            Glyph.Data = {
              76010000424D7601000000000000760000002800000020000000100000000100
              04000000000000010000120B0000120B00001000000000000000000000000000
              800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
              333333FFFFFFFFFFFFF33000077777770033377777777777773F000007888888
              00037F3337F3FF37F37F00000780088800037F3337F77F37F37F000007800888
              00037F3337F77FF7F37F00000788888800037F3337777777337F000000000000
              00037F3FFFFFFFFFFF7F00000000000000037F77777777777F7F000FFFFFFFFF
              00037F7F333333337F7F000FFFFFFFFF00037F7F333333337F7F000FFFFFFFFF
              00037F7F333333337F7F000FFFFFFFFF00037F7F333333337F7F000FFFFFFFFF
              00037F7F333333337F7F000FFFFFFFFF07037F7F33333333777F000FFFFFFFFF
              0003737FFFFFFFFF7F7330099999999900333777777777777733}
            NumGlyphs = 2
            OnClick = btGravarServicoClick
          end
          object btExcluirServico: TSpeedButton
            Left = 3
            Top = 51
            Width = 68
            Height = 22
            Hint = 'Excluir Servi'#231'o'
            Caption = 'Excluir'
            Enabled = False
            Glyph.Data = {
              76010000424D7601000000000000760000002800000020000000100000000100
              04000000000000010000130B0000130B00001000000000000000000000000000
              800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
              333333333333333333333333333333333333333FFF33FF333FFF339993370733
              999333777FF37FF377733339993000399933333777F777F77733333399970799
              93333333777F7377733333333999399933333333377737773333333333990993
              3333333333737F73333333333331013333333333333777FF3333333333910193
              333333333337773FF3333333399000993333333337377737FF33333399900099
              93333333773777377FF333399930003999333337773777F777FF339993370733
              9993337773337333777333333333333333333333333333333333333333333333
              3333333333333333333333333333333333333333333333333333}
            NumGlyphs = 2
            OnClick = btExcluirServicoClick
          end
        end
      end
    end
  end
  inherited dsControle: TDataSource
    DataSet = DMGERAL.TB_UNIDADE
  end
  inherited dsGrid: TDataSource
    DataSet = DMGERAL.TB_UNIDADE
  end
  object dsUnidadeServ: TDataSource
    DataSet = DMGERAL.TB_UNIDADE_SERVICOS
    Left = 397
    Top = 197
  end
end
