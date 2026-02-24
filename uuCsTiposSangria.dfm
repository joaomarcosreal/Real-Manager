inherited frmCsTiposSangria: TfrmCsTiposSangria
  Left = 453
  Top = 229
  Caption = 'Consulta de Tipos de Sangria'
  Position = poScreenCenter
  TextHeight = 13
  inherited Panel3: TPanel
    Height = 1
    ExplicitHeight = 1
    inherited Label1: TLabel
      Top = -44
      Visible = False
      ExplicitTop = -44
    end
    inherited ed_parametro: TEdit
      Top = -31
      Visible = False
      ExplicitTop = -31
    end
    inherited RadioGroup1: TRadioGroup
      Left = -141
      Top = -42
      ExplicitLeft = -141
      ExplicitTop = -42
    end
  end
  inherited Panel1: TPanel
    Top = 1
    Height = 216
    ExplicitTop = 1
    ExplicitHeight = 215
    inherited DBGrid1: TDBGrid
      Height = 216
      Columns = <
        item
          Expanded = False
          FieldName = 'CODIGO'
          Title.Caption = 'C'#243'digo'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DESCRICAO'
          Title.Caption = 'Descri'#231#227'o'
          Width = 230
          Visible = True
        end>
    end
  end
  inherited Panel2: TPanel
    inherited bt_cancelar: TAdvGlassButton
      Left = 163
      Width = 160
      ExplicitLeft = 163
      ExplicitWidth = 160
    end
    inherited bt_selecionar: TAdvGlassButton
      Width = 160
      ExplicitWidth = 160
    end
  end
end
