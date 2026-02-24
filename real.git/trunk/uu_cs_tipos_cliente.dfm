inherited frm_cs_tipos_cliente: Tfrm_cs_tipos_cliente
  Width = 439
  Height = 326
  Caption = 'Pesquisa de tipos de cliente'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel3: TPanel
    Width = 431
    Height = 44
    inherited Label1: TLabel
      Top = 5
      Width = 201
      Caption = 'Digite as iniciais do tipo de cliente:'
    end
    inherited ed_parametro: TEdit
      Top = 18
    end
    inherited RadioGroup1: TRadioGroup
      Top = -40
    end
  end
  inherited Panel1: TPanel
    Top = 44
    Width = 431
    Height = 217
    inherited DBGrid1: TDBGrid
      Width = 423
      Height = 208
      Columns = <
        item
          Expanded = False
          FieldName = 'COD_TIPO'
          Title.Caption = 'C'#243'digo'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DESCRICAO'
          Title.Caption = 'Descri'#231#227'o'
          Width = 253
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PRAZO'
          Title.Caption = 'Prazo'
          Visible = True
        end>
    end
  end
  inherited Panel2: TPanel
    Top = 261
    Width = 431
    inherited bt_selecionar: TBitBtn
      Width = 213
    end
    inherited bt_cancelar: TBitBtn
      Left = 215
      Width = 213
    end
  end
end
