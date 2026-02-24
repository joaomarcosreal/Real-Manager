object dmCadProduto: TdmCadProduto
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Height = 630
  Width = 1064
  object qryUnidadeEntrada: TIBQuery
    Database = dm.dbrestaurante
    Transaction = tsConsultas
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      'select * from unidades order by descricao')
    PrecommittedReads = False
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
    DefaultDatabase = dm.dbrestaurante
    Params.Strings = (
      'read')
    Left = 35
    Top = 250
  end
  object dsQryUnidades: TDataSource
    DataSet = qryUnidadeEntrada
    Left = 40
    Top = 56
  end
  object qryGruposTouch: TIBQuery
    Database = dm.dbrestaurante
    Transaction = tsConsultas
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      ''
      ' select * from grupos_touch order by descricao')
    PrecommittedReads = False
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
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      'select * from miniprinters order by cod_miniprinter')
    PrecommittedReads = False
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
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      
        ' select cod_aliquota, descricao from aliquotas al order by al.co' +
        'd_aliquota ')
    PrecommittedReads = False
    Left = 316
    Top = 8
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
    Left = 312
    Top = 56
  end
  object dsClonesTemp: TDataSource
    DataSet = tbClonesTemp
    Left = 636
    Top = 118
  end
  object tbClonesTemp: TFDMemTable
    BeforePost = tbClonesTempBeforePost
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
    Left = 588
    Top = 118
    object tbClonesTempDescricao: TStringField
      FieldName = 'Descricao'
      Size = 150
    end
    object tbClonesTempvalor: TCurrencyField
      FieldName = 'valor'
    end
    object tbClonesTempCodBarras: TStringField
      FieldName = 'CodBarras'
      Size = 15
    end
  end
  object qryInsumos: TIBQuery
    Database = dm.dbrestaurante
    Transaction = tsConsultas
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      ' select p.cod_produto, p.descricao, g.descricao as Grupo,'
      '  p.unidade_entrada'
      '   from produtos p'
      '    inner join grupos g on (g.cod_grupo = p.cod_grupo)'
      '  order by p.descricao')
    PrecommittedReads = False
    Left = 396
    Top = 8
    object qryInsumosCOD_PRODUTO: TIBStringField
      FieldName = 'COD_PRODUTO'
      Origin = 'PRODUTOS.COD_PRODUTO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 5
    end
    object qryInsumosDESCRICAO: TIBStringField
      FieldName = 'DESCRICAO'
      Origin = 'PRODUTOS.DESCRICAO'
      Required = True
      Size = 150
    end
    object qryInsumosGRUPO: TIBStringField
      FieldName = 'GRUPO'
      Origin = 'GRUPOS.DESCRICAO'
      Size = 30
    end
    object qryInsumosUNIDADE_ENTRADA: TIBStringField
      FieldName = 'UNIDADE_ENTRADA'
      Origin = 'PRODUTOS.UNIDADE_ENTRADA'
      Size = 2
    end
  end
  object dsInsumos: TDataSource
    DataSet = qryInsumos
    Left = 392
    Top = 56
  end
  object qryListagemProdutos: TIBQuery
    Database = dm.dbrestaurante
    Transaction = tsConsultas
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      ''
      
        '   select                                                       ' +
        '      '
      
        '   0 as selecionado,                                            ' +
        '    '
      
        '   p.cod_produto,                                               ' +
        '    '
      
        '   p.descricao,                                                 ' +
        '    '
      
        '   p.compra,                                                    ' +
        '    '
      
        '   p.vende,                                                     ' +
        '    '
      
        '   p.valor_unitario,                                            ' +
        '    '
      
        '   g.descricao as grupo,                                        ' +
        '    '
      
        '   gt.descricao as grupoTouch,                                  ' +
        '    '
      
        '   p.valor_custo,                                               ' +
        '    '
      
        '   P.quantidade_maxima,                                         ' +
        '    '
      
        '   P.quantidade_minima,                                         ' +
        '    '
      
        '   p.cod_barras,                                                ' +
        '    '
      
        '   P.rendimento,                                                ' +
        '    '
      
        '   p.ncm,                                                       ' +
        '    '
      
        '   p.cest,                                                      ' +
        '    '
      
        '   p.cfop_saida,                                                ' +
        '    '
      
        '   p.cst_saida,                                                 ' +
        '    '
      '   p.perc_perda,'
      
        ' ( select count(*) from composicoes_produto cp where cp.cod_prod' +
        'uto = p.cod_produto),'
      
        '   case  ( select count(*) from composicoes_produto cp where cp.' +
        'cod_produto = p.cod_produto)'
      '     when 0 then '#39'N'#227'o'#39
      '     else  '#39'Sim'#39
      '   end fichaTecnica'
      
        '  from produtos p                                               ' +
        '    '
      
        '    inner join grupos g on (g.cod_grupo = p.cod_grupo)          ' +
        '    '
      
        '    left join grupos_touch gt on (gt.cod_grupo = p.cod_grupo_tou' +
        'ch) '
      '   where p.descricao  like '#39'%%'#39
      '     or p.cod_produto like '#39'%%'#39
      '     or p.cod_barras  like '#39'%%'#39
      '  order by p.descricao')
    PrecommittedReads = False
    Left = 684
    Top = 8
  end
  object dsListagemProdutos: TDataSource
    DataSet = tbListagemProdutos
    Left = 576
    Top = 56
  end
  object tbListagemProdutos: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 576
    Top = 8
  end
  object qryTipoProdutoSPED: TIBQuery
    Database = dm.dbrestaurante
    Transaction = tsConsultas
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      '  select * from tipos_item_sped'
      '   tp order by tp.cod_tipo')
    PrecommittedReads = False
    Left = 44
    Top = 120
  end
  object DSqryTipoProdutoSPED: TDataSource
    DataSet = qryTipoProdutoSPED
    Left = 40
    Top = 168
  end
  object qryGeneroItemSPED: TIBQuery
    Database = dm.dbrestaurante
    Transaction = tsConsultas
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      ''
      '  select * from genero_item'
      '   gp order by gp.descricao')
    PrecommittedReads = False
    Left = 148
    Top = 120
  end
  object dsqryGeneroItemSPED: TDataSource
    DataSet = qryGeneroItemSPED
    Left = 144
    Top = 168
  end
  object FDQuery1: TFDQuery
    Left = 525
    Top = 366
  end
  object qryCsPlanoContas: TFDQuery
    Connection = dm.fdRestaurante
    SQL.Strings = (
      ''
      '  SELECT '
      '  pc.cod_conta,'
      '    CASE'
      '        WHEN CHAR_LENGTH(cod_formatado) = 1 THEN cod_formatado'
      
        '        WHEN CHAR_LENGTH(cod_formatado) = 4 THEN LPAD(cod_format' +
        'ado, CHAR_LENGTH(cod_formatado) + 2, '#39' '#39')'
      
        '        WHEN CHAR_LENGTH(cod_formatado) = 8 THEN LPAD(cod_format' +
        'ado, CHAR_LENGTH(cod_formatado) + 4, '#39' '#39')'
      ''
      '    END AS cod_formatado,'
      '  pc.descricao,'
      '  pc.cod_conta_raiz, pc.cod_conta_pai, pc.desdobramento'
      'FROM r_plano_contas pc'
      
        ' order by pc.cod_conta, pc.cod_conta_raiz, pc.cod_conta_pai, pc.' +
        'desdobramento')
    Left = 52
    Top = 360
  end
  object dsQryCsPlanoContas: TDataSource
    DataSet = qryCsPlanoContas
    Left = 178
    Top = 361
  end
end
