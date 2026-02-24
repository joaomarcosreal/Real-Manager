object dmInventarios: TdmInventarios
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Height = 476
  Width = 734
  object qryHistoricosInventarios: TFDQuery
    FieldOptions.UpdatePersistent = True
    Connection = dm.fdRestaurante
    FormatOptions.AssignedValues = [fvMaxBcdPrecision]
    FormatOptions.MaxBcdPrecision = 20
    SQL.Strings = (
      'select * from historicos_inventario'
      ' order by codigo')
    Left = 48
    Top = 8
  end
  object dsQryHistoricosInventario: TDataSource
    DataSet = qryHistoricosInventarios
    Left = 48
    Top = 64
  end
  object tbItensInventarioTemp: TFDMemTable
    BeforePost = tbItensInventarioTempBeforePost
    FieldOptions.UpdatePersistent = True
    FieldDefs = <>
    IndexDefs = <>
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    FormatOptions.AssignedValues = [fvMaxBcdPrecision]
    FormatOptions.MaxBcdPrecision = 20
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    StoreDefs = True
    Left = 48
    Top = 144
    object tbItensInventarioTempsel: TBooleanField
      FieldName = 'sel'
    end
    object tbItensInventarioTempCOD_PRODUTO: TStringField
      FieldName = 'COD_PRODUTO'
      Size = 5
    end
    object tbItensInventarioTempDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 120
    end
    object tbItensInventarioTempQTDE_APURADA: TBCDField
      FieldName = 'QTDE_APURADA'
      Precision = 18
      Size = 3
    end
    object tbItensInventarioTempAJUSTE: TBCDField
      FieldName = 'AJUSTE'
      Precision = 18
      Size = 3
    end
    object tbItensInventarioTempCOD_UNIDADE: TStringField
      FieldName = 'COD_UNIDADE'
      Size = 2
    end
    object tbItensInventarioTempDESC_UNIDADE: TStringField
      FieldName = 'DESC_UNIDADE'
      Size = 25
    end
    object tbItensInventarioTempCUSTO: TCurrencyField
      FieldName = 'CUSTO'
    end
    object tbItensInventarioTempTOTAL_AJUSTE: TCurrencyField
      FieldName = 'VALOR_AJUSTE'
    end
    object tbItensInventarioTempQTDE_SISTEMA: TBCDField
      FieldName = 'QTDE_SISTEMA'
    end
    object tbItensInventarioTempTOTAL_ESTOQUE: TCurrencyField
      FieldName = 'TOTAL_ESTOQUE'
    end
  end
  object qryCsProdutos: TFDQuery
    FieldOptions.UpdatePersistent = True
    Connection = dm.fdRestaurante
    FormatOptions.AssignedValues = [fvMaxBcdPrecision]
    FormatOptions.MaxBcdPrecision = 20
    SQL.Strings = (
      ''
      ''
      'select cod_produto, descricao, estoque_atual,'
      '       case when qtdComposicoes > 0 then'
      
        '         (select sum(custo_baixa) from  calcula_custo_produto_no' +
        'vo(cod_produto,cod_produto,1))'
      '        else'
      '          valor_custo'
      '       end as valor_custo,'
      '       valor_estoque, cod_unidade, descricao_unidade, grupo'
      '  from ('
      ''
      
        '  select p.cod_produto, p.descricao, (p.estoque_liquido / un.par' +
        'ametro) as estoque_atual,'
      
        '    p.valor_custo,((p.estoque_liquido / un.parametro) * p.valor_' +
        'custo) as valor_estoque, un.cod_unidade,'
      
        '   (select count(*) from composicoes_produto cp where cp.cod_pro' +
        'duto = p.cod_produto) as qtdComposicoes,'
      '   un.descricao as descricao_unidade, gp.descricao as grupo'
      '    from produtos p'
      
        '      inner join unidades un on ( un.cod_unidade = p.unidade_ent' +
        'rada)'
      '      inner join grupos gp on (gp.cod_grupo = p.cod_grupo)'
      '      where p.compra = 1'
      ' order by p.descricao'
      '        )')
    Left = 184
    Top = 8
    object qryCsProdutosCOD_PRODUTO: TStringField
      FieldName = 'COD_PRODUTO'
      Origin = 'COD_PRODUTO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 5
    end
    object qryCsProdutosDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = 'DESCRICAO'
      Required = True
      Size = 150
    end
    object qryCsProdutosESTOQUE_ATUAL: TFMTBCDField
      AutoGenerateValue = arDefault
      FieldName = 'ESTOQUE_ATUAL'
      Origin = 'ESTOQUE_ATUAL'
      ProviderFlags = []
      ReadOnly = True
      Precision = 18
      Size = 5
    end
    object qryCsProdutosVALOR_CUSTO: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'VALOR_CUSTO'
      Origin = 'VALOR_CUSTO'
      ProviderFlags = []
      ReadOnly = True
      Precision = 18
      Size = 3
    end
    object qryCsProdutosVALOR_ESTOQUE: TFMTBCDField
      AutoGenerateValue = arDefault
      FieldName = 'VALOR_ESTOQUE'
      Origin = 'VALOR_ESTOQUE'
      ProviderFlags = []
      ReadOnly = True
      Precision = 18
      Size = 7
    end
    object qryCsProdutosCOD_UNIDADE: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'COD_UNIDADE'
      Origin = 'COD_UNIDADE'
      ProviderFlags = []
      ReadOnly = True
      Size = 2
    end
    object qryCsProdutosDESCRICAO_UNIDADE: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'DESCRICAO_UNIDADE'
      Origin = 'DESCRICAO'
      ProviderFlags = []
      ReadOnly = True
      Size = 25
    end
    object qryCsProdutosGRUPO: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'GRUPO'
      Origin = 'DESCRICAO'
      ProviderFlags = []
      ReadOnly = True
      Size = 30
    end
  end
  object dsItensIventario: TDataSource
    DataSet = tbItensInventarioTemp
    Left = 48
    Top = 208
  end
  object dsQryCsProdutos: TDataSource
    DataSet = qryCsProdutos
    Left = 184
    Top = 64
  end
  object qryInventarios: TFDQuery
    FieldOptions.UpdatePersistent = True
    Connection = dm.fdRestaurante
    FormatOptions.AssignedValues = [fvMaxBcdPrecision]
    FormatOptions.MaxBcdPrecision = 20
    SQL.Strings = (
      'select * from inventarios')
    Left = 288
    Top = 8
    object qryInventariosCODIGO: TLargeintField
      FieldName = 'CODIGO'
      Origin = 'CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryInventariosDATA_INVENTARIO: TDateField
      FieldName = 'DATA_INVENTARIO'
      Origin = 'DATA_INVENTARIO'
    end
    object qryInventariosDATA_SISTEMA: TDateField
      FieldName = 'DATA_SISTEMA'
      Origin = 'DATA_SISTEMA'
    end
    object qryInventariosCOD_HISTORICO: TIntegerField
      FieldName = 'COD_HISTORICO'
      Origin = 'COD_HISTORICO'
    end
    object qryInventariosCOD_USUARIO: TStringField
      FieldName = 'COD_USUARIO'
      Origin = 'COD_USUARIO'
      Size = 3
    end
    object qryInventariosNOME_USUARIO: TStringField
      FieldName = 'NOME_USUARIO'
      Origin = 'NOME_USUARIO'
      Size = 15
    end
    object qryInventariosTOTAL_PERDAS: TBCDField
      FieldName = 'TOTAL_PERDAS'
      Origin = 'TOTAL_PERDAS'
      Precision = 18
      Size = 2
    end
    object qryInventariosTOTAL_INVENTARIO: TBCDField
      FieldName = 'TOTAL_INVENTARIO'
      Origin = 'TOTAL_INVENTARIO'
      Precision = 18
      Size = 2
    end
    object qryInventariosCOD_EMPRESA: TIntegerField
      FieldName = 'COD_EMPRESA'
      Origin = 'COD_EMPRESA'
    end
    object qryInventariosOBS: TStringField
      FieldName = 'OBS'
      Origin = 'OBS'
      Size = 250
    end
    object qryInventariosDATA_HORA_SO: TSQLTimeStampField
      FieldName = 'DATA_HORA_SO'
      Origin = 'DATA_HORA_SO'
    end
    object qryInventariosTOTAL_SOBRAS: TBCDField
      FieldName = 'TOTAL_SOBRAS'
      Origin = 'TOTAL_SOBRAS'
      Precision = 18
      Size = 3
    end
  end
  object qryItensInventario: TFDQuery
    FieldOptions.UpdatePersistent = True
    Connection = dm.fdRestaurante
    FormatOptions.AssignedValues = [fvMaxBcdPrecision]
    FormatOptions.MaxBcdPrecision = 20
    SQL.Strings = (
      'select * from itens_inventario')
    Left = 376
    Top = 8
    object qryItensInventarioCODIGO: TLargeintField
      FieldName = 'CODIGO'
      Origin = 'CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryItensInventarioCOD_INVENTARIO: TLargeintField
      FieldName = 'COD_INVENTARIO'
      Origin = 'COD_INVENTARIO'
      Required = True
    end
    object qryItensInventarioCOD_PRODUTO: TStringField
      FieldName = 'COD_PRODUTO'
      Origin = 'COD_PRODUTO'
      Required = True
      Size = 5
    end
    object qryItensInventarioESTOQUE_SISTEMA: TFMTBCDField
      FieldName = 'ESTOQUE_SISTEMA'
      Origin = 'ESTOQUE_SISTEMA'
      Precision = 18
      Size = 5
    end
    object qryItensInventarioESTOQUE_APURADO: TFMTBCDField
      FieldName = 'ESTOQUE_APURADO'
      Origin = 'ESTOQUE_APURADO'
      Precision = 18
      Size = 5
    end
    object qryItensInventarioCOD_UNIDADE: TStringField
      FieldName = 'COD_UNIDADE'
      Origin = 'COD_UNIDADE'
      Size = 2
    end
    object qryItensInventarioCUSTO: TBCDField
      FieldName = 'CUSTO'
      Origin = 'CUSTO'
      Precision = 18
      Size = 2
    end
    object qryItensInventarioAJUSTE: TBCDField
      FieldName = 'AJUSTE'
      Origin = 'AJUSTE'
      Precision = 18
      Size = 3
    end
    object qryItensInventarioTOTAL_INVENTARIO: TBCDField
      FieldName = 'TOTAL_INVENTARIO'
      Origin = 'TOTAL_INVENTARIO'
      Precision = 18
      Size = 2
    end
  end
  object qryCsProdutosPorGrupo: TFDQuery
    FieldOptions.UpdatePersistent = True
    Connection = dm.fdRestaurante
    FormatOptions.AssignedValues = [fvMaxBcdPrecision]
    FormatOptions.MaxBcdPrecision = 20
    SQL.Strings = (
      'select cod_produto, descricao, estoque_atual,'
      '       case when qtdComposicoes > 0 then'
      
        '         (select sum(custo_baixa) from  calcula_custo_produto_no' +
        'vo(cod_produto,cod_produto,1))'
      '        else'
      '          valor_custo'
      '       end as valor_custo,'
      '       valor_estoque, cod_unidade, descricao_unidade, grupo'
      '  from ('
      ''
      
        '  select p.cod_produto, p.descricao, (p.estoque_liquido / un.par' +
        'ametro) as estoque_atual,'
      
        '   (select count(*) from composicoes_produto cp where cp.cod_pro' +
        'duto = p.cod_produto) as qtdComposicoes,'
      
        '   p.valor_custo, ((p.estoque_liquido / un.parametro) * p.valor_' +
        'custo) as valor_estoque, un.cod_unidade,'
      '   un.descricao as descricao_unidade, gp.descricao as grupo'
      '    from produtos p'
      
        '      inner join unidades un on ( un.cod_unidade = p.unidade_ent' +
        'rada)'
      '      inner join grupos gp on (gp.cod_grupo = p.cod_grupo)'
      '      where p.compra = 1 and p.cod_grupo like :vpCodGrupo||'#39'%'#39
      '  '
      ' order by p.descricao'
      ' )')
    Left = 488
    Top = 8
    ParamData = <
      item
        Name = 'VPCODGRUPO'
        DataType = ftString
        ParamType = ptInput
        Size = 6
        Value = ''
      end>
    object qryCsProdutosPorGrupoCOD_PRODUTO: TStringField
      FieldName = 'COD_PRODUTO'
      Origin = 'COD_PRODUTO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 5
    end
    object qryCsProdutosPorGrupoDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = 'DESCRICAO'
      Required = True
      Size = 150
    end
    object qryCsProdutosPorGrupoESTOQUE_ATUAL: TFMTBCDField
      AutoGenerateValue = arDefault
      FieldName = 'ESTOQUE_ATUAL'
      Origin = 'ESTOQUE_ATUAL'
      ProviderFlags = []
      ReadOnly = True
      Precision = 18
      Size = 5
    end
    object qryCsProdutosPorGrupoVALOR_CUSTO: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'VALOR_CUSTO'
      Origin = 'VALOR_CUSTO'
      ProviderFlags = []
      ReadOnly = True
      Precision = 18
      Size = 3
    end
    object qryCsProdutosPorGrupoVALOR_ESTOQUE: TFMTBCDField
      AutoGenerateValue = arDefault
      FieldName = 'VALOR_ESTOQUE'
      Origin = 'VALOR_ESTOQUE'
      ProviderFlags = []
      ReadOnly = True
      Precision = 18
      Size = 7
    end
    object qryCsProdutosPorGrupoCOD_UNIDADE: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'COD_UNIDADE'
      Origin = 'COD_UNIDADE'
      ProviderFlags = []
      ReadOnly = True
      Size = 2
    end
    object qryCsProdutosPorGrupoDESCRICAO_UNIDADE: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'DESCRICAO_UNIDADE'
      Origin = 'DESCRICAO'
      ProviderFlags = []
      ReadOnly = True
      Size = 25
    end
    object qryCsProdutosPorGrupoGRUPO: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'GRUPO'
      Origin = 'DESCRICAO'
      ProviderFlags = []
      ReadOnly = True
      Size = 30
    end
  end
  object qryHistoricosBaixaEstoque: TFDQuery
    FieldOptions.UpdatePersistent = True
    Connection = dm.fdRestaurante
    FormatOptions.AssignedValues = [fvMaxBcdPrecision]
    FormatOptions.MaxBcdPrecision = 20
    SQL.Strings = (
      ''
      ''
      '  select * from tipos_baixa tp'
      '   order by tp.descricao ')
    Left = 168
    Top = 152
    object qryHistoricosBaixaEstoqueCOD_TIPO: TStringField
      FieldName = 'COD_TIPO'
      Origin = 'COD_TIPO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 3
    end
    object qryHistoricosBaixaEstoqueDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = 'DESCRICAO'
      Size = 40
    end
  end
  object dsQryHistoricosBaixaEstoque: TDataSource
    DataSet = qryHistoricosBaixaEstoque
    Left = 168
    Top = 208
  end
  object qryUnidadesMedidaProduto: TFDQuery
    FieldOptions.UpdatePersistent = True
    Connection = dm.fdRestaurante
    FormatOptions.AssignedValues = [fvMaxBcdPrecision]
    FormatOptions.MaxBcdPrecision = 20
    SQL.Strings = (
      ''
      'select * from unidades un'
      ' where un.cod_unidade in ('
      '     select distinct unidade from ('
      '      select p.unidade_entrada as unidade from produtos p'
      '        where p.cod_produto= :codProduto'
      '       union all'
      '      select p.cod_unidade_fracao as unidade  from produtos p'
      '        where p.cod_produto= :codProduto'
      '           )'
      '          )')
    Left = 328
    Top = 160
    ParamData = <
      item
        Name = 'CODPRODUTO'
        DataType = ftString
        ParamType = ptInput
        Size = 5
      end>
    object qryUnidadesMedidaProdutoCOD_UNIDADE: TStringField
      FieldName = 'COD_UNIDADE'
      Origin = 'COD_UNIDADE'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 2
    end
    object qryUnidadesMedidaProdutoDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = 'DESCRICAO'
      Size = 25
    end
    object qryUnidadesMedidaProdutoSIGLA: TStringField
      FieldName = 'SIGLA'
      Origin = 'SIGLA'
      Size = 5
    end
    object qryUnidadesMedidaProdutoPARAMETRO: TBCDField
      FieldName = 'PARAMETRO'
      Origin = 'PARAMETRO'
      Precision = 18
      Size = 3
    end
    object qryUnidadesMedidaProdutoCOD_PADRAO: TStringField
      FieldName = 'COD_PADRAO'
      Origin = 'COD_PADRAO'
      Size = 2
    end
  end
  object dsQryUnidadeMedidaProduto: TDataSource
    DataSet = qryUnidadesMedidaProduto
    Left = 328
    Top = 216
  end
  object dsTbItensBaixaTemp: TDataSource
    DataSet = tbItensBaixaTemp
    Left = 464
    Top = 216
  end
  object tbItensBaixaTemp: TFDMemTable
    FieldOptions.UpdatePersistent = True
    FieldDefs = <>
    IndexDefs = <>
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    FormatOptions.AssignedValues = [fvMaxBcdPrecision]
    FormatOptions.MaxBcdPrecision = 20
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    StoreDefs = True
    Left = 464
    Top = 160
    object tbItensBaixaTempCOD_PRODUTO: TStringField
      FieldName = 'COD_PRODUTO'
      Size = 5
    end
    object tbItensBaixaTempDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 120
    end
    object tbItensBaixaTempQTDE_APURADA: TBCDField
      FieldName = 'QTDE_APURADA'
      Precision = 18
      Size = 3
    end
    object tbItensBaixaTempTOTAL_ESTOQUE: TCurrencyField
      FieldName = 'TOTAL_ESTOQUE'
    end
    object tbItensBaixaTempCOD_UNIDADE_BAIXA: TStringField
      FieldName = 'COD_UNIDADE_BAIXA'
      Size = 2
    end
    object tbItensBaixaTempDESC_UNIDADE_BAIXA: TStringField
      FieldName = 'DESC_UNIDADE_BAIXA'
      Size = 25
    end
    object tbItensBaixaTempCUSTO: TFloatField
      FieldName = 'CUSTO'
    end
  end
  object qryItensBaixaEstoque: TFDQuery
    FieldOptions.UpdatePersistent = True
    Connection = dm.fdRestaurante
    FormatOptions.AssignedValues = [fvMaxBcdPrecision]
    FormatOptions.MaxBcdPrecision = 20
    SQL.Strings = (
      'select * from baixas_estoque')
    Left = 544
    Top = 304
    object qryItensBaixaEstoqueCOD_BAIXA: TStringField
      FieldName = 'COD_BAIXA'
      Origin = 'COD_BAIXA'
      Required = True
      Size = 6
    end
    object qryItensBaixaEstoqueCOD_TIPO: TStringField
      FieldName = 'COD_TIPO'
      Origin = 'COD_TIPO'
      Required = True
      Size = 3
    end
    object qryItensBaixaEstoqueCOD_ITEM: TStringField
      FieldName = 'COD_ITEM'
      Origin = 'COD_ITEM'
      Required = True
      Size = 5
    end
    object qryItensBaixaEstoqueCOD_UNIDADE: TStringField
      FieldName = 'COD_UNIDADE'
      Origin = 'COD_UNIDADE'
      Required = True
      Size = 2
    end
    object qryItensBaixaEstoqueQUANTIDADE: TFMTBCDField
      FieldName = 'QUANTIDADE'
      Origin = 'QUANTIDADE'
      Precision = 18
      Size = 5
    end
    object qryItensBaixaEstoqueDATA: TDateField
      FieldName = 'DATA'
      Origin = '"DATA"'
    end
    object qryItensBaixaEstoqueHORA: TTimeField
      FieldName = 'HORA'
      Origin = 'HORA'
    end
    object qryItensBaixaEstoqueOBSERVACOES: TStringField
      FieldName = 'OBSERVACOES'
      Origin = 'OBSERVACOES'
      Size = 200
    end
    object qryItensBaixaEstoqueUSUARIO: TStringField
      FieldName = 'USUARIO'
      Origin = 'USUARIO'
      Required = True
      Size = 40
    end
    object qryItensBaixaEstoqueESTOQUE_ANTERIOR: TBCDField
      FieldName = 'ESTOQUE_ANTERIOR'
      Origin = 'ESTOQUE_ANTERIOR'
      Required = True
      Precision = 18
      Size = 2
    end
    object qryItensBaixaEstoqueESTOQUE_ATUALIZADO: TBCDField
      FieldName = 'ESTOQUE_ATUALIZADO'
      Origin = 'ESTOQUE_ATUALIZADO'
      Required = True
      Precision = 18
      Size = 2
    end
    object qryItensBaixaEstoqueCUSTO_UNITARIO_ITEM: TBCDField
      FieldName = 'CUSTO_UNITARIO_ITEM'
      Origin = 'CUSTO_UNITARIO_ITEM'
      Required = True
      Precision = 18
      Size = 2
    end
    object qryItensBaixaEstoqueID: TLargeintField
      FieldName = 'ID'
      Origin = 'ID'
      Required = True
    end
    object qryItensBaixaEstoqueDATA_SO: TSQLTimeStampField
      FieldName = 'DATA_SO'
      Origin = 'DATA_SO'
    end
    object qryItensBaixaEstoqueCOD_ORIGEM: TSmallintField
      FieldName = 'COD_ORIGEM'
      Origin = 'COD_ORIGEM'
      Required = True
    end
    object qryItensBaixaEstoqueTIPO_MOVIMENTACAO: TSmallintField
      FieldName = 'TIPO_MOVIMENTACAO'
      Origin = 'TIPO_MOVIMENTACAO'
    end
    object qryItensBaixaEstoqueID_PRODUCAO: TLargeintField
      FieldName = 'ID_PRODUCAO'
      Origin = 'ID_PRODUCAO'
    end
  end
end
