object dmControleInventarios: TdmControleInventarios
  Height = 418
  Width = 825
  object qryHistoricosInventarios: TFDQuery
    FieldOptions.UpdatePersistent = True
    Connection = dm.fdRestaurante
    FormatOptions.AssignedValues = [fvMaxBcdPrecision]
    FormatOptions.MaxBcdPrecision = 20
    SQL.Strings = (
      ''
      '       select * from ('
      
        '        select h.codigo, h.descricao   from historicos_inventari' +
        'o h'
      
        '               union all select '#39'0'#39' as codigo, '#39'TODOS OS HIST'#211'RI' +
        'COS'#39' AS descricao from parametros p'
      '               )'
      '         order by codigo'
      '')
    Left = 48
    Top = 8
    object qryHistoricosInventariosCODIGO: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'CODIGO'
      Origin = 'CODIGO'
      ProviderFlags = []
      ReadOnly = True
      Size = 11
    end
    object qryHistoricosInventariosDESCRICAO: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'DESCRICAO'
      Origin = 'DESCRICAO'
      ProviderFlags = []
      ReadOnly = True
      Size = 50
    end
  end
  object dsQryHistoricosInventario: TDataSource
    DataSet = qryHistoricosInventarios
    Left = 48
    Top = 64
  end
  object QryConsultaInventario: TFDQuery
    FieldOptions.UpdatePersistent = True
    Connection = dm.fdRestaurante
    FormatOptions.AssignedValues = [fvMaxBcdPrecision]
    FormatOptions.MaxBcdPrecision = 20
    SQL.Strings = (
      ''
      
        'select ir.codigo, ir.data_inventario, cast(ir.data_hora_so as Ti' +
        'me) as hora, ir.cod_historico, hi.descricao as descricao_histori' +
        'co, '
      
        '         ir.nome_usuario, ir.total_sobras, ir.total_perdas, ir.t' +
        'otal_inventario,ir.obs '
      '   from inventarios ir '
      
        '        inner join historicos_inventario hi on (hi.codigo = ir.c' +
        'od_historico)  '
      
        '        where ir.data_inventario between '#39'01.07.2019'#39' and '#39'20.07' +
        '.2019'#39
      '         and ir.codigo in   '
      
        '          ( select itv.cod_inventario    from itens_inventario i' +
        'tv  '
      
        '               inner join inventarios iv on (iv.codigo = itv.cod' +
        '_inventario )  '
      '              where itv.cod_produto= '#39'00286'#39
      
        '              and iv.data_inventario between  '#39'01.07.2019'#39' and '#39 +
        '20.07.2019'#39')'
      '  order by ir.codigo ')
    Left = 168
    Top = 8
    object QryConsultaInventarioCODIGO: TLargeintField
      FieldName = 'CODIGO'
      Origin = 'CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object QryConsultaInventarioDATA_INVENTARIO: TDateField
      FieldName = 'DATA_INVENTARIO'
      Origin = 'DATA_INVENTARIO'
    end
    object QryConsultaInventarioHORA: TTimeField
      AutoGenerateValue = arDefault
      FieldName = 'HORA'
      Origin = 'HORA'
      ProviderFlags = []
      ReadOnly = True
    end
    object QryConsultaInventarioCOD_HISTORICO: TIntegerField
      FieldName = 'COD_HISTORICO'
      Origin = 'COD_HISTORICO'
    end
    object QryConsultaInventarioDESCRICAO_HISTORICO: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'DESCRICAO_HISTORICO'
      Origin = 'DESCRICAO'
      ProviderFlags = []
      ReadOnly = True
      Size = 50
    end
    object QryConsultaInventarioNOME_USUARIO: TStringField
      FieldName = 'NOME_USUARIO'
      Origin = 'NOME_USUARIO'
      Size = 15
    end
    object QryConsultaInventarioTOTAL_SOBRAS: TBCDField
      FieldName = 'TOTAL_SOBRAS'
      Origin = 'TOTAL_SOBRAS'
      currency = True
      Precision = 18
      Size = 3
    end
    object QryConsultaInventarioTOTAL_PERDAS: TBCDField
      FieldName = 'TOTAL_PERDAS'
      Origin = 'TOTAL_PERDAS'
      currency = True
      Precision = 18
      Size = 2
    end
    object QryConsultaInventarioTOTAL_INVENTARIO: TBCDField
      FieldName = 'TOTAL_INVENTARIO'
      Origin = 'TOTAL_INVENTARIO'
      currency = True
      Precision = 18
      Size = 2
    end
    object QryConsultaInventarioOBS: TStringField
      FieldName = 'OBS'
      Origin = 'OBS'
      Size = 250
    end
  end
  object dsConsultaInventarios: TDataSource
    DataSet = QryConsultaInventario
    Left = 160
    Top = 64
  end
  object qryHistoricosBaixaEstoque: TFDQuery
    FieldOptions.UpdatePersistent = True
    Connection = dm.fdRestaurante
    FormatOptions.AssignedValues = [fvMaxBcdPrecision]
    FormatOptions.MaxBcdPrecision = 20
    SQL.Strings = (
      ''
      ''
      '  select * from tipos_baixa tp'
      '   order by tp.descricao ')
    Left = 72
    Top = 152
    object qryHistoricosBaixaEstoqueCOD_TIPO: TStringField
      FieldName = 'COD_TIPO'
      Origin = 'COD_TIPO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 3
    end
    object qryHistoricosBaixaEstoqueDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = 'DESCRICAO'
      Size = 40
    end
  end
  object dsQryHistoricosBaixaEstoque: TDataSource
    DataSet = qryHistoricosBaixaEstoque
    Left = 72
    Top = 208
  end
end
