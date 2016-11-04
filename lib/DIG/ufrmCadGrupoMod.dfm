inherited frmCadGrupoMod: TfrmCadGrupoMod
  Left = 127
  Caption = 'Cadastro Grupo Modelo'
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel2: TPanel
    inherited pgGeral: TPageControl
      inherited tabLista: TTabSheet
        inherited Panel3: TPanel
          inherited grDados: TdxDBGrid
            Filter.Criteria = {00000000}
            object grDadosColumn1: TdxDBGridColumn
              Caption = 'C'#243'digo'
              BandIndex = 0
              RowIndex = 0
              FieldName = 'CD_GRUPO'
            end
            object grDadosColumn2: TdxDBGridColumn
              Caption = 'Descri'#231#227'o'
              BandIndex = 0
              RowIndex = 0
              FieldName = 'DS_GRUPO'
            end
          end
        end
      end
      inherited tabGeral: TTabSheet
        inherited Panel4: TPanel
          object Label1: TLabel
            Left = 44
            Top = 28
            Width = 33
            Height = 13
            Caption = 'C'#243'digo'
          end
          object Label2: TLabel
            Left = 28
            Top = 60
            Width = 48
            Height = 13
            Caption = 'Descri'#231#227'o'
          end
          object DBEdit1: TDBEdit
            Left = 80
            Top = 24
            Width = 121
            Height = 21
            DataField = 'CD_GRUPO'
            DataSource = dsControle
            TabOrder = 0
          end
          object DBEdit2: TDBEdit
            Left = 80
            Top = 56
            Width = 289
            Height = 21
            DataField = 'DS_GRUPO'
            DataSource = dsControle
            TabOrder = 1
          end
        end
      end
    end
  end
  inherited dsControle: TDataSource
    DataSet = dmDIG.tbDig_GrupoMod
  end
  inherited dsGrid: TDataSource
    DataSet = dmDIG.tbDig_GrupoMod
  end
end
