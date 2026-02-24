object dmRelMovimentacoesEstoque: TdmRelMovimentacoesEstoque
  OnDestroy = DataModuleDestroy
  Height = 372
  Width = 484
  object qryHistoricosMovEstoque: TFDQuery
    FieldOptions.UpdatePersistent = True
    Connection = dm.fdRestaurante
    FormatOptions.AssignedValues = [fvMaxBcdPrecision]
    FormatOptions.MaxBcdPrecision = 20
    SQL.Strings = (
      ''
      'select * from ('
      
        ' select -1 as cod_tipo, '#39'0 - TODAS'#39' as descricao ,'#39'-1'#39' as tipo_m' +
        'ovimentacao from RDB$DATABASE'
      ' union all'
      
        '   select tp.cod_tipo, tp.descricao, tp.tipo_movimentacao  from ' +
        'tipos_baixa tp'
      '    )'
      ' order by  descricao')
    Left = 64
    Top = 40
    object qryHistoricosMovEstoqueCOD_TIPO: TStringField
      FieldName = 'COD_TIPO'
      Origin = 'COD_TIPO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 3
    end
    object qryHistoricosMovEstoqueDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = 'DESCRICAO'
      Size = 40
    end
    object qryHistoricosMovEstoqueTIPO_MOVIMENTACAO: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'TIPO_MOVIMENTACAO'
      Origin = 'TIPO_MOVIMENTACAO'
      ProviderFlags = []
      ReadOnly = True
      Size = 6
    end
  end
  object dsqryHistoricosMovEstoque: TDataSource
    DataSet = qryHistoricosMovEstoque
    Left = 64
    Top = 96
  end
  object qryOrigensMovEstoque: TFDQuery
    FieldOptions.UpdatePersistent = True
    Connection = dm.fdRestaurante
    FormatOptions.AssignedValues = [fvMaxBcdPrecision]
    FormatOptions.MaxBcdPrecision = 20
    SQL.Strings = (
      ''
      
        ' select -1 as codigo, '#39'0 - TODAS'#39' as descricao, '#39'-1'#39' as tipo_mov' +
        'imentacao from RDB$DATABASE'
      '  union all'
      
        ' select og.codigo, og.descricao, og.tipo_movimentacao  from orig' +
        'em_mov_estoque og')
    Left = 208
    Top = 48
    object qryOrigensMovEstoqueCODIGO: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'CODIGO'
      Origin = 'CODIGO'
      ProviderFlags = []
      ReadOnly = True
    end
    object qryOrigensMovEstoqueDESCRICAO: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'DESCRICAO'
      Origin = 'DESCRICAO'
      ProviderFlags = []
      ReadOnly = True
      Size = 40
    end
    object qryOrigensMovEstoqueTIPO_MOVIMENTACAO: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'TIPO_MOVIMENTACAO'
      Origin = 'TIPO_MOVIMENTACAO'
      ProviderFlags = []
      ReadOnly = True
      Size = 6
    end
  end
  object dsQryOrigensMovEstoque: TDataSource
    DataSet = qryOrigensMovEstoque
    Left = 208
    Top = 96
  end
  object qryRelMovimentacoes: TFDQuery
    Active = True
    FieldOptions.UpdatePersistent = True
    Connection = dm.fdRestaurante
    FormatOptions.AssignedValues = [fvMaxBcdPrecision]
    FormatOptions.MaxBcdPrecision = 20
    SQL.Strings = (
      ''
      ''
      ''
      'select cod_baixa,'
      '       cast(b.data_so as date) as data,'
      '       cast(b.hora as time) as hora,'
      '       b.cod_tipo, tpbaixa.descricao as descricaoTipo,'
      '       b.cod_origem, origem.descricao as descricaoOrigem,'
      '       cod_item,'
      '       p.cod_grupo,'
      '       trim(rg.descricao) as descricaoGrupo,'
      '       case b.tipo_movimentacao'
      '        when 0 then '#39'Sa'#237'da'#39
      '        when 1 then '#39'Entrada'#39
      '       end as operacao,'
      '       p.descricao,'
      
        '       udf_roundabnt((b.estoque_anterior / u.parametro),5) estoq' +
        'ue_anterior ,'
      '       case b.tipo_movimentacao'
      
        '        when 0 then  udf_roundabnt(( (b.quantidade * -1)/ u.para' +
        'metro ),5)'
      
        '        when 1 then  udf_roundabnt(( (b.quantidade)/ u.parametro' +
        ' ),5)'
      '       end  as quantidade,'
      
        '       udf_roundabnt((b.estoque_atualizado / u.parametro),5) est' +
        'oque_atualizado,'
      '       u.descricao as Unidade,'
      '       b.custo_unitario_item as custo,'
      
        '       (udf_roundabnt(( (b.quantidade)/ u.parametro),5) * b.cust' +
        'o_unitario_item) as total,'
      '       b.usuario, b.observacoes'
      ''
      '  from baixas_estoque b'
      '   inner join produtos p on (p.cod_produto = b.cod_item)'
      '   inner join r_grupos rg on (rg.cod_grupo = p.cod_grupo)'
      '   inner join unidades u on (u.cod_unidade = p.unidade_entrada)'
      
        '   inner join unidades uBaixa on (uBaixa.cod_unidade = b.cod_uni' +
        'dade)'
      
        '   inner join tipos_baixa tpBaixa on (tpBaixa.cod_tipo = b.cod_t' +
        'ipo)'
      
        '   inner join origem_mov_estoque origem on (origem.codigo = b.co' +
        'd_origem)'
      ''
      
        '    where b.data_so between '#39'01.10.2021 00:00:00'#39' and '#39'10.11.202' +
        '2 23:59:59'#39
      ''
      ''
      '')
    Left = 336
    Top = 48
  end
  object dsQryMovimentacoes: TDataSource
    DataSet = qryRelMovimentacoes
    Left = 336
    Top = 96
  end
end
