inherited frmCsGruposTouch: TfrmCsGruposTouch
  Left = 396
  Top = 51
  Caption = 'Consulta grupos touch'
  ClientHeight = 551
  ClientWidth = 532
  ExplicitWidth = 544
  ExplicitHeight = 589
  TextHeight = 13
  inherited Panel3: TPanel
    Width = 532
    Height = 3
    ExplicitWidth = 528
    ExplicitHeight = 3
    inherited Label1: TLabel
      Top = -55
      Visible = False
      ExplicitTop = -55
    end
    inherited ed_parametro: TEdit
      Top = -42
      Visible = False
      ExplicitTop = -42
    end
    inherited RadioGroup1: TRadioGroup
      Top = -91
      Visible = False
      ExplicitTop = -91
    end
  end
  inherited Panel1: TPanel
    Top = 3
    Width = 532
    Height = 490
    ExplicitTop = 3
    ExplicitWidth = 528
    ExplicitHeight = 489
    inherited DBGrid1: TDBGrid
      Width = 532
      Height = 490
      Font.Height = -19
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
      OnDrawColumnCell = DBGrid1DrawColumnCell
      Columns = <
        item
          Expanded = False
          FieldName = 'CODIGO'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -24
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          Title.Caption = 'C'#243'd'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -19
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Width = 66
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DESCRICAO'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -24
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          Title.Caption = 'Descri'#231#227'o'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -19
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Width = 431
          Visible = True
        end>
    end
  end
  inherited Panel2: TPanel
    Top = 493
    Width = 532
    Height = 58
    ExplicitTop = 492
    ExplicitWidth = 528
    ExplicitHeight = 58
    inherited bt_cancelar: TAdvGlassButton
      Top = 4
      Width = 175
      Height = 54
      ExplicitTop = 4
      ExplicitWidth = 175
      ExplicitHeight = 54
    end
    inherited bt_selecionar: TAdvGlassButton
      Left = 173
      Top = 4
      Width = 175
      Height = 54
      ExplicitLeft = 173
      ExplicitTop = 4
      ExplicitWidth = 175
      ExplicitHeight = 54
    end
  end
end
