object dmInventarios: TdmInventarios
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 476
  Width = 734
  object qryHistoricosInventarios: TFDQuery
    Connection = dm.fdRestaurante
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
    FieldDefs = <>
    IndexDefs = <>
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    StoreDefs = True
    Left = 48
    Top = 144
    object tbItensInventarioTempCOD_PRODUTO: TStringField
      FieldName = 'COD_PRODUTO'
      Size = 5
    end
    object tbItensInventarioTempDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 120
    end
    object tbItensInventarioTempQTDE_SISTEMA: TBCDField
      FieldName = 'QTDE_SISTEMA'
      Precision = 18
      Size = 3
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
    object tbItensInventarioTempESTOQUE_FINAL: TBCDField
      FieldName = 'ESTOQUE_FINAL'
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
  end
  object qryCsProdutos: TFDQuery
    Connection = dm.fdRestaurante
    SQL.Strings = (
      ''
      
        '  select p.cod_produto, p.descricao, (p.estoque_liquido / un.par' +
        'ametro) as estoque_atual,'
      
        '   p.valor_custo, ((p.estoque_liquido / un.parametro) * p.valor_' +
        'custo) as valor_estoque,'
      '   un.descricao as descricao_unidade, gp.descricao as grupo'
      '    from produtos p'
      
        '      inner join unidades un on ( un.cod_unidade = p.unidade_ent' +
        'rada)'
      '      inner join grupos gp on (gp.cod_grupo = p.cod_grupo)'
      '      where p.compra = 1'
      '  '
      ' order by p.descricao')
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
      Size = 80
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
    object qryCsProdutosVALOR_CUSTO: TBCDField
      FieldName = 'VALOR_CUSTO'
      Origin = 'VALOR_CUSTO'
      Required = True
      Precision = 18
      Size = 2
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
  end
  object dsItensIventario: TDataSource
    DataSet = tbItensInventarioTemp
    Left = 48
    Top = 192
  end
  object dsQryCsProdutos: TDataSource
    DataSet = qryCsProdutos
    Left = 184
    Top = 64
  end
end
