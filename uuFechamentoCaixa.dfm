inherited frmFechamentoCaixa: TfrmFechamentoCaixa
  Left = 435
  Top = 55
  Caption = 'Fechamento de Caixa'
  ClientHeight = 700
  ClientWidth = 996
  ExplicitWidth = 1008
  ExplicitHeight = 738
  TextHeight = 13
  object Panel1: TPanel [2]
    Left = 0
    Top = 0
    Width = 685
    Height = 700
    Align = alLeft
    Caption = #39
    Color = clWhite
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentBackground = False
    ParentFont = False
    TabOrder = 1
    StyleElements = []
    ExplicitHeight = 699
    object Panel4: TPanel
      Tag = 99
      Left = 1
      Top = 1
      Width = 683
      Height = 60
      Align = alTop
      Color = 12615680
      ParentBackground = False
      TabOrder = 0
      StyleElements = []
      object Label1: TLabel
        Left = 1
        Top = 1
        Width = 681
        Height = 30
        Align = alTop
        Alignment = taCenter
        Caption = 'FECHAMENTO DE CAIXA'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -21
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
        Layout = tlCenter
        StyleElements = []
        ExplicitWidth = 243
      end
      object Label2: TLabel
        Left = 1
        Top = 39
        Width = 681
        Height = 20
        Align = alBottom
        Alignment = taCenter
        Caption = 'Informe os valores para cada forma de recebimento'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -15
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
        StyleElements = []
        ExplicitWidth = 362
      end
    end
    object Panel6: TPanel
      Left = 1
      Top = 61
      Width = 683
      Height = 638
      Align = alClient
      Caption = 'Panel6'
      TabOrder = 1
      StyleElements = []
      ExplicitHeight = 637
      object DBCtrlGrid2: TDBCtrlGrid
        Left = 1
        Top = 1
        Width = 681
        Height = 636
        Align = alClient
        ColCount = 4
        Color = clWhite
        DataSource = dm.dsTbFormasPagamento
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Segoe UI'
        Font.Style = []
        PanelHeight = 106
        PanelWidth = 166
        ParentColor = False
        ParentFont = False
        TabOrder = 0
        RowCount = 6
        OnClick = DBCtrlGrid2Click
        OnPaintPanel = DBCtrlGrid2PaintPanel
        ExplicitHeight = 635
      end
    end
  end
  object Panel2: TPanel [3]
    Left = 679
    Top = 0
    Width = 317
    Height = 700
    Align = alRight
    Color = clWhite
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentBackground = False
    ParentFont = False
    TabOrder = 2
    StyleElements = []
    ExplicitLeft = 675
    ExplicitHeight = 699
    object gp_formas: TGroupBox
      Left = 1
      Top = 3
      Width = 311
      Height = 336
      Caption = 'Informe os valores encontrados:'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentBackground = False
      ParentColor = False
      ParentFont = False
      TabOrder = 0
      object Label13: TLabel
        Left = 5
        Top = 25
        Width = 28
        Height = 17
        Caption = 'C'#243'd:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
        StyleElements = []
      end
      object Label14: TLabel
        Left = 243
        Top = 24
        Width = 32
        Height = 17
        Caption = 'Valor'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
        StyleElements = []
      end
      object btPesqFormaPagto: TSpeedButton
        Left = 42
        Top = 40
        Width = 22
        Height = 23
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
        OnClick = botao_pesquisaClick
      end
      object Label3: TLabel
        Left = 160
        Top = 284
        Width = 145
        Height = 20
        Caption = 'Total do fechamento'
        Font.Charset = ANSI_CHARSET
        Font.Color = clSilver
        Font.Height = -15
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
        StyleElements = []
      end
      object edCodFormaPagamento: TEdit
        Left = 5
        Top = 42
        Width = 35
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        OnEnter = Edit1Enter
        OnExit = edCodFormaPagamentoExit
        OnKeyDown = Edit1KeyDown
      end
      object ed_valor_forma: TCurrencyEdit
        Left = 242
        Top = 41
        Width = 62
        Height = 21
        AutoSize = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
        OnEnter = Edit1Enter
        OnExit = Edit1Exit
        OnKeyDown = Edit1KeyDown
      end
      object Panel3: TPanel
        Left = 3
        Top = 65
        Width = 306
        Height = 211
        BevelOuter = bvNone
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 2
        StyleElements = []
        object DBGrid1: TDBGrid
          Tag = 99
          Left = 0
          Top = 0
          Width = 320
          Height = 210
          Color = 12615680
          DataSource = dsFormasPagtoTemp
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -16
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          Options = [dgEditing, dgColumnResize, dgTabs, dgConfirmDelete, dgCancelOnExit]
          ParentFont = False
          PopupMenu = PopupMenu1
          ReadOnly = True
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -13
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = [fsBold]
          Columns = <
            item
              Expanded = False
              FieldName = 'descricaoForma'
              Width = 180
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'valorForma'
              Width = 103
              Visible = True
            end>
        end
      end
      object edTotalCaixa: TJvValidateEdit
        Left = 51
        Top = 302
        Width = 254
        Height = 28
        TabStop = False
        StyleElements = []
        BevelInner = bvNone
        BevelOuter = bvNone
        BorderStyle = bsNone
        Color = clWhite
        CriticalPoints.MaxValueIncluded = False
        CriticalPoints.MinValueIncluded = False
        DisplayFormat = dfCurrency
        DecimalPlaces = 2
        EditText = '1325,02'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -21
        Font.Name = 'Segoe UI Semibold'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 3
      end
    end
    object Panel5: TPanel
      Left = 1
      Top = 600
      Width = 315
      Height = 99
      Align = alBottom
      Color = clWhite
      ParentBackground = False
      TabOrder = 1
      StyleElements = []
      ExplicitTop = 599
      object btFecharCaixa: TAdvGlassButton
        Left = 1
        Top = 40
        Width = 153
        Height = 55
        BackColor = 12615680
        ButtonDirection = bdLeft
        Caption = 'Confirmar fechamento'
        CornerRadius = 0
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
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
        OnClick = btFecharCaixaClick
      end
      object AdvGlassButton3: TAdvGlassButton
        Left = 155
        Top = 40
        Width = 153
        Height = 55
        BackColor = 12615680
        ButtonDirection = bdLeft
        Caption = 'Cancelar e sair'
        CornerRadius = 0
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
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
        OnClick = AdvGlassButton3Click
      end
    end
    object AdvSmoothTouchKeyBoard1: TAdvSmoothTouchKeyBoard
      AlignWithMargins = True
      Left = 19
      Top = 345
      Width = 282
      Height = 283
      Text = ''
      AutoCompletion.Font.Charset = DEFAULT_CHARSET
      AutoCompletion.Font.Color = clWhite
      AutoCompletion.Font.Height = -19
      AutoCompletion.Font.Name = 'Tahoma'
      AutoCompletion.Font.Style = []
      AutoCompletion.Color = clBlack
      Fill.ColorMirror = clNone
      Fill.ColorMirrorTo = clNone
      Fill.GradientType = gtVertical
      Fill.GradientMirrorType = gtSolid
      Fill.BorderColor = clNone
      Fill.Rounding = 0
      Fill.ShadowOffset = 0
      Fill.Glow = gmNone
      KeyboardType = ktCustom
      Keys = <
        item
          Caption = '7'
          KeyValue = -1
          ShiftKeyValue = -1
          AltGrKeyValue = -1
          SpecialKey = skNone
          BorderColor = clGray
          Color = 12615680
          X = 0
          Y = 0
          Height = 70
          Width = 70
          SubKeys = <>
        end
        item
          Caption = '4'
          KeyValue = -1
          ShiftKeyValue = -1
          AltGrKeyValue = -1
          SpecialKey = skNone
          BorderColor = clGray
          Color = 12615680
          X = 0
          Y = 70
          Height = 70
          Width = 70
          SubKeys = <>
        end
        item
          Caption = '1'
          KeyValue = -1
          ShiftKeyValue = -1
          AltGrKeyValue = -1
          SpecialKey = skNone
          BorderColor = clGray
          Color = 12615680
          X = 0
          Y = 140
          Height = 70
          Width = 70
          SubKeys = <>
        end
        item
          Caption = '8'
          KeyValue = -1
          ShiftKeyValue = -1
          AltGrKeyValue = -1
          SpecialKey = skNone
          BorderColor = clGray
          Color = 12615680
          X = 70
          Y = 0
          Height = 70
          Width = 70
          SubKeys = <>
        end
        item
          Caption = '5'
          KeyValue = -1
          ShiftKeyValue = -1
          AltGrKeyValue = -1
          SpecialKey = skNone
          BorderColor = clGray
          Color = 12615680
          X = 70
          Y = 70
          Height = 70
          Width = 70
          SubKeys = <>
        end
        item
          Caption = '2'
          KeyValue = -1
          ShiftKeyValue = -1
          AltGrKeyValue = -1
          SpecialKey = skNone
          BorderColor = clGray
          Color = 12615680
          X = 70
          Y = 140
          Height = 70
          Width = 70
          SubKeys = <>
        end
        item
          Caption = '9'
          KeyValue = -1
          ShiftKeyValue = -1
          AltGrKeyValue = -1
          SpecialKey = skNone
          BorderColor = clGray
          Color = 12615680
          X = 140
          Y = 0
          Height = 70
          Width = 70
          SubKeys = <>
        end
        item
          Caption = 'Apagar'
          KeyValue = 8
          ShiftKeyValue = -1
          AltGrKeyValue = -1
          SpecialKey = skBackSpace
          BorderColor = clGray
          Color = 12615680
          X = 210
          Y = 0
          Height = 70
          Width = 70
          SubKeys = <>
        end
        item
          Caption = '.'
          KeyValue = -1
          ShiftKeyValue = -1
          AltGrKeyValue = -1
          SpecialKey = skNone
          BorderColor = clGray
          Color = 12615680
          X = 210
          Y = 70
          Height = 70
          Width = 70
          SubKeys = <>
        end
        item
          Caption = '6'
          KeyValue = -1
          ShiftKeyValue = -1
          AltGrKeyValue = -1
          SpecialKey = skNone
          BorderColor = clGray
          Color = 12615680
          X = 140
          Y = 70
          Height = 70
          Width = 70
          SubKeys = <>
        end
        item
          Caption = '3'
          KeyValue = -1
          ShiftKeyValue = -1
          AltGrKeyValue = -1
          SpecialKey = skNone
          BorderColor = clGray
          Color = 12615680
          X = 140
          Y = 140
          Height = 70
          Width = 70
          SubKeys = <>
        end
        item
          Caption = ','
          KeyValue = -1
          ShiftKeyValue = -1
          AltGrKeyValue = -1
          SpecialKey = skNone
          BorderColor = clGray
          Color = 12615680
          X = 140
          Y = 210
          Height = 70
          Width = 70
          SubKeys = <>
        end
        item
          Caption = '0'
          KeyValue = -1
          ShiftKeyValue = -1
          AltGrKeyValue = -1
          SpecialKey = skNone
          BorderColor = clGray
          Color = 12615680
          X = 0
          Y = 210
          Height = 70
          Width = 140
          SubKeys = <>
        end
        item
          Caption = 'Entra'
          KeyValue = 13
          ShiftKeyValue = 13
          AltGrKeyValue = 13
          SpecialKey = skReturn
          BorderColor = clGray
          Color = 12615680
          X = 210
          Y = 140
          Height = 140
          Width = 70
          SubKeys = <>
        end>
      SmallFont.Charset = DEFAULT_CHARSET
      SmallFont.Color = clWindowText
      SmallFont.Height = -9
      SmallFont.Name = 'Tahoma'
      SmallFont.Style = []
      Version = '1.9.3.0'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -21
      Font.Name = 'MS Sans Serif'
      Font.Style = []
    end
  end
  object Panel13: TPanel [4]
    Tag = 99
    Left = 748
    Top = 26
    Width = 175
    Height = 41
    BevelOuter = bvNone
    Color = clWhite
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentBackground = False
    ParentFont = False
    TabOrder = 3
    StyleElements = []
    object Label43: TLabel
      Tag = 99
      Left = 1
      Top = 1
      Width = 123
      Height = 17
      Caption = 'Descri'#231#227'o da forma:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
      StyleElements = []
    end
    object edDescricaoForma: TEdit
      Tag = 99
      Left = 2
      Top = 18
      Width = 170
      Height = 21
      CharCase = ecUpperCase
      Color = 12615680
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      MaxLength = 3
      ParentFont = False
      TabOrder = 0
      OnEnter = Edit1Exit
      OnExit = Edit1Exit
    end
  end
  object tbFormasPagamentoTemp: TRxMemoryData
    Active = True
    FieldDefs = <
      item
        Name = 'codForma'
        DataType = ftString
        Size = 3
      end
      item
        Name = 'descricaoForma'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'valorForma'
        DataType = ftCurrency
      end>
    Left = 283
    Top = 38
    object tbFormasPagamentoTempcodForma: TStringField
      DisplayWidth = 7
      FieldName = 'codForma'
      Size = 3
    end
    object tbFormasPagamentoTempdescricaoForma: TStringField
      DisplayWidth = 14
      FieldName = 'descricaoForma'
      Size = 15
    end
    object tbFormasPagamentoTempvalorForma: TCurrencyField
      DisplayWidth = 10
      FieldName = 'valorForma'
    end
  end
  object dsFormasPagtoTemp: TDataSource
    DataSet = tbFormasPagamentoTemp
    Left = 257
    Top = 38
  end
  object IBTransaction1: TIBTransaction
    Left = 321
    Top = 125
  end
  object PopupMenu1: TPopupMenu
    Left = 469
    Top = 284
    object E1: TMenuItem
      Caption = 'Excluir lan'#231'amento'
      OnClick = E1Click
    end
  end
end
