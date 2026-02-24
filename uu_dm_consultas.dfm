object dm_consultas: Tdm_consultas
  OldCreateOrder = False
  Height = 528
  Width = 905
  object qryTiposClientes: TIBQuery
    Database = dm.dbrestaurante
    Transaction = tsConsultas
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      ''
      ''
      'select cod_produto, descricao from produtos p'
      ' where p.compra =1'
      ' order by descricao')
    Left = 40
    Top = 23
  end
  object dsTiposClientes: TDataSource
    DataSet = qryTiposClientes
    Left = 107
    Top = 24
  end
  object qryUnidades: TIBQuery
    Database = dm.dbrestaurante
    Transaction = tsConsultas
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      'select * from unidades')
    Left = 36
    Top = 72
    object qryUnidadesCOD_UNIDADE: TIBStringField
      FieldName = 'COD_UNIDADE'
      Origin = '"UNIDADES"."COD_UNIDADE"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 2
    end
    object qryUnidadesDESCRICAO: TIBStringField
      FieldName = 'DESCRICAO'
      Origin = '"UNIDADES"."DESCRICAO"'
      Size = 25
    end
    object qryUnidadesSIGLA: TIBStringField
      FieldName = 'SIGLA'
      Origin = '"UNIDADES"."SIGLA"'
      Size = 5
    end
    object qryUnidadesPARAMETRO: TIBBCDField
      FieldName = 'PARAMETRO'
      Origin = '"UNIDADES"."PARAMETRO"'
      Precision = 18
      Size = 3
    end
    object qryUnidadesCOD_PADRAO: TIBStringField
      FieldName = 'COD_PADRAO'
      Origin = '"UNIDADES"."COD_PADRAO"'
      Size = 2
    end
  end
  object dsUnidades: TDataSource
    DataSet = qryUnidades
    Left = 107
    Top = 72
  end
  object qryInsumos: TIBQuery
    Database = dm.dbrestaurante
    Transaction = tsConsultas
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      ''
      ''
      
        'select p.cod_produto, p.descricao, g.descricao as grupo from pro' +
        'dutos p'
      '  inner join grupos g on (g.cod_grupo = p.cod_grupo)'
      ' where p.compra =1'
      ' order by descricao')
    Left = 32
    Top = 120
    object qryInsumosCOD_PRODUTO: TIBStringField
      FieldName = 'COD_PRODUTO'
      Origin = '"PRODUTOS"."COD_PRODUTO"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 5
    end
    object qryInsumosDESCRICAO: TIBStringField
      FieldName = 'DESCRICAO'
      Origin = '"PRODUTOS"."DESCRICAO"'
      Required = True
      Size = 40
    end
    object qryInsumosGRUPO: TIBStringField
      FieldName = 'GRUPO'
      Origin = '"GRUPOS"."DESCRICAO"'
      Size = 30
    end
  end
  object dsInsumos: TDataSource
    DataSet = qryInsumos
    Left = 107
    Top = 120
  end
  object tsConsultas: TIBTransaction
    DefaultDatabase = dm.dbrestaurante
    Left = 179
    Top = 24
  end
  object qryUnidadeCompra: TIBQuery
    Database = dm.dbrestaurante
    Transaction = tsConsultas
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      'select * from unidades')
    Left = 35
    Top = 176
    object qryUnidadeCompraCOD_UNIDADE: TIBStringField
      FieldName = 'COD_UNIDADE'
      Origin = '"UNIDADES"."COD_UNIDADE"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 2
    end
    object qryUnidadeCompraDESCRICAO: TIBStringField
      FieldName = 'DESCRICAO'
      Origin = '"UNIDADES"."DESCRICAO"'
      Size = 25
    end
    object qryUnidadeCompraSIGLA: TIBStringField
      FieldName = 'SIGLA'
      Origin = '"UNIDADES"."SIGLA"'
      Size = 5
    end
    object qryUnidadeCompraPARAMETRO: TIBBCDField
      FieldName = 'PARAMETRO'
      Origin = '"UNIDADES"."PARAMETRO"'
      Precision = 18
      Size = 3
    end
    object qryUnidadeCompraCOD_PADRAO: TIBStringField
      FieldName = 'COD_PADRAO'
      Origin = '"UNIDADES"."COD_PADRAO"'
      Size = 2
    end
  end
  object dsUnidadeCompra: TDataSource
    DataSet = qryUnidadeCompra
    Left = 106
    Top = 176
  end
  object qryUnidadeFracao: TIBQuery
    Database = dm.dbrestaurante
    Transaction = tsConsultas
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      'select * from unidades')
    Left = 35
    Top = 224
    object qryUnidadeFracaoCOD_UNIDADE: TIBStringField
      FieldName = 'COD_UNIDADE'
      Origin = '"UNIDADES"."COD_UNIDADE"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 2
    end
    object qryUnidadeFracaoDESCRICAO: TIBStringField
      FieldName = 'DESCRICAO'
      Origin = '"UNIDADES"."DESCRICAO"'
      Size = 25
    end
    object qryUnidadeFracaoSIGLA: TIBStringField
      FieldName = 'SIGLA'
      Origin = '"UNIDADES"."SIGLA"'
      Size = 5
    end
    object qryUnidadeFracaoPARAMETRO: TIBBCDField
      FieldName = 'PARAMETRO'
      Origin = '"UNIDADES"."PARAMETRO"'
      Precision = 18
      Size = 3
    end
    object qryUnidadeFracaoCOD_PADRAO: TIBStringField
      FieldName = 'COD_PADRAO'
      Origin = '"UNIDADES"."COD_PADRAO"'
      Size = 2
    end
  end
  object dsUnidadeFracao: TDataSource
    DataSet = qryUnidadeFracao
    Left = 106
    Top = 224
  end
  object qryGruposTree: TIBQuery
    Database = dm.dbrestaurante
    Transaction = tsConsultas
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      
        'select trim(rg.cod_formatado ||'#39' - '#39'|| udf_trim(rg.descricao)) a' +
        's descricao, rg.cod_grupo, rg.cod_grupo_pai   from r_grupos  rg')
    Left = 27
    Top = 280
    object qryGruposTreeDESCRICAO: TIBStringField
      FieldName = 'DESCRICAO'
      ProviderFlags = []
      Size = 70
    end
    object qryGruposTreeCOD_GRUPO: TIBStringField
      FieldName = 'COD_GRUPO'
      Origin = '"R_GRUPOS"."COD_GRUPO"'
      Size = 6
    end
    object qryGruposTreeCOD_GRUPO_PAI: TIBStringField
      FieldName = 'COD_GRUPO_PAI'
      Origin = '"R_GRUPOS"."COD_GRUPO_PAI"'
      Size = 6
    end
  end
  object dsGruposTree: TDataSource
    DataSet = qryGruposTree
    Left = 98
    Top = 280
  end
  object qryPaises: TIBQuery
    Database = dm.dbrestaurante
    Transaction = tsConsultas
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      ' select codPais, nomPais from paises '
      '  order by nompais')
    Left = 27
    Top = 344
    object qryPaisesCODPAIS: TIBStringField
      FieldName = 'CODPAIS'
      Origin = '"PAISES"."CODPAIS"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 4
    end
    object qryPaisesNOMPAIS: TIBStringField
      FieldName = 'NOMPAIS'
      Origin = '"PAISES"."NOMPAIS"'
      Required = True
      Size = 60
    end
  end
  object dsQryPaises: TDataSource
    DataSet = qryPaises
    Left = 98
    Top = 344
  end
  object qryEstados: TIBQuery
    Database = dm.dbrestaurante
    Transaction = tsConsultas
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      ' select codigo, nome, sigla'
      '  from estado es order by nome')
    Left = 27
    Top = 408
    object qryEstadosCODIGO: TIBStringField
      FieldName = 'CODIGO'
      Origin = '"ESTADO"."CODIGO"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 3
    end
    object qryEstadosNOME: TIBStringField
      FieldName = 'NOME'
      Origin = '"ESTADO"."NOME"'
      Size = 30
    end
    object qryEstadosSIGLA: TIBStringField
      FieldName = 'SIGLA'
      Origin = '"ESTADO"."SIGLA"'
      Required = True
      FixedChar = True
      Size = 2
    end
  end
  object dsQryEstados: TDataSource
    DataSet = qryEstados
    Left = 98
    Top = 408
  end
  object qryCidade: TIBQuery
    Database = dm.dbrestaurante
    Transaction = tsConsultas
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      '   select cd.cod_cidade, cd.codigo_estado, cd.nome'
      '      from cidade cd')
    Left = 27
    Top = 464
    object qryCidadeCOD_CIDADE: TIBStringField
      FieldName = 'COD_CIDADE'
      Origin = '"CIDADE"."COD_CIDADE"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 7
    end
    object qryCidadeCODIGO_ESTADO: TIBStringField
      FieldName = 'CODIGO_ESTADO'
      Origin = '"CIDADE"."CODIGO_ESTADO"'
      Size = 3
    end
    object qryCidadeNOME: TIBStringField
      FieldName = 'NOME'
      Origin = '"CIDADE"."NOME"'
      Size = 50
    end
  end
  object dsQryCidade: TDataSource
    DataSet = qryCidade
    Left = 98
    Top = 464
  end
end
