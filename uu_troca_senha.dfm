object frm_troca_senha: Tfrm_troca_senha
  Left = 272
  Top = 114
  BorderIcons = []
  Caption = 'Troca de senha'
  ClientHeight = 439
  ClientWidth = 505
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Position = poScreenCenter
  OnActivate = FormActivate
  TextHeight = 13
  object Panel2: TPanel
    Left = 0
    Top = 56
    Width = 505
    Height = 321
    Align = alClient
    Color = clWhite
    ParentBackground = False
    TabOrder = 0
    object Label2: TLabel
      Left = 319
      Top = 38
      Width = 110
      Height = 18
      Caption = 'Senha atual:'
      Font.Charset = ANSI_CHARSET
      Font.Color = 12615680
      Font.Height = -16
      Font.Name = 'Verdana'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label3: TLabel
      Left = 319
      Top = 96
      Width = 109
      Height = 18
      Caption = 'Nova senha:'
      Font.Charset = ANSI_CHARSET
      Font.Color = 12615680
      Font.Height = -16
      Font.Name = 'Verdana'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label4: TLabel
      Left = 319
      Top = 156
      Width = 117
      Height = 18
      Caption = 'Confirma'#231#227'o:'
      Font.Charset = ANSI_CHARSET
      Font.Color = 12615680
      Font.Height = -16
      Font.Name = 'Verdana'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object ed_senha_atual: TMaskEdit
      Left = 318
      Top = 57
      Width = 177
      Height = 37
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -24
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      MaxLength = 8
      ParentFont = False
      PasswordChar = '*'
      TabOrder = 0
      Text = ''
      OnEnter = ed_senha_atualEnter
      OnExit = ed_senha_atualExit
      OnKeyDown = ed_senha_atualKeyDown
    end
    object ed_nova_senha: TMaskEdit
      Left = 319
      Top = 116
      Width = 176
      Height = 37
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -24
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      MaxLength = 8
      ParentFont = False
      PasswordChar = '*'
      TabOrder = 1
      Text = ''
      OnEnter = ed_senha_atualEnter
      OnExit = ed_senha_atualExit
      OnKeyDown = ed_senha_atualKeyDown
    end
    object ed_confirmacao: TMaskEdit
      Left = 319
      Top = 180
      Width = 176
      Height = 37
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -24
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      MaxLength = 8
      ParentFont = False
      PasswordChar = '*'
      TabOrder = 2
      Text = ''
      OnKeyDown = ed_senha_atualKeyDown
    end
    object AdvTouchKeyboard1: TAdvSmoothTouchKeyBoard
      AlignWithMargins = True
      Left = 8
      Top = 33
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
  object Panel1: TPanel
    Tag = 99
    Left = 0
    Top = 0
    Width = 505
    Height = 56
    Align = alTop
    Anchors = [akTop, akRight]
    Color = 12615680
    ParentBackground = False
    TabOrder = 1
    object lb_mesa: TLabel
      Left = 946
      Top = 13
      Width = 48
      Height = 29
      Caption = '0001'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -24
      Font.Name = 'Calibri'
      Font.Style = []
      ParentFont = False
    end
    object lblTitulo: TLabel
      Left = 8
      Top = 11
      Width = 555
      Height = 29
      AutoSize = False
      Caption = 'Altera'#231#227'o de senha'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -24
      Font.Name = 'Calibri'
      Font.Style = []
      ParentFont = False
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 377
    Width = 505
    Height = 62
    Align = alBottom
    BevelOuter = bvNone
    Color = clWhite
    ParentBackground = False
    TabOrder = 2
    DesignSize = (
      505
      62)
    object btSelecionar: TAdvGlassButton
      Left = 216
      Top = 4
      Width = 138
      Height = 55
      Anchors = [akTop, akRight, akBottom]
      BackColor = 12615680
      ButtonDirection = bdLeft
      Caption = 'Confirmar altera'#231#227'o'
      CornerRadius = 0
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ForeColor = clWhite
      GlowColor = 12615680
      ImageIndex = -1
      InnerBorderColor = clBlack
      OuterBorderColor = clWhite
      Picture.Data = {
        89504E470D0A1A0A0000000D4948445200000018000000180806000000E0773D
        F8000000097048597300000B1300000B1301009A9C1800000113494441544889
        D595414EC33010459F5DB30F5BEEC011AA04C435D8C1095851A9C2AC10886370
        0E9AA81577E002EC10ECAB66BAB144C0B163438AD4BF9C19FD6F7DFB8F61C750
        C18E5DD82C267BD23B6F22DA375902D02BA03349B2B1FF02062B1AD55C21CC80
        02E436746183B00BEBEEEE13B883F2D138F287F1CE0C4001DC43837627DF15AE
        8D53F361AB7046D251286C2DDF6BAA81B6FE1D9FAE40CA6EA5276852822AFD7A
        0AC4ABEC7F0EFE21681E46095A4CA03B9C431E5ED74B60EAB74659D72BC3A4BD
        64A39F8123BF9F60578F2D0E6F4CDA0BC3FCF415FB728C5A9F23ED21507FCDE8
        6AD82A5D75DE7F0D024A7F70B07E6276F61EF9327F267C0081D512F932E18F16
        A508E85C8B720552F652DCC92D067752EDA18C787C0000000049454E44AE4260
        82}
      ParentFont = False
      ShineColor = clWhite
      TabOrder = 0
      Version = '1.3.3.1'
      OnClick = btSelecionarClick
    end
    object btSair: TAdvGlassButton
      Left = 358
      Top = 5
      Width = 138
      Height = 55
      Anchors = [akTop, akRight, akBottom]
      BackColor = 12615680
      ButtonDirection = bdLeft
      Caption = 'Sair'
      CornerRadius = 0
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ForeColor = clWhite
      GlowColor = 12615680
      ImageIndex = -1
      InnerBorderColor = clBlack
      OuterBorderColor = clWhite
      Picture.Data = {
        89504E470D0A1A0A0000000D49484452000000300000003008060000005702F9
        87000000097048597300000B1300000B1301009A9C1800000376494441546881
        ED995188545518C77FDFDDD5D9CC047D30A284357DD95D7B9185E82167AE9B06
        45482F2224A446C882BAE58A286CEE9988C0347595500423F021DA205C88C81C
        98B999B1E23E44E12EB5966852126514BAE36C33F7EB61677337C6BD77E6DE71
        46B8BFC77BBEF37DDFFF7CE79C7BCF3D101111715F239E16AA42F2CB03A02B41
        FE0C2FB42A7001F44D8C7DB3522F8D9E1649A71378AD18B4F850CE01F94A8316
        B1804E9066606DA54EBC05C01AE017D093201B8087419B413F80C6F7314FFF54
        69708CB30F745BC5FD9918050F2406328AB177F1C8DC45A02F827C03B21B0A3F
        629C1426BD0E936E2A3FBC7B0B985D7EBF3BF8A9C01D36B7FF039C024E61D28F
        011B8057403E046E60D227B1AC13EC897F1724A972F05181BB60EC6B18FB2D88
        2F015D057A06A41357BFC564CE93CCBCCADEAF1E0A31D792542E6012232EC64E
        61EC75A08F82BE0ECC45394E36FF2B49A73B789A7727B880A918FB778C7D88DE
        F832D0A78007515E0835C6FF286F0DF8454481418CE354C5FF14C2AD400D8804
        D49AEAAC8100341DFCE1712DE43FC7952DB99D2D5F78D9D75D056EFFF5F775E0
        26960EC4DE1959ED655F770230ED63394B9F0146FC88A8E9146A687860B135BB
        096BDF70665A430140C614452C3D1DDB3FBC3AB7A3F54C291FF5578132A96905
        0A85ECE542F6369844625AC3818B0B622E290170E5D9DCCE9692A30FF55881C3
        A3F362AEA480165C59E3B513855281A6772F76A0AC903C27B2BBDAAE06F115CB
        8F2F0499EF27790849802AAD203DDA484F6CFFC8A76AD133BEBDA5A233416E7B
        DB2560B15FFB50A6506E47DB114B0ACD026F833E29AA9BC2F0EB87D01671B6FB
        899F8137E857C3F07FA7FFAA13FE2EB4560AA1FB9C81FADB85CA2412506B2201
        B5C687001D039D559DF0320B180FE2C17B1B151940F51826F331681FBD8973C5
        BF0E3ED03800C6C9946813603930E03BDB12785760CF8AE34037D0017296A433
        44D27999C39FC58204065CE028047B6B7BDF0F4C6286E6C0ADF5A05D402BF01B
        700CF428C6BE5EBA4F71E44D3C1124C999F02F6012552199E900E9029E67E29E
        E023D03E8C3D34CDF61E0828FF536262FEA7801426BD14642BB011643D26F335
        481FB89F60ECA01720FED209C58B199C87E436A2BA1558025C037D0FE425903F
        EA6B0ACD447F7F03230B9F43A50BB4A3F8F40A26D11C6A9C29842B602A26BD0C
        D882C8F7F4260E562D4E4444C4FDCDBF348114F25C30462F0000000049454E44
        AE426082}
      ParentFont = False
      ShineColor = clWhite
      TabOrder = 1
      Version = '1.3.3.1'
      OnClick = btSairClick
    end
  end
end
