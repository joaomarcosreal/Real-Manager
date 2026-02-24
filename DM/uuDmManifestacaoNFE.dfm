object dmManifestacaoNFE: TdmManifestacaoNFE
  OnDestroy = DataModuleDestroy
  Height = 592
  Width = 1347
  object dsManifestacaoNFE: TDataSource
    DataSet = tbManifestacaoNFE
    Left = 79
    Top = 122
  end
  object tbManifestacaoNFE: TFDMemTable
    Filtered = True
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    FormatOptions.AssignedValues = [fvMaxBcdPrecision]
    FormatOptions.MaxBcdPrecision = 20
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 132
    Top = 60
  end
  object TBExportacao: TFDMemTable
    Filtered = True
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    FormatOptions.AssignedValues = [fvMaxBcdPrecision]
    FormatOptions.MaxBcdPrecision = 20
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 208
    Top = 64
  end
  object dtManifestacaoNFE: TfrxDBDataset
    UserName = 'dtManifestacaoNFE'
    CloseDataSource = False
    FieldAliases.Strings = (
      'CHAVE_NFE=CHAVE_NFE'
      'CNPJ=CNPJ'
      'IE=IE'
      'NOME_FORNECEDOR=NOME_FORNECEDOR'
      'DATA_EMISSAO=DATA_EMISSAO'
      'VALOR_NOTA=VALOR_NOTA'
      'NUMERO_NOTA=NUMERO_NOTA'
      'CAMINHO_XML=CAMINHO_XML'
      'DATA_INSERCAO=DATA_INSERCAO'
      'STATUS_NFE=STATUS_NFE'
      'LANCADA=LANCADA'
      'FORN_CADASTRADO=FORN_CADASTRADO'
      'TIPO_MANIFESTACAO=TIPO_MANIFESTACAO'
      'DATA_HORA_MANIFESTACAO=DATA_HORA_MANIFESTACAO'
      'ID_MANIFESTACAO=ID_MANIFESTACAO'
      'PROTOCOLO_MANIFESTACAO=PROTOCOLO_MANIFESTACAO'
      'XML_BAIXADO=XML_BAIXADO'
      'MANIFESTO=MANIFESTO')
    DataSet = tbManifestacaoNFE
    BCDToCurrency = False
    DataSetOptions = []
    Left = 379
    Top = 73
  end
  object rpt: TfrxReport
    Tag = 1
    Version = '2022.1.3'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Padr'#227'o'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 41996.497278761600000000
    ReportOptions.LastChange = 42153.530569479200000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      ''
      'begin'
      ''
      'end.')
    OnGetValue = rptGetValue
    OnReportPrint = 'frxReportOnReportPrint'
    Left = 118
    Top = 240
    Datasets = <
      item
        DataSet = dtManifestacaoNFE
        DataSetName = 'dtManifestacaoNFE'
      end
      item
        DataSet = dRelatorios.dtParametros
        DataSetName = 'dtParametros'
      end>
    Variables = <>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      Orientation = poLandscape
      PaperWidth = 279.400000000000000000
      PaperHeight = 215.900000000000000000
      PaperSize = 1
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      Frame.Typ = []
      MirrorMode = []
      object PageFooter1: TfrxPageFooter
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 18.897650000000000000
        Top = 464.882190000000000000
        Width = 980.410082000000000000
        object Memo1: TfrxMemoView
          AllowVectorExport = True
          Left = 895.748610000000000000
          Top = 3.559060000000000000
          Width = 75.590600000000000000
          Height = 18.897650000000000000
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            '[Page#]')
        end
      end
      object ReportTitle1: TfrxReportTitle
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 90.370130000000000000
        Top = 18.897650000000000000
        Width = 980.410082000000000000
        object Memo41: TfrxMemoView
          AllowVectorExport = True
          Left = -73.590600000000000000
          Top = 38.456710000000000000
          Width = 1043.394250000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold, fsUnderline]
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            'LISTAGENS DE NOTAS FISCAIS POR MANIFESTA'#199#195'O')
          ParentFont = False
        end
        object Line1: TfrxLineView
          AllowVectorExport = True
          Left = 2.000000000000000000
          Top = 86.307050000000000000
          Width = 1047.645640000000000000
          StretchMode = smMaxHeight
          Color = clBlack
          Frame.Typ = [ftTop]
          Frame.Width = 2.000000000000000000
        end
        object Memo42: TfrxMemoView
          AllowVectorExport = True
          Left = 3.000000000000000000
          Top = 0.307050000000000000
          Width = 584.488250000000000000
          Height = 22.677180000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            '[dtParametros."RAZAO_SOCIAL"]')
          ParentFont = False
        end
        object Memo43: TfrxMemoView
          AllowVectorExport = True
          Left = 3.000000000000000000
          Top = 17.307050000000000000
          Width = 584.488250000000000000
          Height = 22.677180000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            '[dtParametros."NOME_FANTASIA"]')
          ParentFont = False
        end
        object Memo44: TfrxMemoView
          AllowVectorExport = True
          Left = 881.747990000000000000
          Top = 0.307050000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = 'mm.dd.yyyy'
          DisplayFormat.Kind = fkDateTime
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[Date]')
          ParentFont = False
        end
        object Memo45: TfrxMemoView
          AllowVectorExport = True
          Left = 882.747990000000000000
          Top = 23.307050000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = 'hh:mm'
          DisplayFormat.Kind = fkDateTime
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[Time]')
          ParentFont = False
        end
        object Memo46: TfrxMemoView
          AllowVectorExport = True
          Left = -88.401670000000000000
          Top = 64.472480000000000000
          Width = 1043.394250000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[PeriodoRelatorio]')
          ParentFont = False
        end
      end
      object GroupHeader2: TfrxGroupHeader
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 45.354360000000000000
        Top = 170.078850000000000000
        Width = 980.410082000000000000
        Condition = 'dtManifestacaoNFE."MANIFESTO"'
        object Memo5: TfrxMemoView
          AllowVectorExport = True
          Width = 238.110390000000000000
          Height = 15.118120000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clMaroon
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            '[dtManifestacaoNFE."MANIFESTO"]')
          ParentFont = False
        end
        object Memo14: TfrxMemoView
          AllowVectorExport = True
          Top = 22.677180000000000000
          Width = 238.110390000000000000
          Height = 18.897625590000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Fill.BackColor = clGray
          HAlign = haCenter
          Memo.UTF8W = (
            'Fornecedor')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo15: TfrxMemoView
          AllowVectorExport = True
          Left = 239.110390000000000000
          Top = 22.677180000000000000
          Width = 98.267780000000000000
          Height = 18.897625590000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftRight, ftTop, ftBottom]
          Fill.BackColor = clGray
          HAlign = haCenter
          Memo.UTF8W = (
            'N'#186' da nota')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo16: TfrxMemoView
          AllowVectorExport = True
          Left = 339.141930000000000000
          Top = 22.677180000000000000
          Width = 56.692950000000000000
          Height = 18.897625590000000000
          DataSet = dtManifestacaoNFE
          DataSetName = 'dtManifestacaoNFE'
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftRight, ftTop, ftBottom]
          Fill.BackColor = clGray
          HAlign = haCenter
          Memo.UTF8W = (
            'Emiss'#227'o')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo17: TfrxMemoView
          AllowVectorExport = True
          Left = 395.834880000000000000
          Top = 22.677180000000000000
          Width = 79.370130000000000000
          Height = 18.897625590000000000
          DataSet = dtManifestacaoNFE
          DataSetName = 'dtManifestacaoNFE'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Fill.BackColor = clGray
          HAlign = haCenter
          Memo.UTF8W = (
            'Valor')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo18: TfrxMemoView
          AllowVectorExport = True
          Left = 476.220780000000000000
          Top = 22.677180000000000000
          Width = 532.913730000000000000
          Height = 18.897625590000000000
          DataSet = dtManifestacaoNFE
          DataSetName = 'dtManifestacaoNFE'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Fill.BackColor = clGray
          HAlign = haCenter
          Memo.UTF8W = (
            'Chave da NFE')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object MasterData1: TfrxMasterData
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 40.062992125984300000
        Top = 238.110390000000000000
        Width = 980.410082000000000000
        DataSet = dtManifestacaoNFE
        DataSetName = 'dtManifestacaoNFE'
        RowCount = 0
        object Memo2: TfrxMemoView
          AllowVectorExport = True
          Left = 1.779530000000000000
          Width = 238.110390000000000000
          Height = 37.795275590000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8W = (
            '[dtManifestacaoNFE."NOME_FORNECEDOR"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo3: TfrxMemoView
          AllowVectorExport = True
          Left = 240.889920000000000000
          Width = 98.267780000000000000
          Height = 37.795275590000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftRight, ftTop, ftBottom]
          Memo.UTF8W = (
            '[dtManifestacaoNFE."NUMERO_NOTA"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo4: TfrxMemoView
          AllowVectorExport = True
          Left = 340.921460000000000000
          Width = 56.692950000000000000
          Height = 37.795275590000000000
          DataField = 'DATA_EMISSAO'
          DataSet = dtManifestacaoNFE
          DataSetName = 'dtManifestacaoNFE'
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftRight, ftTop, ftBottom]
          Memo.UTF8W = (
            '[dtManifestacaoNFE."DATA_EMISSAO"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo7: TfrxMemoView
          AllowVectorExport = True
          Left = 397.614410000000000000
          Width = 79.370130000000000000
          Height = 37.795275590000000000
          DataSet = dtManifestacaoNFE
          DataSetName = 'dtManifestacaoNFE'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.UTF8W = (
            '[dtManifestacaoNFE."VALOR_NOTA"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object BarCode1: TfrxBarCodeView
          AllowVectorExport = True
          Left = 479.984540000000000000
          Top = 0.220470000000000000
          Width = 134.000000000000000000
          Height = 37.795300000000000000
          BarType = bcCodeEAN128A
          Expression = '<dtManifestacaoNFE."CHAVE_NFE">'
          Frame.Typ = [ftRight, ftTop, ftBottom]
          Rotation = 0
          TestLine = False
          Text = '12345678'
          WideBarRatio = 2.000000000000000000
          Zoom = 1.000000000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          ColorBar = clBlack
        end
      end
      object GroupFooter1: TfrxGroupFooter
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 26.456710000000000000
        Top = 302.362400000000000000
        Width = 980.410082000000000000
        object Memo6: TfrxMemoView
          AllowVectorExport = True
          Left = 1.000000000000000000
          Width = 113.385900000000000000
          Height = 22.677180000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -15
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            '[COUNT(MasterData1)] notas.')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo8: TfrxMemoView
          AllowVectorExport = True
          Left = 113.385900000000000000
          Width = 222.992270000000000000
          Height = 22.677180000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -15
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            'Manifesto: [dtManifestacaoNFE."MANIFESTO"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo9: TfrxMemoView
          AllowVectorExport = True
          Left = 336.378170000000000000
          Width = 139.842610000000000000
          Height = 22.677180000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -15
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.UTF8W = (
            '[SUM(<dtManifestacaoNFE."VALOR_NOTA">,MasterData1)]')
          ParentFont = False
        end
      end
      object ReportSummary1: TfrxReportSummary
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 52.913420000000000000
        Top = 389.291590000000000000
        Width = 980.410082000000000000
        object Memo10: TfrxMemoView
          AllowVectorExport = True
          Left = 336.378170000000000000
          Top = 27.000000000000000000
          Width = 139.842610000000000000
          Height = 22.677180000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -15
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.UTF8W = (
            '[SUM(<dtManifestacaoNFE."VALOR_NOTA">,MasterData1)]')
          ParentFont = False
        end
        object Memo11: TfrxMemoView
          AllowVectorExport = True
          Left = 113.385900000000000000
          Top = 27.000000000000000000
          Width = 222.992270000000000000
          Height = 22.677180000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -15
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            'Total de Notas:')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo12: TfrxMemoView
          AllowVectorExport = True
          Top = 27.000000000000000000
          Width = 113.385900000000000000
          Height = 22.677180000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -15
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            '[COUNT(MasterData1)] notas.')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo13: TfrxMemoView
          AllowVectorExport = True
          Top = 7.559060000000000000
          Width = 476.220780000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Fill.BackColor = clGray
          HAlign = haCenter
          Memo.UTF8W = (
            'RESUMO GERAL ')
          ParentFont = False
          VAlign = vaCenter
        end
      end
    end
  end
  object frxPDFExport1: TfrxPDFExport
    ExportNotPrintable = True
    UseFileCache = True
    ShowProgress = True
    OverwritePrompt = False
    CreationTime = 43774.536455798610000000
    DataOnly = False
    Compressed = False
    EmbeddedFonts = True
    EmbedFontsIfProtected = False
    InteractiveFormsFontSubset = 'A-Z,a-z,0-9,#43-#47 '
    OpenAfterExport = False
    PrintOptimized = True
    Outline = False
    Background = False
    HTMLTags = True
    Quality = 100
    Transparency = False
    Author = 'FastReport'
    Subject = 'FastReport PDF export'
    Creator = 'FastReport'
    ProtectionFlags = [ePrint, eModify, eCopy, eAnnot]
    HideToolbar = False
    HideMenubar = False
    HideWindowUI = False
    FitWindow = False
    CenterWindow = True
    PrintScaling = False
    PdfA = False
    PDFStandard = psNone
    PDFVersion = pv17
    Left = 120
    Top = 288
  end
  object frxDOCXExport1: TfrxDOCXExport
    UseFileCache = True
    ShowProgress = True
    OverwritePrompt = False
    DataOnly = False
    OpenAfterExport = False
    PictureType = gpPNG
    ExportType = dxTable
    Left = 120
    Top = 336
  end
  object frxBIFFExport1: TfrxBIFFExport
    UseFileCache = True
    ShowProgress = True
    OverwritePrompt = False
    DataOnly = False
    OpenAfterExport = False
    RowHeightScale = 1.000000000000000000
    ChunkSize = 0
    Inaccuracy = 10.000000000000000000
    FitPages = False
    Pictures = True
    ParallelPages = 0
    Left = 120
    Top = 384
  end
  object frxXMLExport1: TfrxXMLExport
    UseFileCache = True
    ShowProgress = True
    OverwritePrompt = False
    DataOnly = False
    Background = True
    Creator = 'FastReport'
    EmptyLines = True
    SuppressPageHeadersFooters = False
    RowsCount = 0
    Split = ssNotSplit
    Left = 120
    Top = 432
  end
  object frxXLSExport1: TfrxXLSExport
    UseFileCache = True
    ShowProgress = True
    OverwritePrompt = False
    DataOnly = True
    ExportEMF = True
    ExportPictures = False
    AsText = False
    Background = True
    FastExport = True
    PageBreaks = True
    EmptyLines = True
    SuppressPageHeadersFooters = False
    GridLines = False
    Left = 120
    Top = 480
  end
  object tbItensEntradaNFE: TFDMemTable
    Filtered = True
    FieldDefs = <>
    IndexDefs = <>
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    FormatOptions.AssignedValues = [fvMaxBcdPrecision]
    FormatOptions.MaxBcdPrecision = 20
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    StoreDefs = True
    Left = 207
    Top = 142
    object tbItensEntradaNFEordem: TIntegerField
      FieldName = 'ordem'
    end
    object tbItensEntradaNFEcodProduto: TStringField
      FieldName = 'codProduto'
      Size = 5
    end
    object tbItensEntradaNFEdescricaoProduto: TStringField
      FieldName = 'descricaoProduto'
      Size = 80
    end
    object tbItensEntradaNFEQuantidade: TFMTBCDField
      FieldName = 'Quantidade'
      Precision = 5
      Size = 0
    end
    object tbItensEntradaNFEPreco: TCurrencyField
      FieldName = 'Preco'
    end
    object tbItensEntradaNFECodUnidade: TStringField
      FieldName = 'CodUnidade'
      Size = 2
    end
    object tbItensEntradaNFEDescricaoUnidade: TStringField
      FieldName = 'DescricaoUnidade'
      Size = 25
    end
    object tbItensEntradaNFESiglaUnidade: TStringField
      FieldName = 'SiglaUnidade'
      Size = 5
    end
    object tbItensEntradaNFEParametroUnidade: TBCDField
      FieldName = 'ParametroUnidade'
    end
    object tbItensEntradaNFECST: TStringField
      FieldName = 'CST'
      Size = 3
    end
    object tbItensEntradaNFECFOP: TStringField
      FieldName = 'CFOP'
      Size = 4
    end
    object tbItensEntradaNFEDesconto: TCurrencyField
      FieldName = 'Desconto'
    end
    object tbItensEntradaNFEOutrasDespesas: TCurrencyField
      FieldName = 'OutrasDespesas'
    end
    object tbItensEntradaNFEBaseICMS: TCurrencyField
      FieldName = 'BaseICMS'
    end
    object tbItensEntradaNFEValorICMS: TCurrencyField
      FieldName = 'ValorICMS'
    end
    object tbItensEntradaNFEAliquotaICMS: TFMTBCDField
      FieldName = 'AliquotaICMS'
    end
    object tbItensEntradaNFEBaseICMSST: TCurrencyField
      FieldName = 'BaseICMSST'
    end
    object tbItensEntradaNFEValorICMSST: TCurrencyField
      FieldName = 'ValorICMSST'
    end
    object tbItensEntradaNFEAliquotaICMSST: TFMTBCDField
      FieldName = 'AliquotaICMSST'
      Size = 0
    end
    object tbItensEntradaNFEValorIPI: TCurrencyField
      FieldName = 'ValorIPI'
    end
    object tbItensEntradaNFEAliquotaIPI: TFMTBCDField
      FieldName = 'AliquotaIPI'
      Size = 0
    end
    object tbItensEntradaNFETotal: TCurrencyField
      FieldName = 'Total'
    end
  end
  object dsItensEntradaNFE: TDataSource
    DataSet = tbItensEntradaNFE
    Left = 204
    Top = 198
  end
end
