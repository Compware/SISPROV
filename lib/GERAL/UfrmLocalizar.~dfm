inherited frmLocalizar: TfrmLocalizar
  Left = 228
  Caption = ''
  OldCreateOrder = True
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    inherited Label1: TLabel
      Top = 11
    end
    inherited edLocalizar: TEdit
      Hint = 'Pesquisar por C'#243'digo'
      ParentShowHint = False
      ShowHint = True
      OnKeyDown = edLocalizarKeyDown
    end
  end
  inherited Panel2: TPanel
    Height = 352
    inherited TabControl1: TTabControl
      Height = 348
      OnChange = TabControl1Change
      inherited grDados: TdxDBGrid
        Height = 338
        OnDblClick = nil
        Filter.Criteria = {00000000}
      end
    end
  end
  inherited StatusBar1: TStatusBar
    Top = 425
    Height = 22
    Panels = <
      item
        Bevel = pbRaised
        Text = 'Pesquisar por C'#243'digo'
        Width = 50
      end>
  end
  inherited qyDados: TIBQuery
    SQL.Strings = (
      'select * from dual')
  end
end
