object framTransfusao2: TframTransfusao2
  Left = 0
  Top = 0
  Width = 330
  Height = 137
  TabOrder = 0
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 330
    Height = 137
    Align = alClient
    TabOrder = 0
    object Label13: TLabel
      Left = 8
      Top = 1
      Width = 57
      Height = 13
      Caption = '23.a Data'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label11: TLabel
      Left = 128
      Top = 0
      Width = 36
      Height = 13
      Caption = 'Local:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label1: TLabel
      Left = 8
      Top = 33
      Width = 57
      Height = 13
      Caption = '23.b Data'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label2: TLabel
      Left = 128
      Top = 32
      Width = 36
      Height = 13
      Caption = 'Local:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label3: TLabel
      Left = 8
      Top = 65
      Width = 57
      Height = 13
      Caption = '23.c Data'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label4: TLabel
      Left = 128
      Top = 64
      Width = 36
      Height = 13
      Caption = 'Local:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label5: TLabel
      Left = 8
      Top = 97
      Width = 57
      Height = 13
      Caption = '23.d Data'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label6: TLabel
      Left = 128
      Top = 96
      Width = 36
      Height = 13
      Caption = 'Local:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object DBDateEdit3: TDBDateEdit
      Left = 6
      Top = 14
      Width = 121
      Height = 21
      DataField = 'DT_NASCIMENTO'
      DataSource = dsTransfusao
      NumGlyphs = 2
      TabOrder = 0
    end
    object dxDBEdit2: TdxDBEdit
      Left = 127
      Top = 13
      Width = 198
      TabOrder = 1
      DataField = 'NM_PACIENTE'
      DataSource = dsTransfusao
    end
    object DBDateEdit1: TDBDateEdit
      Left = 6
      Top = 46
      Width = 121
      Height = 21
      DataField = 'DT_NASCIMENTO'
      DataSource = dsTransfusao
      NumGlyphs = 2
      TabOrder = 2
    end
    object dxDBEdit1: TdxDBEdit
      Left = 127
      Top = 45
      Width = 198
      TabOrder = 3
      DataField = 'NM_PACIENTE'
      DataSource = dsTransfusao
    end
    object DBDateEdit2: TDBDateEdit
      Left = 6
      Top = 78
      Width = 121
      Height = 21
      DataField = 'DT_NASCIMENTO'
      DataSource = dsTransfusao
      NumGlyphs = 2
      TabOrder = 4
    end
    object dxDBEdit3: TdxDBEdit
      Left = 127
      Top = 77
      Width = 198
      TabOrder = 5
      DataField = 'NM_PACIENTE'
      DataSource = dsTransfusao
    end
    object DBDateEdit4: TDBDateEdit
      Left = 6
      Top = 110
      Width = 121
      Height = 21
      DataField = 'DT_NASCIMENTO'
      DataSource = dsTransfusao
      NumGlyphs = 2
      TabOrder = 6
    end
    object dxDBEdit4: TdxDBEdit
      Left = 127
      Top = 109
      Width = 198
      TabOrder = 7
      DataField = 'NM_PACIENTE'
      DataSource = dsTransfusao
    end
  end
  object dsTransfusao: TDataSource
    DataSet = DMGERAL.TB_NOTIFICACAO
    Left = 216
    Top = 24
  end
end
