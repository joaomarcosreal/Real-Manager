object frm_consulta_produtos: Tfrm_consulta_produtos
  Left = 120
  Top = 21
  BorderIcons = []
  Caption = 'Consulta de produtos'
  ClientHeight = 717
  ClientWidth = 1015
  Color = 10930928
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Position = poScreenCenter
  OnActivate = FormActivate
  TextHeight = 13
  object Panel2: TPanel
    Left = 0
    Top = 637
    Width = 1015
    Height = 80
    Align = alBottom
    BevelOuter = bvNone
    BevelWidth = 2
    Color = clWhite
    ParentBackground = False
    TabOrder = 0
    StyleElements = []
    DesignSize = (
      1015
      80)
    object btSelecionar: TAdvGlassButton
      Left = 685
      Top = 4
      Width = 156
      Height = 80
      Anchors = [akTop, akRight, akBottom]
      BackColor = 12615680
      ButtonDirection = bdLeft
      Caption = 'Selecionar'
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
        89504E470D0A1A0A0000000D49484452000000300000003008060000005702F9
        87000000097048597300000B1300000B1301009A9C1800000213494441546881
        ED98BD4EDB501840CF05A20A95295495FA00DD2A5E804A556020AA3A1190BAF1
        067D84EA52091EA05BA73E04940C402811E9C4C8C4002312738854906206B801
        C3756CDF3F5BC267B5E5EF1CD9B23F192A2A2ACACB46F75DDA2913213C8C583F
        5CE36678863CF832EE3411CA2717EB876B44D16FEEFCAE216A211BDBBA53CB17
        1097572446942B402FAFD046942760BCBCE259443902B2C92B6211C507E49357
        8C228A0D3093575C43D49A74ED94193B79804910D3C5DC017B79801DEA83E5F0
        010EE5F9F6F97FFA2AF1EBB86631288E637948DB8564778E8BFE29F2E0A3C5C0
        3B3CC833F662B23B07C37DE00D70055113D938321AEB499EC40BC6E51566111E
        E541F708E9E5015E8368E77A9C9CC88B3F49F2F03420595E3103A2CD8FCE7CEA
        5C67F257AD247962174F977F4C9F896193EF0B3DEDD140F28C06E49357E82302
        CA03084379451FC412F2D33F20B83C8040FEED000DF381F71182F7A1E501A6A0
        F6156EF6810F86536720DA25629AC0F28C06CADE5BCB084BCCE421F6162A2C62
        9BFA60C5441E9EDEF2F01156F2A07B66C34558CB43E22EE43DC2893C8CDD46BD
        45389387B4D79EFB08A7F290E5BDED2EC2B93C64F93B2DE72FA1B6089C58CCD9
        F2210F79BE9CE677628BFA60D5873CE4FDF4E78FF02A0F26BB4BF608EFF260BA
        7CA5470491079BED313922983CD8FE9D7E1E11541E5CFC5E7F88380F2DEF8ECD
        BD597EEEBC2A5AA3A2E225720BDBD651C5905884140000000049454E44AE4260
        82}
      ParentFont = False
      ShineColor = clWhite
      TabOrder = 0
      Version = '1.3.3.1'
      OnClick = btSelecionarClick
    end
    object btSair: TAdvGlassButton
      Left = 847
      Top = 0
      Width = 156
      Height = 80
      Anchors = [akTop, akRight, akBottom]
      BackColor = 12615680
      ButtonDirection = bdLeft
      Caption = 'Sair'
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
        89504E470D0A1A0A0000000D49484452000000300000003008060000005702F9
        87000000097048597300000B1300000B1301009A9C1800000376494441546881
        ED995188545518C77FDFDDD5D9CC047D30A284357DD95D7B9185E82167AE9B06
        45482F2224A446C882BAE58A286CEE9988C0347595500423F021DA205C88C81C
        98B999B1E23E44E12EB5966852126514BAE36C33F7EB61677337C6BD77E6DE71
        46B8BFC77BBEF37DDFFF7CE79C7BCF3D101111715F239E16AA42F2CB03A02B41
        FE0C2FB42A7001F44D8C7DB3522F8D9E1649A71378AD18B4F850CE01F94A8316
        B1804E9066606DA54EBC05C01AE017D093201B8087419B413F80C6F7314FFF54
        69708CB30F745BC5FD9918050F2406328AB177F1C8DC45A02F827C03B21B0A3F
        629C1426BD0E936E2A3FBC7B0B985D7EBF3BF8A9C01D36B7FF039C024E61D28F
        011B8057403E046E60D227B1AC13EC897F1724A972F05181BB60EC6B18FB2D88
        2F015D057A06A41357BFC564CE93CCBCCADEAF1E0A31D792542E6012232EC64E
        61EC75A08F82BE0ECC45394E36FF2B49A73B789A7727B880A918FB778C7D88DE
        F832D0A78007515E0835C6FF286F0DF8454481418CE354C5FF14C2AD400D8804
        D49AEAAC8100341DFCE1712DE43FC7952DB99D2D5F78D9D75D056EFFF5F775E0
        26960EC4DE1959ED655F770230ED63394B9F0146FC88A8E9146A687860B135BB
        096BDF70665A430140C614452C3D1DDB3FBC3AB7A3F54C291FF5578132A96905
        0A85ECE542F6369844625AC3818B0B622E290170E5D9DCCE9692A30FF55881C3
        A3F362AEA480165C59E3B513855281A6772F76A0AC903C27B2BBDAAE06F115CB
        8F2F0499EF27790849802AAD203DDA484F6CFFC8A76AD133BEBDA5A233416E7B
        DB2560B15FFB50A6506E47DB114B0ACD026F833E29AA9BC2F0EB87D01671B6FB
        899F8137E857C3F07FA7FFAA13FE2EB4560AA1FB9C81FADB85CA2412506B2201
        B5C687001D039D559DF0320B180FE2C17B1B151940F51826F331681FBD8973C5
        BF0E3ED03800C6C9946813603930E03BDB12785760CF8AE34037D0017296A433
        44D27999C39FC58204065CE028047B6B7BDF0F4C6286E6C0ADF5A05D402BF01B
        700CF428C6BE5EBA4F71E44D3C1124C999F02F6012552199E900E9029E67E29E
        E023D03E8C3D34CDF61E0828FF536262FEA7801426BD14642BB011643D26F335
        481FB89F60ECA01720FED209C58B199C87E436A2BA1558025C037D0FE425903F
        EA6B0ACD447F7F03230B9F43A50BB4A3F8F40A26D11C6A9C29842B602A26BD0C
        D882C8F7F4260E562D4E4444C4FDCDBF348114F25C30462F0000000049454E44
        AE426082}
      ParentFont = False
      ShineColor = clWhite
      TabOrder = 1
      Version = '1.3.3.1'
      OnClick = btSairClick
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 0
    Width = 1015
    Height = 3
    Align = alTop
    BevelWidth = 2
    TabOrder = 1
    StyleElements = []
  end
  object Panel4: TPanel
    Left = 0
    Top = 65
    Width = 1015
    Height = 61
    Align = alTop
    BevelWidth = 2
    Color = clWhite
    ParentBackground = False
    TabOrder = 2
    StyleElements = []
    object Label3: TLabel
      Left = 6
      Top = 5
      Width = 276
      Height = 13
      Caption = 'Digite as iniciais do produto ou c'#243'digo de barras'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object SpeedButton1: TSpeedButton
      Left = 932
      Top = 15
      Width = 49
      Height = 41
      Flat = True
      Glyph.Data = {
        36100000424D3610000000000000360000002800000020000000200000000100
        2000000000000010000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        000000000000000000000000000000000000000000000000000000000000D6BB
        8D38D5BD8D55D5BD8D55D5BD8D55D5BD8D55D5BD8D55D5BD8D55D5BD8D55D5BD
        8D55D5BD8D55D5BD8D55D5BD8D55D5BD8D55D5BD8D55D5BD8D55D5BD8D55D5BD
        8D55D5BD8D55D5BD8D55D5BD8D55D5BD8D55D5BD8D55D5BD8D55D5BD8D55D5BD
        8D55D5BD8D55D5BD8D55D5BD8D55D5BD8D55D6BB8D380000000000000000D7BC
        8CABD6BC8CFFD6BC8CFFD6BC8CFFD6BC8CFFD6BC8CFFD6BC8CFFD6BC8CFFD6BC
        8CFFD6BC8CFFD6BC8CFFD6BC8CFFD6BC8CFFD6BC8CFFD6BC8CFFD6BC8CFFD6BC
        8CFFD6BC8CFFD6BC8CFFD6BC8CFFD6BC8CFFD6BC8CFFD6BC8CFFD6BC8CFFD6BC
        8CFFD6BC8CFFD6BC8CFFD6BC8CFFD6BC8CFFD7BC8CAB0000000000000000D7BC
        8CABE4CFA8FFFEF5E1FFFEF5E1FFE4CFA8FFE4CFA8FFFEF5E1FFFEF5E1FFE4CF
        A8FFE4CFA8FFFEF5E1FFFEF5E1FFFEF5E1FFFEF5E1FFFEF5E1FFFEF5E1FFFEF5
        E1FFFEF5E1FFFEF5E1FFFEF5E1FFE4CFA8FFE4CFA8FFFEF5E1FFFEF5E1FFE4CF
        A8FFE4CFA8FFFEF5E1FFFEF5E1FFE4CFA8FFD7BC8CAB0000000000000000D7BC
        8CABE4CFA8FFFEF5E1FFFEF5E1FFE4CFA8FFE4CFA8FFFEF5E1FFFEF5E1FFE4CF
        A8FFE4CFA8FFFEF5E1FFFEF5E1FFFEF5E1FFFEF5E1FFFEF5E1FFFEF5E1FFFEF5
        E1FFFEF5E1FFFEF5E1FFFEF5E1FFE4CFA8FFE4CFA8FFFEF5E1FFFEF5E1FFE4CF
        A8FFE4CFA8FFFEF5E1FFFEF5E1FFE4CFA8FFD7BC8CAB0000000000000000D7BC
        8CABDFC99EFFF0E2C5FFF0E2C5FFDFC99EFFDFC99EFFF0E2C5FFF0E2C5FFDFC9
        9EFFDFC99EFFF0E2C5FFF0E2C5FFF0E2C5FFF0E2C5FFF0E2C5FFF0E2C5FFF0E2
        C5FFF0E2C5FFF0E2C5FFF0E2C5FFDFC99EFFDFC99EFFF0E2C5FFF0E2C5FFDFC9
        9EFFDFC99EFFF0E2C5FFF0E2C5FFDFC99EFFD7BC8CAB0000000000000000D7BC
        8CABD6BC8CFFD6BC8CFFD6BC8CFFD6BC8CFFD6BC8CFFD6BC8CFFD6BC8CFFD6BC
        8CFFD6BC8CFFD6BC8CFFD6BC8CFFD6BC8CFFD6BC8CFFD6BC8CFFD6BC8CFFD6BC
        8CFFD6BC8CFFD6BC8CFFD6BC8CFFD6BC8CFFD6BC8CFFD6BC8CFFD6BC8CFFD6BC
        8CFFD6BC8CFFD6BC8CFFD6BC8CFFD6BC8CFFD7BC8CAB0000000000000000D7BC
        8CABE4CFA8FFFEF5E1FFFEF5E1FFFEF5E1FFFEF5E1FFE4CFA8FFE4CFA8FFFEF5
        E1FFFEF5E1FFE4CFA8FFE4CFA8FFFEF5E1FFFEF5E1FFE4CFA8FFE4CFA8FFFEF5
        E1FFFEF5E1FFE4CFA8FFE4CFA8FFFEF5E1FFFEF5E1FFE4CFA8FFE4CFA8FFFEF5
        E1FFFEF5E1FFFEF5E1FFFEF5E1FFE4CFA8FFD7BC8CAB0000000000000000D7BC
        8CABE4CFA8FFFEF5E1FFFEF5E1FFFEF5E1FFFEF5E1FFE4CFA8FFE4CFA8FFFEF5
        E1FFFEF5E1FFE4CFA8FFE4CFA8FFFEF5E1FFFEF5E1FFE4CFA8FFE4CFA8FFFEF5
        E1FFFEF5E1FFE4CFA8FFE4CFA8FFFEF5E1FFFEF5E1FFE4CFA8FFE4CFA8FFFEF5
        E1FFFEF5E1FFFEF5E1FFFEF5E1FFE4CFA8FFD7BC8CAB0000000000000000D7BC
        8CABDFC99EFFF0E2C5FFF0E2C5FFF0E2C5FFF0E2C5FFDFC99EFFDFC99EFFF0E2
        C5FFF0E2C5FFDFC99EFFDFC99EFFF0E2C5FFF0E2C5FFDFC99EFFDFC99EFFF0E2
        C5FFF0E2C5FFDFC99EFFDFC99EFFF0E2C5FFF0E2C5FFDFC99EFFDFC99EFFF0E2
        C5FFF0E2C5FFF0E2C5FFF0E2C5FFDFC99EFFD7BC8CAB0000000000000000D7BC
        8CABD6BC8CFFD6BC8CFFD6BC8CFFD6BC8CFFD6BC8CFFD6BC8CFFD6BC8CFFD6BC
        8CFFD6BC8CFFD6BC8CFFD6BC8CFFD6BC8CFFD6BC8CFFD6BC8CFFD6BC8CFFD6BC
        8CFFD6BC8CFFD6BC8CFFD6BC8CFFD6BC8CFFD6BC8CFFD6BC8CFFD6BC8CFFD6BC
        8CFFD6BC8CFFD6BC8CFFD6BC8CFFD6BC8CFFD7BC8CAB0000000000000000D7BC
        8CABE4CFA8FFFEF5E1FFFEF5E1FFE4CFA8FFE4CFA8FFFEF5E1FFFEF5E1FFE4CF
        A8FFE4CFA8FFFEF5E1FFFEF5E1FFE4CFA8FFE4CFA8FFFEF5E1FFFEF5E1FFE4CF
        A8FFE4CFA8FFFEF5E1FFFEF5E1FFE4CFA8FFE4CFA8FFFEF5E1FFFEF5E1FFE4CF
        A8FFE4CFA8FFFEF5E1FFFEF5E1FFE4CFA8FFD7BC8CAB0000000000000000D7BC
        8CABE4CFA8FFFEF5E1FFFEF5E1FFE4CFA8FFE4CFA8FFFEF5E1FFFEF5E1FFE4CF
        A8FFE4CFA8FFFEF5E1FFFEF5E1FFE4CFA8FFE4CFA8FFFEF5E1FFFEF5E1FFE4CF
        A8FFE4CFA8FFFEF5E1FFFEF5E1FFE4CFA8FFE4CFA8FFFEF5E1FFFEF5E1FFE4CF
        A8FFE4CFA8FFFEF5E1FFFEF5E1FFE4CFA8FFD7BC8CAB0000000000000000D7BC
        8CABDFC99EFFF0E2C5FFF0E2C5FFDFC99EFFDFC99EFFF0E2C5FFF0E2C5FFDFC9
        9EFFDFC99EFFF0E2C5FFF0E2C5FFDFC99EFFDFC99EFFF0E2C5FFF0E2C5FFDFC9
        9EFFDFC99EFFF0E2C5FFF0E2C5FFDFC99EFFDFC99EFFF0E2C5FFF0E2C5FFDFC9
        9EFFDFC99EFFF0E2C5FFF0E2C5FFDFC99EFFD7BC8CAB0000000000000000D7BC
        8CABD6BC8CFFD6BC8CFFD6BC8CFFD6BC8CFFD6BC8CFFD6BC8CFFD6BC8CFFD6BC
        8CFFD6BC8CFFD6BC8CFFD6BC8CFFD6BC8CFFD6BC8CFFD6BC8CFFD6BC8CFFD6BC
        8CFFD6BC8CFFD6BC8CFFD6BC8CFFD6BC8CFFD6BC8CFFD6BC8CFFD6BC8CFFD6BC
        8CFFD6BC8CFFD6BC8CFFD6BC8CFFD6BC8CFFD7BC8CAB00000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        000000000000000000000000000000000000000000007B6E53A27A6D54B10000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        000000000000000000000000000000000000000000007A6D548C7B6E54CC0000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        000000000000000000000000000000000000000000007B6E55517A6E54FB7C6C
        5521000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        00000000000000000000000000000000000000000000666666057A6E54D57A6E
        54D779705350766D521C80808002000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        00000000000000000000000000000000000000000000000000007B72581D7A6F
        54B67A6E54FD7A6E54FF7A6E54FA7A6E54E07A6D55AF796D553F000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000807050107A6F532E796F544C7B6D54707A6E54C07A6E54FC7B6E544F0000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        000000000000000000000000000000000000000000007A6E54A77A6E54DD0000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        00000000000000000000000000000000000000000000796F53377A6E54FF796B
        5726000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        00000000000000000000000000000000000000000000806D5B0E7A6E54FF7A6F
        5545000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        00000000000000000000000000000000000000000000000000017B6F54557B71
        551B000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000}
      OnClick = SpeedButton1Click
    end
    object ed_descricao_produto: TEdit
      Left = 6
      Top = 20
      Width = 920
      Height = 32
      CharCase = ecUpperCase
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      MaxLength = 30
      ParentFont = False
      TabOrder = 0
      OnChange = ed_descricao_produtoChange
      OnKeyDown = ed_descricao_produtoKeyDown
    end
  end
  object Panel1: TPanel
    Tag = 99
    Left = 0
    Top = 3
    Width = 1015
    Height = 62
    Align = alTop
    Color = 12615680
    ParentBackground = False
    TabOrder = 3
    StyleElements = []
    object lbTitulo: TLabel
      Left = 10
      Top = 6
      Width = 735
      Height = 33
      AutoSize = False
      Caption = 'Consulta de produtos'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -27
      Font.Name = 'Calibri'
      Font.Style = []
      ParentFont = False
      StyleElements = []
    end
  end
  object Panel5: TPanel
    Left = 0
    Top = 126
    Width = 1015
    Height = 281
    Align = alClient
    Color = clWhite
    ParentBackground = False
    TabOrder = 4
    StyleElements = []
    object JvPageList1: TJvPageList
      Left = 1
      Top = 1
      Width = 1013
      Height = 279
      ActivePage = pgTabelaAcessoria
      PropagateEnable = False
      Align = alClient
      object pgTabelaPadrao: TJvStandardPage
        Left = 0
        Top = 0
        Width = 1013
        Height = 279
        Caption = 'pgTabelaPadrao'
        object gridTabelaPadrao: TcxGrid
          Left = 0
          Top = 0
          Width = 1013
          Height = 279
          Hint = 'Essa '#233' a tabela 1'
          Align = alClient
          BevelInner = bvNone
          BevelOuter = bvNone
          BorderStyle = cxcbsNone
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          LookAndFeel.NativeStyle = True
          object gridTabelaPadraoDBTableView1: TcxGridDBTableView
            OnKeyDown = gridTabelaPadraoDBTableView1KeyDown
            Navigator.Buttons.CustomButtons = <>
            ScrollbarAnnotations.CustomAnnotations = <>
            OnCellDblClick = gridTabelaPadraoDBTableView1CellDblClick
            OnCustomDrawCell = gridTabelaPadraoDBTableView1CustomDrawCell
            DataController.DataSource = dm.dsConsultaProdutos
            DataController.Summary.DefaultGroupSummaryItems = <>
            DataController.Summary.FooterSummaryItems = <>
            DataController.Summary.SummaryGroups = <>
            OptionsBehavior.CopyCaptionsToClipboard = False
            OptionsBehavior.CopyRecordsToClipboard = False
            OptionsBehavior.DragHighlighting = False
            OptionsBehavior.DragOpening = False
            OptionsBehavior.DragScrolling = False
            OptionsBehavior.ShowHourglassCursor = False
            OptionsBehavior.ColumnHeaderHints = False
            OptionsBehavior.CopyPreviewToClipboard = False
            OptionsBehavior.ExpandMasterRowOnDblClick = False
            OptionsBehavior.ImmediateEditor = False
            OptionsCustomize.ColumnFiltering = False
            OptionsCustomize.ColumnGrouping = False
            OptionsCustomize.ColumnHidingOnGrouping = False
            OptionsCustomize.ColumnHorzSizing = False
            OptionsCustomize.ColumnMoving = False
            OptionsCustomize.ColumnSorting = False
            OptionsData.CancelOnExit = False
            OptionsData.Deleting = False
            OptionsData.DeletingConfirmation = False
            OptionsData.Editing = False
            OptionsData.Inserting = False
            OptionsSelection.CellSelect = False
            OptionsSelection.HideFocusRectOnExit = False
            OptionsSelection.InvertSelect = False
            OptionsSelection.UnselectFocusedRecordOnExit = False
            OptionsView.NoDataToDisplayInfoText = 'Sem dados para exibir'
            OptionsView.CellAutoHeight = True
            OptionsView.ExpandButtonsForEmptyDetails = False
            OptionsView.GridLineColor = clBlack
            OptionsView.GroupByBox = False
            OptionsView.Indicator = True
            Styles.Content = cxStyle1
            Styles.ContentOdd = cxStyle2
            object gridTabelaPadraoDBTableView1COD_BARRAS: TcxGridDBColumn
              Caption = 'C'#243'digo'
              DataBinding.FieldName = 'COD_BARRAS'
              MinWidth = 50
              Width = 140
            end
            object s: TcxGridDBColumn
              Caption = 'Descri'#231#227'o'
              DataBinding.FieldName = 'DESCRICAO'
              Width = 350
            end
            object gridTabelaPadraoDBTableView1Column2: TcxGridDBColumn
              Caption = 'Estoque'
              DataBinding.FieldName = 'ESTOQUE'
              Width = 200
            end
            object gridTabelaPadraoDBTableView1Column1: TcxGridDBColumn
              Caption = 'Grupo'
              DataBinding.FieldName = 'GRUPO'
              Width = 190
            end
            object gridTabelaPadraoDBTableView1VALOR_UNITARIO: TcxGridDBColumn
              Caption = 'Pre'#231'o'
              DataBinding.FieldName = 'VALOR_UNITARIO'
              Width = 100
            end
          end
          object gridTabelaPadraoLevel1: TcxGridLevel
            GridView = gridTabelaPadraoDBTableView1
          end
        end
      end
      object pgTabelaAcessoria: TJvStandardPage
        Left = 0
        Top = 0
        Width = 1013
        Height = 279
        Caption = 'pgTabelaAcessoria'
        object gridTabelaAcessoria: TcxGrid
          Left = 0
          Top = 0
          Width = 1013
          Height = 279
          Hint = 'Essa '#233' a tabela 1'
          Align = alClient
          BevelInner = bvNone
          BevelOuter = bvNone
          BorderStyle = cxcbsNone
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          LookAndFeel.NativeStyle = True
          object cxGridDBTableView1: TcxGridDBTableView
            OnKeyDown = gridTabelaPadraoDBTableView1KeyDown
            Navigator.Buttons.CustomButtons = <>
            ScrollbarAnnotations.CustomAnnotations = <>
            OnCellDblClick = gridTabelaPadraoDBTableView1CellDblClick
            OnCustomDrawCell = gridTabelaPadraoDBTableView1CustomDrawCell
            DataController.DataSource = dm.dsConsultaProdutos
            DataController.Summary.DefaultGroupSummaryItems = <>
            DataController.Summary.FooterSummaryItems = <>
            DataController.Summary.SummaryGroups = <>
            OptionsBehavior.CopyCaptionsToClipboard = False
            OptionsBehavior.CopyRecordsToClipboard = False
            OptionsBehavior.DragHighlighting = False
            OptionsBehavior.DragOpening = False
            OptionsBehavior.DragScrolling = False
            OptionsBehavior.ShowHourglassCursor = False
            OptionsBehavior.ColumnHeaderHints = False
            OptionsBehavior.CopyPreviewToClipboard = False
            OptionsBehavior.ExpandMasterRowOnDblClick = False
            OptionsBehavior.ImmediateEditor = False
            OptionsCustomize.ColumnFiltering = False
            OptionsCustomize.ColumnGrouping = False
            OptionsCustomize.ColumnHidingOnGrouping = False
            OptionsCustomize.ColumnHorzSizing = False
            OptionsCustomize.ColumnMoving = False
            OptionsCustomize.ColumnSorting = False
            OptionsData.CancelOnExit = False
            OptionsData.Deleting = False
            OptionsData.DeletingConfirmation = False
            OptionsData.Editing = False
            OptionsData.Inserting = False
            OptionsSelection.CellSelect = False
            OptionsSelection.HideFocusRectOnExit = False
            OptionsSelection.InvertSelect = False
            OptionsSelection.UnselectFocusedRecordOnExit = False
            OptionsView.NoDataToDisplayInfoText = 'Sem dados para exibir'
            OptionsView.CellAutoHeight = True
            OptionsView.ExpandButtonsForEmptyDetails = False
            OptionsView.GridLineColor = clBlack
            OptionsView.GroupByBox = False
            OptionsView.Indicator = True
            Styles.Content = cxStyle1
            Styles.ContentOdd = cxStyle2
            object cxGridDBColumn1: TcxGridDBColumn
              Caption = 'C'#243'digo'
              DataBinding.FieldName = 'COD_BARRAS'
              MinWidth = 50
              Width = 80
            end
            object cxGridDBColumn2: TcxGridDBColumn
              Caption = 'Descri'#231#227'o'
              DataBinding.FieldName = 'DESCRICAO'
              Width = 350
            end
            object cxGridDBColumn3: TcxGridDBColumn
              Caption = 'Estoque'
              DataBinding.FieldName = 'ESTOQUE'
              Width = 180
            end
            object cxGridDBColumn4: TcxGridDBColumn
              Caption = 'Grupo'
              DataBinding.FieldName = 'GRUPO'
              Width = 170
            end
            object cxGridDBTableView1Column1: TcxGridDBColumn
              Caption = 'Pre'#231'o padr'#227'o'
              DataBinding.FieldName = 'PRECOPADRAO'
              Width = 100
            end
            object cxGridDBColumn5: TcxGridDBColumn
              Caption = 'Pre'#231'o'
              DataBinding.FieldName = 'VALOR_UNITARIO'
              Width = 100
            end
          end
          object cxGridLevel1: TcxGridLevel
            GridView = cxGridDBTableView1
          end
        end
      end
    end
  end
  object pnTeclado: TPanel
    Left = 0
    Top = 407
    Width = 1015
    Height = 230
    Align = alBottom
    Color = clWhite
    ParentBackground = False
    TabOrder = 5
    Visible = False
    StyleElements = []
    object AdvSmoothTouchKeyBoard1: TAdvSmoothTouchKeyBoard
      Left = 4
      Top = 14
      Width = 1013
      Height = 214
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
      KeyboardType = ktQWERTY
      Keys = <
        item
          KeyCombination = True
          ShiftKeyCombination = True
          Caption = '`'
          ShiftCaption = '~'
          KeyValue = -1
          ShiftKeyValue = -1
          AltGrKeyValue = -1
          SpecialKey = skNone
          X = 2
          Y = 1
          Height = 42
          Width = 67
          SubKeys = <>
        end
        item
          Caption = '1'
          ShiftCaption = '!'
          AltGrCaption = '|'
          KeyValue = -1
          ShiftKeyValue = -1
          AltGrKeyValue = -1
          SpecialKey = skNone
          X = 69
          Y = 1
          Height = 42
          Width = 67
          SubKeys = <>
        end
        item
          Caption = '2'
          ShiftCaption = '@'
          KeyValue = -1
          ShiftKeyValue = -1
          AltGrKeyValue = -1
          SpecialKey = skNone
          X = 137
          Y = 1
          Height = 42
          Width = 67
          SubKeys = <>
        end
        item
          Caption = '3'
          ShiftCaption = '#'
          KeyValue = -1
          ShiftKeyValue = -1
          AltGrKeyValue = -1
          SpecialKey = skNone
          X = 204
          Y = 1
          Height = 42
          Width = 67
          SubKeys = <>
        end
        item
          Caption = '4'
          ShiftCaption = '$'
          KeyValue = -1
          ShiftKeyValue = -1
          AltGrKeyValue = -1
          SpecialKey = skNone
          X = 270
          Y = 1
          Height = 42
          Width = 67
          SubKeys = <>
        end
        item
          Caption = '5'
          ShiftCaption = '%'
          KeyValue = -1
          ShiftKeyValue = -1
          AltGrKeyValue = -1
          SpecialKey = skNone
          X = 338
          Y = 1
          Height = 42
          Width = 67
          SubKeys = <>
        end
        item
          ShiftKeyCombination = True
          Caption = '6'
          ShiftCaption = '^'
          KeyValue = -1
          ShiftKeyValue = -1
          AltGrKeyValue = -1
          SpecialKey = skNone
          X = 405
          Y = 1
          Height = 42
          Width = 67
          SubKeys = <>
        end
        item
          Caption = '7'
          ShiftCaption = '&'
          KeyValue = -1
          ShiftKeyValue = -1
          AltGrKeyValue = -1
          SpecialKey = skNone
          X = 473
          Y = 1
          Height = 42
          Width = 67
          SubKeys = <>
        end
        item
          Caption = '8'
          ShiftCaption = '*'
          KeyValue = -1
          ShiftKeyValue = -1
          AltGrKeyValue = -1
          SpecialKey = skNone
          X = 540
          Y = 1
          Height = 42
          Width = 67
          SubKeys = <>
        end
        item
          Caption = '9'
          ShiftCaption = '('
          KeyValue = -1
          ShiftKeyValue = -1
          AltGrKeyValue = -1
          SpecialKey = skNone
          X = 608
          Y = 1
          Height = 42
          Width = 67
          SubKeys = <>
        end
        item
          Caption = '0'
          ShiftCaption = ')'
          KeyValue = -1
          ShiftKeyValue = -1
          AltGrKeyValue = -1
          SpecialKey = skNone
          X = 675
          Y = 1
          Height = 42
          Width = 67
          SubKeys = <>
        end
        item
          Caption = '-'
          ShiftCaption = '_'
          KeyValue = -1
          ShiftKeyValue = -1
          AltGrKeyValue = -1
          SpecialKey = skNone
          X = 743
          Y = 1
          Height = 42
          Width = 67
          SubKeys = <>
        end
        item
          Caption = '='
          ShiftCaption = '+'
          KeyValue = -1
          ShiftKeyValue = -1
          AltGrKeyValue = -1
          SpecialKey = skNone
          X = 809
          Y = 1
          Height = 42
          Width = 67
          SubKeys = <>
        end
        item
          Caption = '\'
          ShiftCaption = '|'
          KeyValue = -1
          ShiftKeyValue = -1
          AltGrKeyValue = -1
          SpecialKey = skNone
          X = 876
          Y = 1
          Height = 42
          Width = 67
          SubKeys = <>
        end
        item
          Caption = 'Back'
          KeyValue = 8
          ShiftKeyValue = -1
          AltGrKeyValue = -1
          SpecialKey = skBackSpace
          Color = 10526880
          X = 944
          Y = 1
          Height = 42
          Width = 67
          SubKeys = <>
        end
        item
          Caption = '->'
          ShiftCaption = '<-'
          KeyValue = 9
          ShiftKeyValue = -1
          AltGrKeyValue = -1
          SpecialKey = skTab
          Color = 10526880
          X = 2
          Y = 43
          Height = 42
          Width = 101
          SubKeys = <>
        end
        item
          Caption = 'Q'
          KeyValue = -1
          ShiftKeyValue = -1
          AltGrKeyValue = -1
          SpecialKey = skNone
          X = 103
          Y = 43
          Height = 42
          Width = 67
          SubKeys = <>
        end
        item
          Caption = 'W'
          KeyValue = -1
          ShiftKeyValue = -1
          AltGrKeyValue = -1
          SpecialKey = skNone
          X = 170
          Y = 43
          Height = 42
          Width = 67
          SubKeys = <>
        end
        item
          Caption = 'E'
          KeyValue = -1
          ShiftKeyValue = -1
          AltGrKeyValue = -1
          SpecialKey = skNone
          X = 238
          Y = 43
          Height = 42
          Width = 67
          SubKeys = <
            item
              Caption = #203
            end
            item
              Caption = #202
            end
            item
              Caption = #201
            end
            item
              Caption = #200
            end
            item
              Caption = #235
            end
            item
              Caption = #234
            end
            item
              Caption = #233
            end
            item
              Caption = #232
            end>
        end
        item
          Caption = 'R'
          KeyValue = -1
          ShiftKeyValue = -1
          AltGrKeyValue = -1
          SpecialKey = skNone
          X = 304
          Y = 43
          Height = 42
          Width = 67
          SubKeys = <>
        end
        item
          Caption = 'T'
          KeyValue = -1
          ShiftKeyValue = -1
          AltGrKeyValue = -1
          SpecialKey = skNone
          X = 372
          Y = 43
          Height = 42
          Width = 67
          SubKeys = <>
        end
        item
          Caption = 'Y'
          KeyValue = -1
          ShiftKeyValue = -1
          AltGrKeyValue = -1
          SpecialKey = skNone
          X = 439
          Y = 43
          Height = 42
          Width = 67
          SubKeys = <
            item
              Caption = #255
            end
            item
              Caption = #221
            end
            item
              Caption = #253
            end>
        end
        item
          Caption = 'U'
          KeyValue = -1
          ShiftKeyValue = -1
          AltGrKeyValue = -1
          SpecialKey = skNone
          X = 507
          Y = 43
          Height = 42
          Width = 67
          SubKeys = <
            item
              Caption = #220
            end
            item
              Caption = #219
            end
            item
              Caption = #218
            end
            item
              Caption = #217
            end
            item
              Caption = #252
            end
            item
              Caption = #251
            end
            item
              Caption = #250
            end
            item
              Caption = #249
            end>
        end
        item
          Caption = 'I'
          KeyValue = -1
          ShiftKeyValue = -1
          AltGrKeyValue = -1
          SpecialKey = skNone
          X = 574
          Y = 43
          Height = 42
          Width = 67
          SubKeys = <
            item
              Caption = #207
            end
            item
              Caption = #206
            end
            item
              Caption = #205
            end
            item
              Caption = #204
            end
            item
              Caption = #239
            end
            item
              Caption = #238
            end
            item
              Caption = #237
            end
            item
              Caption = #236
            end>
        end
        item
          Caption = 'O'
          KeyValue = -1
          ShiftKeyValue = -1
          AltGrKeyValue = -1
          SpecialKey = skNone
          X = 641
          Y = 43
          Height = 42
          Width = 67
          SubKeys = <
            item
              Caption = #214
            end
            item
              Caption = #212
            end
            item
              Caption = #211
            end
            item
              Caption = #210
            end
            item
              Caption = #246
            end
            item
              Caption = #244
            end
            item
              Caption = #243
            end
            item
              Caption = #242
            end>
        end
        item
          Caption = 'P'
          KeyValue = -1
          ShiftKeyValue = -1
          AltGrKeyValue = -1
          SpecialKey = skNone
          X = 709
          Y = 43
          Height = 42
          Width = 67
          SubKeys = <>
        end
        item
          Caption = '['
          ShiftCaption = '{'
          KeyValue = -1
          ShiftKeyValue = -1
          AltGrKeyValue = -1
          SpecialKey = skNone
          X = 775
          Y = 43
          Height = 42
          Width = 67
          SubKeys = <>
        end
        item
          Caption = ']'
          ShiftCaption = '}'
          KeyValue = -1
          ShiftKeyValue = -1
          AltGrKeyValue = -1
          SpecialKey = skNone
          X = 843
          Y = 43
          Height = 42
          Width = 67
          SubKeys = <>
        end
        item
          Caption = 'Enter'
          KeyValue = 13
          ShiftKeyValue = 0
          AltGrKeyValue = 0
          SpecialKey = skReturn
          Color = 10526880
          X = 927
          Y = 43
          Height = 85
          Width = 84
          SubKeys = <>
        end
        item
          Caption = 'Caps Lock'
          KeyValue = 20
          ShiftKeyValue = 0
          AltGrKeyValue = 0
          SpecialKey = skCaps
          Color = 10526880
          X = 2
          Y = 86
          Height = 42
          Width = 118
          SubKeys = <>
        end
        item
          Caption = 'A'
          KeyValue = -1
          ShiftKeyValue = -1
          AltGrKeyValue = -1
          SpecialKey = skNone
          X = 120
          Y = 86
          Height = 42
          Width = 67
          SubKeys = <
            item
              Caption = #196
            end
            item
              Caption = #194
            end
            item
              Caption = #193
            end
            item
              Caption = #192
            end
            item
              Caption = #228
            end
            item
              Caption = #226
            end
            item
              Caption = #225
            end
            item
              Caption = #224
            end>
        end
        item
          Caption = 'S'
          KeyValue = -1
          ShiftKeyValue = -1
          AltGrKeyValue = -1
          SpecialKey = skNone
          X = 187
          Y = 86
          Height = 42
          Width = 67
          SubKeys = <>
        end
        item
          Caption = 'D'
          KeyValue = -1
          ShiftKeyValue = -1
          AltGrKeyValue = -1
          SpecialKey = skNone
          X = 254
          Y = 86
          Height = 42
          Width = 67
          SubKeys = <>
        end
        item
          Caption = 'F'
          KeyValue = -1
          ShiftKeyValue = -1
          AltGrKeyValue = -1
          SpecialKey = skNone
          X = 321
          Y = 86
          Height = 42
          Width = 67
          SubKeys = <>
        end
        item
          Caption = 'G'
          KeyValue = -1
          ShiftKeyValue = -1
          AltGrKeyValue = -1
          SpecialKey = skNone
          X = 388
          Y = 86
          Height = 42
          Width = 67
          SubKeys = <>
        end
        item
          Caption = 'H'
          KeyValue = -1
          ShiftKeyValue = -1
          AltGrKeyValue = -1
          SpecialKey = skNone
          X = 456
          Y = 86
          Height = 42
          Width = 67
          SubKeys = <>
        end
        item
          Caption = 'J'
          KeyValue = -1
          ShiftKeyValue = -1
          AltGrKeyValue = -1
          SpecialKey = skNone
          X = 523
          Y = 86
          Height = 42
          Width = 67
          SubKeys = <>
        end
        item
          Caption = 'K'
          KeyValue = -1
          ShiftKeyValue = -1
          AltGrKeyValue = -1
          SpecialKey = skNone
          X = 591
          Y = 86
          Height = 42
          Width = 67
          SubKeys = <>
        end
        item
          Caption = 'L'
          KeyValue = -1
          ShiftKeyValue = -1
          AltGrKeyValue = -1
          SpecialKey = skNone
          X = 658
          Y = 86
          Height = 42
          Width = 67
          SubKeys = <>
        end
        item
          Caption = ';'
          ShiftCaption = ':'
          KeyValue = -1
          ShiftKeyValue = -1
          AltGrKeyValue = -1
          SpecialKey = skNone
          X = 726
          Y = 86
          Height = 42
          Width = 67
          SubKeys = <>
        end
        item
          Caption = ','
          ShiftCaption = '"'
          KeyValue = -1
          ShiftKeyValue = -1
          AltGrKeyValue = -1
          SpecialKey = skNone
          X = 792
          Y = 86
          Height = 42
          Width = 67
          SubKeys = <>
        end
        item
          Caption = 'Shift'
          KeyValue = 160
          ShiftKeyValue = -1
          AltGrKeyValue = -1
          SpecialKey = skShift
          Color = 10526880
          X = 2
          Y = 128
          Height = 42
          Width = 135
          SubKeys = <>
        end
        item
          Caption = 'Z'
          KeyValue = -1
          ShiftKeyValue = -1
          AltGrKeyValue = -1
          SpecialKey = skNone
          X = 137
          Y = 128
          Height = 42
          Width = 67
          SubKeys = <>
        end
        item
          Caption = 'X'
          KeyValue = -1
          ShiftKeyValue = -1
          AltGrKeyValue = -1
          SpecialKey = skNone
          X = 204
          Y = 128
          Height = 42
          Width = 67
          SubKeys = <>
        end
        item
          Caption = 'C'
          KeyValue = -1
          ShiftKeyValue = -1
          AltGrKeyValue = -1
          SpecialKey = skNone
          X = 270
          Y = 128
          Height = 42
          Width = 67
          SubKeys = <
            item
              Caption = #231
            end>
        end
        item
          Caption = 'V'
          KeyValue = -1
          ShiftKeyValue = -1
          AltGrKeyValue = -1
          SpecialKey = skNone
          X = 338
          Y = 128
          Height = 42
          Width = 67
          SubKeys = <>
        end
        item
          Caption = 'B'
          KeyValue = -1
          ShiftKeyValue = -1
          AltGrKeyValue = -1
          SpecialKey = skNone
          X = 405
          Y = 128
          Height = 42
          Width = 67
          SubKeys = <>
        end
        item
          Caption = 'N'
          KeyValue = -1
          ShiftKeyValue = -1
          AltGrKeyValue = -1
          SpecialKey = skNone
          X = 473
          Y = 128
          Height = 42
          Width = 67
          SubKeys = <
            item
              Caption = #209
            end
            item
              Caption = #241
            end>
        end
        item
          Caption = 'M'
          KeyValue = -1
          ShiftKeyValue = -1
          AltGrKeyValue = -1
          SpecialKey = skNone
          X = 540
          Y = 128
          Height = 42
          Width = 67
          SubKeys = <>
        end
        item
          Caption = ','
          ShiftCaption = '<'
          KeyValue = -1
          ShiftKeyValue = -1
          AltGrKeyValue = -1
          SpecialKey = skNone
          X = 608
          Y = 128
          Height = 42
          Width = 67
          SubKeys = <>
        end
        item
          Caption = '.'
          ShiftCaption = '>'
          KeyValue = -1
          ShiftKeyValue = -1
          AltGrKeyValue = -1
          SpecialKey = skNone
          X = 675
          Y = 128
          Height = 42
          Width = 67
          SubKeys = <>
        end
        item
          Caption = '/'
          ShiftCaption = '?'
          KeyValue = -1
          ShiftKeyValue = -1
          AltGrKeyValue = -1
          SpecialKey = skNone
          X = 743
          Y = 128
          Height = 42
          Width = 67
          SubKeys = <>
        end
        item
          Caption = 'Shift'
          KeyValue = 161
          ShiftKeyValue = -1
          AltGrKeyValue = -1
          SpecialKey = skShift
          Color = 10526880
          X = 809
          Y = 128
          Height = 42
          Width = 185
          SubKeys = <>
        end
        item
          Caption = 'Ctrl'
          KeyValue = 162
          ShiftKeyValue = -1
          AltGrKeyValue = -1
          SpecialKey = skCtrl
          Color = 10526880
          X = 2
          Y = 171
          Height = 42
          Width = 101
          SubKeys = <>
        end
        item
          Caption = 'Win'
          KeyValue = 91
          ShiftKeyValue = -1
          AltGrKeyValue = -1
          SpecialKey = skWin
          Color = 10526880
          X = 103
          Y = 171
          Height = 42
          Width = 67
          SubKeys = <>
        end
        item
          Caption = 'Alt'
          KeyValue = 18
          ShiftKeyValue = -1
          AltGrKeyValue = -1
          SpecialKey = skAlt
          Color = 10526880
          X = 170
          Y = 171
          Height = 42
          Width = 101
          SubKeys = <>
        end
        item
          KeyValue = 32
          ShiftKeyValue = -1
          AltGrKeyValue = -1
          SpecialKey = skSpaceBar
          X = 270
          Y = 171
          Height = 42
          Width = 404
          SubKeys = <>
        end
        item
          Caption = 'Alt Gr'
          KeyValue = 0
          ShiftKeyValue = -1
          AltGrKeyValue = -1
          SpecialKey = skAltGr
          Color = 10526880
          X = 675
          Y = 171
          Height = 42
          Width = 101
          SubKeys = <>
        end
        item
          Caption = 'Win'
          KeyValue = 92
          ShiftKeyValue = -1
          AltGrKeyValue = -1
          SpecialKey = skWin
          Color = 10526880
          X = 775
          Y = 171
          Height = 42
          Width = 67
          SubKeys = <>
        end
        item
          Caption = 'Menu'
          KeyValue = 93
          ShiftKeyValue = -1
          AltGrKeyValue = -1
          SpecialKey = skApp
          Color = 10526880
          X = 843
          Y = 171
          Height = 42
          Width = 67
          SubKeys = <>
        end
        item
          Caption = '->'
          KeyValue = 39
          ShiftKeyValue = -1
          AltGrKeyValue = -1
          SpecialKey = skRight
          Color = 10526880
          X = 910
          Y = 171
          Height = 42
          Width = 101
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
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = []
    end
  end
  object cxStyleRepository1: TcxStyleRepository
    Left = 32
    Top = 424
    PixelsPerInch = 96
    object cxStyle2: TcxStyle
      AssignedValues = [svColor, svFont]
      Color = 15658734
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 12615680
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = []
    end
    object cxStyle1: TcxStyle
      AssignedValues = [svFont]
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = []
    end
  end
  object PopupMenu1: TPopupMenu
    Left = 448
    Top = 294
  end
  object ActionList1: TActionList
    Left = 792
    Top = 51
    object actExecutaConsulta: TAction
      Caption = 'actExecutaConsulta'
      OnExecute = actExecutaConsultaExecute
    end
  end
end
