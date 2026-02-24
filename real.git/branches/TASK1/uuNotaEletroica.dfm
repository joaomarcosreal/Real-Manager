inherited frmNotaFiscalEletronica: TfrmNotaFiscalEletronica
  Left = 130
  Top = 32
  Caption = 'frmNotaFiscalEletronica'
  ClientHeight = 659
  ClientWidth = 1095
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited pn_principal: TPanel
    Width = 1095
    Height = 599
    inherited pn_codigo: TPanel
      Left = 2
      Width = 95
      Height = 61
      Align = alNone
      BevelInner = bvRaised
      BevelOuter = bvLowered
      inherited bt_pesquisa: TSpeedButton
        Left = 70
        Top = 25
        Height = 21
      end
      object lbl1: TLabel [1]
        Left = 4
        Top = 11
        Width = 69
        Height = 13
        Caption = 'N'#186' do Registro'
      end
      inherited ed_codigo: TMaskEdit
        Left = 2
        Top = 25
        Width = 66
      end
    end
    object rg1: TRadioGroup
      Left = 98
      Top = 3
      Width = 116
      Height = 60
      Caption = 'Natureza'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ItemIndex = 0
      Items.Strings = (
        'Venda'
        'Transfer'#234'ncia'
        'Devolu'#231#227'o')
      ParentFont = False
      TabOrder = 1
    end
    object pnl3: TPanel
      Left = 4
      Top = 65
      Width = 559
      Height = 92
      BevelInner = bvRaised
      BevelOuter = bvLowered
      Color = 10930928
      TabOrder = 2
      object lbl4: TLabel
        Left = 7
        Top = 45
        Width = 34
        Height = 13
        Caption = 'Chave:'
      end
      object lbl5: TLabel
        Left = 7
        Top = 5
        Width = 36
        Height = 13
        Caption = 'Nota n'#186
      end
      object lbl6: TLabel
        Left = 159
        Top = 4
        Width = 42
        Height = 13
        Caption = 'Emiss'#227'o:'
      end
      object lbl15: TLabel
        Left = 234
        Top = 3
        Width = 64
        Height = 13
        Caption = 'Hora emiss'#227'o'
      end
      object lbl16: TLabel
        Left = 311
        Top = 4
        Width = 59
        Height = 13
        Caption = 'Autoriza'#231#227'o:'
      end
      object lbl17: TLabel
        Left = 386
        Top = 3
        Width = 81
        Height = 13
        Caption = 'Hora autoriza'#231#227'o'
      end
      object lbl18: TLabel
        Left = 115
        Top = 4
        Width = 27
        Height = 13
        Caption = 'S'#233'rie:'
      end
      object lbl19: TLabel
        Left = 319
        Top = 46
        Width = 86
        Height = 13
        Caption = 'Situa'#231#227'o da Nota:'
      end
      object edt2: TEdit
        Left = 5
        Top = 18
        Width = 107
        Height = 21
        TabOrder = 0
        Text = '000000000000000'
      end
      object medt1: TMaskEdit
        Left = 159
        Top = 17
        Width = 70
        Height = 21
        TabOrder = 1
        Text = '25/03/2014'
      end
      object medt2: TMaskEdit
        Left = 233
        Top = 17
        Width = 70
        Height = 21
        TabOrder = 2
        Text = '14:30:55'
      end
      object medt3: TMaskEdit
        Left = 311
        Top = 17
        Width = 70
        Height = 21
        TabOrder = 3
        Text = '25/03/2014'
      end
      object medt4: TMaskEdit
        Left = 385
        Top = 17
        Width = 81
        Height = 21
        TabOrder = 4
        Text = '14:30:55'
      end
      object edt4: TEdit
        Left = 115
        Top = 17
        Width = 34
        Height = 21
        TabOrder = 5
        Text = '001'
      end
      object edt11: TEdit
        Left = 7
        Top = 61
        Width = 308
        Height = 21
        TabOrder = 6
      end
      object edt12: TEdit
        Left = 320
        Top = 60
        Width = 197
        Height = 21
        TabOrder = 7
      end
    end
    object grp1: TGroupBox
      Left = 214
      Top = 0
      Width = 349
      Height = 63
      Caption = 'Emissor'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 3
      object lbl2: TLabel
        Left = 80
        Top = 37
        Width = 260
        Height = 20
        AutoSize = False
        Caption = 'Emiss'#227'o:'
        Color = clBlack
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clYellow
        Font.Height = -16
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
      end
      object btn1: TSpeedButton
        Left = 53
        Top = 34
        Width = 23
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
        OnClick = bt_pesquisaClick
      end
      object lbl3: TLabel
        Left = 9
        Top = 21
        Width = 44
        Height = 13
        Caption = 'C'#243'digo:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lbl8: TLabel
        Left = 82
        Top = 22
        Width = 127
        Height = 13
        Caption = 'Descri'#231#227'o do Emissor:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object edt3: TEdit
        Left = 8
        Top = 35
        Width = 42
        Height = 24
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        Text = 'edt1'
      end
    end
    object grp2: TGroupBox
      Left = 564
      Top = 1
      Width = 524
      Height = 63
      Caption = 'Destinat'#225'rio'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 4
      object lbl9: TLabel
        Left = 9
        Top = 21
        Width = 44
        Height = 13
        Caption = 'C'#243'digo:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object btn2: TSpeedButton
        Left = 53
        Top = 34
        Width = 23
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
        OnClick = bt_pesquisaClick
      end
      object lbl10: TLabel
        Left = 82
        Top = 23
        Width = 74
        Height = 13
        Caption = 'Raz'#227'o social'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lbl11: TLabel
        Left = 84
        Top = 36
        Width = 377
        Height = 18
        AutoSize = False
        Caption = 'Emiss'#227'o:'
        Color = clBlack
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clYellow
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
      end
      object edt1: TEdit
        Left = 8
        Top = 35
        Width = 42
        Height = 24
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        Text = 'edt1'
      end
    end
    object grp5: TGroupBox
      Left = 6
      Top = 157
      Width = 1086
      Height = 439
      Caption = #205'tens da Nota Fiscal Eletr'#244'nica'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 5
      object lbl7: TLabel
        Left = 592
        Top = 392
        Width = 67
        Height = 16
        Caption = 'Produtos:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lbl12: TLabel
        Left = 717
        Top = 392
        Width = 99
        Height = 16
        Caption = 'Base do ICMS'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lbl13: TLabel
        Left = 962
        Top = 392
        Width = 96
        Height = 16
        Caption = 'Total da Nota'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lbl14: TLabel
        Left = 839
        Top = 392
        Width = 59
        Height = 16
        Caption = 'Vl. ICMS'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object dbgrd1: TDBGrid
        Left = 8
        Top = 83
        Width = 1069
        Height = 301
        DataSource = dm.dsComprasTemp
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        Options = [dgEditing, dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
        ParentFont = False
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clBlue
        TitleFont.Height = -16
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = [fsBold]
        Columns = <
          item
            Expanded = False
            FieldName = 'ordem'
            Title.Caption = #205'tem'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clBlack
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = []
            Width = 25
            Visible = True
          end
          item
            Color = clWhite
            Expanded = False
            FieldName = 'codigo'
            ReadOnly = True
            Title.Caption = 'C'#243'digo'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clBlack
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = []
            Width = 76
            Visible = True
          end
          item
            Color = clWhite
            Expanded = False
            FieldName = 'descricao'
            ReadOnly = True
            Title.Caption = 'Descri'#231#227'o'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clBlack
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = []
            Width = 267
            Visible = True
          end
          item
            Expanded = False
            Title.Caption = 'NCM'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clBlack
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = []
            Visible = True
          end
          item
            Color = 16776176
            Expanded = False
            FieldName = 'CFOP'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clBlack
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = []
            Width = 35
            Visible = True
          end
          item
            Color = clBtnFace
            Expanded = False
            FieldName = 'CST'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clBlack
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = []
            Width = 35
            Visible = True
          end
          item
            Color = clWhite
            Expanded = False
            FieldName = 'siglaUnidade'
            ReadOnly = True
            Title.Caption = 'Unidade'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clBlack
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = []
            Width = 90
            Visible = True
          end
          item
            Color = clYellow
            Expanded = False
            FieldName = 'quantidade'
            Title.Caption = 'Qtde'
            Title.Color = clYellow
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clBlack
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = []
            Width = 50
            Visible = True
          end
          item
            Color = clMoneyGreen
            Expanded = False
            FieldName = 'preco'
            Title.Caption = 'V. Unit.'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clBlack
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = []
            Width = 88
            Visible = True
          end
          item
            Color = clAqua
            Expanded = False
            FieldName = 'total'
            Title.Caption = 'V. Total'
            Title.Color = clAqua
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clBlack
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = []
            Width = 86
            Visible = True
          end
          item
            Color = 16776176
            Expanded = False
            FieldName = 'baseICMS'
            Title.Caption = 'Base ICMS'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clBlack
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = []
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'aliquotaICMS'
            Title.Caption = 'Aliq. ICMS'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clBlack
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = []
            Visible = True
          end
          item
            Color = clBtnFace
            Expanded = False
            FieldName = 'valorICMS'
            Title.Caption = 'Valor ICMS'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clBlack
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = []
            Visible = True
          end>
      end
      object pnl5: TPanel
        Left = 7
        Top = 26
        Width = 1077
        Height = 45
        BevelInner = bvRaised
        BevelOuter = bvLowered
        Caption = 'Hora'
        TabOrder = 1
        object lbl38: TLabel
          Left = 6
          Top = 4
          Width = 44
          Height = 13
          Caption = 'C'#243'digo:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object btn5: TSpeedButton
          Left = 63
          Top = 17
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
          OnClick = bt_pesquisaClick
        end
        object lbl39: TLabel
          Left = 94
          Top = 4
          Width = 166
          Height = 13
          Caption = 'Descri'#231#227'o do Produto / '#205'tem:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lbl40: TLabel
          Left = 487
          Top = 4
          Width = 60
          Height = 13
          Caption = 'Aliq. ICMS'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lbl42: TLabel
          Left = 563
          Top = 4
          Width = 29
          Height = 14
          Caption = 'CFOP'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lbl43: TLabel
          Left = 600
          Top = 4
          Width = 22
          Height = 14
          Caption = 'CST'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lbl44: TLabel
          Left = 556
          Top = 23
          Width = 25
          Height = 14
          Caption = 'NCM'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lbl45: TLabel
          Left = 634
          Top = 4
          Width = 25
          Height = 14
          Caption = 'NCM'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lbl46: TLabel
          Left = 738
          Top = 4
          Width = 44
          Height = 14
          Caption = 'Unidade'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lbl22: TLabel
          Left = 854
          Top = 3
          Width = 29
          Height = 14
          Caption = 'Qtde:'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lbl23: TLabel
          Left = 915
          Top = 4
          Width = 73
          Height = 14
          Caption = 'Valor unit'#225'rio'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object edt5: TEdit
          Left = 6
          Top = 17
          Width = 55
          Height = 24
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          Text = '00000'
        end
        object pnl6: TPanel
          Left = 90
          Top = 17
          Width = 759
          Height = 24
          BevelOuter = bvNone
          Enabled = False
          TabOrder = 1
          object edt6: TEdit
            Left = 4
            Top = 1
            Width = 389
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
          object CurrencyEdit1: TCurrencyEdit
            Left = 398
            Top = 1
            Width = 65
            Height = 21
            AutoSize = False
            Color = clBlack
            DisplayFormat = '0.00;'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clYellow
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 1
            OnKeyDown = Edit1KeyDown
          end
          object edt7: TEdit
            Left = 544
            Top = 1
            Width = 100
            Height = 21
            Hint = 
              'C'#243'digo Fiscal de Opera'#231#227'o e Presta'#231#227'o do '#237'tem na nota fiscal. Ca' +
              'so o '#237'tem n'#227'o '#13#10' possua o campo CFOP, favor prencher com o mesmo' +
              ' CFOP da nota fiscal indicado'#13#10' acima.'
            Color = clBlack
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clYellow
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            ParentShowHint = False
            ShowHint = True
            TabOrder = 2
            OnKeyDown = Edit1KeyDown
          end
          object edt9: TEdit
            Left = 470
            Top = 1
            Width = 35
            Height = 21
            Hint = 
              'C'#243'digo Fiscal de Opera'#231#227'o e Presta'#231#227'o do '#237'tem na nota fiscal. Ca' +
              'so o '#237'tem n'#227'o '#13#10' possua o campo CFOP, favor prencher com o mesmo' +
              ' CFOP da nota fiscal indicado'#13#10' acima.'
            Color = clBlack
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clYellow
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            ParentShowHint = False
            ShowHint = True
            TabOrder = 3
            Text = '5102'
            OnKeyDown = Edit1KeyDown
          end
          object edt8: TEdit
            Left = 508
            Top = 1
            Width = 33
            Height = 21
            Hint = 
              ' C'#243'digo da Situa'#231#227'o Tribut'#225'ria.'#13#10' Caso o '#237'tem da nota n'#227'o possoa' +
              ' o CST informado, favor deixar este campo em branco.'
            Color = clBlack
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clYellow
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            ParentShowHint = False
            ShowHint = True
            TabOrder = 4
            Text = '000'
            OnKeyDown = Edit1KeyDown
          end
          object edt10: TEdit
            Left = 648
            Top = 1
            Width = 110
            Height = 21
            Hint = 
              'C'#243'digo Fiscal de Opera'#231#227'o e Presta'#231#227'o do '#237'tem na nota fiscal. Ca' +
              'so o '#237'tem n'#227'o '#13#10' possua o campo CFOP, favor prencher com o mesmo' +
              ' CFOP da nota fiscal indicado'#13#10' acima.'
            Color = clBlack
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clYellow
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            ParentShowHint = False
            ShowHint = True
            TabOrder = 5
            OnKeyDown = Edit1KeyDown
          end
        end
        object EDIquantidade: TCurrencyEdit
          Left = 853
          Top = 18
          Width = 58
          Height = 21
          AutoSize = False
          DecimalPlaces = 3
          DisplayFormat = '0.0000;'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 2
          OnKeyDown = Edit1KeyDown
        end
        object EDIpreco: TCurrencyEdit
          Left = 916
          Top = 18
          Width = 101
          Height = 21
          AutoSize = False
          DecimalPlaces = 8
          DisplayFormat = 'R$ 0.00000000;'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 3
          OnKeyDown = Edit1KeyDown
        end
        object btn4: TBitBtn
          Left = 1026
          Top = 4
          Width = 46
          Height = 36
          TabOrder = 4
          Glyph.Data = {
            360C0000424D360C000000000000360000002800000020000000200000000100
            180000000000000C0000130B0000130B00000000000000000000FFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEF7F7F7EDED
            EDE4E4E4DFDFDFDCDCDCDCDCDCDEDEDEE4E4E4ECECECF6F6F6FDFDFDFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFDFDF2F2F2DFDFDFC6C6C6A8A8
            A89090908080807878787878787F7F7F8D8D8DA4A4A4C1C1C1DCDCDCF0F0F0FC
            FCFCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8F8F8E1E1E1B9B9B98592855F825F3E79
            3E237223136D13126D12206F203875385477546470646B6B6B868686B1B1B1DC
            DCDCF5F5F5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFF2F2F2CECECE819B813483340872021577012078
            002578002878002A77002974002570001A6E010A6C022779275C755C6666668D
            8D8DC6C6C6EEEEEEFDFDFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFF0F0F0B7BFB7478D47077802148401138B00108A000E89
            001285001A8100247900317000327000316F00306F002870010D6C02327B325F
            655F7B7B7BB9B9B9EBEBEBFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFF3F3F3ABBDAB1E7E1E038A01029D00009B000099000099000098
            000098000095000095000091001185002A7400386A00346D00326E00226D0110
            6E105E6D5E757575B9B9B9EEEEEEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFF9F9F9B6C9B6157E15029604029E06029C06029B05029B04019A030099
            020098010097000097000095000094000094000A8900336F00396B00346C002A
            6C00096C095E6E5E7B7B7BC6C6C6F6F6F6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FEFEFED8DFD8238523069A0C05A10C059E0C059E0C059E0C059E0B0AAC1549E0
            7637DF6734DD6435DD6539DF6841DF6D1BB32B0093000093002479003C680034
            6B002C6D01106E105F655F8D8D8DDCDCDCFCFCFCFFFFFFFFFFFFFFFFFFFFFFFF
            F4F4F458A1580B940F0CA61609A31209A21309A21308A11208A111049E088FC7
            8DF6F1F6EEEFEEF0F3F0FCF5F995F1B41FBA330095000092000093001E7B003B
            6800336C00206C00327B32656565B1B1B1F0F0F0FFFFFFFFFFFFFFFFFFFFFFFF
            B8D5B803850326B2320AA4170CA5190CA5190CA5190CA5190BA418059B0B92C7
            91FFF5FEF4F1F3F7F4F6FFF9FF97F1B41EBC3300980000960000940000950028
            7700396B00346E000C6D025D765D858585DCDCDCFEFEFEFFFFFFFFFFFFFAFAFA
            4CA24C22A62C1FAF2E0DA71F0FA81F0FA8200FA8200FA81F0EA71E07990F92C3
            92FDF5FDF2F2F2F5F5F5FFFAFF94F0B41EBE36029B0500990100960000940000
            9300386C00346D002A70012678266B6B6BC1C1C1F7F7F7FFFFFFFFFFFFDCE7DC
            06850647C35814AC2612AB2512AB2612AB2612AB2612AB2611AA2509901291BF
            90FEF7FEF3F3F3F6F6F6FFFCFF93EFB31EBF36049D0A029B0500990100960000
            9600128600396C00347101086E02647064A3A3A3ECECECFFFFFFFFFFFF9AC69A
            12981A54C5630FAB2615AE2C1ABA3723CA4A26CC4B29CD4D2ECD530DA42486B0
            83FBF5FBF2F2F2F5F5F5FFFBFF8CEDAC24C94A1DC1371DBF371EBE351EBD341C
            B32C009700347000327000196F005377538C8C8CE4E4E4FFFFFFFFFFFF65AA65
            29AC3856C76911AE2A18B1320278049CE3B796E0AF9AE4B3A1EDBAA6FAC5CBE1
            D0F5F2F5F1F1F1F4F4F4FEF7FCC0F1D296EEB39DEFB99EF0BA9FF2BA9FF2BA45
            E6720097001B81003370002472003776377D7D7DDEDEDEFFFFFFFFFFFF449C44
            3DBA505ECA7113B1311BB438027004F8E6F6ECE1E9ECE2E9EFE5ECF1E8EEF0EC
            EFEEEDEEF0F0F0F2F2F2F6F4F5FEF7FCFFF9FFFFF9FFFFF8FFFFF5FEFAF2F73D
            E36C009900078F003470002B76001D721D757575DCDCDCFFFFFFFFFFFF369736
            4AC46166CE7B19B5391EB73F027005F1E4F1E0DFE0E1E1E1E4E4E4E7E7E7E9E9
            E9ECECECEEEEEEF0F0F0F2F2F2F3F3F3F4F4F4F4F4F4F3F3F3F5F2F5EEF0EF3A
            E26B009A01009A003273002D78000D700D767676DCDCDCFFFFFFFFFFFF389838
            4FC5666AD08128BC4922BB45026F05F0E4F0E0DFE0E0E0E0E3E3E3E5E5E5E8E8
            E8EAEAEAECECECEEEEEEEFEFEFF0F0F0F1F1F1F1F1F1F0F0F0F2EFF1EDEEED3A
            E36B019A04009A00297B002B79000E6F0E7F7F7FDEDEDEFFFFFFFFFFFF48A248
            49C2616DD48540C56022BE48037005F8E8F8EBE2EBEDE5EDEFE7EFEFE9EFEEE9
            EEEAE9EAEAEAEAEBEBEBEFEEEFF5F1F5FAF4FAFBF4FBFCF4FCFDF3FCF3F0F43D
            E56F039C06009C01228200287B002075208F8F8FE4E4E4FFFFFFFFFFFF70B770
            3AB74E6ED68A5CD07A22C04C03720689B58981B38183B68383B7837EB87EB6D0
            B6ECE8ECE7E7E7E9E9E9F0ECF0BED5C18EB78B97C29698C59898C89792C99148
            E87A049D09009D031F85001F7A003D7C3DA8A8A8EDEDEDFFFFFFFFFFFFACD5AC
            1FA42C6FDA8F7BD99528C4561AA83418A63118A63118A93117A72F0C8D196AAE
            6AF1E9F1E5E5E5E6E6E6F2E7EE96F8B70999170B9416099B13079F0F06A00C10
            B31E059E0B009E051F86001479005E835EC5C5C5F7F7F7FFFFFFFFFFFFF1F9F1
            0C910C71DD9578DB9557D17C2AC85D30C96130C9602FC8602DC65C18A83071AF
            71F1E8F1E2E2E2E3E3E3F0E4EC90ECAF2CC95115AE2C12AB260FA8200CA51909
            A213069F0D009F07238802077702849184E0E0E0FEFEFEFFFFFFFFFFFFFFFFFF
            61BA6145BF5C78DE9B82E0A034CE6831CB6532CB6633CC6530C96219AA346FAC
            6FEDE5EDDFDFDFE0E0E0EDE1EA88E4A827C94C16AF2E13AC2810A9210DA61B0A
            A31507A10E039E081D8402338733B9B9B9F3F3F3FFFFFFFFFFFFFFFFFFFFFFFF
            D9F2D907940878E39F7CDF9E75DD982CCA6033CC6633CD6633CC661BA9366EAA
            6EEDE4EDDEDDDEDFDEDFEEE0E983DCA125C84B17B03014AD2911AA230DA61C0A
            A31607A10F0E9A0A087C03819D81E1E1E1FDFDFDFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFF79C8792DAF3E7DE4A47FE0A06BDA902BCA6132CC6633CC671BA93778AD
            78FDEAFDF2E5F2F4E7F4FDE6FA87DEA824C74A17B03114AD2A11AA240EA71D0B
            A51807A4110D8906458F45CECECEF8F8F8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFAFDFA3AA53A4DC5667DE2A380E09F70DB9330CB6430CC641DAC3A0374
            07036F06037106037005026F0502800721C04318B13114AD2B11AA240EA71D0C
            A718099B0F1E811EB7BFB7F2F2F2FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFE8F7E8299B294CC4677CE4A47BDF9D7DDE9D4CD27A2BCA602CC8
            5B2BC45828C15125BE4B21BA461EB73E1BB43918B13114AD2B11AA240FAB2108
            9E14158415ABBFABF0F0F0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFE8F7E83AA53A32B24179E4A278E09E7CDF9E73DB964DCF
            7530C75C22C04C1FBC461EBA411BB73A17B33514B02E15AE2B1CB3300A981423
            8823B5CAB5F3F3F3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFAFDFA7AC87A0B970C4CC46677E2A173DE9971DA
            936FD88D63D38252CC7044C6623FC25A3DC2583EC25525AC34058A0657A557D8
            E0D8F9F9F9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDAF3DA61BD610C950C29AC3744BF
            5B54C97158D07955CD7348C36134B3451A9F25068A064CA64CB9D7B9F5F5F5FE
            FEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF1F9F1ADD8AD6FB8
            6F49A549389B38369936449F4465AD6599C699DCE8DCFAFAFAFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
          Layout = blGlyphRight
        end
      end
      object CurrencyEdit2: TCurrencyEdit
        Left = 592
        Top = 408
        Width = 118
        Height = 28
        AutoSize = False
        Color = clBlack
        DisplayFormat = '0.00;'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clYellow
        Font.Height = -19
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 2
        OnKeyDown = Edit1KeyDown
      end
      object CurrencyEdit3: TCurrencyEdit
        Left = 715
        Top = 408
        Width = 118
        Height = 28
        AutoSize = False
        Color = clBlack
        DisplayFormat = '0.00;'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clYellow
        Font.Height = -19
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 3
        OnKeyDown = Edit1KeyDown
      end
      object CurrencyEdit4: TCurrencyEdit
        Left = 962
        Top = 408
        Width = 118
        Height = 28
        AutoSize = False
        Color = clBlack
        DisplayFormat = '0.00;'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clYellow
        Font.Height = -19
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 4
        OnKeyDown = Edit1KeyDown
      end
      object CurrencyEdit5: TCurrencyEdit
        Left = 839
        Top = 408
        Width = 118
        Height = 28
        AutoSize = False
        Color = clBlack
        DisplayFormat = '0.00;'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clYellow
        Font.Height = -19
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 5
        OnKeyDown = Edit1KeyDown
      end
    end
    object pgc1: TPageControl
      Left = 565
      Top = 66
      Width = 283
      Height = 91
      ActivePage = ts1
      TabOrder = 6
      object ts1: TTabSheet
        Caption = 'Informa'#231#245'es adicionais  '
        object mmo1: TMemo
          Left = 1
          Top = 3
          Width = 507
          Height = 60
          Lines.Strings = (
            'mmo1')
          TabOrder = 0
        end
      end
      object ts2: TTabSheet
        Caption = 'Cupom Fiscal Referenciado'
        ImageIndex = 1
      end
    end
  end
  inherited pn_botoes: TPanel
    Top = 599
    Width = 1095
    Height = 60
    inherited bt_imprimir: TBitBtn
      Left = 442
      Top = 2
    end
  end
end
