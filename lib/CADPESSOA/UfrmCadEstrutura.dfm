inherited frmCadEstrutura: TfrmCadEstrutura
  Left = 51
  Top = 56
  Caption = 'Estrutura de Produtos'
  ClientHeight = 583
  ClientWidth = 854
  PixelsPerInch = 96
  TextHeight = 13
  inherited StatusBar1: TStatusBar
    Top = 564
    Width = 854
  end
  inherited Panel1: TPanel
    Width = 854
    inherited btfechar: TBitBtn
      Left = 806
    end
  end
  inherited Panel2: TPanel
    Width = 854
    Height = 512
    inherited pgGeral: TPageControl
      Width = 852
      Height = 510
      OnChange = pgGeralChange
      inherited tabLista: TTabSheet
        inherited Panel3: TPanel
          Width = 844
          Height = 482
          inherited grDados: TdxDBGrid
            Width = 842
            Height = 480
            Filter.Criteria = {00000000}
            object grDadosCD_PRODUTO: TdxDBGridMaskColumn
              Caption = 'C'#243'digo'
              Width = 57
              BandIndex = 0
              RowIndex = 0
              FieldName = 'CD_PRODUTO'
            end
            object grDadosDS_PRODUTO: TdxDBGridMaskColumn
              Caption = 'Descri'#231#227'o'
              Width = 325
              BandIndex = 0
              RowIndex = 0
              FieldName = 'DS_PRODUTO'
            end
          end
        end
      end
      inherited tabGeral: TTabSheet
        OnEnter = tabGeralEnter
        inherited Panel4: TPanel
          Width = 844
          Height = 482
          object Label1: TLabel
            Left = 481
            Top = 57
            Width = 43
            Height = 13
            Caption = 'Unidade:'
          end
          object Label2: TLabel
            Left = 481
            Top = 113
            Width = 40
            Height = 13
            Caption = 'Produto:'
          end
          object Label3: TLabel
            Left = 481
            Top = 161
            Width = 26
            Height = 13
            Caption = 'Qtde:'
          end
          object Label4: TLabel
            Left = 531
            Top = 161
            Width = 29
            Height = 13
            Caption = 'N'#237'vel:'
          end
          object btIns: TSpeedButton
            Left = 442
            Top = 43
            Width = 23
            Height = 22
            Glyph.Data = {
              76010000424D7601000000000000760000002800000020000000100000000100
              04000000000000010000130B0000130B00001000000000000000000000000000
              800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
              33333333FF33333333FF333993333333300033377F3333333777333993333333
              300033F77FFF3333377739999993333333333777777F3333333F399999933333
              33003777777333333377333993333333330033377F3333333377333993333333
              3333333773333333333F333333333333330033333333F33333773333333C3333
              330033333337FF3333773333333CC333333333FFFFF77FFF3FF33CCCCCCCCCC3
              993337777777777F77F33CCCCCCCCCC3993337777777777377333333333CC333
              333333333337733333FF3333333C333330003333333733333777333333333333
              3000333333333333377733333333333333333333333333333333}
            NumGlyphs = 2
            OnClick = btInsClick
          end
          object btDel: TSpeedButton
            Left = 442
            Top = 67
            Width = 23
            Height = 22
            Glyph.Data = {
              76010000424D7601000000000000760000002800000020000000100000000100
              04000000000000010000130B0000130B00001000000000000000000000000000
              800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
              333333333333333333FF33333333333330003333333333333777333333333333
              300033FFFFFF3333377739999993333333333777777F3333333F399999933333
              3300377777733333337733333333333333003333333333333377333333333333
              3333333333333333333F333333333333330033333F33333333773333C3333333
              330033337F3333333377333CC3333333333333F77FFFFFFF3FF33CCCCCCCCCC3
              993337777777777F77F33CCCCCCCCCC399333777777777737733333CC3333333
              333333377F33333333FF3333C333333330003333733333333777333333333333
              3000333333333333377733333333333333333333333333333333}
            NumGlyphs = 2
            OnClick = btDelClick
          end
          object tvEstrutura: TTreeView
            Left = 1
            Top = 42
            Width = 440
            Height = 439
            Align = alLeft
            Indent = 19
            TabOrder = 0
            OnChanging = tvEstruturaChanging
            OnClick = tvEstruturaClick
          end
          object Panel5: TPanel
            Left = 1
            Top = 1
            Width = 842
            Height = 41
            Align = alTop
            TabOrder = 1
            object DBEdit1: TDBEdit
              Left = 104
              Top = 8
              Width = 337
              Height = 21
              Color = clInfoBk
              DataField = 'DS_PRODUTO'
              DataSource = dsGrid
              ReadOnly = True
              TabOrder = 0
            end
            object DBEdit2: TDBEdit
              Left = 8
              Top = 8
              Width = 93
              Height = 21
              Color = clInfoBk
              DataField = 'CD_PRODUTO'
              DataSource = dsGrid
              ReadOnly = True
              TabOrder = 1
            end
          end
          object DBEdit3: TDBEdit
            Left = 480
            Top = 72
            Width = 49
            Height = 21
            DataField = 'CD_UNIDADE'
            DataSource = dsControle
            TabOrder = 2
          end
          object DBEdit4: TDBEdit
            Left = 528
            Top = 72
            Width = 49
            Height = 21
            Color = clInfoBk
            DataField = 'SG_UNIDADE'
            DataSource = dsControle
            ReadOnly = True
            TabOrder = 3
          end
          object DBEdit5: TDBEdit
            Left = 480
            Top = 128
            Width = 49
            Height = 21
            DataField = 'CD_PRODUTO'
            DataSource = dsControle
            TabOrder = 4
          end
          object DBEdit6: TDBEdit
            Left = 528
            Top = 128
            Width = 273
            Height = 21
            Color = clInfoBk
            DataField = 'DS_PRODUTO'
            DataSource = dsControle
            ReadOnly = True
            TabOrder = 5
          end
          object DBEdit7: TDBEdit
            Left = 480
            Top = 176
            Width = 49
            Height = 21
            DataField = 'QT_PRODUTO'
            DataSource = dsControle
            TabOrder = 6
          end
          object DBEdit8: TDBEdit
            Left = 528
            Top = 176
            Width = 49
            Height = 21
            Color = clInfoBk
            DataField = 'NR_NIVEL'
            DataSource = dsControle
            ReadOnly = True
            TabOrder = 7
          end
        end
      end
    end
  end
  inherited dsControle: TDataSource
    DataSet = dmProducao.TB_ESTRUTURA
  end
  inherited dsGrid: TDataSource
    DataSet = dmProducao.qyEstrutura
  end
end
