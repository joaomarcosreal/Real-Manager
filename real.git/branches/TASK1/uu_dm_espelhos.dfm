object dm_espelhos_cadastro: Tdm_espelhos_cadastro
  OldCreateOrder = False
  Left = 1
  Top = 1
  Height = 572
  Width = 798
  object qryEspelhoEntradas: TIBQuery
    Database = dm.dbrestaurante
    Transaction = dm.transacao
    Active = True
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      ''
      ''
      
        'select e.*, f.razao_social,f.nome_fantasia,tc.descricao as desc_' +
        'tp_doc,te.descricao as descricao_tp_entrada ,u.login from entrad' +
        'as     e'
      
        ' inner join tipos_documento  tc on (tc.cod_tipo_doc       = e.co' +
        'd_tipo_doc)'
      
        ' inner join tipos_entrada    te on (te.cod_tipo_entrada   = e.co' +
        'd_tipo_entrada)'
      
        ' inner join fornecedor       f  on (f.cod_fornecedor      = e.co' +
        'd_fornecedor)'
      
        ' inner join usuarios         u  on (u.cod_usuario         = e.co' +
        'd_usuario)'
      '')
    Left = 48
    Top = 16
    object qryEspelhoEntradasCOD_ENTRADA: TIBStringField
      FieldName = 'COD_ENTRADA'
      Origin = 'ENTRADAS.COD_ENTRADA'
      Required = True
      Size = 8
    end
    object qryEspelhoEntradasCOD_FORNECEDOR: TIBStringField
      FieldName = 'COD_FORNECEDOR'
      Origin = 'ENTRADAS.COD_FORNECEDOR'
      Size = 4
    end
    object qryEspelhoEntradasCOD_TIPO_ENTRADA: TIBStringField
      FieldName = 'COD_TIPO_ENTRADA'
      Origin = 'ENTRADAS.COD_TIPO_ENTRADA'
      Size = 3
    end
    object qryEspelhoEntradasCOD_TIPO_DOC: TIBStringField
      FieldName = 'COD_TIPO_DOC'
      Origin = 'ENTRADAS.COD_TIPO_DOC'
      Size = 3
    end
    object qryEspelhoEntradasNUMERO_DOC: TIBStringField
      FieldName = 'NUMERO_DOC'
      Origin = 'ENTRADAS.NUMERO_DOC'
      Size = 15
    end
    object qryEspelhoEntradasSERIE: TIBStringField
      FieldName = 'SERIE'
      Origin = 'ENTRADAS.SERIE'
      Size = 5
    end
    object qryEspelhoEntradasVALOR_TOTAL_DOC: TIBBCDField
      FieldName = 'VALOR_TOTAL_DOC'
      Origin = 'ENTRADAS.VALOR_TOTAL_DOC'
      Precision = 18
      Size = 2
    end
    object qryEspelhoEntradasDT_EMISSAO: TDateField
      FieldName = 'DT_EMISSAO'
      Origin = 'ENTRADAS.DT_EMISSAO'
    end
    object qryEspelhoEntradasDT_ENTRADA: TDateField
      FieldName = 'DT_ENTRADA'
      Origin = 'ENTRADAS.DT_ENTRADA'
    end
    object qryEspelhoEntradasCOD_USUARIO: TIBStringField
      FieldName = 'COD_USUARIO'
      Origin = 'ENTRADAS.COD_USUARIO'
      Required = True
      Size = 3
    end
    object qryEspelhoEntradasQTDE_ITENS: TSmallintField
      FieldName = 'QTDE_ITENS'
      Origin = 'ENTRADAS.QTDE_ITENS'
      Required = True
    end
    object qryEspelhoEntradasDATA: TDateField
      FieldName = 'DATA'
      Origin = 'ENTRADAS.DATA'
    end
    object qryEspelhoEntradasHORA: TTimeField
      FieldName = 'HORA'
      Origin = 'ENTRADAS.HORA'
    end
    object qryEspelhoEntradasRAZAO_SOCIAL: TIBStringField
      FieldName = 'RAZAO_SOCIAL'
      Origin = 'FORNECEDOR.RAZAO_SOCIAL'
      Required = True
      Size = 40
    end
    object qryEspelhoEntradasNOME_FANTASIA: TIBStringField
      FieldName = 'NOME_FANTASIA'
      Origin = 'FORNECEDOR.NOME_FANTASIA'
      Size = 40
    end
    object qryEspelhoEntradasDESC_TP_DOC: TIBStringField
      FieldName = 'DESC_TP_DOC'
      Origin = 'TIPOS_DOCUMENTO.DESCRICAO'
      Size = 25
    end
    object qryEspelhoEntradasDESCRICAO_TP_ENTRADA: TIBStringField
      FieldName = 'DESCRICAO_TP_ENTRADA'
      Origin = 'TIPOS_ENTRADA.DESCRICAO'
      Size = 30
    end
    object qryEspelhoEntradasLOGIN: TIBStringField
      FieldName = 'LOGIN'
      Origin = 'USUARIOS.LOGIN'
      Required = True
      Size = 15
    end
  end
  object qryEspelhoItEntradas: TIBQuery
    Database = dm.dbrestaurante
    Transaction = dm.transacao
    OnCalcFields = qryEspelhoItEntradasCalcFields
    Active = True
    BufferChunks = 1000
    CachedUpdates = False
    DataSource = dsEspelhoEntradas
    SQL.Strings = (
      ''
      
        'select ite.*, it.barras, it.descricao_item, u.descricao as desc_' +
        'unidade from itens_entrada ite'
      '  inner join itens_estoque it on (it.cod_item = ite.cod_item)'
      '  inner join  unidades u  on (u.cod_unidade  = ite.cod_unidade)'
      '   where ite.cod_entrada =:cod_entrada'
      '')
    Left = 48
    Top = 72
    ParamData = <
      item
        DataType = ftString
        Name = 'COD_ENTRADA'
        ParamType = ptUnknown
        Size = 9
      end>
    object qryEspelhoItEntradasCOD_ENTRADA: TIBStringField
      FieldName = 'COD_ENTRADA'
      Origin = 'ITENS_ENTRADA.COD_ENTRADA'
      Size = 8
    end
    object qryEspelhoItEntradasCOD_ITEM: TIBStringField
      FieldName = 'COD_ITEM'
      Origin = 'ITENS_ENTRADA.COD_ITEM'
      Size = 5
    end
    object qryEspelhoItEntradasQUANTIDADE: TIBBCDField
      FieldName = 'QUANTIDADE'
      Origin = 'ITENS_ENTRADA.QUANTIDADE'
      Precision = 18
      Size = 3
    end
    object qryEspelhoItEntradasCOD_UNIDADE: TIBStringField
      FieldName = 'COD_UNIDADE'
      Origin = 'ITENS_ENTRADA.COD_UNIDADE'
      Size = 2
    end
    object qryEspelhoItEntradasVALOR_UNITARIO: TIBBCDField
      FieldName = 'VALOR_UNITARIO'
      Origin = 'ITENS_ENTRADA.VALOR_UNITARIO'
      Precision = 18
      Size = 2
    end
    object qryEspelhoItEntradasBARRAS: TIBStringField
      FieldName = 'BARRAS'
      Origin = 'ITENS_ESTOQUE.BARRAS'
    end
    object qryEspelhoItEntradasDESCRICAO_ITEM: TIBStringField
      FieldName = 'DESCRICAO_ITEM'
      Origin = 'ITENS_ESTOQUE.DESCRICAO_ITEM'
      Required = True
      Size = 40
    end
    object qryEspelhoItEntradasDESC_UNIDADE: TIBStringField
      FieldName = 'DESC_UNIDADE'
      Origin = 'UNIDADES.DESCRICAO'
      Size = 25
    end
    object qryEspelhoItEntradasTotal: TFloatField
      FieldKind = fkCalculated
      FieldName = 'Total'
      Calculated = True
    end
  end
  object dsEspelhoEntradas: TDataSource
    DataSet = qryEspelhoEntradas
    Left = 168
    Top = 16
  end
  object dsEspelhoItEntras: TDataSource
    DataSet = qryEspelhoItEntradas
    Left = 168
    Top = 72
  end
  object rptEspelhoEntradas: TppReport
    AutoStop = False
    DataPipeline = ppEspelhoEntradas
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Report'
    PrinterSetup.PaperName = 'A4, 210x297 mm'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 297000
    PrinterSetup.mmPaperWidth = 210000
    PrinterSetup.PaperSize = 9
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = True
    PreviewFormSettings.WindowState = wsMaximized
    Left = 376
    Top = 8
    Version = '7.0'
    mmColumnWidth = 0
    DataPipelineName = 'ppEspelhoEntradas'
    object ppHeaderBand1: TppHeaderBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 149490
      mmPrintPosition = 0
      object ppLabel59: TppLabel
        UserName = 'Label43'
        AutoSize = False
        Caption = 'ESPELHO DE ENTRADA'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5821
        mmLeft = 794
        mmTop = 13494
        mmWidth = 196586
        BandType = 0
      end
      object ppDBText93: TppDBText
        UserName = 'DBText75'
        AutoSize = True
        DataField = 'RAZAO_SOCIAL'
        DataPipeline = dm_relatorios.pp_parametros
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'pp_parametros'
        mmHeight = 4995
        mmLeft = 0
        mmTop = 1058
        mmWidth = 92414
        BandType = 0
      end
      object ppDBText94: TppDBText
        UserName = 'DBText81'
        AutoSize = True
        DataField = 'NOME_FANTASIA'
        DataPipeline = dm_relatorios.pp_parametros
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'pp_parametros'
        mmHeight = 4995
        mmLeft = 0
        mmTop = 6350
        mmWidth = 37211
        BandType = 0
      end
      object ppDBText95: TppDBText
        UserName = 'DBText82'
        DataField = 'DATA_SISTEMA'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        ParentDataPipeline = False
        Transparent = True
        mmHeight = 5292
        mmLeft = 173832
        mmTop = 265
        mmWidth = 23548
        BandType = 0
      end
      object ppSystemVariable22: TppSystemVariable
        UserName = 'SystemVariable19'
        VarType = vtTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 5292
        mmLeft = 173832
        mmTop = 6350
        mmWidth = 17463
        BandType = 0
      end
      object ppSystemVariable23: TppSystemVariable
        UserName = 'SystemVariable20'
        VarType = vtPageNo
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 180446
        mmTop = 14552
        mmWidth = 2381
        BandType = 0
      end
      object ppLabel60: TppLabel
        UserName = 'Label301'
        Caption = '/'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 185738
        mmTop = 14552
        mmWidth = 1058
        BandType = 0
      end
      object ppSystemVariable24: TppSystemVariable
        UserName = 'SystemVariable21'
        VarType = vtPageCount
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 190765
        mmTop = 14552
        mmWidth = 1852
        BandType = 0
      end
      object ppShape1: TppShape
        UserName = 'Shape1'
        Pen.Width = 3
        mmHeight = 45244
        mmLeft = 0
        mmTop = 35719
        mmWidth = 197115
        BandType = 0
      end
      object ppLabel62: TppLabel
        UserName = 'Label62'
        Caption = 'Fornecedor:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 5027
        mmLeft = 2381
        mmTop = 44979
        mmWidth = 24871
        BandType = 0
      end
      object ppDBText107: TppDBText
        UserName = 'DBText107'
        DataField = 'RAZAO_SOCIAL'
        DataPipeline = ppEspelhoEntradas
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppEspelhoEntradas'
        mmHeight = 4763
        mmLeft = 28840
        mmTop = 44979
        mmWidth = 99748
        BandType = 0
      end
      object ppDBText101: TppDBText
        UserName = 'DBText1001'
        DataField = 'DESC_TP_DOC'
        DataPipeline = ppEspelhoEntradas
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppEspelhoEntradas'
        mmHeight = 4763
        mmLeft = 29369
        mmTop = 57678
        mmWidth = 63236
        BandType = 0
      end
      object ppDBText102: TppDBText
        UserName = 'DBText1002'
        DataField = 'COD_FORNECEDOR'
        DataPipeline = ppEspelhoEntradas
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppEspelhoEntradas'
        mmHeight = 4763
        mmLeft = 152136
        mmTop = 44979
        mmWidth = 15081
        BandType = 0
      end
      object ppLabel1: TppLabel
        UserName = 'Label2'
        Caption = 'C'#243'digo:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 5027
        mmLeft = 134938
        mmTop = 44979
        mmWidth = 15875
        BandType = 0
      end
      object ppLabel2: TppLabel
        UserName = 'Label3'
        Caption = 'Tipo do doc:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 5027
        mmLeft = 2381
        mmTop = 57678
        mmWidth = 25400
        BandType = 0
      end
      object ppLabel3: TppLabel
        UserName = 'Label4'
        Caption = 'N'#186'  Doc:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 5027
        mmLeft = 95779
        mmTop = 57678
        mmWidth = 17992
        BandType = 0
      end
      object ppDBText1: TppDBText
        UserName = 'DBText1'
        DataField = 'NUMERO_DOC'
        DataPipeline = ppEspelhoEntradas
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppEspelhoEntradas'
        mmHeight = 4763
        mmLeft = 114829
        mmTop = 57678
        mmWidth = 43392
        BandType = 0
      end
      object ppLabel4: TppLabel
        UserName = 'Label1'
        Caption = 'S'#233'rie:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 5027
        mmLeft = 160073
        mmTop = 57678
        mmWidth = 11906
        BandType = 0
      end
      object ppDBText2: TppDBText
        UserName = 'DBText2'
        DataField = 'SERIE'
        DataPipeline = ppEspelhoEntradas
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppEspelhoEntradas'
        mmHeight = 4763
        mmLeft = 173302
        mmTop = 57678
        mmWidth = 15081
        BandType = 0
      end
      object ppLabel5: TppLabel
        UserName = 'Label5'
        Caption = 'Emiss'#227'o:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 5027
        mmLeft = 2381
        mmTop = 64558
        mmWidth = 19050
        BandType = 0
      end
      object ppDBText3: TppDBText
        UserName = 'DBText3'
        DataField = 'DT_EMISSAO'
        DataPipeline = ppEspelhoEntradas
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppEspelhoEntradas'
        mmHeight = 4763
        mmLeft = 22754
        mmTop = 64558
        mmWidth = 19315
        BandType = 0
      end
      object ppLabel6: TppLabel
        UserName = 'Label6'
        Caption = 'Entrada:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 5027
        mmLeft = 45244
        mmTop = 64558
        mmWidth = 16933
        BandType = 0
      end
      object ppDBText4: TppDBText
        UserName = 'DBText4'
        DataField = 'DT_ENTRADA'
        DataPipeline = ppEspelhoEntradas
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppEspelhoEntradas'
        mmHeight = 4763
        mmLeft = 64029
        mmTop = 64558
        mmWidth = 22754
        BandType = 0
      end
      object ppLabel7: TppLabel
        UserName = 'Label7'
        Caption = 'Dt. Lan'#231':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 5027
        mmLeft = 92075
        mmTop = 64558
        mmWidth = 18256
        BandType = 0
      end
      object ppDBText5: TppDBText
        UserName = 'DBText5'
        DataField = 'DATA'
        DataPipeline = ppEspelhoEntradas
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppEspelhoEntradas'
        mmHeight = 4763
        mmLeft = 112184
        mmTop = 64558
        mmWidth = 20902
        BandType = 0
      end
      object ppLabel8: TppLabel
        UserName = 'Label8'
        Caption = 'Tipo de entrada:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 5027
        mmLeft = 2381
        mmTop = 51329
        mmWidth = 33073
        BandType = 0
      end
      object ppDBText6: TppDBText
        UserName = 'DBText6'
        DataField = 'DESCRICAO_TP_ENTRADA'
        DataPipeline = ppEspelhoEntradas
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppEspelhoEntradas'
        mmHeight = 4763
        mmLeft = 37042
        mmTop = 51329
        mmWidth = 91811
        BandType = 0
      end
      object ppLabel9: TppLabel
        UserName = 'Label9'
        Caption = 'Usu'#225'rio:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 5027
        mmLeft = 2381
        mmTop = 70908
        mmWidth = 17198
        BandType = 0
      end
      object ppDBText7: TppDBText
        UserName = 'DBText7'
        DataField = 'LOGIN'
        DataPipeline = ppEspelhoEntradas
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppEspelhoEntradas'
        mmHeight = 4763
        mmLeft = 21696
        mmTop = 70908
        mmWidth = 41540
        BandType = 0
      end
      object ppLabel10: TppLabel
        UserName = 'Label10'
        Caption = 'Hora:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 5027
        mmLeft = 136790
        mmTop = 64558
        mmWidth = 11113
        BandType = 0
      end
      object ppDBText8: TppDBText
        UserName = 'DBText8'
        DataField = 'HORA'
        DataPipeline = ppEspelhoEntradas
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppEspelhoEntradas'
        mmHeight = 4763
        mmLeft = 150019
        mmTop = 64558
        mmWidth = 21431
        BandType = 0
      end
      object ppRegion1: TppRegion
        UserName = 'Region1'
        Caption = 'Region1'
        Pen.Width = 0
        Stretch = True
        mmHeight = 65352
        mmLeft = 0
        mmTop = 83608
        mmWidth = 196850
        BandType = 0
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        object ppSubReport1: TppSubReport
          UserName = 'SubReport1'
          ExpandAll = False
          NewPrintJob = False
          OutlineSettings.CreateNode = True
          TraverseAllData = False
          DataPipelineName = 'ppEspelhoItEntradas'
          mmHeight = 5027
          mmLeft = 0
          mmTop = 83608
          mmWidth = 196850
          BandType = 0
          mmBottomOffset = 0
          mmOverFlowOffset = 0
          mmStopPosition = 0
          object ppChildReport1: TppChildReport
            AutoStop = False
            DataPipeline = ppEspelhoItEntradas
            PrinterSetup.BinName = 'Default'
            PrinterSetup.DocumentName = 'Report'
            PrinterSetup.PaperName = 'A4, 210x297 mm'
            PrinterSetup.PrinterName = 'Default'
            PrinterSetup.mmMarginBottom = 6350
            PrinterSetup.mmMarginLeft = 6350
            PrinterSetup.mmMarginRight = 6350
            PrinterSetup.mmMarginTop = 6350
            PrinterSetup.mmPaperHeight = 297000
            PrinterSetup.mmPaperWidth = 210000
            PrinterSetup.PaperSize = 9
            Version = '7.0'
            mmColumnWidth = 0
            DataPipelineName = 'ppEspelhoItEntradas'
            object ppTitleBand1: TppTitleBand
              mmBottomOffset = 0
              mmHeight = 6085
              mmPrintPosition = 0
              object ppShape11: TppShape
                UserName = 'Shape11'
                Brush.Color = clSilver
                Pen.Width = 2
                mmHeight = 6085
                mmLeft = 0
                mmTop = 0
                mmWidth = 197381
                BandType = 1
              end
              object ppShape17: TppShape
                UserName = 'Shape101'
                Brush.Color = clSilver
                Pen.Width = 2
                mmHeight = 6085
                mmLeft = 141288
                mmTop = 0
                mmWidth = 25400
                BandType = 1
              end
              object ppLabel61: TppLabel
                UserName = 'Label1'
                AutoSize = False
                Caption = 'C'#243'd.'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 10
                Font.Style = [fsBold]
                Transparent = True
                mmHeight = 4763
                mmLeft = 1058
                mmTop = 529
                mmWidth = 23813
                BandType = 1
              end
              object ppShape15: TppShape
                UserName = 'Shape15'
                Brush.Color = clSilver
                Pen.Width = 2
                mmHeight = 6085
                mmLeft = 24341
                mmTop = 0
                mmWidth = 94456
                BandType = 1
              end
              object ppLabel11: TppLabel
                UserName = 'Label11'
                AutoSize = False
                Caption = 'Descri'#231#227'o'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 10
                Font.Style = [fsBold]
                Transparent = True
                mmHeight = 4763
                mmLeft = 25135
                mmTop = 529
                mmWidth = 18256
                BandType = 1
              end
              object ppLabel12: TppLabel
                UserName = 'Label12'
                AutoSize = False
                Caption = 'Quantidade'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 10
                Font.Style = [fsBold]
                Transparent = True
                mmHeight = 4763
                mmLeft = 119063
                mmTop = 529
                mmWidth = 20638
                BandType = 1
              end
              object ppLabel13: TppLabel
                UserName = 'Label13'
                AutoSize = False
                Caption = 'Valor Unit'#225'rio'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 10
                Font.Style = [fsBold]
                Transparent = True
                mmHeight = 4763
                mmLeft = 142082
                mmTop = 529
                mmWidth = 23813
                BandType = 1
              end
              object ppLabel14: TppLabel
                UserName = 'Label14'
                AutoSize = False
                Caption = 'Total'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 10
                Font.Style = [fsBold]
                Transparent = True
                mmHeight = 4763
                mmLeft = 185473
                mmTop = 529
                mmWidth = 11113
                BandType = 1
              end
            end
            object ppDetailBand2: TppDetailBand
              mmBottomOffset = 0
              mmHeight = 6085
              mmPrintPosition = 0
              object ppShape2: TppShape
                UserName = 'Shape2'
                mmHeight = 6085
                mmLeft = 0
                mmTop = 0
                mmWidth = 196850
                BandType = 4
              end
              object ppShape3: TppShape
                UserName = 'Shape3'
                mmHeight = 6085
                mmLeft = 141288
                mmTop = 0
                mmWidth = 25400
                BandType = 4
              end
              object ppShape4: TppShape
                UserName = 'Shape4'
                mmHeight = 6085
                mmLeft = 24341
                mmTop = 0
                mmWidth = 94456
                BandType = 4
              end
              object ppDBText9: TppDBText
                UserName = 'DBText9'
                DataField = 'COD_ITEM'
                DataPipeline = ppEspelhoItEntradas
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 10
                Font.Style = []
                Transparent = True
                DataPipelineName = 'ppEspelhoItEntradas'
                mmHeight = 4022
                mmLeft = 794
                mmTop = 1058
                mmWidth = 17198
                BandType = 4
              end
              object ppDBText10: TppDBText
                UserName = 'DBText10'
                DataField = 'DESCRICAO_ITEM'
                DataPipeline = ppEspelhoItEntradas
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 10
                Font.Style = []
                Transparent = True
                DataPipelineName = 'ppEspelhoItEntradas'
                mmHeight = 4022
                mmLeft = 25400
                mmTop = 1323
                mmWidth = 92075
                BandType = 4
              end
              object ppDBText11: TppDBText
                UserName = 'DBText11'
                DataField = 'QUANTIDADE'
                DataPipeline = ppEspelhoItEntradas
                DisplayFormat = '###,###,##0.000'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 10
                Font.Style = []
                TextAlignment = taRightJustified
                Transparent = True
                DataPipelineName = 'ppEspelhoItEntradas'
                mmHeight = 4022
                mmLeft = 119592
                mmTop = 1058
                mmWidth = 20108
                BandType = 4
              end
              object ppDBText12: TppDBText
                UserName = 'DBText12'
                DataField = 'VALOR_UNITARIO'
                DataPipeline = ppEspelhoItEntradas
                DisplayFormat = 'R$###,###,##0.00'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 10
                Font.Style = []
                TextAlignment = taRightJustified
                Transparent = True
                DataPipelineName = 'ppEspelhoItEntradas'
                mmHeight = 4022
                mmLeft = 142875
                mmTop = 794
                mmWidth = 22490
                BandType = 4
              end
              object ppDBText13: TppDBText
                UserName = 'DBText13'
                DataField = 'Total'
                DataPipeline = ppEspelhoItEntradas
                DisplayFormat = 'R$###,###,##0.00'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 10
                Font.Style = []
                TextAlignment = taRightJustified
                Transparent = True
                DataPipelineName = 'ppEspelhoItEntradas'
                mmHeight = 3969
                mmLeft = 168540
                mmTop = 1058
                mmWidth = 26459
                BandType = 4
              end
            end
            object ppFooterBand2: TppFooterBand
              Visible = False
              mmBottomOffset = 0
              mmHeight = 0
              mmPrintPosition = 0
            end
            object ppSummaryBand1: TppSummaryBand
              mmBottomOffset = 0
              mmHeight = 6085
              mmPrintPosition = 0
              object ppShape5: TppShape
                UserName = 'Shape5'
                mmHeight = 6085
                mmLeft = 0
                mmTop = 0
                mmWidth = 196850
                BandType = 7
              end
              object ppShape6: TppShape
                UserName = 'Shape6'
                mmHeight = 6085
                mmLeft = 166423
                mmTop = 0
                mmWidth = 30692
                BandType = 7
              end
              object ppDBCalc1: TppDBCalc
                UserName = 'DBCalc1'
                DataField = 'Total'
                DataPipeline = ppEspelhoItEntradas
                DisplayFormat = 'R$###,###,##0.00'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 10
                Font.Style = []
                TextAlignment = taRightJustified
                Transparent = True
                DataPipelineName = 'ppEspelhoItEntradas'
                mmHeight = 3969
                mmLeft = 169334
                mmTop = 1323
                mmWidth = 26459
                BandType = 7
              end
            end
            object raCodeModule1: TraCodeModule
              ProgramStream = {00}
            end
          end
        end
      end
      object ppLabel15: TppLabel
        UserName = 'Label15'
        Caption = 'Valor Doc:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4995
        mmLeft = 134144
        mmTop = 51328
        mmWidth = 21251
        BandType = 0
      end
      object ppDBText14: TppDBText
        UserName = 'DBText14'
        DataField = 'VALOR_TOTAL_DOC'
        DataPipeline = ppEspelhoEntradas
        DisplayFormat = 'R$###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppEspelhoEntradas'
        mmHeight = 4763
        mmLeft = 158750
        mmTop = 51329
        mmWidth = 28310
        BandType = 0
      end
    end
    object ppDetailBand1: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 0
      mmPrintPosition = 0
    end
    object ppFooterBand1: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 5027
      mmPrintPosition = 0
    end
    object raCodeModule2: TraCodeModule
      ProgramStream = {00}
    end
  end
  object ppEspelhoEntradas: TppDBPipeline
    DataSource = dsEspelhoEntradas
    UserName = 'EspelhoEntradas'
    Left = 264
    Top = 8
    object ppEspelhoEntradasppField1: TppField
      FieldAlias = 'COD_ENTRADA'
      FieldName = 'COD_ENTRADA'
      FieldLength = 8
      DisplayWidth = 8
      Position = 0
    end
    object ppEspelhoEntradasppField2: TppField
      FieldAlias = 'COD_FORNECEDOR'
      FieldName = 'COD_FORNECEDOR'
      FieldLength = 4
      DisplayWidth = 4
      Position = 1
    end
    object ppEspelhoEntradasppField3: TppField
      FieldAlias = 'COD_TIPO_ENTRADA'
      FieldName = 'COD_TIPO_ENTRADA'
      FieldLength = 3
      DisplayWidth = 3
      Position = 2
    end
    object ppEspelhoEntradasppField4: TppField
      FieldAlias = 'COD_TIPO_DOC'
      FieldName = 'COD_TIPO_DOC'
      FieldLength = 3
      DisplayWidth = 3
      Position = 3
    end
    object ppEspelhoEntradasppField5: TppField
      FieldAlias = 'NUMERO_DOC'
      FieldName = 'NUMERO_DOC'
      FieldLength = 15
      DisplayWidth = 15
      Position = 4
    end
    object ppEspelhoEntradasppField6: TppField
      FieldAlias = 'SERIE'
      FieldName = 'SERIE'
      FieldLength = 5
      DisplayWidth = 5
      Position = 5
    end
    object ppEspelhoEntradasppField7: TppField
      Alignment = taRightJustify
      FieldAlias = 'VALOR_TOTAL_DOC'
      FieldName = 'VALOR_TOTAL_DOC'
      FieldLength = 2
      DataType = dtDouble
      DisplayWidth = 19
      Position = 6
    end
    object ppEspelhoEntradasppField8: TppField
      FieldAlias = 'DT_EMISSAO'
      FieldName = 'DT_EMISSAO'
      FieldLength = 0
      DataType = dtDate
      DisplayWidth = 10
      Position = 7
    end
    object ppEspelhoEntradasppField9: TppField
      FieldAlias = 'DT_ENTRADA'
      FieldName = 'DT_ENTRADA'
      FieldLength = 0
      DataType = dtDate
      DisplayWidth = 10
      Position = 8
    end
    object ppEspelhoEntradasppField10: TppField
      FieldAlias = 'COD_USUARIO'
      FieldName = 'COD_USUARIO'
      FieldLength = 3
      DisplayWidth = 3
      Position = 9
    end
    object ppEspelhoEntradasppField11: TppField
      Alignment = taRightJustify
      FieldAlias = 'QTDE_ITENS'
      FieldName = 'QTDE_ITENS'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 10
    end
    object ppEspelhoEntradasppField12: TppField
      FieldAlias = 'DATA'
      FieldName = 'DATA'
      FieldLength = 0
      DataType = dtDate
      DisplayWidth = 10
      Position = 11
    end
    object ppEspelhoEntradasppField13: TppField
      FieldAlias = 'HORA'
      FieldName = 'HORA'
      FieldLength = 0
      DataType = dtTime
      DisplayWidth = 10
      Position = 12
    end
    object ppEspelhoEntradasppField14: TppField
      FieldAlias = 'RAZAO_SOCIAL'
      FieldName = 'RAZAO_SOCIAL'
      FieldLength = 40
      DisplayWidth = 40
      Position = 13
    end
    object ppEspelhoEntradasppField15: TppField
      FieldAlias = 'NOME_FANTASIA'
      FieldName = 'NOME_FANTASIA'
      FieldLength = 40
      DisplayWidth = 40
      Position = 14
    end
    object ppEspelhoEntradasppField16: TppField
      FieldAlias = 'DESC_TP_DOC'
      FieldName = 'DESC_TP_DOC'
      FieldLength = 25
      DisplayWidth = 25
      Position = 15
    end
    object ppEspelhoEntradasppField17: TppField
      FieldAlias = 'DESCRICAO_TP_ENTRADA'
      FieldName = 'DESCRICAO_TP_ENTRADA'
      FieldLength = 30
      DisplayWidth = 30
      Position = 16
    end
    object ppEspelhoEntradasppField18: TppField
      FieldAlias = 'LOGIN'
      FieldName = 'LOGIN'
      FieldLength = 15
      DisplayWidth = 15
      Position = 17
    end
  end
  object ppEspelhoItEntradas: TppDBPipeline
    DataSource = dsEspelhoItEntras
    UserName = 'EspelhoItEntradas'
    Left = 264
    Top = 72
    MasterDataPipelineName = 'ppEspelhoEntradas'
    object ppEspelhoItEntradasppField1: TppField
      FieldAlias = 'COD_ENTRADA'
      FieldName = 'COD_ENTRADA'
      FieldLength = 8
      DisplayWidth = 8
      Position = 0
    end
    object ppEspelhoItEntradasppField2: TppField
      FieldAlias = 'COD_ITEM'
      FieldName = 'COD_ITEM'
      FieldLength = 5
      DisplayWidth = 5
      Position = 1
    end
    object ppEspelhoItEntradasppField3: TppField
      Alignment = taRightJustify
      FieldAlias = 'QUANTIDADE'
      FieldName = 'QUANTIDADE'
      FieldLength = 3
      DataType = dtDouble
      DisplayWidth = 19
      Position = 2
    end
    object ppEspelhoItEntradasppField4: TppField
      FieldAlias = 'COD_UNIDADE'
      FieldName = 'COD_UNIDADE'
      FieldLength = 2
      DisplayWidth = 2
      Position = 3
    end
    object ppEspelhoItEntradasppField5: TppField
      Alignment = taRightJustify
      FieldAlias = 'VALOR_UNITARIO'
      FieldName = 'VALOR_UNITARIO'
      FieldLength = 2
      DataType = dtDouble
      DisplayWidth = 19
      Position = 4
    end
    object ppEspelhoItEntradasppField6: TppField
      FieldAlias = 'BARRAS'
      FieldName = 'BARRAS'
      FieldLength = 20
      DisplayWidth = 20
      Position = 5
    end
    object ppEspelhoItEntradasppField7: TppField
      FieldAlias = 'DESCRICAO_ITEM'
      FieldName = 'DESCRICAO_ITEM'
      FieldLength = 40
      DisplayWidth = 40
      Position = 6
    end
    object ppEspelhoItEntradasppField8: TppField
      FieldAlias = 'DESC_UNIDADE'
      FieldName = 'DESC_UNIDADE'
      FieldLength = 25
      DisplayWidth = 25
      Position = 7
    end
    object ppEspelhoItEntradasppField9: TppField
      Alignment = taRightJustify
      FieldAlias = 'Total'
      FieldName = 'Total'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 8
    end
  end
end
