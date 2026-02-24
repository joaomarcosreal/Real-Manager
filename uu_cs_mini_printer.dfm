inherited frm_cs_miniprinters: Tfrm_cs_miniprinters
  Caption = 'Consulta de mini-printer'#180's '
  ClientWidth = 329
  Position = poScreenCenter
  ExplicitWidth = 341
  TextHeight = 13
  inherited Panel3: TPanel
    Width = 329
    Height = 41
    ExplicitWidth = 325
    ExplicitHeight = 41
    inherited Label1: TLabel
      Top = 4
      Width = 182
      Caption = 'Digite as iniciais da mini printer:'
      ExplicitTop = 4
      ExplicitWidth = 182
    end
    inherited ed_parametro: TEdit
      Top = 17
      ExplicitTop = 17
    end
    inherited RadioGroup1: TRadioGroup
      Left = -21
      Top = -39
      Visible = False
      ExplicitLeft = -21
      ExplicitTop = -39
    end
  end
  inherited Panel1: TPanel
    Top = 41
    Width = 329
    Height = 176
    ExplicitTop = 41
    ExplicitWidth = 325
    ExplicitHeight = 175
    inherited DBGrid1: TDBGrid
      Width = 329
      Height = 176
      Columns = <
        item
          Expanded = False
          FieldName = 'COD_miniprinter'
          Title.Caption = 'C'#243'digo'
          Width = 44
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DESCRICAO'
          Title.Caption = 'Descri'#231#227'o'
          Width = 241
          Visible = True
        end>
    end
  end
  inherited Panel2: TPanel
    Width = 329
    ExplicitWidth = 329
    inherited bt_cancelar: TAdvGlassButton
      Left = 165
      Top = 3
      Width = 163
      ExplicitLeft = 165
      ExplicitTop = 3
      ExplicitWidth = 163
    end
    inherited bt_selecionar: TAdvGlassButton
      Left = 3
      Top = 3
      Width = 163
      ExplicitLeft = 3
      ExplicitTop = 3
      ExplicitWidth = 163
    end
  end
end
