inherited frmCadastroClientesReduzido: TfrmCadastroClientesReduzido
  Left = 214
  Top = 241
  Caption = 'Cadastro de Clientes (Reduzido)'
  ClientHeight = 224
  ClientWidth = 688
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited pn_principal: TPanel
    Width = 688
    Height = 172
    inherited pn_codigo: TPanel
      Width = 686
      inherited bt_pesquisa: TSpeedButton
        Left = 128
        Width = 20
      end
      inherited ed_codigo: TMaskEdit
        Width = 118
      end
    end
    object pn_campos: TPanel
      Left = 1
      Top = 47
      Width = 686
      Height = 124
      Align = alClient
      TabOrder = 1
      object Label1: TLabel
        Left = 8
        Top = 8
        Width = 29
        Height = 20
        Caption = 'Rg:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label2: TLabel
        Left = 224
        Top = 8
        Width = 75
        Height = 20
        Caption = 'Dt. Nasc.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label3: TLabel
        Left = 360
        Top = 8
        Width = 133
        Height = 20
        Caption = 'Nome Completo:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label5: TLabel
        Left = 8
        Top = 64
        Width = 76
        Height = 20
        Caption = 'Telefone:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label4: TLabel
        Left = 138
        Top = 66
        Width = 56
        Height = 20
        Caption = 'E-mail:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object edRg: TDBEdit
        Left = 8
        Top = 27
        Width = 201
        Height = 28
        CharCase = ecUpperCase
        DataField = 'RG'
        DataSource = dm.ds_clientes
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        OnEnter = Edit1Enter
        OnExit = Edit1Exit
        OnKeyDown = Edit1KeyDown
      end
      object edDtNasc: TDBEdit
        Left = 224
        Top = 27
        Width = 119
        Height = 28
        CharCase = ecUpperCase
        DataField = 'DTNASCIMENTO'
        DataSource = dm.ds_clientes
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        OnEnter = Edit1Enter
        OnExit = Edit1Exit
        OnKeyDown = Edit1KeyDown
      end
      object edNome: TDBEdit
        Left = 360
        Top = 27
        Width = 321
        Height = 28
        CharCase = ecUpperCase
        DataField = 'RAZAO_SOCIAL'
        DataSource = dm.ds_clientes
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 2
        OnEnter = Edit1Enter
        OnExit = Edit1Exit
        OnKeyDown = Edit1KeyDown
      end
      object edTelefone: TDBEdit
        Left = 8
        Top = 88
        Width = 121
        Height = 28
        CharCase = ecUpperCase
        DataField = 'TELEFONE'
        DataSource = dm.ds_clientes
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 3
        OnEnter = Edit1Enter
        OnExit = Edit1Exit
        OnKeyDown = Edit1KeyDown
      end
      object edEmail: TDBEdit
        Left = 137
        Top = 88
        Width = 320
        Height = 28
        CharCase = ecUpperCase
        DataField = 'EMAIL'
        DataSource = dm.ds_clientes
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 4
        OnEnter = Edit1Enter
        OnExit = Edit1Exit
        OnKeyDown = Edit1KeyDown
      end
    end
  end
  inherited pn_botoes: TPanel
    Top = 172
    Width = 688
    Height = 52
    inherited bt_novo: TBitBtn
      Width = 137
      Height = 50
    end
    inherited bt_alterar: TBitBtn
      Left = 197
      Top = -70
      Width = 98
      Height = 50
      Visible = False
    end
    inherited bt_gravar: TBitBtn
      Left = 275
      Width = 137
      Height = 50
    end
    inherited bt_cancelar: TBitBtn
      Left = 412
      Width = 137
      Height = 50
    end
    inherited bt_sair: TBitBtn
      Left = 549
      Width = 137
      Height = 50
    end
    inherited bt_excluir: TBitBtn
      Left = 295
      Top = -68
      Width = 98
      Height = 50
      Visible = False
    end
    inherited bt_consultar: TBitBtn
      Left = 138
      Top = 1
      Width = 137
      Height = 50
    end
    inherited bt_imprimir: TBitBtn
      Top = -88
      Visible = False
    end
  end
end
