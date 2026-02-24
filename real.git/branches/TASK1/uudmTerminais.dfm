object dmTerminais: TdmTerminais
  OldCreateOrder = False
  Left = 226
  Top = 184
  Height = 145
  Width = 316
  object qryTerminal0: TIBQuery
    Database = dm.dbrestaurante
    Transaction = dm.transacao
    BufferChunks = 1000
    CachedUpdates = False
    Left = 24
    Top = 16
  end
  object qryTerminal1: TIBQuery
    Database = dm.dbrestaurante
    Transaction = dm.transacao
    BufferChunks = 1000
    CachedUpdates = False
    Left = 88
    Top = 16
  end
end
