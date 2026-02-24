object dmCadProduto: TdmCadProduto
  OldCreateOrder = False
  Height = 291
  Width = 496
  object qryUnidadeEntrada: TIBQuery
    Database = dm.dbrestaurante
    Transaction = tsConsultas
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      'select * from unidades order by descricao')
    Left = 44
    Top = 8
    object qryUnidadeEntradaCOD_UNIDADE: TIBStringField
      FieldName = 'COD_UNIDADE'
      Origin = '"UNIDADES"."COD_UNIDADE"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 2
    end
    object qryUnidadeEntradaDESCRICAO: TIBStringField
      FieldName = 'DESCRICAO'
      Origin = '"UNIDADES"."DESCRICAO"'
      Size = 25
    end
    object qryUnidadeEntradaSIGLA: TIBStringField
      FieldName = 'SIGLA'
      Origin = '"UNIDADES"."SIGLA"'
      Size = 5
    end
    object qryUnidadeEntradaPARAMETRO: TIBBCDField
      FieldName = 'PARAMETRO'
      Origin = '"UNIDADES"."PARAMETRO"'
      Precision = 18
      Size = 3
    end
    object qryUnidadeEntradaCOD_PADRAO: TIBStringField
      FieldName = 'COD_PADRAO'
      Origin = '"UNIDADES"."COD_PADRAO"'
      Size = 2
    end
  end
  object tsConsultas: TIBTransaction
    Active = True
    DefaultDatabase = dm.dbrestaurante
    Params.Strings = (
      'read')
    Left = 24
    Top = 232
  end
  object dsQryUnidades: TDataSource
    DataSet = qryUnidadeEntrada
    Left = 40
    Top = 56
  end
  object qryGruposTouch: TIBQuery
    Database = dm.dbrestaurante
    Transaction = tsConsultas
    Active = True
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      ''
      ' select * from grupos_touch order by descricao')
    Left = 140
    Top = 8
    object qryGruposTouchCODIGO: TIBStringField
      FieldName = 'CODIGO'
      Origin = '"GRUPOS_TOUCH"."CODIGO"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 2
    end
    object qryGruposTouchDESCRICAO: TIBStringField
      FieldName = 'DESCRICAO'
      Origin = '"GRUPOS_TOUCH"."DESCRICAO"'
      Size = 50
    end
    object qryGruposTouchORDEM: TSmallintField
      FieldName = 'ORDEM'
      Origin = '"GRUPOS_TOUCH"."ORDEM"'
    end
    object qryGruposTouchCOD_GRUPO: TIBStringField
      FieldName = 'COD_GRUPO'
      Origin = '"GRUPOS_TOUCH"."COD_GRUPO"'
      Size = 6
    end
  end
  object dsGruposTouch: TDataSource
    DataSet = qryGruposTouch
    Left = 136
    Top = 56
  end
  object qryMiniPrinters: TIBQuery
    Database = dm.dbrestaurante
    Transaction = tsConsultas
    Active = True
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      'select * from miniprinters order by cod_miniprinter')
    Left = 228
    Top = 8
    object qryMiniPrintersCOD_MINIPRINTER: TIBStringField
      FieldName = 'COD_MINIPRINTER'
      Origin = '"MINIPRINTERS"."COD_MINIPRINTER"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 3
    end
    object qryMiniPrintersDESCRICAO: TIBStringField
      FieldName = 'DESCRICAO'
      Origin = '"MINIPRINTERS"."DESCRICAO"'
      Size = 25
    end
    object qryMiniPrintersMARCA: TSmallintField
      FieldName = 'MARCA'
      Origin = '"MINIPRINTERS"."MARCA"'
    end
    object qryMiniPrintersMODELO: TSmallintField
      FieldName = 'MODELO'
      Origin = '"MINIPRINTERS"."MODELO"'
    end
    object qryMiniPrintersN_ESTACAO: TSmallintField
      FieldName = 'N_ESTACAO'
      Origin = '"MINIPRINTERS"."N_ESTACAO"'
    end
    object qryMiniPrintersPORTA: TIBStringField
      FieldName = 'PORTA'
      Origin = '"MINIPRINTERS"."PORTA"'
      Size = 5
    end
    object qryMiniPrintersIMPRIME_EXTRATO: TSmallintField
      FieldName = 'IMPRIME_EXTRATO'
      Origin = '"MINIPRINTERS"."IMPRIME_EXTRATO"'
    end
    object qryMiniPrintersCORTA_PAPEL: TSmallintField
      FieldName = 'CORTA_PAPEL'
      Origin = '"MINIPRINTERS"."CORTA_PAPEL"'
    end
    object qryMiniPrintersSALTOS: TSmallintField
      FieldName = 'SALTOS'
      Origin = '"MINIPRINTERS"."SALTOS"'
    end
    object qryMiniPrintersVIAS: TSmallintField
      FieldName = 'VIAS'
      Origin = '"MINIPRINTERS"."VIAS"'
    end
  end
  object dsQryMiniPrinters: TDataSource
    DataSet = qryMiniPrinters
    Left = 224
    Top = 56
  end
  object qryAliquotas: TIBQuery
    Database = dm.dbrestaurante
    Transaction = tsConsultas
    Active = True
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      
        ' select cod_aliquota, descricao from aliquotas al order by al.co' +
        'd_aliquota ')
    Left = 308
    Top = 16
    object qryAliquotasCOD_ALIQUOTA: TIBStringField
      FieldName = 'COD_ALIQUOTA'
      Origin = '"ALIQUOTAS"."COD_ALIQUOTA"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 2
    end
    object qryAliquotasDESCRICAO: TIBStringField
      FieldName = 'DESCRICAO'
      Origin = '"ALIQUOTAS"."DESCRICAO"'
      Required = True
      Size = 10
    end
  end
  object dsAliquotas: TDataSource
    DataSet = qryAliquotas
    Left = 304
    Top = 64
  end
end
