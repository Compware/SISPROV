inherited frmRelABCCliente: TfrmRelABCCliente
  Left = 283
  Top = 135
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  inherited Label1: TLabel
    Width = 338
    Height = 48
    Caption = 'Relat'#243'rio'#13#10'Curva ABC Produtos por Clientes'
  end
  inherited pgFiltros: TPageControl
    ActivePage = TabSheet1
    object TabSheet1: TTabSheet
      Caption = 'Filtros'
      object GroupBox3: TGroupBox
        Left = 8
        Top = 8
        Width = 418
        Height = 126
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
      object GroupBox2: TGroupBox
        Left = 7
        Top = 135
        Width = 419
        Height = 68
        Caption = 'Cliente'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Courier New'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
        object Label4: TLabel
          Left = 9
          Top = 19
          Width = 56
          Height = 16
          Caption = 'Cliente'
        end
        object btFamilia: TSpeedButton
          Left = 360
          Top = 36
          Width = 25
          Height = 24
          Hint = 'Localizar Cliente'
          Flat = True
          Glyph.Data = {
            16030000424D1603000000000000160200002800000010000000100000000100
            08000000000000010000E50E0000E50E00007800000078000000D4600600E06A
            0600AB500B00481C11006A381100AB58110060311600B66A1600A1502A00A158
            31007B583800484040007B584000584848007B58480098734800605850006A58
            5000735850007B6050008F6A50007B50580084505800845858006A6058007360
            5800CA7B58008F6A6000AB7B6A00AB846A00E0AB6A00737373007B7373008F73
            7300A1847B00AB987B00EAB67B0084848400CAAB8400EAC08400F4CA84008F8F
            8F0098988F00CAAB8F00CAB68F00E0B68F00D4C08F00EAC08F00EACA8F00A198
            9800CAAB9800D4B69800D4C09800D4CA9800E0CA9800EAD49800487BA1008F98
            A100A1A1A100ABA1A100F4EAA100ABA1AB00B6A1AB00ABABAB00C0ABAB00B6B6
            AB00CAB6AB00D4D4AB00E0D4AB00E0E0AB00EAE0AB00FFEAAB0084A1B600D4C0
            B600D4E0B600F4F4B600506AC000B6B6C000D4E0C000F4F4C000FFFFC000586A
            CA0073ABCA0098B6CA00B6B6CA00B6C0CA00C0C0CA00EAF4CA005073D400607B
            D400ABCAD400B6CAD400B6D4D400C0D4D400D4E0D400EAF4D400B6CAE000C0CA
            E000C0D4E000C0E0E000E0E0E000C0E0EA00FFFFEA00CAEAF400D4F4F400EAF4
            F400FF00FF0016A1FF002AA1FF0023ABFF008FE0FF00C0EAFF00CAEAFF00CAF4
            FF00D4F4FF00E0F4FF00D4FFFF00E0FFFF00F4FFFF00FFFFFF006A3A102A6A6A
            6A6A6A6A6A6A6A6A6A6A3A535916256A6A6A6A6A6A6A6A6A6A6A6A6E6C511729
            6A6A6A6A6A6A6A6A6A6A6A6A6E6D58153F6A6A6A6A6A6A6A6A6A6A6A6A386B4C
            0B2011190D1F6A6A6A6A6A09090852481C476677771B031A066A6A2775756840
            2F4B4F5F76771871136A6A1E6F5B552B362E4A5E64662339126A6A1E6F5B5532
            2E2C434A4E5726390E6A6A1E6F5B5B324534354344501D5B0E6A6A1E705D5D41
            496944303C2721760C6A6A1E6F5B5B5B3B4236302D225B770C6A6A1E70616262
            654D313D4D6772770C6A6A247165656767677271706768770C6A6A0205050505
            0505050507070714046A6A000101010101010101010101010F6A}
          ParentShowHint = False
          ShowHint = True
          OnClick = btFamiliaClick
        end
        object btFamiliaLimpar: TSpeedButton
          Left = 386
          Top = 36
          Width = 25
          Height = 24
          Hint = 'Limpar Cliente'
          Flat = True
          Glyph.Data = {
            E6010000424DE601000000000000E60000002800000010000000100000000100
            08000000000000010000F40E0000F40E00002C0000002C000000110300000606
            06002A2A2A00484031002A313800383838004848480050504800485050005050
            50005858580060606000736A60006A6A6A007373730023317B007B7B7B000003
            8F008F8F8F001C23AB000638AB00607BB60098A1C000CACACA002A8FD4000006
            E0004058E00098C0E000E0E0E000067BEA001684EA007B8FEA00EAEAEA001658
            F400007BF4002AE0F400FF00FF000384FF000B8FFF001C98FF0031ABFF0073F4
            FF00C0F4FF00FFFFFF0024242424242424242424242424062424242424242424
            24242424242408101024242424242424242424242405102B2012242424242424
            2424242401010B1C12242424242424242424240101020B0E2424242424241917
            24240101040D0924242424242424131B240101040D092424242424242424131A
            0001020D0A242424242424241915261411130C0724242424242424241A252323
            210F0324242424242424182125232A292821211F1B24242424241B211E232A29
            281E211516242424242424241A262323221F24242424242424242424211F271D
            1F18242424242424242424242424211824242424242424242424242424241B15
            24242424242424242424}
          ParentShowHint = False
          ShowHint = True
          OnClick = btFamiliaLimparClick
        end
        object edCod: TEdit
          Left = 9
          Top = 36
          Width = 121
          Height = 24
          TabOrder = 0
        end
        object edCliente: TEdit
          Left = 9
          Top = 36
          Width = 349
          Height = 24
          TabOrder = 1
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
    SQL.Strings = (
      'SELECT NF.CD_PESSOA, NF.DS_PESSOA, NF.CD_NF, '
      'NF.DT_NF,NF.CD_OPERACAO, NF.SG_STATUS,OPERACAO.TP_OPERACAO,'
      '(SELECT NM_PESSOA FROM PESSOA'
      ' WHERE PESSOA.CD_PESSOA = NF.CD_EMPRESA'
      'AND PESSOA.TP_PESSOA = '#39'EM'#39')NM_EMPRESA'
      'from NF,OPERACAO'
      'WHERE '
      '  OPERACAO.TP_OPERACAO = '#39'VENDA'#39' '
      'AND'
      '  NF.CD_OPERACAO = OPERACAO.CD_OPERACAO'
      'and'
      '  NF.SG_STATUS= '#39'L'#39
      '')
    Left = 16
    Top = 224
    object qyGeralCD_PESSOA: TIntegerField
      FieldName = 'CD_PESSOA'
      Origin = 'NF.CD_PESSOA'
    end
    object qyGeralDS_PESSOA: TIBStringField
      FieldName = 'DS_PESSOA'
      Origin = 'NF.DS_PESSOA'
      Size = 100
    end
    object qyGeralCD_NF: TIntegerField
      FieldName = 'CD_NF'
      Origin = 'NF.CD_NF'
      Required = True
    end
    object qyGeralCD_OPERACAO: TIntegerField
      FieldName = 'CD_OPERACAO'
      Origin = 'NF.CD_OPERACAO'
    end
    object qyGeralSG_STATUS: TIBStringField
      FieldName = 'SG_STATUS'
      Origin = 'NF.SG_STATUS'
      FixedChar = True
      Size = 2
    end
    object qyGeralTP_OPERACAO: TIBStringField
      FieldName = 'TP_OPERACAO'
      Origin = 'OPERACAO.TP_OPERACAO'
    end
    object qyGeralNM_EMPRESA: TIBStringField
      FieldName = 'NM_EMPRESA'
      Size = 100
    end
    object qyGeralDT_NF: TDateTimeField
      FieldName = 'DT_NF'
      Origin = 'NF.DT_NF'
    end
  end
  object RvDtCnABCCliente: TRvDataSetConnection
    RuntimeVisibility = rtDeveloper
    DataSet = qyGeral
    Left = 16
    Top = 254
  end
  object RvSysABCCliente: TRvSystem
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
  object RvPrjABCCliente: TRvProject
    Engine = RvSysABCCliente
    ProjectFile = 'RelABCCliente.rav'
    Left = 16
    Top = 318
  end
  object RvDtCnABCClienteConfRel: TRvDataSetConnection
    RuntimeVisibility = rtDeveloper
    DataSet = DMGERAL.qyConfRelatorio
    Left = 80
    Top = 254
  end
  object qyNFProduto: TIBQuery
    Database = DM.DB
    Transaction = DM.TS
    BufferChunks = 1000
    CachedUpdates = False
    DataSource = dsGeral
    SQL.Strings = (
      
        'select NF_PRODUTO.CD_PRODUTO,NF_PRODUTO.DS_PRODUTO, SUM(NF_PRODU' +
        'TO.QT_PRODUTO)QTDE_TOTAL,'
      'SUM(NF_PRODUTO.VL_TOTAL)VALOR_TOTAL'
      'from NF_PRODUTO'
      'where '
      'NF_PRODUTO.CD_PRODUTO = NF_PRODUTO.CD_PRODUTO'
      'AND NF_PRODUTO.CD_PESSOA =:CD_PESSOA'
      'AND NF_PRODUTO.DT_NF =:DT_NF'
      'GROUP BY NF_PRODUTO.CD_PRODUTO,NF_PRODUTO.DS_PRODUTO'
      ''
      '')
    Left = 48
    Top = 224
    ParamData = <
      item
        DataType = ftInteger
        Name = 'CD_PESSOA'
        ParamType = ptUnknown
        Size = 4
      end
      item
        DataType = ftDateTime
        Name = 'DT_NF'
        ParamType = ptUnknown
        Size = 8
      end>
    object qyNFProdutoCD_PRODUTO: TIntegerField
      FieldName = 'CD_PRODUTO'
      Origin = 'NF_PRODUTO.CD_PRODUTO'
    end
    object qyNFProdutoDS_PRODUTO: TIBStringField
      FieldName = 'DS_PRODUTO'
      Origin = 'NF_PRODUTO.DS_PRODUTO'
      Size = 100
    end
    object qyNFProdutoQTDE_TOTAL: TLargeintField
      FieldName = 'QTDE_TOTAL'
    end
    object qyNFProdutoVALOR_TOTAL: TIBBCDField
      FieldName = 'VALOR_TOTAL'
      Precision = 18
      Size = 2
    end
  end
  object RvDtCnABCClienteProduto: TRvDataSetConnection
    RuntimeVisibility = rtDeveloper
    DataSet = qyNFProduto
    Left = 48
    Top = 254
  end
  object dsGeral: TDataSource
    AutoEdit = False
    DataSet = qyGeral
    Left = 16
    Top = 192
  end
end
