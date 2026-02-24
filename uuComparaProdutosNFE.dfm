inherited frmComparaProdutosNFEFornecedor: TfrmComparaProdutosNFEFornecedor
  Left = 240
  Top = 45
  Caption = 'Associa'#231#227'o de c'#243'digos de produtos '
  ClientHeight = 668
  ClientWidth = 1225
  Position = poDesktopCenter
  ExplicitWidth = 1241
  ExplicitHeight = 707
  TextHeight = 13
  inherited botao_pesquisa: TSpeedButton
    Top = -40
    ExplicitTop = -40
  end
  inherited Edit1: TEdit
    Top = -37
    ExplicitTop = -37
  end
  object Panel1: TPanel [2]
    Left = 67
    Top = 287
    Width = 185
    Height = 41
    Caption = 'Panel1'
    TabOrder = 1
  end
  object Panel2: TPanel [3]
    Left = 0
    Top = 62
    Width = 1225
    Height = 145
    Align = alTop
    BevelOuter = bvNone
    Color = clWhite
    ParentBackground = False
    TabOrder = 2
    object Label4: TLabel
      Left = 190
      Top = 96
      Width = 127
      Height = 13
      Caption = 'Descri'#231#227'o do produto:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object bt_pesq_grupo: TSpeedButton
      Left = 645
      Top = 110
      Width = 24
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
      OnClick = botao_pesquisaClick
    end
    object Label5: TLabel
      Left = 582
      Top = 98
      Width = 39
      Height = 13
      Caption = 'Grupo:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object PngSpeedButton1: TPngSpeedButton
      Left = 1118
      Top = 0
      Width = 110
      Height = 88
      Caption = 'Sair'
      Flat = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 12615680
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      Layout = blGlyphTop
      ParentFont = False
      OnClick = PngSpeedButton1Click
      PngImage.Data = {
        89504E470D0A1A0A0000000D49484452000000300000003008060000005702F9
        87000000097048597300000B1300000B1301009A9C18000002E74944415478DA
        ED994D68134114C7DF6C623606AD54442F0A457B49EC490F1EFC486A40B03D88
        172F1669D15A905AA916F550CC56F1A4496DA1A8D08AE2C11A443C885F55B22B
        568B062F25151504455104F55083A6C68CFF7C341A8D3469BE76611EBC37B3C9
        CC7BEF97373BD94C18195C58A5131000954E4000CC388273463DF77DE86CC4F0
        2FC50BCD39CC13B44749A9FF5A3A0045DD033BF0D7B45198688100F1D8ABA037
        49716D2B25C06DD83A04BC88E1CDE82F81BEC3F57922F33952D6BF9A3583A29D
        809F0E00C82504D0D464EB74D1D9E01C7A3FD94824ED42E0CD7855828B7B44B1
        41F4AF61297CCF0F20A060BE0700B3BE17F303C80CBE14B6192E76A2AD817E4E
        54499286E888735CFF00E9F739AAA0E2062754856D456B813E86E741B29A87E9
        D0BA497D036426B408B6096E5BD13AA0616248D0E3F41A03605A125BAFBA06EE
        1F41B5FF574FAF00B9CE1500024000FC0360ED7DB19CFF8CDEA2186B8F1CB4DF
        311C0029419B3CCFF6003D3B20B6CC04A13F80B8F8420BE518BB9B0B4445014C
        C7C62E4816EB0E49B26859523373E2AB19232B2E3645BA1C2302A0D800865F42
        5901FA5F56C9533FD45C922F1A80D51B7213A70D2C4A43DF0EAF7C530880EC0B
        D522F111685BD9B651F964682F5C9D4AB9BC8E07ECEEA9FDF671437D91CDF58E
        2FE3DCB41BBFD45BE1F552E480A3D3500069F173134D6041292C664C807CE60A
        0001200004402E478B37601720C8DAE203A8C761BB4A7BB4D8A3B511E767D0BB
        42C4FBC8E31A25C6786E006A6A1CCBF2B459AEC3DDC4198FD6895E37B41AFA14
        00FD541D1EA68E86480100653A5E4F2713B411859B10701F254FDD3E4251197E
        1A097CC83EA780FBA7E800BF3FB8F8A99B1B53E3208D94FC9FE072627929F541
        FD03642418A8850B3C89520B743EF421AEFB8862570113D53F401A64AC8A58A4
        05D589C3AC80BE454506E07E3BF493FE01A6C5EF37D1B3C50DD860B0BCB83BF5
        EA6BEC3235C600F85394401D6C3B76ACE7D87A7B8D07502611009516015069F9
        05E62CD0407CB9956E0000000049454E44AE426082}
    end
    object btPesquisar: TPngSpeedButton
      Left = 1005
      Top = 0
      Width = 110
      Height = 88
      Caption = 'Pesquisar'
      Flat = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 12615680
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      Layout = blGlyphTop
      ParentFont = False
      OnClick = btPesquisarClick
      PngImage.Data = {
        89504E470D0A1A0A0000000D49484452000000300000003008060000005702F9
        87000000097048597300000B1300000B1301009A9C180000048C4944415478DA
        ED987F68144714C7DFDCE5B48DAD9A5225A2B62A2DE2AF8A96D456AC97485A6A
        8220581310512B9A16FB4785FE516D1B6F2E8A5A046985D256055B6CD06894AA
        31A221EE6EA2518BA582D8522AA82D34D4682B6A431A2F3B7EE72EC6CDDC717B
        7BB7E79D700F666EEECDEE7BEF333BFB7666183DE6C2321D400E20D301E40032
        1D400EC0152B42300AB64E21161A4B828D20C60AF07B939868270FBB4CD5FE5F
        B313801B3389CCE53053867F23E25C790DE5286076D23AFFCF9907A83939954C
        CF46B4CA1CDE29500E90D7FC94AAE7FC961900AEAF42FD398A2F05BF9DF0BC82
        02C57B1E1D40789E1B5FA35515E7AA1E94EB28FFA23CDB5B3C71AEDF44BCF8E3
        4703C0753965D6C6E80981AE162F6E1D2035E2255D7D3D5B8E0FA24E5F2909CF
        22FC5B18D31F63AB29E0FF22BD005C5B8C4B77C7B8DD202FAD4496F9DDD646E4
        BDD985D634A5C72466965160CEF1F400F0B38389BA2EA3354CE9D98E917F1F23
        1E4AD81BD79E80CBEFD0AA507A607FD824E293BAD300606C42A06B14ED0F44FE
        05C499E978C8F8A501441D72B48B959E0FF13E6C7517E09BF33E6ABF2B5FCAA1
        16ED0D00BD8891BFE538F83E086D145CCB349A6FD15E01C038770182FA5C64EE
        4645FB011C6D4B3AF83E881849C1C3A63BFDD0C507E0FA97A85759344893A210
        A37F236580F5C604EA11BFF4578A6AD8DEE026C031D46F592E3F47DCFF6ACAC1
        3FB47F15F5F316CD2E3CDDE56E025C443DD9A2A98783852E0218A8675B344DB0
        FFA69B00EA087D0B07EFB807603460DA945B343FC2FE0C3701CEA0B64E996370
        E0740117CFFE4FA8A75B348DB05FEEC4840D80518F115A60D1FC0907CFB912FC
        B6C681F44FBE4C064F59B43B60BFCA89199B346A7C84F5CDE6FE4A51844C713E
        6580A03E0F29FAB012CD12AC50773B3163F304B4177089BACED98751AA4C1980
        1B3A06C36FD1E0AB9E379AF8ACBFDC03083B8A9AA7B8CB2CC5E2AB39E9E08346
        259EEC5E25944348D1F39D9AB207089E2CC772B841D1DE242F7B2DA155A82A35
        C63432452B5A83FA7788D731354FB90F2085EB4DA84B156D3B6E7F1BA3D696B0
        B7C8D2A416AD02A527E9F49C20C029649ED0598ADEB8DF43F98A7CA18DF449E9
        DF36F707D05A46B17668CC9C8F2979287D00E1205AF01E982D14F5E8C382753C
        D388092C93CD3F48787BB794620C7EE7A2CC42C98B635DEE910151DC943E0029
        357A1172C541B44625335A36F23F8031254B1A9CDC94C4A9C4E9E1983932573B
        5AB328B29F225FF8D18A1E53522C02447DFA001E48507F032FA45CFABEE2E0AE
        1678E4982AD8FC6B63E05EA66275132397ECCB00F17D7A011E08D7261363F2AB
        2A97DD63510A297266248F583A502E20A0D3E4F51C883A62DCD03C92425E0931
        5EB18A8D3EBD07D01DE90750257C7E74EE690ACCB80330613F00E129295FDE97
        544B28ABED767FD9713ACDDB9E01C409C4FC7274846C0D05FC9F65378094CD4D
        43A8CB27F7DF3363F4AEC7935897DD0052E449DE7F038FA055A2F41CA489D72B
        A8A2A227BB01A46C6D7B926E77CB6F4DEF5E5CD4D2C48EA5B182CF4E002991C3
        AF3A0A9F41F9DF8D7780969D0061082D0F69B4C72E93652F40829203C8B4E400
        322D8F3DC07D54DD5A4002C543BD0000000049454E44AE426082}
    end
    object rdProdutosExibir: TRadioGroup
      Left = 6
      Top = 5
      Width = 178
      Height = 130
      Caption = 'Produtos a exibir:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ItemIndex = 0
      Items.Strings = (
        'Todos os produtos'
        'Apenas associados'
        'Apenas n'#227'o associados')
      ParentFont = False
      TabOrder = 0
    end
    object gpFornecedor: TGroupBox
      Left = 190
      Top = 3
      Width = 562
      Height = 87
      Caption = 'Dados do Fornecedor   '
      TabOrder = 1
      object Label2: TLabel
        Left = 2
        Top = 13
        Width = 40
        Height = 13
        Caption = 'C'#243'digo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object bt_pesq_fornecedor: TSpeedButton
        Left = 46
        Top = 27
        Width = 19
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
        OnClick = botao_pesquisaClick
      end
      object Label1: TLabel
        Left = 71
        Top = 13
        Width = 80
        Height = 13
        Caption = 'Raz'#227'o Social:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label3: TLabel
        Left = 5
        Top = 49
        Width = 32
        Height = 13
        Caption = 'CNPJ'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Panel4: TPanel
        Left = 68
        Top = 24
        Width = 477
        Height = 24
        BevelOuter = bvNone
        Color = clWhite
        Enabled = False
        ParentBackground = False
        TabOrder = 1
        object ed_razao_social_fornecedor: TEdit
          Left = 3
          Top = 4
          Width = 470
          Height = 21
          Color = clBlack
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
        end
      end
      object Panel13: TPanel
        Left = 845
        Top = 24
        Width = 29
        Height = 24
        BevelOuter = bvNone
        Enabled = False
        TabOrder = 2
      end
      object ed_cod_fornecedor: TEdit
        Left = 3
        Top = 29
        Width = 41
        Height = 21
        TabOrder = 0
        OnEnter = Edit1Enter
        OnExit = Edit1Exit
        OnKeyDown = Edit1KeyDown
      end
      object ed_cnpj_fornecedor: TEdit
        Left = 4
        Top = 61
        Width = 237
        Height = 21
        Color = clBlack
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 3
      end
    end
    object rdOrdem: TRadioGroup
      Left = 758
      Top = 2
      Width = 227
      Height = 87
      Caption = 'Produtos a exibir:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ItemIndex = 2
      Items.Strings = (
        'C'#243'd. Produto (Fornecedor)'
        'C'#243'd. Produto (Sistema)'
        'Descri'#231#227'o do Produto')
      ParentFont = False
      TabOrder = 2
    end
    object edDescricaoProduto: TEdit
      Left = 190
      Top = 112
      Width = 381
      Height = 21
      CharCase = ecUpperCase
      TabOrder = 3
    end
    object ed_cod_grupo: TEdit
      Left = 583
      Top = 112
      Width = 58
      Height = 21
      CharCase = ecUpperCase
      TabOrder = 4
      OnChange = Edit1Change
      OnEnter = Edit1Enter
      OnExit = Edit1Exit
      OnKeyDown = Edit1KeyDown
    end
    object Panel6: TPanel
      Tag = 99
      Left = 672
      Top = 100
      Width = 311
      Height = 41
      BevelOuter = bvNone
      Color = clWhite
      Enabled = False
      ParentBackground = False
      TabOrder = 5
      object Label6: TLabel
        Left = 6
        Top = 0
        Width = 114
        Height = 13
        Caption = 'Descri'#231#227'o do Grupo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object ed_desc_grupo: TEdit
        Left = 5
        Top = 13
        Width = 307
        Height = 21
        CharCase = ecUpperCase
        Color = clBlack
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
  end
  object Panel3: TPanel [4]
    Left = 0
    Top = 207
    Width = 1225
    Height = 415
    Align = alClient
    BevelOuter = bvNone
    Caption = 'Panel3'
    Color = clWhite
    ParentBackground = False
    TabOrder = 3
    object lbQtdProdutos: TLabel
      Left = 0
      Top = 396
      Width = 1229
      Height = 20
      Align = alBottom
      Alignment = taRightJustify
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ExplicitLeft = 1223
      ExplicitWidth = 6
    end
    object DBGrid1: TDBGrid
      Left = 0
      Top = 0
      Width = 1229
      Height = 396
      Align = alClient
      DataSource = dm.dsQryComparaProdutosNFE
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
      ParentFont = False
      PopupMenu = PopupMenu1
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = [fsBold]
      OnDrawColumnCell = DBGrid1DrawColumnCell
      OnEnter = Edit1Enter
      OnExit = Edit1Exit
      Columns = <
        item
          Color = 9211135
          Expanded = False
          FieldName = 'COD_PROD_FORNECEDOR'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          Title.Caption = 'C'#243'digo'
          Title.Color = clMaroon
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clBlack
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Width = 61
          Visible = True
        end
        item
          Color = 9211135
          Expanded = False
          FieldName = 'DESCRICAO_FORNECEDOR'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          Title.Caption = 'Descri'#231#227'o do produto (fornecedor)'
          Title.Color = clMaroon
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clBlack
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Width = 269
          Visible = True
        end
        item
          Alignment = taCenter
          Color = 9211135
          Expanded = False
          FieldName = 'UNIDADE_COMERCIALIZADA'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          Title.Caption = 'Unidade'
          Title.Color = clMaroon
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clBlack
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Width = 55
          Visible = True
        end
        item
          Color = clMoneyGreen
          Expanded = False
          FieldName = 'COD_PRODUTO_INTERNO'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          Title.Caption = 'C'#243'd. Prod. (sistema)'
          Title.Color = 4227072
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clBlack
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Width = 101
          Visible = True
        end
        item
          Color = clMoneyGreen
          Expanded = False
          FieldName = 'DESCRICAO'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          Title.Caption = 'Descri'#231#227'o do produto (sistema)'
          Title.Color = 4227072
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clBlack
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Width = 219
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'GRUPO_ASSOCIADO'
          Title.Caption = 'Grupo'
          Visible = True
        end
        item
          Color = clMoneyGreen
          Expanded = False
          FieldName = 'DESCRICAO_UNIDADE'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          Title.Caption = 'Unidade de controle'
          Title.Color = 4227072
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clBlack
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Width = 131
          Visible = True
        end
        item
          Color = clMoneyGreen
          Expanded = False
          FieldName = 'FATOR_CONVERSAO'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          Title.Caption = 'Fator'
          Title.Color = 4227072
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clBlack
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Width = 36
          Visible = True
        end
        item
          Color = 9211135
          Expanded = False
          FieldName = 'RAZAO_SOCIAL'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          Title.Caption = 'Fornecedor'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clBlack
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Visible = True
        end>
    end
  end
  object Panel7: TPanel [5]
    Tag = 99
    Left = 0
    Top = 0
    Width = 1225
    Height = 62
    Align = alTop
    Color = 12615680
    ParentBackground = False
    TabOrder = 4
    object lbTop: TLabel
      Left = 10
      Top = 6
      Width = 758
      Height = 33
      Caption = 
        'Associa'#231#227'o de produtos  (Correla'#231#227'o de c'#243'digos fornecedor x Sist' +
        'ema)'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -27
      Font.Name = 'Calibri'
      Font.Style = []
      ParentFont = False
    end
  end
  object Panel8: TPanel [6]
    Left = 0
    Top = 622
    Width = 1225
    Height = 46
    Align = alBottom
    Color = 12615680
    ParentBackground = False
    TabOrder = 5
    DesignSize = (
      1225
      46)
    object AdvOfficeImage1: TAdvOfficeImage
      Left = 561
      Top = 12
      Width = 35
      Height = 34
      Picture.Data = {
        89504E470D0A1A0A0000000D4948445200000040000000400806000000AA6971
        DE000000097048597300000B1300000B1301009A9C18000003C849444154789C
        ED9A4F8855651C869F6FD24653A33FCC58591443646038420B05652863CA3084
        68D33F41DAB4AA45B40A8216B5695104BA2A574105511443989B082218AA012B
        0A8A19631606A9A461853AE9D3E2DC3BCCD8DC9973667EE77C5DF58181B97F78
        BFF77DEF77EEFDCE774EA241D4416037B009B815B81938094C02E3C087C0484A
        69AA495FB5A3EE520F598E63EACBEACADCBE978CDAA7BE5732F885FCAC0EE5CE
        B068D401757291E1DB9C539FCA9DA53241E1DB9CEFAA12D435EA4450F899253C
        903B5B29D4B782C3B739A25E9B3BDFBCA83B6B0ADFE69D68CF29524CFD16D818
        A939071B534ADF4789F54409A9C3D41F1EE0F906C6A88E7AA0E6E9DFE6AC7A53
        94EF9019A05E0D0C4768956039F0509458D42130045C11A45586ED51425105DC
        17A453967BA384A20AD814A453967E755D84505401FD413A8D8FD9CD05F44588
        4415705D904E15AE8F10892AE0EF209D2AFC15211255C0D1209D2A1C8B10892A
        20C44C45424A8F2AE070904E59CE02472284A20AF83C48A72CA329A5D3114251
        057C16A4D3F8782105A494C669F63038182514B61F00EC0BD49A8FB194D26843
        6395C76233F46403FB018F45FA0E9B0129A553C0DE28BD0E8C03EFD73CC6E251
        57A83FD6F4C99F53B7E5CEB820EADDEA540D05BC9A3B5B69D4A72D2E66447150
        EDCD9DAB1281257CAAAEC89D6751A88FAABF2F21FC9B5D1BBE8D7A83FA41C5E0
        87D5A6F719EB451D545F578F76083DA57EAC3EAC2E6FCAD7B2260651D702AB81
        AF294E9DEF043600EB81DF801F5A7FBF506C74DCA64EA494CED7ED2DF4DA601B
        F50E6027B015D84C712F5055FE04C680518AB5FF1729A57FC24C46A3F6AB2FA9
        3F55FDA62BC909F56D7573EEACB35037A8FBD5D335059F8B2FD547D4C893B9CA
        C1B759FC46E764427D466DE4BBAC1D7C95BACFD895DE521953EF6A22FC90F1F7
        FF4471467D418DBF48ABF6AA6FF8FFFAD43BF195BABE6CB6057F062D96A21F01
        DD719756C1716038A57468A137CE5B807A153042E0F5F8063901DC9F52FA66BE
        37752C405D0D7C4271F343B7F207B063BE3DC4390B50AFA4D87ADE5A93B12639
        056CEF34133A2D245EE1E2080FB00678575D35D78BFF2940BD0778AE66534D73
        3BF0DA5C2FCC3A04D46B80EF805B1A3095835D29A591994F5C3803F672F18607
        D8AFCEBA9B65BA00750BF044E3969AA50F7871E613D387807A00D8D1B4A30C9C
        0106524ABF426B06589C485C0AE1017A8167DB0FDA87C09E2C56F2F1A4ADBD84
        9ED63F8F6736D434EB682DEF7B28EEF2BC31AB9D3C3C084501DD78A213C1F40C
        D892D9482E06D5953D14CBC44B91040C2CA398059399CDE4626D6E0397B94C66
        FE0558E3FEA81727EB5D0000000049454E44AE426082}
      Stretch = True
      Version = '1.1.1.0'
    end
    object lbNomeUsuario: TLabel
      Left = 597
      Top = 24
      Width = 180
      Height = 20
      Anchors = [akRight, akBottom]
      Caption = 'AAAAAAAAAAAAAAA'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -17
      Font.Name = 'Arial Rounded MT Bold'
      Font.Style = []
      ParentFont = False
      ExplicitLeft = 605
    end
    object AdvOfficeImage2: TAdvOfficeImage
      Left = 818
      Top = 12
      Width = 35
      Height = 34
      Picture.Data = {
        89504E470D0A1A0A0000000D49484452000000300000003008060000005702F9
        87000000097048597300000B1300000B1301009A9C1800000119494441546881
        ED993D6EC3300C853F1959BAE632B947F7ACDD7A905CA937C8943B14E852C019
        9B21C3CB92A1B0EBF88F162397DF2A597CF4036958842008B220692FA9961DB5
        A47DCA98400D6C8D8F3DE74C404B9C5B2D71684E92A403F00EBC640D9CD224F7
        9B4E2649576063A26A045609543888B7A4F81A68BDFDA9D6F6D1D5858676A72E
        5DEB732037731D0F07E61235E02D206AC05B40D480B7807F5F03918037918037
        918037ADEFC052F7374BB13E0772FF13CF657D0E94580345096E5201276F1173
        A88037E0D35BC854CC3A4EEBD6B8D1CDFAD67FED3BDED77743E214DF859ECE81
        B1718A77607002920E927EBA46867FEC7FB86EC5601BAD27396623A6B10F5A05
        B6A2F81A18EDC093F15DA20317E00BF8005E6F62E4F1ABF7A976620000000049
        454E44AE426082}
      Stretch = True
      Version = '1.1.1.0'
    end
    object lbNumeroEstacao: TLabel
      Left = 855
      Top = 24
      Width = 27
      Height = 20
      Anchors = [akRight, akBottom]
      Caption = 'xxx'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -17
      Font.Name = 'Arial Rounded MT Bold'
      Font.Style = []
      ParentFont = False
      ExplicitLeft = 863
    end
    object AdvOfficeImage4: TAdvOfficeImage
      Left = 917
      Top = 12
      Width = 35
      Height = 34
      Picture.Data = {
        89504E470D0A1A0A0000000D49484452000000300000003008060000005702F9
        87000000097048597300000B1300000B1301009A9C18000000F9494441546881
        ED9AD10D82401044E7889D5882FA632F509CF568075202B6307EA8688E201C17
        1856F7252484CC2D3B596017029008C99264F3DCCAD4F573C71B73C2866F1A75
        BC40F208E004609B9BCCC2D400AA40F20A7BC9BFA80349AAB3C8A1502790CB26
        3E104208DF16C4151BD20F911A2FD69BAFC01403B79EFDA9E4C563C408BDB491
        C5F9769E42B9D7F4DCF83DB036CC1BF04EAC26B913ABF1A7D0DAF86D0324F771
        EB8E382FA94F366081B1062EE1030007B1BEE56F2AB05ACC1BE874E21E768933
        D3DCFA16F315F03732356E408DCF426A7C1652E306D4F82CA4C66721356E408D
        7F9D5653E0F1CF8155EA0240059B266A00D51D3EE5B0849223B6190000000049
        454E44AE426082}
      Stretch = True
      Version = '1.1.1.0'
    end
    object lbDataSistema: TLabel
      Left = 950
      Top = 24
      Width = 27
      Height = 20
      Anchors = [akRight, akBottom]
      Caption = 'xxx'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -17
      Font.Name = 'Arial Rounded MT Bold'
      Font.Style = []
      ParentFont = False
      ExplicitLeft = 958
    end
    object AdvOfficeImage3: TAdvOfficeImage
      Left = 1077
      Top = 12
      Width = 35
      Height = 34
      Picture.Data = {
        89504E470D0A1A0A0000000D49484452000000300000003008060000005702F9
        87000000097048597300000B1300000B1301009A9C180000034F494441546881
        ED594D4F5431143D35B2C415318380A20BD4384002242CFC0F883F804437FE0C
        7D7EE04AD0B50BF80720C4B5C185892440A2EE481856C4045D3189038B99E3A2
        9DCCA379B7AFEFBDBE419339098B4E7BEE3DF7D1DEB6B7400F3D14820A6588E4
        24803900D300C6005C05D06FBAEB008E01EC03D805B0A994FA16CA776E90AC92
        5C26596376D40CB77A11C24748AE926CE6106EA3696C0D7743781FC9D7241B01
        84DB6818DB7D65891F20F9B904E136B6480E84163F4EF2B00BE2DBA8911CF7D1
        969A858CA12FE86414092D005F016C00D8017004E089E97B0F6008C00C807900
        B3002EA5D8AB03B8AF94FA91A65104F5B449FBF2A7249748562C6E141B13597D
        15EA0C749662FB9079A713F5824D9BF39B244713B851C2D82861DCA8B1E1C216
        F32C6CEA8CE0C20B9289535022086315C99729BE16B38A1FA13B553E4AE17B07
        10E33C76F86B30CB3E41BDB14878E5C1CF1C80E12D3AFCAEF88AAF52DE613F52
        9836810250C647129A24EFF904B02C18382379D3F323E40AC0706F51CE4E4B3E
        06A483D95B1F01450330FC7782898334E2A4406C921CEC620083245B829989F8
        587B379C136C6E2BA57EFA0A280AE36B5BE87E106FD8014C0BA40F4545E5C0BA
        F0FB54BC6107302690760ACB813CB598B04B43DFDC9220690448FE161CDC0E24
        D485C8B2714718F7CBE5584A5F6927D110019C0B8264BF30E62CEE2BED48FBCF
        C30EA02E8CBB56B61000CF955251AC3D248C3B8937EC008E0592642C146CF12E
        9FE7345EB63AF701DC4D20CD00F8E4AB462915A2DE24A5F4FD78C3FE0F48A96B
        BEB09CEC7828FCBE2732E83E4A5444626030C35122892C1DE6DE74493FA8EFD8
        49701FE60C593A4E9F92BCDE05F1378CAF24781DA75D179AB592C52B92EB826F
        BF0B8D31B42A1821C9A72506F0CCE1D7EF4A690CB92EF52D920B25885FA0BC70
        FF306BF197EEB24ACB7CADC2F99E7ADA440EF164D6B28A31DC475D5472618D05
        1636F58295E67C1BF90A5BC641EED2628ADD8AE148D9A68D1A534A8BA18BBBDB
        D0B7B75DE8E2EE91E91B327FD3D03BECAC87EFE2C5DD367831E5F5B04F4FFC9F
        1F38624194FDC4B4C8B29E98AC408649AE30DC23DF0ABBF1C8971048953A9BE4
        79663D305CBFE38180900FDD13D045A729741EBAAF98EE13741EBAF7006C28A5
        BE87F2DD430F05F0179060A3DDB7ACBF360000000049454E44AE426082}
      Stretch = True
      Version = '1.1.1.0'
    end
    object lbHora: TLabel
      Left = 1110
      Top = 15
      Width = 37
      Height = 29
      Anchors = [akRight, akBottom]
      Caption = 'xxx'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -24
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ExplicitLeft = 1118
    end
  end
  object PopupMenu1: TPopupMenu
    Left = 708
    Top = 54
    object Associar1: TMenuItem
      Caption = 'Associar '
      OnClick = Associar1Click
    end
    object VisualizarltimoDANFEdecompra1: TMenuItem
      Caption = 'Visualizar '#250'ltimo DANFE de compra'
      OnClick = VisualizarltimoDANFEdecompra1Click
    end
  end
  object timerHora: TTimer
    OnTimer = timerHoraTimer
    Left = 1040
    Top = 8
  end
end
