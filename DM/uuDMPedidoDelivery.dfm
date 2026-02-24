object dmPedidoDelivery: TdmPedidoDelivery
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Height = 611
  Width = 871
  object dsObservacoesClientes: TDataSource
    DataSet = tbObservacoesClientes
    Left = 64
    Top = 80
  end
  object dsUltimosPedidos: TDataSource
    DataSet = qryUltimosPedidos
    Left = 216
    Top = 352
  end
  object dsQryItensUltimosPedidos: TDataSource
    DataSet = qryItensUltimosPedidos
    Left = 320
    Top = 352
  end
  object dsFormasPagtoTemp: TDataSource
    DataSet = tbFormasPagamentoTemp
    Left = 314
    Top = 200
  end
  object tbFormasPagamentoTemp: TRxMemoryData
    FieldDefs = <
      item
        Name = 'codForma'
        DataType = ftString
        Size = 3
      end
      item
        Name = 'descricaoForma'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'valorForma'
        DataType = ftCurrency
      end
      item
        Name = 'rp'
        DataType = ftString
        Size = 4
      end>
    Left = 316
    Top = 148
    object tbFormasPagamentoTempcodForma: TStringField
      DisplayWidth = 7
      FieldName = 'codForma'
      Size = 3
    end
    object tbFormasPagamentoTempdescricaoForma: TStringField
      DisplayWidth = 14
      FieldName = 'descricaoForma'
      Size = 15
    end
    object tbFormasPagamentoTempvalorForma: TCurrencyField
      DisplayWidth = 10
      FieldName = 'valorForma'
    end
    object tbFormasPagamentoTemprp: TStringField
      FieldName = 'rp'
      Size = 4
    end
    object tbFormasPagamentoTempoperadoraCartao: TStringField
      FieldName = 'operadoraCartao'
      Size = 25
    end
    object tbFormasPagamentoTempnumeroCartao: TStringField
      FieldName = 'numeroCartao'
      Size = 35
    end
    object tbFormasPagamentoTempvalidadeCartao: TStringField
      FieldName = 'validadeCartao'
      Size = 10
    end
    object tbFormasPagamentoTempcodigoCartao: TStringField
      FieldName = 'codigoCartao'
      Size = 10
    end
    object tbFormasPagamentoTempcodCliFaturamento: TStringField
      FieldName = 'codCliFaturamento'
      Size = 6
    end
    object tbFormasPagamentoTempobsFaturamento: TStringField
      FieldName = 'obsFaturamento'
      Size = 250
    end
  end
  object dsQryTabelaPrecos: TDataSource
    DataSet = tbTabelaDePrecos
    Left = 407
    Top = 80
  end
  object tbCsClientesDelivery: TFDMemTable
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
    Left = 168
    Top = 136
  end
  object dsConsultaClientes: TDataSource
    DataSet = tbCsClientesDelivery
    Left = 168
    Top = 184
  end
  object tbObservacoesClientes: TFDMemTable
    FieldOptions.UpdatePersistent = True
    ObjectView = False
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    FormatOptions.AssignedValues = [fvMaxBcdPrecision]
    FormatOptions.MaxBcdPrecision = 20
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 64
    Top = 32
  end
  object tbTabelaDePrecos: TFDMemTable
    FieldOptions.UpdatePersistent = True
    ObjectView = False
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    FormatOptions.AssignedValues = [fvMaxBcdPrecision]
    FormatOptions.MaxBcdPrecision = 20
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 408
    Top = 24
  end
  object FDGUIxWaitCursor1: TFDGUIxWaitCursor
    Provider = 'Forms'
    Left = 472
    Top = 224
  end
  object dsMovimentoResumido: TDataSource
    DataSet = tbMovimentoResumido
    Left = 457
    Top = 399
  end
  object qryUltimosPedidos: TFDQuery
    Connection = dm.fdRestaurante
    SQL.Strings = (
      
        'select first 20 p.codigo, p.data, p.hora, p.nome_entregador, p.v' +
        'alor_total '
      '   from pedidos_delivery p'
      '  where p.cod_cliente='#39'01292'#39
      '    order by p.codigo desc')
    Left = 216
    Top = 296
  end
  object qryItensUltimosPedidos: TFDQuery
    Connection = dm.fdRestaurante
    Left = 320
    Top = 296
  end
  object tbMovimentoResumido: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 456
    Top = 352
  end
  object qryCsFormasPagamento: TFDQuery
    Active = True
    Connection = dm.fdRestaurante
    SQL.Strings = (
      ' select * from formas_pagamento fp'
      ' where fp.desativada=0'
      ' and fp.delivery=1'
      ' order by fp.descricao')
    Left = 74
    Top = 500
  end
  object dsQryCsFormasPagamento: TDataSource
    DataSet = qryCsFormasPagamento
    Left = 231
    Top = 497
  end
  object qryMesasAbertas: TFDQuery
    Active = True
    Connection = dm.fdRestaurante
    SQL.Strings = (
      '   select distinct ms.cod_mesa cod_mesa  from movimento_mesa ms'
      '    where ms.cod_mesa not in'
      '    ('
      
        '      select distinct cf.cod_mesa_delivery from configuracoes_es' +
        'tacao cf'
      '        union all'
      '      select distinct cf.cod_mesa from configuracoes_estacao cf'
      '     )')
    Left = 372
    Top = 503
  end
  object dsQryMesasAbertas: TDataSource
    DataSet = qryMesasAbertas
    Left = 508
    Top = 500
  end
end
