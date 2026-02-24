object DataModule1: TDataModule1
  OldCreateOrder = False
  Left = 192
  Top = 168
  Height = 559
  Width = 1246
  object ExportaWord: TfrxRTFExport
    FileName = 
      'C:\Documents and Settings\Administrador\Desktop\ListagemProdutos' +
      '.rtf'
    UseFileCache = True
    ShowProgress = True
    OpenAfterExport = True
    Wysiwyg = True
    Creator = 'FastReport http://www.fast-report.com'
    SuppressPageHeadersFooters = False
    HeaderFooterMode = hfText
    Left = 226
    Top = 64
  end
  object exportaXML: TfrxXMLExport
    FileName = 
      'C:\Documents and Settings\Administrador\Desktop\listagemBairros.' +
      'xls'
    UseFileCache = True
    ShowProgress = True
    OpenExcelAfterExport = True
    Background = True
    Creator = 'FastReport'
    EmptyLines = True
    SuppressPageHeadersFooters = False
    Left = 178
    Top = 64
  end
  object exportaXLS: TfrxXLSExport
    UseFileCache = True
    ShowProgress = True
    OpenExcelAfterExport = True
    AsText = False
    Background = True
    FastExport = True
    PageBreaks = True
    EmptyLines = True
    SuppressPageHeadersFooters = False
    Left = 130
    Top = 64
  end
  object exportaHtml: TfrxHTMLExport
    UseFileCache = True
    ShowProgress = True
    OpenAfterExport = True
    FixedWidth = True
    Multipage = True
    Background = False
    Centered = False
    EmptyLines = True
    Left = 74
    Top = 64
  end
  object ExportaPDF: TfrxPDFExport
    FileName = 'C:\Documents and Settings\Jo'#227'o Marcos\Desktop\FSDFSD.pdf'
    UseFileCache = True
    ShowProgress = True
    OpenAfterExport = True
    PrintOptimized = False
    Outline = False
    Author = 'FastReport'
    Subject = 'FastReport PDF export'
    Background = False
    Creator = 'FastReport (http://www.fast-report.com)'
    HTMLTags = True
    Left = 10
    Top = 64
  end
  object rpt: TfrxReport
    Version = '4.3'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 40265.754119131900000000
    ReportOptions.LastChange = 40267.684119826390000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    Left = 12
    Top = 16
    Datasets = <
      item
        DataSet = dtParametros
        DataSetName = 'dtParametros'
      end
      item
        DataSet = dtProdutos
        DataSetName = 'dtProdutos'
      end>
    Variables = <>
    Style = <
      item
        Name = 'Title'
        Color = 14211288
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = [fsBold]
      end
      item
        Name = 'Header'
        Color = 15790320
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
      end
      item
        Name = 'Group header'
        Color = 15790320
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
      end
      item
        Name = 'Data'
        Color = clNone
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
      end
      item
        Name = 'Group footer'
        Color = clNone
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        Frame.Typ = [ftTop]
      end
      item
        Name = 'Header line'
        Color = clNone
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        Frame.Width = 2.000000000000000000
      end>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = []
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 20.000000000000000000
      Columns = 2
      ColumnWidth = 95.000000000000000000
      ColumnPositions.Strings = (
        '0'
        '95')
      Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
      object ReportTitle1: TfrxReportTitle
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        Height = 109.606370000000000000
        ParentFont = False
        Top = 18.897650000000000000
        Width = 718.110700000000000000
        object dtParametrosRAZAO_SOCIAL: TfrxMemoView
          Width = 321.260050000000000000
          Height = 18.897650000000000000
          DataField = 'RAZAO_SOCIAL'
          DataSet = dtParametros
          DataSetName = 'dtParametros'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            '[dtParametros."RAZAO_SOCIAL"]')
          ParentFont = False
        end
        object dtParametrosNOME_FANTASIA: TfrxMemoView
          Top = 15.118120000000000000
          Width = 321.260050000000000000
          Height = 18.897650000000000000
          DataField = 'NOME_FANTASIA'
          DataSet = dtParametros
          DataSetName = 'dtParametros'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            '[dtParametros."NOME_FANTASIA"]')
          ParentFont = False
        end
        object Memo5: TfrxMemoView
          Left = 623.622450000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            '[Date]')
          ParentFont = False
        end
        object Memo6: TfrxMemoView
          Left = 623.622450000000000000
          Top = 18.897650000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            '[Time]')
          ParentFont = False
        end
        object Memo1: TfrxMemoView
          Align = baCenter
          Left = 128.504020000000000000
          Top = 45.354360000000000000
          Width = 461.102660000000000000
          Height = 30.236240000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -21
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            'LISTAGEM DE PRODUTOS - POR AL'#195#141'QUOTA')
          ParentFont = False
        end
        object Memo14: TfrxMemoView
          Align = baWidth
          Top = 92.826840000000000000
          Width = 718.110700000000000000
          Frame.Typ = [ftTop]
          Frame.Width = 2.000000000000000000
        end
      end
      object PageHeader1: TfrxPageHeader
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        Height = 22.677180000000000000
        ParentFont = False
        Top = 151.181200000000000000
        Width = 718.110700000000000000
        object Memo2: TfrxMemoView
          Width = 718.110236220471900000
          Height = 22.677180000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Width = 2.000000000000000000
          ParentFont = False
          Style = 'Header line'
        end
      end
      object GroupHeader1: TfrxGroupHeader
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        Height = 15.118120000000000000
        ParentFont = False
        Top = 234.330860000000000000
        Width = 359.055350000000000000
        Condition = 'dtProdutos."COD_ALIQUOTA"'
        object dtProdutosDESC_G_RAIZ: TfrxMemoView
          Left = 7.118120000000000000
          Width = 238.110390000000000000
          Height = 15.118120000000000000
          DataSet = dtProdutos
          DataSetName = 'dtProdutos'
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            '[dtProdutos."DESC_ALIQUOTA"]')
          ParentFont = False
        end
      end
      object GroupHeader3: TfrxGroupHeader
        Height = 37.795300000000000000
        Top = 272.126160000000000000
        Width = 359.055350000000000000
        Condition = 'dtProdutos."COD_GRUPO"'
        DrillDown = True
        ExpandDrillDown = True
        object dtProdutosDESCRICAO_GRUPO: TfrxMemoView
          Left = 0.677180000000000000
          Top = 1.000000000000000000
          Width = 238.110390000000000000
          Height = 18.897650000000000000
          DataField = 'DESCRICAO_GRUPO'
          DataSet = dtProdutos
          DataSetName = 'dtProdutos'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            '[dtProdutos."DESCRICAO_GRUPO"]')
          ParentFont = False
        end
        object Memo9: TfrxMemoView
          Left = 9.456710000000000000
          Top = 18.897650000000000000
          Width = 52.913420000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8 = (
            'C'#195#179'digo')
          ParentFont = False
        end
        object Memo8: TfrxMemoView
          Left = 62.370130000000000000
          Top = 18.897650000000000000
          Width = 215.433070870000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8 = (
            'Descri'#195#167#195#163'o')
          ParentFont = False
        end
        object Memo3: TfrxMemoView
          Left = 277.803479130000000000
          Top = 18.897650000000000000
          Width = 60.472340870000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.UTF8 = (
            'Pre'#195#167'o')
          ParentFont = False
        end
      end
      object MasterData1: TfrxMasterData
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        Height = 15.118120000000000000
        ParentFont = False
        Top = 332.598640000000000000
        Width = 359.055350000000000000
        DataSet = dtProdutos
        DataSetName = 'dtProdutos'
        RowCount = 0
        object Memo11: TfrxMemoView
          Left = 9.456692910000000000
          Top = 0.220469999999977500
          Width = 52.913385830000000000
          Height = 15.118120000000000000
          DataField = 'COD_BARRAS'
          DataSet = dtProdutos
          DataSetName = 'dtProdutos'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8 = (
            '[dtProdutos."COD_BARRAS"]')
          ParentFont = False
        end
        object dtProdutosDESCRICAO: TfrxMemoView
          Left = 62.370078740000000000
          Top = 0.220469999999977500
          Width = 215.433210000000000000
          Height = 15.118120000000000000
          DataField = 'DESCRICAO'
          DataSet = dtProdutos
          DataSetName = 'dtProdutos'
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8 = (
            '[dtProdutos."DESCRICAO"]')
          ParentFont = False
        end
        object Memo4: TfrxMemoView
          Left = 277.803340000000000000
          Width = 60.472480000000000000
          Height = 15.118120000000000000
          DataSet = dtProdutos
          DataSetName = 'dtProdutos'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.UTF8 = (
            '[dtProdutos."VALOR_UNITARIO"]')
          ParentFont = False
        end
      end
      object GroupFooter1: TfrxGroupFooter
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Top = 393.071120000000000000
        Width = 359.055350000000000000
      end
      object GroupFooter3: TfrxGroupFooter
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Top = 370.393940000000000000
        Width = 359.055350000000000000
      end
      object PageFooter1: TfrxPageFooter
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        Height = 41.574830000000000000
        ParentFont = False
        Top = 453.543600000000000000
        Width = 718.110700000000000000
        object Memo16: TfrxMemoView
          Align = baWidth
          Top = 6.000000000000056000
          Width = 718.110700000000000000
          Frame.Typ = [ftTop]
          Frame.Width = 2.000000000000000000
        end
        object Memo18: TfrxMemoView
          Align = baRight
          Left = 642.520100000000000000
          Top = 9.000000000000056000
          Width = 75.590600000000000000
          Height = 22.677180000000000000
          DisplayFormat.DecimalSeparator = ','
          HAlign = haRight
          Memo.UTF8 = (
            'P'#195#161'gina [Page#]/[TotalPages#]')
        end
        object Memo15: TfrxMemoView
          Left = 3.779530000000000000
          Top = 9.070866139999964000
          Width = 313.700990000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsItalic]
          Memo.UTF8 = (
            'Real Manager - Sistema de Automa'#195#167#195#163'o Comercial')
          ParentFont = False
        end
        object Memo17: TfrxMemoView
          Left = 3.779530000000000000
          Top = 22.677180000000020000
          Width = 313.700990000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsItalic]
          Memo.UTF8 = (
            'www.realsoftwaresba.com.br')
          ParentFont = False
        end
      end
    end
  end
  object exportaCSV: TfrxCSVExport
    UseFileCache = True
    ShowProgress = True
    Separator = ';'
    OEMCodepage = False
    Left = 282
    Top = 64
  end
  object exportaTxt: TfrxSimpleTextExport
    UseFileCache = True
    ShowProgress = True
    Frames = False
    EmptyLines = False
    OEMCodepage = False
    OpenAfterExport = True
    Left = 72
    Top = 16
  end
  object exPortaGif: TfrxGIFExport
    UseFileCache = True
    ShowProgress = True
    Left = 128
    Top = 16
  end
  object exportaJPG: TfrxJPEGExport
    UseFileCache = True
    ShowProgress = True
    Left = 176
    Top = 16
  end
  object exportaBMP: TfrxBMPExport
    FileName = 'C:\Documents and Settings\Administrador\Desktop\Rel.bmp'
    UseFileCache = True
    ShowProgress = True
    Left = 224
    Top = 16
  end
  object exportaEmail: TfrxMailExport
    UseFileCache = True
    ShowProgress = True
    ShowExportDialog = True
    SmtpPort = 25
    UseIniFile = True
    Left = 280
    Top = 16
  end
  object qryParametros: TIBQuery
    Database = dm.dbrestaurante
    Transaction = dm.transacao
    Active = True
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      ''
      'select * from parametros')
    Left = 18
    Top = 185
  end
  object dtParametros: TfrxDBDataset
    UserName = 'dtParametros'
    CloseDataSource = False
    DataSet = qryParametros
    Left = 20
    Top = 134
  end
  object qryProdutos: TIBQuery
    Database = dm.dbrestaurante
    Transaction = dm.transacao
    Active = True
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      ''
      
        'select vp.*, al.percentagem,al.descricao as desc_aliquota,mp.des' +
        'cricao as miniprinter from v_produtos vp'
      ' inner join aliquotas al on (al.cod_aliquota = vp.cod_aliquota)'
      
        ' inner join miniprinters mp on (mp.cod_miniprinter  = vp.cod_min' +
        'i_printer)'
      ' order by COD_GRUPO,COD_BARRAS')
    Left = 200
    Top = 224
  end
  object dtProdutos: TfrxDBDataset
    UserName = 'dtProdutos'
    CloseDataSource = False
    DataSet = qryProdutos
    Left = 200
    Top = 272
  end
  object frxReport1: TfrxReport
    Version = '4.3'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 40265.754119131900000000
    ReportOptions.LastChange = 40266.509288009300000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    Left = 588
    Top = 272
    Datasets = <
      item
        DataSet = dtParametros
        DataSetName = 'dtParametros'
      end
      item
        DataSet = dtProdutos
        DataSetName = 'dtProdutos'
      end>
    Variables = <>
    Style = <
      item
        Name = 'Title'
        Color = 14211288
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = [fsBold]
      end
      item
        Name = 'Header'
        Color = 15790320
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
      end
      item
        Name = 'Group header'
        Color = 15790320
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
      end
      item
        Name = 'Data'
        Color = clNone
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
      end
      item
        Name = 'Group footer'
        Color = clNone
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        Frame.Typ = [ftTop]
      end
      item
        Name = 'Header line'
        Color = clNone
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        Frame.Width = 2.000000000000000000
      end>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      object ReportTitle1: TfrxReportTitle
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        Height = 90.708720000000000000
        ParentFont = False
        Top = 18.897650000000000000
        Width = 718.110700000000000000
        object Memo1: TfrxMemoView
          Align = baWidth
          Top = 41.574830000000000000
          Width = 718.110700000000000000
          Height = 22.677180000000000000
          Color = 14211288
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8 = (
            'LISTAGEM DE PRODUTOS')
          ParentFont = False
          Style = 'Title'
          VAlign = vaCenter
        end
        object dtParametrosRAZAO_SOCIAL: TfrxMemoView
          Width = 321.260050000000000000
          Height = 18.897650000000000000
          DataField = 'RAZAO_SOCIAL'
          DataSet = dtParametros
          DataSetName = 'dtParametros'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            '[dtParametros."RAZAO_SOCIAL"]')
          ParentFont = False
        end
        object dtParametrosNOME_FANTASIA: TfrxMemoView
          Top = 15.118120000000000000
          Width = 321.260050000000000000
          Height = 18.897650000000000000
          DataField = 'NOME_FANTASIA'
          DataSet = dtParametros
          DataSetName = 'dtParametros'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            '[dtParametros."NOME_FANTASIA"]')
          ParentFont = False
        end
        object Memo5: TfrxMemoView
          Left = 948.662030000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            '[Date]')
          ParentFont = False
        end
        object Memo6: TfrxMemoView
          Left = 948.662030000000000000
          Top = 18.897650000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            '[Time]')
          ParentFont = False
        end
      end
      object PageHeader1: TfrxPageHeader
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        Height = 22.677180000000000000
        ParentFont = False
        Top = 132.283550000000000000
        Width = 718.110700000000000000
        object Memo2: TfrxMemoView
          Width = 718.110236220471900000
          Height = 22.677180000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Width = 2.000000000000000000
          ParentFont = False
          Style = 'Header line'
        end
      end
      object GroupHeader1: TfrxGroupHeader
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        Height = 15.118120000000000000
        ParentFont = False
        Top = 215.433210000000000000
        Width = 718.110700000000000000
        Condition = 'dtProdutos."COD_G_RAIZ"'
        object dtProdutosDESC_G_RAIZ: TfrxMemoView
          Left = -1.000000000000000000
          Top = 3.779529999999994000
          Width = 238.110390000000000000
          Height = 15.118120000000000000
          DataField = 'DESC_G_RAIZ'
          DataSet = dtProdutos
          DataSetName = 'dtProdutos'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            '[dtProdutos."DESC_G_RAIZ"]')
          ParentFont = False
        end
      end
      object GroupHeader2: TfrxGroupHeader
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        Height = 11.338590000000000000
        ParentFont = False
        Top = 253.228510000000000000
        Width = 718.110700000000000000
        Condition = 'dtProdutos."COD_G_PAI"'
        object dtProdutosDESC_G_PAI: TfrxMemoView
          Left = 11.338590000000000000
          Width = 238.110390000000000000
          Height = 15.118120000000000000
          DataField = 'DESC_G_PAI'
          DataSet = dtProdutos
          DataSetName = 'dtProdutos'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            '[dtProdutos."DESC_G_PAI"]')
          ParentFont = False
        end
      end
      object GroupHeader3: TfrxGroupHeader
        Height = 41.574830000000000000
        Top = 287.244280000000000000
        Width = 718.110700000000000000
        Condition = 'dtProdutos."COD_GRUPO"'
        DrillDown = True
        ExpandDrillDown = True
        object dtProdutosDESCRICAO_GRUPO: TfrxMemoView
          Left = 22.677180000000000000
          Width = 238.110390000000000000
          Height = 18.897650000000000000
          DataField = 'DESCRICAO_GRUPO'
          DataSet = dtProdutos
          DataSetName = 'dtProdutos'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            '[dtProdutos."DESCRICAO_GRUPO"]')
          ParentFont = False
        end
        object Memo9: TfrxMemoView
          Left = 26.456710000000000000
          Top = 18.897650000000110000
          Width = 52.913420000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8 = (
            'C'#195#179'digo')
          ParentFont = False
        end
        object Memo8: TfrxMemoView
          Left = 79.370130000000000000
          Top = 18.897650000000110000
          Width = 215.433070870000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8 = (
            'Descri'#195#167#195#163'o')
          ParentFont = False
        end
        object Memo3: TfrxMemoView
          Left = 294.803479130000000000
          Top = 18.897650000000000000
          Width = 60.472340870000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.UTF8 = (
            'Pre'#195#167'o')
          ParentFont = False
        end
        object Memo7: TfrxMemoView
          Left = 355.275820000000000000
          Top = 18.897650000000000000
          Width = 60.472340870000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.UTF8 = (
            'Custo')
          ParentFont = False
        end
        object Memo12: TfrxMemoView
          Left = 415.748300000000000000
          Top = 18.897650000000000000
          Width = 71.810930870000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.UTF8 = (
            'Comiss'#195#163'o')
          ParentFont = False
        end
        object Memo14: TfrxMemoView
          Left = 487.559370000000000000
          Top = 18.897650000000000000
          Width = 71.810930870000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.UTF8 = (
            'Dt. cadastro')
          ParentFont = False
        end
        object Memo15: TfrxMemoView
          Left = 559.370440000000000000
          Top = 18.897650000000000000
          Width = 71.810930870000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.UTF8 = (
            'N'#194#186' de vendas')
          ParentFont = False
        end
      end
      object MasterData1: TfrxMasterData
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        Height = 15.118120000000000000
        ParentFont = False
        Top = 351.496290000000000000
        Width = 718.110700000000000000
        DataSet = dtProdutos
        DataSetName = 'dtProdutos'
        RowCount = 0
        object Memo11: TfrxMemoView
          Left = 26.456692910000000000
          Top = 0.220469999999977500
          Width = 52.913385830000000000
          Height = 15.118120000000000000
          DataField = 'COD_BARRAS'
          DataSet = dtProdutos
          DataSetName = 'dtProdutos'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8 = (
            '[dtProdutos."COD_BARRAS"]')
          ParentFont = False
        end
        object dtProdutosDESCRICAO: TfrxMemoView
          Left = 79.370078740000000000
          Top = 0.220469999999977500
          Width = 215.433210000000000000
          Height = 15.118120000000000000
          DataField = 'DESCRICAO'
          DataSet = dtProdutos
          DataSetName = 'dtProdutos'
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8 = (
            '[dtProdutos."DESCRICAO"]')
          ParentFont = False
        end
        object Memo4: TfrxMemoView
          Left = 294.803340000000000000
          Top = 0.377952760000027900
          Width = 60.472480000000000000
          Height = 15.118120000000000000
          DataSet = dtProdutos
          DataSetName = 'dtProdutos'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.UTF8 = (
            '[dtProdutos."VALOR_UNITARIO"]')
          ParentFont = False
        end
        object Memo10: TfrxMemoView
          Left = 355.275820000000000000
          Top = 0.377952755905539600
          Width = 60.472480000000000000
          Height = 15.118120000000000000
          DataField = 'CUSTODIGITADO'
          DataSet = dtProdutos
          DataSetName = 'dtProdutos'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.UTF8 = (
            '[dtProdutos."CUSTODIGITADO"]')
          ParentFont = False
        end
        object dtProdutosVALOR_COMISSAO: TfrxMemoView
          Left = 415.748300000000000000
          Top = 0.377952760000027900
          Width = 71.811070000000000000
          Height = 15.118120000000000000
          DataSet = dtProdutos
          DataSetName = 'dtProdutos'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.UTF8 = (
            '[dtProdutos."VALOR_COMISSAO"]')
          ParentFont = False
        end
        object Memo13: TfrxMemoView
          Left = 487.559370000000000000
          Width = 71.811070000000000000
          Height = 15.118120000000000000
          DataSet = dtProdutos
          DataSetName = 'dtProdutos'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = 'dd/mm/yyyy'
          DisplayFormat.Kind = fkDateTime
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '[dtProdutos."DATA_CADASTRO"]')
          ParentFont = False
        end
        object Memo19: TfrxMemoView
          Left = 559.370440000000000000
          Width = 71.811070000000000000
          Height = 15.118120000000000000
          DataSet = dtProdutos
          DataSetName = 'dtProdutos'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '[dtProdutos."NUMERO_VENDAS"]')
          ParentFont = False
        end
      end
      object GroupFooter1: TfrxGroupFooter
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Top = 434.645950000000000000
        Width = 718.110700000000000000
      end
      object GroupFooter2: TfrxGroupFooter
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Top = 411.968770000000000000
        Width = 718.110700000000000000
      end
      object GroupFooter3: TfrxGroupFooter
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Top = 389.291590000000000000
        Width = 718.110700000000000000
      end
      object PageFooter1: TfrxPageFooter
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        Height = 37.795300000000000000
        ParentFont = False
        Top = 495.118430000000000000
        Width = 718.110700000000000000
        object Memo16: TfrxMemoView
          Align = baWidth
          Top = 7.000000000000000000
          Width = 718.110700000000000000
          Frame.Typ = [ftTop]
          Frame.Width = 2.000000000000000000
        end
        object Memo18: TfrxMemoView
          Align = baRight
          Left = 642.520100000000000000
          Top = 11.000000000000000000
          Width = 75.590600000000000000
          Height = 22.677180000000000000
          DisplayFormat.DecimalSeparator = ','
          HAlign = haRight
          Memo.UTF8 = (
            'P'#195#161'gina [Page#]/[TotalPages#]')
        end
      end
    end
  end
end
