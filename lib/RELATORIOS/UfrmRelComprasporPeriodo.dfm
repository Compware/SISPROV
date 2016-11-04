inherited frmRelComprasporPeriodo: TfrmRelComprasporPeriodo
  OldCreateOrder = True
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  inherited Label1: TLabel
    Width = 216
    Height = 48
    Caption = 'Relat'#243'rio'#13#10'Compras por Per'#237'odo'
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
  inherited rvGeral: TRvProject
    ProjectFile = 'C:\Compware\Layout\RelComprasporPeriodo.rav'
  end
  object dsGeral: TDataSource
    AutoEdit = False
    DataSet = qyGeral
    Left = 16
    Top = 256
  end
  object qyNFProduto: TIBQuery
    Database = DM.DB
    Transaction = DM.TS
    BufferChunks = 1000
    CachedUpdates = False
    DataSource = dsGeral
    SQL.Strings = (
      'select * from NF_PRODUTO '
      'where'
      ' CD_NF = :CD_NF'
      '')
    Left = 56
    Top = 224
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'CD_NF'
        ParamType = ptUnknown
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
  object rvDtProduto: TRvDataSetConnection
    RuntimeVisibility = rtDeveloper
    DataSet = qyNFProduto
    Left = 56
    Top = 254
  end
end
