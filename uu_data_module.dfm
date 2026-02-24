object dm: Tdm
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Height = 930
  Width = 1745
  object dbrestaurante: TIBDatabase
    DatabaseName = 'H:\Bancos\mana porto\OUTUBRO 2024\restaurante.FDB'
    Params.Strings = (
      'user_name=SYSDBA'
      'password=masterkey'
      'lc_ctype=WIN1252 ')
    LoginPrompt = False
    DefaultTransaction = transacao
    ServerType = 'IBServer'
    AllowStreamedConnected = False
    OnIdleTimer = dbrestauranteIdleTimer
    Left = 656
    Top = 560
  end
  object transacao: TIBTransaction
    DefaultDatabase = dbrestaurante
    Params.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    Left = 1040
    Top = 696
  end
  object qryauxiliar: TIBQuery
    Database = dbrestaurante
    Transaction = transacao
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      ' select cod_produto, descricao from produtos')
    Filtered = True
    PrecommittedReads = False
    Left = 656
    Top = 696
  end
  object dsqryauxiliar: TDataSource
    DataSet = qryauxiliar
    Left = 144
    Top = 492
  end
  object qrymax: TIBQuery
    Database = dbrestaurante
    Transaction = transacao
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    PrecommittedReads = False
    Left = 784
    Top = 968
  end
  object qryauxiliar2: TIBQuery
    Database = dbrestaurante
    Transaction = transacao
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      'select * from composicoes_produto')
    PrecommittedReads = False
    Left = 656
    Top = 764
  end
  object dsqryauxiliar2: TDataSource
    DataSet = qryauxiliar2
    Left = 144
    Top = 560
  end
  object qryauxiliar3: TIBQuery
    Database = dbrestaurante
    Transaction = transacao
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    PrecommittedReads = False
    Left = 656
    Top = 832
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
    Left = 1296
    Top = 1036
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
    object composicoes_tempquantidade: TFloatField
      FieldName = 'quantidade'
    end
  end
  object ds_composicoes_temp: TDataSource
    DataSet = composicoes_temp
    Left = 400
    Top = 1172
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
    PrecommittedReads = False
    Left = 912
    Top = 832
  end
  object ds_qry_consultas: TDataSource
    DataSet = qry_consultas
    Left = 528
    Top = 16
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
    Left = 1296
    Top = 1172
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
    Left = 1296
    Top = 1240
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
    Left = 144
    Top = 628
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
    PrecommittedReads = False
    UniDirectional = False
    Left = 1040
    Top = 628
  end
  object dsusuarios: TDataSource
    DataSet = tb_usuarios
    Left = 400
    Top = 968
  end
  object ac_recebimentos_temp: TRxMemoryData
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
    Left = 1296
    Top = 968
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
    Left = 1296
    Top = 1104
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
    Left = 400
    Top = 1308
  end
  object ds_tabmemoria: TDataSource
    Left = 528
    Top = 628
  end
  object ds_acompanhamentos_temp: TDataSource
    Left = 400
    Top = 1036
  end
  object proc_abate_estoque: TIBStoredProc
    Database = dbrestaurante
    Transaction = transacaoProcedure
    StoredProcName = 'ABATE_ESTOQUE'
    Left = 1040
    Top = 424
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
    Left = 528
    Top = 696
  end
  object transLog: TIBTransaction
    DefaultDatabase = dbrestaurante
    Params.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    Left = 1040
    Top = 900
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
    PrecommittedReads = False
    Left = 1040
    Top = 16
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
    Left = 528
    Top = 492
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
    Left = 1296
    Top = 288
  end
  object qry_lanc_caixa: TIBQuery
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    PrecommittedReads = False
    Left = 1040
    Top = 84
  end
  object qry_fornecedores: TIBQuery
    Database = dbrestaurante
    Transaction = transacao
    BufferChunks = 1000
    CachedUpdates = False
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
    PrecommittedReads = False
    Left = 912
    Top = 1104
    object qry_fornecedoresCOD_FORNECEDOR: TIBStringField
      FieldName = 'COD_FORNECEDOR'
      Origin = 'FORNECEDOR.COD_FORNECEDOR'
      Required = True
      Size = 4
    end
    object qry_fornecedoresBAIRRO: TIBStringField
      DisplayWidth = 100
      FieldName = 'BAIRRO'
      Origin = 'FORNECEDOR.BAIRRO'
      Size = 100
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
      Size = 150
    end
    object qry_fornecedoresNOME_FANTASIA: TIBStringField
      DisplayWidth = 150
      FieldName = 'NOME_FANTASIA'
      Origin = 'FORNECEDOR.NOME_FANTASIA'
      Size = 150
    end
    object qry_fornecedoresNUM_ENDERECO: TIBStringField
      DisplayWidth = 20
      FieldName = 'NUM_ENDERECO'
      Origin = 'FORNECEDOR.NUM_ENDERECO'
    end
    object qry_fornecedoresCOMPLEMENTO: TIBStringField
      DisplayWidth = 100
      FieldName = 'COMPLEMENTO'
      Origin = 'FORNECEDOR.COMPLEMENTO'
      Size = 100
    end
    object qry_fornecedoresENDERECO: TIBStringField
      FieldName = 'ENDERECO'
      Origin = '"FORNECEDOR"."ENDERECO"'
      Size = 150
    end
    object qry_fornecedoresCOD_PAIS: TIBStringField
      FieldName = 'COD_PAIS'
      Origin = '"FORNECEDOR"."COD_PAIS"'
      Size = 4
    end
  end
  object ds_qry_fornecedores: TDataSource
    DataSet = qry_fornecedores
    Left = 528
    Top = 220
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
      '  COMPLEMENTO = :COMPLEMENTO,'
      '  COD_PAIS = :COD_PAIS'
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
      
        '   INSCRICAO_MUNICIPAL, COD_CIDADE, NUM_ENDERECO, COMPLEMENTO, C' +
        'OD_PAIS)'
      'values'
      
        '  (:COD_FORNECEDOR, :RAZAO_SOCIAL, :NOME_FANTASIA, :ENDERECO, :B' +
        'AIRRO, '
      
        '   :CEP, :TELEFONE, :FAX, :EMAIL, :ATUALIZA_CUSTO, :CGC_CPF, :IN' +
        'SCRICAO_ESTADUAL, '
      
        '   :CODIGO_REPRESENTANTE, :OBSERVACAO, :DATA_CADASTRO, :DATA_ULT' +
        'IMA_COMPRA, '
      
        '   :CONTATO, :COD_ESTADO, :INSCRICAO_MUNICIPAL, :COD_CIDADE, :NU' +
        'M_ENDERECO, '
      '   :COMPLEMENTO, :COD_PAIS)')
    DeleteSQL.Strings = (
      'delete from fornecedor'
      'where'
      '  COD_FORNECEDOR = :OLD_COD_FORNECEDOR')
    Left = 1296
    Top = 84
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
    PrecommittedReads = False
    Left = 912
    Top = 1308
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
    Left = 528
    Top = 424
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
    Left = 1296
    Top = 220
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
    PrecommittedReads = False
    Left = 912
    Top = 1240
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
    Left = 1296
    Top = 152
  end
  object ds_qry_grupos: TDataSource
    DataSet = qry_grupos
    Left = 528
    Top = 356
  end
  object ds_qry_garcons: TDataSource
    DataSet = qry_garcons
    Left = 528
    Top = 288
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
    PrecommittedReads = False
    Left = 912
    Top = 1172
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
    Left = 1296
    Top = 424
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
    PrecommittedReads = False
    Left = 912
    Top = 1036
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
    Left = 1296
    Top = 16
  end
  object ds_qry_formas_pagto: TDataSource
    DataSet = qry_formas_pagto
    Left = 528
    Top = 152
  end
  object ds_clientes: TDataSource
    DataSet = qry_clientes
    Left = 400
    Top = 1104
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
    PrecommittedReads = False
    Left = 912
    Top = 764
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
    Left = 1168
    Top = 1172
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
    PrecommittedReads = False
    Left = 912
    Top = 968
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
    Left = 1168
    Top = 1308
  end
  object qry_remota: TIBQuery
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    PrecommittedReads = False
    Left = 1040
    Top = 152
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
      end
      item
        Name = 'valorFrete'
        DataType = ftCurrency
      end
      item
        Name = 'valorSeguro'
        DataType = ftCurrency
      end
      item
        Name = 'valorFCP'
        DataType = ftCurrency
      end
      item
        Name = 'valorFCPST'
        DataType = ftCurrency
      end
      item
        Name = 'valorImpostoImportacao'
        DataType = ftCurrency
      end
      item
        Name = 'ValorCustoReal'
        DataType = ftCurrency
      end>
    OnCalcFields = tbComprasTempCalcFields
    Left = 1296
    Top = 1308
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
    object tbComprasTempvalorFrete: TCurrencyField
      FieldName = 'valorFrete'
    end
    object tbComprasTempvalorSeguro: TCurrencyField
      FieldName = 'valorSeguro'
    end
    object tbComprasTempvalorFCP: TCurrencyField
      FieldName = 'valorFCP'
    end
    object tbComprasTempvalorFCPST: TCurrencyField
      FieldName = 'valorFCPST'
    end
    object tbComprasTempvalorImpostoImportacao: TCurrencyField
      FieldName = 'valorImpostoImportacao'
    end
    object tbComprasTempValorCustoReal: TCurrencyField
      FieldName = 'ValorCustoReal'
    end
    object tbComprasTempvalorTotal: TCurrencyField
      FieldKind = fkCalculated
      FieldName = 'valorTotal'
      Calculated = True
    end
  end
  object dsComprasTemp: TDataSource
    DataSet = tbComprasTemp
    Left = 16
    Top = 1036
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
        ')'
      ' where e.cod_entrada ='#39'#'#39)
    UpdateObject = upd_entradas
    PrecommittedReads = False
    Left = 912
    Top = 900
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
    object qry_entradasCOD_EMPRESA: TIBStringField
      FieldName = 'COD_EMPRESA'
      Origin = '"ENTRADAS"."COD_EMPRESA"'
      Size = 4
    end
  end
  object ds_entradas: TDataSource
    DataSet = qry_entradas
    Left = 400
    Top = 1240
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
      '  INFORMACOES_FISCO = :INFORMACOES_FISCO,'
      '  COD_EMPRESA = :COD_EMPRESA'
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
      '   INFORMACOES_FISCO, COD_EMPRESA)'
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
      
        '   :INFORMACOES_COMPLEMENTARES, :INFORMACOES_FISCO, :COD_EMPRESA' +
        ')')
    DeleteSQL.Strings = (
      'delete from entradas'
      'where'
      '  COD_ENTRADA = :OLD_COD_ENTRADA')
    Left = 1168
    Top = 1240
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
    PrecommittedReads = False
    Left = 912
    Top = 288
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
    Left = 272
    Top = 1240
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
    Left = 1168
    Top = 696
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
    Left = 1424
    Top = 152
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
    Left = 400
    Top = 424
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
    PrecommittedReads = False
    Left = 656
    Top = 628
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
    Left = 1040
    Top = 1240
  end
  object dsQryAliquotas: TDataSource
    DataSet = qryAliquotas
    Left = 144
    Top = 424
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
    PrecommittedReads = False
    Left = 784
    Top = 424
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
    Left = 1168
    Top = 220
  end
  object dsQryECFS: TDataSource
    DataSet = qryECFS
    Left = 272
    Top = 84
  end
  object transacaoProcedure: TIBTransaction
    DefaultDatabase = dbrestaurante
    Left = 1040
    Top = 832
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
    PrecommittedReads = False
    Left = 912
    Top = 628
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
    Left = 400
    Top = 288
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
    Left = 1168
    Top = 900
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
    PrecommittedReads = False
    Left = 912
    Top = 560
  end
  object dsTrasnferenciasEstoque: TDataSource
    DataSet = qryTrasnferenciasEstoque
    Left = 400
    Top = 900
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
    Left = 1168
    Top = 1036
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
    PrecommittedReads = False
    Left = 784
    Top = 16
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
    Left = 1168
    Top = 84
  end
  object dsQryConsultaFaturas: TDataSource
    DataSet = qryConsultaFaturas
    Left = 144
    Top = 1104
  end
  object ds_qry_faturas: TDataSource
    DataSet = qry_faturas
    Left = 528
    Top = 84
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
    PrecommittedReads = False
    Left = 656
    Top = 1104
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
    Left = 144
    Top = 900
  end
  object transacaoAuxiliar: TIBTransaction
    DefaultDatabase = dbrestaurante
    Left = 1040
    Top = 764
  end
  object procProcessaCaixa: TIBStoredProc
    Database = dbrestaurante
    Transaction = transacao
    ForcedRefresh = True
    StoredProcName = 'PROCESSACAIXA'
    Left = 1040
    Top = 356
    ParamData = <
      item
        DataType = ftString
        Name = 'NUMERO_CAIXA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'COD_EMPRESA'
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
    PrecommittedReads = False
    Left = 656
    Top = 1036
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
    object qryClientesDeliveryCOMPLEMENTO: TIBStringField
      FieldName = 'COMPLEMENTO'
      Origin = '"CLIENTES_DELIVERY"."COMPLEMENTO"'
      Size = 300
    end
    object qryClientesDeliveryREFERENCIA1: TIBStringField
      FieldName = 'REFERENCIA1'
      Origin = '"CLIENTES_DELIVERY"."REFERENCIA1"'
      Size = 200
    end
    object qryClientesDeliveryREFERENCIA2: TIBStringField
      FieldName = 'REFERENCIA2'
      Origin = '"CLIENTES_DELIVERY"."REFERENCIA2"'
      Size = 200
    end
    object qryClientesDeliveryDATA_CADASTRO: TDateField
      FieldName = 'DATA_CADASTRO'
      Origin = '"CLIENTES_DELIVERY"."DATA_CADASTRO"'
    end
  end
  object dsQryClientesDelivery: TDataSource
    DataSet = qryClientesDelivery
    Left = 144
    Top = 832
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
    Left = 1040
    Top = 968
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
    PrecommittedReads = False
    Left = 656
    Top = 900
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
      '  TXENTREGA = :TXENTREGA,'
      '  COMISSAO = :COMISSAO'
      'where'
      '  CODIGO = :OLD_CODIGO')
    InsertSQL.Strings = (
      'insert into bairro'
      '  (CODIGO, DESCRICAO, TXENTREGA, COMISSAO)'
      'values'
      '  (:CODIGO, :DESCRICAO, :TXENTREGA, :COMISSAO)')
    DeleteSQL.Strings = (
      'delete from bairro'
      'where'
      '  CODIGO = :OLD_CODIGO')
    Left = 1040
    Top = 1308
  end
  object dsQryBairro: TDataSource
    DataSet = qryBairro
    Left = 144
    Top = 696
  end
  object qryProdutos: TIBQuery
    Database = dbrestaurante
    Transaction = transacao
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      'select * from r_informacoes_produto ')
    PrecommittedReads = False
    Left = 912
    Top = 16
  end
  object dsQryProdutos: TDataSource
    DataSet = qryProdutos
    Left = 272
    Top = 968
  end
  object qryConferenciaCaixa: TIBQuery
    Database = dbrestaurante
    Transaction = transacao
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      'select * from caixas')
    PrecommittedReads = False
    Left = 656
    Top = 1240
  end
  object dsQryConferenciaCaixa: TDataSource
    DataSet = qryConferenciaCaixa
    Left = 144
    Top = 1036
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
    PrecommittedReads = False
    Left = 912
    Top = 492
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
    Left = 1296
    Top = 356
  end
  object dsQryTiposSangria: TDataSource
    DataSet = qryTiposSangria
    Left = 400
    Top = 152
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
    PrecommittedReads = False
    Left = 784
    Top = 1036
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
    Left = 272
    Top = 492
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
    Left = 1168
    Top = 424
  end
  object qryObservacoesPreparo: TIBQuery
    Database = dbrestaurante
    Transaction = transacao
    BufferChunks = 1000
    CachedUpdates = True
    ParamCheck = True
    SQL.Strings = (
      'select * from observacoes_padrao order by descricao')
    UpdateObject = updQryObservacoesPreparo
    PrecommittedReads = False
    Left = 784
    Top = 1308
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
    Left = 272
    Top = 900
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
    Left = 1168
    Top = 492
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
    PrecommittedReads = False
    Left = 912
    Top = 424
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
    Left = 400
    Top = 84
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
    Left = 1168
    Top = 832
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
    PrecommittedReads = False
    Left = 912
    Top = 356
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
    Left = 272
    Top = 1308
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
    Left = 1168
    Top = 968
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
    Left = 1424
    Top = 220
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
    Left = 400
    Top = 560
  end
  object dsQryUltimosPedidosDelivery: TDataSource
    Left = 400
    Top = 220
  end
  object dsQryItensUltimosPedidosDelivery: TDataSource
    Left = 272
    Top = 356
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
    PrecommittedReads = False
    Left = 784
    Top = 492
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
    object qryEntregadoresSTATUS: TSmallintField
      FieldName = 'STATUS'
      Origin = '"ENTREGADORES"."STATUS"'
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
      '  VALOR_DIARIA = :VALOR_DIARIA,'
      '  STATUS = :STATUS'
      'where'
      '  CODIGO = :OLD_CODIGO')
    InsertSQL.Strings = (
      'insert into entregadores'
      
        '  (CODIGO, NOME_ENTREGADOR, PERC_COMISSAO_PEDIDO, COMISSAO_POR_P' +
        'EDIDO, '
      '   VALOR_DIARIA, STATUS)'
      'values'
      
        '  (:CODIGO, :NOME_ENTREGADOR, :PERC_COMISSAO_PEDIDO, :COMISSAO_P' +
        'OR_PEDIDO, '
      '   :VALOR_DIARIA, :STATUS)')
    DeleteSQL.Strings = (
      'delete from entregadores'
      'where'
      '  CODIGO = :OLD_CODIGO')
    Left = 1168
    Top = 288
  end
  object dsQryEntregadores: TDataSource
    DataSet = qryEntregadores
    Left = 272
    Top = 220
  end
  object dsQryObsClientesDelivery: TDataSource
    Left = 272
    Top = 832
  end
  object dsTbCartoes: TDataSource
    DataSet = tbCartoes
    Left = 400
    Top = 696
  end
  object proc_abate_submateria: TIBStoredProc
    Database = dbrestaurante
    Transaction = transacaoProcedure
    StoredProcName = 'ABATE_SUBMATERIA'
    Left = 1040
    Top = 492
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
    Left = 1168
    Top = 152
  end
  object dsQryCidade: TDataSource
    DataSet = qryCidade
    Left = 144
    Top = 764
  end
  object qryCidade: TIBQuery
    Database = dbrestaurante
    Transaction = transacao
    BufferChunks = 1000
    CachedUpdates = True
    ParamCheck = True
    SQL.Strings = (
      ''
      ''
      ''
      ''
      ''
      ''
      
        '  select c.cod_cidade, c.nome, e.sigla UF, e.nome as estado  fro' +
        'm cidade c'
      '      inner join estado e on (e.codigo = c.codigo_estado)'
      '       order by c.nome '
      ''
      '')
    PrecommittedReads = False
    Left = 656
    Top = 968
    object qryCidadeCOD_CIDADE: TIBStringField
      FieldName = 'COD_CIDADE'
      Origin = '"CIDADE"."COD_CIDADE"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 7
    end
    object qryCidadeNOME: TIBStringField
      FieldName = 'NOME'
      Origin = '"CIDADE"."NOME"'
      Size = 50
    end
    object qryCidadeUF: TIBStringField
      FieldName = 'UF'
      Origin = '"ESTADO"."SIGLA"'
      Required = True
      FixedChar = True
      Size = 2
    end
    object qryCidadeESTADO: TIBStringField
      FieldName = 'ESTADO'
      Origin = '"ESTADO"."NOME"'
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
    PrecommittedReads = False
    Left = 784
    Top = 1172
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
    Left = 1040
    Top = 1104
  end
  object dsQryNotasConsumidor: TDataSource
    DataSet = qryNotasConsumidor
    Left = 272
    Top = 696
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
    PrecommittedReads = False
    Left = 784
    Top = 1240
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
    Left = 1040
    Top = 1172
  end
  object dsQryNotasTransporte: TDataSource
    DataSet = qryNotasTransporte
    Left = 272
    Top = 764
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
    PrecommittedReads = False
    Left = 1040
    Top = 220
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
    Left = 1168
    Top = 764
  end
  object ds_qry_saidas: TDataSource
    DataSet = qry_saidas
    Left = 528
    Top = 560
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
    PrecommittedReads = False
    Left = 784
    Top = 152
  end
  object dsQryContasApagar: TDataSource
    DataSet = qryCsContasApagar
    Left = 144
    Top = 1172
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
        Attributes = [faRequired]
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
      end
      item
        Name = 'NUMERO_CARTA_CORRECAO_NFE'
        DataType = ftInteger
      end
      item
        Name = 'NUMERO_CARTA_CORRECAO_NFCE'
        DataType = ftInteger
      end
      item
        Name = 'PFX_CERTIFICADO'
        DataType = ftWideMemo
      end
      item
        Name = 'IMP_ENDERECO_CLIENTE_PRODUCAO'
        DataType = ftSmallint
      end
      item
        Name = 'MSG_DELIVERY_GD'
        DataType = ftSmallint
      end
      item
        Name = 'MSG_DELIVERY_DESTAQUE'
        DataType = ftSmallint
      end
      item
        Name = 'MSG_CONTA_GD'
        DataType = ftSmallint
      end
      item
        Name = 'MSG_CONTA_DESTAQUE'
        DataType = ftSmallint
      end
      item
        Name = 'LOGO_COMPROVANTES'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'TAB_PRECOS_DELIVERY'
        DataType = ftSmallint
      end
      item
        Name = 'COMPROVANTE_DELIVERY_AGRUPADO'
        DataType = ftSmallint
      end
      item
        Name = 'IDENTIFICA_CLIENTE_BALCAO'
        DataType = ftSmallint
      end
      item
        Name = 'TEMPO_PREP_DELIVERY'
        DataType = ftSmallint
      end
      item
        Name = 'IMPRIME_OBS_COMPROVANTE_DELIV'
        DataType = ftSmallint
      end
      item
        Name = 'ULT_NSU_CTE'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'INTEGRACAO_PLATAFORMAS'
        DataType = ftSmallint
      end
      item
        Name = 'DESCRICAO_EMPRESA'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'IMP_DADOS_PLATAFORMA_COMP_DELIV'
        DataType = ftSmallint
      end
      item
        Name = 'IMP_DADOS_PLATAFORMA_PRODUCAO'
        DataType = ftSmallint
      end
      item
        Name = 'REGISTRA_ENTREGA_IFOOD'
        DataType = ftSmallint
      end
      item
        Name = 'ULTIMA_CONSULTA_DFE'
        DataType = ftDateTime
      end
      item
        Name = 'INF_COMP_NFE'
        DataType = ftWideMemo
      end
      item
        Name = 'ID_UF'
        DataType = ftSmallint
      end>
    IndexDefs = <
      item
        Name = 'PK_PARAMETROS'
        Fields = 'COD_EMPRESA'
        Options = [ixUnique]
      end>
    StoreDefs = True
    TableName = 'PARAMETROS'
    PrecommittedReads = False
    UniDirectional = False
    Left = 1040
    Top = 560
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
    object tb_parametrosNUMERO_CARTA_CORRECAO_NFE: TIntegerField
      FieldName = 'NUMERO_CARTA_CORRECAO_NFE'
    end
    object tb_parametrosNUMERO_CARTA_CORRECAO_NFCE: TIntegerField
      FieldName = 'NUMERO_CARTA_CORRECAO_NFCE'
    end
    object tb_parametrosPFX_CERTIFICADO: TWideMemoField
      FieldName = 'PFX_CERTIFICADO'
      BlobType = ftWideMemo
      Size = 8
    end
    object tb_parametrosIMP_ENDERECO_CLIENTE_PRODUCAO: TSmallintField
      FieldName = 'IMP_ENDERECO_CLIENTE_PRODUCAO'
    end
    object tb_parametrosMSG_DELIVERY_GD: TSmallintField
      FieldName = 'MSG_DELIVERY_GD'
    end
    object tb_parametrosMSG_DELIVERY_DESTAQUE: TSmallintField
      FieldName = 'MSG_DELIVERY_DESTAQUE'
    end
    object tb_parametrosMSG_CONTA_GD: TSmallintField
      FieldName = 'MSG_CONTA_GD'
    end
    object tb_parametrosMSG_CONTA_DESTAQUE: TSmallintField
      FieldName = 'MSG_CONTA_DESTAQUE'
    end
    object tb_parametrosLOGO_COMPROVANTES: TIBStringField
      FieldName = 'LOGO_COMPROVANTES'
      Size = 30
    end
    object tb_parametrosTAB_PRECOS_DELIVERY: TSmallintField
      FieldName = 'TAB_PRECOS_DELIVERY'
    end
    object tb_parametrosCOMPROVANTE_DELIVERY_AGRUPADO: TSmallintField
      FieldName = 'COMPROVANTE_DELIVERY_AGRUPADO'
    end
    object tb_parametrosIDENTIFICA_CLIENTE_BALCAO: TSmallintField
      FieldName = 'IDENTIFICA_CLIENTE_BALCAO'
    end
    object tb_parametrosTEMPO_PREP_DELIVERY: TSmallintField
      FieldName = 'TEMPO_PREP_DELIVERY'
    end
    object tb_parametrosIMPRIME_OBS_COMPROVANTE_DELIV: TSmallintField
      FieldName = 'IMPRIME_OBS_COMPROVANTE_DELIV'
    end
    object tb_parametrosULT_NSU_CTE: TIBStringField
      FieldName = 'ULT_NSU_CTE'
      Size = 15
    end
    object tb_parametrosINTEGRACAO_PLATAFORMAS: TSmallintField
      FieldName = 'INTEGRACAO_PLATAFORMAS'
    end
    object tb_parametrosDESCRICAO_EMPRESA: TIBStringField
      FieldName = 'DESCRICAO_EMPRESA'
      Size = 100
    end
    object tb_parametrosIMP_DADOS_PLATAFORMA_COMP_DELIV: TSmallintField
      FieldName = 'IMP_DADOS_PLATAFORMA_COMP_DELIV'
    end
    object tb_parametrosIMP_DADOS_PLATAFORMA_PRODUCAO: TSmallintField
      FieldName = 'IMP_DADOS_PLATAFORMA_PRODUCAO'
    end
    object tb_parametrosREGISTRA_ENTREGA_IFOOD: TSmallintField
      FieldName = 'REGISTRA_ENTREGA_IFOOD'
    end
    object tb_parametrosULTIMA_CONSULTA_DFE: TDateTimeField
      FieldName = 'ULTIMA_CONSULTA_DFE'
    end
    object tb_parametrosINF_COMP_NFE: TWideMemoField
      FieldName = 'INF_COMP_NFE'
      BlobType = ftWideMemo
      Size = 8
    end
    object tb_parametrosID_UF: TSmallintField
      FieldName = 'ID_UF'
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
    PrecommittedReads = False
    Left = 912
    Top = 220
  end
  object dsQryPromoters: TDataSource
    DataSet = qryPromoters
    Left = 272
    Top = 1172
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
    PrecommittedReads = False
    Left = 784
    Top = 356
  end
  object dsQryCsSaboresPizza: TDataSource
    DataSet = qryCsSaboresPizza
    Left = 272
    Top = 16
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
    PrecommittedReads = False
    Left = 784
    Top = 220
  end
  object dsQryCsObservacoes: TDataSource
    DataSet = qryCsObservacoes
    Left = 144
    Top = 1240
  end
  object tbObservacoesTemp: TRxMemoryData
    FieldDefs = <
      item
        Name = 'descricao'
        DataType = ftString
        Size = 25
      end>
    Left = 1424
    Top = 84
    object tbObservacoesTempdescricao: TStringField
      FieldName = 'descricao'
      Size = 25
    end
  end
  object dsObervacoesTemp: TDataSource
    DataSet = tbObservacoesTemp
    Left = 144
    Top = 220
  end
  object dsGuarnicoesTemp: TDataSource
    Left = 16
    Top = 1308
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
    PrecommittedReads = False
    Left = 784
    Top = 696
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
    Left = 16
    Top = 1240
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
    Left = 1040
    Top = 1036
  end
  object qryMapaMesasSalao: TIBQuery
    Database = dbrestaurante
    Transaction = transacao
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    Filtered = True
    PrecommittedReads = False
    Left = 784
    Top = 900
  end
  object dsMapaMesasSalao: TDataSource
    DataSet = qryMapaMesasSalao
    Left = 144
    Top = 152
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
    PrecommittedReads = False
    Left = 912
    Top = 152
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
    Left = 144
    Top = 356
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
    Left = 1168
    Top = 628
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
    PrecommittedReads = False
    Left = 912
    Top = 84
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
    Left = 272
    Top = 1104
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
    Left = 1168
    Top = 560
  end
  object qryComparaProdutosNFE: TIBQuery
    Database = dbrestaurante
    Transaction = transacao
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      
        'select cp.*, p.descricao, f.razao_social, u.descricao as descric' +
        'ao_unidade, g.cod_grupo, coalesce(g.descricao, '#39'N'#195'O ASSOCIADO'#39') ' +
        'as grupo_associado   from compara_produtos_nfe cp'
      
        '  left join produtos p on (p.cod_produto  = cp.cod_produto_inter' +
        'no)   '
      '  left join unidades u on (u.cod_unidade = p.unidade_entrada)'
      '  left join grupos g on (g.cod_grupo = p.cod_grupo)'
      '  inner join fornecedor f on (f.cgc_cpf = cp.cnpj_fornecedor) '
      ' where cp.cod_prod_fornecedor is not null'
      ' and cp.cod_prod_fornecedor is not null'
      ' and ( cp.descricao_fornecedor  like '#39'%CAMAR%'#39' '
      ' or p.descricao like '#39'%CAMAR%'#39' ) '
      ' order by cp.descricao_fornecedor'
      '')
    PrecommittedReads = False
    Left = 656
    Top = 1172
    object qryComparaProdutosNFECNPJ_FORNECEDOR: TIBStringField
      FieldName = 'CNPJ_FORNECEDOR'
      Origin = '"COMPARA_PRODUTOS_NFE"."CNPJ_FORNECEDOR"'
      Required = True
      Size = 14
    end
    object qryComparaProdutosNFECOD_PROD_FORNECEDOR: TIBStringField
      FieldName = 'COD_PROD_FORNECEDOR'
      Origin = '"COMPARA_PRODUTOS_NFE"."COD_PROD_FORNECEDOR"'
      Required = True
      Size = 25
    end
    object qryComparaProdutosNFECOD_PRODUTO_INTERNO: TIBStringField
      FieldName = 'COD_PRODUTO_INTERNO'
      Origin = '"COMPARA_PRODUTOS_NFE"."COD_PRODUTO_INTERNO"'
      Size = 5
    end
    object qryComparaProdutosNFECFOP_ENTRADA: TIBStringField
      FieldName = 'CFOP_ENTRADA'
      Origin = '"COMPARA_PRODUTOS_NFE"."CFOP_ENTRADA"'
      Size = 4
    end
    object qryComparaProdutosNFECST_ENTRADA: TIBStringField
      FieldName = 'CST_ENTRADA'
      Origin = '"COMPARA_PRODUTOS_NFE"."CST_ENTRADA"'
      Size = 3
    end
    object qryComparaProdutosNFEUNIDADE_ENTRADA: TIBStringField
      FieldName = 'UNIDADE_ENTRADA'
      Origin = '"COMPARA_PRODUTOS_NFE"."UNIDADE_ENTRADA"'
      Size = 2
    end
    object qryComparaProdutosNFEFATOR_CONVERSAO: TIBBCDField
      FieldName = 'FATOR_CONVERSAO'
      Origin = '"COMPARA_PRODUTOS_NFE"."FATOR_CONVERSAO"'
      Precision = 18
      Size = 3
    end
    object qryComparaProdutosNFEOPERACAO: TSmallintField
      FieldName = 'OPERACAO'
      Origin = '"COMPARA_PRODUTOS_NFE"."OPERACAO"'
    end
    object qryComparaProdutosNFECFOP_FORNECEDOR: TIBStringField
      FieldName = 'CFOP_FORNECEDOR'
      Origin = '"COMPARA_PRODUTOS_NFE"."CFOP_FORNECEDOR"'
      Size = 4
    end
    object qryComparaProdutosNFECST_FORNECEDOR: TIBStringField
      FieldName = 'CST_FORNECEDOR'
      Origin = '"COMPARA_PRODUTOS_NFE"."CST_FORNECEDOR"'
      Size = 3
    end
    object qryComparaProdutosNFENCM: TIBStringField
      FieldName = 'NCM'
      Origin = '"COMPARA_PRODUTOS_NFE"."NCM"'
      Size = 10
    end
    object qryComparaProdutosNFEDESCRICAO_FORNECEDOR: TIBStringField
      FieldName = 'DESCRICAO_FORNECEDOR'
      Origin = '"COMPARA_PRODUTOS_NFE"."DESCRICAO_FORNECEDOR"'
      Size = 150
    end
    object qryComparaProdutosNFEUNIDADE_COMERCIALIZADA: TIBStringField
      FieldName = 'UNIDADE_COMERCIALIZADA'
      Origin = '"COMPARA_PRODUTOS_NFE"."UNIDADE_COMERCIALIZADA"'
      Size = 6
    end
    object qryComparaProdutosNFEULTIMA_CHAVE: TIBStringField
      FieldName = 'ULTIMA_CHAVE'
      Origin = '"COMPARA_PRODUTOS_NFE"."ULTIMA_CHAVE"'
      Size = 50
    end
    object qryComparaProdutosNFEDESCRICAO: TIBStringField
      FieldName = 'DESCRICAO'
      Origin = '"PRODUTOS"."DESCRICAO"'
      Size = 150
    end
    object qryComparaProdutosNFERAZAO_SOCIAL: TIBStringField
      FieldName = 'RAZAO_SOCIAL'
      Origin = '"FORNECEDOR"."RAZAO_SOCIAL"'
      Size = 150
    end
    object qryComparaProdutosNFEDESCRICAO_UNIDADE: TIBStringField
      FieldName = 'DESCRICAO_UNIDADE'
      Origin = '"UNIDADES"."DESCRICAO"'
      Size = 25
    end
    object qryComparaProdutosNFECOD_GRUPO: TIBStringField
      FieldName = 'COD_GRUPO'
      Origin = '"GRUPOS"."COD_GRUPO"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Size = 6
    end
    object qryComparaProdutosNFEGRUPO_ASSOCIADO: TIBStringField
      FieldName = 'GRUPO_ASSOCIADO'
      ProviderFlags = []
      ReadOnly = True
      Size = 30
    end
  end
  object dsQryComparaProdutosNFE: TDataSource
    DataSet = qryComparaProdutosNFE
    Left = 144
    Top = 968
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
    PrecommittedReads = False
    Left = 784
    Top = 288
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
    Left = 144
    Top = 1308
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
    Left = 1424
    Top = 16
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
    Left = 144
    Top = 84
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
    PrecommittedReads = False
    Left = 784
    Top = 832
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
    Left = 1168
    Top = 356
  end
  object dsQryLancamentosRD: TDataSource
    DataSet = qryLancamentosRD
    Left = 272
    Top = 424
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
    TipoCorte = ctParcial
    Left = 16
    Top = 764
  end
  object procGeraInutilizacoes: TIBStoredProc
    Database = dbrestaurante
    Transaction = transacao
    StoredProcName = 'GERA_INUTILIZACOES'
    Left = 1040
    Top = 288
  end
  object dsQryVendasCaixa: TDataSource
    DataSet = qryVendasCaixa
    Left = 400
    Top = 356
  end
  object JvVigenereCipher1: TJvVigenereCipher
    Left = 1296
    Top = 696
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
    Left = 16
    Top = 832
  end
  object extratoSat: TACBrSATExtratoESCPOS
    Sistema = 'Projeto ACBr - www.projetoacbr.com.br'
    Site = 'www.ciadochurrasco.com.br'
    MargemInferior = 0.800000000000000000
    MargemSuperior = 0.800000000000000000
    MargemEsquerda = 0.600000000000000000
    MargemDireita = 0.510000000000000000
    ExpandeLogoMarcaConfig.Altura = 0
    ExpandeLogoMarcaConfig.Esquerda = 0
    ExpandeLogoMarcaConfig.Topo = 0
    ExpandeLogoMarcaConfig.Largura = 0
    ExpandeLogoMarcaConfig.Dimensionar = False
    ExpandeLogoMarcaConfig.Esticar = True
    CasasDecimais.Formato = tdetInteger
    CasasDecimais.qCom = 2
    CasasDecimais.vUnCom = 2
    CasasDecimais.MaskqCom = ',0.00'
    CasasDecimais.MaskvUnCom = ',0.00'
    CasasDecimais.Aliquota = 2
    CasasDecimais.MaskAliquota = ',0.00'
    ACBrSAT = sat
    MsgAppQRCode = 
      'Consulte o QR Code pelo aplicativo  "De olho na nota", dispon'#237've' +
      'l na AppStore (Apple) e PlayStore (Android)'
    FormularioContinuo = True
    PosPrinter = ACBrPosPrinter1
    Left = 16
    Top = 900
  end
  object ACBrTEFD1: TACBrTEFD
    Identificacao.NomeAplicacao = 'Real Manager'
    Identificacao.VersaoAplicacao = '8.5.13'
    Identificacao.SoftwareHouse = 'Real Softwares'
    Identificacao.RazaoSocial = 'Jo'#227'o Marcos Santos da Silva ME'
    MultiplosCartoes = True
    NumeroMaximoCartoes = 5
    AutoFinalizarCupom = False
    ImprimirViaClienteReduzida = True
    EsperaSTS = 7
    CHQEmGerencial = True
    ConfirmarAntesDosComprovantes = True
    TEFPayGo.ArqTemp = 'C:\PAYGO\REQ\intpos.tmp'
    TEFPayGo.ArqReq = 'C:\PAYGO\REQ\intpos.001'
    TEFPayGo.ArqSTS = 'C:\PAYGO\RESP\intpos.sts'
    TEFPayGo.ArqResp = 'C:\PAYGO\RESP\intpos.001'
    TEFPayGoWeb.SuportaViasDiferenciadas = True
    TEFPayGoWeb.UtilizaSaldoTotalVoucher = False
    TEFPayGoWeb.ConfirmarTransacoesPendentes = True
    TEFPayGoWeb.PerguntarCartaoDigitadoAposCancelarLeitura = False
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
    TEFCliSiTefModular.ArqTemp = 'C:\Client\req\intpos.tmp'
    TEFCliSiTefModular.ArqReq = 'C:\Client\req\intpos.001'
    TEFCliSiTefModular.ArqSTS = 'C:\Client\resp\intpos.sts'
    TEFCliSiTefModular.ArqResp = 'C:\Client\resp\intpos.001'
    TEFCliSiTefModular.GPExeName = 'C:\Client\ClientSiTef.exe'
    TEFDirecao.ArqTemp = 'C:\TEF_DIAL\req\intpos.tmp'
    TEFDirecao.ArqReq = 'C:\TEF_DIAL\req\intpos.001'
    TEFDirecao.ArqSTS = 'C:\TEF_DIAL\resp\intpos.sts'
    TEFDirecao.ArqResp = 'C:\TEF_DIAL\resp\intpos.001'
    TEFDirecao.GPExeName = 'C:\DPOS8\Bin\GPDirecao.exe'
    TEFElgin.ArqTemp = 'C:\Cliente\req\intpos.tmp'
    TEFElgin.ArqReq = 'C:\Cliente\req\intpos.001'
    TEFElgin.ArqSTS = 'C:\Cliente\resp\intpos.sts'
    TEFElgin.ArqResp = 'C:\Cliente\resp\intpos.001'
    TEFElgin.GPExeName = 'C:\ELGIN\TEFPassivo\E1_TEFPay_Passivo.exe'
    OnExibeMsg = ACBrTEFD1ExibeMsg
    OnComandaECF = ACBrTEFD1ComandaECF
    OnComandaECFSubtotaliza = ACBrTEFD1ComandaECFSubtotaliza
    OnComandaECFPagamento = ACBrTEFD1ComandaECFPagamento
    OnComandaECFAbreVinculado = ACBrTEFD1ComandaECFAbreVinculado
    OnComandaECFImprimeVia = ACBrTEFD1ComandaECFImprimeVia
    OnInfoECF = ACBrTEFD1InfoECF
    OnAntesFinalizarRequisicao = ACBrTEFD1AntesFinalizarRequisicao
    OnGravarLog = ACBrTEFD1GravarLog
    Left = 16
    Top = 968
  end
  object fdRestaurante: TFDConnection
    Params.Strings = (
      'User_Name=SYSDBA'
      'Password=masterkey'
      'Server=localhost'
      'Port=3050'
      'Database=H:\Bancos\cia bsb\RESTAURANTE.FDB'
      'DriverID=FB')
    LoginPrompt = False
    Left = 528
    Top = 832
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
      'select * from vendas_canceladas')
    UpdateObject = updVendasCanceladas
    PrecommittedReads = False
    Left = 912
    Top = 696
    object qryVendasCanceladasCOD_VENDA: TIBStringField
      FieldName = 'COD_VENDA'
      Origin = '"VENDAS_CANCELADAS"."COD_VENDA"'
      Required = True
      Size = 8
    end
    object qryVendasCanceladasDATA: TDateField
      FieldName = 'DATA'
      Origin = '"VENDAS_CANCELADAS"."DATA"'
    end
    object qryVendasCanceladasHORA: TTimeField
      FieldName = 'HORA'
      Origin = '"VENDAS_CANCELADAS"."HORA"'
    end
    object qryVendasCanceladasDATA_SO: TDateField
      FieldName = 'DATA_SO'
      Origin = '"VENDAS_CANCELADAS"."DATA_SO"'
    end
    object qryVendasCanceladasDATA_ECF: TDateField
      FieldName = 'DATA_ECF'
      Origin = '"VENDAS_CANCELADAS"."DATA_ECF"'
    end
    object qryVendasCanceladasHORA_ECF: TTimeField
      FieldName = 'HORA_ECF'
      Origin = '"VENDAS_CANCELADAS"."HORA_ECF"'
    end
    object qryVendasCanceladasVALOR_BRUTO: TIBBCDField
      FieldName = 'VALOR_BRUTO'
      Origin = '"VENDAS_CANCELADAS"."VALOR_BRUTO"'
      Precision = 18
      Size = 2
    end
    object qryVendasCanceladasVALOR_DESCONTO: TIBBCDField
      FieldName = 'VALOR_DESCONTO'
      Origin = '"VENDAS_CANCELADAS"."VALOR_DESCONTO"'
      Precision = 18
      Size = 2
    end
    object qryVendasCanceladasVALOR_TXSERV: TIBBCDField
      FieldName = 'VALOR_TXSERV'
      Origin = '"VENDAS_CANCELADAS"."VALOR_TXSERV"'
      Precision = 18
      Size = 2
    end
    object qryVendasCanceladasVALOR_TOTAL: TIBBCDField
      FieldName = 'VALOR_TOTAL'
      Origin = '"VENDAS_CANCELADAS"."VALOR_TOTAL"'
      Precision = 18
      Size = 2
    end
    object qryVendasCanceladasTOTAL_PAGO: TIBBCDField
      FieldName = 'TOTAL_PAGO'
      Origin = '"VENDAS_CANCELADAS"."TOTAL_PAGO"'
      Precision = 18
      Size = 2
    end
    object qryVendasCanceladasVALOR_TROCO: TIBBCDField
      FieldName = 'VALOR_TROCO'
      Origin = '"VENDAS_CANCELADAS"."VALOR_TROCO"'
      Precision = 18
      Size = 2
    end
    object qryVendasCanceladasCOD_USUARIO: TIBStringField
      FieldName = 'COD_USUARIO'
      Origin = '"VENDAS_CANCELADAS"."COD_USUARIO"'
      Size = 3
    end
    object qryVendasCanceladasNUMERO_CAIXA: TIBStringField
      FieldName = 'NUMERO_CAIXA'
      Origin = '"VENDAS_CANCELADAS"."NUMERO_CAIXA"'
      Size = 3
    end
    object qryVendasCanceladasMESA: TIBStringField
      FieldName = 'MESA'
      Origin = '"VENDAS_CANCELADAS"."MESA"'
      Size = 4
    end
    object qryVendasCanceladasIMP: TSmallintField
      FieldName = 'IMP'
      Origin = '"VENDAS_CANCELADAS"."IMP"'
    end
    object qryVendasCanceladasCOD_CAIXA: TIBStringField
      FieldName = 'COD_CAIXA'
      Origin = '"VENDAS_CANCELADAS"."COD_CAIXA"'
      Size = 5
    end
    object qryVendasCanceladasTIPO_VENDA: TSmallintField
      FieldName = 'TIPO_VENDA'
      Origin = '"VENDAS_CANCELADAS"."TIPO_VENDA"'
    end
    object qryVendasCanceladasCOD_PEDIDO_DELIVERY: TIBStringField
      FieldName = 'COD_PEDIDO_DELIVERY'
      Origin = '"VENDAS_CANCELADAS"."COD_PEDIDO_DELIVERY"'
      Size = 8
    end
    object qryVendasCanceladasCOO_CUPOM: TIBStringField
      FieldName = 'COO_CUPOM'
      Origin = '"VENDAS_CANCELADAS"."COO_CUPOM"'
      Size = 15
    end
    object qryVendasCanceladasQTDE_PESSOAS: TSmallintField
      FieldName = 'QTDE_PESSOAS'
      Origin = '"VENDAS_CANCELADAS"."QTDE_PESSOAS"'
    end
    object qryVendasCanceladasVALOR_TX_ENTREGA: TIBBCDField
      FieldName = 'VALOR_TX_ENTREGA'
      Origin = '"VENDAS_CANCELADAS"."VALOR_TX_ENTREGA"'
      Precision = 18
      Size = 2
    end
    object qryVendasCanceladasREDUCAO_Z: TIntegerField
      FieldName = 'REDUCAO_Z'
      Origin = '"VENDAS_CANCELADAS"."REDUCAO_Z"'
    end
    object qryVendasCanceladasSELECIONADO: TSmallintField
      FieldName = 'SELECIONADO'
      Origin = '"VENDAS_CANCELADAS"."SELECIONADO"'
    end
    object qryVendasCanceladasDESCONTO_TAXAS: TFMTBCDField
      FieldName = 'DESCONTO_TAXAS'
      Origin = '"VENDAS_CANCELADAS"."DESCONTO_TAXAS"'
      Precision = 18
      Size = 10
    end
    object qryVendasCanceladasCHAVE_NFCE: TIBStringField
      FieldName = 'CHAVE_NFCE'
      Origin = '"VENDAS_CANCELADAS"."CHAVE_NFCE"'
      Size = 50
    end
    object qryVendasCanceladasNUMERO_NFCE: TIntegerField
      FieldName = 'NUMERO_NFCE'
      Origin = '"VENDAS_CANCELADAS"."NUMERO_NFCE"'
    end
    object qryVendasCanceladasSERIE_NFCE: TSmallintField
      FieldName = 'SERIE_NFCE'
      Origin = '"VENDAS_CANCELADAS"."SERIE_NFCE"'
    end
    object qryVendasCanceladasPROTOCOLO_NFCE: TIBStringField
      FieldName = 'PROTOCOLO_NFCE'
      Origin = '"VENDAS_CANCELADAS"."PROTOCOLO_NFCE"'
      Size = 25
    end
    object qryVendasCanceladasRECIBO_NFCE: TIBStringField
      FieldName = 'RECIBO_NFCE'
      Origin = '"VENDAS_CANCELADAS"."RECIBO_NFCE"'
      Size = 25
    end
    object qryVendasCanceladasOBS_NFCE: TIBStringField
      FieldName = 'OBS_NFCE'
      Origin = '"VENDAS_CANCELADAS"."OBS_NFCE"'
      Size = 300
    end
    object qryVendasCanceladasCONSULTA_OK: TSmallintField
      FieldName = 'CONSULTA_OK'
      Origin = '"VENDAS_CANCELADAS"."CONSULTA_OK"'
    end
    object qryVendasCanceladasCOD_EMPRESA: TIBStringField
      FieldName = 'COD_EMPRESA'
      Origin = '"VENDAS_CANCELADAS"."COD_EMPRESA"'
      Required = True
      Size = 4
    end
    object qryVendasCanceladasPERCENTUAL_DESCONTO: TFMTBCDField
      FieldName = 'PERCENTUAL_DESCONTO'
      Origin = '"VENDAS_CANCELADAS"."PERCENTUAL_DESCONTO"'
      Precision = 18
    end
    object qryVendasCanceladasLOTE_EXPORTACAO_WEB: TLargeintField
      FieldName = 'LOTE_EXPORTACAO_WEB'
      Origin = '"VENDAS_CANCELADAS"."LOTE_EXPORTACAO_WEB"'
    end
    object qryVendasCanceladasCOD_GARCON_ABRIU: TIBStringField
      FieldName = 'COD_GARCON_ABRIU'
      Origin = '"VENDAS_CANCELADAS"."COD_GARCON_ABRIU"'
      Size = 3
    end
    object qryVendasCanceladasMODELO_COMPROVANTE: TSmallintField
      FieldName = 'MODELO_COMPROVANTE'
      Origin = '"VENDAS_CANCELADAS"."MODELO_COMPROVANTE"'
    end
    object qryVendasCanceladasCOD_FORNECEDOR: TIBStringField
      FieldName = 'COD_FORNECEDOR'
      Origin = '"VENDAS_CANCELADAS"."COD_FORNECEDOR"'
      Size = 4
    end
    object qryVendasCanceladasSESSAO_SAT: TLargeintField
      FieldName = 'SESSAO_SAT'
      Origin = '"VENDAS_CANCELADAS"."SESSAO_SAT"'
    end
    object qryVendasCanceladasCNF_SAT: TLargeintField
      FieldName = 'CNF_SAT'
      Origin = '"VENDAS_CANCELADAS"."CNF_SAT"'
    end
    object qryVendasCanceladasXML_DOC: TWideMemoField
      FieldName = 'XML_DOC'
      Origin = '"VENDAS_CANCELADAS"."XML_DOC"'
      ProviderFlags = [pfInUpdate]
      BlobType = ftWideMemo
      Size = 8
    end
    object qryVendasCanceladasCNPJ_CPF_CLIENTE_NF: TIBStringField
      FieldName = 'CNPJ_CPF_CLIENTE_NF'
      Origin = '"VENDAS_CANCELADAS"."CNPJ_CPF_CLIENTE_NF"'
      Size = 14
    end
    object qryVendasCanceladasNOME_CLIENTE_NF: TIBStringField
      FieldName = 'NOME_CLIENTE_NF'
      Origin = '"VENDAS_CANCELADAS"."NOME_CLIENTE_NF"'
      Size = 60
    end
    object qryVendasCanceladasTENTATIVAS_ENVIO_NFCE: TSmallintField
      FieldName = 'TENTATIVAS_ENVIO_NFCE'
      Origin = '"VENDAS_CANCELADAS"."TENTATIVAS_ENVIO_NFCE"'
    end
    object qryVendasCanceladasTEMPO_EMISSAO_NFCE: TSmallintField
      FieldName = 'TEMPO_EMISSAO_NFCE'
      Origin = '"VENDAS_CANCELADAS"."TEMPO_EMISSAO_NFCE"'
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
      '  DATA = :DATA,'
      '  HORA = :HORA,'
      '  DATA_SO = :DATA_SO,'
      '  DATA_ECF = :DATA_ECF,'
      '  HORA_ECF = :HORA_ECF,'
      '  VALOR_BRUTO = :VALOR_BRUTO,'
      '  VALOR_DESCONTO = :VALOR_DESCONTO,'
      '  VALOR_TXSERV = :VALOR_TXSERV,'
      '  VALOR_TOTAL = :VALOR_TOTAL,'
      '  TOTAL_PAGO = :TOTAL_PAGO,'
      '  VALOR_TROCO = :VALOR_TROCO,'
      '  COD_USUARIO = :COD_USUARIO,'
      '  NUMERO_CAIXA = :NUMERO_CAIXA,'
      '  MESA = :MESA,'
      '  IMP = :IMP,'
      '  COD_CAIXA = :COD_CAIXA,'
      '  TIPO_VENDA = :TIPO_VENDA,'
      '  COD_PEDIDO_DELIVERY = :COD_PEDIDO_DELIVERY,'
      '  COO_CUPOM = :COO_CUPOM,'
      '  QTDE_PESSOAS = :QTDE_PESSOAS,'
      '  VALOR_TX_ENTREGA = :VALOR_TX_ENTREGA,'
      '  REDUCAO_Z = :REDUCAO_Z,'
      '  SELECIONADO = :SELECIONADO,'
      '  DESCONTO_TAXAS = :DESCONTO_TAXAS,'
      '  CHAVE_NFCE = :CHAVE_NFCE,'
      '  NUMERO_NFCE = :NUMERO_NFCE,'
      '  SERIE_NFCE = :SERIE_NFCE,'
      '  PROTOCOLO_NFCE = :PROTOCOLO_NFCE,'
      '  RECIBO_NFCE = :RECIBO_NFCE,'
      '  OBS_NFCE = :OBS_NFCE,'
      '  CONSULTA_OK = :CONSULTA_OK,'
      '  COD_EMPRESA = :COD_EMPRESA,'
      '  PERCENTUAL_DESCONTO = :PERCENTUAL_DESCONTO,'
      '  LOTE_EXPORTACAO_WEB = :LOTE_EXPORTACAO_WEB,'
      '  COD_GARCON_ABRIU = :COD_GARCON_ABRIU,'
      '  MODELO_COMPROVANTE = :MODELO_COMPROVANTE,'
      '  COD_FORNECEDOR = :COD_FORNECEDOR,'
      '  SESSAO_SAT = :SESSAO_SAT,'
      '  CNF_SAT = :CNF_SAT,'
      '  XML_DOC = :XML_DOC,'
      '  CNPJ_CPF_CLIENTE_NF = :CNPJ_CPF_CLIENTE_NF,'
      '  NOME_CLIENTE_NF = :NOME_CLIENTE_NF,'
      '  TENTATIVAS_ENVIO_NFCE = :TENTATIVAS_ENVIO_NFCE,'
      '  TEMPO_EMISSAO_NFCE = :TEMPO_EMISSAO_NFCE'
      'where'
      '  COD_VENDA = :OLD_COD_VENDA and'
      '  COD_EMPRESA = :OLD_COD_EMPRESA')
    InsertSQL.Strings = (
      'insert into vendas_canceladas'
      
        '  (COD_VENDA, DATA, HORA, DATA_SO, DATA_ECF, HORA_ECF, VALOR_BRU' +
        'TO, VALOR_DESCONTO, '
      
        '   VALOR_TXSERV, VALOR_TOTAL, TOTAL_PAGO, VALOR_TROCO, COD_USUAR' +
        'IO, NUMERO_CAIXA, '
      
        '   MESA, IMP, COD_CAIXA, TIPO_VENDA, COD_PEDIDO_DELIVERY, COO_CU' +
        'POM, QTDE_PESSOAS, '
      
        '   VALOR_TX_ENTREGA, REDUCAO_Z, SELECIONADO, DESCONTO_TAXAS, CHA' +
        'VE_NFCE, '
      
        '   NUMERO_NFCE, SERIE_NFCE, PROTOCOLO_NFCE, RECIBO_NFCE, OBS_NFC' +
        'E, CONSULTA_OK, '
      
        '   COD_EMPRESA, PERCENTUAL_DESCONTO, LOTE_EXPORTACAO_WEB, COD_GA' +
        'RCON_ABRIU, '
      
        '   MODELO_COMPROVANTE, COD_FORNECEDOR, SESSAO_SAT, CNF_SAT, XML_' +
        'DOC, CNPJ_CPF_CLIENTE_NF, '
      '   NOME_CLIENTE_NF, TENTATIVAS_ENVIO_NFCE, TEMPO_EMISSAO_NFCE)'
      'values'
      
        '  (:COD_VENDA, :DATA, :HORA, :DATA_SO, :DATA_ECF, :HORA_ECF, :VA' +
        'LOR_BRUTO, '
      
        '   :VALOR_DESCONTO, :VALOR_TXSERV, :VALOR_TOTAL, :TOTAL_PAGO, :V' +
        'ALOR_TROCO, '
      
        '   :COD_USUARIO, :NUMERO_CAIXA, :MESA, :IMP, :COD_CAIXA, :TIPO_V' +
        'ENDA, :COD_PEDIDO_DELIVERY, '
      
        '   :COO_CUPOM, :QTDE_PESSOAS, :VALOR_TX_ENTREGA, :REDUCAO_Z, :SE' +
        'LECIONADO, '
      
        '   :DESCONTO_TAXAS, :CHAVE_NFCE, :NUMERO_NFCE, :SERIE_NFCE, :PRO' +
        'TOCOLO_NFCE, '
      
        '   :RECIBO_NFCE, :OBS_NFCE, :CONSULTA_OK, :COD_EMPRESA, :PERCENT' +
        'UAL_DESCONTO, '
      
        '   :LOTE_EXPORTACAO_WEB, :COD_GARCON_ABRIU, :MODELO_COMPROVANTE,' +
        ' :COD_FORNECEDOR, '
      
        '   :SESSAO_SAT, :CNF_SAT, :XML_DOC, :CNPJ_CPF_CLIENTE_NF, :NOME_' +
        'CLIENTE_NF, '
      '   :TENTATIVAS_ENVIO_NFCE, :TEMPO_EMISSAO_NFCE)')
    DeleteSQL.Strings = (
      'delete from vendas_canceladas'
      'where'
      '  COD_VENDA = :OLD_COD_VENDA and'
      '  COD_EMPRESA = :OLD_COD_EMPRESA')
    Left = 1168
    Top = 1104
  end
  object qryConsultaProdutos: TIBQuery
    Database = dbrestaurante
    Transaction = transacao
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      
        'select b.cod_produto,b.cod_barras, b.valor_unitario, b.PrecoPadr' +
        'ao, b.cod_grupo_raiz, b.desc_grupo_raiz,b.cod_grupo_pai, b.desc_' +
        'grupo_pai as grupo, b.cod_grupo, b.desc_grupo,b.descricao, b.qua' +
        'ntidade, b.qtdFracao,'
      '      case'
      
        '           when b.qtdFracao <> 0 then  EstoqueInteiro ||'#39' + '#39'||E' +
        'stoqueFracionado'
      '           else'
      '             EstoqueInteiro'
      '      end as estoque'
      ''
      ' from ('
      
        '     select t.cod_produto, t.cod_barras, t.valor_unitario, t.pre' +
        'coPadrao, rg.cod_grupo_raiz, rg.desc_grupo_raiz,rg.cod_grupo_pai' +
        ',rg.desc_grupo_pai,rg.cod_grupo, trim(rg.descricao) desc_grupo,p' +
        '.descricao, t.quantidade,'
      
        '               udf_replace(cast(cast( (  udf_int (t.quantidade  ' +
        '/ un2.parametro)) as numeric(10,5))  as varchar(15)),'#39'.'#39','#39','#39')||'#39 +
        ' '#39'||un2.descricao as EstoqueInteiro,'
      
        '               udf_replace(cast(cast((( udf_frac(t.quantidade  /' +
        ' un2.parametro) * un2.parametro)/un3.parametro) as numeric(10,2)' +
        ') as varchar(15)),'#39'.'#39','#39','#39')  ||'#39' '#39'||un3.descricao EstoqueFraciona' +
        'do,'
      
        '                udf_int (t.quantidade  / un2.parametro) as qtdIn' +
        'teira,'
      
        '               ((udf_frac(t.quantidade  / un2.parametro) * un2.p' +
        'arametro)/un3.parametro) as qtdFracao'
      '    '
      '           from ('
      
        '                   select p.cod_produto, p.cod_barras,p.valor_un' +
        'itario, p.valor_unitario as precoPadrao, p.estoque_liquido  as q' +
        'uantidade'
      '                     from produtos p'
      '                     where p.vende=1'
      '                    ) t'
      
        '            inner join produtos p on (p.cod_produto = t.cod_prod' +
        'uto )'
      
        '            inner join unidades un2 on (un2.cod_unidade = p.unid' +
        'ade_entrada)'
      
        '            inner join unidades un3 on (un3.cod_unidade = p.cod_' +
        'unidade_fracao)'
      
        '            inner join r_grupos rg on (rg.cod_grupo = p.cod_grup' +
        'o)'
      '            ) b'
      
        '            order by  b.descricao,  b.cod_grupo_raiz, b.cod_grup' +
        'o_pai, b.cod_grupo'
      '')
    PrecommittedReads = False
    Left = 784
    Top = 84
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
      currency = True
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
    object qryConsultaProdutosGRUPO: TIBStringField
      FieldName = 'GRUPO'
      Origin = '"GRUPOS"."DESCRICAO"'
      Size = 30
    end
    object qryConsultaProdutosCOD_GRUPO_RAIZ: TIBStringField
      FieldName = 'COD_GRUPO_RAIZ'
      Origin = '"R_GRUPOS"."COD_GRUPO_RAIZ"'
      Size = 6
    end
    object qryConsultaProdutosDESC_GRUPO_RAIZ: TIBStringField
      FieldName = 'DESC_GRUPO_RAIZ'
      Origin = '"R_GRUPOS"."DESC_GRUPO_RAIZ"'
      Size = 70
    end
    object qryConsultaProdutosCOD_GRUPO_PAI: TIBStringField
      FieldName = 'COD_GRUPO_PAI'
      Origin = '"R_GRUPOS"."COD_GRUPO_PAI"'
      Size = 6
    end
    object qryConsultaProdutosDESC_GRUPO: TIBStringField
      FieldName = 'DESC_GRUPO'
      ProviderFlags = []
      ReadOnly = True
      Size = 70
    end
    object qryConsultaProdutosQUANTIDADE: TIBBCDField
      FieldName = 'QUANTIDADE'
      Origin = '"PRODUTOS"."ESTOQUE_LIQUIDO"'
      Precision = 18
      Size = 2
    end
    object qryConsultaProdutosQTDFRACAO: TFloatField
      FieldName = 'QTDFRACAO'
      ProviderFlags = []
      ReadOnly = True
    end
    object qryConsultaProdutosESTOQUE: TIBStringField
      FieldName = 'ESTOQUE'
      ProviderFlags = []
      ReadOnly = True
      Size = 563
    end
    object qryConsultaProdutosPRECOPADRAO: TIBBCDField
      FieldName = 'PRECOPADRAO'
      Origin = '"PRODUTOS"."VALOR_UNITARIO"'
      Required = True
      currency = True
      Precision = 18
      Size = 2
    end
  end
  object dsConsultaProdutos: TDataSource
    DataSet = qryConsultaProdutos
    Left = 16
    Top = 1172
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
    PrecommittedReads = False
    Left = 784
    Top = 628
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'TABLE_NAME'
        ParamType = ptUnknown
      end>
  end
  object ExeInfo1: TExeInfo
    Version = '1.6.1.1'
    Left = 528
    Top = 764
  end
  object dsTbFormasPagamento: TDataSource
    DataSet = tbFormasPagamento
    Left = 400
    Top = 764
  end
  object ACBrInStore1: TACBrInStore
    Left = 16
    Top = 356
  end
  object qryMovimentoMesa: TIBQuery
    Database = dbrestaurante
    Transaction = transacao
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = False
    SQL.Strings = (
      'select 1 as selecionado, mv.cod_mesa,pr.cod_barras,pr.un_ecf,'
      ' mv.cod_produto,pr.cod_produto,'
      'pr.descricao,mv.quantidade as quantidade,'
      'mv.valor_unitario,'
      ' udf_roundabnt((mv.valor_unitario * mv.quantidade),2)   as total'
      
        ',mv.comanda, mv.cod_garcon, g.apelido,u.login,mv.hora_lancamento' +
        ', mv.estado,mv.cod_movimento, mv.desconto,id,impresso,observacoe' +
        's,sabores,obs_paf,cancelado,mv.tipo_massa,coalesce(mv.nome_clien' +
        'te,'#39#39') as nome_cliente,coalesce(mv.pago,0) as pago'
      '  from movimento_mesa mv '
      '  inner join produtos pr on (pr.cod_produto=mv.cod_produto)'
      '  inner join garcons g on (g.cod_garcon=mv.cod_garcon) '
      '  inner join usuarios u on (u.cod_usuario=mv.cod_usuario)'
      '  where mv.cod_mesa='#39'0001'#39' order by mv.cod_movimento'
      ''
      '')
    PrecommittedReads = False
    Left = 784
    Top = 1104
  end
  object dsQryMovimentoMesa: TDataSource
    DataSet = qryMovimentoMesa
    Left = 272
    Top = 560
  end
  object dsQryMovimentoMesaResumido: TDataSource
    DataSet = tbMovimentoMesa
    Left = 272
    Top = 628
  end
  object ead: TACBrEAD
    Left = 16
    Top = 220
  end
  object ACBrGAV1: TACBrGAV
    Modelo = gavImpressoraComum
    Porta = 'COM1'
    Device.HandShake = hsRTS_CTS
    Device.HardFlow = True
    StrComando = '#027,v,#140 | Bematech'
    Left = 16
    Top = 288
  end
  object qryConfigPDVS: TIBQuery
    Database = dbrestaurante
    Transaction = transacao
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      ''
      ''
      
        ' select ct.numero_caixa,ct.serie_nfce_normal, ct.numero_nfce_nor' +
        'mal,'
      '        ct.numero_nfce_normal_homologacao'
      '            from configuracoes_estacao ct')
    UpdateObject = updQryConfigPDVS
    PrecommittedReads = False
    Left = 656
    Top = 1308
    object qryConfigPDVSNUMERO_CAIXA: TIBStringField
      FieldName = 'NUMERO_CAIXA'
      Origin = '"CONFIGURACOES_ESTACAO"."NUMERO_CAIXA"'
      Size = 3
    end
    object qryConfigPDVSSERIE_NFCE_NORMAL: TIntegerField
      FieldName = 'SERIE_NFCE_NORMAL'
      Origin = '"CONFIGURACOES_ESTACAO"."SERIE_NFCE_NORMAL"'
    end
    object qryConfigPDVSNUMERO_NFCE_NORMAL: TIntegerField
      FieldName = 'NUMERO_NFCE_NORMAL'
      Origin = '"CONFIGURACOES_ESTACAO"."NUMERO_NFCE_NORMAL"'
    end
    object qryConfigPDVSNUMERO_NFCE_NORMAL_HOMOLOGACAO: TIntegerField
      FieldName = 'NUMERO_NFCE_NORMAL_HOMOLOGACAO'
      Origin = '"CONFIGURACOES_ESTACAO"."NUMERO_NFCE_NORMAL_HOMOLOGACAO"'
    end
  end
  object dsConfigPDVS: TDataSource
    DataSet = qryConfigPDVS
    Left = 16
    Top = 1104
  end
  object updQryConfigPDVS: TIBUpdateSQL
    RefreshSQL.Strings = (
      'Select *'
      'from configuracoes_estacao '
      'where'
      '  NUMERO_CAIXA = :NUMERO_CAIXA')
    ModifySQL.Strings = (
      'update configuracoes_estacao'
      'set'
      '  NUMERO_CAIXA = :NUMERO_CAIXA,'
      '  SERIE_NFCE_NORMAL = :SERIE_NFCE_NORMAL,'
      '  NUMERO_NFCE_NORMAL = :NUMERO_NFCE_NORMAL,'
      
        '  NUMERO_NFCE_NORMAL_HOMOLOGACAO = :NUMERO_NFCE_NORMAL_HOMOLOGAC' +
        'AO'
      'where'
      '  NUMERO_CAIXA = :OLD_NUMERO_CAIXA')
    Left = 1168
    Top = 16
  end
  object qryErrosInutilizacao: TIBQuery
    Database = dbrestaurante
    Transaction = transacao
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      ''
      
        '   select first 500 udf_year(current_date) as ano,coalesce(tenta' +
        'tivas,0) as tentativas, nf.* from inutilizacoes_nfce  nf'
      '  where nf.emitida = 0 and nf.inutilizada =0 and tentativas > 5')
    PrecommittedReads = False
    Left = 784
    Top = 560
  end
  object dsQryErrosInutilizacoes: TDataSource
    DataSet = qryErrosInutilizacao
    Left = 272
    Top = 288
  end
  object tbCsClientesDelivery: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 528
    Top = 1104
  end
  object memTbPermissoes: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 528
    Top = 900
  end
  object IdThreadComponent1: TIdThreadComponent
    Active = False
    Loop = False
    Priority = tpNormal
    StopMode = smTerminate
    OnBeforeRun = IdThreadComponent1BeforeRun
    OnRun = IdThreadComponent1Run
    OnTerminate = IdThreadComponent1Terminate
    Left = 1296
    Top = 560
  end
  object acbrCTE: TACBrCTe
    Configuracoes.Geral.SSLLib = libNone
    Configuracoes.Geral.SSLCryptLib = cryNone
    Configuracoes.Geral.SSLHttpLib = httpNone
    Configuracoes.Geral.SSLXmlSignLib = xsNone
    Configuracoes.Geral.FormatoAlerta = 'TAG:%TAGNIVEL% ID:%ID%/%TAG%(%DESCRICAO%) - %MSG%.'
    Configuracoes.Arquivos.OrdenacaoPath = <>
    Configuracoes.WebServices.UF = 'SP'
    Configuracoes.WebServices.AguardarConsultaRet = 0
    Configuracoes.WebServices.QuebradeLinha = '|'
    Configuracoes.RespTec.IdCSRT = 0
    DACTE = danfeCTE
    Left = 16
    Top = 84
  end
  object danfeCTE: TACBrCTeDACTEFR
    Sistema = 'Real Manager  - Vers'#227'o 5.0'
    MargemInferior = 8.000000000000000000
    MargemSuperior = 8.000000000000000000
    MargemEsquerda = 6.000000000000000000
    MargemDireita = 5.099999999999999000
    ExpandeLogoMarca = True
    ExpandeLogoMarcaConfig.Altura = 0
    ExpandeLogoMarcaConfig.Esquerda = 0
    ExpandeLogoMarcaConfig.Topo = 0
    ExpandeLogoMarcaConfig.Largura = 0
    ExpandeLogoMarcaConfig.Dimensionar = False
    ExpandeLogoMarcaConfig.Esticar = True
    CasasDecimais.Formato = tdetInteger
    CasasDecimais.qCom = 2
    CasasDecimais.vUnCom = 2
    CasasDecimais.MaskqCom = ',0.00'
    CasasDecimais.MaskvUnCom = ',0.00'
    CasasDecimais.Aliquota = 2
    CasasDecimais.MaskAliquota = ',0.00'
    ACBrCTE = acbrCTE
    ImprimirHoraSaida = False
    TipoDACTE = tiSemGeracao
    TamanhoPapel = tpA4
    Cancelada = False
    ExibeResumoCanhoto = False
    EPECEnviado = False
    ImprimeDescPorc = False
    EspessuraBorda = 1
    Left = 16
    Top = 152
  end
  object tbTamanhosPizzaReajuste: TFDMemTable
    ConstraintsEnabled = True
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 656
    Top = 84
  end
  object dsSaboresPizzaReajuste: TDataSource
    DataSet = tbSaboresPizzaReajuste
    Left = 400
    Top = 492
  end
  object tbSaboresPizzaReajuste: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 656
    Top = 16
  end
  object folderDialog: TJvBrowseForFolderDialog
    RootDirectory = fdDesktop
    Title = 'Selecione o local para salvar'
    Left = 1296
    Top = 628
  end
  object ACBrMail1: TACBrMail
    Host = '127.0.0.1'
    Port = '25'
    Username = 'naoresponda'
    Password = 'k37kp4ptfm'
    SetSSL = False
    SetTLS = False
    Attempts = 3
    DefaultCharset = UTF_8
    IDECharset = CP1252
    Left = 16
    Top = 424
  end
  object tbFormasPagamento: TFDMemTable
    ObjectView = False
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 528
    Top = 1172
  end
  object qryEmpresas: TFDQuery
    Connection = fdRestaurante
    SQL.Strings = (
      ''
      ' select p.cod_empresa,'
      '    p.descricao_empresa from parametros p'
      '    order by p.cod_empresa')
    Left = 656
    Top = 220
    object qryEmpresasCOD_EMPRESA: TStringField
      FieldName = 'COD_EMPRESA'
      Origin = 'COD_EMPRESA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 4
    end
    object qryEmpresasDESCRICAO_EMPRESA: TStringField
      FieldName = 'DESCRICAO_EMPRESA'
      Origin = 'DESCRICAO_EMPRESA'
      Size = 100
    end
  end
  object dsQryEmpresas: TDataSource
    DataSet = qryEmpresas
    Left = 272
    Top = 152
  end
  object tbGruposCombo: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 528
    Top = 1240
  end
  object qryProdutosAdicionais: TFDQuery
    Connection = fdRestaurante
    SQL.Strings = (
      '  select pg.id,id_grupo, pg.cod_produto,p.descricao,pg.valor'
      '      from produtos_grupos_adicionais pg'
      
        '        inner join produtos p on (p.cod_produto = pg.cod_produto' +
        ')'
      '       where pg.id_grupo=1')
    Left = 656
    Top = 356
    object qryProdutosAdicionaisID: TLargeintField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryProdutosAdicionaisID_GRUPO: TLargeintField
      FieldName = 'ID_GRUPO'
      Origin = 'ID_GRUPO'
      Required = True
    end
    object qryProdutosAdicionaisCOD_PRODUTO: TStringField
      FieldName = 'COD_PRODUTO'
      Origin = 'COD_PRODUTO'
      Required = True
      Size = 10
    end
    object qryProdutosAdicionaisDESCRICAO: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'DESCRICAO'
      Origin = 'DESCRICAO'
      ProviderFlags = []
      ReadOnly = True
      Size = 150
    end
    object qryProdutosAdicionaisVALOR: TFMTBCDField
      FieldName = 'VALOR'
      Origin = 'VALOR'
      Precision = 18
      Size = 2
    end
  end
  object dsQryProdutosAdicionais: TDataSource
    DataSet = qryProdutosAdicionais
    Left = 272
    Top = 1036
  end
  object tbAdquirentesTemp: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 528
    Top = 968
  end
  object dsTbAdquirentesTemp: TDataSource
    DataSet = tbAdquirentesTemp
    Left = 400
    Top = 628
  end
  object danfeESCPos: TACBrNFeDANFeESCPOS
    Sistema = 'Real Manager Vers'#227'o  8'
    Site = 'www.realsoftwares.com.br'
    MargemInferior = 0.800000000000000000
    MargemSuperior = 0.800000000000000000
    MargemEsquerda = 0.600000000000000000
    MargemDireita = 0.510000000000000000
    ExpandeLogoMarca = True
    ExpandeLogoMarcaConfig.Altura = 0
    ExpandeLogoMarcaConfig.Esquerda = 0
    ExpandeLogoMarcaConfig.Topo = 0
    ExpandeLogoMarcaConfig.Largura = 0
    ExpandeLogoMarcaConfig.Dimensionar = False
    ExpandeLogoMarcaConfig.Esticar = True
    CasasDecimais.Formato = tdetInteger
    CasasDecimais.qCom = 3
    CasasDecimais.vUnCom = 2
    CasasDecimais.MaskqCom = ',0.000'
    CasasDecimais.MaskvUnCom = ',0.00'
    CasasDecimais.Aliquota = 2
    CasasDecimais.MaskAliquota = ',0.00'
    ACBrNFe = ACBrNFe1
    TipoDANFE = tiNFCe
    ImprimeQRCodeLateral = True
    ImprimeLogoLateral = True
    ImprimeEmUmaLinha = True
    FormularioContinuo = True
    PosPrinter = ACBrPosPrinter1
    Left = 16
    Top = 628
  end
  object danfeFR: TACBrNFeDANFCEFR
    Sistema = 
      'Sistema Real Manager - Vers'#227'o 5.01.1234  www.realsoftwares.com.b' +
      'r'
    MargemInferior = 0.800000000000000000
    MargemSuperior = 0.800000000000000000
    MargemEsquerda = 0.600000000000000000
    MargemDireita = 0.510000000000000000
    ExpandeLogoMarcaConfig.Altura = 0
    ExpandeLogoMarcaConfig.Esquerda = 0
    ExpandeLogoMarcaConfig.Topo = 0
    ExpandeLogoMarcaConfig.Largura = 0
    ExpandeLogoMarcaConfig.Dimensionar = False
    ExpandeLogoMarcaConfig.Esticar = True
    CasasDecimais.Formato = tdetInteger
    CasasDecimais.qCom = 2
    CasasDecimais.vUnCom = 2
    CasasDecimais.MaskqCom = ',0.00'
    CasasDecimais.MaskvUnCom = ',0.00'
    CasasDecimais.Aliquota = 2
    CasasDecimais.MaskAliquota = ',0.00'
    ImprimeQRCodeLateral = True
    FormularioContinuo = True
    BorderIcon = [biSystemMenu, biMinimize, biMaximize]
    ThreadSafe = False
    Left = 16
    Top = 560
  end
  object ACBrNFe1: TACBrNFe
    MAIL = ACBrMail1
    Configuracoes.Geral.SSLLib = libOpenSSL
    Configuracoes.Geral.SSLCryptLib = cryOpenSSL
    Configuracoes.Geral.SSLHttpLib = httpOpenSSL
    Configuracoes.Geral.SSLXmlSignLib = xsLibXml2
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
    DANFE = danfeESCPos
    Left = 16
    Top = 492
  end
  object tbMovimentoMesa: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 528
    Top = 1308
  end
  object dsTbMovimentoMesa: TDataSource
    DataSet = tbMovimentoMesa
    Left = 400
    Top = 832
  end
  object qryVendasCaixa: TFDQuery
    Connection = fdRestaurante
    SQL.Strings = (
      
        'select  v.cod_venda,v.data_so, v.hora, v.mesa, v.coo_cupom, v.nu' +
        'mero_nfce, v.serie_nfce,  v.valor_bruto, v.valor_txserv, v.xml_d' +
        'oc, '
      
        '         v.valor_tx_entrega, v.valor_desconto , v.valor_total, v' +
        '.modelo_comprovante,'
      
        '         v.chave_nfce, v.protocolo_nfce, v.numero_caixa, tipo_ve' +
        'nda, '
      '         case    '
      '           when  v.tipo_venda =1 then '#39'Mesa'#39
      '           when  v.tipo_venda =2 then '#39'Balc'#227'o'#39
      '           when  v.tipo_venda =3 then '#39'Deliv.'#39
      '         end  as tipo, '
      '         case '
      '           when v.modelo_comprovante = 0 then '#39'AVULSO'#39
      '           when v.modelo_comprovante = 1 then '#39'ECF'#39
      '           when v.modelo_comprovante = 2 then '#39'NFC-e'#39
      '           when v.modelo_comprovante = 3 then '#39'NF-e'#39
      '           when v.modelo_comprovante = 3 then '#39'SAT'#39
      '         end as desc_modelo_comprovante, '
      'case '
      '     when modelo_comprovante = 0 then 0 '
      
        '     when modelo_comprovante = 2 then udf_minutesbetween(CAST(v.' +
        'data_so||'#39' '#39'||v.hora AS TIMESTAMP), current_timestamp)'
      
        '     when modelo_comprovante = 3 then udf_hoursbetween(CAST(v.da' +
        'ta_so||'#39' '#39'||v.hora AS TIMESTAMP), current_timestamp)'
      
        '   end as tempoEmissao, coalesce(f.nome_fantasia,f.razao_social)' +
        ' as nomeFornecedor'
      '  from vendas v'
      ''
      
        '  left join fornecedor f on (f.cod_fornecedor = v.cod_fornecedor' +
        ')'
      '  where  v.data'
      ''
      ' between '#39'22.12.2021'#39
      ' and '#39'22.12.2021'#39
      ' and v.numero_nfce  between 0 and 999999999'
      ''
      ''
      '  order by cod_venda desc')
    Left = 656
    Top = 492
  end
  object tbCartoes: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 528
    Top = 1036
    object tbCartoescod_cartao: TStringField
      FieldName = 'cod_cartao'
      Size = 4
    end
    object tbCartoesdescricao: TStringField
      FieldName = 'descricao'
      Size = 40
    end
    object tbCartoesdescricao_status: TStringField
      FieldName = 'descricao_status'
    end
    object tbCartoesnome_cliente: TStringField
      FieldName = 'nome_cliente'
      Size = 40
    end
  end
  object RESTClient1: TRESTClient
    BaseURL = 'https://merchant-api.ifood.com.br/order/v1.0/events:polling'
    Params = <>
    SecureProtocols = [TLS11, TLS12, TLS13]
    ConnectTimeout = 5000
    SynchronizedEvents = False
    Left = 1296
    Top = 764
  end
  object RESTResponse1: TRESTResponse
    Left = 1296
    Top = 900
  end
  object RESTRequest1: TRESTRequest
    AssignedValues = [rvConnectTimeout, rvReadTimeout]
    Client = RESTClient1
    Params = <
      item
        Kind = pkHTTPHEADER
        Name = 'Authorization'
        Options = [poDoNotEncode]
        Value = 
          'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzUxMiJ9.eyJzdWIiOiJiMmM3ZmI3' +
          'Zi1kZTk1LTQ1YTAtODg2YS0wOWFhY2FiNmNhYWIiLCJhcHBfbmFtZSI6InJlYWxt' +
          'YW5hZ2VyIiwiYXVkIjpbInNoaXBwaW5nIiwiY2F0YWxvZyIsImZpbmFuY2lhbCIs' +
          'InJldmlldyIsIm1lcmNoYW50Iiwib3JkZXIiLCJvYXV0aC1zZXJ2ZXIiXSwib3du' +
          'ZXJfbmFtZSI6InJlYWxzb2Z0d2FyZXMiLCJzY29wZSI6WyJzaGlwcGluZyIsImNh' +
          'dGFsb2ciLCJyZXZpZXciLCJtZXJjaGFudCIsIm9yZGVyIiwiY29uY2lsaWF0b3Ii' +
          'XSwiaXNzIjoiaUZvb2QiLCJ0eXBlIjoiY29tcGFjdCIsImV4cCI6MTY0MzM0MjQ3' +
          'OCwiaWF0IjoxNjQzMzIwODc4LCJqdGkiOiJiMmM3ZmI3Zi1kZTk1LTQ1YTAtODg2' +
          'YS0wOWFhY2FiNmNhYWI6YTg2OWY5MjEtN2FkZi00NmUxLWFiYTUtZGNlYzExMWE4' +
          'MDE1IiwibWVyY2hhbnRfc2NvcGVkIjp0cnVlLCJjbGllbnRfaWQiOiJhODY5Zjky' +
          'MS03YWRmLTQ2ZTEtYWJhNS1kY2VjMTExYTgwMTUifQ.LtT4XBDX_7-sGpn5rdWpM' +
          '7_tc_JAL2ypxt6xhn45L79MCr4pGjlGFdjqYm2DKUmBoa-ILaPYreAqUTP5BhkXj' +
          '5DcJZnSBN1VMJBGarnvBQ-1Vh4fSslBOFiFdo3z2TB70PAtdyCJWQGY0t9gKw2qu' +
          'cFHQRKcgavfZ-gqOr03ESM'
      end
      item
        Kind = pkHTTPHEADER
        Name = 'x-polling-merchants'
        Options = [poDoNotEncode]
        Value = '77fecfbf-c8e4-464a-9df7-1037d119e1d0'
      end
      item
        Kind = pkHTTPHEADER
        Name = 'FROM'
        Value = 'JOhny'
      end>
    Response = RESTResponse1
    ConnectTimeout = 5000
    ReadTimeout = 5000
    SynchronizedEvents = False
    Left = 1296
    Top = 832
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
    PrecommittedReads = False
    Left = 784
    Top = 764
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
  object dsItensFatura: TDataSource
    DataSet = qryItensConsultaFatura
    Left = 144
    Top = 16
  end
  object balanca: TACBrBAL
    Porta = 'COM1'
    OnLePeso = balancaLePeso
    Left = 16
    Top = 16
  end
  object ACBrNFeDANFEFR1: TACBrNFeDANFEFR
    MostraSetup = True
    Sistema = 'Real Manager 3.4.18'
    Site = 'www.realsoftwares.com.br'
    MargemInferior = 8.000000000000000000
    MargemSuperior = 8.000000000000000000
    MargemEsquerda = 6.000000000000000000
    MargemDireita = 5.099999999999999000
    ExpandeLogoMarcaConfig.Altura = 0
    ExpandeLogoMarcaConfig.Esquerda = 0
    ExpandeLogoMarcaConfig.Topo = 0
    ExpandeLogoMarcaConfig.Largura = 0
    ExpandeLogoMarcaConfig.Dimensionar = False
    ExpandeLogoMarcaConfig.Esticar = True
    CasasDecimais.Formato = tdetInteger
    CasasDecimais.qCom = 2
    CasasDecimais.vUnCom = 2
    CasasDecimais.MaskqCom = ',0.00'
    CasasDecimais.MaskvUnCom = ',0.00'
    CasasDecimais.Aliquota = 2
    CasasDecimais.MaskAliquota = ',0.00'
    ExpandirDadosAdicionaisAuto = True
    EspessuraBorda = 1
    BorderIcon = [biSystemMenu, biMinimize, biMaximize]
    ExibeCaptionButton = True
    ThreadSafe = False
    Left = 16
    Top = 696
  end
  object SocketClient: TIdTCPClient
    ConnectTimeout = 0
    Port = 0
    ReadTimeout = -1
    Left = 1296
    Top = 492
  end
  object qryTabelasDePrecos: TFDQuery
    Connection = fdRestaurante
    SQL.Strings = (
      '  select codigo, descricao from tabelas_preco')
    Left = 656
    Top = 424
  end
  object dsQryTabelaPrecos: TDataSource
    DataSet = qryTabelasDePrecos
    Left = 400
    Top = 16
  end
  object FDPhysFBDriverLink1: TFDPhysFBDriverLink
    Left = 656
    Top = 152
  end
  object dsParticipantes: TDataSource
    Left = 144
    Top = 288
  end
  object qryParticipantes: TFDQuery
    Connection = fdRestaurante
    SQL.Strings = (
      ''
      ''
      ' select f.cod_fornecedor,'
      '        f.razao_social,'
      
        '        f.nome_fantasia, f.cgc_cpf as documento, f.inscricao_est' +
        'adual'
      '   from fornecedor f'
      '    order by f.razao_social')
    Left = 656
    Top = 288
  end
  object dsQryParticipantes: TDataSource
    DataSet = qryParticipantes
    Left = 74
    Top = 13
  end
  object qryClientesMesa: TFDQuery
    Connection = fdRestaurante
    SQL.Strings = (
      ''
      ''
      ' select'
      '   distinct ms.nome_cliente,'
      '   ms.guid_cliente,'
      '   ms.cod_cliente, 0 as sel, ms.cod_mesa as mesa'
      '     from movimento_mesa ms'
      '     order by ms.nome_cliente')
    Left = 1425
    Top = 300
    object qryClientesMesaNOME_CLIENTE: TStringField
      FieldName = 'NOME_CLIENTE'
      Origin = 'NOME_CLIENTE'
      Size = 200
    end
    object qryClientesMesaGUID_CLIENTE: TStringField
      FieldName = 'GUID_CLIENTE'
      Origin = 'GUID_CLIENTE'
      Size = 50
    end
    object qryClientesMesaCOD_CLIENTE: TStringField
      FieldName = 'COD_CLIENTE'
      Origin = 'COD_CLIENTE'
      Size = 200
    end
    object qryClientesMesaSEL: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'SEL'
      Origin = 'SEL'
      ProviderFlags = []
      ReadOnly = True
    end
    object qryClientesMesaMESA: TStringField
      FieldName = 'MESA'
      Origin = 'COD_MESA'
      Required = True
      Size = 4
    end
  end
  object dsQryClientesMesa: TDataSource
    DataSet = memTbClientesMesa
    Left = 1424
    Top = 361
  end
  object memTbClientesMesa: TFDMemTable
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
    Left = 1428
    Top = 423
    object memTbClientesMesaNOME_CLIENTE: TStringField
      FieldName = 'NOME_CLIENTE'
      Origin = 'NOME_CLIENTE'
      Size = 200
    end
    object memTbClientesMesaGUID_CLIENTE: TStringField
      FieldName = 'GUID_CLIENTE'
      Origin = 'GUID_CLIENTE'
      Size = 50
    end
    object memTbClientesMesaCOD_CLIENTE: TStringField
      FieldName = 'COD_CLIENTE'
      Origin = 'COD_CLIENTE'
      Size = 200
    end
    object memTbClientesMesaSEL: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'SEL'
      Origin = 'SEL'
      ProviderFlags = []
      ReadOnly = True
    end
    object memTbClientesMesaMESA: TStringField
      FieldName = 'MESA'
      Origin = 'COD_MESA'
      Required = True
      Size = 4
    end
  end
  object qryDRE: TFDQuery
    Connection = fdRestaurante
    SQL.Strings = (
      ''
      'select c.*,'
      'case'
      ' when VARIACAO_MC_MES_ANT  = 0 then 0'
      ' when VARIACAO_MC_MES_ANT  < 0 then 1'
      '  when VARIACAO_MC_MES_ANT > 0 then 2'
      ' end as sinal_mes,'
      ' case'
      '   when VARIACAO_MC_ANO_ANT  = 0 then 0'
      '    when VARIACAO_MC_ANO_ANT  < 0 then 1'
      '    when VARIACAO_MC_ANO_ANT > 0 then 2'
      ' end as sinal_ano'
      ''
      '  from ('
      ''
      
        'select LPAD(TP.cod_conta_formatado, (char_length(cod_conta_forma' +
        'tado) + tp.tipo), '#39' '#39') ||'#39' - '#39'||tp.descricao as descricao_ext,'
      '     tp.total_mes,'
      
        '    COALESCE( (TP.total_mes / NULLIF(TP.fat_mes, 0)) * 100.0, 0 ' +
        ')        AS MC_ATUAL,'
      '    tp.total_desp_mes,'
      
        '    COALESCE( (TP.total_mes / NULLIF(TP.total_desp_mes, 0)) * 10' +
        '0.0, 0 )        AS MC_DESP_ATUAL,'
      ' '
      '    tp.total_mes_ant,'
      
        '    COALESCE( (TP.total_mes_ant / NULLIF(TP.fat_mes_ant, 0)) * 1' +
        '00.0, 0 ) AS MC_MES_ANT,'
      ' '
      
        '    coalesce( CAST(((CAST(TP.total_mes - TP.total_mes_ant AS DEC' +
        'IMAL(18,6)) / NULLIF(CAST(TP.total_mes_ant AS DECIMAL(18,6)),0))' +
        ' * 100) AS DECIMAL(18,4)),0) AS VARIACAO_MC_MES_ANT,'
      '    tp.total_desp_mes_anterior,'
      
        '    COALESCE( (TP.total_mes_ant / NULLIF(TP.total_desp_mes_anter' +
        'ior, 0)) * 100.0, 0 )        AS MC_DESP_MES_ANT,'
      '   tp.total_ano_ant,'
      
        '  COALESCE( (TP.total_ano_ant / NULLIF(TP.fat_ano_ant, 0)) * 100' +
        '.0, 0 ) AS MC_ANO_ANT,'
      
        '   coalesce( CAST(((CAST(TP.total_mes - TP.total_ano_ant AS DECI' +
        'MAL(18,6)) / NULLIF(CAST(TP.total_ano_ant AS DECIMAL(18,6)),0)) ' +
        '* 100) AS DECIMAL(18,4)),0) AS VARIACAO_MC_ANO_ANT,'
      ''
      '    tp.total_desp_ano_anterior,'
      
        '    COALESCE( (TP.total_ano_ant / NULLIF(TP.total_desp_ano_anter' +
        'ior, 0)) * 100.0, 0 )        AS MC_DESP_ANO_ANT,'
      ' '
      '     TP.cod_conta_formatado,'
      '     tp.cod_conta, tp.tipo,'
      '     tp.descricao as descricao_conta'
      '   from tmp_dados_dre TP'
      '  order by tp.cod_conta_raiz, tp.desdobramento_pai,tp.cod_conta'
      '  ) c'
      '')
    Left = 1433
    Top = 488
  end
  object dsQryDRE: TDataSource
    DataSet = qryDRE
    Left = 1436
    Top = 554
  end
  object qryProdutosDRE: TFDQuery
    Connection = fdRestaurante
    SQL.Strings = (
      ''
      '    WITH'
      '      cte_entradas AS ('
      '        SELECT DISTINCT cp.codigo_entrada'
      '        FROM contas_a_pagar cp'
      
        '        WHERE cp.data_competencia BETWEEN '#39'01.09.2025'#39' and '#39'30.0' +
        '9.2025'#39
      '          AND cp.codigo_entrada <> '#39#39
      '      ),'
      '      cte_dados_compras AS ('
      '        SELECT'
      '          ce.codigo_entrada,'
      '          p.cod_plano_contas AS cod_conta,'
      '          p.cod_produto,'
      '          p.descricao,'
      '          COALESCE(ite.quantidade,0)      AS quantidade,'
      '          COALESCE(ite.valor_unitario,0)  AS valor_unitario,'
      
        '          (COALESCE(ite.quantidade,0) * COALESCE(ite.valor_unita' +
        'rio,0)) as subtotal,'
      '          COALESCE(ite.desconto,0)        AS desconto,'
      
        '           (COALESCE(ite.valor_ipi,0) + COALESCE(ite.valor_frete' +
        ',0)+  COALESCE(ite.valor_seguro,0) + COALESCE(ite.valor_fcp,0)+ ' +
        'COALESCE(ite.outras_despesas,0))   as outras_despesas'
      ''
      '        FROM itens_entrada ite'
      
        '        JOIN cte_entradas ce ON ce.codigo_entrada = ite.cod_entr' +
        'ada'
      '        JOIN produtos      p  ON p.cod_produto    = ite.cod_item'
      '      )'
      '      select ct.cod_conta,'
      '             ct.cod_produto,'
      '             ct.descricao,'
      '             sum(ct.quantidade) as quantidade,'
      
        '            avg(coalesce( (ct.subtotal + ct.outras_despesas - ct' +
        '.desconto) / ct.quantidade,0)) as custo_medio,'
      
        '            sum(coalesce( (ct.subtotal + ct.outras_despesas - ct' +
        '.desconto),0)) as total'
      '         from cte_dados_compras ct'
      '          where ct.cod_conta like '#39'101'#39'||'#39'%'#39
      '         group by ct.cod_conta, ct.cod_produto, ct.descricao')
    Left = 1440
    Top = 614
  end
  object dsQryProdutosDRE: TDataSource
    DataSet = qryProdutosDRE
    Left = 1430
    Top = 691
  end
  object qryEntradasGrupoDRE: TFDQuery
    Connection = fdRestaurante
    SQL.Strings = (
      '   WITH'
      '    cte_entradas AS ('
      '        SELECT DISTINCT cp.codigo_entrada'
      '        FROM contas_a_pagar cp'
      
        '        WHERE cp.data_competencia BETWEEN '#39'01.09.2025'#39' and '#39'30.0' +
        '9.2025'#39
      '          AND cp.codigo_entrada <> '#39#39
      '      ),'
      '      cte_dados_compras AS ('
      '        SELECT'
      '          ite.cod_entrada,'
      '          p.cod_plano_contas AS cod_conta,'
      '          COALESCE(ite.quantidade,0)      AS quantidade,'
      '          COALESCE(ite.valor_unitario,0)  AS valor_unitario,'
      '          COALESCE(ite.desconto,0)        AS desconto,'
      '          COALESCE(ite.valor_ipi,0)       AS valor_ipi,'
      '          COALESCE(ite.valor_frete,0)     AS valor_frete,'
      '          COALESCE(ite.valor_seguro,0)    AS valor_seguro,'
      '          COALESCE(ite.valor_fcp,0)       AS valor_fcp,'
      '          COALESCE(ite.outras_despesas,0) AS outras_despesas'
      '        FROM itens_entrada ite'
      
        '        inner JOIN cte_entradas ce ON ce.codigo_entrada = ite.co' +
        'd_entrada'
      
        '        inner JOIN produtos      p  ON p.cod_produto    = ite.co' +
        'd_item'
      ''
      '      ),'
      '      cte_totais AS (  -- soma compras + despesas, por conta'
      '        SELECT cod_entrada, cod_conta, SUM(total) AS total'
      '        FROM ('
      '          SELECT'
      '            c.cod_entrada,'
      '            pf.cod_conta,'
      '            SUM('
      
        '              ((COALESCE(c.quantidade,0) * COALESCE(c.valor_unit' +
        'ario,0)) - COALESCE(c.desconto,0)) +'
      '               COALESCE(c.valor_ipi,0) +'
      '               COALESCE(c.valor_frete,0) +'
      '               COALESCE(c.valor_seguro,0) +'
      '               COALESCE(c.valor_fcp,0) +'
      '               COALESCE(c.outras_despesas,0)'
      '            ) AS total'
      '          FROM cte_dados_compras c'
      
        '          JOIN plano_contas_financeiro pf ON pf.cod_conta = c.co' +
        'd_conta'
      '          GROUP BY c.cod_entrada, pf.cod_conta'
      '        )'
      '        GROUP BY cod_entrada,cod_conta'
      '      )'
      ''
      
        '       select ct.cod_entrada, e.tipo_entrada, f.cod_fornecedor, ' +
        'f.razao_social,'
      
        '               cast(coalesce(e.numero_nota,0) as bigint) as nume' +
        'roNota,'
      '               e.chave_nfe,e.data_emissao,'
      '               e.data_entrada,'
      '               e.data as data_lancamento,'
      '                ct.total as totalGrupo,'
      '               e.total_nota as totalNota,'
      '               e.nome_usuario_entrada as usuario_lancamento'
      '          from cte_totais ct'
      
        '            inner join entradas   e on (e.cod_entrada = ct.cod_e' +
        'ntrada)'
      
        '            inner join fornecedor f on (f.cod_fornecedor = e.cod' +
        '_fornecedor)'
      
        '            inner join plano_contas_financeiro pf on (pf.cod_con' +
        'ta = ct.cod_conta)')
    Left = 1567
    Top = 483
  end
  object dsQryEntradasGrupoDRE: TDataSource
    DataSet = qryEntradasGrupoDRE
    Left = 1563
    Top = 548
  end
  object qryProdutosEntradaDRE: TFDQuery
    Connection = fdRestaurante
    SQL.Strings = (
      'WITH'
      '    cte_entradas AS ('
      '      SELECT '#39'00000832'#39' as codigo_entrada from  RDB$DATABASE'
      '    ),'
      '    cte_dados_compras AS ('
      '      SELECT'
      '        ce.codigo_entrada,'
      '        p.cod_plano_contas AS cod_conta,'
      '        p.cod_produto,'
      '        p.descricao,'
      '        pf.descricao as conta_financeira,'
      '        COALESCE(ite.quantidade,0)      AS quantidade,'
      '        COALESCE(ite.valor_unitario,0)  AS valor_unitario,'
      
        '        (COALESCE(ite.quantidade,0) * COALESCE(ite.valor_unitari' +
        'o,0)) as subtotal,'
      '        COALESCE(ite.desconto,0)        AS desconto,'
      
        '         (COALESCE(ite.valor_ipi,0) + COALESCE(ite.valor_frete,0' +
        ')+  COALESCE(ite.valor_seguro,0) + COALESCE(ite.valor_fcp,0)+ CO' +
        'ALESCE(ite.outras_despesas,0))   as outras_despesas'
      ' '
      '      FROM itens_entrada ite'
      
        '      JOIN cte_entradas ce ON ce.codigo_entrada = ite.cod_entrad' +
        'a'
      '      JOIN produtos      p  ON p.cod_produto    = ite.cod_item'
      
        '      join plano_contas_financeiro pf on (pf.cod_conta = p.cod_p' +
        'lano_contas)'
      '    )'
      '    select ct.cod_conta,'
      '           ct.cod_produto,'
      '           ct.descricao,'
      '           ct.conta_financeira,'
      '           sum(ct.quantidade) as quantidade,'
      
        '          avg(coalesce( (ct.subtotal + ct.outras_despesas - ct.d' +
        'esconto) / ct.quantidade,0)) as custo_medio,'
      
        '          sum(coalesce( (ct.subtotal + ct.outras_despesas - ct.d' +
        'esconto),0)) as total'
      '       from cte_dados_compras ct'
      '        where ct.cod_conta like '#39'101'#39'||'#39'%'#39
      
        '       group by ct.cod_conta, ct.cod_produto,ct.conta_financeira' +
        ', ct.descricao  order by ct.descricao')
    Left = 1566
    Top = 624
  end
  object dsqryProdutosEntradaDRE: TDataSource
    DataSet = qryProdutosEntradaDRE
    Left = 1572
    Top = 692
  end
  object qryContasAPagarDRE: TFDQuery
    Connection = fdRestaurante
    SQL.Strings = (
      ' select * from ('
      
        ' select cp.codigo, coalesce(cp.codigo_entrada, '#39#39') as codigo_ent' +
        'rada,cp.descricao_conta, cp.status, '
      '        cast(e.numero_nota as integer) as numero_nota,'
      '        case'
      '         when cp.codigo_entrada is null then '#39'Financeiro'#39
      '         when trim(cp.codigo_entrada) = '#39#39' then '#39'Financeiro'#39
      '         else'
      '          '#39'Compras'#39
      '        end as tipo,'
      ' '
      '        case'
      
        '         when ((cp.status = 0) and (cp.data_vencimento >= curren' +
        't_date) ) then 0'
      
        '         when ( ((cp.status = 0) or (cp.status=2)) and (cp.data_' +
        'vencimento < current_date) ) then -1'
      '         when (cp.status =1) then 1'
      '         when  (cp.status = 2) then 2'
      '        end as situacao,'
      ' '
      '        case'
      
        '         when ((cp.status = 0) and (cp.data_vencimento >= curren' +
        't_date) ) then'
      '           '#39'Aberto'#39
      
        '         when ( ((cp.status = 0) or (cp.status=2)) and (cp.data_' +
        'vencimento < current_date) ) then'
      '           '#39'Vencido'#39
      '         when (cp.status =1) then'
      '          '#39'Pago'#39
      '         when  (cp.status = 2) then'
      '          '#39'Previsto'#39
      '        end as situacao_descricao,'
      ' '
      ' '
      '        cp.cod_fornecedor,'
      
        '        coalesce(f.razao_social, '#39#39') as razao_social, coalesce(f' +
        '.nome_fantasia, '#39#39') as nome_fantasia, f.cgc_cpf,'
      '        cp.data_entrada, cp.data_lancamento,'
      
        '        coalesce(cp.data_competencia, cp.data_vencimento) as dat' +
        'a_competencia, cp.data_pagamento,'
      '        cp.data_vencimento,cp.usuario_inclusao,'
      
        '        cp.usuario_baixa, cp.valor,cp.multa,(cp.valor + cp.multa' +
        ') as valor_atualizado, cp.obs,'
      
        '        cp.parcela,cp.id_conta_bancaria, cb.descricao as descric' +
        'ao_conta_bancaria,'
      
        '        cp.cod_emp_grupo, p.descricao_empresa, cp.cod_conta, coa' +
        'lesce(pc.descricao, '#39'Compras diversas'#39') as descricao_conta_geren' +
        'cial,'
      '        coalesce(cp.fixa,0) as fixa,'
      '        case'
      '         when coalesce(cp.fixa,0) = 0 then '#39'Nao'#39
      '         when coalesce(cp.fixa,0) = 1 then '#39'Sim'#39
      '        end as fixa_descricao,'
      '        coalesce(cp.conciliado,0) as conciliado,'
      '        case'
      '         when coalesce(cp.conciliado,0) = 0 then '#39'Nao'#39
      '         when coalesce(cp.conciliado,0) = 1 then '#39'Sim'#39
      '        end as conciliado_descricao,'
      '     coalesce(e.chave_nfe,'#39#39') as chave_nfe'
      ' '
      '   from contas_a_pagar cp'
      
        '     inner join fornecedor f on (f.cod_fornecedor = cp.cod_forne' +
        'cedor)'
      
        '     left join  entradas   e on (e.cod_entrada = cp.codigo_entra' +
        'da)'
      
        '     left join contas_bancarias cb on (cb.id = cp.id_conta_banca' +
        'ria)'
      
        '     left join plano_contas_financeiro pc on (pc.cod_conta = cp.' +
        'cod_conta)'
      
        '     inner join parametros p on (p.cod_empresa = cp.cod_emp_grup' +
        'o)'
      
        '       where cp.data_vencimento  between '#39'01.10.2025'#39' and '#39'31.10' +
        '.2025'#39
      ') '
      ' where 1=1 ')
    Left = 1434
    Top = 764
  end
  object dsQryContasAPagarDRE: TDataSource
    DataSet = qryContasAPagarDRE
    Left = 1557
    Top = 768
  end
  object qryContasAPagarEntradasDRE: TFDQuery
    Connection = fdRestaurante
    SQL.Strings = (
      ' select * from ('
      
        ' select cp.codigo, coalesce(cp.codigo_entrada, '#39#39') as codigo_ent' +
        'rada,cp.descricao_conta, cp.status, '
      '        cast(e.numero_nota as integer) as numero_nota,'
      '        case'
      '         when cp.codigo_entrada is null then '#39'Financeiro'#39
      '         when trim(cp.codigo_entrada) = '#39#39' then '#39'Financeiro'#39
      '         else'
      '          '#39'Compras'#39
      '        end as tipo,'
      ' '
      '        case'
      
        '         when ((cp.status = 0) and (cp.data_vencimento >= curren' +
        't_date) ) then 0'
      
        '         when ( ((cp.status = 0) or (cp.status=2)) and (cp.data_' +
        'vencimento < current_date) ) then -1'
      '         when (cp.status =1) then 1'
      '         when  (cp.status = 2) then 2'
      '        end as situacao,'
      ' '
      '        case'
      
        '         when ((cp.status = 0) and (cp.data_vencimento >= curren' +
        't_date) ) then'
      '           '#39'Aberto'#39
      
        '         when ( ((cp.status = 0) or (cp.status=2)) and (cp.data_' +
        'vencimento < current_date) ) then'
      '           '#39'Vencido'#39
      '         when (cp.status =1) then'
      '          '#39'Pago'#39
      '         when  (cp.status = 2) then'
      '          '#39'Previsto'#39
      '        end as situacao_descricao,'
      ' '
      ' '
      '        cp.cod_fornecedor,'
      
        '        coalesce(f.razao_social, '#39#39') as razao_social, coalesce(f' +
        '.nome_fantasia, '#39#39') as nome_fantasia, f.cgc_cpf,'
      '        cp.data_entrada, cp.data_lancamento,'
      
        '        coalesce(cp.data_competencia, cp.data_vencimento) as dat' +
        'a_competencia, cp.data_pagamento,'
      '        cp.data_vencimento,cp.usuario_inclusao,'
      
        '        cp.usuario_baixa, cp.valor,cp.multa,(cp.valor + cp.multa' +
        ') as valor_atualizado, cp.obs,'
      
        '        cp.parcela,cp.id_conta_bancaria, cb.descricao as descric' +
        'ao_conta_bancaria,'
      
        '        cp.cod_emp_grupo, p.descricao_empresa, cp.cod_conta, coa' +
        'lesce(pc.descricao, '#39'Compras diversas'#39') as descricao_conta_geren' +
        'cial,'
      '        coalesce(cp.fixa,0) as fixa,'
      '        case'
      '         when coalesce(cp.fixa,0) = 0 then '#39'Nao'#39
      '         when coalesce(cp.fixa,0) = 1 then '#39'Sim'#39
      '        end as fixa_descricao,'
      '        coalesce(cp.conciliado,0) as conciliado,'
      '        case'
      '         when coalesce(cp.conciliado,0) = 0 then '#39'Nao'#39
      '         when coalesce(cp.conciliado,0) = 1 then '#39'Sim'#39
      '        end as conciliado_descricao,'
      '     coalesce(e.chave_nfe,'#39#39') as chave_nfe'
      ' '
      '   from contas_a_pagar cp'
      
        '     inner join fornecedor f on (f.cod_fornecedor = cp.cod_forne' +
        'cedor)'
      
        '     left join  entradas   e on (e.cod_entrada = cp.codigo_entra' +
        'da)'
      
        '     left join contas_bancarias cb on (cb.id = cp.id_conta_banca' +
        'ria)'
      
        '     left join plano_contas_financeiro pc on (pc.cod_conta = cp.' +
        'cod_conta)'
      
        '     inner join parametros p on (p.cod_empresa = cp.cod_emp_grup' +
        'o)'
      
        '       where cp.data_vencimento  between '#39'01.10.2025'#39' and '#39'31.10' +
        '.2025'#39
      ') '
      ' where 1=1 ')
    Left = 1440
    Top = 838
  end
  object dsqryContasAPagarEntradasDRE: TDataSource
    DataSet = qryContasAPagarEntradasDRE
    Left = 1572
    Top = 838
  end
end
