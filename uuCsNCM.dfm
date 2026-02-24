inherited frmCsNCM: TfrmCsNCM
  Left = 347
  Top = 198
  Caption = 'Consulta de NCM'
  ClientHeight = 483
  ClientWidth = 841
  ExplicitWidth = 857
  ExplicitHeight = 522
  TextHeight = 13
  inherited Panel3: TPanel
    Top = 48
    Width = 841
    Height = 63
    ExplicitTop = 48
    ExplicitWidth = 841
    ExplicitHeight = 63
    inherited Label1: TLabel
      Left = 4
      Top = 5
      Width = 213
      Height = 20
      Caption = 'Digite a descri'#231#227'o do NCM'
      Font.Height = -16
      ExplicitLeft = 4
      ExplicitTop = 5
      ExplicitWidth = 213
      ExplicitHeight = 20
    end
    inherited ed_parametro: TEdit
      Top = 25
      Width = 834
      Height = 33
      Font.Height = -21
      ParentFont = False
      ExplicitTop = 25
      ExplicitWidth = 834
      ExplicitHeight = 33
    end
    inherited RadioGroup1: TRadioGroup
      Top = -42
      Visible = False
      ExplicitTop = -42
    end
  end
  inherited Panel1: TPanel
    Top = 111
    Width = 841
    Height = 316
    ExplicitTop = 111
    ExplicitWidth = 841
    ExplicitHeight = 316
    inherited DBGrid1: TDBGrid
      Width = 845
      Height = 317
      Font.Height = -16
      TitleFont.Height = -16
      Columns = <
        item
          Expanded = False
          FieldName = 'NCM'
          Width = 89
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DESCRICAO'
          Title.Caption = 'Descri'#231#227'o'
          Width = 723
          Visible = True
        end>
    end
  end
  inherited Panel2: TPanel
    Top = 427
    Width = 841
    Height = 56
    ExplicitTop = 427
    ExplicitWidth = 841
    ExplicitHeight = 56
    inherited bt_cancelar: TAdvGlassButton
      Left = 637
      Width = 201
      Height = 48
      ExplicitLeft = 637
      ExplicitWidth = 201
      ExplicitHeight = 48
    end
    inherited bt_selecionar: TAdvGlassButton
      Left = 419
      Width = 212
      Height = 48
      ExplicitLeft = 419
      ExplicitWidth = 212
      ExplicitHeight = 48
    end
  end
  object Panel4: TPanel
    Tag = 99
    Left = 0
    Top = 0
    Width = 841
    Height = 48
    Align = alTop
    Color = 12615680
    ParentBackground = False
    TabOrder = 3
    object lbTitulo: TLabel
      Left = 10
      Top = 7
      Width = 735
      Height = 33
      AutoSize = False
      Caption = 'Consulta de NCM (Nomeclatura comum no Mercosul)'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -27
      Font.Name = 'Calibri'
      Font.Style = []
      ParentFont = False
    end
  end
end
