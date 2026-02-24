inherited frmCadTiposBaixaEstoque: TfrmCadTiposBaixaEstoque
  Left = 322
  Top = 326
  Caption = 'Tipos de baixa de estoque'
  ClientHeight = 160
  ClientWidth = 355
  OldCreateOrder = True
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  inherited pn_principal: TPanel
    Width = 355
    Height = 118
    inherited pn_codigo: TPanel
      Width = 353
      Height = 48
      inherited bt_pesquisa: TSpeedButton
        Left = 43
        Width = 24
        Height = 22
      end
      object Label1: TLabel [1]
        Left = 2
        Top = 7
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
        Left = 0
        Top = 24
        Width = 41
      end
    end
    object Panel1: TPanel
      Left = 1
      Top = 49
      Width = 353
      Height = 67
      Align = alTop
      TabOrder = 1
      object Label2: TLabel
        Left = 3
        Top = 3
        Width = 218
        Height = 20
        Caption = 'Descri'#231'ao do tipo de baixa:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object edDescricaoTipoBaixaEstoque: TDBEdit
        Left = 3
        Top = 24
        Width = 334
        Height = 28
        CharCase = ecUpperCase
        DataField = 'DESCRICAO'
        DataSource = dm.dsQryTiposBaixaEstoque
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
    Width = 355
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
      Left = 303
      Width = 50
      Caption = 'S&air'
    end
    inherited bt_excluir: TBitBtn
      Left = 151
      Width = 50
      Caption = 'Excluir'
    end
    inherited bt_consultar: TBitBtn
      Left = 51
      Width = 50
      Caption = 'Consultar'
    end
    inherited bt_imprimir: TBitBtn
      Top = -41
      Width = 50
      Caption = '&Imprimir'
      Visible = False
    end
  end
end
