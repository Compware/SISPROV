object frmProtocoloEnvio: TfrmProtocoloEnvio
  Left = 46
  Top = 97
  Width = 952
  Height = 514
  Caption = 'Protocolo Envio'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object grDados: TdxDBGrid
    Left = 0
    Top = 0
    Width = 944
    Height = 480
    Bands = <
      item
      end>
    DefaultLayout = True
    HeaderPanelRowCount = 1
    KeyField = 'CD_PROTOCOLO'
    ShowGroupPanel = True
    SummaryGroups = <>
    SummarySeparator = ', '
    Align = alClient
    BorderStyle = bsNone
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    PopupMenu = PopupMenu1
    TabOrder = 0
    BandFont.Charset = DEFAULT_CHARSET
    BandFont.Color = clWindowText
    BandFont.Height = -11
    BandFont.Name = 'MS Sans Serif'
    BandFont.Style = []
    DataSource = dsDados
    Filter.Criteria = {00000000}
    HeaderFont.Charset = DEFAULT_CHARSET
    HeaderFont.Color = clWindowText
    HeaderFont.Height = -11
    HeaderFont.Name = 'MS Sans Serif'
    HeaderFont.Style = [fsBold]
    OptionsBehavior = [edgoAutoSort, edgoDragScroll, edgoEditing, edgoEnterShowEditor, edgoImmediateEditor, edgoStoreToIniFile, edgoTabThrough, edgoVertThrough]
    OptionsView = [edgoBandHeaderWidth, edgoRowSelect, edgoUseBitmap]
    PreviewFont.Charset = DEFAULT_CHARSET
    PreviewFont.Color = clBlue
    PreviewFont.Height = -11
    PreviewFont.Name = 'MS Sans Serif'
    PreviewFont.Style = []
    object grDadosColumn1: TdxDBGridColumn
      Caption = 'Unidade'
      Width = 160
      BandIndex = 0
      RowIndex = 0
      FieldName = 'DS_UNIDADE'
    end
    object grDadosColumn2: TdxDBGridColumn
      Caption = 'Provincia'
      Width = 179
      BandIndex = 0
      RowIndex = 0
      FieldName = 'DS_PROVINCIA'
    end
    object grDadosColumn3: TdxDBGridColumn
      Caption = 'Municipio'
      Width = 221
      BandIndex = 0
      RowIndex = 0
      FieldName = 'DS_MUNICIPIO'
    end
    object grDadosColumn4: TdxDBGridColumn
      Caption = 'MesAno'
      Width = 62
      BandIndex = 0
      RowIndex = 0
      FieldName = 'VL_MESANO'
    end
    object grDadosColumn5: TdxDBGridColumn
      Caption = 'Aceitar'
      Width = 50
      BandIndex = 0
      RowIndex = 0
      FieldName = 'FL_ACEITAR'
    end
    object grDadosColumn6: TdxDBGridColumn
      Caption = 'Processado'
      Width = 63
      BandIndex = 0
      RowIndex = 0
      FieldName = 'FL_IMPORTADO'
    end
    object grDadosColumn8: TdxDBGridColumn
      Caption = 'Enviado'
      Width = 52
      BandIndex = 0
      RowIndex = 0
      FieldName = 'FL_ENVIADO'
    end
    object grDadosColumn7: TdxDBGridColumn
      Caption = 'Tipo'
      Sorted = csUp
      Visible = False
      Width = 61
      BandIndex = 0
      RowIndex = 0
      FieldName = 'DS_TIPO'
      GroupIndex = 0
    end
    object grDadosColumn9: TdxDBGridColumn
      Caption = 'Excluido'
      Width = 70
      BandIndex = 0
      RowIndex = 0
      FieldName = 'DT_EXCLUSAO'
    end
  end
  object dsDados: TDataSource
    DataSet = TB_PROTOCOLO_ENVIO
    Left = 424
    Top = 136
  end
  object PopupMenu1: TPopupMenu
    Left = 424
    Top = 208
    object Aceitar1: TMenuItem
      Caption = 'Aceitar'
      OnClick = Aceitar1Click
    end
    object Processar1: TMenuItem
      Caption = 'Processar'
      OnClick = Processar1Click
    end
    object Visualizar1: TMenuItem
      Caption = 'Visualizar'
      OnClick = Visualizar1Click
    end
  end
  object TB_PROTOCOLO_ENVIO: TIBDataSet
    Database = DM.DB
    Transaction = DM.TS
    BeforeOpen = TB_PROTOCOLO_ENVIOBeforeOpen
    OnCalcFields = TB_PROTOCOLO_ENVIOCalcFields
    BufferChunks = 1000
    CachedUpdates = False
    DeleteSQL.Strings = (
      'delete from "PROTOCOLO_ENVIO"'
      'where'
      '  "CD_PROTOCOLO" = :"OLD_CD_PROTOCOLO" and '
      '  "CD_UND" = :"OLD_CD_UND"')
    InsertSQL.Strings = (
      'insert into "PROTOCOLO_ENVIO"'
      '('
      '  "CD_PROTOCOLO"'
      ', "CD_UND"'
      ', "TP_PROTOCOLO"'
      ', "CD_UNIDADE"'
      ', "CD_PROVINCIA"'
      ', "CD_MUNICIPIO"'
      ', "VL_MESANO"'
      ', "BL_PROTOCOLO"'
      ', "DT_EXP"'
      ', "CD_EDI"'
      ', "CD_USU_INCLUSAO"'
      ', "DT_INCLUSAO"'
      ', "CD_USU_ALTERACAO"'
      ', "DT_ALTERACAO"'
      ', "CD_USU_EXCLUSAO"'
      ', "DT_EXCLUSAO"'
      ', "FL_ENVIADO"'
      ', "CD_REGISTRO_GERAL"'
      ', "FL_ACEITAR"'
      ', "FL_IMPORTADO"'
      ', "CD_ARQUIVO"'
      ')'
      'values'
      '('
      '  :"CD_PROTOCOLO"'
      ', :"CD_UND"'
      ', :"TP_PROTOCOLO"'
      ', :"CD_UNIDADE"'
      ', :"CD_PROVINCIA"'
      ', :"CD_MUNICIPIO"'
      ', :"VL_MESANO"'
      ', :"BL_PROTOCOLO"'
      ', :"DT_EXP"'
      ', :"CD_EDI"'
      ', :"CD_USU_INCLUSAO"'
      ', :"DT_INCLUSAO"'
      ', :"CD_USU_ALTERACAO"'
      ', :"DT_ALTERACAO"'
      ', :"CD_USU_EXCLUSAO"'
      ', :"DT_EXCLUSAO"'
      ', :"FL_ENVIADO"'
      ', :"CD_REGISTRO_GERAL"'
      ', :"FL_ACEITAR"'
      ', :"FL_IMPORTADO"'
      ', :"CD_ARQUIVO"'
      ')')
    SelectSQL.Strings = (
      'select "PROTOCOLO_ENVIO"."CD_PROTOCOLO"'
      '      ,"PROTOCOLO_ENVIO"."CD_UND"'
      '      ,"PROTOCOLO_ENVIO"."TP_PROTOCOLO"'
      '      ,"PROTOCOLO_ENVIO"."CD_UNIDADE"'
      '      ,"PROTOCOLO_ENVIO"."CD_PROVINCIA"'
      '      ,"PROTOCOLO_ENVIO"."CD_MUNICIPIO"'
      '      ,"PROTOCOLO_ENVIO"."VL_MESANO"'
      '      ,"PROTOCOLO_ENVIO"."BL_PROTOCOLO"'
      '      ,"PROTOCOLO_ENVIO"."FL_ENVIADO"'
      '      ,"PROTOCOLO_ENVIO"."FL_ACEITAR"'
      '      ,"PROTOCOLO_ENVIO"."DT_EXP"'
      '      ,"PROTOCOLO_ENVIO"."CD_EDI"'
      '      ,"PROTOCOLO_ENVIO"."CD_REGISTRO_GERAL"'
      '      ,"PROTOCOLO_ENVIO"."CD_USU_INCLUSAO"'
      '      ,"PROTOCOLO_ENVIO"."DT_INCLUSAO"'
      '      ,"PROTOCOLO_ENVIO"."CD_USU_ALTERACAO"'
      '      ,"PROTOCOLO_ENVIO"."DT_ALTERACAO"'
      '      ,"PROTOCOLO_ENVIO"."CD_USU_EXCLUSAO"'
      '      ,"PROTOCOLO_ENVIO"."DT_EXCLUSAO"'
      '      ,"PROTOCOLO_ENVIO"."FL_IMPORTADO"'
      '      ,"PROTOCOLO_ENVIO"."CD_ARQUIVO"'
      '      ,U.DS_UNIDADE'
      '      ,M.DS_MUNICIPIO'
      '      ,P.DS_PROVINCIA'
      'from "PROTOCOLO_ENVIO"'
      '    left outer join MUNICIPIO M on'
      '      PROTOCOLO_ENVIO.CD_MUNICIPIO = M.CD_MUNICIPIO'
      '    left outer join PROVINCIA P on'
      '      PROTOCOLO_ENVIO.CD_PROVINCIA = P.CD_PROVINCIA'
      '    left outer join UNIDADE U on '
      '      PROTOCOLO_ENVIO.CD_UNIDADE = U.CD_UNIDADE'
      ''
      '/**/')
    ModifySQL.Strings = (
      'update "PROTOCOLO_ENVIO"'
      'set'
      ' "CD_PROTOCOLO" = :"CD_PROTOCOLO"'
      ', "CD_UND" = :"CD_UND"'
      ', "TP_PROTOCOLO" = :"TP_PROTOCOLO"'
      ', "CD_UNIDADE" = :"CD_UNIDADE"'
      ', "CD_PROVINCIA" = :"CD_PROVINCIA"'
      ', "CD_MUNICIPIO" = :"CD_MUNICIPIO"'
      ', "VL_MESANO" = :"VL_MESANO"'
      ', "BL_PROTOCOLO" = :"BL_PROTOCOLO"'
      ', "DT_EXP" = :"DT_EXP"'
      ', "CD_EDI" = :"CD_EDI"'
      ', "CD_USU_INCLUSAO" = :"CD_USU_INCLUSAO"'
      ', "DT_INCLUSAO" = :"DT_INCLUSAO"'
      ', "CD_USU_ALTERACAO" = :"CD_USU_ALTERACAO"'
      ', "DT_ALTERACAO" = :"DT_ALTERACAO"'
      ', "CD_USU_EXCLUSAO" = :"CD_USU_EXCLUSAO"'
      ', "DT_EXCLUSAO" = :"DT_EXCLUSAO"'
      ', "FL_ENVIADO" = :"FL_ENVIADO"'
      ', "CD_REGISTRO_GERAL" = :"CD_REGISTRO_GERAL"'
      ', "FL_ACEITAR" = :"FL_ACEITAR"'
      ', "FL_IMPORTADO" = :"FL_IMPORTADO"'
      ', "CD_ARQUIVO" = :"CD_ARQUIVO"'
      'where'
      '  "CD_PROTOCOLO" = :"OLD_CD_PROTOCOLO" and '
      '  "CD_UND" = :"OLD_CD_UND"')
    GeneratorField.Field = 'CD_PROTOCOLO'
    GeneratorField.Generator = 'GEN_PROTOCOLO_ENVIO'
    Left = 424
    Top = 176
    object TB_PROTOCOLO_ENVIOCD_PROTOCOLO: TIntegerField
      FieldName = 'CD_PROTOCOLO'
      Origin = 'PROTOCOLO_ENVIO.CD_PROTOCOLO'
      Required = True
    end
    object TB_PROTOCOLO_ENVIOCD_UND: TIntegerField
      FieldName = 'CD_UND'
      Origin = 'PROTOCOLO_ENVIO.CD_UND'
      Required = True
    end
    object TB_PROTOCOLO_ENVIOTP_PROTOCOLO: TIntegerField
      FieldName = 'TP_PROTOCOLO'
      Origin = 'PROTOCOLO_ENVIO.TP_PROTOCOLO'
      Required = True
    end
    object TB_PROTOCOLO_ENVIOCD_UNIDADE: TIntegerField
      FieldName = 'CD_UNIDADE'
      Origin = 'PROTOCOLO_ENVIO.CD_UNIDADE'
      Required = True
    end
    object TB_PROTOCOLO_ENVIOCD_PROVINCIA: TIntegerField
      FieldName = 'CD_PROVINCIA'
      Origin = 'PROTOCOLO_ENVIO.CD_PROVINCIA'
      Required = True
    end
    object TB_PROTOCOLO_ENVIOCD_MUNICIPIO: TIntegerField
      FieldName = 'CD_MUNICIPIO'
      Origin = 'PROTOCOLO_ENVIO.CD_MUNICIPIO'
      Required = True
    end
    object TB_PROTOCOLO_ENVIOVL_MESANO: TIBStringField
      FieldName = 'VL_MESANO'
      Origin = 'PROTOCOLO_ENVIO.VL_MESANO'
      Required = True
      Size = 8
    end
    object TB_PROTOCOLO_ENVIOBL_PROTOCOLO: TBlobField
      FieldName = 'BL_PROTOCOLO'
      Origin = 'PROTOCOLO_ENVIO.BL_PROTOCOLO'
      Size = 8
    end
    object TB_PROTOCOLO_ENVIODT_EXP: TDateTimeField
      FieldName = 'DT_EXP'
      Origin = 'PROTOCOLO_ENVIO.DT_EXP'
    end
    object TB_PROTOCOLO_ENVIOCD_EDI: TIntegerField
      FieldName = 'CD_EDI'
      Origin = 'PROTOCOLO_ENVIO.CD_EDI'
    end
    object TB_PROTOCOLO_ENVIOCD_USU_INCLUSAO: TIntegerField
      FieldName = 'CD_USU_INCLUSAO'
      Origin = 'PROTOCOLO_ENVIO.CD_USU_INCLUSAO'
    end
    object TB_PROTOCOLO_ENVIODT_INCLUSAO: TDateTimeField
      FieldName = 'DT_INCLUSAO'
      Origin = 'PROTOCOLO_ENVIO.DT_INCLUSAO'
    end
    object TB_PROTOCOLO_ENVIOCD_USU_ALTERACAO: TIntegerField
      FieldName = 'CD_USU_ALTERACAO'
      Origin = 'PROTOCOLO_ENVIO.CD_USU_ALTERACAO'
    end
    object TB_PROTOCOLO_ENVIODT_ALTERACAO: TDateTimeField
      FieldName = 'DT_ALTERACAO'
      Origin = 'PROTOCOLO_ENVIO.DT_ALTERACAO'
    end
    object TB_PROTOCOLO_ENVIOCD_USU_EXCLUSAO: TIntegerField
      FieldName = 'CD_USU_EXCLUSAO'
      Origin = 'PROTOCOLO_ENVIO.CD_USU_EXCLUSAO'
    end
    object TB_PROTOCOLO_ENVIODT_EXCLUSAO: TDateTimeField
      FieldName = 'DT_EXCLUSAO'
      Origin = 'PROTOCOLO_ENVIO.DT_EXCLUSAO'
    end
    object TB_PROTOCOLO_ENVIOFL_ENVIADO: TIBStringField
      FieldName = 'FL_ENVIADO'
      Origin = 'PROTOCOLO_ENVIO.FL_ENVIADO'
      FixedChar = True
      Size = 1
    end
    object TB_PROTOCOLO_ENVIOCD_REGISTRO_GERAL: TIntegerField
      FieldName = 'CD_REGISTRO_GERAL'
      Origin = 'PROTOCOLO_ENVIO.CD_REGISTRO_GERAL'
    end
    object TB_PROTOCOLO_ENVIOFL_ACEITAR: TIBStringField
      FieldName = 'FL_ACEITAR'
      Origin = 'PROTOCOLO_ENVIO.FL_ACEITAR'
      FixedChar = True
      Size = 1
    end
    object TB_PROTOCOLO_ENVIOFL_IMPORTADO: TIBStringField
      FieldName = 'FL_IMPORTADO'
      Origin = 'PROTOCOLO_ENVIO.FL_IMPORTADO'
      FixedChar = True
      Size = 1
    end
    object TB_PROTOCOLO_ENVIOCD_ARQUIVO: TIntegerField
      FieldName = 'CD_ARQUIVO'
      Origin = 'PROTOCOLO_ENVIO.CD_ARQUIVO'
    end
    object TB_PROTOCOLO_ENVIODS_UNIDADE: TIBStringField
      FieldName = 'DS_UNIDADE'
      Origin = 'UNIDADE.DS_UNIDADE'
      Size = 50
    end
    object TB_PROTOCOLO_ENVIODS_MUNICIPIO: TIBStringField
      FieldName = 'DS_MUNICIPIO'
      Origin = 'MUNICIPIO.DS_MUNICIPIO'
      Size = 50
    end
    object TB_PROTOCOLO_ENVIODS_PROVINCIA: TIBStringField
      FieldName = 'DS_PROVINCIA'
      Origin = 'PROVINCIA.DS_PROVINCIA'
      Size = 50
    end
    object TB_PROTOCOLO_ENVIODS_TIPO: TStringField
      DisplayWidth = 50
      FieldKind = fkCalculated
      FieldName = 'DS_TIPO'
      Size = 50
      Calculated = True
    end
  end
  object qyGeral: TIBQuery
    Database = DM.DB
    Transaction = DM.TS
    BufferChunks = 1000
    CachedUpdates = False
    Left = 424
    Top = 240
  end
end
