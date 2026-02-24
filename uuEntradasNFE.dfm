inherited frmEntradasNfe: TfrmEntradasNfe
  Left = 151
  Top = 0
  ClientHeight = 660
  ClientWidth = 1218
  OnDestroy = FormDestroy
  ExplicitWidth = 1230
  ExplicitHeight = 698
  TextHeight = 13
  object Panel8: TPanel [2]
    Tag = 99
    Left = 0
    Top = 0
    Width = 1218
    Height = 34
    Align = alTop
    BevelOuter = bvNone
    Color = 12615680
    ParentBackground = False
    TabOrder = 1
    StyleElements = []
    ExplicitWidth = 1214
    object Label22: TLabel
      Left = 1
      Top = 8
      Width = 449
      Height = 39
      AutoSize = False
      Caption = 'Entradas de notas fiscais eletr'#244'nicas / Compras'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -19
      Font.Name = 'Calibri'
      Font.Style = [fsBold]
      ParentFont = False
      StyleElements = []
    end
  end
  object Panel4: TPanel [3]
    Left = 0
    Top = 34
    Width = 1218
    Height = 67
    Align = alTop
    BevelOuter = bvNone
    Color = clWhite
    ParentBackground = False
    TabOrder = 2
    StyleElements = []
    ExplicitWidth = 1214
    object Panel6: TPanel
      Tag = 99
      Left = 0
      Top = 0
      Width = 1218
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
      ExplicitWidth = 1214
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
        Width = 1197
        Height = 16
        Align = alClient
        Caption = 'Dados da nota fiscal e fornecedor'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -15
        Font.Name = 'Roboto'
        Font.Style = [fsBold]
        ParentFont = False
        StyleElements = []
        ExplicitWidth = 223
        ExplicitHeight = 18
      end
    end
    object Panel9: TPanel
      Tag = 99
      Left = 0
      Top = 16
      Width = 1218
      Height = 51
      Align = alClient
      BevelOuter = bvNone
      Caption = '.'
      Color = clWhite
      ParentBackground = False
      TabOrder = 1
      StyleElements = []
      ExplicitWidth = 1214
      object Label8: TLabel
        Left = 6
        Top = 4
        Width = 111
        Height = 14
        Caption = 'Nome do fornecedor'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Roboto'
        Font.Style = []
        ParentFont = False
        StyleElements = []
      end
      object Label9: TLabel
        Left = 439
        Top = 4
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
      object Label11: TLabel
        Left = 593
        Top = 3
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
      object Label1: TLabel
        Left = 541
        Top = 6
        Width = 26
        Height = 14
        Caption = 'S'#233'rie'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Roboto'
        Font.Style = []
        ParentFont = False
        StyleElements = []
      end
      object Label2: TLabel
        Left = 698
        Top = 3
        Width = 167
        Height = 14
        Caption = 'Chave da nota fiscal eletr'#244'nica'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Roboto'
        Font.Style = []
        ParentFont = False
        StyleElements = []
      end
      object xedDataEntradaNotaFiscal: TLabel
        Left = 1094
        Top = 6
        Width = 87
        Height = 14
        Caption = 'Data de entrada'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Roboto'
        Font.Style = []
        ParentFont = False
        StyleElements = []
      end
      object edNomeFornecedor: TEdit
        Left = 6
        Top = 18
        Width = 427
        Height = 26
        CharCase = ecUpperCase
        Color = 13487561
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -15
        Font.Name = 'Roboto'
        Font.Style = []
        MaxLength = 200
        ParentFont = False
        TabOrder = 0
        Text = 'XXX'
        OnEnter = edSerieNotaExit
        OnExit = edSerieNotaExit
      end
      object edNumeroNota: TEdit
        Left = 439
        Top = 18
        Width = 96
        Height = 26
        CharCase = ecUpperCase
        Color = 13487561
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -15
        Font.Name = 'Roboto'
        Font.Style = []
        MaxLength = 200
        ParentFont = False
        TabOrder = 1
        Text = 'XXXX'
        OnEnter = edSerieNotaExit
        OnExit = edSerieNotaExit
      end
      object edDataDoc: TcxDateEdit
        Left = 593
        Top = 18
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
        OnExit = edSerieNotaExit
        OnKeyDown = Edit1KeyDown
        Width = 98
      end
      object edSerieNota: TEdit
        Left = 541
        Top = 18
        Width = 46
        Height = 26
        CharCase = ecUpperCase
        Color = 13487561
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -15
        Font.Name = 'Roboto'
        Font.Style = []
        MaxLength = 200
        ParentFont = False
        TabOrder = 3
        Text = 'XX'
        OnEnter = edSerieNotaExit
        OnExit = edSerieNotaExit
      end
      object edChaveNotaFiscal: TEdit
        Left = 697
        Top = 20
        Width = 388
        Height = 26
        CharCase = ecUpperCase
        Color = 13487561
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -15
        Font.Name = 'Roboto'
        Font.Style = []
        MaxLength = 200
        ParentFont = False
        TabOrder = 4
        OnEnter = edSerieNotaExit
        OnExit = edSerieNotaExit
      end
      object edDataEntradaNotaFiscal: TcxDateEdit
        Left = 1094
        Top = 20
        EditValue = 0d
        ParentFont = False
        Style.Font.Charset = ANSI_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -15
        Style.Font.Name = 'Roboto'
        Style.Font.Style = []
        Style.IsFontAssigned = True
        TabOrder = 5
        OnEnter = Edit1Enter
        OnKeyDown = Edit1KeyDown
        Width = 122
      end
    end
  end
  object pn_botoes: TPanel [4]
    Left = 0
    Top = 598
    Width = 1218
    Height = 62
    Align = alBottom
    Color = clWhite
    ParentBackground = False
    TabOrder = 3
    StyleElements = []
    ExplicitTop = 597
    ExplicitWidth = 1214
    object btSalvar: TAdvGlassButton
      Left = 930
      Top = 7
      Width = 142
      Height = 49
      BackColor = 12615680
      ButtonDirection = bdLeft
      Caption = 'Salvar'
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
      OnClick = btSalvarClick
    end
    object btSair: TAdvGlassButton
      Left = 1079
      Top = 7
      Width = 142
      Height = 49
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
      OnClick = btSairClick
    end
    object AdvGlassButton2: TAdvGlassButton
      Left = 4
      Top = 6
      Width = 142
      Height = 49
      BackColor = 12615680
      ButtonDirection = bdLeft
      Caption = 'Exibir Danfe'
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
      ParentFont = False
      ShineColor = clWhite
      TabOrder = 2
      Version = '1.3.3.1'
      OnClick = AdvGlassButton2Click
    end
  end
  object Panel3: TPanel [5]
    Left = 0
    Top = 101
    Width = 1218
    Height = 86
    Align = alTop
    BevelOuter = bvNone
    Color = clWhite
    ParentBackground = False
    TabOrder = 4
    Visible = False
    StyleElements = []
    ExplicitWidth = 1214
    object Panel5: TPanel
      Tag = 99
      Left = 0
      Top = 1
      Width = 1218
      Height = 0
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
      ExplicitWidth = 1214
    end
    object Panel11: TPanel
      Tag = 99
      Left = 0
      Top = 1
      Width = 1218
      Height = 3
      Align = alTop
      BevelOuter = bvNone
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentBackground = False
      ParentFont = False
      TabOrder = 1
      StyleElements = []
      ExplicitWidth = 1214
    end
    object Panel10: TPanel
      Tag = 99
      Left = 0
      Top = 4
      Width = 916
      Height = 82
      Align = alLeft
      BevelOuter = bvNone
      Caption = '.'
      Color = clWhite
      ParentBackground = False
      TabOrder = 2
      StyleElements = []
      object Label4: TLabel
        Left = 519
        Top = 23
        Width = 79
        Height = 14
        Caption = 'N'#186' de parcelas'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Roboto'
        Font.Style = []
        ParentFont = False
        StyleElements = []
      end
      object Label7: TLabel
        Left = 625
        Top = 23
        Width = 103
        Height = 14
        Caption = 'Dias entre parcelas'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Roboto'
        Font.Style = []
        ParentFont = False
        StyleElements = []
      end
      object Label3: TLabel
        Left = 389
        Top = 23
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
      object Label12: TLabel
        Left = 258
        Top = 23
        Width = 123
        Height = 14
        Caption = 'Vencimento 1'#170' parcela'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Roboto'
        Font.Style = []
        ParentFont = False
        StyleElements = []
      end
      object Label19: TLabel
        Left = 4
        Top = 23
        Width = 84
        Height = 14
        Caption = 'Total financeiro'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Roboto'
        Font.Style = []
        ParentFont = False
        StyleElements = []
      end
      object Label15: TLabel
        Left = 131
        Top = 23
        Width = 34
        Height = 14
        Caption = 'Ajuste'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Roboto'
        Font.Style = []
        ParentFont = False
        StyleElements = []
      end
      object edNumeroParcelas: TSpinEdit
        Left = 519
        Top = 37
        Width = 100
        Height = 24
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Roboto'
        Font.Style = []
        MaxValue = 100
        MinValue = 1
        ParentFont = False
        TabOrder = 4
        Value = 1
        OnKeyDown = Edit1KeyDown
      end
      object edDiasParcelas: TSpinEdit
        Left = 625
        Top = 37
        Width = 103
        Height = 24
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Roboto'
        Font.Style = []
        MaxValue = 100
        MinValue = 1
        ParentFont = False
        TabOrder = 5
        Value = 1
        OnKeyDown = Edit1KeyDown
      end
      object edDataCompetencia: TcxDateEdit
        Left = 389
        Top = 37
        EditValue = 0d
        ParentFont = False
        Style.Font.Charset = ANSI_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -15
        Style.Font.Name = 'Roboto'
        Style.Font.Style = []
        Style.IsFontAssigned = True
        TabOrder = 3
        OnKeyDown = Edit1KeyDown
        Width = 122
      end
      object edDataVencimento: TcxDateEdit
        Left = 261
        Top = 37
        EditValue = 0d
        ParentFont = False
        Style.Font.Charset = ANSI_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -15
        Style.Font.Name = 'Roboto'
        Style.Font.Style = []
        Style.IsFontAssigned = True
        TabOrder = 2
        OnKeyDown = Edit1KeyDown
        Width = 122
      end
      object Panel12: TPanel
        Tag = 99
        Left = 0
        Top = 0
        Width = 916
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
        TabOrder = 6
        StyleElements = []
        object Label13: TLabel
          Left = 0
          Top = 0
          Width = 916
          Height = 16
          Align = alClient
          Alignment = taCenter
          Caption = 'Informa'#231#245'es para o financeiro (Contas '#224' pagar)'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -15
          Font.Name = 'Roboto'
          Font.Style = [fsBold]
          ParentFont = False
          StyleElements = []
          ExplicitWidth = 313
          ExplicitHeight = 18
        end
      end
      object edTotalFinanceiro: TCurrencyEdit
        Tag = 2
        Left = 4
        Top = 37
        Width = 121
        Height = 26
        AutoSize = False
        DisplayFormat = 'R$ ,0.00;'
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
        OnKeyDown = Edit1KeyDown
      end
      object edValorAjuste: TCurrencyEdit
        Tag = 2
        Left = 131
        Top = 37
        Width = 121
        Height = 26
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
        TabOrder = 1
        OnEnter = Edit1Enter
        OnExit = Edit1Exit
        OnKeyDown = Edit1KeyDown
      end
      object CheckBox1: TCheckBox
        Left = 6
        Top = 65
        Width = 302
        Height = 17
        Caption = 'N'#227'o desejo lan'#231'ar esse t'#237'tulo no contas '#224' pagar'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Roboto'
        Font.Style = []
        ParentFont = False
        TabOrder = 7
      end
    end
    object Panel13: TPanel
      Tag = 99
      Left = 0
      Top = 0
      Width = 1218
      Height = 1
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
      TabOrder = 3
      StyleElements = []
      ExplicitWidth = 1214
    end
    object Panel14: TPanel
      Left = 916
      Top = 4
      Width = 8
      Height = 82
      Align = alLeft
      BevelOuter = bvNone
      TabOrder = 4
      StyleElements = []
    end
    object pnICMS: TPanel
      Left = 924
      Top = 4
      Width = 294
      Height = 82
      Align = alClient
      BevelOuter = bvNone
      Color = clWhite
      ParentBackground = False
      TabOrder = 5
      StyleElements = []
      ExplicitWidth = 290
      object Label14: TLabel
        Left = 12
        Top = 23
        Width = 79
        Height = 14
        Caption = 'Valor do custo'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Roboto'
        Font.Style = []
        ParentFont = False
        StyleElements = []
      end
      object Panel16: TPanel
        Tag = 99
        Left = 0
        Top = 0
        Width = 294
        Height = 16
        Align = alTop
        BevelOuter = bvNone
        Caption = 'Custos e encargos complementares'
        Color = 7960943
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -13
        Font.Name = 'Roboto'
        Font.Style = [fsBold]
        ParentBackground = False
        ParentFont = False
        TabOrder = 0
        StyleElements = []
        ExplicitWidth = 290
      end
      object edValorCustosComplementares: TCurrencyEdit
        Tag = 2
        Left = 6
        Top = 37
        Width = 285
        Height = 26
        AutoSize = False
        DisplayFormat = 'R$ ,0.00;'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Roboto'
        Font.Style = []
        MaxLength = 30
        ParentFont = False
        TabOrder = 1
        OnEnter = Edit1Enter
        OnExit = Edit1Exit
        OnKeyDown = Edit1KeyDown
      end
    end
  end
  object Panel15: TPanel [6]
    Left = 0
    Top = 187
    Width = 1218
    Height = 411
    Align = alClient
    BevelOuter = bvNone
    Color = clWhite
    ParentBackground = False
    TabOrder = 5
    StyleElements = []
    ExplicitWidth = 1214
    ExplicitHeight = 410
    object Panel2: TPanel
      Left = 0
      Top = 361
      Width = 1218
      Height = 50
      Align = alBottom
      BevelOuter = bvNone
      Color = clWhite
      ParentBackground = False
      TabOrder = 0
      StyleElements = []
      ExplicitTop = 360
      ExplicitWidth = 1214
      object Label32: TLabel
        Left = 5
        Top = 4
        Width = 63
        Height = 15
        Caption = 'Base ICMS'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Roboto'
        Font.Style = []
        ParentFont = False
        StyleElements = []
      end
      object Label33: TLabel
        Left = 116
        Top = 4
        Width = 80
        Height = 15
        Caption = 'Valor do ICMS'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Roboto'
        Font.Style = []
        ParentFont = False
        StyleElements = []
      end
      object Label26: TLabel
        Left = 225
        Top = 4
        Width = 82
        Height = 15
        Caption = 'Base ICMS ST'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Roboto'
        Font.Style = []
        ParentFont = False
        StyleElements = []
      end
      object Label25: TLabel
        Left = 336
        Top = 4
        Width = 50
        Height = 15
        Caption = 'ICMS ST'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Roboto'
        Font.Style = []
        ParentFont = False
        StyleElements = []
      end
      object Label5: TLabel
        Left = 446
        Top = 4
        Width = 51
        Height = 15
        Caption = 'Produtos'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Roboto'
        Font.Style = []
        ParentFont = False
        StyleElements = []
      end
      object Label36: TLabel
        Left = 555
        Top = 4
        Width = 32
        Height = 15
        Caption = 'Frete:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Roboto'
        Font.Style = []
        ParentFont = False
        StyleElements = []
      end
      object Label37: TLabel
        Left = 665
        Top = 4
        Width = 43
        Height = 15
        Caption = 'Seguro:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Roboto'
        Font.Style = []
        ParentFont = False
        StyleElements = []
      end
      object Label44: TLabel
        Left = 776
        Top = 4
        Width = 55
        Height = 15
        Caption = 'Desconto'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Roboto'
        Font.Style = []
        ParentFont = False
        StyleElements = []
      end
      object Label38: TLabel
        Left = 886
        Top = 2
        Width = 100
        Height = 15
        Caption = 'Outras  despesas'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Roboto'
        Font.Style = []
        ParentFont = False
        StyleElements = []
      end
      object Label35: TLabel
        Left = 996
        Top = 4
        Width = 16
        Height = 15
        Caption = 'IPI'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Roboto'
        Font.Style = []
        ParentFont = False
        StyleElements = []
      end
      object Label10: TLabel
        Left = 1106
        Top = 4
        Width = 75
        Height = 15
        Caption = 'Total da NF-e'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Roboto'
        Font.Style = []
        ParentFont = False
        StyleElements = []
      end
      object edBaseCalculoICMS: TCurrencyEdit
        Left = 5
        Top = 20
        Width = 105
        Height = 26
        Color = 13487561
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Roboto'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
      end
      object edValorICMS: TCurrencyEdit
        Left = 114
        Top = 20
        Width = 105
        Height = 26
        Color = 13487561
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Roboto'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
      end
      object edBaseCalculoICMSSubst: TCurrencyEdit
        Left = 225
        Top = 20
        Width = 105
        Height = 26
        Color = 13487561
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Roboto'
        Font.Style = []
        ParentFont = False
        TabOrder = 2
      end
      object edValorICMSSubst: TCurrencyEdit
        Left = 335
        Top = 20
        Width = 105
        Height = 26
        Color = 13487561
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Roboto'
        Font.Style = []
        ParentFont = False
        TabOrder = 3
      end
      object edValorProdutos: TCurrencyEdit
        Left = 445
        Top = 20
        Width = 105
        Height = 26
        Color = 13487561
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Roboto'
        Font.Style = []
        ParentFont = False
        TabOrder = 4
      end
      object edValorFrete: TCurrencyEdit
        Left = 555
        Top = 20
        Width = 105
        Height = 26
        Color = 13487561
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Roboto'
        Font.Style = []
        ParentFont = False
        TabOrder = 5
      end
      object edValorSeguro: TCurrencyEdit
        Left = 665
        Top = 20
        Width = 105
        Height = 26
        Color = 13487561
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Roboto'
        Font.Style = []
        ParentFont = False
        TabOrder = 6
      end
      object edValorDesconto: TCurrencyEdit
        Left = 775
        Top = 20
        Width = 105
        Height = 26
        Color = 13487561
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Roboto'
        Font.Style = []
        ParentFont = False
        TabOrder = 7
      end
      object edOutrasDespesas: TCurrencyEdit
        Left = 885
        Top = 20
        Width = 105
        Height = 26
        Color = 13487561
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Roboto'
        Font.Style = []
        ParentFont = False
        TabOrder = 8
      end
      object edValorIPI: TCurrencyEdit
        Left = 995
        Top = 20
        Width = 105
        Height = 26
        Color = 13487561
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Roboto'
        Font.Style = []
        ParentFont = False
        TabOrder = 9
      end
      object edTotalNotaFiscal: TCurrencyEdit
        Left = 1105
        Top = 20
        Width = 113
        Height = 26
        Color = 13487561
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Roboto'
        Font.Style = []
        ParentFont = False
        TabOrder = 10
      end
    end
    object pnGlobal: TPanel
      Left = 0
      Top = 0
      Width = 708
      Height = 361
      Align = alClient
      TabOrder = 1
      StyleElements = []
      ExplicitWidth = 704
      ExplicitHeight = 360
      object pnFornecedor: TPanel
        Left = 109
        Top = -52
        Width = 921
        Height = 51
        TabOrder = 0
        StyleElements = []
        object Panel1: TPanel
          Left = 87
          Top = 135
          Width = 434
          Height = 26
          BevelOuter = bvNone
          Enabled = False
          TabOrder = 0
          StyleElements = []
        end
      end
      object Panel7: TPanel
        Tag = 99
        Left = 1
        Top = 1
        Width = 706
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
        TabOrder = 1
        StyleElements = []
        ExplicitWidth = 702
        object Label6: TLabel
          Left = 0
          Top = 0
          Width = 706
          Height = 16
          Align = alClient
          Alignment = taCenter
          Anchors = [akLeft, akTop, akRight]
          Caption = #205'tens da nota fiscal'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -15
          Font.Name = 'Roboto'
          Font.Style = [fsBold]
          ParentFont = False
          StyleElements = []
          ExplicitWidth = 127
          ExplicitHeight = 18
        end
      end
      object cxGrid1: TcxGrid
        Left = 1
        Top = 17
        Width = 706
        Height = 343
        Align = alClient
        TabOrder = 2
        ExplicitWidth = 702
        ExplicitHeight = 342
        object cxGrid1DBTableView1: TcxGridDBTableView
          OnKeyDown = cxGrid1DBTableView1KeyDown
          Navigator.Buttons.CustomButtons = <>
          ScrollbarAnnotations.CustomAnnotations = <>
          DataController.DataSource = dm.dsComprasTemp
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <
            item
              Kind = skSum
              Column = cxGrid1DBTableView1desconto
            end
            item
              Kind = skSum
              Column = cxGrid1DBTableView1valorFrete
            end
            item
              Kind = skSum
              Column = cxGrid1DBTableView1valorIPI
            end
            item
              Kind = skSum
              Column = cxGrid1DBTableView1valorICMS
            end
            item
              Kind = skSum
              Column = cxGrid1DBTableView1valorICMSST
            end
            item
              Kind = skSum
              Column = cxGrid1DBTableView1outrasDespAcessorias
            end
            item
              Kind = skSum
              Column = cxGrid1DBTableView1valorSeguro
            end
            item
              Kind = skSum
              Column = cxGrid1DBTableView1total
            end
            item
              Kind = skSum
            end
            item
              Kind = skSum
              Column = cxGrid1DBTableView1valorTotal
            end>
          DataController.Summary.SummaryGroups = <>
          OptionsData.Inserting = False
          OptionsView.GroupByBox = False
          object cxGrid1DBTableView1ordem: TcxGridDBColumn
            Caption = '#'
            DataBinding.FieldName = 'ordem'
            Options.Editing = False
            Width = 37
          end
          object cxGrid1DBTableView1codigo: TcxGridDBColumn
            Caption = 'C'#243'd.'
            DataBinding.FieldName = 'codigo'
            Options.Editing = False
            Width = 51
          end
          object cxGrid1DBTableView1descricao: TcxGridDBColumn
            Caption = 'Descri'#231#227'o do produto'
            DataBinding.FieldName = 'descricao'
            Options.Editing = False
            Width = 215
          end
          object cxGrid1DBTableView1CFOP: TcxGridDBColumn
            DataBinding.FieldName = 'CFOP'
            Width = 42
          end
          object cxGrid1DBTableView1CST: TcxGridDBColumn
            DataBinding.FieldName = 'CST'
            Width = 35
          end
          object cxGrid1DBTableView1quantidade: TcxGridDBColumn
            Caption = 'Qtde'
            DataBinding.FieldName = 'quantidade'
            Width = 52
          end
          object cxGrid1DBTableView1descUnidade: TcxGridDBColumn
            Caption = 'Unidade de medida'
            DataBinding.FieldName = 'descUnidade'
            Options.Editing = False
            Width = 104
          end
          object cxGrid1DBTableView1preco: TcxGridDBColumn
            Caption = 'Pre'#231'o'
            DataBinding.FieldName = 'preco'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Properties.Alignment.Horz = taRightJustify
            Properties.DecimalPlaces = 5
            Properties.DisplayFormat = 'R$ ,0.0000000;-R$ ,0.000000'
            Properties.OnEditValueChanged = cxGrid1DBTableView1precoPropertiesEditValueChanged
            Width = 102
          end
          object cxGrid1DBTableView1total: TcxGridDBColumn
            Caption = 'Subtotal'
            DataBinding.FieldName = 'total'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Properties.Alignment.Horz = taRightJustify
            Options.Editing = False
            Width = 81
          end
          object cxGrid1DBTableView1desconto: TcxGridDBColumn
            Caption = 'Desconto'
            DataBinding.FieldName = 'desconto'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Properties.Alignment.Horz = taRightJustify
            Properties.OnEditValueChanged = cxGrid1DBTableView1descontoPropertiesEditValueChanged
            Width = 59
          end
          object cxGrid1DBTableView1valorFrete: TcxGridDBColumn
            Caption = 'Frete'
            DataBinding.FieldName = 'valorFrete'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Properties.Alignment.Horz = taRightJustify
            Options.Editing = False
            Width = 50
          end
          object cxGrid1DBTableView1valorIPI: TcxGridDBColumn
            Caption = 'IPI'
            DataBinding.FieldName = 'valorIPI'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Properties.Alignment.Horz = taRightJustify
            Options.Editing = False
            Width = 52
          end
          object cxGrid1DBTableView1valorICMS: TcxGridDBColumn
            Caption = 'ICMS'
            DataBinding.FieldName = 'valorICMS'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Properties.Alignment.Horz = taRightJustify
            Options.Editing = False
            Width = 48
          end
          object cxGrid1DBTableView1valorICMSST: TcxGridDBColumn
            Caption = 'ICMS ST'
            DataBinding.FieldName = 'valorICMSST'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Properties.Alignment.Horz = taRightJustify
            Options.Editing = False
            Width = 57
          end
          object cxGrid1DBTableView1outrasDespAcessorias: TcxGridDBColumn
            Caption = 'Outras desp.'
            DataBinding.FieldName = 'outrasDespAcessorias'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Properties.Alignment.Horz = taRightJustify
            Properties.OnEditValueChanged = cxGrid1DBTableView1outrasDespAcessoriasPropertiesEditValueChanged
            Width = 70
          end
          object cxGrid1DBTableView1valorSeguro: TcxGridDBColumn
            Caption = 'Seguro'
            DataBinding.FieldName = 'valorSeguro'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Properties.Alignment.Horz = taRightJustify
            Options.Editing = False
            Width = 52
          end
          object cxGrid1DBTableView1valorTotal: TcxGridDBColumn
            Caption = 'Total'
            DataBinding.FieldName = 'valorTotal'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Options.Editing = False
            Width = 91
          end
        end
        object cxGrid1Level1: TcxGridLevel
          GridView = cxGrid1DBTableView1
        end
      end
    end
    object panelParcelas: TPanel
      Left = 708
      Top = 0
      Width = 510
      Height = 361
      Align = alRight
      BevelOuter = bvNone
      Color = clWhite
      ParentBackground = False
      TabOrder = 2
      Visible = False
      StyleElements = []
      ExplicitLeft = 704
      ExplicitHeight = 360
      object Panel17: TPanel
        Left = 0
        Top = 0
        Width = 8
        Height = 361
        Align = alLeft
        BevelOuter = bvNone
        Color = clWhite
        ParentBackground = False
        TabOrder = 0
        StyleElements = []
        ExplicitHeight = 360
      end
      object Panel18: TPanel
        Left = 8
        Top = 0
        Width = 502
        Height = 361
        Align = alClient
        BevelOuter = bvNone
        Color = clWhite
        ParentBackground = False
        TabOrder = 1
        StyleElements = []
        ExplicitHeight = 360
        object Panel20: TPanel
          Tag = 99
          Left = 0
          Top = 0
          Width = 502
          Height = 16
          Align = alTop
          BevelOuter = bvNone
          Caption = 'Parcelas do contas '#224' pagar'
          Color = 7960943
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -13
          Font.Name = 'Roboto'
          Font.Style = [fsBold]
          ParentBackground = False
          ParentFont = False
          TabOrder = 0
          StyleElements = []
        end
        object DBGrid1: TDBGrid
          Left = 0
          Top = 16
          Width = 502
          Height = 268
          Align = alClient
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgCancelOnExit]
          ParentFont = False
          TabOrder = 1
          TitleFont.Charset = ANSI_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -8
          TitleFont.Name = 'Roboto'
          TitleFont.Style = []
          Columns = <
            item
              Expanded = False
              FieldName = 'dataVencimento'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -12
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              Title.Caption = 'Vencimento'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -12
              Title.Font.Name = 'MS Sans Serif'
              Title.Font.Style = [fsBold]
              Width = 112
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'diaSemana'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -12
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              Title.Caption = 'Dia'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -12
              Title.Font.Name = 'MS Sans Serif'
              Title.Font.Style = [fsBold]
              Width = 102
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'numeroControle'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -12
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              Title.Caption = 'Parcela'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -12
              Title.Font.Name = 'MS Sans Serif'
              Title.Font.Style = [fsBold]
              Width = 90
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'valorParcela'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -12
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              Title.Caption = 'Valor (R$)'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -12
              Title.Font.Name = 'MS Sans Serif'
              Title.Font.Style = [fsBold]
              Width = 134
              Visible = True
            end>
        end
        object Panel21: TPanel
          Left = 0
          Top = 340
          Width = 502
          Height = 21
          Align = alBottom
          BevelOuter = bvNone
          Color = clWhite
          ParentBackground = False
          TabOrder = 2
          StyleElements = []
          ExplicitTop = 339
        end
        object Panel22: TPanel
          Left = 0
          Top = 284
          Width = 502
          Height = 56
          Align = alBottom
          BevelOuter = bvNone
          Color = clWhite
          ParentBackground = False
          TabOrder = 3
          StyleElements = []
          ExplicitTop = 283
          object AdvGlassButton1: TAdvGlassButton
            Left = 0
            Top = 6
            Width = 500
            Height = 49
            BackColor = 12615680
            ButtonDirection = bdLeft
            Caption = 'Ocultar parcelas geradas'
            CornerRadius = 0
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -16
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
            OnClick = btSalvarClick
          end
        end
      end
    end
  end
  inherited actlBusca: TJvControlActionList
    Left = 320
    Top = 328
  end
  object tbParcelas: TRxMemoryData
    FieldDefs = <>
    Left = 852
    Top = 136
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
end
