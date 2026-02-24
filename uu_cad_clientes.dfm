inherited frm_cad_clientes: Tfrm_cad_clientes
  Left = 223
  Top = 113
  Caption = 'Clientes'
  ClientHeight = 372
  ClientWidth = 693
  ExplicitWidth = 709
  ExplicitHeight = 411
  TextHeight = 13
  inherited pn_principal: TPanel
    Width = 693
    Height = 318
    ExplicitWidth = 697
    ExplicitHeight = 263
    inherited pn_codigo: TPanel
      Width = 695
      ExplicitWidth = 695
      inherited bt_pesquisa: TSpeedButton
        Top = 21
        Height = 20
        ExplicitTop = 21
        ExplicitHeight = 20
      end
    end
    object pn_campos: TPanel
      Left = 1
      Top = 47
      Width = 695
      Height = 271
      Align = alClient
      Enabled = False
      TabOrder = 1
      ExplicitHeight = 215
      object lb_razao: TLabel
        Left = 6
        Top = 5
        Width = 114
        Height = 13
        Caption = 'Nome/Raz'#227'o Social'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label3: TLabel
        Left = 8
        Top = 44
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
      object Label4: TLabel
        Left = 287
        Top = 44
        Width = 38
        Height = 13
        Caption = 'Bairro:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label7: TLabel
        Left = 498
        Top = 43
        Width = 27
        Height = 13
        Caption = 'Cep:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label8: TLabel
        Left = 5
        Top = 81
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
      object Label9: TLabel
        Left = 140
        Top = 82
        Width = 25
        Height = 13
        Caption = 'Fax:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label10: TLabel
        Left = 270
        Top = 83
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
      object Label13: TLabel
        Left = 291
        Top = 120
        Width = 75
        Height = 13
        BiDiMode = bdRightToLeft
        Caption = 'Observa'#231#245'es'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentBiDiMode = False
        ParentFont = False
      end
      object Label17: TLabel
        Left = 4
        Top = 123
        Width = 91
        Height = 13
        Caption = 'Valor de cr'#233'dito'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label1: TLabel
        Left = 111
        Top = 123
        Width = 68
        Height = 13
        Caption = 'Prazo (dias)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object ed_endereco: TDBEdit
        Left = 6
        Top = 58
        Width = 274
        Height = 21
        CharCase = ecUpperCase
        DataField = 'ENDERECO'
        DataSource = dm.ds_clientes
        TabOrder = 2
        OnKeyDown = Edit1KeyDown
      end
      object ed_bairro: TDBEdit
        Left = 286
        Top = 58
        Width = 202
        Height = 21
        CharCase = ecUpperCase
        DataField = 'BAIRRO'
        DataSource = dm.ds_clientes
        TabOrder = 3
        OnKeyDown = Edit1KeyDown
      end
      object ed_cep: TDBEdit
        Left = 498
        Top = 58
        Width = 95
        Height = 21
        CharCase = ecUpperCase
        DataField = 'CEP'
        DataSource = dm.ds_clientes
        TabOrder = 4
        OnKeyDown = Edit1KeyDown
      end
      object ed_telefone: TDBEdit
        Left = 5
        Top = 96
        Width = 127
        Height = 21
        CharCase = ecUpperCase
        DataField = 'TELEFONE'
        DataSource = dm.ds_clientes
        TabOrder = 5
        OnKeyDown = Edit1KeyDown
      end
      object ed_fax: TDBEdit
        Left = 139
        Top = 97
        Width = 127
        Height = 21
        CharCase = ecUpperCase
        DataField = 'FAX'
        DataSource = dm.ds_clientes
        TabOrder = 6
        OnKeyDown = Edit1KeyDown
      end
      object ed_email: TDBEdit
        Left = 270
        Top = 98
        Width = 218
        Height = 21
        CharCase = ecLowerCase
        DataField = 'EMAIL'
        DataSource = dm.ds_clientes
        TabOrder = 7
        OnKeyDown = Edit1KeyDown
      end
      object ckb_situacao: TDBCheckBox
        Left = 2
        Top = 168
        Width = 65
        Height = 17
        Caption = 'Ativo'
        DataField = 'SITUACAO'
        DataSource = dm.ds_clientes
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 8
        ValueChecked = '1'
        ValueUnchecked = '0'
      end
      object DBMemo1: TDBMemo
        Left = 287
        Top = 137
        Width = 397
        Height = 73
        DataField = 'OBSERVACAO'
        DataSource = dm.ds_clientes
        TabOrder = 9
        OnKeyDown = Edit1KeyDown
      end
      object ed_razao_social: TDBEdit
        Left = 5
        Top = 19
        Width = 249
        Height = 21
        CharCase = ecUpperCase
        DataField = 'RAZAO_SOCIAL'
        DataSource = dm.ds_clientes
        TabOrder = 0
        OnKeyDown = Edit1KeyDown
      end
      object GroupBox1: TGroupBox
        Left = 259
        Top = 3
        Width = 321
        Height = 40
        Caption = 'Documento'
        TabOrder = 1
        object ckCNPJ: TRadioButton
          Left = 44
          Top = 16
          Width = 51
          Height = 17
          Caption = 'CNPJ'
          TabOrder = 0
          OnClick = ckCNPJClick
          OnKeyDown = Edit1KeyDown
        end
        object ckCPF: TRadioButton
          Left = 2
          Top = 17
          Width = 42
          Height = 17
          Caption = 'CPF'
          Checked = True
          TabOrder = 1
          TabStop = True
          OnClick = ckCPFClick
          OnKeyDown = Edit1KeyDown
        end
        object ed_cnpj: TDBEdit
          Left = 100
          Top = 13
          Width = 218
          Height = 21
          DataField = 'CGC_CPF'
          DataSource = dm.ds_clientes
          MaxLength = 18
          TabOrder = 2
          OnKeyDown = Edit1KeyDown
        end
      end
      object DBEdit1: TDBEdit
        Left = 4
        Top = 138
        Width = 101
        Height = 21
        CharCase = ecLowerCase
        DataField = 'CREDITO'
        DataSource = dm.ds_clientes
        TabOrder = 10
        OnKeyDown = Edit1KeyDown
      end
      object DBEdit2: TDBEdit
        Left = 111
        Top = 137
        Width = 66
        Height = 21
        CharCase = ecLowerCase
        DataField = 'PRAZO_PAGAMENTO'
        DataSource = dm.ds_clientes
        TabOrder = 11
        OnKeyDown = Edit1KeyDown
      end
    end
  end
  inherited pn_botoes: TPanel
    Top = 318
    Width = 693
    Height = 54
    ExplicitTop = 263
    ExplicitWidth = 697
    ExplicitHeight = 54
    inherited bt_novo: TBitBtn
      Left = 0
      Top = 3
      Width = 116
      Height = 50
      ExplicitLeft = 0
      ExplicitTop = 3
      ExplicitWidth = 116
      ExplicitHeight = 50
    end
    inherited bt_alterar: TBitBtn
      Left = 233
      Top = 3
      Width = 116
      Height = 50
      ExplicitLeft = 233
      ExplicitTop = 3
      ExplicitWidth = 116
      ExplicitHeight = 50
    end
    inherited bt_gravar: TBitBtn
      Left = 349
      Top = 3
      Width = 116
      Height = 50
      ExplicitLeft = 349
      ExplicitTop = 3
      ExplicitWidth = 116
      ExplicitHeight = 50
    end
    inherited bt_cancelar: TBitBtn
      Left = 466
      Top = 3
      Width = 116
      Height = 50
      ExplicitLeft = 466
      ExplicitTop = 3
      ExplicitWidth = 116
      ExplicitHeight = 50
    end
    inherited bt_sair: TBitBtn
      Left = 583
      Top = 3
      Width = 113
      Height = 50
      ExplicitLeft = 583
      ExplicitTop = 3
      ExplicitWidth = 113
      ExplicitHeight = 50
    end
    inherited bt_excluir: TBitBtn
      Left = 298
      Top = -72
      Width = 99
      ExplicitLeft = 298
      ExplicitTop = -72
      ExplicitWidth = 99
    end
    inherited bt_consultar: TBitBtn
      Left = 116
      Top = 3
      Width = 116
      Height = 50
      ExplicitLeft = 116
      ExplicitTop = 3
      ExplicitWidth = 116
      ExplicitHeight = 50
    end
    inherited bt_imprimir: TBitBtn
      Top = -48
      Visible = False
      ExplicitTop = -48
    end
  end
end
