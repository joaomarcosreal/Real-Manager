object frm_modelo_relatorio_data: Tfrm_modelo_relatorio_data
  Left = 135
  Top = 177
  ClientHeight = 139
  ClientWidth = 328
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Panel4: TPanel
    Left = 0
    Top = 0
    Width = 328
    Height = 139
    Align = alClient
    TabOrder = 0
    object RadioGroup1: TRadioGroup
      Left = 13
      Top = 2
      Width = 290
      Height = 92
      Caption = 'Informe o Per'#237'odo'
      Color = clBtnFace
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Verdana'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
      TabOrder = 0
    end
    object Panel5: TPanel
      Left = 23
      Top = 20
      Width = 273
      Height = 67
      BevelOuter = bvNone
      TabOrder = 1
      object Label1: TLabel
        Left = 8
        Top = 1
        Width = 24
        Height = 16
        Caption = 'De:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label2: TLabel
        Left = 136
        Top = 0
        Width = 29
        Height = 16
        Caption = 'at'#233':'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object ed_data_inicial: TMaskEdit
        Left = 8
        Top = 16
        Width = 120
        Height = 32
        EditMask = '99/99/9999'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        MaxLength = 10
        ParentFont = False
        TabOrder = 0
        Text = '  /  /    '
      end
      object ed_data_final: TMaskEdit
        Left = 136
        Top = 15
        Width = 121
        Height = 32
        EditMask = '99/99/9999'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        MaxLength = 10
        ParentFont = False
        TabOrder = 1
        Text = '  /  /    '
      end
      object cbk_visualizar: TCheckBox
        Left = 135
        Top = 52
        Width = 153
        Height = 17
        Caption = 'Visualizar Relat'#243'rio'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 2
      end
    end
    object Panel2: TPanel
      Left = 1
      Top = 101
      Width = 326
      Height = 37
      Align = alBottom
      TabOrder = 2
      object bt_imprimir: TBitBtn
        Left = 0
        Top = 2
        Width = 161
        Height = 34
        Caption = 'Imprimir '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        OnClick = bt_imprimirClick
      end
      object bt_sair: TBitBtn
        Left = 163
        Top = 3
        Width = 161
        Height = 34
        Caption = 'Sair'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
      end
    end
  end
end
