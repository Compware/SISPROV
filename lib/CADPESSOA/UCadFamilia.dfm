inherited frmCadFamilia: TfrmCadFamilia
  Left = 337
  Top = 171
  Caption = 'Fam'#237'lia'
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
            object grDadosCD_FAMILIA: TdxDBGridMaskColumn
              Caption = 'C'#243'digo'
              Color = clInfoBk
              BandIndex = 0
              RowIndex = 0
              FieldName = 'CD_FAMILIA'
            end
            object grDadosDS_FAMILIA: TdxDBGridMaskColumn
              Caption = 'Fam'#237'lia'
              Color = clInfoBk
              BandIndex = 0
              RowIndex = 0
              FieldName = 'DS_FAMILIA'
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
            Width = 34
            Height = 13
            Caption = 'Fam'#237'lia'
            FocusControl = DBEdit2
          end
          object DBEdit1: TDBEdit
            Left = 16
            Top = 32
            Width = 97
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataField = 'CD_FAMILIA'
            DataSource = dsControle
            ReadOnly = True
            TabOrder = 0
          end
          object DBEdit2: TDBEdit
            Left = 114
            Top = 32
            Width = 353
            Height = 21
            DataField = 'DS_FAMILIA'
            DataSource = dsControle
            TabOrder = 1
          end
        end
      end
    end
  end
  inherited dsControle: TDataSource
    DataSet = tbfamilia
  end
  inherited dsGrid: TDataSource
    AutoEdit = False
    DataSet = tbfamilia
  end
  object tbfamilia: TIBDataSet
    Database = DM.DB
    Transaction = DM.TS
    AfterDelete = tbfamiliaAfterDelete
    AfterInsert = tbfamiliaAfterInsert
    AfterPost = tbfamiliaAfterPost
    BeforeDelete = tbfamiliaBeforeDelete
    BufferChunks = 1000
    CachedUpdates = False
    DeleteSQL.Strings = (
      'delete from "FAMILIA"'
      'where'
      '  "CD_FAMILIA" = :"OLD_CD_FAMILIA"')
    InsertSQL.Strings = (
      'insert into "FAMILIA"'
      '('
      '  "CD_FAMILIA"'
      ', "DS_FAMILIA"'
      ', "CD_EMPRESA"'
      ', "CD_EMPRESA_ORIGEM"'
      ', "CD_EDI"'
      ', "NM_USUARIO"'
      ', "DT_CADASTRO"'
      ', "TP_EDI"'
      ')'
      'values'
      '('
      '  :"CD_FAMILIA"'
      ', :"DS_FAMILIA"'
      ', :"CD_EMPRESA"'
      ', :"CD_EMPRESA_ORIGEM"'
      ', :"CD_EDI"'
      ', :"NM_USUARIO"'
      ', :"DT_CADASTRO"'
      ', :"TP_EDI"'
      ')')
    SelectSQL.Strings = (
      'select "FAMILIA"."CD_FAMILIA"'
      '      ,"FAMILIA"."DS_FAMILIA"'
      '      ,"FAMILIA"."CD_EMPRESA"'
      '      ,"FAMILIA"."CD_EMPRESA_ORIGEM"'
      '      ,"FAMILIA"."CD_EDI"'
      '      ,"FAMILIA"."NM_USUARIO"'
      '      ,"FAMILIA"."DT_CADASTRO"'
      '      ,"FAMILIA"."TP_EDI"'
      'from "FAMILIA"'
      'order by'
      '"FAMILIA"."CD_FAMILIA"')
    ModifySQL.Strings = (
      'update "FAMILIA"'
      'set'
      ' "CD_FAMILIA" = :"CD_FAMILIA"'
      ', "DS_FAMILIA" = :"DS_FAMILIA"'
      ', "CD_EMPRESA" = :"CD_EMPRESA"'
      ', "CD_EMPRESA_ORIGEM" = :"CD_EMPRESA_ORIGEM"'
      ', "CD_EDI" = :"CD_EDI"'
      ', "NM_USUARIO" = :"NM_USUARIO"'
      ', "DT_CADASTRO" = :"DT_CADASTRO"'
      ', "TP_EDI" = :"TP_EDI"'
      'where'
      '  "CD_FAMILIA" = :"OLD_CD_FAMILIA"')
    GeneratorField.Field = 'CD_FAMILIA'
    GeneratorField.Generator = 'GEN_FAMILIA'
    GeneratorField.ApplyEvent = gamOnPost
    Left = 381
    Top = 189
    object tbfamiliaCD_FAMILIA: TIntegerField
      FieldName = 'CD_FAMILIA'
      Origin = 'FAMILIA.CD_FAMILIA'
      Required = True
    end
    object tbfamiliaDS_FAMILIA: TIBStringField
      FieldName = 'DS_FAMILIA'
      Origin = 'FAMILIA.DS_FAMILIA'
      Size = 50
    end
    object tbfamiliaCD_EMPRESA: TIntegerField
      FieldName = 'CD_EMPRESA'
      Origin = 'FAMILIA.CD_EMPRESA'
    end
  end
end
