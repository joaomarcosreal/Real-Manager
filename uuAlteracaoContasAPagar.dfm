inherited frmAlteraContasAPagar: TfrmAlteraContasAPagar
  BorderIcons = []
  ClientHeight = 396
  ClientWidth = 748
  ExplicitWidth = 764
  ExplicitHeight = 435
  TextHeight = 13
  inherited botao_pesquisa: TSpeedButton
    Top = -115
    ExplicitTop = -115
  end
  object SpeedButton1: TSpeedButton [1]
    Left = 142
    Top = -38
    Width = 22
    Height = 22
    Flat = True
    Glyph.Data = {
      DE010000424DDE01000000000000760000002800000024000000120000000100
      0400000000006801000000000000000000001000000010000000000000000000
      80000080000000808000800000008000800080800000C0C0C000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00666666666666
      6666666666666666666666660000666666666666666666666666666666666666
      0000666666666666666666666666666666666666000060000066666000006668
      8888666668888866000060800066666080006668788866666878886600006080
      00666660800066687888666668788866000060000000F00000006668888888F8
      8888886600006080000000800000666878888888788888660000608000006080
      0000666878888868788888660000608000006080000066687888886878888866
      0000660000000000000666668888888888888666000066608000F08000666666
      687888F878886666000066600000600000666666688888688888666600006666
      00066600066666666688866688866666000066668F06668F06666666668F8666
      8F86666600006666000666000666666666888666888666660000666666666666
      6666666666666666666666660000666666666666666666666666666666666666
      0000}
    NumGlyphs = 2
    Visible = False
    OnClick = botao_pesquisaClick
  end
  inherited Edit1: TEdit
    Top = -115
    ExplicitTop = -115
  end
  object Edit2: TEdit [3]
    Tag = 99
    Left = 15
    Top = -35
    Width = 121
    Height = 21
    TabOrder = 1
    Text = 'Edit1'
    Visible = False
    OnChange = Edit1Change
    OnEnter = Edit1Enter
    OnExit = Edit1Exit
    OnKeyDown = Edit1KeyDown
  end
  object Panel1: TPanel [4]
    Tag = 99
    Left = 0
    Top = 0
    Width = 748
    Height = 34
    Align = alTop
    Color = 12615680
    ParentBackground = False
    TabOrder = 2
    StyleElements = []
    object Label10: TLabel
      Left = 3
      Top = 6
      Width = 453
      Height = 39
      AutoSize = False
      Caption = 'Contas '#224' pagar - Altera'#231#227'o de t'#237'tulo'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -19
      Font.Name = 'Calibri'
      Font.Style = [fsBold]
      ParentFont = False
      StyleElements = []
    end
  end
  object Panel5: TPanel [5]
    Left = 0
    Top = 217
    Width = 748
    Height = 116
    Align = alClient
    Color = clWhite
    ParentBackground = False
    TabOrder = 3
    StyleElements = []
    object Label3: TLabel
      Left = 3
      Top = 6
      Width = 73
      Height = 14
      Caption = 'Valor original'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Roboto'
      Font.Style = []
      ParentFont = False
      StyleElements = []
    end
    object Label5: TLabel
      Left = 378
      Top = 6
      Width = 65
      Height = 14
      Caption = 'Vencimento'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Roboto'
      Font.Style = []
      ParentFont = False
      StyleElements = []
    end
    object Label6: TLabel
      Left = 567
      Top = 6
      Width = 72
      Height = 14
      Caption = 'Compet'#234'ncia'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Roboto'
      Font.Style = []
      ParentFont = False
      StyleElements = []
    end
    object Label9: TLabel
      Left = 3
      Top = 48
      Width = 72
      Height = 14
      Caption = 'Observa'#231#245'es '
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Roboto'
      Font.Style = []
      ParentFont = False
      StyleElements = []
    end
    object Label4: TLabel
      Left = 192
      Top = 6
      Width = 75
      Height = 14
      Caption = 'Juros e multa'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Roboto'
      Font.Style = []
      ParentFont = False
      StyleElements = []
    end
    object edTotalConta: TCurrencyEdit
      Tag = 2
      Left = 3
      Top = 21
      Width = 180
      Height = 25
      AutoSize = False
      Color = 13487561
      DisplayFormat = 'R$ ,0.00;'
      Enabled = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Roboto'
      Font.Style = []
      MaxLength = 30
      ParentFont = False
      TabOrder = 0
      OnEnter = Edit1Enter
      OnExit = Edit1Exit
    end
    object edDataVencimento: TcxDateEdit
      Left = 378
      Top = 20
      EditValue = 0d
      ParentFont = False
      Style.Font.Charset = ANSI_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -15
      Style.Font.Name = 'Roboto'
      Style.Font.Style = []
      Style.IsFontAssigned = True
      TabOrder = 1
      OnEnter = Edit1Enter
      OnExit = Edit1Exit
      OnKeyDown = Edit1KeyDown
      Width = 180
    end
    object edDataRD: TcxDateEdit
      Left = 565
      Top = 20
      EditValue = 0d
      ParentFont = False
      Style.Font.Charset = ANSI_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -15
      Style.Font.Name = 'Roboto'
      Style.Font.Style = []
      Style.IsFontAssigned = True
      TabOrder = 2
      OnEnter = Edit1Enter
      OnExit = Edit1Exit
      OnKeyDown = Edit1KeyDown
      Width = 180
    end
    object edObservacoes: TEdit
      Left = 0
      Top = 68
      Width = 741
      Height = 26
      CharCase = ecUpperCase
      Color = clWhite
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -15
      Font.Name = 'Roboto'
      Font.Style = []
      MaxLength = 190
      ParentFont = False
      TabOrder = 3
      OnEnter = Edit1Exit
      OnExit = Edit1Exit
    end
    object CurrencyEdit1: TCurrencyEdit
      Tag = 2
      Left = 192
      Top = 21
      Width = 180
      Height = 25
      AutoSize = False
      Color = clWhite
      DisplayFormat = 'R$ ,0.00;'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Roboto'
      Font.Style = []
      MaxLength = 30
      ParentFont = False
      TabOrder = 4
      OnEnter = Edit1Enter
      OnExit = Edit1Exit
    end
  end
  object Panel4: TPanel [6]
    Left = 0
    Top = 34
    Width = 748
    Height = 110
    Align = alTop
    BevelOuter = bvNone
    Color = clWhite
    ParentBackground = False
    TabOrder = 4
    StyleElements = []
    object Panel6: TPanel
      Tag = 99
      Left = 0
      Top = 0
      Width = 752
      Height = 16
      Align = alTop
      BevelOuter = bvNone
      Color = 7960943
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentBackground = False
      ParentFont = False
      TabOrder = 0
      StyleElements = []
      ExplicitWidth = 748
      object Shape1: TShape
        Left = 0
        Top = 0
        Width = 21
        Height = 16
        Align = alLeft
        Pen.Color = 40176
        Pen.Width = 10
        Shape = stCircle
      end
      object Label34: TLabel
        Left = 21
        Top = 0
        Width = 223
        Height = 18
        Align = alClient
        Caption = 'Dados da nota fiscal e fornecedor'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -15
        Font.Name = 'Roboto'
        Font.Style = [fsBold]
        ParentFont = False
        StyleElements = []
      end
    end
    object Panel9: TPanel
      Tag = 99
      Left = 0
      Top = 16
      Width = 752
      Height = 94
      Align = alClient
      BevelOuter = bvNone
      Caption = '.'
      Color = clWhite
      Enabled = False
      ParentBackground = False
      TabOrder = 1
      StyleElements = []
      ExplicitWidth = 748
      object Label23: TLabel
        Left = 6
        Top = 4
        Width = 147
        Height = 14
        Caption = 'Raz'#227'o social do fornecedor'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Roboto'
        Font.Style = []
        ParentFont = False
        StyleElements = []
      end
      object Label2: TLabel
        Left = 8
        Top = 47
        Width = 59
        Height = 14
        Caption = 'N'#186' da nota'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Roboto'
        Font.Style = []
        ParentFont = False
        StyleElements = []
      end
      object Label1: TLabel
        Left = 257
        Top = 46
        Width = 76
        Height = 14
        Caption = 'N'#186' da entrada'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Roboto'
        Font.Style = []
        ParentFont = False
        StyleElements = []
      end
      object Label11: TLabel
        Left = 151
        Top = 46
        Width = 47
        Height = 14
        Caption = 'Emiss'#227'o'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Roboto'
        Font.Style = []
        ParentFont = False
        StyleElements = []
      end
      object Label7: TLabel
        Left = 405
        Top = 5
        Width = 81
        Height = 14
        Caption = 'Nome fantasia'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Roboto'
        Font.Style = []
        ParentFont = False
        StyleElements = []
      end
      object ed_razao_social_fornecedor: TEdit
        Left = 6
        Top = 18
        Width = 391
        Height = 26
        CharCase = ecUpperCase
        Color = 13487561
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -15
        Font.Name = 'Roboto'
        Font.Style = []
        MaxLength = 3
        ParentFont = False
        TabOrder = 0
        OnEnter = Edit1Exit
        OnExit = Edit1Exit
      end
      object edNumeroNota: TEdit
        Left = 8
        Top = 61
        Width = 138
        Height = 26
        CharCase = ecUpperCase
        Color = 13487561
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -15
        Font.Name = 'Roboto'
        Font.Style = []
        MaxLength = 3
        ParentFont = False
        TabOrder = 1
        Text = '123456789012345'
        OnEnter = Edit1Exit
        OnExit = Edit1Exit
      end
      object edNumeroEntrada: TEdit
        Left = 255
        Top = 61
        Width = 130
        Height = 26
        CharCase = ecUpperCase
        Color = 13487561
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -15
        Font.Name = 'Roboto'
        Font.Style = []
        MaxLength = 3
        ParentFont = False
        TabOrder = 2
        Text = '123456789012345'
        OnEnter = Edit1Exit
        OnExit = Edit1Exit
      end
      object edDataDoc: TcxDateEdit
        Left = 151
        Top = 61
        EditValue = 0d
        ParentFont = False
        Style.Color = 13487561
        Style.Font.Charset = ANSI_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -15
        Style.Font.Name = 'Roboto'
        Style.Font.Style = []
        Style.IsFontAssigned = True
        TabOrder = 3
        OnEnter = Edit1Enter
        OnExit = Edit1Exit
        OnKeyDown = Edit1KeyDown
        Width = 98
      end
      object Edit3: TEdit
        Left = 403
        Top = 18
        Width = 345
        Height = 26
        CharCase = ecUpperCase
        Color = 13487561
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -15
        Font.Name = 'Roboto'
        Font.Style = []
        MaxLength = 3
        ParentFont = False
        TabOrder = 4
        OnEnter = Edit1Exit
        OnExit = Edit1Exit
      end
    end
  end
  object TPanel [7]
    Left = 0
    Top = 333
    Width = 748
    Height = 63
    Align = alBottom
    BevelOuter = bvNone
    Color = clWhite
    ParentBackground = False
    TabOrder = 5
    StyleElements = []
    object btLancar: TAdvGlassButton
      Left = 453
      Top = 7
      Width = 142
      Height = 51
      BackColor = 12615680
      ButtonDirection = bdLeft
      Caption = 'Confirmar lan'#231'amento'
      CornerRadius = 0
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ForeColor = clWhite
      GlowColor = 12615680
      ImageIndex = -1
      InnerBorderColor = clBlack
      OuterBorderColor = clWhite
      Picture.Data = {
        424DF60600000000000036000000280000001800000018000000010018000000
        000000000000EB0A0000EB0A00000000000000000000FFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FEFEFEF4F4F4E4E4E4E1E1E1EDEDEDFCFCFCFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFEFEFEECECECC0C0C0909090868686AAAAAADFDFDFFAFAFAFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFEFEFEECECEC9BB49B2F8D2F1B891D558155686868A0
        A0A0DEDEDEFAFAFAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEECECEC97B7970D931115B12C15B2
        2A0B9B154E874E656565A0A0A0DEDEDEFBFBFBFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEECECEC98B9980F9613
        17B22F13AD2B12AB2613AF270A9A144F874F656565A0A0A0DEDEDEFBFBFBFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEECECEC99
        BA990F9A141AB63616B03015AE2C14AD2914AD2714B02A0A9A144F864F656565
        A1A1A1DEDEDEFBFBFBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFE
        FEEDEDED9BBC9B109D151BB63B1AB43518B13116AF2F13AE2A13AD2913AD2814
        B0280A9A14518651666666A2A2A2DFDFDFFBFBFBFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFF4F4F49EC09E10A11521BA421CB53A1AB33619B23417B1323DBE
        5227B43C0EAC2613AC2815B12B0A9A14518551666666A3A3A3DFDFDFFBFBFBFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFB5D9B816A82022BB451FB8401DB63B1DB639
        1BB53A17B0310E9F1776D18641BF560EAC2514AE2914B0290A99145285526767
        67A3A3A3E0E0E0FBFBFBFFFFFFFFFFFFFFFFFFFFFFFF2CAF3945C8661FBA431F
        B8411EB73E1FB8401BB4372E9B2E9CC09C139A1372D1843FBF530EAC2614AD29
        17B22C0A9914538553676767A3A3A3E0E0E0FBFBFBFFFFFFFFFFFFFFFFFF20B1
        3277D99217B83D1FBA4321BB441CB6392E9E2EC1CAC1F5F5F5C8EBC8109A1075
        D3863DBF530EAC2614AD2A15B12D0A9914548454686868A4A4A4E1E1E1FCFCFC
        FFFFFFFFFFFF85CE8F47C2626FD58B38C45B27BB472CA32EBFCABFF4F4F4FFFF
        FFFFFFFFC5EAC50F9A0F74D2853ABD5010AE2714AD2B16B22D0A991454835468
        6868A5A5A5E1E1E1FCFCFCFFFFFFFEFFFE76D4842ABB4142C05834AE3CCCDACC
        F6F6F6FFFFFFFFFFFFFFFFFFFFFFFFC4EBC40D9A0D77D3893ABD5010AE2815AF
        2B17B32E0A9914558355686868A6A6A6E3E3E3FCFCFCFFFFFFFFFFFFE2F9E4BD
        EAC1EFF6F0FCFCFCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBFE8BF0D9C0D
        77D38938BC4E10AE2915AE2C18B4300A99135683566A6A6AAFAFAFEEEEEEFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFBEE8BE0C9C0D7AD58C35BB4C11AF2A15AE2D17B22F0A99135A7D5A
        878787E1E1E1FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBAE7BA0A9C0C77D58B35BB4C11AF2B16
        B02D18B5331A8B1C8D8D8DE4E4E4FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB8E6B80A9C
        0E7AD58D34BA4C11AF2B19B5352A8D2AB8B8B8F2F2F2FFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFB4E6B4089D0E74D58954CA6C089C138CB28CE8E8E8FDFDFDFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB5E2B522A122259D259ACB9AF1F1F1
        FDFDFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
      ParentFont = False
      ShineColor = clWhite
      TabOrder = 0
      Version = '1.3.3.1'
    end
    object AdvGlassButton1: TAdvGlassButton
      Left = 602
      Top = 7
      Width = 142
      Height = 51
      BackColor = 12615680
      ButtonDirection = bdLeft
      Caption = 'Cancelar e sair'
      CornerRadius = 0
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ForeColor = clWhite
      GlowColor = 12615680
      ImageIndex = -1
      InnerBorderColor = clBlack
      OuterBorderColor = clWhite
      Picture.Data = {
        424DF60600000000000036000000280000001800000018000000010018000000
        000000000000130B0000130B00000000000000000000FFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEF1F1F1E3E3E3E6E6E6F2F2F2FCFCFC
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF3F3F3C2C2C28E8E8E93
        9393B6B6B6D6D6D6EAEAEAF7F7F7FEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7F7F7E2E2E2DCDCDCDEDEDEC1B0
        B0885C5C876969756D6D6666667D7D7DA0A0A0C6C6C6E0E0E0F1F1F1FCFCFCFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9F9F9D2D2D28F8F8F
        797979808080987D7DC18E8E9663638A57578156567E6B6B6A66666D6D6D8C8C
        8CB3B3B3D7D7D7F2F2F2FEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE6
        E6E6797979747474737373717272756464C89595A06C6CA26F6FA06D6D905D5D
        804D4D826060766B6B666565858585C6C6C6F5F5F5FFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFB1B1B18383836E6D6E90898CB3ACB1A19093C99494A16D6DA2
        6F6FA37070A26F6FA37070986565855353684D4D6C6C6CA0A0A0EBEBEBFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA7A7A78F8F8F716A6F57D48062EF9073BE
        84CE9799A47171A47171A47171A37070A47171A37070A6727283575765666696
        9696E7E7E7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA4A4A4929292736970
        4DD3794BED815DBD74D49AA0A57272A77474A67373A67373A57272A47171A671
        71865A5A666767939393E6E6E6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA2
        A2A2969696746A7246CE7344E3795BB770DBA0A6A77373A97676A87575A67474
        A87474A67373A773738A5E5E666868909090E5E5E5FFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFA2A2A2999999776D743DCC6D3BDA7059B06BDEA6ABAB7777AC
        7878A37171A37272A77676A87575A975758F61616768688E8E8EE4E4E4FFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9F9F9F9C9C9C766C7330C4602CCF6153A9
        61E1A7ACAC7676A58D8D8B89899C7373A77575AC7979AB7777936464676A6A8C
        8C8CE4E4E4FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9E9E9EA0A0A0736B6D
        96F7F396FFF897C5BFDFA9AAB58A8AD2D8D8D4D8D8A68B8BAE7A7AAD7A7AAC79
        799969696A6C6C8A8A8AE2E2E2FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9E
        9E9EA1A1A16D6969C6FFFFC7FFFFBACACAE0AEAEB17D7DD3C7C7CCCBCBB08484
        B07D7DAF7C7CAE7B7B9C6B6B6B6E6E888888E1E1E1FFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFF9B9B9BA7A7A76A6969F6FFFFF3FFFFD4C9C9E0B2B2B27F7FB4
        7F7FB47E7EB38080B27F7FB17E7EB07D7DA06E6E6C6F6F858585E1E1E1FFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF999999A9A9A96B6B6BFFFFFFFFFFFCE0C7
        C6E1B4B4B78383B78484B68383B58282B48181B38080B27F7FA671716D717183
        8383E0E0E0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF999999ADADAD6F6E6F
        FFFFF6FFF9EFE0C5C0E3B6B7B88484B98686B98686B78484B68383B58282B481
        81A97373707272818181DFDFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF98
        9898AEAEAE747575FFF8E9FFF2E4E2C1BAE5BABAB98686BE8A8AB88383B88484
        B68282B58282B48181AE76767073737F7F7FDEDEDEFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFF989898AFAFB0787979FFF3DDFFEEDAE3BFB5E8BFC0BA8585F1
        CFCFF9DBDBECC7C7E0B3B3D4A3A3C39191AE79797174747D7D7DDEDEDEFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9B9B9BB3B3B37E7F7EFFECD1FFE7CEE4BD
        B0EAC0C2BC8686EDD3D3FFF0F0FFE9E9FFE3E3FFE0E0EABCBCAF79797473737B
        7B7BDDDDDDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9B9B9BB3B3B384817F
        FFE4C3FFE1C0E6BBABEBC3C4C18B8BE1C9C9FFF2F2FFF1F1FFEAEAFFE4E4E7B9
        B9B17B7B777575787878DCDCDCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9C
        9C9CB5B5B58B8682FFE3B6FFDFB3EABBA9EEC5C6C38E8EC18B8BBA8383BA8686
        C29090CA9B9BC69595B57F7F777676777777DCDCDCFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFF9E9E9EB6B6B786868685817B87837DB69592F6CDCDDBB0B0D9
        AEAED5A6A6CC9F9FC39292BD8989BB8787B881817B78787E7E7EDEDEDEFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA0A0A0C9C9C9ABACACA8A8A9A3A4A4A19F
        9FA39A9AA39696A29191A59191A79090AC9393AE9393AF9191A280807B7A7AAA
        AAAAEBEBEBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB7B7B7A3A3A39F9F9F
        9F9F9F9D9D9D999A9A9697979696969394949192928F90908E8F8F8689898688
        88898A8AA5A5A5EBEBEBFBFBFBFFFFFFFFFFFFFFFFFF}
      ParentFont = False
      ShineColor = clWhite
      TabOrder = 1
      Version = '1.3.3.1'
    end
  end
  object Panel2: TPanel [8]
    Left = 0
    Top = 144
    Width = 748
    Height = 73
    Align = alTop
    BevelOuter = bvNone
    Color = clWhite
    ParentBackground = False
    TabOrder = 6
    StyleElements = []
    object Panel3: TPanel
      Tag = 99
      Left = 0
      Top = 0
      Width = 752
      Height = 16
      Align = alTop
      BevelOuter = bvNone
      Color = 7960943
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentBackground = False
      ParentFont = False
      TabOrder = 0
      StyleElements = []
      ExplicitWidth = 748
      object Label8: TLabel
        Left = 0
        Top = 0
        Width = 210
        Height = 18
        Align = alClient
        Alignment = taCenter
        Caption = 'Dados da nota fiscal de compra'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -15
        Font.Name = 'Roboto'
        Font.Style = [fsBold]
        ParentFont = False
        StyleElements = []
      end
    end
    object Panel7: TPanel
      Tag = 99
      Left = 0
      Top = 16
      Width = 752
      Height = 57
      Align = alClient
      BevelOuter = bvNone
      Caption = '.'
      Color = clWhite
      Enabled = False
      ParentBackground = False
      TabOrder = 1
      StyleElements = []
      ExplicitWidth = 748
      object Label13: TLabel
        Left = 8
        Top = 7
        Width = 59
        Height = 14
        Caption = 'N'#186' da nota'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Roboto'
        Font.Style = []
        ParentFont = False
        StyleElements = []
      end
      object Label14: TLabel
        Left = 257
        Top = 7
        Width = 76
        Height = 14
        Caption = 'N'#186' da entrada'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Roboto'
        Font.Style = []
        ParentFont = False
        StyleElements = []
      end
      object Label15: TLabel
        Left = 151
        Top = 7
        Width = 47
        Height = 14
        Caption = 'Emiss'#227'o'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Roboto'
        Font.Style = []
        ParentFont = False
        StyleElements = []
      end
      object Edit5: TEdit
        Left = 8
        Top = 21
        Width = 138
        Height = 26
        CharCase = ecUpperCase
        Color = 13487561
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -15
        Font.Name = 'Roboto'
        Font.Style = []
        MaxLength = 3
        ParentFont = False
        TabOrder = 0
        Text = '123456789012345'
        OnEnter = Edit1Exit
        OnExit = Edit1Exit
      end
      object Edit6: TEdit
        Left = 255
        Top = 23
        Width = 130
        Height = 26
        CharCase = ecUpperCase
        Color = 13487561
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -15
        Font.Name = 'Roboto'
        Font.Style = []
        MaxLength = 3
        ParentFont = False
        TabOrder = 1
        Text = '123456789012345'
        OnEnter = Edit1Exit
        OnExit = Edit1Exit
      end
      object cxDateEdit1: TcxDateEdit
        Left = 151
        Top = 22
        EditValue = 0d
        ParentFont = False
        Style.Color = 13487561
        Style.Font.Charset = ANSI_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -15
        Style.Font.Name = 'Roboto'
        Style.Font.Style = []
        Style.IsFontAssigned = True
        TabOrder = 2
        OnEnter = Edit1Enter
        OnExit = Edit1Exit
        OnKeyDown = Edit1KeyDown
        Width = 98
      end
    end
  end
  inherited cliques: TActionList
    Top = 65424
  end
  inherited actlBusca: TJvControlActionList
    Top = 65456
  end
  object ActionList1: TActionList
    Left = 724
    Top = 65528
    object ControlAction1: TControlAction
      Caption = 'ControlAction1'
      OnExecute = pesquisaFormaPagamento
    end
    object Action1: TAction
      Caption = 'actExitFormaPagamento'
      OnExecute = actExitFormaPagamentoExecute
    end
  end
  object JvControlActionList1: TJvControlActionList
    Left = 112
    Top = 430
    object Action2: TAction
      Caption = 'ACTF2ed_cod_grupo_fornecedor'
      OnExecute = ACTF2ed_cod_grupo_fornecedorExecute
    end
    object Action3: TAction
      Caption = 'ACTF2ed_cod_fornecedor'
      OnExecute = ACTF2ed_cod_fornecedorExecute
    end
    object Action4: TAction
      Caption = 'ACTF2edCodBairro'
      OnExecute = ACTF2edCodBairroExecute
    end
    object Action5: TAction
      Caption = 'ACTF2ed_cod_tipo_documento'
      OnExecute = ACTF2ed_cod_tipo_documentoExecute
    end
    object Action6: TAction
      Caption = 'ACTF2ed_cod_tipo_entrada'
      OnExecute = ACTF2ed_cod_tipo_entradaExecute
    end
    object Action7: TAction
      Caption = 'ACTF2ed_cfop'
      OnExecute = ACTF2ed_cfopExecute
    end
    object Action8: TAction
      Caption = 'ACTF2edCfopTransferencia'
      OnExecute = ACTF2edCfopTransferenciaExecute
    end
    object Action9: TAction
      Caption = 'ACTF2edCfopDevolucao'
      OnExecute = ACTF2edCfopDevolucaoExecute
    end
    object Action10: TAction
      Caption = 'ACTF2edCodTipoItemSped'
      OnExecute = ACTF2edCodTipoItemSpedExecute
    end
    object Action11: TAction
      Caption = 'ACTF2edCodNCM'
      OnExecute = ACTF2edCodNCMExecute
    end
    object Action12: TAction
      Caption = 'ACTF2edCodGeneroItem'
      OnExecute = ACTF2edCodGeneroItemExecute
    end
    object Action13: TAction
      Caption = 'ACTF2ed_cefop_entradas'
      OnExecute = ACTF2ed_cefop_entradasExecute
    end
    object Action14: TAction
      Caption = 'ACTF2ed_cefop_saidas'
      OnExecute = ACTF2ed_cefop_saidasExecute
    end
    object Action15: TAction
      Caption = 'ACTF2ed_cod_modelo_nota_fiscal'
      OnExecute = ACTF2ed_cod_modelo_nota_fiscalExecute
    end
    object Action16: TAction
      Caption = 'ACTF2edCodSituacaoDocFiscal'
      OnExecute = ACTF2edCodSituacaoDocFiscalExecute
    end
    object Action17: TAction
      Caption = 'ACTF2ed_cst'
      OnExecute = ACTF2ed_cstExecute
    end
    object Action18: TAction
      Caption = 'ACTF2edCstSaida'
      OnExecute = ACTF2edCstSaidaExecute
    end
    object Action19: TAction
      Caption = 'ACTF2edCstTransferencia'
      OnExecute = ACTF2edCstTransferenciaExecute
    end
    object Action20: TAction
      Caption = 'ACTF2edCstDevolucao'
      OnExecute = ACTF2edCstDevolucaoExecute
    end
    object Action21: TAction
      Caption = 'ACTF2edCstPisCofins'
      OnExecute = ACTF2edCstPisCofinsExecute
    end
    object Action22: TAction
      Caption = 'ACTF2ed_cod_usuario'
      OnExecute = ACTF2ed_cod_usuarioExecute
    end
    object Action23: TAction
      Caption = 'ACTF2ed_cod_grupo'
      OnExecute = ACTF2ed_cod_grupoExecute
    end
    object Action24: TAction
      Caption = 'ACTF2edCodGrupoRD'
      OnExecute = ACTF2edCodGrupoRDExecute
    end
    object Action25: TAction
      Caption = 'ACTF2ed_cod_historico'
      OnExecute = ACTF2ed_cod_historicoExecute
    end
    object Action26: TAction
      Caption = 'ACTF2ed_cod_cidade'
      OnExecute = ACTF2ed_cod_cidadeExecute
    end
    object Action27: TAction
      Caption = 'ACTF2edCodGrupoTouch'
      OnExecute = ACTF2edCodGrupoTouchExecute
    end
    object Action28: TAction
      Caption = 'ACTF2ed_cod_estado'
      OnExecute = ACTF2ed_cod_estadoExecute
    end
    object Action29: TAction
      Caption = 'ACTF2ed_cod_centro_custo'
      OnExecute = ACTF2ed_cod_centro_custoExecute
    end
    object Action30: TAction
      Caption = 'ACTF2ed_cod_item'
      OnExecute = ACTF2ed_cod_itemExecute
    end
    object Action31: TAction
      Caption = 'ACTF2ed_cod_item_saida'
      OnExecute = ACTF2ed_cod_item_saidaExecute
    end
    object Action32: TAction
      Caption = 'ACTF2edCodSubmateria'
      OnExecute = ACTF2edCodSubmateriaExecute
    end
    object Action33: TAction
      Caption = 'ACTF2edCodTipoBaixaEstoque'
      OnExecute = ACTF2edCodTipoBaixaEstoqueExecute
    end
    object Action34: TAction
      Caption = 'ACTF2ed_cod_barras_item'
      OnExecute = ACTF2ed_cod_barras_itemExecute
    end
    object Action35: TAction
      Caption = 'ACTF2ed_cod_un_entrada'
      OnExecute = ACTF2ed_cod_un_entradaExecute
    end
    object Action36: TAction
      Caption = 'ACTF2ed_cod_un_saida'
      OnExecute = ACTF2ed_cod_un_saidaExecute
    end
    object Action37: TAction
      Caption = 'ACTF2edCodSaborPizza'
      OnExecute = ACTF2edCodSaborPizzaExecute
    end
    object Action38: TAction
      Caption = 'ACTF2edCodUnFracao'
      OnExecute = ACTF2edCodUnFracaoExecute
    end
    object Action39: TAction
      Caption = 'ACTF2edCodUnPadrao'
      OnExecute = ACTF2edCodUnPadraoExecute
    end
    object Action40: TAction
      Caption = 'ACTF2ed_cod_garcon'
      OnExecute = ACTF2ed_cod_garconExecute
    end
    object Action41: TAction
      Caption = 'ACTF2edCodPromoter'
      OnExecute = ACTF2edCodPromoterExecute
    end
    object Action42: TAction
      Caption = 'ACTF2edCodDepartamento'
      OnExecute = ACTF2edCodDepartamentoExecute
    end
    object Action43: TAction
      Caption = 'ACTF2edCodGuarnicao'
    end
    object Action44: TAction
      Caption = 'ACTF2ed_cod_metre'
      OnExecute = ACTF2ed_cod_metreExecute
    end
    object Action45: TAction
      Caption = 'ACTF2ed_cod_tipo_cliente'
      OnExecute = ACTF2ed_cod_tipo_clienteExecute
    end
    object Action46: TAction
      Caption = 'ACTF2ed_cod_cliente'
      OnExecute = ACTF2ed_cod_clienteExecute
    end
    object Action47: TAction
      Caption = 'ACTF2ed_cod_cliente_reduzido'
      OnExecute = ACTF2ed_cod_cliente_reduzidoExecute
    end
    object Action48: TAction
      Caption = 'ACTF2edRgCliente'
      OnExecute = ACTF2edRgClienteExecute
    end
    object Action49: TAction
      Caption = 'ACTF2ed_cod_mini_printer'
      OnExecute = ACTF2ed_cod_mini_printerExecute
    end
    object Action50: TAction
      Caption = 'ACTF2edTelClienteDelivery'
      OnExecute = ACTF2edTelClienteDeliveryExecute
    end
    object Action51: TAction
      Caption = 'ACTF2edCodBarrasProduto'
      OnExecute = ACTF2edCodBarrasProdutoExecute
    end
    object Action52: TAction
      Caption = 'ACTF2edCodProduto'
      OnExecute = ACTF2edCodProdutoExecute
    end
    object Action53: TAction
      Caption = 'edCodPizza'
      OnExecute = edCodPizzaExecute
    end
    object Action54: TAction
      Caption = 'ACTF2edCodAliquota'
      OnExecute = ACTF2edCodAliquotaExecute
    end
    object Action55: TAction
      Caption = 'ACTF2edCodFormaPagamento'
      OnExecute = ACTF2edCodFormaPagamentoExecute
    end
    object Action56: TAction
      Caption = 'ACTF2edCodLoja'
      OnExecute = ACTF2edCodLojaExecute
    end
    object Action57: TAction
      Caption = 'ACTF2edCodCliDelivery'
      OnExecute = ACTF2edCodCliDeliveryExecute
    end
    object Action58: TAction
      Caption = 'ACTF2edCodEntregador'
      OnExecute = ACTF2edCodEntregadorExecute
    end
  end
  object tbParcelas: TRxMemoryData
    FieldDefs = <>
    Left = 724
    Top = 16
    object tbParcelasdataVencimento: TDateField
      FieldName = 'dataVencimento'
      DisplayFormat = 'DD/MM/YYY'
    end
    object tbParcelasdescricaoConta: TStringField
      FieldName = 'descricaoConta'
      Size = 50
    end
    object tbParcelasnumeroControle: TStringField
      FieldName = 'numeroControle'
      Size = 8
    end
    object tbParcelasvalorParcela: TCurrencyField
      FieldName = 'valorParcela'
    end
    object tbParcelasvalorMulta: TCurrencyField
      FieldName = 'valorMulta'
    end
    object tbParcelasvalorMora: TFloatField
      FieldName = 'valorMora'
    end
    object tbParcelasvalorDesconto: TFloatField
      FieldName = 'valorDesconto'
    end
    object tbParcelasflagMulta: TSmallintField
      FieldName = 'flagMulta'
    end
    object tbParcelasflagMora: TSmallintField
      FieldName = 'flagMora'
    end
    object tbParcelasflagDesconto: TSmallintField
      FieldName = 'flagDesconto'
    end
    object tbParcelasdiasDesconto: TIntegerField
      FieldName = 'diasDesconto'
    end
    object tbParcelasdiaSemana: TStringField
      FieldName = 'diaSemana'
      Size = 16
    end
    object tbParcelasparcela: TStringField
      FieldName = 'parcela'
      Size = 5
    end
  end
  object dsParcelas: TDataSource
    DataSet = tbParcelas
    Left = 724
  end
  object FDMemTable1: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 614
    Top = 105
  end
end
