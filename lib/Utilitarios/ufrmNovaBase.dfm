object frmNovaBase: TfrmNovaBase
  Left = 250
  Top = 59
  Width = 789
  Height = 624
  Caption = 'Construtor Base SIS'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 781
    Height = 590
    ActivePage = TabSheet1
    Align = alClient
    TabOrder = 0
    object TabSheet1: TTabSheet
      Caption = 'Geral'
      object Panel3: TPanel
        Left = 0
        Top = 0
        Width = 773
        Height = 137
        Align = alTop
        TabOrder = 0
        object Label3: TLabel
          Left = 25
          Top = 11
          Width = 36
          Height = 13
          Caption = 'Tabela:'
        end
        object Label4: TLabel
          Left = 25
          Top = 35
          Width = 47
          Height = 13
          Caption = 'Provincia:'
        end
        object Label5: TLabel
          Left = 25
          Top = 59
          Width = 48
          Height = 13
          Caption = 'Municipio:'
        end
        object Label6: TLabel
          Left = 25
          Top = 83
          Width = 43
          Height = 13
          Caption = 'Unidade:'
        end
        object Label7: TLabel
          Left = 25
          Top = 107
          Width = 47
          Height = 13
          Caption = 'Mes/Ano:'
        end
        object Label1: TLabel
          Left = 315
          Top = 11
          Width = 17
          Height = 13
          Caption = 'De:'
        end
        object btDe: TSpeedButton
          Left = 725
          Top = 7
          Width = 23
          Height = 22
          OnClick = btDeClick
        end
        object Label2: TLabel
          Left = 307
          Top = 36
          Width = 25
          Height = 13
          Caption = 'Para:'
        end
        object btPara: TSpeedButton
          Left = 725
          Top = 31
          Width = 23
          Height = 22
          OnClick = btParaClick
        end
        object Label10: TLabel
          Left = 249
          Top = 83
          Width = 23
          Height = 13
          Caption = 'Und:'
        end
        object edTabela: TEdit
          Left = 96
          Top = 8
          Width = 146
          Height = 21
          TabOrder = 0
        end
        object edProvincia: TEdit
          Left = 96
          Top = 32
          Width = 146
          Height = 21
          TabOrder = 1
        end
        object edMunicipio: TEdit
          Left = 96
          Top = 56
          Width = 146
          Height = 21
          TabOrder = 2
        end
        object edUnidade: TEdit
          Left = 96
          Top = 80
          Width = 146
          Height = 21
          TabOrder = 3
        end
        object edMesAno: TEdit
          Left = 96
          Top = 104
          Width = 649
          Height = 21
          TabOrder = 4
        end
        object edDe: TEdit
          Left = 336
          Top = 8
          Width = 386
          Height = 21
          TabOrder = 5
          Text = '10.0.2.2:C:\Compware\Bases\SISPROV\data\Inls\RIS.GDB'
        end
        object edPara: TEdit
          Left = 336
          Top = 32
          Width = 386
          Height = 21
          TabOrder = 6
          Text = '10.0.2.2:C:\Compware\Bases\SISPROV\data\RISRangel\Rangel.GDB'
        end
        object btAbrir: TButton
          Left = 416
          Top = 72
          Width = 75
          Height = 25
          Caption = 'Abrir'
          TabOrder = 7
          OnClick = btAbrirClick
        end
        object btDelPara: TButton
          Left = 502
          Top = 72
          Width = 75
          Height = 25
          Caption = 'Apagar Para'
          TabOrder = 8
          OnClick = btDelParaClick
        end
        object btDePara: TButton
          Left = 588
          Top = 72
          Width = 75
          Height = 25
          Caption = 'De -> Para'
          TabOrder = 9
          OnClick = btDeParaClick
        end
        object btTodas: TButton
          Left = 672
          Top = 72
          Width = 75
          Height = 25
          Caption = 'Todas'
          TabOrder = 10
          OnClick = btTodasClick
        end
        object edUnd: TEdit
          Left = 274
          Top = 80
          Width = 39
          Height = 21
          TabOrder = 11
        end
      end
      object Panel1: TPanel
        Left = 0
        Top = 137
        Width = 773
        Height = 201
        Align = alTop
        TabOrder = 1
        object Label8: TLabel
          Left = 1
          Top = 1
          Width = 771
          Height = 13
          Align = alTop
          Caption = 'De'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clHotLight
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object grDe: TDBGrid
          Left = 1
          Top = 14
          Width = 771
          Height = 186
          Align = alClient
          DataSource = dsDe
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
        end
      end
      object Panel2: TPanel
        Left = 0
        Top = 338
        Width = 773
        Height = 201
        Align = alTop
        TabOrder = 2
        object Label9: TLabel
          Left = 1
          Top = 1
          Width = 771
          Height = 13
          Align = alTop
          Caption = 'Para'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clHotLight
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object grPara: TDBGrid
          Left = 1
          Top = 14
          Width = 771
          Height = 186
          Align = alClient
          DataSource = dsPara
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
        end
      end
      object pb: TProgressBar
        Left = 0
        Top = 545
        Width = 773
        Height = 17
        Align = alBottom
        TabOrder = 3
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'Tabelas'
      ImageIndex = 1
      object Panel4: TPanel
        Left = 8
        Top = 24
        Width = 203
        Height = 259
        BevelInner = bvSpace
        BevelOuter = bvLowered
        Caption = 'Panel4'
        TabOrder = 0
        object ckTabelas1: TCheckListBox
          Left = 8
          Top = 13
          Width = 185
          Height = 237
          ItemHeight = 13
          Items.Strings = (
            'PAIS'
            'PROVINCIA'
            'MUNICIPIO'
            'ESQUEMA'
            'ASPECTO_OMS'
            'OCUPACAO'
            'PERMISSAO'
            'SERVICOS'
            'TABELA'
            'TABELA_AUXILIAR'
            'TIPO_ABANDONO'
            'TIPO_DOCUMENTO'
            'CID10_CAPITULO'
            'CID10_CATEGORIA'
            'CID10_GRUPO'
            'CID10_SUBCATEGORIA'
            'EXAMES')
          TabOrder = 0
        end
      end
      object ckGrupo1: TCheckBox
        Left = 24
        Top = 16
        Width = 65
        Height = 17
        Caption = 'Grupo1'
        Checked = True
        State = cbChecked
        TabOrder = 1
      end
      object Panel5: TPanel
        Left = 216
        Top = 24
        Width = 203
        Height = 259
        BevelInner = bvSpace
        BevelOuter = bvLowered
        Caption = 'Panel4'
        TabOrder = 2
        object ckTabelas2: TCheckListBox
          Left = 8
          Top = 14
          Width = 185
          Height = 238
          ItemHeight = 13
          Items.Strings = (
            'BAIRRO'
            'COMUNA'
            'COMUNA_BAIRRO'
            'ENDERECO'
            'DOCUMENTO'
            'CONF_RELATORIO'
            'PESSOA'
            'PESSOA_DOC'
            'PESSOA_ENDERECO'
            'PROCESSO'
            'TELEFONE'
            'INVESTIGADOR'
            'EMPRESA'
            'ABANDONO_HIST'
            'PACIENTE'
            'AGENDA'
            'ATENDIMENTO'
            'ERRO'
            'EXAMES_AGENDA'
            'EXCECAO_IMPORTAR'
            'MAPA'
            'MEDICO'
            'NOTIFICACAO'
            'ASPECTO_NOTIFICACAO'
            'CIRCUNCISAO'
            'DENTARIO'
            'INTERV_CIRURGICA'
            'PERFURACAO'
            'TRANSFUSAO'
            'TATUAGEM'
            'GRUPO_USUARIO'
            'GRUPO_TRANSACAO'
            'LOTE'
            'USUARIO_GRUPO_USUARIO'
            'TRANSACAO_GRUPO_TRANSACAO'
            'CARACTERIZACAO'
            'PERMISSAO_USUARIO'
            'PROTOCOLO_ENVIO'
            'RECEITA'
            'REQUISICAO'
            'SCRIPT'
            'SEGUIMENTO_ENFERMAGEM'
            'ST_UNIDADE'
            'TMP_META'
            'TRIAGEM_ENFERMAGEM'
            'USUARIO'
            'USUARIO_CMP'
            'VALOR_PARAMETRO'
            'VERSAO_RELATORIO'
            'VINC_USUARIO_MEDICO'
            'AVALIACAO_INICIAL')
          TabOrder = 0
        end
      end
      object ckGrupo2: TCheckBox
        Left = 232
        Top = 16
        Width = 65
        Height = 17
        Caption = 'Grupo2'
        Checked = True
        State = cbChecked
        TabOrder = 3
      end
      object Panel6: TPanel
        Left = 424
        Top = 24
        Width = 225
        Height = 259
        BevelInner = bvSpace
        BevelOuter = bvLowered
        Caption = 'Panel4'
        TabOrder = 4
        object ckTabelas3: TCheckListBox
          Left = 8
          Top = 14
          Width = 209
          Height = 238
          ItemHeight = 13
          Items.Strings = (
            'UNIDADE'
            'UNIDADE_SERVICOS'
            'REGISTRO_ATV'
            'REGISTRO_ATV_AR'
            'REGISTRO_ATV_ARE'
            'REGISTRO_ATV_EDI'
            'REGISTRO_ATV_PAI'
            'REGISTRO_COINFECCAO'
            'REGISTRO_COINFECCAO_AR'
            'REGISTRO_COINFECCAO_ARE'
            'REGISTRO_COINFECCAO_EDI'
            'REGISTRO_COINFECCAO_PAI'
            'REGISTRO_CRIANCAS_EXP'
            'REGISTRO_PRE_NATAL'
            'REGISTRO_PROGRAMA'
            'REGISTRO_PROGRAMA_AR'
            'REGISTRO_PROGRAMA_ARE'
            'REGISTRO_PROGRAMA_EDI'
            'REGISTRO_PROGRAMA_PAI'
            'REGISTRO_PTV'
            'REGISTRO_PTV_AR'
            'REGISTRO_PTV_ARE'
            'REGISTRO_PTV_EDI'
            'REGISTRO_PTV_PAI'
            'REGISTRO_SERVICOS_ACOMP'
            'REGISTRO_SERVICOS_TARV'
            'REGISTRO_TARV'
            'REGISTRO_TARV_ACOMP'
            'REGISTRO_TARV_ACOMP_AR'
            'REGISTRO_TARV_ACOMP_ARE'
            'REGISTRO_TARV_ACOMP_EDI'
            'REGISTRO_TARV_ACOMP_PAI'
            'REGISTRO_TARV_AR'
            'REGISTRO_TARV_ARE'
            'REGISTRO_TARV_CD4'
            'REGISTRO_TARV_CD4_AR'
            'REGISTRO_TARV_CD4_ARE'
            'REGISTRO_TARV_CD4_EDI'
            'REGISTRO_TARV_CD4_PAI'
            'REGISTRO_TARV_EDI'
            'REGISTRO_TARV_ESQUEMA'
            'REGISTRO_TARV_ESQUEMA_AR'
            'REGISTRO_TARV_ESQUEMA_ARE'
            'REGISTRO_TARV_ESQUEMA_EDI'
            'REGISTRO_TARV_ESQUEMA_PAI'
            'REGISTRO_TARV_PAI'
            'REGISTRO_TESTES_POSITIVOS')
          TabOrder = 0
        end
      end
      object ckGrupo3: TCheckBox
        Left = 440
        Top = 16
        Width = 65
        Height = 17
        Caption = 'Grupo3'
        Checked = True
        State = cbChecked
        TabOrder = 5
      end
    end
    object TabSheet3: TTabSheet
      Caption = 'Log'
      ImageIndex = 2
      object mLog: TMemo
        Left = 0
        Top = 0
        Width = 773
        Height = 562
        Align = alClient
        TabOrder = 0
      end
    end
  end
  object ibDe: TIBDatabase
    Params.Strings = (
      'user_name=sysdba'
      'password=masterkey')
    LoginPrompt = False
    DefaultTransaction = tsDe
    IdleTimer = 0
    SQLDialect = 3
    TraceFlags = []
    Left = 16
    Top = 312
  end
  object ibPara: TIBDatabase
    Params.Strings = (
      'user_name=sysdba'
      'password=masterkey')
    LoginPrompt = False
    DefaultTransaction = tsPara
    IdleTimer = 0
    SQLDialect = 3
    TraceFlags = []
    Left = 96
    Top = 312
  end
  object tsDe: TIBTransaction
    Active = False
    DefaultDatabase = ibDe
    Params.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    AutoStopAction = saNone
    Left = 56
    Top = 312
  end
  object tsPara: TIBTransaction
    Active = False
    DefaultDatabase = ibPara
    Params.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    AutoStopAction = saNone
    Left = 136
    Top = 312
  end
  object tbDe: TIBDataSet
    Database = ibDe
    Transaction = tsDe
    BufferChunks = 1000
    CachedUpdates = False
    Left = 16
    Top = 352
  end
  object tbPara: TIBDataSet
    Database = ibPara
    Transaction = tsPara
    BufferChunks = 1000
    CachedUpdates = False
    Left = 56
    Top = 352
  end
  object dsDe: TDataSource
    DataSet = tbDe
    Left = 16
    Top = 392
  end
  object dsPara: TDataSource
    DataSet = tbPara
    Left = 56
    Top = 392
  end
  object qyCampos: TIBQuery
    Database = ibPara
    Transaction = tsPara
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select rdb$field_name NM_CAMPO'
      'from rdb$relation_constraints c,'
      '     rdb$index_segments i'
      'where c.rdb$relation_name = :NM_TABELA'
      'and c.rdb$constraint_type='#39'PRIMARY KEY'#39
      'and c.rdb$index_name = i.rdb$index_name')
    Left = 96
    Top = 352
    ParamData = <
      item
        DataType = ftString
        Name = 'NM_TABELA'
        ParamType = ptInput
      end>
    object qyCamposNM_CAMPO: TIBStringField
      FieldName = 'NM_CAMPO'
      Origin = 'RDB$INDEX_SEGMENTS.RDB$FIELD_NAME'
      FixedChar = True
      Size = 93
    end
  end
end