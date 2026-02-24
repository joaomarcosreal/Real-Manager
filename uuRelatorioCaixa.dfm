inherited frmRelatorioCaixa: TfrmRelatorioCaixa
  Left = 427
  Top = 90
  BorderIcons = []
  BorderStyle = bsNone
  Caption = 'Relat'#243'rio de Caixa'
  ClientHeight = 653
  ClientWidth = 1010
  Font.Color = clNavy
  OnDestroy = FormDestroy
  ExplicitWidth = 1010
  ExplicitHeight = 653
  TextHeight = 13
  inherited botao_pesquisa: TSpeedButton
    Top = -42
    ExplicitTop = -42
  end
  object SpeedButton1: TSpeedButton [1]
    Left = 134
    Top = -31
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
  object SpeedButton2: TSpeedButton [2]
    Left = 86
    Top = -63
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
    Top = -37
    ExplicitTop = -37
  end
  object Edit2: TEdit [4]
    Left = 8
    Top = -26
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
  object Edit3: TEdit [5]
    Left = -8
    Top = -24
    Width = 121
    Height = 21
    TabOrder = 2
    Text = 'Edit1'
    Visible = False
    OnEnter = Edit1Enter
    OnExit = Edit1Exit
    OnKeyDown = Edit1KeyDown
  end
  object pgList: TJvPageList [6]
    Left = 0
    Top = 0
    Width = 1010
    Height = 653
    ActivePage = pgListagem
    PropagateEnable = False
    Align = alClient
    object pgListagem: TJvStandardPage
      Left = 0
      Top = 0
      Width = 1010
      Height = 653
      Caption = '.'
      Color = clWhite
      object Panel6: TPanel
        Left = 0
        Top = 31
        Width = 1010
        Height = 90
        Align = alTop
        BevelOuter = bvNone
        Color = clWhite
        ParentBackground = False
        TabOrder = 0
        StyleElements = []
        DesignSize = (
          1010
          90)
        object btExibirCaixas: TPngSpeedButton
          Left = 861
          Top = 8
          Width = 142
          Height = 69
          Anchors = [akTop, akRight]
          Caption = 'Exibir caixas'
          Flat = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          Layout = blGlyphTop
          ParentFont = False
          OnClick = PngSpeedButton1Click
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
        object GroupBox1: TGroupBox
          Left = 2
          Top = 6
          Width = 359
          Height = 79
          Caption = 'Empresa'
          Color = clWhite
          ParentBackground = False
          ParentColor = False
          TabOrder = 0
          object cbEmpresas: TcxCheckComboBox
            Left = 4
            Top = 25
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
            Width = 341
          end
        end
        object RadioGroup1: TRadioGroup
          Left = 389
          Top = 6
          Width = 265
          Height = 81
          Caption = 'Informe o Per'#237'odo'
          Color = clWhite
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Verdana'
          Font.Style = [fsBold]
          ParentBackground = False
          ParentColor = False
          ParentFont = False
          TabOrder = 1
        end
        object Panel2: TPanel
          Left = 389
          Top = 33
          Width = 256
          Height = 52
          BevelOuter = bvNone
          Color = clWhite
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentBackground = False
          ParentFont = False
          TabOrder = 2
          StyleElements = []
          object Label4: TLabel
            Left = 135
            Top = -4
            Width = 34
            Height = 20
            Caption = 'At'#233':'
            Color = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -16
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentColor = False
            ParentFont = False
            StyleElements = []
          end
          object Label1: TLabel
            Left = 4
            Top = -4
            Width = 29
            Height = 20
            Caption = 'De:'
            Color = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -16
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentColor = False
            ParentFont = False
            StyleElements = []
          end
          object cbk_visualizar: TCheckBox
            Left = 151
            Top = -38
            Width = 153
            Height = 17
            Caption = 'Visualizar Relat'#243'rio'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 0
            Visible = False
          end
          object ed_data_inicial: TAdvDateTimePicker
            Left = 4
            Top = 16
            Width = 118
            Height = 32
            Date = 43537.000000000000000000
            Format = ''
            Time = 0.668379629627452200
            DoubleBuffered = True
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -19
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            Kind = dkDate
            ParentDoubleBuffered = False
            ParentFont = False
            TabOrder = 1
            BorderStyle = bsSingle
            Ctl3D = True
            DateTime = 43537.668379629630000000
            Version = '1.3.6.6'
            LabelFont.Charset = DEFAULT_CHARSET
            LabelFont.Color = clWindowText
            LabelFont.Height = -11
            LabelFont.Name = 'Tahoma'
            LabelFont.Style = []
          end
          object ed_data_final: TAdvDateTimePicker
            Left = 128
            Top = 16
            Width = 125
            Height = 32
            Date = 43537.000000000000000000
            Format = ''
            Time = 0.669004629628034300
            DoubleBuffered = True
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -19
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            Kind = dkDate
            ParentDoubleBuffered = False
            ParentFont = False
            TabOrder = 2
            BorderStyle = bsSingle
            Ctl3D = True
            DateTime = 43537.669004629630000000
            Version = '1.3.6.6'
            LabelFont.Charset = DEFAULT_CHARSET
            LabelFont.Color = clWindowText
            LabelFont.Height = -11
            LabelFont.Name = 'Tahoma'
            LabelFont.Style = []
          end
        end
        object rdStatusAuditoria: TcxRadioGroup
          Left = 660
          Top = 8
          Properties.Items = <
            item
              Caption = 'Todos'
            end
            item
              Caption = 'N'#227'o auditados'
            end
            item
              Caption = 'Auditados'
            end
            item
              Caption = 'Auditoria iniciada e n'#227'o finalizada'
            end>
          ItemIndex = 0
          TabOrder = 3
          Height = 77
          Width = 195
        end
      end
      object dsa: TPanel
        Left = 0
        Top = 598
        Width = 1010
        Height = 55
        Align = alBottom
        Color = clWhite
        ParentBackground = False
        TabOrder = 1
        StyleElements = []
        DesignSize = (
          1010
          55)
        object btFechar: TAdvGlassButton
          Left = 862
          Top = 6
          Width = 140
          Height = 48
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
          TabOrder = 0
          Version = '1.3.3.1'
          OnClick = btFecharClick
        end
      end
      object pgGrid: TPanel
        Left = 0
        Top = 121
        Width = 1010
        Height = 477
        Align = alClient
        Caption = 'pgGrid'
        TabOrder = 2
        StyleElements = []
        object cxGrid1: TcxGrid
          Left = 1
          Top = 1
          Width = 1008
          Height = 475
          Align = alClient
          TabOrder = 0
          object cxGrid1DBTableView1: TcxGridDBTableView
            PopupMenu = PopupMenu1
            Navigator.Buttons.CustomButtons = <>
            ScrollbarAnnotations.CustomAnnotations = <>
            DataController.DataSource = dmAuditoriaCaixas.dsQryListagemCaixas
            DataController.Summary.DefaultGroupSummaryItems = <>
            DataController.Summary.FooterSummaryItems = <
              item
                FieldName = 'TOTAL_SUPRIMENTOS'
              end
              item
                FieldName = 'TOTAL_SANGRIAS'
              end
              item
                FieldName = 'TOTAL_RECEBIMENTOS'
              end
              item
                Kind = skSum
                Column = cxGrid1DBTableView1TOTAL_RECEBIMENTOS
              end
              item
                Kind = skSum
                Column = cxGrid1DBTableView1TOTAL_SUPRIMENTOS
              end
              item
                Kind = skSum
                Column = cxGrid1DBTableView1TOTAL_SANGRIAS
              end
              item
                Kind = skSum
                Column = cxGrid1DBTableView1TOTAL_SISTEMA
              end
              item
                Kind = skSum
                Column = cxGrid1DBTableView1TOTAL_OPERADOR
              end
              item
                Kind = skSum
              end
              item
                Kind = skSum
                Column = cxGrid1DBTableView1DIFERENCA_TOTAL
              end
              item
                Kind = skSum
                Column = cxGrid1DBTableView1DIFERENCA_PAGAR
              end
              item
                Format = '# registros'
                Kind = skCount
                Column = cxGrid1DBTableView1CODIGO
              end>
            DataController.Summary.SummaryGroups = <>
            OptionsData.CancelOnExit = False
            OptionsData.Deleting = False
            OptionsData.DeletingConfirmation = False
            OptionsData.Editing = False
            OptionsData.Inserting = False
            OptionsView.CellAutoHeight = True
            OptionsView.DataRowHeight = 18
            OptionsView.Footer = True
            Styles.Content = cxStyle2
            Styles.ContentOdd = stlRegistro
            object cxGrid1DBTableView1CODIGO: TcxGridDBColumn
              Caption = 'Caixa n'#186
              DataBinding.FieldName = 'CODIGO'
              DataBinding.IsNullValueType = True
              Width = 48
            end
            object cxGrid1DBTableView1AUDITADO: TcxGridDBColumn
              Caption = 'Auditado ?'
              DataBinding.FieldName = 'AUDITADO'
              DataBinding.IsNullValueType = True
              PropertiesClassName = 'TcxTextEditProperties'
              Properties.Alignment.Horz = taCenter
              OnCustomDrawCell = cxGrid1DBTableView1AUDITADOCustomDrawCell
              Width = 51
            end
            object cxGrid1DBTableView1DESCRICAO_EMPRESA: TcxGridDBColumn
              Caption = 'Empresa'
              DataBinding.FieldName = 'DESCRICAO_EMPRESA'
              DataBinding.IsNullValueType = True
              Width = 150
            end
            object cxGrid1DBTableView1NOME_USUARIO: TcxGridDBColumn
              Caption = 'Operador'
              DataBinding.FieldName = 'NOME_USUARIO'
              DataBinding.IsNullValueType = True
            end
            object cxGrid1DBTableView1DATA_SISTEMA: TcxGridDBColumn
              Caption = 'Movimento de'
              DataBinding.FieldName = 'DATA_SISTEMA'
              DataBinding.IsNullValueType = True
              Width = 74
            end
            object cxGrid1DBTableView1ABERTURA: TcxGridDBColumn
              Caption = 'Hora de abertura'
              DataBinding.FieldName = 'ABERTURA'
              DataBinding.IsNullValueType = True
              Width = 111
            end
            object cxGrid1DBTableView1PARCIAIS_IMPRESSOS: TcxGridDBColumn
              Caption = 'Impress'#245'es'
              DataBinding.FieldName = 'PARCIAIS_IMPRESSOS'
              DataBinding.IsNullValueType = True
              Width = 60
            end
            object cxGrid1DBTableView1TOTAL_SUPRIMENTOS: TcxGridDBColumn
              Caption = 'Suprimentos'
              DataBinding.FieldName = 'TOTAL_SUPRIMENTOS'
              DataBinding.IsNullValueType = True
              PropertiesClassName = 'TcxCurrencyEditProperties'
              Width = 68
            end
            object cxGrid1DBTableView1TOTAL_RECEBIMENTOS: TcxGridDBColumn
              Caption = 'Vendas'
              DataBinding.FieldName = 'TOTAL_RECEBIMENTOS'
              DataBinding.IsNullValueType = True
              PropertiesClassName = 'TcxCurrencyEditProperties'
              Width = 70
            end
            object cxGrid1DBTableView1TOTAL_SANGRIAS: TcxGridDBColumn
              Caption = 'Sangrias'
              DataBinding.FieldName = 'TOTAL_SANGRIAS'
              DataBinding.IsNullValueType = True
              PropertiesClassName = 'TcxCurrencyEditProperties'
              Width = 59
            end
            object cxGrid1DBTableView1TOTAL_SISTEMA: TcxGridDBColumn
              Caption = 'Total sistema'
              DataBinding.FieldName = 'TOTAL_SISTEMA'
              DataBinding.IsNullValueType = True
              PropertiesClassName = 'TcxCurrencyEditProperties'
              Width = 75
            end
            object cxGrid1DBTableView1TOTAL_OPERADOR: TcxGridDBColumn
              Caption = 'Operador'
              DataBinding.FieldName = 'TOTAL_OPERADOR'
              DataBinding.IsNullValueType = True
              PropertiesClassName = 'TcxCurrencyEditProperties'
              Width = 76
            end
            object cxGrid1DBTableView1DIFERENCA_TOTAL: TcxGridDBColumn
              Caption = 'Diferen'#231'a operador'
              DataBinding.FieldName = 'DIFERENCA_TOTAL'
              DataBinding.IsNullValueType = True
              PropertiesClassName = 'TcxCurrencyEditProperties'
              Width = 101
            end
            object cxGrid1DBTableView1DIFERENCA_PAGAR: TcxGridDBColumn
              Caption = 'Diferen'#231'a auditoria'
              DataBinding.FieldName = 'DIFERENCA_PAGAR'
              DataBinding.IsNullValueType = True
              PropertiesClassName = 'TcxCurrencyEditProperties'
              Width = 101
            end
            object cxGrid1DBTableView1USUARIO_AUDITORIA: TcxGridDBColumn
              Caption = 'Auditado por'
              DataBinding.FieldName = 'USUARIO_AUDITORIA'
              DataBinding.IsNullValueType = True
              Width = 129
            end
            object cxGrid1DBTableView1DATA_AUDITORIA: TcxGridDBColumn
              Caption = 'Data auditoria'
              DataBinding.FieldName = 'DATA_AUDITORIA'
              DataBinding.IsNullValueType = True
              Width = 103
            end
            object cxGrid1DBTableView1SINCRONIZADO: TcxGridDBColumn
              Caption = 'Sincronizado ?'
              DataBinding.FieldName = 'SINCRONIZADO'
              DataBinding.IsNullValueType = True
              OnCustomDrawCell = cxGrid1DBTableView1SINCRONIZADOCustomDrawCell
              Width = 69
            end
            object cxGrid1DBTableView1STATUS: TcxGridDBColumn
              Caption = 'Status'
              DataBinding.FieldName = 'STATUS'
              DataBinding.IsNullValueType = True
              OnCustomDrawCell = cxGrid1DBTableView1STATUSCustomDrawCell
            end
            object cxGrid1DBTableView1FECHAMENTO: TcxGridDBColumn
              Caption = 'Hora de fechamento'
              DataBinding.FieldName = 'FECHAMENTO'
              DataBinding.IsNullValueType = True
              Width = 108
            end
            object cxgrdbclmnGrid1DBTableView1Historico: TcxGridDBColumn
              Caption = 'Hist'#243'rico auditoria'
              DataBinding.FieldName = 'HISTORICO'
              DataBinding.IsNullValueType = True
              BestFitMaxWidth = 40
              MinWidth = 40
              Width = 229
            end
          end
          object cxGrid1Level1: TcxGridLevel
            GridView = cxGrid1DBTableView1
          end
        end
      end
      object pnTitulo: TPanel
        Tag = 99
        Left = 0
        Top = 0
        Width = 1010
        Height = 31
        Align = alTop
        BevelOuter = bvNone
        Color = 12615680
        ParentBackground = False
        TabOrder = 3
        StyleElements = []
        object lbTitulo: TLabel
          Left = 8
          Top = 1
          Width = 392
          Height = 34
          AutoSize = False
          Caption = 'Auditoria de Caixas'
          Color = 12615680
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -19
          Font.Name = 'Calibri'
          Font.Style = [fsBold]
          ParentColor = False
          ParentFont = False
          Layout = tlCenter
          StyleElements = []
        end
        object PngSpeedButton1: TPngSpeedButton
          Left = 1198
          Top = 0
          Width = 25
          Height = 25
          Flat = True
          OnClick = PngSpeedButton1Click
          PngImage.Data = {
            89504E470D0A1A0A0000000D49484452000000190000001D08060000005F78C7
            75000004B369545874584D4C3A636F6D2E61646F62652E786D7000000000003C
            3F787061636B657420626567696E3D22EFBBBF222069643D2257354D304D7043
            656869487A7265537A4E54637A6B633964223F3E0A3C783A786D706D65746120
            786D6C6E733A783D2261646F62653A6E733A6D6574612F2220783A786D70746B
            3D22584D5020436F726520352E352E30223E0A203C7264663A52444620786D6C
            6E733A7264663D22687474703A2F2F7777772E77332E6F72672F313939392F30
            322F32322D7264662D73796E7461782D6E7323223E0A20203C7264663A446573
            6372697074696F6E207264663A61626F75743D22220A20202020786D6C6E733A
            657869663D22687474703A2F2F6E732E61646F62652E636F6D2F657869662F31
            2E302F220A20202020786D6C6E733A746966663D22687474703A2F2F6E732E61
            646F62652E636F6D2F746966662F312E302F220A20202020786D6C6E733A7068
            6F746F73686F703D22687474703A2F2F6E732E61646F62652E636F6D2F70686F
            746F73686F702F312E302F220A20202020786D6C6E733A786D703D2268747470
            3A2F2F6E732E61646F62652E636F6D2F7861702F312E302F220A20202020786D
            6C6E733A786D704D4D3D22687474703A2F2F6E732E61646F62652E636F6D2F78
            61702F312E302F6D6D2F220A20202020786D6C6E733A73744576743D22687474
            703A2F2F6E732E61646F62652E636F6D2F7861702F312E302F73547970652F52
            65736F757263654576656E7423220A202020657869663A506978656C5844696D
            656E73696F6E3D223235220A202020657869663A506978656C5944696D656E73
            696F6E3D223239220A202020657869663A436F6C6F7253706163653D2231220A
            202020746966663A496D61676557696474683D223235220A202020746966663A
            496D6167654C656E6774683D223239220A202020746966663A5265736F6C7574
            696F6E556E69743D2232220A202020746966663A585265736F6C7574696F6E3D
            2237322F31220A202020746966663A595265736F6C7574696F6E3D2237322F31
            220A20202070686F746F73686F703A436F6C6F724D6F64653D2233220A202020
            70686F746F73686F703A49434350726F66696C653D2273524742204945433631
            3936362D322E31220A202020786D703A4D6F64696679446174653D2232303233
            2D30352D31395431333A32323A30372D30333A3030220A202020786D703A4D65
            746164617461446174653D22323032332D30352D31395431333A32323A30372D
            30333A3030223E0A2020203C786D704D4D3A486973746F72793E0A202020203C
            7264663A5365713E0A20202020203C7264663A6C690A20202020202073744576
            743A616374696F6E3D2270726F6475636564220A20202020202073744576743A
            736F6674776172654167656E743D22416666696E6974792044657369676E6572
            20312E31302E34220A20202020202073744576743A7768656E3D22323032332D
            30352D31395431333A32323A30372D30333A3030222F3E0A202020203C2F7264
            663A5365713E0A2020203C2F786D704D4D3A486973746F72793E0A20203C2F72
            64663A4465736372697074696F6E3E0A203C2F7264663A5244463E0A3C2F783A
            786D706D6574613E0A3C3F787061636B657420656E643D2272223F3E1D450399
            0000018269434350735247422049454336313936362D322E31000028917591BB
            4B03411087BF244A44E30363616111245A45890A411B8B048D825A24118CDA24
            671E421EC75D44C456B00D288836BE0AFD0BB415AC05415104B1D55AD146E59C
            33810431B3CCCEB7BFDD197667C11AC92859BDCE0BD95C410B05FDAEB9E8BCCB
            FE4C3D4EDA68A725A6E8EA74783C424DFBB8C362C69B3EB356ED73FF5AD35242
            57C0D2203CAAA85A417842786AB5A09ABC2DDCA1A4634BC2A7C21E4D2E287C6B
            EAF112BF989C2AF197C95A2414006B9BB02B55C5F12A56D25A56585E8E3B9B59
            51CAF7315FE248E466C312BBC5BBD00911C48F8B49C608E0638011997DF43148
            BFACA891EFFDCD9F212FB98ACC2A6B682C93224D018FA82B523D2131297A4246
            8635B3FF7FFBAA2787064BD51D7EA87F328CB71EB06FC177D1303E0F0DE3FB08
            6C8F7091ABE4E70F60F85DF4624573EF43EB069C5D56B4F80E9C6F42E7831AD3
            62BF924DDC9A4CC2EB093447C1790D8D0BA59E95F739BE87C8BA7CD515ECEE41
            AF9C6F5DFC0134DC67CFF8A2DC1B000000097048597300000B1300000B130100
            9A9C18000001674944415478DAE596BF2B456118C7CFEB5706A355194C922C8A
            4131CAC444CA1D2883C16221260B8B425106140B61B1DE41515296BB89FB6718
            94CBF1F9DEF39E3AE9A6E3BEE73D034F7D3AEFE93DF7F9749FF7A70972081337
            C2306CE2D105AD19E47D83B231A65295905CA2455887B60CFFC02BACC1B62405
            1AC71EAB5590A444A3D7A3A42489EAD6E851529124F428A8C6FF925C433B0CD6
            E8BB0DA2A93AEA22B961418DF04903ED3D984FF46DC232FD4A714F7BA05E4919
            BA49F46E4507300B1BB06205DA219EA1C3A55C973095108DC39515B4A80D63AE
            63A23887E9782F52F0B3661E6756FA63FC6676CD20394948526F476925FBB0A0
            122524C93172961CC11C824F3ED5F6330117764CF47E0A932E9227E821E1874D
            78A8B2C1162C5991C646B3ABB35EC91D8986BE09E2D80DA27348F100FD2EE52A
            06D18AEFABD1F718442B7ED8A55C99C4DF92E47232E672C6E7725BF179EF5A85
            1D9F37C817ED147A318EC952C5175AE3CF16E021188B0000000049454E44AE42
            6082}
        end
        object PngSpeedButton3: TPngSpeedButton
          Left = 977
          Top = 2
          Width = 25
          Height = 25
          Flat = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          OnClick = PngSpeedButton3Click
          PngImage.Data = {
            89504E470D0A1A0A0000000D49484452000000190000001D08060000005F78C7
            75000004B369545874584D4C3A636F6D2E61646F62652E786D7000000000003C
            3F787061636B657420626567696E3D22EFBBBF222069643D2257354D304D7043
            656869487A7265537A4E54637A6B633964223F3E0A3C783A786D706D65746120
            786D6C6E733A783D2261646F62653A6E733A6D6574612F2220783A786D70746B
            3D22584D5020436F726520352E352E30223E0A203C7264663A52444620786D6C
            6E733A7264663D22687474703A2F2F7777772E77332E6F72672F313939392F30
            322F32322D7264662D73796E7461782D6E7323223E0A20203C7264663A446573
            6372697074696F6E207264663A61626F75743D22220A20202020786D6C6E733A
            657869663D22687474703A2F2F6E732E61646F62652E636F6D2F657869662F31
            2E302F220A20202020786D6C6E733A746966663D22687474703A2F2F6E732E61
            646F62652E636F6D2F746966662F312E302F220A20202020786D6C6E733A7068
            6F746F73686F703D22687474703A2F2F6E732E61646F62652E636F6D2F70686F
            746F73686F702F312E302F220A20202020786D6C6E733A786D703D2268747470
            3A2F2F6E732E61646F62652E636F6D2F7861702F312E302F220A20202020786D
            6C6E733A786D704D4D3D22687474703A2F2F6E732E61646F62652E636F6D2F78
            61702F312E302F6D6D2F220A20202020786D6C6E733A73744576743D22687474
            703A2F2F6E732E61646F62652E636F6D2F7861702F312E302F73547970652F52
            65736F757263654576656E7423220A202020657869663A506978656C5844696D
            656E73696F6E3D223235220A202020657869663A506978656C5944696D656E73
            696F6E3D223239220A202020657869663A436F6C6F7253706163653D2231220A
            202020746966663A496D61676557696474683D223235220A202020746966663A
            496D6167654C656E6774683D223239220A202020746966663A5265736F6C7574
            696F6E556E69743D2232220A202020746966663A585265736F6C7574696F6E3D
            2237322F31220A202020746966663A595265736F6C7574696F6E3D2237322F31
            220A20202070686F746F73686F703A436F6C6F724D6F64653D2233220A202020
            70686F746F73686F703A49434350726F66696C653D2273524742204945433631
            3936362D322E31220A202020786D703A4D6F64696679446174653D2232303233
            2D30352D31395431333A32323A30372D30333A3030220A202020786D703A4D65
            746164617461446174653D22323032332D30352D31395431333A32323A30372D
            30333A3030223E0A2020203C786D704D4D3A486973746F72793E0A202020203C
            7264663A5365713E0A20202020203C7264663A6C690A20202020202073744576
            743A616374696F6E3D2270726F6475636564220A20202020202073744576743A
            736F6674776172654167656E743D22416666696E6974792044657369676E6572
            20312E31302E34220A20202020202073744576743A7768656E3D22323032332D
            30352D31395431333A32323A30372D30333A3030222F3E0A202020203C2F7264
            663A5365713E0A2020203C2F786D704D4D3A486973746F72793E0A20203C2F72
            64663A4465736372697074696F6E3E0A203C2F7264663A5244463E0A3C2F783A
            786D706D6574613E0A3C3F787061636B657420656E643D2272223F3E1D450399
            0000018269434350735247422049454336313936362D322E31000028917591BB
            4B03411087BF244A44E30363616111245A45890A411B8B048D825A24118CDA24
            671E421EC75D44C456B00D288836BE0AFD0BB415AC05415104B1D55AD146E59C
            33810431B3CCCEB7BFDD197667C11AC92859BDCE0BD95C410B05FDAEB9E8BCCB
            FE4C3D4EDA68A725A6E8EA74783C424DFBB8C362C69B3EB356ED73FF5AD35242
            57C0D2203CAAA85A417842786AB5A09ABC2DDCA1A4634BC2A7C21E4D2E287C6B
            EAF112BF989C2AF197C95A2414006B9BB02B55C5F12A56D25A56585E8E3B9B59
            51CAF7315FE248E466C312BBC5BBD00911C48F8B49C608E0638011997DF43148
            BFACA891EFFDCD9F212FB98ACC2A6B682C93224D018FA82B523D2131297A4246
            8635B3FF7FFBAA2787064BD51D7EA87F328CB71EB06FC177D1303E0F0DE3FB08
            6C8F7091ABE4E70F60F85DF4624573EF43EB069C5D56B4F80E9C6F42E7831AD3
            62BF924DDC9A4CC2EB093447C1790D8D0BA59E95F739BE87C8BA7CD515ECEE41
            AF9C6F5DFC0134DC67CFF8A2DC1B000000097048597300000B1300000B130100
            9A9C18000001674944415478DAE596BF2B456118C7CFEB5706A355194C922C8A
            4131CAC444CA1D2883C16221260B8B425106140B61B1DE41515296BB89FB6718
            94CBF1F9DEF39E3AE9A6E3BEE73D034F7D3AEFE93DF7F9749FF7A70972081337
            C2306CE2D105AD19E47D83B231A65295905CA2455887B60CFFC02BACC1B62405
            1AC71EAB5590A444A3D7A3A42489EAD6E851529124F428A8C6FF925C433B0CD6
            E8BB0DA2A93AEA22B961418DF04903ED3D984FF46DC232FD4A714F7BA05E4919
            BA49F46E4507300B1BB06205DA219EA1C3A55C973095108DC39515B4A80D63AE
            63A23887E9782F52F0B3661E6756FA63FC6676CD20394948526F476925FBB0A0
            122524C93172961CC11C824F3ED5F6330117764CF47E0A932E9227E821E1874D
            78A8B2C1162C5991C646B3ABB35EC91D8986BE09E2D80DA27348F100FD2EE52A
            06D18AEFABD1F718442B7ED8A55C99C4DF92E47232E672C6E7725BF179EF5A85
            1D9F37C817ED147A318EC952C5175AE3CF16E021188B0000000049454E44AE42
            6082}
        end
      end
    end
    object pgAuditoria: TJvStandardPage
      Left = 0
      Top = 0
      Width = 1010
      Height = 653
      StyleElements = []
      Caption = 'pgAuditoria'
      object Panel1: TPanel
        Tag = 99
        Left = 0
        Top = 37
        Width = 1010
        Height = 60
        Align = alTop
        BevelOuter = bvNone
        Color = clWhite
        ParentBackground = False
        TabOrder = 0
        StyleElements = []
        DesignSize = (
          1010
          60)
        object PngSpeedButton4: TPngSpeedButton
          Left = 1198
          Top = 0
          Width = 25
          Height = 25
          Flat = True
          OnClick = PngSpeedButton1Click
          PngImage.Data = {
            89504E470D0A1A0A0000000D49484452000000190000001D08060000005F78C7
            75000004B369545874584D4C3A636F6D2E61646F62652E786D7000000000003C
            3F787061636B657420626567696E3D22EFBBBF222069643D2257354D304D7043
            656869487A7265537A4E54637A6B633964223F3E0A3C783A786D706D65746120
            786D6C6E733A783D2261646F62653A6E733A6D6574612F2220783A786D70746B
            3D22584D5020436F726520352E352E30223E0A203C7264663A52444620786D6C
            6E733A7264663D22687474703A2F2F7777772E77332E6F72672F313939392F30
            322F32322D7264662D73796E7461782D6E7323223E0A20203C7264663A446573
            6372697074696F6E207264663A61626F75743D22220A20202020786D6C6E733A
            657869663D22687474703A2F2F6E732E61646F62652E636F6D2F657869662F31
            2E302F220A20202020786D6C6E733A746966663D22687474703A2F2F6E732E61
            646F62652E636F6D2F746966662F312E302F220A20202020786D6C6E733A7068
            6F746F73686F703D22687474703A2F2F6E732E61646F62652E636F6D2F70686F
            746F73686F702F312E302F220A20202020786D6C6E733A786D703D2268747470
            3A2F2F6E732E61646F62652E636F6D2F7861702F312E302F220A20202020786D
            6C6E733A786D704D4D3D22687474703A2F2F6E732E61646F62652E636F6D2F78
            61702F312E302F6D6D2F220A20202020786D6C6E733A73744576743D22687474
            703A2F2F6E732E61646F62652E636F6D2F7861702F312E302F73547970652F52
            65736F757263654576656E7423220A202020657869663A506978656C5844696D
            656E73696F6E3D223235220A202020657869663A506978656C5944696D656E73
            696F6E3D223239220A202020657869663A436F6C6F7253706163653D2231220A
            202020746966663A496D61676557696474683D223235220A202020746966663A
            496D6167654C656E6774683D223239220A202020746966663A5265736F6C7574
            696F6E556E69743D2232220A202020746966663A585265736F6C7574696F6E3D
            2237322F31220A202020746966663A595265736F6C7574696F6E3D2237322F31
            220A20202070686F746F73686F703A436F6C6F724D6F64653D2233220A202020
            70686F746F73686F703A49434350726F66696C653D2273524742204945433631
            3936362D322E31220A202020786D703A4D6F64696679446174653D2232303233
            2D30352D31395431333A32323A30372D30333A3030220A202020786D703A4D65
            746164617461446174653D22323032332D30352D31395431333A32323A30372D
            30333A3030223E0A2020203C786D704D4D3A486973746F72793E0A202020203C
            7264663A5365713E0A20202020203C7264663A6C690A20202020202073744576
            743A616374696F6E3D2270726F6475636564220A20202020202073744576743A
            736F6674776172654167656E743D22416666696E6974792044657369676E6572
            20312E31302E34220A20202020202073744576743A7768656E3D22323032332D
            30352D31395431333A32323A30372D30333A3030222F3E0A202020203C2F7264
            663A5365713E0A2020203C2F786D704D4D3A486973746F72793E0A20203C2F72
            64663A4465736372697074696F6E3E0A203C2F7264663A5244463E0A3C2F783A
            786D706D6574613E0A3C3F787061636B657420656E643D2272223F3E1D450399
            0000018269434350735247422049454336313936362D322E31000028917591BB
            4B03411087BF244A44E30363616111245A45890A411B8B048D825A24118CDA24
            671E421EC75D44C456B00D288836BE0AFD0BB415AC05415104B1D55AD146E59C
            33810431B3CCCEB7BFDD197667C11AC92859BDCE0BD95C410B05FDAEB9E8BCCB
            FE4C3D4EDA68A725A6E8EA74783C424DFBB8C362C69B3EB356ED73FF5AD35242
            57C0D2203CAAA85A417842786AB5A09ABC2DDCA1A4634BC2A7C21E4D2E287C6B
            EAF112BF989C2AF197C95A2414006B9BB02B55C5F12A56D25A56585E8E3B9B59
            51CAF7315FE248E466C312BBC5BBD00911C48F8B49C608E0638011997DF43148
            BFACA891EFFDCD9F212FB98ACC2A6B682C93224D018FA82B523D2131297A4246
            8635B3FF7FFBAA2787064BD51D7EA87F328CB71EB06FC177D1303E0F0DE3FB08
            6C8F7091ABE4E70F60F85DF4624573EF43EB069C5D56B4F80E9C6F42E7831AD3
            62BF924DDC9A4CC2EB093447C1790D8D0BA59E95F739BE87C8BA7CD515ECEE41
            AF9C6F5DFC0134DC67CFF8A2DC1B000000097048597300000B1300000B130100
            9A9C18000001674944415478DAE596BF2B456118C7CFEB5706A355194C922C8A
            4131CAC444CA1D2883C16221260B8B425106140B61B1DE41515296BB89FB6718
            94CBF1F9DEF39E3AE9A6E3BEE73D034F7D3AEFE93DF7F9749FF7A70972081337
            C2306CE2D105AD19E47D83B231A65295905CA2455887B60CFFC02BACC1B62405
            1AC71EAB5590A444A3D7A3A42489EAD6E851529124F428A8C6FF925C433B0CD6
            E8BB0DA2A93AEA22B961418DF04903ED3D984FF46DC232FD4A714F7BA05E4919
            BA49F46E4507300B1BB06205DA219EA1C3A55C973095108DC39515B4A80D63AE
            63A23887E9782F52F0B3661E6756FA63FC6676CD20394948526F476925FBB0A0
            122524C93172961CC11C824F3ED5F6330117764CF47E0A932E9227E821E1874D
            78A8B2C1162C5991C646B3ABB35EC91D8986BE09E2D80DA27348F100FD2EE52A
            06D18AEFABD1F718442B7ED8A55C99C4DF92E47232E672C6E7725BF179EF5A85
            1D9F37C817ED147A318EC952C5175AE3CF16E021188B0000000049454E44AE42
            6082}
        end
        object Label5: TLabel
          Left = 287
          Top = 6
          Width = 154
          Height = 24
          Anchors = [akLeft, akTop, akRight]
          AutoSize = False
          Caption = 'Movimento do dia:'
          Color = clWhite
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Calibri'
          Font.Style = []
          ParentColor = False
          ParentFont = False
          Layout = tlCenter
          StyleElements = []
        end
        object lbNumeroCaixa: TLabel
          Left = 92
          Top = 6
          Width = 77
          Height = 24
          Anchors = [akLeft, akTop, akRight]
          AutoSize = False
          Caption = '03234'
          Color = clWhite
          Font.Charset = ANSI_CHARSET
          Font.Color = 9408399
          Font.Height = -19
          Font.Name = 'Calibri'
          Font.Style = [fsBold]
          ParentColor = False
          ParentFont = False
          Layout = tlCenter
          StyleElements = []
        end
        object Label2: TLabel
          Left = 4
          Top = 6
          Width = 77
          Height = 24
          Anchors = [akLeft, akTop, akRight]
          AutoSize = False
          Caption = 'Caixa N'#186':'
          Color = clWhite
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Calibri'
          Font.Style = []
          ParentColor = False
          ParentFont = False
          Layout = tlCenter
          StyleElements = []
        end
        object Label6: TLabel
          Left = 627
          Top = 6
          Width = 86
          Height = 24
          Anchors = [akLeft, akTop, akRight]
          AutoSize = False
          Caption = 'Operador:'
          Color = clWhite
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Calibri'
          Font.Style = []
          ParentColor = False
          ParentFont = False
          Layout = tlCenter
          StyleElements = []
        end
        object lbNomeOperadorCaixa: TLabel
          Left = 715
          Top = 6
          Width = 249
          Height = 24
          Anchors = [akLeft, akTop, akRight]
          AutoSize = False
          Caption = 'Jo'#227'o Marcos'
          Color = clWhite
          Font.Charset = ANSI_CHARSET
          Font.Color = 9408399
          Font.Height = -19
          Font.Name = 'Calibri'
          Font.Style = [fsBold]
          ParentColor = False
          ParentFont = False
          Layout = tlCenter
          StyleElements = []
        end
        object lbDataMovimentoCaixa: TLabel
          Left = 444
          Top = 6
          Width = 113
          Height = 24
          Anchors = [akLeft, akTop, akRight]
          AutoSize = False
          Caption = '15/10/1984'
          Color = clWhite
          Font.Charset = ANSI_CHARSET
          Font.Color = 9408399
          Font.Height = -19
          Font.Name = 'Calibri'
          Font.Style = [fsBold]
          ParentColor = False
          ParentFont = False
          Layout = tlCenter
          StyleElements = []
        end
        object Label7: TLabel
          Left = 6
          Top = 40
          Width = 83
          Height = 24
          Anchors = [akLeft, akTop, akRight]
          AutoSize = False
          Caption = 'Abertura:'
          Color = clWhite
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Calibri'
          Font.Style = []
          ParentColor = False
          ParentFont = False
          Layout = tlCenter
          StyleElements = []
        end
        object lbHoraAberturaCaixa: TLabel
          Left = 86
          Top = 40
          Width = 177
          Height = 24
          Anchors = [akLeft, akTop, akRight]
          AutoSize = False
          Caption = '15/10/1984 16:22:35'
          Color = clWhite
          Font.Charset = ANSI_CHARSET
          Font.Color = 9408399
          Font.Height = -19
          Font.Name = 'Calibri'
          Font.Style = [fsBold]
          ParentColor = False
          ParentFont = False
          Layout = tlCenter
          StyleElements = []
        end
        object Label9: TLabel
          Left = 288
          Top = 40
          Width = 105
          Height = 24
          Anchors = [akLeft, akTop, akRight]
          AutoSize = False
          Caption = 'Fechamento:'
          Color = clWhite
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Calibri'
          Font.Style = []
          ParentColor = False
          ParentFont = False
          Layout = tlCenter
          StyleElements = []
        end
        object lbHoraFechamentoCaixa: TLabel
          Left = 399
          Top = 40
          Width = 177
          Height = 24
          Anchors = [akLeft, akTop, akRight]
          AutoSize = False
          Caption = '15/10/1984 16:22:35'
          Color = clWhite
          Font.Charset = ANSI_CHARSET
          Font.Color = 9408399
          Font.Height = -19
          Font.Name = 'Calibri'
          Font.Style = [fsBold]
          ParentColor = False
          ParentFont = False
          Layout = tlCenter
          StyleElements = []
        end
        object Label11: TLabel
          Left = 631
          Top = 40
          Width = 105
          Height = 24
          Anchors = [akLeft, akTop, akRight]
          AutoSize = False
          Caption = 'Auditado por:'
          Color = clWhite
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Calibri'
          Font.Style = []
          ParentColor = False
          ParentFont = False
          Layout = tlCenter
          StyleElements = []
        end
        object lbUsuarioAuditoria: TLabel
          Left = 742
          Top = 40
          Width = 177
          Height = 24
          Anchors = [akLeft, akTop, akRight]
          AutoSize = False
          Caption = 'Ana Lu'#237'sa'
          Color = clWhite
          Font.Charset = ANSI_CHARSET
          Font.Color = 9408399
          Font.Height = -19
          Font.Name = 'Calibri'
          Font.Style = [fsBold]
          ParentColor = False
          ParentFont = False
          Layout = tlCenter
          StyleElements = []
        end
      end
      object cxPageControl1: TcxPageControl
        Left = 0
        Top = 107
        Width = 1010
        Height = 379
        Align = alClient
        TabOrder = 1
        Properties.ActivePage = cxTabSheet1
        Properties.CustomButtons.Buttons = <>
        ClientRectBottom = 375
        ClientRectLeft = 4
        ClientRectRight = 1006
        ClientRectTop = 24
        object cxTabSheet1: TcxTabSheet
          Caption = 'Auditoria por forma de recebimento'
          ImageIndex = 0
          ExplicitLeft = 0
          ExplicitTop = 0
          ExplicitWidth = 0
          ExplicitHeight = 0
          object cxGrid2: TcxGrid
            Left = 0
            Top = 0
            Width = 1002
            Height = 351
            Align = alClient
            TabOrder = 0
            object gridAuditoria: TcxGridDBBandedTableView
              Navigator.Buttons.CustomButtons = <>
              FilterBox.CustomizeDialog = False
              FilterBox.Visible = fvNever
              ScrollbarAnnotations.CustomAnnotations = <>
              DataController.DataSource = dmAuditoriaCaixas.dsAuditoriaCaixa
              DataController.Options = [dcoAssignGroupingValues, dcoAssignMasterDetailKeys, dcoSaveExpanding, dcoImmediatePost]
              DataController.Summary.DefaultGroupSummaryItems = <>
              DataController.Summary.FooterSummaryItems = <
                item
                  Format = 'R$ #,##0.00'
                  Kind = skSum
                  Column = gridAuditoriaTOTAL_SUPRIMENTOS
                end
                item
                  Format = 'R$ #,##0.00'
                  Kind = skSum
                  Column = gridAuditoriaTOTAL_SANGRIAS
                end
                item
                  Format = 'R$ #,##0.00'
                  Kind = skSum
                  Column = gridAuditoriaTOTAL_RECEBIMENTOS_VENDAS
                end
                item
                  Format = 'R$ #,##0.00'
                  Kind = skSum
                  Column = gridAuditoriaTOTAL_RECEBIMENTOS_PENDURAS
                end
                item
                  Format = 'R$ #,##0.00'
                  Kind = skSum
                  Column = gridAuditoriaSALDO_SISTEMA
                end
                item
                  Format = 'R$ #,##0.00'
                  Kind = skSum
                  Column = gridAuditoriaTOTAL_OPERADOR
                end
                item
                  Format = 'R$ #,##0.00'
                  Kind = skSum
                  Column = gridAuditoriaDIFERENCA_OPERADOR
                end
                item
                  Format = 'R$ #,##0.00'
                  Kind = skSum
                  Column = gridAuditoriaTOTAL_AUDITORIA
                end
                item
                  Format = 'R$ #,##0.00'
                  Kind = skSum
                  Column = gridAuditoriaDIFERENCA_AUDITORIA
                end>
              DataController.Summary.SummaryGroups = <>
              Filtering.ColumnAddValueItems = False
              Filtering.ColumnMRUItemsList = False
              OptionsData.CancelOnExit = False
              OptionsData.Deleting = False
              OptionsData.DeletingConfirmation = False
              OptionsData.Editing = False
              OptionsData.Inserting = False
              OptionsView.Footer = True
              OptionsView.GroupByBox = False
              OptionsView.Indicator = True
              Styles.Content = cxStyle2
              Styles.ContentOdd = stlRegistro
              Bands = <
                item
                  Caption = 'Sistema'
                  Styles.Header = cxstyl1
                  Width = 521
                end
                item
                  Caption = 'Informado pelo operador no fechamento'
                  Options.Moving = False
                  Width = 215
                end
                item
                  Caption = 'Auditoria'
                  Width = 373
                end>
              object gridAuditoriaDESCRICAO: TcxGridDBBandedColumn
                Caption = 'Descri'#231#227'o'
                DataBinding.FieldName = 'DESCRICAO'
                Options.Editing = False
                Options.Filtering = False
                Options.FilteringAddValueItems = False
                Options.Grouping = False
                Options.Sorting = False
                Options.VertSizing = False
                Width = 139
                Position.BandIndex = 0
                Position.ColIndex = 0
                Position.RowIndex = 0
              end
              object gridAuditoriaTOTAL_SUPRIMENTOS: TcxGridDBBandedColumn
                Caption = 'Suprimentos'
                DataBinding.FieldName = 'TOTAL_SUPRIMENTOS'
                PropertiesClassName = 'TcxCurrencyEditProperties'
                Options.Editing = False
                Options.Filtering = False
                Options.FilteringAddValueItems = False
                Options.Grouping = False
                Options.Sorting = False
                Options.VertSizing = False
                Width = 74
                Position.BandIndex = 0
                Position.ColIndex = 1
                Position.RowIndex = 0
              end
              object gridAuditoriaTOTAL_SANGRIAS: TcxGridDBBandedColumn
                Caption = 'Sangrias'
                DataBinding.FieldName = 'TOTAL_SANGRIAS'
                PropertiesClassName = 'TcxCurrencyEditProperties'
                Options.Editing = False
                Options.Filtering = False
                Options.FilteringAddValueItems = False
                Options.Grouping = False
                Options.Sorting = False
                Options.VertSizing = False
                Width = 74
                Position.BandIndex = 0
                Position.ColIndex = 2
                Position.RowIndex = 0
              end
              object gridAuditoriaTOTAL_RECEBIMENTOS_VENDAS: TcxGridDBBandedColumn
                Caption = 'Recebimentos'
                DataBinding.FieldName = 'TOTAL_RECEBIMENTOS_VENDAS'
                PropertiesClassName = 'TcxCurrencyEditProperties'
                Options.Editing = False
                Options.Filtering = False
                Options.FilteringAddValueItems = False
                Options.Grouping = False
                Options.Sorting = False
                Options.VertSizing = False
                Width = 80
                Position.BandIndex = 0
                Position.ColIndex = 3
                Position.RowIndex = 0
              end
              object gridAuditoriaTOTAL_RECEBIMENTOS_PENDURAS: TcxGridDBBandedColumn
                Caption = 'Penduras rec.'
                DataBinding.FieldName = 'TOTAL_RECEBIMENTOS_PENDURAS'
                PropertiesClassName = 'TcxCurrencyEditProperties'
                Options.Editing = False
                Options.Filtering = False
                Options.FilteringAddValueItems = False
                Options.Grouping = False
                Options.Sorting = False
                Options.VertSizing = False
                Width = 75
                Position.BandIndex = 0
                Position.ColIndex = 4
                Position.RowIndex = 0
              end
              object gridAuditoriaSALDO_SISTEMA: TcxGridDBBandedColumn
                Caption = 'Saldo'
                DataBinding.FieldName = 'SALDO_SISTEMA'
                PropertiesClassName = 'TcxCurrencyEditProperties'
                Options.Editing = False
                Options.Filtering = False
                Options.FilteringAddValueItems = False
                Options.Grouping = False
                Options.Sorting = False
                Options.VertSizing = False
                Width = 79
                Position.BandIndex = 0
                Position.ColIndex = 5
                Position.RowIndex = 0
              end
              object gridAuditoriaTOTAL_OPERADOR: TcxGridDBBandedColumn
                Caption = 'Valor informado'
                DataBinding.FieldName = 'TOTAL_OPERADOR'
                PropertiesClassName = 'TcxCurrencyEditProperties'
                Options.Editing = False
                Options.Filtering = False
                Options.FilteringAddValueItems = False
                Options.Grouping = False
                Options.Sorting = False
                Options.VertSizing = False
                Width = 90
                Position.BandIndex = 1
                Position.ColIndex = 0
                Position.RowIndex = 0
              end
              object gridAuditoriaDIFERENCA_OPERADOR: TcxGridDBBandedColumn
                Caption = 'Diferen'#231'a Op. X Sistema'
                DataBinding.FieldName = 'DIFERENCA_OPERADOR'
                PropertiesClassName = 'TcxCurrencyEditProperties'
                Options.Editing = False
                Options.Filtering = False
                Options.FilteringAddValueItems = False
                Options.Grouping = False
                Options.Sorting = False
                Options.VertSizing = False
                Width = 125
                Position.BandIndex = 1
                Position.ColIndex = 1
                Position.RowIndex = 0
              end
              object gridAuditoriaTOTAL_AUDITORIA: TcxGridDBBandedColumn
                Caption = 'Valor auditado'
                DataBinding.FieldName = 'TOTAL_AUDITORIA'
                PropertiesClassName = 'TcxCurrencyEditProperties'
                Options.Filtering = False
                Options.FilteringAddValueItems = False
                Options.Grouping = False
                Options.Sorting = False
                Options.VertSizing = False
                Width = 92
                Position.BandIndex = 2
                Position.ColIndex = 0
                Position.RowIndex = 0
              end
              object gridAuditoriaDIFERENCA_AUDITORIA: TcxGridDBBandedColumn
                Caption = 'Diferen'#231'a'
                DataBinding.FieldName = 'DIFERENCA_AUDITORIA'
                PropertiesClassName = 'TcxCurrencyEditProperties'
                Options.Editing = False
                Options.Filtering = False
                Options.FilteringAddValueItems = False
                Options.Grouping = False
                Options.Sorting = False
                Options.VertSizing = False
                Width = 98
                Position.BandIndex = 2
                Position.ColIndex = 1
                Position.RowIndex = 0
              end
              object gridAuditoriaOBS: TcxGridDBBandedColumn
                Caption = 'Observa'#231#245'es'
                DataBinding.FieldName = 'OBS'
                Options.Filtering = False
                Options.FilteringAddValueItems = False
                Options.Grouping = False
                Options.Sorting = False
                Options.VertSizing = False
                Width = 183
                Position.BandIndex = 2
                Position.ColIndex = 2
                Position.RowIndex = 0
              end
            end
            object cxgrdlvlGrid2Level1: TcxGridLevel
              GridView = gridAuditoria
            end
          end
        end
        object cxTabSheet2: TcxTabSheet
          Caption = 'Detalhamento por forma de recebimento - vendas'
          ImageIndex = 1
          ExplicitLeft = 0
          ExplicitTop = 0
          ExplicitWidth = 0
          ExplicitHeight = 0
          object pnMotivoAlteracaoForma: TPanel
            Left = 711
            Top = 0
            Width = 291
            Height = 351
            Align = alRight
            TabOrder = 0
            Visible = False
            DesignSize = (
              291
              351)
            object Label13: TLabel
              Left = 0
              Top = 2
              Width = 291
              Height = 24
              Anchors = [akLeft, akTop, akRight]
              AutoSize = False
              Caption = 'Hist'#243'rico da auditoria'
              Color = clWhite
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Height = -19
              Font.Name = 'Calibri'
              Font.Style = []
              ParentColor = False
              ParentFont = False
              Layout = tlCenter
              StyleElements = []
            end
            object Label14: TLabel
              Left = 6
              Top = 75
              Width = 291
              Height = 24
              Anchors = [akLeft, akTop, akRight]
              AutoSize = False
              Caption = 'Forma de pagamento da altera'#231#227'o'
              Color = clWhite
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Height = -19
              Font.Name = 'Calibri'
              Font.Style = []
              ParentColor = False
              ParentFont = False
              Layout = tlCenter
              StyleElements = []
            end
            object Label15: TLabel
              Left = 10
              Top = 147
              Width = 291
              Height = 24
              Anchors = [akLeft, akTop, akRight]
              AutoSize = False
              Caption = 'Qual o motivo da altera'#231#227'o?'
              Color = clWhite
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Height = -19
              Font.Name = 'Calibri'
              Font.Style = []
              ParentColor = False
              ParentFont = False
              Layout = tlCenter
              StyleElements = []
            end
            object Panel9: TPanel
              Tag = 99
              Left = 1
              Top = 1
              Width = 289
              Height = 47
              Align = alTop
              BevelOuter = bvNone
              Color = 12615680
              ParentBackground = False
              TabOrder = 0
              StyleElements = []
              object Label12: TLabel
                Left = 0
                Top = 0
                Width = 289
                Height = 47
                Align = alClient
                Alignment = taCenter
                AutoSize = False
                Caption = 'Informe a nova forma e o motivo da altera'#231#227'o'
                Color = 12615680
                Font.Charset = ANSI_CHARSET
                Font.Color = clWhite
                Font.Height = -16
                Font.Name = 'Calibri'
                Font.Style = [fsBold]
                ParentColor = False
                ParentFont = False
                Layout = tlCenter
                WordWrap = True
                StyleElements = []
                ExplicitLeft = 26
                ExplicitTop = 5
                ExplicitWidth = 929
                ExplicitHeight = 34
              end
              object PngSpeedButton5: TPngSpeedButton
                Left = 1198
                Top = 0
                Width = 25
                Height = 25
                Flat = True
                OnClick = PngSpeedButton1Click
                PngImage.Data = {
                  89504E470D0A1A0A0000000D49484452000000190000001D08060000005F78C7
                  75000004B369545874584D4C3A636F6D2E61646F62652E786D7000000000003C
                  3F787061636B657420626567696E3D22EFBBBF222069643D2257354D304D7043
                  656869487A7265537A4E54637A6B633964223F3E0A3C783A786D706D65746120
                  786D6C6E733A783D2261646F62653A6E733A6D6574612F2220783A786D70746B
                  3D22584D5020436F726520352E352E30223E0A203C7264663A52444620786D6C
                  6E733A7264663D22687474703A2F2F7777772E77332E6F72672F313939392F30
                  322F32322D7264662D73796E7461782D6E7323223E0A20203C7264663A446573
                  6372697074696F6E207264663A61626F75743D22220A20202020786D6C6E733A
                  657869663D22687474703A2F2F6E732E61646F62652E636F6D2F657869662F31
                  2E302F220A20202020786D6C6E733A746966663D22687474703A2F2F6E732E61
                  646F62652E636F6D2F746966662F312E302F220A20202020786D6C6E733A7068
                  6F746F73686F703D22687474703A2F2F6E732E61646F62652E636F6D2F70686F
                  746F73686F702F312E302F220A20202020786D6C6E733A786D703D2268747470
                  3A2F2F6E732E61646F62652E636F6D2F7861702F312E302F220A20202020786D
                  6C6E733A786D704D4D3D22687474703A2F2F6E732E61646F62652E636F6D2F78
                  61702F312E302F6D6D2F220A20202020786D6C6E733A73744576743D22687474
                  703A2F2F6E732E61646F62652E636F6D2F7861702F312E302F73547970652F52
                  65736F757263654576656E7423220A202020657869663A506978656C5844696D
                  656E73696F6E3D223235220A202020657869663A506978656C5944696D656E73
                  696F6E3D223239220A202020657869663A436F6C6F7253706163653D2231220A
                  202020746966663A496D61676557696474683D223235220A202020746966663A
                  496D6167654C656E6774683D223239220A202020746966663A5265736F6C7574
                  696F6E556E69743D2232220A202020746966663A585265736F6C7574696F6E3D
                  2237322F31220A202020746966663A595265736F6C7574696F6E3D2237322F31
                  220A20202070686F746F73686F703A436F6C6F724D6F64653D2233220A202020
                  70686F746F73686F703A49434350726F66696C653D2273524742204945433631
                  3936362D322E31220A202020786D703A4D6F64696679446174653D2232303233
                  2D30352D31395431333A32323A30372D30333A3030220A202020786D703A4D65
                  746164617461446174653D22323032332D30352D31395431333A32323A30372D
                  30333A3030223E0A2020203C786D704D4D3A486973746F72793E0A202020203C
                  7264663A5365713E0A20202020203C7264663A6C690A20202020202073744576
                  743A616374696F6E3D2270726F6475636564220A20202020202073744576743A
                  736F6674776172654167656E743D22416666696E6974792044657369676E6572
                  20312E31302E34220A20202020202073744576743A7768656E3D22323032332D
                  30352D31395431333A32323A30372D30333A3030222F3E0A202020203C2F7264
                  663A5365713E0A2020203C2F786D704D4D3A486973746F72793E0A20203C2F72
                  64663A4465736372697074696F6E3E0A203C2F7264663A5244463E0A3C2F783A
                  786D706D6574613E0A3C3F787061636B657420656E643D2272223F3E1D450399
                  0000018269434350735247422049454336313936362D322E31000028917591BB
                  4B03411087BF244A44E30363616111245A45890A411B8B048D825A24118CDA24
                  671E421EC75D44C456B00D288836BE0AFD0BB415AC05415104B1D55AD146E59C
                  33810431B3CCCEB7BFDD197667C11AC92859BDCE0BD95C410B05FDAEB9E8BCCB
                  FE4C3D4EDA68A725A6E8EA74783C424DFBB8C362C69B3EB356ED73FF5AD35242
                  57C0D2203CAAA85A417842786AB5A09ABC2DDCA1A4634BC2A7C21E4D2E287C6B
                  EAF112BF989C2AF197C95A2414006B9BB02B55C5F12A56D25A56585E8E3B9B59
                  51CAF7315FE248E466C312BBC5BBD00911C48F8B49C608E0638011997DF43148
                  BFACA891EFFDCD9F212FB98ACC2A6B682C93224D018FA82B523D2131297A4246
                  8635B3FF7FFBAA2787064BD51D7EA87F328CB71EB06FC177D1303E0F0DE3FB08
                  6C8F7091ABE4E70F60F85DF4624573EF43EB069C5D56B4F80E9C6F42E7831AD3
                  62BF924DDC9A4CC2EB093447C1790D8D0BA59E95F739BE87C8BA7CD515ECEE41
                  AF9C6F5DFC0134DC67CFF8A2DC1B000000097048597300000B1300000B130100
                  9A9C18000001674944415478DAE596BF2B456118C7CFEB5706A355194C922C8A
                  4131CAC444CA1D2883C16221260B8B425106140B61B1DE41515296BB89FB6718
                  94CBF1F9DEF39E3AE9A6E3BEE73D034F7D3AEFE93DF7F9749FF7A70972081337
                  C2306CE2D105AD19E47D83B231A65295905CA2455887B60CFFC02BACC1B62405
                  1AC71EAB5590A444A3D7A3A42489EAD6E851529124F428A8C6FF925C433B0CD6
                  E8BB0DA2A93AEA22B961418DF04903ED3D984FF46DC232FD4A714F7BA05E4919
                  BA49F46E4507300B1BB06205DA219EA1C3A55C973095108DC39515B4A80D63AE
                  63A23887E9782F52F0B3661E6756FA63FC6676CD20394948526F476925FBB0A0
                  122524C93172961CC11C824F3ED5F6330117764CF47E0A932E9227E821E1874D
                  78A8B2C1162C5991C646B3ABB35EC91D8986BE09E2D80DA27348F100FD2EE52A
                  06D18AEFABD1F718442B7ED8A55C99C4DF92E47232E672C6E7725BF179EF5A85
                  1D9F37C817ED147A318EC952C5175AE3CF16E021188B0000000049454E44AE42
                  6082}
              end
            end
            object cxLookupComboBox1: TcxLookupComboBox
              Left = 10
              Top = 105
              ParentFont = False
              Properties.DropDownAutoSize = True
              Properties.DropDownRows = 30
              Properties.IncrementalFilteringOptions = [ifoHighlightSearchText, ifoUseContainsOperator]
              Properties.KeyFieldNames = 'ID'
              Properties.ListColumns = <
                item
                  Caption = 'ID'
                  FieldName = 'ID'
                end
                item
                  Caption = 'Descri'#231#227'o'
                  FieldName = 'DESCRICAO'
                end>
              Properties.ListFieldIndex = 1
              Properties.ListOptions.CaseInsensitive = True
              Properties.ListOptions.ColumnSorting = False
              Properties.ListSource = dmAuditoriaCaixas.dsqryFormasPagamentoAuditoria
              Properties.MaxLength = 50
              Properties.ReadOnly = False
              EditValue = '0'
              Style.Font.Charset = ANSI_CHARSET
              Style.Font.Color = clWindowText
              Style.Font.Height = -15
              Style.Font.Name = 'Roboto'
              Style.Font.Style = []
              Style.IsFontAssigned = True
              TabOrder = 1
              OnEnter = Edit1Enter
              OnExit = Edit1Exit
              Width = 269
            end
            object Panel10: TPanel
              Tag = 99
              Left = 1
              Top = 282
              Width = 289
              Height = 68
              Align = alBottom
              BevelOuter = bvNone
              Color = clWhite
              ParentBackground = False
              TabOrder = 2
              StyleElements = []
              DesignSize = (
                289
                68)
              object PngSpeedButton6: TPngSpeedButton
                Left = 1198
                Top = 0
                Width = 25
                Height = 25
                Flat = True
                OnClick = PngSpeedButton1Click
                PngImage.Data = {
                  89504E470D0A1A0A0000000D49484452000000190000001D08060000005F78C7
                  75000004B369545874584D4C3A636F6D2E61646F62652E786D7000000000003C
                  3F787061636B657420626567696E3D22EFBBBF222069643D2257354D304D7043
                  656869487A7265537A4E54637A6B633964223F3E0A3C783A786D706D65746120
                  786D6C6E733A783D2261646F62653A6E733A6D6574612F2220783A786D70746B
                  3D22584D5020436F726520352E352E30223E0A203C7264663A52444620786D6C
                  6E733A7264663D22687474703A2F2F7777772E77332E6F72672F313939392F30
                  322F32322D7264662D73796E7461782D6E7323223E0A20203C7264663A446573
                  6372697074696F6E207264663A61626F75743D22220A20202020786D6C6E733A
                  657869663D22687474703A2F2F6E732E61646F62652E636F6D2F657869662F31
                  2E302F220A20202020786D6C6E733A746966663D22687474703A2F2F6E732E61
                  646F62652E636F6D2F746966662F312E302F220A20202020786D6C6E733A7068
                  6F746F73686F703D22687474703A2F2F6E732E61646F62652E636F6D2F70686F
                  746F73686F702F312E302F220A20202020786D6C6E733A786D703D2268747470
                  3A2F2F6E732E61646F62652E636F6D2F7861702F312E302F220A20202020786D
                  6C6E733A786D704D4D3D22687474703A2F2F6E732E61646F62652E636F6D2F78
                  61702F312E302F6D6D2F220A20202020786D6C6E733A73744576743D22687474
                  703A2F2F6E732E61646F62652E636F6D2F7861702F312E302F73547970652F52
                  65736F757263654576656E7423220A202020657869663A506978656C5844696D
                  656E73696F6E3D223235220A202020657869663A506978656C5944696D656E73
                  696F6E3D223239220A202020657869663A436F6C6F7253706163653D2231220A
                  202020746966663A496D61676557696474683D223235220A202020746966663A
                  496D6167654C656E6774683D223239220A202020746966663A5265736F6C7574
                  696F6E556E69743D2232220A202020746966663A585265736F6C7574696F6E3D
                  2237322F31220A202020746966663A595265736F6C7574696F6E3D2237322F31
                  220A20202070686F746F73686F703A436F6C6F724D6F64653D2233220A202020
                  70686F746F73686F703A49434350726F66696C653D2273524742204945433631
                  3936362D322E31220A202020786D703A4D6F64696679446174653D2232303233
                  2D30352D31395431333A32323A30372D30333A3030220A202020786D703A4D65
                  746164617461446174653D22323032332D30352D31395431333A32323A30372D
                  30333A3030223E0A2020203C786D704D4D3A486973746F72793E0A202020203C
                  7264663A5365713E0A20202020203C7264663A6C690A20202020202073744576
                  743A616374696F6E3D2270726F6475636564220A20202020202073744576743A
                  736F6674776172654167656E743D22416666696E6974792044657369676E6572
                  20312E31302E34220A20202020202073744576743A7768656E3D22323032332D
                  30352D31395431333A32323A30372D30333A3030222F3E0A202020203C2F7264
                  663A5365713E0A2020203C2F786D704D4D3A486973746F72793E0A20203C2F72
                  64663A4465736372697074696F6E3E0A203C2F7264663A5244463E0A3C2F783A
                  786D706D6574613E0A3C3F787061636B657420656E643D2272223F3E1D450399
                  0000018269434350735247422049454336313936362D322E31000028917591BB
                  4B03411087BF244A44E30363616111245A45890A411B8B048D825A24118CDA24
                  671E421EC75D44C456B00D288836BE0AFD0BB415AC05415104B1D55AD146E59C
                  33810431B3CCCEB7BFDD197667C11AC92859BDCE0BD95C410B05FDAEB9E8BCCB
                  FE4C3D4EDA68A725A6E8EA74783C424DFBB8C362C69B3EB356ED73FF5AD35242
                  57C0D2203CAAA85A417842786AB5A09ABC2DDCA1A4634BC2A7C21E4D2E287C6B
                  EAF112BF989C2AF197C95A2414006B9BB02B55C5F12A56D25A56585E8E3B9B59
                  51CAF7315FE248E466C312BBC5BBD00911C48F8B49C608E0638011997DF43148
                  BFACA891EFFDCD9F212FB98ACC2A6B682C93224D018FA82B523D2131297A4246
                  8635B3FF7FFBAA2787064BD51D7EA87F328CB71EB06FC177D1303E0F0DE3FB08
                  6C8F7091ABE4E70F60F85DF4624573EF43EB069C5D56B4F80E9C6F42E7831AD3
                  62BF924DDC9A4CC2EB093447C1790D8D0BA59E95F739BE87C8BA7CD515ECEE41
                  AF9C6F5DFC0134DC67CFF8A2DC1B000000097048597300000B1300000B130100
                  9A9C18000001674944415478DAE596BF2B456118C7CFEB5706A355194C922C8A
                  4131CAC444CA1D2883C16221260B8B425106140B61B1DE41515296BB89FB6718
                  94CBF1F9DEF39E3AE9A6E3BEE73D034F7D3AEFE93DF7F9749FF7A70972081337
                  C2306CE2D105AD19E47D83B231A65295905CA2455887B60CFFC02BACC1B62405
                  1AC71EAB5590A444A3D7A3A42489EAD6E851529124F428A8C6FF925C433B0CD6
                  E8BB0DA2A93AEA22B961418DF04903ED3D984FF46DC232FD4A714F7BA05E4919
                  BA49F46E4507300B1BB06205DA219EA1C3A55C973095108DC39515B4A80D63AE
                  63A23887E9782F52F0B3661E6756FA63FC6676CD20394948526F476925FBB0A0
                  122524C93172961CC11C824F3ED5F6330117764CF47E0A932E9227E821E1874D
                  78A8B2C1162C5991C646B3ABB35EC91D8986BE09E2D80DA27348F100FD2EE52A
                  06D18AEFABD1F718442B7ED8A55C99C4DF92E47232E672C6E7725BF179EF5A85
                  1D9F37C817ED147A318EC952C5175AE3CF16E021188B0000000049454E44AE42
                  6082}
              end
              object AdvGlassButton1: TAdvGlassButton
                Left = 10
                Top = 21
                Width = 129
                Height = 40
                Anchors = [akTop, akRight, akBottom]
                BackColor = 12615680
                ButtonDirection = bdLeft
                Caption = 'Salvar'
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
                  89504E470D0A1A0A0000000D4948445200000020000000200806000000737A7A
                  F4000004B269545874584D4C3A636F6D2E61646F62652E786D7000000000003C
                  3F787061636B657420626567696E3D22EFBBBF222069643D2257354D304D7043
                  656869487A7265537A4E54637A6B633964223F3E0A3C783A786D706D65746120
                  786D6C6E733A783D2261646F62653A6E733A6D6574612F2220783A786D70746B
                  3D22584D5020436F726520352E352E30223E0A203C7264663A52444620786D6C
                  6E733A7264663D22687474703A2F2F7777772E77332E6F72672F313939392F30
                  322F32322D7264662D73796E7461782D6E7323223E0A20203C7264663A446573
                  6372697074696F6E207264663A61626F75743D22220A20202020786D6C6E733A
                  657869663D22687474703A2F2F6E732E61646F62652E636F6D2F657869662F31
                  2E302F220A20202020786D6C6E733A746966663D22687474703A2F2F6E732E61
                  646F62652E636F6D2F746966662F312E302F220A20202020786D6C6E733A7068
                  6F746F73686F703D22687474703A2F2F6E732E61646F62652E636F6D2F70686F
                  746F73686F702F312E302F220A20202020786D6C6E733A786D703D2268747470
                  3A2F2F6E732E61646F62652E636F6D2F7861702F312E302F220A20202020786D
                  6C6E733A786D704D4D3D22687474703A2F2F6E732E61646F62652E636F6D2F78
                  61702F312E302F6D6D2F220A20202020786D6C6E733A73744576743D22687474
                  703A2F2F6E732E61646F62652E636F6D2F7861702F312E302F73547970652F52
                  65736F757263654576656E7423220A202020657869663A506978656C5844696D
                  656E73696F6E3D223332220A202020657869663A506978656C5944696D656E73
                  696F6E3D223332220A202020657869663A436F6C6F7253706163653D2231220A
                  202020746966663A496D61676557696474683D223332220A202020746966663A
                  496D6167654C656E6774683D223332220A202020746966663A5265736F6C7574
                  696F6E556E69743D2232220A202020746966663A585265736F6C7574696F6E3D
                  2237322E30220A202020746966663A595265736F6C7574696F6E3D2237322E30
                  220A20202070686F746F73686F703A436F6C6F724D6F64653D2233220A202020
                  70686F746F73686F703A49434350726F66696C653D2273524742204945433631
                  3936362D322E31220A202020786D703A4D6F64696679446174653D2232303230
                  2D30382D30375431373A34393A31312D30333A3030220A202020786D703A4D65
                  746164617461446174653D22323032302D30382D30375431373A34393A31312D
                  30333A3030223E0A2020203C786D704D4D3A486973746F72793E0A202020203C
                  7264663A5365713E0A20202020203C7264663A6C690A20202020202073744576
                  743A616374696F6E3D2270726F6475636564220A20202020202073744576743A
                  736F6674776172654167656E743D22416666696E6974792044657369676E6572
                  20312E372E33220A20202020202073744576743A7768656E3D22323032302D30
                  382D30375431373A34393A31312D30333A3030222F3E0A202020203C2F726466
                  3A5365713E0A2020203C2F786D704D4D3A486973746F72793E0A20203C2F7264
                  663A4465736372697074696F6E3E0A203C2F7264663A5244463E0A3C2F783A78
                  6D706D6574613E0A3C3F787061636B657420656E643D2272223F3E07888C8A00
                  00018269434350735247422049454336313936362D322E31000028917591BB4B
                  03411087BF4425C10711B4B01009A256896884A08D45822F508B2482519BE4CC
                  43C8E3B84B90602BD80614441B5F85FE05DA0AD682A028825859582BDA6838E7
                  122141CC2C3BFBED6F6786DD59B086524A5A6F1C827426A705A67CCEC5F092D3
                  F6821D1BED58E88928BA3A179C0C51D73EEF254EECD66DD6AA1FF7AFB5ACC674
                  052C76E17145D572C2D3C2B3EB39D5E41DE14E251959153E1376697241E13B53
                  8F56F8D5E44485BF4DD642013F58DB859D891A8ED6B092D4D2C2F272FAD2A9BC
                  F27B1FF325ADB1CC4250D65E99DDE80498C287931926F0E3659831F15EDC7818
                  941D75F287CAF9F364255711AF5240638D044972B844CD4BF598AC71D1633252
                  14CCFEFFEDAB1E1FF154AAB7FAA0E9D930DEFBC1B60DA5A2617C1D1946E9181A
                  9EE03253CDCF1EC2E887E8C5AAD677008E4D38BFAA6AD15DB8D882AE4735A245
                  CA52834C6B3C0E6FA7D016868E1B685EAEF4ECF79C9307086DC8575DC3DE3E0C
                  48BC63E50717EF67C2F7B6D861000000097048597300000B1300000B1301009A
                  9C180000011D494441545885EDD3214EC35000C7E16F280E809B0547B8026504
                  45C23D702428DC732812B80A098A10CA15180E3D87999B44B4CD46B695D7F675
                  08F6776DDAFCBEBCB46CF7DF37D85829E443DC63881B217BDB1CA088E7D82FEF
                  CC702164CFFD0396E3D56638EF17B03E5E6DBCF3877198F6730271F12F8CD29F
                  407CFC54C8C6694FA059FC9DC5DF30E4C7B8C504574236E93B3E0784FC0C8FD8
                  2DEF7FE2241AD1325E00423EC2D342BC5A1CA2431C76F0B0220E07782D03BDC4
                  2BC0B4E6E5F58804F10A70593E188F481467FE111EE1057B35CF16DF44B124F1
                  39A01962902AFE13108FA85BA3F832A01BA2717C35A01DA2557C3DA019A275BC
                  1E1087E814FF1D508FE81C8F03AC462489C7030AC421EECAAB6B21FBE81ADF6E
                  3BF806DBB38AEC588599A90000000049454E44AE426082}
                ParentFont = False
                ShineColor = clWhite
                TabOrder = 0
                Version = '1.3.3.1'
                OnClick = btSalvarClick
              end
              object AdvGlassButton2: TAdvGlassButton
                Left = 149
                Top = 21
                Width = 129
                Height = 40
                Anchors = [akTop, akRight, akBottom]
                BackColor = 12615680
                ButtonDirection = bdLeft
                Caption = 'Cancelar'
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
                OnClick = btVoltarClick
              end
            end
            object Memo1: TMemo
              Left = 10
              Top = 177
              Width = 269
              Height = 99
              TabOrder = 3
            end
          end
          object pnGridFormasRecebimento: TPanel
            Left = 0
            Top = 0
            Width = 711
            Height = 351
            Align = alClient
            TabOrder = 1
            object gridDetalhamentoRecebimentos: TcxGrid
              Left = 1
              Top = 1
              Width = 709
              Height = 349
              Align = alClient
              TabOrder = 0
              object gridDetalhamentoRecebimentosDBTableView1: TcxGridDBTableView
                PopupMenu = popDetalhamento
                Navigator.Buttons.CustomButtons = <>
                ScrollbarAnnotations.CustomAnnotations = <>
                DataController.DataSource = dmAuditoriaCaixas.dsQryDetalhamento
                DataController.Summary.DefaultGroupSummaryItems = <
                  item
                    Kind = skSum
                    Position = spFooter
                    Column = gridDetalhamentoRecebimentosDBTableView1VALOR
                  end
                  item
                    Kind = skSum
                    Column = gridDetalhamentoRecebimentosDBTableView1VALOR
                  end
                  item
                    Kind = skSum
                    Column = gridDetalhamentoRecebimentosDBTableView1VALOR_TOTAL
                  end
                  item
                    Kind = skSum
                    Position = spFooter
                    Column = gridDetalhamentoRecebimentosDBTableView1VALOR_TOTAL
                  end
                  item
                    Kind = skSum
                    Position = spFooter
                    Column = gridDetalhamentoRecebimentosDBTableView1VALOR_TXSERV
                  end
                  item
                    Kind = skSum
                    Column = gridDetalhamentoRecebimentosDBTableView1VALOR_TXSERV
                  end>
                DataController.Summary.FooterSummaryItems = <
                  item
                    Kind = skSum
                    Column = gridDetalhamentoRecebimentosDBTableView1VALOR
                  end
                  item
                    Kind = skSum
                    Column = gridDetalhamentoRecebimentosDBTableView1VALOR_TOTAL
                  end
                  item
                    Kind = skSum
                    Column = gridDetalhamentoRecebimentosDBTableView1VALOR_TXSERV
                  end>
                DataController.Summary.SummaryGroups = <>
                OptionsView.Footer = True
                Styles.Content = stlRegistro
                Styles.ContentOdd = cxStyle2
                object gridDetalhamentoRecebimentosDBTableView1COD_VENDA: TcxGridDBColumn
                  Caption = 'C'#243'd. venda'
                  DataBinding.FieldName = 'COD_VENDA'
                  DataBinding.IsNullValueType = True
                  Options.Editing = False
                  Width = 65
                end
                object gridDetalhamentoRecebimentosDBTableView1MESA: TcxGridDBColumn
                  Caption = 'Mesa'
                  DataBinding.FieldName = 'MESA'
                  DataBinding.IsNullValueType = True
                  Options.Editing = False
                  Width = 42
                end
                object gridDetalhamentoRecebimentosDBTableView1HORA: TcxGridDBColumn
                  Caption = 'Hora'
                  DataBinding.FieldName = 'HORA'
                  DataBinding.IsNullValueType = True
                  Options.Editing = False
                  Width = 58
                end
                object gridDetalhamentoRecebimentosDBTableView1VALOR_TOTAL: TcxGridDBColumn
                  Caption = 'Valor da venda'
                  DataBinding.FieldName = 'VALOR_TOTAL'
                  DataBinding.IsNullValueType = True
                  PropertiesClassName = 'TcxCurrencyEditProperties'
                  Options.Editing = False
                  Width = 92
                end
                object gridDetalhamentoRecebimentosDBTableView1NUMERO_NFCE: TcxGridDBColumn
                  Caption = 'N'#186' NF-e'
                  DataBinding.FieldName = 'NUMERO_NFCE'
                  DataBinding.IsNullValueType = True
                  Options.Editing = False
                  Width = 65
                end
                object gridDetalhamentoRecebimentosDBTableView1VALOR_TXSERV: TcxGridDBColumn
                  Caption = 'Servi'#231'o'
                  DataBinding.FieldName = 'VALOR_TXSERV'
                  DataBinding.IsNullValueType = True
                  PropertiesClassName = 'TcxCurrencyEditProperties'
                  Options.Editing = False
                  Width = 61
                end
                object gridDetalhamentoRecebimentosDBTableView1DESCRICAO: TcxGridDBColumn
                  Caption = 'Descri'#231#227'o da forma'
                  DataBinding.FieldName = 'DESCRICAO'
                  DataBinding.IsNullValueType = True
                  Options.Editing = False
                end
                object gridDetalhamentoRecebimentosDBTableView1VALOR: TcxGridDBColumn
                  Caption = 'Valor da forma'
                  DataBinding.FieldName = 'VALOR'
                  DataBinding.IsNullValueType = True
                  PropertiesClassName = 'TcxCurrencyEditProperties'
                  Options.Editing = False
                  Styles.Footer = stSemManifesto
                  Width = 91
                end
                object gridDetalhamentoRecebimentosDBTableView1LOGIN: TcxGridDBColumn
                  Caption = 'Usu'#225'rio'
                  DataBinding.FieldName = 'LOGIN'
                  DataBinding.IsNullValueType = True
                  Options.Editing = False
                end
                object gridDetalhamentoRecebimentosDBTableView1CLIENTE: TcxGridDBColumn
                  Caption = 'Nome do cliente'
                  DataBinding.FieldName = 'CLIENTE'
                  DataBinding.IsNullValueType = True
                  Width = 300
                end
              end
              object gridDetalhamentoRecebimentosLevel1: TcxGridLevel
                GridView = gridDetalhamentoRecebimentosDBTableView1
              end
            end
          end
        end
        object cxTabSheet3: TcxTabSheet
          Caption = 'Vendas do caixa'
          ImageIndex = 2
          ExplicitLeft = 0
          ExplicitTop = 0
          ExplicitWidth = 0
          ExplicitHeight = 0
          object cxGrid3: TcxGrid
            Left = 0
            Top = 0
            Width = 1002
            Height = 351
            Align = alClient
            TabOrder = 0
            object cxGridDBTableView1: TcxGridDBTableView
              PopupMenu = popDetalhamento
              Navigator.Buttons.CustomButtons = <>
              ScrollbarAnnotations.CustomAnnotations = <>
              DataController.DataSource = dmAuditoriaCaixas.dsQryVendasCaixa
              DataController.Summary.DefaultGroupSummaryItems = <
                item
                  Kind = skSum
                  Position = spFooter
                end
                item
                  Kind = skSum
                end
                item
                  Kind = skSum
                end
                item
                  Kind = skSum
                  Position = spFooter
                end
                item
                  Kind = skSum
                  Position = spFooter
                end
                item
                  Kind = skSum
                end
                item
                  Kind = skSum
                  Position = spFooter
                  Column = cxGridDBTableView1VALOR_BRUTO
                end
                item
                  Kind = skSum
                  Position = spFooter
                  Column = cxGridDBTableView1VALOR_TXSERV
                end
                item
                  Kind = skSum
                  Position = spFooter
                  Column = cxGridDBTableView1VALOR_DESCONTO
                end
                item
                  Kind = skSum
                  Position = spFooter
                  Column = cxGridDBTableView1VALOR_TOTAL
                end
                item
                  Kind = skSum
                  Column = cxGridDBTableView1VALOR_BRUTO
                end
                item
                  Kind = skSum
                  Column = cxGridDBTableView1VALOR_TXSERV
                end
                item
                  Kind = skSum
                  Column = cxGridDBTableView1VALOR_DESCONTO
                end
                item
                  Kind = skSum
                  Column = cxGridDBTableView1VALOR_TOTAL
                end>
              DataController.Summary.FooterSummaryItems = <
                item
                  Kind = skSum
                end
                item
                  Kind = skSum
                end
                item
                  Kind = skSum
                end
                item
                  Kind = skSum
                  Column = cxGridDBTableView1VALOR_BRUTO
                end
                item
                  Kind = skSum
                  Column = cxGridDBTableView1VALOR_TXSERV
                end
                item
                  Kind = skSum
                  Column = cxGridDBTableView1VALOR_DESCONTO
                end
                item
                  Kind = skSum
                  Column = cxGridDBTableView1VALOR_TOTAL
                end
                item
                  Format = '# Registros'
                  Kind = skCount
                  Column = cxGridDBTableView1COD_VENDA
                end>
              DataController.Summary.SummaryGroups = <>
              OptionsView.Footer = True
              Styles.Content = stlRegistro
              Styles.ContentOdd = cxStyle2
              object cxGridDBTableView1COD_VENDA: TcxGridDBColumn
                Caption = 'C'#243'digo'
                DataBinding.FieldName = 'COD_VENDA'
                DataBinding.IsNullValueType = True
                Options.Editing = False
              end
              object cxGridDBTableView1HORA: TcxGridDBColumn
                Caption = 'Hora'
                DataBinding.FieldName = 'HORA'
                DataBinding.IsNullValueType = True
                Options.Editing = False
              end
              object cxGridDBTableView1MESA: TcxGridDBColumn
                Caption = 'Mesa'
                DataBinding.FieldName = 'MESA'
                DataBinding.IsNullValueType = True
                Options.Editing = False
                Width = 47
              end
              object cxGridDBTableView1VALOR_BRUTO: TcxGridDBColumn
                Caption = 'Produtos'
                DataBinding.FieldName = 'VALOR_BRUTO'
                DataBinding.IsNullValueType = True
                PropertiesClassName = 'TcxCurrencyEditProperties'
                Options.Editing = False
                Width = 77
              end
              object cxGridDBTableView1VALOR_TXSERV: TcxGridDBColumn
                Caption = 'Taxa de servi'#231'o'
                DataBinding.FieldName = 'VALOR_TXSERV'
                DataBinding.IsNullValueType = True
                PropertiesClassName = 'TcxCurrencyEditProperties'
                Options.Editing = False
                Width = 89
              end
              object cxGridDBTableView1VALOR_DESCONTO: TcxGridDBColumn
                Caption = 'Desconto'
                DataBinding.FieldName = 'VALOR_DESCONTO'
                DataBinding.IsNullValueType = True
                PropertiesClassName = 'TcxCurrencyEditProperties'
                Options.Editing = False
                Width = 80
              end
              object cxGridDBTableView1VALOR_TOTAL: TcxGridDBColumn
                Caption = 'Total'
                DataBinding.FieldName = 'VALOR_TOTAL'
                DataBinding.IsNullValueType = True
                PropertiesClassName = 'TcxCurrencyEditProperties'
                Options.Editing = False
                Width = 82
              end
              object cxGridDBTableView1NUMERO_NFCE: TcxGridDBColumn
                Caption = 'N'#186' NF-e'
                DataBinding.FieldName = 'NUMERO_NFCE'
                DataBinding.IsNullValueType = True
                Options.Editing = False
                Width = 58
              end
              object cxGridDBTableView1TABELA_PRECO: TcxGridDBColumn
                Caption = 'Tab. pre'#231'o'
                DataBinding.FieldName = 'TABELA_PRECO'
                DataBinding.IsNullValueType = True
                Options.Editing = False
              end
              object cxGridDBTableView1CHAVE_NFCE: TcxGridDBColumn
                Caption = 'Chave NF-e'
                DataBinding.FieldName = 'CHAVE_NFCE'
                DataBinding.IsNullValueType = True
                Options.Editing = False
                Width = 262
              end
              object cxGridDBTableView1LOGIN: TcxGridDBColumn
                Caption = 'Usu'#225'rio'
                DataBinding.FieldName = 'LOGIN'
                DataBinding.IsNullValueType = True
                Options.Editing = False
              end
            end
            object cxGridLevel1: TcxGridLevel
              GridView = cxGridDBTableView1
            end
          end
        end
      end
      object Panel3: TPanel
        Left = 0
        Top = 97
        Width = 1010
        Height = 10
        Align = alTop
        BevelOuter = bvNone
        Color = clWhite
        ParentBackground = False
        TabOrder = 2
        StyleElements = []
      end
      object Panel4: TPanel
        Tag = 99
        Left = 0
        Top = 0
        Width = 1010
        Height = 37
        Align = alTop
        BevelOuter = bvNone
        Color = 12615680
        ParentBackground = False
        TabOrder = 3
        StyleElements = []
        object Label3: TLabel
          Left = 8
          Top = 1
          Width = 929
          Height = 34
          AutoSize = False
          Caption = 
            'Informe o valor auditado na coluna valor auditoria  e poss'#237'veis ' +
            'observa'#231#245'es.'
          Color = 12615680
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -19
          Font.Name = 'Calibri'
          Font.Style = [fsBold]
          ParentColor = False
          ParentFont = False
          Layout = tlCenter
          StyleElements = []
        end
        object PngSpeedButton2: TPngSpeedButton
          Left = 1198
          Top = 0
          Width = 25
          Height = 25
          Flat = True
          OnClick = PngSpeedButton1Click
          PngImage.Data = {
            89504E470D0A1A0A0000000D49484452000000190000001D08060000005F78C7
            75000004B369545874584D4C3A636F6D2E61646F62652E786D7000000000003C
            3F787061636B657420626567696E3D22EFBBBF222069643D2257354D304D7043
            656869487A7265537A4E54637A6B633964223F3E0A3C783A786D706D65746120
            786D6C6E733A783D2261646F62653A6E733A6D6574612F2220783A786D70746B
            3D22584D5020436F726520352E352E30223E0A203C7264663A52444620786D6C
            6E733A7264663D22687474703A2F2F7777772E77332E6F72672F313939392F30
            322F32322D7264662D73796E7461782D6E7323223E0A20203C7264663A446573
            6372697074696F6E207264663A61626F75743D22220A20202020786D6C6E733A
            657869663D22687474703A2F2F6E732E61646F62652E636F6D2F657869662F31
            2E302F220A20202020786D6C6E733A746966663D22687474703A2F2F6E732E61
            646F62652E636F6D2F746966662F312E302F220A20202020786D6C6E733A7068
            6F746F73686F703D22687474703A2F2F6E732E61646F62652E636F6D2F70686F
            746F73686F702F312E302F220A20202020786D6C6E733A786D703D2268747470
            3A2F2F6E732E61646F62652E636F6D2F7861702F312E302F220A20202020786D
            6C6E733A786D704D4D3D22687474703A2F2F6E732E61646F62652E636F6D2F78
            61702F312E302F6D6D2F220A20202020786D6C6E733A73744576743D22687474
            703A2F2F6E732E61646F62652E636F6D2F7861702F312E302F73547970652F52
            65736F757263654576656E7423220A202020657869663A506978656C5844696D
            656E73696F6E3D223235220A202020657869663A506978656C5944696D656E73
            696F6E3D223239220A202020657869663A436F6C6F7253706163653D2231220A
            202020746966663A496D61676557696474683D223235220A202020746966663A
            496D6167654C656E6774683D223239220A202020746966663A5265736F6C7574
            696F6E556E69743D2232220A202020746966663A585265736F6C7574696F6E3D
            2237322F31220A202020746966663A595265736F6C7574696F6E3D2237322F31
            220A20202070686F746F73686F703A436F6C6F724D6F64653D2233220A202020
            70686F746F73686F703A49434350726F66696C653D2273524742204945433631
            3936362D322E31220A202020786D703A4D6F64696679446174653D2232303233
            2D30352D31395431333A32323A30372D30333A3030220A202020786D703A4D65
            746164617461446174653D22323032332D30352D31395431333A32323A30372D
            30333A3030223E0A2020203C786D704D4D3A486973746F72793E0A202020203C
            7264663A5365713E0A20202020203C7264663A6C690A20202020202073744576
            743A616374696F6E3D2270726F6475636564220A20202020202073744576743A
            736F6674776172654167656E743D22416666696E6974792044657369676E6572
            20312E31302E34220A20202020202073744576743A7768656E3D22323032332D
            30352D31395431333A32323A30372D30333A3030222F3E0A202020203C2F7264
            663A5365713E0A2020203C2F786D704D4D3A486973746F72793E0A20203C2F72
            64663A4465736372697074696F6E3E0A203C2F7264663A5244463E0A3C2F783A
            786D706D6574613E0A3C3F787061636B657420656E643D2272223F3E1D450399
            0000018269434350735247422049454336313936362D322E31000028917591BB
            4B03411087BF244A44E30363616111245A45890A411B8B048D825A24118CDA24
            671E421EC75D44C456B00D288836BE0AFD0BB415AC05415104B1D55AD146E59C
            33810431B3CCCEB7BFDD197667C11AC92859BDCE0BD95C410B05FDAEB9E8BCCB
            FE4C3D4EDA68A725A6E8EA74783C424DFBB8C362C69B3EB356ED73FF5AD35242
            57C0D2203CAAA85A417842786AB5A09ABC2DDCA1A4634BC2A7C21E4D2E287C6B
            EAF112BF989C2AF197C95A2414006B9BB02B55C5F12A56D25A56585E8E3B9B59
            51CAF7315FE248E466C312BBC5BBD00911C48F8B49C608E0638011997DF43148
            BFACA891EFFDCD9F212FB98ACC2A6B682C93224D018FA82B523D2131297A4246
            8635B3FF7FFBAA2787064BD51D7EA87F328CB71EB06FC177D1303E0F0DE3FB08
            6C8F7091ABE4E70F60F85DF4624573EF43EB069C5D56B4F80E9C6F42E7831AD3
            62BF924DDC9A4CC2EB093447C1790D8D0BA59E95F739BE87C8BA7CD515ECEE41
            AF9C6F5DFC0134DC67CFF8A2DC1B000000097048597300000B1300000B130100
            9A9C18000001674944415478DAE596BF2B456118C7CFEB5706A355194C922C8A
            4131CAC444CA1D2883C16221260B8B425106140B61B1DE41515296BB89FB6718
            94CBF1F9DEF39E3AE9A6E3BEE73D034F7D3AEFE93DF7F9749FF7A70972081337
            C2306CE2D105AD19E47D83B231A65295905CA2455887B60CFFC02BACC1B62405
            1AC71EAB5590A444A3D7A3A42489EAD6E851529124F428A8C6FF925C433B0CD6
            E8BB0DA2A93AEA22B961418DF04903ED3D984FF46DC232FD4A714F7BA05E4919
            BA49F46E4507300B1BB06205DA219EA1C3A55C973095108DC39515B4A80D63AE
            63A23887E9782F52F0B3661E6756FA63FC6676CD20394948526F476925FBB0A0
            122524C93172961CC11C824F3ED5F6330117764CF47E0A932E9227E821E1874D
            78A8B2C1162C5991C646B3ABB35EC91D8986BE09E2D80DA27348F100FD2EE52A
            06D18AEFABD1F718442B7ED8A55C99C4DF92E47232E672C6E7725BF179EF5A85
            1D9F37C817ED147A318EC952C5175AE3CF16E021188B0000000049454E44AE42
            6082}
        end
      end
      object Panel5: TPanel
        Left = 0
        Top = 589
        Width = 1010
        Height = 64
        Align = alBottom
        Color = clWhite
        ParentBackground = False
        TabOrder = 4
        StyleElements = []
        DesignSize = (
          1010
          64)
        object btSalvar: TAdvGlassButton
          Left = 618
          Top = 3
          Width = 188
          Height = 59
          Anchors = [akTop, akRight, akBottom]
          BackColor = 12615680
          ButtonDirection = bdLeft
          Caption = 'Salvar e confirmar'
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
            89504E470D0A1A0A0000000D4948445200000020000000200806000000737A7A
            F4000004B269545874584D4C3A636F6D2E61646F62652E786D7000000000003C
            3F787061636B657420626567696E3D22EFBBBF222069643D2257354D304D7043
            656869487A7265537A4E54637A6B633964223F3E0A3C783A786D706D65746120
            786D6C6E733A783D2261646F62653A6E733A6D6574612F2220783A786D70746B
            3D22584D5020436F726520352E352E30223E0A203C7264663A52444620786D6C
            6E733A7264663D22687474703A2F2F7777772E77332E6F72672F313939392F30
            322F32322D7264662D73796E7461782D6E7323223E0A20203C7264663A446573
            6372697074696F6E207264663A61626F75743D22220A20202020786D6C6E733A
            657869663D22687474703A2F2F6E732E61646F62652E636F6D2F657869662F31
            2E302F220A20202020786D6C6E733A746966663D22687474703A2F2F6E732E61
            646F62652E636F6D2F746966662F312E302F220A20202020786D6C6E733A7068
            6F746F73686F703D22687474703A2F2F6E732E61646F62652E636F6D2F70686F
            746F73686F702F312E302F220A20202020786D6C6E733A786D703D2268747470
            3A2F2F6E732E61646F62652E636F6D2F7861702F312E302F220A20202020786D
            6C6E733A786D704D4D3D22687474703A2F2F6E732E61646F62652E636F6D2F78
            61702F312E302F6D6D2F220A20202020786D6C6E733A73744576743D22687474
            703A2F2F6E732E61646F62652E636F6D2F7861702F312E302F73547970652F52
            65736F757263654576656E7423220A202020657869663A506978656C5844696D
            656E73696F6E3D223332220A202020657869663A506978656C5944696D656E73
            696F6E3D223332220A202020657869663A436F6C6F7253706163653D2231220A
            202020746966663A496D61676557696474683D223332220A202020746966663A
            496D6167654C656E6774683D223332220A202020746966663A5265736F6C7574
            696F6E556E69743D2232220A202020746966663A585265736F6C7574696F6E3D
            2237322E30220A202020746966663A595265736F6C7574696F6E3D2237322E30
            220A20202070686F746F73686F703A436F6C6F724D6F64653D2233220A202020
            70686F746F73686F703A49434350726F66696C653D2273524742204945433631
            3936362D322E31220A202020786D703A4D6F64696679446174653D2232303230
            2D30382D30375431373A34393A31312D30333A3030220A202020786D703A4D65
            746164617461446174653D22323032302D30382D30375431373A34393A31312D
            30333A3030223E0A2020203C786D704D4D3A486973746F72793E0A202020203C
            7264663A5365713E0A20202020203C7264663A6C690A20202020202073744576
            743A616374696F6E3D2270726F6475636564220A20202020202073744576743A
            736F6674776172654167656E743D22416666696E6974792044657369676E6572
            20312E372E33220A20202020202073744576743A7768656E3D22323032302D30
            382D30375431373A34393A31312D30333A3030222F3E0A202020203C2F726466
            3A5365713E0A2020203C2F786D704D4D3A486973746F72793E0A20203C2F7264
            663A4465736372697074696F6E3E0A203C2F7264663A5244463E0A3C2F783A78
            6D706D6574613E0A3C3F787061636B657420656E643D2272223F3E07888C8A00
            00018269434350735247422049454336313936362D322E31000028917591BB4B
            03411087BF4425C10711B4B01009A256896884A08D45822F508B2482519BE4CC
            43C8E3B84B90602BD80614441B5F85FE05DA0AD682A028825859582BDA6838E7
            122141CC2C3BFBED6F6786DD59B086524A5A6F1C827426A705A67CCEC5F092D3
            F6821D1BED58E88928BA3A179C0C51D73EEF254EECD66DD6AA1FF7AFB5ACC674
            052C76E17145D572C2D3C2B3EB39D5E41DE14E251959153E1376697241E13B53
            8F56F8D5E44485BF4DD642013F58DB859D891A8ED6B092D4D2C2F272FAD2A9BC
            F27B1FF325ADB1CC4250D65E99DDE80498C287931926F0E3659831F15EDC7818
            941D75F287CAF9F364255711AF5240638D044972B844CD4BF598AC71D1633252
            14CCFEFFEDAB1E1FF154AAB7FAA0E9D930DEFBC1B60DA5A2617C1D1946E9181A
            9EE03253CDCF1EC2E887E8C5AAD677008E4D38BFAA6AD15DB8D882AE4735A245
            CA52834C6B3C0E6FA7D016868E1B685EAEF4ECF79C9307086DC8575DC3DE3E0C
            48BC63E50717EF67C2F7B6D861000000097048597300000B1300000B1301009A
            9C180000011D494441545885EDD3214EC35000C7E16F280E809B0547B8026504
            45C23D702428DC732812B80A098A10CA15180E3D87999B44B4CD46B695D7F675
            08F6776DDAFCBEBCB46CF7DF37D85829E443DC63881B217BDB1CA088E7D82FEF
            CC702164CFFD0396E3D56638EF17B03E5E6DBCF3877198F6730271F12F8CD29F
            407CFC54C8C6694FA059FC9DC5DF30E4C7B8C504574236E93B3E0784FC0C8FD8
            2DEF7FE2241AD1325E00423EC2D342BC5A1CA2431C76F0B0220E07782D03BDC4
            2BC0B4E6E5F58804F10A70593E188F481467FE111EE1057B35CF16DF44B124F1
            39A01962902AFE13108FA85BA3F832A01BA2717C35A01DA2557C3DA019A275BC
            1E1087E814FF1D508FE81C8F03AC462489C7030AC421EECAAB6B21FBE81ADF6E
            3BF806DBB38AEC588599A90000000049454E44AE426082}
          ParentFont = False
          ShineColor = clWhite
          TabOrder = 0
          Version = '1.3.3.1'
          OnClick = btSalvarClick
        end
        object btVoltar: TAdvGlassButton
          Left = 817
          Top = 3
          Width = 188
          Height = 59
          Anchors = [akTop, akRight, akBottom]
          BackColor = 12615680
          ButtonDirection = bdLeft
          Caption = 'Cancelar auditoria'
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
          OnClick = btVoltarClick
        end
      end
      object Panel7: TPanel
        Left = 0
        Top = 486
        Width = 1010
        Height = 103
        Align = alBottom
        Color = clWhite
        ParentBackground = False
        TabOrder = 5
        StyleElements = []
        DesignSize = (
          1010
          103)
        object Label8: TLabel
          Left = 6
          Top = 2
          Width = 291
          Height = 24
          Anchors = [akLeft, akTop, akRight]
          AutoSize = False
          Caption = 'Observa'#231#245'es gerais sobre a auditoria:'
          Color = clWhite
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Calibri'
          Font.Style = []
          ParentColor = False
          ParentFont = False
          Layout = tlCenter
          StyleElements = []
        end
        object Label10: TLabel
          Left = 447
          Top = 1
          Width = 291
          Height = 24
          Anchors = [akLeft, akTop, akRight]
          AutoSize = False
          Caption = 'Hist'#243'rico da auditoria'
          Color = clWhite
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Calibri'
          Font.Style = []
          ParentColor = False
          ParentFont = False
          Layout = tlCenter
          StyleElements = []
        end
        object memoObservacoesAuditoria: TMemo
          Left = 4
          Top = 25
          Width = 437
          Height = 72
          TabOrder = 0
        end
        object cbHistoricoAuditoria: TcxLookupComboBox
          Left = 447
          Top = 25
          ParentFont = False
          Properties.DropDownAutoSize = True
          Properties.DropDownRows = 30
          Properties.IncrementalFilteringOptions = [ifoHighlightSearchText, ifoUseContainsOperator]
          Properties.KeyFieldNames = 'ID'
          Properties.ListColumns = <
            item
              Caption = 'ID'
              FieldName = 'ID'
            end
            item
              Caption = 'Descri'#231#227'o'
              FieldName = 'DESCRICAO'
            end>
          Properties.ListFieldIndex = 1
          Properties.ListOptions.CaseInsensitive = True
          Properties.ListOptions.ColumnSorting = False
          Properties.ListSource = dmAuditoriaCaixas.dsHistoricosAuditoria
          Properties.MaxLength = 50
          Properties.ReadOnly = False
          EditValue = '0'
          Style.Font.Charset = ANSI_CHARSET
          Style.Font.Color = clWindowText
          Style.Font.Height = -15
          Style.Font.Name = 'Roboto'
          Style.Font.Style = []
          Style.IsFontAssigned = True
          TabOrder = 1
          OnEnter = Edit1Enter
          OnExit = Edit1Exit
          Width = 359
        end
      end
    end
  end
  inherited cliques: TActionList
    Left = 146
    Top = 609
  end
  inherited actlBusca: TJvControlActionList
    Left = 198
    Top = 613
  end
  inherited popMenuExportacaoGrid: TPopupMenu
    Left = 192
    Top = 175
  end
  object PopupMenu1: TPopupMenu
    Left = 546
    Top = 257
    object I70003009: TMenuItem
      Caption = 'Reimprimir relat'#243'rio (Miniprinter)'
      OnClick = I70003009Click
    end
    object N4: TMenuItem
      Caption = '-'
    end
    object I70003007: TMenuItem
      Caption = 'Realizar/visualizar auditoria'
      OnClick = I70003007Click
    end
    object I70003008: TMenuItem
      Caption = 'Desfazer auditoria'
      OnClick = I70003008Click
    end
    object N1: TMenuItem
      Caption = '-'
    end
    object R1: TMenuItem
      Caption = 'Relat'#243'rios'
      object I2: TMenuItem
        Caption = 'Produtos vendidos'
        OnClick = I2Click
      end
      object V1: TMenuItem
        Caption = 'Vendas'
        OnClick = V1Click
      end
      object Estornosdemesa1: TMenuItem
        Caption = '-'
      end
      object E1: TMenuItem
        Caption = 'Estornos de produtos'
        OnClick = E1Click
      end
      object E2: TMenuItem
        Caption = 'Estornos de mesa'
        OnClick = E2Click
      end
      object N2: TMenuItem
        Caption = '-'
      end
      object T1: TMenuItem
        Caption = 'Transfer'#234'ncias de produtos'
        OnClick = T1Click
      end
      object T2: TMenuItem
        Caption = 'Transfer'#234'ncias de mesa'
        OnClick = T2Click
      end
      object N3: TMenuItem
        Caption = '-'
      end
      object S1: TMenuItem
        Caption = 'Sangrias do caixa'
        OnClick = S1Click
      end
    end
  end
  object cxStyleRepository1: TcxStyleRepository
    Left = 32
    Top = 605
    PixelsPerInch = 96
    object cxStyle2: TcxStyle
      AssignedValues = [svColor, svFont]
      Color = 15329769
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 12615680
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
    end
    object stlRegistro: TcxStyle
      AssignedValues = [svFont]
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 12615680
      Font.Height = -11
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
    object cxstyl1: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = clRed
      TextColor = clWhite
    end
  end
  object cxImageList1: TcxImageList
    SourceDPI = 96
    FormatVersion = 1
    DesignInfo = 39845978
    ImageInfo = <
      item
        Image.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000020205064B4BAEC24B4BACC00202
          0405000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000C0C1D206363E4FE6363E4FE0C0C
          1C1F000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000000000001C1C41481C1C40470000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000000000004545A1B34747A3B60000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000000000006363E5FF6363E5FF0000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000000000006363E5FF6363E5FF0000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000000000006363E5FF6363E5FF0000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000000000006363E5FF6363E5FF0000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000000000006363E5FF6363E5FF0000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000000000006363E5FF6363E5FF0000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000000000006363E5FF6363E5FF0000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000000000006363E5FF6363E5FF0000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000000000004646A3B54646A3B50000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000}
      end
      item
        ImageClass = 'TdxPNGImage'
        Image.Data = {
          89504E470D0A1A0A0000000D49484452000000100000001008060000001FF3FF
          610000054169545874584D4C3A636F6D2E61646F62652E786D7000000000003C
          3F787061636B657420626567696E3D22EFBBBF222069643D2257354D304D7043
          656869487A7265537A4E54637A6B633964223F3E0A3C783A786D706D65746120
          786D6C6E733A783D2261646F62653A6E733A6D6574612F2220783A786D70746B
          3D22584D5020436F726520352E352E30223E0A203C7264663A52444620786D6C
          6E733A7264663D22687474703A2F2F7777772E77332E6F72672F313939392F30
          322F32322D7264662D73796E7461782D6E7323223E0A20203C7264663A446573
          6372697074696F6E207264663A61626F75743D22220A20202020786D6C6E733A
          657869663D22687474703A2F2F6E732E61646F62652E636F6D2F657869662F31
          2E302F220A20202020786D6C6E733A70686F746F73686F703D22687474703A2F
          2F6E732E61646F62652E636F6D2F70686F746F73686F702F312E302F220A2020
          2020786D6C6E733A746966663D22687474703A2F2F6E732E61646F62652E636F
          6D2F746966662F312E302F220A20202020786D6C6E733A786D703D2268747470
          3A2F2F6E732E61646F62652E636F6D2F7861702F312E302F220A20202020786D
          6C6E733A786D704D4D3D22687474703A2F2F6E732E61646F62652E636F6D2F78
          61702F312E302F6D6D2F220A20202020786D6C6E733A73744576743D22687474
          703A2F2F6E732E61646F62652E636F6D2F7861702F312E302F73547970652F52
          65736F757263654576656E7423220A202020657869663A436F6C6F7253706163
          653D2231220A202020657869663A506978656C5844696D656E73696F6E3D2231
          36220A202020657869663A506978656C5944696D656E73696F6E3D223136220A
          20202070686F746F73686F703A436F6C6F724D6F64653D2233220A2020207068
          6F746F73686F703A49434350726F66696C653D22735247422049454336313936
          362D322E31220A202020746966663A496D6167654C656E6774683D223136220A
          202020746966663A496D61676557696474683D223136220A202020746966663A
          5265736F6C7574696F6E556E69743D2232220A202020746966663A585265736F
          6C7574696F6E3D2237322F31220A202020746966663A595265736F6C7574696F
          6E3D2237322F31220A202020786D703A4D65746164617461446174653D223230
          32332D30392D30355431303A34313A30322D30333A3030220A202020786D703A
          4D6F64696679446174653D22323032332D30392D30355431303A34313A30322D
          30333A3030223E0A2020203C786D704D4D3A486973746F72793E0A202020203C
          7264663A5365713E0A20202020203C7264663A6C690A202020202020786D704D
          4D3A616374696F6E3D2270726F6475636564220A202020202020786D704D4D3A
          736F6674776172654167656E743D22416666696E6974792044657369676E6572
          20312E372E33220A202020202020786D704D4D3A7768656E3D22323032302D30
          382D30375431373A34393A31312D30333A3030222F3E0A20202020203C726466
          3A6C690A20202020202073744576743A616374696F6E3D2270726F6475636564
          220A20202020202073744576743A736F6674776172654167656E743D22416666
          696E6974792044657369676E657220312E31302E34220A202020202020737445
          76743A7768656E3D22323032332D30392D30355431303A34313A30322D30333A
          3030222F3E0A202020203C2F7264663A5365713E0A2020203C2F786D704D4D3A
          486973746F72793E0A20203C2F7264663A4465736372697074696F6E3E0A203C
          2F7264663A5244463E0A3C2F783A786D706D6574613E0A3C3F787061636B6574
          20656E643D2272223F3E113C2577000001816943435073524742204945433631
          3936362D322E31000028917591BB4B034110873F4F836F222862611144AD8C44
          85A08D45C417A8458CE0AB492E974448E2717722622BD80A0AA28DAF42FF026D
          056B415014416CB556B4D170CEE5021131B3CCCEB7BFDD1976674189A4D58C59
          11804CD632C2A321DFECDCBCAFF2856A3C2834531F554D7D727A244249FBBCA7
          CC89B77EA756E973FF5A6D5C335528AB121E5475C3121E139E58B5748777849B
          D454342E7C26DC65C80585EF1C3DE6F2ABC34997BF1D3622E121501A847DC95F
          1CFBC56ACAC808CBCB69CFA457D4C27D9C97D469D99969896DE2AD9884192584
          8F71861922480F033207F1D34BB7AC28911FC8E74FB12CB9AACC3A6B182C9124
          854597A82B525D9398105D939166CDE9FFDFBE9A89BE5EB77A5D083CCFB6FDDE
          0195DB90DBB2EDAF23DBCE1D43F9135C668BF9CB87D0FF21FA56516B3F00EF06
          9C5F15B5D82E5C6C42CBA31E35A279A95C5C4924E0ED14EAE7A0F1066A16DC9E
          15F6397980C8BA7CD535ECED43A79CF72EFE00067367BA6257EA1F0000000970
          48597300000B1300000B1301009A9C180000009E49444154388DCDD2BD0EC150
          1880E187482C1693BB91EEDD88B0B995732B364B0D127BC3D5D8BBD80C8E946A
          9B3606BEE9FCE4797386C3AF67D05B847C8C1D6658F40B3C7086349E5C865F60
          28BABDA01E9F910E847C8A03AED80AC9AD2B169262882312AC9145D009C308C5
          CB651A23CBB86FC5CFC00A27CCDF22E5BA11F3FC07219F5422D5A9C565A03DD2
          88DF03F59156FC192823FBB8DBB4E1FF983B56AA3DA8E8612FFB000000004945
          4E44AE426082}
      end
      item
        ImageClass = 'TdxPNGImage'
        Image.Data = {
          89504E470D0A1A0A0000000D49484452000000100000001008060000001FF3FF
          61000004B369545874584D4C3A636F6D2E61646F62652E786D7000000000003C
          3F787061636B657420626567696E3D22EFBBBF222069643D2257354D304D7043
          656869487A7265537A4E54637A6B633964223F3E0A3C783A786D706D65746120
          786D6C6E733A783D2261646F62653A6E733A6D6574612F2220783A786D70746B
          3D22584D5020436F726520352E352E30223E0A203C7264663A52444620786D6C
          6E733A7264663D22687474703A2F2F7777772E77332E6F72672F313939392F30
          322F32322D7264662D73796E7461782D6E7323223E0A20203C7264663A446573
          6372697074696F6E207264663A61626F75743D22220A20202020786D6C6E733A
          657869663D22687474703A2F2F6E732E61646F62652E636F6D2F657869662F31
          2E302F220A20202020786D6C6E733A746966663D22687474703A2F2F6E732E61
          646F62652E636F6D2F746966662F312E302F220A20202020786D6C6E733A7068
          6F746F73686F703D22687474703A2F2F6E732E61646F62652E636F6D2F70686F
          746F73686F702F312E302F220A20202020786D6C6E733A786D703D2268747470
          3A2F2F6E732E61646F62652E636F6D2F7861702F312E302F220A20202020786D
          6C6E733A786D704D4D3D22687474703A2F2F6E732E61646F62652E636F6D2F78
          61702F312E302F6D6D2F220A20202020786D6C6E733A73744576743D22687474
          703A2F2F6E732E61646F62652E636F6D2F7861702F312E302F73547970652F52
          65736F757263654576656E7423220A202020657869663A506978656C5844696D
          656E73696F6E3D223136220A202020657869663A506978656C5944696D656E73
          696F6E3D223136220A202020657869663A436F6C6F7253706163653D2231220A
          202020746966663A496D61676557696474683D223136220A202020746966663A
          496D6167654C656E6774683D223136220A202020746966663A5265736F6C7574
          696F6E556E69743D2232220A202020746966663A585265736F6C7574696F6E3D
          2237322F31220A202020746966663A595265736F6C7574696F6E3D2237322F31
          220A20202070686F746F73686F703A436F6C6F724D6F64653D2233220A202020
          70686F746F73686F703A49434350726F66696C653D2273524742204945433631
          3936362D322E31220A202020786D703A4D6F64696679446174653D2232303233
          2D30392D30355431303A34323A33352D30333A3030220A202020786D703A4D65
          746164617461446174653D22323032332D30392D30355431303A34323A33352D
          30333A3030223E0A2020203C786D704D4D3A486973746F72793E0A202020203C
          7264663A5365713E0A20202020203C7264663A6C690A20202020202073744576
          743A616374696F6E3D2270726F6475636564220A20202020202073744576743A
          736F6674776172654167656E743D22416666696E6974792044657369676E6572
          20312E31302E34220A20202020202073744576743A7768656E3D22323032332D
          30392D30355431303A34323A33352D30333A3030222F3E0A202020203C2F7264
          663A5365713E0A2020203C2F786D704D4D3A486973746F72793E0A20203C2F72
          64663A4465736372697074696F6E3E0A203C2F7264663A5244463E0A3C2F783A
          786D706D6574613E0A3C3F787061636B657420656E643D2272223F3ED37C0D3B
          0000018169434350735247422049454336313936362D322E31000028917591BB
          4B034110873F4F836F222862611144AD8C4485A08D45C417A8458CE0AB492E97
          4448E2717722622BD80A0AA28DAF42FF026D056B415014416CB556B4D170CEE5
          021131B3CCCEB7BFDD1976674189A4D58C5911804CD632C2A321DFECDCBCAFF2
          856A3C2834531F554D7D727A244249FBBCA7CC89B77EA756E973FF5A6D5C3355
          28AB121E5475C3121E139E58B5748777849BD454342E7C26DC65C80585EF1C3D
          E6F2ABC34997BF1D3622E121501A847DC95F1CFBC56ACAC808CBCB69CFA457D4
          C27D9C97D469D99969896DE2AD98841925848F71861922480F033207F1D34BB7
          AC28911FC8E74FB12CB9AACC3A6B182C9124854597A82B525D9398105D939166
          CDE9FFDFBE9A89BE5EB77A5D083CCFB6FDDE0195DB90DBB2EDAF23DBCE1D43F9
          135C668BF9CB87D0FF21FA56516B3F00EF069C5F15B5D82E5C6C42CBA31E35A2
          79A95C5C4924E0ED14EAE7A0F1066A16DC9E15F6397980C8BA7CD535ECED43A7
          9CF72EFE00067367BA6257EA1F000000097048597300000B1300000B1301009A
          9C180000016049444154388DADD2CF8B8D511807F0CFBDDDCD84669A8D7256B2
          B242AC268AFC4829664C64A94E2C46B2B1D558595951363C4929194C77A6E666
          6762B0E41F504A6FD94CCAD828C5E29E9BB737F75AF0ADA7D3F93ECFF7F9750E
          FF885693A8729EC0151CC34E6CE035D6F03845AC9798B3586835C427F1001343
          0A7EC4348EE026AE766AE2693C4107EFF014CFF01DFB9171106F8B1FB6B48B78
          1C51C40BD89B226E6006E752C4431CC51D8C616A50B85DCECB98C4075C48113F
          0B7FBC182C61AE39D320C16754984D115F87CCDFC437BC1A1951E5BC5AE5BC3A
          2AA633CA89E77F6BA355E57C185D6CAEF1BD1471624857BBD0C37C8AB8D7C681
          86B81EBC52E5BC52BB8FEB3FED366CE5F712EBB885537F48D6C25DECC03A6E0F
          46B88E79BCC11EFD777E81FB78894D388D59ECC60F9C49115DFA4BDC28451671
          A9ECE350B126BEE07C8A581E106DFD1F78119122DE635F49F4089F4ABB6BB886
          ED75F17FC12FB2AD63C6165288EB0000000049454E44AE426082}
      end
      item
        ImageClass = 'TdxPNGImage'
        Image.Data = {
          89504E470D0A1A0A0000000D49484452000000100000001008060000001FF3FF
          610000054169545874584D4C3A636F6D2E61646F62652E786D7000000000003C
          3F787061636B657420626567696E3D22EFBBBF222069643D2257354D304D7043
          656869487A7265537A4E54637A6B633964223F3E0A3C783A786D706D65746120
          786D6C6E733A783D2261646F62653A6E733A6D6574612F2220783A786D70746B
          3D22584D5020436F726520352E352E30223E0A203C7264663A52444620786D6C
          6E733A7264663D22687474703A2F2F7777772E77332E6F72672F313939392F30
          322F32322D7264662D73796E7461782D6E7323223E0A20203C7264663A446573
          6372697074696F6E207264663A61626F75743D22220A20202020786D6C6E733A
          657869663D22687474703A2F2F6E732E61646F62652E636F6D2F657869662F31
          2E302F220A20202020786D6C6E733A70686F746F73686F703D22687474703A2F
          2F6E732E61646F62652E636F6D2F70686F746F73686F702F312E302F220A2020
          2020786D6C6E733A746966663D22687474703A2F2F6E732E61646F62652E636F
          6D2F746966662F312E302F220A20202020786D6C6E733A786D703D2268747470
          3A2F2F6E732E61646F62652E636F6D2F7861702F312E302F220A20202020786D
          6C6E733A786D704D4D3D22687474703A2F2F6E732E61646F62652E636F6D2F78
          61702F312E302F6D6D2F220A20202020786D6C6E733A73744576743D22687474
          703A2F2F6E732E61646F62652E636F6D2F7861702F312E302F73547970652F52
          65736F757263654576656E7423220A202020657869663A436F6C6F7253706163
          653D2231220A202020657869663A506978656C5844696D656E73696F6E3D2231
          36220A202020657869663A506978656C5944696D656E73696F6E3D223136220A
          20202070686F746F73686F703A436F6C6F724D6F64653D2233220A2020207068
          6F746F73686F703A49434350726F66696C653D22735247422049454336313936
          362D322E31220A202020746966663A496D6167654C656E6774683D223136220A
          202020746966663A496D61676557696474683D223136220A202020746966663A
          5265736F6C7574696F6E556E69743D2232220A202020746966663A585265736F
          6C7574696F6E3D2237322F31220A202020746966663A595265736F6C7574696F
          6E3D2237322F31220A202020786D703A4D65746164617461446174653D223230
          32332D30392D30355431303A34313A31362D30333A3030220A202020786D703A
          4D6F64696679446174653D22323032332D30392D30355431303A34313A31362D
          30333A3030223E0A2020203C786D704D4D3A486973746F72793E0A202020203C
          7264663A5365713E0A20202020203C7264663A6C690A202020202020786D704D
          4D3A616374696F6E3D2270726F6475636564220A202020202020786D704D4D3A
          736F6674776172654167656E743D22416666696E6974792044657369676E6572
          20312E372E33220A202020202020786D704D4D3A7768656E3D22323032312D31
          302D30385431313A34313A34312D30333A3030222F3E0A20202020203C726466
          3A6C690A20202020202073744576743A616374696F6E3D2270726F6475636564
          220A20202020202073744576743A736F6674776172654167656E743D22416666
          696E6974792044657369676E657220312E31302E34220A202020202020737445
          76743A7768656E3D22323032332D30392D30355431303A34313A31362D30333A
          3030222F3E0A202020203C2F7264663A5365713E0A2020203C2F786D704D4D3A
          486973746F72793E0A20203C2F7264663A4465736372697074696F6E3E0A203C
          2F7264663A5244463E0A3C2F783A786D706D6574613E0A3C3F787061636B6574
          20656E643D2272223F3EDD222818000001816943435073524742204945433631
          3936362D322E31000028917591BB4B034110873F4F836F222862611144AD8C44
          85A08D45C417A8458CE0AB492E974448E2717722622BD80A0AA28DAF42FF026D
          056B415014416CB556B4D170CEE5021131B3CCCEB7BFDD1976674189A4D58C59
          11804CD632C2A321DFECDCBCAFF2856A3C2834531F554D7D727A244249FBBCA7
          CC89B77EA756E973FF5A6D5C335528AB121E5475C3121E139E58B5748777849B
          D454342E7C26DC65C80585EF1C3DE6F2ABC34997BF1D3622E121501A847DC95F
          1CFBC56ACAC808CBCB69CFA457D4C27D9C97D469D99969896DE2AD9884192584
          8F71861922480F033207F1D34BB7AC28911FC8E74FB12CB9AACC3A6B182C9124
          854597A82B525D9398105D939166CDE9FFDFBE9A89BE5EB77A5D083CCFB6FDDE
          0195DB90DBB2EDAF23DBCE1D43F9135C668BF9CB87D0FF21FA56516B3F00EF06
          9C5F15B5D82E5C6C42CBA31E35A279A95C5C4924E0ED14EAE7A0F1066A16DC9E
          15F6397980C8BA7CD535ECED43A79CF72EFE00067367BA6257EA1F0000000970
          48597300000B1300000B1301009A9C180000022349444154388D85934F68CF71
          1CC65FCFFBFBF567BF5F28B6327351A46807492BE3E0A2149A569A2D2527B948
          0E9883D8798E4AEE4BDFB399ECE026BBC8655B21943445537E0D6DDFEFE771F0
          9B7E263CA7CFA79ED7E779BF9FFA88160D4D0C852BD709BA811E85BA9C0CF00E
          3185992DCBB2511C2FD232A3E5C3C0C4C0FA8CEC307051D23E6015BFABB4FD34
          A5345A55D56471BC58F8F5C0C0F8C07A85CE86E292D056FE21DB1F6D8F90B833
          76746C31862686228BEC70F07F1840524744DC40F40168F0FEE03A657A2869FF
          7FD8D2F634628B508793676C1F0C82EEE6CEFF52657BDCF679275F071A0A6D47
          F406D0C39F85B52AD97E6C7BF8D3CCA729600D10402E696FAE50D7724A4A6912
          988B8863407B139E72F2F9AFF35FDFB4EF6A3F131197813A60E3CEDCC92884F1
          5BC4DD6FE9DB789BDB5E86E282EDD74E3E532E95EF6B9B6AA723E21AB0F957A1
          28E5C0BBE6A54B527F3DAFCF2E940BB76AAA7DB1FDA85C2ADFE7ABF393117115
          D8D6B29A81B91C310594C05AE004C6F5BC7E53A1DB8D0F8DAC997C15D8B1B2D8
          E4F42CC7CC1A3F9574006803FA31AB5299866B9B6A8722627845F2CF78FB55B5
          583DC94B958D8C6C3473B613D1D19CA44FD20E499DAD3BB7C0DF6D5F29FA8AF9
          288E14A9AAAAC9E434027C6E7A56037BFE0AE30B49E9014006303D36BDD47DAA
          FBB9E557C06E491B68F968CDC24ADB2F6C9F4B4AC5BD23F74A569800181C1FDC
          88E895B4D7B853280173C9E959B5583D29FA8AF956FF0F8B0007E3C012CB6A00
          00000049454E44AE426082}
      end
      item
        ImageClass = 'TdxPNGImage'
        Image.Data = {
          89504E470D0A1A0A0000000D49484452000000100000001008060000001FF3FF
          610000054169545874584D4C3A636F6D2E61646F62652E786D7000000000003C
          3F787061636B657420626567696E3D22EFBBBF222069643D2257354D304D7043
          656869487A7265537A4E54637A6B633964223F3E0A3C783A786D706D65746120
          786D6C6E733A783D2261646F62653A6E733A6D6574612F2220783A786D70746B
          3D22584D5020436F726520352E352E30223E0A203C7264663A52444620786D6C
          6E733A7264663D22687474703A2F2F7777772E77332E6F72672F313939392F30
          322F32322D7264662D73796E7461782D6E7323223E0A20203C7264663A446573
          6372697074696F6E207264663A61626F75743D22220A20202020786D6C6E733A
          657869663D22687474703A2F2F6E732E61646F62652E636F6D2F657869662F31
          2E302F220A20202020786D6C6E733A70686F746F73686F703D22687474703A2F
          2F6E732E61646F62652E636F6D2F70686F746F73686F702F312E302F220A2020
          2020786D6C6E733A746966663D22687474703A2F2F6E732E61646F62652E636F
          6D2F746966662F312E302F220A20202020786D6C6E733A786D703D2268747470
          3A2F2F6E732E61646F62652E636F6D2F7861702F312E302F220A20202020786D
          6C6E733A786D704D4D3D22687474703A2F2F6E732E61646F62652E636F6D2F78
          61702F312E302F6D6D2F220A20202020786D6C6E733A73744576743D22687474
          703A2F2F6E732E61646F62652E636F6D2F7861702F312E302F73547970652F52
          65736F757263654576656E7423220A202020657869663A436F6C6F7253706163
          653D2231220A202020657869663A506978656C5844696D656E73696F6E3D2231
          36220A202020657869663A506978656C5944696D656E73696F6E3D223136220A
          20202070686F746F73686F703A436F6C6F724D6F64653D2233220A2020207068
          6F746F73686F703A49434350726F66696C653D22735247422049454336313936
          362D322E31220A202020746966663A496D6167654C656E6774683D223136220A
          202020746966663A496D61676557696474683D223136220A202020746966663A
          5265736F6C7574696F6E556E69743D2232220A202020746966663A585265736F
          6C7574696F6E3D2237322F31220A202020746966663A595265736F6C7574696F
          6E3D2237322F31220A202020786D703A4D65746164617461446174653D223230
          32332D30392D30355431303A34303A34362D30333A3030220A202020786D703A
          4D6F64696679446174653D22323032332D30392D30355431303A34303A34362D
          30333A3030223E0A2020203C786D704D4D3A486973746F72793E0A202020203C
          7264663A5365713E0A20202020203C7264663A6C690A202020202020786D704D
          4D3A616374696F6E3D2270726F6475636564220A202020202020786D704D4D3A
          736F6674776172654167656E743D22416666696E6974792044657369676E6572
          20312E372E33220A202020202020786D704D4D3A7768656E3D22323032312D31
          302D30385431313A34383A35312D30333A3030222F3E0A20202020203C726466
          3A6C690A20202020202073744576743A616374696F6E3D2270726F6475636564
          220A20202020202073744576743A736F6674776172654167656E743D22416666
          696E6974792044657369676E657220312E31302E34220A202020202020737445
          76743A7768656E3D22323032332D30392D30355431303A34303A34362D30333A
          3030222F3E0A202020203C2F7264663A5365713E0A2020203C2F786D704D4D3A
          486973746F72793E0A20203C2F7264663A4465736372697074696F6E3E0A203C
          2F7264663A5244463E0A3C2F783A786D706D6574613E0A3C3F787061636B6574
          20656E643D2272223F3E34236C04000001816943435073524742204945433631
          3936362D322E31000028917591BB4B034110873F4F836F222862611144AD8C44
          85A08D45C417A8458CE0AB492E974448E2717722622BD80A0AA28DAF42FF026D
          056B415014416CB556B4D170CEE5021131B3CCCEB7BFDD1976674189A4D58C59
          11804CD632C2A321DFECDCBCAFF2856A3C2834531F554D7D727A244249FBBCA7
          CC89B77EA756E973FF5A6D5C335528AB121E5475C3121E139E58B5748777849B
          D454342E7C26DC65C80585EF1C3DE6F2ABC34997BF1D3622E121501A847DC95F
          1CFBC56ACAC808CBCB69CFA457D4C27D9C97D469D99969896DE2AD9884192584
          8F71861922480F033207F1D34BB7AC28911FC8E74FB12CB9AACC3A6B182C9124
          854597A82B525D9398105D939166CDE9FFDFBE9A89BE5EB77A5D083CCFB6FDDE
          0195DB90DBB2EDAF23DBCE1D43F9135C668BF9CB87D0FF21FA56516B3F00EF06
          9C5F15B5D82E5C6C42CBA31E35A279A95C5C4924E0ED14EAE7A0F1066A16DC9E
          15F6397980C8BA7CD535ECED43A79CF72EFE00067367BA6257EA1F0000000970
          48597300000B1300000B1301009A9C180000019349444154388D75D3BF4BD561
          1406F0CF79EFD502512A7010A2498906879014AEB855B311F407B83446B43804
          214153FD012D4DFD09510D2D514957459A723108841A021BC488FBE3FB36DCDB
          F5FAF5EB19DFE779CE73CE79CF0943919B92644C368B79D94510F6D094EC281C
          C4BCE2BF2606E20D13B29BB82F5CC388E3D1917DC6535DEFA2E17090206F98C0
          0A1ED0773D2DB25F78ACE5792C69A5DC94FACE657157F60A6FF067F01A268535
          239621F2A67185B742A3E4F545E18E700E4F84EBA54ABEEA5AAACB66FB3D974B
          3DA3E687B6B69ADA093C4C4B16EB98AF1818CC286C490A61A602AF0B7369F055
          27E3462CB822DC927DABC00353E91431E1F6A019DAA7B08A84BD4A28BB3B9420
          5732F89984263A1584973D0FBFF11EAD12DE55D84E929DFE86955BF894375D55
          7349F65D2E9964BBB2F5BA9603E199E4B230394479283B4448C6717608FBABB0
          1A0DFBBD55FE684CDD8A640DE72B67725C7C4FDB8B58D2393AA60F468D5AC623
          611A7547C796F5567B17AB781D0BBD96A2945DDE7241C7A230872914F8A9B02D
          5B8F86FD61FE3F37507F48CE4807BA0000000049454E44AE426082}
      end
      item
        ImageClass = 'TdxPNGImage'
        Image.Data = {
          89504E470D0A1A0A0000000D49484452000000100000001008060000001FF3FF
          61000004B369545874584D4C3A636F6D2E61646F62652E786D7000000000003C
          3F787061636B657420626567696E3D22EFBBBF222069643D2257354D304D7043
          656869487A7265537A4E54637A6B633964223F3E0A3C783A786D706D65746120
          786D6C6E733A783D2261646F62653A6E733A6D6574612F2220783A786D70746B
          3D22584D5020436F726520352E352E30223E0A203C7264663A52444620786D6C
          6E733A7264663D22687474703A2F2F7777772E77332E6F72672F313939392F30
          322F32322D7264662D73796E7461782D6E7323223E0A20203C7264663A446573
          6372697074696F6E207264663A61626F75743D22220A20202020786D6C6E733A
          657869663D22687474703A2F2F6E732E61646F62652E636F6D2F657869662F31
          2E302F220A20202020786D6C6E733A746966663D22687474703A2F2F6E732E61
          646F62652E636F6D2F746966662F312E302F220A20202020786D6C6E733A7068
          6F746F73686F703D22687474703A2F2F6E732E61646F62652E636F6D2F70686F
          746F73686F702F312E302F220A20202020786D6C6E733A786D703D2268747470
          3A2F2F6E732E61646F62652E636F6D2F7861702F312E302F220A20202020786D
          6C6E733A786D704D4D3D22687474703A2F2F6E732E61646F62652E636F6D2F78
          61702F312E302F6D6D2F220A20202020786D6C6E733A73744576743D22687474
          703A2F2F6E732E61646F62652E636F6D2F7861702F312E302F73547970652F52
          65736F757263654576656E7423220A202020657869663A506978656C5844696D
          656E73696F6E3D223136220A202020657869663A506978656C5944696D656E73
          696F6E3D223136220A202020657869663A436F6C6F7253706163653D2231220A
          202020746966663A496D61676557696474683D223136220A202020746966663A
          496D6167654C656E6774683D223136220A202020746966663A5265736F6C7574
          696F6E556E69743D2232220A202020746966663A585265736F6C7574696F6E3D
          2237322F31220A202020746966663A595265736F6C7574696F6E3D2237322F31
          220A20202070686F746F73686F703A436F6C6F724D6F64653D2233220A202020
          70686F746F73686F703A49434350726F66696C653D2273524742204945433631
          3936362D322E31220A202020786D703A4D6F64696679446174653D2232303233
          2D30392D30355431303A34373A35372D30333A3030220A202020786D703A4D65
          746164617461446174653D22323032332D30392D30355431303A34373A35372D
          30333A3030223E0A2020203C786D704D4D3A486973746F72793E0A202020203C
          7264663A5365713E0A20202020203C7264663A6C690A20202020202073744576
          743A616374696F6E3D2270726F6475636564220A20202020202073744576743A
          736F6674776172654167656E743D22416666696E6974792044657369676E6572
          20312E31302E34220A20202020202073744576743A7768656E3D22323032332D
          30392D30355431303A34373A35372D30333A3030222F3E0A202020203C2F7264
          663A5365713E0A2020203C2F786D704D4D3A486973746F72793E0A20203C2F72
          64663A4465736372697074696F6E3E0A203C2F7264663A5244463E0A3C2F783A
          786D706D6574613E0A3C3F787061636B657420656E643D2272223F3EE6864C91
          0000018169434350735247422049454336313936362D322E31000028917591BB
          4B034110873F4F836F222862611144AD8C4485A08D45C417A8458CE0AB492E97
          4448E2717722622BD80A0AA28DAF42FF026D056B415014416CB556B4D170CEE5
          021131B3CCCEB7BFDD1976674189A4D58C5911804CD632C2A321DFECDCBCAFF2
          856A3C2834531F554D7D727A244249FBBCA7CC89B77EA756E973FF5A6D5C3355
          28AB121E5475C3121E139E58B5748777849BD454342E7C26DC65C80585EF1C3D
          E6F2ABC34997BF1D3622E121501A847DC95F1CFBC56ACAC808CBCB69CFA457D4
          C27D9C97D469D99969896DE2AD98841925848F71861922480F033207F1D34BB7
          AC28911FC8E74FB12CB9AACC3A6B182C9124854597A82B525D9398105D939166
          CDE9FFDFBE9A89BE5EB77A5D083CCFB6FDDE0195DB90DBB2EDAF23DBCE1D43F9
          135C668BF9CB87D0FF21FA56516B3F00EF069C5F15B5D82E5C6C42CBA31E35A2
          79A95C5C4924E0ED14EAE7A0F1066A16DC9E15F6397980C8BA7CD535ECED43A7
          9CF72EFE00067367BA6257EA1F000000097048597300000B1300000B1301009A
          9C180000014A49444154388DBDD32168965114C6F1DFF76E6D1645616149304C
          D4661A9A162ECE203A61E10EA3454C82418B039B65B2A298E669DA64F2064187
          61618321080B6641071A8622827386F70E3E2EAF65824F3CDCFF739E7BEEB9FC
          A3067521B7790C37701193F8854DBCC662A4F899DB7C0E8F707350C1E7F11CC7
          FED2F00396701F8770AF1982A7F0B2C0EF701727315ED2ACE304160B0C460BDC
          E031C64AD4E948F17BA8F34A6EF377BCC2C870A4FD04974AB72F98AF60B9CDA7
          B152C3C3065FF119D722C5C79EBB1FD53370BCEFA9FD670D729B67F1ACAAFFC0
          8548F1A606729B67F0047391627514A77A8C777533A9E1092CE388F2944D7DA8
          C0339162AB821B3C2DF0A66E67BA3DA8348207B9CD0BD8C0615CC1559CC10EAE
          478ABDDAE01BEEE8FEC159BCE831FF84CB91627DBFD0E02DB674437B58BADC46
          5BE6B08D55DCC2F148B1D6637C70FD01A2DF5B6D0C42C91D0000000049454E44
          AE426082}
      end
      item
        ImageClass = 'TdxPNGImage'
        Image.Data = {
          89504E470D0A1A0A0000000D49484452000000100000001008060000001FF3FF
          610000054169545874584D4C3A636F6D2E61646F62652E786D7000000000003C
          3F787061636B657420626567696E3D22EFBBBF222069643D2257354D304D7043
          656869487A7265537A4E54637A6B633964223F3E0A3C783A786D706D65746120
          786D6C6E733A783D2261646F62653A6E733A6D6574612F2220783A786D70746B
          3D22584D5020436F726520352E352E30223E0A203C7264663A52444620786D6C
          6E733A7264663D22687474703A2F2F7777772E77332E6F72672F313939392F30
          322F32322D7264662D73796E7461782D6E7323223E0A20203C7264663A446573
          6372697074696F6E207264663A61626F75743D22220A20202020786D6C6E733A
          657869663D22687474703A2F2F6E732E61646F62652E636F6D2F657869662F31
          2E302F220A20202020786D6C6E733A70686F746F73686F703D22687474703A2F
          2F6E732E61646F62652E636F6D2F70686F746F73686F702F312E302F220A2020
          2020786D6C6E733A746966663D22687474703A2F2F6E732E61646F62652E636F
          6D2F746966662F312E302F220A20202020786D6C6E733A786D703D2268747470
          3A2F2F6E732E61646F62652E636F6D2F7861702F312E302F220A20202020786D
          6C6E733A786D704D4D3D22687474703A2F2F6E732E61646F62652E636F6D2F78
          61702F312E302F6D6D2F220A20202020786D6C6E733A73744576743D22687474
          703A2F2F6E732E61646F62652E636F6D2F7861702F312E302F73547970652F52
          65736F757263654576656E7423220A202020657869663A436F6C6F7253706163
          653D2231220A202020657869663A506978656C5844696D656E73696F6E3D2231
          36220A202020657869663A506978656C5944696D656E73696F6E3D223136220A
          20202070686F746F73686F703A436F6C6F724D6F64653D2233220A2020207068
          6F746F73686F703A49434350726F66696C653D22735247422049454336313936
          362D322E31220A202020746966663A496D6167654C656E6774683D223136220A
          202020746966663A496D61676557696474683D223136220A202020746966663A
          5265736F6C7574696F6E556E69743D2232220A202020746966663A585265736F
          6C7574696F6E3D2237322F31220A202020746966663A595265736F6C7574696F
          6E3D2237322F31220A202020786D703A4D65746164617461446174653D223230
          32332D30392D30355431313A33333A33322D30333A3030220A202020786D703A
          4D6F64696679446174653D22323032332D30392D30355431313A33333A33322D
          30333A3030223E0A2020203C786D704D4D3A486973746F72793E0A202020203C
          7264663A5365713E0A20202020203C7264663A6C690A202020202020786D704D
          4D3A616374696F6E3D2270726F6475636564220A202020202020786D704D4D3A
          736F6674776172654167656E743D22416666696E6974792044657369676E6572
          20312E372E33220A202020202020786D704D4D3A7768656E3D22323032312D31
          302D30385431313A34363A31322D30333A3030222F3E0A20202020203C726466
          3A6C690A20202020202073744576743A616374696F6E3D2270726F6475636564
          220A20202020202073744576743A736F6674776172654167656E743D22416666
          696E6974792044657369676E657220312E31302E34220A202020202020737445
          76743A7768656E3D22323032332D30392D30355431313A33333A33322D30333A
          3030222F3E0A202020203C2F7264663A5365713E0A2020203C2F786D704D4D3A
          486973746F72793E0A20203C2F7264663A4465736372697074696F6E3E0A203C
          2F7264663A5244463E0A3C2F783A786D706D6574613E0A3C3F787061636B6574
          20656E643D2272223F3E1258DA31000001816943435073524742204945433631
          3936362D322E31000028917591BB4B034110873F4F836F222862611144AD8C44
          85A08D45C417A8458CE0AB492E974448E2717722622BD80A0AA28DAF42FF026D
          056B415014416CB556B4D170CEE5021131B3CCCEB7BFDD1976674189A4D58C59
          11804CD632C2A321DFECDCBCAFF2856A3C2834531F554D7D727A244249FBBCA7
          CC89B77EA756E973FF5A6D5C335528AB121E5475C3121E139E58B5748777849B
          D454342E7C26DC65C80585EF1C3DE6F2ABC34997BF1D3622E121501A847DC95F
          1CFBC56ACAC808CBCB69CFA457D4C27D9C97D469D99969896DE2AD9884192584
          8F71861922480F033207F1D34BB7AC28911FC8E74FB12CB9AACC3A6B182C9124
          854597A82B525D9398105D939166CDE9FFDFBE9A89BE5EB77A5D083CCFB6FDDE
          0195DB90DBB2EDAF23DBCE1D43F9135C668BF9CB87D0FF21FA56516B3F00EF06
          9C5F15B5D82E5C6C42CBA31E35A279A95C5C4924E0ED14EAE7A0F1066A16DC9E
          15F6397980C8BA7CD535ECED43A79CF72EFE00067367BA6257EA1F0000000970
          48597300000B1300000B1301009A9C18000001E249444154388D7D92CF4B9451
          18859FF37ED70AC7C68834245D6508C9B4917ED0D422080DDAB4696AD5A245DB
          8836EE245C867F407F41514CBB34D365881248B4C821DCB99008145221FCE6BB
          6F8B196566FAEC6CEEE2B9E7BCF7DC7B458B6A1315639F820595A2710569101C
          D00691158BACA549BA333A5F8D071EB5988B48E38267C82E035DADE13875C797
          9D3813A32F8C7E7AB77718D0343F96EC3930C87FE5BF62F4E9746FF7D5A5CF1F
          F6436DA26248E339E66DE00710701F42EA6F1EBACF4C2FBABA7B7E026F55BB55
          39A9E3FA88EC7AFB209F439AC2BD083C41AAB463FFEEF5ECA65950A9D9B9A332
          BB2373AFBF10F90A6C757249C31654B64C7EF59F0B6BA8D858620274E7F0E068
          CC64762EFFB2E86D8C22010A395CA081D07CE7BC8033B53B0F86DD7556D077C4
          9018401B47C07EE0117002389FC35DB0191459C1A823423B6629B2FFD2084527
          19123CEC08C8DCE3AA59640D7C39A7A1F1BB9E663146357AB6E7BBAFA759B614
          D224DD3192196123A0C3AE92CA496FE1BD8390AE75B8FF08264B8BD52DBB385F
          8D59F485187D1A7CBB655B016942D23870AAD58CFB5373661B076DEADB8DBBC7
          BABA7BEEC934256918082DDC1B9D7D5D3069CEEC85F937F5B68003ADDDBE7FDA
          82CA8EC6400340146CBAC7D534CB964A8BD5B65FF9179243B7212AEFEA760000
          000049454E44AE426082}
      end>
  end
  object dxComponentPrinter1: TdxComponentPrinter
    CurrentLink = dxComponentPrinter1Link1
    PreviewOptions.ShowExplorer = True
    PreviewOptions.Caption = 'Relat'#243'rio de movimenta'#231#227'o de estoque'
    PreviewOptions.WindowState = wsMaximized
    PrintTitle = 'Relat'#243'rio de movimenta'#231#227'o de estoque'
    Version = 0
    Left = 624
    Top = 304
    PixelsPerInch = 96
    object dxComponentPrinter1Link1: TdxGridReportLink
      PageNumberFormat = pnfNumeral
      PrinterPage.DMPaper = 1
      PrinterPage.Footer = 5080
      PrinterPage.GrayShading = True
      PrinterPage.Header = 5080
      PrinterPage.Margins.Bottom = 12700
      PrinterPage.Margins.Left = 12700
      PrinterPage.Margins.Right = 12700
      PrinterPage.Margins.Top = 12700
      PrinterPage.Orientation = poLandscape
      PrinterPage.PageSize.X = 215900
      PrinterPage.PageSize.Y = 279400
      PrinterPage._dxMeasurementUnits_ = 0
      PrinterPage._dxLastMU_ = 2
      ReportDocument.CreationDate = 44511.411404236110000000
      TimeFormat = 0
      PixelsPerInch = 96
      BuiltInReportLink = True
    end
  end
  object popDetalhamento: TPopupMenu
    Left = 484
    Top = 346
    object Imprimirdetalhamentoderecebimentos1: TMenuItem
      Caption = 'Imprimir detalhamento de recebimentos'
      OnClick = Imprimirdetalhamentoderecebimentos1Click
    end
    object VisualizardaNFe1: TMenuItem
      Caption = 'Visualizar a NF-e'
      OnClick = VisualizardaNFe1Click
    end
    object Detalhamentodavenda1: TMenuItem
      Caption = 'Detalhamento da venda'
      OnClick = Detalhamentodavenda1Click
    end
  end
end
