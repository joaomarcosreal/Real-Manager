inherited frmLancamentoContasApagar: TfrmLancamentoContasApagar
  Left = 177
  Top = 109
  Caption = 'Lan'#231'amento de t'#237'tulos - Contas '#224' pagar'
  ClientHeight = 551
  ClientWidth = 891
  ExplicitWidth = 903
  ExplicitHeight = 589
  TextHeight = 13
  inherited pn_principal: TPanel
    Width = 891
    Height = 496
    BevelOuter = bvNone
    Color = clWhite
    ParentBackground = False
    StyleElements = []
    ExplicitWidth = 893
    ExplicitHeight = 501
    inherited pn_codigo: TPanel
      Left = 0
      Top = 34
      Width = 891
      Color = clWhite
      Enabled = False
      ParentBackground = False
      StyleElements = []
      ExplicitTop = 62
      ExplicitWidth = 891
      inherited bt_pesquisa: TSpeedButton
        Left = 65
        Top = 21
        Width = 27
        Height = 21
        Visible = False
        ExplicitLeft = 65
        ExplicitTop = 21
        ExplicitWidth = 27
        ExplicitHeight = 21
      end
      object Label7: TLabel [1]
        Left = 3
        Top = 8
        Width = 87
        Height = 13
        Caption = 'N'#186' de controle:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        StyleElements = []
      end
      object lbCodEntrada: TLabel [2]
        Left = 680
        Top = 16
        Width = 3
        Height = 13
        StyleElements = []
      end
      object Label26: TLabel [3]
        Left = 680
        Top = 0
        Width = 55
        Height = 13
        Caption = 'Entrada N'#186':'
        StyleElements = []
      end
      inherited ed_codigo: TMaskEdit
        Width = 60
        ExplicitWidth = 60
      end
      object Panel11: TPanel
        Left = 763
        Top = 0
        Width = 116
        Height = 45
        Caption = 'Panel11'
        Enabled = False
        TabOrder = 1
        StyleElements = []
        object Label25: TLabel
          Left = 3
          Top = 2
          Width = 62
          Height = 13
          Caption = 'Lan'#231'ada em:'
          StyleElements = []
        end
        object edDataLancamento: TDateEdit
          Left = 7
          Top = 17
          Width = 106
          Height = 21
          Color = clBlack
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clYellow
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          NumGlyphs = 2
          ParentFont = False
          PopupColor = clBlack
          TabOrder = 0
          OnEnter = Edit1Enter
          OnExit = Edit1Exit
          OnKeyDown = Edit1KeyDown
        end
      end
    end
    object Panel1: TPanel
      Tag = 99
      Left = 0
      Top = 0
      Width = 891
      Height = 34
      Align = alTop
      BevelOuter = bvNone
      Color = 12615680
      ParentBackground = False
      TabOrder = 1
      StyleElements = []
      ExplicitWidth = 893
      object lbCodPrimeiraConta: TLabel
        Left = 799
        Top = 24
        Width = 92
        Height = 13
        Caption = 'lbCodPrimeiraConta'
        Visible = False
        StyleElements = []
      end
      object lbTitulo: TLabel
        Left = 2
        Top = 5
        Width = 453
        Height = 39
        AutoSize = False
        Caption = 'Contas '#224' pagar'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -19
        Font.Name = 'Calibri'
        Font.Style = [fsBold]
        ParentFont = False
        StyleElements = []
      end
    end
    object Panel5: TPanel
      Left = 0
      Top = 80
      Width = 891
      Height = 139
      Align = alTop
      Color = clWhite
      ParentBackground = False
      TabOrder = 2
      StyleElements = []
      ExplicitLeft = 1
      ExplicitTop = 108
      object bt_pesq_centro_custo: TSpeedButton
        Left = 69
        Top = 75
        Width = 23
        Height = 20
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
      object Label3: TLabel
        Left = 3
        Top = 61
        Width = 74
        Height = 13
        Caption = 'Conta do caixa:'
        StyleElements = []
      end
      object Label4: TLabel
        Left = 97
        Top = 61
        Width = 93
        Height = 13
        Caption = 'Descri'#231#227'o da conta'
        StyleElements = []
      end
      object Label5: TLabel
        Left = 530
        Top = 61
        Width = 135
        Height = 13
        Caption = 'Descri'#231#227'o da conta a pagar:'
        StyleElements = []
      end
      object Label6: TLabel
        Left = 23
        Top = 99
        Width = 72
        Height = 13
        Caption = 'Valor da conta:'
        StyleElements = []
      end
      object Label9: TLabel
        Left = 129
        Top = 99
        Width = 59
        Height = 13
        Caption = 'Vencimento:'
        StyleElements = []
      end
      object Label10: TLabel
        Left = 446
        Top = 98
        Width = 29
        Height = 13
        Caption = 'Multa:'
        StyleElements = []
      end
      object Label11: TLabel
        Left = 572
        Top = 98
        Width = 57
        Height = 13
        Caption = 'Mora Di'#225'ria:'
        StyleElements = []
      end
      object Label12: TLabel
        Left = 664
        Top = 98
        Width = 64
        Height = 13
        Caption = 'Desconto de:'
        StyleElements = []
      end
      object Label13: TLabel
        Left = 762
        Top = 96
        Width = 50
        Height = 13
        Caption = 'Dias antes'
        StyleElements = []
      end
      object Label1: TLabel
        Left = 100
        Top = 15
        Width = 66
        Height = 13
        Caption = 'Raz'#227'o Social:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        StyleElements = []
      end
      object Label2: TLabel
        Left = 3
        Top = 22
        Width = 61
        Height = 13
        Caption = 'C'#243'd. Fornec:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        StyleElements = []
      end
      object Label8: TLabel
        Left = 501
        Top = 25
        Width = 56
        Height = 13
        Caption = 'N'#186' da Nota:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        StyleElements = []
      end
      object bt_pesq_fornecedor: TSpeedButton
        Left = 70
        Top = 34
        Width = 24
        Height = 23
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
      object Label16: TLabel
        Left = 819
        Top = 98
        Width = 61
        Height = 13
        Caption = 'N'#186' de clones'
        StyleElements = []
      end
      object Label21: TLabel
        Left = 334
        Top = 99
        Width = 57
        Height = 13
        Caption = 'Data no RD'
        StyleElements = []
      end
      object Label24: TLabel
        Left = 231
        Top = 99
        Width = 81
        Height = 13
        Caption = 'Data Documento'
        StyleElements = []
      end
      object Panel6: TPanel
        Left = 94
        Top = 74
        Width = 427
        Height = 21
        BevelOuter = bvNone
        Caption = #39
        Enabled = False
        TabOrder = 0
        StyleElements = []
        object ed_desc_c_custo: TEdit
          Left = 3
          Top = 0
          Width = 424
          Height = 21
          Color = clBlack
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clYellow
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 0
        end
      end
      object Panel3: TPanel
        Left = 96
        Top = 32
        Width = 399
        Height = 26
        BevelOuter = bvNone
        Color = clWhite
        Enabled = False
        ParentBackground = False
        TabOrder = 1
        StyleElements = []
        object ed_razao_social_fornecedor: TEdit
          Left = 3
          Top = 4
          Width = 395
          Height = 21
          Color = clBlack
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clYellow
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 0
        end
      end
      object ed_cod_fornecedor: TEdit
        Left = 4
        Top = 36
        Width = 61
        Height = 21
        TabOrder = 2
        OnEnter = Edit1Enter
        OnExit = Edit1Exit
        OnKeyDown = Edit1KeyDown
      end
      object edNumeroNotaFiscal: TEdit
        Left = 501
        Top = 37
        Width = 103
        Height = 21
        CharCase = ecUpperCase
        MaxLength = 15
        TabOrder = 3
        OnEnter = Edit1Enter
        OnExit = Edit1Exit
        OnKeyDown = Edit1KeyDown
      end
      object ed_cod_centro_custo: TEdit
        Left = 5
        Top = 75
        Width = 60
        Height = 21
        TabOrder = 4
        OnEnter = Edit1Enter
        OnExit = Edit1Exit
        OnKeyDown = Edit1KeyDown
      end
      object edDescricaoConta: TEdit
        Left = 527
        Top = 71
        Width = 348
        Height = 21
        CharCase = ecUpperCase
        MaxLength = 40
        TabOrder = 5
        OnEnter = Edit1Enter
        OnExit = Edit1Exit
        OnKeyDown = Edit1KeyDown
      end
      object edTotalConta: TCurrencyEdit
        Left = 5
        Top = 112
        Width = 111
        Height = 21
        AutoSize = False
        DecimalPlaces = 4
        DisplayFormat = 'R$ 0.00;'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 6
        OnEnter = Edit1Enter
        OnExit = Edit1Exit
        OnKeyDown = Edit1KeyDown
      end
      object edDataVencimento: TDateEdit
        Left = 127
        Top = 112
        Width = 89
        Height = 21
        NumGlyphs = 2
        TabOrder = 7
        OnEnter = Edit1Enter
        OnExit = Edit1Exit
        OnKeyDown = Edit1KeyDown
      end
      object edMulta: TCurrencyEdit
        Left = 447
        Top = 112
        Width = 89
        Height = 21
        AutoSize = False
        DecimalPlaces = 4
        DisplayFormat = 'R$ 0.00;'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 10
        OnEnter = Edit1Enter
        OnExit = Edit1Exit
        OnKeyDown = Edit1KeyDown
      end
      object ckbMulta: TCheckBox
        Left = 542
        Top = 112
        Width = 31
        Height = 25
        Caption = '%'
        TabOrder = 11
        OnEnter = Edit1Enter
        OnExit = Edit1Exit
        OnKeyDown = Edit1KeyDown
      end
      object edMora: TCurrencyEdit
        Left = 572
        Top = 112
        Width = 59
        Height = 21
        AutoSize = False
        DecimalPlaces = 4
        DisplayFormat = '0.00;'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 12
        OnEnter = Edit1Enter
        OnExit = Edit1Exit
        OnKeyDown = Edit1KeyDown
      end
      object ckbMora: TCheckBox
        Left = 633
        Top = 112
        Width = 31
        Height = 24
        Caption = '%'
        TabOrder = 13
        OnEnter = Edit1Enter
        OnExit = Edit1Exit
        OnKeyDown = Edit1KeyDown
      end
      object edDesconto: TCurrencyEdit
        Left = 663
        Top = 112
        Width = 66
        Height = 21
        AutoSize = False
        DecimalPlaces = 4
        DisplayFormat = '0.00;'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 14
        OnEnter = Edit1Enter
        OnExit = Edit1Exit
        OnKeyDown = Edit1KeyDown
      end
      object ckbDesconto: TCheckBox
        Left = 734
        Top = 112
        Width = 31
        Height = 22
        Caption = '%'
        TabOrder = 15
        OnEnter = Edit1Enter
        OnExit = Edit1Exit
        OnKeyDown = Edit1KeyDown
      end
      object edDiasDesconto: TCurrencyEdit
        Left = 762
        Top = 112
        Width = 54
        Height = 21
        Alignment = taCenter
        AutoSize = False
        DecimalPlaces = 4
        DisplayFormat = '00;'
        TabOrder = 16
        OnEnter = Edit1Enter
        OnExit = Edit1Exit
        OnKeyDown = Edit1KeyDown
      end
      object edNumeroParcelas: TCurrencyEdit
        Left = 820
        Top = 111
        Width = 58
        Height = 21
        Alignment = taCenter
        AutoSize = False
        DecimalPlaces = 4
        DisplayFormat = '00;'
        TabOrder = 17
        Value = 1.000000000000000000
        OnEnter = Edit1Enter
        OnExit = Edit1Exit
        OnKeyDown = Edit1KeyDown
      end
      object edDataRD: TDateEdit
        Left = 333
        Top = 112
        Width = 90
        Height = 21
        NumGlyphs = 2
        TabOrder = 9
        OnEnter = Edit1Enter
        OnExit = Edit1Exit
        OnKeyDown = Edit1KeyDown
      end
      object edDataDocumento: TDateEdit
        Left = 231
        Top = 112
        Width = 89
        Height = 21
        NumGlyphs = 2
        TabOrder = 8
        OnEnter = Edit1Enter
        OnExit = Edit1Exit
        OnKeyDown = Edit1KeyDown
      end
    end
    object PageControl1: TPageControl
      Left = 3
      Top = 250
      Width = 451
      Height = 244
      ActivePage = TabSheet1
      TabOrder = 3
      object TabSheet1: TTabSheet
        Caption = '    Parcelas     '
        object DBGrid1: TDBGrid
          Left = 3
          Top = 3
          Width = 440
          Height = 214
          DataSource = dsParcelas
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          OnDrawColumnCell = DBGrid1DrawColumnCell
          Columns = <
            item
              Expanded = False
              FieldName = 'numeroControle'
              ReadOnly = True
              Title.Caption = 'Parcela'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -16
              Title.Font.Name = 'MS Sans Serif'
              Title.Font.Style = [fsBold]
              Width = 72
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'dataVencimento'
              Title.Caption = 'Vencimento'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -16
              Title.Font.Name = 'MS Sans Serif'
              Title.Font.Style = [fsBold]
              Width = 105
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'diaSemana'
              ReadOnly = True
              Title.Caption = 'Dia'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -16
              Title.Font.Name = 'MS Sans Serif'
              Title.Font.Style = [fsBold]
              Width = 143
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'valorParcela'
              Title.Caption = 'Valor'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -16
              Title.Font.Name = 'MS Sans Serif'
              Title.Font.Style = [fsBold]
              Width = 95
              Visible = True
            end>
        end
      end
    end
    object Panel7: TPanel
      Left = 455
      Top = 273
      Width = 429
      Height = 221
      TabOrder = 4
      StyleElements = []
      object Label22: TLabel
        Left = 6
        Top = 165
        Width = 101
        Height = 13
        Caption = 'Observa'#231#245'es RD:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        StyleElements = []
      end
      object Label23: TLabel
        Left = 245
        Top = 160
        Width = 46
        Height = 13
        Caption = 'Total RD:'
        StyleElements = []
      end
      object Panel2: TPanel
        Left = 2
        Top = 3
        Width = 423
        Height = 40
        TabOrder = 0
        StyleElements = []
        object bt_pesq_grupo: TSpeedButton
          Left = 69
          Top = 16
          Width = 24
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
          OnClick = botao_pesquisaClick
        end
        object Label19: TLabel
          Left = 9
          Top = 1
          Width = 39
          Height = 13
          Caption = 'Grupo:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          StyleElements = []
        end
        object Label43: TLabel
          Left = 96
          Top = 0
          Width = 114
          Height = 13
          Caption = 'Descri'#231#227'o do Grupo'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          StyleElements = []
        end
        object Label20: TLabel
          Left = 297
          Top = 1
          Width = 34
          Height = 13
          Caption = 'Valor:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          StyleElements = []
        end
        object Panel4: TPanel
          Tag = 99
          Left = 93
          Top = 12
          Width = 209
          Height = 27
          BevelOuter = bvNone
          Enabled = False
          TabOrder = 0
          StyleElements = []
          object ed_desc_grupo: TEdit
            Left = 3
            Top = 4
            Width = 202
            Height = 21
            CharCase = ecUpperCase
            Color = clBlack
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clYellow
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            MaxLength = 3
            ParentFont = False
            TabOrder = 0
          end
        end
        object btAdicionar: TBitBtn
          Left = 377
          Top = 7
          Width = 40
          Height = 32
          Glyph.Data = {
            36030000424D3603000000000000360000002800000010000000100000000100
            18000000000000030000EB0A0000EB0A00000000000000000000FFFFFFFFFFFF
            FFFFFFFFFFFFF7F7F7E9E9E9DEDEDED9D9D9D9D9D9DEDEDEE8E8E8F6F6F6FEFE
            FEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCFCFCEBEBEBC8C8C89D9D9D7E7E7E71
            71717171717C7C7C9A9A9AC4C4C4E9E9E9FCFCFCFFFFFFFFFFFFFFFFFFFCFCFC
            E5E5E59FAB9F518351217217146C02146A01206B14477647616A61737373A9A9
            A9E2E2E2FCFCFCFFFFFFFFFFFFECECEC7CA97C0A81090990000794000A8F0016
            86002C7700386A001B6905567A56696969A8A8A8E8E8E8FFFFFFF8F8F889B889
            048D0705A40A049F0933CC6666FF9966FF9966FF990B89003B6D01276B02567A
            56737373C4C4C4F7F7F7D1E0D1138E170BA8170AA3160AA315539B51FFF8FFFF
            F7FF66FF990099000191003B6C001B6B056169619A9A9AE8E8E86CAB6C2AB138
            0FA92311AA2310A922539B51FFF9FFFFFAFF66FF99029B06009A001089003A6C
            014776477C7C7CDEDEDE30983039C05033CC6666FF9966FF9933CC66F9F4F9FE
            F7FC66FF9966FF9966FF9966FF99357501206F14717171DADADA1D982343C55E
            539B51FCE9F9F0E4ECF1EBF0F1EFF1F5F3F4FFF8FCFFF8FFFFF4FF66FF991D83
            00146D00717171DADADA209C2659D077539B51FDECFDF2E9F2F0EBF0ECEBECEF
            EEEFF8F3F8FFF8FFFFF5FF66FF99118E00126E007D7D7DDEDEDE36A3387ADF9A
            539B51539B51539B518EC18EF1EBF1F2ECF133CC66539B51539B5133CC661195
            042175179D9D9DE9E9E979BD7971D78E51D47C2ECA602FC960539B51F2E8F2F0
            E4ED66FF9914AD2B0EA72007A312139106508450C8C8C8F7F7F7E7F5E731AA36
            8CE8B03ACF6D2FCB64539B51FEECFEFCE7F766FF9916AF2E11AA220AA9181084
            0B9FAC9FEBEBEBFFFFFFFFFFFFAADFAA3FB84F8AE9B04CD57B219827539B5153
            9B5133CC6616B02F12B02707920C7CAA7CE5E5E5FCFCFCFFFFFFFFFFFFFFFFFF
            AADFAA31AB3775DB9476E19D50D2783BC65F30C05024B23911911589BA89ECEC
            ECFCFCFCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE7F5E779BD793BA73C25A22C22
            9E28329D336CAE6CD1E1D1F8F8F8FFFFFFFFFFFFFFFFFFFFFFFF}
          TabOrder = 3
          OnClick = btAdicionarClick
        end
        object edValor: TCurrencyEdit
          Left = 299
          Top = 14
          Width = 76
          Height = 21
          AutoSize = False
          DisplayFormat = 'R$ 0.00;'
          TabOrder = 2
          OnEnter = Edit1Enter
          OnExit = Edit1Exit
          OnKeyDown = Edit1KeyDown
        end
        object ed_cod_grupo: TEdit
          Left = 8
          Top = 18
          Width = 58
          Height = 21
          CharCase = ecUpperCase
          TabOrder = 1
          OnEnter = Edit1Enter
          OnExit = Edit1Exit
          OnKeyDown = Edit1KeyDown
        end
      end
      object DBGrid3: TDBGrid
        Left = -2
        Top = 47
        Width = 421
        Height = 103
        DataSource = dm.dsLancamentosRDTemp
        PopupMenu = PopupMenu1
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
            FieldName = 'descricao'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            Title.Caption = 'Descri'#231#227'o'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -13
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 281
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'valor'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            Title.Caption = 'Valor'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -13
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 109
            Visible = True
          end>
      end
      object memoObs: TMemo
        Left = 4
        Top = 180
        Width = 421
        Height = 34
        TabOrder = 2
      end
      object Panel8: TPanel
        Left = 293
        Top = 151
        Width = 126
        Height = 25
        Caption = 'Panel8'
        TabOrder = 3
        StyleElements = []
        object edTotalRD: TCurrencyEdit
          Left = 3
          Top = 2
          Width = 117
          Height = 21
          AutoSize = False
          Color = 12615680
          DisplayFormat = 'R$ 0.00;'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clYellow
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          OnEnter = Edit1Enter
          OnExit = Edit1Exit
          OnKeyDown = Edit1KeyDown
        end
      end
    end
    object Panel10: TPanel
      Tag = 99
      Left = 454
      Top = 248
      Width = 427
      Height = 25
      Caption = 'Panel10'
      Color = 12615680
      ParentBackground = False
      TabOrder = 5
      StyleElements = []
      object Label17: TLabel
        Left = 119
        Top = 4
        Width = 231
        Height = 16
        Caption = 'Detalhamento da despesa no RD'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
        StyleElements = []
      end
    end
  end
  inherited pn_botoes: TPanel
    Top = 496
    Width = 891
    Height = 55
    BevelOuter = bvNone
    Color = clWhite
    ParentBackground = False
    StyleElements = []
    ExplicitTop = 496
    ExplicitWidth = 893
    ExplicitHeight = 55
    inherited bt_novo: TBitBtn
      Top = 6
      Width = 215
      Height = 47
      Caption = 'Novo t'#237'tulo'
      Glyph.Data = {
        F6060000424DF606000000000000360000002800000018000000180000000100
        180000000000C0060000EB0A0000EB0A00000000000000000000F9F9F9E6E6E6
        DDDDDDDCDCDCDEDEDEE0E0E0E1E1E1E4E4E4E6E6E6E7E7E7E9E9E9ECECECEDED
        EDEFEFEFF1F1F1F4F4F4F5F5F5F7F7F7F9F9F9FCFCFCFDFDFDFFFFFFFFFFFFFF
        FFFFE6E6E69B9B9B7B7B7B7979797D7D7D8383838888888D8D8D939393989898
        9E9E9EA3A3A3A8A8A8AEAEAEB3B3B3B9B9B9BEBEBEC3C3C3C9C9C9CECECED4D4
        D4D9D9D9E4E4E4F9F9F9BB9393B28484986D6D936969906C6C906E6E8F70708F
        73738D75758A75758876768677778376768277777E75757C7575787474757272
        7270706F6D6D6F6F6F737373969696E4E4E4B68484D4A3A3FFFFFFFFFFFFFCE3
        E3FDF3F3F6E9E9E8CACAEAD7D7E4CDCDD6B2B2D8BCBCD2B3B3C49C9CC6A1A1BE
        9696B68A8AB48988A97A7B99747B997176A07273747474DBDBDBB78484D6A3A3
        FFE8E8FBE2E2F7D2D2F9E0E0FADFDFF3CFCFF8DCDCF7DCDCF1CACAF7DCDCF7DB
        DBEFC8C8FADEDEF5D8D8F3D4D4FFE8E8E6C9CDA4C9F99DCCFF996F72717171DA
        DADAB88585D8A5A5FFFFFFFFFCFCFBE3E3FFFAFAFFF9F9F8DFDFFFF8F8FFF7F7
        F6DBDBFFF5F5FFF4F4F3D6D6FEEEEEF8DFDFF2D4D4FAE2E2E2C1C5B4BFDFB6C0
        E19B6C6D707070D9D9D9B88686DAA6A6FFEBEBFCE6E6F9D5D5FBE2E2FAE1E1F5
        D0D0F8DEDEF8DDDDF1CBCBF6DBDBF5D9D9EDC6C6F4D8D8EFCFCFECC8C8F3D4D4
        E1BDBFBBBFD9BDC2DF9B6B6D707070D9D9D9B98787DCA9A9FFFDFDFFF7F7FBE1
        E1FFF6F6FFF7F7F9DFDFFFF8F8FFF7F7F7DCDCFFF6F6FFF5F5F5D8D8FFF5F5FB
        E9E9F7DFDFFFF4F4E7CFD3B3D7FFB5DCFF9B6E6F707070D9D9D9BA8888E0ADAD
        FFF2F2FDECECFDEAEAFCE7E7FCE6E5FFE7E3FFE6E0FFE1DEF9DFDEFCDDDBFFE1
        D9FFDFD7FFDED6FEDCD4FDDAD2F9D7D2F0CFCEE9CFD1EED4D89E6D6C707070D9
        D9D9BD8B8BE1B0B0FFFFFFFFFBFBFFFAFAFFFAFAFFFDF9AFC6FA6496FD9CB9FB
        FFFDF5BBC9F9618BFD668BFD6487FB6283FB5B7AFC97A4F8FFF6F0FFEFEFFFF9
        F99F6F6F707070D9D9D9BE8B8BE5B1B1FFFFFFFFFBFBFFFAFAFFF9F9FFFFF97D
        A8FC075DFF6094FCFFFEF5DEDFF60047FF054DFF0345FE003AFF002BFF5272F9
        FFF7EFFFEEEEFFF8F89E6E6E707070D9D9D9BD8A8AE7B3B3FFFFFFFFFCFCFFFB
        FBFFFAFAFFFFF983B0FC126BFF679BFDFFFDF6FFFCF59AB3F9004AFF0F51FFA9
        B6F7FFFFF0FFFBF0FFF0EFFFEFEFFFF9F99E6E6E707070D9D9D9BD8B8BE9B6B6
        FFFFFFFFFDFDFFFDFCFFFFFBFFFFFA87B6FC1572FF69A1FCFFFEF7FFF7F6FFFF
        F5E0E5FA83A6FE799AFF95ADFDFFFAF8FFF7F7FFF0F0FFFAFA9E6F6F707070D9
        D9D9BE8C8CEBB8B8FFFFFFFFFEFEFFFFFD75AFFD68AAFD76AFFD1C7BFF6CA5FC
        FFFFF8FFF8F7F6F4FA2199271E9B3017922D168D2C198B2D158717FFF7F7FFFC
        FC9E6F6F707070D9D9D9BF8D8DEFBBBBFFFFFFFFFEFEFFFFFE8CBFFE1682FE23
        88FF2182FF6CA8FDFFFFF9C9D7F97AA5FF0F9A1C75F4A642E27A44E17B43E07D
        108D1CFFF8F8FFFBFB9E6F6F707070D9D9D9C08E8EF3BDBDFFFFFFFFFFFFFFFF
        FEFFFFFEEFF5FD429BFE197FFF67A7FEFFFFFAFFFFF9ACC8FE0E9A1B7CF2A640
        DD7443DC7642DC790F8D1AFFFBFBFFFDFD9E6F6F707070D9D9D9C18F8FF5C1C1
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF2FAFF9AC7FFC9E0FFFFFFFFFFFFFEFFFF
        FE119F1B85F6AD43E17845DE7847DF7C0E8F19CAC6C6FFFFFFA06F6F707070D9
        D9D9C29090F8C3C3FFFFFFFFFFFFC4C4C4FFFFFFEBEBEB848280FFFFFECAC6C5
        919191FFFEFED1CFCF0E9B188FF7B548E57C49E37D4AE27E0D8E178F9090F8F4
        F4CBB1B1767676DCDCDCC29191FAC5C5FFFFFFD5D5D5111111B9B9B9E6E6E62D
        2D2DA7A6A6FEFEFE189A1D0D9E141CA92B1DA93167F3994FE9834CE67F4AE27E
        1690270E9A190B95131B991C9A9A9AE8E8E8C49191FFCCCCFFFFFFFFFFFFD4D7
        D73B3D3DFFFFFFDDD6D6373A3AEDDBDBE4D8D816981B6BE78A93FFC051F18853
        EC864FE8824DE78151EF8B3AD46516981ACBC0C0D3D3D3FAFAFAC39292D8A2A2
        B79191AC8080A67777404242926D6D937070414444947E7E8C7A7A9EA1A11F9D
        235FE07A84FEB153F08852EC8653ED8A3AD2601B9A1FB3B3B3C0C0C0F4F4F4FF
        FFFFFAF3F3C5BFBF686A6A9D9B9B999A9A4C4D4D838484909191505151838383
        898989595959C2C2C21C9C225BDC7685FDB258F6913BD6621B9C20AEAEAEB1B1
        B1EDEDEDFEFEFEFFFFFFFFFFFFF4F4F4818383ABABAB898A8A62626290909074
        7474747474818181636363989898686868B9B9B921A1265DE17A59E37B1F9E24
        C8C8C8C9C9C9F4F4F4FEFEFEFFFFFFFFFFFFFFFFFFFFFFFFDFDFDF7A7A7A7F7F
        7FC6C6C6A2A2A2ADADADE7E7E7C7C7C7DFDFDFF9F9F9F3F3F3FDFDFDFFFFFF24
        A32921A226E4E4E4F8F8F8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
      Layout = blGlyphLeft
      NumGlyphs = 1
      ExplicitTop = 6
      ExplicitWidth = 215
      ExplicitHeight = 47
    end
    inherited bt_alterar: TBitBtn
      Left = 209
      Top = -47
      Width = 104
      Visible = False
      ExplicitLeft = 209
      ExplicitTop = -47
      ExplicitWidth = 104
    end
    inherited bt_gravar: TBitBtn
      Left = 226
      Top = 6
      Width = 215
      Height = 47
      Caption = 'Gravar Lan'#231'amento'
      Glyph.Data = {
        F6060000424DF606000000000000360000002800000018000000180000000100
        180000000000C0060000EB0A0000EB0A00000000000000000000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFCFCFCEDEDEDDFDFDFE1E1E1F1F1F1FDFDFDFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBFBFBE1E1E1ABABAB838383858585
        B6B6B6E7E7E7FDFDFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBFBFBDFDFDF6FA36F13
        8B161887195E775E707070B0B0B0E6E6E6FCFCFCFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBFBFBDEDE
        DE64AA640B9E1716B22D15B02A0A910F5C785C6E6E6EAEAEAEE6E6E6FCFCFCFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FAFAFADEDEDE61AB610DA41B18B23015AE2912AB2614B02909920F5B7A5B6E6E
        6EAEAEAEE6E6E6FCFCFCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFAFAFADDDDDD60AD600EA71E1CB63816AF2E15AE2C14AD2A14AD27
        14B12909910F5B7A5B6D6D6DADADADE5E5E5FCFCFCFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFCFCFCDEDEDE5EAF5E11AB231DB63C19B23518B13217
        B02F11AD2A11AD2713AC2815B02A09930F5A7A5A6D6D6DADADADE5E5E5FCFCFC
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEBEBEB5FB85F12B02621BA431DB6
        391CB53719B3361EB63A5ACA703FBE540EAD2513AC2916B22D0A94115A7A5A6D
        6D6DACACACE5E5E5FCFCFCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF76CB7C21B838
        22BC4520B9401DB63D1DB63C19B83A0094010083005CCC704DC4600CAC2514AE
        2915B12B0A94105A7B5A6D6D6DACACACE4E4E4FCFCFCFFFFFFFFFFFFFFFFFFFF
        FFFF23B33660D17E1BB94220B94220B9421CBB40009B00816352BB7C82008A00
        59CA6D4DC4600CAB2514AD2A17B32D0994115A7C5A6C6C6CABABABE4E4E4FCFC
        FCFFFFFFFFFFFFFFFFFF54C16270D58A34C1561EBB421EBE43009F00846855C5
        858FC0848BB88282008B0059C96D4EC4620EAD2614AD2B16B22E099610597D59
        6C6C6CABABABE4E4E4FCFCFCFFFFFFFFFFFFE4F8E730BA4461CE7753D17300A6
        10896B5BCA8A93BE898ABC8989C4898FBF8889008B0057C96C4EC4630EAD2715
        AF2B17B3300A9712597D596B6B6BAAAAAAE4E4E4FCFCFCFFFFFFFFFFFFF0F9F1
        85D18D469543906E61CD8E96C38E8FC28F8FC28F8FC28E8FC88D92C18C8D008C
        0056C96A4DC3610EAC2715AE2C17B32E0A9713597D596B6B6BAEAEAEEDEDEDFF
        FFFFFFFFFFF3F3F3BBA6AAAD6A76CD9398C79394C89595CA9797CE9B9BDCB6B6
        D0A3A3CD9196C68F90008D0054C86A4DC5630FAE2815AE2D18B431099712597F
        597D7D7DDADADAFEFEFEFFFFFFDCCBCBAB7878CB9898CA9797CA9797CD9A9AD6
        A3A3A37272976969DFC1C1D7ADAED09499C99192008C0053C8684EC5640FAE29
        16B02D17B4320C92127B7E7BD9D9D9FEFEFEFFFFFFC19797DAB2B2C99595CD9A
        9AD29F9FDBA8A8AC7979B2A2A2DCD5D5A27171E4C5C5D9AEAFD2969BCA939300
        8E0053C8684FC5660EAE2818B5330D96139FA39FE9E9E9FFFFFFFFFFFFD0B0B0
        D5B2B2D5A7A7D39F9FDDA9A9AF7D7DB6A7A7E8E8E8FDFDFDF2E9E9A47474E7C6
        C6DAAEAED2969BC89393008E004AC76266D37E0EA722589858CBCBCBF8F8F8FF
        FFFFFFFFFFFBF6F6B58A8AD8B3B3EBC5C5B68383C0AFAFE9E9E9FDFDFDFFFFFF
        FFFFFFF2E8E8A47575E9C8C8D9AEAED1959AC59190148F0E0193014A82436A6B
        6AB4B4B4ECECECFEFEFEFFFFFFFFFFFFFBF8F8DABDBDC9A5A5E0CFCFF4F4F4FD
        FDFDFFFFFFFFFFFFFFFFFFFFFFFFF3E9E9A87777E5C7C7D6ABACCB9295D48F9C
        D48B9BA4616F706769777777BEBEBEF4F4F4FFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF2E8E8A97878E5
        C5C5D3A7A7C48F8FBF8C8CBD8A8A996A6A726B6B8E8E8EE4E4E4FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFF2E7E7AA7A7AE1C2C2CFA3A3BF8A8ABA8787B98686926D6D888888E2
        E2E2FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF1E6E6AC7A7AE0BFBFC99D9DBA8484B986
        869A6F6FB0B0B0EFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF1E7E7AD7C7C
        D9B9B9D1ABABAE7979B09D9DE3E3E3FCFCFCFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFEFE6E6B08282A97979CAB1B1EDEDEDFCFCFCFFFFFF}
      Layout = blGlyphLeft
      NumGlyphs = 1
      ExplicitLeft = 226
      ExplicitTop = 6
      ExplicitWidth = 215
      ExplicitHeight = 47
    end
    inherited bt_cancelar: TBitBtn
      Left = 451
      Top = 6
      Width = 215
      Height = 47
      Layout = blGlyphLeft
      ExplicitLeft = 451
      ExplicitTop = 6
      ExplicitWidth = 215
      ExplicitHeight = 47
    end
    inherited bt_sair: TBitBtn
      Left = 676
      Top = 6
      Width = 215
      Height = 47
      Glyph.Data = {
        F6060000424DF606000000000000360000002800000018000000180000000100
        180000000000C0060000130B0000130B00000000000000000000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEF1F1F1E3E3E3E6E6E6F2F2
        F2FCFCFCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF3F3F3C2C2C2
        8E8E8E939393B6B6B6D6D6D6EAEAEAF7F7F7FEFEFEFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7F7F7E2E2E2DCDCDCDE
        DEDEC1B0B0885C5C876969756D6D6666667D7D7DA0A0A0C6C6C6E0E0E0F1F1F1
        FCFCFCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9F9F9D2D2
        D28F8F8F797979808080987D7DC18E8E9663638A57578156567E6B6B6A66666D
        6D6D8C8C8CB3B3B3D7D7D7F2F2F2FEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFE6E6E6797979747474737373717272756464C89595A06C6CA26F6FA06D
        6D905D5D804D4D826060766B6B666565858585C6C6C6F5F5F5FFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFB1B1B18383836E6D6E90898CB3ACB1A19093C99494
        A16D6DA26F6FA37070A26F6FA37070986565855353684D4D6C6C6CA0A0A0EBEB
        EBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA7A7A78F8F8F716A6F57D48062
        EF9073BE84CE9799A47171A47171A47171A37070A47171A37070A67272835757
        656666969696E7E7E7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA4A4A49292
        927369704DD3794BED815DBD74D49AA0A57272A77474A67373A67373A57272A4
        7171A67171865A5A666767939393E6E6E6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFA2A2A2969696746A7246CE7344E3795BB770DBA0A6A77373A97676A875
        75A67474A87474A67373A773738A5E5E666868909090E5E5E5FFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFA2A2A2999999776D743DCC6D3BDA7059B06BDEA6AB
        AB7777AC7878A37171A37272A77676A87575A975758F61616768688E8E8EE4E4
        E4FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9F9F9F9C9C9C766C7330C4602C
        CF6153A961E1A7ACAC7676A58D8D8B89899C7373A77575AC7979AB7777936464
        676A6A8C8C8CE4E4E4FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9E9E9EA0A0
        A0736B6D96F7F396FFF897C5BFDFA9AAB58A8AD2D8D8D4D8D8A68B8BAE7A7AAD
        7A7AAC79799969696A6C6C8A8A8AE2E2E2FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFF9E9E9EA1A1A16D6969C6FFFFC7FFFFBACACAE0AEAEB17D7DD3C7C7CCCB
        CBB08484B07D7DAF7C7CAE7B7B9C6B6B6B6E6E888888E1E1E1FFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFF9B9B9BA7A7A76A6969F6FFFFF3FFFFD4C9C9E0B2B2
        B27F7FB47F7FB47E7EB38080B27F7FB17E7EB07D7DA06E6E6C6F6F858585E1E1
        E1FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF999999A9A9A96B6B6BFFFFFFFF
        FFFCE0C7C6E1B4B4B78383B78484B68383B58282B48181B38080B27F7FA67171
        6D7171838383E0E0E0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF999999ADAD
        AD6F6E6FFFFFF6FFF9EFE0C5C0E3B6B7B88484B98686B98686B78484B68383B5
        8282B48181A97373707272818181DFDFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFF989898AEAEAE747575FFF8E9FFF2E4E2C1BAE5BABAB98686BE8A8AB883
        83B88484B68282B58282B48181AE76767073737F7F7FDEDEDEFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFF989898AFAFB0787979FFF3DDFFEEDAE3BFB5E8BFC0
        BA8585F1CFCFF9DBDBECC7C7E0B3B3D4A3A3C39191AE79797174747D7D7DDEDE
        DEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9B9B9BB3B3B37E7F7EFFECD1FF
        E7CEE4BDB0EAC0C2BC8686EDD3D3FFF0F0FFE9E9FFE3E3FFE0E0EABCBCAF7979
        7473737B7B7BDDDDDDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9B9B9BB3B3
        B384817FFFE4C3FFE1C0E6BBABEBC3C4C18B8BE1C9C9FFF2F2FFF1F1FFEAEAFF
        E4E4E7B9B9B17B7B777575787878DCDCDCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFF9C9C9CB5B5B58B8682FFE3B6FFDFB3EABBA9EEC5C6C38E8EC18B8BBA83
        83BA8686C29090CA9B9BC69595B57F7F777676777777DCDCDCFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFF9E9E9EB6B6B786868685817B87837DB69592F6CDCD
        DBB0B0D9AEAED5A6A6CC9F9FC39292BD8989BB8787B881817B78787E7E7EDEDE
        DEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA0A0A0C9C9C9ABACACA8A8A9A3
        A4A4A19F9FA39A9AA39696A29191A59191A79090AC9393AE9393AF9191A28080
        7B7A7AAAAAAAEBEBEBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB7B7B7A3A3
        A39F9F9F9F9F9F9D9D9D999A9A9697979696969394949192928F90908E8F8F86
        8989868888898A8AA5A5A5EBEBEBFBFBFBFFFFFFFFFFFFFFFFFF}
      Layout = blGlyphLeft
      NumGlyphs = 1
      ExplicitLeft = 676
      ExplicitTop = 6
      ExplicitWidth = 215
      ExplicitHeight = 47
    end
    inherited bt_excluir: TBitBtn
      Left = 313
      Top = -47
      Width = 104
      Visible = False
      ExplicitLeft = 313
      ExplicitTop = -47
      ExplicitWidth = 104
    end
    inherited bt_consultar: TBitBtn
      Left = 105
      Top = -47
      Width = 104
      Visible = False
      ExplicitLeft = 105
      ExplicitTop = -47
      ExplicitWidth = 104
    end
    inherited bt_imprimir: TBitBtn
      Left = 526
      Top = -58
      Width = 176
      Height = 47
      Visible = False
      ExplicitLeft = 526
      ExplicitTop = -58
      ExplicitWidth = 176
      ExplicitHeight = 47
    end
  end
  object tbParcelas: TRxMemoryData
    FieldDefs = <>
    Left = 724
    Top = 16
    object tbParcelasdataVencimento: TDateField
      FieldName = 'dataVencimento'
      DisplayFormat = 'DD/MM/YYY'
    end
    object tbParcelasdescricaoConta: TStringField
      FieldName = 'descricaoConta'
      Size = 50
    end
    object tbParcelasnumeroControle: TStringField
      FieldName = 'numeroControle'
      Size = 8
    end
    object tbParcelasvalorParcela: TCurrencyField
      FieldName = 'valorParcela'
    end
    object tbParcelasvalorMulta: TCurrencyField
      FieldName = 'valorMulta'
    end
    object tbParcelasvalorMora: TFloatField
      FieldName = 'valorMora'
    end
    object tbParcelasvalorDesconto: TFloatField
      FieldName = 'valorDesconto'
    end
    object tbParcelasflagMulta: TSmallintField
      FieldName = 'flagMulta'
    end
    object tbParcelasflagMora: TSmallintField
      FieldName = 'flagMora'
    end
    object tbParcelasflagDesconto: TSmallintField
      FieldName = 'flagDesconto'
    end
    object tbParcelasdiasDesconto: TIntegerField
      FieldName = 'diasDesconto'
    end
    object tbParcelasdiaSemana: TStringField
      FieldName = 'diaSemana'
      Size = 16
    end
    object tbParcelasparcela: TStringField
      FieldName = 'parcela'
      Size = 5
    end
    object tbParcelasCodLancRD: TStringField
      FieldName = 'CodLancRD'
      Size = 8
    end
  end
  object dsParcelas: TDataSource
    DataSet = tbParcelas
    Left = 756
    Top = 16
  end
  object PopupMenu1: TPopupMenu
    Left = 199
    Top = 59
    object Excluir1: TMenuItem
      Caption = 'Excluir'
      OnClick = Excluir1Click
    end
  end
end
