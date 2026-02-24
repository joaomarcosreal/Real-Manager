inherited frmCadClientesDelivery: TfrmCadClientesDelivery
  Left = 412
  Top = 305
  Caption = 'Cadastro de Clientes - Delivery'
  ClientHeight = 310
  ClientWidth = 661
  OldCreateOrder = True
  OnClose = FormClose
  ExplicitWidth = 669
  ExplicitHeight = 337
  PixelsPerInch = 96
  TextHeight = 13
  inherited pn_principal: TPanel
    Width = 661
    Height = 268
    ExplicitWidth = 661
    ExplicitHeight = 268
    object Label1: TLabel [0]
      Left = 8
      Top = 64
      Width = 55
      Height = 13
      Caption = 'Telefone:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label2: TLabel [1]
      Left = 215
      Top = 64
      Width = 37
      Height = 13
      Caption = 'Nome:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label4: TLabel [2]
      Left = 8
      Top = 142
      Width = 59
      Height = 13
      Caption = 'Endere'#231'o:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label5: TLabel [3]
      Left = 8
      Top = 182
      Width = 80
      Height = 13
      Caption = 'Complemento:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label6: TLabel [4]
      Left = 8
      Top = 222
      Width = 86
      Height = 13
      Caption = 'Refer'#234'ncia (1):'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label7: TLabel [5]
      Left = 304
      Top = 222
      Width = 86
      Height = 13
      Caption = 'Refer'#234'ncia (2):'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label8: TLabel [6]
      Left = 604
      Top = 64
      Width = 29
      Height = 13
      Caption = 'Sexo'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label10: TLabel [7]
      Left = 320
      Top = 182
      Width = 61
      Height = 13
      Caption = 'Freq.(dias)'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label48: TLabel [8]
      Left = 394
      Top = 184
      Width = 64
      Height = 13
      Caption = 'Cod. Bairro'
      FocusControl = bt_alterar
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object bt_pesq_bairro: TSpeedButton [9]
      Left = 443
      Top = 198
      Width = 19
      Height = 21
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
    object Label11: TLabel [10]
      Left = 9
      Top = 102
      Width = 71
      Height = 13
      Caption = 'Nascimento:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label12: TLabel [11]
      Left = 113
      Top = 102
      Width = 39
      Height = 13
      Caption = 'E-mail:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label13: TLabel [12]
      Left = 114
      Top = 64
      Width = 44
      Height = 13
      Caption = 'Celular:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    inherited pn_codigo: TPanel
      Width = 659
      ExplicitWidth = 659
      inherited bt_pesquisa: TSpeedButton
        Left = 94
        ExplicitLeft = 94
      end
      object Label9: TLabel [1]
        Left = 4
        Top = 9
        Width = 74
        Height = 13
        Caption = 'C'#243'd. Cliente:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      inherited ed_codigo: TMaskEdit
        Width = 86
        ExplicitWidth = 86
      end
      object cxDBDateEdit1: TcxDBDateEdit
        Left = 520
        Top = 48
        TabOrder = 1
        Width = 121
      end
    end
    object cmbSexo: TcxDBComboBox
      Left = 604
      Top = 80
      DataBinding.DataField = 'SEXO'
      DataBinding.DataSource = dm.dsQryClientesDelivery
      Properties.Items.Strings = (
        'M'
        'F')
      TabOrder = 4
      OnEnter = Edit1Enter
      OnExit = Edit1Exit
      OnKeyDown = Edit1KeyDown
      Width = 49
    end
    object edTelefone: TDBEdit
      Left = 8
      Top = 80
      Width = 97
      Height = 21
      DataField = 'TELEFONE'
      DataSource = dm.dsQryClientesDelivery
      TabOrder = 1
      OnEnter = Edit1Enter
      OnExit = Edit1Exit
      OnKeyDown = Edit1KeyDown
    end
    object edNome: TDBEdit
      Left = 215
      Top = 80
      Width = 378
      Height = 21
      CharCase = ecUpperCase
      DataField = 'NOME'
      DataSource = dm.dsQryClientesDelivery
      TabOrder = 3
      OnEnter = Edit1Enter
      OnExit = Edit1Exit
      OnKeyDown = Edit1KeyDown
    end
    object edEndereco: TDBEdit
      Left = 8
      Top = 158
      Width = 425
      Height = 21
      CharCase = ecUpperCase
      DataField = 'ENDERECO'
      DataSource = dm.dsQryClientesDelivery
      TabOrder = 7
      OnEnter = Edit1Enter
      OnExit = Edit1Exit
      OnKeyDown = Edit1KeyDown
    end
    object edComplemento: TDBEdit
      Left = 8
      Top = 198
      Width = 305
      Height = 21
      CharCase = ecUpperCase
      DataField = 'COMPLEMENTO'
      DataSource = dm.dsQryClientesDelivery
      TabOrder = 8
      OnEnter = Edit1Enter
      OnExit = Edit1Exit
      OnKeyDown = Edit1KeyDown
    end
    object edReferencia1: TDBEdit
      Left = 8
      Top = 238
      Width = 305
      Height = 21
      CharCase = ecUpperCase
      DataField = 'REFERENCIA1'
      DataSource = dm.dsQryClientesDelivery
      TabOrder = 11
      OnEnter = Edit1Enter
      OnExit = Edit1Exit
      OnKeyDown = Edit1KeyDown
    end
    object edReferencia2: TDBEdit
      Left = 315
      Top = 238
      Width = 286
      Height = 21
      CharCase = ecUpperCase
      DataField = 'REFERENCIA2'
      DataSource = dm.dsQryClientesDelivery
      TabOrder = 12
      OnEnter = Edit1Enter
      OnExit = Edit1Exit
      OnKeyDown = Edit1KeyDown
    end
    object edFreqCompra: TDBEdit
      Left = 320
      Top = 198
      Width = 65
      Height = 21
      CharCase = ecUpperCase
      DataField = 'FREQ_COMPRA'
      DataSource = dm.dsQryClientesDelivery
      TabOrder = 9
      OnEnter = Edit1Enter
      OnExit = Edit1Exit
      OnKeyDown = Edit1KeyDown
    end
    object Panel3: TPanel
      Left = 462
      Top = 181
      Width = 183
      Height = 41
      BevelOuter = bvNone
      Enabled = False
      TabOrder = 13
      object Label3: TLabel
        Left = 2
        Top = 3
        Width = 88
        Height = 13
        Caption = 'Nome do Bairro'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object edDescBairro: TDBEdit
        Left = 3
        Top = 19
        Width = 177
        Height = 21
        CharCase = ecUpperCase
        Color = clBlack
        DataField = 'DESCRICAOBAIRRO'
        DataSource = dm.dsQryClientesDelivery
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clYellow
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        MaxLength = 3
        ParentFont = False
        TabOrder = 0
        OnEnter = Edit1Exit
        OnExit = Edit1Exit
        OnKeyDown = Edit1KeyDown
      end
    end
    object edCodBairro: TDBEdit
      Left = 394
      Top = 198
      Width = 45
      Height = 21
      CharCase = ecUpperCase
      DataField = 'COD_BAIRRO'
      DataSource = dm.dsQryClientesDelivery
      MaxLength = 3
      TabOrder = 10
      OnEnter = Edit1Enter
      OnExit = Edit1Exit
      OnKeyDown = Edit1KeyDown
    end
    object edEmail: TDBEdit
      Left = 113
      Top = 118
      Width = 328
      Height = 21
      DataField = 'EMAIL'
      DataSource = dm.dsQryClientesDelivery
      TabOrder = 6
      OnEnter = Edit1Enter
      OnExit = Edit1Exit
      OnKeyDown = Edit1KeyDown
    end
    object edDtNascimento: TDBDateEdit
      Left = 10
      Top = 117
      Width = 93
      Height = 21
      DataField = 'DT_NASCIMENTO'
      DataSource = dm.dsQryClientesDelivery
      NumGlyphs = 2
      TabOrder = 5
      OnEnter = Edit1Enter
      OnExit = Edit1Exit
      OnKeyDown = Edit1KeyDown
    end
    object DBEdit1: TDBEdit
      Left = 111
      Top = 79
      Width = 96
      Height = 21
      DataField = 'CELULAR'
      DataSource = dm.dsQryClientesDelivery
      TabOrder = 2
      OnEnter = Edit1Enter
      OnExit = Edit1Exit
      OnKeyDown = Edit1KeyDown
    end
  end
  inherited pn_botoes: TPanel
    Top = 268
    Width = 661
    ExplicitTop = 268
    ExplicitWidth = 661
    inherited bt_novo: TBitBtn
      Top = 3
      Width = 94
      ExplicitTop = 3
      ExplicitWidth = 94
    end
    inherited bt_alterar: TBitBtn
      Left = 188
      Top = 3
      Width = 94
      ExplicitLeft = 188
      ExplicitTop = 3
      ExplicitWidth = 94
    end
    inherited bt_gravar: TBitBtn
      Left = 376
      Top = 3
      Width = 94
      ExplicitLeft = 376
      ExplicitTop = 3
      ExplicitWidth = 94
    end
    inherited bt_cancelar: TBitBtn
      Left = 469
      Top = 3
      Width = 94
      ExplicitLeft = 469
      ExplicitTop = 3
      ExplicitWidth = 94
    end
    inherited bt_sair: TBitBtn
      Left = 564
      Top = 3
      Width = 94
      ExplicitLeft = 564
      ExplicitTop = 3
      ExplicitWidth = 94
    end
    inherited bt_excluir: TBitBtn
      Left = 282
      Top = 3
      Width = 94
      ExplicitLeft = 282
      ExplicitTop = 3
      ExplicitWidth = 94
    end
    inherited bt_consultar: TBitBtn
      Left = 94
      Top = 3
      Width = 94
      ExplicitLeft = 94
      ExplicitTop = 3
      ExplicitWidth = 94
    end
    inherited bt_imprimir: TBitBtn
      Left = 482
      Top = -49
      Width = 80
      ExplicitLeft = 482
      ExplicitTop = -49
      ExplicitWidth = 80
    end
  end
end
