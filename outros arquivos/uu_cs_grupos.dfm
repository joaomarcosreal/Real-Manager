inherited frm_cs_grupos: Tfrm_cs_grupos
  Caption = 'Consulta de grupos'
  ClientHeight = 650
  ClientWidth = 555
  ExplicitWidth = 567
  ExplicitHeight = 688
  TextHeight = 13
  inherited Panel3: TPanel
    Width = 555
    Height = 41
    ExplicitWidth = 468
    ExplicitHeight = 41
    inherited Label1: TLabel
      Top = 4
      ExplicitTop = 4
    end
    inherited ed_parametro: TEdit
      Top = 17
      Width = 552
      ExplicitTop = 17
      ExplicitWidth = 552
    end
    inherited RadioGroup1: TRadioGroup
      Left = 51
      Top = -42
      Visible = False
      ExplicitLeft = 51
      ExplicitTop = -42
    end
  end
  inherited Panel1: TPanel
    Top = 41
    Width = 555
    Height = 555
    ExplicitTop = 41
    ExplicitWidth = 468
    ExplicitHeight = 356
    inherited DBGrid1: TDBGrid
      Width = 555
      Height = 555
      OnDrawColumnCell = DBGrid1DrawColumnCell
      Columns = <
        item
          Expanded = False
          FieldName = 'COD_GRUPO'
          Title.Caption = 'C'#243'digo'
          Width = 74
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DESCRICAO'
          Title.Caption = 'Descri'#231#227'o'
          Width = 451
          Visible = True
        end>
    end
  end
  inherited Panel2: TPanel
    Top = 596
    Width = 555
    Height = 54
    ExplicitTop = 595
    ExplicitWidth = 555
    ExplicitHeight = 54
    inherited bt_cancelar: TAdvGlassButton
      Left = 353
      Top = 6
      Width = 202
      ExplicitLeft = 353
      ExplicitTop = 6
      ExplicitWidth = 202
    end
    inherited bt_selecionar: TAdvGlassButton
      Left = 145
      Top = 6
      Width = 202
      ExplicitLeft = 145
      ExplicitTop = 6
      ExplicitWidth = 202
    end
  end
end
