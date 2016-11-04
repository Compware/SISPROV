object frmConsProdutividade: TfrmConsProdutividade
  Left = 28
  Top = 150
  Width = 631
  Height = 474
  Caption = 'Produtividade M'#233'dica'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object DBGrid1: TDBGrid
    Left = 16
    Top = 64
    Width = 593
    Height = 105
    DataSource = DataSource1
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
  end
  object Button1: TButton
    Left = 304
    Top = 24
    Width = 75
    Height = 25
    Caption = 'Button1'
    TabOrder = 1
    OnClick = Button1Click
  end
  object DBLookupComboBox1: TDBLookupComboBox
    Left = 400
    Top = 24
    Width = 193
    Height = 21
    KeyField = 'CD_MEDICO'
    ListField = 'NM_MEDICO'
    ListSource = dsMedico
    TabOrder = 2
  end
  object DBGrid2: TDBGrid
    Left = 16
    Top = 288
    Width = 593
    Height = 145
    DataSource = DataSource2
    TabOrder = 3
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
  end
  object DBGrid3: TDBGrid
    Left = 16
    Top = 176
    Width = 593
    Height = 105
    DataSource = DataSource3
    TabOrder = 4
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
  end
  object qyAgenda: TIBQuery
    Database = DM.DB
    Transaction = DM.TS
    BufferChunks = 1000
    CachedUpdates = False
    DataSource = dsMedico
    SQL.Strings = (
      'SELECT'
      '       COUNT(*) CNT,'
      '       substring(cast(DT_AGENDA as varchar(24))from 1 for 4)||'
      '       substring(cast(DT_AGENDA as varchar(24))from 6 for 2)'
      '        mesano,'
      '       AGENDA.CD_MEDICO,'
      '       MEDICO.NM_MEDICO'
      'FROM AGENDA'
      'JOIN MEDICO'
      'ON AGENDA.CD_MEDICO = MEDICO.CD_MEDICO'
      'WHERE (FL_REALIZADO = 1 OR FL_PARECER = 1)'
      'and dt_agenda between '#39'01-01-2012'#39' and '#39'12-31-2012'#39
      'and AGENDA.CD_MEDICO = :CD_MEDICO'
      'GROUp BY'
      '       mesano,'
      '       AGENDA.CD_MEDICO,'
      '       MEDICO.NM_MEDICO')
    Left = 176
    Top = 24
    ParamData = <
      item
        DataType = ftInteger
        Name = 'CD_MEDICO'
        ParamType = ptUnknown
        Size = 4
      end>
  end
  object qyHistorico: TIBQuery
    Database = dmDIG.dbDig
    Transaction = dmDIG.tsDig
    BufferChunks = 1000
    CachedUpdates = False
    DataSource = dsMedico
    SQL.Strings = (
      'select'
      ' count(*) cnt,'
      ' cd_medico,'
      ' mesano'
      'from ('
      'select'
      '     distinct'
      '     CD_PACIENTE'
      '     ,substring(cast(DT_HISTORICO as varchar(24))from 1 for 4)||'
      
        '      substring(cast(DT_HISTORICO as varchar(24))from 6 for 2) m' +
        'esano'
      '     ,CD_MEDICO'
      'from HISTORICO'
      'where CD_MEDICO = :CD_MEDICO'
      ')group by cd_medico, mesano')
    Left = 216
    Top = 24
    ParamData = <
      item
        DataType = ftInteger
        Name = 'CD_MEDICO'
        ParamType = ptUnknown
        Size = 4
      end>
  end
  object TB_PRODUTIVIDADE: TIBClientDataSet
    Aggregates = <>
    Options = [poAllowCommandText]
    Params = <>
    Left = 256
    Top = 24
    object TB_PRODUTIVIDADEQTDE: TIntegerField
      FieldName = 'QTDE'
    end
    object TB_PRODUTIVIDADEMESANO: TIntegerField
      FieldName = 'MESANO'
    end
    object TB_PRODUTIVIDADECD_MEDICO: TIntegerField
      FieldName = 'CD_MEDICO'
    end
    object TB_PRODUTIVIDADENM_MEDICO: TStringField
      FieldName = 'NM_MEDICO'
      Size = 50
    end
  end
  object DataSource1: TDataSource
    DataSet = qyAgenda
    Left = 424
    Top = 96
  end
  object qyMedico: TIBQuery
    Database = DM.DB
    Transaction = DM.TS
    Active = True
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select * from MEDICO')
    Left = 408
    Top = 24
  end
  object dsMedico: TDataSource
    DataSet = qyMedico
    Left = 520
    Top = 16
  end
  object DataSource2: TDataSource
    DataSet = TB_PRODUTIVIDADE
    Left = 248
    Top = 312
  end
  object DataSource3: TDataSource
    DataSet = qyHistorico
    Left = 416
    Top = 200
  end
end
