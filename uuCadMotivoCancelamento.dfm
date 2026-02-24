inherited frmCadMotivosCancelamento: TfrmCadMotivosCancelamento
  Left = 568
  Top = 346
  Caption = 'Motivos de Estorno e Transfer'#234'ncias'
  ClientHeight = 157
  ClientWidth = 356
  OldCreateOrder = True
  OnClose = FormClose
  ExplicitWidth = 372
  ExplicitHeight = 196
  PixelsPerInch = 96
  TextHeight = 13
  inherited pn_principal: TPanel
    Width = 356
    Height = 115
    ExplicitWidth = 356
    ExplicitHeight = 115
    inherited pn_codigo: TPanel
      Width = 354
      Height = 44
      ExplicitWidth = 354
      ExplicitHeight = 44
      inherited bt_pesquisa: TSpeedButton
        Left = 52
        Top = 17
        Width = 27
        Height = 24
        ExplicitLeft = 52
        ExplicitTop = 17
        ExplicitWidth = 27
        ExplicitHeight = 24
      end
      object Label1: TLabel [1]
        Left = 3
        Top = 5
        Width = 44
        Height = 13
        Caption = 'C'#243'digo:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      inherited ed_codigo: TMaskEdit
        Top = 19
        Width = 46
        ExplicitTop = 19
        ExplicitWidth = 46
      end
    end
    object Panel1: TPanel
      Left = 0
      Top = 46
      Width = 355
      Height = 67
      TabOrder = 1
      object Label2: TLabel
        Left = 3
        Top = 3
        Width = 168
        Height = 20
        Caption = 'Descri'#231#227'o do motivo:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object edDescricaoMotivoEstorno: TDBEdit
        Left = 3
        Top = 24
        Width = 334
        Height = 28
        CharCase = ecUpperCase
        DataField = 'DESCRICAO'
        DataSource = dm.dsQryMotivosEstorno
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
    Top = 115
    Width = 356
    ExplicitTop = 115
    ExplicitWidth = 356
    inherited bt_novo: TBitBtn
      Width = 50
      Caption = 'Novo'
      ExplicitWidth = 50
    end
    inherited bt_alterar: TBitBtn
      Left = 101
      Width = 50
      Caption = 'Alterar'
      ExplicitLeft = 101
      ExplicitWidth = 50
    end
    inherited bt_gravar: TBitBtn
      Left = 203
      Width = 50
      Caption = 'Gravar'
      ExplicitLeft = 203
      ExplicitWidth = 50
    end
    inherited bt_cancelar: TBitBtn
      Left = 254
      Width = 50
      Caption = 'Cancelar'
      ExplicitLeft = 254
      ExplicitWidth = 50
    end
    inherited bt_sair: TBitBtn
      Left = 304
      Width = 50
      ExplicitLeft = 304
      ExplicitWidth = 50
    end
    inherited bt_excluir: TBitBtn
      Left = 152
      Width = 50
      Caption = 'Excluir'
      ExplicitLeft = 152
      ExplicitWidth = 50
    end
    inherited bt_consultar: TBitBtn
      Left = 51
      Width = 50
      Caption = 'Consultar'
      ExplicitLeft = 51
      ExplicitWidth = 50
    end
    inherited bt_imprimir: TBitBtn
      Left = 426
      Top = -54
      Width = 50
      Visible = False
      ExplicitLeft = 426
      ExplicitTop = -54
      ExplicitWidth = 50
    end
  end
end
