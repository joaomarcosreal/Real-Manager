object frm_controle: Tfrm_controle
  Left = 169
  Top = 75
  Width = 277
  Height = 470
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Button1: TButton
    Left = 5
    Top = 12
    Width = 249
    Height = 57
    Caption = 'CAPTURAR DADOS'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 4
    Top = 80
    Width = 249
    Height = 57
    Caption = 'Relat'#243'rios'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 3
    Top = 145
    Width = 249
    Height = 57
    Caption = 'SAIR'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 2
    OnClick = Button3Click
  end
  object Memo1: TMemo
    Left = 12
    Top = 208
    Width = 237
    Height = 217
    Lines.Strings = (
      'Memo1')
    TabOrder = 3
  end
end
