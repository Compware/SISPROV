inherited frmCadProcesso: TfrmCadProcesso
  Left = 235
  Top = 134
  Caption = 'Cadastro de Processo'
  ClientWidth = 613
  PixelsPerInch = 96
  TextHeight = 13
  inherited StatusBar1: TStatusBar
    Width = 613
  end
  inherited Panel1: TPanel
    Width = 613
    inherited btfechar: TBitBtn
      Left = 565
    end
  end
  inherited Panel2: TPanel
    Width = 613
    inherited pgGeral: TPageControl
      Width = 611
      ActivePage = tabGeral
      inherited tabLista: TTabSheet
        TabVisible = False
        inherited Panel3: TPanel
          Width = 603
          inherited grDados: TdxDBGrid
            Width = 601
            Filter.Criteria = {00000000}
          end
        end
      end
      inherited tabGeral: TTabSheet
        inherited Panel4: TPanel
          Width = 603
          inline framPaciente1: TframDigPaciente
            Left = 1
            Top = 1
            Width = 601
            Height = 314
            Align = alClient
            AutoScroll = False
            TabOrder = 0
            inherited GroupBox2: TGroupBox
              inherited dxDBEdit16: TdxDBEdit [13]
              end
              inherited dxDBEdit4: TdxDBEdit [14]
              end
              inherited dxDBEdit5: TdxDBEdit [15]
              end
              inherited dxDBEdit3: TdxDBEdit [16]
              end
              inherited dxDBEdit2: TdxDBEdit [17]
              end
              inherited DBDateEdit3: TDBDateEdit [18]
              end
            end
          end
        end
      end
    end
  end
  inherited dsControle: TDataSource
    DataSet = dmDIG.tbDig_Processo
  end
  inherited dsGrid: TDataSource
    DataSet = dmDIG.tbDig_Processo
  end
end
