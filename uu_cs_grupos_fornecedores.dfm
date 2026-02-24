inherited frm_cs_grupos_fornecedores: Tfrm_cs_grupos_fornecedores
  Caption = 'Pesquisa de Grupos de Fornecedores - Segmenta'#231#227'o'
  TextHeight = 13
  inherited Panel3: TPanel
    Height = 50
    ExplicitHeight = 50
    inherited Label1: TLabel
      Top = 10
      Width = 152
      Caption = 'Digite as iniciais do grupo:'
      ExplicitTop = 10
      ExplicitWidth = 152
    end
    inherited ed_parametro: TEdit
      Top = 23
      ExplicitTop = 23
    end
    inherited RadioGroup1: TRadioGroup
      Left = 19
      Top = -48
      Visible = False
      ExplicitLeft = 19
      ExplicitTop = -48
    end
  end
  inherited Panel1: TPanel
    Top = 50
    Height = 167
    ExplicitTop = 50
    ExplicitHeight = 166
    inherited DBGrid1: TDBGrid
      Columns = <
        item
          Expanded = False
          FieldName = 'CODIGO'
          Title.Caption = 'C'#243'digo'
          Width = 52
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DESCRICAO'
          Title.Caption = 'Descri'#231#227'o do grupo:'
          Width = 412
          Visible = True
        end>
    end
  end
end
