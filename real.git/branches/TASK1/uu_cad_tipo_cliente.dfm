inherited frm_cad_tipo_cliente: Tfrm_cad_tipo_cliente
  Left = 324
  Top = 324
  Caption = 'Cadastro de Tipos de Tipos de Clientes'
  ClientHeight = 142
  ClientWidth = 354
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited pn_principal: TPanel
    Width = 354
    Height = 100
    inherited pn_codigo: TPanel
      Width = 352
      inherited bt_pesquisa: TSpeedButton
        Left = 54
      end
      inherited ed_codigo: TMaskEdit
        Width = 46
      end
    end
    object pn_descricao: TPanel
      Left = 1
      Top = 47
      Width = 352
      Height = 52
      Align = alClient
      TabOrder = 1
      object Label14: TLabel
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
      object Label1: TLabel
        Left = 277
        Top = 4
        Width = 37
        Height = 13
        Caption = 'Prazo:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object ed_descricao: TDBEdit
        Left = 5
        Top = 18
        Width = 268
        Height = 21
        CharCase = ecUpperCase
        DataField = 'DESCRICAO'
        DataSource = dm.ds_tipos_cli
        TabOrder = 0
        OnEnter = ed_codigoEnter
        OnExit = ed_codigoExit
        OnKeyDown = Edit1KeyDown
      end
      object DBEdit1: TDBEdit
        Left = 277
        Top = 18
        Width = 60
        Height = 21
        CharCase = ecUpperCase
        DataField = 'PRAZO'
        DataSource = dm.ds_tipos_cli
        TabOrder = 1
        OnEnter = ed_codigoEnter
        OnExit = ed_codigoExit
        OnKeyDown = Edit1KeyDown
      end
    end
  end
  inherited pn_botoes: TPanel
    Top = 100
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
      Left = 201
      Width = 50
      Caption = 'Gravar'
    end
    inherited bt_cancelar: TBitBtn
      Left = 251
      Width = 50
      Caption = 'Cancelar'
    end
    inherited bt_sair: TBitBtn
      Left = 301
      Top = 3
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
      Left = 442
      Top = -51
      Width = 50
    end
  end
end
