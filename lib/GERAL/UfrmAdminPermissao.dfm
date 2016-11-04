object frmAdminPermissao: TfrmAdminPermissao
  Left = 385
  Top = 179
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Cadastro (Modulo / Permins'#227'o) Administrador'
  ClientHeight = 439
  ClientWidth = 689
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 689
    Height = 49
    Align = alTop
    BevelInner = bvLowered
    TabOrder = 0
    object DBNavigator1: TDBNavigator
      Left = 4
      Top = 4
      Width = 340
      Height = 41
      DataSource = Permissao
      Flat = True
      TabOrder = 0
    end
    object Button1: TButton
      Left = 635
      Top = 3
      Width = 50
      Height = 42
      Caption = 'Sair'
      TabOrder = 1
      OnClick = Button1Click
    end
  end
  object Panel2: TPanel
    Left = 177
    Top = 49
    Width = 512
    Height = 390
    Align = alRight
    BevelInner = bvLowered
    TabOrder = 1
    object DBGrid1: TDBGrid
      Left = 2
      Top = 2
      Width = 508
      Height = 386
      Align = alClient
      BorderStyle = bsNone
      Color = 16776176
      DataSource = Permissao
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'CD_PERMISSAO'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DS_MODULO'
          Width = 64
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DS_PERMISSAO'
          Width = 64
          Visible = True
        end>
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 49
    Width = 177
    Height = 390
    Align = alClient
    BevelInner = bvLowered
    TabOrder = 2
    object DBLookupListBox1: TDBLookupListBox
      Left = 2
      Top = 2
      Width = 171
      Height = 381
      Align = alLeft
      Color = clInfoBk
      KeyField = 'DS_MODULO'
      ListField = 'DS_MODULO'
      ListSource = Modulos
      TabOrder = 0
    end
  end
  object Permissao: TDataSource
    DataSet = tbpermissao
    Left = 423
    Top = 121
  end
  object Modulos: TDataSource
    DataSet = qymodulo
    Left = 423
    Top = 161
  end
  object tbpermissao: TIBTable
    Database = DM.DB
    Transaction = DM.TS
    AfterDelete = tbpermissaoAfterDelete
    AfterInsert = tbpermissaoAfterInsert
    AfterPost = tbpermissaoAfterPost
    BufferChunks = 1000
    CachedUpdates = False
    FieldDefs = <
      item
        Name = 'CD_PERMISSAO'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'CD_UND'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'DS_MODULO'
        Attributes = [faRequired]
        DataType = ftString
        Size = 15
      end
      item
        Name = 'DS_PERMISSAO'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'DT_EXP'
        DataType = ftDateTime
      end
      item
        Name = 'CD_EDI'
        DataType = ftInteger
      end>
    IndexDefs = <
      item
        Name = 'PERMISSAO_PK'
        Fields = 'CD_PERMISSAO;DS_MODULO;CD_UND'
        Options = [ixUnique]
      end
      item
        Name = 'PERMISSAO_EXP_IX'
        Fields = 'DT_EXP'
      end>
    StoreDefs = True
    TableName = 'PERMISSAO'
    Left = 391
    Top = 121
    object tbpermissaoCD_PERMISSAO: TIntegerField
      FieldName = 'CD_PERMISSAO'
      Required = True
    end
    object tbpermissaoCD_UND: TIntegerField
      FieldName = 'CD_UND'
      Required = True
    end
    object tbpermissaoDS_MODULO: TIBStringField
      FieldName = 'DS_MODULO'
      Required = True
      Size = 15
    end
    object tbpermissaoDS_PERMISSAO: TIBStringField
      FieldName = 'DS_PERMISSAO'
      Size = 100
    end
    object tbpermissaoDT_EXP: TDateTimeField
      FieldName = 'DT_EXP'
    end
    object tbpermissaoCD_EDI: TIntegerField
      FieldName = 'CD_EDI'
    end
  end
  object qymodulo: TIBQuery
    Database = DM.DB
    Transaction = DM.TS
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select distinct ds_modulo from permissao')
    Left = 391
    Top = 161
  end
end
