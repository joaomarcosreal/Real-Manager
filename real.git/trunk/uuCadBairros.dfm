inherited frmCadBairros: TfrmCadBairros
  Left = 564
  Top = 298
  Caption = 'Cadastro de Bairros'
  ClientHeight = 140
  ClientWidth = 396
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited pn_principal: TPanel
    Width = 396
    Height = 98
    object Label1: TLabel [0]
      Left = 14
      Top = 52
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
    object Label2: TLabel [1]
      Left = 246
      Top = 52
      Width = 88
      Height = 13
      Caption = 'Tx. de  entrega'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    inherited pn_codigo: TPanel
      Width = 394
      inherited bt_pesquisa: TSpeedButton
        Left = 61
        Top = 21
        Width = 23
        Height = 20
      end
      object Label3: TLabel [1]
        Left = -2
        Top = 9
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
        Width = 54
      end
    end
    object edDescricao: TDBEdit
      Left = 16
      Top = 64
      Width = 225
      Height = 21
      DataField = 'DESCRICAO'
      DataSource = dm.dsQryBairro
      TabOrder = 1
      OnKeyDown = Edit1KeyDown
    end
    object edTxEtrega: TDBEdit
      Left = 248
      Top = 64
      Width = 121
      Height = 21
      DataField = 'TXENTREGA'
      DataSource = dm.dsQryBairro
      TabOrder = 2
      OnKeyDown = Edit1KeyDown
    end
  end
  inherited pn_botoes: TPanel
    Top = 98
    Width = 396
    inherited bt_novo: TBitBtn
      Width = 64
    end
    inherited bt_alterar: TBitBtn
      Left = 67
      Width = 64
    end
    inherited bt_gravar: TBitBtn
      Left = 196
      Width = 64
    end
    inherited bt_cancelar: TBitBtn
      Left = 261
      Width = 68
    end
    inherited bt_sair: TBitBtn
      Left = 329
      Width = 64
    end
    inherited bt_excluir: TBitBtn
      Left = 131
      Width = 64
    end
    inherited bt_consultar: TBitBtn
      Left = 66
      Top = -50
      Width = 64
      Visible = False
    end
    inherited bt_imprimir: TBitBtn
      Left = 435
      Top = -53
      Height = 38
      Visible = False
    end
  end
end
