object dmCadUnidadesMedida: TdmCadUnidadesMedida
  OnDestroy = DataModuleDestroy
  Height = 248
  Width = 448
  object qryUnidadesMedida: TFDQuery
    FieldOptions.UpdatePersistent = True
    Connection = dm.fdRestaurante
    FormatOptions.AssignedValues = [fvMaxBcdPrecision]
    FormatOptions.MaxBcdPrecision = 20
    SQL.Strings = (
      ''
      ''
      ''
      ' select cod_unidade, descricao, sigla, parametro'
      '  from unidades order by cod_unidade')
    Left = 48
    Top = 72
  end
  object dsUnidadesMedida: TDataSource
    DataSet = qryUnidadesMedida
    Left = 40
    Top = 136
  end
end
