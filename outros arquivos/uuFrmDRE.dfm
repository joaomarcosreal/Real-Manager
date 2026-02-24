inherited frmDREVersaoNova: TfrmDREVersaoNova
  Margins.Left = 0
  Margins.Top = 0
  Margins.Right = 0
  Margins.Bottom = 0
  ClientHeight = 661
  ClientWidth = 1222
  OnDestroy = FormDestroy
  ExplicitWidth = 1234
  ExplicitHeight = 699
  TextHeight = 13
  inherited botao_pesquisa: TSpeedButton
    Top = 10
    ExplicitTop = 10
  end
  inherited Edit1: TEdit
    Top = 10
    ExplicitTop = 10
  end
  object pnTitulo: TPanel [2]
    Tag = 99
    Left = 0
    Top = 0
    Width = 1222
    Height = 34
    Margins.Left = 0
    Margins.Top = 0
    Margins.Right = 0
    Margins.Bottom = 0
    Align = alTop
    BevelOuter = bvNone
    Color = 12615680
    ParentBackground = False
    TabOrder = 1
    StyleElements = []
    ExplicitWidth = 1218
    object Label1: TLabel
      Left = 4
      Top = 3
      Width = 491
      Height = 34
      AutoSize = False
      Caption = 'Painel gerencial de desempenho por conta'
      Color = 12615680
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -19
      Font.Name = 'Calibri'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
      Layout = tlCenter
      StyleElements = []
    end
  end
  object Panel1: TPanel [3]
    Tag = 99
    Left = 0
    Top = 34
    Width = 1222
    Height = 627
    Align = alClient
    BevelEdges = []
    BevelOuter = bvNone
    Color = clWhite
    ParentBackground = False
    TabOrder = 2
    StyleElements = []
    ExplicitWidth = 1218
    ExplicitHeight = 626
    object JvPageList1: TJvPageList
      Left = 0
      Top = 0
      Width = 1222
      Height = 627
      ActivePage = pgPrincipal
      PropagateEnable = False
      Align = alClient
      ExplicitWidth = 1218
      ExplicitHeight = 626
      object pgPrincipal: TJvStandardPage
        Left = 0
        Top = 0
        Width = 1222
        Height = 627
        StyleElements = []
        Caption = 'pgPrincipal'
        Color = 16316407
        ExplicitWidth = 1218
        ExplicitHeight = 626
        object pnDadosDRE: TPanel
          Tag = 99
          Left = 0
          Top = 0
          Width = 1222
          Height = 627
          Align = alClient
          Alignment = taLeftJustify
          BevelEdges = []
          BevelOuter = bvNone
          Color = clWhite
          ParentBackground = False
          TabOrder = 0
          StyleElements = []
          ExplicitWidth = 1218
          ExplicitHeight = 626
          object pnGridDRE: TPanel
            Left = 0
            Top = 62
            Width = 322
            Height = 555
            Align = alClient
            BevelOuter = bvNone
            Color = clWhite
            ParentBackground = False
            TabOrder = 0
            StyleElements = []
            ExplicitWidth = 318
            ExplicitHeight = 554
            object Panel3: TPanel
              Left = 0
              Top = 139
              Width = 322
              Height = 416
              Align = alClient
              BevelOuter = bvNone
              Caption = 'Panel2'
              TabOrder = 0
              ExplicitWidth = 318
              ExplicitHeight = 415
              object cxDRE: TcxGrid
                Left = 0
                Top = 0
                Width = 322
                Height = 416
                Align = alClient
                TabOrder = 0
                ExplicitWidth = 318
                ExplicitHeight = 415
                object cxDREDBBandedTableView1: TcxGridDBBandedTableView
                  OnDblClick = cxDREDBBandedTableView1DblClick
                  Navigator.Buttons.CustomButtons = <>
                  ScrollbarAnnotations.CustomAnnotations = <>
                  OnCellClick = cxDREDBBandedTableView1CellClick
                  OnCustomDrawCell = cxDREDBBandedTableView1CustomDrawCell
                  OnFocusedRecordChanged = cxDREDBBandedTableView1FocusedRecordChanged
                  DataController.DataSource = dm.dsQryDRE
                  DataController.DetailKeyFieldNames = 'COD_CONTA'
                  DataController.Summary.DefaultGroupSummaryItems = <>
                  DataController.Summary.FooterSummaryItems = <>
                  DataController.Summary.SummaryGroups = <>
                  OptionsData.CancelOnExit = False
                  OptionsData.Deleting = False
                  OptionsData.Editing = False
                  OptionsData.Inserting = False
                  OptionsSelection.CellSelect = False
                  OptionsSelection.UnselectFocusedRecordOnExit = False
                  OptionsView.GroupByBox = False
                  OptionsView.Indicator = True
                  OptionsView.IndicatorWidth = 20
                  Styles.Content = cxStyle1
                  Styles.ContentOdd = cxStyle2
                  Bands = <
                    item
                      Caption = 'Conta gerencial'
                      Styles.Header = Headers
                      Width = 273
                    end
                    item
                      Caption = 'Total'
                      Position.BandIndex = 3
                      Position.ColIndex = 0
                      Width = 101
                    end
                    item
                      Caption = 'Percentuais %'
                      Position.BandIndex = 3
                      Position.ColIndex = 1
                      Width = 143
                    end
                    item
                      Caption = 'M'#234's de refer'#234'ncia'
                      Styles.Header = Headers
                      Width = 424
                    end
                    item
                      Caption = 'M'#234's anterior (M-1)'
                      Styles.Background = cxStyle3
                      Styles.Content = cxStyle3
                      Styles.Header = Headers
                      Width = 219
                    end
                    item
                      Caption = 'Ano anterior (A-1)'
                      Styles.Header = Headers
                      Width = 245
                    end
                    item
                      Caption = 'Outros'
                      Visible = False
                    end
                    item
                      Caption = 'Varia'#231#227'o %'
                      Position.BandIndex = 3
                      Position.ColIndex = 2
                      Width = 180
                    end
                    item
                      Caption = 'Percentuais %'
                      Position.BandIndex = 4
                      Position.ColIndex = 1
                      Width = 130
                    end
                    item
                      Caption = 'Total'
                      Position.BandIndex = 4
                      Position.ColIndex = 0
                      Width = 107
                    end
                    item
                      Caption = 'Total'
                      Position.BandIndex = 5
                      Position.ColIndex = 0
                      Width = 93
                    end
                    item
                      Caption = 'Percentuais %'
                      Position.BandIndex = 5
                      Position.ColIndex = 1
                      Width = 152
                    end>
                  object cxDREDBBandedTableView1DESCRICAO_EXT: TcxGridDBBandedColumn
                    Caption = 'Descri'#231#227'o da conta'
                    DataBinding.FieldName = 'DESCRICAO_EXT'
                    Width = 272
                    Position.BandIndex = 0
                    Position.ColIndex = 0
                    Position.RowIndex = 0
                  end
                  object cxDREDBBandedTableView1TOTAL_MES: TcxGridDBBandedColumn
                    DataBinding.FieldName = 'TOTAL_MES'
                    PropertiesClassName = 'TcxCurrencyEditProperties'
                    Styles.Content = cxStyle2
                    Width = 130
                    Position.BandIndex = 1
                    Position.ColIndex = 0
                    Position.RowIndex = 0
                    IsCaptionAssigned = True
                  end
                  object cxDREDBBandedTableView1MC_MES: TcxGridDBBandedColumn
                    Caption = 'Faturamento'
                    DataBinding.FieldName = 'MC_ATUAL'
                    PropertiesClassName = 'TcxCurrencyEditProperties'
                    Properties.DisplayFormat = ' ,0.000;- ,0.000'
                    Styles.Content = cxStyle2
                    Width = 69
                    Position.BandIndex = 2
                    Position.ColIndex = 0
                    Position.RowIndex = 0
                  end
                  object cxDREDBBandedTableView1TOTAL_MES_ANT: TcxGridDBBandedColumn
                    DataBinding.FieldName = 'TOTAL_MES_ANT'
                    PropertiesClassName = 'TcxCurrencyEditProperties'
                    Width = 110
                    Position.BandIndex = 9
                    Position.ColIndex = 0
                    Position.RowIndex = 0
                    IsCaptionAssigned = True
                  end
                  object cxDREDBBandedTableView1MC_MES_ANT: TcxGridDBBandedColumn
                    Caption = 'Faturamento'
                    DataBinding.FieldName = 'MC_MES_ANT'
                    PropertiesClassName = 'TcxCurrencyEditProperties'
                    Properties.DisplayFormat = ' ,0.000;- ,0.000'
                    Width = 70
                    Position.BandIndex = 8
                    Position.ColIndex = 0
                    Position.RowIndex = 0
                  end
                  object cxDREDBBandedTableView1TOTAL_ANO_ANT: TcxGridDBBandedColumn
                    DataBinding.FieldName = 'TOTAL_ANO_ANT'
                    PropertiesClassName = 'TcxCurrencyEditProperties'
                    Styles.Content = cxStyle2
                    Width = 110
                    Position.BandIndex = 10
                    Position.ColIndex = 0
                    Position.RowIndex = 0
                    IsCaptionAssigned = True
                  end
                  object cxDREDBBandedTableView1MC_ANO_ANT: TcxGridDBBandedColumn
                    Caption = 'Faturamento'
                    DataBinding.FieldName = 'MC_ANO_ANT'
                    PropertiesClassName = 'TcxCurrencyEditProperties'
                    Properties.DisplayFormat = ' ,0.000;- ,0.000'
                    Styles.Content = cxStyle2
                    Width = 70
                    Position.BandIndex = 11
                    Position.ColIndex = 0
                    Position.RowIndex = 0
                  end
                  object cxDREDBBandedTableView1TIPO: TcxGridDBBandedColumn
                    DataBinding.FieldName = 'TIPO'
                    Position.BandIndex = 6
                    Position.ColIndex = 0
                    Position.RowIndex = 0
                  end
                  object cxDREDBBandedTableView1MC_DESP_ATUAL: TcxGridDBBandedColumn
                    Caption = 'Despesas'
                    DataBinding.FieldName = 'MC_DESP_ATUAL'
                    PropertiesClassName = 'TcxCurrencyEditProperties'
                    Properties.DisplayFormat = ' ,0.000;- ,0.000'
                    Width = 57
                    Position.BandIndex = 2
                    Position.ColIndex = 1
                    Position.RowIndex = 0
                  end
                  object cxDREDBBandedTableView1MC_DESP_MES_ANT: TcxGridDBBandedColumn
                    Caption = 'Despesas'
                    DataBinding.FieldName = 'MC_DESP_MES_ANT'
                    PropertiesClassName = 'TcxCurrencyEditProperties'
                    Properties.DisplayFormat = ' ,0.000;- ,0.000'
                    Width = 51
                    Position.BandIndex = 8
                    Position.ColIndex = 1
                    Position.RowIndex = 0
                  end
                  object cxDREDBBandedTableView1MC_DESP_ANO_ANT: TcxGridDBBandedColumn
                    Caption = 'Despesas'
                    DataBinding.FieldName = 'MC_DESP_ANO_ANT'
                    PropertiesClassName = 'TcxCurrencyEditProperties'
                    Properties.DisplayFormat = ' ,0.000;- ,0.000'
                    Width = 58
                    Position.BandIndex = 11
                    Position.ColIndex = 1
                    Position.RowIndex = 0
                  end
                  object cxDREDBBandedTableView1VARIACAO_MC_MES_ANT: TcxGridDBBandedColumn
                    Caption = 'M'#234's anterior'
                    DataBinding.FieldName = 'VARIACAO_MC_MES_ANT'
                    PropertiesClassName = 'TcxCurrencyEditProperties'
                    Properties.DecimalPlaces = 4
                    Properties.DisplayFormat = '+,0.000%;- ,0.000%'
                    Width = 67
                    Position.BandIndex = 7
                    Position.ColIndex = 1
                    Position.RowIndex = 0
                  end
                  object cxDREDBBandedTableView1VARIACAO_MC_ANO_ANT: TcxGridDBBandedColumn
                    Caption = 'Ano anterior'
                    DataBinding.FieldName = 'VARIACAO_MC_ANO_ANT'
                    Width = 69
                    Position.BandIndex = 7
                    Position.ColIndex = 3
                    Position.RowIndex = 0
                  end
                  object cxDREDBBandedTableView1SINAL_MES: TcxGridDBBandedColumn
                    DataBinding.FieldName = 'SINAL_MES'
                    PropertiesClassName = 'TcxImageComboBoxProperties'
                    Properties.Images = imlSinais
                    Properties.ImmediateDropDownWhenKeyPressed = False
                    Properties.Items = <
                      item
                        ImageIndex = 1
                        Value = 2
                      end
                      item
                        ImageIndex = 0
                        Value = 1
                      end>
                    Width = 23
                    Position.BandIndex = 7
                    Position.ColIndex = 0
                    Position.RowIndex = 0
                    IsCaptionAssigned = True
                  end
                  object cxDREDBBandedTableView1SINAL_ANO: TcxGridDBBandedColumn
                    DataBinding.FieldName = 'SINAL_ANO'
                    PropertiesClassName = 'TcxImageComboBoxProperties'
                    Properties.Images = imlSinais
                    Properties.ImmediateDropDownWhenKeyPressed = False
                    Properties.Items = <
                      item
                        ImageIndex = 1
                        Value = 2
                      end
                      item
                        ImageIndex = 0
                        Value = 1
                      end>
                    Width = 21
                    Position.BandIndex = 7
                    Position.ColIndex = 2
                    Position.RowIndex = 0
                    IsCaptionAssigned = True
                  end
                end
                object cxDRELevel1: TcxGridLevel
                  GridView = cxDREDBBandedTableView1
                end
              end
            end
            object pnTotais: TPanel
              Left = 0
              Top = 0
              Width = 322
              Height = 135
              Align = alTop
              BevelOuter = bvNone
              Color = 16579836
              ParentBackground = False
              TabOrder = 1
              Visible = False
              StyleElements = []
              ExplicitWidth = 318
              object CurvyPanel1: TCurvyPanel
                Left = 4
                Top = 8
                Width = 391
                Height = 105
                Caption = ''
                Color = clWhite
                StyleElements = []
                TabOrder = 0
                DesignSize = (
                  391
                  105)
                object Label19: TLabel
                  Left = 9
                  Top = 8
                  Width = 151
                  Height = 21
                  AutoSize = False
                  Caption = 'Faturamento'
                  Color = 15395562
                  Font.Charset = ANSI_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -15
                  Font.Name = 'Segoe UI Semibold'
                  Font.Style = [fsBold]
                  ParentColor = False
                  ParentFont = False
                  Transparent = True
                  StyleElements = []
                end
                object lbFaturamentoMesAtual: TLabel
                  Left = 9
                  Top = 27
                  Width = 171
                  Height = 25
                  AutoSize = False
                  Caption = 'R$ 1.322.358,45'
                  Color = 15395562
                  Font.Charset = ANSI_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -19
                  Font.Name = 'Segoe UI'
                  Font.Style = [fsBold]
                  ParentColor = False
                  ParentFont = False
                  Transparent = True
                  StyleElements = []
                end
                object Label21: TLabel
                  Left = 9
                  Top = 62
                  Width = 30
                  Height = 20
                  Alignment = taRightJustify
                  AutoSize = False
                  Caption = 'M-1'
                  Color = clWhite
                  Font.Charset = ANSI_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -15
                  Font.Name = 'Segoe UI Semibold'
                  Font.Style = [fsBold]
                  ParentColor = False
                  ParentFont = False
                  Transparent = True
                  StyleElements = []
                end
                object lbFatMesAnterior: TLabel
                  Left = 45
                  Top = 62
                  Width = 110
                  Height = 20
                  Alignment = taRightJustify
                  AutoSize = False
                  Caption = 'R$ 2. 895.321,22'
                  Color = clWhite
                  Font.Charset = ANSI_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -15
                  Font.Name = 'Segoe UI'
                  Font.Style = []
                  ParentColor = False
                  ParentFont = False
                  Transparent = True
                  StyleElements = []
                end
                object lbVariacaoFatMesAnterior: TLabel
                  Left = 206
                  Top = 61
                  Width = 110
                  Height = 20
                  Alignment = taRightJustify
                  Anchors = [akTop, akRight]
                  AutoSize = False
                  Caption = '+R$ 365.690,00'
                  Color = clWhite
                  Font.Charset = ANSI_CHARSET
                  Font.Color = 2631878
                  Font.Height = -15
                  Font.Name = 'Segoe UI'
                  Font.Style = []
                  ParentColor = False
                  ParentFont = False
                  Transparent = True
                  StyleElements = []
                end
                object lbVariacaoFatPercentualMesAnterior: TLabel
                  Left = 327
                  Top = 61
                  Width = 59
                  Height = 17
                  Alignment = taRightJustify
                  Anchors = [akTop, akRight]
                  AutoSize = False
                  Caption = '(+3,541%)'
                  Color = clWhite
                  Font.Charset = ANSI_CHARSET
                  Font.Color = 2631878
                  Font.Height = -13
                  Font.Name = 'Segoe UI'
                  Font.Style = []
                  ParentColor = False
                  ParentFont = False
                  Transparent = True
                  StyleElements = []
                  ExplicitLeft = 289
                end
                object Label6: TLabel
                  Left = 9
                  Top = 84
                  Width = 30
                  Height = 20
                  Alignment = taRightJustify
                  AutoSize = False
                  Caption = 'A-1'
                  Color = clWhite
                  Font.Charset = ANSI_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -15
                  Font.Name = 'Segoe UI Semibold'
                  Font.Style = [fsBold]
                  ParentColor = False
                  ParentFont = False
                  Transparent = True
                  StyleElements = []
                end
                object lbFatAnoAnterior: TLabel
                  Left = 45
                  Top = 84
                  Width = 110
                  Height = 20
                  Alignment = taRightJustify
                  AutoSize = False
                  Caption = 'R$ 2. 895.321,22'
                  Color = clWhite
                  Font.Charset = ANSI_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -15
                  Font.Name = 'Segoe UI'
                  Font.Style = []
                  ParentColor = False
                  ParentFont = False
                  Transparent = True
                  StyleElements = []
                end
                object lbVariacaoFatAnoAnterior: TLabel
                  Left = 206
                  Top = 83
                  Width = 110
                  Height = 20
                  Alignment = taRightJustify
                  Anchors = [akTop, akRight]
                  AutoSize = False
                  Caption = '+R$ 365.690,00'
                  Color = clWhite
                  Font.Charset = ANSI_CHARSET
                  Font.Color = 2631878
                  Font.Height = -15
                  Font.Name = 'Segoe UI'
                  Font.Style = []
                  ParentColor = False
                  ParentFont = False
                  Transparent = True
                  StyleElements = []
                end
                object lbVariacaoFatPercentualAnoAnterior: TLabel
                  Left = 326
                  Top = 83
                  Width = 59
                  Height = 17
                  Alignment = taRightJustify
                  Anchors = [akTop, akRight]
                  AutoSize = False
                  Caption = '(+3,541%)'
                  Color = clWhite
                  Font.Charset = ANSI_CHARSET
                  Font.Color = 2631878
                  Font.Height = -13
                  Font.Name = 'Segoe UI'
                  Font.Style = []
                  ParentColor = False
                  ParentFont = False
                  Transparent = True
                  StyleElements = []
                  ExplicitLeft = 288
                end
                object Label8: TLabel
                  Left = 188
                  Top = 42
                  Width = 200
                  Height = 16
                  AutoSize = False
                  Caption = #916' Varia'#231#245'es m'#234's ant. / ano ant.'
                  Color = clWhite
                  Font.Charset = ANSI_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -12
                  Font.Name = 'Segoe UI Semibold'
                  Font.Style = [fsBold]
                  ParentColor = False
                  ParentFont = False
                  Transparent = True
                  StyleElements = []
                end
                object imgFaturamentoMes: TcxImage
                  Left = 187
                  Top = 61
                  Anchors = [akTop, akRight]
                  Picture.Data = {
                    0D546478536D617274496D61676589504E470D0A1A0A0000000D494844520000
                    0009000000090806000000E0910610000004AF69545874584D4C3A636F6D2E61
                    646F62652E786D7000000000003C3F787061636B657420626567696E3D22EFBB
                    BF222069643D2257354D304D7043656869487A7265537A4E54637A6B63396422
                    3F3E0A3C783A786D706D65746120786D6C6E733A783D2261646F62653A6E733A
                    6D6574612F2220783A786D70746B3D22584D5020436F726520352E352E30223E
                    0A203C7264663A52444620786D6C6E733A7264663D22687474703A2F2F777777
                    2E77332E6F72672F313939392F30322F32322D7264662D73796E7461782D6E73
                    23223E0A20203C7264663A4465736372697074696F6E207264663A61626F7574
                    3D22220A20202020786D6C6E733A657869663D22687474703A2F2F6E732E6164
                    6F62652E636F6D2F657869662F312E302F220A20202020786D6C6E733A746966
                    663D22687474703A2F2F6E732E61646F62652E636F6D2F746966662F312E302F
                    220A20202020786D6C6E733A70686F746F73686F703D22687474703A2F2F6E73
                    2E61646F62652E636F6D2F70686F746F73686F702F312E302F220A2020202078
                    6D6C6E733A786D703D22687474703A2F2F6E732E61646F62652E636F6D2F7861
                    702F312E302F220A20202020786D6C6E733A786D704D4D3D22687474703A2F2F
                    6E732E61646F62652E636F6D2F7861702F312E302F6D6D2F220A20202020786D
                    6C6E733A73744576743D22687474703A2F2F6E732E61646F62652E636F6D2F78
                    61702F312E302F73547970652F5265736F757263654576656E7423220A202020
                    657869663A506978656C5844696D656E73696F6E3D2239220A20202065786966
                    3A506978656C5944696D656E73696F6E3D2239220A202020657869663A436F6C
                    6F7253706163653D2231220A202020746966663A496D61676557696474683D22
                    39220A202020746966663A496D6167654C656E6774683D2239220A2020207469
                    66663A5265736F6C7574696F6E556E69743D2232220A202020746966663A5852
                    65736F6C7574696F6E3D2237322F31220A202020746966663A595265736F6C75
                    74696F6E3D2237322F31220A20202070686F746F73686F703A436F6C6F724D6F
                    64653D2233220A20202070686F746F73686F703A49434350726F66696C653D22
                    735247422049454336313936362D322E31220A202020786D703A4D6F64696679
                    446174653D22323032352D31302D30375431373A33303A35302D30333A303022
                    0A202020786D703A4D65746164617461446174653D22323032352D31302D3037
                    5431373A33303A35302D30333A3030223E0A2020203C786D704D4D3A48697374
                    6F72793E0A202020203C7264663A5365713E0A20202020203C7264663A6C690A
                    20202020202073744576743A616374696F6E3D2270726F6475636564220A2020
                    2020202073744576743A736F6674776172654167656E743D22416666696E6974
                    792044657369676E657220312E31302E34220A20202020202073744576743A77
                    68656E3D22323032352D31302D30375431373A33303A35302D30333A3030222F
                    3E0A202020203C2F7264663A5365713E0A2020203C2F786D704D4D3A48697374
                    6F72793E0A20203C2F7264663A4465736372697074696F6E3E0A203C2F726466
                    3A5244463E0A3C2F783A786D706D6574613E0A3C3F787061636B657420656E64
                    3D2272223F3ED704F3F30000018169434350735247422049454336313936362D
                    322E31000028917591BF4B425114C73F9A619461504443834435695881D4D2A0
                    F40BAA410DB25AF4F92B507BBCA784B406AD4241D4D2AFA1FE825A83E620288A
                    209A6B2D6A29799DA78111792EE79ECFFDDE7B0EF79E0BD67046C9EA362F6473
                    792D38E9772D44165DF6179AB1D34127B6A8A2ABB3A1893075EDE30E8B196F3C
                    66ADFAE7FEB596784257C0D2243CA6A85A5E784A78662DAF9ABC2DDCA1A4A371
                    E15361B7261714BE35F558959F4D4E55F9CB642D1C0C80B54DD895FAC5B15FAC
                    A4B5ACB0BC9CDE6CA6A0FCDCC77C8923919B0F49EC11EF4627C8247E5C4C334E
                    001F838CCAECC3C31003B2A24EBEB7923FC7AAE42A32AB14D15821459A3C6E51
                    0B523D2131297A424686A2D9FFBF7DD593C343D5EA0E3F343E19C65B1FD8B7A0
                    5C328CCF43C3281F41C3235CE46AF9AB0730F22E7AA9A6F5EE837303CE2E6B5A
                    6C07CE37A1EB418D6AD18AD4206E4D26E1F5045A23D07E0DCD4BD59EFDEC737C
                    0FE175F9AA2BD8DD837E39EF5CFE06259167C8A25346A3000000097048597300
                    000B1300000B1301009A9C18000000804944415418957DCCC10DC1600040E1EF
                    2F57CE2660018205FE18A30C201C99802D3A8483748026D8A01338BB0B174D5A
                    52EFF8F2F2823A59EC6081B3347F563AD1648B133675196A97014AF4F0C0489A
                    DFBF4FC74F007D1C9AA72CCE5034CEBC3097E697208B01578CFD72C334C1AA25
                    80099609762D41C5BE8B35867FA2F20D7A3D1746722C81B80000000049454E44
                    AE426082}
                  TabOrder = 0
                  Height = 20
                  Width = 16
                end
                object Panel8: TPanel
                  Left = 0
                  Top = 0
                  Width = 391
                  Height = 5
                  Align = alTop
                  BevelOuter = bvNone
                  Color = 3308846
                  ParentBackground = False
                  TabOrder = 1
                  StyleElements = []
                end
                object imgFaturamentoAno: TcxImage
                  Left = 187
                  Top = 83
                  Anchors = [akTop, akRight]
                  Picture.Data = {
                    0D546478536D617274496D61676589504E470D0A1A0A0000000D494844520000
                    0009000000090806000000E0910610000004AF69545874584D4C3A636F6D2E61
                    646F62652E786D7000000000003C3F787061636B657420626567696E3D22EFBB
                    BF222069643D2257354D304D7043656869487A7265537A4E54637A6B63396422
                    3F3E0A3C783A786D706D65746120786D6C6E733A783D2261646F62653A6E733A
                    6D6574612F2220783A786D70746B3D22584D5020436F726520352E352E30223E
                    0A203C7264663A52444620786D6C6E733A7264663D22687474703A2F2F777777
                    2E77332E6F72672F313939392F30322F32322D7264662D73796E7461782D6E73
                    23223E0A20203C7264663A4465736372697074696F6E207264663A61626F7574
                    3D22220A20202020786D6C6E733A657869663D22687474703A2F2F6E732E6164
                    6F62652E636F6D2F657869662F312E302F220A20202020786D6C6E733A746966
                    663D22687474703A2F2F6E732E61646F62652E636F6D2F746966662F312E302F
                    220A20202020786D6C6E733A70686F746F73686F703D22687474703A2F2F6E73
                    2E61646F62652E636F6D2F70686F746F73686F702F312E302F220A2020202078
                    6D6C6E733A786D703D22687474703A2F2F6E732E61646F62652E636F6D2F7861
                    702F312E302F220A20202020786D6C6E733A786D704D4D3D22687474703A2F2F
                    6E732E61646F62652E636F6D2F7861702F312E302F6D6D2F220A20202020786D
                    6C6E733A73744576743D22687474703A2F2F6E732E61646F62652E636F6D2F78
                    61702F312E302F73547970652F5265736F757263654576656E7423220A202020
                    657869663A506978656C5844696D656E73696F6E3D2239220A20202065786966
                    3A506978656C5944696D656E73696F6E3D2239220A202020657869663A436F6C
                    6F7253706163653D2231220A202020746966663A496D61676557696474683D22
                    39220A202020746966663A496D6167654C656E6774683D2239220A2020207469
                    66663A5265736F6C7574696F6E556E69743D2232220A202020746966663A5852
                    65736F6C7574696F6E3D2237322F31220A202020746966663A595265736F6C75
                    74696F6E3D2237322F31220A20202070686F746F73686F703A436F6C6F724D6F
                    64653D2233220A20202070686F746F73686F703A49434350726F66696C653D22
                    735247422049454336313936362D322E31220A202020786D703A4D6F64696679
                    446174653D22323032352D31302D30375431373A33303A35302D30333A303022
                    0A202020786D703A4D65746164617461446174653D22323032352D31302D3037
                    5431373A33303A35302D30333A3030223E0A2020203C786D704D4D3A48697374
                    6F72793E0A202020203C7264663A5365713E0A20202020203C7264663A6C690A
                    20202020202073744576743A616374696F6E3D2270726F6475636564220A2020
                    2020202073744576743A736F6674776172654167656E743D22416666696E6974
                    792044657369676E657220312E31302E34220A20202020202073744576743A77
                    68656E3D22323032352D31302D30375431373A33303A35302D30333A3030222F
                    3E0A202020203C2F7264663A5365713E0A2020203C2F786D704D4D3A48697374
                    6F72793E0A20203C2F7264663A4465736372697074696F6E3E0A203C2F726466
                    3A5244463E0A3C2F783A786D706D6574613E0A3C3F787061636B657420656E64
                    3D2272223F3ED704F3F30000018169434350735247422049454336313936362D
                    322E31000028917591BF4B425114C73F9A619461504443834435695881D4D2A0
                    F40BAA410DB25AF4F92B507BBCA784B406AD4241D4D2AFA1FE825A83E620288A
                    209A6B2D6A29799DA78111792EE79ECFFDDE7B0EF79E0BD67046C9EA362F6473
                    792D38E9772D44165DF6179AB1D34127B6A8A2ABB3A1893075EDE30E8B196F3C
                    66ADFAE7FEB596784257C0D2243CA6A85A5E784A78662DAF9ABC2DDCA1A4A371
                    E15361B7261714BE35F558959F4D4E55F9CB642D1C0C80B54DD895FAC5B15FAC
                    A4B5ACB0BC9CDE6CA6A0FCDCC77C8923919B0F49EC11EF4627C8247E5C4C334E
                    001F838CCAECC3C31003B2A24EBEB7923FC7AAE42A32AB14D15821459A3C6E51
                    0B523D2131297A424686A2D9FFBF7DD593C343D5EA0E3F343E19C65B1FD8B7A0
                    5C328CCF43C3281F41C3235CE46AF9AB0730F22E7AA9A6F5EE837303CE2E6B5A
                    6C07CE37A1EB418D6AD18AD4206E4D26E1F5045A23D07E0DCD4BD59EFDEC737C
                    0FE175F9AA2BD8DD837E39EF5CFE06259167C8A25346A3000000097048597300
                    000B1300000B1301009A9C18000000804944415418957DCCC10DC1600040E1EF
                    2F57CE2660018205FE18A30C201C99802D3A8483748026D8A01338BB0B174D5A
                    52EFF8F2F2823A59EC6081B3347F563AD1648B133675196A97014AF4F0C0489A
                    DFBF4FC74F007D1C9AA72CCE5034CEBC3097E697208B01578CFD72C334C1AA25
                    80099609762D41C5BE8B35867FA2F20D7A3D1746722C81B80000000049454E44
                    AE426082}
                  TabOrder = 2
                  Height = 20
                  Width = 16
                end
                object cxImage2: TcxImage
                  Left = 350
                  Top = 8
                  Picture.Data = {
                    0D546478536D617274496D61676589504E470D0A1A0A0000000D494844520000
                    0856000008560806000000DC7ACED50000018269434350735247422049454336
                    313936362D322E31000028917591BB4B03411087BF244A244622A8606111255A
                    19F101411B8B048D825A24117C35C9998790C7711791602BD80614441B5F85FE
                    05DA0AD682A02882586BAB68A3E19C4B8488985966E7DBDFEE0CBBB3608DA495
                    8C5ED70F996C5E0B05FDEEB9F905B7FD050776DA18A633AAE8EA74783C424DFB
                    B8C362C61BAF59ABF6B97FAD7139AE2B6069101E55542D2F3C213CB596574DDE
                    166E5552D165E153E15E4D2E287C6BEAB10A3F9B9CACF097C95A2414006BB3B0
                    3BF98B63BF584969196179399E4C7A55F9B98FF912673C3B1B96D825DE814E88
                    207EDC4C3246001F038CC8ECC3CB207DB2A2467E7F397F869CE42A32AB14D058
                    21498A3CBDA2AE4AF5B8C484E87119690A66FFFFF6554F0C0D56AA3BFD50FF64
                    186FDD60DF8252D1303E0F0DA37404B647B8C856F3730730FC2E7AB1AA79F6C1
                    B5016797552DB603E79BD0FEA046B56859B2895B1309783D81A67968B906C762
                    A5673FFB1CDF43645DBEEA0A76F7A047CEBB96BE01B2196808F088EC99000000
                    097048597300002E2300002E230178A53F760000200049444154789CECDD4DAC
                    6D775DC6F1E7D60A542DA95814C4F8822F40D1885A5EE24406B011D408890389
                    68F640E3DB08C481864451CA48D144130935B2239A3820022668B22506D08085
                    10A8111AD16230B660684B2D35D84A5A07E796F6DE7BEE3D7BADBDD6FABFACCF
                    27B9219DFD86671D9EF3FF9E0B000024C96E732EC9B727F9DE24D72779D245FF
                    BEF6A2FFBEA6CCA1000000A37D31C93D8FF9F7F98BFEFB9E247725B935C9EDD9
                    EE1F2E74270000153957FA0000000AD96DAE4FF2BCF3FF9E7FFE7F9F54F42600
                    00807ADC9DE443E7FFDD92E4C3D9EEEF2A7B1200002518560000ACC56EF32D49
                    5E9E9311C5F3933CBDEC41000000CDB93D27438B7F4CF2AE6CF79F2E7C0F0000
                    0B30AC0000E8D96EF3C4243F91E46792FC50E16B0000007AF3DE246F4BF2F66C
                    F7F715BE0500809918560000F466B7B93AC98B7332A678799227943D080000A0
                    7BFF9BE41D49FE34C97BB2DD7FA9F03D00004CC8B00200A017BBCDB392FC6C92
                    9F4AF20D85AF01000058ABFF4AF2E749FE38DBFD6DA58F0100E07886150000AD
                    DB6DBE35C9EB93FC74FC7C070000508B8773F282C56F64BBFF74E963000018CF
                    2FDE01005AB5DB7C7D925F4FF28B491E57F81A0000004EF760923F4A7253B6FB
                    CF953E060080E10C2B00005AB3DB3C31C96B92FC4A92AF297C0D00000087B93F
                    C9EF247953B6FB2F943E060080C319560000B462B7797C925F48F2BA24D717BE
                    0600008071EE4AF286246FCE76FF40E9630000389B610500400B769B1B92FC45
                    92EF297D0A00000093F8A724AFCC76FF89D287000070658615000035DB6DCE25
                    F9F924BF97E40985AF010000605A5F4CF2EA246FC976FF70E9630000389D6105
                    0040AD769BAF4B72739257943E0500008059FD65929FCB767F4FE9430000B894
                    610500408D769B1726F9B3244F2B7C09000000CBB823C9ABB2DDBFB7F4210000
                    5CC8B00200A026BBCD5726F9CD24BF163FAB010000ACCDC349DE98E4F5D9EEFF
                    AFF43100009CF0CB7A00805AEC365F9DE49D495E54FA140000008AFADB24AFC8
                    76FF3FA50F0100C0B00200A00EBBCD7549DE9DE4074B9F02000040153E90E447
                    B2DDDF5BFA100080B533AC0000286DB77972927D92E7943E05000080AA7C34C9
                    4BB2DD7FAEF42100006B6658010050D26EF3B424EF49F2CCD2A700000050A5DB
                    92BC38DBFD1DA50F0100582BC30A008052769BA7E76454F16DA54F010000A06A
                    FF9EE445D9EE3F55FA1000803532AC00002861B7B92127A38AA7963E05000080
                    26DC999371C56DA50F0100581BC30A0080A5ED36DF94E4C3499E52FA14000000
                    9AF2D92437CA8200002CEBAAD2070000ACCA6E734D9277C4A802000080E19E92
                    E41DE7BF2D01005888610500C052769B7349DE92E4C6D2A7000000D0ACE72679
                    CBF96F4C00001660580100B09CD7247955E92300000068DEAB92BCBAF4110000
                    6B61D10A00B084DDE62549FE3A86AD0000004CE3A1242FCD76BF2F7D080040EF
                    0C2B0000E6B6DB7C67920F25B9AEF42900000074E5DE24CFCD76FF6FA50F0100
                    E899BF98040098D36E736D9277C5A802000080E95D97E4AFCE7F7B02003013C3
                    0A008079DD94E459A58F000000A05BCF4AF286D2470000F44C0A0400602EBBCD
                    8D496E89312B000000F37A28C9F3B2DD7FA4F42100003DF24B7E008039EC365F
                    91E4CDF1F316000000F3BB2AC99BCF7F8B02003031BFE8070098C72F27F981D2
                    47000000B01A3726F9A5D2470000F4480A0400606ABBCDD392DC96E4DAD2A700
                    0000B02A5F48F2CC6CF777963E0400A0275EAC000098DEEFC7A802000080E55D
                    9B936F52000026E4C50A008029ED362F4BF2EED267000000B06A2FCB76FF37A5
                    8F0000E885610500C054769BAB927C22C9334A9F020000C0AAFD4B921BB2DD3F
                    54FA1000801E488100004CE7C762540100004079CF48F2A3A58F0000E8856105
                    00C0745E5BFA0000000038CF372A00C044A4400000A6B0DBBC20C9074B9F0100
                    00008FF1826CF7B7943E0200A0755EAC00009886BF04020000A036BE55010026
                    E0C50A008063ED36DF91E493F1B315000000757928C97765BBBFBDF42100002D
                    F3620500C0F15E1DA30A000000EA73554EBE5901003882FF030000E018BBCDF5
                    49FE23C935A54F01000080537C31C93767BBBFABF4210000ADF2620500C0715E
                    19A30A000000EA754D929F2C7D040040CB0C2B00008EF3E3A50F0000008033F8
                    7605003882140800C058BBCD75493E97E4EAD2A7000000C0157C29C993B3DDDF
                    5BFA1000801679B1020060BC97C5A802000080FA5D9DE4A5A58F000068956105
                    00C0789E52050000A015BE61010046920201001863B7797C4E3220D7963E0500
                    00000E705F4E72200F963E0400A0355EAC000018E78531AA000000A01D4FCCC9
                    B72C000003195600008CE309550000005AE35B16006004C30A0080715E52FA00
                    00000018E8874B1F0000D0A273A50F000068CE6E736D4EDAB4000000D09A6BB3
                    DDDF5FFA0800809678B1020060B81B4A1F0000000023F9A6050018C8B0020060
                    B867973E0000000046F24D0B003090610500C070DF5DFA0000000018C9372D00
                    C04086150000C3F92514000000ADF24D0B003090610500C0707E0905000040AB
                    7CD302000C74AEF40100004DD96D9E94E4EED267000000C0119E94EDFEF3A58F
                    00006885172B0000867976E903000000E0485EAD000018C0B002006098A7963E
                    000000008EF494D2070000B4C4B0020060986B4A1F0000000047F26D0B003080
                    610500C0305F55FA0000000038926F5B0080010C2B000086F1573D000000B4CE
                    B72D00C00086150000C3F8AB1E0000005AE7DB16006000C30A008061FC550F00
                    0000ADF36D0B003080610500C030FEAA07000080D6F9B6050018C0B002006018
                    7FD503000040EB7CDB02000C6058010030CC134A1F000000004732AC000018C0
                    B002006098FF2E7D000000001CE9DED2070000B4C4B002006098CF943E000000
                    008EE4DB16006000C30A008061EE2C7D000000001CC9B72D00C00086150000C3
                    F8AB1E0000005AE7DB16006000C30A008061FCF209000080D6F9B6050018C0B0
                    02006018CFA5020000D03ADFB6000003185600000CF3F9240F943E0200000046
                    7A20C9BDA58F00006889610500C010DBFDC3493E5BFA0C00000018E933E7BF6D
                    01003890610500C070FF59FA0000000018E98ED2070000B4C6B0020060B80F95
                    3E0000000046BAA5F4010000AD31AC000018EEFDA50F00000080917CD302000C
                    6458010030DC3F943E0000000046F24D0B003090610500C050DBFD5D493E5EFA
                    0C00000018E89FB3DDDF5DFA080080D6185600008CE3E9540000005AE35B1600
                    6004C30A008071FC320A000080D6F896050018C1B00200609CBF2F7D00000000
                    0CE45B16006004C30A008031B6FB3B927CAAF41900000070A0DBB3DDDF59FA08
                    008016195600008CF777A50F0000008003F986050018C9B0020060BC5DE90300
                    0000E040BBD2070000B4CAB0020060BC0F24F944E923000000E00C1F4FF2C1D2
                    470000B4CAB0020060ACEDFEE12437973E03000000CE70F3F96F5800004630AC
                    000038CEDB923C58FA08000000B88C0772F2ED0A00C04886150000C7D8EEEF4E
                    F2F6D267000000C065BC3DDBFD3DA58F00006899610500C0F1E440000000A895
                    6F56008023195600001CEF7D49FEB5F41100000070914F26797FE92300005A67
                    58010070ACEDFEE1F80B20000000EA73F3F96F5600008E60580100308DB726B9
                    AFF41100000070DE7D4976A58F0000E881610500C014B6FBBB92FC76E9330000
                    00E0BCDF3AFFAD0A00C0910C2B0000A6F307496E2F7D04000000AB777B923F2C
                    7D0400402F0C2B0000A6B2DD3F90E4574B9F010000C0EABDF6FC372A00001330
                    AC000098D63B93BCAFF411000000ACD67B93BCABF41100003D3957FA000080EE
                    EC36DF97E423F1B316000000CB7A38C9F767BBFF58E94300007AE2C50A0080A9
                    6DF71F4DF2D6D267000000B03A7F62540100303DC30A008079BC2EC9FDA58F00
                    00006035EECFC9B72800001333AC000098C376FF99246F2C7D06000000AB7153
                    B6FBCF963E0200A04786150000F3F9DD24B7963E02000080EEDD9AE44DA58F00
                    00E8D5B9D2070000746DB7794E920F27B9BAF42900000074E94B499E9BEDFE63
                    A50F0100E895172B0000E674F28B2D4910000000E67293510500C0BC0C2B0000
                    E67753244100000098DEAD31E60700989D140800C01224410000009896040800
                    C042BC580100B0044910000000A625010200B010C30A0080E548820000003005
                    0910008005498100002C491204000080E3488000002CCC8B1500004B92040100
                    00E038122000000B33AC0000589E240800000063488000001420050200508224
                    08000000C34880000014E2C50A00801224410000001846020400A010C30A0080
                    72244100000038840408004041522000002549820000007065122000008579B1
                    0200A0244910000000AE4C020400A030C30A0080F22441000000388D04080040
                    05A44000006A2009020000C085244000002AE1C50A00801A4882000000702109
                    1000804A18560000D443120400008044020400A02A5220000035910401000058
                    3B09100080CA78B10200A02692200000006B270102005019C30A0080FA488200
                    0000AC930408004085A44000006A2409020000B0361220000095F2620500408D
                    2441000000D646020400A05286150000F592040100005807091000808A498100
                    00D44C12040000A0771220000095F362050040CD24410000007A270102005039
                    C30A0080FA4982000000F449020400A001522000002D9004010000E88D040800
                    4023BC580100D0024910000080DE4880000034C2B00200A01D92200000007D90
                    0001006888140800404B24410000005A27010200D0182F560000B44412040000
                    A075122000008D31AC0000688F24080000409B244000001A24050200D0224910
                    000080D64880000034CA8B1500002D9204010000688D04080040A30C2B0000DA
                    2509020000D006091000808649810000B44C12040000A076122000008DF36205
                    0040CB24410000006A27010200D038C30A0080F64982000000D449020400A003
                    522000003D9004010000A88D0408004027BC580100D0034910000080DA488000
                    0074C2B00200A01F92200000007590000100E888140800404F24410000004A93
                    000100E88C172B00007A2209020000509A04080040670C2B0000FA2309020000
                    50860408004087A44000007A2409020000B034091000804E79B10200A0479220
                    0000004B93000100E89461050040BF24410000009621010200D031291000809E
                    4982000000CC4D020400A0735EAC0000E89924080000C0DC244000003A675801
                    00D03F49100000807948800000AC80140800C01A48820000004C4D0204006025
                    BC580100B006922000000053930001005809C30A0080F5900401000098860408
                    00C08A48810000AC8924080000C0B12440000056C68B1500006B220902000070
                    2C091000809531AC0000581F4910000080712440000056480A0400608D244100
                    0000869200010058292F560000AC9124080000C050122000002B65580100B05E
                    92200000008791000100583129100080359304010000388B040800C0CA79B102
                    0060CD2441000000CE22010200B0728615000048820000009C4E020400002910
                    000022090200007029091000009278B10200804412040000E052122000002431
                    AC0000E05192200000002724400000F832291000001E250902000020010200C0
                    05BC580100C0A3244100000024400000B88061050000179304010000D64A0204
                    00804B48810000702949100000607D244000003895172B0000B89424080000B0
                    3E122000009CCAB0020080CB9104010000D64202040080CB92020100E0F22441
                    000080FE4980000070455EAC0000E0F22441000080FE49800000704586150000
                    9C4512040000E895040800006792020100E06C92200000407F24400000388817
                    2B0000389B24080000D01F091000000E62580100C0A124410000805E48800000
                    7030291000000E2709020000B44F0204008041BC580100C0E12441000080F649
                    800000308861050000434982000000AD92000100603029100000869304010000
                    DA23010200C0285EAC0000603849100000A03D122000008C62580100C0589220
                    0000402B24400000184D0A040080F12441000080FA4980000070142F56000030
                    9E24080000503F091000008E62580100C0B124410000805A4980000070342910
                    00008E2709020000D447020400804978B1020080E34982000000F59100010060
                    12861500004C4512040000A885040800009391020100603A9220000040791220
                    00004CCA8B1500004C4712040000284F020400804919560000303549100000A0
                    14091000002627050200C0F42441000080E549800000300B2F560000303D4910
                    0000607912200000CCC2B0020080B948820000004B91000100603652200000CC
                    4712040000989F04080000B3F262050000F39104010000E627010200C0AC0C2B
                    0000989B240800003017091000006627050200C0FC2441000080E949800000B0
                    082F560000303F49100000607A122000002CC2B0020080A54882000000539100
                    01006031522000002C4712040000389E040800008BF262050000CB9104010000
                    8E27010200C0A20C2B0000589A240800003096040800008B9302010060799220
                    0000C0701220000014E1C50A00009627090200000C2701020040118615000094
                    22090200001C4A0204008062A4400000284712040000389B040800004579B102
                    0080722441000080B349800000509461050000A5498200000097230102004071
                    522000009427090200005C4A020400802A78B1020080F224410000804B498000
                    005005C30A00006A21090200003C42020400806A48810000500F491000004002
                    040080CA78B10200807A48820000001220000054C6B0020080DA48820000C07A
                    49800000501D29100000EA23090200006B240102004095BC580100407D244100
                    00608D24400000A89261050000B59204010080F590000100A05A52200000D44B
                    12040000D64002040080AA79B10200807A49820000C01A488000005035C30A00
                    006A2709020000FD92000100A07A52200000D44F120400007A240102004013BC
                    58010040FD24410000A0471220000034C1B00200805648820000403F24400000
                    688614080000ED90040100801E48800000D0142F560000D00E49100000E88104
                    0800004D31AC0000A03592200000D02E091000009A23050200407B24410000A0
                    451220000034C98B150000B447120400005A2401020040930C2B000068952408
                    0000B443020400806649810000D02E491000006881040800004DF362050000ED
                    92040100801648800000D034C30A00005A2709020000F592000100A079522000
                    00B44F120400006A240102004017BC58010040FB24410000A0461220000074C1
                    B00200805E48820000403D24400000E88614080000FD90040100801A48800000
                    D0152F560000D00F49100000A881040800005D31AC0000A03792200000508E04
                    080000DD91020100A03F922000005082040800005DF262050000FD9104010080
                    1224400000E89261050000BD9204010080E548800000D02D29100000FA250902
                    00004B90000100A06B5EAC0000A05F92200000B00409100000BA6658010040EF
                    24410000603E12200000744F0A040080FE49820000C01C2440000058052F5600
                    00D03F49100000988304080000AB60580100C05A48820000C07424400000580D
                    29100000D64312040000A620010200C0AA78B1020080F538F9C5EF4DA5CF0000
                    80C649800000B02A86150000ACCD1B23090200006349800000B03A52200000AC
                    8F240800008C21010200C02A79B1020080F539F945B0BFB20300806124400000
                    5825C30A0000D6EAA648820000C0A124400000582D29100000D64B120400000E
                    21010200C0AA79B1020080F592040100804348800000B06A86150000AC9D2408
                    00005C9E04080000AB270502000092200000701A0910000088172B0000401204
                    00004E270102000031AC0000804748820000C0A324400000E03C291000007884
                    24080000241220000070012F560000C023244100002091000100800B18560000
                    C08524410000583309100000B888140800005C4C120400807592000100805378
                    B10200002E26090200C03A49800000C0290C2B0000E07492200000AC89040800
                    005C86140800005C8E24080000EB200102000057E0C50A0000B81C49100000D6
                    4102040000AEC0B0020000AE4C120400809E49800000C019A4400000E02C9220
                    0000F449020400000EE0C50A0000388B240800007D92000100800318560000C0
                    6124410000E889040800001C480A0400000E25090200401F2440000060002F56
                    0000C0A124410000E883040800000C6058010000C348820000D0320910000018
                    480A0400008692040100A04D122000003082172B0000602849100000DA240102
                    00002318560000C03892200000B44402040000469202010080B1244100006883
                    040800001CC18B1500003096240800006D90000100802318560000C071244100
                    00A899040800001C490A0400008E25090200409D2440000060025EAC00008063
                    498200005027091000009880610500004C43120400809A48800000C044A44000
                    00602A92200000D4410204000026E4C50A0000988A2408000075900001008009
                    19560000C0B4244100002849020400002626050200005393040100A00C091000
                    009881172B0000606A922000009421010200003330AC0000807948820000B024
                    09100000988914080000CC45120400806548800000C08CBC5801000073910401
                    006019122000003023C30A00009897240800007392000100809949810000C0DC
                    244100009887040800002CC08B150000303749100000E621010200000B30AC00
                    008065488200003025091000005888140800002C45120400806948800000C082
                    BC580100004B91040100601A12200000B020C30A0000589624080000C7900001
                    00808549810000C0D2244100001847020400000AF0620500002C4D1204008071
                    24400000A000C30A00002843120400802124400000A010291000002845120400
                    80C34880000040415EAC0000805224410000388C040800001464580100006549
                    8200007025122000005098140800009426090200C0E924400000A0025EAC0000
                    80D224410000389D0408000054C0B0020000EA20090200C063498000004025A4
                    400000A016922000009C90000100808A78B10200006A21090200C00909100000
                    A88861050000D44512040060DD24400000A03252200000501B49100080B59200
                    0100800A79B10200006A23090200B056122000005021C30A0000A893240800C0
                    BA4880000040A5A4400000A056922000006B210102000015F362050000D44A12
                    0400602D24400000A06286150000503749100080BE4980000040E5A4400000A0
                    7692200000BD92000100800678B10200006A27090200D02B0910000068806105
                    0000B441120400A02F12200000D008291000006885240800402F24400000A021
                    5EAC0000805648820000F442020400001A62580100006D91040100689B040800
                    0034460A0400005A23090200D02A091000006890172B0000A03592200000AD92
                    000100800619560000409B24410000DA22010200008D92020100805649820000
                    B442020400001AE6C50A00006895240800402B24400000A06186150000D03649
                    100080BA4980000040E3A4400000A07592200000B592000100800E78B1020000
                    5A27090200502B09100000E88061050000F441120400A02E12200000D0092910
                    0000E885240800402D24400000A0235EAC0000805E48820000D442020400003A
                    62580100007D91040100284B020400003A2305020000BD910401002845020400
                    003AE4C50A0000E88D240800402912200000D021C30A0000E893240800C0B224
                    400000A05352200000D02B49100080A54880000040C7BC58010000BD92040100
                    588A0408000074CCB0020000FA26090200302F09100000E89C14080000F44E12
                    0400602E12200000B0025EAC000080DE49820000CC450204000056C0B0020000
                    D641120400605A12200000B01252200000B0169220000053910001008015F162
                    050000AC85240800C0542440000060450C2B0000605D244100008E2301020000
                    2B23050200006B23090200309604080000AC90172B0000606D24410000C69200
                    0100801532AC0000807592040100184602040000564A0A040000D64A120400E0
                    5012200000B0625EAC000080B592040100389404080000AC9861050000AC9B24
                    0800C09549800000C0CA49810000C0DA498200005C8E04080000E0C50A000058
                    3D49100080CB91000100000C2B00008024922000001793000100009248810000
                    008F90040100788404080000F0655EAC0000004E488200003C4202040000F832
                    C30A0000E0B124410080B593000100002E20050200005C48120400582F091000
                    00E0125EAC0000002E24090200AC97040800007009C30A0000E034922000C0DA
                    4880000000A792020100004E27090200AC870408000070595EAC0000004E2709
                    0200AC8704080000705986150000C09548820000BD9300010000AE480A040000
                    B832491000A05F12200000C099BC580100005C99240800D02F09100000E04C86
                    150000C02124410080DE48800000000791020100000E23090200F44302040000
                    3898172B000080C348820000FD90000100000E66580100000C21090200B44E02
                    04000018440A04000018461204006897040800003098172B0000806124410080
                    7649800000008319560000006348820000AD9100010000469102010000C69104
                    0100DA21010200008CE6C50A0000601C491000A01D12200000C06886150000C0
                    3124410080DA49800000004791020100008E23090200D44B02040000389A172B
                    000080E348820000F592000100008E66580100004C41120400A88D0408000030
                    0929100000601A922000403D2440000080C978B10200009886240800500F0910
                    0000603286150000C09424410080D22440000080494981000000D392040100CA
                    910001000026E7C50A0000605A922000403912200000C0E40C2B000080394882
                    00004B9300010000662105020000CC43120400588E04080000301B2F56000000
                    F390040100962301020000CCC6B0020000989324080030370910000060565220
                    0000C0BC24410080F94880000000B3F362050000302F491000603E12200000C0
                    EC0C2B00008025488200005393000100001621050200002C43120400988E0408
                    0000B018C30A00006039BBCD3726795CE9330080E63D98EDFECED24700000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000B6EBF1790000
                    2000494441540000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    00000000000000000000FFCFDE9DFEFB7AD7F5BD7F6513661404141115392055
                    EB50CF815AE5541CEAA555C1016410D44B128240286D02714006C10908280D22
                    84042F4545458B436D8FD78116E4509549501FD52A564510B05484320921FBDC
                    58E1A1D68464EFBDD6FAFE86E7F32F78DDDB6B5DFBBD3E5F0000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000080ED71D6
                    E8000000604F2CD36DAA73ABEB8F4E0100B6DE07ABCB9AD7B78D0E010000769F
                    6105000070B496E9ACEA5BAAA7571F33B80600D81DEFA8FE4DF513CDEBC9D131
                    0000C0EE32AC0000008ECE327D4A7569F565834B0080DDB5560F695EFF747408
                    0000B09B0C2B000080C3B74CD7ABCEAFBEBFBAC9E01A0060F7BDA77A4CF5CCE6
                    F543A363000080DD62580100001CAE65FAC7D5E5D5E78D4E0100F6CE6F56E734
                    AFFF7574080000B03B0C2B000080C3B14C37A8BEB383BF16BDFEE01A00607F7D
                    B0FADEEA079BD70F8C8E010000B69F6105000070E696E9F33AB852F18F47A700
                    005CE5F7AA739BD7DF1A1D0200006C37C30A0000E0F42DD34D3BF88BD047E6F7
                    0B0060F39CAC7EB87A6CF3FA9ED1310000C076F2E1130000383DCBF42FAAE756
                    9F32B80400E0DAFC49755EF3FAE2D1210000C0F631AC0000004ECD327D4CF5B4
                    EA5B47A700009CA21FAB2E6C5EDF313A040000D81E86150000C075B74CF7AA7E
                    A4BACDE8140080D3F4D6EAFCE6F5174687000000DBC1B0020000B876CB74DB0E
                    06155F373A0500E090BCA87A78F3FA96D1210000C06633AC000000AED9329D55
                    9D535D5CDD7C700D00C0617B677561F5BCE6F5E4E81800006033195600000057
                    6F99EE585D5A7DC9E814008023F69FAAF39AD73F1E1D0200006C1EC30A0000E0
                    EF5BA6B3AB47564FAA6E3CB80600E0B8BCAF7A6CF5C3CDEB8746C70000009BC3
                    B0020000F85BCBF4D9D5E5D55D46A700000CF2AAEA9CE6F57747870000009BC1
                    B0020000A865BA61F5DDD57754670FAE010018ED8AEA07AAEF6B5EFF66740C00
                    00309661050000ECBB65FA82EAB2EAD347A700006C98DFAFCE6D5EFFCBE81000
                    00601CC30A0000D857CBF451D5F7570FCFEF060000D7E464F5CCEABB9AD7778F
                    8E0100008E9F8FA70000B08F96E92BAAE7549F3C3A0500604BBCB17A48F3FAFF
                    8C0E0100008E9761050000EC9365BA55F543D5378D4E0100D852CFAFFE4DF3FA
                    3F4787000000C7C3B0020000F6C1329D55DDA7BAA4FAD8C1350000DBEE7F548F
                    A87EAE793D393A060000385A86150000B0EB96E913AB6755F7189D0200B0637E
                    A57A58F3FAA6D1210000C0D131AC0000805DB54C27AA07574FA93E7A700D00C0
                    AE7A577551F5DCE6F5CAD1310000C0E133AC0000805DB44C77AE2EADEE3E3A05
                    00604FBCAC7A70F3FA47A343000080C36558010000BB6499CEAE2EACBEA7BAE1
                    E01A00807DF3FEEAF1D5D39BD72B46C700000087C3B002000076C5327D6E7579
                    F5B9A3530000F6DC6BAB739AD7D78D0E010000CE9C610500006CBB65BA71F5B8
                    EAD1D5F506D7000070E043D553AA2736AFEF1F1D0300009C3EC30A0000D866CB
                    F485D573AB3B8F4E0100E06AFD61756EF3FAF2D1210000C0E931AC0000806DB4
                    4C1F5D3DB9FAB6D12900005C273F5A7D47F3FAAED1210000C0A931AC0000806D
                    B34C5FDDC187F94F1C9D0200C0297953F56DCDEBAF8E0E010000AE3BC30A0000
                    D816CBF4B1D533AAFB8F4E0100E08CBCA07A64F3FA3F4687000000D7CEB00200
                    0036DD329D557D6307A38A5B0DAE0100E070FCCFEA91D54F37AF2747C7000000
                    D7CCB002000036D9327D72F5ECEA5F8E4E0100E048FC87EAA1CDEB1B47870000
                    0057CFB002000036D1329DA81E5AFD6075B3C13500001CAD7757DF51FD68F37A
                    E5E8180000E0EF33AC0000804DB34C9F565D56DD6D740A0000C7EA15D5B9CDEB
                    1F8C0E010000FE96610500006C8A65BA417551F5D8EA06836B000018E303D513
                    ABA734AF1F1C1D03000018560000C06658A6BB5697579F353A0500808DF0BBD5
                    39CDEBAB46870000C0BE33AC0000809196E9A6D593AA47562706D70000B059AE
                    AC7EB87A5CF3FA9ED1310000B0AF0C2B0000609465FAB2EA39D51D46A70000B0
                    D1FEA43AAF797DF1E8100000D8478615000070DC96E996D5D3AB6F199D0200C0
                    5659AA0B9BD7BF1A1D020000FBC4B00200008ECB329D557D437549F571836B00
                    00D84E6FAB1E51FD7CF37A72740C0000EC03C30A0000380ECB74BBEA59D53D47
                    A70000B0137EA97A78F3FAE6D1210000B0EB0C2B0000E0282DD389EAC1D553AA
                    8F1E5C0300C06E79577551F5DCE6F5CAD1310000B0AB0C2B0000E0A82CD39DAB
                    E7565F383A0500809DF6B2EABCE6F50F47870000C02E32AC000080C3B64CD7AF
                    1E553DBEBAE1E01A0000F6C3DF544FA89ED6BC7E70700B0000EC14C30A000038
                    4CCB7497EAB2EA7346A70000B0975E579DDBBCBE6674080000EC0AC30A000038
                    0CCB7493EA7BAA0BAA13836B0000D86F57564FAB9ED0BCBE77740C00006C3BC3
                    0A00003853CBF425D5A5D51D47A70000C0DFF1C7D579CDEB7F1A1D020000DBCC
                    B00200004ED7327D4CF5D4EA9CD1290000F0115C5E3DBA797DC7E8100000D846
                    86150000703A96E95ED533AB8F1F9D020000D7C15BABF39BD75F181D020000DB
                    C6B00200004EC5327D4207838AAF1B9D020000A7E145D5C39BD7B78C0E010080
                    6D6158010000D7C5329D559DDBC1D31F371F5C03000067E29DD5A3AACB9BD793
                    A363000060D319560000C0B559A63B55CFADBE68700900001CA6FF5C9DD7BCBE
                    61740800006C32C30A0000B826CB74767541F53DD58D06D70000C051787FF5F8
                    EAE9CDEB15A3630000601319560000C0D559A6CFAD2EAF3E77740A00001C83D7
                    56E734AFAF1B1D0200009BC6B0020000FEAE65BA71077FB1F7A8EA7A836B0000
                    E0387DA87A6AF5C4E6F57DA3630000605318560000C0872DD31755CFADEE34B8
                    04000046FAA3EAC1CDEBCB46870000C02630AC00008065BA45F594EAC1A35300
                    0060835C5A5DD4BCBE73740800008C64580100C07E5BA6AFAD9E55DD76740A00
                    006CA0BFA81ED6BCFED2E810000018C5B0020080FDB44C1F5F5D52DD7B740A00
                    006C819FAF1ED1BCBE75740800001C37C30A0000F6CB329D557D6BF5B4EA1683
                    6B0000609BBCA3BAB05A9AD793A3630000E0B818560000B03F96E9FFE8E09DE8
                    2F1D9D0200005BECC5D5439AD7FF3E3A0400008E8361050000BB6F99CEAE1E59
                    3DA9BAF1E01A0000D805EFAB1E5B3DA379BD62740C00001C25C30A000076DB32
                    7D4E75597597D1290000B0835E5D9DD3BCFECEE8100000382A86150000ECA665
                    BA51077F41775175F6E01A0000D86557544FA99ED4BCBE7F740C00001C36C30A
                    000076CF327D7EF5BCEAD346A70000C01EF983EA5B9BD7DF1C1D02000087C9B0
                    020080DDB14C37AE9E545D909F75010060842BABA7578F6B5EDF373A0600000E
                    838FCD0000EC8665BA5B07572AEE3C3A050000E80FAB0735AFAF181D02000067
                    CAB0020080EDB64C37A9BEAF7A647EBE0500804D72B27A46F598E6F5BDA36300
                    00E074F9F00C00C0F65AA62FECE04AC51D47A7000000D7E80DD539CDEBAF8F0E
                    010080D361580100C0F659A69B553F509D3F3A050000B8CE2EA9BEB3797DCFE8
                    1000003815861500006C9765FAE2EAF2EA0EA35300008053F6DF3BB85EF1D2D1
                    210000705D19560000B01D96E9A3AA27570F1D9D0200009CB16755DFDEBCBE7B
                    740800005C1BC30A000036DF32FD8BEAB2EAF6A35300008043F3671D5CAF78C9
                    E8100000F8480C2B0000D85CCBF4D1D553ABF346A700000047E639D545CDEBBB
                    46870000C0D531AC000060332DD39757CFAD3E69740A000070E4FEBC3AB7795D
                    47870000C0FFCEB0020080CDB24C37AF9E569D333A050000387697571736AFEF
                    1C1D0200001F66580100C0E658A6AFAC2EAD6E373A05000018E64DD579CDEB7F
                    1C1D02000065580100C02658A68FA97EA8FA96D1290000C0C658AA0B9AD7778C
                    0E010060BF1956000030D632DDA37A4E75DBD1290000C0C6794BF590E6F55746
                    870000B0BF0C2B00001863996E593DA37AE0E814000060E33DBFFAD7CDEB5F8D
                    0E010060FF1856000070FC96E96BAB6757B7199D0200006C8DB7560F6D5E7F71
                    74080000FBC5B0020080E3B34CB7AE2EA9EE373A050000D85A2FA8FE55F3FAF6
                    D1210000EC07C30A00008EC732DDBB7A56F5B1A353000080ADF797D5C39AD75F
                    181D0200C0EE33AC0000E0682DD3C755CFACBE61740A0000B0735E589DDFBCFE
                    E5E8100000769761050000476399CEAAEED3C1A8E2D6836B000080DDF5F6EAE1
                    D50B9BD793A3630000D83D861500001CBE65BA4D07CF7E7CFDE8140000606FFC
                    BB0E9E0779DBE8100000768B6105000087E7E04AC5FDAB4BAA5B0EAE010000F6
                    CF5F55E7573FE37A05000087C5B0020080C3B14CB7AD9E5DDD73740A0000B0F7
                    7EA97A68F3FA96D12100006C3FC30A0000CECCC1958A0756FFB6BAC5E01A0000
                    800F7B47F5C8EA275DAF0000E04C1856000070FA96E976D573AAAF1A9D020000
                    700DFE7DF56DCDEB9B47870000B09D0C2B0000387507572AE6EA87AA9B8F8D01
                    0000B856EFACFE75F5E3AE57000070AA0C2B00003835CBF449D5A5D5578C4E01
                    00003845FFB17A48F3FAE7A3430000D81E861500005C3707572ACEA99E5E7DD4
                    E01A000080D3F5AEEA82EA79AE570000705D1856000070ED96E9F6D573AB2F1B
                    9D0200007048D6EAC1CDEB1B47870000B0D90C2B0000B86607572ACEAB2EAE6E
                    36B8060000E0B0BDBB7A5475A9EB1500005C13C30A0000AEDE32DDA1BAACFA92
                    D12900000047EC25D5B9CDEB9F8E0E010060F318560000F0F72DD389EAA1D593
                    AB9B0EAE010000382EEFA92EAA9EDDBC5E393A060080CD61580100C0DF5AA63B
                    569757771F9D02000030C84B3BB85EF1C7A3430000D80C861500007CF84AC5F9
                    D50F5437195C03000030DA7BABEFAC9EE97A05000086150000FB6E993EA5FAB1
                    EA8BC6860000006C9C975673F3FA67A343000018C7B00200605F2DD359D55C3D
                    A3FAA8B1310000001BEB7F558FAC96E6F5E4E81800008E9F610500C03E5AA68F
                    AF2EADEE313A050000604BFC72755EF3FAB6D12100001CAF13A30300003866CB
                    74AFEAF732AA0000003815F7AC7EEFAADFA90000D8232E560000EC8B65BA4575
                    49F5C0D1290000005BEE27AB4734AF7F3D3A040080A367580100B00F9669AA9E
                    57DD6E740A0000C08E7853F5A0E6F5FF1D1D0200C0D132AC0000D865CB74D3EA
                    29D5C346A7000000ECA81FA9BEBD797DCFE81000008E86610500C0AE5AA6CFAF
                    7EA2BAD3E8140000801DF786EA9B9BD7DF181D0200C0E133AC0000D835CB74C3
                    EAF1D5B7572706D7000000EC8B2BAB27574F685E3F303A060080C363580100B0
                    4B96E9B3ABE7579F3D3A050000604FBDBE83EB15BF333A040080C361580100B0
                    0B96E97AD5A3AA2755D71F5C030000B0EF3E503DAEBAB879FDD0E8180000CE8C
                    610500C0B65BA63B553F5E7DC1E814000000FE9E575473F3FA86D12100009C3E
                    C30A00806DB54C6755DF565D5CDD64700D00000057EFBDD585D5739AD793A363
                    0000387586150000DB68996E575D5E7DF9E814000000AE935FABCE695EDF3C3A
                    0400805363580100B04D0EAE547C63F5CCEA16836B00000038357F5D3DBC7A81
                    EB150000DBC3B00200605B2CD3ADAB1FADEE3D3A0500008033F2C2EA61CDEBDB
                    4787000070ED0C2B0000B6C1327D757559759BD1290000001C8AB756E736AFBF
                    3A3A0400808FCCB0020060932DD347574FAFCE199D020000C091B8BCBAA0797D
                    D7E8100000AE9E610500C0A65AA6BB573F5EDD7E740A00000047EA4FABB9797D
                    D9E8100000FE21C30A00804DB34C37AC9E543D2A3FAF010000EC8B93D553ABC7
                    36AF1F181D0300C0DFF2A11E0060932CD3A7573F5DFD93D1290000000CF1DBD5
                    039AD7DF1F1D0200C001C30A00804DB04C67550FAB2EAE6E34B806000080B1DE
                    DFC115C36735AF2747C70000EC3BC30A0080D196E9E3ABE755FF72740A000000
                    1BE53F540F6A5EDF363A0400609F9D181D0000B0D796E91ED5EF6454010000C0
                    3FF495D5EF5EF5BB23000083B858010030C232DDB47A5AF590D1290000006C85
                    E7541736AFEF191D0200B06F0C2B00008EDB32DDA5FAA9EACEA353000000D82A
                    FFAD7A40F3FA9AD1210000FBC4B00200E0B82CD3F5AA6FAFBEA73A7B700D0000
                    00DBE98AEA71D5539AD70F8D8E0100D80786150000C761996E5F3DBFFAE7A353
                    000000D8092FAFBEA979FDB3D1210000BBEEC4E80000809DB74C0FA87E27A30A
                    0000000ECF3FAF7EE7AADF39010038422E5600001C9565BA45F5ACEAFEA35300
                    0000D8692FA81ED6BCFEF5E81000805D64580100701496E9EE1D3CFDF149A353
                    000000D80B6FACBEB9797DD9E81000805D63580100709896E906D513AB8BF2B3
                    16000000C7EB64F5E4EAF1CDEB0746C70000EC0A1FFB01000ECB327D5AF553D5
                    FF393A05000080BDF6DAEA01CDEB1F8C0E0100D80586150000676A99CEAA1E5A
                    5D5CDD78700D00000054BDAFBAB07A76F37A72740C00C03633AC00003813CB74
                    9BEAF2EAAB46A7000000C0D5F8D5EA9CE6F56DA3430000B695610500C0E95AA6
                    AFAE9E577DECE814000000F808FEB27A50F3FAABA3430000B691610500C0A95A
                    A69B74F0ECC74347A7000000C029F8D1EA51CDEB7B478700006C13C30A008053
                    B14CFF57F553D53F1A9D02000000A7E10FAA0734AFAF1D1D0200B02D0C2B0000
                    AE8B65BA5EF5E8EA49D5D9836B000000E04C7CB07A6C7571F3FAA1D13100009B
                    CEB00200E0DA2CD327563F59DD7D740A0000001CA297550F6C5EDF343A040060
                    939D181D0000B0D196E99ED5EB33AA00000060F7DCBD7AFD55BFFB0200700D5C
                    AC0000B83ACB74A3EAA9D5F9A353000000E0185C525DD4BCBE7F740800C0A631
                    AC0000F8DF2DD3A7553F537DCEE8140000003846AFAFEED7BCFEC1E81000804D
                    62580100F061CB7456F5AD1DFC95CE4D06D7000000C008EFEDE07AE3D2BC9E1C
                    1D0300B0090C2B0000AA96E9E6D5B3ABFB8D4E010000800DF082EAA1CDEB3B47
                    8700008C66580100B04C9FD7C107A33B8C4E010000800DF2271D3C0DF2CAD121
                    00002319560000FB6B994E548FAEBEB73A7B700D0000006CA22BAAC7541737AF
                    578E8E010018C1B00200D84FCBF4F1D54F545F363A05000000B6C05A7D4BF3FA
                    D6D1210000C7CDB00200D83FCBF4E51D8C2A3E6E740A0000006C91BFACBEB979
                    FDB5D1210000C7C9B00200D81FCB7483EAFBAA478D4E010000802DF6D4EABB9B
                    D70F8C0E0100380E861500C07E58A63B562FA8EE3A3A0500000076C0ABAAFB37
                    AF7F3C3A0400E0A89D181D000070E496E901D56F67540100000087E5AED56FB7
                    4CDF383A0400E0A8B9580100ECAE65BA59F5CCEA5B46A7000000C00E5BAA4734
                    AFEF1E1D020070140C2B0080DDB44C9F5BFD4C75E7D129000000B007FE5B75BF
                    E6F575A34300000E9B610500B05B96E9ACEA5F554FA96E30B806000000F6C907
                    AA47579734AF2747C700001C16C30A0060772CD3ADAB1FABBE7A740A000000EC
                    B15FA91ED4BCBE7D740800C06130AC000076C3327D71F593D5278C4E01000000
                    FA8BEA01CDEB4B478700009C29C30A0060BB2DD3D9D5E3ABC7E4671B000000D8
                    2427ABEFAD9ED8BC5E313A0600E074F9CF0700607B2DD3EDAB9FAAEE363A0500
                    0000B846AFA8BEB1797DE3E8100080D37162740000C06959A67B55AFCBA80200
                    000036DDDDAAD7B74C5F3F3A0400E074B85801006C9765BA71F5F4EADB46A700
                    000000A7ECD9D505CDEBFB468700005C57861500C0F658A63B572FAC3E7B740A
                    00000070DA5E5F7D43F3FA47A3430000AE0B4F810000DB6199EE53BD3AA30A00
                    0000D8769F53BDA665FA86D1210000D7858B1500C0665BA61B561757E78F4E01
                    0000000EDD33AB4735AF7F333A0400E09A185600009B6B99EE50FD5C7597D129
                    000000C0917975759FE6F54F468700005C1D4F8100009B6999BEA67A6D461500
                    0000B0EBEE52BDB665BAE7E8100080ABE3620500B05996E9FAD50F54178E4E01
                    0000008EDDC5D57735AF1F1C1D0200F061861500C0E658A64FAA7EB6FAFCD129
                    000000C030FFA5BA6FF3FAA6D1210000E529100060532CD35754BF9D51050000
                    00ECBB2FA85E77D5B7020080E15CAC0000C65AA6B3AB27548F195C020000006C
                    9693D5F7574F685EAF181D0300EC2FC30A00609C65BA6DF5D3D5170D2E010000
                    0036D74BABFB37AF6F1D1D0200EC27C30A00608C65FAE2EA05D56D46A7000000
                    001BEF6D1D8C2BFEF3E8100060FF18560000C76B994E54DF557D4F7562700D00
                    0000B03DAEAC1E57FD40F37AE5E81800607F18560000C767993EB67A7EF5E5A3
                    5300000080ADF56BD5039BD7B78F0E0100F683610500703C96E96ED5CF56B71B
                    9D020000006CBD3757F76D5E5F313A0400D87D861500C0D15AA6B3AA0BAB1FAC
                    AE37B806000000D81D1FAABEA37A5AF37A72740C00B0BB0C2B0080A3B34CB7AC
                    96EA1E834B00000080DDF5CBD5DCBCBE63740800B09B0C2B0080A3B14CFFB4FA
                    B9EAF6A353000000809DF7A7D57D9AD7578D0E0100768F61050070B80E9EFE38
                    BF7A5A75FDC135000000C0FEF8607541F5239E0601000E93610500707896E9E6
                    D565D5BD47A7000000007BEB85D5B9CDEBBB46870000BBC1B00200381CCBF44F
                    3AF87071A7D129000000C0DE7B4375EFE6F5F5A3430080ED675801009C9983A7
                    3FCEAD2EA96E38B806000000E0C3FEA67A447599A741008033615801009CBE65
                    BA59F5A3D50347A7000000005C83E7570F6D5EDF333A0400D84E861500C0E959
                    A6CFA87EBEFAF4D12900000000D7E2BF76F034C8EF8F0E0100B6CF89D10100C0
                    165AA67B57AFCCA802000000D80E9F51BDB265BAD7E8100060FBB85801005C77
                    CB7476F57DD545A353000000004ED393ABEF6E5EAF181D02006C07C30A00E0BA
                    59A65B573F537DE9E8140000008033F492EA7ECDEBDB478700009BCFB00200B8
                    76CB7497EA17AA4F1E9D020000007048DE587D7DF3FA9AD12100C0663B313A00
                    00D870CBF4A0EAFFCBA802000000D82D9F5CBDA265FAD6D12100C06673B10200
                    B87ACB74C3EA19D54346A7000000001CB167578F6C5E3F303A0400D83C861500
                    C03FB44CB7AB7EBEFA67A353000000008EC96F56F76E5EDF3C3A0400D82C9E02
                    0100FEBE65BA7BF5DA8C2A00000080FDF2CFAAD7B64C5F383A0400D82C2E5600
                    000796E9ACEA91D5C5D5F506D7000000008CF2A1EAC2EADF36AF2747C70000E3
                    19560000B54C37AD2EADBE71740A000000C086F8E9EABCE6F53DA3430080B10C
                    2B0060DF2DD31DAB17559F353A0500000060C3FC6EF575CDEB1F8F0E0100C639
                    313A0000186899BEB27A7546150000000057E7B3AA575FF50D0500D8532E5600
                    C03E5AA613D577574FC8CF0300000000D7E66407DF51BEB779BD72700B0070CC
                    FC470A00EC9B65BA45F513D53D46A7000000006C997F5F7D53F3FAD7A3430080
                    E363580100FB64993EB37A5175A7D129000000005BEA0DD5D735AFBF373A0400
                    381E2746070000C76499EE5BFD5646150000000067E24ED56F5DF5AD0500D803
                    2E5600C0AE5BA6B3AB2757178C4E01000000D8314FABBEA379BD627408007074
                    0C2B0060972DD3C7553F5B7DD1E012000000805DF5D2EABECDEB5F8E0E01008E
                    86610500ECAA65FABCEAE7AB4F1C9D02000000B0E3DE54DDAB797DE5E81000E0
                    F09D181D00001C81657A70F5EB1955000000001C874FAC5E7ED537190060C7B8
                    580100BB64996E545D529D3B3A05000000604F5D563DA2797DFFE81000E07018
                    5600C0AE58A64FAA7EA1BAEBE814000000803DF7AA0E9E06F9F3D12100C099F3
                    140800EC8265FA92EAB51955000000006C82BB56AF6999BE7874080070E65CAC
                    00806DB64C675517564FCE601200000060D35C595D543DBD793D393A0600383D
                    861500B0AD96E946D573AB078E4E01000000E0237A7E755EF3FAFED12100C0A9
                    33AC00806DB44C9F50BDA8FAA7A35300000000B84E5E597D6DF3FA96D12100C0
                    A931AC00806DB34C77AD7EB1FA84D129000000009C92BFA8BEA6797DF5E81000
                    E0BAF3163B006C9365BA7FF5EB1955000000006CA34FA85EDE32DD6F74080070
                    DDB9580100DB60994E544FAABE6B740A0000000087E2FBABC736AF578E0E0100
                    3E32C30A00D8CC442DDD000020004944415474CBF451D54F56F71C9D02000000
                    C0A1FAA5EA9B9AD7FF353A0400B866861500B0C996E90ED52F579F393A050000
                    008023F17BD53D9BD73F191D02005CBD13A30300806BB04C77AF5E9551050000
                    00C02EFBCCEA55577D0B020036906105006CA2657A48F5E2EA56A35300000000
                    3872B7AA5EDC329D373A0400F8873C0502009B6499AE5FFD50F5F0D129000000
                    000CF1CCEA82E6F583A343008003861500B02996E996D50BAB2F199D02000000
                    C0502FA9EED3BCFED5E81000C0B0020036C3327D46F5CBD51D47A700000000B0
                    11DE50DDB379FDFDD12100B0EF4E8C0E0080BDB74C5F55FD66461500000000FC
                    AD3B55BFD5327DE5E81000D8772E5600C028CB7456F5E8EA07F36F3200000000
                    57EF64F5EDD5C5CDEBC9D13100B08FFC270E008CB04C37AA2EADBE69740A0000
                    00005BE1F9D579CDEBFB478700C0BE31AC0080E3B64CB7AD5E547DDEE8140000
                    0000B6CA6F565FDFBCBE65740800EC13C30A00384ECB7497EA17ABDB8D4E0100
                    0000602BBDB9FA9AE6F535A34300605F9C181D00007B6399EE5BBD3CA30A0000
                    00004EDFEDAA975FF5AD090038062E5600C0515BA613D513ABC78C4E01000000
                    60A77C6FF5F8E6F5CAD12100B0CB0C2B00E0282DD3CDAAE7575F3B3A05000000
                    809DF4A2EA9B9BD7778F0E01805D65580100476599EE50FD52F559A353000000
                    00D869BF5BDDB379FDD3D12100B08B4E8C0E00809DB44C5F58BD32A30A000000
                    008EDE6755AFBAEA9B140070C80C2B00E0B02DD383AB9754B71E9D02000000C0
                    DEB875F5E296E9DCD12100B06B3C050200876599CEAE7EA83A7F740A00000000
                    7BED92EA82E6F58AD12100B00B0C2B00E0302CD32DAB9FABBE74740A00000000
                    542FAEEED3BCBE637408006C3BC30A003853CBF4A9D5AF569F3A3A0500000000
                    FE8E3FAABEAA79FDA3D12100B0CD4E8C0E0080ADB64CFF77F51B195500000000
                    B0793EB5FA8D96E96EA34300609B195600C0E95AA6FB552FA96E353A05000000
                    00AEC1ADAA97B44CF71D1D0200DBCA53200070AA96E9ACEA3BABEF1B9D0200F0
                    FFB377A7E1D6DD057DF7BFB9130821CCF38C0202828284C18121C8B05490A128
                    A020B0691D8A22A2A5B5A5F05410A4C52AA2558A3EC0228C61264080CD2C4353
                    AC3C6A0571A0ADB638161199C73C2FF6092190DCB98773CE7FEFB33F9FEB3AD7
                    FD32DF2BF7CAC9396BFDF67F0100C051786CF5EF5B2CCF1D1D02009BC4B00200
                    8EC63C5DA27A46F5CF46A700000000C0317856F58816CBCF8F0E01804D615801
                    00476A9E2E5FBDACBADBE81400000000380E6FAAEEDF62F9B1D12100B0090C2B
                    00E048CCD3F5ABD755371F9D0200000000BBE00FAB7BB658FEC5E81000587787
                    460700C0DA9BA7DB54E7645401000000C0C1F14DD57F6D9E6E3D3A0400D69D61
                    05001CCE3CDDA77A47758DD12900000000B0CBAE51FD76F374EFD12100B0CE0C
                    2B00E0A2CCD34F55AFAC2E3D3A0500000000F6C8A5AB57354F8F1A1D0200EBEA
                    84D10100B076E6E9C4EA69D54F8E4E01000000807DF4ABD5CFB4587E71740800
                    AC13C30A00F84AF3746AF5A2EA5EA353000000006080B3AA07B5587E72740800
                    AC0BC30A0038CF3C5DB37A6D75DAE8140000000018E877AB7BB558FED5E81000
                    580786150050354FDF5CBDAEBAEEE8140000000058037F51DDB3C5F20F478700
                    C06887460700C070F33455EFCAA80200000000CE73BDEADDCDD3DD478700C068
                    8615006CB779FAE1EAECEA72A3530000000060CD5CAE3ABB79FA67A343006024
                    AF0201603BCDD3A1EA49D5BF199D02000000001BE029D5E35A2CBF343A0400F6
                    9B610500DB679E2E55CDD503079700000000C02639B35AB4587E66740800EC27
                    C30A00B6CB3C5DA57A75F51DA353000000006003BDBBBA6F8BE5FF1D1D0200FB
                    C5B00280ED314FDF509D5DDD68740A000000006CB03FABEED162F9A7A3430060
                    3F1C1A1D0000FB629EEE589D935105000000001CAF1B55E7344F77181D0200FB
                    C1B00280836F9E1E54BDB9BAD2E814000000003820AE54BDA579FAC1D12100B0
                    D7BC0A0480836B9E4EA81E5B3D69740A000000001C60FFB67A4A8BE5B9A34300
                    602F1856007030CDD325AA67560F1F9D02000000005BE0D9D53F6FB1FCFCE810
                    00D86D8615001C3CF37485EA65D55D47A700000000C016794BF5FD2D96FF303A
                    0400769361050007CB3C5DBF3ABBBAD9E81400000000D842EFAFEED962F9E7A3
                    430060B71C1A1D0000BB669E6E5BFDD78C2A0000000060949B57E7344FB7191D
                    0200BBC5B0028083619EBEA77A7B75F5C12500000000B0EDAE51BD63E79E1D00
                    6C3CC30A0036DF3C3DB47A4D75E9D1290000000040B5BA577756F3F490D12100
                    70BC0C2B00D86CF3F498EAB9D589A35300000000800B38A93AA379FA17A34300
                    E0789C303A00008EC93C1DAA9E5AF9A50C00000000D6DF7FAC7EB6C5F24BA343
                    00E068195600B079E6E912D5B32AC70802000000C0E638A3FAE116CBCF8F0E01
                    80A3615801C06699A753AB9756DF333A0500000000386A67570F68B1FCE4E810
                    0038528615006C8E79BA72F5BAEA5B47A70000000000C7EC9CEA7B5B2C3F323A
                    04008E846105009B619EAE57BDB1BAE9E81400000000E0B87DB0FAAE16CBBF18
                    1D020017E7D0E80000B858F374F3EA3D195500000000C04171D3EADD3BF7FE00
                    60AD195600B0DEE6E9F6D5BBAA6B8F4E010000000076D575AA77364FDF313A04
                    000EC7B00280F5354FF7AADE5C5D61740A00000000B027AE58BDB979FADED121
                    0070510C2B00584FF3F4F0EA95D5A546A700000000007BEA94EA55CDD3627408
                    005C9813460700C005CCD309D5CF564F199D0200000000ECBB7F5D3DB5C5F2DC
                    D12100709E13470700C097CDD3A1EA97ABC78D4E010000000086B85B75B9EE7B
                    C337F5AA0F195700B0169C5801C07A98A74B56CFA91E343A050000000018EE85
                    D5C35B2C3F373A04000C2B00186F9E2E53BDBC9A46A700000000006BE38DD5F7
                    B7587E62740800DBCDB00280B1E6E9AAD5EBAADB8E4E0100000000D6CEEF54F7
                    6CB1FCBBD121006C2FC30A00C699A7AF6BB53ABFF1E01200000000607DFD4935
                    B558FEF9E81000B6D3A1D101006CA979BA45F59E8C2A0000000080C3BB71F59E
                    E6E99B478700B09D0C2B00D87FF374C7EAB7AB6B8E4E010000000036C2B5AA77
                    EEDC5B04807D655801C0FE9AA7FB566FAA2E3F3A0500000000D82897AF96CDD3
                    7D468700B05D0C2B00D83FF3F4C3D5CBAB9347A700000000001BE952D52B76EE
                    3502C0BE38617400005B609E4EA81E5B3D69740A00006BEF133B7F5E66680500
                    009BE0DF564F69B13C77740800079B6105007B6B9E0E554FAF1E393A05008021
                    3E53FD49F5C7D507AB0F551FAD3E7E215F9F6CB1FC5275DECF91A75697BD90AF
                    2B5637AA6EB2F375E3569F5C040060FBFC5AF5E82FFF1C09007BC0B00280BD33
                    4F275767540F189D0200C0BEF883EA3DAD06141F6C35A6F88B3DBFC9BD1A615C
                    AFD5C8E2A63B5FB7AFBE794FFFB90000AC8B33AB87B5587E7674080007936105
                    007B639E2E5BBDB2BAEBE8140000F6CC9F566FDDF97A7B8BE5DF0EEEB9A079BA
                    5A75E7EA2EAD7E2EBDD1D01E0000F6D29BABFBB5587E7C740800078F610500BB
                    6F7503FBF5D569A3530000D855FF589DD5EAA6F5DB5A2CFF6270CFD199A7EB55
                    DF59DDADBA7775B9B1410000ECB2DFADEEB176835F00369E610500BB6B9E6E50
                    BD319F0604003828BED8EAE7BB33AAB35A2C3F3DB86777CCD329ADC6150FABBE
                    AB3A34360800805DF267D5D462F93F4787007070185600B07BE6E99BAA3755D7
                    189D0200C071FBFD56638A17B658FEF5E8983D354FD7A81E543DB4BAE5E01A00
                    008EDF5F57776FB1FCC3D121001C0C861500EC8E79BA75B5ACAE343A05008063
                    F6E9EA59D5FFDB62F9FBA3638698A75B563FBCF375A9C13500001CBB8FB43AB9
                    E27DA34300D87C8615001CBF79FA8EEAF579473500C0A6FA44F59FAAA7791FF5
                    8E79BA7AF5D3D54F5497195C0300C0B1F958F53D2D96FF657408009BCDB00280
                    E3334F77A9CEAA4E1D9D0200C051FB68F5F4EAD75A2CFF7E74CC5A9AA72B553F
                    59FD5475C5C13500001CBD4F56F76AB17CDBE810003697610500C76E9EEE51BD
                    A23A79740A000047E56FAB5FAA9ED162F9F1D1311B619E2E573DA2FA99EA6A83
                    6B0000383A9FA9EED762F9FAD121006C26C30A008ECD3C7D5FF5A2EA12A35300
                    0038625FA87EB9FAF916CB4F8C8ED948F37499EAF1AD0616270DAE0100E0C87D
                    BEFA8116CB578C0E0160F318560070F4E6E987AAB93A717009000047EEB7AB1F
                    6FB17CFFE89003619E6E5EFD4675A7D12900001CB12F560F6BB17CC1E8100036
                    CBA1D101006C9879FAD1EA8C8C2A000036C5DF560FABEE6C54B18B56FF2EEF5C
                    3DB4FABBB13100001CA113ABE7354F3F323A0480CDE2C40A008EDC3CFD54F52B
                    A33300003822E756CFA81ED762F9D1D13107DA3C5DB17A52F588DC6B0100D814
                    8F6EB17CFAE8080036835FF6013832F3F4D8EAC9A333000038227FDEEAFDD1E7
                    8C0ED92AF3F4EDD58BAAEB8F4E0100E0883CB6C5F229A32300587F8615001CDE
                    3C9DD0EAD3778F1D9D0200C0117975F570A7540CB23ABDE239D57D46A7000070
                    449E5C3DBEC5F2DCD12100ACAF43A303005863AB51C5D332AA0000D8049FAF1E
                    5DFD13A38A8156FFEEFF49F5D3ADFE4E0000586FFFB6FAE59D7BA10070A1FC4F
                    02800B374F27B67A27F78F8C4E0100E062FDAFEA812D96EF1D1DC25798A7DB55
                    2FC9AB41000036C16F568F68B1FCD2E81000D68F132B00F85AF37452F5DC8C2A
                    000036C1ABAAD38C2AD6D0EAEFE456AD5ECF0200C07AFBD1EAB93BF74601E002
                    0C2B00B8A079BA64F5E2EAC1A3530000B8584FA9EEE7D51F6BECFC57833C6574
                    0A000017EB87AA17EFDC2305802FF32A1000CE374FA7542FABEE313A0500808B
                    F5E816CBA78F8EE028CCD3A3ABA78DCE0000E0629D5D7D7F8BE5A7478700B01E
                    0C2B005899A7CB546755DF393A050080C3FA42F5B016CB178E0EE118CCD3835A
                    BD76CF11D30000EBEDADD57D5A2C3F313A0480F10C2B00A879BA7CAB15F6778C
                    4E0100E0B03ED9EAD51FCBD1211C8779FAAEEAE5D5A9A353000038ACF754F768
                    B1FCD8E81000C632AC00D876F37495EA8DD569A353000038AC8FB4BAA9FBDED1
                    21EC8279BA5DAB71F39547A700007058BF5B7D578BE547468700308E6105C036
                    9BA76B546FAE6E3E3A050080C3FADBEAF416CB0F8E0E6117CDD34DAB7754571B
                    9D0200C061FD6175F716CBBF1E1D02C018861500DB6A9EAE5BBDA5FA86D12900
                    001CD6C75B8D2AFEBFD121EC81793AAD7A7B75D9C12500001CDE9F54776DB1FC
                    3FA34300D87F8746070030C03CDDA07A6746150000EBEE73D57D8C2A0EB0C5F2
                    7DD57D5BFD5D0300B0BE6E5CBD73E7DE2A005BC6B00260DBAC8E1B7E6775FDD1
                    2900001CD6B9D5835B2CDF363A843DB658BEB57A70ABBF730000D6D7D755BFBD
                    738F15802D625801B04DE6E996D56F57D71A9D0200C0C5FAF116CB978D8E609F
                    ACFEAE7F627406000017EBDAADC615B7181D02C0FE31AC00D816F374BBEA6DD5
                    5547A7000070B19ED062F99F4747B0CF16CB67544F1C9D0100C0C5BA6AF5F6E6
                    E9B6A34300D81F861500DB609EEE58BDB9BAE2E81400002ED673AB278C8E6098
                    9F6B750D0000B0DEAE58BDA579BAC3E81000F6DE09A30300D863F374F7EAD5D5
                    29A3530000B858EFAF6ED762F9A9D1210C344F97AEDE5BDD7C740A000017EBD3
                    D5BD5B2CDF3C3A0480BDE3C40A80836C9EEE55BD36A30A00804DF0A9EAFE4615
                    EC5C030F68754D0000B0DE4EA95EDB3C7DEFE81000F68E6105C041354F0FA85E
                    515D72740A000047E4112D967F343A8235B1587EA0FAF1D11900001C9193AB57
                    364FF71F1D02C0DE30AC003888E6E961D58BAA9346A7000070449ED36279C6E8
                    08D6CC62F9DC6A1E9D0100C01139A97AF1CEBD59000E18C30A8083669E1E5E3D
                    27DFE3010036C5FBAB478E8E606D3DB2FAC0E80800008EC8A1EA39CDD3627408
                    00BBEB84D10100ECA2797A68AB4FB4F9FE0E00B0193E5DDD66E7B50F70E1E6E9
                    66D57F6BF5FE6E0000D6DFB9D5C35A2C9F373A0480DDE1D3CC0007C53C3D38A3
                    0A00804DF3F346155CACD535F2A4D11900001CB113AAB9797AD0E81000768761
                    05C041304F3F509D91510500C026F960F54BA323D818BF54FDF1E80800008ED8
                    A1EA79CDD30347870070FC0C2B0036DD3CDDBF7A7EBEA703006C9A9F68B1FCDC
                    E80836C462F9D9EA274667000070540E552FD8B9870BC006F3100E6093CDD3F7
                    552FAA4E1C9D0200C05179618BE55B4747B06116CBB7B4FAF91F0080CD7162F5
                    A2E6E97EA3430038768615009B6A9EEE5BBD38A30A00804DF38FD5634647B0B1
                    FE45F5F1D11100001C9513AB339BA7FB8C0E01E0D81856006CA279BA57F592EA
                    A4D12900001CB5C7B558FED5E80836D4EADA79DCE80C00008EDA49D54B77EEED
                    02B0610C2B0036CD3CDDB37A797589D12900001CB53FA89E313A828DF71BADAE
                    25000036CB25AA97354FF7181D02C0D131AC00D824F3F4DDD52B32AA0000D854
                    3FD762F985D1116CB8D535F484D11900001C934B56AF689EBE6B74080047CEB0
                    026053CCD3DDAB57B5FAC11B0080CDF3FEEAD5A32338305E557D6074040000C7
                    E4E4EAD5CDD3DD46870070640C2B0036C13CDDB53AABD50FDC00006CA65F68B1
                    FCD2E8080E88D5B5F40BA333000038662757AF699EEE323A04808B675801B0EE
                    E6E9CED56BAA4B0D2E0100E0D8FD59F592D1111C3867561F1A1D0100C031BB54
                    F5DAE6E9F4D121001C9E6105C03A9BA73B55AFAB4E199D0200C071794A8BE517
                    464770C0ACAEA9A78CCE0000E0B89C529DDD3CDD7174080017CDB002605DCDD3
                    EDABB3AB4B8F4E0100E0B8FCEFEAF9A32338B09ED7EA1A030060735DBA7AFDCE
                    3D6100D6906105C03A9AA76FAFDE509D3A3A050080E3F6D416CBCF8D8EE0805A
                    5D5B4F1D9D0100C0713BB5D5B8E2DB468700F0B50C2B00D6CD3C7D6BF5C6EA32
                    A3530000386E9FAAE6D1111C78CF6D75AD0100B0D92E5BBDB179BADDE810002E
                    C8B002609DCCD36D5A8D2A2E3B3A0500805DF1F216CB4F8C8EE0805B2C3F5EBD
                    6274060000BBE272D572E75E31006BC2B002605DCCD369D59BAACB8F4E010060
                    D79C313A80ADE15A030038382E5FBD69E79E31006BC0B002601DCCD3B7546FAE
                    AE303A0500805DF3E1EA6DA323D81A6FADFE7274040000BBE60AADC615B71C1D
                    02806105C078F3748B56A38A2B8E4E010060573DBFC5F28BA323D812AB6BEDF9
                    A3330000D85557AADED23C7DF3E810806D67580130D23C7D53F596EACAA35300
                    00D875CF1B1DC0D671CD01001C3C576E35AEB8F9E810806D66580130CA3CDDAC
                    D571BD57199D0200C0AEFBDD16CBF78F8E60CB2C967F58BD6F74060000BBEEAA
                    D55B77EE290330806105C008F374D356A38AAB8E4E0100604FBC6074005BCBEB
                    4000000EA6ABB51A57DC747408C03632AC00D86FF374E356A38AAB8F4E010060
                    CFBC7174005B6B393A0000803D73F556E38A1B8F0E01D836861500FB699E6E54
                    BDADBAE6E8140000F6CC5F577F343A82ADF581EA6F46470000B067AE59BD6DE7
                    5E3300FBC4B00260BFCCD30D5B8D2AAE353A0500803DF5D616CB734747B0A556
                    D7DE5B47670000B0A7AED56A5C7183D12100DBC2B002603FCCD3D7B71A555C67
                    740A00007BCE436D46730D02001C7CD76935AEF8BAD12100DBC0B00260AFCDD3
                    F55B8D2AAE3B3A0500807DE1A136A3B9060100B6C3F55A8D2BAE3F3A04E0A03B
                    617400C081364FD7ADDE517DFDE8140000F6C5FF6CB1741C2FE3CDD3FFACBE6E
                    74060000FBE27F54776EB1FCDFA343000E2A275600EC95795A1DC566540100B0
                    4D9C14C0BA702D02006C8F1BB43AB9E2DAA343000E2AC30A80BD304F57ABDE5C
                    DD70740A0000FBEA1DA30360876B110060BBDCB07A4BF374D5D1210007916105
                    C06E9BA7CB55AFAF6E323A0500807DF7FED101B0C3B50800B07D6E52BD7EE71E
                    3500BBC8B0026037CDD329D559D569A353000018E24F4607C08E3F1E1D0000C0
                    10B7AECEDAB9570DC02E31AC00D82DF37489EACCEAF4D12900000CF17F5A2C3F
                    313A02AA76AEC50F8FCE00006088D3AB17374F278D0E0138280C2B0076C33C1D
                    AA9E5DDD6B740A0000C338218075E39A0400D85EF7AE9EB573EF1A80E3E49B29
                    C0F19AA713AA5FA97E68740A0000437D7074007C15D72400C0767B68F5B49D7B
                    D8001C07C30A80E3F7FF543F393A020080E19C0EC0BA714D0200F0A8EAF1A323
                    00369D6105C0F198A747553F373A030080B5E02136EBC635090040D5139A271F
                    0E04380E861500C76A9E1E523D7D740600006BC3436CD68D6B120080F3FC6AF3
                    F4E0D111009BCAB002E058CCD3BDAAE78CCE000060ADFCDDE800F82AAE490000
                    BED27377EE6D0370940C2B008ED63CDDB97A6975E2E0120000D6C797AA4F8F8E
                    80AFF2A956D7260000D4EA9EF64B9AA7D34787006C1AC30A80A3314FB7AECEAA
                    4E1E9D0200C05AF9788BE5B9A323E00256D7E4C747670000B0562E55BDA6793A
                    6D7408C02631AC003852F374D3EA0DD56547A70000B076FE7174005C04C30A00
                    00BEDA65AB37344F37191D02B0290C2B008EC43C5DAF5A5657199D0200C05AF2
                    F09A75E5DA0400E0C25CB57A53F374DDD121009BC0B002E0E2CCD3D5AA37557E
                    C00400E0A27878CDBA726D02007051AEDB6A5C71D5D12100EBCEB002E070E6E9
                    F2AD5EFF71E3D1290000AC350FAF5957AE4D00000EE726AD5E0B72B9D12100EB
                    CCB002E0A2CCD329D559D5AD46A70000B0F63CBC665DB9360100B838A75567ED
                    DC1307E0421856005C9879BA44756675A7D12900006C844F8F0E808BF0A9D101
                    00006C84D3AB3377EE8D03F0550C2B00BEDA3C1DAA9E5DDD6B740A00001BE3DC
                    D10170115C9B00001CA97B55CFDAB9470EC057F08D11E02BCDD309D5AF543F34
                    3A050000000000F6D943AAA7EDDC2B0760876105C005FDBBEA27474700000000
                    00C0208FAA1E3F3A02609D1856009C679E1ED56A58010000000000DBEC09CD93
                    0F2102EC30AC00A89AA787544F1F9D0100000000006BE2579B27AFCD06C8B002
                    A0E6E9DED57346670000000000C09A999BA77B8D8E0018CDB002D86EF374E7EA
                    25D589834B000000000060DD9C58BDA4793A7D7408C0488615C0F69AA75B5767
                    55278F4E0100000000803575A9EA35CDD369A343004631AC00B6D33CDDB47A43
                    75D9D1290000000000B0E62E5BBD71E7DE3AC0D631AC00B6CF3C5DAF7A537595
                    D1290000000000B021AE522D77EEB1036C15C30A60BBCCD3D55A8D2AAE333A05
                    000000000036CC755B8D2BAE3A3A04603F195600DB639E2EDFEAF51F371E9D02
                    00000000001BEA26D51B9AA7CB8D0E01D82F8615C07698A753AAB3AA5B8D4E01
                    00000000800D775A75D6CEBD778003CFB00238F8E6E912D54BAA3B8D4E010000
                    00008003E2F4EACC9D7BF000079A610570B0CDD3A1EAD9D5F78E4E0100000000
                    8003E65ED5B376EEC5031C58BEC90107DD93AB1F1A1D01000000000007D443AA
                    278D8E00D84B8615C0C1354F3F5AFDEBD119000000000070C0FD9B9D7BF20007
                    9261057030CDD3F754BF313A030000000000B6C46FECDC9B0738700C2B808367
                    9E6E55BDB43A71740A00000000006C8913AB97344FDF323A0460B719560007CB
                    3C5DB77A5D75EAE8140000000000D83297A95EB773AF1EE0C030AC000E8E79BA
                    7C757675CDD1290000000000B0A5AED56A5C71F9D12100BBC5B0023818E6E912
                    D5CBAA6F1A9D0200000000005BEE9BAB97EEDCBB07D8788615C0E69BA713AADF
                    ACEE363A050000000000A8EAEED53377EEE1036C34C30AE020787CB5181D0100
                    000000005CC0C3ABC78D8E00385E8615C0669BA787564F189D0100000000005C
                    A827364F0F191D01703C0C2B80CD354F77A99E353A03000000000038AC67EDDC
                    D307D8488615C0669AA79B57AFA84E1A9D0200000000001CD625AA57ECDCDB07
                    D8388615C0E699A76B566757971F9D0200000000001C91CB5767EFDCE307D828
                    8615C06699A7CB54AFADAE373A050000000000382AD7AB5EBB73AF1F60631856
                    009B639E4EAACEAC4E1B9D0200000000001C93D3AA17EFDCF307D8088615C066
                    98A713AA5FABEE313A050000000000382EF7AC7E75E7DE3FC0DA33AC0036C5BF
                    ACFEF9E808000000000060573CA27ACCE8088023615801ACBF797A60F51F4667
                    000000000000BBEAA9CDD3034647005C1CC30A60BDCDD31DAA33466700000000
                    00007BE28CE6E9F6A323000EC7B002585FF374E3EAD5D52547A7000000000000
                    7BE2E4EAACE6E91B4687005C14C30A603DCDD355ABD757571A9D020000000000
                    ECA92B55AFDF793600B0760C2B80F5334FA754675537189D020000000000EC8B
                    1BB63AB9E294D121005FCDB002582FF37462F5FCEADB46A7000000000000FBEA
                    DBAAE7354F9E61026BC5372560DDFC6275BFD1110000000000C010DFD7EA5901
                    C0DA30AC00D6C73CFD64F5D3A333000000000080A17EA6797AE4E80880F31856
                    00EB619EEE533D7D74060000000000B0169EDE3CDD7B740440195600EB609E6E
                    57BDA83A61740A0000000000B0160E552F6E9E6E3B3A04C0B002186B9EBEBE7A
                    4D75CAE814000000000060AD9C52BD76E75902C0308615C038F374A5EAF5D5D5
                    46A70000000000006BE96AD5D9CDD315478700DBCBB00218639E4EAE5E59DD64
                    740A0000000000B0D66E5ABD72E7D902C0BE33AC00F6DF3C1DAA9E53DD69740A
                    0000000000B0114EAF9EBDF38C01605FF9C6038CF0A4EA074747000000000000
                    1BE541D5CF8F8E00B68F6105B0BFE6E947AB7F333A030000000000D8488F6D9E
                    7E647404B05D0C2B80FD334FDF5DFDC6E80C000000000060A33D63E79903C0BE
                    30AC00F6C73C7D63F592EAC4D1290000000000C0463BB13AB379BAE9E810603B
                    1856007B6F9EAE50BDBABAECE8140000000000E040B85CF5EA9D6710007BCAB0
                    02D85BF37462F5A2EA1B46A700000000000007CA8DAB17EE3C8B00D8338615C0
                    5EFB85CA7BCE000000000080BDF03DD593474700079B6105B077E6E941D5BF1A
                    9D0100000000001C683FDB3CFDE0E808E0E032AC00F6C63CDDBA7AD6E80C0000
                    000000602B3C7BE7D904C0AE33AC0076DF3C5DA37A5575A9D1290000000000C0
                    56B854F5AAE6E9EAA3438083C7B002D85DF37472F5F2EA3AA353000000E805D5
                    6F56BF537D66700B0000ECB5EB542F6F9E2E393A0438584E181D001C20F37442
                    AB1B763F3C3A050000F6D147AAA7B6583E7574081CD63C9D54DDA4FA96EA565F
                    F175C591590000B0077EABFAB116CB7347870007836105B07BE6E9C7AB5F1F9D
                    0100007BECE3D53BAAB7EE7CFDF716CB2F8D4D8263B41AC85FB7F3C716E7FD79
                    FD91590000B00B7EBCC5F219A3238083C1B002D81DF374E7EA4DD549834B0000
                    60B77DA67A57E70F297EB7C5F20B6393608FCDD315FBDAB1C53756278ECC0200
                    80A3F085EA6E2D96EF181D026C3EC30AE0F8CDD3D7B57A5FEF5506970000C06E
                    F842754EE70F29CE69B1FCECD8245803F374B5D846B30000200049444154A9EA
                    9B3A7F6871DACE9F278FCC020080C3F8BFD56D5A2CFF7C7408B0D90C2B80E333
                    4FA756EFAE6E393A0500008ED1B9D5FB3A7F48F1AE16CB4F8C4D820D314F976C
                    F5FBE0B77EC5D7370C6D0200800BFABDEA0E2D969F1C1D026C2EC30AE0D8ADDE
                    C57B6675FFD12900007094DEDFF9438A77B4587E74700F1C1CF374A5EA763B5F
                    E78D2DAE3CB40900806DF7D2EA812D96E78E0E0136D349A303808DF6D88C2A00
                    00D80C1FAECE6E35A4787B8BE55F0FEE81836BB1FCFBEA0D3B5FE78DF26FD005
                    4FB5B85575C9418500006C9FFBB73AB9E2174687009BC98915C0B199A77B57AF
                    1E9D01000087F1E1EA65D54BAA735A2CBF34B80738CF3C9DDCD7BE42E446439B
                    000038E8CEADEED362F99AD121C0E631AC008EDE3CDDAC3AA7BAECE8140000F8
                    2AE78D295E5AFD17630AD820F374E5CE7F7DC81DAB6FAF4E19DA0400C041F3F1
                    EA5B5B2CFF687408B0590C2B80A3334F57ACDE9B4F120100B03EFEB2D590C298
                    020E9279BA64759BEAF4EA4ED51DAACB0C6D0200E020F8D356E38A8F8E0E0136
                    87610570E4E6E9A4EA75D5343A050080ADF7979DFF9A0F630AD806ABDF496FD5
                    6A64717AAB532DAE30B40900804DF5C6EA9E2D965F1C1D026C06C30AE0C8CDD3
                    2F568F199D0100C0D6FAABCE3F99E23DC614B0E5E6E9C4EA9B3B7F6871A7EA2A
                    439B0000D824BFD862F9AF4647009BC1B0023832F3F443D5F346670000B075FE
                    AAF34FA630A6002EDA3C9D507D63E78F2C4EAFAE39B409008075F79016CBE78F
                    8E00D69F610570F1E6E936D5BBAA9347A70000B015CE1B53BCB47AB73105704C
                    56438B1B75C1A1C5F586360100B06E3E5BDDA1C5F2BF8D0E01D69B61057078F3
                    74CDEA77AA6B8F4E0100E040FB87EA05D5991953007B659EBEAEF34716A75737
                    1CDA0300C03AF870759B16CBBF1E1D02AC2FC30AE0A2CDD3C9D5DBAA6F1F9D02
                    00C081F5AEEA37AB97B5587E7A740CB065E6E9DA9D3FB4B853AB57890000B07D
                    DE53DDA5C5F2B3A34380F56458015CB8D591A9BF55FDB3D12900001C381FAD9E
                    5BFD568BE50746C7007CD93C5DADD5C0E2BCB1C52DC6060100B08F9E55FD488B
                    E5B9A34380F56358015CB8797A64F56BA33300003850DED9EA748A973B9D02D8
                    08F374A5EA0E9DFFEA905B558786360100B0971ED962F9EBA32380F56358017C
                    AD79FACEEA4DD589A3530000D8787FDFF9A753FCD1E81880E3324F97AB6EDFF9
                    AF0EB96D75D2D026000076D317ABBBB558BE7D7408B05E0C2B800B9AA7AFAF7E
                    A7BAF2E814000036DA1F544FAB5EDC62F999D131007B629EAE50DDABFABEEABB
                    AB93C7060100B00B3E52DDA6C5F27F8D0E01D687610570BE79BA4CF5EEBC4316
                    0080637776F5CBD55BBD9716D82AABDFA9EF517DFFCE9FA78E0D0200E038FC41
                    75FB16CB4F8C0E01D6836105B0324F27542F6DF5291B0000381A9FA9CEA87EC5
                    EB3E00AA793AA5FAAEEA075AFD9EED752100009BE7E5D5FD7D680028C30AE03C
                    F3F4F8EA89A3330000D8287F5BFD7AF58C16CBBF1B1D03B096E6E9DAD58F57FF
                    BCBAD2E01A00008ECEE35B2C9F343A0218CFB002A879BA4FF5AAD11900006C8C
                    F7B77ADDC70B5B2C3F333A066023CCD3A5AB1FAA1E5D7DE3E01A00008EDC7D5B
                    2C5F3D3A0218CBB002B6DD3CDDBC3AA7BACCE8140000D6DE7BAA9FAFDEE82854
                    8063B47A15E7D46A60F1DD836B0000B8789FA8BEADC5F2FDA34380710C2B609B
                    CDD395AAF756371C9D0200C05A7B77F573D55B0C2A0076D13CDDA67A5A7587D1
                    2900001CD687AADBB558FEFDE810600CC30AD856F37452757675F7D1290000AC
                    AD7757FFAE7AAB4105C01E599D6071BFEAA9D50D06D7000070D1DE54DDA3C5F2
                    0BA34380FD7768740030CC7FC8A80200800BF7AEEA6ED51D5B2C9D5201B09716
                    CB735B2C5F5EDDAC7A4CF5B1C14500005CB8BB57FF7E74043086132B601BCDD3
                    FDAA978FCE000060EDBCB3D52B3FDE664C0130C83C5DA5D569418FA84E1C5C03
                    00C0D7BA5F8BE52B474700FBCBB002B6CD3CDDB07A5F75B9D1290000AC8D77B6
                    7A88F776830A8035314FDF523DBFBAF9E81400002EE063D5692D96FF637408B0
                    7F0C2B609BCCD3A55ABD27FBB4D1290000AC850FB43A76FE0D0615006B68F57B
                    FC53AA478F4E0100E0027EB7BA7D8BE567478700FBE3D0E800605FFD52461500
                    00D4DF543F56DDB2C5F2F54615006B6AB1FC4C8BE54FB77A9FF78747E70000F0
                    65B76EF5CC05D8124EAC806D314F0FAC5E3C3A030080A13E5DFDC7EA175B2C3F
                    3E3A0680A3304F57AA9E513D60740A00005FF6032D96678E8E00F69E61056C83
                    79BA71AB63A92E333A05008021CEAD9E5B3DAEC5D2279E0136D53C9D503DB8D5
                    C0C2EFF80000E37DBCBA4D8BE59F8C0E01F69661051C74F3744A754E758BD129
                    00000CF196EA312D96BF373A04805D324FB7AC5E5B5D67740A0000FD41F56D2D
                    969F1E1D02EC9D43A303803DF7AB195500006CA30F54F7A8EE6E540170C02C96
                    BF5F7D6BF5BED1290000748BEAE9A32380BDE5C40A38C8E6E921D519A3330000
                    D8579FAA1E5FFD6A8BE51746C700B087E6E9D4EA05D57D46A70000D0435A2C9F
                    3F3A02D81B86157050CDD3CDAADFA92E3D3A0500807D7376F5132D96FF6B7408
                    00FB649E4EAC9E5AFDCCE81400802DF7A9EAB62D961F181D02EC3EC30A388856
                    9F58796F75B3D1290000EC8BBFA91E55BDB4C5F2DCD131000C304F8FA87EAD3A
                    71740A00C016FB4075BB16CB4F8E0E01769761051C34F37442F5DCEA21A35300
                    00D817BF55FD6C8BE54747870030D83C3DA07A517568740A00C0163BA35AF8E0
                    031C2C7EC98283E79F66540100B00DFEA8BA538BE58F1A550050D562F992EAE1
                    A3330000B6DC43F333191C384EAC8083649E6E51FDD7EA52A3530000D8339FAB
                    9E5CFD8716CBCF8E8E01600DCDD38F55FF79740600C016FB4CAB5782FCF7D121
                    C0EE30AC8083629E2E5BFDB7EAC6A3530000D833EFAC7EB4C5F283A343005873
                    F3F4E8EA69A3330000B6D81F57B76DB1FCF8E810E0F87915081C04F37442F59B
                    195500001C549FAB1E53DDD9A8028023B258FE4AF5D8D11900005BEC26D53377
                    9EE1001BCEB0020E861FAB7E60740400007BE2FDAD8E0FFDA516CB2F8D8E0160
                    832C964FA99E343A0300608BFD60F5A3A32380E36758019B6E9E4EAB9E3E3A03
                    00803DF12BD56D5A2C7F7F7408001BEBFFA9CE1C1D0100B0C59EDE3CDD6A7404
                    707C1C3D039B6C9E2E5FBDAFBAC1E814000076D55F568B16CB378D0E01E00098
                    A753AB73AA6F1A9D0200B0A53E54DDBAC5F263A3438063E3C40AD854AB77723D
                    3BA30A008083E6E5D52D8C2A00D8358BE527AB7F52FDC3E81400802D75C3EA59
                    3BCF76800D6458019BEB27ABFB8D8E000060D77CA25A54F76FB1FCC8E016000E
                    9AC5F2CFAA0757E78E4E0100D852DF573D727404706CACA26013CDD3EDAA7755
                    97189D0200C0AE784FF59016CBFF313A0480036E9E1E5F3D71740600C096FA7C
                    758716CBF78E0E018E8E132B60D3CCD395AA976454010070503CB93ADDA80280
                    7DF2E4EAACD11100005BEA12D54B9AA72B8E0E018E8E132B6093ACDEBDF5EAEA
                    5EA3530000386EFFD8EA940A0FB700D85FF37485EA03D53547A700006CA9B3AA
                    FBB6587A4D1B6C082756C066F917195500001C047F58DDC6A802802116CB7FA8
                    1E313A0300608BDDBBFA99D111C0917362056C8A79BA7DF58EEAC4D12900001C
                    9717573FDC62F9C9D121006CB9793AB37AC0E80C00802DF5C5EA4E2D96EF191D
                    025C3C2756C02698A7AB546766540100B0C9BE58FD74F520A30A00D6C4A3AABF
                    1F1D0100B0A54EACCEDC790604AC392756C0BA9BA743D5EBAAEF1E9D0200C031
                    FB9BEA012D96BF3D3A04002E609E1E5A3D77740600C0167B7DF5BD2D965F1A1D
                    025C342756C0FAFBD7195500006CB2FF52DDDAA8028035F5BCEA8DA3230000B6
                    D8F7543F3B3A02383C2756C03A9BA7D3ABB766040500B0A97EA3FAE916CBCF8D
                    0E01808B344FD7AFDE5F9D3A3A0500604B7DA9BA4B8BE53B46870017CEB002D6
                    D53C5DBDFABDEA1AA3530000386A5FAC7EACC5F259A34300E088CCD313ABC78F
                    CE0000D8627F55DDAAC5F26F4687005FCBA7E0611DCDD389D50B32AA0000D844
                    9FA8EE695401C086F9A5EAA3A3230000B6D835ABE7EF3C2302D68C6105ACA7C7
                    57771D1D0100C051FBABEA8E2D96DE550FC066592C3F563D75740600C096BB5B
                    F5B8D111C0D7F22A105837F374B76A99FF3E010036CDFBAB7BB458FEC5E81000
                    3826F3746AF5A1EAEAA3530000B6D8B9D5DD5B2CDF323A04389F132B609DCCD3
                    B5AA1766540100B069DE56DDC1A802808DB6587EB2FA85D11900005BEE84EA85
                    CDD335478700E733AC8075314F27552FAAAE3A3A050080A3F2FCEABB5B2CFF61
                    740800EC826756FF7B740400C096BB5AF5A29D6747C01A30AC80F5F1C4EA4EA3
                    230000382A4FAE1EDA62F9B9D12100B02B16CBCFB6BA470100C058A7574F181D
                    01AC78DD00AC8379BA4BE55D5900009BE38BD58FB758FEE6E81000D875F374C9
                    EAFFE4544D0080D1CEADEEDA62F9B6D121B0ED9C5801A3CDD315AA7974060000
                    47EC93D5BD8D2A0038B05627313D7B740600009D503D77E75912309061058CF7
                    EBD5754747000070443E517D578BE5D9A34300608FFDD6E8000000AAD533A4FF
                    343A02B69D61058C344F3F503D687406000047E41FABBBB758BE7B740800ECB9
                    C5F243D59B4667000050D5839BA7078E8E806D665801A3CCD375AB678CCE0000
                    E088FC4375B716CB73468700C03E7AE6E8000000BEEC3F374FD7191D01DBCAB0
                    024698A743D55C79271600C0FAFB6875D716CBDF191D0200FBECACEAAF474700
                    0050AD9E29CD3BCF98807DE63F3C18E3A7AABB8C8E0000E0627DA4BA4B8BE5FB
                    468700C0BE5B2C3F5F3D7B740600005F76D7EA51A323601B1956C07E9BA76FAA
                    9E323A0300808BF577D577B658FEDEE8100018E839A3030000B8807FBFF3AC09
                    D8478615B09FE6E9E4EA05D5C9A353000038ACBFA9EEDC62F9DF478700C0508B
                    E59F557F343A0300802F3BB97AFECE3327609F1856C0FE7A62758BD11100001C
                    D65FB51A557C60740800AC89D78D0E0000E0026E593D6174046C13C30AD82FF3
                    747AF52F4767000070581FAE4E6FB1FCE0E81000582386150000EBE75F354F77
                    1A1D01DBC2B002F6C33C5DBE3AA33A61740A000017E9FF567769B1FCD3D12100
                    B066DE5D7D6C7404000017704275C6CE3328608F1956C0FEF8B5EA7AA3230000
                    B8489FAAEED962F927A3430060ED2C969FAFDE383A030080AF71FDEA574747C0
                    3630AC80BD364FF7AF1E323A0300808BF485EAFB5A2CDF3B3A0400D6D86B4707
                    000070A11EDA3C7DFFE80838E80C2B602FCDD3B5AB678ECE0000E0B0FE698BE5
                    1B464700C09A7B4375EEE80800002ED4339BA76B8D8E8083CCB002F6CA3C1DAA
                    9E535D71740A000017E95FB6583E6F7404FCFFECDD79DC5E757DE7FF77120284
                    4540406407D91414645114AC2CEA414105111744F428AD65B1556BDD15A9D6A9
                    826D756AEBCFA5ED99AA6DA73376BA3ACEE9AFB576B4B6526B5D5AADBB15A16E
                    1545D98464FE3837C5702721C9BD7CAEEB5CCFE7E3713DB2F8072FF24822F7F5
                    7D5FDF0330F1DAFE5B493E5D9D0100C006DD33C96FCF9D4D014BC01F2E583ACF
                    4DF2A8EA08000036EA57D2F66FAC8E008029F2F1EA00000036AA49725975048C
                    9561052C85AE3932C91BAA330000D8A8F72479517504004C997FAA0E00006093
                    AE9C3BA302169961052CB6AED936C9BB936C5F9D0200C006F5499E9DB65F5B1D
                    020053C68D150000936DFB24EF9A3BAB02169161052CBE2B921C5B1D0100C006
                    7D2CC97969FB5BAB4300600AB9B1020060F21D97E4D5D51130362BAA036054BA
                    E661493E18A325008049F4C52427A5EDBF591D020053AB6BBE94E4E0EA0C0000
                    36696D9287A7ED3F5C1D0263E1F017164BD7DC23C9BBE2CF1500C024BA21C959
                    461500B0606EAD0000987C2B333C12E41ED52130160E8061F1BC39C941D51100
                    006CD0D3D3F6FF5A1D010023F0F1EA00000036CBC149DE541D01636158018BA1
                    6BCE4DD256670000B041AF49DBFF497504008CC417AA030000D86CCF9A3BC302
                    16C8B00216AA6BF64EF2F6EA0C000036E8CF92FC427504008CC837AA030000D8
                    226F9F3BCB0216C0B00216A26B5624F9AD24BB57A7000030CFE7935C98B65F5B
                    1D02002362580100305D764FF29B73675AC05632AC8085B924C9A3AB23000098
                    E70749CE49DB5F5F1D020023F3CDEA000000B6D863925C5C1D01D3CCB002B656
                    D71C91E48DD51900006C509BB6FF97EA080018A1EF24B9BD3A0200802DF6CB73
                    675BC05630AC80ADD135AB93BC3BC99AEA140000E6F9A5B4FD7BAB2300609486
                    476C7DAB3A0300802DB626C9BBE7CEB8802D6458015BE7F224275447000030CF
                    FF49F2AAEA080018B96F54070000B0554E88F74D60AB1856C096EA9A9392BCBC
                    3A03008079BE94E469697BD79303C0D232AC0000985EAF48D73CB43A02A68D61
                    056C89AED939C9BBE2CF0E00C0A4B935C9B969FBFFA80E018019704375000000
                    5B6D659277A56B76AA0E8169E27018B6CCAF26B94F75040000F3BC2C6DFF89EA
                    08009811ABAA030000589043329C79019BC9B0023657D79C93E4A2EA0C0000E6
                    F9409237554700C00CF19E2200C0F4FBC974CDE3AB23605AF822083647D7DC3B
                    C93BAA33000098E7FB49DAB4FDDAEA100098216EAC0000188777A66BF6AA8E80
                    6960580177A76B56247967923DAA53000098E7B2B4FDBF554700C08C31AC0000
                    18873D338C2B565487C0A433AC80BBF79C24675547000030CFFF48F29EEA0800
                    984186150000E3F1D8243F551D0193CEB00236A56B0E4FF22BD5190000CC735D
                    924BD2F6EBAA43006006195600008CCBAFA66B0EAB8E80496658011BD335DB24
                    7957921DAA53000098E75969FBEF544700C08CF29E2200C0B8EC90E45D736763
                    C006F8220836EEE7933CB83A020080797E3D6DFF7FAA230060866D5F1D0000C0
                    A23B31C90BAB2360521956C0860C8F00B9A23A030080793E97E4C5D5110030E3
                    F6AD0E000060495CE19120B061861570575DB332C9DB936C579D0200C07A6E4F
                    F2F4B4FD8DD5210030B3BA6655927DAA3300005812DB2779C7DC5919F063FCA1
                    80F92E4A724A75040000F3BC2E6D7F75750400CCB8BD93ACAA8E000060C99C92
                    E4D9D51130690C2BE0C775CD3E49AEAACE0000609E2F26F9A5EA080020FB5707
                    0000B0E4DE38776606CC31AC80F5BD25C92ED5110000CCF3BCB4FDCDD5110080
                    610500C00CD825C9AF5547C02431AC803B74CD13933CA13A03008079FE386DFF
                    E7D511004012C30A008059716EBAE6DCEA089814861590245DB35B86DB2A0000
                    982C3727797E750400F09F0C2B000066C7AFA76B76AD8E804960580183AB92DC
                    BB3A02008079FE4BDAFE2BD51100C07F32AC0000981DF7CE70860633CFB002BA
                    E6F424175567000030CF17E38B77009834C756070000B0AC7E325D735A750454
                    5B511D00A5BA6687249F4C7248750A0000F39C95B67F5F75040030A76BEE95E4
                    1BD51900002CBB2F24393A6D7F53750854716305B3EED531AA000098447F6C54
                    010013E7C4EA0000004A1C9AE14C0D66966105B3AB6B8E4BF2C2EA0C0000E6B9
                    39C9F3AB230080791E521D000040999F9F3B5B83996458C16CEA9AD5497E33C9
                    AAEA140000E6F92F69FBAF54470000F3B8B102006076AD4AF2CE74CD36D52150
                    C1B08259F582240FAC8E0000609E2F26B9AA3A0200B88BAE5995E4C1D5190000
                    943A36C3191BCC1CC30A664FD71C96E417AA330000D8A017A5ED6FAE8E0000E6
                    B95F929DAB23000028F79A74CDA1D511B0DC0C2B982D5DB322C9DB936C5F9D02
                    00C03C1F4BF247D51100C006790C080000C970C6F6F6B9333798198615CC9A8B
                    929C5A1D0100C0065D9EB65F571D01006CD023AB0300009818A725797675042C
                    274B226647D7EC9DE4334976A94E0100609EBF4FF250C30A0098405DB37D926F
                    25D9A93A05008089717D9223D3F6D75587C072706305B3E42D31AA000098546E
                    AB0080C9F5A818550000B0BE5D93FC5A75042C17C30A6643D79C9BE4DCEA0C00
                    0036E8C349FEA23A0200D8A8275607000030919E98AE794275042C078F0261FC
                    BA66D724FF9264EFEA14000036E8F4B4FD07AA2300800DE89A6D937C23C32712
                    0100E0AEAECBF04890EBAB436029B9B1825970658C2A000026D55F1B5500C044
                    3B2D461500006CDCDE49DE501D014BCDB08271EB9A5393FC54750600001B7579
                    750000B0491E030200C0DD794EBAE694EA08584A1E05C27875CD9A249F4C7268
                    750A00001BF41769FBA63A0200D888AE5995E16AE73DAB53000098789F4F724C
                    DAFEA6EA10580A6EAC60CC2E8F510500C0247B75750000B0494D8C2A0000D83C
                    8725795575042C15C30AC6A96B8E4DF2A2EA0C000036EA7FA7ED3F521D01006C
                    D2F3AB030000982A2F4ED73CB03A0296826105E3D335DB2479679255D5290000
                    6CD415D50100C02674CD51196EAC000080CDB52AC93BE7CEEA60540C2B18A317
                    2439AE3A0200808DFADBB4FD47AB2300804D7A5E7500000053E9F8B8F98C1132
                    AC605CBAE6D024AFA9CE00006093DE521D00006C42D7EC91E4C2EA0C0000A6D6
                    6BD235875447C06232AC603CBA664592B725D9BE3A0500808DFAF724EFAD8E00
                    0036E9A7E3FD150000B6DE9A246F9F3BBB835130AC604C9E95E4F4EA08000036
                    E96D69FB5BAB2300808DE89A6D935C569D0100C0D43B3D495B1D018BC5B08271
                    E89ABD93FC72750600009B745B92B7574700009BF4E4247B57470000300ABF92
                    AEB97775042C06C30AC6E2BF26D9B53A0200804D7A6FDAFEDAEA0800602386DB
                    2A2EAFCE0000603476CD70860753CFB082E9D735E72439AF3A030080BBF596EA
                    000060932E4D725875040000A3F2A474CDD9D511B05086154CB7AED935C96F54
                    67000070B73E91E4C3D51100C04674CDEE495E5D9D0100C028FD46BA6697EA08
                    5808C30AA6DDEBE3B99F0000D3E02D69FB75D51100C0465D1E8F5905006069EC
                    93E14C0FA6D68AEA00D86A5D734A92BFAECE0000E06E5D9F64DFB4FD8DD52100
                    C00674CD11493E9D649BEA14000046ED94B4FDDF5447C0D6706305D3A96BB64F
                    F28EEA0C000036CB6F1A5500C044BB2A461500002CBD77CC9DF1C1D431AC605A
                    5D9EE4B0EA080000EED6BA246FAD8E000036A26B1E91E471D5190000CC84C393
                    BCAA3A02B6864781307DBAE698241F4BB2AA3A050080BBF5BFD3F66756470000
                    1BD0353B24F9C7244754A7000030336E4B727CDAFE93D521B025DC58C174E99A
                    95497E3D46150000D3E23DD50100C0465D15A30A000096D736497E235DE30200
                    A68A6105D3E6C2242757470000B0596E49F2A7D51100C00674CD99492EADCE00
                    0060269D9CE1CC0FA6862510D3A36B764DF2B9247B56A70000B059FE57DAFEDC
                    EA0800E02EBA66CF249F4AB257750A000033EB9B498E48DB5F5F1D029BC38D15
                    4C93D7C6A80200609AFCF7EA0000E02E862B97DF11A30A00006ADD2BC96BAA23
                    60731956301DBAE681713D2500C034B929C99F57470000F35C94E4ECEA080000
                    487259BAE698EA08D81C86154CBEAE5999E4D7E3F72B00C034F9B3B4FD0FAA23
                    00801FD3358725795375060000CC19CE0087B34098687E93320D9E91E4A4EA08
                    0000B6C81F540700003FA66B764BF2A74976AC4E0100801F7372920BAB23E0EE
                    185630D9862FFAAFACCE0000608BFC30C9FBAA230080395DB36D923F4C724475
                    0A00006CC055E99A5DAB2360530C2B9874AF4DB267750400005BE44FD2F63756
                    47000049BA664592B72739B5B80400003666CF0C678230B10C2B985C5D736C92
                    4BAA330000D8621E03020093E315499E591D01000077E3D274CD03AB2360630C
                    2B984C5DB332C9AFC7EF51008069734392F75747000049BAE669F1C93F0000A6
                    C37036389C11C2C4F11B9349F5CC240FAD8E0000608BFD71DAFEE6EA08009879
                    5DF313497EBB3A030000B6C049499E511D011B6258C1E4E99ADD925C599D0100
                    C056F9EFD5010030F3BAE6E4247F9664DBEA140000D84257CE9D15C244D9A63A
                    0036E0B549F6A88E0000608BDD94E42FAA2380625DB322C93D327C5DB75392D5
                    77796DB3891FAF48727386BF4FEEFED5F6B72FD7BF164C8DAE7944923F49B243
                    750A00006C853D93BC26C9CF5487C08F5B511D00EBE99AE3925C1DB7A900004C
                    A33E6D7F467504B004BA66A724F749B25786C1C41DAF3D37F2FDE5FA20C7ADB9
                    7368716392EF24F9D65D5EDFDEC0CFDD90B65FB74C8DB07CBAE6AC24EF4DB25D
                    750A00002CC0DA2427A4ED3F5E1D027730AC607274CDCA241F4EF290EA140000
                    B6CA4BD3F66FA88E00B6C270CBC43D931C92E4D01FFBF68EEFEF5517B7246ECD
                    FCC1C57549BE9AE42B73DF7E356D7F7D55206CB1AE392FC9EFC50DB500008CC3
                    47923C2C6DBFB63A04125F683159DA185500004CB3BFAA0E00EEC630A03820C9
                    F1498E4D7258EE1C4FEC5A58B6DCB64DB2CFDC6BE3BAE67BB9636471D7D1C5F0
                    FD6FBBF98289D0351726E9E206500000C6E3A1499E99E4B7AB432071630593A2
                    6B764BF2B90C57C60200307DBE97648FB4FD6DD521C09CF5471477BC4E48B27B
                    65D6C8DC943B87169F4FF2D9249F99FBF63AA30B96DCF0E7FC6792BC29DEE703
                    00607CBE95E488B4FD77AB43C08D154C8A5F8C510500C034FBA0510514EB9A7D
                    939C98F58714BECE5A5A6B92DC77EE75C65DFEB7EFA76B3E9BF5C7169F49F2A5
                    B4FD8F96B59271EA9A3549FEBF24CFA84E01008025B26792D726796E750858B2
                    53AF6B8E4F7275FC7E04009866CF4FDBBFB93A02664AD7EC9AE4D4248F9C7B1D
                    51DAC3E6FA51922F64FDC1C56793FC4BDAFE8795614C91AE3928C91F6678A40F
                    00008CD9DA240F4ADBFF637508B3CD4136B5BA6665920F277948750A00000B72
                    74DAFE53D511306A5DB35D8667CCDE31A478509295A54D2CA6B5198616FF90E1
                    C307FF90E41369FB9B4BAB983C5DF3A824BF9FE49ED5290000B04CFE2EC9C969
                    FBB5D521CC2E8F02A1DAD36254010030EDBE95E49FAB236074BA664592A373E7
                    90E2E14976286D6229AD4C72D4DCEB99733F775BBAE6D3B97368F10F493E9DB6
                    BFB5269152C3DF092F49F2BA18550100305B1E92E4FC24EFA90E6176B9B1823A
                    5DB363927F4DB26F750A00000BF20769FBA75447C0280C07A7C72479F2DCEB90
                    DA2026D0AD493E91F56FB6F84CDAFEB6D22A9656D7DC2BC9DB929C539D020000
                    45BE9EE4088F50A48A1B2BA8F492185500008CC15F5507C0D4EB9AFB6718523C
                    25C9E1C5354CB66D333C06E641492E99FBB99BD2351FCFFA375B7CCE35B92330
                    8CAD2E4CF2ABF1E80F000066DBBE495E9CE4D5D521CC26375650A36B0E4CF2D9
                    24DB57A70000B06087A7ED3F5F1D0153A76B8EC830A4784A92238B6B189F1B92
                    FC63D61F5B7C296DBFAEB48ACDD7350765B8A5A2292E010080497173865B2BFE
                    AD3A84D9E3C60AAABC3E4615000063704D922F5447C0D4E89A3D923C3BC90549
                    8E2EAE61DC764E72CADCEB0EDF4DD77C2CEB8F2DBE666C3161BA665592E75D3D
                    5D18000020004944415426795D921D8B6B000060926C9FE18CF169D521CC1E37
                    56B0FCBAE6E4241FAACE00006051FC4EDAFE99D51130F1BAE6F80C07A5E727D9
                    AEB8067EDCB7320C2CAE4EF2D1241F4ADB7FAF36698675CDD149DE9EE4C4EA14
                    0000986027A7EDFFB63A82D96258C1F2EA9A9519DEA839BE3A050080457151DA
                    FEB7AA23602275CDB649CECB30A87868710D6CAEB5493E96E40373AF0FA7ED6F
                    A84D9A015D7358922B328CAFBC5F0700009BF60F494E4CDBAFAD0E6176781408
                    CBEDC2185500008CC9C7AB0360E274CD3E497E7AEEB557710D6CA995491E34F7
                    7A7192DBD33557671859FC7586A1C50FEBF246A66B0E4CF2AA246D9255B53100
                    0030354E48F2F424BF531DC2ECB08067F974CD4E493E9764EFEA14000016C5ED
                    49764ADBDF5C1D0213A16B1E94E485499E181F6460BC7E94E126CA3B86167F9B
                    B6BFA9B4681A75CDDE495E91E439495617D70000C034BA2EC9E169FB1F548730
                    1BBCD1C3727A598C2A0000C6E45F8D2A2049D71C95E417939C539D02CB607592
                    93E75EAF4C726BBAE6EF72E7D0E2EFFC7FC32674CDE1492E49727192ED8B6B00
                    00609AED9DE4A519BE2E8125E7C60A9647D71C94E4B349B62B2E010060F1FC7E
                    DAFEFCEA0828335CE1FF0B191E79B8B2B80626C52D49FE36C3C8E20349FE3E6D
                    7F6B6951B5AED936C913323C1EE8B4E21A000018935B921C91B6FF6A7508E3E7
                    C60A96CB9531AA0000189B4F56074089AEB957862BFC2F4EB26D710D4C9AED32
                    8C074ECB303CBA295DF3E1DC39B4B83A6DFFA3BABC65D435876678D4479B64CF
                    DA18000018A5ED329C413EA53A84F17363054BAF6B1E9EE483D51900002CBAC7
                    A6EDFFBC3A02964DD7EC92E485497E2EC98EC53530AD7E98E4C31946161F48F2
                    B1B4FD6DB5498BA86BF64D72668637761F515C030000B3E2E169FBFF5B1DC1B8
                    1956B0B4BA665592AB931C5B9D0200C0A23B206DFFB5EA085872C3D7351767F8
                    F4FDEEC53530363F48F27F73E7D0E2E369FBDB6B93B6C0F0F7C383923C36C959
                    491E581B04000033E91F933C286DBFB63A84F1F2281096DA33635401003046D7
                    27B9A63A02965CD71C95E49D491E529D0223B55392C7CCBD92E4FBE99A0F25F9
                    E8DCEBEAB4FDB7ABE2E6E99A1549EE93E4C1B9B37B8FD2260000E0B80C6792BF
                    5D1DC278B9B182A5D335F748F2B9247B55A70000B0E8FE266D7F4A75042C99AE
                    D92EC9CB93BC2CC9EAE21A98755FCE701BE647E7BEFDC7B4FD0F96FC9FDA35AB
                    93DC2FC30746EE783D30C93D96FC9F0D00006CA97F4F7278DAFE86EA10C6C98D
                    152CA597C5A8020060AC3E591D004BA66B4ECE704BC57DAB538024C9C173AF27
                    CFFD785DBAE61B49BE9EE1F6A4AFDFE5FBD764B859696D927573DFAEBDCB8FB7
                    4972AF24F7CEF0DEC5BDEFF2FD7D931C9964BB25FFB703000016C3BD339C4DBE
                    BC3A84717263054BA36BEE93E43349B6AD4E010060493C276DFF8EEA0858545D
                    B37392D727B9B43A05000000D862B724B95FDAFECBD5218CCFCAEA0046EBAA18
                    5500008CD927AA03605175CD7D333C66C0A802000000A6D37619CE2861D11956
                    B0F8BAE6D424E756670000B064D625F9E7EA0858345D736E92ABE3D11F000000
                    30ED9E98AE39A53A82F1F128101657D7AC4AF2B124C754A70000B0643E9FB63F
                    BC3A0216AC6BB649F28B495E529D020000002C9A7F4A7242DAFEF6EA10C6C38D
                    152CB667C4A8020060EC3E531D000BD6357B24797F8C2A000000606C1E98E1CC
                    12168D61058BA76B7648F2DAEA0C000096DC35D501B0205D737086477F3CA23A
                    050000005812AF49D7ACA98E603C0C2B584C3F9B64DFEA08000096DCD7AB0360
                    AB0DA38ABF4E72506D08000000B084F6CB7076098BC2B082C5315CA3FBB2EA0C
                    000096856105D3A96B0E4AF28124071497000000004BEFE5736798B06086152C
                    965726B94775040000CBE2DAEA00D8625D73608651C581D529000000C0B2B847
                    92575447300E86152C5CD7DC27C9A5D51900002C1B3756305DBA66BF78FC0700
                    0000CCA2CBE61E0B0A0B6258C162785D92D5D51100002C1BC30AA647D7AC4EF2
                    3F625401000000B3687586B34C5810C30A16A66B4E48F2D4EA0C000096CD0F93
                    7CBF3A02B6C0EB923CA43A0200000028737EBAE6F8EA08A69B61055BAF6B5624
                    B9AA3A03008065756DDA7E5D75046C96AE3933C98BAA33000000807257CD9D6D
                    C25631AC60211E93E4D4EA0800009695C780301DBA66BF24BF539D010000004C
                    84D3923CBA3A82E96558C1D6E99A5549DE509D0100C0B233AC60F20D9F40E992
                    EC5E5C020000004C8E37CC9D71C21633AC606B3D23C9FDAB2300005876D75607
                    C0667854924754470000000013E501492EAC8E603A1956B0E5BA664D92D75667
                    000050C28D154CB6E1B68AD755670000000013E9B573679DB0450C2BD81ACF4B
                    B26F75040000250C2B9874E72439A13A020000009848FB25F9D9EA08A68F6105
                    5BA66BF648F2B2EA0C0000CA185630B986E7A4FE62750600000030D15E96AED9
                    BD3A82E96258C1967A45927B5447000050E6DAEA00D884B3921C591D01000000
                    4CB45D329C79C26633AC60F375CD7D925C569D010040A9EBAB0360139E521D00
                    0000004C85E7A66B0EAE8E607A1856B0257E31C9EAEA0800004ADD5C1D001BD4
                    35DB27795C7506000000301556C7E344D90286156C9EAE3921C9F9D519000094
                    BBB53A0036E28C243B57470000000053E369E99AE3AB23980E8615DCBDAE5991
                    E4CAEA0C0000CADD92B65F571D011BF1A4EA0000000060EA5C3977160A9B6458
                    C1E6787492D3AA23000028E731204CA6E10D9033AB3300000080A9737A865B30
                    61930C2BD8B4AE5915B75500003030AC6052ED9764B7EA08000000602A5D3977
                    260A1B6558C1DD393FC9FDAB230000980886154CAA0754070000000053EB0149
                    9E5A1DC16433AC60E3BA6675922BAA330000981886154CAAA3AB0300000080A9
                    76C5DCD9286C9061059BD22639A43A020080896158C1A4726305000000B01087
                    267966750493CBB0820DEB9AED935C5E9D0100C04431AC60521D591D00000000
                    4CBDCBD335DB554730990C2BD898E724D9AF3A020080896258C1A4DABD3A0000
                    0000987AFB67382385790C2B98AF6B764CF28AEA0C0000268E6105936AE7EA00
                    00000060145E3177560AEB31AC60439E9BE45ED51100004C1CC30A264FD7AC88
                    6105000000B038F64A7259750493C7B082F575CD2E495E529D0100C04432AC60
                    12AD49B2AA3A02000000188D97CC9D99C27F32ACE0AE5E9064B7EA0800002692
                    610593C86D15000000C062BA6792E7574730590C2BB853D7EC9EE4E7AA330000
                    985886154C22B755000000008BED857367A790C4B082F5BD383EED0500C0C6AD
                    A80E800DF86E7500000000303A3B67383B85248615DCA16BF64EF233D5190000
                    4CB41DAA03609EB6BF29C94DD519000000C0E8FC4CBAE6DED5114C06C30AEEF0
                    F2246BAA23000098683B5607C046FC477500000000303A6B329CA182610549BA
                    E6C0243F5D9D0100C0C433AC60527DA73A0000000018A59F4ED71C501D413DC3
                    0A92E45549565747000030F13C0A8449E5C60A00000060296C9BE12C95196758
                    31EBBAE6B0246D7506000053C18D154CAA8F550700000000A3F5AC74CDA1D511
                    D432ACE08A24ABAA230000980A86154CAAF7550700000000A3B52AC3992A33CC
                    B0629675CDFD939C5F9D0100C0D4F0281026D58792DC501D010000008CD6D3E6
                    CE5699518615B3ED354956544700003035DC58C1646AFB5B93BCB33A03000000
                    18AD15497EA13A823A8615B3AA6B4E48F284EA0C0000A68A610593ECF5496EAC
                    8E0000000046EBDC74CDF1D511D430AC985DAFAD0E000060EA6C9BAED9A63A02
                    36A8EDBF99E4D7AA33000000805173C63AA30C2B6651D73C2CC9A3AB33000098
                    4A3B5407C026FC52922F554700000000A3F59874CDC9D5112C3FC38AD9F49AEA
                    000000A696C78130B9DAFE7B49CE4B724B750A000000305ACE5A679061C5AC19
                    6EAB38AD3A030080A9E5C60A265BDB7F3CC965D519000000C0689DEED68AD963
                    58317B5E551D0000C05473630593AFED7F33C9DBAA3300000080D172E63A630C
                    2B6649D79C98A4A9CE000060AAED5C1D009BE9D21857000000004BE38C74CD83
                    AB23583E8615B3C5720A008085DAA73A00364BDBAF4D7249923757A700000000
                    A3E4EC75861856CC8AAE393EC959D51900004CBD03AA0360B3B5FDBA242F48F2
                    FAEA1400000060741E9BAE39AE3A82E56158313B2CA60000580C86154C97615C
                    F1F2243F9F646D710D000000302ECE60678461C52CE89A63929C5D9D0100C028
                    1856307DDA7E5DDAFE97939C9EE41BD539000000C0689C93AE39BA3A82A56758
                    311B5E591D0000C068185630BDDAFE83498E4DF2C1EA1400000060349CC5CE00
                    C38AB1EB9AA3923CB13A030080D130AC60BAB5FD75491E99E4F5D529000000C0
                    289C97AE39B23A82A56558317EAF48B2A23A020080D1D8235DB34375042C48DB
                    DF96B67F5992C727F966750E00000030D55664389365C40C2BC6AC6B8E48F2D4
                    EA0C00004667FFEA0058146DFFA749EE97E4B7AA5300000080A9F6D474CDE1D5
                    112C1DC38A717B79DC560100C0E2F33810C6A3EDFF236D7F5186C7837CA93A07
                    000000984A2B339CCD3252861563D5358726B9A03A0300805132AC607CDAFE2F
                    933C20C95549D616D700000000D3E7E9E99A43AA23581A8615E3F5B224ABAA23
                    000018258F02619CDAFEC6B4FD8B933C38C93F55E70000000053655586335A46
                    C8B0628CBAE6A024CFA8CE000060B4DC58C1B8B5FDC7328C2B2E4BF2ADE21A00
                    0000607A3C335D736075048BCFB0629C5E9A649BEA08000046CBB082F16BFB1F
                    A5ED7F23C9A1495E9BE4C6E22200000060F26D93E1AC969159511DC022EB9AFD
                    937C31C9EAEA14000046EBF369FBC3AB23605975CD3E49AE4872517C48010000
                    00D8B85B931C92B6BFA63A84C5E3CDA0F179718C2A0000585A07A66BFC3727B3
                    A5EDAF4DDB3F27C90392FC69750E00000030B1B6CD7066CB88B8B1624CBA66EF
                    245F4EB25D750A0000A3774CDAFE93D51150A66B4E497255920755A700000000
                    13E7962407A7EDAFAB0E6171B8B1625C5E14A30A000096C771D50150AAED3F98
                    E4C4244FC9F03846000000803B6C97E4E7AB23583C861563D1357B25B9B83A03
                    0080996158016DBF2E6DFF0749EE9BE482249F2A2E0200000026C725E99A7B55
                    47B0380C2BC6E38549D65447000030330C2BE00E6D7F5BDAFE77931C93E4B149
                    3E545C04000000D45B93E10C971158511DC022E89ADD92FC5B929DAA53000098
                    193F4CB24BDAFEF6EA1098485DF3B0242F4D7256750A00000050E6862407A4ED
                    AFAF0E6161DC58310E97C4A8020080E5B56392C3AA236062B5FD87D2F68FCD70
                    8BC57B921821010000C0ECD939C3592E53CE8D15D3AE6BB64FF2D5249ECF0300
                    C072BB60EEF107C0DDE99AFB64B8FEF3D949B62FAE0100000096CF37921C94B6
                    BFB93A84ADE7C68AE9F7CC1855000050E3B8EA00981A6DFFA5B4FD65490E4AF2
                    9A24D7D50601000000CB64AF24CFA88E6061DC5831CDBA665592CF2639B43A05
                    008099F481B4FDE9D5113095BA667592B3935C9AE4B4E21A00000060697D21C9
                    7DD3F61E153AA5DC5831DD9E10A30A0000EA1C97AE31D686ADD1F63F4ADBFFCF
                    B971D251497E2DC9F78BAB00000080A571689273AA23D87ADE049D56C31BD81F
                    4D7242750A000033ED90B4FD97AA236014BA66A724E727B92CC931C535000000
                    C0E2BA3AC98969FB75D5216C3937564CAFD36254010040BDE3AA036034DAFE07
                    69FB77243936C94949DE9DE4D6DA2800000060913C28C9A9D5116C1DC38AE9F5
                    E2EA0000008861052CBEB65F97B6FF48DAFEC224FB2579698667B102000000D3
                    CD19EF94F2289069D4350F4CF2F1EA0C000048F29769FB475647C0E80D8F837C
                    68926726794A925D6A8300000080ADF4C0B4FD27AA23D8328615D3A86B7E37C3
                    73770100A0DA2D49EE99B6BFB13A046646D7AC49727686914513B751020000C0
                    34F9DDB4FD05D5116C19C38A69D3350727F97C9255D529000030E73169FBF757
                    47C04CEA9A7D925C9061647154710D00000070F76E4F7268DAFE2BD5216C3E9F
                    6A993E3F17A30A0000264B531D0033ABEDAF4DDB5F95E401494E48F26B49BE53
                    1B050000006CC2AA0C67BE4C1137564C93AED923C9BF2559539D0200003FE65F
                    D2F63E290F93A26BB64D7256865B2CCE4CB2BA3608000000B88B9B921C90B6FF
                    7675089BC78D15D3E5B931AA000060F21C99AED9BF3A0298D3F6B7A6EDFF57DA
                    FE9C24F7CA30B0F8B3243FAA0D03000000E6AC49725975049BCF8D15D3A26B76
                    CC705BC53DAB53000060032E4ADBFF567504B0095DB36B92C72779528647F86C
                    5B1B0400000033ED3B490E4CDBFFB03A84BBE7C68AE9F1EC1855000030B9CEA8
                    0E00EE46DB5F9FB6FF9DB4FDE332DC64F18C247F9AE4D6DA300000009849BB27
                    795675049BC78D15D3A06B5627F97C9203AB5300006023BE9B64CFB4FDEDD521
                    C016EA9A5D923C2EC34D168F8E9B2C00000060B97C25C96169FBDBAA43D83437
                    564C8727C7A8020080C9B65B92E3AB2380ADD0F6DF4BDBBF3B6D7F76869B2C2E
                    4CF2277193050000002CB583329C0533E1DC5831E9BA6645927F4A7274750A00
                    00DC8DCBD3F6AFAD8E001649D7DC23EBDF64B15D6D100000008CD227921C9BB6
                    5F571DC2C6B9B162F29D11A30A0000A6C319D501C0226AFBEFA7EDDF93B63F27
                    C34D161724F9A324B7D486010000C0A81C93A4A98E60D3DC5831E9BAE603494E
                    ADCE000080CD707B92DDD3F6DFAB0E0196D07093C56333DC64F198B8C9020000
                    0016EA0369FBD3AB23D838C38A49D6350F4EF2F7D5190000B0059E98B6FFC3EA
                    08609974CDCE597F64B17D6D100000004CAD07A7EDAFAE8E60C33C0A64B2BDB0
                    3A000000B6D093AA038065D4F637A4ED7F2F6D7F6E86C7859C9FE40F93DC5C1B
                    0600000053E7E7AB03D83837564CAAAED93FC99793ACAA4E0100802D707392BD
                    D2F6DFAF0E010A75CD4E196EB23827C9994976AE0D0200008089777B9283D3F6
                    5FAB0E613E37564CAECB62540100C0F4D93EC9B9D51140B1B6FF41DAFEF7D3F6
                    4F4DB247923392FC4692AFD786010000C0C45A95E4D2EA0836CC8D1593A86B76
                    4CF2B524BB55A70000C056F8CBB4FD23AB238009D4352B921C97E4ECB9D7D1B5
                    410000003051BE9B64BFB4FD8DD521ACCFB0621275CDC549DE5A9D0100005B69
                    5D92FDD3F63E990E6C5AD71C9CE4F11946160F8F9B1B010000E0E2B4FDDBAA23
                    589F61C5A4E99A9549FE39C97DAB53000060015E94B67F6375043045BAE69E49
                    CECC30B27874929D6A83000000A0C467931C95B65F5B1DC29D565607304F13A3
                    0A0000A6DF85D501C09469FBFF48DBBF3B6DFFA4247B641859BC2DC975B56100
                    0000B0ACEE9BE451D511ACCF8D1593A66BDE9FE48CEA0C00005804C7A4ED3F59
                    1D014CB9E166C71332DC64717692A36A8300000060C9BD3F6DFF98EA08EE6458
                    3149BAE67E49FEA53A03000016C99569FB9754470023D3358724797C8691C54F
                    C46D9C0000008CD3FDD2F69FAD8E6060583149BAE6AD492EAECE00008045F2F5
                    2407A6ED6FAF0E0146AA6B764F72568691C5194976AC0D0200008045F3D6B4FD
                    A5D5110C0C2B2645D7DC33C93549D654A70000C0227A44DAFEAFAA238019D035
                    DB2779448691C5E393EC551B040000000B726392FDD3F6FF511D82EB3227C94F
                    C5A8020080F1797A75003023DAFEE6B4FD9FA7ED9F93649F240F4DF2FA249FA9
                    0D03000080ADB243929FAC8E60E0C68A49D035AB937C29C97ED5290000B0C86E
                    48B24FDAFE07D521C00CEB9AC332DC6471769293E283260000004C876B92DC27
                    6DFFA3EA9059E78D84C9706E8C2A000018A79D933CBB3A0298716DFFF9B4FD1B
                    D3F63F9164CF244F4DF2DF927CBB360C0000003669BF244FA88EC08D1593A16B
                    3E92E421D5190000B044BE9CE4B0B4FDEDD52100EBE99A55196EB0383BC93949
                    0EA90D02000080793E92B63FA93A62D6195654EB9A1393FC5D750600002CB1F3
                    D2F6EFAD8E00D8A8AE5991E4A8DCF9C89007D506010000C07F3A316DFFD1EA88
                    59B64D7500795E750000002C83172631AC002657DBAF4BF2E9B9D7EBD235FB26
                    797C869B2C4E4BB2BAB00E000080D9F6BC24175447CC32375654EA9AFD325C8B
                    6CE00200C02C38296DFF91EA08802DD635BB24794C8691C5994976AE0D020000
                    60C6DC96E4A0B4FDD7AB4366D5CAEA801977698C2A0000981D2FAC0E00D82A6D
                    FFBDB4FDEFA7ED9F9A64CF248F4EF2D624D7D6860100003023B6C970B64C1137
                    5654E99A1D927C2DC93DAB5300006099AC4D7258DAFE4BD521008BA26B562639
                    3EC9D9196EB338AA360800008011FB4E9203D2F6375687CC22B725D4797A8C2A
                    0000982D2B333C0FF279D521008BA2EDD726B97AEEF5CA74CDA1B9736471727C
                    A005000080C5B37B920B92BCA33A6416F902BF42D7AC48F2E9244756A70000C0
                    32FB6192FDD3F6DFAD0E0158525D73AF248FCD30B468926C5F1B040000C008FC
                    739207A4EDD75587CC9A95D50133EA9131AA00006036ED98E439D511004BAEED
                    BF99B6FFADB4FDD949F648F284245D86AB5B010000606B1C95E411D511B3C88D
                    1515BAE6CF939C599D01000045AE4D7270DAFED6EA108065D735DB243929C3E3
                    42CE4972706D1000000053E67D69FBB3AA23668D61C572EB9AFB24F942FCDA03
                    0030DBDAB4FD7FAB8E0028353C2AF4FE190616672739BE360800008029B02EC9
                    2169FB2F5787CC1287FBCBAD6BDE90E4C5D519000050EC2B49EE9BB6BFA53A04
                    606274CDFE191E19F2E4242717D700000030B9DE90B67F6975C42C31AC584E5D
                    B35D926B323C5B15000066DDF3D3F66FAE8E0098485DB35F92272679528C2C00
                    000058DFB793ECE7434BCBC7B0623975CD0549DE5D9D01000013E23B19AE2DFC
                    5E7508C04433B200000060BE0BD2F6BF5B1D312B565607CC984BAA0300006082
                    EC9EE445D5110013AFEDAF49DBBF396DFFB024FB27797E92BF2DAE020000A096
                    B3E765E4C68AE5D2350F48F2C9EA0C000098303765B8B5E2BAEA1080A933DC64
                    715E869B2C4E2AAE01000060F91D9DB6FF5475C42C7063C5F2B118020080F9D6
                    2479757504C0541A6EB27853DAFEE42407247941DC64010000304B2EAE0E9815
                    6EAC580E5DB373926B93EC549D02000013E8F62447A5EDFFB53A046014BA66FF
                    244F4CF2E4240F2DAE01000060E9DC90649FB4FD0FAA43C6CE8D15CBE3821855
                    0000C0C6AC4AF2BAEA0880D168FBAFCDDD6471529243925C9EE473C555000000
                    2CBE9D339C45B3C4DC58B1D4BA6645927F4A7274750A00004CB887A6EDFFAE3A
                    02609486F7274E48726192A726D9B3360800008045F28924C7A6EDD755878C99
                    61C552EB9A93927CB83A030000A6C0DF2439D51781004BAC6B562779548691C5
                    3949B6AF0D02000060814E4ADB7FA43A62CC3C0A64E95D521D00000053E2E149
                    CEAC8E0018BDB6FF51DAFE7D69FBF393EC95A44DF2FF27316C030000984ECEA4
                    97981B2B9652D7EC91E4EB49B6AD4E01008029F1852447A7ED6FAA0E0198395D
                    B36F92F3933C3DC931C5350000006CBE5B92EC9BB6FF4E75C858B9B162693D2B
                    46150000B0250E4DF2CAEA088099D4F65F4FDBBF316DFFC02447277943926B8A
                    AB000000B87BDB65389B6689B8B162A974CDCA249F4B7248750A00004C99DB92
                    1C97B6FF547508C0CC1BDEDF3825C32D16E725B9476D100000001BF1C52487A7
                    EDD756878C9161C552E99A3392BCBF3A030000A6D4DF2739396D7F7B75080073
                    BA664D8671C573923CACB806000080F9CE48DBF7D51163E451204BE792EA0000
                    00986227C67F53034C96B6BF296DFFAEB4FD4F243932C9AF26F1FC5E000080C9
                    E1FDB425E2C68AA5D035FB27F94A0C57000060217E90E4C8B4FDD7AA4300D888
                    AED93EC91392FC5492D38A6B00000066DDDA2407A6EDAFA90E191B07FF4BE3A7
                    E2D7160000166AA7246F49D71884034CAAB6BF396DFF7B69FBD3931C9EE4CA24
                    DF2CAE02000098552B339C55B3C8BC41B9D8BA667592AF26D9BB3A05000046E2
                    BCB4FD7BAB2300D84C5DB36D92C7677833AF29AE0100009835D765B8B5E247D5
                    21636258B1D8BAE68949FE67750600008CC8BF27B95FDAFEFAEA1000B650D71C
                    9CE4A224CF8E0FA10000002C171F545A641E57B1F82EA90E00008091B97792D7
                    574700B015DAFECB69FB57263920C93949DE97645D6D140000C0E839B35E646E
                    AC584C5D734492CF56670000C0489D92B6FF9BEA080016A86B0EC87083C54549
                    F62BAE01000018AB23D2F69FAB8E180B37562CAE9FAE0E000080117B57BA66B7
                    EA080016A8EDFF2D6D7F459283939C97E4C3B541000000A3747175C098B8B162
                    B174CD7649AE4D72CFEA14000018B13FCCF08C48D7C8038C49D73C38C90B923C
                    29C9AAE21A00008031F84E927DD3F6B754878C811B2B16CFE363540100004BED
                    DC58DB038C4FDB7F346D7F7E92FB24B92AC9F78A8B000000A6DDEE491E571D31
                    1686158BE7D9D501000030237E355D73747504004B60784CC88B93EC97E46793
                    7CB1B8080000609A39C35E241E05B218BA66FF245F8D5F4F0000582E9F4D7242
                    DAFE87D521002CA1AE5995E113562F48F2F0E21A00008069B336C98169FB6BAA
                    43A69D1B2B16C7336254010000CBE9BE49FE6B7504004BACED6F4FDBFF51DAFE
                    94242724794F92DB8AAB000000A6C5CA0C67D92C9031C04275CDCA249FCFF00C
                    50000060793D2D6DFF7BD511002CA3AED937C965492E4EB25B710D0000C0A4FB
                    6292C3D3F66BAB43A6991B2B16EEE131AA0000802A6F4BD71C521D01C0326AFB
                    AFA7ED5F9E64FF249766F8C00B0000001B7648929FA88E987686150BF7ECEA00
                    000098613B27F9FD74CDB6D521002CB3B6FF61DAFEAD191E0FF5B8241F282E02
                    00009854CEB417C8A34016A26B7649725D9235D529000030E37E256DFFC2EA08
                    008A75CDC3925C91E411C52500000093E4A624F74EDB7FBF3A645AB9B162619E
                    12A30A000098043F97AEB9A03A0280626DFFA1B4FD23939C123758000000DC61
                    4D86B36DB69261C5C25C541D000000FCA7DF4CD73CB43A028009D0F67F93B63F
                    3DC9A949FEBA36060000602238DB5E008F02D95A5D73FF249FAACE000000D6F3
                    CD240F4EDB7FB53A048009D235A726F985240FFF7FECDD79B06D6941DFEFCFED
                    8166967912119B2093404489021A23EA42A38649CCA0262B1813139338C5E917
                    138DC6C41813408D1A23B21C4244C109705804504014354290C810191A106866
                    65B6E9EEDF1FFB12A61EEE3DF79CF3EEBDCFF354ED82A2EAEEFDE96B559767AF
                    EF79DFC125000000237D52F3FA7F4647EC2227561CDCDF1F1D0000007C945B55
                    4F6E996E343A04802D32AFBFD9E6F48A0756CF1EDA020000308E67DC07E4C48A
                    8358A6EB54AFAD6E393A050000B84A4FA91ED2BC5E3E3A04802DB34CA7DA0C2C
                    FE4DF580C135000000C7E94DD5C736AF978D0ED9354EAC38982FCAA8020000B6
                    D91755DF3B3A02802D348D1CC49F0000200049444154AF5736AF4FAF3EB3FABC
                    EAB9838B0000008ECB2DDB7C6FC65932AC3898478E0E000000AED5BF6899FCFF
                    EE005CB5CDC0E27F569F514DD5EF0C2E020000380EBE2F3B0057819CAD65BA5D
                    F59A8C52000060175C567D5EF3FA5BA34300D8729B2B42A63657847CDAE01A00
                    0080A37245F571CDEBEB4687EC12E380B3F777F3F7060000BBE2C2EA175AA63B
                    8D0E0160CB6D4EB0F88DEA7ED55FAFFEF7E022000080A3705EF515A323768D13
                    2BCEC6E637175E5ADD79740A000070565E527D66F3FAE6D12100EC88653ABFFA
                    07D5F754371F5C03000070985E56DDB579BD7274C8AE70F2C2D9F98C8C2A0000
                    6017DDB5FA8D96E963468700B023E6F5F2E6F5BFB6F92EE831D5E5838B000000
                    0ECB27560F181DB14B0C2BCECE23470700000007769FEAA92DD30D468700B043
                    E6F56DCDEBD755F7AA9E363A070000E09078F67D165C0572A696E946D51BAAEB
                    8F4E010000CEC9D3AA2F6E5EDF373A04801DB3B926F68BAA4755771A5C030000
                    702EDE55DDB6797DC7E8905DE0C48A33F7A519550000C03EF8BCEA675BA60B47
                    8700B063E6F5CAE6F5C9D53DAA6FA9DE39B8080000E0A06E503D6274C4AE30AC
                    38735F393A00000038340FA91ED732F9990880B337AFEF6B5EBFAFCDBDC4CBE0
                    1A00008083F20CFC0CB90AE44C2CD35DAA978CCE0000000EDD8F56FFA479BD72
                    7408003B6C99EE5BFD40F5E9A353000000CED25D9AD7978D8ED8767E3BEBCC7C
                    D9E8000000E0487C75F57D2D93D139000737AFBF5F3DA0FA8AEA75836B000000
                    CE8667E167C09787D766F305EB9F54178F4E0100008ECCBF6E5EBF7B7404007B
                    60996E587D5BF58DD545836B000000AECD2BAABFE444D76BE6C48A6BF7E91955
                    0000C0BEFBAE96E95B464700B007E6F59DCDEBBFACEE5EFDC2E81C0000806B71
                    71F569A323B69D61C5B5FBF2D1010000C0B1F8DE96E97B5C0B02C0A198D75734
                    AF0FAF1E54BD7A740E0000C035F04CFC5AF8C2F09A2CD385D5EBAB9B8F4E0100
                    008ECD0F555FDBBC5E313A04803DB14C37AABEAFFAEAD12900000057E1CDD5ED
                    9AD7CB46876C2B27565CB307655401000027CD3FAD1ED7325D303A04803D31AF
                    EF685EFF71F5B9D525A3730000003EC22DAA6974C43633ACB8665F363A000000
                    18E2EF563FD7325D343A04803D32AF4FAFEE59FDC8E8140000808FE0D9F83570
                    15C8D5D91CD1786975BDD1290000C0304FAB1EDABCBE6B7408007B66991E58FD
                    44F5F1A353000000AAF754B76E5EDF313A641B39B1E2EA3D34A30A000038E93E
                    AF5A5BA69B8C0E0160CFCCEB33DA9C5EF1C3A353000000DA3C1B7FC8E8886D65
                    5871F5BE7C74000000B015EE5F3DB365BAD5E81000F6CCBCBEA379FD9AEA81D5
                    AB06D700000078467E355C05725596E9B6D56B333C0100003EE865D5D4BC5E32
                    3A04803DB44C37AE7EA4FA3BA35300008013EB8AEA639BD7378C0ED936860357
                    ED6FE5EF060000F8709F583DAF65FAB4D12100ECA179FDF336BF1D3657EF1A1B
                    0300009C50E7B57956CE47301EB86A8E38010000AECAADABDF6C99BE74740800
                    7B685EAF6C5E7FB2FA94EAF9A37300008013C9B3F2ABE02A908FB44C77ABFE78
                    74060000B0F5FE75F56F9BD72B478700B08796E9A2EA3F545F3B3A0500003871
                    EED6BCBE6474C4367162C547FBB2D1010000C04EF8AEEAA75BA6EB8E0E01600F
                    CDEBFB9AD7AFABBEB87AF3E81C0000E044F1CCFC2338B1E2432DD3A9EA15D51D
                    0797000000BBE3B9D5439BD7378E0E01604F2DD3EDAA9FA93E7B740A00007022
                    BCB2BA93935A3FC889151FEEFE195500000067E7FED5F35AA67B8C0E01604FCD
                    EBEBAACFABFE6575F9E01A000060FF7D4275BFD111DBC4B0E2C339D204000038
                    883B56CF6D991E343A04803D35AF9737AFFFAEFA9CEA4DA373000080BDE7D9F9
                    877015C8072CD375AAD757371B9D020000ECAC2BAA6FA87EC05189001C9965BA
                    43F50BD5A78C4E010000F6D65BAADB36AF978D0ED9064EACF8A0076554010000
                    9C9BF3AA47574F68996E3C3A06803D35AFAFAE3EB3FAE9D1290000C0DEBA799B
                    67E86458F1A1BE7C74000000B0371E51FD41CB74AFD12100ECA9797D4FF5F7AA
                    AFAB2E1F5C030000EC27CFD04F73154875FA37C92EADAE3B3A050000D82BEFAD
                    FE49F3FAB8D12100ECB165FAECEAE7DBFC46190000C061796F75EBE6F5CF4787
                    8CE6C48A8D8765540100001CBEEB563FD1323DB665BADEE81800F6D4BC3EB3FA
                    D4EA05A353000080BD72DDEAA1A323B68161C586234C000080A3F4C8EA775BA6
                    3B8F0E01604FCDEBABAA07548F1F5C020000EC17CFD27315482DD36DAAD7E5EF
                    020000387AEFA81ED9BC3E717408007B6A994E55DF587D5FBEEF020000CEDD15
                    D5C736AF6F181D3292132BEAE1F921130000381E37AA7EBE657A4CCB74D1E818
                    00F6D0BC5ED9BC7E7FF588EA7DA3730000809D775EF5B0D111A319566C7EC804
                    0000384EFFBCFABD96E95EA34300D853F3FAA4EA73ABB78D4E01000076DE897F
                    A67EB24F6A700D08000030D665D5BFAABEBF79BD7C740C007B6899EE56FD7A75
                    87D1290000C0CEBAA2BA5DF37AE9E890514EFA89150FCBA802000018E7C2EA7B
                    ABDF6A992E1E1D03C01E9AD71757F7ABFEF7E814000060679DF8EB404EFAB0E2
                    4B4607000000540FA85ED8327D55CB64FC0DC0E19AD7D7557FB5FA9FA3530000
                    809D75A29FAD9FDC2FEC96E956D5EB332E010000B6CB53AAAF6A5EDF303A0480
                    3DB34CD7A91E5B7DF9E814000060E75C51DDB6797DE3E890114EF2A8E0619DEC
                    7F7E0000603B7D51F5A296E9441FAF08C01198D7BFA8FE6E9B6BA8000000CEC6
                    79D54347478C729287058F181D00000070356E5E3DA965FAE996E916A36300D8
                    23F37A65F3FA6DD5D754578ECE01000076CA897DC67E32AF02710D080000B03B
                    DE5C7D63F5D3CDAB0760001C9E65FAF2EA27F31D1900007066AEA86ED3BCBE69
                    74C8713BA93F343DB493FBCF0E0000EC965BB479E8F5B496E9CEA36300D823F3
                    FA33D557B4F972140000E0DA9CD8EB404EEAB8E04B46070000009CA5CFA9FEA8
                    65FAF696E93AA36300D813F3FAF8EAEF54978F4E01000076C2897CD67EF2AE02
                    D9DC4FFC86EAFCD12900000007F4E2EA1F36AFCF191D02C09E58A687573F5B5D
                    303A050000D86A97B7B90EE4CDA3438ED3493CB1E2A11955000000BBED6ED5B3
                    5BA61F6B996E3A3A06803D30AF4FAABEB47AFFE814000060AB9D5F3D6474C471
                    3B89C38A478C0E00000038245F55BDA465FAB296E9E49D4808C0E19AD75FAC1E
                    5E5D363A050000D86A27EE99FBC9FAE2CD35200000C0FEFABDEA1B9AD7DF1E1D
                    02C08E5BA62FAC7EA1BACEE8140000602B5D5EDDBA797DCBE890E372D24EAC78
                    4846150000C07EFA2BD5735AA627B64C771A1D03C00E9BD7A7560FAEDE373A05
                    0000D84A27EE3A909336ACF892D10100000047ECE1D58B5BA647B54C371B1D03
                    C08E9AD75FAFFE46F517A353000080AD74A29EBD9F9CAB40365F285E5A5D303A
                    050000E098BCBDFAEEEABF34AF7EEB1880B3B74C8FA89ED049FA1E1100003813
                    EF6F731DC85B47871C87937462C54332AA0000004E969B54FFA9FAE396E94B5A
                    260FC500383BF3FAF3D53F1D9D0100006C9D0BDA5C2178229CA461C523460700
                    00000C7271F5F3D5B35BA64F1B1D03C08E99D71F6E7302120000C0873A31CFE0
                    4FC66F2BB906040000E0433DA1FAB6E6F595A34300D8119B538FFE6BF555A353
                    000080AD71599BEB40DE363AE4A89D94132B1E9C51050000C007FCCDEA252DD3
                    F7B54C37191D03C00E98D72BAB7F52FDD2E8140000606B5CD809B90EE4A40C2B
                    BE6474000000C096B94EF54DD59FB44CFFAC65BA707410005B6E5EDF5FFD9DEA
                    D9A353000080AD71229EC5EFFF55209BDFBE7A639BB50C00000057ED65D5B757
                    4F6A5EAF181D03C016DB7CDFF6ACEA9EA353000080E12EAB6ED5BCBE7D74C851
                    3A0927563C38A30A0000806BF389D5CF552F6A99BEAC65729D2200576DF385E9
                    E757978C4E01000086BBB0FA1BA3238EDA4918563C6474000000C00EB95BF533
                    D58B5BA647BA220480AB34AFAFAB1E54BD65740A000030DCDE3F93DFEFAB4096
                    E97AD59BABEB8F4E010000D8519754DF5B3DAE797DDFE81800B6CC327D76F5B4
                    EAFCD1290000C030EFAE6EDEBCBE7774C851D9F7132B1E9851050000C0B9F8F8
                    EA47AA57B44C5FDB32F9190B800F9AD76756DF383A03000018EAFA6D9ECDEFAD
                    7D1F563C7874000000C09EB85DF5E8EA952DD337B74C371A1D04C0D6F881EAA7
                    464700000043EDF5B3F9FDBD0A6499CEABFEB4BACDE8140000803DF4D6EA51D5
                    0F36AF7F363A0680C13657F23EABFAD4D1290000C010AFAF6EDFBC5E313AE428
                    ECF389159F9A51050000C051B959F5DDD5252DD377B74C371F1D04C040F3FA9E
                    EA61D51B47A700000043DCB6FA94D11147659F87157F6374000000C009F031D5
                    B757AF6A99FE43CB74EBD141000C32AFAFA91E51BD7F740A000030C4DE3EA3DF
                    E761C55EDFE1020000B0656E587D73F5CA96E9312DD3C5A3830018605E9F557D
                    EDE80C00006088BD7D467F6A74C091D87C81F7F2D11900000027D895D593ABC7
                    54CF6C5EAF1CDC03C07159A653D58F578F1C9D0200001CBB8B9BD7578E8E386C
                    FB7A62C5178F0E00000038E14EB539FEF1E9D51FB54CFFB065BAFEE026008EC3
                    664CF735D5F346A7000000C76E2F9FD5EFEBB0626FEF6E010000D841F7A8FE6B
                    F5DA96E93FB44C77181D04C0119BD7F7560FABDE383A05000038567BF9AC7EFF
                    AE0259A69B566FAACE1F9D020000C055BAA2FAC536D7843CC73521007B6C99FE
                    7AF5D4D1190000C0B1797F75CBE6F5EDA3430ED33E9E58F10519550000006CB3
                    F3AA8757CFAAFEB065FAFB2DD3750737017014E6F557AB1F1E9D0100001C9B0B
                    DA3CB3DF2BFB38ACD8CBA345000000F6D45FAE7EA27A4DCBF46F5BA6DB8D0E02
                    E0D07D53F592D1110000C0B1D9BB67F6FB7515C8325DA7CD3520371E9D020000
                    C081BCBF7A629B6B429EE79A10803DB14CF7A97EB7BA70740A000070E4FEACBA
                    55F3FA17A3430ECBBE9D58F1591955000000ECB20BAABF55FD4EF5BC96E9CB5D
                    1302B007E6F50FAB7F353A03000038161F53FDD5D1118769DF86157B77A40800
                    00C00976DFEAA7ABD7B74C3FD4327DF2E82000CEC9F757CF1A1D0100001C8BBD
                    7A76BF3F57812CD3A9EA55D51D06970000007074FEB07A6CF5F8E6F5EDA36300
                    384BCB7487EA856D7E830D0000D85F97549FB02FD7BCEED3B0E2DED50B466700
                    0000702CDE5B3DA9FAF1EAB7F6E5877480136199FE76F5F8D1190000C091BB77
                    F3FAC2D11187619FAE02D9ABA344000000B846D7ADBEAC7A66F57F5BA6FFAF65
                    BADDE02600CEC4BCFE8F0C2B0000E024D89B67F8FB34AC78F0E80000000086B8
                    53F53DD56B5AA627B74C0F69992E1C1D05C035FA9AEAD5A32300008023B537CF
                    F0F7E32A9065BA7DF59AD1190000006C8D4BAB9FAA1EDBBCBE74740C00576199
                    1E54FDFAE80C0000E048DDBE79FDD3D111E76A5F4EACF8A2D1010000006C955B
                    57DF54BDA4657A76CB34B74C37181D05C08798D7DFA89E383A03000038527BF1
                    2C7F5F86157B73370B00000087EE33AAC755AF6F991ED7327D6ECB74FEE82800
                    AAFABAEA9DA32300008023B317CFF277FF2A9065BA51F5E6EA3AA353000000D8
                    196FA87EB67A7CF507CDEB95837B004EAE65FA86EA3F8DCE0000008EC4FBAA5B
                    34AF3B3DA8DE87132BA68C2A000000383BB769F35BD2BF57BDB465FACE96E9CE
                    839B004EAA1FA85E383A020000381217B579A6BFD3F66158F105A303000000D8
                    6977AEBEA37A59CBF4FB2DD3D7B54CB71D1D057062CCEBFBAB7F323A03000038
                    323BFF4C7FB7AF0259A653D56BAA8F1D9D020000C05EB9A27A469BAB427EA179
                    FDB3C13D00FB6F997EBCFACAD1190000C0A17B6D75875DBE8A75D74FACB84746
                    150000001CBEF3AACFAD7EA2BAB4657A62CBF4D096E9A2C15D00FBEC5BABB78E
                    8E0000000EDDEDABBB8F8E3817BB3EAC78D0E800000000F6DE45D5C3AB5F6833
                    B2F8F196E9B35BA6F3077701EC97797D73F5CDA33300008023B1D3CFF6777D58
                    F1F9A30300000038513EA6CD31F5CFA85EDB32FD70CBF4C096E982C15D00FBE2
                    71D5EF8C8E0000000EDD4E3FDB3F353AE0C096E9066D8E06BCCEE8140000004E
                    BC3757BF583DA97A46F37AD9E01E80DDB54CF7AAFEB07232100000EC8FF75537
                    6B5EDF3D3AE42076F9C48ACFCAA802000080ED708BEAABAA5F6F735DC8E35AA6
                    2F6C992E1ADC05B07BE6F585D563476700000087EAA236CFF877D22E0F2B76FA
                    A810000000F6D64DABB97A4AF5C696E9675AA687B44CD71B9B05B053BEBBCD6F
                    B4010000FB63679FF1EFF255202FAD3E7174060000009CA177554FAD9E58FD6A
                    F3FAAEC13D00DB6D99FE73F5F5A33300008043F3D2E6F5AEA3230E62378715CB
                    7471F5F2D1190000007040EFA97EADCDC8E2A9CDEB9F0FEE01D83ECB74ABEA15
                    D50D46A700000087E6E2E6F595A323CED6AE5E05F2A0D101000000700EAE573D
                    AC7A7CF5A696E9A92DD357B74C1F3BB80B607BCCEB1BAB478DCE0000000ED54E
                    3EEBDFD5132B7EA97AF0E80C0000003802FFAB7A72F52BD50B9AD72B07F7008C
                    B34C37A95E59DD64740A000070287EA9797DE8E888B3B57BC38A65BA4EF596EA
                    86A353000000E088BDB6CDC8E2C9D5339BD7F70EEE01387ECBF4ADD5BF1F9D01
                    00001C8A7754B7685EFF6274C8D9D8C5AB40EE9F510500000027C3EDAB7F5CFD
                    6AF5E696E9492DD3DC32DD727017C071FAC1EAD2D1110000C0A1B85175BFD111
                    676B1787153B79E70A0000009CA31B540FAB1E575DDA32FD76CBF42D2DD3DD5B
                    A6DD3B9112E04CCDEBBBAAEF199D0100001C9A9D7BE6BF7B5FBC2CD3F3ABBF3C
                    3A03000000B6C8CBAB5F697365C8739AD7CB06F7001CAE65BAA87A597587D129
                    0000C0397B7EF37A9FD1116763B78615CB749BEAF5A333000000608BBDBDFAB5
                    36438B5F6F5EDF3EB807E0702CD323ABC78ECE0000000EC56D9AD79DB9F26FD7
                    AE02994607000000C096BB49F5B7ABFF51BDA9657A7ACBF4B52DD3C583BB00CE
                    D54F557F323A02000038143BF5EC7FD74EAC787C9B2F8700000080B3F77FDA5C
                    17F22BD5EF35AF970FEE01383BCBF435D50F8DCE000000CED9E39BD72F1B1D71
                    A6766758B14CE7579756371F9D020000007BE04DD553DA8C2C9ED6BCBE6B700F
                    C0B55BA61B56AFAD3E66740A0000704EDE5CDDBA79BD6274C899D8A5AB40EE93
                    51050000001C965B567FBFFAC5EA2D2DD3535BA6AF6E993E767017C0D59BD777
                    568F1D9D0100009CB35BB4D900EC840B46079C85CF1F1D000000007BEAA2EAAF
                    9F7EFD48CBF4FCEAA9A75FBFEFCA1060CBFC50F575EDD62F8D0100001FEDF3AB
                    3F181D712676E92A90E7540F189D0100000027CC9BAA5F6B33B2589BD7B70FEE
                    01A865FA85EAA1A33300008073F29CE6F53347479C89DD18562CD34DDBDCB162
                    850E000000E3BCBF7A76F54BD52F37AF970CEE014EAA65FAACEA374767000000
                    E7E4F2EA16BBF04B1CBB7215C8E7645401000000A35D507DF6E9D7635AA6FF5D
                    FDF2E9D7F39BD72B47C60127CAB3AAFF5DDD7B740800007060E7B7D9023C6974
                    C8B5D995B1C2834607000000001FE5DED5BFAEFE577549CBF4832DD3E7B64C17
                    0EEE02F6DD66C8F5E8D1190000C039DB892DC0F65F05B24CA7AA575577185C02
                    0000009C993FAB7EB5CD4916BFD6BCFEF9E01E601F2DD375AB5757B71C9D0200
                    001CD825CDEB1D47475C9B5D18565C5CBD7C740600000070209755CF6C33B2F8
                    95E6F5B5837B807DB24CDF55FDABD1190000C039B9B8797DE5E8886B72C1E880
                    33F0C0D101000000C0815D584DA75FFFA565FA8336238B5FAE5E74FA387F8083
                    FA91EA5BDBFCBB060000D84D0FAC1E3B3AE29A9C373AE00C7CF6E800000000E0
                    D07C6AF5DDD50BAB97B74C8F6A99FE5ACBB40BBFFC016C9B797D7DF584D11900
                    00C039D9FA4DC0765F05B24CA7AA3FAD6E3B3A0500000038526FAD9ED2E6248B
                    B5797DE7E01E60572CD303ABA78FCE0000000EEC75D5EDB7F954CB6DFF6D904F
                    CCA8020000004E829B557FF7F4EB7D2DD3FF6C33B27872F3FA86A165C0B6FBAD
                    EAF5F91E11000076D5EDAA3B572F1B1D7275B6FD2A90AD3FF203000000387417
                    555F58FD58F5BA96E9B92DD3B7B44C771DDC056CA379BDBCFAD9D1190000C039
                    D9EA6DC0B69F58B1D57F79000000C0913B55DDEFF4EB7B5BA697B539C9E297AB
                    DF3DFD4015E0F1D5D78F8E0000000EECB3ABFF3A3AE2EA9C1A1D70B596E95475
                    6975CBD129000000C0567A63F5E4EAE7AB6734AF970DEE0146D97C97F8D236C7
                    07030000BBE78DD56D9AD72B47875C956DBE0AE41E19550000000057EF56D557
                    56BF5EBDBE65FAD196E9B35BA6F3077701C76DF3E5EBE347670000000776ABEA
                    EEA323AECE360F2B5C03020000009CA99B57FFA87A46F5DA96E9075AA607B44C
                    DBFCDD0770B80C2B000060B76DED46609BBF5CD8DABF3400000060ABDDA6FA67
                    D573AA4B5AA6EF6F99EE7BFAAA00605FCDEBCBAA3F189D0100001CD8D66E04B6
                    F30B85CD6F93BCA9BAD9E814000000606FBCA27AC2E9D70BB7F5DE56E01C2CD3
                    D757FF797406000070206FAD6ED9BC5E313AE4236DEB8915F7CAA80200000038
                    5C1757DF56BDA07A71CBF49D2DD3DD06370187EB0995D1140000ECA69B55F71C
                    1D7155B67558B1B5477C000000007BE12ED577547FDC32BDB065FAFF5AA63B8D
                    8E02CED1BCBEAE7AE6E80C0000E0C0B6722BB0ADC38A078E0E000000004E8C7B
                    56DF53FD49CBF4072DD3BF6899EE303A0A38B0C78F0E0000000E6C2BB702A746
                    077C9465BAA07A4B75E3D129000000C089F6DC36D70AFC7CF3FAFAD131C0195A
                    A69B546FAC2E1C9D0200009CB53FAB6EDEBC5E3E3AE4436DE389159F9C510500
                    000030DEFDABC7547FDA323DB365FAEA96E996A3A3806B31AF6F6F338C020000
                    76CFC7B4D90C6C956D1C566CE59D29000000C08975AAFA6BD58F54AF6F997EA3
                    657A64CB74D3B159C03578DAE8000000E0C0B66E3360580100000070E6CEAFA6
                    EAB1D5A52DD32FB74C0F6E995C3900DB651D1D0000001CD8D66D064E8D0EF830
                    9B2F21DE56DD60740A000000C059B8B4FAC9EA279AD7978E8E81136F99CEAFDE
                    54395906000076CF3BAB9B35AF978D0EF9806D3BB1E25333AA0000000076CFAD
                    AB6FAE5ED2323DBB659A5B26DF71C028F37A79F53F47670000000772C3EA5346
                    477CA86D1B563C707400000000C039FA8CEA71D51B5AA6FFD6327D7ACBB45DA7
                    86C2C9E03A100000D85D5BB51DD8B661C5D6DD9502000000704037ACFE41F53B
                    D58B5AA66F68996E39B8094E92A78D0E0000000E6CABB603DBF3DB12CB7451F5
                    F6EABAA353000000008EC865D5AF543F563DAD79BD72700FECB7657A69F589A3
                    33000080B3F69EEAA6CDEBFB4687D4769D58F169195500000000FBEDC2EAE1D5
                    6F547FDC32FDE396E906839B609F39B502000076D3F5AABF323AE203B66958B1
                    554779000000001CB1BB563F5CBDB665FAFE96E98E837B601FADA30300008003
                    DB9A0DC1360D2B3E6B7400000000C00037A9BEB17A79CBF48B2DD35F6B99B6E7
                    FA56D86DBF59BD7F7404000070205BB321D88E1FD297E9C2EAEDD5F547A70000
                    00006C8117563F503DBE797DCFE818D869CBF4ECEA33466700000067ED5DD54D
                    9AD7E163E96D39B1E25E1955000000007CC0BDAA1FAF5ED332FDBB96E9F6A383
                    6087B90E04000076D30DDAFC7C3CDCB60C2B1E303A00000000600BDDBCFAB6EA
                    552DD3D232DD797410ECA0678D0E0000000E6C2BB604861500000000DBEFFCEA
                    EF552F69997EAA65BACBE820D8212F181D0000001CD8566C09B6655871FFD101
                    000000003BE0BCEA2BAA17B74C8F6F99EE3E3A08B6DEBCFE59F527A333000080
                    03D98A2DC1F861C532DDA1724F28000000C0993B55FDEDEA452DD3135AA64F1A
                    1D045BEE0F470700000007F2712DD3C78D8E183FACD892A33B0000000076D0A9
                    EA4BAB3F6A999ED832DD7B74106C29C30A0000D85DC33705DB30ACD88AA33B00
                    00000076DCC3AB17B44CBFD832FDE5D131B0650C2B000060770DDF146CC3B062
                    F8BA04000000608F3CA4FAC396E9BFB54CB71A1D035BE2F9A303000080031BBE
                    293835F4D397E946D5DBDB8E8107000000C0BEF9F3EABBAA1F6C5EFF62740C0C
                    B54C975477189D0100009CB5CBAB9B34AFEF1C15307AD0F0695BD000000000B0
                    AF6E5C7D7FF5A296E98B5AA6B1BF640363B90E04000076D3F96DB605C38C1E35
                    0CBF0B05000000E004B873F5E4EAD75AA6BB8D8E81415C07020000BB6BE8B660
                    F4B062F85D280000000027C883AA3F6A991ED332DD74740C1C3327560000C0EE
                    1ABA2D1877FCE3329D5FBDADBAD1B0060000008093EB2DD5B7573FD6BC5E313A
                    068EDC32DDAEFAD3D1190000C081FC7975B3E6F5F2111F3EF2C48A7B64540100
                    000030CACDAB1FA99ED1327DC2E8183806AFAF2E1D1D0100001CC88DABBB8FFA
                    F091C30AD780000000008CF7596DAE07F9EA9669DCE9A670D4E6F5CA5C070200
                    00BB6CD8C6C0B002000000801BB439BDE2375AA68F1B1D0347E88F4607000000
                    0776228715F71FF8D9000000007CB4CFAB5ED4323DD2E915ECA9578D0E000000
                    0E6CD8C660CCB062996E5BB9BB1300000060FBDCB87A6CF5E496E9E6A363E090
                    BD7A74000000706017B74CB719F1C1A34EAC700D08000000C076FBC2EA0F5AA6
                    7B8F0E814374C9E8000000E09C0CD91A1856000000007075EE58FD4ECBF43747
                    87C02131AC000080DD76A28615C3EE3E01000000E0AC5CAFFAD996E97B5BA6F3
                    47C7C03999D777546F1B9D0100001CD890ADC1F10F2B96E9FAD57D8EFD730100
                    00003817DF523DB565BAD9E81038474EAD000080DD759F96E97AC7FDA1234EAC
                    B86F75C180CF05000000E0DC3CA87A76CB74ABD121700E0C2B000060775DD866
                    7370AC460C2B5C0302000000B0BBEE5E3DC3B8821D6658010000BBEDD8370723
                    86150F18F099000000001C9E7B645CC1EE32AC000080DD76EC9B83E31D562CD3
                    A9EA7EC7FA99000000001C857B544F37AE600719560000C06EBBFFE9EDC1B139
                    EE132B2EAE6E76CC9F09000000C0D1F8A46A6D99AE3F3A04CE8261050000ECB6
                    9B559F709C1F78DCC38A4F3DE6CF03000000E068DDBBFA81D11170160C2B0000
                    60F71DEBF6E0B88715F73DE6CF03000000E0E87D65CBF415A323E00CBDB97ACF
                    E8080000E09C1CEBF6C08915000000001C861F6D99EE363A02AED5BC5E99532B
                    000060D7EDE98915CB745EF529C7F679000000001CA7EB573FDB329D3F3A04CE
                    C01B4607000000E7E4534E6F108EC5719E587197EA86C7F879000000001CAF7B
                    555F3E3A02CEC03B4607000000E7E446D5271ED7871DE7B0C2352000000000FB
                    EFDFB44C178D8E806BF1CED1010000C0393BB60D8261050000000087E9E3ABAF
                    1A1D01D7C289150000B0FB0C2B00000000D859FFB265BA7074045C03C30A0000
                    D87D7B36AC58A60BAA4F3E96CF0200000060B4DB547F6D74045C0357810000C0
                    EEBBCFE92DC2913BAE132BEE5E5DEF983E0B00000080DFF9C7FE000020004944
                    4154F1BE6474005C0327560000C0EEBB5E75B7E3F8A0E31A56B80604000000E0
                    6479D871FDE6101C80132B0000603F1CCB16E1B88615F73DA6CF01000000603B
                    DCA2FAF4D11170359C58010000FBE158B6084EAC00000000E0A8DC7974005C0D
                    C30A0000D80F7B7262C5325D54DDFBC83F07000000806D73C7D10170355C0502
                    0000FBE1DE2DD3758EFA438EE3C48A4FAA2E3C86CF0100000060BB7CFCE800B8
                    1A4EAC000080FD709D369B8423751CC38A63B9D30400000080AD73C7D1017035
                    0C2B0000607F1CF926E1388615C772A709000000005BC789156C2B57810000C0
                    FE38F24D8261050000000047E5F62DD305A323E02A38B1020000F6C78E0F2B96
                    E9FA1DC37D26000000006CA50BAADB8D8E80ABF0AED1010000C0A1B967CB74BD
                    A3FC80A33EB1E2DED5F947FC19000000006C2FD781B08D4E8D0E0000000ECDF9
                    6DB60947E6A88715AE010100000038D92E1A1D0057E1C2D1010000C0A13AD26D
                    8261050000000047E93DA303E02A5C303A00000038543B3DACB8EF11BF3F0000
                    0000DBEDBDA303E02A38B1020000F6CB916E138E6E58B14C37AAEE7A64EF0F00
                    0000C02E30AC601B19560000C07EB95BCB74C3A37AF3A33CB1E293AB5347F8FE
                    000000006C3FC30AB69161050000EC97536D360A47E2288715AE0101000000C0
                    B0826D74C1E8000000E0D01DD946E12887159F7284EF0D000000C06E30AC601B
                    39B1020000F6CF916D148E725871AF237C6F00000000B6DF95D53B4747C05530
                    AC000080FD73641B85A319562CD345D55D8FE4BD01000000D8159734AFEF1B1D
                    0157C1B0020000F6CF5D4F6F150EDD519D5871B7EAFC237A6F0000000076C34B
                    4707C0D5B8607400000070E82EE8880E8038AA61856B400000000030AC605B39
                    B1020000F6D3916C150C2B00000000382A2F191D0057C3B0020000F693610500
                    0000003BC589156C2BC30A0000D84F47B25538AABB040D2B00008093ECFDD5AB
                    AB3FADDE53BDB77ADF55FCE7E5D58DAB9B7DC4EBA6D5C71C7B35C0E133AC605B
                    1DD5F7A20000C0583B32AC58A65B57B73EF4F7050000D82EEFAA5E50BDA27AE5
                    47BCFEB479BDFC9CDE7D992E6833B2B873F5491FF2BA6775F3737A6F80E3F1DA
                    EA75A323E06A5C677400000070246ED332DDAA797DE361BEE9512CB3EF7904EF
                    09000030DAABABE756BF7DFA3F5FD8BCBEFFC83E6DF3DE6F3CFDFAEDFFF7BF2F
                    D3A9EA56D53DDAFCFC75FFEAF3DA9C7201B04D9EDCBC5E393A02AEC6CD460700
                    000047E69ED5D30FF30D8F6258E11A100000601FBCB6FAE5EA59D5739BD7D70E
                    EED9D83CA4BCF4F4EB19D5635AA6F3ABFB560FAA3EBFFA2BD579C31A01369E3C
                    3A00AEC1AD460700000047E65E19560000001C99D7564FAC7EAE7A5EF37AC5E0
                    9E33B3B976E4774FBFFE4DCB74B3EA73DA0C2DBEB0BACDC03AE0647A77F5CCD1
                    11700D0C2B0000607F1DFA66C155200000C049F79A36638A9F6F97C614D7645E
                    DFDAE69FE7E75BA6F3AA07545F5A3DBCBAEDC834E0C4785AF3FADED111700D0C
                    2B0000607F1DFA66E1D4A1BEDB325D50BDB3BAE850DF170000E0F03DA57A54F5
                    9B7B31A638134616C0F1F907CDEB634747C0D55AA65FADBE60740600007024DE
                    5BDDA8797DFF61BDE1619F5871E78C2A000080EDF5EE6AA91ED3BCBE6C70CBF1
                    DB0C489E5D3DBB65FADA8C2C80A3F1AEEA174747C0B57062050000ECAFEB567F
                    A97AC961BDE1610F2B0EFDAE1200008043F0A7D50F56FFEDF435195CF5C8E211
                    D5976464019C9B1FF1EF5A768061050000ECB77B655801000070465E537D7BF5
                    3F9AD7CB46C76CAD0F1F597C5D4616C0C1FD45F59F4747C0355AA653D5AD4767
                    00000047EA5ED5CF1DD69B1956000000FBE89DD5BFAB1EDDBCBE6774CC4E31B2
                    00CECD4F34AFAF1F1D01D7E2C6D575464700000047EA50B70B86150000C03EB9
                    A2FA6FD57734AF978E8ED9794616C0D9B9BCFA8FA323E00CB806040000F6DFA1
                    6E174E1DDA3B2DD34DAAB71DDAFB0100009C9D5FAFBEA9797DD1E890BDB74CE7
                    6564017CB49F6A5EFFDEE808B856CBF480EA39A333000080237793E6F5CF0EE3
                    8D0EF3C48A7B1EE27B0100009CA93754FFB0797DF2E89013C34916C047BBB4FA
                    17A323E00C39B10200004E867B7648A3EAC31C56B806040000386EBF50FDA3E6
                    F5CDA3434EAC8F1E59DCBFFAD28C2CE0A4F9AAE6F54DA323E00C19560000C0C9
                    70AF0C2B00008013EC1DD53FAD7EBA79BD72740CA76D4616CFA99EF321238B0F
                    9C6471BB9169C091FA09A706B1630C2B0000E06438B40D8361050000B06B7EAB
                    FA7BCDEB25A343B8061F3EB2F8FAEA7E7DF0240B230BD81F97545F3F3A02CED2
                    AD4707000000C7E2D0360CA70EE55D96E9BCEACFAA1B1ECAFB0100007CB4CBAA
                    6FAB1E75FAA13DBB68F3F3E3FDFAE049161F3B3608380797579FDBBCFEE6E810
                    382BCBF44BD583476700000047EE1DD54D0EE3BBC4C33AB1E28E195500000047
                    E7ADD5439BD7678D0EE11C6D7E90FDEDEAB75BA66FA83EBD0F9E64616401BBE5
                    2B8D2AD85177191D0000001C8B1B551F5FBDF25CDFE8B08615AE010100008ECA
                    4BAB2F6A5EFF647408876C33B2786EF5DC0F19597CE0248BDB8F4C03AED5D737
                    AF3F393A02CEDA325D58FDA5D1190000C0B1B9578730AC38EF1042CAB0020000
                    381A4FAFEE67547102CCEB15CDEB739BD7AF6FF39B04F7AF1E55BD666C187015
                    FE6DF3FAE8D1117040177778BF6C0600006CBF43D93238B1020000D8563F56FD
                    D3E6F5B2D1211CB3CD4916BF53FD4ECBF42FAABFD207AF0BF9B89169403F5CFD
                    EBD111700EEE3A3A0000003856F73E8C3739AC61C5DD0FE97D000000AEACBEB1
                    7A74F37AE5E81806DB8C2C7EB7FADD0F19593CE2F4CBC8028ED78F56FFCCBF9B
                    D9718615000070B2DCED30DEE4D439BFC3325D50BDBBBAF09CDF0B000038E9AE
                    ACE6E6F5A74687B0E596E9541F7E92C51DC606C15EBBA2FABAEA878C2AD879CB
                    F4B86A1E9D0100001C9BCBAAEB37AFEF3F9737398C132B3E21A30A0000E0707C
                    9551056764F370F779D5F3AEE2240B230B383C7F5EFDCDE6F5D74787C0217162
                    0500009C2C175677ACFEE45CDEE43086157E180100000EC3D734AF8F1D1DC10E
                    FAF091C53755F7ED83238B8F1F99063BEE15D51737AF7F3C3A040EC5E6B423DF
                    650200C0C973D70C2B0000803DF0F5CDEB0F8F8E600F6C4616BF57FD5ECBF4CD
                    D5A7B6B92EC4C802CECED3ABBFD5BCBE7974081CA25B5537191D0100001CBBBB
                    564F399737388C61C55D0EE13D00008093EB5B9BD7478F8E600F6D4616BF5FFD
                    FE878C2C3E7092C51D0796C1367B77F54DD58F36AF578C8E8143E617C40000E0
                    643AE74D83132B00008091BEB379FD0FA32338013E7C64F12DD5A7540FAE1E52
                    7DD2C834D822CFAA1ED9BCBE7C74081C11BF2006000027D3396F1A9C58010000
                    8CF2DFABEF1A1DC109B41959FCC1E9D7BF6A99EE54FD8D36238BCFA8CE1B5807
                    23BCA7FAD6EA879C52C19EF30B62000070329DF3A6E1D439FDE965BA45F5A673
                    8D0000004E9C17540F685EDF3D3A043ECCE6E7DC2F6C33B2785075BDB14170E4
                    7EB3FA87CDEBFF1D1D02476E997EB5FA82D1190000C010B7685EDF72D03F7CAE
                    275638AD020000385B6FA91E6A54C1569AD737573F59FD64CB74BDEA73DB8C2C
                    BEB8BAE5C83438642FA9BEB97ACAE9535CE02470620500009C5C77A99E7BD03F
                    6C580100001CA72BAABFD9BCBE6A74085CAB797D4FF5E4EAC92DD3F9D5A7B719
                    593CB8BAF3C83438079756DF513DB6797DFFE8183836CB7493EA8EA333000080
                    61860E2BACBC010080B3F14DCDEBD34747C0599BD7CBABDFAE7EBB65FAE6363F
                    0F7F6064F16923D3E00CBDBBFA8FD57F6A5EDF313A0606F8F4CEF55A64000060
                    979DD3B6C1B0020000382EFFBD7AD4E80838679B6B135E7CFAF5EF5BA65B5753
                    F5F9D583AA9B0FAC838F7445F5D8EA3B9AD7D78F8E81811E303A000000186AE8
                    B0C255200000C0997845F58F4E3F9086FD32AF97563F5DFDF4E92B43EED36664
                    F1056D4EB3386F601D27D77BAB9FA9FE73F3FAE2D131B005EE3F3A00000018EA
                    9CB60D073FFE6E99AED3E618C9F3CF2500000038113EA7797DC6E8083876CB74
                    B3EA73DB0C2D3EBFBAEDD8204E80D755FFA5FAB1E6F5CDA363602B2CD305D5DB
                    AB1B8C4E01000086797F75FDE6F5B283FCE17339B1E2E28C2A0000806BF7E346
                    159C58F3FAD6EAE7AA9F6B994E55F7EC83238BCFA82E1C58C77EF9BDEAD1D593
                    9AD7BF181D035BE65E19550000C049774175A7EA2507FDC307754E7790000000
                    27C2EBAA6F1A1D015B617315CE0B4FBFBEAF65BA51F5C03E786DC8C70FAC6337
                    5D5E3DB17A74F3FABBA363608BB906040000A8CD752086150000C0D6F9C7CDEB
                    DB4747C0569AD77754BF5CFDF2E9D32CFE52F5573FE475C771716CB917554FA8
                    7EB2797DCDE818D8010F181D0000006C85BBB6F92EE6AC9DCBB0E22EE7F06701
                    0080FDF784E6F5574647C04ED89C66F17F4FBF1E5BD532DDA1FACC3E38B4F00B
                    0E27DBFFAD7EB6CDBF5BFFCFE818D8314EAC000000EA1C360E4EAC0000008EC2
                    5BAB7F3E3A0276DABCBEBAFAEFA75FB54CB7EEC38716F7AA4E8DCAE3585CD2E6
                    648A2754CF3F3DC001CEC632DDBEBAC3E80C0000602B1C78E370B02F60364794
                    BEB5BAC9413F180000D86BFFBC79FDC1D111B0D796E9A66D8EB7FFC0D0E253AB
                    F3873671185E5B3DA9CDE914CF33A68073B44C5FDA669C040000F0B6EAE607F9
                    59FBA02756DC32A30A0000E0AABDA6FAB1D111B0F7E6F56DD5534EBF6A996E58
                    DDAFBA6F759FEA93AB8B47E571C6DE5E3DA37AFAE9D7CB8C29E050B906040000
                    F8809B56B7A8DE74B67FF0A0C30AD78000000057E7BB9AD7F78D8E8013675EDF
                    593DEDF46B63996E52FDE536438B0F8C2DEE5A9D37A0908DF754CFE983438AE7
                    37AF978F4D82BDF680D1010000C056B96BC738ACB8CB01FF1C0000B0DF5E5EFD
                    E4E808E0B4797D7BF59BA75F1BCB74FDEA5E7D7068719FEA9ED585C7DE7732BC
                    B37A419BFF1B3CBDFA1DE3333826CB748336FF9E030000F880BB54CF3EDB3FE4
                    C40A0000E0307D67F37AD9E808E01ACCEBBBABDF3DFDDA58A6EB5477EF83638B
                    4FAAEE54DDBE3A75FC913BEB8DD5F33FE4F582EA4F9AD72B8656C1C9F569D5F9
                    A323000080AD72A0AD836105000070585E5CFD8FD111C001CCEB5FB41901BCE0
                    C3FEF765BAA8BA639B91C59DAA8B3FE2BF5FF73833B7CCCBFBF001C5F39BD7D7
                    8F4D023EC2178D0E000000B6CEB10E2B5C050200007CA4EF685E2F1F1D011CA2
                    CD95152F3DFDFA70CB745E759BAE7A7471A7EA16C7D679F8AEAC5E5FBDEAF4EB
                    928FF8EFAF6E5EDF33260D3823CB74AAFAE2D1190000C0D639D0D6E1EC8FF3DC
                    FCB6CABBABF30EF2810000C05EFAE3EA9E8EBB07FE9F65BADEFFCFDE9D47595E
                    16661E7FAAAA9BA69BBD914D5CA0D551518C8AE2BEE3AB32113C090489315E34
                    312631CE98B8644CCCAA8926EAC4C431E312F34E9C44D4B86022C8750751A3D1
                    3871499CC404C7282E80A0A0820D3D7FDC825EA8EAAEBA756FBDF7FEEEE773CE
                    EF745777DDCB9773EA1C0E5D4FBF6F92AD433C078EA1E6C624DF49727592AB16
                    7FBC7A978FBF9DC160E2A601C557164725C0B4AAE52E199CA6050000B0AB1B93
                    6C59EDFFF70F7362C51D6354010000ECEEB54615C06E06273A7C75F159B95AF6
                    4B725806238BC3922C64F01743767DB2C4AFEDFA7BD764F711C535E9F5770CFF
                    2F034CA1D35A0700000013693E83CDC3E757F3A26186157718E235000040775D
                    97E48DAD23808EE8F5AF4FF28DC5076058AE0101000096B32DAB1C560C73F2C4
                    B6215E03000074D7DBD2EB5FD93A0200204952CBAD923CB07506000030B156BD
                    7918665871FC10AF010000BAEB75AD03000076716A5C650C00002C6FD59B0727
                    560000006BF12F493EDC3A02006017A7B50E000000269A132B00008075F5FAF4
                    FA3B5A47000024496AD994E431AD330000808936E6132B6A991BE61F02000074
                    D2F624FFAB750400C02E1E9EE4C0D6110000C0443B7E71FBB062AB3DB1E2C824
                    5B56F91A0000A09B2E4CAFFF8DD6110000BB787CEB00000060E21D90E488D5BC
                    60B5C30AA7550000003739BF750000C0CD067FE3CCB00200005889556D1F563B
                    ACD8B6CACF070000BAEB3DAD03000076718F24B76B1D0100004C85556D1F9C58
                    0100000CE35FD3EBFF5BEB0800805DFC58EB000000606A8CF5C40AC30A000020
                    715A050030496A994FD26B9D0100004C0D578100000063675801004C9247C635
                    200000C0CAB90A04000018ABEB937CA8750400C02ECE691D0000004C95556D1F
                    E656FC99B56C4CF283AC7E8C01000074CBFBD3EB9FD23A0200204952CBA1492E
                    4BB27FEB140000606ADC9064FFF4FADB57F2C9AB1949DC76959F0F000074D3FB
                    5A070000ECE28931AA000000566721830DC48AAC6628E11A10000020493ED33A
                    00006017AE0101000086B1E20DC46A8615DB8608010000BAE7B3AD0300009224
                    B5DC2DC9C9AD33000080A9B4E20D84132B000080D5B82AC9D75A4700002C725A
                    050000302C275600000063F1B9F4FA3B5A470000A4968D499EDC3A030000985A
                    4EAC000000C6C2352000C0A43835C991AD23000080A93596132B0C2B000080CF
                    B50E000058E41A100000602D463CACA8E5C024470C5B0300007486610500D05E
                    2D4725F9D1D6190000C0543B72710BB14F2B3DB1C26915000040927CBE750000
                    4092A72459681D0100004CBDE356F2492B1D566C1BBE030000E8881F26B9B275
                    040030E36AD92FC9B35A670000009DB0A22D84132B00008095BA32BDFE8ED611
                    00C0CC3B3BC9B1AD230000804E58D116C2B00200005829A75500006DD5329FE4
                    79AD33000080CE18E9B0C25520000080610500D0DAA9494E681D0100007486AB
                    400000809132AC00005A735A050000304A233AB1A296B995BE190000D069DF6E
                    1D0000CCB05A1E90E421AD330000804ED9B6B889D8AB959C5871AB245BD6DE03
                    00004C39275600002D3DB775000000D0395B921CBEAF4F5AC9B0E2D8B5B70000
                    001DE0C40A00A08D5AEE9CE409AD330000804EDAE726C2B002000058A9EDAD03
                    008099F52B49F6793C2F0000C0100C2B00008091D9BF75000030836A393AC953
                    5A670000009D359261C56D46100200004C3FC30A00A0856725D9AF75040000D0
                    59FBDC4438B102000058A94DAD0300801953CB41497EA175060000D069AE0201
                    000046C6891500C07A7B5692435A470000009D66580100008C8C132B0080F553
                    CB91499EDF3A030000E83CC30A000060649C580100ACA7172639A875040000D0
                    796B1C56D4B225C961A3AA010000A69A610500B03E6AB9539267B4CE00000066
                    C2D6D4B2796F9FB0AF132B9C56010000DCE4F0D60100C0CCF8BD241B5A470000
                    003363AFDB08C30A000060A58E6F1D0000CC805AEE9FE48CD6190000C04C31AC
                    00000046E2D6A96553EB0800A0C36A994BF287AD3300008099B3A661C56D4618
                    0200004CB7B924B76F1D010074DA69491EDC3A02000098397BDD4638B1020000
                    580DD7810000E351CB86242F6D9D010000CC24578100000023735CEB0000A0B3
                    9E96E4CEAD230000809964580100008C8C132B0080D1ABE5C024BFDD3A030000
                    985986150000C0C818560000E3F09C2447B58E00000066D690C38A5A16921C33
                    EA1A000060AA9DD83A0000E8985A8E4BF2DCD6190000C04CBBF5E24662497B3B
                    B1E2A824CBBE1000009849774D2D5B5B4700001D51CB5C923F4DB2A5750A0000
                    30D316921CB9DC6FEE6D58E11A1000006029F76F1D000074C6D9491EDB3A0200
                    00207BD9481856000000ABF5A0D601004007D47278923F6A9D010000B0C8B002
                    0000189907B60E00003AE1E5498E681D010000B068A861C56DC6100200004CBF
                    FBA5968DAD2300802956CB29499ED23A0300006017CB6E249C58010000ACD6E6
                    24F76C1D01004CA95AB624794DEB0C0000803DB80A04000018A907B50E0000A6
                    D66F26D9D63A020000600F86150000C0489DDA3A00009842B5DC2BC9AFB4CE00
                    000058C22A8715B5CC652FF78700000033EF91A9E556AD2300802952CB8624AF
                    4BB2D03A0500006009AB3EB1E2E024078CA7050000E88085244F681D01004C95
                    672539A975040000C0320E4A2D072FF51BCB0D2B5C03020000ECCB99AD030080
                    2951CBB624BFDB3A030000601F96DC4A2C37AC387A8C21000040373C2AB51CDE
                    3A02009870B56C4CF2A6245B5AA7000000ECC3925B89E58615478C31040000E8
                    868524A7B78E000026DE8B929CDC3A020000600596DC4A2C37AC38728C210000
                    4077B80E0400585E2D25C9F35A67000000ACD0925B0927560000006B714A6AF1
                    FF0F00C02DD572749237B6CE0000005885559D58E10F4601008095D890E419AD
                    2300800953CB7C92BF889371010080E962580100008CC52FA6964DAD23008089
                    F2DC248F6E1D010000B04A86150000C0581C95E4ACD61100C084A8E5FE495ED4
                    3A030000600886150000C0D83C3BB5CCB58E00001AABE5D0246FCAE0BA300000
                    806963580100008CCD3D933CAC750400D0D06064F9DA24C7352E01000018D60A
                    8715B52C24397CDC35000040E73CBB750000D0D4CF2439B375040000C01A1C9E
                    5A6EB1A358EAC48AAD491CE10B0000ACD6E353CB9D5A4700000DD4728F24AF6C
                    9D010000B046F3196C266EF18B7B720D080000308CB924BFD33A02005867B51C
                    95E46F926C6E9D0200003002B7D84C1856000000A3F4C4D472BFD61100C03AA9
                    65FF246F4F72BBD6290000002362580100008CDD2B528BEB0501A0EB06FFBD7F
                    6D9207B64E0100001821C30A000060EC1E98E48CD61100C0D83D2FC9935B4700
                    00008C9861050000B02E5E9A5A36B58E0000C6A4962724F9FDD6190000006360
                    58010000AC8BE3933CB37504003006B5DC33C9FF4EE2EA2F0000A08B0C2B0000
                    8075F3C2D472ABD61100C008D5727492772539A0750A0000C0981856000000EB
                    E69024AF6A1D01008C482DFB27796792DBB64E0100001823C30A0000605D9D95
                    5ACE6E1D0100AC512D73495E9FE47EAD53000000C6CCB00200005877AF4E2DB7
                    691D0100ACC90B923CA975040000C03AB8C566626EB78F06CBF3EB936C58A720
                    00006036BC37C963D3EBDFD83A040058A55A9E9EE435AD33000000D6C90F936C
                    4AAFBFE3A65FD8F3C48A4363540100008CDEA393FC42EB0800609506577AFDCF
                    D619000000EB6863924376FD853D8715AE01010000C6E50F52CB9D5B4700002B
                    54CB6949DE983D4FBD050000E8BEDDB61386150000C07AD99CE42F53CBE6D621
                    00C03ED4724A92B72659689D020000D08061050000D0CC4949FE3CB5F89BAF00
                    30A96A796092F392ECD73A050000A011C30A0000A0A9B392FC66EB08006009B5
                    DC33C9F949B6B44E01000068C8B002000068EE3753CBD9AD2300805DD4729724
                    FD2487B44E01000068CCB002000098087F9E5AEEDF3A02004852CBF149DE177F
                    3E08000090185600000013625392F352CBED5B8700C04CABE5D6198C2A8E6D9D
                    0200003021F63AACB8D53A860000001C99E46F53CBD6D6210030936A393AC97B
                    936C6B9D0200003041F63AAC38741D4300000092E4EE49DE9F5A0CBD01603D0D
                    4E8DBA38C909AD5300000026CC21BB7EB0E7B0E290000000ACBF7B26F9406A39
                    B2750800CC845AEE9AE49224776C9D02000030810C2B000080897462920F2E1E
                    490E008C4B2DF74E725192635BA70000004C28C30A000060629D90E4C3A9C537
                    7A00601C6A7948920F267105170000C0F276DB4ECCDDFCB35A3626B97EBD6B00
                    000096F0A5248F48AFFF95D62100D019B53C2EC9DB93ECDF3A050000600A6C4C
                    AFBF3DD9FDC48A831BC5000000ECE90E492E4E2D3FD23A04003AA1969F48F2AE
                    1855000000ACD4CD1B8A5D8715AE0101000026C9ED937C2CB59CD53A0400A65A
                    2D3F93E4DC241B5AA70000004C919B371486150000C024DB9CE4DCD4F292D4B2
                    D03A0600A64E2DBF92E475D9F54A6000000056C2B0020000982ACF4FF2EED4B2
                    B57508004C855AE653CB8B93BCAC750A0000C09432AC000000A6CE63927C22B5
                    DCBD7508004CB45AB66470F5C70B5AA70000004C31C30A0000602ADD21C9C753
                    CBD3528B23CD01604FB51C9BE4A22467B64E010000987286150000C0D43A20C9
                    EB93F453CBF1AD63006062D472DF249F4C7252EB140000800E30AC000000A6DE
                    29493E975A9E955A165AC7004053B59C95C14915C7B44E010000E808C30A0000
                    A013B6247965928B52CB5D5AC700C0BAAB653EB5FC56927393ECDFB8060000A0
                    4B0C2B0000804E796092CFA496FF965AF66B1D0300EBA2962D190C2A7EB3750A
                    0000400719560000009DB329C9EF25F9BFA9E59CD4B2A17510008C4D2DC76670
                    F5C799AD530000003ACAB0020000E8ACDB27794392CFA79627A696F97DBD0000
                    A64A2DF749F2C92427B54E010000E830C30A0000A0F3FE539237657045C8E9A9
                    65AE751000AC492D73A9E5E9492E4E724CEB1C0000808E33AC00000066C68949
                    DE99E413A9E5B4D4B2D03A080056AD968333180CBE26C9FE8D6B000000668161
                    0500003073EE93E4BC245F4E2DBF935A6EDF3A080056A49693927C3AC959AD53
                    00000066C8CD1B8A9D47E1D6724D92035AD400000034B023493FC9EB92BC2BBD
                    FE0F1BF700C0EE06D758FD52929725D9D8B806000060D65C935EFFA0E4A66145
                    2D1B92F84344000060567D33494DF286F4FA5F6CDC0200492D5B93BC21C9E9AD
                    5300000066D886F4FA37DC34ACD89AE48AB63D00000013E11F929C9BE4CDE9F5
                    BFDC3A06801954CB0332F86FD1ED5AA7000000CCB8ADE9F5BFBD61F18343F6FA
                    A9000000B3E35E8BCF4B53CBC732F8C6D65BD3EB5FD6360B80CEAB653EC97392
                    FC5E9285C6350000000CB61486150000007BF180C5E7BFA7960F6530B2787B7A
                    7D27FE01305AB51C91E42F923CB6750A000000373B24490C2B000000F66D3EC9
                    23179F57A7967E06238BF3D2EB7FA7691900D3AF963392FC8F2447B64E010000
                    6037861500000043D890E4D4C5E7BAD4F2EE246F4A727E7AFDEF352D0360BAD4
                    726406838A335AA7000000B024C30A00008035DA94E4C7169F6B52CB79199C64
                    D14FAF7F7DD3320026572D73499E98E44F921CDEB806000080E519560000008C
                    D081499EB4F87C3BB5BC3D8391C587D2EB6F6F5A06C0E4A8E598247F9AE4F4D6
                    29000000EC9361050000C0981C96E4698BCF3753CB5B3218597C2CBDFE8D4DCB
                    006863704AC59393FC5106FF9D00000060F2ED36AC38B86108000040971D99E4
                    998BCF5752CB9B3318597C3ABDFE8EA66500AC8F5A8E4DF2DA24A7B64E010000
                    60550E4E760E2BB6340C0100009815B74DF29CC5E75F52CBB949CE4DAFFF85B6
                    59008CC5E0948AA7267945FCC52600008069B425D939ACD8DC300400006016DD
                    29C90B93BC30B57C3683532CCE4DAFFF6F6DB30018895A4E48F2C7491ED53A05
                    000080A16D4E760E2BF66F1802000030EB4E5C7C5E9C5A3E91C1C8E22DE9F5BF
                    DA360B8055ABE59024BF95E497922CB48D010000608DF64F9C5801000030694E
                    5E7C09B9F9BE00002000494441545E9E5A2E4EF2A6246F4BAFFFADB65900EC55
                    2DF3497A497E3FC9916D630000001891DD4EAC30AC000000982C73491EBAF8BC
                    2AB5BC2F83932CDE915EFFEAA66500ECAE969393BC2AC97D5BA7000000305286
                    15000000536221C963169FD7A496F3331859FC6D7AFD6B9B9601CCB25A8ECAE0
                    848A735AA7000000301686150000005368BF244F587CBE975ADE95C1752117A6
                    D7BFAE6919C0ACA86563926726F9AD2407B78D010000608C0C2B000000A6DC96
                    244F5C7CAE4E2D6FCFE0248B0FA4D7DFDEB40CA0AB6A3925C91F27B96BEB1400
                    0000C6CEB0020000A0430EC9E028FA73927C2BB5BC35C99B935C925EFF86A665
                    005D50CBC9495E94E4D1AD53000000583786150000001D7544925F587CBE915A
                    DE91E46D493EE4240B8055AAE5C424BF9BE4F4D629000000ACBBCD49329724A9
                    E5F22487B7AC01000060ECAE48725E06238BF7A7D7BFAE710FC0E4AAE54E497E
                    3B83EB96E61AD7000000D0C6E5E9F58FB86958716D0677F3020000301BBE93E4
                    6F3218595C985EFF7B8D7B0026432DB74BF21B497A4916DAC6000000D0D8B5E9
                    F50F9C4B2D73496E88E53D0000C0ACFA5E92F3331859BC3BBDFE771BF700ACBF
                    5A8E4EF282243F9764BFC6350000004C861B936C984B2D9B92FCA0750D000000
                    13E1BA24FD0C4616EF4AAFFFEDC63D00E355CBD624CF4DF2AC38D1150000805B
                    DA34975A0E4DE20FCA000000D8D3F6241FC86064F1CEF4FADF6CDC03303A832B
                    3FFE6B929F4D7260E31A00000026D7A173A9E598245F6B5D020000C044BB31C9
                    45198C2CDE915EFFAB8D7B008653CB3D923C27C9D9493634AE01000060F21D33
                    975AB625F952EB12000000A6CAC7321859BC2DBDFEA58D5B00F6AE96B9248FC8
                    E0CA8FC736AE01000060BA6C9B4B2D2724F97CEB12000000A6D6A7B37364F1C5
                    D6310037AB6543921FCF60507152E31A000000A6D30973A9E5A4247FDFBA0400
                    00804EF8A724EF5E7C2E49AFFFC3C63DC02CAAE58024E724F9E524C737AE0100
                    0060BA9D34975A1E9CE4E2D62500000074CE7792BC37C9F9492E48AF7F59E31E
                    A0EB6AB95D929F4DF2F3490E6F5C03000040373C784392CDAD2B000000E8A483
                    333882FFC79324B5FC430627599C9FE413E9F56F68970674462D0B494E4DF273
                    491E9764BE6D100000001DB3792EB59C96E4BCD625000000CC942B93BC278391
                    C585E9F52F6FDC034C9B5A8E4DF2B4243F93E4B68D6B000000E8AED39C580100
                    00400B5B93FCE4E2B323B57C3C8391C5F9493E935EFFC69671C084AA653E49C9
                    E0748AC72759681B040000C00CD86C58010000406B73491EB0F8FC6E92AFA796
                    0B321859BC37BDFED52DE3800950CB51499E9AE4E9498E6B1B030000C08C31AC
                    00000060E21C9DE49CC5677B6AF948769E66F185F4FA3B5AC601EBA4964D491E
                    97E4A7929C9E6443DB2000000066946105000000136D4392872F3E7F90E4FFA5
                    96F393BC3BC907D3EB5FDB2E0D18B9C1551F0FCBE09AA033921CDA3608000000
                    0C2B000000982EB74BF28CC5E7BAD4F2A10C4EB2B820C9BF3ACD02A6502D7349
                    EE99C198E2EC24C7B60D02000080DD185600000030B5362579CCE2F3CA245F4B
                    2D1725B9E9F9A7F4FA3736EC03F6A696E33318533C29C95D1BD7000000C0720C
                    2B000000E88C5B2779E2E2932457A4968B3318595C9CE433E9F5B7B78A0392D4
                    726C92276430A67840E31A0000005809C30A0000003AEBF00CBE81FB84C58FAF
                    492D9764E789169F4CAF7F5DAB389809836B3EEE9EE4F4C5E73E6D8300000060
                    D5366F48B27FEB0A00000058070766E7D52149725D6AF9BBEC1C5A7C2CBDFE35
                    ADE2A0336AD990E441D939A6D8D63608000000D664F38624FBB5AE0000008006
                    362579E8E2932437A4964F65E7D0E292F4FA57B68A83A952CB01198C964E4FF2
                    9F33383106000000BA60E386240BAD2B00000060022C243979F1794E92A496CF
                    66E7D0E2E2F4FA9735AB834932B8E2E384240F4B726A925332182B01000040D7
                    2C1856000000C0F24E5C7C7E314952CBBF24B9383BC71697A6D7DFD1AC0ED64B
                    2DF3190C291E9EC198E261498E689904000000EBC4B00200000056E14E8BCF53
                    173FFE8FD47251925F4DAFFF95765930628321C5DDB2FB90E2562D93000000A0
                    11C30A0000005883DB24F9C924AF4A6258C1F41A0C29EE9EC190E2E1491E9AE4
                    F0864500000030290C2B0000000066CE60487162761F526C6D580400000093CA
                    B002000000A0F306438A7B64F721C5610D8B000000605A18560000000074522D
                    1B933C333B87148736ED01000080E9645801000000D0515B92BCA27504000000
                    4CB985F9185600000000000000002CC5B0020000000000000060190BF349E65B
                    5700000000000000004CA079275600000000000000002CCD5520000000000000
                    0000CB30AC00000000000000005886610500000000000000C0320C2B00000000
                    000000009661580100000000000000B00CC30A00000000000000806518560000
                    0000000000002CC3B00200000000000000601986150000000000000000CB30AC
                    00000000000000005886610500000000000000C0320C2B000000000000000096
                    61580100000000000000B00CC30A000000000000008065185600000000000000
                    002CC3B00200000000000000601986150000000000000000CB30AC0000000000
                    00000058C6C27C92F9D61500000000000000001368613EC98DAD2B0000000000
                    00000026D00DF349AE6B5D01000000000000003081AE9B4F727DEB0A00000000
                    000000800974BD132B000000000000000096E6C40A00000000000000806538B1
                    020000000000000060194EAC00000000000000005886132B0000000000000000
                    96E1C40A0000000000000080655C6F580100000000000000B034578100000000
                    000000002CC355200000000000000000CB70620500000000000000C0329C5801
                    00000000000000B00C275600000000000000002CC389150000000000000000CB
                    70620500000000000000C0329C580100000000000000B00C2756000000000000
                    00002CC389150000000000000000CBB87E3EC9F75B5700000000000000004CA0
                    1FCC27B9B2750500000000000000C004BA623EC915AD2B000000000000000026
                    D015F3492E6F5D010000000000000030812E77620500000000000000C0D29C58
                    0100000000000000B00C275600000000000000002CE3CAF9F4FAD727F96EEB12
                    000000000000008009F29DF4FAD7CF2F7EE0D40A00000000000000809DAE4892
                    9B861597370C0100000000000000983497273B87154EAC0000000000000000D8
                    69B7132B0C2B00000000000000007672150800000000000000C0325C05020000
                    0023B2A175002C6163EB0000000098724EAC000000801139A875002CC1D72500
                    0000AC8D132B00000060447C039B49E4EB12000000D6C689150000003022BE81
                    CD243AB075000000004C392756000000C088185630897C5D020000C0DA38B102
                    00000046C437B09944BE2E010000606D9C580100000023E21BD84C225F970000
                    00B036BB9C58D1EB7F3FC9F75AD6000000C014F30D6C2691AF4B00000018DEB5
                    E9F57F90EC3CB12249BED22806000000A6DD21AD03600907B70E000000802976
                    F38662D761C5A5EBDF010000009D705CEB0058C2F1AD03000000608A5D7AD34F
                    761D56FCFBFA770000004027DC39B5CCB58E803DDCB975000000004CB19B3714
                    8615000000B076872539A27504ECE12EAD03000000608A2D39ACB874FD3B0000
                    00A0339C0EC0E4A8E5F02487B7CE000000802976E94D3F7162050000008C8661
                    0593C4D723000000AC8D132B00000060C45CBBC024F1F5080000006B73E94D3F
                    D975587179926BD73D05000000BAC109014C125F8F00000030BC6B925C71D307
                    3B8715BDFE8E38B50200000086E584002689AF4700000018DEA58B1B8A24BB9F
                    5891EC724708000000B02A77482D87B78E80D43297E4BEAD33000000608AEDB6
                    9D30AC00000080D1984BF2B0D61190C13520C7B48E0000008029B6D761C5A5EB
                    D7010000009DF3A8D601105F87000000B05697EEFA81132B00000060741ED93A
                    00E2EB10000000D6CA8915000000302677492DB76E1DC10CAB653EC9235A6700
                    0000C094BB74D70F9C5801000000A3E59BDAB4F423490E6B1D0100000053EED2
                    5D3FD87D58D1EB5F95E4EA758C01000080AE710D032DF9FA03000080B5B96A71
                    3B71B33D4FAC489C5A010000006BF1A8D432D73A8299F5A8D60100000030E56E
                    B19930AC00000080D1BA7D927BB58E6006D572589C58010000006B75E99EBFB0
                    D4B0E2169F04000000ACCA4FB70E60269D996453EB0800000098724EAC000000
                    8075F093A96563EB08668E410F000000ACDD8A86155F588710000000E8B22392
                    3CA6750433A4963B267950EB0C000000E8805B6C26961A567C761D42000000A0
                    EB9C1EC07A7A72EB00000000E8885B6C26E696FCB45ABE9EE4A871D700000040
                    875D97E498F4FADF6E1D42C7D5329FE44B498E6B5C02000000D3EEEBE9F58FD9
                    F317973AB12249FE71CC31000000D0759B929CD93A8299F0A01855000000C028
                    2CB99530AC00000080F1796AEB0066C239AD03000000A0235635ACB8C59D2100
                    0000C0AADD2FB53CB475041D56CB6D92FC54EB0C000000E88825B7124EAC0000
                    0080F1FAF5D60174DA73926C6C1D010000001DB1AA132BFE29C90DE36B010000
                    8099F1E8D47272EB083AA896A3923CBD750600000074C40D196C256E61E96145
                    AFFF83245F1C6310000000CC925F6B1D40273D3BC9E6D611000000D011FF9C5E
                    FFBAA57E63B9132B9265EE0E0100000056EDB4D4F223AD23E8905AB626F9C5D6
                    19000000D021CB6E24F636AC58F2EE1000000060282F681D40A7FC5292035B47
                    00000040872CBB9130AC00000080F571666AB96BEB083AA0968393FC97D61900
                    0000D0318615000000D0D85C9297A596B9D6214CBD172639AC750400000074CC
                    50C38AAF24B97AF42D00000030B34E4DF284D6114CB15AEE9EE4D9AD33000000
                    A063AE4EF21FCBFDE6F2C38A5E7F4792CF8E210800000066D92B53CB81AD2398
                    4283D34EFE34C942EB14000000E8987F5CDC482C696F27560C5E0C0000008CD2
                    6D33B8CA0156EBA7933CB8750400000074D05EB7118615000000B0FE7E39B5DC
                    AD750453A496AD49FEB0750600000074D49A8615AE0201000080D1DB90E4D58B
                    573BC04ABC38C911AD23000000A0A3F6BA8DD8D7B0E273230C01000000767A68
                    06573BC0DED572BF243FD73A030000003A6CAFDB887DFFCD985ABE9464DBA86A
                    000000809B7D37C9BDD3EBFF6BEB1026542D8724F954923BB44E010000808EFA
                    527AFD3BEEED13F6756245927C744431000000C0EE0E4AF2E6D4B2A975081368
                    7055CCEB625401000000E3B4CF4DC44A8615978C200400000058DABD93BCAC75
                    0413E91949CE6C1D010000001DB7CF4D846105000000B4F7CCD47246EB082648
                    2DF74AF247AD3300000060068C6458F1F92457AFBD05000000D88B3F4B2DAE7C
                    20A9E5E0246F4DB25FEB14000000E8B8AB927C615F9FB4EF6145AF7F63928F8D
                    200800000058DEC149DE9C5A36B50EA1A15AE692BC3689910D0000008CDFC716
                    37117BB592132B12D781000000C07A3829C96B16BFB9CE6C7A6E92B35A470000
                    00C08C58D116C2B00200000026CB5392BCA475040DD4D24BF2D2D61900000030
                    43463AACF844921B866F0100000056E179A9E5975B47B08E6A797C92D7B7CE00
                    00008019B23D832DC43EAD6C58D1EB5F9BE4D36B080200000056E7E5A9E5C9AD
                    235807B53C28C95B922CB44E0100008019F2E9F4FADF5BC927AEF4C48AC47520
                    000000B0DEDE905A1ED73A8231AAE5EE49FE36C9FEAD5300000060C6AC780361
                    5801000000936B4392BF4E2DF76F1DC218D472FB24172639B4750A000000CC20
                    C30A000000E8882D492E482D0F6E1DC208D57287241F4872EBD62900000030A3
                    C630ACE8F52F4BF2EFC3D4000000006B726892F7A696C7B70E61046AB957928F
                    26D9D63A0500000066D4BFA5D7FFFA4A3F79352756244EAD0000008056F64FF2
                    8ED4724EEB10D6A0964724F97092235BA7000000C00C5BD5F6C1B002000000A6
                    C7429237A496E7A796B9D631AC522D6724794F92835AA7000000C08C33AC0000
                    00808E7B499297A796D5FE7F3DADD4F2F349DE9264BFD629000000C07887159F
                    4F72F52A5F030000008CDEB393FC656A39A075087B51CB426A797192572771CA
                    08000000B47755922FACE605AB1B56F4FA3726F9E8AA5E030000008CCB13937C
                    22B5DCAD75084BA8E59824EF4DF282D629000000C0CD3EBAB87D58B1618E0C75
                    1D080000004C8E13927C32B5F45A87B08B5A4E49F299248F689D02000000EC66
                    D59B87618615EF1BE235000000C0F86C4EF2E7A9A5BA1AA4B1C1D51FBF9DA49F
                    E4C8D639000000C02DAC7AF330CCB0E2EF935C31C4EB00000080F17A4A06A757
                    B81AA485C1D51FEF4BF21B49E61AD700000000B77479069B875519EE7FF26BF9
                    AB24670FF55A00000060DCBE9FE4D792FC497AFDEDAD633AAF96B9243F91E48F
                    E3940A00000098647F955EFF49AB7DD130275624C90543BE0E00000018BFCD49
                    5E91E453A9E541AD633AAD963B6770EDC7B931AA000000804937D4D661C390FF
                    B00B877C1D000000B07EEE91E423A9E50D499E9F5EFFF2D6419D51CB96242F48
                    F2BC241B1BD700000000FBB623436E1D86BFEFB3964F26B9CFD0AF07000000D6
                    D395497E35C99FA5D7BFB175CC54ABE54793FC4992E31A97000000002BF7C9F4
                    FA270FF3C261AF024992F7ACE1B5000000C0FADA9AE4B5493E9A5A1E965A86FF
                    CB16B3AA961353CB3B93FC4D8C2A00000060DA0CBD7158CBB062A8BB47000000
                    80A6EE97E443492E4E2D8F35B058815AEEBB38A8F8C724A7B7CE010000008632
                    F4C6612D57812C24F95692C3867E0F000000A0B54F2579519277B922640FB53C
                    24C9AF25794CEB14000000604DAE4C72647AFD1B8679F1DAFE564A2DE726396B
                    4DEF010000004C82CF27797192B70CFB870C9D3038C1E39424BF9EE4A18D6B00
                    000080D13837BDFED9C3BE782D5781246BB883040000009828774BF25749BE9C
                    5A5E925A4E681DB4AE6AB96D6AF9D50C0626FD18550000004097AC69DBB0D613
                    2B8E4E72D99ADE0300000098547F9FE42F32F85B1DDF6A1D3372B51C98E4C792
                    FC74924766AD7F4E020000004CAAA3D3EB7F63D817AFFD0F0C6AF974927BADF9
                    7D0000008049B53DC9F949DE98E43DE9F5AF69DC33BC5A3665701AC59393FC78
                    922D6D830000008031FB747AFD93D6F2061B461071410C2B000000A0CB362439
                    6DF1D99E5AFE2EC907169F8FA7D7FF41CBB8BDAA6521C9BD333891E291491E92
                    6473D326000000603D5DB0D63718C589150F4972D19ADF0700000098463F4872
                    4992F727F96092FF935EFFFBCD6A6AD998E4AE491E9EE451491E96E490663D00
                    0000406B0F49AFFF91B5BCC12886151B925C1E7F4801000000243B927C39C917
                    93FCF3E28F37FDFCB2F4FA3B46F24FA9E55649EE9CE42E7BFCB82DA339A11300
                    0000987E57253922BDFEF6B5BCC9DA87154952CB5B939C3192F702000000BAEA
                    BB49BEBAF8E377167FDCF3B93683AB3A0EDACB734C92ADEBDC0E0000004C9FB7
                    A6D7FF89B5BEC9A8FE06C70531AC00000000F6EEA00C4E9600000000580F178C
                    E24DE647F126492E1CD1FB00000000000000008CC248B60CA31956F4FA5F4DF2
                    7723792F0000000000000080B5F9787AFDAF8DE28D4675624592BC7984EF0500
                    00000000000030AC916D184639AC78EB08DF0B00000000000000605823DB308C
                    6E58D1EBFF47924B46F67E0000000000000000ABF791F4FA5F1DD59B8DF2C48A
                    C4752000000000000000405B23DD2E8C7A58F1D749768CF83D01000000000000
                    0056624706DB859119EDB0A2D7BF2CC945237D4F000000000000008095F9707A
                    FDAF8FF20D477D6245E23A1000000000000000A08D916F16C631AC785B921BC7
                    F0BE0000000000000000CBB93183CDC2488D7E58D1EB7F33C90747FEBE000000
                    0000000000CBFB407AFD6F8DFA4DC7716245E23A1000000000000000607D8D65
                    AB30AE61C5DB93DC30A6F70600000000000000D8D5F624EF18C71B8F6758D1EB
                    5F91E47D63796F0000000000000080DDBD6F71AB3072E33AB122711D08000000
                    00000000B03EC6B65118E7B0E29D497E38C6F70700000000000000F861061B85
                    B118DFB0A2D7FF7692FED8DE1F0000000000000020B930BDFE55E37AF3719E58
                    91B80E040000000000000018AFB16E13C63DAC382FC97563FE67000000000000
                    FCFFF6EE3E68F7BBA0EFFCFB1045C4E982C5A5D0D18AC4992D50E216147990CA
                    837B512328A2AC1D69E1A7A2B6D6E5D9ED4C0B08A2D69D121010D425C085205D
                    04212241F2333CD5F03008B484C72D0405D4044D4C628700494ECEFE71DD6C02
                    84E49C93FBBEBFD7C3EB3573CF951998F9BD33739FEBFCF1FDE4FB030076D317
                    AAD71DE4030E765831CD7F579D7DA0CF000000000000000076D5D97BDB840373
                    D0375654BDE8109E0100000000000000EC9E330FFA018731AC38A7FAF4213C07
                    00000000000000D81D9FAAE6837EC8C10F2BA6F968F5E2037F0E000000000000
                    00B04B5EBCB749385087716345AD8615C70EE95900000000000000C076BBA643
                    BAE4E1708615D3FCA9EA8D87F22C0000000000000060DBBDB169FEF4613CE8B0
                    6EACA87AE1213E0B00000000000000D85E87B64138CC61C5EBABCF1CE2F30000
                    000000000080ED735175F6613DECF08615D37C55F592437B1E00000000000000
                    B08D5EB2B741381487796345D59987FC3C0000000000000060BBBCE8301F76B8
                    C38A69BEA07AF3A13E1300000000000000D8166FDADB1E1C9AC3BEB1A2EA8503
                    9E09000000000000006CBE43DF1C8C1856BCB6BA64C0730100000000000080CD
                    754975D6613FF4F08715D3FC85EA770EFDB900000000000000C0267BE9DEE6E0
                    508DB8B1A2BC0E04000000000000003831678E78E89861C5347FA47AFB906703
                    000000000000009BE6BCBDADC1A11B756345B9B50200000000000000383EC336
                    06238715AFAA2E1FF87C0000000000000060FD5D5EBD7AD4C3C70D2BA6F98AEA
                    65C39E0F000000000000006C8297ED6D0C8618796345D573AB63831B00000000
                    00000080F574AC7ACEC880B1C38A69FE5875D6D00600000000000000605DBDB6
                    69FEF8C880D13756543D73740000000000000000B096866F0A8E8C0EA86AB978
                    6775CFD11900000000000000C0DA7867D37CEFD111EB706345ADC1C204000000
                    00000000582B6BB125589761C559D527464700000000000000006BE182EA0F46
                    47D4BA0C2BA6F968F5ECD11900000000000000C05A78F6DE9660B8F51856ACBC
                    A4BA7474040000000000000030D4DF56CBD1115FB43EC38A69FE6CF582D11900
                    000000000000C0502FD8DB10AC85F51956ACFC4675E5E8080000000000000060
                    882BABE78F8EB8AEF51A564CF345D5CB4767000000000000000043BC6C6F3BB0
                    36D66B58B1F2ACD10100000000000000C0106BB71958BF61C5347FA87AC3E80C
                    00000000000000E0509DDD347F7874C4975BBF61C5CA19A30300000000000000
                    8043B5965B81751D56BCA5FAAFA323000000000000008043F1BEEAADA323AECF
                    7A0E2BA6F958F5CCD11900000000000000C0A178E6DE5660EDACE7B062E555D5
                    5F8C8E00000000000000000ED4A7AB578F8EF86AD6775831CD57E5D60A000000
                    00000000D87667EC6D04D6D2FA0E2B567EBBFAABD11100000000000000C081F8
                    CB56DB80B5B5DEC38A69FE7CF52BA333000000000000008003F12B7BDB80B5B5
                    DEC38A9517559F1A1D0100000000000000ECAB4FB6DA04ACB5F51F564CF317AA
                    678CCE0000000000000000F6D5339AE62B4747DC98F51F56ACBCB4BA60740400
                    000000000000B02F3E5EFDCEE888E3B119C38A69BEAA7AFAE80C000000000000
                    00605F3C7D6F0BB0F6366358B1F28AEAA3A32300000000000000809BE423D57F
                    1E1D71BC36675831CD47ABA78DCE00000000000000006E92A7ED6D0036C2E60C
                    2B565E557D607404000000000000007052CEAF5E3D3AE2446CD6B0629AAFA99E
                    3A3A030000000000000038294FDD3BFBDF189B35AC58F983EABDA32300000000
                    0000008013F29EEA75A3234ED4E60D2BA6F9586EAD00000000000000804DF3D4
                    BD33FF8DB279C38A953FAADE353A0200000000000000382EEFACDE383AE2646C
                    E6B062B56079CAE80C00000000000000E0B83C65136FABA84D1D56ACBCA97ADB
                    E80800000000000000E006BDB57AF3E88893756474C04DB25CDCB7FA2FA33300
                    00000000000080AFEABE4DF379A3234ED626DF5851D3FC27D539A33300000000
                    00000080EB75CE268F2A6AD387152B4FAAAE191D01000000000000007C89A3D5
                    134747DC549B3FAC98E60F56BF353A0300000000000000F812BFD5347F6874C4
                    4DB5F9C38A95A756978E8E0000000000000000AAD519FE2F8E8ED80FDB31AC98
                    E64BAAA78DCE0000000000000000AAFAC5BDB3FC8DB71DC38A95DFAC3E323A02
                    0000000000000076DC47AADF1A1DB15FB6675831CD57554F189D010000000000
                    00003BEEF17B67F85B617B861555D3FCC6EA0DA3330000000000000060479DDD
                    349F333A623F6DD7B062E509D5D5A3230000000000000060C75CDD16BE6962FB
                    8615D3FCFF56CF1B9D01000000000000003BE6B94DF37F1F1DB1DFB66F58B1F2
                    4BD5C5A3230000000000000060475C5C3D6374C441D8CE61C5345F563D657406
                    00000000000000EC8827EF9DD56F9DED1C56AC9C597D60740400000000000000
                    6CB9F35B9DD16FA5ED1D564CF3D5D5E3466700000000000000C0967B5CD37C74
                    74C441D9DE6145D534BFB97AEDE80C00000000000000D852AF699ADF323AE220
                    6DF7B062E549D595A3230000000000000060CB5C59FDC2E88883B6FDC38A69FE
                    44F5ECD11900000000000000B0659EB57726BFD5B67F58B1F22BD55F8E8E0000
                    0000000000802DF117D5AF8E8E380CBB31AC98E6FF51FDDCE80C000000000000
                    00D812FF66EF2C7EEBEDC6B0A26A9A5F57FDDEE80C00000000000000D870AF6C
                    9A5F3F3AE2B0ECCEB062E531D5A5A3230000000000000060435D5A3D7674C461
                    DAAD61C5347FA67AC2E80C00000000000000D8508FDF3B7BDF19BB35AC587969
                    F5A6D11100000000000000B061CEAD7E6774C4613B323A6088E5E2D4EA03D5D7
                    8F4E01000000000000800DF0B9EA9F34CD9F181D72D876F1C68A9AE60BAAA78E
                    CE00000000000000800DF1945D1C55D4AE0E2B567EBD7ADFE808000000000000
                    005873EFAD9E333A6294DD7C15C8172D17FFB4FAD3EA94D12900000000000000
                    B0868E56DFD934FFB7D121A3ECF28D1535CDFFB57AE6E80C0000000000000058
                    53FF69974715B5EBC38A95A7571F1F1D01000000000000006BE663D52F8D8E18
                    CDB0629A3F57FDCCE80C0000000000000058333FBD77A6BED30C2BAAA6F92DD5
                    99A33300000000000000604DBCB03C8DDB050000173749444154697EDBE88875
                    605871ADFFB3BA687404000000000000000C7651AB337432ACB8D6345F5AFDFC
                    E80C0000000000000018ECDF36CD978D8E581786155FEA357B3F000000000000
                    00B08B7EBF69766E7E1D8615D735CDC7AA9FAD2E1C9D020000000000000087EC
                    AF5A9D99731D86155F6E9A2FAE1E353A03000000000000000ED9A39AE64B4647
                    AC1BC38AEB33CD7F5C3D6B7406000000000000001C92339AE6734747AC23C38A
                    AFEEDF57E78F8E000000000000008003F6FEEA3F8C8E5857474607ACB5E5E22E
                    D57BAA5B8C4E010000000000008003F0F9EAEE4DF3874787AC2B3756DC9069FE
                    50F5A4D1190000000000000070409E685471C30C2B6EDC0BAA378C8E00000000
                    000000807D7676F59BA323D69D57811C8FE5E2B6D507AADB8E4E010000000000
                    00807DF099EAB4A6F9AF4787AC3B37561C8FD52FD2343A0300000000000000F6
                    C96454717C0C2B8ED734FF51F5BCD1190000000000000070133DB7697EE3E888
                    4D61587162FE5DF5A1D1110000000000000070923ED8EAEC9BE3746474C0C659
                    2E4EABFEB4BAF9E8140000000000000038015FA8BEAB69FEC0E8904DE2C68A13
                    35CDE767BD03000000000000C0E6F977461527CEB0E2E43CB79A474700000000
                    000000C0713AA77ADEE8884DE45520276BB9B87DF581EA36A353000000000000
                    00E0065C5C9DD6345F383A6413B9B1E264AD7EE11E393A03000000000000006E
                    C0B1EA51461527EF94D1011BEDAC0B3ED6434F3D52DD6F740A00000000000000
                    5C8FA737CD678E8ED8646EACB8E97EA97AC3E80800000000000000F8326757CF
                    181DB1E98E8C0ED80ACBC53756EFA9EE383A0500000000000000AA0BAAEF6A9A
                    2F1D1DB2E9DC58B11F56BF880FAB3E373A05000000000000809DF7B9EA614615
                    FBC3B062BF4CF3FBAB9F1E9D01000000000000C0CE7B74D37CFEE8886D6158B1
                    9FA6F977ABE78DCE0000000000000060673DB7697EC5E8886D6258B1FF9E54BD
                    7D7404000000000000003BE7BC5667D6ECA323A303B6D27271FBEA7DD5ED46A7
                    00000000000000B0132EACEEDE345F383A64DBB8B1E220AC7E511F5E5D3D3A05
                    00000000000080AD7775F5A3461507C3B0E2A04CF379D5134667000000000000
                    00B0F51EDF34BF6374C4B632AC3858BF51FDEEE80800000000000000B6D6CBAB
                    E78F8ED8664746076CBDE5E296D53BABD346A700000000000000B055DE5FDDBB
                    69BE6274C83633AC380CCBC5A9D57BAA5B8F4E01000000000000602B5C567D67
                    D37CC1E8906DE755208761F58BFC2F476700000000000000B0158E558F30AA38
                    1CA78C0ED819675DF0B11E7AEAD5D50346A700000000000000B0D19ED234BF78
                    74C4AE7063C5E1FAD56A393A02000000000000808DF5E25667CF1C9223A30376
                    CE7271F3EA0DD50347A700000000000000B051CEAD4E6F9AAF1A1DB24B0C2B46
                    582E6E5D9D57DD65740A000000000000001BE143D57D9AE6CB4787EC1AC38A51
                    968B6FADDE55DD6E740A000000000000006BEDA2EABB9BE64F8D0ED945371B1D
                    B0B3A6F993D583AB2B46A700000000000000B0B6AEA81E6C54318E61C548D3FC
                    DEEA5F54D78C4E0100000000000060ED5C53FD8BBDB3650631AC186D9AFFB07A
                    ECE80C00000000000000D6CE63F6CE9419E894D10154675DF0EE1E7AEAADAA7B
                    8D4E01000000000000602D3CAB69FEE5D111B8B1629DFC42F5DAD11100000000
                    0000000CF79A5667C8AC8123A303B88EE5E296D55BAA7B8C4E01000000000000
                    60887757F76F9AAF181DC28A61C5BA592EFE41F5AEEA0E834B00000000000000
                    385C7F56DDAB69FECCE810AEE55520EB66F507E4F4EAB2D12900000000000000
                    1C9ACBAAD38D2AD68F61C53A9AE68F543F5C5D353A0500000000000080037755
                    F5D0A6F9A3A343F84A8615EB6A9ADF5AFDE4E80C000000000000000EDC4F36CD
                    6F1B1DC1F533AC5867D3FCF2EAF1A3330000000000000038308FDF3B1B664D9D
                    323A801B71D605EFEAA1A71EAD1E303A05000000000000807DF5E4A6F93F8D8E
                    E086B9B16233FC4AF57F8D8E0000000000000060DFFC5AF5ABA323B8716EACD8
                    04675D500F3DF54DD53755F7189D03000000000000C04DF21BD5939AE663A343
                    B8714746077002968B9B552FAAA6C125000000000000009C9C97548F6E9AAF19
                    1DC2F131ACD834CBC529D52BAAFF7D740A0000000000000027E495D5239AE6A3
                    A343387E86159B68B9B879F5FBD58347A700000000000000705CFEB0FA91A6F9
                    AAD1219C18C38A4DB55CDCA27A7DF5C0D12900000000000000DCA073AB8734CD
                    9F1F1DC28933ACD864CBC53754E754F7199D02000000000000C0F57A7BF5A0A6
                    F9B3A343383986159B6EB9B855F5E6EA6EA35300000000000000F812EFAD1ED8
                    345F3E3A84936758B10D968B6FAADE5ADD657009000000000000002B1FACEED7
                    345F323A849BC6B0625B2C17B7AFFE4BF5EDA3530000000000000076DCC7ABFB
                    36CD178D0EE1A633ACD826CBC53FAAFEA4FA47A3530000000000000076D4A75A
                    8D2A3E353A84FD71B3D101ECA3D51FCCEFABAC9E000000000000000EDF85D503
                    8D2AB68B61C5B699E68F55FFACFAF4E814000000000000801DF2A9EA9F35CD1F
                    1F1DC2FE32ACD846AB71C57D5BBDB7070000000000008083F5F156AFFF7046BB
                    850C2BB6D5347FB2D5CD151F1A9D02000000000000B0C53ED4EAA60AAFFFD852
                    8615DB6C9A2FACEE57BD6F7009000000000000C0367A6FF5BD7B67B36C29C38A
                    6D37CD17570FA8DE313A05000000000000608BBCBD7A60D37CC9E8100E9661C5
                    2E98E6CBAB45F5A6D129000000000000005BE0DCEA417B67B16C39C38A5D31CD
                    9FAD1E5CBD7E740A000000000000C006FBC3EA217B67B0EC00C38A5D32CD9FAF
                    1E56FDDEE814000000000000800DF4CAEA47F6CE5ED9118615BB669AAFAA7EBC
                    5A0E2E01000000000000D8242FA91EB177E6CA0E31ACD845D37CB4FAA9EA3746
                    A7000000000000006C80E7558FDE3B6B65C79C323A8041CEBAE0580F3DF58DD5
                    2DAAEF199D03000000000000B0A67EADFA85A6F9D8E810C638323A80C1968B23
                    D5BFAF7E79740A000000000000C09AF90F4DF3AF8E8E602CC30A56968BC755CF
                    1E9D01000000000000B0261EDF34FFFAE808C633ACE05ACBC5BFAC5E5C7DEDE8
                    140000000000008041AEAA7EB2697EF9E810D68361055F6AB9B85FF5DAEAD683
                    4B000000000000000EDB65D5439BE6B78D0E617D1856F095968B3B556FA8EE30
                    B804000000000000E0B0FC59F5034DF3474687B05E6E363A8035B4FAA2B867F5
                    EED1290000000000000087E0DDD53D8D2AB83E86155CBF69FE4C75FF56AF0501
                    000000000000D856AFADEEDF34FFF5E810D69361055FDD345F513DBC7AF6E814
                    0000000000008003F0ACEAE17B67A370BD8E8C0E60432C173F5F3D27631C0000
                    0000000060F35D533DA6697EFEE810D69F6105C76FB97848F5FF54B71C9D0200
                    00000000007092AEA87EAC697EFDE810368361052766B9B87BF5FAEA76A35300
                    0000000000004ED045D5839BE6F78E0E6173185670E2968B6FADCEAEEE323A05
                    000000000000E0387DA83ABD69FED4E81036CBCD4607B081A6F993D57DAA378D
                    4E01000000000000380EE756F731AAE06418567072A6F9F2EAF4EA25A3530000
                    00000000006EC08B5BDD5471F9E81036936105276F9AAFAC7EAA7A72756C700D
                    000000000000C0751D6B7596F9E8A6F9AAD1316CAE23A303D812CBC5E9D5EF56
                    B71E9D02000000000000ECBCCBAA4734CD6F181DC2E633AC60FF2C17A756AFA9
                    4E1B9D02000000000000ECACF7573FD2345F303A84EDE05520EC9FD517D3BDAA
                    978F4E0100000000000076D2CBAB7B1B55B09F0C2BD85FD37C45F5C8EAFFA8AE
                    1E5C03000000000000EC86AB5B9D513E72EFCC12F68D57817070968BFB54AFAA
                    6E3F3A05000000000000D85A17560F6F9ADF3E3A84EDE4C60A0ECEEA8BEBEED5
                    79A35300000000000080AD745E7577A30A0E926105076B9A2FAC1E503D77740A
                    000000000000B0559E533D60EF4C120E8C57817078968B47542FACBE7E740A00
                    0000000000B0B13E573DBA697EC5E81076836105876BB938AD7A6D75C7D12900
                    0000000000C0C6B9A07A58D37CFEE8107687578170B8565F70DF59BD61740A00
                    0000000000B051CEAEBECBA882C36658C1E19BE64BAB87544FAB8E8D8D010000
                    00000000D6DCB1EA17AB1FDC3B6B8443E555208CB55C9C5EBDB4FAA6D1290000
                    00000000C0DAB9B87A54D3EC467C8671630563ADBE004FABE6D1290000000000
                    00C05A39A7BAAB5105A3195630DE345F587D7FF5B8EACAC135000000000000C0
                    585FA81E5B9DDE345F343A06BC0A84F5B25C9C56BDA2BACBE814000000000000
                    E0D07DB0FAF1A6F903A343E08BDC58C17A99E6F3ABEFAA9E373A050000000000
                    003854CFADEE6154C1BA716305EB6BB938BD7A4975DBD129000000000000C081
                    F94CF5134DF31F8D0E81EBE3C60AD6D734BFA1BA6B75F6E814000000000000E0
                    40BCBE3ACDA882756658C17A9BE6BFAE1E52FDDBEAF3836B00000000000080FD
                    F1F9EAE7AA1FDC3B1384B5E555206C8EE5E2CED52BAAEF189D02000000000000
                    9CB4F7573FDE347F7874081C0F3756B039565FACDF5D9D313A05000000000000
                    38296754DF6D54C1267163059B69B9F8DFAA9756B71F9D02000000000000DCA8
                    0BAB4736CDE78E0E8113E5C60A36D334FF71755AF59AD129000000000000C00D
                    FAFDEAAE46156C2A3756B0F9968B8755CFAF6E373A05000000000000F8FF5D58
                    FD7CD3EC3F9666A3B9B182CDB7FA22BE53F5C2D12900000000000040B53ABBBB
                    B35105DBC08D156C97E5E2FED5FF5D7DFBE814000000000000D8411FAB7EA669
                    7EEBE810D82F6EAC60BB4CF35BAAD3AA5FAB8E0EAE010000000000805D71B4FA
                    8FD5771855B06DDC58C1F65A2EFED7EACCEAEEA353000000000000608BBDB77A
                    74D3FCDF4687C041706305DB6BF5C57DCFEA49D5E706D7000000000000C0B6F9
                    5CF5C4EA9E46156C333756B01B968B3B56BF5D7DDFE814000000000000D802E7
                    563FDB347F6274081C343756B01B565FE88BEA27AA4B07D7000000000000C0A6
                    BAB49AAA855105BBC28D15EC9EE5E21F54CFA97E6C740A0000000000006C9057
                    568F6D9A3F333A040E936105BB6BB97848F582EA9B47A7000000000000C01AFB
                    8BEAE79AE63F1C1D0223781508BB6BF5C57FE7EAD7AA2B07D7000000000000C0
                    BAB9B2D559DA9D8D2AD8656EAC80AAE5E28ED533AB1F1E9D020000000000006B
                    E035D52F34CD9F181D02A31956C0752D17F7AF7EBD3A6D740A0000000000000C
                    707EF5B8A6F92DA343605D7815085CD7EA2F88BB55FFBABA78700D0000000000
                    001C968BAB9FADEE6654015FCA8D15F0D52C17B7AE9E523DA6FA9AC135000000
                    0000007010AEAE9E5B3DA369BE6C740CAC23C30AB831CBC5FF529D51FDC0E814
                    000000000000D847AFAF9ED834FFF7D121B0CE0C2BE0782D170FAA9E5DDD6974
                    0A000000000000DC041FA91EDF349F333A0436C1CD4607C0C658FDC5F21DD563
                    AB4B07D7000000000000C089BAB47A4CF51D461570FCDC58012763B9B84DF5F4
                    EA5F57A70CAE010000000000801B72B4FACDEA694DF325A36360D31856C04DB1
                    5CDCA53AA37AD0E814000000000000B81EE7544F6C9A3F343A0436956105EC87
                    E5E2BED533AAEF1D9D02000000000000D5DBAA2737CDE78D0E814D675801FB65
                    B938523DA0D5C0E25E836B000000000000D84DEFAC9E52BDB9693E363A06B681
                    6105ECB7D5C0E29FB71A58DC7D700D000000000000BBE1BDAD06156F34A880FD
                    655801076535B0F8A1EA97AABB0EAE010000000000603B9D5F3DB57A9D41051C
                    0CC30A3868CBC5CDAA1FAD9E5EFDE3C1350000000000006C878F56BF58BDBA69
                    BE66740C6C33C30A382CCBC529D58FB7FA0BEED4C1350000000000006CA68FB7
                    FA0F7AFF73D37C74740CEC02C30A386CCBC5D7568F6CF58EAB6F1D5C03000000
                    0000C066F864AB57D0FF4ED37CF5E818D825861530CA7271F3EAA7AA2757FF70
                    700D000000000000EBE92FAB5FAE5EDC345F393A06769161058CB65C7C7DF533
                    D513AB6F195C030000000000C07AF8747546F5DB4DF3E747C7C02E33AC8075B1
                    7A45C8C3AB2755FF74700D00000000000063BCAF7A66F5EAA6F9AAD131806105
                    AC9FE5E24875BF56038BD3C7C60000000000007048CE6E7543C55B9BE663A363
                    806B1956C03A5B2EEE5C3DA1FA57D5CD07D7000000000000B0BFAEAC5E563DAB
                    69FEF0E818E0FA1956C026582E6E57FD7CF56FAABF3FB8060000000000809BE6
                    6FAB1754CF6F9A2F1A1D03DC30C30AD824CBC5375453AB5B2CEE383606000000
                    000080137441F5ACEAA54DF36747C700C7C7B00236D172714AF543D593AA7B0D
                    AE010000000000E086BDA33AA3FA83A6F9E8E818E0C41856C0A65B2EEE5D3DB1
                    FAE1FC990600000000005817C7AAD7566734CDEF181D039C3C87B0B02D968B6F
                    AF1E5BFDABEA56836B00000000000076D5E5D5CBAAE734CD1F1F1D03DC748615
                    B06D968B5B563F5AFD74F53D836B00000000000076C59F542FAC5EDD347F6E74
                    0CB07F0C2B609B2D1777AA1E5D3DAABACDE01A0000000000806D7371F5D2EACC
                    A6F9A3A3638083615801BB60B9F8BAEAA1AD6EB178E0E01A0000000000804D77
                    6EABDB29FEA069FEC2E818E0601956C0AE592E4EAD7EAAFA89EA76836B000000
                    00000036C545D58BAB1735CD9F181D031C1EC30AD855CBC5D7563FD0EA168BEF
                    CFF7010000000000C097BBA67A63ABDB29CE6E9AAF1ADC030CE02015A8E5E25B
                    AA9F6C7593C5B70CAE01000000000018EDD3D58BAA1737CD9F1E1D038C655801
                    5C6BB938A55A548F6E759BC5D78D0D02000000000038345FA8CEAECEACE6A6F9
                    E8E01E604D185600D76FB9F89FAA1FAC7EAC7A50F5B56383000000000000F6DD
                    55D539D52BABD735CD7F37B80758438615C08D5B2EBEB1FAA156238BEFABBE66
                    6C100000000000C049BBBAFAE3EAF7AAB39AE6CB06F7006BCEB0023831CBC56D
                    AA1F6E35B2784075B3B14100000000000037EA68F5E656638AD736CD970CEE01
                    3688610570F2968BDB560F6B35B2F8DE7CA7000000000000EBE358F5D656638A
                    DF6F9AFF666C0EB0A91C8202FB63B9B87DF523AD4616DF33B8060000000000D8
                    5DE755AFAC5EDD345F343A06D87C8615C0FE5B2EBEB9FAD156238B7B0EAE0100
                    00000000B6DF3B5BDD4CF1AAA6F92F47C700DBC5B0023858CBC53FACFEF9DECF
                    A2BAD5D8200000000000600B5C5ECDD51F55E734CD7F35B807D8628615C0E159
                    2EBEA6D50D16DFDF6A6871B7B1410000000000C006795FAB21C51BAB7735CD57
                    0FEE017684610530CE7271BBEA41AD86168BEA1BC7060100000000006BE46FBB
                    F6568AB969BE68700FB0A30C2B80F5B05C9C52DDA36B6FB3F8CE7C4701000000
                    00C02E3956BDA76B6FA57877D37C746C1280434B605D2D17B76D758BC5F7B7BA
                    D5E2366383000000000080037071754EAB21C5394DF3DF0CEE01F80A8615C0FA
                    5BDD6671F7EAFBAAFB54F7AE6E3DB409000000000038199755EFA8DE5E9D5BBD
                    D7AD14C0BA33AC0036CF7271B3EACEAD46165FFCB9E3D0260000000000E0FA7C
                    A2D588E28B3F1F6E9AAF199B0470620C2B80EDB05CDCBED54D165F1C5ADCADFA
                    9AA14D0000000000B05BAEAEDED7B5238A7734CD178E4D02B8E90C2B80EDB45C
                    DCB2BA47D70E2DEE5DDD6A681300000000006C97CBBBF6B51EE7557FDA345F31
                    360960FF195600BBE12B5F1F72EFEAD4A14D0000000000B0592EE8DA2185D77A
                    003BC3B002D85DCBC5DFABFE49755A75D7BDCFD372B3050000000000BBEDF2EA
                    FCEBFC7CA0FA60D3FC3F8656010C625801705DCBC591EA9BBB7664F1C5D1C53F
                    AE4E1958060000000000FBED68F5D1AE1D4F7C7148F1174DF3B1916100EBC4B0
                    02E0782C175F57DDA9AFBCDDE27623B30000000000E0385DD457DE42F191A6F9
                    0B43AB0036806105C04DB15CFCCFAD861677AEBEADBAC3DEE7B755B71E170600
                    000000C00EBAACFAB3EACFF73EFFACFA70F581A6F96F0676016C34C30A8083B2
                    5CDCBAD5D0E20E7DE5E8E2DBAA6F18540600000000C066FA6CD70E26AE3BA0F8
                    F3EACF9BE6CB8695016C31C30A8011968B23D56DBAFED1C51DAA6FC9F0020000
                    000060D77CB6FA745F7AE3C49F5FE7F392A6F9D8A036809D655801B0AE968B5B
                    B41A5F7CD3097CFEBD21AD00000000007CB9BFAB2EA92EBE91CF6BFF799A3F3F
                    2615801B625801B04D968B9B577FBFAF1C5DDCA6BA4575F3EAEB8EF3F3C6FE3F
                    A71CD2BF1500000000C07E395A7DA1BAF2063E6FE87FFBF2CFCFF7E5E388D5E7
                    DF36CD571ED6BF140007EBFF039B5B3074149671140000000049454E44AE4260
                    82}
                  Properties.FitMode = ifmProportionalStretch
                  Properties.GraphicTransparency = gtTransparent
                  Properties.ShowFocusRect = False
                  Style.BorderStyle = ebsNone
                  TabOrder = 3
                  Transparent = True
                  Height = 35
                  Width = 35
                end
              end
              object CurvyPanel2: TCurvyPanel
                Left = 415
                Top = 8
                Width = 391
                Height = 105
                Caption = ''
                Color = clWhite
                StyleElements = []
                TabOrder = 1
                object Panel12: TPanel
                  Left = 0
                  Top = 0
                  Width = 391
                  Height = 5
                  Align = alTop
                  BevelOuter = bvNone
                  Color = 2631878
                  ParentBackground = False
                  TabOrder = 0
                  StyleElements = []
                end
                object CurvyPanel4: TCurvyPanel
                  Left = 0
                  Top = 0
                  Width = 391
                  Height = 105
                  Caption = ''
                  Color = clWhite
                  StyleElements = []
                  TabOrder = 1
                  DesignSize = (
                    391
                    105)
                  object Label4: TLabel
                    Left = 3
                    Top = 11
                    Width = 151
                    Height = 21
                    AutoSize = False
                    Caption = 'Despesas'
                    Color = 15395562
                    Font.Charset = ANSI_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -15
                    Font.Name = 'Segoe UI Semibold'
                    Font.Style = [fsBold]
                    ParentColor = False
                    ParentFont = False
                    Transparent = True
                    StyleElements = []
                  end
                  object lbDespesaMesAtual: TLabel
                    Left = 3
                    Top = 27
                    Width = 171
                    Height = 25
                    AutoSize = False
                    Caption = 'R$ 1.322.358,45'
                    Color = 15395562
                    Font.Charset = ANSI_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -19
                    Font.Name = 'Segoe UI'
                    Font.Style = [fsBold]
                    ParentColor = False
                    ParentFont = False
                    Transparent = True
                    StyleElements = []
                  end
                  object Label5: TLabel
                    Left = 3
                    Top = 62
                    Width = 30
                    Height = 20
                    Alignment = taRightJustify
                    AutoSize = False
                    Caption = 'M-1'
                    Color = clWhite
                    Font.Charset = ANSI_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -15
                    Font.Name = 'Segoe UI Semibold'
                    Font.Style = [fsBold]
                    ParentColor = False
                    ParentFont = False
                    Transparent = True
                    StyleElements = []
                  end
                  object lbDespMesAnterior: TLabel
                    Left = 45
                    Top = 62
                    Width = 110
                    Height = 20
                    Alignment = taRightJustify
                    AutoSize = False
                    Caption = 'R$ 2. 895.321,22'
                    Color = clWhite
                    Font.Charset = ANSI_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -15
                    Font.Name = 'Segoe UI'
                    Font.Style = []
                    ParentColor = False
                    ParentFont = False
                    Transparent = True
                    StyleElements = []
                  end
                  object lbVariacaoDespMesAnterior: TLabel
                    Left = 206
                    Top = 61
                    Width = 110
                    Height = 20
                    Alignment = taRightJustify
                    Anchors = [akTop, akRight]
                    AutoSize = False
                    Caption = '+R$ 365.690,00'
                    Color = clWhite
                    Font.Charset = ANSI_CHARSET
                    Font.Color = 2631878
                    Font.Height = -15
                    Font.Name = 'Segoe UI'
                    Font.Style = []
                    ParentColor = False
                    ParentFont = False
                    Transparent = True
                    StyleElements = []
                  end
                  object lbVariacaoDespPercentualMesAnterior: TLabel
                    Left = 327
                    Top = 61
                    Width = 59
                    Height = 17
                    Alignment = taRightJustify
                    Anchors = [akTop, akRight]
                    AutoSize = False
                    Caption = '(+3,541%)'
                    Color = clWhite
                    Font.Charset = ANSI_CHARSET
                    Font.Color = 2631878
                    Font.Height = -13
                    Font.Name = 'Segoe UI'
                    Font.Style = []
                    ParentColor = False
                    ParentFont = False
                    Transparent = True
                    StyleElements = []
                    ExplicitLeft = 289
                  end
                  object Label7: TLabel
                    Left = 3
                    Top = 84
                    Width = 30
                    Height = 20
                    Alignment = taRightJustify
                    AutoSize = False
                    Caption = 'A-1'
                    Color = clWhite
                    Font.Charset = ANSI_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -15
                    Font.Name = 'Segoe UI Semibold'
                    Font.Style = [fsBold]
                    ParentColor = False
                    ParentFont = False
                    Transparent = True
                    StyleElements = []
                  end
                  object lbDespAnoAnterior: TLabel
                    Left = 45
                    Top = 84
                    Width = 110
                    Height = 20
                    Alignment = taRightJustify
                    AutoSize = False
                    Caption = 'R$ 2. 895.321,22'
                    Color = clWhite
                    Font.Charset = ANSI_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -15
                    Font.Name = 'Segoe UI'
                    Font.Style = []
                    ParentColor = False
                    ParentFont = False
                    Transparent = True
                    StyleElements = []
                  end
                  object lbVariacaoDespAnoAnterior: TLabel
                    Left = 206
                    Top = 83
                    Width = 110
                    Height = 20
                    Alignment = taRightJustify
                    Anchors = [akTop, akRight]
                    AutoSize = False
                    Caption = '+R$ 365.690,00'
                    Color = clWhite
                    Font.Charset = ANSI_CHARSET
                    Font.Color = 2631878
                    Font.Height = -15
                    Font.Name = 'Segoe UI'
                    Font.Style = []
                    ParentColor = False
                    ParentFont = False
                    Transparent = True
                    StyleElements = []
                  end
                  object lbVariacaoDespPercentualAnoAnterior: TLabel
                    Left = 326
                    Top = 83
                    Width = 59
                    Height = 17
                    Alignment = taRightJustify
                    Anchors = [akTop, akRight]
                    AutoSize = False
                    Caption = '(+3,541%)'
                    Color = clWhite
                    Font.Charset = ANSI_CHARSET
                    Font.Color = 2631878
                    Font.Height = -13
                    Font.Name = 'Segoe UI'
                    Font.Style = []
                    ParentColor = False
                    ParentFont = False
                    Transparent = True
                    StyleElements = []
                    ExplicitLeft = 288
                  end
                  object Label9: TLabel
                    Left = 188
                    Top = 42
                    Width = 200
                    Height = 16
                    AutoSize = False
                    Caption = #916' Varia'#231#245'es m'#234's ant. / ano ant.'
                    Color = clWhite
                    Font.Charset = ANSI_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -12
                    Font.Name = 'Segoe UI Semibold'
                    Font.Style = [fsBold]
                    ParentColor = False
                    ParentFont = False
                    Transparent = True
                    StyleElements = []
                  end
                  object imgDespesaMes: TcxImage
                    Left = 187
                    Top = 61
                    Anchors = [akTop, akRight]
                    Picture.Data = {
                      0D546478536D617274496D61676589504E470D0A1A0A0000000D494844520000
                      0009000000090806000000E0910610000004AF69545874584D4C3A636F6D2E61
                      646F62652E786D7000000000003C3F787061636B657420626567696E3D22EFBB
                      BF222069643D2257354D304D7043656869487A7265537A4E54637A6B63396422
                      3F3E0A3C783A786D706D65746120786D6C6E733A783D2261646F62653A6E733A
                      6D6574612F2220783A786D70746B3D22584D5020436F726520352E352E30223E
                      0A203C7264663A52444620786D6C6E733A7264663D22687474703A2F2F777777
                      2E77332E6F72672F313939392F30322F32322D7264662D73796E7461782D6E73
                      23223E0A20203C7264663A4465736372697074696F6E207264663A61626F7574
                      3D22220A20202020786D6C6E733A657869663D22687474703A2F2F6E732E6164
                      6F62652E636F6D2F657869662F312E302F220A20202020786D6C6E733A746966
                      663D22687474703A2F2F6E732E61646F62652E636F6D2F746966662F312E302F
                      220A20202020786D6C6E733A70686F746F73686F703D22687474703A2F2F6E73
                      2E61646F62652E636F6D2F70686F746F73686F702F312E302F220A2020202078
                      6D6C6E733A786D703D22687474703A2F2F6E732E61646F62652E636F6D2F7861
                      702F312E302F220A20202020786D6C6E733A786D704D4D3D22687474703A2F2F
                      6E732E61646F62652E636F6D2F7861702F312E302F6D6D2F220A20202020786D
                      6C6E733A73744576743D22687474703A2F2F6E732E61646F62652E636F6D2F78
                      61702F312E302F73547970652F5265736F757263654576656E7423220A202020
                      657869663A506978656C5844696D656E73696F6E3D2239220A20202065786966
                      3A506978656C5944696D656E73696F6E3D2239220A202020657869663A436F6C
                      6F7253706163653D2231220A202020746966663A496D61676557696474683D22
                      39220A202020746966663A496D6167654C656E6774683D2239220A2020207469
                      66663A5265736F6C7574696F6E556E69743D2232220A202020746966663A5852
                      65736F6C7574696F6E3D2237322F31220A202020746966663A595265736F6C75
                      74696F6E3D2237322F31220A20202070686F746F73686F703A436F6C6F724D6F
                      64653D2233220A20202070686F746F73686F703A49434350726F66696C653D22
                      735247422049454336313936362D322E31220A202020786D703A4D6F64696679
                      446174653D22323032352D31302D30375431373A33303A35302D30333A303022
                      0A202020786D703A4D65746164617461446174653D22323032352D31302D3037
                      5431373A33303A35302D30333A3030223E0A2020203C786D704D4D3A48697374
                      6F72793E0A202020203C7264663A5365713E0A20202020203C7264663A6C690A
                      20202020202073744576743A616374696F6E3D2270726F6475636564220A2020
                      2020202073744576743A736F6674776172654167656E743D22416666696E6974
                      792044657369676E657220312E31302E34220A20202020202073744576743A77
                      68656E3D22323032352D31302D30375431373A33303A35302D30333A3030222F
                      3E0A202020203C2F7264663A5365713E0A2020203C2F786D704D4D3A48697374
                      6F72793E0A20203C2F7264663A4465736372697074696F6E3E0A203C2F726466
                      3A5244463E0A3C2F783A786D706D6574613E0A3C3F787061636B657420656E64
                      3D2272223F3ED704F3F30000018169434350735247422049454336313936362D
                      322E31000028917591BF4B425114C73F9A619461504443834435695881D4D2A0
                      F40BAA410DB25AF4F92B507BBCA784B406AD4241D4D2AFA1FE825A83E620288A
                      209A6B2D6A29799DA78111792EE79ECFFDDE7B0EF79E0BD67046C9EA362F6473
                      792D38E9772D44165DF6179AB1D34127B6A8A2ABB3A1893075EDE30E8B196F3C
                      66ADFAE7FEB596784257C0D2243CA6A85A5E784A78662DAF9ABC2DDCA1A4A371
                      E15361B7261714BE35F558959F4D4E55F9CB642D1C0C80B54DD895FAC5B15FAC
                      A4B5ACB0BC9CDE6CA6A0FCDCC77C8923919B0F49EC11EF4627C8247E5C4C334E
                      001F838CCAECC3C31003B2A24EBEB7923FC7AAE42A32AB14D15821459A3C6E51
                      0B523D2131297A424686A2D9FFBF7DD593C343D5EA0E3F343E19C65B1FD8B7A0
                      5C328CCF43C3281F41C3235CE46AF9AB0730F22E7AA9A6F5EE837303CE2E6B5A
                      6C07CE37A1EB418D6AD18AD4206E4D26E1F5045A23D07E0DCD4BD59EFDEC737C
                      0FE175F9AA2BD8DD837E39EF5CFE06259167C8A25346A3000000097048597300
                      000B1300000B1301009A9C18000000804944415418957DCCC10DC1600040E1EF
                      2F57CE2660018205FE18A30C201C99802D3A8483748026D8A01338BB0B174D5A
                      52EFF8F2F2823A59EC6081B3347F563AD1648B133675196A97014AF4F0C0489A
                      DFBF4FC74F007D1C9AA72CCE5034CEBC3097E697208B01578CFD72C334C1AA25
                      80099609762D41C5BE8B35867FA2F20D7A3D1746722C81B80000000049454E44
                      AE426082}
                    TabOrder = 0
                    Height = 20
                    Width = 16
                  end
                  object Panel15: TPanel
                    Left = 0
                    Top = 0
                    Width = 391
                    Height = 5
                    Align = alTop
                    BevelOuter = bvNone
                    Color = 2631878
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = 2631878
                    Font.Height = -11
                    Font.Name = 'MS Sans Serif'
                    Font.Style = []
                    ParentBackground = False
                    ParentFont = False
                    TabOrder = 1
                    StyleElements = []
                  end
                  object imgDespesaAno: TcxImage
                    Left = 187
                    Top = 83
                    Anchors = [akTop, akRight]
                    Picture.Data = {
                      0D546478536D617274496D61676589504E470D0A1A0A0000000D494844520000
                      0009000000090806000000E0910610000004AF69545874584D4C3A636F6D2E61
                      646F62652E786D7000000000003C3F787061636B657420626567696E3D22EFBB
                      BF222069643D2257354D304D7043656869487A7265537A4E54637A6B63396422
                      3F3E0A3C783A786D706D65746120786D6C6E733A783D2261646F62653A6E733A
                      6D6574612F2220783A786D70746B3D22584D5020436F726520352E352E30223E
                      0A203C7264663A52444620786D6C6E733A7264663D22687474703A2F2F777777
                      2E77332E6F72672F313939392F30322F32322D7264662D73796E7461782D6E73
                      23223E0A20203C7264663A4465736372697074696F6E207264663A61626F7574
                      3D22220A20202020786D6C6E733A657869663D22687474703A2F2F6E732E6164
                      6F62652E636F6D2F657869662F312E302F220A20202020786D6C6E733A746966
                      663D22687474703A2F2F6E732E61646F62652E636F6D2F746966662F312E302F
                      220A20202020786D6C6E733A70686F746F73686F703D22687474703A2F2F6E73
                      2E61646F62652E636F6D2F70686F746F73686F702F312E302F220A2020202078
                      6D6C6E733A786D703D22687474703A2F2F6E732E61646F62652E636F6D2F7861
                      702F312E302F220A20202020786D6C6E733A786D704D4D3D22687474703A2F2F
                      6E732E61646F62652E636F6D2F7861702F312E302F6D6D2F220A20202020786D
                      6C6E733A73744576743D22687474703A2F2F6E732E61646F62652E636F6D2F78
                      61702F312E302F73547970652F5265736F757263654576656E7423220A202020
                      657869663A506978656C5844696D656E73696F6E3D2239220A20202065786966
                      3A506978656C5944696D656E73696F6E3D2239220A202020657869663A436F6C
                      6F7253706163653D2231220A202020746966663A496D61676557696474683D22
                      39220A202020746966663A496D6167654C656E6774683D2239220A2020207469
                      66663A5265736F6C7574696F6E556E69743D2232220A202020746966663A5852
                      65736F6C7574696F6E3D2237322F31220A202020746966663A595265736F6C75
                      74696F6E3D2237322F31220A20202070686F746F73686F703A436F6C6F724D6F
                      64653D2233220A20202070686F746F73686F703A49434350726F66696C653D22
                      735247422049454336313936362D322E31220A202020786D703A4D6F64696679
                      446174653D22323032352D31302D30375431373A33303A35302D30333A303022
                      0A202020786D703A4D65746164617461446174653D22323032352D31302D3037
                      5431373A33303A35302D30333A3030223E0A2020203C786D704D4D3A48697374
                      6F72793E0A202020203C7264663A5365713E0A20202020203C7264663A6C690A
                      20202020202073744576743A616374696F6E3D2270726F6475636564220A2020
                      2020202073744576743A736F6674776172654167656E743D22416666696E6974
                      792044657369676E657220312E31302E34220A20202020202073744576743A77
                      68656E3D22323032352D31302D30375431373A33303A35302D30333A3030222F
                      3E0A202020203C2F7264663A5365713E0A2020203C2F786D704D4D3A48697374
                      6F72793E0A20203C2F7264663A4465736372697074696F6E3E0A203C2F726466
                      3A5244463E0A3C2F783A786D706D6574613E0A3C3F787061636B657420656E64
                      3D2272223F3ED704F3F30000018169434350735247422049454336313936362D
                      322E31000028917591BF4B425114C73F9A619461504443834435695881D4D2A0
                      F40BAA410DB25AF4F92B507BBCA784B406AD4241D4D2AFA1FE825A83E620288A
                      209A6B2D6A29799DA78111792EE79ECFFDDE7B0EF79E0BD67046C9EA362F6473
                      792D38E9772D44165DF6179AB1D34127B6A8A2ABB3A1893075EDE30E8B196F3C
                      66ADFAE7FEB596784257C0D2243CA6A85A5E784A78662DAF9ABC2DDCA1A4A371
                      E15361B7261714BE35F558959F4D4E55F9CB642D1C0C80B54DD895FAC5B15FAC
                      A4B5ACB0BC9CDE6CA6A0FCDCC77C8923919B0F49EC11EF4627C8247E5C4C334E
                      001F838CCAECC3C31003B2A24EBEB7923FC7AAE42A32AB14D15821459A3C6E51
                      0B523D2131297A424686A2D9FFBF7DD593C343D5EA0E3F343E19C65B1FD8B7A0
                      5C328CCF43C3281F41C3235CE46AF9AB0730F22E7AA9A6F5EE837303CE2E6B5A
                      6C07CE37A1EB418D6AD18AD4206E4D26E1F5045A23D07E0DCD4BD59EFDEC737C
                      0FE175F9AA2BD8DD837E39EF5CFE06259167C8A25346A3000000097048597300
                      000B1300000B1301009A9C18000000804944415418957DCCC10DC1600040E1EF
                      2F57CE2660018205FE18A30C201C99802D3A8483748026D8A01338BB0B174D5A
                      52EFF8F2F2823A59EC6081B3347F563AD1648B133675196A97014AF4F0C0489A
                      DFBF4FC74F007D1C9AA72CCE5034CEBC3097E697208B01578CFD72C334C1AA25
                      80099609762D41C5BE8B35867FA2F20D7A3D1746722C81B80000000049454E44
                      AE426082}
                    TabOrder = 2
                    Height = 20
                    Width = 16
                  end
                  object cxImage1: TcxImage
                    Left = 350
                    Top = 8
                    Picture.Data = {
                      0D546478536D617274496D61676589504E470D0A1A0A0000000D494844520000
                      00230000002308060000001ED9B3590000018269434350735247422049454336
                      313936362D322E31000028917591BB4B03411087BF244A244622A8606111255A
                      19F101411B8B048D825A24117C35C9998790C7711791602BD80614441B5F85FE
                      05DA0AD682A02882586BAB68A3E19C4B8488985966E7DBDFEE0CBBB3608DA495
                      8C5ED70F996C5E0B05FDEEB9F905B7FD050776DA18A633AAE8EA74783C424DFB
                      B8C362C61BAF59ABF6B97FAD7139AE2B6069101E55542D2F3C213CB596574DDE
                      166E5552D165E153E15E4D2E287C6BEAB10A3F9B9CACF097C95A2414006BB3B0
                      3BF98B63BF584969196179399E4C7A55F9B98FF912673C3B1B96D825DE814E88
                      207EDC4C3246001F038CC8ECC3CB207DB2A2467E7F397F869CE42A32AB14D058
                      21498A3CBDA2AE4AF5B8C484E87119690A66FFFFF6554F0C0D56AA3BFD50FF64
                      186FDD60DF8252D1303E0F0DA37404B647B8C856F3730730FC2E7AB1AA79F6C1
                      B5016797552DB603E79BD0FEA046B56859B2895B1309783D81A67968B906C762
                      A5673FFB1CDF43645DBEEA0A76F7A047CEBB96BE01B2196808F088EC99000000
                      097048597300002E2300002E230178A53F7600000352494441545885CDD84B68
                      1D551807F0DF4D438B687D150B568B28D21E51C41617E1D882A9145C68565AD4
                      EA525B1531D9C59D88200A9AA855B1229428BA50109A0A8AF101CA8020F8423C
                      A15085A2680B2A4AADA8312E66AECE9DDEB977129BDAFFEABBDFF3CFF9CEE39B
                      DBB244C84218C68388352EBFE3558CC7940EC2E0121169E119ACEFE1B61CB760
                      00372B84A5C02938AFA1EF256D6149C8C4947EC5130B8D6B3575CC425885ED58
                      8117624ADF35885987AD78082B6BDC3E8D295D41C395C942D888CFF1381EC117
                      59089B1B847E831B7A10E9405F32590823781FE796D46763260B617B8FB853B1
                      0F573721428FD3549C887BF198EEED5C8E17B3102EC60331A5F98644BEC285DD
                      6A765D992C84413C89891A2265DC8FA92C84152522D33544EEC66B15DD5C2D99
                      2C8495D85B0456F1253EEEA2BF156F6521AC2D880C772312537A5ABE62654CB7
                      858E3615C9F6E1F22EC9DE966FC63FF112AEAFD837E34035678508BC8771DC86
                      77B1ABEDF44F0BB210D6E0239D1BB58DE771674CE98FC277191E95EFA97E2813
                      E989729BEEAB21328EDBDB4420A63417531AC53DF8EB7810A99239BD62FB0DDB
                      624A0F974F4A1931A55D18C191FF4AA44AE6591C2AE4AF311C537AA55F8298D2
                      EBD884FD85EA67EC5828112AC7B63896EBF049DD6AD4A1B89736607F4CE99785
                      1239E9D0822C84D3709D7CFE68FC781E07CC6316D331A523AD2C840BF00E2E3A
                      8124AA38802D0398FC9F8928EA4F0E624B49398B9F0A790DD62E41E183F8B690
                      CFF4EF683A3CA0F37E198D290DC594861CFB86F4C20F0BF09D2ED5182DE9CFA8
                      7BB5CF91BF43BD701463581D535A85D5C5EFA37DE26E2CF21F83561642F93E19
                      C18F784AF7C7B28D395C1553FAB06AC84218C20758D623FE33F95470967C42E8
                      4A665EB3A33D19531AAB3366214CE86C411D3AEA55DBD4F48E79A38FFDCD8679
                      3AEA2DF653E5501FFBF78B49BA58321BFAD8372E266995CCCB98691037D69E79
                      AB28F4B5FBA98499A25E2D99A998D256ECE893E832ECC942E898818ADF7B7069
                      9FF83B8A3A536565D74F9598D2EE2C846DB8A647C29BB0290B61AFFCE65E2FBF
                      1ACEEF436426A6F45C374395CC9559086DF9709FA48AC27735F02BE37016C2B5
                      ED7A25FD7C2B0B21E9FDD7C589C26CFBD53E193031209F7D77CAFBBEA051F338
                      A03D5CEDC4EEBF01F113F4A5EAABD8D80000000049454E44AE426082}
                    Properties.FitMode = ifmProportionalStretch
                    Properties.GraphicTransparency = gtTransparent
                    Properties.ShowFocusRect = False
                    Style.BorderStyle = ebsNone
                    TabOrder = 3
                    Transparent = True
                    Height = 35
                    Width = 35
                  end
                end
              end
              object CurvyPanel3: TCurvyPanel
                Left = 827
                Top = 8
                Width = 391
                Height = 105
                Caption = ''
                Color = clWhite
                StyleElements = []
                TabOrder = 2
                object Panel14: TPanel
                  Left = 0
                  Top = 0
                  Width = 391
                  Height = 5
                  Align = alTop
                  BevelOuter = bvNone
                  Color = 3308846
                  ParentBackground = False
                  TabOrder = 0
                  StyleElements = []
                end
                object CurvyPanel5: TCurvyPanel
                  Left = 0
                  Top = 0
                  Width = 391
                  Height = 105
                  Caption = ''
                  Color = clWhite
                  StyleElements = []
                  TabOrder = 1
                  DesignSize = (
                    391
                    105)
                  object Label10: TLabel
                    Left = 9
                    Top = 8
                    Width = 151
                    Height = 21
                    AutoSize = False
                    Caption = 'Resultado'
                    Color = 15395562
                    Font.Charset = ANSI_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -15
                    Font.Name = 'Segoe UI Semibold'
                    Font.Style = [fsBold]
                    ParentColor = False
                    ParentFont = False
                    Transparent = True
                    StyleElements = []
                  end
                  object lbResultadoMesAtual: TLabel
                    Left = 9
                    Top = 27
                    Width = 171
                    Height = 25
                    AutoSize = False
                    Caption = 'R$ 1.322.358,45'
                    Color = 15395562
                    Font.Charset = ANSI_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -19
                    Font.Name = 'Segoe UI'
                    Font.Style = [fsBold]
                    ParentColor = False
                    ParentFont = False
                    Transparent = True
                    StyleElements = []
                  end
                  object Label11: TLabel
                    Left = 9
                    Top = 62
                    Width = 30
                    Height = 20
                    Alignment = taRightJustify
                    AutoSize = False
                    Caption = 'M-1'
                    Color = clWhite
                    Font.Charset = ANSI_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -15
                    Font.Name = 'Segoe UI Semibold'
                    Font.Style = [fsBold]
                    ParentColor = False
                    ParentFont = False
                    Transparent = True
                    StyleElements = []
                  end
                  object lbResMesAnterior: TLabel
                    Left = 45
                    Top = 62
                    Width = 110
                    Height = 20
                    Alignment = taRightJustify
                    AutoSize = False
                    Caption = 'R$ 2. 895.321,22'
                    Color = clWhite
                    Font.Charset = ANSI_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -15
                    Font.Name = 'Segoe UI'
                    Font.Style = []
                    ParentColor = False
                    ParentFont = False
                    Transparent = True
                    StyleElements = []
                  end
                  object lbVariacaoResMesAnterior: TLabel
                    Left = 206
                    Top = 61
                    Width = 110
                    Height = 20
                    Alignment = taRightJustify
                    Anchors = [akTop, akRight]
                    AutoSize = False
                    Caption = '+R$ 365.690,00'
                    Color = clWhite
                    Font.Charset = ANSI_CHARSET
                    Font.Color = 2631878
                    Font.Height = -15
                    Font.Name = 'Segoe UI'
                    Font.Style = []
                    ParentColor = False
                    ParentFont = False
                    Transparent = True
                    StyleElements = []
                  end
                  object lbVariacaoResPercentualMesAnterior: TLabel
                    Left = 327
                    Top = 61
                    Width = 59
                    Height = 17
                    Alignment = taRightJustify
                    Anchors = [akTop, akRight]
                    AutoSize = False
                    Caption = '(+3,541%)'
                    Color = clWhite
                    Font.Charset = ANSI_CHARSET
                    Font.Color = 2631878
                    Font.Height = -13
                    Font.Name = 'Segoe UI'
                    Font.Style = []
                    ParentColor = False
                    ParentFont = False
                    Transparent = True
                    StyleElements = []
                    ExplicitLeft = 289
                  end
                  object Label12: TLabel
                    Left = 9
                    Top = 84
                    Width = 30
                    Height = 20
                    Alignment = taRightJustify
                    AutoSize = False
                    Caption = 'A-1'
                    Color = clWhite
                    Font.Charset = ANSI_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -15
                    Font.Name = 'Segoe UI Semibold'
                    Font.Style = [fsBold]
                    ParentColor = False
                    ParentFont = False
                    Transparent = True
                    StyleElements = []
                  end
                  object lbResAnoAnterior: TLabel
                    Left = 45
                    Top = 84
                    Width = 110
                    Height = 20
                    Alignment = taRightJustify
                    AutoSize = False
                    Caption = 'R$ 2. 895.321,22'
                    Color = clWhite
                    Font.Charset = ANSI_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -15
                    Font.Name = 'Segoe UI'
                    Font.Style = []
                    ParentColor = False
                    ParentFont = False
                    Transparent = True
                    StyleElements = []
                  end
                  object lbVariacaoResAnoAnterior: TLabel
                    Left = 206
                    Top = 83
                    Width = 110
                    Height = 20
                    Alignment = taRightJustify
                    Anchors = [akTop, akRight]
                    AutoSize = False
                    Caption = '+R$ 365.690,00'
                    Color = clWhite
                    Font.Charset = ANSI_CHARSET
                    Font.Color = 2631878
                    Font.Height = -15
                    Font.Name = 'Segoe UI'
                    Font.Style = []
                    ParentColor = False
                    ParentFont = False
                    Transparent = True
                    StyleElements = []
                  end
                  object lbVariacaoResPercentualAnoAnterior: TLabel
                    Left = 326
                    Top = 83
                    Width = 59
                    Height = 17
                    Alignment = taRightJustify
                    Anchors = [akTop, akRight]
                    AutoSize = False
                    Caption = '(+3,541%)'
                    Color = clWhite
                    Font.Charset = ANSI_CHARSET
                    Font.Color = 2631878
                    Font.Height = -13
                    Font.Name = 'Segoe UI'
                    Font.Style = []
                    ParentColor = False
                    ParentFont = False
                    Transparent = True
                    StyleElements = []
                    ExplicitLeft = 288
                  end
                  object Label13: TLabel
                    Left = 188
                    Top = 42
                    Width = 200
                    Height = 16
                    AutoSize = False
                    Caption = #916' Varia'#231#245'es m'#234's ant. / ano ant.'
                    Color = clWhite
                    Font.Charset = ANSI_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -12
                    Font.Name = 'Segoe UI Semibold'
                    Font.Style = [fsBold]
                    ParentColor = False
                    ParentFont = False
                    Transparent = True
                    StyleElements = []
                  end
                  object imgResultadoMes: TcxImage
                    Left = 187
                    Top = 61
                    Anchors = [akTop, akRight]
                    Picture.Data = {
                      0D546478536D617274496D61676589504E470D0A1A0A0000000D494844520000
                      0009000000090806000000E0910610000004AF69545874584D4C3A636F6D2E61
                      646F62652E786D7000000000003C3F787061636B657420626567696E3D22EFBB
                      BF222069643D2257354D304D7043656869487A7265537A4E54637A6B63396422
                      3F3E0A3C783A786D706D65746120786D6C6E733A783D2261646F62653A6E733A
                      6D6574612F2220783A786D70746B3D22584D5020436F726520352E352E30223E
                      0A203C7264663A52444620786D6C6E733A7264663D22687474703A2F2F777777
                      2E77332E6F72672F313939392F30322F32322D7264662D73796E7461782D6E73
                      23223E0A20203C7264663A4465736372697074696F6E207264663A61626F7574
                      3D22220A20202020786D6C6E733A657869663D22687474703A2F2F6E732E6164
                      6F62652E636F6D2F657869662F312E302F220A20202020786D6C6E733A746966
                      663D22687474703A2F2F6E732E61646F62652E636F6D2F746966662F312E302F
                      220A20202020786D6C6E733A70686F746F73686F703D22687474703A2F2F6E73
                      2E61646F62652E636F6D2F70686F746F73686F702F312E302F220A2020202078
                      6D6C6E733A786D703D22687474703A2F2F6E732E61646F62652E636F6D2F7861
                      702F312E302F220A20202020786D6C6E733A786D704D4D3D22687474703A2F2F
                      6E732E61646F62652E636F6D2F7861702F312E302F6D6D2F220A20202020786D
                      6C6E733A73744576743D22687474703A2F2F6E732E61646F62652E636F6D2F78
                      61702F312E302F73547970652F5265736F757263654576656E7423220A202020
                      657869663A506978656C5844696D656E73696F6E3D2239220A20202065786966
                      3A506978656C5944696D656E73696F6E3D2239220A202020657869663A436F6C
                      6F7253706163653D2231220A202020746966663A496D61676557696474683D22
                      39220A202020746966663A496D6167654C656E6774683D2239220A2020207469
                      66663A5265736F6C7574696F6E556E69743D2232220A202020746966663A5852
                      65736F6C7574696F6E3D2237322F31220A202020746966663A595265736F6C75
                      74696F6E3D2237322F31220A20202070686F746F73686F703A436F6C6F724D6F
                      64653D2233220A20202070686F746F73686F703A49434350726F66696C653D22
                      735247422049454336313936362D322E31220A202020786D703A4D6F64696679
                      446174653D22323032352D31302D30375431373A33303A35302D30333A303022
                      0A202020786D703A4D65746164617461446174653D22323032352D31302D3037
                      5431373A33303A35302D30333A3030223E0A2020203C786D704D4D3A48697374
                      6F72793E0A202020203C7264663A5365713E0A20202020203C7264663A6C690A
                      20202020202073744576743A616374696F6E3D2270726F6475636564220A2020
                      2020202073744576743A736F6674776172654167656E743D22416666696E6974
                      792044657369676E657220312E31302E34220A20202020202073744576743A77
                      68656E3D22323032352D31302D30375431373A33303A35302D30333A3030222F
                      3E0A202020203C2F7264663A5365713E0A2020203C2F786D704D4D3A48697374
                      6F72793E0A20203C2F7264663A4465736372697074696F6E3E0A203C2F726466
                      3A5244463E0A3C2F783A786D706D6574613E0A3C3F787061636B657420656E64
                      3D2272223F3ED704F3F30000018169434350735247422049454336313936362D
                      322E31000028917591BF4B425114C73F9A619461504443834435695881D4D2A0
                      F40BAA410DB25AF4F92B507BBCA784B406AD4241D4D2AFA1FE825A83E620288A
                      209A6B2D6A29799DA78111792EE79ECFFDDE7B0EF79E0BD67046C9EA362F6473
                      792D38E9772D44165DF6179AB1D34127B6A8A2ABB3A1893075EDE30E8B196F3C
                      66ADFAE7FEB596784257C0D2243CA6A85A5E784A78662DAF9ABC2DDCA1A4A371
                      E15361B7261714BE35F558959F4D4E55F9CB642D1C0C80B54DD895FAC5B15FAC
                      A4B5ACB0BC9CDE6CA6A0FCDCC77C8923919B0F49EC11EF4627C8247E5C4C334E
                      001F838CCAECC3C31003B2A24EBEB7923FC7AAE42A32AB14D15821459A3C6E51
                      0B523D2131297A424686A2D9FFBF7DD593C343D5EA0E3F343E19C65B1FD8B7A0
                      5C328CCF43C3281F41C3235CE46AF9AB0730F22E7AA9A6F5EE837303CE2E6B5A
                      6C07CE37A1EB418D6AD18AD4206E4D26E1F5045A23D07E0DCD4BD59EFDEC737C
                      0FE175F9AA2BD8DD837E39EF5CFE06259167C8A25346A3000000097048597300
                      000B1300000B1301009A9C18000000804944415418957DCCC10DC1600040E1EF
                      2F57CE2660018205FE18A30C201C99802D3A8483748026D8A01338BB0B174D5A
                      52EFF8F2F2823A59EC6081B3347F563AD1648B133675196A97014AF4F0C0489A
                      DFBF4FC74F007D1C9AA72CCE5034CEBC3097E697208B01578CFD72C334C1AA25
                      80099609762D41C5BE8B35867FA2F20D7A3D1746722C81B80000000049454E44
                      AE426082}
                    TabOrder = 0
                    Height = 20
                    Width = 16
                  end
                  object Panel16: TPanel
                    Left = 0
                    Top = 0
                    Width = 391
                    Height = 5
                    Align = alTop
                    BevelOuter = bvNone
                    Color = 1344182
                    ParentBackground = False
                    TabOrder = 1
                    StyleElements = []
                  end
                  object imgResultadoAno: TcxImage
                    Left = 187
                    Top = 83
                    Anchors = [akTop, akRight]
                    Picture.Data = {
                      0D546478536D617274496D61676589504E470D0A1A0A0000000D494844520000
                      0009000000090806000000E0910610000004AF69545874584D4C3A636F6D2E61
                      646F62652E786D7000000000003C3F787061636B657420626567696E3D22EFBB
                      BF222069643D2257354D304D7043656869487A7265537A4E54637A6B63396422
                      3F3E0A3C783A786D706D65746120786D6C6E733A783D2261646F62653A6E733A
                      6D6574612F2220783A786D70746B3D22584D5020436F726520352E352E30223E
                      0A203C7264663A52444620786D6C6E733A7264663D22687474703A2F2F777777
                      2E77332E6F72672F313939392F30322F32322D7264662D73796E7461782D6E73
                      23223E0A20203C7264663A4465736372697074696F6E207264663A61626F7574
                      3D22220A20202020786D6C6E733A657869663D22687474703A2F2F6E732E6164
                      6F62652E636F6D2F657869662F312E302F220A20202020786D6C6E733A746966
                      663D22687474703A2F2F6E732E61646F62652E636F6D2F746966662F312E302F
                      220A20202020786D6C6E733A70686F746F73686F703D22687474703A2F2F6E73
                      2E61646F62652E636F6D2F70686F746F73686F702F312E302F220A2020202078
                      6D6C6E733A786D703D22687474703A2F2F6E732E61646F62652E636F6D2F7861
                      702F312E302F220A20202020786D6C6E733A786D704D4D3D22687474703A2F2F
                      6E732E61646F62652E636F6D2F7861702F312E302F6D6D2F220A20202020786D
                      6C6E733A73744576743D22687474703A2F2F6E732E61646F62652E636F6D2F78
                      61702F312E302F73547970652F5265736F757263654576656E7423220A202020
                      657869663A506978656C5844696D656E73696F6E3D2239220A20202065786966
                      3A506978656C5944696D656E73696F6E3D2239220A202020657869663A436F6C
                      6F7253706163653D2231220A202020746966663A496D61676557696474683D22
                      39220A202020746966663A496D6167654C656E6774683D2239220A2020207469
                      66663A5265736F6C7574696F6E556E69743D2232220A202020746966663A5852
                      65736F6C7574696F6E3D2237322F31220A202020746966663A595265736F6C75
                      74696F6E3D2237322F31220A20202070686F746F73686F703A436F6C6F724D6F
                      64653D2233220A20202070686F746F73686F703A49434350726F66696C653D22
                      735247422049454336313936362D322E31220A202020786D703A4D6F64696679
                      446174653D22323032352D31302D30375431373A33303A35302D30333A303022
                      0A202020786D703A4D65746164617461446174653D22323032352D31302D3037
                      5431373A33303A35302D30333A3030223E0A2020203C786D704D4D3A48697374
                      6F72793E0A202020203C7264663A5365713E0A20202020203C7264663A6C690A
                      20202020202073744576743A616374696F6E3D2270726F6475636564220A2020
                      2020202073744576743A736F6674776172654167656E743D22416666696E6974
                      792044657369676E657220312E31302E34220A20202020202073744576743A77
                      68656E3D22323032352D31302D30375431373A33303A35302D30333A3030222F
                      3E0A202020203C2F7264663A5365713E0A2020203C2F786D704D4D3A48697374
                      6F72793E0A20203C2F7264663A4465736372697074696F6E3E0A203C2F726466
                      3A5244463E0A3C2F783A786D706D6574613E0A3C3F787061636B657420656E64
                      3D2272223F3ED704F3F30000018169434350735247422049454336313936362D
                      322E31000028917591BF4B425114C73F9A619461504443834435695881D4D2A0
                      F40BAA410DB25AF4F92B507BBCA784B406AD4241D4D2AFA1FE825A83E620288A
                      209A6B2D6A29799DA78111792EE79ECFFDDE7B0EF79E0BD67046C9EA362F6473
                      792D38E9772D44165DF6179AB1D34127B6A8A2ABB3A1893075EDE30E8B196F3C
                      66ADFAE7FEB596784257C0D2243CA6A85A5E784A78662DAF9ABC2DDCA1A4A371
                      E15361B7261714BE35F558959F4D4E55F9CB642D1C0C80B54DD895FAC5B15FAC
                      A4B5ACB0BC9CDE6CA6A0FCDCC77C8923919B0F49EC11EF4627C8247E5C4C334E
                      001F838CCAECC3C31003B2A24EBEB7923FC7AAE42A32AB14D15821459A3C6E51
                      0B523D2131297A424686A2D9FFBF7DD593C343D5EA0E3F343E19C65B1FD8B7A0
                      5C328CCF43C3281F41C3235CE46AF9AB0730F22E7AA9A6F5EE837303CE2E6B5A
                      6C07CE37A1EB418D6AD18AD4206E4D26E1F5045A23D07E0DCD4BD59EFDEC737C
                      0FE175F9AA2BD8DD837E39EF5CFE06259167C8A25346A3000000097048597300
                      000B1300000B1301009A9C18000000804944415418957DCCC10DC1600040E1EF
                      2F57CE2660018205FE18A30C201C99802D3A8483748026D8A01338BB0B174D5A
                      52EFF8F2F2823A59EC6081B3347F563AD1648B133675196A97014AF4F0C0489A
                      DFBF4FC74F007D1C9AA72CCE5034CEBC3097E697208B01578CFD72C334C1AA25
                      80099609762D41C5BE8B35867FA2F20D7A3D1746722C81B80000000049454E44
                      AE426082}
                    TabOrder = 2
                    Height = 20
                    Width = 16
                  end
                  object cxImage3: TcxImage
                    Left = 350
                    Top = 8
                    Picture.Data = {
                      0D546478536D617274496D61676589504E470D0A1A0A0000000D494844520000
                      00230000001C0806000000EBF506210000018269434350735247422049454336
                      313936362D322E31000028917591BB4B03411087BF244A244622A8606111255A
                      19F101411B8B048D825A24117C35C9998790C7711791602BD80614441B5F85FE
                      05DA0AD682A02882586BAB68A3E19C4B8488985966E7DBDFEE0CBBB3608DA495
                      8C5ED70F996C5E0B05FDEEB9F905B7FD050776DA18A633AAE8EA74783C424DFB
                      B8C362C61BAF59ABF6B97FAD7139AE2B6069101E55542D2F3C213CB596574DDE
                      166E5552D165E153E15E4D2E287C6BEAB10A3F9B9CACF097C95A2414006BB3B0
                      3BF98B63BF584969196179399E4C7A55F9B98FF912673C3B1B96D825DE814E88
                      207EDC4C3246001F038CC8ECC3CB207DB2A2467E7F397F869CE42A32AB14D058
                      21498A3CBDA2AE4AF5B8C484E87119690A66FFFFF6554F0C0D56AA3BFD50FF64
                      186FDD60DF8252D1303E0F0DA37404B647B8C856F3730730FC2E7AB1AA79F6C1
                      B5016797552DB603E79BD0FEA046B56859B2895B1309783D81A67968B906C762
                      A5673FFB1CDF43645DBEEA0A76F7A047CEBB96BE01B2196808F088EC99000000
                      097048597300002E2300002E230178A53F7600000339494441544889B5D75D88
                      15651807F0DF9EDDD2C02868823E080A8B2029210B12BA10EA22DE950A2AE953
                      C80B4BF2ABBA8B1C6D10A930375B2AD7EE02452A9510A68B48BAA99B6ED2B622
                      22EA26A29A2831C84557BB38EF7167D799391FB0CFD5F3F97FFE67E679E779CF
                      900125CF92216CC0C3588A6FF1317686B4981E0473A8A1D915B8B5A1762D1EAB
                      F01FC118CED5D47D1FD2E2F79EC9E459B2121F6141039941E5345687B4383037
                      D0AA2978749E88C04578A22A5047E600A6E689CC69ECAB0A0C3A33CFE3FE8686
                      9F617B4DACBF99E9267996DC86630D297787B4F8A25FDCBA01BE197B7002CF85
                      B4F8B522671DDEC4C525F7345E0A69F17A45FEB5781B97E1D990163FCCCDB960
                      66F22C19C67EACC00398A8221CD2E25D171EEDB55544A2EC8D782BB02FF66926
                      8335B8BD648FE659325AD3E0B72E3688F5A1E45A86A71BC9E45972397644F394
                      990FD7589E25E5D7D1B3E459B240FB75C2D9880B3B62BF6A32D88624EADBB51F
                      2DDC844D8390897537467DC2CC8FBD125B2BC9E459B204EBA3F933DEC0CBF827
                      FAD23C4BAEEE87459E25D7604B34FF8EFA4EFC127D1BF22CB9651699B8F476A3
                      33542F84B43815D2A228812DC2ABFD9089F98BA2BE25A4C55F212DFEC38BD137
                      8CDDB1FFF927F320EE89FAA7DADBB7237B3019F5D57996DCD50B8B3C4B96E3A9
                      687E63F6A93C8CA351BF57FB9469E559720976C5C0343687B438BF71435A9C31
                      7B5EC6F32CA95B231D222D8C975C1B234E07F35CC4EC5C3576E559B2B0858DB8
                      BED328A4C57773C1435A1CD5DEE270079E6C2213E3CBA2FE61488BCF2B3027F1
                      4E346FC0A611AC2CE50CE559B2ADA6C1C9923E8AF71BC894314F366096EF3CA3
                      23289F905E8F6FB7537555495FD32B660B6FF5985C966E35E35DE295982DED29
                      3FDC47D1040E75C93988F7FAC03C84BDAD901653780499F696AE933FB019EB42
                      5A9C6D428EF167B4EF3D7F36A49EC02B5815D2626AD61522CF924BB10A4BB018
                      67F013BEC6C148BC9CBF1C5F967984B4F8644ECE423CA4FD0F62314622E6243E
                      0869F16F2777A0CB553F64FA91BACBD530EEC39D5DEAAF33FBB4ECC78F5D6A8E
                      E148F923D891919A82F566D67E3FF2788F795BB5677496D47DD6970E40A41FA9
                      C4AF233386AFE689C871BC5615F81FF27EEF8A676AB2820000000049454E44AE
                      426082}
                    Properties.FitMode = ifmProportionalStretch
                    Properties.GraphicTransparency = gtTransparent
                    Properties.ShowFocusRect = False
                    Style.BorderStyle = ebsNone
                    TabOrder = 3
                    Transparent = True
                    Height = 35
                    Width = 35
                  end
                end
              end
              object Panel10: TPanel
                Left = 0
                Top = 113
                Width = 322
                Height = 4
                Align = alBottom
                BevelOuter = bvNone
                Color = 16579836
                ParentBackground = False
                TabOrder = 3
                StyleElements = []
                ExplicitWidth = 318
              end
              object Panel9: TPanel
                Left = 0
                Top = 117
                Width = 322
                Height = 18
                Align = alBottom
                BevelOuter = bvNone
                Color = 16579836
                ParentBackground = False
                TabOrder = 4
                StyleElements = []
                ExplicitWidth = 318
                object Label2: TLabel
                  Left = 3
                  Top = -3
                  Width = 220
                  Height = 21
                  AutoSize = False
                  Caption = 'Desempenho por conta'
                  Color = clNone
                  Font.Charset = ANSI_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -15
                  Font.Name = 'Segoe UI Semibold'
                  Font.Style = [fsBold]
                  ParentColor = False
                  ParentFont = False
                  Transparent = True
                  StyleElements = []
                end
              end
            end
            object Panel2: TPanel
              Left = 0
              Top = 135
              Width = 322
              Height = 4
              Align = alTop
              BevelOuter = bvNone
              Color = 16579836
              ParentBackground = False
              TabOrder = 2
              StyleElements = []
              ExplicitWidth = 318
            end
          end
          object pnDetalhamento: TPanel
            Left = 322
            Top = 62
            Width = 900
            Height = 555
            Align = alRight
            BevelOuter = bvNone
            Color = clWhite
            ParentBackground = False
            TabOrder = 1
            Visible = False
            StyleElements = []
            object pgDetalhamento: TsPageControl
              Left = 0
              Top = 55
              Width = 900
              Height = 500
              Align = alClient
              TabOrder = 0
            end
            object Panel6: TPanel
              Tag = 99
              Left = 0
              Top = 0
              Width = 900
              Height = 55
              Margins.Left = 0
              Margins.Top = 0
              Margins.Right = 0
              Margins.Bottom = 0
              Align = alTop
              BevelOuter = bvNone
              Color = 12615680
              ParentBackground = False
              TabOrder = 1
              StyleElements = []
              object lbDetalhamentoGrupo: TLabel
                Left = 0
                Top = 0
                Width = 900
                Height = 23
                Align = alTop
                Alignment = taCenter
                AutoSize = False
                Caption = '1.01.001 - OUTRAS DESPESAS COM PRODUTOS'
                Color = 12615680
                Font.Charset = ANSI_CHARSET
                Font.Color = clWhite
                Font.Height = -16
                Font.Name = 'Segoe UI Semibold'
                Font.Style = [fsBold]
                ParentColor = False
                ParentFont = False
                Layout = tlCenter
                StyleElements = []
                ExplicitLeft = 2
                ExplicitTop = 7
                ExplicitWidth = 578
              end
              object btEsconderDetalhes: TPngSpeedButton
                Left = 868
                Top = 23
                Width = 32
                Height = 32
                Align = alRight
                Flat = True
                OnClick = btEsconderDetalhesClick
                PngImage.Data = {
                  89504E470D0A1A0A0000000D49484452000000190000001D08060000005F78C7
                  75000004B369545874584D4C3A636F6D2E61646F62652E786D7000000000003C
                  3F787061636B657420626567696E3D22EFBBBF222069643D2257354D304D7043
                  656869487A7265537A4E54637A6B633964223F3E0A3C783A786D706D65746120
                  786D6C6E733A783D2261646F62653A6E733A6D6574612F2220783A786D70746B
                  3D22584D5020436F726520352E352E30223E0A203C7264663A52444620786D6C
                  6E733A7264663D22687474703A2F2F7777772E77332E6F72672F313939392F30
                  322F32322D7264662D73796E7461782D6E7323223E0A20203C7264663A446573
                  6372697074696F6E207264663A61626F75743D22220A20202020786D6C6E733A
                  657869663D22687474703A2F2F6E732E61646F62652E636F6D2F657869662F31
                  2E302F220A20202020786D6C6E733A746966663D22687474703A2F2F6E732E61
                  646F62652E636F6D2F746966662F312E302F220A20202020786D6C6E733A7068
                  6F746F73686F703D22687474703A2F2F6E732E61646F62652E636F6D2F70686F
                  746F73686F702F312E302F220A20202020786D6C6E733A786D703D2268747470
                  3A2F2F6E732E61646F62652E636F6D2F7861702F312E302F220A20202020786D
                  6C6E733A786D704D4D3D22687474703A2F2F6E732E61646F62652E636F6D2F78
                  61702F312E302F6D6D2F220A20202020786D6C6E733A73744576743D22687474
                  703A2F2F6E732E61646F62652E636F6D2F7861702F312E302F73547970652F52
                  65736F757263654576656E7423220A202020657869663A506978656C5844696D
                  656E73696F6E3D223235220A202020657869663A506978656C5944696D656E73
                  696F6E3D223239220A202020657869663A436F6C6F7253706163653D2231220A
                  202020746966663A496D61676557696474683D223235220A202020746966663A
                  496D6167654C656E6774683D223239220A202020746966663A5265736F6C7574
                  696F6E556E69743D2232220A202020746966663A585265736F6C7574696F6E3D
                  2237322F31220A202020746966663A595265736F6C7574696F6E3D2237322F31
                  220A20202070686F746F73686F703A436F6C6F724D6F64653D2233220A202020
                  70686F746F73686F703A49434350726F66696C653D2273524742204945433631
                  3936362D322E31220A202020786D703A4D6F64696679446174653D2232303233
                  2D30352D31395431333A32323A30372D30333A3030220A202020786D703A4D65
                  746164617461446174653D22323032332D30352D31395431333A32323A30372D
                  30333A3030223E0A2020203C786D704D4D3A486973746F72793E0A202020203C
                  7264663A5365713E0A20202020203C7264663A6C690A20202020202073744576
                  743A616374696F6E3D2270726F6475636564220A20202020202073744576743A
                  736F6674776172654167656E743D22416666696E6974792044657369676E6572
                  20312E31302E34220A20202020202073744576743A7768656E3D22323032332D
                  30352D31395431333A32323A30372D30333A3030222F3E0A202020203C2F7264
                  663A5365713E0A2020203C2F786D704D4D3A486973746F72793E0A20203C2F72
                  64663A4465736372697074696F6E3E0A203C2F7264663A5244463E0A3C2F783A
                  786D706D6574613E0A3C3F787061636B657420656E643D2272223F3E1D450399
                  0000018269434350735247422049454336313936362D322E31000028917591BB
                  4B03411087BF244A44E30363616111245A45890A411B8B048D825A24118CDA24
                  671E421EC75D44C456B00D288836BE0AFD0BB415AC05415104B1D55AD146E59C
                  33810431B3CCCEB7BFDD197667C11AC92859BDCE0BD95C410B05FDAEB9E8BCCB
                  FE4C3D4EDA68A725A6E8EA74783C424DFBB8C362C69B3EB356ED73FF5AD35242
                  57C0D2203CAAA85A417842786AB5A09ABC2DDCA1A4634BC2A7C21E4D2E287C6B
                  EAF112BF989C2AF197C95A2414006B9BB02B55C5F12A56D25A56585E8E3B9B59
                  51CAF7315FE248E466C312BBC5BBD00911C48F8B49C608E0638011997DF43148
                  BFACA891EFFDCD9F212FB98ACC2A6B682C93224D018FA82B523D2131297A4246
                  8635B3FF7FFBAA2787064BD51D7EA87F328CB71EB06FC177D1303E0F0DE3FB08
                  6C8F7091ABE4E70F60F85DF4624573EF43EB069C5D56B4F80E9C6F42E7831AD3
                  62BF924DDC9A4CC2EB093447C1790D8D0BA59E95F739BE87C8BA7CD515ECEE41
                  AF9C6F5DFC0134DC67CFF8A2DC1B000000097048597300000B1300000B130100
                  9A9C18000001674944415478DAE596BF2B456118C7CFEB5706A355194C922C8A
                  4131CAC444CA1D2883C16221260B8B425106140B61B1DE41515296BB89FB6718
                  94CBF1F9DEF39E3AE9A6E3BEE73D034F7D3AEFE93DF7F9749FF7A70972081337
                  C2306CE2D105AD19E47D83B231A65295905CA2455887B60CFFC02BACC1B62405
                  1AC71EAB5590A444A3D7A3A42489EAD6E851529124F428A8C6FF925C433B0CD6
                  E8BB0DA2A93AEA22B961418DF04903ED3D984FF46DC232FD4A714F7BA05E4919
                  BA49F46E4507300B1BB06205DA219EA1C3A55C973095108DC39515B4A80D63AE
                  63A23887E9782F52F0B3661E6756FA63FC6676CD20394948526F476925FBB0A0
                  122524C93172961CC11C824F3ED5F6330117764CF47E0A932E9227E821E1874D
                  78A8B2C1162C5991C646B3ABB35EC91D8986BE09E2D80DA27348F100FD2EE52A
                  06D18AEFABD1F718442B7ED8A55C99C4DF92E47232E672C6E7725BF179EF5A85
                  1D9F37C817ED147A318EC952C5175AE3CF16E021188B0000000049454E44AE42
                  6082}
              end
              object lbTotalGrupoDetalhamento: TLabel
                Left = 4
                Top = 30
                Width = 221
                Height = 23
                AutoSize = False
                Caption = 'Total = R$ 1.235.324,22'
                Color = 12615680
                Font.Charset = ANSI_CHARSET
                Font.Color = clWhite
                Font.Height = -16
                Font.Name = 'Segoe UI Semibold'
                Font.Style = [fsBold]
                ParentColor = False
                ParentFont = False
                Layout = tlCenter
                StyleElements = []
              end
              object lbPercFaturamentoDetalhamento: TLabel
                Left = 260
                Top = 30
                Width = 226
                Height = 23
                AutoSize = False
                Caption = '22,251 % Faturamento'
                Color = 12615680
                Font.Charset = ANSI_CHARSET
                Font.Color = clWhite
                Font.Height = -16
                Font.Name = 'Segoe UI Semibold'
                Font.Style = [fsBold]
                ParentColor = False
                ParentFont = False
                Layout = tlCenter
                StyleElements = []
              end
              object lbPercDespesaDetalhamento: TLabel
                Left = 525
                Top = 30
                Width = 243
                Height = 23
                AutoSize = False
                Caption = '22,251 % Desp.'
                Color = 12615680
                Font.Charset = ANSI_CHARSET
                Font.Color = clWhite
                Font.Height = -16
                Font.Name = 'Segoe UI Semibold'
                Font.Style = [fsBold]
                ParentColor = False
                ParentFont = False
                Layout = tlCenter
                StyleElements = []
              end
            end
            object cxPageControl1: TcxPageControl
              Left = 0
              Top = 55
              Width = 900
              Height = 500
              Align = alClient
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Segoe UI Semibold'
              Font.Style = [fsBold]
              ParentFont = False
              TabOrder = 2
              Properties.ActivePage = tabComprasDaConta
              Properties.CustomButtons.Buttons = <>
              Properties.Style = 1
              LookAndFeel.Kind = lfUltraFlat
              LookAndFeel.NativeStyle = True
              ExplicitHeight = 499
              ClientRectBottom = 496
              ClientRectLeft = 4
              ClientRectRight = 896
              ClientRectTop = 28
              object tabComprasDaConta: TcxTabSheet
                Caption = 'Entradas do grupo (Compras)'
                ImageIndex = 1
                ExplicitLeft = 0
                ExplicitTop = 3
                ExplicitWidth = 0
                ExplicitHeight = 493
                object Panel5: TPanel
                  Left = -4
                  Top = 84
                  Width = 185
                  Height = 41
                  BevelOuter = bvNone
                  Color = clWhite
                  ParentBackground = False
                  TabOrder = 0
                  StyleElements = []
                end
                object Panel7: TPanel
                  Left = 0
                  Top = 0
                  Width = 892
                  Height = 468
                  Align = alClient
                  BevelOuter = bvNone
                  Color = clWhite
                  ParentBackground = False
                  TabOrder = 1
                  StyleElements = []
                  ExplicitLeft = 69
                  ExplicitTop = -54
                  object pnEntradasGrupo: TPanel
                    Left = 0
                    Top = 0
                    Width = 892
                    Height = 206
                    Align = alClient
                    BevelOuter = bvNone
                    Color = clWhite
                    ParentBackground = False
                    TabOrder = 0
                    StyleElements = []
                    object cxEntradasGrupo: TcxGrid
                      Left = 0
                      Top = 0
                      Width = 892
                      Height = 206
                      Align = alClient
                      TabOrder = 0
                      object cxEntradasGrupoDBBandedTableView1: TcxGridDBBandedTableView
                        PopupMenu = popCompras
                        Navigator.Buttons.CustomButtons = <>
                        ScrollbarAnnotations.CustomAnnotations = <>
                        OnCellClick = cxEntradasGrupoDBBandedTableView1CellClick
                        OnCellDblClick = cxEntradasGrupoDBBandedTableView1CellDblClick
                        DataController.DataSource = dm.dsQryEntradasGrupoDRE
                        DataController.Summary.DefaultGroupSummaryItems = <>
                        DataController.Summary.FooterSummaryItems = <
                          item
                            Format = 'R$ ,0.00;-R$ ,0.00'
                            Kind = skSum
                            Column = cxEntradasGrupoDBBandedTableView1TOTALGRUPO
                          end
                          item
                            Kind = skCount
                            Column = cxEntradasGrupoDBBandedTableView1COD_ENTRADA
                          end>
                        DataController.Summary.SummaryGroups = <>
                        OptionsData.Appending = True
                        OptionsData.CancelOnExit = False
                        OptionsData.Deleting = False
                        OptionsData.DeletingConfirmation = False
                        OptionsData.Editing = False
                        OptionsData.Inserting = False
                        OptionsView.Footer = True
                        OptionsView.Indicator = True
                        OptionsView.IndicatorWidth = 10
                        Styles.Content = cxStyle1
                        Styles.ContentOdd = cxStyle2
                        Styles.Footer = cxNegrito
                        Styles.Header = Headers
                        Styles.BandHeader = Headers
                        Bands = <
                          item
                            Caption = 'Dados da entrada'
                            Width = 251
                          end
                          item
                            Caption = 'Dados da nota fiscal'
                            Width = 323
                          end
                          item
                            Caption = 'Totais'
                            Width = 193
                          end
                          item
                            Caption = 'Outros dados'
                          end>
                        object cxEntradasGrupoDBBandedTableView1COD_ENTRADA: TcxGridDBBandedColumn
                          Caption = 'C'#243'digo'
                          DataBinding.FieldName = 'COD_ENTRADA'
                          DataBinding.IsNullValueType = True
                          Width = 61
                          Position.BandIndex = 0
                          Position.ColIndex = 0
                          Position.RowIndex = 0
                        end
                        object cxEntradasGrupoDBBandedTableView1TIPO_ENTRADA: TcxGridDBBandedColumn
                          Caption = 'Tipo'
                          DataBinding.FieldName = 'TIPO_ENTRADA'
                          DataBinding.IsNullValueType = True
                          PropertiesClassName = 'TcxImageComboBoxProperties'
                          Properties.Images = imlEntradas
                          Properties.Items = <
                            item
                              ImageIndex = 0
                              Value = 0
                            end
                            item
                              ImageIndex = 1
                              Value = 1
                            end>
                          Width = 37
                          Position.BandIndex = 0
                          Position.ColIndex = 1
                          Position.RowIndex = 0
                        end
                        object cxEntradasGrupoDBBandedTableView1RAZAO_SOCIAL: TcxGridDBBandedColumn
                          Caption = 'Fornecedor'
                          DataBinding.FieldName = 'RAZAO_SOCIAL'
                          DataBinding.IsNullValueType = True
                          Width = 163
                          Position.BandIndex = 1
                          Position.ColIndex = 0
                          Position.RowIndex = 0
                        end
                        object cxEntradasGrupoDBBandedTableView1NUMERONOTA: TcxGridDBBandedColumn
                          Caption = 'N'#186
                          DataBinding.FieldName = 'NUMERONOTA'
                          DataBinding.IsNullValueType = True
                          Width = 80
                          Position.BandIndex = 1
                          Position.ColIndex = 1
                          Position.RowIndex = 0
                        end
                        object cxEntradasGrupoDBBandedTableView1DATA_EMISSAO: TcxGridDBBandedColumn
                          Caption = 'Emiss'#227'o'
                          DataBinding.FieldName = 'DATA_EMISSAO'
                          DataBinding.IsNullValueType = True
                          Width = 74
                          Position.BandIndex = 1
                          Position.ColIndex = 2
                          Position.RowIndex = 0
                        end
                        object cxEntradasGrupoDBBandedTableView1DATA_ENTRADA: TcxGridDBBandedColumn
                          Caption = 'Entrou em'
                          DataBinding.FieldName = 'DATA_ENTRADA'
                          DataBinding.IsNullValueType = True
                          Width = 75
                          Position.BandIndex = 0
                          Position.ColIndex = 2
                          Position.RowIndex = 0
                        end
                        object cxEntradasGrupoDBBandedTableView1DATA_LANCAMENTO: TcxGridDBBandedColumn
                          Caption = 'Lan'#231'amento'
                          DataBinding.FieldName = 'DATA_LANCAMENTO'
                          DataBinding.IsNullValueType = True
                          Width = 83
                          Position.BandIndex = 0
                          Position.ColIndex = 3
                          Position.RowIndex = 0
                        end
                        object cxEntradasGrupoDBBandedTableView1TOTALGRUPO: TcxGridDBBandedColumn
                          Caption = 'Conta'
                          DataBinding.FieldName = 'TOTALGRUPO'
                          DataBinding.IsNullValueType = True
                          PropertiesClassName = 'TcxCurrencyEditProperties'
                          Width = 98
                          Position.BandIndex = 2
                          Position.ColIndex = 0
                          Position.RowIndex = 0
                        end
                        object cxEntradasGrupoDBBandedTableView1TOTALNOTA: TcxGridDBBandedColumn
                          Caption = 'Entrada'
                          DataBinding.FieldName = 'TOTALNOTA'
                          DataBinding.IsNullValueType = True
                          PropertiesClassName = 'TcxCurrencyEditProperties'
                          Width = 111
                          Position.BandIndex = 2
                          Position.ColIndex = 1
                          Position.RowIndex = 0
                        end
                        object cxEntradasGrupoDBBandedTableView1COD_FORNECEDOR: TcxGridDBBandedColumn
                          Caption = 'C'#243'd. do Fornecedor'
                          DataBinding.FieldName = 'COD_FORNECEDOR'
                          DataBinding.IsNullValueType = True
                          Width = 42
                          Position.BandIndex = 3
                          Position.ColIndex = 0
                          Position.RowIndex = 0
                        end
                        object cxEntradasGrupoDBBandedTableView1CHAVE_NFE: TcxGridDBBandedColumn
                          Caption = 'Chave da NF-e'
                          DataBinding.FieldName = 'CHAVE_NFE'
                          DataBinding.IsNullValueType = True
                          Width = 321
                          Position.BandIndex = 3
                          Position.ColIndex = 1
                          Position.RowIndex = 0
                        end
                        object cxEntradasGrupoDBBandedTableView1USUARIO_LANCAMENTO: TcxGridDBBandedColumn
                          Caption = 'Lan'#231'ado por'
                          DataBinding.FieldName = 'USUARIO_LANCAMENTO'
                          DataBinding.IsNullValueType = True
                          Position.BandIndex = 3
                          Position.ColIndex = 2
                          Position.RowIndex = 0
                        end
                      end
                      object cxEntradasGrupoLevel1: TcxGridLevel
                        GridView = cxEntradasGrupoDBBandedTableView1
                      end
                    end
                  end
                  object pnDetalhamentoDaEntrada: TPanel
                    Left = 0
                    Top = 206
                    Width = 892
                    Height = 262
                    Align = alBottom
                    BevelOuter = bvNone
                    Color = clWhite
                    ParentBackground = False
                    TabOrder = 1
                    Visible = False
                    StyleElements = []
                    object pgDetalhamentoEntrada: TsPageControl
                      Left = 0
                      Top = 30
                      Width = 892
                      Height = 232
                      ActivePage = sTabSheet1
                      Align = alClient
                      Style = tsButtons
                      TabOrder = 0
                      object sTabSheet1: TsTabSheet
                        Caption = 'Produtos comprados'
                        object Panel4: TPanel
                          Left = 0
                          Top = -23
                          Width = 884
                          Height = 220
                          Align = alBottom
                          BevelOuter = bvNone
                          Color = clWhite
                          ParentBackground = False
                          TabOrder = 0
                          Visible = False
                          StyleElements = []
                          object cxGrid3: TcxGrid
                            Left = 0
                            Top = 17
                            Width = 884
                            Height = 203
                            Align = alClient
                            TabOrder = 0
                            ExplicitTop = 21
                            ExplicitHeight = 199
                            object cxGridDBTableView1: TcxGridDBTableView
                              Navigator.Buttons.CustomButtons = <>
                              ScrollbarAnnotations.CustomAnnotations = <>
                              DataController.DataSource = dm.dsqryProdutosEntradaDRE
                              DataController.Summary.DefaultGroupSummaryItems = <
                                item
                                  Kind = skSum
                                  Position = spFooter
                                  Column = cxGridDBColumn3
                                end
                                item
                                  Kind = skSum
                                  Column = cxGridDBColumn3
                                end
                                item
                                  Kind = skSum
                                  Position = spFooter
                                  Column = cxGridDBColumn4
                                end
                                item
                                  Kind = skSum
                                  Position = spFooter
                                  Column = cxGridDBColumn5
                                end
                                item
                                  Kind = skSum
                                  Column = cxGridDBColumn4
                                end
                                item
                                  Kind = skSum
                                  Column = cxGridDBColumn5
                                end>
                              DataController.Summary.FooterSummaryItems = <
                                item
                                  Kind = skSum
                                  Column = cxGridDBColumn3
                                end
                                item
                                  Format = 'R$ ,0.00;-R$ ,0.00'
                                  Kind = skSum
                                  Column = cxGridDBColumn4
                                end
                                item
                                  Format = 'R$ ,0.00;-R$ ,0.00'
                                  Kind = skSum
                                  Column = cxGridDBColumn5
                                end>
                              DataController.Summary.SummaryGroups = <>
                              OptionsData.CancelOnExit = False
                              OptionsData.Deleting = False
                              OptionsData.DeletingConfirmation = False
                              OptionsData.Editing = False
                              OptionsData.Inserting = False
                              OptionsView.Footer = True
                              OptionsView.FooterAutoHeight = True
                              OptionsView.GroupByBox = False
                              OptionsView.Indicator = True
                              Styles.Content = cxStyle1
                              Styles.ContentOdd = cxStyle2
                              Styles.Header = Headers
                              object cxGridDBColumn1: TcxGridDBColumn
                                Caption = 'C'#243'digo'
                                DataBinding.FieldName = 'COD_PRODUTO'
                                DataBinding.IsNullValueType = True
                                Width = 62
                              end
                              object cxGridDBColumn2: TcxGridDBColumn
                                Caption = 'Descri'#231#227'o do produto'
                                DataBinding.FieldName = 'DESCRICAO'
                                DataBinding.IsNullValueType = True
                                Width = 305
                              end
                              object cxGridDBTableView1CONTA_FINANCEIRA: TcxGridDBColumn
                                Caption = 'Conta'
                                DataBinding.FieldName = 'CONTA_FINANCEIRA'
                                DataBinding.IsNullValueType = True
                                Width = 150
                              end
                              object cxGridDBColumn3: TcxGridDBColumn
                                Caption = 'Qtde'
                                DataBinding.FieldName = 'QUANTIDADE'
                                DataBinding.IsNullValueType = True
                                Width = 67
                              end
                              object cxGridDBColumn4: TcxGridDBColumn
                                Caption = 'Custo unit.'
                                DataBinding.FieldName = 'CUSTO_MEDIO'
                                DataBinding.IsNullValueType = True
                                PropertiesClassName = 'TcxCurrencyEditProperties'
                                Width = 90
                              end
                              object cxGridDBColumn5: TcxGridDBColumn
                                Caption = 'Total'
                                DataBinding.FieldName = 'TOTAL'
                                DataBinding.IsNullValueType = True
                                PropertiesClassName = 'TcxCurrencyEditProperties'
                                Width = 100
                              end
                              object cxGridDBTableView1COD_CONTA: TcxGridDBColumn
                                DataBinding.FieldName = 'COD_CONTA'
                                DataBinding.IsNullValueType = True
                                Visible = False
                              end
                            end
                            object cxGridLevel1: TcxGridLevel
                              GridView = cxGridDBTableView1
                            end
                          end
                          object ckbExibirApenas: TcxCheckBox
                            Left = 0
                            Top = 0
                            Align = alTop
                            Caption = 'Exibir apenas os produtos  da conta selecionada'
                            ParentFont = False
                            Properties.OnEditValueChanged = ckbExibirApenasPropertiesEditValueChanged
                            Style.Font.Charset = ANSI_CHARSET
                            Style.Font.Color = clBlack
                            Style.Font.Height = -11
                            Style.Font.Name = 'Segoe UI'
                            Style.Font.Style = []
                            Style.TransparentBorder = False
                            Style.IsFontAssigned = True
                            TabOrder = 1
                          end
                        end
                      end
                      object sTabSheet2: TsTabSheet
                        Caption = 'Contas a pagar'
                        object cxGrid2: TcxGrid
                          Left = 0
                          Top = 0
                          Width = 884
                          Height = 197
                          Align = alClient
                          TabOrder = 0
                          LookAndFeel.Kind = lfFlat
                          LookAndFeel.NativeStyle = False
                          object cxGridDBTableView3: TcxGridDBTableView
                            Navigator.Buttons.CustomButtons = <>
                            ScrollbarAnnotations.CustomAnnotations = <>
                            DataController.DataSource = dm.dsQryContasAPagarDRE
                            DataController.DetailKeyFieldNames = 'CODIGO'
                            DataController.Summary.DefaultGroupSummaryItems = <>
                            DataController.Summary.FooterSummaryItems = <
                              item
                                Kind = skCount
                                Column = cxGridDBColumn6
                              end
                              item
                                Format = 'R$ ,0.00;-R$ ,0.00'
                                Kind = skSum
                                FieldName = 'VALOR_ATUALIZADO'
                                Column = cxGridDBColumn15
                                VisibleForCustomization = False
                              end>
                            DataController.Summary.SummaryGroups = <>
                            OptionsCustomize.ColumnHiding = True
                            OptionsData.Deleting = False
                            OptionsData.DeletingConfirmation = False
                            OptionsData.Editing = False
                            OptionsData.Inserting = False
                            OptionsView.NoDataToDisplayInfoText = 'Sem dados para os filtros expecificados'
                            OptionsView.DataRowHeight = 29
                            OptionsView.Footer = True
                            OptionsView.GridLines = glNone
                            OptionsView.GroupByBox = False
                            OptionsView.GroupByHeaderLayout = ghlHorizontal
                            OptionsView.Indicator = True
                            OptionsView.IndicatorWidth = 10
                            Styles.Content = cxStyle1
                            Styles.ContentOdd = cxStyle2
                            Styles.Header = cxNegrito
                            object cxGridDBColumn6: TcxGridDBColumn
                              Caption = 'Sit.'
                              DataBinding.FieldName = 'SITUACAO_DESCRICAO'
                              DataBinding.IsNullValueType = True
                              PropertiesClassName = 'TcxImageComboBoxProperties'
                              Properties.Alignment.Horz = taCenter
                              Properties.Images = imgStatus
                              Properties.Items = <
                                item
                                  ImageIndex = 0
                                  Value = 'Vencido'
                                end
                                item
                                  ImageIndex = 1
                                  Value = 'Aberto'
                                end
                                item
                                  ImageIndex = 2
                                  Value = 'Pago'
                                end
                                item
                                  ImageIndex = 3
                                  Value = 'Previsto'
                                end>
                              Width = 37
                            end
                            object cxGridDBColumn7: TcxGridDBColumn
                              Tag = -1
                              Caption = 'Situa'#231#227'o'
                              DataBinding.FieldName = 'SITUACAO_DESCRICAO'
                              DataBinding.IsNullValueType = True
                              Visible = False
                            end
                            object cxGridDBColumn8: TcxGridDBColumn
                              Tag = 2
                              Caption = 'C'#243'digo'
                              DataBinding.FieldName = 'CODIGO'
                              DataBinding.IsNullValueType = True
                              Width = 56
                            end
                            object cxGridDBColumn9: TcxGridDBColumn
                              Tag = 4
                              Caption = 'Fornecedor'
                              DataBinding.FieldName = 'RAZAO_SOCIAL'
                              DataBinding.IsNullValueType = True
                              Width = 176
                            end
                            object cxGridDBColumn10: TcxGridDBColumn
                              Tag = 7
                              Caption = 'N'#186' da nota'
                              DataBinding.FieldName = 'NUMERO_NOTA'
                              DataBinding.IsNullValueType = True
                              Width = 76
                            end
                            object cxGridDBColumn11: TcxGridDBColumn
                              Tag = 5
                              Caption = 'Parcela'
                              DataBinding.FieldName = 'PARCELA'
                              DataBinding.IsNullValueType = True
                              Width = 50
                            end
                            object cxGridDBColumn12: TcxGridDBColumn
                              Tag = 1
                              Caption = 'Lan'#231'ada em'
                              DataBinding.FieldName = 'DATA_LANCAMENTO'
                              DataBinding.IsNullValueType = True
                              Width = 80
                            end
                            object cxGridDBColumn13: TcxGridDBColumn
                              Tag = 6
                              Caption = 'Vencimento'
                              DataBinding.FieldName = 'DATA_VENCIMENTO'
                              DataBinding.IsNullValueType = True
                              Width = 77
                            end
                            object cxGridDBColumn14: TcxGridDBColumn
                              Tag = 8
                              Caption = 'Compet'#234'ncia'
                              DataBinding.FieldName = 'DATA_COMPETENCIA'
                              DataBinding.IsNullValueType = True
                              Width = 86
                            end
                            object cxGridDBColumn15: TcxGridDBColumn
                              Tag = 1
                              Caption = 'Total'
                              DataBinding.FieldName = 'VALOR_ATUALIZADO'
                              DataBinding.IsNullValueType = True
                              PropertiesClassName = 'TcxCurrencyEditProperties'
                              Width = 121
                            end
                            object cxGridDBColumn16: TcxGridDBColumn
                              Caption = 'Lan'#231'ada por'
                              DataBinding.FieldName = 'USUARIO_INCLUSAO'
                              DataBinding.IsNullValueType = True
                              Width = 82
                            end
                            object cxGridDBColumn17: TcxGridDBColumn
                              Caption = 'Observa'#231#245'es'
                              DataBinding.FieldName = 'OBS'
                              DataBinding.IsNullValueType = True
                              Width = 427
                            end
                            object cxGridDBColumn18: TcxGridDBColumn
                              Caption = 'Conta gerencial'
                              DataBinding.FieldName = 'COD_CONTA'
                              DataBinding.IsNullValueType = True
                              Width = 90
                            end
                            object cxGridDBColumn19: TcxGridDBColumn
                              Caption = 'Situa'#231#227'o'
                              DataBinding.FieldName = 'SITUACAO'
                              DataBinding.IsNullValueType = True
                              Width = 54
                            end
                            object cxGridDBColumn20: TcxGridDBColumn
                              Caption = 'C'#243'd. Fornecedor'
                              DataBinding.FieldName = 'COD_FORNECEDOR'
                              DataBinding.IsNullValueType = True
                              Width = 96
                            end
                            object cxGridDBColumn21: TcxGridDBColumn
                              Caption = 'ID. Conta banc'#225'ria'
                              DataBinding.FieldName = 'ID_CONTA_BANCARIA'
                              DataBinding.IsNullValueType = True
                              Width = 104
                            end
                            object cxGridDBColumn22: TcxGridDBColumn
                              Caption = 'Conta banc'#225'ria'
                              DataBinding.FieldName = 'DESCRICAO_CONTA_BANCARIA'
                              DataBinding.IsNullValueType = True
                              Width = 102
                            end
                          end
                          object cxGridLevel3: TcxGridLevel
                            GridView = cxGridDBTableView3
                          end
                        end
                      end
                    end
                    object Panel11: TPanel
                      Tag = 99
                      Left = 0
                      Top = 0
                      Width = 892
                      Height = 30
                      Margins.Left = 0
                      Margins.Top = 0
                      Margins.Right = 0
                      Margins.Bottom = 0
                      Align = alTop
                      BevelOuter = bvNone
                      Color = 12615680
                      ParentBackground = False
                      TabOrder = 1
                      StyleElements = []
                      object Label3: TLabel
                        Left = 0
                        Top = 0
                        Width = 857
                        Height = 30
                        Align = alClient
                        Alignment = taCenter
                        AutoSize = False
                        Caption = 'Detalhamento da entrada'
                        Color = 12615680
                        Font.Charset = ANSI_CHARSET
                        Font.Color = clWhite
                        Font.Height = -16
                        Font.Name = 'Segoe UI Semibold'
                        Font.Style = [fsBold]
                        ParentColor = False
                        ParentFont = False
                        Layout = tlCenter
                        StyleElements = []
                        ExplicitTop = 7
                        ExplicitWidth = 707
                        ExplicitHeight = 23
                      end
                      object btEsconderProdutosDaEntrada: TPngSpeedButton
                        Left = 857
                        Top = 0
                        Width = 35
                        Height = 30
                        Align = alRight
                        Flat = True
                        OnClick = btEsconderProdutosDaEntradaClick
                        PngImage.Data = {
                          89504E470D0A1A0A0000000D49484452000000190000001D08060000005F78C7
                          75000004B369545874584D4C3A636F6D2E61646F62652E786D7000000000003C
                          3F787061636B657420626567696E3D22EFBBBF222069643D2257354D304D7043
                          656869487A7265537A4E54637A6B633964223F3E0A3C783A786D706D65746120
                          786D6C6E733A783D2261646F62653A6E733A6D6574612F2220783A786D70746B
                          3D22584D5020436F726520352E352E30223E0A203C7264663A52444620786D6C
                          6E733A7264663D22687474703A2F2F7777772E77332E6F72672F313939392F30
                          322F32322D7264662D73796E7461782D6E7323223E0A20203C7264663A446573
                          6372697074696F6E207264663A61626F75743D22220A20202020786D6C6E733A
                          657869663D22687474703A2F2F6E732E61646F62652E636F6D2F657869662F31
                          2E302F220A20202020786D6C6E733A746966663D22687474703A2F2F6E732E61
                          646F62652E636F6D2F746966662F312E302F220A20202020786D6C6E733A7068
                          6F746F73686F703D22687474703A2F2F6E732E61646F62652E636F6D2F70686F
                          746F73686F702F312E302F220A20202020786D6C6E733A786D703D2268747470
                          3A2F2F6E732E61646F62652E636F6D2F7861702F312E302F220A20202020786D
                          6C6E733A786D704D4D3D22687474703A2F2F6E732E61646F62652E636F6D2F78
                          61702F312E302F6D6D2F220A20202020786D6C6E733A73744576743D22687474
                          703A2F2F6E732E61646F62652E636F6D2F7861702F312E302F73547970652F52
                          65736F757263654576656E7423220A202020657869663A506978656C5844696D
                          656E73696F6E3D223235220A202020657869663A506978656C5944696D656E73
                          696F6E3D223239220A202020657869663A436F6C6F7253706163653D2231220A
                          202020746966663A496D61676557696474683D223235220A202020746966663A
                          496D6167654C656E6774683D223239220A202020746966663A5265736F6C7574
                          696F6E556E69743D2232220A202020746966663A585265736F6C7574696F6E3D
                          2237322F31220A202020746966663A595265736F6C7574696F6E3D2237322F31
                          220A20202070686F746F73686F703A436F6C6F724D6F64653D2233220A202020
                          70686F746F73686F703A49434350726F66696C653D2273524742204945433631
                          3936362D322E31220A202020786D703A4D6F64696679446174653D2232303233
                          2D30352D31395431333A32323A30372D30333A3030220A202020786D703A4D65
                          746164617461446174653D22323032332D30352D31395431333A32323A30372D
                          30333A3030223E0A2020203C786D704D4D3A486973746F72793E0A202020203C
                          7264663A5365713E0A20202020203C7264663A6C690A20202020202073744576
                          743A616374696F6E3D2270726F6475636564220A20202020202073744576743A
                          736F6674776172654167656E743D22416666696E6974792044657369676E6572
                          20312E31302E34220A20202020202073744576743A7768656E3D22323032332D
                          30352D31395431333A32323A30372D30333A3030222F3E0A202020203C2F7264
                          663A5365713E0A2020203C2F786D704D4D3A486973746F72793E0A20203C2F72
                          64663A4465736372697074696F6E3E0A203C2F7264663A5244463E0A3C2F783A
                          786D706D6574613E0A3C3F787061636B657420656E643D2272223F3E1D450399
                          0000018269434350735247422049454336313936362D322E31000028917591BB
                          4B03411087BF244A44E30363616111245A45890A411B8B048D825A24118CDA24
                          671E421EC75D44C456B00D288836BE0AFD0BB415AC05415104B1D55AD146E59C
                          33810431B3CCCEB7BFDD197667C11AC92859BDCE0BD95C410B05FDAEB9E8BCCB
                          FE4C3D4EDA68A725A6E8EA74783C424DFBB8C362C69B3EB356ED73FF5AD35242
                          57C0D2203CAAA85A417842786AB5A09ABC2DDCA1A4634BC2A7C21E4D2E287C6B
                          EAF112BF989C2AF197C95A2414006B9BB02B55C5F12A56D25A56585E8E3B9B59
                          51CAF7315FE248E466C312BBC5BBD00911C48F8B49C608E0638011997DF43148
                          BFACA891EFFDCD9F212FB98ACC2A6B682C93224D018FA82B523D2131297A4246
                          8635B3FF7FFBAA2787064BD51D7EA87F328CB71EB06FC177D1303E0F0DE3FB08
                          6C8F7091ABE4E70F60F85DF4624573EF43EB069C5D56B4F80E9C6F42E7831AD3
                          62BF924DDC9A4CC2EB093447C1790D8D0BA59E95F739BE87C8BA7CD515ECEE41
                          AF9C6F5DFC0134DC67CFF8A2DC1B000000097048597300000B1300000B130100
                          9A9C18000001674944415478DAE596BF2B456118C7CFEB5706A355194C922C8A
                          4131CAC444CA1D2883C16221260B8B425106140B61B1DE41515296BB89FB6718
                          94CBF1F9DEF39E3AE9A6E3BEE73D034F7D3AEFE93DF7F9749FF7A70972081337
                          C2306CE2D105AD19E47D83B231A65295905CA2455887B60CFFC02BACC1B62405
                          1AC71EAB5590A444A3D7A3A42489EAD6E851529124F428A8C6FF925C433B0CD6
                          E8BB0DA2A93AEA22B961418DF04903ED3D984FF46DC232FD4A714F7BA05E4919
                          BA49F46E4507300B1BB06205DA219EA1C3A55C973095108DC39515B4A80D63AE
                          63A23887E9782F52F0B3661E6756FA63FC6676CD20394948526F476925FBB0A0
                          122524C93172961CC11C824F3ED5F6330117764CF47E0A932E9227E821E1874D
                          78A8B2C1162C5991C646B3ABB35EC91D8986BE09E2D80DA27348F100FD2EE52A
                          06D18AEFABD1F718442B7ED8A55C99C4DF92E47232E672C6E7725BF179EF5A85
                          1D9F37C817ED147A318EC952C5175AE3CF16E021188B0000000049454E44AE42
                          6082}
                        ExplicitTop = 15
                        ExplicitHeight = 7
                      end
                    end
                  end
                end
              end
              object tabContasAPagar: TcxTabSheet
                Caption = 'Lan'#231'amentos financeiros (Contas a pagar)'
                ImageIndex = 2
                OnShow = tabContasAPagarShow
                object cxGrid4: TcxGrid
                  Left = 0
                  Top = 0
                  Width = 892
                  Height = 468
                  Align = alClient
                  TabOrder = 0
                  LookAndFeel.Kind = lfFlat
                  LookAndFeel.NativeStyle = False
                  object cxGridDBTableView2: TcxGridDBTableView
                    Navigator.Buttons.CustomButtons = <>
                    ScrollbarAnnotations.CustomAnnotations = <>
                    DataController.DataSource = dm.dsQryContasAPagarDRE
                    DataController.DetailKeyFieldNames = 'CODIGO'
                    DataController.Summary.DefaultGroupSummaryItems = <>
                    DataController.Summary.FooterSummaryItems = <
                      item
                        Kind = skCount
                        Column = cxGrid1DBTableView1SITUACAO_DESCRICAO
                      end
                      item
                        Format = 'R$ ,0.00;-R$ ,0.00'
                        Kind = skSum
                        FieldName = 'VALOR_ATUALIZADO'
                        Column = cxGrid1DBTableView1VALOR_ATUALIZADO
                        VisibleForCustomization = False
                      end>
                    DataController.Summary.SummaryGroups = <>
                    OptionsCustomize.ColumnHiding = True
                    OptionsData.Deleting = False
                    OptionsData.DeletingConfirmation = False
                    OptionsData.Editing = False
                    OptionsData.Inserting = False
                    OptionsView.NoDataToDisplayInfoText = 'Sem dados para os filtros expecificados'
                    OptionsView.DataRowHeight = 29
                    OptionsView.Footer = True
                    OptionsView.GridLines = glNone
                    OptionsView.GroupByHeaderLayout = ghlHorizontal
                    OptionsView.Indicator = True
                    OptionsView.IndicatorWidth = 10
                    Styles.Content = cxStyle1
                    Styles.ContentOdd = cxStyle2
                    Styles.Header = cxNegrito
                    object cxGrid1DBTableView1SITUACAO_DESCRICAO: TcxGridDBColumn
                      Caption = 'Sit.'
                      DataBinding.FieldName = 'SITUACAO_DESCRICAO'
                      DataBinding.IsNullValueType = True
                      PropertiesClassName = 'TcxImageComboBoxProperties'
                      Properties.Alignment.Horz = taCenter
                      Properties.Images = imgStatus
                      Properties.Items = <
                        item
                          ImageIndex = 0
                          Value = 'Vencido'
                        end
                        item
                          ImageIndex = 1
                          Value = 'Aberto'
                        end
                        item
                          ImageIndex = 2
                          Value = 'Pago'
                        end
                        item
                          ImageIndex = 3
                          Value = 'Previsto'
                        end>
                      Width = 37
                    end
                    object cxGrid1DBTableView1Column1: TcxGridDBColumn
                      Tag = -1
                      Caption = 'Situa'#231#227'o'
                      DataBinding.FieldName = 'SITUACAO_DESCRICAO'
                      DataBinding.IsNullValueType = True
                      Visible = False
                    end
                    object cxGrid1DBTableView1CODIGO: TcxGridDBColumn
                      Tag = 2
                      Caption = 'C'#243'digo'
                      DataBinding.FieldName = 'CODIGO'
                      DataBinding.IsNullValueType = True
                      Width = 56
                    end
                    object cxGrid1DBTableView1RAZAO_SOCIAL: TcxGridDBColumn
                      Tag = 4
                      Caption = 'Fornecedor'
                      DataBinding.FieldName = 'RAZAO_SOCIAL'
                      DataBinding.IsNullValueType = True
                      Width = 176
                    end
                    object cxGrid1DBTableView1NUMERO_NOTA: TcxGridDBColumn
                      Tag = 7
                      Caption = 'N'#186' da nota'
                      DataBinding.FieldName = 'NUMERO_NOTA'
                      DataBinding.IsNullValueType = True
                      Width = 76
                    end
                    object cxGrid1DBTableView1PARCELA: TcxGridDBColumn
                      Tag = 5
                      Caption = 'Parcela'
                      DataBinding.FieldName = 'PARCELA'
                      DataBinding.IsNullValueType = True
                      Width = 50
                    end
                    object cxGrid1DBTableView1DATA_LANCAMENTO: TcxGridDBColumn
                      Tag = 1
                      Caption = 'Lan'#231'ada em'
                      DataBinding.FieldName = 'DATA_LANCAMENTO'
                      DataBinding.IsNullValueType = True
                      Width = 80
                    end
                    object cxGrid1DBTableView1DATA_VENCIMENTO: TcxGridDBColumn
                      Tag = 6
                      Caption = 'Vencimento'
                      DataBinding.FieldName = 'DATA_VENCIMENTO'
                      DataBinding.IsNullValueType = True
                      Width = 77
                    end
                    object cxGrid1DBTableView1DATA_COMPETENCIA: TcxGridDBColumn
                      Tag = 8
                      Caption = 'Compet'#234'ncia'
                      DataBinding.FieldName = 'DATA_COMPETENCIA'
                      DataBinding.IsNullValueType = True
                      Width = 86
                    end
                    object cxGrid1DBTableView1VALOR_ATUALIZADO: TcxGridDBColumn
                      Tag = 1
                      Caption = 'Total'
                      DataBinding.FieldName = 'VALOR_ATUALIZADO'
                      DataBinding.IsNullValueType = True
                      PropertiesClassName = 'TcxCurrencyEditProperties'
                      Width = 121
                    end
                    object cxGrid1DBTableView1USUARIO_INCLUSAO: TcxGridDBColumn
                      Caption = 'Lan'#231'ada por'
                      DataBinding.FieldName = 'USUARIO_INCLUSAO'
                      DataBinding.IsNullValueType = True
                      Width = 82
                    end
                    object cxGrid1DBTableView1OBS: TcxGridDBColumn
                      Caption = 'Observa'#231#245'es'
                      DataBinding.FieldName = 'OBS'
                      DataBinding.IsNullValueType = True
                      Width = 427
                    end
                    object cxGrid1DBTableView1COD_CONTA: TcxGridDBColumn
                      Caption = 'Conta gerencial'
                      DataBinding.FieldName = 'COD_CONTA'
                      DataBinding.IsNullValueType = True
                      Width = 90
                    end
                    object cxGrid1DBTableView1SITUACAO: TcxGridDBColumn
                      Caption = 'Situa'#231#227'o'
                      DataBinding.FieldName = 'SITUACAO'
                      DataBinding.IsNullValueType = True
                      Width = 54
                    end
                    object cxGrid1DBTableView1COD_FORNECEDOR: TcxGridDBColumn
                      Caption = 'C'#243'd. Fornecedor'
                      DataBinding.FieldName = 'COD_FORNECEDOR'
                      DataBinding.IsNullValueType = True
                      Width = 96
                    end
                    object cxGrid1DBTableView1ID_CONTA_BANCARIA: TcxGridDBColumn
                      Caption = 'ID. Conta banc'#225'ria'
                      DataBinding.FieldName = 'ID_CONTA_BANCARIA'
                      DataBinding.IsNullValueType = True
                      Width = 104
                    end
                    object cxGrid1DBTableView1DESCRICAO_CONTA_BANCARIA: TcxGridDBColumn
                      Caption = 'Conta banc'#225'ria'
                      DataBinding.FieldName = 'DESCRICAO_CONTA_BANCARIA'
                      DataBinding.IsNullValueType = True
                      Width = 102
                    end
                  end
                  object cxGridLevel2: TcxGridLevel
                    GridView = cxGridDBTableView2
                  end
                end
              end
              object tabProdutosDaConta: TcxTabSheet
                Caption = 'Produtos comprados'
                ImageIndex = 0
                object cxGrid1: TcxGrid
                  Left = 0
                  Top = 0
                  Width = 892
                  Height = 468
                  Align = alClient
                  TabOrder = 0
                  object cxGrid1DBTableView1: TcxGridDBTableView
                    PopupMenu = popProdutos
                    Navigator.Buttons.CustomButtons = <>
                    ScrollbarAnnotations.CustomAnnotations = <>
                    DataController.DataSource = dm.dsQryProdutosDRE
                    DataController.Summary.DefaultGroupSummaryItems = <
                      item
                        Kind = skSum
                        Position = spFooter
                        Column = cxGrid1DBTableView1QUANTIDADE
                      end
                      item
                        Kind = skSum
                        Column = cxGrid1DBTableView1QUANTIDADE
                      end
                      item
                        Kind = skSum
                        Position = spFooter
                        Column = cxGrid1DBTableView1CUSTO_MEDIO
                      end
                      item
                        Kind = skSum
                        Position = spFooter
                        Column = cxGrid1DBTableView1TOTAL
                      end
                      item
                        Kind = skSum
                        Column = cxGrid1DBTableView1CUSTO_MEDIO
                      end
                      item
                        Kind = skSum
                        Column = cxGrid1DBTableView1TOTAL
                      end>
                    DataController.Summary.FooterSummaryItems = <
                      item
                        Kind = skSum
                        Column = cxGrid1DBTableView1QUANTIDADE
                      end
                      item
                        Format = 'R$ ,0.00;-R$ ,0.00'
                        Kind = skSum
                        Column = cxGrid1DBTableView1CUSTO_MEDIO
                      end
                      item
                        Format = 'R$ ,0.00;-R$ ,0.00'
                        Kind = skSum
                        Column = cxGrid1DBTableView1TOTAL
                      end>
                    DataController.Summary.SummaryGroups = <>
                    OptionsData.CancelOnExit = False
                    OptionsData.Deleting = False
                    OptionsData.DeletingConfirmation = False
                    OptionsData.Editing = False
                    OptionsData.Inserting = False
                    OptionsView.Footer = True
                    OptionsView.FooterAutoHeight = True
                    OptionsView.GroupByBox = False
                    OptionsView.Indicator = True
                    Styles.Content = cxStyle1
                    Styles.ContentOdd = cxStyle2
                    Styles.Header = Headers
                    object cxGrid1DBTableView1COD_PRODUTO: TcxGridDBColumn
                      Caption = 'C'#243'digo'
                      DataBinding.FieldName = 'COD_PRODUTO'
                      DataBinding.IsNullValueType = True
                      Width = 62
                    end
                    object cxGrid1DBTableView1DESCRICAO: TcxGridDBColumn
                      Caption = 'Descri'#231#227'o do produto'
                      DataBinding.FieldName = 'DESCRICAO'
                      DataBinding.IsNullValueType = True
                      Width = 401
                    end
                    object cxGrid1DBTableView1QUANTIDADE: TcxGridDBColumn
                      Caption = 'Quantidade'
                      DataBinding.FieldName = 'QUANTIDADE'
                      DataBinding.IsNullValueType = True
                      Width = 98
                    end
                    object cxGrid1DBTableView1CUSTO_MEDIO: TcxGridDBColumn
                      Caption = 'Custo m'#233'dio'
                      DataBinding.FieldName = 'CUSTO_MEDIO'
                      DataBinding.IsNullValueType = True
                      PropertiesClassName = 'TcxCurrencyEditProperties'
                      Width = 92
                    end
                    object cxGrid1DBTableView1TOTAL: TcxGridDBColumn
                      Caption = 'Total'
                      DataBinding.FieldName = 'TOTAL'
                      DataBinding.IsNullValueType = True
                      PropertiesClassName = 'TcxCurrencyEditProperties'
                      Width = 117
                    end
                  end
                  object cxGrid1Level1: TcxGridLevel
                    GridView = cxGrid1DBTableView1
                  end
                end
              end
            end
          end
          object pnTopo: TPanel
            Tag = 99
            Left = 0
            Top = 0
            Width = 1222
            Height = 62
            Align = alTop
            BevelEdges = []
            BevelOuter = bvNone
            Color = clWhite
            ParentBackground = False
            TabOrder = 2
            StyleElements = []
            ExplicitLeft = -3
            ExplicitTop = 2
            object Label14: TLabel
              Left = 1015
              Top = 19
              Width = 30
              Height = 20
              Alignment = taRightJustify
              AutoSize = False
              Caption = 'M-1'
              Color = clWhite
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -15
              Font.Name = 'Segoe UI Semibold'
              Font.Style = [fsBold]
              ParentColor = False
              ParentFont = False
              Transparent = True
              StyleElements = []
            end
            object Label15: TLabel
              Left = 1051
              Top = 23
              Width = 200
              Height = 16
              AutoSize = False
              Caption = '= M'#234's anterior'
              Color = clWhite
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -12
              Font.Name = 'Segoe UI Semibold'
              Font.Style = [fsBold]
              ParentColor = False
              ParentFont = False
              Transparent = True
              StyleElements = []
            end
            object Label16: TLabel
              Left = 1014
              Top = 41
              Width = 30
              Height = 20
              Alignment = taRightJustify
              AutoSize = False
              Caption = 'A-1'
              Color = clWhite
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -15
              Font.Name = 'Segoe UI Semibold'
              Font.Style = [fsBold]
              ParentColor = False
              ParentFont = False
              Transparent = True
              StyleElements = []
            end
            object Label17: TLabel
              Left = 1051
              Top = 45
              Width = 200
              Height = 16
              AutoSize = False
              Caption = '= Mesmo m'#234's do ano anterior'
              Color = clWhite
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -12
              Font.Name = 'Segoe UI Semibold'
              Font.Style = [fsBold]
              ParentColor = False
              ParentFont = False
              Transparent = True
              StyleElements = []
            end
            object Label18: TLabel
              Left = 1
              Top = 1
              Width = 151
              Height = 21
              AutoSize = False
              Caption = 'Compet'#234'ncia'
              Color = 15395562
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Segoe UI'
              Font.Style = [fsBold]
              ParentColor = False
              ParentFont = False
              Transparent = True
              StyleElements = []
            end
            object cbAno: TcxComboBox
              Left = 158
              Top = 20
              ParentFont = False
              Properties.ItemHeight = 50
              Properties.Items.Strings = (
                '2030'
                '2029'
                '2028'
                '2027'
                '2026'
                '2025'
                '2024'
                '2023'
                '2022'
                '2021'
                '2020'
                '2019'
                '2018'
                '2017'
                '2016'
                '2015')
              Properties.ReadOnly = True
              Properties.OnCloseUp = cbAnoPropertiesCloseUp
              Properties.OnEditValueChanged = cbAnoPropertiesEditValueChanged
              Style.Font.Charset = ANSI_CHARSET
              Style.Font.Color = clWindowText
              Style.Font.Height = -19
              Style.Font.Name = 'Segoe UI'
              Style.Font.Style = []
              Style.IsFontAssigned = True
              TabOrder = 1
              Text = '2025'
              Width = 71
            end
            object cbMes: TcxComboBox
              Left = 1
              Top = 20
              ParentFont = False
              Properties.ItemHeight = 50
              Properties.Items.Strings = (
                'Janeiro'
                'Fevereiro'
                'Mar'#231'o'
                'Abril'
                'Maio'
                'Junho'
                'Julho'
                'Agosto'
                'Setembro'
                'Outubro'
                'Novembro'
                'Dezembro')
              Properties.ReadOnly = False
              Properties.OnCloseUp = cbMesPropertiesCloseUp
              Style.Font.Charset = ANSI_CHARSET
              Style.Font.Color = clWindowText
              Style.Font.Height = -19
              Style.Font.Name = 'Segoe UI'
              Style.Font.Style = []
              Style.IsFontAssigned = True
              TabOrder = 0
              Text = 'Novembro'
              Width = 149
            end
            object imgPositivo: TcxImage
              Left = 1154
              Top = -17
              Picture.Data = {
                0D546478536D617274496D61676589504E470D0A1A0A0000000D494844520000
                0009000000090806000000E0910610000004AF69545874584D4C3A636F6D2E61
                646F62652E786D7000000000003C3F787061636B657420626567696E3D22EFBB
                BF222069643D2257354D304D7043656869487A7265537A4E54637A6B63396422
                3F3E0A3C783A786D706D65746120786D6C6E733A783D2261646F62653A6E733A
                6D6574612F2220783A786D70746B3D22584D5020436F726520352E352E30223E
                0A203C7264663A52444620786D6C6E733A7264663D22687474703A2F2F777777
                2E77332E6F72672F313939392F30322F32322D7264662D73796E7461782D6E73
                23223E0A20203C7264663A4465736372697074696F6E207264663A61626F7574
                3D22220A20202020786D6C6E733A657869663D22687474703A2F2F6E732E6164
                6F62652E636F6D2F657869662F312E302F220A20202020786D6C6E733A746966
                663D22687474703A2F2F6E732E61646F62652E636F6D2F746966662F312E302F
                220A20202020786D6C6E733A70686F746F73686F703D22687474703A2F2F6E73
                2E61646F62652E636F6D2F70686F746F73686F702F312E302F220A2020202078
                6D6C6E733A786D703D22687474703A2F2F6E732E61646F62652E636F6D2F7861
                702F312E302F220A20202020786D6C6E733A786D704D4D3D22687474703A2F2F
                6E732E61646F62652E636F6D2F7861702F312E302F6D6D2F220A20202020786D
                6C6E733A73744576743D22687474703A2F2F6E732E61646F62652E636F6D2F78
                61702F312E302F73547970652F5265736F757263654576656E7423220A202020
                657869663A506978656C5844696D656E73696F6E3D2239220A20202065786966
                3A506978656C5944696D656E73696F6E3D2239220A202020657869663A436F6C
                6F7253706163653D2231220A202020746966663A496D61676557696474683D22
                39220A202020746966663A496D6167654C656E6774683D2239220A2020207469
                66663A5265736F6C7574696F6E556E69743D2232220A202020746966663A5852
                65736F6C7574696F6E3D2237322F31220A202020746966663A595265736F6C75
                74696F6E3D2237322F31220A20202070686F746F73686F703A436F6C6F724D6F
                64653D2233220A20202070686F746F73686F703A49434350726F66696C653D22
                735247422049454336313936362D322E31220A202020786D703A4D6F64696679
                446174653D22323032352D31302D30375431373A33303A35302D30333A303022
                0A202020786D703A4D65746164617461446174653D22323032352D31302D3037
                5431373A33303A35302D30333A3030223E0A2020203C786D704D4D3A48697374
                6F72793E0A202020203C7264663A5365713E0A20202020203C7264663A6C690A
                20202020202073744576743A616374696F6E3D2270726F6475636564220A2020
                2020202073744576743A736F6674776172654167656E743D22416666696E6974
                792044657369676E657220312E31302E34220A20202020202073744576743A77
                68656E3D22323032352D31302D30375431373A33303A35302D30333A3030222F
                3E0A202020203C2F7264663A5365713E0A2020203C2F786D704D4D3A48697374
                6F72793E0A20203C2F7264663A4465736372697074696F6E3E0A203C2F726466
                3A5244463E0A3C2F783A786D706D6574613E0A3C3F787061636B657420656E64
                3D2272223F3ED704F3F30000018169434350735247422049454336313936362D
                322E31000028917591BF4B425114C73F9A619461504443834435695881D4D2A0
                F40BAA410DB25AF4F92B507BBCA784B406AD4241D4D2AFA1FE825A83E620288A
                209A6B2D6A29799DA78111792EE79ECFFDDE7B0EF79E0BD67046C9EA362F6473
                792D38E9772D44165DF6179AB1D34127B6A8A2ABB3A1893075EDE30E8B196F3C
                66ADFAE7FEB596784257C0D2243CA6A85A5E784A78662DAF9ABC2DDCA1A4A371
                E15361B7261714BE35F558959F4D4E55F9CB642D1C0C80B54DD895FAC5B15FAC
                A4B5ACB0BC9CDE6CA6A0FCDCC77C8923919B0F49EC11EF4627C8247E5C4C334E
                001F838CCAECC3C31003B2A24EBEB7923FC7AAE42A32AB14D15821459A3C6E51
                0B523D2131297A424686A2D9FFBF7DD593C343D5EA0E3F343E19C65B1FD8B7A0
                5C328CCF43C3281F41C3235CE46AF9AB0730F22E7AA9A6F5EE837303CE2E6B5A
                6C07CE37A1EB418D6AD18AD4206E4D26E1F5045A23D07E0DCD4BD59EFDEC737C
                0FE175F9AA2BD8DD837E39EF5CFE06259167C8A25346A3000000097048597300
                000B1300000B1301009A9C18000000804944415418957DCCC10DC1600040E1EF
                2F57CE2660018205FE18A30C201C99802D3A8483748026D8A01338BB0B174D5A
                52EFF8F2F2823A59EC6081B3347F563AD1648B133675196A97014AF4F0C0489A
                DFBF4FC74F007D1C9AA72CCE5034CEBC3097E697208B01578CFD72C334C1AA25
                80099609762D41C5BE8B35867FA2F20D7A3D1746722C81B80000000049454E44
                AE426082}
              TabOrder = 2
              Visible = False
              Height = 20
              Width = 16
            end
            object imgNegativo: TcxImage
              Left = 1195
              Top = 0
              Picture.Data = {
                0D546478536D617274496D61676589504E470D0A1A0A0000000D494844520000
                00090000000808060000002BCDD5B50000018269434350735247422049454336
                313936362D322E31000028917591BB4B03411087BF244A244622A8606111255A
                19F101411B8B048D825A24117C35C9998790C7711791602BD80614441B5F85FE
                05DA0AD682A02882586BAB68A3E19C4B8488985966E7DBDFEE0CBBB3608DA495
                8C5ED70F996C5E0B05FDEEB9F905B7FD050776DA18A633AAE8EA74783C424DFB
                B8C362C61BAF59ABF6B97FAD7139AE2B6069101E55542D2F3C213CB596574DDE
                166E5552D165E153E15E4D2E287C6BEAB10A3F9B9CACF097C95A2414006BB3B0
                3BF98B63BF584969196179399E4C7A55F9B98FF912673C3B1B96D825DE814E88
                207EDC4C3246001F038CC8ECC3CB207DB2A2467E7F397F869CE42A32AB14D058
                21498A3CBDA2AE4AF5B8C484E87119690A66FFFFF6554F0C0D56AA3BFD50FF64
                186FDD60DF8252D1303E0F0DA37404B647B8C856F3730730FC2E7AB1AA79F6C1
                B5016797552DB603E79BD0FEA046B56859B2895B1309783D81A67968B906C762
                A5673FFB1CDF43645DBEEA0A76F7A047CEBB96BE01B2196808F088EC99000000
                097048597300002E2300002E230178A53F76000000704944415418957DCBB10D
                C2301086D1174FE301A82C18094A33033016280D0C7012D0901D484B13A410C9
                5CF77F7AD7F5395FB1D2BE5BC2F30F804742C5D800236A2A112F9C1AE8582286
                348D03860518A62E41897863BF40B5448CD0CD6B9FF3196B5C4AC4E6DBD3EFB3
                1DEED8CEE30762FD1E6D359F0E2D0000000049454E44AE426082}
              TabOrder = 3
              Visible = False
              Height = 20
              Width = 16
            end
            object btImprimir: TAdvGlassButton
              Left = 265
              Top = 6
              Width = 142
              Height = 54
              BackColor = 12615680
              ButtonDirection = bdLeft
              Caption = 'Imprimir'
              CornerRadius = 0
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = []
              ForeColor = clWhite
              GlowColor = 12615680
              ImageIndex = -1
              InnerBorderColor = clBlack
              OuterBorderColor = clWhite
              Picture.Data = {
                424DF60600000000000036000000280000001800000018000000010018000000
                000000000000130B0000130B00000000000000000000FFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEF7F7F7EBEBEBEB
                EBEBEEEEEEE5E5E5E4E4E4F1F1F1FCFCFCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7F7F7E5E5
                E5C4C4C4A1A1A1A1A1A1AAAAAA909090909090B4B4B4D9D9D9EEEEEEFBFBFBFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9F9F9
                E8E8E8C9C9C99D9D9D8989898383837373738282828080807575756666668383
                83AEAEAED4D4D4ECECECFAFAFAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA
                FAFAEBEBEBCECECEA3A3A39090909B9B9BDBDBDBA0A0A0919191D1D1D19C9C9C
                8A8A8A7F7F7F7878786464647D7D7DA7A7A7D0D0D0EAEAEAF9F9F9FFFFFFFFFF
                FFFCFCFCEEEEEED3D3D3A7A7A7949494999999D6D6D6F7F7F7F4F4F4ABABABB7
                B7B7E5E5E59F9F9FA7A7A7A3A3A38D8D8D7C7C7C7A7A7A646464787878A2A2A2
                D2D2D2F7F7F7F9F9F9DCDCDCADADAD9696969A9A9AD2D2D2F6F6F6F4F4F4E6E6
                E6DADADA989898ABABABD5D5D5898989929292A4A4A4A9A9A9A8A8A890909079
                79797B7B7B6767678F8F8FE4E4E4E4E4E4A3A3A39A9A9ACDCDCDF5F5F5F3F3F3
                E7E7E7DCDCDCEAEAEAF5F5F59E9E9EB2B2B2F2F2F29595959B9B9B9090909090
                90A1A1A1ABABABADADAD939393777777747474DBDBDBA9A9A9CACACAF2F2F2F3
                F3F3E7E7E7DCDCDCE9E9E9F5F5F5F7F7F7F4F4F4969696B2B2B2F7F7F7909090
                9999999D9D9D9F9F9F9595959191919C9C9CB3B3B3797979727272DADADAA3A3
                A3F8F8F8E8E8E8DCDCDCE8E8E8F5F5F5F5F5F5F5F5F5F8F8F8F6F6F6909090B1
                B1B1FDFDFD8D8D8D9696969999999B9B9B9F9F9FA3A3A39D9D9D959595767676
                717171D9D9D9A3A3A3E2E2E2E7E7E7F4F4F4F4F4F4F5F5F5F6F6F6F8F8F8FAFA
                FAF7F7F7888888B0B0B0FFFFFF8989899393939595959898989B9B9B9E9E9EA2
                A2A2A9A9A9797979717171D9D9D9A8A8A8F9F9F9F4F4F4F4F4F4F6F6F6F7F7F7
                F8F8F8FAFAFAFDFDFDFAFAFA848484B0B0B0FFFFFF8686869191919292929595
                959898989B9B9B9D9D9DA4A4A47B7B7B717171D9D9D9AAAAAAF9F9F9F5F5F5F6
                F6F6F8F8F8F9F9F9FBFBFBFDFDFDF5F5F5E6E6E6727272A1A1A1F8F8F8767676
                8181818A8A8A9393939696969797979A9A9AA1A1A1797979717171D9D9D9AEAE
                AEFDFDFDF7F7F7F9F9F9FAFAFAFBFBFBFEFEFEF7F7F7F1F1F1FAFAFA777777AB
                ABABFFFFFF8888888686868686868383838686869292929898989F9F9F7B7B7B
                727272DADADAAFAFAFFEFEFEF9F9F9FBFBFBFCFCFCFFFFFFFFFFFFEAEAEAFFFF
                FFF3F3F3939293B7B7B7E8E8E8BBBBBBBEBEBEA9A9A98B8B8B8D8D8D88888887
                87878D8D8D7D7D7D727272DADADAB2B2B2FFFFFFFBFBFBFDFDFDFEFEFEFFFFFF
                F0F0F0FBFBFBFFFFFFCFD3CFABADACB5B4B4A6A6A6E6E6E6C1C1C1A6A6A6BDBD
                BDB3B3B39F9F9F8E8E8E9494947C7C7C838383E0E0E0B6B6B6FFFFFFFFFFFFFE
                FEFEFFFFFFF9F9F9F1F1F1FFFFFFFFFEFF78D89395DAA5D2CFD2FFFFFFFFFFFF
                FFFFFFFFFFFFDFDFDFBDBDBDACACACC1C1C1C2C2C27D7D7DB6B6B6F0F0F0B8B8
                B8FFFFFFFFFFFFFFFFFFF6F6F6F0F0F0FFFFFFFFFFFFDAD9D99EB0A5C1C4B8FF
                FCEEFFFAF4FFFDFBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCFCFCF919191B0B0B0
                EAEAEAFDFDFDB9B9B9F5F5F5EDEDEDEEEEEEF7F7F7FFFFFFFFFFFFECECECC4C4
                C4C1C1C4F2DAB4FFEAC4FFEDCDFFF1D8FFF6E4FFFCF0FFFFFCFFFFFDCCCCCC96
                9696C8C8C8F1F1F1FEFEFEFFFFFFB8B8B8FFFFFFFFFFFFFFFFFFFBFBFBF0F0F0
                E0E0E0D0D0D0CECFCF9F9B93AB9C7FC9B591E1CAA0EBD4ACE2CFB1C8BEAEACA8
                A39B9B9ABEBEBEEBEBEBFBFBFBFFFFFFFFFFFFFFFFFFB7B7B7EDEDEDEEEEEEED
                EDEDE7E7E7E2E2E2DFDFDFD5D5D5B2B2B28383857475776264668B8D918A8C8E
                939496AEAEAED7D8D8F7F7F7FEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEAEA
                EAD5D5D5CBCBCBC4C4C4BBBBBBC1C1C1C7C7C7CCCCCCD5D5D5DDDDDDE0E0E0DA
                DADAC9C9C99F9F9FB8B8B8E8E8E8FDFDFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFDFDEFEFEFE1E1E1D2D2D2C1C1
                C1B2B2B2A6A6A6A6A6A6B6B6B6CCCCCCEEEEEEFCFCFCFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
              ParentFont = False
              ShineColor = clWhite
              TabOrder = 4
              Version = '1.3.3.1'
              OnClick = btImprimirClick
            end
          end
          object Panel13: TPanel
            Left = 0
            Top = 617
            Width = 1222
            Height = 10
            Align = alBottom
            BevelOuter = bvNone
            Color = 16579836
            ParentBackground = False
            TabOrder = 3
            StyleElements = []
            ExplicitTop = 616
            ExplicitWidth = 1218
          end
        end
      end
    end
  end
  inherited cliques: TActionList
    Left = 662
    Top = 65529
  end
  inherited actlBusca: TJvControlActionList
    Left = 909
    Top = 65482
  end
  inherited popMenuExportacaoGrid: TPopupMenu
    Left = 709
    Top = 65533
  end
  object cxStyleRepository1: TcxStyleRepository
    Left = 32
    Top = 424
    PixelsPerInch = 96
    object cxStyle2: TcxStyle
      AssignedValues = [svColor, svFont]
      Color = 15658734
      Font.Charset = ANSI_CHARSET
      Font.Color = 12615680
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
    end
    object cxStyle1: TcxStyle
      AssignedValues = [svFont]
      Font.Charset = ANSI_CHARSET
      Font.Color = 12615680
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
    end
    object cxNegrito: TcxStyle
      AssignedValues = [svFont]
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Segoe UI Semibold'
      Font.Style = [fsBold]
    end
  end
  object repositorio: TcxStyleRepository
    Left = 1006
    Top = 65512
    PixelsPerInch = 96
    object cxStyle3: TcxStyle
      AssignedValues = [svColor]
      Color = 10930928
    end
  end
  object cxStyleRepository3: TcxStyleRepository
    Left = 820
    Top = 3
    PixelsPerInch = 96
    object Headers: TcxStyle
      AssignedValues = [svBitmap, svColor, svFont, svTextColor]
      Color = 10930928
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Segoe UI Semibold'
      Font.Style = [fsBold]
      Font.Quality = fqClearType
      TextColor = clDefault
    end
    object cxStyle4: TcxStyle
    end
    object stlNoGrid: TcxStyle
    end
  end
  object imlSinais: TcxImageList
    SourceDPI = 96
    Height = 12
    Width = 12
    FormatVersion = 1
    DesignInfo = -457880
    ImageInfo = <
      item
        Image.Data = {
          76020000424D760200000000000036000000280000000C0000000C0000000100
          2000000000004002000000000000000000000000000000000000409400EC46A3
          00FF2C6700A6040A00130610001B275B0094409300EC459F00FB45A000FC3780
          00CE193C006000000000449C00F346A400FC2860009C0E200036275B00923B8B
          00D9429600F1439B00F7439B00F5419600EC285E0099030A001147A200FB48A7
          00FE2A62009F1B3F0067429A00EC4CB000FF439B00F7419900F6429900F24BAB
          00FF388000CE0C1E0032449E00F747A400FC2E6A00AA1E4900753E9100DE47A6
          00FB419900F4429A00F7439A00F347A400FB3A8800D71E460072449F00F747A4
          00FC2E6B00AB1F4800753F9100E047A700FD429900F5439A00F7429B00F7459F
          00FC409300EB367C00C646A200FC48A700FE2F6D00AF204B007A3F9100DF47A7
          00FE429B00F7439B00F7419800F2439A00F63F9100E9357E00C9439C00F547A6
          00FF2A6300A11B3F0068429800E74AAC00FF419800F544A000FE48A800FF4BAE
          00FF46A100FC3C8A00E02C6700A5317400B9193C00610D1F0036368000C647A5
          00FB439A00F6419700F23E9100E03F9100DE3D8E00DE388100CF0610001A0712
          001E0208000E0103000614310051378200CE48A700FC357A00C5132F004C0C1E
          00330F25003E0C1D002F00000000000000000000000000000000010400082352
          008547A400FB388300CE08160024000000000000000000000000000200030001
          0003000200040000000000000000112900433A8600D4409500E6112A00460000
          0000000200040001000300000000000000000000000100000000000000000612
          001D2B6700A43C8B00DE1126003E000000000001000200000000}
        FileName = 'C:\restaurante\imagens\novos\cxgrid\Joia.png'
      end
      item
        Image.Data = {
          76020000424D760200000000000036000000280000000C0000000C0000000100
          2000000000004002000000000000000000000000000000000000000000000000
          00000000000000000000000060600000D7D70000D7D700006060000000000000
          00000000000000000000000000000000000000000000000000000000CDCD0000
          FFFF0000FFFF0000CCCC00000000000000000000000000000000000000000000
          0000000000000000000000006C6C0000E6E60000E6E600006B6B000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0303000003030000000000000000000000000000000000000000000000000000
          00000000000000000000000084840000C2C20000C2C200008484000000000000
          00000000000000000000000000000000000000000000000000000000F0F00000
          FFFF0000FFFF0000EFEF00000000000000000000000000000000000000000000
          000000000000000000000000F2F20000FFFF0000FFFF0000F2F2000000000000
          00000000000000000000000000000000000000000000000000000000F2F20000
          FFFF0000FFFF0000F2F200000000000000000000000000000000000000000000
          000000000000000000000000F2F20000FFFF0000FFFF0000F2F2000000000000
          00000000000000000000000000000000000000000000000000000000F2F20000
          FFFF0000FFFF0000F2F200000000000000000000000000000000000000000000
          000000000000000000000000F2F20000FFFF0000FFFF0000F2F2000000000000
          00000000000000000000000000000000000000000000000000000000A9A90000
          FFFF0000FFFF0000A9A900000000000000000000000000000000}
        FileName = 'C:\restaurante\imagens\novos\cxgrid\exclama.png'
      end
      item
        Image.Data = {
          76020000424D760200000000000036000000280000000C0000000C0000000100
          2000000000004002000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000000000000000000000000000FFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFF000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000000000000000000000FFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFF000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000000000000000000000FFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFF000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000000000000000000000FFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFF000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000000000000000000000FFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFF000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000}
        FileName = 'C:\restaurante\imagens\novos\cxgrid\neutro.png'
      end>
  end
  object imlEntradas: TcxImageList
    SourceDPI = 96
    Height = 24
    Width = 24
    FormatVersion = 1
    DesignInfo = -523704
    ImageInfo = <
      item
        ImageClass = 'TdxPNGImage'
        Image.Data = {
          89504E470D0A1A0A0000000D4948445200000018000000180806000000E0773D
          F800000006624B474400FF00FF00FFA0BDA7930000040F494441544889D5925D
          4C5B6518C7FFEF69CB69CB69A11FB40C9814A2658C4DBEC6D70A1D65CE1947B6
          910933D10B4D8C57C6CC7837139931468D99C9A217EA42CC22176C7119D82D66
          1B050C2B2C93814E46C3E74AA050680BFDA4B43D9CE3C504CB4760BB58A2FFCB
          F7BCCFEFF73CEF7980FF7BC84E17CCE63E29278D1E8B88D8AE06A3D115FFCDF0
          A541A614C74EEBE5CB870B127DA13735CECBA43A727B4B81CB154A2342D671D5
          D2FDD9716345CEC8D4748A2659B12B4599A40780DF6DC38E8EBE814395FBF3CA
          59C2CE744DDD3C931033937AD5DC448A906D7A6F3C47F78274E9F805FDF09FC4
          18F976952B5C5309568A01409524FF68391AC3E0A81DAF566A70E56617A23116
          94804A2FD9B3672CB6B202EB9C05C6E4E8C06BF29137C8A1A8ED31E0EE5FDEF3
          5525E088267E02EADF59F8E2055F605AAFCB6025E204B8BD3E3012311A8E56E3
          D4912A48681A420185EED95B2857EDF3AB99BC8F5BB9DFC26D969E7AB3B94F0A
          001CC5C558808F1708E34C07EE0D0E074DA5F994C7EB479A5A057F288CE61BED
          5024C920A16958E7DA51937D0465392FCA93648966420846ECD398989EB5B75A
          ACED57269A52413D1C0096374FC003459333733A5F2048CD7BBC48D7AAE1F1FA
          A19033782E55030F99445146316ACBAB2011D3E8B78D61C1EBC7DEEC4CCC2F78
          752078273531A3B683BDF46E5B87F5D826C157DFB7E48A6951DFC8A403635333
          58F00730386E8732598E101B802FB6805365AF60C6E5C1C59F6FC0EE70221C89
          62291201CBAE60890D422A90220CB596079A376D1100B4755A5FE779340310C4
          9FDF71B6A3A1A01E25B9B9D89807A38FD03F348AD1E57EEC55148011C901C07E
          B2C690B57E8B009C30195A00B4B45AAC5FF014F51D38EEAD10EB6FA4056264A7
          A5C3E3F56370CCBE4E30343E09B54A867068690DCE13CAB4E5041B73ADB357D7
          EB6CBF5FA02A559E3EFC127A1FD830ED7441216790A14DC1622008F7A20FF7DD
          3DC892E9A1A4D5E009955567AA58EB42B00D1F972F3579B9832C7366B76D52A4
          3D91AF55292015D3D8AFCF062315C3DC75172231E008DB9193B40F00505773F0
          837806B525392E3C784E87EBE333F3AEB304802E2D15C3F6295CBCFA2BD2B40A
          DC7377A154635C7D90A18DF5C28D079B428107053E272BF3F39F7EB97D36180E
          33B44884ACDDA9E8715A50A02A8388243CC6836F7A6A01E12106280E00648CD4
          2D63A40CCBC57067F616F29445508935FF4C8A8EA8DB716163FDB6FF0000D28F
          6632E34BE2FCEBEF8733BEB6F57EEA5B21A689E023CD81944A24D3CA18019A38
          900F6922FAA1AEF6E5C0A60677120040C57963E1F392D0DB8572FFAE6285ECE1
          A2E49B4600E0090AEB4C863FB67D812711C4E79AC57A8E103402C0C91AC38EF5
          3B6ED13A786777F52A9CE7F1C9D336F764128BF55CABC5FAE33381AF493A7B75
          CF54F09FCADFD32F8AA99A85212E0000000049454E44AE426082}
      end
      item
        Image.Data = {
          36090000424D3609000000000000360000002800000018000000180000000100
          2000000000000009000000000000000000000000000000000000000000000000
          00000C3954561252797C071F2F30000203030002030309263839145C898C0F46
          676902090E0E0001020202090E0E0F466769145C898C09263839000203030002
          0303072030311252797C0C395456000000000000000000000000000000000000
          00001666979B1767989C1665969A0A3047490C3751531767989C1767989C1767
          989C13578083071F2E2F135780831767989C1767989C1767989C0C3751530A30
          47491666979B1767989C1666979B000000000000000000000000000000000000
          00001767989C1767989C1767989C1767989C1767989C1767989C1767989C1767
          989C1767989C1767989C1767989C1767989C1767989C1767989C1767989C1767
          989C1767989C1767989C1767989C000000000000000000000000000000000000
          00001767989C1767989C1767989C1767989C1767989C1767989C1767989C1767
          989C1767989C1767989C1767989C1767989C1767989C1767989C1767989C1767
          989C1767989C1767989C1767989C000000000000000000000000000000000000
          00001767989C1767989C1767989C1767989C1767989C1767989C1767989C1767
          989C1767989C1767989C1767989C1767989C1767989C1767989C1767989C1767
          989C1767989C1767989C1767989C000000000000000000000000000000000000
          00001767989C1767989C1767989C1767989C1767989C1767989C1767989C1767
          989C1767989C1767989C1767989C1767989C1767989C1767989C1767989C1767
          989C1767989C1767989C1767989C000000000000000000000000000000000000
          00001767989C1767989C1767989C1767989C12527A7D114A6D70114A6D70114A
          6D70114A6D70114A6D70114A6D70114A6D70114A6D70114A6D7012527A7D1767
          989C1767989C1767989C1767989C000000000000000000000000000000000000
          00001767989C1767989C1767989C1767989C0A2D434404101819041018190410
          18190410181904101819041018190410181904101819041018190A2D43451767
          989C1767989C1767989C1767989C000000000000000000000000000000000000
          00001767989C1767989C1767989C1767989C1252797C0E4160630E4160630E41
          60630E4160630E4160630E4160630E4160630E4160630E41606312527A7D1767
          989C1767989C1767989C1767989C000000000000000000000000000000000000
          00001767989C1767989C1767989C1767989C1767989C1767989C1767989C1767
          989C1767989C1767989C1767989C1767989C1767989C1767989C1767989C1767
          989C1767989C1767989C1767989C000000000000000000000000000000000000
          00001767989C1767989C1767989C1767989C16629194145A8588145A8588145A
          8588145A8588145A8588145A8588145A8588145A8588145A8588166291941767
          989C1767989C1767989C1767989C000000000000000000000000000000000000
          00001767989C1767989C1767989C1767989C0D39555708253739082537390825
          37390825373908253739082537390825373908253739082537390D3955571767
          989C1767989C1767989C1767989C000000000000000000000000000000000000
          00001767989C1767989C1767989C1767989C0D3C595B09283C3D09283C3D0928
          3C3D09283C3D09283C3D09283C3D09283C3D09283C3D09283C3D0D3C595B1767
          989C1767989C1767989C1767989C000000000000000000000000000000000000
          00001767989C1767989C1767989C1767989C16629195145B878A145B878A145B
          878A145B878A145B878A145B878A145B878A145B878A145B878A166291951767
          989C1767989C1767989C1767989C000000000000000000000000000000000000
          00001767989C1767989C1767989C1767989C1767989C1767989C1767989C1767
          989C1767989C1767989C1767989C1767989C1767989C1767989C1767989C1767
          989C1767989C1767989C1767989C000000000000000000000000000000000000
          00001767989C1767989C1767989C1767989C1250777A0E3E5C5F0E3E5C5F0E3E
          5C5F0E3E5C5F0E3E5C5F0E3E5C5F0E3E5C5F0E3E5C5F0E3E5C5F1251787B1767
          989C1767989C1767989C1767989C000000000000000000000000000000000000
          00001767989C1767989C1767989C1767989C092B4142030E1516030E1516030E
          1516030E1516030E1516030E1516030E1516030E1516030E1516092C41421767
          989C1767989C1767989C1767989C000000000000000000000000000000000000
          00001767989C1767989C1767989C1767989C13567E82124E7376124E7376124E
          7376124E7376124E7376124E7376124E7376124E7376124E737613567E821767
          989C1767989C1767989C1767989C000000000000000000000000000000000000
          00001767989C1767989C1767989C1767989C1767989C1767989C1767989C1767
          989C1767989C1767989C1767989C1767989C1767989C1767989C1767989C1767
          989C1767989C1767989C1767989C000000000000000000000000000000000000
          00001767989C1767989C1767989C1767989C1767989C1767989C1767989C1767
          989C1767989C1767989C1767989C1767989C1767989C1767989C1767989C1767
          989C1767989C1767989C1767989C000000000000000000000000000000000000
          00001767989C1767989C1767989C1767989C1767989C1767989C1767989C1767
          989C1767989C1767989C1767989C1767989C1767989C1767989C1767989C1767
          989C1767989C1767989C1767989C000000000000000000000000000000000000
          00001767989C1767989C1767989C1767989C1767989C1767989C1767989C1767
          989C1767989C1767989C1767989C1767989C1767989C1767989C1767989C1767
          989C1767989C1767989C1767989C000000000000000000000000000000000000
          00001666979B1767989C1665969A0A2D42450B344D4F1767989C1767989C1767
          989C13557E81071C292B13567F821767989C1767989C1767989C0B344D4F0A2D
          42451666979B1767989C1666979B000000000000000000000000000000000000
          00000C3751531250777A061C2A2B000000000000000008233435145C888B0F44
          65670105080800000000010609090F446567145C888B08233435000000000000
          0000061C2A2B1250777A0C375153000000000000000000000000}
        FileName = 'C:\restaurante\imagens\novos\cxgrid\receipt.png'
      end>
  end
  object popCompras: TPopupMenu
    Left = 908
    Top = 65521
    object E1: TMenuItem
      Caption = 'Visualizar NF-e'
      OnClick = E1Click
    end
    object E2: TMenuItem
      Caption = 'Exibir produtos desta entrada'
      OnClick = E2Click
    end
  end
  object tmExecutarConsulta: TTimer
    Enabled = False
    Interval = 1300
    OnTimer = tmExecutarConsultaTimer
    Left = 1045
    Top = 65501
  end
  object imgStatus: TcxImageList
    SourceDPI = 96
    DrawingStyle = dsTransparent
    Height = 20
    Width = 20
    FormatVersion = 1
    DesignInfo = 2425347
    ImageInfo = <
      item
        Image.Data = {
          76060000424D7606000000000000360000002800000014000000140000000100
          2000000000004006000000000000000000000000000000000000000000000000
          0101000056560000C3C30000E9E90000FFFF0000FFFF0000FFFF0000FFFF0000
          FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000F5F50000D4D40000
          8F8F00000E0E000000000000000000007F7F0000FFFF0000FFFF0000FFFF0000
          FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000
          FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000CFCF00000E0E00001E1E0000
          F0F00000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000
          FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000
          FFFF0000FFFF00008F8F000094940000FFFF0000FFFF0000FFFF0000FFFF0000
          FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000
          FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000D4D40000E6E60000
          FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000
          FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000
          FFFF0000FFFF0000F5F50000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000
          FFFF6969FFFF4646FFFF0000FFFF0000FFFF0000FFFF3939FFFF8181FFFF8181
          FFFF8181FFFF8181FFFF8181FFFF4040FFFF0000FFFF0000FFFF0000FFFF0000
          FFFF0000FFFF0000FFFF0000FFFF0808FFFFE9E9FFFFC2C2FFFF0505FFFF0000
          FFFF0000FFFF7070FFFFF3F3FFFFACACFFFFA7A7FFFFA7A7FFFFA7A7FFFF5252
          FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF7A7A
          FFFFD3D3FFFFEFEFFFFF2323FFFF0000FFFF0000FFFF7070FFFFDEDEFFFF1212
          FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000
          FFFF0000FFFF0000FFFF0E0EFFFFEBEBFFFF6464FFFFC3C3FFFF7777FFFF0000
          FFFF0000FFFF7070FFFFDEDEFFFF1212FFFF0000FFFF0000FFFF0000FFFF0000
          FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF4848FFFFFFFF
          FFFF2626FFFF4B4BFFFFE5E5FFFF0404FFFF0000FFFF7070FFFFEEEEFFFF9898
          FFFF9393FFFF9393FFFF7B7BFFFF0000FFFF0000FFFF0000FFFF0000FFFF0000
          FFFF0000FFFF0000FFFF9D9DFFFFB7B7FFFF0101FFFF1A1AFFFFE6E6FFFF5959
          FFFF0000FFFF7070FFFFEDEDFFFF8787FFFF8080FFFF8080FFFF6B6BFFFF0000
          FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0D0DFFFFE7E7FFFF2C2C
          FFFF0000FFFF0101FFFFACACFFFFADADFFFF0000FFFF7070FFFFDEDEFFFF1212
          FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000
          FFFF0000FFFF7C7CFFFFCFCFFFFF0000FFFF0000FFFF0000FFFF3D3DFFFFEAEA
          FFFF0000FFFF7070FFFFDEDEFFFF1212FFFF0000FFFF0000FFFF0000FFFF0000
          FFFF0000FFFF0000FFFF0000FFFF0000FFFF0B0BFFFFC9C9FFFF8383FFFF0000
          FFFF0000FFFF0000FFFF0000FFFFC6C6FFFF6F6FFFFF6969FFFFEBEBFFFFD5D5
          FFFFD3D3FFFFD3D3FFFFD3D3FFFF2121FFFF0000FFFF0000FFFF0000FFFF0000
          FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000
          FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000
          FFFF0000FFFF0000FFFF0000C7C70000FFFF0000FFFF0000FFFF0000FFFF0000
          FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000
          FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000E8E800006D6D0000
          FEFE0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000
          FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000
          FFFF0000FFFF0000C4C4000007070000D0D00000FFFF0000FFFF0000FFFF0000
          FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000
          FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF00005656000000000000
          42420000D0D00000FEFE0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000
          FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000
          F1F100007E7E0000010100000000000000000000070700006D6D0000C7C70000
          FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000
          FFFF0000FFFF0000E6E60000949400001E1E0000000000000000}
        FileName = 'C:\restaurante\imagens\novos\cxgrid\Vencido.png'
      end
      item
        Image.Data = {
          76060000424D7606000000000000360000002800000014000000140000000100
          2000000000004006000000000000000000000000000000000000000000000101
          0001412B0056936200C3AF7400E9C08000FFC08000FFC08000FFC08000FFC080
          00FFC08000FFC08000FFC08000FFC08000FFC08000FFB87B00F5A06A00D46B48
          008F0B07000E00000000000000006040007FC08000FFC08000FFC08000FFC080
          00FFC08000FFC08000FFC08000FFC08000FFC08000FFC08000FFC08000FFC080
          00FFC08000FFC08000FFC08000FFC08000FF9C6800CF0B08000E160F001EB579
          00F0C08000FFC08000FFC08000FFC08000FFC08000FFC08000FFC08000FFC080
          00FFC08000FFC08000FFC08000FFC08000FFC08000FFC08000FFC08000FFC080
          00FFC08000FF6C48008F704A0094C08000FFC08000FFC08000FFC08000FFC080
          00FFC08000FFC08000FFC08000FFC08000FFC08000FFC08000FFC08000FFC080
          00FFC08000FFC08000FFC08000FFC08000FFC08000FF9F6A00D4AD7300E6C080
          00FFC08000FFC08000FFC08000FFC08000FFC08000FFC08000FFC08000FFC080
          00FFC08000FFC08000FFC08000FFC08000FFC08000FFC08000FFC08000FFC080
          00FFC08000FFB87B00F5C08000FFC1820CFFD1A55AFFC38710FFC08000FFC080
          00FFC08000FFC08000FFCC9A41FFCB983EFFC58B25FFD2A75CFFD2A75CFFD2A7
          5CFFD1A458FFC99339FFC08002FFC08000FFC08000FFC08000FFC08000FFC081
          03FFF2E6D8FFD7B075FFC08000FFC08000FFC08000FFC38612FFF5EBDDFFDCB9
          7AFFD1A568FFFCFAF6FFF3E7D2FFF3E7D2FFF5EBDCFFFDFBF9FFD9B476FFC080
          00FFC08000FFC08000FFC08000FFC08000FFD3A964FFF6EFE4FFC18209FFC080
          00FFC08000FFCC993BFFFBF8F5FFC58B22FFD1A568FFEFE2D1FFC18107FFC181
          07FFC38610FFD7B17DFFF8F2EAFFC08000FFC08000FFC08000FFC08000FFC080
          00FFC68D1FFFF9F2EAFFEBD8C0FFE7D0B2FFE7D0B2FFF1E5D5FFE5CCA9FFC080
          00FFD1A568FFEFE2D0FFC08000FFC08000FFC08000FFC79033FFFBF9F5FFC181
          07FFC08000FFC08000FFC08000FFC08000FFC08001FFEBD8B8FFECDAC1FFCB98
          4CFFCFA05DFFFDFBF9FFCB9733FFC08000FFD1A568FFF2E6D7FFC89341FFC893
          41FFD3A76AFFF7F1E9FFE4CBA8FFC08000FFC08000FFC08000FFC08000FFC080
          00FFC08000FFCD9A48FFF6EFE5FFC08000FFDAB777FFF4EADBFFC38611FFC080
          00FFD1A568FFF9F4EFFFE8D3B7FFE8D3B7FFECDCC5FFFCF9F6FFCD9C41FFC080
          00FFC08000FFC08000FFC08000FFC08000FFC08000FFC08000FFF0E2D0FFD2A6
          68FFEDDCC4FFDEBD8BFFC08000FFC08000FFD1A568FFEFE2D0FFC08000FFC080
          00FFC08000FFE3C9A8FFE5CCABFFC08000FFC08000FFC08000FFC08000FFC080
          00FFC08000FFC08000FFDAB471FFF7EFE5FFF7F2EAFFC38715FFC08000FFC080
          00FFD1A568FFEFE2D0FFC08000FFC08000FFC08000FFE1C6A2FFEDDCC7FFC080
          00FFC08000FFC08000FFC08000FFC08000FFC08000FFC08000FFC9932FFFFFFF
          FFFFE5CDA9FFC08000FFC08000FFC08000FFD1A568FFFAF5EFFFEAD7BEFFEAD7
          BEFFEDDDC8FFF9F3EDFFD3A75EFFC08000FFC08000FFC08000FFC08000FFC080
          00FFC08000FFC08000FFC08000FFCD9D58FFC58C23FFC08000FFC08000FFC080
          00FFC28416FFC58C30FFC58C30FFC58C30FFC48926FFC08000FFC08000FFC080
          00FFC08000FFC08000FF966400C7C08000FFC08000FFC08000FFC08000FFC080
          00FFC08000FFC08000FFC08000FFC08000FFC08000FFC08000FFC08000FFC080
          00FFC08000FFC08000FFC08000FFC08000FFC08000FFAF7400E85237006DBF80
          00FEC08000FFC08000FFC08000FFC08000FFC08000FFC08000FFC08000FFC080
          00FFC08000FFC08000FFC08000FFC08000FFC08000FFC08000FFC08000FFC080
          00FFC08000FF936200C4060400079D6800D0C08000FFC08000FFC08000FFC080
          00FFC08000FFC08000FFC08000FFC08000FFC08000FFC08000FFC08000FFC080
          00FFC08000FFC08000FFC08000FFC08000FFC08000FF412C0056000000003121
          00429D6800D0C08000FEC08000FFC08000FFC08000FFC08000FFC08000FFC080
          00FFC08000FFC08000FFC08000FFC08000FFC08000FFC08000FFC08000FFB579
          00F15F3F007E010100010000000000000000060400075237006D966400C7C080
          00FFC08000FFC08000FFC08000FFC08000FFC08000FFC08000FFC08000FFC080
          00FFC08000FFAD7300E6704A0094160F001E0000000000000000}
        FileName = 'C:\restaurante\imagens\novos\cxgrid\Aberto.png'
      end
      item
        Image.Data = {
          76060000424D7606000000000000360000002800000014000000140000000100
          2000000000004006000000000000000000000000000000000000000000000001
          000118360056367B00C3409200E946A000FF46A000FF46A000FF46A000FF46A0
          00FF46A000FF46A000FF46A000FF46A000FF46A000FF439A00F53A8500D4275A
          008F0409000E00000000000000002350007F46A000FF46A000FF46A000FF46A0
          00FF46A000FF46A000FF46A000FF46A000FF46A000FF46A000FF46A000FF46A0
          00FF46A000FF46A000FF46A000FF46A000FF388300CF0409000E0812001E4297
          00F046A000FF46A000FF46A000FF46A000FF46A000FF46A000FF46A000FF46A0
          00FF46A000FF46A000FF46A000FF46A000FF46A000FF46A000FF46A000FF46A0
          00FF46A000FF275A008F295D009446A000FF46A000FF46A000FF46A000FF46A0
          00FF46A000FF46A000FF46A000FF46A000FF46A000FF46A000FF46A000FF46A0
          00FF46A000FF46A000FF46A000FF46A000FF46A000FF3A8500D43F9000E646A0
          00FF46A000FF46A000FF46A000FF46A000FF46A000FF46A000FF46A000FF46A0
          00FF46A000FF46A000FF46A000FF46A000FF46A000FF46A000FF46A000FF46A0
          00FF46A000FF439A00F546A000FF46A000FF5FAB2EFF71B347FF46A000FF46A0
          00FF46A000FF46A000FF46A000FF46A000FF46A000FF46A000FF51A518FF7FBA
          58FF87BF62FF5BA92AFF6EB33CFF6EB340FF46A000FF46A000FF46A000FF46A0
          00FF95C57FFFCEE3C5FF46A000FF46A000FF46A000FF46A000FF46A000FF46A0
          00FF46A000FF76B74FFFE9F3E6FFE0EED7FFDCEDD1FFF2F8F0FFE8F2E4FFA9D0
          93FF46A000FF46A000FF46A000FF46A000FF95C57FFFCEE3C5FF46A000FF46A0
          00FF46A000FF46A000FF46A000FF46A000FF47A006FFE5F0DFFF97C67CFF4CA3
          0CFF4BA20AFF64AE33FFF6FAF5FFA9D093FF46A000FF46A000FF46A000FF46A0
          00FF95C57FFFD1E5C9FF56A71EFF56A71EFF52A519FF46A002FF46A000FF46A0
          00FF8FC278FFDBEBD5FF47A004FF46A000FF4AA208FF56A71EFFD3E6C9FFA9D0
          93FF46A000FF46A000FF46A000FF46A000FF95C57FFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFE7F1E2FF5DAA2AFF46A000FFC4DDBAFFBAD9ABFF46A000FF46A0
          00FF71B541FFFFFFFFFFFFFFFFFFA9D093FF46A000FF46A000FF46A000FF46A0
          00FF95C57FFFD5E7CDFF65AE33FF65AE33FF72B542FFCAE2BFFFD8E9D1FF46A0
          00FFC3DDB8FFBAD9ABFF46A000FF46A000FF4DA30DFF65AE33FF65AE33FF56A7
          1DFF46A000FF46A000FF46A000FF46A000FF95C57FFFCEE3C5FF46A000FF46A0
          00FF46A000FF73B54BFFFCFDFCFF49A20CFF94C47EFFD6E8CFFF48A104FF46A0
          00FF46A000FF47A004FFA1CB8EFF60AB35FF46A000FF46A000FF46A000FF46A0
          00FF95C57FFFCEE3C5FF46A000FF46A000FF46A000FFA3CD8FFFEAF2E6FF46A0
          01FF4EA30FFFE6F1E2FF90C272FF46A001FF46A000FF85BC69FFF3F8F1FF4EA4
          16FF46A000FF46A000FF46A000FF46A000FF95C57FFFEFF5ECFFC8E0BEFFC8E0
          BEFFDBEAD5FFECF5E9FF7FBB5AFF46A000FF46A000FF84BE5EFFE1EEDCFFCAE1
          C0FFC7DFBCFFECF4E8FF88BF65FF46A000FF46A000FF46A000FF46A000FF46A0
          00FF4EA319FF5BA830FF5BA830FF5BA830FF53A522FF46A000FF46A000FF46A0
          00FF46A000FF46A000FF46A001FF5EAA33FF62AC39FF46A000FF46A000FF46A0
          00FF46A000FF46A000FF377D00C746A000FF46A000FF46A000FF46A000FF46A0
          00FF46A000FF46A000FF46A000FF46A000FF46A000FF46A000FF46A000FF46A0
          00FF46A000FF46A000FF46A000FF46A000FF46A000FF409200E81E44006D46A0
          00FE46A000FF46A000FF46A000FF46A000FF46A000FF46A000FF46A000FF46A0
          00FF46A000FF46A000FF46A000FF46A000FF46A000FF46A000FF46A000FF46A0
          00FF46A000FF367B00C402050007398300D046A000FF46A000FF46A000FF46A0
          00FF46A000FF46A000FF46A000FF46A000FF46A000FF46A000FF46A000FF46A0
          00FF46A000FF46A000FF46A000FF46A000FF46A000FF1736005600000000122A
          0042398300D046A000FE46A000FF46A000FF46A000FF46A000FF46A000FF46A0
          00FF46A000FF46A000FF46A000FF46A000FF46A000FF46A000FF46A000FF4297
          00F12250007E000100010000000000000000020500071E44006D377D00C746A0
          00FF46A000FF46A000FF46A000FF46A000FF46A000FF46A000FF46A000FF46A0
          00FF46A000FF3F9000E6295D00940812001E0000000000000000}
        FileName = 'C:\restaurante\imagens\novos\cxgrid\Pago.png'
      end
      item
        Image.Data = {
          76060000424D7606000000000000360000002800000014000000140000000100
          2000000000004006000000000000000000000000000000000000000000000001
          0101072C3D5610648CC31276A6E91482B6FF1482B6FF1482B6FF1482B6FF1482
          B6FF1482B6FF1482B6FF1482B6FF1482B6FF1482B6FF137DAFF5116C97D40B49
          668F01070A0E00000000000000000A405B7F1482B6FF1482B6FF1482B6FF1482
          B6FF1482B6FF1482B6FF1482B6FF1482B6FF1482B6FF1482B6FF1482B6FF1482
          B6FF1482B6FF1482B6FF1482B6FF1482B6FF106A94CF01080B0E020F151E137B
          ACF01482B6FF1482B6FF1482B6FF1482B6FF1482B6FF1482B6FF1482B6FF1482
          B6FF1482B6FF1482B6FF1482B6FF1482B6FF1482B6FF1482B6FF1482B6FF1482
          B6FF1482B6FF0B49668F0C4B6A941482B6FF1482B6FF1482B6FF1482B6FF1482
          B6FF1482B6FF1482B6FF1482B6FF1482B6FF1482B6FF1482B6FF1482B6FF1482
          B6FF1482B6FF1482B6FF1482B6FF1482B6FF1482B6FF116C97D41275A4E61482
          B6FF1482B6FF1482B6FF1482B6FF1482B6FF1482B6FF1482B6FF1482B6FF1482
          B6FF1482B6FF1482B6FF1482B6FF1482B6FF1482B6FF1482B6FF1482B6FF1482
          B6FF1482B6FF137DAFF51482B6FF1482B6FF3A91BEFF519CC4FF1482B6FF1482
          B6FF1482B6FF1482B6FF1482B6FF1482B6FF1482B6FF1482B6FF1D86B8FF66A9
          CCFF2789BAFF1482B6FF1482B6FF1482B6FF1482B6FF1482B6FF1482B6FF1482
          B6FF83B5D2FFC6DBE9FF1482B6FF1482B6FF1482B6FF1482B6FF1482B6FF1482
          B6FF1482B6FF1482B6FF4198C2FFF6F9FCFF7AB4D2FF1482B6FF1482B6FF1482
          B6FF1482B6FF1482B6FF1482B6FF1482B6FF83B5D2FFC6DBE9FF1482B6FF1482
          B6FF1482B6FF1482B6FF1482B6FF1482B6FF1482B6FF1482B6FFA3C8DDFFE1EC
          F4FFC3DBEAFF1482B6FF1482B6FF1482B6FF1482B6FF1482B6FF1482B6FF1482
          B6FF83B5D2FFCADEEBFF2D8BBBFF2D8BBBFF2889BAFF1582B6FF1482B6FF1482
          B6FF1482B6FF2C8CBCFFECF3F8FF4F9DC5FFE5EFF5FF298ABAFF1482B6FF1482
          B6FF1482B6FF1482B6FF1482B6FF1482B6FF83B5D2FFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFE3EDF4FF3590BEFF1482B6FF1482B6FF7DB6D3FFDCEBF3FF2087
          B8FFADCDE1FFA7C7DDFF1482B6FF1482B6FF1482B6FF1482B6FF1482B6FF1482
          B6FF83B5D2FFCEE0ECFF4096C1FF4096C1FF4F9EC6FFC2D9E8FFD2E3EEFF1482
          B6FF1482B6FFC5DDEAFF8DBCD7FF1482B6FF5DA6CAFFF8FBFCFF2E8DBBFF1482
          B6FF1482B6FF1482B6FF1482B6FF1482B6FF83B5D2FFC6DBE9FF1482B6FF1482
          B6FF1482B6FF53A0C6FFFCFDFEFF1B84B7FF268ABAFFECF2F7FF2587B8FF1482
          B6FF2789BAFFF7FAFCFF66ABCEFF1482B6FF1482B6FF1482B6FF1482B6FF1482
          B6FF83B5D2FFC6DBE9FF1482B6FF1482B6FF1482B6FF93BED8FFE7EFF5FF1582
          B6FFACCBDFFFB0CFE2FF1482B6FF1482B6FF1482B6FF9CC1DAFFBAD6E6FF1482
          B6FF1482B6FF1482B6FF1482B6FF1482B6FF83B5D2FFECF3F7FFBFD8E7FFBFD8
          E7FFD6E5EFFFEAF2F7FF63A6CAFF2F8EBCFFFBFDFEFF60A8CCFF1482B6FF1482
          B6FF1482B6FF2487B8FFEBF3F7FF348FBDFF1482B6FF1482B6FF1482B6FF1482
          B6FF2487B9FF378EBCFF378EBCFF378EBCFF2A89BAFF1482B6FF1482B6FF2588
          B9FF5199C2FF1C84B7FF1482B6FF1482B6FF1482B6FF1482B6FF4594BFFF308C
          BBFF1482B6FF1482B6FF10658EC71482B6FF1482B6FF1482B6FF1482B6FF1482
          B6FF1482B6FF1482B6FF1482B6FF1482B6FF1482B6FF1482B6FF1482B6FF1482
          B6FF1482B6FF1482B6FF1482B6FF1482B6FF1482B6FF1276A6E809384E6D1482
          B6FE1482B6FF1482B6FF1482B6FF1482B6FF1482B6FF1482B6FF1482B6FF1482
          B6FF1482B6FF1482B6FF1482B6FF1482B6FF1482B6FF1482B6FF1482B6FF1482
          B6FF1482B6FF0F648BC401040507116A95D01482B6FF1482B6FF1482B6FF1482
          B6FF1482B6FF1482B6FF1482B6FF1482B6FF1482B6FF1482B6FF1482B6FF1482
          B6FF1482B6FF1482B6FF1482B6FF1482B6FF1482B6FF072C3E56000000000521
          2F42106A95D01482B6FE1482B6FF1482B6FF1482B6FF1482B6FF1482B6FF1482
          B6FF1482B6FF1482B6FF1482B6FF1482B6FF1482B6FF1482B6FF1482B6FF137A
          ACF10A415A7E0001010100000000000000000104050709384E6D10658EC71482
          B6FF1482B6FF1482B6FF1482B6FF1482B6FF1482B6FF1482B6FF1482B6FF1482
          B6FF1482B6FF1275A4E60C4B6A94020F151E0000000000000000}
        FileName = 'C:\restaurante\imagens\novos\cxgrid\Previsto.png'
      end>
  end
  object popProdutos: TPopupMenu
    Left = 764
    Top = 332
    object A1: TMenuItem
      Caption = 'Abrir o cadastro do produto'
      OnClick = A1Click
    end
  end
  object sSkinManager1: TsSkinManager
    ButtonsOptions.OldGlyphsMode = True
    InternalSkins = <>
    MenuSupport.Font.Charset = DEFAULT_CHARSET
    MenuSupport.Font.Color = clWindowText
    MenuSupport.Font.Height = -11
    MenuSupport.Font.Name = 'Segoe UI'
    MenuSupport.Font.Style = []
    SkinDirectory = 'C:\restaurante\utilitarios\Skins'
    SkinName = 'Windows 10'
    SkinInfo = '15'
    ThirdParty.ThirdEdits = ' '
    ThirdParty.ThirdButtons = 'TButton'
    ThirdParty.ThirdBitBtns = ' '
    ThirdParty.ThirdCheckBoxes = ' '
    ThirdParty.ThirdGroupBoxes = ' '
    ThirdParty.ThirdListViews = ' '
    ThirdParty.ThirdPanels = ' '
    ThirdParty.ThirdGrids = ' '
    ThirdParty.ThirdTreeViews = ' '
    ThirdParty.ThirdComboBoxes = ' '
    ThirdParty.ThirdWWEdits = ' '
    ThirdParty.ThirdVirtualTrees = ' '
    ThirdParty.ThirdGridEh = ' '
    ThirdParty.ThirdPageControl = ' '
    ThirdParty.ThirdTabControl = ' '
    ThirdParty.ThirdToolBar = ' '
    ThirdParty.ThirdStatusBar = ' '
    ThirdParty.ThirdSpeedButton = ' '
    ThirdParty.ThirdScrollControl = ' '
    ThirdParty.ThirdUpDown = ' '
    ThirdParty.ThirdScrollBar = ' '
    ThirdParty.ThirdStaticText = ' '
    ThirdParty.ThirdNativePaint = ' '
    Left = 684
    Top = 52
  end
  object sSkinProvider1: TsSkinProvider
    AddedTitle.Font.Charset = DEFAULT_CHARSET
    AddedTitle.Font.Color = clNone
    AddedTitle.Font.Height = -12
    AddedTitle.Font.Name = 'Segoe UI'
    AddedTitle.Font.Style = []
    SkinData.SkinSection = 'FORM'
    TitleButtons = <>
    Left = 763
    Top = 53
  end
end
