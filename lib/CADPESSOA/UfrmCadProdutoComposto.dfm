inherited frmCadProdutoComposto: TfrmCadProdutoComposto
  Left = 161
  Top = 170
  Caption = 'Produto Composto'
  ClientHeight = 342
  ClientWidth = 617
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited StatusBar1: TStatusBar
    Top = 323
    Width = 617
  end
  inherited Panel1: TPanel
    Width = 617
    inherited btfechar: TBitBtn
      Left = 569
    end
  end
  inherited Panel2: TPanel
    Width = 617
    Height = 271
    inherited pgGeral: TPageControl
      Width = 615
      Height = 269
      inherited tabLista: TTabSheet
        inherited Panel3: TPanel
          Width = 607
          Height = 241
          inherited grDados: TdxDBGrid
            Width = 605
            Height = 239
            KeyField = 'CD_COMPOSTO'
            ShowGroupPanel = True
            Filter.Criteria = {00000000}
            GroupPanelColor = clTeal
            object grDadosCD_COMPOSTO: TdxDBGridMaskColumn
              Caption = 'C'#243'digo'
              Width = 41
              BandIndex = 0
              RowIndex = 0
              FieldName = 'CD_COMPOSTO'
            end
            object grDadosCD_PRODUTO: TdxDBGridMaskColumn
              Caption = 'Produto'
              Width = 64
              BandIndex = 0
              RowIndex = 0
              FieldName = 'CD_PRODUTO'
            end
            object grDadosDS_COMPOSTO: TdxDBGridMaskColumn
              Caption = 'Descri'#231#227'o'
              Width = 294
              BandIndex = 0
              RowIndex = 0
              FieldName = 'DS_COMPOSTO'
            end
            object grDadosQT_QTDE: TdxDBGridMaskColumn
              Caption = 'Qtde'
              Width = 64
              BandIndex = 0
              RowIndex = 0
              FieldName = 'QT_QTDE'
            end
            object grDadosDT_CADASTRO: TdxDBGridDateColumn
              Caption = 'Data'
              Width = 55
              BandIndex = 0
              RowIndex = 0
              FieldName = 'DT_CADASTRO'
            end
            object grDadosCD_EMPRESA: TdxDBGridMaskColumn
              Caption = 'Empresa'
              Visible = False
              Width = 39
              BandIndex = 0
              RowIndex = 0
              FieldName = 'CD_EMPRESA'
            end
            object grDadosCD_PEDIDO: TdxDBGridColumn
              Caption = 'Pedido'
              Width = 64
              BandIndex = 0
              RowIndex = 0
              FieldName = 'CD_PEDIDO'
            end
          end
        end
      end
      inherited tabGeral: TTabSheet
        inherited Panel4: TPanel
          Width = 607
          Height = 241
          object Label1: TLabel
            Left = 12
            Top = 7
            Width = 33
            Height = 13
            Caption = 'C'#243'digo'
            FocusControl = edCodigo
          end
          object Label3: TLabel
            Left = 12
            Top = 49
            Width = 80
            Height = 13
            Caption = 'Produto Principal'
          end
          object Label4: TLabel
            Left = 411
            Top = 7
            Width = 100
            Height = 16
            Caption = 'Data de Emiss'#227'o'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
          end
          object Label5: TLabel
            Left = 410
            Top = 47
            Width = 23
            Height = 13
            Caption = 'Qtde'
            FocusControl = DBEdit2
          end
          object Label2: TLabel
            Left = 68
            Top = 7
            Width = 33
            Height = 13
            Caption = 'Pedido'
            FocusControl = DBEdit1
          end
          object edCodigo: TDBEdit
            Left = 12
            Top = 23
            Width = 53
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataField = 'CD_COMPOSTO'
            DataSource = dsControle
            ReadOnly = True
            TabOrder = 0
          end
          object edNome: TDBEdit
            Left = 61
            Top = 63
            Width = 348
            Height = 21
            Color = clInfoBk
            DataField = 'DS_COMPOSTO'
            DataSource = dsControle
            ReadOnly = True
            TabOrder = 3
          end
          object dxDBDateEdit1: TdxDBDateEdit
            Left = 411
            Top = 23
            Width = 113
            Color = clInfoBk
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            Style.BorderColor = clBlue
            TabOrder = 1
            DataField = 'DT_CADASTRO'
            DataSource = dsControle
            ReadOnly = True
            ButtonGlyph.Data = {
              36050000424D3605000000000000360400002800000010000000100000000100
              0800000000000001000000000000000000000001000000000000734040008450
              50008F60580000006A006A6A6A00A173730023388400234098003150AB004058
              B600B6B6B600486AC000F4E0C000F4EAD400FFF4E000FFFFEA00FF00FF00FFFF
              FF00000000000000000000000000000000000000000000000000000000000000
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
              0000000000000000000000000000000000000000000000000000101010070606
              0606060606060607101010100805000000000000000000000710101008050D0D
              0D0D0D0D0D0D0D000610101008050D040404040404040D000610101008050D0C
              0C0C0C0C0C0C0D000610101008050D040404040404040D000610101008050D0D
              0D0D0D0D0D0D0D010610101008050E0E030D0A03030A0E010610101009050F0F
              030F030F0F030F010610101009050F0F030F0F0F0F030F020610101009050F0F
              030F0303030A0F02061010100B0511030311031111111105061010100B051111
              0311030303031105061010100B0511111111111111111105061010100B050505
              050505050505050507101010100B090808080808080808081010}
            StoredValues = 64
          end
          object DBEdit2: TDBEdit
            Left = 408
            Top = 63
            Width = 115
            Height = 21
            DataField = 'QT_QTDE'
            DataSource = dsControle
            TabOrder = 4
          end
          object edProduto: TdxDBButtonEdit
            Left = 12
            Top = 63
            Width = 46
            Hint = '(F5) Localizar Produto'
            ParentShowHint = False
            ShowHint = True
            Style.ButtonStyle = bts3D
            TabOrder = 2
            DataField = 'CD_PRODUTO'
            DataSource = dsControle
            ReadOnly = False
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
            OnButtonClick = edProdutoButtonClick
            StoredValues = 64
            ExistButtons = True
          end
          object DBEdit1: TDBEdit
            Left = 68
            Top = 23
            Width = 53
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataField = 'CD_PEDIDO'
            DataSource = dsControle
            ReadOnly = True
            TabOrder = 5
          end
        end
      end
    end
  end
  inherited dsControle: TDataSource
    DataSet = dmProducao.TB_COMPOSTO
    Left = 173
    Top = 189
  end
  inherited dsGrid: TDataSource
    AutoEdit = False
    DataSet = dmProducao.TB_COMPOSTO
    Left = 141
    Top = 189
  end
end
