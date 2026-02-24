inherited frm_cs_tipos_entrada: Tfrm_cs_tipos_entrada
  Caption = 'Consulta de Tipos de entrada'
  Position = poScreenCenter
  TextHeight = 13
  inherited Panel3: TPanel
    Height = 49
    ExplicitHeight = 49
    inherited Label1: TLabel
      Top = 12
      Width = 206
      Caption = 'Digite as iniciais do tipo de entrada:'
      ExplicitTop = 12
      ExplicitWidth = 206
    end
    inherited ed_parametro: TEdit
      Top = 25
      Width = 278
      ExplicitTop = 25
      ExplicitWidth = 278
    end
    inherited RadioGroup1: TRadioGroup
      Top = -47
      ExplicitTop = -47
    end
  end
  inherited Panel1: TPanel
    Top = 49
    Height = 168
    ExplicitTop = 49
    ExplicitHeight = 167
    inherited DBGrid1: TDBGrid
      Height = 168
      Columns = <
        item
          Expanded = False
          FieldName = 'COD_TIPO_ENTRADA'
          Title.Caption = 'C'#243'digo'
          Width = 45
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DESCRICAO'
          Title.Caption = 'Descri'#231#227'o'
          Width = 242
          Visible = True
        end>
    end
  end
  inherited Panel2: TPanel
    inherited bt_cancelar: TAdvGlassButton
      Left = 169
      Width = 166
      ExplicitLeft = 169
      ExplicitWidth = 166
    end
    inherited bt_selecionar: TAdvGlassButton
      Width = 166
      ExplicitWidth = 166
    end
  end
end
