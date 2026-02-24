inherited frmCadGruposTouch: TfrmCadGruposTouch
  Left = 644
  Top = 386
  Caption = 'Cadastro de Grupos Touch Screen'
  ClientHeight = 160
  ClientWidth = 358
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited pn_principal: TPanel
    Width = 358
    Height = 118
    inherited pn_codigo: TPanel
      Width = 356
      Height = 39
      inherited bt_pesquisa: TSpeedButton
        Left = 76
        Top = 11
        Height = 25
      end
      inherited ed_codigo: TMaskEdit
        Top = 13
        Width = 70
      end
    end
    object Panel1: TPanel
      Left = 1
      Top = 40
      Width = 356
      Height = 77
      Align = alClient
      TabOrder = 1
      object Label6: TLabel
        Left = 7
        Top = 12
        Width = 173
        Height = 13
        Caption = 'Nome do Grupo Touch Screen'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object edDescGrupoTouch: TDBEdit
        Left = 8
        Top = 32
        Width = 281
        Height = 28
        CharCase = ecUpperCase
        DataField = 'DESCRICAO'
        DataSource = dm.dsGruposTouch
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
    end
  end
  inherited pn_botoes: TPanel
    Top = 118
    Width = 358
    inherited bt_novo: TBitBtn
      Width = 50
      Caption = 'Novo'
    end
    inherited bt_alterar: TBitBtn
      Left = 103
      Width = 50
      Caption = 'Alterar'
    end
    inherited bt_gravar: TBitBtn
      Left = 204
      Width = 50
      Caption = 'Gravar'
    end
    inherited bt_cancelar: TBitBtn
      Left = 254
      Width = 50
      Caption = 'Cancelar '
    end
    inherited bt_sair: TBitBtn
      Left = 304
      Width = 50
      Caption = 'S&air '
    end
    inherited bt_excluir: TBitBtn
      Left = 153
      Width = 50
      Caption = 'Excluir'
    end
    inherited bt_consultar: TBitBtn
      Left = 52
      Width = 50
      Caption = 'Consultar'
    end
    inherited bt_imprimir: TBitBtn
      Top = -47
      Visible = False
    end
  end
end
