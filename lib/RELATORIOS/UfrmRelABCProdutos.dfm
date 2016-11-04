inherited frmRelABCProdutos: TfrmRelABCProdutos
  Left = 273
  Top = 139
  OldCreateOrder = True
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  inherited Label1: TLabel
    Width = 211
    Height = 48
    Caption = 'Relat'#243'rio'#13#10'Curva ABC Produtos'
  end
  inherited pgFiltros: TPageControl
    ActivePage = TabSheet2
    object TabSheet2: TTabSheet
      Caption = 'Filtros'
      ImageIndex = 1
      object GroupBox3: TGroupBox
        Left = 8
        Top = 8
        Width = 418
        Height = 128
        Caption = 'Per'#237'odo'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Courier New'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        object Label3: TLabel
          Left = 8
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
        object Label8: TLabel
          Left = 192
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
        object dtde: TdxDateEdit
          Left = 8
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
          Date = -700000.000000000000000000
          UseEditMask = True
          StoredValues = 4
        end
        object dtate: TdxDateEdit
          Left = 192
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
          Date = -700000.000000000000000000
          UseEditMask = True
          StoredValues = 4
        end
        object rgordenar: TRadioGroup
          Left = 9
          Top = 72
          Width = 240
          Height = 45
          Caption = 'Ordenar por'
          Columns = 2
          Ctl3D = True
          ItemIndex = 0
          Items.Strings = (
            'Valor'
            'Quantidade')
          ParentCtl3D = False
          TabOrder = 2
        end
      end
    end
  end
  inherited Panel2: TPanel
    inherited btImprimir: TBitBtn
      OnClick = btImprimirClick
    end
  end
  inherited qyGeral: TIBQuery
    BeforeOpen = qyGeralBeforeOpen
    SQL.Strings = (
      'select P.CD_PRODUTO,P.DS_PRODUTO, SUM(P.QT_PRODUTO)QTDE_TOTAL,'
      'SUM(P.VL_TOTAL)VALOR_TOTAL'
      'from NF_PRODUTO P, OPERACAO O'
      'where P.CD_PRODUTO = P.CD_PRODUTO'
      'AND O.TP_OPERACAO = '#39'VENDA'#39' '
      'AND P.CD_OPERACAO = O.CD_OPERACAO'
      'AND P.DT_NF between :de AND :ate'
      'GROUP BY P.CD_PRODUTO,P.DS_PRODUTO')
    Left = 16
    Top = 224
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'de'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ate'
        ParamType = ptUnknown
      end>
    object qyGeralCD_PRODUTO: TIntegerField
      FieldName = 'CD_PRODUTO'
      Origin = 'NF_PRODUTO.CD_PRODUTO'
    end
    object qyGeralDS_PRODUTO: TIBStringField
      FieldName = 'DS_PRODUTO'
      Origin = 'NF_PRODUTO.DS_PRODUTO'
      Size = 100
    end
    object qyGeralQTDE_TOTAL: TLargeintField
      FieldName = 'QTDE_TOTAL'
    end
    object qyGeralVALOR_TOTAL: TIBBCDField
      FieldName = 'VALOR_TOTAL'
      Precision = 18
      Size = 2
    end
  end
  object RvDtCnABCProduto: TRvDataSetConnection
    RuntimeVisibility = rtDeveloper
    DataSet = qyGeral
    Left = 16
    Top = 254
  end
  object RvSysABCProduto: TRvSystem
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
  object RvPrjABCProduto: TRvProject
    Engine = RvSysABCProduto
    ProjectFile = 'RelABCProdutos.rav'
    OnCreate = RvPrjABCProdutoCreate
    Left = 16
    Top = 318
  end
  object RvDtCnABCProdutoConfRel: TRvDataSetConnection
    RuntimeVisibility = rtDeveloper
    DataSet = DMRelatorios.qyConfRelatorio
    Left = 56
    Top = 254
  end
end
