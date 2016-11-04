inherited frmConProdutividadeMedico: TfrmConProdutividadeMedico
  Left = 317
  Top = 14
  Caption = 'Produtividade - M'#233'dico por Per'#237'odo'
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel2: TPanel
    inherited pgGeral: TPageControl
      inherited tabLista: TTabSheet
        inherited Panel3: TPanel
          inherited grDados: TdxDBGrid
            KeyField = 'CD_AGENDA'
            SummaryGroups = <
              item
                DefaultGroup = False
                SummaryItems = <
                  item
                    SummaryField = 'CD_AGENDA'
                    SummaryFormat = '(TOTAL=0)'
                    SummaryType = cstCount
                  end>
                Name = 'grDadosSummaryGroup1'
              end>
            Filter.Criteria = {00000000}
            OptionsDB = [edgoCancelOnExit, edgoCanDelete, edgoCanInsert, edgoCanNavigation, edgoConfirmDelete, edgoLoadAllRecords, edgoUseBookmarks]
            ShowRowFooter = True
            object grDadosCD_AGENDA: TdxDBGridColumn
              Visible = False
              Width = 49
              BandIndex = 0
              RowIndex = 0
              FieldName = 'CD_AGENDA'
            end
            object grDadosColumn10: TdxDBGridColumn
              Caption = 'M'#233'dico'
              Sorted = csUp
              Visible = False
              BandIndex = 0
              RowIndex = 0
              FieldName = 'NM_MEDICO'
              GroupIndex = 1
              SummaryGroupName = 'grDadosSummaryGroup1'
            end
            object grDadosDS_UNIDADE: TdxDBGridColumn
              Caption = 'Unidade'
              Sorted = csUp
              Visible = False
              Width = 205
              BandIndex = 0
              RowIndex = 0
              FieldName = 'DS_UNIDADE'
              GroupIndex = 0
              SummaryGroupName = 'grDadosSummaryGroup1'
            end
            object grDadosDT_AGENDA: TdxDBGridDateColumn
              Caption = 'Agendamento'
              Sorted = csDown
              Visible = False
              Width = 75
              BandIndex = 0
              RowIndex = 0
              FieldName = 'DT_AGENDA'
              GroupIndex = 2
              SummaryGroupName = 'grDadosSummaryGroup1'
            end
            object grDadosNR_PROCESSO: TdxDBGridMaskColumn
              Caption = 'Processo'
              BandIndex = 0
              RowIndex = 0
              FieldName = 'NR_PROCESSO'
            end
            object grDadosNM_PACIENTE: TdxDBGridMaskColumn
              Caption = 'Paciente'
              Width = 304
              BandIndex = 0
              RowIndex = 0
              FieldName = 'NM_PACIENTE'
            end
            object grDadosIDADE: TdxDBGridMaskColumn
              Caption = 'Idade'
              Width = 39
              BandIndex = 0
              RowIndex = 0
              FieldName = 'IDADE'
            end
            object grDadosTP_SEXO: TdxDBGridMaskColumn
              Caption = 'Sexo'
              Width = 30
              BandIndex = 0
              RowIndex = 0
              FieldName = 'TP_SEXO'
            end
            object grDadosDS_MUNICIPIO: TdxDBGridMaskColumn
              Caption = 'Municipio'
              Width = 122
              BandIndex = 0
              RowIndex = 0
              FieldName = 'DS_MUNICIPIO'
            end
            object grDadosDS_PROVINCIA: TdxDBGridMaskColumn
              Caption = 'Provincia'
              Width = 165
              BandIndex = 0
              RowIndex = 0
              FieldName = 'DS_PROVINCIA'
            end
          end
        end
      end
    end
  end
  inherited Panel1: TPanel
    inherited btAnterior: TBitBtn
      Visible = False
    end
    inherited btProximo: TBitBtn
      Visible = False
    end
    inherited btPesquisar: TBitBtn
      OnClick = btPesquisarClick
    end
  end
  inherited dsGrid: TDataSource
    DataSet = qyAgenda
  end
  object qyAgenda: TIBQuery
    Database = DM.DB
    Transaction = DM.TS
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'SELECT '
      'A.CD_AGENDA,'
      'A.DT_AGENDA,'
      'A.FL_CONFIRMADO,'
      'A.FL_REALIZADO,'
      'PACIENTE.NR_PROCESSO,'
      'PACIENTE.NM_PACIENTE,'
      'PACIENTE.IDADE,'
      'PACIENTE.TP_SEXO, '
      'MEDICO.NM_MEDICO,'
      'UNIDADE.DS_UNIDADE,'
      
        '(select distinct DS_PROVINCIA from PROVINCIA p where p.CD_PROVIN' +
        'CIA = PACIENTE.CD_PROVINCIA) DS_PROVINCIA,'
      
        '(select distinct DS_MUNICIPIO from MUNICIPIO m where m.CD_MUNICI' +
        'PIO = PACIENTE.CD_MUNICIPIO) DS_MUNICIPIO'
      'FROM  AGENDA A'
      '  inner join PACIENTE'
      '  on PACIENTE.CD_PACIENTE = A.CD_PACIENTE'
      ' and PACIENTE.CD_UND = A.CD_UND'
      '  inner join MEDICO'
      '  on MEDICO.CD_MEDICO = A.CD_MEDICO'
      '  inner join UNIDADE'
      '  on UNIDADE.CD_UNIDADE = A.CD_UNIDADE'
      'WHERE FL_PARECER = 1')
    Left = 326
    Top = 158
    object qyAgendaCD_AGENDA: TIntegerField
      FieldName = 'CD_AGENDA'
      Origin = 'AGENDA.CD_AGENDA'
      Required = True
    end
    object qyAgendaNM_MEDICO: TIBStringField
      FieldName = 'NM_MEDICO'
      Origin = 'MEDICO.NM_MEDICO'
      Size = 50
    end
    object qyAgendaDS_UNIDADE: TIBStringField
      FieldName = 'DS_UNIDADE'
      Origin = 'UNIDADE.DS_UNIDADE'
      Required = True
      Size = 50
    end
    object qyAgendaDT_AGENDA: TDateTimeField
      FieldName = 'DT_AGENDA'
      Origin = 'AGENDA.DT_AGENDA'
    end
    object qyAgendaFL_CONFIRMADO: TIntegerField
      FieldName = 'FL_CONFIRMADO'
      Origin = 'AGENDA.FL_CONFIRMADO'
    end
    object qyAgendaFL_REALIZADO: TIntegerField
      FieldName = 'FL_REALIZADO'
      Origin = 'AGENDA.FL_REALIZADO'
    end
    object qyAgendaNR_PROCESSO: TIntegerField
      FieldName = 'NR_PROCESSO'
      Origin = 'PACIENTE.NR_PROCESSO'
    end
    object qyAgendaNM_PACIENTE: TIBStringField
      FieldName = 'NM_PACIENTE'
      Origin = 'PACIENTE.NM_PACIENTE'
      Required = True
      Size = 50
    end
    object qyAgendaIDADE: TSmallintField
      FieldName = 'IDADE'
      Origin = 'PACIENTE.IDADE'
      Required = True
    end
    object qyAgendaTP_SEXO: TIBStringField
      FieldName = 'TP_SEXO'
      Origin = 'PACIENTE.TP_SEXO'
      Required = True
      FixedChar = True
      Size = 1
    end
    object qyAgendaDS_PROVINCIA: TIBStringField
      FieldName = 'DS_PROVINCIA'
      Size = 50
    end
    object qyAgendaDS_MUNICIPIO: TIBStringField
      FieldName = 'DS_MUNICIPIO'
      Size = 50
    end
  end
end
