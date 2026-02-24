object dmIntegracoes: TdmIntegracoes
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Height = 396
  Width = 562
  object qryCsBairrosSistema: TFDQuery
    FieldOptions.UpdatePersistent = True
    Connection = dm.fdRestaurante
    FormatOptions.AssignedValues = [fvMaxBcdPrecision]
    FormatOptions.MaxBcdPrecision = 20
    SQL.Strings = (
      ''
      '  select * from bairro b'
      '   order by b.descricao ')
    Left = 48
    Top = 80
  end
  object dsIntegracoesBairro: TDataSource
    DataSet = tbIntegraBairros
    Left = 152
    Top = 24
  end
  object dsBairrosSistema: TDataSource
    DataSet = qryCsBairrosSistema
    Left = 152
    Top = 80
  end
  object qryConsultaEmpresas: TFDQuery
    Connection = dm.fdRestaurante
    SQL.Strings = (
      ''
      ''
      ' select  itm.*, ip.nome as NomePlataforma'
      '   from integracoes_merchants itm'
      
        '   inner join integracoes_plataformas ip on (ip.id = itm.codigo_' +
        'plataforma)'
      '  order by itm.nome ')
    Left = 48
    Top = 152
  end
  object dsCsPlataformas: TDataSource
    DataSet = qryConsultaEmpresas
    Left = 152
    Top = 152
  end
  object qryCsFormasPagamento: TFDQuery
    FieldOptions.UpdatePersistent = True
    Connection = dm.fdRestaurante
    FormatOptions.AssignedValues = [fvMaxBcdPrecision]
    FormatOptions.MaxBcdPrecision = 20
    SQL.Strings = (
      ''
      ' select * from formas_pagamento fp'
      '  order by fp.descricao ')
    Left = 312
    Top = 96
  end
  object dsFormasPagamento: TDataSource
    DataSet = qryCsFormasPagamento
    Left = 432
    Top = 96
  end
  object tbIntegraBairros: TFDMemTable
    FieldOptions.UpdatePersistent = True
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    FormatOptions.AssignedValues = [fvMaxBcdPrecision]
    FormatOptions.MaxBcdPrecision = 20
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 48
    Top = 24
    object tbIntegraBairrosID: TLargeintField
      FieldName = 'ID'
    end
    object tbIntegraBairrosNOME: TStringField
      FieldName = 'NOME'
      Size = 255
    end
    object tbIntegraBairrosCOD_BAIRRO_SISTEMA: TIntegerField
      FieldName = 'COD_BAIRRO_SISTEMA'
    end
  end
  object tbIntegraFormasPagto: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 312
    Top = 24
  end
  object dsIntegraFormaPagto: TDataSource
    DataSet = tbIntegraFormasPagto
    Left = 432
    Top = 24
  end
  object FDQuery1: TFDQuery
    Connection = dm.fdRestaurante
    SQL.Strings = (
      '  select fp.id, fp.descricao, fp.codigo_pdv'
      '      from integracoes_formas_pagto fp'
      '     where fp.codigo_plataforma=1')
    Left = 376
    Top = 256
  end
  object TEMP: TDataSource
    DataSet = FDQuery1
    Left = 432
    Top = 248
  end
  object tbIntegracoesParametros: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 48
    Top = 232
  end
  object csParametros: TDataSource
    DataSet = tbIntegracoesParametros
    Left = 144
    Top = 240
  end
end
