inherited frmRelTransferencia: TfrmRelTransferencia
  Left = 286
  Top = 169
  OldCreateOrder = True
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  inherited Label1: TLabel
    Width = 288
    Height = 48
    Caption = 'Relat'#243'rio'#13#10'Transfer'#234'ncia de Mercadoria'
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
        object dtDe: TdxDateEdit
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
        object dtAte: TdxDateEdit
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
      end
      object GroupBox2: TGroupBox
        Left = 7
        Top = 87
        Width = 419
        Height = 116
        Caption = 'Empresa'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Courier New'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
        object Label4: TLabel
          Left = 8
          Top = 17
          Width = 136
          Height = 16
          Caption = 'Empresa de Origem'
        end
        object btEmpOrigem: TSpeedButton
          Left = 359
          Top = 34
          Width = 25
          Height = 24
          Hint = 'Localizar Empresa'
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
          OnClick = btEmpOrigemClick
        end
        object btEmpOrigemLimpar: TSpeedButton
          Left = 385
          Top = 34
          Width = 25
          Height = 24
          Hint = 'Limpar Empresa'
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
          OnClick = btEmpOrigemLimparClick
        end
        object Label2: TLabel
          Left = 8
          Top = 65
          Width = 176
          Height = 16
          Caption = 'Empresa de Recebimento'
        end
        object btEmpRec: TSpeedButton
          Left = 359
          Top = 82
          Width = 25
          Height = 24
          Hint = 'Localizar Empresa'
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
          OnClick = btEmpRecClick
        end
        object btEmpRecLimpar: TSpeedButton
          Left = 385
          Top = 82
          Width = 25
          Height = 24
          Hint = 'Limpar Empresa'
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
          OnClick = btEmpRecLimparClick
        end
        object edEmpresaReceb: TEdit
          Left = 8
          Top = 82
          Width = 349
          Height = 24
          TabOrder = 3
        end
        object edEmpresaOrigem: TEdit
          Left = 8
          Top = 34
          Width = 349
          Height = 24
          TabOrder = 1
        end
        object edCod: TEdit
          Left = 8
          Top = 34
          Width = 121
          Height = 24
          Color = clInfoBk
          TabOrder = 0
          Visible = False
        end
        object edCod2: TEdit
          Left = 8
          Top = 82
          Width = 121
          Height = 24
          Color = clInfoBk
          TabOrder = 2
          Visible = False
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
      'SELECT NF.*,'
      '  OPERACAO.TP_OPERACAO,'
      '  E2.CD_PESSOA CD_ORIGEM,'
      '  E2.NM_PESSOA NM_ORIGEM,'
      '  E1.CD_PESSOA CD_DESTINO,'
      '  E1.NM_PESSOA NM_DESTINO'
      'from NF,OPERACAO'
      '  left outer join EMPRESA E'
      '    on(E.CD_EMPRESA = NF.CD_EMPRESA)'
      '  Left outer join PESSOA E1'
      '    on(E1.CD_PESSOA = NF.CD_PESSOA)'
      '  Left outer join PESSOA E2'
      '    on(E2.CD_PESSOA = E.CD_PESSOA)'
      'WHERE'
      '  OPERACAO.TP_OPERACAO = :TP_OPERACAO'
      'AND'
      '  NF.CD_OPERACAO = OPERACAO.CD_OPERACAO'
      'and'
      '  NF.SG_STATUS= '#39'L'#39)
    Left = 16
    Top = 224
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'TP_OPERACAO'
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
    object qyGeralCD_EMPRESA: TIntegerField
      FieldName = 'CD_EMPRESA'
      Origin = 'NF.CD_EMPRESA'
    end
    object qyGeralSG_STATUS: TIBStringField
      FieldName = 'SG_STATUS'
      Origin = 'NF.SG_STATUS'
      FixedChar = True
      Size = 2
    end
    object qyGeralDT_CANCELAMENTO: TDateTimeField
      FieldName = 'DT_CANCELAMENTO'
      Origin = 'NF.DT_CANCELAMENTO'
    end
    object qyGeralNM_USUARIO_CANCELAMENTO: TIBStringField
      FieldName = 'NM_USUARIO_CANCELAMENTO'
      Origin = 'NF.NM_USUARIO_CANCELAMENTO'
      Size = 100
    end
    object qyGeralDS_MOTIVO_CANCELAMENTO: TIBStringField
      FieldName = 'DS_MOTIVO_CANCELAMENTO'
      Origin = 'NF.DS_MOTIVO_CANCELAMENTO'
      Size = 300
    end
    object qyGeralCD_PRAZO: TIntegerField
      FieldName = 'CD_PRAZO'
      Origin = 'NF.CD_PRAZO'
    end
    object qyGeralDS_PRAZO: TIBStringField
      FieldName = 'DS_PRAZO'
      Origin = 'NF.DS_PRAZO'
      Size = 100
    end
    object qyGeralCD_PESSOA: TIntegerField
      FieldName = 'CD_PESSOA'
      Origin = 'NF.CD_PESSOA'
    end
    object qyGeralCD_FORMA_PAGAMENTO: TIntegerField
      FieldName = 'CD_FORMA_PAGAMENTO'
      Origin = 'NF.CD_FORMA_PAGAMENTO'
    end
    object qyGeralDS_FORMA_PAGAMENTO: TIBStringField
      FieldName = 'DS_FORMA_PAGAMENTO'
      Origin = 'NF.DS_FORMA_PAGAMENTO'
      Size = 50
    end
    object qyGeralCD_NATUREZA_LANCAMENTO: TIntegerField
      FieldName = 'CD_NATUREZA_LANCAMENTO'
      Origin = 'NF.CD_NATUREZA_LANCAMENTO'
    end
    object qyGeralDS_NATUREZA_LANCAMENTO: TIBStringField
      FieldName = 'DS_NATUREZA_LANCAMENTO'
      Origin = 'NF.DS_NATUREZA_LANCAMENTO'
      Size = 100
    end
    object qyGeralQT_PRODUTO_NF: TIntegerField
      FieldName = 'QT_PRODUTO_NF'
      Origin = 'NF.QT_PRODUTO_NF'
    end
    object qyGeralTP_DOCUMENTO: TIBStringField
      FieldName = 'TP_DOCUMENTO'
      Origin = 'NF.TP_DOCUMENTO'
      FixedChar = True
      Size = 3
    end
    object qyGeralDS_HISTORICO: TIBStringField
      FieldName = 'DS_HISTORICO'
      Origin = 'NF.DS_HISTORICO'
      Size = 100
    end
    object qyGeralCD_EMPRESA_ORIGEM: TIntegerField
      FieldName = 'CD_EMPRESA_ORIGEM'
      Origin = 'NF.CD_EMPRESA_ORIGEM'
    end
    object qyGeralCD_EDI: TIntegerField
      FieldName = 'CD_EDI'
      Origin = 'NF.CD_EDI'
      Required = True
    end
    object qyGeralNM_USUARIO: TIBStringField
      FieldName = 'NM_USUARIO'
      Origin = 'NF.NM_USUARIO'
      Size = 100
    end
    object qyGeralDT_CADASTRO: TDateTimeField
      FieldName = 'DT_CADASTRO'
      Origin = 'NF.DT_CADASTRO'
    end
    object qyGeralTP_EDI: TIBStringField
      FieldName = 'TP_EDI'
      Origin = 'NF.TP_EDI'
      Required = True
      FixedChar = True
      Size = 1
    end
    object qyGeralTP_OPERACAO: TIBStringField
      FieldName = 'TP_OPERACAO'
      Origin = 'OPERACAO.TP_OPERACAO'
    end
    object qyGeralCD_ORIGEM: TIntegerField
      FieldName = 'CD_ORIGEM'
      Origin = 'PESSOA.CD_PESSOA'
    end
    object qyGeralNM_ORIGEM: TIBStringField
      FieldName = 'NM_ORIGEM'
      Origin = 'PESSOA.NM_PESSOA'
      Size = 100
    end
    object qyGeralCD_DESTINO: TIntegerField
      FieldName = 'CD_DESTINO'
      Origin = 'PESSOA.CD_PESSOA'
    end
    object qyGeralNM_DESTINO: TIBStringField
      FieldName = 'NM_DESTINO'
      Origin = 'PESSOA.NM_PESSOA'
      Size = 100
    end
  end
  object dsGeral: TDataSource [5]
    DataSet = qyGeral
    Left = 56
    Top = 192
  end
  object rvDtProduto: TRvDataSetConnection [6]
    RuntimeVisibility = rtDeveloper
    DataSet = qyNFProduto
    Left = 56
    Top = 254
  end
  object qyNFProduto: TIBQuery [7]
    Database = DM.DB
    Transaction = DM.TS
    BufferChunks = 1000
    CachedUpdates = False
    DataSource = dsGeral
    SQL.Strings = (
      'select * from NF_PRODUTO '
      'where'
      '  cd_NF = :cd_NF'
      '')
    Left = 56
    Top = 224
    ParamData = <
      item
        DataType = ftInteger
        Name = 'CD_NF'
        ParamType = ptUnknown
        Size = 4
      end>
    object qyNFProdutoCD_NF_PRODUTO: TIntegerField
      FieldName = 'CD_NF_PRODUTO'
      Origin = 'NF_PRODUTO.CD_NF_PRODUTO'
      Required = True
    end
    object qyNFProdutoCD_NF: TIntegerField
      FieldName = 'CD_NF'
      Origin = 'NF_PRODUTO.CD_NF'
      Required = True
    end
    object qyNFProdutoCD_PRODUTO: TIntegerField
      FieldName = 'CD_PRODUTO'
      Origin = 'NF_PRODUTO.CD_PRODUTO'
    end
    object qyNFProdutoDS_PRODUTO: TIBStringField
      FieldName = 'DS_PRODUTO'
      Origin = 'NF_PRODUTO.DS_PRODUTO'
      Size = 100
    end
    object qyNFProdutoSG_UNIDADE: TIBStringField
      FieldName = 'SG_UNIDADE'
      Origin = 'NF_PRODUTO.SG_UNIDADE'
      Size = 5
    end
    object qyNFProdutoVL_PRECO: TIBBCDField
      FieldName = 'VL_PRECO'
      Origin = 'NF_PRODUTO.VL_PRECO'
      Precision = 18
      Size = 2
    end
    object qyNFProdutoQT_PRODUTO: TIntegerField
      FieldName = 'QT_PRODUTO'
      Origin = 'NF_PRODUTO.QT_PRODUTO'
    end
    object qyNFProdutoVL_TOTAL: TIBBCDField
      FieldName = 'VL_TOTAL'
      Origin = 'NF_PRODUTO.VL_TOTAL'
      Precision = 18
      Size = 2
    end
    object qyNFProdutoVL_TOTAL_PRODUTOS: TIBBCDField
      FieldName = 'VL_TOTAL_PRODUTOS'
      Origin = 'NF_PRODUTO.VL_TOTAL_PRODUTOS'
      Precision = 18
      Size = 2
    end
    object qyNFProdutoCD_EMPRESA: TIntegerField
      FieldName = 'CD_EMPRESA'
      Origin = 'NF_PRODUTO.CD_EMPRESA'
    end
  end
  inherited rvGeral: TRvProject
    ProjectFile = 'C:\Compware\Layout\RelTransferencia.rav'
  end
end
