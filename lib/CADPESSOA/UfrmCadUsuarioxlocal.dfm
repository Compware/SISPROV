inherited frmCadUsuarioxLocal: TfrmCadUsuarioxLocal
  Left = 201
  Top = 169
  Caption = 'Cadastro Usuario x Local'
  ClientHeight = 388
  ClientWidth = 588
  PixelsPerInch = 96
  TextHeight = 13
  inherited StatusBar1: TStatusBar
    Top = 369
    Width = 588
  end
  inherited Panel1: TPanel
    Width = 588
    DesignSize = (
      588
      52)
    inherited btfechar: TBitBtn
      Left = 540
    end
  end
  inherited Panel2: TPanel
    Width = 588
    Height = 317
    inherited pgGeral: TPageControl
      Width = 586
      Height = 315
      inherited tabLista: TTabSheet
        inherited Panel3: TPanel
          Width = 578
          Height = 287
          inherited grDados: TdxDBGrid
            Width = 576
            Height = 285
            Filter.Criteria = {00000000}
            object grDadosCD_USUARIO: TdxDBGridMaskColumn
              Caption = 'Usu'#225'rio'
              BandIndex = 0
              RowIndex = 0
              FieldName = 'CD_USUARIO'
            end
            object grDadosNM_USUARIO: TdxDBGridMaskColumn
              Caption = 'Nome'
              Width = 341
              BandIndex = 0
              RowIndex = 0
              FieldName = 'NM_USUARIO'
            end
          end
        end
      end
      inherited tabGeral: TTabSheet
        inherited Panel4: TPanel
          Width = 578
          Height = 287
          object Label1: TLabel
            Left = 12
            Top = 11
            Width = 33
            Height = 13
            Caption = 'C'#243'digo'
            FocusControl = DBEdit1
          end
          object Label4: TLabel
            Left = 122
            Top = 11
            Width = 28
            Height = 13
            Caption = 'Nome'
            FocusControl = DBEdit4
          end
          object btIncLoc: TSpeedButton
            Left = 423
            Top = 64
            Width = 23
            Height = 21
            Hint = 'Incluir'
            Glyph.Data = {
              76010000424D7601000000000000760000002800000020000000100000000100
              04000000000000010000130B0000130B00001000000000000000000000000000
              800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF0033333333B333
              333B33FF33337F3333F73BB3777BB7777BB3377FFFF77FFFF77333B000000000
              0B3333777777777777333330FFFFFFFF07333337F33333337F333330FFFFFFFF
              07333337F33333337F333330FFFFFFFF07333337F33333337F333330FFFFFFFF
              07333FF7F33333337FFFBBB0FFFFFFFF0BB37777F3333333777F3BB0FFFFFFFF
              0BBB3777F3333FFF77773330FFFF000003333337F333777773333330FFFF0FF0
              33333337F3337F37F3333330FFFF0F0B33333337F3337F77FF333330FFFF003B
              B3333337FFFF77377FF333B000000333BB33337777777F3377FF3BB3333BB333
              3BB33773333773333773B333333B3333333B7333333733333337}
            Layout = blGlyphBottom
            NumGlyphs = 2
            ParentShowHint = False
            ShowHint = True
            OnClick = btIncLocClick
          end
          object btDelLoc: TSpeedButton
            Left = 423
            Top = 85
            Width = 23
            Height = 21
            Hint = 'Excluir'
            Glyph.Data = {
              76010000424D7601000000000000760000002800000020000000100000000100
              04000000000000010000120B0000120B00001000000000000000000000000000
              800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00500005000555
              555557777F777555F55500000000555055557777777755F75555005500055055
              555577F5777F57555555005550055555555577FF577F5FF55555500550050055
              5555577FF77577FF555555005050110555555577F757777FF555555505099910
              555555FF75777777FF555005550999910555577F5F77777775F5500505509990
              3055577F75F77777575F55005055090B030555775755777575755555555550B0
              B03055555F555757575755550555550B0B335555755555757555555555555550
              BBB35555F55555575F555550555555550BBB55575555555575F5555555555555
              50BB555555555555575F555555555555550B5555555555555575}
            Layout = blGlyphBottom
            NumGlyphs = 2
            ParentShowHint = False
            ShowHint = True
            OnClick = btDelLocClick
          end
          object DBEdit1: TDBEdit
            Left = 12
            Top = 27
            Width = 109
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataField = 'CD_USUARIO'
            DataSource = dsGrid
            ReadOnly = True
            TabOrder = 0
          end
          object DBEdit4: TDBEdit
            Left = 122
            Top = 27
            Width = 300
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataField = 'NM_USUARIO'
            DataSource = dsGrid
            ReadOnly = True
            TabOrder = 1
          end
          object DBGrid1: TDBGrid
            Left = 13
            Top = 64
            Width = 408
            Height = 201
            Color = clInfoBk
            DataSource = dsControle
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
            ReadOnly = True
            TabOrder = 2
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = []
            Columns = <
              item
                Expanded = False
                FieldName = 'CD_LOCAL'
                Title.Caption = 'C'#243'digo'
                Width = 74
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'NM_LOCAL'
                Title.Caption = 'Nome'
                Width = 295
                Visible = True
              end>
          end
        end
      end
    end
  end
  inherited dsControle: TDataSource
    DataSet = DMGERAL.TB_USUARIO_LOCAL
    Left = 493
    Top = 189
  end
  inherited dsGrid: TDataSource
    AutoEdit = False
    DataSet = DMGERAL.qyUsuarios
    Left = 493
    Top = 229
  end
end
