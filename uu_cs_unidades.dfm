inherited frm_cs_unidades: Tfrm_cs_unidades
  Caption = 'Consulta de Unidades'
  Position = poScreenCenter
  TextHeight = 13
  inherited Panel3: TPanel
    Height = 41
    ExplicitHeight = 41
    inherited Label1: TLabel
      Top = 4
      Width = 165
      Caption = 'Digite as iniciais da unidade:'
      ExplicitTop = 4
      ExplicitWidth = 165
    end
    inherited ed_parametro: TEdit
      Top = 17
      ExplicitTop = 17
    end
    inherited RadioGroup1: TRadioGroup
      Top = -48
      Visible = False
      ExplicitTop = -48
    end
  end
  inherited Panel1: TPanel
    Top = 41
    Height = 176
    ExplicitTop = 41
    ExplicitHeight = 175
    inherited DBGrid1: TDBGrid
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
    inherited bt_cancelar: TAdvGlassButton
      Left = 166
      Width = 164
      ExplicitLeft = 166
      ExplicitWidth = 164
    end
    inherited bt_selecionar: TAdvGlassButton
      Width = 164
      ExplicitWidth = 164
    end
  end
end
