object dmAtualizaBase: TdmAtualizaBase
  Height = 607
  Width = 973
  object qryGrupos: TFDQuery
    FieldOptions.UpdatePersistent = True
    CachedUpdates = True
    Connection = dm.fdRestaurante
    FormatOptions.AssignedValues = [fvMaxBcdPrecision]
    FormatOptions.MaxBcdPrecision = 20
    UpdateOptions.AssignedValues = [uvUpdateChngFields, uvUpdateMode, uvLockMode, uvLockPoint, uvLockWait, uvRefreshMode, uvFetchGeneratorsPoint, uvCheckRequired, uvCheckReadOnly, uvCheckUpdatable]
    UpdateOptions.UpdateChangedFields = False
    UpdateOptions.LockWait = True
    UpdateOptions.RefreshMode = rmManual
    UpdateOptions.FetchGeneratorsPoint = gpNone
    UpdateOptions.CheckRequired = False
    UpdateOptions.CheckReadOnly = False
    UpdateOptions.CheckUpdatable = False
    UpdateObject = updQryGrupos
    SQL.Strings = (
      'select * from grupos')
    Left = 91
    Top = 40
  end
  object updQryGrupos: TFDUpdateSQL
    Connection = dm.fdRestaurante
    InsertSQL.Strings = (
      'UPDATE OR INSERT INTO GRUPOS'
      '(COD_GRUPO, DESCRICAO, RESULTADO_RD, PERC_PROJ_RD, '
      '  MOSTRA_NO_RD)'
      
        'VALUES (:NEW_COD_GRUPO, :NEW_DESCRICAO, :NEW_RESULTADO_RD, :NEW_' +
        'PERC_PROJ_RD, '
      '  :NEW_MOSTRA_NO_RD)')
    ModifySQL.Strings = (
      'UPDATE GRUPOS'
      
        'SET COD_GRUPO = :NEW_COD_GRUPO, DESCRICAO = :NEW_DESCRICAO, RESU' +
        'LTADO_RD = :NEW_RESULTADO_RD, '
      
        '  PERC_PROJ_RD = :NEW_PERC_PROJ_RD, MOSTRA_NO_RD = :NEW_MOSTRA_N' +
        'O_RD'
      'WHERE COD_GRUPO = :OLD_COD_GRUPO')
    DeleteSQL.Strings = (
      'DELETE FROM GRUPOS'
      'WHERE COD_GRUPO = :OLD_COD_GRUPO')
    FetchRowSQL.Strings = (
      
        'SELECT COD_GRUPO, DESCRICAO, RESULTADO_RD, PERC_PROJ_RD, MOSTRA_' +
        'NO_RD'
      'FROM GRUPOS'
      'WHERE COD_GRUPO = :COD_GRUPO')
    Left = 259
    Top = 39
  end
  object tsAtualizacao: TFDTransaction
    Connection = dm.fdRestaurante
    Left = 439
    Top = 23
  end
  object qryProdutos: TFDQuery
    FieldOptions.UpdatePersistent = True
    CachedUpdates = True
    Connection = dm.fdRestaurante
    FormatOptions.AssignedValues = [fvMaxBcdPrecision]
    FormatOptions.MaxBcdPrecision = 20
    UpdateOptions.AssignedValues = [uvUpdateChngFields, uvUpdateMode, uvLockMode, uvLockPoint, uvLockWait, uvRefreshMode, uvFetchGeneratorsPoint, uvCheckRequired, uvCheckReadOnly, uvCheckUpdatable]
    UpdateOptions.UpdateChangedFields = False
    UpdateOptions.LockWait = True
    UpdateOptions.RefreshMode = rmManual
    UpdateOptions.FetchGeneratorsPoint = gpNone
    UpdateOptions.CheckRequired = False
    UpdateOptions.CheckReadOnly = False
    UpdateOptions.CheckUpdatable = False
    UpdateObject = updQryProdutos
    SQL.Strings = (
      'select * from produtos')
    Left = 89
    Top = 150
  end
  object updQryProdutos: TFDUpdateSQL
    Connection = dm.fdRestaurante
    InsertSQL.Strings = (
      'update or INSERT INTO PRODUTOS'
      '(COD_PRODUTO, DESCRICAO, VALOR_UNITARIO, DATA_CADASTRO, '
      '  ULTIMA_VENDA, NUMERO_VENDAS, COD_ALIQUOTA, '
      '  CAMINHO_FOTO, COD_BARRAS, ACOMPANHAMENTO, '
      '  PERMITE_ACOMPANHAMENTO, ACOMPANHAMENTOS_FIXOS, '
      '  NUMERO_ACOMPANHAMENTOS, LUCRO_MAXIMO, LUCRO_MINIMO, '
      '  PRODUTO_FINAL, ITEM_ASSOCIADO, COD_GRUPO, '
      '  CARDAPIO, TEMPO, OBS_LANCAMENTO, COD_MINIPRINTER, '
      '  PARAMETRO_CONTAGEM, BALANCA, FRACIONADO, '
      '  PRECO_DIGITADO, INFORMAR_SABOR, COMISSIONADO, '
      '  VALOR_COMISSAO, DESCRICAO_REDUZIDA, INCIDE_SERVICO, '
      '  COUVERT, CUSTODIGITADO, CALCULA_QTDE, PIZZA, '
      '  TAM_PIZZA, IMP_DELIVERY, IMP_MESAS, IMP_BALCAO, '
      '  COMPRA, VENDE, COD_TIPO_ITEM, COD_GENERO, '
      '  NCM, IPPT, IAT, DATA_ULTIMA_REPOSICAO, '
      '  VALOR_CUSTO, QUANTIDADE_MAXIMA, QUANTIDADE_MINIMA, '
      '  ESTOQUE_LIQUIDO, UNIDADE_ENTRADA, COD_UNIDADE_FRACAO, '
      '  CFOP, CST, CFOP_SAIDA, CST_SAIDA, UN_ECF, '
      '  SUBMATERIA, CFOP_TRANSFERENCIAS, CST_TRANSFERENCIAS, '
      '  CFOP_DEVOLUCAO, CST_DEVOLUCAO, CST_PIS_COFINS, '
      '  ALIQ_PIS, ALIQ_COFINS, ESTOQUE_VISIVEL, QTD_GUARNICOES, '
      '  GUARNICOES_FIXAS, COD_GRUPO_TOUCH, DESCRICAO_TOUCH, '
      '  REQUER_OBSERVACAO, COD_GRUPO_APURACAO, RENDIMENTO, '
      '  BALANCA_LEITURA, VALOR_UNITARIO_02, CEST, '
      '  REDUCAO_BASE_ICMS, IMPRIMIR_FICHA, PERC_PERDA, '
      '  IMPOSTOS, OUTRAS_TAXAS, MAO_OBRA, ABATE_FICHA, '
      '  VALIDADE)'
      
        'VALUES (:NEW_COD_PRODUTO, :NEW_DESCRICAO, :NEW_VALOR_UNITARIO, :' +
        'NEW_DATA_CADASTRO, '
      '  :NEW_ULTIMA_VENDA, :NEW_NUMERO_VENDAS, :NEW_COD_ALIQUOTA, '
      '  :NEW_CAMINHO_FOTO, :NEW_COD_BARRAS, :NEW_ACOMPANHAMENTO, '
      '  :NEW_PERMITE_ACOMPANHAMENTO, :NEW_ACOMPANHAMENTOS_FIXOS, '
      
        '  :NEW_NUMERO_ACOMPANHAMENTOS, :NEW_LUCRO_MAXIMO, :NEW_LUCRO_MIN' +
        'IMO, '
      '  :NEW_PRODUTO_FINAL, :NEW_ITEM_ASSOCIADO, :NEW_COD_GRUPO, '
      
        '  :NEW_CARDAPIO, :NEW_TEMPO, :NEW_OBS_LANCAMENTO, :NEW_COD_MINIP' +
        'RINTER, '
      '  :NEW_PARAMETRO_CONTAGEM, :NEW_BALANCA, :NEW_FRACIONADO, '
      '  :NEW_PRECO_DIGITADO, :NEW_INFORMAR_SABOR, :NEW_COMISSIONADO, '
      
        '  :NEW_VALOR_COMISSAO, :NEW_DESCRICAO_REDUZIDA, :NEW_INCIDE_SERV' +
        'ICO, '
      
        '  :NEW_COUVERT, :NEW_CUSTODIGITADO, :NEW_CALCULA_QTDE, :NEW_PIZZ' +
        'A, '
      
        '  :NEW_TAM_PIZZA, :NEW_IMP_DELIVERY, :NEW_IMP_MESAS, :NEW_IMP_BA' +
        'LCAO, '
      '  :NEW_COMPRA, :NEW_VENDE, :NEW_COD_TIPO_ITEM, :NEW_COD_GENERO, '
      '  :NEW_NCM, :NEW_IPPT, :NEW_IAT, :NEW_DATA_ULTIMA_REPOSICAO, '
      
        '  :NEW_VALOR_CUSTO, :NEW_QUANTIDADE_MAXIMA, :NEW_QUANTIDADE_MINI' +
        'MA, '
      
        '  :NEW_ESTOQUE_LIQUIDO, :NEW_UNIDADE_ENTRADA, :NEW_COD_UNIDADE_F' +
        'RACAO, '
      
        '  :NEW_CFOP, :NEW_CST, :NEW_CFOP_SAIDA, :NEW_CST_SAIDA, :NEW_UN_' +
        'ECF, '
      
        '  :NEW_SUBMATERIA, :NEW_CFOP_TRANSFERENCIAS, :NEW_CST_TRANSFEREN' +
        'CIAS, '
      '  :NEW_CFOP_DEVOLUCAO, :NEW_CST_DEVOLUCAO, :NEW_CST_PIS_COFINS, '
      
        '  :NEW_ALIQ_PIS, :NEW_ALIQ_COFINS, :NEW_ESTOQUE_VISIVEL, :NEW_QT' +
        'D_GUARNICOES, '
      
        '  :NEW_GUARNICOES_FIXAS, :NEW_COD_GRUPO_TOUCH, :NEW_DESCRICAO_TO' +
        'UCH, '
      
        '  :NEW_REQUER_OBSERVACAO, :NEW_COD_GRUPO_APURACAO, :NEW_RENDIMEN' +
        'TO, '
      '  :NEW_BALANCA_LEITURA, :NEW_VALOR_UNITARIO_02, :NEW_CEST, '
      '  :NEW_REDUCAO_BASE_ICMS, :NEW_IMPRIMIR_FICHA, :NEW_PERC_PERDA, '
      
        '  :NEW_IMPOSTOS, :NEW_OUTRAS_TAXAS, :NEW_MAO_OBRA, :NEW_ABATE_FI' +
        'CHA, '
      '  :NEW_VALIDADE)')
    ModifySQL.Strings = (
      'UPDATE PRODUTOS'
      'SET COD_PRODUTO = :NEW_COD_PRODUTO, DESCRICAO = :NEW_DESCRICAO, '
      
        '  VALOR_UNITARIO = :NEW_VALOR_UNITARIO, DATA_CADASTRO = :NEW_DAT' +
        'A_CADASTRO, '
      
        '  ULTIMA_VENDA = :NEW_ULTIMA_VENDA, NUMERO_VENDAS = :NEW_NUMERO_' +
        'VENDAS, '
      
        '  COD_ALIQUOTA = :NEW_COD_ALIQUOTA, CAMINHO_FOTO = :NEW_CAMINHO_' +
        'FOTO, '
      
        '  COD_BARRAS = :NEW_COD_BARRAS, ACOMPANHAMENTO = :NEW_ACOMPANHAM' +
        'ENTO, '
      
        '  PERMITE_ACOMPANHAMENTO = :NEW_PERMITE_ACOMPANHAMENTO, ACOMPANH' +
        'AMENTOS_FIXOS = :NEW_ACOMPANHAMENTOS_FIXOS, '
      
        '  NUMERO_ACOMPANHAMENTOS = :NEW_NUMERO_ACOMPANHAMENTOS, LUCRO_MA' +
        'XIMO = :NEW_LUCRO_MAXIMO, '
      
        '  LUCRO_MINIMO = :NEW_LUCRO_MINIMO, PRODUTO_FINAL = :NEW_PRODUTO' +
        '_FINAL, '
      
        '  ITEM_ASSOCIADO = :NEW_ITEM_ASSOCIADO, COD_GRUPO = :NEW_COD_GRU' +
        'PO, '
      
        '  CARDAPIO = :NEW_CARDAPIO, TEMPO = :NEW_TEMPO, OBS_LANCAMENTO =' +
        ' :NEW_OBS_LANCAMENTO, '
      
        '  COD_MINIPRINTER = :NEW_COD_MINIPRINTER, PARAMETRO_CONTAGEM = :' +
        'NEW_PARAMETRO_CONTAGEM, '
      
        '  BALANCA = :NEW_BALANCA, FRACIONADO = :NEW_FRACIONADO, PRECO_DI' +
        'GITADO = :NEW_PRECO_DIGITADO, '
      
        '  INFORMAR_SABOR = :NEW_INFORMAR_SABOR, COMISSIONADO = :NEW_COMI' +
        'SSIONADO, '
      
        '  VALOR_COMISSAO = :NEW_VALOR_COMISSAO, DESCRICAO_REDUZIDA = :NE' +
        'W_DESCRICAO_REDUZIDA, '
      '  INCIDE_SERVICO = :NEW_INCIDE_SERVICO, COUVERT = :NEW_COUVERT, '
      
        '  CUSTODIGITADO = :NEW_CUSTODIGITADO, CALCULA_QTDE = :NEW_CALCUL' +
        'A_QTDE, '
      
        '  PIZZA = :NEW_PIZZA, TAM_PIZZA = :NEW_TAM_PIZZA, IMP_DELIVERY =' +
        ' :NEW_IMP_DELIVERY, '
      '  IMP_MESAS = :NEW_IMP_MESAS, IMP_BALCAO = :NEW_IMP_BALCAO, '
      
        '  COMPRA = :NEW_COMPRA, VENDE = :NEW_VENDE, COD_TIPO_ITEM = :NEW' +
        '_COD_TIPO_ITEM, '
      
        '  COD_GENERO = :NEW_COD_GENERO, NCM = :NEW_NCM, IPPT = :NEW_IPPT' +
        ', '
      
        '  IAT = :NEW_IAT, DATA_ULTIMA_REPOSICAO = :NEW_DATA_ULTIMA_REPOS' +
        'ICAO, '
      
        '  VALOR_CUSTO = :NEW_VALOR_CUSTO, QUANTIDADE_MAXIMA = :NEW_QUANT' +
        'IDADE_MAXIMA, '
      
        '  QUANTIDADE_MINIMA = :NEW_QUANTIDADE_MINIMA, ESTOQUE_LIQUIDO = ' +
        ':NEW_ESTOQUE_LIQUIDO, '
      
        '  UNIDADE_ENTRADA = :NEW_UNIDADE_ENTRADA, COD_UNIDADE_FRACAO = :' +
        'NEW_COD_UNIDADE_FRACAO, '
      
        '  CFOP = :NEW_CFOP, CST = :NEW_CST, CFOP_SAIDA = :NEW_CFOP_SAIDA' +
        ', '
      
        '  CST_SAIDA = :NEW_CST_SAIDA, UN_ECF = :NEW_UN_ECF, SUBMATERIA =' +
        ' :NEW_SUBMATERIA, '
      
        '  CFOP_TRANSFERENCIAS = :NEW_CFOP_TRANSFERENCIAS, CST_TRANSFEREN' +
        'CIAS = :NEW_CST_TRANSFERENCIAS, '
      
        '  CFOP_DEVOLUCAO = :NEW_CFOP_DEVOLUCAO, CST_DEVOLUCAO = :NEW_CST' +
        '_DEVOLUCAO, '
      
        '  CST_PIS_COFINS = :NEW_CST_PIS_COFINS, ALIQ_PIS = :NEW_ALIQ_PIS' +
        ', '
      
        '  ALIQ_COFINS = :NEW_ALIQ_COFINS, ESTOQUE_VISIVEL = :NEW_ESTOQUE' +
        '_VISIVEL, '
      
        '  QTD_GUARNICOES = :NEW_QTD_GUARNICOES, GUARNICOES_FIXAS = :NEW_' +
        'GUARNICOES_FIXAS, '
      
        '  COD_GRUPO_TOUCH = :NEW_COD_GRUPO_TOUCH, DESCRICAO_TOUCH = :NEW' +
        '_DESCRICAO_TOUCH, '
      
        '  REQUER_OBSERVACAO = :NEW_REQUER_OBSERVACAO, COD_GRUPO_APURACAO' +
        ' = :NEW_COD_GRUPO_APURACAO, '
      
        '  RENDIMENTO = :NEW_RENDIMENTO, BALANCA_LEITURA = :NEW_BALANCA_L' +
        'EITURA, '
      '  VALOR_UNITARIO_02 = :NEW_VALOR_UNITARIO_02, CEST = :NEW_CEST, '
      
        '  REDUCAO_BASE_ICMS = :NEW_REDUCAO_BASE_ICMS, IMPRIMIR_FICHA = :' +
        'NEW_IMPRIMIR_FICHA, '
      '  PERC_PERDA = :NEW_PERC_PERDA, IMPOSTOS = :NEW_IMPOSTOS, '
      '  OUTRAS_TAXAS = :NEW_OUTRAS_TAXAS, MAO_OBRA = :NEW_MAO_OBRA, '
      '  ABATE_FICHA = :NEW_ABATE_FICHA, VALIDADE = :NEW_VALIDADE'
      'WHERE COD_PRODUTO = :OLD_COD_PRODUTO')
    DeleteSQL.Strings = (
      'DELETE FROM PRODUTOS'
      'WHERE COD_PRODUTO = :OLD_COD_PRODUTO')
    FetchRowSQL.Strings = (
      
        'SELECT COD_PRODUTO, DESCRICAO, VALOR_UNITARIO, DATA_CADASTRO, UL' +
        'TIMA_VENDA, '
      
        '  NUMERO_VENDAS, COD_ALIQUOTA, CAMINHO_FOTO, COD_BARRAS, ACOMPAN' +
        'HAMENTO, '
      
        '  PERMITE_ACOMPANHAMENTO, ACOMPANHAMENTOS_FIXOS, NUMERO_ACOMPANH' +
        'AMENTOS, '
      '  LUCRO_MAXIMO, LUCRO_MINIMO, PRODUTO_FINAL, ITEM_ASSOCIADO, '
      '  COD_GRUPO, CARDAPIO, TEMPO, OBS_LANCAMENTO, COD_MINIPRINTER, '
      '  PARAMETRO_CONTAGEM, BALANCA, FRACIONADO, PRECO_DIGITADO, '
      
        '  INFORMAR_SABOR, COMISSIONADO, VALOR_COMISSAO, DESCRICAO_REDUZI' +
        'DA, '
      '  INCIDE_SERVICO, COUVERT, CUSTODIGITADO, CALCULA_QTDE, PIZZA, '
      '  TAM_PIZZA, IMP_DELIVERY, IMP_MESAS, IMP_BALCAO, COMPRA, '
      
        '  VENDE, COD_TIPO_ITEM, COD_GENERO, NCM, IPPT, IAT, DATA_ULTIMA_' +
        'REPOSICAO, '
      
        '  VALOR_CUSTO, QUANTIDADE_MAXIMA, QUANTIDADE_MINIMA, ESTOQUE_LIQ' +
        'UIDO, '
      '  UNIDADE_ENTRADA, COD_UNIDADE_FRACAO, CFOP, CST, CFOP_SAIDA, '
      
        '  CST_SAIDA, UN_ECF, SUBMATERIA, CFOP_TRANSFERENCIAS, CST_TRANSF' +
        'ERENCIAS, '
      '  CFOP_DEVOLUCAO, CST_DEVOLUCAO, CST_PIS_COFINS, ALIQ_PIS, '
      
        '  ALIQ_COFINS, ESTOQUE_VISIVEL, QTD_GUARNICOES, GUARNICOES_FIXAS' +
        ', '
      
        '  COD_GRUPO_TOUCH, DESCRICAO_TOUCH, REQUER_OBSERVACAO, COD_GRUPO' +
        '_APURACAO, '
      
        '  RENDIMENTO, BALANCA_LEITURA, VALOR_UNITARIO_02, CEST, REDUCAO_' +
        'BASE_ICMS, '
      '  IMPRIMIR_FICHA, PERC_PERDA, IMPOSTOS, OUTRAS_TAXAS, MAO_OBRA, '
      '  ABATE_FICHA, VALIDADE'
      'FROM PRODUTOS'
      'WHERE COD_PRODUTO = :COD_PRODUTO')
    Left = 258
    Top = 150
  end
  object qryGruposAdicionais: TFDQuery
    FieldOptions.UpdatePersistent = True
    CachedUpdates = True
    Connection = dm.fdRestaurante
    FormatOptions.AssignedValues = [fvMaxBcdPrecision]
    FormatOptions.MaxBcdPrecision = 20
    UpdateOptions.AssignedValues = [uvUpdateChngFields, uvUpdateMode, uvLockMode, uvLockPoint, uvLockWait, uvRefreshMode, uvFetchGeneratorsPoint, uvCheckRequired, uvCheckReadOnly, uvCheckUpdatable]
    UpdateOptions.UpdateChangedFields = False
    UpdateOptions.LockWait = True
    UpdateOptions.RefreshMode = rmManual
    UpdateOptions.FetchGeneratorsPoint = gpNone
    UpdateOptions.CheckRequired = False
    UpdateOptions.CheckReadOnly = False
    UpdateOptions.CheckUpdatable = False
    UpdateObject = updGruposAdicionais
    SQL.Strings = (
      'select * from grupos_adicionais')
    Left = 89
    Top = 206
  end
  object updGruposAdicionais: TFDUpdateSQL
    Connection = dm.fdRestaurante
    InsertSQL.Strings = (
      'update or INSERT INTO GRUPOS_ADICIONAIS'
      '(ID, NOME, DESCRICAO, QTD_MIN, QTD_MAX, '
      '  TIPO, COD_PRODUTO, UNICO)'
      
        'VALUES (:NEW_ID, :NEW_NOME, :NEW_DESCRICAO, :NEW_QTD_MIN, :NEW_Q' +
        'TD_MAX, '
      '  :NEW_TIPO, :NEW_COD_PRODUTO, :NEW_UNICO)')
    ModifySQL.Strings = (
      'UPDATE GRUPOS_ADICIONAIS'
      'SET ID = :NEW_ID, NOME = :NEW_NOME, DESCRICAO = :NEW_DESCRICAO, '
      
        '  QTD_MIN = :NEW_QTD_MIN, QTD_MAX = :NEW_QTD_MAX, TIPO = :NEW_TI' +
        'PO, '
      '  COD_PRODUTO = :NEW_COD_PRODUTO, UNICO = :NEW_UNICO'
      'WHERE ID = :OLD_ID')
    DeleteSQL.Strings = (
      'DELETE FROM GRUPOS_ADICIONAIS'
      'WHERE ID = :OLD_ID')
    FetchRowSQL.Strings = (
      
        'SELECT ID, NOME, DESCRICAO, QTD_MIN, QTD_MAX, TIPO, COD_PRODUTO,' +
        ' UNICO'
      'FROM GRUPOS_ADICIONAIS'
      'WHERE ID = :ID')
    Left = 258
    Top = 205
  end
  object qryProdutosGruposAdicionais: TFDQuery
    FieldOptions.UpdatePersistent = True
    CachedUpdates = True
    Connection = dm.fdRestaurante
    FormatOptions.AssignedValues = [fvMaxBcdPrecision]
    FormatOptions.MaxBcdPrecision = 20
    UpdateOptions.AssignedValues = [uvUpdateChngFields, uvUpdateMode, uvLockMode, uvLockPoint, uvLockWait, uvRefreshMode, uvFetchGeneratorsPoint, uvCheckRequired, uvCheckReadOnly, uvCheckUpdatable]
    UpdateOptions.UpdateChangedFields = False
    UpdateOptions.LockWait = True
    UpdateOptions.RefreshMode = rmManual
    UpdateOptions.FetchGeneratorsPoint = gpNone
    UpdateOptions.CheckRequired = False
    UpdateOptions.CheckReadOnly = False
    UpdateOptions.CheckUpdatable = False
    UpdateObject = updProdutosGruposAdicionais
    SQL.Strings = (
      
        'select * from produtos_grupos_adicionais  where id=-1 order by i' +
        'd ')
    Left = 89
    Top = 321
  end
  object updProdutosGruposAdicionais: TFDUpdateSQL
    Connection = dm.fdRestaurante
    InsertSQL.Strings = (
      'update or INSERT INTO PRODUTOS_GRUPOS_ADICIONAIS'
      '(ID, ID_GRUPO, COD_PRODUTO, VALOR, DESCRICAO, '
      '  QTD, TIPO)'
      
        'VALUES (:NEW_ID, :NEW_ID_GRUPO, :NEW_COD_PRODUTO, :NEW_VALOR, :N' +
        'EW_DESCRICAO, '
      '  :NEW_QTD, :NEW_TIPO)')
    ModifySQL.Strings = (
      'UPDATE PRODUTOS_GRUPOS_ADICIONAIS'
      
        'SET ID = :NEW_ID, ID_GRUPO = :NEW_ID_GRUPO, COD_PRODUTO = :NEW_C' +
        'OD_PRODUTO, '
      
        '  VALOR = :NEW_VALOR, DESCRICAO = :NEW_DESCRICAO, QTD = :NEW_QTD' +
        ', '
      '  TIPO = :NEW_TIPO'
      'WHERE ID = :OLD_ID')
    DeleteSQL.Strings = (
      'DELETE FROM PRODUTOS_GRUPOS_ADICIONAIS'
      'WHERE ID = :OLD_ID')
    FetchRowSQL.Strings = (
      'SELECT ID, ID_GRUPO, COD_PRODUTO, VALOR, DESCRICAO, QTD, TIPO'
      'FROM PRODUTOS_GRUPOS_ADICIONAIS'
      'WHERE ID = :ID')
    Left = 258
    Top = 325
  end
  object qryGruposTouch: TFDQuery
    FieldOptions.UpdatePersistent = True
    CachedUpdates = True
    Connection = dm.fdRestaurante
    FormatOptions.AssignedValues = [fvMaxBcdPrecision]
    FormatOptions.MaxBcdPrecision = 20
    UpdateOptions.AssignedValues = [uvUpdateChngFields, uvUpdateMode, uvLockMode, uvLockPoint, uvLockWait, uvRefreshMode, uvFetchGeneratorsPoint, uvCheckRequired, uvCheckReadOnly, uvCheckUpdatable]
    UpdateOptions.UpdateChangedFields = False
    UpdateOptions.LockWait = True
    UpdateOptions.RefreshMode = rmManual
    UpdateOptions.FetchGeneratorsPoint = gpNone
    UpdateOptions.CheckRequired = False
    UpdateOptions.CheckReadOnly = False
    UpdateOptions.CheckUpdatable = False
    UpdateObject = updGruposTouch
    SQL.Strings = (
      'select * from grupos_touch gt where gt.codigo =-1')
    Left = 91
    Top = 96
  end
  object updGruposTouch: TFDUpdateSQL
    Connection = dm.fdRestaurante
    InsertSQL.Strings = (
      'update or INSERT INTO GRUPOS_TOUCH'
      '(CODIGO, DESCRICAO, ORDEM, COD_GRUPO, IMAGEM)'
      
        'VALUES (:NEW_CODIGO, :NEW_DESCRICAO, :NEW_ORDEM, :NEW_COD_GRUPO,' +
        ' :NEW_IMAGEM)')
    ModifySQL.Strings = (
      'UPDATE GRUPOS_TOUCH'
      
        'SET CODIGO = :NEW_CODIGO, DESCRICAO = :NEW_DESCRICAO, ORDEM = :N' +
        'EW_ORDEM, '
      '  COD_GRUPO = :NEW_COD_GRUPO, IMAGEM = :NEW_IMAGEM'
      'WHERE CODIGO = :OLD_CODIGO')
    DeleteSQL.Strings = (
      'DELETE FROM GRUPOS_TOUCH'
      'WHERE CODIGO = :OLD_CODIGO')
    FetchRowSQL.Strings = (
      'SELECT CODIGO, DESCRICAO, ORDEM, COD_GRUPO, IMAGEM'
      'FROM GRUPOS_TOUCH'
      'WHERE CODIGO = :CODIGO')
    Left = 259
    Top = 95
  end
  object qryUsuarios: TFDQuery
    FieldOptions.UpdatePersistent = True
    CachedUpdates = True
    Connection = dm.fdRestaurante
    FormatOptions.AssignedValues = [fvMaxBcdPrecision]
    FormatOptions.MaxBcdPrecision = 20
    UpdateOptions.AssignedValues = [uvUpdateChngFields, uvUpdateMode, uvLockMode, uvLockPoint, uvLockWait, uvRefreshMode, uvFetchGeneratorsPoint, uvCheckRequired, uvCheckReadOnly, uvCheckUpdatable]
    UpdateOptions.UpdateChangedFields = False
    UpdateOptions.LockWait = True
    UpdateOptions.RefreshMode = rmManual
    UpdateOptions.FetchGeneratorsPoint = gpNone
    UpdateOptions.CheckRequired = False
    UpdateOptions.CheckReadOnly = False
    UpdateOptions.CheckUpdatable = False
    UpdateObject = updUsuarios
    SQL.Strings = (
      ''
      ''
      ''
      ''
      ' select u.cod_usuario, u.nome_usuario,'
      '        u.login, u.funcao, u.entradas, u.acesso'
      '      from usuarios u'
      '        where u.cod_usuario=-1')
    Left = 89
    Top = 385
  end
  object updUsuarios: TFDUpdateSQL
    Connection = dm.fdRestaurante
    InsertSQL.Strings = (
      'update or INSERT INTO USUARIOS'
      '(COD_USUARIO, NOME_USUARIO, FUNCAO, LOGIN, '
      '  ENTRADAS, ACESSO)'
      
        'VALUES (:NEW_COD_USUARIO, :NEW_NOME_USUARIO, :NEW_FUNCAO, :NEW_L' +
        'OGIN, '
      '  :NEW_ENTRADAS, :NEW_ACESSO)')
    ModifySQL.Strings = (
      'UPDATE USUARIOS'
      
        'SET COD_USUARIO = :NEW_COD_USUARIO, NOME_USUARIO = :NEW_NOME_USU' +
        'ARIO, '
      
        '  FUNCAO = :NEW_FUNCAO, LOGIN = :NEW_LOGIN, ENTRADAS = :NEW_ENTR' +
        'ADAS, '
      '  ACESSO = :NEW_ACESSO'
      'WHERE COD_USUARIO = :OLD_COD_USUARIO')
    DeleteSQL.Strings = (
      'DELETE FROM USUARIOS'
      'WHERE COD_USUARIO = :OLD_COD_USUARIO')
    FetchRowSQL.Strings = (
      
        'SELECT COD_USUARIO, NOME_USUARIO, FUNCAO, LOGIN, SENHA, ENTRADAS' +
        ', ACESSO'
      'FROM USUARIOS'
      'WHERE COD_USUARIO = :COD_USUARIO')
    Left = 258
    Top = 389
  end
  object qryPermissoes: TFDQuery
    FieldOptions.UpdatePersistent = True
    CachedUpdates = True
    Connection = dm.fdRestaurante
    FormatOptions.AssignedValues = [fvMaxBcdPrecision]
    FormatOptions.MaxBcdPrecision = 20
    UpdateOptions.AssignedValues = [uvUpdateChngFields, uvUpdateMode, uvLockMode, uvLockPoint, uvLockWait, uvRefreshMode, uvFetchGeneratorsPoint, uvCheckRequired, uvCheckReadOnly, uvCheckUpdatable]
    UpdateOptions.UpdateChangedFields = False
    UpdateOptions.LockWait = True
    UpdateOptions.RefreshMode = rmManual
    UpdateOptions.FetchGeneratorsPoint = gpNone
    UpdateOptions.CheckRequired = False
    UpdateOptions.CheckReadOnly = False
    UpdateOptions.CheckUpdatable = False
    UpdateObject = updPermissoes
    SQL.Strings = (
      ''
      ' select  * from permissoes p'
      '  where p.cod_usuario =-1')
    Left = 89
    Top = 449
  end
  object updPermissoes: TFDUpdateSQL
    Connection = dm.fdRestaurante
    InsertSQL.Strings = (
      'update or INSERT INTO PERMISSOES'
      '(COD_USUARIO, COD_MODULO, COD_MOD, PERMITE)'
      
        'VALUES (:NEW_COD_USUARIO, :NEW_COD_MODULO, :NEW_COD_MOD, :NEW_PE' +
        'RMITE)')
    ModifySQL.Strings = (
      'UPDATE PERMISSOES'
      
        'SET COD_USUARIO = :NEW_COD_USUARIO, COD_MODULO = :NEW_COD_MODULO' +
        ', '
      '  COD_MOD = :NEW_COD_MOD, PERMITE = :NEW_PERMITE'
      
        'WHERE COD_USUARIO = :OLD_COD_USUARIO AND COD_MODULO = :OLD_COD_M' +
        'ODULO AND '
      '  COD_MOD = :OLD_COD_MOD')
    DeleteSQL.Strings = (
      'DELETE FROM PERMISSOES'
      
        'WHERE COD_USUARIO = :OLD_COD_USUARIO AND COD_MODULO = :OLD_COD_M' +
        'ODULO AND '
      '  COD_MOD = :OLD_COD_MOD')
    FetchRowSQL.Strings = (
      'SELECT COD_USUARIO, COD_MODULO, COD_MOD, PERMITE'
      'FROM PERMISSOES'
      
        'WHERE COD_USUARIO = :COD_USUARIO AND COD_MODULO = :COD_MODULO AN' +
        'D '
      '  COD_MOD = :COD_MOD')
    Left = 258
    Top = 445
  end
  object qryModulos: TFDQuery
    FieldOptions.UpdatePersistent = True
    CachedUpdates = True
    Connection = dm.fdRestaurante
    FormatOptions.AssignedValues = [fvMaxBcdPrecision]
    FormatOptions.MaxBcdPrecision = 20
    UpdateOptions.AssignedValues = [uvUpdateChngFields, uvUpdateMode, uvLockMode, uvLockPoint, uvLockWait, uvRefreshMode, uvFetchGeneratorsPoint, uvCheckRequired, uvCheckReadOnly, uvCheckUpdatable]
    UpdateOptions.UpdateChangedFields = False
    UpdateOptions.LockWait = True
    UpdateOptions.RefreshMode = rmManual
    UpdateOptions.FetchGeneratorsPoint = gpNone
    UpdateOptions.CheckRequired = False
    UpdateOptions.CheckReadOnly = False
    UpdateOptions.CheckUpdatable = False
    UpdateObject = updModulos
    SQL.Strings = (
      ''
      'select * from modulos'
      ' where cod_modulo=-1  order by cod_modulo, cod_mod')
    Left = 81
    Top = 521
  end
  object updModulos: TFDUpdateSQL
    Connection = dm.fdRestaurante
    InsertSQL.Strings = (
      'update or INSERT INTO MODULOS'
      '(COD_MODULO, DESCRICAO, COD_MOD)'
      'VALUES (:NEW_COD_MODULO, :NEW_DESCRICAO, :NEW_COD_MOD)')
    ModifySQL.Strings = (
      'UPDATE MODULOS'
      
        'SET COD_MODULO = :NEW_COD_MODULO, DESCRICAO = :NEW_DESCRICAO, CO' +
        'D_MOD = :NEW_COD_MOD'
      'WHERE COD_MODULO = :OLD_COD_MODULO AND COD_MOD = :OLD_COD_MOD')
    DeleteSQL.Strings = (
      'DELETE FROM MODULOS'
      'WHERE COD_MODULO = :OLD_COD_MODULO AND COD_MOD = :OLD_COD_MOD')
    FetchRowSQL.Strings = (
      'SELECT COD_MODULO, DESCRICAO, COD_MOD'
      'FROM MODULOS'
      'WHERE COD_MODULO = :COD_MODULO AND COD_MOD = :COD_MOD')
    Left = 250
    Top = 525
  end
end
