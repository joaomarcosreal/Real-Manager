inherited frmGerenciamentoVendasCaixa: TfrmGerenciamentoVendasCaixa
  Left = 227
  Top = 133
  ClientHeight = 667
  ClientWidth = 968
  ExplicitWidth = 980
  ExplicitHeight = 705
  TextHeight = 13
  inherited botao_pesquisa: TSpeedButton
    Left = 70
    Top = -33
    ExplicitLeft = 70
    ExplicitTop = -33
  end
  inherited Edit1: TEdit
    Left = -56
    Top = -30
    ExplicitLeft = -56
    ExplicitTop = -30
  end
  object Panel1: TPanel [2]
    Tag = 99
    Left = 0
    Top = 0
    Width = 968
    Height = 55
    Align = alTop
    Color = 12615680
    ParentBackground = False
    TabOrder = 1
    StyleElements = []
    ExplicitWidth = 964
    object Label1: TLabel
      Left = 10
      Top = 6
      Width = 293
      Height = 33
      Caption = 'Gerenciamento de vendas'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -27
      Font.Name = 'Calibri'
      Font.Style = [fsBold]
      ParentFont = False
      StyleElements = []
    end
  end
  object pgList: TJvPageList [3]
    Left = 0
    Top = 55
    Width = 968
    Height = 612
    ActivePage = pgPrincipal
    PropagateEnable = False
    Align = alClient
    ExplicitWidth = 964
    ExplicitHeight = 611
    object pgPrincipal: TJvStandardPage
      Left = 0
      Top = 0
      Width = 968
      Height = 612
      Caption = 'pgPrincipal'
      Color = clWhite
      ExplicitWidth = 964
      ExplicitHeight = 611
      object Panel2: TPanel
        Left = 0
        Top = 0
        Width = 968
        Height = 221
        Align = alTop
        Color = clWhite
        ParentBackground = False
        TabOrder = 0
        StyleElements = []
        ExplicitWidth = 964
        DesignSize = (
          968
          221)
        object Label4: TLabel
          Left = 278
          Top = 32
          Width = 61
          Height = 13
          BiDiMode = bdRightToLeft
          Caption = 'Doc inicial'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentBiDiMode = False
          ParentFont = False
          StyleElements = []
        end
        object Label5: TLabel
          Left = 345
          Top = 32
          Width = 59
          Height = 13
          BiDiMode = bdRightToLeft
          Caption = 'Doc. Final'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentBiDiMode = False
          ParentFont = False
          StyleElements = []
        end
        object Label6: TLabel
          Left = 863
          Top = 22
          Width = 35
          Height = 13
          BiDiMode = bdRightToLeft
          Caption = 'Mesa:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentBiDiMode = False
          ParentFont = False
          StyleElements = []
        end
        object Label8: TLabel
          Left = 864
          Top = 56
          Width = 34
          Height = 13
          BiDiMode = bdRightToLeft
          Caption = 'Valor:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentBiDiMode = False
          ParentFont = False
          StyleElements = []
        end
        object btPesquisar: TPngSpeedButton
          Left = 806
          Top = 87
          Width = 87
          Height = 69
          Anchors = [akTop, akRight]
          Caption = 'Pesquisar'
          Flat = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
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
        object PngSpeedButton5: TPngSpeedButton
          Left = 891
          Top = 87
          Width = 87
          Height = 69
          Anchors = [akRight, akBottom]
          Caption = 'Sair'
          Flat = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          Layout = blGlyphTop
          ParentFont = False
          OnClick = PngSpeedButton5Click
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
        object btImprimir: TPngSpeedButton
          Left = 836
          Top = 162
          Width = 107
          Height = 39
          Anchors = [akTop, akRight]
          Caption = 'Imprimir'
          Flat = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          OnClick = btImprimirClick
          PngImage.Data = {
            89504E470D0A1A0A0000000D4948445200000018000000180806000000E0773D
            F8000000097048597300000B1300000B1301009A9C18000000F74944415478DA
            EDD5410A82401406E0FF4DB4AF965DA05344165DA35344046D9A681144C7E81C
            3546749476A17BC9E9A1498BB17226A58D03A24F87F70DCF794AA878D0DB27F2
            28AD32C961EEFC0F80D27680979BAB060A00520B903F85C682E316A057C90B73
            01928D414B8E423E36C0604758A91927DFBE6696026463CE375590AEBC122024
            33D113701926801C807C20564E0084C70B1C7C01CA1D35E00254BE8BB23E70F8
            5CBF014E7CEE9B40298D7626AC0F3DDCC58183AE0914285796D404AE68C4A3F4
            0B282F1D5034818EDB1C294EAA52A048D3092F69AE14E06B782011A019EDB118
            DFFEFD3FB02C913D6059227BE0F7123D00ECA9A2E2583FA3A60000000049454E
            44AE426082}
        end
        object GroupBox2: TGroupBox
          Left = 2
          Top = 13
          Width = 272
          Height = 65
          TabOrder = 0
          object Panel5: TPanel
            Left = 2
            Top = 15
            Width = 268
            Height = 48
            Align = alClient
            BevelOuter = bvNone
            Color = clWhite
            ParentBackground = False
            TabOrder = 0
            StyleElements = []
            object Label3: TLabel
              Left = 6
              Top = -2
              Width = 70
              Height = 13
              Caption = 'Data Inicial:'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              StyleElements = []
            end
            object Label7: TLabel
              Left = 139
              Top = -1
              Width = 63
              Height = 13
              Caption = 'Data Final:'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              StyleElements = []
            end
            object ed_data_inicial: TDateEdit
              Left = 13
              Top = 14
              Width = 120
              Height = 32
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -19
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              NumGlyphs = 2
              ParentFont = False
              TabOrder = 0
              OnEnter = Edit1Enter
              OnExit = Edit1Exit
              OnKeyDown = Edit1KeyDown
            end
            object ed_data_final: TDateEdit
              Left = 138
              Top = 14
              Width = 121
              Height = 32
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -19
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              NumGlyphs = 2
              ParentFont = False
              TabOrder = 1
              OnEnter = Edit1Enter
              OnExit = Edit1Exit
              OnKeyDown = Edit1KeyDown
            end
          end
        end
        object edNotaInicial: TEdit
          Left = 280
          Top = 46
          Width = 59
          Height = 32
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -19
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
        end
        object edNotaFinal: TEdit
          Left = 345
          Top = 47
          Width = 59
          Height = 32
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -19
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 2
        end
        object rdgPDV: TRadioGroup
          Left = 411
          Top = 13
          Width = 153
          Height = 65
          Caption = 'Qual PDV ?'
          Color = clWhite
          ItemIndex = 0
          Items.Strings = (
            'Todos'
            'Este PDV'
            'Pdv Informado')
          ParentBackground = False
          ParentColor = False
          TabOrder = 3
          OnClick = rdgPDVClick
        end
        object edNumeroPDV: TEdit
          Left = 514
          Top = 29
          Width = 46
          Height = 32
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -19
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 4
          Visible = False
          OnExit = edNumeroPDVExit
        end
        object rdgTipoVenda: TRadioGroup
          Left = 567
          Top = 12
          Width = 124
          Height = 65
          Caption = 'Tipo da venda'
          Color = clWhite
          Columns = 2
          ItemIndex = 0
          Items.Strings = (
            'Todas'
            'Mesa'
            'Balc'#227'o'
            'Delivery')
          ParentBackground = False
          ParentColor = False
          TabOrder = 5
        end
        object rdgDocumento: TRadioGroup
          Left = 693
          Top = 13
          Width = 166
          Height = 65
          Caption = 'Documento'
          Color = clWhite
          Columns = 2
          ItemIndex = 0
          Items.Strings = (
            'Todos'
            'Avulso'
            'ECF'
            'NFC-e'
            'NF-e'
            'SAT')
          ParentBackground = False
          ParentColor = False
          TabOrder = 6
        end
        object edMesa: TEdit
          Left = 903
          Top = 11
          Width = 73
          Height = 32
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -19
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 7
        end
        object edValor: TEdit
          Left = 904
          Top = 49
          Width = 73
          Height = 32
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -19
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 8
        end
        object GroupBox1: TGroupBox
          Left = 338
          Top = 86
          Width = 344
          Height = 58
          Caption = 'Forma de pagamento'
          Color = clWhite
          ParentBackground = False
          ParentColor = False
          TabOrder = 9
          object cbFormasPagamento: TcxCheckComboBox
            Left = 6
            Top = 16
            ParentFont = False
            Properties.EmptySelectionText = 'Nenhuma tabela selecionada'
            Properties.Items = <
              item
                Description = 'asdasd'
                ShortDescription = 'dasdas'
              end
              item
                Description = 'werwerw'
                Enabled = False
                ShortDescription = 'rwerwer'
              end
              item
                Description = '34535345'
                Enabled = False
                ShortDescription = '534534'
              end>
            Properties.OnClickCheck = cbFormasPagamentoPropertiesClickCheck
            Style.Color = clWhite
            Style.Font.Charset = DEFAULT_CHARSET
            Style.Font.Color = clWindowText
            Style.Font.Height = -19
            Style.Font.Name = 'MS Sans Serif'
            Style.Font.Style = []
            Style.IsFontAssigned = True
            TabOrder = 0
            Width = 323
          end
        end
        object ckbDataMovimento: TRadioButton
          Left = 11
          Top = -1
          Width = 119
          Height = 17
          Caption = 'Data do movimento'
          Checked = True
          TabOrder = 10
          TabStop = True
        end
        object ckbDataRelogio: TRadioButton
          Left = 142
          Top = 1
          Width = 119
          Height = 17
          Caption = 'Data real (rel'#243'gio)'
          TabOrder = 11
        end
        object GroupBox3: TGroupBox
          Left = 1
          Top = 86
          Width = 325
          Height = 58
          Caption = 'Empresa'
          Color = clWhite
          ParentBackground = False
          ParentColor = False
          TabOrder = 12
          object cbEmpresas: TcxCheckComboBox
            Left = 4
            Top = 16
            ParentFont = False
            Properties.EmptySelectionText = 'Nenhuma tabela selecionada'
            Properties.Items = <
              item
                Description = 'asdasd'
                ShortDescription = 'dasdas'
              end
              item
                Description = 'werwerw'
                Enabled = False
                ShortDescription = 'rwerwer'
              end
              item
                Description = '34535345'
                Enabled = False
                ShortDescription = '534534'
              end>
            Properties.OnClickCheck = cbEmpresasPropertiesClickCheck
            Style.Color = clWhite
            Style.Font.Charset = DEFAULT_CHARSET
            Style.Font.Color = clWindowText
            Style.Font.Height = -19
            Style.Font.Name = 'MS Sans Serif'
            Style.Font.Style = []
            Style.Shadow = True
            Style.IsFontAssigned = True
            StyleDisabled.Color = clBtnFace
            TabOrder = 0
            Width = 314
          end
        end
        object rdDesconto: TRadioGroup
          Left = 687
          Top = 86
          Width = 109
          Height = 59
          Caption = 'Tipo da venda'
          Color = clWhite
          ItemIndex = 0
          Items.Strings = (
            'Todas'
            'C/ desconto'
            'S/ desconto')
          ParentBackground = False
          ParentColor = False
          TabOrder = 13
        end
        object GroupBox4: TGroupBox
          Left = 1
          Top = 142
          Width = 800
          Height = 60
          Caption = 'Cliente / Fornecedor:'
          Color = clWhite
          ParentBackground = False
          ParentColor = False
          TabOrder = 14
          object cbFornecedores: TcxCheckComboBox
            Left = 4
            Top = 16
            ParentFont = False
            Properties.EmptySelectionText = 'Nenhuma tabela selecionada'
            Properties.EditValueFormat = cvfIndices
            Properties.Items = <
              item
                Description = 'asdasd'
                ShortDescription = 'dasdas'
              end
              item
                Description = 'werwerw'
                Enabled = False
                ShortDescription = 'rwerwer'
              end
              item
                Description = '34535345'
                Enabled = False
                ShortDescription = '534534'
              end>
            Properties.OnClickCheck = cbEmpresasPropertiesClickCheck
            Style.Color = clWhite
            Style.Font.Charset = DEFAULT_CHARSET
            Style.Font.Color = clWindowText
            Style.Font.Height = -19
            Style.Font.Name = 'MS Sans Serif'
            Style.Font.Style = []
            Style.Shadow = True
            Style.IsFontAssigned = True
            StyleDisabled.Color = clBtnFace
            TabOrder = 0
            Width = 662
          end
          object rdFiltroFornecedor: TRadioGroup
            Left = 679
            Top = 7
            Width = 113
            Height = 47
            Caption = 'Campo de exibi'#231#227'o'
            Color = clWhite
            ItemIndex = 0
            Items.Strings = (
              'Nome fantasia'
              'Raz'#227'o Social')
            ParentBackground = False
            ParentColor = False
            TabOrder = 1
          end
        end
      end
      object pnl1: TPanel
        Left = 0
        Top = 221
        Width = 968
        Height = 391
        Align = alClient
        Caption = 'pnl1'
        TabOrder = 1
        StyleElements = []
        OnClick = botao_pesquisaClick
        ExplicitWidth = 964
        ExplicitHeight = 390
        object cxGrid1: TcxGrid
          Left = 1
          Top = 1
          Width = 966
          Height = 389
          Align = alClient
          PopupMenu = popGridVendas
          TabOrder = 0
          ExplicitWidth = 962
          ExplicitHeight = 388
          object cxGrid1DBTableView1: TcxGridDBTableView
            PopupMenu = popGridVendas
            Navigator.Buttons.CustomButtons = <>
            ScrollbarAnnotations.CustomAnnotations = <>
            DataController.DataSource = dm.dsQryVendasCaixa
            DataController.Summary.DefaultGroupSummaryItems = <
              item
                Format = 'R$ ,0.00;-R$ ,0.00'
                Kind = skSum
                Position = spFooter
                Column = cxGrid1DBTableView1Column13
              end
              item
                Format = 'R$ ,0.00;-R$ ,0.00'
                Kind = skSum
                Column = cxGrid1DBTableView1Column13
              end
              item
                Format = 'R$ ,0.00;-R$ ,0.00'
                Kind = skSum
                Column = cxGrid1DBTableView1Column9
              end
              item
                Format = 'R$ ,0.00;-R$ ,0.00'
                Kind = skSum
                Column = cxGrid1DBTableView1Column10
              end
              item
                Format = 'R$ ,0.00;-R$ ,0.00'
                Kind = skSum
                Column = cxGrid1DBTableView1Column11
              end
              item
                Format = 'R$ ,0.00;-R$ ,0.00'
                Kind = skSum
                Column = cxGrid1DBTableView1Column12
              end
              item
                Kind = skSum
                Position = spFooter
                Column = cxGrid1DBTableView1Column9
              end
              item
                Kind = skSum
                Position = spFooter
                Column = cxGrid1DBTableView1Column10
              end
              item
                Kind = skSum
                Position = spFooter
                Column = cxGrid1DBTableView1Column11
              end
              item
                Kind = skSum
                Position = spFooter
                Column = cxGrid1DBTableView1Column12
              end>
            DataController.Summary.FooterSummaryItems = <
              item
                Format = 'R$ ,0.00;-R$ ,0.00'
                Kind = skSum
                Column = cxGrid1DBTableView1Column13
              end
              item
                Format = 'R$ ,0.00;-R$ ,0.00'
                Kind = skSum
                Column = cxGrid1DBTableView1Column9
              end
              item
                Format = 'R$ ,0.00;-R$ ,0.00'
                Kind = skSum
                Column = cxGrid1DBTableView1Column10
              end
              item
                Format = 'R$ ,0.00;-R$ ,0.00'
                Kind = skSum
                Column = cxGrid1DBTableView1Column11
              end
              item
                Format = 'R$ ,0.00;-R$ ,0.00'
                Kind = skSum
                Column = cxGrid1DBTableView1Column12
              end
              item
                Format = 'Qtde de registros: 0'
                Kind = skCount
                OnGetText = cxGrid1DBTableView1TcxGridDBDataControllerTcxDataSummaryFooterSummaryItems5GetText
                Column = cxGrid1DBTableView1Column8
              end>
            DataController.Summary.SummaryGroups = <>
            OptionsData.CancelOnExit = False
            OptionsData.Deleting = False
            OptionsData.DeletingConfirmation = False
            OptionsData.Editing = False
            OptionsData.Inserting = False
            OptionsView.Footer = True
            Styles.Content = stlRegistro
            Styles.ContentOdd = cxStyle2
            object cxGrid1DBTableView1Column1: TcxGridDBColumn
              Caption = 'Data'
              DataBinding.FieldName = 'DATA_SO'
              DataBinding.IsNullValueType = True
              Width = 66
            end
            object cxGrid1DBTableView1Column2: TcxGridDBColumn
              Caption = 'Hora'
              DataBinding.FieldName = 'HORA'
              DataBinding.IsNullValueType = True
              Width = 51
            end
            object cxGrid1DBTableView1Column3: TcxGridDBColumn
              Caption = 'Tipo'
              DataBinding.FieldName = 'TIPO'
              DataBinding.IsNullValueType = True
              Width = 34
            end
            object cxGrid1DBTableView1Column14: TcxGridDBColumn
              Caption = 'Mesa'
              DataBinding.FieldName = 'MESA'
              DataBinding.IsNullValueType = True
              Width = 40
            end
            object cxGrid1DBTableView1Column4: TcxGridDBColumn
              Caption = 'PDV'
              DataBinding.FieldName = 'NUMERO_CAIXA'
              DataBinding.IsNullValueType = True
              Width = 32
            end
            object cxGrid1DBTableView1Column7: TcxGridDBColumn
              Caption = 'Modelo'
              DataBinding.FieldName = 'DESC_MODELO_COMPROVANTE'
              DataBinding.IsNullValueType = True
              Width = 46
            end
            object cxGrid1DBTableView1Column5: TcxGridDBColumn
              Caption = 'S'#233'rie'
              DataBinding.FieldName = 'SERIE_NFCE'
              DataBinding.IsNullValueType = True
              Width = 33
            end
            object cxGrid1DBTableView1Column6: TcxGridDBColumn
              Caption = 'N'#186' nota'
              DataBinding.FieldName = 'NUMERO_NFCE'
              DataBinding.IsNullValueType = True
              Width = 44
            end
            object cxGrid1DBTableView1Column8: TcxGridDBColumn
              Caption = 'Cliente / Fornecedor'
              DataBinding.FieldName = 'NOMEFORNECEDOR'
              DataBinding.IsNullValueType = True
              Width = 273
            end
            object cxGrid1DBTableView1Column9: TcxGridDBColumn
              Caption = 'Produtos'
              DataBinding.FieldName = 'VALOR_BRUTO'
              DataBinding.IsNullValueType = True
              PropertiesClassName = 'TcxCurrencyEditProperties'
              Width = 75
            end
            object cxGrid1DBTableView1Column10: TcxGridDBColumn
              Caption = 'Servi'#231'o'
              DataBinding.FieldName = 'VALOR_TXSERV'
              DataBinding.IsNullValueType = True
              PropertiesClassName = 'TcxCurrencyEditProperties'
              Width = 70
            end
            object cxGrid1DBTableView1Column11: TcxGridDBColumn
              Caption = 'Entrega'
              DataBinding.FieldName = 'VALOR_TX_ENTREGA'
              DataBinding.IsNullValueType = True
              PropertiesClassName = 'TcxCurrencyEditProperties'
              Width = 65
            end
            object cxGrid1DBTableView1Column12: TcxGridDBColumn
              Caption = 'Desconto'
              DataBinding.FieldName = 'VALOR_DESCONTO'
              DataBinding.IsNullValueType = True
              PropertiesClassName = 'TcxCurrencyEditProperties'
              Width = 64
            end
            object cxGrid1DBTableView1Column13: TcxGridDBColumn
              Caption = 'Total'
              DataBinding.FieldName = 'VALOR_TOTAL'
              DataBinding.IsNullValueType = True
              PropertiesClassName = 'TcxCurrencyEditProperties'
              Width = 87
            end
          end
          object cxGrid1Level1: TcxGridLevel
            GridView = cxGrid1DBTableView1
          end
        end
      end
    end
    object pgEmail: TJvStandardPage
      Left = 0
      Top = 0
      Width = 968
      Height = 612
      Caption = 'pgEmail'
    end
  end
  inherited cliques: TActionList
    Left = 168
    Top = 65531
  end
  inherited actlBusca: TJvControlActionList
    Left = 386
    Top = 71
  end
  object img: TImageList [6]
    Left = 590
    Top = 24
    Bitmap = {
      494C010103000500040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000001000000001002000000000000010
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000D7C1B500CFB5A700CFB5A700D2BAAD00000000000000
      00000000000000000000000000000000000000000000D7D7D7006D6D6D00FCFC
      FC0082838300FEFEFE00C3C3C300F0F0F00000000000B0B0B000FCFCFC007171
      7100FEFEFE006D6D6D00C5C5C500000000000000000000000000000000000000
      0000FDFDFD00F2F2F200F7F7F700F9F9F900F8F8F800F9F9F900F9F9F900F8F8
      F800F4F4F400FCFCFC00FEFEFE00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000086442100782E070000000000000000000000
      00000000000000000000000000000000000000000000C8C8C800333333000000
      000054545400F4F4F400A6A6A600E9E9E9000000000091919100000000003A3A
      3A00F4F4F40033333300ADADAD0000000000000000000000000000000000F3F3
      F3006E6E6E0082817F0053524F00F5F4EE00F6F5F000F6F5F000F7F6F2004E4E
      4C00767574005B5B5A00F5F5F500000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000007E3712007428000000000000000000000000
      00000000000000000000000000000000000000000000C8C8C800333333000000
      000054545400F5F5F500A5A5A500E7E7E7000000000091919100000000003939
      3900F5F5F50034343400ACACAC0000000000000000000000000000000000DBDB
      D400615F5500C6C3B700AEA47900B5A55B00B3A35A00B2A25A00BAAB67005A59
      5600B6B5B40038383800DADADA00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000742800007428000000000000000000000000
      00000000000000000000000000000000000000000000C4C4C400333333000000
      00005454540000000000ABABAB00DFDFDF00F5F5F50091919100000000003939
      39000000000034343400A7A7A700FEFEFE000000000000000000FDFDFD00EAE7
      D200D7CB86009D925700978C5300998E510080331A00C1AE9700DCD3A900CFB7
      5800C3AE5A00C0B7930000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000742800007428000000000000000000000000
      00000000000000000000000000000000000000000000C3C3C300343434000000
      00005454540000000000ACACAC00E0E0E000F4F4F40090909000000000003939
      39000000000033333300A7A7A700FCFCFC0000000000CFE0EE00ADC9DE00ACC7
      DB00A0B7B70024221B002A1A1300523524008D2B1500F2E6E300F9F6E800D6C3
      6C00DECE8700F7F4E30000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000E59A3100E28D1600E28D1600E592
      1E00E28D1600E28D1600E3922000E28D1600E28D1600E8972500E28D1600E28D
      1600E28E1800E28D1600E28D1600E28D1600000000004F4F4F004E4E4E004E4E
      4E004F4F4F004F4F4F004F4F4F004F4F4F004F4F4F004E4E4E004E4E4E004F4F
      4F004F4F4F004F4F4F004F4F4F00FCFCFC000000000061BDF9000696F7000696
      F7000E99F700B1AECA0019238A00232E9600CE958C00FEFDFD00F8F6EA00E2DA
      AD00F6F6F2000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000E5972B00E28D1600E28D1600E898
      2700E28D1600E28D1600EB9C2D00E28D1600E28D1600EEA13500E28D1600E28D
      1600E28D1600E28D1600E28D1600E28D16000000000033333300333333003434
      3400343434003333330033333300333333003333330034343400343434003333
      3300333333003333330033333300FEFEFE00000000005EC0FC00059EFB00059E
      FB000DA1FB00A9B5DD000423A0001940BC00FCFCFE00E1E7F100DDDECA00F8F5
      EB00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000E5972B00E28D1600E28D1600E795
      2300E28D1600E28D1600EC9E3000E28D1600E28D1600EB9D2E00E28D1600E28D
      1600E28D1600E28D1600E28D1600E28D1600000000000000000000000000FEFE
      FE00F5F5F500F5F5F500EBEBEB00B2B2B200B2B2B200E6E6E600FEFEFE00C4C4
      C400ACACAC00000000000000000000000000000000005ABFFB00059FF900059F
      F9000CA2F900EFF2FA004E66BF000932B7001D47C400D2DDF100F6F8F8000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000E5972B00E28D1600E28D1600E28D
      1600E28D1600E28D1600E38F1800E7952200E6942200E38E1800E28D1600E28D
      1600E28D1600E28D1600E28D1600E28D16000000000000000000000000000000
      0000FEFEFE00F4F4F400B8B9B9003333330033333300A5A5A500FEFEFE003535
      350079797900FEFEFE00000000000000000000000000A8E0FF0072CCFF0072CC
      FF0077CEFF00FDFDFE008A9BD5004B68C700FBFBFE0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000F5AF4E00FFBE6200FFBE6200FBB8
      5800FEBC6000FFBE6200D4A46000CC9F6000CC9F6000CFA16000FFBE6200FFBE
      6200FCB95B00FFBE6200FFBE6200F4AE4C0000000000FEFEFE00000000005252
      520033333300454545006161610034343400333333003939390033333300FDFD
      FD00FEFEFE00F4F4F400F5F5F500000000000000000000000000000000000000
      0000F3F5F90070686B009F7E5D0081A3B90086BBEB00FCFEFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FDF1E000FECE8900FFC36D00EEA2
      3600FDBA5C00FFBE6200BA945F00917B5D008C795D00B28F5F00FFBE6200FFBE
      6200F5AD4700FFC26C00FFD08E00FFFAF20000000000F8F8F800F1F1F1003333
      33008C8C8C0033333300333333003434340034343400333333003B3B3B000000
      000000000000F5F5F500F4F4F400FEFEFE000000000000000000000000000000
      0000ECDFC800E9891100F5890B00B4B0970075B6EA00EDF5FC00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFBE
      6200FFE0B4000000000000000000BEBEBE00B5B5B500FEFEFE0000000000FFFC
      F800FFC36D00FFF8EE00000000000000000000000000F8F8F800A0A0A000FEFE
      FE0000000000F1F1F1006565650033333300343434006F6F6F00FCFDFD000000
      00000000000000000000FEFEFE00FBFBFB00000000000000000000000000FFF8
      E500FABF4300F9900B00F9890B00D2AF7100A3BCBD00D2D9D600FEFDFC000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FCC6
      7800FDD59C00FAFAFA007C7C7C006D6D6D006B6B6B0079797900F3F3F300FFF3
      E100FCC67800FFEDD300000000000000000000000000FEFEFE00DCDCDC00BEBE
      BE00FEFEFE000000000000000000A9A9A900A8A8A800F4F4F400F5F5F5000000
      0000000000000000000000000000FCFCFC00000000000000000000000000FFF9
      E900FAC84900F9970B00F98F0B00F6941A00F59D2800F9CB8800FFFEFA000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000B7D3E00079B9D6009AC5D8008EC0D60083BCD600A0C7D9000000
      0000000000000000000000000000000000000000000000000000E9E9E900D6D6
      D600F4F4F400FEFEFE00000000003333330033333300FEFEFE00F5F5F500F5F5
      F500FEFEFE000000000000000000000000000000000000000000000000000000
      0000FFF7D700F9B81200F9A90B00F9A20B00F9A40E00FEF4DD00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000CCDFE80097C3D700B5D2E000AACCDC00A0C7D900BAD5E1000000
      000000000000000000000000000000000000000000000000000000000000FEFE
      FE00F8F8F800F8F8F800FEFEFE00333333003333330000000000FEFEFE00F8F8
      F800F8F8F8000000000000000000000000000000000000000000000000000000
      0000FFFEFC00FCDF7100FBCB3500F9BF2500FACC5800FFFEFD00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000EDF4FF00D7E7FF00E4EFFF00E0ECFF00DBE9FF00E7F0FF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000B7B7B7009F9F9F0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFEFC00FFFFFE000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000100000000100010000000000800000000000000000000000
      000000000000000000000000FFFFFF00FC3F8081F0010000FE7F90A1E0010000
      FE7F90A1E0010000FE7F9428C0030000FE7F9428800300000000800080070000
      00008000800F00000000E007801F00000000F003807F00000000A001F03F0000
      00008018F03F0000E623881CE01F0000E003861EE01F0000F81FC207F03F0000
      F81FE047F03F0000F81FFE7FFCFF000000000000000000000000000000000000
      000000000000}
  end
  object img2: TImageList [7]
    Left = 642
    Top = 14
    Bitmap = {
      494C01010F001100040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000004000000001002000000000000040
      00000000000000000000000000000000000000000000E6E6E600DBDBDB00D9D9
      D900D9D9D900D9D9D900D9D9D900D9D9D900D9D9D900D9D9D900D9D9D900D9D9
      D900D9D9D900E1E1E100F8F8F8000000000000000000D0D0D000D0D0D000D0D0
      D000D0D0D000D0D0D000D0D0D000D0D0D000D0D0D0002D2D2D00313131002525
      250020202000131313000D0D0D00000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FEFE
      FE00F1F1F100ECECEC00F5F5F500000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000E8E8E800787FC300BFAA9F00B097
      8A00C9B8AF00B69E930095746200967363009474610094715F0092725E00926F
      5E0093725F0070707000D9D9D9000000000000000000DEDEDE00DBDBDB00D5D5
      D500D1D1D100CBCBCB00C8C8C800C2C2C200BEBEBE0039393900FFFFFF00FFFF
      FF0000000000FFFFFF00FFFFFF000C0C0C000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000BAB8
      B5008C8B89007676760078787800F4F4F4000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000393AC4000C1FC7008784CD007C78
      C900081DCF006262CC00FBF1E700F9EADB00F9EADC00F8EAD800F8E7D500F7E6
      CF00FBE7CE006E6E6E00D9D9D9000000000000000000E1E1E100DEDEDE00D8D8
      D800CBCBCB00CECECE00C1C1C100C5C5C500C1C1C1003F3F3F00FFFFFF00FFFF
      FF0000000000FFFFFF00FFFFFF00101010000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000F7F7F7004768
      D800A7A5A3008887870078787800ECECEC000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000005658CA002C68FF002760FF001F58
      FF001B54FF003836B300EBDBD300DDC0AF00DDBEAD00DDBBA800DDBBA500FBF2
      E300FCEEDC006E6E6E00D9D9D9000000000000000000E7E7E700E4E4E4001212
      1200A2A2A200D4D4D4009F9F9F0096969600C7C7C7004B4B4B00FFFFFF000000
      00000000000000000000000000001C1C1C000000000000000000000000000000
      00000000000000000000000000000000000000000000C6C7D0003C65E40056B6
      FF0065D3FF00C2BBB5008E8E8E00EEEEEE000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000F8F8FE00111CBB002C6DFF002258
      FF001235E000ECDED700DBBFB200DABDAD00DABAAA00DAB7A400DAB6A100FAF3
      E600FBF1E1006E6E6E00D9D9D9000000000000000000EAEAEA00B0B0B000A7A7
      A700DDDDDD00D7D7D700D4D4D400121212009696960051515100FFFFFF00FFFF
      FF0000000000FFFFFF00FFFFFF00222222000000000000000000000000000000
      0000000000000000000000000000FDFDFD00EDEDED003A64E6003582FF006BD2
      FF005DC0FF00456DD600AAA8A400FCFCFC000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000101ABA003474FB00214B
      F200296AFF00EDE0DC00DBC2B800DBBEB200DBBDAF00DBBAA800DAB8A500FBF5
      E900FCF3E4006E6E6E00D9D9D9000000000000000000F0F0F000B5B5B500AAAA
      AA00E3E3E300DDDDDD00D9D9D900111111009D9D9D005A5A5A00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF002C2C2C000000000000000000FBFBFB00D1D1
      D100B6B6B600A0A0A000AAAAAA00B6B5B400797A840058B9FF006BD3FF003E91
      FF002F62F000F2F2F20000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000326BF9003573FB003D44
      B5002558FF004341B300E9DBD500DBBFB400DBBEB000DBBAA900DBB9A600FBF5
      EB00FCF2E5006E6E6E00D9D9D9000000000000000000F3F3F300EFEFEF001515
      1500AAAAAA00E0E0E000A7A7A700A1A1A100D3D3D3005A5A5A005A5A5A005050
      5000494949003C3C3C00363636002929290000000000F8F8F800DBDBDB008585
      860078787A00757577007878790088888800B2AFAC0058B8E70059BBFF003264
      EE00B7BBCF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000004649BE007678DD00DCC8
      C300EDE2E0008F8CD300E6D6D100DBC0B600DBBFB200DBBBAB00DBB9A700FBF6
      ED00FCF3E7006E6E6E00D9D9D9000000000000000000F8F8F800F5F5F500EFEF
      EF00E4E4E400E5E5E500DADADA00DCDCDC00D9D9D900D2D2D200CFCFCF00C9C9
      C900C6C6C600BFBFBF00BCBCBC00D0D0D000FEFEFE00858788009E998E00E2BE
      8500E1C08A00E3C49000E3BB7F00707377009E9FA000C1BEB80069729300ECEC
      EC00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000C8B4AA0000000000DCC7
      C200DCC7C200E6D6D100DCC4BC00DBC1B500DBBEB300DBBBAB00DBB9A800FDF7
      EE00FEF5E8006E6E6E00D9D9D9000000000000000000FBFBFB00DDDDDD00F2F2
      F200EFEFEF00E8E8E800E5E5E500DFDFDF00DCDCDC00D5D5D500D2D2D200CCCC
      CC00C9C9C900C2C2C200BFBFBF00D0D0D000F7F7F700A59B8F00E3BF8700DABC
      8700DABA8600DBBC8600E3C79D00E6C28B007072760090909000B3B3B000FCFC
      FC00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000A8867500000000000000
      000000000000FEFEFE00FEFDFD00FEFCFA00FDFBF800FDF9F400FCF8F200FCF8
      F000FDF6EB006F6F6F00D9D9D9000000000000000000FFFFFF00BFBFBF009191
      910017171700EEEEEE0000000000E5E5E50000000000DBDBDB00000000000707
      0700B9B9B900C8C8C800C5C5C500D0D0D000B0B1B100E0C89600DBC59800DBC7
      9B00DBC79A00DAC19100DBBE8D00E3CAA400E3BE840073737300B6B6B6000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000A987760000000000E0CF
      CE00E0CFCE00E0CDCA00DFCAC600DFC7BE00DFC5BA00DFC0B200DFBFAE00FDF8
      F000FDF6EB0071717100D9D9D9000000000000000000FFFFFF00FFFFFF000202
      020088888800F1F1F10000000000E8E8E80000000000DEDEDE00000000000000
      0000D1D1D100CBCBCB00C8C8C800D0D0D000999A9E00E0CCA300DDCBA400DDCC
      A400DBCAA000DBC79A00DAC19400DEC19100E5C7960077777800AEAEAE000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000AD897800000000000000
      0000000000000000000000000000FEFDFC00FFFDFB00F6F2ED00F3ECE700E1D6
      D000CAB6AA00BBBBBB00F2F2F2000000000000000000E1E1E10018181800FFFF
      FF00BEBEBE00D7D7D70000000000232323005F5F5F0021212100909090000000
      0000D7D7D700D1D1D100CECECE00D0D0D0009D9EA200E5DBBD00E8E1C900E1D9
      BB00DED4B400DDCDA600DDC99E00DBBF8C00E5C99B007E7E7E00C4C4C4000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000AE897800000000000000
      0000000000000000000000000000FEFDFC00FFFFFE009C7A6900AA8B7800A27A
      5C0089665600ECECEC00FEFEFE000000000000000000FFFFFF00DDDDDD00FFFF
      FF00FFFFFF00FAFAFA00F7F7F700F0F0F000EDEDED00E7E7E700E4E4E4000000
      0000DADADA00D4D4D400D1D1D100D0D0D000BDBEBF00ECE3C900EBE8D500F0EF
      E300E1DABF00DFD1AC00DDCAA100DCC09100E6C794008C8C8C00DCDCDC000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000AF8B7800000000000000
      000000000000FEFEFE00FEFEFE00FEFCFA00FFFEFD00C4A38400ECC88E00B7AF
      AC00ECECEC0000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FDFDFD00F6F6F600F3F3F300EDEDED00EAEAEA000000
      0000E0E0E000DADADA00D7D7D700D0D0D00000000000C0BAA700F1F1DA00EDEC
      DD00E8E3CF00DFD1AE00DECDA600E1C6930092908A00E1E1E100FCFCFC000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000AE89790000000000FEFE
      FE00FEFEFE00FEFEFD00FEFDFC00FEFCF900FFFFFC00BC946A009D796100EDED
      ED00FEFEFE0000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00F9F9F900F6F6F600F0F0F000EDEDED006B6B
      6B00E3E3E300DDDDDD00DADADA00D0D0D00000000000ABABAE00BDB8A800ECEA
      D100E8E0C800E1D2AA00E2CFA20099948D0091919200FAFAFA00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000009E766100B18F7F00AF8D
      7B00AE8B7C00AC8A7B00AB897900A8877700AA8B7900D4CBC700F3F3F3000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000BBBB
      BC009D9EA1009A9B9E00B0B0B100F7F7F7000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FEFEFE00F3F3F300DEDE
      DE00DDDDDD00DDDDDD00DDDDDD00DDDDDD00DCDCDC00D9D9D900D9D9D900D9D9
      D900D9D9D900D9D9D900DADADA00F9F9F9000000000000000000000000000000
      0000FCFCFC00DFDFDF00E1E1E100FDFDFD000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000F1F1F100E7E7E700DCDCDC00DCDCDC00E6E6E600F0F0F0000000
      00000000000000000000000000000000000000000000F8F8F800E1E1E100D9D9
      D900D9D9D900D9D9D900D9D9D900D9D9D900D9D9D900D9D9D900D9D9D900D9D9
      D900D9D9D900E1E1E100F8F8F8000000000000000000B3CBE3003B85D2002D80
      D1002D80D0002C7ECF002A7DCF005F9CD500309855001EA635001CA42F001BA0
      2C001CA12C0025A63300179C1C00DADADA00000000000000000000000000DFDF
      DF006FA36F00188719005E775E00B0B0B000E6E6E60000000000000000000000
      000000000000000000000000000000000000000000000000000000000000DCDC
      DC00A9ABA900487E480028742500166F0F00247121005C735C0065676500A6A6
      A600D7D7D7000000000000000000000000000000000088655400997766009674
      6300967463009774640095746200967363009474610094715F0092725E00926F
      5E0093725F0070707000D9D9D9000000000000000000398DE30048ADFF0047AD
      FF0048AEFF0046ACFF0047ADFF0048ACFF008DCBF9005CDF84005CEC8F0059F3
      8F005CF490005FE8920023A73000DADADA000000000000000000FBFBFB0064AA
      64000B9E170015B02A000A910F006E6E6E00AEAEAE00FCFCFC00000000000000
      0000000000000000000000000000000000000000000000000000F5F5F5007095
      700019781600207D0000257C00002D7400002E7200001D6D0100156D0F006263
      62008B8B8B00F2F2F2000000000000000000000000009A7A6900FEF2E400F9EB
      DD00F9EBDD00F9EBDE00F9EBDC00F9EADB00F9EADC00F8EAD800F8E7D500F7E6
      CF00FBE7CE006E6E6E00D9D9D9000000000000000000368FE8004BB1FF0047AD
      FF0047ADFF0047ADFF0046ACFF0044AAFF0085C7FF0049CC6A0056EC890059F2
      8C005FF892006BFFA00025A73100D9D9D90000000000DDDDDD0060AD60001CB6
      380016AF2E0014AD2A0014AD270009910F005B7A5B00ADADAD00E5E5E5000000
      00000000000000000000000000000000000000000000D1D9D1002C872C00029E
      0500029C05000099000000980000009500000095000010860000346D00002C6C
      00001D701C008B8B8B00D7D7D70000000000000000009B7C6B00FFFDF400FCF6
      ED00FCF6ED00FBF5EC00FBF5EC00FBF5EA00FBF4EA00FBF3E800FBF3E800FBF2
      E300FCEEDC006E6E6E00D9D9D90000000000000000003B92E8004DB3FF004AB0
      FF004AB0FF0049AFFF0048AEFF0087C9FF004BAC7C0053E9880050E983005BF4
      8E0060F993006BFFA20024A93200DADADA00FCFCFC005EAF5E0011AB230019B2
      350018B1320011AD2A0011AD270015B02A0009930F006D6D6D00ADADAD00FCFC
      FC00000000000000000000000000000000000000000044964400099C0E00069F
      0E00059E0A0013B83A0014B73900009A0000009800000094000000900000386A
      00002C6D010062636200A6A6A60000000000000000009C7D6C00FFFEF600FCF7
      EF00FCF7EF00E3EBD7001B992300FBF6EC00FBF5EC00FBF4E900FBF4E800FAF3
      E600FBF1E1006E6E6E00D9D9D90000000000000000004396EC0053B9FF004FB5
      FF004EB4FF004DB3FF0076C5FF0046C3660047DD7B0049E27C004FE882005AF4
      8D0066FC9B0076FFAB0028B33800DBDBDB0076CB7C0022BC450020B940001DB6
      3C0019B83A00008300005CCC70000CAC250014AE29000A9410005A7B5A00ACAC
      AC00E4E4E400000000000000000000000000F0F2F00029B437000DA71C0005A7
      1A005DC87500F7F4F600FEF9FD003DCE6D0003A10E00019A0400009700000091
      0000376C0000136E0E0064676400F0F0F000000000009F7F7000FFFFFA00FDF9
      F300EDF2E40017B0310029B53E00159C2100F1F1E500FCF6ED00FBF5EB00FBF5
      E900FCF3E4006E6E6E00D9D9D90000000000000000004498EC0057BCFF0051B7
      FF0051B7FF0050B6FF0074C4FF003ABA5A006EE5980048E17B004DE6800063F7
      97004FD770006BF696002EB84100DEDEDE0023B336001BB9420020B942001CBB
      4000009B0000BB7C8200008A00004DC460000CAB250017B32D00099411006C6C
      6C00ABABAB00FCFCFC000000000000000000AECFAE002AB53B0011AB250051BF
      5F00FCEFFA00F4F4F400F8F7F800FDFFFF003CCE6C00049D0800029B04000095
      0000168300001D6F01005C745C00E6E6E60000000000A3807000FFFFFC00F1F5
      E9001CA9300018AE310029A1320017AE2C001F9C2700FCF6EE00FCF6ED00FBF5
      EB00FCF2E5006E6E6E00D9D9D90000000000000000004A9DF00063C3FF0056BC
      FF0056BCFF0054BAFF0053B9FF0089CEFF0057AE8B0072EA9C0055E9880053B1
      890081C6FE00797A79005BAF5B00FBFBFB00E4F8E70061CE770053D17300896B
      5B00CA8A9300BC898900C4898F00008B000057C96C000EAD270015AF2B000A97
      1200597D5900AAAAAA00E4E4E400000000003F9C3F0026B53D0033A73100E7E5
      E700EBE9EB00B0DCB600CDE9D100FCFBFC00000000003CCE6C0004A21000019A
      0300009900003074010023742000DCDCDC0000000000A4837200000000005CBC
      63004CC66700F2F5ED00FDFBF80045AA4B0045BF58003BA23F00FAF6ED00FBF6
      ED00FCF3E7006E6E6E00D9D9D90000000000000000004A9FF00067C6FF0058BE
      FF0058BEFF0056BCFF0055BBFF0052B8FF0088CDFF003ABD590045C6640082C6
      FF0046ACFE0079797900DADBDA00000000000000000085D18D0046954300CD8E
      9600C38E8F00C28F8F00C28E8F00C18C8D00008C00004DC361000EAC270017B3
      2E000A9713006B6B6B00AEAEAE00000000002C9B2C002EBA480046A54100E7E5
      E700FAEDFA0002AA1D0004AA1F00FFFDFF00FEFDFE00FDFFFF003BCD6B00039C
      0500009901003076010012700C00DCDCDC0000000000A584730000000000F0F6
      ED008DCC8D00FEFCFA00FEFCF900F8F9F2003DAA450013AB29004FA95000FDF7
      EE00FEF5E8006E6E6E00D9D9D90000000000000000004EA2F40071CDFF005DC3
      FF005DC3FF005AC0FF0059BFFF0055BBFF0052B8FF0071C3FF0072C2FF0047AD
      FF0049AFFF0079797900DCDCDC000000000000000000AB787800CB989800CA97
      9700CD9A9A00A372720097696900D7ADAE00D0949900008C000053C868000FAE
      290016B02D000C9212007B7E7B00FEFEFE0045A345005FCF7A0023C14D000098
      050010AF2C0025BE490021BA440006AB1F00B8E2BE00FAF9FA00FFFCFF003ACB
      6800009F08002B7D010026772300E7E7E70000000000A8867500000000000000
      000000000000FEFEFE00FEFDFD00FEFCFA00FDFBF8003CAF480038BB4D00FCF8
      F000FDF6EB006F6F6F00D9D9D900000000000000000050A3F50075D0FF005FC5
      FF005FC5FF004CA1D4004BA0D400479CD400459AD4004296D4003F94D40047AD
      FF004AB0FF0079797900DCDCDC000000000000000000DAB2B200C9959500D29F
      9F00DBA8A800B2A2A200DCD5D500E4C5C500D9AEAF00CA939300008E00004FC5
      66000EAE28000D9613009FA39F000000000077BB770076D991002DC557002DC7
      5D002DC65A0027C0500025BE4C001DB73E0005AA1D00FFF9FF00F8F7F800F5F7
      F8003BCB6700267F0100467F4600F1F1F10000000000A9877600000000000000
      00000000000000000000FEFEFE00FEFCFB00FDFCF900EDF2E6002CA33500FDF8
      F000FDF6EB0071717100D9D9D900000000000000000052A6F7007DD3FF0065CB
      FF007E8A9000BCBCBC00BCBCBC00BCBCBC00BCBCBC00C2C2C2007B87900048AE
      FF004BB1FF007B7B7B00DEDEDE000000000000000000B58A8A00D8B3B300B683
      8300C0AFAF00FDFDFD0000000000F2E8E800A4757500D9AEAE00D1959A00148F
      0E00019301006A6B6A00B4B4B400FEFEFE000000000072DE97007FDF9F0032CB
      650033CC66002DC65D002AC3550022BB46001EB7400002A81800B3DBBA00F3EF
      F30032C255001A7D1600A9ABA9000000000000000000AD897800000000000000
      0000000000000000000000000000FEFDFC00FFFDFB00F6F2ED00F3ECE700E1D6
      D000CAB6AA00BBBBBB00F2F2F200000000000000000053A7F8007ED4FF0063C9
      FF008B979D00E0E0E000DFDFDF00DFDFDF00DFDFDF00E7E7E70088949D0048AE
      FF004BB1FF008F8F8F00E4E4E4000000000000000000FBF8F800DABDBD00E0CF
      CF00F4F4F400000000000000000000000000F3E9E900E5C7C700D6ABAC00D48F
      9C00D48B9B007067690077777700F4F4F4000000000033B345007EE3A30032CC
      640033CC660031CA61002CC55A0024BD49001FB8410016B0300005A81A0015B0
      2F0005A4110070987000DCDCDC000000000000000000AE897800000000000000
      0000000000000000000000000000FEFDFC00FFFFFE009C7A6900AA8B7800A27A
      5C0089665600ECECEC00FEFEFE000000000000000000CCE4FC005DADFC0059AA
      F8006FA8DF00E5E5E50000000000C0C0C000000000007994AE005C9CD8003F98
      F0004C9BEB00F4F4F400FEFEFE00000000000000000000000000000000000000
      00000000000000000000000000000000000000000000F2E7E700AA7A7A00CFA3
      A300BF8A8A00B9868600926D6D00E2E2E20000000000F8FCF80043AB43007BE1
      A1007CDF9E002ECA61002AC6580024BD4A0020B9420018B1310014AD290009A0
      17002C8B2C00F6F6F600000000000000000000000000AF8B7800000000000000
      000000000000FEFEFE00FEFEFE00FEFCFA00FFFEFD00C4A38400ECC88E00B7AF
      AC00ECECEC000000000000000000000000000000000000000000000000000000
      000000000000ABABAB00F3F3F300CDCDCD00ECECEC00C7C7C700F6F6F6000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000F1E6E600E0BF
      BF00C99D9D00B98686009A6F6F00EFEFEF000000000000000000F8FCF80036B6
      470075DF9B0072DB940052D0770028BF4D001FB940001FB63A0022B53700449B
      4400D1D9D10000000000000000000000000000000000AE89790000000000FEFE
      FE00FEFEFE00FEFEFD00FEFDFC00FEFCF900FFFFFC00BC946A009D796100EDED
      ED00FEFEFE000000000000000000000000000000000000000000000000000000
      00000000000000000000D9D9D90089898900CECECE00FEFEFE00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000EFE6
      E600B0828200CAB1B100EDEDED00000000000000000000000000000000000000
      00000000000077BC770045A64500309F33003F9F3F00ADCFAD00F0F2F0000000
      000000000000000000000000000000000000000000009E766100B18F7F00AF8D
      7B00AE8B7C00AC8A7B00AB897900A8877700AA8B7900D4CBC700F3F3F3000000
      000000000000000000000000000000000000000000000000000000000000F1F1
      F100F0F0F000000000000000000000000000000000000000000000000000F0F0
      F000F2F2F200000000000000000000000000000000000000000000000000F1F1
      F100F0F0F000000000000000000000000000000000000000000000000000F0F0
      F000F2F2F200000000000000000000000000000000000000000000000000F1F1
      F100F0F0F000000000000000000000000000000000000000000000000000F0F0
      F000F2F2F200000000000000000000000000000000000000000000000000F1F1
      F100F0F0F000000000000000000000000000000000000000000000000000F0F0
      F000F2F2F2000000000000000000000000000000000000000000F6F5F400AB86
      61006E6A6700AEAEAE00DCDCDC00FEFEFE00FEFEFE00D9D9D900AFA69F00997C
      60007B7B7B00F9F9F90000000000000000000000000000000000F4F5F400707E
      7500686A6800AEAEAE00DCDCDC00FEFEFE00FEFEFE00D9D9D900A2A3A2006C70
      6D007B7B7B00F9F9F90000000000000000000000000000000000F5F4F4007E79
      79006A696900AEAEAE00DCDCDC00FEFEFE00FEFEFE00D9D9D900A3A3A300706F
      6F007B7B7B00F9F9F90000000000000000000000000000000000F4F4F5006C70
      830067686A00AEAEAE00DCDCDC00FEFEFE00FEFEFE00D9D9D900A1A2A3006B6C
      71007B7B7B00F9F9F90000000000000000000000000000000000F3D0AC00F7E3
      A200D88B2A00666666008F8F8F00E1E1E100DFDFDF00B38D6900D88C3200E8AD
      5B0086786C00F8F8F80000000000000000000000000000000000BBCAC1008ED6
      9C004F7A5B00666666008F8F8F00E1E1E100DFDFDF007A807C0051705A006991
      710071727100F8F8F80000000000000000000000000000000000CAC8C800DFB3
      B3007B686800666666008F8F8F00E1E1E100DFDFDF00807D7D0072626200977E
      7E0072727200F8F8F80000000000000000000000000000000000B6BBD100638F
      E5003A4E8600666666008F8F8F00E1E1E100DFDFDF00787A8300415178004F69
      9A0071717300F8F8F80000000000000000000000000000000000FBE9D200F7E8
      AE00F3DFA100F2D79400DF902C00B47E4900E2963500F4E0A300F3DDA000E198
      3A008E8883000000000000000000000000000000000000000000DAE7DF008EEE
      A40087E89E0081E198004B855C005F716400508960008AEDA10087E89E005582
      6100858685000000000000000000000000000000000000000000E7E2E200F5C6
      C600EDC0C000E5BBBB0085707000716C6C008A757500F2C5C500EEC1C1008572
      7200868585000000000000000000000000000000000000000000D7DAE7005C91
      FF00578AFF005283F900354C9500595F780036519B00578BFF00578AFF003E56
      9100848586000000000000000000000000000000000000000000FFFEFE00F2DF
      A100EFD18F00EECE8B00EED29200EBC27900EED19000EECD8A00EFD08E00D083
      2F00A0A0A0000000000000000000000000000000000000000000FEFEFE0084EF
      A0007AE3950078E494007AEB98006ED58B007BEB980079E296007DE39600546D
      5D00A0A0A0000000000000000000000000000000000000000000FEFEFE00F2C6
      C600E5BABA00E5BBBB00ECC1C100D5AEAE00ECC0C000E4BABA00E6BBBB006D66
      6600A0A0A0000000000000000000000000000000000000000000FEFEFF005287
      FF004A7DFF00487BFF00497EFF004171F200487EFF00497CFF004C80FF004A54
      7500A0A0A000000000000000000000000000000000000000000000000000E7A9
      4F00E6BB7200E4B26500E4B06300E3AF6100E4AF6200E5B36800E6B971008B7A
      6900BEBEBE0000000000000000000000000000000000000000000000000057BE
      750064DE87005CD981005BD880005BD880005CD9810060DA840067E089007076
      7200BEBEBE00000000000000000000000000000000000000000000000000BC99
      9900DAB4B400D4AFAF00D3AFAF00D3AEAE00D3AFAF00D6B1B100DDB7B7007674
      7400BEBEBE000000000000000000000000000000000000000000000000002E59
      DD003367FF002D60FF002B5EFF002B5EFF002C5FFF003063FF00356AFF006E70
      7800BEBEBE000000000000000000000000000000000000000000F9F9F900E599
      3200E2AB5D00E0A55300DFA25100DFA14F00DFA25000E1A65600E3AD61007069
      62009B9B9B00FAFAFA0000000000000000000000000000000000F9F9F90047AD
      670055DA7D004FD578004ED478004ED478004FD5780054D67C0059DD81006567
      66009B9B9B00FAFAFA0000000000000000000000000000000000F9F9F900AB8B
      8B00D3AFAF00CDAAAA00CCAAAA00CCAAAA00CCAAAA00CFACAC00D7B2B2006766
      66009B9B9B00FAFAFA0000000000000000000000000000000000F9F9F9002148
      CD002358FF001E51FF001F52FF001E51FF001F52FF002457FF00285EFF006365
      68009B9B9B00FAFAFA00000000000000000000000000D6D5D400D3945100EECE
      A500EAC69700EAC19000E5B27900D6832500D6862B00D88C3200D9903800DF8B
      2800A8814F009B9B9B00D9D9D9000000000000000000D4D5D4006B997A00A3ED
      BB0098E7B20095E5AF007FDF9F0030CC640036CC68003BCE6B0040CF6E0042A3
      610064776A009B9B9B00D9D9D9000000000000000000D5D4D400998D8D00E5D6
      D600E0CFCF00DECDCD00D5C3C300BC9F9F00BEA0A000C1A3A300C3A4A4009E84
      8400787171009B9B9B00D9D9D9000000000000000000D4D4D500596BAC008BA5
      FF007F9AFF007C96FF006081FF000033FF000639FF000C3FFF001043FF001F44
      C3005D647E009B9B9B00D9D9D90000000000F9F9F900D3944800EEBB7800EBC4
      9800E9C09100E7BA8800E6B98700DC974D00D1761300D37C1E00D5822400D98F
      3600DC8B2A006362620098989800FAFAFA00F9F9F900649C750086D29E009AE5
      B30096E4B00091E1AB0092E1AB005ED283002BC55C002FC9620031CC64003CD6
      6E0041AC64006262620098989800FAFAFA00F9F9F9009C898900CEBABA00DECF
      CF00DCCECE00D9CBCB00D9CACA00C7B2B200B59A9A00BA9D9D00BD9F9F00C9A7
      A700A58A8A006262620098989800FAFAFA00F9F9F9004F64B2006B87EA00829B
      FF007E98FE007892FD007993FC00395FFB00002BFB000031FF000034FE000940
      FF001C43CF006262620098989800FAFAFA00EBA74600EED3B200EDCAA300EAC1
      9600E8BD9000E6B78900E5B58700E3B28200E3B28100E5B38300E7B48300E6B7
      8600E7B98900E9B47400AF804A00E4E4E40068B58100B2EEC500A8E9BD00A2E3
      B600A0E1B3009BDDAE0099DCAC0095DAA80095DAA80097DCAB0097DFAC0093E1
      AC0091E3AC0084CB9A0062796800E4E4E400B49B9B00E8DDDD00E1D7D700DDD2
      D200DBD0D000D7CDCD00D6CCCC00D4CACA00D4C9C900D7CCCC00D8CCCC00D8CB
      CB00DACCCC00C7B5B50079717100E4E4E4004E68CE009EB3FF0093A9FF008FA3
      FA008DA0F800899CF5008799F5008296F4008295F4008298F6008197F8007992
      FE007791FF006A86E30058628300E4E4E400F2A33800EED4B800EDCDAE00EAC3
      9E00E8C09900E5B99100E3B68F00E2B38B00E1B28900E2B28600E4B38600E6B8
      8900E7BB8F00EECDAA00DB8D2E00F0F0F0005BBB7B00B9EFCB00B3EAC500ADE5
      BD00A8E2B900A0DCB0009EDAAE009AD9AA0099D9AA0097DBAA0099DEAD009BE4
      B1009AE7B300AAF9C300558B6600F0F0F000B99C9C00E9DFDF00E4DCDC00E0D6
      D600DDD5D500D7CECE00D6CDCD00D4CBCB00D4CACA00D5CBCB00D8CDCD00DDD0
      D000E0D2D200F1E1E1008B787800F0F0F0003B5CDB00A8BAFF00A3B5FF009DAD
      FB0099A9F80091A1F3008F9EF2008B9BF1008999F1008699F4008599F800849A
      FF00829BFF0091ACFF0041559D00F0F0F00000000000FFFCF800FDF1E000FADD
      B800F9D09A00E4BFA200E2BDA300E0B89B00E0B89C00CE8A3900D7B28800F4E3
      CF00F8F3EB0000000000000000000000000000000000F9FCFA00E6F4EA00C3E3
      CF00AAD7B900ACDBB600ABDAB600A5D8B000A7DAB100558E670097B3A000D6E2
      DA00ECF2EF0000000000000000000000000000000000FCFBFB00F4F0F000E3D9
      D900D7C8C800D9D2D200D6D2D200D4CFCF00D5D0D0008D7B7B00B3AAAA00E2DE
      DE00F2F0F00000000000000000000000000000000000F8F9FF00E0E6FA00B9C3
      EE009CAAE600A3ACEE00A3ACED009BA6EC009CA6ED004055A1008D97BE00D1D6
      E800EBECF4000000000000000000000000000000000000000000000000000000
      000000000000EFA75200E3C3B200E0BBA500E1BEAF009E989000E4E4E4000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000071BF8800B6DEBE00ABD8B400B4DEBB0093999500E4E4E4000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000BDA9A900DBD9D900D5D1D100DBD7D70099979700E4E4E4000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000005A71DB00B2B8F000A5ACEB00ADB4F00090939B00E4E4E4000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FDD8A500E9B07400E1C6BD00EBAA5E00DCDCDC00FEFEFE000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000B4E3C30089C99A00BEDDC3007ABF8C00DCDCDC00FEFEFE000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000E3D3D300C8B9B900DCDADA00BFABAB00DCDCDC00FEFEFE000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000A6B4F1007989DF00BCBEED00657AD900DCDCDC00FEFEFE000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFEFB00F2A03100E4D0CE00E69B3100F0F0F000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FCFEFD0058B97700CBE1CC0059AD7400F0F0F000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FEFDFD00B99B9B00E0E2E200AD919100F0F0F000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FBFCFF003A59D900CDCDED003A59CB00F0F0F000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFDFA00F1C38400F1F0EF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FBFEFC0099D1AD00EFF0EF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FEFDFD00D1BDBD00F0F0F00000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FAFBFF008499E700EFEFF00000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000EAEAEA00E1E1E100DEDE
      DE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDE
      DE00DEDEDE00E1E1E100EBEBEB00000000000000000000000000000000000000
      0000F7F7F700DDDDDD00EDEDED00000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000F1F1
      F100F0F0F000000000000000000000000000000000000000000000000000F0F0
      F000F2F2F2000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000DFDFE900253ACF002339CE002339
      CE00233BD000233DD200233DD300233ED700233ED800233ED900233EDB002340
      DD00233FDE004A5EB70067676B00EBEBEB00000000000000000000000000F2F2
      F200458F45001681160069696900DEDEDE000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000F4F4F5006B79
      7E0067696A00AEAEAE00DCDCDC00FEFEFE00FEFEFE00D9D9D900A1A3A3006B6E
      70007B7B7B00F9F9F90000000000000000000000000000000000000000000000
      0000FEFEFE00E4E4E400E1E1E100FCFCFC000000000000000000000000000000
      0000000000000000000000000000000000005D6EDC006581F7005C7CFC00456F
      FD003A6BFC002664FB001F62FB001B68FC001E6FFC00257CFD002781FD002A87
      FC002986FE000E4BFA004A5DB500E1E1E1000000000000000000F1F1F100208E
      200015B02C0011AC2500058A060065656500DDDDDD0000000000000000000000
      0000000000000000000000000000000000000000000000000000B5C7CA007EDE
      E200416F7B00666666008F8F8F00E1E1E100DFDFDF00777C8000496E72005F94
      980071727200F8F8F8000000000000000000000000000000000000000000ECEC
      EC009BB49B001B891D0055815500A0A0A000DEDEDE0000000000000000000000
      0000000000000000000000000000000000002130D0006A85FB00577AFE003D6D
      FF003268FF001C62FF001865FF002074FF00247CFF002D8BFF002F94FF00349A
      FF003299FF002983FD001F3ADA00DEDEDE0000000000F1F1F1001E941E001AB3
      340015AE2D0014AD290013AC2500058B070065656500DCDCDC00000000000000
      0000000000000000000000000000000000000000000000000000D7E2E70079FA
      FF0071F3FF0069E9F9003A7C8A0059696F003F84930072F8FF0073F2FF004882
      8A00848586000000000000000000000000000000000000000000FEFEFE0097B7
      97000D93110015B22A000B9B150065656500A0A0A000FBFBFB00000000000000
      000000000000000000000000000000000000212FCD006582FB005376FE003869
      FF002C64FF00175FFF001864FF002074FF00237DFF002B8CFF002F93FF00349A
      FF003399FF002982FE001F39D700DEDEDE00F1F1F1001B991B001EB73D0019B2
      350018B1310010AE280013AD290012AC2700048C080063636300DCDCDC000000
      0000000000000000000000000000000000000000000000000000FEFEFE006CFB
      FF0060EBFF005CECFF005FF5FF0053DBF0005EF5FF005FECFF0062ECFF004D66
      6E00A0A0A00000000000000000000000000000000000ECECEC0099BA99001AB6
      360016B0300014AD290014AD27000A9A14004F864F00A1A1A100DEDEDE000000
      000000000000000000000000000000000000212AC500607DF9004D71FD003263
      FF00255DFF00125AFF001661FF001D70FF002178FF002883FF002A8AFF002D8E
      FF002E8DFF00257BFC001F34CD00DEDEDE001BA3200021BB45001EB73D001CB5
      39001AB73800009300007DD38A0012AE280014AD2A00068B080062626200DBDB
      DB000000000000000000000000000000000000000000000000000000000039BA
      D40042E5FF003ADFFF0038DEFF0038DEFF0039DEFF003FE0FF0046E8FF006E73
      7600BEBEBE00000000000000000000000000FEFEFE009BBC9B00109D15001AB4
      350018B1310013AE2A0013AD290014B028000A9A140066666600A2A2A200FBFB
      FB00000000000000000000000000000000002129C1005F7BF8004C6FFE003060
      FF00235AFF001157FF00155EFF001C6CFF001F72FF00267EFF002782FF002988
      FF002987FF002376FB001F33CC00DEDEDE006DD588001FBB430020B941001FBB
      40003E6C2200C87F9000008E00007CD48B0012AE290013AD2A00058C08006262
      6200DADADA000000000000000000000000000000000000000000F9F9F90029A4
      C1002EE0FF0028D9FF0028D9FF0027D8FF0029D9FF002FDBFF0035E5FF006366
      67009B9B9B00FAFAFA000000000000000000B5D9B80022BB45001FB840001DB6
      39001BB53A000E9F170076D186000EAC250014AE29000A99140052855200A3A3
      A300E0E0E0000000000000000000000000002123BA00607BF5004E6EF9002F5D
      FF002256FF000E50FF001156FF001762FF001968FF001E71FF002074FF002177
      FF002178FF001C69FB001F2FC400DEDEDE0021B2340090E0A6003FC761004671
      2B00C08A8C00BA878700CC879400008E00007ED48D0013AF2A0015AE2B00068F
      0A0062626200D9D9D900000000000000000000000000D4D4D500598C97008EF0
      FF0082E7FF007DE6FF0060E0FF0000CEFF0008CEFF000FD0FF0015D2FF00239D
      BB005C7076009B9B9B00D9D9D900000000002CAF39001FBA43001FB841001FB8
      40001BB437009CC09C00139A13003FBF53000EAC260017B22C000A9914006767
      6700A3A3A300FBFBFB0000000000000000002123B400647CF300506FF600315C
      FE002355FF000D4CFF000E51FF00145EFF001762FF001B6AFF001C6DFF001D6F
      FF001D6FFF001964FA001F2EBF00DEDEDE0000000000ACDDB30079655000C590
      9100C28F8F00C3909000C38F8F00D48E9C00008F00007FD48E0013AF2C0014AE
      2C000690090061626100DCDCDC0000000000F9F9F9004F879C006ECAE10083E6
      FF007EE5FE0078E2FD0079E2FC0039D4FB0000C7FB0000CBFF0002CDFE000EDB
      FF0020A6C8006262620098989800FAFAFA0085CE8F006FD58B0038C45B002CA3
      2E00BFCABF0000000000000000000F9A0F0074D2850010AE270014AD2B000A99
      140054835400A5A5A500E1E1E100000000002121AC006C81EF005973F100395E
      FA002A56FF001249FF000A47FF000E50FF001055FF00135BFF00145EFF001560
      FF00155FFF001256F8001F2CB800DEDEDE00FCFCFC0098696900C7949400C895
      9500CC999900C9969600D8B5B500CA989800D993A200008E00007FD58F0014B0
      2D0016AF2D00068F0C0091919100000000004E9AB5009FF1FF0094EAFF008FE4
      FA008DE2F80089DEF50087DDF50082DBF40082DBF40082DDF60081E0F80079E3
      FE0076E4FF006DC8DE0058717800E4E4E400FEFFFE002ABB410042C05800CCDA
      CC00F6F6F6000000000000000000C4EBC4000D9A0D003ABD500010AE280017B3
      2E000A99140068686800A6A6A600FCFCFC002121AA007285ED005F76EE004062
      F6003158FC00174AFF000C45FF000B49FF000C4FFF001054FF001156FF001158
      FF001157FF000F4EF7001F2AB400DEDEDE00E4D3D300DDBCBC00CB989800D09D
      9D00D09D9D00B8ABAB00E0CDCD00DCB5B500CE9B9B00DC95A400008E000080D5
      910011AE2B0010A32000C1C1C100000000003CA0C000A8F3FF00A3EEFF009DE7
      FB0099E4F90091DDF3008FDBF2008BDAF10089DAF10086DDF40085DFF80084E6
      FF0082EAFF0093FEFF00427C8E00F0F0F0000000000000000000000000000000
      000000000000000000000000000000000000000000000C9C0D007AD58C0011AF
      2A0015AE2D000A9913005A7D5A00E1E1E1002121A100808EE9006E80EA00506B
      EF004262F2002851FA001C49FF000940FF00063FFF000844FF000946FF000A48
      FF000A47FF00083FF7001F27AD00DEDEDE0000000000B8888800DCB1B100D6A4
      A400BBACAC00FDFDFD0000000000E2CDCD00DFB8B800CF9B9B00DA94A2000091
      000017AE2B0065986500F7F7F7000000000000000000F8FBFC00E0F0F400B9D9
      E3009CC8D600A3DCEE00A3DBEE009BD9EC009CDBEE0040798C008DA9B200D1DE
      E200EBF0F2000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000BAE7BA000A9C0C0035BB
      4C0011AF2B0018B533001A8B1C00E4E4E40021219E008894E8007686E8005A71
      EB004C68EE003357F500274FF8001343FF000B3FFE00053DFF00053EFF000640
      FF00063FFF000539F7001F26AA00DEDEDE000000000000000000C8A0A000E1D3
      D300FEFEFE00000000000000000000000000E0CBCB00DFB9B900CC979700CC90
      9600CD8995008E767600A1A1A100FCFCFC000000000000000000000000000000
      0000000000005AABC600B2E2F100A5D9EB00ADE1F20090979900E4E4E4000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000089D
      0E0074D58900089C13008CB28C00FDFDFD0021219E009BA3E8008A94E5006F7F
      E6006376E8004C66EB00415EEE002F52F200274DF5001B46F8001743FA001442
      FB001542FC00173EF2001F22A200E1E1E1000000000000000000000000000000
      00000000000000000000000000000000000000000000E1CACA00DDB6B600C592
      9200BD8A8A00B885850084747400E2E2E2000000000000000000000000000000
      000000000000A6D3E20079BBD200BCDEEE0065ADC700DCDCDC00FEFEFE000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000B5E2
      B50022A122009ACB9A00F1F1F100000000002424A300ABB1EA0098A0E7007E8B
      E7007282E6005B70EA005169EA00405DEE003758F1002D51F400294FF500264C
      F400274CF4002043EB002222A000EAEAEA000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000E1C8C800D8B2
      B200BE888800B7838300936D6D00EDEDED000000000000000000000000000000
      000000000000FBFDFE003A9CBC00CDE6F0003A91AE00F0F0F000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000F0F0F8002424A20021219E002121
      9E0021219E0021219E0021219E0021219E0021219E0021219E0021219E002121
      9E0021219E005D5DB900DFDFE600000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000E2C7
      C700CBA1A100A8737300D3D1D100000000000000000000000000000000000000
      00000000000000000000FAFDFE0084BDD100EFF0F00000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000400000000100010000000000000200000000000000000000
      000000000000000000000000FFFFFF0080018000FFE1000000010000FFE00000
      00010000FFC0000000010000FF80000000010000FE00000080010000C0030000
      800100008007000080010000000F0000A0010000000F0000B8010000001F0000
      A0010000001F0000BE010000001F0000BE010000001F0000B8070000801F0000
      A0070000803F0000801F0001E0FF00008000F0FFF81F80018000E07FE0078001
      8000C03FC00380018000801F800180018000000F800180018000000700008001
      8000000300008001800000010080A001800180010000A001800180000000B801
      800180010000BC01800182008001BE01800187008001BE018281FF808003B807
      F81FFFC0C007A007FC3FFFE1F81F801FE7E7E7E7E7E7E7E7C003C003C003C003
      C003C003C003C003C007C007C007C007C007C007C007C007E007E007E007E007
      C003C003C003C003800180018001800100000000000000000000000000000000
      00000000000000008007800780078007F81FF81FF81FF81FF81FF81FF81FF81F
      F83FF83FF83FF83FFC7FFC7FFC7FFC7FFFFF8001F1FFE7E7FFFF0000E0FFC003
      F0FF0000C07FC003E07F0000803FC007C03F0000001FC007801F0000000FE007
      000F00000007C003000700000003800100030000800100000601000000010000
      0600000000010000FF80000082018007FF800000C700F81FFFE00000FF80F81F
      FFE10000FFC0F83FFFFF0001FFE1FC7F00000000000000000000000000000000
      000000000000}
  end
  object popGridVendas: TPopupMenu [8]
    Left = 659
    Top = 372
    object VisualizarDanfe1: TMenuItem
      Caption = 'Visualizar Danfe'
      OnClick = VisualizarDanfe1Click
    end
    object ReimprimirDanfe1: TMenuItem
      Caption = 'Reimprimir Danfe'
      OnClick = ReimprimirDanfe1Click
    end
    object E2: TMenuItem
      Caption = 'Enviar nota por email'
      OnClick = E2Click
    end
    object D1: TMenuItem
      Caption = 'Detalhamento da venda'
      OnClick = D1Click
    end
    object N1: TMenuItem
      Caption = '-'
    end
    object E3: TMenuItem
      Caption = 'Emitir NF-e referenciada'
      OnClick = E3Click
    end
    object Cartadecorreo1: TMenuItem
      Caption = 'Carta de corre'#231#227'o'
      OnClick = Cartadecorreo1Click
    end
    object CancelarNFENFCe1: TMenuItem
      Caption = 'Cancelar NFE / NFC-e selecionada'
      OnClick = CancelarNFENFCe1Click
    end
    object E1: TMenuItem
      Caption = 'Exportar XML e PDF (Selecionada)'
      OnClick = E1Click
    end
    object ExportarXMLePDFTodasasnotas1: TMenuItem
      Caption = 'Exportar XML e PDF (Todas as notas)'
      OnClick = ExportarXMLePDFTodasasnotas1Click
    end
    object C3: TMenuItem
      Caption = 'Cancelar documento por XML'
      OnClick = C3Click
    end
    object N3: TMenuItem
      Caption = '-'
    end
    object d2: TMenuItem
      Caption = 'Devolu'#231#227'o de venda (Cancelamento extempor'#226'neo)'
      OnClick = d2Click
    end
    object N2: TMenuItem
      Caption = '-'
    end
    object C1: TMenuItem
      Caption = 'Copiar XML para a '#225'rea de transfer'#234'ncia'
      OnClick = C1Click
    end
    object C2: TMenuItem
      Caption = 'Copiar chave do documento'
      OnClick = C2Click
    end
    object Copiartodasaschavesdalista1: TMenuItem
      Caption = 'Copiar todas as chaves da lista'
      OnClick = Copiartodasaschavesdalista1Click
    end
  end
  object cxStyleRepository1: TcxStyleRepository [9]
    Left = 27
    Top = 453
    PixelsPerInch = 96
    object cxStyle2: TcxStyle
      AssignedValues = [svColor, svFont]
      Color = 13553358
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 12615680
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
    end
    object stlRegistro: TcxStyle
      AssignedValues = [svFont]
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 12615680
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
    end
    object stConfirmada: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 11526823
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      TextColor = clBlack
    end
    object stCancelada: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 8816381
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsStrikeOut]
      TextColor = clBlack
    end
    object stCiencia: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 10354687
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      TextColor = clBlack
    end
    object stSemManifesto: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 12615680
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      TextColor = clWhite
    end
    object stNaoRealizada: TcxStyle
      AssignedValues = [svFont]
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 8695039
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
    end
  end
  object dxComponentPrinter1: TdxComponentPrinter [10]
    CurrentLink = dxComponentPrinter1Link1
    Version = 0
    Left = 360
    Top = 360
    PixelsPerInch = 96
    object dxComponentPrinter1Link1: TdxGridReportLink
      Component = cxGrid1
      PrinterPage.DMPaper = 9
      PrinterPage.Footer = 6350
      PrinterPage.GrayShading = True
      PrinterPage.Header = 6350
      PrinterPage.Margins.Bottom = 12700
      PrinterPage.Margins.Left = 12700
      PrinterPage.Margins.Right = 12700
      PrinterPage.Margins.Top = 12700
      PrinterPage.Orientation = poLandscape
      PrinterPage.PageSize.X = 210000
      PrinterPage.PageSize.Y = 297000
      PrinterPage._dxMeasurementUnits_ = 0
      PrinterPage._dxLastMU_ = 2
      PixelsPerInch = 96
      BuiltInReportLink = True
    end
  end
end
