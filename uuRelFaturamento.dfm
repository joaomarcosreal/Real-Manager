inherited frmRelatorioFaturamentoDiarioPeriodoAnalitico: TfrmRelatorioFaturamentoDiarioPeriodoAnalitico
  Left = 402
  Top = 321
  ClientHeight = 456
  ClientWidth = 551
  ExplicitWidth = 563
  ExplicitHeight = 494
  TextHeight = 13
  inherited botao_pesquisa: TSpeedButton
    Top = -39
    ExplicitTop = -39
  end
  object SpeedButton1: TSpeedButton [1]
    Left = 142
    Top = -42
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
    Left = 142
    Top = 19
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
  object SpeedButton3: TSpeedButton [3]
    Left = 94
    Top = -13
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
    Top = -34
    ExplicitTop = -34
  end
  object Edit2: TEdit [5]
    Left = 16
    Top = -37
    Width = 121
    Height = 21
    TabOrder = 6
    Text = 'Edit1'
    Visible = False
    OnChange = Edit1Change
    OnEnter = Edit1Enter
    OnExit = Edit1Exit
    OnKeyDown = Edit1KeyDown
  end
  object Edit3: TEdit [6]
    Left = 16
    Top = 24
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
  object Edit4: TEdit [7]
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
  object Panel1: TPanel [8]
    Left = 0
    Top = 58
    Width = 551
    Height = 336
    Align = alClient
    Color = clWhite
    ParentBackground = False
    TabOrder = 3
    ExplicitWidth = 547
    ExplicitHeight = 350
    object Panel2: TPanel
      Left = 3
      Top = 166
      Width = 542
      Height = 163
      BevelOuter = bvNone
      Color = clWhite
      ParentBackground = False
      TabOrder = 0
      object GroupBox1: TGroupBox
        Left = 1
        Top = 92
        Width = 541
        Height = 57
        Caption = 'Forma de recebimento'
        Color = clWhite
        ParentBackground = False
        ParentColor = False
        TabOrder = 0
        object cbFormasPagamento: TcxCheckComboBox
          Left = 3
          Top = 18
          ParentFont = False
          Properties.EmptySelectionText = 'Nenhuma forma de recebimento selecionada'
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
          Style.IsFontAssigned = True
          TabOrder = 0
          Width = 523
        end
      end
      object GroupBox3: TGroupBox
        Left = 4
        Top = 4
        Width = 216
        Height = 78
        Caption = 'Tipo do documento'
        TabOrder = 1
        object ckbTodos: TCheckBox
          Left = 8
          Top = 24
          Width = 65
          Height = 17
          Caption = 'Todos'
          Checked = True
          State = cbChecked
          TabOrder = 0
          OnClick = ckbTodosClick
        end
        object ckbECF: TCheckBox
          Left = 8
          Top = 39
          Width = 104
          Height = 17
          Caption = 'Cupo fiscal (ECF)'
          Checked = True
          State = cbChecked
          TabOrder = 1
        end
        object ckbNFCE: TCheckBox
          Left = 8
          Top = 54
          Width = 104
          Height = 17
          Caption = 'NFC-e'
          Checked = True
          State = cbChecked
          TabOrder = 2
        end
        object ckbNFE: TCheckBox
          Left = 118
          Top = 24
          Width = 75
          Height = 17
          Caption = 'NF-e'
          Checked = True
          State = cbChecked
          TabOrder = 3
        end
        object ckbSAT: TCheckBox
          Left = 118
          Top = 39
          Width = 75
          Height = 17
          Caption = 'SAT'
          Checked = True
          State = cbChecked
          TabOrder = 4
        end
        object ckbAvulso: TCheckBox
          Left = 118
          Top = 54
          Width = 75
          Height = 17
          Caption = 'Avulso'
          Checked = True
          State = cbChecked
          TabOrder = 5
        end
      end
      object rdgTipoVenda: TRadioGroup
        Left = 226
        Top = 4
        Width = 143
        Height = 78
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
        TabOrder = 2
      end
    end
    object GroupBox2: TGroupBox
      Left = 3
      Top = 22
      Width = 541
      Height = 52
      Caption = 'Empresa'
      Color = clWhite
      ParentBackground = False
      ParentColor = False
      TabOrder = 1
      object cbEmpresas: TcxCheckComboBox
        Left = 4
        Top = 16
        ParentFont = False
        Properties.EmptySelectionText = 'Nenhuma empresa selecionada'
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
        Width = 526
      end
    end
    object RadioGroup1: TRadioGroup
      Left = 4
      Top = 76
      Width = 325
      Height = 80
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
      TabOrder = 2
    end
    object Panel3: TPanel
      Left = 0
      Top = 102
      Width = 285
      Height = 50
      BevelOuter = bvNone
      Color = clWhite
      ParentBackground = False
      TabOrder = 3
      object Label2: TLabel
        Left = 12
        Top = 0
        Width = 25
        Height = 16
        Caption = 'De:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label1: TLabel
        Left = 147
        Top = -7
        Width = 24
        Height = 16
        Caption = 'At'#233
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object ed_data_inicial: TAdvDateTimePicker
        Left = 13
        Top = 15
        Width = 129
        Height = 33
        Date = 43537.000000000000000000
        Format = ''
        Time = 0.668379629627452200
        DoubleBuffered = True
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'Segoe UI'
        Font.Style = []
        Kind = dkDate
        ParentDoubleBuffered = False
        ParentFont = False
        TabOrder = 0
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
        Left = 148
        Top = 15
        Width = 136
        Height = 33
        Date = 43537.000000000000000000
        Format = ''
        Time = 0.669004629628034300
        DoubleBuffered = True
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'Segoe UI'
        Font.Style = []
        Kind = dkDate
        ParentDoubleBuffered = False
        ParentFont = False
        TabOrder = 1
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
    object rdTipoRelatorio: TRadioGroup
      Left = 335
      Top = 80
      Width = 209
      Height = 76
      Caption = 'Tipo do relat'#243'rio'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ItemIndex = 0
      Items.Strings = (
        'Resumido'
        'Detalhado (Dia a dia)')
      ParentFont = False
      TabOrder = 4
    end
  end
  object pnTitulo: TPanel [9]
    Tag = 99
    Left = 0
    Top = 0
    Width = 551
    Height = 58
    Align = alTop
    Color = 12615680
    ParentBackground = False
    TabOrder = 4
    ExplicitWidth = 547
    object lbTitulo: TLabel
      Left = 4
      Top = 15
      Width = 549
      Height = 39
      AutoSize = False
      Caption = 'Faturamento por forma de recebimento'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -27
      Font.Name = 'Calibri'
      Font.Style = [fsBold]
      ParentFont = False
    end
  end
  object TPanel [10]
    Left = 0
    Top = 394
    Width = 551
    Height = 62
    Align = alBottom
    Color = clWhite
    ParentBackground = False
    TabOrder = 5
    ExplicitTop = 408
    ExplicitWidth = 547
    DesignSize = (
      551
      62)
    object btSair: TAdvGlassButton
      Left = 401
      Top = 5
      Width = 135
      Height = 57
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
      OnClick = btSairClick
      ExplicitLeft = 397
    end
    object btSelecionar: TAdvGlassButton
      Left = 264
      Top = 5
      Width = 135
      Height = 57
      Anchors = [akTop, akRight, akBottom]
      BackColor = 12615680
      ButtonDirection = bdLeft
      Caption = 'Imprimir'
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
        89504E470D0A1A0A0000000D4948445200000018000000180806000000E0773D
        F8000000097048597300000B1300000B1301009A9C1800000113494441544889
        D595414EC33010459F5DB30F5BEEC011AA04C435D8C1095851A9C2AC10886370
        0E9AA81577E002EC10ECAB66BAB144C0B163438AD4BF9C19FD6F7DFB8F61C750
        C18E5DD82C267BD23B6F22DA375902D02BA03349B2B1FF02062B1AD55C21CC80
        02E436746183B00BEBEEEE13B883F2D138F287F1CE0C4001DC43837627DF15AE
        8D53F361AB7046D251286C2DDF6BAA81B6FE1D9FAE40CA6EA5276852822AFD7A
        0AC4ABEC7F0EFE21681E46095A4CA03B9C431E5ED74B60EAB74659D72BC3A4BD
        64A39F8123BF9F60578F2D0E6F4CDA0BC3FCF415FB728C5A9F23ED21507FCDE8
        6AD82A5D75DE7F0D024A7F70B07E6276F61EF9327F267C0081D512F932E18F16
        A508E85C8B720552F652DCC92D067752EDA18C787C0000000049454E44AE4260
        82}
      ParentFont = False
      ShineColor = clWhite
      TabOrder = 1
      Version = '1.3.3.1'
      OnClick = btSelecionarClick
      ExplicitLeft = 260
    end
  end
  inherited cliques: TActionList
    Left = 344
    Top = 72
  end
  inherited popMenuExportacaoGrid: TPopupMenu
    Left = 153
    Top = 75
  end
end
