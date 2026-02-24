inherited frmSelecionaAdquirente: TfrmSelecionaAdquirente
  Margins.Left = 0
  Margins.Top = 0
  Margins.Right = 0
  Margins.Bottom = 0
  BorderIcons = []
  ClientHeight = 591
  ClientWidth = 401
  ExplicitWidth = 413
  ExplicitHeight = 629
  TextHeight = 13
  object Panel1: TPanel [2]
    Tag = 99
    Left = 0
    Top = 0
    Width = 401
    Height = 73
    Align = alTop
    Anchors = [akTop, akRight]
    BevelOuter = bvNone
    Color = 12615680
    ParentBackground = False
    TabOrder = 1
    StyleElements = []
    ExplicitWidth = 426
    object lblTitulo: TLabel
      Left = 15
      Top = 21
      Width = 353
      Height = 45
      AutoSize = False
      Caption = 'Informe o NSU da opera'#231#227'o'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -27
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      StyleElements = []
    end
  end
  object Panel2: TPanel [3]
    Left = 0
    Top = 73
    Width = 401
    Height = 438
    Align = alClient
    BevelOuter = bvNone
    Color = clWhite
    ParentBackground = False
    TabOrder = 2
    StyleElements = []
    ExplicitWidth = 426
    object Panel4: TPanel
      Left = 0
      Top = 0
      Width = 401
      Height = 438
      Align = alClient
      BevelOuter = bvNone
      Caption = 'Panel4'
      Color = clWhite
      ParentBackground = False
      TabOrder = 0
      StyleElements = []
      ExplicitWidth = 426
      object Label1: TLabel
        Left = 35
        Top = 29
        Width = 198
        Height = 29
        Caption = 'NSU da opera'#231#227'o:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -24
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        StyleElements = []
      end
      object edNSUOperacao: TEdit
        Left = 34
        Top = 61
        Width = 275
        Height = 45
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -32
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        OnKeyDown = edNSUOperacaoKeyDown
      end
      object AdvSmoothTouchKeyBoard2: TAdvSmoothTouchKeyBoard
        AlignWithMargins = True
        Left = 32
        Top = 128
        Width = 282
        Height = 283
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
            Height = 70
            Width = 70
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
            Y = 70
            Height = 70
            Width = 70
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
            Y = 140
            Height = 70
            Width = 70
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
            X = 70
            Y = 0
            Height = 70
            Width = 70
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
            X = 70
            Y = 70
            Height = 70
            Width = 70
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
            X = 70
            Y = 140
            Height = 70
            Width = 70
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
            X = 140
            Y = 0
            Height = 70
            Width = 70
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
            X = 210
            Y = 0
            Height = 70
            Width = 70
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
            X = 210
            Y = 70
            Height = 70
            Width = 70
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
            X = 140
            Y = 70
            Height = 70
            Width = 70
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
            X = 140
            Y = 140
            Height = 70
            Width = 70
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
            X = 140
            Y = 210
            Height = 70
            Width = 70
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
            Y = 210
            Height = 70
            Width = 140
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
            X = 210
            Y = 140
            Height = 140
            Width = 70
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
  object Panel3: TPanel [4]
    Left = 0
    Top = 511
    Width = 401
    Height = 80
    Align = alBottom
    BevelOuter = bvNone
    Color = 15921906
    ParentBackground = False
    TabOrder = 3
    StyleElements = []
    ExplicitWidth = 426
    object btConfirmar: TAdvGlassButton
      Left = 35
      Top = -1
      Width = 285
      Height = 75
      BackColor = 12615680
      ButtonDirection = bdLeft
      Caption = 'Confirmar dados'
      CornerRadius = 0
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -21
      Font.Name = 'Tahoma'
      Font.Style = []
      ForeColor = clWhite
      GlowColor = 12615680
      ImageIndex = -1
      InnerBorderColor = clBlack
      OuterBorderColor = clWhite
      Picture.Data = {
        424DF60600000000000036000000280000001800000018000000010018000000
        000000000000EB0A0000EB0A00000000000000000000FFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FEFEFEF4F4F4E4E4E4E1E1E1EDEDEDFCFCFCFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFEFEFEECECECC0C0C0909090868686AAAAAADFDFDFFAFAFAFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFEFEFEECECEC9BB49B2F8D2F1B891D558155686868A0
        A0A0DEDEDEFAFAFAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEECECEC97B7970D931115B12C15B2
        2A0B9B154E874E656565A0A0A0DEDEDEFBFBFBFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEECECEC98B9980F9613
        17B22F13AD2B12AB2613AF270A9A144F874F656565A0A0A0DEDEDEFBFBFBFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEECECEC99
        BA990F9A141AB63616B03015AE2C14AD2914AD2714B02A0A9A144F864F656565
        A1A1A1DEDEDEFBFBFBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFE
        FEEDEDED9BBC9B109D151BB63B1AB43518B13116AF2F13AE2A13AD2913AD2814
        B0280A9A14518651666666A2A2A2DFDFDFFBFBFBFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFF4F4F49EC09E10A11521BA421CB53A1AB33619B23417B1323DBE
        5227B43C0EAC2613AC2815B12B0A9A14518551666666A3A3A3DFDFDFFBFBFBFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFB5D9B816A82022BB451FB8401DB63B1DB639
        1BB53A17B0310E9F1776D18641BF560EAC2514AE2914B0290A99145285526767
        67A3A3A3E0E0E0FBFBFBFFFFFFFFFFFFFFFFFFFFFFFF2CAF3945C8661FBA431F
        B8411EB73E1FB8401BB4372E9B2E9CC09C139A1372D1843FBF530EAC2614AD29
        17B22C0A9914538553676767A3A3A3E0E0E0FBFBFBFFFFFFFFFFFFFFFFFF20B1
        3277D99217B83D1FBA4321BB441CB6392E9E2EC1CAC1F5F5F5C8EBC8109A1075
        D3863DBF530EAC2614AD2A15B12D0A9914548454686868A4A4A4E1E1E1FCFCFC
        FFFFFFFFFFFF85CE8F47C2626FD58B38C45B27BB472CA32EBFCABFF4F4F4FFFF
        FFFFFFFFC5EAC50F9A0F74D2853ABD5010AE2714AD2B16B22D0A991454835468
        6868A5A5A5E1E1E1FCFCFCFFFFFFFEFFFE76D4842ABB4142C05834AE3CCCDACC
        F6F6F6FFFFFFFFFFFFFFFFFFFFFFFFC4EBC40D9A0D77D3893ABD5010AE2815AF
        2B17B32E0A9914558355686868A6A6A6E3E3E3FCFCFCFFFFFFFFFFFFE2F9E4BD
        EAC1EFF6F0FCFCFCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBFE8BF0D9C0D
        77D38938BC4E10AE2915AE2C18B4300A99135683566A6A6AAFAFAFEEEEEEFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFBEE8BE0C9C0D7AD58C35BB4C11AF2A15AE2D17B22F0A99135A7D5A
        878787E1E1E1FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBAE7BA0A9C0C77D58B35BB4C11AF2B16
        B02D18B5331A8B1C8D8D8DE4E4E4FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB8E6B80A9C
        0E7AD58D34BA4C11AF2B19B5352A8D2AB8B8B8F2F2F2FFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFB4E6B4089D0E74D58954CA6C089C138CB28CE8E8E8FDFDFDFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB5E2B522A122259D259ACB9AF1F1F1
        FDFDFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
      ParentFont = False
      ShineColor = clWhite
      TabOrder = 0
      Version = '1.3.3.1'
      OnClick = btConfirmarClick
    end
  end
  inherited cliques: TActionList
    Left = 704
    Top = 47
  end
  inherited actlBusca: TJvControlActionList
    Left = 731
    Top = 37
  end
  object cxStyleRepository1: TcxStyleRepository
    Left = 27
    Top = 453
    PixelsPerInch = 96
    object cxStyle2: TcxStyle
      AssignedValues = [svColor, svFont]
      Color = 15329769
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 12615680
      Font.Height = -67
      Font.Name = 'Tahoma'
      Font.Style = []
    end
    object stlRegistro: TcxStyle
      AssignedValues = [svFont]
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 12615680
      Font.Height = -67
      Font.Name = 'Tahoma'
      Font.Style = []
    end
    object stConfirmada: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 11526823
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      TextColor = clBlack
    end
    object stCancelada: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 8816381
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsStrikeOut]
      TextColor = clBlack
    end
    object stCiencia: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 10354687
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      TextColor = clBlack
    end
    object stSemManifesto: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 12615680
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -67
      Font.Name = 'Tahoma'
      Font.Style = []
      TextColor = clWhite
    end
    object stNaoRealizada: TcxStyle
      AssignedValues = [svFont]
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 8695039
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
    end
    object cxstyl1: TcxStyle
      AssignedValues = [svFont]
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -20
      Font.Name = 'Tahoma'
      Font.Style = []
    end
  end
end
