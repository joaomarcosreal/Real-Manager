inherited frmCsEstados: TfrmCsEstados
  Left = 323
  Top = 161
  Caption = 'Consulta de Estados'
  TextHeight = 13
  inherited Panel3: TPanel
    Height = 54
    ExplicitHeight = 54
    inherited Label1: TLabel
      Top = 7
      Width = 158
      Caption = 'Digite as iniciais do estado:'
      ExplicitTop = 7
      ExplicitWidth = 158
    end
    inherited ed_parametro: TEdit
      Top = 21
      Width = 167
      ExplicitTop = 21
      ExplicitWidth = 167
    end
    inherited RadioGroup1: TRadioGroup
      Top = -45
      ExplicitTop = -45
    end
  end
  inherited Panel1: TPanel
    Top = 54
    Height = 178
    Caption = ''
    ExplicitTop = 54
    ExplicitHeight = 177
    inherited DBGrid1: TDBGrid
      Height = 178
      Columns = <
        item
          Expanded = False
          FieldName = 'CODIGO'
          Title.Caption = 'C'#243'digo'
          Width = 50
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NOME'
          Title.Caption = 'Nome'
          Width = 200
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'SIGLA'
          Title.Caption = 'UF'
          Width = 30
          Visible = True
        end>
    end
  end
  inherited Panel2: TPanel
    Top = 232
    Height = 47
    ExplicitTop = 231
    ExplicitHeight = 47
    inherited bt_cancelar: TAdvGlassButton
      Left = 174
      Width = 168
      Height = 40
      ExplicitLeft = 174
      ExplicitWidth = 168
      ExplicitHeight = 40
    end
    inherited bt_selecionar: TAdvGlassButton
      Width = 170
      Height = 41
      ExplicitWidth = 170
      ExplicitHeight = 41
    end
  end
end
