inherited frmCadTiposSangria: TfrmCadTiposSangria
  Caption = 'Tipos de Sangria'
  ClientHeight = 160
  ClientWidth = 357
  OldCreateOrder = True
  ExplicitWidth = 373
  ExplicitHeight = 199
  PixelsPerInch = 96
  TextHeight = 13
  inherited pn_principal: TPanel
    Width = 357
    Height = 118
    ExplicitWidth = 357
    ExplicitHeight = 118
    inherited pn_codigo: TPanel
      Width = 355
      Height = 45
      ExplicitWidth = 355
      ExplicitHeight = 45
      inherited bt_pesquisa: TSpeedButton
        Left = 43
        Top = 20
        Width = 25
        Height = 22
        ExplicitLeft = 43
        ExplicitTop = 20
        ExplicitWidth = 25
        ExplicitHeight = 22
      end
      object Label1: TLabel [1]
        Left = 2
        Top = 6
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
        Top = 20
        Width = 38
        ExplicitTop = 20
        ExplicitWidth = 38
      end
    end
    object Panel1: TPanel
      Left = 1
      Top = 46
      Width = 355
      Height = 71
      Align = alClient
      TabOrder = 1
      object Label2: TLabel
        Left = 3
        Top = 3
        Width = 86
        Height = 20
        Caption = 'Descri'#231#227'o:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object edDescricaoTIpoSangria: TDBEdit
        Left = 3
        Top = 24
        Width = 334
        Height = 28
        CharCase = ecUpperCase
        DataField = 'DESCRICAO'
        DataSource = dm.dsQryTiposSangria
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
    Width = 357
    ExplicitTop = 118
    ExplicitWidth = 357
    inherited bt_novo: TBitBtn
      Width = 50
      Caption = 'Novo'
      ExplicitWidth = 50
    end
    inherited bt_alterar: TBitBtn
      Left = 103
      Width = 50
      Caption = 'Alterar'
      ExplicitLeft = 103
      ExplicitWidth = 50
    end
    inherited bt_gravar: TBitBtn
      Left = 204
      Width = 50
      Caption = 'Gravar'
      ExplicitLeft = 204
      ExplicitWidth = 50
    end
    inherited bt_cancelar: TBitBtn
      Left = 255
      Width = 50
      Caption = 'Cancelar'
      ExplicitLeft = 255
      ExplicitWidth = 50
    end
    inherited bt_sair: TBitBtn
      Left = 306
      Width = 50
      Caption = 'S&air'
      ExplicitLeft = 306
      ExplicitWidth = 50
    end
    inherited bt_excluir: TBitBtn
      Left = 153
      Width = 50
      Caption = 'Excluir'
      ExplicitLeft = 153
      ExplicitWidth = 50
    end
    inherited bt_consultar: TBitBtn
      Left = 52
      Width = 50
      Caption = 'Consultar'
      ExplicitLeft = 52
      ExplicitWidth = 50
    end
    inherited bt_imprimir: TBitBtn
      Left = 427
      Top = -52
      Width = 50
      Visible = False
      ExplicitLeft = 427
      ExplicitTop = -52
      ExplicitWidth = 50
    end
  end
end
