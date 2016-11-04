object frmFTP: TfrmFTP
  Left = 85
  Top = 145
  Width = 1024
  Height = 455
  Caption = 'FTP - APP'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel3: TBevel
    Left = 600
    Top = 8
    Width = 401
    Height = 84
  end
  object btLocal: TSpeedButton
    Left = 222
    Top = 8
    Width = 23
    Height = 22
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000120B0000120B00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00303333333333
      333337F3333333333333303333333333333337F33FFFFF3FF3FF303300000300
      300337FF77777F77377330000BBB0333333337777F337F33333330330BB00333
      333337F373F773333333303330033333333337F3377333333333303333333333
      333337F33FFFFF3FF3FF303300000300300337FF77777F77377330000BBB0333
      333337777F337F33333330330BB00333333337F373F773333333303330033333
      333337F3377333333333303333333333333337FFFF3FF3FFF333000003003000
      333377777F77377733330BBB0333333333337F337F33333333330BB003333333
      333373F773333333333330033333333333333773333333333333}
    NumGlyphs = 2
    OnClick = btLocalClick
  end
  object btLeft: TSpeedButton
    Left = 246
    Top = 40
    Width = 23
    Height = 22
    Hint = 'Download'
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000120B0000120B00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
      3333333333333333333333333333333333333333333333333333333333333333
      3333333333333FF3333333333333003333333333333F77F33333333333009033
      333333333F7737F333333333009990333333333F773337FFFFFF330099999000
      00003F773333377777770099999999999990773FF33333FFFFF7330099999000
      000033773FF33777777733330099903333333333773FF7F33333333333009033
      33333333337737F3333333333333003333333333333377333333333333333333
      3333333333333333333333333333333333333333333333333333333333333333
      3333333333333333333333333333333333333333333333333333}
    NumGlyphs = 2
    ParentShowHint = False
    ShowHint = True
    OnClick = btLeftClick
  end
  object btRigth: TSpeedButton
    Left = 246
    Top = 64
    Width = 23
    Height = 22
    Hint = 'Upload'
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000120B0000120B00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
      3333333333333333333333333333333333333333333333333333333333333333
      3333333333333333333333333333333333333333333FF3333333333333003333
      3333333333773FF3333333333309003333333333337F773FF333333333099900
      33333FFFFF7F33773FF30000000999990033777777733333773F099999999999
      99007FFFFFFF33333F7700000009999900337777777F333F7733333333099900
      33333333337F3F77333333333309003333333333337F77333333333333003333
      3333333333773333333333333333333333333333333333333333333333333333
      3333333333333333333333333333333333333333333333333333}
    NumGlyphs = 2
    ParentShowHint = False
    ShowHint = True
    OnClick = btRigthClick
  end
  object btDeleteFTP: TSpeedButton
    Left = 246
    Top = 88
    Width = 23
    Height = 22
    Hint = 'Apagar FTP'
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000120B0000120B00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
      3333333333333333333333333333333333333333333333333333333333333333
      3333333333333FF3333333333333003333333333333F77F33333333333009033
      333333333F7737F333333333009990333333333F773337FFFFFF330099999000
      00003F773333377777770099999999999990773FF33333FFFFF7330099999000
      000033773FF33777777733330099903333333333773FF7F33333333333009033
      33333333337737F3333333333333003333333333333377333333333333333333
      3333333333333333333333333333333333333333333333333333333333333333
      3333333333333333333333333333333333333333333333333333}
    NumGlyphs = 2
    ParentShowHint = False
    ShowHint = True
    OnClick = btDeleteFTPClick
  end
  object Label1: TLabel
    Left = 605
    Top = 18
    Width = 28
    Height = 13
    Caption = 'Nome'
  end
  object Label2: TLabel
    Left = 605
    Top = 42
    Width = 36
    Height = 13
    Caption = 'Destino'
  end
  object Label3: TLabel
    Left = 605
    Top = 66
    Width = 21
    Height = 13
    Caption = 'Tipo'
  end
  object btZip: TSpeedButton
    Left = 246
    Top = 137
    Width = 23
    Height = 22
    Hint = 'Compactar'
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000120B0000120B00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00370777033333
      3330337F3F7F33333F3787070003333707303F737773333373F7007703333330
      700077337F3333373777887007333337007733F773F333337733700070333333
      077037773733333F7F37703707333300080737F373333377737F003333333307
      78087733FFF3337FFF7F33300033330008073F3777F33F777F73073070370733
      078073F7F7FF73F37FF7700070007037007837773777F73377FF007777700730
      70007733FFF77F37377707700077033707307F37773F7FFF7337080777070003
      3330737F3F7F777F333778080707770333333F7F737F3F7F3333080787070003
      33337F73FF737773333307800077033333337337773373333333}
    NumGlyphs = 2
    ParentShowHint = False
    ShowHint = True
    OnClick = btZipClick
  end
  object Bevel1: TBevel
    Left = 504
    Top = 8
    Width = 83
    Height = 109
  end
  object Bevel2: TBevel
    Left = 504
    Top = 129
    Width = 82
    Height = 48
  end
  object btDeleteLOC: TSpeedButton
    Left = 246
    Top = 112
    Width = 23
    Height = 22
    Hint = 'Apagar Local'
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000120B0000120B00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
      3333333333333333333333333333333333333333333333333333333333333333
      3333333333333333333333333333333333333333333FF3333333333333003333
      3333333333773FF3333333333309003333333333337F773FF333333333099900
      33333FFFFF7F33773FF30000000999990033777777733333773F099999999999
      99007FFFFFFF33333F7700000009999900337777777F333F7733333333099900
      33333333337F3F77333333333309003333333333337F77333333333333003333
      3333333333773333333333333333333333333333333333333333333333333333
      3333333333333333333333333333333333333333333333333333}
    NumGlyphs = 2
    ParentShowHint = False
    ShowHint = True
    OnClick = btDeleteLOCClick
  end
  object Label4: TLabel
    Left = 685
    Top = 66
    Width = 31
    Height = 13
    Caption = 'Ordem'
  end
  object Bevel4: TBevel
    Left = 504
    Top = 186
    Width = 82
    Height = 48
  end
  object Label5: TLabel
    Left = 512
    Top = 3
    Width = 24
    Height = 13
    Caption = 'FTP'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label6: TLabel
    Left = 512
    Top = 123
    Width = 43
    Height = 13
    Caption = 'MYSQL'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label7: TLabel
    Left = 512
    Top = 180
    Width = 42
    Height = 13
    Caption = 'GERAL'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object btPanSQL: TSpeedButton
    Left = 947
    Top = 42
    Width = 23
    Height = 22
    AllowAllUp = True
    GroupIndex = 1
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000120B0000120B00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
      333333FFFFFFFFFFFFF3344444444444443337777777777777F334CCCCCCCCCC
      C43337777777777777F33444881B188444333777F3737337773333308881FF70
      33333337F3373337F3333330888BF770333333373F33F337333333330881F703
      3333333373F73F7333333333308B703333333333373F77333333333333080333
      3333333333777FF333333333301F103333333333377777FF3333333301B1F103
      333333337737777FF3333330881BFB7033333337F3737F77F333333088881F70
      333333F7F3337777FFF334448888888444333777FFFFFFF777F334CCCCCCCCCC
      C43337777777777777F334444444444444333777777777777733}
    NumGlyphs = 2
    OnClick = btPanSQLClick
  end
  object SpeedButton1: TSpeedButton
    Left = 248
    Top = 168
    Width = 23
    Height = 22
    OnClick = SpeedButton1Click
  end
  object btAtualizar: TButton
    Left = 507
    Top = 21
    Width = 75
    Height = 25
    Caption = 'Atualizar'
    TabOrder = 0
    OnClick = btAtualizarClick
  end
  object tvFtp: TTreeView
    Left = 272
    Top = 32
    Width = 225
    Height = 353
    Indent = 19
    TabOrder = 1
  end
  object edLocal: TEdit
    Left = 8
    Top = 8
    Width = 209
    Height = 21
    TabOrder = 2
  end
  object edFTP: TEdit
    Left = 272
    Top = 8
    Width = 225
    Height = 21
    TabOrder = 3
    Text = '/web/edi/central/app/'
  end
  object flLocal: TFileListBox
    Left = 8
    Top = 32
    Width = 233
    Height = 353
    ItemHeight = 13
    TabOrder = 4
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 402
    Width = 1016
    Height = 19
    Panels = <>
  end
  object btConectar: TButton
    Left = 507
    Top = 53
    Width = 75
    Height = 25
    Caption = 'Conectar'
    TabOrder = 6
    OnClick = btConectarClick
  end
  object btDesConectar: TButton
    Left = 507
    Top = 85
    Width = 75
    Height = 25
    Caption = 'Desconectar'
    TabOrder = 7
    OnClick = btDesConectarClick
  end
  object btVersao: TButton
    Left = 508
    Top = 144
    Width = 75
    Height = 25
    Caption = 'Vers'#227'o'
    TabOrder = 8
    OnClick = btVersaoClick
  end
  object edNome: TEdit
    Left = 645
    Top = 15
    Width = 289
    Height = 21
    TabOrder = 9
  end
  object edDestino: TEdit
    Left = 645
    Top = 39
    Width = 289
    Height = 21
    TabOrder = 10
  end
  object edTipo: TEdit
    Left = 645
    Top = 63
    Width = 33
    Height = 21
    TabOrder = 11
  end
  object ckExec: TCheckBox
    Left = 774
    Top = 67
    Width = 67
    Height = 17
    Caption = 'Executar'
    TabOrder = 12
  end
  object btGravar: TButton
    Left = 873
    Top = 67
    Width = 55
    Height = 21
    Caption = 'Gravar'
    TabOrder = 13
    OnClick = btGravarClick
  end
  object edCodigo: TEdit
    Left = 941
    Top = 15
    Width = 57
    Height = 21
    Color = cl3DLight
    Enabled = False
    TabOrder = 14
  end
  object btExcluir: TButton
    Left = 931
    Top = 67
    Width = 55
    Height = 21
    Caption = 'Excluir'
    TabOrder = 15
    OnClick = btExcluirClick
  end
  object grVersao: TdxDBGrid
    Left = 600
    Top = 96
    Width = 401
    Height = 289
    Bands = <
      item
      end>
    DefaultLayout = True
    HeaderPanelRowCount = 1
    KeyField = 'CD_VERAO'
    SummaryGroups = <>
    SummarySeparator = ', '
    TabOrder = 16
    DataSource = dsVersao
    Filter.Criteria = {00000000}
    OptionsView = [edgoAutoWidth, edgoBandHeaderWidth, edgoRowSelect, edgoUseBitmap]
    object grVersaoColumn1: TdxDBGridColumn
      Caption = 'Cod.'
      Width = 45
      BandIndex = 0
      RowIndex = 0
      FieldName = 'CD_VERSAO'
    end
    object grVersaoColumn2: TdxDBGridColumn
      Caption = 'Nome'
      Width = 77
      BandIndex = 0
      RowIndex = 0
      FieldName = 'NM_ARQUIVO'
    end
    object grVersaoColumn3: TdxDBGridColumn
      Caption = 'Destino'
      Width = 77
      BandIndex = 0
      RowIndex = 0
      FieldName = 'NM_DESTINO'
    end
    object grVersaoColumn4: TdxDBGridDateColumn
      Caption = 'Data'
      Width = 69
      BandIndex = 0
      RowIndex = 0
      FieldName = 'DT_ARQUIVO'
    end
    object grVersaoColumn5: TdxDBGridCheckColumn
      Caption = 'Exec'
      Width = 43
      BandIndex = 0
      RowIndex = 0
      FieldName = 'FL_EXECUTAR'
      ValueChecked = '1'
      ValueGrayed = '0'
      ValueUnchecked = '0'
    end
    object grVersaoColumn6: TdxDBGridColumn
      Caption = 'Tipo'
      Width = 29
      BandIndex = 0
      RowIndex = 0
      FieldName = 'TP_ARQUIVO'
    end
    object grVersaoColumn7: TdxDBGridColumn
      Caption = 'Ordem'
      Width = 40
      BandIndex = 0
      RowIndex = 0
      FieldName = 'NR_ORDEM'
    end
  end
  object btConfig: TButton
    Left = 509
    Top = 200
    Width = 75
    Height = 25
    Caption = 'Configurar'
    TabOrder = 17
    OnClick = btConfigClick
  end
  object edOrdem: TEdit
    Left = 722
    Top = 63
    Width = 33
    Height = 21
    TabOrder = 18
  end
  object pnSQL: TPanel
    Left = 608
    Top = 184
    Width = 361
    Height = 193
    Caption = 'pnSQL'
    TabOrder = 19
    Visible = False
    object mmSQL: TMemo
      Left = 1
      Top = 42
      Width = 359
      Height = 150
      Align = alClient
      TabOrder = 0
    end
    object Panel1: TPanel
      Left = 1
      Top = 1
      Width = 359
      Height = 41
      Align = alTop
      Caption = 'Panel1'
      TabOrder = 1
      object btExec: TButton
        Left = 152
        Top = 8
        Width = 121
        Height = 25
        Caption = 'SQL - Executar'
        TabOrder = 0
        OnClick = btExecClick
      end
    end
  end
  object OpenDialog1: TOpenDialog
    Left = 365
    Top = 81
  end
  object dsVersao: TDataSource
    DataSet = frmMySqlFTP.ZQuery1
    OnDataChange = dsVersaoDataChange
    Left = 664
    Top = 152
  end
  object ZipMaster1: TZipMaster
    AddOptions = []
    AddStoreSuffixes = [assGIF, assPNG, assZ, assZIP, assZOO, assARC, assLZH, assARJ, assTAZ, assTGZ, assLHA, assRAR, assACE, assCAB, assGZ, assGZIP, assJAR, assJPG, assJPEG, ass7Zp, assMP3, assWMV, assWMA, assDVR, assAVI]
    ConfirmErase = False
    DLL_Load = False
    ExtrOptions = []
    KeepFreeOnAllDisks = 0
    KeepFreeOnDisk1 = 0
    LanguageID = 0
    MaxVolumeSizeKb = 0
    NoReadAux = False
    SFXOptions = []
    SFXOverwriteMode = ovrAlways
    SpanOptions = []
    Trace = False
    Unattended = False
    UseUTF8 = False
    Verbose = False
    Version = '1.9.1.0023'
    WriteOptions = []
    Left = 366
    Top = 114
  end
end
