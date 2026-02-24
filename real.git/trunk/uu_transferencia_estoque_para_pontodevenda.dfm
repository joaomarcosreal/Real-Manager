inherited frmTransferenciaEstoque: TfrmTransferenciaEstoque
  Caption = 'Transfer'#234'ncia de Estoques -   Almoxarifado / Local de Produ'#231#227'o'
  ClientHeight = 244
  ClientWidth = 640
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited pn_principal: TPanel
    Width = 640
    Height = 202
    inherited pn_codigo: TPanel
      Width = 638
      Height = 48
      object Label6: TLabel [1]
        Left = 5
        Top = 9
        Width = 113
        Height = 13
        Caption = 'C'#243'd. Transfer'#234'ncia:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
    end
    object Panel1: TPanel
      Left = 1
      Top = 49
      Width = 638
      Height = 152
      Align = alClient
      TabOrder = 1
      object gpDadosTransferencia: TGroupBox
        Left = 5
        Top = 81
        Width = 623
        Height = 65
        Caption = 'Local de Produ'#231#227'o para transfer'#234'ncia'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
        object SpeedButton1: TSpeedButton
          Left = 75
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
        end
        object Label2: TLabel
          Left = 5
          Top = 20
          Width = 66
          Height = 13
          Caption = 'Cod. Local:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label3: TLabel
          Left = 103
          Top = 18
          Width = 183
          Height = 13
          Caption = 'Descri'#231#227'o do local de Produ'#231#227'o'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label4: TLabel
          Left = 301
          Top = 20
          Width = 70
          Height = 13
          Caption = 'Quantidade:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label5: TLabel
          Left = 461
          Top = 20
          Width = 148
          Height = 13
          Caption = 'Unidade de transfer'#234'ncia:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object SpeedButton2: TSpeedButton
          Left = 437
          Top = 34
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
        end
        object Label7: TLabel
          Left = 389
          Top = 20
          Width = 61
          Height = 13
          Caption = 'C'#243'd. Unid:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Panel2: TPanel
          Left = 100
          Top = 31
          Width = 197
          Height = 26
          BevelOuter = bvNone
          TabOrder = 2
          object Edit2: TEdit
            Left = 4
            Top = 3
            Width = 189
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
        object ed_loc: TEdit
          Left = 4
          Top = 34
          Width = 69
          Height = 21
          TabOrder = 1
          Text = 'x'
          OnKeyDown = Edit1KeyDown
        end
        object Edit3: TEdit
          Left = 300
          Top = 32
          Width = 77
          Height = 21
          TabOrder = 3
          OnKeyDown = Edit1KeyDown
        end
        object Edit4: TEdit
          Left = 388
          Top = 32
          Width = 45
          Height = 21
          TabOrder = 4
          OnKeyDown = Edit1KeyDown
        end
        object Edit5: TEdit
          Left = 462
          Top = 35
          Width = 147
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
      object gpEstoqueAlmoxarifado: TGroupBox
        Left = 5
        Top = 16
        Width = 625
        Height = 60
        Caption = 'Estoque no Almoxarifado:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        object Label24: TLabel
          Left = 113
          Top = 18
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
        object Label10: TLabel
          Left = 182
          Top = 18
          Width = 109
          Height = 13
          Caption = 'Descri'#231#227'o do '#237'tem:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label1: TLabel
          Left = 408
          Top = 20
          Width = 84
          Height = 13
          Caption = 'Estoque Atual:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label11: TLabel
          Left = 512
          Top = 20
          Width = 48
          Height = 13
          Caption = 'Unidade'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label9: TLabel
          Left = 5
          Top = 19
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
        object bt_pesq_item_estoque_barras: TSpeedButton
          Left = 83
          Top = 31
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
        end
        object Panel5: TPanel
          Left = 111
          Top = 31
          Width = 510
          Height = 24
          BevelOuter = bvNone
          Enabled = False
          TabOrder = 1
          object ed_desc_item: TEdit
            Left = 71
            Top = 1
            Width = 222
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
          object ed_estoque_item: TEdit
            Left = 297
            Top = 2
            Width = 97
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
          object ed_unidade_item: TEdit
            Left = 398
            Top = 3
            Width = 109
            Height = 21
            Color = clBlack
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clYellow
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 2
          end
          object ed_cod_item: TEdit
            Left = -1
            Top = 1
            Width = 66
            Height = 21
            Color = clBlack
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clYellow
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 3
          end
        end
        object ed_cod_barras_item: TEdit
          Left = 4
          Top = 31
          Width = 77
          Height = 21
          TabOrder = 0
          OnKeyDown = Edit1KeyDown
        end
      end
    end
  end
  inherited pn_botoes: TPanel
    Top = 202
    Width = 640
    Caption = '0'
    inherited bt_alterar: TBitBtn
      Top = -78
      Visible = False
    end
    inherited bt_gravar: TBitBtn
      Left = 148
    end
    inherited bt_cancelar: TBitBtn
      Left = 221
      Width = 84
    end
    inherited bt_sair: TBitBtn
      Left = 314
    end
    inherited bt_excluir: TBitBtn
      Top = -79
      Visible = False
    end
    inherited bt_consultar: TBitBtn
      Left = 74
      Visible = False
    end
    inherited bt_imprimir: TBitBtn
      Left = 295
      Top = -43
      Visible = False
    end
  end
end
