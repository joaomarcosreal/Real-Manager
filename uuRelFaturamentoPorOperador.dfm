inherited frmRelFaturamentoPorOperador: TfrmRelFaturamentoPorOperador
  BorderIcons = [biSystemMenu]
  ClientHeight = 309
  ClientWidth = 511
  ExplicitWidth = 527
  ExplicitHeight = 348
  TextHeight = 13
  inherited botao_pesquisa: TSpeedButton
    Left = 136
    Top = -41
    ExplicitLeft = 136
    ExplicitTop = -41
  end
  inherited Edit1: TEdit
    Left = 9
    Top = -41
    ExplicitLeft = 9
    ExplicitTop = -41
  end
  object pnTitulo: TPanel [2]
    Tag = 99
    Left = 0
    Top = 0
    Width = 511
    Height = 59
    Align = alTop
    Color = 12615680
    ParentBackground = False
    TabOrder = 3
    object lbTitulo: TLabel
      Left = 5
      Top = 17
      Width = 300
      Height = 39
      AutoSize = False
      Caption = 'Faturamento por operador'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -27
      Font.Name = 'Calibri'
      Font.Style = [fsBold]
      ParentFont = False
    end
  end
  object Panel2: TPanel [3]
    Left = 0
    Top = 59
    Width = 511
    Height = 202
    Align = alClient
    BevelOuter = bvNone
    Color = clWhite
    ParentBackground = False
    TabOrder = 1
    object Label1: TLabel
      Left = 11
      Top = 124
      Width = 205
      Height = 20
      Caption = 'Selecione os operadores:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label2: TLabel
      Left = 12
      Top = 63
      Width = 277
      Height = 20
      Caption = 'Selecione os tipos de recebimento'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Panel3: TPanel
      Left = 1
      Top = 7
      Width = 285
      Height = 50
      BevelOuter = bvNone
      Color = clWhite
      ParentBackground = False
      TabOrder = 0
      object Label3: TLabel
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
      object Label4: TLabel
        Left = 149
        Top = 0
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
      Left = 309
      Top = 14
      Width = 185
      Height = 53
      ItemIndex = 0
      Items.Strings = (
        'Linear (Por data)'
        'Agrupado por operador')
      TabOrder = 1
    end
    object cbFormasPagamento: TcxCheckComboBox
      Left = 7
      Top = 83
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
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -19
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = []
      Style.IsFontAssigned = True
      TabOrder = 2
      Width = 488
    end
    object cbOperadores: TcxCheckComboBox
      Left = 6
      Top = 144
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
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -19
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = []
      Style.IsFontAssigned = True
      TabOrder = 3
      Width = 490
    end
  end
  object Panel1: TPanel [4]
    Left = 0
    Top = 261
    Width = 511
    Height = 48
    Align = alBottom
    BevelOuter = bvNone
    Color = clWhite
    ParentBackground = False
    TabOrder = 2
    DesignSize = (
      511
      48)
    object btSelecionar: TAdvGlassButton
      Left = 229
      Top = 0
      Width = 135
      Height = 46
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
      TabOrder = 0
      Version = '1.3.3.1'
      OnClick = btSelecionarClick
    end
    object btSair: TAdvGlassButton
      Left = 366
      Top = 0
      Width = 135
      Height = 46
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
  inherited cliques: TActionList
    Left = 427
    Top = 22
  end
  inherited actlBusca: TJvControlActionList
    Left = 391
    Top = 22
  end
  object FDMemTable1: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 474
    Top = 83
  end
end
