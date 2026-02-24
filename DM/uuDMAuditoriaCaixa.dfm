object dmAuditoriaCaixas: TdmAuditoriaCaixas
  OnDestroy = DataModuleDestroy
  Height = 600
  Width = 1010
  object dsQryListagemCaixas: TDataSource
    DataSet = QryListagemCaixas
    Left = 138
    Top = 24
  end
  object QryListagemCaixas: TFDQuery
    BeforeInsert = QryListagemCaixasBeforeInsert
    Connection = dm.fdRestaurante
    SQL.Strings = (
      
        'select                                                          ' +
        '                                                                ' +
        '                               '
      
        '       1 as id,                                                 ' +
        '                                                                ' +
        '                                '
      
        '       c.cod_empresa,  c.codigo, p.descricao_empresa,           ' +
        '                                                                ' +
        '                                '
      
        '       c.nome_usuario,                                          ' +
        '                                                                ' +
        '                                '
      
        '       c.data_sistema,                                          ' +
        '                                                                ' +
        '                                '
      
        '       cast((c.data_abertura ||'#39' '#39'||c.hora_abertura)as timestamp' +
        ') abertura,                                                     ' +
        '                                '
      
        '       cast((c.data_fechamento ||'#39' '#39'||c.hora_fechamento) as time' +
        'stamp) fechamento,                                              ' +
        '                                '
      
        '       coalesce(u.nome_usuario,'#39' '#39') as Usuario_Auditoria,       ' +
        '                                                                ' +
        '                                '
      
        '       c.data_auditoria,                                        ' +
        '                                                                ' +
        '                                '
      
        '       c.diferenca_total,                                       ' +
        '                                                                ' +
        '                                '
      
        '       c.diferenca_pagar,                                       ' +
        '                                                                ' +
        '                                '
      
        '       coalesce(c.auditado,0) as auditado,                      ' +
        '                                                                ' +
        '                                '
      
        '       coalesce(c.sincronizado,0) as sincronizado,              ' +
        '                                                                ' +
        '                                '
      
        '       coalesce(c.status, 0) as status,                         ' +
        '                                                                ' +
        '                                '
      
        '                                                                ' +
        '                                                                ' +
        '                                '
      
        '       coalesce((select count(*) from parciais_caixa pc where pc' +
        '.cod_caixa = c.codigo and pc.cod_empresa = c.cod_empresa),0) as ' +
        'parciais_impressos,             '
      
        '       coalesce((select sum(s.valor) from suprimentos s where s.' +
        'cod_caixa=c.codigo and s.cod_empresa = c.cod_empresa),0) as tota' +
        'l_suprimentos,                  '
      
        '       coalesce((select sum(r.valor)                            ' +
        '                                                                ' +
        '                                '
      
        '           from recebimentos r                                  ' +
        '                                                                ' +
        '                                '
      
        '           inner join vendas v on (v.cod_venda = r.cod_venda and' +
        ' v.cod_empresa = c.cod_empresa)                                 ' +
        '                                '
      
        '           where r.cod_caixa = c.codigo and c.cod_empresa = c.co' +
        'd_empresa                                                       ' +
        '                                '
      '            and v.data between '#39'01.01.2024'#39' and '#39'03.04.2024'#39' '
      
        '           and v.cancelada =0),0) total_recebimentos,           ' +
        '                                                                ' +
        '                                '
      
        '       coalesce((select sum(s.valor) from sangrias s where s.cod' +
        '_caixa=c.codigo and s.cod_empresa = c.cod_empresa),0) as total_s' +
        'angrias,                        '
      
        '       coalesce((select sum(ap.total_sistema) from apuracao_caix' +
        'a ap where ap.cod_caixa = c.codigo and ap.cod_empresa = c.cod_em' +
        'presa),0) as  total_sistema,    '
      
        '       coalesce((select sum(ap.total_operador) from apuracao_cai' +
        'xa ap where ap.cod_caixa = c.codigo and ap.cod_empresa = c.cod_e' +
        'mpresa),0) as  total_operador,  '
      
        '       coalesce((select sum(ap.diferenca)  from apuracao_caixa a' +
        'p where ap.cod_caixa = c.codigo and ap.cod_empresa = c.cod_empre' +
        'sa),0) as diferenca_operador    '
      
        '       from caixas c                                            ' +
        '                      '
      
        '         inner join parametros p on (p.cod_empresa = c.cod_empre' +
        'sa)                   '
      
        '         left join usuarios u on (u.cod_usuario = c.cod_usuario_' +
        'auditoria)            '
      
        '           where 1=1                                            ' +
        '                      '
      
        '            and c.data_sistema between '#39'01.01.2024'#39' and '#39'03.04.2' +
        '024'#39
      ' '
      ''
      '       order by c.data_sistema ')
    Left = 34
    Top = 24
  end
  object dsAuditoriaCaixa: TDataSource
    DataSet = tbAuditoriaDeCaixa
    Left = 138
    Top = 104
  end
  object tbAuditoriaDeCaixa: TFDMemTable
    BeforePost = tbAuditoriaDeCaixaBeforePost
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 40
    Top = 112
    object tbAuditoriaDeCaixaID: TLargeintField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object tbAuditoriaDeCaixaID_AUDITORIA: TLargeintField
      FieldName = 'ID_AUDITORIA'
      Origin = 'ID_AUDITORIA'
    end
    object tbAuditoriaDeCaixaCOD_EMPRESA: TStringField
      FieldName = 'COD_EMPRESA'
      Origin = 'COD_EMPRESA'
      Required = True
      Size = 4
    end
    object tbAuditoriaDeCaixaCOD_CAIXA: TStringField
      FieldName = 'COD_CAIXA'
      Origin = 'COD_CAIXA'
      Required = True
      Size = 5
    end
    object tbAuditoriaDeCaixaCOD_FORMA: TStringField
      FieldName = 'COD_FORMA'
      Origin = 'COD_FORMA'
      Required = True
      Size = 3
    end
    object tbAuditoriaDeCaixaDESCRICAO: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'DESCRICAO'
      Origin = 'DESCRICAO'
      ProviderFlags = []
      ReadOnly = True
    end
    object tbAuditoriaDeCaixaTOTAL_SUPRIMENTOS: TFMTBCDField
      FieldName = 'TOTAL_SUPRIMENTOS'
      Origin = 'TOTAL_SUPRIMENTOS'
      Precision = 18
      Size = 2
    end
    object tbAuditoriaDeCaixaTOTAL_SANGRIAS: TFMTBCDField
      FieldName = 'TOTAL_SANGRIAS'
      Origin = 'TOTAL_SANGRIAS'
      Precision = 18
      Size = 2
    end
    object tbAuditoriaDeCaixaTOTAL_RECEBIMENTOS_VENDAS: TFMTBCDField
      FieldName = 'TOTAL_RECEBIMENTOS_VENDAS'
      Origin = 'TOTAL_RECEBIMENTOS_VENDAS'
      Precision = 18
      Size = 2
    end
    object tbAuditoriaDeCaixaTOTAL_RECEBIMENTOS_PENDURAS: TFMTBCDField
      FieldName = 'TOTAL_RECEBIMENTOS_PENDURAS'
      Origin = 'TOTAL_RECEBIMENTOS_PENDURAS'
      Precision = 18
      Size = 2
    end
    object tbAuditoriaDeCaixaSALDO_SISTEMA: TFMTBCDField
      FieldName = 'SALDO_SISTEMA'
      Origin = 'SALDO_SISTEMA'
      Precision = 18
      Size = 2
    end
    object tbAuditoriaDeCaixaTOTAL_OPERADOR: TFMTBCDField
      FieldName = 'TOTAL_OPERADOR'
      Origin = 'TOTAL_OPERADOR'
      Precision = 18
      Size = 2
    end
    object tbAuditoriaDeCaixaDIFERENCA_OPERADOR: TFMTBCDField
      FieldName = 'DIFERENCA_OPERADOR'
      Origin = 'DIFERENCA_OPERADOR'
      Precision = 18
      Size = 2
    end
    object tbAuditoriaDeCaixaTOTAL_AUDITORIA: TFMTBCDField
      FieldName = 'TOTAL_AUDITORIA'
      Origin = 'TOTAL_AUDITORIA'
      Precision = 18
      Size = 2
    end
    object tbAuditoriaDeCaixaDIFERENCA_AUDITORIA: TFMTBCDField
      FieldName = 'DIFERENCA_AUDITORIA'
      Origin = 'DIFERENCA_AUDITORIA'
      Precision = 18
      Size = 2
    end
    object tbAuditoriaDeCaixaOBS: TStringField
      FieldName = 'OBS'
      Origin = 'OBS'
      Size = 100
    end
  end
  object qryDetalhamentoFormas: TFDQuery
    Connection = dm.fdRestaurante
    SQL.Strings = (
      
        'select v.cod_venda,v.cod_empresa,v.mesa, v.numero_nfce, v.chave_' +
        'nfce, v.valor_txserv, r.cod_forma,fp.descricao, v.hora,v.valor_t' +
        'otal, r.valor, u.login,'
      'coalesce(cl.razao_social,'#39#39') as cliente'
      
        '    from recebimentos r                                         ' +
        '       '
      
        '      inner join vendas v on (v.cod_venda = r.cod_venda)        ' +
        '       '
      
        '      inner join formas_pagamento fp on (fp.cod_forma = r.cod_fo' +
        'rma)   '
      '      inner join usuarios u on (u.cod_usuario = v.cod_usuario)'
      '      left join faturas f on (f.cod_venda = v.cod_venda)'
      '      left join clientes cl on (cl.cod_cli = f.cod_cli)  '
      '         where'
      '            v.cod_empresa='#39'0001'#39
      '           and v.cod_caixa='#39'00697'#39
      '      order by v.data_so,hora'
      ''
      '')
    Left = 32
    Top = 200
  end
  object dsQryDetalhamento: TDataSource
    DataSet = qryDetalhamentoFormas
    Left = 136
    Top = 200
  end
  object dsQryVendasCaixa: TDataSource
    DataSet = qryVendasCaixa
    Left = 136
    Top = 272
  end
  object qryVendasCaixa: TFDQuery
    Connection = dm.fdRestaurante
    SQL.Strings = (
      '       select first 10 v.cod_venda,v.hora,v.mesa,v.valor_bruto,'
      
        '              v.valor_txserv,v.valor_desconto,v.valor_total,v.nu' +
        'mero_nfce,'
      '              v.tabela_preco,v.chave_nfce,v.cod_usuario,u.login'
      '               from vendas'
      '       inner join vendas v on (v.cod_venda = v.cod_venda)'
      
        '       inner join usuarios u on (u.cod_usuario = v.cod_usuario) ' +
        '                                                                ' +
        '                        ')
    Left = 24
    Top = 279
  end
  object qryCsHistoricosAuditoria: TFDQuery
    Active = True
    Connection = dm.fdRestaurante
    SQL.Strings = (
      '   select * from historicos_auditoria_caixa order by id')
    Left = 35
    Top = 356
  end
  object dsHistoricosAuditoria: TDataSource
    DataSet = qryCsHistoricosAuditoria
    Left = 165
    Top = 360
  end
  object qryFormasPagamentoAuditoria: TFDQuery
    Active = True
    Connection = dm.fdRestaurante
    SQL.Strings = (
      ''
      ''
      '  select * from formas_pagamento fp'
      '   where fp.permite_correcao_auditoria =1'
      '   order by fp.descricao')
    Left = 35
    Top = 437
  end
  object dsqryFormasPagamentoAuditoria: TDataSource
    DataSet = qryFormasPagamentoAuditoria
    Left = 204
    Top = 433
  end
end
