object dm: Tdm
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Height = 836
  Width = 1745
  object dbrestaurante: TIBDatabase
    DatabaseName = 'C:\bancos\frugi\restaurante.FDB'
    Params.Strings = (
      'user_name=SYSDBA'
      'password=masterkey')
    LoginPrompt = False
    DefaultTransaction = transacao
    ServerType = 'IBServer'
    AllowStreamedConnected = False
    OnIdleTimer = dbrestauranteIdleTimer
    Left = 59
    Top = 14
  end
  object transacao: TIBTransaction
    DefaultDatabase = dbrestaurante
    Params.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    Left = 104
    Top = 16
  end
  object qryauxiliar: TIBQuery
    Database = dbrestaurante
    Transaction = transacao
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      ''
      
        ' select v.cod_venda,v.valor_total, v.numero_caixa, v.data, v.hor' +
        'a,  v.serie_nfce,v.numero_nfce, v.protocolo_nfce, v.chave_nfce '
      
        '    from vendas v where v.data_so between '#39'01.02.2016'#39' and '#39'29.0' +
        '2.2016'#39
      '    order by v.numero_caixa, v.serie_nfce, v.numero_nfce '
      '')
    Filtered = True
    Left = 24
    Top = 64
  end
  object dsqryauxiliar: TDataSource
    DataSet = qryauxiliar
    Left = 56
    Top = 64
  end
  object qrymax: TIBQuery
    Database = dbrestaurante
    Transaction = transacao
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    Left = 288
    Top = 8
  end
  object qryauxiliar2: TIBQuery
    Database = dbrestaurante
    Transaction = transacao
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      'select * from composicoes_produto')
    Left = 24
    Top = 128
  end
  object dsqryauxiliar2: TDataSource
    DataSet = qryauxiliar2
    Left = 96
    Top = 144
  end
  object itens_cot_temp: TRxMemoryData
    FieldDefs = <
      item
        Name = 'COD_COTACAO'
        DataType = ftString
        Size = 6
      end
      item
        Name = 'COD_ITEM'
        DataType = ftString
        Size = 5
      end
      item
        Name = 'DESCRICAO'
        DataType = ftString
        Size = 40
      end
      item
        Name = #205'tens / embalagem'
        DataType = ftFloat
      end
      item
        Name = 'QTDE_ITEM'
        DataType = ftFloat
      end
      item
        Name = 'QTDE_EMBALAGENS'
        DataType = ftFloat
      end
      item
        Name = 'VALOR_EMBALAGEM'
        DataType = ftFloat
      end>
    Left = 248
    Top = 144
    object itens_cot_tempCOD_COTACAO: TStringField
      FieldName = 'COD_COTACAO'
      Visible = False
      Size = 6
    end
    object itens_cot_tempCOD_ITEM: TStringField
      DisplayLabel = 'C'#243'd.'
      DisplayWidth = 23
      FieldName = 'COD_ITEM'
      Size = 5
    end
    object itens_cot_tempDESCRICAO: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      DisplayWidth = 62
      FieldName = 'DESCRICAO'
      Size = 40
    end
    object itens_cot_tempITENS_EMB: TFloatField
      DisplayLabel = #205't. / emb.'
      DisplayWidth = 16
      FieldName = #205'tens / embalagem'
    end
    object itens_cot_tempQTDE_ITEM: TFloatField
      DisplayLabel = 'Qtde /'#237't.'
      DisplayWidth = 16
      FieldName = 'QTDE_ITEM'
    end
    object itens_cot_tempQTDE_EMBALAGENS: TFloatField
      DisplayLabel = 'N'#186' emb.'
      DisplayWidth = 16
      FieldName = 'QTDE_EMBALAGENS'
    end
    object itens_cot_tempVALOR_EMBALAGEM: TFloatField
      DisplayLabel = 'Pre'#231'o / emb.'
      DisplayWidth = 21
      FieldName = 'VALOR_EMBALAGEM'
    end
  end
  object qryauxiliar3: TIBQuery
    Database = dbrestaurante
    Transaction = transacao
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    Left = 168
    Top = 72
  end
  object composicoes_temp: TRxMemoryData
    FieldDefs = <
      item
        Name = 'quantidade'
        DataType = ftFloat
      end
      item
        Name = 'Desc. Unidade'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'descricao_item'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'descricao_c_custo'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'cod_produto'
        DataType = ftString
        Size = 5
      end
      item
        Name = 'cod_item'
        DataType = ftString
        Size = 5
      end
      item
        Name = 'cod_c_custo'
        DataType = ftString
        Size = 3
      end
      item
        Name = 'Unidade'
        DataType = ftString
        Size = 2
      end>
    Left = 352
    Top = 152
    object composicoes_tempquantidade: TFloatField
      DisplayLabel = 'Qtde'
      DisplayWidth = 8
      FieldName = 'quantidade'
      DisplayFormat = '#0.000'
      Precision = 3
    end
    object composicoes_tempdes_unidade: TStringField
      DisplayWidth = 30
      FieldName = 'Desc. Unidade'
      Size = 25
    end
    object composicoes_tempdescricao_item: TStringField
      DisplayLabel = #205'tem'
      DisplayWidth = 45
      FieldName = 'descricao_item'
      Size = 45
    end
    object composicoes_tempdescricao_c_custo: TStringField
      DisplayLabel = 'C. Custo'
      DisplayWidth = 25
      FieldName = 'descricao_c_custo'
      Size = 35
    end
    object composicoes_tempcod_produto: TStringField
      FieldName = 'cod_produto'
      Visible = False
      Size = 5
    end
    object composicoes_tempcod_item: TStringField
      DisplayLabel = 'C'#243'd. '#205'tem'
      DisplayWidth = 9
      FieldName = 'cod_item'
      Visible = False
      Size = 5
    end
    object composicoes_tempcod_c_custo: TStringField
      DisplayLabel = 'C'#243'd. CC'
      DisplayWidth = 10
      FieldName = 'cod_c_custo'
      Visible = False
      Size = 3
    end
    object composicoes_tempUnidade: TStringField
      FieldName = 'Unidade'
      Visible = False
      Size = 2
    end
  end
  object ds_composicoes_temp: TDataSource
    DataSet = composicoes_temp
    Left = 568
    Top = 8
  end
  object qry_consultas: TIBQuery
    Database = dbrestaurante
    Transaction = transacao
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      ''
      ''
      ''
      ''
      
        ' select us.cod_usuario as Codigo,us.nome_usuario as Nome,us.logi' +
        'n as Login,'
      '     us.funcao,'
      '     case acesso'
      '      when '#39'01060101'#39' then '#39'ATIVO'#39
      '      else '#39'INATIVO'#39
      '     END  as status'
      '      from usuarios us'
      '')
    Left = 456
    Top = 128
  end
  object ds_qry_consultas: TDataSource
    DataSet = qry_consultas
    Left = 592
    Top = 120
  end
  object qry_movimento_mesa: TIBQuery
    Database = dbrestaurante
    Transaction = transacao
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = False
    SQL.Strings = (
      'select mv.cod_mesa,pr.cod_barras,'
      ' mv.cod_produto,pr.cod_produto,'
      'pr.descricao,mv.quantidade as quantidade,'
      'mv.valor_unitario,'
      'udf_roundabnt((mv.valor_unitario * mv.quantidade),2)   as total'
      
        ', mv.cod_garcon, g.apelido,mv.hora_lancamento, mv.estado, mv.des' +
        'conto,id,impresso,observacoes,sabores,obs_paf,cancelado, mv.id'
      '  from movimento_mesa mv '
      '  inner join produtos pr on (pr.cod_produto=mv.cod_produto)'
      '  inner join garcons g on (g.cod_garcon=mv.cod_garcon) '
      '  where mv.cod_mesa='#39'0001'#39' order by mv.id')
    Left = 24
    Top = 184
  end
  object ds_qry_movimento_mesa: TDataSource
    DataSet = qry_movimento_mesa
    Left = 95
    Top = 200
  end
  object modulos_temp: TRxMemoryData
    FieldDefs = <
      item
        Name = 'cod_modulo'
        DataType = ftString
        Size = 3
      end
      item
        Name = 'cod_mod'
        DataType = ftString
        Size = 3
      end
      item
        Name = 'descricao'
        DataType = ftString
        Size = 40
      end
      item
        Name = 'permite'
        DataType = ftInteger
      end>
    Left = 780
    Top = 239
    object modulos_tempcod_modulo: TStringField
      DisplayWidth = 5
      FieldName = 'cod_modulo'
      Size = 5
    end
    object modulos_tempcod_mod: TStringField
      FieldName = 'cod_mod'
      Size = 3
    end
    object modulos_tempdescricao: TStringField
      FieldName = 'descricao'
      Size = 40
    end
    object modulos_temppermite: TIntegerField
      FieldName = 'permite'
    end
  end
  object submodulos_temp: TRxMemoryData
    FieldDefs = <
      item
        Name = 'cod_modulo'
        DataType = ftString
        Size = 5
      end
      item
        Name = 'cod_mod'
        DataType = ftString
        Size = 3
      end
      item
        Name = 'descricao'
        DataType = ftString
        Size = 40
      end
      item
        Name = 'permite'
        DataType = ftInteger
      end>
    Left = 688
    Top = 240
    object submodulos_tempcod_modulo: TStringField
      FieldName = 'cod_modulo'
      Size = 5
    end
    object submodulos_tempcod_mod: TStringField
      FieldName = 'cod_mod'
      Size = 3
    end
    object submodulos_tempdescricao: TStringField
      FieldName = 'descricao'
      Size = 40
    end
    object submodulos_temppermite: TIntegerField
      FieldName = 'permite'
    end
  end
  object dsqryauxiliar3: TDataSource
    DataSet = qryauxiliar3
    Left = 256
    Top = 88
  end
  object tb_usuarios: TIBTable
    Database = dbrestaurante
    Transaction = transacao
    BufferChunks = 1000
    CachedUpdates = False
    FieldDefs = <
      item
        Name = 'COD_USUARIO'
        Attributes = [faRequired]
        DataType = ftString
        Size = 2
      end
      item
        Name = 'NOME_USUARIO'
        Attributes = [faRequired]
        DataType = ftString
        Size = 40
      end
      item
        Name = 'FUNCAO'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'LOGIN'
        Attributes = [faRequired]
        DataType = ftString
        Size = 15
      end
      item
        Name = 'SENHA'
        Attributes = [faRequired]
        DataType = ftString
        Size = 8
      end
      item
        Name = 'ENTRADAS'
        DataType = ftInteger
      end>
    IndexDefs = <
      item
        Name = 'RDB$PRIMARY1'
        Fields = 'COD_USUARIO'
        Options = [ixPrimary, ixUnique]
      end>
    StoreDefs = True
    TableName = 'USUARIOS'
    UniDirectional = False
    Left = 848
    Top = 176
  end
  object dsusuarios: TDataSource
    DataSet = tb_usuarios
    Left = 904
    Top = 176
  end
  object ac_recebimentos_temp: TRxMemoryData
    Active = True
    FieldDefs = <
      item
        Name = 'cod_forma'
        DataType = ftString
        Size = 3
      end
      item
        Name = 'Descricao'
        DataType = ftString
        Size = 18
      end
      item
        Name = 'valor'
        DataType = ftFloat
      end>
    Left = 520
    Top = 184
    object ac_recebimentos_tempcod_forma: TStringField
      FieldName = 'cod_forma'
      Size = 3
    end
    object ac_recebimentos_tempDescricao: TStringField
      FieldName = 'Descricao'
      Size = 18
    end
    object ac_recebimentos_tempvalor: TFloatField
      FieldName = 'valor'
    end
  end
  object transRemota: TIBTransaction
    Left = 528
    Top = 592
  end
  object tb_mem_rel_custo: TRxMemoryData
    FieldDefs = <>
    Left = 168
    Top = 128
  end
  object gastos_temp: TRxMemoryData
    FieldDefs = <
      item
        Name = 'codigo_item'
        DataType = ftString
        Size = 5
      end
      item
        Name = 'qtde'
        DataType = ftFloat
      end
      item
        Name = 'descricao'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'unidade'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'custo_unitario'
        DataType = ftFloat
      end>
    Left = 848
    Top = 21
    object gastos_tempcodigo_item: TStringField
      FieldName = 'codigo_item'
      Size = 5
    end
    object gastos_tempqtde: TFloatField
      FieldName = 'qtde'
    end
    object gastos_tempdescricao: TStringField
      FieldName = 'descricao'
      Size = 60
    end
    object gastos_tempunidade: TStringField
      FieldName = 'unidade'
    end
    object gastos_tempcusto_unitario: TFloatField
      FieldName = 'custo_unitario'
    end
  end
  object ds_gastos_temp: TDataSource
    DataSet = gastos_temp
    Left = 872
    Top = 88
  end
  object ds_tabmemoria: TDataSource
    Left = 824
    Top = 208
  end
  object tb_acompanhamentos_temp: TRxMemoryData
    FieldDefs = <
      item
        Name = 'cod_acompanhamento'
        DataType = ftString
        Size = 5
      end
      item
        Name = 'descricao'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'qtde'
        DataType = ftSmallint
      end>
    Left = 264
    Top = 192
    object tb_acompanhamentos_tempcod_acompanhamento: TStringField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'cod_acompanhamento'
      Size = 5
    end
    object tb_acompanhamentos_tempdescricao: TStringField
      DisplayLabel = 'Descri'#231#227'o '
      FieldName = 'descricao'
      Size = 50
    end
    object tb_acompanhamentos_tempqtde: TSmallintField
      DisplayLabel = 'Quantidade'
      FieldName = 'qtde'
    end
  end
  object ds_acompanhamentos_temp: TDataSource
    Left = 392
    Top = 176
  end
  object proc_abate_estoque: TIBStoredProc
    Database = dbrestaurante
    Transaction = transacaoProcedure
    StoredProcName = 'ABATE_ESTOQUE'
    Left = 1000
    Top = 88
    ParamData = <
      item
        DataType = ftString
        Name = 'COD_PRODUTO'
        ParamType = ptInput
      end
      item
        DataType = ftBCD
        Name = 'BAIXA'
        ParamType = ptInput
      end>
  end
  object ds_tb_parametros: TDataSource
    DataSet = tb_parametros
    Left = 760
    Top = 168
  end
  object transLog: TIBTransaction
    DefaultDatabase = dbrestaurante
    Params.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    Left = 184
    Top = 16
  end
  object qry_itens_estoque: TIBQuery
    Database = dbrestaurante
    Transaction = transacao
    ForcedRefresh = True
    BeforePost = qry_itens_estoqueBeforePost
    BufferChunks = 1000
    CachedUpdates = True
    ParamCheck = False
    SQL.Strings = (
      
        'select  it.* , gp.descricao as desc_grupo,  un.descricao as desc' +
        '_unidade,  un.parametro, (it.estoque_liquido / un.parametro) as ' +
        'estoque,un2.descricao as descUnidadeFracao, cf.descricao as desc' +
        'ricaoCFOP,ct.descricao as descricaoCST'
      ''
      '   from itens_estoque it'
      '  inner join grupos gp on (gp.cod_grupo = it.cod_grupo)'
      
        '  inner join unidades un on (un.cod_unidade = it.unidade_entrada' +
        ')'
      
        '  inner join unidades un2 on (un2.cod_unidade = it.cod_unidade_f' +
        'racao)'
      '  inner join cfop cf  on (cf.codigo = it.cfop)'
      '  inner join cst ct on (ct.cst = it.cst)')
    UpdateObject = upd_itens_estoque
    Left = 12
    Top = 472
    object qry_itens_estoqueCOD_ITEM: TIBStringField
      FieldName = 'COD_ITEM'
      Origin = 'ITENS_ESTOQUE.COD_ITEM'
      Required = True
      Size = 5
    end
    object qry_itens_estoqueDESCRICAO_ITEM: TIBStringField
      FieldName = 'DESCRICAO_ITEM'
      Origin = 'ITENS_ESTOQUE.DESCRICAO_ITEM'
      Required = True
      Size = 40
    end
    object qry_itens_estoqueDATA_CADASTRO: TDateField
      FieldName = 'DATA_CADASTRO'
      Origin = 'ITENS_ESTOQUE.DATA_CADASTRO'
    end
    object qry_itens_estoqueDATA_ULTIMA_REPOSICAO: TDateField
      FieldName = 'DATA_ULTIMA_REPOSICAO'
      Origin = 'ITENS_ESTOQUE.DATA_ULTIMA_REPOSICAO'
    end
    object qry_itens_estoqueVALOR_CUSTO: TIBBCDField
      FieldName = 'VALOR_CUSTO'
      Origin = 'ITENS_ESTOQUE.VALOR_CUSTO'
      Precision = 18
      Size = 2
    end
    object qry_itens_estoqueQUANTIDADE_MAXIMA: TIBBCDField
      FieldName = 'QUANTIDADE_MAXIMA'
      Origin = 'ITENS_ESTOQUE.QUANTIDADE_MAXIMA'
      Precision = 18
      Size = 2
    end
    object qry_itens_estoqueQUANTIDADE_MINIMA: TIBBCDField
      FieldName = 'QUANTIDADE_MINIMA'
      Origin = 'ITENS_ESTOQUE.QUANTIDADE_MINIMA'
      Precision = 18
      Size = 2
    end
    object qry_itens_estoqueESTOQUE_LIQUIDO: TIBBCDField
      FieldName = 'ESTOQUE_LIQUIDO'
      Origin = 'ITENS_ESTOQUE.ESTOQUE_LIQUIDO'
      Required = True
      Precision = 18
      Size = 2
    end
    object qry_itens_estoqueUNIDADE_ENTRADA: TIBStringField
      FieldName = 'UNIDADE_ENTRADA'
      Origin = 'ITENS_ESTOQUE.UNIDADE_ENTRADA'
      Size = 2
    end
    object qry_itens_estoqueCOD_UNIDADE_FRACAO: TIBStringField
      FieldName = 'COD_UNIDADE_FRACAO'
      Origin = 'ITENS_ESTOQUE.COD_UNIDADE_FRACAO'
      Size = 2
    end
    object qry_itens_estoqueBARRAS: TIBStringField
      FieldName = 'BARRAS'
      Origin = 'ITENS_ESTOQUE.BARRAS'
    end
    object qry_itens_estoquePRODUTO_FINAL: TIBStringField
      FieldName = 'PRODUTO_FINAL'
      Origin = 'ITENS_ESTOQUE.PRODUTO_FINAL'
      Size = 5
    end
    object qry_itens_estoqueCOD_GRUPO: TIBStringField
      FieldName = 'COD_GRUPO'
      Origin = 'ITENS_ESTOQUE.COD_GRUPO'
      Required = True
      Size = 6
    end
    object qry_itens_estoqueCFOP: TIBStringField
      FieldName = 'CFOP'
      Origin = 'ITENS_ESTOQUE.CFOP'
      Size = 4
    end
    object qry_itens_estoqueCST: TIBStringField
      FieldName = 'CST'
      Origin = 'ITENS_ESTOQUE.CST'
      Size = 3
    end
    object qry_itens_estoqueDESC_GRUPO: TIBStringField
      FieldName = 'DESC_GRUPO'
      Origin = 'GRUPOS.DESCRICAO'
      Size = 30
    end
    object qry_itens_estoqueDESC_UNIDADE: TIBStringField
      FieldName = 'DESC_UNIDADE'
      Origin = 'UNIDADES.DESCRICAO'
      Size = 25
    end
    object qry_itens_estoquePARAMETRO: TIBBCDField
      FieldName = 'PARAMETRO'
      Origin = 'UNIDADES.PARAMETRO'
      Precision = 18
      Size = 3
    end
    object qry_itens_estoqueESTOQUE: TFloatField
      FieldName = 'ESTOQUE'
    end
    object qry_itens_estoqueDESCUNIDADEFRACAO: TIBStringField
      FieldName = 'DESCUNIDADEFRACAO'
      Origin = 'UNIDADES.DESCRICAO'
      Size = 25
    end
    object qry_itens_estoqueDESCRICAOCFOP: TIBStringField
      FieldName = 'DESCRICAOCFOP'
      Origin = 'CFOP.DESCRICAO'
      Required = True
      Size = 50
    end
    object qry_itens_estoqueDESCRICAOCST: TIBStringField
      FieldName = 'DESCRICAOCST'
      Origin = 'CST.DESCRICAO'
      Size = 80
    end
    object qry_itens_estoqueSIGLA_NOTA: TIBStringField
      FieldName = 'SIGLA_NOTA'
      Origin = 'ITENS_ESTOQUE.SIGLA_NOTA'
      Size = 3
    end
    object qry_itens_estoqueSUBMATERIA: TSmallintField
      FieldName = 'SUBMATERIA'
      Origin = 'ITENS_ESTOQUE.SUBMATERIA'
      Required = True
    end
  end
  object ds_qry_itens_estoque: TDataSource
    DataSet = qry_itens_estoque
    Left = 47
    Top = 474
  end
  object upd_itens_estoque: TIBUpdateSQL
    RefreshSQL.Strings = (
      'Select *'
      'from itens_estoque '
      'where'
      '  COD_ITEM = :COD_ITEM')
    ModifySQL.Strings = (
      'update itens_estoque'
      'set'
      '  COD_ITEM = :COD_ITEM,'
      '  DESCRICAO_ITEM = :DESCRICAO_ITEM,'
      '  DATA_CADASTRO = :DATA_CADASTRO,'
      '  DATA_ULTIMA_REPOSICAO = :DATA_ULTIMA_REPOSICAO,'
      '  VALOR_CUSTO = :VALOR_CUSTO,'
      '  QUANTIDADE_MAXIMA = :QUANTIDADE_MAXIMA,'
      '  QUANTIDADE_MINIMA = :QUANTIDADE_MINIMA,'
      '  ESTOQUE_LIQUIDO = :ESTOQUE_LIQUIDO,'
      '  UNIDADE_ENTRADA = :UNIDADE_ENTRADA,'
      '  COD_UNIDADE_FRACAO = :COD_UNIDADE_FRACAO,'
      '  BARRAS = :BARRAS,'
      '  PRODUTO_FINAL = :PRODUTO_FINAL,'
      '  COD_GRUPO = :COD_GRUPO,'
      '  CFOP = :CFOP,'
      '  CST = :CST,'
      '  SIGLA_NOTA = :SIGLA_NOTA,'
      '  SUBMATERIA = :SUBMATERIA'
      'where'
      '  COD_ITEM = :OLD_COD_ITEM')
    InsertSQL.Strings = (
      'insert into itens_estoque'
      '  (COD_ITEM, DESCRICAO_ITEM, DATA_CADASTRO, '
      'DATA_ULTIMA_REPOSICAO, VALOR_CUSTO, '
      '   QUANTIDADE_MAXIMA, QUANTIDADE_MINIMA, ESTOQUE_LIQUIDO, '
      'UNIDADE_ENTRADA, '
      '   COD_UNIDADE_FRACAO, BARRAS, PRODUTO_FINAL, COD_GRUPO, CFOP, '
      'CST, SIGLA_NOTA, '
      '   SUBMATERIA)'
      'values'
      '  (:COD_ITEM, :DESCRICAO_ITEM, :DATA_CADASTRO, '
      ':DATA_ULTIMA_REPOSICAO, '
      '   :VALOR_CUSTO, :QUANTIDADE_MAXIMA, :QUANTIDADE_MINIMA, '
      ':ESTOQUE_LIQUIDO, '
      
        '   :UNIDADE_ENTRADA, :COD_UNIDADE_FRACAO, :BARRAS, :PRODUTO_FINA' +
        'L, '
      ':COD_GRUPO, '
      '   :CFOP, :CST, :SIGLA_NOTA, :SUBMATERIA)')
    DeleteSQL.Strings = (
      'delete from itens_estoque'
      'where'
      '  COD_ITEM = :OLD_COD_ITEM')
    Left = 87
    Top = 473
  end
  object qry_lanc_caixa: TIBQuery
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    Left = 617
    Top = 64
  end
  object qry_fornecedores: TIBQuery
    Database = dbrestaurante
    Transaction = transacao
    BufferChunks = 1000
    CachedUpdates = True
    ParamCheck = True
    SQL.Strings = (
      ''
      ''
      'select f.*,'
      '  c.nome as nome_cidade, '
      '  es.nome as NomeEstado'
      '   from fornecedor f'
      '   left join cidade c on (c.cod_cidade = f.cod_cidade)'
      '   left join estado es on (es.codigo = f.cod_estado)'
      ''
      ''
      ''
      '')
    UpdateObject = upd_fornecedores
    Left = 128
    Top = 471
    object qry_fornecedoresCOD_FORNECEDOR: TIBStringField
      FieldName = 'COD_FORNECEDOR'
      Origin = 'FORNECEDOR.COD_FORNECEDOR'
      Required = True
      Size = 4
    end
    object qry_fornecedoresENDERECO: TIBStringField
      FieldName = 'ENDERECO'
      Origin = 'FORNECEDOR.ENDERECO'
      Size = 60
    end
    object qry_fornecedoresBAIRRO: TIBStringField
      FieldName = 'BAIRRO'
      Origin = 'FORNECEDOR.BAIRRO'
      Size = 30
    end
    object qry_fornecedoresCEP: TIBStringField
      FieldName = 'CEP'
      Origin = 'FORNECEDOR.CEP'
      Size = 8
    end
    object qry_fornecedoresTELEFONE: TIBStringField
      FieldName = 'TELEFONE'
      Origin = 'FORNECEDOR.TELEFONE'
    end
    object qry_fornecedoresFAX: TIBStringField
      FieldName = 'FAX'
      Origin = 'FORNECEDOR.FAX'
    end
    object qry_fornecedoresEMAIL: TIBStringField
      FieldName = 'EMAIL'
      Origin = 'FORNECEDOR.EMAIL'
      Size = 40
    end
    object qry_fornecedoresATUALIZA_CUSTO: TSmallintField
      FieldName = 'ATUALIZA_CUSTO'
      Origin = 'FORNECEDOR.ATUALIZA_CUSTO'
    end
    object qry_fornecedoresCGC_CPF: TIBStringField
      FieldName = 'CGC_CPF'
      Origin = 'FORNECEDOR.CGC_CPF'
      Size = 14
    end
    object qry_fornecedoresINSCRICAO_ESTADUAL: TIBStringField
      FieldName = 'INSCRICAO_ESTADUAL'
      Origin = 'FORNECEDOR.INSCRICAO_ESTADUAL'
    end
    object qry_fornecedoresCODIGO_REPRESENTANTE: TIntegerField
      FieldName = 'CODIGO_REPRESENTANTE'
      Origin = 'FORNECEDOR.CODIGO_REPRESENTANTE'
    end
    object qry_fornecedoresOBSERVACAO: TIBStringField
      FieldName = 'OBSERVACAO'
      Origin = 'FORNECEDOR.OBSERVACAO'
      Size = 254
    end
    object qry_fornecedoresDATA_CADASTRO: TDateField
      FieldName = 'DATA_CADASTRO'
      Origin = 'FORNECEDOR.DATA_CADASTRO'
      Required = True
    end
    object qry_fornecedoresDATA_ULTIMA_COMPRA: TDateField
      FieldName = 'DATA_ULTIMA_COMPRA'
      Origin = 'FORNECEDOR.DATA_ULTIMA_COMPRA'
    end
    object qry_fornecedoresCONTATO: TIBStringField
      FieldName = 'CONTATO'
      Origin = 'FORNECEDOR.CONTATO'
      Size = 30
    end
    object qry_fornecedoresCOD_ESTADO: TIBStringField
      FieldName = 'COD_ESTADO'
      Origin = 'FORNECEDOR.COD_ESTADO'
      Size = 3
    end
    object qry_fornecedoresINSCRICAO_MUNICIPAL: TIBStringField
      FieldName = 'INSCRICAO_MUNICIPAL'
      Origin = 'FORNECEDOR.INSCRICAO_MUNICIPAL'
    end
    object qry_fornecedoresCOD_CIDADE: TIBStringField
      FieldName = 'COD_CIDADE'
      Origin = 'FORNECEDOR.COD_CIDADE'
      Size = 7
    end
    object qry_fornecedoresNOME_CIDADE: TIBStringField
      FieldName = 'NOME_CIDADE'
      Origin = 'CIDADE.NOME'
      Size = 50
    end
    object qry_fornecedoresNOMEESTADO: TIBStringField
      FieldName = 'NOMEESTADO'
      Origin = 'ESTADO.NOME'
      Size = 30
    end
    object qry_fornecedoresRAZAO_SOCIAL: TIBStringField
      FieldName = 'RAZAO_SOCIAL'
      Origin = 'FORNECEDOR.RAZAO_SOCIAL'
      Size = 100
    end
    object qry_fornecedoresNOME_FANTASIA: TIBStringField
      FieldName = 'NOME_FANTASIA'
      Origin = 'FORNECEDOR.NOME_FANTASIA'
      Size = 100
    end
    object qry_fornecedoresNUM_ENDERECO: TIBStringField
      FieldName = 'NUM_ENDERECO'
      Origin = 'FORNECEDOR.NUM_ENDERECO'
      Size = 5
    end
    object qry_fornecedoresCOMPLEMENTO: TIBStringField
      FieldName = 'COMPLEMENTO'
      Origin = 'FORNECEDOR.COMPLEMENTO'
      Size = 40
    end
  end
  object ds_qry_fornecedores: TDataSource
    DataSet = qry_fornecedores
    Left = 163
    Top = 473
  end
  object upd_fornecedores: TIBUpdateSQL
    RefreshSQL.Strings = (
      'Select *'
      'from fornecedor '
      'where'
      '  COD_FORNECEDOR = :COD_FORNECEDOR')
    ModifySQL.Strings = (
      'update fornecedor'
      'set'
      '  COD_FORNECEDOR = :COD_FORNECEDOR,'
      '  RAZAO_SOCIAL = :RAZAO_SOCIAL,'
      '  NOME_FANTASIA = :NOME_FANTASIA,'
      '  ENDERECO = :ENDERECO,'
      '  BAIRRO = :BAIRRO,'
      '  CEP = :CEP,'
      '  TELEFONE = :TELEFONE,'
      '  FAX = :FAX,'
      '  EMAIL = :EMAIL,'
      '  ATUALIZA_CUSTO = :ATUALIZA_CUSTO,'
      '  CGC_CPF = :CGC_CPF,'
      '  INSCRICAO_ESTADUAL = :INSCRICAO_ESTADUAL,'
      '  CODIGO_REPRESENTANTE = :CODIGO_REPRESENTANTE,'
      '  OBSERVACAO = :OBSERVACAO,'
      '  DATA_CADASTRO = :DATA_CADASTRO,'
      '  DATA_ULTIMA_COMPRA = :DATA_ULTIMA_COMPRA,'
      '  CONTATO = :CONTATO,'
      '  COD_ESTADO = :COD_ESTADO,'
      '  INSCRICAO_MUNICIPAL = :INSCRICAO_MUNICIPAL,'
      '  COD_CIDADE = :COD_CIDADE,'
      '  NUM_ENDERECO = :NUM_ENDERECO,'
      '  COMPLEMENTO = :COMPLEMENTO'
      'where'
      '  COD_FORNECEDOR = :OLD_COD_FORNECEDOR')
    InsertSQL.Strings = (
      'insert into fornecedor'
      
        '  (COD_FORNECEDOR, RAZAO_SOCIAL, NOME_FANTASIA, ENDERECO, BAIRRO' +
        ', CEP, '
      
        '   TELEFONE, FAX, EMAIL, ATUALIZA_CUSTO, CGC_CPF, INSCRICAO_ESTA' +
        'DUAL, CODIGO_REPRESENTANTE, '
      
        '   OBSERVACAO, DATA_CADASTRO, DATA_ULTIMA_COMPRA, CONTATO, COD_E' +
        'STADO, '
      '   INSCRICAO_MUNICIPAL, COD_CIDADE, NUM_ENDERECO, COMPLEMENTO)'
      'values'
      
        '  (:COD_FORNECEDOR, :RAZAO_SOCIAL, :NOME_FANTASIA, :ENDERECO, :B' +
        'AIRRO, '
      
        '   :CEP, :TELEFONE, :FAX, :EMAIL, :ATUALIZA_CUSTO, :CGC_CPF, :IN' +
        'SCRICAO_ESTADUAL, '
      
        '   :CODIGO_REPRESENTANTE, :OBSERVACAO, :DATA_CADASTRO, :DATA_ULT' +
        'IMA_COMPRA, '
      
        '   :CONTATO, :COD_ESTADO, :INSCRICAO_MUNICIPAL, :COD_CIDADE, :NU' +
        'M_ENDERECO, '
      '   :COMPLEMENTO)')
    DeleteSQL.Strings = (
      'delete from fornecedor'
      'where'
      '  COD_FORNECEDOR = :OLD_COD_FORNECEDOR')
    Left = 202
    Top = 472
  end
  object qry_historicos_caixa: TIBQuery
    Database = dbrestaurante
    Transaction = transacao
    BufferChunks = 1000
    CachedUpdates = True
    ParamCheck = True
    SQL.Strings = (
      'select * from historico_caixa')
    UpdateObject = upd_historicos_caixa
    Left = 15
    Top = 419
    object qry_historicos_caixaCOD_HISTORICO: TIBStringField
      FieldName = 'COD_HISTORICO'
      Origin = 'HISTORICO_CAIXA.COD_HISTORICO'
      Required = True
      Size = 3
    end
    object qry_historicos_caixaDESCRICAO: TIBStringField
      FieldName = 'DESCRICAO'
      Origin = 'HISTORICO_CAIXA.DESCRICAO'
      Required = True
      Size = 40
    end
    object qry_historicos_caixaDATA_CADASTRO: TDateField
      FieldName = 'DATA_CADASTRO'
      Origin = 'HISTORICO_CAIXA.DATA_CADASTRO'
      Required = True
    end
  end
  object ds_qry_historicos_caixa: TDataSource
    DataSet = qry_historicos_caixa
    Left = 52
    Top = 421
  end
  object upd_historicos_caixa: TIBUpdateSQL
    RefreshSQL.Strings = (
      'Select '
      'from historico_caixa '
      'where'
      '  COD_HISTORICO = :COD_HISTORICO')
    ModifySQL.Strings = (
      'update historico_caixa'
      'set'
      '  COD_HISTORICO = :COD_HISTORICO,'
      '  DESCRICAO = :DESCRICAO,'
      '  DATA_CADASTRO = :DATA_CADASTRO'
      'where'
      '  COD_HISTORICO = :OLD_COD_HISTORICO')
    InsertSQL.Strings = (
      'insert into historico_caixa'
      '  (COD_HISTORICO, DESCRICAO, DATA_CADASTRO)'
      'values'
      '  (:COD_HISTORICO, :DESCRICAO, :DATA_CADASTRO)')
    DeleteSQL.Strings = (
      'delete from historico_caixa'
      'where'
      '  COD_HISTORICO = :OLD_COD_HISTORICO')
    Left = 91
    Top = 420
  end
  object qry_grupos_fornecedores: TIBQuery
    Database = dbrestaurante
    Transaction = transacao
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      'select * from grupo_fornecedor')
    UpdateObject = upd_grupos_fornecedores
    Left = 13
    Top = 363
    object qry_grupos_fornecedoresCODIGO: TIBStringField
      FieldName = 'CODIGO'
      Origin = 'GRUPO_FORNECEDOR.CODIGO'
      Required = True
      Size = 4
    end
    object qry_grupos_fornecedoresDESCRICAO: TIBStringField
      FieldName = 'DESCRICAO'
      Origin = 'GRUPO_FORNECEDOR.DESCRICAO'
      Size = 30
    end
  end
  object upd_grupos_fornecedores: TIBUpdateSQL
    RefreshSQL.Strings = (
      'Select *'
      'from grupo_fornecedor '
      'where'
      '  CODIGO = :CODIGO')
    ModifySQL.Strings = (
      'update grupo_fornecedor'
      'set'
      '  CODIGO = :CODIGO,'
      '  DESCRICAO = :DESCRICAO'
      'where'
      '  CODIGO = :OLD_CODIGO')
    InsertSQL.Strings = (
      'insert into grupo_fornecedor'
      '  (CODIGO, DESCRICAO)'
      'values'
      '  (:CODIGO, :DESCRICAO)')
    DeleteSQL.Strings = (
      'delete from grupo_fornecedor'
      'where'
      '  CODIGO = :OLD_CODIGO')
    Left = 91
    Top = 364
  end
  object ds_qry_grupos_fornecedores: TDataSource
    DataSet = qry_grupos_fornecedores
    Left = 52
    Top = 365
  end
  object qry_grupos: TIBQuery
    Database = dbrestaurante
    Transaction = transacao
    BufferChunks = 1000
    CachedUpdates = True
    ParamCheck = True
    SQL.Strings = (
      'select * from grupos')
    UpdateObject = upd_grupos
    Left = 17
    Top = 314
    object qry_gruposCOD_GRUPO: TIBStringField
      FieldName = 'COD_GRUPO'
      Origin = 'GRUPOS.COD_GRUPO'
      Required = True
      Size = 6
    end
    object qry_gruposDESCRICAO: TIBStringField
      FieldName = 'DESCRICAO'
      Origin = 'GRUPOS.DESCRICAO'
      Size = 30
    end
    object qry_gruposRESULTADO_RD: TSmallintField
      FieldName = 'RESULTADO_RD'
      Origin = '"GRUPOS"."RESULTADO_RD"'
    end
    object qry_gruposPERC_PROJ_RD: TIBBCDField
      FieldName = 'PERC_PROJ_RD'
      Origin = '"GRUPOS"."PERC_PROJ_RD"'
      Precision = 18
      Size = 2
    end
    object qry_gruposMOSTRA_NO_RD: TSmallintField
      FieldName = 'MOSTRA_NO_RD'
      Origin = '"GRUPOS"."MOSTRA_NO_RD"'
    end
  end
  object upd_grupos: TIBUpdateSQL
    RefreshSQL.Strings = (
      'Select *'
      'from grupos '
      'where'
      '  COD_GRUPO = :COD_GRUPO')
    ModifySQL.Strings = (
      'update grupos'
      'set'
      '  COD_GRUPO = :COD_GRUPO,'
      '  DESCRICAO = :DESCRICAO,'
      '  RESULTADO_RD = :RESULTADO_RD,'
      '  PERC_PROJ_RD = :PERC_PROJ_RD,'
      '  MOSTRA_NO_RD = :MOSTRA_NO_RD'
      'where'
      '  COD_GRUPO = :OLD_COD_GRUPO')
    InsertSQL.Strings = (
      'insert into grupos'
      
        '  (COD_GRUPO, DESCRICAO, RESULTADO_RD, PERC_PROJ_RD, MOSTRA_NO_R' +
        'D)'
      'values'
      
        '  (:COD_GRUPO, :DESCRICAO, :RESULTADO_RD, :PERC_PROJ_RD, :MOSTRA' +
        '_NO_RD)')
    DeleteSQL.Strings = (
      'delete from grupos'
      'where'
      '  COD_GRUPO = :OLD_COD_GRUPO')
    Left = 93
    Top = 305
  end
  object ds_qry_grupos: TDataSource
    DataSet = qry_grupos
    Left = 53
    Top = 312
  end
  object ds_qry_garcons: TDataSource
    DataSet = qry_garcons
    Left = 56
    Top = 258
  end
  object qry_garcons: TIBQuery
    Database = dbrestaurante
    Transaction = transacao
    BufferChunks = 1000
    CachedUpdates = True
    ParamCheck = True
    SQL.Strings = (
      
        ' select g.cod_garcon, g.apelido, g.metre, g.cod_metre, g2.apelid' +
        'o '
      '  from garcons g'
      '  inner join garcons g2 on (g2.cod_garcon = g.cod_metre)')
    UpdateObject = up_qry_garcons
    Left = 16
    Top = 256
    object qry_garconsCOD_GARCON: TIBStringField
      FieldName = 'COD_GARCON'
      Origin = 'GARCONS.COD_GARCON'
      Required = True
      Size = 3
    end
    object qry_garconsAPELIDO: TIBStringField
      FieldName = 'APELIDO'
      Origin = 'GARCONS.APELIDO'
      Required = True
      Size = 30
    end
    object qry_garconsMETRE: TSmallintField
      FieldName = 'METRE'
      Origin = 'GARCONS.METRE'
      Required = True
    end
    object qry_garconsCOD_METRE: TIBStringField
      FieldName = 'COD_METRE'
      Origin = 'GARCONS.COD_METRE'
      Size = 3
    end
    object qry_garconsAPELIDO1: TIBStringField
      FieldName = 'APELIDO1'
      Origin = 'GARCONS.APELIDO'
      Required = True
      Size = 30
    end
  end
  object up_qry_garcons: TIBUpdateSQL
    RefreshSQL.Strings = (
      'Select *'
      'from garcons '
      'where'
      '  COD_GARCON = :COD_GARCON')
    ModifySQL.Strings = (
      'update garcons'
      'set'
      '  COD_GARCON = :COD_GARCON,'
      '  APELIDO = :APELIDO,'
      '  METRE = :METRE,'
      '  COD_METRE = :COD_METRE'
      'where'
      '  COD_GARCON = :OLD_COD_GARCON')
    InsertSQL.Strings = (
      'insert into garcons'
      '  (COD_GARCON, APELIDO, METRE, COD_METRE)'
      'values'
      '  (:COD_GARCON, :APELIDO, :METRE, :COD_METRE)')
    DeleteSQL.Strings = (
      'delete from garcons'
      'where'
      '  COD_GARCON = :OLD_COD_GARCON')
    Left = 91
    Top = 257
  end
  object qry_formas_pagto: TIBQuery
    Database = dbrestaurante
    Transaction = transacao
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      'select * from formas_pagamento')
    UpdateObject = upd_formas_pagto
    Left = 137
    Top = 254
    object qry_formas_pagtoCOD_FORMA: TIBStringField
      FieldName = 'COD_FORMA'
      Origin = 'FORMAS_PAGAMENTO.COD_FORMA'
      Required = True
      Size = 3
    end
    object qry_formas_pagtoDESCRICAO: TIBStringField
      FieldName = 'DESCRICAO'
      Origin = 'FORMAS_PAGAMENTO.DESCRICAO'
    end
    object qry_formas_pagtoRP: TSmallintField
      FieldName = 'RP'
      Origin = 'FORMAS_PAGAMENTO.RP'
    end
    object qry_formas_pagtoTIPO: TSmallintField
      DefaultExpression = '1'
      FieldName = 'TIPO'
      Origin = 'FORMAS_PAGAMENTO.TIPO'
    end
    object qry_formas_pagtoPERMITE_TROCO: TSmallintField
      DefaultExpression = '0'
      FieldName = 'PERMITE_TROCO'
      Origin = 'FORMAS_PAGAMENTO.PERMITE_TROCO'
    end
  end
  object upd_formas_pagto: TIBUpdateSQL
    RefreshSQL.Strings = (
      'Select *'
      'from formas_pagamento '
      'where'
      '  COD_FORMA = :COD_FORMA')
    ModifySQL.Strings = (
      'update formas_pagamento'
      'set'
      '  DESCRICAO = :DESCRICAO,'
      '  RP = :RP,'
      '  TIPO = :TIPO,'
      '  PERMITE_TROCO = :PERMITE_TROCO'
      'where'
      '  COD_FORMA = :OLD_COD_FORMA')
    InsertSQL.Strings = (
      'insert into formas_pagamento'
      '  (DESCRICAO, RP, TIPO, PERMITE_TROCO)'
      'values'
      '  (:DESCRICAO, :RP, :TIPO, :PERMITE_TROCO)')
    DeleteSQL.Strings = (
      'delete from formas_pagamento'
      'where'
      '  COD_FORMA = :OLD_COD_FORMA')
    Left = 217
    Top = 255
  end
  object ds_qry_formas_pagto: TDataSource
    DataSet = qry_formas_pagto
    Left = 175
    Top = 254
  end
  object qry_tipos_cli: TIBQuery
    Database = dbrestaurante
    Transaction = transacao
    BufferChunks = 1000
    CachedUpdates = True
    ParamCheck = True
    SQL.Strings = (
      'select * from tipos_cliente')
    Left = 256
    Top = 472
    object qry_tipos_cliCOD_TIPO: TIBStringField
      FieldName = 'COD_TIPO'
      Origin = 'TIPOS_CLIENTE.COD_TIPO'
      Required = True
      Size = 3
    end
    object qry_tipos_cliDESCRICAO: TIBStringField
      FieldName = 'DESCRICAO'
      Origin = 'TIPOS_CLIENTE.DESCRICAO'
    end
    object qry_tipos_cliPRAZO: TIntegerField
      FieldName = 'PRAZO'
      Origin = 'TIPOS_CLIENTE.PRAZO'
    end
  end
  object upd_tipos_cli: TIBUpdateSQL
    RefreshSQL.Strings = (
      'Select *'
      'from tipos_cliente '
      'where'
      '  COD_TIPO = :COD_TIPO')
    ModifySQL.Strings = (
      'update tipos_cliente'
      'set'
      '  COD_TIPO = :COD_TIPO,'
      '  DESCRICAO = :DESCRICAO,'
      '  PRAZO = :PRAZO'
      'where'
      '  COD_TIPO = :OLD_COD_TIPO')
    InsertSQL.Strings = (
      'insert into tipos_cliente'
      '  (COD_TIPO, DESCRICAO, PRAZO)'
      'values'
      '  (:COD_TIPO, :DESCRICAO, :PRAZO)')
    DeleteSQL.Strings = (
      'delete from tipos_cliente'
      'where'
      '  COD_TIPO = :OLD_COD_TIPO')
    Left = 331
    Top = 473
  end
  object ds_clientes: TDataSource
    DataSet = qry_clientes
    Left = 44
    Top = 522
  end
  object qry_clientes: TIBQuery
    Database = dbrestaurante
    Transaction = transacao
    BufferChunks = 1000
    CachedUpdates = True
    ParamCheck = True
    SQL.Strings = (
      'select  cli.*'
      'from clientes cli'
      '')
    UpdateObject = upd_clientes
    Left = 8
    Top = 523
    object qry_clientesCOD_CLI: TIBStringField
      FieldName = 'COD_CLI'
      Origin = 'CLIENTES.COD_CLI'
      Required = True
      Size = 6
    end
    object qry_clientesRAZAO_SOCIAL: TIBStringField
      FieldName = 'RAZAO_SOCIAL'
      Origin = 'CLIENTES.RAZAO_SOCIAL'
      Required = True
      Size = 40
    end
    object qry_clientesNOME_FANTASIA: TIBStringField
      FieldName = 'NOME_FANTASIA'
      Origin = 'CLIENTES.NOME_FANTASIA'
      Size = 40
    end
    object qry_clientesENDERECO: TIBStringField
      FieldName = 'ENDERECO'
      Origin = 'CLIENTES.ENDERECO'
      Size = 60
    end
    object qry_clientesBAIRRO: TIBStringField
      FieldName = 'BAIRRO'
      Origin = 'CLIENTES.BAIRRO'
      Size = 30
    end
    object qry_clientesCEP: TIBStringField
      FieldName = 'CEP'
      Origin = 'CLIENTES.CEP'
      Size = 8
    end
    object qry_clientesTELEFONE: TIBStringField
      FieldName = 'TELEFONE'
      Origin = 'CLIENTES.TELEFONE'
      EditMask = '(99)9999-9999;1;_'
    end
    object qry_clientesFAX: TIBStringField
      FieldName = 'FAX'
      Origin = 'CLIENTES.FAX'
    end
    object qry_clientesEMAIL: TIBStringField
      FieldName = 'EMAIL'
      Origin = 'CLIENTES.EMAIL'
      Size = 40
    end
    object qry_clientesCOD_TIPO: TIBStringField
      FieldName = 'COD_TIPO'
      Origin = 'CLIENTES.COD_TIPO'
      Size = 3
    end
    object qry_clientesATUALIZA_CUSTO: TSmallintField
      FieldName = 'ATUALIZA_CUSTO'
      Origin = 'CLIENTES.ATUALIZA_CUSTO'
    end
    object qry_clientesCGC_CPF: TIBStringField
      FieldName = 'CGC_CPF'
      Origin = 'CLIENTES.CGC_CPF'
      Size = 14
    end
    object qry_clientesINSCRICAO_ESTADUAL: TIBStringField
      FieldName = 'INSCRICAO_ESTADUAL'
      Origin = 'CLIENTES.INSCRICAO_ESTADUAL'
    end
    object qry_clientesINSCRICAO_MUNICIPAL: TIBStringField
      FieldName = 'INSCRICAO_MUNICIPAL'
      Origin = 'CLIENTES.INSCRICAO_MUNICIPAL'
      Size = 8
    end
    object qry_clientesOBSERVACAO: TIBStringField
      FieldName = 'OBSERVACAO'
      Origin = 'CLIENTES.OBSERVACAO'
      Size = 254
    end
    object qry_clientesDATA_CADASTRO: TDateField
      FieldName = 'DATA_CADASTRO'
      Origin = 'CLIENTES.DATA_CADASTRO'
      Required = True
    end
    object qry_clientesDATA_ULTIMA_COMPRA: TDateField
      FieldName = 'DATA_ULTIMA_COMPRA'
      Origin = 'CLIENTES.DATA_ULTIMA_COMPRA'
    end
    object qry_clientesSITUACAO: TSmallintField
      FieldName = 'SITUACAO'
      Origin = 'CLIENTES.SITUACAO'
      Required = True
    end
    object qry_clientesCREDITO: TIBBCDField
      FieldName = 'CREDITO'
      Origin = 'CLIENTES.CREDITO'
      Precision = 18
      Size = 2
    end
    object qry_clientesPRAZO_PAGAMENTO: TIntegerField
      FieldName = 'PRAZO_PAGAMENTO'
      Origin = 'CLIENTES.PRAZO_PAGAMENTO'
    end
    object qry_clientesDTNASCIMENTO: TDateField
      FieldName = 'DTNASCIMENTO'
      Origin = 'CLIENTES.DTNASCIMENTO'
      EditMask = '!99/99/0000;1;_'
    end
    object qry_clientesRG: TIBStringField
      FieldName = 'RG'
      Origin = 'CLIENTES.RG'
      Size = 16
    end
    object qry_clientesCARTAO: TIBStringField
      FieldName = 'CARTAO'
      Origin = 'CLIENTES.CARTAO'
      Size = 5
    end
  end
  object upd_clientes: TIBUpdateSQL
    RefreshSQL.Strings = (
      'Select *'
      'from clientes '
      'where'
      '  COD_CLI = :COD_CLI')
    ModifySQL.Strings = (
      'update clientes'
      'set'
      '  COD_CLI = :COD_CLI,'
      '  RAZAO_SOCIAL = :RAZAO_SOCIAL,'
      '  NOME_FANTASIA = :NOME_FANTASIA,'
      '  ENDERECO = :ENDERECO,'
      '  BAIRRO = :BAIRRO,'
      '  CEP = :CEP,'
      '  TELEFONE = :TELEFONE,'
      '  FAX = :FAX,'
      '  EMAIL = :EMAIL,'
      '  COD_TIPO = :COD_TIPO,'
      '  ATUALIZA_CUSTO = :ATUALIZA_CUSTO,'
      '  CGC_CPF = :CGC_CPF,'
      '  INSCRICAO_ESTADUAL = :INSCRICAO_ESTADUAL,'
      '  INSCRICAO_MUNICIPAL = :INSCRICAO_MUNICIPAL,'
      '  OBSERVACAO = :OBSERVACAO,'
      '  DATA_CADASTRO = :DATA_CADASTRO,'
      '  DATA_ULTIMA_COMPRA = :DATA_ULTIMA_COMPRA,'
      '  SITUACAO = :SITUACAO,'
      '  CREDITO = :CREDITO,'
      '  PRAZO_PAGAMENTO = :PRAZO_PAGAMENTO,'
      '  DTNASCIMENTO = :DTNASCIMENTO,'
      '  RG = :RG,'
      '  CARTAO = :CARTAO'
      'where'
      '  COD_CLI = :OLD_COD_CLI')
    InsertSQL.Strings = (
      'insert into clientes'
      
        '  (COD_CLI, RAZAO_SOCIAL, NOME_FANTASIA, ENDERECO, BAIRRO, CEP, ' +
        'TELEFONE, '
      
        '   FAX, EMAIL, COD_TIPO, ATUALIZA_CUSTO, CGC_CPF, INSCRICAO_ESTA' +
        'DUAL, INSCRICAO_MUNICIPAL, '
      
        '   OBSERVACAO, DATA_CADASTRO, DATA_ULTIMA_COMPRA, SITUACAO, CRED' +
        'ITO, PRAZO_PAGAMENTO, '
      '   DTNASCIMENTO, RG, CARTAO)'
      'values'
      
        '  (:COD_CLI, :RAZAO_SOCIAL, :NOME_FANTASIA, :ENDERECO, :BAIRRO, ' +
        ':CEP, :TELEFONE, '
      
        '   :FAX, :EMAIL, :COD_TIPO, :ATUALIZA_CUSTO, :CGC_CPF, :INSCRICA' +
        'O_ESTADUAL, '
      
        '   :INSCRICAO_MUNICIPAL, :OBSERVACAO, :DATA_CADASTRO, :DATA_ULTI' +
        'MA_COMPRA, '
      
        '   :SITUACAO, :CREDITO, :PRAZO_PAGAMENTO, :DTNASCIMENTO, :RG, :C' +
        'ARTAO)')
    DeleteSQL.Strings = (
      'delete from clientes'
      'where'
      '  COD_CLI = :OLD_COD_CLI')
    Left = 83
    Top = 522
  end
  object ds_tipos_cli: TDataSource
    DataSet = qry_tipos_cli
    Left = 288
    Top = 471
  end
  object qry_faturas: TIBQuery
    Database = dbrestaurante
    Transaction = transacao
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      'select f.*'
      ' ,c.razao_social,u1.login as usuario_inclusao,'
      '   u2.login as usuario_baixa'
      ''
      '        from faturas f'
      '   inner join clientes c on (c.cod_cli = f.cod_cli)'
      
        '   inner join usuarios u1 on (u1.cod_usuario = f.cod_usuario_inc' +
        'lusao)'
      
        '   left join usuarios u2 on (u2.cod_usuario = f.cod_usuario_baix' +
        'a)')
    UpdateObject = upd_faturas
    Left = 137
    Top = 310
    object qry_faturasCOD_FATURA: TIBStringField
      FieldName = 'COD_FATURA'
      Origin = 'FATURAS.COD_FATURA'
      Required = True
      Size = 6
    end
    object qry_faturasCOD_CLI: TIBStringField
      FieldName = 'COD_CLI'
      Origin = 'FATURAS.COD_CLI'
      Required = True
      Size = 6
    end
    object qry_faturasDATA_FATURA: TDateField
      FieldName = 'DATA_FATURA'
      Origin = 'FATURAS.DATA_FATURA'
    end
    object qry_faturasDATA_VENCIMENTO: TDateField
      FieldName = 'DATA_VENCIMENTO'
      Origin = 'FATURAS.DATA_VENCIMENTO'
      Required = True
    end
    object qry_faturasDATA_PAGAMENTO: TDateField
      FieldName = 'DATA_PAGAMENTO'
      Origin = 'FATURAS.DATA_PAGAMENTO'
    end
    object qry_faturasVALOR_FATURA: TIBBCDField
      FieldName = 'VALOR_FATURA'
      Origin = 'FATURAS.VALOR_FATURA'
      currency = True
      Precision = 18
      Size = 2
    end
    object qry_faturasVALOR_PAGO: TIBBCDField
      FieldName = 'VALOR_PAGO'
      Origin = 'FATURAS.VALOR_PAGO'
      currency = True
      Precision = 18
      Size = 2
    end
    object qry_faturasCOD_USUARIO_INCLUSAO: TIBStringField
      FieldName = 'COD_USUARIO_INCLUSAO'
      Origin = 'FATURAS.COD_USUARIO_INCLUSAO'
      Required = True
      Size = 2
    end
    object qry_faturasCOD_USUARIO_BAIXA: TIBStringField
      FieldName = 'COD_USUARIO_BAIXA'
      Origin = 'FATURAS.COD_USUARIO_BAIXA'
      Size = 2
    end
    object qry_faturasSTATUS: TSmallintField
      FieldName = 'STATUS'
      Origin = 'FATURAS.STATUS'
      Required = True
    end
    object qry_faturasCOD_VENDA: TIBStringField
      FieldName = 'COD_VENDA'
      Origin = 'FATURAS.COD_VENDA'
      Required = True
      Size = 8
    end
    object qry_faturasOBSERVACAO: TIBStringField
      FieldName = 'OBSERVACAO'
      Origin = 'FATURAS.OBSERVACAO'
      Size = 80
    end
    object qry_faturasRAZAO_SOCIAL: TIBStringField
      FieldName = 'RAZAO_SOCIAL'
      Origin = 'CLIENTES.RAZAO_SOCIAL'
      Required = True
      Size = 40
    end
    object qry_faturasUSUARIO_INCLUSAO: TIBStringField
      FieldName = 'USUARIO_INCLUSAO'
      Origin = 'USUARIOS.LOGIN'
      Required = True
      Size = 15
    end
    object qry_faturasUSUARIO_BAIXA: TIBStringField
      FieldName = 'USUARIO_BAIXA'
      Origin = 'USUARIOS.LOGIN'
      Size = 15
    end
    object qry_faturasSELECAO: TSmallintField
      FieldName = 'SELECAO'
      Origin = 'FATURAS.SELECAO'
    end
  end
  object upd_faturas: TIBUpdateSQL
    RefreshSQL.Strings = (
      'Select *'
      'from faturas '
      'where'
      '  COD_FATURA = :COD_FATURA')
    ModifySQL.Strings = (
      'update faturas'
      'set'
      '  COD_FATURA = :COD_FATURA,'
      '  COD_CLI = :COD_CLI,'
      '  DATA_VENCIMENTO = :DATA_VENCIMENTO,'
      '  DATA_PAGAMENTO = :DATA_PAGAMENTO,'
      '  VALOR_FATURA = :VALOR_FATURA,'
      '  VALOR_PAGO = :VALOR_PAGO,'
      '  COD_USUARIO_INCLUSAO = :COD_USUARIO_INCLUSAO,'
      '  COD_USUARIO_BAIXA = :COD_USUARIO_BAIXA,'
      '  STATUS = :STATUS,'
      '  SELECAO = :SELECAO'
      'where'
      '  COD_FATURA = :OLD_COD_FATURA')
    InsertSQL.Strings = (
      'insert into faturas'
      '  (COD_FATURA, COD_CLI, DATA_VENCIMENTO, DATA_PAGAMENTO, '
      'VALOR_FATURA, '
      '   VALOR_PAGO, COD_USUARIO_INCLUSAO, COD_USUARIO_BAIXA, STATUS, '
      'SELECAO)'
      'values'
      '  (:COD_FATURA, :COD_CLI, :DATA_VENCIMENTO, :DATA_PAGAMENTO, '
      ':VALOR_FATURA, '
      
        '   :VALOR_PAGO, :COD_USUARIO_INCLUSAO, :COD_USUARIO_BAIXA, :STAT' +
        'US, '
      ':SELECAO)')
    DeleteSQL.Strings = (
      'delete from faturas'
      'where'
      '  COD_FATURA = :OLD_COD_FATURA')
    Left = 217
    Top = 311
  end
  object qry_remota2: TIBQuery
    Transaction = transRemota
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    Left = 792
    Top = 560
  end
  object qry_importacoes: TIBQuery
    Database = dbrestaurante
    Transaction = transacao
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      'select * from importacoes')
    Left = 840
    Top = 560
  end
  object qry_remota: TIBQuery
    Transaction = transRemota
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    Left = 440
    Top = 440
  end
  object tbComprasTemp: TRxMemoryData
    FieldDefs = <
      item
        Name = 'codigo'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'descricao'
        DataType = ftString
        Size = 40
      end
      item
        Name = 'quantidade'
        DataType = ftFloat
      end
      item
        Name = 'codUnidade'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'siglaUnidade'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'preco'
        DataType = ftCurrency
      end
      item
        Name = 'CST'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'CFOP'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'desconto'
        DataType = ftCurrency
      end
      item
        Name = 'outrasDespAcessorias'
        DataType = ftCurrency
      end
      item
        Name = 'baseICMS'
        DataType = ftCurrency
      end
      item
        Name = 'valorICMS'
        DataType = ftCurrency
      end
      item
        Name = 'baseICMSST'
        DataType = ftCurrency
      end
      item
        Name = 'valorICMSST'
        DataType = ftCurrency
      end
      item
        Name = 'valorIPI'
        DataType = ftCurrency
      end
      item
        Name = 'aliquotaIPI'
        DataType = ftFloat
      end
      item
        Name = 'aliquotaICMS'
        DataType = ftFloat
      end
      item
        Name = 'descUnidade'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'paramUnidade'
        DataType = ftFloat
      end
      item
        Name = 'ordem'
        DataType = ftString
        Size = 20
      end>
    OnCalcFields = tbComprasTempCalcFields
    Left = 690
    Top = 296
    object tbComprasTempcodigo: TStringField
      FieldName = 'codigo'
    end
    object tbComprasTempdescricao: TStringField
      DisplayWidth = 40
      FieldName = 'descricao'
      Size = 40
    end
    object tbComprasTempquantidade: TFloatField
      FieldName = 'quantidade'
    end
    object tbComprasTempcodUnidade: TStringField
      FieldName = 'codUnidade'
    end
    object tbComprasTempsiglaUnidade: TStringField
      FieldName = 'siglaUnidade'
    end
    object tbComprasTemppreco: TCurrencyField
      DisplayWidth = 15
      FieldName = 'preco'
      currency = False
    end
    object tbComprasTempCST: TStringField
      FieldName = 'CST'
    end
    object tbComprasTempCFOP: TStringField
      FieldName = 'CFOP'
    end
    object tbComprasTempdesconto: TCurrencyField
      FieldName = 'desconto'
    end
    object tbComprasTempoutrasDespAcessorias: TCurrencyField
      FieldName = 'outrasDespAcessorias'
      currency = False
    end
    object tbComprasTempbaseICMS: TCurrencyField
      FieldName = 'baseICMS'
      currency = False
    end
    object tbComprasTempvalorICMS: TCurrencyField
      FieldName = 'valorICMS'
      currency = False
    end
    object tbComprasTempbaseICMSST: TCurrencyField
      FieldName = 'baseICMSST'
      currency = False
    end
    object tbComprasTempvalorICMSST: TCurrencyField
      FieldName = 'valorICMSST'
      currency = False
    end
    object tbComprasTempvalorIPI: TCurrencyField
      FieldName = 'valorIPI'
      currency = False
    end
    object tbComprasTempaliquotaIPI: TFloatField
      FieldName = 'aliquotaIPI'
    end
    object tbComprasTempaliquotaICMS: TFloatField
      FieldName = 'aliquotaICMS'
    end
    object tbComprasTempdescUnidade: TStringField
      FieldName = 'descUnidade'
    end
    object tbComprasTempparamUnidade: TFloatField
      FieldName = 'paramUnidade'
    end
    object tbComprasTempordem: TStringField
      FieldName = 'ordem'
    end
    object tbComprasTemptotal: TCurrencyField
      FieldKind = fkCalculated
      FieldName = 'total'
      Calculated = True
    end
  end
  object dsComprasTemp: TDataSource
    DataSet = tbComprasTemp
    Left = 778
    Top = 296
  end
  object qry_entradas: TIBQuery
    Database = dbrestaurante
    Transaction = transacao
    BufferChunks = 1000
    CachedUpdates = True
    ParamCheck = True
    SQL.Strings = (
      'select e.*,'
      '   f.razao_social as XRazaoSocial,'
      '   f.cgc_cpf as xCnpj,'
      '   f.inscricao_estadual as xInscricaoEstadual,'
      '   c.nome as XNomeCidade,'
      '   es.sigla as xUF,'
      
        '   mn.descricao as xModeloNota,   epg.descricao as xDescricaoLoj' +
        'a'
      ''
      ''
      ''
      '  from entradas e'
      ''
      ''
      
        '  inner join fornecedor f on (f.cod_fornecedor = e.cod_fornecedo' +
        'r)'
      '  inner join cidade c on (c.cod_cidade = f.cod_cidade)'
      '  inner join estado es on (es.codigo = f.cod_estado)'
      '  inner join modelos_nf mn on (mn.codigo = e.modelo_nota)'
      
        '  inner join empresas_grupo epg on (epg.codigo = e.cod_emp_grupo' +
        ')')
    UpdateObject = upd_entradas
    Left = 133
    Top = 366
    object qry_entradasCOD_ENTRADA: TIBStringField
      FieldName = 'COD_ENTRADA'
      Origin = '"ENTRADAS"."COD_ENTRADA"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 8
    end
    object qry_entradasCOD_FORNECEDOR: TIBStringField
      FieldName = 'COD_FORNECEDOR'
      Origin = '"ENTRADAS"."COD_FORNECEDOR"'
      Size = 4
    end
    object qry_entradasCOD_USUARIO: TIBStringField
      FieldName = 'COD_USUARIO'
      Origin = '"ENTRADAS"."COD_USUARIO"'
      Size = 3
    end
    object qry_entradasQTDE_ITENS: TSmallintField
      FieldName = 'QTDE_ITENS'
      Origin = '"ENTRADAS"."QTDE_ITENS"'
    end
    object qry_entradasDATA: TDateField
      FieldName = 'DATA'
      Origin = '"ENTRADAS"."DATA"'
    end
    object qry_entradasHORA: TTimeField
      FieldName = 'HORA'
      Origin = '"ENTRADAS"."HORA"'
    end
    object qry_entradasNOME_USUARIO_ENTRADA: TIBStringField
      FieldName = 'NOME_USUARIO_ENTRADA'
      Origin = '"ENTRADAS"."NOME_USUARIO_ENTRADA"'
      Size = 15
    end
    object qry_entradasDATA_EMISSAO: TDateField
      FieldName = 'DATA_EMISSAO'
      Origin = '"ENTRADAS"."DATA_EMISSAO"'
    end
    object qry_entradasDATA_ENTRADA: TDateField
      FieldName = 'DATA_ENTRADA'
      Origin = '"ENTRADAS"."DATA_ENTRADA"'
    end
    object qry_entradasNUMERO_NOTA: TIBStringField
      FieldName = 'NUMERO_NOTA'
      Origin = '"ENTRADAS"."NUMERO_NOTA"'
      Size = 15
    end
    object qry_entradasSERIE_NOTA: TIBStringField
      FieldName = 'SERIE_NOTA'
      Origin = '"ENTRADAS"."SERIE_NOTA"'
      Size = 3
    end
    object qry_entradasMODELO_NOTA: TIBStringField
      FieldName = 'MODELO_NOTA'
      Origin = '"ENTRADAS"."MODELO_NOTA"'
      Size = 2
    end
    object qry_entradasBASE_ICMS: TIBBCDField
      FieldName = 'BASE_ICMS'
      Origin = '"ENTRADAS"."BASE_ICMS"'
      Precision = 18
      Size = 2
    end
    object qry_entradasVALOR_ICMS: TIBBCDField
      FieldName = 'VALOR_ICMS'
      Origin = '"ENTRADAS"."VALOR_ICMS"'
      Precision = 18
      Size = 2
    end
    object qry_entradasBASE_ICMS_SUBST: TIBBCDField
      FieldName = 'BASE_ICMS_SUBST'
      Origin = '"ENTRADAS"."BASE_ICMS_SUBST"'
      Precision = 18
      Size = 2
    end
    object qry_entradasVALOR_ICMS_SUBST: TIBBCDField
      FieldName = 'VALOR_ICMS_SUBST'
      Origin = '"ENTRADAS"."VALOR_ICMS_SUBST"'
      Precision = 18
      Size = 2
    end
    object qry_entradasVALOR_PRODUTOS: TIBBCDField
      FieldName = 'VALOR_PRODUTOS'
      Origin = '"ENTRADAS"."VALOR_PRODUTOS"'
      Precision = 18
      Size = 2
    end
    object qry_entradasFRETE: TIBBCDField
      FieldName = 'FRETE'
      Origin = '"ENTRADAS"."FRETE"'
      Precision = 18
      Size = 2
    end
    object qry_entradasSEGURO: TIBBCDField
      FieldName = 'SEGURO'
      Origin = '"ENTRADAS"."SEGURO"'
      Precision = 18
      Size = 2
    end
    object qry_entradasDESCONTO: TIBBCDField
      FieldName = 'DESCONTO'
      Origin = '"ENTRADAS"."DESCONTO"'
      Precision = 18
      Size = 2
    end
    object qry_entradasOUTRAS_DESPESAS: TIBBCDField
      FieldName = 'OUTRAS_DESPESAS'
      Origin = '"ENTRADAS"."OUTRAS_DESPESAS"'
      Precision = 18
      Size = 2
    end
    object qry_entradasVALOR_IPI: TIBBCDField
      FieldName = 'VALOR_IPI'
      Origin = '"ENTRADAS"."VALOR_IPI"'
      Precision = 18
      Size = 2
    end
    object qry_entradasTOTAL_NOTA: TIBBCDField
      FieldName = 'TOTAL_NOTA'
      Origin = '"ENTRADAS"."TOTAL_NOTA"'
      Precision = 18
      Size = 2
    end
    object qry_entradasMES_REF_CONTABIL: TIBStringField
      FieldName = 'MES_REF_CONTABIL'
      Origin = '"ENTRADAS"."MES_REF_CONTABIL"'
      Size = 6
    end
    object qry_entradasCOD_EMP_GRUPO: TIBStringField
      FieldName = 'COD_EMP_GRUPO'
      Origin = '"ENTRADAS"."COD_EMP_GRUPO"'
      Size = 4
    end
    object qry_entradasCHAVE_NFE: TIBStringField
      FieldName = 'CHAVE_NFE'
      Origin = '"ENTRADAS"."CHAVE_NFE"'
      Size = 50
    end
    object qry_entradasTIPO_ENTRADA: TSmallintField
      FieldName = 'TIPO_ENTRADA'
      Origin = '"ENTRADAS"."TIPO_ENTRADA"'
    end
    object qry_entradasINFORMACOES_COMPLEMENTARES: TIBStringField
      FieldName = 'INFORMACOES_COMPLEMENTARES'
      Origin = '"ENTRADAS"."INFORMACOES_COMPLEMENTARES"'
      Size = 6000
    end
    object qry_entradasINFORMACOES_FISCO: TIBStringField
      FieldName = 'INFORMACOES_FISCO'
      Origin = '"ENTRADAS"."INFORMACOES_FISCO"'
      Size = 6000
    end
    object qry_entradasXRAZAOSOCIAL: TIBStringField
      FieldName = 'XRAZAOSOCIAL'
      Origin = '"FORNECEDOR"."RAZAO_SOCIAL"'
      Size = 100
    end
    object qry_entradasXCNPJ: TIBStringField
      FieldName = 'XCNPJ'
      Origin = '"FORNECEDOR"."CGC_CPF"'
      Size = 14
    end
    object qry_entradasXINSCRICAOESTADUAL: TIBStringField
      FieldName = 'XINSCRICAOESTADUAL'
      Origin = '"FORNECEDOR"."INSCRICAO_ESTADUAL"'
    end
    object qry_entradasXNOMECIDADE: TIBStringField
      FieldName = 'XNOMECIDADE'
      Origin = '"CIDADE"."NOME"'
      Size = 50
    end
    object qry_entradasXUF: TIBStringField
      FieldName = 'XUF'
      Origin = '"ESTADO"."SIGLA"'
      FixedChar = True
      Size = 2
    end
    object qry_entradasXMODELONOTA: TIBStringField
      FieldName = 'XMODELONOTA'
      Origin = '"MODELOS_NF"."DESCRICAO"'
      Size = 50
    end
    object qry_entradasXDESCRICAOLOJA: TIBStringField
      FieldName = 'XDESCRICAOLOJA'
      Origin = '"EMPRESAS_GRUPO"."DESCRICAO"'
      Size = 40
    end
  end
  object ds_entradas: TDataSource
    DataSet = qry_entradas
    Left = 175
    Top = 366
  end
  object upd_entradas: TIBUpdateSQL
    RefreshSQL.Strings = (
      'Select *'
      'from entradas '
      'where'
      '  COD_ENTRADA = :COD_ENTRADA')
    ModifySQL.Strings = (
      'update entradas'
      'set'
      '  COD_ENTRADA = :COD_ENTRADA,'
      '  COD_FORNECEDOR = :COD_FORNECEDOR,'
      '  COD_USUARIO = :COD_USUARIO,'
      '  QTDE_ITENS = :QTDE_ITENS,'
      '  DATA = :DATA,'
      '  HORA = :HORA,'
      '  NOME_USUARIO_ENTRADA = :NOME_USUARIO_ENTRADA,'
      '  DATA_EMISSAO = :DATA_EMISSAO,'
      '  DATA_ENTRADA = :DATA_ENTRADA,'
      '  NUMERO_NOTA = :NUMERO_NOTA,'
      '  SERIE_NOTA = :SERIE_NOTA,'
      '  MODELO_NOTA = :MODELO_NOTA,'
      '  BASE_ICMS = :BASE_ICMS,'
      '  VALOR_ICMS = :VALOR_ICMS,'
      '  BASE_ICMS_SUBST = :BASE_ICMS_SUBST,'
      '  VALOR_ICMS_SUBST = :VALOR_ICMS_SUBST,'
      '  VALOR_PRODUTOS = :VALOR_PRODUTOS,'
      '  FRETE = :FRETE,'
      '  SEGURO = :SEGURO,'
      '  DESCONTO = :DESCONTO,'
      '  OUTRAS_DESPESAS = :OUTRAS_DESPESAS,'
      '  VALOR_IPI = :VALOR_IPI,'
      '  TOTAL_NOTA = :TOTAL_NOTA,'
      '  MES_REF_CONTABIL = :MES_REF_CONTABIL,'
      '  COD_EMP_GRUPO = :COD_EMP_GRUPO,'
      '  CHAVE_NFE = :CHAVE_NFE,'
      '  TIPO_ENTRADA = :TIPO_ENTRADA,'
      '  INFORMACOES_COMPLEMENTARES = :INFORMACOES_COMPLEMENTARES,'
      '  INFORMACOES_FISCO = :INFORMACOES_FISCO'
      'where'
      '  COD_ENTRADA = :OLD_COD_ENTRADA')
    InsertSQL.Strings = (
      'insert into entradas'
      
        '  (COD_ENTRADA, COD_FORNECEDOR, COD_USUARIO, QTDE_ITENS, DATA, H' +
        'ORA, NOME_USUARIO_ENTRADA, '
      
        '   DATA_EMISSAO, DATA_ENTRADA, NUMERO_NOTA, SERIE_NOTA, MODELO_N' +
        'OTA, BASE_ICMS, '
      
        '   VALOR_ICMS, BASE_ICMS_SUBST, VALOR_ICMS_SUBST, VALOR_PRODUTOS' +
        ', FRETE, '
      
        '   SEGURO, DESCONTO, OUTRAS_DESPESAS, VALOR_IPI, TOTAL_NOTA, MES' +
        '_REF_CONTABIL, '
      
        '   COD_EMP_GRUPO, CHAVE_NFE, TIPO_ENTRADA, INFORMACOES_COMPLEMEN' +
        'TARES, '
      '   INFORMACOES_FISCO)'
      'values'
      
        '  (:COD_ENTRADA, :COD_FORNECEDOR, :COD_USUARIO, :QTDE_ITENS, :DA' +
        'TA, :HORA, '
      
        '   :NOME_USUARIO_ENTRADA, :DATA_EMISSAO, :DATA_ENTRADA, :NUMERO_' +
        'NOTA, :SERIE_NOTA, '
      
        '   :MODELO_NOTA, :BASE_ICMS, :VALOR_ICMS, :BASE_ICMS_SUBST, :VAL' +
        'OR_ICMS_SUBST, '
      
        '   :VALOR_PRODUTOS, :FRETE, :SEGURO, :DESCONTO, :OUTRAS_DESPESAS' +
        ', :VALOR_IPI, '
      
        '   :TOTAL_NOTA, :MES_REF_CONTABIL, :COD_EMP_GRUPO, :CHAVE_NFE, :' +
        'TIPO_ENTRADA, '
      '   :INFORMACOES_COMPLEMENTARES, :INFORMACOES_FISCO)')
    DeleteSQL.Strings = (
      'delete from entradas'
      'where'
      '  COD_ENTRADA = :OLD_COD_ENTRADA')
    Left = 217
    Top = 367
  end
  object qryReceitas: TIBQuery
    Database = dbrestaurante
    Transaction = transacao
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      'Select r.*, gr.descricao as descricao_grupo   from receitas r'
      
        '  inner join grupos_receita gr on (gr.cod_grupo_receita = r.cod_' +
        'grupo_receita)')
    UpdateObject = updQryReceitas
    Left = 129
    Top = 421
    object qryReceitasCOD_RECEITA: TIBStringField
      FieldName = 'COD_RECEITA'
      Origin = 'RECEITAS.COD_RECEITA'
      Required = True
      Size = 5
    end
    object qryReceitasCOD_GRUPO_RECEITA: TIBStringField
      FieldName = 'COD_GRUPO_RECEITA'
      Origin = 'RECEITAS.COD_GRUPO_RECEITA'
      Size = 3
    end
    object qryReceitasDESCRICAO: TIBStringField
      FieldName = 'DESCRICAO'
      Origin = 'RECEITAS.DESCRICAO'
      Size = 40
    end
    object qryReceitasPESSOAS: TSmallintField
      FieldName = 'PESSOAS'
      Origin = 'RECEITAS.PESSOAS'
    end
    object qryReceitasPESO: TIBBCDField
      FieldName = 'PESO'
      Origin = 'RECEITAS.PESO'
      Precision = 18
      Size = 2
    end
    object qryReceitasCALORIAS: TIBBCDField
      FieldName = 'CALORIAS'
      Origin = 'RECEITAS.CALORIAS'
      Precision = 18
      Size = 2
    end
    object qryReceitasPROTEINAS: TIBBCDField
      FieldName = 'PROTEINAS'
      Origin = 'RECEITAS.PROTEINAS'
      Precision = 18
      Size = 2
    end
    object qryReceitasCARBOIDRATOS: TIBBCDField
      FieldName = 'CARBOIDRATOS'
      Origin = 'RECEITAS.CARBOIDRATOS'
      Precision = 18
      Size = 2
    end
    object qryReceitasPREPARO: TIBStringField
      FieldName = 'PREPARO'
      Origin = 'RECEITAS.PREPARO'
      Size = 700
    end
    object qryReceitasDESCRICAO_GRUPO: TIBStringField
      FieldName = 'DESCRICAO_GRUPO'
      Origin = 'GRUPOS_RECEITA.DESCRICAO'
      Size = 30
    end
  end
  object dsQryReceitas: TDataSource
    DataSet = qryReceitas
    Left = 175
    Top = 422
  end
  object updQryReceitas: TIBUpdateSQL
    RefreshSQL.Strings = (
      'Select *'
      'from receitas '
      'where'
      '  COD_RECEITA = :COD_RECEITA')
    ModifySQL.Strings = (
      'update receitas'
      'set'
      '  COD_RECEITA = :COD_RECEITA,'
      '  COD_GRUPO_RECEITA = :COD_GRUPO_RECEITA,'
      '  DESCRICAO = :DESCRICAO,'
      '  PESSOAS = :PESSOAS,'
      '  PESO = :PESO,'
      '  CALORIAS = :CALORIAS,'
      '  PROTEINAS = :PROTEINAS,'
      '  CARBOIDRATOS = :CARBOIDRATOS,'
      '  PREPARO = :PREPARO'
      'where'
      '  COD_RECEITA = :OLD_COD_RECEITA')
    InsertSQL.Strings = (
      'insert into receitas'
      '  (COD_RECEITA, COD_GRUPO_RECEITA, DESCRICAO, PESSOAS, PESO, '
      'CALORIAS, '
      '   PROTEINAS, CARBOIDRATOS, PREPARO)'
      'values'
      
        '  (:COD_RECEITA, :COD_GRUPO_RECEITA, :DESCRICAO, :PESSOAS, :PESO' +
        ', '
      ':CALORIAS, '
      '   :PROTEINAS, :CARBOIDRATOS, :PREPARO)')
    DeleteSQL.Strings = (
      'delete from receitas'
      'where'
      '  COD_RECEITA = :OLD_COD_RECEITA')
    Left = 217
    Top = 422
  end
  object tbReceitasTemp: TRxMemoryData
    FieldDefs = <
      item
        Name = 'codigoItem'
        DataType = ftString
        Size = 5
      end
      item
        Name = 'descricaoItem'
        DataType = ftString
        Size = 40
      end
      item
        Name = 'codUnidade'
        DataType = ftString
        Size = 2
      end
      item
        Name = 'quantidade'
        DataType = ftFloat
      end
      item
        Name = 'descricaoUnidade'
        DataType = ftString
        Size = 30
      end>
    Left = 688
    Top = 344
    object tbReceitasTempcodigoItem: TStringField
      FieldName = 'codigoItem'
      Size = 5
    end
    object tbReceitasTempdescricaoItem: TStringField
      FieldName = 'descricaoItem'
      Size = 40
    end
    object tbReceitasTempcodUnidade: TStringField
      FieldName = 'codUnidade'
      Size = 2
    end
    object tbReceitasTempquantidade: TFloatField
      FieldName = 'quantidade'
    end
    object tbReceitasTempdescricaoUnidade: TStringField
      FieldName = 'descricaoUnidade'
      Size = 30
    end
  end
  object dsReceitasTemp: TDataSource
    DataSet = tbReceitasTemp
    Left = 776
    Top = 344
  end
  object lack: TIBQuery
    Database = dbrestaurante
    Transaction = transacao
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      'select * from reg60a')
    UpdateObject = updQryReg60A
    Left = 254
    Top = 368
    object lackCOD_REG: TIBStringField
      FieldName = 'COD_REG'
      Origin = 'REG60A.COD_REG'
      Required = True
      Size = 8
    end
    object lackDATA: TDateField
      FieldName = 'DATA'
      Origin = 'REG60A.DATA'
      Required = True
      EditMask = '99/99/9999;1;_'
    end
    object lackVALOR_ACUMULADO: TIBBCDField
      FieldName = 'VALOR_ACUMULADO'
      Origin = 'REG60A.VALOR_ACUMULADO'
      Precision = 18
      Size = 2
    end
    object lackALIQUOTA: TIBStringField
      FieldName = 'ALIQUOTA'
      Origin = 'REG60A.ALIQUOTA'
      Size = 4
    end
    object lackNUM_SERIE: TIBStringField
      FieldName = 'NUM_SERIE'
      Origin = 'REG60A.NUM_SERIE'
    end
  end
  object dsQryReg60A: TDataSource
    DataSet = lack
    Left = 291
    Top = 368
  end
  object updQryReg60A: TIBUpdateSQL
    RefreshSQL.Strings = (
      'Select *'
      'from reg60a '
      'where'
      '  COD_REG = :COD_REG')
    ModifySQL.Strings = (
      'update reg60a'
      'set'
      '  DATA = :DATA,'
      '  NUM_SERIE = :NUM_SERIE,'
      '  VALOR_ACUMULADO = :VALOR_ACUMULADO,'
      '  ALIQUOTA = :ALIQUOTA'
      'where'
      '  COD_REG = :OLD_COD_REG')
    InsertSQL.Strings = (
      'insert into reg60a'
      '  (COD_REG, DATA, NUM_SERIE, VALOR_ACUMULADO, ALIQUOTA)'
      'values'
      '  (:COD_REG, :DATA, :NUM_SERIE, :VALOR_ACUMULADO, :ALIQUOTA)')
    DeleteSQL.Strings = (
      'delete from reg60a'
      'where'
      '  COD_REG = :OLD_COD_REG')
    Left = 328
    Top = 368
  end
  object qryAliquotas: TIBQuery
    Database = dbrestaurante
    Transaction = transacao
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      'select * from aliquotas')
    UpdateObject = updQryAliquotas
    Left = 255
    Top = 255
    object qryAliquotasCOD_ALIQUOTA: TIBStringField
      FieldName = 'COD_ALIQUOTA'
      Origin = 'ALIQUOTAS.COD_ALIQUOTA'
      Required = True
      Size = 2
    end
    object qryAliquotasDESCRICAO: TIBStringField
      FieldName = 'DESCRICAO'
      Origin = 'ALIQUOTAS.DESCRICAO'
      Required = True
      Size = 10
    end
    object qryAliquotasPARAMETRO: TIBStringField
      FieldName = 'PARAMETRO'
      Origin = 'ALIQUOTAS.PARAMETRO'
      Required = True
      Size = 3
    end
    object qryAliquotasSINTEGRA: TIBStringField
      FieldName = 'SINTEGRA'
      Origin = 'ALIQUOTAS.SINTEGRA'
      Size = 4
    end
    object qryAliquotasPARAMETRO1: TIBStringField
      FieldName = 'PARAMETRO1'
      Origin = 'ALIQUOTAS.PARAMETRO1'
      Size = 3
    end
    object qryAliquotasPARAMETRO2: TIBStringField
      FieldName = 'PARAMETRO2'
      Origin = 'ALIQUOTAS.PARAMETRO2'
      Size = 3
    end
    object qryAliquotasPARAMETRO3: TIBStringField
      FieldName = 'PARAMETRO3'
      Origin = 'ALIQUOTAS.PARAMETRO3'
      Size = 3
    end
    object qryAliquotasPARAMETRO4: TIBStringField
      FieldName = 'PARAMETRO4'
      Origin = 'ALIQUOTAS.PARAMETRO4'
      Size = 3
    end
    object qryAliquotasPERCENTAGEM: TIBStringField
      FieldName = 'PERCENTAGEM'
      Origin = 'ALIQUOTAS.PERCENTAGEM'
      Size = 6
    end
  end
  object updQryAliquotas: TIBUpdateSQL
    RefreshSQL.Strings = (
      'Select *'
      'from aliquotas '
      'where'
      '  COD_ALIQUOTA = :COD_ALIQUOTA')
    ModifySQL.Strings = (
      'update aliquotas'
      'set'
      '  COD_ALIQUOTA = :COD_ALIQUOTA,'
      '  DESCRICAO = :DESCRICAO,'
      '  PARAMETRO = :PARAMETRO,'
      '  PERCENTAGEM = :PERCENTAGEM,'
      '  SINTEGRA = :SINTEGRA,'
      '  PARAMETRO1 = :PARAMETRO1,'
      '  PARAMETRO2 = :PARAMETRO2'
      'where'
      '  COD_ALIQUOTA = :OLD_COD_ALIQUOTA')
    InsertSQL.Strings = (
      'insert into aliquotas'
      
        '  (COD_ALIQUOTA, DESCRICAO, PARAMETRO, PERCENTAGEM, SINTEGRA, PA' +
        'RAMETRO1, '
      '   PARAMETRO2)'
      'values'
      
        '  (:COD_ALIQUOTA, :DESCRICAO, :PARAMETRO, :PERCENTAGEM, :SINTEGR' +
        'A, :PARAMETRO1, '
      '   :PARAMETRO2)')
    DeleteSQL.Strings = (
      'delete from aliquotas'
      'where'
      '  COD_ALIQUOTA = :OLD_COD_ALIQUOTA')
    Left = 331
    Top = 256
  end
  object dsQryAliquotas: TDataSource
    DataSet = qryAliquotas
    Left = 289
    Top = 255
  end
  object qryECFS: TIBQuery
    Database = dbrestaurante
    Transaction = transacao
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      'select * from impressoras_fiscais')
    UpdateObject = updQryECFS
    Left = 254
    Top = 310
    object qryECFSCOD_ECF: TIBStringField
      FieldName = 'COD_ECF'
      Origin = 'IMPRESSORAS_FISCAIS.COD_ECF'
      Required = True
      Size = 2
    end
    object qryECFSNUM_SERIE: TIBStringField
      FieldName = 'NUM_SERIE'
      Origin = 'IMPRESSORAS_FISCAIS.NUM_SERIE'
      Size = 30
    end
    object qryECFSNUMORDEM: TIBStringField
      FieldName = 'NUMORDEM'
      Origin = 'IMPRESSORAS_FISCAIS.NUMORDEM'
      Size = 3
    end
    object qryECFSDESCRICAO: TIBStringField
      FieldName = 'DESCRICAO'
      Origin = 'IMPRESSORAS_FISCAIS.DESCRICAO'
      Size = 15
    end
  end
  object updQryECFS: TIBUpdateSQL
    RefreshSQL.Strings = (
      'Select *'
      'from impressoras_fiscais '
      'where'
      '  COD_ECF = :COD_ECF')
    ModifySQL.Strings = (
      'update impressoras_fiscais'
      'set'
      '  COD_ECF = :COD_ECF,'
      '  NUM_SERIE = :NUM_SERIE,'
      '  NUMORDEM = :NUMORDEM,'
      '  DESCRICAO = :DESCRICAO'
      'where'
      '  COD_ECF = :OLD_COD_ECF')
    InsertSQL.Strings = (
      'insert into impressoras_fiscais'
      '  (COD_ECF, NUM_SERIE, NUMORDEM, DESCRICAO)'
      'values'
      '  (:COD_ECF, :NUM_SERIE, :NUMORDEM, :DESCRICAO)')
    DeleteSQL.Strings = (
      'delete from impressoras_fiscais'
      'where'
      '  COD_ECF = :OLD_COD_ECF')
    Left = 330
    Top = 310
  end
  object dsQryECFS: TDataSource
    DataSet = qryECFS
    Left = 288
    Top = 310
  end
  object transacaoProcedure: TIBTransaction
    DefaultDatabase = dbrestaurante
    Left = 832
    Top = 464
  end
  object qryReg60M: TIBQuery
    Database = dbrestaurante
    Transaction = transacao
    BufferChunks = 1000
    CachedUpdates = True
    ParamCheck = True
    SQL.Strings = (
      'select * from reg60m')
    UpdateObject = updQryReg60M
    Left = 255
    Top = 423
    object qryReg60MCOD_REG: TIBStringField
      FieldName = 'COD_REG'
      Origin = 'REG60M.COD_REG'
      Required = True
      Size = 8
    end
    object qryReg60MDATA: TDateField
      FieldName = 'DATA'
      Origin = 'REG60M.DATA'
      Required = True
    end
    object qryReg60MNUM_SERIE: TIBStringField
      FieldName = 'NUM_SERIE'
      Origin = 'REG60M.NUM_SERIE'
      Required = True
    end
    object qryReg60MNUM_ORD: TIBStringField
      FieldName = 'NUM_ORD'
      Origin = 'REG60M.NUM_ORD'
      Size = 3
    end
    object qryReg60MMODELO: TIBStringField
      FieldName = 'MODELO'
      Origin = 'REG60M.MODELO'
      Size = 2
    end
    object qryReg60MCOO_INI: TIBStringField
      FieldName = 'COO_INI'
      Origin = 'REG60M.COO_INI'
      Size = 6
    end
    object qryReg60MCOO_FIM: TIBStringField
      FieldName = 'COO_FIM'
      Origin = 'REG60M.COO_FIM'
      Size = 6
    end
    object qryReg60MCONT_Z: TIBStringField
      FieldName = 'CONT_Z'
      Origin = 'REG60M.CONT_Z'
      Size = 6
    end
    object qryReg60MCO_REIN_OP: TIBStringField
      FieldName = 'CO_REIN_OP'
      Origin = 'REG60M.CO_REIN_OP'
      Size = 3
    end
    object qryReg60MCANCELAMENTOS: TFloatField
      FieldName = 'CANCELAMENTOS'
      Origin = 'REG60M.CANCELAMENTOS'
      Required = True
    end
    object qryReg60MDESCONTOS: TFloatField
      FieldName = 'DESCONTOS'
      Origin = 'REG60M.DESCONTOS'
      Required = True
    end
    object qryReg60MSUBSTITUICAO: TFloatField
      FieldName = 'SUBSTITUICAO'
      Origin = 'REG60M.SUBSTITUICAO'
      Required = True
    end
    object qryReg60MISENCAO: TFloatField
      FieldName = 'ISENCAO'
      Origin = 'REG60M.ISENCAO'
      Required = True
    end
    object qryReg60MNAOTRIBUTADO: TFloatField
      FieldName = 'NAOTRIBUTADO'
      Origin = 'REG60M.NAOTRIBUTADO'
      Required = True
    end
    object qryReg60MALIQ7: TFloatField
      FieldName = 'ALIQ7'
      Origin = 'REG60M.ALIQ7'
      Required = True
    end
    object qryReg60MALIQ12: TFloatField
      FieldName = 'ALIQ12'
      Origin = 'REG60M.ALIQ12'
      Required = True
    end
    object qryReg60MALIQ17: TFloatField
      FieldName = 'ALIQ17'
      Origin = 'REG60M.ALIQ17'
      Required = True
    end
    object qryReg60MALIQ25: TFloatField
      FieldName = 'ALIQ25'
      Origin = 'REG60M.ALIQ25'
      Required = True
    end
    object qryReg60MVENDA_BRUTA: TFloatField
      FieldName = 'VENDA_BRUTA'
      Origin = 'REG60M.VENDA_BRUTA'
    end
    object qryReg60MTOT_GERAL: TFloatField
      FieldName = 'TOT_GERAL'
      Origin = 'REG60M.TOT_GERAL'
    end
  end
  object dsQryReg60M: TDataSource
    DataSet = qryReg60M
    Left = 290
    Top = 423
  end
  object updQryReg60M: TIBUpdateSQL
    RefreshSQL.Strings = (
      'Select *'
      'from reg60m '
      'where'
      '  COD_REG = :COD_REG')
    ModifySQL.Strings = (
      'update reg60m'
      'set'
      '  COD_REG = :COD_REG,'
      '  DATA = :DATA,'
      '  NUM_SERIE = :NUM_SERIE,'
      '  NUM_ORD = :NUM_ORD,'
      '  MODELO = :MODELO,'
      '  COO_INI = :COO_INI,'
      '  COO_FIM = :COO_FIM,'
      '  CONT_Z = :CONT_Z,'
      '  CO_REIN_OP = :CO_REIN_OP,'
      '  CANCELAMENTOS = :CANCELAMENTOS,'
      '  DESCONTOS = :DESCONTOS,'
      '  SUBSTITUICAO = :SUBSTITUICAO,'
      '  ISENCAO = :ISENCAO,'
      '  NAOTRIBUTADO = :NAOTRIBUTADO,'
      '  ALIQ7 = :ALIQ7,'
      '  ALIQ12 = :ALIQ12,'
      '  ALIQ17 = :ALIQ17,'
      '  ALIQ25 = :ALIQ25,'
      '  VENDA_BRUTA = :VENDA_BRUTA,'
      '  TOT_GERAL = :TOT_GERAL'
      'where'
      '  COD_REG = :OLD_COD_REG')
    InsertSQL.Strings = (
      'insert into reg60m'
      
        '  (COD_REG, DATA, NUM_SERIE, NUM_ORD, MODELO, COO_INI, COO_FIM, ' +
        'CONT_Z, '
      
        '   CO_REIN_OP, CANCELAMENTOS, DESCONTOS, SUBSTITUICAO, ISENCAO, ' +
        'NAOTRIBUTADO, '
      '   ALIQ7, ALIQ12, ALIQ17, ALIQ25, VENDA_BRUTA, TOT_GERAL)'
      'values'
      
        '  (:COD_REG, :DATA, :NUM_SERIE, :NUM_ORD, :MODELO, :COO_INI, :CO' +
        'O_FIM, '
      
        '   :CONT_Z, :CO_REIN_OP, :CANCELAMENTOS, :DESCONTOS, :SUBSTITUIC' +
        'AO, :ISENCAO, '
      
        '   :NAOTRIBUTADO, :ALIQ7, :ALIQ12, :ALIQ17, :ALIQ25, :VENDA_BRUT' +
        'A, :TOT_GERAL)')
    DeleteSQL.Strings = (
      'delete from reg60m'
      'where'
      '  COD_REG = :OLD_COD_REG')
    Left = 328
    Top = 423
  end
  object qryUnidades: TIBQuery
    Database = dbrestaurante
    Transaction = transacao
    BufferChunks = 1000
    CachedUpdates = True
    ParamCheck = True
    SQL.Strings = (
      'select u1.*,u2.descricao as descricaoUnidadePadrao'
      ' from unidades u1'
      '  inner join unidades u2 on (u2.cod_unidade = u1.cod_padrao)'
      '')
    UpdateObject = updQryUnidades
    Left = 128
    Top = 522
    object qryUnidadesCOD_UNIDADE: TIBStringField
      FieldName = 'COD_UNIDADE'
      Origin = 'UNIDADES.COD_UNIDADE'
      Required = True
      Size = 2
    end
    object qryUnidadesDESCRICAO: TIBStringField
      FieldName = 'DESCRICAO'
      Origin = 'UNIDADES.DESCRICAO'
      Size = 25
    end
    object qryUnidadesSIGLA: TIBStringField
      FieldName = 'SIGLA'
      Origin = 'UNIDADES.SIGLA'
      Size = 5
    end
    object qryUnidadesPARAMETRO: TIBBCDField
      FieldName = 'PARAMETRO'
      Origin = 'UNIDADES.PARAMETRO'
      Precision = 18
      Size = 3
    end
    object qryUnidadesCOD_PADRAO: TIBStringField
      FieldName = 'COD_PADRAO'
      Origin = 'UNIDADES.COD_PADRAO'
      Required = True
      Size = 2
    end
    object qryUnidadesDESCRICAOUNIDADEPADRAO: TIBStringField
      FieldName = 'DESCRICAOUNIDADEPADRAO'
      Origin = 'UNIDADES.DESCRICAO'
      Size = 25
    end
  end
  object dsQryUnidades: TDataSource
    DataSet = qryUnidades
    Left = 162
    Top = 523
  end
  object updQryUnidades: TIBUpdateSQL
    RefreshSQL.Strings = (
      'Select *'
      'from unidades '
      'where'
      '  COD_UNIDADE = :COD_UNIDADE')
    ModifySQL.Strings = (
      'update unidades'
      'set'
      '  DESCRICAO = :DESCRICAO,'
      '  SIGLA = :SIGLA,'
      '  PARAMETRO = :PARAMETRO,'
      '  COD_PADRAO = :COD_PADRAO'
      'where'
      '  COD_UNIDADE = :OLD_COD_UNIDADE')
    InsertSQL.Strings = (
      'insert into unidades'
      '  (COD_UNIDADE, DESCRICAO, SIGLA, PARAMETRO, COD_PADRAO)'
      'values'
      '  (:COD_UNIDADE, :DESCRICAO, :SIGLA, :PARAMETRO, :COD_PADRAO)')
    DeleteSQL.Strings = (
      'delete from unidades'
      'where'
      '  COD_UNIDADE = :OLD_COD_UNIDADE')
    Left = 201
    Top = 523
  end
  object qryTrasnferenciasEstoque: TIBQuery
    Database = dbrestaurante
    Transaction = transacao
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      
        'select tf.*, ite.descricao_item,un.descricao as desc_unidade, us' +
        '.nome_usuario'
      ''
      '  from trasnferencias_estoque tf'
      '  inner join itens_estoque ite on (ite.cod_item = tf.cod_item)'
      '  inner join usuarios us on (us.cod_usuario = tf.cod_usuario)'
      '  inner join unidades un on (un.cod_unidade = tf.cod_unidade)'
      '')
    UpdateObject = updTrasnferenciasEstoque
    Left = 256
    Top = 520
  end
  object dsTrasnferenciasEstoque: TDataSource
    DataSet = qryTrasnferenciasEstoque
    Left = 289
    Top = 520
  end
  object updTrasnferenciasEstoque: TIBUpdateSQL
    RefreshSQL.Strings = (
      'Select *'
      'from trasnferencias_estoque '
      'where'
      '  COD_TRANSFERENCIA = :COD_TRANSFERENCIA')
    ModifySQL.Strings = (
      'update trasnferencias_estoque'
      'set'
      '  COD_TRANSFERENCIA = :COD_TRANSFERENCIA,'
      '  DATA = :DATA,'
      '  HORA = :HORA,'
      '  COD_USUARIO = :COD_USUARIO,'
      '  COD_C_CUSTO = :COD_C_CUSTO,'
      '  COD_ITEM = :COD_ITEM,'
      '  QUANTIDADE = :QUANTIDADE,'
      '  COD_UNIDADE = :COD_UNIDADE'
      'where'
      '  COD_TRANSFERENCIA = :OLD_COD_TRANSFERENCIA')
    InsertSQL.Strings = (
      'insert into trasnferencias_estoque'
      '  (COD_TRANSFERENCIA, DATA, HORA, COD_USUARIO, COD_C_CUSTO, '
      'COD_ITEM, QUANTIDADE, '
      '   COD_UNIDADE)'
      'values'
      
        '  (:COD_TRANSFERENCIA, :DATA, :HORA, :COD_USUARIO, :COD_C_CUSTO,' +
        ' '
      ':COD_ITEM, '
      '   :QUANTIDADE, :COD_UNIDADE)')
    DeleteSQL.Strings = (
      'delete from trasnferencias_estoque'
      'where'
      '  COD_TRANSFERENCIA = :OLD_COD_TRANSFERENCIA')
    Left = 329
    Top = 520
  end
  object qryConsultaFaturas: TIBQuery
    Database = dbrestaurante
    Transaction = transacao
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      'select f.cod_venda as codigovenda, f.*  from faturas f')
    UpdateObject = updQryConsultaFaturas
    Left = 440
    Top = 248
    object qryConsultaFaturasCOD_FATURA: TIBStringField
      FieldName = 'COD_FATURA'
      Origin = 'FATURAS.COD_FATURA'
      ReadOnly = True
      Required = True
      Size = 6
    end
    object qryConsultaFaturasCOD_CLI: TIBStringField
      FieldName = 'COD_CLI'
      Origin = 'FATURAS.COD_CLI'
      ReadOnly = True
      Required = True
      Size = 6
    end
    object qryConsultaFaturasDATA_FATURA: TDateField
      FieldName = 'DATA_FATURA'
      Origin = 'FATURAS.DATA_FATURA'
      ReadOnly = True
    end
    object qryConsultaFaturasDATA_VENCIMENTO: TDateField
      FieldName = 'DATA_VENCIMENTO'
      Origin = 'FATURAS.DATA_VENCIMENTO'
      ReadOnly = True
      Required = True
    end
    object qryConsultaFaturasDATA_PAGAMENTO: TDateField
      FieldName = 'DATA_PAGAMENTO'
      Origin = 'FATURAS.DATA_PAGAMENTO'
      ReadOnly = True
    end
    object qryConsultaFaturasVALOR_FATURA: TIBBCDField
      FieldName = 'VALOR_FATURA'
      Origin = 'FATURAS.VALOR_FATURA'
      ReadOnly = True
      currency = True
      Precision = 18
      Size = 2
    end
    object qryConsultaFaturasVALOR_PAGO: TIBBCDField
      FieldName = 'VALOR_PAGO'
      Origin = 'FATURAS.VALOR_PAGO'
      ReadOnly = True
      Precision = 18
      Size = 2
    end
    object qryConsultaFaturasSTATUS: TSmallintField
      FieldName = 'STATUS'
      Origin = 'FATURAS.STATUS'
      ReadOnly = True
      Required = True
    end
    object qryConsultaFaturasCOD_VENDA: TIBStringField
      FieldName = 'COD_VENDA'
      Origin = 'FATURAS.COD_VENDA'
      ReadOnly = True
      Required = True
      Size = 8
    end
    object qryConsultaFaturasSELECAO: TSmallintField
      FieldName = 'SELECAO'
      Origin = 'FATURAS.SELECAO'
    end
    object qryConsultaFaturasUSUARIO_INCLUSAO: TIBStringField
      FieldName = 'USUARIO_INCLUSAO'
      Origin = 'FATURAS.USUARIO_INCLUSAO'
      ReadOnly = True
      Size = 15
    end
    object qryConsultaFaturasHORA: TTimeField
      FieldName = 'HORA'
      Origin = 'FATURAS.HORA'
      ReadOnly = True
      Required = True
    end
    object qryConsultaFaturasOBSERVACAO: TIBStringField
      FieldName = 'OBSERVACAO'
      Origin = 'FATURAS.OBSERVACAO'
      ReadOnly = True
      Required = True
      Size = 250
    end
    object qryConsultaFaturasCODIGOVENDA: TIBStringField
      FieldName = 'CODIGOVENDA'
      Origin = 'FATURAS.COD_VENDA'
      Required = True
      Size = 8
    end
  end
  object updQryConsultaFaturas: TIBUpdateSQL
    RefreshSQL.Strings = (
      'Select *'
      'from faturas '
      'where'
      '  COD_FATURA = :COD_FATURA')
    ModifySQL.Strings = (
      'update faturas'
      'set'
      '  COD_FATURA = :COD_FATURA,'
      '  COD_CLI = :COD_CLI,'
      '  DATA_FATURA = :DATA_FATURA,'
      '  DATA_VENCIMENTO = :DATA_VENCIMENTO,'
      '  DATA_PAGAMENTO = :DATA_PAGAMENTO,'
      '  VALOR_FATURA = :VALOR_FATURA,'
      '  VALOR_PAGO = :VALOR_PAGO,'
      '  STATUS = :STATUS,'
      '  COD_VENDA = :COD_VENDA,'
      '  SELECAO = :SELECAO,'
      '  USUARIO_INCLUSAO = :USUARIO_INCLUSAO,'
      '  HORA = :HORA,'
      '  OBSERVACAO = :OBSERVACAO'
      'where'
      '  COD_FATURA = :OLD_COD_FATURA')
    InsertSQL.Strings = (
      'insert into faturas'
      
        '  (COD_FATURA, COD_CLI, DATA_FATURA, DATA_VENCIMENTO, DATA_PAGAM' +
        'ENTO, VALOR_FATURA, '
      
        '   VALOR_PAGO, STATUS, COD_VENDA, SELECAO, USUARIO_INCLUSAO, HOR' +
        'A, OBSERVACAO)'
      'values'
      
        '  (:COD_FATURA, :COD_CLI, :DATA_FATURA, :DATA_VENCIMENTO, :DATA_' +
        'PAGAMENTO, '
      
        '   :VALOR_FATURA, :VALOR_PAGO, :STATUS, :COD_VENDA, :SELECAO, :U' +
        'SUARIO_INCLUSAO, '
      '   :HORA, :OBSERVACAO)')
    DeleteSQL.Strings = (
      'delete from faturas'
      'where'
      '  COD_FATURA = :OLD_COD_FATURA')
    Left = 568
    Top = 248
  end
  object dsQryConsultaFaturas: TDataSource
    DataSet = qryConsultaFaturas
    Left = 512
    Top = 248
  end
  object ds_qry_faturas: TDataSource
    DataSet = qry_faturas
    Left = 175
    Top = 310
  end
  object qryTotaisFaturas: TIBQuery
    Database = dbrestaurante
    Transaction = transacao
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    Left = 416
    Top = 344
  end
  object dsQryTotaisFaturas: TDataSource
    DataSet = qryTotaisFaturas
    Left = 520
    Top = 328
  end
  object dsCheckin: TDataSource
    Left = 533
    Top = 408
  end
  object updQryCheckin: TIBUpdateSQL
    RefreshSQL.Strings = (
      'Select *'
      'from movimentacao_clientes '
      'where'
      '  COD_MOVIMENTACAO = :COD_MOVIMENTACAO')
    ModifySQL.Strings = (
      'update movimentacao_clientes'
      'set'
      '  COD_MOVIMENTACAO = :COD_MOVIMENTACAO,'
      '  COD_CLI = :COD_CLI,'
      '  CARTAO = :CARTAO,'
      '  DATA = :DATA,'
      '  HORA_ENTRADA = :HORA_ENTRADA,'
      '  HORA_SAIDA = :HORA_SAIDA,'
      '  CONSUMO = :CONSUMO'
      'where'
      '  COD_MOVIMENTACAO = :OLD_COD_MOVIMENTACAO')
    InsertSQL.Strings = (
      'insert into movimentacao_clientes'
      
        '  (COD_MOVIMENTACAO, COD_CLI, CARTAO, DATA, HORA_ENTRADA, HORA_S' +
        'AIDA, CONSUMO)'
      'values'
      
        '  (:COD_MOVIMENTACAO, :COD_CLI, :CARTAO, :DATA, :HORA_ENTRADA, :' +
        'HORA_SAIDA, '
      '   :CONSUMO)')
    DeleteSQL.Strings = (
      'delete from movimentacao_clientes'
      'where'
      '  COD_MOVIMENTACAO = :OLD_COD_MOVIMENTACAO')
    Left = 600
    Top = 408
  end
  object qryClientesNaCasa: TIBQuery
    Database = dbrestaurante
    Transaction = transacao
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      'select c.cod_cartao, cli.razao_social  from cartoes c'
      '  inner join clientes cli on (cli.cod_cli = c.cod_cli )'
      '')
    Left = 418
    Top = 563
    object qryClientesNaCasaCOD_CARTAO: TIBStringField
      FieldName = 'COD_CARTAO'
      Origin = 'CARTOES.COD_CARTAO'
      Required = True
      Size = 4
    end
    object qryClientesNaCasaRAZAO_SOCIAL: TIBStringField
      FieldName = 'RAZAO_SOCIAL'
      Origin = 'CLIENTES.RAZAO_SOCIAL'
      Required = True
      Size = 40
    end
  end
  object dsQryClientesNaCasa: TDataSource
    DataSet = qryClientesNaCasa
    Left = 498
    Top = 555
  end
  object transacaoAuxiliar: TIBTransaction
    DefaultDatabase = dbrestaurante
    Left = 464
    Top = 8
  end
  object procProcessaCaixa: TIBStoredProc
    Database = dbrestaurante
    Transaction = transacao
    ForcedRefresh = True
    StoredProcName = 'PROCESSACAIXA'
    Left = 688
    Top = 520
    ParamData = <
      item
        DataType = ftString
        Name = 'NUMERO_CAIXA'
        ParamType = ptInput
      end>
  end
  object qryClientesDelivery: TIBQuery
    Database = dbrestaurante
    Transaction = transacao
    BufferChunks = 1000
    CachedUpdates = True
    ParamCheck = True
    SQL.Strings = (
      
        'select c.*, b.descricao  as DescricaoBairro  from clientes_deliv' +
        'ery c'
      ' inner join bairro b on (b.codigo = c.cod_bairro)')
    UpdateObject = updClientesDelivery
    Left = 8
    Top = 576
    object qryClientesDeliveryCODIGO: TIBStringField
      FieldName = 'CODIGO'
      Origin = 'CLIENTES_DELIVERY.CODIGO'
      Required = True
      Size = 5
    end
    object qryClientesDeliveryNOME: TIBStringField
      FieldName = 'NOME'
      Origin = 'CLIENTES_DELIVERY.NOME'
      Size = 60
    end
    object qryClientesDeliveryTELEFONE: TIBStringField
      FieldName = 'TELEFONE'
      Origin = 'CLIENTES_DELIVERY.TELEFONE'
      Size = 12
    end
    object qryClientesDeliverySEXO: TIBStringField
      FieldName = 'SEXO'
      Origin = 'CLIENTES_DELIVERY.SEXO'
      Size = 2
    end
    object qryClientesDeliveryENDERECO: TIBStringField
      FieldName = 'ENDERECO'
      Origin = 'CLIENTES_DELIVERY.ENDERECO'
      Size = 255
    end
    object qryClientesDeliveryCOD_BAIRRO: TIntegerField
      FieldName = 'COD_BAIRRO'
      Origin = 'CLIENTES_DELIVERY.COD_BAIRRO'
      Required = True
    end
    object qryClientesDeliveryCOMPLEMENTO: TIBStringField
      FieldName = 'COMPLEMENTO'
      Origin = 'CLIENTES_DELIVERY.COMPLEMENTO'
      Size = 100
    end
    object qryClientesDeliveryREFERENCIA1: TIBStringField
      FieldName = 'REFERENCIA1'
      Origin = 'CLIENTES_DELIVERY.REFERENCIA1'
      Size = 100
    end
    object qryClientesDeliveryREFERENCIA2: TIBStringField
      FieldName = 'REFERENCIA2'
      Origin = 'CLIENTES_DELIVERY.REFERENCIA2'
      Size = 100
    end
    object qryClientesDeliveryFREQ_COMPRA: TIntegerField
      FieldName = 'FREQ_COMPRA'
      Origin = 'CLIENTES_DELIVERY.FREQ_COMPRA'
    end
    object qryClientesDeliveryULTIMO_PEDIDO: TIBStringField
      FieldName = 'ULTIMO_PEDIDO'
      Origin = 'CLIENTES_DELIVERY.ULTIMO_PEDIDO'
      Size = 8
    end
    object qryClientesDeliveryDT_NASCIMENTO: TDateField
      FieldName = 'DT_NASCIMENTO'
      Origin = 'CLIENTES_DELIVERY.DT_NASCIMENTO'
    end
    object qryClientesDeliveryEMAIL: TIBStringField
      FieldName = 'EMAIL'
      Origin = 'CLIENTES_DELIVERY.EMAIL'
      Size = 40
    end
    object qryClientesDeliveryCELULAR: TIBStringField
      FieldName = 'CELULAR'
      Origin = 'CLIENTES_DELIVERY.CELULAR'
      Size = 12
    end
    object qryClientesDeliveryDESCRICAOBAIRRO: TIBStringField
      FieldName = 'DESCRICAOBAIRRO'
      Origin = 'BAIRRO.DESCRICAO'
      Size = 255
    end
  end
  object dsQryClientesDelivery: TDataSource
    DataSet = qryClientesDelivery
    Left = 88
    Top = 576
  end
  object updClientesDelivery: TIBUpdateSQL
    RefreshSQL.Strings = (
      'Select *'
      'from clientes_delivery '
      'where'
      '  CODIGO = :CODIGO')
    ModifySQL.Strings = (
      'update clientes_delivery'
      'set'
      '  CODIGO = :CODIGO,'
      '  NOME = :NOME,'
      '  TELEFONE = :TELEFONE,'
      '  SEXO = :SEXO,'
      '  ENDERECO = :ENDERECO,'
      '  COD_BAIRRO = :COD_BAIRRO,'
      '  COMPLEMENTO = :COMPLEMENTO,'
      '  REFERENCIA1 = :REFERENCIA1,'
      '  REFERENCIA2 = :REFERENCIA2,'
      '  FREQ_COMPRA = :FREQ_COMPRA,'
      '  ULTIMO_PEDIDO = :ULTIMO_PEDIDO,'
      '  DT_NASCIMENTO = :DT_NASCIMENTO,'
      '  EMAIL = :EMAIL,'
      '  CELULAR = :CELULAR'
      'where'
      '  CODIGO = :OLD_CODIGO')
    InsertSQL.Strings = (
      'insert into clientes_delivery'
      
        '  (CODIGO, NOME, TELEFONE, SEXO, ENDERECO, COD_BAIRRO, COMPLEMEN' +
        'TO, REFERENCIA1, '
      
        '   REFERENCIA2, FREQ_COMPRA, ULTIMO_PEDIDO, DT_NASCIMENTO, EMAIL' +
        ', CELULAR)'
      'values'
      
        '  (:CODIGO, :NOME, :TELEFONE, :SEXO, :ENDERECO, :COD_BAIRRO, :CO' +
        'MPLEMENTO, '
      
        '   :REFERENCIA1, :REFERENCIA2, :FREQ_COMPRA, :ULTIMO_PEDIDO, :DT' +
        '_NASCIMENTO, '
      '   :EMAIL, :CELULAR)')
    DeleteSQL.Strings = (
      'delete from clientes_delivery'
      'where'
      '  CODIGO = :OLD_CODIGO')
    Left = 48
    Top = 576
  end
  object qryBairro: TIBQuery
    Database = dbrestaurante
    Transaction = transacao
    BufferChunks = 1000
    CachedUpdates = True
    ParamCheck = True
    SQL.Strings = (
      'select * from bairro')
    UpdateObject = updQryBairro
    Left = 136
    Top = 576
  end
  object updQryBairro: TIBUpdateSQL
    RefreshSQL.Strings = (
      'Select *'
      'from bairro '
      'where'
      '  CODIGO = :CODIGO')
    ModifySQL.Strings = (
      'update bairro'
      'set'
      '  CODIGO = :CODIGO,'
      '  DESCRICAO = :DESCRICAO,'
      '  TXENTREGA = :TXENTREGA'
      'where'
      '  CODIGO = :OLD_CODIGO')
    InsertSQL.Strings = (
      'insert into bairro'
      '  (CODIGO, DESCRICAO, TXENTREGA)'
      'values'
      '  (:CODIGO, :DESCRICAO, :TXENTREGA)')
    DeleteSQL.Strings = (
      'delete from bairro'
      'where'
      '  CODIGO = :OLD_CODIGO')
    Left = 176
    Top = 576
  end
  object dsQryBairro: TDataSource
    DataSet = qryBairro
    Left = 224
    Top = 576
  end
  object qryExpedicaoDelivery: TIBQuery
    Database = dbrestaurante
    Transaction = transacao
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      'select * from pedidos_expedicao_delivery'
      ' where codigo <> 0'
      ' order by codigo')
    Left = 920
    Top = 160
    object qryExpedicaoDeliveryCODIGO: TIBStringField
      FieldName = 'CODIGO'
      Origin = '"PEDIDOS_EXPEDICAO_DELIVERY"."CODIGO"'
      Size = 8
    end
    object qryExpedicaoDeliveryCOD_CLIENTE: TIBStringField
      FieldName = 'COD_CLIENTE'
      Origin = '"PEDIDOS_EXPEDICAO_DELIVERY"."COD_CLIENTE"'
      Size = 5
    end
    object qryExpedicaoDeliveryVALOR_BRUTO: TIBBCDField
      FieldName = 'VALOR_BRUTO'
      Origin = '"PEDIDOS_EXPEDICAO_DELIVERY"."VALOR_BRUTO"'
      Precision = 18
      Size = 2
    end
    object qryExpedicaoDeliveryVALOR_DESCONTO: TIBBCDField
      FieldName = 'VALOR_DESCONTO'
      Origin = '"PEDIDOS_EXPEDICAO_DELIVERY"."VALOR_DESCONTO"'
      currency = True
      Precision = 18
      Size = 2
    end
    object qryExpedicaoDeliveryTAXA_ENTREGA: TIBBCDField
      FieldName = 'TAXA_ENTREGA'
      Origin = '"PEDIDOS_EXPEDICAO_DELIVERY"."TAXA_ENTREGA"'
      currency = True
      Precision = 18
      Size = 2
    end
    object qryExpedicaoDeliveryVALOR_PEDIDO: TIBBCDField
      FieldName = 'VALOR_PEDIDO'
      Origin = '"PEDIDOS_EXPEDICAO_DELIVERY"."VALOR_PEDIDO"'
      currency = True
      Precision = 18
      Size = 2
    end
    object qryExpedicaoDeliveryHORA_PEDIDO: TDateTimeField
      FieldName = 'HORA_PEDIDO'
      Origin = '"PEDIDOS_EXPEDICAO_DELIVERY"."HORA_PEDIDO"'
    end
    object qryExpedicaoDeliveryNOME_CLIENTE: TIBStringField
      FieldName = 'NOME_CLIENTE'
      Origin = '"PEDIDOS_EXPEDICAO_DELIVERY"."NOME_CLIENTE"'
      Size = 70
    end
    object qryExpedicaoDeliveryTELEFONE: TIBStringField
      FieldName = 'TELEFONE'
      Origin = '"PEDIDOS_EXPEDICAO_DELIVERY"."TELEFONE"'
      Size = 15
    end
    object qryExpedicaoDeliveryENDERECO: TIBStringField
      FieldName = 'ENDERECO'
      Origin = '"PEDIDOS_EXPEDICAO_DELIVERY"."ENDERECO"'
      Size = 255
    end
    object qryExpedicaoDeliveryBAIRRO: TIBStringField
      FieldName = 'BAIRRO'
      Origin = '"PEDIDOS_EXPEDICAO_DELIVERY"."BAIRRO"'
      Size = 40
    end
    object qryExpedicaoDeliveryHORA_LANCAMENTO: TDateTimeField
      FieldName = 'HORA_LANCAMENTO'
      Origin = '"PEDIDOS_EXPEDICAO_DELIVERY"."HORA_LANCAMENTO"'
    end
    object qryExpedicaoDeliveryHORA_SAIDA: TDateTimeField
      FieldName = 'HORA_SAIDA'
      Origin = '"PEDIDOS_EXPEDICAO_DELIVERY"."HORA_SAIDA"'
    end
    object qryExpedicaoDeliveryMINUTOS_SAIDA: TLargeintField
      FieldName = 'MINUTOS_SAIDA'
      Origin = '"PEDIDOS_EXPEDICAO_DELIVERY"."MINUTOS_SAIDA"'
    end
    object qryExpedicaoDeliveryTEMPO_SAIDA: TIBStringField
      FieldName = 'TEMPO_SAIDA'
      Origin = '"PEDIDOS_EXPEDICAO_DELIVERY"."TEMPO_SAIDA"'
    end
    object qryExpedicaoDeliveryENTREGADOR: TIBStringField
      FieldName = 'ENTREGADOR'
      Origin = '"PEDIDOS_EXPEDICAO_DELIVERY"."ENTREGADOR"'
      Size = 30
    end
    object qryExpedicaoDeliveryRETIRA_BALCAO: TSmallintField
      FieldName = 'RETIRA_BALCAO'
      Origin = '"PEDIDOS_EXPEDICAO_DELIVERY"."RETIRA_BALCAO"'
    end
    object qryExpedicaoDeliveryDATA_HORA_ENTREGA: TDateTimeField
      FieldName = 'DATA_HORA_ENTREGA'
      Origin = '"PEDIDOS_EXPEDICAO_DELIVERY"."DATA_HORA_ENTREGA"'
    end
    object qryExpedicaoDeliveryHORA_AGENDADA: TTimeField
      FieldName = 'HORA_AGENDADA'
      Origin = '"PEDIDOS_EXPEDICAO_DELIVERY"."HORA_AGENDADA"'
    end
    object qryExpedicaoDeliverySTATUS_PEDIDO: TIntegerField
      FieldName = 'STATUS_PEDIDO'
      Origin = '"PEDIDOS_EXPEDICAO_DELIVERY"."STATUS_PEDIDO"'
    end
  end
  object dsQryExpedicaoDElivery: TDataSource
    DataSet = qryExpedicaoDelivery
    Left = 920
    Top = 208
  end
  object qryProdutos: TIBQuery
    Database = dbrestaurante
    Transaction = transacao
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      'select * from r_informacoes_produto ')
    Left = 152
    Top = 624
  end
  object dsQryProdutos: TDataSource
    DataSet = qryProdutos
    Left = 128
    Top = 624
  end
  object qryConferenciaCaixa: TIBQuery
    Database = dbrestaurante
    Transaction = transacao
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      'select * from caixas')
    Left = 656
    Top = 608
  end
  object dsQryConferenciaCaixa: TDataSource
    DataSet = qryConferenciaCaixa
    Left = 696
    Top = 608
  end
  object qryTiposSangria: TIBQuery
    Database = dbrestaurante
    Transaction = transacao
    BufferChunks = 1000
    CachedUpdates = True
    ParamCheck = True
    SQL.Strings = (
      'select * from tipos_sangria')
    UpdateObject = upQryTiposSangria
    Left = 8
    Top = 617
    object qryTiposSangriaCODIGO: TIBStringField
      FieldName = 'CODIGO'
      Origin = 'TIPOS_SANGRIA.CODIGO'
      Required = True
      Size = 3
    end
    object qryTiposSangriaDESCRICAO: TIBStringField
      FieldName = 'DESCRICAO'
      Origin = 'TIPOS_SANGRIA.DESCRICAO'
      Size = 30
    end
  end
  object upQryTiposSangria: TIBUpdateSQL
    RefreshSQL.Strings = (
      'Select *'
      'from tipos_sangria '
      'where'
      '  CODIGO = :CODIGO')
    ModifySQL.Strings = (
      'update tipos_sangria'
      'set'
      '  CODIGO = :CODIGO,'
      '  DESCRICAO = :DESCRICAO'
      'where'
      '  CODIGO = :OLD_CODIGO')
    InsertSQL.Strings = (
      'insert into tipos_sangria'
      '  (CODIGO, DESCRICAO)'
      'values'
      '  (:CODIGO, :DESCRICAO)')
    DeleteSQL.Strings = (
      'delete from tipos_sangria'
      'where'
      '  CODIGO = :OLD_CODIGO')
    Left = 42
    Top = 618
  end
  object dsQryTiposSangria: TDataSource
    DataSet = qryTiposSangria
    Left = 76
    Top = 620
  end
  object qryMotivosEstorno: TIBQuery
    Database = dbrestaurante
    Transaction = transacao
    BufferChunks = 1000
    CachedUpdates = True
    ParamCheck = True
    SQL.Strings = (
      'select * from motivos_estornos'
      ' order by codigo')
    Left = 944
    Top = 256
    object qryMotivosEstornoCODIGO: TIBStringField
      FieldName = 'CODIGO'
      Origin = 'MOTIVOS_CANCELAMENTO.CODIGO'
      Required = True
      Size = 3
    end
    object qryMotivosEstornoDESCRICAO: TIBStringField
      FieldName = 'DESCRICAO'
      Origin = 'MOTIVOS_CANCELAMENTO.DESCRICAO'
      Size = 30
    end
  end
  object dsQryMotivosEstorno: TDataSource
    DataSet = qryMotivosEstorno
    Left = 984
    Top = 256
  end
  object updQryMovtivosEstornos: TIBUpdateSQL
    RefreshSQL.Strings = (
      'Select *'
      'from motivos_estornos '
      'where'
      '  CODIGO = :CODIGO')
    ModifySQL.Strings = (
      'update motivos_estornos'
      'set'
      '  CODIGO = :CODIGO,'
      '  DESCRICAO = :DESCRICAO'
      'where'
      '  CODIGO = :OLD_CODIGO')
    InsertSQL.Strings = (
      'insert into motivos_estornos'
      '  (CODIGO, DESCRICAO)'
      'values'
      '  (:CODIGO, :DESCRICAO)')
    DeleteSQL.Strings = (
      'delete from motivos_estornos'
      'where'
      '  CODIGO = :OLD_CODIGO')
    Left = 1032
    Top = 256
  end
  object qryObservacoesPreparo: TIBQuery
    Database = dbrestaurante
    Transaction = transacao
    BufferChunks = 1000
    CachedUpdates = True
    ParamCheck = True
    SQL.Strings = (
      'select * from observacoes_padrao order by descricao')
    Left = 944
    Top = 310
    object qryObservacoesPreparoCOD_OBS: TIBStringField
      FieldName = 'COD_OBS'
      Origin = 'OBSERVACOES_PADRAO.COD_OBS'
      Required = True
      Size = 3
    end
    object qryObservacoesPreparoDESCRICAO: TIBStringField
      FieldName = 'DESCRICAO'
      Origin = 'OBSERVACOES_PADRAO.DESCRICAO'
    end
  end
  object dsQryObservacoesPreparo: TDataSource
    DataSet = qryObservacoesPreparo
    Left = 984
    Top = 310
  end
  object updQryObservacoesPreparo: TIBUpdateSQL
    RefreshSQL.Strings = (
      'Select *'
      'from observacoes_padrao '
      'where'
      '  COD_OBS = :COD_OBS')
    ModifySQL.Strings = (
      'update observacoes_padrao'
      'set'
      '  COD_OBS = :COD_OBS,'
      '  DESCRICAO = :DESCRICAO'
      'where'
      '  COD_OBS = :OLD_COD_OBS')
    InsertSQL.Strings = (
      'insert into observacoes_padrao'
      '  (COD_OBS, DESCRICAO)'
      'values'
      '  (:COD_OBS, :DESCRICAO)')
    DeleteSQL.Strings = (
      'delete from observacoes_padrao'
      'where'
      '  COD_OBS = :OLD_COD_OBS')
    Left = 1032
    Top = 310
  end
  object qryTiposBaixaEstoque: TIBQuery
    Database = dbrestaurante
    Transaction = transacao
    BufferChunks = 1000
    CachedUpdates = True
    ParamCheck = True
    SQL.Strings = (
      'select * from tipos_baixa order by cod_tipo')
    UpdateObject = updQryTiposBaixaEstoque
    Left = 948
    Top = 362
    object qryTiposBaixaEstoqueCOD_TIPO: TIBStringField
      FieldName = 'COD_TIPO'
      Origin = 'TIPOS_BAIXA.COD_TIPO'
      Required = True
      Size = 3
    end
    object qryTiposBaixaEstoqueDESCRICAO: TIBStringField
      FieldName = 'DESCRICAO'
      Origin = 'TIPOS_BAIXA.DESCRICAO'
      Size = 40
    end
  end
  object dsQryTiposBaixaEstoque: TDataSource
    DataSet = qryTiposBaixaEstoque
    Left = 988
    Top = 362
  end
  object updQryTiposBaixaEstoque: TIBUpdateSQL
    RefreshSQL.Strings = (
      'Select *'
      'from tipos_baixa '
      'where'
      '  COD_TIPO = :COD_TIPO')
    ModifySQL.Strings = (
      'update tipos_baixa'
      'set'
      '  COD_TIPO = :COD_TIPO,'
      '  DESCRICAO = :DESCRICAO'
      'where'
      '  COD_TIPO = :OLD_COD_TIPO')
    InsertSQL.Strings = (
      'insert into tipos_baixa'
      '  (COD_TIPO, DESCRICAO)'
      'values'
      '  (:COD_TIPO, :DESCRICAO)')
    DeleteSQL.Strings = (
      'delete from tipos_baixa'
      'where'
      '  COD_TIPO = :OLD_COD_TIPO')
    Left = 1036
    Top = 362
  end
  object qrySaboresPizza: TIBQuery
    Database = dbrestaurante
    Transaction = transacao
    BufferChunks = 1000
    CachedUpdates = True
    ParamCheck = True
    SQL.Strings = (
      'select s.*,'
      
        '       p1.descricao as DESCBBALCAO, p2.descricao  as DESCBDELIVE' +
        'RY,'
      
        '       p3.descricao as DESCPBALCAO, p4.descricao  as DESCPDELIVE' +
        'RY,'
      
        '       p5.descricao as DESCMBALCAO, p6.descricao  as DESCMDELIVE' +
        'RY,'
      
        '       p7.descricao as DESCGBALCAO, p8.descricao  as DESCGDELIVE' +
        'RY,'
      
        '       p9.descricao as DESCFBALCAO, p10.descricao as DESCFDELIVE' +
        'RY'
      '        from sabores_pizza s'
      '       left join produtos p1 on (p1.cod_produto = s.Bbalcao)'
      '       left join produtos p2 on (p2.cod_produto = s.Bdelivery)'
      '       left join produtos p3 on (p3.cod_produto = s.Pbalcao)'
      '       left join produtos p4 on (p4.cod_produto = s.Pdelivery)'
      '       left join produtos p5 on (p5.cod_produto = s.Mbalcao)'
      '       left join produtos p6 on (p6.cod_produto = s.Mdelivery)'
      '       left join produtos p7 on (p7.cod_produto = s.Gbalcao)'
      '       left join produtos p8 on (p8.cod_produto = s.Gdelivery)'
      '       left join produtos p9 on (p9.cod_produto = s.Fbalcao)'
      '       left join produtos p10 on (p10.cod_produto = s.Fdelivery)')
    UpdateObject = updSaboresPizza
    Left = 944
    Top = 456
    object qrySaboresPizzaCODIGO: TIBStringField
      FieldName = 'CODIGO'
      Origin = 'SABORES_PIZZA.CODIGO'
      Size = 3
    end
    object qrySaboresPizzaDESCRICAO: TIBStringField
      FieldName = 'DESCRICAO'
      Origin = 'SABORES_PIZZA.DESCRICAO'
      Size = 25
    end
    object qrySaboresPizzaBBALCAO: TIBStringField
      FieldName = 'BBALCAO'
      Origin = 'SABORES_PIZZA.BBALCAO'
      Size = 5
    end
    object qrySaboresPizzaBDELIVERY: TIBStringField
      FieldName = 'BDELIVERY'
      Origin = 'SABORES_PIZZA.BDELIVERY'
      Size = 5
    end
    object qrySaboresPizzaPBALCAO: TIBStringField
      FieldName = 'PBALCAO'
      Origin = 'SABORES_PIZZA.PBALCAO'
      Size = 5
    end
    object qrySaboresPizzaPDELIVERY: TIBStringField
      FieldName = 'PDELIVERY'
      Origin = 'SABORES_PIZZA.PDELIVERY'
      Size = 5
    end
    object qrySaboresPizzaMBALCAO: TIBStringField
      FieldName = 'MBALCAO'
      Origin = 'SABORES_PIZZA.MBALCAO'
      Size = 5
    end
    object qrySaboresPizzaMDELIVERY: TIBStringField
      FieldName = 'MDELIVERY'
      Origin = 'SABORES_PIZZA.MDELIVERY'
      Size = 5
    end
    object qrySaboresPizzaGBALCAO: TIBStringField
      FieldName = 'GBALCAO'
      Origin = 'SABORES_PIZZA.GBALCAO'
      Size = 5
    end
    object qrySaboresPizzaGDELIVERY: TIBStringField
      FieldName = 'GDELIVERY'
      Origin = 'SABORES_PIZZA.GDELIVERY'
      Size = 5
    end
    object qrySaboresPizzaFBALCAO: TIBStringField
      FieldName = 'FBALCAO'
      Origin = 'SABORES_PIZZA.FBALCAO'
      Size = 5
    end
    object qrySaboresPizzaFDELIVERY: TIBStringField
      FieldName = 'FDELIVERY'
      Origin = 'SABORES_PIZZA.FDELIVERY'
      Size = 5
    end
    object qrySaboresPizzaPRECOBBALCAO: TIBBCDField
      FieldName = 'PRECOBBALCAO'
      Origin = 'SABORES_PIZZA.PRECOBBALCAO'
      currency = True
      Precision = 18
      Size = 2
    end
    object qrySaboresPizzaPRECOBDELIVERY: TIBBCDField
      FieldName = 'PRECOBDELIVERY'
      Origin = 'SABORES_PIZZA.PRECOBDELIVERY'
      currency = True
      Precision = 18
      Size = 2
    end
    object qrySaboresPizzaPRECOPBALCAO: TIBBCDField
      FieldName = 'PRECOPBALCAO'
      Origin = 'SABORES_PIZZA.PRECOPBALCAO'
      currency = True
      Precision = 18
      Size = 2
    end
    object qrySaboresPizzaPRECOPDELIVERY: TIBBCDField
      FieldName = 'PRECOPDELIVERY'
      Origin = 'SABORES_PIZZA.PRECOPDELIVERY'
      currency = True
      Precision = 18
      Size = 2
    end
    object qrySaboresPizzaPRECOMBALCAO: TIBBCDField
      FieldName = 'PRECOMBALCAO'
      Origin = 'SABORES_PIZZA.PRECOMBALCAO'
      currency = True
      Precision = 18
      Size = 2
    end
    object qrySaboresPizzaPRECOMDELIVERY: TIBBCDField
      FieldName = 'PRECOMDELIVERY'
      Origin = 'SABORES_PIZZA.PRECOMDELIVERY'
      currency = True
      Precision = 18
      Size = 2
    end
    object qrySaboresPizzaPRECOGBALCAO: TIBBCDField
      FieldName = 'PRECOGBALCAO'
      Origin = 'SABORES_PIZZA.PRECOGBALCAO'
      currency = True
      Precision = 18
      Size = 2
    end
    object qrySaboresPizzaPRECOGDELIVERY: TIBBCDField
      FieldName = 'PRECOGDELIVERY'
      Origin = 'SABORES_PIZZA.PRECOGDELIVERY'
      currency = True
      Precision = 18
      Size = 2
    end
    object qrySaboresPizzaPRECOFBALCAO: TIBBCDField
      FieldName = 'PRECOFBALCAO'
      Origin = 'SABORES_PIZZA.PRECOFBALCAO'
      currency = True
      Precision = 18
      Size = 2
    end
    object qrySaboresPizzaPRECOFDELIVERY: TIBBCDField
      FieldName = 'PRECOFDELIVERY'
      Origin = 'SABORES_PIZZA.PRECOFDELIVERY'
      currency = True
      Precision = 18
      Size = 2
    end
    object qrySaboresPizzaDESCBBALCAO: TIBStringField
      FieldName = 'DESCBBALCAO'
      Origin = 'PRODUTOS.DESCRICAO'
      Size = 40
    end
    object qrySaboresPizzaDESCBDELIVERY: TIBStringField
      FieldName = 'DESCBDELIVERY'
      Origin = 'PRODUTOS.DESCRICAO'
      Size = 40
    end
    object qrySaboresPizzaDESCPBALCAO: TIBStringField
      FieldName = 'DESCPBALCAO'
      Origin = 'PRODUTOS.DESCRICAO'
      Size = 40
    end
    object qrySaboresPizzaDESCPDELIVERY: TIBStringField
      FieldName = 'DESCPDELIVERY'
      Origin = 'PRODUTOS.DESCRICAO'
      Size = 40
    end
    object qrySaboresPizzaDESCMBALCAO: TIBStringField
      FieldName = 'DESCMBALCAO'
      Origin = 'PRODUTOS.DESCRICAO'
      Size = 40
    end
    object qrySaboresPizzaDESCMDELIVERY: TIBStringField
      FieldName = 'DESCMDELIVERY'
      Origin = 'PRODUTOS.DESCRICAO'
      Size = 40
    end
    object qrySaboresPizzaDESCGBALCAO: TIBStringField
      FieldName = 'DESCGBALCAO'
      Origin = 'PRODUTOS.DESCRICAO'
      Size = 40
    end
    object qrySaboresPizzaDESCGDELIVERY: TIBStringField
      FieldName = 'DESCGDELIVERY'
      Origin = 'PRODUTOS.DESCRICAO'
      Size = 40
    end
    object qrySaboresPizzaDESCFBALCAO: TIBStringField
      FieldName = 'DESCFBALCAO'
      Origin = 'PRODUTOS.DESCRICAO'
      Size = 40
    end
    object qrySaboresPizzaDESCFDELIVERY: TIBStringField
      FieldName = 'DESCFDELIVERY'
      Origin = 'PRODUTOS.DESCRICAO'
      Size = 40
    end
  end
  object dsQrySaboresPizza: TDataSource
    DataSet = qrySaboresPizza
    Left = 984
    Top = 456
  end
  object updSaboresPizza: TIBUpdateSQL
    RefreshSQL.Strings = (
      'Select *'
      'from sabores_pizza '
      'where'
      '  CODIGO = :CODIGO')
    ModifySQL.Strings = (
      'update sabores_pizza'
      'set'
      '  CODIGO = :CODIGO,'
      '  DESCRICAO = :DESCRICAO,'
      '  BBALCAO = :BBALCAO,'
      '  BDELIVERY = :BDELIVERY,'
      '  PBALCAO = :PBALCAO,'
      '  PDELIVERY = :PDELIVERY,'
      '  MBALCAO = :MBALCAO,'
      '  MDELIVERY = :MDELIVERY,'
      '  GBALCAO = :GBALCAO,'
      '  GDELIVERY = :GDELIVERY,'
      '  FBALCAO = :FBALCAO,'
      '  FDELIVERY = :FDELIVERY,'
      '  PRECOBBALCAO = :PRECOBBALCAO,'
      '  PRECOBDELIVERY = :PRECOBDELIVERY,'
      '  PRECOPBALCAO = :PRECOPBALCAO,'
      '  PRECOPDELIVERY = :PRECOPDELIVERY,'
      '  PRECOMBALCAO = :PRECOMBALCAO,'
      '  PRECOMDELIVERY = :PRECOMDELIVERY,'
      '  PRECOGBALCAO = :PRECOGBALCAO,'
      '  PRECOGDELIVERY = :PRECOGDELIVERY,'
      '  PRECOFBALCAO = :PRECOFBALCAO,'
      '  PRECOFDELIVERY = :PRECOFDELIVERY'
      'where'
      '  CODIGO = :OLD_CODIGO')
    InsertSQL.Strings = (
      'insert into sabores_pizza'
      
        '  (CODIGO, DESCRICAO, BBALCAO, BDELIVERY, PBALCAO, PDELIVERY, MB' +
        'ALCAO, '
      
        '   MDELIVERY, GBALCAO, GDELIVERY, FBALCAO, FDELIVERY, PRECOBBALC' +
        'AO, PRECOBDELIVERY, '
      
        '   PRECOPBALCAO, PRECOPDELIVERY, PRECOMBALCAO, PRECOMDELIVERY, P' +
        'RECOGBALCAO, '
      '   PRECOGDELIVERY, PRECOFBALCAO, PRECOFDELIVERY)'
      'values'
      
        '  (:CODIGO, :DESCRICAO, :BBALCAO, :BDELIVERY, :PBALCAO, :PDELIVE' +
        'RY, :MBALCAO, '
      
        '   :MDELIVERY, :GBALCAO, :GDELIVERY, :FBALCAO, :FDELIVERY, :PREC' +
        'OBBALCAO, '
      
        '   :PRECOBDELIVERY, :PRECOPBALCAO, :PRECOPDELIVERY, :PRECOMBALCA' +
        'O, :PRECOMDELIVERY, '
      
        '   :PRECOGBALCAO, :PRECOGDELIVERY, :PRECOFBALCAO, :PRECOFDELIVER' +
        'Y)')
    DeleteSQL.Strings = (
      'delete from sabores_pizza'
      'where'
      '  CODIGO = :OLD_CODIGO')
    Left = 1028
    Top = 456
  end
  object tbSaboresPizzaTemp: TRxMemoryData
    FieldDefs = <
      item
        Name = 'codigo'
        DataType = ftString
        Size = 3
      end
      item
        Name = 'tamanho'
        DataType = ftString
        Size = 5
      end
      item
        Name = 'descricao'
        DataType = ftString
        Size = 25
      end
      item
        Name = 'obs'
        DataType = ftString
        Size = 40
      end>
    Left = 1008
    Top = 619
    object tbSaboresPizzaTempcodigo: TStringField
      FieldName = 'codigo'
      Size = 3
    end
    object tbSaboresPizzaTemptamanho: TStringField
      FieldName = 'tamanho'
      Size = 5
    end
    object tbSaboresPizzaTempdescricao: TStringField
      FieldName = 'descricao'
      Size = 25
    end
    object tbSaboresPizzaTempobs: TStringField
      FieldName = 'obs'
      Size = 40
    end
    object tbSaboresPizzaTempproporcao: TFloatField
      FieldName = 'proporcao'
    end
    object tbSaboresPizzaTempvalorSabor: TFloatField
      FieldName = 'valorSabor'
    end
    object tbSaboresPizzaTempcodProduto: TStringField
      FieldName = 'codProduto'
      Size = 5
    end
  end
  object dsSaboresPizzaTemp: TDataSource
    DataSet = tbSaboresPizzaTemp
    Left = 1046
    Top = 616
  end
  object QryUltimosPedidosDelivery: TIBQuery
    Database = dbrestaurante
    Transaction = transacaoAuxiliar
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      ''
      
        ' select first 5 p.codigo as CodigoPedido, p.data,p.hora,p.valor_' +
        'entrega, p.valor_total,c.nome_usuario  from pedidos_delivery p'
      ' inner join caixas c on  (c.codigo =  p.cod_caixa)'
      'order by p.data desc')
    Left = 72
    Top = 680
  end
  object qryItensUltimosPedidos: TIBQuery
    Database = dbrestaurante
    Transaction = transacaoAuxiliar
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      
        ' select it.cod_pedido, p.cod_barras,it.cod_produto, p.descricao,' +
        ' it.quantidade,it.valor_unitario,'
      '        it.observacoes,it.sabores'
      '        from itens_pedido_delivery it'
      
        '       inner join  produtos p on (p.cod_produto = it.cod_produto' +
        ')'
      '        where it.cod_pedido =:codigoPedido'
      '')
    Left = 304
    Top = 680
    ParamData = <
      item
        DataType = ftString
        Name = 'CodigoPedido'
        ParamType = ptInput
        Size = 15
      end>
  end
  object dsQryUltimosPedidosDelivery: TDataSource
    DataSet = QryUltimosPedidosDelivery
    Left = 120
    Top = 680
  end
  object dsQryItensUltimosPedidosDelivery: TDataSource
    DataSet = qryItensUltimosPedidos
    Left = 360
    Top = 680
  end
  object qryEntregadores: TIBQuery
    Database = dbrestaurante
    Transaction = transacao
    BufferChunks = 1000
    CachedUpdates = True
    ParamCheck = True
    SQL.Strings = (
      'select * from entregadores')
    UpdateObject = updQryEntregadores
    Left = 544
    Top = 680
    object qryEntregadoresCODIGO: TIBStringField
      FieldName = 'CODIGO'
      Origin = 'ENTREGADORES.CODIGO'
      Required = True
      Size = 3
    end
    object qryEntregadoresNOME_ENTREGADOR: TIBStringField
      FieldName = 'NOME_ENTREGADOR'
      Origin = 'ENTREGADORES.NOME_ENTREGADOR'
      Size = 25
    end
    object qryEntregadoresPERC_COMISSAO_PEDIDO: TIBBCDField
      FieldName = 'PERC_COMISSAO_PEDIDO'
      Origin = 'ENTREGADORES.PERC_COMISSAO_PEDIDO'
      Required = True
      Precision = 18
      Size = 2
    end
    object qryEntregadoresCOMISSAO_POR_PEDIDO: TIBBCDField
      FieldName = 'COMISSAO_POR_PEDIDO'
      Origin = 'ENTREGADORES.COMISSAO_POR_PEDIDO'
      Required = True
      Precision = 18
      Size = 2
    end
    object qryEntregadoresVALOR_DIARIA: TIBBCDField
      FieldName = 'VALOR_DIARIA'
      Origin = 'ENTREGADORES.VALOR_DIARIA'
      Required = True
      Precision = 18
      Size = 2
    end
  end
  object updQryEntregadores: TIBUpdateSQL
    RefreshSQL.Strings = (
      'Select *'
      'from entregadores '
      'where'
      '  CODIGO = :CODIGO')
    ModifySQL.Strings = (
      'update entregadores'
      'set'
      '  CODIGO = :CODIGO,'
      '  NOME_ENTREGADOR = :NOME_ENTREGADOR,'
      '  PERC_COMISSAO_PEDIDO = :PERC_COMISSAO_PEDIDO,'
      '  COMISSAO_POR_PEDIDO = :COMISSAO_POR_PEDIDO,'
      '  VALOR_DIARIA = :VALOR_DIARIA'
      'where'
      '  CODIGO = :OLD_CODIGO')
    InsertSQL.Strings = (
      'insert into entregadores'
      
        '  (CODIGO, NOME_ENTREGADOR, PERC_COMISSAO_PEDIDO, COMISSAO_POR_P' +
        'EDIDO, '
      '   VALOR_DIARIA)'
      'values'
      
        '  (:CODIGO, :NOME_ENTREGADOR, :PERC_COMISSAO_PEDIDO, :COMISSAO_P' +
        'OR_PEDIDO, '
      '   :VALOR_DIARIA)')
    DeleteSQL.Strings = (
      'delete from entregadores'
      'where'
      '  CODIGO = :OLD_CODIGO')
    Left = 608
    Top = 680
  end
  object dsQryEntregadores: TDataSource
    DataSet = qryEntregadores
    Left = 576
    Top = 680
  end
  object qryObsClientesDelivery: TIBQuery
    Database = dbrestaurante
    Transaction = transacaoAuxiliar
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      'select * from obs_clientes_delivery')
    Left = 144
    Top = 752
  end
  object dsQryObsClientesDelivery: TDataSource
    DataSet = qryObsClientesDelivery
    Left = 216
    Top = 744
  end
  object qryCartoes: TIBQuery
    Database = dbrestaurante
    Transaction = transacao
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      'select * from cartoes')
    Left = 1200
    Top = 240
  end
  object dsQryCartoes: TDataSource
    DataSet = qryCartoes
    Left = 1232
    Top = 240
  end
  object proc_abate_submateria: TIBStoredProc
    Database = dbrestaurante
    Transaction = transacaoProcedure
    StoredProcName = 'ABATE_SUBMATERIA'
    Left = 1128
    Top = 88
    ParamData = <
      item
        DataType = ftString
        Name = 'COD_ITEM_SUBMATERIA'
        ParamType = ptInput
      end
      item
        DataType = ftBCD
        Name = 'BAIXA'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'DATA_SISTEMA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'USUARIO'
        ParamType = ptInput
      end>
  end
  object qryDadosPAF: TIBQuery
    Database = dbrestaurante
    Transaction = transacao
    BufferChunks = 1000
    CachedUpdates = True
    ParamCheck = True
    SQL.Strings = (
      'select * from  parametros_paf')
    UpdateObject = updQryDadosPAF
    Left = 976
    Top = 560
    object qryDadosPAFMD5_PAF: TIBStringField
      FieldName = 'MD5_PAF'
      Origin = 'PARAMETROS_PAF.MD5_PAF'
      Size = 100
    end
    object qryDadosPAFNOME_EMPRESA: TIBStringField
      FieldName = 'NOME_EMPRESA'
      Origin = 'PARAMETROS_PAF.NOME_EMPRESA'
      Required = True
      Size = 50
    end
    object qryDadosPAFCNPJ: TIBStringField
      FieldName = 'CNPJ'
      Origin = 'PARAMETROS_PAF.CNPJ'
      Required = True
      Size = 14
    end
    object qryDadosPAFINSCRICAO_ESTADUAL: TIBStringField
      FieldName = 'INSCRICAO_ESTADUAL'
      Origin = 'PARAMETROS_PAF.INSCRICAO_ESTADUAL'
      Required = True
      Size = 12
    end
    object qryDadosPAFINSCRICAO_MUNICIPAL: TIBStringField
      FieldName = 'INSCRICAO_MUNICIPAL'
      Origin = 'PARAMETROS_PAF.INSCRICAO_MUNICIPAL'
      Required = True
      Size = 12
    end
    object qryDadosPAFCONTATO: TIBStringField
      FieldName = 'CONTATO'
      Origin = 'PARAMETROS_PAF.CONTATO'
      Required = True
      Size = 60
    end
    object qryDadosPAFENDERECO: TIBStringField
      FieldName = 'ENDERECO'
      Origin = 'PARAMETROS_PAF.ENDERECO'
      Size = 100
    end
    object qryDadosPAFCIDADE: TIBStringField
      FieldName = 'CIDADE'
      Origin = 'PARAMETROS_PAF.CIDADE'
      Required = True
      Size = 30
    end
    object qryDadosPAFCEP: TIBStringField
      FieldName = 'CEP'
      Origin = 'PARAMETROS_PAF.CEP'
      Required = True
      Size = 10
    end
    object qryDadosPAFUF: TIBStringField
      FieldName = 'UF'
      Origin = 'PARAMETROS_PAF.UF'
      Size = 2
    end
    object qryDadosPAFTELEFONE: TIBStringField
      FieldName = 'TELEFONE'
      Origin = 'PARAMETROS_PAF.TELEFONE'
      Size = 12
    end
    object qryDadosPAFEMAIL: TIBStringField
      FieldName = 'EMAIL'
      Origin = 'PARAMETROS_PAF.EMAIL'
      Size = 40
    end
    object qryDadosPAFNOME_PAF: TIBStringField
      FieldName = 'NOME_PAF'
      Origin = 'PARAMETROS_PAF.NOME_PAF'
    end
    object qryDadosPAFVERSAO_PAF: TIBStringField
      FieldName = 'VERSAO_PAF'
      Origin = 'PARAMETROS_PAF.VERSAO_PAF'
      Size = 5
    end
    object qryDadosPAFVERSAO_ER: TIBStringField
      FieldName = 'VERSAO_ER'
      Origin = 'PARAMETROS_PAF.VERSAO_ER'
      Size = 8
    end
  end
  object updQryDadosPAF: TIBUpdateSQL
    RefreshSQL.Strings = (
      'Select * '
      'from parametros_paf ')
    ModifySQL.Strings = (
      'update parametros_paf'
      'set'
      '  MD5_PAF = :MD5_PAF,'
      '  NOME_EMPRESA = :NOME_EMPRESA,'
      '  CNPJ = :CNPJ,'
      '  INSCRICAO_ESTADUAL = :INSCRICAO_ESTADUAL,'
      '  INSCRICAO_MUNICIPAL = :INSCRICAO_MUNICIPAL,'
      '  CONTATO = :CONTATO,'
      '  ENDERECO = :ENDERECO,'
      '  CIDADE = :CIDADE,'
      '  CEP = :CEP,'
      '  UF = :UF,'
      '  TELEFONE = :TELEFONE,'
      '  EMAIL = :EMAIL,'
      '  NOME_PAF = :NOME_PAF,'
      '  VERSAO_PAF = :VERSAO_PAF,'
      '  VERSAO_ER = :VERSAO_ER')
    InsertSQL.Strings = (
      'insert into parametros_paf'
      '  (MD5_PAF, NOME_EMPRESA, CNPJ, INSCRICAO_ESTADUAL, '
      'INSCRICAO_MUNICIPAL, '
      
        '   CONTATO, ENDERECO, CIDADE, CEP, UF, TELEFONE, EMAIL, NOME_PAF' +
        ', '
      'VERSAO_PAF, '
      '   VERSAO_ER)'
      'values'
      '  (:MD5_PAF, :NOME_EMPRESA, :CNPJ, :INSCRICAO_ESTADUAL, '
      ':INSCRICAO_MUNICIPAL, '
      
        '   :CONTATO, :ENDERECO, :CIDADE, :CEP, :UF, :TELEFONE, :EMAIL, :' +
        'NOME_PAF, '
      '   :VERSAO_PAF, :VERSAO_ER)')
    DeleteSQL.Strings = (
      'delete from parametros_paf'
      'where'
      '  MD5_PAF = :OLD_MD5_PAF and'
      '  NOME_EMPRESA = :OLD_NOME_EMPRESA and'
      '  CNPJ = :OLD_CNPJ and'
      '  INSCRICAO_ESTADUAL = :OLD_INSCRICAO_ESTADUAL and'
      '  INSCRICAO_MUNICIPAL = :OLD_INSCRICAO_MUNICIPAL and'
      '  CONTATO = :OLD_CONTATO and'
      '  ENDERECO = :OLD_ENDERECO and'
      '  CIDADE = :OLD_CIDADE and'
      '  CEP = :OLD_CEP and'
      '  UF = :OLD_UF and'
      '  TELEFONE = :OLD_TELEFONE and'
      '  EMAIL = :OLD_EMAIL and'
      '  NOME_PAF = :OLD_NOME_PAF and'
      '  VERSAO_PAF = :OLD_VERSAO_PAF and'
      '  VERSAO_ER = :OLD_VERSAO_ER')
    Left = 1016
    Top = 560
  end
  object qryEcfEmUso: TIBQuery
    Database = dbrestaurante
    Transaction = transacao
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      'select * from impressoras_fiscais')
    UpdateObject = updQryEcfEmUso
    Left = 976
    Top = 512
  end
  object updQryEcfEmUso: TIBUpdateSQL
    RefreshSQL.Strings = (
      'Select *'
      'from impressoras_fiscais '
      'where'
      '  NUMORDEM = :NUMORDEM')
    ModifySQL.Strings = (
      'update impressoras_fiscais'
      'set'
      '  NUMORDEM = :NUMORDEM,'
      '  NUM_SERIE = :NUM_SERIE,'
      '  DESCRICAO = :DESCRICAO,'
      '  GT = :GT,'
      '  COD_MARCA = :COD_MARCA'
      'where'
      '  NUMORDEM = :OLD_NUMORDEM')
    InsertSQL.Strings = (
      'insert into impressoras_fiscais'
      '  (NUMORDEM, NUM_SERIE, DESCRICAO, GT, COD_MARCA)'
      'values'
      '  (:NUMORDEM, :NUM_SERIE, :DESCRICAO, :GT, :COD_MARCA)')
    DeleteSQL.Strings = (
      'delete from impressoras_fiscais'
      'where'
      '  NUMORDEM = :OLD_NUMORDEM')
    Left = 1016
    Top = 512
  end
  object updQryCidade: TIBUpdateSQL
    RefreshSQL.Strings = (
      'Select *'
      'from cidade '
      'where'
      '  COD_CIDADE = :COD_CIDADE and'
      '  NOME = :NOME and'
      '  CODIGO_ESTADO = :CODIGO_ESTADO')
    ModifySQL.Strings = (
      'update cidade'
      'set'
      '  COD_CIDADE = :COD_CIDADE,'
      '  NOME = :NOME,'
      '  CODIGO_ESTADO = :CODIGO_ESTADO'
      'where'
      '  COD_CIDADE = :OLD_COD_CIDADE and'
      '  NOME = :OLD_NOME and'
      '  CODIGO_ESTADO = :OLD_CODIGO_ESTADO')
    InsertSQL.Strings = (
      'insert into cidade'
      '  (COD_CIDADE, NOME, CODIGO_ESTADO)'
      'values'
      '  (:COD_CIDADE, :NOME, :CODIGO_ESTADO)')
    DeleteSQL.Strings = (
      'delete from cidade'
      'where'
      '  COD_CIDADE = :OLD_COD_CIDADE and'
      '  NOME = :OLD_NOME and'
      '  CODIGO_ESTADO = :OLD_CODIGO_ESTADO')
    Left = 456
    Top = 368
  end
  object dsQryCidade: TDataSource
    DataSet = qryCidade
    Left = 504
    Top = 376
  end
  object qryCidade: TIBQuery
    Database = dbrestaurante
    Transaction = transacao
    BufferChunks = 1000
    CachedUpdates = True
    ParamCheck = True
    SQL.Strings = (
      
        ' select ci.cod_cidade,ci.nome,ci.codigo_estado,es.nome as NomeEs' +
        'tado from cidade ci'
      
        '  inner join estado es on (es.codigo = ci.codigo_estado) where c' +
        'i.cod_cidade='#39'00053'#39)
    UpdateObject = updQryCidade
    Left = 408
    Top = 376
    object qryCidadeCOD_CIDADE: TIBStringField
      FieldName = 'COD_CIDADE'
      Origin = 'CIDADE.COD_CIDADE'
      Required = True
      Size = 7
    end
    object qryCidadeNOME: TIBStringField
      FieldName = 'NOME'
      Origin = 'CIDADE.NOME'
      Size = 50
    end
    object qryCidadeCODIGO_ESTADO: TIBStringField
      FieldName = 'CODIGO_ESTADO'
      Origin = 'CIDADE.CODIGO_ESTADO'
      Size = 3
    end
    object qryCidadeNOMEESTADO: TIBStringField
      FieldName = 'NOMEESTADO'
      Origin = 'ESTADO.NOME'
      Size = 30
    end
  end
  object qryNotasConsumidor: TIBQuery
    Database = dbrestaurante
    Transaction = transacao
    BufferChunks = 1000
    CachedUpdates = True
    ParamCheck = True
    SQL.Strings = (
      ''
      ' select nc.*,cf.descricao as desc_cfop,cs.descricao as desc_cst'
      '  from notas_consumidor nc'
      '     inner join cfop cf on (cf.codigo = nc.cfop)'
      '     inner join cst cs on (cs.cst = nc.cst_icms)')
    UpdateObject = updNotasConsumidor
    Left = 1168
    Top = 336
    object qryNotasConsumidorCODIGO: TIBStringField
      FieldName = 'CODIGO'
      Origin = 'NOTAS_CONSUMIDOR.CODIGO'
      Size = 6
    end
    object qryNotasConsumidorNUMERO_NOTA: TIBStringField
      FieldName = 'NUMERO_NOTA'
      Origin = 'NOTAS_CONSUMIDOR.NUMERO_NOTA'
      Size = 6
    end
    object qryNotasConsumidorSERIE: TIBStringField
      FieldName = 'SERIE'
      Origin = 'NOTAS_CONSUMIDOR.SERIE'
      Size = 4
    end
    object qryNotasConsumidorSUB_SERIE: TIBStringField
      FieldName = 'SUB_SERIE'
      Origin = 'NOTAS_CONSUMIDOR.SUB_SERIE'
      Size = 3
    end
    object qryNotasConsumidorDATA_DOC: TDateTimeField
      FieldName = 'DATA_DOC'
      Origin = 'NOTAS_CONSUMIDOR.DATA_DOC'
    end
    object qryNotasConsumidorDATA_LANCAMENTO: TDateTimeField
      FieldName = 'DATA_LANCAMENTO'
      Origin = 'NOTAS_CONSUMIDOR.DATA_LANCAMENTO'
    end
    object qryNotasConsumidorMES_REF_CONTABIL: TIBStringField
      FieldName = 'MES_REF_CONTABIL'
      Origin = 'NOTAS_CONSUMIDOR.MES_REF_CONTABIL'
      Size = 6
    end
    object qryNotasConsumidorCFOP: TIBStringField
      FieldName = 'CFOP'
      Origin = 'NOTAS_CONSUMIDOR.CFOP'
      Size = 4
    end
    object qryNotasConsumidorCST_ICMS: TIBStringField
      FieldName = 'CST_ICMS'
      Origin = 'NOTAS_CONSUMIDOR.CST_ICMS'
      Size = 3
    end
    object qryNotasConsumidorNUMERO_CUPOM_FISCAL: TIBStringField
      FieldName = 'NUMERO_CUPOM_FISCAL'
      Origin = 'NOTAS_CONSUMIDOR.NUMERO_CUPOM_FISCAL'
      Size = 6
    end
    object qryNotasConsumidorNUMERO_ECF: TIBStringField
      FieldName = 'NUMERO_ECF'
      Origin = 'NOTAS_CONSUMIDOR.NUMERO_ECF'
      Size = 3
    end
    object qryNotasConsumidorCPF_CNPJ_ADQUIRENTE: TIBStringField
      FieldName = 'CPF_CNPJ_ADQUIRENTE'
      Origin = 'NOTAS_CONSUMIDOR.CPF_CNPJ_ADQUIRENTE'
      Size = 14
    end
    object qryNotasConsumidorVALOR_MERCADORIAS: TIBBCDField
      FieldName = 'VALOR_MERCADORIAS'
      Origin = 'NOTAS_CONSUMIDOR.VALOR_MERCADORIAS'
      currency = True
      Precision = 18
      Size = 2
    end
    object qryNotasConsumidorBASE_ICMS: TIBBCDField
      FieldName = 'BASE_ICMS'
      Origin = 'NOTAS_CONSUMIDOR.BASE_ICMS'
      currency = True
      Precision = 18
      Size = 2
    end
    object qryNotasConsumidorREDUCAO_BASE_ICMS: TIBBCDField
      FieldName = 'REDUCAO_BASE_ICMS'
      Origin = 'NOTAS_CONSUMIDOR.REDUCAO_BASE_ICMS'
      currency = True
      Precision = 18
      Size = 2
    end
    object qryNotasConsumidorALIQ_ICMS: TIBBCDField
      FieldName = 'ALIQ_ICMS'
      Origin = 'NOTAS_CONSUMIDOR.ALIQ_ICMS'
      Precision = 18
      Size = 2
    end
    object qryNotasConsumidorVALOR_ICMS: TIBBCDField
      FieldName = 'VALOR_ICMS'
      Origin = 'NOTAS_CONSUMIDOR.VALOR_ICMS'
      currency = True
      Precision = 18
      Size = 2
    end
    object qryNotasConsumidorVALOR_DOC: TIBBCDField
      FieldName = 'VALOR_DOC'
      Origin = 'NOTAS_CONSUMIDOR.VALOR_DOC'
      currency = True
      Precision = 18
      Size = 2
    end
    object qryNotasConsumidorCANCELADO: TSmallintField
      FieldName = 'CANCELADO'
      Origin = 'NOTAS_CONSUMIDOR.CANCELADO'
      Required = True
    end
    object qryNotasConsumidorDESC_CFOP: TIBStringField
      FieldName = 'DESC_CFOP'
      Origin = 'CFOP.DESCRICAO'
      Required = True
      Size = 50
    end
    object qryNotasConsumidorDESC_CST: TIBStringField
      FieldName = 'DESC_CST'
      Origin = 'CST.DESCRICAO'
      Size = 80
    end
  end
  object updNotasConsumidor: TIBUpdateSQL
    RefreshSQL.Strings = (
      'Select *'
      'from notas_consumidor '
      'where'
      '  CODIGO = :CODIGO')
    ModifySQL.Strings = (
      'update notas_consumidor'
      'set'
      '  CODIGO = :CODIGO,'
      '  NUMERO_NOTA = :NUMERO_NOTA,'
      '  SERIE = :SERIE,'
      '  SUB_SERIE = :SUB_SERIE,'
      '  DATA_DOC = :DATA_DOC,'
      '  DATA_LANCAMENTO = :DATA_LANCAMENTO,'
      '  MES_REF_CONTABIL = :MES_REF_CONTABIL,'
      '  CFOP = :CFOP,'
      '  CST_ICMS = :CST_ICMS,'
      '  NUMERO_CUPOM_FISCAL = :NUMERO_CUPOM_FISCAL,'
      '  NUMERO_ECF = :NUMERO_ECF,'
      '  CPF_CNPJ_ADQUIRENTE = :CPF_CNPJ_ADQUIRENTE,'
      '  VALOR_MERCADORIAS = :VALOR_MERCADORIAS,'
      '  BASE_ICMS = :BASE_ICMS,'
      '  REDUCAO_BASE_ICMS = :REDUCAO_BASE_ICMS,'
      '  ALIQ_ICMS = :ALIQ_ICMS,'
      '  VALOR_ICMS = :VALOR_ICMS,'
      '  VALOR_DOC = :VALOR_DOC,'
      '  CANCELADO = :CANCELADO'
      'where'
      '  CODIGO = :OLD_CODIGO')
    InsertSQL.Strings = (
      'insert into notas_consumidor'
      
        '  (CODIGO, NUMERO_NOTA, SERIE, SUB_SERIE, DATA_DOC, DATA_LANCAME' +
        'NTO, MES_REF_CONTABIL, '
      
        '   CFOP, CST_ICMS, NUMERO_CUPOM_FISCAL, NUMERO_ECF, CPF_CNPJ_ADQ' +
        'UIRENTE, '
      
        '   VALOR_MERCADORIAS, BASE_ICMS, REDUCAO_BASE_ICMS, ALIQ_ICMS, V' +
        'ALOR_ICMS, '
      '   VALOR_DOC, CANCELADO)'
      'values'
      
        '  (:CODIGO, :NUMERO_NOTA, :SERIE, :SUB_SERIE, :DATA_DOC, :DATA_L' +
        'ANCAMENTO, '
      
        '   :MES_REF_CONTABIL, :CFOP, :CST_ICMS, :NUMERO_CUPOM_FISCAL, :N' +
        'UMERO_ECF, '
      
        '   :CPF_CNPJ_ADQUIRENTE, :VALOR_MERCADORIAS, :BASE_ICMS, :REDUCA' +
        'O_BASE_ICMS, '
      '   :ALIQ_ICMS, :VALOR_ICMS, :VALOR_DOC, :CANCELADO)')
    DeleteSQL.Strings = (
      'delete from notas_consumidor'
      'where'
      '  CODIGO = :OLD_CODIGO')
    Left = 1200
    Top = 336
  end
  object dsQryNotasConsumidor: TDataSource
    DataSet = qryNotasConsumidor
    Left = 1230
    Top = 336
  end
  object qryNotasTransporte: TIBQuery
    Database = dbrestaurante
    Transaction = transacao
    BufferChunks = 1000
    CachedUpdates = True
    ParamCheck = True
    SQL.Strings = (
      ''
      ''
      ''
      ' select nt.*, f.razao_social, f.cgc_cpf,'
      '        cf.descricao as desc_cfop,'
      '        cs.descricao as desc_cst,'
      '        m.descricao as desc_modelo,'
      '        s.descricao as desc_situacao'
      '  from notas_transporte nt'
      
        '   inner join fornecedor f on (f.cod_fornecedor = nt.cod_fornece' +
        'dor)'
      '   inner join cfop cf on (cf.codigo = nt.cfop)'
      '   inner join cst cs on (cs.cst = nt.cst_icms)'
      '   inner join modelos_nf m on (m.codigo = nt.modelo_nota)'
      
        '   inner join situacao_documento s on (s.cod_situacao = nt.situa' +
        'cao)')
    UpdateObject = updNotasTransporte
    Left = 1168
    Top = 384
    object qryNotasTransporteCODIGO: TIBStringField
      FieldName = 'CODIGO'
      Origin = 'NOTAS_TRANSPORTE.CODIGO'
      Size = 6
    end
    object qryNotasTransporteCOD_FORNECEDOR: TIBStringField
      FieldName = 'COD_FORNECEDOR'
      Origin = 'NOTAS_TRANSPORTE.COD_FORNECEDOR'
      Size = 4
    end
    object qryNotasTransporteNUMERO_NOTA: TIBStringField
      FieldName = 'NUMERO_NOTA'
      Origin = 'NOTAS_TRANSPORTE.NUMERO_NOTA'
      Size = 9
    end
    object qryNotasTransporteSERIE: TIBStringField
      FieldName = 'SERIE'
      Origin = 'NOTAS_TRANSPORTE.SERIE'
      Size = 4
    end
    object qryNotasTransporteSUB_SERIE: TIBStringField
      FieldName = 'SUB_SERIE'
      Origin = 'NOTAS_TRANSPORTE.SUB_SERIE'
      Size = 3
    end
    object qryNotasTransporteSITUACAO: TIBStringField
      FieldName = 'SITUACAO'
      Origin = 'NOTAS_TRANSPORTE.SITUACAO'
      Size = 2
    end
    object qryNotasTransporteDATA_EMISSAO: TDateTimeField
      FieldName = 'DATA_EMISSAO'
      Origin = 'NOTAS_TRANSPORTE.DATA_EMISSAO'
    end
    object qryNotasTransporteDATA_SERVICO: TDateTimeField
      FieldName = 'DATA_SERVICO'
      Origin = 'NOTAS_TRANSPORTE.DATA_SERVICO'
    end
    object qryNotasTransporteDATA_LANCAMENTO: TDateTimeField
      FieldName = 'DATA_LANCAMENTO'
      Origin = 'NOTAS_TRANSPORTE.DATA_LANCAMENTO'
      Required = True
    end
    object qryNotasTransporteMES_REF_CONTABIL: TIBStringField
      FieldName = 'MES_REF_CONTABIL'
      Origin = 'NOTAS_TRANSPORTE.MES_REF_CONTABIL'
      Size = 6
    end
    object qryNotasTransporteMODELO_NOTA: TIBStringField
      FieldName = 'MODELO_NOTA'
      Origin = 'NOTAS_TRANSPORTE.MODELO_NOTA'
      Size = 2
    end
    object qryNotasTransporteCFOP: TIBStringField
      FieldName = 'CFOP'
      Origin = 'NOTAS_TRANSPORTE.CFOP'
      Size = 4
    end
    object qryNotasTransporteCST_ICMS: TIBStringField
      FieldName = 'CST_ICMS'
      Origin = 'NOTAS_TRANSPORTE.CST_ICMS'
      Size = 3
    end
    object qryNotasTransporteVALOR_SERVICO: TIBBCDField
      DefaultExpression = '0'
      FieldName = 'VALOR_SERVICO'
      Origin = 'NOTAS_TRANSPORTE.VALOR_SERVICO'
      currency = True
      Precision = 18
      Size = 2
    end
    object qryNotasTransporteDESCONTO: TIBBCDField
      DefaultExpression = '0'
      FieldName = 'DESCONTO'
      Origin = 'NOTAS_TRANSPORTE.DESCONTO'
      currency = True
      Precision = 18
      Size = 2
    end
    object qryNotasTransporteBASE_ICMS: TIBBCDField
      DefaultExpression = '0'
      FieldName = 'BASE_ICMS'
      Origin = 'NOTAS_TRANSPORTE.BASE_ICMS'
      currency = True
      Precision = 18
      Size = 2
    end
    object qryNotasTransporteREDUCAO_BASE_ICMS: TIBBCDField
      DefaultExpression = '0'
      FieldName = 'REDUCAO_BASE_ICMS'
      Origin = 'NOTAS_TRANSPORTE.REDUCAO_BASE_ICMS'
      Precision = 18
      Size = 2
    end
    object qryNotasTransporteALIQ_ICMS: TIBBCDField
      DefaultExpression = '0'
      FieldName = 'ALIQ_ICMS'
      Origin = 'NOTAS_TRANSPORTE.ALIQ_ICMS'
      Precision = 18
      Size = 2
    end
    object qryNotasTransporteVALOR_ICMS: TIBBCDField
      DefaultExpression = '0'
      FieldName = 'VALOR_ICMS'
      Origin = 'NOTAS_TRANSPORTE.VALOR_ICMS'
      currency = True
      Precision = 18
      Size = 2
    end
    object qryNotasTransporteVALOR_NAO_TRIBUTADO: TIBBCDField
      DefaultExpression = '0'
      FieldName = 'VALOR_NAO_TRIBUTADO'
      Origin = 'NOTAS_TRANSPORTE.VALOR_NAO_TRIBUTADO'
      currency = True
      Precision = 18
      Size = 2
    end
    object qryNotasTransporteVALOR_DOC: TIBBCDField
      DefaultExpression = '0'
      FieldName = 'VALOR_DOC'
      Origin = 'NOTAS_TRANSPORTE.VALOR_DOC'
      currency = True
      Precision = 18
      Size = 2
    end
    object qryNotasTransporteTIPO_CTE: TIBStringField
      FieldName = 'TIPO_CTE'
      Origin = 'NOTAS_TRANSPORTE.TIPO_CTE'
      Size = 1
    end
    object qryNotasTransporteRAZAO_SOCIAL: TIBStringField
      FieldName = 'RAZAO_SOCIAL'
      Origin = 'FORNECEDOR.RAZAO_SOCIAL'
      Required = True
      Size = 40
    end
    object qryNotasTransporteCGC_CPF: TIBStringField
      FieldName = 'CGC_CPF'
      Origin = 'FORNECEDOR.CGC_CPF'
      Size = 14
    end
    object qryNotasTransporteDESC_CFOP: TIBStringField
      FieldName = 'DESC_CFOP'
      Origin = 'CFOP.DESCRICAO'
      Required = True
      Size = 50
    end
    object qryNotasTransporteDESC_CST: TIBStringField
      FieldName = 'DESC_CST'
      Origin = 'CST.DESCRICAO'
      Size = 80
    end
    object qryNotasTransporteDESC_MODELO: TIBStringField
      FieldName = 'DESC_MODELO'
      Origin = 'MODELOS_NF.DESCRICAO'
      Size = 50
    end
    object qryNotasTransporteID_FRETE: TSmallintField
      FieldName = 'ID_FRETE'
      Origin = 'NOTAS_TRANSPORTE.ID_FRETE'
    end
    object qryNotasTransporteDESC_SITUACAO: TIBStringField
      FieldName = 'DESC_SITUACAO'
      Origin = 'SITUACAO_DOCUMENTO.DESCRICAO'
      Size = 50
    end
    object qryNotasTransporteCHAVE_CTE: TIBStringField
      FieldName = 'CHAVE_CTE'
      Origin = 'NOTAS_TRANSPORTE.CHAVE_CTE'
      Size = 44
    end
    object qryNotasTransporteTIPODOC: TSmallintField
      FieldName = 'TIPODOC'
      Origin = 'NOTAS_TRANSPORTE.TIPODOC'
      Required = True
    end
  end
  object updNotasTransporte: TIBUpdateSQL
    RefreshSQL.Strings = (
      'Select *'
      'from notas_transporte '
      'where'
      '  CODIGO = :CODIGO')
    ModifySQL.Strings = (
      'update notas_transporte'
      'set'
      '  CODIGO = :CODIGO,'
      '  COD_FORNECEDOR = :COD_FORNECEDOR,'
      '  NUMERO_NOTA = :NUMERO_NOTA,'
      '  SERIE = :SERIE,'
      '  SUB_SERIE = :SUB_SERIE,'
      '  SITUACAO = :SITUACAO,'
      '  DATA_EMISSAO = :DATA_EMISSAO,'
      '  DATA_SERVICO = :DATA_SERVICO,'
      '  DATA_LANCAMENTO = :DATA_LANCAMENTO,'
      '  MES_REF_CONTABIL = :MES_REF_CONTABIL,'
      '  MODELO_NOTA = :MODELO_NOTA,'
      '  CFOP = :CFOP,'
      '  CST_ICMS = :CST_ICMS,'
      '  VALOR_SERVICO = :VALOR_SERVICO,'
      '  DESCONTO = :DESCONTO,'
      '  BASE_ICMS = :BASE_ICMS,'
      '  REDUCAO_BASE_ICMS = :REDUCAO_BASE_ICMS,'
      '  ALIQ_ICMS = :ALIQ_ICMS,'
      '  VALOR_ICMS = :VALOR_ICMS,'
      '  VALOR_NAO_TRIBUTADO = :VALOR_NAO_TRIBUTADO,'
      '  VALOR_DOC = :VALOR_DOC,'
      '  TIPO_CTE = :TIPO_CTE,'
      '  ID_FRETE = :ID_FRETE,'
      '  CHAVE_CTE = :CHAVE_CTE,'
      '  TIPODOC = :TIPODOC'
      'where'
      '  CODIGO = :OLD_CODIGO')
    InsertSQL.Strings = (
      'insert into notas_transporte'
      
        '  (CODIGO, COD_FORNECEDOR, NUMERO_NOTA, SERIE, SUB_SERIE, SITUAC' +
        'AO, DATA_EMISSAO, '
      
        '   DATA_SERVICO, DATA_LANCAMENTO, MES_REF_CONTABIL, MODELO_NOTA,' +
        ' CFOP, '
      
        '   CST_ICMS, VALOR_SERVICO, DESCONTO, BASE_ICMS, REDUCAO_BASE_IC' +
        'MS, ALIQ_ICMS, '
      
        '   VALOR_ICMS, VALOR_NAO_TRIBUTADO, VALOR_DOC, TIPO_CTE, ID_FRET' +
        'E, CHAVE_CTE, '
      '   TIPODOC)'
      'values'
      
        '  (:CODIGO, :COD_FORNECEDOR, :NUMERO_NOTA, :SERIE, :SUB_SERIE, :' +
        'SITUACAO, '
      
        '   :DATA_EMISSAO, :DATA_SERVICO, :DATA_LANCAMENTO, :MES_REF_CONT' +
        'ABIL, :MODELO_NOTA, '
      
        '   :CFOP, :CST_ICMS, :VALOR_SERVICO, :DESCONTO, :BASE_ICMS, :RED' +
        'UCAO_BASE_ICMS, '
      
        '   :ALIQ_ICMS, :VALOR_ICMS, :VALOR_NAO_TRIBUTADO, :VALOR_DOC, :T' +
        'IPO_CTE, '
      '   :ID_FRETE, :CHAVE_CTE, :TIPODOC)')
    DeleteSQL.Strings = (
      'delete from notas_transporte'
      'where'
      '  CODIGO = :OLD_CODIGO')
    Left = 1200
    Top = 384
  end
  object dsQryNotasTransporte: TDataSource
    DataSet = qryNotasTransporte
    Left = 1230
    Top = 384
  end
  object qry_saidas: TIBQuery
    Database = dbrestaurante
    Transaction = transacao
    BufferChunks = 1000
    CachedUpdates = True
    ParamCheck = True
    SQL.Strings = (
      '  select s.*,'
      '   f.razao_social as XRazaoSocial,'
      '   f.cgc_cpf as xCnpj,'
      '   f.inscricao_estadual as xInscricaoEstadual,'
      '   c.nome as XNomeCidade,'
      '   es.sigla as xUF,'
      '   mn.descricao as xModeloNota,'
      '   cf.descricao as xCfopDescricao,'
      '   sd.descricao as XdescSituacaoNota'
      '  from saidas s'
      
        '  inner join fornecedor f on (f.cod_fornecedor = s.cod_fornecedo' +
        'r)'
      '  inner join cidade c on (c.cod_cidade = f.cod_cidade)'
      '  inner join estado es on (es.codigo = f.cod_estado)'
      '  inner join modelos_nf mn on (mn.codigo = s.modelo_nota)'
      '  inner join cfop cf on (cf.codigo = s.cfop_nota)'
      
        '  inner join situacao_documento sd on ( sd.cod_situacao = s.situ' +
        'acao)'
      ' where s.cod_saida='#39'00000007'#39)
    UpdateObject = updQrySaidas
    Left = 296
    Top = 568
    object qry_saidasCOD_SAIDA: TIBStringField
      FieldName = 'COD_SAIDA'
      Origin = 'SAIDAS.COD_SAIDA'
      Required = True
      Size = 8
    end
    object qry_saidasCOD_FORNECEDOR: TIBStringField
      FieldName = 'COD_FORNECEDOR'
      Origin = 'SAIDAS.COD_FORNECEDOR'
      Size = 4
    end
    object qry_saidasCOD_USUARIO: TIBStringField
      FieldName = 'COD_USUARIO'
      Origin = 'SAIDAS.COD_USUARIO'
      Required = True
      Size = 3
    end
    object qry_saidasQTDE_ITENS: TSmallintField
      FieldName = 'QTDE_ITENS'
      Origin = 'SAIDAS.QTDE_ITENS'
      Required = True
    end
    object qry_saidasDATA: TDateField
      FieldName = 'DATA'
      Origin = 'SAIDAS.DATA'
    end
    object qry_saidasHORA: TTimeField
      FieldName = 'HORA'
      Origin = 'SAIDAS.HORA'
    end
    object qry_saidasNOME_USUARIO_SAIDA: TIBStringField
      FieldName = 'NOME_USUARIO_SAIDA'
      Origin = 'SAIDAS.NOME_USUARIO_SAIDA'
      Size = 15
    end
    object qry_saidasCNPJ: TIBStringField
      FieldName = 'CNPJ'
      Origin = 'SAIDAS.CNPJ'
      Required = True
      Size = 14
    end
    object qry_saidasIE: TIBStringField
      FieldName = 'IE'
      Origin = 'SAIDAS.IE'
      Size = 14
    end
    object qry_saidasUF: TIBStringField
      FieldName = 'UF'
      Origin = 'SAIDAS.UF'
      Size = 2
    end
    object qry_saidasDATA_EMISSAO: TDateField
      FieldName = 'DATA_EMISSAO'
      Origin = 'SAIDAS.DATA_EMISSAO'
    end
    object qry_saidasDATA_SAIDA: TDateField
      FieldName = 'DATA_SAIDA'
      Origin = 'SAIDAS.DATA_SAIDA'
    end
    object qry_saidasNUMERO_NOTA: TIBStringField
      FieldName = 'NUMERO_NOTA'
      Origin = 'SAIDAS.NUMERO_NOTA'
      Size = 15
    end
    object qry_saidasSERIE_NOTA: TIBStringField
      FieldName = 'SERIE_NOTA'
      Origin = 'SAIDAS.SERIE_NOTA'
      Size = 3
    end
    object qry_saidasMODELO_NOTA: TIBStringField
      FieldName = 'MODELO_NOTA'
      Origin = 'SAIDAS.MODELO_NOTA'
      Size = 2
    end
    object qry_saidasCFOP_NOTA: TIBStringField
      FieldName = 'CFOP_NOTA'
      Origin = 'SAIDAS.CFOP_NOTA'
      Size = 4
    end
    object qry_saidasBASE_ICMS: TIBBCDField
      FieldName = 'BASE_ICMS'
      Origin = 'SAIDAS.BASE_ICMS'
      currency = True
      Precision = 18
      Size = 2
    end
    object qry_saidasVALOR_ICMS: TIBBCDField
      FieldName = 'VALOR_ICMS'
      Origin = 'SAIDAS.VALOR_ICMS'
      currency = True
      Precision = 18
      Size = 2
    end
    object qry_saidasBASE_ICMS_SUBST: TIBBCDField
      FieldName = 'BASE_ICMS_SUBST'
      Origin = 'SAIDAS.BASE_ICMS_SUBST'
      currency = True
      Precision = 18
      Size = 2
    end
    object qry_saidasVALOR_ICMS_SUBST: TIBBCDField
      FieldName = 'VALOR_ICMS_SUBST'
      Origin = 'SAIDAS.VALOR_ICMS_SUBST'
      currency = True
      Precision = 18
      Size = 2
    end
    object qry_saidasVALOR_PRODUTOS: TIBBCDField
      FieldName = 'VALOR_PRODUTOS'
      Origin = 'SAIDAS.VALOR_PRODUTOS'
      currency = True
      Precision = 18
      Size = 2
    end
    object qry_saidasFRETE: TIBBCDField
      FieldName = 'FRETE'
      Origin = 'SAIDAS.FRETE'
      currency = True
      Precision = 18
      Size = 2
    end
    object qry_saidasSEGURO: TIBBCDField
      FieldName = 'SEGURO'
      Origin = 'SAIDAS.SEGURO'
      currency = True
      Precision = 18
      Size = 2
    end
    object qry_saidasDESCONTO: TIBBCDField
      FieldName = 'DESCONTO'
      Origin = 'SAIDAS.DESCONTO'
      currency = True
      Precision = 18
      Size = 2
    end
    object qry_saidasOUTRAS_DESPESAS: TIBBCDField
      FieldName = 'OUTRAS_DESPESAS'
      Origin = 'SAIDAS.OUTRAS_DESPESAS'
      currency = True
      Precision = 18
      Size = 2
    end
    object qry_saidasVALOR_IPI: TIBBCDField
      FieldName = 'VALOR_IPI'
      Origin = 'SAIDAS.VALOR_IPI'
      currency = True
      Precision = 18
      Size = 2
    end
    object qry_saidasTOTAL_NOTA: TIBBCDField
      FieldName = 'TOTAL_NOTA'
      Origin = 'SAIDAS.TOTAL_NOTA'
      currency = True
      Precision = 18
      Size = 2
    end
    object qry_saidasXRAZAOSOCIAL: TIBStringField
      FieldName = 'XRAZAOSOCIAL'
      Origin = 'FORNECEDOR.RAZAO_SOCIAL'
      Size = 40
    end
    object qry_saidasXCNPJ: TIBStringField
      FieldName = 'XCNPJ'
      Origin = 'FORNECEDOR.CGC_CPF'
      Size = 14
    end
    object qry_saidasXINSCRICAOESTADUAL: TIBStringField
      FieldName = 'XINSCRICAOESTADUAL'
      Origin = 'FORNECEDOR.INSCRICAO_ESTADUAL'
    end
    object qry_saidasXNOMECIDADE: TIBStringField
      FieldName = 'XNOMECIDADE'
      Origin = 'CIDADE.NOME'
      Size = 50
    end
    object qry_saidasXUF: TIBStringField
      FieldName = 'XUF'
      Origin = 'ESTADO.SIGLA'
      FixedChar = True
      Size = 2
    end
    object qry_saidasXMODELONOTA: TIBStringField
      FieldName = 'XMODELONOTA'
      Origin = 'MODELOS_NF.DESCRICAO'
      Size = 50
    end
    object qry_saidasXCFOPDESCRICAO: TIBStringField
      FieldName = 'XCFOPDESCRICAO'
      Origin = 'CFOP.DESCRICAO'
      Size = 50
    end
    object qry_saidasNUMERO_CUPOM_FISCAL: TIBStringField
      FieldName = 'NUMERO_CUPOM_FISCAL'
      Origin = 'SAIDAS.NUMERO_CUPOM_FISCAL'
      Size = 6
    end
    object qry_saidasNUMERO_ECF: TIBStringField
      FieldName = 'NUMERO_ECF'
      Origin = 'SAIDAS.NUMERO_ECF'
      Size = 3
    end
    object qry_saidasCHAVE_NFE: TIBStringField
      FieldName = 'CHAVE_NFE'
      Origin = 'SAIDAS.CHAVE_NFE'
      Size = 50
    end
    object qry_saidasSITUACAO: TIBStringField
      FieldName = 'SITUACAO'
      Origin = 'SAIDAS.SITUACAO'
      Required = True
      Size = 2
    end
    object qry_saidasXDESCSITUACAONOTA: TIBStringField
      FieldName = 'XDESCSITUACAONOTA'
      Origin = 'SITUACAO_DOCUMENTO.DESCRICAO'
      Size = 50
    end
    object qry_saidasTIPO_SAIDA: TSmallintField
      FieldName = 'TIPO_SAIDA'
      Origin = 'SAIDAS.TIPO_SAIDA'
      Required = True
    end
  end
  object updQrySaidas: TIBUpdateSQL
    RefreshSQL.Strings = (
      'Select *'
      'from saidas '
      'where'
      '  COD_SAIDA = :COD_SAIDA')
    ModifySQL.Strings = (
      'update saidas'
      'set'
      '  COD_SAIDA = :COD_SAIDA,'
      '  COD_FORNECEDOR = :COD_FORNECEDOR,'
      '  COD_USUARIO = :COD_USUARIO,'
      '  QTDE_ITENS = :QTDE_ITENS,'
      '  DATA = :DATA,'
      '  HORA = :HORA,'
      '  NOME_USUARIO_SAIDA = :NOME_USUARIO_SAIDA,'
      '  CNPJ = :CNPJ,'
      '  IE = :IE,'
      '  UF = :UF,'
      '  DATA_EMISSAO = :DATA_EMISSAO,'
      '  DATA_SAIDA = :DATA_SAIDA,'
      '  NUMERO_NOTA = :NUMERO_NOTA,'
      '  SERIE_NOTA = :SERIE_NOTA,'
      '  MODELO_NOTA = :MODELO_NOTA,'
      '  CFOP_NOTA = :CFOP_NOTA,'
      '  BASE_ICMS = :BASE_ICMS,'
      '  VALOR_ICMS = :VALOR_ICMS,'
      '  BASE_ICMS_SUBST = :BASE_ICMS_SUBST,'
      '  VALOR_ICMS_SUBST = :VALOR_ICMS_SUBST,'
      '  VALOR_PRODUTOS = :VALOR_PRODUTOS,'
      '  FRETE = :FRETE,'
      '  SEGURO = :SEGURO,'
      '  DESCONTO = :DESCONTO,'
      '  OUTRAS_DESPESAS = :OUTRAS_DESPESAS,'
      '  VALOR_IPI = :VALOR_IPI,'
      '  TOTAL_NOTA = :TOTAL_NOTA,'
      '  NUMERO_CUPOM_FISCAL = :NUMERO_CUPOM_FISCAL,'
      '  NUMERO_ECF = :NUMERO_ECF,'
      '  CHAVE_NFE = :CHAVE_NFE,'
      '  SITUACAO = :SITUACAO,'
      '  TIPO_SAIDA = :TIPO_SAIDA'
      'where'
      '  COD_SAIDA = :OLD_COD_SAIDA')
    InsertSQL.Strings = (
      'insert into saidas'
      
        '  (COD_SAIDA, COD_FORNECEDOR, COD_USUARIO, QTDE_ITENS, DATA, HOR' +
        'A, NOME_USUARIO_SAIDA, '
      
        '   CNPJ, IE, UF, DATA_EMISSAO, DATA_SAIDA, NUMERO_NOTA, SERIE_NO' +
        'TA, MODELO_NOTA, '
      
        '   CFOP_NOTA, BASE_ICMS, VALOR_ICMS, BASE_ICMS_SUBST, VALOR_ICMS' +
        '_SUBST, '
      
        '   VALOR_PRODUTOS, FRETE, SEGURO, DESCONTO, OUTRAS_DESPESAS, VAL' +
        'OR_IPI, '
      
        '   TOTAL_NOTA, NUMERO_CUPOM_FISCAL, NUMERO_ECF, CHAVE_NFE, SITUA' +
        'CAO, TIPO_SAIDA)'
      'values'
      
        '  (:COD_SAIDA, :COD_FORNECEDOR, :COD_USUARIO, :QTDE_ITENS, :DATA' +
        ', :HORA, '
      
        '   :NOME_USUARIO_SAIDA, :CNPJ, :IE, :UF, :DATA_EMISSAO, :DATA_SA' +
        'IDA, :NUMERO_NOTA, '
      
        '   :SERIE_NOTA, :MODELO_NOTA, :CFOP_NOTA, :BASE_ICMS, :VALOR_ICM' +
        'S, :BASE_ICMS_SUBST, '
      
        '   :VALOR_ICMS_SUBST, :VALOR_PRODUTOS, :FRETE, :SEGURO, :DESCONT' +
        'O, :OUTRAS_DESPESAS, '
      
        '   :VALOR_IPI, :TOTAL_NOTA, :NUMERO_CUPOM_FISCAL, :NUMERO_ECF, :' +
        'CHAVE_NFE, '
      '   :SITUACAO, :TIPO_SAIDA)')
    DeleteSQL.Strings = (
      'delete from saidas'
      'where'
      '  COD_SAIDA = :OLD_COD_SAIDA')
    Left = 328
    Top = 568
  end
  object ds_qry_saidas: TDataSource
    DataSet = qry_saidas
    Left = 265
    Top = 568
  end
  object qryCsContasApagar: TIBQuery
    Database = dbrestaurante
    Transaction = transacao
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      ''
      
        'select rc.*,en.data_emissao,lr.data_rd,lr.data_documento, lr.obs' +
        'ervacoes, f.nome_fantasia, pc.* from r_contas_a_pagar rc'
      
        '   inner join fornecedor f on (f.cod_fornecedor = rc.cod_fornece' +
        'dor) '
      
        '   inner join v_plano_contas_financeiro pc on (pc.cod_conta = rc' +
        '.cod_conta) '
      
        '   left join entradas en on (en.cod_entrada = rc.codigo_entrada)' +
        ' '
      '   left join lancamentos_rd lr on (lr.cod_ct_pagar = rc.codigo)'
      ''
      ' where rc.status <> -2'
      ' and rc.data_vencimento between '#39'01.11.2016'#39
      ' and '#39'30.11.2016'#39
      'order by rc.status,rc.data_vencimento')
    Left = 688
    Top = 112
  end
  object dsQryContasApagar: TDataSource
    DataSet = qryCsContasApagar
    Left = 776
    Top = 112
  end
  object dsItensFatura: TDataSource
    DataSet = qryItensConsultaFatura
    Left = 504
    Top = 288
  end
  object qryItensConsultaFatura: TIBQuery
    Database = dbrestaurante
    Transaction = transacao
    BufferChunks = 1000
    CachedUpdates = False
    DataSource = dsQryConsultaFaturas
    ParamCheck = True
    SQL.Strings = (
      ''
      ' select * from v_movimento_venda where cod_venda=:CodigoVenda')
    Left = 448
    Top = 296
    ParamData = <
      item
        DataType = ftWideString
        Name = 'CODIGOVENDA'
        ParamType = ptUnknown
        Size = 18
      end>
    object qryItensConsultaFaturaCOD_EMPRESA: TIBStringField
      FieldName = 'COD_EMPRESA'
      Origin = '"V_MOVIMENTO_VENDA"."COD_EMPRESA"'
      Size = 4
    end
    object qryItensConsultaFaturaCOD_VENDA: TIBStringField
      FieldName = 'COD_VENDA'
      Origin = '"V_MOVIMENTO_VENDA"."COD_VENDA"'
      Size = 8
    end
    object qryItensConsultaFaturaCOD_PRODUTO: TIBStringField
      FieldName = 'COD_PRODUTO'
      Origin = '"V_MOVIMENTO_VENDA"."COD_PRODUTO"'
      Size = 5
    end
    object qryItensConsultaFaturaDESCRICAO: TIBStringField
      FieldName = 'DESCRICAO'
      Origin = '"V_MOVIMENTO_VENDA"."DESCRICAO"'
      Size = 40
    end
    object qryItensConsultaFaturaPARAMETRO_CONTAGEM: TIBBCDField
      FieldName = 'PARAMETRO_CONTAGEM'
      Origin = '"V_MOVIMENTO_VENDA"."PARAMETRO_CONTAGEM"'
      Precision = 18
      Size = 2
    end
    object qryItensConsultaFaturaCOD_GRUPO: TIBStringField
      FieldName = 'COD_GRUPO'
      Origin = '"V_MOVIMENTO_VENDA"."COD_GRUPO"'
      Size = 6
    end
    object qryItensConsultaFaturaCOD_ALIQUOTA: TIBStringField
      FieldName = 'COD_ALIQUOTA'
      Origin = '"V_MOVIMENTO_VENDA"."COD_ALIQUOTA"'
      Size = 3
    end
    object qryItensConsultaFaturaQUANTIDADE_REAL: TFMTBCDField
      FieldName = 'QUANTIDADE_REAL'
      Origin = '"V_MOVIMENTO_VENDA"."QUANTIDADE_REAL"'
      Precision = 18
      Size = 5
    end
    object qryItensConsultaFaturaQUANTIDADE_CONTAGEM: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'QUANTIDADE_CONTAGEM'
      Origin = '"V_MOVIMENTO_VENDA"."QUANTIDADE_CONTAGEM"'
      ProviderFlags = []
      ReadOnly = True
    end
    object qryItensConsultaFaturaVALOR_UNITARIO: TIBBCDField
      FieldName = 'VALOR_UNITARIO'
      Origin = '"V_MOVIMENTO_VENDA"."VALOR_UNITARIO"'
      Precision = 18
      Size = 2
    end
    object qryItensConsultaFaturaTOTAL: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'TOTAL'
      Origin = '"V_MOVIMENTO_VENDA"."TOTAL"'
      ProviderFlags = []
      ReadOnly = True
    end
    object qryItensConsultaFaturaDATA: TDateField
      FieldName = 'DATA'
      Origin = '"V_MOVIMENTO_VENDA"."DATA"'
    end
    object qryItensConsultaFaturaHORA: TDateTimeField
      FieldName = 'HORA'
      Origin = '"V_MOVIMENTO_VENDA"."HORA"'
    end
    object qryItensConsultaFaturaMESA: TIBStringField
      FieldName = 'MESA'
      Origin = '"V_MOVIMENTO_VENDA"."MESA"'
      Size = 4
    end
    object qryItensConsultaFaturaCOD_GARCON: TIBStringField
      FieldName = 'COD_GARCON'
      Origin = '"V_MOVIMENTO_VENDA"."COD_GARCON"'
      Size = 3
    end
    object qryItensConsultaFaturaCOD_USUARIO: TIBStringField
      FieldName = 'COD_USUARIO'
      Origin = '"V_MOVIMENTO_VENDA"."COD_USUARIO"'
      Size = 3
    end
    object qryItensConsultaFaturaDESCRICAO_GRUPO: TIBStringField
      FieldName = 'DESCRICAO_GRUPO'
      Origin = '"V_MOVIMENTO_VENDA"."DESCRICAO_GRUPO"'
      Size = 30
    end
    object qryItensConsultaFaturaNOME_USUARIO: TIBStringField
      FieldName = 'NOME_USUARIO'
      Origin = '"V_MOVIMENTO_VENDA"."NOME_USUARIO"'
      Size = 40
    end
    object qryItensConsultaFaturaCOD_CAIXA: TIBStringField
      FieldName = 'COD_CAIXA'
      Origin = '"V_MOVIMENTO_VENDA"."COD_CAIXA"'
      Size = 5
    end
  end
  object tb_parametros: TIBTable
    Database = dbrestaurante
    Transaction = transacao
    BufferChunks = 1000
    CachedUpdates = False
    FieldDefs = <
      item
        Name = 'DATA_SISTEMA'
        DataType = ftDate
      end
      item
        Name = 'RAZAO_SOCIAL'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'NOME_FANTASIA'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'CNPJ'
        DataType = ftString
        Size = 14
      end
      item
        Name = 'IE'
        DataType = ftString
        Size = 14
      end
      item
        Name = 'IM'
        DataType = ftString
        Size = 14
      end
      item
        Name = 'COD_CIDADE'
        DataType = ftString
        Size = 5
      end
      item
        Name = 'COD_MUNICIPIO_IBGE'
        DataType = ftString
        Size = 7
      end
      item
        Name = 'LOGRADOURO'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'COMPLEMENTO'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'NUMERO'
        DataType = ftString
        Size = 5
      end
      item
        Name = 'BAIRRO'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'UF'
        DataType = ftString
        Size = 2
      end
      item
        Name = 'CEP'
        DataType = ftString
        Size = 8
      end
      item
        Name = 'TELEFONE_EMPRESA'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'FAX_EMPRESA'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'CONTATO'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'PERFIL_SPED'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'IND_ATIVIDADE'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'COD_SUFRAMA'
        DataType = ftString
        Size = 9
      end
      item
        Name = 'NOME_CONTABILISTA'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'CPF_CONTABILISTA'
        DataType = ftString
        Size = 11
      end
      item
        Name = 'CRC_CONTABILISTA'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'CNPJ_CONTABILISTA'
        DataType = ftString
        Size = 14
      end
      item
        Name = 'CEP_CONTABILISTA'
        DataType = ftString
        Size = 8
      end
      item
        Name = 'ENDERECO_CONTABILISTA'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'COMPLEMENTO_END_CONTABILISTA'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'NUMERO_END_CONTABILISTA'
        DataType = ftString
        Size = 5
      end
      item
        Name = 'BAIRRO_CONTABILISTA'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'TELEFONE_CONTABILISTA'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'FAX_CONTABILISTA'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'ULTIMAHORA'
        DataType = ftDateTime
      end
      item
        Name = 'SENHA_PADRAO'
        DataType = ftString
        Size = 6
      end
      item
        Name = 'PERCENTUAL_SERVICO_GARCOM'
        DataType = ftBCD
        Precision = 18
        Size = 2
      end
      item
        Name = 'PERCENTUAL_SERVICO_CASA'
        DataType = ftBCD
        Precision = 18
        Size = 2
      end
      item
        Name = 'PERCENTUAL_SERVICO_FUNCIONARIOS'
        DataType = ftBCD
        Precision = 18
        Size = 2
      end
      item
        Name = 'ZERAR_ICMS_ENTRADAS'
        DataType = ftSmallint
      end
      item
        Name = 'ALTERAR_UN_NAS_ENTRADAS'
        DataType = ftSmallint
      end
      item
        Name = 'COUVERT_MASC_PAGANTE'
        DataType = ftString
        Size = 5
      end
      item
        Name = 'COUVERT_MASC_LISTA'
        DataType = ftString
        Size = 5
      end
      item
        Name = 'COUVERT_FEM_PAGANTE'
        DataType = ftString
        Size = 5
      end
      item
        Name = 'COUVERT_FEM_LISTA'
        DataType = ftString
        Size = 5
      end
      item
        Name = 'COUVERT_VIP'
        DataType = ftString
        Size = 5
      end
      item
        Name = 'INI_FAIXA_MASC'
        DataType = ftInteger
      end
      item
        Name = 'FIM_FAIXA_MASC'
        DataType = ftSmallint
      end
      item
        Name = 'INI_FAIXA_FEM'
        DataType = ftInteger
      end
      item
        Name = 'FIM_FAIXA_FEM'
        DataType = ftInteger
      end
      item
        Name = 'INI_FAIXA_VIP'
        DataType = ftInteger
      end
      item
        Name = 'FIM_FAIXA_VIP'
        DataType = ftInteger
      end
      item
        Name = 'BOATE'
        DataType = ftSmallint
      end
      item
        Name = 'RECEBE_COUVERT_ENTRADA'
        DataType = ftSmallint
      end
      item
        Name = 'COUVERT_MASC_PRECONVITE'
        DataType = ftString
        Size = 5
      end
      item
        Name = 'COUVERT_FEM_PRECONVITE'
        DataType = ftString
        Size = 5
      end
      item
        Name = 'ALIQUOTA_ICMS'
        DataType = ftBCD
        Precision = 18
        Size = 2
      end
      item
        Name = 'RED_BASE_ICMS'
        DataType = ftFloat
      end
      item
        Name = 'PERCENTUAL_COM_EXT_GARCOM'
        DataType = ftBCD
        Precision = 18
        Size = 2
      end
      item
        Name = 'EMAIL_CONTABILISTA'
        DataType = ftString
        Size = 70
      end
      item
        Name = 'NUM_SERIE_CERTIFICADO'
        DataType = ftString
        Size = 40
      end
      item
        Name = 'SENHA_CERTIFICADO'
        DataType = ftString
        Size = 40
      end
      item
        Name = 'ULT_NSU_NFE_DEST'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'USA_COD_GARCON'
        DataType = ftSmallint
      end
      item
        Name = 'COBRA_SERVICO'
        DataType = ftSmallint
      end
      item
        Name = 'CSC_NFCE'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'ID_CSC_NFCE'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'NOME_CIDADE_CONTRIBUINTE'
        DataType = ftString
        Size = 40
      end
      item
        Name = 'COD_EMPRESA'
        DataType = ftString
        Size = 4
      end
      item
        Name = 'ULTIMA_VENDA_EXP'
        DataType = ftString
        Size = 8
      end
      item
        Name = 'REGIME_TRIBUTACAO'
        DataType = ftSmallint
      end
      item
        Name = 'CREDITO_ENTRADAS'
        DataType = ftSmallint
      end
      item
        Name = 'IMPOSTO_SIMP_NAC_NFCE'
        DataType = ftSmallint
      end
      item
        Name = 'ALIQ_IBPT'
        DataType = ftBCD
        Precision = 18
        Size = 2
      end
      item
        Name = 'CHAVE_AUTENTICACAO_TEF'
        DataType = ftString
        Size = 80
      end
      item
        Name = 'NUMERO_NFE'
        DataType = ftInteger
      end
      item
        Name = 'SERIE_NFE'
        DataType = ftInteger
      end
      item
        Name = 'QTD_VIAS_SANGRIA'
        DataType = ftSmallint
      end
      item
        Name = 'CSC_NFCE_HOMOLOGACAO'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'ID_CSC_NFCE_HOMOLOGACAO'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'PIZZA_MAIS_CARA'
        DataType = ftSmallint
      end
      item
        Name = 'ASSINATURA_SAT'
        DataType = ftString
        Size = 350
      end
      item
        Name = 'COD_ATIVACAO_SAT'
        DataType = ftString
        Size = 8
      end
      item
        Name = 'CNPJ_SWHOUSE'
        DataType = ftString
        Size = 14
      end
      item
        Name = 'TIPO_ENVIO_NFCE'
        DataType = ftSmallint
      end
      item
        Name = 'TIPO_ENVIO_NFE'
        DataType = ftSmallint
      end
      item
        Name = 'AGUARDA_CONSULTA_RET_NFCE'
        DataType = ftBCD
        Precision = 18
        Size = 2
      end
      item
        Name = 'TENTATIVAS_CONSULTA_RET_NFCE'
        DataType = ftSmallint
      end
      item
        Name = 'TIMEOUT_RET_NFCE'
        DataType = ftBCD
        Precision = 18
        Size = 2
      end
      item
        Name = 'INTERVALO_TENTATIVAS_NFCE'
        DataType = ftBCD
        Precision = 18
        Size = 2
      end
      item
        Name = 'MAX_NFCE_SEM_CPF'
        DataType = ftBCD
        Precision = 18
        Size = 2
      end
      item
        Name = 'MSG_PROMO_DELIVERY'
        DataType = ftString
        Size = 144
      end
      item
        Name = 'MSG_PROMO_CONTA'
        DataType = ftString
        Size = 144
      end>
    StoreDefs = True
    TableName = 'PARAMETROS'
    UniDirectional = False
    Left = 152
    Top = 17
    object tb_parametrosDATA_SISTEMA: TDateField
      FieldName = 'DATA_SISTEMA'
    end
    object tb_parametrosRAZAO_SOCIAL: TIBStringField
      FieldName = 'RAZAO_SOCIAL'
      Size = 60
    end
    object tb_parametrosNOME_FANTASIA: TIBStringField
      FieldName = 'NOME_FANTASIA'
      Size = 60
    end
    object tb_parametrosCNPJ: TIBStringField
      FieldName = 'CNPJ'
      Size = 14
    end
    object tb_parametrosIE: TIBStringField
      FieldName = 'IE'
      Size = 14
    end
    object tb_parametrosIM: TIBStringField
      FieldName = 'IM'
      Size = 14
    end
    object tb_parametrosCOD_CIDADE: TIBStringField
      FieldName = 'COD_CIDADE'
      Size = 5
    end
    object tb_parametrosCOD_MUNICIPIO_IBGE: TIBStringField
      FieldName = 'COD_MUNICIPIO_IBGE'
      Size = 7
    end
    object tb_parametrosLOGRADOURO: TIBStringField
      FieldName = 'LOGRADOURO'
      Size = 60
    end
    object tb_parametrosCOMPLEMENTO: TIBStringField
      FieldName = 'COMPLEMENTO'
      Size = 60
    end
    object tb_parametrosNUMERO: TIBStringField
      FieldName = 'NUMERO'
      Size = 5
    end
    object tb_parametrosBAIRRO: TIBStringField
      FieldName = 'BAIRRO'
      Size = 60
    end
    object tb_parametrosUF: TIBStringField
      FieldName = 'UF'
      Size = 2
    end
    object tb_parametrosCEP: TIBStringField
      FieldName = 'CEP'
      Size = 8
    end
    object tb_parametrosTELEFONE_EMPRESA: TIBStringField
      FieldName = 'TELEFONE_EMPRESA'
      Size = 10
    end
    object tb_parametrosFAX_EMPRESA: TIBStringField
      FieldName = 'FAX_EMPRESA'
      Size = 10
    end
    object tb_parametrosCONTATO: TIBStringField
      FieldName = 'CONTATO'
      Size = 60
    end
    object tb_parametrosPERFIL_SPED: TIBStringField
      FieldName = 'PERFIL_SPED'
      Size = 1
    end
    object tb_parametrosIND_ATIVIDADE: TIBStringField
      FieldName = 'IND_ATIVIDADE'
      Size = 1
    end
    object tb_parametrosCOD_SUFRAMA: TIBStringField
      FieldName = 'COD_SUFRAMA'
      Size = 9
    end
    object tb_parametrosNOME_CONTABILISTA: TIBStringField
      FieldName = 'NOME_CONTABILISTA'
      Size = 60
    end
    object tb_parametrosCPF_CONTABILISTA: TIBStringField
      FieldName = 'CPF_CONTABILISTA'
      Size = 11
    end
    object tb_parametrosCRC_CONTABILISTA: TIBStringField
      FieldName = 'CRC_CONTABILISTA'
      Size = 15
    end
    object tb_parametrosCNPJ_CONTABILISTA: TIBStringField
      FieldName = 'CNPJ_CONTABILISTA'
      Size = 14
    end
    object tb_parametrosCEP_CONTABILISTA: TIBStringField
      FieldName = 'CEP_CONTABILISTA'
      Size = 8
    end
    object tb_parametrosENDERECO_CONTABILISTA: TIBStringField
      FieldName = 'ENDERECO_CONTABILISTA'
      Size = 60
    end
    object tb_parametrosCOMPLEMENTO_END_CONTABILISTA: TIBStringField
      FieldName = 'COMPLEMENTO_END_CONTABILISTA'
      Size = 60
    end
    object tb_parametrosNUMERO_END_CONTABILISTA: TIBStringField
      FieldName = 'NUMERO_END_CONTABILISTA'
      Size = 5
    end
    object tb_parametrosBAIRRO_CONTABILISTA: TIBStringField
      FieldName = 'BAIRRO_CONTABILISTA'
      Size = 60
    end
    object tb_parametrosTELEFONE_CONTABILISTA: TIBStringField
      FieldName = 'TELEFONE_CONTABILISTA'
      Size = 10
    end
    object tb_parametrosFAX_CONTABILISTA: TIBStringField
      FieldName = 'FAX_CONTABILISTA'
      Size = 10
    end
    object tb_parametrosULTIMAHORA: TDateTimeField
      FieldName = 'ULTIMAHORA'
    end
    object tb_parametrosSENHA_PADRAO: TIBStringField
      FieldName = 'SENHA_PADRAO'
      Size = 6
    end
    object tb_parametrosPERCENTUAL_SERVICO_GARCOM: TIBBCDField
      FieldName = 'PERCENTUAL_SERVICO_GARCOM'
      Required = True
      Precision = 18
      Size = 2
    end
    object tb_parametrosPERCENTUAL_SERVICO_CASA: TIBBCDField
      FieldName = 'PERCENTUAL_SERVICO_CASA'
      Required = True
      Precision = 18
      Size = 2
    end
    object tb_parametrosPERCENTUAL_SERVICO_FUNCIONARIOS: TIBBCDField
      FieldName = 'PERCENTUAL_SERVICO_FUNCIONARIOS'
      Required = True
      Precision = 18
      Size = 2
    end
    object tb_parametrosZERAR_ICMS_ENTRADAS: TSmallintField
      FieldName = 'ZERAR_ICMS_ENTRADAS'
      Required = True
    end
    object tb_parametrosALTERAR_UN_NAS_ENTRADAS: TSmallintField
      FieldName = 'ALTERAR_UN_NAS_ENTRADAS'
      Required = True
    end
    object tb_parametrosCOUVERT_MASC_PAGANTE: TIBStringField
      FieldName = 'COUVERT_MASC_PAGANTE'
      Required = True
      Size = 5
    end
    object tb_parametrosCOUVERT_MASC_LISTA: TIBStringField
      FieldName = 'COUVERT_MASC_LISTA'
      Required = True
      Size = 5
    end
    object tb_parametrosCOUVERT_FEM_PAGANTE: TIBStringField
      FieldName = 'COUVERT_FEM_PAGANTE'
      Required = True
      Size = 5
    end
    object tb_parametrosCOUVERT_FEM_LISTA: TIBStringField
      FieldName = 'COUVERT_FEM_LISTA'
      Required = True
      Size = 5
    end
    object tb_parametrosCOUVERT_VIP: TIBStringField
      FieldName = 'COUVERT_VIP'
      Required = True
      Size = 5
    end
    object tb_parametrosINI_FAIXA_MASC: TIntegerField
      FieldName = 'INI_FAIXA_MASC'
      Required = True
    end
    object tb_parametrosFIM_FAIXA_MASC: TSmallintField
      FieldName = 'FIM_FAIXA_MASC'
      Required = True
    end
    object tb_parametrosINI_FAIXA_FEM: TIntegerField
      FieldName = 'INI_FAIXA_FEM'
      Required = True
    end
    object tb_parametrosFIM_FAIXA_FEM: TIntegerField
      FieldName = 'FIM_FAIXA_FEM'
      Required = True
    end
    object tb_parametrosINI_FAIXA_VIP: TIntegerField
      FieldName = 'INI_FAIXA_VIP'
      Required = True
    end
    object tb_parametrosFIM_FAIXA_VIP: TIntegerField
      FieldName = 'FIM_FAIXA_VIP'
      Required = True
    end
    object tb_parametrosBOATE: TSmallintField
      FieldName = 'BOATE'
      Required = True
    end
    object tb_parametrosRECEBE_COUVERT_ENTRADA: TSmallintField
      FieldName = 'RECEBE_COUVERT_ENTRADA'
      Required = True
    end
    object tb_parametrosCOUVERT_MASC_PRECONVITE: TIBStringField
      FieldName = 'COUVERT_MASC_PRECONVITE'
      Size = 5
    end
    object tb_parametrosCOUVERT_FEM_PRECONVITE: TIBStringField
      FieldName = 'COUVERT_FEM_PRECONVITE'
      Size = 5
    end
    object tb_parametrosALIQUOTA_ICMS: TIBBCDField
      FieldName = 'ALIQUOTA_ICMS'
      Precision = 18
      Size = 2
    end
    object tb_parametrosRED_BASE_ICMS: TFloatField
      FieldName = 'RED_BASE_ICMS'
    end
    object tb_parametrosPERCENTUAL_COM_EXT_GARCOM: TIBBCDField
      FieldName = 'PERCENTUAL_COM_EXT_GARCOM'
      Precision = 18
      Size = 2
    end
    object tb_parametrosEMAIL_CONTABILISTA: TIBStringField
      FieldName = 'EMAIL_CONTABILISTA'
      Size = 70
    end
    object tb_parametrosNUM_SERIE_CERTIFICADO: TIBStringField
      FieldName = 'NUM_SERIE_CERTIFICADO'
      Size = 40
    end
    object tb_parametrosSENHA_CERTIFICADO: TIBStringField
      FieldName = 'SENHA_CERTIFICADO'
      Size = 40
    end
    object tb_parametrosULT_NSU_NFE_DEST: TIBStringField
      FieldName = 'ULT_NSU_NFE_DEST'
      Size = 15
    end
    object tb_parametrosUSA_COD_GARCON: TSmallintField
      FieldName = 'USA_COD_GARCON'
      Required = True
    end
    object tb_parametrosCOBRA_SERVICO: TSmallintField
      FieldName = 'COBRA_SERVICO'
      Required = True
    end
    object tb_parametrosCSC_NFCE: TIBStringField
      FieldName = 'CSC_NFCE'
      Size = 50
    end
    object tb_parametrosID_CSC_NFCE: TIBStringField
      FieldName = 'ID_CSC_NFCE'
      Size = 10
    end
    object tb_parametrosNOME_CIDADE_CONTRIBUINTE: TIBStringField
      FieldName = 'NOME_CIDADE_CONTRIBUINTE'
      Required = True
      Size = 40
    end
    object tb_parametrosCOD_EMPRESA: TIBStringField
      FieldName = 'COD_EMPRESA'
      Size = 4
    end
    object tb_parametrosULTIMA_VENDA_EXP: TIBStringField
      FieldName = 'ULTIMA_VENDA_EXP'
      Size = 8
    end
    object tb_parametrosREGIME_TRIBUTACAO: TSmallintField
      FieldName = 'REGIME_TRIBUTACAO'
    end
    object tb_parametrosCREDITO_ENTRADAS: TSmallintField
      FieldName = 'CREDITO_ENTRADAS'
    end
    object tb_parametrosIMPOSTO_SIMP_NAC_NFCE: TSmallintField
      FieldName = 'IMPOSTO_SIMP_NAC_NFCE'
    end
    object tb_parametrosALIQ_IBPT: TIBBCDField
      FieldName = 'ALIQ_IBPT'
      Required = True
      Precision = 18
      Size = 2
    end
    object tb_parametrosCHAVE_AUTENTICACAO_TEF: TIBStringField
      FieldName = 'CHAVE_AUTENTICACAO_TEF'
      Size = 80
    end
    object tb_parametrosNUMERO_NFE: TIntegerField
      FieldName = 'NUMERO_NFE'
    end
    object tb_parametrosSERIE_NFE: TIntegerField
      FieldName = 'SERIE_NFE'
    end
    object tb_parametrosQTD_VIAS_SANGRIA: TSmallintField
      FieldName = 'QTD_VIAS_SANGRIA'
    end
    object tb_parametrosCSC_NFCE_HOMOLOGACAO: TIBStringField
      FieldName = 'CSC_NFCE_HOMOLOGACAO'
      Size = 50
    end
    object tb_parametrosID_CSC_NFCE_HOMOLOGACAO: TIBStringField
      FieldName = 'ID_CSC_NFCE_HOMOLOGACAO'
      Size = 10
    end
    object tb_parametrosPIZZA_MAIS_CARA: TSmallintField
      FieldName = 'PIZZA_MAIS_CARA'
    end
    object tb_parametrosASSINATURA_SAT: TIBStringField
      FieldName = 'ASSINATURA_SAT'
      Size = 350
    end
    object tb_parametrosCNPJ_SWHOUSE: TIBStringField
      FieldName = 'CNPJ_SWHOUSE'
      Size = 14
    end
    object tb_parametrosCOD_ATIVACAO_SAT: TIBStringField
      FieldName = 'COD_ATIVACAO_SAT'
      Size = 8
    end
    object tb_parametrosTIPO_ENVIO_NFCE: TSmallintField
      FieldName = 'TIPO_ENVIO_NFCE'
    end
    object tb_parametrosTIPO_ENVIO_NFE: TSmallintField
      FieldName = 'TIPO_ENVIO_NFE'
    end
    object tb_parametrosAGUARDA_CONSULTA_RET_NFCE: TIBBCDField
      FieldName = 'AGUARDA_CONSULTA_RET_NFCE'
      Precision = 18
      Size = 2
    end
    object tb_parametrosTENTATIVAS_CONSULTA_RET_NFCE: TSmallintField
      FieldName = 'TENTATIVAS_CONSULTA_RET_NFCE'
    end
    object tb_parametrosTIMEOUT_RET_NFCE: TIBBCDField
      FieldName = 'TIMEOUT_RET_NFCE'
      Precision = 18
      Size = 2
    end
    object tb_parametrosINTERVALO_TENTATIVAS_NFCE: TIBBCDField
      FieldName = 'INTERVALO_TENTATIVAS_NFCE'
      Precision = 18
      Size = 2
    end
    object tb_parametrosMAX_NFCE_SEM_CPF: TIBBCDField
      FieldName = 'MAX_NFCE_SEM_CPF'
      Precision = 18
      Size = 2
    end
    object tb_parametrosMSG_PROMO_DELIVERY: TIBStringField
      FieldName = 'MSG_PROMO_DELIVERY'
      Size = 144
    end
    object tb_parametrosMSG_PROMO_CONTA: TIBStringField
      FieldName = 'MSG_PROMO_CONTA'
      Size = 144
    end
  end
  object qryPromoters: TIBQuery
    Database = dbrestaurante
    Transaction = transacao
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      
        'select rd.data, udf_copy( upper(udf_dayname(rd.data)),0,3) as di' +
        'a ,rd.projecao, rd.reprojecao, rd.faturamento_real   from projec' +
        'oes_receitas_rd rd order by rd.data')
    UpdateObject = updQryPromoters
    Left = 688
    Top = 408
  end
  object dsQryPromoters: TDataSource
    DataSet = qryPromoters
    Left = 720
    Top = 408
  end
  object updQryPromoters: TIBUpdateSQL
    RefreshSQL.Strings = (
      'Select *'
      'from promoters '
      'where'
      '  COD_PROMOTER = :COD_PROMOTER')
    ModifySQL.Strings = (
      'update promoters'
      'set'
      '  COD_PROMOTER = :COD_PROMOTER,'
      '  NOME = :NOME'
      'where'
      '  COD_PROMOTER = :OLD_COD_PROMOTER')
    InsertSQL.Strings = (
      'insert into promoters'
      '  (COD_PROMOTER, NOME)'
      'values'
      '  (:COD_PROMOTER, :NOME)')
    DeleteSQL.Strings = (
      'delete from promoters'
      'where'
      '  COD_PROMOTER = :OLD_COD_PROMOTER')
    Left = 752
    Top = 408
  end
  object qryCsSaboresPizza: TIBQuery
    Database = dbrestaurante
    Transaction = transacao
    BufferChunks = 1000
    CachedUpdates = False
    DataSource = ds_acompanhamentos_temp
    ParamCheck = True
    SQL.Strings = (
      'select codigo,descricao from sabores_pizza order by descricao')
    Filtered = True
    Left = 928
    Top = 616
  end
  object dsQryCsSaboresPizza: TDataSource
    DataSet = qryCsSaboresPizza
    Left = 968
    Top = 616
  end
  object qryCsObservacoes: TIBQuery
    Database = dbrestaurante
    Transaction = transacao
    BufferChunks = 1000
    CachedUpdates = False
    DataSource = ds_acompanhamentos_temp
    ParamCheck = True
    SQL.Strings = (
      ''
      'select * from observacoes_padrao order by descricao')
    Filtered = True
    Left = 928
    Top = 664
  end
  object dsQryCsObservacoes: TDataSource
    DataSet = qryCsObservacoes
    Left = 968
    Top = 664
  end
  object tbObservacoesTemp: TRxMemoryData
    FieldDefs = <
      item
        Name = 'descricao'
        DataType = ftString
        Size = 25
      end>
    Left = 1008
    Top = 667
    object tbObservacoesTempdescricao: TStringField
      FieldName = 'descricao'
      Size = 25
    end
  end
  object dsObervacoesTemp: TDataSource
    DataSet = tbObservacoesTemp
    Left = 1046
    Top = 664
  end
  object tbGuarnicoesTemp: TRxMemoryData
    FieldDefs = <
      item
        Name = 'codigo'
        DataType = ftString
        Size = 2
      end
      item
        Name = 'descricao'
        DataType = ftString
        Size = 30
      end>
    Left = 904
    Top = 628
    object tbGuarnicoesTempcodigo: TStringField
      FieldName = 'codigo'
      Size = 2
    end
    object tbGuarnicoesTempdescricao: TStringField
      FieldName = 'descricao'
      Size = 30
    end
  end
  object dsGuarnicoesTemp: TDataSource
    DataSet = tbGuarnicoesTemp
    Left = 1054
    Top = 712
  end
  object qryGruposTouch: TIBQuery
    Database = dbrestaurante
    Transaction = transacao
    BufferChunks = 1000
    CachedUpdates = True
    ParamCheck = True
    SQL.Strings = (
      'select  * from grupos_touch')
    UpdateObject = updGruposTouch
    Left = 215
    Top = 624
    object qryGruposTouchCODIGO: TIBStringField
      FieldName = 'CODIGO'
      Origin = 'GRUPOS_TOUCH.CODIGO'
      Required = True
      Size = 2
    end
    object qryGruposTouchDESCRICAO: TIBStringField
      FieldName = 'DESCRICAO'
      Origin = 'GRUPOS_TOUCH.DESCRICAO'
      Size = 30
    end
  end
  object dsGruposTouch: TDataSource
    DataSet = qryGruposTouch
    Left = 255
    Top = 626
  end
  object updGruposTouch: TIBUpdateSQL
    RefreshSQL.Strings = (
      'Select *'
      'from grupos_touch '
      'where'
      '  CODIGO = :CODIGO')
    ModifySQL.Strings = (
      'update grupos_touch'
      'set'
      '  CODIGO = :CODIGO,'
      '  DESCRICAO = :DESCRICAO'
      'where'
      '  CODIGO = :OLD_CODIGO')
    InsertSQL.Strings = (
      'insert into grupos_touch'
      '  (CODIGO, DESCRICAO)'
      'values'
      '  (:CODIGO, :DESCRICAO)')
    DeleteSQL.Strings = (
      'delete from grupos_touch'
      'where'
      '  CODIGO = :OLD_CODIGO')
    Left = 298
    Top = 625
  end
  object qryGuarnicoes: TIBQuery
    Database = dbrestaurante
    Transaction = transacao
    BufferChunks = 1000
    CachedUpdates = True
    ParamCheck = True
    SQL.Strings = (
      'select * from guarnicoes')
    UpdateObject = updGuarnicoes
    Left = 335
    Top = 624
    object qryGuarnicoesCODIGO: TIBStringField
      FieldName = 'CODIGO'
      Origin = 'GUARNICOES.CODIGO'
      Required = True
      Size = 2
    end
    object qryGuarnicoesDESCRICAO: TIBStringField
      FieldName = 'DESCRICAO'
      Origin = 'GUARNICOES.DESCRICAO'
      Size = 30
    end
  end
  object dsGuarnicoes: TDataSource
    DataSet = qryGuarnicoes
    Left = 383
    Top = 626
  end
  object updGuarnicoes: TIBUpdateSQL
    RefreshSQL.Strings = (
      'Select *'
      'from guarnicoes '
      'where'
      '  CODIGO = :CODIGO')
    ModifySQL.Strings = (
      'update guarnicoes'
      'set'
      '  CODIGO = :CODIGO,'
      '  DESCRICAO = :DESCRICAO'
      'where'
      '  CODIGO = :OLD_CODIGO')
    InsertSQL.Strings = (
      'insert into guarnicoes'
      '  (CODIGO, DESCRICAO)'
      'values'
      '  (:CODIGO, :DESCRICAO)')
    DeleteSQL.Strings = (
      'delete from guarnicoes'
      'where'
      '  CODIGO = :OLD_CODIGO')
    Left = 434
    Top = 625
  end
  object qryMapaMesasSalao: TIBQuery
    Database = dbrestaurante
    Transaction = transacao
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    Filtered = True
    Left = 1008
    Top = 144
  end
  object dsMapaMesasSalao: TDataSource
    DataSet = qryMapaMesasSalao
    Left = 1056
    Top = 144
  end
  object qryMiniprinters: TIBQuery
    Database = dbrestaurante
    Transaction = transacao
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      'select * from nfe_destinadas')
    Filtered = True
    Left = 256
    Top = 48
  end
  object qryReg60A: TIBQuery
    Database = dbrestaurante
    Transaction = transacao
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      
        ' select cod_situacao, descricao from situacao_documento order by' +
        ' cod_situacao')
    Left = 406
    Top = 115
  end
  object qryProjecaoReceitaRD: TIBQuery
    Database = dbrestaurante
    Transaction = transacao
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      
        'select rd.data, udf_copy( upper(udf_dayname(rd.data)),0,3) as di' +
        'a ,rd.projecao, rd.reprojecao, rd.faturamento_real   from projec' +
        'oes_receitas_rd rd order by rd.data')
    UpdateObject = updQryProjecaoReceitasRD
    Left = 565
    Top = 460
    object qryProjecaoReceitaRDDATA: TDateField
      FieldName = 'DATA'
      Origin = 'PROJECOES_RECEITAS_RD.DATA'
      Required = True
    end
    object qryProjecaoReceitaRDPROJECAO: TFloatField
      FieldName = 'PROJECAO'
      Origin = 'PROJECOES_RECEITAS_RD.PROJECAO'
      currency = True
    end
    object qryProjecaoReceitaRDREPROJECAO: TFloatField
      FieldName = 'REPROJECAO'
      Origin = 'PROJECOES_RECEITAS_RD.REPROJECAO'
      currency = True
    end
    object qryProjecaoReceitaRDFATURAMENTO_REAL: TFloatField
      FieldName = 'FATURAMENTO_REAL'
      Origin = 'PROJECOES_RECEITAS_RD.FATURAMENTO_REAL'
      Required = True
      currency = True
    end
    object qryProjecaoReceitaRDDIA: TIBStringField
      FieldName = 'DIA'
      Size = 254
    end
  end
  object dsProjecaoReceitaRD: TDataSource
    DataSet = qryProjecaoReceitaRD
    Left = 598
    Top = 460
  end
  object updQryProjecaoReceitasRD: TIBUpdateSQL
    RefreshSQL.Strings = (
      'Select *'
      'from projecoes_receitas_rd '
      'where'
      '  DATA = :DATA')
    ModifySQL.Strings = (
      'update projecoes_receitas_rd'
      'set'
      '  PROJECAO = :PROJECAO,'
      '  REPROJECAO = :REPROJECAO,'
      '  FATURAMENTO_REAL = :FATURAMENTO_REAL'
      'where'
      '  DATA = :OLD_DATA')
    InsertSQL.Strings = (
      'insert into projecoes_receitas_rd'
      '  (PROJECAO, REPROJECAO, FATURAMENTO_REAL)'
      'values'
      '  (:PROJECAO, :REPROJECAO, :FATURAMENTO_REAL)')
    DeleteSQL.Strings = (
      'delete from projecoes_receitas_rd'
      'where'
      '  DATA = :OLD_DATA')
    Left = 627
    Top = 461
  end
  object qryProjecaoDespesasRD: TIBQuery
    Database = dbrestaurante
    Transaction = transacao
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      
        ' select rg.resultado,pj.mes, pj.ano,  pj.cod_grupo, rg.nivel,rg.' +
        'cod_formatado||'#39' - '#39'|| udf_trim(rg.descricao) as descricao, '
      
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
      #39'01.02.2016'#39
      ','#39'29.02.2016'#39
      ') tg on (tg.cod_grupo = pj.cod_grupo) '
      '  inner join r_grupos rg on (rg.cod_grupo = tg.cod_grupo) '
      ' where pj.mes=3 and pj.ano = 2016'
      
        '     order by rg.cod_grupo_raiz,rg.desdobramento_pai,rg.desdobra' +
        'mento_filho '
      '')
    Left = 569
    Top = 494
    object qryProjecaoDespesasRDRESULTADO: TSmallintField
      FieldName = 'RESULTADO'
      Origin = 'R_GRUPOS.RESULTADO'
    end
    object qryProjecaoDespesasRDMES: TSmallintField
      FieldName = 'MES'
      Origin = 'PROJECOES_DESPESAS_RD.MES'
      Required = True
    end
    object qryProjecaoDespesasRDANO: TSmallintField
      FieldName = 'ANO'
      Origin = 'PROJECOES_DESPESAS_RD.ANO'
      Required = True
    end
    object qryProjecaoDespesasRDCOD_GRUPO: TIBStringField
      FieldName = 'COD_GRUPO'
      Origin = 'PROJECOES_DESPESAS_RD.COD_GRUPO'
      Required = True
      Size = 6
    end
    object qryProjecaoDespesasRDNIVEL: TSmallintField
      FieldName = 'NIVEL'
      Origin = 'R_GRUPOS.NIVEL'
    end
    object qryProjecaoDespesasRDDESCRICAO: TIBStringField
      FieldName = 'DESCRICAO'
      Size = 272
    end
    object qryProjecaoDespesasRDPROJECAO_INICIAL: TFloatField
      FieldName = 'PROJECAO_INICIAL'
      Origin = 'TOTAIS_DESPESAS_GRUPO.PROJECAO_INICIAL'
      currency = True
    end
    object qryProjecaoDespesasRDPERC_PROJ_FAT: TIBBCDField
      FieldName = 'PERC_PROJ_FAT'
      Precision = 18
      Size = 2
    end
    object qryProjecaoDespesasRDREPROJECAO: TFloatField
      FieldName = 'REPROJECAO'
      Origin = 'TOTAIS_DESPESAS_GRUPO.REPROJECAO'
      currency = True
    end
    object qryProjecaoDespesasRDPERC_REPROJ_FAT: TIBBCDField
      FieldName = 'PERC_REPROJ_FAT'
      Precision = 18
      Size = 2
    end
    object qryProjecaoDespesasRDTOTAL: TFloatField
      FieldName = 'TOTAL'
      Origin = 'TOTAIS_DESPESAS_GRUPO.TOTAL'
      currency = True
    end
    object qryProjecaoDespesasRDPERC_FAT_REAL: TIBBCDField
      FieldName = 'PERC_FAT_REAL'
      Precision = 18
      Size = 2
    end
    object qryProjecaoDespesasRDSALDO: TFloatField
      FieldName = 'SALDO'
      currency = True
    end
    object qryProjecaoDespesasRDPERC_GERAL: TIBBCDField
      FieldName = 'PERC_GERAL'
      Precision = 18
      Size = 2
    end
    object qryProjecaoDespesasRDPERC_GRUPO_PAI: TIBBCDField
      FieldName = 'PERC_GRUPO_PAI'
      Precision = 18
      Size = 2
    end
    object qryProjecaoDespesasRDPROJ_FAT_MES: TFloatField
      FieldName = 'PROJ_FAT_MES'
      Origin = 'TOTAIS_DESPESAS_GRUPO.PROJ_FAT_MES'
      currency = True
    end
    object qryProjecaoDespesasRDREPROJ_FAT_MES: TFloatField
      FieldName = 'REPROJ_FAT_MES'
      Origin = 'TOTAIS_DESPESAS_GRUPO.REPROJ_FAT_MES'
      currency = True
    end
    object qryProjecaoDespesasRDFAT_REAL_MES: TFloatField
      FieldName = 'FAT_REAL_MES'
      Origin = 'TOTAIS_DESPESAS_GRUPO.FAT_REAL_MES'
      currency = True
    end
  end
  object dsQryProjecaoDespesasRD: TDataSource
    DataSet = qryProjecaoDespesasRD
    Left = 600
    Top = 495
  end
  object updQryProjecaoDespesasRD: TIBUpdateSQL
    RefreshSQL.Strings = (
      'Select *'
      'from projecoes_despesas_rd '
      'where'
      '  MES = :MES and'
      '  ANO = :ANO and'
      '  COD_GRUPO = :COD_GRUPO')
    ModifySQL.Strings = (
      'update projecoes_despesas_rd'
      'set'
      '  MES = :MES,'
      '  ANO = :ANO,'
      '  COD_GRUPO = :COD_GRUPO,'
      '  PROJECAO_INICIAL = :PROJECAO_INICIAL,'
      '  REPROJECAO = :REPROJECAO'
      'where'
      '  MES = :OLD_MES and'
      '  ANO = :OLD_ANO and'
      '  COD_GRUPO = :OLD_COD_GRUPO')
    InsertSQL.Strings = (
      'insert into projecoes_despesas_rd'
      '  (MES, ANO, COD_GRUPO, PROJECAO_INICIAL, REPROJECAO)'
      'values'
      '  (:MES, :ANO, :COD_GRUPO, :PROJECAO_INICIAL, :REPROJECAO)')
    DeleteSQL.Strings = (
      'delete from projecoes_despesas_rd'
      'where'
      '  MES = :OLD_MES and'
      '  ANO = :OLD_ANO and'
      '  COD_GRUPO = :OLD_COD_GRUPO')
    Left = 629
    Top = 504
  end
  object qryManifestacaoNFE: TIBQuery
    Database = dbrestaurante
    Transaction = transacao
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      ''
      ''
      'select nf.*, udf_copy(nf.chave_nfe,26,9) as numero_nota,'
      '    case when (nf.caminho_xml is null) then 0'
      '         when (nf.caminho_xml is not null) then 1'
      '    end as XML_BAIXADO ,'
      '   case when (nf.tipo_manifestacao = 1) then '#39'CONFIRMADA'#39
      '        when (nf.tipo_manifestacao = 2) then '#39'N'#195'O REALIZADA'#39
      '        when (nf.tipo_manifestacao = 3) then '#39'CI'#202'NCIA DA OP.'#39
      '        when (nf.tipo_manifestacao = 4) then '#39'OP. DESCONHECIDA'#39
      '    ELSE'
      '      '#39'SEM MANIFESTO'#39
      '   end as MANIFESTO'
      '     from nfe_destinadas nf    order by nf.data_emissao desc')
    Filtered = True
    Left = 1017
    Top = 240
    object qryManifestacaoNFECHAVE_NFE: TIBStringField
      FieldName = 'CHAVE_NFE'
      Origin = 'NFE_DESTINADAS.CHAVE_NFE'
      Required = True
      Size = 50
    end
    object qryManifestacaoNFECNPJ: TIBStringField
      FieldName = 'CNPJ'
      Origin = 'NFE_DESTINADAS.CNPJ'
      Size = 14
    end
    object qryManifestacaoNFEIE: TIBStringField
      FieldName = 'IE'
      Origin = 'NFE_DESTINADAS.IE'
      Size = 14
    end
    object qryManifestacaoNFENOME_FORNECEDOR: TIBStringField
      FieldName = 'NOME_FORNECEDOR'
      Origin = 'NFE_DESTINADAS.NOME_FORNECEDOR'
      Size = 100
    end
    object qryManifestacaoNFEDATA_EMISSAO: TDateField
      FieldName = 'DATA_EMISSAO'
      Origin = 'NFE_DESTINADAS.DATA_EMISSAO'
    end
    object qryManifestacaoNFEVALOR_NOTA: TIBBCDField
      FieldName = 'VALOR_NOTA'
      Origin = 'NFE_DESTINADAS.VALOR_NOTA'
      currency = True
      Precision = 18
      Size = 2
    end
    object qryManifestacaoNFENUMERO_NOTA: TIBStringField
      FieldName = 'NUMERO_NOTA'
      Origin = 'NFE_DESTINADAS.NUMERO_NOTA'
      Size = 15
    end
    object qryManifestacaoNFECAMINHO_XML: TIBStringField
      FieldName = 'CAMINHO_XML'
      Origin = 'NFE_DESTINADAS.CAMINHO_XML'
      Size = 300
    end
    object qryManifestacaoNFEDATA_INSERCAO: TDateTimeField
      FieldName = 'DATA_INSERCAO'
      Origin = 'NFE_DESTINADAS.DATA_INSERCAO'
      Required = True
    end
    object qryManifestacaoNFESTATUS_NFE: TSmallintField
      FieldName = 'STATUS_NFE'
      Origin = 'NFE_DESTINADAS.STATUS_NFE'
      Required = True
    end
    object qryManifestacaoNFELANCADA: TSmallintField
      FieldName = 'LANCADA'
      Origin = 'NFE_DESTINADAS.LANCADA'
      Required = True
    end
    object qryManifestacaoNFEFORN_CADASTRADO: TSmallintField
      FieldName = 'FORN_CADASTRADO'
      Origin = 'NFE_DESTINADAS.FORN_CADASTRADO'
      Required = True
    end
    object qryManifestacaoNFETIPO_MANIFESTACAO: TSmallintField
      FieldName = 'TIPO_MANIFESTACAO'
      Origin = 'NFE_DESTINADAS.TIPO_MANIFESTACAO'
      Required = True
    end
    object qryManifestacaoNFEDATA_HORA_MANIFESTACAO: TDateTimeField
      FieldName = 'DATA_HORA_MANIFESTACAO'
      Origin = 'NFE_DESTINADAS.DATA_HORA_MANIFESTACAO'
    end
    object qryManifestacaoNFEID_MANIFESTACAO: TIBStringField
      FieldName = 'ID_MANIFESTACAO'
      Origin = 'NFE_DESTINADAS.ID_MANIFESTACAO'
      Size = 25
    end
    object qryManifestacaoNFEPROTOCOLO_MANIFESTACAO: TIBStringField
      FieldName = 'PROTOCOLO_MANIFESTACAO'
      Origin = 'NFE_DESTINADAS.PROTOCOLO_MANIFESTACAO'
      Size = 25
    end
    object qryManifestacaoNFEXML_BAIXADO: TIntegerField
      FieldName = 'XML_BAIXADO'
    end
    object qryManifestacaoNFEMANIFESTO: TIBStringField
      FieldName = 'MANIFESTO'
      Required = True
      FixedChar = True
      Size = 16
    end
    object qryManifestacaoNFEOBS_MANIFESTACAO: TIBStringField
      FieldName = 'OBS_MANIFESTACAO'
      Origin = '"NFE_DESTINADAS"."OBS_MANIFESTACAO"'
      Size = 200
    end
    object qryManifestacaoNFEPROCESSADA: TSmallintField
      FieldName = 'PROCESSADA'
      Origin = '"NFE_DESTINADAS"."PROCESSADA"'
    end
    object qryManifestacaoNFEXML_NOTA: TWideMemoField
      FieldName = 'XML_NOTA'
      Origin = '"NFE_DESTINADAS"."XML_NOTA"'
      ProviderFlags = [pfInUpdate]
      BlobType = ftWideMemo
      Size = 8
    end
  end
  object dsManifestacaoNFE: TDataSource
    DataSet = qryManifestacaoNFE
    Left = 1063
    Top = 238
  end
  object qryComparaProdutosNFE: TIBQuery
    Database = dbrestaurante
    Transaction = transacao
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      ''
      
        ' select cp.*, p.descricao, f.razao_social, u.descricao as descri' +
        'cao_unidade  from compara_produtos_nfe cp'
      
        '  left join produtos p on (p.cod_produto  = cp.cod_produto_inter' +
        'no)'
      '  left join unidades u on (u.cod_unidade = p.unidade_entrada)'
      ''
      '  inner join fornecedor f on (f.cgc_cpf = cp.cnpj_fornecedor)'
      ''
      ' where cp.cnpj_fornecedor='#39'01587218000157'#39)
    Left = 1165
    Top = 502
    object qryComparaProdutosNFECNPJ_FORNECEDOR: TIBStringField
      FieldName = 'CNPJ_FORNECEDOR'
      Origin = 'COMPARA_PRODUTOS_NFE.CNPJ_FORNECEDOR'
      Required = True
      Size = 14
    end
    object qryComparaProdutosNFECOD_PROD_FORNECEDOR: TIBStringField
      FieldName = 'COD_PROD_FORNECEDOR'
      Origin = 'COMPARA_PRODUTOS_NFE.COD_PROD_FORNECEDOR'
      Required = True
      Size = 25
    end
    object qryComparaProdutosNFECOD_PRODUTO_INTERNO: TIBStringField
      FieldName = 'COD_PRODUTO_INTERNO'
      Origin = 'COMPARA_PRODUTOS_NFE.COD_PRODUTO_INTERNO'
      Size = 5
    end
    object qryComparaProdutosNFECFOP_ENTRADA: TIBStringField
      FieldName = 'CFOP_ENTRADA'
      Origin = 'COMPARA_PRODUTOS_NFE.CFOP_ENTRADA'
      Size = 4
    end
    object qryComparaProdutosNFECST_ENTRADA: TIBStringField
      FieldName = 'CST_ENTRADA'
      Origin = 'COMPARA_PRODUTOS_NFE.CST_ENTRADA'
      Size = 3
    end
    object qryComparaProdutosNFEUNIDADE_ENTRADA: TIBStringField
      FieldName = 'UNIDADE_ENTRADA'
      Origin = 'COMPARA_PRODUTOS_NFE.UNIDADE_ENTRADA'
      Size = 2
    end
    object qryComparaProdutosNFEFATOR_CONVERSAO: TIBBCDField
      FieldName = 'FATOR_CONVERSAO'
      Origin = 'COMPARA_PRODUTOS_NFE.FATOR_CONVERSAO'
      Precision = 18
      Size = 3
    end
    object qryComparaProdutosNFEOPERACAO: TSmallintField
      FieldName = 'OPERACAO'
      Origin = 'COMPARA_PRODUTOS_NFE.OPERACAO'
    end
    object qryComparaProdutosNFECFOP_FORNECEDOR: TIBStringField
      FieldName = 'CFOP_FORNECEDOR'
      Origin = 'COMPARA_PRODUTOS_NFE.CFOP_FORNECEDOR'
      Size = 4
    end
    object qryComparaProdutosNFECST_FORNECEDOR: TIBStringField
      FieldName = 'CST_FORNECEDOR'
      Origin = 'COMPARA_PRODUTOS_NFE.CST_FORNECEDOR'
      Size = 3
    end
    object qryComparaProdutosNFENCM: TIBStringField
      FieldName = 'NCM'
      Origin = 'COMPARA_PRODUTOS_NFE.NCM'
      Size = 10
    end
    object qryComparaProdutosNFEUNIDADE_COMERCIALIZADA: TIBStringField
      FieldName = 'UNIDADE_COMERCIALIZADA'
      Origin = 'COMPARA_PRODUTOS_NFE.UNIDADE_COMERCIALIZADA'
      Size = 6
    end
    object qryComparaProdutosNFEDESCRICAO_FORNECEDOR: TIBStringField
      FieldName = 'DESCRICAO_FORNECEDOR'
      Origin = 'COMPARA_PRODUTOS_NFE.DESCRICAO_FORNECEDOR'
      Size = 150
    end
    object qryComparaProdutosNFEULTIMA_CHAVE: TIBStringField
      FieldName = 'ULTIMA_CHAVE'
      Origin = 'COMPARA_PRODUTOS_NFE.ULTIMA_CHAVE'
      Required = True
      Size = 50
    end
    object qryComparaProdutosNFEDESCRICAO: TIBStringField
      FieldName = 'DESCRICAO'
      Origin = 'PRODUTOS.DESCRICAO'
      Size = 40
    end
    object qryComparaProdutosNFERAZAO_SOCIAL: TIBStringField
      FieldName = 'RAZAO_SOCIAL'
      Origin = 'FORNECEDOR.RAZAO_SOCIAL'
      Size = 100
    end
    object qryComparaProdutosNFEDESCRICAO_UNIDADE: TIBStringField
      FieldName = 'DESCRICAO_UNIDADE'
      Origin = 'UNIDADES.DESCRICAO'
      Size = 25
    end
  end
  object dsQryComparaProdutosNFE: TDataSource
    DataSet = qryComparaProdutosNFE
    Left = 1202
    Top = 448
  end
  object qryCsProdEtiquetas: TIBQuery
    Database = dbrestaurante
    Transaction = transacao
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      ''
      ''
      ''
      
        'select p.cod_produto, p.descricao, p.valor_unitario, p.cod_grupo' +
        ',p.caminho_foto'
      ' from produtos p order by cod_produto')
    UpdateObject = updQryMovtivosEstornos
    Left = 955
    Top = 195
    object qryCsProdEtiquetasCOD_PRODUTO: TIBStringField
      FieldName = 'COD_PRODUTO'
      Origin = 'PRODUTOS.COD_PRODUTO'
      Required = True
      Size = 5
    end
    object qryCsProdEtiquetasDESCRICAO: TIBStringField
      FieldName = 'DESCRICAO'
      Origin = 'PRODUTOS.DESCRICAO'
      Required = True
      Size = 40
    end
    object qryCsProdEtiquetasVALOR_UNITARIO: TIBBCDField
      FieldName = 'VALOR_UNITARIO'
      Origin = 'PRODUTOS.VALOR_UNITARIO'
      Required = True
      currency = True
      Precision = 18
      Size = 2
    end
    object qryCsProdEtiquetasCOD_GRUPO: TIBStringField
      FieldName = 'COD_GRUPO'
      Origin = 'PRODUTOS.COD_GRUPO'
      Size = 6
    end
    object qryCsProdEtiquetasCAMINHO_FOTO: TIBStringField
      FieldName = 'CAMINHO_FOTO'
      Origin = 'PRODUTOS.CAMINHO_FOTO'
      Size = 100
    end
  end
  object dsQryCsProdEtiquetas: TDataSource
    DataSet = qryCsProdEtiquetas
    Left = 989
    Top = 188
  end
  object tbLancamentosRDTEMP: TRxMemoryData
    FieldDefs = <
      item
        Name = 'COD_GRUPO'
        DataType = ftString
        Size = 6
      end
      item
        Name = 'valor'
        DataType = ftCurrency
      end
      item
        Name = 'descricao'
        DataType = ftString
        Size = 30
      end>
    Left = 1130
    Top = 205
    object tbLancamentosRDTEMPCOD_GRUPO: TStringField
      FieldName = 'COD_GRUPO'
      Size = 6
    end
    object tbLancamentosRDTEMPvalor: TCurrencyField
      FieldName = 'valor'
    end
    object tbLancamentosRDTEMPdescricao: TStringField
      FieldName = 'descricao'
      Size = 30
    end
  end
  object dsLancamentosRDTemp: TDataSource
    DataSet = tbLancamentosRDTEMP
    Left = 1161
    Top = 202
  end
  object qryLancamentosRD: TIBQuery
    Database = dbrestaurante
    Transaction = transacao
    BufferChunks = 1000
    CachedUpdates = True
    ParamCheck = True
    SQL.Strings = (
      ''
      ''
      ''
      ' select lr.*, f.razao_social from lancamentos_rd lr'
      
        '  inner join fornecedor f on (f.cod_fornecedor = lr.cod_forneced' +
        'or)')
    UpdateObject = updQryLancamentosRD
    Left = 1115
    Top = 150
    object qryLancamentosRDCODIGO: TIBStringField
      FieldName = 'CODIGO'
      Origin = 'LANCAMENTOS_RD.CODIGO'
      Required = True
      Size = 8
    end
    object qryLancamentosRDCOD_FORNECEDOR: TIBStringField
      FieldName = 'COD_FORNECEDOR'
      Origin = 'LANCAMENTOS_RD.COD_FORNECEDOR'
      Required = True
      Size = 4
    end
    object qryLancamentosRDNUM_DOC: TIBStringField
      FieldName = 'NUM_DOC'
      Origin = 'LANCAMENTOS_RD.NUM_DOC'
      Required = True
      Size = 15
    end
    object qryLancamentosRDDATA_LANCAMENTO: TDateTimeField
      FieldName = 'DATA_LANCAMENTO'
      Origin = 'LANCAMENTOS_RD.DATA_LANCAMENTO'
      Required = True
    end
    object qryLancamentosRDDATA_DOCUMENTO: TDateField
      FieldName = 'DATA_DOCUMENTO'
      Origin = 'LANCAMENTOS_RD.DATA_DOCUMENTO'
      Required = True
    end
    object qryLancamentosRDDATA_RD: TDateField
      FieldName = 'DATA_RD'
      Origin = 'LANCAMENTOS_RD.DATA_RD'
      Required = True
    end
    object qryLancamentosRDOBSERVACOES: TIBStringField
      FieldName = 'OBSERVACOES'
      Origin = 'LANCAMENTOS_RD.OBSERVACOES'
      Size = 250
    end
    object qryLancamentosRDRAZAO_SOCIAL: TIBStringField
      FieldName = 'RAZAO_SOCIAL'
      Origin = 'FORNECEDOR.RAZAO_SOCIAL'
      Size = 100
    end
    object qryLancamentosRDNOME_USUARIO: TIBStringField
      FieldName = 'NOME_USUARIO'
      Origin = 'LANCAMENTOS_RD.NOME_USUARIO'
      Size = 15
    end
  end
  object updQryLancamentosRD: TIBUpdateSQL
    RefreshSQL.Strings = (
      ''
      ''
      ''
      
        ' select lr.*, f.razao_social as xRazao_social from lancamentos_r' +
        'd lr'
      
        '  inner join fornecedor f on (f.cod_fornecedor = lr.cod_forneced' +
        'or)')
    ModifySQL.Strings = (
      'update lancamentos_rd'
      'set'
      '  CODIGO = :CODIGO,'
      '  COD_FORNECEDOR = :COD_FORNECEDOR,'
      '  NUM_DOC = :NUM_DOC,'
      '  DATA_LANCAMENTO = :DATA_LANCAMENTO,'
      '  DATA_DOCUMENTO = :DATA_DOCUMENTO,'
      '  DATA_RD = :DATA_RD,'
      '  OBSERVACOES = :OBSERVACOES,'
      '  NOME_USUARIO = :NOME_USUARIO'
      'where'
      '  CODIGO = :OLD_CODIGO')
    InsertSQL.Strings = (
      'insert into lancamentos_rd'
      
        '  (CODIGO, COD_FORNECEDOR, NUM_DOC, DATA_LANCAMENTO, DATA_DOCUME' +
        'NTO, DATA_RD, '
      '   OBSERVACOES, NOME_USUARIO)'
      'values'
      
        '  (:CODIGO, :COD_FORNECEDOR, :NUM_DOC, :DATA_LANCAMENTO, :DATA_D' +
        'OCUMENTO, '
      '   :DATA_RD, :OBSERVACOES, :NOME_USUARIO)')
    DeleteSQL.Strings = (
      'delete from lancamentos_rd'
      'where'
      '  CODIGO = :OLD_CODIGO')
    Left = 1150
    Top = 150
  end
  object dsQryLancamentosRD: TDataSource
    DataSet = qryLancamentosRD
    Left = 1180
    Top = 159
  end
  object ACBrPosPrinter1: TACBrPosPrinter
    ConfigBarras.MostrarCodigo = False
    ConfigBarras.LarguraLinha = 0
    ConfigBarras.Altura = 0
    ConfigBarras.Margem = 0
    ConfigQRCode.Tipo = 2
    ConfigQRCode.LarguraModulo = 4
    ConfigQRCode.ErrorLevel = 0
    LinhasEntreCupons = 5
    CortaPapel = False
    Left = 744
    Top = 24
  end
  object ACBrNFeDANFeESCPOS1: TACBrNFeDANFeESCPOS
    Sistema = 'Real Manager Vers'#227'o  5'
    Site = 'www.realsoftwares.com.br'
    MargemInferior = 0.800000000000000000
    MargemSuperior = 0.800000000000000000
    MargemEsquerda = 0.600000000000000000
    MargemDireita = 0.510000000000000000
    CasasDecimais.Formato = tdetInteger
    CasasDecimais.qCom = 2
    CasasDecimais.vUnCom = 2
    CasasDecimais.MaskqCom = ',0.00'
    CasasDecimais.MaskvUnCom = ',0.00'
    TipoDANFE = tiNFCe
    ImprimeLogoLateral = True
    PosPrinter = ACBrPosPrinter1
    Left = 688
  end
  object ACBrNFeDANFEFR1: TACBrNFeDANFEFR
    Sistema = 'Real Manager Vers'#227'o 4.3412.12'
    Site = 'www.realsoftwares.com.br'
    MargemInferior = 0.800000000000000000
    MargemSuperior = 0.800000000000000000
    MargemEsquerda = 0.600000000000000000
    MargemDireita = 0.510000000000000000
    CasasDecimais.Formato = tdetInteger
    CasasDecimais.qCom = 2
    CasasDecimais.vUnCom = 2
    CasasDecimais.MaskqCom = ',0.00'
    CasasDecimais.MaskvUnCom = ',0.00'
    TipoDANFE = tiPaisagem
    ImprimeNomeFantasia = True
    EspessuraBorda = 1
    ExpandirDadosAdicionaisAuto = False
    IncorporarBackgroundPdf = True
    IncorporarFontesPdf = True
    BorderIcon = [biSystemMenu, biMinimize, biMaximize]
    Left = 440
    Top = 72
  end
  object procGeraInutilizacoes: TIBStoredProc
    Database = dbrestaurante
    Transaction = transacao
    StoredProcName = 'GERA_INUTILIZACOES'
    Left = 376
    Top = 16
  end
  object qryVendasCaixa: TIBQuery
    Database = dbrestaurante
    Transaction = transacao
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      
        'select  v.cod_venda,v.data_so, v.hora, v.mesa, v.coo_cupom, v.nu' +
        'mero_nfce, v.serie_nfce,  v.valor_bruto, v.valor_txserv, v.xml_d' +
        'oc, '
      
        '         v.valor_tx_entrega, v.valor_desconto , v.valor_total, v' +
        '.modelo_comprovante,'
      
        '         v.chave_nfce, v.protocolo_nfce, v.numero_caixa,tipo_ven' +
        'da,'
      ''
      '         case'
      '           when  v.tipo_venda =1 then '#39'Mesa'#39
      '           when  v.tipo_venda =2 then '#39'Balc'#227'o'#39
      '           when  v.tipo_venda =3 then '#39'Deliv.'#39
      '         end  as tipo,'
      ''
      '         case'
      '           when v.modelo_comprovante = 0 then '#39'AVULSO'#39
      '           when v.modelo_comprovante = 1 then '#39'ECF'#39
      '           when v.modelo_comprovante = 2 then '#39'NFC-e'#39
      '           when v.modelo_comprovante = 3 then '#39'NF 55'#39
      '         end as desc_modelo_comprovante'
      ''
      
        '  from vendas v where v.modelo_comprovante >= 2 and  v.data_so b' +
        'etween '#39'18.04.2018'#39
      ' and '#39'18.04.2018'#39
      ' and v.numero_caixa='#39'001'#39
      ' and v.numero_nfce  between 0 and 99999'
      '  order by cod_venda desc')
    Filtered = True
    Left = 608
    Top = 224
    object qryVendasCaixaCOD_VENDA: TIBStringField
      FieldName = 'COD_VENDA'
      Origin = 'VENDAS.COD_VENDA'
      Required = True
      Size = 8
    end
    object qryVendasCaixaHORA: TTimeField
      FieldName = 'HORA'
      Origin = 'VENDAS.HORA'
      Required = True
    end
    object qryVendasCaixaMESA: TIBStringField
      FieldName = 'MESA'
      Origin = 'VENDAS.MESA'
      Size = 4
    end
    object qryVendasCaixaVALOR_BRUTO: TIBBCDField
      FieldName = 'VALOR_BRUTO'
      Origin = 'VENDAS.VALOR_BRUTO'
      Required = True
      currency = True
      Precision = 18
      Size = 2
    end
    object qryVendasCaixaVALOR_TXSERV: TIBBCDField
      FieldName = 'VALOR_TXSERV'
      Origin = 'VENDAS.VALOR_TXSERV'
      Required = True
      currency = True
      Precision = 18
      Size = 2
    end
    object qryVendasCaixaVALOR_TX_ENTREGA: TIBBCDField
      FieldName = 'VALOR_TX_ENTREGA'
      Origin = 'VENDAS.VALOR_TX_ENTREGA'
      Required = True
      currency = True
      Precision = 18
      Size = 2
    end
    object qryVendasCaixaVALOR_TOTAL: TIBBCDField
      FieldName = 'VALOR_TOTAL'
      Origin = 'VENDAS.VALOR_TOTAL'
      Required = True
      currency = True
      Precision = 18
      Size = 2
    end
    object qryVendasCaixaMODELO_COMPROVANTE: TSmallintField
      FieldName = 'MODELO_COMPROVANTE'
      Origin = 'VENDAS.MODELO_COMPROVANTE'
      Required = True
    end
    object qryVendasCaixaCHAVE_NFCE: TIBStringField
      FieldName = 'CHAVE_NFCE'
      Origin = 'VENDAS.CHAVE_NFCE'
      Required = True
      Size = 50
    end
    object qryVendasCaixaPROTOCOLO_NFCE: TIBStringField
      FieldName = 'PROTOCOLO_NFCE'
      Origin = 'VENDAS.PROTOCOLO_NFCE'
      Required = True
      Size = 25
    end
    object qryVendasCaixaCOO_CUPOM: TIBStringField
      FieldName = 'COO_CUPOM'
      Origin = 'VENDAS.COO_CUPOM'
      Required = True
      Size = 15
    end
    object qryVendasCaixaNUMERO_NFCE: TIntegerField
      FieldName = 'NUMERO_NFCE'
      Origin = 'VENDAS.NUMERO_NFCE'
      Required = True
    end
    object qryVendasCaixaVALOR_DESCONTO: TIBBCDField
      FieldName = 'VALOR_DESCONTO'
      Origin = 'VENDAS.VALOR_DESCONTO'
      Required = True
      currency = True
      Precision = 18
      Size = 2
    end
    object qryVendasCaixaDATA_SO: TDateField
      FieldName = 'DATA_SO'
      Origin = 'VENDAS.DATA_SO'
    end
    object qryVendasCaixaSERIE_NFCE: TSmallintField
      FieldName = 'SERIE_NFCE'
      Origin = '"VENDAS"."SERIE_NFCE"'
    end
    object qryVendasCaixaXML_DOC: TWideMemoField
      FieldName = 'XML_DOC'
      Origin = '"VENDAS"."XML_DOC"'
      ProviderFlags = [pfInUpdate]
      BlobType = ftWideMemo
      Size = 8
    end
    object qryVendasCaixaTIPO: TIBStringField
      FieldName = 'TIPO'
      ProviderFlags = []
      FixedChar = True
      Size = 6
    end
    object qryVendasCaixaDESC_MODELO_COMPROVANTE: TIBStringField
      FieldName = 'DESC_MODELO_COMPROVANTE'
      ProviderFlags = []
      FixedChar = True
      Size = 6
    end
    object qryVendasCaixaNUMERO_CAIXA: TIBStringField
      FieldName = 'NUMERO_CAIXA'
      Origin = '"VENDAS"."NUMERO_CAIXA"'
      Size = 3
    end
    object qryVendasCaixaTIPO_VENDA: TSmallintField
      FieldName = 'TIPO_VENDA'
      Origin = '"VENDAS"."TIPO_VENDA"'
      OnGetText = qryVendasCaixaTIPO_VENDAGetText
    end
  end
  object dsQryVendasCaixa: TDataSource
    DataSet = qryVendasCaixa
    Left = 640
    Top = 168
  end
  object JvVigenereCipher1: TJvVigenereCipher
    Left = 552
    Top = 160
  end
  object sat: TACBrSAT
    Extrato = extratoSat
    OnGravarLog = satGravarLog
    Config.infCFe_versaoDadosEnt = 0.070000000000000010
    Config.ide_numeroCaixa = 0
    Config.ide_tpAmb = taHomologacao
    Config.emit_cRegTrib = RTSimplesNacional
    Config.emit_cRegTribISSQN = RTISSMicroempresaMunicipal
    Config.emit_indRatISSQN = irSim
    Config.EhUTF8 = False
    Config.PaginaDeCodigo = 0
    Config.XmlSignLib = xsNone
    ConfigArquivos.PrefixoArqCFe = 'AD'
    ConfigArquivos.PrefixoArqCFeCanc = 'ADC'
    Rede.tipoInter = infETHE
    Rede.seg = segNONE
    Rede.tipoLan = lanDHCP
    Rede.proxy = 0
    Rede.proxy_porta = 0
    OnGetcodigoDeAtivacao = satGetcodigoDeAtivacao
    OnGetsignAC = satGetsignAC
    OnMensagemSEFAZ = satMensagemSEFAZ
    Left = 560
    Top = 64
  end
  object extratoSat: TACBrSATExtratoESCPOS
    Sistema = 'Projeto ACBr - www.projetoacbr.com.br'
    Site = 'www.ciadochurrasco.com.br'
    MargemInferior = 0.800000000000000000
    MargemSuperior = 0.800000000000000000
    MargemEsquerda = 0.600000000000000000
    MargemDireita = 0.510000000000000000
    CasasDecimais.Formato = tdetInteger
    CasasDecimais.qCom = 2
    CasasDecimais.vUnCom = 2
    CasasDecimais.MaskqCom = ',0.00'
    CasasDecimais.MaskvUnCom = ',0.00'
    ACBrSAT = sat
    MsgAppQRCode = 
      'Consulte o QR Code pelo aplicativo  "De olho na nota", dispon'#237've' +
      'l na AppStore (Apple) e PlayStore (Android)'
    PosPrinter = ACBrPosPrinter1
    Left = 504
    Top = 64
  end
  object ACBrNFe1: TACBrNFe
    Configuracoes.Geral.SSLLib = libCustom
    Configuracoes.Geral.SSLCryptLib = cryWinCrypt
    Configuracoes.Geral.SSLHttpLib = httpWinHttp
    Configuracoes.Geral.SSLXmlSignLib = xsMsXml
    Configuracoes.Geral.Salvar = False
    Configuracoes.Geral.FormatoAlerta = 'TAG:%TAGNIVEL% ID:%ID%/%TAG%(%DESCRICAO%) - %MSG%.'
    Configuracoes.Geral.AtualizarXMLCancelado = True
    Configuracoes.Geral.VersaoQRCode = veqr000
    Configuracoes.Arquivos.Salvar = False
    Configuracoes.Arquivos.OrdenacaoPath = <>
    Configuracoes.WebServices.UF = 'SP'
    Configuracoes.WebServices.AguardarConsultaRet = 15000
    Configuracoes.WebServices.AjustaAguardaConsultaRet = True
    Configuracoes.WebServices.TimeOutPorThread = True
    Configuracoes.WebServices.QuebradeLinha = '|'
    Configuracoes.RespTec.IdCSRT = 0
    Left = 336
    Top = 72
  end
  object ACBrTEFD1: TACBrTEFD
    Identificacao.NomeAplicacao = 'Real Manager 2.5'
    Identificacao.VersaoAplicacao = '3.0'
    Identificacao.SoftwareHouse = 'ACBr'
    Identificacao.RazaoSocial = 'Projeto ACBr'
    MultiplosCartoes = True
    NumeroMaximoCartoes = 3
    AutoFinalizarCupom = False
    EsperaSTS = 7
    CHQEmGerencial = True
    TEFDial.ArqLOG = 'TEF_DIAL.log'
    TEFDial.Habilitado = True
    TEFDial.ArqTemp = 'C:\TEF_DIAL\req\intpos.tmp'
    TEFDial.ArqReq = 'C:\TEF_DIAL\req\intpos.001'
    TEFDial.ArqSTS = 'C:\TEF_DIAL\resp\intpos.sts'
    TEFDial.ArqResp = 'C:\TEF_DIAL\resp\intpos.001'
    TEFDial.GPExeName = 'C:\TEF_DIAL\tef_dial.exe'
    TEFDisc.ArqTemp = 'C:\TEF_Disc\req\intpos.tmp'
    TEFDisc.ArqReq = 'C:\TEF_Disc\req\intpos.001'
    TEFDisc.ArqSTS = 'C:\TEF_Disc\resp\intpos.sts'
    TEFDisc.ArqResp = 'C:\TEF_Disc\resp\intpos.001'
    TEFDisc.GPExeName = 'C:\TEF_Disc\tef_Disc.exe'
    TEFHiper.ArqTemp = 'c:\HiperTEF\req\IntPos.tmp'
    TEFHiper.ArqReq = 'C:\HiperTEF\req\IntPos.001'
    TEFHiper.ArqSTS = 'C:\HiperTEF\resp\IntPos.sts'
    TEFHiper.ArqResp = 'C:\HiperTEF\resp\IntPos.001'
    TEFHiper.GPExeName = 'C:\HiperTEF\HiperTEF.exe'
    TEFCliSiTef.ArqLOG = 'CliSiTef.log'
    TEFCliSiTef.EnderecoIP = '127.0.0.1'
    TEFCliSiTef.CodigoLoja = '00000000'
    TEFCliSiTef.NumeroTerminal = 'SE000001'
    TEFVeSPague.ArqLOG = 'VeSPague.log'
    TEFVeSPague.Aplicacao = 'ACBr_TEFDDemo'
    TEFVeSPague.AplicacaoVersao = '1.0'
    TEFVeSPague.GPExeName = 'C:\VeSPague\Client\VeSPagueClient.bat'
    TEFVeSPague.GPExeParams = '189.115.24.32 65432'
    TEFVeSPague.EnderecoIP = 'localhost'
    TEFVeSPague.Porta = '60906'
    TEFVeSPague.TimeOut = 500
    TEFVeSPague.TemPendencias = False
    TEFVeSPague.TransacaoCRT = 'Cartao Vender'
    TEFVeSPague.TransacaoCHQ = 'Cheque Consultar'
    TEFVeSPague.TransacaoCNC = 'Administracao Cancelar'
    TEFVeSPague.TransacaoReImpressao = 'Administracao Reimprimir'
    TEFVeSPague.TransacaoPendente = 'Administracao Pendente'
    TEFGPU.ArqTemp = 'C:\TEF_GPU\req\intpos.tmp'
    TEFGPU.ArqReq = 'C:\TEF_GPU\req\intpos.001'
    TEFGPU.ArqSTS = 'C:\TEF_GPU\resp\intpos.sts'
    TEFGPU.ArqResp = 'C:\TEF_GPU\resp\intpos.001'
    TEFGPU.GPExeName = 'C:\TEF_GPU\GPU.exe'
    TEFBanese.ArqTemp = 'C:\bcard\req\pergunta.tmp'
    TEFBanese.ArqReq = 'C:\bcard\req\pergunta.txt'
    TEFBanese.ArqSTS = 'C:\bcard\resp\status.txt'
    TEFBanese.ArqResp = 'C:\bcard\resp\resposta.txt'
    TEFBanese.ArqRespBkp = 'C:\bcard\resposta.txt'
    TEFBanese.ArqRespMovBkp = 'C:\bcard\copiamovimento.txt'
    TEFAuttar.ArqTemp = 'C:\Auttar_TefIP\req\intpos.tmp'
    TEFAuttar.ArqReq = 'C:\Auttar_TefIP\req\intpos.001'
    TEFAuttar.ArqSTS = 'C:\Auttar_TefIP\resp\intpos.sts'
    TEFAuttar.ArqResp = 'C:\Auttar_TefIP\resp\intpos.001'
    TEFAuttar.GPExeName = 'C:\Program Files (x86)\Auttar\IntegradorTEF-IP.exe'
    TEFGood.ArqTemp = 'C:\good\gettemp.dat'
    TEFGood.ArqReq = 'C:\good\getreq.dat'
    TEFGood.ArqSTS = 'C:\good\getstat.dat'
    TEFGood.ArqResp = 'C:\good\getresp.dat'
    TEFGood.GPExeName = 'C:\good\GETGoodMed.exe'
    TEFFoxWin.ArqTemp = 'C:\FwTEF\req\intpos.tmp'
    TEFFoxWin.ArqReq = 'C:\FwTEF\req\intpos.001'
    TEFFoxWin.ArqSTS = 'C:\FwTEF\rsp\intpos.sts'
    TEFFoxWin.ArqResp = 'C:\FwTEF\rsp\intpos.001'
    TEFFoxWin.GPExeName = 'C:\FwTEF\bin\FwTEF.exe'
    TEFCliDTEF.ArqResp = ''
    TEFPetrocard.ArqTemp = 'C:\CardTech\req\intpos.tmp'
    TEFPetrocard.ArqReq = 'C:\CardTech\req\intpos.001'
    TEFPetrocard.ArqSTS = 'C:\CardTech\resp\intpos.sts'
    TEFPetrocard.ArqResp = 'C:\CardTech\resp\intpos.001'
    TEFPetrocard.GPExeName = 'C:\CardTech\sac.exe'
    TEFCrediShop.ArqTemp = 'C:\tef_cshp\req\intpos.tmp'
    TEFCrediShop.ArqReq = 'C:\tef_cshp\req\intpos.001'
    TEFCrediShop.ArqSTS = 'C:\tef_cshp\resp\intpos.sts'
    TEFCrediShop.ArqResp = 'C:\tef_cshp\resp\intpos.001'
    TEFCrediShop.GPExeName = 'C:\tef_cshp\vpos_tef.exe'
    TEFTicketCar.ArqTemp = 'C:\TCS\TX\INTTCS.tmp'
    TEFTicketCar.ArqReq = 'C:\TCS\TX\INTTCS.001'
    TEFTicketCar.ArqSTS = 'C:\TCS\RX\INTTCS.RET'
    TEFTicketCar.ArqResp = 'C:\TCS\RX\INTTCS.001'
    TEFTicketCar.GPExeName = 'C:\TCS\tcs.exe'
    TEFTicketCar.NumLoja = 0
    TEFTicketCar.NumCaixa = 0
    TEFTicketCar.AtualizaPrecos = False
    TEFConvCard.ArqTemp = 'C:\ger_convenio\tx\crtsol.tmp'
    TEFConvCard.ArqReq = 'C:\ger_convenio\tx\crtsol.001'
    TEFConvCard.ArqSTS = 'C:\ger_convenio\rx\crtsol.ok'
    TEFConvCard.ArqResp = 'C:\ger_convenio\rx\crtsol.001'
    TEFConvCard.GPExeName = 'C:\ger_convcard\convcard.exe'
    OnExibeMsg = ACBrTEFD1ExibeMsg
    OnComandaECF = ACBrTEFD1ComandaECF
    OnComandaECFSubtotaliza = ACBrTEFD1ComandaECFSubtotaliza
    OnComandaECFPagamento = ACBrTEFD1ComandaECFPagamento
    OnComandaECFAbreVinculado = ACBrTEFD1ComandaECFAbreVinculado
    OnComandaECFImprimeVia = ACBrTEFD1ComandaECFImprimeVia
    OnInfoECF = ACBrTEFD1InfoECF
    OnAntesFinalizarRequisicao = ACBrTEFD1AntesFinalizarRequisicao
    OnGravarLog = ACBrTEFD1GravarLog
    Left = 376
    Top = 72
  end
  object fdRestaurante: TFDConnection
    Params.Strings = (
      'Database=C:\bancos\nozu\abril 2019\restaurante.FDB'
      'User_Name=SYSDBA'
      'DriverID=FB'
      'Password=masterkey')
    LoginPrompt = False
    Left = 1248
    Top = 16
  end
  object FDPhysFBDriverLink1: TFDPhysFBDriverLink
    Left = 1312
    Top = 16
  end
  object IdThreadComponent1: TIdThreadComponent
    Active = False
    Loop = False
    Priority = tpNormal
    StopMode = smTerminate
    OnBeforeRun = IdThreadComponent1BeforeRun
    OnRun = IdThreadComponent1Run
    OnTerminate = IdThreadComponent1Terminate
    Left = 104
    Top = 88
  end
  object qryVendasCanceladas: TIBQuery
    Database = dbrestaurante
    Transaction = transLog
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      ''
      ''
      ''
      
        ' select v.cod_venda,v.cod_empresa, v.data, v.data_so, v.data_hor' +
        'a_cancelamento,'
      '        v.valor_total,v.cod_usuario_cancelamento,'
      
        '        v.modelo_comprovante,v.chave_nfce, v.serie_nfce, v.numer' +
        'o_nfce, v.xml_doc'
      '          from  vendas_canceladas v ')
    UpdateObject = updVendasCanceladas
    Left = 576
    Top = 304
    object qryVendasCanceladasCOD_VENDA: TIBStringField
      FieldName = 'COD_VENDA'
      Origin = '"VENDAS_CANCELADAS"."COD_VENDA"'
      Required = True
      Size = 8
    end
    object qryVendasCanceladasCOD_EMPRESA: TIBStringField
      FieldName = 'COD_EMPRESA'
      Origin = '"VENDAS_CANCELADAS"."COD_EMPRESA"'
      Required = True
      Size = 4
    end
    object qryVendasCanceladasDATA: TDateField
      FieldName = 'DATA'
      Origin = '"VENDAS_CANCELADAS"."DATA"'
    end
    object qryVendasCanceladasDATA_SO: TDateField
      FieldName = 'DATA_SO'
      Origin = '"VENDAS_CANCELADAS"."DATA_SO"'
    end
    object qryVendasCanceladasDATA_HORA_CANCELAMENTO: TDateTimeField
      FieldName = 'DATA_HORA_CANCELAMENTO'
      Origin = '"VENDAS_CANCELADAS"."DATA_HORA_CANCELAMENTO"'
    end
    object qryVendasCanceladasMODELO_COMPROVANTE: TSmallintField
      FieldName = 'MODELO_COMPROVANTE'
      Origin = '"VENDAS_CANCELADAS"."MODELO_COMPROVANTE"'
    end
    object qryVendasCanceladasSERIE_NFCE: TSmallintField
      FieldName = 'SERIE_NFCE'
      Origin = '"VENDAS_CANCELADAS"."SERIE_NFCE"'
    end
    object qryVendasCanceladasNUMERO_NFCE: TIntegerField
      FieldName = 'NUMERO_NFCE'
      Origin = '"VENDAS_CANCELADAS"."NUMERO_NFCE"'
    end
    object qryVendasCanceladasXML_DOC: TWideMemoField
      FieldName = 'XML_DOC'
      Origin = '"VENDAS_CANCELADAS"."XML_DOC"'
      ProviderFlags = [pfInUpdate]
      BlobType = ftWideMemo
      Size = 8
    end
    object qryVendasCanceladasVALOR_TOTAL: TIBBCDField
      FieldName = 'VALOR_TOTAL'
      Origin = '"VENDAS_CANCELADAS"."VALOR_TOTAL"'
      Precision = 18
      Size = 2
    end
    object qryVendasCanceladasCOD_USUARIO_CANCELAMENTO: TIBStringField
      FieldName = 'COD_USUARIO_CANCELAMENTO'
      Origin = '"VENDAS_CANCELADAS"."COD_USUARIO_CANCELAMENTO"'
      Size = 3
    end
    object qryVendasCanceladasCHAVE_NFCE: TIBStringField
      FieldName = 'CHAVE_NFCE'
      Origin = '"VENDAS_CANCELADAS"."CHAVE_NFCE"'
      Size = 50
    end
  end
  object updVendasCanceladas: TIBUpdateSQL
    RefreshSQL.Strings = (
      'Select *'
      'from vendas_canceladas '
      'where'
      '  COD_VENDA = :COD_VENDA and'
      '  COD_EMPRESA = :COD_EMPRESA')
    ModifySQL.Strings = (
      'update vendas_canceladas'
      'set'
      '  COD_VENDA = :COD_VENDA,'
      '  COD_EMPRESA = :COD_EMPRESA,'
      '  DATA = :DATA,'
      '  DATA_SO = :DATA_SO,'
      '  DATA_HORA_CANCELAMENTO = :DATA_HORA_CANCELAMENTO,'
      '  VALOR_TOTAL = :VALOR_TOTAL,'
      '  COD_USUARIO_CANCELAMENTO = :COD_USUARIO_CANCELAMENTO,'
      '  MODELO_COMPROVANTE = :MODELO_COMPROVANTE,'
      '  CHAVE_NFCE = :CHAVE_NFCE,'
      '  SERIE_NFCE = :SERIE_NFCE,'
      '  NUMERO_NFCE = :NUMERO_NFCE,'
      '  XML_DOC = :XML_DOC'
      'where'
      '  COD_VENDA = :OLD_COD_VENDA and'
      '  COD_EMPRESA = :OLD_COD_EMPRESA')
    InsertSQL.Strings = (
      'insert into vendas_canceladas'
      
        '  (COD_VENDA, COD_EMPRESA, DATA, DATA_SO, DATA_HORA_CANCELAMENTO' +
        ', VALOR_TOTAL, '
      
        '   COD_USUARIO_CANCELAMENTO, MODELO_COMPROVANTE, CHAVE_NFCE, SER' +
        'IE_NFCE, '
      '   NUMERO_NFCE, XML_DOC)'
      'values'
      
        '  (:COD_VENDA, :COD_EMPRESA, :DATA, :DATA_SO, :DATA_HORA_CANCELA' +
        'MENTO, '
      
        '   :VALOR_TOTAL, :COD_USUARIO_CANCELAMENTO, :MODELO_COMPROVANTE,' +
        ' :CHAVE_NFCE, '
      '   :SERIE_NFCE, :NUMERO_NFCE, :XML_DOC)')
    DeleteSQL.Strings = (
      'delete from vendas_canceladas'
      'where'
      '  COD_VENDA = :OLD_COD_VENDA and'
      '  COD_EMPRESA = :OLD_COD_EMPRESA')
    Left = 608
    Top = 304
  end
  object ACBrNFeDANFCEFR1: TACBrNFeDANFCEFR
    Sistema = 
      'Sistema Real Manager - Vers'#227'o 5.01.1234  www.realsoftwares.com.b' +
      'r'
    MargemInferior = 0.800000000000000000
    MargemSuperior = 0.800000000000000000
    MargemEsquerda = 0.600000000000000000
    MargemDireita = 0.510000000000000000
    CasasDecimais.Formato = tdetInteger
    CasasDecimais.qCom = 2
    CasasDecimais.vUnCom = 2
    CasasDecimais.MaskqCom = ',0.00'
    CasasDecimais.MaskvUnCom = ',0.00'
    ImprimeQRCodeLateral = True
    BorderIcon = [biSystemMenu, biMinimize, biMaximize]
    Left = 336
    Top = 112
  end
  object qryConsultaProdutos: TIBQuery
    Database = dbrestaurante
    Transaction = transacao
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      
        'Select cod_barras,descricao,valor_unitario,cod_grupo,cod_produto' +
        '  from produtos')
    Left = 496
    Top = 128
    object qryConsultaProdutosCOD_BARRAS: TIBStringField
      FieldName = 'COD_BARRAS'
      Origin = '"PRODUTOS"."COD_BARRAS"'
    end
    object qryConsultaProdutosDESCRICAO: TIBStringField
      FieldName = 'DESCRICAO'
      Origin = '"PRODUTOS"."DESCRICAO"'
      Required = True
      Size = 80
    end
    object qryConsultaProdutosVALOR_UNITARIO: TIBBCDField
      FieldName = 'VALOR_UNITARIO'
      Origin = '"PRODUTOS"."VALOR_UNITARIO"'
      Required = True
      Precision = 18
      Size = 2
    end
    object qryConsultaProdutosCOD_GRUPO: TIBStringField
      FieldName = 'COD_GRUPO'
      Origin = '"PRODUTOS"."COD_GRUPO"'
      Size = 6
    end
    object qryConsultaProdutosCOD_PRODUTO: TIBStringField
      FieldName = 'COD_PRODUTO'
      Origin = '"PRODUTOS"."COD_PRODUTO"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 5
    end
  end
  object dsConsultaProdutos: TDataSource
    DataSet = qryConsultaProdutos
    Left = 544
    Top = 120
  end
  object qryEstrutura: TIBQuery
    Database = dbrestaurante
    Transaction = transacao
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      ''
      'SELECT'
      '  RF.RDB$FIELD_NAME FIELD_NAME , F.RDB$FIELD_TYPE as tipo,'
      '  CASE F.RDB$FIELD_TYPE'
      '    WHEN 7 THEN'
      '      CASE F.RDB$FIELD_SUB_TYPE'
      '        WHEN 0 THEN '#39'SMALLINT'#39
      
        '        WHEN 1 THEN '#39'NUMERIC('#39' || F.RDB$FIELD_PRECISION || '#39', '#39' ' +
        '|| (-F.RDB$FIELD_SCALE) || '#39')'#39
      '        WHEN 2 THEN '#39'DECIMAL'#39
      '      END'
      '    WHEN 8 THEN'
      '      CASE F.RDB$FIELD_SUB_TYPE'
      '        WHEN 0 THEN '#39'INTEGER'#39
      
        '        WHEN 1 THEN '#39'NUMERIC('#39'  || F.RDB$FIELD_PRECISION || '#39', '#39 +
        ' || (-F.RDB$FIELD_SCALE) || '#39')'#39
      '        WHEN 2 THEN '#39'DECIMAL'#39
      '      END'
      '    WHEN 9 THEN '#39'QUAD'#39
      '    WHEN 10 THEN '#39'FLOAT'#39
      '    WHEN 12 THEN '#39'DATE'#39
      '    WHEN 13 THEN '#39'TIME'#39
      
        '    WHEN 14 THEN '#39'CHAR('#39' || (TRUNC(F.RDB$FIELD_LENGTH / CH.RDB$B' +
        'YTES_PER_CHARACTER)) || '#39') '#39
      '    WHEN 16 THEN'
      '      CASE F.RDB$FIELD_SUB_TYPE'
      '        WHEN 0 THEN '#39'BIGINT'#39
      
        '        WHEN 1 THEN '#39'NUMERIC('#39' || F.RDB$FIELD_PRECISION || '#39', '#39' ' +
        '|| (-F.RDB$FIELD_SCALE) || '#39')'#39
      '        WHEN 2 THEN '#39'DECIMAL'#39
      '      END'
      '    WHEN 27 THEN '#39'DOUBLE'#39
      '    WHEN 35 THEN '#39'TIMESTAMP'#39
      
        '    WHEN 37 THEN '#39'VARCHAR('#39' || (TRUNC(F.RDB$FIELD_LENGTH / CH.RD' +
        'B$BYTES_PER_CHARACTER)) || '#39')'#39
      
        '    WHEN 40 THEN '#39'CSTRING'#39' || (TRUNC(F.RDB$FIELD_LENGTH / CH.RDB' +
        '$BYTES_PER_CHARACTER)) || '#39')'#39
      '    WHEN 45 THEN '#39'BLOB_ID'#39
      '    WHEN 261 THEN '#39'BLOB SUB_TYPE '#39' || F.RDB$FIELD_SUB_TYPE'
      '    ELSE '#39'RDB$FIELD_TYPE: '#39' || F.RDB$FIELD_TYPE || '#39'?'#39
      '  END FIELD_TYPE,'
      
        '  IIF(COALESCE(RF.RDB$NULL_FLAG, 0) = 0, NULL, '#39'NOT NULL'#39') FIELD' +
        '_NULL,'
      '  CH.RDB$CHARACTER_SET_NAME FIELD_CHARSET,'
      '  DCO.RDB$COLLATION_NAME FIELD_COLLATION,'
      
        '  COALESCE(RF.RDB$DEFAULT_SOURCE, F.RDB$DEFAULT_SOURCE) FIELD_DE' +
        'FAULT,'
      '  F.RDB$VALIDATION_SOURCE FIELD_CHECK,'
      '  RF.RDB$DESCRIPTION FIELD_DESCRIPTION'
      'FROM RDB$RELATION_FIELDS RF'
      'JOIN RDB$FIELDS F ON (F.RDB$FIELD_NAME = RF.RDB$FIELD_SOURCE)'
      
        'LEFT OUTER JOIN RDB$CHARACTER_SETS CH ON (CH.RDB$CHARACTER_SET_I' +
        'D = F.RDB$CHARACTER_SET_ID)'
      
        'LEFT OUTER JOIN RDB$COLLATIONS DCO ON ((DCO.RDB$COLLATION_ID = F' +
        '.RDB$COLLATION_ID) AND (DCO.RDB$CHARACTER_SET_ID = F.RDB$CHARACT' +
        'ER_SET_ID))'
      
        'WHERE (RF.RDB$RELATION_NAME = :TABLE_NAME) AND (COALESCE(RF.RDB$' +
        'SYSTEM_FLAG, 0) = 0)'
      'ORDER BY RF.RDB$FIELD_POSITION')
    Filtered = True
    Left = 1408
    Top = 280
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'TABLE_NAME'
        ParamType = ptUnknown
      end>
  end
  object ExeInfo1: TExeInfo
    Version = '1.3.3.0'
    Left = 1328
    Top = 136
  end
end
