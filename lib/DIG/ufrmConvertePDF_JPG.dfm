object frmConverterPDF_JPG: TfrmConverterPDF_JPG
  Left = 102
  Top = 137
  Width = 730
  Height = 409
  Caption = 'Converter PDF JPG'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object btConverter: TButton
    Left = 552
    Top = 8
    Width = 121
    Height = 25
    Caption = 'Converter'
    TabOrder = 0
    OnClick = btConverterClick
  end
  object ScrollBox1: TScrollBox
    Left = 288
    Top = 8
    Width = 257
    Height = 313
    TabOrder = 1
    object Image1: TImage
      Left = 8
      Top = 4
      Width = 105
      Height = 105
    end
  end
  object spViewPDF1: TspWPViewPDFCompatible
    Left = 8
    Top = 8
    Width = 273
    Height = 313
    TabOrder = 2
    ShowPageFrame = False
    ShowPageShadow = False
  end
  object ProgressBar1: TProgressBar
    Left = 0
    Top = 339
    Width = 722
    Height = 17
    Align = alBottom
    TabOrder = 3
  end
  object mmLog: TMemo
    Left = 552
    Top = 40
    Width = 158
    Height = 249
    TabOrder = 4
  end
  object DBNavigator1: TDBNavigator
    Left = 552
    Top = 296
    Width = 152
    Height = 25
    DataSource = DataSource1
    VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
    TabOrder = 5
    OnClick = DBNavigator1Click
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 356
    Width = 722
    Height = 19
    Panels = <>
    SimplePanel = True
  end
  object Button1: TButton
    Left = 680
    Top = 8
    Width = 33
    Height = 25
    Caption = 'Stop'
    TabOrder = 7
    OnClick = Button1Click
  end
  object tbDig_Arquivo: TIBDataSet
    Database = dmDIG.dbDig
    Transaction = dmDIG.tsDig
    BeforeOpen = tbDig_ArquivoBeforeOpen
    BufferChunks = 1000
    CachedUpdates = False
    DeleteSQL.Strings = (
      'delete from "DIG_ARQUIVO"'
      'where'
      '  "CD_ARQUIVO" = :"OLD_CD_ARQUIVO"')
    InsertSQL.Strings = (
      'insert into "DIG_ARQUIVO"'
      '('
      '  "CD_ARQUIVO"'
      ', "BL_ARQUIVO"'
      ', "DS_ARQUIVO")'
      'values'
      '('
      '  :"CD_ARQUIVO"'
      ', :"BL_ARQUIVO"'
      ', :"DS_ARQUIVO"'
      ')')
    SelectSQL.Strings = (
      'select "DIG_ARQUIVO"."CD_ARQUIVO"'
      '      ,"DIG_ARQUIVO"."BL_ARQUIVO"'
      '      ,"DIG_ARQUIVO"."DS_ARQUIVO"'
      'from "DIG_ARQUIVO"'
      '')
    ModifySQL.Strings = (
      'update "DIG_ARQUIVO"'
      'set'
      ' "CD_ARQUIVO" = :"CD_ARQUIVO"'
      ', "BL_ARQUIVO" = :"BL_ARQUIVO"'
      ', "DS_ARQUIVO" = :"DS_ARQUIVO"'
      'where'
      '  "CD_ARQUIVO" = :"OLD_CD_ARQUIVO"')
    GeneratorField.Field = 'CD_ARQUIVO'
    GeneratorField.Generator = 'GEN_DIG_ARQUIVO'
    Left = 560
    Top = 56
    object tbDig_ArquivoCD_ARQUIVO: TIntegerField
      FieldName = 'CD_ARQUIVO'
      Origin = 'DIG_ARQUIVO.CD_ARQUIVO'
      Required = True
    end
    object tbDig_ArquivoBL_ARQUIVO: TBlobField
      FieldName = 'BL_ARQUIVO'
      Origin = 'DIG_ARQUIVO.BL_ARQUIVO'
      Size = 8
    end
    object tbDig_ArquivoDS_ARQUIVO: TIBStringField
      FieldName = 'DS_ARQUIVO'
      Origin = 'DIG_ARQUIVO.DS_ARQUIVO'
      Size = 500
    end
  end
  object DataSource1: TDataSource
    DataSet = tbDig_Arquivo
    Left = 592
    Top = 56
  end
end
