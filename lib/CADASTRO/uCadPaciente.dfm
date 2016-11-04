inherited frmCadPaciente: TfrmCadPaciente
  Left = 208
  Top = 59
  Caption = 'Registro Di'#225'rio (Utente)'
  ClientHeight = 566
  ClientWidth = 792
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited sbPadrao: TStatusBar
    Top = 547
    Width = 792
  end
  inherited Panel1: TPanel
    Width = 792
    inherited btPesquisar: TBitBtn
      OnClick = btPesquisarClick
    end
    inherited btfechar: TBitBtn
      Left = 744
    end
    object btflGestante: TBitBtn
      Left = 573
      Top = 3
      Width = 153
      Height = 45
      Anchors = [akLeft, akTop, akBottom]
      Caption = 'Atualizar FL Gestante'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 10
      Visible = False
      OnClick = btflGestanteClick
    end
  end
  inherited Panel2: TPanel
    Width = 792
    Height = 495
    inherited pgGeral: TPageControl
      Width = 790
      Height = 493
      ActivePage = tabGeral
      inherited tabLista: TTabSheet
        OnShow = tabListaShow
        inherited Panel3: TPanel
          Width = 782
          Height = 465
          object Label1: TLabel [0]
            Left = 208
            Top = 40
            Width = 74
            Height = 13
            Caption = 'CD_PACIENTE'
          end
          inherited grDados: TdxDBGrid
            Width = 780
            Height = 463
            KeyField = 'CD_PACIENTE'
            Filter.Criteria = {00000000}
            object grDadosColumn1: TdxDBGridColumn
              Width = 21
              BandIndex = 0
              RowIndex = 0
              FieldName = 'CD_PACIENTE'
            end
            object grDadosColumn2: TdxDBGridColumn
              Caption = 'Nome Utente'
              Width = 193
              BandIndex = 0
              RowIndex = 0
              FieldName = 'NM_PACIENTE'
            end
            object grDadosColumn3: TdxDBGridColumn
              Width = 215
              BandIndex = 0
              RowIndex = 0
              FieldName = 'NM_MAE'
            end
            object grDadosColumn4: TdxDBGridColumn
              Width = 84
              BandIndex = 0
              RowIndex = 0
              FieldName = 'DT_NASCIMENTO'
            end
            object grDadosColumn5: TdxDBGridColumn
              Caption = 'Provincia de Naturalizade'
              Width = 132
              BandIndex = 0
              RowIndex = 0
              FieldName = 'DS_PROVINCIA'
            end
            object grDadosColumn6: TdxDBGridColumn
              Caption = 'Municipio de Naturalidade'
              Width = 130
              BandIndex = 0
              RowIndex = 0
              FieldName = 'DS_MUNICIPIO'
            end
            object grDadosColumn7: TdxDBGridColumn
              Caption = 'Provincia de Moradia'
              Sorted = csUp
              Visible = False
              Width = 148
              BandIndex = 0
              RowIndex = 0
              FieldName = 'DS_PROVINCIA_MORADA'
              GroupIndex = 0
            end
            object grDadosColumn8: TdxDBGridColumn
              Caption = 'Municipio de Moradia'
              Sorted = csUp
              Visible = False
              Width = 126
              BandIndex = 0
              RowIndex = 0
              FieldName = 'DS_MUNICIPIO_MORADA'
              GroupIndex = 1
            end
          end
        end
      end
      inherited tabGeral: TTabSheet
        inherited Panel4: TPanel
          Width = 782
          Height = 465
          inline framPaciente1: TframPaciente
            Left = 1
            Top = 1
            Width = 780
            Height = 463
            Align = alClient
            AutoScroll = False
            AutoSize = True
            TabOrder = 0
            inherited GroupBox1: TGroupBox
              inherited dxDBEdit1: TdxDBEdit
                CharCase = ecUpperCase
              end
              inherited dxDBEdit6: TdxDBEdit
                CharCase = ecUpperCase
              end
              inherited dxDBEdit7: TdxDBEdit
                CharCase = ecUpperCase
              end
            end
            inherited GroupBox2: TGroupBox
              inherited Label13: TLabel
                Width = 220
                Caption = 'Data de Nascimento........................................:'
              end
              inherited Label14: TLabel
                Width = 219
                Caption = 
                  'Idade (Anos)....................................................' +
                  ':'
              end
              inherited Label15: TLabel
                Width = 204
                Caption = ' Se crian'#231'a menor de 1 ano, (Meses).........:'
              end
              inherited Label17: TLabel
                Width = 220
                Caption = 
                  'Estado Civil....................................................' +
                  '..:'
              end
              inherited Label18: TLabel
                Width = 220
                Caption = 'Nome da M'#227'e..................................................:'
              end
              inherited Label20: TLabel
                Caption = 'Prov'#237'ncia de Naturalidade...............................:'
              end
              inherited Label21: TLabel
                Caption = 'Munic'#237'pio de Naturalidade...............................:'
              end
              inherited Label22: TLabel
                Caption = 'Nacionalidade..................................................:'
              end
              inherited Label25: TLabel
                Width = 239
                Caption = 'Morada permanente actual. Endere'#231'o...................:'
              end
              inherited Label26: TLabel
                Caption = 'Prov'#237'ncia de moradia.......................................:'
              end
              inherited Label27: TLabel
                Caption = 'Munic'#237'pio de moradia.......................................:'
              end
              inherited Label28: TLabel
                Width = 222
                Caption = 'N'#237'vel de Escolaridade (conclu'#237'do)...................:'
              end
              inherited Label16: TLabel
                Width = 221
                Caption = 
                  'Ocupa'#231#227'o........................................................' +
                  ':'
              end
              inherited Label5: TLabel
                Width = 218
                Caption = 'Nome completo do utente...............................:'
              end
              inherited Label12: TLabel
                Left = 8
                Width = 219
                Caption = 
                  'Sexo............................................................' +
                  '....:'
              end
              inherited DBDateEdit3: TDBDateEdit
                OnExit = framPaciente1DBDateEdit3Exit
              end
              inherited dxDBEdit2: TdxDBEdit
                OnExit = framPaciente1dxDBEdit2Exit
                OnKeyDown = framPaciente1dxDBEdit2KeyDown
                CharCase = ecUpperCase
              end
              inherited dxDBEdit5: TdxDBEdit
                OnExit = framPaciente1dxDBEdit5Exit
                CharCase = ecUpperCase
              end
              inherited dxDBEdit4: TdxDBEdit
                Left = 470
              end
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
              inherited dxDBEdit15: TdxDBEdit
                CharCase = ecUpperCase
              end
              inherited pendereco: TPanel
                inherited Panel1: TPanel
                  inherited dxDBMemo1: TdxDBMemo
                    Height = 54
                  end
                end
              end
              inherited dxDBEdit16: TdxDBEdit
                OnExit = framPaciente1dxDBEdit16Exit
                OnChange = framPaciente1dxDBEdit16Change
              end
              inherited pcriancaexp: TPanel
                inherited dxDBEdit17: TdxDBEdit
                  StoredValues = 64
                end
              end
            end
            inherited dsPaciente: TDataSource
              OnDataChange = framPaciente1dsPacienteDataChange
            end
          end
        end
      end
    end
  end
  inherited dsControle: TDataSource
    DataSet = DMGERAL.TB_PACIENTE
  end
  inherited dsGrid: TDataSource
    DataSet = qyPaciente
  end
  object qyPaciente: TIBQuery
    Database = DM.DB
    Transaction = DM.TS
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select paciente.*,'
      '(SELECT DS_PROVINCIA FROM PROVINCIA'
      'WHERE CD_PROVINCIA =  PACIENTE.CD_PROVINCIA)DS_PROVINCIA,'
      '(SELECT DS_MUNICIPIO FROM MUNICIPIO'
      'WHERE CD_MUNICIPIO =  PACIENTE.CD_MUNICIPIO)DS_MUNICIPIO,'
      '(SELECT DS_MUNICIPIO FROM MUNICIPIO'
      
        'WHERE CD_MUNICIPIO =  PACIENTE.CD_MOR_MUNICIPIO)DS_MUNICIPIO_MOR' +
        'ADA,'
      '(SELECT DS_PROVINCIA FROM PROVINCIA'
      
        'WHERE CD_PROVINCIA =  PACIENTE.CD_NAR_PROVINCIA)DS_PROVINCIA_MOR' +
        'ADA'
      'from "PACIENTE"'
      '')
    Left = 293
    Top = 237
    object qyPacienteCD_PACIENTE: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'CD_PACIENTE'
      Origin = 'PACIENTE.CD_PACIENTE'
      Required = True
    end
    object qyPacienteCD_BAIRRO: TIntegerField
      FieldName = 'CD_BAIRRO'
      Origin = 'PACIENTE.CD_BAIRRO'
    end
    object qyPacienteCD_PAIS: TIntegerField
      FieldName = 'CD_PAIS'
      Origin = 'PACIENTE.CD_PAIS'
    end
    object qyPacienteCD_MUNICIPIO: TIntegerField
      FieldName = 'CD_MUNICIPIO'
      Origin = 'PACIENTE.CD_MUNICIPIO'
    end
    object qyPacienteCD_MOR_MUNICIPIO: TIntegerField
      FieldName = 'CD_MOR_MUNICIPIO'
      Origin = 'PACIENTE.CD_MOR_MUNICIPIO'
    end
    object qyPacienteCD_PROVINCIA: TIntegerField
      FieldName = 'CD_PROVINCIA'
      Origin = 'PACIENTE.CD_PROVINCIA'
    end
    object qyPacienteCD_COMUNA: TIntegerField
      FieldName = 'CD_COMUNA'
      Origin = 'PACIENTE.CD_COMUNA'
    end
    object qyPacienteNM_PACIENTE: TIBStringField
      DisplayLabel = 'Nome Paciente'
      FieldName = 'NM_PACIENTE'
      Origin = 'PACIENTE.NM_PACIENTE'
      Required = True
      Size = 50
    end
    object qyPacienteDT_NASCIMENTO: TDateField
      DisplayLabel = 'Nascimento'
      FieldName = 'DT_NASCIMENTO'
      Origin = 'PACIENTE.DT_NASCIMENTO'
      Required = True
    end
    object qyPacienteIDADE: TSmallintField
      FieldName = 'IDADE'
      Origin = 'PACIENTE.IDADE'
      Required = True
    end
    object qyPacienteNM_MAE: TIBStringField
      DisplayLabel = 'Nome da Mae'
      FieldName = 'NM_MAE'
      Origin = 'PACIENTE.NM_MAE'
      Required = True
      Size = 50
    end
    object qyPacienteCD_MORADA_PERM: TIBStringField
      FieldName = 'CD_MORADA_PERM'
      Origin = 'PACIENTE.CD_MORADA_PERM'
      FixedChar = True
      Size = 1
    end
    object qyPacienteCD_ESCOLARIDADE: TSmallintField
      FieldName = 'CD_ESCOLARIDADE'
      Origin = 'PACIENTE.CD_ESCOLARIDADE'
    end
    object qyPacienteDS_ESCOLARIDADE: TIBStringField
      FieldName = 'DS_ESCOLARIDADE'
      Origin = 'PACIENTE.DS_ESCOLARIDADE'
      Size = 50
    end
    object qyPacienteTP_SEXO: TIBStringField
      FieldName = 'TP_SEXO'
      Origin = 'PACIENTE.TP_SEXO'
      Required = True
      FixedChar = True
      Size = 1
    end
    object qyPacienteMESES: TIntegerField
      FieldName = 'MESES'
      Origin = 'PACIENTE.MESES'
    end
    object qyPacienteESTADO_CIVIL: TIntegerField
      FieldName = 'ESTADO_CIVIL'
      Origin = 'PACIENTE.ESTADO_CIVIL'
    end
    object qyPacienteCD_NAR_PROVINCIA: TIntegerField
      FieldName = 'CD_NAR_PROVINCIA'
      Origin = 'PACIENTE.CD_NAR_PROVINCIA'
    end
    object qyPacienteCD_PACIENTE_ORACLE: TIntegerField
      FieldName = 'CD_PACIENTE_ORACLE'
      Origin = 'PACIENTE.CD_PACIENTE_ORACLE'
    end
    object qyPacienteDS_MUNICIPIO: TIBStringField
      DisplayLabel = 'Municipio'
      FieldName = 'DS_MUNICIPIO'
      Origin = 'MUNICIPIO.DS_MUNICIPIO'
      Required = True
      Size = 50
    end
    object qyPacienteDS_PROVINCIA: TIBStringField
      DisplayLabel = 'Provincia'
      FieldName = 'DS_PROVINCIA'
      Origin = 'PROVINCIA.DS_PROVINCIA'
      Required = True
      Size = 50
    end
    object qyPacienteDS_MUNICIPIO_MORADA: TIBStringField
      FieldName = 'DS_MUNICIPIO_MORADA'
      Size = 50
    end
    object qyPacienteDS_PROVINCIA_MORADA: TIBStringField
      FieldName = 'DS_PROVINCIA_MORADA'
      Size = 50
    end
    object qyPacienteCD_UND: TIntegerField
      FieldName = 'CD_UND'
      Origin = 'PACIENTE.CD_UND'
      Required = True
    end
    object qyPacienteCD_OCUPACAO: TIntegerField
      FieldName = 'CD_OCUPACAO'
      Origin = 'PACIENTE.CD_OCUPACAO'
    end
    object qyPacienteCD_DOCUMENTO: TIntegerField
      FieldName = 'CD_DOCUMENTO'
      Origin = 'PACIENTE.CD_DOCUMENTO'
    end
    object qyPacienteTP_DOCUMENTO: TIBStringField
      FieldName = 'TP_DOCUMENTO'
      Origin = 'PACIENTE.TP_DOCUMENTO'
    end
    object qyPacienteNR_DOCUMENTO: TIBStringField
      FieldName = 'NR_DOCUMENTO'
      Origin = 'PACIENTE.NR_DOCUMENTO'
    end
    object qyPacienteNR_TEL_1: TIBStringField
      FieldName = 'NR_TEL_1'
      Origin = 'PACIENTE.NR_TEL_1'
    end
    object qyPacienteNR_TEL_2: TIBStringField
      FieldName = 'NR_TEL_2'
      Origin = 'PACIENTE.NR_TEL_2'
    end
    object qyPacienteDS_ENDERECO: TIBStringField
      FieldName = 'DS_ENDERECO'
      Origin = 'PACIENTE.DS_ENDERECO'
      Size = 200
    end
    object qyPacienteFL_GESTANTE: TIntegerField
      FieldName = 'FL_GESTANTE'
      Origin = 'PACIENTE.FL_GESTANTE'
    end
    object qyPacienteFL_NOTIFICACAO: TIntegerField
      FieldName = 'FL_NOTIFICACAO'
      Origin = 'PACIENTE.FL_NOTIFICACAO'
    end
    object qyPacienteNR_MESES_GESTANTE: TIntegerField
      FieldName = 'NR_MESES_GESTANTE'
      Origin = 'PACIENTE.NR_MESES_GESTANTE'
    end
    object qyPacienteFL_RESULTADO: TIBStringField
      FieldName = 'FL_RESULTADO'
      Origin = 'PACIENTE.FL_RESULTADO'
      FixedChar = True
      Size = 1
    end
    object qyPacienteDT_EXP: TDateTimeField
      FieldName = 'DT_EXP'
      Origin = 'PACIENTE.DT_EXP'
    end
    object qyPacienteCD_EDI: TIntegerField
      FieldName = 'CD_EDI'
      Origin = 'PACIENTE.CD_EDI'
    end
    object qyPacienteNR_PROCESSO: TIntegerField
      FieldName = 'NR_PROCESSO'
      Origin = 'PACIENTE.NR_PROCESSO'
    end
  end
  object ImageList1: TImageList
    Left = 570
    Top = 222
    Bitmap = {
      494C010103000400040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000001000000001002000000000000010
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000F7F7F700F7F7F7000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000FFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000FFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000E7E7E700217B2100D6D6D6000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFF00D6D6D600087B0800087B0800D6D6D6000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000FFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF00000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00DEDEDE00ADADAD007B8C7B00087B08005AF75A00107310009C9C9C00DEDE
      DE00FFFFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFF0000000000FFFFFF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000E7E7E700638C
      63001084100029B5290042D642005AEF5A005AEF5A0031B53100108410003963
      39008C8C8C00E7E7E70000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000FFFF000000000000FFFF000000000000FFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF000000
      00000000000000000000000000000000000000000000D6D6D6001084100021BD
      210031C6310039D6390042DE42004AE74A004AE74A004ADE420039D6390029C6
      29001084100063636300D6D6D600000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFF0000000000FFFFFF0000000000FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FF
      FF0000000000000000000000000000000000EFEFEF00088C080010AD100018B5
      180029C6290031CE310039D6390039D6390039D6390039D6390031CE310029C6
      290018B51800088C08006B6B6B00EFEFEF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000FFFF000000000000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF0000000000FFFF
      FF0000000000000000000000000000000000318C310010AD100010AD100018B5
      180018BD210021BD210029C6290031C6310031C6310029C6290021BD210021B5
      210018B5180010AD100018731800B5B5B5000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF0000000000FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF000000000000FF
      FF0000000000000000000000000000000000089C080010AD100010AD100010AD
      100018B5180018B5180021BD210021BD210021BD210021BD210018B5180018B5
      180010AD100010AD1000089C0800848484000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFF0000000000FFFFFF0000000000FFFFFF00000000000000
      00000000000000000000000000000000000010AD100010AD100018B518004AC6
      4A006BCE6B006BCE6B0063CE630063CE63005ACE5A0052C652004AC64A0042BD
      420021B5210010AD100010AD10007B7B7B000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000FFFF000000000000FFFF000000000000FFFF00000000000000
      00000000000000000000000000000000000010A510005AC65A007BD67B007BD6
      7B007BD67B0073CE730073CE73006BCE6B0063CE630063CE63005AC65A0052C6
      52004AC64A0042BD420018A51800949494000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFFFF0000000000FFFFFF00000000000000
      000000000000000000000000000000000000299C29008CD68C008CD68C008CD6
      8C0084D6840084D684007BD67B007BD67B0073CE73006BCE6B0063CE63005AC6
      5A0052C652004AC64A0018941800D6D6D6000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF00000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000FFFF00000000000000
      000000000000000000000000000000000000A5CEA5007BCE7B0094DE940094DE
      940094DE94008CDE8C008CD68C0084D684007BD67B0073CE73006BCE6B0063CE
      63005AC65A0042BD42006B946B00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00000000000000
      0000000000000000000000000000000000000000000073B5730084CE8400A5DE
      A500A5DEA5009CDE9C0094DE94008CDE8C008CD68C0084D6840073D673006BCE
      6B004ABD4A0052945200F7F7F700000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000000000FF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000FFFF00000000000000
      0000000000000000000000000000000000000000000000000000B5D6B50031A5
      31009CDE9C00ADE7AD00A5DEA5009CDE9C0094DE94008CD68C0073CE7300299C
      29009CBD9C00FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000D6EFD6006BB56B00218C210008840800218C210063AD6300CEDECE00FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000100000000100010000000000800000000000000000000000
      000000000000000000000000FFFFFF00FDFFE00FFF9F0000F8FFE00FFF1F0000
      F8FFE00FFC1F0000F87FF00FE0070000F81FF00FC0030000F80FF80F80010000
      F00FF00700000000E00FF00700000000E00FF00700000000E00FF00F00000000
      F01FF01F00000000F00FF81F00000000F00FFE1F00000000F007FF1F80010000
      F007FF1FC0030000F007FFBFF00F000000000000000000000000000000000000
      000000000000}
  end
  object qySQL: TIBQuery
    Database = DM.DB
    Transaction = DM.TS
    BufferChunks = 1000
    CachedUpdates = False
    Left = 469
    Top = 245
  end
  object qyPacienteExistente: TIBQuery
    Database = DM.DB
    Transaction = DM.TS
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select "PACIENTE"."CD_PACIENTE"'
      '      ,"PACIENTE"."NM_PACIENTE"'
      '      ,"PACIENTE"."DT_NASCIMENTO"'
      '      ,"PACIENTE"."NM_MAE"'
      '      ,"PACIENTE"."NR_PROCESSO_CRIANCA_EXP"'
      'from "PACIENTE"'
      ''
      '')
    Left = 716
    Top = 149
    object qyPacienteExistenteCD_PACIENTE: TIntegerField
      FieldName = 'CD_PACIENTE'
      Origin = 'PACIENTE.CD_PACIENTE'
      Required = True
    end
    object qyPacienteExistenteNM_PACIENTE: TIBStringField
      FieldName = 'NM_PACIENTE'
      Origin = 'PACIENTE.NM_PACIENTE'
      Required = True
      Size = 50
    end
    object qyPacienteExistenteDT_NASCIMENTO: TDateField
      FieldName = 'DT_NASCIMENTO'
      Origin = 'PACIENTE.DT_NASCIMENTO'
      Required = True
    end
    object qyPacienteExistenteNM_MAE: TIBStringField
      FieldName = 'NM_MAE'
      Origin = 'PACIENTE.NM_MAE'
      Required = True
      Size = 50
    end
    object qyPacienteExistenteNR_PROCESSO_CRIANCA_EXP: TIBStringField
      FieldName = 'NR_PROCESSO_CRIANCA_EXP'
      Origin = 'PACIENTE.NR_PROCESSO_CRIANCA_EXP'
      Size = 15
    end
  end
  object dsPacienteExistente: TDataSource
    AutoEdit = False
    DataSet = qyPacienteExistente
    Left = 722
    Top = 191
  end
end
