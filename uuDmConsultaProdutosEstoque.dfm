object dmConsultaProdutos: TdmConsultaProdutos
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Height = 251
  Width = 505
  object dsTbProdutosEstoque: TDataSource
    Left = 56
    Top = 103
  end
  object dsTbProdutosGeral: TDataSource
    Left = 54
    Top = 152
  end
end
