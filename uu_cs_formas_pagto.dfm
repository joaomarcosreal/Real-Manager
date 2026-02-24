inherited frm_cs_formas_pagto: Tfrm_cs_formas_pagto
  Left = 180
  Top = 139
  Caption = 'Consulta de formas de pagamento'
  ClientHeight = 556
  ClientWidth = 414
  Position = poScreenCenter
  ExplicitWidth = 426
  ExplicitHeight = 594
  TextHeight = 13
  inherited Panel3: TPanel
    Width = 414
    Height = 77
    ExplicitWidth = 414
    ExplicitHeight = 77
    inherited Label1: TLabel
      Left = 0
      Top = 20
      Width = 231
      Caption = 'Digite as iniciais da forma de pagamento'
      ExplicitLeft = 0
      ExplicitTop = 20
      ExplicitWidth = 231
    end
    inherited ed_parametro: TEdit
      Left = 0
      Top = 39
      Width = 414
      Height = 32
      Font.Height = -19
      ParentFont = False
      ExplicitLeft = 0
      ExplicitTop = 39
      ExplicitWidth = 414
      ExplicitHeight = 32
    end
    inherited RadioGroup1: TRadioGroup
      Left = -5
      Top = -54
      Visible = False
      ExplicitLeft = -5
      ExplicitTop = -54
    end
  end
  inherited Panel1: TPanel
    Top = 77
    Width = 414
    Height = 417
    ExplicitTop = 55
    ExplicitWidth = 414
    ExplicitHeight = 443
    inherited DBGrid1: TDBGrid
      Width = 414
      Height = 417
      Font.Charset = ANSI_CHARSET
      Font.Height = -24
      Font.Name = 'Nina'
      OnDrawColumnCell = DBGrid1DrawColumnCell
      OnKeyDown = DBGrid1KeyDown
      Columns = <
        item
          Expanded = False
          FieldName = 'COD_FORMA'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -24
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          Title.Caption = 'C'#243'digo'
          Width = 61
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
          Width = 322
          Visible = True
        end>
    end
  end
  inherited Panel2: TPanel
    Top = 494
    Width = 414
    Visible = False
    ExplicitLeft = 21
    ExplicitTop = 312
    ExplicitWidth = 389
    inherited bt_cancelar: TAdvGlassButton
      Left = 278
      Top = 6
      Width = 136
      ExplicitLeft = 278
      ExplicitTop = 6
      ExplicitWidth = 136
    end
    inherited bt_selecionar: TAdvGlassButton
      Left = 136
      Top = 6
      Width = 136
      ExplicitLeft = 136
      ExplicitTop = 6
      ExplicitWidth = 136
    end
  end
end
