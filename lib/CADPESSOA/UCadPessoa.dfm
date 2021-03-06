inherited frmCadPessoa: TfrmCadPessoa
  Left = 33
  Top = 37
  Caption = 'Cadastro de ...'
  ClientHeight = 566
  ClientWidth = 792
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited StatusBar1: TStatusBar
    Top = 547
    Width = 792
  end
  inherited Panel1: TPanel
    Width = 792
    inherited btPesquisar: TBitBtn
      OnClick = btPesquisarClick
    end
  end
  inherited Panel2: TPanel
    Width = 792
    Height = 495
    inherited pgGeral: TPageControl
      Width = 790
      Height = 493
      inherited tabLista: TTabSheet
        inherited Panel3: TPanel
          Width = 782
          Height = 465
          inherited grDados: TdxDBGrid
            Width = 780
            Height = 463
            KeyField = 'CD_PESSOA'
            Filter.AutoDataSetFilter = True
            Filter.Criteria = {00000000}
            GroupPanelColor = clTeal
            object grDadosColumn1: TdxDBGridColumn
              Color = clInfoBk
              ReadOnly = True
              TabStop = False
              Width = 70
              BandIndex = 0
              RowIndex = 0
              FieldName = 'CD_PESSOA'
            end
            object grDadosColumn2: TdxDBGridColumn
              Color = clInfoBk
              ReadOnly = True
              Width = 193
              BandIndex = 0
              RowIndex = 0
              FieldName = 'NM_PESSOA'
            end
            object grDadosColumn4: TdxDBGridColumn
              Color = clInfoBk
              ReadOnly = True
              Width = 79
              BandIndex = 0
              RowIndex = 0
              FieldName = 'NR_DOCUMENTO'
            end
            object grDadosColumn6: TdxDBGridColumn
              Color = clInfoBk
              ReadOnly = True
              Width = 75
              BandIndex = 0
              RowIndex = 0
              FieldName = 'NR_TELEFONE'
            end
            object grDadosColumn7: TdxDBGridColumn
              Caption = 'Endere'#231'o'
              Color = clInfoBk
              Width = 115
              BandIndex = 0
              RowIndex = 0
              FieldName = 'DS_ENDERECO'
            end
            object grDadosColumn8: TdxDBGridColumn
              Caption = 'Bairro'
              Color = clInfoBk
              Width = 103
              BandIndex = 0
              RowIndex = 0
              FieldName = 'DS_BAIRRO'
            end
            object grDadosColumn9: TdxDBGridColumn
              Caption = 'Cidade'
              Color = clInfoBk
              Width = 128
              BandIndex = 0
              RowIndex = 0
              FieldName = 'DS_CIDADE'
            end
          end
        end
      end
      inherited tabGeral: TTabSheet
        inherited Panel4: TPanel
          Width = 782
          Height = 465
          object Label1: TLabel
            Left = 8
            Top = 60
            Width = 33
            Height = 13
            Caption = 'C'#243'digo'
            FocusControl = DBEdit1
          end
          object Label2: TLabel
            Left = 97
            Top = 60
            Width = 28
            Height = 13
            Caption = 'Nome'
            FocusControl = DBEdit2
          end
          object Label3: TLabel
            Left = 442
            Top = 60
            Width = 21
            Height = 13
            Caption = 'Tipo'
            FocusControl = DBEdit3
          end
          object btImagem: TSpeedButton
            Left = 741
            Top = 13
            Width = 36
            Height = 33
            Hint = 'Carrega Imagem'
            Glyph.Data = {
              B60D0000424DB60D000000000000360000002800000030000000180000000100
              180000000000800D0000C40E0000C40E00000000000000000000FF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF983000983000FF
              00FF696969696969696969696969696969696969696969696969696969696969
              6969696969696969696969696969696969696969696969696969696969696969
              692D2D2D2D2D2D696969FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
              00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FF983000983000D79966983000FF00FF6969696969696969696969696969
              6969696969696969696969696969696969696969696969696969696969696969
              69696969696969696969692D2D2D2D2D2D9090902D2D2D696969FF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FF983000983000D99D6AD18750983000FF
              00FF696969696969696969696969696969696969696969696969696969696969
              6969696969696969696969696969696969696969696969692D2D2D2D2D2D9494
              947E7E7E2D2D2D696969FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
              00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF983000
              A65222DA9F6CE9A86D983000FF00FFFF00FF6969696969696969696969696969
              6969696969696969696969696969696969696969696969696969696969696969
              69696969692D2D2D4D4D4D9696969D9D9D2D2D2D696969696969FF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FF963403A4572CDAA373F2B376983000983000FF00FFFF
              00FF696969696969696969696969696969696969696969696969696969696969
              6969696969696969696969696969696969693030305252529A9A9AA7A7A72D2D
              2D2D2D2D696969696969FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
              00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF963100A25C33D9A475
              F4B677D17D3A9C3602FF00FFFF00FFFF00FF6969696969696969696969696969
              696969696969696969696969696969696969696969696969696969696969692D
              2D2D5757579B9B9BAAAAAA727272323232696969696969696969205E00205E00
              205E00205E00205E00205E00205E00205E00205E00205E00205E00205E00205E
              00265C009434009F613ADAA374F3B474DC8C43A7450A334C001A4D0019480017
              45003A3A3A3A3A3A3A3A3A3A3A3A3A3A3A3A3A3A3A3A3A3A3A3A3A3A3A3A3A3A
              3A3A3A3A3A3A3A3A3A3A3A3A2F2F2F5C5C5C9B9B9BA8A8A87F7F7F3E3E3E3232
              323030302D2D2D2B2B2B205E0033CB6733CB6733CB6733CB6733CB6733CB6733
              CB6733CB6745D075FFFFFFFFFFFFFFFFFF973809A0623DDAA475F1B172E39446
              BE5F15A86042C3C3C3B8B8B8B2B2B21743003A3A3A9B9B9B9B9B9B9B9B9B9B9B
              9B9B9B9B9B9B9B9B9B9B9B9B9BA4A4A4FFFFFFFFFFFFFFFFFF3434345E5E5E9C
              9C9CA5A5A58585855353535F5F5FC3C3C3B8B8B8B2B2B2292929205E0033CB67
              33CB6733CB6733CB6733CB6733CB6733CB6733CB6755D480FFFFFFFFFFFFA043
              18A0603ADBA676F0AF72E39546CD70179D3906B5B0ADAFAFAFAEAEAEB6B6B619
              4A003A3A3A9B9B9B9B9B9B9B9B9B9B9B9B9B9B9B9B9B9B9B9B9B9B9B9BACACAC
              FFFFFFFFFFFF4040405B5B5B9D9D9DA4A4A48686865F5F5F353535AFAFAFAFAF
              AFAEAEAEB6B6B62E2E2E205E002DC55A26BF4D30C86133CB6733CB6733CB6733
              CB6733CB678CE2A9FFFFFFE1C2B5A25024DDA473EFAF70E29345D07316A94300
              A79289A7A7A7AAAAAAB3B3B3C7C7C71C53003A3A3A9393938B8B8B9797979B9B
              9B9B9B9B9B9B9B9B9B9B9B9B9BC7C7C7FFFFFFC1C1C14C4C4C9B9B9BA3A3A384
              84846161613A3A3A919191A7A7A7AAAAAAB3B3B3C7C7C7333333205E00009900
              0099000099000DA61A2DC55A33CB6733CB673ECE6FE5F8ECFFFFFF9F4011D99B
              6AF0B071E29345D27518B44E019B502DA4A4A4A7A7A7B2B2B2C5C5C5DDDDDD1E
              59003A3A3A5959595959595959596A6A6A9393939B9B9B9B9B9BA1A1A1F2F2F2
              FFFFFF3C3C3C939393A4A4A48484846363634242424E4E4EA4A4A4A7A7A7B2B2
              B2C5C5C5DDDDDD373737205E00009900009900009900009900039C0630C86137
              CC6AB9EDCBFFFFFFE9D6CFBD6935EBA86AE39445D17215B44D00973A10A3A3A3
              A6A6A6B2B2B2C4C4C4DBDBDBEFEFEF1F5C003A3A3A5959595959595959595959
              595D5D5D9797979D9D9DDCDCDCFFFFFFD6D6D66363639D9D9D85858561616141
              4141383838A3A3A3A6A6A6B2B2B2C4C4C4DBDBDBEFEFEF393939205E00009900
              0099000099000099000099002DBA48E8F8EEFEFEFEFAFBFB89604BD08146E290
              41CE7016AB4601994721A5A5A5A9A9A9B4B4B4C7C7C7DCDCDCEEEEEEF9F9F920
              5E003A3A3A595959595959595959595959595959878787F3F3F3FEFEFEFAFAFA
              5E5E5E7878788181815F5F5F3C3C3C444444A5A5A5A9A9A9B4B4B4C7C7C7DCDC
              DCEEEEEEF9F9F93A3A3A205E00009900009900009900009900009900E5F5E8F3
              F6F88AB5CA63828F9C9E9CA57151A8591DA84102A37D6BAAAAAAAFAFAFBBBBBB
              CCCCCCE0E0E0F0F0F0FAFAFAFEFEFE205E003A3A3A5959595959595959595959
              59595959EFEFEFF6F6F6B6B6B68282829D9D9D6D6D6D5050503939397B7B7BAA
              AAAAAFAFAFBBBBBBCCCCCCE0E0E0F0F0F0FAFAFAFEFEFE3A3A3A205E00009900
              00990000990000990070C47E458EB4046A9E187EBB6A8EA2B6B5AE878988665E
              5BB1B1B1B3B3B3BBBBBBC6C6C6D5D5D5E7E7E7F3F3F3FBFBFBFEFEFEFFFFFF20
              5E003A3A3A595959595959595959595959A5A5A59191916D6D6D8484848F8F8F
              B3B3B38888885E5E5EB1B1B1B3B3B3BBBBBBC6C6C6D5D5D5E7E7E7F3F3F3FBFB
              FBFEFEFEFFFFFF3A3A3A205E00009900009900009900039C462788B00F76A94C
              B4F148ADFD5394D0687F96566A749A9B99BDBDBDCBCBCBD6D6D6E2E2E2EEEEEE
              F7F7F7FCFCFCFEFEFEFFFFFFFFFFFF205E003A3A3A5959595959595959597070
              70888888797979BABABAB9B9B99E9E9E8383836A6A6A9A9A9ABDBDBDCBCBCBD6
              D6D6E2E2E2EEEEEEF7F7F7FCFCFCFEFEFEFFFFFFFFFFFF3A3A3A205E00009900
              00990016A41826B174238ABD3EA6D959C1FE49AFFD399CFC2C7DC64381A2BDBD
              BED4D4D4E6E6E6F1F1F1F6F6F6FBFBFBFEFEFEFEFEFEFFFFFFFFFFFFFFFFFF20
              5E003A3A3A5959595959596969698E8E8E8D8D8DA9A9A9C7C7C7BABABAADADAD
              898989838383BDBDBDD4D4D4E6E6E6F1F1F1F6F6F6FBFBFBFEFEFEFEFEFEFFFF
              FFFFFFFFFFFFFF3A3A3A205E0000990040AB2DEFDDAAACC0A62991C44AB3E55A
              C2FE4AB0FD379BF60C70AFA5B2B8D3D3D3EAEAEAF8F8F8FBFBFBFEFEFEFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF205E003A3A3A595959797979CFCFCFB5B5
              B5949494B5B5B5C8C8C8BBBBBBAAAAAA777777B2B2B2D3D3D3EAEAEAF8F8F8FB
              FBFBFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF3A3A3A205E00BFD088
              FFE2B5FFE2B5BEC1AD238ABD3EA6D95BC3FE42A8F11472A48FA7B3CFCFCFE6E6
              E6F7F7F7FEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF20
              5E003A3A3AB8B8B8D7D7D7D7D7D7BABABA8D8D8DA9A9A9C8C8C8B2B2B2767676
              A7A7A7CFCFCFE6E6E6F7F7F7FEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFF3A3A3A205E00FFE2B5FFE2B5FFE2B5FDE0B43A88AA1178AC50
              B8F2288ECCA8B4BBD3D3D3E5E5E5F4F4F4FCFCFCFEFEFEFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF205E003A3A3AD7D7D7D7D7D7D7D7D7D6D6
              D68989897B7B7BBDBDBD949494B4B4B4D3D3D3E5E5E5F4F4F4FCFCFCFEFEFEFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF3A3A3A205E00FFE2B5
              FFE2B5FFE2B5FDE0B4E7D3AE508CA20C71A51076AE528798E7E7E7F5F5F5FCFC
              FCFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF20
              5E003A3A3AD7D7D7D7D7D7D7D7D7D6D6D6CACACA8B8B8B7575757B7B7B868686
              E7E7E7F5F5F5FCFCFCFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFF3A3A3A205E00FFE2B5FFE2B5FFE2B5FFE2B5FBDEB2F2D6ACE5
              CBA3DFC69EE8CEA5F4F4F4FCFCFCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF205E003A3A3AD7D7D7D7D7D7D7D7D7D7D7
              D7D4D4D4CCCCCCC2C2C2BCBCBCC4C4C4F4F4F4FCFCFCFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF3A3A3A205E00FFE2B5
              FFE2B5FFE2B5FFE2B5FEE1B4FBDEB2F7DBAFF4D8ADF7F7F7FBFBFBFEFEFEFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF20
              5E003A3A3AD7D7D7D7D7D7D7D7D7D7D7D7D6D6D6D4D4D4D1D1D1CECECEF7F7F7
              FBFBFBFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFF3A3A3A205E00205E00205E00205E00205E00205E00205E0020
              5E00205E00205E00205E00205E00205E00205E00205E00205E00205E00205E00
              205E00205E00205E00205E00205E00205E003A3A3A3A3A3A3A3A3A3A3A3A3A3A
              3A3A3A3A3A3A3A3A3A3A3A3A3A3A3A3A3A3A3A3A3A3A3A3A3A3A3A3A3A3A3A3A
              3A3A3A3A3A3A3A3A3A3A3A3A3A3A3A3A3A3A3A3A3A3A3A3A3A3A}
            NumGlyphs = 2
            ParentShowHint = False
            ShowHint = True
            OnClick = btImagemClick
          end
          object btClearImagem: TSpeedButton
            Left = 741
            Top = 51
            Width = 36
            Height = 32
            Hint = 'Limpa Imagem'
            Glyph.Data = {
              B60D0000424DB60D000000000000360000002800000030000000180000000100
              180000000000800D0000C40E0000C40E00000000000000000000C8D0D4C8D0D4
              C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0
              D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8
              D0D4D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0
              D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0
              D0D0D0D0D0D0D0D0D0D0C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8
              D0D4C8D0D4C8D0D42C91F02B90EE288DE8258BE3C8D0D4C8D0D4C8D0D4C8D0D4
              C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4D0D0D0D0D0D0D0D0D0D0D0D0D0D0
              D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0A1A1A1A0A0A09C9C9C999999D0D0D0D0
              D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0C8D0D4C8D0D4
              C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D42B90EA2C91F02A8FEC278C
              E6258AE12288DC1F85D7C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8
              D0D4D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D09F9F9F
              A1A1A19F9F9F9B9B9B989898959595919191D0D0D0D0D0D0D0D0D0D0D0D0D0D0
              D0D0D0D0D0D0D0D0D0D0C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8
              D0D4278DD53095E92B90EF298EEA268CE52489DF2187DA1E84D51C82D0197FCB
              167DC6C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4D0D0D0D0D0D0D0D0D0D0D0D0D0D0
              D0D0D0D0D0D0D0D0D0D0969696A2A2A2A0A0A09D9D9D9A9A9A97979794949490
              90908D8D8D8A8A8A878787D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0C8D0D4C8D0D4
              C8D0D4C8D0D4C8D0D4C8D0D4C8D0D42288D2349ADD47ACE954B9F251B6F551B6
              F5389DE82086D81D83D31B81CE187EC9167CC41379BF1077BA0E74B4C8D0D4C8
              D0D4D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0929292A2A2A2B2B2B2
              BEBEBEBDBDBDBDBDBDA7A7A79292928F8F8F8C8C8C8888888585858282827F7F
              7F7B7B7BD0D0D0D0D0D0C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D42D
              93D941A7E651B6F05CC1F760C4FA67CCFE68CDFF54B9F5379CE21E84CF177DC7
              157BC21278BD0F76B80D74B20A71AD086FA9D0D0D0D0D0D0D0D0D0D0D0D0D0D0
              D0D0D0D0D0D0D09C9C9CAEAEAEBBBBBBC5C5C5C8C8C8CFCFCFD0D0D0BFBFBFA5
              A5A58E8E8E8787878484848181817D7D7D7A7A7A777777747474C8D0D4C8D0D4
              C8D0D4C8D0D4C8D0D4C8D0D4268CD43BA1E24CB2ED58BEF555B9F344A4E65BBE
              F567CCFF63C7FE58BBF75EC2FF41A6E9187EC41178BB0E75B60C73B00970AB08
              6FA9D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0959595A8A8A8B8B8B8C2C2C2
              BEBEBEACACACC3C3C3CFCFCFCCCCCCC1C1C1C8C8C8AEAEAE8787878080807C7C
              7C797979757575747474C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4187E91046B1624
              8AD650B4FB48ABEC3B9BE32F87D168CDFF5EC2FA47AAEB54B7F55CC0FF58BCFE
              52B5F853B6FF49ACF62186C8086FAA086FA9D0D0D0D0D0D0D0D0D0D0D0D0D0D0
              D0787878454545959595BDBDBDB3B3B3A5A5A5939393D0D0D0C7C7C7B2B2B2BE
              BEBEC7C7C7C4C4C4BDBDBDC0C0C0B6B6B68E8E8E747474747474C8D0D4C8D0D4
              C8D0D4C8D0D4046B161F867F457FB1046B161666BC2D91E82884DE57BCFD5EC2
              FA3D9EE53C9AE05DC1FF58BCFD49ACEE52B6FD51B4FF51B4FF51B4FF399DE2C8
              D0D4D0D0D0D0D0D0D0D0D0D0D0D04545457878788787874545457676769F9F9F
              949494C3C3C3C7C7C7A8A8A8A4A4A4C8C8C8C4C4C4B4B4B4BFBFBFBFBFBFBFBF
              BFBFBFBFA6A6A6D0D0D0C8D0D4C8D0D4C8D0D40268021586202BA05A4CB2F03E
              9CE53B9AEC046B16046B162472C52F92E8227BCE51B3F54DAFF83B9DE549ABF1
              52B5FF51B4FF51B4FFC8D0D4C8D0D4C8D0D4D0D0D0D0D0D0D0D0D03D3D3D5A5A
              5A7D7D7DB8B8B8A7A7A7A7A7A7454545454545818181A0A0A0898989BBBBBBB9
              B9B9A7A7A7B4B4B4BFBFBFBFBFBFBFBFBFD0D0D0D0D0D0D0D0D0C8D0D4C8D0D4
              C8D0D413821C36B75256E68160F89137BC5B2D9B8040A2D03187D549A8F5046B
              16046B162877C02A87D13090DD4DAFF751B4FE51B4FFC8D0D4C8D0D4C8D0D4C8
              D0D4D0D0D0D0D0D0D0D0D05656568A8A8AB7B7B7C7C7C78F8F8F868686A4A4A4
              949494B4B4B44545454545458383839292929C9C9CB9B9B9BEBEBEBFBFBFD0D0
              D0D0D0D0D0D0D0D0D0D0C8D0D4C8D0D4107E1934B34E54E37F61F89253EB7D42
              DA632FC8471BB0280F942728958C4CACE63D97E348AAF73F9DEA046B1644A5F2
              C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4D0D0D0D0D0D0535353868686B4B4
              B4C8C8C8B8B8B8A5A5A58F8F8F767676646464858585B2B2B2A3A3A3B5B5B5A9
              A9A9454545B0B0B0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0C8D0D4C8D0D4
              31AF4A50DE7961F89254ED7F43DC6531C94A1EB72E0BA411019A01019A020591
              0A19994137AAAE7BBADD3393E2C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8
              D0D4D0D0D0D0D0D0828282AFAFAFC8C8C8BABABAA6A6A69191917C7C7C666666
              5A5A5A5B5B5B5858587070709E9E9EBDBDBD9F9F9FD0D0D0D0D0D0D0D0D0D0D0
              D0D0D0D0D0D0D0D0D0D0C8D0D4C8D0D42BA641198B2537BC5345DD6833CB4C20
              B9300DA613019A01019A02059E0B14AC272CC4592FC4601EA23DC8D0D4C8D0D4
              C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4D0D0D0D0D0D07979795F5F5F8D8D
              8DA8A8A89393937E7E7E6868685A5A5A5B5B5B60606072727292929295959574
              7474D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0C8D0D4C8D0D4
              C8D0D4C8D0D40066002EB94522BA330FA716019A02019901059E0912AA2425BD
              4B2BBD581EA23DC8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8
              D0D4D0D0D0D0D0D0D0D0D0D0D0D03B3B3B8686868080806A6A6A5B5B5B5A5A5A
              6060607070708989898E8E8E747474D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0
              D0D0D0D0D0D0D0D0D0D0C8D0D4C8D0D4C8D0D40066003ABD574BE3711EB72E02
              980300790001770206850C108F2105700AC8D0D4C8D0D4C8D0D4C8D0D4C8D0D4
              C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4D0D0D0D0D0D0D0D0D03B3B3B8F8F
              8FAFAFAF7C7C7C5A5A5A4747474646465252525F5F5F454545D0D0D0D0D0D0D0
              D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0C8D0D4C8D0D4
              0066002EAB464EE67524BC36039905007000C8D0D4C8D0D4C8D0D4C8D0D4C8D0
              D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8
              D0D4D0D0D0D0D0D03B3B3B7E7E7EB2B2B28282825B5B5B414141D0D0D0D0D0D0
              D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0
              D0D0D0D0D0D0D0D0D0D0C8D0D4006600249C3650E87927BF3A059A07007000C8
              D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4
              C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4D0D0D03B3B3B6F6F6FB5B5B58585
              855D5D5D414141D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0
              D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0C8D0D413821C
              52EA7C2AC23F069F09007000C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0
              D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8
              D0D4D0D0D0565656B7B7B7898989606060414141D0D0D0D0D0D0D0D0D0D0D0D0
              D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0
              D0D0D0D0D0D0D0D0D0D006700A4FE3762DC54307A00B007A01C8D0D4C8D0D4C8
              D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4
              C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4454545B1B1B18C8C8C6262624747
              47D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0
              D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D00A77102FC848
              09A20D007901C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0
              D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8
              D0D44B4B4B909090646464474747D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0
              D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0
              D0D0D0D0D0D0D0D0D0D01EA22D0A9710006C00C8D0D4C8D0D4C8D0D4C8D0D4C8
              D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4
              C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D46F6F6F5E5E5E3F3F3FD0D0D0D0D0
              D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0
              D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0C8D0D4C8D0D4
              C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0
              D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8
              D0D4D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0
              D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0
              D0D0D0D0D0D0D0D0D0D0C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8
              D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4
              C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4D0D0D0D0D0D0D0D0D0D0D0D0D0D0
              D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0
              D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0}
            NumGlyphs = 2
            ParentShowHint = False
            ShowHint = True
            OnClick = btClearImagemClick
          end
          object DBEdit1: TDBEdit
            Left = 8
            Top = 76
            Width = 89
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataField = 'CD_PESSOA'
            DataSource = dsGrid
            ReadOnly = True
            TabOrder = 0
          end
          object DBEdit2: TDBEdit
            Left = 97
            Top = 76
            Width = 345
            Height = 21
            DataField = 'NM_PESSOA'
            DataSource = dsGrid
            TabOrder = 1
          end
          object DBEdit3: TDBEdit
            Left = 442
            Top = 76
            Width = 30
            Height = 21
            DataField = 'TP_PESSOA'
            DataSource = dsGrid
            TabOrder = 2
          end
          object ckAtivo: TDBCheckBox
            Left = 9
            Top = 7
            Width = 49
            Height = 17
            Caption = 'Ativo'
            DataField = 'FL_ATIVO'
            DataSource = dsPessoa
            TabOrder = 3
            ValueChecked = 'S'
            ValueUnchecked = 'N'
          end
          object GroupBox1: TGroupBox
            Left = 8
            Top = 118
            Width = 465
            Height = 101
            Caption = 'Documentos'
            TabOrder = 4
            object tcDocumento: TTabControl
              Left = 2
              Top = 15
              Width = 461
              Height = 84
              Align = alClient
              TabOrder = 0
              Tabs.Strings = (
                'BI'
                'Contribuinte'
                'Passaporte')
              TabIndex = 0
              OnChange = tcDocumentoChange
              object Label4: TLabel
                Left = 6
                Top = 40
                Width = 37
                Height = 13
                Caption = 'Numero'
                FocusControl = DBEdit4
              end
              object Label5: TLabel
                Left = 224
                Top = 24
                Width = 21
                Height = 13
                Caption = 'Tipo'
                FocusControl = DBEdit5
                Visible = False
              end
              object Label6: TLabel
                Left = 294
                Top = 24
                Width = 33
                Height = 13
                Caption = 'C'#243'digo'
                FocusControl = DBEdit6
                Visible = False
              end
              object DBEdit4: TDBEdit
                Left = 6
                Top = 56
                Width = 211
                Height = 21
                DataField = 'NR_DOCUMENTO'
                DataSource = dsPessoaDoc
                TabOrder = 0
              end
              object DBCheckBox2: TDBCheckBox
                Left = 381
                Top = 31
                Width = 65
                Height = 17
                Alignment = taLeftJustify
                Caption = 'Principal'
                DataField = 'FL_PRINCIPAL'
                DataSource = dsPessoaDoc
                TabOrder = 1
                ValueChecked = 'S'
                ValueUnchecked = 'N'
              end
              object DBEdit5: TDBEdit
                Left = 225
                Top = 40
                Width = 69
                Height = 21
                DataField = 'TP_DOCUMENTO'
                DataSource = dsPessoaDoc
                TabOrder = 2
                Visible = False
              end
              object DBEdit6: TDBEdit
                Left = 294
                Top = 40
                Width = 69
                Height = 21
                DataField = 'CD_DOCUMENTO'
                DataSource = dsPessoaDoc
                TabOrder = 3
                Visible = False
              end
            end
          end
          object GroupBox2: TGroupBox
            Left = 8
            Top = 238
            Width = 465
            Height = 219
            Caption = 'Endere'#231'os'
            TabOrder = 5
            object tcEndereco: TTabControl
              Left = 2
              Top = 15
              Width = 461
              Height = 202
              Align = alClient
              TabOrder = 0
              Tabs.Strings = (
                'Residencial'
                'Comercial'
                'Entrega')
              TabIndex = 0
              OnChange = tcEnderecoChange
              object Label7: TLabel
                Left = 8
                Top = 74
                Width = 46
                Height = 13
                Caption = 'Endere'#231'o'
                FocusControl = DBEdit7
              end
              object Label8: TLabel
                Left = 8
                Top = 114
                Width = 27
                Height = 13
                Caption = 'Bairro'
                FocusControl = DBEdit8
              end
              object Label9: TLabel
                Left = 228
                Top = 114
                Width = 33
                Height = 13
                Caption = 'Cidade'
                FocusControl = DBEdit9
              end
              object Label10: TLabel
                Left = 224
                Top = 50
                Width = 21
                Height = 13
                Caption = 'Tipo'
                FocusControl = DBEdit10
                Visible = False
              end
              object Label11: TLabel
                Left = 294
                Top = 50
                Width = 33
                Height = 13
                Caption = 'C'#243'digo'
                FocusControl = DBEdit11
                Visible = False
              end
              object Label12: TLabel
                Left = 8
                Top = 154
                Width = 64
                Height = 13
                Caption = 'Complemento'
                FocusControl = DBEdit12
              end
              object DBEdit7: TDBEdit
                Left = 8
                Top = 90
                Width = 440
                Height = 21
                DataField = 'DS_ENDERECO'
                DataSource = dsPessoaEnd
                TabOrder = 0
              end
              object DBEdit8: TDBEdit
                Left = 8
                Top = 130
                Width = 220
                Height = 21
                DataField = 'DS_BAIRRO'
                DataSource = dsPessoaEnd
                TabOrder = 1
              end
              object DBEdit9: TDBEdit
                Left = 228
                Top = 130
                Width = 220
                Height = 21
                DataField = 'DS_CIDADE'
                DataSource = dsPessoaEnd
                TabOrder = 2
              end
              object DBEdit10: TDBEdit
                Left = 224
                Top = 66
                Width = 69
                Height = 21
                DataField = 'TP_ENDERECO'
                DataSource = dsPessoaEnd
                TabOrder = 3
                Visible = False
              end
              object DBEdit11: TDBEdit
                Left = 294
                Top = 66
                Width = 69
                Height = 21
                DataField = 'CD_ENDERECO'
                DataSource = dsPessoaEnd
                TabOrder = 4
                Visible = False
              end
              object DBEdit12: TDBEdit
                Left = 8
                Top = 170
                Width = 440
                Height = 21
                DataField = 'DS_COMPLEMENTO'
                DataSource = dsPessoaEnd
                TabOrder = 5
              end
              object DBCheckBox3: TDBCheckBox
                Left = 382
                Top = 57
                Width = 65
                Height = 17
                Alignment = taLeftJustify
                Caption = 'Principal'
                DataField = 'FL_PRINCIPAL'
                DataSource = dsPessoaEnd
                TabOrder = 6
                ValueChecked = 'S'
                ValueUnchecked = 'N'
              end
            end
          end
          object GroupBox3: TGroupBox
            Left = 479
            Top = 238
            Width = 296
            Height = 219
            Caption = 'Telefones'
            TabOrder = 6
            object DBGrid1: TDBGrid
              Left = 16
              Top = 44
              Width = 279
              Height = 166
              DataSource = dsPessoaTel
              TabOrder = 0
              TitleFont.Charset = DEFAULT_CHARSET
              TitleFont.Color = clWindowText
              TitleFont.Height = -11
              TitleFont.Name = 'MS Sans Serif'
              TitleFont.Style = []
              Columns = <
                item
                  Expanded = False
                  FieldName = 'TP_TELEFONE'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'NR_TELEFONE'
                  Visible = True
                end>
            end
            object DBCheckBox4: TDBCheckBox
              Left = 222
              Top = 23
              Width = 65
              Height = 17
              Alignment = taLeftJustify
              Caption = 'Principal'
              DataField = 'FL_PRINCIPAL'
              DataSource = dsPessoaTel
              TabOrder = 1
              ValueChecked = 'S'
              ValueUnchecked = 'N'
            end
          end
          object Panel5: TPanel
            Left = 477
            Top = 14
            Width = 262
            Height = 205
            BevelInner = bvLowered
            Color = clWhite
            TabOrder = 7
            object DBImage1: TDBImage
              Left = 2
              Top = 2
              Width = 258
              Height = 201
              Align = alClient
              DataField = 'BL_IMAGEM'
              DataSource = dsPessoa
              Stretch = True
              TabOrder = 0
            end
          end
          object ckEmpresa: TDBCheckBox
            Left = 9
            Top = 32
            Width = 128
            Height = 17
            Caption = 'Empresa Principal '
            DataField = 'FL_PRINCIPAL'
            DataSource = dsPessoa
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 8
            ValueChecked = 'S'
            ValueUnchecked = 'N'
            Visible = False
          end
        end
      end
    end
  end
  inherited dsControle: TDataSource
    DataSet = tbPessoa
    Left = 661
    Top = 413
  end
  inherited dsGrid: TDataSource
    DataSet = tbPessoa
    Left = 629
    Top = 413
  end
  object tbTelefones: TIBDataSet
    Database = DM.DB
    Transaction = DM.TS
    AfterDelete = tbTelefonesAfterDelete
    AfterInsert = tbTelefonesAfterInsert
    AfterPost = tbTelefonesAfterPost
    BeforeDelete = tbTelefonesBeforeDelete
    BufferChunks = 1000
    CachedUpdates = False
    DeleteSQL.Strings = (
      'delete from "TELEFONE"'
      'where'
      '  "CD_TELEFONE" = :"OLD_CD_TELEFONE"')
    InsertSQL.Strings = (
      'insert into "TELEFONE"'
      '('
      '  "CD_TELEFONE"'
      ', "CD_PESSOA"'
      ', "NR_TELEFONE"'
      ', "TP_TELEFONE"'
      ', "FL_PRINCIPAL"'
      ', "CD_EMPRESA"'
      ', "CD_EMPRESA_ORIGEM"'
      ', "CD_EDI"'
      ', "NM_USUARIO"'
      ', "DT_CADASTRO"'
      ', "TP_EDI"'
      ')'
      'values'
      '('
      '  :"CD_TELEFONE"'
      ', :"CD_PESSOA"'
      ', :"NR_TELEFONE"'
      ', :"TP_TELEFONE"'
      ', :"FL_PRINCIPAL"'
      ', :"CD_EMPRESA"'
      ', :"CD_EMPRESA_ORIGEM"'
      ', :"CD_EDI"'
      ', :"NM_USUARIO"'
      ', :"DT_CADASTRO"'
      ', :"TP_EDI"'
      ')')
    SelectSQL.Strings = (
      'select "TELEFONE"."CD_TELEFONE"'
      '      ,"TELEFONE"."CD_PESSOA"'
      '      ,"TELEFONE"."NR_TELEFONE"'
      '      ,"TELEFONE"."TP_TELEFONE"'
      '      ,"TELEFONE"."FL_PRINCIPAL"'
      '      ,"TELEFONE"."CD_EMPRESA"'
      '      ,"TELEFONE"."CD_EMPRESA_ORIGEM"'
      '      ,"TELEFONE"."CD_EDI"'
      '      ,"TELEFONE"."NM_USUARIO"'
      '      ,"TELEFONE"."DT_CADASTRO"'
      '      ,"TELEFONE"."TP_EDI"'
      'from "TELEFONE"'
      'where CD_PESSOA = :CD_PESSOA')
    ModifySQL.Strings = (
      'update "TELEFONE"'
      'set'
      ' "CD_TELEFONE" = :"CD_TELEFONE"'
      ', "CD_PESSOA" = :"CD_PESSOA"'
      ', "NR_TELEFONE" = :"NR_TELEFONE"'
      ', "TP_TELEFONE" = :"TP_TELEFONE"'
      ', "FL_PRINCIPAL" = :"FL_PRINCIPAL"'
      ', "CD_EMPRESA" = :"CD_EMPRESA"'
      ', "CD_EMPRESA_ORIGEM" = :"CD_EMPRESA_ORIGEM"'
      ', "CD_EDI" = :"CD_EDI"'
      ', "NM_USUARIO" = :"NM_USUARIO"'
      ', "DT_CADASTRO" = :"DT_CADASTRO"'
      ', "TP_EDI" = :"TP_EDI"'
      'where'
      '  "CD_TELEFONE" = :"OLD_CD_TELEFONE"')
    GeneratorField.Field = 'CD_TELEFONE'
    GeneratorField.Generator = 'GEN_TELEFONE'
    GeneratorField.ApplyEvent = gamOnPost
    DataSource = dsPessoa
    Left = 714
    Top = 460
    object tbTelefonesCD_PESSOA: TIntegerField
      FieldName = 'CD_PESSOA'
      Origin = 'TELEFONE.CD_PESSOA'
      Required = True
    end
    object tbTelefonesCD_TELEFONE: TIntegerField
      FieldName = 'CD_TELEFONE'
      Origin = 'TELEFONE.CD_TELEFONE'
      Required = True
    end
    object tbTelefonesNR_TELEFONE: TIBStringField
      DisplayLabel = 'N'#250'mero'
      FieldName = 'NR_TELEFONE'
      Origin = 'TELEFONE.NR_TELEFONE'
    end
    object tbTelefonesTP_TELEFONE: TIBStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TP_TELEFONE'
      Origin = 'TELEFONE.TP_TELEFONE'
    end
    object tbTelefonesFL_PRINCIPAL: TIBStringField
      DisplayLabel = 'Principal'
      FieldName = 'FL_PRINCIPAL'
      Origin = 'TELEFONE.FL_PRINCIPAL'
      Required = True
      FixedChar = True
      Size = 1
    end
    object tbTelefonesCD_EMPRESA: TIntegerField
      FieldName = 'CD_EMPRESA'
      Origin = 'TELEFONE.CD_EMPRESA'
    end
  end
  object tbEndereco: TIBDataSet
    Database = DM.DB
    Transaction = DM.TS
    AfterDelete = tbEnderecoAfterDelete
    AfterInsert = tbEnderecoAfterInsert
    AfterPost = tbEnderecoAfterPost
    BeforeDelete = tbEnderecoBeforeDelete
    BeforeOpen = tbEnderecoBeforeOpen
    BufferChunks = 1000
    CachedUpdates = False
    DeleteSQL.Strings = (
      'delete from "ENDERECO"'
      'where'
      '  "CD_ENDERECO" = :"OLD_CD_ENDERECO"')
    InsertSQL.Strings = (
      'insert into "ENDERECO"'
      '('
      '  "CD_ENDERECO"'
      ', "DS_ENDERECO"'
      ', "DS_BAIRRO"'
      ', "DS_CIDADE"'
      ', "DS_COMPLEMENTO"'
      ', "TP_ENDERECO"'
      ', "CD_PESSOA"'
      ', "FL_PRINCIPAL"'
      ', "CD_EMPRESA"'
      ', "CD_EMPRESA_ORIGEM"'
      ', "CD_EDI"'
      ', "NM_USUARIO"'
      ', "DT_CADASTRO"'
      ', "TP_EDI"'
      ')'
      'values'
      '('
      '  :"CD_ENDERECO"'
      ', :"DS_ENDERECO"'
      ', :"DS_BAIRRO"'
      ', :"DS_CIDADE"'
      ', :"DS_COMPLEMENTO"'
      ', :"TP_ENDERECO"'
      ', :"CD_PESSOA"'
      ', :"FL_PRINCIPAL"'
      ', :"CD_EMPRESA"'
      ', :"CD_EMPRESA_ORIGEM"'
      ', :"CD_EDI"'
      ', :"NM_USUARIO"'
      ', :"DT_CADASTRO"'
      ', :"TP_EDI"'
      ')')
    SelectSQL.Strings = (
      'select "ENDERECO"."CD_ENDERECO"'
      '      ,"ENDERECO"."DS_ENDERECO"'
      '      ,"ENDERECO"."DS_BAIRRO"'
      '      ,"ENDERECO"."DS_CIDADE"'
      '      ,"ENDERECO"."DS_COMPLEMENTO"'
      '      ,"ENDERECO"."TP_ENDERECO"'
      '      ,"ENDERECO"."CD_PESSOA"'
      '      ,"ENDERECO"."FL_PRINCIPAL"'
      '      ,"ENDERECO"."CD_EMPRESA"'
      '      ,"ENDERECO"."CD_EMPRESA_ORIGEM"'
      '      ,"ENDERECO"."CD_EDI"'
      '      ,"ENDERECO"."NM_USUARIO"'
      '      ,"ENDERECO"."DT_CADASTRO"'
      '      ,"ENDERECO"."TP_EDI"'
      'from "ENDERECO"'
      'where CD_PESSOA = :CD_PESSOA'
      'and TP_ENDERECO = :TP_ENDERECO')
    ModifySQL.Strings = (
      'update "ENDERECO"'
      'set'
      ' "CD_ENDERECO" = :"CD_ENDERECO"'
      ', "DS_ENDERECO" = :"DS_ENDERECO"'
      ', "DS_BAIRRO" = :"DS_BAIRRO"'
      ', "DS_CIDADE" = :"DS_CIDADE"'
      ', "DS_COMPLEMENTO" = :"DS_COMPLEMENTO"'
      ', "TP_ENDERECO" = :"TP_ENDERECO"'
      ', "CD_PESSOA" = :"CD_PESSOA"'
      ', "FL_PRINCIPAL" = :"FL_PRINCIPAL"'
      ', "CD_EMPRESA" = :"CD_EMPRESA"'
      ', "CD_EMPRESA_ORIGEM" = :"CD_EMPRESA_ORIGEM"'
      ', "CD_EDI" = :"CD_EDI"'
      ', "NM_USUARIO" = :"NM_USUARIO"'
      ', "DT_CADASTRO" = :"DT_CADASTRO"'
      ', "TP_EDI" = :"TP_EDI"'
      'where'
      '  "CD_ENDERECO" = :"OLD_CD_ENDERECO"')
    GeneratorField.Field = 'CD_ENDERECO'
    GeneratorField.Generator = 'GEN_ENDERECO'
    DataSource = dsPessoa
    Left = 649
    Top = 459
    object tbEnderecoCD_ENDERECO: TIntegerField
      FieldName = 'CD_ENDERECO'
      Origin = 'ENDERECO.CD_ENDERECO'
      Required = True
    end
    object tbEnderecoDS_ENDERECO: TIBStringField
      FieldName = 'DS_ENDERECO'
      Origin = 'ENDERECO.DS_ENDERECO'
      Size = 100
    end
    object tbEnderecoDS_BAIRRO: TIBStringField
      FieldName = 'DS_BAIRRO'
      Origin = 'ENDERECO.DS_BAIRRO'
      Size = 100
    end
    object tbEnderecoDS_CIDADE: TIBStringField
      FieldName = 'DS_CIDADE'
      Origin = 'ENDERECO.DS_CIDADE'
      Size = 100
    end
    object tbEnderecoDS_COMPLEMENTO: TIBStringField
      FieldName = 'DS_COMPLEMENTO'
      Origin = 'ENDERECO.DS_COMPLEMENTO'
      Size = 200
    end
    object tbEnderecoTP_ENDERECO: TIBStringField
      FieldName = 'TP_ENDERECO'
      Origin = 'ENDERECO.TP_ENDERECO'
    end
    object tbEnderecoCD_PESSOA: TIntegerField
      FieldName = 'CD_PESSOA'
      Origin = 'ENDERECO.CD_PESSOA'
      Required = True
    end
    object tbEnderecoFL_PRINCIPAL: TIBStringField
      FieldName = 'FL_PRINCIPAL'
      Origin = 'ENDERECO.FL_PRINCIPAL'
      Required = True
      FixedChar = True
      Size = 1
    end
    object tbEnderecoCD_EMPRESA: TIntegerField
      FieldName = 'CD_EMPRESA'
      Origin = 'ENDERECO.CD_EMPRESA'
    end
  end
  object tbDocumento: TIBDataSet
    Database = DM.DB
    Transaction = DM.TS
    AfterDelete = tbDocumentoAfterDelete
    AfterInsert = tbDocumentoAfterInsert
    AfterPost = tbDocumentoAfterPost
    BeforeDelete = tbDocumentoBeforeDelete
    BeforeOpen = tbDocumentoBeforeOpen
    BufferChunks = 1000
    CachedUpdates = False
    DeleteSQL.Strings = (
      'delete from "DOCUMENTO"'
      'where'
      '  "CD_DOCUMENTO" = :"OLD_CD_DOCUMENTO"')
    InsertSQL.Strings = (
      'insert into "DOCUMENTO"'
      '('
      '  "CD_DOCUMENTO"'
      ', "TP_DOCUMENTO"'
      ', "NR_DOCUMENTO"'
      ', "CD_PESSOA"'
      ', "FL_PRINCIPAL"'
      ', "CD_EMPRESA"'
      ', "CD_EMPRESA_ORIGEM"'
      ', "CD_EDI"'
      ', "NM_USUARIO"'
      ', "DT_CADASTRO"'
      ', "TP_EDI"'
      ')'
      'values'
      '('
      '  :"CD_DOCUMENTO"'
      ', :"TP_DOCUMENTO"'
      ', :"NR_DOCUMENTO"'
      ', :"CD_PESSOA"'
      ', :"FL_PRINCIPAL"'
      ', :"CD_EMPRESA"'
      ', :"CD_EMPRESA_ORIGEM"'
      ', :"CD_EDI"'
      ', :"NM_USUARIO"'
      ', :"DT_CADASTRO"'
      ', :"TP_EDI"'
      ')')
    SelectSQL.Strings = (
      'select "DOCUMENTO"."CD_DOCUMENTO"'
      '      ,"DOCUMENTO"."TP_DOCUMENTO"'
      '      ,"DOCUMENTO"."NR_DOCUMENTO"'
      '      ,"DOCUMENTO"."CD_PESSOA"'
      '      ,"DOCUMENTO"."FL_PRINCIPAL"'
      '      ,"DOCUMENTO"."CD_EMPRESA"'
      '      ,"DOCUMENTO"."CD_EMPRESA_ORIGEM"'
      '      ,"DOCUMENTO"."CD_EDI"'
      '      ,"DOCUMENTO"."NM_USUARIO"'
      '      ,"DOCUMENTO"."DT_CADASTRO"'
      '      ,"DOCUMENTO"."TP_EDI"'
      'from "DOCUMENTO"'
      'where CD_PESSOA = :CD_PESSOA'
      'and TP_DOCUMENTO = :TP_DOC')
    ModifySQL.Strings = (
      'update "DOCUMENTO"'
      'set'
      ' "CD_DOCUMENTO" = :"CD_DOCUMENTO"'
      ', "TP_DOCUMENTO" = :"TP_DOCUMENTO"'
      ', "NR_DOCUMENTO" = :"NR_DOCUMENTO"'
      ', "CD_PESSOA" = :"CD_PESSOA"'
      ', "FL_PRINCIPAL" = :"FL_PRINCIPAL"'
      ', "CD_EMPRESA" = :"CD_EMPRESA"'
      ', "CD_EMPRESA_ORIGEM" = :"CD_EMPRESA_ORIGEM"'
      ', "CD_EDI" = :"CD_EDI"'
      ', "NM_USUARIO" = :"NM_USUARIO"'
      ', "DT_CADASTRO" = :"DT_CADASTRO"'
      ', "TP_EDI" = :"TP_EDI"'
      'where'
      '  "CD_DOCUMENTO" = :"OLD_CD_DOCUMENTO"'
      '')
    GeneratorField.Field = 'CD_DOCUMENTO'
    GeneratorField.Generator = 'GEN_DOCUMENTO'
    DataSource = dsPessoa
    Left = 681
    Top = 460
    object tbDocumentoCD_DOCUMENTO: TIntegerField
      FieldName = 'CD_DOCUMENTO'
      Origin = 'DOCUMENTO.CD_DOCUMENTO'
      Required = True
    end
    object tbDocumentoTP_DOCUMENTO: TIBStringField
      FieldName = 'TP_DOCUMENTO'
      Origin = 'DOCUMENTO.TP_DOCUMENTO'
    end
    object tbDocumentoNR_DOCUMENTO: TIBStringField
      FieldName = 'NR_DOCUMENTO'
      Origin = 'DOCUMENTO.NR_DOCUMENTO'
    end
    object tbDocumentoCD_PESSOA: TIntegerField
      FieldName = 'CD_PESSOA'
      Origin = 'DOCUMENTO.CD_PESSOA'
      Required = True
    end
    object tbDocumentoFL_PRINCIPAL: TIBStringField
      FieldName = 'FL_PRINCIPAL'
      Origin = 'DOCUMENTO.FL_PRINCIPAL'
      Required = True
      FixedChar = True
      Size = 1
    end
    object tbDocumentoCD_EMPRESA: TIntegerField
      FieldName = 'CD_EMPRESA'
      Origin = 'DOCUMENTO.CD_EMPRESA'
    end
  end
  object tbPessoa: TIBDataSet
    Database = DM.DB
    Transaction = DM.TS
    AfterClose = tbPessoaAfterClose
    AfterDelete = tbPessoaAfterDelete
    AfterInsert = tbPessoaAfterInsert
    AfterOpen = tbPessoaAfterOpen
    AfterPost = tbPessoaAfterPost
    BeforeDelete = tbPessoaBeforeDelete
    BeforeOpen = tbPessoaBeforeOpen
    BeforePost = tbPessoaBeforePost
    BufferChunks = 1000
    CachedUpdates = False
    DeleteSQL.Strings = (
      'delete from "PESSOA"'
      'where'
      '  "CD_PESSOA" = :"OLD_CD_PESSOA"')
    InsertSQL.Strings = (
      'insert into "PESSOA"'
      '('
      '  "CD_PESSOA"'
      ', "NM_PESSOA"'
      ', "TP_PESSOA"'
      ', "BL_IMAGEM"'
      ', "FL_ATIVO"'
      ', "FL_PRINCIPAL"'
      ', "FL_PADRAO"'
      ', "CD_EMPRESA"'
      ')'
      'values'
      '('
      '  :"CD_PESSOA"'
      ', :"NM_PESSOA"'
      ', :"TP_PESSOA"'
      ', :"BL_IMAGEM"'
      ', :"FL_ATIVO"'
      ', :"FL_PRINCIPAL"'
      ', :"FL_PADRAO"'
      ', :"CD_EMPRESA"'
      ')')
    SelectSQL.Strings = (
      'select P.CD_PESSOA, P.NM_PESSOA, P.TP_PESSOA,'
      
        'NR_DOCUMENTO, TP_DOCUMENTO, NR_TELEFONE, TP_TELEFONE,FL_ATIVO,BL' +
        '_IMAGEM,P.FL_PRINCIPAL,'
      'P.FL_PADRAO,P.CD_EMPRESA,E.DS_ENDERECO,E.DS_BAIRRO,'
      'E.DS_CIDADE'
      'from PESSOA P'
      'left outer join DOCUMENTO D'
      'on(P.CD_PESSOA = D.CD_PESSOA'
      'and D.FL_PRINCIPAL = '#39'S'#39')'
      'left outer join ENDERECO E'
      'on(P.CD_PESSOA = E.CD_PESSOA'
      'and E.FL_PRINCIPAL = '#39'S'#39')'
      'left outer join TELEFONE T'
      'on(P.CD_PESSOA = T.CD_PESSOA'
      'and T.FL_PRINCIPAL = '#39'S'#39')'
      'where P.TP_PESSOA  = :TP_PESSOA')
    ModifySQL.Strings = (
      'update "PESSOA"'
      'set'
      ' "CD_PESSOA" = :"CD_PESSOA"'
      ', "NM_PESSOA" = :"NM_PESSOA"'
      ', "TP_PESSOA" = :"TP_PESSOA"'
      ', "BL_IMAGEM" = :"BL_IMAGEM"'
      ', "FL_ATIVO" = :"FL_ATIVO"'
      ', "FL_PRINCIPAL" = :"FL_PRINCIPAL"'
      ', "FL_PADRAO" = :"FL_PADRAO"'
      ', "CD_EMPRESA" = :"CD_EMPRESA"'
      'where'
      '  "CD_PESSOA" = :"OLD_CD_PESSOA"')
    GeneratorField.Field = 'CD_PESSOA'
    GeneratorField.Generator = 'GEN_PESSOA'
    Left = 618
    Top = 459
    object tbPessoaCD_PESSOA: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'CD_PESSOA'
      Origin = 'PESSOA.CD_PESSOA'
      Required = True
    end
    object tbPessoaNM_PESSOA: TIBStringField
      DisplayLabel = 'Pessoa'
      FieldName = 'NM_PESSOA'
      Origin = 'PESSOA.NM_PESSOA'
      Size = 100
    end
    object tbPessoaTP_PESSOA: TIBStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TP_PESSOA'
      Origin = 'PESSOA.TP_PESSOA'
      FixedChar = True
      Size = 2
    end
    object tbPessoaNR_DOCUMENTO: TIBStringField
      DisplayLabel = 'Nr.Documento'
      FieldName = 'NR_DOCUMENTO'
      Origin = 'DOCUMENTO.NR_DOCUMENTO'
    end
    object tbPessoaTP_DOCUMENTO: TIBStringField
      DisplayLabel = 'Tp. Doc.'
      FieldName = 'TP_DOCUMENTO'
      Origin = 'DOCUMENTO.TP_DOCUMENTO'
    end
    object tbPessoaNR_TELEFONE: TIBStringField
      DisplayLabel = 'Telefone'
      FieldName = 'NR_TELEFONE'
      Origin = 'TELEFONE.NR_TELEFONE'
    end
    object tbPessoaTP_TELEFONE: TIBStringField
      DisplayLabel = 'Tp. Tel.'
      FieldName = 'TP_TELEFONE'
      Origin = 'TELEFONE.TP_TELEFONE'
    end
    object tbPessoaFL_ATIVO: TIBStringField
      FieldName = 'FL_ATIVO'
      Origin = 'PESSOA.FL_ATIVO'
      FixedChar = True
      Size = 1
    end
    object tbPessoaBL_IMAGEM: TBlobField
      FieldName = 'BL_IMAGEM'
      Origin = 'PESSOA.BL_IMAGEM'
      Size = 8
    end
    object tbPessoaFL_PRINCIPAL: TIBStringField
      FieldName = 'FL_PRINCIPAL'
      Origin = 'PESSOA.FL_PRINCIPAL'
      FixedChar = True
      Size = 1
    end
    object tbPessoaFL_PADRAO: TIBStringField
      FieldName = 'FL_PADRAO'
      Origin = 'PESSOA.FL_PADRAO'
      FixedChar = True
      Size = 1
    end
    object tbPessoaCD_EMPRESA: TIntegerField
      FieldName = 'CD_EMPRESA'
      Origin = 'PESSOA.CD_EMPRESA'
    end
    object tbPessoaDS_ENDERECO: TIBStringField
      FieldName = 'DS_ENDERECO'
      Origin = 'ENDERECO.DS_ENDERECO'
      Size = 100
    end
    object tbPessoaDS_BAIRRO: TIBStringField
      FieldName = 'DS_BAIRRO'
      Origin = 'ENDERECO.DS_BAIRRO'
      Size = 100
    end
    object tbPessoaDS_CIDADE: TIBStringField
      FieldName = 'DS_CIDADE'
      Origin = 'ENDERECO.DS_CIDADE'
      Size = 100
    end
  end
  object dsPessoa: TDataSource
    AutoEdit = False
    DataSet = tbPessoa
    OnStateChange = dsPessoaStateChange
    Left = 616
    Top = 492
  end
  object dsPessoaEnd: TDataSource
    AutoEdit = False
    DataSet = tbEndereco
    Left = 648
    Top = 493
  end
  object dsPessoaTel: TDataSource
    AutoEdit = False
    DataSet = tbTelefones
    Left = 712
    Top = 492
  end
  object dsPessoaDoc: TDataSource
    AutoEdit = False
    DataSet = tbDocumento
    Left = 680
    Top = 492
  end
  object OpenPictureDialog1: TOpenPictureDialog
    Filter = 'Bitmaps (*.bmp)|*.bmp'
    Left = 582
    Top = 489
  end
  object RvPrjCliente: TRvProject
    Engine = RvSysCliente
    ProjectFile = 'RelCliente.rav'
    OnCreate = RvPrjClienteCreate
    Left = 528
    Top = 246
  end
  object RvSysCliente: TRvSystem
    TitleSetup = 'Output Options'
    TitleStatus = 'Report Status'
    TitlePreview = 'Report Preview'
    SystemFiler.StatusFormat = 'Generating page %p'
    SystemPreview.ZoomFactor = 100.000000000000000000
    SystemPrinter.ScaleX = 100.000000000000000000
    SystemPrinter.ScaleY = 100.000000000000000000
    SystemPrinter.StatusFormat = 'Printing page %p'
    SystemPrinter.Title = 'ReportPrinter Report'
    SystemPrinter.UnitsFactor = 1.000000000000000000
    Left = 528
    Top = 214
  end
  object RvDtCnCliente: TRvDataSetConnection
    RuntimeVisibility = rtDeveloper
    DataSet = tbPessoa
    Left = 528
    Top = 182
  end
  object RvDtCnPessoaConfRel: TRvDataSetConnection
    RuntimeVisibility = rtDeveloper
    DataSet = DMRelatorios.qyConfRelatorio
    Left = 496
    Top = 182
  end
  object RvDtCnFornecedor: TRvDataSetConnection
    RuntimeVisibility = rtDeveloper
    DataSet = tbPessoa
    Left = 560
    Top = 182
  end
  object RvSysFornecedor: TRvSystem
    TitleSetup = 'Output Options'
    TitleStatus = 'Report Status'
    TitlePreview = 'Report Preview'
    SystemFiler.StatusFormat = 'Generating page %p'
    SystemPreview.ZoomFactor = 100.000000000000000000
    SystemPrinter.ScaleX = 100.000000000000000000
    SystemPrinter.ScaleY = 100.000000000000000000
    SystemPrinter.StatusFormat = 'Printing page %p'
    SystemPrinter.Title = 'ReportPrinter Report'
    SystemPrinter.UnitsFactor = 1.000000000000000000
    Left = 560
    Top = 214
  end
  object RvPrjFornecedor: TRvProject
    Engine = RvSysFornecedor
    ProjectFile = 'C:\Compware\Layout\RelFornecedor.rav'
    OnCreate = RvPrjFornecedorCreate
    Left = 560
    Top = 246
  end
  object RvDtCnTransportadora: TRvDataSetConnection
    RuntimeVisibility = rtDeveloper
    DataSet = tbPessoa
    Left = 592
    Top = 182
  end
  object RvSysTransportadora: TRvSystem
    TitleSetup = 'Output Options'
    TitleStatus = 'Report Status'
    TitlePreview = 'Report Preview'
    SystemFiler.StatusFormat = 'Generating page %p'
    SystemPreview.ZoomFactor = 100.000000000000000000
    SystemPrinter.ScaleX = 100.000000000000000000
    SystemPrinter.ScaleY = 100.000000000000000000
    SystemPrinter.StatusFormat = 'Printing page %p'
    SystemPrinter.Title = 'ReportPrinter Report'
    SystemPrinter.UnitsFactor = 1.000000000000000000
    Left = 592
    Top = 214
  end
  object RvPrjTransportadora: TRvProject
    Engine = RvSysTransportadora
    ProjectFile = 'RelTransportadora.rav'
    OnCreate = RvPrjTransportadoraCreate
    Left = 592
    Top = 246
  end
  object RvDtCnFuncionario: TRvDataSetConnection
    RuntimeVisibility = rtDeveloper
    DataSet = tbPessoa
    Left = 624
    Top = 182
  end
  object RvSysFuncionario: TRvSystem
    TitleSetup = 'Output Options'
    TitleStatus = 'Report Status'
    TitlePreview = 'Report Preview'
    SystemFiler.StatusFormat = 'Generating page %p'
    SystemPreview.ZoomFactor = 100.000000000000000000
    SystemPrinter.ScaleX = 100.000000000000000000
    SystemPrinter.ScaleY = 100.000000000000000000
    SystemPrinter.StatusFormat = 'Printing page %p'
    SystemPrinter.Title = 'ReportPrinter Report'
    SystemPrinter.UnitsFactor = 1.000000000000000000
    Left = 624
    Top = 214
  end
  object RvPrjFuncionario: TRvProject
    Engine = RvSysFuncionario
    ProjectFile = 'RelFuncionario.rav'
    OnCreate = RvPrjFuncionarioCreate
    Left = 624
    Top = 246
  end
  object RvDtCnEmpresa: TRvDataSetConnection
    RuntimeVisibility = rtDeveloper
    DataSet = tbPessoa
    Left = 656
    Top = 182
  end
  object RvSysEmpresa: TRvSystem
    TitleSetup = 'Output Options'
    TitleStatus = 'Report Status'
    TitlePreview = 'Report Preview'
    SystemFiler.StatusFormat = 'Generating page %p'
    SystemPreview.ZoomFactor = 100.000000000000000000
    SystemPrinter.ScaleX = 100.000000000000000000
    SystemPrinter.ScaleY = 100.000000000000000000
    SystemPrinter.StatusFormat = 'Printing page %p'
    SystemPrinter.Title = 'ReportPrinter Report'
    SystemPrinter.UnitsFactor = 1.000000000000000000
    Left = 656
    Top = 214
  end
  object RvPrjEmpresa: TRvProject
    Engine = RvSysEmpresa
    ProjectFile = 'RelEmpresa.rav'
    OnCreate = RvPrjEmpresaCreate
    Left = 656
    Top = 246
  end
end
