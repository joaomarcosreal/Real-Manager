inherited frm_cs_formas_pagto: Tfrm_cs_formas_pagto
  Left = 180
  Top = 139
  Width = 354
  Height = 573
  Caption = 'Consulta de formas de pagamento'
  OldCreateOrder = True
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel3: TPanel
    Width = 346
    Height = 55
    inherited Label1: TLabel
      Top = 4
      Width = 231
      Caption = 'Digite as iniciais da forma de pagamento'
    end
    inherited ed_parametro: TEdit
      Top = 17
      Width = 334
      Height = 32
      Font.Height = -19
      ParentFont = False
    end
    inherited RadioGroup1: TRadioGroup
      Left = -5
      Top = -54
      Visible = False
    end
  end
  inherited Panel1: TPanel
    Top = 55
    Width = 346
    Height = 491
    inherited DBGrid1: TDBGrid
      Top = 6
      Width = 342
      Height = 479
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
          Width = 56
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
          Width = 237
          Visible = True
        end>
    end
  end
  inherited Panel2: TPanel
    Top = -40
    Width = 389
    Align = alNone
    Visible = False
    inherited bt_selecionar: TBitBtn
      Width = 136
    end
    inherited bt_cancelar: TBitBtn
      Left = 138
      Width = 134
    end
  end
end
