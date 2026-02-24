inherited frmRelCurvaABCProdutosComprados: TfrmRelCurvaABCProdutosComprados
  ClientHeight = 291
  ClientWidth = 476
  Color = clWhite
  ExplicitWidth = 488
  ExplicitHeight = 329
  TextHeight = 13
  object SpeedButton1: TSpeedButton [1]
    Left = 143
    Top = -59
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
  object Edit2: TEdit [3]
    Tag = 99
    Left = 16
    Top = -59
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
  object pnTitulo: TPanel [4]
    Tag = 99
    Left = 0
    Top = 0
    Width = 476
    Height = 59
    Align = alTop
    Color = 12615680
    ParentBackground = False
    TabOrder = 2
    StyleElements = []
    object lbTitulo: TLabel
      Left = 5
      Top = 17
      Width = 392
      Height = 39
      AutoSize = False
      Caption = 'Curva ABC de compras'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -27
      Font.Name = 'Calibri'
      Font.Style = [fsBold]
      ParentFont = False
      StyleElements = []
    end
  end
  object Panel2: TPanel [5]
    Left = 0
    Top = 59
    Width = 476
    Height = 177
    Align = alClient
    BevelOuter = bvNone
    Color = clWhite
    ParentBackground = False
    TabOrder = 3
    StyleElements = []
    object Label1: TLabel
      Left = 23
      Top = 101
      Width = 45
      Height = 24
      Caption = 'A (%)'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      StyleElements = []
    end
    object Label2: TLabel
      Left = 170
      Top = 100
      Width = 44
      Height = 24
      Caption = 'B (%)'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      StyleElements = []
    end
    object Label5: TLabel
      Left = 351
      Top = 104
      Width = 45
      Height = 24
      Caption = 'C (%)'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      StyleElements = []
    end
    object RadioGroup1: TRadioGroup
      Left = 16
      Top = 12
      Width = 453
      Height = 81
      Caption = 'Per'#237'odo de an'#225'lise'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 4
    end
    object Panel3: TPanel
      Left = 22
      Top = 32
      Width = 435
      Height = 50
      BevelOuter = bvNone
      Color = clWhite
      ParentBackground = False
      TabOrder = 0
      StyleElements = []
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
        StyleElements = []
      end
      object Label4: TLabel
        Left = 239
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
        StyleElements = []
      end
      object ed_data_inicial: TAdvDateTimePicker
        Left = 13
        Top = 15
        Width = 179
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
        Left = 239
        Top = 15
        Width = 179
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
    object edPCTA: TJvValidateEdit
      Left = 18
      Top = 127
      Width = 146
      Height = 33
      CriticalPoints.MaxValueIncluded = False
      CriticalPoints.MinValueIncluded = False
      DisplayFormat = dfFloat
      DecimalPlaces = 2
      EditText = '80,00'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -21
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
    end
    object edPCTB: TJvValidateEdit
      Left = 170
      Top = 127
      Width = 146
      Height = 33
      CriticalPoints.MaxValueIncluded = False
      CriticalPoints.MinValueIncluded = False
      DisplayFormat = dfFloat
      DecimalPlaces = 2
      EditText = '15,00'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -21
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
    end
    object edPCTC: TJvValidateEdit
      Left = 323
      Top = 127
      Width = 146
      Height = 33
      CriticalPoints.MaxValueIncluded = False
      CriticalPoints.MinValueIncluded = False
      DisplayFormat = dfFloat
      DecimalPlaces = 2
      EditText = '5,00'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -21
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
    end
  end
  object Panel1: TPanel [6]
    Left = 0
    Top = 236
    Width = 476
    Height = 55
    Align = alBottom
    BevelOuter = bvNone
    Color = clWhite
    ParentBackground = False
    TabOrder = 4
    StyleElements = []
    DesignSize = (
      476
      55)
    object btSelecionar: TAdvGlassButton
      Left = 205
      Top = 4
      Width = 123
      Height = 48
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
      Left = 334
      Top = 5
      Width = 123
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
      TabOrder = 1
      Version = '1.3.3.1'
      OnClick = btSairClick
    end
  end
  inherited cliques: TActionList
    Left = 409
    Top = 50
  end
  object ActionList1: TActionList
    Left = 185
    Top = 65480
    object ControlAction1: TControlAction
      Caption = 'ControlAction1'
      OnExecute = pesquisaFormaPagamento
    end
    object Action1: TAction
      Caption = 'actExitFormaPagamento'
      OnExecute = actExitFormaPagamentoExecute
    end
  end
  object JvControlActionList1: TJvControlActionList
    Left = 233
    Top = 65512
    object Action2: TAction
      Caption = 'ACTF2ed_cod_grupo_fornecedor'
      OnExecute = ACTF2ed_cod_grupo_fornecedorExecute
    end
    object Action3: TAction
      Caption = 'ACTF2ed_cod_fornecedor'
      OnExecute = ACTF2ed_cod_fornecedorExecute
    end
    object Action4: TAction
      Caption = 'ACTF2edCodBairro'
      OnExecute = ACTF2edCodBairroExecute
    end
    object Action5: TAction
      Caption = 'ACTF2ed_cod_tipo_documento'
      OnExecute = ACTF2ed_cod_tipo_documentoExecute
    end
    object Action6: TAction
      Caption = 'ACTF2ed_cod_tipo_entrada'
      OnExecute = ACTF2ed_cod_tipo_entradaExecute
    end
    object Action7: TAction
      Caption = 'ACTF2ed_cfop'
      OnExecute = ACTF2ed_cfopExecute
    end
    object Action8: TAction
      Caption = 'ACTF2edCfopTransferencia'
      OnExecute = ACTF2edCfopTransferenciaExecute
    end
    object Action9: TAction
      Caption = 'ACTF2edCfopDevolucao'
      OnExecute = ACTF2edCfopDevolucaoExecute
    end
    object Action10: TAction
      Caption = 'ACTF2edCodTipoItemSped'
      OnExecute = ACTF2edCodTipoItemSpedExecute
    end
    object Action11: TAction
      Caption = 'ACTF2edCodNCM'
      OnExecute = ACTF2edCodNCMExecute
    end
    object Action12: TAction
      Caption = 'ACTF2edCodGeneroItem'
      OnExecute = ACTF2edCodGeneroItemExecute
    end
    object Action13: TAction
      Caption = 'ACTF2ed_cefop_entradas'
      OnExecute = ACTF2ed_cefop_entradasExecute
    end
    object Action14: TAction
      Caption = 'ACTF2ed_cefop_saidas'
      OnExecute = ACTF2ed_cefop_saidasExecute
    end
    object Action15: TAction
      Caption = 'ACTF2ed_cod_modelo_nota_fiscal'
      OnExecute = ACTF2ed_cod_modelo_nota_fiscalExecute
    end
    object Action16: TAction
      Caption = 'ACTF2edCodSituacaoDocFiscal'
      OnExecute = ACTF2edCodSituacaoDocFiscalExecute
    end
    object Action17: TAction
      Caption = 'ACTF2ed_cst'
      OnExecute = ACTF2ed_cstExecute
    end
    object Action18: TAction
      Caption = 'ACTF2edCstSaida'
      OnExecute = ACTF2edCstSaidaExecute
    end
    object Action19: TAction
      Caption = 'ACTF2edCstTransferencia'
      OnExecute = ACTF2edCstTransferenciaExecute
    end
    object Action20: TAction
      Caption = 'ACTF2edCstDevolucao'
      OnExecute = ACTF2edCstDevolucaoExecute
    end
    object Action21: TAction
      Caption = 'ACTF2edCstPisCofins'
      OnExecute = ACTF2edCstPisCofinsExecute
    end
    object Action22: TAction
      Caption = 'ACTF2ed_cod_usuario'
      OnExecute = ACTF2ed_cod_usuarioExecute
    end
    object Action23: TAction
      Caption = 'ACTF2ed_cod_grupo'
      OnExecute = ACTF2ed_cod_grupoExecute
    end
    object Action24: TAction
      Caption = 'ACTF2edCodGrupoRD'
    end
    object Action25: TAction
      Caption = 'ACTF2ed_cod_historico'
      OnExecute = ACTF2ed_cod_historicoExecute
    end
    object Action26: TAction
      Caption = 'ACTF2ed_cod_cidade'
      OnExecute = ACTF2ed_cod_cidadeExecute
    end
    object Action27: TAction
      Caption = 'ACTF2edCodGrupoTouch'
      OnExecute = ACTF2edCodGrupoTouchExecute
    end
    object Action28: TAction
      Caption = 'ACTF2ed_cod_estado'
      OnExecute = ACTF2ed_cod_estadoExecute
    end
    object Action29: TAction
      Caption = 'ACTF2ed_cod_centro_custo'
      OnExecute = ACTF2ed_cod_centro_custoExecute
    end
    object Action30: TAction
      Caption = 'ACTF2ed_cod_item'
      OnExecute = ACTF2ed_cod_itemExecute
    end
    object Action31: TAction
      Caption = 'ACTF2ed_cod_item_saida'
      OnExecute = ACTF2ed_cod_item_saidaExecute
    end
    object Action32: TAction
      Caption = 'ACTF2edCodSubmateria'
      OnExecute = ACTF2edCodSubmateriaExecute
    end
    object Action33: TAction
      Caption = 'ACTF2edCodTipoBaixaEstoque'
      OnExecute = ACTF2edCodTipoBaixaEstoqueExecute
    end
    object Action34: TAction
      Caption = 'ACTF2ed_cod_barras_item'
      OnExecute = ACTF2ed_cod_barras_itemExecute
    end
    object Action35: TAction
      Caption = 'ACTF2ed_cod_un_entrada'
      OnExecute = ACTF2ed_cod_un_entradaExecute
    end
    object Action36: TAction
      Caption = 'ACTF2ed_cod_un_saida'
      OnExecute = ACTF2ed_cod_un_saidaExecute
    end
    object Action37: TAction
      Caption = 'ACTF2edCodSaborPizza'
      OnExecute = ACTF2edCodSaborPizzaExecute
    end
    object Action38: TAction
      Caption = 'ACTF2edCodUnFracao'
      OnExecute = ACTF2edCodUnFracaoExecute
    end
    object Action39: TAction
      Caption = 'ACTF2edCodUnPadrao'
      OnExecute = ACTF2edCodUnPadraoExecute
    end
    object Action40: TAction
      Caption = 'ACTF2ed_cod_garcon'
      OnExecute = ACTF2ed_cod_garconExecute
    end
    object Action41: TAction
      Caption = 'ACTF2edCodPromoter'
      OnExecute = ACTF2edCodPromoterExecute
    end
    object Action42: TAction
      Caption = 'ACTF2edCodDepartamento'
      OnExecute = ACTF2edCodDepartamentoExecute
    end
    object Action43: TAction
      Caption = 'ACTF2edCodGuarnicao'
    end
    object Action44: TAction
      Caption = 'ACTF2ed_cod_metre'
      OnExecute = ACTF2ed_cod_metreExecute
    end
    object Action45: TAction
      Caption = 'ACTF2ed_cod_tipo_cliente'
      OnExecute = ACTF2ed_cod_tipo_clienteExecute
    end
    object Action46: TAction
      Caption = 'ACTF2ed_cod_cliente'
      OnExecute = ACTF2ed_cod_clienteExecute
    end
    object Action47: TAction
      Caption = 'ACTF2ed_cod_cliente_reduzido'
      OnExecute = ACTF2ed_cod_cliente_reduzidoExecute
    end
    object Action48: TAction
      Caption = 'ACTF2edRgCliente'
      OnExecute = ACTF2edRgClienteExecute
    end
    object Action49: TAction
      Caption = 'ACTF2ed_cod_mini_printer'
      OnExecute = ACTF2ed_cod_mini_printerExecute
    end
    object Action50: TAction
      Caption = 'ACTF2edTelClienteDelivery'
      OnExecute = ACTF2edTelClienteDeliveryExecute
    end
    object Action51: TAction
      Caption = 'ACTF2edCodBarrasProduto'
      OnExecute = ACTF2edCodBarrasProdutoExecute
    end
    object Action52: TAction
      Caption = 'ACTF2edCodProduto'
      OnExecute = ACTF2edCodProdutoExecute
    end
    object Action53: TAction
      Caption = 'edCodPizza'
      OnExecute = edCodPizzaExecute
    end
    object Action54: TAction
      Caption = 'ACTF2edCodAliquota'
      OnExecute = ACTF2edCodAliquotaExecute
    end
    object Action55: TAction
      Caption = 'ACTF2edCodFormaPagamento'
      OnExecute = ACTF2edCodFormaPagamentoExecute
    end
    object Action56: TAction
      Caption = 'ACTF2edCodLoja'
      OnExecute = ACTF2edCodLojaExecute
    end
    object Action57: TAction
      Caption = 'ACTF2edCodCliDelivery'
      OnExecute = ACTF2edCodCliDeliveryExecute
    end
    object Action58: TAction
      Caption = 'ACTF2edCodEntregador'
      OnExecute = ACTF2edCodEntregadorExecute
    end
  end
  object FDMemTable1: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 284
    Top = 47
  end
end
