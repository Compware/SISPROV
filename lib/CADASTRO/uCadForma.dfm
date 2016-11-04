inherited frmCadForma: TfrmCadForma
  Left = 175
  Top = 194
  Caption = 'Cadastro de Forma'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel2: TPanel
    inherited pgGeral: TPageControl
      inherited tabLista: TTabSheet
        inherited Panel3: TPanel
          inherited grDados: TdxDBGrid
            Filter.Criteria = {00000000}
            object gcCD_FORMA: TdxDBGridColumn
              Caption = 'C'#243'digo'
              BandIndex = 0
              RowIndex = 0
              FieldName = 'CD_FORMA'
            end
            object gcDS_FORMA: TdxDBGridColumn
              Caption = 'Descri'#231#227'o'
              BandIndex = 0
              RowIndex = 0
              FieldName = 'DS_FORMA'
            end
          end
        end
      end
      inherited tabGeral: TTabSheet
        inherited Panel4: TPanel
          object Label1: TLabel
            Left = 41
            Top = 35
            Width = 36
            Height = 13
            Caption = 'C'#243'digo:'
          end
          object Label2: TLabel
            Left = 27
            Top = 59
            Width = 51
            Height = 13
            Caption = 'Descri'#231#227'o:'
          end
          object DBEdit1: TDBEdit
            Left = 80
            Top = 32
            Width = 121
            Height = 21
            Color = clScrollBar
            DataField = 'CD_FORMA'
            DataSource = dsControle
            ReadOnly = True
            TabOrder = 0
          end
          object DBEdit2: TDBEdit
            Left = 80
            Top = 56
            Width = 417
            Height = 21
            DataField = 'DS_FORMA'
            DataSource = dsControle
            TabOrder = 1
          end
        end
      end
    end
  end
  inherited dsControle: TDataSource
    DataSet = DMGERAL.TB_FORMA
  end
  inherited dsGrid: TDataSource
    DataSet = DMGERAL.TB_FORMA
  end
end
