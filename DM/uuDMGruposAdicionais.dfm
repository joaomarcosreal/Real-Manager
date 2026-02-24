object dmGruposAdicionais: TdmGruposAdicionais
  OnDestroy = DataModuleDestroy
  Height = 315
  Width = 514
  object qryGruposAdicionais: TFDQuery
    FieldOptions.UpdatePersistent = True
    Connection = dm.fdRestaurante
    FormatOptions.AssignedValues = [fvMaxBcdPrecision]
    FormatOptions.MaxBcdPrecision = 20
    SQL.Strings = (
      ''
      
        ' SELECT ga.id, ga.nome, ga.descricao,coalesce(ga.qtd_min,1) qtdM' +
        'in,'
      
        '        coalesce(ga.qtd_max,0) as qtdMax, coalesce(ga.tipo,0) as' +
        ' tipo,'
      '        ga.cod_produto,coalesce(ga.unico,0) as unico,'
      '  CASE'
      '   WHEN COALESCE(ga.tipo,0) = 0 THEN '#39'Opcional'#39
      '   WHEN COALESCE(ga.tipo,0) = 1 THEN '#39'Obrigat'#243'rio'#39
      '   WHEN COALESCE(ga.tipo,0) = 2 THEN '#39'Fixo'#39
      '  END as descricaoTipo'
      '  FROM grupos_adicionais ga')
    Left = 56
    Top = 64
  end
  object dsGruposAdicionais: TDataSource
    DataSet = qryGruposAdicionais
    Left = 224
    Top = 64
  end
  object qryProdutosGruposAdicionais: TFDQuery
    FieldOptions.UpdatePersistent = True
    CachedUpdates = True
    Connection = dm.fdRestaurante
    FormatOptions.AssignedValues = [fvMaxBcdPrecision]
    FormatOptions.MaxBcdPrecision = 20
    UpdateObject = updProdutosGruposAdicionais
    SQL.Strings = (
      ' select id, id_grupo,cod_produto, descricao,valor, qtd,'
      '  case '
      '   when tipo = 0 then '#39'Observa'#231#227'o'#39
      '   when tipo = 1 then '#39#205'tem adicional'#39
      '  end as tipo'
      ''
      '   from produtos_grupos_adicionais pga'
      '  where id_grupo = :vpIdGrupo'
      '  order by id')
    Left = 56
    Top = 120
    ParamData = <
      item
        Name = 'VPIDGRUPO'
        DataType = ftLargeint
        ParamType = ptInput
        Value = Null
      end>
  end
  object dsQryProdutosGruposAdicionais: TDataSource
    DataSet = qryProdutosGruposAdicionais
    Left = 224
    Top = 120
  end
  object updProdutosGruposAdicionais: TFDUpdateSQL
    Connection = dm.fdRestaurante
    InsertSQL.Strings = (
      'INSERT INTO PRODUTOS_GRUPOS_ADICIONAIS'
      '(ID, ID_GRUPO, COD_PRODUTO, VALOR, DESCRICAO, '
      '  QTD)'
      
        'VALUES (:NEW_ID, :NEW_ID_GRUPO, :NEW_COD_PRODUTO, :NEW_VALOR, :N' +
        'EW_DESCRICAO, '
      '  :NEW_QTD)'
      'RETURNING TIPO')
    ModifySQL.Strings = (
      'UPDATE PRODUTOS_GRUPOS_ADICIONAIS'
      
        'SET ID = :NEW_ID, ID_GRUPO = :NEW_ID_GRUPO, COD_PRODUTO = :NEW_C' +
        'OD_PRODUTO, '
      '  VALOR = :NEW_VALOR, DESCRICAO = :NEW_DESCRICAO, QTD = :NEW_QTD'
      'WHERE ID = :OLD_ID'
      'RETURNING TIPO')
    DeleteSQL.Strings = (
      'DELETE FROM PRODUTOS_GRUPOS_ADICIONAIS'
      'WHERE ID = :OLD_ID')
    FetchRowSQL.Strings = (
      'SELECT ID, ID_GRUPO, COD_PRODUTO, VALOR, DESCRICAO, QTD, TIPO'
      'FROM PRODUTOS_GRUPOS_ADICIONAIS'
      'WHERE ID = :ID')
    Left = 56
    Top = 176
  end
end
