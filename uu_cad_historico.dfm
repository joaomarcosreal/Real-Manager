inherited frm_cad_historico_caixa: Tfrm_cad_historico_caixa
  Caption = 'Cadastro de Hist'#243'ricos do caixa'
  ClientHeight = 138
  ClientWidth = 496
  OldCreateOrder = True
  ExplicitWidth = 512
  ExplicitHeight = 177
  PixelsPerInch = 96
  TextHeight = 13
  inherited pn_principal: TPanel
    Width = 496
    Height = 96
    ExplicitWidth = 496
    ExplicitHeight = 96
    inherited pn_codigo: TPanel
      Width = 494
      Enabled = False
      ExplicitWidth = 494
      inherited bt_pesquisa: TSpeedButton
        Left = 60
        Top = 20
        ExplicitLeft = 60
        ExplicitTop = 20
      end
      inherited ed_codigo: TMaskEdit
        Width = 54
        ExplicitWidth = 54
      end
    end
    object pn_descricao: TPanel
      Left = 1
      Top = 47
      Width = 494
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
      object ed_descricao: TDBEdit
        Left = 8
        Top = 16
        Width = 465
        Height = 21
        CharCase = ecUpperCase
        DataField = 'DESCRICAO'
        DataSource = dm.ds_qry_historicos_caixa
        TabOrder = 0
        OnExit = ed_codigoExit
        OnKeyDown = Edit1KeyDown
      end
    end
  end
  inherited pn_botoes: TPanel
    Top = 96
    Width = 496
    ExplicitTop = 96
    ExplicitWidth = 496
    inherited bt_novo: TBitBtn
      Width = 69
      Height = 38
      ExplicitWidth = 69
      ExplicitHeight = 38
    end
    inherited bt_alterar: TBitBtn
      Left = 141
      Width = 69
      Height = 38
      ExplicitLeft = 141
      ExplicitWidth = 69
      ExplicitHeight = 38
    end
    inherited bt_gravar: TBitBtn
      Left = 281
      Width = 69
      Height = 38
      ExplicitLeft = 281
      ExplicitWidth = 69
      ExplicitHeight = 38
    end
    inherited bt_cancelar: TBitBtn
      Left = 351
      Width = 73
      Height = 38
      ExplicitLeft = 351
      ExplicitWidth = 73
      ExplicitHeight = 38
    end
    inherited bt_sair: TBitBtn
      Left = 424
      Width = 69
      Height = 38
      ExplicitLeft = 424
      ExplicitWidth = 69
      ExplicitHeight = 38
    end
    inherited bt_excluir: TBitBtn
      Left = 211
      Width = 69
      Height = 38
      ExplicitLeft = 211
      ExplicitWidth = 69
      ExplicitHeight = 38
    end
    inherited bt_consultar: TBitBtn
      Left = 71
      Width = 69
      Height = 38
      ExplicitLeft = 71
      ExplicitWidth = 69
      ExplicitHeight = 38
    end
    inherited bt_imprimir: TBitBtn
      Left = 411
      Top = -48
      Visible = False
      ExplicitLeft = 411
      ExplicitTop = -48
    end
  end
end
