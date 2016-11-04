inherited frmConsDuplicidade: TfrmConsDuplicidade
  Left = 320
  Top = 48
  Caption = 'Consulta de Duplicidade'
  ClientHeight = 562
  ClientWidth = 784
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited sbPadrao: TStatusBar
    Top = 543
    Width = 784
  end
  inherited Panel1: TPanel
    Width = 784
    inherited btimprimir: TBitBtn [0]
      Left = 95
    end
    inherited btProximo: TBitBtn
      Left = 49
    end
    inherited btAnterior: TBitBtn [2]
      Left = 4
    end
    inherited btPesquisar: TBitBtn [3]
      Left = 229
      Visible = False
    end
    inherited btIncluir: TBitBtn [4]
      Visible = False
    end
    inherited btexcluir: TBitBtn [5]
      Visible = False
    end
    inherited bteditar: TBitBtn [6]
      Visible = False
    end
    inherited btgravar: TBitBtn [7]
      Visible = False
    end
    inherited btfechar: TBitBtn
      Left = 736
    end
    inherited btCancelar: TBitBtn
      Visible = False
    end
  end
  inherited Panel2: TPanel
    Width = 784
    Height = 491
    inherited pgGeral: TPageControl
      Width = 782
      Height = 489
      inherited tabLista: TTabSheet
        inherited Panel3: TPanel
          Width = 774
          Height = 461
          inherited grDados: TdxDBGrid
            Top = 21
            Width = 772
            Height = 439
            KeyField = 'NM_PACIENTE'
            Filter.Criteria = {00000000}
            object grDadosTOTAL: TdxDBGridMaskColumn
              Caption = 'Total Notifica'#231#227'o'
              Width = 91
              BandIndex = 0
              RowIndex = 0
              FieldName = 'TOTAL_NOTIFICACAO'
            end
            object grDadosNM_PACIENTE: TdxDBGridMaskColumn
              Caption = 'Nome do Utente'
              Width = 271
              BandIndex = 0
              RowIndex = 0
              FieldName = 'NM_PACIENTE'
            end
            object grDadosDT_NASCIMENTO: TdxDBGridDateColumn
              Caption = 'Dt. Nascimento'
              Width = 79
              BandIndex = 0
              RowIndex = 0
              FieldName = 'DT_NASCIMENTO'
            end
            object grDadosNM_MAE: TdxDBGridMaskColumn
              Caption = 'Nome da M'#227'e'
              Width = 304
              BandIndex = 0
              RowIndex = 0
              FieldName = 'NM_MAE'
            end
          end
          object Panel5: TPanel
            Left = 1
            Top = 1
            Width = 772
            Height = 20
            Align = alTop
            BevelInner = bvLowered
            Caption = 'AGRUPAMENTO TOTAL DE NOTIFICAC'#213'ES POR UTENTE'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 1
          end
        end
      end
      inherited tabGeral: TTabSheet
        Caption = 'Detalhes'
        inherited Panel4: TPanel
          Width = 774
          Height = 461
          object grDetalhe: TdxDBGrid
            Left = 1
            Top = 1
            Width = 772
            Height = 459
            Bands = <
              item
              end>
            DefaultLayout = True
            HeaderPanelRowCount = 1
            KeyField = 'CD_PACIENTE'
            ShowGroupPanel = True
            SummaryGroups = <>
            SummarySeparator = ', '
            Align = alClient
            BorderStyle = bsNone
            PopupMenu = PopupMenu2
            TabOrder = 0
            OnDblClick = grDadosDblClick
            DataSource = dsDetalhe
            Filter.Criteria = {00000000}
            OptionsBehavior = [edgoAutoSort, edgoDragScroll, edgoEditing, edgoEnterShowEditor, edgoImmediateEditor, edgoStoreToIniFile, edgoTabThrough, edgoVertThrough]
            OptionsView = [edgoBandHeaderWidth, edgoRowSelect, edgoUseBitmap]
            object grDetalheColumn8: TdxDBGridColumn
              Caption = 'C'#243'd. Utente'
              Width = 55
              BandIndex = 0
              RowIndex = 0
              FieldName = 'CD_PACIENTE'
            end
            object grDetalheColumn1: TdxDBGridColumn
              Caption = 'Nome Utente'
              Sorted = csUp
              Visible = False
              Width = 153
              BandIndex = 0
              RowIndex = 0
              FieldName = 'NM_PACIENTE'
              GroupIndex = 0
            end
            object grDetalheColumn2: TdxDBGridColumn
              Caption = 'Municipio Moradia'
              Width = 161
              BandIndex = 0
              RowIndex = 0
              FieldName = 'DS_MUNICIPIO'
            end
            object grDetalheColumn3: TdxDBGridColumn
              Caption = 'Provincia Moradia'
              Width = 163
              BandIndex = 0
              RowIndex = 0
              FieldName = 'DS_PROVINCIA'
            end
            object grDetalheColumn5: TdxDBGridColumn
              Caption = 'Estado Civil'
              Width = 74
              BandIndex = 0
              RowIndex = 0
              FieldName = 'ESTADO_CIVIL'
            end
            object grDetalheColumn6: TdxDBGridColumn
              Caption = 'N'#186' Notifica'#231#227'o'
              Width = 83
              BandIndex = 0
              RowIndex = 0
              FieldName = 'NR_NOTIFICACAO'
            end
            object grDetalheColumn7: TdxDBGridColumn
              Caption = 'Dt. Notifica'#231#227'o'
              Width = 83
              BandIndex = 0
              RowIndex = 0
              FieldName = 'DT_NOTIFICACAO'
            end
            object grDetalheColumn9: TdxDBGridColumn
              Caption = 'Unidade'
              BandIndex = 0
              RowIndex = 0
              FieldName = 'CD_UND'
            end
          end
        end
      end
      object TabSheet1: TTabSheet
        Caption = 'Utente'
        ImageIndex = 2
        inline framPaciente1: TframPaciente
          Left = 0
          Top = 0
          Width = 774
          Height = 461
          Align = alClient
          AutoScroll = False
          TabOrder = 0
          inherited GroupBox2: TGroupBox
            inherited btLocProvincia: TdxDBButtonEdit
              StoredValues = 64
              ExistButtons = True
            end
            inherited btLocMunicipio: TdxDBButtonEdit
              StoredValues = 64
              ExistButtons = True
            end
            inherited btLocProvinciaMor: TdxDBButtonEdit
              StoredValues = 64
              ExistButtons = True
            end
            inherited btLocMunicipioMor: TdxDBButtonEdit
              StoredValues = 64
              ExistButtons = True
            end
            inherited btLocPais: TdxDBButtonEdit
              StoredValues = 64
              ExistButtons = True
            end
            inherited btLocOcupacao: TdxDBButtonEdit
              StoredValues = 64
              ExistButtons = True
            end
            inherited dxDBEdit9: TdxDBEdit
              StoredValues = 64
            end
            inherited dxDBEdit10: TdxDBEdit
              StoredValues = 64
            end
            inherited dxDBEdit11: TdxDBEdit
              StoredValues = 64
            end
            inherited dxDBEdit12: TdxDBEdit
              StoredValues = 64
            end
            inherited dxDBEdit13: TdxDBEdit
              StoredValues = 64
            end
            inherited dxDBEdit14: TdxDBEdit
              StoredValues = 64
            end
            inherited pendereco: TPanel
              inherited Panel1: TPanel
                inherited dxDBMemo1: TdxDBMemo
                  Height = 54
                end
              end
            end
          end
        end
      end
    end
  end
  inherited dsGrid: TDataSource
    DataSet = qyGrid
  end
  object qyGrid: TIBQuery
    Database = DM.DB
    Transaction = DM.TS
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select  count(*) Total_notificacao'
      '     , PACIENTE.NM_PACIENTE'
      '     , PACIENTE.DT_NASCIMENTO'
      '     , PACIENTE.NM_MAE'
      'from NOTIFICACAO'
      '        inner join PACIENTE'
      '        on PACIENTE.CD_PACIENTE = NOTIFICACAO.CD_PACIENTE'
      '      and PACIENTE.CD_UND = NOTIFICACAO.CD_UND'
      'group by PACIENTE.NM_PACIENTE'
      '     , PACIENTE.DT_NASCIMENTO'
      '     , PACIENTE.NM_MAE'
      'having count(*) >= 2'
      '')
    Left = 341
    Top = 157
    object qyGridTOTAL_NOTIFICACAO: TIntegerField
      FieldName = 'TOTAL_NOTIFICACAO'
      Required = True
    end
    object qyGridNM_PACIENTE: TIBStringField
      FieldName = 'NM_PACIENTE'
      Origin = 'PACIENTE.NM_PACIENTE'
      Required = True
      Size = 50
    end
    object qyGridDT_NASCIMENTO: TDateField
      FieldName = 'DT_NASCIMENTO'
      Origin = 'PACIENTE.DT_NASCIMENTO'
      Required = True
    end
    object qyGridNM_MAE: TIBStringField
      FieldName = 'NM_MAE'
      Origin = 'PACIENTE.NM_MAE'
      Required = True
      Size = 50
    end
  end
  object dsDetalhe: TDataSource
    DataSet = qyPaciente
    Left = 381
    Top = 197
  end
  object qyPaciente: TIBQuery
    Database = DM.DB
    Transaction = DM.TS
    BufferChunks = 1000
    CachedUpdates = False
    DataSource = dsGrid
    SQL.Strings = (
      'select'
      'PA.CD_UND,'
      'PA.CD_PACIENTE,'
      'PA.NM_PACIENTE,'
      'PA.DT_NASCIMENTO,'
      'PA.NM_MAE,'
      'PA.ESTADO_CIVIL,'
      'N.DT_NOTIFICACAO,'
      'N.NR_NOTIFICACAO,'
      
        '(SELECT DS_MUNICIPIO FROM MUNICIPIO WHERE CD_MUNICIPIO = PA.CD_M' +
        'OR_MUNICIPIO)DS_MUNICIPIO,'
      
        '(SELECT DS_PROVINCIA FROM PROVINCIA WHERE CD_PROVINCIA = PA.CD_N' +
        'AR_PROVINCIA)DS_PROVINCIA'
      'from PACIENTE PA'
      ' inner join NOTIFICACAO N'
      '  on N.CD_PACIENTE = PA.CD_PACIENTE'
      ' and N.CD_UND = PA.CD_UND'
      'AND PA.NM_PACIENTE =:NM_PACIENTE')
    Left = 341
    Top = 197
    ParamData = <
      item
        DataType = ftString
        Name = 'NM_PACIENTE'
        ParamType = ptUnknown
        Size = 51
      end>
    object qyPacienteDT_NOTIFICACAO: TDateField
      FieldName = 'DT_NOTIFICACAO'
      Origin = 'NOTIFICACAO.DT_NOTIFICACAO'
      Required = True
    end
    object qyPacienteNR_NOTIFICACAO: TIBStringField
      FieldName = 'NR_NOTIFICACAO'
      Origin = 'NOTIFICACAO.NR_NOTIFICACAO'
      Size = 10
    end
    object qyPacienteCD_PACIENTE: TIntegerField
      FieldName = 'CD_PACIENTE'
      Origin = 'PACIENTE.CD_PACIENTE'
      Required = True
    end
    object qyPacienteNM_PACIENTE: TIBStringField
      FieldName = 'NM_PACIENTE'
      Origin = 'PACIENTE.NM_PACIENTE'
      Required = True
      Size = 50
    end
    object qyPacienteDT_NASCIMENTO: TDateField
      FieldName = 'DT_NASCIMENTO'
      Origin = 'PACIENTE.DT_NASCIMENTO'
      Required = True
    end
    object qyPacienteNM_MAE: TIBStringField
      FieldName = 'NM_MAE'
      Origin = 'PACIENTE.NM_MAE'
      Required = True
      Size = 50
    end
    object qyPacienteESTADO_CIVIL: TIntegerField
      FieldName = 'ESTADO_CIVIL'
      Origin = 'PACIENTE.ESTADO_CIVIL'
    end
    object qyPacienteDS_MUNICIPIO: TIBStringField
      FieldName = 'DS_MUNICIPIO'
      Origin = 'MUNICIPIO.DS_MUNICIPIO'
      Required = True
      Size = 50
    end
    object qyPacienteDS_PROVINCIA: TIBStringField
      FieldName = 'DS_PROVINCIA'
      Origin = 'PROVINCIA.DS_PROVINCIA'
      Required = True
      Size = 50
    end
    object qyPacienteCD_UND: TIntegerField
      FieldName = 'CD_UND'
      Origin = 'PACIENTE.CD_UND'
      Required = True
    end
  end
  object PopupMenu2: TPopupMenu
    Left = 413
    Top = 197
    object AbrirNotificao1: TMenuItem
      Bitmap.Data = {
        360C0000424D360C000000000000360000002800000020000000200000000100
        180000000000000C000000000000000000000000000000000000FFFFFFFFFFFF
        FFFFFFDBDBDB9494947070706060606868687070707070707070707070707070
        7070707070707070707070707070707070707070707070707070707070707070
        7070707070707070707070707070949494DBDBDBFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFF8D684A8D684A8D684A8D684A8D684A8D684A8D684A8D684A8D684A8D68
        4A8D684A8D684A8D684A8D684A8D684A8D684A8D684A8D684A8D684A8D684A8D
        684A8D684A8D684A8D684A8D684A707070CFCFCFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFF8F684BFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFF8F694C707070CFCFCFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFF916A4DFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFF906A4D707070CFCFCFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFF926B4FFFFFFFFFFEFEB08B6FB08B6FB08B6FB08B6FB08B6FB08B6FB08B
        6FB08B6FB08B6FB08B6FB08B6FB08B6FB08B6FFFFFFFB08B6FB08B6FB08B6FB0
        8B6FB08B6FFFFEFEFFFFFF916C4F707070CFCFCFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFF946D51FFFFFFFEFDFCB08B6FFEFDFCFEFDFCFEFDFCFEFDFCFEFDFCFEFD
        FCFEFDFCFEFDFCFEFDFCFEFDFCFEFDFCB08B6FFEFDFCB08B6FFEFDFCFEFDFCFE
        FDFCB08B6FFEFDFCFFFFFF936E51707070CFCFCFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFF957053FFFFFFFDFCFBB08B6FFDFCFBFDFCFBFDFCFBFDFCFBFDFCFBFDFC
        FBFDFCFBFDFCFBFDFCFBFDFCFBFDFCFBB08B6FFDFCFBB08B6FFDFCFBFDFCFBFD
        FCFBB08B6FFDFCFBFFFFFF966F53707070CFCFCFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFF977155FFFFFFFDFBF9B08B6FB08B6FB08B6FB08B6FB08B6FB08B6FB08B
        6FB08B6FB08B6FB08B6FB08B6FB08B6FB08B6FFDFAF9B08B6FB08B6FB08B6FB0
        8B6FB08B6FFDFAF9FFFFFF987155707070CFCFCFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFF9A7457FFFFFFFCF9F7B08B6FFCF9F7FCF9F7FCF9F7FCF9F7FCF9F7FCF9
        F7FCF9F7FCF9F7FCF9F7FCF9F7FCF9F7B08B6FFCF9F7B08B6FFCF9F7FCF9F7FC
        F9F7B08B6FFCF9F7FFFFFF9A7457707070CFCFCFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFF9B765AFFFFFFFBF7F5B08B6FFBF7F5FBF7F5FBF7F5FBF7F5FBF7F5FBF7
        F5FBF7F5FBF7F5FBF8F5FBF7F5FBF7F5B08B6FFBF7F5B08B6FFBF7F5FBF7F5FB
        F7F5B08B6FFBF7F5FFFFFF9C765A707070CFCFCFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFF9E795CFFFFFFFAF6F3B08B6FFAF6F3FAF6F3FAF6F3FAF6F3FAF6F3FAF6
        F3FAF6F3FAF6F3FAF6F3FAF6F3FAF6F3B08B6FFAF6F3B08B6FFAF6F3FAF6F3FA
        F6F3B08B6FFAF6F3FFFFFF9E785C707070CFCFCFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFA07A5EFFFFFFF9F4F0B08B6FF9F4F0F9F4F0F9F4F0F9F4F0F9F4F0F9F4
        F0F9F4F0F9F4F0F9F4F0F9F4F0F9F4F0B08B6FF9F4F1B08B6FF9F4F0F9F4F0F9
        F4F0B08B6FF9F4F0FFFFFFA07A5E707070CFCFCFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFA27C60FFFFFFF8F2EEB08B6FF8F2EEF8F2EEF8F3EEF8F2EEF8F2EEF8F3
        EEF8F2EEF8F2EEF8F2EEF8F2EEF8F2EEB08B6FF8F2EEB08B6FF8F2EEF8F2EEF8
        F2EEB08B6FF8F2EEFFFFFFA37D61707070CFCFCFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFA57F63FFFFFFF7F0EBB08B6FF7F0EBF7F0EBF7F0ECF7F0EBF7F0EBF7F0
        ECF7F0EBF7F1ECF7F0EBF7F0EBF7F0EBB08B6FF7F0EBB08B6FF7F0EBF7F0EBF7
        F0EBB08B6FF7F0EBFFFFFFA57F63707070CFCFCFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFA78166FFFFFFF6EEE9B08B6FB08B6FB08B6FB08B6FB08B6FB08B6FB08B
        6FB08B6FB08B6FB08B6FB08B6FB08B6FB08B6FF6EFE9B08B6FB08B6FB08B6FB0
        8B6FB08B6FF6EEE9FFFFFFA88266707070CFCFCFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFAA8468FFFFFFF5EDE7B08B6FF5EDE6F5EDE6F5EDE6F5EDE6F5EDE6F5ED
        E6F5EDE6F5EDE6F5EDE6F5EDE6F5EDE6B08B6FF5EDE6B08B6FF5EDE6F5EDE6F5
        EDE6B08B6FF5EDE7FFFFFFAA8468707070CFCFCFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFAC866AFFFFFFF4EAE3B08B6FF4EAE3F4EBE3F4EBE3F4EAE3F4EBE3F4EB
        E3F4EAE3F4EAE3F4EAE3F4EAE3F4EAE4B08B6FF4EAE3B08B6FF4EAE3F4EAE3F4
        EAE3B08B6FF4EAE3FFFFFFAC876B707070CFCFCFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFAE896DFFFFFFF3E8E1B08B6FB08B6FB08B6FB08B6FB08B6FB08B6FB08B
        6FB08B6FB08B6FB08B6FB08B6FB08B6FB08B6FF3E8E1B08B6FB08B6FB08B6FB0
        8B6FB08B6FF3E8E1FFFFFFAE896D707070CFCFCFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFB08B6FFFFFFFF2E7DEB08B6FF2E7DEF2E7DEF2E7DEF2E7DEF2E7DEF2E7
        DEF2E7DEF2E7DEF2E7DEF2E7DFF2E7DEB08B6FF2E7DEB08B6FF2E7DEF2E7DEF2
        E7DEB08B6FF2E7DEFFFFFFB18B70707070CFCFCFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFB28E72FFFFFFF1E5DCB08B6FF1E5DCF1E5DCF1E5DCF1E5DCF1E5DCF1E5
        DCF1E5DCF1E5DCF1E5DCF1E5DCF1E5DCB08B6FF1E5DCB08B6FF1E5DCF1E5DCF1
        E5DCB08B6FF1E5DCFFFFFFB38E72707070CFCFCFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFB69074FFFFFFF0E3D9B08B6FB08B6FB08B6FB08B6FB08B6FB08B6FB08B
        6FB08B6FB08B6FB08B6FB08B6FB08B6FB08B6FF0E3D9B08B6FB08B6FB08B6FB0
        8B6FB08B6FF0E3D9FFFFFFB59074707070CFCFCFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFB89376FFFFFFEFE2D7B08B6FEFE1D7EFE1D7EFE2D7EFE1D7EFE1D7EFE2
        D7EFE1D7EFE1D7EFE1D7EFE1D7EFE1D7B08B6FEFE1D7B08B6FEFE1D7EFE1D7EF
        E1D7B08B6FEFE1D7FFFFFFB79277707070CFCFCFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFBA957AFFFFFFEEDFD4B08B6FEEDFD5EEDFD4EEDFD4EEDFD5EEDFD4EEDF
        D4EEE0D4EEDFD4EEDFD4EEE0D4EEDFD4B08B6FEEDFD4B08B6FEEDFD4EEDFD4EE
        DFD4B08B6FEDDED2FFFFFFBA9579707070CFCFCFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFBC967BFFFFFFEDDED2B08B6FEDDED20000000000000000000000000000
        00000000000000000000000000EDDED2B08B6FEDDED2B08B6FEDDED2000000ED
        DED2B08B6FEDDED2FFFFFFBB977C707070CFCFCFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFBE987EFFFFFFECDCD0B08B6FECDCD0ECDCD0ECDDD0ECDCD0ECDCD0ECDD
        D0ECDCD0ECDCD1ECDCD0ECDCD0ECDCD0B08B6FECDCD0B08B6FECDCD0ECDCD0EC
        DCD0B08B6FECDCD0FFFFFFBE997E707070CFCFCFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFC09B80FFFFFFEBDBCEB08B6FB08B6FB08B6FB08B6FB08B6FB08B6FB08B
        6FB08B6FB08B6FB08B6FB08B6FB08B6FB08B6FEBDBCEB08B6FB08B6FB08B6FB0
        8B6FB08B6FEBDBCEFFFFFFC09A80707070CFCFCFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFC19D81FFFFFFEBD9CCEBD9CCEBD9CCEBD9CDEBDACCEBD9CCEBD9CDEBDA
        CCEBD9CDEBD9CCEBD9CCEBD9CCEBD9CCEBD9CCEBD9CCEBD9CCEBD9CCEBD9CCEB
        D9CCEBD9CCEBD9CCFFFFFFC09C81707070CFCFCFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFC39E83FFFFFFEAD8CBEAD9CB000000000000000000EAD8CBEAD8CB0000
        0000000000000000000000000000000000000000000000000000000000000000
        0000EAD8CBEAD8CBFFFFFFC19D81707070CFCFCFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFC4A084FFFFFFE9D7C9E9D7C9E9D7C9E9D7C9E9D7C9E9D7C9E9D7C9E9D7
        C9E9D7C9E9D7C9E9D7C9E9D7C9E9D7C9E9D7C9E9D7C9E9D7C9E9D7C9E9D7C9E9
        D7C9E9D7C9E9D7C9FFFFFFC4A0846F6F6FCFCFCFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFC6A186FFFFFFDEC9B9DEC9B9DEC9B9DEC9B9DEC9B9DEC9B9DEC9B9DEC9
        B9DEC9B9DEC9B9DEC9B9DEC9B9DEC9B9DEC9B9DEC9B9DEC9B9DEC9B9DEC9B9DE
        C9B9DEC9B9DEC9B9FFFFFFC6A186707070D0D0D0FFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFC7A388FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFC7A388838383D9D9D9FFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFC8A389C8A489C8A489C8A388C8A388C8A389C8A389C8A388C8A389C8A3
        89C8A489C8A489C8A389C8A488C8A488C8A389C8A489C8A388C8A388C8A488C8
        A488C8A488C8A488C8A488C8A488B6B6B6EEEEEEFFFFFFFFFFFF}
      Caption = 'Abrir Notifica'#231#227'o'
      OnClick = AbrirNotificao1Click
    end
    object AbrirCadUtente1: TMenuItem
      Caption = 'Abrir Cad. Utente'
    end
    object N1: TMenuItem
      Caption = '-'
    end
    object Eliminar1: TMenuItem
      Caption = 'Eliminar'
    end
  end
end
