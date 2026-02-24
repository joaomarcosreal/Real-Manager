inherited frm_cad_grupos_fornecedores: Tfrm_cad_grupos_fornecedores
  Left = 263
  Top = 182
  Caption = 'Cadastro de Grupos de Fornecedores'
  ClientHeight = 142
  ClientWidth = 358
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited pn_principal: TPanel
    Width = 358
    Height = 100
    inherited pn_codigo: TPanel
      Width = 356
      inherited bt_pesquisa: TSpeedButton
        Left = 51
        Top = 20
      end
      inherited ed_codigo: TMaskEdit
        Width = 46
      end
    end
    object pn_descricao: TPanel
      Left = 1
      Top = 47
      Width = 356
      Height = 52
      HelpType = htKeyword
      Align = alClient
      Enabled = False
      TabOrder = 1
      object Label1: TLabel
        Left = 5
        Top = 7
        Width = 112
        Height = 13
        Caption = 'Descri'#231#227'o do grupo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object ed_descricao: TDBEdit
        Left = 5
        Top = 23
        Width = 332
        Height = 21
        CharCase = ecUpperCase
        DataField = 'DESCRICAO'
        DataSource = dm.ds_qry_grupos_fornecedores
        TabOrder = 0
        OnExit = Edit1Exit
        OnKeyDown = Edit1KeyDown
      end
    end
  end
  inherited pn_botoes: TPanel
    Top = 100
    Width = 358
    inherited bt_novo: TBitBtn
      Width = 50
      Caption = 'Novo'
    end
    inherited bt_alterar: TBitBtn
      Left = 101
      Width = 50
      Caption = 'Alterar'
    end
    inherited bt_gravar: TBitBtn
      Left = 202
      Width = 50
      Caption = 'Gravar'
    end
    inherited bt_cancelar: TBitBtn
      Left = 253
      Width = 50
      Caption = 'Cancelar'
    end
    inherited bt_sair: TBitBtn
      Left = 304
      Width = 50
      Caption = 'S&air'
    end
    inherited bt_excluir: TBitBtn
      Left = 152
      Width = 50
      Caption = 'Excluir'
    end
    inherited bt_consultar: TBitBtn
      Left = 51
      Width = 50
      Caption = 'Consultar'
    end
    inherited bt_imprimir: TBitBtn
      Left = 199
      Top = -53
      Visible = False
    end
  end
end
