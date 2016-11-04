object framMapaMedico: TframMapaMedico
  Left = 0
  Top = 0
  Width = 619
  Height = 355
  TabOrder = 0
  object pnToolBar: TPanel
    Left = 0
    Top = 0
    Width = 619
    Height = 27
    Align = alTop
    TabOrder = 0
    DesignSize = (
      619
      27)
    object btEditar: TSpeedButton
      Left = 7
      Top = 3
      Width = 56
      Height = 22
      Hint = 'Editar'
      Anchors = [akLeft]
      Caption = 'Editar'
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333000000
        000033333377777777773333330FFFFFFFF03FF3FF7FF33F3FF700300000FF0F
        00F077F777773F737737E00BFBFB0FFFFFF07773333F7F3333F7E0BFBF000FFF
        F0F077F3337773F3F737E0FBFBFBF0F00FF077F3333FF7F77F37E0BFBF00000B
        0FF077F3337777737337E0FBFBFBFBF0FFF077F33FFFFFF73337E0BF0000000F
        FFF077FF777777733FF7000BFB00B0FF00F07773FF77373377373330000B0FFF
        FFF03337777373333FF7333330B0FFFF00003333373733FF777733330B0FF00F
        0FF03333737F37737F373330B00FFFFF0F033337F77F33337F733309030FFFFF
        00333377737FFFFF773333303300000003333337337777777333}
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      OnClick = btEditarClick
    end
    object btSalvar: TSpeedButton
      Left = 65
      Top = 3
      Width = 59
      Height = 22
      Hint = 'Salvar'
      Anchors = [akLeft]
      Caption = 'Salvar'
      Enabled = False
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        333333FFFFFFFFFFFFF33000077777770033377777777777773F000007888888
        00037F3337F3FF37F37F00000780088800037F3337F77F37F37F000007800888
        00037F3337F77FF7F37F00000788888800037F3337777777337F000000000000
        00037F3FFFFFFFFFFF7F00000000000000037F77777777777F7F000FFFFFFFFF
        00037F7F333333337F7F000FFFFFFFFF00037F7F333333337F7F000FFFFFFFFF
        00037F7F333333337F7F000FFFFFFFFF00037F7F333333337F7F000FFFFFFFFF
        00037F7F333333337F7F000FFFFFFFFF07037F7F33333333777F000FFFFFFFFF
        0003737FFFFFFFFF7F7330099999999900333777777777777733}
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      OnClick = btSalvarClick
    end
    object btConfImp: TSpeedButton
      Tag = 1
      Left = 395
      Top = 3
      Width = 75
      Height = 22
      Hint = 'Configurar Impressora'
      Anchors = [akLeft]
      Caption = 'Conf. Imp.'
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000130B0000130B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00300000000000
        00033FFFFFFFFFFFFFFF0888888888888880777777777777777F088888888888
        8880777777777777777F0000000000000000FFFFFFFFFFFFFFFF0F8F8F8F8F8F
        8F80777777777777777F08F8F8F8F8F8F9F0777777777777777F0F8F8F8F8F8F
        8F807777777777777F7F0000000000000000777777777777777F3330FFFFFFFF
        03333337F3FFFF3F7F333330F0000F0F03333337F77773737F333330FFFFFFFF
        03333337F3FF3FFF7F333330F00F000003333337F773777773333330FFFF0FF0
        33333337F3FF7F3733333330F08F0F0333333337F7737F7333333330FFFF0033
        33333337FFFF7733333333300000033333333337777773333333}
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      OnClick = btConfImpClick
    end
    object btPreview: TSpeedButton
      Tag = 1
      Left = 471
      Top = 3
      Width = 76
      Height = 22
      Hint = 'Preview'
      Anchors = [akLeft]
      Caption = 'Visualizar'
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000130B0000130B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00300000000000
        00033FFFFFFFFFFFFFFF0888888888888880777777777777777F088888888888
        8880777777777777777F0000000000000000FFFFFFFFFFFFFFFF0F8F8F8F8F8F
        8F80777777777777777F08F8F8F8F8F8F9F0777777777777777F0F8F8F8F8F8F
        8F807777777777777F7F0000000000000000777777777777777F3330FFFFFFFF
        03333337F3FFFF3F7F333330F0000F0F03333337F77773737F333330FFFFFFFF
        03333337F3FF3FFF7F333330F00F000003333337F773777773333330FFFF0FF0
        33333337F3FF7F3733333330F08F0F0333333337F7737F7333333330FFFF0033
        33333337FFFF7733333333300000033333333337777773333333}
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      OnClick = btPreviewClick
    end
    object btImprimir: TSpeedButton
      Tag = 1
      Left = 549
      Top = 3
      Width = 67
      Height = 22
      Hint = 'Imprimir Documento'
      Anchors = [akLeft]
      Caption = 'Imprimir'
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000130B0000130B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00300000000000
        00033FFFFFFFFFFFFFFF0888888888888880777777777777777F088888888888
        8880777777777777777F0000000000000000FFFFFFFFFFFFFFFF0F8F8F8F8F8F
        8F80777777777777777F08F8F8F8F8F8F9F0777777777777777F0F8F8F8F8F8F
        8F807777777777777F7F0000000000000000777777777777777F3330FFFFFFFF
        03333337F3FFFF3F7F333330F0000F0F03333337F77773737F333330FFFFFFFF
        03333337F3FF3FFF7F333330F00F000003333337F773777773333330FFFF0FF0
        33333337F3FF7F3733333330F08F0F0333333337F7737F7333333330FFFF0033
        33333337FFFF7733333333300000033333333337777773333333}
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      OnClick = btImprimirClick
    end
    object btFiltrarMedicos: TSpeedButton
      Left = 158
      Top = 3
      Width = 113
      Height = 22
      Hint = 'Salvar'
      Anchors = [akLeft]
      Caption = 'Filtrar M'#233'dicos'
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000130B0000130B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        333333333333333333FF33333333333330003FF3FFFFF3333777003000003333
        300077F777773F333777E00BFBFB033333337773333F7F33333FE0BFBF000333
        330077F3337773F33377E0FBFBFBF033330077F3333FF7FFF377E0BFBF000000
        333377F3337777773F3FE0FBFBFBFBFB039977F33FFFFFFF7377E0BF00000000
        339977FF777777773377000BFB03333333337773FF733333333F333000333333
        3300333777333333337733333333333333003333333333333377333333333333
        333333333333333333FF33333333333330003333333333333777333333333333
        3000333333333333377733333333333333333333333333333333}
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      OnClick = btFiltrarMedicosClick
    end
  end
  object pgMapa: TPageControl
    Left = 0
    Top = 64
    Width = 619
    Height = 291
    ActivePage = tabPag1
    Align = alClient
    TabOrder = 1
    object tabPag1: TTabSheet
      Caption = 'Pagina 1'
      object wbPag1: TWebBrowser
        Left = 0
        Top = 0
        Width = 611
        Height = 263
        Align = alClient
        TabOrder = 0
        OnDocumentComplete = wbPag1DocumentComplete
        ControlData = {
          4C000000263F00002F1B00000000000000000000000000000000000000000000
          000000004C000000000000000000000001000000E0D057007335CF11AE690800
          2B2E126208000000000000004C0000000114020000000000C000000000000046
          8000000000000000000000000000000000000000000000000000000000000000
          00000000000000000100000000000000000000000000000000000000}
      end
    end
    object tabPag2: TTabSheet
      Caption = 'Pagina 2'
      ImageIndex = 1
      object wbPag2: TWebBrowser
        Left = 0
        Top = 0
        Width = 611
        Height = 263
        Align = alClient
        TabOrder = 0
        OnDocumentComplete = wbPag1DocumentComplete
        ControlData = {
          4C000000263F00002F1B00000000000000000000000000000000000000000000
          000000004C000000000000000000000001000000E0D057007335CF11AE690800
          2B2E126208000000000000004C0000000114020000000000C000000000000046
          8000000000000000000000000000000000000000000000000000000000000000
          00000000000000000100000000000000000000000000000000000000}
      end
    end
  end
  object pnFiltroMedicoMapa: TPanel
    Left = 0
    Top = 27
    Width = 619
    Height = 37
    Align = alTop
    TabOrder = 2
    Visible = False
    DesignSize = (
      619
      37)
    object Label7: TLabel
      Left = 8
      Top = 11
      Width = 35
      Height = 13
      Caption = 'Medico'
    end
    object btAtualizarMapa: TSpeedButton
      Left = 278
      Top = 7
      Width = 112
      Height = 22
      Hint = 'Salvar'
      Anchors = [akLeft]
      Caption = 'Atualizar Mapa'
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        33333333333333333333333333333333333333333333333333FF333333333333
        3000333333FFFFF3F77733333000003000B033333777773777F733330BFBFB00
        E00033337FFF3377F7773333000FBFB0E000333377733337F7773330FBFBFBF0
        E00033F7FFFF3337F7773000000FBFB0E000377777733337F7770BFBFBFBFBF0
        E00073FFFFFFFF37F777300000000FB0E000377777777337F7773333330BFB00
        000033333373FF77777733333330003333333333333777333333333333333333
        3333333333333333333333333333333333333333333333333333333333333333
        3333333333333333333333333333333333333333333333333333}
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      OnClick = btAtualizarMapaClick
    end
    object cbMedico: TDBLookupComboBox
      Left = 48
      Top = 8
      Width = 225
      Height = 21
      DropDownRows = 10
      KeyField = 'CD_MEDICO'
      ListField = 'NM_MEDICO'
      ListSource = dsMedicoMapa
      TabOrder = 0
    end
  end
  object dsMapa: TDataSource
    DataSet = DMGERAL.TB_MAPA
    Left = 232
    Top = 64
  end
  object dsMedicoMapa: TDataSource
    DataSet = qyMedicoMapa
    Left = 268
    Top = 65
  end
  object qyMedicoMapa: TIBQuery
    Database = DM.DB
    Transaction = DM.TS
    BeforeOpen = qyMedicoMapaBeforeOpen
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select'
      '  VINC_USUARIO_MEDICO.CD_MEDICO,'
      '  MEDICO.NM_MEDICO'
      'from VINC_USUARIO_MEDICO'
      '  inner join MEDICO'
      '  on MEDICO.CD_MEDICO = VINC_USUARIO_MEDICO.CD_MEDICO'
      'where CD_USUARIO = :CD_USUARIO')
    Left = 304
    Top = 112
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'CD_USUARIO'
        ParamType = ptUnknown
      end>
  end
end