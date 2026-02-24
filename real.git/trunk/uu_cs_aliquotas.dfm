inherited frmCsAliquotas: TfrmCsAliquotas
  Left = 409
  Top = 208
  Caption = 'Consulta de Al'#237'quotas'
  ClientHeight = 268
  ClientWidth = 277
  OldCreateOrder = True
  Position = poScreenCenter
  ExplicitWidth = 285
  ExplicitHeight = 295
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel3: TPanel
    Width = 277
    Height = 1
    ExplicitWidth = 277
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
    Width = 277
    Height = 229
    ExplicitTop = 1
    ExplicitWidth = 277
    ExplicitHeight = 229
    inherited DBGrid1: TDBGrid
      Width = 269
      Height = 221
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
    Top = 230
    Width = 277
    ExplicitTop = 230
    ExplicitWidth = 277
    inherited bt_selecionar: TBitBtn
      Width = 136
      ExplicitWidth = 136
    end
    inherited bt_cancelar: TBitBtn
      Left = 138
      Width = 136
      ExplicitLeft = 138
      ExplicitWidth = 136
    end
  end
end
