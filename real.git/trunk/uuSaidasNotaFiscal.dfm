inherited frm_saidas: Tfrm_saidas
  Left = 211
  Top = 12
  Caption = 'Sa'#237'das por Nota Fiscal'
  ClientHeight = 679
  ClientWidth = 1014
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited pn_principal: TPanel
    Top = 56
    Width = 1014
    Height = 572
    ExplicitTop = 56
    ExplicitWidth = 1014
    ExplicitHeight = 572
    inherited pn_codigo: TPanel
      Left = 3
      Top = 3
      Width = 125
      Height = 49
      Align = alNone
      ExplicitLeft = 3
      ExplicitTop = 3
      ExplicitWidth = 125
      ExplicitHeight = 49
      inherited bt_pesquisa: TSpeedButton
        Left = 97
        Top = 17
        Width = 25
        Height = 25
        ExplicitLeft = 97
        ExplicitTop = 17
        ExplicitWidth = 25
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
        Width = 87
        ExplicitWidth = 87
      end
    end
    object pnFornecedor: TPanel
      Left = 129
      Top = 0
      Width = 885
      Height = 53
      TabOrder = 1
      object Panel1: TPanel
        Left = 87
        Top = 136
        Width = 434
        Height = 26
        BevelOuter = bvNone
        Enabled = False
        TabOrder = 0
      end
      object GroupBox1: TGroupBox
        Left = 4
        Top = -1
        Width = 1045
        Height = 53
        Caption = 'Dados do Cliente'
        TabOrder = 1
        object Label2: TLabel
          Left = 3
          Top = 13
          Width = 74
          Height = 13
          Caption = 'Cod. Cliente:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object bt_pesq_fornecedor: TSpeedButton
          Left = 73
          Top = 27
          Width = 20
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
          Left = 99
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
        object Label27: TLabel
          Left = 453
          Top = 13
          Width = 33
          Height = 13
          Caption = 'CJPJ:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label29: TLabel
          Left = 694
          Top = 10
          Width = 40
          Height = 13
          Caption = 'Cidade'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label28: TLabel
          Left = 846
          Top = 10
          Width = 17
          Height = 13
          Caption = 'UF'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label31: TLabel
          Left = 570
          Top = 12
          Width = 106
          Height = 13
          Caption = 'Inscri'#231#227'o Estadual'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object ed_cod_fornecedor: TDBEdit
          Left = 4
          Top = 27
          Width = 63
          Height = 21
          DataField = 'COD_FORNECEDOR'
          DataSource = dm.ds_qry_saidas
          TabOrder = 0
          OnEnter = Edit1Enter
          OnExit = Edit1Exit
          OnKeyDown = Edit1KeyDown
        end
        object Panel3: TPanel
          Left = 96
          Top = 24
          Width = 352
          Height = 24
          BevelOuter = bvNone
          Enabled = False
          TabOrder = 1
          object ed_razao_social_fornecedor: TDBEdit
            Left = 3
            Top = 4
            Width = 347
            Height = 21
            Color = clBlack
            DataField = 'XRAZAOSOCIAL'
            DataSource = dm.ds_qry_saidas
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clYellow
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 0
          end
        end
        object Panel11: TPanel
          Left = 450
          Top = 24
          Width = 116
          Height = 24
          BevelOuter = bvNone
          Enabled = False
          TabOrder = 2
          object ed_cnpj_fornecedor: TDBEdit
            Left = 3
            Top = 4
            Width = 109
            Height = 21
            Color = clBlack
            DataField = 'CNPJ'
            DataSource = dm.ds_qry_saidas
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clYellow
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 0
          end
        end
        object Panel12: TPanel
          Left = 691
          Top = 24
          Width = 154
          Height = 24
          BevelOuter = bvNone
          Enabled = False
          TabOrder = 3
          object ed_cidade_fornecedor: TDBEdit
            Left = 3
            Top = 2
            Width = 147
            Height = 21
            Color = clBlack
            DataField = 'XNOMECIDADE'
            DataSource = dm.ds_qry_saidas
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
          TabOrder = 4
          object ed_uf_fornecedor: TDBEdit
            Left = 1
            Top = 2
            Width = 29
            Height = 21
            Color = clBlack
            DataField = 'UF'
            DataSource = dm.ds_qry_saidas
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clYellow
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 0
          end
        end
        object Panel15: TPanel
          Left = 567
          Top = 25
          Width = 116
          Height = 24
          BevelOuter = bvNone
          Enabled = False
          TabOrder = 5
          object ed_ie_fornecedor: TDBEdit
            Left = 3
            Top = 2
            Width = 111
            Height = 21
            Color = clBlack
            DataField = 'IE'
            DataSource = dm.ds_qry_saidas
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clYellow
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 0
          end
        end
      end
    end
    object pn_campos: TPanel
      Left = -1
      Top = 51
      Width = 1015
      Height = 520
      TabOrder = 2
      object pnNota: TPanel
        Left = 3
        Top = 441
        Width = 1012
        Height = 78
        Caption = 'pnNota'
        TabOrder = 2
        object GroupBox2: TGroupBox
          Left = 6
          Top = 8
          Width = 1008
          Height = 68
          Caption = 'Totais da Nota:'
          TabOrder = 0
          object Label36: TLabel
            Left = 559
            Top = 25
            Width = 32
            Height = 14
            Caption = 'Frete:'
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label37: TLabel
            Left = 627
            Top = 25
            Width = 43
            Height = 14
            Caption = 'Seguro:'
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label38: TLabel
            Left = 760
            Top = 25
            Width = 60
            Height = 14
            Caption = 'Outr. Desp.'
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label39: TLabel
            Left = 832
            Top = 9
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
          object Label44: TLabel
            Left = 693
            Top = 25
            Width = 52
            Height = 14
            Caption = 'Desconto'
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object edValorFrete: TDBEdit
            Left = 560
            Top = 38
            Width = 60
            Height = 21
            DataField = 'FRETE'
            DataSource = dm.ds_qry_saidas
            TabOrder = 0
            OnKeyDown = Edit1KeyDown
          end
          object edValorSeguro: TDBEdit
            Left = 627
            Top = 38
            Width = 60
            Height = 21
            DataField = 'SEGURO'
            DataSource = dm.ds_qry_saidas
            TabOrder = 1
            OnKeyDown = Edit1KeyDown
          end
          object edValorDesconto: TDBEdit
            Left = 693
            Top = 38
            Width = 63
            Height = 21
            Color = clWhite
            DataField = 'DESCONTO'
            DataSource = dm.ds_qry_saidas
            TabOrder = 2
            OnKeyDown = Edit1KeyDown
          end
          object edOutrasDespesas: TDBEdit
            Left = 760
            Top = 38
            Width = 70
            Height = 21
            DataField = 'OUTRAS_DESPESAS'
            DataSource = dm.ds_qry_saidas
            TabOrder = 3
            OnKeyDown = Edit1KeyDown
          end
          object Panel2: TPanel
            Left = 4
            Top = 18
            Width = 553
            Height = 46
            BevelOuter = bvNone
            Enabled = False
            TabOrder = 4
            object Label32: TLabel
              Left = 3
              Top = 8
              Width = 58
              Height = 14
              Caption = 'Base ICMS'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'Arial'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label33: TLabel
              Left = 84
              Top = 8
              Width = 76
              Height = 14
              Caption = 'Valor do ICMS'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'Arial'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label26: TLabel
              Left = 176
              Top = 7
              Width = 75
              Height = 14
              Caption = 'Base ICMS ST'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'Arial'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label25: TLabel
              Left = 273
              Top = 7
              Width = 93
              Height = 14
              Caption = 'Valor do ICMS ST'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'Arial'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label5: TLabel
              Left = 378
              Top = 6
              Width = 92
              Height = 14
              Caption = 'Vl. dos Produtos'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'Arial'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label35: TLabel
              Left = 483
              Top = 6
              Width = 13
              Height = 14
              Caption = 'IPI'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'Arial'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object edBaseCalculoICMS: TDBEdit
              Left = 0
              Top = 20
              Width = 81
              Height = 21
              Color = clBlack
              DataField = 'BASE_ICMS'
              DataSource = dm.ds_qry_saidas
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clYellow
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              TabOrder = 0
              OnKeyDown = Edit1KeyDown
            end
            object edValorICMS: TDBEdit
              Left = 85
              Top = 20
              Width = 85
              Height = 21
              Color = clBlack
              DataField = 'VALOR_ICMS'
              DataSource = dm.ds_qry_saidas
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clYellow
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              TabOrder = 1
              OnKeyDown = Edit1KeyDown
            end
            object edBaseCalculoICMSSubst: TDBEdit
              Left = 175
              Top = 20
              Width = 94
              Height = 21
              Color = clBlack
              DataField = 'BASE_ICMS_SUBST'
              DataSource = dm.ds_qry_saidas
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clYellow
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              TabOrder = 2
              OnKeyDown = Edit1KeyDown
            end
            object edValorICMSSubst: TDBEdit
              Left = 274
              Top = 20
              Width = 97
              Height = 21
              Color = clBlack
              DataField = 'VALOR_ICMS_SUBST'
              DataSource = dm.ds_qry_saidas
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clYellow
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              TabOrder = 3
              OnKeyDown = Edit1KeyDown
            end
            object edValorProdutos: TDBEdit
              Left = 382
              Top = 20
              Width = 97
              Height = 21
              Color = clBlack
              DataField = 'VALOR_PRODUTOS'
              DataSource = dm.ds_qry_saidas
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clYellow
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              TabOrder = 4
              OnKeyDown = Edit1KeyDown
            end
            object edValorIPI: TDBEdit
              Left = 481
              Top = 20
              Width = 65
              Height = 21
              Color = clBlack
              DataField = 'VALOR_IPI'
              DataSource = dm.ds_qry_saidas
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clYellow
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              TabOrder = 5
              OnKeyDown = Edit1KeyDown
            end
          end
          object Panel9: TPanel
            Left = 830
            Top = 24
            Width = 173
            Height = 41
            BevelOuter = bvNone
            Caption = 'Panel9'
            Enabled = False
            TabOrder = 5
            object edTotalNotaFiscal: TDBEdit
              Left = 3
              Top = 3
              Width = 167
              Height = 37
              HelpType = htKeyword
              Color = clBlack
              DataField = 'TOTAL_NOTA'
              DataSource = dm.ds_qry_saidas
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clYellow
              Font.Height = -24
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              TabOrder = 0
              OnKeyDown = Edit1KeyDown
            end
          end
        end
      end
      object pnItens: TPanel
        Left = 2
        Top = 135
        Width = 1013
        Height = 294
        TabOrder = 1
        object PageControl1: TPageControl
          Left = 1
          Top = 0
          Width = 1011
          Height = 289
          ActivePage = TabSheet1
          TabOrder = 0
          object TabSheet1: TTabSheet
            Caption = #205'tens da Nota Fiscal   '
            ExplicitLeft = 0
            ExplicitTop = 0
            ExplicitWidth = 0
            ExplicitHeight = 0
            object GroupBox3: TGroupBox
              Left = -2
              Top = -16
              Width = 1005
              Height = 303
              Caption = #205'tens da Nota Fiscal / Documento'
              TabOrder = 0
              object Label9: TLabel
                Left = 6
                Top = 21
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
              object btPesqProdutos: TSpeedButton
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
                Left = 612
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
                Left = 884
                Top = 21
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
              object Label17: TLabel
                Left = 678
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
                Left = 715
                Top = 33
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
                Left = 749
                Top = 21
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
                Left = 6
                Top = 60
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
                Left = 161
                Top = 60
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
                Left = 433
                Top = 60
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
                Left = 607
                Top = 60
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
              object Label8: TLabel
                Left = 524
                Top = 60
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
                Left = 342
                Top = 60
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
                Left = 465
                Top = 22
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
              object Label12: TLabel
                Left = 506
                Top = 21
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
              object Label34: TLabel
                Left = 541
                Top = 21
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
              object Label47: TLabel
                Left = 82
                Top = 60
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
              object Label11: TLabel
                Left = 344
                Top = 21
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
                Left = 413
                Top = 21
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
              object Panel5: TPanel
                Left = 84
                Top = 33
                Width = 380
                Height = 24
                BevelOuter = bvNone
                Enabled = False
                TabOrder = 15
                object ed_desc_item: TEdit
                  Left = 5
                  Top = 1
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
                object EDIAliquotaICMSSAIDAITEM: TCurrencyEdit
                  Left = 261
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
                  OnEnter = Edit1Enter
                  OnExit = Edit1Exit
                  OnKeyDown = Edit1KeyDown
                end
                object EDIAliquotaIPI: TCurrencyEdit
                  Left = 330
                  Top = 1
                  Width = 46
                  Height = 21
                  AutoSize = False
                  Color = clBlack
                  DisplayFormat = '0.00;'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clYellow
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  ParentFont = False
                  TabOrder = 2
                  OnEnter = Edit1Enter
                  OnExit = Edit1Exit
                  OnKeyDown = Edit1KeyDown
                end
              end
              object Panel7: TPanel
                Left = 3
                Top = 100
                Width = 998
                Height = 196
                BevelInner = bvLowered
                BevelOuter = bvLowered
                Caption = 'Panel7'
                TabOrder = 17
                object DBGrid1: TDBGrid
                  Left = 2
                  Top = 3
                  Width = 991
                  Height = 191
                  DataSource = dm.dsComprasTemp
                  Options = [dgEditing, dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
                  TabOrder = 0
                  TitleFont.Charset = DEFAULT_CHARSET
                  TitleFont.Color = clWindowText
                  TitleFont.Height = -11
                  TitleFont.Name = 'MS Sans Serif'
                  TitleFont.Style = []
                  OnColExit = DBGrid1ColExit
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
                      Color = clWhite
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
                      FieldName = 'redBaseICMS'
                      Title.Caption = 'Red Base ICMS'
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
              object Panel6: TPanel
                Left = 744
                Top = 33
                Width = 136
                Height = 24
                BevelOuter = bvNone
                Enabled = False
                TabOrder = 16
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
              object BitBtn1: TBitBtn
                Left = 676
                Top = 65
                Width = 62
                Height = 39
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
                TabOrder = 14
                OnClick = BitBtn1Click
              end
              object ed_cod_item_saida: TEdit
                Left = 7
                Top = 36
                Width = 46
                Height = 21
                TabOrder = 0
                Text = 'ed_cod_item_saida'
                OnEnter = Edit1Enter
                OnExit = Edit1Exit
                OnKeyDown = Edit1KeyDown
              end
              object EDIpreco: TCurrencyEdit
                Left = 884
                Top = 35
                Width = 101
                Height = 21
                AutoSize = False
                DecimalPlaces = 8
                DisplayFormat = 'R$ 0.00000000;'
                TabOrder = 6
                OnEnter = Edit1Enter
                OnExit = Edit1Exit
                OnKeyDown = Edit1KeyDown
              end
              object EDIdesconto: TCurrencyEdit
                Left = 6
                Top = 73
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
              object EDIBaseICMS: TCurrencyEdit
                Left = 159
                Top = 73
                Width = 80
                Height = 21
                Hint = 'Base de c'#225'lculo do ICMS'
                AutoSize = False
                DisplayFormat = 'R$ 0.00000;'
                TabOrder = 9
                OnEnter = Edit1Enter
                OnExit = Edit1Exit
                OnKeyDown = Edit1KeyDown
              end
              object EDIVALORICMS: TCurrencyEdit
                Left = 338
                Top = 73
                Width = 86
                Height = 21
                Hint = 'Base de c'#225'lculo do ICMS'
                AutoSize = False
                DisplayFormat = 'R$ 0.00000;'
                TabOrder = 10
                OnEnter = Edit1Enter
                OnExit = Edit1Exit
                OnKeyDown = Edit1KeyDown
              end
              object EDIbaseICMSST: TCurrencyEdit
                Left = 431
                Top = 73
                Width = 89
                Height = 21
                AutoSize = False
                DisplayFormat = 'R$ 0.00;'
                TabOrder = 11
                OnEnter = Edit1Enter
                OnExit = Edit1Exit
                OnKeyDown = Edit1KeyDown
              end
              object ediValorICMSST: TCurrencyEdit
                Left = 523
                Top = 73
                Width = 77
                Height = 21
                AutoSize = False
                DisplayFormat = 'R$ 0.0000;'
                TabOrder = 12
                OnEnter = Edit1Enter
                OnExit = Edit1Exit
                OnKeyDown = Edit1KeyDown
              end
              object EDIvalorIPI: TCurrencyEdit
                Left = 606
                Top = 73
                Width = 64
                Height = 21
                AutoSize = False
                DisplayFormat = 'R$ 0.0000;'
                TabOrder = 13
                OnEnter = Edit1Enter
                OnExit = Edit1Exit
                OnKeyDown = Edit1KeyDown
              end
              object edOutrasDespItem: TCurrencyEdit
                Left = 82
                Top = 73
                Width = 70
                Height = 21
                AutoSize = False
                DisplayFormat = '0.00;'
                TabOrder = 8
                OnEnter = Edit1Enter
                OnExit = Edit1Exit
                OnKeyDown = Edit1KeyDown
              end
              object EDIquantidade: TCurrencyEdit
                Left = 611
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
                Left = 677
                Top = 33
                Width = 35
                Height = 21
                TabOrder = 5
                OnEnter = Edit1Enter
                OnExit = Edit1Exit
                OnKeyDown = Edit1KeyDown
              end
              object edNCMITEM: TEdit
                Left = 541
                Top = 34
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
              object ed_cfop_saida_item: TEdit
                Left = 465
                Top = 34
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
                Text = '5102'
                OnEnter = Edit1Enter
                OnExit = Edit1Exit
                OnKeyDown = Edit1KeyDown
              end
              object ed_cst_saida_item: TEdit
                Left = 505
                Top = 34
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
                Text = '000'
                OnEnter = Edit1Enter
                OnExit = Edit1Exit
                OnKeyDown = Edit1KeyDown
              end
            end
          end
          object TabSheet2: TTabSheet
            Caption = 'Observa'#231#245'es da nota'
            ImageIndex = 1
            ExplicitLeft = 0
            ExplicitTop = 0
            ExplicitWidth = 0
            ExplicitHeight = 0
          end
          object TabSheet3: TTabSheet
            Caption = 'Documentos Fiscais Referenciados'
            ImageIndex = 2
            ExplicitLeft = 0
            ExplicitTop = 0
            ExplicitWidth = 0
            ExplicitHeight = 0
            object GroupBox4: TGroupBox
              Left = 8
              Top = 0
              Width = 449
              Height = 257
              Caption = 'Notas fiscais Referenciadas'
              TabOrder = 0
              object Label22: TLabel
                Left = 8
                Top = 22
                Width = 118
                Height = 14
                Caption = 'Chave da NF-e / NFC-e'
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Arial'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object DBGrid2: TDBGrid
                Left = 8
                Top = 64
                Width = 433
                Height = 185
                TabOrder = 0
                TitleFont.Charset = DEFAULT_CHARSET
                TitleFont.Color = clWindowText
                TitleFont.Height = -11
                TitleFont.Name = 'MS Sans Serif'
                TitleFont.Style = []
              end
              object DBEdit1: TDBEdit
                Left = 9
                Top = 36
                Width = 305
                Height = 21
                DataField = 'CHAVE_NFE'
                DataSource = dm.ds_qry_saidas
                TabOrder = 1
                OnEnter = Edit1Enter
                OnExit = Edit1Exit
                OnKeyDown = Edit1KeyDown
              end
              object BitBtn2: TBitBtn
                Left = 328
                Top = 32
                Width = 97
                Height = 25
                Caption = 'Adicionar'
                TabOrder = 2
              end
            end
          end
        end
      end
      object pnCabecalho: TPanel
        Left = 2
        Top = 2
        Width = 1007
        Height = 132
        TabOrder = 0
        object btPesqSituacaoDocFiscal: TSpeedButton
          Left = 54
          Top = 106
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
        object Label3: TLabel
          Left = 8
          Top = 95
          Width = 46
          Height = 14
          Caption = 'Situa'#231#227'o'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label21: TLabel
          Left = 84
          Top = 94
          Width = 164
          Height = 14
          Caption = 'Situa'#231#227'o do documento fiscal:'
          FocusControl = bt_alterar
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object gpDadosNota: TGroupBox
          Left = 269
          Top = 3
          Width = 403
          Height = 62
          TabOrder = 2
          object Label4: TLabel
            Left = 6
            Top = 14
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
            Left = 113
            Top = 14
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
          object Label6: TLabel
            Left = 151
            Top = 12
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
          object Label30: TLabel
            Left = 268
            Top = 13
            Width = 55
            Height = 14
            Caption = 'Data Sa'#237'da'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object edNumeroNotaFiscal: TDBEdit
            Left = 5
            Top = 26
            Width = 102
            Height = 21
            DataField = 'NUMERO_NOTA'
            DataSource = dm.ds_qry_saidas
            TabOrder = 0
            OnEnter = Edit1Enter
            OnExit = edNumeroNotaFiscalExit
            OnKeyDown = Edit1KeyDown
          end
          object edSerieNotaFiscal: TDBEdit
            Left = 112
            Top = 26
            Width = 33
            Height = 21
            CharCase = ecUpperCase
            DataField = 'SERIE_NOTA'
            DataSource = dm.ds_qry_saidas
            TabOrder = 1
            OnEnter = Edit1Enter
            OnExit = Edit1Exit
            OnKeyDown = Edit1KeyDown
          end
          object edDataEmissaoNotaFiscal: TDBDateEdit
            Left = 151
            Top = 27
            Width = 106
            Height = 21
            DataField = 'DATA_EMISSAO'
            DataSource = dm.ds_qry_saidas
            NumGlyphs = 2
            TabOrder = 2
            OnEnter = Edit1Enter
            OnExit = Edit1Exit
            OnKeyDown = Edit1KeyDown
          end
          object edDataEntradaNotaFiscal: TDBDateEdit
            Left = 266
            Top = 27
            Width = 106
            Height = 21
            DataField = 'DATA_SAIDA'
            DataSource = dm.ds_qry_saidas
            NumGlyphs = 2
            TabOrder = 3
            OnEnter = Edit1Enter
            OnExit = Edit1Exit
            OnKeyDown = Edit1KeyDown
          end
        end
        object gpOperacao: TGroupBox
          Left = 4
          Top = 21
          Width = 118
          Height = 68
          Caption = 'Opera'#231#227'o:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 0
          object rdVenda: TRadioButton
            Left = 7
            Top = 17
            Width = 73
            Height = 17
            Caption = 'Venda'
            Checked = True
            TabOrder = 0
            TabStop = True
            OnClick = rdVendaClick
            OnKeyDown = Edit1KeyDown
          end
          object rdDevolucao: TRadioButton
            Left = 7
            Top = 32
            Width = 90
            Height = 17
            Caption = 'Devolu'#231#227'o'
            TabOrder = 1
            OnClick = rdDevolucaoClick
            OnKeyDown = Edit1KeyDown
          end
          object rdTransferencia: TRadioButton
            Left = 7
            Top = 47
            Width = 97
            Height = 17
            Caption = 'Transfer'#234'ncia'
            TabOrder = 2
            OnClick = rdTransferenciaClick
            OnKeyDown = Edit1KeyDown
          end
        end
        object gpTipoNota: TGroupBox
          Left = 125
          Top = 23
          Width = 141
          Height = 66
          Caption = 'Tipo da Nota'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 1
          object rdModelo01: TRadioButton
            Left = 6
            Top = 17
            Width = 106
            Height = 17
            Caption = 'Modelo 1/ 1A'
            Checked = True
            TabOrder = 0
            TabStop = True
            OnClick = rdModelo01Click
            OnEnter = Edit1Enter
            OnExit = Edit1Exit
            OnKeyDown = Edit1KeyDown
          end
          object rdNotaEletronica: TRadioButton
            Left = 7
            Top = 40
            Width = 122
            Height = 17
            Caption = 'Nota Eletr'#244'nica'
            TabOrder = 1
            OnClick = rdNotaEletronicaClick
            OnKeyDown = Edit1KeyDown
          end
        end
        object pnChaveNFE: TPanel
          Left = 680
          Top = 20
          Width = 312
          Height = 37
          BevelOuter = bvNone
          Caption = 'pnChaveNFE'
          TabOrder = 3
          Visible = False
          object Label49: TLabel
            Left = 5
            Top = 2
            Width = 76
            Height = 14
            Caption = 'Chave da NF-E'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object edChaveNFE: TDBEdit
            Left = 4
            Top = 14
            Width = 305
            Height = 21
            DataField = 'CHAVE_NFE'
            DataSource = dm.ds_qry_saidas
            TabOrder = 0
            OnEnter = Edit1Enter
            OnExit = Edit1Exit
            OnKeyDown = Edit1KeyDown
          end
        end
        object pnCupomFiscal: TPanel
          Left = 681
          Top = 56
          Width = 312
          Height = 34
          BevelOuter = bvNone
          TabOrder = 4
          object ckbCupomAnexo: TCheckBox
            Left = 2
            Top = 8
            Width = 175
            Height = 22
            Caption = 'Existe Cupom Fiscal anexo ?'
            Color = clBtnFace
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentColor = False
            ParentFont = False
            TabOrder = 0
            OnClick = ckbCupomAnexoClick
            OnEnter = Edit1Enter
            OnExit = Edit1Exit
            OnKeyDown = Edit1KeyDown
          end
          object pnNumeroCupom: TPanel
            Left = 179
            Top = -2
            Width = 132
            Height = 36
            BevelOuter = bvNone
            TabOrder = 1
            Visible = False
            object Label45: TLabel
              Left = 4
              Top = 1
              Width = 74
              Height = 14
              Caption = 'N'#186' do Cupom:'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Arial'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label48: TLabel
              Left = 85
              Top = 0
              Width = 23
              Height = 14
              Caption = 'ECF:'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Arial'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object edNumeroCupomFiscal: TDBEdit
              Left = 2
              Top = 13
              Width = 76
              Height = 21
              DataField = 'NUMERO_CUPOM_FISCAL'
              DataSource = dm.ds_qry_saidas
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 0
              OnEnter = Edit1Enter
              OnExit = Edit1Exit
              OnKeyDown = Edit1KeyDown
            end
            object edNumeroECF: TDBEdit
              Left = 83
              Top = 13
              Width = 46
              Height = 21
              DataField = 'NUMERO_ECF'
              DataSource = dm.ds_qry_saidas
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 1
              OnEnter = Edit1Enter
              OnExit = Edit1Exit
              OnKeyDown = Edit1KeyDown
            end
          end
        end
        object edCodSituacaoDocFiscal: TDBEdit
          Left = 8
          Top = 107
          Width = 42
          Height = 21
          DataField = 'SITUACAO'
          DataSource = dm.ds_qry_saidas
          TabOrder = 5
          OnEnter = Edit1Enter
          OnExit = Edit1Exit
          OnKeyDown = Edit1KeyDown
        end
        object Panel10: TPanel
          Left = 80
          Top = 106
          Width = 424
          Height = 24
          BevelOuter = bvNone
          Enabled = False
          TabOrder = 6
          object edDescSituacaoDocFiscal: TDBEdit
            Left = 3
            Top = 3
            Width = 414
            Height = 21
            Color = clBlack
            DataField = 'XDESCSITUACAONOTA'
            DataSource = dm.ds_qry_saidas
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clYellow
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 0
          end
        end
      end
    end
  end
  inherited pn_botoes: TPanel
    Top = 628
    Width = 1014
    Height = 51
    ExplicitTop = 628
    ExplicitWidth = 1014
    ExplicitHeight = 51
    inherited bt_novo: TBitBtn
      Width = 126
      Height = 48
      Glyph.Data = {
        36090000424D3609000000000000360000002800000018000000180000000100
        2000000000000009000000000000000000000000000000000000FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FCFCFC00F1F1F100E7E7
        E700DFDFDF00DCDCDC00DCDCDC00DEDEDE00E6E6E600F0F0F000FAFAFA00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FCFCFC00EEEEEE00D5D5D500B4B4B4009696
        96008282820078787800777777008080800093939300B0B0B000D1D1D100EBEB
        EB00FBFBFB00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00F7F7F700DCDCDC00A9ACA9006F886F00487E48002774
        250015711100146F0F0023712100417541005C735C00656765007A7A7A00A6A6
        A600D7D7D700F5F5F500FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00F5F5F500CDCECD00709570001978160018790100227D0000277C
        00002D76000030740000307200002C7100001E6E0100146F0F00547754006263
        62008B8B8B00C9C9C900F2F2F200FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00F8F8F800C4CCC4003D873D00048701000698000000990000009800000097
        000000940000078E0000168100002F710000376C0000346D0000216C01002B73
        2B005F645F0083838300C9C9C900F6F6F600FFFFFF00FFFFFF00FFFFFF00FCFC
        FC00D1D9D1002C872C0002990500029E0500029C0500019A0400019B0300009A
        0100009700000096000000960000009400000F860000376D0000376C00002D6C
        00001C711C005F655F008B8B8B00D7D7D700FBFBFB00FFFFFF00FFFFFF00EEEE
        EE0044984400099E0F0006A20D00069F0E00069F0D00059E0C001BBE2B0058E7
        83004BE177004EE2770053E37B0030CC4F0000940000009200002E7100003A6A
        00002E6D01002B752B0062636200A6A6A600EAEAEA00FFFFFF00FDFDFD0092C2
        9200109816000CA718000AA316000AA316000AA316000AA31400039A0600FFF8
        FF00FFF0FD00FFF4FF00FFF7FF002FD655000098000000940000009500002F71
        0000386C0000206D00005478540079797900D1D1D100FBFBFB00F0F2F000218E
        21002CB73A000CA71B000EA71E000EA71E000EA71E000EA71D0004920800FFFC
        FF00F3F3F300F8F6F800F8FAF9002CD75300019A040000970000009600000092
        00003A6B0000346D0000136F0E0064676400B0B0B000F0F0F000AECFAE001C9E
        25002BB73D0010AB230012AB260012AB270012AB260012AB250005830A00FFFB
        FF00F2F2F200F9F7F900F9FAF9002AD75300049D0A00029B0400009700000096
        000016830000396C00001D6F01005C745C0093939300E6E6E6006CAE6C003FBA
        4E0028B53E0014AF2B001DBC3A002DDF600030E261003AE16D0009A72500FFF5
        FF00F3F3F300F8F6F800F2F9F40021DA59002AD953002DD8540031D7580031CE
        510000970000376F00002F7301003F773F0080808000DEDEDE003F9A3F0058CB
        6F002CB8440018B3350019811700FEE9FC00EEE2EA00F2E8F000F4F0F400F3EF
        F200F0F0F000F4F3F300FBF7FB00F9F9FA00FFFAFD00FEF9FC00FFF6FF0058E7
        810000990000217E0000327401002274200076767600DCDCDC002C992C0063D1
        7C0035BD50001BB73C0015831600F7E8F600E3E1E200E5E4E400E9E8E800EBEB
        EB00EEEEEE00F2F2F200F4F4F400F6F4F500F7F4F600F6F3F500FFF1FE0051E6
        7D00009A0100118A00003375010011700C0077777700DCDCDC002D9A2D0069D4
        840045C663001EBA430015831700F5E8F500DFDFDF00E2E2E200E7E7E700E9E9
        E900EBEBEB00EEEEEE00EFEFEF00F0F0F000F2F2F200F1F0F100FFEEFA004FE7
        7D00009B0400079300003178010013730E0081818100DFDFDF0045A2450069D6
        870061D07B001FBE49001E852100FFEFFF00F8E9F800FBECFB00F9EDF900EEE9
        EE00E8E8E800EAEAEA00F3EFF200FFF5FF00FFFAFF00FFFAFF00FFF6FF005CEB
        8A00039D0700039700002E7D01002477230096969600E7E7E70077BA770055CA
        6F007BDB95002AC355000F971F000E951C000E961C000D951B0004770800ECE7
        EC00E7E6E700EAE7E900E7EEEB000397170006870C0005970A00049D08001DC3
        3100049D0A0004990200297F0100467F4600B3B3B300F1F1F100C1E4C10030B3
        3F007CDE9B0058D27F0029C85D0030CA600030C960002DC65B000E951B00F0E7
        F000E4E3E400E6E3E500E5E7E50039DE6A0015AE2C0011AA24000DA61C000AA3
        140006A10C000A980400187E01006E896E00D5D5D500FCFCFC00FFFFFF002DAC
        2D0076E19D0084E1A30037CD690030CB650033CC660030C963000E961E00ECE5
        EC00E2E1E200E3E0E300E1E2E10030DE5F0016AF2F0012AB27000EA71F000BA4
        160006A00E00119606001A7D1600A9ACA900EDEDED00FFFFFF00FFFFFF00B3E3
        B30033B5450082E6A8007ADE9C002FCB630032CC660032CB660010951F00FBE9
        FB00F4E7F400F6E7F600EEE6EF002AD95C0017B0300013AC28000FA820000BA4
        180007A411000E88050070987000DCDCDC00FCFCFC00FFFFFF00FFFFFF00FFFF
        FF0060BC600059CE760082E3A60077DD990032CD660030CC6400119823002288
        24001A851C001B841C001B831B0022C2450018B1310014AD290011AA22000BA7
        19000A9E0F003C8B3C00CDCECD00F7F7F700FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00F8FCF80043AB430058CC750080E3A50080E0A10050D37C002BC95F0029C6
        570026C1510024BD4A0020B942001CB53A0018B1310014AD290011AC24000AA2
        17002C8B2C00C4CBC400F6F6F600FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00F8FCF80061BF610036B8470079E3A1007FE3A30075DD980053D1
        780039C65F0027BF4C001DB940001BB53A001FB63A0023B63A000E9E1700449D
        4400D1D9D100F8F8F800FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00B3E3B3002DAF2E0035B94A005DD07E006EDC
        92006BD98C0064D583005CD0790044BF590022A52C002193230092C49200EEEE
        EE00FCFCFC00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C1E4C10077BB770045A5
        450030A031002F9D2F003F9D3F006BAE6B00ADCEAD00F0F2F000FCFCFC00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00}
      NumGlyphs = 1
      ExplicitWidth = 126
      ExplicitHeight = 48
    end
    inherited bt_alterar: TBitBtn
      Left = 255
      Width = 126
      Height = 48
      Glyph.Data = {
        36090000424D3609000000000000360000002800000018000000180000000100
        2000000000000009000000000000000000000000000000000000FFFFFF00F9F9
        F900E7E7E700DEDEDE00E2E2E200EAEAEA00F2F2F200F9F9F900FEFEFE00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00E6E6
        E6009F9F9F00808080008A8A8A009E9E9E00B5B5B500CBCBCB00DADADA00E4E4
        E400ECECEC00F5F5F500FCFCFC00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00B389
        8900A0737300987474008D7878007F757400706D6D006C6C6C007B7B7B008F8F
        8F00A6A6A600BDBDBD00D1D1D100DEDEDE00E7E7E700F1F1F100FCFCFC00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FAFBFB00A672
        7200EAC7C700FFF7F700ECD3CF009686B500AE889300A97C7B00997979008B7A
        7A007C7474006C6A6A00707070008181810097979700B8B8B800E9E9E900FEFE
        FE00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F7F3F300A470
        7100E9C7C400FFFAFB00FFFDF7007089FF00F6EFFA00FFFAFA00F6E3E400DFC1
        C100C8A3A300B28484009F77770093797900867878007F7E7E00D1D1D100FBFB
        FB00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F0EBEB00A975
        7600ECCABF00FFEACC00FFEBC3006378E800FFE8CE00FFEBDF00FFF2F000FFF2
        F400FFF5F800FFF6F800FFF1F300EFD7D800B18484007D787800D0D0D000FCFC
        FC00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00E9E1E100AF7A
        7A00F1D6D800FFFBFF00FFFFFA005E7DFF00FFF7E800FFEAD800F3D6B900EBCD
        AD00FEDCBA00FFDEC200FFE3D400FFF3ED00B68B8A0078777700D7D7D700FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00E3DADA00B47F
        8000F4D3C100FFEACB00FFECC5006079ED00FFF4DC00FFEFE900CEC4C500F1E6
        EA00FFF4FA00FFEFEE00FFE5D900FFE5CB00AD7E7B007A7A7A00DCDCDC00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00DED1D100B984
        8500F5E3E600FFFCFF00FFFFF8006282FA00FFF8DF00C8B9AB005D564B00BBA6
        8E00FFDCBC00FFE5C900FFE5D200FFF1E400AB7D7F0082828200E0E0E000FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00D8C9C900BF8A
        8A00F9E0D100FFF2E200FFF9E7006784FA00FFFFFA00DBDBE100617889005F6B
        7C0030564800538A5600ABC09400FFEFE300A47C7C008B8B8B00E3E3E300FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00D3C1C100C690
        9100FAEAE600FFF5E800FFF6DB006982EE00FFEDC500FBE1C50076A0C20044A3
        6C00139929001D9D32000074060086AD7D00A980850086868600DBDBDB00FDFD
        FD00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00CFBABA00CB95
        9500FCF6F800FFFEFF00FFFFFE006C8CFF00FFFFFE00FFFFFF0064AFA2001FAF
        3F005DF28B004CD670002EAD460000760A006C7E5F0068686800B2B2B200EBEB
        EB00FEFEFE00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00CBB3B300D09B
        9C00FEE8CF00FFEBCD00FFEEC8006F87EA00FFEAC300FFE5C8006BC27E0041DB
        6F0067FF9A0059EC860047D06A002AA64000097A14005D705E0075757500BBBB
        BB00EEEEEE00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C7ACAC00D7A1
        A100FFFFFF00FFFFFF00FFFFFF007A99FF00FFFFFF00FFFDFF00BFE8CC0020BF
        50005DF88D0064FD960058EA840044CC660028A23C00127A1A005E6B5E007B7B
        7B00C1C1C100F1F1F100FFFFFF00FFFFFF00FFFFFF00FFFFFF00C3A6A600DCA8
        A900FFEFD200FFEDCB00F0DECD008C9BE500FFEAC500FFE6C800FFE6D00084CA
        7D002CC75A0061FB900064FB940056E7810041C86200239C3600177A1F005D66
        5D0080808000C6C6C600F4F4F400FFFFFF00FFFFFF00FFFFFF00C1A0A000E2B0
        B100FFFFFF00FFFFFF00E2EAFF009EB5FF00FFFFFF00FFFBFE00FFFAFC00FFFB
        FF005BCD800039D4680062FD920062F9930054E47E003EC25C00219933001E7C
        25005E635E0085858500CBCBCB00F6F6F600FFFFFF00FFFFFF00BF9B9B00EBB9
        B700FFF9E800FFF5E400D4D4E800AFB9EB00FFF3DD00FFEFDC00FFEDDA00FFEC
        DA00FFEAD9003DBE5B0046DF740062FC940061F8910052E27B0039C35700278A
        350050745100626262008B8B8B00D3D3D300F9F9F900FFFFFF00BB949400F2C3
        C100FFFCF000FFFAEB00C9CFF200C0CAF300FFFBEC00FFF5EA00FFF6EB00FFF3
        E800FFF0E700F0EEE20030C7600051EA7D0062FE94005EFB8F006AA47A007C72
        790074717100767470006161610098989800DEDEDE00FCFCFC00B9909000FAD0
        D000F8FCFD00F9F9F700B1BDE300C8D3F200C9C9C900E9E9EA00A4A4A500E3E1
        E200706F7000ECE3E7004C6C57002BCA5D0055F483008BAA9700B2ABAF00D6D3
        CB007C82A7002733AA004C4F9A0066666600ACACAC00EEEEEE00BB8D8D00FFDF
        DF006265650097979700646361008E8D8C006B6C6C007F8080007F8080007879
        79008B8C8C007B797900998A90003474480070BC8800CAC2C600FFFFFF007D92
        E800213FD8002136CA000B12A9005858880089898900E3E3E300BC8E8E00FFDA
        DA00E1DEDE0037383700C1BCDE00393B3900E2C3C3003B3D3D00C7A4A4004241
        4100A67F7F00504E4E009E7E7E005C585A00B7BFB900D1CDC6008399ED002F55
        E7004672F9002A45D3000F18AD001B1B970098989800E7E7E700C5A4A400A480
        8000B08F8F003F42410096848400484B4A00867F7F00555757007F7D7D006061
        610077797900676868007476760089898900DCDCDC00B1B7CD002647DE004E7F
        FF004168F000253FCD000A11A70042429C00CACACA00F7F7F700DBDCDC007274
        74008D8E8E00595959007A7B7B00636363006B6B6B0067676700636363007F7F
        7F007F7F7F009C9C9C009C9C9C00E5E5E500F9F9F900E9EDFC003C4BCB003454
        E0002F4CDA00111DB10017179C00B8B8C800F2F2F200FFFFFF00FFFFFF00B5B5
        B50079797900ADADAD009F9F9F00C9C9C900C5C5C500EDEDED00ECECEC00FCFC
        FC00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00DADCF5003C42
        B8001313A3005050B200CBCBDE00F7F7F700FFFFFF00FFFFFF00}
      NumGlyphs = 1
      ExplicitLeft = 255
      ExplicitWidth = 126
      ExplicitHeight = 48
    end
    inherited bt_gravar: TBitBtn
      Left = 508
      Top = 0
      Width = 118
      Height = 50
      Glyph.Data = {
        36090000424D3609000000000000360000002800000018000000180000000100
        2000000000000009000000000000000000000000000000000000FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FCFCFC00F1F1F100E7E7
        E700DFDFDF00DCDCDC00DCDCDC00DEDEDE00E6E6E600F0F0F000FAFAFA00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FCFCFC00EEEEEE00D5D5D500B4B4B4009696
        96008282820078787800777777008080800093939300B0B0B000D1D1D100EBEB
        EB00FBFBFB00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00F7F7F700DCDCDC00A9ABA9006F896F00487E48002874
        250017711100166F0F0024712100417641005C735C00656765007A7A7A00A6A6
        A600D7D7D700F5F5F500FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00F5F5F500CDCECD007095700019781600167A0100207D0000257C
        00002A7700002D7400002E7200002A7100001D6D0100156D0F00547754006263
        62008B8B8B00C9C9C900F2F2F200FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00F8F8F800C4CBC4003D873D00048801000696000000980000009800000097
        000000940000088D0000168100002D720000356D0000326D0000206D01002B72
        2B005F645F0083838300C9C9C900F6F6F600FFFFFF00FFFFFF00FFFFFF00FCFC
        FC00D1D9D1002C872C0002970500029E0500029C0500019A0300009900000098
        00000097000000950000009500000093000010860000346D0000356C00002C6C
        00001D701C005F655F008B8B8B00D7D7D700FBFBFB00FFFFFF00FFFFFF00EEEE
        EE0044964400099C0E0006A10D00069F0E00059E0A0007A5170013B83A0014B7
        3900029E0800009A0000009800000096000000940000009000002D720000386A
        00002C6D01002B742B0062636200A6A6A600EAEAEA00FFFFFF00FDFDFD0092C0
        9200109715000CA718000AA3160009A3150006A81A0066D38500F6F5F700EDF8
        F3003DCE6E0002A00A00019B0400019902000098000000940000009300002E72
        0000376C00001F6C00005477540079797900D1D1D100FBFBFB00F0F2F000218E
        210029B437000DA71C000EA71E0005A71A005DC87500FFF4FE00F7F4F600FEF9
        FD00FBFCFD003DCE6D0003A10E00049D0700019A040000970000009500000091
        0000376C0000336D0000136E0E0064676400B0B0B000F0F0F000AECFAE001B9E
        24002AB53B0011AB250006A81A0051BF5F00FCEFFA00F1EFF000F4F4F400F8F7
        F800FFFDFF00FDFFFF003CCE6C0004A21000049D0800029B0400009700000095
        000016830000376D00001D6F01005C745C0093939300E6E6E6006CAF6C003BB9
        4B0027B63F0005A7170045B44C00F7EAF600ECEAEC00EEEDEE00F8F4F700FBF7
        FA00FCFBFC00FFFFFF00FEFFFF003CCE6C0004A21000049D0800019A04000098
        000000950000346F00002E7301003F773F0080808000DEDEDE003F9C3F0054C9
        690026B53D0033A73100F5E7F400E7E5E700EBE9EB00FCF2FA00B0DCB600CDE9
        D100FFFBFF00FCFBFC00FFFFFF00FEFFFF003CCE6C0004A21000049D0700019A
        030000990000207E0000307401002374200076767600DCDCDC002C9B2C005FCE
        76002EBA480046A54100F6E7F500E7E5E700FAEDFA005FBE650002AA1D0004AA
        1F00B9E3BF00FFFDFF00FEFDFE00FFFFFF00FDFFFF003BCD6B0003A10F00039C
        050000990100118A00003076010012700C0077777700DCDCDC002D9C2E0064D2
        7E0046C86500009C0E0076B67300FAE9F90057B5550009AD230020BA45001DB7
        3D0006AB2000BAE3BF00FFFDFF00FDFCFD00FFFFFF00FDFFFE003CCC6B0002A0
        0C00009A0200089200002E79010015730E0081818100DFDFDF0045A3450065D3
        81005FCF7A0023C14D0010AA29000098050010AF2C0028C2500025BE490021BA
        44001DB73F0006AB1F00B8E2BE00FFFBFF00FAF9FA00FFFCFF00F9FAFB003ACB
        6800009F0800039500002B7D01002677230096969600E7E7E70077BB770053C8
        6C0076D991002DC557002BC65B002DC75D002DC65A0029C2540027C0500025BE
        4C0022BC46001DB73E0005AA1D00B8E0BC00FFF9FF00F8F7F800FCF8FB00F5F7
        F8003BCB670002970000267F0100467F4600B3B3B300F1F1F100C1E3C10030B1
        3F0078DC960057D27E002CC85E0030CA600030C960002DC65B002CC5560027C0
        500024BD4A0021BA44001DB63B0004A91B00B6DEBB00FDF5FD00F4F2F300FFF6
        FE009CE1B5000B9E1100177E01006E896E00D5D5D500FCFCFC00FFFFFF002DAA
        2F0072DE97007FDF9F0039CE6B0032CB650033CC660030C963002DC65D002AC3
        550026BF4E0022BB46001EB7400019B3360002A81800B3DBBA00FFF5FF00F3EF
        F30032C255000D9401001A7D1600A9ABA900EDEDED00FFFFFF00FFFFFF00B3E1
        B30033B345007EE3A30077DE990032CC640033CC660032CB660031CA61002CC5
        5A0028C1510024BD49001FB841001BB43A0016B0300005A81A004CBD5B0015B0
        2F0005A411000C88050070987000DCDCDC00FCFCFC00FFFFFF00FFFFFF00FFFF
        FF0060BA600056CC73007EE1A10075DD970035CE680031CC650031CB64002DC6
        5C0028C1520024BD4A0020B942001CB53B0018B1310014AD29000DA91E000AA4
        1700099C0E003C8B3C00CDCECD00F7F7F700FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00F8FCF80043AB430056CA72007BE1A1007CDF9E0050D37C002ECA61002AC6
        580027C1520024BD4A0020B942001CB53A0018B1310014AD290011AC230009A0
        17002C8B2C00C4CBC400F6F6F600FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00F8FCF80061BD610036B6470075DF9B007AE19E0072DB940052D0
        77003AC6600028BF4D001FB940001CB53B001FB63A0022B537000E9C1700449B
        4400D1D9D100F8F8F800FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00B3E1B30030AD310035B7490059CE79006AD9
        8C0067D6860060D27D0057CD730041BD540021A42C002293250092C39200EEEE
        EE00FCFCFC00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C1E3C10077BC770045A6
        450032A23500309F33003F9F3F006BAF6B00ADCFAD00F0F2F000FCFCFC00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00}
      NumGlyphs = 1
      ExplicitLeft = 508
      ExplicitTop = 0
      ExplicitWidth = 118
      ExplicitHeight = 50
    end
    inherited bt_cancelar: TBitBtn
      Left = 627
      Width = 131
      Height = 48
      Glyph.Data = {
        36090000424D3609000000000000360000002800000018000000180000000100
        2000000000000009000000000000000000000000000000000000FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F7F7F700E4E4E400DCDCDC00DBDB
        DB00DADADA00DADADA00DADADA00DADADA00DBDBDB00DCDCDC00E5E5E500F7F7
        F700FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00F4F4F400CBCBCB0091919100787878007474
        740074747400747474007474740074747400747474007878780092929200CCCC
        CC00F4F4F400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00F4F4F400BABAC8002B33AF00101EB600101DB4000E1A
        B4000F1AB1000F1AB0000F19AF000F18AE000F18AD002B2D9C005F5F64008787
        8700CBCBCB00F4F4F400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00F4F4F400BABACA002730B500123DF100174DFF00154BFF00164A
        FF001549FF001248FF001147FF001046FF001046FF000A33EC00272A9E005E5E
        640087878700CBCBCB00F4F4F400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00F4F4F400BABACA002732B7001541F200194DFF001949FF001748FF001647
        FF001546FF001345FF001244FF001143FF000F43FF000F43FF000B33ED002729
        9E005E5E640086868600CBCBCB00F4F4F400FFFFFF00FFFFFF00FFFFFF00F4F4
        F400BABACB002633BA001843F2001C50FF001B4CFF001A4BFF00194AFF001849
        FF001748FF001547FF001446FF001345FF001143FF001042FF000F43FF000A34
        ED00272BA0005E5E640087878700CBCBCB00F4F4F400FFFFFF00F7F7F700BCBD
        CD002735C0001B46F4002053FF001E4FFF001D4EFF001C4DFF001B4CFF001A4B
        FF00194AFF001749FF001648FF001547FF001345FF001244FF001042FF000F44
        FF000B35EE00272BA1005E5E640087878700CCCCCC00F7F7F700D0D1E3002738
        C4001C48F4002355FF002252FF002051FF001F50FF001E4FFF001D4FFF001C4D
        FF001B4CFF00194BFF00184AFF001748FF001547FF001345FF001244FF001042
        FF000F43FF000A33ED00272CA2005E5E640091919100E4E4E4002C3FD1001F4B
        F6002758FF002356FF002354FF002253FF002152FF002052FF001F51FF001E4F
        FF001D4EFF001B4DFF001A4BFF00184AFF001749FF001547FF001345FF001244
        FF001043FF000F43FF000B35EF002A30A30076767600DCDCDC000C29D7002C5E
        FF002657FF002254FF00174CFF00154AFF001C50FF002053FF001649FF00174B
        FF001D4FFF001549FF000D41FF000D43FF001547FF000C40FF000B3FFF001245
        FF001143FF000F43FF001147FF000A18B70072727200DADADA000B29D8002D61
        FF002656FF005078FF00E6ECFF00F2F5FF007998FF001147FF00DDE5FF009FB3
        FF001044FF007A97FF00F3F5FF00D2DBFF001347FF00BBCAFF00B6C6FF000B3F
        FF001345FF001143FF001146FF000A19B90072727200D9D9D9000D2BDB003162
        FF002155FF00CCD8FF00DFE6FF00B5C6FF00FFFFFF00053DFF00FFFFFF00BFCD
        FF00033DFF00FFFFFF00BECDFF00FFFFFF007190FF00DFE7FF00DDE5FF000137
        FF001346FF001244FF001247FF000A1BBB0072727200D9D9D9000C2EDF003364
        FF002A5BFF004973FF0085A2FF00FBFDFF00E6EBFF000840FF00FFFFFF00BDCA
        FF00033BFF00FFFFFF00ABBEFF00FFFFFF007997FF00DAE1FF00EBF0FF006586
        FF001547FF001244FF001348FF000A1CBF0072727200D9D9D9000C2EE2003566
        FF00285AFF008BA6FF00FFFFFF00E5EBFF003564FF001248FF00FFFFFF00BBCB
        FF00033CFF00FFFFFF00ADBFFF00FFFFFF007998FF00D9E0FF00EEF2FF00FFFF
        FF008EA6FF000D40FF001649FF00091CC00072727200D9D9D9000D30E300396A
        FF002659FF00DFE6FF00E0E8FF0090AAFF00A7BCFF002E5EFF00FFFFFF00C6D3
        FF001C4FFF00FFFFFF00ACBFFF00FFFFFF007997FF00DBE3FF00C5D2FF00DFE7
        FF0096ADFF000D40FF00174AFF00091EC40072727200DADADA000D33E7003A6C
        FF002E5EFF0097AFFF00FFFFFF00FFFFFF008FA9FF00F1F4FF00FFFFFF00FFFF
        FF00B6C6FF00AFC2FF00FFFFFF00FFFFFF002D5CFF00ECF1FF00FFFFFF00FFFF
        FF00567BFF001244FF00164BFF000B1FC50076767600DCDCDC000D34EA003F6F
        FF003767FF002D60FF003262FF003363FF003162FF003261FF002D5FFF00285A
        FF002557FF001C4FFF002759FF001B4DFF001C4FFF001348FF000D42FF000B40
        FF001446FF001849FF00184DFF000B20CA0090909000E4E4E4002B4AED003160
        FC003C6DFF003868FF003867FF003B6AFF00406DFF004672FF004671FF003F6B
        FF003563FF002C5CFF002859FF002657FF002355FF002152FF001F50FF001D4E
        FF001B4CFF00194DFF001340F6002939C000CBCBCB00F7F7F700E4E8FF002747
        EE00315FFA003D6EFF003A69FF003D6BFF00426FFF004874FF004973FF00406D
        FF003664FF002D5DFF00295AFF002757FF002455FF002253FF002051FF001E4F
        FF001C50FF001441F5002739C600BABBCB00F4F4F400FFFFFF00FFFFFF00E4E8
        FF002748EF003361FC003E6DFF003D6BFF00426FFF00446FFF00436EFF003D6B
        FF003564FF002D5DFF002A5AFF002858FF002556FF002354FF002252FF001F53
        FF001845F700273BCA00BABBCC00F4F4F400FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00E4E8FF002749F2003260FB003E6DFF003D6BFF003F6BFF003C6AFF003966
        FF003161FF002D5DFF002B5BFF002859FF002657FF002356FF002355FF001A46
        F700263CCD00BABBCD00F4F4F400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00E4E8FF002749F3003260FD003D6CFF003868FF003666FF003363
        FF003060FF002E5EFF002B5CFF002959FF002657FF002758FF001D4AFA00273E
        D200BABCCD00F4F4F400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00E4E8FF00274BF4003060FC003E6DFF00396AFF003868
        FF003464FF003262FF003060FF002C5FFF002C5DFF001E4CFA002740D600BCBE
        CF00F4F4F400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00E4E8FF002B4EF4000D39F3000D37F1000D37
        F0000C36EF000C35ED000D34ED000B33EA000C33EA002C49E500D0D2E500F7F7
        F700FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00}
      NumGlyphs = 1
      ExplicitLeft = 627
      ExplicitWidth = 131
      ExplicitHeight = 48
    end
    inherited bt_sair: TBitBtn
      Left = 887
      Width = 126
      Height = 48
      Glyph.Data = {
        36090000424D3609000000000000360000002800000018000000180000000100
        2000000000000009000000000000000000000000000000000000FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FEFEFE00F1F1
        F100E3E3E300E6E6E600F2F2F200FCFCFC00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F3F3F300C2C2
        C2008E8E8E0093939300B6B6B600D6D6D600EAEAEA00F7F7F700FEFEFE00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00F7F7F700E2E2E200DCDCDC00DEDEDE00C1B0B000885C
        5C0087696900756D6D00666666007D7D7D00A0A0A000C6C6C600E0E0E000F1F1
        F100FCFCFC00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00F9F9F900D2D2D2008F8F8F007979790080808000987D7D00C18E
        8E00966363008A575700815656007E6B6B006A6666006D6D6D008C8C8C00B3B3
        B300D7D7D700F2F2F200FEFEFE00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00E6E6E6007979790074747400737373007172720075646400C895
        9500A06C6C00A26F6F00A06D6D00905D5D00804D4D0082606000766B6B006665
        650085858500C6C6C600F5F5F500FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00B1B1B100838383006E6D6E0090898C00B3ACB100A1909300C994
        9400A16D6D00A26F6F00A3707000A26F6F00A37070009865650085535300684D
        4D006C6C6C00A0A0A000EBEBEB00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00A7A7A7008F8F8F00716A6F0057D4800062EF900073BE8400CE97
        9900A4717100A4717100A4717100A3707000A4717100A3707000A67272008357
        57006566660096969600E7E7E700FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00A4A4A40092929200736970004DD379004BED81005DBD7400D49A
        A000A5727200A7747400A6737300A6737300A5727200A4717100A6717100865A
        5A006667670093939300E6E6E600FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00A2A2A20096969600746A720046CE730044E379005BB77000DBA0
        A600A7737300A9767600A8757500A6747400A8747400A6737300A77373008A5E
        5E006668680090909000E5E5E500FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00A2A2A20099999900776D74003DCC6D003BDA700059B06B00DEA6
        AB00AB777700AC787800A3717100A3727200A7767600A8757500A97575008F61
        6100676868008E8E8E00E4E4E400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF009F9F9F009C9C9C00766C730030C460002CCF610053A96100E1A7
        AC00AC767600A58D8D008B8989009C737300A7757500AC797900AB7777009364
        6400676A6A008C8C8C00E4E4E400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF009E9E9E00A0A0A000736B6D0096F7F30096FFF80097C5BF00DFA9
        AA00B58A8A00D2D8D800D4D8D800A68B8B00AE7A7A00AD7A7A00AC7979009969
        69006A6C6C008A8A8A00E2E2E200FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF009E9E9E00A1A1A1006D696900C6FFFF00C7FFFF00BACACA00E0AE
        AE00B17D7D00D3C7C700CCCBCB00B0848400B07D7D00AF7C7C00AE7B7B009C6B
        6B006B6E6E0088888800E1E1E100FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF009B9B9B00A7A7A7006A696900F6FFFF00F3FFFF00D4C9C900E0B2
        B200B27F7F00B47F7F00B47E7E00B3808000B27F7F00B17E7E00B07D7D00A06E
        6E006C6F6F0085858500E1E1E100FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF0099999900A9A9A9006B6B6B00FFFFFF00FFFFFC00E0C7C600E1B4
        B400B7838300B7848400B6838300B5828200B4818100B3808000B27F7F00A671
        71006D71710083838300E0E0E000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF0099999900ADADAD006F6E6F00FFFFF600FFF9EF00E0C5C000E3B6
        B700B8848400B9868600B9868600B7848400B6838300B5828200B4818100A973
        73007072720081818100DFDFDF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF0098989800AEAEAE0074757500FFF8E900FFF2E400E2C1BA00E5BA
        BA00B9868600BE8A8A00B8838300B8848400B6828200B5828200B4818100AE76
        7600707373007F7F7F00DEDEDE00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF0098989800AFAFB00078797900FFF3DD00FFEEDA00E3BFB500E8BF
        C000BA858500F1CFCF00F9DBDB00ECC7C700E0B3B300D4A3A300C3919100AE79
        7900717474007D7D7D00DEDEDE00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF009B9B9B00B3B3B3007E7F7E00FFECD100FFE7CE00E4BDB000EAC0
        C200BC868600EDD3D300FFF0F000FFE9E900FFE3E300FFE0E000EABCBC00AF79
        7900747373007B7B7B00DDDDDD00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF009B9B9B00B3B3B30084817F00FFE4C300FFE1C000E6BBAB00EBC3
        C400C18B8B00E1C9C900FFF2F200FFF1F100FFEAEA00FFE4E400E7B9B900B17B
        7B007775750078787800DCDCDC00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF009C9C9C00B5B5B5008B868200FFE3B600FFDFB300EABBA900EEC5
        C600C38E8E00C18B8B00BA838300BA868600C2909000CA9B9B00C6959500B57F
        7F007776760077777700DCDCDC00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF009E9E9E00B6B6B7008686860085817B0087837D00B6959200F6CD
        CD00DBB0B000D9AEAE00D5A6A600CC9F9F00C3929200BD898900BB878700B881
        81007B7878007E7E7E00DEDEDE00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00A0A0A000C9C9C900ABACAC00A8A8A900A3A4A400A19F9F00A39A
        9A00A3969600A2919100A5919100A7909000AC939300AE939300AF919100A280
        80007B7A7A00AAAAAA00EBEBEB00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00B7B7B700A3A3A3009F9F9F009F9F9F009D9D9D00999A9A009697
        97009696960093949400919292008F9090008E8F8F008689890086888800898A
        8A00A5A5A500EBEBEB00FBFBFB00FFFFFF00FFFFFF00FFFFFF00}
      NumGlyphs = 1
      ExplicitLeft = 887
      ExplicitWidth = 126
      ExplicitHeight = 48
    end
    inherited bt_excluir: TBitBtn
      Left = 382
      Width = 126
      Height = 48
      Glyph.Data = {
        36090000424D3609000000000000360000002800000018000000180000000100
        2000000000000009000000000000000000000000000000000000FFFFFF00F5F5
        F500E4E4E400DCDCDC00DADADA00DADADA00DADADA00DADADA00DADADA00DADA
        DA00DADADA00DADADA00DADADA00DADADA00DADADA00DADADA00DADADA00DADA
        DA00DADADA00DADADA00DCDCDC00E4E4E400F5F5F500FFFFFF00F5F5F500C9C9
        C900909090007878780073737300737373007373730073737300737373007373
        7300737373007373730073737300737373007373730073737300737373007373
        730073737300737373007878780091919100CACACA00F5F5F500C1C2DD002F38
        B6000E1CB8000C19B3000C17B2000C16AE000C15AC000C14AB000C13A7000C12
        A7000C10A4000C0FA3000C0E9F000C0D9D000C0D9D000C0D9C000C0C9B000C0C
        9B000C0C9A000D0D9A002D2D950062626D0091919100E4E4E4002F3CC5003A50
        DA00051ECC000017C9000016C6000015C4000013C2000010BE000011BC000010
        BA00000EB700000DB400000CB100000AAF000006AB000005A6000006A7000005
        A5000004A20000029F0001039E002D2D950076767600DCDCDC001A2DCA004A64
        EC00001FE0000023E0000022DD00001DDB000D38EE00133FF1000019D500001D
        D400001BD100001BCE000018CB000010C5001635DB00264CE6000008B800000E
        B700000DB400000AAD000103A0000909990072727200DADADA001D32CF00506C
        F1000020E5000025E4000021E300002CEF007C99F30098AEF2000935EF00001A
        D700001DD500001BD2000015CC000D2FDD008FAFFF00BACEFF001A40E2000007
        B700000EB700000DB4000104A20008089A0072727200D9D9D9001F36D3005773
        F5000023EB000027EA000029F4006A87F300F1EDDD00F3EEE1008EA8F4000735
        F000001BD900001AD600072DE20083A3FF00FFFFF700FFFFFA00B2C8FF00193F
        E1000007B700000EB7000105A40008089B0071717100D9D9D9002037D5005D7C
        FB000026F1000026F9006080F200EFEBDB00E2E2E000E6E6E400F7F3E70090AA
        F7000330EF000028E600789AFF00FFFFF700FCFCFA00FFFFFE00FFFFFE00B4CB
        FF00193DE0000008B7000106A60008089B0071717100D9D9D900223CDA006683
        FE000023F8005D79EF00EFEBD800E0E0DE00E1E1E100E5E5E500E9E9E800FDF9
        EC0089A3F9006287FD00FFFFF600FCFBF900FCFCFC00FEFEFE00FFFFFF00FFFF
        FF00B9CEFF002245E4000105A50008089C0071717100D9D9D900243DDC006D8D
        FF000025FA00637CE900F1EDD900E1E1DF00E2E2E200E6E6E600E9E9E900EEEE
        ED00FAF8F100FCFBF400FBFAF800FBFBFB00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00A7C1FF001C3EDF000106A80008099E0071717100D9D9D9002841DE007596
        FF000033FF000027FB005F79EA00F4EFDE00E5E5E300E7E7E700EAEAEA00EEEE
        EE00F2F2F200F5F5F500F9F9F900FEFEFE00FEFEFE00FFFFFF00FFFFFF009FBA
        FF001236E100000FC400010AAE00080AA10071717100D9D9D9002945E0007EA0
        FF00003AFF00053EFF00002AFB00617BEB00F8F3E400E9E8E700EBEBEB00EFEF
        EF00F2F2F200F6F6F600FAFAFA00FDFDFD00FFFFFF00FFFFFF0097B2FF000C34
        E6000014CC000017CC00010BB000080CA40071717100D9D9D9002B4AE40088A8
        FF00003FFF000845FF000743FF00002BFB00637CEC00F2F0E700EBEBEB00EFEF
        EF00F3F3F300F6F6F600FAFAFA00FFFFFF00FFFFFF008CA8FF000430EC000018
        D500001BD200001BCE00010DB300080DA60071717100D9D9D9002E4DE50090B0
        FF000246FF000B4BFF000A4BFF000038FC002447EC00EEECE800EBEBEB00EFEF
        EF00F3F3F300F6F6F600FAFAFA00FFFFFF00FFFFFF006487FF000026E700001D
        D900001DD500001BD100010EB600080FA90071717100D9D9D9002F51E8009ABA
        FF00074EFF000F55FF00023FF9002845E100F2F0E300EAEAE700EBEBEB00EEEE
        EE00F2F2F200F6F6F600F9F9F900FDFDFD00FFFFFF00FFFFFF006B8FFF000028
        E800001CD700001DD400010FB7000810AC0071717100D9D9D9003152EA00A1C1
        FF000956FF000546F600273DD400EDEBDF00E7E6E300E6E6E600EAEAEA00EDED
        ED00F1F1F100F5F5F500F8F8F800FCFCFC00FEFEFE00FFFFFF00FFFFFF00698E
        FF000026E500001BD5000111BA000811AE0071717100D9D9D9003557EC00ABCC
        FF000246F3002939C800E9E7DB00E2E1DE00E2E2E200E5E5E500E9E9E900EDED
        EC00FAF9F000FDFCF300F9F9F700FAFAFA00FDFDFD00FEFEFE00FFFFFF00FFFF
        FF006D90FF00062DE4000110BC000813B10071717100D9D9D9003558EE00B3D3
        FF00001DD1009090CA00ECE9DC00DEDEDD00E1E1E100E4E4E400EAEAE800FFFB
        EB007186ED00738BF200FFFFF500FAF9F800FBFBFB00FFFFFF00FFFFFE00FFFF
        FF00CAD7FF001141F7000112BF000814B40071717100D9D9D900385BF200BAD8
        FF00116DFF00001DCF009495CD00EAE8DE00E0E0DF00E5E5E400F8F5E7007B8B
        E4000026F3000025F7007D92F200FFFFF600F9F9F800FCFCFB00FFFFFD00C4D0
        FF000133F800001CDC000115C2000816B80072727200D9D9D9003A5EF400C2DD
        FF00146FFF001F77FF00001CCE009597CE00EDEBE100F4F1E3007984DA000027
        EB000A4CFF000744FF000023F6008294F200FFFFF500FFFFF800BCCAFC00002B
        F9000021E1000021DD000116C5000817BA0072727200DADADA003C61F600C8E3
        FF001674FF002177FF001F77FF00001BCC00A3A3D0008085D1000026E3000F56
        FF000B4BFF000846FF00053EFF000020F6008A9BF200C3CDF6000022FC000025
        EA000025E4000023E1000117C8000818BC0076767600DCDCDC003F65F800D3EB
        FF002B83FF001875FF001772FF00136EFF000019CA000024D9000C5AFF00094F
        FF000448FF000241FF00003CFF000034FF000020F5000021F3000026F1000024
        EB000022E500001FE0000116C9000B1EC20090909000E4E4E400345BFA00C8E6
        FF00C8E5FF00A2CCFF009DC7FF0097C0FF0090BCFF0089B6FF0080ABFF007AA3
        FF00729AFF006A92FF00628AFF005B7FFF005377FF004D6FFD004769F8004261
        F3003C5BEE003854E700394DD7003141BF00C9C9C900F5F5F500D1D8FF00345C
        FA003C64F9003B61F7003A5EF500385EF4003559F2003357F0003254EF002F51
        EC002C4FEA002B4DEA002A49E7002646E4002442E400223FE1001F3BDE001E38
        DC001C36D9001B33D4003143CF00C1C3DF00F5F5F500FFFFFF00}
      NumGlyphs = 1
      ExplicitLeft = 382
      ExplicitWidth = 126
      ExplicitHeight = 48
    end
    inherited bt_consultar: TBitBtn
      Left = 128
      Width = 126
      Height = 48
      Glyph.Data = {
        36090000424D3609000000000000360000002800000018000000180000000100
        2000000000000009000000000000000000000000000000000000FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F7F7
        F700E4E4E400E4E4E400F4F4F400FDFDFD00FFFFFF00FFFFFF00FEFEFE00F1F1
        F100DEDEDE00D9D9D900D9D9D900D9D9D900D9D9D900D9D9D900D9D9D900D9D9
        D900D9D9D900D9D9D900D9D9D900D9D9D900D9D9D900D9D9D900D7D7D700C1C1
        C1008E8E8E0090909000BABABA00D9D9D900F1F1F100FEFEFE00F1F1F100B9B9
        B900808080006F6F6F006E6E6E006E6E6E006E6E6E006E6E6E006E6E6E006E6E
        6E006E6E6E006E6E6E006E6E6E006E6E6E006E6E6E006E6E6E006F6F72008681
        78007877770069696900646464007D7D7D00B9B9B900F1F1F100E7CEA800FF9A
        0100FF990000FF990000FF990000FF990000FF990000FF990000FF990000FF99
        0000FF990000FF990000FF990000FF990000FF990000F9B759000645FF004E85
        E600E5DACF0085745900FFAC2E0080725D0080808000DFDFDF00FF990000FFE5
        E500FFE6E600FFE6E600FFE6E600FFE6E600FFE6E600FFE5E500FFE3E300FFE2
        E200FFE1E100FFDFDF00FFDEDE00FFDCDC00F7E1E7000C4AFF00469CFF0064D7
        FF00659DE9008E878100FFCCCC00FF9900006F6F6F00D9D9D900FF990000FFE8
        E800FFE9E900FFE9E900FFE9E900FFE9E900FFE9E900FFE8E800FFE7E700FFE6
        E600FFE5E500FFE2E200FFE0E000F3DCE5000B49FF0049A2FF006FD9FF0057B7
        FF000F5AFF00DAB8C500FFCDCD00FF9900006E6E6E00D9D9D900FF990000FFEB
        EB00FFECEC00FFECEC00FFECEC00FFECEC00FFECEC00FFEFEF00FFEEEE00FBEA
        EA00FAE7E700FFEAEA00F1D8D700848185003B8CE1006EDDFF0056B4FF00195B
        FF00E3C2DA00FFD1D100FFCECE00FF9900006E6E6E00D9D9D900FF990000FFEF
        EF00FFF0F000FFF0F000FFF0F000FFF0F000FFF3F300CCC2C40088888B007D7C
        79007F7D7A0088868A009F959600AEAAA500C0C7C200419AE9001456FF00E6C9
        DD00FFD5D500FFD2D200FFD0D000FF9900006E6E6E00D9D9D900FF990000FFF2
        F200FFF3F300FFF3F300FFF3F300FFF5F500A3A1A300B5AA9600F5D09400FBD2
        9300FBD39A00FCD79D00C2B4A00080838900C4C0BB0082808E00E9CEE000FFDA
        DA00FFD7D700FFD4D400FFD1D100FF9900006E6E6E00D9D9D900FF990000FFF4
        F400FFF7F700FFF7F700FFF7F700DBD7D700AEA59300FCD79A00F1D19B00EFD0
        9900EECD9100F0CF9700FAD79F00C1B39E009A909100EAD1D000FFDEDE00FFDC
        DC00FFD9D900FFD5D500FFD2D200FF9900006E6E6E00D9D9D900FF990000FFF8
        F800FFF9F900FFFAFA00FFFAFA0094939700F4D8A200F5DDAA00F1DBAA00F1DB
        A900F0D4A200EFD09700F0CE9A00FEDAA3008F8C8F00FFE2E200FFDFDF00FFDD
        DD00FFDADA00FFD6D600FFD3D300FF9900006E6E6E00D9D9D900FF990000FFFA
        FA00FFFCFC00FFFDFD00FFFDFD0082828000FFE8B500F6E5BE00F7E7C000F5E2
        B800F3DDB100F1D6A500F0D09500FDDAA40086848300FFE8E800FFE1E100FFDE
        DE00FFDBDB00FFD7D700FFD4D400FF9900006E6E6E00D9D9D900FF990000FFFD
        FD00FFFFFF00FFFFFF00FFFFFF0084838300FFF3C800FCF5DC00FAF3D600F7EC
        C800F6E7BD00F3DCAD00F0D39E00FED9A10084838200FFEAEA00FFE1E100FFDE
        DE00FFDCDC00FFD9D900FFD5D500FF9900006E6E6E00D9D9D900FF990000FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00B4B5B600EFE6C500FFFFF000FEFEFC00FCF6
        DB00F7ECC700F6E1B300F3D7A400F4D8A400918E9200FFEAEA00FFE2E200FFDF
        DF00FFDCDC00FFD9D900FFD5D500FF9900006E6E6E00D9D9D900FF990000FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00F3F3F300A5A39C00FFFFEC00FFFFF700FDF9
        E500F9EECC00F7E3B600FFE1A600A49D9100DBCBCC00FFEAEA00FFE2E200FFDF
        DF00FFDCDC00FFD9D900FFD5D500FF9900006E6E6E00D9D9D900FF990000FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00EAEAEB00A5A49E00E8E3C700FFFC
        D300FFF2C200E9D5AB00A29C9400C8BFC100FFEDED00FFE6E600FFE2E200FFDF
        DF00FFDCDC00FFD9D900FFD5D500FF9900006E6E6E00D9D9D900FF990000FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F2F2F200A5A5A7008080
        8300808181009A989B00E4DADA00FFECEC00FFE9E900FFE6E600FFE2E200FFDF
        DF00FFDCDC00FFD9D900FFD5D500FF9900006E6E6E00D9D9D900FF990000FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFCFC00FFFA
        FA00FFF8F800FFF3F300FFF0F000FFECEC00FFE9E900FFE6E600FFE2E200FFDF
        DF00FFDCDC00FFD9D900FFD5D500FF9900006E6E6E00D9D9D900FF990000CFCD
        CD00CFCFCF00CFCFCF00CFCFCF00CFCFCF00CFCFCF00CFCDCD00CFCBCB00CFC9
        C900CFC7C700CFC4C400CFC2C200CFC0C000CFBDBD00CFBBBB00CFB8B800CFB6
        B600CFB3B300CFB1B100CFAFAF00FF9900006E6E6E00D9D9D900FF990000FFAD
        3D00FF990000FF990000FF990000FF990000FF990000FF990000FF990000FF99
        0000FF990000FF990000FF990000FF990000FF990000FF990000FF990000FF99
        0000FF990000FF990000FF990000FF9900006F6F6F00D9D9D900FF990000FFCC
        9900EB850000EB850000EB850000EB850000EB850000EB850000EB850000EB85
        0000EB850000EB850000EB850000EB850000EB850000EB850000EB850000EB85
        0000EB850000EB850000F7910000FF99000080808000DFDFDF00FF990000FFCC
        9900FFCC9900FFCC9900FFCC9900FFCC9900FFCC9900FFCC9900FFCC9900FFCC
        9900FFCC9900FFCC9900FFCC9900FFCC9900FFCC9900FFCC9900FFCC9900FFCC
        9900FFCC9900FFCC9900FFAD3D00FF990000B9B9B900F1F1F100FEE2B800FF9A
        0100FF990000FF990000FF990000FF990000FF990000FF990000FF990000FF99
        0000FF990000FF990000FF990000FF990000FF990000FF990000FF990000FF99
        0000FF990000FF990000FF9A0100E6CDA700F1F1F100FEFEFE00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00}
      NumGlyphs = 1
      ExplicitLeft = 128
      ExplicitWidth = 126
      ExplicitHeight = 48
    end
    inherited bt_imprimir: TBitBtn
      Left = 759
      Top = 1
      Width = 127
      Height = 48
      Glyph.Data = {
        36090000424D3609000000000000360000002800000018000000180000000100
        2000000000000009000000000000000000000000000000000000FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FEFEFE00F7F7
        F700EBEBEB00EBEBEB00EEEEEE00E5E5E500E4E4E400F1F1F100FCFCFC00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F7F7F700E5E5E500C4C4
        C400A1A1A100A1A1A100AAAAAA009090900090909000B4B4B400D9D9D900EEEE
        EE00FBFBFB00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00F9F9F900E8E8E800C9C9C9009D9D9D008989
        890083838300737373008282820080808000757575006666660083838300AEAE
        AE00D4D4D400ECECEC00FAFAFA00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FAFAFA00EBEBEB00CECECE00A3A3A300909090009B9B9B00DBDB
        DB00A0A0A00091919100D1D1D1009C9C9C008A8A8A007F7F7F00787878006464
        64007D7D7D00A7A7A700D0D0D000EAEAEA00F9F9F900FFFFFF00FFFFFF00FCFC
        FC00EEEEEE00D3D3D300A7A7A7009494940099999900D6D6D600F7F7F700F4F4
        F400ABABAB00B7B7B700E5E5E5009F9F9F00A7A7A700A3A3A3008D8D8D007C7C
        7C007A7A7A006464640078787800A2A2A200D2D2D200F7F7F700F9F9F900DCDC
        DC00ADADAD00969696009A9A9A00D2D2D200F6F6F600F4F4F400E6E6E600DADA
        DA0098989800ABABAB00D5D5D5008989890092929200A4A4A400A9A9A900A8A8
        A80090909000797979007B7B7B00676767008F8F8F00E4E4E400E4E4E400A3A3
        A3009A9A9A00CDCDCD00F5F5F500F3F3F300E7E7E700DCDCDC00EAEAEA00F5F5
        F5009E9E9E00B2B2B200F2F2F200959595009B9B9B009090900090909000A1A1
        A100ABABAB00ADADAD00939393007777770074747400DBDBDB00A9A9A900CACA
        CA00F2F2F200F3F3F300E7E7E700DCDCDC00E9E9E900F5F5F500F7F7F700F4F4
        F40096969600B2B2B200F7F7F70090909000999999009D9D9D009F9F9F009595
        9500919191009C9C9C00B3B3B3007979790072727200DADADA00A3A3A300F8F8
        F800E8E8E800DCDCDC00E8E8E800F5F5F500F5F5F500F5F5F500F8F8F800F6F6
        F60090909000B1B1B100FDFDFD008D8D8D0096969600999999009B9B9B009F9F
        9F00A3A3A3009D9D9D00959595007676760071717100D9D9D900A3A3A300E2E2
        E200E7E7E700F4F4F400F4F4F400F5F5F500F6F6F600F8F8F800FAFAFA00F7F7
        F70088888800B0B0B000FFFFFF00898989009393930095959500989898009B9B
        9B009E9E9E00A2A2A200A9A9A9007979790071717100D9D9D900A8A8A800F9F9
        F900F4F4F400F4F4F400F6F6F600F7F7F700F8F8F800FAFAFA00FDFDFD00FAFA
        FA0084848400B0B0B000FFFFFF00868686009191910092929200959595009898
        98009B9B9B009D9D9D00A4A4A4007B7B7B0071717100D9D9D900AAAAAA00F9F9
        F900F5F5F500F6F6F600F8F8F800F9F9F900FBFBFB00FDFDFD00F5F5F500E6E6
        E60072727200A1A1A100F8F8F80076767600818181008A8A8A00939393009696
        9600979797009A9A9A00A1A1A1007979790071717100D9D9D900AEAEAE00FDFD
        FD00F7F7F700F9F9F900FAFAFA00FBFBFB00FEFEFE00F7F7F700F1F1F100FAFA
        FA0077777700ABABAB00FFFFFF00888888008686860086868600838383008686
        860092929200989898009F9F9F007B7B7B0072727200DADADA00AFAFAF00FEFE
        FE00F9F9F900FBFBFB00FCFCFC00FFFFFF00FFFFFF00EAEAEA00FFFFFF00F3F3
        F30093929300B7B7B700E8E8E800BBBBBB00BEBEBE00A9A9A9008B8B8B008D8D
        8D0088888800878787008D8D8D007D7D7D0072727200DADADA00B2B2B200FFFF
        FF00FBFBFB00FDFDFD00FEFEFE00FFFFFF00F0F0F000FBFBFB00FFFFFF00CFD3
        CF00ABADAC00B5B4B400A6A6A600E6E6E600C1C1C100A6A6A600BDBDBD00B3B3
        B3009F9F9F008E8E8E00949494007C7C7C0083838300E0E0E000B6B6B600FFFF
        FF00FFFFFF00FEFEFE00FFFFFF00F9F9F900F1F1F100FFFFFF00FFFEFF0078D8
        930095DAA500D2CFD200FFFFFF00FFFFFF00FFFFFF00FFFFFF00DFDFDF00BDBD
        BD00ACACAC00C1C1C100C2C2C2007D7D7D00B6B6B600F0F0F000B8B8B800FFFF
        FF00FFFFFF00FFFFFF00F6F6F600F0F0F000FFFFFF00FFFFFF00DAD9D9009EB0
        A500C1C4B800FFFCEE00FFFAF400FFFDFB00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00CFCFCF0091919100B0B0B000EAEAEA00FDFDFD00B9B9B900F5F5
        F500EDEDED00EEEEEE00F7F7F700FFFFFF00FFFFFF00ECECEC00C4C4C400C1C1
        C400F2DAB400FFEAC400FFEDCD00FFF1D800FFF6E400FFFCF000FFFFFC00FFFF
        FD00CCCCCC0096969600C8C8C800F1F1F100FEFEFE00FFFFFF00B8B8B800FFFF
        FF00FFFFFF00FFFFFF00FBFBFB00F0F0F000E0E0E000D0D0D000CECFCF009F9B
        9300AB9C7F00C9B59100E1CAA000EBD4AC00E2CFB100C8BEAE00ACA8A3009B9B
        9A00BEBEBE00EBEBEB00FBFBFB00FFFFFF00FFFFFF00FFFFFF00B7B7B700EDED
        ED00EEEEEE00EDEDED00E7E7E700E2E2E200DFDFDF00D5D5D500B2B2B2008383
        850074757700626466008B8D91008A8C8E0093949600AEAEAE00D7D8D800F7F7
        F700FEFEFE00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00EAEAEA00D5D5
        D500CBCBCB00C4C4C400BBBBBB00C1C1C100C7C7C700CCCCCC00D5D5D500DDDD
        DD00E0E0E000DADADA00C9C9C9009F9F9F00B8B8B800E8E8E800FDFDFD00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FDFDFD00EFEFEF00E1E1E100D2D2D200C1C1C100B2B2
        B200A6A6A600A6A6A600B6B6B600CCCCCC00EEEEEE00FCFCFC00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00}
      NumGlyphs = 1
      ExplicitLeft = 759
      ExplicitTop = 1
      ExplicitWidth = 127
      ExplicitHeight = 48
    end
  end
  object Panel8: TPanel
    Tag = 99
    Left = 0
    Top = 0
    Width = 1014
    Height = 56
    Align = alTop
    Color = clBlack
    TabOrder = 2
    object Label46: TLabel
      Left = 372
      Top = 17
      Width = 258
      Height = 23
      Caption = 'SA'#205'DAS POR NOTA FISCAL'
      Font.Charset = ANSI_CHARSET
      Font.Color = clYellow
      Font.Height = -19
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
    end
  end
end
