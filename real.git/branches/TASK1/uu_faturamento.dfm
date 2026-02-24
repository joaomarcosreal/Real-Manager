inherited frm_faturamento: Tfrm_faturamento
  Left = 138
  Top = 113
  Caption = 'Faturamento'
  ClientHeight = 417
  ClientWidth = 863
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited pn_principal: TPanel
    Width = 863
    Height = 375
    inherited pn_codigo: TPanel
      Width = 861
      inherited bt_pesquisa: TSpeedButton
        Left = 108
        Top = 20
      end
      inherited ed_codigo: TMaskEdit
        Width = 102
      end
    end
    object Panel1: TPanel
      Left = 1
      Top = 47
      Width = 861
      Height = 327
      Align = alClient
      TabOrder = 1
      object Panel2: TPanel
        Left = 2
        Top = 2
        Width = 857
        Height = 311
        TabOrder = 0
        object Label10: TLabel
          Left = 7
          Top = 54
          Width = 87
          Height = 13
          Caption = 'Data da fatura:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label5: TLabel
          Left = 111
          Top = 54
          Width = 67
          Height = 13
          Caption = 'Vencimento'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label1: TLabel
          Left = 7
          Top = 10
          Width = 73
          Height = 13
          Caption = 'C'#243'd. cliente:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object bt_pesq_cliente: TSpeedButton
          Left = 84
          Top = 23
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
        end
        object Label9: TLabel
          Left = 204
          Top = 54
          Width = 86
          Height = 13
          Caption = 'Data de pagto:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label6: TLabel
          Left = 303
          Top = 54
          Width = 71
          Height = 13
          Caption = 'C'#243'd. Venda:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label7: TLabel
          Left = 431
          Top = 54
          Width = 117
          Height = 13
          Caption = 'Usu'#225'rio que faturou:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label4: TLabel
          Left = 463
          Top = 9
          Width = 38
          Height = 13
          Caption = 'Valor :'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label8: TLabel
          Left = 7
          Top = 94
          Width = 114
          Height = 13
          Caption = 'Usu'#225'rio que baixou:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label12: TLabel
          Left = 441
          Top = 196
          Width = 79
          Height = 13
          Caption = 'Observa'#231#245'es:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object DBEdit7: TDBEdit
          Left = 8
          Top = 68
          Width = 89
          Height = 21
          DataField = 'DATA_FATURA'
          DataSource = dm.ds_qry_faturas
          ReadOnly = True
          TabOrder = 0
        end
        object DBEdit1: TDBEdit
          Left = 112
          Top = 68
          Width = 89
          Height = 21
          DataField = 'DATA_VENCIMENTO'
          DataSource = dm.ds_qry_faturas
          ReadOnly = True
          TabOrder = 1
        end
        object DBEdit6: TDBEdit
          Left = 205
          Top = 68
          Width = 89
          Height = 21
          DataField = 'DATA_PAGAMENTO'
          DataSource = dm.ds_qry_faturas
          ReadOnly = True
          TabOrder = 3
        end
        object DBEdit3: TDBEdit
          Left = 304
          Top = 68
          Width = 121
          Height = 21
          DataField = 'COD_VENDA'
          DataSource = dm.ds_qry_faturas
          ReadOnly = True
          TabOrder = 4
        end
        object DBEdit4: TDBEdit
          Left = 432
          Top = 68
          Width = 193
          Height = 21
          DataField = 'USUARIO_INCLUSAO'
          DataSource = dm.ds_qry_faturas
          ReadOnly = True
          TabOrder = 5
        end
        object DBEdit2: TDBEdit
          Left = 461
          Top = 24
          Width = 116
          Height = 21
          DataField = 'VALOR_FATURA'
          DataSource = dm.ds_qry_faturas
          ReadOnly = True
          TabOrder = 6
        end
        object DBEdit5: TDBEdit
          Left = 8
          Top = 108
          Width = 217
          Height = 21
          DataField = 'USUARIO_BAIXA'
          DataSource = dm.ds_qry_faturas
          ReadOnly = True
          TabOrder = 7
        end
        object Panel3: TPanel
          Left = 108
          Top = 5
          Width = 347
          Height = 45
          BevelOuter = bvNone
          Enabled = False
          TabOrder = 8
          object Label2: TLabel
            Left = 4
            Top = 5
            Width = 85
            Height = 13
            Caption = 'Nome Fantasia'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label3: TLabel
            Left = 360
            Top = 8
            Width = 32
            Height = 13
            Caption = 'Label3'
          end
          object ed_desc_cliente: TDBEdit
            Left = 4
            Top = 18
            Width = 341
            Height = 21
            Color = clBlack
            DataField = 'RAZAO_SOCIAL'
            DataSource = dm.ds_qry_faturas
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clYellow
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 0
          end
        end
        object DBMemo1: TDBMemo
          Left = 440
          Top = 216
          Width = 281
          Height = 81
          DataField = 'OBSERVACAO'
          DataSource = dm.ds_qry_faturas
          ReadOnly = True
          TabOrder = 9
        end
        object ed_cod_cliente: TDBEdit
          Left = 8
          Top = 24
          Width = 73
          Height = 21
          DataField = 'COD_CLI'
          DataSource = dm.ds_qry_faturas
          TabOrder = 2
          OnKeyDown = Edit1KeyDown
        end
        object GroupBox3: TGroupBox
          Left = 4
          Top = 137
          Width = 428
          Height = 167
          Caption = 'Formas de Pagamento'
          Color = clBtnFace
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentColor = False
          ParentFont = False
          TabOrder = 10
          object Label13: TLabel
            Left = 9
            Top = 18
            Width = 33
            Height = 16
            Caption = 'C'#243'd:'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Verdana'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label14: TLabel
            Left = 235
            Top = 19
            Width = 38
            Height = 16
            Caption = 'Valor'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Verdana'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object bt_pesquisa_forma: TSpeedButton
            Left = 46
            Top = 33
            Width = 22
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
          end
          object Label11: TLabel
            Left = 72
            Top = 18
            Width = 71
            Height = 16
            Caption = 'Descri'#231#227'o'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Verdana'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object ed_codigo_forma: TFocusEdit
            Left = 9
            Top = 35
            Width = 35
            Height = 21
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 0
            NormalColor = clWindow
            FocusColor = clMoneyGreen
          end
          object ed_valor_forma: TFocusEdit
            Left = 236
            Top = 34
            Width = 85
            Height = 21
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 1
            Text = '0,00'
            NormalColor = clWindow
            FocusColor = clMoneyGreen
          end
          object ed_descricao_forma: TFocusEdit
            Left = 71
            Top = 35
            Width = 162
            Height = 21
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 2
            NormalColor = clWindow
            FocusColor = clMoneyGreen
          end
          object DBGrid1: TDBGrid
            Left = 8
            Top = 64
            Width = 415
            Height = 96
            TabOrder = 3
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -13
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = [fsBold]
          end
          object BitBtn1: TBitBtn
            Left = 326
            Top = 30
            Width = 94
            Height = 25
            Caption = 'adicionar'
            TabOrder = 4
          end
        end
      end
    end
  end
  inherited pn_botoes: TPanel
    Top = 375
    Width = 863
    inherited bt_novo: TBitBtn
      Width = 108
      Caption = 'Baixar (F3)'
    end
    inherited bt_alterar: TBitBtn
      Left = 217
      Width = 108
    end
    inherited bt_gravar: TBitBtn
      Left = 433
      Width = 108
    end
    inherited bt_cancelar: TBitBtn
      Left = 542
      Width = 108
    end
    inherited bt_sair: TBitBtn
      Left = 759
      Width = 101
    end
    inherited bt_excluir: TBitBtn
      Left = 325
      Width = 108
    end
    inherited bt_consultar: TBitBtn
      Left = 109
      Width = 108
    end
    inherited bt_imprimir: TBitBtn
      Left = 650
      Top = 2
      Width = 108
    end
  end
end
