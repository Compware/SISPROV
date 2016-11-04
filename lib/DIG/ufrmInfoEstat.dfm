object frmInfoEstat: TfrmInfoEstat
  Left = 368
  Top = 189
  Width = 279
  Height = 307
  Caption = 'Informa'#231#245'es Estat'#237'sticas'
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
  object Label1: TLabel
    Left = 16
    Top = 16
    Width = 124
    Height = 13
    Caption = 'Numero de Processos'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 16
    Top = 40
    Width = 111
    Height = 13
    Caption = 'Numero de P'#225'ginas'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lbProc: TLabel
    Left = 154
    Top = 16
    Width = 3
    Height = 13
  end
  object lbPaginas: TLabel
    Left = 154
    Top = 40
    Width = 3
    Height = 13
  end
  object Label3: TLabel
    Left = 16
    Top = 64
    Width = 112
    Height = 13
    Caption = 'Processos por Data'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object mmProcData: TMemo
    Left = 16
    Top = 80
    Width = 241
    Height = 145
    Color = cl3DLight
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Courier'
    Font.Style = []
    ParentFont = False
    ReadOnly = True
    TabOrder = 0
  end
  object BitBtn1: TBitBtn
    Left = 96
    Top = 240
    Width = 75
    Height = 25
    TabOrder = 1
    Kind = bkOK
  end
  object qyInfo: TIBQuery
    Database = dmDIG.dbDig
    Transaction = dmDIG.tsDig
    BufferChunks = 1000
    CachedUpdates = False
    Left = 128
    Top = 96
  end
end
