inherited frm_cs_tipos_documentos: Tfrm_cs_tipos_documentos
  Caption = 'Consulta - Tipos de documentos'
  Position = poScreenCenter
  TextHeight = 13
  inherited Panel3: TPanel
    Height = 57
    ExplicitHeight = 57
    inherited Label1: TLabel
      Top = 4
      Width = 221
      Caption = 'Digite as iniciais do tipo de documento'
      ExplicitTop = 4
      ExplicitWidth = 221
    end
    inherited ed_parametro: TEdit
      Top = 25
      Width = 278
      ExplicitTop = 25
      ExplicitWidth = 278
    end
    inherited RadioGroup1: TRadioGroup
      Top = -46
      ExplicitTop = -46
    end
  end
  inherited Panel1: TPanel
    Top = 57
    Height = 160
    ExplicitTop = 57
    ExplicitHeight = 159
    inherited DBGrid1: TDBGrid
      Height = 160
      Columns = <
        item
          Expanded = False
          FieldName = 'COD_TIPO_DOC'
          Title.Caption = 'C'#243'digo'
          Width = 45
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DESCRICAO'
          Title.Caption = 'Descri'#231#227'o'
          Width = 197
          Visible = True
        end>
    end
  end
  inherited Panel2: TPanel
    inherited bt_cancelar: TAdvGlassButton
      Left = 145
      Width = 143
      ExplicitLeft = 145
      ExplicitWidth = 143
    end
    inherited bt_selecionar: TAdvGlassButton
      Width = 143
      ExplicitWidth = 143
    end
  end
end
