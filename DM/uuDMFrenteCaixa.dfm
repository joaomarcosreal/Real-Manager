object dmFrenteCaixa: TdmFrenteCaixa
  OldCreateOrder = False
  Height = 408
  Width = 1021
  object qryGruposTouch: TIBQuery
    Database = dm.dbrestaurante
    Transaction = tsGruposTouch
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      'select * from grupos_touch gt where gt.codigo in'
      ' ( select distinct p.cod_grupo_touch  from produtos p'
      '     where p.vende =1)'
      'and gt.codigo <> '#39'00'#39
      ' order by ordem')
    Left = 32
    Top = 16
  end
  object tsGruposTouch: TIBTransaction
    DefaultDatabase = dm.dbrestaurante
    Left = 40
    Top = 136
  end
  object qryProdutosTouch: TIBQuery
    Database = dm.dbrestaurante
    Transaction = tsGruposTouch
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      
        'select p.cod_produto, p.cod_barras, p.cod_grupo_touch, p.descric' +
        'ao, p.valor_unitario  from produtos p')
    Left = 32
    Top = 72
    object qryProdutosTouchCOD_PRODUTO: TIBStringField
      FieldName = 'COD_PRODUTO'
      Origin = '"PRODUTOS"."COD_PRODUTO"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 5
    end
    object qryProdutosTouchCOD_BARRAS: TIBStringField
      FieldName = 'COD_BARRAS'
      Origin = '"PRODUTOS"."COD_BARRAS"'
    end
    object qryProdutosTouchCOD_GRUPO_TOUCH: TIBStringField
      FieldName = 'COD_GRUPO_TOUCH'
      Origin = '"PRODUTOS"."COD_GRUPO_TOUCH"'
      Size = 2
    end
    object qryProdutosTouchDESCRICAO: TIBStringField
      FieldName = 'DESCRICAO'
      Origin = '"PRODUTOS"."DESCRICAO"'
      Required = True
      Size = 80
    end
    object qryProdutosTouchVALOR_UNITARIO: TIBBCDField
      FieldName = 'VALOR_UNITARIO'
      Origin = '"PRODUTOS"."VALOR_UNITARIO"'
      Required = True
      currency = True
      Precision = 18
      Size = 2
    end
  end
  object dsGruposTouch: TDataSource
    DataSet = qryGruposTouch
    Left = 120
    Top = 16
  end
  object dsProdutosTouch: TDataSource
    DataSet = qryProdutosTouch
    Left = 128
    Top = 64
  end
end
