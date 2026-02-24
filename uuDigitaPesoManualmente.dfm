inherited frmDigitaPesoManualmente: TfrmDigitaPesoManualmente
  Left = 506
  Top = 94
  BorderIcons = []
  Caption = 'Informe o peso'
  ClientHeight = 586
  ClientWidth = 422
  OnCloseQuery = FormCloseQuery
  ExplicitWidth = 438
  ExplicitHeight = 625
  TextHeight = 13
  inherited botao_pesquisa: TSpeedButton
    Top = -35
    ExplicitTop = -35
  end
  inherited Edit1: TEdit
    Top = -32
    ExplicitTop = -32
  end
  object Panel2: TPanel [2]
    Left = 0
    Top = 65
    Width = 422
    Height = 128
    Align = alTop
    BevelOuter = bvNone
    Caption = 'Panel2'
    Color = clWhite
    ParentBackground = False
    TabOrder = 1
    StyleElements = []
    object ed_quantidade: TCurrencyEdit
      Left = 4
      Top = 6
      Width = 414
      Height = 106
      AutoSize = False
      BorderStyle = bsNone
      Color = clBlack
      DecimalPlaces = 3
      DisplayFormat = ',0.000;-,0.000'
      Font.Charset = ANSI_CHARSET
      Font.Color = 16776176
      Font.Height = -87
      Font.Name = 'Arial Narrow'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      OnKeyDown = ed_quantidadeKeyDown
    end
  end
  object Panel8: TPanel [3]
    Tag = 99
    Left = 0
    Top = 0
    Width = 422
    Height = 65
    Align = alTop
    Color = 12615680
    ParentBackground = False
    TabOrder = 2
    StyleElements = []
    object lbTitulo: TLabel
      Left = 1
      Top = 1
      Width = 424
      Height = 63
      Align = alClient
      Alignment = taCenter
      AutoSize = False
      Caption = 'Digite o peso'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -35
      Font.Name = 'Calibri'
      Font.Style = [fsBold]
      ParentFont = False
      Layout = tlCenter
      StyleElements = []
      ExplicitLeft = 0
      ExplicitTop = 4
    end
  end
  object Panel1: TPanel [4]
    Left = 0
    Top = 193
    Width = 422
    Height = 393
    Align = alClient
    BevelOuter = bvNone
    Color = clWhite
    ParentBackground = False
    TabOrder = 3
    StyleElements = []
    object AdvSmoothTouchKeyBoard2: TAdvSmoothTouchKeyBoard
      AlignWithMargins = True
      Left = 31
      Top = 6
      Width = 362
      Height = 374
      Text = ''
      AutoCompletion.Font.Charset = DEFAULT_CHARSET
      AutoCompletion.Font.Color = clWhite
      AutoCompletion.Font.Height = -19
      AutoCompletion.Font.Name = 'Tahoma'
      AutoCompletion.Font.Style = []
      AutoCompletion.Color = clBlack
      Fill.ColorMirror = clNone
      Fill.ColorMirrorTo = clNone
      Fill.GradientType = gtVertical
      Fill.GradientMirrorType = gtSolid
      Fill.BorderColor = clNone
      Fill.Rounding = 0
      Fill.ShadowOffset = 0
      Fill.Glow = gmNone
      KeyboardType = ktCustom
      Keys = <
        item
          Caption = '7'
          KeyValue = -1
          ShiftKeyValue = -1
          AltGrKeyValue = -1
          SpecialKey = skNone
          BorderColor = clGray
          Color = 12615680
          X = 0
          Y = 0
          Height = 93
          Width = 90
          SubKeys = <>
        end
        item
          Caption = '4'
          KeyValue = -1
          ShiftKeyValue = -1
          AltGrKeyValue = -1
          SpecialKey = skNone
          BorderColor = clGray
          Color = 12615680
          X = 0
          Y = 93
          Height = 93
          Width = 90
          SubKeys = <>
        end
        item
          Caption = '1'
          KeyValue = -1
          ShiftKeyValue = -1
          AltGrKeyValue = -1
          SpecialKey = skNone
          BorderColor = clGray
          Color = 12615680
          X = 0
          Y = 185
          Height = 93
          Width = 90
          SubKeys = <>
        end
        item
          Caption = '8'
          KeyValue = -1
          ShiftKeyValue = -1
          AltGrKeyValue = -1
          SpecialKey = skNone
          BorderColor = clGray
          Color = 12615680
          X = 90
          Y = 0
          Height = 93
          Width = 90
          SubKeys = <>
        end
        item
          Caption = '5'
          KeyValue = -1
          ShiftKeyValue = -1
          AltGrKeyValue = -1
          SpecialKey = skNone
          BorderColor = clGray
          Color = 12615680
          X = 90
          Y = 93
          Height = 93
          Width = 90
          SubKeys = <>
        end
        item
          Caption = '2'
          KeyValue = -1
          ShiftKeyValue = -1
          AltGrKeyValue = -1
          SpecialKey = skNone
          BorderColor = clGray
          Color = 12615680
          X = 90
          Y = 185
          Height = 93
          Width = 90
          SubKeys = <>
        end
        item
          Caption = '9'
          KeyValue = -1
          ShiftKeyValue = -1
          AltGrKeyValue = -1
          SpecialKey = skNone
          BorderColor = clGray
          Color = 12615680
          X = 180
          Y = 0
          Height = 93
          Width = 90
          SubKeys = <>
        end
        item
          Caption = 'Apagar'
          KeyValue = 8
          ShiftKeyValue = -1
          AltGrKeyValue = -1
          SpecialKey = skBackSpace
          BorderColor = clGray
          Color = 12615680
          X = 270
          Y = 0
          Height = 93
          Width = 90
          SubKeys = <>
        end
        item
          Caption = '.'
          KeyValue = -1
          ShiftKeyValue = -1
          AltGrKeyValue = -1
          SpecialKey = skNone
          BorderColor = clGray
          Color = 12615680
          X = 270
          Y = 93
          Height = 93
          Width = 90
          SubKeys = <>
        end
        item
          Caption = '6'
          KeyValue = -1
          ShiftKeyValue = -1
          AltGrKeyValue = -1
          SpecialKey = skNone
          BorderColor = clGray
          Color = 12615680
          X = 180
          Y = 93
          Height = 93
          Width = 90
          SubKeys = <>
        end
        item
          Caption = '3'
          KeyValue = -1
          ShiftKeyValue = -1
          AltGrKeyValue = -1
          SpecialKey = skNone
          BorderColor = clGray
          Color = 12615680
          X = 180
          Y = 185
          Height = 93
          Width = 90
          SubKeys = <>
        end
        item
          Caption = ','
          KeyValue = -1
          ShiftKeyValue = -1
          AltGrKeyValue = -1
          SpecialKey = skNone
          BorderColor = clGray
          Color = 12615680
          X = 180
          Y = 278
          Height = 93
          Width = 90
          SubKeys = <>
        end
        item
          Caption = '0'
          KeyValue = -1
          ShiftKeyValue = -1
          AltGrKeyValue = -1
          SpecialKey = skNone
          BorderColor = clGray
          Color = 12615680
          X = 0
          Y = 278
          Height = 93
          Width = 180
          SubKeys = <>
        end
        item
          Caption = 'Entra'
          KeyValue = 13
          ShiftKeyValue = 13
          AltGrKeyValue = 13
          SpecialKey = skReturn
          BorderColor = clGray
          Color = 12615680
          X = 270
          Y = 185
          Height = 185
          Width = 90
          SubKeys = <>
        end>
      SmallFont.Charset = DEFAULT_CHARSET
      SmallFont.Color = clWindowText
      SmallFont.Height = -9
      SmallFont.Name = 'Tahoma'
      SmallFont.Style = []
      Version = '1.9.3.0'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -21
      Font.Name = 'MS Sans Serif'
      Font.Style = []
    end
  end
end
