inherited frmCadNotasConsumidor: TfrmCadNotasConsumidor
  Left = 362
  Top = 197
  Caption = 'Cadastro de Notas Fiscais de venda ao consumidor'
  ClientHeight = 233
  ClientWidth = 570
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited pn_principal: TPanel
    Width = 570
    Height = 191
    inherited pn_codigo: TPanel
      Width = 568
      Height = 34
      inherited bt_pesquisa: TSpeedButton
        Left = 76
        Top = 10
        Width = 24
        Height = 21
      end
      inherited ed_codigo: TMaskEdit
        Top = 10
        Width = 70
      end
    end
    object Panel1: TPanel
      Left = 1
      Top = 35
      Width = 568
      Height = 155
      Align = alClient
      TabOrder = 1
      object Label2: TLabel
        Left = 4
        Top = 30
        Width = 99
        Height = 13
        Caption = 'N'#186' do documento'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label3: TLabel
        Left = 112
        Top = 32
        Width = 34
        Height = 13
        Caption = 'S'#233'rie:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label4: TLabel
        Left = 159
        Top = 31
        Width = 58
        Height = 13
        Caption = 'Sub-s'#233'rie:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label5: TLabel
        Left = 222
        Top = 32
        Width = 99
        Height = 13
        Caption = 'Data de emiss'#227'o:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object bt_pesq_cfop_entrada: TSpeedButton
        Left = 44
        Top = 84
        Width = 21
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
      object Label23: TLabel
        Left = 6
        Top = 73
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
      object Label22: TLabel
        Left = 69
        Top = 71
        Width = 229
        Height = 14
        Caption = 'C'#243'digo Fiscal de Opera'#231#245'es e Presta'#231#245'es'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label40: TLabel
        Left = 4
        Top = 112
        Width = 78
        Height = 13
        Caption = 'Sit. tribut'#225'ria:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object bt_pesq_cst: TSpeedButton
        Left = 70
        Top = 125
        Width = 23
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
      object Label14: TLabel
        Left = 356
        Top = 115
        Width = 134
        Height = 13
        Caption = 'CPF / CNPJ do Cliente:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label1: TLabel
        Left = 331
        Top = 31
        Width = 77
        Height = 13
        Caption = 'Valor da nota'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Panel4: TPanel
        Left = 66
        Top = 83
        Width = 344
        Height = 24
        BevelOuter = bvNone
        Enabled = False
        TabOrder = 0
        object ed_descricao_cfop_entradas: TDBEdit
          Left = 3
          Top = 2
          Width = 340
          Height = 21
          Color = clBlack
          DataField = 'DESC_CFOP'
          DataSource = dm.dsQryNotasConsumidor
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clYellow
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 0
        end
      end
      object Panel21: TPanel
        Left = 96
        Top = 114
        Width = 255
        Height = 37
        BevelOuter = bvNone
        Enabled = False
        TabOrder = 1
        object Label39: TLabel
          Left = 1
          Top = 0
          Width = 234
          Height = 13
          Caption = 'Descri'#231#227'o das sit. tribut'#225'ria nas entradas'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object ed_descricao_cst: TDBEdit
          Left = 1
          Top = 14
          Width = 255
          Height = 21
          CharCase = ecUpperCase
          Color = clBlack
          DataField = 'DESC_CST'
          DataSource = dm.dsQryNotasConsumidor
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
      object ckbCancelada: TCheckBox
        Left = 6
        Top = 7
        Width = 93
        Height = 17
        Caption = 'Cancelada'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 2
        OnKeyDown = Edit1KeyDown
      end
      object edNumeroNotaFiscal: TDBEdit
        Left = 4
        Top = 46
        Width = 101
        Height = 21
        DataField = 'NUMERO_NOTA'
        DataSource = dm.dsQryNotasConsumidor
        TabOrder = 3
        OnEnter = Edit1Enter
        OnExit = Edit1Exit
        OnKeyDown = Edit1KeyDown
      end
      object DBEdit2: TDBEdit
        Left = 110
        Top = 46
        Width = 42
        Height = 21
        DataField = 'SERIE'
        DataSource = dm.dsQryNotasConsumidor
        ReadOnly = True
        TabOrder = 4
        OnEnter = Edit1Enter
        OnExit = Edit1Exit
        OnKeyDown = Edit1KeyDown
      end
      object DBEdit3: TDBEdit
        Left = 158
        Top = 46
        Width = 58
        Height = 21
        DataField = 'SUB_SERIE'
        DataSource = dm.dsQryNotasConsumidor
        TabOrder = 5
        OnEnter = Edit1Enter
        OnExit = Edit1Exit
        OnKeyDown = Edit1KeyDown
      end
      object edDataEmissaoNotaFiscal: TDBDateEdit
        Left = 222
        Top = 45
        Width = 104
        Height = 21
        DataField = 'DATA_DOC'
        DataSource = dm.dsQryNotasConsumidor
        NumGlyphs = 2
        TabOrder = 6
        OnEnter = Edit1Enter
        OnExit = Edit1Exit
        OnKeyDown = Edit1KeyDown
      end
      object GroupBox1: TGroupBox
        Left = 416
        Top = 11
        Width = 146
        Height = 55
        Caption = 'Subst. de Cupom Fiscal'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 8
        object Label6: TLabel
          Left = 5
          Top = 16
          Width = 63
          Height = 13
          Caption = 'N'#186' do Cupom'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label7: TLabel
          Left = 78
          Top = 17
          Width = 35
          Height = 13
          Caption = 'N'#186' ECF'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object edNumeroCupomFiscal: TDBEdit
          Left = 4
          Top = 29
          Width = 69
          Height = 21
          DataField = 'NUMERO_CUPOM_FISCAL'
          DataSource = dm.dsQryNotasConsumidor
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
          Left = 77
          Top = 30
          Width = 40
          Height = 21
          DataField = 'NUMERO_ECF'
          DataSource = dm.dsQryNotasConsumidor
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
      object ed_cefop_entradas: TDBEdit
        Left = 6
        Top = 85
        Width = 34
        Height = 21
        DataField = 'CFOP'
        DataSource = dm.dsQryNotasConsumidor
        TabOrder = 9
        OnEnter = Edit1Enter
        OnExit = Edit1Exit
        OnKeyDown = Edit1KeyDown
      end
      object DBEdit12: TDBEdit
        Left = 356
        Top = 128
        Width = 181
        Height = 21
        DataField = 'CPF_CNPJ_ADQUIRENTE'
        DataSource = dm.dsQryNotasConsumidor
        TabOrder = 11
        OnEnter = Edit1Enter
        OnExit = Edit1Exit
        OnKeyDown = Edit1KeyDown
      end
      object ed_cst: TDBEdit
        Left = 3
        Top = 126
        Width = 64
        Height = 21
        CharCase = ecUpperCase
        DataField = 'CST_ICMS'
        DataSource = dm.dsQryNotasConsumidor
        TabOrder = 10
        OnEnter = Edit1Enter
        OnExit = Edit1Exit
        OnKeyDown = Edit1KeyDown
      end
      object edValorDoc: TDBEdit
        Left = 330
        Top = 44
        Width = 84
        Height = 21
        Color = clMoneyGreen
        DataField = 'VALOR_DOC'
        DataSource = dm.dsQryNotasConsumidor
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 7
        OnEnter = Edit1Enter
        OnExit = Edit1Exit
        OnKeyDown = Edit1KeyDown
      end
    end
  end
  inherited pn_botoes: TPanel
    Top = 191
    Width = 570
    inherited bt_novo: TBitBtn
      Width = 79
      Caption = 'Novo'
    end
    inherited bt_alterar: TBitBtn
      Left = 158
      Width = 79
      Caption = 'Alterar'
    end
    inherited bt_gravar: TBitBtn
      Left = 316
      Width = 79
      Caption = 'Gravar'
    end
    inherited bt_cancelar: TBitBtn
      Left = 395
      Width = 79
      Caption = 'Cancelar'
    end
    inherited bt_sair: TBitBtn
      Left = 474
      Width = 79
      Caption = 'S&air'
    end
    inherited bt_excluir: TBitBtn
      Left = 237
      Width = 79
      Caption = 'Excluir'
    end
    inherited bt_consultar: TBitBtn
      Left = 79
      Width = 79
      Caption = 'Consultar'
    end
    inherited bt_imprimir: TBitBtn
      Top = -48
      Visible = False
    end
  end
end
