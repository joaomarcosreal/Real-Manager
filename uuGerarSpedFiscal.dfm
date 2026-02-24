inherited FrmGerarSpedFiscal: TFrmGerarSpedFiscal
  Left = 2
  Top = 1
  Caption = 'Gera'#231#227'o SPED - Escritura'#231#227'o Fiscal Digital'
  ClientHeight = 333
  ClientWidth = 581
  ExplicitWidth = 593
  ExplicitHeight = 371
  TextHeight = 13
  inherited botao_pesquisa: TSpeedButton
    Top = -38
    ExplicitTop = -38
  end
  inherited Edit1: TEdit
    Top = -33
    ExplicitTop = -33
  end
  object pnTitulo: TPanel [2]
    Tag = 99
    Left = 0
    Top = 0
    Width = 581
    Height = 65
    Align = alTop
    Color = 12615680
    ParentBackground = False
    TabOrder = 1
    StyleElements = []
    ExplicitWidth = 577
    object lbTitulo: TLabel
      Left = 8
      Top = 20
      Width = 656
      Height = 42
      AutoSize = False
      Caption = 'SPED Fiscal - Gera'#231#227'o do arquivo da EFD. (ICMS)'
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
    Top = 65
    Width = 581
    Height = 268
    ActivePage = pgPrincipal
    PropagateEnable = False
    Align = alClient
    ExplicitWidth = 577
    ExplicitHeight = 267
    object pgPrincipal: TJvStandardPage
      Left = 0
      Top = 0
      Width = 581
      Height = 268
      Caption = 'pgPrincipal'
      ExplicitWidth = 577
      ExplicitHeight = 267
      object Panel2: TPanel
        Left = 0
        Top = 0
        Width = 581
        Height = 268
        Align = alClient
        Color = clWhite
        ParentBackground = False
        TabOrder = 0
        StyleElements = []
        ExplicitWidth = 577
        ExplicitHeight = 267
        object lbl1: TLabel
          Left = 154
          Top = 112
          Width = 148
          Height = 16
          Caption = 'Vencimento do ICMS:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          Visible = False
          StyleElements = []
        end
        object GroupBox1: TGroupBox
          Left = 1
          Top = 16
          Width = 384
          Height = 70
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 0
          object Label1: TLabel
            Left = 8
            Top = 9
            Width = 147
            Height = 16
            Caption = 'Selecione m'#234's e ano'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            StyleElements = []
          end
          object Label2: TLabel
            Left = 230
            Top = 14
            Width = 129
            Height = 16
            Caption = 'Vers'#227'o do arquivo'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            StyleElements = []
          end
          object cbMes: TComboBox
            Left = 7
            Top = 34
            Width = 128
            Height = 28
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -16
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ItemIndex = 0
            ParentFont = False
            TabOrder = 0
            Text = 'Janeiro'
            Items.Strings = (
              'Janeiro'
              'Fevereiro'
              'Mar'#231'o'
              'Abril'
              'Maio'
              'Junho'
              'Julho'
              'Agosto'
              'Setembro'
              'Outubro'
              'Novembro'
              'Dezembro')
          end
          object cbAno: TComboBox
            Left = 141
            Top = 34
            Width = 83
            Height = 28
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -16
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ItemIndex = 0
            ParentFont = False
            TabOrder = 1
            Text = '2017'
            Items.Strings = (
              '2017')
          end
          object cbVersaoArquivo: TComboBox
            Left = 230
            Top = 36
            Width = 138
            Height = 24
            TabOrder = 2
            Text = 'Versao 1.02'
            Items.Strings = (
              'Versao 1.02'
              'Versao 1.03'
              'Versao 1.04'
              'Versao 1.05'
              'Versao 1.06'
              'Versao 1.07'
              'Versao 1.08'
              'Versao 1.09'
              'Versao 1.10'
              'Versao 1.11'
              'Versao 1.12'
              'Vers'#227'o 1.13'
              'Vers'#227'o 1.14'
              'Vers'#227'o 1.15'
              'Vers'#227'o 1.16'
              'Vers'#227'o 1.17'
              'Vers'#227'o 1.18')
          end
        end
        object ckbGerarInventario: TCheckBox
          Left = 318
          Top = 125
          Width = 105
          Height = 17
          Caption = 'Gerar Invent'#225'rio'
          TabOrder = 1
        end
        object rdTipoGeracao: TRadioGroup
          Left = 3
          Top = 92
          Width = 145
          Height = 71
          ItemIndex = 0
          Items.Strings = (
            'Tudo'
            'Apenas Entradas'
            'Apenas Sa'#237'das')
          TabOrder = 2
        end
        object ckb495: TCheckBox
          Left = 318
          Top = 148
          Width = 85
          Height = 17
          Caption = 'Gerar C495'
          TabOrder = 3
        end
        object edDataVencimento: TDateEdit
          Left = 154
          Top = 132
          Width = 149
          Height = 28
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          NumGlyphs = 2
          ParentFont = False
          TabOrder = 4
          Visible = False
          OnKeyDown = Edit1KeyDown
        end
        object ckbSintegra: TCheckBox
          Left = 318
          Top = 102
          Width = 97
          Height = 17
          Caption = 'ckbSintegra'
          TabOrder = 5
          Visible = False
        end
        object edDataInicial: TJvDateEdit
          Left = 579
          Top = -44
          Width = 73
          Height = 21
          ShowNullDate = False
          TabOrder = 6
          Visible = False
        end
        object edDataFinal: TJvDateEdit
          Left = 579
          Top = -17
          Width = 73
          Height = 21
          ShowNullDate = False
          TabOrder = 7
          Visible = False
        end
        object Panel3: TPanel
          Left = 1
          Top = 196
          Width = 579
          Height = 71
          Align = alBottom
          BevelOuter = bvNone
          Color = clWhite
          ParentBackground = False
          TabOrder = 8
          StyleElements = []
          ExplicitTop = 195
          ExplicitWidth = 575
          DesignSize = (
            579
            71)
          object AdvGlassButton1: TAdvGlassButton
            Left = 298
            Top = 0
            Width = 123
            Height = 69
            Anchors = [akTop, akRight, akBottom]
            BackColor = 12615680
            ButtonDirection = bdLeft
            Caption = 'Gerar arquivo'
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
            Layout = blGlyphTop
            OuterBorderColor = clWhite
            Picture.Data = {
              89504E470D0A1A0A0000000D49484452000000180000001B080600000066E34F
              56000004B269545874584D4C3A636F6D2E61646F62652E786D7000000000003C
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
              656E73696F6E3D223234220A202020657869663A506978656C5944696D656E73
              696F6E3D223237220A202020657869663A436F6C6F7253706163653D2231220A
              202020746966663A496D61676557696474683D223234220A202020746966663A
              496D6167654C656E6774683D223237220A202020746966663A5265736F6C7574
              696F6E556E69743D2232220A202020746966663A585265736F6C7574696F6E3D
              2237322E30220A202020746966663A595265736F6C7574696F6E3D2237322E30
              220A20202070686F746F73686F703A436F6C6F724D6F64653D2233220A202020
              70686F746F73686F703A49434350726F66696C653D2273524742204945433631
              3936362D322E31220A202020786D703A4D6F64696679446174653D2232303231
              2D30392D31365431313A30363A31332D30333A3030220A202020786D703A4D65
              746164617461446174653D22323032312D30392D31365431313A30363A31332D
              30333A3030223E0A2020203C786D704D4D3A486973746F72793E0A202020203C
              7264663A5365713E0A20202020203C7264663A6C690A20202020202073744576
              743A616374696F6E3D2270726F6475636564220A20202020202073744576743A
              736F6674776172654167656E743D22416666696E6974792044657369676E6572
              20312E372E33220A20202020202073744576743A7768656E3D22323032312D30
              392D31365431313A30363A31332D30333A3030222F3E0A202020203C2F726466
              3A5365713E0A2020203C2F786D704D4D3A486973746F72793E0A20203C2F7264
              663A4465736372697074696F6E3E0A203C2F7264663A5244463E0A3C2F783A78
              6D706D6574613E0A3C3F787061636B657420656E643D2272223F3E06B9109F00
              00018169434350735247422049454336313936362D322E31000028917591CF2B
              445114C73F6646E3C7608A8585C524AC10A3C4C66226BF0A8B9951069B37CF7B
              336ADE78BD37926C95ADA2C4C6AF057F015B65AD1491929DB22636E839CFA891
              CCB99D7B3EF77BEF39DD7B2E781259D5B07D5D60E4F2566C38129A4A4E87FC8F
              5412A4161F4145B5CDF1F8508292F67643991BAF3ADC5AA5CFFD6BD5739AAD42
              5985F0806A5A79E111E1B1A5BCE9F2A670839A51E6848F85DB2DB9A0F0B5ABA7
              0AFCE472BAC01F2E5B8958143C41E150FA17A77EB19AB10C6179392D467651FD
              B98FFB9280969B8C4B6C166FC226C63011428C3248945EBAE997B9970EC274CA
              8A12F95DDFF9132C48AE2AB3C93216F3A4C990A75DD445A9AE49D445D7646459
              76FBFFB7AFB6DE132E540F44A0FCC1715E5AC1BF019FEB8EF3BEEF389F07E0BD
              87B35C317F610FFA5E455F2F6A2DBB50B70A27E7452DB505A76BD078672A96F2
              2D79C53DBA0ECF47509384FA4BA89A29F4EC679FC35B48ACC8575DC0F60EB4C9
              F9BAD92F13D367C07D6E00C3000000097048597300000B1300000B1301009A9C
              180000016C494441544889B5D6B16A155110C6F15FC426626117F30CA903D122
              9C2A858279048985A5A855048B91108295112C3568F2086A50B1D84A89692420
              4AB4D770ABC410300163B15C5CD6EBCDEEBDBB5F39F39DF99F993D0B3322B2F3
              78828BD8C27D91D635A41191BDC4A5527C1DB744DA6E027080D11EB9233CC482
              487BC3008E4FF0ECE00E9E8A7492F71F9DAAE019C30A364436D506A0AB49BC13
              D9AAC8C6AB1EAA32A25EDAC7221E88F4AB9FB14E07459DC5123E896CB69F71D0
              0ECA7A839B227D2E2706EDA0AC196C896C5964E78A89A63A28AA83BB782CD2EF
              36005D6DE2725323EAA5493C6B130017DA06BC6F13B089AB6D003AB88E29913A
              A71B2C7C8447B827D26E37D814E0B5FC4FFE524E0C0BF886DB223DFF9F61D06F
              B08F794CF42B4EFD0E8EB1867991BE57395007F0013744DAA873A32A23FA8139
              F9B3AB559CBC83039CE9913BF477ABF859B77011F016574AF117F2D7F175D0C2
              45C035F9D6308D8FF2CDEED5B085BBFA03C607619796525FE40000000049454E
              44AE426082}
            ParentFont = False
            ShineColor = clWhite
            TabOrder = 0
            Version = '1.3.3.1'
            OnClick = btSelecionarClick
            ExplicitLeft = 294
          end
          object AdvGlassButton2: TAdvGlassButton
            Left = 427
            Top = 0
            Width = 123
            Height = 69
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
            Layout = blGlyphTop
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
            ExplicitLeft = 423
          end
        end
      end
    end
    object pgAguarde: TJvStandardPage
      Left = 0
      Top = 0
      Width = 581
      Height = 268
      Caption = 'pgAguarde'
      object Panel1: TPanel
        Left = 0
        Top = 0
        Width = 581
        Height = 268
        Align = alClient
        BevelOuter = bvNone
        Color = clWhite
        ParentBackground = False
        TabOrder = 0
        StyleElements = []
        object lbAguarde: TLabel
          Left = 4
          Top = 93
          Width = 239
          Height = 16
          Caption = 'Progresso de gera'#231#227'o do arquivo:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 12615680
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          StyleElements = []
        end
        object Label3: TLabel
          Left = 28
          Top = 37
          Width = 508
          Height = 29
          Caption = 'Arquivo sendo gerado. Por favor aguarde....'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 12615680
          Font.Height = -24
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          StyleElements = []
        end
        object pgArquivo: TProgressBar
          Left = 4
          Top = 112
          Width = 570
          Height = 33
          Max = 0
          Step = 1
          TabOrder = 0
        end
      end
    end
  end
  object sped: TACBrSPEDFiscal
    Path = 'C:\RESTAURANTE\SPED\'
    Arquivo = 'sped.txt'
    Delimitador = '|'
    ReplaceDelimitador = False
    TrimString = True
    CurMascara = '#0.00'
    Left = 625
    Top = 178
  end
  object sv: TSaveDialog
    FileName = 'sped.txt'
    Left = 672
    Top = 58
  end
  object Timer1: TTimer
    Enabled = False
    Interval = 500
    Left = 68
    Top = 265
  end
  object Timer2: TTimer
    Enabled = False
    Interval = 500
    Left = 83
    Top = 287
  end
  object Timer3: TTimer
    Enabled = False
    Interval = 500
    Left = 113
    Top = 306
  end
  object tmAguarde: TTimer
    Enabled = False
    Interval = 100
    Left = 213
    Top = 251
  end
  object sintegra: TACBrSintegra
    VersaoValidador = vv524
    Informa88SME = False
    Informa88SMS = False
    Informa88EAN = False
    Informa88C = False
    InformaSapiMG = False
    Left = 714
    Top = 60
  end
  object folderDialog: TJvBrowseForFolderDialog
    RootDirectory = fdDesktop
    Title = 'Seleciona a pasta que deseja salvar o arquivo'
    StatusText = 'Certifique-se de escolher uma pasta de f'#225'cil acesso.'
    Left = 429
    Top = 201
  end
end
