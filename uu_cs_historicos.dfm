inherited frm_cs_historicos_caixa: Tfrm_cs_historicos_caixa
  Left = 188
  Top = 161
  Caption = 'Consulta de hist'#243'ricos'
  TextHeight = 13
  inherited Panel3: TPanel
    Height = 49
    ExplicitHeight = 49
    inherited Label1: TLabel
      Top = 4
      Width = 168
      Caption = 'Digite as iniciais do hist'#243'rico:'
      ExplicitTop = 4
      ExplicitWidth = 168
    end
    inherited ed_parametro: TEdit
      Top = 17
      ExplicitTop = 17
    end
    inherited RadioGroup1: TRadioGroup
      Left = 27
      Top = -38
      Visible = False
      ExplicitLeft = 27
      ExplicitTop = -38
    end
  end
  inherited Panel1: TPanel
    Top = 49
    Height = 168
    ExplicitTop = 49
    ExplicitHeight = 167
    inherited DBGrid1: TDBGrid
      Columns = <
        item
          Expanded = False
          FieldName = 'cod_historico'
          Title.Caption = 'C'#243'digo'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'descricao'
          Title.Caption = 'Descri'#231#227'o do hist'#243'rico'
          Width = 363
          Visible = True
        end>
    end
  end
end
