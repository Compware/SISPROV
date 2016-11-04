inherited frmCadPais: TfrmCadPais
  Left = 301
  Top = 192
  Caption = 'Pais'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel2: TPanel
    inherited pgGeral: TPageControl
      ActivePage = tabGeral
      inherited tabLista: TTabSheet
        inherited Panel3: TPanel
          inherited grDados: TdxDBGrid
            Filter.Criteria = {00000000}
            object grDadosColumn1: TdxDBGridColumn
              BandIndex = 0
              RowIndex = 0
              FieldName = 'CD_PAIS'
            end
            object grDadosColumn2: TdxDBGridColumn
              BandIndex = 0
              RowIndex = 0
              FieldName = 'DS_PAIS'
            end
          end
        end
      end
      inherited tabGeral: TTabSheet
        inherited Panel4: TPanel
          object Label1: TLabel
            Left = 109
            Top = 16
            Width = 66
            Height = 13
            Caption = 'Nome do Pais'
          end
          object Label2: TLabel
            Left = 32
            Top = 16
            Width = 33
            Height = 13
            Caption = 'C'#243'digo'
          end
          object DBEdit1: TDBEdit
            Left = 109
            Top = 32
            Width = 400
            Height = 21
            CharCase = ecUpperCase
            DataField = 'DS_PAIS'
            DataSource = dsControle
            TabOrder = 0
          end
          object DBEdit2: TDBEdit
            Left = 32
            Top = 32
            Width = 76
            Height = 21
            TabStop = False
            Color = cl3DLight
            DataField = 'CD_PAIS'
            DataSource = dsControle
            ReadOnly = True
            TabOrder = 1
          end
        end
      end
    end
  end
  inherited dsControle: TDataSource
    DataSet = DMGERAL.TB_PAIS
  end
  inherited dsGrid: TDataSource
    DataSet = DMGERAL.TB_PAIS
  end
end
