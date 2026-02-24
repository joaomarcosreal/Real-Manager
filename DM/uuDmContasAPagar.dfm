object dmContasAPagar: TdmContasAPagar
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Height = 575
  Width = 641
  object tbItensCompraTemp: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 40
    Top = 152
    object tbItensCompraTempcodItem: TStringField
      FieldName = 'codItem'
      Size = 5
    end
  end
  object qryParticipantes: TFDQuery
    Connection = dm.fdRestaurante
    SQL.Strings = (
      ''
      ''
      ' select f.cod_fornecedor,'
      '        f.razao_social,'
      
        '        f.nome_fantasia, f.cgc_cpf as documento, f.inscricao_est' +
        'adual'
      '   from fornecedor f'
      '    order by f.razao_social')
    Left = 40
    Top = 287
  end
  object dsParticipantes: TDataSource
    DataSet = qryParticipantes
    Left = 42
    Top = 223
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
    Left = 35
    Top = 361
  end
  object dsQryCsPlanoContas: TDataSource
    DataSet = qryCsPlanoContas
    Left = 161
    Top = 362
  end
  object qryContasBancarias: TFDQuery
    Connection = dm.fdRestaurante
    SQL.Strings = (
      ''
      '  select * from contas_bancarias cp'
      '   order by cp.descricao')
    Left = 36
    Top = 427
  end
  object dsContasBancarias: TDataSource
    DataSet = qryContasBancarias
    Left = 131
    Top = 425
  end
  object dsContasAPagar: TDataSource
    DataSet = qryContasAPagar
    Left = 128
    Top = 50
  end
  object qryContasAPagar: TFDMemTable
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
    Left = 325
    Top = 26
  end
end
