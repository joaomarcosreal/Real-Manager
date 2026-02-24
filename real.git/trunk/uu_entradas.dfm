inherited frm_entradas: Tfrm_entradas
  Left = 151
  Top = 0
  Caption = 'Entradas'
  ClientHeight = 680
  ClientWidth = 1014
  OldCreateOrder = True
  ExplicitWidth = 1022
  ExplicitHeight = 707
  PixelsPerInch = 96
  TextHeight = 13
  inherited pn_principal: TPanel
    Top = 47
    Width = 1014
    Height = 586
    Align = alNone
    ExplicitTop = 47
    ExplicitWidth = 1014
    ExplicitHeight = 586
    inherited pn_codigo: TPanel
      Top = 2
      Width = 91
      Height = 52
      Align = alNone
      ExplicitTop = 2
      ExplicitWidth = 91
      ExplicitHeight = 52
      inherited bt_pesquisa: TSpeedButton
        Left = 67
        Top = 22
        Width = 19
        Height = 25
        ExplicitLeft = 67
        ExplicitTop = 22
        ExplicitWidth = 19
        ExplicitHeight = 25
      end
      object Label7: TLabel [1]
        Left = 6
        Top = 8
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
      inherited ed_codigo: TMaskEdit
        Left = 5
        Top = 22
        Width = 60
        OnEnter = Edit1Enter
        ExplicitLeft = 5
        ExplicitTop = 22
        ExplicitWidth = 60
      end
    end
    object pnFornecedor: TPanel
      Left = 92
      Top = 2
      Width = 921
      Height = 53
      TabOrder = 1
      object Panel1: TPanel
        Left = 87
        Top = 135
        Width = 434
        Height = 26
        BevelOuter = bvNone
        Enabled = False
        TabOrder = 0
      end
      object gp_loja: TGroupBox
        Left = 2
        Top = 0
        Width = 197
        Height = 51
        Caption = 'Loja / Filial:'
        Color = clBtnFace
        ParentColor = False
        TabOrder = 1
        object Label3: TLabel
          Left = 6
          Top = 12
          Width = 25
          Height = 14
          Caption = 'C'#243'd:'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object btPesqLoja: TSpeedButton
          Left = 41
          Top = 22
          Width = 22
          Height = 24
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
        object Label28: TLabel
          Left = 66
          Top = 11
          Width = 96
          Height = 14
          Caption = 'Descri'#231#227'o da Loja'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Panel9: TPanel
          Left = 62
          Top = 24
          Width = 131
          Height = 24
          BevelOuter = bvNone
          Enabled = False
          ParentColor = True
          TabOrder = 1
          object edDescLoja: TDBEdit
            Left = 3
            Top = 2
            Width = 160
            Height = 21
            Color = clBlack
            DataField = 'XDESCRICAOLOJA'
            DataSource = dm.ds_entradas
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clYellow
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 0
          end
        end
        object edCodLoja: TDBEdit
          Left = 5
          Top = 24
          Width = 34
          Height = 21
          DataField = 'COD_EMP_GRUPO'
          DataSource = dm.ds_entradas
          TabOrder = 0
          OnEnter = Edit1Enter
          OnExit = Edit1Exit
          OnKeyDown = Edit1KeyDown
        end
      end
      object gpFornecedor: TGroupBox
        Left = 536
        Top = -1
        Width = 382
        Height = 53
        Caption = 'Dados do Fornecedor   '
        TabOrder = 3
        object Label2: TLabel
          Left = 2
          Top = 13
          Width = 40
          Height = 13
          Caption = 'C'#243'digo'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object bt_pesq_fornecedor: TSpeedButton
          Left = 46
          Top = 27
          Width = 19
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
        object Label1: TLabel
          Left = 71
          Top = 13
          Width = 80
          Height = 13
          Caption = 'Raz'#227'o Social:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object ed_cod_fornecedor: TDBEdit
          Left = 3
          Top = 29
          Width = 41
          Height = 21
          DataField = 'COD_FORNECEDOR'
          DataSource = dm.ds_entradas
          TabOrder = 0
          OnEnter = Edit1Enter
          OnExit = Edit1Exit
          OnKeyDown = Edit1KeyDown
        end
        object Panel3: TPanel
          Left = 68
          Top = 24
          Width = 310
          Height = 24
          BevelOuter = bvNone
          Enabled = False
          TabOrder = 1
          object ed_razao_social_fornecedor: TDBEdit
            Left = 3
            Top = 4
            Width = 308
            Height = 21
            Color = clBlack
            DataField = 'XRAZAOSOCIAL'
            DataSource = dm.ds_entradas
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clYellow
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 0
          end
        end
        object Panel13: TPanel
          Left = 845
          Top = 24
          Width = 29
          Height = 24
          BevelOuter = bvNone
          Enabled = False
          TabOrder = 2
        end
      end
      object gpChaveNota: TGroupBox
        Left = 201
        Top = -6
        Width = 334
        Height = 58
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 2
        object Label27: TLabel
          Left = 3
          Top = 22
          Width = 168
          Height = 14
          Caption = 'Chave da Nota Fiscal Eletr'#244'nica'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object SpeedButton1: TSpeedButton
          Left = 286
          Top = 8
          Width = 45
          Height = 48
          Caption = 'XML'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -7
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          Glyph.Data = {
            F6060000424DF606000000000000360000002800000018000000180000000100
            180000000000C0060000EB0A0000EB0A00000000000000000000FFFFFFFAFAFA
            E8E8E8DCDCDCD9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9
            D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9DCDCDCE8E8E8FAFAFAFF
            FFFFFAFAFAD9D9D99D9D9D7777776F6F6F6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E
            6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6F6F6F7777
            779D9D9DD9D9D9FAFAFAE9E9E9BFA294C9967EC6937CC4917BC18E7ABF8C79BD
            8A78BA8776B88575B68374B38073B17E72AF7C71AC796FAA776EA8756DA5726C
            A3706BA16E6A9178766060609D9D9DE9E9E9D5B4A3DAB099F5E2D4FFF6EEFFFA
            F5FFFDFCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFF2EBEAB8928F917876777777DCDCDCD29F82F6E1D0
            FFF3E7FFF6EE999693999897999999999999FFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF2EBEAA16E6A6F6F6FD9
            D9D9D4A183FFFFFFFFF2E5FFF5ECFFF9F3FFFCFAFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFA3706B6E6E6ED9D9D9D6A384FFFFFFFFF2E5FFF4EAFFF7F1FFFBF899999999
            9999999999FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFA5726C6E6E6ED9D9D9D8A585FFFFFFFFF0E3FFF4EAFFF6
            EEFFFAF5FFFDFCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA9766E6E6E6ED9D9D9DAA786FFFFFF
            FFEFE0FFF3E7FFF5ECFFF9F3FFFCFAFFFFFF9999999999999999999999999999
            99999999999999FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFAB786F6E6E6ED9
            D9D9DDAA87FFFFFFFFEEDEFFF0E3FFF4EAFFF7F1FFFAF5FFFDFCFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFAE7B706E6E6ED9D9D9E0AD89FFFFFFFFECD9FFEFE0FFF3E7FFF5EC99959299
            9796999999FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFB07D716E6E6ED9D9D9E2AF8AFFFFFFFFEAD7FFEEDEFFF0
            E3FFF4EAFFF6EEFFFAF5FFFCFAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB27F726E6E6ED9D9D9E4B18BFFFFFF
            FFE9D5FFECD9FFEFE0FFF2E5FFF5ECFFF7F1999693999897999999FFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB582746E6E6ED9
            D9D9E6B38CFFFFFFFFE7D0FFEAD7FFEDDCFFEFE0FFF3E7FFF5ECFFF7F1FFFBF8
            FFFDFCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFB885756E6E6ED9D9D9E8B58EFFFFFFFFE5CCFFE8D2FFEAD7FFEEDEFFF0E3FF
            F3E7FFF5ECFFF7F1999693999796999999999999999999999999999999999999
            FFFFFFFFFFFFFFFFFFBA87766E6E6ED9D9D9ECB98FFFFFFFFFE3C9FFE6CEFFE8
            D2FFECD9FFEEDEFFF0E3FFF3E7FFF5ECFFF7F1FFFAF5FFFCFAFFFDFCFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBD8A786E6E6ED9D9D9EEBB90FFFFFF
            FFE1C5FFE3C9FFE6CEFFE9D5FFECD9FFEEDE99908899928B99938EFFF6EEFFF9
            F3FFFAF5FFFCFAFFFDFCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBF8C796E6E6ED9
            D9D9F0BD91FFFFFFFFDFC0FFE1C5FFE3C9FFE7D0FFE9D5FFECD9FFEEDEFFEFE0
            FFF2E5FFF4EAFFF5ECFFF7F1FFF9F3FFFAF5FFFBF8FFFCFAFFFDFCFFFDFCFFFD
            FCC18E7A6E6E6ED9D9D9F2BF93FFFFFFFFDDBCFFDFC0FFE1C5FFE3C9998A7C99
            8B7E998C81FFEDDCFFEFE0FFF0E3FFF3E7FFF4EAFFF5ECFFF6EEFFF7F1FFF9F3
            FFFAF5FFFAF5FFFAF5C4917B6E6E6ED9D9D9F4C194FFFFFFFFDBB8FFDDBCFFDF
            C0FFE1C5FFE3C9FFE6CEFFE8D2FFEAD7FFECD9FFEEDEFFEFE0FFF0E3FFF3E7FF
            F4EAFFF4EAFFF5ECFFF6EEFFF6EEFFF6EEC7947D6F6F6FD9D9D9F6C395FFFFFF
            FFD9B3FFDBB899857199867399877699887999897A998B7D998C80998C81998E
            82998F85998F86999088FFF2E5FFF2E5FFF3E7FFF3E7FFF3E7CA977E777777DC
            DCDCF9C696FEF1E6FFEEDEFFD9B3FFDBB8FFDDBCFFDEBEFFE0C3FFE2C7FFE5CC
            FFE6CEFFE7D0FFE9D5FFEAD7FFECD9FFEDDCFFEEDEFFEEDEFFEFE0FFEFE0F6E0
            D0CC997F9D9D9DE9E9E9FCF0E4FBCB9DFEF1E6FFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFF7DFCCDCB39AC1A495D9D9D9FAFAFAFFFFFFFCF0E4F9C696F7C495F5C2
            94F3C093F1BE92EFBC91EDBA90EAB78FE8B58EE6B38CE4B18BE2AF8AE0AD89DE
            AB88DAA786D8A585D6A384D4A183D6B6A4E8E8E8FAFAFAFFFFFF}
          Layout = blGlyphTop
          ParentFont = False
          OnClick = SpeedButton1Click
        end
        object edChaveNFE: TDBEdit
          Left = 4
          Top = 35
          Width = 277
          Height = 21
          DataField = 'CHAVE_NFE'
          DataSource = dm.ds_entradas
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          MaxLength = 44
          ParentFont = False
          TabOrder = 0
          OnEnter = Edit1Enter
          OnExit = Edit1Exit
          OnKeyDown = Edit1KeyDown
        end
      end
    end
    object pn_campos: TPanel
      Left = -1
      Top = 55
      Width = 1015
      Height = 529
      TabOrder = 2
      object pnNota: TPanel
        Left = 3
        Top = 456
        Width = 1012
        Height = 70
        Caption = 'pnNota'
        TabOrder = 2
        object GroupBox2: TGroupBox
          Left = 8
          Top = 3
          Width = 999
          Height = 63
          Caption = 'Totais da Nota:'
          TabOrder = 0
          object Label32: TLabel
            Left = 3
            Top = 25
            Width = 58
            Height = 14
            Caption = 'Base ICMS'
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlue
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label33: TLabel
            Left = 89
            Top = 25
            Width = 76
            Height = 14
            Caption = 'Valor do ICMS'
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlue
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label35: TLabel
            Left = 767
            Top = 25
            Width = 13
            Height = 14
            Caption = 'IPI'
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlue
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label36: TLabel
            Left = 488
            Top = 25
            Width = 32
            Height = 14
            Caption = 'Frete:'
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlue
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label37: TLabel
            Left = 557
            Top = 25
            Width = 43
            Height = 14
            Caption = 'Seguro:'
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlue
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label38: TLabel
            Left = 690
            Top = 25
            Width = 60
            Height = 14
            Caption = 'Outr. Desp.'
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlue
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label39: TLabel
            Left = 829
            Top = 7
            Width = 106
            Height = 19
            Caption = 'Total da Nota:'
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Height = -16
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label5: TLabel
            Left = 383
            Top = 25
            Width = 92
            Height = 14
            Caption = 'Vl. dos Produtos'
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlue
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label25: TLabel
            Left = 278
            Top = 25
            Width = 93
            Height = 14
            Caption = 'Valor do ICMS ST'
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlue
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label26: TLabel
            Left = 181
            Top = 25
            Width = 75
            Height = 14
            Caption = 'Base ICMS ST'
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlue
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label44: TLabel
            Left = 623
            Top = 25
            Width = 52
            Height = 14
            Caption = 'Desconto'
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlue
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object btDistribuir: TSpeedButton
            Left = 621
            Top = 8
            Width = 205
            Height = 18
            Caption = 'Distribuir'
            OnClick = btDistribuirClick
          end
          object edBaseCalculoICMS: TDBEdit
            Left = 4
            Top = 38
            Width = 81
            Height = 21
            Color = clWhite
            DataField = 'BASE_ICMS'
            DataSource = dm.ds_entradas
            TabOrder = 0
            OnEnter = Edit1Enter
          end
          object edValorICMS: TDBEdit
            Left = 90
            Top = 38
            Width = 85
            Height = 21
            Color = clWhite
            DataField = 'VALOR_ICMS'
            DataSource = dm.ds_entradas
            TabOrder = 1
            OnEnter = Edit1Enter
          end
          object edBaseCalculoICMSSubst: TDBEdit
            Left = 180
            Top = 38
            Width = 94
            Height = 21
            Color = clWhite
            DataField = 'BASE_ICMS_SUBST'
            DataSource = dm.ds_entradas
            TabOrder = 2
            OnEnter = Edit1Enter
          end
          object edValorICMSSubst: TDBEdit
            Left = 279
            Top = 38
            Width = 97
            Height = 21
            Color = clWhite
            DataField = 'VALOR_ICMS_SUBST'
            DataSource = dm.ds_entradas
            TabOrder = 3
            OnEnter = Edit1Enter
          end
          object edValorProdutos: TDBEdit
            Left = 387
            Top = 38
            Width = 97
            Height = 21
            Color = clWhite
            DataField = 'VALOR_PRODUTOS'
            DataSource = dm.ds_entradas
            TabOrder = 4
            OnEnter = Edit1Enter
          end
          object edValorFrete: TDBEdit
            Left = 490
            Top = 38
            Width = 60
            Height = 21
            DataField = 'FRETE'
            DataSource = dm.ds_entradas
            TabOrder = 5
            OnEnter = Edit1Enter
          end
          object edValorSeguro: TDBEdit
            Left = 557
            Top = 38
            Width = 60
            Height = 21
            DataField = 'SEGURO'
            DataSource = dm.ds_entradas
            TabOrder = 6
            OnEnter = Edit1Enter
          end
          object edValorDesconto: TDBEdit
            Left = 623
            Top = 38
            Width = 63
            Height = 21
            Color = clWhite
            DataField = 'DESCONTO'
            DataSource = dm.ds_entradas
            TabOrder = 7
            OnEnter = Edit1Enter
          end
          object edOutrasDespesas: TDBEdit
            Left = 690
            Top = 38
            Width = 70
            Height = 21
            DataField = 'OUTRAS_DESPESAS'
            DataSource = dm.ds_entradas
            TabOrder = 8
            OnEnter = Edit1Enter
          end
          object edValorIPI: TDBEdit
            Left = 765
            Top = 38
            Width = 60
            Height = 21
            Color = clWhite
            DataField = 'VALOR_IPI'
            DataSource = dm.ds_entradas
            TabOrder = 9
            OnEnter = Edit1Enter
          end
          object Panel7: TPanel
            Left = 827
            Top = 24
            Width = 166
            Height = 36
            Caption = 'Panel7'
            Enabled = False
            TabOrder = 10
            object edTotalNotaFiscal: TDBEdit
              Left = 1
              Top = 3
              Width = 167
              Height = 32
              Color = clBlack
              DataField = 'TOTAL_NOTA'
              DataSource = dm.ds_entradas
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clYellow
              Font.Height = -19
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 0
              OnEnter = Edit1Enter
            end
          end
        end
      end
      object pnItens: TPanel
        Left = 3
        Top = 60
        Width = 1012
        Height = 396
        TabOrder = 1
        object PageControl1: TPageControl
          Left = -2
          Top = 0
          Width = 1003
          Height = 393
          ActivePage = TabSheet1
          TabOrder = 0
          object TabSheet1: TTabSheet
            Caption = #205'tens da Nota Fiscal'
            object GroupBox3: TGroupBox
              Left = -4
              Top = 14
              Width = 1005
              Height = 389
              Caption = #205'tens da Nota Fiscal / Documento'
              TabOrder = 0
              object Label9: TLabel
                Left = 6
                Top = 20
                Width = 39
                Height = 14
                Caption = 'C'#243'digo'
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Arial'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object bt_pesq_item_estoque_cod: TSpeedButton
                Left = 54
                Top = 33
                Width = 28
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
              object Label10: TLabel
                Left = 86
                Top = 21
                Width = 207
                Height = 14
                Caption = 'Descri'#231#227'o do produto  / Mat'#233'ria-Prima'
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Arial'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object Label14: TLabel
                Left = 759
                Top = 21
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
              object Label15: TLabel
                Left = 6
                Top = 57
                Width = 29
                Height = 14
                Caption = 'Total:'
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Arial'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object Label17: TLabel
                Left = 822
                Top = 21
                Width = 27
                Height = 14
                Caption = 'Unid:'
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Arial'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object bt_pesq_un_entrada: TSpeedButton
                Left = 855
                Top = 35
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
                OnClick = botao_pesquisaClick
              end
              object Label18: TLabel
                Left = 883
                Top = 22
                Width = 120
                Height = 14
                Caption = 'Descri'#231#227'o da unidade:'
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Arial'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object Label20: TLabel
                Left = 212
                Top = 57
                Width = 52
                Height = 14
                Caption = 'Desconto'
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Arial'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object Label24: TLabel
                Left = 380
                Top = 58
                Width = 58
                Height = 14
                Caption = 'Base ICMS'
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Arial'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object Label40: TLabel
                Left = 609
                Top = 57
                Width = 75
                Height = 14
                Caption = 'Base ICMS ST'
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Arial'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object Label42: TLabel
                Left = 830
                Top = 57
                Width = 16
                Height = 14
                Caption = 'IPI:'
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Arial'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object Label11: TLabel
                Left = 451
                Top = 57
                Width = 55
                Height = 14
                Caption = 'Al'#237'q. ICMS'
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Arial'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object Label43: TLabel
                Left = 858
                Top = 57
                Width = 40
                Height = 14
                Caption = 'Al'#237'q. IPI'
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Arial'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object Label8: TLabel
                Left = 735
                Top = 57
                Width = 45
                Height = 14
                Caption = 'ICMS ST'
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Arial'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object Label19: TLabel
                Left = 541
                Top = 57
                Width = 59
                Height = 14
                Caption = 'Valor ICMS'
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Arial'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object Label13: TLabel
                Left = 649
                Top = 19
                Width = 32
                Height = 14
                Caption = 'CFOP:'
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Arial'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object Label12: TLabel
                Left = 611
                Top = 20
                Width = 24
                Height = 14
                Caption = 'CST:'
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Arial'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object Label34: TLabel
                Left = 687
                Top = 20
                Width = 28
                Height = 14
                Caption = 'NCM:'
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Arial'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object Label41: TLabel
                Left = 342
                Top = 20
                Width = 141
                Height = 14
                Caption = 'Estoque atual  do produto'
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Arial'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object Label45: TLabel
                Left = 105
                Top = 57
                Width = 55
                Height = 14
                Caption = 'Valor Unit.'
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Arial'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object Label47: TLabel
                Left = 283
                Top = 57
                Width = 71
                Height = 14
                Caption = 'Outras Desp:'
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Arial'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object Panel5: TPanel
                Left = 83
                Top = 33
                Width = 527
                Height = 24
                BevelOuter = bvNone
                Enabled = False
                TabOrder = 17
                object ed_desc_item: TEdit
                  Left = 5
                  Top = 2
                  Width = 254
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
                object edEstoqueCompletoItem: TEdit
                  Left = 260
                  Top = 1
                  Width = 265
                  Height = 21
                  Color = clBlack
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clYellow
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = [fsBold]
                  ParentFont = False
                  TabOrder = 1
                end
              end
              object Panel6: TPanel
                Left = 878
                Top = 33
                Width = 136
                Height = 24
                BevelOuter = bvNone
                Enabled = False
                TabOrder = 18
                object ed_desc_un_entrada: TEdit
                  Left = 3
                  Top = 2
                  Width = 131
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
              object btAdicionaItem: TBitBtn
                Left = 908
                Top = 59
                Width = 91
                Height = 36
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
                TabOrder = 16
                OnClick = btAdicionaItemClick
              end
              object ed_cod_item: TEdit
                Left = 6
                Top = 35
                Width = 46
                Height = 21
                TabOrder = 0
                OnEnter = Edit1Enter
                OnExit = Edit1Exit
                OnKeyDown = Edit1KeyDown
              end
              object ed_cst_item: TEdit
                Left = 649
                Top = 31
                Width = 32
                Height = 21
                Hint = 
                  ' C'#243'digo da Situa'#231#227'o Tribut'#225'ria.'#13#10' Caso o '#237'tem da nota n'#227'o possoa' +
                  ' o CST informado, favor deixar este campo em branco.'
                Color = clWhite
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                ParentShowHint = False
                ShowHint = True
                TabOrder = 2
                OnEnter = Edit1Enter
                OnExit = Edit1Exit
                OnKeyDown = Edit1KeyDown
              end
              object ed_cfop_item: TEdit
                Left = 610
                Top = 32
                Width = 35
                Height = 21
                Hint = 
                  'C'#243'digo Fiscal de Opera'#231#227'o e Presta'#231#227'o do '#237'tem na nota fiscal. Ca' +
                  'so o '#237'tem n'#227'o '#13#10' possua o campo CFOP, favor prencher com o mesmo' +
                  ' CFOP da nota fiscal indicado'#13#10' acima.'
                Color = clWhite
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                ParentShowHint = False
                ShowHint = True
                TabOrder = 1
                OnEnter = Edit1Enter
                OnExit = Edit1Exit
                OnKeyDown = Edit1KeyDown
              end
              object edNCMITEM: TEdit
                Left = 687
                Top = 33
                Width = 65
                Height = 21
                Hint = 
                  'C'#243'digo Fiscal de Opera'#231#227'o e Presta'#231#227'o do '#237'tem na nota fiscal. Ca' +
                  'so o '#237'tem n'#227'o '#13#10' possua o campo CFOP, favor prencher com o mesmo' +
                  ' CFOP da nota fiscal indicado'#13#10' acima.'
                Color = clWhite
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                ParentShowHint = False
                ShowHint = True
                TabOrder = 3
                OnEnter = Edit1Enter
                OnExit = Edit1Exit
                OnKeyDown = Edit1KeyDown
              end
              object EDIquantidade: TCurrencyEdit
                Left = 758
                Top = 34
                Width = 58
                Height = 21
                AutoSize = False
                DecimalPlaces = 3
                DisplayFormat = '0.0000;'
                TabOrder = 4
                OnEnter = Edit1Enter
                OnExit = Edit1Exit
                OnKeyDown = Edit1KeyDown
              end
              object ed_cod_un_entrada: TEdit
                Left = 819
                Top = 35
                Width = 35
                Height = 21
                TabOrder = 5
                OnEnter = Edit1Enter
                OnExit = Edit1Exit
                OnKeyDown = Edit1KeyDown
              end
              object edTotalItem: TCurrencyEdit
                Left = 7
                Top = 70
                Width = 94
                Height = 21
                AutoSize = False
                DecimalPlaces = 4
                DisplayFormat = 'R$ 0.00000;'
                TabOrder = 6
                OnEnter = Edit1Enter
                OnExit = Edit1Exit
                OnKeyDown = Edit1KeyDown
              end
              object EDIdesconto: TCurrencyEdit
                Left = 212
                Top = 70
                Width = 64
                Height = 21
                Hint = 'Valor do desconto no '#237'tem'
                AutoSize = False
                DisplayFormat = 'R$ 0.00;'
                TabOrder = 7
                OnEnter = Edit1Enter
                OnExit = Edit1Exit
                OnKeyDown = Edit1KeyDown
              end
              object EDIbaseICMS: TCurrencyEdit
                Left = 360
                Top = 71
                Width = 80
                Height = 20
                Hint = 'Base de c'#225'lculo do ICMS'
                AutoSize = False
                DisplayFormat = 'R$ 0.00000;'
                TabOrder = 9
                OnEnter = Edit1Enter
                OnExit = Edit1Exit
                OnKeyDown = Edit1KeyDown
              end
              object EDIAliquotaICMS: TCurrencyEdit
                Left = 444
                Top = 70
                Width = 65
                Height = 21
                AutoSize = False
                DisplayFormat = '0.00;'
                TabOrder = 10
                OnEnter = Edit1Enter
                OnExit = Edit1Exit
                OnKeyDown = Edit1KeyDown
              end
              object EDIVALORICMS: TCurrencyEdit
                Left = 516
                Top = 70
                Width = 86
                Height = 20
                Hint = 'Base de c'#225'lculo do ICMS'
                AutoSize = False
                DisplayFormat = 'R$ 0.00000;'
                TabOrder = 11
                OnEnter = Edit1Enter
                OnExit = Edit1Exit
                OnKeyDown = Edit1KeyDown
              end
              object EDIbaseICMSST: TCurrencyEdit
                Left = 609
                Top = 70
                Width = 89
                Height = 21
                AutoSize = False
                DisplayFormat = 'R$ 0.00;'
                TabOrder = 12
                OnEnter = Edit1Enter
                OnExit = Edit1Exit
                OnKeyDown = Edit1KeyDown
              end
              object ediValorICMSST: TCurrencyEdit
                Left = 701
                Top = 70
                Width = 77
                Height = 21
                AutoSize = False
                DisplayFormat = 'R$ 0.0000;'
                TabOrder = 13
                OnEnter = Edit1Enter
                OnExit = Edit1Exit
                OnKeyDown = Edit1KeyDown
              end
              object EDIvalorIPI: TCurrencyEdit
                Left = 784
                Top = 70
                Width = 64
                Height = 21
                AutoSize = False
                DisplayFormat = 'R$ 0.0000;'
                TabOrder = 14
                OnEnter = Edit1Enter
                OnExit = Edit1Exit
                OnKeyDown = Edit1KeyDown
              end
              object EDIAliquotaIPI: TCurrencyEdit
                Left = 857
                Top = 70
                Width = 46
                Height = 21
                AutoSize = False
                DisplayFormat = '0.00;'
                TabOrder = 15
                OnEnter = Edit1Enter
                OnExit = Edit1Exit
                OnKeyDown = Edit1KeyDown
              end
              object edOutrasDespItem: TCurrencyEdit
                Left = 282
                Top = 70
                Width = 70
                Height = 21
                AutoSize = False
                DisplayFormat = '0.00;'
                TabOrder = 8
                OnEnter = Edit1Enter
                OnExit = Edit1Exit
                OnKeyDown = Edit1KeyDown
              end
              object Panel2: TPanel
                Left = 103
                Top = 69
                Width = 105
                Height = 23
                BevelOuter = bvNone
                Caption = 'Panel2'
                TabOrder = 19
                object EDIpreco: TCurrencyEdit
                  Left = 2
                  Top = 1
                  Width = 101
                  Height = 21
                  AutoSize = False
                  Color = clMoneyGreen
                  DecimalPlaces = 8
                  DisplayFormat = 'R$ 0.00000000;'
                  ReadOnly = True
                  TabOrder = 0
                  OnEnter = Edit1Enter
                  OnExit = Edit1Exit
                  OnKeyDown = Edit1KeyDown
                end
              end
              object DBGrid1: TDBGrid
                Left = 3
                Top = 101
                Width = 987
                Height = 273
                DataSource = dm.dsComprasTemp
                Options = [dgEditing, dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
                PopupMenu = PopupMenu1
                TabOrder = 20
                TitleFont.Charset = DEFAULT_CHARSET
                TitleFont.Color = clWindowText
                TitleFont.Height = -11
                TitleFont.Name = 'MS Sans Serif'
                TitleFont.Style = []
                OnColExit = DBGrid1ColExit
                OnDrawColumnCell = DBGrid1DrawColumnCell
                OnKeyDown = DBGrid1KeyDown
                Columns = <
                  item
                    Expanded = False
                    FieldName = 'ordem'
                    Title.Caption = '   '
                    Width = 25
                    Visible = True
                  end
                  item
                    Color = clWhite
                    Expanded = False
                    FieldName = 'codigo'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clNavy
                    Font.Height = -11
                    Font.Name = 'MS Sans Serif'
                    Font.Style = []
                    ReadOnly = True
                    Title.Caption = 'C'#243'digo'
                    Title.Font.Charset = DEFAULT_CHARSET
                    Title.Font.Color = clWindowText
                    Title.Font.Height = -11
                    Title.Font.Name = 'MS Sans Serif'
                    Title.Font.Style = [fsBold]
                    Width = 50
                    Visible = True
                  end
                  item
                    Color = clWhite
                    Expanded = False
                    FieldName = 'descricao'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clNavy
                    Font.Height = -11
                    Font.Name = 'MS Sans Serif'
                    Font.Style = []
                    ReadOnly = True
                    Title.Caption = 'Descri'#231#227'o'
                    Title.Font.Charset = DEFAULT_CHARSET
                    Title.Font.Color = clWindowText
                    Title.Font.Height = -11
                    Title.Font.Name = 'MS Sans Serif'
                    Title.Font.Style = [fsBold]
                    Width = 224
                    Visible = True
                  end
                  item
                    Color = 16776176
                    Expanded = False
                    FieldName = 'siglaUnidade'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clNavy
                    Font.Height = -11
                    Font.Name = 'MS Sans Serif'
                    Font.Style = []
                    ReadOnly = True
                    Title.Caption = 'Unid.'
                    Title.Font.Charset = DEFAULT_CHARSET
                    Title.Font.Color = clWindowText
                    Title.Font.Height = -11
                    Title.Font.Name = 'MS Sans Serif'
                    Title.Font.Style = [fsBold]
                    Width = 60
                    Visible = True
                  end
                  item
                    Color = clYellow
                    Expanded = False
                    FieldName = 'quantidade'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clNavy
                    Font.Height = -11
                    Font.Name = 'MS Sans Serif'
                    Font.Style = []
                    Title.Caption = 'Quant.'
                    Title.Color = clYellow
                    Title.Font.Charset = DEFAULT_CHARSET
                    Title.Font.Color = clWindowText
                    Title.Font.Height = -11
                    Title.Font.Name = 'MS Sans Serif'
                    Title.Font.Style = [fsBold]
                    Width = 50
                    Visible = True
                  end
                  item
                    Color = clMoneyGreen
                    Expanded = False
                    FieldName = 'preco'
                    Title.Caption = 'Valor Unit'#225'rio'
                    Title.Font.Charset = DEFAULT_CHARSET
                    Title.Font.Color = clWindowText
                    Title.Font.Height = -11
                    Title.Font.Name = 'MS Sans Serif'
                    Title.Font.Style = [fsBold]
                    Width = 88
                    Visible = True
                  end
                  item
                    Color = clAqua
                    Expanded = False
                    FieldName = 'total'
                    Title.Caption = 'Total'
                    Title.Color = clAqua
                    Title.Font.Charset = DEFAULT_CHARSET
                    Title.Font.Color = clWindowText
                    Title.Font.Height = -11
                    Title.Font.Name = 'MS Sans Serif'
                    Title.Font.Style = [fsBold]
                    Width = 86
                    Visible = True
                  end
                  item
                    Color = clBtnFace
                    Expanded = False
                    FieldName = 'CST'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clNavy
                    Font.Height = -11
                    Font.Name = 'MS Sans Serif'
                    Font.Style = []
                    Title.Font.Charset = DEFAULT_CHARSET
                    Title.Font.Color = clWindowText
                    Title.Font.Height = -11
                    Title.Font.Name = 'MS Sans Serif'
                    Title.Font.Style = [fsBold]
                    Width = 35
                    Visible = True
                  end
                  item
                    Color = 16776176
                    Expanded = False
                    FieldName = 'CFOP'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clNavy
                    Font.Height = -11
                    Font.Name = 'MS Sans Serif'
                    Font.Style = []
                    Title.Font.Charset = DEFAULT_CHARSET
                    Title.Font.Color = clWindowText
                    Title.Font.Height = -11
                    Title.Font.Name = 'MS Sans Serif'
                    Title.Font.Style = [fsBold]
                    Width = 35
                    Visible = True
                  end
                  item
                    Color = clBtnFace
                    Expanded = False
                    FieldName = 'desconto'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clNavy
                    Font.Height = -11
                    Font.Name = 'MS Sans Serif'
                    Font.Style = []
                    Title.Caption = 'Desconto'
                    Title.Font.Charset = DEFAULT_CHARSET
                    Title.Font.Color = clWindowText
                    Title.Font.Height = -11
                    Title.Font.Name = 'MS Sans Serif'
                    Title.Font.Style = [fsBold]
                    Width = 60
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'outrasDespAcessorias'
                    Title.Caption = 'Outras Despesas'
                    Title.Font.Charset = DEFAULT_CHARSET
                    Title.Font.Color = clWindowText
                    Title.Font.Height = -11
                    Title.Font.Name = 'MS Sans Serif'
                    Title.Font.Style = [fsBold]
                    Visible = True
                  end
                  item
                    Color = 16776176
                    Expanded = False
                    FieldName = 'valorIPI'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clNavy
                    Font.Height = -11
                    Font.Name = 'MS Sans Serif'
                    Font.Style = []
                    Title.Caption = 'IPI'
                    Title.Font.Charset = DEFAULT_CHARSET
                    Title.Font.Color = clWindowText
                    Title.Font.Height = -11
                    Title.Font.Name = 'MS Sans Serif'
                    Title.Font.Style = [fsBold]
                    Width = 50
                    Visible = True
                  end
                  item
                    Color = 16776176
                    Expanded = False
                    FieldName = 'baseICMS'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clNavy
                    Font.Height = -11
                    Font.Name = 'MS Sans Serif'
                    Font.Style = []
                    Title.Caption = 'Base ICMS'
                    Title.Font.Charset = DEFAULT_CHARSET
                    Title.Font.Color = clWindowText
                    Title.Font.Height = -11
                    Title.Font.Name = 'MS Sans Serif'
                    Title.Font.Style = [fsBold]
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'aliquotaICMS'
                    Title.Caption = 'Aliq. ICMS'
                    Title.Font.Charset = DEFAULT_CHARSET
                    Title.Font.Color = clWindowText
                    Title.Font.Height = -11
                    Title.Font.Name = 'MS Sans Serif'
                    Title.Font.Style = [fsBold]
                    Visible = True
                  end
                  item
                    Color = clBtnFace
                    Expanded = False
                    FieldName = 'valorICMS'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clNavy
                    Font.Height = -11
                    Font.Name = 'MS Sans Serif'
                    Font.Style = []
                    Title.Caption = 'Valor ICMS'
                    Title.Font.Charset = DEFAULT_CHARSET
                    Title.Font.Color = clWindowText
                    Title.Font.Height = -11
                    Title.Font.Name = 'MS Sans Serif'
                    Title.Font.Style = [fsBold]
                    Visible = True
                  end
                  item
                    Color = clBtnFace
                    Expanded = False
                    FieldName = 'aliquotaIPI'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clNavy
                    Font.Height = -11
                    Font.Name = 'MS Sans Serif'
                    Font.Style = []
                    Title.Caption = 'Aliq IPI'
                    Title.Font.Charset = DEFAULT_CHARSET
                    Title.Font.Color = clWindowText
                    Title.Font.Height = -11
                    Title.Font.Name = 'MS Sans Serif'
                    Title.Font.Style = [fsBold]
                    Visible = True
                  end
                  item
                    Color = 16776176
                    Expanded = False
                    FieldName = 'baseICMSST'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clNavy
                    Font.Height = -11
                    Font.Name = 'MS Sans Serif'
                    Font.Style = []
                    Title.Caption = 'Base ICMS ST'
                    Title.Font.Charset = DEFAULT_CHARSET
                    Title.Font.Color = clWindowText
                    Title.Font.Height = -11
                    Title.Font.Name = 'MS Sans Serif'
                    Title.Font.Style = [fsBold]
                    Width = 80
                    Visible = True
                  end
                  item
                    Color = clBtnFace
                    Expanded = False
                    FieldName = 'valorICMSST'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clNavy
                    Font.Height = -11
                    Font.Name = 'MS Sans Serif'
                    Font.Style = []
                    Title.Caption = 'Valor ICMS ST'
                    Title.Font.Charset = DEFAULT_CHARSET
                    Title.Font.Color = clWindowText
                    Title.Font.Height = -11
                    Title.Font.Name = 'MS Sans Serif'
                    Title.Font.Style = [fsBold]
                    Width = 80
                    Visible = True
                  end>
              end
            end
          end
          object TabSheet2: TTabSheet
            Caption = 'Dados adicionais da nota'
            ImageIndex = 1
            object GroupBox1: TGroupBox
              Left = 0
              Top = 8
              Width = 473
              Height = 329
              Caption = 'Informa'#231#245'es complementares'
              TabOrder = 0
              object memoInformacoesComplementares: TMemo
                Left = 8
                Top = 24
                Width = 457
                Height = 297
                TabOrder = 0
              end
            end
            object GroupBox5: TGroupBox
              Left = 496
              Top = 8
              Width = 473
              Height = 330
              Caption = 'Informa'#231#245'es de interesse do fisco'
              TabOrder = 1
              object memoInformacoesfisco: TMemo
                Left = 8
                Top = 24
                Width = 457
                Height = 296
                TabOrder = 0
              end
            end
          end
        end
      end
      object pnCabecalho: TPanel
        Left = 3
        Top = -1
        Width = 1012
        Height = 60
        Caption = 'pnNota'
        TabOrder = 0
        object GroupBox4: TGroupBox
          Left = 8
          Top = 2
          Width = 1009
          Height = 53
          TabOrder = 0
          object Label4: TLabel
            Left = 109
            Top = 16
            Width = 57
            Height = 14
            Caption = 'N'#186' da Nota:'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label16: TLabel
            Left = 64
            Top = 16
            Width = 32
            Height = 14
            Caption = 'S'#233'rie:'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object bt_pesq_modelo_notaFiscal: TSpeedButton
            Left = 40
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
            OnClick = botao_pesquisaClick
          end
          object Label21: TLabel
            Left = 5
            Top = 16
            Width = 41
            Height = 14
            Caption = 'Modelo'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label30: TLabel
            Left = 419
            Top = 12
            Width = 67
            Height = 14
            Caption = 'Data Entrada'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label6: TLabel
            Left = 320
            Top = 13
            Width = 73
            Height = 14
            Caption = 'Data Emiss'#227'o'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object edNumeroNotaFiscal: TDBEdit
            Left = 106
            Top = 29
            Width = 109
            Height = 21
            DataField = 'NUMERO_NOTA'
            DataSource = dm.ds_entradas
            TabOrder = 2
            OnEnter = Edit1Enter
            OnExit = edNumeroNotaFiscalExit
            OnKeyDown = Edit1KeyDown
          end
          object edSerieNotaFiscal: TDBEdit
            Left = 65
            Top = 29
            Width = 33
            Height = 21
            DataField = 'SERIE_NOTA'
            DataSource = dm.ds_entradas
            TabOrder = 1
            OnEnter = Edit1Enter
            OnExit = Edit1Exit
            OnKeyDown = Edit1KeyDown
          end
          object ed_cod_modelo_nota_fiscal: TDBEdit
            Left = 4
            Top = 29
            Width = 33
            Height = 21
            DataField = 'MODELO_NOTA'
            DataSource = dm.ds_entradas
            TabOrder = 0
            OnEnter = Edit1Enter
            OnExit = Edit1Exit
            OnKeyDown = Edit1KeyDown
          end
          object edDataEntradaNotaFiscal: TDBDateEdit
            Left = 418
            Top = 28
            Width = 91
            Height = 21
            DataField = 'DATA_ENTRADA'
            DataSource = dm.ds_entradas
            NumGlyphs = 2
            TabOrder = 6
            OnEnter = Edit1Enter
            OnExit = Edit1Exit
            OnKeyDown = Edit1KeyDown
          end
          object edDataEmissaoNotaFiscal: TDBDateEdit
            Left = 320
            Top = 28
            Width = 91
            Height = 21
            DataField = 'DATA_EMISSAO'
            DataSource = dm.ds_entradas
            NumGlyphs = 2
            TabOrder = 5
            OnEnter = Edit1Enter
            OnExit = Edit1Exit
            OnKeyDown = Edit1KeyDown
          end
          object ckbCompra: TRadioButton
            Left = 221
            Top = 28
            Width = 93
            Height = 17
            Caption = 'Compra'
            Checked = True
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 3
            TabStop = True
            OnEnter = Edit1Enter
            OnExit = Edit1Exit
            OnKeyDown = Edit1KeyDown
          end
          object ckbBonificacao: TRadioButton
            Left = 221
            Top = 12
            Width = 93
            Height = 17
            Caption = 'Bonifica'#231#227'o'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 4
            OnEnter = Edit1Enter
            OnExit = Edit1Exit
            OnKeyDown = Edit1KeyDown
          end
        end
      end
    end
  end
  inherited pn_botoes: TPanel
    Top = 632
    Width = 1014
    Height = 48
    ExplicitTop = 632
    ExplicitWidth = 1014
    ExplicitHeight = 48
    inherited bt_novo: TBitBtn
      Left = 2
      Width = 126
      Height = 43
      Caption = 'Nova entrada'
      Glyph.Data = {
        F6060000424DF606000000000000360000002800000018000000180000000100
        180000000000C0060000130B0000130B00000000000000000000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCFCFCF1F1F1E7E7E7DFDFDFDCDCDCDCDC
        DCDEDEDEE6E6E6F0F0F0FAFAFAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCFCFCEEEEEED5D5D5B4B4B4969696
        828282787878777777808080939393B0B0B0D1D1D1EBEBEBFBFBFBFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7F7F7DCDCDCA9ACA96F
        886F487E48277425157111146F0F2371214175415C735C6567657A7A7AA6A6A6
        D7D7D7F5F5F5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF5F5F5CDCE
        CD709570197816187901227D00277C002D76003074003072002C71001E6E0114
        6F0F5477546263628B8B8BC9C9C9F2F2F2FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        F8F8F8C4CCC43D873D048701069800009900009800009700009400078E001681
        002F7100376C00346D00216C012B732B5F645F838383C9C9C9F6F6F6FFFFFFFF
        FFFFFFFFFFFCFCFCD1D9D12C872C029905029E05029C05019A04019B03009A01
        0097000096000096000094000F8600376D00376C002D6C001C711C5F655F8B8B
        8BD7D7D7FBFBFBFFFFFFFFFFFFEEEEEE449844099E0F06A20D069F0E069F0D05
        9E0C1BBE2B58E7834BE1774EE27753E37B30CC4F0094000092002E71003A6A00
        2E6D012B752B626362A6A6A6EAEAEAFFFFFFFDFDFD92C2921098160CA7180AA3
        160AA3160AA3160AA314039A06FFF8FFFFF0FDFFF4FFFFF7FF2FD65500980000
        94000095002F7100386C00206D00547854797979D1D1D1FBFBFBF0F2F0218E21
        2CB73A0CA71B0EA71E0EA71E0EA71E0EA71D049208FFFCFFF3F3F3F8F6F8F8FA
        F92CD753019A040097000096000092003A6B00346D00136F0E646764B0B0B0F0
        F0F0AECFAE1C9E252BB73D10AB2312AB2612AB2712AB2612AB2505830AFFFBFF
        F2F2F2F9F7F9F9FAF92AD753049D0A029B04009700009600168300396C001D6F
        015C745C939393E6E6E66CAE6C3FBA4E28B53E14AF2B1DBC3A2DDF6030E2613A
        E16D09A725FFF5FFF3F3F3F8F6F8F2F9F421DA592AD9532DD85431D75831CE51
        009700376F002F73013F773F808080DEDEDE3F9A3F58CB6F2CB84418B3351981
        17FEE9FCEEE2EAF2E8F0F4F0F4F3EFF2F0F0F0F4F3F3FBF7FBF9F9FAFFFAFDFE
        F9FCFFF6FF58E781009900217E00327401227420767676DCDCDC2C992C63D17C
        35BD501BB73C158316F7E8F6E3E1E2E5E4E4E9E8E8EBEBEBEEEEEEF2F2F2F4F4
        F4F6F4F5F7F4F6F6F3F5FFF1FE51E67D009A01118A0033750111700C777777DC
        DCDC2D9A2D69D48445C6631EBA43158317F5E8F5DFDFDFE2E2E2E7E7E7E9E9E9
        EBEBEBEEEEEEEFEFEFF0F0F0F2F2F2F1F0F1FFEEFA4FE77D009B040793003178
        0113730E818181DFDFDF45A24569D68761D07B1FBE491E8521FFEFFFF8E9F8FB
        ECFBF9EDF9EEE9EEE8E8E8EAEAEAF3EFF2FFF5FFFFFAFFFFFAFFFFF6FF5CEB8A
        039D070397002E7D01247723969696E7E7E777BA7755CA6F7BDB952AC3550F97
        1F0E951C0E961C0D951B047708ECE7ECE7E6E7EAE7E9E7EEEB03971706870C05
        970A049D081DC331049D0A049902297F01467F46B3B3B3F1F1F1C1E4C130B33F
        7CDE9B58D27F29C85D30CA6030C9602DC65B0E951BF0E7F0E4E3E4E6E3E5E5E7
        E539DE6A15AE2C11AA240DA61C0AA31406A10C0A9804187E016E896ED5D5D5FC
        FCFCFFFFFF2DAC2D76E19D84E1A337CD6930CB6533CC6630C9630E961EECE5EC
        E2E1E2E3E0E3E1E2E130DE5F16AF2F12AB270EA71F0BA41606A00E1196061A7D
        16A9ACA9EDEDEDFFFFFFFFFFFFB3E3B333B54582E6A87ADE9C2FCB6332CC6632
        CB6610951FFBE9FBF4E7F4F6E7F6EEE6EF2AD95C17B03013AC280FA8200BA418
        07A4110E8805709870DCDCDCFCFCFCFFFFFFFFFFFFFFFFFF60BC6059CE7682E3
        A677DD9932CD6630CC641198232288241A851C1B841C1B831B22C24518B13114
        AD2911AA220BA7190A9E0F3C8B3CCDCECDF7F7F7FFFFFFFFFFFFFFFFFFFFFFFF
        F8FCF843AB4358CC7580E3A580E0A150D37C2BC95F29C65726C15124BD4A20B9
        421CB53A18B13114AD2911AC240AA2172C8B2CC4CBC4F6F6F6FFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFF8FCF861BF6136B84779E3A17FE3A375DD9853D178
        39C65F27BF4C1DB9401BB53A1FB63A23B63A0E9E17449D44D1D9D1F8F8F8FFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB3E3B32DAF2E35
        B94A5DD07E6EDC926BD98C64D5835CD07944BF5922A52C21932392C492EEEEEE
        FCFCFCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFC1E4C177BB7745A54530A0312F9D2F3F9D3F6BAE6BADCEADF0
        F2F0FCFCFCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
      Layout = blGlyphLeft
      NumGlyphs = 1
      ExplicitLeft = 2
      ExplicitWidth = 126
      ExplicitHeight = 43
    end
    inherited bt_alterar: TBitBtn
      Left = 255
      Width = 126
      Height = 43
      Caption = 'Alterar dados'
      Glyph.Data = {
        F6060000424DF606000000000000360000002800000018000000180000000100
        180000000000C0060000EB0A0000EB0A00000000000000000000FFFFFFF9F9F9
        E7E7E7DEDEDEE2E2E2EAEAEAF2F2F2F9F9F9FEFEFEFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFE6E6E69F9F9F8080808A8A8A9E9E9EB5B5B5CBCBCBDADADAE4E4E4
        ECECECF5F5F5FCFCFCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFB38989A073739874748D78787F7574706D6D6C
        6C6C7B7B7B8F8F8FA6A6A6BDBDBDD1D1D1DEDEDEE7E7E7F1F1F1FCFCFCFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFAFBFBA67272EAC7C7FFF7F7ECD3
        CF9686B5AE8893A97C7B9979798B7A7A7C74746C6A6A707070818181979797B8
        B8B8E9E9E9FEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7F3F3A47071
        E9C7C4FFFAFBFFFDF77089FFF6EFFAFFFAFAF6E3E4DFC1C1C8A3A3B284849F77
        779379798678787F7E7ED1D1D1FBFBFBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFF0EBEBA97576ECCABFFFEACCFFEBC36378E8FFE8CEFFEBDFFFF2F0FFF2F4
        FFF5F8FFF6F8FFF1F3EFD7D8B184847D7878D0D0D0FCFCFCFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFE9E1E1AF7A7AF1D6D8FFFBFFFFFFFA5E7DFFFFF7E8FF
        EAD8F3D6B9EBCDADFEDCBAFFDEC2FFE3D4FFF3EDB68B8A787777D7D7D7FFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE3DADAB47F80F4D3C1FFEACBFFEC
        C56079EDFFF4DCFFEFE9CEC4C5F1E6EAFFF4FAFFEFEEFFE5D9FFE5CBAD7E7B7A
        7A7ADCDCDCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDED1D1B98485
        F5E3E6FFFCFFFFFFF86282FAFFF8DFC8B9AB5D564BBBA68EFFDCBCFFE5C9FFE5
        D2FFF1E4AB7D7F828282E0E0E0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFD8C9C9BF8A8AF9E0D1FFF2E2FFF9E76784FAFFFFFADBDBE16178895F6B7C
        305648538A56ABC094FFEFE3A47C7C8B8B8BE3E3E3FFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFD3C1C1C69091FAEAE6FFF5E8FFF6DB6982EEFFEDC5FB
        E1C576A0C244A36C1399291D9D3200740686AD7DA98085868686DBDBDBFDFDFD
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCFBABACB9595FCF6F8FFFEFFFFFF
        FE6C8CFFFFFFFEFFFFFF64AFA21FAF3F5DF28B4CD6702EAD4600760A6C7E5F68
        6868B2B2B2EBEBEBFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCBB3B3D09B9C
        FEE8CFFFEBCDFFEEC86F87EAFFEAC3FFE5C86BC27E41DB6F67FF9A59EC8647D0
        6A2AA640097A145D705E757575BBBBBBEEEEEEFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFC7ACACD7A1A1FFFFFFFFFFFFFFFFFF7A99FFFFFFFFFFFDFFBFE8CC20BF50
        5DF88D64FD9658EA8444CC6628A23C127A1A5E6B5E7B7B7BC1C1C1F1F1F1FFFF
        FFFFFFFFFFFFFFFFFFFFC3A6A6DCA8A9FFEFD2FFEDCBF0DECD8C9BE5FFEAC5FF
        E6C8FFE6D084CA7D2CC75A61FB9064FB9456E78141C862239C36177A1F5D665D
        808080C6C6C6F4F4F4FFFFFFFFFFFFFFFFFFC1A0A0E2B0B1FFFFFFFFFFFFE2EA
        FF9EB5FFFFFFFFFFFBFEFFFAFCFFFBFF5BCD8039D46862FD9262F99354E47E3E
        C25C2199331E7C255E635E858585CBCBCBF6F6F6FFFFFFFFFFFFBF9B9BEBB9B7
        FFF9E8FFF5E4D4D4E8AFB9EBFFF3DDFFEFDCFFEDDAFFECDAFFEAD93DBE5B46DF
        7462FC9461F89152E27B39C357278A355074516262628B8B8BD3D3D3F9F9F9FF
        FFFFBB9494F2C3C1FFFCF0FFFAEBC9CFF2C0CAF3FFFBECFFF5EAFFF6EBFFF3E8
        FFF0E7F0EEE230C76051EA7D62FE945EFB8F6AA47A7C72797471717674706161
        61989898DEDEDEFCFCFCB99090FAD0D0F8FCFDF9F9F7B1BDE3C8D3F2C9C9C9E9
        E9EAA4A4A5E3E1E2706F70ECE3E74C6C572BCA5D55F4838BAA97B2ABAFD6D3CB
        7C82A72733AA4C4F9A666666ACACACEEEEEEBB8D8DFFDFDF6265659797976463
        618E8D8C6B6C6C7F80807F80807879798B8C8C7B7979998A9034744870BC88CA
        C2C6FFFFFF7D92E8213FD82136CA0B12A9585888898989E3E3E3BC8E8EFFDADA
        E1DEDE373837C1BCDE393B39E2C3C33B3D3DC7A4A4424141A67F7F504E4E9E7E
        7E5C585AB7BFB9D1CDC68399ED2F55E74672F92A45D30F18AD1B1B97989898E7
        E7E7C5A4A4A48080B08F8F3F4241968484484B4A867F7F5557577F7D7D606161
        777979676868747676898989DCDCDCB1B7CD2647DE4E7FFF4168F0253FCD0A11
        A742429CCACACAF7F7F7DBDCDC7274748D8E8E5959597A7B7B6363636B6B6B67
        67676363637F7F7F7F7F7F9C9C9C9C9C9CE5E5E5F9F9F9E9EDFC3C4BCB3454E0
        2F4CDA111DB117179CB8B8C8F2F2F2FFFFFFFFFFFFB5B5B5797979ADADAD9F9F
        9FC9C9C9C5C5C5EDEDEDECECECFCFCFCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFDADCF53C42B81313A35050B2CBCBDEF7F7F7FFFFFFFFFFFF}
      Layout = blGlyphLeft
      NumGlyphs = 1
      ExplicitLeft = 255
      ExplicitWidth = 126
      ExplicitHeight = 43
    end
    inherited bt_gravar: TBitBtn
      Left = 508
      Top = 3
      Width = 124
      Height = 43
      HelpType = htKeyword
      Glyph.Data = {
        F6060000424DF606000000000000360000002800000018000000180000000100
        180000000000C0060000130B0000130B00000000000000000000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCFCFCF1F1F1E7E7E7DFDFDFDCDCDCDCDC
        DCDEDEDEE6E6E6F0F0F0FAFAFAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCFCFCEEEEEED5D5D5B4B4B4969696
        828282787878777777808080939393B0B0B0D1D1D1EBEBEBFBFBFBFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7F7F7DCDCDCA9ABA96F
        896F487E48287425177111166F0F2471214176415C735C6567657A7A7AA6A6A6
        D7D7D7F5F5F5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF5F5F5CDCE
        CD709570197816167A01207D00257C002A77002D74002E72002A71001D6D0115
        6D0F5477546263628B8B8BC9C9C9F2F2F2FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        F8F8F8C4CBC43D873D048801069600009800009800009700009400088D001681
        002D7200356D00326D00206D012B722B5F645F838383C9C9C9F6F6F6FFFFFFFF
        FFFFFFFFFFFCFCFCD1D9D12C872C029705029E05029C05019A03009900009800
        009700009500009500009300108600346D00356C002C6C001D701C5F655F8B8B
        8BD7D7D7FBFBFBFFFFFFFFFFFFEEEEEE449644099C0E06A10D069F0E059E0A07
        A51713B83A14B739029E08009A000098000096000094000090002D7200386A00
        2C6D012B742B626362A6A6A6EAEAEAFFFFFFFDFDFD92C0921097150CA7180AA3
        1609A31506A81A66D385F6F5F7EDF8F33DCE6E02A00A019B0401990200980000
        94000093002E7200376C001F6C00547754797979D1D1D1FBFBFBF0F2F0218E21
        29B4370DA71C0EA71E05A71A5DC875FFF4FEF7F4F6FEF9FDFBFCFD3DCE6D03A1
        0E049D07019A04009700009500009100376C00336D00136E0E646764B0B0B0F0
        F0F0AECFAE1B9E242AB53B11AB2506A81A51BF5FFCEFFAF1EFF0F4F4F4F8F7F8
        FFFDFFFDFFFF3CCE6C04A210049D08029B04009700009500168300376D001D6F
        015C745C939393E6E6E66CAF6C3BB94B27B63F05A71745B44CF7EAF6ECEAECEE
        EDEEF8F4F7FBF7FAFCFBFCFFFFFFFEFFFF3CCE6C04A210049D08019A04009800
        009500346F002E73013F773F808080DEDEDE3F9C3F54C96926B53D33A731F5E7
        F4E7E5E7EBE9EBFCF2FAB0DCB6CDE9D1FFFBFFFCFBFCFFFFFFFEFFFF3CCE6C04
        A210049D07019A03009900207E00307401237420767676DCDCDC2C9B2C5FCE76
        2EBA4846A541F6E7F5E7E5E7FAEDFA5FBE6502AA1D04AA1FB9E3BFFFFDFFFEFD
        FEFFFFFFFDFFFF3BCD6B03A10F039C05009901118A0030760112700C777777DC
        DCDC2D9C2E64D27E46C865009C0E76B673FAE9F957B55509AD2320BA451DB73D
        06AB20BAE3BFFFFDFFFDFCFDFFFFFFFDFFFE3CCC6B02A00C009A020892002E79
        0115730E818181DFDFDF45A34565D3815FCF7A23C14D10AA2900980510AF2C28
        C25025BE4921BA441DB73F06AB1FB8E2BEFFFBFFFAF9FAFFFCFFF9FAFB3ACB68
        009F080395002B7D01267723969696E7E7E777BB7753C86C76D9912DC5572BC6
        5B2DC75D2DC65A29C25427C05025BE4C22BC461DB73E05AA1DB8E0BCFFF9FFF8
        F7F8FCF8FBF5F7F83BCB67029700267F01467F46B3B3B3F1F1F1C1E3C130B13F
        78DC9657D27E2CC85E30CA6030C9602DC65B2CC55627C05024BD4A21BA441DB6
        3B04A91BB6DEBBFDF5FDF4F2F3FFF6FE9CE1B50B9E11177E016E896ED5D5D5FC
        FCFCFFFFFF2DAA2F72DE977FDF9F39CE6B32CB6533CC6630C9632DC65D2AC355
        26BF4E22BB461EB74019B33602A818B3DBBAFFF5FFF3EFF332C2550D94011A7D
        16A9ABA9EDEDEDFFFFFFFFFFFFB3E1B333B3457EE3A377DE9932CC6433CC6632
        CB6631CA612CC55A28C15124BD491FB8411BB43A16B03005A81A4CBD5B15B02F
        05A4110C8805709870DCDCDCFCFCFCFFFFFFFFFFFFFFFFFF60BA6056CC737EE1
        A175DD9735CE6831CC6531CB642DC65C28C15224BD4A20B9421CB53B18B13114
        AD290DA91E0AA417099C0E3C8B3CCDCECDF7F7F7FFFFFFFFFFFFFFFFFFFFFFFF
        F8FCF843AB4356CA727BE1A17CDF9E50D37C2ECA612AC65827C15224BD4A20B9
        421CB53A18B13114AD2911AC2309A0172C8B2CC4CBC4F6F6F6FFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFF8FCF861BD6136B64775DF9B7AE19E72DB9452D077
        3AC66028BF4D1FB9401CB53B1FB63A22B5370E9C17449B44D1D9D1F8F8F8FFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB3E1B330AD3135
        B74959CE796AD98C67D68660D27D57CD7341BD5421A42C22932592C392EEEEEE
        FCFCFCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFC1E3C177BC7745A64532A235309F333F9F3F6BAF6BADCFADF0
        F2F0FCFCFCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
      Layout = blGlyphLeft
      NumGlyphs = 1
      ExplicitLeft = 508
      ExplicitTop = 3
      ExplicitWidth = 124
      ExplicitHeight = 43
    end
    inherited bt_cancelar: TBitBtn
      Left = 633
      Width = 126
      Height = 43
      Glyph.Data = {
        F6060000424DF606000000000000360000002800000018000000180000000100
        180000000000C0060000130B0000130B00000000000000000000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFF7F7F7E4E4E4DCDCDCDBDBDBDADADADADADADADA
        DADADADADBDBDBDCDCDCE5E5E5F7F7F7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF4F4F4CBCBCB919191787878747474
        747474747474747474747474747474787878929292CCCCCCF4F4F4FFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF4F4F4BABAC82B33AF10
        1EB6101DB40E1AB40F1AB10F1AB00F19AF0F18AE0F18AD2B2D9C5F5F64878787
        CBCBCBF4F4F4FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF4F4F4BABA
        CA2730B5123DF1174DFF154BFF164AFF1549FF1248FF1147FF1046FF1046FF0A
        33EC272A9E5E5E64878787CBCBCBF4F4F4FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        F4F4F4BABACA2732B71541F2194DFF1949FF1748FF1647FF1546FF1345FF1244
        FF1143FF0F43FF0F43FF0B33ED27299E5E5E64868686CBCBCBF4F4F4FFFFFFFF
        FFFFFFFFFFF4F4F4BABACB2633BA1843F21C50FF1B4CFF1A4BFF194AFF1849FF
        1748FF1547FF1446FF1345FF1143FF1042FF0F43FF0A34ED272BA05E5E648787
        87CBCBCBF4F4F4FFFFFFF7F7F7BCBDCD2735C01B46F42053FF1E4FFF1D4EFF1C
        4DFF1B4CFF1A4BFF194AFF1749FF1648FF1547FF1345FF1244FF1042FF0F44FF
        0B35EE272BA15E5E64878787CCCCCCF7F7F7D0D1E32738C41C48F42355FF2252
        FF2051FF1F50FF1E4FFF1D4FFF1C4DFF1B4CFF194BFF184AFF1748FF1547FF13
        45FF1244FF1042FF0F43FF0A33ED272CA25E5E64919191E4E4E42C3FD11F4BF6
        2758FF2356FF2354FF2253FF2152FF2052FF1F51FF1E4FFF1D4EFF1B4DFF1A4B
        FF184AFF1749FF1547FF1345FF1244FF1043FF0F43FF0B35EF2A30A3767676DC
        DCDC0C29D72C5EFF2657FF2254FF174CFF154AFF1C50FF2053FF1649FF174BFF
        1D4FFF1549FF0D41FF0D43FF1547FF0C40FF0B3FFF1245FF1143FF0F43FF1147
        FF0A18B7727272DADADA0B29D82D61FF2656FF5078FFE6ECFFF2F5FF7998FF11
        47FFDDE5FF9FB3FF1044FF7A97FFF3F5FFD2DBFF1347FFBBCAFFB6C6FF0B3FFF
        1345FF1143FF1146FF0A19B9727272D9D9D90D2BDB3162FF2155FFCCD8FFDFE6
        FFB5C6FFFFFFFF053DFFFFFFFFBFCDFF033DFFFFFFFFBECDFFFFFFFF7190FFDF
        E7FFDDE5FF0137FF1346FF1244FF1247FF0A1BBB727272D9D9D90C2EDF3364FF
        2A5BFF4973FF85A2FFFBFDFFE6EBFF0840FFFFFFFFBDCAFF033BFFFFFFFFABBE
        FFFFFFFF7997FFDAE1FFEBF0FF6586FF1547FF1244FF1348FF0A1CBF727272D9
        D9D90C2EE23566FF285AFF8BA6FFFFFFFFE5EBFF3564FF1248FFFFFFFFBBCBFF
        033CFFFFFFFFADBFFFFFFFFF7998FFD9E0FFEEF2FFFFFFFF8EA6FF0D40FF1649
        FF091CC0727272D9D9D90D30E3396AFF2659FFDFE6FFE0E8FF90AAFFA7BCFF2E
        5EFFFFFFFFC6D3FF1C4FFFFFFFFFACBFFFFFFFFF7997FFDBE3FFC5D2FFDFE7FF
        96ADFF0D40FF174AFF091EC4727272DADADA0D33E73A6CFF2E5EFF97AFFFFFFF
        FFFFFFFF8FA9FFF1F4FFFFFFFFFFFFFFB6C6FFAFC2FFFFFFFFFFFFFF2D5CFFEC
        F1FFFFFFFFFFFFFF567BFF1244FF164BFF0B1FC5767676DCDCDC0D34EA3F6FFF
        3767FF2D60FF3262FF3363FF3162FF3261FF2D5FFF285AFF2557FF1C4FFF2759
        FF1B4DFF1C4FFF1348FF0D42FF0B40FF1446FF1849FF184DFF0B20CA909090E4
        E4E42B4AED3160FC3C6DFF3868FF3867FF3B6AFF406DFF4672FF4671FF3F6BFF
        3563FF2C5CFF2859FF2657FF2355FF2152FF1F50FF1D4EFF1B4CFF194DFF1340
        F62939C0CBCBCBF7F7F7E4E8FF2747EE315FFA3D6EFF3A69FF3D6BFF426FFF48
        74FF4973FF406DFF3664FF2D5DFF295AFF2757FF2455FF2253FF2051FF1E4FFF
        1C50FF1441F52739C6BABBCBF4F4F4FFFFFFFFFFFFE4E8FF2748EF3361FC3E6D
        FF3D6BFF426FFF446FFF436EFF3D6BFF3564FF2D5DFF2A5AFF2858FF2556FF23
        54FF2252FF1F53FF1845F7273BCABABBCCF4F4F4FFFFFFFFFFFFFFFFFFFFFFFF
        E4E8FF2749F23260FB3E6DFF3D6BFF3F6BFF3C6AFF3966FF3161FF2D5DFF2B5B
        FF2859FF2657FF2356FF2355FF1A46F7263CCDBABBCDF4F4F4FFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFE4E8FF2749F33260FD3D6CFF3868FF3666FF3363FF
        3060FF2E5EFF2B5CFF2959FF2657FF2758FF1D4AFA273ED2BABCCDF4F4F4FFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE4E8FF274BF43060FC3E
        6DFF396AFF3868FF3464FF3262FF3060FF2C5FFF2C5DFF1E4CFA2740D6BCBECF
        F4F4F4FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFE4E8FF2B4EF40D39F30D37F10D37F00C36EF0C35ED0D34ED0B33EA0C33EA2C
        49E5D0D2E5F7F7F7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
      Layout = blGlyphLeft
      NumGlyphs = 1
      ExplicitLeft = 633
      ExplicitWidth = 126
      ExplicitHeight = 43
    end
    inherited bt_sair: TBitBtn
      Left = 887
      Width = 126
      Height = 43
      Caption = 'S&air'
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
      ExplicitLeft = 887
      ExplicitWidth = 126
      ExplicitHeight = 43
    end
    inherited bt_excluir: TBitBtn
      Left = 382
      Width = 126
      Height = 43
      Caption = 'Excluir entrada'
      Glyph.Data = {
        F6060000424DF606000000000000360000002800000018000000180000000100
        180000000000C0060000EB0A0000EB0A00000000000000000000FFFFFFF5F5F5
        E4E4E4DCDCDCDADADADADADADADADADADADADADADADADADADADADADADADADADA
        DADADADADADADADADADADADADADADADADADADADADADADCDCDCE4E4E4F5F5F5FF
        FFFFF5F5F5C9C9C9909090787878737373737373737373737373737373737373
        7373737373737373737373737373737373737373737373737373737373737878
        78919191CACACAF5F5F5C1C2DD2F38B60E1CB80C19B30C17B20C16AE0C15AC0C
        14AB0C13A70C12A70C10A40C0FA30C0E9F0C0D9D0C0D9D0C0D9C0C0C9B0C0C9B
        0C0C9A0D0D9A2D2D9562626D919191E4E4E42F3CC53A50DA051ECC0017C90016
        C60015C40013C20010BE0011BC0010BA000EB7000DB4000CB1000AAF0006AB00
        05A60006A70005A50004A200029F01039E2D2D95767676DCDCDC1A2DCA4A64EC
        001FE00023E00022DD001DDB0D38EE133FF10019D5001DD4001BD1001BCE0018
        CB0010C51635DB264CE60008B8000EB7000DB4000AAD0103A0090999727272DA
        DADA1D32CF506CF10020E50025E40021E3002CEF7C99F398AEF20935EF001AD7
        001DD5001BD20015CC0D2FDD8FAFFFBACEFF1A40E20007B7000EB7000DB40104
        A208089A727272D9D9D91F36D35773F50023EB0027EA0029F46A87F3F1EDDDF3
        EEE18EA8F40735F0001BD9001AD6072DE283A3FFFFFFF7FFFFFAB2C8FF193FE1
        0007B7000EB70105A408089B717171D9D9D92037D55D7CFB0026F10026F96080
        F2EFEBDBE2E2E0E6E6E4F7F3E790AAF70330EF0028E6789AFFFFFFF7FCFCFAFF
        FFFEFFFFFEB4CBFF193DE00008B70106A608089B717171D9D9D9223CDA6683FE
        0023F85D79EFEFEBD8E0E0DEE1E1E1E5E5E5E9E9E8FDF9EC89A3F96287FDFFFF
        F6FCFBF9FCFCFCFEFEFEFFFFFFFFFFFFB9CEFF2245E40105A508089C717171D9
        D9D9243DDC6D8DFF0025FA637CE9F1EDD9E1E1DFE2E2E2E6E6E6E9E9E9EEEEED
        FAF8F1FCFBF4FBFAF8FBFBFBFFFFFFFFFFFFFFFFFFFFFFFFA7C1FF1C3EDF0106
        A808099E717171D9D9D92841DE7596FF0033FF0027FB5F79EAF4EFDEE5E5E3E7
        E7E7EAEAEAEEEEEEF2F2F2F5F5F5F9F9F9FEFEFEFEFEFEFFFFFFFFFFFF9FBAFF
        1236E1000FC4010AAE080AA1717171D9D9D92945E07EA0FF003AFF053EFF002A
        FB617BEBF8F3E4E9E8E7EBEBEBEFEFEFF2F2F2F6F6F6FAFAFAFDFDFDFFFFFFFF
        FFFF97B2FF0C34E60014CC0017CC010BB0080CA4717171D9D9D92B4AE488A8FF
        003FFF0845FF0743FF002BFB637CECF2F0E7EBEBEBEFEFEFF3F3F3F6F6F6FAFA
        FAFFFFFFFFFFFF8CA8FF0430EC0018D5001BD2001BCE010DB3080DA6717171D9
        D9D92E4DE590B0FF0246FF0B4BFF0A4BFF0038FC2447ECEEECE8EBEBEBEFEFEF
        F3F3F3F6F6F6FAFAFAFFFFFFFFFFFF6487FF0026E7001DD9001DD5001BD1010E
        B6080FA9717171D9D9D92F51E89ABAFF074EFF0F55FF023FF92845E1F2F0E3EA
        EAE7EBEBEBEEEEEEF2F2F2F6F6F6F9F9F9FDFDFDFFFFFFFFFFFF6B8FFF0028E8
        001CD7001DD4010FB70810AC717171D9D9D93152EAA1C1FF0956FF0546F6273D
        D4EDEBDFE7E6E3E6E6E6EAEAEAEDEDEDF1F1F1F5F5F5F8F8F8FCFCFCFEFEFEFF
        FFFFFFFFFF698EFF0026E5001BD50111BA0811AE717171D9D9D93557ECABCCFF
        0246F32939C8E9E7DBE2E1DEE2E2E2E5E5E5E9E9E9EDEDECFAF9F0FDFCF3F9F9
        F7FAFAFAFDFDFDFEFEFEFFFFFFFFFFFF6D90FF062DE40110BC0813B1717171D9
        D9D93558EEB3D3FF001DD19090CAECE9DCDEDEDDE1E1E1E4E4E4EAEAE8FFFBEB
        7186ED738BF2FFFFF5FAF9F8FBFBFBFFFFFFFFFFFEFFFFFFCAD7FF1141F70112
        BF0814B4717171D9D9D9385BF2BAD8FF116DFF001DCF9495CDEAE8DEE0E0DFE5
        E5E4F8F5E77B8BE40026F30025F77D92F2FFFFF6F9F9F8FCFCFBFFFFFDC4D0FF
        0133F8001CDC0115C20816B8727272D9D9D93A5EF4C2DDFF146FFF1F77FF001C
        CE9597CEEDEBE1F4F1E37984DA0027EB0A4CFF0744FF0023F68294F2FFFFF5FF
        FFF8BCCAFC002BF90021E10021DD0116C50817BA727272DADADA3C61F6C8E3FF
        1674FF2177FF1F77FF001BCCA3A3D08085D10026E30F56FF0B4BFF0846FF053E
        FF0020F68A9BF2C3CDF60022FC0025EA0025E40023E10117C80818BC767676DC
        DCDC3F65F8D3EBFF2B83FF1875FF1772FF136EFF0019CA0024D90C5AFF094FFF
        0448FF0241FF003CFF0034FF0020F50021F30026F10024EB0022E5001FE00116
        C90B1EC2909090E4E4E4345BFAC8E6FFC8E5FFA2CCFF9DC7FF97C0FF90BCFF89
        B6FF80ABFF7AA3FF729AFF6A92FF628AFF5B7FFF5377FF4D6FFD4769F84261F3
        3C5BEE3854E7394DD73141BFC9C9C9F5F5F5D1D8FF345CFA3C64F93B61F73A5E
        F5385EF43559F23357F03254EF2F51EC2C4FEA2B4DEA2A49E72646E42442E422
        3FE11F3BDE1E38DC1C36D91B33D43143CFC1C3DFF5F5F5FFFFFF}
      Layout = blGlyphLeft
      NumGlyphs = 1
      ExplicitLeft = 382
      ExplicitWidth = 126
      ExplicitHeight = 43
    end
    inherited bt_consultar: TBitBtn
      Left = 128
      Width = 126
      Height = 43
      Caption = 'Consultar'
      Glyph.Data = {
        F6060000424DF606000000000000360000002800000018000000180000000100
        180000000000C0060000EB0A0000EB0A00000000000000000000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFF7F7F7E4E4E4E4E4E4F4F4F4FDFDFDFFFFFFFF
        FFFFFEFEFEF1F1F1DEDEDED9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9
        D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D7D7D7C1C1C18E8E8E909090BABA
        BAD9D9D9F1F1F1FEFEFEF1F1F1B9B9B98080806F6F6F6E6E6E6E6E6E6E6E6E6E
        6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6F6F72868178
        7877776969696464647D7D7DB9B9B9F1F1F1E7CEA8FF9A01FF9900FF9900FF99
        00FF9900FF9900FF9900FF9900FF9900FF9900FF9900FF9900FF9900FF9900F9
        B7590645FF4E85E6E5DACF857459FFAC2E80725D808080DFDFDFFF9900FFE5E5
        FFE6E6FFE6E6FFE6E6FFE6E6FFE6E6FFE5E5FFE3E3FFE2E2FFE1E1FFDFDFFFDE
        DEFFDCDCF7E1E70C4AFF469CFF64D7FF659DE98E8781FFCCCCFF99006F6F6FD9
        D9D9FF9900FFE8E8FFE9E9FFE9E9FFE9E9FFE9E9FFE9E9FFE8E8FFE7E7FFE6E6
        FFE5E5FFE2E2FFE0E0F3DCE50B49FF49A2FF6FD9FF57B7FF0F5AFFDAB8C5FFCD
        CDFF99006E6E6ED9D9D9FF9900FFEBEBFFECECFFECECFFECECFFECECFFECECFF
        EFEFFFEEEEFBEAEAFAE7E7FFEAEAF1D8D78481853B8CE16EDDFF56B4FF195BFF
        E3C2DAFFD1D1FFCECEFF99006E6E6ED9D9D9FF9900FFEFEFFFF0F0FFF0F0FFF0
        F0FFF0F0FFF3F3CCC2C488888B7D7C797F7D7A88868A9F9596AEAAA5C0C7C241
        9AE91456FFE6C9DDFFD5D5FFD2D2FFD0D0FF99006E6E6ED9D9D9FF9900FFF2F2
        FFF3F3FFF3F3FFF3F3FFF5F5A3A1A3B5AA96F5D094FBD293FBD39AFCD79DC2B4
        A0808389C4C0BB82808EE9CEE0FFDADAFFD7D7FFD4D4FFD1D1FF99006E6E6ED9
        D9D9FF9900FFF4F4FFF7F7FFF7F7FFF7F7DBD7D7AEA593FCD79AF1D19BEFD099
        EECD91F0CF97FAD79FC1B39E9A9091EAD1D0FFDEDEFFDCDCFFD9D9FFD5D5FFD2
        D2FF99006E6E6ED9D9D9FF9900FFF8F8FFF9F9FFFAFAFFFAFA949397F4D8A2F5
        DDAAF1DBAAF1DBA9F0D4A2EFD097F0CE9AFEDAA38F8C8FFFE2E2FFDFDFFFDDDD
        FFDADAFFD6D6FFD3D3FF99006E6E6ED9D9D9FF9900FFFAFAFFFCFCFFFDFDFFFD
        FD828280FFE8B5F6E5BEF7E7C0F5E2B8F3DDB1F1D6A5F0D095FDDAA4868483FF
        E8E8FFE1E1FFDEDEFFDBDBFFD7D7FFD4D4FF99006E6E6ED9D9D9FF9900FFFDFD
        FFFFFFFFFFFFFFFFFF848383FFF3C8FCF5DCFAF3D6F7ECC8F6E7BDF3DCADF0D3
        9EFED9A1848382FFEAEAFFE1E1FFDEDEFFDCDCFFD9D9FFD5D5FF99006E6E6ED9
        D9D9FF9900FFFFFFFFFFFFFFFFFFFFFFFFB4B5B6EFE6C5FFFFF0FEFEFCFCF6DB
        F7ECC7F6E1B3F3D7A4F4D8A4918E92FFEAEAFFE2E2FFDFDFFFDCDCFFD9D9FFD5
        D5FF99006E6E6ED9D9D9FF9900FFFFFFFFFFFFFFFFFFFFFFFFF3F3F3A5A39CFF
        FFECFFFFF7FDF9E5F9EECCF7E3B6FFE1A6A49D91DBCBCCFFEAEAFFE2E2FFDFDF
        FFDCDCFFD9D9FFD5D5FF99006E6E6ED9D9D9FF9900FFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFEAEAEBA5A49EE8E3C7FFFCD3FFF2C2E9D5ABA29C94C8BFC1FFEDEDFF
        E6E6FFE2E2FFDFDFFFDCDCFFD9D9FFD5D5FF99006E6E6ED9D9D9FF9900FFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF2F2F2A5A5A78080838081819A989BE4DA
        DAFFECECFFE9E9FFE6E6FFE2E2FFDFDFFFDCDCFFD9D9FFD5D5FF99006E6E6ED9
        D9D9FF9900FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCFCFFFAFA
        FFF8F8FFF3F3FFF0F0FFECECFFE9E9FFE6E6FFE2E2FFDFDFFFDCDCFFD9D9FFD5
        D5FF99006E6E6ED9D9D9FF9900CFCDCDCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCF
        CDCDCFCBCBCFC9C9CFC7C7CFC4C4CFC2C2CFC0C0CFBDBDCFBBBBCFB8B8CFB6B6
        CFB3B3CFB1B1CFAFAFFF99006E6E6ED9D9D9FF9900FFAD3DFF9900FF9900FF99
        00FF9900FF9900FF9900FF9900FF9900FF9900FF9900FF9900FF9900FF9900FF
        9900FF9900FF9900FF9900FF9900FF9900FF99006F6F6FD9D9D9FF9900FFCC99
        EB8500EB8500EB8500EB8500EB8500EB8500EB8500EB8500EB8500EB8500EB85
        00EB8500EB8500EB8500EB8500EB8500EB8500EB8500F79100FF9900808080DF
        DFDFFF9900FFCC99FFCC99FFCC99FFCC99FFCC99FFCC99FFCC99FFCC99FFCC99
        FFCC99FFCC99FFCC99FFCC99FFCC99FFCC99FFCC99FFCC99FFCC99FFCC99FFAD
        3DFF9900B9B9B9F1F1F1FEE2B8FF9A01FF9900FF9900FF9900FF9900FF9900FF
        9900FF9900FF9900FF9900FF9900FF9900FF9900FF9900FF9900FF9900FF9900
        FF9900FF9900FF9A01E6CDA7F1F1F1FEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
      Layout = blGlyphLeft
      NumGlyphs = 1
      ExplicitLeft = 128
      ExplicitWidth = 126
      ExplicitHeight = 43
    end
    inherited bt_imprimir: TBitBtn
      Left = 760
      Top = 2
      Width = 126
      Height = 43
      Caption = 'Imprimir espelho'
      Glyph.Data = {
        F6060000424DF606000000000000360000002800000018000000180000000100
        180000000000C0060000130B0000130B00000000000000000000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEF7F7F7
        EBEBEBEBEBEBEEEEEEE5E5E5E4E4E4F1F1F1FCFCFCFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7
        F7F7E5E5E5C4C4C4A1A1A1A1A1A1AAAAAA909090909090B4B4B4D9D9D9EEEEEE
        FBFBFBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFF9F9F9E8E8E8C9C9C99D9D9D89898983838373737382828280808075757566
        6666838383AEAEAED4D4D4ECECECFAFAFAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFAFAFAEBEBEBCECECEA3A3A39090909B9B9BDBDBDBA0A0A0919191D1D1
        D19C9C9C8A8A8A7F7F7F7878786464647D7D7DA7A7A7D0D0D0EAEAEAF9F9F9FF
        FFFFFFFFFFFCFCFCEEEEEED3D3D3A7A7A7949494999999D6D6D6F7F7F7F4F4F4
        ABABABB7B7B7E5E5E59F9F9FA7A7A7A3A3A38D8D8D7C7C7C7A7A7A6464647878
        78A2A2A2D2D2D2F7F7F7F9F9F9DCDCDCADADAD9696969A9A9AD2D2D2F6F6F6F4
        F4F4E6E6E6DADADA989898ABABABD5D5D5898989929292A4A4A4A9A9A9A8A8A8
        9090907979797B7B7B6767678F8F8FE4E4E4E4E4E4A3A3A39A9A9ACDCDCDF5F5
        F5F3F3F3E7E7E7DCDCDCEAEAEAF5F5F59E9E9EB2B2B2F2F2F29595959B9B9B90
        9090909090A1A1A1ABABABADADAD939393777777747474DBDBDBA9A9A9CACACA
        F2F2F2F3F3F3E7E7E7DCDCDCE9E9E9F5F5F5F7F7F7F4F4F4969696B2B2B2F7F7
        F79090909999999D9D9D9F9F9F9595959191919C9C9CB3B3B3797979727272DA
        DADAA3A3A3F8F8F8E8E8E8DCDCDCE8E8E8F5F5F5F5F5F5F5F5F5F8F8F8F6F6F6
        909090B1B1B1FDFDFD8D8D8D9696969999999B9B9B9F9F9FA3A3A39D9D9D9595
        95767676717171D9D9D9A3A3A3E2E2E2E7E7E7F4F4F4F4F4F4F5F5F5F6F6F6F8
        F8F8FAFAFAF7F7F7888888B0B0B0FFFFFF8989899393939595959898989B9B9B
        9E9E9EA2A2A2A9A9A9797979717171D9D9D9A8A8A8F9F9F9F4F4F4F4F4F4F6F6
        F6F7F7F7F8F8F8FAFAFAFDFDFDFAFAFA848484B0B0B0FFFFFF86868691919192
        92929595959898989B9B9B9D9D9DA4A4A47B7B7B717171D9D9D9AAAAAAF9F9F9
        F5F5F5F6F6F6F8F8F8F9F9F9FBFBFBFDFDFDF5F5F5E6E6E6727272A1A1A1F8F8
        F87676768181818A8A8A9393939696969797979A9A9AA1A1A1797979717171D9
        D9D9AEAEAEFDFDFDF7F7F7F9F9F9FAFAFAFBFBFBFEFEFEF7F7F7F1F1F1FAFAFA
        777777ABABABFFFFFF8888888686868686868383838686869292929898989F9F
        9F7B7B7B727272DADADAAFAFAFFEFEFEF9F9F9FBFBFBFCFCFCFFFFFFFFFFFFEA
        EAEAFFFFFFF3F3F3939293B7B7B7E8E8E8BBBBBBBEBEBEA9A9A98B8B8B8D8D8D
        8888888787878D8D8D7D7D7D727272DADADAB2B2B2FFFFFFFBFBFBFDFDFDFEFE
        FEFFFFFFF0F0F0FBFBFBFFFFFFCFD3CFABADACB5B4B4A6A6A6E6E6E6C1C1C1A6
        A6A6BDBDBDB3B3B39F9F9F8E8E8E9494947C7C7C838383E0E0E0B6B6B6FFFFFF
        FFFFFFFEFEFEFFFFFFF9F9F9F1F1F1FFFFFFFFFEFF78D89395DAA5D2CFD2FFFF
        FFFFFFFFFFFFFFFFFFFFDFDFDFBDBDBDACACACC1C1C1C2C2C27D7D7DB6B6B6F0
        F0F0B8B8B8FFFFFFFFFFFFFFFFFFF6F6F6F0F0F0FFFFFFFFFFFFDAD9D99EB0A5
        C1C4B8FFFCEEFFFAF4FFFDFBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCFCFCF9191
        91B0B0B0EAEAEAFDFDFDB9B9B9F5F5F5EDEDEDEEEEEEF7F7F7FFFFFFFFFFFFEC
        ECECC4C4C4C1C1C4F2DAB4FFEAC4FFEDCDFFF1D8FFF6E4FFFCF0FFFFFCFFFFFD
        CCCCCC969696C8C8C8F1F1F1FEFEFEFFFFFFB8B8B8FFFFFFFFFFFFFFFFFFFBFB
        FBF0F0F0E0E0E0D0D0D0CECFCF9F9B93AB9C7FC9B591E1CAA0EBD4ACE2CFB1C8
        BEAEACA8A39B9B9ABEBEBEEBEBEBFBFBFBFFFFFFFFFFFFFFFFFFB7B7B7EDEDED
        EEEEEEEDEDEDE7E7E7E2E2E2DFDFDFD5D5D5B2B2B28383857475776264668B8D
        918A8C8E939496AEAEAED7D8D8F7F7F7FEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFEAEAEAD5D5D5CBCBCBC4C4C4BBBBBBC1C1C1C7C7C7CCCCCCD5D5D5DDDDDD
        E0E0E0DADADAC9C9C99F9F9FB8B8B8E8E8E8FDFDFDFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFDFDEFEFEFE1E1E1D2
        D2D2C1C1C1B2B2B2A6A6A6A6A6A6B6B6B6CCCCCCEEEEEEFCFCFCFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
      Layout = blGlyphLeft
      NumGlyphs = 1
      ExplicitLeft = 760
      ExplicitTop = 2
      ExplicitWidth = 126
      ExplicitHeight = 43
    end
  end
  object Panel8: TPanel
    Tag = 99
    Left = 0
    Top = 0
    Width = 1014
    Height = 47
    Align = alTop
    Color = clBlack
    TabOrder = 2
    OnExit = btAdicionaItemClick
    object Label46: TLabel
      Left = 340
      Top = 10
      Width = 341
      Height = 32
      Caption = 'ENTRADA DE PRODUTOS'
      Font.Charset = ANSI_CHARSET
      Font.Color = clLime
      Font.Height = -27
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
    end
  end
  object pvdDadosNota: TXMLTransformProvider
    TransformRead.TransformationFile = 'C:\restaurante\tdItensNota.xtr'
    XMLDataFile = 
      'C:\restaurante\XML\29130100759857000190550010000299221736494435-' +
      'nfe.xml'
    Left = 40
    Top = 16
  end
  object cdsDadosNota: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'pvdDadosNota'
    Left = 72
    Top = 16
  end
  object DataSource1: TDataSource
    DataSet = cdsDadosNota
    Left = 104
    Top = 24
  end
  object PopupMenu1: TPopupMenu
    Left = 581
    Top = 446
    object Excluirtem1: TMenuItem
      Caption = 'Excluir '#237'tem'
      OnClick = Excluirtem1Click
    end
  end
end
