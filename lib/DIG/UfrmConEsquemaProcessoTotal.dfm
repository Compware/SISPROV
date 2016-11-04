inherited frmConEsquemaProcessoTotal: TfrmConEsquemaProcessoTotal
  Left = 395
  Top = 142
  Caption = 'Total de Esquemas Utilizados por Processo'
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel2: TPanel
    inherited pgGeral: TPageControl
      inherited tabLista: TTabSheet
        inherited Panel3: TPanel
          inherited grDados: TdxDBGrid
            KeyField = 'NR_PROCESSO'
            SummaryGroups = <
              item
                DefaultGroup = False
                SummaryItems = <
                  item
                    SummaryField = 'NR_PROCESSO'
                    SummaryFormat = '(Total=0)'
                    SummaryType = cstCount
                  end>
                Name = 'grDadosSummaryGroup1'
              end>
            Filter.Criteria = {00000000}
            OptionsDB = [edgoCancelOnExit, edgoCanDelete, edgoCanInsert, edgoCanNavigation, edgoConfirmDelete, edgoLoadAllRecords, edgoUseBookmarks]
            ShowRowFooter = True
            object grDadosESQUEMA: TdxDBGridMaskColumn
              Sorted = csUp
              Visible = False
              Width = 885
              BandIndex = 0
              RowIndex = 0
              FieldName = 'ESQUEMA'
              GroupIndex = 0
              SummaryGroupName = 'grDadosSummaryGroup1'
            end
            object grDadosNR_PROCESSO: TdxDBGridMaskColumn
              Sorted = csUp
              Width = 419
              BandIndex = 0
              RowIndex = 0
              FieldName = 'NR_PROCESSO'
            end
            object grDadosCOUNT: TdxDBGridMaskColumn
              Visible = False
              Width = 306
              BandIndex = 0
              RowIndex = 0
              FieldName = 'COUNT'
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
      'select count(*), nr_processo, esquema'
      'from ('
      'select nr_processo,'
      '  (select ds_esquema from agenda'
      '   where agenda.cd_paciente = paciente.cd_paciente'
      
        '   and ("AGENDA".DT_AGENDA >= :DT_DE and                        ' +
        ' "AGENDA".DT_AGENDA < :DT_ATE)'
      '   and  cd_agenda = (select max(cd_agenda) from agenda'
      
        '                     where agenda.cd_paciente = paciente.cd_paci' +
        'ente'
      '                     and fl_esquema = 0))esquema'
      'from  paciente'
      'where exists('
      'select  1 from agenda'
      'where fl_esquema = 0'
      'and nr_processo is not null'
      
        'and ("AGENDA".DT_AGENDA >= :DT_DE2 and "AGENDA".DT_AGENDA < :DT_' +
        'ATE2)'
      'and agenda.cd_paciente = paciente.cd_paciente)'
      ')'
      'group by nr_processo, esquema')
    Left = 342
    Top = 158
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'DT_DE'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DT_ATE'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DT_DE2'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DT_ATE2'
        ParamType = ptUnknown
      end>
    object qyAgendaNR_PROCESSO: TIntegerField
      FieldName = 'NR_PROCESSO'
    end
    object qyAgendaESQUEMA: TIBStringField
      FieldName = 'ESQUEMA'
      Size = 30
    end
    object qyAgendaCOUNT: TIntegerField
      FieldName = 'COUNT'
      Required = True
    end
  end
end
