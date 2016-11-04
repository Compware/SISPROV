inherited frmRelNFVenda: TfrmRelNFVenda
  Left = 269
  Top = 169
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited Label1: TLabel
    Width = 129
    Height = 48
    Caption = 'Relat'#243'rio'#13#10'Faturamento'
  end
  inherited pgFiltros: TPageControl
    ActivePage = TabSheet1
    object TabSheet1: TTabSheet
      Caption = 'Filtros'
      object GroupBox1: TGroupBox
        Left = 16
        Top = 12
        Width = 401
        Height = 75
        Caption = 'Per'#237'odo'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Courier New'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        object Label2: TLabel
          Left = 16
          Top = 22
          Width = 48
          Height = 16
          Caption = 'Inicio'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label3: TLabel
          Left = 200
          Top = 22
          Width = 40
          Height = 16
          Caption = 'Final'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object edINICIO: TdxDateEdit
          Left = 16
          Top = 40
          Width = 167
          Font.Charset = ANSI_CHARSET
          Font.Color = clNavy
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          Style.BorderColor = clBlack
          Style.BorderStyle = xbsSingle
          Style.ButtonStyle = btsHotFlat
          Style.HotTrack = False
          Style.Shadow = False
          TabOrder = 0
          OnKeyPress = edINICIOKeyPress
          Date = -700000.000000000000000000
          UseEditMask = True
          StoredValues = 4
        end
        object edFINAL: TdxDateEdit
          Left = 200
          Top = 40
          Width = 168
          Font.Charset = ANSI_CHARSET
          Font.Color = clNavy
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          Style.BorderColor = clBlack
          Style.BorderStyle = xbsSingle
          Style.ButtonStyle = btsHotFlat
          Style.HotTrack = False
          Style.Shadow = False
          TabOrder = 1
          OnKeyPress = edINICIOKeyPress
          Date = -700000.000000000000000000
          UseEditMask = True
          StoredValues = 4
        end
      end
    end
  end
  inherited Panel1: TPanel
    TabOrder = 2
  end
  inherited Panel2: TPanel
    TabOrder = 1
    inherited btImprimir: TBitBtn
      OnClick = btImprimirClick
    end
  end
  inherited qyGeral: TIBQuery
    BeforeOpen = qyGeralBeforeOpen
    SQL.Strings = (
      'SELECT NF.*, OPERACAO.TP_OPERACAO'
      'from NF,OPERACAO'
      'WHERE '
      '  OPERACAO.TP_OPERACAO = '#39'VENDA'#39' '
      'AND'
      '  NF.CD_OPERACAO = OPERACAO.CD_OPERACAO'
      'AND'
      '  NF.SG_STATUS = '#39'L'#39
      'AND'
      '  NF.DT_NF BETWEEN :INICIO AND :FINAL')
    Left = 16
    Top = 216
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'INICIO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'FINAL'
        ParamType = ptUnknown
      end>
    object qyGeralCD_NF: TIntegerField
      FieldName = 'CD_NF'
      Origin = 'NF.CD_NF'
      Required = True
    end
    object qyGeralDT_NF: TDateTimeField
      FieldName = 'DT_NF'
      Origin = 'NF.DT_NF'
    end
    object qyGeralDT_REFERENCIA: TDateTimeField
      FieldName = 'DT_REFERENCIA'
      Origin = 'NF.DT_REFERENCIA'
    end
    object qyGeralDS_PESSOA: TIBStringField
      FieldName = 'DS_PESSOA'
      Origin = 'NF.DS_PESSOA'
      Size = 100
    end
    object qyGeralDS_OBS: TIBStringField
      FieldName = 'DS_OBS'
      Origin = 'NF.DS_OBS'
      Size = 200
    end
    object qyGeralVL_TOTAL_BRUTO: TIBBCDField
      FieldName = 'VL_TOTAL_BRUTO'
      Origin = 'NF.VL_TOTAL_BRUTO'
      Precision = 18
      Size = 2
    end
    object qyGeralVL_TOTAL_LIQUIDO: TIBBCDField
      FieldName = 'VL_TOTAL_LIQUIDO'
      Origin = 'NF.VL_TOTAL_LIQUIDO'
      Precision = 18
      Size = 2
    end
    object qyGeralVL_DESCONTO: TIBBCDField
      FieldName = 'VL_DESCONTO'
      Origin = 'NF.VL_DESCONTO'
      Precision = 18
      Size = 2
    end
    object qyGeralVL_ACRESCIMO: TIBBCDField
      FieldName = 'VL_ACRESCIMO'
      Origin = 'NF.VL_ACRESCIMO'
      Precision = 18
      Size = 2
    end
    object qyGeralNR_NF: TIBStringField
      FieldName = 'NR_NF'
      Origin = 'NF.NR_NF'
    end
    object qyGeralDS_OPERACAO: TIBStringField
      FieldName = 'DS_OPERACAO'
      Origin = 'NF.DS_OPERACAO'
      Size = 50
    end
    object qyGeralCD_OPERACAO: TIntegerField
      FieldName = 'CD_OPERACAO'
      Origin = 'NF.CD_OPERACAO'
    end
    object qyGeralTP_OPERACAO: TIBStringField
      FieldName = 'TP_OPERACAO'
      Origin = 'OPERACAO.TP_OPERACAO'
    end
    object qyGeralSG_STATUS: TIBStringField
      FieldName = 'SG_STATUS'
      Origin = 'NF.SG_STATUS'
      FixedChar = True
      Size = 2
    end
    object qyGeralTP_DOCUMENTO: TIBStringField
      FieldName = 'TP_DOCUMENTO'
      Origin = 'NF.TP_DOCUMENTO'
      FixedChar = True
      Size = 3
    end
  end
  object RvDtCnNFVENDA: TRvDataSetConnection
    RuntimeVisibility = rtDeveloper
    DataSet = qyGeral
    Left = 16
    Top = 254
  end
  object RvSysNFVENDA: TRvSystem
    TitleSetup = 'Output Options'
    TitleStatus = 'Report Status'
    TitlePreview = 'Report Preview'
    SystemFiler.StatusFormat = 'Generating page %p'
    SystemPreview.ZoomFactor = 100.000000000000000000
    SystemPrinter.ScaleX = 100.000000000000000000
    SystemPrinter.ScaleY = 100.000000000000000000
    SystemPrinter.StatusFormat = 'Printing page %p'
    SystemPrinter.Title = 'ReportPrinter Report'
    SystemPrinter.UnitsFactor = 1.000000000000000000
    Left = 16
    Top = 286
  end
  object RvPrjNFVenda: TRvProject
    Engine = RvSysNFVENDA
    ProjectFile = 'RelNFVenda.rav'
    OnCreate = RvPrjNFVendaCreate
    Left = 16
    Top = 318
  end
  object RvDtCnFatConfRel: TRvDataSetConnection
    RuntimeVisibility = rtDeveloper
    DataSet = DMRelatorios.qyConfRelatorio
    Left = 48
    Top = 254
  end
end
