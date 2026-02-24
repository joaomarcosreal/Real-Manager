inherited frmRelatorioBaixasManuais: TfrmRelatorioBaixasManuais
  Left = 259
  Top = 214
  Caption = 'Relat'#243'rio de baixas manuais'
  ClientHeight = 622
  ClientWidth = 1229
  OnDestroy = FormDestroy
  ExplicitWidth = 1241
  ExplicitHeight = 660
  TextHeight = 13
  inherited botao_pesquisa: TSpeedButton
    Left = 118
    Top = -27
    ExplicitLeft = 118
    ExplicitTop = -27
  end
  inherited Edit1: TEdit
    Left = -8
    Top = -24
    ExplicitLeft = -8
    ExplicitTop = -24
  end
  object Panel10: TPanel [2]
    Tag = 99
    Left = 0
    Top = 0
    Width = 1229
    Height = 58
    Align = alTop
    BevelOuter = bvNone
    Color = 12615680
    ParentBackground = False
    TabOrder = 1
    ExplicitWidth = 1225
    object Label9: TLabel
      Left = 8
      Top = 13
      Width = 515
      Height = 39
      AutoSize = False
      Caption = 'Relat'#243'rio de movimenta'#231#245'es de estoque'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -24
      Font.Name = 'Calibri'
      Font.Style = [fsBold]
      ParentFont = False
    end
  end
  object Panel4: TPanel [3]
    Left = 0
    Top = 145
    Width = 1229
    Height = 407
    Align = alClient
    Color = clWhite
    ParentBackground = False
    TabOrder = 2
    ExplicitWidth = 1225
    ExplicitHeight = 406
    object gdProdutosMovimentacao: TcxGrid
      Left = 1
      Top = 1
      Width = 1227
      Height = 405
      Align = alClient
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      ExplicitWidth = 1223
      ExplicitHeight = 404
      object gdProdutosMovimentacaoDBTableView1: TcxGridDBTableView
        Navigator.Buttons.CustomButtons = <>
        ScrollbarAnnotations.CustomAnnotations = <>
        DataController.DataSource = dmRelMovimentacoesEstoque.dsQryMovimentacoes
        DataController.Summary.DefaultGroupSummaryItems = <
          item
            Format = ',0.0000;-,0.0000'
            Kind = skSum
            Position = spFooter
            Column = gdProdutosMovimentacaoDBTableView1QUANTIDADE
          end
          item
            Format = ',0.0000;-,0.0000'
            Kind = skSum
            Column = gdProdutosMovimentacaoDBTableView1QUANTIDADE
          end
          item
            Format = 'Total: #'
            Kind = skSum
            Column = gdProdutosMovimentacaoDBTableView1TOTAL
          end
          item
            Format = 'Total: #'
            Kind = skSum
            Position = spFooter
            Column = gdProdutosMovimentacaoDBTableView1TOTAL
          end
          item
            Format = '#Lan'#231'amentos'
            Kind = skCount
            Position = spFooter
            Column = gdProdutosMovimentacaoDBTableView1DATA
          end
          item
            Format = '# Lan'#231'amentos'
            Kind = skCount
            Column = gdProdutosMovimentacaoDBTableView1DATA
          end>
        DataController.Summary.FooterSummaryItems = <
          item
            Format = ',0.0000;-,0.0000'
            Kind = skSum
            Column = gdProdutosMovimentacaoDBTableView1QUANTIDADE
          end
          item
            Format = 'Total: #'
            Kind = skSum
            Column = gdProdutosMovimentacaoDBTableView1TOTAL
          end
          item
            Format = '#Lan'#231'amentos'
            Kind = skCount
            Column = gdProdutosMovimentacaoDBTableView1DATA
          end>
        DataController.Summary.SummaryGroups = <>
        OptionsCustomize.ColumnHiding = True
        OptionsCustomize.ColumnsQuickCustomization = True
        OptionsCustomize.GroupBySorting = True
        OptionsCustomize.GroupRowSizing = True
        OptionsView.Footer = True
        OptionsView.FooterAutoHeight = True
        OptionsView.FooterMultiSummaries = True
        Styles.Content = cxStyle1
        Styles.ContentOdd = cxStyle2
        Styles.Header = cxStyle3
        object gdProdutosMovimentacaoDBTableView1DATA: TcxGridDBColumn
          Caption = 'Data'
          DataBinding.FieldName = 'DATA'
          Width = 76
        end
        object gdProdutosMovimentacaoDBTableView1COD_ITEM: TcxGridDBColumn
          Caption = 'C'#243'd.'
          DataBinding.FieldName = 'COD_ITEM'
          Width = 44
        end
        object gdProdutosMovimentacaoDBTableView1DESCRICAO: TcxGridDBColumn
          Caption = 'Produto'
          DataBinding.FieldName = 'DESCRICAO'
          Width = 173
        end
        object gdProdutosMovimentacaoDBTableView1OPERACAO: TcxGridDBColumn
          Caption = 'Tipo'
          DataBinding.FieldName = 'OPERACAO'
          Width = 42
        end
        object gdProdutosMovimentacaoDBTableView1QUANTIDADE: TcxGridDBColumn
          Caption = 'Qtde'
          DataBinding.FieldName = 'QUANTIDADE'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.DecimalPlaces = 3
          Properties.DisplayFormat = ' ,0.000;- ,0.000'
          Width = 72
        end
        object gdProdutosMovimentacaoDBTableView1CUSTO: TcxGridDBColumn
          Caption = 'Custo unit.'
          DataBinding.FieldName = 'CUSTO'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Width = 62
        end
        object gdProdutosMovimentacaoDBTableView1UNIDADE: TcxGridDBColumn
          Caption = 'Unidade'
          DataBinding.FieldName = 'UNIDADE'
          Width = 77
        end
        object gdProdutosMovimentacaoDBTableView1TOTAL: TcxGridDBColumn
          Caption = 'Total'
          DataBinding.FieldName = 'TOTAL'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Width = 59
        end
        object gdProdutosMovimentacaoDBTableView1DESCRICAOTIPO: TcxGridDBColumn
          Caption = 'Hist'#243'rico da baixa'
          DataBinding.FieldName = 'DESCRICAOTIPO'
          Width = 149
        end
        object gdProdutosMovimentacaoDBTableView1HORA: TcxGridDBColumn
          Caption = 'Hora'
          DataBinding.FieldName = 'HORA'
          Width = 51
        end
        object gdProdutosMovimentacaoDBTableView1USUARIO: TcxGridDBColumn
          Caption = 'Usu'#225'rio'
          DataBinding.FieldName = 'USUARIO'
          Width = 67
        end
        object gdProdutosMovimentacaoDBTableView1OBSERVACOES: TcxGridDBColumn
          Caption = 'Obs'
          DataBinding.FieldName = 'OBSERVACOES'
          Width = 140
        end
        object gdProdutosMovimentacaoDBTableView1DESCRICAOGRUPO: TcxGridDBColumn
          Caption = 'Grupo'
          DataBinding.FieldName = 'DESCRICAOGRUPO'
          Width = 105
        end
        object gdProdutosMovimentacaoDBTableView1ESTOQUE_ANTERIOR: TcxGridDBColumn
          Caption = 'Estoque antes'
          DataBinding.FieldName = 'ESTOQUE_ANTERIOR'
        end
        object gdProdutosMovimentacaoDBTableView1ESTOQUE_ATUALIZADO: TcxGridDBColumn
          Caption = 'Estoque ap'#243's'
          DataBinding.FieldName = 'ESTOQUE_ATUALIZADO'
        end
      end
      object gdProdutosMovimentacaoLevel1: TcxGridLevel
        GridView = gdProdutosMovimentacaoDBTableView1
      end
    end
  end
  object Panel2: TPanel [4]
    Left = 0
    Top = 552
    Width = 1229
    Height = 70
    Align = alBottom
    Color = clWhite
    ParentBackground = False
    TabOrder = 3
    ExplicitTop = 551
    ExplicitWidth = 1225
    DesignSize = (
      1229
      70)
    object btSair: TAdvGlassButton
      Left = 1063
      Top = 4
      Width = 156
      Height = 62
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
      ExplicitLeft = 1059
    end
    object btSelecionar: TAdvGlassButton
      Left = 901
      Top = 5
      Width = 156
      Height = 62
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
      ExplicitLeft = 897
    end
  end
  object Panel1: TPanel [5]
    Left = 0
    Top = 58
    Width = 1229
    Height = 87
    Align = alTop
    Color = clWhite
    ParentBackground = False
    TabOrder = 4
    ExplicitWidth = 1225
    object btPesquisar: TPngSpeedButton
      Left = 1045
      Top = 15
      Width = 178
      Height = 67
      Caption = 'Filtrar registros'
      Flat = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      Layout = blGlyphTop
      ParentFont = False
      OnClick = btPesquisarClick
      PngImage.Data = {
        89504E470D0A1A0A0000000D4948445200000018000000180806000000E0773D
        F8000000097048597300000B1300000B1301009A9C18000000F84944415478DA
        636440060DFB3580A4040365E0054383E30D188711D582033F80243B8516FC64
        6870E0C065C17F0A0D879AE3003717CD828307A86381BD03760B6800E8EC03DA
        C7C1A805842DA803910CE4A7AEFF60FD0D0E4DD82D005BB23F0428BC10C8E222
        D1F0AF40F31380C5C41A6441EC2E6DD86F0094DA0864C91169F84306A67FFE0C
        754E17D125700745C351310686DF6B812C1B02861F6160630A62A8B27B8D4D12
        7F58375C656360783D15C84AC1A1623683244F3643BAC96F5C46101799B85217
        526A19B560785AF00868813C2D2C00A5F71E06EE9F53194ADDBF52CB82EF40F2
        332906936641F33E75068EDF4F4831180600DE19601973019851000000004945
        4E44AE426082}
    end
    object RadioGroup2: TRadioGroup
      Left = 1
      Top = 6
      Width = 352
      Height = 67
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
      TabOrder = 0
    end
    object Panel5: TPanel
      Left = 8
      Top = 24
      Width = 337
      Height = 45
      BevelOuter = bvNone
      Color = clWhite
      ParentBackground = False
      TabOrder = 1
      object Label3: TLabel
        Left = 6
        Top = 1
        Width = 24
        Height = 16
        Caption = 'De:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label4: TLabel
        Left = 175
        Top = -2
        Width = 29
        Height = 16
        Caption = 'at'#233':'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        ParentFont = False
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
      object edDataInicio: TDateEdit
        Left = 6
        Top = 16
        Width = 99
        Height = 24
        DialogTitle = 'Selecione a data'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        NumGlyphs = 2
        ParentFont = False
        TabOrder = 1
        Text = '22/11/2021'
      end
      object edDataFim: TDateEdit
        Left = 175
        Top = 17
        Width = 99
        Height = 24
        DialogTitle = 'Selecione a data'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        NumGlyphs = 2
        ParentFont = False
        TabOrder = 2
      end
      object edHoraIni: TJvTimeEdit
        Left = 108
        Top = 16
        Width = 57
        Height = 24
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 3
      end
      object edHoraFim: TJvTimeEdit
        Left = 277
        Top = 17
        Width = 57
        Height = 24
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 4
      end
    end
    object Panel3: TPanel
      Left = 365
      Top = 30
      Width = 564
      Height = 43
      BevelOuter = bvNone
      Color = clWhite
      ParentBackground = False
      TabOrder = 2
      object Label1: TLabel
        Left = 1
        Top = 1
        Width = 69
        Height = 13
        Caption = 'C'#243'd. Grupo:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label2: TLabel
        Left = 112
        Top = 2
        Width = 116
        Height = 13
        Caption = 'Descri'#231#227'o do grupo:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object bt_pesq_grupo: TSpeedButton
        Left = 76
        Top = 17
        Width = 23
        Height = 22
        Glyph.Data = {
          DE010000424DDE01000000000000760000002800000024000000120000000100
          0400000000006801000000000000000000001000000000000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00666666666666
          6666666666666666666666660000666666666666666666666666666666666666
          0000666666666666666666666666666666666666000060000066666000006667
          7777666667777766000060700066666070006667877766666787776600006070
          00666660700066678777666667877766000060000000F00000006667777777F7
          7777776600006070000000700000666787777777877777660000607000006070
          0000666787777767877777660000607000006070000066678777776787777766
          0000660000000000000666667777777777777666000066607000F07000666666
          678777F787776666000066600000600000666666677777677777666600006666
          00066600066666666677766677766666000066667F06667F06666666667F7666
          7F76666600006666000666000666666666777666777666660000666666666666
          6666666666666666666666660000666666666666666666666666666666666666
          0000}
        NumGlyphs = 2
        OnClick = botao_pesquisaClick
      end
      object ed_cod_grupo: TMaskEdit
        Left = 0
        Top = 17
        Width = 72
        Height = 21
        TabOrder = 0
        Text = ''
        OnChange = Edit1Change
        OnEnter = Edit1Enter
        OnExit = Edit1Exit
        OnKeyDown = Edit1KeyDown
      end
      object Panel7: TPanel
        Left = 113
        Top = 19
        Width = 400
        Height = 29
        BevelOuter = bvNone
        Color = clWhite
        Enabled = False
        ParentBackground = False
        TabOrder = 1
        object ed_desc_grupo: TMaskEdit
          Left = 0
          Top = 1
          Width = 401
          Height = 21
          Color = 12615680
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 0
          Text = ''
          OnKeyDown = Edit1KeyDown
        end
      end
    end
  end
  inherited cliques: TActionList
    Left = 504
    Top = 16
  end
  inherited actlBusca: TJvControlActionList
    Left = 544
    Top = 16
  end
  object dxComponentPrinter1: TdxComponentPrinter
    CurrentLink = dxComponentPrinter1Link1
    PreviewOptions.ShowExplorer = True
    PreviewOptions.Caption = 'Relat'#243'rio de movimenta'#231#227'o de estoque'
    PreviewOptions.WindowState = wsMaximized
    PrintTitle = 'Relat'#243'rio de movimenta'#231#227'o de estoque'
    Version = 0
    Left = 640
    Top = 56
    PixelsPerInch = 96
    object dxComponentPrinter1Link1: TdxGridReportLink
      Component = gdProdutosMovimentacao
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
  object cxStyleRepository1: TcxStyleRepository
    PixelsPerInch = 96
    object cxStyle1: TcxStyle
      AssignedValues = [svFont]
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
    end
    object cxStyle2: TcxStyle
      AssignedValues = [svColor, svFont]
      Color = 15066597
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
    end
  end
  object cxStyleRepository2: TcxStyleRepository
    PixelsPerInch = 96
    object cxStyle3: TcxStyle
      AssignedValues = [svFont]
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
    end
  end
end
