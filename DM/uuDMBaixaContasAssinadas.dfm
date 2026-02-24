object dmBaixaContasAssinadas: TdmBaixaContasAssinadas
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Height = 589
  Width = 790
  object qryFaturas: TFDQuery
    Connection = dm.fdRestaurante
    SQL.Strings = (
      ''
      ''
      ''
      ' select'
      
        '   f.cod_empresa,f.cod_cli,f.cod_fatura, f.data_fatura, f.data_v' +
        'encimento,'
      '   coalesce(c.razao_social, c.nome_fantasia) as nome,'
      '   f.data_vencimento,f.valor_fatura,f.valor_pago,'
      '   (f.valor_fatura - f.valor_pago) as valor_pendente,'
      '   f.usuario_inclusao,'
      
        '   f.cod_venda,v.hora, v.valor_total, v.cod_caixa, v.numero_nfce' +
        ',v.chave_nfce'
      '  from faturas f'
      
        '   inner join vendas v on (v.cod_empresa = f.cod_empresa and v.c' +
        'od_venda = f.cod_venda)'
      '   inner join clientes c on (c.cod_cli = f.cod_cli)'
      ''
      ''
      ''
      ''
      '')
    Left = 88
    Top = 112
  end
  object dsQryFaturas: TDataSource
    DataSet = qryFaturas
    Left = 160
    Top = 112
  end
  object qryCsFormasPagamento: TFDQuery
    Connection = dm.fdRestaurante
    SQL.Strings = (
      ' select * from formas_pagamento fp'
      ' where fp.desativada=0'
      'and fp.tipo <> 2'
      ' order by fp.descricao')
    Left = 74
    Top = 500
  end
  object dsQryCsFormasPagamento: TDataSource
    DataSet = qryCsFormasPagamento
    Left = 231
    Top = 497
  end
end
