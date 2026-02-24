inherited frmCadPromoters: TfrmCadPromoters
  Left = 801
  Top = 357
  Caption = 'Cadastro de Promoters'
  ClientHeight = 123
  ClientWidth = 309
  OldCreateOrder = True
  ExplicitWidth = 325
  ExplicitHeight = 162
  PixelsPerInch = 96
  TextHeight = 13
  inherited pn_principal: TPanel
    Width = 309
    Height = 81
    ExplicitWidth = 309
    ExplicitHeight = 81
    object TLabel [0]
      Left = 7
      Top = 36
      Width = 109
      Height = 13
      Caption = 'Nome do Promoter:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    inherited pn_codigo: TPanel
      Width = 307
      Height = 33
      ExplicitWidth = 307
      ExplicitHeight = 33
      inherited bt_pesquisa: TSpeedButton
        Left = 37
        Top = 5
        Width = 23
        Height = 19
        ExplicitLeft = 37
        ExplicitTop = 5
        ExplicitWidth = 23
        ExplicitHeight = 19
      end
      inherited ed_codigo: TMaskEdit
        Top = 5
        Width = 30
        ExplicitTop = 5
        ExplicitWidth = 30
      end
    end
    object edNomePromoter: TDBEdit
      Left = 6
      Top = 50
      Width = 291
      Height = 21
      CharCase = ecUpperCase
      DataField = 'NOME'
      DataSource = dm.dsQryPromoters
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      OnKeyDown = Edit1KeyDown
    end
  end
  inherited pn_botoes: TPanel
    Top = 81
    Width = 309
    ExplicitTop = 81
    ExplicitWidth = 309
    inherited bt_novo: TBitBtn
      Width = 50
      Caption = 'Novo'
      ExplicitWidth = 50
    end
    inherited bt_alterar: TBitBtn
      Left = 53
      Width = 50
      Caption = 'Alterar'
      ExplicitLeft = 53
      ExplicitWidth = 50
    end
    inherited bt_gravar: TBitBtn
      Left = 152
      Width = 50
      Caption = 'Gravar'
      ExplicitLeft = 152
      ExplicitWidth = 50
    end
    inherited bt_cancelar: TBitBtn
      Left = 201
      Width = 50
      Caption = 'Cancelar'
      ExplicitLeft = 201
      ExplicitWidth = 50
    end
    inherited bt_sair: TBitBtn
      Left = 252
      Width = 50
      ExplicitLeft = 252
      ExplicitWidth = 50
    end
    inherited bt_excluir: TBitBtn
      Left = 102
      Width = 50
      Caption = 'Excluir'
      ExplicitLeft = 102
      ExplicitWidth = 50
    end
    inherited bt_consultar: TBitBtn
      Left = 459
      Top = -105
      Width = 50
      Visible = False
      ExplicitLeft = 459
      ExplicitTop = -105
      ExplicitWidth = 50
    end
    inherited bt_imprimir: TBitBtn
      Top = -80
      Width = 50
      Visible = False
      ExplicitTop = -80
      ExplicitWidth = 50
    end
  end
end
