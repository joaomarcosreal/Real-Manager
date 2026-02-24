object dmProducaoSubprodutos: TdmProducaoSubprodutos
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Height = 604
  Width = 918
  object qryHistoricosProducao: TFDQuery
    FieldOptions.UpdatePersistent = True
    Connection = dm.fdRestaurante
    FormatOptions.AssignedValues = [fvMaxBcdPrecision]
    FormatOptions.MaxBcdPrecision = 20
    SQL.Strings = (
      'select * from HISTORICOS_PRODUCAO order by codigo')
    Left = 58
    Top = 15
  end
  object dsQryHistoricosProducao: TDataSource
    DataSet = qryHistoricosProducao
    Left = 58
    Top = 72
  end
  object tbSubprodutosProducao: TFDMemTable
    BeforePost = tbSubprodutosProducaoBeforePost
    FieldOptions.UpdatePersistent = True
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    FormatOptions.AssignedValues = [fvMaxBcdPrecision]
    FormatOptions.MaxBcdPrecision = 20
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 187
    Top = 16
    object tbSubprodutosProducaocodProduto: TStringField
      FieldName = 'codProduto'
      Size = 5
    end
    object tbSubprodutosProducaoDescricao: TStringField
      FieldName = 'Descricao'
      Size = 80
    end
    object tbSubprodutosProducaocustoUnitario: TCurrencyField
      FieldName = 'custoUnitario'
    end
    object tbSubprodutosProducaocustoTotal: TCurrencyField
      FieldName = 'custoTotal'
    end
    object tbSubprodutosProducaopercentualReceita: TBCDField
      FieldName = 'percentualReceita'
      DisplayFormat = ',0.000%;-,0.000%'
    end
    object tbSubprodutosProducaocodUnidade: TStringField
      FieldName = 'codUnidade'
      Size = 2
    end
    object tbSubprodutosProducaoUnidade: TStringField
      FieldName = 'Unidade'
      Size = 30
    end
    object tbSubprodutosProducaoqtdeProduzida: TBCDField
      FieldName = 'qtdeProduzida'
      Size = 0
    end
    object tbSubprodutosProducaorendimentoReceita: TBCDField
      FieldName = 'rendimentoReceita'
    end
  end
  object dsTbProdutosProducaoTemp: TDataSource
    DataSet = tbSubprodutosProducao
    Left = 183
    Top = 69
  end
  object dsFichaProducao: TDataSource
    DataSet = tbFichaProducao
    Left = 316
    Top = 74
  end
  object tbFichaProducao: TFDMemTable
    FieldOptions.UpdatePersistent = True
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    FormatOptions.AssignedValues = [fvMaxBcdPrecision]
    FormatOptions.MaxBcdPrecision = 20
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 318
    Top = 15
  end
  object dsListagemProducao: TDataSource
    DataSet = tbListagemProducao
    Left = 425
    Top = 75
  end
  object qryRelFichaProducao: TFDQuery
    FieldOptions.UpdatePersistent = True
    Connection = dm.fdRestaurante
    FormatOptions.AssignedValues = [fvMaxBcdPrecision]
    FormatOptions.MaxBcdPrecision = 20
    SQL.Strings = (
      'select '
      #39'MOLHO BOLONHESA'#39' as ProdutoProducao,'
      '102 as QtdeAProduzir,'
      '4080 as PercentualFichaProduzir,'
      #39'KILOGRAMA'#39' as UnidadeProducao,'
      
        'cp.cod_produto, cod_produto_baixa,                              ' +
        '                 '
      
        '        descricao_prod_baixa,                                   ' +
        '      '
      
        '        (p.estoque_liquido / u.parametro) as estoqueAtual,      ' +
        '      '
      
        '        u.sigla as unidadeEstoque,                              ' +
        '      '
      
        '        qtd_baixa_prod as qtdeReceita,                          ' +
        '      '
      
        '        descricao_unidade,                                      ' +
        '      '
      
        '        custo_unitario_produto,                                 ' +
        '      '
      
        '        custo_baixa as custoReceita,                            ' +
        '      '
      
        '        udf_roundabnt( (qtd_baixa_prod *40.8),3) as qtdeProducao' +
        ',    '
      
        '        udf_roundabnt( (custo_baixa * 40.8 ),3)   as custoProduc' +
        'ao     '
      
        '     from                                                       ' +
        '      '
      '       calcula_custo_produto_novo('#39'00597'#39', '#39'00597'#39',1) cp '
      
        '       inner join produtos p on (p.cod_produto = cp.cod_produto_' +
        'baixa)'
      
        '       inner join unidades u on (u.cod_unidade = p.unidade_entra' +
        'da)   ')
    Left = 55
    Top = 149
  end
  object DtqryRelFichaProducao: TfrxDBDataset
    UserName = 'DtqryRelFichaProducao'
    CloseDataSource = False
    DataSet = qryRelFichaProducao
    BCDToCurrency = False
    DataSetOptions = []
    Left = 56
    Top = 204
  end
  object qryRelOrdemProducao: TFDQuery
    FieldOptions.UpdatePersistent = True
    Connection = dm.fdRestaurante
    FormatOptions.AssignedValues = [fvMaxBcdPrecision]
    FormatOptions.MaxBcdPrecision = 20
    SQL.Strings = (
      ''
      ''
      ''
      '     select ps.id, ps.cod_empresa,'
      '            pm.descricao_empresa as Empresa,'
      '            ps.data,'
      '            ps.data_processamento,'
      '            ps.nome_usuario,'
      '            hs.descricao as historico,'
      '            ps.custo_producao,'
      '            ps.custo_perdas,'
      '            ps.observacoes'
      '       from  producoes_subprodutos ps'
      
        '       inner join historicos_producao hs on (hs.codigo = ps.cod_' +
        'historico)'
      
        '       inner join parametros pm on (pm.cod_empresa = ps.cod_empr' +
        'esa)')
    Left = 192
    Top = 151
  end
  object dtQryRelOrdemProducao: TfrxDBDataset
    UserName = 'dtQryRelOrdemProducao'
    CloseDataSource = False
    DataSet = qryRelOrdemProducao
    BCDToCurrency = False
    DataSetOptions = []
    Left = 190
    Top = 207
  end
  object qryProdutosOrdemProducao: TFDQuery
    FieldOptions.UpdatePersistent = True
    Connection = dm.fdRestaurante
    FormatOptions.AssignedValues = [fvMaxBcdPrecision]
    FormatOptions.MaxBcdPrecision = 20
    SQL.Strings = (
      ''
      'select pd.id,'
      
        '        pd.id_producao,                                         ' +
        '             '
      
        '        pd.cod_produto,                                         ' +
        '             '
      
        '        p.descricao,                                            ' +
        '             '
      
        '        pd.cod_unidade,                                         ' +
        '             '
      '        pd.qtde_produzida as quantidade,'
      '        u.descricao as unidade'
      
        '  from  producoes_subprodutos_produtos pd                       ' +
        '             '
      
        '   inner join produtos p on (p.cod_produto = pd.cod_produto)    ' +
        '             '
      
        '   inner join unidades u on (u.cod_unidade = pd.cod_unidade)    ' +
        '             '
      '      where pd.id_producao = 45  and pd.cod_empresa='#39'001'#39' '
      
        '      order by pd.id                                            ' +
        '             ')
    Left = 315
    Top = 153
  end
  object DtQryProdutosOrdemProducao: TfrxDBDataset
    UserName = 'DtQryProdutosOrdemProducao'
    CloseDataSource = False
    FieldAliases.Strings = (
      'ID=ID'
      'ID_PRODUCAO=ID_PRODUCAO'
      'COD_PRODUTO=COD_PRODUTO'
      'DESCRICAO=DESCRICAO'
      'COD_UNIDADE=COD_UNIDADE'
      'QUANTIDADE=QUANTIDADE'
      'UNIDADE=UNIDADE')
    DataSet = qryProdutosOrdemProducao
    BCDToCurrency = False
    DataSetOptions = []
    Left = 313
    Top = 208
  end
  object qryInsumosOrdemProducao: TFDQuery
    FieldOptions.UpdatePersistent = True
    Connection = dm.fdRestaurante
    FormatOptions.AssignedValues = [fvMaxBcdPrecision]
    FormatOptions.MaxBcdPrecision = 20
    SQL.Strings = (
      'select pl.id,                                                   '
      
        '        pl.id_producao,                                         ' +
        '    '
      
        '        pl.cod_empresa,                                         ' +
        '    '
      
        '        pl.cod_produto,                                         ' +
        '    '
      
        '        pd.descricao as produto,                                ' +
        '    '
      '        pl.cod_unidade as codUnidade,'
      '        pl.qtde_calculada as PL,'
      
        '       ((pl.qtde_calculada * 100) / (100 - pd.perc_perda)) as PB' +
        ','
      '        pd.perc_perda,'
      
        '       (((pl.qtde_calculada * 100) / (100 - pd.perc_perda)) - pl' +
        '.qtde_calculada) as PE,'
      '        u.sigla as unidade,'
      
        '        pl.qtde_retirada,                                       ' +
        '    '
      
        '        pl.qtde_utilizada,                                      ' +
        '    '
      
        '        pl.qtde_perda,                                          ' +
        '    '
      
        '        pl.qtde_sobra                                           ' +
        '    '
      
        '       from producoes_lista_insumos  pl                         ' +
        '    '
      
        '        inner join produtos pd on (pd.cod_produto = pl.cod_produ' +
        'to) '
      
        '        inner join unidades u on (u.cod_unidade = pl.cod_unidade' +
        ')   '
      'where pl.id_producao =7 and pl.cod_empresa = '#39'0001'#39' '
      ' order by pd.descricao')
    Left = 456
    Top = 152
  end
  object dtqryInsumosOrdemProducao: TfrxDBDataset
    UserName = 'dtqryInsumosOrdemProducao'
    CloseDataSource = False
    FieldAliases.Strings = (
      'ID=ID'
      'ID_PRODUCAO=ID_PRODUCAO'
      'COD_EMPRESA=COD_EMPRESA'
      'COD_PRODUTO=COD_PRODUTO'
      'PRODUTO=PRODUTO'
      'CODUNIDADE=CODUNIDADE'
      'PL=PL'
      'PB=PB'
      'PERC_PERDA=PERC_PERDA'
      'PE=PE'
      'UNIDADE=UNIDADE'
      'QTDE_RETIRADA=QTDE_RETIRADA'
      'QTDE_UTILIZADA=QTDE_UTILIZADA'
      'QTDE_PERDA=QTDE_PERDA'
      'QTDE_SOBRA=QTDE_SOBRA')
    DataSet = qryInsumosOrdemProducao
    BCDToCurrency = False
    DataSetOptions = []
    Left = 454
    Top = 207
  end
  object tbListagemProducao: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 424
    Top = 32
  end
  object dsInsumosProcessamento: TDataSource
    DataSet = tbInsumosProcessamento
    Left = 656
    Top = 208
  end
  object tbInsumosProcessamento: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 656
    Top = 136
    object tbInsumosProcessamentoID: TLargeintField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object tbInsumosProcessamentoCOD_PRODUTO: TStringField
      FieldName = 'COD_PRODUTO'
      Origin = 'COD_PRODUTO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 5
    end
    object tbInsumosProcessamentoDESCRICAO: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'DESCRICAO'
      Origin = 'DESCRICAO'
      ProviderFlags = []
      ReadOnly = True
      Size = 150
    end
    object tbInsumosProcessamentoCODUNIDADE: TStringField
      FieldName = 'CODUNIDADE'
      Origin = 'COD_UNIDADE'
      Size = 2
    end
    object tbInsumosProcessamentoUNIDADE: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'UNIDADE'
      Origin = 'SIGLA'
      ProviderFlags = []
      ReadOnly = True
      Size = 5
    end
    object tbInsumosProcessamentoPB: TFMTBCDField
      AutoGenerateValue = arDefault
      FieldName = 'PB'
      Origin = 'PB'
      ProviderFlags = []
      ReadOnly = True
      Precision = 18
      Size = 6
    end
    object tbInsumosProcessamentoPERC_PERDA: TFMTBCDField
      AutoGenerateValue = arDefault
      FieldName = 'PERC_PERDA'
      Origin = 'PERC_PERDA'
      ProviderFlags = []
      ReadOnly = True
      Precision = 18
      Size = 3
    end
    object tbInsumosProcessamentoPL: TFMTBCDField
      FieldName = 'PL'
      Origin = 'QTDE_CALCULADA'
      Precision = 18
      Size = 3
    end
    object tbInsumosProcessamentoPE: TFMTBCDField
      AutoGenerateValue = arDefault
      FieldName = 'PE'
      Origin = 'PE'
      ProviderFlags = []
      ReadOnly = True
      Precision = 18
      Size = 6
    end
    object tbInsumosProcessamentoQTDE_RETIRADA: TFMTBCDField
      AutoGenerateValue = arDefault
      FieldName = 'QTDE_RETIRADA'
      Origin = 'QTDE_RETIRADA'
      ProviderFlags = []
      ReadOnly = True
      Precision = 18
      Size = 6
    end
    object tbInsumosProcessamentoQTDE_UTILIZADA: TFMTBCDField
      FieldName = 'QTDE_UTILIZADA'
      Origin = 'QTDE_CALCULADA'
      ProviderFlags = []
      Precision = 18
      Size = 3
    end
    object tbInsumosProcessamentoQTDE_PERDA: TFMTBCDField
      AutoGenerateValue = arDefault
      FieldName = 'QTDE_PERDA'
      Origin = 'QTDE_PERDA'
      ProviderFlags = []
      ReadOnly = True
      Precision = 18
      Size = 6
    end
    object tbInsumosProcessamentoQTDE_SOBRA: TFMTBCDField
      AutoGenerateValue = arDefault
      FieldName = 'QTDE_SOBRA'
      Origin = 'QTDE_SOBRA'
      ProviderFlags = []
      ReadOnly = True
      Precision = 18
      Size = 3
    end
    object tbInsumosProcessamentoPERCENTUAL_PERDA: TFMTBCDField
      AutoGenerateValue = arDefault
      FieldName = 'PERCENTUAL_PERDA'
      Origin = 'PERCENTUAL_PERDA'
      ProviderFlags = []
      ReadOnly = True
      Precision = 18
      Size = 3
    end
    object tbInsumosProcessamentoDESVIO_PERDA: TFMTBCDField
      AutoGenerateValue = arDefault
      FieldName = 'DESVIO_PERDA'
      Origin = 'DESVIO_PERDA'
      ProviderFlags = []
      ReadOnly = True
      Precision = 18
      Size = 3
    end
    object tbInsumosProcessamentoDESVIO_QUANTIDADE: TFMTBCDField
      AutoGenerateValue = arDefault
      FieldName = 'DESVIO_QUANTIDADE'
      Origin = 'DESVIO_QUANTIDADE'
      ProviderFlags = []
      ReadOnly = True
      Precision = 18
      Size = 2
    end
  end
end
