inherited frmRelListagemGeralExames: TfrmRelListagemGeralExames
  Left = 292
  Top = 141
  ClientHeight = 418
  ClientWidth = 694
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  inherited Label1: TLabel
    Width = 239
    Caption = 'Listagem Geral Exames'
  end
  inherited pgFiltros: TPageControl
    Top = 40
    Width = 545
    Height = 316
    ActivePage = TabSheet1
    object TabSheet1: TTabSheet
      Caption = 'Filtros'
      object GroupBox6: TGroupBox
        Left = 3
        Top = 105
        Width = 302
        Height = 177
        Caption = 'BIOQUIMICA'
        TabOrder = 0
        object CheckBox1: TCheckBox
          Tag = 1
          Left = 16
          Top = 24
          Width = 133
          Height = 17
          Caption = #193'cido '#218'rico (mg/dl)'
          TabOrder = 0
        end
        object CheckBox2: TCheckBox
          Tag = 2
          Left = 16
          Top = 40
          Width = 133
          Height = 17
          Caption = 'Ureia (mg/dl)'
          TabOrder = 1
        end
        object CheckBox3: TCheckBox
          Tag = 3
          Left = 16
          Top = 56
          Width = 133
          Height = 17
          Caption = 'Creatinina (mg/dl)'
          TabOrder = 2
        end
        object CheckBox4: TCheckBox
          Tag = 4
          Left = 16
          Top = 72
          Width = 133
          Height = 17
          Caption = 'Colest Total (mg/dl)'
          TabOrder = 3
        end
        object CheckBox5: TCheckBox
          Tag = 5
          Left = 16
          Top = 88
          Width = 133
          Height = 17
          Caption = 'HDL - Col (mg/dl)'
          TabOrder = 4
        end
        object CheckBox6: TCheckBox
          Tag = 6
          Left = 16
          Top = 104
          Width = 133
          Height = 17
          Caption = 'LDL - Col (mg/dl)'
          TabOrder = 5
        end
        object CheckBox7: TCheckBox
          Tag = 7
          Left = 16
          Top = 120
          Width = 133
          Height = 17
          Caption = 'Triglic (mg/dl)'
          TabOrder = 6
        end
        object CheckBox8: TCheckBox
          Tag = 8
          Left = 16
          Top = 136
          Width = 133
          Height = 17
          Caption = 'AST (TGO) (U/L)'
          TabOrder = 7
        end
        object CheckBox9: TCheckBox
          Tag = 9
          Left = 16
          Top = 152
          Width = 133
          Height = 17
          Caption = 'ALT (TGO) (U/L)'
          TabOrder = 8
        end
        object CheckBox10: TCheckBox
          Tag = 10
          Left = 152
          Top = 24
          Width = 133
          Height = 17
          Caption = 'Bilir Dir (mg/dl)'
          TabOrder = 9
        end
        object CheckBox11: TCheckBox
          Tag = 11
          Left = 152
          Top = 40
          Width = 133
          Height = 17
          Caption = 'Bilir Total (mg/dl)'
          TabOrder = 10
        end
        object CheckBox12: TCheckBox
          Tag = 12
          Left = 152
          Top = 56
          Width = 133
          Height = 17
          Caption = 'Glicemia (mg/dl)'
          TabOrder = 11
        end
        object CheckBox13: TCheckBox
          Tag = 13
          Left = 152
          Top = 72
          Width = 133
          Height = 17
          Caption = 'Amilase (U/L)'
          TabOrder = 12
        end
        object CheckBox14: TCheckBox
          Tag = 14
          Left = 152
          Top = 88
          Width = 133
          Height = 17
          Caption = 'Fosfatase Acida (U/L)'
          TabOrder = 13
        end
        object CheckBox15: TCheckBox
          Tag = 15
          Left = 152
          Top = 104
          Width = 133
          Height = 17
          Caption = 'Fosfatase Alc (U/L)'
          TabOrder = 14
        end
        object CheckBox16: TCheckBox
          Tag = 16
          Left = 152
          Top = 120
          Width = 133
          Height = 17
          Caption = 'Prot. Totais (g/dl)'
          TabOrder = 15
        end
        object CheckBox17: TCheckBox
          Tag = 17
          Left = 152
          Top = 136
          Width = 133
          Height = 17
          Caption = 'S'#243'dio (mEq/L)'
          TabOrder = 16
        end
        object CheckBox18: TCheckBox
          Tag = 18
          Left = 152
          Top = 152
          Width = 133
          Height = 17
          Caption = 'Pot'#225'ssio (mEq/L)'
          TabOrder = 17
        end
      end
      object GroupBox7: TGroupBox
        Left = 309
        Top = 34
        Width = 91
        Height = 80
        Caption = 'SEROLOGIA'
        TabOrder = 1
        object CheckBox19: TCheckBox
          Tag = 19
          Left = 12
          Top = 24
          Width = 66
          Height = 17
          Caption = 'VDRL'
          TabOrder = 0
        end
        object CheckBox20: TCheckBox
          Tag = 20
          Left = 12
          Top = 40
          Width = 66
          Height = 17
          Caption = 'HBsAg'
          TabOrder = 1
        end
        object CheckBox21: TCheckBox
          Tag = 21
          Left = 12
          Top = 56
          Width = 66
          Height = 17
          Caption = 'VHC'
          TabOrder = 2
        end
      end
      object GroupBox9: TGroupBox
        Left = 309
        Top = 117
        Width = 136
        Height = 49
        Caption = 'CITOMETRIA DE FLUXO'
        TabOrder = 2
        object CheckBox23: TCheckBox
          Tag = 23
          Left = 12
          Top = 24
          Width = 97
          Height = 17
          Caption = 'CD4'
          TabOrder = 0
        end
      end
      object GroupBox8: TGroupBox
        Left = 403
        Top = 65
        Width = 109
        Height = 49
        Caption = 'HEMATOLOGIA'
        TabOrder = 3
        object CheckBox22: TCheckBox
          Tag = 22
          Left = 12
          Top = 24
          Width = 92
          Height = 17
          Caption = 'HEMOGRAMA'
          TabOrder = 0
        end
      end
      object GroupBox10: TGroupBox
        Left = 449
        Top = 117
        Width = 87
        Height = 49
        Caption = 'CARGA VIRAL'
        TabOrder = 4
        object CheckBox24: TCheckBox
          Tag = 24
          Left = 12
          Top = 24
          Width = 39
          Height = 17
          Caption = 'CV'
          TabOrder = 0
        end
      end
      object GroupBox11: TGroupBox
        Left = 309
        Top = 169
        Width = 190
        Height = 113
        Caption = 'OUTRAS AN'#193'LISES SOLICITADAS'
        TabOrder = 5
        object CheckBox25: TCheckBox
          Tag = 25
          Left = 16
          Top = 24
          Width = 97
          Height = 17
          Caption = 'Teste Gravides'
          TabOrder = 0
        end
        object CheckBox26: TCheckBox
          Tag = 26
          Left = 16
          Top = 40
          Width = 97
          Height = 17
          Caption = 'URINA II'
          TabOrder = 1
        end
        object CheckBox27: TCheckBox
          Tag = 27
          Left = 16
          Top = 56
          Width = 97
          Height = 17
          Caption = 'Gota Espessa'
          TabOrder = 2
        end
        object CheckBox28: TCheckBox
          Tag = 28
          Left = 16
          Top = 72
          Width = 97
          Height = 17
          Caption = 'Falciforma'#231#227'o'
          TabOrder = 3
        end
        object CheckBox29: TCheckBox
          Tag = 29
          Left = 16
          Top = 88
          Width = 97
          Height = 17
          Caption = 'Outras An'#225'lises'
          TabOrder = 4
        end
      end
      object GroupBox1: TGroupBox
        Left = 3
        Top = 2
        Width = 301
        Height = 97
        Caption = 'Per'#237'odo'
        TabOrder = 6
        object Label5: TLabel
          Left = 16
          Top = 30
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
          Left = 142
          Top = 30
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
        object dtde: TdxDateEdit
          Left = 16
          Top = 48
          Width = 109
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
        object dtate: TdxDateEdit
          Left = 141
          Top = 48
          Width = 110
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
    Width = 681
    inherited btImprimir: TBitBtn
      Left = 394
      OnClick = btImprimirClick
    end
    inherited btCancelar: TBitBtn
      Left = 527
    end
  end
  inherited qyGeral: TIBQuery
    Active = True
    SQL.Strings = (
      
        'select e.ds_exames, a.dt_agenda, a.nr_lab, p.nm_paciente, p.nr_p' +
        'rocesso'
      'from exames_agenda ea, exames e, agenda a, paciente p'
      'where a.cd_agenda = ea.cd_agenda'
      'and e.cd_exames = ea.cd_exames'
      'and p.cd_paciente = a.cd_paciente')
    object qyGeralDS_EXAMES: TIBStringField
      FieldName = 'DS_EXAMES'
      Origin = 'EXAMES.DS_EXAMES'
      Required = True
      Size = 50
    end
    object qyGeralDT_AGENDA: TDateTimeField
      FieldName = 'DT_AGENDA'
      Origin = 'AGENDA.DT_AGENDA'
    end
    object qyGeralNR_LAB: TIntegerField
      FieldName = 'NR_LAB'
      Origin = 'AGENDA.NR_LAB'
    end
    object qyGeralNM_PACIENTE: TIBStringField
      FieldName = 'NM_PACIENTE'
      Origin = 'PACIENTE.NM_PACIENTE'
      Required = True
      Size = 50
    end
    object qyGeralNR_PROCESSO: TIntegerField
      FieldName = 'NR_PROCESSO'
      Origin = 'PACIENTE.NR_PROCESSO'
    end
  end
  inherited rvGeral: TRvProject
    ProjectFile = 'RelListagemGeralExames.rav'
  end
end
