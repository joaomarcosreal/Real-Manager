object dm_relatorios: Tdm_relatorios
  OldCreateOrder = False
  Height = 718
  Width = 1278
  object ds_parametros: TDataSource
    DataSet = dm.tb_parametros
    Left = 200
    Top = 8
  end
  object qryEstornosCaixa: TIBQuery
    Database = dm.dbrestaurante
    Transaction = dm.transacao
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      ''
      ''
      'select  es.*, (es.valor_unitario * es.quantidade) as total'
      '  from estornos es'
      '  where es.cod_caixa='#39'01348'#39)
    Left = 32
    Top = 359
  end
  object dtProdutos: TfrxDBDataset
    UserName = 'dtProdutos'
    CloseDataSource = False
    BCDToCurrency = False
    Left = 696
    Top = 48
  end
  object qryParametros: TIBQuery
    Database = dm.dbrestaurante
    Transaction = dm.transacao
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      ''
      'select * from parametros')
    Left = 852
    Top = 73
  end
  object dtBairros: TfrxDBDataset
    UserName = 'dtBairros'
    CloseDataSource = False
    DataSet = dm.qryBairro
    BCDToCurrency = False
    Left = 792
    Top = 24
  end
  object dtParametros: TfrxDBDataset
    UserName = 'dtParametros'
    CloseDataSource = False
    DataSet = qryParametros
    BCDToCurrency = False
    Left = 848
    Top = 24
  end
  object qryRelatorioMargemProdutos: TIBQuery
    Database = dm.dbrestaurante
    Transaction = dm.transacao
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      ''
      ''
      
        'select  pm.cod_produto,ip.cod_barras,ip.cod_g_raiz,ip.desc_g_rai' +
        'z, ip.cod_g_pai, ip.desc_g_pai, ip.cod_grupo, ip.desc_grupo,'
      
        '       pm.descricao, pm.quantidade_contagem,pm.valor_unitario, p' +
        'm.custodigitado as custoUnitario,pm.custoproduto as custoTotal,'
      
        '       pm.lucroreal as lucroUnitario,pm.lucrototal as lucroTotal' +
        ', pm.total , pm.percentuallucro, pm.totalvendas, pm.percentualPr' +
        'oduto'
      
        '       from produtosvendidoscommargem('#39'01.01.2009'#39','#39'30.12.2009'#39',' +
        #39#39') pm'
      
        '       inner join r_informacoes_produto ip on (ip.cod_produto = ' +
        'pm.cod_produto) order by ip.cod_grupo')
    Left = 170
    Top = 450
  end
  object dtRelatorioMargemProdutos: TfrxDBDataset
    UserName = 'dtRelatorioMargemProdutos'
    CloseDataSource = False
    FieldAliases.Strings = (
      'COD_PRODUTO=COD_PRODUTO'
      'COD_BARRAS=COD_BARRAS'
      'COD_G_RAIZ=COD_G_RAIZ'
      'DESC_G_RAIZ=DESC_G_RAIZ'
      'COD_G_PAI=COD_G_PAI'
      'DESC_G_PAI=DESC_G_PAI'
      'COD_GRUPO=COD_GRUPO'
      'DESC_GRUPO=DESC_GRUPO'
      'DESCRICAO=DESCRICAO'
      'QUANTIDADE_CONTAGEM=QUANTIDADE_CONTAGEM'
      'VALOR_UNITARIO=VALOR_UNITARIO'
      'CUSTOUNITARIO=CUSTOUNITARIO'
      'CUSTOTOTAL=CUSTOTOTAL'
      'LUCROUNITARIO=LUCROUNITARIO'
      'LUCROTOTAL=LUCROTOTAL'
      'TOTAL=TOTAL'
      'PERCENTUALLUCRO=PERCENTUALLUCRO'
      'TOTALVENDAS=TOTALVENDAS'
      'PERCENTUALPRODUTO=PERCENTUALPRODUTO')
    DataSet = qryRelatorioMargemProdutos
    BCDToCurrency = False
    Left = 206
    Top = 449
  end
  object qryClientesAniversariantes: TIBQuery
    Database = dm.dbrestaurante
    Transaction = dm.transacao
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      
        'select c.cod_cli, c.razao_social as nome , c.dtnascimento, c.ema' +
        'il, c.telefone, ( Extract( day from    dtnascimento)||'#39'/'#39'|| Extr' +
        'act(month from   dtnascimento)) as aniversario,'
      
        'Extract(month from   dtnascimento) as mes,  udf_day(dtNascimento' +
        ') as dia,   upper(udf_monthname(dtnascimento)) as nomeMes, udf_a' +
        'ge(dtnascimento) as idade'
      '    from clientes c'
      '    where  Extract(month from   dtnascimento)  between 01 and 12'
      '    order by dia')
    Left = 172
    Top = 494
  end
  object dtClientesAniversariantes: TfrxDBDataset
    UserName = 'dtClientesAniversariantes'
    CloseDataSource = False
    FieldAliases.Strings = (
      'COD_CLI=COD_CLI'
      'NOME=NOME'
      'DTNASCIMENTO=DTNASCIMENTO'
      'EMAIL=EMAIL'
      'TELEFONE=TELEFONE'
      'ANIVERSARIO=ANIVERSARIO'
      'MES=MES'
      'DIA=DIA'
      'NOMEMES=NOMEMES'
      'IDADE=IDADE')
    DataSet = qryClientesAniversariantes
    BCDToCurrency = False
    Left = 208
    Top = 494
  end
  object qryConsumoClientes: TIBQuery
    Database = dm.dbrestaurante
    Transaction = dm.transacao
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      ''
      
        'select cm.cartao, c.razao_social,  cm.total_consumo, c.telefone ' +
        'from consumoatualclientes cm'
      '  inner join clientes c on (c.cod_cli = cm.cod_cli)')
    Left = 174
    Top = 538
  end
  object dtConsumoClientes: TfrxDBDataset
    UserName = 'dtConsumoClientes'
    CloseDataSource = False
    FieldAliases.Strings = (
      'CARTAO=CARTAO'
      'RAZAO_SOCIAL=RAZAO_SOCIAL'
      'TOTAL_CONSUMO=TOTAL_CONSUMO'
      'TELEFONE=TELEFONE')
    DataSet = qryConsumoClientes
    BCDToCurrency = False
    Left = 210
    Top = 537
  end
  object qryConferenciaCaixa: TIBQuery
    Database = dm.dbrestaurante
    Transaction = dm.transacao
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      ''
      ''
      ' select fp.descricao , ap.*  from apuracao_caixa ap'
      '  join formas_pagamento fp on (fp.cod_forma = ap.cod_forma)'
      '   where ap.cod_caixa='#39'00457'#39)
    Left = 177
    Top = 583
  end
  object dtConferenciaCAixa: TfrxDBDataset
    UserName = 'dtConferenciaCaixa'
    CloseDataSource = False
    FieldAliases.Strings = (
      'CARTAO=CARTAO'
      'RAZAO_SOCIAL=RAZAO_SOCIAL'
      'TOTAL_CONSUMO=TOTAL_CONSUMO'
      'TELEFONE=TELEFONE')
    DataSet = qryConferenciaCaixa
    BCDToCurrency = False
    Left = 208
    Top = 584
  end
  object qryClientesPedidosDelivery: TIBQuery
    Database = dm.dbrestaurante
    Transaction = dm.transacao
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      'select * from clientes_delivery')
    Left = 168
    Top = 312
    object qryClientesPedidosDeliveryCODIGO: TIBStringField
      FieldName = 'CODIGO'
      Origin = 'CLIENTES_DELIVERY.CODIGO'
      Required = True
      Size = 5
    end
    object qryClientesPedidosDeliveryNOME: TIBStringField
      FieldName = 'NOME'
      Origin = 'CLIENTES_DELIVERY.NOME'
      Size = 60
    end
    object qryClientesPedidosDeliveryTELEFONE: TIBStringField
      FieldName = 'TELEFONE'
      Origin = 'CLIENTES_DELIVERY.TELEFONE'
      Size = 12
    end
    object qryClientesPedidosDeliverySEXO: TIBStringField
      FieldName = 'SEXO'
      Origin = 'CLIENTES_DELIVERY.SEXO'
      Size = 2
    end
    object qryClientesPedidosDeliveryENDERECO: TIBStringField
      FieldName = 'ENDERECO'
      Origin = 'CLIENTES_DELIVERY.ENDERECO'
      Size = 255
    end
    object qryClientesPedidosDeliveryCOD_BAIRRO: TIntegerField
      FieldName = 'COD_BAIRRO'
      Origin = 'CLIENTES_DELIVERY.COD_BAIRRO'
      Required = True
    end
    object qryClientesPedidosDeliveryCOMPLEMENTO: TIBStringField
      FieldName = 'COMPLEMENTO'
      Origin = 'CLIENTES_DELIVERY.COMPLEMENTO'
      Required = True
      Size = 100
    end
    object qryClientesPedidosDeliveryREFERENCIA1: TIBStringField
      FieldName = 'REFERENCIA1'
      Origin = 'CLIENTES_DELIVERY.REFERENCIA1'
      Required = True
      Size = 100
    end
    object qryClientesPedidosDeliveryREFERENCIA2: TIBStringField
      FieldName = 'REFERENCIA2'
      Origin = 'CLIENTES_DELIVERY.REFERENCIA2'
      Required = True
      Size = 100
    end
  end
  object qryProdutosVendidosCaixa: TIBQuery
    Database = dm.dbrestaurante
    Transaction = dm.transacao
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      
        'select  pm.*, udf_roundabnt ( (pm.quantidade_real  * pm.valor_un' +
        'itario),2) as tot,'
      
        '       ip.cod_barras,ip.cod_g_raiz,ip.desc_g_raiz, ip.cod_g_pai,' +
        ' ip.desc_g_pai, ip.cod_grupo, ip.desc_grupo'
      '       from produtosvendidosCaixa('#39'06.05.2018'#39','#39#39','#39#39') pm '
      
        '       inner join r_informacoes_produto ip on (ip.cod_produto = ' +
        'pm.cod_produto) order by ip.cod_grupo'
      '')
    Left = 30
    Top = 402
    object qryProdutosVendidosCaixaCOD_PRODUTO: TIBStringField
      FieldName = 'COD_PRODUTO'
      Origin = '"PRODUTOSVENDIDOSCAIXA"."COD_PRODUTO"'
      Size = 5
    end
    object qryProdutosVendidosCaixaCOD_GRUPO: TIBStringField
      FieldName = 'COD_GRUPO'
      Origin = '"PRODUTOSVENDIDOSCAIXA"."COD_GRUPO"'
      Size = 6
    end
    object qryProdutosVendidosCaixaDESCRICAO_GRUPO: TIBStringField
      FieldName = 'DESCRICAO_GRUPO'
      Origin = '"PRODUTOSVENDIDOSCAIXA"."DESCRICAO_GRUPO"'
      Size = 30
    end
    object qryProdutosVendidosCaixaDESCRICAO: TIBStringField
      FieldName = 'DESCRICAO'
      Origin = '"PRODUTOSVENDIDOSCAIXA"."DESCRICAO"'
      Size = 40
    end
    object qryProdutosVendidosCaixaQUANTIDADE_REAL: TIBBCDField
      FieldName = 'QUANTIDADE_REAL'
      Origin = '"PRODUTOSVENDIDOSCAIXA"."QUANTIDADE_REAL"'
      Precision = 18
      Size = 3
    end
    object qryProdutosVendidosCaixaQUANTIDADE_CONTAGEM: TIBBCDField
      FieldName = 'QUANTIDADE_CONTAGEM'
      Origin = '"PRODUTOSVENDIDOSCAIXA"."QUANTIDADE_CONTAGEM"'
      Precision = 18
      Size = 3
    end
    object qryProdutosVendidosCaixaVALOR_UNITARIO: TIBBCDField
      FieldName = 'VALOR_UNITARIO'
      Origin = '"PRODUTOSVENDIDOSCAIXA"."VALOR_UNITARIO"'
      Precision = 18
      Size = 2
    end
    object qryProdutosVendidosCaixaTOT: TFloatField
      FieldName = 'TOT'
      ProviderFlags = []
    end
    object qryProdutosVendidosCaixaCOD_BARRAS: TIBStringField
      FieldName = 'COD_BARRAS'
      Origin = '"R_INFORMACOES_PRODUTO"."COD_BARRAS"'
    end
    object qryProdutosVendidosCaixaCOD_G_RAIZ: TIBStringField
      FieldName = 'COD_G_RAIZ'
      Origin = '"R_INFORMACOES_PRODUTO"."COD_G_RAIZ"'
      Size = 1
    end
    object qryProdutosVendidosCaixaDESC_G_RAIZ: TIBStringField
      FieldName = 'DESC_G_RAIZ'
      Origin = '"R_INFORMACOES_PRODUTO"."DESC_G_RAIZ"'
      Size = 30
    end
    object qryProdutosVendidosCaixaCOD_G_PAI: TIBStringField
      FieldName = 'COD_G_PAI'
      Origin = '"R_INFORMACOES_PRODUTO"."COD_G_PAI"'
      Size = 3
    end
    object qryProdutosVendidosCaixaDESC_G_PAI: TIBStringField
      FieldName = 'DESC_G_PAI'
      Origin = '"R_INFORMACOES_PRODUTO"."DESC_G_PAI"'
      Size = 30
    end
    object qryProdutosVendidosCaixaCOD_GRUPO1: TIBStringField
      FieldName = 'COD_GRUPO1'
      Origin = '"R_INFORMACOES_PRODUTO"."COD_GRUPO"'
      Size = 6
    end
    object qryProdutosVendidosCaixaDESC_GRUPO: TIBStringField
      FieldName = 'DESC_GRUPO'
      Origin = '"R_INFORMACOES_PRODUTO"."DESC_GRUPO"'
      Size = 30
    end
  end
  object dtClientesDelivery: TfrxDBDataset
    UserName = 'dtRelatorioClientesDelivery'
    CloseDataSource = False
    FieldAliases.Strings = (
      'CODIGO=CODIGO'
      'NOME=NOME'
      'TELEFONE=TELEFONE'
      'SEXO=SEXO'
      'ENDERECO=ENDERECO'
      'COD_BAIRRO=COD_BAIRRO'
      'COMPLEMENTO=COMPLEMENTO'
      'REFERENCIA1=REFERENCIA1'
      'REFERENCIA2=REFERENCIA2')
    DataSet = qryClientesPedidosDelivery
    BCDToCurrency = False
    Left = 203
    Top = 311
  end
  object dsClientesDelivery: TDataSource
    DataSet = qryClientesPedidosDelivery
    Left = 961
    Top = 296
  end
  object qryPedidosClientesDelivery: TIBQuery
    Database = dm.dbrestaurante
    Transaction = dm.transacao
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = False
    SQL.Strings = (
      
        ' select cl.codigo as cod_cli, cl.nome, cl.telefone,  p.codigo, p' +
        '.data,p.hora,p.valor_entrega, p.valor_total,c'
      '.nome_usuario  from pedidos_delivery p'
      ' inner join caixas c on  (c.codigo =  p.cod_caixa)'
      
        '  inner join clientes_delivery  cl  on (cl.codigo  = p.cod_clien' +
        'te)'
      ' where p.data between '#39'15.06.2012'#39
      ' and '#39'30.06.2012'#39
      'order by p.data desc')
    Left = 168
    Top = 360
  end
  object dtPedidosClientesDelivery: TfrxDBDataset
    UserName = 'dtPedidosClientesDelivery'
    CloseDataSource = False
    FieldAliases.Strings = (
      'COD_CLI=COD_CLI'
      'NOME=NOME'
      'TELEFONE=TELEFONE'
      'CODIGO=CODIGO'
      'DATA=DATA'
      'HORA=HORA'
      'VALOR_ENTREGA=VALOR_ENTREGA'
      'VALOR_TOTAL=VALOR_TOTAL'
      'NOME_USUARIO=NOME_USUARIO')
    DataSet = qryPedidosClientesDelivery
    BCDToCurrency = False
    Left = 204
    Top = 359
  end
  object qryItensPedidoDelivery: TIBQuery
    Database = dm.dbrestaurante
    Transaction = dm.transacao
    BufferChunks = 1000
    CachedUpdates = False
    DataSource = dsPedidosClientesDelivery
    ParamCheck = True
    SQL.Strings = (
      
        ' select it.cod_pedido,it.cod_produto, p.descricao, it.quantidade' +
        ', it.valor_unitario,'
      ' (it.valor_unitario * it.quantidade) as total'
      '   from itens_pedido_delivery it'
      '  inner join produtos p on (p.cod_produto = it.cod_produto)'
      ' where it.cod_pedido = :codigo'
      ''
      '')
    Left = 168
    Top = 408
    ParamData = <
      item
        DataType = ftString
        Name = 'CODIGO'
        ParamType = ptUnknown
        Size = 9
      end>
  end
  object dsPedidosClientesDelivery: TDataSource
    DataSet = qryPedidosClientesDelivery
    Left = 961
    Top = 342
  end
  object dtItensPedidoDelivery: TfrxDBDataset
    UserName = 'dtItensPedidoDelivery'
    CloseDataSource = False
    FieldAliases.Strings = (
      'COD_PEDIDO=COD_PEDIDO'
      'COD_PRODUTO=COD_PRODUTO'
      'DESCRICAO=DESCRICAO'
      'QUANTIDADE=QUANTIDADE'
      'VALOR_UNITARIO=VALOR_UNITARIO'
      'TOTAL=TOTAL')
    DataSet = qryItensPedidoDelivery
    BCDToCurrency = False
    Left = 203
    Top = 409
  end
  object dsQryItensPedidosDelivery: TDataSource
    DataSet = qryItensPedidoDelivery
    Left = 961
    Top = 393
  end
  object qryContatoEstrategicoDelivery: TIBQuery
    Database = dm.dbrestaurante
    Transaction = dm.transacao
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      'select * from v_contato_estrategico_delivery  c'
      '')
    Left = 168
    Top = 265
  end
  object dtContatoEstrategicoDelivery: TfrxDBDataset
    UserName = 'dtContatoEstrategicoDelivery'
    CloseDataSource = False
    FieldAliases.Strings = (
      'CODIGO=CODIGO'
      'NOME=NOME'
      'TELEFONE=TELEFONE'
      'ULTIMOPEDIDO=ULTIMOPEDIDO'
      'FREQ_COMPRA=FREQ_COMPRA'
      'DATAULTIMO=DATAULTIMO'
      'DIASCORRIDOS=DIASCORRIDOS'
      'NOMEUSUARIO=NOMEUSUARIO')
    DataSet = qryContatoEstrategicoDelivery
    BCDToCurrency = False
    Left = 203
    Top = 265
  end
  object qryVendas: TIBQuery
    Database = dm.dbrestaurante
    Transaction = dm.transacao
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      
        'select v.cod_venda as codigoVenda, v.* from vendas v where data=' +
        #39'27.06.2010'#39
      ' order by cod_venda')
    Left = 160
    Top = 136
  end
  object dtVendas: TfrxDBDataset
    UserName = 'dtVendas'
    CloseDataSource = False
    FieldAliases.Strings = (
      'CODIGOVENDA=CODIGOVENDA'
      'COD_VENDA=COD_VENDA'
      'DATA=DATA'
      'HORA=HORA'
      'DATA_SO=DATA_SO'
      'DATA_ECF=DATA_ECF'
      'HORA_ECF=HORA_ECF'
      'CUPOM=CUPOM'
      'VALOR_BRUTO=VALOR_BRUTO'
      'VALOR_DESCONTO=VALOR_DESCONTO'
      'VALOR_TXSERV=VALOR_TXSERV'
      'REPIQUE=REPIQUE'
      'VALOR_TOTAL=VALOR_TOTAL'
      'TOTAL_PAGO=TOTAL_PAGO'
      'VALOR_TROCO=VALOR_TROCO'
      'COD_USUARIO=COD_USUARIO'
      'NUMERO_CAIXA=NUMERO_CAIXA'
      'PROCESSADA=PROCESSADA'
      'NV=NV'
      'MESA=MESA'
      'IMP=IMP'
      'COD_CAIXA=COD_CAIXA'
      'TIPO_VENDA=TIPO_VENDA')
    DataSet = qryVendas
    BCDToCurrency = False
    Left = 200
    Top = 136
  end
  object qryPagamentosVendas: TIBQuery
    Database = dm.dbrestaurante
    Transaction = dm.transacao
    BufferChunks = 1000
    CachedUpdates = False
    DataSource = dsQryVendas
    ParamCheck = True
    SQL.Strings = (
      
        'select rec.cod_venda,   rec.cod_forma,fp.descricao,rec.valor fro' +
        'm recebimentos  rec'
      
        ' inner join formas_pagamento fp on (fp.cod_forma = rec.cod_forma' +
        ')'
      ' where rec.cod_venda= :codigoVenda')
    Left = 160
    Top = 176
    ParamData = <
      item
        DataType = ftString
        Name = 'CODIGOVENDA'
        ParamType = ptUnknown
        Size = 9
      end>
  end
  object dsQryVendas: TDataSource
    DataSet = qryVendas
    Left = 200
    Top = 136
  end
  object dtPagamentosVenda: TfrxDBDataset
    UserName = 'dtPagamentosVenda'
    CloseDataSource = False
    FieldAliases.Strings = (
      'COD_VENDA=COD_VENDA'
      'COD_FORMA=COD_FORMA'
      'DESCRICAO=DESCRICAO'
      'VALOR=VALOR')
    DataSet = qryPagamentosVendas
    BCDToCurrency = False
    Left = 200
    Top = 176
  end
  object dtProdutosVendidosCaixa: TfrxDBDataset
    UserName = 'dtProdutosVendidosCaixa'
    CloseDataSource = False
    FieldAliases.Strings = (
      'COD_PRODUTO=COD_PRODUTO'
      'COD_GRUPO=COD_GRUPO'
      'DESCRICAO_GRUPO=DESCRICAO_GRUPO'
      'DESCRICAO=DESCRICAO'
      'QUANTIDADE_REAL=QUANTIDADE_REAL'
      'QUANTIDADE_CONTAGEM=QUANTIDADE_CONTAGEM'
      'VALOR_UNITARIO=VALOR_UNITARIO'
      'TOT=TOT'
      'COD_BARRAS=COD_BARRAS'
      'COD_G_RAIZ=COD_G_RAIZ'
      'DESC_G_RAIZ=DESC_G_RAIZ'
      'COD_G_PAI=COD_G_PAI'
      'DESC_G_PAI=DESC_G_PAI'
      'COD_GRUPO1=COD_GRUPO1'
      'DESC_GRUPO=DESC_GRUPO')
    DataSet = qryProdutosVendidosCaixa
    BCDToCurrency = False
    Left = 68
    Top = 404
  end
  object dtEstornosCaixa: TfrxDBDataset
    UserName = 'dtEstornosCaixa'
    CloseDataSource = False
    FieldAliases.Strings = (
      'CODIGO=CODIGO'
      'COD_MOTIVO=COD_MOTIVO'
      'DESCRICAOMOTIVO=DESCRICAOMOTIVO'
      'MESA=MESA'
      'COD_PRODUTO=COD_PRODUTO'
      'DESCRICAO=DESCRICAO'
      'QUANTIDADE=QUANTIDADE'
      'VALOR_UNITARIO=VALOR_UNITARIO'
      'COD_CAIXA=COD_CAIXA'
      'HORA=HORA'
      'OBS=OBS'
      'COD_USUARIO_AUTORIZOU=COD_USUARIO_AUTORIZOU'
      'NOME_USUARIO_AUTORIZOU=NOME_USUARIO_AUTORIZOU'
      'TOTAL=TOTAL')
    DataSet = qryEstornosCaixa
    BCDToCurrency = False
    Left = 72
    Top = 361
  end
  object qryTransferenciasProdutos: TIBQuery
    Database = dm.dbrestaurante
    Transaction = dm.transacao
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      ''
      ''
      'select  tf.*, (tf.valor_unitario * tf.quantidade) as total'
      '  from  transferencias_produto tf'
      '  where tf.cod_caixa='#39'01348'#39)
    Left = 40
    Top = 93
  end
  object dtTransferenciasProdutos: TfrxDBDataset
    UserName = 'dtTransferenciasProdutos'
    CloseDataSource = False
    FieldAliases.Strings = (
      'CODIGO=CODIGO'
      'MESA_ORIGEM=MESA_ORIGEM'
      'MESA_DESTINO=MESA_DESTINO'
      'COD_MOTIVO=COD_MOTIVO'
      'DESCRICAOMOTIVO=DESCRICAOMOTIVO'
      'COD_PRODUTO=COD_PRODUTO'
      'DESCRICAO=DESCRICAO'
      'QUANTIDADE=QUANTIDADE'
      'VALOR_UNITARIO=VALOR_UNITARIO'
      'COD_CAIXA=COD_CAIXA'
      'HORA=HORA'
      'OBS=OBS'
      'COD_USUARIO_AUTORIZOU=COD_USUARIO_AUTORIZOU'
      'NOME_USUARIO_AUTORIZOU=NOME_USUARIO_AUTORIZOU'
      'TOTAL=TOTAL')
    DataSet = qryTransferenciasProdutos
    BCDToCurrency = False
    Left = 75
    Top = 93
  end
  object qryResumoCaixa: TIBQuery
    Database = dm.dbrestaurante
    Transaction = dm.transacao
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      
        'select ap.cod_forma,fp.descricao,  sum(ap.total_sistema) as Tota' +
        'lSistema ,sum(ap.total_operador) as TotalOperador, sum(ap.total_' +
        'suprimentos) as TotalEntradas,sum(ap.total_sangrias) as TotalSan' +
        'grias,'
      '       sum(ap.diferenca) as TotalDiferenca, cx.data_sistema'
      '   from apuracao_caixa ap'
      '   inner join caixas cx on (cx.codigo = ap.cod_caixa)'
      
        '   inner join formas_pagamento fp on (fp.cod_forma = ap.cod_form' +
        'a)'
      '   where cx.data_sistema='#39'27.06.2010'#39
      ''
      '   group by ap.cod_forma,fp.descricao,  cx.data_sistema'
      '   order by cx.data_sistema')
    Left = 41
    Top = 50
  end
  object dtResumoCaixa: TfrxDBDataset
    UserName = 'dtResumoCaixa'
    CloseDataSource = False
    FieldAliases.Strings = (
      'COD_FORMA=COD_FORMA'
      'DESCRICAO=DESCRICAO'
      'TOTALSISTEMA=TOTALSISTEMA'
      'TOTALOPERADOR=TOTALOPERADOR'
      'TOTALENTRADAS=TOTALENTRADAS'
      'TOTALSANGRIAS=TOTALSANGRIAS'
      'TOTALDIFERENCA=TOTALDIFERENCA'
      'DATA_SISTEMA=DATA_SISTEMA')
    DataSet = qryResumoCaixa
    BCDToCurrency = False
    Left = 74
    Top = 51
  end
  object qryResumoChurrascaria: TIBQuery
    Database = dm.dbrestaurante
    Transaction = dm.transacao
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      'select * from '
      '  medias_caixa('#39'27.06.2010'#39','#39#39')')
    Left = 40
    Top = 6
  end
  object dtResumoChurrascaria: TfrxDBDataset
    UserName = 'dtResumoChurrascaria'
    CloseDataSource = False
    FieldAliases.Strings = (
      'GRUPO=GRUPO'
      'DESCRICAOMEDIA=DESCRICAOMEDIA'
      'QUANTIDADE=QUANTIDADE'
      'QTDEGRUPODIVISAO=QTDEGRUPODIVISAO'
      'VALORMEDIA=VALORMEDIA')
    DataSet = qryResumoChurrascaria
    BCDToCurrency = False
    Left = 73
    Top = 8
  end
  object qryIndicadoresCaixa: TIBQuery
    Database = dm.dbrestaurante
    Transaction = dm.transacao
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      'select * from resumo_caixa('#39'23.06.2013'#39','#39#39')')
    Left = 160
    Top = 216
  end
  object dtIndicadoresCaixa: TfrxDBDataset
    UserName = 'dtIndicadoresCaixa'
    CloseDataSource = False
    FieldAliases.Strings = (
      'QTDMESASATENDIDAS=QTDMESASATENDIDAS'
      'QTDPESSOASATENDIDAS=QTDPESSOASATENDIDAS'
      'QTD_VENDA_BALCAO=QTD_VENDA_BALCAO'
      'QTD_VENDA_DELIVERY=QTD_VENDA_DELIVERY'
      'TAXASERVICO=TAXASERVICO'
      'TICKETMEDIOMESA=TICKETMEDIOMESA'
      'TICKETMEDIOPESSOA=TICKETMEDIOPESSOA'
      'TICKETMEDIOBALCAO=TICKETMEDIOBALCAO'
      'TICKETMEDIODELIVERY=TICKETMEDIODELIVERY'
      'QTDMESASCOMTXSERV=QTDMESASCOMTXSERV'
      'QTDMESASSEMTXSERV=QTDMESASSEMTXSERV')
    DataSet = qryIndicadoresCaixa
    BCDToCurrency = False
    Left = 200
    Top = 216
  end
  object qryTransferenciasMesa: TIBQuery
    Database = dm.dbrestaurante
    Transaction = dm.transacao
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      'select * from TRANSFERENCIAS_MESA')
    Left = 393
    Top = 93
  end
  object dtTransferenciasMesa: TfrxDBDataset
    UserName = 'dtTransferenciasMesa'
    CloseDataSource = False
    FieldAliases.Strings = (
      'CODIGO=CODIGO'
      'MESA_ORIGEM=MESA_ORIGEM'
      'MESA_DESTINO=MESA_DESTINO'
      'TOTAL_MESA_ORIGEM=TOTAL_MESA_ORIGEM'
      'TOTAL_MESA_DESTINO=TOTAL_MESA_DESTINO'
      'COD_CAIXA=COD_CAIXA'
      'HORA=HORA'
      'COD_USUARIO_AUTORIZOU=COD_USUARIO_AUTORIZOU'
      'NOME_USUARIO_AUTORIZOU=NOME_USUARIO_AUTORIZOU')
    DataSet = qryTransferenciasMesa
    BCDToCurrency = False
    Left = 434
    Top = 94
  end
  object qryEstornosMesa: TIBQuery
    Database = dm.dbrestaurante
    Transaction = dm.transacao
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      'select * from estornos_mesa')
    Left = 32
    Top = 312
  end
  object dtEstornosMesa: TfrxDBDataset
    UserName = 'dtEstornosMesa'
    CloseDataSource = False
    FieldAliases.Strings = (
      'CODIGO=CODIGO'
      'MESA=MESA'
      'TOTAL_MESA=TOTAL_MESA'
      'COD_CAIXA=COD_CAIXA'
      'HORA=HORA'
      'COD_USUARIO_AUTORIZOU=COD_USUARIO_AUTORIZOU'
      'NOME_USUARIO_AUTORIZOU=NOME_USUARIO_AUTORIZOU')
    DataSet = qryEstornosMesa
    BCDToCurrency = False
    Left = 64
    Top = 312
  end
  object qryFaturamento: TIBQuery
    Database = dm.dbrestaurante
    Transaction = dm.transacao
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      
        'select r.data, cf.descricao, udf_month(r.data)||'#39'/'#39'||udf_year(r.' +
        'data) as mes , upper(udf_monthname(r.data))||'#39'/'#39'||udf_year(r.dat' +
        'a) as NomeMes, sum(r.valor) as total from  recebimentos r'
      
        '  inner join configuracoes_estacao cf on (cf.numero_caixa = r.nu' +
        'mero_caixa) '
      '   where r.data between '#39'01.11.2016'#39' and '#39'30.11.2016'#39
      '     group by cf.descricao, r.data  '
      '     order by cf.descricao, r.data ')
    Left = 40
    Top = 176
  end
  object dtFaturamento: TfrxDBDataset
    UserName = 'dtFaturamento'
    CloseDataSource = False
    FieldAliases.Strings = (
      'COD_FORMA=COD_FORMA'
      'DATA=DATA'
      'MES=MES'
      'NOMEMES=NOMEMES'
      'TOTAL=TOTAL'
      'DESCRICAO=DESCRICAO')
    DataSet = qryFaturamento
    BCDToCurrency = False
    Left = 73
    Top = 174
  end
  object dtFaturamentoDiarioPeriodoSintetico: TfrxDBDataset
    UserName = 'dtFaturamentoDiarioPeriodoSintetico'
    CloseDataSource = False
    DataSet = qryFaturamento
    BCDToCurrency = False
    Left = 40
    Top = 216
  end
  object dtFaturamentoMensalPeriodoAnalitico: TfrxDBDataset
    UserName = 'dtFaturamentoMensalPeriodoAnalitico'
    CloseDataSource = False
    FieldAliases.Strings = (
      'CODFORMA=CODFORMA'
      'DESCRICAO=DESCRICAO'
      'VALOR=VALOR'
      'ANOMES=ANOMES'
      'NOMEMES=NOMEMES')
    DataSet = qryFaturamento
    BCDToCurrency = False
    Left = 80
    Top = 224
  end
  object dtFaturamentoMensalPeriodoSintetico: TfrxDBDataset
    UserName = 'dtFaturamentoMensalPeriodoSintetico'
    CloseDataSource = False
    FieldAliases.Strings = (
      'VALOR=VALOR'
      'ANOMES=ANOMES'
      'NOMEMES=NOMEMES')
    DataSet = qryFaturamento
    BCDToCurrency = False
    Left = 32
    Top = 264
  end
  object qryMovimentoAuditoriaMesas: TIBQuery
    Database = dm.dbrestaurante
    Transaction = dm.transacao
    BufferChunks = 1000
    CachedUpdates = False
    DataSource = dsAuditoriaMesas
    ParamCheck = True
    SQL.Strings = (
      ''
      ''
      ''
      ''
      '             '
      ' select vm.*,p.cod_barras,g.apelido from v_movimento_venda vm'
      '   inner join produtos p on (p.cod_produto = vm.cod_produto)'
      '   inner join garcons g on  (g.cod_garcon = vm.cod_garcon)'
      '    where vm.cod_venda = :codigoVenda'
      '')
    Left = 24
    Top = 496
    ParamData = <
      item
        DataType = ftString
        Name = 'CODIGOVENDA'
        ParamType = ptUnknown
        Size = 9
      end>
  end
  object qryAuditoriaMesas: TIBQuery
    Database = dm.dbrestaurante
    Transaction = dm.transacao
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      ' select  v.*, v.cod_venda as codigoVenda from vendas v'
      '  where v.data between '#39'01.03.2007'#39' and '#39'07.03.2011'#39)
    Left = 24
    Top = 448
  end
  object dtRelatorioAuditoriaMesas: TfrxDBDataset
    UserName = 'dtRelatorioAuditoriaMesas'
    CloseDataSource = False
    FieldAliases.Strings = (
      'COD_VENDA=COD_VENDA'
      'DATA=DATA'
      'HORA=HORA'
      'DATA_SO=DATA_SO'
      'DATA_ECF=DATA_ECF'
      'HORA_ECF=HORA_ECF'
      'CUPOM=CUPOM'
      'VALOR_BRUTO=VALOR_BRUTO'
      'VALOR_DESCONTO=VALOR_DESCONTO'
      'VALOR_TXSERV=VALOR_TXSERV'
      'REPIQUE=REPIQUE'
      'VALOR_TOTAL=VALOR_TOTAL'
      'TOTAL_PAGO=TOTAL_PAGO'
      'VALOR_TROCO=VALOR_TROCO'
      'COD_USUARIO=COD_USUARIO'
      'NUMERO_CAIXA=NUMERO_CAIXA'
      'PROCESSADA=PROCESSADA'
      'NV=NV'
      'MESA=MESA'
      'IMP=IMP'
      'COD_CAIXA=COD_CAIXA'
      'TIPO_VENDA=TIPO_VENDA'
      'COD_PEDIDO_DELIVERY=COD_PEDIDO_DELIVERY')
    DataSet = qryAuditoriaMesas
    BCDToCurrency = False
    Left = 72
    Top = 264
  end
  object dsAuditoriaMesas: TDataSource
    DataSet = qryAuditoriaMesas
    Left = 64
    Top = 448
  end
  object dtMovimentoAuditoriaMesas: TfrxDBDataset
    UserName = 'dtMovimentoAuditoriaMesas'
    CloseDataSource = False
    FieldAliases.Strings = (
      'COD_VENDA=COD_VENDA'
      'COD_PRODUTO=COD_PRODUTO'
      'DESCRICAO=DESCRICAO'
      'PARAMETRO_CONTAGEM=PARAMETRO_CONTAGEM'
      'COD_GRUPO=COD_GRUPO'
      'COD_ALIQUOTA=COD_ALIQUOTA'
      'QUANTIDADE_REAL=QUANTIDADE_REAL'
      'QUANTIDADE_CONTAGEM=QUANTIDADE_CONTAGEM'
      'VALOR_UNITARIO=VALOR_UNITARIO'
      'TOTAL=TOTAL'
      'DATA=DATA'
      'HORA=HORA'
      'MESA=MESA'
      'COD_GARCON=COD_GARCON'
      'COD_USUARIO=COD_USUARIO'
      'DESCRICAO_GRUPO=DESCRICAO_GRUPO'
      'NOME_USUARIO=NOME_USUARIO'
      'COD_CAIXA=COD_CAIXA'
      'COD_BARRAS=COD_BARRAS'
      'APELIDO=APELIDO')
    DataSet = qryMovimentoAuditoriaMesas
    BCDToCurrency = False
    Left = 64
    Top = 496
  end
  object qryRecebimentosAuditoriaMesas: TIBQuery
    Database = dm.dbrestaurante
    Transaction = dm.transacao
    BufferChunks = 1000
    CachedUpdates = False
    DataSource = dsAuditoriaMesas
    ParamCheck = True
    SQL.Strings = (
      
        'select rec.cod_venda,   rec.cod_forma,fp.descricao,rec.valor fro' +
        'm recebimentos  rec'
      
        ' inner join formas_pagamento fp on (fp.cod_forma = rec.cod_forma' +
        ')'
      ' where rec.cod_venda= :codigoVenda')
    Left = 32
    Top = 544
    ParamData = <
      item
        DataType = ftString
        Name = 'CODIGOVENDA'
        ParamType = ptUnknown
        Size = 9
      end>
  end
  object dtRecebimentosAuditoria: TfrxDBDataset
    UserName = 'dtRecebimentosAuditoria'
    CloseDataSource = False
    FieldAliases.Strings = (
      'COD_VENDA=COD_VENDA'
      'COD_FORMA=COD_FORMA'
      'DESCRICAO=DESCRICAO'
      'VALOR=VALOR')
    DataSet = qryRecebimentosAuditoriaMesas
    BCDToCurrency = False
    Left = 72
    Top = 544
  end
  object qryPedidosEntregadores: TIBQuery
    Database = dm.dbrestaurante
    Transaction = dm.transacao
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      
        'select p.data, p.codigo, c.nome, p.hora_lancamento,   p.hora_sai' +
        'da, p.hora_pagamento, b.descricao, p.data,p.valor_bruto, p.valor' +
        '_total, p.valor_entrega,e.cod_entregador, e.nome_entregador, e.q' +
        'td_pedidos,e.qtd_litros, e.total_gasolina,'
      
        '  e.dias_trabalhados,e.total_diarias,e.total_pedidos,e.total_com' +
        'issao,e.total_geral'
      ' from pedidos_delivery  p'
      
        '  inner join gasolina_entregadores('#39'01.11.2018'#39','#39'30.11.2018'#39',0,0' +
        ',0) e '
      '     on (e.cod_entregador = p.cod_entregador)'
      'inner join clientes_delivery c'
      '     on (c.codigo = p.cod_cliente)'
      '  inner join bairro b'
      '     on (b.codigo = c.cod_bairro)'
      '   where p.data between '#39'01.11.2018'#39' and '#39'30.11.2018'#39)
    Left = 32
    Top = 632
  end
  object dtQryPedidosEntregadores: TfrxDBDataset
    UserName = 'dtQryPedidosEntregadores'
    CloseDataSource = False
    FieldAliases.Strings = (
      'DATA=DATA'
      'CODIGO=CODIGO'
      'NOME=NOME'
      'HORA_LANCAMENTO=HORA_LANCAMENTO'
      'HORA_SAIDA=HORA_SAIDA'
      'HORA_PAGAMENTO=HORA_PAGAMENTO'
      'DESCRICAO=DESCRICAO'
      'DATA1=DATA1'
      'VALOR_BRUTO=VALOR_BRUTO'
      'VALOR_TOTAL=VALOR_TOTAL'
      'VALOR_ENTREGA=VALOR_ENTREGA'
      'COD_ENTREGADOR=COD_ENTREGADOR'
      'NOME_ENTREGADOR=NOME_ENTREGADOR'
      'QTD_PEDIDOS=QTD_PEDIDOS'
      'QTD_LITROS=QTD_LITROS'
      'TOTAL_GASOLINA=TOTAL_GASOLINA'
      'DIAS_TRABALHADOS=DIAS_TRABALHADOS'
      'TOTAL_DIARIAS=TOTAL_DIARIAS'
      'TOTAL_PEDIDOS=TOTAL_PEDIDOS'
      'TOTAL_COMISSAO=TOTAL_COMISSAO'
      'TOTAL_GERAL=TOTAL_GERAL')
    DataSet = qryPedidosEntregadores
    BCDToCurrency = False
    Left = 72
    Top = 632
  end
  object dtClientesBoatePeriodo: TfrxDBDataset
    UserName = 'dtClientesBoatePeriodo'
    CloseDataSource = False
    FieldAliases.Strings = (
      'DATA=DATA'
      'CARTAO=CARTAO'
      'NOME=NOME'
      'TELEFONE=TELEFONE'
      'RG=RG'
      'HORA_ENTRADA=HORA_ENTRADA'
      'HORA_PAGAMENTO=HORA_PAGAMENTO'
      'HORA_SAIDA=HORA_SAIDA'
      'CONSUMO=CONSUMO')
    DataSet = qryClientesBoatePeriodo
    BCDToCurrency = False
    Left = 744
    Top = 80
  end
  object qryClientesBoatePeriodo: TIBQuery
    Database = dm.dbrestaurante
    Transaction = dm.transacao
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      ''
      
        'select  mv.data,mv.cartao,cli.razao_social as nome, cli.telefone' +
        ', cli.rg,'
      
        '        cast(mv.hora_entrada as time) as hora_entrada, cast(mv.h' +
        'ora_pagamento as time) as hora_pagamento'
      '        , cast(mv.hora_saida as time) as hora_saida,'
      ''
      ' mv.consumo '
      '   from movimentacao_clientes mv'
      '      inner join clientes cli on (cli.cod_cli = mv.cod_cli)'
      '      where data between '#39'01.05.2011'#39' and '#39'16.06.2011'#39
      '      order by mv.data,mv.cartao')
    Left = 696
    Top = 88
  end
  object qryEspelhoNotasEntrada: TIBQuery
    Database = dm.dbrestaurante
    Transaction = dm.transacao
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      '  select e.cod_entrada as codigo_entrada, e.*,'
      '   f.razao_social as RazaoSocial,'
      '   f.nome_fantasia, '
      '   f.endereco,'
      '   f.bairro,'
      '   f.cep,'
      '   f.cgc_cpf as Cnpj,'
      '   f.inscricao_estadual,'
      '   c.nome as NomeCidade,'
      '   es.sigla as UF,'
      '   mn.descricao as ModeloNota'
      '  from entradas e'
      
        '  inner join fornecedor f on (f.cod_fornecedor = e.cod_fornecedo' +
        'r)'
      '  inner join cidade c on (c.cod_cidade = f.cod_cidade)'
      '  inner join estado es on (es.codigo = f.cod_estado)'
      '  inner join modelos_nf mn on (mn.codigo = e.modelo_nota)'
      ' where e.cod_entrada='#39'00000010'#39)
    Left = 688
    Top = 318
  end
  object dsQryEspelhoNotasEntrada: TDataSource
    DataSet = qryEspelhoNotasEntrada
    Left = 720
    Top = 318
  end
  object dtNotasEntrada: TfrxDBDataset
    UserName = 'dtNotasEntrada'
    CloseDataSource = False
    FieldAliases.Strings = (
      'CODIGO_ENTRADA=CODIGO_ENTRADA'
      'COD_ENTRADA=COD_ENTRADA'
      'COD_FORNECEDOR=COD_FORNECEDOR'
      'COD_USUARIO=COD_USUARIO'
      'QTDE_ITENS=QTDE_ITENS'
      'DATA=DATA'
      'HORA=HORA'
      'NOME_USUARIO_ENTRADA=NOME_USUARIO_ENTRADA'
      'DATA_EMISSAO=DATA_EMISSAO'
      'DATA_ENTRADA=DATA_ENTRADA'
      'NUMERO_NOTA=NUMERO_NOTA'
      'SERIE_NOTA=SERIE_NOTA'
      'MODELO_NOTA=MODELO_NOTA'
      'BASE_ICMS=BASE_ICMS'
      'VALOR_ICMS=VALOR_ICMS'
      'BASE_ICMS_SUBST=BASE_ICMS_SUBST'
      'VALOR_ICMS_SUBST=VALOR_ICMS_SUBST'
      'VALOR_PRODUTOS=VALOR_PRODUTOS'
      'FRETE=FRETE'
      'SEGURO=SEGURO'
      'DESCONTO=DESCONTO'
      'OUTRAS_DESPESAS=OUTRAS_DESPESAS'
      'VALOR_IPI=VALOR_IPI'
      'TOTAL_NOTA=TOTAL_NOTA'
      'MES_REF_CONTABIL=MES_REF_CONTABIL'
      'COD_EMP_GRUPO=COD_EMP_GRUPO'
      'CHAVE_NFE=CHAVE_NFE'
      'TIPO_ENTRADA=TIPO_ENTRADA'
      'INFORMACOES_COMPLEMENTARES=INFORMACOES_COMPLEMENTARES'
      'INFORMACOES_FISCO=INFORMACOES_FISCO'
      'RAZAOSOCIAL=RAZAOSOCIAL'
      'NOME_FANTASIA=NOME_FANTASIA'
      'ENDERECO=ENDERECO'
      'BAIRRO=BAIRRO'
      'CEP=CEP'
      'CNPJ=CNPJ'
      'INSCRICAO_ESTADUAL=INSCRICAO_ESTADUAL'
      'NOMECIDADE=NOMECIDADE'
      'UF=UF'
      'MODELONOTA=MODELONOTA')
    DataSet = qryEspelhoNotasEntrada
    BCDToCurrency = False
    Left = 744
    Top = 318
  end
  object qryItensEspelhoNotasEntrada: TIBQuery
    Database = dm.dbrestaurante
    Transaction = dm.transacao
    BufferChunks = 1000
    CachedUpdates = False
    DataSource = dsQryEspelhoNotasEntrada
    ParamCheck = True
    SQL.Strings = (
      'select ite.*,un.sigla  from itens_entrada ite'
      '   inner join unidades un on (un.cod_unidade = ite.cod_unidade)'
      '   where ite.cod_entrada = :codigo_entrada')
    Left = 688
    Top = 358
    ParamData = <
      item
        DataType = ftString
        Name = 'CODIGO_ENTRADA'
        ParamType = ptUnknown
        Size = 9
      end>
  end
  object dsQryItensEspelhoNotasEntrada: TDataSource
    Left = 720
    Top = 358
  end
  object dtItensNotasEntrada: TfrxDBDataset
    UserName = 'dtItensNotasEntrada'
    CloseDataSource = False
    FieldAliases.Strings = (
      'COD_ENTRADA=COD_ENTRADA'
      'COD_ITEM=COD_ITEM'
      'QUANTIDADE=QUANTIDADE'
      'COD_UNIDADE=COD_UNIDADE'
      'VALOR_UNITARIO=VALOR_UNITARIO'
      'DESCRICAO_UNIDADE=DESCRICAO_UNIDADE'
      'ESTOQUE_ANTERIOR=ESTOQUE_ANTERIOR'
      'COD_UNIDADE_ESTOQUE_ANTERIOR=COD_UNIDADE_ESTOQUE_ANTERIOR'
      'ESTOQUE_ATUALIZADO=ESTOQUE_ATUALIZADO'
      'DESCRICAO_ITEM=DESCRICAO_ITEM'
      'CFOP=CFOP'
      'CST=CST'
      'SIGLA_UNID=SIGLA_UNID'
      'DESCONTO=DESCONTO'
      'BASE_ICMS=BASE_ICMS'
      'VALOR_ICMS=VALOR_ICMS'
      'BASE_ICMS_ST=BASE_ICMS_ST'
      'VALOR_ICMS_ST=VALOR_ICMS_ST'
      'VALOR_IPI=VALOR_IPI'
      'ALIQUOTA_IPI=ALIQUOTA_IPI'
      'ALIQUOTA_ICMS=ALIQUOTA_ICMS'
      'ORDEM=ORDEM'
      'SIGLA=SIGLA')
    DataSet = qryItensEspelhoNotasEntrada
    BCDToCurrency = False
    Left = 752
    Top = 358
  end
  object qryNotasConsumidor: TIBQuery
    Database = dm.dbrestaurante
    Transaction = dm.transacao
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      ''
      ''
      
        '  select nc.data_doc,nc.numero_nota,nc.serie,nc.sub_serie,nc.cfo' +
        'p,nc.cst_icms,nc.cpf_cnpj_adquirente,'
      
        '         nc.base_icms,nc.reducao_base_icms,nc.aliq_icms,nc.valor' +
        '_icms,nc.valor_doc,nc.numero_ecf,nc.numero_cupom_fiscal,'
      '      case nc.cancelado'
      '        when 1 then '#39'CANCELADA'#39
      '      end as status_nota'
      ''
      '        from notas_consumidor nc;')
    Left = 696
    Top = 263
  end
  object dtNotasConsumidor: TfrxDBDataset
    UserName = 'dtNotasConsumidor'
    CloseDataSource = False
    DataSet = qryNotasConsumidor
    BCDToCurrency = False
    Left = 728
    Top = 263
  end
  object qryNotasTransporte: TIBQuery
    Database = dm.dbrestaurante
    Transaction = dm.transacao
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      'select nt.*, f.razao_social,'
      '      cf.descricao as descricaoCFOP,'
      '       cs.descricao as descricaoCST,'
      '       md.descricao as descricaoModelo'
      '  from notas_transporte nt'
      
        '  inner join fornecedor f on (f.cod_fornecedor = nt.cod_forneced' +
        'or)'
      '  inner join cfop cf on (cf.codigo = nt.cfop)'
      '  inner join cst cs on (cs.cst = nt.cst_icms)'
      '  inner join modelos_nf md on (md.codigo = nt.modelo_nota)'
      '    where nt.data_servico between '#39'01.01.2011'#39' and '#39'31.01.2011'#39)
    Left = 272
    Top = 54
  end
  object dtNotasTransporte: TfrxDBDataset
    UserName = 'dtNotasTransporte'
    CloseDataSource = False
    FieldAliases.Strings = (
      'CODIGO=CODIGO'
      'COD_FORNECEDOR=COD_FORNECEDOR'
      'NUMERO_NOTA=NUMERO_NOTA'
      'SERIE=SERIE'
      'SUB_SERIE=SUB_SERIE'
      'SITUACAO=SITUACAO'
      'DATA_EMISSAO=DATA_EMISSAO'
      'DATA_SERVICO=DATA_SERVICO'
      'DATA_LANCAMENTO=DATA_LANCAMENTO'
      'MES_REF_CONTABIL=MES_REF_CONTABIL'
      'MODELO_NOTA=MODELO_NOTA'
      'CFOP=CFOP'
      'CST_ICMS=CST_ICMS'
      'VALOR_SERVICO=VALOR_SERVICO'
      'DESCONTO=DESCONTO'
      'BASE_ICMS=BASE_ICMS'
      'REDUCAO_BASE_ICMS=REDUCAO_BASE_ICMS'
      'ALIQ_ICMS=ALIQ_ICMS'
      'VALOR_ICMS=VALOR_ICMS'
      'VALOR_NAO_TRIBUTADO=VALOR_NAO_TRIBUTADO'
      'VALOR_DOC=VALOR_DOC'
      'TIPO_CTE=TIPO_CTE'
      'ID_FRETE=ID_FRETE'
      'RAZAO_SOCIAL=RAZAO_SOCIAL'
      'DESCRICAOCFOP=DESCRICAOCFOP'
      'DESCRICAOCST=DESCRICAOCST'
      'DESCRICAOMODELO=DESCRICAOMODELO')
    DataSet = qryNotasTransporte
    BCDToCurrency = False
    Left = 304
    Top = 54
  end
  object qryConfLVFSEntradas: TIBQuery
    Database = dm.dbrestaurante
    Transaction = dm.transacao
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      ' select * from compara_livro_entradas('#39'01.02.2011'#39','#39'28.02.2011'#39')'
      ' where obs <> '#39#39)
    Left = 176
    Top = 632
  end
  object dtConfLVFEntradas: TfrxDBDataset
    UserName = 'dtConfLVFEntradas'
    CloseDataSource = False
    FieldAliases.Strings = (
      'CODIGO_ENTRADA=CODIGO_ENTRADA'
      'TIPO_NOTA=TIPO_NOTA'
      'DATA_ENTRADA_SISTEMA=DATA_ENTRADA_SISTEMA'
      'DATA_ENTRADA_LIVRO_FISCAL=DATA_ENTRADA_LIVRO_FISCAL'
      'DATA_EMISSAO_SISTEMA=DATA_EMISSAO_SISTEMA'
      'DATA_EMISSAO_LIVRO_FISCAL=DATA_EMISSAO_LIVRO_FISCAL'
      'NUMERO_NOTA=NUMERO_NOTA'
      'NOME_FORNECEDOR=NOME_FORNECEDOR'
      'CNPJ_FORNECEDOR=CNPJ_FORNECEDOR'
      'TOTAL_SISTEMA=TOTAL_SISTEMA'
      'TOTAL_DESDOBRAMENTOS=TOTAL_DESDOBRAMENTOS'
      'DIFERENCA=DIFERENCA'
      'DESDOBRAMENTOS_LIVRO=DESDOBRAMENTOS_LIVRO'
      'DESDOBRAMENTOS=DESDOBRAMENTOS'
      'OBS=OBS'
      'QTD_NOTAS_SISTEMA=QTD_NOTAS_SISTEMA'
      'QTD_NOTAS_LIVRO=QTD_NOTAS_LIVRO'
      'TOTAL_NOTAS_SISTEMA=TOTAL_NOTAS_SISTEMA'
      'TOTAL_NOTAS_LIVRO=TOTAL_NOTAS_LIVRO')
    DataSet = qryConfLVFSEntradas
    BCDToCurrency = False
    Left = 208
    Top = 632
  end
  object qryEspelhoNotaSaida: TIBQuery
    Database = dm.dbrestaurante
    Transaction = dm.transacao
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      '  select s.cod_saida as codigo_saida, s.*,'
      '   f.razao_social as RazaoSocial,'
      '   f.nome_fantasia, '
      '   f.endereco,'
      '   f.bairro,'
      '   f.cep,'
      '   f.cgc_cpf as Cnpj,'
      '   f.inscricao_estadual,'
      '   c.nome as NomeCidade,'
      '   es.sigla as UF,'
      '   mn.descricao as ModeloNota,'
      '   cf.descricao as CfopDescricao'
      '  from saidas s'
      
        '  inner join fornecedor f on (f.cod_fornecedor = s.cod_fornecedo' +
        'r)'
      '  inner join cidade c on (c.cod_cidade = f.cod_cidade)'
      '  inner join estado es on (es.codigo = f.cod_estado)'
      '  inner join modelos_nf mn on (mn.codigo = s.modelo_nota)'
      '  inner join cfop cf on (cf.codigo = s.cfop_nota)'
      ' where s.cod_saida='#39'00000009'#39)
    Left = 696
    Top = 160
  end
  object dsQryEspelhoNotaSaida: TDataSource
    DataSet = qryEspelhoNotaSaida
    Left = 728
    Top = 160
  end
  object dtEspelhoNotaSaida: TfrxDBDataset
    UserName = 'dtEspelhoNotaSaida'
    CloseDataSource = False
    FieldAliases.Strings = (
      'CODIGO_SAIDA=CODIGO_SAIDA'
      'COD_SAIDA=COD_SAIDA'
      'COD_FORNECEDOR=COD_FORNECEDOR'
      'COD_USUARIO=COD_USUARIO'
      'QTDE_ITENS=QTDE_ITENS'
      'DATA=DATA'
      'HORA=HORA'
      'NOME_USUARIO_SAIDA=NOME_USUARIO_SAIDA'
      'CNPJ=CNPJ'
      'IE=IE'
      'UF=UF'
      'DATA_EMISSAO=DATA_EMISSAO'
      'DATA_SAIDA=DATA_SAIDA'
      'NUMERO_NOTA=NUMERO_NOTA'
      'SERIE_NOTA=SERIE_NOTA'
      'MODELO_NOTA=MODELO_NOTA'
      'CFOP_NOTA=CFOP_NOTA'
      'BASE_ICMS=BASE_ICMS'
      'VALOR_ICMS=VALOR_ICMS'
      'BASE_ICMS_SUBST=BASE_ICMS_SUBST'
      'VALOR_ICMS_SUBST=VALOR_ICMS_SUBST'
      'VALOR_PRODUTOS=VALOR_PRODUTOS'
      'FRETE=FRETE'
      'SEGURO=SEGURO'
      'DESCONTO=DESCONTO'
      'OUTRAS_DESPESAS=OUTRAS_DESPESAS'
      'VALOR_IPI=VALOR_IPI'
      'TOTAL_NOTA=TOTAL_NOTA'
      'RAZAOSOCIAL=RAZAOSOCIAL'
      'NOME_FANTASIA=NOME_FANTASIA'
      'ENDERECO=ENDERECO'
      'BAIRRO=BAIRRO'
      'CEP=CEP'
      'CNPJ1=CNPJ1'
      'INSCRICAO_ESTADUAL=INSCRICAO_ESTADUAL'
      'NOMECIDADE=NOMECIDADE'
      'UF1=UF1'
      'MODELONOTA=MODELONOTA'
      'CFOPDESCRICAO=CFOPDESCRICAO')
    DataSet = qryEspelhoNotaSaida
    BCDToCurrency = False
    Left = 760
    Top = 160
  end
  object qryItensEspelhoNotaSaida: TIBQuery
    Database = dm.dbrestaurante
    Transaction = dm.transacao
    BufferChunks = 1000
    CachedUpdates = False
    DataSource = dsQryEspelhoNotaSaida
    ParamCheck = True
    SQL.Strings = (
      ' select ite.*,un.sigla  from itens_saida ite'
      '   inner join unidades un on (un.cod_unidade = ite.cod_unidade)'
      '   where ite.cod_saida = :codigo_saida')
    Left = 696
    Top = 200
    ParamData = <
      item
        DataType = ftString
        Name = 'CODIGO_SAIDA'
        ParamType = ptUnknown
        Size = 9
      end>
  end
  object dsQryItensEspelhoNotaSaida: TDataSource
    Left = 728
    Top = 200
  end
  object dtItensNotaSaida: TfrxDBDataset
    UserName = 'dtItensNotaSaida'
    CloseDataSource = False
    FieldAliases.Strings = (
      'COD_SAIDA=COD_SAIDA'
      'COD_ITEM=COD_ITEM'
      'QUANTIDADE=QUANTIDADE'
      'COD_UNIDADE=COD_UNIDADE'
      'DESCRICAO_UNIDADE=DESCRICAO_UNIDADE'
      'ESTOQUE_ATUALIZADO=ESTOQUE_ATUALIZADO'
      'CFOP=CFOP'
      'CST=CST'
      'SIGLA_UNID=SIGLA_UNID'
      'DESCONTO=DESCONTO'
      'BASE_ICMS=BASE_ICMS'
      'VALOR_ICMS=VALOR_ICMS'
      'BASE_ICMS_ST=BASE_ICMS_ST'
      'VALOR_ICMS_ST=VALOR_ICMS_ST'
      'VALOR_IPI=VALOR_IPI'
      'ALIQUOTA_IPI=ALIQUOTA_IPI'
      'ALIQUOTA_ICMS=ALIQUOTA_ICMS'
      'ORDEM=ORDEM'
      'OUTRAS_DESPESAS=OUTRAS_DESPESAS'
      'VALOR_UNITARIO=VALOR_UNITARIO'
      'DESCRICAO_ITEM=DESCRICAO_ITEM'
      'SIGLA=SIGLA')
    DataSet = qryItensEspelhoNotaSaida
    BCDToCurrency = False
    Left = 760
    Top = 200
  end
  object qryFaturasAbertas: TIBQuery
    Database = dm.dbrestaurante
    Transaction = dm.transacao
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      ''
      
        ' select  cl.razao_social, cl.telefone,v.mesa, v.valor_bruto,v.va' +
        'lor_txserv,v.valor_total,v.mesa,v.coo_cupom,'
      '  f.cod_venda,f.* from faturas f'
      '     inner join clientes cl on (cl.cod_cli = f.cod_cli)'
      '     inner join vendas v on  (v.cod_venda = f.cod_venda)'
      '')
    Left = 200
    Top = 56
  end
  object dtFaturasAbertas: TfrxDBDataset
    UserName = 'dtFaturasAbertas'
    CloseDataSource = False
    FieldAliases.Strings = (
      'RAZAO_SOCIAL=RAZAO_SOCIAL'
      'TELEFONE=TELEFONE'
      'MESA=MESA'
      'VALOR_BRUTO=VALOR_BRUTO'
      'VALOR_TXSERV=VALOR_TXSERV'
      'VALOR_TOTAL=VALOR_TOTAL'
      'MESA1=MESA1'
      'COO_CUPOM=COO_CUPOM'
      'COD_VENDA=COD_VENDA'
      'COD_FATURA=COD_FATURA'
      'COD_CLI=COD_CLI'
      'DATA_FATURA=DATA_FATURA'
      'DATA_VENCIMENTO=DATA_VENCIMENTO'
      'DATA_PAGAMENTO=DATA_PAGAMENTO'
      'VALOR_FATURA=VALOR_FATURA'
      'VALOR_PAGO=VALOR_PAGO'
      'STATUS=STATUS'
      'COD_VENDA1=COD_VENDA1'
      'SELECAO=SELECAO'
      'USUARIO_INCLUSAO=USUARIO_INCLUSAO'
      'OBSERVACAO=OBSERVACAO'
      'HORA=HORA')
    DataSet = qryFaturasAbertas
    BCDToCurrency = False
    Left = 160
    Top = 88
  end
  object dtFaturasAbertasDetalhado: TfrxDBDataset
    UserName = 'dtFaturasAbertasDetalhado'
    CloseDataSource = False
    FieldAliases.Strings = (
      'RAZAO_SOCIAL=RAZAO_SOCIAL'
      'TELEFONE=TELEFONE'
      'VALOR_BRUTO=VALOR_BRUTO'
      'VALOR_TXSERV=VALOR_TXSERV'
      'VALOR_TOTAL=VALOR_TOTAL'
      'MESA=MESA'
      'COO_CUPOM=COO_CUPOM'
      'COD_FATURA=COD_FATURA'
      'COD_CLI=COD_CLI'
      'DATA_FATURA=DATA_FATURA'
      'DATA_VENCIMENTO=DATA_VENCIMENTO'
      'DATA_PAGAMENTO=DATA_PAGAMENTO'
      'VALOR_FATURA=VALOR_FATURA'
      'VALOR_PAGO=VALOR_PAGO'
      'STATUS=STATUS'
      'COD_VENDA=COD_VENDA'
      'SELECAO=SELECAO'
      'USUARIO_INCLUSAO=USUARIO_INCLUSAO'
      'OBSERVACAO=OBSERVACAO'
      'HORA=HORA')
    DataSet = qryFaturasAbertas
    BCDToCurrency = False
    Left = 200
    Top = 88
  end
  object qryProdutosFatura: TIBQuery
    Database = dm.dbrestaurante
    Transaction = dm.transacao
    BufferChunks = 1000
    CachedUpdates = False
    DataSource = dsFaturasAbertas
    ParamCheck = True
    SQL.Strings = (
      'select * from v_movimento_venda mv where mv.cod_venda=:cod_venda')
    Left = 160
    Top = 48
    ParamData = <
      item
        DataType = ftString
        Name = 'COD_VENDA'
        ParamType = ptUnknown
        Size = 9
      end>
  end
  object dsFaturasAbertas: TDataSource
    DataSet = qryFaturasAbertas
    Left = 160
    Top = 8
  end
  object dtProdutosFaturasAbertas: TfrxDBDataset
    UserName = 'dtProdutosFaturasAbertas'
    CloseDataSource = False
    FieldAliases.Strings = (
      'COD_VENDA=COD_VENDA'
      'COD_PRODUTO=COD_PRODUTO'
      'DESCRICAO=DESCRICAO'
      'PARAMETRO_CONTAGEM=PARAMETRO_CONTAGEM'
      'COD_GRUPO=COD_GRUPO'
      'COD_ALIQUOTA=COD_ALIQUOTA'
      'QUANTIDADE_REAL=QUANTIDADE_REAL'
      'QUANTIDADE_CONTAGEM=QUANTIDADE_CONTAGEM'
      'VALOR_UNITARIO=VALOR_UNITARIO'
      'TOTAL=TOTAL'
      'DATA=DATA'
      'HORA=HORA'
      'MESA=MESA'
      'COD_GARCON=COD_GARCON'
      'COD_USUARIO=COD_USUARIO'
      'DESCRICAO_GRUPO=DESCRICAO_GRUPO'
      'NOME_USUARIO=NOME_USUARIO'
      'COD_CAIXA=COD_CAIXA')
    DataSet = qryProdutosFatura
    BCDToCurrency = False
    Left = 200
    Top = 96
  end
  object qryTitulosCpagEntrada: TIBQuery
    Database = dm.dbrestaurante
    Transaction = dm.transacao
    BufferChunks = 1000
    CachedUpdates = False
    DataSource = dsQryEspelhoNotasEntrada
    ParamCheck = True
    SQL.Strings = (
      
        ' select * from contas_a_pagar cp where cp.codigo_entrada =:codig' +
        'o_entrada order by cp.codigo')
    Left = 688
    Top = 400
    ParamData = <
      item
        DataType = ftString
        Name = 'CODIGO_ENTRADA'
        ParamType = ptUnknown
        Size = 9
      end>
  end
  object DsqryTitulosCpagEntrada: TDataSource
    Left = 720
    Top = 400
  end
  object DtTitulosCpagEntrada: TfrxDBDataset
    UserName = 'DtTitulosCpagEntrada'
    CloseDataSource = False
    FieldAliases.Strings = (
      'CODIGO=CODIGO'
      'COD_FORNECEDOR=COD_FORNECEDOR'
      'COD_CONTA=COD_CONTA'
      'DESCRICAO_CONTA=DESCRICAO_CONTA'
      'DATA_ENTRADA=DATA_ENTRADA'
      'DATA_VENCIMENTO=DATA_VENCIMENTO'
      'VALOR=VALOR'
      'MULTA=MULTA'
      'FLAG_MULTA=FLAG_MULTA'
      'MORA=MORA'
      'FLAG_MORA=FLAG_MORA'
      'DESCONTO=DESCONTO'
      'FLAG_DESCONTO=FLAG_DESCONTO'
      'DIAS_ANTES_DESCONTO=DIAS_ANTES_DESCONTO'
      'USUARIO_INCLUSAO=USUARIO_INCLUSAO'
      'USUARIO_BAIXA=USUARIO_BAIXA'
      'CODIGO_ENTRADA=CODIGO_ENTRADA'
      'NUMERO_NOTA_FISCAL=NUMERO_NOTA_FISCAL'
      'COD_PRIMEIRO_TITULO=COD_PRIMEIRO_TITULO')
    DataSet = qryTitulosCpagEntrada
    BCDToCurrency = False
    Left = 752
    Top = 400
  end
  object qryProducaoGarconsSintetico: TIBQuery
    Database = dm.dbrestaurante
    Transaction = dm.transacao
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      
        'select mv.cod_garcon,g.apelido, sum(mv.quantidade * mv.valor_uni' +
        'tario) as total from movimento_venda mv '
      '  inner  join garcons g on (g.cod_garcon = mv.cod_garcon)'
      '  where  mv.data between '#39'01.01.2011'#39' and '#39'31.12.2012'#39
      '  group by mv.cod_garcon, g.apelido order by 3')
    Left = 905
    Top = 200
  end
  object dtProducaoGarconsSintetico: TfrxDBDataset
    UserName = 'dtProducaoGarconsSintetico'
    CloseDataSource = False
    FieldAliases.Strings = (
      'COD_GARCON=COD_GARCON'
      'APELIDO=APELIDO'
      'TOTAL=TOTAL')
    DataSet = qryProducaoGarconsSintetico
    BCDToCurrency = False
    Left = 936
    Top = 200
  end
  object dtProducaoGarconsSinteticoAgrupado: TfrxDBDataset
    UserName = 'dtProducaoGarconsSinteticoAgrupado'
    CloseDataSource = False
    FieldAliases.Strings = (
      'COD_GARCON=COD_GARCON'
      'APELIDO=APELIDO'
      'DATA=DATA'
      'TOTAL=TOTAL')
    DataSet = qryProducaoGarconsSintetico
    BCDToCurrency = False
    Left = 976
    Top = 200
  end
  object qryTaxaServico: TIBQuery
    Database = dm.dbrestaurante
    Transaction = dm.transacao
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      
        'select * from v_plano_contas_financeiro where cod_conta <> '#39'1'#39' a' +
        'nd cod_conta <> '#39'2'#39' order by contaRaiz,contaPai,cod_COnta')
    Left = 896
    Top = 248
  end
  object dtTaxaServicoRateado: TfrxDBDataset
    UserName = 'dtTaxaServicoRateado'
    CloseDataSource = False
    FieldAliases.Strings = (
      'COD_GARCON=COD_GARCON'
      'NOME=NOME'
      'TOTAL_ACUMULADO_GARCON=TOTAL_ACUMULADO_GARCON'
      'TOTAL_A_RECEBER=TOTAL_A_RECEBER'
      'TOTAL_CASA=TOTAL_CASA'
      'TOTAL_FUNCIONARIOS=TOTAL_FUNCIONARIOS'
      'TOTAL_GERAL=TOTAL_GERAL')
    DataSet = qryTaxaServico
    BCDToCurrency = False
    Left = 928
    Top = 248
  end
  object dtTaxaDeServicoDiario: TfrxDBDataset
    UserName = 'dtTaxaDeServicoDiario'
    CloseDataSource = False
    FieldAliases.Strings = (
      'DATA_VENDA=DATA_VENDA'
      'TOTAL=TOTAL')
    DataSet = qryTaxaServico
    BCDToCurrency = False
    Left = 960
    Top = 248
  end
  object dtTaxaServicoAgrupadoData: TfrxDBDataset
    UserName = 'dtTaxaServicoAgrupadoData'
    CloseDataSource = False
    FieldAliases.Strings = (
      'DATA=DATA'
      'COD_GARCON=COD_GARCON'
      'APELIDO=APELIDO'
      'TOTAL_TAXA=TOTAL_TAXA')
    DataSet = qryTaxaServico
    BCDToCurrency = False
    Left = 984
    Top = 248
  end
  object dtTaxaServicoAuditoria: TfrxDBDataset
    UserName = 'dtTaxaServicoAuditoria'
    CloseDataSource = False
    DataSet = qryTaxaServico
    BCDToCurrency = False
    Left = 1008
    Top = 248
  end
  object qryPlanoContas: TIBQuery
    Database = dm.dbrestaurante
    Transaction = dm.transacao
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      
        ' select rp.cod_conta,rp.cod_formatado,rp.descricao, p_pai.cod_co' +
        'nta as contaPai,p_pai.cod_formatado as codPaiFormatado,p_pai.des' +
        'cricao as descricaoPai,p_raiz.cod_conta as contaRaiz,'
      
        '        p_raiz.cod_formatado codRaizFormatado, p_raiz.descricao ' +
        'as descricaoRaiz   from r_plano_contas rp'
      
        '   inner join     r_plano_contas  p_raiz on (p_raiz.cod_conta = ' +
        'rp.cod_conta_raiz)'
      
        '  left join       r_plano_contas  p_pai on (p_pai.cod_conta = rp' +
        '.cod_conta_pai)'
      '   where udf_len(rp.cod_conta) = 6'
      ' order by rp.cod_conta')
    Left = 272
    Top = 136
  end
  object dtPlanoContas: TfrxDBDataset
    UserName = 'dtPlanoContas'
    CloseDataSource = False
    FieldAliases.Strings = (
      'COD_CONTA=COD_CONTA'
      'COD_FORMATADO=COD_FORMATADO'
      'DESCRICAO=DESCRICAO'
      'CONTAPAI=CONTAPAI'
      'CODPAIFORMATADO=CODPAIFORMATADO'
      'DESCRICAOPAI=DESCRICAOPAI'
      'CONTARAIZ=CONTARAIZ'
      'CODRAIZFORMATADO=CODRAIZFORMATADO'
      'DESCRICAORAIZ=DESCRICAORAIZ')
    DataSet = qryPlanoContas
    BCDToCurrency = False
    Left = 304
    Top = 136
  end
  object qryContasApagar: TIBQuery
    Database = dm.dbrestaurante
    Transaction = dm.transacao
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      
        '   select rc.*,en.data_emissao, f.nome_fantasia, pc.* from r_con' +
        'tas_a_pagar rc '
      
        '   inner join fornecedor f on (f.cod_fornecedor = rc.cod_fornece' +
        'dor) '
      
        '   inner join v_plano_contas_financeiro pc on (pc.cod_conta = rc' +
        '.cod_conta) '
      
        '   left join entradas en on (en.cod_entrada = rc.codigo_entrada)' +
        ' '
      ' where rc.status = 1'
      ' and rc.datapagamento between '#39'01.07.2012'#39
      ' and '#39'31.07.2012'#39
      
        'order by pc.contaraiz,pc.contapai,pc.cod_conta, rc.data_vencimen' +
        'to ')
    Left = 272
    Top = 96
  end
  object dtContasApagar: TfrxDBDataset
    UserName = 'dtContasApagar'
    CloseDataSource = False
    FieldAliases.Strings = (
      'CODIGO=CODIGO'
      'COD_FORNECEDOR=COD_FORNECEDOR'
      'COD_EMP_GRUPO=COD_EMP_GRUPO'
      'PARCELA=PARCELA'
      'NUMERO_NOTA_FISCAL=NUMERO_NOTA_FISCAL'
      'CODIGO_ENTRADA=CODIGO_ENTRADA'
      'COD_CONTA=COD_CONTA'
      'DESCRICAOCONTA=DESCRICAOCONTA'
      'DATA_ENTRADA=DATA_ENTRADA'
      'DATA_VENCIMENTO=DATA_VENCIMENTO'
      'VALORCONTA=VALORCONTA'
      'DIASATRASO=DIASATRASO'
      'MULTA=MULTA'
      'JUROS=JUROS'
      'DESCONTO=DESCONTO'
      'VALORATUALIZADO=VALORATUALIZADO'
      'VALORPAGO=VALORPAGO'
      'DATAPAGAMENTO=DATAPAGAMENTO'
      'STATUS=STATUS'
      'MSGSTATUS=MSGSTATUS'
      'DATA_EMISSAO=DATA_EMISSAO'
      'NOME_FANTASIA=NOME_FANTASIA'
      'COD_CONTA1=COD_CONTA1'
      'COD_FORMATADO=COD_FORMATADO'
      'DESCRICAOCONTA1=DESCRICAOCONTA1'
      'CONTAPAI=CONTAPAI'
      'CODPAIFORMATADO=CODPAIFORMATADO'
      'DESCRICAOPAI=DESCRICAOPAI'
      'CONTARAIZ=CONTARAIZ'
      'CODRAIZFORMATADO=CODRAIZFORMATADO'
      'DESCRICAORAIZ=DESCRICAORAIZ')
    DataSet = qryContasApagar
    BCDToCurrency = False
    Left = 304
    Top = 96
  end
  object qrySangrias: TIBQuery
    Database = dm.dbrestaurante
    Transaction = dm.transacao
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      ''
      
        'select s.codigo,s.data,tp.descricao,s.valor, s.codigo_tipo, s.ob' +
        's, s.cod_caixa,s.cod_usuario_autorizou,s.nome_usuario_autorizou'
      ' from sangrias s'
      ' inner join tipos_sangria tp on (tp.codigo = s.codigo_tipo)'
      '')
    Left = 272
    Top = 16
  end
  object dtSangrias: TfrxDBDataset
    UserName = 'dtSangrias'
    CloseDataSource = False
    FieldAliases.Strings = (
      'CODIGO=CODIGO'
      'DATA=DATA'
      'DESCRICAO=DESCRICAO'
      'VALOR=VALOR'
      'CODIGO_TIPO=CODIGO_TIPO'
      'OBS=OBS'
      'COD_CAIXA=COD_CAIXA'
      'COD_USUARIO_AUTORIZOU=COD_USUARIO_AUTORIZOU'
      'NOME_USUARIO_AUTORIZOU=NOME_USUARIO_AUTORIZOU')
    DataSet = qrySangrias
    BCDToCurrency = False
    Left = 304
    Top = 16
  end
  object qryConsumoAtualMesas: TIBQuery
    Database = dm.dbrestaurante
    Transaction = dm.transacao
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      ' select * from consumo_atual_mesas order by mesa')
    Left = 72
    Top = 584
  end
  object dtConsumoAtualMesas: TfrxDBDataset
    UserName = 'dtConsumoAtualMesas'
    CloseDataSource = False
    FieldAliases.Strings = (
      'MESA=MESA'
      'VALORBRUTO=VALORBRUTO'
      'VALORTXSERV=VALORTXSERV'
      'VALORPAGO=VALORPAGO'
      'VALORRESTANTE=VALORRESTANTE'
      'VALORTOTAL=VALORTOTAL')
    DataSet = qryConsumoAtualMesas
    BCDToCurrency = False
    Left = 32
    Top = 584
  end
  object qryBorderoContasPagar: TIBQuery
    Database = dm.dbrestaurante
    Transaction = dm.transacao
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      ''
      
        ' select r.codigo as CodigoConta, r.data_entrada,r.data_venciment' +
        'o,r.descricaoconta,'
      
        '        r.valorconta, r.NUMERO_NOTA_FISCAL, f.razao_social,pf.de' +
        'scricao as descContaFinanceiro ,eg.descricao as descEmpresa'
      ''
      '        from r_contas_a_pagar   r'
      
        '          inner join fornecedor f  on  (f.cod_fornecedor = r.cod' +
        '_fornecedor)'
      
        '          inner join plano_contas_financeiro pf on (pf.cod_conta' +
        ' = r.cod_conta)'
      
        '          inner join empresas_grupo eg on (eg.codigo = r.cod_emp' +
        '_grupo)')
    Left = 320
    Top = 240
  end
  object dtBorderoContasApagar: TfrxDBDataset
    UserName = 'dtBorderoContasApagar'
    CloseDataSource = False
    FieldAliases.Strings = (
      'CODIGOCONTA=CODIGOCONTA'
      'DATA_ENTRADA=DATA_ENTRADA'
      'DATA_VENCIMENTO=DATA_VENCIMENTO'
      'DESCRICAOCONTA=DESCRICAOCONTA'
      'VALORCONTA=VALORCONTA'
      'NUMERO_NOTA_FISCAL=NUMERO_NOTA_FISCAL'
      'RAZAO_SOCIAL=RAZAO_SOCIAL'
      'DESCCONTAFINANCEIRO=DESCCONTAFINANCEIRO'
      'DESCEMPRESA=DESCEMPRESA')
    DataSet = qryBorderoContasPagar
    BCDToCurrency = False
    Left = 352
    Top = 239
  end
  object DsqryBorderoContasPagar: TDataSource
    DataSet = qryBorderoContasPagar
    Left = 384
    Top = 240
  end
  object qryParcelasContasApagar: TIBQuery
    Database = dm.dbrestaurante
    Transaction = dm.transacao
    BufferChunks = 1000
    CachedUpdates = False
    DataSource = DsqryBorderoContasPagar
    ParamCheck = True
    SQL.Strings = (
      ''
      ' select c.data_vencimento, c.valor  from contas_a_pagar c'
      '    where c.cod_primeiro_titulo  = :CodigoConta'
      '    order by c.data_vencimento')
    Left = 320
    Top = 288
    ParamData = <
      item
        DataType = ftString
        Name = 'CODIGOCONTA'
        ParamType = ptUnknown
        Size = 7
      end>
  end
  object DtqryParcelasContasApagar: TfrxDBDataset
    UserName = 'DtqryParcelasContasApagar'
    CloseDataSource = False
    FieldAliases.Strings = (
      'DATA_VENCIMENTO=DATA_VENCIMENTO'
      'VALOR=VALOR')
    DataSet = qryParcelasContasApagar
    BCDToCurrency = False
    Left = 352
    Top = 287
  end
  object qryRankingProdutos: TIBQuery
    Database = dm.dbrestaurante
    Transaction = dm.transacao
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      ''
      ''
      '  select'
      '      p.cod_g_raiz, p.desc_g_raiz,'
      '       p.cod_g_pai, p.desc_g_pai,'
      '       p.cod_grupo, p.desc_grupo,'
      '       p.descricao, rk.*'
      
        '          from r_ranking_produtos(0,'#39'01.05.2018'#39','#39'09.05.2018'#39') r' +
        'k'
      
        '   inner join r_informacoes_produto p on (p.cod_produto = rk.cod' +
        '_produto)'
      '   where p.cod_grupo like '#39'101%'#39
      ''
      '    order by rk.ranking')
    Left = 287
    Top = 635
  end
  object dtRankingProdutos: TfrxDBDataset
    UserName = 'dtRankingProdutos'
    CloseDataSource = False
    FieldAliases.Strings = (
      'COD_G_RAIZ=COD_G_RAIZ'
      'DESC_G_RAIZ=DESC_G_RAIZ'
      'COD_G_PAI=COD_G_PAI'
      'DESC_G_PAI=DESC_G_PAI'
      'COD_GRUPO=COD_GRUPO'
      'DESC_GRUPO=DESC_GRUPO'
      'DESCRICAO=DESCRICAO'
      'RANKING=RANKING'
      'COD_PRODUTO=COD_PRODUTO'
      'PRECO_MEDIO=PRECO_MEDIO'
      'QUANTIDADE=QUANTIDADE'
      'TOTAL=TOTAL')
    DataSet = qryRankingProdutos
    BCDToCurrency = False
    Left = 325
    Top = 637
  end
  object qryRelEstatisticaVendas: TIBQuery
    Database = dm.dbrestaurante
    Transaction = dm.transacao
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      ''
      ''
      ''
      ''
      ''
      
        'select * from r_estatistico_vendas('#39'01.01.2019'#39','#39'31.01.2019'#39','#39'00' +
        ':00:00'#39','#39'23:59:59'#39','#39'-1,0,1,2,3,4,5,6'#39')'
      ' order by data asc, dia desc')
    Left = 632
    Top = 488
  end
  object dtRelEstatisticaVendas: TfrxDBDataset
    UserName = 'dtRelEstatisticaVendas'
    CloseDataSource = False
    FieldAliases.Strings = (
      'DATA=DATA'
      'DIA=DIA'
      'QTD_VENDAS_MESAS=QTD_VENDAS_MESAS'
      'TOTAL_MESAS=TOTAL_MESAS'
      'TOTAL_PRODUTOS_MESA=TOTAL_PRODUTOS_MESA'
      'QTD_PESSOAS_MESA=QTD_PESSOAS_MESA'
      'QTD_VENDAS_BALCAO=QTD_VENDAS_BALCAO'
      'TOTAL_BALCAO=TOTAL_BALCAO'
      'TOTAL_PRODUTOS_BALCAO=TOTAL_PRODUTOS_BALCAO'
      'QTD_VENDAS_DELIVERY=QTD_VENDAS_DELIVERY'
      'TOTAL_DELIVERY=TOTAL_DELIVERY'
      'TOTAL_PRODUTOS_DELIVERY=TOTAL_PRODUTOS_DELIVERY'
      'TOTAL_TAXA_SERVICO=TOTAL_TAXA_SERVICO'
      'TOTAL_TAXA_ENTREGA=TOTAL_TAXA_ENTREGA'
      'VALOR_DESCONTO_MESA=VALOR_DESCONTO_MESA'
      'VALOR_DESCONTO_BALCAO=VALOR_DESCONTO_BALCAO'
      'VALOR_DESCONTO_DELIVERY=VALOR_DESCONTO_DELIVERY'
      'TOTAL_GERAL=TOTAL_GERAL')
    DataSet = qryRelEstatisticaVendas
    BCDToCurrency = False
    Left = 632
    Top = 539
  end
  object qryResumoCaixaTurno: TIBQuery
    Database = dm.dbrestaurante
    Transaction = dm.transacao
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      ''
      
        'select * from v_resumo_caixa_por_turno where data between '#39'01.02' +
        '.2014'#39' and '#39'28.02.2014'#39)
    Left = 310
    Top = 362
  end
  object dtResumoCaixaTurno: TfrxDBDataset
    UserName = 'dtResumoCaixaTurno'
    CloseDataSource = False
    DataSet = qryResumoCaixaTurno
    BCDToCurrency = False
    Left = 344
    Top = 362
  end
  object qryProdutosTransferenciaMesas: TIBQuery
    Database = dm.dbrestaurante
    Transaction = dm.transacao
    BufferChunks = 1000
    CachedUpdates = False
    DataSource = dsQryTransferenciaMesas
    ParamCheck = True
    SQL.Strings = (
      ' select * from produtos_transferencias_mesa pt'
      '  inner join produtos p on (p.cod_produto = pt.cod_produto)'
      '   where pt.cod_transferencia = :codigo')
    Left = 391
    Top = 146
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'codigo'
        ParamType = ptUnknown
      end>
  end
  object frxDBDataset1: TfrxDBDataset
    UserName = 'dtTransferenciasMesa'
    CloseDataSource = False
    FieldAliases.Strings = (
      'CODIGO=CODIGO'
      'MESA_ORIGEM=MESA_ORIGEM'
      'MESA_DESTINO=MESA_DESTINO'
      'TOTAL_MESA_ORIGEM=TOTAL_MESA_ORIGEM'
      'TOTAL_MESA_DESTINO=TOTAL_MESA_DESTINO'
      'COD_CAIXA=COD_CAIXA'
      'HORA=HORA'
      'COD_USUARIO_AUTORIZOU=COD_USUARIO_AUTORIZOU'
      'NOME_USUARIO_AUTORIZOU=NOME_USUARIO_AUTORIZOU')
    DataSet = qryProdutosTransferenciaMesas
    BCDToCurrency = False
    Left = 423
    Top = 146
  end
  object dsQryTransferenciaMesas: TDataSource
    DataSet = qryTransferenciasMesa
    Left = 473
    Top = 95
  end
  object qryRD: TIBQuery
    Database = dm.dbrestaurante
    Transaction = dm.transacao
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      
        'select pj.mes, pj.ano,  rg.cod_grupo_raiz, g1.descricao as desc_' +
        'raiz, rg.cod_grupo_pai,g2.descricao as desc_pai, rg.cod_grupo,  ' +
        ' rg.nivel,rg.cod_formatado||'#39' - '#39'|| udf_trim(rg.descricao) as de' +
        'scricao,'
      
        '     tg.projecao_inicial,  cast(tg.perc_proj_fat as numeric(10,2' +
        ')) as PERC_PROJ_FAT ,'
      
        '     tg.reprojecao, cast(tg.perc_reproj_fat as numeric(10,2)) AS' +
        ' PERC_REPROJ_FAT,'
      
        '     tg.total, cast(tg.perc_fat_real  as numeric(10,2)) AS PERC_' +
        'FAT_REAL,'
      '     (tg.total - tg.reprojecao) as saldo,'
      '     cast(TG.PERC_DESP_GERAL as numeric(10,2)) as perc_geral,'
      
        '     cast(TG.PERC_DESP_GRUPO_PAI as numeric(10,2)) as perc_grupo' +
        '_pai,'
      
        '     tg.proj_fat_mes,tg.reproj_fat_mes,tg.fat_real_mes          ' +
        '                                      a'
      ''
      ''
      '       from projecoes_despesas_rd pj  '
      
        '  inner join totais_despesas_grupo('#39'01.08.2014'#39','#39'30.08.2014'#39') tg' +
        ' on (tg.cod_grupo = pj.cod_grupo)'
      '  inner join r_grupos rg on (rg.cod_grupo = tg.cod_grupo) '
      '  inner join grupos g1 on (g1.cod_grupo = rg.cod_grupo_raiz)'
      '  inner join grupos g2 on (g2.cod_grupo = rg.cod_grupo_pai)'
      ''
      ' where pj.mes=8 and pj.ano = 2014 and rg.nivel=3'
      
        '    order by rg.cod_grupo_raiz,rg.desdobramento_pai,rg.desdobram' +
        'ento_filho'
      ''
      ''
      ''
      ''
      '')
    Left = 697
    Top = 520
  end
  object dtRd: TfrxDBDataset
    UserName = 'dtRD'
    CloseDataSource = False
    FieldAliases.Strings = (
      'MES=MES'
      'ANO=ANO'
      'COD_GRUPO_RAIZ=COD_GRUPO_RAIZ'
      'DESC_RAIZ=DESC_RAIZ'
      'COD_GRUPO_PAI=COD_GRUPO_PAI'
      'DESC_PAI=DESC_PAI'
      'COD_GRUPO=COD_GRUPO'
      'NIVEL=NIVEL'
      'DESCRICAO=DESCRICAO'
      'PROJECAO_INICIAL=PROJECAO_INICIAL'
      'PERC_PROJ_FAT=PERC_PROJ_FAT'
      'REPROJECAO=REPROJECAO'
      'PERC_REPROJ_FAT=PERC_REPROJ_FAT'
      'TOTAL=TOTAL'
      'PERC_FAT_REAL=PERC_FAT_REAL'
      'SALDO=SALDO'
      'PERC_GERAL=PERC_GERAL'
      'PERC_GRUPO_PAI=PERC_GRUPO_PAI'
      'PROJ_FAT_MES=PROJ_FAT_MES'
      'REPROJ_FAT_MES=REPROJ_FAT_MES'
      'A=A')
    DataSet = qryRD
    BCDToCurrency = False
    Left = 724
    Top = 520
  end
  object qryRelGruposApuracao: TIBQuery
    Database = dm.dbrestaurante
    Transaction = dm.transacao
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      ''
      ''
      ''
      ''
      ''
      '  select  t.cod_grupo_apuracao, g.descricao as desc_grupo_ap,'
      '   g.pis as al_pis,'
      '   g.cofins as al_cofins,'
      '   g.cont_social as al_social,'
      '   g.imposto_renda as al_ir,'
      '   g.icms as al_icms,'
      '  sum( t.basecalculo) as base_calculo,'
      '  sum ( ( (t.basecalculo * g.pis) / 100) ) as total_pis,'
      '  sum ( ( (t.basecalculo * g.cofins ) / 100)) as total_cofins,'
      
        '  sum ( ( (t.basecalculo * g.cont_social  ) / 100)  ) as total_c' +
        '_social,'
      
        '  sum(  ( (t.basecalculo * g.imposto_renda   ) / 100) ) as total' +
        '_ir,'
      '  sum(  ( (t.basecalculo * g.icms    ) / 100)) as total_icms'
      '  from totais_grupo_apuracao('#39'01.12.2014'#39','#39'31.12.2014'#39') t'
      
        '   inner join grupos_apuracao g on (g.codigo = t.cod_grupo_apura' +
        'cao)'
      
        '   group by t.cod_grupo_apuracao,g.descricao,  g.pis,  g.cofins ' +
        ', g.cont_social , g.imposto_renda , g.icms'
      ''
      ''
      'order by t.cod_grupo_apuracao')
    Left = 839
    Top = 478
  end
  object ddtRelGruposApuracao: TfrxDBDataset
    UserName = 'ddtRelGruposApuracao'
    CloseDataSource = False
    DataSet = qryRelGruposApuracao
    BCDToCurrency = False
    Left = 867
    Top = 476
  end
  object qryRelGruposApuracaoSintetico: TIBQuery
    Database = dm.dbrestaurante
    Transaction = dm.transacao
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      ''
      ''
      
        'select rs.*, (rs.total_pis + rs.total_cofins + rs.total_c_social' +
        ' + rs.total_ir + rs.total_icms) as total_impostos   from ('
      ''
      '  select  t.cod_grupo_apuracao, g.descricao as desc_grupo_ap,'
      '   g.pis as al_pis,'
      '   g.cofins as al_cofins,'
      '   g.cont_social as al_social,'
      '   g.imposto_renda as al_ir,'
      '   g.icms as al_icms,'
      '  sum( t.basecalculo) as base_calculo,'
      '  sum ( ( (t.basecalculo * g.pis) / 100) ) as total_pis,'
      '  sum ( ( (t.basecalculo * g.cofins ) / 100)) as total_cofins,'
      
        '  sum ( ( (t.basecalculo * g.cont_social  ) / 100)  ) as total_c' +
        '_social,'
      
        '  sum(  ( (t.basecalculo * g.imposto_renda   ) / 100) ) as total' +
        '_ir,'
      '  sum(  ( (t.basecalculo * g.icms    ) / 100)) as total_icms'
      '  from totais_grupo_apuracao('#39'01.12.2014'#39','#39'31.12.2014'#39') t'
      
        '   inner join grupos_apuracao g on (g.codigo = t.cod_grupo_apura' +
        'cao)'
      
        '   group by t.cod_grupo_apuracao,g.descricao,  g.pis,  g.cofins ' +
        ', g.cont_social , g.imposto_renda , g.icms'
      ''
      ''
      'order by t.cod_grupo_apuracao'
      '               ) as rs')
    Left = 837
    Top = 542
  end
  object frxDBDataset2: TfrxDBDataset
    UserName = 'DTRelGruposApuracaoSintetico'
    CloseDataSource = False
    FieldAliases.Strings = (
      'COD_GRUPO_APURACAO=COD_GRUPO_APURACAO'
      'DESC_GRUPO_AP=DESC_GRUPO_AP'
      'AL_PIS=AL_PIS'
      'AL_COFINS=AL_COFINS'
      'AL_SOCIAL=AL_SOCIAL'
      'AL_IR=AL_IR'
      'AL_ICMS=AL_ICMS'
      'BASE_CALCULO=BASE_CALCULO'
      'TOTAL_PIS=TOTAL_PIS'
      'TOTAL_COFINS=TOTAL_COFINS'
      'TOTAL_C_SOCIAL=TOTAL_C_SOCIAL'
      'TOTAL_IR=TOTAL_IR'
      'TOTAL_ICMS=TOTAL_ICMS'
      'TOTAL_IMPOSTOS=TOTAL_IMPOSTOS')
    DataSet = qryRelGruposApuracaoSintetico
    BCDToCurrency = False
    Left = 869
    Top = 541
  end
  object qryComparativoVendas: TIBQuery
    Database = dm.dbrestaurante
    Transaction = dm.transacao
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      
        'select *  from r_produtos_vendidos_comparativo('#39'01.02.2014'#39','#39'28.' +
        '02.2014'#39','#39'01.02.2015'#39','#39'28.02.2015'#39') r')
    Left = 1092
    Top = 173
  end
  object dtComparativoPeriodoVendas: TfrxDBDataset
    UserName = 'dtComparativoPeriodoVendas'
    CloseDataSource = False
    FieldAliases.Strings = (
      'COD_G_RAIZ=COD_G_RAIZ'
      'DESC_G_RAIZ=DESC_G_RAIZ'
      'COD_G_PAI=COD_G_PAI'
      'DESC_G_PAI=DESC_G_PAI'
      'COD_GRUPO=COD_GRUPO'
      'DESC_GRUPO=DESC_GRUPO'
      'TOTAL_PERIODO_A=TOTAL_PERIODO_A'
      'TOTAL_PERIODO_B=TOTAL_PERIODO_B'
      'OSCILACAO=OSCILACAO')
    DataSet = qryComparativoVendas
    BCDToCurrency = False
    Left = 1065
    Top = 79
  end
  object dtManifestacaoNFE: TfrxDBDataset
    UserName = 'dtManifestacaoNFE'
    CloseDataSource = False
    FieldAliases.Strings = (
      'CHAVE_NFE=CHAVE_NFE'
      'CNPJ=CNPJ'
      'IE=IE'
      'NOME_FORNECEDOR=NOME_FORNECEDOR'
      'DATA_EMISSAO=DATA_EMISSAO'
      'VALOR_NOTA=VALOR_NOTA'
      'NUMERO_NOTA=NUMERO_NOTA'
      'CAMINHO_XML=CAMINHO_XML'
      'DATA_INSERCAO=DATA_INSERCAO'
      'STATUS_NFE=STATUS_NFE'
      'LANCADA=LANCADA'
      'FORN_CADASTRADO=FORN_CADASTRADO'
      'TIPO_MANIFESTACAO=TIPO_MANIFESTACAO'
      'DATA_HORA_MANIFESTACAO=DATA_HORA_MANIFESTACAO'
      'ID_MANIFESTACAO=ID_MANIFESTACAO'
      'PROTOCOLO_MANIFESTACAO=PROTOCOLO_MANIFESTACAO'
      'XML_BAIXADO=XML_BAIXADO'
      'MANIFESTO=MANIFESTO')
    DataSource = dm.dsManifestacaoNFE
    BCDToCurrency = False
    Left = 955
    Top = 65
  end
  object qryProd: TIBQuery
    Database = dm.dbrestaurante
    Transaction = dm.transacao
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      'select * from etiquetas_p65 et'
      'order by linha')
    Left = 996
    Top = 32
  end
  object dtProd: TfrxDBDataset
    UserName = 'dtProd'
    CloseDataSource = False
    FieldAliases.Strings = (
      'LINHA=LINHA'
      'COD_PROD1=COD_PROD1'
      'COD_PROD2=COD_PROD2'
      'COD_PROD3=COD_PROD3'
      'COD_PROD4=COD_PROD4'
      'COD_PROD5=COD_PROD5'
      'VL1=VL1'
      'VL2=VL2'
      'VL3=VL3'
      'VL4=VL4'
      'VL5=VL5')
    DataSet = qryProd
    BCDToCurrency = False
    Left = 1050
    Top = 29
  end
  object dtProjecoesRD: TfrxDBDataset
    UserName = 'dtProjecoesRD'
    CloseDataSource = False
    FieldAliases.Strings = (
      'RESULTADO=RESULTADO'
      'COD_GRUPO_RAIZ=COD_GRUPO_RAIZ'
      'DESC_RAIZ=DESC_RAIZ'
      'DESDOBRAMENTO_PAI=DESDOBRAMENTO_PAI'
      'COD_GRUPO_PAI=COD_GRUPO_PAI'
      'DESC_PAI=DESC_PAI'
      'DESDOBRAMENTO_FILHO=DESDOBRAMENTO_FILHO'
      'COD_GRUPO=COD_GRUPO'
      'NIVEL=NIVEL'
      'DESCRICAO=DESCRICAO'
      'PROJECAO_INICIAL=PROJECAO_INICIAL'
      'PERC_PROJ_FAT=PERC_PROJ_FAT'
      'REPROJECAO=REPROJECAO'
      'PERC_REPROJ_FAT=PERC_REPROJ_FAT'
      'TOTAL=TOTAL'
      'PERC_FAT_REAL=PERC_FAT_REAL'
      'SALDO=SALDO'
      'PERC_GERAL=PERC_GERAL'
      'PERC_GRUPO_PAI=PERC_GRUPO_PAI'
      'PROJ_FAT_MES=PROJ_FAT_MES'
      'REPROJ_FAT_MES=REPROJ_FAT_MES'
      'FAT_REAL_MES=FAT_REAL_MES')
    DataSource = dsProjecaoRD
    BCDToCurrency = False
    Left = 620
    Top = 24
  end
  object qryProjecaoRD: TIBQuery
    Database = dm.dbrestaurante
    Transaction = dm.transacao
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      ''
      
        '   select rg.resultado,rg.cod_grupo_raiz, g1.descricao as desc_r' +
        'aiz,'
      
        '          rg.desdobramento_pai, rg.cod_grupo_pai, g2.descricao a' +
        's desc_pai,'
      '      rg.desdobramento_filho ,   pj.cod_grupo,'
      '      rg.nivel,udf_trim(rg.descricao) as descricao,'
      
        '      tg.projecao_inicial,  cast(tg.perc_proj_fat as numeric(10,' +
        '2)) as PERC_PROJ_FAT ,'
      
        '      tg.reprojecao, cast(tg.perc_reproj_fat as numeric(10,2)) A' +
        'S PERC_REPROJ_FAT,       '
      
        '      tg.total, cast(tg.perc_fat_real  as numeric(10,2)) AS PERC' +
        '_FAT_REAL,                '
      
        '      (tg.total - tg.reprojecao) as saldo,                      ' +
        '                          '
      
        '      cast(TG.PERC_DESP_GERAL as numeric(10,2)) as perc_geral,  ' +
        '                          '
      
        '      cast(TG.PERC_DESP_GRUPO_PAI as numeric(10,2)) as perc_grup' +
        'o_pai,                    '
      
        '      tg.proj_fat_mes,tg.reproj_fat_mes,tg.fat_real_mes         ' +
        '                          '
      '     from projecoes_despesas_rd pj '
      ' inner join totais_despesas_grupo('
      #39'01.03.2016'#39
      ','#39'31.03.2016'#39
      ') tg on (tg.cod_grupo = pj.cod_grupo) '
      '  inner join r_grupos rg on (rg.cod_grupo = tg.cod_grupo) '
      '  inner join grupos g1 on (g1.cod_grupo = rg.cod_grupo_raiz   )'
      '  inner join grupos g2 on (g2.cod_grupo = rg.cod_grupo_pai)'
      ''
      
        ' where pj.mes=3 and pj.ano = 2016     and rg.nivel =3   and rg.r' +
        'esultado =1'
      ''
      
        '     order by rg.cod_grupo_raiz,rg.desdobramento_pai,rg.desdobra' +
        'mento_filho ')
    Left = 575
    Top = 31
    object qryProjecaoRDRESULTADO: TSmallintField
      FieldName = 'RESULTADO'
      Origin = 'R_GRUPOS.RESULTADO'
    end
    object qryProjecaoRDCOD_GRUPO_RAIZ: TIBStringField
      FieldName = 'COD_GRUPO_RAIZ'
      Origin = 'R_GRUPOS.COD_GRUPO_RAIZ'
      Size = 6
    end
    object qryProjecaoRDDESC_RAIZ: TIBStringField
      FieldName = 'DESC_RAIZ'
      Origin = 'GRUPOS.DESCRICAO'
      Size = 30
    end
    object qryProjecaoRDDESDOBRAMENTO_PAI: TIBStringField
      FieldName = 'DESDOBRAMENTO_PAI'
      Origin = 'R_GRUPOS.DESDOBRAMENTO_PAI'
      Size = 6
    end
    object qryProjecaoRDCOD_GRUPO_PAI: TIBStringField
      FieldName = 'COD_GRUPO_PAI'
      Origin = 'R_GRUPOS.COD_GRUPO_PAI'
      Size = 6
    end
    object qryProjecaoRDDESC_PAI: TIBStringField
      FieldName = 'DESC_PAI'
      Origin = 'GRUPOS.DESCRICAO'
      Size = 30
    end
    object qryProjecaoRDDESDOBRAMENTO_FILHO: TIBStringField
      FieldName = 'DESDOBRAMENTO_FILHO'
      Origin = 'R_GRUPOS.DESDOBRAMENTO_FILHO'
      Size = 6
    end
    object qryProjecaoRDCOD_GRUPO: TIBStringField
      FieldName = 'COD_GRUPO'
      Origin = 'PROJECOES_DESPESAS_RD.COD_GRUPO'
      Required = True
      Size = 6
    end
    object qryProjecaoRDNIVEL: TSmallintField
      FieldName = 'NIVEL'
      Origin = 'R_GRUPOS.NIVEL'
    end
    object qryProjecaoRDDESCRICAO: TIBStringField
      FieldName = 'DESCRICAO'
      Size = 254
    end
    object qryProjecaoRDPROJECAO_INICIAL: TFloatField
      FieldName = 'PROJECAO_INICIAL'
      Origin = 'TOTAIS_DESPESAS_GRUPO.PROJECAO_INICIAL'
    end
    object qryProjecaoRDPERC_PROJ_FAT: TIBBCDField
      FieldName = 'PERC_PROJ_FAT'
      Precision = 18
      Size = 2
    end
    object qryProjecaoRDREPROJECAO: TFloatField
      FieldName = 'REPROJECAO'
      Origin = 'TOTAIS_DESPESAS_GRUPO.REPROJECAO'
    end
    object qryProjecaoRDPERC_REPROJ_FAT: TIBBCDField
      FieldName = 'PERC_REPROJ_FAT'
      Precision = 18
      Size = 2
    end
    object qryProjecaoRDTOTAL: TFloatField
      FieldName = 'TOTAL'
      Origin = 'TOTAIS_DESPESAS_GRUPO.TOTAL'
    end
    object qryProjecaoRDPERC_FAT_REAL: TIBBCDField
      FieldName = 'PERC_FAT_REAL'
      Precision = 18
      Size = 2
    end
    object qryProjecaoRDSALDO: TFloatField
      FieldName = 'SALDO'
    end
    object qryProjecaoRDPERC_GERAL: TIBBCDField
      FieldName = 'PERC_GERAL'
      Precision = 18
      Size = 2
    end
    object qryProjecaoRDPERC_GRUPO_PAI: TIBBCDField
      FieldName = 'PERC_GRUPO_PAI'
      Precision = 18
      Size = 2
    end
    object qryProjecaoRDPROJ_FAT_MES: TFloatField
      FieldName = 'PROJ_FAT_MES'
      Origin = 'TOTAIS_DESPESAS_GRUPO.PROJ_FAT_MES'
    end
    object qryProjecaoRDREPROJ_FAT_MES: TFloatField
      FieldName = 'REPROJ_FAT_MES'
      Origin = 'TOTAIS_DESPESAS_GRUPO.REPROJ_FAT_MES'
    end
    object qryProjecaoRDFAT_REAL_MES: TFloatField
      FieldName = 'FAT_REAL_MES'
      Origin = 'TOTAIS_DESPESAS_GRUPO.FAT_REAL_MES'
    end
  end
  object dsProjecaoRD: TDataSource
    DataSet = qryProjecaoRD
    Left = 608
    Top = 64
  end
  object rpt: TfrxReport
    Tag = 1
    Version = '5.3.16'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 40784.592118773200000000
    ReportOptions.LastChange = 43590.107813680560000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      ''
      'procedure Page1OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      ' Set('#39'DOM'#39','#39'True'#39');'
      ' Set('#39'SEG'#39','#39'True'#39');'
      ' Set('#39'TER'#39','#39'True'#39');'
      ' Set('#39'QUA'#39','#39'True'#39');'
      ' Set('#39'QUI'#39','#39'True'#39');'
      ' Set('#39'SEX'#39','#39'True'#39');'
      ' Set('#39'SAB'#39','#39'True'#39');'
      '     '
      '    '
      ''
      ''
      '  '
      ' ckbDOM.Checked:=  StrtoBool(<DOM>);  '
      ' ckbSEG.Checked:=  StrtoBool(<SEG>);'
      ' ckbTER.Checked:=  StrtoBool(<TER>);'
      ' ckbQUA.Checked:=  StrtoBool(<QUA>);'
      ' ckbQUI.Checked:=  StrtoBool(<QUI>);'
      ' ckbSEX.Checked:=  StrtoBool(<SEX>);'
      ' ckbSAB.Checked:=  StrtoBool(<SAB>);'
      ''
      ''
      ' ckbDOM1.Checked:=  StrtoBool(<DOM>);  '
      ' ckbSEG1.Checked:=  StrtoBool(<SEG>);'
      ' ckbTER1.Checked:=  StrtoBool(<TER>);'
      ' ckbQUA1.Checked:=  StrtoBool(<QUA>);'
      ' ckbQUI1.Checked:=  StrtoBool(<QUI>);'
      ' ckbSEX1.Checked:=  StrtoBool(<SEX>);'
      ' ckbSAB1.Checked:=  StrtoBool(<SAB>);         '
      ''
      ' ckbDOM2.Checked:=  StrtoBool(<DOM>);  '
      ' ckbSEG2.Checked:=  StrtoBool(<SEG>);'
      ' ckbTER2.Checked:=  StrtoBool(<TER>);'
      ' ckbQUA2.Checked:=  StrtoBool(<QUA>);'
      ' ckbQUI2.Checked:=  StrtoBool(<QUI>);'
      ' ckbSEX2.Checked:=  StrtoBool(<SEX>);'
      ' ckbSAB2.Checked:=  StrtoBool(<SAB>);         '
      ''
      ' ckbDOM3.Checked:=  StrtoBool(<DOM>);  '
      ' ckbSEG3.Checked:=  StrtoBool(<SEG>);'
      ' ckbTER3.Checked:=  StrtoBool(<TER>);'
      ' ckbQUA3.Checked:=  StrtoBool(<QUA>);'
      ' ckbQUI3.Checked:=  StrtoBool(<QUI>);'
      ' ckbSEX3.Checked:=  StrtoBool(<SEX>);'
      ' ckbSAB3.Checked:=  StrtoBool(<SAB>);         '
      ''
      ' ckbDOM4.Checked:=  StrtoBool(<DOM>);  '
      ' ckbSEG4.Checked:=  StrtoBool(<SEG>);'
      ' ckbTER4.Checked:=  StrtoBool(<TER>);'
      ' ckbQUA4.Checked:=  StrtoBool(<QUA>);'
      ' ckbQUI4.Checked:=  StrtoBool(<QUI>);'
      ' ckbSEX4.Checked:=  StrtoBool(<SEX>);'
      ' ckbSAB4.Checked:=  StrtoBool(<SAB>);         '
      '    '
      '  '
      'end;'
      ''
      'procedure MasterData1OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      'if Frac(<Line> / 2) = 0.5 then'
      
        '    memo_zebra.Color := clMoneygreen                            ' +
        '           '
      '  else'
      '    memo_zebra.Color := clWhite;'
      'end;'
      ''
      ''
      'procedure Page2OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '      '
      ''
      'end;'
      ''
      'begin'
      ''
      'end.')
    OnBeforeConnect = rptBeforeConnect
    OnGetValue = rptGetValue
    OnStartReport = 'rptOnStartReport'
    OnReportPrint = 'frxReportOnReportPrint'
    Left = 1006
    Top = 136
    Datasets = <
      item
        DataSet = dtParametros
        DataSetName = 'dtParametros'
      end
      item
        DataSet = dtRelEstatisticaVendas
        DataSetName = 'dtRelEstatisticaVendas'
      end>
    Variables = <
      item
        Name = ' SEI LA'
        Value = Null
      end
      item
        Name = 'TM_DELIVERY'
        Value = Null
      end
      item
        Name = ' DIAS_SELECIONADOS'
        Value = Null
      end
      item
        Name = 'SEG'
        Value = Null
      end
      item
        Name = 'TER'
        Value = Null
      end
      item
        Name = 'QUA'
        Value = Null
      end
      item
        Name = 'QUI'
        Value = Null
      end
      item
        Name = 'SEX'
        Value = Null
      end
      item
        Name = 'SAB'
        Value = Null
      end
      item
        Name = 'DOM'
        Value = Null
      end>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      Orientation = poLandscape
      PaperWidth = 297.000000000000000000
      PaperHeight = 210.000000000000000000
      PaperSize = 9
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      OnBeforePrint = 'Page1OnBeforePrint'
      object ReportTitle1: TfrxReportTitle
        FillType = ftBrush
        Height = 94.488250000000000000
        Top = 18.897650000000000000
        Width = 1046.929810000000000000
        object Memo26: TfrxMemoView
          Align = baCenter
          Left = 345.705010000000100000
          Top = 38.456710000000000000
          Width = 355.519790000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            'RELAT'#211'RIO DE ESTAT'#205'STICA DE VENDAS')
          ParentFont = False
        end
        object Line1: TfrxLineView
          Left = 3.000000000000000000
          Top = 86.307050000000000000
          Width = 1047.645640000000000000
          StretchMode = smMaxHeight
          Color = clBlack
          Frame.Typ = [ftTop]
          Frame.Width = 2.000000000000000000
        end
        object Memo27: TfrxMemoView
          Left = 3.000000000000000000
          Top = 0.307050000000000300
          Width = 584.488250000000000000
          Height = 22.677180000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            '[dtParametros."RAZAO_SOCIAL"]')
          ParentFont = False
        end
        object Memo28: TfrxMemoView
          Left = 3.000000000000000000
          Top = 19.307050000000000000
          Width = 584.488250000000000000
          Height = 22.677180000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            '[dtParametros."NOME_FANTASIA"]')
          ParentFont = False
        end
        object Memo29: TfrxMemoView
          Left = 946.000000000000000000
          Top = 0.307050000000000300
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = 'mm.dd.yyyy'
          DisplayFormat.Kind = fkDateTime
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[Date]')
          ParentFont = False
        end
        object Memo33: TfrxMemoView
          Left = 947.000000000000000000
          Top = 23.307050000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = 'hh:mm'
          DisplayFormat.Kind = fkDateTime
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[Time]')
          ParentFont = False
        end
        object lbPeriodo: TfrxMemoView
          Align = baCenter
          Left = 200.146105000000000000
          Top = 57.322819999999990000
          Width = 646.637600000000000000
          Height = 22.677180000000000000
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            '[PeriodoRelatorio]')
          ParentFont = False
        end
        object Memo63: TfrxMemoView
          Left = 3.779530000000000000
          Top = 45.354360000000000000
          Width = 26.456710000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            'DOM')
          ParentFont = False
          VAlign = vaCenter
        end
        object ckbDOM: TfrxCheckBoxView
          Left = 3.779530000000000000
          Top = 64.252010000000000000
          Width = 26.456710000000000000
          Height = 18.897650000000000000
          CheckColor = clBlack
          Checked = False
          CheckStyle = csCross
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
        end
        object Memo64: TfrxMemoView
          Left = 30.236240000000000000
          Top = 45.354360000000000000
          Width = 26.456710000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            'SEG')
          ParentFont = False
          VAlign = vaCenter
        end
        object ckbSEG: TfrxCheckBoxView
          Left = 30.236240000000000000
          Top = 64.252010000000000000
          Width = 26.456710000000000000
          Height = 18.897650000000000000
          CheckColor = clBlack
          Checked = False
          CheckStyle = csCross
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
        end
        object Memo65: TfrxMemoView
          Left = 56.692950000000000000
          Top = 45.354360000000000000
          Width = 26.456710000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            'TER')
          ParentFont = False
          VAlign = vaCenter
        end
        object ckbTER: TfrxCheckBoxView
          Left = 56.692950000000000000
          Top = 64.252010000000000000
          Width = 26.456710000000000000
          Height = 18.897650000000000000
          CheckColor = clBlack
          Checked = False
          CheckStyle = csCross
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
        end
        object Memo66: TfrxMemoView
          Left = 83.149660000000000000
          Top = 45.354360000000000000
          Width = 26.456710000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            'QUA')
          ParentFont = False
          VAlign = vaCenter
        end
        object ckbQUA: TfrxCheckBoxView
          Left = 83.149660000000000000
          Top = 64.252010000000000000
          Width = 26.456710000000000000
          Height = 18.897650000000000000
          CheckColor = clBlack
          Checked = False
          CheckStyle = csCross
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
        end
        object Memo67: TfrxMemoView
          Left = 109.606370000000000000
          Top = 45.354360000000000000
          Width = 26.456710000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            'QUI')
          ParentFont = False
          VAlign = vaCenter
        end
        object ckbQUI: TfrxCheckBoxView
          Left = 109.606370000000000000
          Top = 64.252010000000000000
          Width = 26.456710000000000000
          Height = 18.897650000000000000
          CheckColor = clBlack
          Checked = False
          CheckStyle = csCross
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
        end
        object Memo68: TfrxMemoView
          Left = 136.063080000000000000
          Top = 45.354360000000000000
          Width = 26.456710000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            'SEX')
          ParentFont = False
          VAlign = vaCenter
        end
        object ckbSEX: TfrxCheckBoxView
          Left = 136.063080000000000000
          Top = 64.252010000000000000
          Width = 26.456710000000000000
          Height = 18.897650000000000000
          CheckColor = clBlack
          Checked = False
          CheckStyle = csCross
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
        end
        object Memo69: TfrxMemoView
          Left = 162.519790000000000000
          Top = 45.354360000000000000
          Width = 26.456710000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            'SAB')
          ParentFont = False
          VAlign = vaCenter
        end
        object ckbSAB: TfrxCheckBoxView
          Left = 162.519790000000000000
          Top = 64.252010000000000000
          Width = 26.456710000000000000
          Height = 18.897650000000000000
          CheckColor = clBlack
          Checked = False
          CheckStyle = csCross
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
        end
      end
      object MasterData1: TfrxMasterData
        FillType = ftBrush
        Height = 32.370130000000000000
        Top = 241.889920000000000000
        Width = 1046.929810000000000000
        OnBeforePrint = 'MasterData1OnBeforePrint'
        DataSet = dtRelEstatisticaVendas
        DataSetName = 'dtRelEstatisticaVendas'
        RowCount = 0
        object memo_zebra: TfrxMemoView
          Top = 0.133890000000008100
          Width = 1046.929810000000000000
          Height = 30.236240000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -15
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo51: TfrxMemoView
          Left = 116.165430000000000000
          Top = 15.897650000000030000
          Width = 64.252010000000000000
          Height = 15.118120000000000000
          DataSet = dtRelEstatisticaVendas
          DataSetName = 'dtRelEstatisticaVendas'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            
              '[<dtRelEstatisticaVendas."TOTAL_MESAS"> / <dtRelEstatisticaVenda' +
              's."QTD_VENDAS_MESAS">]')
          ParentFont = False
        end
        object Memo52: TfrxMemoView
          Left = 180.417440000000000000
          Top = 15.897650000000030000
          Width = 64.252010000000000000
          Height = 15.118120000000000000
          DataSet = dtRelEstatisticaVendas
          DataSetName = 'dtRelEstatisticaVendas'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            
              '[(<dtRelEstatisticaVendas."TOTAL_MESAS">+<dtRelEstatisticaVendas' +
              '."TOTAL_BALCAO">+<dtRelEstatisticaVendas."TOTAL_DELIVERY">) / (<' +
              'dtRelEstatisticaVendas."QTD_PESSOAS_MESA">+<dtRelEstatisticaVend' +
              'as."QTD_VENDAS_BALCAO">+<dtRelEstatisticaVendas."QTD_VENDAS_DELI' +
              'VERY">)]')
          ParentFont = False
        end
        object Memo53: TfrxMemoView
          Left = 244.669450000000000000
          Top = 15.897650000000030000
          Width = 64.252010000000000000
          Height = 15.118120000000000000
          DataSet = dtRelEstatisticaVendas
          DataSetName = 'dtRelEstatisticaVendas'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            
              '[<dtRelEstatisticaVendas."TOTAL_BALCAO"> / <dtRelEstatisticaVend' +
              'as."QTD_VENDAS_BALCAO">]')
          ParentFont = False
        end
        object Memo54: TfrxMemoView
          Left = 308.921460000000000000
          Top = 15.897650000000030000
          Width = 64.252010000000000000
          Height = 15.118120000000000000
          DataSet = dtRelEstatisticaVendas
          DataSetName = 'dtRelEstatisticaVendas'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            
              '[<dtRelEstatisticaVendas."TOTAL_DELIVERY"> / <dtRelEstatisticaVe' +
              'ndas."QTD_VENDAS_DELIVERY">]')
          ParentFont = False
        end
        object Memo20: TfrxMemoView
          Top = 0.779529999999994100
          Width = 60.472480000000000000
          Height = 30.236240000000000000
          DataField = 'DATA'
          DataSet = dtRelEstatisticaVendas
          DataSetName = 'dtRelEstatisticaVendas'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = 'DD/MM/YYYY'
          DisplayFormat.Kind = fkDateTime
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            '[dtRelEstatisticaVendas."DATA"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo21: TfrxMemoView
          Left = 61.252010000000000000
          Top = 0.779529999999994100
          Width = 52.913420000000000000
          Height = 30.236240000000000000
          DataField = 'DIA'
          DataSet = dtRelEstatisticaVendas
          DataSetName = 'dtRelEstatisticaVendas'
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            '[dtRelEstatisticaVendas."DIA"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo22: TfrxMemoView
          Left = 116.165430000000000000
          Top = 0.779529999999994100
          Width = 64.252010000000000000
          Height = 15.118120000000000000
          DataField = 'QTD_VENDAS_MESAS'
          DataSet = dtRelEstatisticaVendas
          DataSetName = 'dtRelEstatisticaVendas'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2m'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            '[dtRelEstatisticaVendas."QTD_VENDAS_MESAS"]')
          ParentFont = False
        end
        object Memo23: TfrxMemoView
          Left = 180.417440000000000000
          Top = 0.779529999999994100
          Width = 64.252010000000000000
          Height = 15.118120000000000000
          DataSet = dtRelEstatisticaVendas
          DataSetName = 'dtRelEstatisticaVendas'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            
              '[(<dtRelEstatisticaVendas."QTD_PESSOAS_MESA">+<dtRelEstatisticaV' +
              'endas."QTD_VENDAS_BALCAO">+<dtRelEstatisticaVendas."QTD_VENDAS_D' +
              'ELIVERY">)]')
          ParentFont = False
        end
        object Memo32: TfrxMemoView
          Left = 244.669450000000000000
          Top = 0.779529999999994100
          Width = 64.252010000000000000
          Height = 15.118120000000000000
          DataField = 'QTD_VENDAS_BALCAO'
          DataSet = dtRelEstatisticaVendas
          DataSetName = 'dtRelEstatisticaVendas'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2m'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            '[dtRelEstatisticaVendas."QTD_VENDAS_BALCAO"]')
          ParentFont = False
        end
        object Memo45: TfrxMemoView
          Left = 308.921460000000000000
          Top = 0.779529999999994100
          Width = 64.252010000000000000
          Height = 15.118120000000000000
          DataField = 'QTD_VENDAS_DELIVERY'
          DataSet = dtRelEstatisticaVendas
          DataSetName = 'dtRelEstatisticaVendas'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2m'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            '[dtRelEstatisticaVendas."QTD_VENDAS_DELIVERY"]')
          ParentFont = False
        end
        object Memo46: TfrxMemoView
          Left = 373.173470000000000000
          Top = 0.779529999999994100
          Width = 79.370130000000000000
          Height = 15.118110240000000000
          DataField = 'TOTAL_PRODUTOS_MESA'
          DataSet = dtRelEstatisticaVendas
          DataSetName = 'dtRelEstatisticaVendas'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.UTF8W = (
            '[dtRelEstatisticaVendas."TOTAL_PRODUTOS_MESA"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo47: TfrxMemoView
          Left = 630.181510000000000000
          Top = 0.779529999999994100
          Width = 79.370078740000000000
          Height = 30.236220470000000000
          DataSet = dtRelEstatisticaVendas
          DataSetName = 'dtRelEstatisticaVendas'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.UTF8W = (
            
              '[(<dtRelEstatisticaVendas."TOTAL_PRODUTOS_MESA">+<dtRelEstatisti' +
              'caVendas."TOTAL_PRODUTOS_BALCAO">+<dtRelEstatisticaVendas."TOTAL' +
              '_PRODUTOS_DELIVERY">)]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo48: TfrxMemoView
          Left = 710.551181100000000000
          Top = 0.779529999999994100
          Width = 79.370078740000000000
          Height = 30.236240000000000000
          DataSet = dtRelEstatisticaVendas
          DataSetName = 'dtRelEstatisticaVendas'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.UTF8W = (
            '[dtRelEstatisticaVendas."TOTAL_TAXA_SERVICO"] ')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo49: TfrxMemoView
          Left = 789.921259840000000000
          Top = 0.779529999999994100
          Width = 79.370078740000000000
          Height = 30.236240000000000000
          DataSet = dtRelEstatisticaVendas
          DataSetName = 'dtRelEstatisticaVendas'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.UTF8W = (
            '[dtRelEstatisticaVendas."TOTAL_TAXA_ENTREGA"] ')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo50: TfrxMemoView
          Left = 932.543910000000000000
          Top = 0.779529999999994100
          Width = 113.385826770000000000
          Height = 30.236240000000000000
          DataSet = dtRelEstatisticaVendas
          DataSetName = 'dtRelEstatisticaVendas'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -15
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.UTF8W = (
            
              '[(<dtRelEstatisticaVendas."TOTAL_MESAS">+<dtRelEstatisticaVendas' +
              '."TOTAL_BALCAO">+<dtRelEstatisticaVendas."TOTAL_DELIVERY">)]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo55: TfrxMemoView
          Left = 452.543600000000000000
          Top = 0.779529999999994100
          Width = 79.370130000000000000
          Height = 15.118110240000000000
          DataField = 'TOTAL_PRODUTOS_BALCAO'
          DataSet = dtRelEstatisticaVendas
          DataSetName = 'dtRelEstatisticaVendas'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.UTF8W = (
            '[dtRelEstatisticaVendas."TOTAL_PRODUTOS_BALCAO"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo56: TfrxMemoView
          Left = 531.913730000000000000
          Top = 0.779529999999994100
          Width = 98.267780000000000000
          Height = 15.118110240000000000
          DataField = 'TOTAL_PRODUTOS_DELIVERY'
          DataSet = dtRelEstatisticaVendas
          DataSetName = 'dtRelEstatisticaVendas'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.UTF8W = (
            '[dtRelEstatisticaVendas."TOTAL_PRODUTOS_DELIVERY"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo42: TfrxMemoView
          Left = 373.039370080000000000
          Top = 15.874015749999980000
          Width = 79.370130000000000000
          Height = 15.118110240000000000
          DataSet = dtRelEstatisticaVendas
          DataSetName = 'dtRelEstatisticaVendas'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftRight, ftBottom]
          HAlign = haRight
          Memo.UTF8W = (
            '[dtRelEstatisticaVendas."VALOR_DESCONTO_MESA"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo43: TfrxMemoView
          Left = 452.409448820000000000
          Top = 15.874015749999980000
          Width = 79.370130000000000000
          Height = 15.118110240000000000
          DataSet = dtRelEstatisticaVendas
          DataSetName = 'dtRelEstatisticaVendas'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftBottom]
          HAlign = haRight
          Memo.UTF8W = (
            '[dtRelEstatisticaVendas."VALOR_DESCONTO_BALCAO"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo44: TfrxMemoView
          Left = 531.779527560000000000
          Top = 15.874015749999980000
          Width = 98.267780000000000000
          Height = 15.118110240000000000
          DataSet = dtRelEstatisticaVendas
          DataSetName = 'dtRelEstatisticaVendas'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftBottom]
          HAlign = haRight
          Memo.UTF8W = (
            '[dtRelEstatisticaVendas."VALOR_DESCONTO_DELIVERY"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo58: TfrxMemoView
          Left = 869.291900000000000000
          Width = 64.251968500000000000
          Height = 30.236240000000000000
          DataSet = dtRelEstatisticaVendas
          DataSetName = 'dtRelEstatisticaVendas'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftTop, ftBottom]
          HAlign = haRight
          Memo.UTF8W = (
            
              '[<dtRelEstatisticaVendas."VALOR_DESCONTO_MESA">+<dtRelEstatistic' +
              'aVendas."VALOR_DESCONTO_BALCAO">+<dtRelEstatisticaVendas."VALOR_' +
              'DESCONTO_DELIVERY">]')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object PageFooter1: TfrxPageFooter
        FillType = ftBrush
        Height = 22.677180000000000000
        Top = 393.071120000000000000
        Width = 1046.929810000000000000
        object Memo1: TfrxMemoView
          Left = 971.339210000000000000
          Width = 75.590600000000000000
          Height = 18.897650000000000000
          HAlign = haRight
          Memo.UTF8W = (
            '[Page#]')
        end
      end
      object PageHeader1: TfrxPageHeader
        FillType = ftBrush
        Height = 45.354360000000000000
        Top = 136.063080000000000000
        Width = 1046.929810000000000000
        object Memo4: TfrxMemoView
          Left = 1.000000000000000000
          Top = 15.118120000000010000
          Width = 60.472480000000000000
          Height = 30.236240000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Fill.BackColor = 16629143
          HAlign = haCenter
          Memo.UTF8W = (
            'DATA')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo2: TfrxMemoView
          Left = 62.252010000000000000
          Top = 15.118120000000010000
          Width = 52.913420000000000000
          Height = 30.236240000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Fill.BackColor = 52479
          HAlign = haCenter
          Memo.UTF8W = (
            'DIA')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo10: TfrxMemoView
          Left = 117.165430000000000000
          Width = 257.008040000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Fill.BackColor = 16774348
          HAlign = haCenter
          Memo.UTF8W = (
            'N. de Atendimentos / Ticket M'#233'd.')
          ParentFont = False
        end
        object Memo11: TfrxMemoView
          Left = 117.165430000000000000
          Top = 15.118120000000010000
          Width = 64.252010000000000000
          Height = 30.236240000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Fill.BackColor = 16774348
          HAlign = haCenter
          Memo.UTF8W = (
            'Mesas')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo12: TfrxMemoView
          Left = 181.417440000000000000
          Top = 15.118120000000010000
          Width = 64.252010000000000000
          Height = 30.236240000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Fill.BackColor = 16774348
          HAlign = haCenter
          Memo.UTF8W = (
            'Pessoas')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo13: TfrxMemoView
          Left = 245.669450000000000000
          Top = 15.118120000000010000
          Width = 64.252010000000000000
          Height = 30.236240000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Fill.BackColor = 16774348
          HAlign = haCenter
          Memo.UTF8W = (
            'Balc'#227'o')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo14: TfrxMemoView
          Left = 309.921460000000000000
          Top = 15.118120000000010000
          Width = 64.252010000000000000
          Height = 30.236240000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Fill.BackColor = 16774348
          HAlign = haCenter
          Memo.UTF8W = (
            'Delivery')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo5: TfrxMemoView
          Left = 374.173470000000000000
          Width = 257.008040000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Fill.BackColor = 7000063
          HAlign = haCenter
          Memo.UTF8W = (
            'Valor bruto / Descontos')
          ParentFont = False
        end
        object Memo6: TfrxMemoView
          Left = 374.173470000000000000
          Top = 15.118120000000010000
          Width = 79.370130000000000000
          Height = 30.236240000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Fill.BackColor = 7000063
          HAlign = haCenter
          Memo.UTF8W = (
            'Mesas')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo15: TfrxMemoView
          Left = 631.181510000000000000
          Width = 79.370078740000000000
          Height = 45.354360000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Fill.BackColor = 16629143
          HAlign = haCenter
          Memo.UTF8W = (
            'Total bruto')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo16: TfrxMemoView
          Left = 710.551640000000000000
          Width = 79.370078740000000000
          Height = 45.354360000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Fill.BackColor = 16629143
          HAlign = haCenter
          Memo.UTF8W = (
            'Tx. de servi'#231'o')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo17: TfrxMemoView
          Left = 789.921770000000000000
          Width = 79.370078740000000000
          Height = 45.354360000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Fill.BackColor = 16629143
          HAlign = haCenter
          Memo.UTF8W = (
            'TAXA DE ENTREGA')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo18: TfrxMemoView
          Left = 933.543910000000000000
          Width = 113.385826770000000000
          Height = 45.354360000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Fill.BackColor = 16629143
          HAlign = haCenter
          Memo.UTF8W = (
            'TOTAL GERAL DO DIA')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo7: TfrxMemoView
          Left = 453.543600000000000000
          Top = 15.118120000000010000
          Width = 79.370130000000000000
          Height = 30.236240000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Fill.BackColor = 7000063
          HAlign = haCenter
          Memo.UTF8W = (
            'Balc'#227'o')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo8: TfrxMemoView
          Left = 532.913730000000000000
          Top = 15.118120000000010000
          Width = 98.267780000000000000
          Height = 30.236240000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Fill.BackColor = 7000063
          HAlign = haCenter
          Memo.UTF8W = (
            'Delivery')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo57: TfrxMemoView
          Left = 869.291900000000000000
          Width = 64.251958740000000000
          Height = 45.354360000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Fill.BackColor = 16629143
          HAlign = haCenter
          Memo.UTF8W = (
            'Desconto')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object ReportSummary1: TfrxReportSummary
        FillType = ftBrush
        Height = 34.015770000000010000
        Top = 336.378170000000000000
        Width = 1046.929810000000000000
        object Memo3: TfrxMemoView
          Left = 113.385900000000000000
          Width = 933.543910000000000000
          Height = 30.236240000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Fill.BackColor = 15790320
          ParentFont = False
        end
        object Memo25: TfrxMemoView
          Left = 113.385900000000000000
          Width = 64.252010000000000000
          Height = 15.118110240000000000
          DataSet = dtRelEstatisticaVendas
          DataSetName = 'dtRelEstatisticaVendas'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            '[SUM(<dtRelEstatisticaVendas."QTD_VENDAS_MESAS">,MasterData1)]')
          ParentFont = False
        end
        object Memo30: TfrxMemoView
          Left = 177.637910000000000000
          Width = 64.252010000000000000
          Height = 15.118110240000000000
          DataSet = dtRelEstatisticaVendas
          DataSetName = 'dtRelEstatisticaVendas'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            '[SUM('
            '(<dtRelEstatisticaVendas."QTD_PESSOAS_MESA">+'
            
              '<dtRelEstatisticaVendas."QTD_VENDAS_BALCAO">+<dtRelEstatisticaVe' +
              'ndas."QTD_VENDAS_DELIVERY">)'
            ',MasterData1)]')
          ParentFont = False
        end
        object Memo31: TfrxMemoView
          Left = 241.889920000000000000
          Width = 64.252010000000000000
          Height = 15.118110240000000000
          DataSet = dtRelEstatisticaVendas
          DataSetName = 'dtRelEstatisticaVendas'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            '[SUM(<dtRelEstatisticaVendas."QTD_VENDAS_BALCAO">,MasterData1)]')
          ParentFont = False
        end
        object Memo34: TfrxMemoView
          Left = 306.141930000000000000
          Width = 64.252010000000000000
          Height = 15.118110240000000000
          DataSet = dtRelEstatisticaVendas
          DataSetName = 'dtRelEstatisticaVendas'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            
              '[SUM(<dtRelEstatisticaVendas."QTD_VENDAS_DELIVERY">,MasterData1)' +
              ']')
          ParentFont = False
        end
        object Memo35: TfrxMemoView
          Left = 370.393940000000000000
          Width = 79.370130000000000000
          Height = 15.118110240000000000
          DataSet = dtRelEstatisticaVendas
          DataSetName = 'dtRelEstatisticaVendas'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.UTF8W = (
            
              '[SUM(<dtRelEstatisticaVendas."TOTAL_PRODUTOS_MESA">,MasterData1)' +
              ']')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo36: TfrxMemoView
          Left = 627.401980000000000000
          Width = 79.370078740000000000
          Height = 30.236240000000000000
          DataSet = dtRelEstatisticaVendas
          DataSetName = 'dtRelEstatisticaVendas'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.UTF8W = (
            
              '[( (SUM(<dtRelEstatisticaVendas."TOTAL_PRODUTOS_MESA"> ,MasterDa' +
              'ta1))'
            '+'
            
              '(SUM(<dtRelEstatisticaVendas."TOTAL_PRODUTOS_BALCAO"> ,MasterDat' +
              'a1))'
            '+'
            
              '(SUM(<dtRelEstatisticaVendas."TOTAL_PRODUTOS_DELIVERY"> ,MasterD' +
              'ata1)))'
            ']')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo37: TfrxMemoView
          Left = 706.771651100000000000
          Width = 79.370078740000000000
          Height = 30.236240000000000000
          DataSet = dtRelEstatisticaVendas
          DataSetName = 'dtRelEstatisticaVendas'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.UTF8W = (
            '[SUM(<dtRelEstatisticaVendas."TOTAL_TAXA_SERVICO">,MasterData1)]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo38: TfrxMemoView
          Left = 786.141729840000000000
          Width = 79.370078740000000000
          Height = 30.236240000000000000
          DataSet = dtRelEstatisticaVendas
          DataSetName = 'dtRelEstatisticaVendas'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.UTF8W = (
            '[SUM(<dtRelEstatisticaVendas."TOTAL_TAXA_ENTREGA">,MasterData1)]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo39: TfrxMemoView
          Left = 929.764380000000000000
          Width = 113.385826770000000000
          Height = 30.236240000000000000
          DataSet = dtRelEstatisticaVendas
          DataSetName = 'dtRelEstatisticaVendas'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -15
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.UTF8W = (
            '[SUM( (<dtRelEstatisticaVendas."TOTAL_MESAS">+'
            '<dtRelEstatisticaVendas."TOTAL_BALCAO">+'
            '<dtRelEstatisticaVendas."TOTAL_DELIVERY">) ,MasterData1)]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo40: TfrxMemoView
          Left = 449.764070000000000000
          Width = 79.370130000000000000
          Height = 15.118110240000000000
          DataSet = dtRelEstatisticaVendas
          DataSetName = 'dtRelEstatisticaVendas'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.UTF8W = (
            
              '[SUM(<dtRelEstatisticaVendas."TOTAL_PRODUTOS_BALCAO">,MasterData' +
              '1)]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo41: TfrxMemoView
          Left = 529.134199999999900000
          Width = 98.267780000000000000
          Height = 15.118110240000000000
          DataSet = dtRelEstatisticaVendas
          DataSetName = 'dtRelEstatisticaVendas'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.UTF8W = (
            
              '[SUM(<dtRelEstatisticaVendas."TOTAL_PRODUTOS_DELIVERY">,MasterDa' +
              'ta1)]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo9: TfrxMemoView
          Left = 113.385900000000000000
          Top = 15.118110236220450000
          Width = 64.252010000000000000
          Height = 15.118110240000000000
          DataSet = dtRelEstatisticaVendas
          DataSetName = 'dtRelEstatisticaVendas'
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            
              '[( (SUM(<dtRelEstatisticaVendas."TOTAL_PRODUTOS_MESA">,MasterDat' +
              'a1))-'
            
              '(SUM(<dtRelEstatisticaVendas."VALOR_DESCONTO_MESA">,MasterData1)' +
              '))'
            '/'
            '(SUM(<dtRelEstatisticaVendas."QTD_PESSOAS_MESA">,MasterData1))]')
          ParentFont = False
        end
        object Memo19: TfrxMemoView
          Left = 177.637910000000000000
          Top = 15.118119999999980000
          Width = 64.252010000000000000
          Height = 15.118110240000000000
          DataSet = dtRelEstatisticaVendas
          DataSetName = 'dtRelEstatisticaVendas'
          DisplayFormat.FormatStr = '%2.4n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            
              '[( (SUM(<dtRelEstatisticaVendas."TOTAL_PRODUTOS_MESA">-<dtRelEst' +
              'atisticaVendas."VALOR_DESCONTO_MESA"> ,MasterData1))'
            '+'
            
              '(SUM(<dtRelEstatisticaVendas."TOTAL_PRODUTOS_BALCAO">-<dtRelEsta' +
              'tisticaVendas."VALOR_DESCONTO_BALCAO"> ,MasterData1))'
            '+'
            
              '(SUM(<dtRelEstatisticaVendas."TOTAL_PRODUTOS_DELIVERY">-<dtRelEs' +
              'tatisticaVendas."VALOR_DESCONTO_DELIVERY"> ,MasterData1)))'
            ''
            '/'
            
              '(SUM((<dtRelEstatisticaVendas."QTD_PESSOAS_MESA">+<dtRelEstatist' +
              'icaVendas."QTD_VENDAS_BALCAO">+<dtRelEstatisticaVendas."QTD_VEND' +
              'AS_DELIVERY">),MasterData1))]')
          ParentFont = False
        end
        object Memo24: TfrxMemoView
          Left = 241.889920000000000000
          Top = 15.118119999999980000
          Width = 64.252010000000000000
          Height = 15.118110240000000000
          DataSet = dtRelEstatisticaVendas
          DataSetName = 'dtRelEstatisticaVendas'
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            '[( '
            
              'SUM((<dtRelEstatisticaVendas."TOTAL_PRODUTOS_BALCAO">-<dtRelEsta' +
              'tisticaVendas."VALOR_DESCONTO_BALCAO">) ,MasterData1))'
            ''
            ''
            '/'
            '(sum(<dtRelEstatisticaVendas."QTD_VENDAS_BALCAO">,MasterData1))]')
          ParentFont = False
        end
        object Memo59: TfrxMemoView
          Left = 306.141930000000000000
          Top = 15.118119999999980000
          Width = 64.252010000000000000
          Height = 15.118110240000000000
          DataSet = dtRelEstatisticaVendas
          DataSetName = 'dtRelEstatisticaVendas'
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            '[( '
            
              'SUM((<dtRelEstatisticaVendas."TOTAL_PRODUTOS_DELIVERY">-<dtRelEs' +
              'tatisticaVendas."VALOR_DESCONTO_DELIVERY">) ,MasterData1))'
            ''
            ''
            '/'
            
              '(sum(<dtRelEstatisticaVendas."QTD_VENDAS_DELIVERY">,MasterData1)' +
              ')]')
          ParentFont = False
        end
        object Memo60: TfrxMemoView
          Left = 865.512370000000000000
          Width = 64.251958740000000000
          Height = 30.236240000000000000
          DataSet = dtRelEstatisticaVendas
          DataSetName = 'dtRelEstatisticaVendas'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.UTF8W = (
            
              '[SUM((<dtRelEstatisticaVendas."VALOR_DESCONTO_MESA">+<dtRelEstat' +
              'isticaVendas."VALOR_DESCONTO_BALCAO">+<dtRelEstatisticaVendas."V' +
              'ALOR_DESCONTO_DELIVERY">)'
            ',MasterData1)]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo61: TfrxMemoView
          Left = 370.393940000000000000
          Top = 15.118119999999980000
          Width = 79.370130000000000000
          Height = 15.118110240000000000
          DataSet = dtRelEstatisticaVendas
          DataSetName = 'dtRelEstatisticaVendas'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftRight, ftBottom]
          HAlign = haRight
          Memo.UTF8W = (
            
              '[SUM(<dtRelEstatisticaVendas."VALOR_DESCONTO_MESA">,MasterData1)' +
              ']')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo62: TfrxMemoView
          Left = 449.764018740000000000
          Top = 15.118119999999980000
          Width = 79.370130000000000000
          Height = 15.118110240000000000
          DataSet = dtRelEstatisticaVendas
          DataSetName = 'dtRelEstatisticaVendas'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftBottom]
          HAlign = haRight
          Memo.UTF8W = (
            
              '[SUM(<dtRelEstatisticaVendas."VALOR_DESCONTO_BALCAO">,MasterData' +
              '1)]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo126: TfrxMemoView
          Left = 529.134097480000100000
          Top = 15.118119999999980000
          Width = 98.267780000000000000
          Height = 15.118110240000000000
          DataSet = dtRelEstatisticaVendas
          DataSetName = 'dtRelEstatisticaVendas'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftBottom]
          HAlign = haRight
          Memo.UTF8W = (
            
              '[SUM(<dtRelEstatisticaVendas."VALOR_DESCONTO_DELIVERY">,MasterDa' +
              'ta1)]')
          ParentFont = False
          VAlign = vaCenter
        end
      end
    end
    object Page2: TfrxReportPage
      Orientation = poLandscape
      PaperWidth = 297.000000000000000000
      PaperHeight = 210.000000000000000000
      PaperSize = 9
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      object ReportTitle2: TfrxReportTitle
        FillType = ftBrush
        Height = 94.488250000000000000
        Top = 16.000000000000000000
        Width = 1046.929810000000000000
        object Memo70: TfrxMemoView
          Align = baCenter
          Left = 345.705010000000000000
          Top = 38.456710000000000000
          Width = 355.519790000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            'RELAT'#211'RIO DE ESTAT'#205'STICA DE VENDAS')
          ParentFont = False
        end
        object Line2: TfrxLineView
          Left = 3.000000000000000000
          Top = 86.307050000000000000
          Width = 1047.645640000000000000
          StretchMode = smMaxHeight
          Color = clBlack
          Frame.Typ = [ftTop]
          Frame.Width = 2.000000000000000000
        end
        object Memo71: TfrxMemoView
          Left = 3.000000000000000000
          Top = 0.307050000000000000
          Width = 584.488250000000000000
          Height = 22.677180000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            '[dtParametros."RAZAO_SOCIAL"]')
          ParentFont = False
        end
        object Memo72: TfrxMemoView
          Left = 3.000000000000000000
          Top = 17.307050000000000000
          Width = 584.488250000000000000
          Height = 22.677180000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            '[dtParametros."NOME_FANTASIA"]')
          ParentFont = False
        end
        object Memo73: TfrxMemoView
          Left = 946.000000000000000000
          Top = 0.307050000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = 'mm.dd.yyyy'
          DisplayFormat.Kind = fkDateTime
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[Date]')
          ParentFont = False
        end
        object Memo74: TfrxMemoView
          Left = 947.000000000000000000
          Top = 23.307050000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = 'hh:mm'
          DisplayFormat.Kind = fkDateTime
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[Time]')
          ParentFont = False
        end
        object Memo75: TfrxMemoView
          Align = baCenter
          Left = 200.146105000000000000
          Top = 57.322820000000000000
          Width = 646.637600000000000000
          Height = 22.677180000000000000
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            '[PeriodoRelatorio]')
          ParentFont = False
        end
        object Memo76: TfrxMemoView
          Left = 3.779530000000000000
          Top = 45.354360000000000000
          Width = 26.456710000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            'DOM')
          ParentFont = False
          VAlign = vaCenter
        end
        object ckbDOM1: TfrxCheckBoxView
          Left = 3.779530000000000000
          Top = 64.252010000000000000
          Width = 26.456710000000000000
          Height = 18.897650000000000000
          CheckColor = clBlack
          Checked = False
          CheckStyle = csCross
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
        end
        object Memo77: TfrxMemoView
          Left = 30.236240000000000000
          Top = 45.354360000000000000
          Width = 26.456710000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            'SEG')
          ParentFont = False
          VAlign = vaCenter
        end
        object ckbSEG1: TfrxCheckBoxView
          Left = 30.236240000000000000
          Top = 64.252010000000000000
          Width = 26.456710000000000000
          Height = 18.897650000000000000
          CheckColor = clBlack
          Checked = False
          CheckStyle = csCross
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
        end
        object Memo78: TfrxMemoView
          Left = 56.692950000000000000
          Top = 45.354360000000000000
          Width = 26.456710000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            'TER')
          ParentFont = False
          VAlign = vaCenter
        end
        object ckbTER1: TfrxCheckBoxView
          Left = 56.692950000000000000
          Top = 64.252010000000000000
          Width = 26.456710000000000000
          Height = 18.897650000000000000
          CheckColor = clBlack
          Checked = False
          CheckStyle = csCross
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
        end
        object Memo79: TfrxMemoView
          Left = 83.149660000000000000
          Top = 45.354360000000000000
          Width = 26.456710000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            'QUA')
          ParentFont = False
          VAlign = vaCenter
        end
        object ckbQUA1: TfrxCheckBoxView
          Left = 83.149660000000000000
          Top = 64.252010000000000000
          Width = 26.456710000000000000
          Height = 18.897650000000000000
          CheckColor = clBlack
          Checked = False
          CheckStyle = csCross
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
        end
        object Memo80: TfrxMemoView
          Left = 109.606370000000000000
          Top = 45.354360000000000000
          Width = 26.456710000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            'QUI')
          ParentFont = False
          VAlign = vaCenter
        end
        object ckbQUI1: TfrxCheckBoxView
          Left = 109.606370000000000000
          Top = 64.252010000000000000
          Width = 26.456710000000000000
          Height = 18.897650000000000000
          CheckColor = clBlack
          Checked = False
          CheckStyle = csCross
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
        end
        object Memo81: TfrxMemoView
          Left = 136.063080000000000000
          Top = 45.354360000000000000
          Width = 26.456710000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            'SEX')
          ParentFont = False
          VAlign = vaCenter
        end
        object ckbSEX1: TfrxCheckBoxView
          Left = 136.063080000000000000
          Top = 64.252010000000000000
          Width = 26.456710000000000000
          Height = 18.897650000000000000
          CheckColor = clBlack
          Checked = False
          CheckStyle = csCross
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
        end
        object Memo82: TfrxMemoView
          Left = 162.519790000000000000
          Top = 45.354360000000000000
          Width = 26.456710000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            'SAB')
          ParentFont = False
          VAlign = vaCenter
        end
        object ckbSAB1: TfrxCheckBoxView
          Left = 162.519790000000000000
          Top = 64.252010000000000000
          Width = 26.456710000000000000
          Height = 18.897650000000000000
          CheckColor = clBlack
          Checked = False
          CheckStyle = csCross
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
        end
      end
      object Chart1: TfrxChartView
        Left = -22.677180000000000000
        Top = 185.196970000000000000
        Width = 1035.591220000000000000
        Height = 449.764070000000000000
        HighlightColor = clBlack
        Chart = {
          5450463006544368617274054368617274044C656674020003546F7002000557
          696474680390010648656967687403FA00144261636B57616C6C2E50656E2E56
          697369626C65080D4672616D652E56697369626C6508165669657733444F7074
          696F6E732E526F746174696F6E02000A426576656C4F75746572070662764E6F
          6E6505436F6C6F720707636C57686974650D44656661756C7443616E76617306
          0E54474449506C757343616E76617311436F6C6F7250616C65747465496E6465
          78020D000A5442617253657269657307536572696573310C5856616C7565732E
          4E616D650601580D5856616C7565732E4F72646572070B6C6F417363656E6469
          6E670C5956616C7565732E4E616D6506034261720D5956616C7565732E4F7264
          657207066C6F4E6F6E65000000}
        ChartElevation = 345
        SeriesData = <
          item
            InheritedName = 'TfrxSeriesItem2'
            DataType = dtDBData
            DataSet = dtRelEstatisticaVendas
            DataSetName = 'dtRelEstatisticaVendas'
            SortOrder = soNone
            TopN = 0
            XType = xtText
            Source1 = 'dtRelEstatisticaVendas."DATA"'
            Source2 = 'dtRelEstatisticaVendas."TOTAL_GERAL"'
            XSource = 'dtRelEstatisticaVendas."DATA"'
            YSource = 'dtRelEstatisticaVendas."TOTAL_GERAL"'
          end>
      end
      object Memo83: TfrxMemoView
        Align = baCenter
        Left = 345.705010000000000000
        Top = 120.944960000000000000
        Width = 355.519790000000000000
        Height = 18.897650000000000000
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        HAlign = haCenter
        Memo.UTF8W = (
          'GR'#193'FICO DE FATURAMENTO (GERAL)')
        ParentFont = False
      end
    end
    object Page4: TfrxReportPage
      Orientation = poLandscape
      PaperWidth = 297.000000000000000000
      PaperHeight = 210.000000000000000000
      PaperSize = 9
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      object ReportTitle3: TfrxReportTitle
        FillType = ftBrush
        Height = 94.488250000000000000
        Top = 18.897650000000000000
        Width = 1046.929810000000000000
        object Memo84: TfrxMemoView
          Align = baCenter
          Left = 345.705010000000000000
          Top = 38.456710000000000000
          Width = 355.519790000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            'RELAT'#211'RIO DE ESTAT'#205'STICA DE VENDAS')
          ParentFont = False
        end
        object Line3: TfrxLineView
          Align = baLeft
          Top = 90.086580000000000000
          Width = 1047.645640000000000000
          StretchMode = smMaxHeight
          Color = clBlack
          Frame.Typ = [ftTop]
          Frame.Width = 2.000000000000000000
        end
        object Memo85: TfrxMemoView
          Left = -5.118430000000000000
          Top = 0.307050000000000000
          Width = 584.488250000000000000
          Height = 22.677180000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            '[dtParametros."RAZAO_SOCIAL"]')
          ParentFont = False
        end
        object Memo86: TfrxMemoView
          Left = -3.779530000000000000
          Top = 19.307050000000000000
          Width = 584.488250000000000000
          Height = 22.677180000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            '[dtParametros."NOME_FANTASIA"]')
          ParentFont = False
        end
        object Memo87: TfrxMemoView
          Left = 968.677180000000000000
          Top = 0.307050000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = 'mm.dd.yyyy'
          DisplayFormat.Kind = fkDateTime
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[Date]')
          ParentFont = False
        end
        object Memo88: TfrxMemoView
          Left = 969.677180000000000000
          Top = 23.307050000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = 'hh:mm'
          DisplayFormat.Kind = fkDateTime
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[Time]')
          ParentFont = False
        end
        object Memo89: TfrxMemoView
          Align = baCenter
          Left = 200.146105000000000000
          Top = 57.322820000000000000
          Width = 646.637600000000000000
          Height = 22.677180000000000000
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            '[PeriodoRelatorio]')
          ParentFont = False
        end
        object Memo90: TfrxMemoView
          Top = 41.574830000000000000
          Width = 26.456710000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            'DOM')
          ParentFont = False
          VAlign = vaCenter
        end
        object ckbDOM2: TfrxCheckBoxView
          Top = 60.472480000000000000
          Width = 26.456710000000000000
          Height = 18.897650000000000000
          CheckColor = clBlack
          Checked = False
          CheckStyle = csCross
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
        end
        object Memo91: TfrxMemoView
          Left = 26.456710000000000000
          Top = 41.574830000000000000
          Width = 26.456710000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            'SEG')
          ParentFont = False
          VAlign = vaCenter
        end
        object ckbSEG2: TfrxCheckBoxView
          Left = 26.456710000000000000
          Top = 60.472480000000000000
          Width = 26.456710000000000000
          Height = 18.897650000000000000
          CheckColor = clBlack
          Checked = False
          CheckStyle = csCross
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
        end
        object Memo92: TfrxMemoView
          Left = 52.913420000000000000
          Top = 41.574830000000000000
          Width = 26.456710000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            'TER')
          ParentFont = False
          VAlign = vaCenter
        end
        object ckbTER2: TfrxCheckBoxView
          Left = 52.913420000000000000
          Top = 60.472480000000000000
          Width = 26.456710000000000000
          Height = 18.897650000000000000
          CheckColor = clBlack
          Checked = False
          CheckStyle = csCross
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
        end
        object Memo93: TfrxMemoView
          Left = 79.370130000000000000
          Top = 41.574830000000000000
          Width = 26.456710000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            'QUA')
          ParentFont = False
          VAlign = vaCenter
        end
        object ckbQUA2: TfrxCheckBoxView
          Left = 79.370130000000000000
          Top = 60.472480000000000000
          Width = 26.456710000000000000
          Height = 18.897650000000000000
          CheckColor = clBlack
          Checked = False
          CheckStyle = csCross
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
        end
        object Memo94: TfrxMemoView
          Left = 105.826840000000000000
          Top = 41.574830000000000000
          Width = 26.456710000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            'QUI')
          ParentFont = False
          VAlign = vaCenter
        end
        object ckbQUI2: TfrxCheckBoxView
          Left = 105.826840000000000000
          Top = 60.472480000000000000
          Width = 26.456710000000000000
          Height = 18.897650000000000000
          CheckColor = clBlack
          Checked = False
          CheckStyle = csCross
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
        end
        object Memo95: TfrxMemoView
          Left = 132.283550000000000000
          Top = 41.574830000000000000
          Width = 26.456710000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            'SEX')
          ParentFont = False
          VAlign = vaCenter
        end
        object ckbSEX2: TfrxCheckBoxView
          Left = 132.283550000000000000
          Top = 60.472480000000000000
          Width = 26.456710000000000000
          Height = 18.897650000000000000
          CheckColor = clBlack
          Checked = False
          CheckStyle = csCross
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
        end
        object Memo96: TfrxMemoView
          Left = 158.740260000000000000
          Top = 41.574830000000000000
          Width = 26.456710000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            'SAB')
          ParentFont = False
          VAlign = vaCenter
        end
        object ckbSAB2: TfrxCheckBoxView
          Left = 158.740260000000000000
          Top = 60.472480000000000000
          Width = 26.456710000000000000
          Height = 18.897650000000000000
          CheckColor = clBlack
          Checked = False
          CheckStyle = csCross
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
        end
      end
      object Chart2: TfrxChartView
        Left = -30.236240000000000000
        Top = 154.960730000000000000
        Width = 1035.591220000000000000
        Height = 449.764070000000000000
        HighlightColor = clBlack
        Chart = {
          5450463006544368617274054368617274044C656674020003546F7002000557
          696474680390010648656967687403FA00144261636B57616C6C2E50656E2E56
          697369626C65080D4672616D652E56697369626C6508165669657733444F7074
          696F6E732E526F746174696F6E02000A426576656C4F75746572070662764E6F
          6E6505436F6C6F720707636C57686974650D44656661756C7443616E76617306
          0E54474449506C757343616E76617311436F6C6F7250616C65747465496E6465
          78020D000A5442617253657269657307536572696573310B536572696573436F
          6C6F720708636C4D61726F6F6E0C5856616C7565732E4E616D650601580D5856
          616C7565732E4F72646572070B6C6F417363656E64696E670C5956616C756573
          2E4E616D6506034261720D5956616C7565732E4F7264657207066C6F4E6F6E65
          000000}
        ChartElevation = 345
        SeriesData = <
          item
            InheritedName = 'TfrxSeriesItem2'
            DataType = dtDBData
            DataSet = dtRelEstatisticaVendas
            DataSetName = 'dtRelEstatisticaVendas'
            SortOrder = soNone
            TopN = 0
            XType = xtText
            Source1 = 'dtRelEstatisticaVendas."DATA"'
            Source2 = 'dtRelEstatisticaVendas."TOTAL_MESAS"'
            Source4 = 'dtRelEstatisticaVendas."DATA"'
            XSource = 'dtRelEstatisticaVendas."DATA"'
            YSource = 'dtRelEstatisticaVendas."TOTAL_MESAS"'
          end>
      end
      object Memo97: TfrxMemoView
        Align = baCenter
        Left = 345.705010000000000000
        Top = 132.283550000000000000
        Width = 355.519790000000000000
        Height = 18.897650000000000000
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        HAlign = haCenter
        Memo.UTF8W = (
          'GR'#193'FICO DE FATURAMENTO  - MESAS')
        ParentFont = False
      end
    end
    object Page3: TfrxReportPage
      Orientation = poLandscape
      PaperWidth = 297.000000000000000000
      PaperHeight = 210.000000000000000000
      PaperSize = 9
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      object ReportTitle4: TfrxReportTitle
        FillType = ftBrush
        Height = 94.488250000000000000
        Top = 18.897650000000000000
        Width = 1046.929810000000000000
        object Memo98: TfrxMemoView
          Align = baCenter
          Left = 345.705010000000000000
          Top = 38.456710000000000000
          Width = 355.519790000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            'RELAT'#211'RIO DE ESTAT'#205'STICA DE VENDAS')
          ParentFont = False
        end
        object Line4: TfrxLineView
          Left = 55.913420000000000000
          Top = 86.307050000000000000
          Width = 1047.645640000000000000
          StretchMode = smMaxHeight
          Color = clBlack
          Frame.Typ = [ftTop]
          Frame.Width = 2.000000000000000000
        end
        object Memo99: TfrxMemoView
          Left = -0.779530000000000000
          Top = 0.307050000000000000
          Width = 584.488250000000000000
          Height = 22.677180000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            '[dtParametros."RAZAO_SOCIAL"]')
          ParentFont = False
        end
        object Memo100: TfrxMemoView
          Left = -0.779530000000000000
          Top = 17.307050000000000000
          Width = 584.488250000000000000
          Height = 22.677180000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            '[dtParametros."NOME_FANTASIA"]')
          ParentFont = False
        end
        object Memo101: TfrxMemoView
          Left = 998.913420000000000000
          Top = 0.307050000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = 'mm.dd.yyyy'
          DisplayFormat.Kind = fkDateTime
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[Date]')
          ParentFont = False
        end
        object Memo102: TfrxMemoView
          Left = 999.913420000000000000
          Top = 23.307050000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = 'hh:mm'
          DisplayFormat.Kind = fkDateTime
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[Time]')
          ParentFont = False
        end
        object Memo103: TfrxMemoView
          Align = baCenter
          Left = 200.146105000000000000
          Top = 57.322820000000000000
          Width = 646.637600000000000000
          Height = 22.677180000000000000
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            '[PeriodoRelatorio]')
          ParentFont = False
        end
        object Memo104: TfrxMemoView
          Left = 3.779530000000000000
          Top = 45.354360000000000000
          Width = 26.456710000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            'DOM')
          ParentFont = False
          VAlign = vaCenter
        end
        object ckbDOM3: TfrxCheckBoxView
          Left = 3.779530000000000000
          Top = 64.252010000000000000
          Width = 26.456710000000000000
          Height = 18.897650000000000000
          CheckColor = clBlack
          Checked = False
          CheckStyle = csCross
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
        end
        object Memo105: TfrxMemoView
          Left = 30.236240000000000000
          Top = 45.354360000000000000
          Width = 26.456710000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            'SEG')
          ParentFont = False
          VAlign = vaCenter
        end
        object ckbSEG3: TfrxCheckBoxView
          Left = 30.236240000000000000
          Top = 64.252010000000000000
          Width = 26.456710000000000000
          Height = 18.897650000000000000
          CheckColor = clBlack
          Checked = False
          CheckStyle = csCross
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
        end
        object Memo106: TfrxMemoView
          Left = 56.692950000000000000
          Top = 45.354360000000000000
          Width = 26.456710000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            'TER')
          ParentFont = False
          VAlign = vaCenter
        end
        object ckbTER3: TfrxCheckBoxView
          Left = 56.692950000000000000
          Top = 64.252010000000000000
          Width = 26.456710000000000000
          Height = 18.897650000000000000
          CheckColor = clBlack
          Checked = False
          CheckStyle = csCross
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
        end
        object Memo107: TfrxMemoView
          Left = 83.149660000000000000
          Top = 45.354360000000000000
          Width = 26.456710000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            'QUA')
          ParentFont = False
          VAlign = vaCenter
        end
        object ckbQUA3: TfrxCheckBoxView
          Left = 83.149660000000000000
          Top = 64.252010000000000000
          Width = 26.456710000000000000
          Height = 18.897650000000000000
          CheckColor = clBlack
          Checked = False
          CheckStyle = csCross
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
        end
        object Memo108: TfrxMemoView
          Left = 109.606370000000000000
          Top = 45.354360000000000000
          Width = 26.456710000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            'QUI')
          ParentFont = False
          VAlign = vaCenter
        end
        object ckbQUI3: TfrxCheckBoxView
          Left = 109.606370000000000000
          Top = 64.252010000000000000
          Width = 26.456710000000000000
          Height = 18.897650000000000000
          CheckColor = clBlack
          Checked = False
          CheckStyle = csCross
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
        end
        object Memo109: TfrxMemoView
          Left = 136.063080000000000000
          Top = 45.354360000000000000
          Width = 26.456710000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            'SEX')
          ParentFont = False
          VAlign = vaCenter
        end
        object ckbSEX3: TfrxCheckBoxView
          Left = 136.063080000000000000
          Top = 64.252010000000000000
          Width = 26.456710000000000000
          Height = 18.897650000000000000
          CheckColor = clBlack
          Checked = False
          CheckStyle = csCross
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
        end
        object Memo110: TfrxMemoView
          Left = 162.519790000000000000
          Top = 45.354360000000000000
          Width = 26.456710000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            'SAB')
          ParentFont = False
          VAlign = vaCenter
        end
        object ckbSAB3: TfrxCheckBoxView
          Left = 162.519790000000000000
          Top = 64.252010000000000000
          Width = 26.456710000000000000
          Height = 18.897650000000000000
          CheckColor = clBlack
          Checked = False
          CheckStyle = csCross
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
        end
      end
      object Chart3: TfrxChartView
        Left = 7.559060000000000000
        Top = 192.756030000000000000
        Width = 1035.591220000000000000
        Height = 449.764070000000000000
        HighlightColor = clBlack
        Chart = {
          5450463006544368617274054368617274044C656674020003546F7002000557
          696474680390010648656967687403FA00144261636B57616C6C2E50656E2E56
          697369626C65080D4672616D652E56697369626C6508165669657733444F7074
          696F6E732E526F746174696F6E02000A426576656C4F75746572070662764E6F
          6E6505436F6C6F720707636C57686974650D44656661756C7443616E76617306
          0E54474449506C757343616E76617311436F6C6F7250616C65747465496E6465
          78020D000A5442617253657269657307536572696573310B536572696573436F
          6C6F720707636C477265656E0C5856616C7565732E4E616D650601580D585661
          6C7565732E4F72646572070B6C6F417363656E64696E670C5956616C7565732E
          4E616D6506034261720D5956616C7565732E4F7264657207066C6F4E6F6E6500
          0000}
        ChartElevation = 345
        SeriesData = <
          item
            InheritedName = 'TfrxSeriesItem2'
            DataType = dtDBData
            DataSet = dtRelEstatisticaVendas
            DataSetName = 'dtRelEstatisticaVendas'
            SortOrder = soNone
            TopN = 0
            XType = xtText
            Source1 = 'dtRelEstatisticaVendas."DATA"'
            Source2 = 'dtRelEstatisticaVendas."TOTAL_BALCAO"'
            Source4 = 'dtRelEstatisticaVendas."DATA"'
            XSource = 'dtRelEstatisticaVendas."DATA"'
            YSource = 'dtRelEstatisticaVendas."TOTAL_BALCAO"'
          end>
      end
      object Memo111: TfrxMemoView
        Align = baCenter
        Left = 345.705010000000000000
        Top = 120.944960000000000000
        Width = 355.519790000000000000
        Height = 18.897650000000000000
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        HAlign = haCenter
        Memo.UTF8W = (
          'GR'#193'FICO DE FATURAMENTO  - BALC'#195'O')
        ParentFont = False
      end
    end
    object Page5: TfrxReportPage
      Orientation = poLandscape
      PaperWidth = 297.000000000000000000
      PaperHeight = 210.000000000000000000
      PaperSize = 9
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      object ReportTitle5: TfrxReportTitle
        FillType = ftBrush
        Height = 94.488250000000000000
        Top = 18.897650000000000000
        Width = 1046.929810000000000000
        object Memo112: TfrxMemoView
          Align = baCenter
          Left = 345.705010000000000000
          Top = 38.456710000000000000
          Width = 355.519790000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            'RELAT'#211'RIO DE ESTAT'#205'STICA DE VENDAS')
          ParentFont = False
        end
        object Line5: TfrxLineView
          Align = baLeft
          Top = 86.307050000000000000
          Width = 1047.645640000000000000
          StretchMode = smMaxHeight
          Color = clBlack
          Frame.Typ = [ftTop]
          Frame.Width = 2.000000000000000000
        end
        object Memo114: TfrxMemoView
          Left = 3.000000000000000000
          Top = 17.307050000000000000
          Width = 584.488250000000000000
          Height = 22.677180000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            '[dtParametros."NOME_FANTASIA"]')
          ParentFont = False
        end
        object Memo115: TfrxMemoView
          Left = 998.913420000000000000
          Top = 0.307050000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = 'mm.dd.yyyy'
          DisplayFormat.Kind = fkDateTime
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[Date]')
          ParentFont = False
        end
        object Memo116: TfrxMemoView
          Left = 999.913420000000000000
          Top = 23.307050000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = 'hh:mm'
          DisplayFormat.Kind = fkDateTime
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[Time]')
          ParentFont = False
        end
        object Memo117: TfrxMemoView
          Align = baCenter
          Left = 200.146105000000000000
          Top = 57.322820000000000000
          Width = 646.637600000000000000
          Height = 22.677180000000000000
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            '[PeriodoRelatorio]')
          ParentFont = False
        end
        object Memo118: TfrxMemoView
          Left = 3.779530000000000000
          Top = 45.354360000000000000
          Width = 26.456710000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            'DOM')
          ParentFont = False
          VAlign = vaCenter
        end
        object ckbDOM4: TfrxCheckBoxView
          Left = 3.779530000000000000
          Top = 64.252010000000000000
          Width = 26.456710000000000000
          Height = 18.897650000000000000
          CheckColor = clBlack
          Checked = False
          CheckStyle = csCross
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
        end
        object Memo119: TfrxMemoView
          Left = 30.236240000000000000
          Top = 45.354360000000000000
          Width = 26.456710000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            'SEG')
          ParentFont = False
          VAlign = vaCenter
        end
        object ckbSEG4: TfrxCheckBoxView
          Left = 30.236240000000000000
          Top = 64.252010000000000000
          Width = 26.456710000000000000
          Height = 18.897650000000000000
          CheckColor = clBlack
          Checked = False
          CheckStyle = csCross
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
        end
        object Memo120: TfrxMemoView
          Left = 56.692950000000000000
          Top = 45.354360000000000000
          Width = 26.456710000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            'TER')
          ParentFont = False
          VAlign = vaCenter
        end
        object ckbTER4: TfrxCheckBoxView
          Left = 56.692950000000000000
          Top = 64.252010000000000000
          Width = 26.456710000000000000
          Height = 18.897650000000000000
          CheckColor = clBlack
          Checked = False
          CheckStyle = csCross
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
        end
        object Memo121: TfrxMemoView
          Left = 83.149660000000000000
          Top = 45.354360000000000000
          Width = 26.456710000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            'QUA')
          ParentFont = False
          VAlign = vaCenter
        end
        object ckbQUA4: TfrxCheckBoxView
          Left = 83.149660000000000000
          Top = 64.252010000000000000
          Width = 26.456710000000000000
          Height = 18.897650000000000000
          CheckColor = clBlack
          Checked = False
          CheckStyle = csCross
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
        end
        object Memo122: TfrxMemoView
          Left = 109.606370000000000000
          Top = 45.354360000000000000
          Width = 26.456710000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            'QUI')
          ParentFont = False
          VAlign = vaCenter
        end
        object ckbQUI4: TfrxCheckBoxView
          Left = 109.606370000000000000
          Top = 64.252010000000000000
          Width = 26.456710000000000000
          Height = 18.897650000000000000
          CheckColor = clBlack
          Checked = False
          CheckStyle = csCross
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
        end
        object Memo123: TfrxMemoView
          Left = 136.063080000000000000
          Top = 45.354360000000000000
          Width = 26.456710000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            'SEX')
          ParentFont = False
          VAlign = vaCenter
        end
        object ckbSEX4: TfrxCheckBoxView
          Left = 136.063080000000000000
          Top = 64.252010000000000000
          Width = 26.456710000000000000
          Height = 18.897650000000000000
          CheckColor = clBlack
          Checked = False
          CheckStyle = csCross
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
        end
        object Memo124: TfrxMemoView
          Left = 162.519790000000000000
          Top = 45.354360000000000000
          Width = 26.456710000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            'SAB')
          ParentFont = False
          VAlign = vaCenter
        end
        object ckbSAB4: TfrxCheckBoxView
          Left = 162.519790000000000000
          Top = 64.252010000000000000
          Width = 26.456710000000000000
          Height = 18.897650000000000000
          CheckColor = clBlack
          Checked = False
          CheckStyle = csCross
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
        end
        object Memo125: TfrxMemoView
          Align = baCenter
          Left = 345.705010000000000000
          Top = 94.488250000000000000
          Width = 355.519790000000000000
          Height = 18.897650000000000000
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            'GR'#193'FICO DE FATURAMENTO  - DELIVERY')
          ParentFont = False
        end
        object Memo113: TfrxMemoView
          Left = 3.000000000000000000
          Top = 0.307050000000000000
          Width = 584.488250000000000000
          Height = 22.677180000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            '[dtParametros."RAZAO_SOCIAL"]')
          ParentFont = False
        end
      end
      object Chart4: TfrxChartView
        Left = 7.559060000000000000
        Top = 196.535560000000000000
        Width = 1035.591220000000000000
        Height = 449.764070000000000000
        HighlightColor = clBlack
        Chart = {
          5450463006544368617274054368617274044C656674020003546F7002000557
          696474680390010648656967687403FA00144261636B57616C6C2E50656E2E56
          697369626C65080D4672616D652E56697369626C6508165669657733444F7074
          696F6E732E526F746174696F6E02000A426576656C4F75746572070662764E6F
          6E6505436F6C6F720707636C57686974650D44656661756C7443616E76617306
          0E54474449506C757343616E76617311436F6C6F7250616C65747465496E6465
          78020D000A5442617253657269657307536572696573310B536572696573436F
          6C6F720708636C59656C6C6F770C5856616C7565732E4E616D650601580D5856
          616C7565732E4F72646572070B6C6F417363656E64696E670C5956616C756573
          2E4E616D6506034261720D5956616C7565732E4F7264657207066C6F4E6F6E65
          000000}
        ChartElevation = 345
        SeriesData = <
          item
            InheritedName = 'TfrxSeriesItem2'
            DataType = dtDBData
            DataSet = dtRelEstatisticaVendas
            DataSetName = 'dtRelEstatisticaVendas'
            SortOrder = soNone
            TopN = 0
            XType = xtText
            Source1 = 'dtRelEstatisticaVendas."DATA"'
            Source2 = 'dtRelEstatisticaVendas."TOTAL_DELIVERY"'
            Source4 = 'dtRelEstatisticaVendas."DATA"'
            XSource = 'dtRelEstatisticaVendas."DATA"'
            YSource = 'dtRelEstatisticaVendas."TOTAL_DELIVERY"'
          end>
      end
    end
  end
  object frxRTFExport1: TfrxRTFExport
    UseFileCache = True
    ShowProgress = True
    OverwritePrompt = False
    DataOnly = False
    PictureType = gpPNG
    Wysiwyg = True
    Creator = 'FastReport'
    SuppressPageHeadersFooters = False
    HeaderFooterMode = hfText
    AutoSize = False
    Left = 648
    Top = 56
  end
  object frxPDFExport1: TfrxPDFExport
    ExportNotPrintable = True
    UseFileCache = True
    ShowProgress = True
    OverwritePrompt = False
    CreationTime = 42684.498139849540000000
    DataOnly = False
    Compressed = False
    EmbeddedFonts = True
    PrintOptimized = True
    Outline = False
    Background = False
    HTMLTags = True
    Quality = 100
    Author = 'FastReport'
    Subject = 'FastReport PDF export'
    ProtectionFlags = [ePrint, eModify, eCopy, eAnnot]
    HideToolbar = False
    HideMenubar = False
    HideWindowUI = False
    FitWindow = False
    CenterWindow = True
    PrintScaling = False
    Left = 624
    Top = 144
  end
  object qryProdutosGarcons: TIBQuery
    Database = dm.dbrestaurante
    Transaction = dm.transacao
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      'Select mv.cod_garcon,ga.apelido,'
      
        '            p.cod_barras, p.descricao,p.desc_g_raiz,p.desc_g_pai' +
        ',p.descricao_grupo, p.cod_grupo,'
      '            sum(mv.quantidade) as quantidade_vendida,'
      
        '            sum(mv.valor_unitario *  mv.quantidade ) as total_ve' +
        'ndido,'
      
        '            (  sum(mv.quantidade) * p.valor_comissao ) as total_' +
        'comissao'
      '      from movimento_venda mv'
      '       inner join garcons ga on (ga.cod_garcon = mv.cod_garcon)'
      
        '       inner join v_produtos p on (p.cod_produto = mv.cod_produt' +
        'o)'
      '     WHERE MV.data BETWEEN '#39'01.01.2017'#39' AND '#39'31.01.2017'#39
      ' and mv.cod_garcon like '#39'%'#39
      ' and p.cod_grupo like '#39'%'#39
      '     group by mv.cod_garcon, ga.apelido,'
      
        '           p.cod_barras, p.descricao,p.desc_g_raiz,p.desc_g_pai,' +
        'p.descricao_grupo, p.cod_grupo,'
      '            mv.cod_produto,p.valor_comissao '
      'order by mv.cod_garcon,p.cod_grupo')
    Left = 304
    Top = 416
    object qryProdutosGarconsCOD_GARCON: TIBStringField
      FieldName = 'COD_GARCON'
      Origin = '"MOVIMENTO_VENDA"."COD_GARCON"'
      Size = 3
    end
    object qryProdutosGarconsAPELIDO: TIBStringField
      FieldName = 'APELIDO'
      Origin = '"GARCONS"."APELIDO"'
      Required = True
      Size = 30
    end
    object qryProdutosGarconsCOD_BARRAS: TIBStringField
      FieldName = 'COD_BARRAS'
      Origin = '"V_PRODUTOS"."COD_BARRAS"'
    end
    object qryProdutosGarconsDESCRICAO: TIBStringField
      FieldName = 'DESCRICAO'
      Origin = '"V_PRODUTOS"."DESCRICAO"'
      Size = 40
    end
    object qryProdutosGarconsDESC_G_RAIZ: TIBStringField
      FieldName = 'DESC_G_RAIZ'
      Origin = '"V_PRODUTOS"."DESC_G_RAIZ"'
      Size = 30
    end
    object qryProdutosGarconsDESC_G_PAI: TIBStringField
      FieldName = 'DESC_G_PAI'
      Origin = '"V_PRODUTOS"."DESC_G_PAI"'
      Size = 30
    end
    object qryProdutosGarconsDESCRICAO_GRUPO: TIBStringField
      FieldName = 'DESCRICAO_GRUPO'
      Origin = '"V_PRODUTOS"."DESCRICAO_GRUPO"'
      Size = 30
    end
    object qryProdutosGarconsCOD_GRUPO: TIBStringField
      FieldName = 'COD_GRUPO'
      Origin = '"V_PRODUTOS"."COD_GRUPO"'
      Size = 6
    end
    object qryProdutosGarconsQUANTIDADE_VENDIDA: TFMTBCDField
      FieldName = 'QUANTIDADE_VENDIDA'
      ProviderFlags = []
      Precision = 18
      Size = 5
    end
    object qryProdutosGarconsTOTAL_VENDIDO: TFMTBCDField
      FieldName = 'TOTAL_VENDIDO'
      ProviderFlags = []
      Precision = 18
      Size = 7
    end
    object qryProdutosGarconsTOTAL_COMISSAO: TFMTBCDField
      FieldName = 'TOTAL_COMISSAO'
      ProviderFlags = []
      Precision = 18
      Size = 7
    end
  end
  object dsProdutosGarcons: TDataSource
    DataSet = qryProdutosGarcons
    Left = 352
    Top = 520
  end
  object qryProdutosVendidosCSTPis: TIBQuery
    Database = dm.dbrestaurante
    Transaction = dm.transacao
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      ''
      
        ' select  pm.cod_produto,ip.cod_barras,ip.cod_g_raiz,ip.desc_g_ra' +
        'iz, ip.cod_g_pai, ip.desc_g_pai, ip.cod_grupo, ip.desc_grupo,'
      '       pm.descricao, pm.quantidade_contagem,pm.valor_unitario,'
      
        '        pm.total , pm.totalvendas,ip.cst_pis_cofins, cp.descrica' +
        'o as descricaoPisCofins'
      ''
      '       from produtosvendidoscommargem('
      #39'01.03.2016'#39','#39'31.03.2016'#39','#39#39' ) pm'
      
        '       inner join r_informacoes_produto ip on (ip.cod_produto = ' +
        'pm.cod_produto)'
      
        '       inner join cst_pis_cofins cp on (cp.cst = ip.cst_pis_cofi' +
        'ns)'
      'order by ip.cod_grupo'
      '')
    Left = 480
    Top = 240
  end
  object dtProdutosVendidosPisCofins: TfrxDBDataset
    UserName = 'DTProdutosVendidosCSTPIS'
    CloseDataSource = False
    FieldAliases.Strings = (
      'COD_PRODUTO=COD_PRODUTO'
      'COD_BARRAS=COD_BARRAS'
      'COD_G_RAIZ=COD_G_RAIZ'
      'DESC_G_RAIZ=DESC_G_RAIZ'
      'COD_G_PAI=COD_G_PAI'
      'DESC_G_PAI=DESC_G_PAI'
      'COD_GRUPO=COD_GRUPO'
      'DESC_GRUPO=DESC_GRUPO'
      'DESCRICAO=DESCRICAO'
      'QUANTIDADE_CONTAGEM=QUANTIDADE_CONTAGEM'
      'VALOR_UNITARIO=VALOR_UNITARIO'
      'TOTAL=TOTAL'
      'TOTALVENDAS=TOTALVENDAS'
      'CST_PIS_COFINS=CST_PIS_COFINS'
      'DESCRICAOPISCOFINS=DESCRICAOPISCOFINS')
    DataSet = qryProdutosVendidosCSTPis
    BCDToCurrency = False
    Left = 503
    Top = 242
  end
  object qryAlteracoesPedidos: TIBQuery
    Database = dm.dbrestaurante
    Transaction = dm.transacao
    AutoCalcFields = False
    BufferChunks = 1000
    CachedUpdates = False
    DataSource = dsPedidosAlterados
    ParamCheck = True
    SQL.Strings = (
      ''
      ''
      ''
      'select pa.*, pa.codigo as codAlteracao,'
      'case pa.tipo_alteracao '
      '  when 1 then '#39'INCLUS'#195'O'#39
      '  WHEN 2 THEN '#39'ALTERA'#199#195'O'#39
      '  WHEN 3 THEN '#39'EXCLUS'#195'O'#39
      '  WHEN 4 THEN '#39'PAGAMENTO'#39
      'END AS operacao, c.nome as nome_cliente, c.telefone, c.celular'
      ''
      'from pedidos_delivery_alteracao pa'
      '  join clientes_delivery  c on (c.codigo  = pa.cod_cliente)'
      ' where pa.cod_pedido = :cod_pedido'
      ' order by cod_pedido,codigo'
      ''
      ''
      '')
    Left = 448
    Top = 408
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'cod_pedido'
        ParamType = ptUnknown
      end>
  end
  object QryPedidosAlterados: TIBQuery
    Database = dm.dbrestaurante
    Transaction = dm.transacao
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      ''
      'select distinct cod_pedido from pedidos_delivery_alteracao ')
    Left = 456
    Top = 352
    object QryPedidosAlteradosCOD_PEDIDO: TIBStringField
      FieldName = 'COD_PEDIDO'
      Origin = 'PEDIDOS_DELIVERY_ALTERACAO.COD_PEDIDO'
      Required = True
      Size = 8
    end
  end
  object dtPedidosAlterados: TfrxDBDataset
    UserName = 'dtPedidosAlterados'
    CloseDataSource = False
    FieldAliases.Strings = (
      'COD_PEDIDO=COD_PEDIDO')
    DataSet = QryPedidosAlterados
    BCDToCurrency = False
    Left = 520
    Top = 352
  end
  object dsPedidosAlterados: TDataSource
    DataSet = QryPedidosAlterados
    Left = 488
    Top = 352
  end
  object dtAlteracoesPedido: TfrxDBDataset
    UserName = 'dtAlteracoesPedido'
    CloseDataSource = False
    FieldAliases.Strings = (
      'COD_PEDIDO=COD_PEDIDO'
      'COD_CAIXA=COD_CAIXA'
      'COD_CLIENTE=COD_CLIENTE'
      'CODIGO=CODIGO'
      'COD_USUARIO=COD_USUARIO'
      'COD_USUARIO_AUTORIZOU=COD_USUARIO_AUTORIZOU'
      'DATA_HORA_ALTERACAO=DATA_HORA_ALTERACAO'
      'VALOR_TOTAL=VALOR_TOTAL'
      'NUMERO_CAIXA=NUMERO_CAIXA'
      'TIPO_ALTERACAO=TIPO_ALTERACAO'
      'USUARIO_OPERADOR=USUARIO_OPERADOR'
      'USUARIO_AUTORIZADOR=USUARIO_AUTORIZADOR'
      'PAGAMENTOS=PAGAMENTOS'
      'CODALTERACAO=CODALTERACAO'
      'OPERACAO=OPERACAO'
      'NOME_CLIENTE=NOME_CLIENTE'
      'TELEFONE=TELEFONE'
      'CELULAR=CELULAR')
    DataSet = qryAlteracoesPedidos
    BCDToCurrency = False
    Left = 496
    Top = 400
  end
  object qryProdutosAlteracaoPedido: TIBQuery
    Database = dm.dbrestaurante
    Transaction = dm.transacao
    BufferChunks = 1000
    CachedUpdates = False
    DataSource = dsQryAlteracoesPedidos
    ParamCheck = True
    SQL.Strings = (
      '   '
      
        'select dp.cod_produto, p.descricao,  dp.quantidade, dp.valor_uni' +
        'tario, (dp.quantidade * dp.valor_unitario) as total'
      '       from it_ped_del_pos_alt dp'
      
        '        inner join produtos p on (p.cod_produto = dp.cod_produto' +
        ')'
      ''
      '             where cod_alteracao = :codAlteracao')
    Left = 464
    Top = 464
    ParamData = <
      item
        DataType = ftString
        Name = 'CODALTERACAO'
        ParamType = ptUnknown
        Size = 11
      end>
  end
  object dsQryAlteracoesPedidos: TDataSource
    DataSet = qryAlteracoesPedidos
    Left = 536
    Top = 416
  end
  object dtProdutosAlteracaoPedido: TfrxDBDataset
    UserName = 'dtProdutosAlteracaoPedido'
    CloseDataSource = False
    FieldAliases.Strings = (
      'COD_PRODUTO=COD_PRODUTO'
      'DESCRICAO=DESCRICAO'
      'QUANTIDADE=QUANTIDADE'
      'VALOR_UNITARIO=VALOR_UNITARIO'
      'TOTAL=TOTAL')
    DataSet = qryProdutosAlteracaoPedido
    BCDToCurrency = False
    Left = 504
    Top = 464
  end
  object frxXLSExport1: TfrxXLSExport
    UseFileCache = True
    ShowProgress = True
    OverwritePrompt = False
    DataOnly = True
    ExportEMF = True
    ExportPictures = False
    AsText = False
    Background = True
    FastExport = True
    PageBreaks = True
    EmptyLines = True
    SuppressPageHeadersFooters = False
    GridLines = False
    Left = 936
    Top = 144
  end
  object frxXMLExport1: TfrxXMLExport
    UseFileCache = True
    ShowProgress = True
    OverwritePrompt = False
    DataOnly = False
    Background = True
    Creator = 'FastReport'
    EmptyLines = True
    SuppressPageHeadersFooters = False
    RowsCount = 0
    Split = ssNotSplit
    Left = 904
    Top = 160
  end
  object frxBIFFExport1: TfrxBIFFExport
    UseFileCache = True
    ShowProgress = True
    OverwritePrompt = False
    DataOnly = False
    RowHeightScale = 1.000000000000000000
    ChunkSize = 0
    Inaccuracy = 10.000000000000000000
    FitPages = False
    Pictures = True
    ParallelPages = 0
    Left = 888
    Top = 136
  end
  object frxDOCXExport1: TfrxDOCXExport
    UseFileCache = True
    ShowProgress = True
    OverwritePrompt = False
    DataOnly = False
    OpenAfterExport = False
    PictureType = gpPNG
    Left = 848
    Top = 160
  end
  object dtFaturamentoDiarioPeriodoSinteticoEstacao: TfrxDBDataset
    UserName = 'dtFaturamentoDiarioPeriodoSinteticoEstacao'
    CloseDataSource = False
    FieldAliases.Strings = (
      'DATA=DATA'
      'DESCRICAO=DESCRICAO'
      'MES=MES'
      'NOMEMES=NOMEMES'
      'TOTAL=TOTAL')
    DataSet = qryFaturamento
    BCDToCurrency = False
    Left = 49
    Top = 134
  end
  object qryRelComparativoProdutos: TIBQuery
    Database = dm.dbrestaurante
    Transaction = dm.transacao
    AutoCalcFields = False
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      ''
      'select * from ('
      
        ' select  pm.cod_produto,ip.cod_barras,ip.cod_g_raiz,ip.desc_g_ra' +
        'iz, ip.cod_g_pai, ip.desc_g_pai, ip.cod_grupo, ip.desc_grupo,'
      
        ' pm.descricao, pm.quantidade_contagem, pm.total, pm.percentualpr' +
        'oduto,'
      #39'MATRIZ 01/04/19 at'#233' 30/04/19'#39' AS MES,1 as ordem'
      '            from produtosvendidoscommargemF( '
      #39'01.04.2019'#39
      ','#39'30.04.2019'#39
      ','#39#39
      ','#39'0001'#39
      ','#39'00:00:00'#39
      ','#39'15:00:59'#39
      '      ) pm '
      
        '            inner join r_informacoes_produto ip on (ip.cod_produ' +
        'to = pm.cod_produto) '
      ' union all '
      
        ' select  pm.cod_produto,ip.cod_barras,ip.cod_g_raiz,ip.desc_g_ra' +
        'iz, ip.cod_g_pai, ip.desc_g_pai, ip.cod_grupo, ip.desc_grupo,'
      
        ' pm.descricao, pm.quantidade_contagem, pm.total, pm.percentualpr' +
        'oduto,'
      #39'MATRIZ 01/04/19 at'#233' 30/04/19'#39' AS MES,2 as ordem'
      '            from produtosvendidoscommargemF( '
      #39'01.04.2019'#39
      ','#39'30.04.2019'#39
      ','#39#39
      ','#39'0001'#39
      ','#39'15:01:00'#39
      ','#39'23:59:59'#39
      '      ) pm '
      
        '            inner join r_informacoes_produto ip on (ip.cod_produ' +
        'to = pm.cod_produto) '
      '       )    order by cod_g_raiz, cod_g_pai, cod_grupo,ordem ')
    Left = 1121
    Top = 328
  end
  object dscdsRelProdutosVendidosTemp: TDataSource
    DataSet = cdsRelProdutosVendidosTemp
    Left = 1120
    Top = 240
  end
  object DTVARIOSPERIODOS: TfrxDBDataset
    UserName = 'DTVARIOSPERIODOS'
    CloseDataSource = False
    FieldAliases.Strings = (
      'COD_PRODUTO=COD_PRODUTO'
      'COD_BARRAS=COD_BARRAS'
      'COD_G_RAIZ=COD_G_RAIZ'
      'DESC_G_RAIZ=DESC_G_RAIZ'
      'COD_G_PAI=COD_G_PAI'
      'DESC_G_PAI=DESC_G_PAI'
      'COD_GRUPO=COD_GRUPO'
      'DESC_GRUPO=DESC_GRUPO'
      'DESCRICAO=DESCRICAO'
      'QUANTIDADE_CONTAGEM=QUANTIDADE_CONTAGEM'
      'TOTAL=TOTAL'
      'PERCENTUALPRODUTO=PERCENTUALPRODUTO'
      'MES=MES')
    DataSet = qryRelComparativoProdutos
    BCDToCurrency = False
    Left = 1168
    Top = 328
  end
  object qryRelEstaticoVendaDiario: TIBQuery
    Database = dm.dbrestaurante
    Transaction = dm.transacao
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      ''
      
        '             select v.cod_empresa, v.data, upper(udf_dayname(V.D' +
        'ATA)) DIA ,   count(*) QTD_CLI, sum(v.valor_total) Faturamento, ' +
        'avg(v.valor_total) TM from vendas v'
      
        '      where v.data between '#39'01.11.2016'#39' and '#39'30.12.2016'#39' and v.c' +
        'od_empresa = '#39'0001'#39
      
        '       group by v.cod_empresa, v.data order by  v.cod_empresa,  ' +
        'v.data '
      '')
    Left = 984
    Top = 480
  end
  object dtEstatisticoVendasDiario: TfrxDBDataset
    UserName = 'dtEstatisticoVendasDiario'
    CloseDataSource = False
    FieldAliases.Strings = (
      'COD_EMPRESA=COD_EMPRESA'
      'DATA=DATA'
      'DIA=DIA'
      'QTD_CLI=QTD_CLI'
      'FATURAMENTO=FATURAMENTO'
      'TM=TM')
    DataSet = qryRelEstaticoVendaDiario
    BCDToCurrency = False
    Left = 1024
    Top = 480
  end
  object cdsRelProdutosVendidosTemp: TClientDataSet
    PersistDataPacket.Data = {
      CD0000009619E0BD010000001800000007000000000003000000CD000B636F64
      5F656D707265736101004900000001000557494454480200020004000C6E6F6D
      655F656D70726573610100490000000100055749445448020002003C000C6461
      74615F696E696369616C04000600000000000A646174615F66696E616C040006
      00000000000D616C6961735F656D707265736101004900000001000557494454
      48020002000F000C484F52415F494E494349414C04000700000000000A484F52
      415F46494E414C04000700000000000000}
    Active = True
    Aggregates = <>
    Params = <>
    Left = 1112
    Top = 399
    object cdsRelProdutosVendidosTempcod_empresa: TStringField
      FieldName = 'cod_empresa'
      Size = 4
    end
    object cdsRelProdutosVendidosTempnome_empresa: TStringField
      FieldName = 'nome_empresa'
      Size = 60
    end
    object cdsRelProdutosVendidosTempdata_inicial: TDateField
      FieldName = 'data_inicial'
    end
    object cdsRelProdutosVendidosTempdata_final: TDateField
      FieldName = 'data_final'
    end
    object cdsRelProdutosVendidosTempalias_empresa: TStringField
      FieldName = 'alias_empresa'
      Size = 15
    end
    object cdsRelProdutosVendidosTempHORA_INICIAL: TTimeField
      FieldName = 'HORA_INICIAL'
    end
    object cdsRelProdutosVendidosTempHORA_FINAL: TTimeField
      FieldName = 'HORA_FINAL'
    end
  end
  object frxDBDataset3: TfrxDBDataset
    UserName = 'DTComparativoProdutos'
    CloseDataSource = False
    FieldAliases.Strings = (
      'cod_empresa=cod_empresa'
      'nome_empresa=nome_empresa'
      'data_inicial=data_inicial'
      'data_final=data_final'
      'alias_empresa=alias_empresa'
      'HORA_INICIAL=HORA_INICIAL'
      'HORA_FINAL=HORA_FINAL')
    DataSet = cdsRelProdutosVendidosTemp
    BCDToCurrency = False
    Left = 1176
    Top = 224
  end
  object qryRdComparativo: TIBQuery
    Database = dm.dbrestaurante
    Transaction = dm.transacao
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      ''
      
        'select rg.cod_grupo_raiz, dr.cod_grupo, udf_space(udf_len(dr.cod' +
        '_grupo)+2)|| dr.descricao as descricao,'
      
        '       dr.receita_mes_01,dr.total_mes_01,dr.cmv_mes_01,dr.mes,dr' +
        '.cod_empresa,'
      '       case udf_len(dr.cod_grupo)'
      '        when 1 then 1'
      '        when 3 then 1'
      '        else 0'
      '       end as negrito'
      '           from dre_temp  dr'
      '       inner join r_grupos rg on (rg.cod_grupo = dr.cod_grupo)'
      
        '       order by rg.cod_grupo_raiz,rg.desdobramento_pai,rg.desdob' +
        'ramento_filho')
    Left = 424
    Top = 24
  end
  object dtRdComparativo: TfrxDBDataset
    UserName = 'dtRdComparativo'
    CloseDataSource = False
    FieldAliases.Strings = (
      'COD_GRUPO_RAIZ=COD_GRUPO_RAIZ'
      'COD_GRUPO=COD_GRUPO'
      'DESCRICAO=DESCRICAO'
      'RECEITA_MES_01=RECEITA_MES_01'
      'TOTAL_MES_01=TOTAL_MES_01'
      'CMV_MES_01=CMV_MES_01'
      'MES=MES'
      'COD_EMPRESA=COD_EMPRESA'
      'NEGRITO=NEGRITO')
    DataSet = qryRdComparativo
    BCDToCurrency = False
    Left = 468
    Top = 24
  end
  object qryRelFatHora: TIBQuery
    Database = dm.dbrestaurante
    Transaction = dm.transacao
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      '                            '
      ''
      ''
      'select ft.*, (ft.total / ft.tc) as TM from ('
      
        ' select udf_hour(v.hora) as hora,v.data, count(*)TC,sum(v.valor_' +
        'total) total from vendas v'
      '         where v.data between '#39'01.04.2017'#39' and '#39'10.04.2017'#39
      '          and udf_hour(v.hora) between 10  and 23'
      '     group by udf_hour(v.hora),v.data '
      '      order by data,hora'
      '               ) ft')
    Left = 504
    Top = 176
    object qryRelFatHoraHORA: TSmallintField
      FieldName = 'HORA'
      ProviderFlags = []
    end
    object qryRelFatHoraDATA: TDateField
      FieldName = 'DATA'
      Origin = '"VENDAS"."DATA"'
      Required = True
    end
    object qryRelFatHoraTC: TIntegerField
      FieldName = 'TC'
      ProviderFlags = []
    end
    object qryRelFatHoraTOTAL: TIBBCDField
      FieldName = 'TOTAL'
      ProviderFlags = []
      Precision = 18
      Size = 2
    end
    object qryRelFatHoraTM: TIBBCDField
      FieldName = 'TM'
      ProviderFlags = []
      Precision = 18
      Size = 2
    end
  end
  object DTFatHora: TfrxDBDataset
    UserName = 'DTFatHora'
    CloseDataSource = False
    FieldAliases.Strings = (
      'HORA=HORA'
      'DATA=DATA'
      'TC=TC'
      'TOTAL=TOTAL'
      'TM=TM')
    DataSet = qryRelFatHora
    BCDToCurrency = False
    Left = 535
    Top = 178
  end
  object frxDBDataset4: TfrxDBDataset
    UserName = 'dtProducaogarcons'
    CloseDataSource = False
    FieldAliases.Strings = (
      'COD_GARCON=COD_GARCON'
      'APELIDO=APELIDO'
      'COD_BARRAS=COD_BARRAS'
      'DESCRICAO=DESCRICAO'
      'DESC_G_RAIZ=DESC_G_RAIZ'
      'DESC_G_PAI=DESC_G_PAI'
      'DESCRICAO_GRUPO=DESCRICAO_GRUPO'
      'COD_GRUPO=COD_GRUPO'
      'QUANTIDADE_VENDIDA=QUANTIDADE_VENDIDA'
      'TOTAL_VENDIDO=TOTAL_VENDIDO'
      'TOTAL_COMISSAO=TOTAL_COMISSAO')
    DataSet = qryProdutosGarcons
    BCDToCurrency = False
    Left = 336
    Top = 418
  end
  object qryRankClientesDelivery: TIBQuery
    Database = dm.dbrestaurante
    Transaction = dm.transacao
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      ''
      ''
      ''
      
        ' select * from r_ranking_clientes_delivery('#39'01.11.2018'#39','#39'30.11.2' +
        '018'#39',10)'
      '')
    Left = 832
    Top = 312
  end
  object dtRankClientesDelivery: TfrxDBDataset
    UserName = 'dtRankClientesDelivery'
    CloseDataSource = False
    FieldAliases.Strings = (
      'RANK=RANK'
      'CODIGO=CODIGO'
      'NOME=NOME'
      'TELEFONE=TELEFONE'
      'TOTAL=TOTAL'
      'QTDPEDIDOS=QTDPEDIDOS')
    DataSet = qryRankClientesDelivery
    BCDToCurrency = False
    Left = 864
    Top = 312
  end
end
