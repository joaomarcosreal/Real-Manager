inherited frmCsSaboresPizza: TfrmCsSaboresPizza
  Left = 422
  Top = 110
  Caption = 'Consulta de sabores de pizza'
  ClientHeight = 625
  ClientWidth = 518
  ExplicitWidth = 530
  ExplicitHeight = 663
  TextHeight = 13
  inherited Panel3: TPanel
    Top = 41
    Width = 518
    Height = 72
    ExplicitTop = 41
    ExplicitWidth = 514
    ExplicitHeight = 72
    inherited Label1: TLabel
      Top = 8
      Width = 206
      Height = 20
      Caption = 'Digite as iniciais do sabor'
      Font.Height = -16
      ExplicitTop = 8
      ExplicitWidth = 206
      ExplicitHeight = 20
    end
    inherited ed_parametro: TEdit
      Left = 0
      Top = 31
      Width = 518
      Height = 32
      Font.Height = -19
      ParentFont = False
      ExplicitLeft = 0
      ExplicitTop = 31
      ExplicitWidth = 518
      ExplicitHeight = 32
    end
    inherited RadioGroup1: TRadioGroup
      Left = -5
      Top = -45
      Visible = False
      ExplicitLeft = -5
      ExplicitTop = -45
    end
  end
  inherited Panel1: TPanel
    Top = 113
    Width = 518
    Height = 453
    ExplicitTop = 113
    ExplicitWidth = 514
    ExplicitHeight = 452
    inherited DBGrid1: TDBGrid
      Width = 518
      Height = 453
      Font.Height = -20
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
      OnDrawColumnCell = DBGrid1DrawColumnCell
      Columns = <
        item
          Expanded = False
          FieldName = 'CODIGO'
          Title.Caption = 'C'#243'digo'
          Width = 68
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DESCRICAO'
          Title.Caption = 'Descri'#231#227'o'
          Width = 418
          Visible = True
        end>
    end
  end
  inherited Panel2: TPanel
    Top = 566
    Width = 518
    Height = 59
    ExplicitTop = 565
    ExplicitWidth = 514
    ExplicitHeight = 59
    inherited bt_cancelar: TAdvGlassButton
      Left = 359
      Top = 4
      Width = 159
      Height = 55
      ExplicitLeft = 359
      ExplicitTop = 4
      ExplicitWidth = 159
      ExplicitHeight = 55
    end
    inherited bt_selecionar: TAdvGlassButton
      Left = 196
      Top = 4
      Width = 159
      Height = 55
      ExplicitLeft = 196
      ExplicitTop = 4
      ExplicitWidth = 159
      ExplicitHeight = 55
    end
  end
  object Panel4: TPanel
    Tag = 99
    Left = 0
    Top = 0
    Width = 518
    Height = 41
    Align = alTop
    Color = 12615680
    ParentBackground = False
    TabOrder = 3
    ExplicitWidth = 514
    object lbTitulo: TLabel
      Left = 10
      Top = 6
      Width = 735
      Height = 33
      AutoSize = False
      Caption = 'Consulta sabores de pizzas'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -27
      Font.Name = 'Calibri'
      Font.Style = []
      ParentFont = False
    end
  end
end
