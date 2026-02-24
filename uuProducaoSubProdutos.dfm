inherited frmProducaoSubProdutos: TfrmProducaoSubProdutos
  ClientHeight = 660
  ClientWidth = 1221
  OnDestroy = FormDestroy
  ExplicitWidth = 1237
  ExplicitHeight = 699
  TextHeight = 13
  object jvPrincipal: TJvPageList [2]
    Left = 0
    Top = 0
    Width = 1221
    Height = 660
    ActivePage = pgListagem
    PropagateEnable = False
    Align = alClient
    object pgListagem: TJvStandardPage
      Left = 0
      Top = 0
      Width = 1225
      Height = 661
      Caption = 'pgListagem'
      OnShow = pgListagemShow
      ExplicitWidth = 1221
      ExplicitHeight = 660
      object SpeedButton1: TSpeedButton
        Left = 142
        Top = 21
        Width = 22
        Height = 22
        Flat = True
        Glyph.Data = {
          DE010000424DDE01000000000000760000002800000024000000120000000100
          0400000000006801000000000000000000001000000010000000000000000000
          80000080000000808000800000008000800080800000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00666666666666
          6666666666666666666666660000666666666666666666666666666666666666
          0000666666666666666666666666666666666666000060000066666000006668
          8888666668888866000060800066666080006668788866666878886600006080
          00666660800066687888666668788866000060000000F00000006668888888F8
          8888886600006080000000800000666878888888788888660000608000006080
          0000666878888868788888660000608000006080000066687888886878888866
          0000660000000000000666668888888888888666000066608000F08000666666
          687888F878886666000066600000600000666666688888688888666600006666
          00066600066666666688866688866666000066668F06668F06666666668F8666
          8F86666600006666000666000666666666888666888666660000666666666666
          6666666666666666666666660000666666666666666666666666666666666666
          0000}
        NumGlyphs = 2
        Visible = False
        OnClick = botao_pesquisaClick
      end
      object SpeedButton3: TSpeedButton
        Left = 150
        Top = 29
        Width = 22
        Height = 22
        Flat = True
        Glyph.Data = {
          DE010000424DDE01000000000000760000002800000024000000120000000100
          0400000000006801000000000000000000001000000010000000000000000000
          80000080000000808000800000008000800080800000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00666666666666
          6666666666666666666666660000666666666666666666666666666666666666
          0000666666666666666666666666666666666666000060000066666000006668
          8888666668888866000060800066666080006668788866666878886600006080
          00666660800066687888666668788866000060000000F00000006668888888F8
          8888886600006080000000800000666878888888788888660000608000006080
          0000666878888868788888660000608000006080000066687888886878888866
          0000660000000000000666668888888888888666000066608000F08000666666
          687888F878886666000066600000600000666666688888688888666600006666
          00066600066666666688866688866666000066668F06668F06666666668F8666
          8F86666600006666000666000666666666888666888666660000666666666666
          6666666666666666666666660000666666666666666666666666666666666666
          0000}
        NumGlyphs = 2
        Visible = False
        OnClick = botao_pesquisaClick
      end
      object SpeedButton4: TSpeedButton
        Left = 118
        Top = -19
        Width = 22
        Height = 22
        Flat = True
        Glyph.Data = {
          DE010000424DDE01000000000000760000002800000024000000120000000100
          0400000000006801000000000000000000001000000010000000000000000000
          80000080000000808000800000008000800080800000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00666666666666
          6666666666666666666666660000666666666666666666666666666666666666
          0000666666666666666666666666666666666666000060000066666000006668
          8888666668888866000060800066666080006668788866666878886600006080
          00666660800066687888666668788866000060000000F00000006668888888F8
          8888886600006080000000800000666878888888788888660000608000006080
          0000666878888868788888660000608000006080000066687888886878888866
          0000660000000000000666668888888888888666000066608000F08000666666
          687888F878886666000066600000600000666666688888688888666600006666
          00066600066666666688866688866666000066668F06668F06666666668F8666
          8F86666600006666000666000666666666888666888666660000666666666666
          6666666666666666666666660000666666666666666666666666666666666666
          0000}
        NumGlyphs = 2
        Visible = False
        OnClick = botao_pesquisaClick
      end
      object Edit2: TEdit
        Tag = 99
        Left = 15
        Top = 21
        Width = 121
        Height = 21
        TabOrder = 0
        Text = 'Edit1'
        Visible = False
        OnChange = Edit1Change
        OnEnter = Edit1Enter
        OnExit = Edit1Exit
        OnKeyDown = Edit1KeyDown
      end
      object Edit4: TEdit
        Tag = 99
        Left = 23
        Top = 29
        Width = 121
        Height = 21
        TabOrder = 1
        Text = 'Edit1'
        Visible = False
        OnChange = Edit1Change
        OnEnter = Edit1Enter
        OnExit = Edit1Exit
        OnKeyDown = Edit1KeyDown
      end
      object Edit5: TEdit
        Tag = 99
        Left = -9
        Top = -19
        Width = 121
        Height = 21
        TabOrder = 2
        Text = 'Edit1'
        Visible = False
        OnChange = Edit1Change
        OnEnter = Edit1Enter
        OnExit = Edit1Exit
        OnKeyDown = Edit1KeyDown
      end
      object pnCorpo: TPanel
        Left = 0
        Top = 228
        Width = 1225
        Height = 371
        Align = alClient
        BevelOuter = bvNone
        Color = clWhite
        ParentBackground = False
        TabOrder = 3
        StyleElements = []
        ExplicitWidth = 1221
        ExplicitHeight = 370
        object Label4: TLabel
          Left = 10
          Top = -15
          Width = 111
          Height = 14
          Caption = 'Selecione o produto'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          StyleElements = []
        end
        object cxGrid1: TcxGrid
          Left = 0
          Top = 0
          Width = 1225
          Height = 371
          Align = alClient
          TabOrder = 0
          ExplicitWidth = 1221
          ExplicitHeight = 370
          object cxGrid1DBTableView1: TcxGridDBTableView
            PopupMenu = popListagem
            Navigator.Buttons.CustomButtons = <>
            ScrollbarAnnotations.CustomAnnotations = <>
            OnCellClick = cxGrid1DBTableView1CellClick
            DataController.DataSource = dmProducaoSubprodutos.dsListagemProducao
            DataController.Summary.DefaultGroupSummaryItems = <
              item
                Kind = skSum
                Position = spFooter
              end
              item
                Format = 'R$ ###,###,##0.00 '
                Kind = skSum
              end
              item
                Kind = skSum
                Position = spFooter
              end
              item
                Kind = skSum
                Position = spFooter
              end
              item
                Kind = skSum
                Position = spFooter
              end
              item
                Kind = skSum
                Position = spFooter
              end
              item
                Kind = skSum
                Position = spFooter
              end
              item
                Kind = skSum
                Position = spFooter
              end
              item
                Format = 'R$ ###,###,##0.00 '
                Kind = skSum
              end
              item
                Format = 'R$ ###,###,##0.00 '
                Kind = skSum
              end
              item
                Format = 'R$ ###,###,##0.00 '
                Kind = skSum
              end
              item
                Format = 'R$ ###,###,##0.00 '
                Kind = skSum
              end
              item
                Format = 'R$ ###,###,##0.00 '
                Kind = skSum
              end
              item
                Format = 'R$ ###,###,##0.00 '
                Kind = skSum
              end>
            DataController.Summary.FooterSummaryItems = <
              item
                Format = 'R$ ,0.00;-R$ ,0.00'
                Kind = skSum
              end
              item
                Kind = skCount
              end
              item
                Format = 'R$ ###,###,##0.00 '
                Kind = skSum
              end
              item
                Format = 'R$ ###,###,##0.00 '
                Kind = skSum
              end
              item
                Format = 'R$ ###,###,##0.00 '
                Kind = skSum
              end
              item
                Format = 'R$ ###,###,##0.00 '
                Kind = skSum
              end
              item
                Format = 'R$ ###,###,##0.00 '
                Kind = skSum
              end
              item
                Format = 'R$ ###,###,##0.00 '
                Kind = skSum
              end
              item
                Format = 'R$ ###,###,##0.00 '
                Kind = skSum
              end
              item
                Kind = skSum
                Column = cxGrid1DBTableView1CUSTO_PRODUCAO
              end
              item
                Kind = skSum
                Column = cxGrid1DBTableView1CUSTO_PERDAS
              end>
            DataController.Summary.SummaryGroups = <>
            OptionsData.CancelOnExit = False
            OptionsData.Deleting = False
            OptionsData.DeletingConfirmation = False
            OptionsData.Editing = False
            OptionsData.Inserting = False
            OptionsView.Footer = True
            OptionsView.GroupByBox = False
            Styles.Content = cxStyle2
            Styles.ContentOdd = stlRegistro
            object cxGrid1DBTableView1ID: TcxGridDBColumn
              Caption = 'Id'
              DataBinding.FieldName = 'ID'
              DataBinding.IsNullValueType = True
              Styles.Header = HeaderStl
              Width = 50
            end
            object cxGrid1DBTableView1PROCESSADA: TcxGridDBColumn
              Caption = 'Proc.'
              DataBinding.FieldName = 'PROCESSADA'
              DataBinding.IsNullValueType = True
              OnCustomDrawCell = cxGrid1DBTableView1PROCESSADACustomDrawCell
              OnGetDataText = cxGrid1DBTableView1PROCESSADAGetDataText
              Styles.Header = HeaderStl
              Width = 44
            end
            object cxGrid1DBTableView1DATA: TcxGridDBColumn
              Caption = 'Data'
              DataBinding.FieldName = 'DATA'
              DataBinding.IsNullValueType = True
              Styles.Header = HeaderStl
              Width = 104
            end
            object cxGrid1DBTableView1HISTORICO: TcxGridDBColumn
              Caption = 'Hist'#243'rico da produ'#231#227'o'
              DataBinding.FieldName = 'HISTORICO'
              DataBinding.IsNullValueType = True
              Styles.Header = HeaderStl
              Width = 386
            end
            object cxGrid1DBTableView1DATA_PROCESSAMENTO: TcxGridDBColumn
              Caption = 'Processada em'
              DataBinding.FieldName = 'DATA_PROCESSAMENTO'
              DataBinding.IsNullValueType = True
              Styles.Header = HeaderStl
              Width = 165
            end
            object cxGrid1DBTableView1NOME_USUARIO: TcxGridDBColumn
              Caption = 'Usu'#225'rio'
              DataBinding.FieldName = 'NOME_USUARIO'
              DataBinding.IsNullValueType = True
              Styles.Header = HeaderStl
              Width = 220
            end
            object cxGrid1DBTableView1CUSTO_PRODUCAO: TcxGridDBColumn
              Caption = 'Custo da produ'#231#227'o'
              DataBinding.FieldName = 'CUSTO_PRODUCAO'
              DataBinding.IsNullValueType = True
              PropertiesClassName = 'TcxCurrencyEditProperties'
              Styles.Footer = HeaderStl
              Styles.Header = HeaderStl
              Width = 133
            end
            object cxGrid1DBTableView1CUSTO_PERDAS: TcxGridDBColumn
              Caption = 'Perdas'
              DataBinding.FieldName = 'CUSTO_PERDAS'
              DataBinding.IsNullValueType = True
              PropertiesClassName = 'TcxCurrencyEditProperties'
              Styles.Footer = HeaderStl
              Styles.Header = HeaderStl
              Width = 121
            end
          end
          object cxGrid1Level1: TcxGridLevel
            GridView = cxGrid1DBTableView1
          end
        end
      end
      object frmTopo: TPanel
        Left = 0
        Top = 74
        Width = 1225
        Height = 154
        Align = alTop
        BevelOuter = bvNone
        Color = clWhite
        ParentBackground = False
        TabOrder = 4
        StyleElements = []
        ExplicitWidth = 1221
        object Label25: TLabel
          Left = 7
          Top = 90
          Width = 120
          Height = 14
          Caption = 'Hist'#243'rico da produ'#231#227'o'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          StyleElements = []
        end
        object RadioGroup2: TRadioGroup
          Left = 296
          Top = 5
          Width = 923
          Height = 77
          Caption = 'Que contenham o produto informado'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 4
        end
        object RadioGroup1: TRadioGroup
          Left = 8
          Top = 5
          Width = 286
          Height = 77
          Caption = 'Per'#237'odo a consultar'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
        end
        object Panel2: TPanel
          Left = 22
          Top = 23
          Width = 265
          Height = 57
          BevelOuter = bvNone
          Color = clWhite
          ParentBackground = False
          TabOrder = 1
          StyleElements = []
          object Label2: TLabel
            Left = 13
            Top = 5
            Width = 14
            Height = 14
            Caption = 'De'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
            StyleElements = []
          end
          object Label3: TLabel
            Left = 136
            Top = 5
            Width = 19
            Height = 14
            Caption = 'At'#233
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
            StyleElements = []
          end
          object edDataInicial: TAdvDateTimePicker
            Left = 9
            Top = 19
            Width = 121
            Height = 32
            Date = 43537.000000000000000000
            Format = ''
            Time = 0.668379629627452200
            DoubleBuffered = True
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -19
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            Kind = dkDate
            ParentDoubleBuffered = False
            ParentFont = False
            TabOrder = 0
            OnEnter = Edit1Enter
            OnExit = Edit1Exit
            OnKeyDown = Edit1KeyDown
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
          object edDataFinal: TAdvDateTimePicker
            Left = 136
            Top = 20
            Width = 121
            Height = 32
            Date = 43537.000000000000000000
            Format = ''
            Time = 0.668379629627452200
            DoubleBuffered = True
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -19
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            Kind = dkDate
            ParentDoubleBuffered = False
            ParentFont = False
            TabOrder = 1
            OnEnter = Edit1Enter
            OnExit = Edit1Exit
            OnKeyDown = Edit1KeyDown
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
        end
        object btPequisaInventarios: TAdvGlassButton
          Left = 1081
          Top = 84
          Width = 142
          Height = 64
          BackColor = 12615680
          ButtonDirection = bdLeft
          Caption = 'Exibir pesquisa'
          CornerRadius = 0
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ForeColor = clWhite
          GlowColor = 12615680
          ImageIndex = -1
          InnerBorderColor = clBlack
          OuterBorderColor = clWhite
          Picture.Data = {
            424D360C00000000000036000000280000002000000020000000010018000000
            000000000000EB0A0000EB0A00000000000000000000FFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9F9
            F9E9E9E9E7E7E7F4F4F4F9F9F9FEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE3E3
            E3A2A2A2989898BABABACACACAE1E1E1F9F9F9FFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0F0F08C8C
            89818181666666737373707070989898DEDEDEFDFDFDFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF2F2F2B2B7CE7F7D
            80B4B4B07F7F7F8484847878786F6F6FC3C3C3F7F7F7FFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF1F1F1B5BACD2553EE3170
            ECADA8A4E5E4E3929292868686777777B8B8B8F3F3F3FFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF1F1F1B2B7CC2553F02C75FF4198
            FF66B4E9EBE3DFEAE9E8808080707070A3A3A3ECECECFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF1F1F1AFB5CB2454F02C76FF4399FF5EC0
            FF64D0FF7EC6EFCBC3BDB5B5B38080809A9A9AE7E7E7FFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFEFEFEF0F0F0ACB1CA2453F02F78FF4499FF5FC1FF68CF
            FF64C9FF4BAAFF5589D3A29C91858585CECECEF5F5F5FFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFF9F9F9E4E4E4A8AEC82354F32F78FF469CFF60C3FF68CFFF63C8
            FF4FA9FF3C8DFF165AFE8590BCD0D0CFF7F7F7FFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFBFBFBDCDCDC9296AE204CE22F7BFF479DFF60C4FF68CFFF63C7FF4EA8
            FF3A8BFF1D5BFE8392CDE6E6E6FCFCFCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFDFDFDF4F4F4E9E9E9E1E1E1DEDEDEDEDEDEE2E2E2EAEAEA
            F5F5F5E7E7E79B99952E4CAE266AE1479DFD61C6FF68CFFF62C6FF4EA7FF3B8B
            FF1D5AFD8795CDE8E8E8FDFDFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFEFEFEF4F4F4DDDDDDBEBEBE9F9F9F8B8B8B8282828383838D8D8DA3A3A3
            C1C1C1B7B7B79B9B9994918B407DC15ABBF469D1FF62C6FF4DA6FF3989FF1D5A
            FC8B97CCE9E9E9FDFDFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC
            FCFCE9E9E9BEBEBE9191917B7C7C6B6D6E6061635E6062666666717171757575
            7272728383837F7F7FD2D0D0ADABA757A8CF59BDF54BA6FF3A88FF1D59FC8F9B
            CCEAEAEAFDFDFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCFCFCE4
            E4E4A7A7A77374746E7174949596B6AB9DC7B9A1CABAA4BCB3A79A9DA1606365
            606162646464959595B8B8B8FFFFFFA5A7A73E87D03079E91C52F1919CCAEBEB
            EBFDFDFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE9E9E9A1
            A1A16D6F729F9C96D3BA8FE0B87BDFBB80DEBC83DDB982DEB679DEB470E5C9A0
            B0AFAF46474A8C8C8CF2F2F2CDCDCDDCDAD9868A8D1744C98890B8E4E4E4FDFD
            FDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF5F5F5AEAEAE74
            777BB8AC94E0BC81DDBC85DCBD8ADBBC89DDBF8CDFC292E2C99EE3C99FDEBC85
            DEB374D8CCBF484B4E949495A2A2A2919191A9A8A4969797D4D4D4F7F7F7FFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFED0D0D077797CB5
            A991E0C086DBBD89DBBD89DABC89DABC89DABA86DABA84DAB780DDBE8DE4CBA6
            E2C79BDDB270D7CCBF45474A5F5F5F8A8A8AA7A7A7DADADAF7F7F7FFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7F7F798999A99948EE3
            C38DDBBF8FDAC090DAC090DAC090DABF8FDBBF8DDBBF8DDABC87DABA84DAB983
            E3CCA6E3C89BDFB575A7A8A8686868757575CCCCCCF9F9F9FFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDADADA7E8185CFB990DC
            C392DAC395DAC596DBC597DBC698DBC397DBC295DAC191DBBF8DDBBD8DDABA84
            DBBA85E5D0AADFBE89E5CBA65A5B5F6E6E6EB1B1B1F1F1F1FFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB6B6B68E8C89E3C897DB
            C699DCC79EDBC89DDBC89DDBC89DDCC79CDBC69ADBC597DBC295DAC090DBBE8C
            DABA84DFC296E3CAA3DFB6788F91977474749B9B9BE9E9E9FFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA5A5A6A79F8EE1C99DDE
            CAA1DECCA4DDCBA3DDCCA6DDCCA6DDCBA2DDCAA0DDC99EDBC699DBC396DAC090
            DBBE8CDBBD86E5CDABDFBA7FB1ACA2717171929292E5E5E5FFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA0A2A2B4A991E1CEA1DF
            D1ADDFD0ADE1D5B6E2D7B7E1D5B4DFD0AEDECEA7DDCBA2DDC99EDBC699DBC395
            DABF8FDABC86E3CBA3E0BE89C3B6A36D6D6E929292E5E5E5FFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA3A4A4B3A992E1CEA6E1
            D5B4E8DDC4E5DBBEE1D9BBE0D6B8E0D5B4DFD2ADDECEA7DDCBA3DDC99FDBC698
            DAC191DBBE8BE0C89DDFBF8AC1B3A16F6F709B9B9BE9E9E9FFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB4B4B4A79F90E3D3A9E5
            DCC2E9E2CEE6DEC3E4DEC5E4DAC0E0D8B9E0D4B4DFD3B0DDCDA7DDCAA1DCC79B
            DBC396DABF8FE0C79CE0C08AACA69A777777AFAFAFF0F0F0FFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCCCCCC908E8BE8DAB2E8
            E1C9ECE8D6ECE8D6F1F1E7F1EEE4E4DDC3E2D9BCE0D7B8DFD0ADDDCCA5DDC99E
            DBC597DAC091E1C99CE1BE85888A8E818181CBCBCBF9F9F9FFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEEEEEE929498D3C9A9E8
            E2C9ECEAD9F2F1EAF4F4EEF2F2ECE8E3CFE3DBC1E4DABEE0D2AFDDCCA6DDC99F
            DBC798DAC191E0C697D3BD98696B6F979797E4E4E4FFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC9C9CA959187EC
            E8CAE9E7D1F0EFE4F5F4EFF0F0E5E5E2CBE4DFC5E4DBC1DDD1ADDDCCA7DDC9A0
            DBC699DCC394E2C28D9895937E7E80C7C7C7F7F7F7FFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF2F2F2A6A6A9B3
            AE9BECECD6E8E8D4ECEBDCECEBDBEBE8D5E8E2CCE4D9BCE0D2B1DECEA7DDC99F
            DCC799E1C592B5AA986C6E71ADADADECECECFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE8E8E89C
            9DA0B4AF9DEBEBD2EAE8D4EAE8D3E8E3D0E4DCC2E0D5B3DED0ABDECDA5DEC99F
            E2CA97B5A995727478A6A6A6E6E6E6FDFDFDFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE7
            E7E8A5A6A7959489D6CDB1E5DEBCE3DAB7E1D7B3E2D3ADE3D1A9E3CFA4CEBD9A
            969390797A7DAEAEAEE9E9E9FCFCFCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFF0F0F0BCBCBD91929492918DAAA496B6AD9AB7AE98A9A2958F8D8A7F8083
            8E8E8ECCCCCCF4F4F4FEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFEFEFEE0E0E0BFBFC0AAAAAB9A9B9C9797989B9B9BACACACCCCCCC
            F2F2F2FDFDFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
          ParentFont = False
          ShineColor = clWhite
          TabOrder = 2
          Version = '1.3.3.1'
          OnClick = btPequisaInventariosClick
        end
        object Panel13: TPanel
          Left = 417
          Top = 29
          Width = 794
          Height = 46
          BevelOuter = bvNone
          Color = clWhite
          Enabled = False
          ParentBackground = False
          TabOrder = 3
          StyleElements = []
          object Label23: TLabel
            Left = 5
            Top = -2
            Width = 121
            Height = 14
            Caption = 'Descri'#231#227'o do produto:'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
            StyleElements = []
          end
          object ed_desc_item: TEdit
            Left = 2
            Top = 16
            Width = 791
            Height = 32
            Color = 12615680
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -19
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 0
          end
        end
        object Panel14: TPanel
          Left = 305
          Top = 23
          Width = 112
          Height = 57
          BevelOuter = bvNone
          Color = clWhite
          ParentBackground = False
          TabOrder = 5
          StyleElements = []
          object bt_pesq_item_estoque_cod: TSpeedButton
            Left = 74
            Top = 20
            Width = 28
            Height = 29
            Flat = True
            Glyph.Data = {
              DE010000424DDE01000000000000760000002800000024000000120000000100
              0400000000006801000000000000000000001000000010000000000000000000
              80000080000000808000800000008000800080800000C0C0C000808080000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00666666666666
              6666666666666666666666660000666666666666666666666666666666666666
              0000666666666666666666666666666666666666000060000066666000006668
              8888666668888866000060800066666080006668788866666878886600006080
              00666660800066687888666668788866000060000000F00000006668888888F8
              8888886600006080000000800000666878888888788888660000608000006080
              0000666878888868788888660000608000006080000066687888886878888866
              0000660000000000000666668888888888888666000066608000F08000666666
              687888F878886666000066600000600000666666688888688888666600006666
              00066600066666666688866688866666000066668F06668F06666666668F8666
              8F86666600006666000666000666666666888666888666660000666666666666
              6666666666666666666666660000666666666666666666666666666666666666
              0000}
            NumGlyphs = 2
            OnClick = botao_pesquisaClick
          end
          object Label24: TLabel
            Left = 2
            Top = 6
            Width = 39
            Height = 14
            Caption = 'C'#243'digo'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
            StyleElements = []
          end
          object ed_cod_item: TEdit
            Left = 2
            Top = 17
            Width = 68
            Height = 32
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -19
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 0
            OnChange = Edit1Change
            OnEnter = Edit1Enter
            OnExit = Edit1Exit
            OnKeyDown = Edit1KeyDown
          end
        end
        object cbHistoricosConsulta: TcxLookupComboBox
          Left = 8
          Top = 106
          ParentFont = False
          Properties.ImmediateDropDownWhenActivated = True
          Properties.KeyFieldNames = 'CODIGO'
          Properties.ListColumns = <
            item
              Caption = 'C'#243'digo'
              SortOrder = soAscending
              FieldName = 'CODIGO'
            end
            item
              Caption = 'Descri'#231#227'o do hist'#243'rico'
              FieldName = 'DESCRICAO'
            end>
          Properties.ListFieldIndex = 1
          Properties.ListOptions.ColumnSorting = False
          Properties.ListSource = dmProducaoSubprodutos.dsQryHistoricosProducao
          Properties.ReadOnly = False
          Style.Font.Charset = DEFAULT_CHARSET
          Style.Font.Color = clWindowText
          Style.Font.Height = -19
          Style.Font.Name = 'MS Sans Serif'
          Style.Font.Style = []
          Style.Shadow = False
          Style.ButtonStyle = btsOffice11
          Style.PopupBorderStyle = epbsFlat
          Style.IsFontAssigned = True
          TabOrder = 6
          OnEnter = Edit1Enter
          OnExit = Edit1Exit
          OnKeyDown = Edit1KeyDown
          Width = 498
        end
      end
      object Panel1: TPanel
        Left = 0
        Top = 0
        Width = 1225
        Height = 74
        Align = alTop
        Color = 12615680
        ParentBackground = False
        TabOrder = 5
        StyleElements = []
        ExplicitWidth = 1221
        DesignSize = (
          1221
          74)
        object Label1: TLabel
          Left = 7
          Top = 15
          Width = 287
          Height = 33
          Caption = 'Produ'#231#227'o de subprodutos'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -27
          Font.Name = 'Calibri'
          Font.Style = [fsBold]
          ParentFont = False
          StyleElements = []
        end
        object Label14: TLabel
          Left = 12
          Top = 52
          Width = 312
          Height = 15
          Anchors = [akLeft, akTop, akRight]
          Caption = 'Informe os par'#226'metros para consultar a produ'#231#227'o desejada'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -13
          Font.Name = 'Calibri'
          Font.Style = [fsBold]
          ParentFont = False
          StyleElements = []
          ExplicitWidth = 320
        end
      end
      object Panel3: TPanel
        Left = 0
        Top = 598
        Width = 1221
        Height = 62
        Align = alBottom
        BevelOuter = bvNone
        Color = clWhite
        ParentBackground = False
        TabOrder = 6
        StyleElements = []
        object AdvGlassButton4: TAdvGlassButton
          Left = 930
          Top = 14
          Width = 142
          Height = 42
          BackColor = 12615680
          ButtonDirection = bdLeft
          Caption = 'Nova produ'#231#227'o'
          CornerRadius = 0
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ForeColor = clWhite
          GlowColor = 12615680
          ImageIndex = -1
          InnerBorderColor = clBlack
          OuterBorderColor = clWhite
          Picture.Data = {
            424DF60600000000000036000000280000001800000018000000010018000000
            000000000000EB0A0000EB0A00000000000000000000FFFFFFFFFFFFF8F8F8E1
            E1E1D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9
            D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9E1E1E1F8F8F8FFFFFFFFFFFFFFFF
            FFFFFFFFE1E1E18D8D8D7070706E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E
            6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E7070708D8D8DE1E1E1
            FFFFFFFFFFFFFFFFFFFFFFFF8865549977669674639674639674639674639774
            6495746295756296736394746193726094715F92725E91705F926F5E93725F7F
            5F4E707070D9D9D9FFFFFFFFFFFFFFFFFFFFFFFF9A7A69FEF2E4F9EBDDF9EBDD
            F9EBDDF9EBDDF9EBDEF9EBDCF9ECDDF9EADBF9EADCF9EBDBF8EAD8F8E7D5F7E6
            D2F7E6CFFBE7CE906F5D6E6E6ED9D9D9FFFFFFFFFFFFFFFFFFFFFFFF9B7B6BFF
            FDF3FCF6EBFCF6EBFBF6EBFCF6EBFCF5EBFCF5ECFCF5EAFCF5EBFCF4E9FCF4E8
            FAF3E8FBF3E6F9F1E2FAEFE0FBEDD98E6D5B6E6E6ED9D9D9FFFFFFFFFFFFFFFF
            FFFFFFFF9B7C6BFFFDF4FBF6ECDEC4B7DEC4B7DEC4B6DDC2B4DDC2B4DDC1B2DD
            C0AFDDBEADDDBDAADDBBA8DDBBA5DEBDA7FBF2E3FCEEDC8F6E5C6E6E6ED9D9D9
            FFFFFFFFFFFFFFFFFFFFFFFF9C7D6CFFFEF6FCF7EEDBC0B6DBC0B6DBC0B6DBC0
            B3DBBFB2DBBEB0DABDADDABAAADAB9A7DAB7A4DAB6A1DDB9A3FAF3E6FBF1E190
            6F5E6E6E6ED9D9D9FFFFFFFFFFFFFFFFFFFFFFFF9F7E6DFFFFF8FCF8F1DBC3BA
            DBC3BADBC3B9DBC2B8DBC0B6DBBFB3DBBDAFDBBCADDABBA9DAB9A6DAB6A3DDBB
            A5FCF4E8FDF1E491705F6E6E6ED9D9D9FFFFFFFFFFFFFFFFFFFFFFFF9F7F70FF
            FFFAFCF9F3DBC5BFDBC5BFDBC5BEDBC3BBDBC2B8DBC0B5DBBEB2DBBDAFDBBBAB
            DBBAA8DAB8A5DDBBA7FBF5E9FCF3E49271606E6E6ED9D9D9FFFFFFFFFFFFFFFF
            FFFFFFFFA38070FFFFFCFDFAF5DBC8C2DBC8C3DBC7C1DBC5BDDBC3BADBC2B8DB
            BFB4DBBEB0DBBCAEDBBAA9DBB9A6DDBCA8FBF5EBFCF2E593715F6E6E6ED9D9D9
            FFFFFFFFFFFFFFFFFFFFFFFFA38171FFFFFEFDFBF7DBC8C5DBC8C5DBC7C3DBC6
            BFDBC4BDDBC2B9DBC0B5DBBFB2DBBDAEDBBAABDBB9A7DDBDA9FBF6ECFCF4E695
            72616E6E6ED9D9D9FFFFFFFFFFFFFFFFFFFFFFFFA48372FFFFFFFDFBF9DCC8C3
            DCC8C4DCC7C2DBC5BFDBC4BDDBC1B9DBC0B6DBBFB2DBBDAFDBBBABDBB9A7DEBD
            AAFBF6EDFCF3E79473606E6E6ED9D9D9FFFFFFFFFFFFFFFFFFFFFFFFA58473F8
            F9FFE9ECFBC4B6C9C4B9C9CFC1C6DAC3BFDCC4BCDBC2B9DBC1B5DBBEB3DBBDAF
            DBBBABDBB9A8DEBDAAFDF7EEFEF5E89673626E6E6ED9D9D9FFFFFFFFFFFFFFFF
            FFF8F8F9987D82C6D1FFB0BFFE98A0EAA3CAF0AAAFE7C2C2E3E2D8DDEDDFD9EC
            DED7ECDDD5ECDBD2ECDACFEBD9CDEDD9CCFCF7EFFDF4E99573616E6E6ED9D9D9
            FFFFFFFFFFFFFFFFFFD7DCF28B9EB18191FF4E74FF3F5EFF7ECCFF5E76FF98AC
            FEC6D1FDF3F4FBFEFCFAFDFBF8FDFAF6FDF9F4FCF8F2FCF8F1FCF8F0FDF6EB97
            74636F6F6FD9D9D9FFFFFFFFFFFFF1F3FCB2BCEC586DC67DD4FF3C86FF51A4FA
            63D8FD2B6AF63D5FF0888EDCB9ADCDDEC6BEDFC5BADFC3B6DFC0B2DFBFAEE0C1
            AFFDF8F0FDF6EB967463717171D9D9D9FFFFFFFFFFFFDCE1FA94A4E92C46DC43
            9CFF60EAFF54ECFF47DDFE60C0FB285DF5658AEBA5AED3D3BBBBDCC0B4DBBDB0
            DCBCACDCB9A9DFBEABFDFAF2FDF5EC987563858585E1E1E1FFFFFFFFFFFFCED6
            F97D92EA2555E56BCEFF2CDBFF00CAFF04D0FF57E8FF73DFFF5D95FFABB8FFE9
            ECFCFFFDFBFAF8F5F6F2EDF3ECE7ECE4DFE1D6D0CAB6AA906F5FBBBBBBF2F2F2
            FFFFFFFFFFFFCDD5FB7C8DED4180EB54D6FF28DDFF00CAFF02CFFF6EECFF3D8F
            FF4468FFA9BAFFE8ECFCFFFFFECAB5AA9C7A69AA8B78A8846AA27A5C896656B6
            AEAAECECECFEFEFEFFFFFFFFFFFFD8E2FEA4D0F6518CE94496FF74F5FF2DDFFF
            3EE3FF50C6FF2D6CFF5778FFB6C4FEF0F1FBFFFFFDD5C7BECCB5A3FCE9C5F1CD
            939C7862B6AEACECECECFEFEFEFFFFFFFFFFFFFFFFFFF0F2FFB6C1F94751C844
            82FF4CA1FF51CAFF63C2FF68C9FF5894FF8B9FFECBD5FDFCFAFAFFFEFDD9CAC3
            C4A384ECC88E99745EB7AFACECECECFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFD9E0FE756CA56981FF6CB3FF407AFF3B71FF4864FF98C9FEBBCDFDEDEEFBFE
            FCF9FFFFFCDACCC4BC946A9D7961B8B0AEEDEDEDFEFEFEFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFCFCFF96808DBAC5FFAADAFF8C9EFF90A5FFA9BAFFC5CE
            FFE8EFFFFFFFFFFFFFFFFFFFFFD1BEB48E6959BCB4B0EDEDEDFEFEFEFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9D7662A78987998C95917C91
            927D919B8288A7877FAB8979A98878A88777AA8B799F7F70D4CBC7F3F3F3FEFE
            FEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
          ParentFont = False
          ShineColor = clWhite
          TabOrder = 0
          Version = '1.3.3.1'
          OnClick = AdvGlassButton4Click
        end
        object AdvGlassButton3: TAdvGlassButton
          Left = 1078
          Top = 14
          Width = 142
          Height = 42
          BackColor = 12615680
          ButtonDirection = bdLeft
          Caption = 'Sair'
          CornerRadius = 0
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
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
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEF1F1F1E3E3E3E6E6E6F2F2F2FCFCFC
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF3F3F3C2C2C28E8E8E93
            9393B6B6B6D6D6D6EAEAEAF7F7F7FEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7F7F7E2E2E2DCDCDCDEDEDEC1B0
            B0885C5C876969756D6D6666667D7D7DA0A0A0C6C6C6E0E0E0F1F1F1FCFCFCFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9F9F9D2D2D28F8F8F
            797979808080987D7DC18E8E9663638A57578156567E6B6B6A66666D6D6D8C8C
            8CB3B3B3D7D7D7F2F2F2FEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE6
            E6E6797979747474737373717272756464C89595A06C6CA26F6FA06D6D905D5D
            804D4D826060766B6B666565858585C6C6C6F5F5F5FFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFB1B1B18383836E6D6E90898CB3ACB1A19093C99494A16D6DA2
            6F6FA37070A26F6FA37070986565855353684D4D6C6C6CA0A0A0EBEBEBFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA7A7A78F8F8F716A6F57D48062EF9073BE
            84CE9799A47171A47171A47171A37070A47171A37070A6727283575765666696
            9696E7E7E7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA4A4A4929292736970
            4DD3794BED815DBD74D49AA0A57272A77474A67373A67373A57272A47171A671
            71865A5A666767939393E6E6E6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA2
            A2A2969696746A7246CE7344E3795BB770DBA0A6A77373A97676A87575A67474
            A87474A67373A773738A5E5E666868909090E5E5E5FFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFA2A2A2999999776D743DCC6D3BDA7059B06BDEA6ABAB7777AC
            7878A37171A37272A77676A87575A975758F61616768688E8E8EE4E4E4FFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9F9F9F9C9C9C766C7330C4602CCF6153A9
            61E1A7ACAC7676A58D8D8B89899C7373A77575AC7979AB7777936464676A6A8C
            8C8CE4E4E4FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9E9E9EA0A0A0736B6D
            96F7F396FFF897C5BFDFA9AAB58A8AD2D8D8D4D8D8A68B8BAE7A7AAD7A7AAC79
            799969696A6C6C8A8A8AE2E2E2FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9E
            9E9EA1A1A16D6969C6FFFFC7FFFFBACACAE0AEAEB17D7DD3C7C7CCCBCBB08484
            B07D7DAF7C7CAE7B7B9C6B6B6B6E6E888888E1E1E1FFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFF9B9B9BA7A7A76A6969F6FFFFF3FFFFD4C9C9E0B2B2B27F7FB4
            7F7FB47E7EB38080B27F7FB17E7EB07D7DA06E6E6C6F6F858585E1E1E1FFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF999999A9A9A96B6B6BFFFFFFFFFFFCE0C7
            C6E1B4B4B78383B78484B68383B58282B48181B38080B27F7FA671716D717183
            8383E0E0E0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF999999ADADAD6F6E6F
            FFFFF6FFF9EFE0C5C0E3B6B7B88484B98686B98686B78484B68383B58282B481
            81A97373707272818181DFDFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF98
            9898AEAEAE747575FFF8E9FFF2E4E2C1BAE5BABAB98686BE8A8AB88383B88484
            B68282B58282B48181AE76767073737F7F7FDEDEDEFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFF989898AFAFB0787979FFF3DDFFEEDAE3BFB5E8BFC0BA8585F1
            CFCFF9DBDBECC7C7E0B3B3D4A3A3C39191AE79797174747D7D7DDEDEDEFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9B9B9BB3B3B37E7F7EFFECD1FFE7CEE4BD
            B0EAC0C2BC8686EDD3D3FFF0F0FFE9E9FFE3E3FFE0E0EABCBCAF79797473737B
            7B7BDDDDDDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9B9B9BB3B3B384817F
            FFE4C3FFE1C0E6BBABEBC3C4C18B8BE1C9C9FFF2F2FFF1F1FFEAEAFFE4E4E7B9
            B9B17B7B777575787878DCDCDCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9C
            9C9CB5B5B58B8682FFE3B6FFDFB3EABBA9EEC5C6C38E8EC18B8BBA8383BA8686
            C29090CA9B9BC69595B57F7F777676777777DCDCDCFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFF9E9E9EB6B6B786868685817B87837DB69592F6CDCDDBB0B0D9
            AEAED5A6A6CC9F9FC39292BD8989BB8787B881817B78787E7E7EDEDEDEFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA0A0A0C9C9C9ABACACA8A8A9A3A4A4A19F
            9FA39A9AA39696A29191A59191A79090AC9393AE9393AF9191A280807B7A7AAA
            AAAAEBEBEBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB7B7B7A3A3A39F9F9F
            9F9F9F9D9D9D999A9A9697979696969394949192928F90908E8F8F8689898688
            88898A8AA5A5A5EBEBEBFBFBFBFFFFFFFFFFFFFFFFFF}
          ParentFont = False
          ShineColor = clWhite
          TabOrder = 1
          Version = '1.3.3.1'
          OnClick = AdvGlassButton3Click
        end
      end
    end
    object pgCadastro: TJvStandardPage
      Left = 0
      Top = 0
      Width = 1221
      Height = 660
      Caption = 'pgCadastro'
      ExplicitWidth = 1225
      ExplicitHeight = 661
      object Panel4: TPanel
        Left = 0
        Top = 0
        Width = 1225
        Height = 74
        Align = alTop
        Color = 12615680
        ParentBackground = False
        TabOrder = 0
        StyleElements = []
        DesignSize = (
          1221
          74)
        object Label5: TLabel
          Left = 10
          Top = 15
          Width = 287
          Height = 33
          Caption = 'Produ'#231#227'o de subprodutos'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -27
          Font.Name = 'Calibri'
          Font.Style = [fsBold]
          ParentFont = False
          StyleElements = []
        end
        object Label6: TLabel
          Left = 12
          Top = 52
          Width = 291
          Height = 15
          Anchors = [akLeft, akTop, akRight]
          Caption = 'Informe os dados dos subprodutos que deseja produzir'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -13
          Font.Name = 'Calibri'
          Font.Style = [fsBold]
          ParentFont = False
          StyleElements = []
          ExplicitWidth = 299
        end
      end
      object Panel6: TPanel
        Left = 0
        Top = 584
        Width = 1221
        Height = 76
        Align = alBottom
        BevelOuter = bvNone
        Color = clWhite
        ParentBackground = False
        TabOrder = 1
        StyleElements = []
        ExplicitTop = 585
        ExplicitWidth = 1225
        object AdvGlassButton2: TAdvGlassButton
          Left = 935
          Top = 3
          Width = 142
          Height = 66
          BackColor = 12615680
          ButtonDirection = bdLeft
          Caption = 'Salvar'
          CornerRadius = 0
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ForeColor = clWhite
          GlowColor = 12615680
          ImageIndex = -1
          InnerBorderColor = clBlack
          OuterBorderColor = clWhite
          Picture.Data = {
            424DF60600000000000036000000280000001800000018000000010018000000
            000000000000EB0A0000EB0A00000000000000000000FFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FEFEFEF4F4F4E4E4E4E1E1E1EDEDEDFCFCFCFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFEFEFEECECECC0C0C0909090868686AAAAAADFDFDFFAFAFAFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFEFEFEECECEC9BB49B2F8D2F1B891D558155686868A0
            A0A0DEDEDEFAFAFAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEECECEC97B7970D931115B12C15B2
            2A0B9B154E874E656565A0A0A0DEDEDEFBFBFBFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEECECEC98B9980F9613
            17B22F13AD2B12AB2613AF270A9A144F874F656565A0A0A0DEDEDEFBFBFBFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEECECEC99
            BA990F9A141AB63616B03015AE2C14AD2914AD2714B02A0A9A144F864F656565
            A1A1A1DEDEDEFBFBFBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFE
            FEEDEDED9BBC9B109D151BB63B1AB43518B13116AF2F13AE2A13AD2913AD2814
            B0280A9A14518651666666A2A2A2DFDFDFFBFBFBFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFF4F4F49EC09E10A11521BA421CB53A1AB33619B23417B1323DBE
            5227B43C0EAC2613AC2815B12B0A9A14518551666666A3A3A3DFDFDFFBFBFBFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFB5D9B816A82022BB451FB8401DB63B1DB639
            1BB53A17B0310E9F1776D18641BF560EAC2514AE2914B0290A99145285526767
            67A3A3A3E0E0E0FBFBFBFFFFFFFFFFFFFFFFFFFFFFFF2CAF3945C8661FBA431F
            B8411EB73E1FB8401BB4372E9B2E9CC09C139A1372D1843FBF530EAC2614AD29
            17B22C0A9914538553676767A3A3A3E0E0E0FBFBFBFFFFFFFFFFFFFFFFFF20B1
            3277D99217B83D1FBA4321BB441CB6392E9E2EC1CAC1F5F5F5C8EBC8109A1075
            D3863DBF530EAC2614AD2A15B12D0A9914548454686868A4A4A4E1E1E1FCFCFC
            FFFFFFFFFFFF85CE8F47C2626FD58B38C45B27BB472CA32EBFCABFF4F4F4FFFF
            FFFFFFFFC5EAC50F9A0F74D2853ABD5010AE2714AD2B16B22D0A991454835468
            6868A5A5A5E1E1E1FCFCFCFFFFFFFEFFFE76D4842ABB4142C05834AE3CCCDACC
            F6F6F6FFFFFFFFFFFFFFFFFFFFFFFFC4EBC40D9A0D77D3893ABD5010AE2815AF
            2B17B32E0A9914558355686868A6A6A6E3E3E3FCFCFCFFFFFFFFFFFFE2F9E4BD
            EAC1EFF6F0FCFCFCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBFE8BF0D9C0D
            77D38938BC4E10AE2915AE2C18B4300A99135683566A6A6AAFAFAFEEEEEEFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFBEE8BE0C9C0D7AD58C35BB4C11AF2A15AE2D17B22F0A99135A7D5A
            878787E1E1E1FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBAE7BA0A9C0C77D58B35BB4C11AF2B16
            B02D18B5331A8B1C8D8D8DE4E4E4FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB8E6B80A9C
            0E7AD58D34BA4C11AF2B19B5352A8D2AB8B8B8F2F2F2FFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFB4E6B4089D0E74D58954CA6C089C138CB28CE8E8E8FDFDFDFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB5E2B522A122259D259ACB9AF1F1F1
            FDFDFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
          ParentFont = False
          ShineColor = clWhite
          TabOrder = 0
          Version = '1.3.3.1'
          OnClick = AdvGlassButton2Click
        end
        object AdvGlassButton5: TAdvGlassButton
          Left = 1081
          Top = 3
          Width = 142
          Height = 66
          BackColor = 12615680
          ButtonDirection = bdLeft
          Caption = 'Voltar'
          CornerRadius = 0
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
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
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEF1F1F1E3E3E3E6E6E6F2F2F2FCFCFC
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF3F3F3C2C2C28E8E8E93
            9393B6B6B6D6D6D6EAEAEAF7F7F7FEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7F7F7E2E2E2DCDCDCDEDEDEC1B0
            B0885C5C876969756D6D6666667D7D7DA0A0A0C6C6C6E0E0E0F1F1F1FCFCFCFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9F9F9D2D2D28F8F8F
            797979808080987D7DC18E8E9663638A57578156567E6B6B6A66666D6D6D8C8C
            8CB3B3B3D7D7D7F2F2F2FEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE6
            E6E6797979747474737373717272756464C89595A06C6CA26F6FA06D6D905D5D
            804D4D826060766B6B666565858585C6C6C6F5F5F5FFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFB1B1B18383836E6D6E90898CB3ACB1A19093C99494A16D6DA2
            6F6FA37070A26F6FA37070986565855353684D4D6C6C6CA0A0A0EBEBEBFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA7A7A78F8F8F716A6F57D48062EF9073BE
            84CE9799A47171A47171A47171A37070A47171A37070A6727283575765666696
            9696E7E7E7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA4A4A4929292736970
            4DD3794BED815DBD74D49AA0A57272A77474A67373A67373A57272A47171A671
            71865A5A666767939393E6E6E6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA2
            A2A2969696746A7246CE7344E3795BB770DBA0A6A77373A97676A87575A67474
            A87474A67373A773738A5E5E666868909090E5E5E5FFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFA2A2A2999999776D743DCC6D3BDA7059B06BDEA6ABAB7777AC
            7878A37171A37272A77676A87575A975758F61616768688E8E8EE4E4E4FFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9F9F9F9C9C9C766C7330C4602CCF6153A9
            61E1A7ACAC7676A58D8D8B89899C7373A77575AC7979AB7777936464676A6A8C
            8C8CE4E4E4FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9E9E9EA0A0A0736B6D
            96F7F396FFF897C5BFDFA9AAB58A8AD2D8D8D4D8D8A68B8BAE7A7AAD7A7AAC79
            799969696A6C6C8A8A8AE2E2E2FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9E
            9E9EA1A1A16D6969C6FFFFC7FFFFBACACAE0AEAEB17D7DD3C7C7CCCBCBB08484
            B07D7DAF7C7CAE7B7B9C6B6B6B6E6E888888E1E1E1FFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFF9B9B9BA7A7A76A6969F6FFFFF3FFFFD4C9C9E0B2B2B27F7FB4
            7F7FB47E7EB38080B27F7FB17E7EB07D7DA06E6E6C6F6F858585E1E1E1FFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF999999A9A9A96B6B6BFFFFFFFFFFFCE0C7
            C6E1B4B4B78383B78484B68383B58282B48181B38080B27F7FA671716D717183
            8383E0E0E0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF999999ADADAD6F6E6F
            FFFFF6FFF9EFE0C5C0E3B6B7B88484B98686B98686B78484B68383B58282B481
            81A97373707272818181DFDFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF98
            9898AEAEAE747575FFF8E9FFF2E4E2C1BAE5BABAB98686BE8A8AB88383B88484
            B68282B58282B48181AE76767073737F7F7FDEDEDEFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFF989898AFAFB0787979FFF3DDFFEEDAE3BFB5E8BFC0BA8585F1
            CFCFF9DBDBECC7C7E0B3B3D4A3A3C39191AE79797174747D7D7DDEDEDEFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9B9B9BB3B3B37E7F7EFFECD1FFE7CEE4BD
            B0EAC0C2BC8686EDD3D3FFF0F0FFE9E9FFE3E3FFE0E0EABCBCAF79797473737B
            7B7BDDDDDDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9B9B9BB3B3B384817F
            FFE4C3FFE1C0E6BBABEBC3C4C18B8BE1C9C9FFF2F2FFF1F1FFEAEAFFE4E4E7B9
            B9B17B7B777575787878DCDCDCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9C
            9C9CB5B5B58B8682FFE3B6FFDFB3EABBA9EEC5C6C38E8EC18B8BBA8383BA8686
            C29090CA9B9BC69595B57F7F777676777777DCDCDCFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFF9E9E9EB6B6B786868685817B87837DB69592F6CDCDDBB0B0D9
            AEAED5A6A6CC9F9FC39292BD8989BB8787B881817B78787E7E7EDEDEDEFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA0A0A0C9C9C9ABACACA8A8A9A3A4A4A19F
            9FA39A9AA39696A29191A59191A79090AC9393AE9393AF9191A280807B7A7AAA
            AAAAEBEBEBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB7B7B7A3A3A39F9F9F
            9F9F9F9D9D9D999A9A9697979696969394949192928F90908E8F8F8689898688
            88898A8AA5A5A5EBEBEBFBFBFBFFFFFFFFFFFFFFFFFF}
          ParentFont = False
          ShineColor = clWhite
          TabOrder = 1
          Version = '1.3.3.1'
          OnClick = AdvGlassButton5Click
        end
      end
      object pnCabecalhoProducao: TPanel
        Left = 0
        Top = 74
        Width = 1221
        Height = 83
        Align = alTop
        BevelOuter = bvNone
        Color = clWhite
        ParentBackground = False
        TabOrder = 2
        StyleElements = []
        ExplicitWidth = 1225
        object Label11: TLabel
          Left = 166
          Top = 6
          Width = 120
          Height = 14
          Caption = 'Hist'#243'rico da produ'#231#227'o'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          StyleElements = []
        end
        object Label12: TLabel
          Left = 680
          Top = 6
          Width = 144
          Height = 14
          Caption = 'Observa'#231#245'es da produ'#231#227'o'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          StyleElements = []
        end
        object Label13: TLabel
          Left = 9
          Top = 6
          Width = 26
          Height = 14
          Caption = 'Data:'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          StyleElements = []
        end
        object edDataProducao: TAdvDateTimePicker
          Left = 9
          Top = 21
          Width = 152
          Height = 32
          Date = 43537.000000000000000000
          Format = ''
          Time = 0.668379629627452200
          DoubleBuffered = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -19
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          Kind = dkDate
          ParentDoubleBuffered = False
          ParentFont = False
          TabOrder = 0
          OnEnter = Edit1Enter
          OnExit = Edit1Exit
          OnKeyDown = Edit1KeyDown
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
        object cbHistoricoProducao: TcxLookupComboBox
          Left = 167
          Top = 22
          ParentFont = False
          Properties.ImmediateDropDownWhenActivated = True
          Properties.KeyFieldNames = 'CODIGO'
          Properties.ListColumns = <
            item
              Caption = 'C'#243'digo'
              SortOrder = soAscending
              FieldName = 'CODIGO'
            end
            item
              Caption = 'Descri'#231#227'o do hist'#243'rico'
              FieldName = 'DESCRICAO'
            end>
          Properties.ListFieldIndex = 1
          Properties.ListOptions.ColumnSorting = False
          Properties.ListSource = dmProducaoSubprodutos.dsQryHistoricosProducao
          Properties.ReadOnly = False
          Style.Font.Charset = DEFAULT_CHARSET
          Style.Font.Color = clWindowText
          Style.Font.Height = -19
          Style.Font.Name = 'MS Sans Serif'
          Style.Font.Style = []
          Style.Shadow = False
          Style.ButtonStyle = btsOffice11
          Style.PopupBorderStyle = epbsFlat
          Style.IsFontAssigned = True
          TabOrder = 1
          OnEnter = Edit1Enter
          OnExit = Edit1Exit
          OnKeyDown = Edit1KeyDown
          Width = 498
        end
        object memoObservacoes: TMemo
          Left = 680
          Top = 21
          Width = 525
          Height = 55
          TabOrder = 2
        end
      end
      object Panel5: TPanel
        Left = 0
        Top = 157
        Width = 1221
        Height = 68
        Align = alTop
        BevelOuter = bvNone
        Color = clWhite
        ParentBackground = False
        TabOrder = 3
        StyleElements = []
        ExplicitWidth = 1225
        object btPesqSubmateria: TSpeedButton
          Left = 81
          Top = 30
          Width = 32
          Height = 28
          Flat = True
          Glyph.Data = {
            DE010000424DDE01000000000000760000002800000024000000120000000100
            0400000000006801000000000000000000001000000010000000000000000000
            80000080000000808000800000008000800080800000C0C0C000808080000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00666666666666
            6666666666666666666666660000666666666666666666666666666666666666
            0000666666666666666666666666666666666666000060000066666000006668
            8888666668888866000060800066666080006668788866666878886600006080
            00666660800066687888666668788866000060000000F00000006668888888F8
            8888886600006080000000800000666878888888788888660000608000006080
            0000666878888868788888660000608000006080000066687888886878888866
            0000660000000000000666668888888888888666000066608000F08000666666
            687888F878886666000066600000600000666666688888688888666600006666
            00066600066666666688866688866666000066668F06668F06666666668F8666
            8F86666600006666000666000666666666888666888666660000666666666666
            6666666666666666666666660000666666666666666666666666666666666666
            0000}
          NumGlyphs = 2
          OnClick = botao_pesquisaClick
        end
        object Label22: TLabel
          Left = 6
          Top = 16
          Width = 51
          Height = 16
          Caption = 'C'#243'digo'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          StyleElements = []
        end
        object Label9: TLabel
          Left = 940
          Top = 13
          Width = 112
          Height = 16
          Caption = 'Qtde. produ'#231#227'o:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          StyleElements = []
        end
        object edCodSubmateria: TEdit
          Left = 4
          Top = 32
          Width = 72
          Height = 28
          CharCase = ecUpperCase
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          MaxLength = 3
          ParentFont = False
          TabOrder = 0
          OnEnter = Edit1Enter
          OnExit = Edit1Exit
          OnKeyDown = Edit1KeyDown
        end
        object pnProdutosProducao: TPanel
          Tag = 99
          Left = 121
          Top = 18
          Width = 817
          Height = 47
          BevelOuter = bvNone
          Color = clWhite
          Enabled = False
          ParentBackground = False
          TabOrder = 1
          StyleElements = []
          object Label21: TLabel
            Left = 7
            Top = -2
            Width = 176
            Height = 16
            Caption = 'Descri'#231#227'o do subproduto'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            StyleElements = []
          end
          object Label7: TLabel
            Left = 565
            Top = -2
            Width = 96
            Height = 16
            Caption = 'Estoque atual'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            StyleElements = []
          end
          object Label8: TLabel
            Left = 690
            Top = -2
            Width = 121
            Height = 16
            Caption = 'Rendimento ficha'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            StyleElements = []
          end
          object edDescricaoSubmateria: TEdit
            Left = 3
            Top = 14
            Width = 560
            Height = 28
            CharCase = ecUpperCase
            Color = 12615680
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -16
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            MaxLength = 3
            ParentFont = False
            TabOrder = 0
          end
          object edEstoqueSubproduto: TEdit
            Left = 565
            Top = 13
            Width = 122
            Height = 28
            Alignment = taRightJustify
            CharCase = ecUpperCase
            Color = 12615680
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -16
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            MaxLength = 3
            ParentFont = False
            TabOrder = 1
          end
          object edRendimentoSubproduto: TEdit
            Left = 690
            Top = 12
            Width = 122
            Height = 28
            Alignment = taRightJustify
            CharCase = ecUpperCase
            Color = 12615680
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -16
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            MaxLength = 3
            ParentFont = False
            TabOrder = 2
          end
        end
        object edQuantidade: TCurrencyEdit
          Left = 941
          Top = 29
          Width = 114
          Height = 28
          AutoSize = False
          DecimalPlaces = 3
          DisplayFormat = ',0.000;'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 2
          OnEnter = Edit1Enter
          OnExit = Edit1Exit
          OnKeyDown = Edit1KeyDown
        end
        object AdvGlassButton1: TAdvGlassButton
          Left = 1063
          Top = 13
          Width = 142
          Height = 42
          BackColor = 12615680
          ButtonDirection = bdLeft
          Caption = 'Adicionar produto'
          CornerRadius = 0
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
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
            FFFFFFFFFFFFFFFFFFFFFFF8F8F8E1E1E1D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9
            D9D9D9E1E1E1F8F8F8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE1E1E18D8D8D7070706E6E6E6E
            6E6E6E6E6E6E6E6E7070708D8D8DE1E1E1FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0A8F12098F
            13078B10088B0F068A0E07890D07880E058509707070D9D9D9FFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFF1997234DD97C36CA6638CA6637C76336C76334C4600C8E176E6E6ED9D9
            D9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFF1A98245FE48A3CD26C3BD16A3CD06A3ACF6937C964
            0D8F186E6E6ED9D9D9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF1B992567E88F3FD5703ED56E3D
            D26C3BD16B38CB660D8F186E6E6ED9D9D9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF1D9C266CEB
            9340D7703FD56F3ED46E3ED36D3ACB670E921A6E6E6ED8D8D8FFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFF8F8F8E1E1E1D9D9D9D9D9D9D9D9D9D9D9D9
            D8D8D81E9C2874ED9844D97541D77140D6703ED56F3BCE690F931B666666B9B9
            B9D8D8D8D9D9D9D9D9D9D9D9D9D9D9D9E1E1E1F8F8F8E1E1E18D8D8D7070706E
            6E6E6E6E6E6E6E6E6E6E6E199C2470EC9748DC7742D97341D87241D6703CCE6A
            0F931A4F4F4F6666666E6E6E6E6E6E6E6E6E6E6E6E7070708D8D8DE1E1E10D97
            171BA42A129C21129C21139B21119A2012981F1BA52E4CE37F47DD7744DB7543
            D97341D7713DD06B0F8D190A871109871109861009841008831008810F037B06
            707070D9D9D9129C1D8FFAAD52E2814CE07B4BDF7B4ADF7A49DE7849DE7949DF
            7B47DE7846DD7745DB7543DB7541D6703ED26C3ED06C3CD06B3BCD6939CD6838
            CC6734C460057E096E6E6ED9D9D9119D1C95FAAF69ED915AE98759E88757E785
            56E68454E38252E47F4DE17E48DE7946DD7745DB7543DB7541D97341D7713ED4
            6E3DD46E3DD06A3ACF6935C460057F096E6E6ED9D9D9119F1E96FAB06FEF9560
            EB8B5FEA8C5EE98959E88756E78556E58252E38050E27D49DF7946DD7745DB75
            43D97341D87240D6703ED46E3DD26C3AD06A36C5610480096E6E6ED9D9D9139F
            1E99FBB275F19965ED9064ED8E61EC8C5FEA8B5CE98957E78655E58352E38050
            E37D48DE7946DD7744DB7542D97341D7713FD56F3ED46E3BD16B36C66205810A
            6E6E6ED9D9D912A01F9BFCB482F4A176F29B75F19972F0976FEF956DEE9464EB
            8D57E78655E58352E3804DE17E47DE7849DD794BDC7946DA7541D87240D66F3C
            D26C35C76205820B707070D9D9D915A321A8FFBF9BFCB39AFCB399FCB398FBB2
            97FAB196F9AF8AF4A563EB8D57E78656E58252E28048DF7954E5857AF09E78EE
            9B73EC976CE89365E78D4FDA7C06850E8D8D8DE1E1E10EA01B22AB2F20AA2D1F
            A82C20A72C1FA62B1DA4292DAD3895F9AE6CED935CE98956E88553E38047DD78
            159E261799221A992419972218962217942116942106850DE1E1E1F8F8F8FFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF1CA42798FAB16DEF945FEA8B59
            E88755E58346DA750D92176E6E6ED8D8D8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF1EA52A99FC
            B271F09761EC8C5EE98956E78446DB770E94196E6E6ED9D9D9FFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFF1FA62A9AFBB474F19964ED8E60EA8C58E78647DB760E95196E6E6ED9D9
            D9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFF1FA82B9AFCB375F29A65ED9060EB8B58E88648DC77
            0F961A6E6E6ED9D9D9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF1FA92D9BFCB482F4A277F19A71
            EF966BED924DDE7A0F971B707070D9D9D9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF22AB2FA8FF
            BF9BFDB39AFAB397FAB196FAB08CF8AB149D228D8D8DE1E1E1FFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFF10A11D15A32313A121149F21139E1F139D1F149D1F0D9819E1E1E1F8F8
            F8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
          ParentFont = False
          ShineColor = clWhite
          TabOrder = 3
          Version = '1.3.3.1'
          OnClick = AdvGlassButton1Click
        end
      end
      object pnItensProducao: TPanel
        Left = 0
        Top = 225
        Width = 1221
        Height = 359
        Align = alClient
        BevelOuter = bvNone
        Caption = 'Panel1'
        Color = clWhite
        ParentBackground = False
        TabOrder = 4
        StyleElements = []
        ExplicitWidth = 1225
        ExplicitHeight = 360
        object Label10: TLabel
          Left = 10
          Top = -15
          Width = 111
          Height = 14
          Caption = 'Selecione o produto'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          StyleElements = []
        end
        object cxGrid2: TcxGrid
          Left = 0
          Top = 0
          Width = 1225
          Height = 360
          Align = alClient
          TabOrder = 0
          object cxGridDBTableView1: TcxGridDBTableView
            PopupMenu = popCadastro
            Navigator.Buttons.CustomButtons = <>
            ScrollbarAnnotations.CustomAnnotations = <>
            OnCellDblClick = cxGridDBTableView1CellDblClick
            OnEditKeyDown = cxGridDBTableView1EditKeyDown
            DataController.DataSource = dmProducaoSubprodutos.dsTbProdutosProducaoTemp
            DataController.Summary.DefaultGroupSummaryItems = <
              item
                Kind = skSum
                Position = spFooter
              end
              item
                Format = 'R$ ###,###,##0.00 '
                Kind = skSum
              end
              item
                Kind = skSum
                Position = spFooter
              end
              item
                Kind = skSum
                Position = spFooter
              end
              item
                Kind = skSum
                Position = spFooter
              end
              item
                Kind = skSum
                Position = spFooter
              end
              item
                Kind = skSum
                Position = spFooter
              end
              item
                Kind = skSum
                Position = spFooter
              end
              item
                Format = 'R$ ###,###,##0.00 '
                Kind = skSum
              end
              item
                Format = 'R$ ###,###,##0.00 '
                Kind = skSum
              end
              item
                Format = 'R$ ###,###,##0.00 '
                Kind = skSum
              end
              item
                Format = 'R$ ###,###,##0.00 '
                Kind = skSum
              end
              item
                Format = 'R$ ###,###,##0.00 '
                Kind = skSum
              end
              item
                Format = 'R$ ###,###,##0.00 '
                Kind = skSum
              end>
            DataController.Summary.FooterSummaryItems = <
              item
                Format = 'R$ ,0.00;-R$ ,0.00'
                Kind = skSum
              end
              item
                Kind = skCount
              end
              item
                Format = 'R$ ###,###,##0.00 '
                Kind = skSum
              end
              item
                Format = 'R$ ###,###,##0.00 '
                Kind = skSum
              end
              item
                Format = 'R$ ###,###,##0.00 '
                Kind = skSum
              end
              item
                Format = 'R$ ###,###,##0.00 '
                Kind = skSum
              end
              item
                Format = 'R$ ###,###,##0.00 '
                Kind = skSum
              end
              item
                Format = 'R$ ###,###,##0.00 '
                Kind = skSum
              end
              item
                Format = 'R$ ###,###,##0.00 '
                Kind = skSum
              end
              item
                Format = 'R$ ,0.00;-R$ ,0.00'
                Kind = skSum
                Column = cxGridDBTableView1custoTotal
              end
              item
                Format = '# Subprodutos'
                Kind = skCount
                Column = cxGridDBTableView1Descricao
              end>
            DataController.Summary.SummaryGroups = <>
            OptionsData.CancelOnExit = False
            OptionsData.Deleting = False
            OptionsData.DeletingConfirmation = False
            OptionsData.Inserting = False
            OptionsView.CellEndEllipsis = True
            OptionsView.Footer = True
            OptionsView.GroupByBox = False
            Styles.Content = stlRegistro
            Styles.ContentOdd = cxStyle2
            Styles.Header = HeaderStl
            object cxGridDBTableView1codProduto: TcxGridDBColumn
              Caption = 'C'#243'digo'
              DataBinding.FieldName = 'codProduto'
              Options.Editing = False
              Width = 80
            end
            object cxGridDBTableView1Descricao: TcxGridDBColumn
              Caption = 'Descri'#231#227'o'
              DataBinding.FieldName = 'Descricao'
              Options.Editing = False
              Width = 465
            end
            object cxGridDBTableView1qtdeProduzida: TcxGridDBColumn
              Caption = 'Qtde produ'#231#227'o'
              DataBinding.FieldName = 'qtdeProduzida'
              Options.EditAutoHeight = ieahNone
              Width = 118
            end
            object cxGridDBTableView1Unidade: TcxGridDBColumn
              DataBinding.FieldName = 'Unidade'
              Options.Editing = False
              Width = 203
            end
            object cxGridDBTableView1percentualReceita: TcxGridDBColumn
              Caption = '% da receita'
              DataBinding.FieldName = 'percentualReceita'
              Options.Editing = False
              Width = 106
            end
            object cxGridDBTableView1custoUnitario: TcxGridDBColumn
              Caption = 'Custo unit'#225'rio'
              DataBinding.FieldName = 'custoUnitario'
              PropertiesClassName = 'TcxCurrencyEditProperties'
              Options.Editing = False
              Width = 113
            end
            object cxGridDBTableView1custoTotal: TcxGridDBColumn
              Caption = 'Custo da produ'#231#227'o'
              DataBinding.FieldName = 'custoTotal'
              PropertiesClassName = 'TcxCurrencyEditProperties'
              Options.Editing = False
              Styles.Footer = HeaderStl
              Width = 141
            end
          end
          object cxGridLevel1: TcxGridLevel
            GridView = cxGridDBTableView1
          end
        end
      end
    end
    object pgFichaProducao: TJvStandardPage
      Left = 0
      Top = 0
      Width = 1221
      Height = 660
      Caption = 'pgFichaProducao'
      ExplicitWidth = 1225
      ExplicitHeight = 661
      object Panel7: TPanel
        Left = 0
        Top = 0
        Width = 1225
        Height = 74
        Align = alTop
        Color = 12615680
        ParentBackground = False
        TabOrder = 0
        StyleElements = []
        object Label15: TLabel
          Left = 10
          Top = 15
          Width = 518
          Height = 33
          Caption = 'Produ'#231#227'o de subprodutos  (Ficha de produ'#231#227'o)'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -27
          Font.Name = 'Calibri'
          Font.Style = [fsBold]
          ParentFont = False
          StyleElements = []
        end
      end
      object Panel8: TPanel
        Left = 0
        Top = 74
        Width = 1225
        Height = 83
        Align = alTop
        BevelOuter = bvNone
        Color = clWhite
        ParentBackground = False
        TabOrder = 1
        StyleElements = []
        object Panel10: TPanel
          Tag = 99
          Left = 11
          Top = 4
          Width = 1207
          Height = 67
          BevelOuter = bvNone
          Color = clWhite
          Enabled = False
          ParentBackground = False
          TabOrder = 0
          StyleElements = []
          object Label20: TLabel
            Left = 6
            Top = 12
            Width = 173
            Height = 20
            Caption = 'Nome do subproduto:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = 12615680
            Font.Height = -16
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            StyleElements = []
          end
          object Label17: TLabel
            Left = 656
            Top = 13
            Width = 94
            Height = 20
            Caption = 'Quantidade'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = 12615680
            Font.Height = -16
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            StyleElements = []
          end
          object Label18: TLabel
            Left = 1074
            Top = 11
            Width = 120
            Height = 20
            Caption = '% da ficha t'#233'c.'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = 12615680
            Font.Height = -16
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            StyleElements = []
          end
          object Label19: TLabel
            Left = 799
            Top = 12
            Width = 68
            Height = 20
            Caption = 'Unidade'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = 12615680
            Font.Height = -16
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            StyleElements = []
          end
          object edDescricaoProdutoFichaProducao: TEdit
            Left = 3
            Top = 31
            Width = 639
            Height = 32
            CharCase = ecUpperCase
            Color = 12615680
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -19
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            MaxLength = 3
            ParentFont = False
            TabOrder = 0
          end
          object edQuantidadeFichaProducao: TEdit
            Left = 656
            Top = 31
            Width = 122
            Height = 32
            Alignment = taRightJustify
            CharCase = ecUpperCase
            Color = 12615680
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -19
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            MaxLength = 3
            ParentFont = False
            TabOrder = 1
          end
          object edPercentualFichaProducao: TEdit
            Left = 1075
            Top = 31
            Width = 130
            Height = 32
            Alignment = taRightJustify
            CharCase = ecUpperCase
            Color = 12615680
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -19
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            MaxLength = 3
            ParentFont = False
            TabOrder = 2
          end
          object edUnidadeFichaProducao: TEdit
            Left = 799
            Top = 31
            Width = 263
            Height = 32
            Alignment = taRightJustify
            CharCase = ecUpperCase
            Color = 12615680
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -19
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            MaxLength = 3
            ParentFont = False
            TabOrder = 3
          end
        end
      end
      object Panel9: TPanel
        Left = 0
        Top = 157
        Width = 1225
        Height = 432
        Align = alClient
        BevelOuter = bvNone
        Caption = 'Panel1'
        Color = clWhite
        ParentBackground = False
        TabOrder = 2
        StyleElements = []
        object Label16: TLabel
          Left = 10
          Top = -15
          Width = 111
          Height = 14
          Caption = 'Selecione o produto'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          StyleElements = []
        end
        object cxGrid3: TcxGrid
          Left = 0
          Top = 17
          Width = 1225
          Height = 415
          Align = alClient
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = #39
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          object cxGridDBTableView2: TcxGridDBTableView
            Navigator.Buttons.CustomButtons = <>
            ScrollbarAnnotations.CustomAnnotations = <>
            DataController.DataSource = dmProducaoSubprodutos.dsFichaProducao
            DataController.Summary.DefaultGroupSummaryItems = <
              item
                Kind = skSum
                Position = spFooter
              end
              item
                Format = 'R$ ###,###,##0.00 '
                Kind = skSum
              end
              item
                Kind = skSum
                Position = spFooter
              end
              item
                Kind = skSum
                Position = spFooter
              end
              item
                Kind = skSum
                Position = spFooter
              end
              item
                Kind = skSum
                Position = spFooter
              end
              item
                Kind = skSum
                Position = spFooter
              end
              item
                Kind = skSum
                Position = spFooter
              end
              item
                Format = 'R$ ###,###,##0.00 '
                Kind = skSum
              end
              item
                Format = 'R$ ###,###,##0.00 '
                Kind = skSum
              end
              item
                Format = 'R$ ###,###,##0.00 '
                Kind = skSum
              end
              item
                Format = 'R$ ###,###,##0.00 '
                Kind = skSum
              end
              item
                Format = 'R$ ###,###,##0.00 '
                Kind = skSum
              end
              item
                Format = 'R$ ###,###,##0.00 '
                Kind = skSum
              end
              item
                Kind = skSum
                Position = spFooter
                Column = cxGridDBTableView2CUSTORECEITA
              end>
            DataController.Summary.FooterSummaryItems = <
              item
                Format = 'R$ ,0.00;-R$ ,0.00'
                Kind = skSum
              end
              item
                Kind = skCount
              end
              item
                Format = 'R$ ###,###,##0.00 '
                Kind = skSum
              end
              item
                Format = 'R$ ###,###,##0.00 '
                Kind = skSum
              end
              item
                Format = 'R$ ###,###,##0.00 '
                Kind = skSum
              end
              item
                Format = 'R$ ###,###,##0.00 '
                Kind = skSum
              end
              item
                Format = 'R$ ###,###,##0.00 '
                Kind = skSum
              end
              item
                Format = 'R$ ###,###,##0.00 '
                Kind = skSum
              end
              item
                Format = 'R$ ###,###,##0.00 '
                Kind = skSum
              end
              item
                Format = 'R$ ,0.00;-R$ ,0.00'
                Kind = skSum
              end
              item
                Format = '# Subprodutos'
                Kind = skCount
              end
              item
                Kind = skSum
                Column = cxGridDBTableView2CUSTOPRODUCAO
              end
              item
                Kind = skSum
                Column = cxGridDBTableView2CUSTORECEITA
              end
              item
                Kind = skSum
                Column = cxGridDBTableView2QTDEPRODUCAO
              end>
            DataController.Summary.SummaryGroups = <>
            OptionsData.CancelOnExit = False
            OptionsData.Deleting = False
            OptionsData.DeletingConfirmation = False
            OptionsData.Editing = False
            OptionsData.Inserting = False
            OptionsView.Footer = True
            OptionsView.GroupByBox = False
            Styles.Content = stlRegistro
            Styles.ContentOdd = cxStyle2
            Styles.Header = HeaderStl
            object cxGridDBTableView2COD_PRODUTO_BAIXA: TcxGridDBColumn
              Caption = 'C'#243'digo'
              DataBinding.FieldName = 'COD_PRODUTO_BAIXA'
              DataBinding.IsNullValueType = True
              Width = 54
            end
            object cxGridDBTableView2DESCRICAO_PROD_BAIXA: TcxGridDBColumn
              Caption = 'Descri'#231#227'o do insumo'
              DataBinding.FieldName = 'DESCRICAO_PROD_BAIXA'
              DataBinding.IsNullValueType = True
              Width = 351
            end
            object cxGridDBTableView2ESTOQUEATUAL: TcxGridDBColumn
              Caption = 'Estoque atual'
              DataBinding.FieldName = 'ESTOQUEATUAL'
              DataBinding.IsNullValueType = True
              Width = 96
            end
            object cxGridDBTableView2UNIDADEESTOQUE: TcxGridDBColumn
              Caption = 'Unidade'
              DataBinding.FieldName = 'UNIDADEESTOQUE'
              DataBinding.IsNullValueType = True
              Width = 60
            end
            object cxGridDBTableView2QTDERECEITA: TcxGridDBColumn
              Caption = 'Qtd. Ficha t'#233'c.'
              DataBinding.FieldName = 'QTDERECEITA'
              DataBinding.IsNullValueType = True
              Width = 107
            end
            object cxGridDBTableView2DESCRICAO_UNIDADE: TcxGridDBColumn
              Caption = 'Unidade'
              DataBinding.FieldName = 'DESCRICAO_UNIDADE'
              DataBinding.IsNullValueType = True
              Width = 128
            end
            object cxGridDBTableView2CUSTO_UNITARIO_PRODUTO: TcxGridDBColumn
              Caption = 'Custo unit.'
              DataBinding.FieldName = 'CUSTO_UNITARIO_PRODUTO'
              DataBinding.IsNullValueType = True
              PropertiesClassName = 'TcxCurrencyEditProperties'
              Width = 78
            end
            object cxGridDBTableView2CUSTORECEITA: TcxGridDBColumn
              Caption = 'Custo ficha t'#233'c.'
              DataBinding.FieldName = 'CUSTORECEITA'
              DataBinding.IsNullValueType = True
              PropertiesClassName = 'TcxCurrencyEditProperties'
              Styles.Footer = HeaderStl
              Width = 112
            end
            object cxGridDBTableView2QTDEPRODUCAO: TcxGridDBColumn
              Caption = 'Qtde produ'#231#227'o'
              DataBinding.FieldName = 'QTDEPRODUCAO'
              DataBinding.IsNullValueType = True
              Styles.Footer = HeaderStl
              Width = 106
            end
            object cxGridDBTableView2CUSTOPRODUCAO: TcxGridDBColumn
              Caption = 'Custo da Produ'#231#227'o'
              DataBinding.FieldName = 'CUSTOPRODUCAO'
              DataBinding.IsNullValueType = True
              PropertiesClassName = 'TcxCurrencyEditProperties'
              Styles.Footer = HeaderStl
              Width = 134
            end
          end
          object cxGridLevel2: TcxGridLevel
            GridView = cxGridDBTableView2
          end
        end
        object Panel12: TPanel
          Left = 0
          Top = 0
          Width = 1225
          Height = 17
          Align = alTop
          BevelOuter = bvNone
          Color = clWhite
          ParentBackground = False
          TabOrder = 1
          StyleElements = []
        end
      end
      object Panel11: TPanel
        Left = 0
        Top = 589
        Width = 1225
        Height = 72
        Align = alBottom
        BevelOuter = bvNone
        Color = clWhite
        ParentBackground = False
        TabOrder = 3
        StyleElements = []
        object AdvGlassButton7: TAdvGlassButton
          Left = 1081
          Top = 3
          Width = 142
          Height = 66
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
            424DF60600000000000036000000280000001800000018000000010018000000
            000000000000130B0000130B00000000000000000000FFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEF1F1F1E3E3E3E6E6E6F2F2F2FCFCFC
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF3F3F3C2C2C28E8E8E93
            9393B6B6B6D6D6D6EAEAEAF7F7F7FEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7F7F7E2E2E2DCDCDCDEDEDEC1B0
            B0885C5C876969756D6D6666667D7D7DA0A0A0C6C6C6E0E0E0F1F1F1FCFCFCFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9F9F9D2D2D28F8F8F
            797979808080987D7DC18E8E9663638A57578156567E6B6B6A66666D6D6D8C8C
            8CB3B3B3D7D7D7F2F2F2FEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE6
            E6E6797979747474737373717272756464C89595A06C6CA26F6FA06D6D905D5D
            804D4D826060766B6B666565858585C6C6C6F5F5F5FFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFB1B1B18383836E6D6E90898CB3ACB1A19093C99494A16D6DA2
            6F6FA37070A26F6FA37070986565855353684D4D6C6C6CA0A0A0EBEBEBFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA7A7A78F8F8F716A6F57D48062EF9073BE
            84CE9799A47171A47171A47171A37070A47171A37070A6727283575765666696
            9696E7E7E7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA4A4A4929292736970
            4DD3794BED815DBD74D49AA0A57272A77474A67373A67373A57272A47171A671
            71865A5A666767939393E6E6E6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA2
            A2A2969696746A7246CE7344E3795BB770DBA0A6A77373A97676A87575A67474
            A87474A67373A773738A5E5E666868909090E5E5E5FFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFA2A2A2999999776D743DCC6D3BDA7059B06BDEA6ABAB7777AC
            7878A37171A37272A77676A87575A975758F61616768688E8E8EE4E4E4FFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9F9F9F9C9C9C766C7330C4602CCF6153A9
            61E1A7ACAC7676A58D8D8B89899C7373A77575AC7979AB7777936464676A6A8C
            8C8CE4E4E4FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9E9E9EA0A0A0736B6D
            96F7F396FFF897C5BFDFA9AAB58A8AD2D8D8D4D8D8A68B8BAE7A7AAD7A7AAC79
            799969696A6C6C8A8A8AE2E2E2FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9E
            9E9EA1A1A16D6969C6FFFFC7FFFFBACACAE0AEAEB17D7DD3C7C7CCCBCBB08484
            B07D7DAF7C7CAE7B7B9C6B6B6B6E6E888888E1E1E1FFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFF9B9B9BA7A7A76A6969F6FFFFF3FFFFD4C9C9E0B2B2B27F7FB4
            7F7FB47E7EB38080B27F7FB17E7EB07D7DA06E6E6C6F6F858585E1E1E1FFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF999999A9A9A96B6B6BFFFFFFFFFFFCE0C7
            C6E1B4B4B78383B78484B68383B58282B48181B38080B27F7FA671716D717183
            8383E0E0E0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF999999ADADAD6F6E6F
            FFFFF6FFF9EFE0C5C0E3B6B7B88484B98686B98686B78484B68383B58282B481
            81A97373707272818181DFDFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF98
            9898AEAEAE747575FFF8E9FFF2E4E2C1BAE5BABAB98686BE8A8AB88383B88484
            B68282B58282B48181AE76767073737F7F7FDEDEDEFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFF989898AFAFB0787979FFF3DDFFEEDAE3BFB5E8BFC0BA8585F1
            CFCFF9DBDBECC7C7E0B3B3D4A3A3C39191AE79797174747D7D7DDEDEDEFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9B9B9BB3B3B37E7F7EFFECD1FFE7CEE4BD
            B0EAC0C2BC8686EDD3D3FFF0F0FFE9E9FFE3E3FFE0E0EABCBCAF79797473737B
            7B7BDDDDDDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9B9B9BB3B3B384817F
            FFE4C3FFE1C0E6BBABEBC3C4C18B8BE1C9C9FFF2F2FFF1F1FFEAEAFFE4E4E7B9
            B9B17B7B777575787878DCDCDCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9C
            9C9CB5B5B58B8682FFE3B6FFDFB3EABBA9EEC5C6C38E8EC18B8BBA8383BA8686
            C29090CA9B9BC69595B57F7F777676777777DCDCDCFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFF9E9E9EB6B6B786868685817B87837DB69592F6CDCDDBB0B0D9
            AEAED5A6A6CC9F9FC39292BD8989BB8787B881817B78787E7E7EDEDEDEFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA0A0A0C9C9C9ABACACA8A8A9A3A4A4A19F
            9FA39A9AA39696A29191A59191A79090AC9393AE9393AF9191A280807B7A7AAA
            AAAAEBEBEBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB7B7B7A3A3A39F9F9F
            9F9F9F9D9D9D999A9A9697979696969394949192928F90908E8F8F8689898688
            88898A8AA5A5A5EBEBEBFBFBFBFFFFFFFFFFFFFFFFFF}
          ParentFont = False
          ShineColor = clWhite
          TabOrder = 0
          Version = '1.3.3.1'
          OnClick = AdvGlassButton7Click
        end
        object btImprimirInventario: TAdvGlassButton
          Left = 932
          Top = 3
          Width = 142
          Height = 66
          BackColor = 12615680
          ButtonDirection = bdLeft
          Caption = 'Imprimir ficha'
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
          TabOrder = 1
          Version = '1.3.3.1'
          OnClick = btImprimirInventarioClick
        end
      end
    end
    object pgProcessamento: TJvStandardPage
      Left = 0
      Top = 0
      Width = 1221
      Height = 660
      Caption = 'pgProcessamento'
      ExplicitWidth = 1225
      ExplicitHeight = 661
      object Panel15: TPanel
        Left = 0
        Top = 0
        Width = 1225
        Height = 74
        Align = alTop
        Color = 12615680
        ParentBackground = False
        TabOrder = 0
        StyleElements = []
        DesignSize = (
          1221
          74)
        object Label26: TLabel
          Left = 10
          Top = 15
          Width = 287
          Height = 33
          Caption = 'Produ'#231#227'o de subprodutos'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -27
          Font.Name = 'Calibri'
          Font.Style = [fsBold]
          ParentFont = False
          StyleElements = []
        end
        object Label27: TLabel
          Left = 12
          Top = 52
          Width = 732
          Height = 15
          Anchors = [akLeft, akTop, akRight]
          Caption = 
            'Informe as quantidades recebidas,perdas  e sobras dos insumos da' +
            ' produ'#231#227'o. ( Apenas os campos em destaque devem ser preenchidos)'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -13
          Font.Name = 'Calibri'
          Font.Style = [fsBold]
          ParentFont = False
          StyleElements = []
          ExplicitWidth = 736
        end
      end
      object Panel16: TPanel
        Left = 0
        Top = 584
        Width = 1221
        Height = 76
        Align = alBottom
        BevelOuter = bvNone
        Color = clWhite
        ParentBackground = False
        TabOrder = 1
        StyleElements = []
        ExplicitTop = 585
        ExplicitWidth = 1225
        object AdvGlassButton6: TAdvGlassButton
          Left = 854
          Top = 6
          Width = 181
          Height = 66
          BackColor = 12615680
          ButtonDirection = bdLeft
          Caption = 'Processar e  finalizar'
          CornerRadius = 0
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ForeColor = clWhite
          GlowColor = 12615680
          ImageIndex = -1
          InnerBorderColor = clBlack
          OuterBorderColor = clWhite
          Picture.Data = {
            424DF60600000000000036000000280000001800000018000000010018000000
            000000000000EB0A0000EB0A00000000000000000000FFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FEFEFEF4F4F4E4E4E4E1E1E1EDEDEDFCFCFCFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFEFEFEECECECC0C0C0909090868686AAAAAADFDFDFFAFAFAFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFEFEFEECECEC9BB49B2F8D2F1B891D558155686868A0
            A0A0DEDEDEFAFAFAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEECECEC97B7970D931115B12C15B2
            2A0B9B154E874E656565A0A0A0DEDEDEFBFBFBFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEECECEC98B9980F9613
            17B22F13AD2B12AB2613AF270A9A144F874F656565A0A0A0DEDEDEFBFBFBFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEECECEC99
            BA990F9A141AB63616B03015AE2C14AD2914AD2714B02A0A9A144F864F656565
            A1A1A1DEDEDEFBFBFBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFE
            FEEDEDED9BBC9B109D151BB63B1AB43518B13116AF2F13AE2A13AD2913AD2814
            B0280A9A14518651666666A2A2A2DFDFDFFBFBFBFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFF4F4F49EC09E10A11521BA421CB53A1AB33619B23417B1323DBE
            5227B43C0EAC2613AC2815B12B0A9A14518551666666A3A3A3DFDFDFFBFBFBFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFB5D9B816A82022BB451FB8401DB63B1DB639
            1BB53A17B0310E9F1776D18641BF560EAC2514AE2914B0290A99145285526767
            67A3A3A3E0E0E0FBFBFBFFFFFFFFFFFFFFFFFFFFFFFF2CAF3945C8661FBA431F
            B8411EB73E1FB8401BB4372E9B2E9CC09C139A1372D1843FBF530EAC2614AD29
            17B22C0A9914538553676767A3A3A3E0E0E0FBFBFBFFFFFFFFFFFFFFFFFF20B1
            3277D99217B83D1FBA4321BB441CB6392E9E2EC1CAC1F5F5F5C8EBC8109A1075
            D3863DBF530EAC2614AD2A15B12D0A9914548454686868A4A4A4E1E1E1FCFCFC
            FFFFFFFFFFFF85CE8F47C2626FD58B38C45B27BB472CA32EBFCABFF4F4F4FFFF
            FFFFFFFFC5EAC50F9A0F74D2853ABD5010AE2714AD2B16B22D0A991454835468
            6868A5A5A5E1E1E1FCFCFCFFFFFFFEFFFE76D4842ABB4142C05834AE3CCCDACC
            F6F6F6FFFFFFFFFFFFFFFFFFFFFFFFC4EBC40D9A0D77D3893ABD5010AE2815AF
            2B17B32E0A9914558355686868A6A6A6E3E3E3FCFCFCFFFFFFFFFFFFE2F9E4BD
            EAC1EFF6F0FCFCFCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBFE8BF0D9C0D
            77D38938BC4E10AE2915AE2C18B4300A99135683566A6A6AAFAFAFEEEEEEFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFBEE8BE0C9C0D7AD58C35BB4C11AF2A15AE2D17B22F0A99135A7D5A
            878787E1E1E1FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBAE7BA0A9C0C77D58B35BB4C11AF2B16
            B02D18B5331A8B1C8D8D8DE4E4E4FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB8E6B80A9C
            0E7AD58D34BA4C11AF2B19B5352A8D2AB8B8B8F2F2F2FFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFB4E6B4089D0E74D58954CA6C089C138CB28CE8E8E8FDFDFDFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB5E2B522A122259D259ACB9AF1F1F1
            FDFDFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
          ParentFont = False
          ShineColor = clWhite
          TabOrder = 0
          Version = '1.3.3.1'
          OnClick = AdvGlassButton6Click
        end
        object AdvGlassButton8: TAdvGlassButton
          Left = 1041
          Top = 6
          Width = 181
          Height = 66
          BackColor = 12615680
          ButtonDirection = bdLeft
          Caption = 'Voltar'
          CornerRadius = 0
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
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
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEF1F1F1E3E3E3E6E6E6F2F2F2FCFCFC
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF3F3F3C2C2C28E8E8E93
            9393B6B6B6D6D6D6EAEAEAF7F7F7FEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7F7F7E2E2E2DCDCDCDEDEDEC1B0
            B0885C5C876969756D6D6666667D7D7DA0A0A0C6C6C6E0E0E0F1F1F1FCFCFCFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9F9F9D2D2D28F8F8F
            797979808080987D7DC18E8E9663638A57578156567E6B6B6A66666D6D6D8C8C
            8CB3B3B3D7D7D7F2F2F2FEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE6
            E6E6797979747474737373717272756464C89595A06C6CA26F6FA06D6D905D5D
            804D4D826060766B6B666565858585C6C6C6F5F5F5FFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFB1B1B18383836E6D6E90898CB3ACB1A19093C99494A16D6DA2
            6F6FA37070A26F6FA37070986565855353684D4D6C6C6CA0A0A0EBEBEBFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA7A7A78F8F8F716A6F57D48062EF9073BE
            84CE9799A47171A47171A47171A37070A47171A37070A6727283575765666696
            9696E7E7E7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA4A4A4929292736970
            4DD3794BED815DBD74D49AA0A57272A77474A67373A67373A57272A47171A671
            71865A5A666767939393E6E6E6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA2
            A2A2969696746A7246CE7344E3795BB770DBA0A6A77373A97676A87575A67474
            A87474A67373A773738A5E5E666868909090E5E5E5FFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFA2A2A2999999776D743DCC6D3BDA7059B06BDEA6ABAB7777AC
            7878A37171A37272A77676A87575A975758F61616768688E8E8EE4E4E4FFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9F9F9F9C9C9C766C7330C4602CCF6153A9
            61E1A7ACAC7676A58D8D8B89899C7373A77575AC7979AB7777936464676A6A8C
            8C8CE4E4E4FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9E9E9EA0A0A0736B6D
            96F7F396FFF897C5BFDFA9AAB58A8AD2D8D8D4D8D8A68B8BAE7A7AAD7A7AAC79
            799969696A6C6C8A8A8AE2E2E2FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9E
            9E9EA1A1A16D6969C6FFFFC7FFFFBACACAE0AEAEB17D7DD3C7C7CCCBCBB08484
            B07D7DAF7C7CAE7B7B9C6B6B6B6E6E888888E1E1E1FFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFF9B9B9BA7A7A76A6969F6FFFFF3FFFFD4C9C9E0B2B2B27F7FB4
            7F7FB47E7EB38080B27F7FB17E7EB07D7DA06E6E6C6F6F858585E1E1E1FFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF999999A9A9A96B6B6BFFFFFFFFFFFCE0C7
            C6E1B4B4B78383B78484B68383B58282B48181B38080B27F7FA671716D717183
            8383E0E0E0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF999999ADADAD6F6E6F
            FFFFF6FFF9EFE0C5C0E3B6B7B88484B98686B98686B78484B68383B58282B481
            81A97373707272818181DFDFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF98
            9898AEAEAE747575FFF8E9FFF2E4E2C1BAE5BABAB98686BE8A8AB88383B88484
            B68282B58282B48181AE76767073737F7F7FDEDEDEFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFF989898AFAFB0787979FFF3DDFFEEDAE3BFB5E8BFC0BA8585F1
            CFCFF9DBDBECC7C7E0B3B3D4A3A3C39191AE79797174747D7D7DDEDEDEFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9B9B9BB3B3B37E7F7EFFECD1FFE7CEE4BD
            B0EAC0C2BC8686EDD3D3FFF0F0FFE9E9FFE3E3FFE0E0EABCBCAF79797473737B
            7B7BDDDDDDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9B9B9BB3B3B384817F
            FFE4C3FFE1C0E6BBABEBC3C4C18B8BE1C9C9FFF2F2FFF1F1FFEAEAFFE4E4E7B9
            B9B17B7B777575787878DCDCDCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9C
            9C9CB5B5B58B8682FFE3B6FFDFB3EABBA9EEC5C6C38E8EC18B8BBA8383BA8686
            C29090CA9B9BC69595B57F7F777676777777DCDCDCFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFF9E9E9EB6B6B786868685817B87837DB69592F6CDCDDBB0B0D9
            AEAED5A6A6CC9F9FC39292BD8989BB8787B881817B78787E7E7EDEDEDEFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA0A0A0C9C9C9ABACACA8A8A9A3A4A4A19F
            9FA39A9AA39696A29191A59191A79090AC9393AE9393AF9191A280807B7A7AAA
            AAAAEBEBEBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB7B7B7A3A3A39F9F9F
            9F9F9F9D9D9D999A9A9697979696969394949192928F90908E8F8F8689898688
            88898A8AA5A5A5EBEBEBFBFBFBFFFFFFFFFFFFFFFFFF}
          ParentFont = False
          ShineColor = clWhite
          TabOrder = 1
          Version = '1.3.3.1'
          OnClick = AdvGlassButton5Click
        end
      end
      object Panel17: TPanel
        Left = 0
        Top = 74
        Width = 1221
        Height = 510
        Align = alClient
        BevelOuter = bvNone
        Caption = 'Panel1'
        Color = clWhite
        ParentBackground = False
        TabOrder = 2
        StyleElements = []
        ExplicitWidth = 1225
        ExplicitHeight = 511
        object Label28: TLabel
          Left = 10
          Top = -15
          Width = 111
          Height = 14
          Caption = 'Selecione o produto'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          StyleElements = []
        end
        object cxGrid4: TcxGrid
          Left = 0
          Top = 0
          Width = 1225
          Height = 511
          Align = alClient
          TabOrder = 0
          LookAndFeel.Kind = lfStandard
          LookAndFeel.NativeStyle = False
          object cxGridDBTableView3: TcxGridDBTableView
            PopupMenu = popCadastro
            Navigator.Buttons.CustomButtons = <>
            ScrollbarAnnotations.CustomAnnotations = <>
            OnCellDblClick = cxGridDBTableView1CellDblClick
            OnEditKeyDown = cxGridDBTableView1EditKeyDown
            DataController.DataSource = dmProducaoSubprodutos.dsInsumosProcessamento
            DataController.Summary.DefaultGroupSummaryItems = <
              item
                Kind = skSum
                Position = spFooter
              end
              item
                Format = 'R$ ###,###,##0.00 '
                Kind = skSum
              end
              item
                Kind = skSum
                Position = spFooter
              end
              item
                Kind = skSum
                Position = spFooter
              end
              item
                Kind = skSum
                Position = spFooter
              end
              item
                Kind = skSum
                Position = spFooter
              end
              item
                Kind = skSum
                Position = spFooter
              end
              item
                Kind = skSum
                Position = spFooter
              end
              item
                Format = 'R$ ###,###,##0.00 '
                Kind = skSum
              end
              item
                Format = 'R$ ###,###,##0.00 '
                Kind = skSum
              end
              item
                Format = 'R$ ###,###,##0.00 '
                Kind = skSum
              end
              item
                Format = 'R$ ###,###,##0.00 '
                Kind = skSum
              end
              item
                Format = 'R$ ###,###,##0.00 '
                Kind = skSum
              end
              item
                Format = 'R$ ###,###,##0.00 '
                Kind = skSum
              end>
            DataController.Summary.FooterSummaryItems = <
              item
                Format = 'R$ ,0.00;-R$ ,0.00'
                Kind = skSum
              end
              item
                Kind = skCount
              end
              item
                Format = 'R$ ###,###,##0.00 '
                Kind = skSum
              end
              item
                Format = 'R$ ###,###,##0.00 '
                Kind = skSum
              end
              item
                Format = 'R$ ###,###,##0.00 '
                Kind = skSum
              end
              item
                Format = 'R$ ###,###,##0.00 '
                Kind = skSum
              end
              item
                Format = 'R$ ###,###,##0.00 '
                Kind = skSum
              end
              item
                Format = 'R$ ###,###,##0.00 '
                Kind = skSum
              end
              item
                Format = 'R$ ###,###,##0.00 '
                Kind = skSum
              end
              item
                Format = 'R$ ,0.00;-R$ ,0.00'
                Kind = skSum
              end
              item
                Format = '# Subprodutos'
                Kind = skCount
              end>
            DataController.Summary.SummaryGroups = <>
            OptionsData.CancelOnExit = False
            OptionsData.Deleting = False
            OptionsData.DeletingConfirmation = False
            OptionsData.Inserting = False
            OptionsView.CellEndEllipsis = True
            OptionsView.Footer = True
            OptionsView.GroupByBox = False
            Styles.Content = stlRegistro
            Styles.ContentOdd = cxStyle2
            Styles.Header = HeaderStl
            object cxGridDBTableView3COD_PRODUTO: TcxGridDBColumn
              Caption = 'C'#243'd.'
              DataBinding.FieldName = 'COD_PRODUTO'
              Options.Editing = False
              Width = 60
            end
            object cxGridDBTableView3DESCRICAO: TcxGridDBColumn
              DataBinding.FieldName = 'DESCRICAO'
              Options.Editing = False
              Width = 301
            end
            object cxGridDBTableView3UNIDADE: TcxGridDBColumn
              Caption = 'Unidade'
              DataBinding.FieldName = 'UNIDADE'
              Options.Editing = False
              Width = 61
            end
            object cxGridDBTableView3PB: TcxGridDBColumn
              Caption = 'Qtd. Bruta'
              DataBinding.FieldName = 'PB'
              PropertiesClassName = 'TcxCurrencyEditProperties'
              Properties.DisplayFormat = ',0.000;-,0.000'
              Options.Editing = False
              Width = 77
            end
            object cxGridDBTableView3PERC_PERDA: TcxGridDBColumn
              Caption = 'Perda est. %'
              DataBinding.FieldName = 'PERC_PERDA'
              PropertiesClassName = 'TcxCurrencyEditProperties'
              Properties.DisplayFormat = ',0.000;-,0.000'
              Options.Editing = False
              Width = 95
            end
            object cxGridDBTableView3PE: TcxGridDBColumn
              Caption = 'Perda est.'
              DataBinding.FieldName = 'PE'
              PropertiesClassName = 'TcxCurrencyEditProperties'
              Properties.DisplayFormat = ',0.000;-,0.000'
              Options.Editing = False
              Width = 85
            end
            object cxGridDBTableView3PL: TcxGridDBColumn
              Caption = 'Qtd. Estimada'
              DataBinding.FieldName = 'PL'
              PropertiesClassName = 'TcxCurrencyEditProperties'
              Properties.DisplayFormat = ',0.000;-,0.000'
              Options.Editing = False
              Width = 101
            end
            object cxGridDBTableView3QTDE_RETIRADA: TcxGridDBColumn
              Caption = 'Qtd Retirada'
              DataBinding.FieldName = 'QTDE_RETIRADA'
              PropertiesClassName = 'TcxCurrencyEditProperties'
              Properties.DecimalPlaces = 3
              Properties.DisplayFormat = ',0.000;-,0.000'
              Properties.ReadOnly = False
              Styles.Header = cxstyl1
              Width = 100
            end
            object cxGridDBTableView3QTDE_PERDA: TcxGridDBColumn
              Caption = 'Perda real'
              DataBinding.FieldName = 'QTDE_PERDA'
              PropertiesClassName = 'TcxCurrencyEditProperties'
              Properties.DecimalPlaces = 3
              Properties.DisplayFormat = ',0.000;-,0.000'
              Properties.ReadOnly = False
              Styles.Header = cxstyl1
              Width = 84
            end
            object cxGridDBTableView3QTDE_SOBRA: TcxGridDBColumn
              Caption = 'Sobra'
              DataBinding.FieldName = 'QTDE_SOBRA'
              PropertiesClassName = 'TcxCurrencyEditProperties'
              Properties.DecimalPlaces = 3
              Properties.DisplayFormat = ',0.000;-,0.000'
              Properties.ReadOnly = False
              Styles.Header = cxstyl1
              Width = 82
            end
            object cxGridDBTableView3QTDE_UTILIZADA: TcxGridDBColumn
              Caption = 'Qtd. utilizada'
              DataBinding.FieldName = 'QTDE_UTILIZADA'
              PropertiesClassName = 'TcxCurrencyEditProperties'
              Properties.DecimalPlaces = 3
              Properties.DisplayFormat = ',0.000;-,0.000'
              Properties.ReadOnly = False
              Options.Editing = False
              Width = 91
            end
            object cxGridDBTableView3PERCENTUAL_PERDA: TcxGridDBColumn
              Caption = '% Perda'
              DataBinding.FieldName = 'PERCENTUAL_PERDA'
              PropertiesClassName = 'TcxCurrencyEditProperties'
              Properties.DecimalPlaces = 3
              Properties.DisplayFormat = ',0.000;- ,0.000'
              Properties.ReadOnly = False
              Width = 86
            end
          end
          object cxGrid4DBBandedTableView1: TcxGridDBBandedTableView
            Navigator.Buttons.CustomButtons = <>
            ScrollbarAnnotations.CustomAnnotations = <>
            DataController.DataSource = dmProducaoSubprodutos.dsInsumosProcessamento
            DataController.Summary.DefaultGroupSummaryItems = <>
            DataController.Summary.FooterSummaryItems = <>
            DataController.Summary.SummaryGroups = <>
            OptionsData.Deleting = False
            OptionsData.DeletingConfirmation = False
            OptionsData.Inserting = False
            OptionsView.GroupByBox = False
            Styles.Content = cxStyle2
            Styles.ContentOdd = stlRegistro
            Bands = <
              item
                Caption = 'Dados do produto'
                Width = 354
              end
              item
                Caption = 'Quantidades estimadas (Ficha t'#233'cnica)'
                Width = 264
              end
              item
                Caption = 'Quantidades reais'
                Width = 334
              end
              item
                Caption = '% de perdas'
                Width = 137
              end
              item
                Caption = '% de desvio'
                Width = 133
              end>
            object cxGrid4DBBandedTableView1COD_PRODUTO: TcxGridDBBandedColumn
              Caption = 'C'#243'digo'
              DataBinding.FieldName = 'COD_PRODUTO'
              Options.Editing = False
              Width = 38
              Position.BandIndex = 0
              Position.ColIndex = 0
              Position.RowIndex = 0
            end
            object cxGrid4DBBandedTableView1DESCRICAO: TcxGridDBBandedColumn
              Caption = 'Descri'#231#227'o'
              DataBinding.FieldName = 'DESCRICAO'
              Options.Editing = False
              Width = 209
              Position.BandIndex = 0
              Position.ColIndex = 1
              Position.RowIndex = 0
            end
            object cxGrid4DBBandedTableView1UNIDADE: TcxGridDBBandedColumn
              Caption = 'Unid.'
              DataBinding.FieldName = 'UNIDADE'
              Options.Editing = False
              Width = 28
              Position.BandIndex = 0
              Position.ColIndex = 2
              Position.RowIndex = 0
            end
            object cxGrid4DBBandedTableView1PB: TcxGridDBBandedColumn
              Caption = 'Bruta'
              DataBinding.FieldName = 'PB'
              PropertiesClassName = 'TcxCurrencyEditProperties'
              Properties.DecimalPlaces = 3
              Properties.DisplayFormat = ',0.000;- ,0.000'
              Options.Editing = False
              Position.BandIndex = 1
              Position.ColIndex = 0
              Position.RowIndex = 0
            end
            object cxGrid4DBBandedTableView1PE: TcxGridDBBandedColumn
              Caption = 'Perda estimada'
              DataBinding.FieldName = 'PE'
              PropertiesClassName = 'TcxCurrencyEditProperties'
              Properties.DecimalPlaces = 3
              Properties.DisplayFormat = ',0.000;- ,0.000'
              Options.Editing = False
              Position.BandIndex = 1
              Position.ColIndex = 1
              Position.RowIndex = 0
            end
            object cxGrid4DBBandedTableView1PL: TcxGridDBBandedColumn
              Caption = 'Limpa'
              DataBinding.FieldName = 'PL'
              PropertiesClassName = 'TcxCurrencyEditProperties'
              Properties.DecimalPlaces = 3
              Properties.DisplayFormat = ',0.000;- ,0.000'
              Options.Editing = False
              Position.BandIndex = 1
              Position.ColIndex = 2
              Position.RowIndex = 0
            end
            object cxGrid4DBBandedTableView1QTDE_RETIRADA: TcxGridDBBandedColumn
              Caption = 'Bruta recebida'
              DataBinding.FieldName = 'QTDE_RETIRADA'
              PropertiesClassName = 'TcxCurrencyEditProperties'
              Properties.DecimalPlaces = 3
              Properties.DisplayFormat = ',0.000;- ,0.000'
              Properties.ReadOnly = False
              Properties.OnEditValueChanged = cxGrid4DBBandedTableView1QTDE_RETIRADAPropertiesEditValueChanged
              Styles.Header = cxstyl1
              Width = 103
              Position.BandIndex = 2
              Position.ColIndex = 0
              Position.RowIndex = 0
            end
            object cxGrid4DBBandedTableView1QTDE_UTILIZADA: TcxGridDBBandedColumn
              Caption = 'Utilizada'
              DataBinding.FieldName = 'QTDE_UTILIZADA'
              PropertiesClassName = 'TcxCurrencyEditProperties'
              Properties.DecimalPlaces = 3
              Properties.DisplayFormat = ',0.000;- ,0.000'
              Options.Editing = False
              Width = 70
              Position.BandIndex = 2
              Position.ColIndex = 3
              Position.RowIndex = 0
            end
            object cxGrid4DBBandedTableView1QTDE_PERDA: TcxGridDBBandedColumn
              Caption = 'Perda'
              DataBinding.FieldName = 'QTDE_PERDA'
              PropertiesClassName = 'TcxCurrencyEditProperties'
              Properties.DecimalPlaces = 3
              Properties.DisplayFormat = ',0.000;- ,0.000'
              Properties.ReadOnly = False
              Properties.OnEditValueChanged = cxGrid4DBBandedTableView1QTDE_PERDAPropertiesEditValueChanged
              Styles.Header = cxstyl1
              Width = 81
              Position.BandIndex = 2
              Position.ColIndex = 1
              Position.RowIndex = 0
            end
            object cxGrid4DBBandedTableView1QTDE_SOBRA: TcxGridDBBandedColumn
              Caption = 'Sobra'
              DataBinding.FieldName = 'QTDE_SOBRA'
              PropertiesClassName = 'TcxCurrencyEditProperties'
              Properties.DecimalPlaces = 3
              Properties.DisplayFormat = ',0.000;- ,0.000'
              Properties.ReadOnly = False
              Properties.OnEditValueChanged = cxGrid4DBBandedTableView1QTDE_SOBRAPropertiesEditValueChanged
              Styles.Header = cxstyl1
              Width = 80
              Position.BandIndex = 2
              Position.ColIndex = 2
              Position.RowIndex = 0
            end
            object cxGrid4DBBandedTableView1PERC_PERDA: TcxGridDBBandedColumn
              Caption = 'Estimado'
              DataBinding.FieldName = 'PERC_PERDA'
              PropertiesClassName = 'TcxCurrencyEditProperties'
              Properties.DecimalPlaces = 3
              Properties.DisplayFormat = ',0.000;- ,0.000'
              Options.Editing = False
              Position.BandIndex = 3
              Position.ColIndex = 0
              Position.RowIndex = 0
            end
            object cxGrid4DBBandedTableView1PERCENTUAL_PERDA: TcxGridDBBandedColumn
              Caption = 'Real'
              DataBinding.FieldName = 'PERCENTUAL_PERDA'
              PropertiesClassName = 'TcxCurrencyEditProperties'
              Properties.DecimalPlaces = 3
              Properties.DisplayFormat = ',0.000;- ,0.000'
              Options.Editing = False
              Position.BandIndex = 3
              Position.ColIndex = 1
              Position.RowIndex = 0
            end
            object cxGrid4DBBandedTableView1DESVIO_PERDA: TcxGridDBBandedColumn
              Caption = 'Perda'
              DataBinding.FieldName = 'DESVIO_PERDA'
              PropertiesClassName = 'TcxCurrencyEditProperties'
              Properties.DecimalPlaces = 3
              Properties.DisplayFormat = ' ,0.000;-,0.000'
              Options.Editing = False
              Position.BandIndex = 4
              Position.ColIndex = 0
              Position.RowIndex = 0
            end
            object cxGrid4DBBandedTableView1DESVIO_QUANTIDADE: TcxGridDBBandedColumn
              Caption = 'Quantidade'
              DataBinding.FieldName = 'DESVIO_QUANTIDADE'
              PropertiesClassName = 'TcxCurrencyEditProperties'
              Properties.DecimalPlaces = 3
              Properties.DisplayFormat = ' ,0.000;-,0.000'
              Options.Editing = False
              Position.BandIndex = 4
              Position.ColIndex = 1
              Position.RowIndex = 0
            end
          end
          object cxGrid4Level1: TcxGridLevel
            GridView = cxGrid4DBBandedTableView1
          end
        end
      end
    end
  end
  inherited cliques: TActionList
    Left = 1177
    Top = 16
  end
  inherited actlBusca: TJvControlActionList
    Left = 1001
    Top = 15
  end
  object cxStyleRepository1: TcxStyleRepository
    Left = 20
    Top = 219
    PixelsPerInch = 96
    object cxStyle2: TcxStyle
      AssignedValues = [svColor, svFont]
      Color = 15329769
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 12615680
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
    end
    object stlRegistro: TcxStyle
      AssignedValues = [svFont]
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 12615680
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
    end
    object stConfirmada: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 11526823
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      TextColor = clBlack
    end
    object stCancelada: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 8816381
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsStrikeOut]
      TextColor = clBlack
    end
    object stCiencia: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 10354687
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      TextColor = clBlack
    end
    object stSemManifesto: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 12615680
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      TextColor = clWhite
    end
    object stNaoRealizada: TcxStyle
      AssignedValues = [svFont]
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 8695039
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
    end
    object HeaderStl: TcxStyle
      AssignedValues = [svFont]
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = []
    end
    object cxstyl1: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 9474192
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      TextColor = clBlack
    end
  end
  object popCadastro: TPopupMenu
    Left = 1123
    Top = 16
    object V1: TMenuItem
      Caption = 'Visualizar ficha de produ'#231#227'o do '#237'tem'
      OnClick = V1Click
    end
    object E1: TMenuItem
      Caption = 'Excluir '#237'tem'
      OnClick = E1Click
    end
  end
  object cxImageList1: TcxImageList
    SourceDPI = 96
    Height = 24
    Width = 24
    FormatVersion = 1
    DesignInfo = 29622370
    ImageInfo = <
      item
        ImageClass = 'TdxPNGImage'
        Image.Data = {
          89504E470D0A1A0A0000000D4948445200000018000000180806000000E0773D
          F8000000097048597300000B1300000B1301009A9C1800000151494441544889
          EDD33D4BC3401C80F1274D892FE00710677715A78A34D13A68FD027E0D272B94
          5EC0175CFC0E0E0E0EEAE82036558A5028E8E2A44EB68B83455484D6720EA52F
          31B936A10597FEC7BBDCEF211C07C3F9EFD10626096706B418A3B563B656DE07
          1B10CE3A68A78001DC819140C4DE002203C60166A17AC9E1ED58FF013B9BFC83
          37678E8F6AA2BF809D4D2223673E38C00B869E0788BA96776F26A9C94D348A64
          E2274A5C5CAF21A51AD7EB1629B3029D97BC7335C58FEE00D33476B6C998FBBE
          38F25C8197D0EB26E9E5E7E64223208AE3F079DFC2DBBBEE48481C5A77F035EF
          C101247BD8B91400766E352CDEF1074E142239900B3E87017904DA4658BC1D00
          38C84FF05DBF50477CA704D242584FAA0FDC2F395CA40CD2EC867B03C1238170
          FF40EF48605C1D5047CAE89A453AFE1804EF1EF04642E3BD0300E2C180D72546
          A205528B9530F87002CD2F17AB8CC00F75B06A0000000049454E44AE426082}
      end
      item
        ImageClass = 'TdxPNGImage'
        Image.Data = {
          89504E470D0A1A0A0000000D4948445200000018000000180806000000E0773D
          F8000000097048597300000B1300000B1301009A9C18000001BB494441544889
          ED93414854511486BF739DB4C13689443858B4D3D6D1A2CD53873629B9113782
          0EB48820A4762EC23956EBB068ED2A5BBA68511138EF3D50572D0AD46D24042D
          224830B4D1775ACCE8CCEB39A3BD458BF0DFBD7BBFFF3FF79C772F9CE8BF9700
          A07E015CE1EFACF619ED9B388A72290E0598078CA7F31E47EA2B1AD871D04CDC
          18F88763F201F5EE1F7C9A5C42000D831A631ED80CDAAFF5CE742312BBD860A3
          C8A3B037B692AA80FA018887F6D5FC8F1773ECB6BC0736395DBECAD4F51FB03F
          A2997002B3C2A1612EBAC7F4C0C7238B3EC87FE1616984C8F96C9F7A81DA302A
          51CA5BD440D303CB6093C01012DE4A1FA47ED0F01699091A18EA2BA47E074D24
          122B9C49001ADE047B5EA5EFA2DEABA681EA8F80CC0265B03B68FFDB58BD3FE0
          4E900D9095CA825D03BB009C010A75B662F57C39D8FD04BC03C956F9A72053FB
          6F22DE81B31C9164119BAFE49387962ED8EBA8851EE827EE5737916B4598C338
          0BE42BE1006E2339A29E6FABAC9F2B61CC55574A5CFEBAC6E8E85EA2DB4AC719
          600963010CE00D456FB0FE3F244DCF5EB7F1BD7D0C808EAD79266FEC24987A3D
          59C9B2B93386B832E7DB5F72FB4AB9297FA27FAEDFC000887A0937B815000000
          0049454E44AE426082}
      end
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
        ImageClass = 'TdxPNGImage'
        Image.Data = {
          89504E470D0A1A0A0000000D4948445200000018000000180806000000E0773D
          F8000004B469545874584D4C3A636F6D2E61646F62652E786D7000000000003C
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
          656E73696F6E3D223234220A202020657869663A506978656C5944696D656E73
          696F6E3D223234220A202020657869663A436F6C6F7253706163653D2231220A
          202020746966663A496D61676557696474683D223234220A202020746966663A
          496D6167654C656E6774683D223234220A202020746966663A5265736F6C7574
          696F6E556E69743D2232220A202020746966663A585265736F6C7574696F6E3D
          223330302E30220A202020746966663A595265736F6C7574696F6E3D22333030
          2E30220A20202070686F746F73686F703A436F6C6F724D6F64653D2233220A20
          202070686F746F73686F703A49434350726F66696C653D227352474220494543
          36313936362D322E31220A202020786D703A4D6F64696679446174653D223230
          32302D30362D32395431323A32363A32322D30333A3030220A202020786D703A
          4D65746164617461446174653D22323032302D30362D32395431323A32363A32
          322D30333A3030223E0A2020203C786D704D4D3A486973746F72793E0A202020
          203C7264663A5365713E0A20202020203C7264663A6C690A2020202020207374
          4576743A616374696F6E3D2270726F6475636564220A20202020202073744576
          743A736F6674776172654167656E743D22416666696E6974792044657369676E
          657220312E372E33220A20202020202073744576743A7768656E3D2232303230
          2D30362D32395431323A32363A32322D30333A3030222F3E0A202020203C2F72
          64663A5365713E0A2020203C2F786D704D4D3A486973746F72793E0A20203C2F
          7264663A4465736372697074696F6E3E0A203C2F7264663A5244463E0A3C2F78
          3A786D706D6574613E0A3C3F787061636B657420656E643D2272223F3EFC8863
          CE0000018269434350735247422049454336313936362D322E31000028917591
          B94B43411087BF245E682482168A0A41A2958A07046D2C12BC402D92085E4DF2
          7209391EEF2548B0156C0505D1C6ABD0BF405BC15A101445102B0B6B451B95E7
          BC2490206696D9F9F6B73BC3EE2C58030925A9570D403295D17C931EE7C2E292
          B3F6851A3A71D0467B50D1D559FF44808AF6798FC58CB77D66ADCAE7FEB58670
          4457C052273CA6A85A46784A78662DA39ABC23DCA2C48361E133E15E4D2E287C
          67EAA102BF9A1C2BF0B7C95AC0E7056B93B03356C6A13256E25A52585E8E2B99
          C82AC5FB982FB14752F37E895DE21DE8F898C4839369C6F1E266905199DDF431
          44BFACA8903F90CF9F232DB98ACC2A39345689112743AFA859A91E9118153D22
          2341CEECFFDFBEEAD1E1A14275BB07AA9F0DE3BD1B6AB7E167CB30BE8E0CE3E7
          186C4F70992AE5A70F61E443F4AD92E63A00C7069C5F95B4D02E5C6C42EBA31A
          D48279C9266E8D46E1ED141A17A1F906EA970B3D2BEE73F2008175F9AA6BD8DB
          871E39EF58F905703767EA82BFA460000000097048597300002E2300002E2301
          78A53F7600000018494441544889EDC101010000008090FEAFEE080A0080AA01
          09180001CEEE253E0000000049454E44AE426082}
      end>
  end
  object popListagem: TPopupMenu
    Left = 1059
    Top = 16
    object itEditarProducao: TMenuItem
      Caption = 'Editar produ'#231#227'o'
      OnClick = itEditarProducaoClick
    end
    object itExcluirProducao: TMenuItem
      Caption = 'Excluir produ'#231#227'o'
      OnClick = itExcluirProducaoClick
    end
    object I1: TMenuItem
      Caption = 'Imprimir ordem de produ'#231#227'o'
      OnClick = I1Click
    end
    object P1: TMenuItem
      Caption = 'Processar produ'#231#227'o'
      OnClick = P1Click
    end
  end
end
