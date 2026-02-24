inherited frmCsAliquotas: TfrmCsAliquotas
  Left = 409
  Top = 208
  Caption = 'Consulta de Al'#237'quotas'
  ClientHeight = 267
  ClientWidth = 273
  Position = poScreenCenter
  ExplicitWidth = 289
  ExplicitHeight = 306
  TextHeight = 13
  inherited Panel3: TPanel
    Width = 273
    Height = 1
    ExplicitWidth = 273
    ExplicitHeight = 1
    inherited Label1: TLabel
      Left = 11
      Top = -29
      Visible = False
      ExplicitLeft = 11
      ExplicitTop = -29
    end
    inherited ed_parametro: TEdit
      Left = 11
      Top = -30
      Visible = False
      ExplicitLeft = 11
      ExplicitTop = -30
    end
    inherited RadioGroup1: TRadioGroup
      Left = 11
      Top = -79
      Visible = False
      ExplicitLeft = 11
      ExplicitTop = -79
    end
  end
  inherited Panel1: TPanel
    Top = 1
    Width = 273
    Height = 204
    ExplicitTop = 1
    ExplicitWidth = 273
    ExplicitHeight = 204
    inherited DBGrid1: TDBGrid
      Width = 277
      Height = 205
      Columns = <
        item
          Expanded = False
          FieldName = 'COD_ALIQUOTA'
          Title.Caption = 'C'#243'digo'
          Width = 47
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DESCRICAO'
          Title.Caption = 'Descri'#231#227'o'
          Width = 99
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PERCENTAGEM'
          Title.Caption = 'Percentual'
          Width = 77
          Visible = True
        end>
    end
  end
  inherited Panel2: TPanel
    Top = 205
    Width = 273
    ExplicitTop = 205
    ExplicitWidth = 273
    inherited bt_cancelar: TAdvGlassButton
      Left = 138
      Width = 136
      ExplicitLeft = 138
      ExplicitWidth = 136
    end
    inherited bt_selecionar: TAdvGlassButton
      Width = 136
      ExplicitWidth = 136
    end
  end
end
