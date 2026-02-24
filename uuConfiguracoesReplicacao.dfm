object frmConfiguracaoReplicacao: TfrmConfiguracaoReplicacao
  Left = 0
  Top = 0
  Caption = 'frmConfiguracaoReplicacao'
  ClientHeight = 467
  ClientWidth = 784
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  TextHeight = 13
  object Panel3: TPanel
    Left = 0
    Top = 0
    Width = 784
    Height = 467
    Align = alClient
    TabOrder = 0
    object pgSchemas: TJvPageList
      Left = 1
      Top = 1
      Width = 786
      Height = 466
      ActivePage = pgAdicionarTabela
      PropagateEnable = False
      Align = alClient
      ExplicitWidth = 782
      ExplicitHeight = 465
      object pgListaSchema: TJvStandardPage
        Left = 0
        Top = 0
        Width = 786
        Height = 466
        Caption = 'pgListaSchema'
        object Panel29: TPanel
          Left = 0
          Top = 0
          Width = 786
          Height = 466
          Align = alClient
          TabOrder = 0
          object Panel30: TPanel
            Left = 1
            Top = 1
            Width = 784
            Height = 41
            Align = alTop
            Color = 12615680
            ParentBackground = False
            TabOrder = 0
            object Label15: TLabel
              Left = 1
              Top = 1
              Width = 159
              Height = 19
              Align = alClient
              Alignment = taCenter
              Caption = 'Schemas de replica'#231#227'o'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWhite
              Font.Height = -16
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              Layout = tlCenter
            end
          end
          object cxGrid1: TcxGrid
            Left = 1
            Top = 42
            Width = 784
            Height = 423
            Align = alClient
            TabOrder = 1
            object cxGrid1DBTableView1: TcxGridDBTableView
              PopupMenu = popListaSchemas
              Navigator.Buttons.CustomButtons = <>
              ScrollbarAnnotations.CustomAnnotations = <>
              DataController.DataSource = dmConfiguracaoReplicacao.dsSchemas
              DataController.Summary.DefaultGroupSummaryItems = <>
              DataController.Summary.FooterSummaryItems = <>
              DataController.Summary.SummaryGroups = <>
              OptionsView.GroupByBox = False
              Styles.Content = cxStyle4
              Styles.ContentOdd = cxStyle2
              object cxGrid1DBTableView1ID: TcxGridDBColumn
                DataBinding.FieldName = 'ID'
                DataBinding.IsNullValueType = True
                Styles.Header = cxStyle5
                Width = 71
              end
              object cxGrid1DBTableView1NAME: TcxGridDBColumn
                Caption = 'Nome do Schema'
                DataBinding.FieldName = 'NAME'
                DataBinding.IsNullValueType = True
                Styles.Header = cxStyle5
                Width = 665
              end
            end
            object cxGrid1Level1: TcxGridLevel
              GridView = cxGrid1DBTableView1
            end
          end
        end
      end
      object pgNovoSchema: TJvStandardPage
        Left = 0
        Top = 0
        Width = 786
        Height = 466
        Caption = 'pgNovoSchema'
        object Panel4: TPanel
          Left = 0
          Top = 0
          Width = 786
          Height = 466
          Align = alClient
          Color = clWhite
          ParentBackground = False
          TabOrder = 0
          DesignSize = (
            782
            465)
          object Label2: TLabel
            Left = 16
            Top = 122
            Width = 181
            Height = 19
            Caption = 'Digite o nome do schema'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -16
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object Panel5: TPanel
            Left = 1
            Top = 1
            Width = 780
            Height = 41
            Align = alTop
            Color = 12615680
            ParentBackground = False
            TabOrder = 0
            ExplicitWidth = 784
            object Label1: TLabel
              Left = 1
              Top = 1
              Width = 589
              Height = 19
              Align = alClient
              Alignment = taCenter
              Caption = 
                'Digite os dados para o Schema e marque para quais servidores uti' +
                'lizar este schema'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWhite
              Font.Height = -16
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              Layout = tlCenter
            end
          end
          object edNomeSchema: TEdit
            Left = 16
            Top = 160
            Width = 757
            Height = 33
            Anchors = [akLeft, akTop, akRight]
            CharCase = ecUpperCase
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -21
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 1
            ExplicitWidth = 761
          end
          object Panel1: TPanel
            Left = 1
            Top = 398
            Width = 780
            Height = 66
            Align = alBottom
            BevelOuter = bvNone
            Color = clWhite
            ParentBackground = False
            TabOrder = 2
            ExplicitTop = 399
            ExplicitWidth = 784
            DesignSize = (
              780
              66)
            object btSalvarSchema: TAdvGlassButton
              Left = 520
              Top = 14
              Width = 123
              Height = 48
              Anchors = [akRight, akBottom]
              BackColor = 12615680
              ButtonDirection = bdLeft
              Caption = 'Salvar'
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
                89504E470D0A1A0A0000000D4948445200000020000000200806000000737A7A
                F4000004B269545874584D4C3A636F6D2E61646F62652E786D7000000000003C
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
                696F6E3D223332220A202020657869663A436F6C6F7253706163653D2231220A
                202020746966663A496D61676557696474683D223332220A202020746966663A
                496D6167654C656E6774683D223332220A202020746966663A5265736F6C7574
                696F6E556E69743D2232220A202020746966663A585265736F6C7574696F6E3D
                2237322E30220A202020746966663A595265736F6C7574696F6E3D2237322E30
                220A20202070686F746F73686F703A436F6C6F724D6F64653D2233220A202020
                70686F746F73686F703A49434350726F66696C653D2273524742204945433631
                3936362D322E31220A202020786D703A4D6F64696679446174653D2232303230
                2D30382D30375431373A34393A31312D30333A3030220A202020786D703A4D65
                746164617461446174653D22323032302D30382D30375431373A34393A31312D
                30333A3030223E0A2020203C786D704D4D3A486973746F72793E0A202020203C
                7264663A5365713E0A20202020203C7264663A6C690A20202020202073744576
                743A616374696F6E3D2270726F6475636564220A20202020202073744576743A
                736F6674776172654167656E743D22416666696E6974792044657369676E6572
                20312E372E33220A20202020202073744576743A7768656E3D22323032302D30
                382D30375431373A34393A31312D30333A3030222F3E0A202020203C2F726466
                3A5365713E0A2020203C2F786D704D4D3A486973746F72793E0A20203C2F7264
                663A4465736372697074696F6E3E0A203C2F7264663A5244463E0A3C2F783A78
                6D706D6574613E0A3C3F787061636B657420656E643D2272223F3E07888C8A00
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
                9C180000011D494441545885EDD3214EC35000C7E16F280E809B0547B8026504
                45C23D702428DC732812B80A098A10CA15180E3D87999B44B4CD46B695D7F675
                08F6776DDAFCBEBCB46CF7DF37D85829E443DC63881B217BDB1CA088E7D82FEF
                CC702164CFFD0396E3D56638EF17B03E5E6DBCF3877198F6730271F12F8CD29F
                407CFC54C8C6694FA059FC9DC5DF30E4C7B8C504574236E93B3E0784FC0C8FD8
                2DEF7FE2241AD1325E00423EC2D342BC5A1CA2431C76F0B0220E07782D03BDC4
                2BC0B4E6E5F58804F10A70593E188F481467FE111EE1057B35CF16DF44B124F1
                39A01962902AFE13108FA85BA3F832A01BA2717C35A01DA2557C3DA019A275BC
                1E1087E814FF1D508FE81C8F03AC462489C7030AC421EECAAB6B21FBE81ADF6E
                3BF806DBB38AEC588599A90000000049454E44AE426082}
              ParentFont = False
              ShineColor = clWhite
              TabOrder = 0
              Version = '1.3.3.1'
              OnClick = btSalvarSchemaClick
              ExplicitLeft = 524
            end
            object pgCancelarSchema: TAdvGlassButton
              Left = 649
              Top = 14
              Width = 123
              Height = 48
              Anchors = [akRight, akBottom]
              BackColor = 12615680
              ButtonDirection = bdLeft
              Caption = 'Cancelar'
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
                89504E470D0A1A0A0000000D4948445200000020000000200806000000737A7A
                F4000004B269545874584D4C3A636F6D2E61646F62652E786D7000000000003C
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
                696F6E3D223332220A202020657869663A436F6C6F7253706163653D2231220A
                202020746966663A496D61676557696474683D223332220A202020746966663A
                496D6167654C656E6774683D223332220A202020746966663A5265736F6C7574
                696F6E556E69743D2232220A202020746966663A585265736F6C7574696F6E3D
                2237322E30220A202020746966663A595265736F6C7574696F6E3D2237322E30
                220A20202070686F746F73686F703A436F6C6F724D6F64653D2233220A202020
                70686F746F73686F703A49434350726F66696C653D2273524742204945433631
                3936362D322E31220A202020786D703A4D6F64696679446174653D2232303230
                2D30382D30375431373A34393A31312D30333A3030220A202020786D703A4D65
                746164617461446174653D22323032302D30382D30375431373A34393A31312D
                30333A3030223E0A2020203C786D704D4D3A486973746F72793E0A202020203C
                7264663A5365713E0A20202020203C7264663A6C690A20202020202073744576
                743A616374696F6E3D2270726F6475636564220A20202020202073744576743A
                736F6674776172654167656E743D22416666696E6974792044657369676E6572
                20312E372E33220A20202020202073744576743A7768656E3D22323032302D30
                382D30375431373A34393A31312D30333A3030222F3E0A202020203C2F726466
                3A5365713E0A2020203C2F786D704D4D3A486973746F72793E0A20203C2F7264
                663A4465736372697074696F6E3E0A203C2F7264663A5244463E0A3C2F783A78
                6D706D6574613E0A3C3F787061636B657420656E643D2272223F3E07888C8A00
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
                9C180000011D494441545885EDD3214EC35000C7E16F280E809B0547B8026504
                45C23D702428DC732812B80A098A10CA15180E3D87999B44B4CD46B695D7F675
                08F6776DDAFCBEBCB46CF7DF37D85829E443DC63881B217BDB1CA088E7D82FEF
                CC702164CFFD0396E3D56638EF17B03E5E6DBCF3877198F6730271F12F8CD29F
                407CFC54C8C6694FA059FC9DC5DF30E4C7B8C504574236E93B3E0784FC0C8FD8
                2DEF7FE2241AD1325E00423EC2D342BC5A1CA2431C76F0B0220E07782D03BDC4
                2BC0B4E6E5F58804F10A70593E188F481467FE111EE1057B35CF16DF44B124F1
                39A01962902AFE13108FA85BA3F832A01BA2717C35A01DA2557C3DA019A275BC
                1E1087E814FF1D508FE81C8F03AC462489C7030AC421EECAAB6B21FBE81ADF6E
                3BF806DBB38AEC588599A90000000049454E44AE426082}
              ParentFont = False
              ShineColor = clWhite
              TabOrder = 1
              Version = '1.3.3.1'
              OnClick = pgCancelarSchemaClick
              ExplicitLeft = 653
            end
          end
        end
      end
      object pgAdicionarTabela: TJvStandardPage
        Left = 0
        Top = 0
        Width = 782
        Height = 465
        Caption = 'pgAdicionarTabela'
        object Panel2: TPanel
          Left = 0
          Top = 0
          Width = 392
          Height = 466
          Align = alLeft
          Caption = 'Panel4'
          TabOrder = 0
          ExplicitHeight = 465
          object pgList: TJvPageList
            Left = 1
            Top = 1
            Width = 390
            Height = 464
            ActivePage = pgFieldsSelect
            PropagateEnable = False
            Align = alClient
            ExplicitHeight = 463
            object pgFieldsSelect: TJvStandardPage
              Left = 0
              Top = 0
              Width = 390
              Height = 464
              Caption = '.'
              ExplicitHeight = 463
              object Panel6: TPanel
                Left = 0
                Top = 0
                Width = 390
                Height = 464
                Align = alClient
                BevelOuter = bvNone
                Caption = 'Panel5'
                TabOrder = 0
                ExplicitHeight = 463
                object Panel7: TPanel
                  Left = 0
                  Top = 0
                  Width = 390
                  Height = 41
                  Align = alTop
                  Color = 12615680
                  ParentBackground = False
                  TabOrder = 0
                  object Label3: TLabel
                    Left = 1
                    Top = 1
                    Width = 388
                    Height = 39
                    Align = alClient
                    Alignment = taCenter
                    Caption = 'Selecione a tabela e os campos que deseja replicar'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWhite
                    Font.Height = -16
                    Font.Name = 'Tahoma'
                    Font.Style = []
                    ParentFont = False
                    Layout = tlCenter
                    ExplicitWidth = 357
                    ExplicitHeight = 19
                  end
                end
                object Panel8: TPanel
                  Left = 0
                  Top = 41
                  Width = 390
                  Height = 423
                  Align = alClient
                  TabOrder = 1
                  ExplicitHeight = 422
                  object Label4: TLabel
                    Left = 5
                    Top = 15
                    Width = 202
                    Height = 16
                    Caption = 'Selecione a tabela para replica'#231#227'o:'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -13
                    Font.Name = 'Tahoma'
                    Font.Style = []
                    ParentFont = False
                  end
                  object cbTableName: TcxLookupComboBox
                    Left = 5
                    Top = 34
                    ParentFont = False
                    Properties.KeyFieldNames = 'TABLE_NAME'
                    Properties.ListColumns = <
                      item
                        FieldName = 'TABLE_NAME'
                      end>
                    Properties.ListSource = dmConfiguracaoReplicacao.dsDatabaseTables
                    Properties.OnCloseUp = cbTableNamePropertiesCloseUp
                    Style.Font.Charset = DEFAULT_CHARSET
                    Style.Font.Color = clWindowText
                    Style.Font.Height = -15
                    Style.Font.Name = 'Tahoma'
                    Style.Font.Style = []
                    Style.IsFontAssigned = True
                    TabOrder = 0
                    Width = 379
                  end
                  object ckFieldList: TcxCheckListBox
                    Left = 5
                    Top = 93
                    Width = 380
                    Height = 329
                    EditValueFormat = cvfStatesString
                    Items = <>
                    PopupMenu = popFieldProp
                    TabOrder = 1
                  end
                  object ckbSelecionarTodos: TcxCheckBox
                    Left = 5
                    Top = 66
                    Caption = 'Selecionar todos'
                    TabOrder = 2
                    OnClick = ckbSelecionarTodosClick
                  end
                  object Panel12: TPanel
                    Left = 1
                    Top = 378
                    Width = 388
                    Height = 43
                    Align = alBottom
                    BevelOuter = bvNone
                    TabOrder = 3
                    object btGerarSQLSelect: TPngSpeedButton
                      Left = 199
                      Top = 0
                      Width = 185
                      Height = 40
                      Caption = 'Pr'#243'ximo'
                      OnClick = btGerarSQLSelectClick
                    end
                  end
                end
              end
            end
            object pgScriptsDelete: TJvStandardPage
              Left = 0
              Top = 0
              Width = 390
              Height = 463
              Caption = 'pgScriptsDelete'
              ExplicitHeight = 464
              object Panel21: TPanel
                Left = 0
                Top = 0
                Width = 390
                Height = 464
                Align = alClient
                BevelOuter = bvNone
                Caption = 'Panel5'
                TabOrder = 0
                object Panel22: TPanel
                  Left = 0
                  Top = 0
                  Width = 390
                  Height = 41
                  Align = alTop
                  Color = 12615680
                  ParentBackground = False
                  TabOrder = 0
                  object Label11: TLabel
                    Left = 1
                    Top = 1
                    Width = 220
                    Height = 19
                    Align = alClient
                    Alignment = taCenter
                    Caption = 'Scripts para executar ao excluir'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWhite
                    Font.Height = -16
                    Font.Name = 'Tahoma'
                    Font.Style = []
                    ParentFont = False
                    Layout = tlCenter
                  end
                end
                object Panel23: TPanel
                  Left = 0
                  Top = 41
                  Width = 390
                  Height = 423
                  Align = alClient
                  TabOrder = 1
                  object Label12: TLabel
                    Left = 6
                    Top = 29
                    Width = 157
                    Height = 16
                    Caption = 'Script para antes de excluir'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -13
                    Font.Name = 'Tahoma'
                    Font.Style = []
                    ParentFont = False
                  end
                  object Label13: TLabel
                    Left = 6
                    Top = 221
                    Width = 188
                    Height = 16
                    Caption = 'Script para executar ap'#243's excluir'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -13
                    Font.Name = 'Tahoma'
                    Font.Style = []
                    ParentFont = False
                  end
                  object Panel24: TPanel
                    Left = 1
                    Top = 379
                    Width = 388
                    Height = 43
                    Align = alBottom
                    BevelOuter = bvNone
                    TabOrder = 0
                    object PngSpeedButton6: TPngSpeedButton
                      Left = 5
                      Top = 0
                      Width = 185
                      Height = 40
                      Caption = 'Anterior'
                      OnClick = PngSpeedButton6Click
                    end
                    object PngSpeedButton7: TPngSpeedButton
                      Left = 195
                      Top = 0
                      Width = 185
                      Height = 40
                      Caption = 'Pr'#243'ximo'
                      OnClick = PngSpeedButton7Click
                    end
                  end
                  object memoScriptBeforeDelete: TMemo
                    Left = 6
                    Top = 48
                    Width = 372
                    Height = 169
                    TabOrder = 1
                  end
                  object memoScriptAfterDelete: TMemo
                    Left = 6
                    Top = 240
                    Width = 372
                    Height = 169
                    TabOrder = 2
                  end
                end
              end
            end
            object pgScriptsInsertOrUp: TJvStandardPage
              Left = 0
              Top = 0
              Width = 390
              Height = 463
              Caption = '.'
              ExplicitHeight = 464
              object Panel17: TPanel
                Left = 0
                Top = 0
                Width = 390
                Height = 464
                Align = alClient
                BevelOuter = bvNone
                Caption = 'Panel5'
                TabOrder = 0
                object Panel18: TPanel
                  Left = 0
                  Top = 0
                  Width = 390
                  Height = 41
                  Align = alTop
                  Color = 12615680
                  ParentBackground = False
                  TabOrder = 0
                  object Label8: TLabel
                    Left = 1
                    Top = 1
                    Width = 305
                    Height = 19
                    Align = alClient
                    Alignment = taCenter
                    Caption = 'Scripts para executar ao inserir ou atualizar'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWhite
                    Font.Height = -16
                    Font.Name = 'Tahoma'
                    Font.Style = []
                    ParentFont = False
                    Layout = tlCenter
                  end
                end
                object Panel19: TPanel
                  Left = 0
                  Top = 41
                  Width = 390
                  Height = 423
                  Align = alClient
                  TabOrder = 1
                  object Label9: TLabel
                    Left = 6
                    Top = 29
                    Width = 218
                    Height = 16
                    Caption = 'Script para antes de inserir / atualizar'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -13
                    Font.Name = 'Tahoma'
                    Font.Style = []
                    ParentFont = False
                  end
                  object Label10: TLabel
                    Left = 6
                    Top = 221
                    Width = 224
                    Height = 16
                    Caption = 'Script para depois de inserir / atualizar'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -13
                    Font.Name = 'Tahoma'
                    Font.Style = []
                    ParentFont = False
                  end
                  object Panel20: TPanel
                    Left = 1
                    Top = 379
                    Width = 388
                    Height = 43
                    Align = alBottom
                    BevelOuter = bvNone
                    TabOrder = 0
                    object PngSpeedButton4: TPngSpeedButton
                      Left = 5
                      Top = 0
                      Width = 185
                      Height = 40
                      Caption = 'Anterior'
                      OnClick = PngSpeedButton4Click
                    end
                    object PngSpeedButton5: TPngSpeedButton
                      Left = 196
                      Top = 0
                      Width = 185
                      Height = 40
                      Caption = 'Pr'#243'ximo'
                      OnClick = PngSpeedButton5Click
                    end
                  end
                  object memoScriptBeforeInsertOrUp: TMemo
                    Left = 6
                    Top = 48
                    Width = 372
                    Height = 169
                    TabOrder = 1
                  end
                  object memoScriptAfterInsertOrUp: TMemo
                    Left = 6
                    Top = 240
                    Width = 372
                    Height = 169
                    TabOrder = 2
                  end
                end
              end
            end
            object pgFieldExtraParams: TJvStandardPage
              Left = 0
              Top = 0
              Width = 390
              Height = 463
              Caption = '.'
              ExplicitHeight = 464
              object Panel13: TPanel
                Left = 0
                Top = 0
                Width = 390
                Height = 464
                Align = alClient
                BevelOuter = bvNone
                Caption = 'Panel5'
                TabOrder = 0
                object Panel14: TPanel
                  Left = 0
                  Top = 0
                  Width = 390
                  Height = 41
                  Align = alTop
                  Color = 12615680
                  ParentBackground = False
                  TabOrder = 0
                  object Label5: TLabel
                    Left = 1
                    Top = 1
                    Width = 222
                    Height = 19
                    Align = alClient
                    Alignment = taCenter
                    Caption = 'Par'#226'metros extras para campos'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWhite
                    Font.Height = -16
                    Font.Name = 'Tahoma'
                    Font.Style = []
                    ParentFont = False
                    Layout = tlCenter
                  end
                end
                object Panel15: TPanel
                  Left = 0
                  Top = 41
                  Width = 390
                  Height = 423
                  Align = alClient
                  TabOrder = 1
                  object Label6: TLabel
                    Left = 6
                    Top = 6
                    Width = 275
                    Height = 16
                    Caption = 'Informe os par'#226'metros extras para este campo.'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -13
                    Font.Name = 'Tahoma'
                    Font.Style = []
                    ParentFont = False
                  end
                  object Label7: TLabel
                    Left = 5
                    Top = 45
                    Width = 312
                    Height = 32
                    Caption = 
                      'Coloque um # onde deveria ser informado o nome do campo. Ex:  ca' +
                      'st(# as Numeric(10,2))'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -13
                    Font.Name = 'Tahoma'
                    Font.Style = []
                    ParentFont = False
                    WordWrap = True
                  end
                  object Label14: TLabel
                    Left = 5
                    Top = 207
                    Width = 280
                    Height = 16
                    Caption = 'Informe um alias (apelido) para o campo no SQL'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -13
                    Font.Name = 'Tahoma'
                    Font.Style = []
                    ParentFont = False
                  end
                  object Panel16: TPanel
                    Left = 1
                    Top = 379
                    Width = 388
                    Height = 43
                    Align = alBottom
                    BevelOuter = bvNone
                    TabOrder = 0
                    object PngSpeedButton1: TPngSpeedButton
                      Left = 5
                      Top = 0
                      Width = 380
                      Height = 40
                      Caption = 'Salvar par'#226'metros'
                      OnClick = PngSpeedButton1Click
                    end
                  end
                  object memoExtraFieldParam: TMemo
                    Left = 5
                    Top = 88
                    Width = 380
                    Height = 81
                    TabOrder = 1
                  end
                  object edAliasName: TEdit
                    Left = 6
                    Top = 226
                    Width = 379
                    Height = 27
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -16
                    Font.Name = 'Tahoma'
                    Font.Style = []
                    ParentFont = False
                    TabOrder = 2
                  end
                end
              end
            end
            object pgSelectSQL: TJvStandardPage
              Left = 0
              Top = 0
              Width = 390
              Height = 463
              Caption = '.'
              ExplicitHeight = 464
              object Panel9: TPanel
                Left = 0
                Top = 0
                Width = 390
                Height = 464
                Align = alClient
                BevelOuter = bvNone
                Caption = 'Panel5'
                TabOrder = 0
                object Panel10: TPanel
                  Left = 0
                  Top = 0
                  Width = 390
                  Height = 41
                  Align = alTop
                  Color = 12615680
                  ParentBackground = False
                  TabOrder = 0
                  object Label16: TLabel
                    Left = 1
                    Top = 1
                    Width = 107
                    Height = 19
                    Align = alClient
                    Alignment = taCenter
                    Caption = 'SQL de sele'#231#227'o'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWhite
                    Font.Height = -16
                    Font.Name = 'Tahoma'
                    Font.Style = []
                    ParentFont = False
                    Layout = tlCenter
                  end
                end
                object Panel11: TPanel
                  Left = 0
                  Top = 41
                  Width = 390
                  Height = 423
                  Align = alClient
                  TabOrder = 1
                  object memoSQLSelect: TMemo
                    Left = 5
                    Top = 6
                    Width = 380
                    Height = 416
                    PopupMenu = popCopiar
                    TabOrder = 0
                  end
                  object Panel25: TPanel
                    Left = 1
                    Top = 379
                    Width = 388
                    Height = 43
                    Align = alBottom
                    BevelOuter = bvNone
                    TabOrder = 1
                    object PngSpeedButton2: TPngSpeedButton
                      Left = 5
                      Top = 0
                      Width = 185
                      Height = 40
                      Caption = 'Anterior'
                      OnClick = PngSpeedButton2Click
                    end
                    object PngSpeedButton3: TPngSpeedButton
                      Left = 195
                      Top = 0
                      Width = 185
                      Height = 40
                      Caption = 'Pr'#243'ximo'
                    end
                  end
                end
              end
            end
            object pgVirtualFields: TJvStandardPage
              Left = 0
              Top = 0
              Width = 390
              Height = 463
              Caption = '.'
              ExplicitHeight = 464
              object Panel26: TPanel
                Left = 0
                Top = 0
                Width = 390
                Height = 464
                Align = alClient
                BevelOuter = bvNone
                Caption = 'Panel5'
                TabOrder = 0
                object Panel27: TPanel
                  Left = 0
                  Top = 0
                  Width = 390
                  Height = 41
                  Align = alTop
                  Color = 12615680
                  ParentBackground = False
                  TabOrder = 0
                  object Label17: TLabel
                    Left = 1
                    Top = 1
                    Width = 113
                    Height = 19
                    Align = alClient
                    Alignment = taCenter
                    Caption = 'Campos virtuais'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWhite
                    Font.Height = -16
                    Font.Name = 'Tahoma'
                    Font.Style = []
                    ParentFont = False
                    Layout = tlCenter
                  end
                end
                object Panel28: TPanel
                  Left = 0
                  Top = 41
                  Width = 390
                  Height = 423
                  Align = alClient
                  TabOrder = 1
                  object Label18: TLabel
                    Left = 5
                    Top = 45
                    Width = 384
                    Height = 40
                    AutoSize = False
                    Caption = 
                      'Adicione aqui campos virtuais ou valores que dever'#227'o ser adicion' +
                      'ados ao select'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -13
                    Font.Name = 'Tahoma'
                    Font.Style = []
                    ParentFont = False
                    WordWrap = True
                  end
                  object Panel31: TPanel
                    Left = 1
                    Top = 379
                    Width = 388
                    Height = 43
                    Align = alBottom
                    BevelOuter = bvNone
                    TabOrder = 0
                    object PngSpeedButton8: TPngSpeedButton
                      Left = 5
                      Top = 0
                      Width = 380
                      Height = 40
                      Caption = 'Salvar'
                      OnClick = PngSpeedButton8Click
                    end
                  end
                  object memoVirtualFields: TMemo
                    Left = 5
                    Top = 88
                    Width = 380
                    Height = 334
                    TabOrder = 1
                  end
                end
              end
            end
          end
        end
      end
    end
  end
  object cxstylrpstry1: TcxStyleRepository
    Left = 168
    Top = 560
    PixelsPerInch = 96
    object cxstyl1: TcxStyle
    end
    object cxStyle1: TcxStyle
      AssignedValues = [svColor]
      Color = 15987699
    end
  end
  object popFieldProp: TPopupMenu
    Left = 706
    Top = 564
    object A1: TMenuItem
      Caption = 'Par'#226'metros extras do campo'
      OnClick = A1Click
    end
    object A2: TMenuItem
      Caption = 'Adicionar campos virtuais'
      OnClick = A2Click
    end
  end
  object popCopiar: TPopupMenu
    Left = 658
    Top = 564
    object M1: TMenuItem
      Caption = 'Copiar conte'#250'do SQL'
      OnClick = M1Click
    end
  end
  object popListaSchemas: TPopupMenu
    Left = 337
    Top = 353
    object N1: TMenuItem
      Caption = 'Novo schema de replica'#231#227'o'
      OnClick = N1Click
    end
    object E1: TMenuItem
      Caption = 'Excluir schema'
      OnClick = E1Click
    end
    object D1: TMenuItem
      Caption = 'Definir servidores '
    end
    object C1: TMenuItem
      Caption = 'Configurar tabelas para este schema'
      OnClick = C1Click
    end
  end
  object cxStyleRepository1: TcxStyleRepository
    Left = 416
    Top = 360
    PixelsPerInch = 96
    object cxStyle2: TcxStyle
      AssignedValues = [svColor, svFont]
      Color = 15658734
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Tahoma'
      Font.Style = []
    end
    object cxStyle3: TcxStyle
      AssignedValues = [svFont]
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Tahoma'
      Font.Style = []
    end
    object cxStyle5: TcxStyle
      AssignedValues = [svColor, svFont]
      Color = clSilver
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
    end
  end
  object cxStyleRepository2: TcxStyleRepository
    PixelsPerInch = 96
    object cxStyle4: TcxStyle
      AssignedValues = [svColor, svFont]
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Tahoma'
      Font.Style = []
    end
  end
end
