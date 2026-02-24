inherited frmCsSubMaterias: TfrmCsSubMaterias
  Left = 35
  Top = 91
  ClientHeight = 494
  ClientWidth = 979
  ExplicitWidth = 995
  ExplicitHeight = 533
  TextHeight = 13
  inherited Panel3: TPanel
    Left = -2
    Top = 65
    Width = 983
    Height = 66
    Align = alNone
    ExplicitLeft = -2
    ExplicitTop = 65
    ExplicitWidth = 983
    ExplicitHeight = 66
    inherited Label1: TLabel
      Left = 4
      Top = 12
      Width = 200
      Height = 20
      Caption = 'Digite as iniciais do '#237'tem:'
      Font.Height = -16
      ExplicitLeft = 4
      ExplicitTop = 12
      ExplicitWidth = 200
      ExplicitHeight = 20
    end
    inherited ed_parametro: TEdit
      Top = 33
      Width = 326
      Height = 28
      Font.Height = -16
      ParentFont = False
      ExplicitTop = 33
      ExplicitWidth = 326
      ExplicitHeight = 28
    end
    inherited RadioGroup1: TRadioGroup
      Left = 27
      Top = -40
      ExplicitLeft = 27
      ExplicitTop = -40
    end
  end
  inherited Panel1: TPanel
    Left = 231
    Top = 106
    Width = 983
    Height = 376
    Align = alNone
    ExplicitLeft = 231
    ExplicitTop = 106
    ExplicitWidth = 983
    ExplicitHeight = 376
    inherited DBGrid1: TDBGrid
      Width = 983
      Height = 376
      Font.Height = -16
      Columns = <
        item
          Expanded = False
          FieldName = 'COD_PRODUTO'
          Title.Caption = 'C'#243'digo'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -16
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Width = 74
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DESCRICAO'
          Title.Caption = 'Descri'#231#227'o'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -16
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Width = 428
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ESTOQUE'
          Title.Caption = 'Estoque'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -16
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Width = 109
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DESC_UNIDADE'
          Title.Caption = 'Unidade'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -16
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Width = 161
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DESC_GRUPO'
          Title.Caption = 'Grupo'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -16
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Width = 166
          Visible = True
        end>
    end
  end
  inherited Panel2: TPanel
    Top = 441
    Width = 979
    Height = 53
    ExplicitTop = 441
    ExplicitWidth = 979
    ExplicitHeight = 53
    inherited bt_cancelar: TAdvGlassButton
      Left = 494
      Top = 3
      Width = 491
      Height = 48
      ExplicitLeft = 494
      ExplicitTop = 3
      ExplicitWidth = 491
      ExplicitHeight = 48
    end
    inherited bt_selecionar: TAdvGlassButton
      Top = 2
      Width = 491
      Height = 49
      ExplicitTop = 2
      ExplicitWidth = 491
      ExplicitHeight = 49
    end
  end
  object Panel4: TPanel
    Tag = 99
    Left = 0
    Top = 0
    Width = 979
    Height = 62
    Align = alTop
    Color = 12615680
    ParentBackground = False
    TabOrder = 3
    object lbTitulo: TLabel
      Left = 10
      Top = 6
      Width = 735
      Height = 33
      AutoSize = False
      Caption = 'Consulta de subprodutos'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -27
      Font.Name = 'Calibri'
      Font.Style = []
      ParentFont = False
    end
  end
end
