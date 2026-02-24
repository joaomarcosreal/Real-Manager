object dmExpedicaoDelivery: TdmExpedicaoDelivery
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Height = 305
  Width = 584
  object dsTbEntregadores: TDataSource
    DataSet = tbEntregadores
    Left = 160
    Top = 24
  end
  object dsQryExpedicaoDElivery: TDataSource
    DataSet = tbExpedicaoDelivery
    Left = 187
    Top = 83
  end
  object tbExpedicaoDelivery: TFDMemTable
    AutoCalcFields = False
    ObjectView = False
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 59
    Top = 80
  end
  object tbPolling: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 320
    Top = 115
  end
  object dsPolling: TDataSource
    DataSet = tbPolling
    Left = 320
    Top = 72
  end
  object FDGUIxWaitCursor1: TFDGUIxWaitCursor
    Provider = 'Forms'
    Left = 320
    Top = 168
  end
  object tbParametrosIntegracao: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 320
    Top = 24
  end
  object tbCsClientesDelivery: TFDMemTable
    AutoCalcFields = False
    ObjectView = False
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 59
    Top = 136
  end
  object dsCsClientesDelivery: TDataSource
    DataSet = tbCsClientesDelivery
    Left = 59
    Top = 187
  end
  object tbEntregadores: TFDMemTable
    AutoCalcFields = False
    ObjectView = False
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 59
    Top = 24
  end
  object RESTClient1: TRESTClient
    BaseURL = 'https://merchant-api.ifood.com.br/order/v1.0/events:polling'
    Params = <>
    SecureProtocols = [TLS11, TLS12, TLS13]
    ConnectTimeout = 5000
    SynchronizedEvents = False
    Left = 432
    Top = 80
  end
  object RESTResponse1: TRESTResponse
    Left = 432
    Top = 184
  end
  object RESTRequest1: TRESTRequest
    AssignedValues = [rvConnectTimeout, rvReadTimeout]
    Client = RESTClient1
    Params = <
      item
        Kind = pkHTTPHEADER
        Name = 'Authorization'
        Options = [poDoNotEncode]
        Value = 
          'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzUxMiJ9.eyJzdWIiOiJiMmM3ZmI3' +
          'Zi1kZTk1LTQ1YTAtODg2YS0wOWFhY2FiNmNhYWIiLCJhcHBfbmFtZSI6InJlYWxt' +
          'YW5hZ2VyIiwiYXVkIjpbInNoaXBwaW5nIiwiY2F0YWxvZyIsImZpbmFuY2lhbCIs' +
          'InJldmlldyIsIm1lcmNoYW50Iiwib3JkZXIiLCJvYXV0aC1zZXJ2ZXIiXSwib3du' +
          'ZXJfbmFtZSI6InJlYWxzb2Z0d2FyZXMiLCJzY29wZSI6WyJzaGlwcGluZyIsImNh' +
          'dGFsb2ciLCJyZXZpZXciLCJtZXJjaGFudCIsIm9yZGVyIiwiY29uY2lsaWF0b3Ii' +
          'XSwiaXNzIjoiaUZvb2QiLCJ0eXBlIjoiY29tcGFjdCIsImV4cCI6MTY0MzM0MjQ3' +
          'OCwiaWF0IjoxNjQzMzIwODc4LCJqdGkiOiJiMmM3ZmI3Zi1kZTk1LTQ1YTAtODg2' +
          'YS0wOWFhY2FiNmNhYWI6YTg2OWY5MjEtN2FkZi00NmUxLWFiYTUtZGNlYzExMWE4' +
          'MDE1IiwibWVyY2hhbnRfc2NvcGVkIjp0cnVlLCJjbGllbnRfaWQiOiJhODY5Zjky' +
          'MS03YWRmLTQ2ZTEtYWJhNS1kY2VjMTExYTgwMTUifQ.LtT4XBDX_7-sGpn5rdWpM' +
          '7_tc_JAL2ypxt6xhn45L79MCr4pGjlGFdjqYm2DKUmBoa-ILaPYreAqUTP5BhkXj' +
          '5DcJZnSBN1VMJBGarnvBQ-1Vh4fSslBOFiFdo3z2TB70PAtdyCJWQGY0t9gKw2qu' +
          'cFHQRKcgavfZ-gqOr03ESM'
      end
      item
        Kind = pkHTTPHEADER
        Name = 'x-polling-merchants'
        Options = [poDoNotEncode]
        Value = '77fecfbf-c8e4-464a-9df7-1037d119e1d0'
      end
      item
        Kind = pkHTTPHEADER
        Name = 'FROM'
        Value = 'JOhny'
      end>
    Response = RESTResponse1
    ConnectTimeout = 5000
    ReadTimeout = 5000
    SynchronizedEvents = False
    Left = 432
    Top = 128
  end
  object tbCorrecaoCodigos: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 184
    Top = 240
  end
  object dsTbCorrecaoCodigos: TDataSource
    DataSet = tbCorrecaoCodigos
    Left = 328
    Top = 240
  end
end
