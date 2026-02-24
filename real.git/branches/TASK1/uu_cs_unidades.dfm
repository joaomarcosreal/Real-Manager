inherited frm_cs_unidades: Tfrm_cs_unidades
  Width = 342
  Caption = 'Consulta de Unidades'
  OldCreateOrder = True
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel3: TPanel
    Width = 334
    Height = 41
    inherited Label1: TLabel
      Top = 4
      Width = 165
      Caption = 'Digite as iniciais da unidade:'
    end
    inherited ed_parametro: TEdit
      Top = 17
    end
    inherited RadioGroup1: TRadioGroup
      Top = -48
      Visible = False
    end
  end
  inherited Panel1: TPanel
    Top = 41
    Width = 334
    Height = 163
    inherited DBGrid1: TDBGrid
      Width = 332
      Columns = <
        item
          Expanded = False
          FieldName = 'COD_UNIDADE'
          Title.Caption = 'C'#243'digo'
          Width = 56
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DESCRICAO'
          Title.Caption = 'Descri'#231#227'o'
          Width = 154
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'SIGLA'
          Title.Caption = 'Sigla'
          Width = 55
          Visible = True
        end>
    end
  end
  inherited Panel2: TPanel
    Width = 334
    inherited bt_selecionar: TBitBtn
      Width = 164
    end
    inherited bt_cancelar: TBitBtn
      Left = 166
      Width = 164
    end
  end
end
