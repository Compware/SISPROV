inherited frmCadAtendimentos: TfrmCadAtendimentos
  Left = 229
  Top = 135
  Caption = 'Atendimentos'
  ClientHeight = 503
  ClientWidth = 739
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited sbPadrao: TStatusBar
    Top = 484
    Width = 739
  end
  inherited Panel1: TPanel
    Width = 739
    inherited btfechar: TBitBtn
      Left = 691
    end
  end
  inherited Panel2: TPanel
    Width = 739
    Height = 432
    inherited pgGeral: TPageControl
      Width = 737
      Height = 430
      inherited tabLista: TTabSheet
        inherited Panel3: TPanel
          Width = 729
          Height = 402
          inherited grDados: TdxDBGrid
            Width = 727
            Height = 400
            KeyField = 'CD_ATENDIMENTO'
            Filter.Criteria = {00000000}
            GroupPanelColor = 4227072
            GroupPanelFontColor = clWhite
            object grDadosCD_ATENDIMENTO: TdxDBGridMaskColumn
              Caption = 'C'#243'd. Atendimento'
              Width = 91
              BandIndex = 0
              RowIndex = 0
              FieldName = 'CD_ATENDIMENTO'
            end
            object grDadosCD_UND: TdxDBGridMaskColumn
              Visible = False
              Width = 54
              BandIndex = 0
              RowIndex = 0
              FieldName = 'CD_UND'
            end
            object grDadosDT_ATENDIMENTO: TdxDBGridDateColumn
              Caption = 'Data Atendimento'
              Width = 108
              BandIndex = 0
              RowIndex = 0
              FieldName = 'DT_ATENDIMENTO'
            end
            object grDadosCD_MEDICO: TdxDBGridMaskColumn
              Caption = 'C'#243'd. M'#233'dico'
              Visible = False
              Width = 55
              BandIndex = 0
              RowIndex = 0
              FieldName = 'CD_MEDICO'
            end
            object grDadosNM_MEDICO: TdxDBGridMaskColumn
              Caption = 'M'#233'dico'
              Width = 287
              BandIndex = 0
              RowIndex = 0
              FieldName = 'NM_MEDICO'
            end
            object grDadosColumn6: TdxDBGridColumn
              Caption = 'Per'#237'odo'
              BandIndex = 0
              RowIndex = 0
              FieldName = 'DS_PERIODO'
            end
          end
        end
      end
      inherited tabGeral: TTabSheet
        inherited Panel4: TPanel
          Width = 729
          Height = 402
          object Panel5: TPanel
            Left = 602
            Top = 1
            Width = 126
            Height = 400
            Align = alRight
            TabOrder = 0
            object DBRadioGroup1: TDBRadioGroup
              Left = 10
              Top = 7
              Width = 109
              Height = 105
              Caption = 'Per'#237'odo'
              DataField = 'TP_PERIODO'
              DataSource = dsControle
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              Items.Strings = (
                'Manha'
                'Tarde'
                'Triagem'
                'N'#227'o Atende ')
              ParentFont = False
              TabOrder = 0
              Values.Strings = (
                '1'
                '2'
                '3'
                '4')
            end
          end
          object Panel6: TPanel
            Left = 239
            Top = 1
            Width = 363
            Height = 400
            Align = alClient
            TabOrder = 1
            object DBGrid1: TDBGrid
              Left = 1
              Top = 1
              Width = 361
              Height = 398
              Align = alClient
              DataSource = dsMedico
              TabOrder = 0
              TitleFont.Charset = DEFAULT_CHARSET
              TitleFont.Color = clWindowText
              TitleFont.Height = -11
              TitleFont.Name = 'MS Sans Serif'
              TitleFont.Style = []
              OnCellClick = DBGrid1CellClick
              OnDrawColumnCell = DBGrid1DrawColumnCell
              Columns = <
                item
                  Expanded = False
                  FieldName = 'CD_MEDICO'
                  Visible = False
                end
                item
                  Expanded = False
                  FieldName = 'NM_MEDICO'
                  Title.Caption = 'M'#233'dico'
                  Width = 322
                  Visible = True
                end>
            end
          end
          object Panel7: TPanel
            Left = 1
            Top = 1
            Width = 238
            Height = 400
            Align = alLeft
            TabOrder = 2
            object Calendario: TMonthCalendar
              Left = 1
              Top = 1
              Width = 236
              Height = 153
              Align = alTop
              Anchors = [akLeft, akTop, akRight, akBottom]
              AutoSize = True
              CalColors.TextColor = clBlack
              CalColors.TitleBackColor = clMaroon
              CalColors.TrailingTextColor = clGray
              Date = 40926.990412395830000000
              TabOrder = 0
              OnClick = CalendarioClick
            end
          end
        end
      end
    end
  end
  inherited dsControle: TDataSource
    DataSet = DMGERAL.TB_ATENDIMENTO
  end
  inherited dsGrid: TDataSource
    DataSet = qyAtendimento
  end
  object qyAtendimento: TIBQuery
    Database = DM.DB
    Transaction = DM.TS
    OnCalcFields = qyAtendimentoCalcFields
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select ATENDIMENTO.*'
      '      , MEDICO.NM_MEDICO'
      'from "ATENDIMENTO", "MEDICO"'
      'where "ATENDIMENTO".CD_MEDICO = MEDICO.CD_MEDICO')
    Left = 357
    Top = 205
    object qyAtendimentoCD_ATENDIMENTO: TIntegerField
      FieldName = 'CD_ATENDIMENTO'
      Origin = 'ATENDIMENTO.CD_ATENDIMENTO'
      Required = True
    end
    object qyAtendimentoCD_UND: TIntegerField
      FieldName = 'CD_UND'
      Origin = 'ATENDIMENTO.CD_UND'
      Required = True
    end
    object qyAtendimentoCD_MEDICO: TIntegerField
      FieldName = 'CD_MEDICO'
      Origin = 'ATENDIMENTO.CD_MEDICO'
    end
    object qyAtendimentoDT_ATENDIMENTO: TDateTimeField
      FieldName = 'DT_ATENDIMENTO'
      Origin = 'ATENDIMENTO.DT_ATENDIMENTO'
    end
    object qyAtendimentoNM_MEDICO: TIBStringField
      FieldName = 'NM_MEDICO'
      Origin = 'MEDICO.NM_MEDICO'
      Size = 50
    end
    object qyAtendimentoTP_PERIODO: TIntegerField
      FieldName = 'TP_PERIODO'
      Origin = 'ATENDIMENTO.TP_PERIODO'
    end
    object qyAtendimentoDS_PERIODO: TStringField
      FieldKind = fkCalculated
      FieldName = 'DS_PERIODO'
      Calculated = True
    end
  end
  object dsMedico: TDataSource
    AutoEdit = False
    DataSet = qyMedico
    Left = 476
    Top = 230
  end
  object qyMedico: TIBQuery
    Database = DM.DB
    Transaction = DM.TS
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select "MEDICO"."CD_MEDICO"'
      '      ,"MEDICO"."NM_MEDICO"'
      '      ,"MEDICO"."NR_TELEFONE"'
      '      ,"MEDICO"."CD_UND"'
      'from "MEDICO"'
      'order by'
      '"MEDICO"."CD_MEDICO"')
    Left = 436
    Top = 262
    object qyMedicoCD_MEDICO: TIntegerField
      FieldName = 'CD_MEDICO'
      Origin = 'MEDICO.CD_MEDICO'
      Required = True
    end
    object qyMedicoNM_MEDICO: TIBStringField
      FieldName = 'NM_MEDICO'
      Origin = 'MEDICO.NM_MEDICO'
      Size = 50
    end
  end
  object qyAtendimentoDia: TIBQuery
    Database = DM.DB
    Transaction = DM.TS
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'SELECT '
      '  CD_ATENDIMENTO,'
      '  TP_PERIODO'
      'FROM ATENDIMENTO'
      'WHERE CD_MEDICO = :CD_MEDICO'
      'AND DT_ATENDIMENTO = :DATA')
    Left = 393
    Top = 235
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'CD_MEDICO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DATA'
        ParamType = ptUnknown
      end>
  end
end
