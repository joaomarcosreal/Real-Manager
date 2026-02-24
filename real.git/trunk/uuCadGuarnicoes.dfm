inherited frmCadGuarnicoes: TfrmCadGuarnicoes
  Left = 528
  Top = 345
  Caption = 'Cadastro de Guarni'#231#245'es'
  ClientHeight = 157
  ClientWidth = 354
  PixelsPerInch = 96
  TextHeight = 13
  inherited pn_principal: TPanel
    Width = 354
    Height = 115
    inherited pn_codigo: TPanel
      Width = 352
      inherited bt_pesquisa: TSpeedButton
        Left = 39
        Top = 20
        Width = 24
        Height = 22
      end
      inherited ed_codigo: TMaskEdit
        Width = 33
      end
    end
    object Panel1: TPanel
      Left = 1
      Top = 47
      Width = 352
      Height = 67
      Align = alClient
      TabOrder = 1
      object Label6: TLabel
        Left = 7
        Top = 12
        Width = 142
        Height = 13
        Caption = 'Descri'#231#227'o da Guarni'#231#227'o:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object edDescGuarnicao: TDBEdit
        Left = 8
        Top = 32
        Width = 281
        Height = 28
        CharCase = ecUpperCase
        DataField = 'DESCRICAO'
        DataSource = dm.dsGuarnicoes
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
    Width = 354
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
      Left = 252
      Width = 50
      Caption = 'Cancelar'
    end
    inherited bt_sair: TBitBtn
      Left = 302
      Width = 50
      Caption = 'S&air'
    end
    inherited bt_excluir: TBitBtn
      Left = 151
      Width = 50
      Caption = 'Excluir'
    end
    inherited bt_consultar: TBitBtn
      Left = 50
      Width = 50
      Caption = 'Consultar'
    end
    inherited bt_imprimir: TBitBtn
      Left = 430
      Top = -46
      Visible = False
    end
  end
end
