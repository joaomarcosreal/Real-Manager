inherited frm_cad_contas: Tfrm_cad_contas
  Left = 467
  Caption = 'Cadastro - Plano de contas financeiro'
  ClientHeight = 136
  ClientWidth = 445
  OldCreateOrder = True
  ExplicitWidth = 461
  ExplicitHeight = 175
  PixelsPerInch = 96
  TextHeight = 13
  inherited pn_principal: TPanel
    Width = 445
    Height = 94
    ExplicitWidth = 445
    ExplicitHeight = 94
    inherited pn_codigo: TPanel
      Width = 443
      ExplicitWidth = 443
      inherited bt_pesquisa: TSpeedButton
        Left = 67
        Top = 20
        Width = 23
        Height = 20
        ExplicitLeft = 67
        ExplicitTop = 20
        ExplicitWidth = 23
        ExplicitHeight = 20
      end
      inherited ed_codigo: TMaskEdit
        Width = 61
        EditMask = '9.99.999;0;_'
        MaxLength = 8
        ExplicitWidth = 61
      end
    end
    object pn_descricao: TPanel
      Left = 1
      Top = 47
      Width = 443
      Height = 47
      Align = alTop
      TabOrder = 1
      object Label1: TLabel
        Left = 6
        Top = 4
        Width = 62
        Height = 13
        Caption = 'Descri'#231#227'o:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object ed_descricao: TEdit
        Left = 5
        Top = 18
        Width = 268
        Height = 21
        CharCase = ecUpperCase
        MaxLength = 30
        TabOrder = 0
        OnEnter = ed_codigoEnter
        OnExit = ed_codigoExit
        OnKeyDown = ed_codigoKeyDown
      end
      object ckb_fixa: TCheckBox
        Left = 291
        Top = 19
        Width = 150
        Height = 17
        Caption = 'Receita/Despesa fixa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
        OnEnter = ed_codigoEnter
        OnExit = ed_codigoExit
        OnKeyDown = ed_codigoKeyDown
      end
    end
  end
  inherited pn_botoes: TPanel
    Top = 94
    Width = 445
    ExplicitTop = 94
    ExplicitWidth = 445
    inherited bt_alterar: TBitBtn
      Left = 76
      ExplicitLeft = 76
    end
    inherited bt_gravar: TBitBtn
      Left = 223
      ExplicitLeft = 223
    end
    inherited bt_cancelar: TBitBtn
      Left = 296
      ExplicitLeft = 296
    end
    inherited bt_sair: TBitBtn
      Left = 370
      ExplicitLeft = 370
    end
    inherited bt_excluir: TBitBtn
      Left = 149
      ExplicitLeft = 149
    end
    inherited bt_consultar: TBitBtn
      Left = 76
      Top = -51
      Width = 73
      Visible = False
      ExplicitLeft = 76
      ExplicitTop = -51
      ExplicitWidth = 73
    end
    inherited bt_imprimir: TBitBtn
      Left = 219
      Top = -88
      Visible = False
      ExplicitLeft = 219
      ExplicitTop = -88
    end
  end
end
