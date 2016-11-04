inherited frmCadLocal: TfrmCadLocal
  Left = 245
  Top = 138
  Caption = 'Cadastro de Local'
  ClientHeight = 388
  ClientWidth = 501
  PixelsPerInch = 96
  TextHeight = 13
  inherited StatusBar1: TStatusBar
    Top = 369
    Width = 501
  end
  inherited Panel1: TPanel
    Width = 501
    inherited btfechar: TBitBtn
      Left = 453
    end
  end
  inherited Panel2: TPanel
    Width = 501
    Height = 317
    inherited pgGeral: TPageControl
      Width = 499
      Height = 315
      inherited tabLista: TTabSheet
        inherited Panel3: TPanel
          Width = 491
          Height = 287
          inherited grDados: TdxDBGrid
            Width = 489
            Height = 285
            Filter.Criteria = {00000000}
            object grDadosCD_LOCAL: TdxDBGridColumn
              Caption = 'C'#243'digo'
              Width = 64
              BandIndex = 0
              RowIndex = 0
              FieldName = 'CD_LOCAL'
            end
            object grDadosNM_LOCAL: TdxDBGridColumn
              Caption = 'Local'
              Width = 263
              BandIndex = 0
              RowIndex = 0
              FieldName = 'NM_LOCAL'
            end
          end
        end
      end
      inherited tabGeral: TTabSheet
        inherited Panel4: TPanel
          Width = 491
          Height = 287
          object Label1: TLabel
            Left = 12
            Top = 11
            Width = 33
            Height = 13
            Caption = 'C'#243'digo'
            FocusControl = DBEdit1
          end
          object Label2: TLabel
            Left = 83
            Top = 11
            Width = 26
            Height = 13
            Caption = 'Local'
          end
          object DBEdit1: TDBEdit
            Left = 12
            Top = 27
            Width = 69
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataField = 'CD_LOCAL'
            DataSource = dsControle
            ReadOnly = True
            TabOrder = 0
          end
          object DBEdit2: TDBEdit
            Left = 83
            Top = 27
            Width = 294
            Height = 21
            DataField = 'NM_LOCAL'
            DataSource = dsControle
            TabOrder = 1
          end
        end
      end
    end
  end
  inherited dsControle: TDataSource
    DataSet = DMGERAL.TB_LOCAL
  end
  inherited dsGrid: TDataSource
    DataSet = DMGERAL.TB_LOCAL
  end
end
