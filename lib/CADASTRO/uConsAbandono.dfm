inherited frmConsAbandono: TfrmConsAbandono
  Left = 283
  Top = 74
  Caption = 'Consulta de Abandono'
  ClientHeight = 569
  ClientWidth = 1016
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited sbPadrao: TStatusBar
    Top = 550
    Width = 1016
  end
  inherited Panel1: TPanel
    Width = 1016
    inherited btfechar: TBitBtn
      Left = 968
    end
  end
  inherited Panel2: TPanel
    Width = 1016
    Height = 498
    inherited pgGeral: TPageControl
      Width = 1014
      Height = 496
      ActivePage = tabGeral
      object tabFaltantes: TTabSheet [0]
        Caption = 'Faltantes'
        ImageIndex = 2
        object dxDBGrid2: TdxDBGrid
          Left = 0
          Top = 0
          Width = 1006
          Height = 468
          Bands = <
            item
            end>
          DefaultLayout = True
          HeaderPanelRowCount = 1
          KeyField = 'CD_PACIENTE'
          ShowGroupPanel = True
          SummaryGroups = <
            item
              DefaultGroup = True
              SummaryItems = <
                item
                  SummaryField = 'NM_PACIENTE'
                  SummaryFormat = '(TOTAL=0)'
                  SummaryType = cstCount
                end>
              Name = 'grDadosSummaryGroup1'
            end>
          SummarySeparator = ', '
          Align = alClient
          BorderStyle = bsNone
          PopupMenu = PopupMenu1
          TabOrder = 0
          DataSource = dsAgenda
          Filter.Criteria = {00000000}
          GroupPanelColor = 12615680
          OptionsBehavior = [edgoAutoSort, edgoDragScroll, edgoEditing, edgoEnterShowEditor, edgoImmediateEditor, edgoStoreToIniFile, edgoTabThrough, edgoVertThrough]
          OptionsView = [edgoBandHeaderWidth, edgoRowSelect, edgoUseBitmap]
          ShowRowFooter = True
          object dxDBGrid2CD_PACIENTE: TdxDBGridMaskColumn
            Caption = 'Cod. Utente'
            Width = 60
            BandIndex = 0
            RowIndex = 0
            FieldName = 'CD_PACIENTE'
          end
          object dxDBGrid2NM_PACIENTE: TdxDBGridMaskColumn
            Caption = 'Nome Utente'
            Width = 265
            BandIndex = 0
            RowIndex = 0
            FieldName = 'NM_PACIENTE'
          end
          object dxDBGrid2Column6: TdxDBGridColumn
            Caption = 'Fone 1'
            Width = 85
            BandIndex = 0
            RowIndex = 0
            FieldName = 'NR_TEL_1'
          end
          object dxDBGrid2Column7: TdxDBGridColumn
            Caption = 'Fone 2'
            Width = 85
            BandIndex = 0
            RowIndex = 0
          end
          object dxDBGrid2NR_PROCESSO: TdxDBGridMaskColumn
            Caption = 'N'#186' Processo'
            Width = 77
            BandIndex = 0
            RowIndex = 0
            FieldName = 'NR_PROCESSO'
          end
          object dxDBGrid2ULTIMA_DATA: TdxDBGridDateColumn
            Caption = 'Dt. Agendamento'
            Width = 116
            BandIndex = 0
            RowIndex = 0
            FieldName = 'ULTIMA_DATA'
          end
          object dxDBGrid2Column5: TdxDBGridColumn
            Caption = 'Dias Faltantes'
            Width = 73
            BandIndex = 0
            RowIndex = 0
            OnCustomDrawCell = dxDBGrid2Column5CustomDrawCell
            FieldName = 'NR_DIAS'
          end
          object dxDBGrid2Column8: TdxDBGridColumn
            Sorted = csUp
            Visible = False
            BandIndex = 0
            RowIndex = 0
            FieldName = 'DS_UNIDADE'
            SummaryFooterType = cstCount
            SummaryFooterField = 'Total 0'
            GroupIndex = 1
            SummaryType = cstCount
            SummaryFormat = 'Total 0'
          end
          object dxDBGrid2Column9: TdxDBGridColumn
            Caption = 'Tipo'
            Sorted = csUp
            Visible = False
            BandIndex = 0
            RowIndex = 0
            FieldName = 'TIPO'
            GroupIndex = 0
          end
          object dxDBGrid2NM_MEDICO: TdxDBGridMaskColumn
            Caption = 'Agenda M'#233'dico'
            Width = 195
            BandIndex = 0
            RowIndex = 0
            FieldName = 'NM_MEDICO'
          end
        end
      end
      object tabAbandono: TTabSheet [1]
        Caption = 'Abandono'
        ImageIndex = 4
      end
      inherited tabLista: TTabSheet
        Caption = 'Motivo'
        inherited Panel3: TPanel
          Width = 1006
          Height = 468
          inherited grDados: TdxDBGrid
            Width = 1004
            Height = 466
            Bands = <
              item
                Width = 269
              end
              item
                Caption = #218'ltimo Contato'
                Width = 285
              end>
            DefaultLayout = False
            KeyField = 'CD_ABANDONO_HIST'
            Filter.Criteria = {00000000}
            GroupPanelColor = clMaroon
            ShowBands = True
            object grDadosCD_PACIENTE: TdxDBGridMaskColumn
              Caption = 'C'#243'd. Utente'
              Width = 63
              BandIndex = 0
              RowIndex = 0
              FieldName = 'CD_PACIENTE'
            end
            object grDadosNM_PACIENTE: TdxDBGridMaskColumn
              Caption = 'Nome Utente'
              Width = 244
              BandIndex = 0
              RowIndex = 0
              FieldName = 'NM_PACIENTE'
            end
            object grDadosDT_CONTATO: TdxDBGridDateColumn
              Caption = 'Data'
              Width = 93
              BandIndex = 1
              RowIndex = 0
              FieldName = 'DT_CONTATO'
            end
            object grDadosNM_RESP_CONTATO: TdxDBGridMaskColumn
              Caption = 'Responsavel'
              Width = 159
              BandIndex = 1
              RowIndex = 0
              FieldName = 'NM_RESP_CONTATO'
            end
            object grDadosDS_TIPO_ABANDONO: TdxDBGridMaskColumn
              Caption = 'Motivo do abandono'
              Width = 195
              BandIndex = 1
              RowIndex = 0
              FieldName = 'DS_TIPO_ABANDONO'
            end
          end
        end
      end
      inherited tabGeral: TTabSheet
        Caption = 'Detalhes'
        inherited Panel4: TPanel
          Width = 1006
          Height = 468
          object Label1: TLabel
            Left = 8
            Top = 8
            Width = 33
            Height = 13
            Caption = 'C'#243'digo'
            FocusControl = DBEdit1
          end
          object Label2: TLabel
            Left = 8
            Top = 48
            Width = 32
            Height = 13
            Caption = 'Utente'
          end
          object Label3: TLabel
            Left = 72
            Top = 8
            Width = 23
            Height = 13
            Caption = 'Data'
            FocusControl = DBEdit3
          end
          object Label4: TLabel
            Left = 202
            Top = 136
            Width = 125
            Height = 13
            Caption = 'Responsavel pelo Contato'
            FocusControl = DBEdit4
          end
          object Label6: TLabel
            Left = 8
            Top = 136
            Width = 50
            Height = 13
            Caption = 'Informante'
            FocusControl = DBEdit5
          end
          object Label5: TLabel
            Left = 512
            Top = 8
            Width = 104
            Height = 13
            Caption = 'Detalhe do Abandono'
          end
          object Label7: TLabel
            Left = 8
            Top = 176
            Width = 21
            Height = 13
            Caption = 'Tipo'
            FocusControl = DBEdit5
          end
          object Label8: TLabel
            Left = 8
            Top = 88
            Width = 95
            Height = 13
            Caption = 'Contatos do Utente:'
          end
          object DBEdit1: TDBEdit
            Left = 8
            Top = 24
            Width = 64
            Height = 21
            TabStop = False
            Color = cl3DLight
            DataField = 'CD_ABANDONO_HIST'
            DataSource = dsControle
            ReadOnly = True
            TabOrder = 0
          end
          object DBEdit3: TDBEdit
            Left = 74
            Top = 24
            Width = 105
            Height = 21
            TabStop = False
            Color = cl3DLight
            DataField = 'DT_CONTATO'
            DataSource = dsControle
            ReadOnly = True
            TabOrder = 1
          end
          object DBEdit4: TDBEdit
            Left = 202
            Top = 152
            Width = 249
            Height = 21
            CharCase = ecUpperCase
            DataField = 'NM_RESP_CONTATO'
            DataSource = dsControle
            TabOrder = 8
          end
          object DBEdit5: TDBEdit
            Left = 8
            Top = 152
            Width = 193
            Height = 21
            CharCase = ecUpperCase
            DataField = 'NM_INFORMANTE'
            DataSource = dsControle
            TabOrder = 7
          end
          object DBMemo1: TDBMemo
            Left = 512
            Top = 24
            Width = 241
            Height = 141
            DataField = 'DS_DETALHE_ABANDONO'
            DataSource = dsControle
            TabOrder = 10
          end
          object DBCheckBox1: TDBCheckBox
            Left = 248
            Top = 26
            Width = 153
            Height = 17
            Caption = 'Utente encontrado'
            DataField = 'FL_ENCONTRADO'
            DataSource = dsControle
            TabOrder = 2
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object dxDBEdit9: TdxDBEdit
            Left = 83
            Top = 63
            Width = 366
            Color = cl3DLight
            TabOrder = 4
            TabStop = False
            CharCase = ecUpperCase
            DataField = 'NM_PACIENTE'
            DataSource = dsControle
            ReadOnly = True
            StoredValues = 64
          end
          object RxDBLookupCombo1: TRxDBLookupCombo
            Left = 8
            Top = 192
            Width = 443
            Height = 21
            DropDownCount = 8
            DataField = 'TP_ABANDONO'
            DataSource = dsControle
            LookupField = 'CD_TIPO_ABANDONO'
            LookupDisplay = 'DS_TIPO_ABANDONO'
            LookupSource = dsTipo
            TabOrder = 9
          end
          object dxDBEdit1: TdxDBEdit
            Left = 8
            Top = 63
            Width = 74
            Color = cl3DLight
            TabOrder = 3
            TabStop = False
            DataField = 'CD_PACIENTE'
            DataSource = dsControle
            ReadOnly = True
            StoredValues = 64
          end
          object dxDBEdit2: TdxDBEdit
            Left = 8
            Top = 103
            Width = 153
            Color = cl3DLight
            TabOrder = 5
            TabStop = False
            DataField = 'NR_TEL_1'
            DataSource = dsControle
            ReadOnly = True
            StoredValues = 64
          end
          object dxDBEdit3: TdxDBEdit
            Left = 163
            Top = 103
            Width = 153
            Color = cl3DLight
            TabOrder = 6
            TabStop = False
            DataField = 'NR_TEL_2'
            DataSource = dsControle
            ReadOnly = True
            StoredValues = 64
          end
        end
      end
      object tabHistorico: TTabSheet
        Caption = 'Historico'
        ImageIndex = 3
        object dxDBGrid1: TdxDBGrid
          Left = 0
          Top = 0
          Width = 1006
          Height = 468
          Bands = <
            item
            end>
          DefaultLayout = True
          HeaderPanelRowCount = 1
          KeyField = 'CD_AGENDA'
          ShowGroupPanel = True
          SummaryGroups = <
            item
              DefaultGroup = True
              SummaryItems = <
                item
                  ColumnName = 'grDadosNM_PACIENTE'
                  SummaryField = 'NM_PACIENTE'
                  SummaryFormat = '(TOTAL=0)'
                  SummaryType = cstCount
                end>
              Name = 'grDadosSummaryGroup1'
            end>
          SummarySeparator = ', '
          Align = alClient
          BorderStyle = bsNone
          TabOrder = 0
          OnDblClick = grDadosDblClick
          DataSource = dsHistorico
          Filter.Criteria = {00000000}
          GroupPanelColor = 12615680
          OptionsBehavior = [edgoAutoSort, edgoDragScroll, edgoEditing, edgoEnterShowEditor, edgoImmediateEditor, edgoStoreToIniFile, edgoTabThrough, edgoVertThrough]
          OptionsView = [edgoBandHeaderWidth, edgoRowSelect, edgoUseBitmap]
          ShowRowFooter = True
          object grDadosNM_MEDICO: TdxDBGridMaskColumn
            Caption = 'M'#233'dico'
            Width = 174
            BandIndex = 0
            RowIndex = 0
            FieldName = 'NM_MEDICO'
          end
          object grDadosColumn7: TdxDBGridColumn
            Caption = 'Nr. Processo'
            Width = 80
            BandIndex = 0
            RowIndex = 0
            FieldName = 'NR_PROCESSO'
          end
          object grDadosDT_AGENDA: TdxDBGridDateColumn
            Caption = 'Data'
            Width = 66
            BandIndex = 0
            RowIndex = 0
            FieldName = 'DT_AGENDA'
          end
          object grDadosColumn12: TdxDBGridColumn
            Caption = 'OMS'
            Width = 57
            BandIndex = 0
            RowIndex = 0
          end
          object dxDBGridMaskColumn1: TdxDBGridMaskColumn
            Caption = 'CID'
            Width = 55
            BandIndex = 0
            RowIndex = 0
          end
          object grDadosVL_CD4: TdxDBGridMaskColumn
            Caption = 'CD4'
            Width = 49
            BandIndex = 0
            RowIndex = 0
            FieldName = 'VL_CD4'
          end
          object grDadosColumn6: TdxDBGridColumn
            Caption = 'Esquema'
            Width = 148
            BandIndex = 0
            RowIndex = 0
            FieldName = 'DS_ESQUEMA'
          end
          object grDadosDS_UNIDADE: TdxDBGridMaskColumn
            Caption = 'Unidade'
            Sorted = csUp
            Visible = False
            Width = 78
            BandIndex = 0
            RowIndex = 0
            FieldName = 'DS_UNIDADE'
            GroupIndex = 0
          end
          object grDadosColumn8: TdxDBGridColumn
            Caption = 'Confirmado'
            Width = 62
            BandIndex = 0
            RowIndex = 0
            FieldName = 'CONFIRMADO'
          end
          object grDadosColumn9: TdxDBGridColumn
            Caption = 'Realizado'
            Width = 57
            BandIndex = 0
            RowIndex = 0
            FieldName = 'REALIZADO'
          end
          object grDadosColumn10: TdxDBGridColumn
            Caption = 'Remarcado'
            Width = 61
            BandIndex = 0
            RowIndex = 0
            FieldName = 'REMARCADO'
          end
          object grDadosColumn11: TdxDBGridColumn
            Caption = 'Transferido'
            Width = 59
            BandIndex = 0
            RowIndex = 0
            FieldName = 'TRANSFERIDO'
          end
        end
      end
    end
  end
  inherited dsControle: TDataSource
    DataSet = DMGERAL.TB_ABANDONO
    Top = 181
  end
  inherited dsGrid: TDataSource
    DataSet = qyAbandono
    Left = 373
    Top = 181
  end
  inherited PopupMenu1: TPopupMenu
    object N1: TMenuItem
      Caption = '-'
    end
    object imAbrirNotificacao: TMenuItem
      Caption = 'Abrir Notifica'#231#227'o'
      OnClick = AbrirNotificao1Click
    end
  end
  object qyTipo: TIBQuery
    Database = DM.DB
    Transaction = DM.TS
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select CD_TIPO_ABANDONO, DS_TIPO_ABANDONO from TIPO_ABANDONO')
    Left = 349
    Top = 214
    object qyTipoCD_TIPO_ABANDONO: TIntegerField
      FieldName = 'CD_TIPO_ABANDONO'
      Origin = 'TIPO_ABANDONO.CD_TIPO_ABANDONO'
      Required = True
    end
    object qyTipoDS_TIPO_ABANDONO: TIBStringField
      FieldName = 'DS_TIPO_ABANDONO'
      Origin = 'TIPO_ABANDONO.DS_TIPO_ABANDONO'
      Size = 100
    end
  end
  object dsTipo: TDataSource
    AutoEdit = False
    DataSet = qyTipo
    Left = 381
    Top = 213
  end
  object qyAgenda: TIBQuery
    Database = DM.DB
    Transaction = DM.TS
    BeforeOpen = qyAgendaBeforeOpen
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select'
      ' A.dt_agenda ultima_data,'
      ' trunc(cast('#39'now'#39' as timestamp) - A.DT_AGENDA) nr_dias,'
      
        ' IIF(trunc(cast('#39'now'#39' as timestamp) - A.DT_AGENDA) <:nDiasAbando' +
        'no,'#39'Faltoso'#39','#39'Abandono'#39') Tipo,'
      ' PACIENTE.cd_paciente,'
      ' PACIENTE.cd_und,'
      ' PACIENTE.NM_PACIENTE,'
      ' PACIENTE.nr_processo,'
      ' PACIENTE.nr_tel_1,'
      ' PACIENTE.nr_tel_2,'
      ' A.fl_realizado,'
      ' A.fl_parecer,'
      ' A.fl_remarcado,'
      
        '(select ds_unidade from unidade where cd_unidade = paciente.cd_u' +
        'nidade) ds_unidade,'
      
        '(select NM_MEDICO from MEDICO where MEDICO.CD_MEDICO = A.CD_MEDI' +
        'CO) NM_MEDICO'
      'from AGENDA A'
      'join PACIENTE'
      '  on PACIENTE.cd_paciente = A.cd_paciente'
      '  and PACIENTE.cd_und = A.cd_und'
      'where (A.fl_realizado = 0'
      'and ((A.fl_parecer = 0) or (A.fl_parecer is null))'
      'and ((A.fl_remarcado = 0) or (A.fl_remarcado is null)))'
      'and  not exists(select 1 from agenda X'
      '  where X.cd_paciente = A.cd_paciente'
      '  and X.dt_agenda > A.dt_agenda)'
      'and PACIENTE.cd_unidade = :cd_unidade'
      '/*and trunc(cast('#39'now'#39' as timestamp) - A.DT_AGENDA) >0*/'
      'and  A.DT_AGENDA < (cast('#39'now'#39' as timestamp)-1)'
      '/*TIPO*/'
      'order by ds_unidade, nr_dias')
    Left = 434
    Top = 285
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'nDiasAbandono'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cd_unidade'
        ParamType = ptUnknown
      end>
    object qyAgendaCD_PACIENTE: TIntegerField
      FieldName = 'CD_PACIENTE'
      Origin = 'AGENDA.CD_PACIENTE'
    end
    object qyAgendaNM_PACIENTE: TIBStringField
      FieldName = 'NM_PACIENTE'
      Origin = 'PACIENTE.NM_PACIENTE'
      Required = True
      Size = 50
    end
    object qyAgendaNR_PROCESSO: TIntegerField
      FieldName = 'NR_PROCESSO'
      Origin = 'PACIENTE.NR_PROCESSO'
    end
    object qyAgendaNR_TEL_1: TIBStringField
      FieldName = 'NR_TEL_1'
      Origin = 'PACIENTE.NR_TEL_1'
    end
    object qyAgendaNR_TEL_2: TIBStringField
      FieldName = 'NR_TEL_2'
      Origin = 'PACIENTE.NR_TEL_2'
    end
    object qyAgendaULTIMA_DATA: TDateTimeField
      FieldName = 'ULTIMA_DATA'
      Origin = 'AGENDA.DT_AGENDA'
    end
    object qyAgendaNR_DIAS: TLargeintField
      FieldName = 'NR_DIAS'
    end
    object qyAgendaFL_REALIZADO: TIntegerField
      FieldName = 'FL_REALIZADO'
      Origin = 'AGENDA.FL_REALIZADO'
    end
    object qyAgendaFL_PARECER: TIntegerField
      FieldName = 'FL_PARECER'
      Origin = 'AGENDA.FL_PARECER'
    end
    object qyAgendaFL_REMARCADO: TIntegerField
      FieldName = 'FL_REMARCADO'
      Origin = 'AGENDA.FL_REMARCADO'
    end
    object qyAgendaDS_UNIDADE: TIBStringField
      DisplayLabel = 'Unidade'
      FieldName = 'DS_UNIDADE'
      Size = 50
    end
    object qyAgendaCD_UND2: TIntegerField
      FieldName = 'CD_UND'
      Origin = 'PACIENTE.CD_UND'
      Required = True
    end
    object qyAgendaTIPO: TIBStringField
      FieldName = 'TIPO'
      Required = True
      FixedChar = True
      Size = 8
    end
    object qyAgendaNM_MEDICO2: TIBStringField
      FieldName = 'NM_MEDICO'
      Size = 50
    end
  end
  object dsAgenda: TDataSource
    DataSet = qyAgenda
    Left = 469
    Top = 285
  end
  object qyAbandono: TIBQuery
    Database = DM.DB
    Transaction = DM.TS
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select ABANDONO_HIST.*,'
      ' PACIENTE.NM_PACIENTE,'
      ' PACIENTE.NR_TEL_1,'
      ' PACIENTE.NR_TEL_2,'
      '(select DS_TIPO_ABANDONO from TIPO_ABANDONO'
      
        ' where CD_TIPO_ABANDONO = ABANDONO_HIST.TP_ABANDONO)DS_TIPO_ABAN' +
        'DONO'
      'from ABANDONO_HIST'
      ' inner join PACIENTE'
      ' on PACIENTE.CD_PACIENTE = ABANDONO_HIST.CD_PACIENTE'
      ' and PACIENTE.CD_UND = ABANDONO_HIST.CD_UND')
    Left = 301
    Top = 293
    object qyAbandonoDT_CONTATO: TDateTimeField
      FieldName = 'DT_CONTATO'
      Origin = 'ABANDONO_HIST.DT_CONTATO'
    end
    object qyAbandonoNM_RESP_CONTATO: TIBStringField
      FieldName = 'NM_RESP_CONTATO'
      Origin = 'ABANDONO_HIST.NM_RESP_CONTATO'
      Size = 50
    end
    object qyAbandonoDS_DETALHE_ABANDONO: TIBStringField
      FieldName = 'DS_DETALHE_ABANDONO'
      Origin = 'ABANDONO_HIST.DS_DETALHE_ABANDONO'
      Size = 500
    end
    object qyAbandonoNM_INFORMANTE: TIBStringField
      FieldName = 'NM_INFORMANTE'
      Origin = 'ABANDONO_HIST.NM_INFORMANTE'
      Size = 100
    end
    object qyAbandonoCD_PACIENTE: TIntegerField
      FieldName = 'CD_PACIENTE'
      Origin = 'ABANDONO_HIST.CD_PACIENTE'
    end
    object qyAbandonoNM_PACIENTE: TIBStringField
      FieldName = 'NM_PACIENTE'
      Size = 50
    end
    object qyAbandonoDS_TIPO_ABANDONO: TIBStringField
      FieldName = 'DS_TIPO_ABANDONO'
      Size = 100
    end
    object qyAbandonoNR_TEL_1: TIBStringField
      FieldName = 'NR_TEL_1'
    end
    object qyAbandonoNR_TEL_2: TIBStringField
      FieldName = 'NR_TEL_2'
    end
    object qyAbandonoCD_ABANDONO_HIST: TIntegerField
      FieldName = 'CD_ABANDONO_HIST'
      Origin = 'ABANDONO_HIST.CD_ABANDONO_HIST'
      Required = True
    end
    object qyAbandonoTP_ABANDONO: TIntegerField
      FieldName = 'TP_ABANDONO'
      Origin = 'ABANDONO_HIST.TP_ABANDONO'
    end
  end
  object qyHistorico: TIBQuery
    Database = DM.DB
    Transaction = DM.TS
    BeforeOpen = qyAgendaBeforeOpen
    BufferChunks = 1000
    CachedUpdates = False
    DataSource = dsAgenda
    SQL.Strings = (
      'select '
      'AGENDA.*, '
      'IIF(FL_CONFIRMADO=1,'#39'SIM'#39','#39'NAO'#39') CONFIRMADO,'
      'IIF(FL_REALIZADO=1,'#39'SIM'#39','#39'NAO'#39') REALIZADO,'
      'IIF(FL_REMARCADO=1,'#39'SIM'#39','#39'NAO'#39') REMARCADO,'
      'IIF(FL_TRANSFERIDO=1,'#39'SIM'#39','#39'NAO'#39') TRANSFERIDO,'
      'PACIENTE.*,'
      '(select DS_UNIDADE from UNIDADE'
      'where CD_UNIDADE = PACIENTE.CD_UNIDADE)DS_UNIDADE,'
      '(select NM_MEDICO from MEDICO'
      'where CD_MEDICO = AGENDA.CD_MEDICO)NM_MEDICO'
      'from "AGENDA",  PACIENTE, UNIDADE, MEDICO'
      'WHERE PACIENTE.CD_PACIENTE = AGENDA.CD_PACIENTE'
      'AND AGENDA.CD_MEDICO = MEDICO.CD_MEDICO'
      'AND AGENDA.CD_UNIDADE = UNIDADE.CD_UNIDADE'
      'AND PACIENTE.CD_PACIENTE = :CD_PACIENTE'
      'AND PACIENTE.CD_UND = :CD_UND'
      'ORDER BY AGENDA.DT_AGENDA DESC')
    Left = 414
    Top = 379
    ParamData = <
      item
        DataType = ftInteger
        Name = 'CD_PACIENTE'
        ParamType = ptUnknown
        Size = 4
      end
      item
        DataType = ftInteger
        Name = 'CD_UND'
        ParamType = ptUnknown
        Size = 4
      end>
    object qyAgendaCD_AGENDA: TIntegerField
      FieldName = 'CD_AGENDA'
      Origin = 'AGENDA.CD_AGENDA'
      Required = True
    end
    object IntegerField1: TIntegerField
      FieldName = 'CD_PACIENTE'
      Origin = 'AGENDA.CD_PACIENTE'
    end
    object qyAgendaDT_AGENDA: TDateTimeField
      FieldName = 'DT_AGENDA'
      Origin = 'AGENDA.DT_AGENDA'
    end
    object qyAgendaCD_UNIDADE: TIntegerField
      FieldName = 'CD_UNIDADE'
      Origin = 'AGENDA.CD_UNIDADE'
    end
    object qyAgendaCD_MEDICO: TIntegerField
      FieldName = 'CD_MEDICO'
      Origin = 'AGENDA.CD_MEDICO'
    end
    object IntegerField2: TIntegerField
      FieldName = 'FL_REMARCADO'
      Origin = 'AGENDA.FL_REMARCADO'
    end
    object IntegerField3: TIntegerField
      FieldName = 'FL_REALIZADO'
      Origin = 'AGENDA.FL_REALIZADO'
    end
    object qyAgendaTP_ESQUEMA: TIntegerField
      FieldName = 'TP_ESQUEMA'
      Origin = 'AGENDA.TP_ESQUEMA'
    end
    object qyAgendaVL_CD4: TIntegerField
      FieldName = 'VL_CD4'
      Origin = 'AGENDA.VL_CD4'
    end
    object IBStringField1: TIBStringField
      FieldName = 'NM_PACIENTE'
      Size = 50
    end
    object IBStringField2: TIBStringField
      FieldName = 'DS_UNIDADE'
      Size = 50
    end
    object qyAgendaNM_MEDICO: TIBStringField
      FieldName = 'NM_MEDICO'
      Size = 50
    end
    object qyAgendaCD_UND: TIntegerField
      FieldName = 'CD_UND'
      Origin = 'AGENDA.CD_UND'
      Required = True
    end
    object qyAgendaDT_REMARCACAO: TDateTimeField
      FieldName = 'DT_REMARCACAO'
      Origin = 'AGENDA.DT_REMARCACAO'
    end
    object qyAgendaCD_BAIRRO: TIntegerField
      FieldName = 'CD_BAIRRO'
      Origin = 'PACIENTE.CD_BAIRRO'
    end
    object qyAgendaCD_PAIS: TIntegerField
      FieldName = 'CD_PAIS'
      Origin = 'PACIENTE.CD_PAIS'
    end
    object qyAgendaCD_MUNICIPIO: TIntegerField
      FieldName = 'CD_MUNICIPIO'
      Origin = 'PACIENTE.CD_MUNICIPIO'
    end
    object qyAgendaCD_MOR_MUNICIPIO: TIntegerField
      FieldName = 'CD_MOR_MUNICIPIO'
      Origin = 'PACIENTE.CD_MOR_MUNICIPIO'
    end
    object qyAgendaCD_PROVINCIA: TIntegerField
      FieldName = 'CD_PROVINCIA'
      Origin = 'PACIENTE.CD_PROVINCIA'
    end
    object qyAgendaCD_COMUNA: TIntegerField
      FieldName = 'CD_COMUNA'
      Origin = 'PACIENTE.CD_COMUNA'
    end
    object qyAgendaDT_NASCIMENTO: TDateField
      FieldName = 'DT_NASCIMENTO'
      Origin = 'PACIENTE.DT_NASCIMENTO'
      Required = True
    end
    object qyAgendaIDADE: TSmallintField
      FieldName = 'IDADE'
      Origin = 'PACIENTE.IDADE'
      Required = True
    end
    object qyAgendaNM_MAE: TIBStringField
      FieldName = 'NM_MAE'
      Origin = 'PACIENTE.NM_MAE'
      Required = True
      Size = 50
    end
    object qyAgendaCD_MORADA_PERM: TIBStringField
      FieldName = 'CD_MORADA_PERM'
      Origin = 'PACIENTE.CD_MORADA_PERM'
      FixedChar = True
      Size = 1
    end
    object qyAgendaCD_ESCOLARIDADE: TSmallintField
      FieldName = 'CD_ESCOLARIDADE'
      Origin = 'PACIENTE.CD_ESCOLARIDADE'
    end
    object qyAgendaDS_ESCOLARIDADE: TIBStringField
      FieldName = 'DS_ESCOLARIDADE'
      Origin = 'PACIENTE.DS_ESCOLARIDADE'
      Size = 50
    end
    object qyAgendaTP_SEXO: TIBStringField
      FieldName = 'TP_SEXO'
      Origin = 'PACIENTE.TP_SEXO'
      Required = True
      FixedChar = True
      Size = 1
    end
    object qyAgendaMESES: TIntegerField
      FieldName = 'MESES'
      Origin = 'PACIENTE.MESES'
    end
    object qyAgendaESTADO_CIVIL: TIntegerField
      FieldName = 'ESTADO_CIVIL'
      Origin = 'PACIENTE.ESTADO_CIVIL'
    end
    object qyAgendaCD_NAR_PROVINCIA: TIntegerField
      FieldName = 'CD_NAR_PROVINCIA'
      Origin = 'PACIENTE.CD_NAR_PROVINCIA'
    end
    object qyAgendaCD_PACIENTE_ORACLE: TIntegerField
      FieldName = 'CD_PACIENTE_ORACLE'
      Origin = 'PACIENTE.CD_PACIENTE_ORACLE'
    end
    object qyAgendaCD_OCUPACAO: TIntegerField
      FieldName = 'CD_OCUPACAO'
      Origin = 'PACIENTE.CD_OCUPACAO'
    end
    object qyAgendaCD_DOCUMENTO: TIntegerField
      FieldName = 'CD_DOCUMENTO'
      Origin = 'PACIENTE.CD_DOCUMENTO'
    end
    object qyAgendaTP_DOCUMENTO: TIBStringField
      FieldName = 'TP_DOCUMENTO'
      Origin = 'PACIENTE.TP_DOCUMENTO'
    end
    object qyAgendaNR_DOCUMENTO: TIBStringField
      FieldName = 'NR_DOCUMENTO'
      Origin = 'PACIENTE.NR_DOCUMENTO'
    end
    object IBStringField3: TIBStringField
      FieldName = 'NR_TEL_1'
      Origin = 'PACIENTE.NR_TEL_1'
    end
    object IBStringField4: TIBStringField
      FieldName = 'NR_TEL_2'
      Origin = 'PACIENTE.NR_TEL_2'
    end
    object qyAgendaDS_ENDERECO: TIBStringField
      FieldName = 'DS_ENDERECO'
      Origin = 'PACIENTE.DS_ENDERECO'
      Size = 200
    end
    object qyAgendaFL_GESTANTE: TIntegerField
      FieldName = 'FL_GESTANTE'
      Origin = 'PACIENTE.FL_GESTANTE'
    end
    object qyAgendaFL_NOTIFICACAO: TIntegerField
      FieldName = 'FL_NOTIFICACAO'
      Origin = 'PACIENTE.FL_NOTIFICACAO'
    end
    object qyAgendaNR_MESES_GESTANTE: TIntegerField
      FieldName = 'NR_MESES_GESTANTE'
      Origin = 'PACIENTE.NR_MESES_GESTANTE'
    end
    object qyAgendaFL_RESULTADO: TIBStringField
      FieldName = 'FL_RESULTADO'
      Origin = 'PACIENTE.FL_RESULTADO'
      FixedChar = True
      Size = 1
    end
    object qyAgendaDS_ESQUEMA: TIBStringField
      FieldName = 'DS_ESQUEMA'
      Origin = 'AGENDA.DS_ESQUEMA'
      Size = 30
    end
    object IntegerField4: TIntegerField
      FieldName = 'NR_PROCESSO'
      Origin = 'PACIENTE.NR_PROCESSO'
    end
    object qyAgendaFL_CONFIRMADO: TIntegerField
      FieldName = 'FL_CONFIRMADO'
      Origin = 'AGENDA.FL_CONFIRMADO'
    end
    object qyAgendaFL_TRANSFERIDO: TIntegerField
      FieldName = 'FL_TRANSFERIDO'
      Origin = 'AGENDA.FL_TRANSFERIDO'
    end
    object qyAgendaCONFIRMADO: TIBStringField
      FieldName = 'CONFIRMADO'
      Required = True
      FixedChar = True
      Size = 3
    end
    object qyAgendaREALIZADO: TIBStringField
      FieldName = 'REALIZADO'
      Required = True
      FixedChar = True
      Size = 3
    end
    object qyAgendaREMARCADO: TIBStringField
      FieldName = 'REMARCADO'
      Required = True
      FixedChar = True
      Size = 3
    end
    object qyAgendaTRANSFERIDO: TIBStringField
      FieldName = 'TRANSFERIDO'
      Required = True
      FixedChar = True
      Size = 3
    end
    object qyAgendaNR_LAB: TIntegerField
      FieldName = 'NR_LAB'
      Origin = 'AGENDA.NR_LAB'
    end
    object IntegerField5: TIntegerField
      FieldName = 'FL_PARECER'
      Origin = 'AGENDA.FL_PARECER'
    end
  end
  object dsHistorico: TDataSource
    AutoEdit = False
    DataSet = qyHistorico
    Left = 445
    Top = 381
  end
end
