object frmGerarNovoProcesso: TfrmGerarNovoProcesso
  Left = 627
  Top = 186
  Width = 592
  Height = 336
  BorderIcons = []
  Caption = 'Abertura de Processo'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 584
    Height = 233
    Align = alClient
    TabOrder = 0
    object Label1: TLabel
      Left = 28
      Top = 28
      Width = 80
      Height = 13
      Caption = 'Data Notifica'#231#227'o'
    end
    object Label2: TLabel
      Left = 151
      Top = 27
      Width = 71
      Height = 13
      Caption = 'Nr. Notifica'#231#227'o'
    end
    object Label3: TLabel
      Left = 28
      Top = 75
      Width = 42
      Height = 13
      Caption = 'Paciente'
    end
    object Label4: TLabel
      Left = 28
      Top = 115
      Width = 82
      Height = 13
      Caption = 'Data Nascimento'
    end
    object Label5: TLabel
      Left = 151
      Top = 115
      Width = 27
      Height = 13
      Caption = 'Idade'
    end
    object Label6: TLabel
      Left = 198
      Top = 115
      Width = 21
      Height = 13
      Caption = 'M'#227'e'
    end
    object Label7: TLabel
      Left = 28
      Top = 163
      Width = 61
      Height = 13
      Caption = 'Nr. Processo'
    end
    object DBEdit1: TDBEdit
      Left = 151
      Top = 43
      Width = 121
      Height = 21
      TabStop = False
      Color = clInfoBk
      DataField = 'NR_NOTIFICACAO'
      DataSource = dsNotificacao
      ReadOnly = True
      TabOrder = 0
    end
    object DBEdit2: TDBEdit
      Left = 28
      Top = 43
      Width = 121
      Height = 21
      TabStop = False
      Color = clInfoBk
      DataField = 'DT_NOTIFICACAO'
      DataSource = dsNotificacao
      ReadOnly = True
      TabOrder = 1
    end
    object DBEdit3: TDBEdit
      Left = 28
      Top = 91
      Width = 525
      Height = 21
      TabStop = False
      Color = clInfoBk
      DataField = 'NM_PACIENTE'
      DataSource = dsPaciente
      ReadOnly = True
      TabOrder = 2
    end
    object DBEdit4: TDBEdit
      Left = 28
      Top = 130
      Width = 121
      Height = 21
      TabStop = False
      Color = clInfoBk
      DataField = 'DT_NASCIMENTO'
      DataSource = dsPaciente
      ReadOnly = True
      TabOrder = 3
    end
    object DBEdit5: TDBEdit
      Left = 151
      Top = 130
      Width = 45
      Height = 21
      TabStop = False
      Color = clInfoBk
      DataField = 'IDADE'
      DataSource = dsPaciente
      ReadOnly = True
      TabOrder = 4
    end
    object DBEdit6: TDBEdit
      Left = 198
      Top = 130
      Width = 355
      Height = 21
      TabStop = False
      Color = clInfoBk
      DataField = 'NM_MAE'
      DataSource = dsPaciente
      ReadOnly = True
      TabOrder = 5
    end
    object DBEdit7: TDBEdit
      Left = 28
      Top = 178
      Width = 121
      Height = 21
      TabStop = False
      Color = clInfoBk
      DataField = 'NR_PROCESSO'
      DataSource = dsPaciente
      ReadOnly = True
      TabOrder = 6
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 233
    Width = 584
    Height = 50
    Align = alBottom
    TabOrder = 1
    object btNotificacao: TSpeedButton
      Left = 4
      Top = 5
      Width = 147
      Height = 41
      Caption = 'Localizar Notifica'#231#227'o'
      Glyph.Data = {
        360C0000424D360C000000000000360000002800000020000000200000000100
        180000000000000C000000000000000000000000000000000000FFFFFFDBDBDB
        9494947070706060606868687070707070707070707070707070707070707070
        7070707070707070707070707070707070707070707070707070707070707070
        7070707070707070949494DBDBDBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8D684A
        8D684A8D684A8D684A8D684A8D684A8D684A8D684A8D684A8D684A8D684A8D68
        4A8D684A8D684A8D684A8D684A8D684A8D684A8D684A8D684A8D684A8C684A8C
        684A8C684A8D684A707070C1C1C2A7ABAE81888FB2B4B5E3E3E3FFFFFF8F684B
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFF8F694C6C6D6D6D8EA4346E9B0616374E5763B4B6B7FFFFFF916A4D
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFF8B674B4964781672B4219AD34E9EB21636597D7F83FFFFFF926B4F
        FFFFFFFFFEFEFFFEFEFFFEFEFFFEFEFFFEFEFFFEFEFFFEFEFFFEFEFFFEFEFFFE
        FEFFFEFEFFFEFEFFFEFEFFFEFEFFFEFEFFFEFEFFFEFEFFFEFEFFFEFEFFFEFEFF
        FEFEF7F7F85A6063146EAF2FADE177EDFF49D1FF85C8EBC2C5C5FFFFFF946D51
        FFFFFFFEFDFCFEFDFCFEFDFCFEFDFCFEFDFCFEFDFCFEFDFCFEFDFCFEFDFCFEFD
        FCFEFDFCFEFDFCFEFDFCFEFDFCFEFDFCFEFDFCFEFDFCFEFDFCFEFDFCFEFDFCF8
        F7F694A9B9106AAC38B5E482F6FF59D8FC87D4F9C2C8CAFFFFFFFFFFFF957053
        FFFFFFFDFCFBFDFCFBFDFCFBFDFCFBFDFCFBFDFCFBFDFCFBFDFCFBFDFCFBFDFC
        FBFDFCFBFDFCFBFDFCFBFDFCFBFDFCFBFDFCFBFDFCFBFDFCFBFDFCFBFBFAF996
        AAB9156DAC34AFE183F8FF66E2FF97E0FFC1C6C7FFFFFFFFFFFFFFFFFF977155
        FFFFFFFDFBF9FDFAF9FDFAF9FDFAF9FDFBF9FDFAF9FDFAF9FDFBF9FDFAF9FDFA
        F9FDFAF9FDFAF9FDFAF9FDFAF9FDFAF9FDFAF9FDFAF9FDFAF9FCF9F899A9B61A
        659F27A3DC7FF4FF5DDCF98ED8FBC1C5C6FFFFFFFFFFFFFFFFFFFFFFFF9A7457
        FFFFFFFCF9F7FCF9F7FCF9F7FCF9F7FCF9F7FCF9F7FCF9F7FCF9F7FCF9F7FCF9
        F7FCF9F7FCF9F7FCF9F7FCF9F7FCF9F7FCF9F7FCF9F7FBF8F69EACB51C669E1B
        8ECC75E9FD55D5F77BD2F89FA5A7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9B765A
        FFFFFFFBF7F5FBF7F5FBF7F5FBF7F5FBF7F5FBF7F5FBF7F5FBF7F5FBF7F5FBF7
        F5FBF8F5FBF7F5FBF7F5FBF7F5FBF7F5FBF7F5FBF7F5A6AFB61D659D1589C953
        D5F44AC9F27CD2F96D797CCFCFCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9E795C
        FFFFFFFAF6F3FAF6F3FAF6F3FAF6F3FAF6F3FAF6F3FAF6F3FAF6F3FAF6F3EFEB
        E9DEDAD7D6D2D0D5D1CFDCD8D5E9E6E3F1EDEAABAFB31F649B198AC851D4F626
        A7DF5FB8E9867D70707070CFCFCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA07A5E
        FFFFFFF9F4F0F9F4F0F9F4F0F9F4F0F9F4F0F9F4F0F9F4F0F2EDE9BCBABA8587
        8C6166714F5665585E696E7179999899A7A8A92D6C9C188AC953D6F81793CF3F
        A7E2AABBC3A07A5E707070CFCFCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA27C60
        FFFFFFF8F2EEF8F2EEF8F2EEF8F2EEF8F3EEF8F2EEDAD6D47D8A953671962683
        AF2E98C438A2CB3899C03080A72E56772C52782573A853D7FA1893D03095D5A6
        B2B7FFFFFFA37D61707070CFCFCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA57F63
        FFFFFFF7F0EBF7F1EBF7F0EBF7F0EBF7F0ECD4D1CF5783A01D86B939A4CE7DC3
        DCC1E7EFD0EEF39FDAE86BCBE44FBCDC3082AB1C4D7D277BAF36A1DFA2B0B5F7
        F0EBFFFFFFA57F63707070CFCFCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA78166
        FFFFFFF6EEE9F6EEE9F6EEE9F6EEE9E9E2DE5F8FAD1B8CC07EBBD4EBF0F1F8F5
        F4FCF8F6FCFAF8FAF8F6F7F6F5B9E2EC66CDE5368FB4266BA17993A0EBE4DFF6
        EEE9FFFFFFA88266707070CFCFCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFAA8468
        FFFFFFF5EDE7F5EDE6F5EDE6F5EDE69AA8AF198BC38CBED4FAF6F4FCF9F7FBF9
        F6FBF8F5FAF6F3F9F5F2F8F5F2FCF8F4CCE8EE65CDE73282AA546071CBC4BFF1
        E9E3FFFFFFAA8468707070CFCFCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFAC866A
        FFFFFFF4EAE3F4EAE3F4EAE3DCDFDF4390B96DB3D3F7F5F3FCF9F7FBF7F4FAF5
        F1F8F2EEF4EEEAF4EFECF4F0ECF0EDEAFCF6F3C0E9F251BCDB325B7D9E9A99E7
        DDD7FFFFFFAC876B707070CFCFCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFAE896D
        FFFFFFF3E8E1F3E8E1F3E8E1ACC8D42287B9C1D9E5FCFAF8FBF7F5F9F4F1F8F1
        EDF3EBE6EFE7E2F1E9E4F2EBE7EAE5E2F0EBE9F6F8F76ED0EA327FA57A787CDC
        D2CCFFFFFFAE896D707070CFCFCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB08B6F
        FFFFFFF2E7DEF2E7DEF2E7DE9CC0CF4AA0CBE4EAECFCF9F6FAF6F2F8F2EDF6EE
        E8EDE5DDE9DFD8ECE3DBEEE6E0E7E1DDE8E4E1F9F6F4A9E8F53895BD64656DD6
        CCC4FFFFFFB18B70707070CFCFCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB28E72
        FFFFFFF1E5DCF1E5DCF1E5DC7EB1C96FB9DBFDFBF6FBF8F6F9F4F1F7F0EBF5EC
        E5E8DED7E4D9D0E7DDD5E9E1DBE1DBD7E2DEDBFBF7F4D7FAFA389DC761636BD7
        CCC4FFFFFFB38E72707070CFCFCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB69074
        FFFFFFF0E3D9F0E3D9F0E3D99BBDCC55A8D1ECECECFBF8F5F9F4F1F7F0EBF5EC
        E5E5DCD4E0D5CEE3D9D3E2DAD4DCD6D2E3DEDBFAF5F2BAE8F33296C1737378DD
        D1C8FFFFFFB59074707070CFCFCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB89376
        FFFFFFEFE2D7EFE1D7EFE1D7B3C7CE2C8DC1C6D9E3FCF9F7FAF5F2F8F1EDF6ED
        E8E8DFD9DAD2CCDAD2CCD8D1CCDBD6D2EBE6E3F3F2F26ABEDC3287B0948F8FE1
        D2C8FFFFFFB79277707070CFCFCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBA957A
        FFFFFFEEDFD4EEDFD4EEDFD5D7D5D14497C47DB2D3F4F1F0FBF7F4F9F4F0F7F0
        EBF0E9E3DBD5CFD7D1CDDBD6D2E0DCD9F4EFEBD0DFE635A6D2487B99BEB3ACE2
        D0C3FFFFFFBA9579707070CFCFCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBC967B
        FFFFFFEDDED2EDDED2EDDED2EDDED2A0C2D02286BEA4C2D7F5F0EDFBF6F1F9F4
        F0F8F2EEECE7E2E2DDDAE5E1DDEDE7E2DEDFE153A8CD2A8FBE818486DAC9BBE2
        D0C2FFFFFFBB977C707070CFCFCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBE987E
        FFFFFFECDCD0ECDCD0ECDCD0ECDCD0DED8D068A8C82687BE8EB5CFDCDEE2F4EE
        EBFBF7F0FBF7F1F6EEE9E8E2E0BFCCD54E9CC42094C85D7A8CB5A394CDB7A4CE
        B8A5FFFFFFBE997E707070D0D0D0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC09B80
        FFFFFFEBDBCEEBDBCEEBDBCEEBDBCEEBDBCED4D2CD6AA9C8157FBA4892C07DA9
        C88BAAC38CA8C087ACC56DA7C8288ABF1C8CC57DA5BDE4E5E6FEFEFEFFFFFFFF
        FFFFFFFFFFC09A80838383D9D9D9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC19D81
        FFFFFFEBD9CCEBD9CCEBD9CCEBD9CDEBDACCEBD9CCE1D5CDA7C2CC4B9AC4127F
        BA0C7CB90C7CB90B7BB81883BB5995B4958F89F8F8F9FFFFFFFFFFFFFFFFFFFF
        FFFFF5EFEAC09C81B6B6B6EEEEEEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC39E83
        FFFFFFEAD8CBEAD9CBEAD8CBEAD8CBEAD8CCEAD8CBEAD8CBEAD8CCEAD8CBD6D1
        CAC4C9C7B3C2C6C4C9C7D6D0C9DFCBBCCCB4A2FFFFFFFFFFFFFFFFFFFFFFFFF5
        EFEBC8A68EB7AFA9E8E8E8FCFCFCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC4A084
        FFFFFFE9D7C9E9D7C9E9D7C9E9D7C9E3D0C1E3D0C1E3D0C1E3D0C1E3D1C1E3D0
        C1E3D0C1E3D0C1E3D1C1DECABBDECBBACCB3A0FFFFFFFFFFFFFFFFFFF5EFEBC9
        A88FB8AFA9E8E8E8FCFCFCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC6A186
        FFFFFFDEC9B9D9C2B1D4BDABD0B8A5CCB3A0CCB3A0CCB3A0CCB3A0CCB3A0CCB3
        A0CCB3A0CCB3A0CCB3A0CCB3A0CCB3A0CCB3A0FFFFFFFFFFFFF6F0EBCAAA90B8
        AFA9E8E8E8FCFCFCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC7A388
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6F0EBCBAB93BAB2ABE8
        E8E8FCFCFCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC8A389
        C8A489C8A489C8A388C8A388C8A389C8A389C8A388C8A389C8A389C8A489C8A4
        89C8A389C8A488C8A488C8A389C8A489C8A388C8A388C9A48AD6CDC7EEEEEEFC
        FCFCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
      OnClick = btNotificacaoClick
    end
    object btGerarNr: TSpeedButton
      Left = 153
      Top = 5
      Width = 144
      Height = 41
      Caption = 'Gerar Nr. Processo'
      Glyph.Data = {
        360C0000424D360C000000000000360000002800000020000000200000000100
        180000000000000C000000000000000000000000000000000000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9F9F9E6E6E6CACA
        CAACACAC9191917B7B7B777777878787A1A1A1BFBFBFDDDDDDF5F5F5FFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF5F5F5D1D1D1AD937AA97848BB76
        34CF7A29E18023EB8321E07F22CD7826B5702E9A683A7D644C7D7D7DBCBCBCEB
        EBEBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFBFBFBDED9D5B8916BC47B35ED933CF2AA5DF7BD
        7DFACE98FEDBACFFE2B8FEDBADFACE98F7BD7DF2A95DED933CBA712C8A633E7A
        7571C3C3C3F6F6F6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFF7F7F7CFB398C47F3EEF9943F4B570FAD19CFBD9A9FCDC
        AEFDDEB1FDE0B4FEE1B5FEE0B4FDDFB2FCDCADFCD9A9FAD19BF4B56FEF9943B3
        6F2C7D61469E9E9EE9E9E9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFF5F5F5CDA37CDC8A38F2A95DF7C98FFAD19BFAD5A2FBD7A6FCDA
        AAFCDCAEFDDEB0FDDEB1FDDEB0FCDCAEFCDAAAFBD7A6FBD4A2F9D19CF7C98FF2
        A95DD884338C623B898989E4E4E4FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFF8F8F8D2A376E8913BF3B068F7C88EF8CB93F9CF98F9D39EFAD5A2FBD8
        A6FBD9A9FCDAABFCDBACFCDAABFCD9A9FBD7A6FAD5A2F9D29DF9CF98F7CB93F7
        C88DF3B068E79039926437898989E9E9E9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FDFDFDDBB189E99139F2B068F5C385F6C68BF7CA90F9CD95F9D099FAD39EFAD4
        A1FBD6A4461E00461E00461E00FAD6A4FAD4A1FAD29EF9D09AF8CD95F8C990F6
        C68BF5C385F2B068E78F388C623B9E9E9EF6F6F6FFFFFFFFFFFFFFFFFFFFFFFF
        EACEB3E18C3AF1A95EF4BE7DF5C182F6C487F7C78CF8CA90F8CD95F9CF99F9D1
        9CFAD39F461E00461E00461E00FAD29EFAD19BF9CF98F8CD95F7CA91F7C78CF6
        C487F4C182F4BE7DF1AA5DD782307D6146C3C3C3FFFFFFFFFFFFFFFFFFFBF6F2
        DA9654EF9F4DF3B976F4BB7AF4BE7EF5C283F6C487F6C68CF7CA90F8CC93F9CD
        97F8CF98461E00461E00461E00F9CE98F9CD96F8CC93F7C990F7C78CF6C488F5
        C283F4BF7FF3BB7AF2B975EF9F4CB36F2C7A7571EBEBEBFFFFFFFFFFFFEAC39E
        ED9136F2B26AF2B773F3BA76F3BC7AF4BF7FF5C283F6C487F7C68AF7C88EF7CA
        90F8CB92461E00461E00461E00F8CB92F8CA90F7C88EF6C68BF5C487F5C183F4
        BE80F3BD7AF3BA77F2B772F2B269ED91368A633EBCBCBCFFFFFFFEFEFEE09752
        EEA04EF1B36DF2B670F3B873F3BA78F4BC7BF4BE7FF5C182F5C286F6C588F6C5
        8AF7C78C461E00461E00461E00F6C78CF6C68AF6C488F5C385F5C182F4BF7FF3
        BC7BF3BA77F2B874F2B56FF1B46CEEA04EBA712C7D7D7DF5F5F5F5DBC2ED8D30
        F0AD64F1B16AF1B36DF2B670F2B874F3BA77F4BB7AF4BD7DF5C080F5C183F5C3
        85F6C385461E00461E00461E00F6C386F5C385F5C182F5BF80F4BE7DF3BC7AF3
        BA77F2B774F2B670F1B36DF0B26AF0AE64EB8B2F7D644CDDDDDDECBB8CED973F
        F0AF67F1B068F1B26AF1B36DF1B570F2B773F3B975F3BB78F3BD7BF4BE7DF4BF
        7EF5BF80461E00461E00461E00F5C080F5BF7FF4BD7DF4BC7AF3BB78F3B976F2
        B872F2B670F1B46DF0B26BF1B168F0AF66ED963F9A683ABFBFBFE8A462EEA04E
        F0AF66F0B066F0B068F0B16AF1B36CF1B56FF2B771F3BB79F4BF81F5C489F5C6
        8FF5C9936D4E366F4F386D4E36F6C993F6C68FF5C489F4BF82F3BB7AF2B771F2
        B56FF1B36CF0B16AF0B068F0B067F0AF66EE9F4DB5702EA1A1A1E99342EFA759
        F0B066F0B067F0AF67F0B068F0B36DF2BA79F3C186F5C792F5C895F5C995F5CA
        97F6CA98745640745640745640F6CB98F5CA96F5C996F5C895F4C791F4C186F2
        BA7AF1B46CF0B168F0AF67F0B066F0AF66EFA759CD7826878787EA882DF0AC62
        F0AF66F0B066F0AF665834196C4C347A5D477A5D477A5D477A5D477A5D477A5D
        477A5D477A5D477A5D477A5D477A5D477A5D477A5D477A5D477A5D477A5D477A
        5D476C4C34583419F0AF67F0B066F0B067F0AC62E07F22777777EC8422F0B066
        F0B066F1B36BF3BC817E624D7F644F7F644F7F644F7F644F7F644F7F644F7F64
        4F7F644F7F644F7F644F7F644F7F644F7F644F7F644F7F644F7F644F7F644F7F
        644F7F644F7E624DF3BC81F1B36BF0B067F0B065EB83217B7B7BEB8A2EF0AC61
        F1B46EF3C087F5CB9B856B57856B57856B57856B57856B57856B57856B57856B
        57856B57856B57856B57856B57856B57856B57856B57856B57856B57856B5785
        6B57856B57856B57F5CB9BF3C188F1B46DF0AC61E18023919191EB9544EFA95C
        F3C189F6CC9FF6CC9EF6CC9EF6CC9EF6CC9EF6CC9EF6CD9EF6CD9FF6CD9EF6CC
        9FF6CD9E8A715E8A715E8A715EF6CC9FF6CC9EF6CC9EF6CC9FF6CC9EF6CC9EF6
        CC9EF6CD9EF6CC9FF6CD9FF6CD9EF3C18AEFA95CCF7A29ACACACEEA968F0AC63
        F6D0A3F6D0A4F6CFA4F6CFA3F6D0A3F6CFA4F6CFA4F6CFA3F6D0A4F6CFA3F6D0
        A3F6CFA3907866907866907866F6CFA4F6CFA4F6CFA3F6D0A3F6CFA3F6CFA4F6
        CFA3F6CFA3F6CFA4F6D0A4F6D0A4F6D0A4F0AC64BB7634CACACAF4C394F0A65D
        F6D1A7F6D2A8F6D2A8F6D1A8F6D2A8F6D2A8F6D2A7F6D2A8F6D2A7F6D2A7F6D2
        A8F6D2A8957E6D957E6D957E6DF6D2A7F6D1A8F6D1A8F6D2A8F6D2A8F6D1A8F6
        D1A8F6D2A7F6D2A7F6D2A8F6D2A7F6D2A8F0A65DA97848E6E6E6F9E0C7EF9844
        F6D0A6F7D4ACF7D4ADF7D4ACF7D4ADF7D4ACF7D4ADF7D4ACF7D4ADF7D4ADF7D4
        ADF7D4AD9B85759B85759B8575F7D4ACF7D4ACF7D4ACF7D4ADF7D4ADF7D4ADF7
        D4ACF7D4ACF7D4ADF7D4ADF7D4ADF6D0A6ED9643AD937AF9F9F9FFFFFFEEA661
        F3BC83F7D6B1F7D6B1F7D6B1F7D6B0F7D6B0F7D6B0F7D6B0F7D6B0F7D6B1F7D6
        B1F7D6B0A08B7CA08B7CA08B7CF7D6B0F7D6B1F7D6B0F7D6B1F7D6B1F7D6B0F7
        D6B0F7D6B1F7D6B0F7D6B0F7D6B1F3BC83C47B35D1D1D1FFFFFFFFFFFFF7D0AB
        EFA154F7D5AEF8D8B5F8D8B5F8D9B5F8D9B5F8D9B5F8D9B5F8D8B5F8D8B5F8D9
        B5F8D8B5A59283A59283A59283F8D8B5F8D9B5F8D9B5F8D9B5F8D9B5F8D8B5F8
        D8B5F8D9B5F8D9B5F8D8B5F7D5AEEFA154B8916BF5F5F5FFFFFFFFFFFFFFFAF6
        EFAB68F3B87DF8DBB9F8DBB9F8DAB9F8DAB9F8DAB9F8DBB9F8DAB9F8DBB9F8DA
        B9F8DBB9AA988AAA988AAA988AF8DAB9F8DBB9F8DAB9F8DBB9F8DBB9F8DBB9F8
        DBB9F8DBB9F8DBB9F8DBB9F3B97DC37F3DDED9D5FFFFFFFFFFFFFFFFFFFFFFFF
        F9DDC2EFA053F5C695F9DDBDF9DDBDF9DDBDF9DCBDF9DCBDF9DDBDF9DCBDF9DD
        BDF9DDBDAF9E91AF9E91AF9E91F9DDBDF9DDBDF9DCBDF9DCBDF9DDBDF9DDBDF9
        DDBDF9DCBDF9DDBDF5C695DF9044CFB398FBFBFBFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFF7CDA5EFA154F6CC9FF9DEC1F9DEC1F9DFC1F9DFC1F9DFC1F9DFC1F9DF
        C1F9DEC1B4A397B4A397B4A397F9DFC1F9DFC1F9DFC1F9DEC1F9DFC1F9DFC1F9
        DFC1F9DFC1F6CDA0EB9D4FCDA37CF7F7F7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFF5C79AEFA256F5CA9BF9E0C4F9E0C4F9E0C4F9E0C4F9E0C4F9E0
        C4F9E0C4F9E0C4F9E0C4F9E0C4F9E0C4F9E0C4F9E0C4F9E0C4F9E0C4F9E0C4F9
        E0C4F5CA9BEB9E51D2A376F5F5F5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFF7CDA5EFA054F4BE86F9DEBFF9E2C7F9E2C7F9E2C7F9E2
        C7F9E2C7F9E2C7F9E2C7F9E2C7F9E2C7F9E2C7F9E2C7F9E2C7F9E2C7F9DDBFF4
        BE86E39549DAB088F8F8F8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFF9DDC2EFAB68F0A55CF5C696F9DFC2FAE3CAFAE3
        CAFAE3CAFAE3CAFAE3CAFAE3CAFAE3CAFAE3CAFAE3CAF9DFC2F5C695F0A55CDA
        9654EACEB3FDFDFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFAF6F7D0ABEEA661F09D4DF2B677F5C9
        99F8D6B2F9DFC2FAE4CAF9DFC3F8D6B2F5C999F2B677F09D4DE09752EAC39EFB
        F6F2FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9E0C7F4C394EEA9
        68EB9544EB8A2EEC8422EA882DE99342E8A462ECBB8CF5DBC2FEFEFEFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
      OnClick = btGerarNrClick
    end
    object btConfirmar: TBitBtn
      Left = 368
      Top = 7
      Width = 94
      Height = 34
      Caption = 'Confirmar'
      TabOrder = 0
      Kind = bkOK
    end
    object Cancelar: TBitBtn
      Left = 472
      Top = 7
      Width = 94
      Height = 34
      Caption = 'Cancelar'
      TabOrder = 1
      Kind = bkCancel
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 283
    Width = 584
    Height = 19
    Panels = <
      item
        Width = 80
      end
      item
        Width = 300
      end
      item
        Width = 50
      end>
  end
  object dsPaciente: TDataSource
    DataSet = DMGERAL.TB_PACIENTE
    OnStateChange = dsPacienteStateChange
    Left = 352
    Top = 168
  end
  object dsNotificacao: TDataSource
    DataSet = DMGERAL.TB_NOTIFICACAO
    Left = 392
    Top = 168
  end
end