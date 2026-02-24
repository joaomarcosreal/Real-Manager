inherited frm_cs_tipos_operacao: Tfrm_cs_tipos_operacao
  Left = 120
  Top = 116
  Caption = 'Consulta de Tipos de Opera'#231#227'o:'
  TextHeight = 13
  inherited Panel3: TPanel
    Height = 45
    ExplicitHeight = 45
    inherited Label1: TLabel
      Top = 6
      Width = 216
      Caption = 'Digite as iniciais do tipo de opera'#231#227'o:'
      ExplicitTop = 6
      ExplicitWidth = 216
    end
    inherited ed_parametro: TEdit
      Top = 19
      ExplicitTop = 19
    end
    inherited RadioGroup1: TRadioGroup
      Left = 67
      Top = -45
      Visible = False
      ExplicitLeft = 67
      ExplicitTop = -45
    end
  end
  inherited Panel1: TPanel
    Top = 45
    Height = 172
    ExplicitTop = 45
    ExplicitHeight = 171
    inherited DBGrid1: TDBGrid
      Columns = <
        item
          Expanded = False
          FieldName = 'COD_TP_OP'
          Title.Caption = 'C'#243'digo'
          Width = 54
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DESCRICAO'
          Title.Caption = 'Opera'#231#227'o'
          Visible = True
        end>
    end
  end
end
