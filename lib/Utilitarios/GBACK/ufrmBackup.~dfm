object Backup: TBackup
  Left = 385
  Top = 182
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Backup'
  ClientHeight = 349
  ClientWidth = 355
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  Visible = True
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object mmLog: TMemo
    Left = 0
    Top = 65
    Width = 355
    Height = 267
    Align = alClient
    ReadOnly = True
    TabOrder = 0
  end
  object pb: TProgressBar
    Left = 0
    Top = 332
    Width = 355
    Height = 17
    Align = alBottom
    TabOrder = 1
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 355
    Height = 65
    Align = alTop
    TabOrder = 2
    object btBackupFTP: TButton
      Left = 128
      Top = 16
      Width = 83
      Height = 33
      Caption = 'Fazer Backup'
      TabOrder = 0
      OnClick = btBackupFTPClick
    end
    object rgTipoBackup: TRadioGroup
      Left = 7
      Top = 3
      Width = 114
      Height = 57
      Caption = 'Tipo de backup'
      ItemIndex = 0
      Items.Strings = (
        'Pendrive'
        'FTP'
        'Pendrive + FTP')
      TabOrder = 1
    end
    object btRestaurar: TButton
      Left = 248
      Top = 16
      Width = 99
      Height = 33
      Caption = 'Restaurar Backup'
      TabOrder = 2
      OnClick = btRestaurarClick
    end
  end
  object bkp: TIBBackupService
    ServerName = '10.0.2.2'
    Protocol = TCP
    Params.Strings = (
      'user_name=sysdba'
      'password=masterkey')
    LoginPrompt = False
    TraceFlags = []
    Verbose = True
    BackupFile.Strings = (
      'C:\Compware\Bases\SISPROV\data\desen\RIS-TESTE.GBK')
    BlockingFactor = 0
    DatabaseName = 'C:\Compware\Bases\SISPROV\data\desen\RIS.GDB'
    Options = []
    Left = 104
    Top = 96
  end
  object rst: TIBRestoreService
    ServerName = '10.0.2.2'
    Protocol = TCP
    Params.Strings = (
      'user_name=sysdba'
      'password=masterkey')
    LoginPrompt = False
    TraceFlags = []
    Verbose = True
    PageBuffers = 0
    Options = [Replace, CreateNewDB]
    Left = 136
    Top = 96
  end
  object OpenDialog1: TOpenDialog
    Filter = '*.GBK, *.ZIP|*.gbk;*.zip|Todos|*.*'
    Left = 136
    Top = 128
  end
  object ZipMaster1: TZipMaster
    AddOptions = []
    AddStoreSuffixes = [assGIF, assPNG, assZ, assZIP, assZOO, assARC, assLZH, assARJ, assTAZ, assTGZ, assLHA, assRAR, assACE, assCAB, assGZ, assGZIP, assJAR, assJPG, assJPEG, ass7Zp, assMP3, assWMV, assWMA, assDVR, assAVI]
    ConfirmErase = False
    DLL_Load = False
    ExtrOptions = [ExtrOverWrite]
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
    Left = 216
    Top = 192
  end
  object dbConfig: TIBConfigService
    Protocol = TCP
    Params.Strings = (
      'user_name=sysdba'
      'password=masterkey')
    LoginPrompt = False
    TraceFlags = []
    Left = 64
    Top = 96
  end
end
