inherited frmCsMotivosEstorno: TfrmCsMotivosEstorno
  Left = 459
  Top = 317
  Caption = 'Consulta de Motivos de Estorno'
  ClientHeight = 273
  ClientWidth = 323
  Position = poScreenCenter
  ExplicitWidth = 339
  ExplicitHeight = 312
  TextHeight = 13
  inherited Panel3: TPanel
    Width = 323
    Height = 2
    Visible = False
    ExplicitWidth = 323
    ExplicitHeight = 2
    inherited Label1: TLabel
      Top = 10
      ExplicitTop = 10
    end
    inherited ed_parametro: TEdit
      Top = 23
      Visible = False
      ExplicitTop = 23
    end
    inherited RadioGroup1: TRadioGroup
      Top = -41
      ExplicitTop = -41
    end
  end
  inherited Panel1: TPanel
    Top = 2
    Width = 323
    Height = 209
    ExplicitTop = 2
    ExplicitWidth = 323
    ExplicitHeight = 209
    inherited DBGrid1: TDBGrid
      Width = 327
      Height = 210
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
          FieldName = 'DESCRICAO'
          Title.Caption = 'Descricao'
          Width = 250
          Visible = True
        end>
    end
  end
  inherited Panel2: TPanel
    Top = 211
    Width = 323
    ExplicitTop = 211
    ExplicitWidth = 323
    inherited bt_cancelar: TAdvGlassButton
      Left = 164
      Width = 160
      ExplicitLeft = 164
      ExplicitWidth = 160
    end
    inherited bt_selecionar: TAdvGlassButton
      Width = 160
      ExplicitWidth = 160
    end
  end
end
