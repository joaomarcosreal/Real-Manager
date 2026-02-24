inherited frmCadUnidades: TfrmCadUnidades
  Left = 347
  Top = 179
  Caption = 'Cadastro de unidades'
  ClientHeight = 178
  ClientWidth = 452
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited pn_principal: TPanel
    Width = 452
    Height = 136
    inherited pn_codigo: TPanel
      Width = 450
      inherited bt_pesquisa: TSpeedButton
        Left = 59
        Top = 20
      end
      inherited ed_codigo: TMaskEdit
        Width = 54
      end
    end
    object Panel1: TPanel
      Left = 1
      Top = 47
      Width = 450
      Height = 88
      Align = alClient
      TabOrder = 1
      object Label1: TLabel
        Left = 8
        Top = 8
        Width = 58
        Height = 13
        Caption = 'Descri'#231#227'o'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label2: TLabel
        Left = 229
        Top = 8
        Width = 62
        Height = 13
        Caption = 'Par'#226'metro:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label3: TLabel
        Left = 301
        Top = 8
        Width = 33
        Height = 13
        Caption = 'Sigla:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label4: TLabel
        Left = 9
        Top = 47
        Width = 75
        Height = 13
        Caption = 'Cod. Padr'#227'o:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object btPesqUnPadrao: TSpeedButton
        Left = 63
        Top = 61
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
      object edDescricaoUnidade: TDBEdit
        Left = 8
        Top = 24
        Width = 209
        Height = 21
        CharCase = ecUpperCase
        DataField = 'DESCRICAO'
        DataSource = dm.dsQryUnidades
        TabOrder = 0
        OnEnter = Edit1Enter
        OnExit = Edit1Exit
        OnKeyDown = Edit1KeyDown
      end
      object edParametro: TDBEdit
        Left = 229
        Top = 24
        Width = 65
        Height = 21
        CharCase = ecUpperCase
        DataField = 'PARAMETRO'
        DataSource = dm.dsQryUnidades
        TabOrder = 1
        OnEnter = Edit1Enter
        OnExit = Edit1Exit
        OnKeyDown = Edit1KeyDown
      end
      object edSigla: TDBEdit
        Left = 301
        Top = 24
        Width = 52
        Height = 21
        CharCase = ecUpperCase
        DataField = 'SIGLA'
        DataSource = dm.dsQryUnidades
        TabOrder = 2
        OnEnter = Edit1Enter
        OnExit = Edit1Exit
        OnKeyDown = Edit1KeyDown
      end
      object edCodUnPadrao: TDBEdit
        Left = 10
        Top = 61
        Width = 52
        Height = 21
        CharCase = ecUpperCase
        DataField = 'COD_PADRAO'
        DataSource = dm.dsQryUnidades
        TabOrder = 3
        OnEnter = Edit1Enter
        OnExit = Edit1Exit
        OnKeyDown = Edit1KeyDown
      end
      object Panel2: TPanel
        Left = 87
        Top = 48
        Width = 218
        Height = 38
        BevelOuter = bvNone
        Caption = 'Panel2'
        Enabled = False
        TabOrder = 4
        object Label5: TLabel
          Left = 5
          Top = 0
          Width = 174
          Height = 13
          Caption = 'Descri'#231#227'o da Unidade padr'#227'o:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object edDescUnPadrao: TDBEdit
          Left = 6
          Top = 13
          Width = 199
          Height = 21
          CharCase = ecUpperCase
          Color = clBlack
          DataField = 'DESCRICAOUNIDADEPADRAO'
          DataSource = dm.dsQryUnidades
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
  inherited pn_botoes: TPanel
    Top = 136
    Width = 452
    inherited bt_novo: TBitBtn
      Width = 64
    end
    inherited bt_alterar: TBitBtn
      Left = 129
      Width = 64
    end
    inherited bt_gravar: TBitBtn
      Left = 258
      Width = 64
    end
    inherited bt_cancelar: TBitBtn
      Left = 323
      Width = 64
    end
    inherited bt_sair: TBitBtn
      Left = 387
      Width = 64
    end
    inherited bt_excluir: TBitBtn
      Left = 194
      Width = 64
    end
    inherited bt_consultar: TBitBtn
      Left = 65
      Width = 64
    end
    inherited bt_imprimir: TBitBtn
      Left = 227
      Top = -53
      Visible = False
    end
  end
end
