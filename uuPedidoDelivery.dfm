inherited frmPedidosDelivery: TfrmPedidosDelivery
  Caption = 
    'Real Manager - Delivery - Sistema de Automa'#231#227'o Comercial Para Ba' +
    'res e Restaurantes'
  ClientHeight = 684
  ClientWidth = 1238
  PopupMode = pmAuto
  Position = poOwnerFormCenter
  PrintScale = poNone
  ScreenSnap = True
  OnDestroy = FormDestroy
  ExplicitWidth = 1250
  ExplicitHeight = 722
  TextHeight = 13
  inherited botao_pesquisa: TSpeedButton
    Tag = 99
    Left = 102
    Top = -33
    ExplicitLeft = 102
    ExplicitTop = -33
  end
  object Image4: TImage [1]
    Left = 384
    Top = 544
    Width = 105
    Height = 105
  end
  object Label29: TLabel [2]
    Left = 216
    Top = 24
    Width = 38
    Height = 13
    Caption = 'Label29'
    StyleElements = []
  end
  object Label30: TLabel [3]
    Left = 224
    Top = 32
    Width = 38
    Height = 13
    Caption = 'Label30'
    StyleElements = []
  end
  object Label31: TLabel [4]
    Left = 360
    Top = 48
    Width = 38
    Height = 13
    Caption = 'Label31'
    StyleElements = []
  end
  object Label12: TLabel [5]
    Left = 672
    Top = 48
    Width = 38
    Height = 13
    Caption = 'Label12'
    StyleElements = []
  end
  object Label13: TLabel [6]
    Left = 664
    Top = 56
    Width = 38
    Height = 13
    Caption = 'Label13'
    StyleElements = []
  end
  inherited Edit1: TEdit
    Left = -24
    Top = -28
    StyleElements = []
    ExplicitLeft = -24
    ExplicitTop = -28
  end
  object pgControle: TJvPageList [8]
    Left = 0
    Top = 0
    Width = 1238
    Height = 684
    ActivePage = pgPedido
    PropagateEnable = False
    Align = alClient
    ExplicitWidth = 1234
    ExplicitHeight = 683
    object pgPedido: TJvStandardPage
      Left = 0
      Top = 0
      Width = 1238
      Height = 684
      ParentCustomHint = False
      Caption = 'pgPedido'
      Color = clBlack
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = False
      ExplicitWidth = 1234
      ExplicitHeight = 683
      object PanelPedidoDelivery: TPanel
        Tag = 99
        Left = 0
        Top = 50
        Width = 1238
        Height = 634
        Align = alClient
        BevelOuter = bvNone
        Color = clWhite
        ParentBackground = False
        TabOrder = 1
        StyleElements = []
        ExplicitWidth = 1234
        ExplicitHeight = 633
        object pnLadoDireito: TPanel
          Tag = 99
          Left = 840
          Top = 0
          Width = 398
          Height = 634
          Align = alClient
          BevelOuter = bvNone
          Color = clWhite
          TabOrder = 0
          StyleElements = []
          ExplicitWidth = 394
          ExplicitHeight = 633
          object pgListOpcoesMenu: TJvPageList
            Left = 2
            Top = 0
            Width = 396
            Height = 634
            ActivePage = pgFormasPagto
            PropagateEnable = False
            Align = alClient
            ExplicitWidth = 392
            ExplicitHeight = 633
            object pgFormasPagto: TJvStandardPage
              Left = 0
              Top = 0
              Width = 396
              Height = 634
              Caption = '.'
              ExplicitWidth = 392
              ExplicitHeight = 633
              object pnFormasPagamentox: TPanel
                Left = 0
                Top = 93
                Width = 396
                Height = 468
                Align = alTop
                BevelOuter = bvNone
                Color = clWhite
                ParentBackground = False
                TabOrder = 0
                StyleElements = []
                ExplicitWidth = 392
                object Panel5: TPanel
                  Left = 0
                  Top = 468
                  Width = 0
                  Height = 0
                  Align = alLeft
                  BevelOuter = bvNone
                  Color = 7960943
                  ParentBackground = False
                  TabOrder = 0
                  StyleElements = []
                end
                object Panel19: TPanel
                  Left = 0
                  Top = 66
                  Width = 396
                  Height = 402
                  Align = alTop
                  BevelOuter = bvNone
                  Caption = 'Panel19'
                  TabOrder = 1
                  ExplicitWidth = 392
                  object Panel34: TPanel
                    Left = 0
                    Top = 0
                    Width = 396
                    Height = 84
                    Align = alTop
                    BevelOuter = bvNone
                    Color = clWhite
                    ParentBackground = False
                    TabOrder = 0
                    StyleElements = []
                    ExplicitWidth = 392
                    object Label7: TLabel
                      Left = 12
                      Top = 32
                      Width = 65
                      Height = 18
                      Caption = 'CPF / CNPJ'
                      Font.Charset = ANSI_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -15
                      Font.Name = 'Calibri'
                      Font.Style = [fsBold]
                      ParentFont = False
                      StyleElements = []
                    end
                    object Label11: TLabel
                      Left = 130
                      Top = 32
                      Width = 124
                      Height = 18
                      Caption = 'Nome / Raz'#227'o social'
                      Font.Charset = ANSI_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -15
                      Font.Name = 'Calibri'
                      Font.Style = [fsBold]
                      ParentFont = False
                      StyleElements = []
                    end
                    object edCpf: TEdit
                      Left = 12
                      Top = 50
                      Width = 114
                      Height = 24
                      CharCase = ecUpperCase
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -15
                      Font.Name = 'MS Sans Serif'
                      Font.Style = []
                      MaxLength = 14
                      ParentFont = False
                      TabOrder = 0
                      StyleElements = []
                      OnEnter = Edit1Enter
                      OnExit = Edit1Exit
                      OnKeyDown = Edit1KeyDown
                    end
                    object edNomeClienteNota: TEdit
                      Left = 130
                      Top = 50
                      Width = 258
                      Height = 24
                      CharCase = ecUpperCase
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -15
                      Font.Name = 'MS Sans Serif'
                      Font.Style = []
                      MaxLength = 30
                      ParentFont = False
                      TabOrder = 1
                      StyleElements = []
                      OnEnter = Edit1Enter
                      OnExit = Edit1Exit
                      OnKeyDown = Edit1KeyDown
                    end
                    object Panel12: TPanel
                      Tag = 99
                      Left = 0
                      Top = 0
                      Width = 396
                      Height = 16
                      Align = alTop
                      BevelOuter = bvNone
                      Color = 7960943
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWhite
                      Font.Height = -13
                      Font.Name = 'MS Sans Serif'
                      Font.Style = []
                      ParentBackground = False
                      ParentFont = False
                      TabOrder = 2
                      StyleElements = []
                      ExplicitWidth = 392
                      object Shape2: TShape
                        Left = 0
                        Top = 0
                        Width = 21
                        Height = 16
                        Align = alLeft
                        Pen.Color = 40176
                        Pen.Width = 10
                        Shape = stCircle
                      end
                      object Label14: TLabel
                        Left = 21
                        Top = 0
                        Width = 375
                        Height = 16
                        Align = alClient
                        Caption = 'Dados para emiss'#227'o de NFC-e'
                        Font.Charset = ANSI_CHARSET
                        Font.Color = clWhite
                        Font.Height = -15
                        Font.Name = 'Calibri'
                        Font.Style = [fsBold]
                        ParentFont = False
                        StyleElements = []
                        ExplicitWidth = 182
                        ExplicitHeight = 18
                      end
                    end
                  end
                  object pnPagamentos: TPanel
                    Left = 0
                    Top = 84
                    Width = 396
                    Height = 269
                    Align = alTop
                    BevelOuter = bvNone
                    Caption = 'pnPagamentos'
                    Color = clWhite
                    ParentBackground = False
                    TabOrder = 1
                    StyleElements = []
                    ExplicitWidth = 392
                    object Panel22: TPanel
                      Tag = 99
                      Left = 0
                      Top = 0
                      Width = 396
                      Height = 16
                      Align = alTop
                      BevelOuter = bvNone
                      Color = 7960943
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWhite
                      Font.Height = -13
                      Font.Name = 'MS Sans Serif'
                      Font.Style = []
                      ParentBackground = False
                      ParentFont = False
                      TabOrder = 0
                      StyleElements = []
                      ExplicitWidth = 392
                      object Shape5: TShape
                        Left = 0
                        Top = 0
                        Width = 21
                        Height = 16
                        Align = alLeft
                        Pen.Color = 40176
                        Pen.Width = 10
                        Shape = stCircle
                      end
                      object Label19: TLabel
                        Left = 21
                        Top = 0
                        Width = 375
                        Height = 16
                        Align = alClient
                        Caption = 'Formas de pagamento do pedido'
                        Font.Charset = ANSI_CHARSET
                        Font.Color = clWhite
                        Font.Height = -15
                        Font.Name = 'Calibri'
                        Font.Style = [fsBold]
                        ParentFont = False
                        StyleElements = []
                        ExplicitWidth = 203
                        ExplicitHeight = 18
                      end
                    end
                    object Panel24: TPanel
                      Left = 0
                      Top = 16
                      Width = 396
                      Height = 219
                      BevelOuter = bvNone
                      Color = clWhite
                      ParentBackground = False
                      TabOrder = 1
                      StyleElements = []
                      object Panel26: TPanel
                        Left = 6
                        Top = 71
                        Width = 396
                        Height = 148
                        BevelOuter = bvNone
                        Caption = 'Panel24'
                        Color = clWhite
                        ParentBackground = False
                        TabOrder = 0
                        StyleElements = []
                        object Panel35: TPanel
                          Tag = 99
                          Left = 0
                          Top = 90
                          Width = 396
                          Height = 58
                          Align = alBottom
                          BevelOuter = bvNone
                          Color = clWhite
                          Font.Charset = DEFAULT_CHARSET
                          Font.Color = clWhite
                          Font.Height = -13
                          Font.Name = 'MS Sans Serif'
                          Font.Style = []
                          ParentBackground = False
                          ParentFont = False
                          TabOrder = 0
                          StyleElements = []
                          object PngSpeedButton2: TPngSpeedButton
                            AlignWithMargins = True
                            Left = 10
                            Top = 10
                            Width = 376
                            Height = 38
                            Margins.Left = 10
                            Margins.Top = 10
                            Margins.Right = 10
                            Margins.Bottom = 10
                            Align = alBottom
                            AllowAllUp = True
                            Caption = 'Limpar formas de pagamento'
                            Flat = True
                            Font.Charset = ANSI_CHARSET
                            Font.Color = clWindowText
                            Font.Height = -15
                            Font.Name = 'Calibri'
                            Font.Style = []
                            Margin = 0
                            ParentFont = False
                            StyleElements = []
                            OnClick = PngSpeedButton2Click
                            PngImage.Data = {
                              89504E470D0A1A0A0000000D494844520000002000000025080600000023B7EB
                              47000004B269545874584D4C3A636F6D2E61646F62652E786D7000000000003C
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
                              656E73696F6E3D223332220A202020657869663A506978656C5944696D656E73
                              696F6E3D223337220A202020657869663A436F6C6F7253706163653D2231220A
                              202020746966663A496D61676557696474683D223332220A202020746966663A
                              496D6167654C656E6774683D223337220A202020746966663A5265736F6C7574
                              696F6E556E69743D2232220A202020746966663A585265736F6C7574696F6E3D
                              2237322E30220A202020746966663A595265736F6C7574696F6E3D2237322E30
                              220A20202070686F746F73686F703A436F6C6F724D6F64653D2233220A202020
                              70686F746F73686F703A49434350726F66696C653D2273524742204945433631
                              3936362D322E31220A202020786D703A4D6F64696679446174653D2232303230
                              2D30382D30375431373A34313A31362D30333A3030220A202020786D703A4D65
                              746164617461446174653D22323032302D30382D30375431373A34313A31362D
                              30333A3030223E0A2020203C786D704D4D3A486973746F72793E0A202020203C
                              7264663A5365713E0A20202020203C7264663A6C690A20202020202073744576
                              743A616374696F6E3D2270726F6475636564220A20202020202073744576743A
                              736F6674776172654167656E743D22416666696E6974792044657369676E6572
                              20312E372E33220A20202020202073744576743A7768656E3D22323032302D30
                              382D30375431373A34313A31362D30333A3030222F3E0A202020203C2F726466
                              3A5365713E0A2020203C2F786D704D4D3A486973746F72793E0A20203C2F7264
                              663A4465736372697074696F6E3E0A203C2F7264663A5244463E0A3C2F783A78
                              6D706D6574613E0A3C3F787061636B657420656E643D2272223F3EC9B9D56E00
                              00018269434350735247422049454336313936362D322E31000028917591BB4B
                              03411087BF4425C10711B4B01009A256896884A08D45822F508B2482519BE4CC
                              43C8E3B84B90602BD80614441B5F85FE05DA0AD682A028825859582BDA6838E7
                              122141CC2C3BFBED6F6786DD59B086524A5A6F1C827426A705A67CCEC5F092D3
                              F6821D1BED58E88928BA3A179C0C51D73EEF254EECD66DD6AA1FF7AFB5ACC674
                              052C76E17145D572C2D3C2B3EB39D5E41DE14E251959153E1376697241E13B53
                              8F56F8D5E44485BF4DD642013F58DB859D891A8ED6B092D4D2C2F272FAD2A9BC
                              F27B1FF325ADB1CC4250D65E99DDE80498C287931926F0E3659831F15EDC7818
                              941D75F287CAF9F364255711AF5240638D044972B844CD4BF598AC71D1633252
                              14CCFEFFEDAB1E1FF154AAB7FAA0E9D930DEFBC1B60DA5A2617C1D1946E9181A
                              9EE03253CDCF1EC2E887E8C5AAD677008E4D38BFAA6AD15DB8D882AE4735A245
                              CA52834C6B3C0E6FA7D016868E1B685EAEF4ECF79C9307086DC8575DC3DE3E0C
                              48BC63E50717EF67C2F7B6D861000000097048597300000B1300000B1301009A
                              9C18000001874944415478DA63642016341CB001924B81588E80CA87401CCDD0
                              E0709418631989B49C0548DE046225229D7B178835808EF843D8010D07228174
                              281033E1512700C4F6448716041C04E20F78E4FF01F16A9003BE0019DC241A4E
                              2DF015E480FF03643918801CF097017FF0D312FC03396002901137008E00A581
                              85C4E5021A8241E48086039D40D29C4EF69E049611E5E80ED80E243DE8E4801D
                              4007788E3A805807800AAA9F40CC81450E56D6B36091FB01C4EC0CD8133A490E
                              7001E273407C0388C590C47F03B116947D0D885991E45E02B126101B01F11ECA
                              1CD0E0C08843FE0E504E152A771B48AA60B30047513FEA8051078C3A60D401A3
                              0E1875C0A803869203181814818A1F00E5AF33807ABC08F0098825A0663C0762
                              3E24B9EB403D5A403D0A40F67D4A1DF018889F31606FB25F83D25A58E44E02B1
                              1410CB12EB808D40D28F813E6013D001FEE80E680692357472400BD001B5E80E
                              00C5E7552016A2B1E5EF80581BE88017A80E80380294C8FA8018341EC44B658B
                              3F03F111202E045A7E132608001CC6574D2A10D1580000000049454E44AE4260
                              82}
                            ExplicitLeft = 7
                            ExplicitTop = 13
                          end
                        end
                        object DBGrid1: TDBGrid
                          Left = 0
                          Top = 0
                          Width = 396
                          Height = 90
                          Align = alClient
                          DataSource = dmPedidoDelivery.dsFormasPagtoTemp
                          Font.Charset = DEFAULT_CHARSET
                          Font.Color = clWindowText
                          Font.Height = -19
                          Font.Name = 'MS Sans Serif'
                          Font.Style = []
                          Options = [dgIndicator, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
                          ParentFont = False
                          PopupMenu = popFormasPagamento
                          ReadOnly = True
                          TabOrder = 1
                          TitleFont.Charset = DEFAULT_CHARSET
                          TitleFont.Color = clWindowText
                          TitleFont.Height = -11
                          TitleFont.Name = 'MS Sans Serif'
                          TitleFont.Style = []
                          Columns = <
                            item
                              Expanded = False
                              FieldName = 'descricaoForma'
                              Font.Charset = DEFAULT_CHARSET
                              Font.Color = clWindowText
                              Font.Height = -21
                              Font.Name = 'MS Sans Serif'
                              Font.Style = []
                              Width = 220
                              Visible = True
                            end
                            item
                              Expanded = False
                              FieldName = 'valorForma'
                              Width = 120
                              Visible = True
                            end>
                        end
                      end
                      object Panel13: TPanel
                        Left = 0
                        Top = 0
                        Width = 396
                        Height = 61
                        Align = alTop
                        BevelOuter = bvNone
                        Color = clWhite
                        ParentBackground = False
                        TabOrder = 1
                        StyleElements = []
                        object Label23: TLabel
                          Left = 4
                          Top = 8
                          Width = 216
                          Height = 18
                          AutoSize = False
                          Caption = 'Selecione a forma de pagamento'
                          Font.Charset = ANSI_CHARSET
                          Font.Color = clWindowText
                          Font.Height = -15
                          Font.Name = 'Calibri'
                          Font.Style = [fsBold]
                          ParentFont = False
                        end
                        object Label22: TLabel
                          Left = 344
                          Top = 8
                          Width = 35
                          Height = 18
                          AutoSize = False
                          Caption = 'Valor'
                          Font.Charset = ANSI_CHARSET
                          Font.Color = clWindowText
                          Font.Height = -15
                          Font.Name = 'Calibri'
                          Font.Style = [fsBold]
                          ParentFont = False
                        end
                        object edCodFormaPagamento: TcxLookupComboBox
                          Left = 4
                          Top = 32
                          ParentFont = False
                          Properties.DropDownAutoSize = True
                          Properties.DropDownRows = 25
                          Properties.ImmediateDropDownWhenActivated = True
                          Properties.ImmediatePost = True
                          Properties.IncrementalFilteringOptions = [ifoUseContainsOperator]
                          Properties.KeyFieldNames = 'COD_FORMA'
                          Properties.ListColumns = <
                            item
                              Caption = 'C'#243'digo'
                              FieldName = 'COD_FORMA'
                            end
                            item
                              Caption = 'Descri'#231#227'o da forma'
                              FieldName = 'DESCRICAO'
                            end>
                          Properties.ListFieldIndex = 1
                          Properties.ListSource = dmPedidoDelivery.dsQryCsFormasPagamento
                          Properties.ReadOnly = False
                          EditValue = ''
                          Style.Font.Charset = ANSI_CHARSET
                          Style.Font.Color = clWindowText
                          Style.Font.Height = -16
                          Style.Font.Name = 'Calibri'
                          Style.Font.Style = []
                          Style.IsFontAssigned = True
                          TabOrder = 0
                          OnEnter = edCodFormaPagamentoEnter
                          OnKeyDown = edCodFormaPagamentoKeyDown
                          Width = 226
                        end
                        object edValorForma: TEdit
                          Tag = 99
                          Left = 236
                          Top = 32
                          Width = 142
                          Height = 27
                          Alignment = taRightJustify
                          Font.Charset = ANSI_CHARSET
                          Font.Color = clBlack
                          Font.Height = -16
                          Font.Name = 'Calibri'
                          Font.Style = []
                          ParentFont = False
                          TabOrder = 1
                          StyleElements = []
                          OnEnter = Edit1Enter
                          OnExit = edValorFormaExit
                          OnKeyDown = Edit1KeyDown
                        end
                      end
                    end
                    object ckbPedidoCobradoEntregador: TCheckBox
                      Left = 22
                      Top = 235
                      Width = 324
                      Height = 27
                      Caption = 'O pedido ser'#225' cobrado pelo entregador'
                      Color = clWhite
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -16
                      Font.Name = 'MS Sans Serif'
                      Font.Style = []
                      ParentColor = False
                      ParentFont = False
                      TabOrder = 2
                      OnClick = ckbPedidoCobradoEntregadorClick
                      OnEnter = Edit1Enter
                      OnExit = Edit1Exit
                      OnKeyDown = Edit1KeyDown
                    end
                  end
                  object Panel25: TPanel
                    Left = 0
                    Top = 352
                    Width = 396
                    Height = 50
                    Align = alBottom
                    BevelOuter = bvNone
                    Color = clWhite
                    ParentBackground = False
                    TabOrder = 2
                    StyleElements = []
                    ExplicitWidth = 392
                    object Panel44: TPanel
                      Left = 279
                      Top = 0
                      Width = 117
                      Height = 50
                      Align = alRight
                      BevelOuter = bvNone
                      Color = clWhite
                      Enabled = False
                      ParentBackground = False
                      TabOrder = 0
                      StyleElements = []
                      ExplicitLeft = 275
                      object edTroco: TJvValidateEdit
                        Left = 0
                        Top = 24
                        Width = 117
                        Height = 24
                        StyleElements = []
                        Align = alTop
                        AutoSize = False
                        BevelInner = bvNone
                        BevelOuter = bvNone
                        BorderStyle = bsNone
                        Color = clWhite
                        CriticalPoints.MaxValueIncluded = False
                        CriticalPoints.MinValueIncluded = False
                        DisplayFormat = dfCurrency
                        DecimalPlaces = 2
                        EditText = '0,00'
                        Font.Charset = ANSI_CHARSET
                        Font.Color = clBlack
                        Font.Height = -19
                        Font.Name = 'Calibri'
                        Font.Style = [fsBold]
                        ParentFont = False
                        TabOrder = 0
                      end
                      object ed_total_pago: TJvValidateEdit
                        Left = 0
                        Top = 0
                        Width = 117
                        Height = 24
                        StyleElements = []
                        Align = alTop
                        AutoSize = False
                        BevelInner = bvNone
                        BevelOuter = bvNone
                        BorderStyle = bsNone
                        Color = clWhite
                        CriticalPoints.MaxValueIncluded = False
                        CriticalPoints.MinValueIncluded = False
                        DisplayFormat = dfCurrency
                        DecimalPlaces = 2
                        EditText = '0,00'
                        Font.Charset = ANSI_CHARSET
                        Font.Color = clBlack
                        Font.Height = -19
                        Font.Name = 'Calibri'
                        Font.Style = [fsBold]
                        ParentFont = False
                        TabOrder = 1
                      end
                    end
                    object Panel45: TPanel
                      Left = 0
                      Top = 0
                      Width = 279
                      Height = 50
                      BevelOuter = bvNone
                      Color = clWhite
                      Enabled = False
                      ParentBackground = False
                      TabOrder = 1
                      StyleElements = []
                      object Label25: TLabel
                        Left = 0
                        Top = 0
                        Width = 279
                        Height = 24
                        Align = alTop
                        Alignment = taRightJustify
                        AutoSize = False
                        Caption = 'Total de pagamentos:'
                        Font.Charset = ANSI_CHARSET
                        Font.Color = clBlack
                        Font.Height = -19
                        Font.Name = 'Calibri'
                        Font.Style = [fsBold]
                        ParentFont = False
                        ExplicitLeft = -1
                        ExplicitTop = -6
                        ExplicitWidth = 382
                      end
                      object Label24: TLabel
                        Left = 0
                        Top = 24
                        Width = 279
                        Height = 24
                        Align = alTop
                        Alignment = taRightJustify
                        AutoSize = False
                        Caption = 'Troco:'
                        Font.Charset = ANSI_CHARSET
                        Font.Color = clBlack
                        Font.Height = -19
                        Font.Name = 'Calibri'
                        Font.Style = [fsBold]
                        ParentFont = False
                        ExplicitLeft = -6
                        ExplicitTop = 34
                        ExplicitWidth = 265
                      end
                      object Panel47: TPanel
                        Left = 0
                        Top = 48
                        Width = 279
                        Height = 2
                        Align = alTop
                        BevelOuter = bvNone
                        Color = clWhite
                        ParentBackground = False
                        TabOrder = 0
                        StyleElements = []
                      end
                    end
                  end
                end
                object Panel36: TPanel
                  Left = 0
                  Top = 0
                  Width = 396
                  Height = 66
                  Align = alTop
                  BevelOuter = bvNone
                  Color = clWhite
                  ParentBackground = False
                  TabOrder = 2
                  StyleElements = []
                  ExplicitWidth = 392
                  object Label16: TLabel
                    Left = 102
                    Top = 18
                    Width = 48
                    Height = 16
                    Caption = 'Hor'#225'rio:'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -15
                    Font.Name = 'MS Sans Serif'
                    Font.Style = []
                    ParentFont = False
                    StyleElements = []
                  end
                  object Label18: TLabel
                    Left = 5
                    Top = 18
                    Width = 29
                    Height = 16
                    Caption = 'Data'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -15
                    Font.Name = 'MS Sans Serif'
                    Font.Style = []
                    ParentFont = False
                    StyleElements = []
                  end
                  object edDataEntrega: TAdvDateTimePicker
                    Left = 5
                    Top = 33
                    Width = 91
                    Height = 24
                    Date = 43537.000000000000000000
                    Format = ''
                    Time = 0.668379629627452200
                    DoubleBuffered = True
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -15
                    Font.Name = 'MS Sans Serif'
                    Font.Style = []
                    Kind = dkDate
                    ParentDoubleBuffered = False
                    ParentFont = False
                    TabOrder = 0
                    BorderStyle = bsSingle
                    Ctl3D = True
                    DateTime = 43537.668379629630000000
                    Version = '1.3.6.6'
                    LabelFont.Charset = DEFAULT_CHARSET
                    LabelFont.Color = clWindowText
                    LabelFont.Height = -11
                    LabelFont.Name = 'Tahoma'
                    LabelFont.Style = []
                  end
                  object edHoraEntrega: TAdvDateTimePicker
                    Left = 102
                    Top = 33
                    Width = 70
                    Height = 24
                    Date = 43537.000000000000000000
                    Format = ''
                    Time = 0.668379629627452200
                    DoubleBuffered = True
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -15
                    Font.Name = 'MS Sans Serif'
                    Font.Style = []
                    Kind = dkTime
                    ParentDoubleBuffered = False
                    ParentFont = False
                    TabOrder = 1
                    BorderStyle = bsSingle
                    Ctl3D = True
                    DateTime = 43537.668379629630000000
                    Version = '1.3.6.6'
                    LabelFont.Charset = DEFAULT_CHARSET
                    LabelFont.Color = clWindowText
                    LabelFont.Height = -11
                    LabelFont.Name = 'Tahoma'
                    LabelFont.Style = []
                  end
                  object cbkRetiraBalcao: TCheckBox
                    Left = 209
                    Top = 18
                    Width = 163
                    Height = 27
                    Caption = 'Retirar no balc'#227'o'
                    Color = clWhite
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -15
                    Font.Name = 'MS Sans Serif'
                    Font.Style = []
                    ParentColor = False
                    ParentFont = False
                    TabOrder = 2
                    OnClick = cbkRetiraBalcaoClick
                    OnEnter = Edit1Enter
                    OnExit = Edit1Exit
                    OnKeyDown = Edit1KeyDown
                  end
                  object cbkEntrega: TCheckBox
                    Left = 209
                    Top = 39
                    Width = 162
                    Height = 27
                    Caption = 'N'#227'o cobrar entrega'
                    Color = clWhite
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -15
                    Font.Name = 'MS Sans Serif'
                    Font.Style = []
                    ParentColor = False
                    ParentFont = False
                    TabOrder = 3
                    OnClick = cbkEntregaClick
                    OnEnter = Edit1Enter
                    OnExit = Edit1Exit
                    OnKeyDown = Edit1KeyDown
                  end
                  object Panel10: TPanel
                    Tag = 99
                    Left = 0
                    Top = 0
                    Width = 396
                    Height = 16
                    Align = alTop
                    BevelOuter = bvNone
                    Color = 7960943
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWhite
                    Font.Height = -13
                    Font.Name = 'MS Sans Serif'
                    Font.Style = []
                    ParentBackground = False
                    ParentFont = False
                    TabOrder = 4
                    StyleElements = []
                    ExplicitWidth = 392
                  end
                end
              end
              object Panel43: TPanel
                Left = 0
                Top = 0
                Width = 396
                Height = 93
                Align = alTop
                Color = clWhite
                ParentBackground = False
                TabOrder = 1
                StyleElements = []
                ExplicitWidth = 392
                object btDesconto: TPngSpeedButton
                  Left = 1
                  Top = 2
                  Width = 132
                  Height = 90
                  Align = alLeft
                  Caption = 'Desconto'
                  Flat = True
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = 12615680
                  Font.Height = -17
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  Layout = blGlyphTop
                  ParentFont = False
                  OnClick = btDescontoClick
                  PngImage.Data = {
                    89504E470D0A1A0A0000000D49484452000000300000003008060000005702F9
                    87000000097048597300000B1300000B1301009A9C18000008134944415478DA
                    D5590770544518FEF71D81202004088A0A3A2022010C203506EE20A20C236074
                    208AB4411471980862446AF68E5E4406952636AC94011C0105C6DCBB83419A4A
                    671CE9BD83103090E49EDFFFDE25935C2F21849DECCBBEDDBDFDF7FBF7DFBF3D
                    41F77811777B03651380D41412CEE1A4514F222D1764BE21695E780F015097E0
                    D90B7513EAFDA84FA1CE236979BBEC03B0AA6F80F3E0B6781D5CFFC20D683A9E
                    19A0D69B322D3F945D00131C0D285FDB89D67270BB7F613F8B14391C68259229
                    BF398D4B3954F600689A20ABC389D6A3149BDB943EE8FC6FB171697F0CE476A1
                    B59BC86C26295CA5076092B336E5B99A617636B9B43D243B5EF59A23D549788E
                    26E1EA42999DD6F95C47DAFBE8179AB44F892CE95E20984EAED608AD7244313B
                    48265D8E1E8055ED0B995E8056C522BD2750FF40DD8E15AE902652B0A997F58D
                    C98E4303AE27D559780E47E5D35251E3509BA13645AD5664E65530A30F98B126
                    7200D28E05C5716C6C2DDE6692D0AA1229AD01A815DE5BA2D671CFBC89FA2144
                    4386241AD231106B4AF7EFAFA3EEC5FB6E12103181B64B8059DA54F43F44145F
                    9764E3DB91020067C45F58AC01387BD0C7784D322955A856A59334B8656ED08D
                    7B96A54B4DD4AB57BECF31E3E41783761DD03E191980C9CE78BAED3A874592B0
                    C896B037184DB1AAA300600C55BF5983D2BBDE8A0C0017A9EE655E412DDA4A15
                    8054B7E2791E74BB059A160200FB2798968885DA97DEE63741F6F3586C8682EE
                    DCE80058D5541CE512AA742B8E329EBF512A00ACEA10D084AAD5EA0692FFD000
                    C82DF065722E61B16E58ECD75201201DA0A3C581FB6D824D0DCD9049F51066CE
                    861FF3B1EF71DD551886D66BA4DB0BCD49E55C13686CCAA9C800A867C8B877EF
                    440F40DA2B63DA29CC1C06005FFA2108EB4AB0B26427C3C8A5125F408A81F67A
                    E67C04008E101B4969E9151D00B9E33EA2ECD5683D0DAE3684089DF59A63535B
                    918BB661A5D1003845EF9B90D590F215D80F183F6919EFBDAE7E6263D17A1CE3
                    FDBCC71D3340EF3D542B68CAF001E88E990A7110BCA1EAE848C342ABFD9CD05B
                    98370F97BC72B14B2ED5F5C43E8DB474F298CFD6FD3BB4BAA24EC7F8483F8C5B
                    E69EB39D1457068DEFE4080D802DAB31B994F96825A32E23931849E3CC47FCB2
                    C0EA4803E01FBDACB554F7E079101B4CF5587B155A8F60FE10CCFFCAFFE9F329
                    3907601E3B890FA2AEC45E4678EEA53800A9F271F3D11E20053A78BC6523052B
                    D33655A1FFF2D8BF3F024EBD498AE932E5D1BB203C0CCED88B70C67E3280AA3D
                    A11AF90E5DD21D3FD97147D0B58D13C31D54704ADA0863BFDA38FC76A6370069
                    1F84D78570A84651A37333FDFA28BE89E0B4C452B46ABB7BD8A19B08EE67EAFE
                    CEFE5A93F1FE3EF1252FAFA4D1E80E17425EBB90C6A6BA306EEC1577291AD915
                    01E040FCAA1D2A164985458039451630201E51D77A5D85CACDB83FB7215ED419
                    F5234A389F1116633CCB821D3174267B1FB67D18E16A170F00BACCAED0B95612
                    C5969508795F89D603A032A8C46261A9AE20BE13D292E40980030DE8DD72D0DD
                    C9C7A323E2E88DD3FC0C2DA85D25956487DD7ABF1E71E55F870C6747B4AE55ED
                    867BB40CBB9E04864CF000C0AAEB4696AEEF89700ADA5C10CA0B6FE3768482CA
                    0CFD029358471594576954FB2BE87F16EF2CBFF5C8B81F6B2846194C633A9C09
                    695D2359308D740329D650ED4AA905F187F0DE00317189FF47A14546F88D6F3D
                    8B113BF045B6A0C27E98C7EAD199B437C17A1C7E428F8BD9D87F2DFC9F88F753
                    B8134901EFC4948D71742B0FCC149C4F62ED9501A67E5B748A6F4336D15187F2
                    34CEE5A4E9DCAA60EAA773D23FE7115E0A964DC4B7A23F2ED88A22638BD09782
                    C0E4C9C2C044DADBA2EF77507F0EA2B0C18FB8B0DA657BC4B1387CB0D84924DB
                    5EF39C16D895B065B5711B9E13E0563B9FDC32320D2CEFC7DDF2BEBFF8B8CAC1
                    FB455CBA970AFB0C6D92431CDC4BCB1CEF351DDDC16DA6BB01A2362090A80577
                    E60CEBF9A7DBF878BB1352FD87D8F0C5E6F6F5CA051900C14591EAF6A58C748C
                    35AB0769608CBF148C54B7E1A9E1CF8CDFE404DA5E38EEF47C1CF70CAFB1396B
                    2B048A598B64EB8EC1467C0EB703B681D289331109E7937D9FAA7A11CFAF713A
                    23826D2D04777A5F79A20BE09C185A98EB0CB718A2C8A1617354060BFBA0A583
                    BB17FD300C272E4E83DE0BD103B06599415C2532D527D9FE7044000A0AFB4DD5
                    627382A6608C2C1FFB53F1C16C462859092B71B0222DF5A3DA7C38453A5B43DD
                    6E05809E00B03C5A00D022621F8E7348A9013012C51CCCAF03E306460E60D6E6
                    8A74ED36F4BFF60A38B1AAD40070918E79A0DB8332CD0FE3F26B910128482D9A
                    44BD8041CD9D2825925A342CF2314CC31D307F5FD8979FDF027A1C724A2D502B
                    11DB0113DC8471E603216D4E77EA5C0845D9371257F584AEE6E26F077BF54BAB
                    8B9013064E1B4C15CBD5A091C9D72303609CC222FD7311111B2C4E7FC7BB4738
                    FE65A2AC0A395B0DFD2EBA03E8FAC0EB393A6063FC0DAD2A19190CB6034FA09A
                    48375EC4270DD5CD61274DC61D181368B9E000981B36676FFC67FF3B1BBFD809
                    EEEFA284B37F171A21DDE972B16E6F8ADAD867F6824B61B642C0DD30016CF269
                    03143C61E55A53728946184B30C088DFC08CB5C1B657729F98A66EA84A393188
                    96685B31BFA7A018A1E5669DB3154C4D023A87619492FDC827EDB09CE267B747
                    BAB8D898D591895394A0D8152EC92F2545B2E43FB34A953F68C30DD712214A47
                    F53E9BDA0E618CD3FD096A584992BB0300F4A41467E52A6275E63A2EAB803517
                    50023593027D2E2A1B00B818EA9745C84C8666594BE5958111A553EE0A8082A2
                    A755943C5F91D4BD01A014CAFF498C085E7DF938890000000049454E44AE4260
                    82}
                  ExplicitHeight = 103
                end
                object btPedidosAnteriores: TPngSpeedButton
                  Left = 133
                  Top = 2
                  Width = 132
                  Height = 90
                  Align = alLeft
                  Caption = 'Pedidos anteriores'
                  Flat = True
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = 12615680
                  Font.Height = -17
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  Layout = blGlyphTop
                  ParentFont = False
                  OnClick = btPedidosAnterioresClick
                  PngImage.Data = {
                    89504E470D0A1A0A0000000D49484452000000300000003008060000005702F9
                    87000000097048597300000B1300000B1301009A9C18000003C14944415478DA
                    ED994B4C134118C7BF29D59487622242F0FD38134D38483CD882205E80188807
                    0F068D8F9B31242244A44311414D3478317A204A623CA9042F80C8B607234662
                    A246BD49D148948741A38014BAFEB75DE82EB4A505B62B66BF6466BF999DE9FC
                    7FB3F3DA2DA3656E4C6F010680DE020C00BD056807C09DA2DEE2D47A6C41B51A
                    00CB03204465ED45CFAFC10030000C0003C0003000A2ABACF50E1DAA2D03E0BF
                    01580A6B78924CE3E60278B99090896B1AC21A841184AF083DC8EF2412EFFD5B
                    00FC592A91A702DE718455D1D5D51B800B2568EE26BC9405D567544876DBE3C5
                    032CDD1CF885E6DB71ED4070C31FC29091E0B622EC879F8F6B92A2BC97182B23
                    BBB5516F803188BB46147F8578D6CFD0ED77AF46D172482C432A5E71A7167AAA
                    F5027093891552B5F56DC4351CAE0CF28AADE47F329289C4BC7964CF79BA3080
                    488D0B78FCAC970263DE4D2B26B3E87CEEB7B0F56A5DDB684A6CA63876842E58
                    7B7D79759D69E431BF80B7452ED54FB43283F89EEF5A0260B561F5726A0C3DBF
                    7BDE9EF78B77C2DB8CF00910B6190847D74EF29ABAE159E4D257A1AB5C1B8039
                    BD2FD611CFAE8A42FCB4A921B8F332E272F9DE00A5276D8CC51CC06A63D91076
                    C206173F17820BD8ECD817E425F8EE303A140300F680B8B56481E2A7CD090DD9
                    72FB0F111F94F3EFC702E014006E2F42FC4732E30954593FFBDB779DC490BC25
                    DFFBA0D11C704A679A6419201F001D4B225EB29AAE7C124D6D726A442B000F62
                    B33F61CA24BEF755903202625B54E2257374656235EA91531EAD000610AFF327
                    423C818BAE4D34E97B02DB23162F99FA09F46B05F00671860CA09E035C2825DF
                    A4CC768780082DDE575F35075E6A05D084F8A80CA05E85B8C0910708D1160422
                    BC78FF6F2B5621F1AE4600AEC38A9711F53EE007B0C3EB9B05D104F1C7C28B9F
                    B50F102B8ED1E775C54E1C00201544441DA3DA894729F14F6AACFE1F089C85B8
                    6023F5EAE306C09DF9C50BBB00FE9C66CE42AC0143B332967F7044761A0D6673
                    4FA3C364F1ECA08ABC1FDA7EB0AA7116E0F4DE02CF24E7F491C95B44D539AF23
                    FE0D7FCFB728C4E37D808AF17AF9484A68FFC58D0B67D0CC7545CE38C20DE8A8
                    C7D01909534F9AB095F04E53E0082D991D8B8A633A119B4F86DC29355835ABBD
                    5104BC13B33662537DB83384BE4D21310E3D2D1EC03DE99D3841515E1AD25C29
                    3E760092D574EDC30EDA0C6FFD026A0F43E989E961A30F8064973AD7D284F91C
                    BC529A396A84B531486C24CB448334618315D0E9ABF3BB95C4068B3028A41D15
                    9394D21112110611B05189EF31EF5B2971BC9DCEE6FF0EF7537F01E1E2F29539
                    10F6060000000049454E44AE426082}
                  ExplicitHeight = 103
                end
                object btObsDoCliente: TPngSpeedButton
                  Left = 265
                  Top = 2
                  Width = 132
                  Height = 90
                  Align = alLeft
                  Caption = 'Obs. do Cliente'
                  Flat = True
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = 12615680
                  Font.Height = -17
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  Layout = blGlyphTop
                  ParentFont = False
                  OnClick = btObsDoClienteClick
                  PngImage.Data = {
                    89504E470D0A1A0A0000000D49484452000000300000003008060000005702F9
                    87000000097048597300000B1300000B1301009A9C18000003B74944415478DA
                    ED594B48545118FECEF82CB032D2286A11510B1524D020431D235B48B5295C04
                    45B8A9082CD31E28E4D14293A4C7A6A85550110981506D7ACD8C45EF222285A2
                    4550D1C30A2AF33DF7F45D1FE838E3DC9933C6D5980FCEE5F8DF7BFEF37DFF9C
                    E7AFC01487B09B405480DD04A202EC2610156037818915205D1910A2004AA401
                    465CE0268E26C8FC1BA8BF9B8C9EFEA313C222DEBB1F95ABBF437AD6B0DFE271
                    FAED83506D50CA0559F0CA574053530CDA52EB592B37BF0CDE9BDA4B078D14BB
                    80CDDF4F4C1CD522FA7C479F15F469151483A511695F2B515CEC1D1450E3A9A2
                    B2C3160D4DB2E7A8EF1A64DE6334DC4B4257DF4E765848FB2A4DE62E92BF81C4
                    FED33850F813B26539F9ADA57D2BCB428BB65590CE3A81BA9614F41A1F68880F
                    FAB9C026543B2FF9D9A52B912F7FB0362D4CF23D98119F8C3D395DFE3E3D1C46
                    EAB245FB5EC43B16087E5CC48FAF5BF727AE30FAFB80FE4E5FB3580785B3E107
                    DF84DAC147B3AF2D763AE06D6065A33525145180BB94D5937A046CC72E0A70ED
                    A694E37633D1832A8B0A988202C42336BCCF4A024B1E4BC65411D0CD595FE2B3
                    944AE5806829E31ED218628F3D11B03597F931479FF0049473E33816F08DF49C
                    A6B3ED16D1DACCDDF68236FDDA3B99301CCF588BD111D087D99D49282D0A1C41
                    797729D7EED7413D086CE1AF775E5F8067190CF54457401BA39F3E7E7095E071
                    C4DC51132CFC78B505F8100F5FC06F207F16A43002BE95F7E67387FE1801394D
                    84330704D673085C0DF8AEC6CD898C63963E6C15007CE2AFE884CC7DE363959E
                    1C3ABA05EBC3DC1FF6F32202B24BF8488D4480098E73758A178B0750311CEFCA
                    495B09028E4F3F022BB80A3DD4E67FE4E64C74C77D81CF3C0B5D402FCB6D9E3C
                    1F4119A693FE41B3E0DAAC38FE452EFF58195C88E05E615CD4162044B6FFA937
                    2401EA0C1F92D1FB1CB48343B717C31BCB63B0DAA04D326C0417E0E5C4DD1CF0
                    12130CD2CD3B031A26810055C6A89FD0F22BDDE6FDA2D44E01CF519D9FC571A7
                    F4043CE5ADAAE32D6BF346595B87562B4D884C3E9C210A88F0DC62A2C653CD1D
                    5A8E181C9990792FB5FDC9562E18EDBF10DA2AA45228E05B44026ADDD930F078
                    540479EF369AF51D228B3EB68DE119504007CF3D4911911F88986B0EFDB647EC
                    27280604F85DEACDF3CE44753CF7DF0A18B8D4879A5699841848AB849AD89A7C
                    184A6C99082DB538D930945A343198DCAD63AD0296C95DDBC14B11EFE069ED55
                    23C9DD61D4DE4987210AA8217DFCF4BA5D70F491532B1CCA8583AB5A87ADFFD9
                    3F38A620A202EC465480DD880AB01B7F014BB65B16C7C52CBF0000000049454E
                    44AE426082}
                  ExplicitHeight = 103
                end
                object Panel40: TPanel
                  Tag = 99
                  Left = 1
                  Top = 1
                  Width = 394
                  Height = 1
                  Align = alTop
                  BevelOuter = bvNone
                  Color = 7960943
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWhite
                  Font.Height = -13
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  ParentBackground = False
                  ParentFont = False
                  TabOrder = 0
                  StyleElements = []
                  ExplicitWidth = 390
                end
              end
              object Panel14: TPanel
                Left = 0
                Top = 569
                Width = 396
                Height = 65
                Align = alBottom
                BevelOuter = bvNone
                Color = clWhite
                ParentBackground = False
                TabOrder = 2
                StyleElements = []
                ExplicitTop = 568
                ExplicitWidth = 392
                object btGravar: TPngSpeedButton
                  Left = 8
                  Top = 5
                  Width = 189
                  Height = 50
                  Flat = True
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = 12615680
                  Font.Height = -17
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  ParentFont = False
                  StyleElements = []
                  OnClick = btGravarClick
                  PngImage.Data = {
                    89504E470D0A1A0A0000000D49484452000000BE000000320806000000E20661
                    3E0000055A69545874584D4C3A636F6D2E61646F62652E786D7000000000003C
                    3F787061636B657420626567696E3D22EFBBBF222069643D2257354D304D7043
                    656869487A7265537A4E54637A6B633964223F3E0A3C783A786D706D65746120
                    786D6C6E733A783D2261646F62653A6E733A6D6574612F2220783A786D70746B
                    3D22584D5020436F726520352E352E30223E0A203C7264663A52444620786D6C
                    6E733A7264663D22687474703A2F2F7777772E77332E6F72672F313939392F30
                    322F32322D7264662D73796E7461782D6E7323223E0A20203C7264663A446573
                    6372697074696F6E207264663A61626F75743D22220A20202020786D6C6E733A
                    64633D22687474703A2F2F7075726C2E6F72672F64632F656C656D656E74732F
                    312E312F220A20202020786D6C6E733A657869663D22687474703A2F2F6E732E
                    61646F62652E636F6D2F657869662F312E302F220A20202020786D6C6E733A74
                    6966663D22687474703A2F2F6E732E61646F62652E636F6D2F746966662F312E
                    302F220A20202020786D6C6E733A70686F746F73686F703D22687474703A2F2F
                    6E732E61646F62652E636F6D2F70686F746F73686F702F312E302F220A202020
                    20786D6C6E733A786D703D22687474703A2F2F6E732E61646F62652E636F6D2F
                    7861702F312E302F220A20202020786D6C6E733A786D704D4D3D22687474703A
                    2F2F6E732E61646F62652E636F6D2F7861702F312E302F6D6D2F220A20202020
                    786D6C6E733A73744576743D22687474703A2F2F6E732E61646F62652E636F6D
                    2F7861702F312E302F73547970652F5265736F757263654576656E7423220A20
                    2020657869663A506978656C5844696D656E73696F6E3D22313930220A202020
                    657869663A506978656C5944696D656E73696F6E3D223530220A202020657869
                    663A436F6C6F7253706163653D2231220A202020746966663A496D6167655769
                    6474683D22313930220A202020746966663A496D6167654C656E6774683D2235
                    30220A202020746966663A5265736F6C7574696F6E556E69743D2232220A2020
                    20746966663A585265736F6C7574696F6E3D223330302F31220A202020746966
                    663A595265736F6C7574696F6E3D223330302F31220A20202070686F746F7368
                    6F703A436F6C6F724D6F64653D2233220A20202070686F746F73686F703A4943
                    4350726F66696C653D22735247422049454336313936362D322E31220A202020
                    786D703A4D6F64696679446174653D22323032342D31322D30365431373A3434
                    3A34392D30333A3030220A202020786D703A4D65746164617461446174653D22
                    323032342D31322D30365431373A34343A34392D30333A3030223E0A2020203C
                    64633A7469746C653E0A202020203C7264663A416C743E0A20202020203C7264
                    663A6C6920786D6C3A6C616E673D22782D64656661756C74223E426F74C3A36F
                    5F73616C7661723C2F7264663A6C693E0A202020203C2F7264663A416C743E0A
                    2020203C2F64633A7469746C653E0A2020203C786D704D4D3A486973746F7279
                    3E0A202020203C7264663A5365713E0A20202020203C7264663A6C690A202020
                    20202073744576743A616374696F6E3D2270726F6475636564220A2020202020
                    2073744576743A736F6674776172654167656E743D22416666696E6974792044
                    657369676E657220312E31302E34220A20202020202073744576743A7768656E
                    3D22323032342D31322D30365431373A34343A34392D30333A3030222F3E0A20
                    2020203C2F7264663A5365713E0A2020203C2F786D704D4D3A486973746F7279
                    3E0A20203C2F7264663A4465736372697074696F6E3E0A203C2F7264663A5244
                    463E0A3C2F783A786D706D6574613E0A3C3F787061636B657420656E643D2272
                    223F3E0F6C33CB0000018169434350735247422049454336313936362D322E31
                    000028917591BF4B425114C73F6A659451504343838435659441544383521654
                    831AF46BD1973F027F3CDE53425A8356A1206AE9D7507F41AD417310144510CD
                    CE452D15AFF3545022CFE5DCF3B9DF7BCFE1DE73C11A4A2A29BD610852E9AC16
                    F07B9D4BCB2B4E7B11074D74E26222ACE8EA7C703A445DFB7CC462C67BB759AB
                    FEB97FAD753DAA2B6069169E54542D2B3C233CB799554DDE13EE5212E175E10B
                    E1014D2E28FC60EA9132174D8E97F9DB642D14F081B543D819AFE1480D2B092D
                    252C2FC7954AE694CA7DCC9738A2E9C5A0C45EF11E7402F8F1E26496297C8C32
                    CCB8CCA3B8F130282BEAE40F95F217C848AE22B34A1E8D0DE224C832206A4EAA
                    4725C6448FCA489237FBFFB7AF7A6CC453AEEEF042E3AB61BCF7817D177E0A86
                    F17562183FA7607B81EB74353F730C631FA217AA9AEB08DAB7E1F2A6AA45F6E1
                    6A07BA9FD5B0162E4936716B2C066FE7D0B60C9D77D0B25AEE59659FB327086D
                    C957DDC2C121F4CBF9F6B55FB87C680B5FA75C75000000097048597300002E23
                    00002E230178A53F7600000E334944415478DAED9D095C4ED91BC77FEDA5ED4D
                    5128292265ADD128850A63C9DAF8D832F619CB9819D44C96993FC61659666418
                    92B564993018FB5631C63A9A501415459116EDEBFF9CA3F7EAED4D92B705E7DB
                    E77C6EEFB9DBB9F7FECEB9CFF39C73EF9543256975A09F1C996892D4902485CA
                    AEC7E1D400852425460E3AF2A2B22BC8553493889D0A7D24498348B22749A3B6
                    8F90C3A9800C9242493A4052404515E1B5C227A27722133F928C6BFB68389C2A
                    104BD23822FEB3E5CD94123E11BC3A99789134ADB64BCEE1C8001F923C4905C8
                    2C9D2921FC12D15F26C9A2B64BCBE1C890DB24D994167F59E1AF2593AF6BBB94
                    1C4E35B09608FF1BF10F41F82536FDE9DA2E1D87538D38896D7E26FC92E8CD7F
                    E08E2CE7C32686A47634DA2316FE7032D955DBA5E2706A80E144F8BBC5C2F726
                    9359B55D220EA706F026C2F7100BFF1C9974ABED12713835C039227C4739227A
                    79F2230DEF41AFACB2BC1206183922A7300F47E34350585C58DB45E2BC7FD0DE
                    5C1115BE09F9E77E6D97E64D682AA963A7BD175A693563BFFD1F1CC6CF611B6A
                    BB589CF713532AFC56E49F88DA2E494528C92B6293ED0274D66B2FE4A5E5BD80
                    EDB191282A2EAEEDE271DE3FCCEBBCF0E5E5E4E065350BFD0DBB4BE4DF4C89C4
                    B060EE8F73AA44DD17FE4C8B31F8D26CA874FE552FFC45EC7C0EA70AD46DE18F
                    34E9879FDA4D91CAF7890C804F44406D17EF9DF944AB253CDB7D85E6DAC6E4CE
                    268F3DF70E6371A41F94E514D150598484DC6414819B72D540DD15BEB34167AC
                    B599CB4C9DD204C59DC2DC1BBF1039545E10BA8A9A186DEC02739129139982BC
                    029E6426E1C2936BD8117704E985D9357E7C1A0AAA38D57333442ADA48C94943
                    DC8B783CCA78825961AB1068E7850E0D2CB1F5CE3E2CBBBBB5C6CBF611503785
                    DF5EC71CDBBA2C81AA82B2447E68D2754CFE67210A8A0A2ABDAD2EA23658FCC9
                    4C18A83764BF8B8A8B2047FF4A2AD4D3EC648C0B998DA8EC841A3DC62F0CFB60
                    8EF534C4A5C76348F0B7C828CC11E61DE9E683E6A266D81F7D0CB3C37D6AB45C
                    1F09754FF8C6EA8D11D8D51B3ACA5A12F9B7D3A2313AD4139905956F9DBBE9B4
                    C73AFB0550945744D8D33BD81819884BA9B7505C5C8C8EC4CC1861EA0227233B
                    2CBAEA03FFF8E3357A9C735B8DC768F32138191782E937BC24E6B5506B8C365A
                    2D109C7C1DCF0B326AB45C1F09B2153E6DA1F38AF2AB1C62D455116197C30A34
                    556F24919F9095846121EE789AF3BCD2DB9227ADFA3EFB55B0D0354348FC654C
                    BBB60479C5D2770A5A3962B31F2326274986E7F5CDAC68F71DFA9BF4C08E8820
                    66D7736A14D909DFB5694FB85B8E436A5E3A9686FB2238F1EA5BADAF466CDEED
                    F64BD1566426919F9E9F8111211E887EF1F0EDCA63D01D8B3F75473E318BFA9F
                    FCF2AD84AD24A7805186BD61A9630663CD2648CFCB404CFA43EC7F741AB73263
                    A596F76AFB0D5272D3883DBE0D365AE6E86FE88856C49F48C84AC4E9848B3894
                    745158D6B17E47F46EE28076BAAD61A26D8488E751884C95EE3FA477A5ADF70F
                    2022EBD571FF6C3105B945795814B199994A2EC64E282C2AC4FA885D084EB909
                    0BF5A698DC7238CE245CC29F892118DEA4271C0C3AB1062532351A1BA2F6223E
                    2F996D6B586367F435EACE7AC3E9FE3745FF21CC2B8DA5BA31061B3A93E3690E
                    75A57A789E93827BE931581FBD57CA371A6CD0158E8D3A63C3DD40D2F0C8637A
                    6B373454D3C3A5C4EBF0BABBFDAD35558DC846F8D49408F96CBB609ED0567FFC
                    C579B89A7CAB52EB2B10A1AD238E6C77031B897CBA9D7117E7E25AF2EDB72ED3
                    2F1D3CF09971379C7D781153AE2FA9F47AD4CC586EEDC1EE14AC0C8579502EF1
                    35720A73E113B60DBE717F4AAC736BC041E22C3FC58EBBFB31ABC324D6E12686
                    3AE1BFFDB7036BEFEF61BFDDCDDC30D16278A5CAB2EA5F5F6C8C3D20FCBED677
                    0FB20B7270E0FE714CB41C21E4FBDDDE83E5F7B663907E572CEBFC3D0E3F3845
                    EEBEAAE8D1D45E627B099989187E7E2616B49D064762E2952631EB19DC823DF0
                    30F7A99037D5C415D3DB8E65FE103D0F59C4CCD456D1623E125D7EC8D9E9482E
                    78F53C376D00069AF662E7688CB92B34955F8E8249C84884D3E9096F7D0DAB11
                    D9085F4F450721BDB7B31322A6B22D355D677EFBA918D6AC8F443E15CC775796
                    E178C2852A95696F176FB4D533C7A65BBBB032CABF52EB50F328C8610DCCEB37
                    47D8B33B587C733DFECB7800239506186B3A10235A0E64CEF1C83333F06F46B4
                    B01E153E8556E0D0842BF0BDBB1751598F30A3A51B5C5BF445667E167A9E18CF
                    EC7535796518ABEAE31B7337E25F7441107160B7DF3F28518EB9ED26A3937EFB
                    7285AF422A21DDCF8DA7E1587B7B0739F72224643FC5B517F704E1D3314CD4DA
                    F4BBB31BFEB17FA1B5663378D97CCF44FB3C27153AAADA08883C88AD0F0E429F
                    5C3B6F1B4FE6FC07DEFD13F3EF6C14F6E7DD6E067454B4B123FA00829FDF64A1
                    D5E66A8DB0AEF34F68A66544B671000B237C85E5C5C2CF259524B72017ABC236
                    2326330186F5F4B1EFF159D4216467EA6CEDB258624801A532B639ED9CA29D54
                    65591ABE09DBA20FA2AA84F6DA0E3DB5FA987F650D02134E556A9DA18D1CF1B3
                    CD2C16E9E9796A2272C81DA7343E1D7F20ADA803F319265D5D28E453E153311E
                    8F3D8F19FF7A0BB1770539799CE9E107FD7A7AF0BCE4850389AF3ADCBC898DEF
                    426CFC6D77F661699990A5EF273FC1BE894DB9C2A7E646644A3486877A209B98
                    3DA5292DFC05577EC19EC76784791E66A331C16218FB7FCD4D3F6C880912E68D
                    35EA074FAB29884A8D81CBF9373F793AC6B02F665B4FC595273731FA9FB942BE
                    58F874FF53427E62E6571D4576C26FA6D104810EDE10296B4AE457148D1968E4
                    042FAB9952F95B490BB32CDC17EF42984B1033513CFE5E2261635784D83CDA49
                    1CCE45E5389CCEBAD62C4A94446EF35D4F8E15F2C5C2B73EE48ACCA25C8975B6
                    D82C806D236B22E24D44C4AF2AF2BB08DFEDEC4C5C4DBF2B553EB1F0C39323F1
                    79A8E4708E3E0D3EC56ABB1F119FF118CEA72749CCB3D2344380D36A7637B03B
                    EEF6C6F3E454DF0ABF392C4434A928FD4A5514B1F00F1153CB236CCD3B5DBF6A
                    46B6519D0EF55FC6DF55E4DF1C7FB76BD0119B6CE733C194E65842281B8EF0AE
                    83CFCE386F46630D7D29F154C49E2E2BD04EAF35165EFD1501F127A4E63751D6
                    C5E93EDB98B9D3E1D010214A24167E479257B615FE9554A65EA432FD1EEE8FD5
                    D1AF1E727B17E13B1DFD020979D2775141F8CF88F02F480ADF4E6409BF6E5E78
                    F4E2317A9C91143E355F8EF4DA84177999E8747498C43C55E2FC0E36E8066BBD
                    36A8AFAAC346C9D232986A37C5FDB438F43D375558562CFCF28EA98E21FB387E
                    8F462F7B5CE5CABCB2677FDC29CC29E97135D73681BFFD72A82BAA492C439D58
                    EA14E796114F5508B05D06AB866DA4ECD68A38E6B89ED9AE9E979613B324586A
                    BE96821A2EBBEC65C7D0E9F050A1D3A922E1AFE9E08EDEC6DD6B5DF8B6DA16D8
                    D27D79B9C2375535C05F9FF94A09BFBD86297EB35B005D351D64E467E2716612
                    B2F373A0A6A40A339109177E594699B8E047E2A095655DE42EEC8B3D81DD5D57
                    A2A16A7D8979F7331E3167980E379605E28B4023193DC9ADBD90B4D26F6247E7
                    C5E53A9562A810763BFF8AE4EC147439315AC8FF50857FD269238C341BC39F38
                    B12BEE6E137C1EDAF7F17BD7C55CF8E5E16E310E13CD5CA5F2A9A3DBA08CE89F
                    E5A66058B03BE2B31265B67F1A7FDE43444A05E9757D03B63C3C5CEE72744018
                    BD9DD398B4F8C25D48B88A0957E64B2D3BABC5284CB21C81EB49E118F9B7A790
                    FF210A9F46B24EF6DEC242B8D647864A341C5CF815400797ADB072473FC38A1F
                    E5CD2AC8815BE80FCC099635341CE762E2CCA20C1BC303E0F360AF700169C4E5
                    F3468E986C310A815187F07BCC7EE6E4ED745CC94C9979975762FF9357E68E35
                    99B7AECB028854B4F075E8FF702AF99A30EF4314BEBE9208E7FBEE64FF8F3A33
                    83854B29F51535B0AED33C7424662417FE6BA0BD82BEB60B61A3D7B6DCF95484
                    5F5D9ACF9CDFEA404F490B2BAD3CF0A94147F69B76FEC4A43F4231D96F130D03
                    16D7A68EEA8C8B8B70FCD965B6CCF2B6DF6280694F964F63F9F4E21AD46BC02E
                    B49AA22A8EC69CC58C9B2B25F6F3210A9FF287FD2A58EAB6649D7367E32FB263
                    ECDAD8061ACAEAEC5CC4A6C773E1BF0E2D25750438AC400BCDA652F3E6DC58C3
                    86195727B453EAAB6683E162ECCCEC55650525964F2BC1B5C430F8DEDB874B69
                    B725969F603C00635AB9B27E000ABD03887B66FDE20E49EDE3A64B10EBADB53A
                    EC2A15FB178FC9591BB615EB1EEC13F297B4F91A439AF786EFAD5DF02ED3C1B6
                    DE6A0EEB595D767D3DB63E3C22E45FEEBD8BF586763BEA86A4FC34A972F46B60
                    8B95767371839862234A9962147AC7F2775A8D07690FD1E79CE4330ED4AC39D1
                    DB0FA939E9B03D3E4AC8A7156251C76F61D5F065C3451B035AA9E691EBB6B3FB
                    4A36B47B40B0F0563E2CB29C8ACF5BF42DF798EA1835333AB3919A1E028943AB
                    AFAA2BE4AD8DF067CE6E4D42C7E0B4566F8A8C826CD6359FFF86B734D03B468B
                    7A8688C88C456A41E66B9753975761DDFAA587168BA1269548411D290519120F
                    95BC2E5F5C4E4D0535A99199743F74BD8A9E1F1029AA238BD8E5E50DC8D356A8
                    87DCE27CA9CA49A1112B7A3EB2CB89A851B3C7A45E63DCC988415A6116CBA3CF
                    131490E54B6FABA263AA63D4DCB0E4E69A46F06C331116DACDB1392A085BA2F6
                    BFD5C3241C8E0CA9F9F1F8B455A84C6891C3A946EADE83281C4E0D60FEDEBC50
                    8AC39121A6EFD52B04391C19F0F21582F43FFED258CE47C4CB97C6D2FFF86BC2
                    391F1112AF09E71F86E07C2C487C18827F0A88F3311083D29F02A210F13B92C9
                    992A6F92C3A9FB487EFC4D0CFFDC27E703A6FCCF7D52F8079E391F28157FE099
                    5222FE65E02D3FE7C3805A31B34B8B9E22F7BAA54B6CFE2DE00E2FE7FD2486A4
                    F1629BBE2C7215AD5912EDA1AFEC1A44920378EF2EA76E43C771D39717D1A777
                    76D1E8CDEB1694ABF4262154047D9214DE663D0EA79AA10F56245624F4B2FC1F
                    152DF63329758F0E0000000049454E44AE426082}
                end
                object btSair: TPngSpeedButton
                  Left = 203
                  Top = 5
                  Width = 189
                  Height = 50
                  Flat = True
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = 12615680
                  Font.Height = -17
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  ParentFont = False
                  StyleElements = []
                  OnClick = btSairClick
                  PngImage.Data = {
                    89504E470D0A1A0A0000000D49484452000000BE000000320806000000E20661
                    3E0000055769545874584D4C3A636F6D2E61646F62652E786D7000000000003C
                    3F787061636B657420626567696E3D22EFBBBF222069643D2257354D304D7043
                    656869487A7265537A4E54637A6B633964223F3E0A3C783A786D706D65746120
                    786D6C6E733A783D2261646F62653A6E733A6D6574612F2220783A786D70746B
                    3D22584D5020436F726520352E352E30223E0A203C7264663A52444620786D6C
                    6E733A7264663D22687474703A2F2F7777772E77332E6F72672F313939392F30
                    322F32322D7264662D73796E7461782D6E7323223E0A20203C7264663A446573
                    6372697074696F6E207264663A61626F75743D22220A20202020786D6C6E733A
                    64633D22687474703A2F2F7075726C2E6F72672F64632F656C656D656E74732F
                    312E312F220A20202020786D6C6E733A657869663D22687474703A2F2F6E732E
                    61646F62652E636F6D2F657869662F312E302F220A20202020786D6C6E733A74
                    6966663D22687474703A2F2F6E732E61646F62652E636F6D2F746966662F312E
                    302F220A20202020786D6C6E733A70686F746F73686F703D22687474703A2F2F
                    6E732E61646F62652E636F6D2F70686F746F73686F702F312E302F220A202020
                    20786D6C6E733A786D703D22687474703A2F2F6E732E61646F62652E636F6D2F
                    7861702F312E302F220A20202020786D6C6E733A786D704D4D3D22687474703A
                    2F2F6E732E61646F62652E636F6D2F7861702F312E302F6D6D2F220A20202020
                    786D6C6E733A73744576743D22687474703A2F2F6E732E61646F62652E636F6D
                    2F7861702F312E302F73547970652F5265736F757263654576656E7423220A20
                    2020657869663A506978656C5844696D656E73696F6E3D22313930220A202020
                    657869663A506978656C5944696D656E73696F6E3D223530220A202020657869
                    663A436F6C6F7253706163653D2231220A202020746966663A496D6167655769
                    6474683D22313930220A202020746966663A496D6167654C656E6774683D2235
                    30220A202020746966663A5265736F6C7574696F6E556E69743D2232220A2020
                    20746966663A585265736F6C7574696F6E3D223330302F31220A202020746966
                    663A595265736F6C7574696F6E3D223330302F31220A20202070686F746F7368
                    6F703A436F6C6F724D6F64653D2233220A20202070686F746F73686F703A4943
                    4350726F66696C653D22735247422049454336313936362D322E31220A202020
                    786D703A4D6F64696679446174653D22323032342D31322D30365431373A3435
                    3A32312D30333A3030220A202020786D703A4D65746164617461446174653D22
                    323032342D31322D30365431373A34353A32312D30333A3030223E0A2020203C
                    64633A7469746C653E0A202020203C7264663A416C743E0A20202020203C7264
                    663A6C6920786D6C3A6C616E673D22782D64656661756C74223E626F74616F5F
                    736169723C2F7264663A6C693E0A202020203C2F7264663A416C743E0A202020
                    3C2F64633A7469746C653E0A2020203C786D704D4D3A486973746F72793E0A20
                    2020203C7264663A5365713E0A20202020203C7264663A6C690A202020202020
                    73744576743A616374696F6E3D2270726F6475636564220A2020202020207374
                    4576743A736F6674776172654167656E743D22416666696E6974792044657369
                    676E657220312E31302E34220A20202020202073744576743A7768656E3D2232
                    3032342D31322D30365431373A34353A32312D30333A3030222F3E0A20202020
                    3C2F7264663A5365713E0A2020203C2F786D704D4D3A486973746F72793E0A20
                    203C2F7264663A4465736372697074696F6E3E0A203C2F7264663A5244463E0A
                    3C2F783A786D706D6574613E0A3C3F787061636B657420656E643D2272223F3E
                    F14D34640000018169434350735247422049454336313936362D322E31000028
                    917591BF4B425114C73F6A659451504343838435659441544383521654831AF4
                    6BD1973F027F3CDE53425A8356A1206AE9D7507F41AD417310144510CDCE452D
                    15AFF3545022CFE5DCF3B9DF7BCFE1DE73C11A4A2A29BD610852E9AC16F07B9D
                    4BCB2B4E7B11074D74E26222ACE8EA7C703A445DFB7CC462C67BB759ABFEB97F
                    AD753DAA2B6069169E54542D2B3C233CB799554DDE13EE5212E175E10BE1014D
                    2E28FC60EA9132174D8E97F9DB642D14F081B543D819AFE1480D2B092D252C2F
                    C7954AE694CA7DCC9738A2E9C5A0C45EF11E7402F8F1E26496297C8C32CCB8CC
                    A3B8F130282BEAE40F95F217C848AE22B34A1E8D0DE224C832206A4EAA4725C6
                    448FCA489237FBFFB7AF7A6CC453AEEEF042E3AB61BCF7817D177E0A86F17562
                    183FA7607B81EB74353F730C631FA217AA9AEB08DAB7E1F2A6AA45F6E16A07BA
                    9FD5B0162E4936716B2C066FE7D0B60C9D77D0B25AEE59659FB327086DC957DD
                    C2C121F4CBF9F6B55FB87C680B5FA75C75000000097048597300002E2300002E
                    230178A53F7600000D1D4944415478DAED9D095C4ED91F87BF2D4A0BA5526991
                    6AA4427659C7140D33D6998CC1C8D290903526DBD0300CFE11CA328D75A88C18
                    656B646BEC658412322235A58544894AFCCF397AEF546FAFDE789B37398FCF71
                    DF7BEFB9F73DEFFD3CE7DEF33BE776AF02A4A459CFEF15C8A41E49FA242949BB
                    1D8753CD14939491707C716E55365278D34A223B157D38498348EA4692A6BC7F
                    258723813C92CE90144A5250651541A2F8447A4732D9429299BC7F11875345EE
                    913486C87F52520631F189F01A64B29CA449F22E3D87F38EF893349B5480A7E5
                    579411BF44FA68926CE55D620E47465C27A96379F9CB8BEF47261EF22E298723
                    63FC88F8534A2F10C42F69D31F977709399C6AC2B1749B9F895FD27B13071EC8
                    726A2F4924D9897A7B44E20F25936079978CC3A9668612F17FA31F44E2FB9089
                    A7BC4BC5E154333E44FC59F48348FC4832E921EF527138D54C2411DF817E5020
                    D22B92E963FCC7A3B2BA0D3461DFAA094C8D7410732D19176393E47D5038B51F
                    DABED726F2BFA4E29B93993BD5FD8DBADA1AE8D8CA1C1D5B37817D6B0B5898EA
                    09EB8A5E14C3C9C517E9594FE47D6038B51F0B22FE5D2A7E33327353D67B5755
                    518663676B263A15DEB271C337E6FF6ED95EEC3F7655DE078553FBB126E22754
                    8BF856E606F0F31E0A33635DA9B7F15ABE176147AFA24B3B4B282A94BD9322F3
                    612E12EF65A1F8E54B791F34CEFB4FF589EF337730FA39DA55691B91F8F147BC
                    A1A4A428B6FE36117FDAA25D6CCAE1BC03D527FE89C0193032D0AED23695894F
                    494CCEC28071EB505CCCCFFC15D1A39D197E9AF33562AE26C263F15E7917A7A6
                    527DE29F0CF644A3865A55DA461AF1295FBA6FC0F5DBF7ABB46FDDFA75E132A8
                    3DAC2D8D60D9C4104ACA8A48CF7884B3176F6147D8253CC92F94E5CF971B831C
                    6CB06CDE305CBB710F83276F9677716A2A35537C1A142B946AE3D3CF970FCE17
                    E6DDE70722F24282D4FBEDDACA144BBC06C350BF019B7F49E204BA4FD177643D
                    7C8C319E9B71FB9F1C991FE1FF1A2EBE54D44CF1CBA3A4A888F8086F617EC2F7
                    8138795E3AF1E9A57FDD92D1505656426C7C1202822271213605AF5EBD421BEB
                    461836D01E8EDDECF0E3EABD083CF4FEF72871F1A5A2768B4F7B86F6AC1B0B5B
                    2B539CBE701D93BC4350F8A2582C1FAD1CF7521F2129FDFD1F43E0E24B45ED16
                    DFB9972D96CC1E8AA2A262F41FE32BB5D85A1A2A18D2A715DAD999435F4F0BF9
                    CF0A709FC4034161D1B87C2BA34C5E93869A98E5E6844BB149F8F5C0657CDEAD
                    297A76B58589912EEE2667606F780C2E5EAF381ED1D75683EBE04EF8C8DC10DA
                    F5D5919A9E8DFD47AFE078F45DB1BC1FB76D0CA7EEB6B03433444161116EDF4D
                    C79EF0CB4848CE2E93EF4DE2776E698CCF1D5A9218C70075555590F9E031E26E
                    A6E0979068B113C258E70E68D1CC048BFDC3616BA98FB1433F86A6665D1C3E7E
                    059B7FFFABAA3AD4346AB7F86BE67D81DE0E6D70F24C1C2690B3BD34346BAC83
                    EDBEE3A0ADA5C19A43398F9F4253430D75EA28B19EA4853E21D873345EC8DFA9
                    8531B6AD1ECFAE28B4720C19D8B5CCFE9E171461CED260849FBD5D6679CF8EE6
                    58346B30741BD463F374DFA2807EE3F608ACDE71867DA657ADB9E37B62F897DD
                    A1A8A8C06455ABAB827A9A6A789AFF1C8B7DF721F4E40D61BF92C45F3CB50FBE
                    EADF857D7EF6BC1085A4F268D5D760F3376FA7C27962008A5FBE12F2FFBAC205
                    1DDB36C572FF304C1FDF172A7594D9F298D8440C9FB1FDEDC5A819C847FC9C27
                    F918336B1BBA77688A19639D84E5B2163FC4EF5BB4B431C32F3B8F61E5B65352
                    95DBB18339664FEA87E0D073D81B11C77A7B54487CE03DB937BEECDB89C9EDF0
                    8DAF905F24FE8BE262282B2921E4C039ECDC47CEA0E42AB3C873203AB4FE087F
                    DF49437FB78DC2361A759511BE6D2ABB9A1C3A7A09BE5B8E23233B1F5D5A9B62
                    8AAB131E66E7C1EDFB5D2CEFD03E2DE13DF32BA4A43E80E7A260C42666B1CA30
                    6A605B78790CC493DC7C7CEAE28B9CBC02965F92F854E4EC9C3CECF8FD3C2E27
                    64E025A9D4EDAC0DE1B7D8053AA4F22DF30BC5B6B09832F9A9F8F4EA92FD280F
                    3E1B0F21F7E97368AAABE2F099BF65A98A3C908FF8874EC6C1734908B9DCD641
                    CCC1F9C228ADACC53FF3DB4CE8E9D68737394BEFFA23EE9D7E4F5D15254485CE
                    85AA4A1D741AB444104D243EC56F7338D6059F17B63133A887C3BF7AB233F927
                    4396219DC84D99E6D20DEEA33E457A660E3E19BEAADC6F5580A18E06521FE4B1
                    E3726CE75434D2D7C1E8E91B11752DAD4CDE235B3D6066AA0FFF2D7FC03FE81C
                    5B56D536FE7CF79E1831B807C2C2A3E1B5F2A0B05C247E1E917DB8C706DC4A79
                    F44EC7AF86211FF145835076D626085E3356582E6BF1630F2F808A8A32662D0A
                    C48153D2777F4A223268060CF5B5F1B5BB3FAEDECE64CB44E2A7DE7F889E2E6B
                    C4B639B5CB939DD9474EDD88E8F8D7E2062C1E8A8F3BDBE2C4E9384CFC417213
                    CCD2581B87B6CF401A69FB3B8E582DB67EC9B4CFE0DCAF33BB6A782E0F63CBAA
                    2ABEEB17EDF1DDA4013813750363E7FDFB774822F14B37BB6A11F26BE327A765
                    435FB71E3BEB8B90B5F827764E8391A10E56FD7C100121D1552ABF7D0B231608
                    1A1069697B5F999CB5AD2C8D59451A36719D10E48AC4FF27ED017A8D5C2BB69F
                    C39B27C28204A41EF3B6E158D4EB1B600F04B8A3A98551A5E5A281F22A6F17D2
                    1E7F8107D9E281B9BA9A2A2BDB854B0918ED15C896BD497C51D06E6B650C1D6D
                    4D68A8BFDEDEC4480F67A36FE2DBB941425E91F83FAEFE1D3B0F5E790B036A34
                    B53BB80D5A351A6DED2CB02BF40CBCFD23A42A036DCFAFFF6108BAD9DBB081AE
                    94B487AC1DFD92047E364D4DAA2CFEA15F26C0D2BC5119F145578129F3B723E2
                    42A2C4B20CFFBC1516CC7066DF7FF9DA5D89F90E1DBB82FD7FBE3E1E92C477EA
                    6481E56439AD2C34604FCFCA410109BC1B10F11B9B34E4E2CB8A9A20FEF299FD
                    30B04F47A46564C38934434AF75A4862F638078CFEDA8105A493170495E9023D
                    1148AE20063AEF2CFEBEF56EB0B132A954AA6E24D8DDE4338E05B64EA3D6421A
                    2A129F06D3A743BCA0565715AB361EC0967D7F09C762340992674F1EC4C59715
                    3541FCE6167AD8BDC1830597B45B6E6BE8A50AF3D1B33C0D5E690FCEEE35AEB0
                    6BDE048B56ED45D0E1B2659195F81BC815C5A16B0B841F8FC1F49F4225969FF6
                    F39FDA330785452FD067C44AA43D7C8ACAA8487CDA75BA6EE9980A2B1017BF16
                    8A4FF1F11A807E4EED593F79C08EA3ACF74374B6A33D28839D5AC07D642FEC0A
                    3B879F774709CDA33D07CE63FE9A70613F93BFE98209A37AB3BEF47715BF6F77
                    2BAC5C388275154E98BD15E762FF61CB692FCEC8016DD8C0D1CC15FBD9B22D3F
                    0D47970ED638F6E7554C5FBA0F45E5EE4AB5326D8094CC5C3C2B78C1E62B129F
                    0E7E05AC18CB2A50AF61FF4366CE33B6DCBC9116D6FF3802E666065C7C595153
                    C4D7D352C3CAB9CEB06F67C5E6E9E04D5272261B9C326EA4C30671685B7EFAC2
                    1D38723E11E387D863BA5B5F26E5D9A89B48BC978176A422D0CAF0F8C95396FF
                    5DC5A704FB8E469B96162C708D894B24EDEE7C587F648C268DF571EEE24DB8CE
                    792DA1ADB92E76AE75676D735AEEABF149C8CACE25C1A9069A37334533B28DBB
                    D766445EBAC7F25724BE9AAA32C2B74E613D52741F91E7E359DBBE47E7E66C3D
                    0D70B9F832A2A6884FA167522A743FA7B63035D61346219F3D2BC0A5D83BD814
                    7C0A17AEA50A79E948E957033AB33E7B0ABD7BD37F4B04DADB3541FFDE1DE0EC
                    B616F1771EB075741028D07F22BB3DE133D77562DF1DBAC10DD6242876FB6E13
                    4EC5240BCBA98CDE93FBA0B7436B76FB00855602DAADB8747D38FEC9CA13F25A
                    186961E1D4FE68432A9FA8EC141AA49EFF2B01DE6B0FE3F1D3D7B7558BAE2697
                    E3EE60D8F46D42DE0EB68DB060DA40D69B44A1B77144C5DC824FC011ECDB340D
                    A7486518BFE03721BFE84AB360C56EEC8EB8264B356A021F86F8A5A943DAFB36
                    4D7491F7AC102919B9624D0711544C9AEF715E01125373846DD549A028924C04
                    ED262C20223D2F14BF018EC60F741BD18097F86F53808DB91EFBBE1B771F9072
                    15492C3BCD6BD558073A5AEAB89FF50449F79FB011D8F2686BAA22FFF90BB1FB
                    6F68A536D2D380B1417DC4FE9D29348FEAABABB0CFA58F05FDADF5D4EB203BB7
                    00B510D98A4F87B31DBB5893CBB20A66B8F642FD7A6A55DA5E5AF183F64723E1
                    4E06AE5C4F66530EA78AC84E7C7A3689D8310D26860DDE7A1FD28A5F1AF7793B
                    111975EB3F3D6A9CF71ED989AF4302A4D3BB67BDF14F062B4392F8943F77CD84
                    815E7DB1E5BE5B8EE1E720E96E40E3704A10C497C903A5463977C63703EC5953
                    E76D58E4771011A7AF57B8AE57571B788C74805E83D70F7B7B45FE5DB99E02EF
                    3507F1F0515E55BE86C3111E2825974708723872E0DF4708D239FED058CE07C2
                    BF0F8DA5FFF1C784733E10C41E13CE5F0CC1F910107B31047F1510A7B69384F2
                    AF02A210F969DBE784BC4BC7E15413E22F7F13C15FF7C9A9A5487EDD2785BFE0
                    99530BA9FC05CF9412F997819FF939EF3FB40533A7BCF41405495B94B4F9B782
                    07BC9CF78F24925C4BB7E9CBA3F0A6AD4B7A7B86913488A4EEE0A3BB9C9A0BBD
                    77E53449F4EF398345BD379250906A9725945404039294E4FD2B399C12E81F1E
                    6454267A79FE0F2739D58DA08A35B40000000049454E44AE426082}
                end
              end
            end
            object pgDesconto: TJvStandardPage
              Left = 0
              Top = 0
              Width = 396
              Height = 634
              Caption = '.'
              object JvLabel1: TJvLabel
                Left = 91
                Top = 332
                Width = 45
                Height = 13
                Caption = 'JvLabel1'
                Transparent = True
              end
              object rdPercentual: TRadioButton
                Left = 23
                Top = 88
                Width = 169
                Height = 30
                Caption = 'Percentual'
                Checked = True
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -24
                Font.Name = 'Arial Black'
                Font.Style = [fsBold]
                ParentFont = False
                TabOrder = 0
                TabStop = True
                OnEnter = Edit1Enter
              end
              object rdValor: TRadioButton
                Left = 248
                Top = 88
                Width = 118
                Height = 30
                Caption = 'Valor'
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -24
                Font.Name = 'Arial Black'
                Font.Style = [fsBold]
                ParentFont = False
                TabOrder = 1
                OnEnter = Edit1Enter
              end
              object edValorDesconto: TJvValidateEdit
                Left = 24
                Top = 124
                Width = 340
                Height = 65
                StyleElements = []
                CriticalPoints.MaxValueIncluded = False
                CriticalPoints.MinValueIncluded = False
                DisplayFormat = dfFloat
                DecimalPlaces = 2
                EditText = '0'
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -47
                Font.Name = 'Verdana'
                Font.Style = [fsBold]
                ParentFont = False
                TabOrder = 2
                OnEnter = Edit1Enter
                OnKeyDown = edValorDescontoKeyDown
              end
              object btAplicardesconto: TAdvGlassButton
                Left = 23
                Top = 202
                Width = 345
                Height = 54
                BackColor = 12615680
                Caption = 'Aplicar o desconto e voltar para o pagamento'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -19
                Font.Name = 'Tahoma'
                Font.Style = []
                ForeColor = clWhite
                GlowColor = 16760205
                ImageIndex = -1
                InnerBorderColor = clBlack
                Layout = blGlyphTop
                OuterBorderColor = clWhite
                ParentFont = False
                ShineColor = clWhite
                TabOrder = 3
                Version = '1.3.3.1'
                OnClick = btAplicardescontoClick
              end
              object Panel9: TPanel
                Tag = 99
                Left = 0
                Top = 0
                Width = 396
                Height = 58
                Align = alTop
                BevelOuter = bvNone
                Color = 12615680
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWhite
                Font.Height = -13
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentBackground = False
                ParentFont = False
                TabOrder = 4
                StyleElements = []
                object lbNomeTabelaEmUso: TLabel
                  Left = 0
                  Top = 0
                  Width = 396
                  Height = 58
                  Align = alClient
                  Alignment = taCenter
                  AutoSize = False
                  Caption = 
                    'Selecione o tipo de desconto, informe o valor e clique em aplica' +
                    'r'
                  Color = 3289650
                  Font.Charset = ANSI_CHARSET
                  Font.Color = clWhite
                  Font.Height = -17
                  Font.Name = 'Segoe UI'
                  Font.Style = [fsBold]
                  ParentColor = False
                  ParentFont = False
                  Transparent = True
                  Layout = tlCenter
                  WordWrap = True
                  StyleElements = []
                  ExplicitLeft = 27
                  ExplicitTop = 5
                  ExplicitWidth = 372
                end
              end
            end
            object pgTabelaPreco: TJvStandardPage
              Left = 0
              Top = 0
              Width = 396
              Height = 634
              Caption = 'pgTabelasPre'#231'o'
              object Panel23: TPanel
                Tag = 99
                Left = 0
                Top = 0
                Width = 396
                Height = 57
                Align = alTop
                Anchors = [akTop, akRight]
                Color = 12615680
                ParentBackground = False
                TabOrder = 0
                StyleElements = []
                object Label26: TLabel
                  Left = 712
                  Top = 13
                  Width = 48
                  Height = 29
                  Caption = '0001'
                  Font.Charset = ANSI_CHARSET
                  Font.Color = clWhite
                  Font.Height = -24
                  Font.Name = 'Calibri'
                  Font.Style = []
                  ParentFont = False
                  StyleElements = []
                end
                object Label27: TLabel
                  Left = 1
                  Top = 1
                  Width = 394
                  Height = 55
                  Align = alClient
                  Alignment = taCenter
                  Caption = 'Selecione a tabela de pre'#231'os'
                  Font.Charset = ANSI_CHARSET
                  Font.Color = clWhite
                  Font.Height = -24
                  Font.Name = 'Calibri'
                  Font.Style = []
                  ParentFont = False
                  Layout = tlCenter
                  StyleElements = []
                  ExplicitWidth = 280
                  ExplicitHeight = 29
                end
              end
              object DBCtrlGrid1: TDBCtrlGrid
                Left = 0
                Top = 57
                Width = 396
                Height = 577
                Align = alClient
                DataSource = dmPedidoDelivery.dsQryTabelaPrecos
                Font.Charset = DEFAULT_CHARSET
                Font.Color = 12615680
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                PanelHeight = 144
                PanelWidth = 379
                ParentFont = False
                TabOrder = 1
                RowCount = 4
                OnClick = DBCtrlGrid1Click
                OnPaintPanel = DBCtrlGrid1PaintPanel
              end
            end
            object pgObsClientes: TJvStandardPage
              Left = 0
              Top = 0
              Width = 396
              Height = 634
              Caption = ' '
              object Label8: TLabel
                Left = 5
                Top = 351
                Width = 299
                Height = 13
                Caption = 'Digite a nova observa'#231#227'o e clique no bot'#227'o abaixo para salvar.'
              end
              object Image1: TImage
                Left = 390
                Top = 215
                Width = 50
                Height = 51
                Picture.Data = {
                  0B546478504E47496D61676589504E470D0A1A0A0000000D4948445200000060
                  000000600806000000E29877380000000467414D410000B18F0BFC6105000000
                  097048597300000540000005400141B7BE810000001974455874536F66747761
                  7265007777772E696E6B73636170652E6F72679BEE3C1A00000B544944415478
                  5EED9D797013D71DC769A7E9DDFED17682B1C1C6604B322EA48514C80131605B
                  066C0A032E190E69D7064A3803A1100A0D2621094729BD53D2365ED9181BA195
                  0C9990A35092A621D09249E08F9E49264D9A49A633E941FE206981D7DF6FF594
                  4A4F3FC9AB3DA495BBDF99CF6074BCE3FBDBB7EFD8A7DD21AE5CB972E5CA952B
                  57AE5CB9CAAADAF0AA4F7BD4B6519E68DB0DBE68E026F8BB1EC1BFBD91C0387C
                  6FDC934B3FC53FEECA8C6A2252B54F95BFEE8D4A3F014E79A3C137E05FA693D7
                  01F88EF490272A2DAF3DD65EC593759549B5E1D68F7A62D25C8F2A7572032963
                  8D1393FE124F5BFE2AE6C5B375E55583B780417894BF936298BD605E0FF9FAE5
                  9B7931FECFD4D1F1614F341800132E249952285E025A87B0211FE2A51BDCF2C4
                  8233A0C2E7920CD085476D67A3C377B0917DEB5845DF9DACA277232B3FBC4903
                  FFC6D7F0BDD147576A9FA5D2C88E7CC61793EA7831079FE2A397E0A374E54564
                  CD6C34B6AC7B3B2B09DDCBAE57EECF09FC4EE9A1ED90C65D5A50304D3AAF54B4
                  321E5F5AC98B3D08044D1B46221B6114F32E55E164D0F4113D5BD850651769AA
                  198686EE63230E6F8160AC22F316B8049DF6FAA23F2DD5A84B8641654E0B954B
                  015A061CA51BD8D0AE9DA471765012EA8053D60638DA076A15F22F6BC35209AF
                  4E71499B1C65194EA2F1E5707A30727AB10A6C15E5709AC3B25065E4BCE68905
                  26F26A1587BCAABC000AFE9E50910F18091D66218D17C1406099A8B2722EE31C
                  8557CFD9F2C6E43BA0C057840A6854479641C7B88D34C109941DFA26AB5697A5
                  959B73C5A3CACB78359D29E868B71105D7A83CB2563BD2A88A3B092C6365780D
                  5907E09A3716DCCCABEB2CF1239F28B4AC9DEBAFB76164632758E60C43D76BB8
                  BEC4ABED0CF9A272100B2614146863653D5BC90A16036587B6421D32052118E0
                  D52FACF86827ADC3C5215E9983CFF77AC17E21C328E97275BF3C89DB5018E138
                  1F9AE3DBE98503F361064B55A818C119758696F056E1E609304B84D9E26362A1
                  20205AD3A52A52CC604BA082804B17059931C79717520B83C43B5CBA12C54EF9
                  61EC98D3EBEC55A53BB92DF9D1E87E7904B5B65379640D59F0C1C32E368A1EA2
                  5EF21E6B2BE5F6D82F688AC7C44254479617C538DF2C5847ACAB587F6805116E
                  8FBDF245647F5AE640E920EA7407A2AC7B5B5AFD35D4C0346E934DC28E377E05
                  2925E3CA23EBC8820E6646C1CC5EF40138C79DB247D4D18F63E4922EE72CACE5
                  8B92D04E7A7E60672BF0A9D2593143BC6A4515B0D858F0F41E363EF620F95E26
                  2AFA36A678C1799ADB65AD3CAAF41531333C020643C7DBF6FC5EF65BF65D76EA
                  F20136F198FE2060DDA95650A3CAE3B96DD6C9A3067F206634188EFE84F9E739
                  188449390401370388BEC004F500B7CD1A559D58FB3148F8EF624678698F2A54
                  B1209A9FE0F4FB07D8AD8FEA0B4249570778913643FEDB84832BAEE3F6999757
                  0DCE11328009C96AB240C54226F313E41204DC4C20FAE389056672FBCC0B66BD
                  8F88190CEFB99B2C4C31B0E8D93DEC37D768E393D9F0E23EF2FB22B8DB42F4C7
                  A3CA07B97DE60509A65E5C57655BB68EE483F6B37BB21EF909EE7A692FF97D0A
                  AD334E3F0DBDCCED3327DCA42424AC3539AA204EC70EF313C4377F093EF5CB23
                  B88DC6E58D05DBC584712B0755082763A7F908EEC0137DC22B85DC46E3820EF8
                  C762C2C5B6EED37E367B879B60D3057DE77C8AF8459B549F3C31E9FBDC46E3F2
                  C582BF484D18CEFF4534F9CA87F9087A92EA93C6E3DC46E38244FE9A9C28EE9B
                  A10AE044F2657E026257F66BDC4663C2DF5B412229BB1D8AA5035E762EBFE623
                  C47CE0EAC84EE9E3DCCEDC458D804616C1D27321CC4770595EF4CBD448087F79
                  2826887B28A9CC8D72DB89DDACB48B7ECF084B9ED337C9FAD6EFF6C15C864EC3
                  28D4BAD09848B096DB99BBF037546282562EC02DFC55DCAC836FEE6765DD0F90
                  9FC905BD47FE372C3EF21350CBD335AA3499DB99BBA80B30F893202AF35CF91A
                  373F618AD9202C2FB0F9487C3B63AA5F308A6CE476E62E3200166C3B697D863E
                  4D3C6C30084E301FC18353F4CB5C006C380565323F0106617837FD5D0AA7988F
                  587F0AEA97C68A099AE98447F53EC09EFD376D50323F7A7DBFAE8E3978469FF9
                  F7E8EC70CB941DCCABAC655F5264364959C86E56167C00FE1F5FF7C1FB65CA3D
                  E4F72DEF84ED1886FA9FDACDCE5CA18D4A66A096A0FBC8BF98FDC8C7555DAFB2
                  8E4D565AD90CA509F0EBA049FB3C062B7955981A86D68603E5DCCEDC454EC48E
                  9A9F88990D8255E67B94F56CAA328730583F5395162D1D4C0FBD49F60AB83A3C
                  DCFA096EA731E13D169213AD8EB4A755C4087A83F0532108ABCFEF253F2792CD
                  FC52A5834D541691861A05D3AB89A4988FBBE55EE5361A57FA629C64D9625CAE
                  4158F38279F3CB95ADDA514B996896BAAE596C6C64C9FFBC8A494F701B8D0B97
                  5493CD47AC5C8E6E3EB99B3DAF2308E177BEA3EBB4B3E3F7993BDC0A650BAB53
                  6693E659C5B450131B7B74712200E6774740426DC9E62378F181AAA051F4B684
                  81C876E48F50B683F9CDA46956332D3493D546965A744186BA24797425594933
                  980D4236F34B94FBD8ADCA3CD22C9199DD2DECFC9B2F64A4F9D05CF27B2253BB
                  67B31BFA021E6EA33981E9AFA404C1A68BF2468330D06867ACB29C3489020DCE
                  A6B987E793DF23E9F4DFCF2D34276A5B0A6EC5A02A6B965C833090F9C3E1D433
                  5D99491B4460690014FF7B90F7686EA37155ABC1D96200ECBC30A3370803998F
                  8C5702943119B13800AC3EE4EFE2361A57DDE98E8F50BF86B4736BE24041D8AC
                  C3FC6130DECFE5E847AC0E00F07EDDE1962F702B8DCB17957E2806C0EA8B3322
                  9982A0C77CA44659431992151B0280ACE6361A17DEB2450C80073B639BEF7A22
                  0641AFF98891D9AE1D01A80F353EC66D34276805CF8841C8C716F5C4646DE71F
                  BEAD6B553341A6717FEB91DBD9E37F7E92E4A9974F72AB699D7CE514F93DE4F6
                  F062323FE01FDC4273C28B0B6200B015E0166DCA002B997CFCC19CCC2F557650
                  466848B165DC4E6BB5FCD84A323F647AA8B98CDB684E60FAAFC52038F1F7C115
                  CADDA41148210230ADABD19AFB4AD444A506310088D3B62B8E52369346208508
                  000C47EBB985E6E58D495D620070991A7F39489951082A1D168006A56906B7CF
                  BCF8DD10FF2906213E3973C6EF062A94ADA411484102D0D57023B7CF1AF13B9B
                  A7040071CACD3A86293B4923904204C0FF33FFE7B875D6C91795A3E941906D5B
                  27CA954C971BE7F5B6B2D08BDD243D177BB99DB47A2FF691DF43E6F72D24F303
                  DEE696592B7CA00298FE472A084EB867D08DCA12CA8CACD83213EEF4F771CBAC
                  97936F5986BB1D4843B2604700A6773649DC2E7B04A7A2666F34F81F3108DAE9
                  A86733694E3E2851EE65D39459A42999B02100EFDEF2F3399FE156D927A7DEB6
                  32978B3188D501A8EFF4EFE616D92F5F4CDE4A07213E442DC43C019724EA7268
                  051607E05F759DB3F27B533F307B2590F1D6C585E817C628AB2973482C0D40C8
                  BF9EDB925FF962C1F96078C69B778F0EAF6225DD3B48B3EC6197EEA5E9A6EE66
                  76E24F4F6464D621BD3BE99A8E17F4F90303DDBE1EEFAAAB3D37204F7751C753
                  D11445DF8E060B7835EFA71E4A5527167F163AE1237400E2E072365E59CBC703
                  1CF002FD14937B4175F04643674335B7C001826618BFC7A8331E61E209AF6053
                  BB6CDB1D77A1F19146F3B727B043704AFA3CB486EF81D15745E3D3B1F7213E3E
                  35C86EEAD1B7512B073A5B0EB67C9257D7B9D21E63A54ACFA51A3E30763CC66A
                  DCD1456C0A74BA8499BA8171FED986AE99B7F1EA158FAA22812FF3EB0AE49035
                  4F5CC1324CEA9DD7066686804BC9E666013F172A4AE345D544DBBFE88B4AFBE9
                  BBB0DBC65BD027EDABEA97C7F062689A7070C27568EA74A571D3F490FFE1FA90
                  3F9C00FF8FAFD77736D5B50EC66751E2E62F5FBFD462F7C33C310FCC8B67EB2A
                  93CC3DCE56FBACF6385B9814AE701F676B91B23DD0195FC3F7F033FCE3AE5CB9
                  72E5CA952B57AE5CB9A23464C87F0135E84D51D39DF7D60000000049454E44AE
                  426082}
                Stretch = True
                OnClick = Image1Click
              end
              object JvDBGrid1: TJvDBGrid
                Left = 0
                Top = 58
                Width = 396
                Height = 281
                TabStop = False
                Align = alTop
                Ctl3D = True
                DataSource = dmPedidoDelivery.dsObservacoesClientes
                DrawingStyle = gdsGradient
                GradientEndColor = 33023
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -15
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
                ParentCtl3D = False
                ParentFont = False
                PopupMenu = popObservacoes
                TabOrder = 0
                TitleFont.Charset = DEFAULT_CHARSET
                TitleFont.Color = clWindowText
                TitleFont.Height = -16
                TitleFont.Name = 'MS Sans Serif'
                TitleFont.Style = []
                DotNetHighlighting = True
                AutoSort = False
                SelectColumnsDialogStrings.Caption = 'Select columns'
                SelectColumnsDialogStrings.OK = '&OK'
                SelectColumnsDialogStrings.NoSelectionWarning = 'At least one column must be visible!'
                ColumnResize = gcrNone
                EditControls = <>
                AutoSizeRows = False
                RowsHeight = 20
                TitleRowHeight = 25
                Columns = <
                  item
                    Expanded = False
                    FieldName = 'DATA'
                    ReadOnly = True
                    Title.Caption = 'Data'
                    Width = 75
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'OBSERVACAO'
                    ReadOnly = True
                    Title.Caption = 'Observa'#231#227'o'
                    Width = 335
                    Visible = True
                  end>
              end
              object edNovaObservacao: TCurvyEdit
                Left = 3
                Top = 365
                Width = 438
                Height = 24
                Caption = ''
                TabOrder = 1
                TabStop = False
                Version = '1.2.4.1'
                Controls = <>
                ImeName = ''
                Text = ''
              end
              object ckbAlertaPedidos: TcxCheckBox
                Left = 6
                Top = 408
                Caption = 'Exibir alerta nos pr'#243'ximos pedidos'
                Style.TransparentBorder = False
                TabOrder = 2
              end
              object ckbImprimeProducao: TcxCheckBox
                Left = 6
                Top = 424
                Caption = 'Imprimir na comanda de produ'#231#227'o'
                Style.TransparentBorder = False
                TabOrder = 3
              end
              object AdvGlassButton4: TAdvGlassButton
                Left = 17
                Top = 584
                Width = 345
                Height = 50
                BackColor = 12615680
                Caption = 'Voltar para o pagamento'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -19
                Font.Name = 'Tahoma'
                Font.Style = []
                ForeColor = clWhite
                GlowColor = 16760205
                ImageIndex = -1
                InnerBorderColor = clBlack
                Layout = blGlyphTop
                OuterBorderColor = clWhite
                ParentFont = False
                ShineColor = clWhite
                TabOrder = 4
                Version = '1.3.3.1'
                OnClick = AdvGlassButton2Click
              end
              object Panel49: TPanel
                Tag = 99
                Left = 0
                Top = 0
                Width = 396
                Height = 58
                Align = alTop
                BevelOuter = bvNone
                Color = 12615680
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWhite
                Font.Height = -13
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentBackground = False
                ParentFont = False
                TabOrder = 5
                StyleElements = []
                object Label15: TLabel
                  Left = 0
                  Top = 0
                  Width = 396
                  Height = 58
                  Align = alClient
                  Alignment = taCenter
                  AutoSize = False
                  Caption = 
                    'Selecione o tipo de desconto, informe o valor e clique em aplica' +
                    'r'
                  Color = 3289650
                  Font.Charset = ANSI_CHARSET
                  Font.Color = clWhite
                  Font.Height = -17
                  Font.Name = 'Segoe UI'
                  Font.Style = [fsBold]
                  ParentColor = False
                  ParentFont = False
                  Transparent = True
                  Layout = tlCenter
                  WordWrap = True
                  StyleElements = []
                  ExplicitLeft = 27
                  ExplicitTop = 5
                  ExplicitWidth = 372
                end
              end
              object AdvGlassButton6: TAdvGlassButton
                Left = 213
                Top = 395
                Width = 150
                Height = 50
                BackColor = 12615680
                Caption = 'Salvar '
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -19
                Font.Name = 'Tahoma'
                Font.Style = []
                ForeColor = clWhite
                GlowColor = 16760205
                ImageIndex = -1
                InnerBorderColor = clBlack
                Layout = blGlyphTop
                OuterBorderColor = clWhite
                ParentFont = False
                ShineColor = clWhite
                TabOrder = 6
                Version = '1.3.3.1'
                OnClick = AdvGlassButton6Click
              end
            end
            object pgUltimosPedidos: TJvStandardPage
              Left = 0
              Top = 0
              Width = 396
              Height = 634
              Caption = ' '
              object cxLabel10: TcxLabel
                Tag = 99
                Left = 3
                Top = 320
                Caption = #205'tens do pedido:'
                ParentFont = False
                Style.Font.Charset = ANSI_CHARSET
                Style.Font.Color = clWindowText
                Style.Font.Height = -15
                Style.Font.Name = 'Calibri'
                Style.Font.Style = [fsBold]
                Style.IsFontAssigned = True
                Transparent = True
              end
              object cxLabel11: TcxLabel
                Tag = 99
                Left = 3
                Top = -2
                Caption = 'Pedidos:'
                ParentFont = False
                Style.Font.Charset = DEFAULT_CHARSET
                Style.Font.Color = clWindowText
                Style.Font.Height = -11
                Style.Font.Name = 'MS Sans Serif'
                Style.Font.Style = [fsBold]
                Style.IsFontAssigned = True
                Transparent = True
              end
              object DBGrid2: TDBGrid
                Left = 3
                Top = 115
                Width = 450
                Height = 203
                DataSource = dmPedidoDelivery.dsUltimosPedidos
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -16
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
                ParentFont = False
                PopupMenu = popCopiarPedido
                ReadOnly = True
                TabOrder = 2
                TitleFont.Charset = DEFAULT_CHARSET
                TitleFont.Color = clWindowText
                TitleFont.Height = -11
                TitleFont.Name = 'MS Sans Serif'
                TitleFont.Style = []
                OnCellClick = DBGrid2CellClick
                Columns = <
                  item
                    Expanded = False
                    FieldName = 'DATA'
                    Title.Caption = 'Data'
                    Title.Font.Charset = DEFAULT_CHARSET
                    Title.Font.Color = clWindowText
                    Title.Font.Height = -16
                    Title.Font.Name = 'MS Sans Serif'
                    Title.Font.Style = []
                    Width = 75
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'HORA'
                    Title.Caption = 'Hora'
                    Title.Font.Charset = DEFAULT_CHARSET
                    Title.Font.Color = clWindowText
                    Title.Font.Height = -16
                    Title.Font.Name = 'MS Sans Serif'
                    Title.Font.Style = []
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'NOME_ENTREGADOR'
                    Title.Caption = 'Entregador'
                    Title.Font.Charset = DEFAULT_CHARSET
                    Title.Font.Color = clWindowText
                    Title.Font.Height = -16
                    Title.Font.Name = 'MS Sans Serif'
                    Title.Font.Style = []
                    Width = 148
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'VALOR_TOTAL'
                    Title.Caption = 'Total'
                    Title.Font.Charset = DEFAULT_CHARSET
                    Title.Font.Color = clWindowText
                    Title.Font.Height = -16
                    Title.Font.Name = 'MS Sans Serif'
                    Title.Font.Style = []
                    Width = 99
                    Visible = True
                  end>
              end
              object dbgItensPedido: TDBGrid
                Left = 3
                Top = 340
                Width = 450
                Height = 203
                DataSource = dmPedidoDelivery.dsQryItensUltimosPedidos
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -16
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
                ParentFont = False
                ParentShowHint = False
                ReadOnly = True
                ShowHint = True
                TabOrder = 3
                TitleFont.Charset = DEFAULT_CHARSET
                TitleFont.Color = clWindowText
                TitleFont.Height = -11
                TitleFont.Name = 'MS Sans Serif'
                TitleFont.Style = []
                OnCellClick = dbgItensPedidoCellClick
                Columns = <
                  item
                    Expanded = False
                    FieldName = 'DESCRICAO'
                    Title.Caption = 'Nome do produto'
                    Title.Font.Charset = DEFAULT_CHARSET
                    Title.Font.Color = clWindowText
                    Title.Font.Height = -13
                    Title.Font.Name = 'MS Sans Serif'
                    Title.Font.Style = []
                    Width = 263
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'QUANTIDADE'
                    Title.Caption = 'Qtde'
                    Title.Font.Charset = DEFAULT_CHARSET
                    Title.Font.Color = clWindowText
                    Title.Font.Height = -13
                    Title.Font.Name = 'MS Sans Serif'
                    Title.Font.Style = []
                    Width = 65
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'VALOR_UNITARIO'
                    Title.Caption = 'Pre'#231'o'
                    Title.Font.Charset = DEFAULT_CHARSET
                    Title.Font.Color = clWindowText
                    Title.Font.Height = -13
                    Title.Font.Name = 'MS Sans Serif'
                    Title.Font.Style = []
                    Width = 81
                    Visible = True
                  end>
              end
              object Panel18: TPanel
                Tag = 99
                Left = 0
                Top = 0
                Width = 396
                Height = 58
                Align = alTop
                BevelOuter = bvNone
                Color = 12615680
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWhite
                Font.Height = -13
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentBackground = False
                ParentFont = False
                TabOrder = 4
                StyleElements = []
                object Label6: TLabel
                  Left = 0
                  Top = 0
                  Width = 396
                  Height = 58
                  Align = alClient
                  Alignment = taCenter
                  AutoSize = False
                  Caption = #218'ltimos pedidos do cliente'
                  Color = 3289650
                  Font.Charset = ANSI_CHARSET
                  Font.Color = clWhite
                  Font.Height = -17
                  Font.Name = 'Segoe UI'
                  Font.Style = [fsBold]
                  ParentColor = False
                  ParentFont = False
                  Transparent = True
                  Layout = tlCenter
                  WordWrap = True
                  StyleElements = []
                  ExplicitLeft = 2
                  ExplicitTop = 5
                  ExplicitWidth = 393
                end
              end
              object AdvGlassButton2: TAdvGlassButton
                Left = 24
                Top = 585
                Width = 345
                Height = 50
                BackColor = 12615680
                Caption = 'Voltar para o pagamento'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -19
                Font.Name = 'Tahoma'
                Font.Style = []
                ForeColor = clWhite
                GlowColor = 16760205
                ImageIndex = -1
                InnerBorderColor = clBlack
                Layout = blGlyphTop
                OuterBorderColor = clWhite
                ParentFont = False
                ShineColor = clWhite
                TabOrder = 5
                Version = '1.3.3.1'
                OnClick = AdvGlassButton2Click
              end
              object cxLabel1: TcxLabel
                Tag = 99
                Left = 0
                Top = 91
                Caption = 'Selecione o pedido que deseja visualizar'
                ParentFont = False
                Style.Font.Charset = ANSI_CHARSET
                Style.Font.Color = clWindowText
                Style.Font.Height = -15
                Style.Font.Name = 'Calibri'
                Style.Font.Style = [fsBold]
                Style.IsFontAssigned = True
                Transparent = True
              end
            end
            object pgAgendamento: TJvStandardPage
              Left = 0
              Top = 0
              Width = 396
              Height = 634
              Caption = '.'
              object Panel48: TPanel
                Tag = 99
                Left = 0
                Top = 0
                Width = 396
                Height = 58
                Align = alTop
                BevelOuter = bvNone
                Color = 12615680
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWhite
                Font.Height = -13
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentBackground = False
                ParentFont = False
                TabOrder = 0
                StyleElements = []
                object Label10: TLabel
                  Left = 0
                  Top = 0
                  Width = 396
                  Height = 58
                  Align = alClient
                  Alignment = taCenter
                  AutoSize = False
                  Caption = 'Informe os dados de agendamento do pedido'
                  Color = 3289650
                  Font.Charset = ANSI_CHARSET
                  Font.Color = clWhite
                  Font.Height = -17
                  Font.Name = 'Segoe UI'
                  Font.Style = [fsBold]
                  ParentColor = False
                  ParentFont = False
                  Transparent = True
                  Layout = tlCenter
                  WordWrap = True
                  StyleElements = []
                  ExplicitLeft = 27
                  ExplicitTop = 5
                  ExplicitWidth = 372
                end
              end
              object AdvGlassButton3: TAdvGlassButton
                Left = 26
                Top = 157
                Width = 345
                Height = 50
                BackColor = 12615680
                Caption = 'Voltar para o pagamento'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -19
                Font.Name = 'Tahoma'
                Font.Style = []
                ForeColor = clWhite
                GlowColor = 16760205
                ImageIndex = -1
                InnerBorderColor = clBlack
                Layout = blGlyphTop
                OuterBorderColor = clWhite
                ParentFont = False
                ShineColor = clWhite
                TabOrder = 1
                Version = '1.3.3.1'
                OnClick = AdvGlassButton2Click
              end
            end
            object pgObservacoesLancamento: TJvStandardPage
              Left = 0
              Top = 0
              Width = 396
              Height = 634
              Caption = 'pgObservacoesLancamento'
              object Panel42: TPanel
                Tag = 99
                Left = 0
                Top = 0
                Width = 396
                Height = 58
                Align = alTop
                BevelOuter = bvNone
                Color = 12615680
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWhite
                Font.Height = -13
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentBackground = False
                ParentFont = False
                TabOrder = 0
                StyleElements = []
                object Label4: TLabel
                  Left = 0
                  Top = 0
                  Width = 396
                  Height = 58
                  Align = alClient
                  Alignment = taCenter
                  AutoSize = False
                  Caption = 'Digite as observa'#231#245'es do lan'#231'amento e confirme abaixo'
                  Color = 3289650
                  Font.Charset = ANSI_CHARSET
                  Font.Color = clWhite
                  Font.Height = -17
                  Font.Name = 'Segoe UI'
                  Font.Style = [fsBold]
                  ParentColor = False
                  ParentFont = False
                  Transparent = True
                  Layout = tlCenter
                  WordWrap = True
                  StyleElements = []
                  ExplicitLeft = 27
                  ExplicitTop = 5
                  ExplicitWidth = 372
                end
              end
              object Panel4: TPanel
                Left = 0
                Top = 58
                Width = 396
                Height = 195
                Align = alTop
                BevelOuter = bvNone
                Color = clWhite
                ParentBackground = False
                TabOrder = 1
                StyleElements = []
                object Label20: TLabel
                  Left = 23
                  Top = 30
                  Width = 220
                  Height = 21
                  Caption = 'Observa'#231#245'es do lan'#231'amento:'
                  Font.Charset = ANSI_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -16
                  Font.Name = 'Segoe UI'
                  Font.Style = [fsBold]
                  ParentFont = False
                end
                object memoObsLancamento: TMemo
                  Left = 23
                  Top = 60
                  Width = 356
                  Height = 120
                  Lines.Strings = (
                    '')
                  TabOrder = 0
                end
              end
              object pnAlteracaoPrecoProduto: TPanel
                Left = 0
                Top = 253
                Width = 396
                Height = 95
                Align = alTop
                BevelOuter = bvNone
                Color = clWhite
                ParentBackground = False
                TabOrder = 2
                StyleElements = []
                object lbAlterarPreco: TLabel
                  Left = 23
                  Top = 13
                  Width = 345
                  Height = 19
                  AutoSize = False
                  Caption = 'Digite o novo pre'#231'o para o produto'
                  Font.Charset = ANSI_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -16
                  Font.Name = 'Segoe UI'
                  Font.Style = [fsBold]
                  ParentFont = False
                end
                object edPrecoAlteracaoProduto: TCurrencyEdit
                  Tag = 2
                  Left = 23
                  Top = 37
                  Width = 356
                  Height = 32
                  AutoSize = False
                  Color = clWhite
                  DisplayFormat = 'R$ ,0.00;'
                  Font.Charset = ANSI_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -19
                  Font.Name = 'Segoe UI'
                  Font.Style = []
                  MaxLength = 30
                  ParentFont = False
                  TabOrder = 0
                  OnEnter = Edit1Enter
                  OnExit = Edit1Exit
                  OnKeyDown = Edit1KeyDown
                end
              end
              object pnConfirmarAlteracao: TPanel
                Left = 0
                Top = 348
                Width = 396
                Height = 70
                Align = alTop
                BevelOuter = bvNone
                Color = clWhite
                ParentBackground = False
                TabOrder = 3
                StyleElements = []
                object AdvGlassButton5: TAdvGlassButton
                  Left = 22
                  Top = 6
                  Width = 360
                  Height = 50
                  BackColor = 12615680
                  Caption = 'Confirmar e voltar'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -19
                  Font.Name = 'Tahoma'
                  Font.Style = []
                  ForeColor = clWhite
                  GlowColor = 16760205
                  ImageIndex = -1
                  InnerBorderColor = clBlack
                  Layout = blGlyphTop
                  OuterBorderColor = clWhite
                  ParentFont = False
                  ShineColor = clWhite
                  TabOrder = 0
                  Version = '1.3.3.1'
                  OnClick = AdvGlassButton5Click
                end
              end
            end
            object pgImportarMesa: TJvStandardPage
              Left = 0
              Top = 0
              Width = 396
              Height = 634
              Caption = 'pgImportarMesa'
              object Panel32: TPanel
                Tag = 99
                Left = 0
                Top = 0
                Width = 396
                Height = 58
                Align = alTop
                BevelOuter = bvNone
                Color = 12615680
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWhite
                Font.Height = -13
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentBackground = False
                ParentFont = False
                TabOrder = 0
                StyleElements = []
                object Label32: TLabel
                  Left = 0
                  Top = 0
                  Width = 396
                  Height = 58
                  Align = alClient
                  Alignment = taCenter
                  AutoSize = False
                  Caption = 'Importar movimento de mesa existente'
                  Color = 3289650
                  Font.Charset = ANSI_CHARSET
                  Font.Color = clWhite
                  Font.Height = -17
                  Font.Name = 'Segoe UI'
                  Font.Style = [fsBold]
                  ParentColor = False
                  ParentFont = False
                  Transparent = True
                  Layout = tlCenter
                  WordWrap = True
                  StyleElements = []
                  ExplicitLeft = 27
                  ExplicitTop = 5
                  ExplicitWidth = 372
                end
              end
              object Panel37: TPanel
                Left = 0
                Top = 58
                Width = 396
                Height = 95
                Align = alTop
                BevelOuter = bvNone
                Color = clWhite
                ParentBackground = False
                TabOrder = 1
                StyleElements = []
                object Label34: TLabel
                  Left = 23
                  Top = 13
                  Width = 345
                  Height = 19
                  AutoSize = False
                  Caption = 'Selecione a mesa '
                  Font.Charset = ANSI_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -16
                  Font.Name = 'Segoe UI'
                  Font.Style = [fsBold]
                  ParentFont = False
                end
                object cbMesaImportar: TcxLookupComboBox
                  Left = 22
                  Top = 38
                  ParentFont = False
                  Properties.KeyFieldNames = 'COD_MESA'
                  Properties.ListColumns = <
                    item
                      Caption = 'Mesa'
                      FieldName = 'COD_MESA'
                    end>
                  Properties.ListSource = dmPedidoDelivery.dsQryMesasAbertas
                  Style.Font.Charset = ANSI_CHARSET
                  Style.Font.Color = clWindowText
                  Style.Font.Height = -19
                  Style.Font.Name = 'Segoe UI'
                  Style.Font.Style = []
                  Style.IsFontAssigned = True
                  TabOrder = 0
                  Width = 360
                end
              end
              object Panel38: TPanel
                Left = 0
                Top = 153
                Width = 396
                Height = 70
                Align = alTop
                BevelOuter = bvNone
                Color = clWhite
                ParentBackground = False
                TabOrder = 2
                StyleElements = []
                object AdvGlassButton7: TAdvGlassButton
                  Left = 22
                  Top = 6
                  Width = 360
                  Height = 50
                  BackColor = 12615680
                  Caption = 'Confirmar e voltar'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -19
                  Font.Name = 'Tahoma'
                  Font.Style = []
                  ForeColor = clWhite
                  GlowColor = 16760205
                  ImageIndex = -1
                  InnerBorderColor = clBlack
                  Layout = blGlyphTop
                  OuterBorderColor = clWhite
                  ParentFont = False
                  ShineColor = clWhite
                  TabOrder = 0
                  Version = '1.3.3.1'
                  OnClick = AdvGlassButton7Click
                end
              end
            end
          end
          object Panel8: TPanel
            Tag = 99
            Left = 0
            Top = 0
            Width = 2
            Height = 634
            Align = alLeft
            BevelOuter = bvNone
            BevelWidth = 2
            Color = 7960943
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -13
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentBackground = False
            ParentFont = False
            TabOrder = 1
            StyleElements = []
            ExplicitHeight = 633
          end
        end
        object pnLadoEsquerdo: TPanel
          Left = 0
          Top = 0
          Width = 840
          Height = 634
          Align = alLeft
          BevelOuter = bvNone
          TabOrder = 1
          ExplicitHeight = 633
          object pnTopo: TPanel
            Left = 0
            Top = 0
            Width = 840
            Height = 127
            Align = alTop
            Color = clWhite
            ParentBackground = False
            TabOrder = 0
            StyleElements = []
            object btPesqCliente: TSpeedButton
              Tag = 99
              Left = 119
              Top = 36
              Width = 33
              Height = 35
              Flat = True
              Glyph.Data = {
                36030000424D3603000000000000360000002800000010000000100000000100
                18000000000000030000C40E0000C40E000000000000000000007CADD782BAE7
                84BEEC84BEEC84BEEC7FB5E19DC2E1FFFFFFFFFFFF9DC2E17FB5E184BEEC84BE
                EC84BEEC82BAE77CADD75897CC7BB8E986C3F286C3F286C3F26FADDF81B1D9FF
                FFFFFFFFFF81B1D96FADDF86C3F286C3F286C3F27BB8E95897CC5897CC7BB8E9
                86C3F286C3F286C3F26FADDF81B1D9FFFFFFFFFFFF81B1D96FADDF86C3F286C3
                F286C3F27BB8E95897CCEAEEEB7F84548D9160939564939564858754CBCDB9FF
                FFFFFFFFFFCBCDB98587549395649395648D91607F8454EAEEEBFFFEFE858348
                908B4D989252989252888447A2B2AAB6D1E9B6D1E9A2B2AA8884479892529892
                52908B4D858348FFFEFEFFFFFF94915E8F8A4C989252989252888447688E9858
                97CC5897CC688E988884479892529892528F8A4C94915EFFFFFFFFFFFFA2A074
                8E894B9892529892528884478BA4A391BADD91BADD8BA4A38884479892529892
                528E894BA2A074FFFFFFFFFFFFB2B08B8C884A989252989252888447D0CFB8FF
                FFFFFFFFFFD0CFB88884479892529892528C884AB2B08BFFFFFFFFFFFFC1BFA1
                8B8749989252989252888447D0CFB8DDDCCCDDDCCCD0CFB88884479892529892
                528B8749C1BFA1FFFFFFFFFFFFCFCEB7898548989252989252888447688E9865
                90A26590A2688E98888447989252989252898548CFCEB7FFFFFFFFFFFFDFDECE
                88844798925298925288844771939B689FCB689FCB71939B8884479892529892
                52888447DFDECEFFFFFFFFFFFFF7F6F2C4C3A68D894B938E4E93915BEDEDE4FF
                FFFFFFFFFFEDEDE493915B938E4E8D894BC4C3A6F7F6F2FFFFFFFFFFFFFFFFFF
                F3F3ED8A86499892529D9B6BFFFFFFFFFFFFFFFFFFFFFFFF9D9B6B9892528A86
                49F3F3EDFFFFFFFFFFFFFFFFFFFFFFFFF6F6F28F91619491579FA384FFFFFFFF
                FFFFFFFFFFFFFFFF9FA3849491578F9161F6F6F2FFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFF73A9D673B1E2A6C8E4FFFFFFFFFFFFFFFFFFFFFFFFA6C8E473B1E273A9
                D6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE8E7D8A5AA87A0A685AFB08CFCFCFAFF
                FFFFFFFFFFFCFCFAAFB08CA0A685A5AA87E8E7D8FFFFFFFFFFFF}
              OnClick = btPesqClienteClick
            end
            object Label37: TLabel
              Left = 6
              Top = 26
              Width = 104
              Height = 15
              Caption = 'Telefone do cliente'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Calibri'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Panel3: TPanel
              Tag = 99
              Left = 1
              Top = 1
              Width = 838
              Height = 16
              Align = alTop
              BevelOuter = bvNone
              Color = 7960943
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWhite
              Font.Height = -13
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentBackground = False
              ParentFont = False
              TabOrder = 0
              StyleElements = []
              object Shape1: TShape
                Left = 0
                Top = 0
                Width = 21
                Height = 16
                Align = alLeft
                Pen.Color = 40176
                Pen.Width = 10
                Shape = stCircle
              end
              object Label36: TLabel
                Left = 21
                Top = 0
                Width = 817
                Height = 16
                Align = alClient
                Caption = 'Dados e endere'#231'o do cliente'
                Font.Charset = ANSI_CHARSET
                Font.Color = clWhite
                Font.Height = -15
                Font.Name = 'Calibri'
                Font.Style = [fsBold]
                ParentFont = False
                StyleElements = []
                ExplicitWidth = 176
                ExplicitHeight = 18
              end
            end
            object edTelClienteDelivery: TEdit
              Tag = 99
              Left = 3
              Top = 43
              Width = 111
              Height = 27
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -16
              Font.Name = 'Calibri'
              Font.Style = [fsBold]
              ParentFont = False
              TabOrder = 4
              StyleElements = []
              OnEnter = Edit1Enter
              OnExit = Edit1Exit
              OnKeyDown = edTelClienteDeliveryKeyDown
            end
            object edCodbairro: TEdit
              Left = 451
              Top = -20
              Width = 31
              Height = 21
              TabOrder = 2
              Visible = False
              StyleElements = []
            end
            object edCodClienteDelivery: TEdit
              Left = 414
              Top = -20
              Width = 31
              Height = 21
              TabOrder = 1
              Visible = False
              StyleElements = []
            end
            object Panel20: TPanel
              Left = 120
              Top = 24
              Width = 709
              Height = 45
              BevelOuter = bvNone
              Color = clWhite
              Enabled = False
              ParentBackground = False
              TabOrder = 3
              StyleElements = []
              object Label38: TLabel
                Left = 5
                Top = 2
                Width = 91
                Height = 15
                Caption = 'Nome do cliente'
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -13
                Font.Name = 'Calibri'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object Label43: TLabel
                Left = 285
                Top = 2
                Width = 47
                Height = 15
                Caption = 'Telefone'
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -13
                Font.Name = 'Calibri'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object Label44: TLabel
                Left = 399
                Top = 2
                Width = 38
                Height = 15
                Caption = 'Celular'
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -13
                Font.Name = 'Calibri'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object Label40: TLabel
                Left = 511
                Top = 2
                Width = 33
                Height = 15
                Caption = 'Bairro'
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -13
                Font.Name = 'Calibri'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object edNomeCliente: TEdit
                Tag = 99
                Left = 4
                Top = 18
                Width = 276
                Height = 27
                Color = 15724527
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -16
                Font.Name = 'Calibri'
                Font.Style = [fsBold]
                ParentFont = False
                TabOrder = 0
                StyleElements = []
                OnEnter = Edit1Enter
                OnExit = Edit1Exit
                OnKeyDown = edTelClienteDeliveryKeyDown
              end
              object edTelClienteConsulta: TEdit
                Tag = 99
                Left = 286
                Top = 18
                Width = 105
                Height = 27
                Color = 15724527
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -16
                Font.Name = 'Calibri'
                Font.Style = [fsBold]
                ParentFont = False
                TabOrder = 1
                StyleElements = []
                OnEnter = Edit1Enter
                OnExit = Edit1Exit
                OnKeyDown = edTelClienteDeliveryKeyDown
              end
              object edCelularCliente: TEdit
                Tag = 99
                Left = 399
                Top = 18
                Width = 105
                Height = 27
                Color = 15724527
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -16
                Font.Name = 'Calibri'
                Font.Style = [fsBold]
                ParentFont = False
                TabOrder = 2
                StyleElements = []
                OnEnter = Edit1Enter
                OnExit = Edit1Exit
                OnKeyDown = edTelClienteDeliveryKeyDown
              end
              object edBairroCliente: TEdit
                Tag = 99
                Left = 511
                Top = 18
                Width = 196
                Height = 27
                Color = 15724527
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -16
                Font.Name = 'Calibri'
                Font.Style = [fsBold]
                ParentFont = False
                TabOrder = 3
                StyleElements = []
                OnEnter = Edit1Enter
                OnExit = Edit1Exit
                OnKeyDown = edTelClienteDeliveryKeyDown
              end
            end
            object Panel21: TPanel
              Left = 3
              Top = 75
              Width = 831
              Height = 60
              BevelOuter = bvNone
              Color = clWhite
              Enabled = False
              ParentBackground = False
              TabOrder = 5
              StyleElements = []
              object Label46: TLabel
                Left = 3
                Top = 0
                Width = 51
                Height = 15
                Caption = 'Endere'#231'o'
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -13
                Font.Name = 'Calibri'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object Label47: TLabel
                Left = 403
                Top = 0
                Width = 152
                Height = 15
                Caption = 'Complemento e refer'#234'ncia:'
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -13
                Font.Name = 'Calibri'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object edEnderecoCliente: TEdit
                Tag = 99
                Left = 3
                Top = 17
                Width = 396
                Height = 27
                Color = 15724527
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -16
                Font.Name = 'Calibri'
                Font.Style = [fsBold]
                ParentFont = False
                TabOrder = 0
                StyleElements = []
                OnEnter = Edit1Enter
                OnExit = Edit1Exit
                OnKeyDown = edTelClienteDeliveryKeyDown
              end
              object edComplementoCliente: TEdit
                Tag = 99
                Left = 403
                Top = 17
                Width = 419
                Height = 27
                Color = 15724527
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -16
                Font.Name = 'Calibri'
                Font.Style = [fsBold]
                ParentFont = False
                TabOrder = 1
                StyleElements = []
                OnEnter = Edit1Enter
                OnExit = Edit1Exit
                OnKeyDown = edTelClienteDeliveryKeyDown
              end
            end
          end
          object pnProduto: TPanel
            Tag = 99
            Left = 0
            Top = 143
            Width = 840
            Height = 59
            Align = alTop
            Color = clWhite
            ParentBackground = False
            TabOrder = 1
            StyleElements = []
            object btPesqProdutoCodBarras: TSpeedButton
              Tag = 99
              Left = 154
              Top = 14
              Width = 33
              Height = 36
              Flat = True
              Glyph.Data = {
                360C0000424D360C000000000000360000002800000020000000200000000100
                180000000000000C0000EB0A0000EB0A00000000000000000000FFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFE
                F1F1F1DFDFDFDFDFDFE9E9E9DFDFDFDDDDDDE4E4E4DDDDDDDFDFDFE9E9E9DFDF
                DFDDDDDDE4E4E4DDDDDDDFDFDFE9E9E9DFDFDFDDDDDDE4E4E4DDDDDDDFDFDFE9
                E9E9DFDFDFDDDDDDE4E4E4DDDDDDDFDFDFF1F1F1FEFEFEFFFFFFFFFFFFF1F1F1
                BBBBBB8D8D8D939393B3B3B39393938D8D8DA4A4A48D8D8D939393B3B3B39393
                938D8D8DA4A4A48D8D8D939393B3B3B39393938D8D8DA4A4A48D8D8D939393B3
                B3B39393938D8D8DA4A4A48D8D8D8D8D8DBBBBBBF1F1F1FFFFFFFFFFFFCEB2A5
                993300993300A791869A34019A3401A87E69993300993300AC958A9A34019A34
                01A87E69993300993300AC958A9A34019A3401A87E69993300993300AC958A9A
                34019A3401A87E69993300993300937F768D8D8DE0E0E0FFFFFFFFFFFF9A3401
                A16E55A67258D1C1B9BE8265BC8164D4B7A9BD8164BC8164DECDC5BE8265BC81
                64D4B7A9BD8164BC8164DECDC5BE8265BC8164D4B7A9BD8164BC8164DECDC5BE
                8265BC8164D4B7A9BD8164B77D619A3401939393DFDFDFFFFFFFFFFFFF9A3401
                AB755BC3C3C3F1F1F1FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFBE82659A3401B3B3B3E9E9E9FFFFFFFFFFFFCDB1A4
                9B8F89AAAAAAECECECFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFDECDC5AC958A939393DFDFDFFFFFFFFFFFFF9A3401
                A16E55AAAAAAECECECFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8F8
                F8E9E9E9DEDEDEE0E0E0ECECECFBFBFBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFBC81649A3401939393DFDFDFFFFFFFFFFFFF9A3401
                AB755BC3C3C3F2F2F2FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF4F4F4D0D0
                D09B9B9B7E7E7E848484A8A8A8DBDBDBF9F9F9FFFFFFFFFFFFFFFFFFFDFDFDF8
                F8F8F7F7F7FCFCFCFFFFFFBE82659A3401B3B3B3E9E9E9FFFFFFFFFFFFCDB1A4
                9B8F89AAAAAAECECECFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF5F5F5C4C4C46D6F
                6F4A4F524A4C4F6162626565659A9A9AE0E0E0FDFDFDFFFFFFF6F6F6DEDEDEC7
                C7C7C3C3C3D7D7D7EEEEEEDBCAC2AC958A939393DFDFDFFFFFFFFFFFFF9A3401
                A16E55AAAAAAECECECFFFFFFFFFFFFFFFFFFFFFFFFF6F6F6C7C7C76C6F708977
                6CC3987DC59E877B787658595B6B6B6BB9B9B9F1F1F1F2F2F2C8C8C88B8B8B75
                75756C6C6C808080B6B6B6B77D619A3401939393DFDFDFFFFFFFFFFFFF9A3401
                AB755BC3C3C3F2F2F2FFFFFFFFFFFFFFFFFFF5F5F5C6C6C66C6E6E847971F9C0
                8DF3BF8EF0BB8BEBB5896C6A6A696A6A919191D1D1D1BCBCBC686A6B5D5E5F67
                67694A4D50666666777777AB765B9A3401B3B3B3E9E9E9FFFFFFFFFFFFCDB1A4
                9B8F89AAAAAAECECECFFFFFFFFFFFFF3F3F3C4C4C45F5F5F6F7275CAA787FFDA
                A9FFD7ABFFD5A9FFD29CCAAB8F5C5E606A6A6A9090906A6D6E988170E5AB81E0
                A87DC9A8924F54576565658E837E9C877D929292DFDFDFFFFFFFFFFFFF9A3401
                A16E55AAAAAAECECECFEFEFEF1F1F1BEBEBE5E5E5E6E6E6E909396CAA991FFE7
                C5FFE3CBFFE2C5FFDBB4F9CCA144484C686868555656797775FFCF97FFD09DFE
                CE99FCC490B39F8C595B5C95664F9A3401929292DFDFDFFFFFFFFFFFFF9A3401
                AB755BC3C3C3EFEFEFEEEEEEB8B8B85656566F6F6F949494A4A7A8AC9992FFE6
                D3FFFAEFFFF0E0FFE7C8E3C09F3C40433C3C3C88898BA2948BFFE1B4FFDDBDFF
                DCBAFFD8ABF4C89D4C4F549767509A3401B2B2B2E9E9E9FFFFFFFFFFFFCDB1A4
                9B8F89A7A7A7D8D8D8AFAFAF535353424242959595AAAAAABBBBBCBAB9BCB597
                8EF2E8E6FFF6E9FFF1D284786E3B3D3E919191AAABACA09896FFE1C5FFF1DFFF
                ECD8FFE2C3FFD3A74D51558E837E9C877D929292DFDFDFFFFFFFFFFFFF9A3401
                A16E559C9C9C9F9F9F444444606060515151848484C7C7C7D3D3D3E4E5E5A8A8
                A9957D7BA58980806F6B4E5052535354B6B6B6BFBFBFBABDBFC3A89CFFF9F5FF
                FFF7FFF4D7CAAE956E7071AB755B9A3401939393DFDFDFFFFFFFFFFFFF9A3401
                AB755B9797973C3C3C9B9B9BEEEEEE7B7B7B4F4F4FBBBBBBF4F4F4FFFFFFFFFF
                FF909393666969717373676767303030CECECED4D4D4E6E8E8B4B1B2A98E89D4
                B5A8C6A69569686AB7B8B8B97F629A3401B3B3B3E9E9E9FFFFFFFFFFFFCDB1A4
                998E88585858393939EDEDED848484B5B5B5C2C2C25D5D5D909090B3B3B35A5A
                5A3F3F3F5151516A6A6A5D5D5D606060EDEDEDF4F4F4FFFFFFFFFFFFBBBEBF6E
                6E6F949495D1D1D1F4F4F4DCCBC3AC9489939393DFDFDFFFFFFFFFFFFF9A3401
                A16E554B4B4B4848488B8B8BBCBCBCCCCCCCCACACAC7C7C79A9A9A7575755E5E
                5E4F4F4F4D4D4D3D3D3D3A3A3A7C7C7CBEBEBED8D8D8C2C2C27F7F7F595A5ABE
                BEBEF4F4F4FEFEFEFFFFFFBC81649A3401939393DFDFDFFFFFFFFFFFFF9A3401
                AB755B6C6C6C505050787878D6D6D6CBCBCBBEBEBEB6B6B6B2B2B2AFAFAFABAB
                ABA3A3A39595958A8A8A7E7E7E717171696969353535434343ABABABF1F1F1FD
                FDFDFFFFFFFFFFFFFFFFFFBE82659A3401B3B3B3E9E9E9FFFFFFFFFFFFCDB1A4
                9B8F899F9F9F6161615A5A5A565656898989A5A5A5B1B1B1AFAFAFA6A6A69E9E
                9E9E9E9E9F9F9FA2A2A2A8A8A8919191545454919191E6E6E6FBFBFBFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFDECDC5AC958A939393DFDFDFFFFFFFFFFFFF9A3401
                A16E55AAAAAADBDBDBB3B3B3B1B1B1C8C8C8ABABAB8A8A8A7676766B6B6B7373
                737B7B7B7F7F7F7D7D7D5E5E5E777777D5D5D5F8F8F8FFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFBC81649A3401939393DFDFDFFFFFFFFFFFFF9A3401
                AB755BC3C3C3F2F2F2FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0F0F09999
                995D5D5D666666A2A2A2D3D3D3F8F8F8FEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFBE82659A3401B3B3B3E9E9E9FFFFFFFFFFFFCDB1A4
                9B8F89AAAAAAECECECFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFDECDC5AC958A939393DFDFDFFFFFFFFFFFFF9A3401
                A16E55AAAAAAECECECFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFBC81649A3401939393DFDFDFFFFFFFFFFFFF9A3401
                AB755BC3C3C3F1F1F1FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFBE82659A3401B3B3B3E9E9E9FFFFFFFFFFFFCDB1A4
                9B8F89A4A4A4DCDCDCF1F1F1ECECECEBEBEBEFEFEFEBEBEBECECECF1F1F1ECEC
                ECEBEBEBEFEFEFEBEBEBECECECF1F1F1ECECECEBEBEBEFEFEFEBEBEBECECECF1
                F1F1ECECECEBEBEBEEEEEED1C1B9A79186939393DFDFDFFFFFFFFFFFFF9A3401
                A06D55838383A4A4A4C3C3C3AAAAAAA6A6A6B7B7B7A6A6A6AAAAAAC3C3C3AAAA
                AAA6A6A6B7B7B7A6A6A6AAAAAAC3C3C3AAAAAAA6A6A6B7B7B7A6A6A6AAAAAAC3
                C3C3AAAAAAA6A6A6B7B7B7A571589A34018D8D8DE0E0E0FFFFFFFFFFFF9A3401
                AD775CA06D559B8F89AB755BA16E559A857BA67258A06D559B8F89AB755BA16E
                559A857BA67258A06D559B8F89AB755BA16E559A857BA67258A06D559B8F89AB
                755BA16E559A857BA67258A06D559A3401BBBBBBF1F1F1FFFFFFFFFFFFE0C2B3
                993300993300CDB1A49A34019A3401BE8F77993300993300CDB1A49A34019A34
                01BE8F77993300993300CDB1A49A34019A3401BE8F77993300993300CDB1A49A
                34019A3401BE8F77993300993300CDB1A4F1F1F1FEFEFEFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
              OnClick = botao_pesquisaClick
            end
            object Label35: TLabel
              Left = 5
              Top = 59
              Width = 462
              Height = 13
              AutoSize = False
              Caption = 
                'Utilize ctrl+R para alternar a visualiza'#231#227'o dos produtos entre o' +
                's modos resumido / detalhado'
              Color = 12615680
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWhite
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentColor = False
              ParentFont = False
              Transparent = True
              StyleElements = []
            end
            object Label1: TLabel
              Left = 4
              Top = 3
              Width = 175
              Height = 15
              AutoSize = False
              Caption = 'C'#243'd. do produto'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Calibri'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label2: TLabel
              Left = 196
              Top = 2
              Width = 175
              Height = 15
              AutoSize = False
              Caption = 'Nome do produto / Descri'#231#227'o'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Calibri'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label5: TLabel
              Left = 650
              Top = 2
              Width = 50
              Height = 15
              AutoSize = False
              Caption = 'Pre'#231'o'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Calibri'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label3: TLabel
              Left = 749
              Top = 3
              Width = 82
              Height = 15
              AutoSize = False
              Caption = 'Quantidade'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Calibri'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object edQuantidade: TEdit
              Tag = 99
              Left = 748
              Top = 19
              Width = 84
              Height = 27
              Color = clWhite
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Height = -16
              Font.Name = 'Calibri'
              Font.Style = []
              ParentFont = False
              TabOrder = 3
              StyleElements = []
              OnEnter = Edit1Enter
              OnExit = edQuantidadeExit
              OnKeyDown = Edit1KeyDown
            end
            object edCodBarrasProduto: TEdit
              Tag = 99
              Left = 3
              Top = 21
              Width = 149
              Height = 27
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Height = -16
              Font.Name = 'Calibri'
              Font.Style = []
              ParentFont = False
              TabOrder = 0
              StyleElements = []
              OnChange = edCodBarrasProdutoChange
              OnEnter = Edit1Enter
              OnExit = edCodBarrasProdutoExit
              OnKeyDown = Edit1KeyDown
            end
            object edCodProduto: TEdit
              Tag = 99
              Left = 872
              Top = -36
              Width = 125
              Height = 35
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Height = -24
              Font.Name = 'Arial'
              Font.Style = []
              ParentFont = False
              TabOrder = 1
              Visible = False
              StyleElements = []
              OnEnter = Edit1Enter
              OnExit = Edit1Exit
              OnKeyDown = Edit1KeyDown
            end
            object Panel6: TPanel
              Left = 191
              Top = 14
              Width = 554
              Height = 35
              BevelOuter = bvNone
              Caption = 'Panel1'
              Color = clWhite
              Enabled = False
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Height = -16
              Font.Name = 'Calibri'
              Font.Style = []
              ParentBackground = False
              ParentFont = False
              TabOrder = 2
              StyleElements = []
              object edValorUnitarioProduto: TEdit
                Tag = 99
                Left = 459
                Top = 5
                Width = 93
                Height = 27
                Color = 15724527
                Font.Charset = ANSI_CHARSET
                Font.Color = clBlack
                Font.Height = -16
                Font.Name = 'Calibri'
                Font.Style = []
                ParentFont = False
                ReadOnly = True
                TabOrder = 0
                StyleElements = []
              end
              object edDescricaoProduto: TEdit
                Tag = 99
                Left = 3
                Top = 5
                Width = 450
                Height = 27
                Color = 15724527
                Font.Charset = ANSI_CHARSET
                Font.Color = clBlack
                Font.Height = -16
                Font.Name = 'Calibri'
                Font.Style = []
                ParentFont = False
                TabOrder = 1
                StyleElements = []
              end
            end
          end
          object Panel27: TPanel
            Tag = 99
            Left = 0
            Top = 127
            Width = 840
            Height = 16
            Align = alTop
            BevelOuter = bvNone
            Color = 7960943
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -13
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentBackground = False
            ParentFont = False
            TabOrder = 2
            StyleElements = []
          end
          object pgListMovimentoProdutos: TJvPageList
            Left = 0
            Top = 202
            Width = 840
            Height = 347
            ActivePage = pgProdutosPedido
            PropagateEnable = False
            Align = alClient
            ExplicitHeight = 346
            object pgResumoProdutos: TJvStandardPage
              Left = 0
              Top = 0
              Width = 840
              Height = 347
              object cxGrid1: TcxGrid
                Left = 0
                Top = 0
                Width = 840
                Height = 347
                ParentCustomHint = False
                Align = alClient
                TabOrder = 0
                object cxGrid1DBTableView1: TcxGridDBTableView
                  Navigator.Buttons.CustomButtons = <>
                  ScrollbarAnnotations.CustomAnnotations = <>
                  DataController.DataSource = dmPedidoDelivery.dsMovimentoResumido
                  DataController.Summary.DefaultGroupSummaryItems = <
                    item
                      Kind = skSum
                      Position = spFooter
                      Column = cxgrdbclmnGrid1DBTableView1QUANTIDADE
                    end
                    item
                      Kind = skSum
                      Column = cxgrdbclmnGrid1DBTableView1QUANTIDADE
                    end
                    item
                      Kind = skSum
                      Position = spFooter
                      Column = cxgrdbclmnGrid1DBTableView1TOTAL
                    end
                    item
                      Kind = skSum
                      Column = cxgrdbclmnGrid1DBTableView1TOTAL
                    end>
                  DataController.Summary.FooterSummaryItems = <
                    item
                      Kind = skSum
                      Column = cxgrdbclmnGrid1DBTableView1QUANTIDADE
                    end
                    item
                      Kind = skSum
                      Column = cxgrdbclmnGrid1DBTableView1TOTAL
                    end>
                  DataController.Summary.SummaryGroups = <>
                  OptionsData.CancelOnExit = False
                  OptionsData.Deleting = False
                  OptionsData.DeletingConfirmation = False
                  OptionsData.Editing = False
                  OptionsData.Inserting = False
                  OptionsView.Footer = True
                  OptionsView.GroupByBox = False
                  Styles.Content = cxStyle1
                  Styles.ContentEven = cxStyle2
                  object cxgrdbclmnGrid1DBTableView1COD_BARRAS: TcxGridDBColumn
                    Caption = 'C'#243'digo'
                    DataBinding.FieldName = 'COD_BARRAS'
                    DataBinding.IsNullValueType = True
                    Width = 65
                  end
                  object cxgrdbclmnGrid1DBTableView1DESCRICAO: TcxGridDBColumn
                    Caption = 'Descri'#231#227'o do produto'
                    DataBinding.FieldName = 'DESCRICAO'
                    DataBinding.IsNullValueType = True
                    Width = 226
                  end
                  object cxgrdbclmnGrid1DBTableView1QUANTIDADE: TcxGridDBColumn
                    Caption = 'Qtde'
                    DataBinding.FieldName = 'QUANTIDADE'
                    DataBinding.IsNullValueType = True
                    Width = 102
                  end
                  object cxgrdbclmnGrid1DBTableView1VALOR_UNITARIO: TcxGridDBColumn
                    Caption = 'Pre'#231'o'
                    DataBinding.FieldName = 'VALOR_UNITARIO'
                    DataBinding.IsNullValueType = True
                    PropertiesClassName = 'TcxCurrencyEditProperties'
                    Width = 86
                  end
                  object cxgrdbclmnGrid1DBTableView1TOTAL: TcxGridDBColumn
                    Caption = 'Total'
                    DataBinding.FieldName = 'TOTAL'
                    DataBinding.IsNullValueType = True
                    PropertiesClassName = 'TcxCurrencyEditProperties'
                    Width = 126
                  end
                end
                object cxGrid1Level1: TcxGridLevel
                  GridView = cxGrid1DBTableView1
                end
              end
            end
            object pgProdutosPedido: TJvStandardPage
              Left = 0
              Top = 0
              Width = 840
              Height = 347
              Caption = 'pgProdutosPedido'
              ExplicitHeight = 346
              object cxGrid2: TcxGrid
                Left = 0
                Top = 16
                Width = 840
                Height = 331
                Align = alClient
                BevelInner = bvNone
                BevelOuter = bvNone
                BorderStyle = cxcbsNone
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -15
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 0
                LookAndFeel.NativeStyle = True
                ExplicitHeight = 330
                object tbViewDetalhado: TcxGridDBTableView
                  PopupMenu = PopMovimento
                  OnDblClick = tbViewDetalhadoDblClick
                  Navigator.Buttons.CustomButtons = <>
                  ScrollbarAnnotations.CustomAnnotations = <>
                  OnEditKeyDown = tbViewDetalhadoEditKeyDown
                  DataController.DataSource = dm.dsTbMovimentoMesa
                  DataController.Summary.DefaultGroupSummaryItems = <
                    item
                      Format = '# Lan'#231'amento(s)'
                      Kind = skCount
                      Position = spFooter
                      Column = tbViewDetalhadoDESCRICAO
                    end
                    item
                      Kind = skSum
                      Position = spFooter
                    end
                    item
                      Format = '#0.000'
                      Kind = skSum
                    end
                    item
                      Kind = skSum
                      Position = spFooter
                    end
                    item
                      Format = '#0.000'
                      Kind = skSum
                    end
                    item
                      Format = '#0.00'
                      Kind = skSum
                      Position = spFooter
                      Column = tbViewDetalhadoTOTAL
                    end
                    item
                      Format = '#0.00'
                      Kind = skSum
                      Column = tbViewDetalhadoTOTAL
                    end
                    item
                      Kind = skSum
                      Position = spFooter
                      Column = tbViewDetalhadoQuantidade
                    end
                    item
                      Kind = skSum
                      Position = spFooter
                      Column = tbViewDetalhadoDESCONTO
                    end
                    item
                      Kind = skSum
                      Column = tbViewDetalhadoDESCONTO
                    end>
                  DataController.Summary.FooterSummaryItems = <
                    item
                      Format = '# Lan'#231'amento(s)'
                      Kind = skCount
                      Column = tbViewDetalhadoDESCRICAO
                    end
                    item
                      Kind = skSum
                    end
                    item
                      Format = '#0.000'
                      Kind = skSum
                    end
                    item
                      Format = '#0.00'
                      Kind = skSum
                      Column = tbViewDetalhadoTOTAL
                    end
                    item
                      Kind = skSum
                      Column = tbViewDetalhadoQuantidade
                    end
                    item
                      Kind = skSum
                      Column = tbViewDetalhadoDESCONTO
                    end>
                  DataController.Summary.SummaryGroups = <>
                  OptionsBehavior.DragHighlighting = False
                  OptionsBehavior.DragOpening = False
                  OptionsBehavior.DragScrolling = False
                  OptionsBehavior.ShowHourglassCursor = False
                  OptionsBehavior.ColumnHeaderHints = False
                  OptionsBehavior.CopyPreviewToClipboard = False
                  OptionsBehavior.ExpandMasterRowOnDblClick = False
                  OptionsBehavior.ImmediateEditor = False
                  OptionsCustomize.ColumnHidingOnGrouping = False
                  OptionsCustomize.ColumnHorzSizing = False
                  OptionsCustomize.ColumnMoving = False
                  OptionsData.CancelOnExit = False
                  OptionsData.Deleting = False
                  OptionsData.DeletingConfirmation = False
                  OptionsData.Inserting = False
                  OptionsSelection.HideFocusRectOnExit = False
                  OptionsSelection.UnselectFocusedRecordOnExit = False
                  OptionsView.NoDataToDisplayInfoText = 'Sem dados para exibir'
                  OptionsView.CellAutoHeight = True
                  OptionsView.ExpandButtonsForEmptyDetails = False
                  OptionsView.Footer = True
                  OptionsView.GridLineColor = clBlack
                  OptionsView.GroupByBox = False
                  OptionsView.GroupFooterMultiSummaries = True
                  OptionsView.GroupFooters = gfVisibleWhenExpanded
                  OptionsView.GroupRowHeight = 24
                  OptionsView.GroupSummaryLayout = gslAlignWithColumns
                  OptionsView.Indicator = True
                  OptionsView.IndicatorWidth = 7
                  Styles.Content = cxStyle1
                  Styles.ContentOdd = cxStyle2
                  object tbViewDetalhadoCOD_BARRAS: TcxGridDBColumn
                    Caption = 'C'#243'digo'
                    DataBinding.FieldName = 'COD_BARRAS'
                    DataBinding.IsNullValueType = True
                    Options.Editing = False
                    Width = 55
                  end
                  object tbViewDetalhadoDESCRICAO: TcxGridDBColumn
                    Caption = 'Descri'#231#227'o'
                    DataBinding.FieldName = 'DESCRICAO'
                    DataBinding.IsNullValueType = True
                    Options.Editing = False
                    Width = 300
                  end
                  object tbViewDetalhadoQuantidade: TcxGridDBColumn
                    Caption = 'Qtde'
                    DataBinding.FieldName = 'Quantidade'
                    DataBinding.IsNullValueType = True
                    PropertiesClassName = 'TcxCurrencyEditProperties'
                    Properties.DisplayFormat = ',0.000;- ,0.000'
                    Options.Editing = False
                    Width = 75
                  end
                  object tbViewDetalhadoVALOR_UNITARIO: TcxGridDBColumn
                    Caption = 'Pre'#231'o'
                    DataBinding.FieldName = 'VALOR_UNITARIO'
                    DataBinding.IsNullValueType = True
                    PropertiesClassName = 'TcxCurrencyEditProperties'
                    Options.Editing = False
                    Width = 75
                  end
                  object tbViewDetalhadoDESCONTO: TcxGridDBColumn
                    Caption = 'Desc.'
                    DataBinding.FieldName = 'DESCONTO'
                    DataBinding.IsNullValueType = True
                    Options.Editing = False
                    Width = 50
                  end
                  object tbViewDetalhadoTOTAL: TcxGridDBColumn
                    Caption = 'Total'
                    DataBinding.FieldName = 'TOTAL'
                    DataBinding.IsNullValueType = True
                    PropertiesClassName = 'TcxCurrencyEditProperties'
                    Options.Editing = False
                    Width = 90
                  end
                  object tbViewDetalhadoOBSERVACOES: TcxGridDBColumn
                    Caption = 'Observa'#231#245'es'
                    DataBinding.FieldName = 'Observacoes'
                    DataBinding.IsNullValueType = True
                    Options.Editing = False
                    Width = 140
                  end
                end
                object lvDetalhado: TcxGridLevel
                  GridView = tbViewDetalhado
                end
              end
              object Panel7: TPanel
                Tag = 99
                Left = 0
                Top = 0
                Width = 840
                Height = 16
                Align = alTop
                BevelOuter = bvNone
                Color = 7960943
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWhite
                Font.Height = -13
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentBackground = False
                ParentFont = False
                TabOrder = 1
                StyleElements = []
                object Label17: TLabel
                  Left = 0
                  Top = 0
                  Width = 840
                  Height = 16
                  Align = alClient
                  Alignment = taCenter
                  Caption = #204'tens'
                  Font.Charset = ANSI_CHARSET
                  Font.Color = clWhite
                  Font.Height = -15
                  Font.Name = 'Roboto'
                  Font.Style = [fsBold]
                  ParentFont = False
                  StyleElements = []
                  ExplicitWidth = 33
                  ExplicitHeight = 18
                end
              end
            end
          end
          object Panel29: TPanel
            Left = 0
            Top = 554
            Width = 840
            Height = 80
            Align = alBottom
            BevelOuter = bvNone
            Color = clWhite
            Enabled = False
            ParentBackground = False
            TabOrder = 4
            StyleElements = []
            ExplicitTop = 553
            object Panel30: TPanel
              Left = 0
              Top = 9
              Width = 190
              Height = 61
              BevelOuter = bvNone
              Color = 9918251
              Enabled = False
              ParentBackground = False
              TabOrder = 0
              StyleElements = []
              DesignSize = (
                190
                61)
              object Label21: TLabel
                Left = 0
                Top = 0
                Width = 190
                Height = 21
                Align = alTop
                Alignment = taRightJustify
                Anchors = [akRight, akBottom]
                AutoSize = False
                Caption = 'Produtos'
                Font.Charset = ANSI_CHARSET
                Font.Color = clWhite
                Font.Height = -17
                Font.Name = 'Calibri'
                Font.Style = [fsBold]
                ParentFont = False
                Transparent = True
                StyleElements = []
                ExplicitLeft = 141
                ExplicitWidth = 64
              end
              object AdvOfficeImage2: TAdvOfficeImage
                Left = 17
                Top = 3
                Width = 48
                Height = 49
                Anchors = [akLeft]
                Picture.Data = {
                  89504E470D0A1A0A0000000D49484452000000400000004008040000000060B9
                  550000000467414D410000B18F0BFC6105000000206348524D00007A26000080
                  840000FA00000080E8000075300000EA6000003A98000017709CBA513C000000
                  02624B47440000AA8D2332000000097048597300000EC400000EC401952B0E1B
                  0000000774494D4507E3071F01020DAB1B2C5D00000A604944415468DEBDD969
                  9496D59107F0FFDB80A07117B7A8891AA246D946630617D404CF04155CD051C7
                  C1313A4AA2C19918A3C6ED98E4B864704693A833A331EEE6008A4B70413D262E
                  A831021E05DC11141117864590A5E9EEDF7C786FBFFD76378A104EEEA77AAAEA
                  DEAAE756DDBA5575934EC3600F9AEC2A9B642D86AD5D6F8AFBECB336B393384A
                  8BEA98A2DB1ACFDEC8DB657693FDD64E812918E7548B306C8D679F81F79DE471
                  3CB8760A2CC0FE8909F8C91ACFBE12B724FE11AFAE9D028F61BA9B34E1C0359E
                  7D3C96BBDE4CDCBE760AF4B5A058F1D6D5F27631D019FE55FF1AA6C1C365F6FB
                  BEB2560A24B677815F397AB57C03BDAE753C69E79A5227BAC64F6CBE96E23B89
                  D9CA41F6D4A513FE402BB0C20BA66BC2DCB5FEE3CF11BEA15B34835906B7A374
                  F3369EAB0AB5B77770DFBA57A06ACF859AD068FF3ACA607C6ABBDAF777D06C9B
                  752BFE60343B3ED1D3139858473B074FD47D572CC0C16B2EA5E17368072579B8
                  323AA9CCCBD949F6D5BD466B49D2B58EB7922E499AD7AD025D92AC2CF0CA0EDC
                  2F26F9A6AFD7BE8764A334E5E53557E07386C3D0E8E0C4978CC7A43A5A17D330
                  559F2431D887B8739D8A4F34988866AF5B8866DF6D47DDD36230D387E06D5BAE
                  6305125B78A0049A79FEA913B5AFE70AB5C5385BAF9D8CCA6A95D82DFDB2284F
                  5596AE92FA8DF44E632655E62436C8C0F4CD16999D4995E7D7F96EAC46CD1E2E
                  A9DD2130DDA17F4BF13D3D0FE67BD068CF5809AEB0DAFDFD62CB6FEC04BF31D6
                  2DCEB64B07DA168E759EBF6089335BE384EDDC06CEF9EB8557FCD8FCBAAD6D36
                  C65685D6D5E59615FC32FB7698791956E8F5D789EF660C98EB4617BAD29FC16C
                  D71BEB372614DAC32674BCBCADEF184BF1DFBAF8B6FF35034B3DEDC435328B6B
                  D0ECE2B610EC00B3EAF6A3C9481D62A9EE86BAC327856389B9DA8F476DF445C5
                  EFA5193FE880DD5553CD1C67B4A37435D8CDB5B3B0D02D458D65EE73A25D7CDB
                  759A71FF17DC05B7E2F14ED8DF63B92BEDDDBE6E70967945F462773A5C773B79
                  11136D6C4B473B5DBFC4504DB4CF2DDA2FFF75831D68FB2431178B3CE11AA7F9
                  7B5F4A12FBA0D9E1AB98F93A3E35D6D1D6B7831F9783C9228FD6F6EC7F34B805
                  F7AF5AF810D36A969AEF990EB66BF6A6719EC7BDAB9CFD2B3C625B679A582B6D
                  5EAAF9C23B9ED182531C88E536EDBCC0F95AD0EC5D1FD784FE9F7F708E5B4DB1
                  A24E9591F672A1BE1DE657F7A6B9F0BCE212BB256EC61B06A8247E81E91ACCC1
                  491DC51FA205E3EC9A24B632C8BD98EF9786EB6F3D5DEDE17857F880F257933A
                  AC5029E7E34D97B6295752B7AAF9B6D78C3E7E8D873A2A3009F7EAA2BFDB4C34
                  C1284FD5FDF34AD38D7191238D2FE640351D31DCF2EA4D69149EEDB06E37F370
                  7CF97A1A97DA178DB6A867DB1EF432D0D27676BFD768D33476F086463B7A0117
                  25894BF17C9238001F7732ED0DB8A7C023F1868A77706A3DD311782FF12C26FA
                  6717180BD5FAD67AFA3AC1151E30B3A8F0A44FF1A6F513A3D1E25BA5309DDD49
                  81415866E324B18D26ECE53FF1583DD34578D856E06BE538D2D2B9436063E3EA
                  F6E26D930BB4D414CDF8AFC2B7A373ED9624BAF8002716FCE3F80F7BA3A9F54E
                  49F98B51066141C10CC3AC551EB7C3C1910E292959B3EBBD58D478488FC23511
                  9715F85A3C50E0EF63A68A19D4C551D3F02F7E84A70AE6128C5FA502DD2DC051
                  89CD7DCF08BB24D633C80887F9A19F15AE3331A31A721D8015364B123DADC400
                  5768AB2B74D788FE6EC4750577172E2FF076ED2B43B760F42A545B85B5934483
                  F7704AE19A80ABF54773A9ACF4C34A3D3CDF76F5780D2714788E650E284B6D9D
                  38A4ED6C27BE67827E75D61E5EF07FC2A8025F8D470A7C32DED7E015FC7B1535
                  1CAF6AB0986AFDA787264ACEBF39F86A92D8051FD9C83C1C5B167CBA6EAFAE6B
                  339C1FE0DD6284015859753A9B5A8E817E518B1A7E89B1BE06D5186D4F345A2F
                  491C844FCA42C33033F15B8C2B824676B07663B533D06AED24513113DF2F33C6
                  E35ABBA1C58E0D49FA24999A3E496657162605F37AA5B1064FAD6883938C4972
                  68D5DAB92BCDD939DF4C924CCC9C74CB11495299973F26392E492A72572B5C66
                  1F9BB7323D951CD390A4779269E95D164F0DD306B7E2FB14FC9FF2517A646892
                  543ECC9335412DB9BB83A0E34AC63426C901B64D92FC21CBB365F6CE9824431A
                  6C921D924CFD4C05FA74C04F4D2ACD9D041D5BB29C3149069510734F1AB36DF6
                  4B92CAE4BC952E3926492A9FE4A524BDF244927EB11F3ED5607A9D07BF4735E9
                  50B148E99615D7EC9D24F5B7BA9E1AA966C5C5DA23CA3A0FE0DA025FA674180C
                  F029F6B33F1657BDF52FBA5B49B5DB55FC7EA724B123546FAE76AE59BDD54FAE
                  3BDBBF2EF028B544CE89F848D724D1172D7E66127856571763523550FE4E7FAC
                  AC66BF0EC4E2E2D74331A72C77125A8D51CD801EAE3BDB73ABE1CA5E68F6E524
                  B191A5F84EE17AA576878CB38D5E16E2A70DC5B17A2779A3B2A2CD033AF87D47
                  776CB576CF24C9BD59916DB27FB1F69B69C8514952599C47EA7C656C9265B938
                  BBE4F80CCC1FB34966E5DA86EC9A645ABE9CE48D5508EA78060AECB46C98D9E9
                  966149525998C7EA04753C72C34AD37B4C921E999573F341C66687BC9FC32A4B
                  A211FD9C86B7AAD7AF89F8B722686A5BFE660E8626894DC10D75D61EDEC9DAD5
                  06DE0696D0DADAF052CD084B5C571A1ADEC1709B5A88051E71A54F5AEDA69B15
                  D8B3CE35774CD27A72BE85A66A63A258BB74C94CC759051E839B0A7C019ADDE3
                  B8D69B24891B315937FB9853976A6C9924FAA0C9FA35D76C0DC9A76152E22DFC
                  B0AC330EBF2DF0CFF0E7020FC382E2DEBDC0657648DBB09B46DC6F535D0D76BE
                  2731B7D04EC06B051E59BB3CE22ADC96B8BC2E833816F3CB212D71BE448F4518
                  52B8AA87F0E32A2D491A2AAF6564E4F0BC93BBB34FDECCE4CF70C17A78F724AF
                  14B7DAAFDCEA0F644936CBC14952792D2FA7926393A4B23CE3EB9CF2CCFC2EB3
                  D23323523F1CE5DD7679EF55053F1E9714F8199C59E0D9B548F92A7E54B0A3D5
                  5AFC2EC0E4020FC5C2EADE24B6F1585BE2D3A64277835DEA3E33AA0554C1CE52
                  9E6D4A2BF6A024B1B116AAAD073FC773B5DF6051352BB4B316AD95437767F94A
                  A2A7111ED784E6CF7C0A294DF8BD8B67B72DF2D53AD71C806525EE1DDCCEDA0B
                  71449DB54F2FF0664E36A1748E78E333DF229C0756DA2029D5DED222E830BC5F
                  B84EC194029F0ECE2D5FB7E3F705DED76E898D0D37BE5659CE32AA9A27AE5A7C
                  0F8BF150CD0023F042817F8A470B7C25EE28F0B5A8D58986607239AA1B38CEB8
                  5A0FE93D57DB67358D099B80236C58BE77726A2D31BD535BD1F1202E2CF09345
                  40B59C59CFDF257A38CA684B0AE503D7394043BEC828CBB598E13E973ACEEE4A
                  4BDE0067B53E589885230B3CBF18ED1B4581216EB7A8889EE706833A3FF67C9E
                  02DBBABB4379BAC28BEE709E43DB5E841CE9C2D243D9AC700DD3D577DD546BE8
                  2D70B343BED8BB6B27ABE89A5EE993DEE99DBED9B9DD7BC2A24CCDB4BC9CE999
                  5A692DE17E9EF3D23D6F64F3542FE6C5F943C6E69172B1AF8D02ED94D920BBA7
                  6FF6489FF449FBF7A0F7322D2F675A66E4F6541FEC96E6C18CC94395656BB0E5
                  AB53A09D323DD337BDD33B7DB247DA77FA96E6FCCCCEA3954FD74CF41A2A50A7
                  4A253BA64FF648BFEC915E793367571E5BF3555AC7FF032E11D4333D0AC4D200
                  00002574455874646174653A63726561746500323031392D30372D3330543233
                  3A30323A31332B30323A3030C2AC67160000002574455874646174653A6D6F64
                  69667900323031392D30372D33305432333A30323A31332B30323A3030B3F1DF
                  AA0000001974455874536F667477617265007777772E696E6B73636170652E6F
                  72679BEE3C1A0000000049454E44AE426082}
                Stretch = True
                Version = '1.1.1.0'
              end
              object ed_valor_bruto: TJvValidateEdit
                Left = 66
                Top = 21
                Width = 124
                Height = 40
                StyleElements = []
                Align = alRight
                Anchors = [akRight, akBottom]
                AutoSize = False
                BevelInner = bvNone
                BevelOuter = bvNone
                BorderStyle = bsNone
                CriticalPoints.MaxValueIncluded = False
                CriticalPoints.MinValueIncluded = False
                DisplayFormat = dfCurrency
                DecimalPlaces = 2
                EditText = '0'
                Font.Charset = ANSI_CHARSET
                Font.Color = clWhite
                Font.Height = -24
                Font.Name = 'Calibri'
                Font.Style = [fsBold]
                ParentColor = True
                ParentFont = False
                TabOrder = 0
              end
            end
            object Panel31: TPanel
              Left = 432
              Top = 9
              Width = 190
              Height = 61
              BevelOuter = bvNone
              Color = 11119360
              Enabled = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = 10790052
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentBackground = False
              ParentFont = False
              TabOrder = 1
              StyleElements = []
              DesignSize = (
                190
                61)
              object Label39: TLabel
                Left = 0
                Top = 0
                Width = 190
                Height = 21
                Align = alTop
                Alignment = taRightJustify
                Anchors = [akRight, akBottom]
                AutoSize = False
                Caption = 'Taxa de entrega'
                Color = 11119360
                Font.Charset = ANSI_CHARSET
                Font.Color = clWhite
                Font.Height = -17
                Font.Name = 'Calibri'
                Font.Style = [fsBold]
                ParentColor = False
                ParentFont = False
                Transparent = True
                StyleElements = []
                ExplicitLeft = 1
                ExplicitTop = -3
                ExplicitWidth = 180
              end
              object AdvOfficeImage3: TAdvOfficeImage
                Left = 5
                Top = 4
                Width = 49
                Height = 48
                Anchors = [akLeft]
                Picture.Data = {
                  89504E470D0A1A0A0000000D49484452000000400000004008040000000060B9
                  550000000467414D410000B18F0BFC6105000000206348524D00007A26000080
                  840000FA00000080E8000075300000EA6000003A98000017709CBA513C000000
                  02624B47440000AA8D2332000000097048597300000DD700000DD70142289B78
                  0000000774494D4507E3071F01041E79FFCA05000005A34944415468DEED994B
                  4C94571480BFCB8C03C3C8A38022A8158A55415151908AB136DA14AA7DC536DD
                  58E3C6A65D344D30B15DB449BBECA24DECA2E9233E92C6B42655D3342A62224D
                  4AA5848AA2202A42E5311451666490E131AFD345A7E338F30FF0CB0C6C7A36F3
                  CFFDEF3DE73BE7DE7BEEF9FF1FA629922D5FC87519973B725CB6CBDCE9EAD367
                  DC2045725B46C423225E19973BF2A964CD9CF938C99646F1CA43F14AB7544ABC
                  1E2D71D32048E4650A1FD1104736CFB266A600CC6C614E489B813CF2670AC0C8
                  428DD6249E982900C1A9D1EA626CA600C668D068EDA563A60046A8A233A4CDCE
                  9FB44C43A71E112441F64B57D046B4C90FB2597469313E8661858924E2703097
                  4318D9CA422CB819E022C7A857BAB4E9E82D719849228554B2C8619C1A9EE3AA
                  FA430A2966014EAED1A46C8FC6081309FE3F6EC695EFB122204612B160219525
                  E4534821B998B88E934FA8967A9A557384A1060A49F45F7BB9892DBC4B440051
                  CC219E7812C8A28035AC6515E98145EBC04A3E0BD8CE22DC62C7ADB4A63E817D
                  D4038250C461EA26051088C3880123669EA298629E612986B0717D34B00B2FF3
                  39C15D3EA24346F16ACCA789F5FC9B1B52B4775C68040C2CA298524A59434AC4
                  59F132481F69FCC6164A68249EB7A8A103AF46DF3DFEDF260D37C2C2BE56BE97
                  61995C3AE50331CA7239211FCBB7922D5F8B5D8ECAAA307D16391C1853279BB4
                  6C0685454CECE6B5C0A299483A398789659470904A32282795729E96501F8393
                  F5289EC9A6209179CCD5D898BD5CA1893676B31913E0A0995616B19B6AEE2A9F
                  BCC73C14696CE20A7F85000CEB0118A6131B19FEA1A3B4D3420B4DF4328C93E7
                  49F31FBE1DD462A68C22DE553E29623B89401C5B391F02E0A69A65FEEB6AFE9E
                  044079E4185E36E2A5931BDCC2860307838C2B248917C843015E6E7081C5ECA4
                  8B06E07D92FD515BC14AA9530E9074569204282CD4F9EFBA291537E0A24BB569
                  47006E718433F818C2CEA00A5ED31514930480954BB828239FEF189122D67294
                  5D240366D691C72551E4B39FE408EBC7C569E952E39A00CA4D37DDE163248D37
                  79D2EF492BF5E4F00A239C268177F8995FD88A05035042815C067A384E2A8924
                  30C29D10653EDA83B7EBD40EA372D66301E00157E967072B388795552CE7337A
                  A9630129C0625E27131366124920011363B47256B923AB9ECA5990C12E32FDFE
                  B7D344363B18E51466DEE08CEA0439C916528078B651463C664C81E105D4CB80
                  8A78464FA520A9A0C49F1D7C34D24319ABB9C965F258C18F005CA0CD5F882531
                  9F9420F35046F244562605900CF60692F23D2EE3A5807BD4226CE357650550F7
                  A9E15E0405FDB898A04699700A04E0258AF9EF51C38A1313D769A39625ACA632
                  D0B58A0A32833CF7E1C6830B073F31A055074C0900451A95819202B278953A1A
                  E9C142290DEAE10ABFC669CCCCC787170F1EC67030849D160E4F5C254F501109
                  98799B2FC36E8C729B4E86D8A7FA827A1BC927131783DC679061A5AF34D40488
                  931CE989701EF6C887D3363029409A7C1EC1BC4F6AE5C9589B3749998C4400B8
                  2DFB63EF7F8E9C145F04FFAB24375A7622E40149A68CF2084BD4CA057A620A20
                  90CBDE88B5511B35CA4394443B02E96C62839F653CE4DE283769266AA20120B0
                  949D5880710ED2C7A379AC87661EC414800C3652023839CE019C2199BC8B1BFA
                  9EFE2696B0542C90CF8B2433C4590EA8D6B08466D5F7FCAF1B8014D6B3011B55
                  7CA32E86DD7562A53FB600B9AC6398531CD2300F7D742B576C012CD839C2D1E0
                  CA35487AE98DA6792D8076BEA24F0D47E83FC0408C0154FF84731C75007D2FA9
                  041BF6D904F0709FA1D904188A4AA5330D80078C44D7BC5E00A7BED7B0B10018
                  9D5D00176E5DFDA30EE0C5A7AB7FD4017CB30F10E54DF87F04F49F05B30C6098
                  D61796C70408F6D914F6996E0600A29E7CF50234075EB10A7D5A9F1C620D7018
                  3B6E042F367EA76D0A3AA32D5221E7E5AE5C943D921E7DEDFF003304A290A958
                  EA090000002574455874646174653A63726561746500323031392D30372D3330
                  5432333A30343A33302B30323A3030BC7F0AB10000002574455874646174653A
                  6D6F6469667900323031392D30372D33305432333A30343A33302B30323A3030
                  CD22B20D0000001974455874536F667477617265007777772E696E6B73636170
                  652E6F72679BEE3C1A0000000049454E44AE426082}
                Stretch = True
                Version = '1.1.1.0'
              end
              object ed_total_tx_serv: TJvValidateEdit
                Left = 64
                Top = 21
                Width = 126
                Height = 40
                StyleElements = []
                Align = alRight
                Anchors = [akRight, akBottom]
                AutoSize = False
                BevelInner = bvNone
                BevelOuter = bvNone
                BorderStyle = bsNone
                Color = 11119360
                CriticalPoints.MaxValueIncluded = False
                CriticalPoints.MinValueIncluded = False
                DisplayFormat = dfCurrency
                DecimalPlaces = 2
                EditText = '0,00'
                Font.Charset = ANSI_CHARSET
                Font.Color = clWhite
                Font.Height = -24
                Font.Name = 'Calibri'
                Font.Style = [fsBold]
                ParentFont = False
                TabOrder = 0
              end
            end
            object Panel33: TPanel
              Left = 216
              Top = 9
              Width = 190
              Height = 61
              BevelOuter = bvNone
              Color = 2905050
              Enabled = False
              FullRepaint = False
              ParentBackground = False
              TabOrder = 2
              StyleElements = []
              DesignSize = (
                190
                61)
              object Label42: TLabel
                Left = 0
                Top = 0
                Width = 190
                Height = 21
                Align = alTop
                Alignment = taRightJustify
                Anchors = [akRight, akBottom]
                AutoSize = False
                Caption = 'Desconto'
                Color = clWhite
                Font.Charset = ANSI_CHARSET
                Font.Color = clWhite
                Font.Height = -17
                Font.Name = 'Calibri'
                Font.Style = [fsBold]
                ParentColor = False
                ParentFont = False
                Transparent = True
                StyleElements = []
                ExplicitLeft = 138
                ExplicitWidth = 67
              end
              object AdvOfficeImage1: TAdvOfficeImage
                Left = 1
                Top = -7
                Width = 41
                Height = 81
                Anchors = [akLeft]
                Picture.Data = {
                  89504E470D0A1A0A0000000D4948445200000020000000200804000000D973B2
                  7F0000000467414D410000B18F0BFC6105000000206348524D00007A26000080
                  840000FA00000080E8000075300000EA6000003A98000017709CBA513C000000
                  02624B47440000AA8D2332000000097048597300000EC400000EC401952B0E1B
                  0000000774494D4507E3071F003B34FB5843D8000002394944415448C7A5953D
                  4F545110869FB3022E41488868F8051616A82895DAD9584A6194686534C44E2D
                  6CC4D8428C86684720DAF899188D40A71590F88106FF80216663B1D10801376C
                  161E0B77D77B2F77F512DFEACEBC73DEC9CC9973075260DE3E43CC13EC334F56
                  38A64ED95DB7BB9D56C7B21ECFFB43D5A227003CEE5755976DCD26D0EF1F8C3B
                  1EB1FAB3093CB5119E6439DEEECF8602253B92F101C0269ED203401BAD74FC45
                  7F9912AB002C7032546A023B2912D81AA42B7C871C40F8C67C822EF225113ECC
                  6CCC331FBE47F9A158ADD70CE0192B75CF2878211633144FB03F42CD8097BD05
                  DEAF7A16CCDBE9624C607FB2A4CF91FC9D56D45E4F577BDF033E8C1D5FAC8D7A
                  AE7ABC9796BA569966B601ADAC0170257CF21CA762F99A3810CD3E6829A23E09
                  DEF1A53947D51706F7B892321383B5C179B0891C00F0A8250B76D9E2FB0683F5
                  C0767C9B426C38E76BCBAE7B0C1CB131DEA40BD430021E73DD355F39EB46BA40
                  5A09BFF1DE16BB2C58F2308003A925A434F13756DC63F0857ADB6D4E7A179C4A
                  6962ED1A2D2404CE811755EDF788BAE16EAFD6D982BDB139081F28C7EEF95918
                  772F370168A604AC53667B9DAFF0B1F128EBA29DE65DA85AF7C05B5E02E72231
                  F1514E3CA6F3E068DDAA78160CDE88C55C8F0BBC8B91330E272EED8BC5448FDE
                  558BFF8F1FCAAEF00D9A0058E239FB80ADFDD296D285DB521E4E0DABEE48C6E7
                  928EB0CA74C3FC9361E59F02C0A3C8F7041311EB71B6EE345A6D4B19575BEA72
                  9D32FB7205F31EDAB4DE0FBA3D2DF61725696A662A36387A0000002574455874
                  646174653A63726561746500323031392D30372D33305432323A35393A35322B
                  30323A3030B4B0EC680000002574455874646174653A6D6F6469667900323031
                  392D30372D33305432323A35393A35322B30323A3030C5ED54D4000000197445
                  5874536F667477617265007777772E696E6B73636170652E6F72679BEE3C1A00
                  00000049454E44AE426082}
                Version = '1.1.1.0'
              end
              object edTotalDescontos: TJvValidateEdit
                Left = 72
                Top = 21
                Width = 118
                Height = 40
                StyleElements = []
                Align = alRight
                Anchors = [akRight, akBottom]
                AutoSize = False
                BevelInner = bvNone
                BevelOuter = bvNone
                BorderStyle = bsNone
                Color = 2905050
                CriticalPoints.MaxValueIncluded = False
                CriticalPoints.MinValueIncluded = False
                DisplayFormat = dfCurrency
                DecimalPlaces = 2
                EditText = '0,00'
                Font.Charset = ANSI_CHARSET
                Font.Color = clWhite
                Font.Height = -24
                Font.Name = 'Calibri'
                Font.Style = [fsBold]
                ParentFont = False
                TabOrder = 0
              end
            end
            object Panel11: TPanel
              Left = 636
              Top = 9
              Width = 190
              Height = 61
              BevelOuter = bvNone
              Color = 41728
              Enabled = False
              ParentBackground = False
              TabOrder = 3
              StyleElements = []
              DesignSize = (
                190
                61)
              object Label9: TLabel
                Left = 0
                Top = 0
                Width = 190
                Height = 26
                Align = alTop
                Alignment = taRightJustify
                Anchors = [akRight, akBottom]
                AutoSize = False
                Caption = 'Total '
                Color = 2657063
                Font.Charset = ANSI_CHARSET
                Font.Color = clWhite
                Font.Height = -21
                Font.Name = 'Calibri'
                Font.Style = [fsBold]
                ParentColor = False
                ParentFont = False
                Transparent = True
                StyleElements = []
                ExplicitLeft = 160
                ExplicitWidth = 46
              end
              object AdvOfficeImage5: TAdvOfficeImage
                Left = 7
                Top = 6
                Width = 49
                Height = 52
                Anchors = [akLeft]
                Picture.Data = {
                  89504E470D0A1A0A0000000D49484452000000400000004008040000000060B9
                  550000000467414D410000B18F0BFC6105000000206348524D00007A26000080
                  840000FA00000080E8000075300000EA6000003A98000017709CBA513C000000
                  02624B47440000AA8D2332000000097048597300000DD700000DD70142289B78
                  0000000774494D4507E3071F01070A48084DBB000007BF4944415468DECD997B
                  5094E715C67FEFB22C9715969BA8A351A3C6BB18143B552356A5C6694CD44C63
                  5343D444D399261D4D339D74A69969274E326DDA4E9ACE541DDB491B63ADD2AA
                  21B6716262A2D824B578A988977A41AC80800888E8B25C769FFE81C07EEC2EB0
                  02699FFFF6BCFB9EF37CE79CF79CF3BD1FFC8F61FA4BB16C24308D3124114935
                  D739CB65E3FE5208C890CA7C9692412C91D83078F1D2C4153E279713A6A95F09
                  28892C9E268D446C1472856A3C24329029A4E0A18C4FD9C171E3EB27021A4F36
                  CB184209B9E4730D378DF888248A04C6924526D11C673BBB8CA7EF7D8F666893
                  4A7451BF54968629D2B286E23559ABB55795CAD77A0DE87BF393B549A5CAD73A
                  8D96AD5DFAB89E565CFBAF78CDD56695E8A49E5344DF9A4FD1EBBAAA7F6AAD52
                  2DF2033AA9E16A0FB5223555BF56B9BED0C37D69DE285BA7745E2F7698974D09
                  5AA85BF2699DC629AA5D1EA174BDAB1AED564ADF1118A65CDDD09B1AE3677E90
                  D6294F2DF2EABC36EAAB8A695F8B5296FEA54A65833D40553449C4857D3A1630
                  99623EE672BBC4C93C7E84F81B4D8C61250EDED4B956B5A65185E4F00A6BB53B
                  80000FF008A3C376C10C06B383C28EF3CD40B271B1990D34F00D5E63091F7189
                  E6BBAB557CC41AD2191F4860162F11471D0AC37C3471DCE224E57E3227E978F8
                  85B909BCA7C52C6308B1D4B52E1A9FAE7388A7783890801D0797D8414B1804A6
                  F008A7B966BC16A90F70083090C708AAF15FBFC567AC624E802E7D4F75DADD91
                  B33D81D6A844DB34C9221BA9DD6AD06F9420A7A26593A3A33600C8A1D96A51A1
                  2D409BC1207C848314ECD4622DAE95FC0E1F2F708C7758C730BCC6AAB3991B18
                  86042740581900B144E0B13818D3C02196729AD17C9337F882C51DC710C08826
                  9A7186F2407804DC7849A073D81A39C46C26B19C0F88E365A6594210810B3B95
                  F620EAC2F740194DA460794225309766B34F17B8423EEF92CE589D300DED7F70
                  3018511E482088079480936A3C21AB53216E26926C910DE1559AF4B169A64525
                  1491461231741070321D2F85DDE68062F50A39E4B095C7E40A41E022C50C6294
                  A5C51A1C8C6336002E86E2A09E46BF751799B470209807C0E7F7ACCFF02C89B8
                  99482A6E7D0A243098CEADB4021F99E453D02EA9651FEBD9A0ADDC612E533947
                  51C739512C939846358783E580152B18CE6B5CE019A631957C52799C87E8ECB9
                  51C4F0350EABC8DCBE2BA92187F12C249946EEA792B739DD56A804C3584E1439
                  5C0F95031D48C17089132C258A1822886420E3080C5D15292CA548874D0BDC6D
                  383FE7142F11C5760EB09FEBEDFF4D6511F3B8CAEF8D2F4408FC7E1F64042B99
                  C734AAB88A9B3276732E08812896309515D4AAA0B5E4188FFE4E216B48E4B71C
                  E9988595C002B231ECA420483B6EF3513BDE2695494CA48A7DE49B461A39C291
                  205B0CD7F83E5934F2079D6A356744ADDE27898B34B52B1E4416AB19C57B6C35
                  DE60048C75163047F5133249E03287B9163A558CF421293CC71212D9A602CA4D
                  EB63FC94286E98B6D41BC9429E6434FBD96C4A2038016B08308514D2039806ED
                  C4C3B364319E5D1C540535DC31C520A3685C24338147998F21972DE644EBAE4E
                  0414A40E6A004944E2A686C6AE072553AF9D94B39699BC4C36791CA158F5F888
                  2685346692413457789F77CC7FDAF674F640402B9293452C258533FC8502BF4A
                  169C42330754C02256318127598B9D06DCC4034D3450432EDB386AFC668DEE93
                  70095BB0D3C20232785507314412D90587666E986DDA431A8BF816E38008CAA8
                  E20C79E471B5D3D012D403D64EF00362F819C778919964908F8B652C26D44B45
                  037F6507B7CD1DFEA17F13C50F799D8DD49990CDAD7B02A9187239C902A6108F
                  931164D1D52BC54D3EE1B6DFEF063CA68BDE1A9C80B5102DE78F543011514435
                  35ACE757410A512B1A29A59430D06D12B281546631923A36729016A0948A90FA
                  14307ADD03016B088A799EB1B828E5D2DD82E2C5DB7303BD26605A285219763C
                  B4F4C77D4EE7580619496548611871F4EDEB74080F00560F289EB564E0A482BD
                  FADCDCEC6F028139F0042FE0C4CD1C46E2561EC2892BA43E2FF5E64E6F095843
                  B09AE1BC4511DF6606E91CC3C502A67741E088F687E3A7EE3D30081BC7282093
                  0719808344BEC2A321EB400B4D1CA64F097CC67DACE40A19D47195DB94B297B2
                  9009D9C4516AFB36049B18CE441EA49E3FDF9D88F6B33F1C13BDF48039A6E759
                  4832E7C833957D67B86B02D689E80217FADE701B7A5088FA17C1B2F94B340F76
                  8D21CD2FA79D4CC0C1037A220C1D973863BD010F8B008770590671077616313F
                  0C1D6EE6E862784DD89FC010BC7C4858E5D382C524E3C416E6A58E1F011B6EDE
                  086F8AB16026B1BDB9F4B703A2AC634E0F170AE73A2F086CBDDBDE1386DD11F0
                  E020A21727CF83880EFA208618C0DD35051B15D8198CE39E0994E3E3BEA0FB23
                  1941EBDD4997048EE3E521E2EF99C071BC64068E28B23388341A39DBF5086B63
                  0F1E96313EBCCB593F7C401D5F275D4E8B7943324B18CA518ABB39A04AD401B9
                  B545B3E4BC974C9043DB755BBBB450AEB60F33B26BA8D6A848D7B4A2BBFD7653
                  AB3771B10217BB38AF7A5AC2EE05394CE7319CECE4946EE2258AC164B28A01E4
                  B2A7BBCD06404FF15D26D1402117A8BF876634977462B9C929CEE26620698CA1
                  924FF8B1A9E86E6B9BD3A6F31DE6904464AF2B83F0E2A188EDFCA927F3B15F11
                  D5FDA431EA1EBE1759D14C15A72908F6A1FAFF12FF05C0D21CC1E2B693FC0000
                  002574455874646174653A63726561746500323031392D30372D33305432333A
                  30373A31302B30323A3030156DB6CF0000002574455874646174653A6D6F6469
                  667900323031392D30372D33305432333A30373A31302B30323A303064300E73
                  0000001974455874536F667477617265007777772E696E6B73636170652E6F72
                  679BEE3C1A0000000049454E44AE426082}
                Stretch = True
                Version = '1.1.1.0'
              end
              object ed_total_conta: TJvValidateEdit
                Left = 72
                Top = 26
                Width = 118
                Height = 35
                StyleElements = []
                Align = alRight
                Anchors = [akRight, akBottom]
                AutoSize = False
                Flat = True
                ParentFlat = False
                BevelInner = bvNone
                BevelOuter = bvNone
                BorderStyle = bsNone
                Color = 41728
                CriticalPoints.MaxValueIncluded = False
                CriticalPoints.MinValueIncluded = False
                DisplayFormat = dfCurrency
                DecimalPlaces = 2
                EditText = '0,00'
                Font.Charset = ANSI_CHARSET
                Font.Color = clWhite
                Font.Height = -29
                Font.Name = 'Calibri'
                Font.Style = [fsBold]
                ParentFont = False
                TabOrder = 0
              end
            end
            object Panel46: TPanel
              Left = 835
              Top = 0
              Width = 5
              Height = 80
              Align = alRight
              BevelOuter = bvNone
              Color = clWhite
              ParentBackground = False
              TabOrder = 4
              StyleElements = []
            end
          end
          object Panel28: TPanel
            Left = 0
            Top = 549
            Width = 840
            Height = 5
            Align = alBottom
            BevelOuter = bvNone
            Color = clWhite
            ParentBackground = False
            TabOrder = 5
            StyleElements = []
            ExplicitTop = 548
          end
        end
      end
      object pnTitulo: TPanel
        Tag = 99
        Left = 0
        Top = 0
        Width = 1238
        Height = 50
        Align = alTop
        Color = 12615680
        ParentBackground = False
        TabOrder = 0
        StyleElements = []
        ExplicitWidth = 1234
        object lbTitulo: TLabel
          Left = 5
          Top = 2
          Width = 392
          Height = 34
          AutoSize = False
          Caption = 'Delivery - Pedidos'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -19
          Font.Name = 'Calibri'
          Font.Style = [fsBold]
          ParentFont = False
          Layout = tlCenter
          StyleElements = []
        end
        object Panel1: TPanel
          Left = 988
          Top = 1
          Width = 249
          Height = 48
          Align = alRight
          BevelOuter = bvNone
          Color = 12615680
          ParentBackground = False
          TabOrder = 0
          StyleElements = []
          ExplicitLeft = 984
          object lbDescTabelaPreco: TLabel
            Left = 0
            Top = 0
            Width = 249
            Height = 28
            Align = alClient
            Alignment = taCenter
            AutoSize = False
            Caption = 'Tabela funcion'#225'rios'
            Color = 2236959
            Font.Charset = ANSI_CHARSET
            Font.Color = clWhite
            Font.Height = -17
            Font.Name = 'Segoe UI'
            Font.Style = [fsBold]
            ParentColor = False
            ParentFont = False
            Transparent = True
            Layout = tlCenter
            WordWrap = True
            StyleElements = []
            OnClick = lbDescTabelaPrecoClick
            ExplicitTop = -6
            ExplicitWidth = 184
          end
          object Label33: TLabel
            Left = 0
            Top = 28
            Width = 249
            Height = 20
            Align = alBottom
            Alignment = taCenter
            AutoSize = False
            Caption = 'Tecle F12 para mudar a tabela de pre'#231'os'
            Color = 2236959
            Font.Charset = ANSI_CHARSET
            Font.Color = clWhite
            Font.Height = -12
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentColor = False
            ParentFont = False
            Transparent = True
            Layout = tlCenter
            WordWrap = True
            StyleElements = []
            ExplicitTop = 17
            ExplicitWidth = 198
          end
        end
      end
    end
    object pgConsultaCliente: TJvStandardPage
      Left = 0
      Top = 0
      Width = 1238
      Height = 684
      Caption = 'pgConsultaCliente'
      Color = clWhite
      object Panel2: TPanel
        Tag = 99
        Left = 0
        Top = 0
        Width = 1238
        Height = 64
        Align = alTop
        Color = 12615680
        ParentBackground = False
        TabOrder = 0
        StyleElements = []
        DesignSize = (
          1238
          64)
        object Label28: TLabel
          Left = 8
          Top = 19
          Width = 377
          Height = 39
          AutoSize = False
          Caption = 'Consulta de clientes'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -27
          Font.Name = 'Calibri'
          Font.Style = [fsBold]
          ParentFont = False
          StyleElements = []
        end
        object lbHora: TLabel
          Left = 1100
          Top = 13
          Width = 134
          Height = 45
          Anchors = [akTop, akRight]
          Caption = '22:25:33'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -37
          Font.Name = 'Calibri'
          Font.Style = [fsBold]
          ParentFont = False
          StyleElements = []
        end
      end
      object Panel15: TPanel
        Left = 0
        Top = 621
        Width = 1238
        Height = 63
        Align = alBottom
        Color = clWhite
        ParentBackground = False
        TabOrder = 4
        StyleElements = []
        DesignSize = (
          1238
          63)
        object AdvGlassButton1: TAdvGlassButton
          Left = 1078
          Top = 7
          Width = 156
          Height = 50
          Anchors = [akTop, akRight, akBottom]
          BackColor = 12615680
          ButtonDirection = bdLeft
          Caption = 'Voltar'
          CornerRadius = 0
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Tahoma'
          Font.Style = []
          ForeColor = clWhite
          GlowColor = 12615680
          ImageIndex = -1
          InnerBorderColor = clBlack
          OuterBorderColor = clWhite
          Picture.Data = {
            89504E470D0A1A0A0000000D49484452000000300000003008060000005702F9
            87000000097048597300000B1300000B1301009A9C1800000376494441546881
            ED995188545518C77FDFDDD5D9CC047D30A284357DD95D7B9185E82167AE9B06
            45482F2224A446C882BAE58A286CEE9988C0347595500423F021DA205C88C81C
            98B999B1E23E44E12EB5966852126514BAE36C33F7EB61677337C6BD77E6DE71
            46B8BFC77BBEF37DDFFF7CE79C7BCF3D101111715F239E16AA42F2CB03A02B41
            FE0C2FB42A7001F44D8C7DB3522F8D9E1649A71378AD18B4F850CE01F94A8316
            B1804E9066606DA54EBC05C01AE017D093201B8087419B413F80C6F7314FFF54
            69708CB30F745BC5FD9918050F2406328AB177F1C8DC45A02F827C03B21B0A3F
            629C1426BD0E936E2A3FBC7B0B985D7EBF3BF8A9C01D36B7FF039C024E61D28F
            011B8057403E046E60D227B1AC13EC897F1724A972F05181BB60EC6B18FB2D88
            2F015D057A06A41357BFC564CE93CCBCCADEAF1E0A31D792542E6012232EC64E
            61EC75A08F82BE0ECC45394E36FF2B49A73B789A7727B880A918FB778C7D88DE
            F832D0A78007515E0835C6FF286F0DF8454481418CE354C5FF14C2AD400D8804
            D49AEAAC8100341DFCE1712DE43FC7952DB99D2D5F78D9D75D056EFFF5F775E0
            26960EC4DE1959ED655F770230ED63394B9F0146FC88A8E9146A687860B135BB
            096BDF70665A430140C614452C3D1DDB3FBC3AB7A3F54C291FF5578132A96905
            0A85ECE542F6369844625AC3818B0B622E290170E5D9DCCE9692A30FF55881C3
            A3F362AEA480165C59E3B513855281A6772F76A0AC903C27B2BBDAAE06F115CB
            8F2F0499EF27790849802AAD203DDA484F6CFFC8A76AD133BEBDA5A233416E7B
            DB2560B15FFB50A6506E47DB114B0ACD026F833E29AA9BC2F0EB87D01671B6FB
            899F8137E857C3F07FA7FFAA13FE2EB4560AA1FB9C81FADB85CA2412506B2201
            B5C687001D039D559DF0320B180FE2C17B1B151940F51826F331681FBD8973C5
            BF0E3ED03800C6C9946813603930E03BDB12785760CF8AE34037D0017296A433
            44D27999C39FC58204065CE028047B6B7BDF0F4C6286E6C0ADF5A05D402BF01B
            700CF428C6BE5EBA4F71E44D3C1124C999F02F6012552199E900E9029E67E29E
            E023D03E8C3D34CDF61E0828FF536262FEA7801426BD14642BB011643D26F335
            481FB89F60ECA01720FED209C58B199C87E436A2BA1558025C037D0FE425903F
            EA6B0ACD447F7F03230B9F43A50BB4A3F8F40A26D11C6A9C29842B602A26BD0C
            D882C8F7F4260E562D4E4444C4FDCDBF348114F25C30462F0000000049454E44
            AE426082}
          ParentFont = False
          ShineColor = clWhite
          TabOrder = 0
          Version = '1.3.3.1'
          OnClick = AdvGlassButton1Click
        end
      end
      object Panel16: TPanel
        Left = 0
        Top = 81
        Width = 1238
        Height = 112
        Align = alTop
        Color = clWhite
        ParentBackground = False
        TabOrder = 2
        StyleElements = []
        object rdTipoConsultaCliente: TRadioGroup
          Left = 1
          Top = 1
          Width = 1236
          Height = 48
          Align = alTop
          Caption = 'Digite as iniciais (F2 - mudar o filtro )'
          Columns = 5
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ItemIndex = 0
          Items.Strings = (
            'Nome'
            'Telefone'
            'Celular')
          ParentFont = False
          TabOrder = 0
          OnClick = rdTipoConsultaClienteClick
        end
        object pnFiltrosPesquisa: TPanel
          Left = 1
          Top = 55
          Width = 1236
          Height = 56
          Align = alBottom
          BevelOuter = bvNone
          Color = clWhite
          ParentBackground = False
          TabOrder = 1
          StyleElements = []
          object lbNomeCliente: TLabel
            Left = 5
            Top = -1
            Width = 117
            Height = 20
            Caption = 'Nome do Cliente'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -16
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            StyleElements = []
          end
          object lbEnderecoCliente: TLabel
            Left = 330
            Top = -1
            Width = 69
            Height = 20
            Caption = 'Endere'#231'o'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -16
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            StyleElements = []
          end
          object lbEnderecoBairro: TLabel
            Left = 695
            Top = -1
            Width = 42
            Height = 20
            Caption = 'Bairro'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -16
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            StyleElements = []
          end
          object edNomeClienteConsulta: TEdit
            Left = 2
            Top = 19
            Width = 320
            Height = 35
            TabStop = False
            CharCase = ecUpperCase
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Height = -24
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            TabOrder = 0
            StyleElements = []
            OnChange = edNomeClienteConsultaChange
            OnKeyDown = edNomeClienteConsultaKeyDown
          end
          object edEnderecoConsultaCliente: TEdit
            Left = 325
            Top = 19
            Width = 362
            Height = 35
            TabStop = False
            CharCase = ecUpperCase
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Height = -24
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            TabOrder = 1
            StyleElements = []
            OnChange = edNomeClienteConsultaChange
            OnKeyDown = edNomeClienteConsultaKeyDown
          end
          object edEnderecoConsultaBairro: TEdit
            Left = 691
            Top = 19
            Width = 542
            Height = 35
            TabStop = False
            CharCase = ecUpperCase
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Height = -24
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            TabOrder = 2
            StyleElements = []
            OnChange = edNomeClienteConsultaChange
            OnKeyDown = edNomeClienteConsultaKeyDown
          end
        end
      end
      object Panel17: TPanel
        Left = 0
        Top = 64
        Width = 1238
        Height = 17
        Align = alTop
        BevelOuter = bvNone
        Color = clWhite
        ParentBackground = False
        TabOrder = 1
        StyleElements = []
      end
      object gridConsultaClientes: TcxGrid
        Left = 0
        Top = 193
        Width = 1238
        Height = 428
        Align = alClient
        TabOrder = 3
        object gridConsultaClientesDBTableView1: TcxGridDBTableView
          PopupMenu = PopMovimento
          OnKeyDown = gridConsultaClientesDBTableView1KeyDown
          Navigator.Buttons.CustomButtons = <>
          ScrollbarAnnotations.CustomAnnotations = <>
          OnCellDblClick = gridConsultaClientesDBTableView1CellDblClick
          OnCustomDrawCell = gridConsultaClientesDBTableView1CustomDrawCell
          DataController.DataSource = dmPedidoDelivery.dsConsultaClientes
          DataController.Summary.DefaultGroupSummaryItems = <
            item
              Format = 'R$ ,0.00;-R$ ,0.00'
              Kind = skSum
            end
            item
              Format = 'R$ ,0.00;-R$ ,0.00'
              Kind = skSum
              Position = spFooter
            end
            item
              Format = 'R$ ,0.00;-R$ ,0.00'
              Kind = skSum
            end
            item
              Format = 'R$ ,0.00;-R$ ,0.00'
              Position = spFooter
            end>
          DataController.Summary.FooterSummaryItems = <
            item
              Kind = skSum
            end
            item
              Kind = skSum
            end>
          DataController.Summary.SummaryGroups = <>
          OptionsData.CancelOnExit = False
          OptionsData.Deleting = False
          OptionsData.DeletingConfirmation = False
          OptionsData.Editing = False
          OptionsData.Inserting = False
          OptionsSelection.CellSelect = False
          OptionsSelection.HideFocusRectOnExit = False
          OptionsSelection.InvertSelect = False
          OptionsSelection.UnselectFocusedRecordOnExit = False
          OptionsView.DataRowHeight = 24
          OptionsView.GroupByBox = False
          OptionsView.GroupFooterMultiSummaries = True
          OptionsView.GroupFooters = gfVisibleWhenExpanded
          OptionsView.GroupSummaryLayout = gslAlignWithColumns
          Preview.AutoHeight = False
          Styles.Content = cxStyle1
          Styles.ContentOdd = cxStyle2
          object gridConsultaClientesDBTableView1Column1: TcxGridDBColumn
            Caption = 'C'#243'digo'
            DataBinding.FieldName = 'NOME'
            DataBinding.IsNullValueType = True
            Width = 329
          end
          object gridConsultaClientesDBTableView1Column2: TcxGridDBColumn
            Caption = 'Bairro'
            DataBinding.FieldName = 'DESCBAIRRO'
            DataBinding.IsNullValueType = True
            Width = 196
          end
          object gridConsultaClientesDBTableView1Column3: TcxGridDBColumn
            Caption = 'Telefone'
            DataBinding.FieldName = 'TELEFONE'
            DataBinding.IsNullValueType = True
            Width = 104
          end
          object gridConsultaClientesDBTableView1Column4: TcxGridDBColumn
            Caption = 'Celular'
            DataBinding.FieldName = 'CELULAR'
            DataBinding.IsNullValueType = True
            Width = 97
          end
          object gridConsultaClientesDBTableView1Column5: TcxGridDBColumn
            Caption = 'Endere'#231'o'
            DataBinding.FieldName = 'ENDERECO'
            DataBinding.IsNullValueType = True
            Width = 500
          end
        end
        object gridConsultaClientesLevel1: TcxGridLevel
          GridView = gridConsultaClientesDBTableView1
        end
      end
    end
  end
  object PopMovimento: TPopupMenu [9]
    Left = 29
    Top = 386
    object Excluir1: TMenuItem
      Caption = 'Excluir produto do pedido'
      OnClick = Excluir1Click
    end
    object E2: TMenuItem
      Caption = 'Editar observa'#231#245'es'
      OnClick = E2Click
    end
    object N1: TMenuItem
      Caption = '-'
    end
    object I1: TMenuItem
      Caption = 'Importar produtos de uma mesa'
      OnClick = I1Click
    end
  end
  inherited cliques: TActionList
    Left = 63
    Top = 317
  end
  inherited actlBusca: TJvControlActionList
    Left = 272
    Top = 324
  end
  inherited popMenuExportacaoGrid: TPopupMenu
    Left = 28
    Top = 449
  end
  object ImageList1: TImageList
    Left = 199
    Top = 317
    Bitmap = {
      494C010102000500040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000001000000001002000000000000010
      0000000000000000000000000000000000000000000000000000F9F9F900E3E3
      E300DADADA00DADADA00DCDCDC00DDDDDD00DEDEDE00DFDFDF00E1E1E100E3E3
      E300EBEBEB00FBFBFB0000000000000000000000000000000000000000000000
      0000F9F9F900F4F4F400F9F9F90000000000000000000000000000000000FCFC
      FC00EEEEEE00E4E4E400EDEDED00FCFCFC000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000E4E4E4009595
      95007474740074747400777777007B7B7B007D7D7D0081818100858585008B8B
      8B00A9A9A900E9E9E9000000000000000000000000000000000000000000F7F7
      F700D6D6D600BBBBBB00CCCCCC00E3E3E300F3F3F300FCFCFC00FBFBFB00E4E4
      E400B1B1B10090909000B1B1B100EEEEEE000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000A4767600B586
      8700B2878600A07B8700A9807F00A37C7C009F7A7A009D7A7A009E7C7C009A80
      80007C7C7C00DDDDDD0000000000000000000000000000000000FCFCFC00C7D9
      DE006CABBE006D7679007272720091919100B7B7B700D3D3D300D0D0D0008099
      CB00938D8700807F7D008C8C8C00E3E3E3000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000AB797900FFF1
      EC00FFFFF7009EAEFE00FFFEFB00FFF8FA00FFF7F900FFEDEF00FDE8E900B288
      880072727200DBDBDB0000000000000000000000000000000000E8EBEB0036C0
      E700BAF6FF0052D8FA003FACC7006080860064646500717171007187B300387F
      F30080DFFF00989288009C9C9C00E9E9E9000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000AC797900FCE9
      E100FFF5E2009EA7E900FFEDD600FFE7D500FFE5D300FFE3D000FFE9D400B68A
      860072727200DADADA00000000000000000000000000FBFBFB0082CDE6009EEE
      FC00C6EAEF00E8F8FA00FCFFFF00CEF6FD00A1E3F4007CAAE1003381FC0072E2
      FF00388AFA00637DB200A0A0A000EAEAEA000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000AF7C7D00FCE8
      DA00FFF4DC00A2A9E800FFEFD800FFE8D700FFE6D300FFE4D100FFE8D500B68C
      870072727200DADADA00000000000000000000000000E5EDF00031C3EC00EDFF
      FF00E0F9FA0098A1A300777B7D00757574007F80800091908D008DC6D7003387
      FF007BA8E800A4A5A60093939300E6E6E6000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000B07E7E00FCEE
      EB00FFFBF200A3B1F600FFF7EE00FFF1EC00FFEFEC00FFEEEB00FFF3F100B791
      900072727200DADADA000000000000000000000000008BD3EB0095EFFB00CCF0
      F400A1A8A900BEAE9400FFD18400FED08500FED698009A948B008F8F8C0098BA
      F600D0F7FE0020B8E000B5B5B500F1F1F1000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000B4808000FCEE
      E600FFF9EA00A6B2F100FFF3E400FFEDE200FFEBDF00FFE9DD00FFEEE000B991
      8C0072727200DADADA000000000000000000F9F9F90035C5EF00D5FFFF00D3F3
      F7007D7E7D00FFDD9700F2D59800EFCD9000F1C88200FED99D007F848600D4E9
      EF007BE5FD007EB0BD00E2E2E200FDFDFD000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000B6838300FDEB
      DD00FFF5DF00A8B3EA00FFF1DB00FFEBDA00FFE9D600FFE7D500FFECD800B990
      8E0072727200DADADA000000000000000000D4E9EF004CD2F000B5FCFB00E5FF
      FF007B787300FFEEBD00F8E8BB00F4DDA900F0D09400FFD59000797A7900E1FC
      FF0054ABC500CECECE00F9F9F900000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000B9858500FFF4
      EF00FFFDF200ACBAF300FFF7E800FFEFE400FFEDDF00FFEADB00FFEDDB00BA90
      8B0073737300DADADA00000000000000000090C9DF0088EFF90087DDE700BAE1
      EA0081817D00FFFFEA00FFFEEF00F9EDC200F6DAA000FFDA96008185860092DA
      EE009DA2A200E9E9E90000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000BC888800FEF2
      EA00FFFEF000AEBDF600FFFBF100FFF6F300FFF7F300FFF6F500FFFDFE00BA94
      950073737300DBDBDB0000000000000000005AB3D500B3FFFF00B1FFFF00D7FF
      FF00A2AAAB00DEDAC400FFFFF200FFF7CB00FFE7A600B5AB99009AA8AA009DBE
      C800CFCFCF00FAFAFA0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000BF8B8C00FFF0
      DF00FFF9E200B4BEED00FFF6DE00FFF0DB00FFEAD700FFE8D500FFEED800B990
      8A0075757500DCDCDC00000000000000000036B0D50099F8F90056BAD10072D3
      E100CEF6F800A3ABAB0081807E007B7975007E7F7F00A2AAAA0099DBEB009D9E
      9E00E9E9E9000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000C28E8E00F3ED
      EE00ECEEEC0099A5C800C0C1C000D3D4D500AEADAE007D7C7E00B0B1B200896D
      6D0086868600E0E0E000000000000000000033B8DD00B9FFFF00A3FFFF008BEF
      F50072D7E400A6DBE700B7E0EB00C5EAF100CEF4F700CBFDFF005897AE00BFBF
      BF00F6F6F6000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000C9949400DFD7
      D7007E7D7C005D5E6E00B8AAA8008E858500665E5E009E878700A68A8A006A5E
      5E00B3B3B300ECECEC00000000000000000035BCE90035BEE30054D1E9007DEC
      F700A6FFFF00B4FFFF00ADFFFF0096F2F40086DEE8005ED8ED0079919900D7D7
      D700FDFDFD000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000BCA3A300C29F
      9F0064606000867979008E8484007471710062606000807E7E008A8A8A009495
      9500E8E8E800FCFCFC00000000000000000000000000F7FDFE00C8E9F70094D6
      EF0061C1E70038BEE80033BCDF0056D5EA008EF7FC0034C2E300B9BBBC00ECEC
      EC00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000EEEEEE008C8E
      8E00888888009192920097979700AFAFAF00C0C1C100C8C8C800D2D2D200F5F5
      F500FDFDFD000000000000000000000000000000000000000000000000000000
      00000000000000000000F7FCFE00C7E5F10093CDE40080CFEA00F1F1F100FCFC
      FC00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000100000000100010000000000800000000000000000000000
      000000000000000000000000FFFFFF00C003F1E000000000C003E00000000000
      C003C00000000000C003C00000000000C003800000000000C003800000000000
      C003800000000000C003000000000000C003000100000000C003000300000000
      C003000300000000C003000700000000C003000700000000C003000700000000
      C003800F00000000C007FC0F0000000000000000000000000000000000000000
      000000000000}
  end
  object popObservacoes: TJvPopupMenu
    ImageMargin.Left = 0
    ImageMargin.Top = 0
    ImageMargin.Right = 0
    ImageMargin.Bottom = 0
    ImageSize.Height = 16
    ImageSize.Width = 16
    Left = 27
    Top = 513
    object Excluirobservao1: TMenuItem
      Caption = 'Excluir observa'#231#227'o'
      ImageIndex = 0
      OnClick = Excluirobservao1Click
    end
  end
  object ApplicationEvents1: TApplicationEvents
    Left = 97
    Top = 317
  end
  object popCopiarPedido: TPopupMenu
    Left = 130
    Top = 386
    object Copiarestepedido1: TMenuItem
      Caption = 'Copiar este pedido'
      OnClick = Copiarestepedido1Click
    end
  end
  object ACBrValidador1: TACBrValidador
    IgnorarChar = './-'
    Left = 29
    Top = 317
  end
  object cxStyleRepository1: TcxStyleRepository
    Left = 131
    Top = 315
    PixelsPerInch = 96
    object cxStyle2: TcxStyle
      AssignedValues = [svColor, svFont]
      Color = 15658734
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
    end
    object cxStyle1: TcxStyle
      AssignedValues = [svColor, svFont]
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
    end
  end
  object cxStyleRepository2: TcxStyleRepository
    Left = 165
    Top = 317
    PixelsPerInch = 96
    object cxStyle3: TcxStyle
      AssignedValues = [svColor, svFont]
      Color = 15658734
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 12615680
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = []
    end
    object cxStyle4: TcxStyle
      AssignedValues = [svFont]
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = []
    end
  end
  object popFormasPagamento: TPopupMenu
    Left = 187
    Top = 454
    object E1: TMenuItem
      Caption = 'Excluir forma de pagamento'
      OnClick = E1Click
    end
  end
end
