inherited frmRelConferenciaCaixa: TfrmRelConferenciaCaixa
  Left = 284
  Top = 208
  OldCreateOrder = True
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  inherited Label1: TLabel
    Width = 215
    Height = 48
    Caption = 'Relat'#243'rios'#13#10'Confer'#234'ncia de Caixa'
  end
  inherited pgFiltros: TPageControl
    ActivePage = TabSheet1
    object TabSheet1: TTabSheet
      Caption = 'Filtros'
      object Label2: TLabel
        Left = 9
        Top = 94
        Width = 136
        Height = 16
        Caption = 'Terminal (Caixa):'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Courier New'
        Font.Style = [fsBold]
        ParentFont = False
      end
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
      object edTerminal: TdxLookupEdit
        Left = 9
        Top = 112
        Width = 171
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Courier New'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        ReadOnly = False
        ListFieldName = 'DS_TERMINAL'
        KeyFieldName = 'CD_TERMINAL'
        ListSource = dsTerminal
        LookupKeyValue = Null
        StoredValues = 64
      end
      object ckTodos: TCheckBox
        Left = 186
        Top = 121
        Width = 97
        Height = 17
        Caption = 'Todos'
        Checked = True
        State = cbChecked
        TabOrder = 2
      end
    end
  end
  inherited Panel1: TPanel
    Top = 12
  end
  inherited Panel2: TPanel
    inherited btImprimir: TBitBtn
      OnClick = btImprimirClick
    end
  end
  inherited qyGeral: TIBQuery
    AfterScroll = qyGeralAfterScroll
    BeforeOpen = qyGeralBeforeOpen
    SQL.Strings = (
      'select * from VENDA_CONFERENCIA'
      'where  DT_ABERTURA between :de and :ate'
      'and cd_terminal = :cd_terminal'
      'order by cd_terminal')
    Left = 16
    Top = 232
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
      end
      item
        DataType = ftUnknown
        Name = 'cd_terminal'
        ParamType = ptUnknown
      end>
    object qyGeralCD_CONFERENCIA: TIntegerField
      FieldName = 'CD_CONFERENCIA'
      Origin = 'VENDA_CONFERENCIA.CD_CONFERENCIA'
      Required = True
    end
    object qyGeralCD_TERMINAL: TIntegerField
      FieldName = 'CD_TERMINAL'
      Origin = 'VENDA_CONFERENCIA.CD_TERMINAL'
    end
    object qyGeralDS_TERMINAL: TIBStringField
      FieldName = 'DS_TERMINAL'
      Origin = 'VENDA_CONFERENCIA.DS_TERMINAL'
      Size = 50
    end
    object qyGeralDT_ABERTURA: TDateField
      FieldName = 'DT_ABERTURA'
      Origin = 'VENDA_CONFERENCIA.DT_ABERTURA'
    end
    object qyGeralHR_ABERTURA: TTimeField
      FieldName = 'HR_ABERTURA'
      Origin = 'VENDA_CONFERENCIA.HR_ABERTURA'
    end
    object qyGeralCD_OPERADOR_A: TIntegerField
      FieldName = 'CD_OPERADOR_A'
      Origin = 'VENDA_CONFERENCIA.CD_OPERADOR_A'
    end
    object qyGeralDS_OPERADOR_A: TIBStringField
      FieldName = 'DS_OPERADOR_A'
      Origin = 'VENDA_CONFERENCIA.DS_OPERADOR_A'
      Size = 100
    end
    object qyGeralVL_ABERTURA: TIBBCDField
      FieldName = 'VL_ABERTURA'
      Origin = 'VENDA_CONFERENCIA.VL_ABERTURA'
      Precision = 18
      Size = 2
    end
    object qyGeralCD_OPERADOR_F: TIntegerField
      FieldName = 'CD_OPERADOR_F'
      Origin = 'VENDA_CONFERENCIA.CD_OPERADOR_F'
    end
    object qyGeralDS_OPERADOR_F: TIBStringField
      FieldName = 'DS_OPERADOR_F'
      Origin = 'VENDA_CONFERENCIA.DS_OPERADOR_F'
      Size = 100
    end
    object qyGeralVL_FECHAMENTO: TIBBCDField
      FieldName = 'VL_FECHAMENTO'
      Origin = 'VENDA_CONFERENCIA.VL_FECHAMENTO'
      Precision = 18
      Size = 2
    end
    object qyGeralDT_FECHAMENTO: TDateField
      FieldName = 'DT_FECHAMENTO'
      Origin = 'VENDA_CONFERENCIA.DT_FECHAMENTO'
    end
    object qyGeralHR_FECHAMENTO: TTimeField
      FieldName = 'HR_FECHAMENTO'
      Origin = 'VENDA_CONFERENCIA.HR_FECHAMENTO'
    end
    object qyGeralST_STATUS: TIBStringField
      FieldName = 'ST_STATUS'
      Origin = 'VENDA_CONFERENCIA.ST_STATUS'
      Size = 10
    end
    object qyGeralDS_OBS_SANGRIA: TIBStringField
      FieldName = 'DS_OBS_SANGRIA'
      Origin = 'VENDA_CONFERENCIA.DS_OBS_SANGRIA'
      Size = 100
    end
    object qyGeralDS_OBS_SUPRIMENTO: TIBStringField
      FieldName = 'DS_OBS_SUPRIMENTO'
      Origin = 'VENDA_CONFERENCIA.DS_OBS_SUPRIMENTO'
      Size = 100
    end
    object qyGeralVL_SANGRIA: TIBBCDField
      FieldName = 'VL_SANGRIA'
      Origin = 'VENDA_CONFERENCIA.VL_SANGRIA'
      Precision = 18
      Size = 2
    end
    object qyGeralVL_SUPRIMENTO: TIBBCDField
      FieldName = 'VL_SUPRIMENTO'
      Origin = 'VENDA_CONFERENCIA.VL_SUPRIMENTO'
      Precision = 18
      Size = 2
    end
    object qyGeralCD_EMPRESA: TIntegerField
      FieldName = 'CD_EMPRESA'
      Origin = 'VENDA_CONFERENCIA.CD_EMPRESA'
    end
    object qyGeralNM_USUARIO: TIBStringField
      FieldName = 'NM_USUARIO'
      Origin = 'VENDA_CONFERENCIA.NM_USUARIO'
      Size = 100
    end
    object qyGeralDT_CADASTRO: TDateTimeField
      FieldName = 'DT_CADASTRO'
      Origin = 'VENDA_CONFERENCIA.DT_CADASTRO'
    end
  end
  inherited rvGeral: TRvProject
    OnCreate = rvGeralCreate
    Left = 16
    Top = 322
  end
  inherited rvSystem: TRvSystem
    Left = 48
    Top = 322
  end
  inherited rvDtGeral: TRvDataSetConnection
    Left = 80
    Top = 321
  end
  object dsConferencia: TDataSource
    DataSet = qyGeral
    Left = 16
    Top = 200
  end
  object dsVenda: TDataSource
    DataSet = qyVenda
    Left = 48
    Top = 200
  end
  object qyVenda: TIBQuery
    Database = DM.DB
    Transaction = DM.TS
    AfterScroll = qyVendaAfterScroll
    Active = True
    BufferChunks = 1000
    CachedUpdates = False
    DataSource = dsConferencia
    SQL.Strings = (
      'select * from VENDA'
      'where'
      '  cd_conferencia = :cd_conferencia')
    Left = 48
    Top = 232
    ParamData = <
      item
        DataType = ftInteger
        Name = 'CD_CONFERENCIA'
        ParamType = ptUnknown
        Size = 4
      end>
    object qyVendaCD_VENDA: TIntegerField
      FieldName = 'CD_VENDA'
      Origin = 'VENDA.CD_VENDA'
      Required = True
    end
    object qyVendaCD_PESSOA: TIntegerField
      FieldName = 'CD_PESSOA'
      Origin = 'VENDA.CD_PESSOA'
    end
    object qyVendaNR_VENDA: TIBStringField
      FieldName = 'NR_VENDA'
      Origin = 'VENDA.NR_VENDA'
      Size = 10
    end
    object qyVendaDT_VENDA: TDateTimeField
      FieldName = 'DT_VENDA'
      Origin = 'VENDA.DT_VENDA'
    end
    object qyVendaCD_OPERACAO: TIntegerField
      FieldName = 'CD_OPERACAO'
      Origin = 'VENDA.CD_OPERACAO'
    end
    object qyVendaCD_INDEXADOR: TIntegerField
      FieldName = 'CD_INDEXADOR'
      Origin = 'VENDA.CD_INDEXADOR'
    end
    object qyVendaQT_PRODUTO_VENDA: TIntegerField
      FieldName = 'QT_PRODUTO_VENDA'
      Origin = 'VENDA.QT_PRODUTO_VENDA'
    end
    object qyVendaVL_TOTAL_BRUTO: TIBBCDField
      FieldName = 'VL_TOTAL_BRUTO'
      Origin = 'VENDA.VL_TOTAL_BRUTO'
      Precision = 18
      Size = 2
    end
    object qyVendaVL_TOTAL_LIQUIDO: TIBBCDField
      FieldName = 'VL_TOTAL_LIQUIDO'
      Origin = 'VENDA.VL_TOTAL_LIQUIDO'
      Precision = 18
      Size = 2
    end
    object qyVendaVL_DESCONTO: TIBBCDField
      FieldName = 'VL_DESCONTO'
      Origin = 'VENDA.VL_DESCONTO'
      Precision = 18
      Size = 2
    end
    object qyVendaVL_ACRESCIMO: TIBBCDField
      FieldName = 'VL_ACRESCIMO'
      Origin = 'VENDA.VL_ACRESCIMO'
      Precision = 18
      Size = 2
    end
    object qyVendaVL_PAGO: TIBBCDField
      FieldName = 'VL_PAGO'
      Origin = 'VENDA.VL_PAGO'
      Precision = 18
      Size = 2
    end
    object qyVendaVL_TROCO: TIBBCDField
      FieldName = 'VL_TROCO'
      Origin = 'VENDA.VL_TROCO'
      Precision = 18
      Size = 2
    end
    object qyVendaNM_CLIENTE: TIBStringField
      FieldName = 'NM_CLIENTE'
      Origin = 'VENDA.NM_CLIENTE'
      Size = 50
    end
    object qyVendaCD_CLIENTE: TIntegerField
      FieldName = 'CD_CLIENTE'
      Origin = 'VENDA.CD_CLIENTE'
    end
    object qyVendaDATA_HORA: TDateTimeField
      FieldName = 'DATA_HORA'
      Origin = 'VENDA.DATA_HORA'
    end
    object qyVendaDS_TERMINAL: TIBStringField
      FieldName = 'DS_TERMINAL'
      Origin = 'VENDA.DS_TERMINAL'
      Size = 50
    end
    object qyVendaNM_OPERADOR: TIBStringField
      FieldName = 'NM_OPERADOR'
      Origin = 'VENDA.NM_OPERADOR'
      Size = 100
    end
    object qyVendaCD_CONFERENCIA: TIntegerField
      FieldName = 'CD_CONFERENCIA'
      Origin = 'VENDA.CD_CONFERENCIA'
    end
    object qyVendaTP_DINHEIRO: TIBStringField
      FieldName = 'TP_DINHEIRO'
      Origin = 'VENDA.TP_DINHEIRO'
      Size = 25
    end
    object qyVendaDS_DINHEIRO: TIBStringField
      FieldName = 'DS_DINHEIRO'
      Origin = 'VENDA.DS_DINHEIRO'
      Size = 25
    end
    object qyVendaTP_CARTAO: TIBStringField
      FieldName = 'TP_CARTAO'
      Origin = 'VENDA.TP_CARTAO'
      Size = 25
    end
    object qyVendaDS_CARTAO: TIBStringField
      FieldName = 'DS_CARTAO'
      Origin = 'VENDA.DS_CARTAO'
      Size = 50
    end
    object qyVendaTP_OUTROS: TIBStringField
      FieldName = 'TP_OUTROS'
      Origin = 'VENDA.TP_OUTROS'
      Size = 25
    end
    object qyVendaDS_OUTROS: TIBStringField
      FieldName = 'DS_OUTROS'
      Origin = 'VENDA.DS_OUTROS'
      Size = 50
    end
    object qyVendaVL_DINHEIRO: TIBBCDField
      FieldName = 'VL_DINHEIRO'
      Origin = 'VENDA.VL_DINHEIRO'
      Precision = 18
      Size = 2
    end
    object qyVendaVL_CARTAO: TIBBCDField
      FieldName = 'VL_CARTAO'
      Origin = 'VENDA.VL_CARTAO'
      Precision = 18
      Size = 2
    end
    object qyVendaVL_OUTROS: TIBBCDField
      FieldName = 'VL_OUTROS'
      Origin = 'VENDA.VL_OUTROS'
      Precision = 18
      Size = 2
    end
  end
  object qyVendaProduto: TIBQuery
    Database = DM.DB
    Transaction = DM.TS
    BufferChunks = 1000
    CachedUpdates = False
    DataSource = dsVenda
    SQL.Strings = (
      'select * from VENDA_PRODUTO '
      'where'
      '  cd_conferencia = :cd_conferencia'
      'and cd_venda = :cd_venda')
    Left = 80
    Top = 232
    ParamData = <
      item
        DataType = ftInteger
        Name = 'CD_CONFERENCIA'
        ParamType = ptUnknown
        Size = 4
      end
      item
        DataType = ftInteger
        Name = 'CD_VENDA'
        ParamType = ptUnknown
        Size = 4
      end>
    object qyVendaProdutoCD_PRODUTO_VENDA: TIntegerField
      FieldName = 'CD_PRODUTO_VENDA'
      Origin = 'VENDA_PRODUTO.CD_PRODUTO_VENDA'
      Required = True
    end
    object qyVendaProdutoCD_VENDA: TIntegerField
      FieldName = 'CD_VENDA'
      Origin = 'VENDA_PRODUTO.CD_VENDA'
      Required = True
    end
    object qyVendaProdutoCD_PRODUTO: TIntegerField
      FieldName = 'CD_PRODUTO'
      Origin = 'VENDA_PRODUTO.CD_PRODUTO'
    end
    object qyVendaProdutoDS_PRODUTO: TIBStringField
      FieldName = 'DS_PRODUTO'
      Origin = 'VENDA_PRODUTO.DS_PRODUTO'
      Size = 50
    end
    object qyVendaProdutoVL_PRODUTO: TIBBCDField
      FieldName = 'VL_PRODUTO'
      Origin = 'VENDA_PRODUTO.VL_PRODUTO'
      Precision = 18
      Size = 2
    end
    object qyVendaProdutoQT_PRODUTO: TIntegerField
      FieldName = 'QT_PRODUTO'
      Origin = 'VENDA_PRODUTO.QT_PRODUTO'
    end
    object qyVendaProdutoVL_DESCONTO: TIBBCDField
      FieldName = 'VL_DESCONTO'
      Origin = 'VENDA_PRODUTO.VL_DESCONTO'
      Precision = 18
      Size = 2
    end
    object qyVendaProdutoVL_ACRESCIMO: TIBBCDField
      FieldName = 'VL_ACRESCIMO'
      Origin = 'VENDA_PRODUTO.VL_ACRESCIMO'
      Precision = 18
      Size = 2
    end
    object qyVendaProdutoVL_TOTAL_BRUTO: TIBBCDField
      FieldName = 'VL_TOTAL_BRUTO'
      Origin = 'VENDA_PRODUTO.VL_TOTAL_BRUTO'
      Precision = 18
      Size = 2
    end
    object qyVendaProdutoCD_INDEXADOR: TIntegerField
      FieldName = 'CD_INDEXADOR'
      Origin = 'VENDA_PRODUTO.CD_INDEXADOR'
    end
    object qyVendaProdutoCD_CONFERENCIA: TIntegerField
      FieldName = 'CD_CONFERENCIA'
      Origin = 'VENDA_PRODUTO.CD_CONFERENCIA'
    end
    object qyVendaProdutoNR_SERIE: TIBStringField
      FieldName = 'NR_SERIE'
      Origin = 'VENDA_PRODUTO.NR_SERIE'
      Size = 30
    end
  end
  object dsTerminal: TDataSource
    DataSet = DMGERAL.TB_TERMINAL
    Left = 80
    Top = 200
  end
  object RvDtCnProduto: TRvDataSetConnection
    RuntimeVisibility = rtDeveloper
    DataSet = qyVendaProduto
    Left = 80
    Top = 262
  end
  object RvDtCnVenda: TRvDataSetConnection
    RuntimeVisibility = rtDeveloper
    DataSet = qyVenda
    Left = 48
    Top = 262
  end
  object RvDtConferencia: TRvDataSetConnection
    RuntimeVisibility = rtDeveloper
    DataSet = qyGeral
    Left = 17
    Top = 262
  end
  object qySangria: TIBQuery
    Database = DM.DB
    Transaction = DM.TS
    BufferChunks = 1000
    CachedUpdates = False
    DataSource = dsConferencia
    SQL.Strings = (
      'select * from VENDA_SANGRIA'
      'where cd_conferencia =:cd_conferencia')
    Left = 16
    Top = 163
    ParamData = <
      item
        DataType = ftInteger
        Name = 'CD_CONFERENCIA'
        ParamType = ptUnknown
        Size = 4
      end>
    object qySangriaCD_CONFERENCIA: TIntegerField
      FieldName = 'CD_CONFERENCIA'
      Origin = 'VENDA_SANGRIA.CD_CONFERENCIA'
      Required = True
    end
    object qySangriaCD_SANGRIA: TIntegerField
      FieldName = 'CD_SANGRIA'
      Origin = 'VENDA_SANGRIA.CD_SANGRIA'
      Required = True
    end
    object qySangriaTP_SANGRIA: TIBStringField
      FieldName = 'TP_SANGRIA'
      Origin = 'VENDA_SANGRIA.TP_SANGRIA'
      Size = 50
    end
    object qySangriaDS_SANGRIA: TIBStringField
      FieldName = 'DS_SANGRIA'
      Origin = 'VENDA_SANGRIA.DS_SANGRIA'
      Size = 100
    end
    object qySangriaVL_SANGRIA: TIBBCDField
      FieldName = 'VL_SANGRIA'
      Origin = 'VENDA_SANGRIA.VL_SANGRIA'
      Precision = 18
      Size = 2
    end
    object qySangriaCD_EMPRESA: TIntegerField
      FieldName = 'CD_EMPRESA'
      Origin = 'VENDA_SANGRIA.CD_EMPRESA'
    end
  end
  object qySuprimento: TIBQuery
    Database = DM.DB
    Transaction = DM.TS
    BufferChunks = 1000
    CachedUpdates = False
    DataSource = dsConferencia
    SQL.Strings = (
      'select * from VENDA_SUPRIMENTO'
      'where cd_conferencia =:cd_conferencia')
    Left = 48
    Top = 163
    ParamData = <
      item
        DataType = ftInteger
        Name = 'CD_CONFERENCIA'
        ParamType = ptUnknown
        Size = 4
      end>
    object qySuprimentoCD_CONFERENCIA: TIntegerField
      FieldName = 'CD_CONFERENCIA'
      Origin = 'VENDA_SUPRIMENTO.CD_CONFERENCIA'
      Required = True
    end
    object qySuprimentoCD_SUPRIMENTO: TIntegerField
      FieldName = 'CD_SUPRIMENTO'
      Origin = 'VENDA_SUPRIMENTO.CD_SUPRIMENTO'
      Required = True
    end
    object qySuprimentoTP_SUPRIMENTO: TIBStringField
      FieldName = 'TP_SUPRIMENTO'
      Origin = 'VENDA_SUPRIMENTO.TP_SUPRIMENTO'
      Size = 50
    end
    object qySuprimentoDS_SUPRIMENTO: TIBStringField
      FieldName = 'DS_SUPRIMENTO'
      Origin = 'VENDA_SUPRIMENTO.DS_SUPRIMENTO'
      Size = 100
    end
    object qySuprimentoVL_SUPRIMENTO: TIBBCDField
      FieldName = 'VL_SUPRIMENTO'
      Origin = 'VENDA_SUPRIMENTO.VL_SUPRIMENTO'
      Precision = 18
      Size = 2
    end
    object qySuprimentoCD_EMPRESA: TIntegerField
      FieldName = 'CD_EMPRESA'
      Origin = 'VENDA_SUPRIMENTO.CD_EMPRESA'
    end
  end
  object RvDtCnConferenciaSangria: TRvDataSetConnection
    RuntimeVisibility = rtDeveloper
    DataSet = qySangria
    Left = 48
    Top = 291
  end
  object RvDtCnConferenciaSuprimento: TRvDataSetConnection
    RuntimeVisibility = rtDeveloper
    DataSet = qySuprimento
    Left = 80
    Top = 291
  end
end
