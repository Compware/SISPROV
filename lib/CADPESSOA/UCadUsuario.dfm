inherited frmCadUsuario: TfrmCadUsuario
  Left = 354
  Top = 29
  Caption = 'Cadastro de Usu'#225'rios'
  ClientHeight = 562
  ClientWidth = 784
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited sbPadrao: TStatusBar
    Top = 543
    Width = 784
  end
  inherited Panel1: TPanel
    Width = 784
    inherited btPesquisar: TBitBtn
      OnClick = btPesquisarClick
    end
    inherited btfechar: TBitBtn
      Left = 736
    end
  end
  inherited Panel2: TPanel
    Width = 784
    Height = 491
    inherited pgGeral: TPageControl
      Width = 782
      Height = 489
      inherited tabLista: TTabSheet
        inherited Panel3: TPanel
          Width = 774
          Height = 461
          inherited grDados: TdxDBGrid
            Width = 772
            Height = 459
            KeyField = 'CD_USUARIO'
            Filter.Criteria = {00000000}
            object grDadosCD_USUARIO: TdxDBGridMaskColumn
              Caption = 'C'#243'digo'
              BandIndex = 0
              RowIndex = 0
              FieldName = 'CD_USUARIO'
            end
            object grDadosNM_USUARIO: TdxDBGridMaskColumn
              Caption = 'Nome Completo'
              Width = 310
              BandIndex = 0
              RowIndex = 0
              FieldName = 'NM_USUARIO'
            end
            object grDadosNM_LOGIN: TdxDBGridMaskColumn
              Caption = 'Usu'#225'rio'
              Width = 182
              BandIndex = 0
              RowIndex = 0
              FieldName = 'NM_LOGIN'
            end
          end
        end
      end
      inherited tabGeral: TTabSheet
        inherited Panel4: TPanel
          Width = 774
          Height = 461
          object Label1: TLabel
            Left = 16
            Top = 16
            Width = 33
            Height = 13
            Caption = 'C'#243'digo'
            FocusControl = DBEdit1
          end
          object Label2: TLabel
            Left = 104
            Top = 16
            Width = 75
            Height = 13
            Caption = 'Nome Completo'
            FocusControl = DBEdit2
          end
          object GroupBox1: TGroupBox
            Left = 16
            Top = 56
            Width = 545
            Height = 109
            Caption = 'Login'
            TabOrder = 2
            object Label3: TLabel
              Left = 56
              Top = 16
              Width = 36
              Height = 13
              Caption = 'Usu'#225'rio'
              FocusControl = DBEdit3
            end
            object Label4: TLabel
              Left = 56
              Top = 56
              Width = 31
              Height = 13
              Caption = 'Senha'
              FocusControl = edSenha
            end
            object Label5: TLabel
              Left = 256
              Top = 56
              Width = 59
              Height = 13
              Caption = 'Confirma'#231#227'o'
            end
            object Image1: TImage
              Left = 16
              Top = 23
              Width = 32
              Height = 32
              AutoSize = True
              Picture.Data = {
                055449636F6E0000010001002020000001002000A81000001600000028000000
                2000000040000000010020000000000000100000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                00000000000000020000000A000000140000001C000000200000002400000024
                00000022000000200000001E0000001A000000140000000E0000000600000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000400000016000000320000004800000058160E00682D1D007800000062
                000000600000005E0000005C000000540000004A0000003C0000002A00000018
                0000000A00000002000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000002
                0000001474541B87926C27D39C701EF5A07219FF986708FF996505FF966301FF
                966201FF946101FD855700E57F5300D9613F00B5291B0083000000600000004C
                000000320000001A000000080000000000000000000000000000000000000000
                000000000000000000000000000000000000000000000000000000008A5B043C
                AD8C4DC3BA9652FFBA944EFFB68E42FFB18431FFAB7C22FFAC7D21FFAD7E22FF
                AE8022FFB08022FFAD7E1EFFAD7E1CFFA97915FFA06E0AFF825601DF4E3402A3
                000000660000004E0000002E0000001200000004000000000000000000000000
                00000000000000000000000000000000000000000000000000000000A77F32B1
                C09E5CFFC4A261FFC09C55FFB78E3FFFAE7F25FFAC7D21FFAD7E21FFAE8022FF
                B08123FFB18323FFB38524FFB58825FFB68925FFB88B26FFB58820FFAB7C12FF
                916406E95B3C02AF000000600000003C00000018000000040000000000000000
                00000000000000000000000000000000000000000000000095610032B1893CFF
                C6A565FFC5A464FFC19E59FFB78E3FFFAE7F23FFAD7E22FFAE8022FFB08223FF
                B28423FFB48624FFB68925FFB98C26FFBA8E27FFBC9027FFBD9228FFBE9328FF
                BD9124FFAF8013FF7A560BCB170F00740000003E000000120000000000000000
                00000000000000000000000000000000000000000000000095610056B38B40FF
                C6A665FFC7A769FFC3A05CFFBD974CFFAF8125FFAE7F22FFB08223FFB28423FF
                B48724FFB78A25FFBA8D26FFBC9027FFBE9328FFC19629FFC2972AFFC3982AFF
                C49A2AFFC59B2AFFBA8E1DFFAB7D15FF3A270178000000200000000200000000
                00000000000000000000000000000000000000000000000095610036A77B29FF
                C4A260FFC9AA6DFFC4A25EFFC09B54FFB2862CFFB08124FFB18323FFB48724FF
                B78A25FFBA8E27FFBD9228FFC19629FFC3992AFFC69C2BFFC79E2CFFC89E2CFF
                C89F2CFFC89F2CFFC89F2CFFC09522FF956E12C9000000220000000200000000
                00000000000000000000000000000000000000000000000095610002976304FF
                C19F5EFFCAAB6FFFC5A360FFC19E57FFBA923FFFB3862AFFB48627FFB78A27FF
                BA8E27FFBE9228FFC19729FFC59B2BFFC89F2CFFCAA22DFFCCA42EFFCDA52EFF
                CDA52EFFCDA52EFFCCA42EFFCCA32DFFBA8F19FF543600300000000000000000
                0000000000000000000000000000000000000000000000000000000095610074
                A67924FFCAAB71FFC6A566FFC4A25DFFC4A058FFC3A054FFC39E4DFFC5A04BFF
                C7A24AFFCAA647FFCAA53FFFCCA638FFCEA630FFCFA82FFFD1AA2FFFD2AB30FF
                D1AA30FFD1AA2FFFD1AA2FFFD0A92FFFAB7D0FFF603E001C0000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                95610097AC8233FFCBAD72FFC9AB6BFFC7A662FFC7A65DFFCAA85CFFCDAB5CFF
                D0AF5EFFD3B45FFFD6B75FFFD9BA5EFFDABB59FFD9B84CFFD8B53DFFD6B031FF
                D6AF31FFD5AF31FFD3AC30FFD0A92CFF9A6906C7000000020000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                9561000295610097B1883AFFCFB37AFFCFB276FFCFB170FFCFB16BFFD2B469FF
                D5B769FFD8BA68FFDABD67FFDDC066FFE0C366FFE2C565FFE3C664FFE0BF52FF
                DAB537FFD8B232FFD5AF31FFC0951FFF905E0056000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                000000009561000895610097AC802FFFD6BD8AFFD8C089FFD9C187FFDBC284FF
                C9B581FFA59C82FF8F8C82FF8A8882FF9C967FFFC5B374FFE5CA6AFFE5CA6AFF
                E1C152FFD6AF31FFC39927FF9561019700000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000009561008D9E6D13FFD4BB83FFDFCB99FF838383FF
                9B9FA1FFBAC3C7FFC5CDD1FFC7CED1FFBBC0C3FF919292FFB8AC7EFFDDC169FF
                BB902DFFA06E0DFF956100979561001A00000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000095610078986405FFBEA775FF9B9FA2FF
                CEDFE9FFCACDCEFFC9C9C9FFC9C9C9FFC9C9C9FFC2C2C2FF848484FF956408FF
                956100AF95610044000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                00000000000000000000000000000000000000009561004A8C713FD1B0BAC0FF
                CCD5DBFFC9C9C9FFB8B8B8FFA2A2A2FF9C9C9CFF9C9D9DFF969696FF81807EA7
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000008C724250999EA1FF
                C9D6DDFFB6B7B8FF9B9C9CFFA0A0A0FFA4A4A4FFA3A3A3FFC4C4C4FFB9B9B9FF
                8686869700000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                00000000000000000000000000000000000000000000000000000000848484A7
                B5C1C9FFA1A4A5FFA9A9A9FFB1B1B1FFB1B1B1FFB1B1B1FFDCDCDCFFE1E1E1FF
                9D9D9DFF83838306000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000008383830C7B7B7BFF
                A1A3A5FFACACACFFB9B9B9FFBCBCBCFFBCBCBCFFBCBCBCFFDBDBDBFFEEEEEEFF
                C2C2C2FF8181815E000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                000000000000000000000000000000000000000083838302787878FF555555FF
                999999FFBABABAFFC4C4C4FFC7C7C7FFC8C8C8FFC9C9C9FFDADADAFFF8F8F8FF
                D9D9D9FF82828291000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                000000000000000000000000000000000000000069696995545454FF545454FF
                949494FFC5C5C5FFCCCCCCFFD0D0D0FFD2D2D2FFD4D4D4FFE0E0E0FFFDFDFDFF
                EAEAEAFF828282A9000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000606060F3525252FF565656FF
                A6A6A6FFCECECEFFD5D5D5FFD8D8D8FFDADADAFFDBDBDBFFE5E5E5FFFFFFFFFF
                F2F2F2FF828282A9000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                000000000000000000000000000000006060602A555555FF505050FF555555FF
                545454FF989898FFDCDCDCFFDFDFDFFFE0E0E0FFE1E1E1FFECECECFFFFFFFFFF
                F4F4F4FF8383839F000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000061616170545454FF505050FF505050FF
                515151FF646464FFE0E0E0FFE3E3E3FFE4E4E4FFE5E5E5FFF2F2F2FFFFFFFFFF
                F1F1F1FF8383838B000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                000000000000000000000000000000006161618D545454FF505050FF505050FF
                505050FF565656FFDFDFDFFFE5E5E5FFE6E6E6FFE8E8E8FFFBFBFBFFFFFFFFFF
                E9E9E9FF83838366000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                000000000000000000000000000000006262626A545454FF535353FF535353FF
                505050FF545454FF969696FFE3E3E3FFD3D3D3FFBFBFBFFFACACACFFACACACFF
                CCCCCCFF85858534000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                000000000000000000000000000000006161610C5B5B5BFF6B6B6BFF6E6E6EFF
                5E5E5EFF505050FF545454FF565656FF646464FF727272FF757575FF757575FF
                767676FF8D8D8D2E000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                00000000000000000000000000000000000000006A6A6ACB737373FF767676FF
                717171FF636363FF5A5A5AFF5C5C5CFF6F6F6FFF727272FF727272FF747474FF
                6F6F6FFF6E6E6EAD000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                00000000000000000000000000000000000000005C5C5C22626262FF767676FF
                767676FF747474FF717171FF727272FF737373FF747474FF747474FF686868FF
                676767D56C6C6C06000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                00000000000000000000000000000000000000000000000068686883626262FF
                727272FF797979FF777777FF777777FF757575FF696969FF636363FB676767B5
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000061616104
                6A6A6A956B6B6BE3696969FB696969F7696969DB6A6A6A7C0000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                00000000FFFFFFFFFFFFFFFFFF0007FFFE0001FFFC00007FFC00003FFC00001F
                FC00000FFC00000FFE00000FFE00000FFF00001FFF80001FFFC0003FFFF000FF
                FFF801FFFFFC00FFFFFC00FFFFFC00FFFFF8007FFFF0007FFFF0007FFFF0007F
                FFF0007FFFE000FFFFF000FFFFF000FFFFF0007FFFF800FFFFF801FFFFFE0FFF
                FFFFFFFF}
            end
            object Image2: TImage
              Left = 16
              Top = 63
              Width = 32
              Height = 32
              AutoSize = True
              Picture.Data = {
                055449636F6E0000010001002020000001002000A81000001600000028000000
                2000000040000000010020000000000000100000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000004D4B4D024D4B4D0C4D4B4D104D4B4D144D4B4D18
                4D4B4D1A4D4B4D1A4D4B4D184D4B4D184D4B4D124D4B4D104D4B4D0A4D4B4D04
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000004D4B4D0E4D4B4D244D4B4D2A4D4B4D344D4B4D42
                4D4B4D464D4B4D464D4B4D464D4B4D404D4B4D304D4B4D284D4B4D244D4B4D10
                4D4B4D0200000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000004D4B4D124D4B4D2A4D4B4D2E4D4B4D3C4D4B4D4C
                2F89BAA5269AD8EF2F89BAA54D4B4D4A4D4B4D364D4B4D2E4D4B4D2A4D4B4D18
                4D4B4D0400000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000004D4B4D064D4B4D164D4B4D1C4D4B4D222994CDA5
                229FDBFF58DAF4FF21A9E2FF2C8FC5874D4B4D204D4B4D1C4D4B4D144D4B4D08
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                00000000000000000000000000000000000000004D4B4D024D4B4D02259DDDFD
                59DEF6FF97ECFAFF3DD2F1FF259DDDD94D4B4D024D4B4D020000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                00000000000000000000000000000000000000000000000000000000259DDDFF
                7CE6F8FF8FEAF9FF77DFF6FF259DDDE100000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                00000000000000000000000000000000000000000000000000000000259DDDFF
                4DDDF6FF78E5F8FF3FB3E5FF259DDD7600000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                00000000000000000000000000000000000000000000000000000000259DDDFF
                41DBF5FF65E2F7FF27A6E0FF259DDD6E00000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                00000000000000000000000000000000000000000000000000000000259DDDFF
                4DDDF6FF56DFF6FF1BCBF0FF259DDDD700000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                00000000000000000000000000000000000000000000000000000000259DDDFF
                47DCF5FF36D9F5FF23A2DFFF259DDD6E00000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                00000000000000000000000000000000000000000000000000000000259DDDFF
                45DBF5FF32D8F4FF1CAFE4FF259DDD7E00000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                00000000000000000000000000000000000000000000000000000000259DDDFF
                51DEF6FF4DDDF6FF29D2F2FF259DDDE700000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                00000000000000000000000000000000000000000000000000000000259DDDFF
                64E0F7FF62DFF7FF3AD5F3FF259DDDEB00000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                00000000000000000000000000000000000000000000000000000000259DDDFF
                5ADFF7FF58DCF6FF29BDEAFF259DDD8D00000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                00000000000000000000000000000000000000000000000000000000259DDDFF
                48D9F6FF46D9F5FF1CB6E8FF259DDD7E00000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                00000000000000000000000000000000000000000000000000000000259DDDFF
                53DAF5FF44D6F4FF14C7EEFF259DDDE900000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                00000000000000000000000000000000000000000000000000000000259DDDFF
                48D5F3FF3FCFF0FF13C0E8FF259DDDF500000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                000000000000000000000000259DDD24259DDD8D259DDDAD259DDDD7259DDDFF
                49CFF1FF46CDF1FF45CBEFFF259DDDFF259DDDE3259DDDC9259DDDAD259DDD44
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000259DDD912BA5E0FF3FBDEAFF46C3ECFF49CAEDFF46C6ECFF
                49C8EEFF46C4EDFF43C2ECFF3FBEEAFF3DBAE9FF3BB6E6FF38B3E4FF2BA5E0FF
                259DDD9B259DDD30000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                00000000259DDD8B3CB5E7FF64D7F4FF5ED4F3FF58CEF0FF50CBEFFF4AC7EEFF
                47C3EDFF44C1ECFF41BDEAFF40B8E8FF42B7E8FF43B7E8FF46B7E8FF4CB8E7FF
                34ADE4FF259DDD9B000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                00000000259DDDF56CD6F4FF68D5F3FF5FCFEFFF56CBEFFF51C5EDFF4AC1EBFF
                48BEE9FF44BAE9FF42B7E6FF41B3E5FF43B3E5FF44B3E4FF4AB6E5FF51B7E7FF
                56B9E8FF259DDDFD000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                00000000259DDDFF76D7F2FF6CD0EFFF63CCEFFF5BC7EEFF58C2ECFF51BFEAFF
                4EBBE9FF4CB8E7FF49B5E6FF47B3E5FF49B2E4FF4CB2E5FF53B6E6FF5AB9E7FF
                67BEE9FF259DDDFF000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                00000000259DDDFF7BD6F1FF72CFF0FF6DCBEEFF6CC8EDFF6AC6ECFF69C3EBFF
                67C1EAFF63BEE9FF5BBAE8FF58B8E7FF56B6E6FF59B6E6FF60BAE7FF6ABDE9FF
                77C4EBFF259DDDFF000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                00000000259DDDFF82D3F1FF7ED0F0FF77CCEEFF6DC6ECFF67C1EAFF63BDE9FF
                60BCE8FF6BC0E9FF74C2EAFF71C1EAFF6CBFE9FF6CBEE9FF72C1E9FF79C4EBFF
                7EC6EBFF259DDDFF000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                00000000259DDDFF8FD5F1FF7DCDEEFF63C1EAFF51B8E7FF48B3E5FF259DDDFF
                259DDDFF259DDDFF259DDDFF259DDDFF65BAE8FF66BBE8FF6CBEE9FF6CBEE8FF
                6CBEE9FF259DDDFF000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                00000000259DDDFF91D4F0FF72C6ECFF67C1EAFF5CBBE8FF53B5E6FF259DDDFF
                000000000000000000000000259DDDFF48AEE3FF4FB1E4FF58B5E6FF65BBE8FF
                74C1EAFF259DDDFF000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                00000000259DDDFF90D2F0FF7CC9ECFF70C3EAFF66BDE8FF5CB7E6FF259DDDFF
                000000000000000000000000259DDDFF59B5E6FF5FB7E7FF68BBE8FF70BFE9FF
                7CC4EBFF259DDDFF000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                00000000259DDDFB83CBEDFF87CCEEFF7BC6EBFF71C1E9FF68BDE8FF259DDDFF
                259DDDFF259DDDFF259DDDFF259DDDFF67BBE8FF6CBDE9FF74C1EAFF7EC5EBFF
                73C1EAFF259DDDFF000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                00000000259DDD9136ACE2FF7CC7ECFF85CAEDFF80C7EBFF7CC5EBFF78C3EAFF
                74C2EAFF73C0EAFF76C2EAFF79C3EBFF7CC4EBFF7EC5EBFF81C7ECFF73C0EAFF
                31A7E0FF259DDDB7000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                00000000259DDD1A259DDD93259DDDFD259DDDFF259DDDFF259DDDFF259DDDFF
                259DDDFF259DDDFF259DDDFF259DDDFF259DDDFF259DDDFF259DDDFF259DDDFF
                259DDDB7259DDD4E000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                00000000FFFFFFFFFFFFFFFFFFFFFFFFFFFE3FFFFFFC1FFFFFFC1FFFFFFC1FFF
                FFFC3FFFFFFC3FFFFFFC1FFFFFFC3FFFFFFC3FFFFFFC1FFFFFFC1FFFFFFC1FFF
                FFFC3FFFFFFC1FFFFFFC1FFFFFE003FFFF8000FFFF00007FFF00007FFF00007F
                FF00007FFF00007FFF00007FFF01C07FFF01C07FFF00007FFF00007FFF8000FF
                FFFFFFFF}
            end
            object DBEdit3: TDBEdit
              Left = 56
              Top = 32
              Width = 199
              Height = 21
              CharCase = ecUpperCase
              DataField = 'NM_LOGIN'
              DataSource = dsControle
              TabOrder = 0
            end
            object edSenha: TDBEdit
              Left = 56
              Top = 72
              Width = 199
              Height = 21
              CharCase = ecUpperCase
              DataField = 'DS_SENHA'
              DataSource = dsControle
              PasswordChar = '*'
              TabOrder = 1
              OnExit = edSenhaExit
            end
            object edconfirma: TEdit
              Left = 256
              Top = 72
              Width = 199
              Height = 21
              CharCase = ecUpperCase
              PasswordChar = '*'
              TabOrder = 2
              OnExit = edconfirmaExit
            end
          end
          object DBEdit1: TDBEdit
            Left = 16
            Top = 32
            Width = 87
            Height = 21
            TabStop = False
            Color = cl3DLight
            DataField = 'CD_USUARIO'
            DataSource = dsControle
            ReadOnly = True
            TabOrder = 0
          end
          object DBEdit2: TDBEdit
            Left = 104
            Top = 32
            Width = 457
            Height = 21
            CharCase = ecUpperCase
            DataField = 'NM_USUARIO'
            DataSource = dsControle
            TabOrder = 1
          end
        end
      end
      object tabPermissao: TTabSheet
        Caption = 'Permiss'#245'es'
        ImageIndex = 2
        OnExit = tabPermissaoExit
        OnShow = tabPermissaoShow
        object Panel5: TPanel
          Left = 0
          Top = 0
          Width = 774
          Height = 461
          Align = alClient
          BevelInner = bvLowered
          BevelOuter = bvNone
          TabOrder = 0
          object PageControl2: TPageControl
            Left = 1
            Top = 54
            Width = 772
            Height = 406
            ActivePage = TabSheet6
            Align = alClient
            TabOrder = 0
            object TabSheet6: TTabSheet
              Caption = 'Arquivo'
              object CheckBox50: TCheckBox
                Tag = 100
                Left = 15
                Top = 16
                Width = 213
                Height = 17
                Hint = 'GERAL'
                Caption = '0 - Acesso ao SIS Compware'
                Font.Charset = ANSI_CHARSET
                Font.Color = clBlack
                Font.Height = -13
                Font.Name = 'Arial'
                Font.Style = [fsBold]
                ParentFont = False
                TabOrder = 0
              end
              object GroupBox2: TGroupBox
                Left = 16
                Top = 40
                Width = 265
                Height = 289
                Caption = 'Cadastros'
                TabOrder = 1
                object CheckBox1: TCheckBox
                  Tag = 1
                  Left = 12
                  Top = 20
                  Width = 182
                  Height = 17
                  Hint = 'GERAL'
                  Caption = '1 - Utente'
                  Font.Charset = ANSI_CHARSET
                  Font.Color = clBlack
                  Font.Height = -13
                  Font.Name = 'Arial'
                  Font.Style = []
                  ParentFont = False
                  TabOrder = 0
                end
                object CheckBox12: TCheckBox
                  Tag = 2
                  Left = 12
                  Top = 40
                  Width = 182
                  Height = 17
                  Hint = 'GERAL'
                  Caption = '2 - Agenda'
                  Font.Charset = ANSI_CHARSET
                  Font.Color = clBlack
                  Font.Height = -13
                  Font.Name = 'Arial'
                  Font.Style = []
                  ParentFont = False
                  TabOrder = 1
                end
                object CheckBox32: TCheckBox
                  Tag = 3
                  Left = 12
                  Top = 77
                  Width = 182
                  Height = 17
                  Hint = 'GERAL'
                  Caption = '3 - Empresa'
                  Font.Charset = ANSI_CHARSET
                  Font.Color = clBlack
                  Font.Height = -13
                  Font.Name = 'Arial'
                  Font.Style = []
                  ParentFont = False
                  TabOrder = 2
                end
                object CheckBox33: TCheckBox
                  Tag = 4
                  Left = 12
                  Top = 96
                  Width = 182
                  Height = 17
                  Hint = 'GERAL'
                  Caption = '4 - Usu'#225'rios'
                  Font.Charset = ANSI_CHARSET
                  Font.Color = clBlack
                  Font.Height = -13
                  Font.Name = 'Arial'
                  Font.Style = []
                  ParentFont = False
                  TabOrder = 3
                end
                object CheckBox5: TCheckBox
                  Tag = 35
                  Left = 12
                  Top = 58
                  Width = 182
                  Height = 17
                  Hint = 'GERAL'
                  Caption = '2 - Atendimentos'
                  Font.Charset = ANSI_CHARSET
                  Font.Color = clBlack
                  Font.Height = -13
                  Font.Name = 'Arial'
                  Font.Style = []
                  ParentFont = False
                  TabOrder = 4
                end
              end
              object GroupBox3: TGroupBox
                Left = 288
                Top = 40
                Width = 297
                Height = 289
                Caption = 'Sub-Cadastros'
                TabOrder = 2
                object CheckBox37: TCheckBox
                  Tag = 5
                  Left = 12
                  Top = 20
                  Width = 182
                  Height = 17
                  Hint = 'GERAL'
                  Caption = '5 - Municipio'
                  Font.Charset = ANSI_CHARSET
                  Font.Color = clBlack
                  Font.Height = -13
                  Font.Name = 'Arial'
                  Font.Style = []
                  ParentFont = False
                  TabOrder = 0
                end
                object CheckBox38: TCheckBox
                  Tag = 6
                  Left = 12
                  Top = 40
                  Width = 182
                  Height = 17
                  Hint = 'GERAL'
                  Caption = '6 - Provincia'
                  Font.Charset = ANSI_CHARSET
                  Font.Color = clBlack
                  Font.Height = -13
                  Font.Name = 'Arial'
                  Font.Style = []
                  ParentFont = False
                  TabOrder = 1
                end
                object CheckBox39: TCheckBox
                  Tag = 7
                  Left = 12
                  Top = 60
                  Width = 85
                  Height = 17
                  Hint = 'GERAL'
                  Caption = '7 - Pais'
                  Font.Charset = ANSI_CHARSET
                  Font.Color = clBlack
                  Font.Height = -13
                  Font.Name = 'Arial'
                  Font.Style = []
                  ParentFont = False
                  TabOrder = 2
                end
                object CheckBox40: TCheckBox
                  Tag = 8
                  Left = 12
                  Top = 80
                  Width = 182
                  Height = 17
                  Hint = 'GERAL'
                  Caption = '8 - Unidade'
                  Font.Charset = ANSI_CHARSET
                  Font.Color = clBlack
                  Font.Height = -13
                  Font.Name = 'Arial'
                  Font.Style = []
                  ParentFont = False
                  TabOrder = 3
                end
                object CheckBox41: TCheckBox
                  Tag = 9
                  Left = 12
                  Top = 100
                  Width = 182
                  Height = 17
                  Hint = 'GERAL'
                  Caption = '9 - Ocupa'#231#227'o'
                  Font.Charset = ANSI_CHARSET
                  Font.Color = clBlack
                  Font.Height = -13
                  Font.Name = 'Arial'
                  Font.Style = []
                  ParentFont = False
                  TabOrder = 4
                end
                object CheckBox42: TCheckBox
                  Tag = 10
                  Left = 12
                  Top = 120
                  Width = 182
                  Height = 17
                  Hint = 'GERAL'
                  Caption = '10 - Tipo de Documento'
                  Font.Charset = ANSI_CHARSET
                  Font.Color = clBlack
                  Font.Height = -13
                  Font.Name = 'Arial'
                  Font.Style = []
                  ParentFont = False
                  TabOrder = 5
                end
                object CheckBox11: TCheckBox
                  Tag = 11
                  Left = 12
                  Top = 138
                  Width = 182
                  Height = 17
                  Hint = 'GERAL'
                  Caption = '11 - M'#233'dico'
                  Font.Charset = ANSI_CHARSET
                  Font.Color = clBlack
                  Font.Height = -13
                  Font.Name = 'Arial'
                  Font.Style = []
                  ParentFont = False
                  TabOrder = 6
                end
                object CheckBox14: TCheckBox
                  Tag = 12
                  Left = 12
                  Top = 158
                  Width = 182
                  Height = 17
                  Hint = 'GERAL'
                  Caption = '12 - Investigador'
                  Font.Charset = ANSI_CHARSET
                  Font.Color = clBlack
                  Font.Height = -13
                  Font.Name = 'Arial'
                  Font.Style = []
                  ParentFont = False
                  TabOrder = 7
                end
                object CheckBox15: TCheckBox
                  Tag = 13
                  Left = 12
                  Top = 178
                  Width = 182
                  Height = 17
                  Hint = 'GERAL'
                  Caption = '13 - Esquema'
                  Font.Charset = ANSI_CHARSET
                  Font.Color = clBlack
                  Font.Height = -13
                  Font.Name = 'Arial'
                  Font.Style = []
                  ParentFont = False
                  TabOrder = 8
                end
              end
            end
            object TabSheet7: TTabSheet
              Caption = 'Fichas'
              ImageIndex = 1
              object GroupBox9: TGroupBox
                Left = 16
                Top = 8
                Width = 297
                Height = 289
                TabOrder = 0
                object CheckBox2: TCheckBox
                  Tag = 14
                  Left = 12
                  Top = 17
                  Width = 182
                  Height = 17
                  Hint = 'GERAL'
                  Caption = '14 - Caracteriza'#231#227'o'
                  Font.Charset = ANSI_CHARSET
                  Font.Color = clBlack
                  Font.Height = -13
                  Font.Name = 'Arial'
                  Font.Style = []
                  ParentFont = False
                  TabOrder = 0
                end
                object CheckBox3: TCheckBox
                  Tag = 15
                  Left = 12
                  Top = 37
                  Width = 182
                  Height = 17
                  Hint = 'GERAL'
                  Caption = '15 - Notifica'#231#227'o'
                  Font.Charset = ANSI_CHARSET
                  Font.Color = clBlack
                  Font.Height = -13
                  Font.Name = 'Arial'
                  Font.Style = []
                  ParentFont = False
                  TabOrder = 1
                end
                object CheckBox16: TCheckBox
                  Tag = 16
                  Left = 12
                  Top = 57
                  Width = 157
                  Height = 17
                  Hint = 'GERAL'
                  Caption = '16 - Relat'#243'rio - ATV'
                  Font.Charset = ANSI_CHARSET
                  Font.Color = clBlack
                  Font.Height = -13
                  Font.Name = 'Arial'
                  Font.Style = []
                  ParentFont = False
                  TabOrder = 2
                end
                object CheckBox17: TCheckBox
                  Tag = 17
                  Left = 12
                  Top = 77
                  Width = 182
                  Height = 17
                  Hint = 'GERAL'
                  Caption = '17 - Relat'#243'rio - PTV'
                  Font.Charset = ANSI_CHARSET
                  Font.Color = clBlack
                  Font.Height = -13
                  Font.Name = 'Arial'
                  Font.Style = []
                  ParentFont = False
                  TabOrder = 3
                end
                object CheckBox18: TCheckBox
                  Tag = 18
                  Left = 12
                  Top = 113
                  Width = 182
                  Height = 17
                  Hint = 'GERAL'
                  Caption = '18 - Relat'#243'rio - TARV '
                  Font.Charset = ANSI_CHARSET
                  Font.Color = clBlack
                  Font.Height = -13
                  Font.Name = 'Arial'
                  Font.Style = []
                  ParentFont = False
                  TabOrder = 4
                end
                object CheckBox19: TCheckBox
                  Tag = 19
                  Left = 12
                  Top = 130
                  Width = 229
                  Height = 17
                  Hint = 'GERAL'
                  Caption = '19 - Relat'#243'rio - TARV por Esquema'
                  Font.Charset = ANSI_CHARSET
                  Font.Color = clBlack
                  Font.Height = -13
                  Font.Name = 'Arial'
                  Font.Style = []
                  ParentFont = False
                  TabOrder = 5
                end
                object CheckBox20: TCheckBox
                  Tag = 20
                  Left = 12
                  Top = 167
                  Width = 221
                  Height = 17
                  Hint = 'GERAL'
                  Caption = '20 - Relat'#243'rio - CO-INFEC'#199#194'O'
                  Font.Charset = ANSI_CHARSET
                  Font.Color = clBlack
                  Font.Height = -13
                  Font.Name = 'Arial'
                  Font.Style = []
                  ParentFont = False
                  TabOrder = 6
                end
                object CheckBox21: TCheckBox
                  Tag = 37
                  Left = 12
                  Top = 95
                  Width = 221
                  Height = 17
                  Hint = 'GERAL'
                  Caption = '37 - Relat'#243'rio - Acompanhamento'
                  Font.Charset = ANSI_CHARSET
                  Font.Color = clBlack
                  Font.Height = -13
                  Font.Name = 'Arial'
                  Font.Style = []
                  ParentFont = False
                  TabOrder = 7
                end
                object CheckBox6: TCheckBox
                  Tag = 36
                  Left = 12
                  Top = 186
                  Width = 269
                  Height = 17
                  Hint = 'GERAL'
                  Caption = '36 - Relat'#243'rio - N'#186' TESTES POSITIVOS'
                  Font.Charset = ANSI_CHARSET
                  Font.Color = clBlack
                  Font.Height = -13
                  Font.Name = 'Arial'
                  Font.Style = []
                  ParentFont = False
                  TabOrder = 8
                end
                object CheckBox13: TCheckBox
                  Tag = 21
                  Left = 12
                  Top = 206
                  Width = 221
                  Height = 17
                  Hint = 'GERAL'
                  Caption = '21 - Relat'#243'rio - PROGRAMA'
                  Font.Charset = ANSI_CHARSET
                  Font.Color = clBlack
                  Font.Height = -13
                  Font.Name = 'Arial'
                  Font.Style = []
                  ParentFont = False
                  TabOrder = 9
                end
                object CheckBox7: TCheckBox
                  Tag = 38
                  Left = 12
                  Top = 148
                  Width = 269
                  Height = 17
                  Hint = 'GERAL'
                  Caption = '38 - Relat'#243'rio - TARV (Contagem de CD4)'
                  Font.Charset = ANSI_CHARSET
                  Font.Color = clBlack
                  Font.Height = -13
                  Font.Name = 'Arial'
                  Font.Style = []
                  ParentFont = False
                  TabOrder = 10
                end
              end
            end
            object TabSheet5: TTabSheet
              Caption = 'Consultas'
              ImageIndex = 5
              object GroupBox10: TGroupBox
                Left = 16
                Top = 8
                Width = 297
                Height = 289
                TabOrder = 0
                object CheckBox10: TCheckBox
                  Tag = 22
                  Left = 12
                  Top = 17
                  Width = 182
                  Height = 17
                  Hint = 'GERAL'
                  Caption = '22 - Utente - Listagem'
                  Font.Charset = ANSI_CHARSET
                  Font.Color = clBlack
                  Font.Height = -13
                  Font.Name = 'Arial'
                  Font.Style = []
                  ParentFont = False
                  TabOrder = 0
                end
                object CheckBox22: TCheckBox
                  Tag = 23
                  Left = 12
                  Top = 37
                  Width = 182
                  Height = 17
                  Hint = 'GERAL'
                  Caption = '23 - Duplicidade'
                  Font.Charset = ANSI_CHARSET
                  Font.Color = clBlack
                  Font.Height = -13
                  Font.Name = 'Arial'
                  Font.Style = []
                  ParentFont = False
                  TabOrder = 1
                end
                object CheckBox23: TCheckBox
                  Tag = 24
                  Left = 12
                  Top = 57
                  Width = 157
                  Height = 17
                  Hint = 'GERAL'
                  Caption = '24 - Abandono'
                  Font.Charset = ANSI_CHARSET
                  Font.Color = clBlack
                  Font.Height = -13
                  Font.Name = 'Arial'
                  Font.Style = []
                  ParentFont = False
                  TabOrder = 2
                end
              end
            end
            object TabSheet8: TTabSheet
              Caption = 'Relat'#243'rios'
              ImageIndex = 2
              object GroupBox11: TGroupBox
                Left = 16
                Top = 8
                Width = 297
                Height = 289
                TabOrder = 0
                object CheckBox4: TCheckBox
                  Tag = 25
                  Left = 12
                  Top = 17
                  Width = 197
                  Height = 17
                  Hint = 'GERAL'
                  Caption = '25 - Geral de Notifica'#231#245'es'
                  Font.Charset = ANSI_CHARSET
                  Font.Color = clBlack
                  Font.Height = -13
                  Font.Name = 'Arial'
                  Font.Style = []
                  ParentFont = False
                  TabOrder = 0
                end
                object CheckBox24: TCheckBox
                  Tag = 26
                  Left = 12
                  Top = 37
                  Width = 205
                  Height = 17
                  Hint = 'GERAL'
                  Caption = '26 - Geral de Caracteriza'#231#227'o'
                  Font.Charset = ANSI_CHARSET
                  Font.Color = clBlack
                  Font.Height = -13
                  Font.Name = 'Arial'
                  Font.Style = []
                  ParentFont = False
                  TabOrder = 1
                end
                object CheckBox25: TCheckBox
                  Tag = 27
                  Left = 12
                  Top = 57
                  Width = 205
                  Height = 17
                  Hint = 'GERAL'
                  Caption = '27 - Geral do Programa'
                  Font.Charset = ANSI_CHARSET
                  Font.Color = clBlack
                  Font.Height = -13
                  Font.Name = 'Arial'
                  Font.Style = []
                  ParentFont = False
                  TabOrder = 2
                end
              end
            end
            object TabSheet9: TTabSheet
              Caption = 'BI'
              ImageIndex = 3
              object GroupBox12: TGroupBox
                Left = 16
                Top = 8
                Width = 297
                Height = 289
                TabOrder = 0
                object CheckBox26: TCheckBox
                  Tag = 28
                  Left = 12
                  Top = 17
                  Width = 197
                  Height = 17
                  Hint = 'GERAL'
                  Caption = '28 - Cadastro BI'
                  Font.Charset = ANSI_CHARSET
                  Font.Color = clBlack
                  Font.Height = -13
                  Font.Name = 'Arial'
                  Font.Style = []
                  ParentFont = False
                  TabOrder = 0
                end
                object CheckBox27: TCheckBox
                  Tag = 29
                  Left = 12
                  Top = 37
                  Width = 205
                  Height = 17
                  Hint = 'GERAL'
                  Caption = '29 - Painel de Controle'
                  Font.Charset = ANSI_CHARSET
                  Font.Color = clBlack
                  Font.Height = -13
                  Font.Name = 'Arial'
                  Font.Style = []
                  ParentFont = False
                  TabOrder = 1
                end
                object CheckBox28: TCheckBox
                  Tag = 30
                  Left = 12
                  Top = 57
                  Width = 205
                  Height = 17
                  Hint = 'GERAL'
                  Caption = '30 - Tabular'
                  Font.Charset = ANSI_CHARSET
                  Font.Color = clBlack
                  Font.Height = -13
                  Font.Name = 'Arial'
                  Font.Style = []
                  ParentFont = False
                  TabOrder = 2
                end
              end
            end
            object TabSheet4: TTabSheet
              Caption = 'Ferramentas'
              ImageIndex = 6
              object GroupBox4: TGroupBox
                Left = 8
                Top = 8
                Width = 297
                Height = 289
                TabOrder = 0
                object CheckBox31: TCheckBox
                  Tag = 31
                  Left = 12
                  Top = 17
                  Width = 269
                  Height = 17
                  Hint = 'GERAL'
                  Caption = '31 - Acesso - Administrador do Sistema'
                  Font.Charset = ANSI_CHARSET
                  Font.Color = clBlack
                  Font.Height = -13
                  Font.Name = 'Arial'
                  Font.Style = []
                  ParentFont = False
                  TabOrder = 0
                end
                object CheckBox34: TCheckBox
                  Tag = 41
                  Left = 12
                  Top = 37
                  Width = 205
                  Height = 17
                  Hint = 'GERAL'
                  Caption = '41 - Protocolo'
                  Font.Charset = ANSI_CHARSET
                  Font.Color = clBlack
                  Font.Height = -13
                  Font.Name = 'Arial'
                  Font.Style = []
                  ParentFont = False
                  TabOrder = 1
                end
              end
            end
            object TabSheet1: TTabSheet
              Caption = 'Administrativo'
              ImageIndex = 6
              object GroupBox5: TGroupBox
                Left = 16
                Top = 8
                Width = 297
                Height = 289
                TabOrder = 0
                object CheckBox8: TCheckBox
                  Tag = 33
                  Left = 12
                  Top = 33
                  Width = 197
                  Height = 17
                  Hint = 'GERAL'
                  Caption = '33 - Inser'#231#227'o de dados'
                  Font.Charset = ANSI_CHARSET
                  Font.Color = clBlack
                  Font.Height = -13
                  Font.Name = 'Arial'
                  Font.Style = []
                  ParentFont = False
                  TabOrder = 0
                end
                object CheckBox29: TCheckBox
                  Tag = 34
                  Left = 12
                  Top = 54
                  Width = 205
                  Height = 17
                  Hint = 'GERAL'
                  Caption = '34 - Exclus'#227'o de dados'
                  Font.Charset = ANSI_CHARSET
                  Font.Color = clBlack
                  Font.Height = -13
                  Font.Name = 'Arial'
                  Font.Style = []
                  ParentFont = False
                  TabOrder = 1
                end
                object CheckBox30: TCheckBox
                  Tag = 32
                  Left = 12
                  Top = 13
                  Width = 205
                  Height = 17
                  Hint = 'GERAL'
                  Caption = '32 - Consulta de dados'
                  Font.Charset = ANSI_CHARSET
                  Font.Color = clBlack
                  Font.Height = -13
                  Font.Name = 'Arial'
                  Font.Style = []
                  ParentFont = False
                  TabOrder = 2
                end
              end
            end
            object TabSheet2: TTabSheet
              Caption = 'Mapas'
              ImageIndex = 7
              object GroupBox6: TGroupBox
                Left = 16
                Top = 8
                Width = 185
                Height = 81
                Caption = 'Mapa M'#233'dico'
                TabOrder = 0
                object CheckBox9: TCheckBox
                  Tag = 42
                  Left = 12
                  Top = 17
                  Width = 165
                  Height = 17
                  Hint = 'GERAL'
                  Caption = '42 - Consulta de dados'
                  Font.Charset = ANSI_CHARSET
                  Font.Color = clBlack
                  Font.Height = -13
                  Font.Name = 'Arial'
                  Font.Style = []
                  ParentFont = False
                  TabOrder = 0
                end
                object CheckBox45: TCheckBox
                  Tag = 48
                  Left = 20
                  Top = 36
                  Width = 161
                  Height = 17
                  Hint = 'GERAL'
                  Caption = '48 - Inser'#231#227'o de dados'
                  Font.Charset = ANSI_CHARSET
                  Font.Color = clBlack
                  Font.Height = -13
                  Font.Name = 'Arial'
                  Font.Style = []
                  ParentFont = False
                  TabOrder = 1
                  OnClick = CheckBox45Exit
                  OnExit = CheckBox45Exit
                end
                object CheckBox46: TCheckBox
                  Tag = 49
                  Left = 20
                  Top = 55
                  Width = 161
                  Height = 17
                  Hint = 'GERAL'
                  Caption = '49 - Exclus'#227'o de dados'
                  Font.Charset = ANSI_CHARSET
                  Font.Color = clBlack
                  Font.Height = -13
                  Font.Name = 'Arial'
                  Font.Style = []
                  ParentFont = False
                  TabOrder = 2
                  OnExit = CheckBox45Exit
                end
              end
              object GroupBox7: TGroupBox
                Left = 216
                Top = 8
                Width = 185
                Height = 81
                Caption = 'Mapa Testagem'
                TabOrder = 1
                object CheckBox48: TCheckBox
                  Tag = 43
                  Left = 12
                  Top = 17
                  Width = 165
                  Height = 17
                  Hint = 'GERAL'
                  Caption = '43 - Consulta de dados'
                  Font.Charset = ANSI_CHARSET
                  Font.Color = clBlack
                  Font.Height = -13
                  Font.Name = 'Arial'
                  Font.Style = []
                  ParentFont = False
                  TabOrder = 0
                end
                object CheckBox49: TCheckBox
                  Tag = 50
                  Left = 20
                  Top = 36
                  Width = 160
                  Height = 17
                  Hint = 'GERAL'
                  Caption = '50 - Inser'#231#227'o de dados'
                  Font.Charset = ANSI_CHARSET
                  Font.Color = clBlack
                  Font.Height = -13
                  Font.Name = 'Arial'
                  Font.Style = []
                  ParentFont = False
                  TabOrder = 1
                  OnExit = CheckBox45Exit
                end
                object CheckBox51: TCheckBox
                  Tag = 51
                  Left = 20
                  Top = 55
                  Width = 160
                  Height = 17
                  Hint = 'GERAL'
                  Caption = '51 - Exclus'#227'o de dados'
                  Font.Charset = ANSI_CHARSET
                  Font.Color = clBlack
                  Font.Height = -13
                  Font.Name = 'Arial'
                  Font.Style = []
                  ParentFont = False
                  TabOrder = 2
                  OnExit = CheckBox45Exit
                end
              end
              object GroupBox8: TGroupBox
                Left = 416
                Top = 8
                Width = 185
                Height = 81
                Caption = 'Mapa Laborat'#243'rio'
                TabOrder = 2
                object CheckBox52: TCheckBox
                  Tag = 44
                  Left = 12
                  Top = 17
                  Width = 165
                  Height = 17
                  Hint = 'GERAL'
                  Caption = '44 - Consulta de dados'
                  Font.Charset = ANSI_CHARSET
                  Font.Color = clBlack
                  Font.Height = -13
                  Font.Name = 'Arial'
                  Font.Style = []
                  ParentFont = False
                  TabOrder = 0
                end
                object CheckBox53: TCheckBox
                  Tag = 52
                  Left = 20
                  Top = 36
                  Width = 159
                  Height = 17
                  Hint = 'GERAL'
                  Caption = '52 - Inser'#231#227'o de dados'
                  Font.Charset = ANSI_CHARSET
                  Font.Color = clBlack
                  Font.Height = -13
                  Font.Name = 'Arial'
                  Font.Style = []
                  ParentFont = False
                  TabOrder = 1
                  OnExit = CheckBox45Exit
                end
                object CheckBox54: TCheckBox
                  Tag = 53
                  Left = 20
                  Top = 55
                  Width = 159
                  Height = 17
                  Hint = 'GERAL'
                  Caption = '53 - Exclus'#227'o de dados'
                  Font.Charset = ANSI_CHARSET
                  Font.Color = clBlack
                  Font.Height = -13
                  Font.Name = 'Arial'
                  Font.Style = []
                  ParentFont = False
                  TabOrder = 2
                  OnExit = CheckBox45Exit
                end
              end
              object GroupBox13: TGroupBox
                Left = 16
                Top = 104
                Width = 185
                Height = 81
                Caption = 'Mapa Teste R'#225'pido'
                TabOrder = 3
                object CheckBox55: TCheckBox
                  Tag = 45
                  Left = 12
                  Top = 17
                  Width = 165
                  Height = 17
                  Hint = 'GERAL'
                  Caption = '45 - Consulta de dados'
                  Font.Charset = ANSI_CHARSET
                  Font.Color = clBlack
                  Font.Height = -13
                  Font.Name = 'Arial'
                  Font.Style = []
                  ParentFont = False
                  TabOrder = 0
                end
                object CheckBox56: TCheckBox
                  Tag = 54
                  Left = 20
                  Top = 36
                  Width = 160
                  Height = 17
                  Hint = 'GERAL'
                  Caption = '54 - Inser'#231#227'o de dados'
                  Font.Charset = ANSI_CHARSET
                  Font.Color = clBlack
                  Font.Height = -13
                  Font.Name = 'Arial'
                  Font.Style = []
                  ParentFont = False
                  TabOrder = 1
                  OnExit = CheckBox45Exit
                end
                object CheckBox57: TCheckBox
                  Tag = 55
                  Left = 20
                  Top = 55
                  Width = 160
                  Height = 17
                  Hint = 'GERAL'
                  Caption = '55 - Exclus'#227'o de dados'
                  Font.Charset = ANSI_CHARSET
                  Font.Color = clBlack
                  Font.Height = -13
                  Font.Name = 'Arial'
                  Font.Style = []
                  ParentFont = False
                  TabOrder = 2
                  OnExit = CheckBox45Exit
                end
              end
              object GroupBox14: TGroupBox
                Left = 216
                Top = 104
                Width = 185
                Height = 81
                Caption = 'Mapa Farm'#225'cia'
                TabOrder = 4
                object CheckBox35: TCheckBox
                  Tag = 46
                  Left = 12
                  Top = 17
                  Width = 165
                  Height = 17
                  Hint = 'GERAL'
                  Caption = '46 - Consulta de dados'
                  Font.Charset = ANSI_CHARSET
                  Font.Color = clBlack
                  Font.Height = -13
                  Font.Name = 'Arial'
                  Font.Style = []
                  ParentFont = False
                  TabOrder = 0
                end
                object CheckBox36: TCheckBox
                  Tag = 56
                  Left = 20
                  Top = 36
                  Width = 160
                  Height = 17
                  Hint = 'GERAL'
                  Caption = '56 - Inser'#231#227'o de dados'
                  Font.Charset = ANSI_CHARSET
                  Font.Color = clBlack
                  Font.Height = -13
                  Font.Name = 'Arial'
                  Font.Style = []
                  ParentFont = False
                  TabOrder = 1
                  OnExit = CheckBox45Exit
                end
                object CheckBox58: TCheckBox
                  Tag = 57
                  Left = 20
                  Top = 55
                  Width = 160
                  Height = 17
                  Hint = 'GERAL'
                  Caption = '57 - Exclus'#227'o de dados'
                  Font.Charset = ANSI_CHARSET
                  Font.Color = clBlack
                  Font.Height = -13
                  Font.Name = 'Arial'
                  Font.Style = []
                  ParentFont = False
                  TabOrder = 2
                  OnExit = CheckBox45Exit
                end
              end
              object GroupBox15: TGroupBox
                Left = 416
                Top = 104
                Width = 185
                Height = 81
                Caption = 'Mapa Crian'#231'a Exposta'
                TabOrder = 5
                object CheckBox59: TCheckBox
                  Tag = 47
                  Left = 12
                  Top = 17
                  Width = 165
                  Height = 17
                  Hint = 'GERAL'
                  Caption = '47 - Consulta de dados'
                  Font.Charset = ANSI_CHARSET
                  Font.Color = clBlack
                  Font.Height = -13
                  Font.Name = 'Arial'
                  Font.Style = []
                  ParentFont = False
                  TabOrder = 0
                end
                object CheckBox43: TCheckBox
                  Tag = 58
                  Left = 20
                  Top = 36
                  Width = 160
                  Height = 17
                  Hint = 'GERAL'
                  Caption = '58 - Inser'#231#227'o de dados'
                  Font.Charset = ANSI_CHARSET
                  Font.Color = clBlack
                  Font.Height = -13
                  Font.Name = 'Arial'
                  Font.Style = []
                  ParentFont = False
                  TabOrder = 1
                  OnExit = CheckBox45Exit
                end
                object CheckBox44: TCheckBox
                  Tag = 59
                  Left = 20
                  Top = 55
                  Width = 160
                  Height = 17
                  Hint = 'GERAL'
                  Caption = '59 - Exclus'#227'o de dados'
                  Font.Charset = ANSI_CHARSET
                  Font.Color = clBlack
                  Font.Height = -13
                  Font.Name = 'Arial'
                  Font.Style = []
                  ParentFont = False
                  TabOrder = 2
                  OnExit = CheckBox45Exit
                end
              end
            end
          end
          object Panel6: TPanel
            Left = 1
            Top = 1
            Width = 772
            Height = 53
            Align = alTop
            TabOrder = 1
            DesignSize = (
              772
              53)
            object btMarcarTodos: TBitBtn
              Left = 5
              Top = 3
              Width = 46
              Height = 46
              Hint = 'Marcar Todos'
              Anchors = [akTop, akRight]
              ParentShowHint = False
              ShowHint = True
              TabOrder = 0
              OnClick = btMarcarTodosClick
              Glyph.Data = {
                B6250000424DB625000000000000360000002800000050000000280000000100
                18000000000080250000C40E0000C40E00000000000000000000FFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFF8F8F7EAEDE9D6DDD6CDD6CEC7D0C9C4CDC5C9D0C9D2D7D3E0
                E2E0F3F3F3FDFBFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7
                F7F7EBEBEBDADADAD2D2D2CCCCCCC9C9C9CDCDCDD5D5D5E1E1E1F3F3F3FCFCFC
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFF6F8F6DDE4DDB6C5B795AC9878997C628D67
                57865B5280565180555581585F8361738B748C9C8EA6B0A7C8CCC8E4E5E4F9F9
                F9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFF7F7F7E1E1E1BFBFBFA3A3A38C8C8C7C7C7C7373736E6E6E6D6D
                6D6F6F6F747474818181959595ACACACCACACAE4E4E4F9F9F9FFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6FAF7D4DDD6A0B4
                A36B946F3D7C4427742F1B6F2417702016712017721F16711F177120196E221E
                6C26296C313B6E415A795D839285B5BBB5E2E4E2FDFEFDFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8F8F8D9D9D9ACACAC84848464646456
                56564E4E4E4D4D4D4E4E4E4E4E4E4E4E4E4E4E4E4D4D4D4E4E4E5252525A5A5A
                6D6D6D8C8C8CB8B8B8E3E3E3FDFDFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFE1E9E3A7BFAA67966D397C401D702516782015821F178A211A9125
                1893241894241893251A9227198D26178622147A1F146F1F1E6A26306D38557A
                59879789C0C4C0EFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE6E6E6
                B5B5B58484846262625050505252525757575D5D5D6363636363636464646464
                646464646060605B5B5B5353534C4C4C4D4D4D5656566B6B6B909090C2C2C2EF
                EFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD1E0D37FA8843D82451B74260F76
                1C1C8A282DA4382BAB382AB03627B23424B33223B43126B33429B2382DB13B31
                AE3D32A93D2D9E3816812110711A1B6B25346C3B627D65A5AEA6E6E7E6FFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFDADADA9898986767675252524F4F4F6060607676767A
                7A7A7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7D7D7D7E7E7E7D7D7D7B7B7B727272
                5858584B4B4B4C4C4C565656727272AAAAAAE6E6E6FFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFFFFCF
                E2D06E9F722B7B3410761C1F8C2A34A84039B54636BC422CB93926B93421B82F
                1FB72D1FB72D22B83125B7362BB93A34BD413DC04943C0503FB44C319E3D177D
                2214701D296C305275559BA49CE4E5E5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDADADA8B8B8B5C5C5C
                4F4F4F6262627B7B7B8585858888888282828080807D7D7D7C7C7C7C7C7C7E7E
                7E7F7F7F8282828888888D8D8D9090908787877474745656564C4C4C52525267
                6767A0A0A0E4E4E4FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFBDD6C1508D561D75241C83273BA94749BD5543C1
                4F3BC04931BA3D2BB63825A93122A62D20B52C1FB82B20B72E23B73329B8372F
                BC3D39C14641C24E49C2564FC05B4FB7592E933813741D1F6C283F6D45859387
                E4E5E5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFCCCCCC7575755252525B5B5B7F7F7F9090909090908D8D8D85858580
                80807676767272727B7B7B7C7C7C7C7C7C7E7E7E8181818585858C8C8C909090
                9393939494948F8F8F6C6C6C4E4E4E4E4E4E5B5B5B8D8D8DE4E4E4FFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD3E7D6508D5714
                741F21872C4CB55654C4604AC25843C24F3BC14831B93F2EA9392C8533308437
                2AA73422B62D22B92E24B83229B8372FBB3D39C14542C24D4BC25452C35C5BC4
                6660C26A40A14A1A7B251B6F233F6D449AA49CE6E6E6FFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFDFDF7575754F4F4F6060608C8C8C
                9999999494949191918D8D8D8585857979796262626363637676767C7C7C7E7E
                7E7F7F7F8181818585858C8C8C9090909393939797979B9B9B9C9C9C7B7B7B56
                56564E4E4E5B5B5BA0A0A0E6E6E6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFD4E8D76AA16F1D7623278A2F53B65B5DC46654C35F4BC25745C2
                4F3DBF4934AA3F37873D7498778CAE8E43994A26AF3222B82F26B7332BB83932
                BE3F39C14641C24C4BC25352C25D59C36564C56D69C47146A44E197A231C6C25
                527757A7AFA8F1F2F0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE0E0
                E08B8B8B5353536363638F8F8F9C9C9C9898989494949191918C8C8C7C7C7C67
                67678A8A8AA0A0A07777777A7A7A7D7D7D7F7F7F8181818888888C8C8C909090
                9393939797979A9A9A9F9F9FA0A0A07F7F7F5454544D4D4D696969ABABABF1F1
                F1FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF3FCF386B48B25782E25832D5B
                B86367C56F5EC36755C25F4CC25847C15242B34C37803C709072B5BEB6C0C9C2
                75A379329D3B29B73528B9372CB93C34BE423BC14843C24E4BC15553C35D59C3
                6563C46D6CC5746DC47647A35015731F2A6C31658168C6CAC6FFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFF8F8F8A2A2A25858585E5E5E939393A0A0A09B9B9B
                979797949494919191878787636363838383BABABAC5C5C59191917373737F7F
                7F8181818383838989898D8D8D9090909393939797979A9A9A9E9E9EA2A2A2A2
                A2A27F7F7F4F4F4F525252767676C8C8C8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFBFDCC1468D4C1A772354AF5D6EC77766C46F5FC36858C36251C05B48B1
                523D8943749275BDC2BCE4E5E4EEEFEEB9CBBA58975D2FA93A2FB93E31BD4037
                C0453EC24A44C2504BC25753C25E5AC36564C46D6CC47373C77B74C87C3B9643
                156D1E38703E8D9E8FE6E8E6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD0D0D07171
                715353538C8C8CA4A4A49F9F9F9C9C9C9999999595958888886B6B6B858585BF
                BFBFE4E4E4EEEEEEC3C3C37E7E7E7979798484848787878B8B8B8F8F8F919191
                9494949797979A9A9A9F9F9FA1A1A1A6A6A6A7A7A77272724B4B4B5A5A5A9797
                97E7E7E7FFFFFFFFFFFFFFFFFFFFFFFFEEFBEF7BAF7F2077283F994774C77C72
                C77A69C47161C46B5CC1664AA753397A3F779679C0C5BFECEBECFFFFFFFFFFFF
                EBF0ECA7BEAA40904736AF4337BF453CC14941C34E46C3534DC25955C35F5CC3
                6565C46D6BC47370C47979C9816CC0741E7B271B6C2458805EBBC2BCFDFDFDFF
                FFFFFFFFFFFFFFFFF5F5F59A9A9A555555767676A7A7A7A6A6A6A0A0A09E9E9E
                9A9A9A838383606060898989C2C2C2EBEBEBFFFFFFFFFFFFEEEEEEB5B5B57171
                718080808B8B8B8D8D8D9191919393939595959898989B9B9B9F9F9FA1A1A1A3
                A3A3AAAAAA9F9F9F5757574D4D4D717171BFBFBFFDFDFDFFFFFFFFFFFFFFFFFF
                C4E2C54289482E87366DC1757BCC8373C97B6BC47366C26F51A25A3F74458DA4
                90BDC2BDF1F1F1FFFFFFFFFFFFFFFFFFFFFFFFE0E5E28EAE9042964943BB4E42
                C24F46C2534AC2574FC15B58C3615DC36665C46D6BC5746FC57978C9817ACB82
                48A25113711E34713C89998DEBEBECFFFFFFFFFFFFFFFFFFD5D5D56D6D6D6464
                64A0A0A0ACACACA7A7A7A1A1A19E9E9E8383835F5F5F9B9B9BBFBFBFF1F1F1FF
                FFFFFFFFFFFFFFFFFFFFFFE3E3E3A1A1A17575758C8C8C919191929292949494
                9595959999999B9B9B9F9F9FA2A2A2A4A4A4AAAAAAABABAB7F7F7F4D4D4D5A5A
                5A939393EBEBEBFFFFFFFFFFFFF2FEF383B8882078294EA5577ECC867ACB8370
                C47A6AB771518F564F775492A395C5C7C5F0EFEFFFFFFFFFFFFFFBFEFBFFFFFF
                FFFFFFFFFFFFCBD3CC7DA57F449B4C4ABC554AC2574EC25A53C25E58C3635EC3
                6866C46E6BC4726FC57877CB807CCD8568BD722482301F6C295E7F64CED3CFFF
                FFFFFFFFFFF9F9F9A3A3A3565656838383AEAEAEACACACA4A4A4999999767676
                6767679C9C9CC6C6C6EFEFEFFFFFFFFFFFFFFCFCFCFFFFFFFFFFFFFFFFFFCFCF
                CF9595957979799090909494949595959797979A9A9A9C9C9C9F9F9FA1A1A1A4
                A4A4AAAAAAAEAEAE9C9C9C5E5E5E4F4F4F737373D1D1D1FFFFFFFFFFFFD5ECD8
                47905025843067BA7182CE8C79C28365A46C4C7951718973B3BBB4D3D5D4FBFB
                FCFFFFFFFFFFFFF0FAF1B4CDB6D0E6D2FFFFFFFFFFFFFDFEFDC4CEC5759D784E
                9F5451BC5C53C25E57C4615AC36462C46B67C46F6BC4736EC57774CB7D7BCE83
                7DCD864CA55616701F3A7242AAB7ACFDFEFDFFFFFFE3E3E37474746060609A9A
                9AB1B1B1A6A6A68C8C8C6767677F7F7FB7B7B7D4D4D4FBFBFBFFFFFFFFFFFFF6
                F6F6C3C3C3DDDDDDFFFFFFFFFFFFFDFDFDCACACA8D8D8D7F7F7F939393979797
                9999999A9A9A9E9E9E9F9F9FA1A1A1A3A3A3A9A9A9AEAEAEAEAEAE8383834D4D
                4D5D5D5DB2B2B2FDFDFDFFFFFFB9DDBD2A7A3335903F75C27E84C98C5D936262
                81648F9E90C2C8C3DEDFDFF9FAFAFFFFFFFFFFFFFFFFFFCAE5CC7BB98095CA99
                EDFBEEFFFFFFFFFFFFEFF1EFB7C4B9719C7456A75C5ABF625AC3645DC36863C4
                6D67C46F6BC4746EC47875CA7D7ACC827DCD875FB5681F7D28296F328FA392F3
                F5F4FFFFFFCFCFCF5B5B5B6D6D6DA4A4A4AEAEAE7E7E7E747474989898C5C5C5
                DEDEDEF9F9F9FFFFFFFFFFFFFFFFFFDADADAA0A0A0B5B5B5F5F5F5FFFFFFFFFF
                FFF0F0F0BFBFBF8B8B8B8787879797979A9A9A9C9C9C9E9E9E9F9F9FA1A1A1A3
                A3A3A9A9A9ACACACAEAEAE9494945858585454549B9B9BF4F4F4FDFFFE94C79A
                1D7427489D517FC98784CA8B6498689AB49BDAE1DBF5F6F5FFFFFFFFFFFFFFFF
                FFFFFFFFE8F3E992C5955DBA6467B86EC1E3C3FFFFFFFFFFFFFFFFFFECEEECB1
                BFB36D997056A35B60C06963C46D65C46E68C4706CC4736EC47674C87C78CC81
                7CCD8569BD712C8B361D6D27739478E3E8E5FFFFFFB3B3B35353537C7C7CACAC
                ACAFAFAF838383A9A9A9DEDEDEF5F5F5FFFFFFFFFFFFFFFFFFFFFFFFEEEEEEB0
                B0B0959595989898D5D5D5FFFFFFFFFFFFFFFFFFEDEDEDB9B9B9878787848484
                9B9B9B9E9E9E9F9F9FA0A0A0A1A1A1A2A2A2A7A7A7ABABABAEAEAE9C9C9C6666
                664E4E4E878787E6E6E6F7FFF876B17E1C772552A65B82CD8A7FCD8777C17D86
                BE8AAFCEB1E2EFE3FFFFFFFFFFFFFFFFFFFFFFFFBADBBD6DBA735BC1635FBD66
                8EC792F0FDF0FFFFFFFFFFFFFFFFFFE6E8E6AAB8AB6590685CA96368C37066C4
                6E6AC4716DC4736DC47571C87B75CB7E79CD806FC3763996431A6F245E8A63D3
                DCD5FEFEFE9B9B9B545454858585B0B0B0AFAFAFA4A4A4A8A8A8C1C1C1E9E9E9
                FFFFFFFFFFFFFFFFFFFFFFFFCECECE9B9B9B999999989898B0B0B0F7F7F7FFFF
                FFFFFFFFFFFFFFE7E7E7B2B2B27F7F7F8B8B8B9F9F9F9F9F9FA0A0A0A1A1A1A2
                A2A2A7A7A7AAAAAAACACACA2A2A27272724E4E4E797979D8D8D8F3FFF466A36E
                1D782656AA5F7FCD887ACC8372C57970C37777BF7D93C597BFDAC1EBF6ECFFFF
                FFF1F9F388BF8E63C06C60C26861C26970BB78C1E0C4FFFFFFFFFFFFFFFFFFFF
                FFFFE3E5E3AFBBAF68926B5BA3616BC1736CC4736DC4746DC4756EC67973CA7D
                76CC7E72C77A429C4B1A70234F8156CBD6CDFBFBFB8C8C8C555555898989AFAF
                AFACACACA4A4A4A2A2A2A3A3A3B1B1B1CFCFCFF1F1F1FFFFFFF6F6F6AAAAAA9C
                9C9C9B9B9B9C9C9C9E9E9ED4D4D4FFFFFFFFFFFFFFFFFFFFFFFFE4E4E4B6B6B6
                8181818787879F9F9FA1A1A1A2A2A2A2A2A2A4A4A4A9A9A9AAAAAAA6A6A67979
                794F4F4F6E6E6ED2D2D2EFFDF260A0691D792755AA5E7ACB8377CB7F72C87A6B
                C3746AC4716BC27277C07D9BC8A0D7E7D9C2E0C66FB87766C36E66C46E67C56F
                6DC17585BD8CF8FFFAFFFFFFFFFFFFFFFFFFFFFFFFE6E7E5ADBBAE68906C559A
                5A70C2766DC4746DC4746CC5776EC67874CD7E72CA7B439F4B1971214B7F52CB
                D6CDF8F8F8888888555555898989ACACACAAAAAAA6A6A6A1A1A1A0A0A0A0A0A0
                A3A3A3B6B6B6E0E0E0D4D4D49C9C9C9E9E9E9F9F9FA0A0A0A0A0A0A7A7A7FDFD
                FDFFFFFFFFFFFFFFFFFFFFFFFFE6E6E6B5B5B58080807E7E7EA1A1A1A2A2A2A2
                A2A2A3A3A3A4A4A4ABABABA8A8A87B7B7B4F4F4F6B6B6BD2D2D2EFFDF25FA068
                1C792652AA5B75C77D6FC5786CC4756BC47367C46F65C46D65C36E66BE7078BE
                7F79C3806CC4746BC5736DC5756FC67873C87A77C27DAECDB2F9FFFAFFFFFFFF
                FFFFFFFFFFFFFFFFE6E8E7BAC3BB7B957C5F956268B36E6CC1736DC4746EC474
                6DC4776DC67842A04C1972224A7F51CBD5CCF8F8F8878787555555888888A7A7
                A7A4A4A4A2A2A2A1A1A19F9F9F9F9F9F9E9E9E9C9C9CA3A3A3A6A6A6A2A2A2A2
                A2A2A3A3A3A4A4A4A6A6A6A4A4A4C1C1C1FEFEFEFFFFFFFFFFFFFFFFFFFFFFFF
                E7E7E7BFBFBF8A8A8A7F7F7F9595959F9F9FA2A2A2A2A2A2A3A3A3A4A4A47C7C
                7C4F4F4F6B6B6BD1D1D1F0FEF361A06A1B79264FAA5871C77A6DC3756BC47368
                C57066C46D65C46D65C46D66C36F6CC1746FC37670C87872C77B76C87E7ACB81
                7ECD8481CC8690C496CEE2D0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEDEFEEC3C9
                C38C9F8C6289645F9D656DBE746DC4746DC4746CC57541A04B1871224C8254CE
                D9D0F9F9F9888888555555878787A6A6A6A1A1A1A1A1A1A0A0A09F9F9F9F9F9F
                9F9F9F9F9F9FA0A0A0A2A2A2A6A6A6A6A6A6A8A8A8ABABABAEAEAEAEAEAEB0B0
                B0DADADAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEEEEEEC6C6C697979779797985
                85859E9E9EA2A2A2A2A2A2A2A2A27B7B7B4F4F4F6E6E6ED5D5D5F5FFF66BA973
                19782449A7536DC5766AC47368C47066C46E65C46D65C46D67C46F69C5726EC6
                7673C97B78CC807BCB8480CC8884CE8B87CE8D88CD8F8ECA94A6C9A9E7F1E8FF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFF6F7F6D7D9D7B4BFB476997870BA756DC574
                6DC5746AC4733F9D491970235E8F64DBE5DDFCFCFC919191545454838383A3A3
                A3A1A1A1A0A0A09F9F9F9F9F9F9F9F9F9F9F9FA1A1A1A4A4A4A7A7A7ABABABAC
                ACACAFAFAFB1B1B1B2B2B2B2B2B2B3B3B3BBBBBBEDEDEDFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFF6F6F6D8D8D8BABABA8B8B8B9C9C9CA2A2A2A2A2A2A1A1A17979
                794F4F4F7C7C7CE1E1E1F9FFFA81BA8918742243A14C6AC47268C47066C46E65
                C46D65C46D66C46F6AC4726EC67674CB7C79CD8180CE8785CE8C8ACE908FCF95
                92CF9893CF9994CE999ACA9FB9D2BCF0F7F0FFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFEFEEAF0EA9FC0A176C07B6DC5746DC57366BF6C3796401C702478A27CEA
                F2EAFFFFFFA4A4A45050507C7C7CA1A1A1A0A0A09F9F9F9F9F9F9F9F9F9F9F9F
                A1A1A1A4A4A4A9A9A9ACACACAFAFAFB1B1B1B3B3B3B6B6B6B7B7B7B8B8B8B7B7
                B7B7B7B7C8C8C8F4F4F4FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEEDEDEDB2
                B2B2A2A2A2A2A2A2A2A2A29C9C9C7171714F4F4F919191EEEEEEFFFFFFA4D3AA
                1F752739974163BF6A67C46E65C46D65C46D65C46E68C3716EC47675CA7D7ACC
                8282CE8989CE908FCF9794CF9B99CF9F9CCFA19ECFA29DCFA29ECEA3A4C9A8C9
                D9CAFCFFFBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6FFF6A0CBA373C07A6DC474
                6DC57460BB672A8B3325742D97B69BF6FAF7FFFFFFC1C1C15353537272729B9B
                9B9F9F9F9F9F9F9F9F9F9F9F9FA0A0A0A2A2A2A9A9A9ACACACB0B0B0B3B3B3B6
                B6B6B8B8B8BABABABBBBBBBBBBBBBBBBBBBBBBBBBABABAD2D2D2FDFDFDFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFBFBFBBABABAA2A2A2A2A2A2A2A2A29797976565
                65555555AAAAAAF8F8F8FFFFFFC3E4C7308139298B3259B86165C46D65C46D64
                C46D66C46E6BC47372C87A7ACC8180CD8788CE8E92CF9797CE9D9CCEA2A2D0A6
                A6D1A9A5D2AAA4D1AAA4D1AAA4CEAAACCAB0DCE8DDFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFEEF9EF96CA9B70C0786BC4736BC47458B4601F8029397F41B7CAB9FF
                FFFFFFFFFFD7D7D76262626565659393939F9F9F9F9F9F9F9F9F9F9F9FA1A1A1
                A6A6A6ACACACAFAFAFB2B2B2B7B7B7B9B9B9BBBBBBBEBEBEC0C0C0C0C0C0C0C0
                C0C0C0C0BEBEBEBEBEBEE3E3E3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF4F4F4B6
                B6B6A1A1A1A1A1A1A1A1A19090905A5A5A646464C2C2C2FFFFFFFFFFFFE4F6E5
                62A3671B7A254DAD5766C46F65C46D65C46D68C4706FC67677CB7F80CE8687CE
                8D91CF9598CF9EA0D0A5A5D0ABAAD2B0B0D5B3B2D6B4B0D7B5B0D7B4ADD5B2AA
                D1AFAFCAB2D6E1D6FFFFFFFFFFFFFFFFFFFFFFFFEAF6EC90C8976FC2776BC473
                6AC473429F4A1B722266996BDCE7DEFFFFFFFFFFFFEEEEEE8989895555558888
                889F9F9F9F9F9F9F9F9FA0A0A0A4A4A4AAAAAAAFAFAFB2B2B2B6B6B6BABABABD
                BDBDC0C0C0C3C3C3C6C6C6C7C7C7C8C8C8C8C8C8C5C5C5C2C2C2BFBFBFDCDCDC
                FFFFFFFFFFFFFFFFFFFFFFFFF1F1F1B2B2B2A2A2A2A1A1A1A1A1A17A7A7A5050
                50858585E3E3E3FFFFFFFFFFFFFEFFFEA3CFA72A7D3239974365C26E65C36E66
                C36E69C47173C87A7BCC8284CD8B8ECF9497CF9DA1D0A7A8D1AEAFD5B5B6D9BB
                B9D9BDBCD9BEBBD9BEB8D9BCB6D8B9B2D5B5ABD0AFA9C4ACDCE4DCFFFFFFFFFF
                FFFFFFFFEEF8EF93CA9A70C2786DC3755CB86620802A317B399EBCA2F6FBF7FF
                FFFFFFFFFFFFFFFFBEBEBE5D5D5D7373739E9E9E9E9E9E9E9E9EA0A0A0A6A6A6
                ACACACB0B0B0B5B5B5B9B9B9BEBEBEC1C1C1C7C7C7CCCCCCCCCCCCCDCDCDCDCD
                CDCCCCCCCACACAC7C7C7C1C1C1B9B9B9E0E0E0FFFFFFFFFFFFFFFFFFF4F4F4B5
                B5B5A2A2A2A1A1A19494945B5B5B5E5E5EB0B0B0F9F9F9FFFFFFFFFFFFFFFFFF
                D9F1DB589B5E1E7C284FAF5966C46F66C36E6BC57372C87C7ECD8587CE8E93CF
                999FD1A4A8D2ADB0D6B5B8DABDBEDAC1C0DAC2C3DBC3C1DBC3BEDAC1BCDABEB8
                D9BBB0D4B5ABCFB0AFC9B0D7E2D7FCFDFBFFFFFFF1FBF298CA9F72C17B6CC375
                3D9B461775205F9965D4E2D5FFFFFFFFFFFFFFFFFFFFFFFFE7E7E78181815858
                588A8A8A9F9F9F9E9E9EA2A2A2A7A7A7AEAEAEB2B2B2B8B8B8BDBDBDC2C2C2C7
                C7C7CDCDCDCFCFCFCFCFCFD1D1D1D0D0D0CFCFCFCECECECCCCCCC6C6C6C1C1C1
                BEBEBEDDDDDDFCFCFCFFFFFFF7F7F7B7B7B7A3A3A3A1A1A17676765050508282
                82DCDCDCFFFFFFFFFFFFFFFFFFFFFFFFF9FFFB98C79D277D3023852D62C16B69
                C5706EC57677C97F81CD898CCF9297D09DA3D1A7AED4B2B8D9BCBEDBC2C3DAC6
                C7DAC9CADCCAC7DAC9C4DAC6C0DAC3BBDABFB4D5B8ADD2B1A7CFABA8C8ABC8D7
                C9F3F8F2F4FEF4A1CCA578C58060BA69197A2431803A9BC1A0F5FCF6FFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFB5B5B55C5C5C5F5F5F9C9C9CA1A1A1A3A3A3A9A9A9
                B0B0B0B5B5B5BABABABFBFBFC5C5C5CCCCCCD0D0D0D1D1D1D2D2D2D4D4D4D2D2
                D2D1D1D1D0D0D0CECECEC8C8C8C3C3C3BFBFBFBBBBBBD1D1D1F5F5F5F9F9F9BB
                BBBBA7A7A7979797555555626262B2B2B2F9F9F9FFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFDAF1DC5D9E6316731D3F9E476AC3716FC57778C98082CD8B8FCF969ACF
                A0A6D1AAB3D5B5BDD9C0C2DAC6CADBCDCFDBD1D0DCD1CDDBCFC9DBCBC3DAC5BE
                DAC0B7D7BAAFD4B2A5D0A99ECDA4A0C8A4BBD4BDD2E8D49FCDA372C17934943C
                1D76276EA473DCECDEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE8E8E88484
                844E4E4E797979A0A0A0A3A3A3A9A9A9B0B0B0B6B6B6BABABAC0C0C0C7C7C7CE
                CECED1D1D1D4D4D4D6D6D6D7D7D7D5D5D5D4D4D4D1D1D1CFCFCFCACACAC5C5C5
                BFBFBFBBBBBBB8B8B8CACACADFDFDFBBBBBBA2A2A26E6E6E5454548F8F8FE5E5
                E5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB3D8B63D894317781F42
                9F4A6CC47576C88083CD8C90CF979BCFA1A7D1ABB4D5B7BFDAC2C7DAC8CFDBD0
                D4DCD5D5DCD6D1DBD2C9D9CBC4DAC6BEDAC0B6D6B9AFD3B3A5D0A99CCFA195CD
                9B90C99691C9977FBF8540974616751E59975EC8E0CAFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFC9C9C96B6B6B5252527A7A7AA2A2A2A9A9A9
                B1B1B1B7B7B7BBBBBBC0C0C0C8C8C8CFCFCFD2D2D2D6D6D6D8D8D8D9D9D9D7D7
                D7D2D2D2D1D1D1CFCFCFC9C9C9C5C5C5BFBFBFBBBBBBB7B7B7B3B3B3B3B3B3A6
                A6A67474745050507E7E7ED6D6D6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFF9FFF9AAD6AE287C3017782042A04A6DC5767CCB848CCF9499D0
                9FA7D1ACB3D6B8BFDBC2C8DAC9D0DCD1D5DDD5D5DCD7D1DCD2CCDBCDC4DAC7BE
                DAC0B6D7BAAFD4B3A3D1A999D0A08ED0957CC9846DC1753F984718782136803C
                BDDBBFFCFFFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFC5C5C55B5B5B5252527B7B7BA3A3A3ACACACB5B5B5BBBBBBC1C1C1C9C9C9D0
                D0D0D2D2D2D7D7D7D9D9D9D9D9D9D7D7D7D5D5D5D1D1D1CFCFCFCACACAC5C5C5
                BFBFBFBBBBBBB6B6B6ABABABA0A0A0757575535353636363CFCFCFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFAFFFB8FBF9324
                772D18792141A14968C16F79C9818FCF94A1D2A5B1D6B6BDDAC1C5DAC8CDDCCF
                D2DBD3D2DCD4CEDBCFC8D9CAC2DAC5BCD9BEB3D5B6A9D2AD9AD3A187CD9075C5
                7E61BB6A379741177720357F3CA3C7A5FDFFFEFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFACACAC5757575353537B7B7B
                9E9E9EAAAAAAB6B6B6BEBEBEC8C8C8CFCFCFD2D2D2D6D6D6D7D7D7D8D8D8D5D5
                D5D2D2D2D0D0D0CDCDCDC7C7C7C2C2C2BDBDBDB2B2B2A6A6A698989872727252
                5252626262B8B8B8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFF9FFFBA4D1A938883F14721A27892F52B15B6BC0
                737CC68293D19AA7D8ACB6DBBABFDAC2C5DAC7C7DAC9C4DAC6BFDAC0B7DABAAD
                D9B09CD4A289CC9075C57E67C0714BAA5520832A1774224B9053BBDABDFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFBFBFBF6969694C4C4C6262628C8C8C9F9F9FA9A9A9B9B9B9C5
                C5C5CCCCCCCFCFCFD1D1D1D2D2D2D1D1D1CFCFCFCCCCCCC7C7C7BEBEBEB2B2B2
                A6A6A69E9E9E8585855D5D5D505050757575CDCDCDFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7
                FFF8AAD3AD519757207A281F81283A9B4351AE5965BA6C78C47F89CB8F94CF99
                9AD19F9DD4A29DD3A296D19C8ECE9483CA8970C2785FBA694EAF593798411D7D
                272C803567A36EBFDDC3FBFFFCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEC2C2C27B7B7B
                5757575B5B5B757575898989989898A6A6A6B1B1B1B8B8B8BBBBBBBEBEBEBEBE
                BEBABABAB5B5B5AEAEAEA2A2A29797978A8A8A7272725858585F5F5F8C8C8CD1
                D1D1FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFFFFCDEAD087BD8D4792501C79
                261B7C243090393F9E4949A75351B05B57B46058B56058B56156B46050AE5A48
                A6513B9B462C8F371B7D26277C2F589B5E9DCAA2E2F5E4FFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFDEDEDEA8A8A87575755555555656566B6B6B79
                79798383838B8B8B9090909090909191919090908A8A8A818181767676696969
                5757575B5B5B818181B8B8B8EDEDEDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFF3FFF6C8E9CD85BE8B46914E1D7527177622167A21178022
                1B83241B83241B83251B8225197D231A78241D75272A7B32569B5D99C89ED9F0
                DAFAFFFBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FCFCFCDCDCDCA8A8A87474745353535252525353535757575A5A5A5A5A5A5B5B
                5B5A5A5A5656565454545353535B5B5B808080B6B6B6E6E6E6FFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF3FF
                F5D3EED6A6D5AC7FBA865A9E61418D483988403988403988403C8A444E96566B
                A97297C99CBBDFBEDDF2DFF9FFFBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBFBFBE3E3E3C3C3C3A3
                A3A38484846F6F6F6969696969696969696C6C6C7A7A7A919191B5B5B5D1D1D1
                E9E9E9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8FFFAECFCEDDBEEDC
                D2E8D4D1E8D3D1E9D4D5EAD7E4F7E6F3FFF5FDFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF5F5F5E6E6E6DFDFDFDFDFDFDFDF
                DFE1E1E1EFEFEFFBFBFBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
              NumGlyphs = 2
            end
            object btDesmarcarTodos: TBitBtn
              Left = 50
              Top = 3
              Width = 46
              Height = 46
              Hint = 'Desmarcar Todos'
              Anchors = [akTop, akRight]
              ParentShowHint = False
              ShowHint = True
              TabOrder = 1
              OnClick = btDesmarcarTodosClick
              Glyph.Data = {
                B6250000424DB625000000000000360000002800000050000000280000000100
                18000000000080250000C40E0000C40E00000000000000000000FFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFEFEFFF7F6F7EEECECE6E4E6DEDEE0DAD9DCDADADDDDDFE0E4E3E5EA
                E7E9F3F1F1FDFBFCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEF6
                F6F6ECECECE4E4E4DEDEDEDADADADADADADFDFDFE3E3E3E7E7E7F1F1F1FBFBFB
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFF6F6F7E4E4E9CDCDD8B9B9C8A7A7BA9B9AB1
                9393AC9090A99091A89293A99899ADA4A4B3B7B6C1C9C9CEDEDDDFF1F0F0FFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFF6F6F6E5E5E5D0D0D0BDBDBDACACACA0A0A09A9A9A9797979797
                979999999E9E9EA8A8A8B9B9B9CACACADDDDDDF0F0F0FFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF5F5F8DEDEE7BCBD
                CF9596B97071AC5557A341419D3434992E2E962E2E962E2E96303195393B9749
                4B9A61619D7878A09998ADB9B9C3D7D7DAEFEFF0FFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF5F5F5E0E0E0C2C2C2A0A0A08282826D
                6D6D5C5C5C5252524D4D4D4D4D4D4D4D4D4E4E4E565656626262727272838383
                9E9E9EBBBBBBD7D7D7EFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFEFEFFE7E6EDC1C1D58486B95152A72D2D9A1617940B0C9504049801019C
                00009D00009D00009E01019C0304980909941414922322923E3E9763639C9393
                ABBCBCC3DEDEDFF7F8F7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEE8E8E8
                C6C6C69595956B6B6B4D4D4D3C3C3C3434343030302F2F2F2E2E2E2E2E2E2F2F
                2F2F2F2F3030303232323939394343435858587474749A9A9ABEBEBEDEDEDEF7
                F7F7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCFCFFDADAE89E9DC95A5AAA23249A0708
                9800009D0000A00101A50404AF0607B90505BB0303BA0405BA0808B90606B104
                03A80100A001009C0506991919944141967373A0A4A4B3CECFD1F1F1F2FFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFCFCFCDEDEDEAAAAAA7171714747473232322E2E2E2F2F2F32
                32323737373C3C3C3B3B3B3939393B3B3B3C3C3C3939393434342F2F2F2E2E2E
                3131313D3D3D5A5A5A808080A8A8A8CFCFCFF1F1F1FFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCFCFCD7
                D7E88788C234359D0D0E9801019B00009F090AB41515CA1617D41515DB1212E1
                0F0FE40E0FE31111E41919E41E1EE02021D91E1ECC1212B80000A000009C0B0B
                982626925858999395ABCBCCCEF3F3F3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCFCFCDCDCDC999999535353
                3737372F2F2F2E2E2E3C3C3C4B4B4B4F4F4F5050504F4F4F4E4E4E4E4E4E5050
                505555555858585757575252524343432F2F2F2E2E2E3535354646466B6B6B9B
                9B9BCCCCCCF3F3F3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFEFDFFD1D1E77777BD1A1B9803039B00009F0D0CAF2A29
                D52F2FEA2121EE1A19F30F0FF10A08F10605F10302EF0B0AF01312F21C1BF326
                26F23232F13C3DEF3335DA1010B002019F02019B1211964645978888A4C2C1C7
                F6F5F6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFDFDFDD7D7D78B8B8B4040403030302F2F2F3C3C3C5C5C5C6666665E5E5E5A
                5A5A5252524D4D4D4B4B4B4848484E4E4E5555555B5B5B6262626B6B6B727272
                6666663F3F3F3030302F2F2F3838385D5D5D909090C2C2C2F5F5F5FFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFFDCDBEF7272BC15
                149801009D0A0AA72626C53E3DE63C3AF3302EF5201FF31514F30C0BF10504F2
                0000F00000F10706F1100EF21816F32524F53230F63B3BF64B4AF74E4DEE3130
                CB0E0DA802019B0E0C95403F948988A7CFCED2F7F5F5FFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE1E1E18888883B3B3B2F2F2F383838
                5555556F6F6F7171716969695E5E5E5656564F4F4F4B4B4B4545454747474C4C
                4C5252525858586262626B6B6B7272727D7D7D7D7D7D5E5E5E3B3B3B2F2F2F35
                3535585858919191CFCFCFF5F5F5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFE0E0F28585C915159901019A0E0FA93B3BD55151F34847F73737
                F42E2EF6201FF41516F20C0BF10403F00000EF0000F00605F10F0EF21816F324
                23F63030F63B3BF64A4AF85657F95D5EF54647D81515AA02029B090895424195
                9C9CB2D5D5D7FBFBFBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE5E5
                E59999993C3C3C2E2E2E3C3C3C6969698181817B7B7B6F6F6F6969695E5E5E57
                57574F4F4F4949494646464747474B4B4B5252525858586262626B6B6B727272
                7E7E7E8787878B8B8B7272724141412F2F2F3232325A5A5AA2A2A2D5D5D5FBFB
                FBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF1F1FD9998D22D2DA202029B0E
                0EA63F3FD45A59F45353F84747F8393AF7302EF72120F31817F30F0EF20907F1
                0402F10605F10B09F11211F21A1AF42524F63130F63C3AF64A49FA5353F86160
                F96A69F75151DC1B1AAE03029C1413936463A1B0AFBEE6E5E7FFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFF4F4F4A9A9A94F4F4F2F2F2F3B3B3B6B6B6B878787
                8484847B7B7B7272726A6A6A5F5F5F5858585252524D4D4D4949494B4B4B4E4E
                4E5454545B5B5B6262626B6B6B7272727E7E7E8484848D8D8D9393937A7A7A46
                4646303030393939757575B3B3B3E5E5E5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFC6C5E94949AD06069A0808A14344D06768F66262FA5454F84949F83D3D
                F73231F62624F51C1CF41514F3100FF30B0BF10D0CF11111F31717F31E1EF327
                27F53332F63C3CF74A49F95353F76060F96F6FFB7475F95454DA0F0FA402039A
                2829937A7AA7C8C8D0F7F7F7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCFCFCF6666
                663232323535356D6D6D9292928F8F8F8585857D7D7D7474746C6C6C6262625C
                5C5C5656565353534F4F4F5050505454545858585D5D5D6464646C6C6C737373
                7D7D7D8484848D8D8D9898989C9C9C7C7C7C3B3B3B303030484848878787CACA
                CAF7F7F7FFFFFFFFFFFFFFFFFFFFFFFFEEEEFB8888CB1A1A9C00009A3232C175
                74F66F70FB6464FA5555F84C4BF94040F63635F72A2AF52121F31B1BF31616F3
                1415F31515F3191AF41E1FF42324F42B2BF43435F53E3FF74A4AF85557F95F60
                F96D6DFB7979FC7D7DFA4342C804059B0A0B9846469AA5A6BBE5E5E7FFFFFFFF
                FFFFFFFFFFFFFFFFF1F1F19C9C9C4040402D2D2D5C5C5C9A9A9A999999909090
                8585857F7F7F7676766F6F6F6666665F5F5F5B5B5B5858585757575757575B5B
                5B5E5E5E6262626767676E6E6E7575757E7E7E8787878D8D8D979797A0A0A0A2
                A2A26A6A6A3131313535355F5F5FACACACE5E5E5FFFFFFFFFFFFFFFFFFFFFFFF
                C9C9E94949AD0404990D0EA16F6DEF7D7CFC7171FB6666FA5A59F94F4EF84645
                F83A3AF63130F52929F52424F41F1FF31E1EF31E1FF32122F42726F52B2BF533
                33F53A3CF64444F84C4CF75758F96162F96D6EFB7878FC8281FD7F7EF62727B3
                00019B1F1F947675A9CBCAD4F9F9FAFFFFFFFFFFFFFFFFFFD2D2D26666663030
                30393939949494A2A2A29A9A9A9292928888888080807A7A7A7272726B6B6B65
                65656262625E5E5E5D5D5D5E5E5E6060606464646767676D6D6D737373797979
                7F7F7F8888888F8F8F9898989F9F9FA6A6A6A1A1A15050502E2E2E4141418484
                84CDCDCDF9F9F9FFFFFFFFFFFFF5F6FF9595D51B1C9B03039B4343C98583FB7F
                7DFB7474FC6767FA5C5CF95050F74747F83F3EF63636F43231F62C2CF42A29F4
                2826F42928F62D2DF6302FF63333F53A3BF64243F84848F75151F95A5AF96464
                FA6E6FFB7778FC7F7FFB8A8AFE5B5BDD0100990909954D4D9EACADBEEDECEEFF
                FFFFFFFFFFF9F9F9A8A8A84141413030306B6B6BA7A7A7A2A2A29C9C9C929292
                8A8A8A8181817B7B7B7575756E6E6E6C6C6C6767676565656363636565656969
                696A6A6A6D6D6D7272727979797C7C7C8383838989899090909898989F9F9FA4
                A4A4ACACAC8181812D2D2D323232656565B1B1B1ECECECFFFFFFFFFFFFDCDCF5
                5252B60505991E1FAC7677ED8A8AFA7E7DF57474F46868F35D5EF15353F04C4C
                F04544EE3E3EEE3939ED3736ED3433ED3433EE3434ED3736ED3A3AEE3D3EEF42
                42EE4849EF4E4EF05454F05D5CF16666F36D6EF37676F57E7EF68686FA8483FA
                1C1CAD01019A2A2A958889ADDBDBE0FFFFFFFFFFFFE3E3E36F6F6F3131314949
                499A9A9AABABABA0A0A09A9A9A9191918989898181817D7D7D7676767272726E
                6E6E6C6C6C6A6A6A6B6B6B6B6B6B6C6C6C6F6F6F7272727575757A7A7A7E7E7E
                8282828888889090909595959B9B9BA1A1A1A8A8A8A6A6A64747472E2E2E4949
                49939393DCDCDCFFFFFFFFFFFFC2C1EB2928A001009B4040C58788F68687E684
                84D37A7ACD7271CA6C6BCB6564CA6060C95D5CC95959C85756C75655C85554C8
                5555C85456C85655C75958C95B5BCA5C5CC95F5FC96363CA6765CA6A69C9706F
                CA7575CD7B7ACD8180D28180E58787F84342CC02019C1616946C6BA9CBCAD5FE
                FEFEFFFFFFCDCDCD4B4B4B2E2E2E676767A8A8A8A3A3A39B9B9B9292928B8B8B
                8787878282827F7F7F7C7C7C7A7A7A7777777777777676767777777777777777
                777979797C7C7C7C7C7C7E7E7E8181818383838585858A8A8A8F8F8F92929298
                98989E9E9EA8A8A86B6B6B2F2F2F3B3B3B7D7D7DCDCDCDFEFEFEFFFFFFA8A7E3
                11109205059E5959D88E8FF98B8BD2C1C1DCB5B5CBAFAFC8AEADC9ADACCAABAA
                C8ACABC8AEACCAAEACCAAEACCAADACCAADACCAADADC9ABABC8ADACCAADACCAAB
                AAC9ABABC9AEACCAAEADC9ADADC8AFAEC8B0AEC7ADACC4A7A6C57574C18787F3
                5C5CDF0908A10908974D4CA3B9B8CBF8F8F9FFFFFFB9B9B93636363232327E7E
                7EAEAEAEA0A0A0C9C9C9BBBBBBB6B6B6B5B5B5B5B5B5B3B3B3B3B3B3B5B5B5B5
                B5B5B5B5B5B5B5B5B5B5B5B5B5B5B3B3B3B5B5B5B5B5B5B3B3B3B3B3B3B5B5B5
                B5B5B5B5B5B5B5B5B5B5B5B5B3B3B3AFAFAF8B8B8BA7A7A78383833535353232
                32666666BDBDBDF8F8F8FCFCFF9393DB0A09901111A76767E29191F99291D1F8
                F8FFF0F1F4EAEBEEEAEAEEEAEAEEEBEAEEEBEAEEEBEAEEEAEAEEEBEAEEEBEAEE
                EAEAEEEBEAEEEAEBEEEAEAEEEBEAEEEAEAEEEAEAEEEAEAEEEAEAEEEAEAEEEBEA
                EDE7E6EADCDCDFC4C4CF7171B58283EF6C6CED1718AB02029B3737A0AAAAC3F3
                F3F4FFFFFFA8A8A83131313D3D3D8B8B8BB0B0B0A4A4A4FBFBFBF1F1F1EBEBEB
                EBEBEBEBEBEBEBEBEBEBEBEBEBEBEBEBEBEBEBEBEBEBEBEBEBEBEBEBEBEBEBEB
                EBEBEBEBEBEBEBEBEBEBEBEBEBEBEBEBEBEBEBEBEBEBEBEBEBE7E7E7DCDCDCC7
                C7C7858585A3A3A39292924343432F2F2F565656B1B1B1F3F3F3FBFBFF8584D0
                0807901817AC6A6BE88D8DF79291D2FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0F0F0CECCD57271B6807FF0
                7574F52828B900009D2D2D9EA2A2BFF0F0F1FEFEFE9A9A9A3030304343439090
                90ACACACA4A4A4FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFF0F0F0CECECE858585A0A0A09A9A9A5353532E2E
                2E4E4E4EAAAAAAF0F0F0FAFAFF8080CE06078F1718AD6566E88788F89191D2FF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFF6F6F6CFCFD97171B77C7CF07576F43131BF00009C27279B9E9FBFEF
                EFF1FDFDFD9797972F2F2F4444448C8C8CA9A9A9A4A4A4FFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6F6F6D1
                D1D18585859E9E9E9B9B9B5B5B5B2D2D2D494949A8A8A8EFEFEFFAFAFF7F80CE
                0506901617AD6061E87E80F68A8CD0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6F6F6CECFDA6A6BB57677EE
                7575F63232BF00009C27279C9FA0C1EFEFF2FDFDFD9797972F2F2F4343438989
                89A3A3A3A0A0A0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFF6F6F6D2D2D28181819A9A9A9B9B9B5C5C5C2D2D
                2D494949A9A9A9EFEFEFFBFBFF7E7ECD0506901414AC5A5CE5797BF6898BD2FF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFF9F9F9D3D3DD6B6BB67373EE7071F53231BF00009C2A2A9FA5A5C6F0
                F0F4FEFEFE9595952F2F2F4141418484849F9F9FA0A0A0FFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9F9F9D5
                D5D58181819797979898985B5B5B2E2E2E4C4C4CAEAEAEF1F1F1FAFBFF8384D1
                0707911313AC5859E57575F58586D2FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE1E2F06E6EBB7272EF
                6F70F42D2DBC00009C2D2CA0ABAACAF6F5F8FEFEFE9A9A9A3030304040408282
                829B9B9B9C9C9CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE6E6E68585859797979797975757572D2D
                2D4E4E4EB3B3B3F6F6F6FEFFFF9495DD0A0A920E0FA85253E26F70F57879D5C4
                C4EDC7C7EAC8C8EAC9C9E9CAC9E8CCCDEACDCEE9CFD1E9D3D3EAD4D5E9D4D5E9
                D5D5E9D5D5E9D8D7EAD7D6EAD5D5E9D5D5E9D4D4EAD3D3EAD0D0E9CDCEE9CCCD
                EACBCCEAC9C9E9BEBEE76F6DCA7271F26768EF1F20B200009C3635A4B7B5D2FC
                FBFEFFFFFFAAAAAA3232323C3C3C7D7D7D979797949494D0D0D0D1D1D1D2D2D2
                D2D2D2D2D2D2D5D5D5D5D5D5D7D7D7D9D9D9DADADADADADADADADADADADADCDC
                DCDCDCDCDADADADADADADADADAD9D9D9D7D7D7D5D5D5D5D5D5D4D4D4D2D2D2CA
                CACA8989899797979090904B4B4B2E2E2E565656BDBDBDFCFCFCFFFFFFA9A8E4
                100F940606A14848D96B6BF56B6AE77271D77272D47574D57978D57F7DD48483
                D58989D79191D99796D89D9CDA9F9FD9A1A0D9A3A2D9A7A5DCA3A1D9A1A0D99F
                9EDA9B9AD99896DA918FD78A8AD68485D5807FD57D7CD67978D96F6CE6706FF6
                5859E60E0FA505059A4A4AABC8C7DDFFFFFFFFFFFFBABABA3636363434347373
                739494948F8F8F8F8F8F8F8F8F9191919393939797979B9B9BA0A0A0A6A6A6A9
                A9A9AEAEAEB0B0B0B1B1B1B2B2B2B5B5B5B1B1B1B1B1B1B0B0B0ACACACAAAAAA
                A4A4A4A0A0A09C9C9C9898989797979595959090909797978383833B3B3B3131
                31676767CDCDCDFFFFFFFFFFFFC4C3ED2625A000009D3737C9686AF56A69F867
                67F46868F36C6BF37373F47B7BF58585F68D8CF79898F9A09FF8A7A6F9ACACFA
                B0B0FBB2B1FAB3B2FBB2B1FBB0AFFCAAA8FBA3A3FB9E9DFA9594F78C8DF78585
                F77D7DF67676F47272F47170F96F6FF54848D703039D1111977171BBDDDDECFF
                FFFFFFFFFFCFCFCF4949492E2E2E626262939393939393919191919191939393
                9999999F9F9FA6A6A6ACACACB5B5B5B9B9B9BEBEBEC3C3C3C6C6C6C6C6C6C7C7
                C7C7C7C7C6C6C6C1C1C1BDBDBDB8B8B8B1B1B1ACACACA7A7A7A1A1A19B9B9B98
                9898999999979797727272313131393939878787E1E1E1FFFFFFFFFFFFE5E5FD
                5C5CBE05059A191AAE5E5FEC6566F56669F86A6BFA6F70FB7879FC8284FE8D8E
                FE9899FFA4A5FFADAEFFB6B6FFBBBBFFC0C0FFC2C1FFC2C1FFBEBDFFBBBAFFB6
                B5FFADADFFA6A6FF9E9DFF9696FF8D8CFF8383FD7C7CFC7676FC7171F97070F7
                2A2ABD00009B28279BA1A1CFF4F4FBFFFFFFFFFFFFECECEC7979793131314646
                46898989909090939393959595999999A0A0A0A8A8A8AFAFAFB7B7B7C0C0C0C6
                C6C6CCCCCCD0D0D0D4D4D4D5D5D5D5D5D5D1D1D1CFCFCFCCCCCCC6C6C6C0C0C0
                BABABAB5B5B5AEAEAEA7A7A7A2A2A29E9E9E9999999898985555552E2E2E4949
                49AEAEAEF6F6F6FFFFFFFFFFFFFDFCFF9D9CDC1E1E9F04049D3C3BCD6768F466
                67F86D6CFC7373FC7C7CFC8787FD9393FD9F9FFFADAEFFB6B7FFC0C0FFC5C5FF
                C9C8FFCAC9FFCAC8FFC6C5FFC3C2FFBEBCFFB6B5FFAEADFFA3A2FF9A9AFF918F
                FE8685FD7D7DFC7776FD7272FA6262EE0908A005059A5252B2CCCDE6FFFFFFFF
                FFFFFFFFFFFFFFFFAFAFAF4444443131316666669191919292929797979B9B9B
                A2A2A2AAAAAAB2B2B2BBBBBBC7C7C7CDCDCDD4D4D4D7D7D7DADADADADADADADA
                DAD7D7D7D5D5D5D1D1D1CCCCCCC6C6C6BEBEBEB8B8B8B0B0B0A8A8A8A2A2A29E
                9E9E9A9A9A8B8B8B3535353131316E6E6ED4D4D4FFFFFFFFFFFFFFFFFFFFFFFF
                D7D7F64C4CB30303990B0CA36061EE6869F76D6EFA7677FC8082FD8C8EFE9A9B
                FFA6A8FFB6B8FFC1C2FFCAC9FFCFCFFFD3D2FFD6D5FFD2D1FFD0CFFFCACBFFC3
                C4FFBBBBFFB3B3FFA6A7FF9D9EFF9192FF8789FE7D7EFC7778FC7474F93333C4
                01019B1C1B9C8988CAECECF9FFFFFFFFFFFFFFFFFFFFFFFFE0E0E06A6A6A2F2F
                2F3939398B8B8B9393939797979E9E9EA6A6A6AFAFAFB8B8B8C1C1C1CECECED5
                D5D5DADADADFDFDFE1E1E1E3E3E3E0E0E0DFDFDFDCDCDCD7D7D7D0D0D0CACACA
                C1C1C1BBBBBBB2B2B2ABABABA3A3A39F9F9F9B9B9B5E5E5E2F2F2F4141419B9B
                9BEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFF7F7FF8C8CD319199F00009B3234C668
                6BF56F6FF97878FB8283FD8E90FD9D9EFFACACFFBCBBFFC7C7FFD1D1FFD8D8FF
                DCDCFFDEDEFFD9D8FFD6D5FFCFCFFFC6C7FFBDBEFFB6B6FFA8A9FF9E9FFF9294
                FF888AFE7E7FFC7575FA5353DE0E0EA506069A4847ACC1C0E3FCFDFFFFFFFFFF
                FFFFFFFFFFFFFFFFFBFBFBA1A1A14141412D2D2D5F5F5F9393939898989F9F9F
                A7A7A7B0B0B0BABABAC5C5C5D0D0D0D8D8D8E0E0E0E5E5E5E8E8E8E9E9E9E5E5
                E5E3E3E3DEDEDED8D8D8D2D2D2CDCDCDC2C2C2BBBBBBB3B3B3ACACACA4A4A49C
                9C9C7C7C7C3B3B3B323232656565CACACAFEFEFEFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFD6D6F85050B506059B0909A34042D26F6FF9797AFB8486FD8F91FE9F9F
                FEAFAFFFC0C0FFCDCBFFD7D7FFE1E0FFE4E4FFE5E4FFE0DFFFD9D8FFD1D1FFC8
                C9FFBEBFFFB6B6FFAAACFF9E9FFF9293FF8788FE7C7BFB5F5EE71C1CB201019C
                24249E9797D3F1F1FDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE0E0E06E6E
                6E3131313737376C6C6C989898A0A0A0A9A9A9B1B1B1BBBBBBC7C7C7D4D4D4DC
                DCDCE4E4E4EBEBEBEEEEEEEEEEEEEBEBEBE5E5E5E0E0E0DADADAD2D2D2CDCDCD
                C5C5C5BBBBBBB3B3B3ABABABA1A1A18787874848482F2F2F484848A8A8A8F4F4
                F4FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA5A6DF2B2BA402019B0E
                0FA84B4BD97474F88384FD8F92FF9E9FFEAEAFFFC1C1FFCECDFFD8D8FFE3E3FF
                E8E7FFE8E7FFE2E3FFDBDAFFD2D1FFC9CAFFBEBFFFB6B6FFA8AAFF9D9EFF8F8F
                FF7E7FFC6464EB2A2BBD03039F0B0A996C6CBCE0DFF6FFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFB6B6B64F4F4F2F2F2F3C3C3C7575759B9B9B
                A8A8A8B2B2B2BBBBBBC7C7C7D4D4D4DDDDDDE5E5E5EDEDEDF0F0F0F0F0F0EDED
                EDE6E6E6E0E0E0DADADAD2D2D2CCCCCCC3C3C3BBBBBBB0B0B0A4A4A48C8C8C56
                5656313131343434838383E5E5E5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFF7F6FFA2A1E019189A01019B1212AB4848D67374F78587FC9EA1
                FFAFB0FFC1C1FFCCCCFFD7D7FFE3E2FFE8E7FFE7E6FFE1E1FFDAD9FFD1D0FFC8
                C7FFBEBEFFB6B6FFA6A6FF9192FF7A7AFA5C5DE62627BA0506A102029A4949AB
                D8D7F7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBFB
                FBB3B3B33E3E3E2F2F2F3F3F3F7272729B9B9BA9A9A9BDBDBDC8C8C8D5D5D5DD
                DDDDE4E4E4EDEDEDF0F0F0EFEFEFECECECE6E6E6DFDFDFD9D9D9D2D2D2CDCDCD
                C1C1C1B2B2B2A0A0A08585855252523434342F2F2F666666E0E0E0FFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFCFF7C7CC914
                149A04039D0F0EA73E3ECF6767EE7F7FF89E9DFFB7B7FFC6C4FFD2D0FFDBDAFF
                E0DFFFE1E0FFDCDAFFD4D3FFCDCBFFC2C1FFB5B5FFA5A5FF8887FA6F6EF15555
                E42121B704049F05059C3433A3BEBDEBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9393933C3C3C3131313B3B3B
                6969698F8F8FA3A3A3BBBBBBCECECED7D7D7DFDFDFE6E6E6EBEBEBEBEBEBE7E7
                E7E1E1E1DCDCDCD5D5D5CDCDCDC1C1C1A9A9A99595957F7F7F4D4D4D32323232
                3232545454CACACAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFF7F7FF9392D82928A205059A02039D1C1DB34747
                D76463E87F7FF49594FCA6A6FFB3B2FFBCBBFFC0C0FFB9B8FFB0B0FFA3A3FF94
                93FD8080F66D6EF05657E43636CA0E0EA702029D0E0D9C4F4FB4C5C5F2FFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFCFCFCA7A7A74C4C4C3131313030304949497272728A8A8AA1A1A1B3
                B3B3C1C1C1CACACAD1D1D1D4D4D4CFCFCFC9C9C9BFBFBFB2B2B2A3A3A3949494
                8181816262623B3B3B3030303737376D6D6DD2D2D2FFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6
                F6FF9FA0DD3E3EAE0D0D9C02039C0A0AA32626BA4B4ADB5858E56263EA6C6DEC
                7676EE7979ED7776EE7070EE6566EC5C5CE85050E13A3BCF1516AE0707A10506
                9B2021A16463BEC9C9F3FEFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBFBFBB2B2B25F5F5F
                3737373030303737375252527575758282828B8B8B9292929999999B9B9B9999
                999595958D8D8D8585857B7B7B6767674343433535353232324747477E7E7ED5
                D5D5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9F9FFBDBCEC6D6DC52D2DA50C0C
                9D03039D0B0BA61B1BB32A2AC03434C73A39CC3837CA3938CB3939CC3030C525
                25BC1313AC0606A203059C15169D4545AF9494D5DFDEFAFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFDFDFDCACACA87878750505037373731313139393948
                48485656565F5F5F6565656363636464646464645C5C5C525252404040343434
                3131313E3E3E646464A7A7A7E6E6E6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFE8E9FFB1B1E56969C42A2BA20C0C940606990607A00608A3
                0708A50203A10606A30808A50807A306059C0908951413944343AF8889D2CCCC
                F2F7F7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                EFEFEFC0C0C08484844E4E4E3434343131313434343636363636363232323434
                343636363535353232323232323939396363639E9E9ED7D7D7FBFBFBFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE9E9
                FFC4C4EE9493DA6161C04141B03334AB2A2CA5292AA52A2BA52E2EA73838AC4B
                4BB37878CBA8A8E2D5D5F6F6F7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEFD0D0D0A8A8A87D
                7D7D6262625757574F4F4F4E4E4E4F4F4F5252525A5A5A6A6A6A909090B9B9B9
                DEDEDEFBFBFBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFDFFF2F2FFE6E6FFD8D8F8
                CCCDF1C9CBF0CBCCEFCFCFF2DEDEFCEBEBFFF9F9FFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7F7F7EDEDEDE1E1E1D7D7D7D5D5D5D6D6
                D6D9D9D9E6E6E6F1F1F1FCFCFCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
              NumGlyphs = 2
            end
          end
        end
      end
    end
  end
  inherited dsControle: TDataSource
    DataSet = DMGERAL.TB_USUARIO_CMP
    Left = 653
    Top = 141
  end
  inherited dsGrid: TDataSource
    DataSet = DMGERAL.TB_USUARIO_CMP
    Left = 621
    Top = 133
  end
  inherited PopupMenu1: TPopupMenu
    Left = 621
    Top = 189
  end
  object qyPermissao: TIBQuery
    Database = DM.DB
    Transaction = DM.TS
    BufferChunks = 1000
    CachedUpdates = False
    Left = 658
    Top = 171
  end
end