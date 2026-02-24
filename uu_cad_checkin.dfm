inherited frm_modelo_cadastro1: Tfrm_modelo_cadastro1
  Left = 197
  Top = 196
  Caption = 'Entrada de Clientes (Check-in)'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pn_principal: TPanel
    inherited pn_codigo: TPanel
      Height = 0
      Visible = False
    end
    object Panel1: TPanel
      Left = 1
      Top = 1
      Width = 593
      Height = 283
      Align = alClient
      TabOrder = 1
    end
  end
  inherited pn_botoes: TPanel
    inherited bt_alterar: TBitBtn
      Top = -81
      Visible = False
    end
    inherited bt_cancelar: TBitBtn
      Visible = False
    end
    inherited bt_excluir: TBitBtn
      Top = -81
      Visible = False
    end
    inherited bt_consultar: TBitBtn
      Top = -81
      Visible = False
    end
    inherited bt_imprimir: TBitBtn
      Top = -80
      Visible = False
    end
  end
end
