inherited frmRelTituloReceberVencidos: TfrmRelTituloReceberVencidos
  OldCreateOrder = True
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  inherited Label1: TLabel
    Width = 290
    Height = 48
    Caption = 'Relat'#243'rio'#13#10'Titulo a Receber - (Vencidos)'
  end
  inherited pgFiltros: TPageControl
    ActivePage = TabSheet1
    object TabSheet1: TTabSheet
      Caption = 'Filtros'
      object GroupBox3: TGroupBox
        Left = 8
        Top = 8
        Width = 418
        Height = 76
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
          OnExit = dtdeExit
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
          OnExit = dtateExit
          Date = -700000.000000000000000000
          UseEditMask = True
          StoredValues = 4
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
      'select TITULO_RECEBER.*, EMPRESA.DS_EMPRESA, STATUS.DS_STATUS'
      'from TITULO_RECEBER, EMPRESA, STATUS'
      
        'where TITULO_RECEBER.CD_TITULO_RECEBER = TITULO_RECEBER.CD_TITUL' +
        'O_RECEBER'
      'and TITULO_RECEBER.CD_EMPRESA = EMPRESA.CD_EMPRESA'
      'and TITULO_RECEBER.SG_STATUS = STATUS.SG_STATUS'
      'and TITULO_RECEBER.SG_STATUS = '#39'AB'#39
      'and TITULO_RECEBER.DT_VENCIMENTO < :DATA'
      'AND TITULO_RECEBER.DT_EMISSAO between :de AND :ate')
    Left = 16
    Top = 224
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'DATA'
        ParamType = ptUnknown
      end
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
  end
  object RvDtCnTituloReceberVencidos: TRvDataSetConnection
    RuntimeVisibility = rtDeveloper
    DataSet = qyGeral
    Left = 16
    Top = 254
  end
  object RvDtCnTituloReceberVencidosConfRel: TRvDataSetConnection
    RuntimeVisibility = rtDeveloper
    DataSet = DMRelatorios.qyConfRelatorio
    Left = 56
    Top = 254
  end
  object RvSysTituloReceberVencidos: TRvSystem
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
  object RvPrjTituloReceberVencidos: TRvProject
    Engine = RvSysTituloReceberVencidos
    ProjectFile = 'RelTituloReceberVencidos.rav'
    OnCreate = RvPrjTituloReceberVencidosCreate
    Left = 16
    Top = 318
  end
end
