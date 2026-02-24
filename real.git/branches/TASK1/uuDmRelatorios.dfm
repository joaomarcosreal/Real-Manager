object dRelatorios: TdRelatorios
  OldCreateOrder = False
  Height = 720
  Width = 1569
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
    Left = 18
    Top = 185
  end
  object dtParametros: TfrxDBDataset
    UserName = 'dtParametros'
    CloseDataSource = False
    DataSet = qryParametros
    BCDToCurrency = False
    Left = 20
    Top = 134
  end
  object qryProdutos: TIBQuery
    Database = dm.dbrestaurante
    Transaction = dm.transacao
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      
        'select vp.*, al.percentagem,al.descricao as desc_aliquota,mp.des' +
        'cricao as miniprinter,ri.valor_custo,ri.perc_lucro,ri.lucro_real'
      ' from v_produtos vp'
      ' inner join aliquotas al on (al.cod_aliquota = vp.cod_aliquota)'
      
        ' inner join r_informacoes_produto ri on (ri.cod_produto = vp.cod' +
        '_produto)'
      
        'inner join miniprinters mp on (mp.cod_miniprinter  = vp.cod_mini' +
        '_printer)'
      ' where vp.cod_grupo like '#39'%'#39
      ' order by vp.cod_g_raiz,vp.cod_g_pai,vp.cod_grupo'
      '')
    Left = 16
    Top = 264
  end
  object dtProdutos: TfrxDBDataset
    UserName = 'dtProdutos'
    CloseDataSource = False
    FieldAliases.Strings = (
      'COD_PRODUTO=COD_PRODUTO'
      'DESCRICAO=DESCRICAO'
      'VALOR_UNITARIO=VALOR_UNITARIO'
      'DATA_CADASTRO=DATA_CADASTRO'
      'ULTIMA_VENDA=ULTIMA_VENDA'
      'NUMERO_VENDAS=NUMERO_VENDAS'
      'COD_ALIQUOTA=COD_ALIQUOTA'
      'CAMINHO_FOTO=CAMINHO_FOTO'
      'COD_BARRAS=COD_BARRAS'
      'ACOMPANHAMENTO=ACOMPANHAMENTO'
      'PERMITE_ACOMPANHAMENTO=PERMITE_ACOMPANHAMENTO'
      'ACOMPANHAMENTOS_FIXOS=ACOMPANHAMENTOS_FIXOS'
      'NUMERO_ACOMPANHAMENTOS=NUMERO_ACOMPANHAMENTOS'
      'LUCRO_MAXIMO=LUCRO_MAXIMO'
      'LUCRO_MINIMO=LUCRO_MINIMO'
      'PRODUTO_FINAL=PRODUTO_FINAL'
      'ITEM_ASSOCIADO=ITEM_ASSOCIADO'
      'COD_GRUPO=COD_GRUPO'
      'COD_MINI_PRINTER=COD_MINI_PRINTER'
      'DESCRICAO_GRUPO=DESCRICAO_GRUPO'
      'CFOP=CFOP'
      'DESCRICAO_CFOP=DESCRICAO_CFOP'
      'CST=CST'
      'DESCRICAO_CST=DESCRICAO_CST'
      'TIPO_ITEM=TIPO_ITEM'
      'DESCRICAO_TIPO=DESCRICAO_TIPO'
      'COD_G_RAIZ=COD_G_RAIZ'
      'COD_G_PAI=COD_G_PAI'
      'DESC_G_RAIZ=DESC_G_RAIZ'
      'DESC_G_PAI=DESC_G_PAI'
      'ALIQUOTA=ALIQUOTA'
      'COMISSIONADO=COMISSIONADO'
      'VALOR_COMISSAO=VALOR_COMISSAO'
      'CUSTODIGITADO=CUSTODIGITADO'
      'PERCENTAGEM=PERCENTAGEM'
      'DESC_ALIQUOTA=DESC_ALIQUOTA'
      'MINIPRINTER=MINIPRINTER'
      'VALOR_CUSTO=VALOR_CUSTO'
      'PERC_LUCRO=PERC_LUCRO'
      'LUCRO_REAL=LUCRO_REAL')
    DataSet = qryProdutos
    BCDToCurrency = False
    Left = 16
    Top = 312
  end
  object qryUnidades: TIBQuery
    Database = dm.dbrestaurante
    Transaction = dm.transacao
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      'select * from unidades order by cod_unidade')
    Left = 72
    Top = 264
  end
  object dtUnidades: TfrxDBDataset
    UserName = 'dtUnidades'
    CloseDataSource = False
    FieldAliases.Strings = (
      'COD_UNIDADE=COD_UNIDADE'
      'DESCRICAO=DESCRICAO'
      'SIGLA=SIGLA'
      'PARAMETRO=PARAMETRO'
      'COD_PADRAO=COD_PADRAO')
    DataSet = qryUnidades
    BCDToCurrency = False
    Left = 72
    Top = 312
  end
  object qryGarcons: TIBQuery
    Database = dm.dbrestaurante
    Transaction = dm.transacao
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      'select * from garcons order by cod_garcon')
    Left = 128
    Top = 264
  end
  object dtGarcons: TfrxDBDataset
    UserName = 'dtGarcons'
    CloseDataSource = False
    FieldAliases.Strings = (
      'COD_GARCON=COD_GARCON'
      'APELIDO=APELIDO'
      'METRE=METRE'
      'COD_METRE=COD_METRE')
    DataSet = qryGarcons
    BCDToCurrency = False
    Left = 128
    Top = 312
  end
  object qryTiposBaixa: TIBQuery
    Database = dm.dbrestaurante
    Transaction = dm.transacao
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      'select * from tipos_baixa order by cod_tipo')
    Left = 176
    Top = 264
  end
  object dtTiposBaixa: TfrxDBDataset
    UserName = 'dtTiposBaixa'
    CloseDataSource = False
    FieldAliases.Strings = (
      'COD_TIPO=COD_TIPO'
      'DESCRICAO=DESCRICAO')
    DataSet = qryTiposBaixa
    BCDToCurrency = False
    Left = 176
    Top = 312
  end
  object qryMotivosEstorno: TIBQuery
    Database = dm.dbrestaurante
    Transaction = dm.transacao
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      'select * from motivos_estornos order by codigo')
    Left = 240
    Top = 264
  end
  object dtMotivosEstorno: TfrxDBDataset
    UserName = 'dtMotivosEstorno'
    CloseDataSource = False
    FieldAliases.Strings = (
      'CODIGO=CODIGO'
      'DESCRICAO=DESCRICAO')
    DataSet = qryMotivosEstorno
    BCDToCurrency = False
    Left = 240
    Top = 312
  end
  object qryObsPreparo: TIBQuery
    Database = dm.dbrestaurante
    Transaction = dm.transacao
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      'select * from observacoes_padrao order by descricao')
    Left = 280
    Top = 264
  end
  object dtObsPreparo: TfrxDBDataset
    UserName = 'dtObsPreparo'
    CloseDataSource = False
    FieldAliases.Strings = (
      'COD_OBS=COD_OBS'
      'DESCRICAO=DESCRICAO')
    DataSet = qryObsPreparo
    BCDToCurrency = False
    Left = 280
    Top = 312
  end
  object qryTiposSangria: TIBQuery
    Database = dm.dbrestaurante
    Transaction = dm.transacao
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      'select * from tipos_sangria order by codigo')
    Left = 336
    Top = 264
  end
  object dtTiposSangria: TfrxDBDataset
    UserName = 'dtTiposSangria'
    CloseDataSource = False
    FieldAliases.Strings = (
      'CODIGO=CODIGO'
      'DESCRICAO=DESCRICAO')
    DataSet = qryTiposSangria
    BCDToCurrency = False
    Left = 336
    Top = 312
  end
  object qryFornecedores: TIBQuery
    Database = dm.dbrestaurante
    Transaction = dm.transacao
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      
        'select  f.cod_fornecedor,f.nome_fantasia,f.fax,f.telefone,f.data' +
        '_cadastro,f.email,f.codigo_grupo_fornec,f.contato, gp.descricao ' +
        'as descGrupo from fornecedor f'
      
        '  inner join grupo_fornecedor  gp on (gp.codigo = f.codigo_grupo' +
        '_fornec)'
      '  order by f.codigo_grupo_fornec')
    Left = 384
    Top = 264
  end
  object dtFornecedores: TfrxDBDataset
    UserName = 'dtFornecedores'
    CloseDataSource = False
    FieldAliases.Strings = (
      'COD_FORNECEDOR=COD_FORNECEDOR'
      'NOME_FANTASIA=NOME_FANTASIA'
      'FAX=FAX'
      'TELEFONE=TELEFONE'
      'DATA_CADASTRO=DATA_CADASTRO'
      'EMAIL=EMAIL'
      'CODIGO_GRUPO_FORNEC=CODIGO_GRUPO_FORNEC'
      'CONTATO=CONTATO'
      'DESCGRUPO=DESCGRUPO')
    DataSet = qryFornecedores
    BCDToCurrency = False
    Left = 384
    Top = 312
  end
  object qryGruposFornecedor: TIBQuery
    Database = dm.dbrestaurante
    Transaction = dm.transacao
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      'select * from grupo_fornecedor order by codigo')
    Left = 432
    Top = 264
  end
  object dtGruposFornecedor: TfrxDBDataset
    UserName = 'dtGruposFornecedor'
    CloseDataSource = False
    FieldAliases.Strings = (
      'CODIGO=CODIGO'
      'DESCRICAO=DESCRICAO')
    DataSet = qryGruposFornecedor
    BCDToCurrency = False
    Left = 432
    Top = 312
  end
  object qryItensEstoque: TIBQuery
    Database = dm.dbrestaurante
    Transaction = dm.transacao
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      'select v.*,'
      
        'cast(v.percentual_ideal as numeric(10,2))  as percentual_estoque' +
        ','
      ''
      'r.estoque_atual,r.estoque_reposicao   from v_itens_estoque v'
      '  inner join r_estoque_item r on (r.cod_item = v.cod_item)'
      
        '  where v.estoque_total <= v.estoque_minimo and  cod_grupo like ' +
        #39'%'#39)
    Left = 480
    Top = 264
  end
  object dtItensEstoque: TfrxDBDataset
    UserName = 'dtItensEstoque'
    CloseDataSource = False
    FieldAliases.Strings = (
      'COD_GRUPO=COD_GRUPO'
      'COD_ITEM=COD_ITEM'
      'DESCRICAO_ITEM=DESCRICAO_ITEM'
      'COD_UN_ENTRADA=COD_UN_ENTRADA'
      'ESTOQUE_LIQUIDO=ESTOQUE_LIQUIDO'
      'ESTOQUE_TOTAL=ESTOQUE_TOTAL'
      'ESTOQUE_INTEIRO=ESTOQUE_INTEIRO'
      'DESCRICAO_ENTRADA=DESCRICAO_ENTRADA'
      'SIGLA_ENTRADA=SIGLA_ENTRADA'
      'FRACAO_ESTOQUE=FRACAO_ESTOQUE'
      'DESCRICAO_FRACAO=DESCRICAO_FRACAO'
      'PERCENTUAL_IDEAL=PERCENTUAL_IDEAL'
      'QTO_COMPRAR=QTO_COMPRAR'
      'GASTO_ESTIMADO=GASTO_ESTIMADO'
      'FOLGA=FOLGA'
      'CUSTO_UNITARIO=CUSTO_UNITARIO'
      'ESTOQUE_DINHEIRO=ESTOQUE_DINHEIRO'
      'ESTOQUE_MINIMO=ESTOQUE_MINIMO'
      'ESTOQUE_MAXIMO=ESTOQUE_MAXIMO'
      'COD_G_RAIZ=COD_G_RAIZ'
      'COD_G_PAI=COD_G_PAI'
      'DESC_G_RAIZ=DESC_G_RAIZ'
      'DESC_G_PAI=DESC_G_PAI'
      'DESC_GRUPO=DESC_GRUPO'
      'CFOP_ENTRADA=CFOP_ENTRADA'
      'DESC_CFOP_ENTRADA=DESC_CFOP_ENTRADA'
      'CST_ENTRADA=CST_ENTRADA'
      'DESC_CST_ENTRADA=DESC_CST_ENTRADA'
      'COD_TIPO_ITEM=COD_TIPO_ITEM'
      'DESC_TIPO_ITEM=DESC_TIPO_ITEM'
      'NCM=NCM'
      'PERCENTUAL_ESTOQUE=PERCENTUAL_ESTOQUE'
      'ESTOQUE_ATUAL=ESTOQUE_ATUAL'
      'ESTOQUE_REPOSICAO=ESTOQUE_REPOSICAO')
    DataSet = qryItensEstoque
    BCDToCurrency = False
    Left = 480
    Top = 312
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
    Left = 1000
    Top = 360
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
    DataSource = dsQryCompras
    BCDToCurrency = False
    Left = 1152
    Top = 360
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
    Left = 1000
    Top = 416
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
    DataSource = dsQryItensCompras
    BCDToCurrency = False
    Left = 1160
    Top = 408
  end
  object dsQryCompras: TDataSource
    DataSet = qryCompras
    Left = 1080
    Top = 360
  end
  object qryComprasPorGrupo: TIBQuery
    Database = dm.dbrestaurante
    Transaction = dm.transacao
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      ''
      ''
      'select cp.*,'
      
        ' ( ((cp.preco_medio * cp.quantidade) - cp.desconto + cp.ipi + cp' +
        '.outras) / cp.quantidade) as custo_medio,'
      
        ' ((cp.preco_medio * cp.quantidade) - cp.desconto + cp.ipi + cp.o' +
        'utras) as total from ('
      ' select ie.cod_item, vi.descricao_item,'
      '         avg(ie.valor_unitario) as preco_medio,'
      '         sum(quantidade) as quantidade,'
      '         sum(ie.quantidade * ie.valor_unitario) as subtotal,'
      '         sum(ie.desconto) as desconto,'
      '         sum(ie.valor_ipi) as ipi,'
      '         sum(ie.outras_despesas) outras,'
      '         u.descricao as UnidadeEstoqueAnterior,'
      '         vi.cod_g_raiz,'
      '         vi.desc_g_raiz,'
      '         vi.cod_g_pai,'
      '         vi.desc_g_pai,'
      '         vi.cod_grupo,'
      '         vi.desc_grupo'
      '   from  itens_entrada ie'
      
        '   inner join unidades u on  ( u.cod_unidade = ie.cod_unidade_es' +
        'toque_anterior)'
      '   inner join entradas en on ( en.cod_entrada = ie.cod_entrada)'
      '   inner join v_itens_estoque vi on (vi.cod_item = ie.cod_item)'
      '  where en.data_entrada between '#39'01.01.2018'#39' and '#39'31.03.2019'#39
      ' and en.cod_fornecedor like '#39'0803%'#39
      ' and  vi.cod_grupo like  '#39'%'#39
      
        '   group by ie.cod_item, vi.descricao_item, vi.cod_g_raiz, vi.de' +
        'sc_g_raiz, vi.cod_g_pai, vi.desc_g_pai , vi.cod_grupo, vi.desc_g' +
        'rupo, u.descricao'
      '   order by vi.cod_g_raiz,vi.cod_g_pai,vi.cod_grupo, ie.cod_item'
      '            ) cp')
    Left = 992
    Top = 480
  end
  object dtComprasPorGrupo: TfrxDBDataset
    UserName = 'dtComprasPorGrupo'
    CloseDataSource = False
    FieldAliases.Strings = (
      'COD_ITEM=COD_ITEM'
      'DESCRICAO_ITEM=DESCRICAO_ITEM'
      'PRECO_MEDIO=PRECO_MEDIO'
      'QUANTIDADE=QUANTIDADE'
      'SUBTOTAL=SUBTOTAL'
      'DESCONTO=DESCONTO'
      'IPI=IPI'
      'OUTRAS=OUTRAS'
      'UNIDADEESTOQUEANTERIOR=UNIDADEESTOQUEANTERIOR'
      'COD_G_RAIZ=COD_G_RAIZ'
      'DESC_G_RAIZ=DESC_G_RAIZ'
      'COD_G_PAI=COD_G_PAI'
      'DESC_G_PAI=DESC_G_PAI'
      'COD_GRUPO=COD_GRUPO'
      'DESC_GRUPO=DESC_GRUPO'
      'CUSTO_MEDIO=CUSTO_MEDIO'
      'TOTAL=TOTAL')
    DataSet = qryComprasPorGrupo
    BCDToCurrency = False
    Left = 1088
    Top = 480
  end
  object qryComprasItem: TIBQuery
    Database = dm.dbrestaurante
    Transaction = dm.transacao
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      ''
      
        '  select ie.*,(ie.quantidade * u.parametro) as quantidadeParamet' +
        'ro,'
      '             (ie.quantidade * ie.valor_unitario) as subtotal,'
      '             ie.desconto, ie.outras_despesas, ie.aliquota_ipi,'
      
        '             ((ie.quantidade * ie.valor_unitario) - ie.desconto)' +
        ' as total,'
      '              u.descricao as unidadeCompra,'
      
        '          en.cod_fornecedor,f.razao_social as nomeFornecedor ,en' +
        '.data_entrada,'
      
        '          en.nome_usuario_entrada,en.numero_nota,en.data,en.hora' +
        ','
      
        '          vi.cod_g_raiz, vi.desc_g_raiz, vi.cod_g_pai, vi.desc_g' +
        '_pai , vi.cod_grupo, vi.desc_grupo,'
      
        '          u2.parametro as parametroUnidadeEntrada, u2.descricao ' +
        'as descUnidadeEntrada,u3.parametro as parametroUnidadeFracao,u3.' +
        'descricao as descUnidadeFracao,'
      
        '          udf_replace(cast((udf_int (ie.estoque_anterior ))     ' +
        'as varchar(7)),'#39'.'#39','#39','#39')'
      '                                    ||'#39' '#39'||u2.descricao'
      '                                    ||'#39' + '#39'||'
      
        '                                    cast(udf_frac (ie.estoque_an' +
        'terior ) as varchar(7))'
      
        '                                    ||'#39' '#39'||u3.descricao   as est' +
        'oqueAnterior,'
      
        '          udf_replace(cast((udf_int (ie.estoque_atualizado  ))  ' +
        '   as varchar(7)),'#39'.'#39','#39','#39')'
      '                                    ||'#39' '#39'||u2.descricao'
      '                                    ||'#39' + '#39'||'
      
        '                                    cast(udf_frac (ie.estoque_at' +
        'ualizado ) as varchar(7))'
      
        '                                    ||'#39' '#39'||u3.descricao   as est' +
        'oqueAtualizado'
      '    from  itens_entrada ie'
      '    inner join unidades u on  ( u.cod_unidade = ie.cod_unidade)'
      '    inner join produtos ite on (ite.cod_produto = ie.cod_item)'
      
        '    inner join unidades u2 on  ( u2.cod_unidade = ite.unidade_en' +
        'trada)'
      
        '    inner join unidades u3 on  ( u3.cod_unidade = ite.cod_unidad' +
        'e_fracao)'
      '    inner join entradas en on ( en.cod_entrada = ie.cod_entrada)'
      '    inner join v_itens_estoque vi on (vi.cod_item = ie.cod_item)'
      
        '    inner join fornecedor f on (f.cod_fornecedor = en.cod_fornec' +
        'edor)'
      'where  en.data_entrada between '#39'01.01.2018'#39' and '#39'31.01.2019'#39
      ' and en.cod_fornecedor like '#39'%'#39
      ' and  vi.cod_item='#39'00352'#39
      '  order by en.data_entrada desc')
    Left = 992
    Top = 272
  end
  object dtComprasPorItem: TfrxDBDataset
    UserName = 'dtComprasPorItem'
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
      'QUANTIDADEPARAMETRO=QUANTIDADEPARAMETRO'
      'SUBTOTAL=SUBTOTAL'
      'DESCONTO1=DESCONTO1'
      'OUTRAS_DESPESAS1=OUTRAS_DESPESAS1'
      'ALIQUOTA_IPI1=ALIQUOTA_IPI1'
      'TOTAL=TOTAL'
      'UNIDADECOMPRA=UNIDADECOMPRA'
      'COD_FORNECEDOR=COD_FORNECEDOR'
      'NOMEFORNECEDOR=NOMEFORNECEDOR'
      'DATA_ENTRADA1=DATA_ENTRADA1'
      'NOME_USUARIO_ENTRADA=NOME_USUARIO_ENTRADA'
      'NUMERO_NOTA=NUMERO_NOTA'
      'DATA=DATA'
      'HORA=HORA'
      'COD_G_RAIZ=COD_G_RAIZ'
      'DESC_G_RAIZ=DESC_G_RAIZ'
      'COD_G_PAI=COD_G_PAI'
      'DESC_G_PAI=DESC_G_PAI'
      'COD_GRUPO=COD_GRUPO'
      'DESC_GRUPO=DESC_GRUPO'
      'PARAMETROUNIDADEENTRADA=PARAMETROUNIDADEENTRADA'
      'DESCUNIDADEENTRADA=DESCUNIDADEENTRADA'
      'PARAMETROUNIDADEFRACAO=PARAMETROUNIDADEFRACAO'
      'DESCUNIDADEFRACAO=DESCUNIDADEFRACAO'
      'ESTOQUEANTERIOR=ESTOQUEANTERIOR'
      'ESTOQUEATUALIZADO=ESTOQUEATUALIZADO')
    DataSet = qryComprasItem
    BCDToCurrency = False
    Left = 1072
    Top = 272
  end
  object qryItemMaisBaratoPeriodo: TIBQuery
    Database = dm.dbrestaurante
    Transaction = dm.transacao
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      'select ite.*,e.*,f.razao_social'
      '  from itens_entrada ite'
      '  inner join entradas e on (e.cod_entrada = ite.cod_entrada)'
      
        '  inner join fornecedor f on (f.cod_fornecedor = e.cod_fornecedo' +
        'r)'
      
        '  where ite.valor_unitario  = (select min(ite2.valor_unitario) f' +
        'rom itens_entrada ite2'
      
        '                               inner join entradas en on (en.cod' +
        '_entrada  = ite2.cod_entrada)'
      
        '                               where en.data between '#39'01.06.2011' +
        #39' and '#39'21.06.2011'#39
      '                              and ite2.cod_item = '#39'00008'#39
      '                              and en.cod_fornecedor    like '#39'%'#39')'
      '  and e.data between '#39'01.06.2011'#39' and '#39'21.06.2011'#39
      '  and ite.cod_item = '#39'00008'#39
      '  and e.cod_fornecedor    like '#39'%'#39
      '')
    Left = 120
    Top = 360
  end
  object dtItemMaisBaratoPeriodo: TfrxDBDataset
    UserName = 'dtItemMaisBaratoPeriodo'
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
      'COD_ENTRADA1=COD_ENTRADA1'
      'COD_FORNECEDOR=COD_FORNECEDOR'
      'NOME_FANTASIA_FORNECEDOR=NOME_FANTASIA_FORNECEDOR'
      'COD_USUARIO=COD_USUARIO'
      'QTDE_ITENS=QTDE_ITENS'
      'DATA=DATA'
      'HORA=HORA'
      'NOME_USUARIO_ENTRADA=NOME_USUARIO_ENTRADA'
      'CNPJ=CNPJ'
      'IE=IE'
      'UF=UF'
      'DATA_EMISSAO=DATA_EMISSAO'
      'DATA_ENTRADA=DATA_ENTRADA'
      'NUMERO_NOTA=NUMERO_NOTA'
      'SERIE_NOTA=SERIE_NOTA'
      'MODELO_NOTA=MODELO_NOTA'
      'CFOP_NOTA=CFOP_NOTA'
      'BASE_ICMS1=BASE_ICMS1'
      'VALOR_ICMS1=VALOR_ICMS1'
      'BASE_ICMS_SUBST=BASE_ICMS_SUBST'
      'VALOR_ICMS_SUBST=VALOR_ICMS_SUBST'
      'VALOR_PRODUTOS=VALOR_PRODUTOS'
      'FRETE=FRETE'
      'SEGURO=SEGURO'
      'DESCONTO1=DESCONTO1'
      'OUTRAS_DESPESAS=OUTRAS_DESPESAS'
      'VALOR_IPI1=VALOR_IPI1'
      'TOTAL_NOTA=TOTAL_NOTA'
      'RAZAO_SOCIAL=RAZAO_SOCIAL')
    DataSet = qryItemMaisBaratoPeriodo
    BCDToCurrency = False
    Left = 120
    Top = 408
  end
  object dtItemMaisCaroPeriodo: TfrxDBDataset
    UserName = 'dtItemMaisCaroPeriodo'
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
      'COD_ENTRADA1=COD_ENTRADA1'
      'COD_FORNECEDOR=COD_FORNECEDOR'
      'NOME_FANTASIA_FORNECEDOR=NOME_FANTASIA_FORNECEDOR'
      'COD_USUARIO=COD_USUARIO'
      'QTDE_ITENS=QTDE_ITENS'
      'DATA=DATA'
      'HORA=HORA'
      'NOME_USUARIO_ENTRADA=NOME_USUARIO_ENTRADA'
      'CNPJ=CNPJ'
      'IE=IE'
      'UF=UF'
      'DATA_EMISSAO=DATA_EMISSAO'
      'DATA_ENTRADA=DATA_ENTRADA'
      'NUMERO_NOTA=NUMERO_NOTA'
      'SERIE_NOTA=SERIE_NOTA'
      'MODELO_NOTA=MODELO_NOTA'
      'CFOP_NOTA=CFOP_NOTA'
      'BASE_ICMS1=BASE_ICMS1'
      'VALOR_ICMS1=VALOR_ICMS1'
      'BASE_ICMS_SUBST=BASE_ICMS_SUBST'
      'VALOR_ICMS_SUBST=VALOR_ICMS_SUBST'
      'VALOR_PRODUTOS=VALOR_PRODUTOS'
      'FRETE=FRETE'
      'SEGURO=SEGURO'
      'DESCONTO1=DESCONTO1'
      'OUTRAS_DESPESAS=OUTRAS_DESPESAS'
      'VALOR_IPI1=VALOR_IPI1'
      'TOTAL_NOTA=TOTAL_NOTA'
      'RAZAO_SOCIAL=RAZAO_SOCIAL')
    DataSet = qryItemMaisCaroPeriodo
    BCDToCurrency = False
    Left = 168
    Top = 408
  end
  object qryItemMaisCaroPeriodo: TIBQuery
    Database = dm.dbrestaurante
    Transaction = dm.transacao
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      'select ite.*,e.*,f.razao_social'
      '  from itens_entrada ite'
      '  inner join entradas e on (e.cod_entrada = ite.cod_entrada)'
      
        '  inner join fornecedor f on (f.cod_fornecedor = e.cod_fornecedo' +
        'r) '
      
        '  where ite.valor_unitario  = (select max(ite2.valor_unitario) f' +
        'rom itens_entrada ite2'
      
        '                               inner join entradas en on (en.cod' +
        '_entrada  = ite2.cod_entrada)'
      
        '                               where en.data between '#39'01.06.2011' +
        #39' and '#39'21.06.2011'#39
      '                              and ite2.cod_item = '#39'00008'#39
      '                              and en.cod_fornecedor    like '#39'%'#39')'
      '  and e.data between '#39'01.06.2011'#39' and '#39'21.06.2011'#39
      '  and ite.cod_item = '#39'00008'#39
      '  and e.cod_fornecedor    like '#39'%'#39
      '')
    Left = 168
    Top = 360
  end
  object qryCaixas: TIBQuery
    Database = dm.dbrestaurante
    Transaction = dm.transacao
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      ''
      ''
      ' select c.*, cf.descricao  from caixas c'
      
        '  inner join configuracoes_estacao cf on (c.numero_caixa  = cf.n' +
        'umero_caixa )')
    UpdateObject = updQryCaixas
    Left = 216
    Top = 504
    object qryCaixasCODIGO: TIBStringField
      FieldName = 'CODIGO'
      Origin = 'CAIXAS.CODIGO'
      Required = True
      Size = 5
    end
    object qryCaixasDATA_ABERTURA: TDateField
      FieldName = 'DATA_ABERTURA'
      Origin = 'CAIXAS.DATA_ABERTURA'
    end
    object qryCaixasHORA_ABERTURA: TTimeField
      FieldName = 'HORA_ABERTURA'
      Origin = 'CAIXAS.HORA_ABERTURA'
    end
    object qryCaixasDATA_FECHAMENTO: TDateField
      FieldName = 'DATA_FECHAMENTO'
      Origin = 'CAIXAS.DATA_FECHAMENTO'
    end
    object qryCaixasHORA_FECHAMENTO: TTimeField
      FieldName = 'HORA_FECHAMENTO'
      Origin = 'CAIXAS.HORA_FECHAMENTO'
    end
    object qryCaixasSUPRIMENTO_INICIAL: TIBBCDField
      FieldName = 'SUPRIMENTO_INICIAL'
      Origin = 'CAIXAS.SUPRIMENTO_INICIAL'
      Precision = 18
      Size = 2
    end
    object qryCaixasTOTAL_RECEBIMENTOS: TIBBCDField
      FieldName = 'TOTAL_RECEBIMENTOS'
      Origin = 'CAIXAS.TOTAL_RECEBIMENTOS'
      currency = True
      Precision = 18
      Size = 2
    end
    object qryCaixasTOTAL_SUPRIMENTOS: TIBBCDField
      FieldName = 'TOTAL_SUPRIMENTOS'
      Origin = 'CAIXAS.TOTAL_SUPRIMENTOS'
      currency = True
      Precision = 18
      Size = 2
    end
    object qryCaixasTOTAL_SANGRIAS: TIBBCDField
      FieldName = 'TOTAL_SANGRIAS'
      Origin = 'CAIXAS.TOTAL_SANGRIAS'
      currency = True
      Precision = 18
      Size = 2
    end
    object qryCaixasCOD_USUARIO: TIBStringField
      FieldName = 'COD_USUARIO'
      Origin = 'CAIXAS.COD_USUARIO'
      Size = 3
    end
    object qryCaixasNOME_USUARIO: TIBStringField
      FieldName = 'NOME_USUARIO'
      Origin = 'CAIXAS.NOME_USUARIO'
      Size = 15
    end
    object qryCaixasNUMERO_CAIXA: TIBStringField
      FieldName = 'NUMERO_CAIXA'
      Origin = 'CAIXAS.NUMERO_CAIXA'
      Size = 3
    end
    object qryCaixasSTATUS: TSmallintField
      FieldName = 'STATUS'
      Origin = 'CAIXAS.STATUS'
    end
    object qryCaixasDATA_SISTEMA: TDateField
      FieldName = 'DATA_SISTEMA'
      Origin = 'CAIXAS.DATA_SISTEMA'
    end
    object qryCaixasCOBRA_SERVICO: TSmallintField
      FieldName = 'COBRA_SERVICO'
      Origin = 'CAIXAS.COBRA_SERVICO'
    end
    object qryCaixasTURNO: TSmallintField
      FieldName = 'TURNO'
      Origin = 'CAIXAS.TURNO'
    end
    object qryCaixasSELECIONADO: TSmallintField
      FieldName = 'SELECIONADO'
      Origin = 'CAIXAS.SELECIONADO'
      Required = True
    end
    object qryCaixasDESCRICAO: TIBStringField
      FieldName = 'DESCRICAO'
      Origin = 'CONFIGURACOES_ESTACAO.DESCRICAO'
      Required = True
      Size = 15
    end
  end
  object dsCaixas: TDataSource
    DataSet = qryCaixas
    Left = 256
    Top = 560
  end
  object qryVendas: TIBQuery
    Database = dm.dbrestaurante
    Transaction = dm.transacao
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = False
    SQL.Strings = (
      'select * from vendas where cod_caixa='#39'01407'#39)
    Left = 368
    Top = 464
  end
  object dsQryVendas: TDataSource
    DataSet = qryVendas
    Enabled = False
    Left = 368
    Top = 512
  end
  object dtVendas: TfrxDBDataset
    UserName = 'dtVendas'
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
      'TIPO_VENDA=TIPO_VENDA')
    DataSet = qryVendas
    BCDToCurrency = False
    Left = 368
    Top = 560
  end
  object qryRecebimentos: TIBQuery
    Database = dm.dbrestaurante
    Transaction = dm.transacao
    BufferChunks = 1000
    CachedUpdates = False
    DataSource = dsQryVendas
    ParamCheck = True
    SQL.Strings = (
      'select r.*,f.descricao from recebimentos r'
      ' inner join formas_pagamento f on (f.cod_forma = r.cod_forma)'
      ' where r.cod_venda = :cod_venda')
    Left = 432
    Top = 464
    ParamData = <
      item
        DataType = ftString
        Name = 'COD_VENDA'
        ParamType = ptUnknown
        Size = 9
      end>
  end
  object dtRecebimentos: TfrxDBDataset
    UserName = 'dtRecebimentos'
    CloseDataSource = False
    DataSet = qryRecebimentos
    BCDToCurrency = False
    Left = 448
    Top = 520
  end
  object qryComposicoesProduto: TIBQuery
    Database = dm.dbrestaurante
    Transaction = dm.transacao
    BufferChunks = 1000
    CachedUpdates = False
    DataSource = dsQryProdutos
    ParamCheck = True
    SQL.Strings = (
      'select  * from v_ficha_tecnica vf'
      '  where vf.cod_produto= :cod_produto'
      '')
    Left = 728
    Top = 264
    ParamData = <
      item
        DataType = ftString
        Name = 'COD_PRODUTO'
        ParamType = ptUnknown
        Size = 6
      end>
  end
  object dsComposicoesProduto: TDataSource
    DataSet = qryComposicoesProduto
    Left = 728
    Top = 312
  end
  object dsQryProdutos: TDataSource
    DataSet = qryProdutos
    Left = 96
    Top = 192
  end
  object dtComposicoesProduto: TfrxDBDataset
    UserName = 'dtComposicoesProduto'
    CloseDataSource = False
    FieldAliases.Strings = (
      'COD_PRODUTO=COD_PRODUTO'
      'COD_ITEM=COD_ITEM'
      'DESCRICAO_ITEM=DESCRICAO_ITEM'
      'QUANTIDADE=QUANTIDADE'
      'DESC_UN_SAIDA=DESC_UN_SAIDA'
      'PARAM_UN_SAIDA=PARAM_UN_SAIDA'
      'DESC_UN_ENTRADA=DESC_UN_ENTRADA'
      'PARAM_UN_ENTRADA=PARAM_UN_ENTRADA'
      'VALOR_CUSTO_ENTRADA=VALOR_CUSTO_ENTRADA'
      'CUSTO_SAIDA=CUSTO_SAIDA')
    DataSource = dsComposicoesProduto
    BCDToCurrency = False
    Left = 728
    Top = 360
  end
  object qryBaixasManuais: TIBQuery
    Database = dm.dbrestaurante
    Transaction = dm.transacao
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      'select * from v_baixas_estoque order by cod_grupo')
    Left = 16
    Top = 456
  end
  object dtBaixasManuais: TfrxDBDataset
    UserName = 'dtBaixasManuais'
    CloseDataSource = False
    FieldAliases.Strings = (
      'COD_BAIXA=COD_BAIXA'
      'DATA=DATA'
      'HORA=HORA'
      'COD_ITEM=COD_ITEM'
      'COD_TIPO=COD_TIPO'
      'OBSERVACOES=OBSERVACOES'
      'USUARIO=USUARIO'
      'DESCRICAO_ITEM=DESCRICAO_ITEM'
      'COD_UNIDADE=COD_UNIDADE'
      'QUANTIDADE=QUANTIDADE'
      'DESCRICAOUNSAIDA=DESCRICAOUNSAIDA'
      'CUSTOBAIXA=CUSTOBAIXA'
      'ESTOQUEANTERIOR=ESTOQUEANTERIOR'
      'ESTOQUEATUALIZADO=ESTOQUEATUALIZADO'
      'COD_G_RAIZ=COD_G_RAIZ'
      'DESC_G_RAIZ=DESC_G_RAIZ'
      'COD_G_PAI=COD_G_PAI'
      'DESC_G_PAI=DESC_G_PAI'
      'COD_GRUPO=COD_GRUPO'
      'DESC_GRUPO=DESC_GRUPO'
      'DESCRICAOTIPO=DESCRICAOTIPO'
      'IDBAIXA=IDBAIXA')
    DataSet = qryBaixasManuais
    BCDToCurrency = False
    Left = 16
    Top = 504
  end
  object qryBaixasManuaisSintetico: TIBQuery
    Database = dm.dbrestaurante
    Transaction = dm.transacao
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      ''
      
        'select b.*,vi.cod_g_raiz,vi.desc_g_raiz,vi.cod_g_pai,vi.desc_g_p' +
        'ai,vi.cod_grupo,vi.desc_grupo     from r_baixas_manuais_sintetic' +
        'o('#39'01.01.2011'#39','#39'30.06.2011'#39','#39#39') b'
      ' inner join v_itens_estoque vi on (vi.cod_item = b.cod_item)')
    Left = 96
    Top = 456
  end
  object dtBaixasManuaisSintetico: TfrxDBDataset
    UserName = 'dtBaixasManuaisSintetico'
    CloseDataSource = False
    FieldAliases.Strings = (
      'COD_ITEM=COD_ITEM'
      'DESCRICAO=DESCRICAO'
      'TOTAL_BAIXAS=TOTAL_BAIXAS'
      'CUSTO_BAIXAS=CUSTO_BAIXAS'
      'PARTEINTEIRAESTOQUE=PARTEINTEIRAESTOQUE'
      'FRACAOESTOQUE=FRACAOESTOQUE'
      'COD_G_RAIZ=COD_G_RAIZ'
      'DESC_G_RAIZ=DESC_G_RAIZ'
      'COD_G_PAI=COD_G_PAI'
      'DESC_G_PAI=DESC_G_PAI'
      'COD_GRUPO=COD_GRUPO'
      'DESC_GRUPO=DESC_GRUPO')
    DataSet = qryBaixasManuaisSintetico
    BCDToCurrency = False
    Left = 96
    Top = 504
  end
  object qrySaidas: TIBQuery
    Database = dm.dbrestaurante
    Transaction = dm.transacao
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      
        '   select s.*, f.razao_social, m.descricao as desc_modelo, c.des' +
        'cricao as desc_cfop'
      '     from saidas s'
      
        '       inner join fornecedor f on (f.cod_fornecedor = s.cod_forn' +
        'ecedor)'
      '       inner join modelos_nf m on (m.codigo = s.modelo_nota)'
      '       inner join cfop c on (c.codigo = s.cfop_nota)'
      '     where s.data_saida between '#39'01.08.2011'#39' and '#39'12.12.2011'#39
      ' and s.cod_fornecedor like '#39'%'#39
      ' order by s.cod_saida')
    Left = 576
    Top = 88
  end
  object dsQrySaidas: TDataSource
    DataSet = qrySaidas
    Left = 576
    Top = 136
  end
  object dtSaidas: TfrxDBDataset
    UserName = 'dtSaidas'
    CloseDataSource = False
    FieldAliases.Strings = (
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
      'RAZAO_SOCIAL=RAZAO_SOCIAL'
      'DESC_MODELO=DESC_MODELO'
      'DESC_CFOP=DESC_CFOP')
    DataSet = qrySaidas
    BCDToCurrency = False
    Left = 632
    Top = 136
  end
  object qryItensSaidas: TIBQuery
    Database = dm.dbrestaurante
    Transaction = dm.transacao
    BufferChunks = 1000
    CachedUpdates = False
    DataSource = dsQrySaidas
    ParamCheck = True
    SQL.Strings = (
      ''
      
        'select isa.*, (isa.quantidade * isa.valor_unitario) as totalSaid' +
        'a,u.descricao as UnidadeEstoqueAnterior'
      '  from  itens_saida  isa'
      '  inner join unidades u on  ( u.cod_unidade = isa.cod_unidade)'
      '  where isa.cod_saida = :cod_saida'
      '')
    Left = 632
    Top = 88
    ParamData = <
      item
        DataType = ftString
        Name = 'COD_SAIDA'
        ParamType = ptUnknown
        Size = 9
      end>
  end
  object dtItensSaidas: TfrxDBDataset
    UserName = 'dtItensSaidas'
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
      'TOTALSAIDA=TOTALSAIDA'
      'UNIDADEESTOQUEANTERIOR=UNIDADEESTOQUEANTERIOR')
    DataSet = qryItensSaidas
    BCDToCurrency = False
    Left = 680
    Top = 136
  end
  object qryCartoes: TIBQuery
    Database = dm.dbrestaurante
    Transaction = dm.transacao
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      'select cod_cartao from cartoes order by cod_cartao')
    Left = 320
    Top = 128
  end
  object dtCartoes: TfrxDBDataset
    UserName = 'dtCartoes'
    CloseDataSource = False
    FieldAliases.Strings = (
      'COD_CARTAO=COD_CARTAO')
    DataSet = qryCartoes
    BCDToCurrency = False
    Left = 400
    Top = 128
  end
  object QryFundoCartoes: TIBQuery
    Database = dm.dbrestaurante
    Transaction = dm.transacao
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      'select * from fundo_cartoes ')
    Left = 321
    Top = 176
  end
  object dtFundoCartoes: TfrxDBDataset
    UserName = 'dtFundoCartoes'
    CloseDataSource = False
    FieldAliases.Strings = (
      'COD_CARTAO=COD_CARTAO')
    DataSet = QryFundoCartoes
    BCDToCurrency = False
    Left = 392
    Top = 176
  end
  object dtComprasGrupoAnalitico: TfrxDBDataset
    UserName = 'dtComprasGrupoAnalitico'
    CloseDataSource = False
    FieldAliases.Strings = (
      'COD_ITEM=COD_ITEM'
      'DESCRICAO_ITEM=DESCRICAO_ITEM'
      'PRECO_MEDIO=PRECO_MEDIO'
      'QUANTIDADE=QUANTIDADE'
      'SUBTOTAL=SUBTOTAL'
      'DESCONTO=DESCONTO'
      'IPI=IPI'
      'OUTRAS=OUTRAS'
      'UNIDADEESTOQUEANTERIOR=UNIDADEESTOQUEANTERIOR'
      'COD_G_RAIZ=COD_G_RAIZ'
      'DESC_G_RAIZ=DESC_G_RAIZ'
      'COD_G_PAI=COD_G_PAI'
      'DESC_G_PAI=DESC_G_PAI'
      'COD_GRUPO=COD_GRUPO'
      'DESC_GRUPO=DESC_GRUPO'
      'CUSTO_MEDIO=CUSTO_MEDIO'
      'TOTAL=TOTAL')
    DataSet = qryComprasPorGrupo
    BCDToCurrency = False
    Left = 992
    Top = 544
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
    ReportOptions.CreateDate = 40272.535530046300000000
    ReportOptions.LastChange = 43609.538530173610000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    OnGetValue = rptGetValue
    OnReportPrint = 'frxReportOnReportPrint'
    Left = 248
    Top = 61
    Datasets = <
      item
        DataSet = dtNFCEEnviadas
        DataSetName = 'dtNFCEEnviadas'
      end
      item
        DataSet = dtNotasInutilizadas
        DataSetName = 'dtNotasInutilizadas'
      end
      item
        DataSet = dtParametros
        DataSetName = 'dtParametros'
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
        Fill.BackColor = clGray
      end
      item
        Name = 'Header'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clMaroon
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
      end
      item
        Name = 'Group header'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clMaroon
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        Fill.BackColor = 16053492
      end
      item
        Name = 'Data'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
      end
      item
        Name = 'Group footer'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
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
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      object ReportTitle1: TfrxReportTitle
        FillType = ftBrush
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        Height = 120.944960000000000000
        ParentFont = False
        Top = 18.897650000000000000
        Width = 718.110700000000000000
        object Shape1: TfrxShapeView
          Left = 3.779530000000000000
          Top = 3.779530000000000000
          Width = 714.331170000000000000
          Height = 102.047310000000000000
        end
        object dtParametrosNOME_FANTASIA: TfrxMemoView
          Left = 7.000000000000000000
          Top = 32.236240000000000000
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
          Memo.UTF8W = (
            '[dtParametros."NOME_FANTASIA"]')
          ParentFont = False
        end
        object Memo1: TfrxMemoView
          Left = 621.622450000000000000
          Top = 26.456710000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            '[Time]')
          ParentFont = False
        end
        object Memo18: TfrxMemoView
          Align = baCenter
          Left = -162.519790000000000000
          Top = 58.692950000000000000
          Width = 1043.150280000000000000
          Height = 22.677180000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            'RELAT'#211'RIO DE NUMERA'#199#213'ES DE NF-E / NFC-E  INUTILIZADAS')
          ParentFont = False
        end
        object Memo20: TfrxMemoView
          Left = 621.622450000000000000
          Top = 4.000000000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            '[Date]')
          ParentFont = False
        end
        object dtParametrosRAZAO_SOCIAL: TfrxMemoView
          Left = 7.000000000000000000
          Top = 5.779530000000000000
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
          Memo.UTF8W = (
            '[dtParametros."RAZAO_SOCIAL"]')
          ParentFont = False
        end
        object Memo12: TfrxMemoView
          Left = 234.330860000000000000
          Top = 83.149660000000000000
          Width = 279.685220000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            '[PeriodoRelatorio]')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object PageFooter1: TfrxPageFooter
        FillType = ftBrush
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        Height = 45.354360000000000000
        ParentFont = False
        Top = 385.512060000000000000
        Width = 718.110700000000000000
        object Memo21: TfrxMemoView
          Align = baWidth
          Top = 6.000000000000110000
          Width = 718.110700000000000000
          Frame.Typ = [ftTop]
          Frame.Width = 2.000000000000000000
        end
        object Memo22: TfrxMemoView
          Align = baRight
          Left = 642.520100000000000000
          Top = 16.559060000000000000
          Width = 75.590600000000000000
          Height = 22.677180000000000000
          DisplayFormat.DecimalSeparator = ','
          Memo.UTF8W = (
            'P'#225'gina [Page#]/[TotalPages#]')
        end
        object Memo23: TfrxMemoView
          Left = 3.779530000000000000
          Top = 9.070866139999910000
          Width = 313.700990000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsItalic]
          Memo.UTF8W = (
            'Real Manager - Sistema de Automa'#231#227'o Comercial')
          ParentFont = False
        end
        object Memo24: TfrxMemoView
          Left = 3.779530000000000000
          Top = 22.677179999999700000
          Width = 313.700990000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsItalic]
          Memo.UTF8W = (
            'www.realsoftwaresba.com.br')
          ParentFont = False
        end
      end
      object MasterData1: TfrxMasterData
        FillType = ftBrush
        Height = 18.897650000000000000
        Top = 260.787570000000000000
        Width = 718.110700000000000000
        DataSet = dtNotasInutilizadas
        DataSetName = 'dtNotasInutilizadas'
        RowCount = 0
        object Memo8: TfrxMemoView
          Left = 336.378170000000000000
          Width = 381.732530000000000000
          Height = 18.897650000000000000
          DataField = 'OBS'
          DataSet = dtNotasInutilizadas
          DataSetName = 'dtNotasInutilizadas'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            '[dtNotasInutilizadas."OBS"]')
          ParentFont = False
        end
        object Memo4: TfrxMemoView
          Left = 37.795300000000000000
          Width = 86.929190000000000000
          Height = 18.897650000000000000
          DataSet = dtNotasInutilizadas
          DataSetName = 'dtNotasInutilizadas'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            '[dtNotasInutilizadas."SERIE"] / [dtNotasInutilizadas."NOTA"]')
          ParentFont = False
        end
        object Memo3: TfrxMemoView
          Left = 124.724490000000000000
          Width = 86.929190000000000000
          Height = 18.897650000000000000
          DataField = 'DATA_HORA_INUTILIZACAO'
          DataSet = dtNotasInutilizadas
          DataSetName = 'dtNotasInutilizadas'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            '[dtNotasInutilizadas."DATA_HORA_INUTILIZACAO"]')
          ParentFont = False
        end
        object Memo7: TfrxMemoView
          Left = 215.433210000000000000
          Width = 120.944960000000000000
          Height = 18.897650000000000000
          DataField = 'PROTOCOLO'
          DataSet = dtNotasInutilizadas
          DataSetName = 'dtNotasInutilizadas'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            '[dtNotasInutilizadas."PROTOCOLO"]')
          ParentFont = False
        end
      end
      object GroupHeader2: TfrxGroupHeader
        FillType = ftBrush
        Height = 37.795300000000000000
        Top = 200.315090000000000000
        Width = 718.110700000000000000
        Condition = 'dtNotasInutilizadas."MODELO_NOTA"'
        object Memo28: TfrxMemoView
          Width = 419.527830000000000000
          Height = 18.897650000000000000
          DataSet = dtNFCEEnviadas
          DataSetName = 'dtNFCEEnviadas'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            '[dtNotasInutilizadas."MODELO_NOTA"]')
          ParentFont = False
        end
        object Memo10: TfrxMemoView
          Left = 37.795300000000000000
          Top = 18.897650000000000000
          Width = 86.929190000000000000
          Height = 18.897650000000000000
          DataSet = dtNFCEEnviadas
          DataSetName = 'dtNFCEEnviadas'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Fill.BackColor = 15790320
          HAlign = haCenter
          Memo.UTF8W = (
            'S'#233'rie / Nota')
          ParentFont = False
        end
        object Memo14: TfrxMemoView
          Left = 211.653680000000000000
          Top = 18.897650000000000000
          Width = 124.724490000000000000
          Height = 18.897650000000000000
          DataSet = dtNFCEEnviadas
          DataSetName = 'dtNFCEEnviadas'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Fill.BackColor = 15790320
          HAlign = haCenter
          Memo.UTF8W = (
            'N'#186' do Protocolo')
          ParentFont = False
        end
        object Memo15: TfrxMemoView
          Left = 334.598640000000000000
          Top = 18.897650000000000000
          Width = 385.512060000000000000
          Height = 18.897650000000000000
          DataSet = dtNFCEEnviadas
          DataSetName = 'dtNFCEEnviadas'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Fill.BackColor = 15790320
          HAlign = haCenter
          Memo.UTF8W = (
            'Observa'#231#227'o')
          ParentFont = False
        end
        object Memo2: TfrxMemoView
          Left = 124.724490000000000000
          Top = 18.897650000000000000
          Width = 86.929190000000000000
          Height = 18.897650000000000000
          DataSet = dtNFCEEnviadas
          DataSetName = 'dtNFCEEnviadas'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Fill.BackColor = 15790320
          HAlign = haCenter
          Memo.UTF8W = (
            'Data')
          ParentFont = False
        end
      end
      object GroupFooter2: TfrxGroupFooter
        FillType = ftBrush
        Height = 22.677180000000000000
        Top = 302.362400000000000000
        Width = 718.110700000000000000
        object Memo32: TfrxMemoView
          Left = 336.378170000000000000
          Width = 381.732530000000000000
          Height = 18.897650000000000000
          DataSet = dtNFCEEnviadas
          DataSetName = 'dtNFCEEnviadas'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Fill.BackColor = 15790320
          HAlign = haCenter
          Memo.UTF8W = (
            'total de [COUNT(MasterData1)] n'#250'meros inutilizados')
          ParentFont = False
        end
      end
    end
  end
  object frxXLSXExport1: TfrxXLSXExport
    UseFileCache = True
    ShowProgress = True
    OverwritePrompt = False
    DataOnly = False
    ChunkSize = 0
    ExportPageBreaks = False
    PictureType = gpPNG
    Left = 435
    Top = 69
  end
  object frxHTML5DivExport1: TfrxHTML5DivExport
    UseFileCache = True
    ShowProgress = True
    OverwritePrompt = False
    DataOnly = False
    OpenAfterExport = False
    HTML5 = True
    MultiPage = False
    Formatted = False
    PictureFormat = pfPNG
    AllPictures = False
    UnifiedPictures = True
    EmbeddedPictures = True
    Navigation = False
    ExportAnchors = True
    EmbeddedCSS = True
    PictureTag = 0
    Left = 372
    Top = 21
  end
  object frxHTML4DivExport1: TfrxHTML4DivExport
    UseFileCache = True
    ShowProgress = True
    OverwritePrompt = False
    DataOnly = False
    OpenAfterExport = False
    HTML5 = False
    MultiPage = False
    Formatted = False
    PictureFormat = pfPNG
    AllPictures = False
    UnifiedPictures = True
    EmbeddedPictures = False
    Navigation = False
    ExportAnchors = True
    EmbeddedCSS = False
    PictureTag = 0
    Left = 404
    Top = 21
  end
  object frxPDFExport1: TfrxPDFExport
    FileName = 'C:\Users\JOAO\Desktop\itens comprados rd novembro.pdf'
    UseFileCache = True
    ShowProgress = True
    OverwritePrompt = False
    CreationTime = 43549.669186319440000000
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
    CenterWindow = False
    PrintScaling = False
    Left = 506
    Top = 21
  end
  object frxXLSExport1: TfrxXLSExport
    FileName = 'C:\Users\JOAO\Desktop\nova exp.xls'
    UseFileCache = True
    ShowProgress = True
    OverwritePrompt = False
    CreationTime = 42705.487567118060000000
    DataOnly = False
    ExportEMF = True
    ExportPictures = False
    OpenExcelAfterExport = True
    Wysiwyg = False
    AsText = False
    Background = False
    FastExport = False
    PageBreaks = False
    EmptyLines = True
    SuppressPageHeadersFooters = False
    Left = 343
    Top = 68
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
    Left = 472
    Top = 21
  end
  object qryNFCEEnviadas: TIBQuery
    Database = dm.dbrestaurante
    Transaction = dm.transacao
    Active = True
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      'select v2.*,'
      '  case v2.modelo_comprovante '
      '    WHEN 2 THEN '#39'NFC-e (MODELO 65)'#39
      '    WHEN 3 THEN '#39'NFC-e (MODELO 55)'#39
      '   END as modelo_nota ,'
      ''
      ' case v2.cancelada'
      '   when 0 then v2.valor_total'
      '   when 1 then 0'
      ' end as valor_fiscal,'
      ''
      ' case v2.cancelada'
      '   when 0 then '#39'AUTORIZADA'#39
      '   when 1 then '#39'CANCELADA'#39
      ' end as STATUS_NOTA'
      ''
      '   from ( '
      
        ' select 1 as tipoOperacao, 0 as cancelada, v.cod_venda,v.valor_t' +
        'otal, v.numero_caixa, v.data_so, v.hora,v.modelo_comprovante,  v' +
        '.serie_nfce,v.numero_nfce, v.protocolo_nfce, v.chave_nfce, v.xml' +
        '_doc, v.obs_nfce'
      
        '    from vendas v where v.chave_nfce <> '#39#39' and v.data_so between' +
        ' '#39'01.12.2017'#39' and '#39'31.12.2017'#39
      ' union all '
      
        ' select 1 as tipoOperacao, 1 as cancelada, v.cod_venda,v.valor_t' +
        'otal, v.numero_caixa, v.data_so, v.hora,v.modelo_comprovante,  v' +
        '.serie_nfce,v.numero_nfce, v.protocolo_nfce, v.chave_nfce, v.xml' +
        '_doc, v.obs_nfce'
      
        '    from vendas_canceladas v where v.chave_nfce <> '#39#39' and v.data' +
        '_so between '#39'01.12.2017'#39' and '#39'31.12.2017'#39
      '               ) v2 '
      
        '               order by v2.data_so,v2.modelo_comprovante,v2.tipo' +
        'Operacao,v2.serie_nfce,v2.numero_nfce ')
    Left = 832
    Top = 264
  end
  object dtNFCEEnviadas: TfrxDBDataset
    UserName = 'dtNFCEEnviadas'
    CloseDataSource = False
    FieldAliases.Strings = (
      'TIPOOPERACAO=TIPOOPERACAO'
      'CANCELADA=CANCELADA'
      'COD_VENDA=COD_VENDA'
      'VALOR_TOTAL=VALOR_TOTAL'
      'NUMERO_CAIXA=NUMERO_CAIXA'
      'DATA_SO=DATA_SO'
      'HORA=HORA'
      'MODELO_COMPROVANTE=MODELO_COMPROVANTE'
      'SERIE_NFCE=SERIE_NFCE'
      'NUMERO_NFCE=NUMERO_NFCE'
      'PROTOCOLO_NFCE=PROTOCOLO_NFCE'
      'CHAVE_NFCE=CHAVE_NFCE'
      'XML_DOC=XML_DOC'
      'MODELO_NOTA=MODELO_NOTA')
    DataSet = qryNFCEEnviadas
    BCDToCurrency = False
    Left = 832
    Top = 304
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
    Left = 776
    Top = 32
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
    Left = 856
    Top = 32
  end
  object dtQryRD: TfrxDBDataset
    UserName = 'frxDBDataset2'
    CloseDataSource = False
    FieldAliases.Strings = (
      'RESULTADO=RESULTADO'
      'MES=MES'
      'ANO=ANO'
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
    DataSet = dm.qryProjecaoDespesasRD
    BCDToCurrency = False
    Left = 784
    Top = 192
  end
  object qryNotasRDPeriodo: TIBQuery
    Database = dm.dbrestaurante
    Transaction = dm.transacao
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      
        'select n.codigo, n.cod_fornecedor, f.razao_social, n.num_doc,n.d' +
        'ata_documento,n.data_lancamento, n.data_rd,c.data_vencimento,  n' +
        '.observacoes,  n.total as total_nota,  ( select sum(itr.valor) f' +
        'rom itens_lancamento_rd'
      
        '             itr where (itr.cod_lanc_rd  = n.codigo) and (itr.co' +
        'd_grupo starting '#39'101'#39')'
      '             ) as total_lancamentos'
      ' from ('
      'select * from  lancamentos_rd lr where'
      
        '  lr.codigo in ( select distinct itr.cod_lanc_rd   from itens_la' +
        'ncamento_rd itr'
      '                 where itr.cod_grupo starting  '#39'101'#39' )'
      
        '                 and  lr.data_rd between '#39'01.05.2016'#39' and '#39'31.05' +
        '.2016'#39
      ''
      '        )  n'
      ''
      
        '        inner join fornecedor f on (f.cod_fornecedor = n.cod_for' +
        'necedor)'
      
        '        left join contas_a_pagar c on (c.codigo = n.cod_ct_pagar' +
        ')'
      ''
      '      order by n.data_rd,f.razao_social, n.total')
    Left = 648
    Top = 424
    object qryNotasRDPeriodoCODIGO: TIBStringField
      FieldName = 'CODIGO'
      Origin = 'LANCAMENTOS_RD.CODIGO'
      Required = True
      Size = 8
    end
    object qryNotasRDPeriodoCOD_FORNECEDOR: TIBStringField
      FieldName = 'COD_FORNECEDOR'
      Origin = 'LANCAMENTOS_RD.COD_FORNECEDOR'
      Required = True
      Size = 4
    end
    object qryNotasRDPeriodoRAZAO_SOCIAL: TIBStringField
      FieldName = 'RAZAO_SOCIAL'
      Origin = 'FORNECEDOR.RAZAO_SOCIAL'
      Size = 100
    end
    object qryNotasRDPeriodoNUM_DOC: TIBStringField
      FieldName = 'NUM_DOC'
      Origin = 'LANCAMENTOS_RD.NUM_DOC'
      Required = True
      Size = 15
    end
    object qryNotasRDPeriodoDATA_DOCUMENTO: TDateField
      FieldName = 'DATA_DOCUMENTO'
      Origin = 'LANCAMENTOS_RD.DATA_DOCUMENTO'
      Required = True
    end
    object qryNotasRDPeriodoDATA_LANCAMENTO: TDateField
      FieldName = 'DATA_LANCAMENTO'
      Origin = 'LANCAMENTOS_RD.DATA_LANCAMENTO'
      Required = True
    end
    object qryNotasRDPeriodoDATA_RD: TDateField
      FieldName = 'DATA_RD'
      Origin = 'LANCAMENTOS_RD.DATA_RD'
      Required = True
    end
    object qryNotasRDPeriodoTOTAL_NOTA: TIBBCDField
      FieldName = 'TOTAL_NOTA'
      Precision = 18
      Size = 2
    end
    object qryNotasRDPeriodoTOTAL_LANCAMENTOS: TFloatField
      FieldName = 'TOTAL_LANCAMENTOS'
    end
    object qryNotasRDPeriodoDATA_VENCIMENTO: TDateField
      FieldName = 'DATA_VENCIMENTO'
      Origin = 'CONTAS_A_PAGAR.DATA_VENCIMENTO'
    end
    object qryNotasRDPeriodoOBSERVACOES: TIBStringField
      FieldName = 'OBSERVACOES'
      Origin = 'LANCAMENTOS_RD.OBSERVACOES'
      Size = 250
    end
  end
  object dtNotasRDPeriodo: TfrxDBDataset
    UserName = 'dtNotasRDPeriodo'
    CloseDataSource = False
    FieldAliases.Strings = (
      'CODIGO=CODIGO'
      'COD_FORNECEDOR=COD_FORNECEDOR'
      'RAZAO_SOCIAL=RAZAO_SOCIAL'
      'NUM_DOC=NUM_DOC'
      'DATA_DOCUMENTO=DATA_DOCUMENTO'
      'DATA_LANCAMENTO=DATA_LANCAMENTO'
      'DATA_RD=DATA_RD'
      'TOTAL_NOTA=TOTAL_NOTA'
      'TOTAL_LANCAMENTOS=TOTAL_LANCAMENTOS'
      'DATA_VENCIMENTO=DATA_VENCIMENTO'
      'OBSERVACOES=OBSERVACOES')
    DataSet = qryNotasRDPeriodo
    BCDToCurrency = False
    Left = 688
    Top = 424
  end
  object qryNotasRDPeriodoItens: TIBQuery
    Database = dm.dbrestaurante
    Transaction = dm.transacao
    BufferChunks = 1000
    CachedUpdates = False
    DataSource = dsNotasRDPeriodo
    ParamCheck = True
    SQL.Strings = (
      ''
      ''
      '   select itr.*, g.descricao  from itens_lancamento_rd itr'
      '      inner join grupos g on (g.cod_grupo = itr.cod_grupo)'
      '        where itr.cod_lanc_rd=:codigo')
    Left = 648
    Top = 472
    ParamData = <
      item
        DataType = ftString
        Name = 'CODIGO'
        ParamType = ptUnknown
        Size = 9
      end>
    object qryNotasRDPeriodoItensCOD_LANC_RD: TIBStringField
      FieldName = 'COD_LANC_RD'
      Origin = 'ITENS_LANCAMENTO_RD.COD_LANC_RD'
      Required = True
      Size = 8
    end
    object qryNotasRDPeriodoItensCOD_GRUPO: TIBStringField
      FieldName = 'COD_GRUPO'
      Origin = 'ITENS_LANCAMENTO_RD.COD_GRUPO'
      Required = True
      Size = 6
    end
    object qryNotasRDPeriodoItensVALOR: TFloatField
      FieldName = 'VALOR'
      Origin = 'ITENS_LANCAMENTO_RD.VALOR'
    end
    object qryNotasRDPeriodoItensDESCRICAO: TIBStringField
      FieldName = 'DESCRICAO'
      Origin = 'GRUPOS.DESCRICAO'
      Size = 30
    end
  end
  object dsNotasRDPeriodo: TDataSource
    DataSet = qryNotasRDPeriodo
    Left = 728
    Top = 424
  end
  object dtNotasRDPeriodoItens: TfrxDBDataset
    UserName = 'dtNotasRDPeriodoItens'
    CloseDataSource = False
    FieldAliases.Strings = (
      'COD_LANC_RD=COD_LANC_RD'
      'COD_GRUPO=COD_GRUPO'
      'VALOR=VALOR'
      'DESCRICAO=DESCRICAO')
    DataSet = qryNotasRDPeriodoItens
    BCDToCurrency = False
    Left = 688
    Top = 472
  end
  object qryRelItensCompraRDGrupo: TIBQuery
    Database = dm.dbrestaurante
    Transaction = dm.transacao
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      ''
      '   select'
      
        '          vi.cod_g_raiz,vi.desc_g_raiz, vi.cod_g_pai, vi.desc_g_' +
        'pai, vi.cod_grupo, vi.desc_grupo,'
      '          ie.cod_item, vi.descricao_item,'
      '          sum(ie.quantidade) as quantidade,'
      
        '          (sum(ie.quantidade * ie.custo_medio) /   sum(ie.quanti' +
        'dade) ) as custo_medio,'
      '          sum(ie.quantidade * ie.custo_medio) as total'
      ''
      '             from v_itens_entrada ie'
      
        '                inner join contas_a_pagar cpg on (cpg.codigo_ent' +
        'rada = ie.cod_entrada)'
      
        '                inner join lancamentos_rd lr  on (lr.cod_ct_paga' +
        'r = cpg.codigo)'
      
        '                inner join v_itens_estoque vi on (vi.cod_item = ' +
        'ie.cod_item)'
      ''
      '                where  lr.status <> 2  and'
      
        '                 lr.data_rd between '#39'01.07.2017'#39' and '#39'31.07.2017' +
        #39
      '                      and vi.cod_grupo like '#39'101'#39'||'#39'%'#39
      '--                      and ie.cod_entrada='#39'00003780'#39
      '    '
      '   group by ie.cod_item, vi.descricao_item,'
      '   vi.cod_g_raiz, vi.desc_g_raiz,'
      '   vi.cod_g_pai, vi.desc_g_pai ,'
      '   vi.cod_grupo, vi.desc_grupo'
      '   order by vi.cod_g_raiz,vi.cod_g_pai,vi.cod_grupo, ie.cod_item'
      ''
      '')
    Left = 960
    Top = 104
  end
  object dtItensCompraRD: TfrxDBDataset
    UserName = 'dtItensCompraRD'
    CloseDataSource = False
    FieldAliases.Strings = (
      'COD_G_RAIZ=COD_G_RAIZ'
      'DESC_G_RAIZ=DESC_G_RAIZ'
      'COD_G_PAI=COD_G_PAI'
      'DESC_G_PAI=DESC_G_PAI'
      'COD_GRUPO=COD_GRUPO'
      'DESC_GRUPO=DESC_GRUPO'
      'COD_ITEM=COD_ITEM'
      'DESCRICAO_ITEM=DESCRICAO_ITEM'
      'QUANTIDADE=QUANTIDADE'
      'CUSTO_MEDIO=CUSTO_MEDIO'
      'TOTAL=TOTAL')
    DataSet = qryRelItensCompraRDGrupo
    BCDToCurrency = False
    Left = 992
    Top = 104
  end
  object qryRelItensLancamentosRD: TIBQuery
    Database = dm.dbrestaurante
    Transaction = dm.transacao
    BufferChunks = 1000
    CachedUpdates = False
    DataSource = dsqryRelLancamentosRD
    ParamCheck = True
    SQL.Strings = (
      ''
      ''
      '   select itr.*, g.descricao  from itens_lancamento_rd itr'
      '      inner join grupos g on (g.cod_grupo = itr.cod_grupo)'
      '        where itr.cod_lanc_rd=:codigo')
    Left = 776
    Top = 88
    ParamData = <
      item
        DataType = ftString
        Name = 'CODIGO'
        ParamType = ptUnknown
        Size = 9
      end>
    object IBStringField1: TIBStringField
      FieldName = 'COD_LANC_RD'
      Origin = 'ITENS_LANCAMENTO_RD.COD_LANC_RD'
      Required = True
      Size = 8
    end
    object IBStringField2: TIBStringField
      FieldName = 'COD_GRUPO'
      Origin = 'ITENS_LANCAMENTO_RD.COD_GRUPO'
      Required = True
      Size = 6
    end
    object FloatField1: TFloatField
      FieldName = 'VALOR'
      Origin = 'ITENS_LANCAMENTO_RD.VALOR'
    end
    object IBStringField3: TIBStringField
      FieldName = 'DESCRICAO'
      Origin = 'GRUPOS.DESCRICAO'
      Size = 30
    end
  end
  object dsqryRelLancamentosRD: TDataSource
    DataSet = qryRelLancamentosRD
    Left = 816
    Top = 32
  end
  object dtItensLancamentosRD: TfrxDBDataset
    UserName = 'dtItensLancamentosRD'
    CloseDataSource = False
    FieldAliases.Strings = (
      'COD_LANC_RD=COD_LANC_RD'
      'COD_GRUPO=COD_GRUPO'
      'VALOR=VALOR'
      'DESCRICAO=DESCRICAO')
    DataSet = qryRelItensLancamentosRD
    BCDToCurrency = False
    Left = 832
    Top = 80
  end
  object qryRelAnaliseGerencialMensal: TIBQuery
    Database = dm.dbrestaurante
    Transaction = dm.transacao
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      ''
      
        'select eg.alias, pc.* from proc_gerencial('#39'0002'#39','#39'01.09.2016'#39','#39'3' +
        '0.09.2016'#39') as pc'
      ' inner join empresas_grupo eg on (eg.codigo = pc.cod_empresa)'
      'union all'
      
        'select eg.alias, pc.* from proc_gerencial('#39'0006'#39','#39'01.09.2016'#39','#39'3' +
        '0.09.2016'#39') as pc'
      ' inner join empresas_grupo eg on (eg.codigo = pc.cod_empresa)'
      'union all'
      
        'select eg.alias, pc.* from proc_gerencial('#39'0007'#39','#39'01.09.2016'#39','#39'3' +
        '0.09.2016'#39') as pc'
      ' inner join empresas_grupo eg on (eg.codigo = pc.cod_empresa)'
      'union all'
      
        'select eg.alias, pc.* from proc_gerencial('#39'0010'#39','#39'01.09.2016'#39','#39'3' +
        '0.09.2016'#39') as pc'
      ' inner join empresas_grupo eg on (eg.codigo = pc.cod_empresa)'
      'union all'
      
        'select eg.alias, pc.* from proc_gerencial('#39'0011'#39','#39'01.09.2016'#39','#39'3' +
        '0.09.2016'#39') as pc'
      ' inner join empresas_grupo eg on (eg.codigo = pc.cod_empresa)'
      'union all'
      
        'select eg.alias, pc.* from proc_gerencial('#39'0013'#39','#39'01.09.2016'#39','#39'3' +
        '0.09.2016'#39') as pc'
      ' inner join empresas_grupo eg on (eg.codigo = pc.cod_empresa)'
      'union all'
      
        'select eg.alias, pc.* from proc_gerencial('#39'0014'#39','#39'01.09.2016'#39','#39'3' +
        '0.09.2016'#39') as pc'
      ' inner join empresas_grupo eg on (eg.codigo = pc.cod_empresa)')
    Left = 1016
    Top = 192
  end
  object updQryCaixas: TIBUpdateSQL
    RefreshSQL.Strings = (
      'Select *'
      'from caixas '
      'where'
      '  CODIGO = :CODIGO')
    ModifySQL.Strings = (
      'update caixas'
      'set'
      '  SELECIONADO = :SELECIONADO'
      'where'
      '  CODIGO = :OLD_CODIGO')
    InsertSQL.Strings = (
      'insert into caixas'
      '  (SELECIONADO)'
      'values'
      '  (:SELECIONADO)')
    DeleteSQL.Strings = (
      'delete from caixas'
      'where'
      '  CODIGO = :OLD_CODIGO')
    Left = 248
    Top = 504
  end
  object frxCrossObject1: TfrxCrossObject
    Left = 328
    Top = 16
  end
  object frxBIFFExport1: TfrxBIFFExport
    FileName = 'C:\Users\JOAO\Desktop\teste3.xls'
    UseFileCache = True
    ShowProgress = True
    OverwritePrompt = False
    CreationTime = 42696.837065648150000000
    DataOnly = False
    RowHeightScale = 1.000000000000000000
    ChunkSize = 0
    Inaccuracy = 10.000000000000000000
    FitPages = False
    Pictures = True
    ParallelPages = 0
    Left = 248
    Top = 136
  end
  object qryRelEstornos: TIBQuery
    Database = dm.dbrestaurante
    Transaction = dm.transacao
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      ''
      
        ' select upper( udf_monthname(c.data_sistema)) ||'#39'/'#39'|| udf_year(c' +
        '.data_sistema) mes,  c.codigo,c.data_sistema, e.hora,c.nome_usua' +
        'rio,e.nome_usuario_autorizou, c.numero_caixa, e.descricao,'
      
        '        e.quantidade,e.valor_unitario,(e.quantidade * e.valor_un' +
        'itario) as total'
      '  from  estornos e'
      '  inner join caixas c on (c.codigo = e.cod_caixa)'
      '    where c.data_sistema between '#39'01.03.2017'#39' and '#39'31.03.2017'#39
      
        '    order by udf_year(c.data_sistema),udf_month(c.data_sistema),' +
        ' c.data_sistema '
      '')
    Left = 616
    Top = 24
  end
  object dtQryRelEstornos: TfrxDBDataset
    UserName = 'dtRelEstornos'
    CloseDataSource = False
    FieldAliases.Strings = (
      'MES=MES'
      'CODIGO=CODIGO'
      'DATA_SISTEMA=DATA_SISTEMA'
      'HORA=HORA'
      'NOME_USUARIO=NOME_USUARIO'
      'NOME_USUARIO_AUTORIZOU=NOME_USUARIO_AUTORIZOU'
      'NUMERO_CAIXA=NUMERO_CAIXA'
      'DESCRICAO=DESCRICAO'
      'QUANTIDADE=QUANTIDADE'
      'VALOR_UNITARIO=VALOR_UNITARIO'
      'TOTAL=TOTAL')
    DataSet = qryRelEstornos
    BCDToCurrency = False
    Left = 656
    Top = 24
  end
  object dsQryItensCompras: TDataSource
    DataSet = qryItensCompra
    Left = 1080
    Top = 416
  end
  object qryComprasRefCruzada: TIBQuery
    Database = dm.dbrestaurante
    Transaction = dm.transacao
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      ''
      
        '  select * from r_compras_ref_cruzada('#39'01.01.2019'#39','#39'31.01.2019'#39')' +
        ';')
    Left = 992
    Top = 608
  end
  object dtComprasRefCruzada: TfrxDBDataset
    UserName = 'dtComprasRefCruzada'
    CloseDataSource = False
    FieldAliases.Strings = (
      'COD_GRUPO=COD_GRUPO'
      'GRUPO=GRUPO'
      'DIA_01=DIA_01'
      'DIA_02=DIA_02'
      'DIA_03=DIA_03'
      'DIA_04=DIA_04'
      'DIA_05=DIA_05'
      'DIA_06=DIA_06'
      'DIA_07=DIA_07'
      'DIA_08=DIA_08'
      'DIA_09=DIA_09'
      'DIA_10=DIA_10'
      'DIA_11=DIA_11'
      'DIA_12=DIA_12'
      'DIA_13=DIA_13'
      'DIA_14=DIA_14'
      'DIA_15=DIA_15'
      'DIA_16=DIA_16'
      'DIA_17=DIA_17'
      'DIA_18=DIA_18'
      'DIA_19=DIA_19'
      'DIA_20=DIA_20'
      'DIA_21=DIA_21'
      'DIA_22=DIA_22'
      'DIA_23=DIA_23'
      'DIA_24=DIA_24'
      'DIA_25=DIA_25'
      'DIA_26=DIA_26'
      'DIA_27=DIA_27'
      'DIA_28=DIA_28'
      'DIA_29=DIA_29'
      'DIA_30=DIA_30'
      'DIA_31=DIA_31')
    DataSet = qryComprasRefCruzada
    BCDToCurrency = False
    Left = 1120
    Top = 608
  end
  object qryTotaisCompraRefCruzada: TIBQuery
    Database = dm.dbrestaurante
    Transaction = dm.transacao
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      ''
      'SELECT'
      
        'sum(DIA_01)AS TOT_01,sum(DIA_02)AS TOT_02,sum(DIA_03)AS TOT_03,s' +
        'um(DIA_04)AS TOT_04,'
      
        'sum(DIA_05)AS TOT_05,sum(DIA_06)AS TOT_06,sum(DIA_07)AS TOT_07,s' +
        'um(DIA_08)AS TOT_08,'
      
        'sum(DIA_09)AS TOT_09,sum(DIA_10)AS TOT_10,sum(DIA_11)AS TOT_11,s' +
        'um(DIA_12)AS TOT_12,'
      
        'sum(DIA_13)AS TOT_13,sum(DIA_14)AS TOT_14,sum(DIA_15)AS TOT_15,s' +
        'um(DIA_16)AS TOT_16,'
      
        'sum(DIA_17)AS TOT_17,sum(DIA_18)AS TOT_18,sum(DIA_19)AS TOT_19,s' +
        'um(DIA_20)AS TOT_20,'
      
        'sum(DIA_21)AS TOT_21,sum(DIA_22)AS TOT_22,sum(DIA_23)AS TOT_23,s' +
        'um(DIA_24)AS TOT_24,'
      
        'sum(DIA_25)AS TOT_25,sum(DIA_26)AS TOT_26,sum(DIA_27)AS TOT_27,s' +
        'um(DIA_28)AS TOT_28,'
      'sum(DIA_29)AS TOT_29,sum(DIA_30)AS TOT_30,'
      
        'sum(DIA_31)AS TOT_31  from r_compras_ref_cruzada('#39'01.01.2019'#39','#39'3' +
        '1.01.2019'#39') rc'
      ' where udf_len(trim(rc.cod_grupo)) =8')
    Left = 992
    Top = 656
  end
  object dtTotaisCompraRefCruzada: TfrxDBDataset
    UserName = 'dtTotaisCompraRefCruzada'
    CloseDataSource = False
    FieldAliases.Strings = (
      'TOT_01=TOT_01'
      'TOT_02=TOT_02'
      'TOT_03=TOT_03'
      'TOT_04=TOT_04'
      'TOT_05=TOT_05'
      'TOT_06=TOT_06'
      'TOT_07=TOT_07'
      'TOT_08=TOT_08'
      'TOT_09=TOT_09'
      'TOT_10=TOT_10'
      'TOT_11=TOT_11'
      'TOT_12=TOT_12'
      'TOT_13=TOT_13'
      'TOT_14=TOT_14'
      'TOT_15=TOT_15'
      'TOT_16=TOT_16'
      'TOT_17=TOT_17'
      'TOT_18=TOT_18'
      'TOT_19=TOT_19'
      'TOT_20=TOT_20'
      'TOT_21=TOT_21'
      'TOT_22=TOT_22'
      'TOT_23=TOT_23'
      'TOT_24=TOT_24'
      'TOT_25=TOT_25'
      'TOT_26=TOT_26'
      'TOT_27=TOT_27'
      'TOT_28=TOT_28'
      'TOT_29=TOT_29'
      'TOT_30=TOT_30'
      'TOT_31=TOT_31')
    DataSet = qryTotaisCompraRefCruzada
    BCDToCurrency = False
    Left = 1120
    Top = 656
  end
  object qryProdutosVendidosHoraGrupo: TIBQuery
    Database = dm.dbrestaurante
    Transaction = dm.transacao
    Active = True
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      ' select udf_hour(mv.hora) as HORA,  g.descricao as grupo ,'
      
        '    sum( (mv.quantidade * mv.valor_unitario) ) as total  from mo' +
        'vimento_venda mv'
      '     inner join produtos p on (p.cod_produto = mv.cod_produto)'
      '     inner join grupos g on (g.cod_grupo = p.cod_grupo)'
      '       where mv.data  =  '#39'31.03.2019'#39
      '     group by udf_hour (mv.hora), p.cod_grupo, g.descricao'
      '      order by udf_hour(mv.hora),g.descricao'
      '')
    Left = 1136
    Top = 544
  end
  object dtProdutosVendidosHoraGrupo: TfrxDBDataset
    UserName = 'dtProdutosVendidosHoraGrupo'
    CloseDataSource = False
    FieldAliases.Strings = (
      'HORA=HORA'
      'GRUPO=GRUPO'
      'TOTAL=TOTAL')
    DataSet = qryProdutosVendidosHoraGrupo
    BCDToCurrency = False
    Left = 1200
    Top = 544
  end
  object qryNotasInutilizadas: TIBQuery
    Database = dm.dbrestaurante
    Transaction = dm.transacao
    Active = True
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      
        'select nfc.serie,nfc.nota,nfc.data_hora_inutilizacao, nfc.protoc' +
        'olo,nfc.obs,'
      '  case nfc.modelo '
      '     WHEN 2 THEN '#39'NFC-e (MODELO 65)'#39
      '     WHEN 3 THEN '#39'NFC-e (MODELO 55)'#39
      ' end as modelo_nota'
      '    from inutilizacoes_nfce nfc '
      '  where nfc.inutilizada=1 and nfc.emitida =0 and nfc.modelo=2 '
      '   and nfc.data_hora_inutilizacao >='#39'01.04.2019'#39
      '   order by nfc.serie, nfc.nota ')
    Left = 904
    Top = 264
  end
  object dtNotasInutilizadas: TfrxDBDataset
    UserName = 'dtNotasInutilizadas'
    CloseDataSource = False
    FieldAliases.Strings = (
      'SERIE=SERIE'
      'NOTA=NOTA'
      'DATA_HORA_INUTILIZACAO=DATA_HORA_INUTILIZACAO'
      'PROTOCOLO=PROTOCOLO'
      'OBS=OBS'
      'MODELO_NOTA=MODELO_NOTA')
    DataSet = qryNotasInutilizadas
    BCDToCurrency = False
    Left = 904
    Top = 304
  end
end
