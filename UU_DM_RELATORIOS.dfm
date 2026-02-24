object dm_relatorios: Tdm_relatorios
  Height = 891
  Width = 1802
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
    PrecommittedReads = False
    Left = 32
    Top = 359
  end
  object dtProdutos: TfrxDBDataset
    UserName = 'dtProdutos'
    CloseDataSource = False
    BCDToCurrency = False
    DataSetOptions = []
    Left = 696
    Top = 48
  end
  object qryParametros: TIBQuery
    Database = dm.dbrestaurante
    Transaction = dm.transacao
    Active = True
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      ''
      'select * from parametros')
    PrecommittedReads = False
    Left = 852
    Top = 73
  end
  object dtBairros: TfrxDBDataset
    UserName = 'dtBairros'
    CloseDataSource = False
    DataSet = dm.qryBairro
    BCDToCurrency = False
    DataSetOptions = []
    Left = 792
    Top = 24
  end
  object dtParametros: TfrxDBDataset
    UserName = 'dtParametros'
    CloseDataSource = False
    FieldAliases.Strings = (
      'DATA_SISTEMA=DATA_SISTEMA'
      'RAZAO_SOCIAL=RAZAO_SOCIAL'
      'NOME_FANTASIA=NOME_FANTASIA'
      'CNPJ=CNPJ'
      'IE=IE'
      'IM=IM'
      'COD_CIDADE=COD_CIDADE'
      'COD_MUNICIPIO_IBGE=COD_MUNICIPIO_IBGE'
      'LOGRADOURO=LOGRADOURO'
      'COMPLEMENTO=COMPLEMENTO'
      'NUMERO=NUMERO'
      'BAIRRO=BAIRRO'
      'UF=UF'
      'CEP=CEP'
      'TELEFONE_EMPRESA=TELEFONE_EMPRESA'
      'FAX_EMPRESA=FAX_EMPRESA'
      'CONTATO=CONTATO'
      'PERFIL_SPED=PERFIL_SPED'
      'IND_ATIVIDADE=IND_ATIVIDADE'
      'COD_SUFRAMA=COD_SUFRAMA'
      'NOME_CONTABILISTA=NOME_CONTABILISTA'
      'CPF_CONTABILISTA=CPF_CONTABILISTA'
      'CRC_CONTABILISTA=CRC_CONTABILISTA'
      'CNPJ_CONTABILISTA=CNPJ_CONTABILISTA'
      'CEP_CONTABILISTA=CEP_CONTABILISTA'
      'ENDERECO_CONTABILISTA=ENDERECO_CONTABILISTA'
      'COMPLEMENTO_END_CONTABILISTA=COMPLEMENTO_END_CONTABILISTA'
      'NUMERO_END_CONTABILISTA=NUMERO_END_CONTABILISTA'
      'BAIRRO_CONTABILISTA=BAIRRO_CONTABILISTA'
      'TELEFONE_CONTABILISTA=TELEFONE_CONTABILISTA'
      'FAX_CONTABILISTA=FAX_CONTABILISTA'
      'ULTIMAHORA=ULTIMAHORA'
      'SENHA_PADRAO=SENHA_PADRAO'
      'PERCENTUAL_SERVICO_GARCOM=PERCENTUAL_SERVICO_GARCOM'
      'PERCENTUAL_SERVICO_CASA=PERCENTUAL_SERVICO_CASA'
      'PERCENTUAL_SERVICO_FUNCIONARIOS=PERCENTUAL_SERVICO_FUNCIONARIOS'
      'ZERAR_ICMS_ENTRADAS=ZERAR_ICMS_ENTRADAS'
      'ALTERAR_UN_NAS_ENTRADAS=ALTERAR_UN_NAS_ENTRADAS'
      'COUVERT_MASC_PAGANTE=COUVERT_MASC_PAGANTE'
      'COUVERT_MASC_LISTA=COUVERT_MASC_LISTA'
      'COUVERT_FEM_PAGANTE=COUVERT_FEM_PAGANTE'
      'COUVERT_FEM_LISTA=COUVERT_FEM_LISTA'
      'COUVERT_VIP=COUVERT_VIP'
      'INI_FAIXA_MASC=INI_FAIXA_MASC'
      'FIM_FAIXA_MASC=FIM_FAIXA_MASC'
      'INI_FAIXA_FEM=INI_FAIXA_FEM'
      'FIM_FAIXA_FEM=FIM_FAIXA_FEM'
      'INI_FAIXA_VIP=INI_FAIXA_VIP'
      'FIM_FAIXA_VIP=FIM_FAIXA_VIP'
      'BOATE=BOATE'
      'RECEBE_COUVERT_ENTRADA=RECEBE_COUVERT_ENTRADA'
      'COUVERT_MASC_PRECONVITE=COUVERT_MASC_PRECONVITE'
      'COUVERT_FEM_PRECONVITE=COUVERT_FEM_PRECONVITE'
      'ALIQUOTA_ICMS=ALIQUOTA_ICMS'
      'RED_BASE_ICMS=RED_BASE_ICMS'
      'PERCENTUAL_COM_EXT_GARCOM=PERCENTUAL_COM_EXT_GARCOM'
      'EMAIL_CONTABILISTA=EMAIL_CONTABILISTA'
      'NUM_SERIE_CERTIFICADO=NUM_SERIE_CERTIFICADO'
      'SENHA_CERTIFICADO=SENHA_CERTIFICADO'
      'ULT_NSU_NFE_DEST=ULT_NSU_NFE_DEST'
      'USA_COD_GARCON=USA_COD_GARCON'
      'COBRA_SERVICO=COBRA_SERVICO'
      'CSC_NFCE=CSC_NFCE'
      'ID_CSC_NFCE=ID_CSC_NFCE'
      'NOME_CIDADE_CONTRIBUINTE=NOME_CIDADE_CONTRIBUINTE'
      'COD_EMPRESA=COD_EMPRESA'
      'ULTIMA_VENDA_EXP=ULTIMA_VENDA_EXP'
      'REGIME_TRIBUTACAO=REGIME_TRIBUTACAO'
      'CREDITO_ENTRADAS=CREDITO_ENTRADAS'
      'IMPOSTO_SIMP_NAC_NFCE=IMPOSTO_SIMP_NAC_NFCE'
      'ALIQ_IBPT=ALIQ_IBPT'
      'CHAVE_AUTENTICACAO_TEF=CHAVE_AUTENTICACAO_TEF'
      'NUMERO_NFE=NUMERO_NFE'
      'SERIE_NFE=SERIE_NFE'
      'QTD_VIAS_SANGRIA=QTD_VIAS_SANGRIA'
      'CSC_NFCE_HOMOLOGACAO=CSC_NFCE_HOMOLOGACAO'
      'ID_CSC_NFCE_HOMOLOGACAO=ID_CSC_NFCE_HOMOLOGACAO'
      'PIZZA_MAIS_CARA=PIZZA_MAIS_CARA'
      'ASSINATURA_SAT=ASSINATURA_SAT'
      'COD_ATIVACAO_SAT=COD_ATIVACAO_SAT'
      'CNPJ_SWHOUSE=CNPJ_SWHOUSE'
      'TIPO_ENVIO_NFCE=TIPO_ENVIO_NFCE'
      'TIPO_ENVIO_NFE=TIPO_ENVIO_NFE'
      'AGUARDA_CONSULTA_RET_NFCE=AGUARDA_CONSULTA_RET_NFCE'
      'TENTATIVAS_CONSULTA_RET_NFCE=TENTATIVAS_CONSULTA_RET_NFCE'
      'TIMEOUT_RET_NFCE=TIMEOUT_RET_NFCE'
      'INTERVALO_TENTATIVAS_NFCE=INTERVALO_TENTATIVAS_NFCE'
      'MAX_NFCE_SEM_CPF=MAX_NFCE_SEM_CPF'
      'MSG_PROMO_DELIVERY=MSG_PROMO_DELIVERY'
      'MSG_PROMO_CONTA=MSG_PROMO_CONTA'
      'NUMERO_CARTA_CORRECAO_NFE=NUMERO_CARTA_CORRECAO_NFE'
      'NUMERO_CARTA_CORRECAO_NFCE=NUMERO_CARTA_CORRECAO_NFCE'
      'PFX_CERTIFICADO=PFX_CERTIFICADO'
      'IMP_ENDERECO_CLIENTE_PRODUCAO=IMP_ENDERECO_CLIENTE_PRODUCAO'
      'MSG_DELIVERY_GD=MSG_DELIVERY_GD'
      'MSG_DELIVERY_DESTAQUE=MSG_DELIVERY_DESTAQUE'
      'MSG_CONTA_GD=MSG_CONTA_GD'
      'MSG_CONTA_DESTAQUE=MSG_CONTA_DESTAQUE'
      'LOGO_COMPROVANTES=LOGO_COMPROVANTES'
      'TAB_PRECOS_DELIVERY=TAB_PRECOS_DELIVERY'
      'COMPROVANTE_DELIVERY_AGRUPADO=COMPROVANTE_DELIVERY_AGRUPADO'
      'IDENTIFICA_CLIENTE_BALCAO=IDENTIFICA_CLIENTE_BALCAO'
      'TEMPO_PREP_DELIVERY=TEMPO_PREP_DELIVERY'
      'IMPRIME_OBS_COMPROVANTE_DELIV=IMPRIME_OBS_COMPROVANTE_DELIV'
      'ULT_NSU_CTE=ULT_NSU_CTE'
      'INTEGRACAO_PLATAFORMAS=INTEGRACAO_PLATAFORMAS'
      'DESCRICAO_EMPRESA=DESCRICAO_EMPRESA'
      'IMP_DADOS_PLATAFORMA_COMP_DELIV=IMP_DADOS_PLATAFORMA_COMP_DELIV'
      'IMP_DADOS_PLATAFORMA_PRODUCAO=IMP_DADOS_PLATAFORMA_PRODUCAO'
      'REGISTRA_ENTREGA_IFOOD=REGISTRA_ENTREGA_IFOOD')
    DataSet = qryParametros
    BCDToCurrency = False
    DataSetOptions = []
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
    PrecommittedReads = False
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
    DataSetOptions = []
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
    PrecommittedReads = False
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
    DataSetOptions = []
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
    PrecommittedReads = False
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
    DataSetOptions = []
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
    PrecommittedReads = False
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
    DataSetOptions = []
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
    PrecommittedReads = False
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
      ''
      ''
      ' select'
      '    p.cod_barras, p.descricao,rg.cod_grupo_raiz as cod_g_raiz,'
      '    rg.desc_grupo_raiz as desc_g_raiz,'
      '    rg.cod_grupo_pai as cod_g_pai,'
      '    rg.desc_grupo_pai as desc_g_pai,'
      '    rg.cod_grupo_pai as cod_grupo,'
      '    rg.descricao  as desc_grupo,'
      '    mv.valor_unitario,'
      '    udf_roundabnt(sum(mv.quantidade),2) as quantidade_real,'
      
        '    udf_roundabnt(sum(mv.quantidade * mv.valor_unitario),2) as s' +
        'ubtotal,'
      '    udf_roundabnt(sum(mv.desconto),2) as descontos,'
      
        '    udf_roundabnt(sum((mv.quantidade * mv.valor_unitario) - MV.d' +
        'esconto),2) as TOTAL'
      '   from movimento_venda mv'
      '     inner join produtos p on (p.cod_produto = mv.cod_produto)'
      '     inner join r_grupos rg on (rg.cod_grupo = p.cod_grupo)'
      '    where mv.cod_empresa='#39'0001'#39
      '      and mv.cod_caixa ='#39'03379'#39
      '   group by 1,2,3,4,5,6,7,8,9'
      ''
      ''
      ''
      ''
      '')
    PrecommittedReads = False
    Left = 30
    Top = 402
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
    DataSetOptions = []
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
    PrecommittedReads = False
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
    DataSetOptions = []
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
    PrecommittedReads = False
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
    DataSetOptions = []
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
    PrecommittedReads = False
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
    DataSetOptions = []
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
    PrecommittedReads = False
    Left = 508
    Top = 585
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
      'VALOR_BRUTO=VALOR_BRUTO'
      'VALOR_DESCONTO=VALOR_DESCONTO'
      'VALOR_TXSERV=VALOR_TXSERV'
      'VALOR_TOTAL=VALOR_TOTAL'
      'TOTAL_PAGO=TOTAL_PAGO'
      'VALOR_TROCO=VALOR_TROCO'
      'COD_USUARIO=COD_USUARIO'
      'NUMERO_CAIXA=NUMERO_CAIXA'
      'MESA=MESA'
      'IMP=IMP'
      'COD_CAIXA=COD_CAIXA'
      'TIPO_VENDA=TIPO_VENDA'
      'COD_PEDIDO_DELIVERY=COD_PEDIDO_DELIVERY'
      'COO_CUPOM=COO_CUPOM'
      'QTDE_PESSOAS=QTDE_PESSOAS'
      'VALOR_TX_ENTREGA=VALOR_TX_ENTREGA'
      'REDUCAO_Z=REDUCAO_Z'
      'SELECIONADO=SELECIONADO'
      'DESCONTO_TAXAS=DESCONTO_TAXAS'
      'CHAVE_NFCE=CHAVE_NFCE'
      'NUMERO_NFCE=NUMERO_NFCE'
      'SERIE_NFCE=SERIE_NFCE'
      'PROTOCOLO_NFCE=PROTOCOLO_NFCE'
      'RECIBO_NFCE=RECIBO_NFCE'
      'OBS_NFCE=OBS_NFCE'
      'CONSULTA_OK=CONSULTA_OK'
      'COD_EMPRESA=COD_EMPRESA'
      'PERCENTUAL_DESCONTO=PERCENTUAL_DESCONTO'
      'LOTE_EXPORTACAO_WEB=LOTE_EXPORTACAO_WEB'
      'COD_GARCON_ABRIU=COD_GARCON_ABRIU'
      'MODELO_COMPROVANTE=MODELO_COMPROVANTE'
      'COD_FORNECEDOR=COD_FORNECEDOR'
      'SESSAO_SAT=SESSAO_SAT'
      'CNF_SAT=CNF_SAT'
      'XML_DOC=XML_DOC'
      'CNPJ_CPF_CLIENTE_NF=CNPJ_CPF_CLIENTE_NF'
      'NOME_CLIENTE_NF=NOME_CLIENTE_NF'
      'TENTATIVAS_ENVIO_NFCE=TENTATIVAS_ENVIO_NFCE'
      'TEMPO_EMISSAO_NFCE=TEMPO_EMISSAO_NFCE')
    DataSet = qryVendas
    BCDToCurrency = False
    DataSetOptions = []
    Left = 508
    Top = 617
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
    PrecommittedReads = False
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
    Left = 556
    Top = 617
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
    DataSetOptions = []
    Left = 200
    Top = 176
  end
  object dtProdutosVendidosCaixa: TfrxDBDataset
    UserName = 'dtProdutosVendidosCaixa'
    CloseDataSource = False
    FieldAliases.Strings = (
      'COD_BARRAS=COD_BARRAS'
      'DESCRICAO=DESCRICAO'
      'COD_G_RAIZ=COD_G_RAIZ'
      'DESC_G_RAIZ=DESC_G_RAIZ'
      'COD_G_PAI=COD_G_PAI'
      'DESC_G_PAI=DESC_G_PAI'
      'COD_GRUPO=COD_GRUPO'
      'DESC_GRUPO=DESC_GRUPO'
      'VALOR_UNITARIO=VALOR_UNITARIO'
      'QUANTIDADE_REAL=QUANTIDADE_REAL'
      'SUBTOTAL=SUBTOTAL'
      'DESCONTOS=DESCONTOS'
      'TOTAL=TOTAL')
    DataSet = qryProdutosVendidosCaixa
    BCDToCurrency = False
    DataSetOptions = []
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
    DataSetOptions = []
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
    PrecommittedReads = False
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
    DataSetOptions = []
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
    PrecommittedReads = False
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
    DataSetOptions = []
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
    PrecommittedReads = False
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
    DataSetOptions = []
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
    PrecommittedReads = False
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
    DataSetOptions = []
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
    PrecommittedReads = False
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
    DataSetOptions = []
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
    PrecommittedReads = False
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
    DataSetOptions = []
    Left = 64
    Top = 312
  end
  object qryRelFaturamento: TIBQuery
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
    PrecommittedReads = False
    Left = 296
    Top = 728
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
    DataSet = qryRelFaturamento
    BCDToCurrency = False
    DataSetOptions = []
    Left = 417
    Top = 726
  end
  object dtFaturamentoDiarioPeriodoSintetico: TfrxDBDataset
    UserName = 'dtFaturamentoDiarioPeriodoSintetico'
    CloseDataSource = False
    DataSet = qryRelFaturamento
    BCDToCurrency = False
    DataSetOptions = []
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
    DataSet = qryRelFaturamento
    BCDToCurrency = False
    DataSetOptions = []
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
    DataSet = qryRelFaturamento
    BCDToCurrency = False
    DataSetOptions = []
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
    PrecommittedReads = False
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
    PrecommittedReads = False
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
    DataSetOptions = []
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
    DataSetOptions = []
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
    PrecommittedReads = False
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
    DataSetOptions = []
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
    PrecommittedReads = False
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
    DataSetOptions = []
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
    DataSetOptions = []
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
    PrecommittedReads = False
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
    PrecommittedReads = False
    Left = 632
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
    DataSetOptions = []
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
    PrecommittedReads = False
    Left = 616
    Top = 374
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
    DataSetOptions = []
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
    PrecommittedReads = False
    Left = 664
    Top = 263
  end
  object dtNotasConsumidor: TfrxDBDataset
    UserName = 'dtNotasConsumidor'
    CloseDataSource = False
    DataSet = qryNotasConsumidor
    BCDToCurrency = False
    DataSetOptions = []
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
    PrecommittedReads = False
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
    DataSetOptions = []
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
    PrecommittedReads = False
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
    DataSetOptions = []
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
    PrecommittedReads = False
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
    DataSetOptions = []
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
    PrecommittedReads = False
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
    DataSetOptions = []
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
    PrecommittedReads = False
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
    DataSetOptions = []
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
    DataSetOptions = []
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
    PrecommittedReads = False
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
    DataSetOptions = []
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
    PrecommittedReads = False
    Left = 624
    Top = 424
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
    DataSetOptions = []
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
    PrecommittedReads = False
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
    DataSetOptions = []
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
    DataSetOptions = []
    Left = 976
    Top = 200
  end
  object qryTaxaServico: TIBQuery
    Database = dm.dbrestaurante
    Transaction = dm.transacao
    ForcedRefresh = True
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      '                 '
      ''
      
        ' select v.*, (v.base_calculo_servico * 0.1) as deveriaSer,(v.val' +
        'or_bruto - v.base_calculo_servico) naoIncidentes,'
      
        '  (select garcons from R_GET_GARCONS_ATENDERAM_MESA(v.cod_venda)' +
        ') garconsAtenderam'
      ' from v_taxa_servico_vendas v')
    PrecommittedReads = False
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
    DataSetOptions = []
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
    DataSetOptions = []
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
    DataSetOptions = []
    Left = 984
    Top = 248
  end
  object dtTaxaServicoAuditoria: TfrxDBDataset
    UserName = 'dtTaxaServicoAuditoria'
    CloseDataSource = False
    FieldAliases.Strings = (
      'COD_VENDA=COD_VENDA'
      'MESA=MESA'
      'HORA=HORA'
      'COD_CAIXA=COD_CAIXA'
      'DATA=DATA'
      'VALOR_BRUTO=VALOR_BRUTO'
      'VALOR_TOTAL=VALOR_TOTAL'
      'VALOR_PAGO=VALOR_PAGO'
      'TROCO=TROCO'
      'BASE_CALCULO_SERVICO=BASE_CALCULO_SERVICO'
      'VALOR_PAGO_TX_SERVICO=VALOR_PAGO_TX_SERVICO'
      'DIFERENCA_SERVICO=DIFERENCA_SERVICO'
      'DEVERIASER=DEVERIASER'
      'NAOINCIDENTES=NAOINCIDENTES'
      'GARCONSATENDERAM=GARCONSATENDERAM')
    DataSet = qryTaxaServico
    BCDToCurrency = False
    DataSetOptions = []
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
    PrecommittedReads = False
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
    DataSetOptions = []
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
    PrecommittedReads = False
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
    DataSetOptions = []
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
    PrecommittedReads = False
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
    DataSetOptions = []
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
    PrecommittedReads = False
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
    DataSetOptions = []
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
    PrecommittedReads = False
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
    DataSetOptions = []
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
    PrecommittedReads = False
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
    DataSetOptions = []
    Left = 352
    Top = 287
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
    BCDToCurrency = False
    DataSetOptions = []
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
    PrecommittedReads = False
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
    DataSetOptions = []
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
    PrecommittedReads = False
    Left = 310
    Top = 362
  end
  object dtResumoCaixaTurno: TfrxDBDataset
    UserName = 'dtResumoCaixaTurno'
    CloseDataSource = False
    DataSet = qryResumoCaixaTurno
    BCDToCurrency = False
    DataSetOptions = []
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
    PrecommittedReads = False
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
    DataSetOptions = []
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
    PrecommittedReads = False
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
    DataSetOptions = []
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
    PrecommittedReads = False
    Left = 839
    Top = 478
  end
  object ddtRelGruposApuracao: TfrxDBDataset
    UserName = 'ddtRelGruposApuracao'
    CloseDataSource = False
    DataSet = qryRelGruposApuracao
    BCDToCurrency = False
    DataSetOptions = []
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
    PrecommittedReads = False
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
    DataSetOptions = []
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
    PrecommittedReads = False
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
    DataSetOptions = []
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
    BCDToCurrency = False
    DataSetOptions = []
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
    PrecommittedReads = False
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
    DataSetOptions = []
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
    DataSetOptions = []
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
    PrecommittedReads = False
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
    Version = '2022.1.3'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Padr'#227'o'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 42244.480545231500000000
    ReportOptions.LastChange = 45940.967321365740000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      ''
      ''
      'procedure IMG_FAT_M1OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      ''
      'end;'
      ''
      'begin'
      ''
      'end.')
    OnBeforeConnect = rptBeforeConnect
    OnGetValue = rptGetValue
    OnReportPrint = 'frxReportOnReportPrint'
    Left = 1139
    Top = 516
    Datasets = <
      item
        DataSet = dtParametros
        DataSetName = 'dtParametros'
      end
      item
        DataSet = dtDRENovo
        DataSetName = 'dtDRENovo'
      end>
    Variables = <>
    Style = <
      item
        Name = 'Title'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        Frame.Typ = []
        Fill.BackColor = clGray
      end
      item
        Name = 'Header'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clMaroon
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        Frame.Typ = []
      end
      item
        Name = 'Group header'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clMaroon
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        Frame.Typ = []
        Fill.BackColor = 16053492
      end
      item
        Name = 'Data'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        Frame.Typ = []
      end
      item
        Name = 'Group footer'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        Frame.Typ = []
      end
      item
        Name = 'Header line'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        Frame.Typ = [ftBottom]
        Frame.Width = 2.000000000000000000
      end>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      Columns = 1
      ColumnWidth = 277.000000000000000000
      ColumnPositions.Strings = (
        '0')
      Frame.Typ = []
      MirrorMode = []
      OnBeforePrint = 'Page1OnBeforePrint'
      object MasterData1: TfrxMasterData
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 13.228346460000000000
        Top = 325.039580000000000000
        Width = 718.110700000000000000
        OnBeforePrint = 'MasterData1OnBeforePrint'
        DataSet = dtDRENovo
        DataSetName = 'dtDRENovo'
        RowCount = 0
        object Memo2: TfrxMemoView
          AllowVectorExport = True
          Width = 317.480520000000000000
          Height = 13.228346460000000000
          DataField = 'DESCRICAO_EXT'
          DataSet = dtDRENovo
          DataSetName = 'dtDRENovo'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8W = (
            '[dtDRENovo."DESCRICAO_EXT"]')
          ParentFont = False
          Highlights = <
            item
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -9
              Font.Name = 'Arial'
              Font.Style = [fsBold]
              Condition = 'Length(<dtDRENovo."COD_CONTA">)=1'
              FillType = ftBrush
              Fill.BackColor = 7000063
              Frame.Typ = []
            end
            item
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -9
              Font.Name = 'Arial'
              Font.Style = [fsBold]
              Condition = 'Length(<dtDRENovo."COD_CONTA">)=3'
              FillType = ftBrush
              Fill.BackColor = 10218495
              Frame.Typ = []
            end>
        end
        object Memo3: TfrxMemoView
          AllowVectorExport = True
          Left = 318.897708580000000000
          Width = 71.811070000000000000
          Height = 13.228346460000000000
          DataField = 'TOTAL_MES'
          DataSet = dtDRENovo
          DataSetName = 'dtDRENovo'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.UTF8W = (
            '[dtDRENovo."TOTAL_MES"]')
          ParentFont = False
          Highlights = <
            item
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -9
              Font.Name = 'Arial'
              Font.Style = [fsBold]
              Condition = 'Length(<dtDRENovo."COD_CONTA">)=1'
              FillType = ftBrush
              Fill.BackColor = 7000063
              Frame.Typ = []
            end
            item
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -9
              Font.Name = 'Arial'
              Font.Style = [fsBold]
              Condition = 'Length(<dtDRENovo."COD_CONTA">)=3'
              FillType = ftBrush
              Fill.BackColor = 10218495
              Frame.Typ = []
            end>
        end
        object Memo4: TfrxMemoView
          AllowVectorExport = True
          Left = 392.102442760000000000
          Width = 30.236240000000000000
          Height = 13.228346460000000000
          DataField = 'MC_ATUAL'
          DataSet = dtDRENovo
          DataSetName = 'dtDRENovo'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.UTF8W = (
            '[dtDRENovo."MC_ATUAL"]')
          ParentFont = False
          Highlights = <
            item
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -9
              Font.Name = 'Arial'
              Font.Style = [fsBold]
              Condition = 'Length(<dtDRENovo."COD_CONTA">)=1'
              FillType = ftBrush
              Fill.BackColor = 7000063
              Frame.Typ = []
            end
            item
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -9
              Font.Name = 'Arial'
              Font.Style = []
              Condition = 'Length(<dtDRENovo."COD_CONTA">)=3'
              FillType = ftBrush
              Fill.BackColor = 10218495
              Frame.Typ = []
            end>
        end
        object Memo13: TfrxMemoView
          AllowVectorExport = True
          Left = 423.307360000000000000
          Width = 71.811070000000000000
          Height = 13.228346460000000000
          DataField = 'VARIACAO_MC_MES_ANT'
          DataSet = dtDRENovo
          DataSetName = 'dtDRENovo'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftRight, ftTop, ftBottom]
          Fill.BackColor = clBtnFace
          HAlign = haRight
          Memo.UTF8W = (
            '[dtDRENovo."VARIACAO_MC_MES_ANT"]')
          ParentFont = False
          Highlights = <
            item
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -9
              Font.Name = 'Arial'
              Font.Style = [fsBold]
              Condition = 'Length(<dtDRENovo."COD_CONTA">)=1'
              FillType = ftBrush
              Fill.BackColor = 7000063
              Frame.Typ = []
            end
            item
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -9
              Font.Name = 'Arial'
              Font.Style = [fsBold]
              Condition = 'Length(<dtDRENovo."COD_CONTA">)=3'
              FillType = ftBrush
              Fill.BackColor = 10218495
              Frame.Typ = []
            end>
        end
        object Memo14: TfrxMemoView
          AllowVectorExport = True
          Left = 496.252068580000000000
          Width = 30.236240000000000000
          Height = 13.228346460000000000
          DataField = 'MC_MES_ANT'
          DataSet = dtDRENovo
          DataSetName = 'dtDRENovo'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftTop, ftBottom]
          Fill.BackColor = clBtnFace
          HAlign = haRight
          Memo.UTF8W = (
            '[dtDRENovo."MC_MES_ANT"]')
          ParentFont = False
          Highlights = <
            item
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -9
              Font.Name = 'Arial'
              Font.Style = [fsBold]
              Condition = 'Length(<dtDRENovo."COD_CONTA">)=1'
              FillType = ftBrush
              Fill.BackColor = 7000063
              Frame.Typ = []
            end
            item
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -9
              Font.Name = 'Arial'
              Font.Style = [fsBold]
              Condition = 'Length(<dtDRENovo."COD_CONTA">)=3'
              FillType = ftBrush
              Fill.BackColor = 10218495
              Frame.Typ = []
            end>
        end
        object Memo6: TfrxMemoView
          AllowVectorExport = True
          Left = 525.354670000000000000
          Width = 45.354330710000000000
          Height = 13.228346460000000000
          DataField = 'VARIACAO_MC_MES_ANT'
          DataSet = dtDRENovo
          DataSetName = 'dtDRENovo'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Fill.BackColor = clBtnFace
          HAlign = haRight
          Memo.UTF8W = (
            '[dtDRENovo."VARIACAO_MC_MES_ANT"]')
          ParentFont = False
          Highlights = <
            item
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -9
              Font.Name = 'Arial'
              Font.Style = [fsBold]
              Condition = 'Length(<dtDRENovo."COD_CONTA">)=1'
              FillType = ftBrush
              Fill.BackColor = 7000063
              Frame.Typ = []
            end
            item
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -9
              Font.Name = 'Arial'
              Font.Style = [fsBold]
              Condition = 'Length(<dtDRENovo."COD_CONTA">)=3'
              FillType = ftBrush
              Fill.BackColor = 10218495
              Frame.Typ = []
            end>
        end
        object Memo17: TfrxMemoView
          AllowVectorExport = True
          Left = 570.709030000000000000
          Width = 71.811070000000000000
          Height = 13.228346460000000000
          DataField = 'VARIACAO_MC_ANO_ANT'
          DataSet = dtDRENovo
          DataSetName = 'dtDRENovo'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.UTF8W = (
            '[dtDRENovo."VARIACAO_MC_ANO_ANT"]')
          ParentFont = False
          Highlights = <
            item
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -9
              Font.Name = 'Arial'
              Font.Style = [fsBold]
              Condition = 'Length(<dtDRENovo."COD_CONTA">)=1'
              FillType = ftBrush
              Fill.BackColor = 7000063
              Frame.Typ = []
            end
            item
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -9
              Font.Name = 'Arial'
              Font.Style = [fsBold]
              Condition = 'Length(<dtDRENovo."COD_CONTA">)=3'
              FillType = ftBrush
              Fill.BackColor = 10218495
              Frame.Typ = []
            end>
        end
        object Memo18: TfrxMemoView
          AllowVectorExport = True
          Left = 643.653738580000000000
          Width = 30.236240000000000000
          Height = 13.228346460000000000
          DataField = 'MC_ANO_ANT'
          DataSet = dtDRENovo
          DataSetName = 'dtDRENovo'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftTop, ftBottom]
          HAlign = haRight
          Memo.UTF8W = (
            '[dtDRENovo."MC_ANO_ANT"]')
          ParentFont = False
          Highlights = <
            item
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -9
              Font.Name = 'Arial'
              Font.Style = [fsBold]
              Condition = 'Length(<dtDRENovo."COD_CONTA">)=1'
              FillType = ftBrush
              Fill.BackColor = 7000063
              Frame.Typ = []
            end
            item
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -9
              Font.Name = 'Arial'
              Font.Style = [fsBold]
              Condition = 'Length(<dtDRENovo."COD_CONTA">)=3'
              FillType = ftBrush
              Fill.BackColor = 10218495
              Frame.Typ = []
            end>
        end
        object Memo19: TfrxMemoView
          AllowVectorExport = True
          Left = 672.756340000000000000
          Width = 45.354330710000000000
          Height = 13.228346460000000000
          DataField = 'VARIACAO_MC_ANO_ANT'
          DataSet = dtDRENovo
          DataSetName = 'dtDRENovo'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.UTF8W = (
            '[dtDRENovo."VARIACAO_MC_ANO_ANT"]')
          ParentFont = False
          Highlights = <
            item
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -9
              Font.Name = 'Arial'
              Font.Style = [fsBold]
              Condition = 'Length(<dtDRENovo."COD_CONTA">)=1'
              FillType = ftBrush
              Fill.BackColor = 7000063
              Frame.Typ = []
            end
            item
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -9
              Font.Name = 'Arial'
              Font.Style = [fsBold]
              Condition = 'Length(<dtDRENovo."COD_CONTA">)=3'
              FillType = ftBrush
              Fill.BackColor = 10218495
              Frame.Typ = []
            end>
        end
      end
      object ReportTitle3: TfrxReportTitle
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 201.976492680000000000
        Top = 18.897650000000000000
        Width = 718.110700000000000000
        AllowSplit = True
        StartNewPage = True
        object Memo42: TfrxMemoView
          AllowVectorExport = True
          Width = 321.260050000000000000
          Height = 18.897650000000000000
          DataField = 'RAZAO_SOCIAL'
          DataSet = dtParametros
          DataSetName = 'dtParametros'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            '[dtParametros."RAZAO_SOCIAL"]')
          ParentFont = False
        end
        object Memo10: TfrxMemoView
          AllowVectorExport = True
          Top = 15.118120000000000000
          Width = 321.260050000000000000
          Height = 18.897650000000000000
          DataField = 'NOME_FANTASIA'
          DataSet = dtParametros
          DataSetName = 'dtParametros'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            '[dtParametros."NOME_FANTASIA"]')
          ParentFont = False
        end
        object Memo11: TfrxMemoView
          AllowVectorExport = True
          Left = 623.622450000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            '[Date]')
          ParentFont = False
        end
        object Memo49: TfrxMemoView
          AllowVectorExport = True
          Left = 623.622450000000000000
          Top = 18.897650000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            '[Time]')
          ParentFont = False
        end
        object Memo57: TfrxMemoView
          Align = baWidth
          AllowVectorExport = True
          Top = 95.708720000000000000
          Width = 718.110700000000000000
          Frame.Typ = [ftTop]
          Frame.Width = 2.000000000000000000
        end
        object Memo58: TfrxMemoView
          Align = baCenter
          AllowVectorExport = True
          Left = 1.889765000000000000
          Top = 37.795300000000000000
          Width = 714.331170000000000000
          Height = 30.236240000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haCenter
          ParentFont = False
        end
        object memoTitulo: TfrxMemoView
          AllowVectorExport = True
          Top = 42.913420000000000000
          Width = 718.110700000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            'RELAT'#211'RIO GERENCIAL DE DESEMPENHO POR CONTA')
          ParentFont = False
        end
        object Memo84: TfrxMemoView
          Align = baCenter
          AllowVectorExport = True
          Top = 72.590600000000000000
          Width = 718.110700000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[NOME_MES_ATUAL]')
          ParentFont = False
        end
        object Picture1: TfrxPictureView
          AllowVectorExport = True
          Left = 6.118120000000000000
          Top = 105.826771650000000000
          Width = 230.551181100000000000
          Height = 90.708720000000000000
          Frame.Typ = []
          Picture.Data = {
            0A544A504547496D616765BB100000FFD8FFE000104A46494600010101012C01
            2C0000FFE202644943435F50524F46494C45000101000002546C636D73043000
            006D6E74725247422058595A2007E9000A000A00140009002E616373704D5346
            540000000000000000000000000000000000000000000000000000F6D6000100
            000000D32D6C636D730000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000B64657363000001
            080000003E63707274000001480000004C777470740000019400000014636861
            64000001A80000002C7258595A000001D4000000146258595A000001E8000000
            146758595A000001FC0000001472545243000002100000002067545243000002
            10000000206254524300000210000000206368726D00000230000000246D6C75
            6300000000000000010000000C656E5553000000220000001C00730052004700
            42002000490045004300360031003900360036002D0032002E003100006D6C75
            6300000000000000010000000C656E5553000000300000001C004E006F002000
            63006F0070007900720069006700680074002C00200075007300650020006600
            7200650065006C007958595A20000000000000F6D6000100000000D32D736633
            320000000000010C42000005DEFFFFF325000007930000FD90FFFFFBA1FFFFFD
            A2000003DC0000C06E58595A200000000000006FA0000038F50000039058595A
            20000000000000249F00000F840000B6C358595A2000000000000062970000B7
            87000018D9706172610000000000030000000266660000F2A700000D59000013
            D000000A5B6368726D00000000000300000000A3D70000547B00004CCD000099
            9A0000266600000F5CFFDB004300010101010101010101010101010101010101
            0101010101010101010101010101010101010101010101010101010101010101
            0101010101010101010101010101FFDB00430101010101010101010101010101
            0101010101010101010101010101010101010101010101010101010101010101
            01010101010101010101010101010101010101FFC0001108005D00F003011100
            021101031101FFC400180001010101010000000000000000000000000908070A
            FFC4002E1000010202050D010003000000000000000005060708020304099601
            18191A395457597898D5D6D8B70A1213FFC4001A010100020301000000000000
            000000000000050703060908FFC4002E1100010105030D010101010000000000
            0000050102030406079496081516171854555657D2D3D4D511121441FFDA000C
            03010002110311003F008B92F92F9029C702A0F2FAFC1E86AB4B8B50D598AAB0
            B0AACC40B7A9AA29DBD02C16AB6A8285B6D560ADB45AED96BB456D657DA2D15F
            594EB6BAB69D2ACACA54A952CB94A5161615612AA94284A53D0E1C39E9A721C3
            726A33AE38E3B19F75D75D75D7D8C75D758C6318C633F18C38A36C36C36AC936
            AD68E969768F5B27A6A7D6D52C9C84849D4AAF2F2927292EAF370A5E5A5A5E14
            DBB0A0C08309D761C2850DD75C71C758EBAC6318C61D83362973E05C26C02D9F
            1A4767B59E2AA17B8FDE571AF1B65EA9D7F8AD6BDC19B14B9F02E136016CF8D1
            9ED678AA85EE3F78D78DB2F54EBFC56B5EE0CD8A5CF81709B00B67C68CF6B3C5
            542F71FBC6BC6D97AA75FE2B5AF7066C52E7C0B84D805B3E3467B59E2AA17B8F
            DE35E36CBD53AFF15AD7B83362973E05C26C02D9F1A33DACF1550BDC7EF1AF1B
            65EA9D7F8AD6BDC19B14B9F02E136016CF8D19ED678AA85EE3F78D78DB2F54EB
            FC56B5EE0CD8A5CF81709B00B67C68CF6B3C5542F71FBC6BC6D97AA75FE2B5AF
            7066C52E7C0B84D805B3E3467B59E2AA17B8FDE35E36CBD53AFF0015AD7B8336
            2973E05C26C02D9F1A33DACF1550BDC7EF1AF1B65EA9D7F8AD6BDC19B14B9F02
            E136016CF8D19ED678AA85EE3F78D78DB2F54EBFC56B5EE0CD8A5CF81709B00B
            67C68CF6B3C5542F71FBC6BC6D97AA75FE2B5AF7066C52E7C0B84D805B3E3467
            B59E2AA17B8FDE35E36CBD53AFF15AD7B83362973E05C26C02D9F1A33DACF155
            0BDC7EF1AF1B65EA9D7F8AD6BDC19B14B9F02E136016CF8D19ED678AA85EE3F7
            8D78DB2F54EBFC56B5EE0CD8A5CF81709B00B67C68CF6B3C5542F71FBC6BC6D9
            7AA75FE2B5AF7066C52E7C0B84D805B3E3467B59E2AA17B8FDE35E36CBD53AFF
            0015AD7B83362973E05C26C02D9F1A33DACF1550BDC7EF1AF1B65EA9D7F8AD6B
            DC19B14B9F02E136016CF8D19ED678AA85EE3F78D78DB2F54EBFC56B5EE0CD8A
            5CF81709B00B67C68CF6B3C5542F71FBC6BC6D97AA75FE2B5AF7066C52E7C0B8
            4D805B3E3467B59E2AA17B8FDE35E36CBD53AFF15AD7B83362973E05C26C02D9
            F1A33DACF1550BDC7EF1AF1B65EA9D7F8AD6BDC19B14B9F02E136016CF8D19ED
            678AA85EE3F78D78DB2F54EBFC56B5EE0CD8A5CF81709B00B67C68CF6B3C5542
            F71FBC6BC6D97AA75FE2B5AF7066C52E7C0B84D805B3E3467B59E2AA17B8FDE3
            5E36CBD53AFF0015AD7B83362973E05C26C02D9F1A33DACF1550BDC7EF1AF1B6
            5EA9D7F8AD6BDC19B14B9F02E136016CF8D19ED678AA85EE3F78D78DB2F54EBF
            C56B5EE0CD8A5CF81709B00B67C68CF6B3C5542F71FBC6BC6D97AA75FE2B5AF7
            066C52E7C0B84D805B3E3467B59E2AA17B8FDE35E36CBD53AFF15AD7B871F983
            97C814DC8151857D020F435455C4586AF35547584A66205814D2D4EC0816FB55
            89413EDB65B0555A2C96CB25A2AAAEBECF68A8ACA15B535B428D655D2A34A8E4
            CA48A3AC2AC5554D85154A7A243893D2AE4486FCD4679C7DC7A338EBCEBCEBCF
            B58F3AF31AD6358D67E35858F63D6C36ACAD6AD67096A968F5B2826A856D4D49
            CFC84E54AAF3129392930AF290A625A665E2CDBD0A3408D09E7A1C58511D79C7
            DC79AEBCC6B1AD61EC62EC6B9964FA2E5DCF22F149D76A8BB45CF11253A023D1
            C14529EA95634CA2B0E4866DC5651C960B256B56D35966B1E4B55AAB7259EA29
            DA2BE9D5557F5A14AB6B32E4CB4B2D951E9643998D1662349BCFC68F11F8B15E
            FF004CD3BFD4488F35E7DBFCBB198EB3F5E6B5BF8EB18C67FC67E1D285EC962C
            42A65B56A896693999A565C519C55529976A3A965DD8F3D3F1DF999A8CC812EA
            D0A0416448D11F7990E0C38709C637F971C75D63186E5D04523FBE46CC7C8FE9
            C62D0FA7F727AF537E722763CC9FB92E6B14D57F64682291FDF23663E47F4E1A
            1F4FEE4F5EA6FCE363CC9FB92E6B14D57F64682291FDF23663E47F4E1A1F4FEE
            4F5EA6FCE363CC9FB92E6B14D57F64682291FDF23663E47F4E1A1F4FEE4F5EA6
            FCE363CC9FB92E6B14D57F64682291FDF23663E47F4E1A1F4FEE4F5EA6FCE363
            CC9FB92E6B14D57F64682291FDF23663E47F4E1A1F4FEE4F5EA6FCE363CC9FB9
            2E6B14D57F64682291FDF23663E47F4E1A1F4FEE4F5EA6FCE363CC9FB92E6B14
            D57F64682291FDF23663E47F4E1A1F4FEE4F5EA6FCE363CC9FB92E6B14D57F64
            682291FDF23663E47F4E1A1F4FEE4F5EA6FCE363CC9FB92E6B14D57F64682291
            FDF23663E47F4E1A1F4FEE4F5EA6FCE363CC9FB92E6B14D57F64682291FDF236
            63E47F4E1A1F4FEE4F5EA6FCE363CC9FB92E6B14D57F64682291FDF23663E47F
            4E1A1F4FEE4F5EA6FCE363CC9FB92E6B14D57F64682291FDF23663E47F4E1A1F
            4FEE4F5EA6FCE363CC9FB92E6B14D57F64682291FDF23663E47F4E1A1F4FEE4F
            5EA6FCE363CC9FB92E6B14D57F64682291FDF23663E47F4E1A1F4FEE4F5EA6FC
            E363CC9FB92E6B14D57F64682291FDF23663E47F4E1A1F4FEE4F5EA6FCE363CC
            9FB92E6B14D57F64682291FDF23663E47F4E1A1F4FEE4F5EA6FCE363CC9FB92E
            6B14D57F64682291FDF23663E47F4E1A1F4FEE4F5EA6FCE363CC9FB92E6B14D5
            7F64682291FDF23663E47F4E1A1F4FEE4F5EA6FCE363CC9FB92E6B14D57F6468
            2291FDF23663E47F4E1A1F4FEE4F5EA6FCE363CC9FB92E6B14D57F64682291FD
            F23663E47F4E1A1F4FEE4F5EA6FCE363CC9FB92E6B14D57F64682291FDF23663
            E47F4E1A1F4FEE4F5EA6FCE363CC9FB92E6B14D57F64682291FDF23663E47F4E
            1A1F4FEE4F5EA6FCE363CC9FB92E6B14D57F64682291FDF23663E47F4E1A1F4F
            EE4F5EA6FCE363CC9FB92E6B14D57F64682291FDF23663E47F4E1A1F4FEE4F5E
            A6FCE363CC9FB92E6B14D57F64682291FDF23663E47F4E1A1F4FEE4F5EA6FCE3
            63CC9FB92E6B14D57F64682291FDF23663E47F4E1A1F4FEE4F5EA6FCE363CC9F
            B92E6B14D57F64682291FDF23663E47F4E1A1F4FEE4F5EA6FCE363CC9FB92E6B
            14D57F64C3579CDCCB27D08EEE79E88A4D4B545DA4E787729D1EDE8DFA2AAF54
            AB62652586DC3371AB2764B7D92A9AB66ACB4D8F2DAACB5592D15142D1514EB6
            ABFB50A35B57972E4A5932C0A590E5A342988326F391A044722C27BFD334F7F3
            121BCC79C6FF002F466BADFC798C6FE3CC6B1BFF0059F84B20E4B16214CADA4D
            448D49CCCAAB21A8C9AAA6CCBD51D4B30EC09E908EE4CCAC66C098568B023321
            C686E3CD871A1C484FB19FCBEE3CEB5AC2B1DCEFB282EDCE886593F20699B09E
            8629000000000000000000000000000000000000000000000000000000000000
            00009BF7C4ECA0BC8FA2199BFC81D800B9DF6505DB9D10CB27E40D300A400000
            000000000000000000000000000000000000000000000000000000000026FDF1
            3B282F23E88666FF002076002E77D94176E74432C9F9034C0290000000000000
            0000000000000000000000000000000000000000000000000009BF7C4ECA0BC8
            FA2199BFC81D800B9DF6505DB9D10CB27E40D300A40000000000000000000000
            0000000000000000000000000000000000000000026FDF13B282F23E88666FF2
            076002E77D94176E74432C9F9034C02900000000000000000000000000000000
            000000000000000000000000000000009BF7C4ECA0BC8FA2199BFC81D800B9DF
            6505DB9D10CB27E40D300A400000000000000000000000000000000000000000
            000000000000000000000026FDF13B282F23E88666FF002076002E77D94176E7
            4432C9F9034C0290000000000000000000000000000000000000000000000000
            0000000000000009BF7C4ECA0BC8FA2199BFC81D800B9DF6505DB9D10CB27E40
            D300A40000000000000000000000000000000000000000000000000000000000
            0000026FDF13B282F23E88666FF2076002E77D94176E74432C9F9034C0290000
            0000000000000000000000000000000000000000000000000000000000009BF7
            C4ECA0BC8FA2199BFC81D801E206547F983B9A506592004AA59E40D09FD67970
            83F0F608D4BE2BA65541B55CEFAA864D74D67D07256B76AE062ED043AC59A291
            91429A4D05A56A360A55F96CD9146D992AFF00DE981A035E4DD9CB55BBDD8A97
            CEC00D7937672D56EF762A5F3B0035E4DD9CB55BBDD8A97CEC00D7937672D56E
            F762A5F3B0035E4DD9CB55BBDD8A97CEC00D7937672D56EF762A5F3B0035E4DD
            9CB55BBDD8A97CEC00D7937672D56EF762A5F3B0035E4DD9CB55BBDD8A97CEC0
            0D7937672D56EF762A5F3B0035E4DD9CB55BBDD8A97CEC00D7937672D56EF762
            A5F3B0035E4DD9CB55BBDD8A97CEC00D7937672D56EF762A5F3B0035E4DD9CB5
            5BBDD8A97CEC00D7937672D56EF762A5F3B0035E4DD9CB55BBDD8A97CEC00D79
            37672D56EF762A5F3B0035E4DD9CB55BBDD8A97CEC00D7937672D56EF762A5F3
            B0035E4DD9CB55BBDD8A97CEC00D7937672D56EF762A5F3B0035E4DD9CB55BBD
            D8A97CEC00D7937672D56EF762A5F3B0035E4DD9CB55BBDD8A97CEC00D793767
            2D56EF762A5F3B0035E4DD9CB55BBDD8A97CEC00D7937672D56EF762A5F3B006
            7F9AEFE60EE69BE9648FF2A9689034260D9E63E0FC428235CF8A99955072D734
            2AA26B5D499F4DC954DDAC818854172B11A8ABE550A0934D69268DBE95464B36
            551B1E4ACFF7A007FFD9}
          HightQuality = False
          Transparent = True
          TransparentColor = clWhite
        end
        object Memo77: TfrxMemoView
          AllowVectorExport = True
          Left = 11.338582680000000000
          Top = 114.385900000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 2960685
          Font.Height = -13
          Font.Name = 'segoe UI'
          Font.Style = [fsBold]
          Frame.Typ = []
          Frame.Width = 0.500000000000000000
          Memo.UTF8W = (
            'Faturamento')
          ParentFont = False
        end
        object lbFatMes: TfrxMemoView
          AllowVectorExport = True
          Left = 11.338582680000000000
          Top = 130.063080000000000000
          Width = 177.637795280000000000
          Height = 18.897637800000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 5723991
          Font.Height = -15
          Font.Name = 'segoe UI'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            '[FAT_MES_ATUAL]')
          ParentFont = False
        end
        object Memo79: TfrxMemoView
          AllowVectorExport = True
          Left = 11.338582680000000000
          Top = 151.181102360000000000
          Width = 32.125984251968500000
          Height = 18.897637800000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'segoe UI'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'M-1')
          ParentFont = False
          VAlign = vaBottom
        end
        object Memo80: TfrxMemoView
          AllowVectorExport = True
          Left = 11.338582680000000000
          Top = 171.968503940000000000
          Width = 32.125984251968500000
          Height = 18.897637800000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'segoe UI'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'A-1')
          ParentFont = False
          VAlign = vaBottom
        end
        object lbFatM1: TfrxMemoView
          AllowVectorExport = True
          Left = 36.661385590000000000
          Top = 151.181102360000000000
          Width = 86.929133860000000000
          Height = 18.897637800000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'segoe UI'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[FAT_M1]')
          ParentFont = False
          VAlign = vaBottom
        end
        object lbFatA1: TfrxMemoView
          AllowVectorExport = True
          Left = 36.661385590000000000
          Top = 171.968503940000000000
          Width = 86.929133860000000000
          Height = 18.897637800000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'segoe UI'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[FAT_A1]')
          ParentFont = False
          VAlign = vaBottom
        end
        object lbPercFatM1: TfrxMemoView
          AllowVectorExport = True
          Left = 175.417347240000000000
          Top = 151.181102360000000000
          Width = 58.582677170000000000
          Height = 18.897637800000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'segoe UI'
          Font.Style = []
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            '[VAR_FAT_M1]')
          ParentFont = False
          VAlign = vaBottom
        end
        object lbPercFatA1: TfrxMemoView
          AllowVectorExport = True
          Left = 175.417347240000000000
          Top = 171.968503940000000000
          Width = 58.582677170000000000
          Height = 18.897637800000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'segoe UI'
          Font.Style = []
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            '[VAR_FAT_A1]')
          ParentFont = False
          VAlign = vaBottom
        end
        object Picture2: TfrxPictureView
          AllowVectorExport = True
          Left = 244.669450000000000000
          Top = 105.826840000000000000
          Width = 230.551181100000000000
          Height = 90.708720000000000000
          Frame.Typ = []
          Picture.Data = {
            0A544A504547496D616765E32B0000FFD8FFE000104A46494600010101012C01
            2C0000FFE202644943435F50524F46494C45000101000002546C636D73043000
            006D6E74725247422058595A2007E9000A000A00140009002E616373704D5346
            540000000000000000000000000000000000000000000000000000F6D6000100
            000000D32D6C636D730000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000B64657363000001
            080000003E63707274000001480000004C777470740000019400000014636861
            64000001A80000002C7258595A000001D4000000146258595A000001E8000000
            146758595A000001FC0000001472545243000002100000002067545243000002
            10000000206254524300000210000000206368726D00000230000000246D6C75
            6300000000000000010000000C656E5553000000220000001C00730052004700
            42002000490045004300360031003900360036002D0032002E003100006D6C75
            6300000000000000010000000C656E5553000000300000001C004E006F002000
            63006F0070007900720069006700680074002C00200075007300650020006600
            7200650065006C007958595A20000000000000F6D6000100000000D32D736633
            320000000000010C42000005DEFFFFF325000007930000FD90FFFFFBA1FFFFFD
            A2000003DC0000C06E58595A200000000000006FA0000038F50000039058595A
            20000000000000249F00000F840000B6C358595A2000000000000062970000B7
            87000018D9706172610000000000030000000266660000F2A700000D59000013
            D000000A5B6368726D00000000000300000000A3D70000547B00004CCD000099
            9A0000266600000F5CFFDB004300010101010101010101010101010101010101
            0101010101010101010101010101010101010101010101010101010101010101
            0101010101010101010101010101FFDB00430101010101010101010101010101
            0101010101010101010101010101010101010101010101010101010101010101
            01010101010101010101010101010101010101FFC0001108011302C903011100
            021101031101FFC4001A0001010101010101000000000000000000000A0B0908
            0704FFC40036100100000304090304010304030000000000060708051857D502
            03041958949798D4010AB738397778110912B5133775762131D7FFC400180101
            0101010100000000000000000000000007090806FFC400391101000002060B01
            0001010509010000000003050406175694D4020708181954559296D2D3011121
            123175B4B509132235363738747641FFDA000C03010002110311003F00900A6F
            A6FD82AAF608FA62CC58FA33D38AB4E33DA7D6D6B5BD769D9AD6B46DFB46D6D9
            B556CDA36C5B368DB3ABDB36EDB6D3DB76EDB35FAEDAB6AD76BF4F59B46B34F4
            B5BADD2D2D66969697ACDEBB576A6D57A6D0E8B45A1D1693A349A2E947D2D28F
            A517F34B474BF22E943FECE8FF00BBD2D1FCFE3F8D1FE7FAFF005FE5DABB30EC
            C35675EB562B1CF6795927B258F259F4394C18329852F890A342D397D1E99FB1
            62FED32045D3FC89F9A71B4B43F8D0FDFCD1FECFE7E7F4FE7F9FD7A4F769CB6C
            438E397B07C078AB5D9B74A9777D27E8E99E1DDABEBFB5CB0F24C99BB4E5B621
            C71CBD83E016BB36E952EEFA4FD0E1DDABEBFB5CB0F24C99BB4E5B621C71CBD8
            3E016BB36E952EEFA4FD0E1DDABEBFB5CB0F24C99BB4E5B621C71CBD83E016BB
            36E952EEFA4FD0E1DDABEBFB5CB0F24C99BB4E5B621C71CBD83E016BB36E952E
            EFA4FD0E1DDABEBFB5CB0F24C99BB4E5B621C71CBD83E016BB36E952EEFA4FD0
            E1DDABEBFB5CB0F24C99BB4E5B621C71CBD83E016BB36E952EEFA4FD0E1DDABE
            BFB5CB0F24C99BB4E5B621C71CBD83E016BB36E952EEFA4FD0E1DDABEBFB5CB0
            F24C99BB4E5B621C71CBD83E016BB36E952EEFA4FD0E1DDABEBFB5CB0F24C99B
            B4E5B621C71CBD83E016BB36E952EEFA4FD0E1DDABEBFB5CB0F24C99BB4E5B62
            1C71CBD83E016BB36E952EEFA4FD0E1DDABEBFB5CB0F24C99BB4E5B621C71CBD
            83E016BB36E952EEFA4FD0E1DDABEBFB5CB0F24C99BB4E5B621C71CBD83E016B
            B36E952EEFA4FD0E1DDABEBFB5CB0F24C99BB4E5B621C71CBD83E016BB36E952
            EEFA4FD0E1DDABEBFB5CB0F24C99BB4E5B621C71CBD83E016BB36E952EEFA4FD
            0E1DDABEBFB5CB0F24C99BB4E5B621C71CBD83E016BB36E952EEFA4FD0E1DDAB
            EBFB5CB0F24C99BB4E5B621C71CBD83E016BB36E952EEFA4FD0E1DDABEBFB5CB
            0F24C99BB4E5B621C71CBD83E016BB36E952EEFA4FD0E1DDABEBFB5CB0F24C99
            BB4E5B621C71CBD83E016BB36E952EEFA4FD0E1DDABEBFB5CB0F24C99BB4E5B6
            21C71CBD83E016BB36E952EEFA4FD0E1DDABEBFB5CB0F24C99BB4E5B621C71CB
            D83E016BB36E952EEFA4FD0E1DDABEBFB5CB0F24C99BB4E5B621C71CBD83E016
            BB36E952EEFA4FD0E1DDABEBFB5CB0F24C99BB4E5B621C71CBD83E016BB36E95
            2EEFA4FD0E1DDABEBFB5CB0F24C99BB4E5B621C71CBD83E016BB36E952EEFA4F
            D0E1DDABEBFB5CB0F24C99BB4E5B621C71CBD83E016BB36E952EEFA4FD0E1DDA
            BEBFB5CB0F24C99BB4E5B621C71CBD83E016BB36E952EEFA4FD0E1DDABEBFB5C
            B0F24C99BB4E5B621C71CBD83E016BB36E952EEFA4FD0E1DDABEBFB5CB0F24C9
            9BB4E5B621C71CBD83E016BB36E952EEFA4FD0E1DDABEBFB5CB0F24C99BB4E5B
            621C71CBD83E016BB36E952EEFA4FD0E1DDABEBFB5CB0F24C99BB4E5B621C71C
            BD83E016BB36E952EEFA4FD0E1DDABEBFB5CB0F24C99BB4E5B621C71CBD83E01
            6BB36E952EEFA4FD0E1DDABEBFB5CB0F24C99BB4E5B621C71CBD83E016BB36E9
            52EEFA4FD0E1DDABEBFB5CB0F24C99BB4E5B621C71CBD83E016BB36E952EEFA4
            FD0E1DDABEBFB5CB0F24C99BB4E5B621C71CBD83E016BB36E952EEFA4FD0E1DD
            ABEBFB5CB0F24C99BB4E5B621C71CBD83E016BB36E952EEFA4FD0E1DDABEBFB5
            CB0F24C99BB4E5B621C71CBD83E016BB36E952EEFA4FD0E1DDABEBFB5CB0F24C
            99BB4E5B621C71CBD83E016BB36E952EEFA4FD0E1DDABEBFB5CB0F24C99BB4E5
            B621C71CBD83E016BB36E952EEFA4FD0E1DDABEBFB5CB0F24C99BB4E5B621C71
            CBD83E016BB36E952EEFA4FD0E1DDABEBFB5CB0F24C99BB4E5B621C71CBD83E0
            16BB36E952EEFA4FD0E1DDABEBFB5CB0F24C99BB4E5B621C71CBD83E016BB36E
            952EEFA4FD0E1DDABEBFB5CB0F24C99BB4E5B621C71CBD83E016BB36E952EEFA
            4FD0E1DDABEBFB5CB0F24C99BB4E5B621C71CBD83E016BB36E952EEFA4FD0E1D
            DABEBFB5CB0F24C99BB4E5B621C71CBD83E016BB36E952EEFA4FD0E1DDABEBFB
            5CB0F24C99BB4E5B621C71CBD83E016BB36E952EEFA4FD0E1DDABEBFB5CB0F24
            C99BB4E5B621C71CBD83E016BB36E952EEFA4FD0E1DDABEBFB5CB0F24C99BB4E
            5B621C71CBD83E016BB36E952EEFA4FD0E1DDABEBFB5CB0F24C99BB4E5B621C7
            1CBD83E016BB36E952EEFA4FD0E1DDABEBFB5CB0F24C99BB4E5B621C71CBD83E
            016BB36E952EEFA4FD0E1DDABEBFB5CB0F24C99BB4E5B621C71CBD83E016BB36
            E952EEFA4FD0E1DDABEBFB5CB0F24C99BB4E5B621C71CBD83E016BB36E952EEF
            A4FD0E1DDABEBFB5CB0F24C99BB4E5B621C71CBD83E016BB36E952EEFA4FD0E1
            DDABEBFB5CB0F24C99BB4E5B621C71CBD83E016BB36E952EEFA4FD0E1DDABEBF
            B5CB0F24C99BB4E5B621C71CBD83E016BB36E952EEFA4FD0E1DDABEBFB5CB0F2
            4C99BB4E5B621C71CBD83E016BB36E952EEFA4FD0E1DDABEBFB5CB0F24C99BB4
            E5B621C71CBD83E016BB36E952EEFA4FD0E1DDABEBFB5CB0F24C99BB4E5B621C
            71CBD83E016BB36E952EEFA4FD0E1DDABEBFB5CB0F24C99BB4E5B621C71CBD83
            E016BB36E952EEFA4FD0E1DDABEBFB5CB0F24C99BB4E5B621C71CBD83E016BB3
            6E952EEFA4FD0E1DDABEBFB5CB0F24C99BB4E5B621C71CBD83E016BB36E952EE
            FA4FD0E1DDABEBFB5CB0F24C99BB4E5B621C71CBD83E016BB36E952EEFA4FD0E
            1DDABEBFB5CB0F24C99BB4E5B621C71CBD83E016BB36E952EEFA4FD0E1DDABEB
            FB5CB0F24C99BB4E5B621C71CBD83E016BB36E952EEFA4FD0E1DDABEBFB5CB0F
            24C99BB4E5B621C71CBD83E016BB36E952EEFA4FD0E1DDABEBFB5CB0F24C99BB
            4E5B621C71CBD83E016BB36E952EEFA4FD0E1DDABEBFB5CB0F24C99BB4E5B621
            C71CBD83E016BB36E952EEFA4FD0E1DDABEBFB5CB0F24C99BB4E5B621C71CBD8
            3E016BB36E952EEFA4FD0E1DDABEBFB5CB0F24C99BB4E5B621C71CBD83E016BB
            36E952EEFA4FD0E1DDABEBFB5CB0F24C99BB4E5B621C71CBD83E016BB36E952E
            EFA4FD0E1DDABEBFB5CB0F24C99BB4E5B621C71CBD83E016BB36E952EEFA4FD0
            E1DDABEBFB5CB0F24C99BB4E5B621C71CBD83E016BB36E952EEFA4FD0E1DDABE
            BFB5CB0F24C99BB4E5B621C71CBD83E016BB36E952EEFA4FD0E1DDABEBFB5CB0
            F24C99BB4E5B621C71CBD83E016BB36E952EEFA4FD0E1DDABEBFB5CB0F24C99B
            B4E5B621C71CBD83E016BB36E952EEFA4FD0E1DDABEBFB5CB0F24C99BB4E5B62
            1C71CBD83E016BB36E952EEFA4FD0E1DDABEBFB5CB0F24C99BB4E5B621C71CBD
            83E016BB36E952EEFA4FD0E1DDABEBFB5CB0F24C99BB4E5B621C71CBD83E016B
            B36E952EEFA4FD0E1DDABEBFB5CB0F24C99BB4E5B621C71CBD83E016BB36E952
            EEFA4FD0E1DDABEBFB5CB0F24C99BB4E5B621C71CBD83E016BB36E952EEFA4FD
            0E1DDABEBFB5CB0F24C99BB4E5B621C71CBD83E016BB36E952EEFA4FD0E1DDAB
            EBFB5CB0F24C99BB4E5B621C71CBD83E016BB36E952EEFA4FD0E1DDABEBFB5CB
            0F24C99BB4E5B621C71CBD83E016BB36E952EEFA4FD0E1DDABEBFB5CB0F24C99
            BB4E5B621C71CBD83E016BB36E952EEFA4FD0E1DDABEBFB5CB0F24C99BB4E5B6
            21C71CBD83E016BB36E952EEFA4FD0E1DDABEBFB5CB0F24C99BB4E5B621C71CB
            D83E016BB36E952EEFA4FD0E1DDABEBFB5CB0F24C99BB4E5B621C71CBD83E016
            BB36E952EEFA4FD0E1DDABEBFB5CB0F24C99BB4E5B621C71CBD83E016BB36E95
            2EEFA4FD0E1DDABEBFB5CB0F24C9BE1551B45D0749195D694C1B0A318A6D5B4A
            CDB52C4D9351B25A3ABB2F55B37AFA5A3686AB65D3D6FAEB363D9753B468EB35
            3E9A7FEA6ABD74359E9FC69FA7A7F3FCFA3D2D52D614C2B0CEA0CB29140A1D1E
            144834889FB120E946FD89F9FB061FEE9FE7E7E7E69E9FEE8FF1FBFBF9FC7EFF
            004FEEFEE44F682D8FEA8EA7B56733AF128AD758E6D4EA0CC25143D0A14CA0CB
            3428BA7A131A743A2C4D3D3D2A2D1A1C6FED43D0D3FDD2D0FE34FF003F3FB5F9
            F9FDAFE7F3FA3E057DEAC9E2AAA1BAC31F67CAC33F5EF2FE9A7FEDB4C3FF00BC
            6CFF00E076040B5BBFF36957F8769FF9988D6FFF00677FFDBCAF9FFD9C0FF43A
            0BA4892342400000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            000000000001E32AF7FA6F88FF00E7E13FF35B3A81AB2FFAB28BFF00AB4DFF00
            2FA4E45DB83FF1F2B07F8E557FF5880E0A3A61882ECA7F4D3FF6DA61FF00DE36
            7FF03B0205ADDFF9B4ABFC3B4FFCCC46B7FF00B3BFFEDE57CFFECE07FA1D05D2
            4491A12000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            00000000F1957BFD37C47FF3F09FF9AD9D40D597FD5945FF00D5A6FF0097D272
            2EDC1FF8F9583FC72ABFFAC407051D30C417773FA4F490A839A72A667DA927A9
            D27DCE7B1ECD985B2D9F6ADB529254C5B302C8B22D2D286ECDDA346CBB52D087
            6CFDB367D86D1D3D9759AADAF4763D7E9E86BB4B66D6EAB5DE9A3FD9A7A3EBEB
            25D61D549CD6098502912C810E2C28143D28313F74E34385FBF913F63E9E9FE7
            E7E7E69FEFE7EFEFFC3FBF9FBFCFF77FF8D07D8F35FDAB3D50D4FAD728AF136A
            64BE9D35ACB0A6343874695D369FA3128BA12BA2D1B4B4F4A25161E9E8E8697F
            BE85A7A3FD8D2FDFCD2FE3F3F9FE3F8FD7562E7F5C3C07D6A76D733B234FACD6
            B6727031707D9D7DBECECFB79A6BE3937CB973FAE1E03EB53B6B99D91966B5B3
            93818B83EC6FB3B3EDE69AF8E4DF2E5CFEB8780FAD4EDAE6764659AD6CE4E062
            E0FB1BECECFB79A6BE3937CB973FAE1E03EB53B6B99D91966B5B393818B83EC6
            FB3B3EDE69AF8E4DF2E5CFEB8780FAD4EDAE6764659AD6CE4E062E0FB1BECECF
            B79A6BE3937CB973FAE1E03EB53B6B99D91966B5B393818B83EC6FB3B3EDE69A
            F8E4DF2E5CFEB8780FAD4EDAE6764659AD6CE4E062E0FB1BECECFB79A6BE3937
            CB973FAE1E03EB53B6B99D91966B5B393818B83EC6FB3B3EDE69AF8E4DF2E5CF
            EB8780FAD4EDAE6764659AD6CE4E062E0FB1BECECFB79A6BE3937CB973FAE1E0
            3EB53B6B99D91966B5B393818B83EC6FB3B3EDE69AF8E4DF2E5CFEB8780FAD4E
            DAE6764659AD6CE4E062E0FB1BECECFB79A6BE3937CB973FAE1E03EB53B6B99D
            91966B5B393818B83EC6FB3B3EDE69AF8E4DF2E5CFEB8780FAD4EDAE6764659A
            D6CE4E062E0FB1BECECFB79A6BE3937CB973FAE1E03EB53B6B99D91966B5B393
            818B83EC6FB3B3EDE69AF8E4DF2E5CFEB8780FAD4EDAE6764659AD6CE4E062E0
            FB1BECECFB79A6BE3937CB973FAE1E03EB53B6B99D91966B5B393818B83EC6FB
            3B3EDE69AF8E4DF2E5CFEB8780FAD4EDAE6764659AD6CE4E062E0FB1BECECFB7
            9A6BE3937CB973FAE1E03EB53B6B99D91966B5B393818B83EC6FB3B3EDE69AF8
            E4DF2E5CFEB8780FAD4EDAE6764659AD6CE4E062E0FB1BECECFB79A6BE3937CB
            973FAE1E03EB53B6B99D91966B5B393818B83EC6FB3B3EDE69AF8E4DF2E5CFEB
            8780FAD4EDAE6764659AD6CE4E062E0FB1BECECFB79A6BE3937CB973FAE1E03E
            B53B6B99D91966B5B393818B83EC6FB3B3EDE69AF8E4DF2E5CFEB8780FAD4EDA
            E6764659AD6CE4E062E0FB1BECECFB79A6BE3937CB973FAE1E03EB53B6B99D91
            966B5B393818B83EC6FB3B3EDE69AF8E4DF2E5CFEB8780FAD4EDAE6764659AD6
            CE4E062E0FB1BECECFB79A6BE3937CB973FAE1E03EB53B6B99D91966B5B39381
            8B83EC6FB3B3EDE69AF8E4DF2E5CFEB8780FAD4EDAE6764659AD6CE4E062E0FB
            1BECECFB79A6BE3937CB973FAE1E03EB53B6B99D91966B5B393818B83EC6FB3B
            3EDE69AF8E4DF2E5CFEB8780FAD4EDAE6764659AD6CE4E062E0FB1BECECFB79A
            6BE3937CB973FAE1E03EB53B6B99D91966B5B393818B83EC6FB3B3EDE69AF8E4
            DF2E5CFEB8780FAD4EDAE6764659AD6CE4E062E0FB1BECECFB79A6BE3937CB97
            3FAE1E03EB53B6B99D91966B5B393818B83EC6FB3B3EDE69AF8E4DF2E5CFEB87
            80FAD4EDAE6764659AD6CE4E062E0FB1BECECFB79A6BE3937CB973FAE1E03EB5
            3B6B99D91966B5B393818B83EC6FB3B3EDE69AF8E4DF2E5CFEB8780FAD4EDAE6
            764659AD6CE4E062E0FB1BECECFB79A6BE3937CB973FAE1E03EB53B6B99D9196
            6B5B393818B83EC6FB3B3EDE69AF8E4DF2E5CFEB8780FAD4EDAE6764659AD6CE
            4E062E0FB1BECECFB79A6BE3937CB973FAE1E03EB53B6B99D91966B5B393818B
            83EC6FB3B3EDE69AF8E4DF2E5CFEB8780FAD4EDAE6764659AD6CE4E062E0FB1B
            ECECFB79A6BE3937CB973FAE1E03EB53B6B99D91966B5B393818B83EC6FB3B3E
            DE69AF8E4DF2E5CFEB8780FAD4EDAE6764659AD6CE4E062E0FB1BECECFB79A6B
            E3937CB973FAE1E03EB53B6B99D91966B5B393818B83EC6FB3B3EDE69AF8E4DF
            2E5CFEB8780FAD4EDAE6764659AD6CE4E062E0FB1BECECFB79A6BE3937CB973F
            AE1E03EB53B6B99D91966B5B393818B83EC6FB3B3EDE69AF8E4DF2E5CFEB8780
            FAD4EDAE6764659AD6CE4E062E0FB1BECECFB79A6BE3937CB973FAE1E03EB53B
            6B99D91966B5B393818B83EC6FB3B3EDE69AF8E4DF2E5CFEB8780FAD4EDAE676
            4659AD6CE4E062E0FB1BECECFB79A6BE3937CB973FAE1E03EB53B6B99D91966B
            5B393818B83EC6FB3B3EDE69AF8E4DF2E5CFEB8780FAD4EDAE6764659AD6CE4E
            062E0FB1BECECFB79A6BE3937CB973FAE1E03EB53B6B99D91966B5B393818B83
            EC6FB3B3EDE69AF8E4DF2E5CFEB8780FAD4EDAE6764659AD6CE4E062E0FB1BEC
            ECFB79A6BE3937CB973FAE1E03EB53B6B99D91966B5B393818B83EC6FB3B3EDE
            69AF8E4DF2E5CFEB8780FAD4EDAE6764659AD6CE4E062E0FB1BECECFB79A6BE3
            937CB973FAE1E03EB53B6B99D91966B5B393818B83EC6FB3B3EDE69AF8E4DF2E
            5CFEB8780FAD4EDAE6764659AD6CE4E062E0FB1BECECFB79A6BE3937CB973FAE
            1E03EB53B6B99D91966B5B393818B83EC6FB3B3EDE69AF8E4DF2E5CFEB8780FA
            D4EDAE6764659AD6CE4E062E0FB1BECECFB79A6BE3937CB973FAE1E03EB53B6B
            99D91966B5B393818B83EC6FB3B3EDE69AF8E4DF2E5CFEB8780FAD4EDAE67646
            59AD6CE4E062E0FB1BECECFB79A6BE3937CB973FAE1E03EB53B6B99D91966B5B
            393818B83EC6FB3B3EDE69AF8E4DF2E5CFEB8780FAD4EDAE6764659AD6CE4E06
            2E0FB1BECECFB79A6BE3937CB973FAE1E03EB53B6B99D91966B5B393818B83EC
            6FB3B3EDE69AF8E4DF2E5CFEB8780FAD4EDAE6764659AD6CE4E062E0FB1BECEC
            FB79A6BE3937CB973FAE1E03EB53B6B99D91966B5B393818B83EC6FB3B3EDE69
            AF8E4DF2E5CFEB8780FAD4EDAE6764659AD6CE4E062E0FB1BECECFB79A6BE393
            7CB973FAE1E03EB53B6B99D91966B5B393818B83EC6FB3B3EDE69AF8E4DF2E5C
            FEB8780FAD4EDAE6764659AD6CE4E062E0FB1BECECFB79A6BE3937CB973FAE1E
            03EB53B6B99D91966B5B393818B83EC6FB3B3EDE69AF8E4DF2E5CFEB8780FAD4
            EDAE6764659AD6CE4E062E0FB1BECECFB79A6BE3937CB973FAE1E03EB53B6B99
            D91966B5B393818B83EC6FB3B3EDE69AF8E4DF2E5CFEB8780FAD4EDAE6764659
            AD6CE4E062E0FB1BECECFB79A6BE3937CB973FAE1E03EB53B6B99D91966B5B39
            3818B83EC6FB3B3EDE69AF8E4DF2E5CFEB8780FAD4EDAE6764659AD6CE4E062E
            0FB1BECECFB79A6BE3937CB973FAE1E03EB53B6B99D91966B5B393818B83EC6F
            B3B3EDE69AF8E4DF2E5CFEB8780FAD4EDAE6764659AD6CE4E062E0FB1BECECFB
            79A6BE3937CB973FAE1E03EB53B6B99D91966B5B393818B83EC6FB3B3EDE69AF
            8E4DF2E5CFEB8780FAD4EDAE6764659AD6CE4E062E0FB1BECECFB79A6BE3937C
            B973FAE1E03EB53B6B99D91966B5B393818B83EC6FB3B3EDE69AF8E4DF2E5CFE
            B8780FAD4EDAE6764659AD6CE4E062E0FB1BECECFB79A6BE3937CB973FAE1E03
            EB53B6B99D91966B5B393818B83EC6FB3B3EDE69AF8E4DF2E5CFEB8780FAD4ED
            AE6764659AD6CE4E062E0FB1BECECFB79A6BE3937CB973FAE1E03EB53B6B99D9
            1966B5B393818B83EC6FB3B3EDE69AF8E4DF2E5CFEB8780FAD4EDAE6764659AD
            6CE4E062E0FB1BECECFB79A6BE3937CB973FAE1E03EB53B6B99D91966B5B3938
            18B83EC6FB3B3EDE69AF8E4DF2E5CFEB8780FAD4EDAE6764659AD6CE4E062E0F
            B1BECECFB79A6BE3937CB973FAE1E03EB53B6B99D91966B5B393818B83EC6FB3
            B3EDE69AF8E4DF2E5CFEB8780FAD4EDAE6764659AD6CE4E062E0FB1BECECFB79
            A6BE3937CBBC1DFD48E9E2A7E5DD2AC55144D0A56A96955086CB12C17B3ED919
            4CB92D1BC1509EC7B56D96FECDA8D8765DAEDFB72CBD96CFD9F69DBF69D2D0D9
            B62D46B35DE9ACDA768D3D0D4EABD34B4F4BD3D1EBAA454B9FC96B051E9F30A3
            428746870295A1A5A7A1488513F7F34A2C1D2D0D0FF8747F7F9FDFE74BF7F8FE
            9FDCE7ADA87699D51EB3754337AA5546774FA6CEE97349152A051E91269850A1
            E941A0CC6152291A5FB1E910B42168FEE8C2D1FDFDFCD1FDD2FE74BF7FA7E7F5
            4DE2DACBF6943EC90FA27AC3FDA5B23E2684816AE00000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            00000000000000000000000000000000000000000009A7F76A7D96674FE5AA7E
            F93AC7064BE0D287D921F44F587FB4B647C4D0902D5C00000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            000000000000000000000000000000000000000000000134FEED4FB2CCE9FCB5
            4FDF2758E0C97C1A50FB243E89EB0FF696C8F89A1205AB800000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            000000000000000000000000000000000000000000000000269FDDA9F6599D3F
            96A9FBE4EB1C192F834A1F6487D13D61FED2D91F134240B57000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000004D3FBB53ECB33
            A7F2D53F7C9D638325F06943EC90FA27AC3FDA5B23E2684816AE000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000009A7F76A7D9
            6674FE5AA7EF93AC7064BE0D287D921F44F587FB4B647C4D0902D5C000000000
            0000000000000000000000000000000000000000000000000000000000000000
            00000000000000000000000000000000000000000000000000000000134FEED4
            FB2CCE9FCB54FDF2758E0C97C1A50FB243E89EB0FF00696C8F89A1205AB80000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000269
            FDDA9F6599D3F96A9FBE4EB1C192F834A1F6487D13D61FED2D91F134240B5700
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            4D3FBB53ECB33A7F2D53F7C9D638325F06943EC90FA27AC3FDA5B23E2684816A
            E000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0009A7F76A7D96674FE5AA7EF93AC7064BE0D287D921F44F587FB4B647C4D090
            2D5C000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            00000134FEED4FB2CCE9FCB54FDF2758E0C97C1A50FB243E89EB0FF696C8F89A
            1205AB8000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            00000000269FDDA9F6599D3F96A9FBE4EB1C192F834A1F6487D13D61FED2D91F
            134240B570000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            000000000004D3FBB53ECB33A7F2D53F7C9D638325F06943EC90FA27AC3FDA5B
            23E2684816AE0000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            000000000000009A7F76A7D96674FE5AA7EF93AC7064BE0D287D921F44F587FB
            4B647C4D0902D5C0000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000134FEED4FB2CCE9FCB54FDF2758E0C97C1A50FB243E89EB0
            FF00696C8F89A1205AB800000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            000000000000000000000269FDDA9F6599D3F96A9FBE4EB1C192F834A1F6487D
            13D61FED2D91F134240B57000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000004D3FBB53ECB33A7F2D53F7C9D638325F06943EC9
            0FA27AC3FDA5B23E2684816AE000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000009A7F76A7D96674FE5AA7EF93AC7064BE0D287
            D921F44F587FB4B647C4D0902D5C000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            00000000000000000000000000000134FEED4FB2CCE9FCB54FDF2758E0C97C1A
            50FB243E89EB0FF696C8F89A1205AB8000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            00000000000000000000000000000000269FDDA9F6599D3F96A9FBE4EB1C192F
            834A1F6487D13D61FED2D91F134240B570000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            000000000000000000000000000000000004D3FBB53ECB33A7F2D53F7C9D6383
            25F06943EC90FA27AC3FDA5B23E2684816AE0000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            000000000000000000000000000000000000009A7F76A7D96674FE5AA7EF93AC
            7064BE0D287D921F44F587FB4B647C4D0902D5C0000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000134FEED4FB2CCE9FCB54FDF2
            758E0C97C1A50FB243E89EB0FF00696C8F89A1205AB800000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            000000000000000000000000000000000000000000000269FDDA9F6599D3F96A
            9FBE4EB1C192F834A1F6487D13D61FED2D91F134240B57000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000004D3FBB53ECB33A7F
            2D53F7C9D638325F06943EC90FA27AC3FDA5B23E2684816AE000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000009A7F76A7D9667
            4FE5AA7EF93AC7064BE0D287D921F44F587FB4B647C4D0902D5C000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            00000000000000000000000000000000000000000000000000000134FEED4FB2
            CCE9FCB54FDF2758E0C97C1A50FB243E89EB0FF696C8F89A1205AB8000000000
            0000000000000000000000000000000000000000000000000000000000000000
            00000000000000000000000000000000000000000000000000000000269FDDA9
            F6599D3F96A9FBE4EB1C192F834A1F6487D13D61FED2D91F134240B570000000
            0000000000000000000000000000000000000000000000000000000000000000
            000000000000000000000000000000000000000000000000000000000004D3FB
            B53ECB33A7F2D53F7C9D638325F06943EC90FA27AC3FDA5B23E2684816AE0000
            0000000000000000000000000000000000000000000000000000000000000000
            000000000000000000000000000000000000000000000000000000000000009A
            7F76A7D96674FE5AA7EF93AC7064BE0D1B3D97132A5CC11463575B0C691FC150
            86DBB654F593B56C9B1C5115585606D5B56CBE92AA14D4FAED3B36CF6AEDFB26
            B75FA8F4D6E869EABD75DAAD0D2D5FA6B3474B43D74BFBB47D7D3D02CC2F0121
            F1B251F5220DCE40BC0487C6C947D488373902F0121F1B251F5220DCE40BC048
            7C6C947D488373902F0121F1B251F5220DCE40BC0487C6C947D488373902F012
            1F1B251F5220DCE40BC0487C6C947D488373902F0121F1B251F5220DCE40BC04
            87C6C947D488373902F0121F1B251F5220DCE40BC0487C6C947D488373902F01
            21F1B251F5220DCE40BC0487C6C947D488373902F0121F1B251F5220DCE40BC0
            487C6C947D488373902F0121F1B251F5220DCE40BC0487C6C947D488373902F0
            121F1B251F5220DCE40BC0487C6C947D488373902F0121F1B251F5220DCE40BC
            0487C6C947D488373902F0121F1B251F5220DCE40BC0487C6C947D488373902F
            0121F1B251F5220DCE40BC0487C6C947D488373902F0121F1B251F5220DCE40B
            C0487C6C947D488373902F0121F1B251F5220DCE40BC0487C6C947D488373902
            F0121F1B251F5220DCE40BC0487C6C947D488373902F0121F1B251F5220DCE40
            BC0487C6C947D488373902F0121F1B251F5220DCE40BC0487C6C947D48837390
            2F0121F1B251F5220DCE40BC0487C6C947D488373902F0121F1B251F5220DCE4
            0BC0487C6C947D488373902F0121F1B251F5220DCE40BC0487C6C947D4883739
            02F0121F1B251F5220DCE40BC0487C6C947D488373902F0121F1B251F5220DCE
            40BC0487C6C947D488373902F0121F1B251F5220DCE40BC0487C6C947D488373
            902F0121F1B251F5220DCE40BC0487C6C947D488373902F0121F1B251F5220DC
            E40BC0487C6C947D488373902F0121F1B251F5220DCE40BC0487C6C947D48837
            3902F0121F1B251F5220DCE40BC0487C6C947D488373902F0121F1B251F5220D
            CE40BC0487C6C947D488373902F0121F1B251F5220DCE40BC0487C6C947D4883
            73902F0121F1B251F5220DCE40BC0487C6C947D488373902F0121F1B251F5220
            DCE40BC0487C6C947D488373902F0121F1B251F5220DCE40BC0487C6C947D488
            373902F0121F1B251F5220DCE40BC0487C6C947D488373902F0121F1B251F522
            0DCE40BC0487C6C947D488373902F0121F1B251F5220DCE40BC0487C6C947D48
            8373902F0121F1B251F5220DCE40BC0487C6C947D488373902F0121F1B251F52
            20DCE40BC0487C6C947D488373902F0121F1B251F5220DCE40BC0487C6C947D4
            88373902F0121F1B251F5220DCE40BC0487C6C947D488373902F0121F1B251F5
            220DCE40BC0487C6C947D488373902F0121F1B251F5220DCE40BC0487C6C947D
            488373902F0121F1B251F5220DCE40BC0487C6C947D488373902F0121F1B251F
            5220DCE41385EEB49B52AA2DFE8D9392C5852664BE89AD9D7CD6909AED4D930F
            4670E5B569EBB55B3CCAB235BB46B755B059B696D3B56B357A8D568E96B35DA7
            A1AAF5D1D56AFD3D74F4FD74747D3D7D4195003EF955506C352EAA66A0601836
            CCD1B161282E734C985A19B23476ADB76DD1B2EC1B0A2EB5ACDB2B60D1DB2D2D
            A76CB436AD1D9362D9B53A8F4DA36EDAF69DAB5BE9A1FDFAFD7EB75BA5A5A7EA
            1F03000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000007EBB3F55A1AFDBF62D4EB747FBB55AEDAF66D56B347F9F5D1FEED0D66B
            B43434F47F9D1F5F4D2F4FE747D7D7D3F9D1F5F4F5F4FF00DFA7AFA7AFFE416F
            7BA53FA7AF0EDB0F51A6FF00FF004007FFD9}
          HightQuality = False
          Transparent = True
          TransparentColor = clWhite
        end
        object Memo78: TfrxMemoView
          AllowVectorExport = True
          Left = 249.889912680000000000
          Top = 114.385968350000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 2960685
          Font.Height = -13
          Font.Name = 'segoe UI'
          Font.Style = [fsBold]
          Frame.Typ = []
          Frame.Width = 0.500000000000000000
          Memo.UTF8W = (
            'Despesas')
          ParentFont = False
        end
        object lbdespMes: TfrxMemoView
          AllowVectorExport = True
          Left = 249.889912680000000000
          Top = 130.063148350000000000
          Width = 177.637795280000000000
          Height = 18.897637800000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 5723991
          Font.Height = -15
          Font.Name = 'segoe UI'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            '[DESP_MES_ATUAL]')
          ParentFont = False
        end
        object Memo81: TfrxMemoView
          AllowVectorExport = True
          Left = 249.889912680000000000
          Top = 151.181102360000000000
          Width = 32.125984251968500000
          Height = 18.897637800000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'segoe UI'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'M-1')
          ParentFont = False
          VAlign = vaBottom
        end
        object Memo82: TfrxMemoView
          AllowVectorExport = True
          Left = 249.889912680000000000
          Top = 171.968503940000000000
          Width = 32.125984251968500000
          Height = 18.897637800000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'segoe UI'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'A-1')
          ParentFont = False
          VAlign = vaBottom
        end
        object lbdespM1: TfrxMemoView
          AllowVectorExport = True
          Left = 276.283464566929100000
          Top = 151.181102360000000000
          Width = 86.929133860000000000
          Height = 18.897637800000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'segoe UI'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[DESP_M1]')
          ParentFont = False
          VAlign = vaBottom
        end
        object lbdespA1: TfrxMemoView
          AllowVectorExport = True
          Left = 276.283464566929100000
          Top = 171.968503940000000000
          Width = 86.929133860000000000
          Height = 18.897637800000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'segoe UI'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[DESP_A1]')
          ParentFont = False
          VAlign = vaBottom
        end
        object lbPercdespM1: TfrxMemoView
          AllowVectorExport = True
          Left = 414.992125980000000000
          Top = 151.181102360000000000
          Width = 58.582677170000000000
          Height = 18.897637800000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'segoe UI'
          Font.Style = []
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            '[VAR_DESP_M1]')
          ParentFont = False
          VAlign = vaBottom
        end
        object lbPercdespA1: TfrxMemoView
          AllowVectorExport = True
          Left = 414.992125980000000000
          Top = 171.968503940000000000
          Width = 58.582677170000000000
          Height = 18.897637800000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'segoe UI'
          Font.Style = []
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            '[VAR_DESP_A1]')
          ParentFont = False
          VAlign = vaBottom
        end
        object Picture3: TfrxPictureView
          AllowVectorExport = True
          Left = 482.779840000000000000
          Top = 105.826771650000000000
          Width = 230.551181100000000000
          Height = 90.708720000000000000
          Frame.Typ = []
          Picture.Data = {
            0A544A504547496D616765BB100000FFD8FFE000104A46494600010101012C01
            2C0000FFE202644943435F50524F46494C45000101000002546C636D73043000
            006D6E74725247422058595A2007E9000A000A00140009002E616373704D5346
            540000000000000000000000000000000000000000000000000000F6D6000100
            000000D32D6C636D730000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000B64657363000001
            080000003E63707274000001480000004C777470740000019400000014636861
            64000001A80000002C7258595A000001D4000000146258595A000001E8000000
            146758595A000001FC0000001472545243000002100000002067545243000002
            10000000206254524300000210000000206368726D00000230000000246D6C75
            6300000000000000010000000C656E5553000000220000001C00730052004700
            42002000490045004300360031003900360036002D0032002E003100006D6C75
            6300000000000000010000000C656E5553000000300000001C004E006F002000
            63006F0070007900720069006700680074002C00200075007300650020006600
            7200650065006C007958595A20000000000000F6D6000100000000D32D736633
            320000000000010C42000005DEFFFFF325000007930000FD90FFFFFBA1FFFFFD
            A2000003DC0000C06E58595A200000000000006FA0000038F50000039058595A
            20000000000000249F00000F840000B6C358595A2000000000000062970000B7
            87000018D9706172610000000000030000000266660000F2A700000D59000013
            D000000A5B6368726D00000000000300000000A3D70000547B00004CCD000099
            9A0000266600000F5CFFDB004300010101010101010101010101010101010101
            0101010101010101010101010101010101010101010101010101010101010101
            0101010101010101010101010101FFDB00430101010101010101010101010101
            0101010101010101010101010101010101010101010101010101010101010101
            01010101010101010101010101010101010101FFC0001108005D00F003011100
            021101031101FFC400180001010101010000000000000000000000000908070A
            FFC4002E1000010202050D010003000000000000000005060708020304099601
            18191A395457597898D5D6D8B70A1213FFC4001A010100020301000000000000
            000000000000050703060908FFC4002E1100010105030D010101010000000000
            0000050102030406079496081516171854555657D2D3D4D511121441FFDA000C
            03010002110311003F008B92F92F9029C702A0F2FAFC1E86AB4B8B50D598AAB0
            B0AACC40B7A9AA29DBD02C16AB6A8285B6D560ADB45AED96BB456D657DA2D15F
            594EB6BAB69D2ACACA54A952CB94A5161615612AA94284A53D0E1C39E9A721C3
            726A33AE38E3B19F75D75D75D7D8C75D758C6318C633F18C38A36C36C36AC936
            AD68E969768F5B27A6A7D6D52C9C84849D4AAF2F2927292EAF370A5E5A5A5E14
            DBB0A0C08309D761C2850DD75C71C758EBAC6318C61D83362973E05C26C02D9F
            1A4767B59E2AA17B8FDE571AF1B65EA9D7F8AD6BDC19B14B9F02E136016CF8D1
            9ED678AA85EE3F78D78DB2F54EBFC56B5EE0CD8A5CF81709B00B67C68CF6B3C5
            542F71FBC6BC6D97AA75FE2B5AF7066C52E7C0B84D805B3E3467B59E2AA17B8F
            DE35E36CBD53AFF15AD7B83362973E05C26C02D9F1A33DACF1550BDC7EF1AF1B
            65EA9D7F8AD6BDC19B14B9F02E136016CF8D19ED678AA85EE3F78D78DB2F54EB
            FC56B5EE0CD8A5CF81709B00B67C68CF6B3C5542F71FBC6BC6D97AA75FE2B5AF
            7066C52E7C0B84D805B3E3467B59E2AA17B8FDE35E36CBD53AFF0015AD7B8336
            2973E05C26C02D9F1A33DACF1550BDC7EF1AF1B65EA9D7F8AD6BDC19B14B9F02
            E136016CF8D19ED678AA85EE3F78D78DB2F54EBFC56B5EE0CD8A5CF81709B00B
            67C68CF6B3C5542F71FBC6BC6D97AA75FE2B5AF7066C52E7C0B84D805B3E3467
            B59E2AA17B8FDE35E36CBD53AFF15AD7B83362973E05C26C02D9F1A33DACF155
            0BDC7EF1AF1B65EA9D7F8AD6BDC19B14B9F02E136016CF8D19ED678AA85EE3F7
            8D78DB2F54EBFC56B5EE0CD8A5CF81709B00B67C68CF6B3C5542F71FBC6BC6D9
            7AA75FE2B5AF7066C52E7C0B84D805B3E3467B59E2AA17B8FDE35E36CBD53AFF
            0015AD7B83362973E05C26C02D9F1A33DACF1550BDC7EF1AF1B65EA9D7F8AD6B
            DC19B14B9F02E136016CF8D19ED678AA85EE3F78D78DB2F54EBFC56B5EE0CD8A
            5CF81709B00B67C68CF6B3C5542F71FBC6BC6D97AA75FE2B5AF7066C52E7C0B8
            4D805B3E3467B59E2AA17B8FDE35E36CBD53AFF15AD7B83362973E05C26C02D9
            F1A33DACF1550BDC7EF1AF1B65EA9D7F8AD6BDC19B14B9F02E136016CF8D19ED
            678AA85EE3F78D78DB2F54EBFC56B5EE0CD8A5CF81709B00B67C68CF6B3C5542
            F71FBC6BC6D97AA75FE2B5AF7066C52E7C0B84D805B3E3467B59E2AA17B8FDE3
            5E36CBD53AFF0015AD7B83362973E05C26C02D9F1A33DACF1550BDC7EF1AF1B6
            5EA9D7F8AD6BDC19B14B9F02E136016CF8D19ED678AA85EE3F78D78DB2F54EBF
            C56B5EE0CD8A5CF81709B00B67C68CF6B3C5542F71FBC6BC6D97AA75FE2B5AF7
            066C52E7C0B84D805B3E3467B59E2AA17B8FDE35E36CBD53AFF15AD7B871F983
            97C814DC8151857D020F435455C4586AF35547584A66205814D2D4EC0816FB55
            89413EDB65B0555A2C96CB25A2AAAEBECF68A8ACA15B535B428D655D2A34A8E4
            CA48A3AC2AC5554D85154A7A243893D2AE4486FCD4679C7DC7A338EBCEBCEBCF
            B58F3AF31AD6358D67E35858F63D6C36ACAD6AD67096A968F5B2826A856D4D49
            CFC84E54AAF3129392930AF290A625A665E2CDBD0A3408D09E7A1C58511D79C7
            DC79AEBCC6B1AD61EC62EC6B9964FA2E5DCF22F149D76A8BB45CF11253A023D1
            C14529EA95634CA2B0E4866DC5651C960B256B56D35966B1E4B55AAB7259EA29
            DA2BE9D5557F5A14AB6B32E4CB4B2D951E9643998D1662349BCFC68F11F8B15E
            FF004CD3BFD4488F35E7DBFCBB198EB3F5E6B5BF8EB18C67FC67E1D285EC962C
            42A65B56A896693999A565C519C55529976A3A965DD8F3D3F1DF999A8CC812EA
            D0A0416448D11F7990E0C38709C637F971C75D63186E5D04523FBE46CC7C8FE9
            C62D0FA7F727AF537E722763CC9FB92E6B14D57F64682291FDF23663E47F4E1A
            1F4FEE4F5EA6FCE363CC9FB92E6B14D57F64682291FDF23663E47F4E1A1F4FEE
            4F5EA6FCE363CC9FB92E6B14D57F64682291FDF23663E47F4E1A1F4FEE4F5EA6
            FCE363CC9FB92E6B14D57F64682291FDF23663E47F4E1A1F4FEE4F5EA6FCE363
            CC9FB92E6B14D57F64682291FDF23663E47F4E1A1F4FEE4F5EA6FCE363CC9FB9
            2E6B14D57F64682291FDF23663E47F4E1A1F4FEE4F5EA6FCE363CC9FB92E6B14
            D57F64682291FDF23663E47F4E1A1F4FEE4F5EA6FCE363CC9FB92E6B14D57F64
            682291FDF23663E47F4E1A1F4FEE4F5EA6FCE363CC9FB92E6B14D57F64682291
            FDF23663E47F4E1A1F4FEE4F5EA6FCE363CC9FB92E6B14D57F64682291FDF236
            63E47F4E1A1F4FEE4F5EA6FCE363CC9FB92E6B14D57F64682291FDF23663E47F
            4E1A1F4FEE4F5EA6FCE363CC9FB92E6B14D57F64682291FDF23663E47F4E1A1F
            4FEE4F5EA6FCE363CC9FB92E6B14D57F64682291FDF23663E47F4E1A1F4FEE4F
            5EA6FCE363CC9FB92E6B14D57F64682291FDF23663E47F4E1A1F4FEE4F5EA6FC
            E363CC9FB92E6B14D57F64682291FDF23663E47F4E1A1F4FEE4F5EA6FCE363CC
            9FB92E6B14D57F64682291FDF23663E47F4E1A1F4FEE4F5EA6FCE363CC9FB92E
            6B14D57F64682291FDF23663E47F4E1A1F4FEE4F5EA6FCE363CC9FB92E6B14D5
            7F64682291FDF23663E47F4E1A1F4FEE4F5EA6FCE363CC9FB92E6B14D57F6468
            2291FDF23663E47F4E1A1F4FEE4F5EA6FCE363CC9FB92E6B14D57F64682291FD
            F23663E47F4E1A1F4FEE4F5EA6FCE363CC9FB92E6B14D57F64682291FDF23663
            E47F4E1A1F4FEE4F5EA6FCE363CC9FB92E6B14D57F64682291FDF23663E47F4E
            1A1F4FEE4F5EA6FCE363CC9FB92E6B14D57F64682291FDF23663E47F4E1A1F4F
            EE4F5EA6FCE363CC9FB92E6B14D57F64682291FDF23663E47F4E1A1F4FEE4F5E
            A6FCE363CC9FB92E6B14D57F64682291FDF23663E47F4E1A1F4FEE4F5EA6FCE3
            63CC9FB92E6B14D57F64682291FDF23663E47F4E1A1F4FEE4F5EA6FCE363CC9F
            B92E6B14D57F64682291FDF23663E47F4E1A1F4FEE4F5EA6FCE363CC9FB92E6B
            14D57F64C3579CDCCB27D08EEE79E88A4D4B545DA4E787729D1EDE8DFA2AAF54
            AB62652586DC3371AB2764B7D92A9AB66ACB4D8F2DAACB5592D15142D1514EB6
            ABFB50A35B57972E4A5932C0A590E5A342988326F391A044722C27BFD334F7F3
            121BCC79C6FF002F466BADFC798C6FE3CC6B1BFF0059F84B20E4B16214CADA4D
            448D49CCCAAB21A8C9AAA6CCBD51D4B30EC09E908EE4CCAC66C098568B023321
            C686E3CD871A1C484FB19FCBEE3CEB5AC2B1DCEFB282EDCE886593F20699B09E
            8629000000000000000000000000000000000000000000000000000000000000
            00009BF7C4ECA0BC8FA2199BFC81D800B9DF6505DB9D10CB27E40D300A400000
            000000000000000000000000000000000000000000000000000000000026FDF1
            3B282F23E88666FF002076002E77D94176E74432C9F9034C0290000000000000
            0000000000000000000000000000000000000000000000000009BF7C4ECA0BC8
            FA2199BFC81D800B9DF6505DB9D10CB27E40D300A40000000000000000000000
            0000000000000000000000000000000000000000026FDF13B282F23E88666FF2
            076002E77D94176E74432C9F9034C02900000000000000000000000000000000
            000000000000000000000000000000009BF7C4ECA0BC8FA2199BFC81D800B9DF
            6505DB9D10CB27E40D300A400000000000000000000000000000000000000000
            000000000000000000000026FDF13B282F23E88666FF002076002E77D94176E7
            4432C9F9034C0290000000000000000000000000000000000000000000000000
            0000000000000009BF7C4ECA0BC8FA2199BFC81D800B9DF6505DB9D10CB27E40
            D300A40000000000000000000000000000000000000000000000000000000000
            0000026FDF13B282F23E88666FF2076002E77D94176E74432C9F9034C0290000
            0000000000000000000000000000000000000000000000000000000000009BF7
            C4ECA0BC8FA2199BFC81D801E206547F983B9A506592004AA59E40D09FD67970
            83F0F608D4BE2BA65541B55CEFAA864D74D67D07256B76AE062ED043AC59A291
            91429A4D05A56A360A55F96CD9146D992AFF00DE981A035E4DD9CB55BBDD8A97
            CEC00D7937672D56EF762A5F3B0035E4DD9CB55BBDD8A97CEC00D7937672D56E
            F762A5F3B0035E4DD9CB55BBDD8A97CEC00D7937672D56EF762A5F3B0035E4DD
            9CB55BBDD8A97CEC00D7937672D56EF762A5F3B0035E4DD9CB55BBDD8A97CEC0
            0D7937672D56EF762A5F3B0035E4DD9CB55BBDD8A97CEC00D7937672D56EF762
            A5F3B0035E4DD9CB55BBDD8A97CEC00D7937672D56EF762A5F3B0035E4DD9CB5
            5BBDD8A97CEC00D7937672D56EF762A5F3B0035E4DD9CB55BBDD8A97CEC00D79
            37672D56EF762A5F3B0035E4DD9CB55BBDD8A97CEC00D7937672D56EF762A5F3
            B0035E4DD9CB55BBDD8A97CEC00D7937672D56EF762A5F3B0035E4DD9CB55BBD
            D8A97CEC00D7937672D56EF762A5F3B0035E4DD9CB55BBDD8A97CEC00D793767
            2D56EF762A5F3B0035E4DD9CB55BBDD8A97CEC00D7937672D56EF762A5F3B006
            7F9AEFE60EE69BE9648FF2A9689034260D9E63E0FC428235CF8A99955072D734
            2AA26B5D499F4DC954DDAC818854172B11A8ABE550A0934D69268DBE95464B36
            551B1E4ACFF7A007FFD9}
          HightQuality = False
          Transparent = True
          TransparentColor = clWhite
        end
        object Memo83: TfrxMemoView
          AllowVectorExport = True
          Left = 488.000302680000000000
          Top = 114.606438350000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 2960685
          Font.Height = -13
          Font.Name = 'segoe UI'
          Font.Style = [fsBold]
          Frame.Typ = []
          Frame.Width = 0.500000000000000000
          Memo.UTF8W = (
            'Resultado')
          ParentFont = False
        end
        object lbResMes: TfrxMemoView
          AllowVectorExport = True
          Left = 488.000302680000000000
          Top = 130.283618350000000000
          Width = 177.637795280000000000
          Height = 18.897637800000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 5723991
          Font.Height = -15
          Font.Name = 'segoe UI'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            '[RES_MES_ATUAL]')
          ParentFont = False
        end
        object Memo85: TfrxMemoView
          AllowVectorExport = True
          Left = 488.000302680000000000
          Top = 151.181102360000000000
          Width = 32.125984251968500000
          Height = 18.897637800000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'segoe UI'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'M-1')
          ParentFont = False
          VAlign = vaBottom
        end
        object Memo86: TfrxMemoView
          AllowVectorExport = True
          Left = 488.000302680000000000
          Top = 171.968503940000000000
          Width = 32.125984251968500000
          Height = 18.897637800000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'segoe UI'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'A-1')
          ParentFont = False
          VAlign = vaBottom
        end
        object lbResM1: TfrxMemoView
          AllowVectorExport = True
          Left = 513.149584330000000000
          Top = 151.181102360000000000
          Width = 86.929133860000000000
          Height = 18.897637800000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'segoe UI'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[RES_M1]')
          ParentFont = False
          VAlign = vaBottom
        end
        object lbResA1: TfrxMemoView
          AllowVectorExport = True
          Left = 513.149584330000000000
          Top = 171.968503940000000000
          Width = 86.929133860000000000
          Height = 18.897637800000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'segoe UI'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[RES_A1]')
          ParentFont = False
          VAlign = vaBottom
        end
        object lbPercResM1: TfrxMemoView
          AllowVectorExport = True
          Left = 651.858597240000000000
          Top = 151.181102360000000000
          Width = 58.582677170000000000
          Height = 18.897637800000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'segoe UI'
          Font.Style = []
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            '[VAR_RES_M1]')
          ParentFont = False
          VAlign = vaBottom
        end
        object lbPercResA1: TfrxMemoView
          AllowVectorExport = True
          Left = 651.858597240000000000
          Top = 171.968503940000000000
          Width = 58.582677170000000000
          Height = 18.897637800000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'segoe UI'
          Font.Style = []
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            '[VAR_RES_A1]')
          ParentFont = False
          VAlign = vaBottom
        end
        object Rich1: TfrxRichView
          AllowVectorExport = True
          Left = 26.456710000000000000
          Top = 68.031540000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          Frame.Typ = []
          GapX = 2.000000000000000000
          GapY = 1.000000000000000000
          RichEdit = {
            7B5C727466315C616E73695C616E7369637067313235325C64656666305C6E6F
            7569636F6D7061745C6465666C616E67313033337B5C666F6E7474626C7B5C66
            305C666E696C5C666368617273657430205365676F652055493B7D7D0D0A7B5C
            2A5C67656E657261746F722052696368656432302031302E302E31393034317D
            5C766965776B696E64345C756331200D0A5C706172645C66305C667331385C70
            61720D0A7D0D0A00}
        end
        object Memo23: TfrxMemoView
          AllowVectorExport = True
          Left = 612.283860000000000000
          Top = 52.913385830000000000
          Width = 37.795278030000000000
          Height = 18.897637800000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'segoe UI'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'M-1 =')
          ParentFont = False
          VAlign = vaBottom
        end
        object Memo24: TfrxMemoView
          AllowVectorExport = True
          Left = 612.283860000000000000
          Top = 73.700821580000000000
          Width = 37.795278030000000000
          Height = 18.897637800000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'segoe UI'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'A-1 =')
          ParentFont = False
          VAlign = vaBottom
        end
        object Memo25: TfrxMemoView
          AllowVectorExport = True
          Left = 650.079160000000000000
          Top = 52.913385830000000000
          Width = 64.251988030000000000
          Height = 18.897637800000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'segoe UI'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[NOME_MES_ANTERIOR]')
          ParentFont = False
          VAlign = vaBottom
        end
        object Memo26: TfrxMemoView
          AllowVectorExport = True
          Left = 650.079160000000000000
          Top = 73.700821580000000000
          Width = 64.251988030000000000
          Height = 18.897637800000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'segoe UI'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[NOME_ANO_ANTERIOR]')
          ParentFont = False
          VAlign = vaBottom
        end
      end
      object Header1: TfrxHeader
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 23.236232680000000000
        Top = 279.685220000000000000
        Width = 718.110700000000000000
        object Memo9: TfrxMemoView
          AllowVectorExport = True
          Left = 319.039450630000000000
          Top = 11.897650000000000000
          Width = 71.811070000000000000
          Height = 11.338582680000000000
          DataSet = dtProjecoesRD
          DataSetName = 'dtProjecoesRD'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Fill.BackColor = 13948116
          HAlign = haCenter
          Memo.UTF8W = (
            'Total')
          ParentFont = False
        end
        object Memo5: TfrxMemoView
          AllowVectorExport = True
          Left = 391.984332520000000000
          Top = 11.897650000000000000
          Width = 30.236220470000000000
          Height = 11.338582680000000000
          DataSet = dtProjecoesRD
          DataSetName = 'dtProjecoesRD'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftRight, ftTop, ftBottom]
          Fill.BackColor = 13948116
          HAlign = haCenter
          Memo.UTF8W = (
            '% Fat')
          ParentFont = False
        end
        object Memo7: TfrxMemoView
          AllowVectorExport = True
          Left = 423.307360000000000000
          Top = 11.897650000000000000
          Width = 71.811070000000000000
          Height = 11.338582680000000000
          DataSet = dtProjecoesRD
          DataSetName = 'dtProjecoesRD'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftRight, ftTop, ftBottom]
          Fill.BackColor = 13948116
          HAlign = haCenter
          Memo.UTF8W = (
            'Total')
          ParentFont = False
        end
        object Memo8: TfrxMemoView
          AllowVectorExport = True
          Left = 496.252241890000000000
          Top = 11.897650000000000000
          Width = 30.236220470000000000
          Height = 11.338582680000000000
          DataSet = dtProjecoesRD
          DataSetName = 'dtProjecoesRD'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftRight, ftTop, ftBottom]
          Fill.BackColor = 13948116
          HAlign = haCenter
          Memo.UTF8W = (
            '% Fat.')
          ParentFont = False
        end
        object Memo1: TfrxMemoView
          AllowVectorExport = True
          Left = 525.354670000000000000
          Top = 11.897650000000000000
          Width = 45.354335590000000000
          Height = 11.338582680000000000
          DataSet = dtProjecoesRD
          DataSetName = 'dtProjecoesRD'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Fill.BackColor = 13948116
          HAlign = haCenter
          Memo.UTF8W = (
            'Varia'#231#227'o')
          ParentFont = False
        end
        object Memo12: TfrxMemoView
          AllowVectorExport = True
          Left = 570.709030000000000000
          Top = 11.897650000000000000
          Width = 71.811070000000000000
          Height = 11.338582680000000000
          DataSet = dtProjecoesRD
          DataSetName = 'dtProjecoesRD'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftRight, ftTop, ftBottom]
          Fill.BackColor = 13948116
          HAlign = haCenter
          Memo.UTF8W = (
            'Total')
          ParentFont = False
        end
        object Memo15: TfrxMemoView
          AllowVectorExport = True
          Left = 643.653911890000000000
          Top = 11.897650000000000000
          Width = 30.236220470000000000
          Height = 11.338582680000000000
          DataSet = dtProjecoesRD
          DataSetName = 'dtProjecoesRD'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftRight, ftTop, ftBottom]
          Fill.BackColor = 13948116
          HAlign = haCenter
          Memo.UTF8W = (
            '% Fat.')
          ParentFont = False
        end
        object Memo16: TfrxMemoView
          AllowVectorExport = True
          Left = 672.756340000000000000
          Top = 11.897650000000000000
          Width = 45.354335590000000000
          Height = 11.338582680000000000
          DataSet = dtProjecoesRD
          DataSetName = 'dtProjecoesRD'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Fill.BackColor = 13948116
          HAlign = haCenter
          Memo.UTF8W = (
            'Varia'#231#227'o')
          ParentFont = False
        end
        object Memo20: TfrxMemoView
          AllowVectorExport = True
          Left = 318.992226060000000000
          Top = 0.692913390000000000
          Width = 105.826840000000000000
          Height = 11.338582680000000000
          DataSet = dtProjecoesRD
          DataSetName = 'dtProjecoesRD'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Fill.BackColor = 13948116
          HAlign = haCenter
          Memo.UTF8W = (
            '[NOME_MES_ATUAL]')
          ParentFont = False
        end
        object Memo21: TfrxMemoView
          AllowVectorExport = True
          Left = 423.307360000000000000
          Top = 0.692913390000000000
          Width = 147.401670000000000000
          Height = 11.338582680000000000
          DataSet = dtProjecoesRD
          DataSetName = 'dtProjecoesRD'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Fill.BackColor = 13948116
          HAlign = haCenter
          Memo.UTF8W = (
            '[NOME_MES_ANTERIOR]')
          ParentFont = False
        end
        object Memo22: TfrxMemoView
          AllowVectorExport = True
          Left = 570.709030000000000000
          Top = 0.692913390000000000
          Width = 147.401670000000000000
          Height = 11.338582680000000000
          DataSet = dtProjecoesRD
          DataSetName = 'dtProjecoesRD'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Fill.BackColor = 13948116
          HAlign = haCenter
          Memo.UTF8W = (
            '[NOME_ANO_ANTERIOR]')
          ParentFont = False
        end
        object Memo72: TfrxMemoView
          AllowVectorExport = True
          Top = 0.755905510000000000
          Width = 317.480520000000000000
          Height = 22.677167800000000000
          DataSet = dtProjecoesRD
          DataSetName = 'dtProjecoesRD'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Fill.BackColor = 13948116
          HAlign = haCenter
          Memo.UTF8W = (
            'Conta gerencial')
          ParentFont = False
          VAlign = vaCenter
        end
      end
    end
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
    PrecommittedReads = False
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
      
        ' select * from R_PRODUTOS_VENDIDOS_CST_PIS('#39'01.06.2020'#39','#39'30.06.2' +
        '020'#39');')
    PrecommittedReads = False
    Left = 480
    Top = 240
  end
  object dtProdutosVendidosPisCofins: TfrxDBDataset
    UserName = 'DTProdutosVendidosCSTPIS'
    CloseDataSource = False
    FieldAliases.Strings = (
      'COD_PRODUTO=COD_PRODUTO'
      'DESCRICAO=DESCRICAO'
      'CST_PIS_COFINS=CST_PIS_COFINS'
      'DESCRICAOCST=DESCRICAOCST'
      'QUANTIDADE=QUANTIDADE'
      'PRECO_MEDI=PRECO_MEDI'
      'SUBTOTAL=SUBTOTAL'
      'DESCONTO=DESCONTO'
      'TOTAL=TOTAL'
      'VALOR_PIS=VALOR_PIS'
      'VALOR_COFINS=VALOR_COFINS')
    DataSet = qryProdutosVendidosCSTPis
    BCDToCurrency = False
    DataSetOptions = []
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
    PrecommittedReads = False
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
    PrecommittedReads = False
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
    DataSetOptions = []
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
    DataSetOptions = []
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
    PrecommittedReads = False
    Left = 432
    Top = 496
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
    DataSetOptions = []
    Left = 424
    Top = 552
  end
  object frxDOCXExport1: TfrxDOCXExport
    UseFileCache = True
    ShowProgress = True
    OverwritePrompt = False
    DataOnly = False
    OpenAfterExport = False
    PictureType = gpPNG
    ExportType = dxTable
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
    DataSet = qryRelFaturamento
    BCDToCurrency = False
    DataSetOptions = []
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
      'select * from ('
      
        ' select  pm.cod_produto,ip.cod_barras,ip.cod_g_raiz,ip.desc_g_ra' +
        'iz, ip.cod_g_pai, ip.desc_g_pai, ip.cod_grupo, ip.desc_grupo,'
      ' pm.descricao, pm.total, pm.percentualproduto,'
      
        #39'BRASIL A GRANEL 01/06/20 at'#233' 30/06/20 00:00:00 '#224's 23:59:59'#39' AS ' +
        'MES,1 as ordem'
      '            from produtosvendidoscommargemF( '
      #39'01.06.2020'#39
      ','#39'30.06.2020'#39
      ','#39#39
      ','#39'0001'#39
      ','#39'00:00:00'#39
      ','#39'23:59:59'#39
      '      ) pm '
      
        '            inner join r_informacoes_produto ip on (ip.cod_produ' +
        'to = pm.cod_produto) '
      '       )    order by cod_g_raiz, cod_g_pai, cod_grupo,ordem '
      '')
    PrecommittedReads = False
    Left = 1121
    Top = 328
  end
  object dscdsRelProdutosVendidosTemp: TDataSource
    DataSet = cdsRelProdutosVendidosTemp
    Left = 1184
    Top = 128
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
    DataSetOptions = []
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
    PrecommittedReads = False
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
    DataSetOptions = []
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
    DataSetOptions = []
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
    PrecommittedReads = False
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
    DataSetOptions = []
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
    PrecommittedReads = False
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
    DataSetOptions = []
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
    DataSetOptions = []
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
    PrecommittedReads = False
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
    DataSetOptions = []
    Left = 864
    Top = 312
  end
  object qryRelParametrosFiscais: TIBQuery
    Database = dm.dbrestaurante
    Transaction = dm.transacao
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      'select p.cod_produto, p.descricao, p.cfop_saida,'
      '    case p.cfop_saida'
      '      when '#39'5102'#39' then '#39'102'#39
      '      when '#39'5405'#39' then '#39'500'#39
      '    end as CSOSN,'
      '    p.cst_saida,p.ncm,p.cest,'
      
        '    al.descricao as AlIQ_ICMS, p.reducao_base_icms , p.cst_pis_c' +
        'ofins, p.aliq_pis, P.aliq_cofins,'
      '   g.descricao as desc_grupo,p.cod_grupo'
      '    from produtos p'
      '   inner join grupos g on (g.cod_grupo = p.cod_grupo)'
      '   inner join aliquotas al on (al.cod_aliquota = p.cod_aliquota)'
      '     where p.vende=1'
      ''
      'order by g.cod_grupo ')
    PrecommittedReads = False
    Left = 1190
    Top = 19
    object qryRelParametrosFiscaisCOD_PRODUTO: TIBStringField
      FieldName = 'COD_PRODUTO'
      Origin = '"PRODUTOS"."COD_PRODUTO"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 5
    end
    object qryRelParametrosFiscaisDESCRICAO: TIBStringField
      FieldName = 'DESCRICAO'
      Origin = '"PRODUTOS"."DESCRICAO"'
      Required = True
      Size = 80
    end
    object qryRelParametrosFiscaisCFOP_SAIDA: TIBStringField
      FieldName = 'CFOP_SAIDA'
      Origin = '"PRODUTOS"."CFOP_SAIDA"'
      Size = 4
    end
    object qryRelParametrosFiscaisCSOSN: TIBStringField
      FieldName = 'CSOSN'
      ProviderFlags = []
      FixedChar = True
      Size = 3
    end
    object qryRelParametrosFiscaisCST_SAIDA: TIBStringField
      FieldName = 'CST_SAIDA'
      Origin = '"PRODUTOS"."CST_SAIDA"'
      Size = 3
    end
    object qryRelParametrosFiscaisNCM: TIBStringField
      FieldName = 'NCM'
      Origin = '"PRODUTOS"."NCM"'
      Size = 12
    end
    object qryRelParametrosFiscaisCEST: TIBStringField
      FieldName = 'CEST'
      Origin = '"PRODUTOS"."CEST"'
      Size = 15
    end
    object qryRelParametrosFiscaisALIQ_ICMS: TIBStringField
      FieldName = 'ALIQ_ICMS'
      Origin = '"ALIQUOTAS"."DESCRICAO"'
      Required = True
      Size = 10
    end
    object qryRelParametrosFiscaisDESC_GRUPO: TIBStringField
      FieldName = 'DESC_GRUPO'
      Origin = '"GRUPOS"."DESCRICAO"'
      Size = 30
    end
    object qryRelParametrosFiscaisCOD_GRUPO: TIBStringField
      FieldName = 'COD_GRUPO'
      Origin = '"PRODUTOS"."COD_GRUPO"'
      Size = 6
    end
    object qryRelParametrosFiscaisREDUCAO_BASE_ICMS: TFMTBCDField
      FieldName = 'REDUCAO_BASE_ICMS'
      Origin = '"PRODUTOS"."REDUCAO_BASE_ICMS"'
      Precision = 18
    end
    object qryRelParametrosFiscaisCST_PIS_COFINS: TIBStringField
      FieldName = 'CST_PIS_COFINS'
      Origin = '"PRODUTOS"."CST_PIS_COFINS"'
      Size = 2
    end
    object qryRelParametrosFiscaisALIQ_PIS: TIBBCDField
      FieldName = 'ALIQ_PIS'
      Origin = '"PRODUTOS"."ALIQ_PIS"'
      Precision = 18
      Size = 2
    end
    object qryRelParametrosFiscaisALIQ_COFINS: TIBBCDField
      FieldName = 'ALIQ_COFINS'
      Origin = '"PRODUTOS"."ALIQ_COFINS"'
      Precision = 18
      Size = 2
    end
  end
  object dtRelParametrosFiscais: TfrxDBDataset
    UserName = 'dtRelParametrosFiscais'
    CloseDataSource = False
    FieldAliases.Strings = (
      'COD_PRODUTO=COD_PRODUTO'
      'DESCRICAO=DESCRICAO'
      'CFOP_SAIDA=CFOP_SAIDA'
      'CSOSN=CSOSN'
      'CST_SAIDA=CST_SAIDA'
      'NCM=NCM'
      'CEST=CEST'
      'ALIQ_ICMS=ALIQ_ICMS'
      'DESC_GRUPO=DESC_GRUPO'
      'COD_GRUPO=COD_GRUPO'
      'REDUCAO_BASE_ICMS=REDUCAO_BASE_ICMS'
      'CST_PIS_COFINS=CST_PIS_COFINS'
      'ALIQ_PIS=ALIQ_PIS'
      'ALIQ_COFINS=ALIQ_COFINS')
    DataSet = qryRelParametrosFiscais
    BCDToCurrency = False
    DataSetOptions = []
    Left = 1186
    Top = 75
  end
  object qryResumoMotoboys: TIBQuery
    Database = dm.dbrestaurante
    Transaction = dm.transacao
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      ''
      '  select * from  resumo_motoboys('#39'28.11.2024'#39','#39'28.11.2024'#39')  RS'
      
        '    order by rs.codentregador, rs.ordem, rs.valorcomissao, rs.or' +
        'demdia')
    PrecommittedReads = False
    Left = 533
    Top = 692
  end
  object dtResumoMotoboys: TfrxDBDataset
    UserName = 'dtResumoMotoboys'
    CloseDataSource = False
    FieldAliases.Strings = (
      'TIPOPAGAMENTO=TIPOPAGAMENTO'
      'ORDEM=ORDEM'
      'CODENTREGADOR=CODENTREGADOR'
      'NOMEENTREGADOR=NOMEENTREGADOR'
      'ORDEMDIA=ORDEMDIA'
      'DIASEMANA=DIASEMANA'
      'TXENTREGA=TXENTREGA'
      'VALORCOMISSAO=VALORCOMISSAO'
      'QUANTIDADE=QUANTIDADE'
      'TOTALENTREGAS=TOTALENTREGAS'
      'TOTALPAGAR=TOTALPAGAR'
      'QTD_ALMOCO=QTD_ALMOCO'
      'TOTAL_ALMOCO=TOTAL_ALMOCO')
    DataSet = qryResumoMotoboys
    BCDToCurrency = False
    DataSetOptions = []
    Left = 643
    Top = 691
  end
  object qryRelSangrias: TIBQuery
    Database = dm.dbrestaurante
    Transaction = dm.transacao
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      ''
      
        '  select s.codigo, s.data, s.valor, s.nome_usuario_autorizou, s.' +
        'cod_caixa,'
      
        '         s.cod_usuario, s.codigo_tipo,tp.descricao,s.obs  from s' +
        'angrias s'
      '    inner join tipos_sangria tp on (tp.codigo = s.codigo_tipo)'
      '      where s.data between '#39'01.11.2019'#39' and '#39'30.11.2019'#39
      '       order by s.codigo_tipo ')
    PrecommittedReads = False
    Left = 821
    Top = 614
  end
  object dtRelSangrias: TfrxDBDataset
    UserName = 'dtRelSangrias'
    CloseDataSource = False
    FieldAliases.Strings = (
      'CODIGO=CODIGO'
      'DATA=DATA'
      'VALOR=VALOR'
      'NOME_USUARIO_AUTORIZOU=NOME_USUARIO_AUTORIZOU'
      'COD_USUARIO=COD_USUARIO'
      'DESCRICAO=DESCRICAO'
      'OBS=OBS'
      'COD_CAIXA=COD_CAIXA')
    DataSet = qryRelSangrias
    BCDToCurrency = False
    DataSetOptions = []
    Left = 885
    Top = 613
  end
  object qryRelDetalhesVenda: TIBQuery
    Database = dm.dbrestaurante
    Transaction = dm.transacao
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      
        ' select v.cod_venda as CodigoVenda, v.cod_empresa as CodEmpresa,' +
        'v.data as dataSistema, v.data_so, v.mesa, v.hora,v.numero_nfce,'
      '        v.valor_bruto, v.valor_txserv, v.valor_tx_entrega,'
      
        '        v.valor_desconto,v.valor_total, v.cod_caixa, c.nome_usua' +
        'rio, v.numero_caixa,'
      '        v.serie_nfce'
      '    from vendas v'
      '      inner join caixas c on (c.codigo = v.cod_caixa)'
      ' where v.cod_venda=:ACodVenda'
      '  and v.cod_empresa=:ACodEmpresa')
    PrecommittedReads = False
    Left = 1380
    Top = 108
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'ACodVenda'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ACodEmpresa'
        ParamType = ptUnknown
      end>
  end
  object dqryRelDetalhesVenda: TfrxDBDataset
    UserName = 'dqryRelDetalhesVenda'
    CloseDataSource = False
    FieldAliases.Strings = (
      'CODIGOVENDA=CODIGOVENDA'
      'DATASISTEMA=DATASISTEMA'
      'DATA_SO=DATA_SO'
      'MESA=MESA'
      'HORA=HORA'
      'NUMERO_NFCE=NUMERO_NFCE'
      'VALOR_BRUTO=VALOR_BRUTO'
      'VALOR_TXSERV=VALOR_TXSERV'
      'VALOR_TX_ENTREGA=VALOR_TX_ENTREGA'
      'VALOR_DESCONTO=VALOR_DESCONTO'
      'VALOR_TOTAL=VALOR_TOTAL'
      'COD_CAIXA=COD_CAIXA'
      'NOME_USUARIO=NOME_USUARIO'
      'NUMERO_CAIXA=NUMERO_CAIXA'
      'SERIE_NFCE=SERIE_NFCE')
    DataSet = qryRelDetalhesVenda
    BCDToCurrency = False
    DataSetOptions = []
    Left = 1381
    Top = 150
  end
  object dsQryRelDetalhesVenda: TDataSource
    DataSet = qryRelDetalhesVenda
    Left = 1496
    Top = 103
  end
  object qryRelProdutosDetalhes: TIBQuery
    Database = dm.dbrestaurante
    Transaction = dm.transacao
    BufferChunks = 1000
    CachedUpdates = False
    DataSource = dsQryRelDetalhesVenda
    ParamCheck = True
    SQL.Strings = (
      ''
      
        '  select mv.cod_venda,p.cod_barras , mv.id, mv.hora_lancamento, ' +
        'p.descricao,'
      '         mv.quantidade, mv.valor_unitario,'
      
        '         udf_roundabnt( (mv.quantidade * mv.valor_unitario),3) a' +
        's total,'
      '         mv.cod_garcon, g.apelido as nomeGarcon'
      '    from movimento_venda mv'
      '      inner join produtos p on (p.cod_produto = mv.cod_produto)'
      '      inner join garcons g on (g.cod_garcon = mv.cod_garcon)'
      '        where'
      '             mv.cod_venda=:CodigoVenda'
      '            and mv.cod_empresa=:CodEmpresa'
      ''
      ''
      '')
    PrecommittedReads = False
    Left = 1503
    Top = 152
    ParamData = <
      item
        DataType = ftWideString
        Name = 'CODIGOVENDA'
        ParamType = ptUnknown
        Size = 18
      end
      item
        DataType = ftWideString
        Name = 'CODEMPRESA'
        ParamType = ptUnknown
        Size = 10
      end>
  end
  object dQryProdutosDetalhesVenda: TfrxDBDataset
    UserName = 'dQryProdutosDetalhesVenda'
    CloseDataSource = False
    FieldAliases.Strings = (
      'COD_VENDA=COD_VENDA'
      'COD_BARRAS=COD_BARRAS'
      'ID=ID'
      'HORA_LANCAMENTO=HORA_LANCAMENTO'
      'DESCRICAO=DESCRICAO'
      'QUANTIDADE=QUANTIDADE'
      'VALOR_UNITARIO=VALOR_UNITARIO'
      'TOTAL=TOTAL'
      'COD_GARCON=COD_GARCON'
      'NOMEGARCON=NOMEGARCON')
    DataSet = qryRelProdutosDetalhes
    BCDToCurrency = False
    DataSetOptions = []
    Left = 1384
    Top = 213
  end
  object qryPagamentosDetalheVenda: TIBQuery
    Database = dm.dbrestaurante
    Transaction = dm.transacao
    BufferChunks = 1000
    CachedUpdates = False
    DataSource = dsQryRelDetalhesVenda
    ParamCheck = True
    SQL.Strings = (
      '  select r.cod_venda, upper( fp.descricao)as descricao, r.valor'
      '      from recebimentos r'
      
        '        inner join formas_pagamento fp on (fp.cod_forma = r.cod_' +
        'forma)'
      '      where r.cod_venda=:CodigoVenda'
      '        and r.cod_empresa=:CodEmpresa'
      '')
    PrecommittedReads = False
    Left = 1383
    Top = 264
    ParamData = <
      item
        DataType = ftWideString
        Name = 'CODIGOVENDA'
        ParamType = ptUnknown
        Size = 18
      end
      item
        DataType = ftWideString
        Name = 'CODEMPRESA'
        ParamType = ptUnknown
        Size = 10
      end>
  end
  object frxDBDataset6: TfrxDBDataset
    UserName = 'dtqryPagamentosDetalheVenda'
    CloseDataSource = False
    DataSet = qryPagamentosDetalheVenda
    BCDToCurrency = False
    DataSetOptions = []
    Left = 1426
    Top = 263
  end
  object qryRelFichasTecnicas: TIBQuery
    Database = dm.dbrestaurante
    Transaction = dm.transacao
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      
        ' select * from (                                                ' +
        '                                                          '
      
        '                                                                ' +
        '                                                          '
      
        '    select cod_produto as vpCodigoProduto,  cod_produto, rendime' +
        'nto,unidade, cod_grupo_raiz,desc_grupo_raiz,desdobramento_pai,de' +
        'sdobramento_filho,'
      
        'cod_grupo_pai,desc_grupo_pai, codgrupo, cod_formatado,          ' +
        '                                                          '
      
        '         descricaoGrupo, descricao, valor_unitario,             ' +
        '                                                          '
      
        '          custo, udf_roundabnt( (custo / rendimento),3) as custo' +
        'UnidadeEstoque, (valor_unitario - custo) as margem,  (valor_unit' +
        'ario / custo) as markup,'
      
        '          ((custo * 100) / valor_unitario) as cmv               ' +
        '                                                          '
      
        '     from                                                       ' +
        '                                                          '
      
        '     (                                                          ' +
        '                                                          '
      
        '     select p.cod_produto,p.rendimento,p.unidade_entrada,u.descr' +
        'icao as unidade, p.cod_grupo, trim(g.cod_formatado) as cod_forma' +
        'tado ,'
      
        'g.cod_grupo_raiz, trim(g.desc_grupo_raiz) as desc_grupo_raiz, g.' +
        'cod_grupo_pai, trim(g.desc_grupo_pai)  as desc_grupo_pai  '
      
        '            ,g.cod_grupo as codGrupo, g.desdobramento_pai,      ' +
        '                                                          '
      
        'g.desdobramento_filho, trim(g.descricao) as descricaoGrupo, p.de' +
        'scricao,                                                  '
      
        '       case p.valor_unitario                                    ' +
        '                                                          '
      
        '        when  0 then 1                                          ' +
        '                                                          '
      
        '         else                                                   ' +
        '                                                          '
      
        '           p.valor_unitario                                     ' +
        '                                                          '
      
        '       end as valor_unitario,                                   ' +
        '                                                          '
      
        '        (select sum(custo_baixa) from calcula_custo_produto_novo' +
        '(p.cod_produto,  p.cod_produto, 1) ) as custo             '
      
        '       from  produtos p                                         ' +
        '                                                          '
      '         inner join r_grupos g on (g.cod_grupo  = p.cod_grupo)'
      
        '         inner join unidades u on (u.cod_unidade = p.unidade_ent' +
        'rada)'
      
        '         where  coalesce((select count(*) from composicoes_produ' +
        'to cp where cp.cod_produto = p.cod_produto),0) > 0        '
      
        '                                                                ' +
        '                                                          '
      
        '      )                                                         ' +
        '                                                          '
      
        '                                                                ' +
        '                                                          '
      '     ) '
      '         where codGrupo starting with '#39#39
      
        ' order by cod_grupo_raiz asc , desdobramento_pai asc ,desdobrame' +
        'nto_filho asc , descricao'
      '')
    PrecommittedReads = False
    Left = 1322
    Top = 359
  end
  object DtqryRelFichasTecnicas: TfrxDBDataset
    UserName = 'DtqryRelFichasTecnicas'
    CloseDataSource = False
    FieldAliases.Strings = (
      'VPCODIGOPRODUTO=VPCODIGOPRODUTO'
      'COD_PRODUTO=COD_PRODUTO'
      'RENDIMENTO=RENDIMENTO'
      'UNIDADE=UNIDADE'
      'COD_GRUPO_RAIZ=COD_GRUPO_RAIZ'
      'DESC_GRUPO_RAIZ=DESC_GRUPO_RAIZ'
      'DESDOBRAMENTO_PAI=DESDOBRAMENTO_PAI'
      'DESDOBRAMENTO_FILHO=DESDOBRAMENTO_FILHO'
      'COD_GRUPO_PAI=COD_GRUPO_PAI'
      'DESC_GRUPO_PAI=DESC_GRUPO_PAI'
      'CODGRUPO=CODGRUPO'
      'COD_FORMATADO=COD_FORMATADO'
      'DESCRICAOGRUPO=DESCRICAOGRUPO'
      'DESCRICAO=DESCRICAO'
      'VALOR_UNITARIO=VALOR_UNITARIO'
      'CUSTO=CUSTO'
      'CUSTOUNIDADEESTOQUE=CUSTOUNIDADEESTOQUE'
      'MARGEM=MARGEM'
      'MARKUP=MARKUP'
      'CMV=CMV')
    DataSet = qryRelFichasTecnicas
    BCDToCurrency = False
    DataSetOptions = []
    Left = 1371
    Top = 357
  end
  object qryItensFichaTecnica: TIBQuery
    Database = dm.dbrestaurante
    Transaction = dm.transacao
    BufferChunks = 1000
    CachedUpdates = False
    DataSource = dsRelFichasTecnicas
    ParamCheck = True
    SQL.Strings = (
      '  select cod_produto, cod_produto_baixa,descricao_prod_baixa,'
      '         qtd_baixa_prod,descricao_unidade,'
      '         custo_unitario_produto, custo_baixa'
      '     from '
      
        '       CALCULA_CUSTO_PRODUTO_NOVO(:vpCodigoProduto, :vpCodigoPro' +
        'duto , :rendimento) cp')
    PrecommittedReads = False
    Left = 1322
    Top = 412
    ParamData = <
      item
        DataType = ftWideString
        Name = 'VPCODIGOPRODUTO'
        ParamType = ptUnknown
        Size = 12
      end
      item
        DataType = ftWideString
        Name = 'vpCodigoProduto'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'rendimento'
        ParamType = ptUnknown
      end>
  end
  object dsRelFichasTecnicas: TDataSource
    DataSet = qryRelFichasTecnicas
    Left = 1426
    Top = 359
  end
  object dtqryItensFichaTecnica: TfrxDBDataset
    UserName = 'dtqryItensFichaTecnica'
    CloseDataSource = False
    FieldAliases.Strings = (
      'COD_PRODUTO=COD_PRODUTO'
      'COD_PRODUTO_BAIXA=COD_PRODUTO_BAIXA'
      'DESCRICAO_PROD_BAIXA=DESCRICAO_PROD_BAIXA'
      'QTD_BAIXA_PROD=QTD_BAIXA_PROD'
      'DESCRICAO_UNIDADE=DESCRICAO_UNIDADE'
      'CUSTO_UNITARIO_PRODUTO=CUSTO_UNITARIO_PRODUTO'
      'CUSTO_BAIXA=CUSTO_BAIXA')
    DataSet = qryItensFichaTecnica
    BCDToCurrency = False
    DataSetOptions = []
    Left = 1379
    Top = 418
  end
  object qryRelProdutosVendidos: TIBQuery
    Database = dm.dbrestaurante
    Transaction = dm.transacao
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      ''
      ''
      ''
      ' select mv.grupoRaiz,gRaiz.descricao as descGrupoRaiz,'
      '        mv.desdobramentoPai,mv.desdobramentoFilho,grupoPai,'
      
        '        gPai.descricao as descGrupoPai, mv.codGrupo, g.cod_grupo' +
        ', g.descricao as descGrupo,'
      '        mv.cod_produto, mv.descricao, quantidade,custoMedio,'
      '        precoMedio,subtotal, custoTotal,'
      '        descontos,total,'
      '        margemMedia, margemTotal, markup,'
      
        '        ((total * 100) / (cast(:totalFat as numeric(10,2)) ) ) a' +
        's percFat,'
      '        case Total'
      '         when 0 then 0'
      '        else'
      '        ((custoTotal * 100) / Total)'
      '        end as CMV'
      ''
      ''
      '        from('
      '             select mv.cod_produto,mv.cod_grupo,mv.descricao,'
      
        '                    substring(mv.cod_grupo from 1 for 1) as grup' +
        'oRaiz,'
      
        '                    substring(mv.cod_grupo from 2 for 2) as desd' +
        'obramentoPai,'
      
        '                    substring(mv.cod_grupo from 4 for 3) as desd' +
        'obramentoFilho,'
      
        '                    substring(mv.cod_grupo from 1 for 3) as grup' +
        'oPai,'
      '                    mv.cod_grupo codGrupo,'
      '                    quantidade,precoMedio, custoMedio,'
      
        '                    udf_roundAbnt ( (quantidade * custoMedio),3)' +
        ' as custoTotal,'
      '                    (precoMedio - custoMedio) as margemMedia,'
      
        '                    udf_roundAbnt ( (quantidade * precoMedio),3)' +
        ' as subtotal,'
      '                    descontos,'
      
        '                    udf_roundAbnt ( ( (quantidade * precoMedio) ' +
        '- descontos ),3) as total,'
      
        '                    udf_roundAbnt( ( ((precoMedio - custoMedio) ' +
        '* quantidade) - descontos)  ,3) as MargemTotal,'
      
        '                    ( (udf_roundAbnt( ( ((precoMedio - custoMedi' +
        'o) * quantidade) - descontos)  ,3)) / (udf_roundAbnt ( (quantida' +
        'de * custoMedio),3))) as markup'
      ''
      '                    from ('
      
        '                          SELECT mv.cod_produto,p.descricao, p.c' +
        'od_grupo,'
      
        '                                 udf_roundabnt(SUM(mv.quantidade' +
        '),5) as quantidade,'
      
        '                                 avg(mv.valor_unitario) as preco' +
        'Medio,'
      '                                 sum(mv.desconto) as descontos,'
      '                                 case  coalesce(avg(mv.custo),0)'
      '                                   when 0 then 0.01'
      '                                  else'
      '                                   coalesce(avg(mv.custo),0)'
      '                                 end    as custoMedio'
      '                                 FROM movimento_venda mv'
      
        '                                   inner join vendas v on (v.cod' +
        '_venda = mv.cod_venda)'
      
        '                                   inner join produtos p on (p.c' +
        'od_produto = mv.cod_produto)'
      
        '                                   where cast((v.data ||'#39' '#39'||v.h' +
        'ora) as timestamp) between '#39'01.02.2021'#39' and '#39'23.02.2021'#39
      
        '                                   and mv.cod_empresa in ('#39'0001'#39 +
        ','#39'0005'#39')'
      
        '                                   and p.cod_grupo starting with' +
        ' ('#39#39')'
      
        '                                   group by cod_produto, p.descr' +
        'icao, p.cod_grupo'
      '                           ) mv'
      ''
      '            ) as mv'
      
        '            inner join grupos gRaiz on (gRaiz.cod_grupo = grupoR' +
        'aiz)'
      
        '            inner join grupos gPai on  (gPai.cod_grupo = grupoPa' +
        'i)'
      '            inner join grupos g on     (g.cod_grupo = codGrupo)'
      
        '            order by grupoRaiz,desdobramentoPai,desdobramentoFil' +
        'ho'
      ''
      '')
    PrecommittedReads = False
    Left = 1310
    Top = 492
    ParamData = <
      item
        DataType = ftWideString
        Name = 'totalFat'
        ParamType = ptUnknown
        Value = '16000'
      end>
  end
  object dtQryRelProdutosVendidos: TfrxDBDataset
    UserName = 'DTqryRelProdutosVendidos'
    CloseDataSource = False
    FieldAliases.Strings = (
      'GRUPORAIZ=GRUPORAIZ'
      'DESCGRUPORAIZ=DESCGRUPORAIZ'
      'DESDOBRAMENTOPAI=DESDOBRAMENTOPAI'
      'DESDOBRAMENTOFILHO=DESDOBRAMENTOFILHO'
      'GRUPOPAI=GRUPOPAI'
      'DESCGRUPOPAI=DESCGRUPOPAI'
      'CODGRUPO=CODGRUPO'
      'COD_GRUPO=COD_GRUPO'
      'DESCGRUPO=DESCGRUPO'
      'COD_PRODUTO=COD_PRODUTO'
      'DESCRICAO=DESCRICAO'
      'QUANTIDADE=QUANTIDADE'
      'CUSTOMEDIO=CUSTOMEDIO'
      'PRECOMEDIO=PRECOMEDIO'
      'SUBTOTAL=SUBTOTAL'
      'CUSTOTOTAL=CUSTOTOTAL'
      'DESCONTOS=DESCONTOS'
      'TOTAL=TOTAL'
      'MARGEMMEDIA=MARGEMMEDIA'
      'MARGEMTOTAL=MARGEMTOTAL'
      'MARKUP=MARKUP'
      'PERCFAT=PERCFAT'
      'CMV=CMV')
    DataSet = qryRelProdutosVendidos
    BCDToCurrency = False
    DataSetOptions = []
    Left = 1357
    Top = 491
  end
  object DtqryRelRankingProdutos: TfrxDBDataset
    UserName = 'DtqryRelRankingProdutos'
    CloseDataSource = False
    FieldAliases.Strings = (
      'RANKING=RANKING'
      'GRUPORAIZ=GRUPORAIZ'
      'DESCGRUPORAIZ=DESCGRUPORAIZ'
      'DESDOBRAMENTOPAI=DESDOBRAMENTOPAI'
      'DESDOBRAMENTOFILHO=DESDOBRAMENTOFILHO'
      'GRUPOPAI=GRUPOPAI'
      'DESCGRUPOPAI=DESCGRUPOPAI'
      'CODGRUPO=CODGRUPO'
      'COD_GRUPO=COD_GRUPO'
      'DESCGRUPO=DESCGRUPO'
      'COD_PRODUTO=COD_PRODUTO'
      'DESCRICAO=DESCRICAO'
      'QUANTIDADE=QUANTIDADE'
      'CUSTOMEDIO=CUSTOMEDIO'
      'PRECOMEDIO=PRECOMEDIO'
      'SUBTOTAL=SUBTOTAL'
      'CUSTOTOTAL=CUSTOTOTAL'
      'DESCONTOS=DESCONTOS'
      'TOTAL=TOTAL'
      'MARGEMMEDIA=MARGEMMEDIA'
      'MARGEMTOTAL=MARGEMTOTAL'
      'MARKUP=MARKUP'
      'PERCFAT=PERCFAT'
      'CMV=CMV')
    DataSet = qryRankingProdutos
    BCDToCurrency = False
    DataSetOptions = []
    Left = 1360
    Top = 545
  end
  object qryRankingProdutos: TFDQuery
    Connection = dm.fdRestaurante
    SQL.Strings = (
      'select gen_id(g_ranking,1) as ranking , rk.* from ('
      'select mv.grupoRaiz,gRaiz.descricao as descGrupoRaiz,  '
      '    mv.desdobramentoPai,mv.desdobramentoFilho,grupoPai,'
      
        '    gPai.descricao as descGrupoPai, mv.codGrupo, g.cod_grupo, g.' +
        'descricao as descGrupo,'
      '    mv.cod_produto, mv.descricao, quantidade,custoMedio,'
      '    precoMedio,subtotal, custoTotal,'
      '    descontos,total,'
      '    margemMedia, margemTotal, markup,'
      
        '    ((total * 100) / (cast(68265.16 as numeric(10,2)) ) ) as per' +
        'cFat,'
      '    case Total    '
      
        '        when 0 then 0                                           ' +
        '                                                                ' +
        '                            '
      
        '    else                                                        ' +
        '                                                                ' +
        '                            '
      
        '    ((custoTotal * 100) / Total)                                ' +
        '                                                                ' +
        '                            '
      
        '    end as CMV                                                  ' +
        '                                                                ' +
        '                            '
      
        '                                                                ' +
        '                                                                ' +
        '                          '
      
        '                                                                ' +
        '                                                                ' +
        '                          '
      
        '    from(                                                       ' +
        '                                                                ' +
        '                            '
      
        '            select mv.cod_produto,mv.cod_grupo,mv.descricao,    ' +
        '                                                                ' +
        '                            '
      
        '                substring(mv.cod_grupo from 1 for 1) as grupoRai' +
        'z,                                                              ' +
        '                            '
      
        '                substring(mv.cod_grupo from 2 for 2) as desdobra' +
        'mentoPai,                                                       ' +
        '                            '
      
        '                substring(mv.cod_grupo from 4 for 3) as desdobra' +
        'mentoFilho,                                                     ' +
        '                            '
      
        '                substring(mv.cod_grupo from 1 for 3) as grupoPai' +
        ',                                                               ' +
        '                            '
      
        '                mv.cod_grupo codGrupo,                          ' +
        '                                                                ' +
        '                            '
      
        '                quantidade,precoMedio, custoMedio,              ' +
        '                                                                ' +
        '                            '
      
        '                udf_roundAbnt ( (quantidade * custoMedio),3) as ' +
        'custoTotal,                                                     ' +
        '                            '
      
        '                (precoMedio - custoMedio) as margemMedia,       ' +
        '                                                                ' +
        '                            '
      
        '                udf_roundAbnt ( (quantidade * precoMedio),3) as ' +
        'subtotal,                                                       ' +
        '                            '
      
        '                descontos,                                      ' +
        '                                                                ' +
        '                            '
      
        '                udf_roundAbnt ( ( (quantidade * precoMedio) - de' +
        'scontos ),3) as total,                                          ' +
        '                            '
      
        '                udf_roundAbnt( ( ((precoMedio - custoMedio) * qu' +
        'antidade) - descontos)  ,3) as MargemTotal,                     ' +
        '                            '
      
        '                ( (udf_roundAbnt( ( ((precoMedio - custoMedio) *' +
        ' quantidade) - descontos)  ,3)) / (udf_roundAbnt ( (quantidade *' +
        ' custoMedio),3))) as markup '
      
        '                                                                ' +
        '                                                                ' +
        '                          '
      
        '                from (                                          ' +
        '                                                                ' +
        '                            '
      
        '                        SELECT mv.cod_produto,p.descricao, p.cod' +
        '_grupo,                                                         ' +
        '                            '
      
        '                                udf_roundabnt(SUM(mv.quantidade)' +
        ',5) as quantidade,                                              ' +
        '                            '
      
        '                             udf_roundabnt( (SUM(mv.quantidade *' +
        ' mv.valor_unitario) / SUM(mv.quantidade))   ,5) as precoMedio,'
      
        '                                sum(mv.desconto) as descontos,  ' +
        '                                                                ' +
        '                            '
      
        '                                case  coalesce(avg(mv.custo),0) ' +
        '                                                                ' +
        '                            '
      
        '                                when 0 then 0.01                ' +
        '                                                                ' +
        '                            '
      
        '                                else                            ' +
        '                                                                ' +
        '                            '
      
        '                                coalesce(avg(mv.custo),0)       ' +
        '                                                                ' +
        '                            '
      
        '                                end    as custoMedio            ' +
        '                                                                ' +
        '                            '
      
        '                                FROM movimento_venda mv         ' +
        '                                                                ' +
        '                            '
      
        '                                inner join vendas v on((v.cod_ve' +
        'nda = mv.cod_venda) and (v.cod_empresa = mv.cod_empresa) )      ' +
        '                                                                ' +
        ' '
      
        '                                inner join produtos p on (p.cod_' +
        'produto = mv.cod_produto)                                       ' +
        '                            '
      
        '                                where v.data  between '#39'01.05.202' +
        '1'#39'  and '#39'25.05.2021'#39
      
        '                                and p.cod_grupo starting with ('#39 +
        #39')                                                              ' +
        '                            '
      
        '                                group by cod_produto, p.descrica' +
        'o, p.cod_grupo                                                  ' +
        '                            '
      '                        ) mv                                  '
      
        '        ) as mv                                                 ' +
        '                                                                ' +
        '                            '
      
        '        inner join grupos gRaiz on (gRaiz.cod_grupo = grupoRaiz)' +
        '                                                                ' +
        '                            '
      
        '        inner join grupos gPai on  (gPai.cod_grupo = grupoPai)  ' +
        '                                                                ' +
        '                            '
      
        '        inner join grupos g on     (g.cod_grupo = codGrupo)     ' +
        '                                                                ' +
        '                            '
      '        order by '
      'quantidade desc'
      ') rk')
    Left = 1298
    Top = 545
  end
  object qryRelRecebimentosCartoes: TFDQuery
    Connection = dm.fdRestaurante
    SQL.Strings = (
      ''
      'select * from ('
      ''
      ''
      '  select  v.data_so as data_transacao,'
      '          r.cod_usuario,'
      '          u.login,'
      '          r.cod_caixa,'
      '          v.data as dataSistema,'
      '          v.hora,'
      '          fp.cod_forma,'
      '          fp.descricao as forma,'
      '          fpc.id_adquirente,'
      '          ad.nome  as adquirente,'
      '          r.nsu, r.autorizacao_tef,'
      
        '          cast(udf_incday(r.data,fpc.prazo) as date) as data_rec' +
        'ebimento,'
      '          r.valor as valorTransacao,'
      '         (r.valor * (fpc.taxa /100)) as taxa,'
      
        '         (r.valor - (r.valor * (fpc.taxa /100))) valorReceber, C' +
        'B.conta,'
      '         cb.descricao as descricaoConta'
      '     from recebimentos r'
      
        '       inner join formas_pagamento fp on (fp.cod_forma = r.cod_f' +
        'orma)'
      
        '       inner join formas_pagamento_configuracoes fpc on (fpc.id ' +
        '= r.id_config_pagamento)'
      '       inner join adquirentes ad on (ad.id = fpc.id_adquirente)'
      
        '       inner join contas_bancarias cb on (cb.id = fpc.id_conta_b' +
        'anco)'
      '       inner join usuarios u on (u.cod_usuario = r.cod_usuario)'
      '       inner join vendas v on (v.cod_venda = r.cod_venda)'
      ''
      '        and r.cod_forma <> '#39'001'#39
      ''
      
        '         ) where data_recebimento between '#39'01.06.2021'#39' and '#39'30.0' +
        '6.2021'#39
      ''
      '        order by conta,12,adquirente,cod_forma')
    Left = 1370
    Top = 678
  end
  object DtqryRelRecebimentosCartoes: TfrxDBDataset
    UserName = 'DtqryRelRecebimentosCartoes'
    CloseDataSource = False
    FieldAliases.Strings = (
      'DATA_TRANSACAO=DATA_TRANSACAO'
      'COD_USUARIO=COD_USUARIO'
      'LOGIN=LOGIN'
      'COD_CAIXA=COD_CAIXA'
      'DATASISTEMA=DATASISTEMA'
      'HORA=HORA'
      'COD_FORMA=COD_FORMA'
      'FORMA=FORMA'
      'ID_ADQUIRENTE=ID_ADQUIRENTE'
      'ADQUIRENTE=ADQUIRENTE'
      'NSU=NSU'
      'AUTORIZACAO_TEF=AUTORIZACAO_TEF'
      'DATA_RECEBIMENTO=DATA_RECEBIMENTO'
      'VALORTRANSACAO=VALORTRANSACAO'
      'TAXA=TAXA'
      'VALORRECEBER=VALORRECEBER'
      'CONTA=CONTA'
      'DESCRICAOCONTA=DESCRICAOCONTA')
    DataSet = qryRelRecebimentosCartoes
    BCDToCurrency = False
    DataSetOptions = []
    Left = 1370
    Top = 624
  end
  object qryRelLancamentosRD: TIBQuery
    Database = dm.dbrestaurante
    Transaction = dm.transacao
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      ''
      ''
      
        'select * from (select coalesce(c.data_vencimento,lr.data_documen' +
        'to) as data_vencimento,  f.razao_social, lr.* from lancamentos_r' +
        'd lr'
      '  left join contas_a_pagar c on (c.codigo = lr.cod_ct_pagar)'
      
        '  inner join fornecedor f on (f.cod_fornecedor = lr.cod_forneced' +
        'or)'
      '  ) lrd'
      
        '   where lrd.data_vencimento between '#39'01.03.2016'#39' and '#39'30.04.201' +
        '6'#39
      '   order by lrd.data_lancamento')
    PrecommittedReads = False
    Left = 1386
    Top = 49
  end
  object dtLancamentosRD: TfrxDBDataset
    UserName = 'dtLancamentosRD'
    CloseDataSource = False
    FieldAliases.Strings = (
      'DATA_VENCIMENTO=DATA_VENCIMENTO'
      'RAZAO_SOCIAL=RAZAO_SOCIAL'
      'CODIGO=CODIGO'
      'COD_FORNECEDOR=COD_FORNECEDOR'
      'NUM_DOC=NUM_DOC'
      'DATA_LANCAMENTO=DATA_LANCAMENTO'
      'DATA_DOCUMENTO=DATA_DOCUMENTO'
      'DATA_RD=DATA_RD'
      'OBSERVACOES=OBSERVACOES'
      'NOME_USUARIO=NOME_USUARIO'
      'TOTAL=TOTAL'
      'COD_CT_PAGAR=COD_CT_PAGAR'
      'STATUS=STATUS'
      'DATA_CANCELAMENTO=DATA_CANCELAMENTO'
      'COD_LANC_CANCELAMENTO=COD_LANC_CANCELAMENTO')
    DataSet = qryRelLancamentosRD
    BCDToCurrency = False
    DataSetOptions = []
    Left = 1466
    Top = 49
  end
  object qryCompras: TIBQuery
    Database = dm.dbrestaurante
    Transaction = dm.transacao
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      'select e.*, f.razao_social, m.descricao as desc_modelo'
      '     from entradas e '
      
        '       inner join fornecedor f on (f.cod_fornecedor = e.cod_forn' +
        'ecedor)'
      '       inner join modelos_nf m on (m.codigo = e.modelo_nota)'
      '     where e.data_entrada between '#39'01.01.2019'#39' and '#39'20.03.2019'#39
      ' and e.cod_fornecedor like '#39'0803%'#39
      ' order by e.cod_entrada')
    PrecommittedReads = False
    Left = 29
    Top = 698
  end
  object dtCompras: TfrxDBDataset
    UserName = 'dtCompras'
    CloseDataSource = False
    FieldAliases.Strings = (
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
      'RAZAO_SOCIAL=RAZAO_SOCIAL'
      'DESC_MODELO=DESC_MODELO')
    DataSet = qryCompras
    BCDToCurrency = False
    DataSetOptions = []
    Left = 101
    Top = 698
  end
  object qryItensCompra: TIBQuery
    Database = dm.dbrestaurante
    Transaction = dm.transacao
    BufferChunks = 1000
    CachedUpdates = False
    DataSource = dsQryCompras
    ParamCheck = True
    SQL.Strings = (
      
        'select ie.*, (ie.quantidade * ie.valor_unitario) as subtotal, ( ' +
        '(ie.quantidade * ie.valor_unitario) - ie.desconto) as total, u.d' +
        'escricao as UnidadeEstoqueAnterior'
      '  from  itens_entrada ie'
      
        '  inner join unidades u on  ( u.cod_unidade = ie.cod_unidade_est' +
        'oque_anterior)'
      '  where ie.cod_entrada = :cod_entrada')
    PrecommittedReads = False
    Left = 27
    Top = 753
    ParamData = <
      item
        DataType = ftWideString
        Name = 'COD_ENTRADA'
        ParamType = ptUnknown
        Size = 18
      end>
  end
  object dtItensCompra: TfrxDBDataset
    UserName = 'dtItensCompra'
    CloseDataSource = False
    FieldAliases.Strings = (
      'COD_ENTRADA=COD_ENTRADA'
      'COD_ITEM=COD_ITEM'
      'QUANTIDADE=QUANTIDADE'
      'COD_UNIDADE=COD_UNIDADE'
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
      'OUTRAS_DESPESAS=OUTRAS_DESPESAS'
      'VALOR_UNITARIO=VALOR_UNITARIO'
      'COD_EMP_GRUPO=COD_EMP_GRUPO'
      'DATA_ENTRADA=DATA_ENTRADA'
      'SUBTOTAL=SUBTOTAL'
      'TOTAL=TOTAL'
      'UNIDADEESTOQUEANTERIOR=UNIDADEESTOQUEANTERIOR')
    DataSet = qryItensCompra
    BCDToCurrency = False
    DataSetOptions = []
    Left = 98
    Top = 753
  end
  object dsQryCompras: TDataSource
    DataSet = qryCompras
    Left = 180
    Top = 701
  end
  object frxPDFExport1: TfrxPDFExport
    FileName = 'C:\Users\Joao\Desktop\QRS Code - Rodizio Premium.pdf'
    UseFileCache = True
    ShowProgress = True
    OverwritePrompt = False
    CreationTime = 45910.731986342590000000
    DataOnly = False
    EmbeddedFonts = True
    EmbedFontsIfProtected = False
    InteractiveFormsFontSubset = 'A-Z,a-z,0-9,#43-#47 '
    OpenAfterExport = False
    PrintOptimized = True
    Outline = False
    Background = False
    HTMLTags = True
    Quality = 95
    Transparency = False
    Author = 'FastReport'
    Subject = 'FastReport PDF export'
    Creator = 'FastReport'
    ProtectionFlags = [ePrint, eModify, eCopy, eAnnot]
    HideToolbar = False
    HideMenubar = False
    HideWindowUI = False
    FitWindow = False
    CenterWindow = False
    PrintScaling = False
    PdfA = True
    PDFStandard = psPDFA_1a
    PDFVersion = pv14
    Left = 1208
    Top = 576
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
    Left = 1096
    Top = 696
  end
  object frxCSVExport1: TfrxCSVExport
    UseFileCache = True
    ShowProgress = True
    OverwritePrompt = False
    DataOnly = False
    Separator = ';'
    OEMCodepage = False
    UTF8 = False
    OpenAfterExport = False
    NoSysSymbols = True
    ForcedQuotes = False
    Left = 1016
    Top = 696
  end
  object frxXLSExport1: TfrxXLSExport
    UseFileCache = True
    ShowProgress = True
    OverwritePrompt = False
    DataOnly = False
    ExportEMF = True
    AsText = False
    Background = True
    FastExport = True
    PageBreaks = True
    EmptyLines = True
    SuppressPageHeadersFooters = False
    Left = 1016
    Top = 576
  end
  object frxXLSXExport1: TfrxXLSXExport
    UseFileCache = True
    ShowProgress = True
    OverwritePrompt = False
    DataOnly = False
    ChunkSize = 0
    OpenAfterExport = False
    PictureType = gpPNG
    Left = 1016
    Top = 640
  end
  object frxDOCXExport2: TfrxDOCXExport
    UseFileCache = True
    ShowProgress = True
    OverwritePrompt = False
    DataOnly = False
    OpenAfterExport = False
    PictureType = gpPNG
    ExportType = dxTable
    Left = 1104
    Top = 640
  end
  object dtFaturamentoResumido: TfrxDBDataset
    UserName = 'dtFaturamentoResumido'
    CloseDataSource = False
    FieldAliases.Strings = (
      'COD_FORMA=COD_FORMA'
      'TOTAL=TOTAL'
      'DESCRICAO=DESCRICAO')
    DataSet = qryRelFaturamento
    BCDToCurrency = False
    DataSetOptions = []
    Left = 417
    Top = 790
  end
  object qryRelInsumosProducao: TFDQuery
    Connection = dm.fdRestaurante
    SQL.Strings = (
      ''
      ''
      ''
      ''
      ''
      ''
      'select'
      '       ins.cod_produto,'
      '       p.descricao,'
      '       gp.cod_grupo_raiz,'
      '       gp.desc_grupo_raiz,'
      '       gp.cod_grupo_pai,'
      '    gp.desdobramento_pai,'
      '       gp.desc_grupo_pai,'
      '       gp.cod_grupo,'
      '       gp.desdobramento_filho,'
      '       gp.descricao as descGrupo,'
      '       u.descricao as unidade,'
      '       ins.qtdEstimada,'
      '       ins.qtdRetirada,'
      '       ins.qtdUtilizada,'
      '       ins.qtdPerda,'
      '       ins.qtdSobra,'
      '       ins.desvioQuantidade,'
      '       ins.custoMedio,'
      '       (ins.qtdUtilizada * ins.custoMedio) as custoUtilizado,'
      '       (ins.qtdPerda * ins.custoMedio) as custoPerdas,'
      
        '       ( (ins.qtdPerda + ins.qtdUtilizada) * ins.custoMedio) as ' +
        'custoTotal'
      ''
      '        from'
      '         ('
      '         select p.cod_produto,'
      '                 sum(p.qtde_calculada) as qtdEstimada,'
      '                 sum(p.qtde_retirada)  as qtdRetirada,'
      '                 sum(p.qtde_utilizada) as qtdUtilizada,'
      '                 sum(p.qtde_perda) as qtdPerda,'
      '                 sum(p.qtde_sobra) as qtdSobra,'
      '                 avg(p.desvio_quantidade) as desvioQuantidade,'
      '                 avg(p.custo_unitario) as custoMedio'
      '              from producoes_lista_insumos p'
      
        '               inner join producoes_subprodutos pd on (pd.id = p' +
        '.id_producao)'
      
        '                 where pd.data_processamento between '#39'01.04.2022' +
        #39' and '#39'30.04.2022'#39
      '               group by p.cod_produto'
      '          ) ins'
      '      inner join produtos p on (p.cod_produto = ins.cod_produto)'
      
        '      inner join unidades u on (u.cod_unidade = p.unidade_entrad' +
        'a)'
      '      inner join r_grupos gp on (gp.cod_grupo = p.cod_grupo)'
      ''
      
        '      order by gp.cod_grupo_raiz, gp.desdobramento_pai, gp.desdo' +
        'bramento_filho, gp.descricao')
    Left = 760
    Top = 712
  end
  object dtRelInsumosProducao: TfrxDBDataset
    UserName = 'dtRelInsumosProducao'
    CloseDataSource = False
    FieldAliases.Strings = (
      'COD_PRODUTO=COD_PRODUTO'
      'DESCRICAO=DESCRICAO'
      'COD_GRUPO_RAIZ=COD_GRUPO_RAIZ'
      'DESC_GRUPO_RAIZ=DESC_GRUPO_RAIZ'
      'COD_GRUPO_PAI=COD_GRUPO_PAI'
      'DESDOBRAMENTO_PAI=DESDOBRAMENTO_PAI'
      'DESC_GRUPO_PAI=DESC_GRUPO_PAI'
      'COD_GRUPO=COD_GRUPO'
      'DESDOBRAMENTO_FILHO=DESDOBRAMENTO_FILHO'
      'DESCGRUPO=DESCGRUPO'
      'UNIDADE=UNIDADE'
      'QTDESTIMADA=QTDESTIMADA'
      'QTDRETIRADA=QTDRETIRADA'
      'QTDUTILIZADA=QTDUTILIZADA'
      'QTDPERDA=QTDPERDA'
      'QTDSOBRA=QTDSOBRA'
      'DESVIOQUANTIDADE=DESVIOQUANTIDADE'
      'CUSTOMEDIO=CUSTOMEDIO'
      'CUSTOUTILIZADO=CUSTOUTILIZADO'
      'CUSTOPERDAS=CUSTOPERDAS'
      'CUSTOTOTAL=CUSTOTOTAL')
    DataSet = qryRelInsumosProducao
    BCDToCurrency = False
    DataSetOptions = []
    Left = 760
    Top = 760
  end
  object frxChartObject1: TfrxChartObject
    Left = 912
    Top = 704
  end
  object dtCurvaABCProdutosVendidos: TfrxDBDataset
    UserName = 'dtCurvaABCVenda'
    CloseDataSource = False
    FieldAliases.Strings = (
      'CURVA=CURVA'
      'TOTAL_FATURAMENTO=TOTAL_FATURAMENTO'
      'COD_PRODUTO=COD_PRODUTO'
      'DESCRICAO=DESCRICAO'
      'PERCENTUAL=PERCENTUAL'
      'TOTAL_PRODUTO=TOTAL_PRODUTO'
      'QUANTIDADE=QUANTIDADE'
      'COD_GRUPO=COD_GRUPO'
      'DESCRICAOGRUPO=DESCRICAOGRUPO')
    DataSet = qryRelCurvaABCProdutosVendidos
    BCDToCurrency = False
    DataSetOptions = []
    Left = 1214
    Top = 54
  end
  object qryRelCurvaABCProdutosVendidos: TFDQuery
    Connection = dm.fdRestaurante
    SQL.Strings = (
      
        ' select r.*, g.descricao as descricaoGrupo from r_curva_abc(80,1' +
        '5,5,'
      #39'01.03.2021'#39
      ','#39'31.03.2021'#39
      ','#39#39') r'
      ' inner join grupos g on (g.cod_grupo = r.cod_grupo)')
    Left = 1163
    Top = 54
  end
  object frxDBDataset7: TfrxDBDataset
    UserName = 'frxDBDataset7'
    CloseDataSource = False
    BCDToCurrency = False
    DataSetOptions = []
    Left = 1292
    Top = 770
  end
  object qryQRCodesMesa: TFDQuery
    Connection = dm.fdRestaurante
    SQL.Strings = (
      ''
      ''
      '  select cast(c.cod_cartao as integer) as cod_cartao,'
      
        '        udf_replace( (select first 1 p.uri_qrcode_mesas from par' +
        'ametros p),'#39':vpMesa'#39',c.cod_cartao) as url_qrcode'
      '     from cartoes c'
      '       where cast(c.cod_cartao as integer) between 1 and 200'
      '     order by c.cod_cartao')
    Left = 1129
    Top = 467
  end
  object dtQrCcodesMesa: TfrxDBDataset
    UserName = 'dtQrCcodesMesa'
    CloseDataSource = False
    FieldAliases.Strings = (
      'COD_CARTAO=COD_CARTAO'
      'URL_QRCODE=URL_QRCODE')
    DataSet = qryQRCodesMesa
    BCDToCurrency = False
    DataSetOptions = []
    Left = 1180
    Top = 470
  end
  object dtDRENovo: TfrxDBDataset
    UserName = 'dtDRENovo'
    CloseDataSource = False
    DataSet = dm.qryDRE
    BCDToCurrency = False
    DataSetOptions = []
    Left = 1528
    Top = 390
  end
  object frxRichObject1: TfrxRichObject
    Left = 1503
    Top = 542
  end
end
