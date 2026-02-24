object frm_modelo_vazio: Tfrm_modelo_vazio
  Left = 746
  Top = 489
  ClientHeight = 187
  ClientWidth = 282
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  Position = poScreenCenter
  OnActivate = FormActivate
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  TextHeight = 13
  object botao_pesquisa: TSpeedButton
    Left = 142
    Top = 21
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
  object Edit1: TEdit
    Tag = 99
    Left = 15
    Top = 21
    Width = 121
    Height = 21
    TabOrder = 0
    Text = 'Edit1'
    Visible = False
    OnChange = Edit1Change
    OnEnter = Edit1Enter
    OnExit = Edit1Exit
    OnKeyDown = Edit1KeyDown
  end
  object cliques: TActionList
    Left = 184
    Top = 24
    object actPesquisaFormaPagamento: TControlAction
      OnExecute = pesquisaFormaPagamento
    end
    object actExitFormaPagamento: TAction
      Caption = 'actExitFormaPagamento'
      OnExecute = actExitFormaPagamentoExecute
    end
    object actExportaExcel: TAction
      Caption = 'actExportaExcel'
    end
  end
  object actlBusca: TJvControlActionList
    Left = 232
    Top = 56
    object ACTF2ed_cod_grupo_fornecedor: TAction
      Caption = 'ACTF2ed_cod_grupo_fornecedor'
      OnExecute = ACTF2ed_cod_grupo_fornecedorExecute
    end
    object ACTF2ed_cod_fornecedor: TAction
      Caption = 'ACTF2ed_cod_fornecedor'
      OnExecute = ACTF2ed_cod_fornecedorExecute
    end
    object ACTF2edCodBairro: TAction
      Caption = 'ACTF2edCodBairro'
      OnExecute = ACTF2edCodBairroExecute
    end
    object ACTF2ed_cod_tipo_documento: TAction
      Caption = 'ACTF2ed_cod_tipo_documento'
      OnExecute = ACTF2ed_cod_tipo_documentoExecute
    end
    object ACTF2ed_cod_tipo_entrada: TAction
      Caption = 'ACTF2ed_cod_tipo_entrada'
      OnExecute = ACTF2ed_cod_tipo_entradaExecute
    end
    object ACTF2ed_cfop: TAction
      Caption = 'ACTF2ed_cfop'
      OnExecute = ACTF2ed_cfopExecute
    end
    object ACTF2edCfopTransferencia: TAction
      Caption = 'ACTF2edCfopTransferencia'
      OnExecute = ACTF2edCfopTransferenciaExecute
    end
    object ACTF2edCfopDevolucao: TAction
      Caption = 'ACTF2edCfopDevolucao'
      OnExecute = ACTF2edCfopDevolucaoExecute
    end
    object ACTF2edCodTipoItemSped: TAction
      Caption = 'ACTF2edCodTipoItemSped'
      OnExecute = ACTF2edCodTipoItemSpedExecute
    end
    object ACTF2edCodNCM: TAction
      Caption = 'ACTF2edCodNCM'
      OnExecute = ACTF2edCodNCMExecute
    end
    object ACTF2edCodGeneroItem: TAction
      Caption = 'ACTF2edCodGeneroItem'
      OnExecute = ACTF2edCodGeneroItemExecute
    end
    object ACTF2ed_cefop_entradas: TAction
      Caption = 'ACTF2ed_cefop_entradas'
      OnExecute = ACTF2ed_cefop_entradasExecute
    end
    object ACTF2ed_cefop_saidas: TAction
      Caption = 'ACTF2ed_cefop_saidas'
      OnExecute = ACTF2ed_cefop_saidasExecute
    end
    object ACTF2ed_cod_modelo_nota_fiscal: TAction
      Caption = 'ACTF2ed_cod_modelo_nota_fiscal'
      OnExecute = ACTF2ed_cod_modelo_nota_fiscalExecute
    end
    object ACTF2edCodSituacaoDocFiscal: TAction
      Caption = 'ACTF2edCodSituacaoDocFiscal'
      OnExecute = ACTF2edCodSituacaoDocFiscalExecute
    end
    object ACTF2ed_cst: TAction
      Caption = 'ACTF2ed_cst'
      OnExecute = ACTF2ed_cstExecute
    end
    object ACTF2edCstSaida: TAction
      Caption = 'ACTF2edCstSaida'
      OnExecute = ACTF2edCstSaidaExecute
    end
    object ACTF2edCstTransferencia: TAction
      Caption = 'ACTF2edCstTransferencia'
      OnExecute = ACTF2edCstTransferenciaExecute
    end
    object ACTF2edCstDevolucao: TAction
      Caption = 'ACTF2edCstDevolucao'
      OnExecute = ACTF2edCstDevolucaoExecute
    end
    object ACTF2edCstPisCofins: TAction
      Caption = 'ACTF2edCstPisCofins'
      OnExecute = ACTF2edCstPisCofinsExecute
    end
    object ACTF2ed_cod_usuario: TAction
      Caption = 'ACTF2ed_cod_usuario'
      OnExecute = ACTF2ed_cod_usuarioExecute
    end
    object ACTF2ed_cod_grupo: TAction
      Caption = 'ACTF2ed_cod_grupo'
      OnExecute = ACTF2ed_cod_grupoExecute
    end
    object ACTF2edCodGrupoRD: TAction
      Caption = 'ACTF2edCodGrupoRD'
    end
    object ACTF2ed_cod_historico: TAction
      Caption = 'ACTF2ed_cod_historico'
      OnExecute = ACTF2ed_cod_historicoExecute
    end
    object ACTF2ed_cod_cidade: TAction
      Caption = 'ACTF2ed_cod_cidade'
      OnExecute = ACTF2ed_cod_cidadeExecute
    end
    object ACTF2edCodGrupoTouch: TAction
      Caption = 'ACTF2edCodGrupoTouch'
      OnExecute = ACTF2edCodGrupoTouchExecute
    end
    object ACTF2ed_cod_estado: TAction
      Caption = 'ACTF2ed_cod_estado'
      OnExecute = ACTF2ed_cod_estadoExecute
    end
    object ACTF2ed_cod_centro_custo: TAction
      Caption = 'ACTF2ed_cod_centro_custo'
      OnExecute = ACTF2ed_cod_centro_custoExecute
    end
    object ACTF2ed_cod_item: TAction
      Caption = 'ACTF2ed_cod_item'
      OnExecute = ACTF2ed_cod_itemExecute
    end
    object ACTF2ed_cod_item_saida: TAction
      Caption = 'ACTF2ed_cod_item_saida'
      OnExecute = ACTF2ed_cod_item_saidaExecute
    end
    object ACTF2edCodSubmateria: TAction
      Caption = 'ACTF2edCodSubmateria'
      OnExecute = ACTF2edCodSubmateriaExecute
    end
    object ACTF2edCodTipoBaixaEstoque: TAction
      Caption = 'ACTF2edCodTipoBaixaEstoque'
      OnExecute = ACTF2edCodTipoBaixaEstoqueExecute
    end
    object ACTF2ed_cod_barras_item: TAction
      Caption = 'ACTF2ed_cod_barras_item'
      OnExecute = ACTF2ed_cod_barras_itemExecute
    end
    object ACTF2ed_cod_un_entrada: TAction
      Caption = 'ACTF2ed_cod_un_entrada'
      OnExecute = ACTF2ed_cod_un_entradaExecute
    end
    object ACTF2ed_cod_un_saida: TAction
      Caption = 'ACTF2ed_cod_un_saida'
      OnExecute = ACTF2ed_cod_un_saidaExecute
    end
    object ACTF2edCodSaborPizza: TAction
      Caption = 'ACTF2edCodSaborPizza'
      OnExecute = ACTF2edCodSaborPizzaExecute
    end
    object ACTF2edCodUnFracao: TAction
      Caption = 'ACTF2edCodUnFracao'
      OnExecute = ACTF2edCodUnFracaoExecute
    end
    object ACTF2edCodUnPadrao: TAction
      Caption = 'ACTF2edCodUnPadrao'
      OnExecute = ACTF2edCodUnPadraoExecute
    end
    object ACTF2ed_cod_garcon: TAction
      Caption = 'ACTF2ed_cod_garcon'
      OnExecute = ACTF2ed_cod_garconExecute
    end
    object ACTF2edCodPromoter: TAction
      Caption = 'ACTF2edCodPromoter'
      OnExecute = ACTF2edCodPromoterExecute
    end
    object ACTF2edCodDepartamento: TAction
      Caption = 'ACTF2edCodDepartamento'
      OnExecute = ACTF2edCodDepartamentoExecute
    end
    object ACTF2edCodGuarnicao: TAction
      Caption = 'ACTF2edCodGuarnicao'
    end
    object ACTF2ed_cod_metre: TAction
      Caption = 'ACTF2ed_cod_metre'
      OnExecute = ACTF2ed_cod_metreExecute
    end
    object ACTF2ed_cod_tipo_cliente: TAction
      Caption = 'ACTF2ed_cod_tipo_cliente'
      OnExecute = ACTF2ed_cod_tipo_clienteExecute
    end
    object ACTF2ed_cod_cliente: TAction
      Caption = 'ACTF2ed_cod_cliente'
      OnExecute = ACTF2ed_cod_clienteExecute
    end
    object ACTF2ed_cod_cliente_reduzido: TAction
      Caption = 'ACTF2ed_cod_cliente_reduzido'
      OnExecute = ACTF2ed_cod_cliente_reduzidoExecute
    end
    object ACTF2edRgCliente: TAction
      Caption = 'ACTF2edRgCliente'
      OnExecute = ACTF2edRgClienteExecute
    end
    object ACTF2ed_cod_mini_printer: TAction
      Caption = 'ACTF2ed_cod_mini_printer'
      OnExecute = ACTF2ed_cod_mini_printerExecute
    end
    object ACTF2edTelClienteDelivery: TAction
      Caption = 'ACTF2edTelClienteDelivery'
      OnExecute = ACTF2edTelClienteDeliveryExecute
    end
    object ACTF2edCodBarrasProduto: TAction
      Caption = 'ACTF2edCodBarrasProduto'
      OnExecute = ACTF2edCodBarrasProdutoExecute
    end
    object ACTF2edCodProduto: TAction
      Caption = 'ACTF2edCodProduto'
      OnExecute = ACTF2edCodProdutoExecute
    end
    object edCodPizza: TAction
      Caption = 'edCodPizza'
      OnExecute = edCodPizzaExecute
    end
    object ACTF2edCodAliquota: TAction
      Caption = 'ACTF2edCodAliquota'
      OnExecute = ACTF2edCodAliquotaExecute
    end
    object ACTF2edCodFormaPagamento: TAction
      Caption = 'ACTF2edCodFormaPagamento'
      OnExecute = ACTF2edCodFormaPagamentoExecute
    end
    object ACTF2edCodLoja: TAction
      Caption = 'ACTF2edCodLoja'
      OnExecute = ACTF2edCodLojaExecute
    end
    object ACTF2edCodCliDelivery: TAction
      Caption = 'ACTF2edCodCliDelivery'
      OnExecute = ACTF2edCodCliDeliveryExecute
    end
    object ACTF2edCodEntregador: TAction
      Caption = 'ACTF2edCodEntregador'
      OnExecute = ACTF2edCodEntregadorExecute
    end
  end
  object popMenuExportacaoGrid: TPopupMenu
    Left = 166
    Top = 112
    object tmExportarExcel: TMenuItem
      Caption = 'Excel'
      OnClick = tmExportarExcelClick
    end
    object tmExportarHTML: TMenuItem
      Caption = 'HTML'
      OnClick = tmExportarHTMLClick
    end
    object tmExportarCSV: TMenuItem
      Caption = 'CSV'
      OnClick = tmExportarCSVClick
    end
    object tmExportarTXT: TMenuItem
      Caption = 'TXT'
      OnClick = tmExportarTXTClick
    end
    object tmExportarXML: TMenuItem
      Caption = 'XML'
      OnClick = tmExportarXMLClick
    end
  end
end
