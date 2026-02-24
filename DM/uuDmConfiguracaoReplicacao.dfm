object dmConfiguracaoReplicacao: TdmConfiguracaoReplicacao
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Height = 533
  Width = 851
  object qryDatabaseTables: TFDQuery
    Connection = dm.fdRestaurante
    SQL.Strings = (
      'SELECT RDB$RELATION_NAME AS TABLE_NAME'
      'FROM RDB$RELATIONS'
      'WHERE RDB$SYSTEM_FLAG = 0 AND RDB$VIEW_BLR IS NULL'
      'ORDER BY TABLE_NAME;')
    Left = 56
    Top = 72
  end
  object dsDatabaseTables: TDataSource
    DataSet = qryDatabaseTables
    Left = 56
    Top = 136
  end
  object dsFieldNames: TDataSource
    DataSet = qryFieldNames
    Left = 144
    Top = 128
  end
  object qryFieldNames: TFDQuery
    Connection = dm.fdRestaurante
    SQL.Strings = (
      'SELECT RDB$RELATION_NAME AS TABLE_NAME'
      'FROM RDB$RELATIONS'
      'WHERE RDB$SYSTEM_FLAG = 0 AND RDB$VIEW_BLR IS NULL'
      'ORDER BY TABLE_NAME;')
    Left = 144
    Top = 72
  end
  object tbFieldProperties: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 144
    Top = 184
    object tbFieldPropertiesFieldName: TStringField
      FieldName = 'FieldName'
      Size = 70
    end
    object tbFieldPropertiesExtraParams: TStringField
      FieldName = 'ExtraParams'
      Size = 300
    end
    object tbFieldPropertiesAlias: TStringField
      FieldName = 'Alias'
      Size = 70
    end
  end
  object dsReplicationServers: TDataSource
    DataSet = qryReplicationServers
    Left = 240
    Top = 128
  end
  object qryReplicationServers: TFDQuery
    Active = True
    Connection = dm.fdRestaurante
    SQL.Strings = (
      ' select rps.id, rps.guid,'
      '        rs.name,'
      '         rps.rep_schema_id, rps.active'
      '  from replication_schemas_servers rps'
      
        '    inner join replication_servers rs on  (rs.id = rps.replicati' +
        'on_server_id)'
      '    where rps.rep_schema_id=2')
    Left = 240
    Top = 72
  end
  object qrySchemas: TFDQuery
    Connection = dm.fdRestaurante
    SQL.Strings = (
      'select * from REPLICATION_SCHEMAS')
    Left = 344
    Top = 80
  end
  object dsSchemas: TDataSource
    DataSet = qrySchemas
    Left = 344
    Top = 136
  end
end
