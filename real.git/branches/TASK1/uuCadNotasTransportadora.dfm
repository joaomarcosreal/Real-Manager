inherited frmCadNotasTransporte: TfrmCadNotasTransporte
  Left = 77
  Top = 138
  Caption = 'Cadastro de Notas de Servi'#231'o de Transporte '
  ClientHeight = 390
  ClientWidth = 744
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited pn_principal: TPanel
    Width = 744
    Height = 349
    ExplicitWidth = 744
    ExplicitHeight = 349
    inherited pn_codigo: TPanel
      Width = 742
      ExplicitWidth = 742
      inherited bt_pesquisa: TSpeedButton
        Left = 67
        Top = 21
        Width = 24
        Height = 21
        ExplicitLeft = 67
        ExplicitTop = 21
        ExplicitWidth = 24
        ExplicitHeight = 21
      end
      inherited ed_codigo: TMaskEdit
        Width = 62
        ExplicitWidth = 62
      end
    end
    object Panel1: TPanel
      Left = 1
      Top = 47
      Width = 742
      Height = 301
      Align = alClient
      TabOrder = 1
      object gpFornecedor: TGroupBox
        Left = 2
        Top = 55
        Width = 734
        Height = 56
        Caption = 'Dados da Transportadora'
        TabOrder = 2
        object Label2: TLabel
          Left = 3
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
          Left = 535
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
        object ed_cod_fornecedor: TDBEdit
          Left = 4
          Top = 27
          Width = 63
          Height = 21
          DataField = 'COD_FORNECEDOR'
          DataSource = dm.dsQryNotasTransporte
          TabOrder = 0
          OnEnter = Edit1Enter
          OnExit = Edit1Exit
          OnKeyDown = Edit1KeyDown
        end
        object Panel3: TPanel
          Left = 96
          Top = 24
          Width = 428
          Height = 24
          BevelOuter = bvNone
          Enabled = False
          TabOrder = 1
          object ed_razao_social_fornecedor: TDBEdit
            Left = 3
            Top = 4
            Width = 421
            Height = 21
            Color = clBlack
            DataField = 'RAZAO_SOCIAL'
            DataSource = dm.dsQryNotasTransporte
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
          Left = 531
          Top = 24
          Width = 195
          Height = 24
          BevelOuter = bvNone
          Enabled = False
          TabOrder = 2
          object ed_cnpj_fornecedor: TDBEdit
            Left = 3
            Top = 5
            Width = 187
            Height = 21
            Color = clBlack
            DataField = 'CGC_CPF'
            DataSource = dm.dsQryNotasTransporte
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
      object gpDadosNota: TGroupBox
        Left = 2
        Top = 112
        Width = 737
        Height = 130
        Caption = 'Dados da Nota '
        TabOrder = 3
        object Label5: TLabel
          Left = 5
          Top = 47
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
        object Label40: TLabel
          Left = 392
          Top = 48
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
          Left = 458
          Top = 64
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
          OnClick = botao_pesquisaClick
        end
        object bt_pesq_cfop: TSpeedButton
          Left = 44
          Top = 98
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
          OnClick = botao_pesquisaClick
        end
        object Label41: TLabel
          Left = 6
          Top = 85
          Width = 37
          Height = 13
          Caption = 'CFOP:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label18: TLabel
          Left = 84
          Top = 47
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
        object btPesqSituacaoDocFiscal: TSpeedButton
          Left = 52
          Top = 57
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
          Left = 9
          Top = 12
          Width = 68
          Height = 13
          Caption = 'N'#186' da Nota:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label6: TLabel
          Left = 97
          Top = 12
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
        object Label7: TLabel
          Left = 148
          Top = 12
          Width = 57
          Height = 14
          Caption = 'Sub-s'#233'rie:'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label8: TLabel
          Left = 211
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
        object Label30: TLabel
          Left = 302
          Top = 13
          Width = 81
          Height = 14
          Caption = 'Data Presta'#231#227'o'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Panel2: TPanel
          Left = 449
          Top = 24
          Width = 285
          Height = 24
          BevelOuter = bvNone
          Enabled = False
          TabOrder = 0
        end
        object Panel21: TPanel
          Left = 484
          Top = 49
          Width = 248
          Height = 37
          BevelOuter = bvNone
          Enabled = False
          TabOrder = 1
          object Label39: TLabel
            Left = 1
            Top = 0
            Width = 160
            Height = 13
            Caption = 'Descri'#231#227'o da Situa'#231#227'o Trib.'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object ed_descricao_cst: TDBEdit
            Left = 1
            Top = 15
            Width = 244
            Height = 21
            CharCase = ecUpperCase
            Color = clBlack
            DataField = 'DESC_CST'
            DataSource = dm.dsQryNotasTransporte
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
        object Panel22: TPanel
          Left = 72
          Top = 85
          Width = 305
          Height = 36
          BevelOuter = bvNone
          Enabled = False
          TabOrder = 2
          object Label42: TLabel
            Left = 1
            Top = 0
            Width = 94
            Height = 13
            Caption = 'Descri'#231#227'o CFOP'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object ed_descricao_cfop: TDBEdit
            Left = 1
            Top = 14
            Width = 304
            Height = 21
            CharCase = ecUpperCase
            Color = clBlack
            DataField = 'DESC_CFOP'
            DataSource = dm.dsQryNotasTransporte
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
        object Panel4: TPanel
          Left = 80
          Top = 59
          Width = 307
          Height = 24
          BevelOuter = bvNone
          Enabled = False
          TabOrder = 3
          object edDescSituacaoDocFiscal: TDBEdit
            Left = 3
            Top = 2
            Width = 296
            Height = 21
            Color = clBlack
            DataField = 'DESC_SITUACAO'
            DataSource = dm.dsQryNotasTransporte
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clYellow
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 0
          end
        end
        object edNumeroNotaFiscal: TDBEdit
          Left = 8
          Top = 25
          Width = 85
          Height = 21
          DataField = 'NUMERO_NOTA'
          DataSource = dm.dsQryNotasTransporte
          TabOrder = 4
          OnEnter = Edit1Enter
          OnExit = Edit1Exit
          OnKeyDown = Edit1KeyDown
        end
        object DBEdit2: TDBEdit
          Left = 98
          Top = 25
          Width = 46
          Height = 21
          DataField = 'SERIE'
          DataSource = dm.dsQryNotasTransporte
          TabOrder = 5
          OnEnter = Edit1Enter
          OnExit = Edit1Exit
          OnKeyDown = Edit1KeyDown
        end
        object DBEdit3: TDBEdit
          Left = 150
          Top = 25
          Width = 56
          Height = 21
          DataField = 'SUB_SERIE'
          DataSource = dm.dsQryNotasTransporte
          TabOrder = 6
          OnEnter = Edit1Enter
          OnExit = Edit1Exit
          OnKeyDown = Edit1KeyDown
        end
        object edDataEmissaoNotaFiscal: TDBDateEdit
          Left = 210
          Top = 26
          Width = 89
          Height = 21
          DataField = 'DATA_EMISSAO'
          DataSource = dm.dsQryNotasTransporte
          NumGlyphs = 2
          TabOrder = 7
          OnEnter = Edit1Enter
          OnExit = Edit1Exit
          OnKeyDown = Edit1KeyDown
        end
        object edDataEntradaNotaFiscal: TDBDateEdit
          Left = 300
          Top = 26
          Width = 88
          Height = 21
          DataField = 'DATA_SERVICO'
          DataSource = dm.dsQryNotasTransporte
          NumGlyphs = 2
          TabOrder = 8
          OnEnter = Edit1Enter
          OnExit = Edit1Exit
          OnKeyDown = Edit1KeyDown
        end
        object edCodSituacaoDocFiscal: TDBEdit
          Left = 5
          Top = 59
          Width = 42
          Height = 21
          DataField = 'SITUACAO'
          DataSource = dm.dsQryNotasTransporte
          TabOrder = 9
          OnEnter = Edit1Enter
          OnExit = Edit1Exit
          OnKeyDown = Edit1KeyDown
        end
        object ed_cst: TDBEdit
          Left = 391
          Top = 62
          Width = 64
          Height = 21
          CharCase = ecUpperCase
          DataField = 'CST_ICMS'
          DataSource = dm.dsQryNotasTransporte
          TabOrder = 10
          OnEnter = Edit1Enter
          OnExit = Edit1Exit
          OnKeyDown = Edit1KeyDown
        end
        object ed_cfop: TDBEdit
          Left = 5
          Top = 99
          Width = 37
          Height = 21
          CharCase = ecUpperCase
          DataField = 'CFOP'
          DataSource = dm.dsQryNotasTransporte
          TabOrder = 11
          OnEnter = Edit1Enter
          OnExit = Edit1Exit
          OnKeyDown = Edit1KeyDown
        end
        object rdTipoFrete: TRadioGroup
          Left = 384
          Top = 88
          Width = 345
          Height = 35
          Caption = 'Pagameto do Frete'
          Columns = 4
          ItemIndex = 3
          Items.Strings = (
            'Terceiros'
            'Emitente'
            'Destinat'#225'rio'
            'Sem Frete')
          TabOrder = 12
        end
      end
      object rdTipoDOC: TRadioGroup
        Left = 3
        Top = 3
        Width = 192
        Height = 52
        Caption = 'Tipo do documento:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ItemIndex = 0
        Items.Strings = (
          'Documento em papel'
          'Documento Eletr'#244'nico (CTE)')
        ParentFont = False
        TabOrder = 0
      end
      object pnDCTe: TPanel
        Left = 195
        Top = 5
        Width = 537
        Height = 51
        BevelOuter = bvNone
        Caption = 'pnDCTe'
        TabOrder = 1
        object GroupBox3: TGroupBox
          Left = 1
          Top = -1
          Width = 331
          Height = 52
          Caption = 'Chave do DCTE'
          TabOrder = 0
          object edChaveCTE: TDBEdit
            Left = 7
            Top = 25
            Width = 315
            Height = 21
            DataField = 'CHAVE_CTE'
            DataSource = dm.dsQryNotasTransporte
            TabOrder = 0
            OnEnter = Edit1Enter
            OnExit = Edit1Exit
            OnKeyDown = Edit1KeyDown
          end
        end
        object rdTipoDCTE: TRadioGroup
          Left = 332
          Top = -1
          Width = 206
          Height = 52
          Caption = 'Tipo do DCTE'
          Columns = 2
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ItemIndex = 0
          Items.Strings = (
            '0 - Normal'
            '1 - Complemento '
            '2 - Anula'#231#227'o'
            '3 - Substituto')
          ParentFont = False
          TabOrder = 1
        end
      end
      object GroupBox1: TGroupBox
        Left = 2
        Top = 242
        Width = 736
        Height = 54
        Caption = 'Valores do documento fiscal'
        TabOrder = 4
        object Label11: TLabel
          Left = 3
          Top = 16
          Width = 77
          Height = 13
          Caption = 'Valor Servi'#231'o'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label16: TLabel
          Left = 84
          Top = 16
          Width = 59
          Height = 13
          Caption = 'Desconto:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label12: TLabel
          Left = 166
          Top = 16
          Width = 67
          Height = 13
          Caption = 'Base ICMS:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label15: TLabel
          Left = 274
          Top = 16
          Width = 60
          Height = 13
          Caption = 'Red. Base'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label13: TLabel
          Left = 367
          Top = 16
          Width = 49
          Height = 13
          Caption = 'Al'#237'quota'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label14: TLabel
          Left = 421
          Top = 16
          Width = 64
          Height = 13
          Caption = 'Valor ICMS'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label17: TLabel
          Left = 518
          Top = 16
          Width = 78
          Height = 13
          Caption = 'N'#227'o tributado'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label4: TLabel
          Left = 617
          Top = 14
          Width = 118
          Height = 13
          Caption = 'Total do documento:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object DBEdit7: TDBEdit
          Left = 3
          Top = 29
          Width = 76
          Height = 21
          Color = clMoneyGreen
          DataField = 'VALOR_SERVICO'
          DataSource = dm.dsQryNotasTransporte
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
        object DBEdit4: TDBEdit
          Left = 84
          Top = 29
          Width = 76
          Height = 21
          Color = clMoneyGreen
          DataField = 'DESCONTO'
          DataSource = dm.dsQryNotasTransporte
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
        object DBEdit5: TDBEdit
          Left = 165
          Top = 29
          Width = 105
          Height = 21
          Color = clMoneyGreen
          DataField = 'BASE_ICMS'
          DataSource = dm.dsQryNotasTransporte
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 2
          OnEnter = Edit1Enter
          OnExit = Edit1Exit
          OnKeyDown = Edit1KeyDown
        end
        object DBEdit6: TDBEdit
          Left = 274
          Top = 29
          Width = 91
          Height = 21
          Color = clMoneyGreen
          DataField = 'REDUCAO_BASE_ICMS'
          DataSource = dm.dsQryNotasTransporte
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 3
          OnEnter = Edit1Enter
          OnExit = Edit1Exit
          OnKeyDown = Edit1KeyDown
        end
        object edAliquotaICMS: TDBEdit
          Left = 367
          Top = 29
          Width = 50
          Height = 21
          Color = clMoneyGreen
          DataField = 'ALIQ_ICMS'
          DataSource = dm.dsQryNotasTransporte
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 4
          OnEnter = Edit1Enter
          OnExit = Edit1Exit
          OnKeyDown = Edit1KeyDown
        end
        object DBEdit10: TDBEdit
          Left = 420
          Top = 29
          Width = 94
          Height = 21
          Color = clMoneyGreen
          DataField = 'VALOR_ICMS'
          DataSource = dm.dsQryNotasTransporte
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 5
          OnEnter = Edit1Enter
          OnExit = Edit1Exit
          OnKeyDown = Edit1KeyDown
        end
        object DBEdit8: TDBEdit
          Left = 520
          Top = 29
          Width = 95
          Height = 21
          Color = clMoneyGreen
          DataField = 'VALOR_NAO_TRIBUTADO'
          DataSource = dm.dsQryNotasTransporte
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 6
          OnEnter = Edit1Enter
          OnExit = Edit1Exit
          OnKeyDown = Edit1KeyDown
        end
        object edValorMercadorias: TDBEdit
          Left = 623
          Top = 29
          Width = 110
          Height = 21
          Color = clMoneyGreen
          DataField = 'VALOR_DOC'
          DataSource = dm.dsQryNotasTransporte
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
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
  end
  inherited pn_botoes: TPanel
    Top = 349
    Width = 744
    Height = 41
    ExplicitTop = 349
    ExplicitWidth = 744
    ExplicitHeight = 41
    inherited bt_novo: TBitBtn
      Width = 93
      Caption = 'Novo'
      ExplicitWidth = 93
    end
    inherited bt_alterar: TBitBtn
      Left = 196
      Width = 97
      Caption = 'Alterar'
      ExplicitLeft = 196
      ExplicitWidth = 97
    end
    inherited bt_gravar: TBitBtn
      Left = 391
      Top = 1
      Width = 97
      Caption = 'Gravar'
      ExplicitLeft = 391
      ExplicitTop = 1
      ExplicitWidth = 97
    end
    inherited bt_cancelar: TBitBtn
      Left = 488
      Width = 97
      Caption = 'Cancelar'
      ExplicitLeft = 488
      ExplicitWidth = 97
    end
    inherited bt_sair: TBitBtn
      Left = 585
      Width = 97
      Caption = 'S&air'
      ExplicitLeft = 585
      ExplicitWidth = 97
    end
    inherited bt_excluir: TBitBtn
      Left = 293
      Width = 97
      Caption = 'Excluir'
      ExplicitLeft = 293
      ExplicitWidth = 97
    end
    inherited bt_consultar: TBitBtn
      Left = 96
      Width = 99
      Caption = 'Consultar'
      ExplicitLeft = 96
      ExplicitWidth = 99
    end
    inherited bt_imprimir: TBitBtn
      Left = 427
      Top = -32
      Height = 16
      Visible = False
      ExplicitLeft = 427
      ExplicitTop = -32
      ExplicitHeight = 16
    end
  end
end
