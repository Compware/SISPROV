inherited frmConEsquemaTotal: TfrmConEsquemaTotal
  Left = 366
  Top = 121
  Caption = 'Total por Esquemas utilizados'
  OldCreateOrder = True
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel2: TPanel
    inherited pgGeral: TPageControl
      inherited tabLista: TTabSheet
        inherited Panel3: TPanel
          inherited grDados: TdxDBGrid
            Filter.Criteria = {00000000}
            object grDadosESQUEMA: TdxDBGridMaskColumn
              BandIndex = 0
              RowIndex = 0
              FieldName = 'ESQUEMA'
            end
            object grDadosCOUNT: TdxDBGridMaskColumn
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
      'select count(*), esquema'
      'from ('
      'select'
      '  (select ds_esquema from agenda'
      '   where agenda.cd_paciente = paciente.cd_paciente'
      
        '   and ("AGENDA".DT_AGENDA >= :DT_DE and                      "A' +
        'GENDA".DT_AGENDA < :DT_ATE) '
      '   and cd_agenda = (select max(cd_agenda) from agenda'
      
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
      'group by esquema')
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
    object qyAgendaCOUNT: TIntegerField
      DisplayLabel = 'Total'
      FieldName = 'COUNT'
      Required = True
    end
    object qyAgendaESQUEMA: TIBStringField
      DisplayLabel = 'Esquema'
      FieldName = 'ESQUEMA'
      Size = 30
    end
  end
end
