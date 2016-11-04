inherited frmCadGrupo: TfrmCadGrupo
  Left = 275
  Top = 150
  Caption = 'Grupo'
  ClientHeight = 388
  ClientWidth = 588
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited StatusBar1: TStatusBar
    Top = 369
    Width = 588
  end
  inherited Panel1: TPanel
    Width = 588
    inherited btPesquisar: TBitBtn
      OnClick = btPesquisarClick
    end
    inherited btfechar: TBitBtn
      Left = 538
    end
  end
  inherited Panel2: TPanel
    Width = 588
    Height = 317
    inherited pgGeral: TPageControl
      Width = 586
      Height = 315
      inherited tabLista: TTabSheet
        inherited Panel3: TPanel
          Width = 578
          Height = 287
          inherited grDados: TdxDBGrid
            Width = 576
            Height = 285
            Filter.Criteria = {00000000}
            object grDadosCD_GRUPO: TdxDBGridMaskColumn
              Caption = 'C'#243'digo'
              Color = clInfoBk
              BandIndex = 0
              RowIndex = 0
              FieldName = 'CD_GRUPO'
            end
            object grDadosDS_GRUPO: TdxDBGridMaskColumn
              Caption = 'Grupo'
              Color = clInfoBk
              BandIndex = 0
              RowIndex = 0
              FieldName = 'DS_GRUPO'
            end
          end
        end
      end
      inherited tabGeral: TTabSheet
        inherited Panel4: TPanel
          Width = 578
          Height = 287
          object Label1: TLabel
            Left = 16
            Top = 16
            Width = 33
            Height = 13
            Caption = 'C'#243'digo'
            FocusControl = DBEdit1
          end
          object Label2: TLabel
            Left = 114
            Top = 16
            Width = 29
            Height = 13
            Caption = 'Grupo'
            FocusControl = DBEdit2
          end
          object DBEdit1: TDBEdit
            Left = 16
            Top = 32
            Width = 97
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataField = 'CD_GRUPO'
            DataSource = dsControle
            ReadOnly = True
            TabOrder = 0
          end
          object DBEdit2: TDBEdit
            Left = 114
            Top = 32
            Width = 353
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
    DataSet = tbgrupo
  end
  inherited dsGrid: TDataSource
    AutoEdit = False
    DataSet = tbgrupo
  end
  object tbgrupo: TIBDataSet
    Database = DM.DB
    Transaction = DM.TS
    AfterDelete = tbgrupoAfterDelete
    AfterInsert = tbgrupoAfterInsert
    AfterPost = tbgrupoAfterPost
    BeforeDelete = tbgrupoBeforeDelete
    BufferChunks = 1000
    CachedUpdates = False
    DeleteSQL.Strings = (
      'delete from "GRUPO"'
      'where'
      '  "CD_GRUPO" = :"OLD_CD_GRUPO"')
    InsertSQL.Strings = (
      'insert into "GRUPO"'
      '('
      '  "CD_GRUPO"'
      ', "DS_GRUPO"'
      ', "CD_EMPRESA"'
      ', "CD_EMPRESA_ORIGEM"'
      ', "CD_EDI"'
      ', "NM_USUARIO"'
      ', "DT_CADASTRO"'
      ', "TP_EDI"'
      ')'
      'values'
      '('
      '  :"CD_GRUPO"'
      ', :"DS_GRUPO"'
      ', :"CD_EMPRESA"'
      ', :"CD_EMPRESA_ORIGEM"'
      ', :"CD_EDI"'
      ', :"NM_USUARIO"'
      ', :"DT_CADASTRO"'
      ', :"TP_EDI"'
      ')')
    SelectSQL.Strings = (
      'select "GRUPO"."CD_GRUPO"'
      '      ,"GRUPO"."DS_GRUPO"'
      '      ,"GRUPO"."CD_EMPRESA"'
      '      ,"GRUPO"."CD_EMPRESA_ORIGEM"'
      '      ,"GRUPO"."CD_EDI"'
      '      ,"GRUPO"."NM_USUARIO"'
      '      ,"GRUPO"."DT_CADASTRO"'
      '      ,"GRUPO"."TP_EDI"'
      'from "GRUPO"'
      'order by'
      '"GRUPO"."CD_GRUPO"')
    ModifySQL.Strings = (
      'update "GRUPO"'
      'set'
      ' "CD_GRUPO" = :"CD_GRUPO"'
      ', "DS_GRUPO" = :"DS_GRUPO"'
      ', "CD_EMPRESA" = :"CD_EMPRESA"'
      ', "CD_EMPRESA_ORIGEM" = :"CD_EMPRESA_ORIGEM"'
      ', "CD_EDI" = :"CD_EDI"'
      ', "NM_USUARIO" = :"NM_USUARIO"'
      ', "DT_CADASTRO" = :"DT_CADASTRO"'
      ', "TP_EDI" = :"TP_EDI"'
      'where'
      '  "CD_GRUPO" = :"OLD_CD_GRUPO"')
    GeneratorField.Field = 'CD_GRUPO'
    GeneratorField.Generator = 'GEN_GRUPO'
    GeneratorField.ApplyEvent = gamOnPost
    Left = 381
    Top = 197
    object tbgrupoCD_GRUPO: TIntegerField
      FieldName = 'CD_GRUPO'
      Origin = 'GRUPO.CD_GRUPO'
      Required = True
    end
    object tbgrupoDS_GRUPO: TIBStringField
      FieldName = 'DS_GRUPO'
      Origin = 'GRUPO.DS_GRUPO'
      Size = 50
    end
    object tbgrupoCD_EMPRESA: TIntegerField
      FieldName = 'CD_EMPRESA'
      Origin = 'GRUPO.CD_EMPRESA'
    end
  end
end
