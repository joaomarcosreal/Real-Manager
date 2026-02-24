object dmVendas: TdmVendas
  OldCreateOrder = False
  Height = 317
  Width = 636
  object qryVendas: TIBQuery
    Database = dm.dbrestaurante
    Transaction = dm.transacao
    Active = True
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      'select * from vendas where cod_venda=1')
    UpdateObject = updVendas
    Left = 16
    Top = 8
    object qryVendasCOD_VENDA: TIBStringField
      FieldName = 'COD_VENDA'
      Origin = '"VENDAS"."COD_VENDA"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 8
    end
    object qryVendasDATA: TDateField
      FieldName = 'DATA'
      Origin = '"VENDAS"."DATA"'
      Required = True
    end
    object qryVendasHORA: TTimeField
      FieldName = 'HORA'
      Origin = '"VENDAS"."HORA"'
      Required = True
    end
    object qryVendasDATA_SO: TDateField
      FieldName = 'DATA_SO'
      Origin = '"VENDAS"."DATA_SO"'
    end
    object qryVendasDATA_ECF: TDateField
      FieldName = 'DATA_ECF'
      Origin = '"VENDAS"."DATA_ECF"'
    end
    object qryVendasHORA_ECF: TTimeField
      FieldName = 'HORA_ECF'
      Origin = '"VENDAS"."HORA_ECF"'
    end
    object qryVendasVALOR_BRUTO: TIBBCDField
      FieldName = 'VALOR_BRUTO'
      Origin = '"VENDAS"."VALOR_BRUTO"'
      Required = True
      Precision = 18
      Size = 2
    end
    object qryVendasVALOR_DESCONTO: TIBBCDField
      FieldName = 'VALOR_DESCONTO'
      Origin = '"VENDAS"."VALOR_DESCONTO"'
      Required = True
      Precision = 18
      Size = 2
    end
    object qryVendasVALOR_TXSERV: TIBBCDField
      FieldName = 'VALOR_TXSERV'
      Origin = '"VENDAS"."VALOR_TXSERV"'
      Required = True
      Precision = 18
      Size = 2
    end
    object qryVendasREPIQUE: TIBBCDField
      FieldName = 'REPIQUE'
      Origin = '"VENDAS"."REPIQUE"'
      Precision = 18
      Size = 2
    end
    object qryVendasVALOR_TOTAL: TIBBCDField
      FieldName = 'VALOR_TOTAL'
      Origin = '"VENDAS"."VALOR_TOTAL"'
      Required = True
      Precision = 18
      Size = 2
    end
    object qryVendasTOTAL_PAGO: TIBBCDField
      FieldName = 'TOTAL_PAGO'
      Origin = '"VENDAS"."TOTAL_PAGO"'
      Required = True
      Precision = 18
      Size = 2
    end
    object qryVendasVALOR_TROCO: TIBBCDField
      FieldName = 'VALOR_TROCO'
      Origin = '"VENDAS"."VALOR_TROCO"'
      Required = True
      Precision = 18
      Size = 2
    end
    object qryVendasCOD_USUARIO: TIBStringField
      FieldName = 'COD_USUARIO'
      Origin = '"VENDAS"."COD_USUARIO"'
      Required = True
      Size = 3
    end
    object qryVendasNUMERO_CAIXA: TIBStringField
      FieldName = 'NUMERO_CAIXA'
      Origin = '"VENDAS"."NUMERO_CAIXA"'
      Size = 3
    end
    object qryVendasPROCESSADA: TIntegerField
      FieldName = 'PROCESSADA'
      Origin = '"VENDAS"."PROCESSADA"'
    end
    object qryVendasNV: TSmallintField
      FieldName = 'NV'
      Origin = '"VENDAS"."NV"'
    end
    object qryVendasMESA: TIBStringField
      FieldName = 'MESA'
      Origin = '"VENDAS"."MESA"'
      Size = 4
    end
    object qryVendasIMP: TSmallintField
      FieldName = 'IMP'
      Origin = '"VENDAS"."IMP"'
    end
    object qryVendasCOD_CAIXA: TIBStringField
      FieldName = 'COD_CAIXA'
      Origin = '"VENDAS"."COD_CAIXA"'
      Size = 5
    end
    object qryVendasTIPO_VENDA: TSmallintField
      FieldName = 'TIPO_VENDA'
      Origin = '"VENDAS"."TIPO_VENDA"'
    end
    object qryVendasCOD_PEDIDO_DELIVERY: TIBStringField
      FieldName = 'COD_PEDIDO_DELIVERY'
      Origin = '"VENDAS"."COD_PEDIDO_DELIVERY"'
      Size = 8
    end
    object qryVendasCCF_CUPOM: TIBStringField
      FieldName = 'CCF_CUPOM'
      Origin = '"VENDAS"."CCF_CUPOM"'
      Size = 15
    end
    object qryVendasCOO_CUPOM: TIBStringField
      FieldName = 'COO_CUPOM'
      Origin = '"VENDAS"."COO_CUPOM"'
      Size = 15
    end
    object qryVendasNUM_SERIE_ECF: TIBStringField
      FieldName = 'NUM_SERIE_ECF'
      Origin = '"VENDAS"."NUM_SERIE_ECF"'
      Size = 30
    end
    object qryVendasQTDE_PESSOAS: TSmallintField
      FieldName = 'QTDE_PESSOAS'
      Origin = '"VENDAS"."QTDE_PESSOAS"'
    end
    object qryVendasVALOR_TX_ENTREGA: TIBBCDField
      FieldName = 'VALOR_TX_ENTREGA'
      Origin = '"VENDAS"."VALOR_TX_ENTREGA"'
      Precision = 18
      Size = 2
    end
    object qryVendasREDUCAO_Z: TIntegerField
      FieldName = 'REDUCAO_Z'
      Origin = '"VENDAS"."REDUCAO_Z"'
    end
    object qryVendasSELECIONADO: TSmallintField
      FieldName = 'SELECIONADO'
      Origin = '"VENDAS"."SELECIONADO"'
    end
    object qryVendasDESCONTO_TAXAS: TFMTBCDField
      FieldName = 'DESCONTO_TAXAS'
      Origin = '"VENDAS"."DESCONTO_TAXAS"'
      Precision = 18
      Size = 10
    end
    object qryVendasCHAVE_NFCE: TIBStringField
      FieldName = 'CHAVE_NFCE'
      Origin = '"VENDAS"."CHAVE_NFCE"'
      Size = 50
    end
    object qryVendasNUMERO_NFCE: TIntegerField
      FieldName = 'NUMERO_NFCE'
      Origin = '"VENDAS"."NUMERO_NFCE"'
    end
    object qryVendasSERIE_NFCE: TSmallintField
      FieldName = 'SERIE_NFCE'
      Origin = '"VENDAS"."SERIE_NFCE"'
    end
    object qryVendasPROTOCOLO_NFCE: TIBStringField
      FieldName = 'PROTOCOLO_NFCE'
      Origin = '"VENDAS"."PROTOCOLO_NFCE"'
      Size = 25
    end
    object qryVendasRECIBO_NFCE: TIBStringField
      FieldName = 'RECIBO_NFCE'
      Origin = '"VENDAS"."RECIBO_NFCE"'
      Size = 25
    end
    object qryVendasOBS_NFCE: TIBStringField
      FieldName = 'OBS_NFCE'
      Origin = '"VENDAS"."OBS_NFCE"'
      Size = 150
    end
    object qryVendasCONSULTA_OK: TSmallintField
      FieldName = 'CONSULTA_OK'
      Origin = '"VENDAS"."CONSULTA_OK"'
    end
    object qryVendasARQ: TSmallintField
      FieldName = 'ARQ'
      Origin = '"VENDAS"."ARQ"'
    end
    object qryVendasCOD_EMPRESA: TIBStringField
      FieldName = 'COD_EMPRESA'
      Origin = '"VENDAS"."COD_EMPRESA"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 4
    end
    object qryVendasPERCENTUAL_DESCONTO: TFMTBCDField
      FieldName = 'PERCENTUAL_DESCONTO'
      Origin = '"VENDAS"."PERCENTUAL_DESCONTO"'
      Precision = 18
    end
    object qryVendasLOTE_EXPORTACAO_WEB: TLargeintField
      FieldName = 'LOTE_EXPORTACAO_WEB'
      Origin = '"VENDAS"."LOTE_EXPORTACAO_WEB"'
    end
    object qryVendasCOD_GARCON_ABRIU: TIBStringField
      FieldName = 'COD_GARCON_ABRIU'
      Origin = '"VENDAS"."COD_GARCON_ABRIU"'
      Size = 3
    end
    object qryVendasMODELO_COMPROVANTE: TSmallintField
      FieldName = 'MODELO_COMPROVANTE'
      Origin = '"VENDAS"."MODELO_COMPROVANTE"'
    end
    object qryVendasCOD_FORNECEDOR: TIBStringField
      FieldName = 'COD_FORNECEDOR'
      Origin = '"VENDAS"."COD_FORNECEDOR"'
      Size = 4
    end
    object qryVendasSESSAO_SAT: TLargeintField
      FieldName = 'SESSAO_SAT'
      Origin = '"VENDAS"."SESSAO_SAT"'
    end
    object qryVendasCNF_SAT: TLargeintField
      FieldName = 'CNF_SAT'
      Origin = '"VENDAS"."CNF_SAT"'
    end
    object qryVendasXML_DOC: TWideMemoField
      FieldName = 'XML_DOC'
      Origin = '"VENDAS"."XML_DOC"'
      ProviderFlags = [pfInUpdate]
      BlobType = ftWideMemo
      Size = 8
    end
    object qryVendasCNPJ_CPF_CLIENTE_NF: TIBStringField
      FieldName = 'CNPJ_CPF_CLIENTE_NF'
      Origin = '"VENDAS"."CNPJ_CPF_CLIENTE_NF"'
      Size = 14
    end
    object qryVendasNOME_CLIENTE_NF: TIBStringField
      FieldName = 'NOME_CLIENTE_NF'
      Origin = '"VENDAS"."NOME_CLIENTE_NF"'
      Size = 60
    end
    object qryVendasTENTATIVAS_ENVIO_NFCE: TSmallintField
      FieldName = 'TENTATIVAS_ENVIO_NFCE'
      Origin = '"VENDAS"."TENTATIVAS_ENVIO_NFCE"'
    end
    object qryVendasTEMPO_EMISSAO_NFCE: TSmallintField
      FieldName = 'TEMPO_EMISSAO_NFCE'
      Origin = '"VENDAS"."TEMPO_EMISSAO_NFCE"'
    end
  end
  object updVendas: TIBUpdateSQL
    RefreshSQL.Strings = (
      'Select *'
      'from vendas '
      'where'
      '  COD_VENDA = :COD_VENDA')
    ModifySQL.Strings = (
      'update vendas'
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
      '  REPIQUE = :REPIQUE,'
      '  VALOR_TOTAL = :VALOR_TOTAL,'
      '  TOTAL_PAGO = :TOTAL_PAGO,'
      '  VALOR_TROCO = :VALOR_TROCO,'
      '  COD_USUARIO = :COD_USUARIO,'
      '  NUMERO_CAIXA = :NUMERO_CAIXA,'
      '  PROCESSADA = :PROCESSADA,'
      '  NV = :NV,'
      '  MESA = :MESA,'
      '  IMP = :IMP,'
      '  COD_CAIXA = :COD_CAIXA,'
      '  TIPO_VENDA = :TIPO_VENDA,'
      '  COD_PEDIDO_DELIVERY = :COD_PEDIDO_DELIVERY,'
      '  CCF_CUPOM = :CCF_CUPOM,'
      '  COO_CUPOM = :COO_CUPOM,'
      '  NUM_SERIE_ECF = :NUM_SERIE_ECF,'
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
      '  ARQ = :ARQ,'
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
      '  COD_VENDA = :OLD_COD_VENDA')
    InsertSQL.Strings = (
      'insert into vendas'
      
        '  (COD_VENDA, DATA, HORA, DATA_SO, DATA_ECF, HORA_ECF, VALOR_BRU' +
        'TO, VALOR_DESCONTO, '
      
        '   VALOR_TXSERV, REPIQUE, VALOR_TOTAL, TOTAL_PAGO, VALOR_TROCO, ' +
        'COD_USUARIO, '
      
        '   NUMERO_CAIXA, PROCESSADA, NV, MESA, IMP, COD_CAIXA, TIPO_VEND' +
        'A, COD_PEDIDO_DELIVERY, '
      
        '   CCF_CUPOM, COO_CUPOM, NUM_SERIE_ECF, QTDE_PESSOAS, VALOR_TX_E' +
        'NTREGA, '
      
        '   REDUCAO_Z, SELECIONADO, DESCONTO_TAXAS, CHAVE_NFCE, NUMERO_NF' +
        'CE, SERIE_NFCE, '
      
        '   PROTOCOLO_NFCE, RECIBO_NFCE, OBS_NFCE, CONSULTA_OK, ARQ, COD_' +
        'EMPRESA, '
      
        '   PERCENTUAL_DESCONTO, LOTE_EXPORTACAO_WEB, COD_GARCON_ABRIU, M' +
        'ODELO_COMPROVANTE, '
      
        '   COD_FORNECEDOR, SESSAO_SAT, CNF_SAT, XML_DOC, CNPJ_CPF_CLIENT' +
        'E_NF, NOME_CLIENTE_NF, '
      '   TENTATIVAS_ENVIO_NFCE, TEMPO_EMISSAO_NFCE)'
      'values'
      
        '  (:COD_VENDA, :DATA, :HORA, :DATA_SO, :DATA_ECF, :HORA_ECF, :VA' +
        'LOR_BRUTO, '
      
        '   :VALOR_DESCONTO, :VALOR_TXSERV, :REPIQUE, :VALOR_TOTAL, :TOTA' +
        'L_PAGO, '
      
        '   :VALOR_TROCO, :COD_USUARIO, :NUMERO_CAIXA, :PROCESSADA, :NV, ' +
        ':MESA, '
      
        '   :IMP, :COD_CAIXA, :TIPO_VENDA, :COD_PEDIDO_DELIVERY, :CCF_CUP' +
        'OM, :COO_CUPOM, '
      
        '   :NUM_SERIE_ECF, :QTDE_PESSOAS, :VALOR_TX_ENTREGA, :REDUCAO_Z,' +
        ' :SELECIONADO, '
      
        '   :DESCONTO_TAXAS, :CHAVE_NFCE, :NUMERO_NFCE, :SERIE_NFCE, :PRO' +
        'TOCOLO_NFCE, '
      
        '   :RECIBO_NFCE, :OBS_NFCE, :CONSULTA_OK, :ARQ, :COD_EMPRESA, :P' +
        'ERCENTUAL_DESCONTO, '
      
        '   :LOTE_EXPORTACAO_WEB, :COD_GARCON_ABRIU, :MODELO_COMPROVANTE,' +
        ' :COD_FORNECEDOR, '
      
        '   :SESSAO_SAT, :CNF_SAT, :XML_DOC, :CNPJ_CPF_CLIENTE_NF, :NOME_' +
        'CLIENTE_NF, '
      '   :TENTATIVAS_ENVIO_NFCE, :TEMPO_EMISSAO_NFCE)')
    DeleteSQL.Strings = (
      'delete from vendas'
      'where'
      '  COD_VENDA = :OLD_COD_VENDA')
    Left = 80
    Top = 8
  end
end
