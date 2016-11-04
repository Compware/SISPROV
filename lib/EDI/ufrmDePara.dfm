object frmDePara: TfrmDePara
  Left = 416
  Top = 56
  Width = 789
  Height = 624
  Caption = 'De - > Para'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object mLog: TMemo
    Left = 8
    Top = 360
    Width = 761
    Height = 89
    TabOrder = 0
  end
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 781
    Height = 590
    ActivePage = TabSheet1
    Align = alClient
    TabOrder = 1
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
          Width = 625
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
          Text = '10.0.2.2:C:\Compware\Bases\SISPROV\data\RISRangel\RIS.GDB'
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
        object btComparar: TButton
          Left = 672
          Top = 72
          Width = 75
          Height = 25
          Caption = 'Comparar'
          TabOrder = 10
          OnClick = btCompararClick
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
      object ckTabelas: TCheckListBox
        Left = 8
        Top = 16
        Width = 185
        Height = 241
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
    Left = 488
    Top = 8
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
    Left = 600
    Top = 32
  end
  object tsDe: TIBTransaction
    Active = False
    DefaultDatabase = ibDe
    Params.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    AutoStopAction = saNone
    Left = 528
    Top = 8
  end
  object tsPara: TIBTransaction
    Active = False
    DefaultDatabase = ibPara
    Params.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    AutoStopAction = saNone
    Left = 640
    Top = 32
  end
  object tbDe: TIBDataSet
    Database = ibDe
    Transaction = tsDe
    BufferChunks = 1000
    CachedUpdates = False
    Left = 344
    Top = 216
  end
  object tbPara: TIBDataSet
    Database = ibPara
    Transaction = tsPara
    BufferChunks = 1000
    CachedUpdates = False
    Left = 400
    Top = 216
  end
  object dsDe: TDataSource
    DataSet = tbDe
    Left = 344
    Top = 256
  end
  object dsPara: TDataSource
    DataSet = tbPara
    Left = 400
    Top = 256
  end
end
