object frmDigitalizar: TfrmDigitalizar
  Left = 159
  Top = 109
  Width = 673
  Height = 532
  Caption = 'DIG - Digitalizar Documentos'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = True
  Position = poDesktopCenter
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 475
    Height = 498
    Align = alClient
    Caption = 'Panel2'
    TabOrder = 1
    object ImageEnView1: TImageEnView
      Left = 1
      Top = 1
      Width = 473
      Height = 496
      ParentCtl3D = False
      MouseInteract = [miZoom, miScroll]
      OnProgress = ImageEnIO1Progress
      ImageEnVersion = '2.3.0'
      Align = alClient
      TabOrder = 0
      object ImageEn1: TImageEn
        Left = 152
        Top = 56
        Width = 105
        Height = 105
        ParentCtl3D = False
        ImageEnVersion = '2.3.0'
        TabOrder = 0
      end
      object ImageEnMView1: TImageEnMView
        Left = 152
        Top = 264
        Width = 180
        Height = 90
        ParentCtl3D = False
        SelectionWidth = 3
        SelectionColor = clRed
        ThumbnailsBorderColor = clBlack
        ImageEnVersion = '2.3.0'
        TabOrder = 1
      end
    end
  end
  object Panel1: TPanel
    Left = 475
    Top = 0
    Width = 190
    Height = 498
    Align = alRight
    BevelOuter = bvNone
    TabOrder = 0
    object GroupBox1: TGroupBox
      Left = 8
      Top = 59
      Width = 174
      Height = 201
      Caption = ' Options '
      TabOrder = 0
      OnDblClick = GroupBox1DblClick
      object Label1: TLabel
        Left = 8
        Top = 120
        Width = 31
        Height = 13
        Caption = 'DPI-Y:'
      end
      object Label2: TLabel
        Left = 8
        Top = 144
        Width = 31
        Height = 13
        Caption = 'DPI-X:'
      end
      object Label3: TLabel
        Left = 8
        Top = 168
        Width = 34
        Height = 13
        Caption = 'Colors:'
      end
      object CheckBox1: TCheckBox
        Left = 8
        Top = 16
        Width = 124
        Height = 17
        Caption = 'Scanner dialog visible'
        TabOrder = 0
      end
      object Edit1: TEdit
        Left = 44
        Top = 116
        Width = 53
        Height = 21
        TabOrder = 1
      end
      object Edit2: TEdit
        Left = 44
        Top = 140
        Width = 53
        Height = 21
        TabOrder = 2
      end
      object ComboBox2: TComboBox
        Left = 44
        Top = 164
        Width = 110
        Height = 21
        Style = csDropDownList
        ItemHeight = 13
        TabOrder = 3
      end
      object CheckBox2: TCheckBox
        Left = 8
        Top = 40
        Width = 161
        Height = 17
        Caption = 'Scanner progress bar visible'
        TabOrder = 4
      end
      object CheckBox3: TCheckBox
        Left = 8
        Top = 64
        Width = 153
        Height = 17
        Caption = 'Real time image display'
        Checked = True
        State = cbChecked
        TabOrder = 5
      end
      object CheckBox4: TCheckBox
        Left = 8
        Top = 88
        Width = 153
        Height = 17
        Caption = 'Buffered transfer'
        Checked = True
        State = cbChecked
        TabOrder = 6
      end
    end
    object GroupBox2: TGroupBox
      Left = 8
      Top = 8
      Width = 174
      Height = 49
      Caption = ' Select scanner '
      TabOrder = 1
      object ComboBox1: TComboBox
        Left = 16
        Top = 16
        Width = 145
        Height = 21
        Style = csDropDownList
        ItemHeight = 13
        TabOrder = 0
        OnChange = ComboBox1Change
      end
    end
    object GroupBox3: TGroupBox
      Left = 8
      Top = 259
      Width = 175
      Height = 129
      Caption = ' Acquire frame (inch)'
      TabOrder = 2
      object Label4: TLabel
        Left = 8
        Top = 21
        Width = 23
        Height = 13
        Caption = 'Left:'
      end
      object Label5: TLabel
        Left = 8
        Top = 40
        Width = 22
        Height = 13
        Caption = 'Top:'
      end
      object Label6: TLabel
        Left = 8
        Top = 62
        Width = 29
        Height = 13
        Caption = 'Right:'
      end
      object Label7: TLabel
        Left = 8
        Top = 84
        Width = 38
        Height = 13
        Caption = 'Bottom:'
      end
      object Edit3: TEdit
        Left = 56
        Top = 16
        Width = 96
        Height = 21
        Enabled = False
        TabOrder = 0
      end
      object Edit4: TEdit
        Left = 56
        Top = 38
        Width = 96
        Height = 21
        Enabled = False
        TabOrder = 1
      end
      object Edit5: TEdit
        Left = 56
        Top = 60
        Width = 96
        Height = 21
        Enabled = False
        TabOrder = 2
      end
      object Edit6: TEdit
        Left = 56
        Top = 82
        Width = 96
        Height = 21
        Enabled = False
        TabOrder = 3
      end
      object CheckBox5: TCheckBox
        Left = 8
        Top = 106
        Width = 97
        Height = 17
        Caption = 'Enable'
        TabOrder = 4
        OnClick = CheckBox5Click
      end
    end
    object Button1: TButton
      Left = 16
      Top = 446
      Width = 75
      Height = 25
      Caption = 'Acquire'
      TabOrder = 3
      OnClick = Button1Click
    end
    object Button2: TButton
      Left = 24
      Top = 417
      Width = 137
      Height = 25
      Caption = 'Negotiate parameters'
      TabOrder = 4
      OnClick = Button2Click
    end
    object ProgressBar1: TProgressBar
      Left = 8
      Top = 475
      Width = 177
      Height = 17
      TabOrder = 5
    end
    object Button3: TButton
      Left = 96
      Top = 445
      Width = 75
      Height = 25
      Caption = 'Save PDF'
      ModalResult = 1
      TabOrder = 6
    end
  end
  object ImageEnMIO1: TImageEnMIO
    PreviewFont.Charset = DEFAULT_CHARSET
    PreviewFont.Color = clWindowText
    PreviewFont.Height = -11
    PreviewFont.Name = 'MS Sans Serif'
    PreviewFont.Style = []
    Left = 313
    Top = 113
  end
  object ImageEnProc1: TImageEnProc
    Background = clBtnFace
    PreviewFont.Charset = DEFAULT_CHARSET
    PreviewFont.Color = clWindowText
    PreviewFont.Height = -11
    PreviewFont.Name = 'MS Sans Serif'
    PreviewFont.Style = []
    Left = 249
    Top = 233
  end
end
