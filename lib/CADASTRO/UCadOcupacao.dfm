inherited frmCadOcupacao: TfrmCadOcupacao
  Left = 367
  Top = 188
  Caption = 'Ocupa'#231#227'o'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel2: TPanel
    inherited pgGeral: TPageControl
      ActivePage = tabGeral
      inherited tabLista: TTabSheet
        inherited Panel3: TPanel
          inherited grDados: TdxDBGrid
            KeyField = 'CD_OCUPACAO'
            Filter.AutoDataSetFilter = True
            Filter.Criteria = {00000000}
            object grDadosCD_OCUPACAO: TdxDBGridMaskColumn
              Caption = 'C'#243'digo'
              BandIndex = 0
              RowIndex = 0
              FieldName = 'CD_OCUPACAO'
            end
            object grDadosDS_OCUPACAO: TdxDBGridMaskColumn
              Caption = 'Ocupa'#231#227'o'
              BandIndex = 0
              RowIndex = 0
              FieldName = 'DS_OCUPACAO'
            end
          end
        end
      end
      inherited tabGeral: TTabSheet
        inherited Panel4: TPanel
          object Label1: TLabel
            Left = 109
            Top = 16
            Width = 96
            Height = 13
            Caption = 'Nome da Ocupa'#231#227'o'
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
            DataField = 'DS_OCUPACAO'
            DataSource = dsControle
            TabOrder = 0
          end
          object edCodigo: TDBEdit
            Left = 32
            Top = 32
            Width = 76
            Height = 21
            DataField = 'CD_OCUPACAO'
            DataSource = dsControle
            TabOrder = 1
          end
        end
      end
    end
  end
  inherited dsControle: TDataSource
    DataSet = DMGERAL.TB_OCUPACAO
  end
  inherited dsGrid: TDataSource
    DataSet = DMGERAL.TB_OCUPACAO
  end
end
