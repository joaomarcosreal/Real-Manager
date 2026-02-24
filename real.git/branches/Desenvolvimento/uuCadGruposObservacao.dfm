inherited frmCadGruposObs: TfrmCadGruposObs
  Left = 342
  Top = 273
  Caption = 'Cadastro de Grupos de Observa'#231#245'es'
  ClientHeight = 159
  ClientWidth = 359
  PixelsPerInch = 96
  TextHeight = 13
  inherited pn_principal: TPanel
    Width = 359
    Height = 117
    inherited pn_codigo: TPanel
      Width = 357
      inherited bt_pesquisa: TSpeedButton
        Left = 60
        Top = 20
        Width = 24
        Height = 21
      end
      inherited ed_codigo: TMaskEdit
        Width = 54
      end
    end
    object Panel1: TPanel
      Left = 1
      Top = 47
      Width = 357
      Height = 69
      Align = alClient
      TabOrder = 1
      object Label6: TLabel
        Left = 7
        Top = 12
        Width = 179
        Height = 13
        Caption = 'Nome do grupo de observa'#231#227'o:'
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
        OnKeyDown = Edit1KeyDown
      end
    end
  end
  inherited pn_botoes: TPanel
    Top = 117
    Width = 359
    inherited bt_novo: TBitBtn
      Width = 50
      Caption = 'Novo'
    end
    inherited bt_alterar: TBitBtn
      Left = 104
      Width = 50
      Caption = 'Alterar'
    end
    inherited bt_gravar: TBitBtn
      Left = 205
      Width = 50
      Caption = 'Gravar'
    end
    inherited bt_cancelar: TBitBtn
      Left = 257
      Width = 50
      Caption = 'Cancelar'
    end
    inherited bt_sair: TBitBtn
      Left = 308
      Width = 50
      Caption = 'S&air'
    end
    inherited bt_excluir: TBitBtn
      Left = 154
      Width = 50
      Caption = 'Excluir'
    end
    inherited bt_consultar: TBitBtn
      Left = 52
      Width = 50
      Caption = 'Consultar'
    end
    inherited bt_imprimir: TBitBtn
      Left = 436
      Top = -72
      Width = 50
    end
  end
end
