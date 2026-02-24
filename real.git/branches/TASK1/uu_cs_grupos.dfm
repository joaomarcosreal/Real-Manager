inherited frm_cs_grupos: Tfrm_cs_grupos
  Width = 415
  Height = 303
  Caption = 'Consulta de grupos'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel3: TPanel
    Width = 407
    Height = 41
    inherited Label1: TLabel
      Top = 4
    end
    inherited ed_parametro: TEdit
      Top = 17
      Width = 382
    end
    inherited RadioGroup1: TRadioGroup
      Left = 51
      Top = -42
      Visible = False
    end
  end
  inherited Panel1: TPanel
    Top = 41
    Width = 407
    Height = 197
    inherited DBGrid1: TDBGrid
      Width = 398
      Height = 189
      OnDrawColumnCell = DBGrid1DrawColumnCell
      Columns = <
        item
          Expanded = False
          FieldName = 'COD_GRUPO'
          Title.Caption = 'C'#243'digo'
          Width = 111
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DESCRICAO'
          Title.Caption = 'Descri'#231#227'o'
          Width = 223
          Visible = True
        end>
    end
  end
  inherited Panel2: TPanel
    Top = 238
    Width = 407
    inherited bt_selecionar: TBitBtn
      Width = 202
    end
    inherited bt_cancelar: TBitBtn
      Left = 204
      Top = 3
      Width = 202
      Height = 33
    end
  end
end
