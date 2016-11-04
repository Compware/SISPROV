object frmGerenciadorErros: TfrmGerenciadorErros
  Left = 263
  Top = 130
  Width = 998
  Height = 569
  Caption = 'Gerenciador de erros'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 990
    Height = 516
    Align = alClient
    TabOrder = 0
    object PageControl1: TPageControl
      Left = 1
      Top = 1
      Width = 988
      Height = 514
      ActivePage = TabSheet2
      Align = alClient
      TabOrder = 0
      OnChanging = PageControl1Changing
      object TabSheet2: TTabSheet
        Caption = 'Baixar e-mails'
        ImageIndex = 1
        DesignSize = (
          980
          486)
        object lblStatusDownload: TLabel
          Left = 0
          Top = 32
          Width = 3
          Height = 13
        end
        object memLog: TMemo
          Left = 0
          Top = 64
          Width = 980
          Height = 422
          Align = alBottom
          Anchors = [akLeft, akTop, akRight, akBottom]
          ScrollBars = ssVertical
          TabOrder = 0
        end
        object btIniciarDownload: TButton
          Left = 8
          Top = 1
          Width = 75
          Height = 25
          Caption = 'Iniciar'
          TabOrder = 1
          OnClick = btIniciarDownloadClick
        end
        object btPararDownload: TButton
          Left = 88
          Top = 1
          Width = 75
          Height = 25
          Caption = 'Parar'
          Enabled = False
          TabOrder = 2
          OnClick = btPararDownloadClick
        end
        object PbBaixarEmails: TProgressBar
          Left = 0
          Top = 46
          Width = 979
          Height = 17
          Anchors = [akLeft, akTop, akRight]
          Smooth = True
          TabOrder = 3
        end
      end
      object TabSheet1: TTabSheet
        Caption = 'Analizar email'
        ImageIndex = 1
        TabVisible = False
        object Label1: TLabel
          Left = 425
          Top = 39
          Width = 80
          Height = 13
          Caption = 'Data...................'
        end
        object Label2: TLabel
          Left = 425
          Top = 63
          Width = 81
          Height = 13
          Caption = 'Computador........'
        end
        object Label3: TLabel
          Left = 425
          Top = 87
          Width = 82
          Height = 13
          Caption = 'Unidade..............'
        end
        object Label4: TLabel
          Left = 425
          Top = 112
          Width = 81
          Height = 13
          Caption = 'Usu'#225'rio...............'
        end
        object Label5: TLabel
          Left = 425
          Top = 134
          Width = 82
          Height = 13
          Caption = 'Sistema...............'
        end
        object Label6: TLabel
          Left = 425
          Top = 158
          Width = 80
          Height = 13
          Caption = 'Local..................'
        end
        object Label7: TLabel
          Left = 425
          Top = 182
          Width = 83
          Height = 13
          Caption = 'Exception............'
        end
        object memEmail: TMemo
          Left = 0
          Top = 0
          Width = 417
          Height = 410
          ScrollBars = ssVertical
          TabOrder = 0
        end
        object BtAnalizar: TButton
          Left = 425
          Top = 1
          Width = 75
          Height = 25
          Caption = 'Analizar'
          TabOrder = 1
          OnClick = BtAnalizarClick
        end
        object edData: TEdit
          Left = 505
          Top = 33
          Width = 207
          Height = 21
          TabOrder = 2
        end
        object edComputador: TEdit
          Left = 505
          Top = 57
          Width = 207
          Height = 21
          TabOrder = 3
        end
        object edUnidade: TEdit
          Left = 505
          Top = 81
          Width = 207
          Height = 21
          TabOrder = 4
        end
        object edUsuario: TEdit
          Left = 505
          Top = 105
          Width = 207
          Height = 21
          TabOrder = 5
        end
        object edSistema: TEdit
          Left = 505
          Top = 129
          Width = 207
          Height = 21
          TabOrder = 6
        end
        object edLocal: TEdit
          Left = 505
          Top = 153
          Width = 207
          Height = 21
          TabOrder = 7
        end
        object memMsgPrincipal: TMemo
          Left = 424
          Top = 203
          Width = 289
          Height = 57
          ScrollBars = ssVertical
          TabOrder = 8
        end
        object edException: TEdit
          Left = 505
          Top = 177
          Width = 207
          Height = 21
          TabOrder = 9
        end
        object memMsgCompleta: TMemo
          Left = 424
          Top = 265
          Width = 289
          Height = 144
          ScrollBars = ssVertical
          TabOrder = 10
        end
      end
      object TabSheet3: TTabSheet
        Caption = 'Erros'
        ImageIndex = 2
        object Splitter1: TSplitter
          Left = 0
          Top = 273
          Width = 980
          Height = 3
          Cursor = crVSplit
          Align = alTop
        end
        object dxDBMemo1: TdxDBMemo
          Left = 0
          Top = 276
          Width = 980
          Align = alClient
          TabOrder = 0
          DataField = 'MSG_COMPLETA'
          DataSource = dsErros
          ReadOnly = True
          ScrollBars = ssVertical
          Height = 210
          StoredValues = 64
        end
        object Panel2: TPanel
          Left = 0
          Top = 0
          Width = 980
          Height = 273
          Align = alTop
          TabOrder = 1
          object LNErros: TLabel
            Left = 403
            Top = 36
            Width = 81
            Height = 13
            Caption = 'N'#250'mero de erros:'
          end
          object Label8: TLabel
            Left = 10
            Top = 9
            Width = 17
            Height = 13
            Caption = 'De:'
          end
          object Label9: TLabel
            Left = 8
            Top = 34
            Width = 19
            Height = 13
            Caption = 'At'#233':'
          end
          object Label10: TLabel
            Left = 162
            Top = 9
            Width = 50
            Height = 13
            Caption = 'Exception:'
          end
          object Label11: TLabel
            Left = 169
            Top = 34
            Width = 43
            Height = 13
            Caption = 'Unidade:'
          end
          object btAtualizarListaErros: TButton
            Left = 401
            Top = 5
            Width = 75
            Height = 25
            Caption = 'Atualizar'
            TabOrder = 0
            OnClick = btAtualizarListaErrosClick
          end
          object dxDBGrid1: TdxDBGrid
            Left = 1
            Top = 56
            Width = 978
            Height = 216
            Bands = <
              item
              end>
            DefaultLayout = True
            HeaderPanelRowCount = 1
            KeyField = 'CD_ERRO'
            ShowGroupPanel = True
            SummaryGroups = <>
            SummarySeparator = ', '
            Align = alBottom
            TabOrder = 1
            DataSource = dsErros
            Filter.Active = True
            Filter.CaseInsensitive = True
            Filter.Criteria = {00000000}
            OptionsBehavior = [edgoDragScroll, edgoEditing, edgoEnterShowEditor, edgoImmediateEditor, edgoTabThrough, edgoVertThrough]
            OptionsDB = [edgoCancelOnExit, edgoCanDelete, edgoCanInsert, edgoCanNavigation, edgoConfirmDelete, edgoLoadAllRecords, edgoUseBookmarks]
            OptionsView = [edgoBandHeaderWidth, edgoIndicator, edgoRowSelect, edgoUseBitmap]
            OnCalcSummary = dxDBGrid1CalcSummary
            Anchors = [akLeft, akTop, akRight, akBottom]
            object dxDBGrid1CD_ERRO: TdxDBGridMaskColumn
              Caption = 'Nr. Erro'
              Width = 60
              BandIndex = 0
              RowIndex = 0
              FieldName = 'CD_ERRO'
            end
            object dxDBGrid1DT_ERRO: TdxDBGridDateColumn
              Caption = 'Data Erro'
              Width = 100
              BandIndex = 0
              RowIndex = 0
              FieldName = 'DT_ERRO'
            end
            object dxDBGrid1DS_EXCEPTION: TdxDBGridMaskColumn
              Caption = 'Exception'
              Width = 120
              BandIndex = 0
              RowIndex = 0
              FieldName = 'DS_EXCEPTION'
            end
            object dxDBGrid1DS_UNIDADE: TdxDBGridMaskColumn
              Caption = 'Unidade'
              Width = 200
              BandIndex = 0
              RowIndex = 0
              FieldName = 'DS_UNIDADE'
            end
            object dxDBGrid1DS_COMPUTADOR: TdxDBGridMaskColumn
              Caption = 'Computador'
              Width = 120
              BandIndex = 0
              RowIndex = 0
              FieldName = 'DS_COMPUTADOR'
            end
            object dxDBGrid1DS_USUARIO: TdxDBGridMaskColumn
              Caption = 'Usu'#225'rio'
              Width = 140
              BandIndex = 0
              RowIndex = 0
              FieldName = 'DS_USUARIO'
            end
            object dxDBGrid1DS_SISTEMA: TdxDBGridMaskColumn
              Caption = 'Sistema'
              Width = 285
              BandIndex = 0
              RowIndex = 0
              FieldName = 'DS_SISTEMA'
            end
            object dxDBGrid1DS_LOCAL: TdxDBGridMaskColumn
              Caption = 'Local'
              Width = 176
              BandIndex = 0
              RowIndex = 0
              FieldName = 'DS_LOCAL'
            end
            object dxDBGrid1EMAIL_UID: TdxDBGridMaskColumn
              Caption = 'Email UID'
              Width = 70
              BandIndex = 0
              RowIndex = 0
              FieldName = 'EMAIL_UID'
            end
          end
          object dtDe: TdxDateEdit
            Left = 29
            Top = 6
            Width = 121
            TabOrder = 2
            Date = -700000.000000000000000000
          end
          object dtAte: TdxDateEdit
            Left = 29
            Top = 30
            Width = 121
            TabOrder = 3
            Date = -700000.000000000000000000
          end
          object edErroException: TdxLookupEdit
            Left = 213
            Top = 6
            Width = 178
            TabOrder = 4
            ReadOnly = False
            ListFieldName = 'DS_EXCEPTION'
            CanDeleteText = True
            KeyFieldName = 'DS_EXCEPTION'
            ListSource = dsException
            LookupKeyValue = ''
            StoredValues = 64
          end
          object edErroUnidade: TdxLookupEdit
            Left = 213
            Top = 30
            Width = 178
            TabOrder = 5
            ReadOnly = False
            ListFieldName = 'DS_UNIDADE'
            CanDeleteText = True
            KeyFieldName = 'DS_UNIDADE'
            ListSource = dsUnidade
            LookupKeyValue = ''
            StoredValues = 64
          end
        end
      end
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 516
    Width = 990
    Height = 19
    Panels = <
      item
        Width = 150
      end
      item
        Width = 100
      end>
  end
  object OpenSSLHandler: TIdSSLIOHandlerSocket
    SSLOptions.Method = sslvSSLv3
    SSLOptions.Mode = sslmUnassigned
    SSLOptions.VerifyMode = []
    SSLOptions.VerifyDepth = 0
    Left = 216
  end
  object IMAPClient: TIdIMAP4
    OnStatus = IMAPClientStatus
    MaxLineAction = maException
    ReadTimeout = 0
    Port = 993
    Left = 192
  end
  object XPManifest1: TXPManifest
    Left = 242
  end
  object DB: TIBDatabase
    Connected = True
    DatabaseName = 
      '10.0.2.2:C:\Compware\Bases\SISPROV\data\UTILITARIOS\UTILITARIOS.' +
      'GDB'
    Params.Strings = (
      'user_name=sysdba'
      'password=masterkey')
    LoginPrompt = False
    DefaultTransaction = TS
    IdleTimer = 0
    SQLDialect = 3
    TraceFlags = [tfQExecute, tfError, tfTransact]
    AllowStreamedConnected = False
    AfterConnect = DBAfterConnect
    AfterDisconnect = DBAfterDisconnect
    Left = 301
    Top = 1
  end
  object TS: TIBTransaction
    Active = False
    DefaultDatabase = DB
    AutoStopAction = saNone
    Left = 325
    Top = 1
  end
  object dsErros: TDataSource
    DataSet = IBQueryErros
    Left = 418
    Top = 1
  end
  object IbSqlUIDExiste: TIBSQL
    Database = DB
    ParamCheck = True
    SQL.Strings = (
      'SELECT EMAIL_UID FROM ERRO WHERE EMAIL_UID = :EMAIL_UID')
    Transaction = TS
    Left = 469
    Top = 1
  end
  object IBQueryErros: TIBQuery
    Database = DB
    Transaction = TS
    AfterOpen = IBQueryErrosAfterOpen
    BeforeOpen = IBQueryErrosBeforeOpen
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select'
      '       '#39'TODOS'#39' TODOS '
      '      ,"ERRO"."CD_ERRO"'
      '      ,"ERRO"."DT_ERRO"'
      '      ,"ERRO"."DS_COMPUTADOR"'
      '      ,"ERRO"."DS_UNIDADE"'
      '      ,"ERRO"."DS_USUARIO"'
      '      ,"ERRO"."DS_SISTEMA"'
      '      ,"ERRO"."DS_LOCAL"'
      '      ,"ERRO"."DS_EXCEPTION"'
      '      ,"ERRO"."MSG_PRINCIPAL"'
      '      ,"ERRO"."MSG_COMPLETA"'
      '      ,"ERRO"."EMAIL_UID"'
      'from "ERRO"'
      'WHERE DT_ERRO Between :DE and :ATE'
      '/* WHERE */'
      'order by'
      '"ERRO"."DT_ERRO" DESC')
    Left = 389
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'DE'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ATE'
        ParamType = ptUnknown
      end>
    object IBQueryErrosCD_ERRO: TIntegerField
      FieldName = 'CD_ERRO'
      Origin = 'ERRO.CD_ERRO'
      Required = True
    end
    object IBQueryErrosDT_ERRO: TDateTimeField
      FieldName = 'DT_ERRO'
      Origin = 'ERRO.DT_ERRO'
    end
    object IBQueryErrosDS_COMPUTADOR: TIBStringField
      FieldName = 'DS_COMPUTADOR'
      Origin = 'ERRO.DS_COMPUTADOR'
      Size = 50
    end
    object IBQueryErrosDS_UNIDADE: TIBStringField
      FieldName = 'DS_UNIDADE'
      Origin = 'ERRO.DS_UNIDADE'
      Size = 100
    end
    object IBQueryErrosDS_USUARIO: TIBStringField
      FieldName = 'DS_USUARIO'
      Origin = 'ERRO.DS_USUARIO'
      Size = 100
    end
    object IBQueryErrosDS_SISTEMA: TIBStringField
      FieldName = 'DS_SISTEMA'
      Origin = 'ERRO.DS_SISTEMA'
      Size = 100
    end
    object IBQueryErrosDS_LOCAL: TIBStringField
      FieldName = 'DS_LOCAL'
      Origin = 'ERRO.DS_LOCAL'
      Size = 100
    end
    object IBQueryErrosDS_EXCEPTION: TIBStringField
      FieldName = 'DS_EXCEPTION'
      Origin = 'ERRO.DS_EXCEPTION'
      Size = 50
    end
    object IBQueryErrosMSG_PRINCIPAL: TMemoField
      FieldName = 'MSG_PRINCIPAL'
      Origin = 'ERRO.MSG_PRINCIPAL'
      BlobType = ftMemo
      Size = 8
    end
    object IBQueryErrosMSG_COMPLETA: TMemoField
      FieldName = 'MSG_COMPLETA'
      Origin = 'ERRO.MSG_COMPLETA'
      BlobType = ftMemo
      Size = 8
    end
    object IBQueryErrosEMAIL_UID: TIBStringField
      FieldName = 'EMAIL_UID'
      Origin = 'ERRO.EMAIL_UID'
      Size = 10
    end
    object IBQueryErrosTODOS: TIBStringField
      FieldName = 'TODOS'
      Required = True
      FixedChar = True
      Size = 5
    end
  end
  object IBSQLInseriErro: TIBSQL
    Database = DB
    ParamCheck = True
    SQL.Strings = (
      'insert into "ERRO"'
      '('
      '  "CD_ERRO"'
      ', "DT_ERRO"'
      ', "DS_COMPUTADOR"'
      ', "DS_UNIDADE"'
      ', "DS_USUARIO"'
      ', "DS_SISTEMA"'
      ', "DS_LOCAL"'
      ', "DS_EXCEPTION"'
      ', "MSG_PRINCIPAL"'
      ', "MSG_COMPLETA"'
      ', "EMAIL_UID"'
      ')'
      'values'
      '('
      '  (SELECT NEXT VALUE FOR GEN_ERRO FROM RDB$DATABASE)'
      ', :"DT_ERRO"'
      ', :"DS_COMPUTADOR"'
      ', :"DS_UNIDADE"'
      ', :"DS_USUARIO"'
      ', :"DS_SISTEMA"'
      ', :"DS_LOCAL"'
      ', :"DS_EXCEPTION"'
      ', :"MSG_PRINCIPAL"'
      ', :"MSG_COMPLETA"'
      ', :"EMAIL_UID"'
      ')')
    Transaction = TS
    Left = 520
  end
  object qyUnidade: TIBQuery
    Database = DB
    Transaction = TS
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'SELECT DISTINCT DS_UNIDADE FROM ERRO order by DS_UNIDADE')
    Left = 389
    Top = 65
    object qyUnidadeDS_UNIDADE: TIBStringField
      FieldName = 'DS_UNIDADE'
      Origin = 'ERRO.DS_UNIDADE'
      Size = 100
    end
  end
  object qyException: TIBQuery
    Database = DB
    Transaction = TS
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'SELECT DISTINCT DS_EXCEPTION FROM ERRO order by DS_EXCEPTION')
    Left = 389
    Top = 33
    object qyExceptionDS_EXCEPTION: TIBStringField
      FieldName = 'DS_EXCEPTION'
      Origin = 'ERRO.DS_EXCEPTION'
      Size = 50
    end
  end
  object dsException: TDataSource
    DataSet = qyException
    Left = 418
    Top = 32
  end
  object dsUnidade: TDataSource
    DataSet = qyUnidade
    Left = 418
    Top = 65
  end
  object IdAntiFreeze1: TIdAntiFreeze
    Left = 168
  end
  object IBSQLErroExiste: TIBSQL
    Database = DB
    ParamCheck = True
    SQL.Strings = (
      
        'SELECT CD_ERRO FROM ERRO WHERE DT_ERRO = :DT_ERRO AND MSG_PRINCI' +
        'PAL = :MSG_PRINCIPAL')
    Transaction = TS
    Left = 496
  end
end
