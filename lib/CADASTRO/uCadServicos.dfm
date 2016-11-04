inherited frmCadServicos: TfrmCadServicos
  Left = 361
  Top = 148
  Caption = 'Cadastro de Servi'#231'os'
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
              Caption = 'C'#243'digo'
              Width = 66
              BandIndex = 0
              RowIndex = 0
              FieldName = 'CD_SERVICO'
            end
            object grDadosColumn2: TdxDBGridColumn
              Caption = 'Desri'#231#227'o'
              Width = 301
              BandIndex = 0
              RowIndex = 0
              FieldName = 'DS_SERVICO'
            end
          end
        end
      end
      inherited tabGeral: TTabSheet
        inherited Panel4: TPanel
          Height = 315
          object Label1: TLabel
            Left = 32
            Top = 16
            Width = 36
            Height = 13
            Caption = 'C'#243'digo:'
          end
          object Label2: TLabel
            Left = 18
            Top = 43
            Width = 51
            Height = 13
            Caption = 'Descri'#231#227'o:'
          end
          object DBEdit1: TDBEdit
            Left = 72
            Top = 16
            Width = 49
            Height = 21
            DataField = 'CD_SERVICO'
            DataSource = dsControle
            TabOrder = 0
          end
          object DBEdit2: TDBEdit
            Left = 72
            Top = 40
            Width = 345
            Height = 21
            DataField = 'DS_SERVICO'
            DataSource = dsControle
            TabOrder = 1
          end
        end
      end
    end
  end
  inherited dsControle: TDataSource
    DataSet = DMGERAL.TB_SERVICOS
  end
  inherited dsGrid: TDataSource
    DataSet = DMGERAL.TB_SERVICOS
  end
end
