inherited frm_cs_garcons: Tfrm_cs_garcons
  Left = 426
  Top = 212
  Caption = 'Consulta de Gar'#231'ons / Metres'
  ClientHeight = 574
  ClientWidth = 609
  Position = poOwnerFormCenter
  ExplicitWidth = 621
  ExplicitHeight = 612
  TextHeight = 13
  inherited Panel3: TPanel
    Top = 40
    Width = 609
    Height = 72
    ExplicitTop = 40
    ExplicitWidth = 605
    ExplicitHeight = 72
    inherited Label1: TLabel
      Left = 6
      Top = 11
      Width = 220
      Height = 20
      Caption = 'Digite as iniciais do gar'#231'om'
      Font.Height = -16
      ExplicitLeft = 6
      ExplicitTop = 11
      ExplicitWidth = 220
      ExplicitHeight = 20
    end
    inherited ed_parametro: TEdit
      Left = 4
      Top = 34
      Width = 589
      Height = 32
      Font.Height = -19
      ParentFont = False
      ExplicitLeft = 4
      ExplicitTop = 34
      ExplicitWidth = 589
      ExplicitHeight = 32
    end
    inherited RadioGroup1: TRadioGroup
      Top = -52
      ExplicitTop = -52
    end
  end
  inherited Panel1: TPanel
    Top = 112
    Width = 609
    Height = 404
    ExplicitTop = 112
    ExplicitWidth = 605
    ExplicitHeight = 403
    inherited DBGrid1: TDBGrid
      Width = 609
      Height = 404
      Font.Charset = ANSI_CHARSET
      Font.Height = -25
      Font.Name = 'Arial'
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
      OnDrawColumnCell = DBGrid1DrawColumnCell
      Columns = <
        item
          Expanded = False
          FieldName = 'COD_GARCON'
          Title.Caption = 'C'#243'digo'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -19
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Width = 91
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'APELIDO'
          Title.Caption = 'Nome'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -19
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Width = 643
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'APELIDO1'
          Title.Caption = 'Metre respons'#225'vel'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -19
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Visible = False
        end>
    end
  end
  inherited Panel2: TPanel
    Top = 516
    Width = 609
    Height = 58
    ExplicitTop = 515
    ExplicitWidth = 605
    ExplicitHeight = 58
    inherited bt_cancelar: TAdvGlassButton
      Left = 439
      Width = 160
      ExplicitLeft = 439
      ExplicitWidth = 160
    end
    inherited bt_selecionar: TAdvGlassButton
      Left = 277
      Width = 160
      Height = 51
      ExplicitLeft = 277
      ExplicitWidth = 160
      ExplicitHeight = 51
    end
  end
  object Panel4: TPanel
    Tag = 99
    Left = 0
    Top = 0
    Width = 609
    Height = 40
    Align = alTop
    BevelOuter = bvNone
    Color = 12615680
    ParentBackground = False
    TabOrder = 3
    ExplicitWidth = 605
    object Label3: TLabel
      Left = 6
      Top = 7
      Width = 224
      Height = 33
      Caption = 'Consulta de gar'#231'ons'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -27
      Font.Name = 'Calibri'
      Font.Style = [fsBold]
      ParentFont = False
    end
  end
end
