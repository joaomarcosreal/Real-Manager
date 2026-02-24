inherited frmCsCSTPISCOFINS: TfrmCsCSTPISCOFINS
  Left = 459
  Top = 173
  Caption = 'Consulta de Situa'#231#227'o Tribut'#225'ria do Pis / Cofins'
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel3: TPanel
    Tag = 99
    Height = 48
    Color = clBlack
    ExplicitHeight = 48
    inherited Label1: TLabel
      Top = -40
      ExplicitTop = -40
    end
    object Label2: TLabel [1]
      Tag = 99
      Left = 53
      Top = 9
      Width = 390
      Height = 29
      Caption = 'Situa'#231#227'o Tribut'#225'ria do PIS / COFINS'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clYellow
      Font.Height = -24
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    inherited ed_parametro: TEdit
      Top = -27
      Visible = False
      ExplicitTop = -27
    end
    inherited RadioGroup1: TRadioGroup
      Top = -76
      Visible = False
      ExplicitTop = -76
    end
  end
  inherited Panel1: TPanel
    Top = 48
    Height = 146
    ExplicitTop = 48
    ExplicitHeight = 146
    inherited DBGrid1: TDBGrid
      Height = 294
      OnDrawColumnCell = DBGrid1DrawColumnCell
      Columns = <
        item
          Expanded = False
          FieldName = 'CST'
          Title.Caption = 'C'#243'digo'
          Width = 60
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DESCRICAO'
          Title.Caption = 'Descri'#231#227'o'
          Width = 380
          Visible = True
        end>
    end
  end
  inherited Panel2: TPanel
    Top = 194
    Height = 48
    ExplicitTop = 194
    ExplicitHeight = 48
    inherited bt_selecionar: TBitBtn
      Top = 1
      Height = 48
      Font.Height = -16
      ParentFont = False
      ExplicitTop = 1
      ExplicitHeight = 48
    end
    inherited bt_cancelar: TBitBtn
      Top = 2
      Height = 47
      Font.Height = -16
      ParentFont = False
      ExplicitTop = 2
      ExplicitHeight = 47
    end
  end
end
