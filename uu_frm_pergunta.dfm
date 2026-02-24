inherited frmPergunta: TfrmPergunta
  Left = 234
  Top = 173
  BorderIcons = []
  ClientHeight = 480
  ClientWidth = 717
  Position = poOwnerFormCenter
  ExplicitWidth = 729
  ExplicitHeight = 518
  TextHeight = 13
  inherited botao_pesquisa: TSpeedButton
    Top = -44
    ExplicitTop = -44
  end
  object SpeedButton1: TSpeedButton [1]
    Left = 142
    Top = -34
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
    Top = -41
    ExplicitTop = -41
  end
  object Edit2: TEdit [3]
    Tag = 99
    Left = 15
    Top = -29
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
  object pnFundo: TPanel [4]
    Left = 0
    Top = 0
    Width = 717
    Height = 480
    Align = alClient
    BevelInner = bvSpace
    BevelKind = bkFlat
    Color = clWhite
    ParentBackground = False
    TabOrder = 2
    ExplicitWidth = 713
    ExplicitHeight = 479
    object pnTitulo: TPanel
      Tag = 99
      Left = 2
      Top = 2
      Width = 709
      Height = 83
      Align = alTop
      Color = 5198809
      ParentBackground = False
      TabOrder = 0
      ExplicitWidth = 705
      object lb_mesa: TLabel
        Left = 946
        Top = 13
        Width = 48
        Height = 29
        Caption = '0001'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -24
        Font.Name = 'Calibri'
        Font.Style = []
        ParentFont = False
      end
      object lblTitulo: TLabel
        Left = 5
        Top = 2
        Width = 204
        Height = 81
        Alignment = taCenter
        AutoSize = False
        Caption = 'Aten'#231#227'o'
        Color = 5198809
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -48
        Font.Name = 'Calibri'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        Transparent = True
        Layout = tlCenter
      end
    end
    object Panel3: TPanel
      Left = 2
      Top = 383
      Width = 709
      Height = 91
      Align = alBottom
      BevelOuter = bvNone
      BevelWidth = 2
      Color = clWhite
      ParentBackground = False
      TabOrder = 1
      ExplicitTop = 382
      ExplicitWidth = 705
      DesignSize = (
        709
        91)
      object btSim: TAdvGlassButton
        Left = 437
        Top = 26
        Width = 130
        Height = 60
        Anchors = [akTop, akRight, akBottom]
        AntiAlias = aaAntiAlias
        BackColor = 6076508
        ButtonDirection = bdLeft
        Caption = 'Sim'
        CornerRadius = 10
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'Verdana'
        Font.Style = []
        ForeColor = 6076508
        GlowColor = 6076508
        ImageIndex = -1
        InnerBorderColor = 6076508
        OuterBorderColor = 6076508
        ParentFont = False
        ShineColor = 6076508
        ShowFocusRect = True
        TabOrder = 0
        Version = '1.3.3.1'
        OnClick = btSimClick
        OnKeyDown = btSimKeyDown
        ExplicitLeft = 433
      end
      object btNao: TAdvGlassButton
        Left = 577
        Top = 26
        Width = 130
        Height = 60
        Anchors = [akTop, akRight, akBottom]
        AntiAlias = aaAntiAlias
        BackColor = 5198809
        BackGroundSymbolColor = 5198809
        Caption = 'N'#227'o'
        CornerRadius = 10
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'Verdana'
        Font.Style = []
        ForeColor = 5198809
        GlowColor = 5198809
        ImageIndex = -1
        InnerBorderColor = 5198809
        OuterBorderColor = 5198809
        ParentFont = False
        ShineColor = 5198809
        ShowFocusRect = True
        TabOrder = 1
        Version = '1.3.3.1'
        OnClick = btNaoClick
        ExplicitLeft = 573
      end
    end
    object Panel2: TPanel
      Left = 2
      Top = 85
      Width = 709
      Height = 298
      Align = alClient
      BevelOuter = bvNone
      Color = clWhite
      Enabled = False
      ParentBackground = False
      TabOrder = 2
      ExplicitWidth = 705
      ExplicitHeight = 297
      object Memo1: TMemo
        Left = 0
        Top = 70
        Width = 709
        Height = 228
        Align = alBottom
        Alignment = taCenter
        BevelInner = bvNone
        BevelOuter = bvNone
        BorderStyle = bsNone
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -24
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 0
        OnClick = actExitFormaPagamentoExecute
        ExplicitTop = 69
        ExplicitWidth = 705
      end
    end
  end
  object ActionList1: TActionList
    Left = 144
    Top = 136
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
    Left = 304
    Top = 240
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
  object tmApaga: TTimer
    Enabled = False
    Interval = 650
    Left = 616
    Top = 98
  end
  object tmAcende: TTimer
    Enabled = False
    Interval = 650
    Left = 616
    Top = 148
  end
end
