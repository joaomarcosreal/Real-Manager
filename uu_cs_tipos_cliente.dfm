inherited frm_cs_tipos_cliente: Tfrm_cs_tipos_cliente
  Caption = 'Pesquisa de tipos de cliente'
  TextHeight = 13
  inherited Panel3: TPanel
    Height = 44
    ExplicitHeight = 44
    inherited Label1: TLabel
      Top = 5
      Width = 201
      Caption = 'Digite as iniciais do tipo de cliente:'
      ExplicitTop = 5
      ExplicitWidth = 201
    end
    inherited ed_parametro: TEdit
      Top = 18
      ExplicitTop = 18
    end
    inherited RadioGroup1: TRadioGroup
      Top = -40
      ExplicitTop = -40
    end
  end
  inherited Panel1: TPanel
    Top = 44
    Height = 173
    ExplicitTop = 44
    ExplicitHeight = 172
    inherited DBGrid1: TDBGrid
      Height = 173
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
    inherited bt_cancelar: TAdvGlassButton
      Left = 215
      Width = 213
      ExplicitLeft = 215
      ExplicitWidth = 213
    end
    inherited bt_selecionar: TAdvGlassButton
      Width = 213
      ExplicitWidth = 213
    end
  end
end
