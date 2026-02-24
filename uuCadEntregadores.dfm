inherited frmCadEntregadores: TfrmCadEntregadores
  Left = 282
  Top = 302
  Caption = 'Cadastro de Entregadores'
  ClientHeight = 167
  ClientWidth = 354
  OldCreateOrder = True
  ExplicitWidth = 370
  ExplicitHeight = 206
  PixelsPerInch = 96
  TextHeight = 13
  inherited pn_principal: TPanel
    Width = 354
    Height = 125
    ExplicitWidth = 354
    ExplicitHeight = 125
    inherited pn_codigo: TPanel
      Width = 352
      Height = 31
      ExplicitWidth = 352
      ExplicitHeight = 31
      inherited bt_pesquisa: TSpeedButton
        Left = 54
        Top = 7
        Height = 19
        ExplicitLeft = 54
        ExplicitTop = 7
        ExplicitHeight = 19
      end
      inherited ed_codigo: TMaskEdit
        Top = 6
        Width = 46
        ExplicitTop = 6
        ExplicitWidth = 46
      end
    end
    object Panel1: TPanel
      Left = 1
      Top = 32
      Width = 352
      Height = 92
      Align = alClient
      TabOrder = 1
      object Label6: TLabel
        Left = 7
        Top = 12
        Width = 117
        Height = 13
        Caption = 'Nome do Entregador'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object TLabel
        Left = 199
        Top = 12
        Width = 38
        Height = 13
        Caption = 'Di'#225'ria:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object TLabel
        Left = 6
        Top = 50
        Width = 87
        Height = 13
        Caption = '% Comis./ Ped.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object TLabel
        Left = 101
        Top = 51
        Width = 94
        Height = 13
        Caption = 'Comiss'#227'o / Ped.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object edNomeEntregador: TDBEdit
        Left = 6
        Top = 26
        Width = 187
        Height = 21
        CharCase = ecUpperCase
        DataField = 'NOME_ENTREGADOR'
        DataSource = dm.dsQryEntregadores
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        OnKeyDown = Edit1KeyDown
      end
      object edValorDiaria: TDBEdit
        Left = 200
        Top = 26
        Width = 65
        Height = 21
        CharCase = ecUpperCase
        DataField = 'VALOR_DIARIA'
        DataSource = dm.dsQryEntregadores
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        OnKeyDown = Edit1KeyDown
      end
      object edPecPedido: TDBEdit
        Left = 7
        Top = 64
        Width = 88
        Height = 21
        CharCase = ecUpperCase
        DataField = 'PERC_COMISSAO_PEDIDO'
        DataSource = dm.dsQryEntregadores
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 2
        OnKeyDown = Edit1KeyDown
      end
      object edComissaoPedido: TDBEdit
        Left = 102
        Top = 64
        Width = 90
        Height = 21
        CharCase = ecUpperCase
        DataField = 'COMISSAO_POR_PEDIDO'
        DataSource = dm.dsQryEntregadores
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 3
        OnKeyDown = Edit1KeyDown
      end
      object JvDBCheckBox1: TJvDBCheckBox
        Left = 201
        Top = 68
        Width = 64
        Height = 17
        Caption = 'Ativo'
        DataField = 'STATUS'
        DataSource = dm.dsQryEntregadores
        TabOrder = 4
        ValueChecked = '1'
        ValueUnchecked = '0'
      end
    end
  end
  inherited pn_botoes: TPanel
    Top = 125
    Width = 354
    ExplicitTop = 125
    ExplicitWidth = 354
    inherited bt_novo: TBitBtn
      Width = 50
      Caption = 'Novo'
      ExplicitWidth = 50
    end
    inherited bt_alterar: TBitBtn
      Left = 100
      Width = 50
      Caption = 'Alterar'
      ExplicitLeft = 100
      ExplicitWidth = 50
    end
    inherited bt_gravar: TBitBtn
      Left = 200
      Width = 50
      Caption = 'Gravar'
      ExplicitLeft = 200
      ExplicitWidth = 50
    end
    inherited bt_cancelar: TBitBtn
      Left = 250
      Width = 50
      Caption = 'Cancelar'
      ExplicitLeft = 250
      ExplicitWidth = 50
    end
    inherited bt_sair: TBitBtn
      Left = 300
      Width = 51
      Caption = 'S&air'
      ExplicitLeft = 300
      ExplicitWidth = 51
    end
    inherited bt_excluir: TBitBtn
      Left = 149
      Width = 50
      Caption = 'Excluir'
      ExplicitLeft = 149
      ExplicitWidth = 50
    end
    inherited bt_consultar: TBitBtn
      Left = 50
      Width = 50
      Caption = 'Consultar'
      ExplicitLeft = 50
      ExplicitWidth = 50
    end
    inherited bt_imprimir: TBitBtn
      Left = 442
      Top = -48
      Width = 50
      ExplicitLeft = 442
      ExplicitTop = -48
      ExplicitWidth = 50
    end
  end
end
