inherited frmCadCidade: TfrmCadCidade
  Left = 278
  Top = 269
  Caption = 'Cadastro de Cidades'
  ClientHeight = 157
  ClientWidth = 429
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited pn_principal: TPanel
    Width = 429
    Height = 115
    inherited pn_codigo: TPanel
      Width = 427
      inherited bt_pesquisa: TSpeedButton
        Left = 100
        Top = 13
        Width = 34
        Height = 28
      end
      inherited ed_codigo: TMaskEdit
        Top = 13
        Width = 94
        Height = 28
        Font.Height = -16
        MaxLength = 7
        ParentFont = False
      end
    end
    object Panel1: TPanel
      Left = 1
      Top = 47
      Width = 427
      Height = 67
      Align = alClient
      TabOrder = 1
      object Label1: TLabel
        Left = 8
        Top = 10
        Width = 135
        Height = 20
        Caption = 'Nome da cidade:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object edDescricaoCidade: TDBEdit
        Left = 8
        Top = 28
        Width = 401
        Height = 28
        CharCase = ecUpperCase
        DataField = 'NOME'
        DataSource = dm.dsQryCidade
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
      object Panel13: TPanel
        Tag = 99
        Left = 74
        Top = 70
        Width = 214
        Height = 30
        BevelOuter = bvNone
        Enabled = False
        TabOrder = 1
      end
    end
  end
  inherited pn_botoes: TPanel
    Top = 115
    Width = 429
    inherited bt_novo: TBitBtn
      Width = 85
      Caption = 'Novo '
    end
    inherited bt_alterar: TBitBtn
      Left = 86
      Width = 85
    end
    inherited bt_gravar: TBitBtn
      Left = 171
      Width = 85
    end
    inherited bt_cancelar: TBitBtn
      Left = 256
      Width = 85
      Caption = 'Cancelar'
    end
    inherited bt_sair: TBitBtn
      Left = 342
      Width = 85
    end
    inherited bt_excluir: TBitBtn
      Top = -69
      Visible = False
    end
    inherited bt_consultar: TBitBtn
      Top = -69
      Visible = False
    end
    inherited bt_imprimir: TBitBtn
      Top = -68
      Visible = False
    end
  end
end
