inherited frm_cs_itens: Tfrm_cs_itens
  Left = 115
  Top = 129
  Caption = 'Consulta de Mat'#233'rias-primas'
  ClientHeight = 480
  ClientWidth = 793
  OldCreateOrder = True
  Position = poScreenCenter
  ExplicitWidth = 801
  ExplicitHeight = 507
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel3: TPanel
    Width = 793
    Height = 57
    ExplicitWidth = 793
    ExplicitHeight = 57
    inherited Label1: TLabel
      Top = 18
      Width = 145
      Caption = 'Digite as iniciais do '#237'tem:'
      ExplicitTop = 18
      ExplicitWidth = 145
    end
    object Label2: TLabel [1]
      Left = 651
      Top = 4
      Width = 123
      Height = 13
      Caption = 'Estoque dentro dos limites'
    end
    object Label3: TLabel [2]
      Left = 651
      Top = 21
      Width = 113
      Height = 13
      Caption = 'Estoque abaixo do ideal'
    end
    object Label4: TLabel [3]
      Left = 651
      Top = 38
      Width = 136
      Height = 13
      Caption = 'Estoque zerado ou negativo.'
    end
    inherited ed_parametro: TEdit
      Top = 33
      Width = 318
      ExplicitTop = 33
      ExplicitWidth = 318
    end
    inherited RadioGroup1: TRadioGroup
      Left = -5
      Top = -45
      Visible = False
      ExplicitLeft = -5
      ExplicitTop = -45
    end
    object Panel4: TPanel
      Tag = 99
      Left = 631
      Top = 3
      Width = 16
      Height = 15
      Color = clGreen
      TabOrder = 2
    end
    object Panel5: TPanel
      Tag = 99
      Left = 631
      Top = 20
      Width = 16
      Height = 15
      Color = clYellow
      TabOrder = 3
    end
    object Panel6: TPanel
      Tag = 99
      Left = 631
      Top = 37
      Width = 16
      Height = 15
      Color = clRed
      TabOrder = 4
    end
  end
  inherited Panel1: TPanel
    Top = 57
    Width = 793
    Height = 423
    ExplicitTop = 57
    ExplicitWidth = 793
    ExplicitHeight = 423
    inherited DBGrid1: TDBGrid
      Left = 5
      Top = 6
      Width = 782
      Height = 334
      OnDrawColumnCell = DBGrid1DrawColumnCell
      Columns = <
        item
          Expanded = False
          FieldName = 'COD_PRODUTO'
          Title.Caption = 'C'#243'digo'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DESCRICAO'
          Title.Caption = 'Descri'#231#227'o'
          Width = 252
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ESTOQUE_ATUAL'
          Title.Caption = 'Estoque atual'
          Width = 300
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DESC_UNIDADE'
          Title.Caption = 'Unidade'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'DESC_GRUPO'
          Title.Caption = 'Grupo'
          Width = 186
          Visible = True
        end>
    end
  end
  inherited Panel2: TPanel
    Left = 3
    Top = 403
    Width = 793
    Height = 77
    Align = alNone
    ExplicitLeft = 3
    ExplicitTop = 403
    ExplicitWidth = 793
    ExplicitHeight = 77
    inherited bt_selecionar: TBitBtn
      Top = 5
      Width = 366
      Height = 69
      ExplicitTop = 5
      ExplicitWidth = 366
      ExplicitHeight = 69
    end
    inherited bt_cancelar: TBitBtn
      Left = 369
      Top = 6
      Width = 421
      Height = 67
      ExplicitLeft = 369
      ExplicitTop = 6
      ExplicitWidth = 421
      ExplicitHeight = 67
    end
  end
end
