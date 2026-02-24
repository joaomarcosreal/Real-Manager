inherited frmContasApagarEntradas: TfrmContasApagarEntradas
  Left = 95
  Top = 69
  BorderIcons = []
  Caption = 'Contas '#224' pagar - Lan'#231'amentos'
  ClientHeight = 611
  ClientWidth = 748
  OnCloseQuery = FormCloseQuery
  ExplicitWidth = 760
  ExplicitHeight = 649
  TextHeight = 13
  inherited botao_pesquisa: TSpeedButton
    Top = -38
    ExplicitTop = -38
  end
  inherited Edit1: TEdit
    Top = -35
    TabOrder = 5
    ExplicitTop = -35
  end
  object Panel1: TPanel [2]
    Tag = 99
    Left = 0
    Top = 0
    Width = 748
    Height = 34
    Align = alTop
    Color = 12615680
    ParentBackground = False
    TabOrder = 6
    StyleElements = []
    ExplicitWidth = 744
    object Label10: TLabel
      Left = 3
      Top = 6
      Width = 453
      Height = 39
      AutoSize = False
      Caption = 'Contas '#224' pagar - Lancamento de t'#237'tulo'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -19
      Font.Name = 'Calibri'
      Font.Style = [fsBold]
      ParentFont = False
      StyleElements = []
    end
  end
  object pnDetalhesConta: TPanel [3]
    Left = 0
    Top = 105
    Width = 748
    Height = 94
    Align = alTop
    Color = clWhite
    ParentBackground = False
    TabOrder = 1
    StyleElements = []
    ExplicitWidth = 744
    object Label3: TLabel
      Left = 3
      Top = 7
      Width = 94
      Height = 14
      Caption = 'Valor da despesa'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Roboto'
      Font.Style = []
      ParentFont = False
      StyleElements = []
    end
    object Label5: TLabel
      Left = 357
      Top = 7
      Width = 78
      Height = 14
      Caption = '1'#186' vencimento'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Roboto'
      Font.Style = []
      ParentFont = False
      StyleElements = []
    end
    object Label6: TLabel
      Left = 469
      Top = 7
      Width = 72
      Height = 14
      Caption = 'Compet'#234'ncia'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Roboto'
      Font.Style = []
      ParentFont = False
      StyleElements = []
    end
    object Label4: TLabel
      Left = 583
      Top = 7
      Width = 79
      Height = 14
      Caption = 'N'#186' de parcelas'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Roboto'
      Font.Style = []
      ParentFont = False
      StyleElements = []
    end
    object Label7: TLabel
      Left = 689
      Top = 7
      Width = 56
      Height = 14
      Caption = 'N'#186' de dias'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Roboto'
      Font.Style = []
      ParentFont = False
      StyleElements = []
    end
    object Label9: TLabel
      Left = 3
      Top = 48
      Width = 72
      Height = 14
      Caption = 'Observa'#231#245'es '
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Roboto'
      Font.Style = []
      ParentFont = False
      StyleElements = []
    end
    object Label12: TLabel
      Left = 124
      Top = 7
      Width = 91
      Height = 14
      Caption = 'Ajuste financeiro'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Roboto'
      Font.Style = []
      ParentFont = False
      StyleElements = []
    end
    object Label13: TLabel
      Left = 245
      Top = 7
      Width = 80
      Height = 14
      Caption = 'Valor ajustado'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Roboto'
      Font.Style = []
      ParentFont = False
      StyleElements = []
    end
    object edTotalConta: TCurrencyEdit
      Tag = 2
      Left = 3
      Top = 23
      Width = 115
      Height = 25
      AutoSize = False
      Color = 13487561
      DisplayFormat = 'R$ ,0.00;'
      Enabled = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Roboto'
      Font.Style = []
      MaxLength = 30
      ParentFont = False
      ReadOnly = True
      TabOrder = 0
      OnEnter = Edit1Enter
      OnExit = Edit1Exit
      OnKeyDown = Edit1KeyDown
    end
    object edDataVencimento: TcxDateEdit
      Left = 358
      Top = 22
      EditValue = 0d
      ParentFont = False
      Properties.ImmediatePost = True
      Properties.OnChange = edDataVencimentoPropertiesChange
      Style.Font.Charset = ANSI_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -15
      Style.Font.Name = 'Roboto'
      Style.Font.Style = []
      Style.IsFontAssigned = True
      TabOrder = 3
      OnEnter = Edit1Enter
      OnExit = Edit1Exit
      OnKeyDown = Edit1KeyDown
      Width = 104
    end
    object edDataRD: TcxDateEdit
      Left = 469
      Top = 22
      EditValue = 0d
      ParentFont = False
      Properties.ImmediatePost = True
      Style.Font.Charset = ANSI_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -15
      Style.Font.Name = 'Roboto'
      Style.Font.Style = []
      Style.IsFontAssigned = True
      TabOrder = 4
      OnEnter = Edit1Enter
      OnExit = Edit1Exit
      OnKeyDown = Edit1KeyDown
      Width = 104
    end
    object edNumeroParcelas: TSpinEdit
      Left = 583
      Top = 23
      Width = 100
      Height = 24
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Roboto'
      Font.Style = []
      MaxValue = 100
      MinValue = 1
      ParentFont = False
      TabOrder = 5
      Value = 1
      OnChange = edDataVencimentoPropertiesChange
      OnEnter = Edit1Enter
      OnExit = Edit1Exit
      OnKeyDown = Edit1KeyDown
    end
    object edDiasParcelas: TSpinEdit
      Left = 689
      Top = 23
      Width = 55
      Height = 24
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Roboto'
      Font.Style = []
      MaxValue = 100
      MinValue = 1
      ParentFont = False
      TabOrder = 6
      Value = 1
      OnChange = edDataVencimentoPropertiesChange
      OnEnter = Edit1Enter
      OnExit = Edit1Exit
      OnKeyDown = Edit1KeyDown
    end
    object edObservacoes: TEdit
      Left = 3
      Top = 64
      Width = 741
      Height = 26
      CharCase = ecUpperCase
      Color = clWhite
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -15
      Font.Name = 'Roboto'
      Font.Style = []
      MaxLength = 190
      ParentFont = False
      TabOrder = 7
      OnEnter = Edit1Exit
      OnExit = Edit1Exit
      OnKeyDown = Edit1KeyDown
    end
    object edValorAjuste: TCurrencyEdit
      Left = 124
      Top = 23
      Width = 115
      Height = 26
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Roboto'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      OnEnter = Edit1Enter
      OnExit = Edit1Exit
      OnKeyDown = Edit1KeyDown
    end
    object edValorAjustado: TCurrencyEdit
      Tag = 2
      Left = 243
      Top = 23
      Width = 109
      Height = 25
      AutoSize = False
      Color = 13487561
      DisplayFormat = 'R$ ,0.00;'
      Enabled = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Roboto'
      Font.Style = []
      MaxLength = 30
      ParentFont = False
      ReadOnly = True
      TabOrder = 2
      OnEnter = Edit1Enter
      OnExit = Edit1Exit
      OnKeyDown = Edit1KeyDown
    end
  end
  object pnTopo: TPanel [4]
    Left = 0
    Top = 34
    Width = 748
    Height = 71
    Align = alTop
    BevelOuter = bvNone
    Color = clWhite
    ParentBackground = False
    TabOrder = 0
    StyleElements = []
    ExplicitWidth = 744
    object Panel6: TPanel
      Tag = 99
      Left = 0
      Top = 0
      Width = 748
      Height = 16
      Align = alTop
      BevelOuter = bvNone
      Color = 7960943
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentBackground = False
      ParentFont = False
      TabOrder = 0
      StyleElements = []
      ExplicitWidth = 744
      object Shape1: TShape
        Left = 0
        Top = 0
        Width = 21
        Height = 16
        Align = alLeft
        Pen.Color = 40176
        Pen.Width = 10
        Shape = stCircle
      end
      object Label34: TLabel
        Left = 21
        Top = 0
        Width = 727
        Height = 16
        Align = alClient
        Caption = 'Dados da nota fiscal e fornecedor'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -15
        Font.Name = 'Roboto'
        Font.Style = [fsBold]
        ParentFont = False
        StyleElements = []
        ExplicitWidth = 223
        ExplicitHeight = 18
      end
    end
    object pnDadosFornecedor: TPanel
      Tag = 99
      Left = 0
      Top = 16
      Width = 748
      Height = 55
      Align = alClient
      BevelOuter = bvNone
      Caption = '.'
      Color = clWhite
      ParentBackground = False
      TabOrder = 1
      StyleElements = []
      ExplicitWidth = 744
      object Label23: TLabel
        Left = 1
        Top = 4
        Width = 64
        Height = 14
        Caption = 'Fornecedor:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Roboto'
        Font.Style = []
        ParentFont = False
        StyleElements = []
      end
      object Label2: TLabel
        Left = 367
        Top = 4
        Width = 59
        Height = 14
        Caption = 'N'#186' da nota'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Roboto'
        Font.Style = []
        ParentFont = False
        StyleElements = []
      end
      object Label1: TLabel
        Left = 616
        Top = 3
        Width = 76
        Height = 14
        Caption = 'N'#186' da entrada'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Roboto'
        Font.Style = []
        ParentFont = False
        StyleElements = []
      end
      object Label11: TLabel
        Left = 510
        Top = 3
        Width = 47
        Height = 14
        Caption = 'Emiss'#227'o'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Roboto'
        Font.Style = []
        ParentFont = False
        StyleElements = []
      end
      object edNumeroNota: TEdit
        Left = 366
        Top = 18
        Width = 138
        Height = 26
        CharCase = ecUpperCase
        Color = 13487561
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -15
        Font.Name = 'Roboto'
        Font.Style = []
        MaxLength = 15
        ParentFont = False
        TabOrder = 1
        StyleElements = []
        OnEnter = Edit1Exit
        OnExit = Edit1Exit
        OnKeyDown = Edit1KeyDown
      end
      object edNumeroEntrada: TEdit
        Left = 614
        Top = 18
        Width = 130
        Height = 26
        CharCase = ecUpperCase
        Color = 13487561
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -15
        Font.Name = 'Roboto'
        Font.Style = []
        MaxLength = 8
        ParentFont = False
        TabOrder = 3
        StyleElements = []
        OnEnter = Edit1Exit
        OnExit = Edit1Exit
        OnKeyDown = Edit1KeyDown
      end
      object edDataDoc: TcxDateEdit
        Left = 510
        Top = 18
        EditValue = 0d
        ParentFont = False
        Style.Color = 13487561
        Style.Font.Charset = ANSI_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -15
        Style.Font.Name = 'Roboto'
        Style.Font.Style = []
        Style.IsFontAssigned = True
        TabOrder = 2
        OnEnter = Edit1Enter
        OnExit = Edit1Exit
        OnKeyDown = Edit1KeyDown
        Width = 98
      end
      object cbFornecedor: TcxLookupComboBox
        Left = 2
        Top = 18
        ParentFont = False
        Properties.DropDownAutoSize = True
        Properties.DropDownRows = 15
        Properties.DropDownSizeable = True
        Properties.KeyFieldNames = 'COD_FORNECEDOR'
        Properties.ListColumns = <
          item
            Caption = 'C'#243'digo'
            Fixed = True
            Width = 20
            FieldName = 'COD_FORNECEDOR'
          end
          item
            Caption = 'Raz'#227'o social'
            Fixed = True
            MinWidth = 300
            Width = 300
            FieldName = 'RAZAO_SOCIAL'
          end
          item
            Caption = 'Nome fantasia'
            Fixed = True
            MinWidth = 300
            Width = 300
            FieldName = 'NOME_FANTASIA'
          end
          item
            Caption = 'Cnpj / Cpf'
            MinWidth = 80
            Width = 80
            FieldName = 'DOCUMENTO'
          end
          item
            Caption = 'I.E'
            MinWidth = 80
            Width = 80
            FieldName = 'INSCRICAO_ESTADUAL'
          end>
        Properties.ListFieldIndex = 1
        Properties.ListOptions.CaseInsensitive = True
        Properties.ListSource = dmContasAPagar.dsParticipantes
        Properties.ReadOnly = False
        Style.Color = 13487561
        Style.Font.Charset = ANSI_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -15
        Style.Font.Name = 'Roboto Condensed'
        Style.Font.Style = []
        Style.ReadOnly = False
        Style.IsFontAssigned = True
        TabOrder = 0
        OnKeyDown = Edit1KeyDown
        Width = 350
      end
    end
  end
  object TPanel [5]
    Left = 0
    Top = 548
    Width = 748
    Height = 63
    Align = alBottom
    BevelOuter = bvNone
    Color = clWhite
    ParentBackground = False
    TabOrder = 7
    StyleElements = [seBorder]
    ExplicitTop = 547
    ExplicitWidth = 744
    object btLancar: TAdvGlassButton
      Left = 453
      Top = 7
      Width = 142
      Height = 51
      BackColor = 12615680
      ButtonDirection = bdLeft
      Caption = 'Confirmar lan'#231'amento'
      CornerRadius = 0
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
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
      OnClick = btLancarClick
    end
    object AdvGlassButton1: TAdvGlassButton
      Left = 602
      Top = 7
      Width = 142
      Height = 51
      BackColor = 12615680
      ButtonDirection = bdLeft
      Caption = 'Cancelar e sair'
      CornerRadius = 0
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ForeColor = clWhite
      GlowColor = 12615680
      ImageIndex = -1
      InnerBorderColor = clBlack
      OuterBorderColor = clWhite
      Picture.Data = {
        424DF60600000000000036000000280000001800000018000000010018000000
        000000000000130B0000130B00000000000000000000FFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEF1F1F1E3E3E3E6E6E6F2F2F2FCFCFC
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF3F3F3C2C2C28E8E8E93
        9393B6B6B6D6D6D6EAEAEAF7F7F7FEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7F7F7E2E2E2DCDCDCDEDEDEC1B0
        B0885C5C876969756D6D6666667D7D7DA0A0A0C6C6C6E0E0E0F1F1F1FCFCFCFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9F9F9D2D2D28F8F8F
        797979808080987D7DC18E8E9663638A57578156567E6B6B6A66666D6D6D8C8C
        8CB3B3B3D7D7D7F2F2F2FEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE6
        E6E6797979747474737373717272756464C89595A06C6CA26F6FA06D6D905D5D
        804D4D826060766B6B666565858585C6C6C6F5F5F5FFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFB1B1B18383836E6D6E90898CB3ACB1A19093C99494A16D6DA2
        6F6FA37070A26F6FA37070986565855353684D4D6C6C6CA0A0A0EBEBEBFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA7A7A78F8F8F716A6F57D48062EF9073BE
        84CE9799A47171A47171A47171A37070A47171A37070A6727283575765666696
        9696E7E7E7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA4A4A4929292736970
        4DD3794BED815DBD74D49AA0A57272A77474A67373A67373A57272A47171A671
        71865A5A666767939393E6E6E6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA2
        A2A2969696746A7246CE7344E3795BB770DBA0A6A77373A97676A87575A67474
        A87474A67373A773738A5E5E666868909090E5E5E5FFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFA2A2A2999999776D743DCC6D3BDA7059B06BDEA6ABAB7777AC
        7878A37171A37272A77676A87575A975758F61616768688E8E8EE4E4E4FFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9F9F9F9C9C9C766C7330C4602CCF6153A9
        61E1A7ACAC7676A58D8D8B89899C7373A77575AC7979AB7777936464676A6A8C
        8C8CE4E4E4FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9E9E9EA0A0A0736B6D
        96F7F396FFF897C5BFDFA9AAB58A8AD2D8D8D4D8D8A68B8BAE7A7AAD7A7AAC79
        799969696A6C6C8A8A8AE2E2E2FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9E
        9E9EA1A1A16D6969C6FFFFC7FFFFBACACAE0AEAEB17D7DD3C7C7CCCBCBB08484
        B07D7DAF7C7CAE7B7B9C6B6B6B6E6E888888E1E1E1FFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFF9B9B9BA7A7A76A6969F6FFFFF3FFFFD4C9C9E0B2B2B27F7FB4
        7F7FB47E7EB38080B27F7FB17E7EB07D7DA06E6E6C6F6F858585E1E1E1FFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF999999A9A9A96B6B6BFFFFFFFFFFFCE0C7
        C6E1B4B4B78383B78484B68383B58282B48181B38080B27F7FA671716D717183
        8383E0E0E0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF999999ADADAD6F6E6F
        FFFFF6FFF9EFE0C5C0E3B6B7B88484B98686B98686B78484B68383B58282B481
        81A97373707272818181DFDFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF98
        9898AEAEAE747575FFF8E9FFF2E4E2C1BAE5BABAB98686BE8A8AB88383B88484
        B68282B58282B48181AE76767073737F7F7FDEDEDEFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFF989898AFAFB0787979FFF3DDFFEEDAE3BFB5E8BFC0BA8585F1
        CFCFF9DBDBECC7C7E0B3B3D4A3A3C39191AE79797174747D7D7DDEDEDEFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9B9B9BB3B3B37E7F7EFFECD1FFE7CEE4BD
        B0EAC0C2BC8686EDD3D3FFF0F0FFE9E9FFE3E3FFE0E0EABCBCAF79797473737B
        7B7BDDDDDDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9B9B9BB3B3B384817F
        FFE4C3FFE1C0E6BBABEBC3C4C18B8BE1C9C9FFF2F2FFF1F1FFEAEAFFE4E4E7B9
        B9B17B7B777575787878DCDCDCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9C
        9C9CB5B5B58B8682FFE3B6FFDFB3EABBA9EEC5C6C38E8EC18B8BBA8383BA8686
        C29090CA9B9BC69595B57F7F777676777777DCDCDCFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFF9E9E9EB6B6B786868685817B87837DB69592F6CDCDDBB0B0D9
        AEAED5A6A6CC9F9FC39292BD8989BB8787B881817B78787E7E7EDEDEDEFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA0A0A0C9C9C9ABACACA8A8A9A3A4A4A19F
        9FA39A9AA39696A29191A59191A79090AC9393AE9393AF9191A280807B7A7AAA
        AAAAEBEBEBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB7B7B7A3A3A39F9F9F
        9F9F9F9D9D9D999A9A9697979696969394949192928F90908E8F8F8689898688
        88898A8AA5A5A5EBEBEBFBFBFBFFFFFFFFFFFFFFFFFF}
      ParentFont = False
      ShineColor = clWhite
      TabOrder = 1
      Version = '1.3.3.1'
      OnClick = btSairClick
    end
  end
  object pnParcelas: TPanel [6]
    Left = 0
    Top = 355
    Width = 748
    Height = 193
    Align = alClient
    Caption = 'pnParcelas'
    TabOrder = 4
    StyleElements = []
    ExplicitWidth = 744
    ExplicitHeight = 192
    object DBGrid1: TDBGrid
      Left = 1
      Top = 17
      Width = 746
      Height = 175
      Align = alClient
      DataSource = dsParcelas
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgCancelOnExit]
      ParentFont = False
      TabOrder = 0
      TitleFont.Charset = ANSI_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -8
      TitleFont.Name = 'Roboto'
      TitleFont.Style = []
      OnDrawColumnCell = DBGrid1DrawColumnCell
      Columns = <
        item
          Expanded = False
          FieldName = 'dataVencimento'
          Title.Caption = 'Vencimento'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -16
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Width = 167
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'diaSemana'
          Title.Caption = 'Dia'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -16
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Width = 154
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'numeroControle'
          Title.Caption = 'Parcela'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -16
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Width = 169
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'valorParcela'
          Title.Caption = 'Valor (R$)'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -16
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Width = 194
          Visible = True
        end>
    end
    object Panel3: TPanel
      Tag = 99
      Left = 1
      Top = 1
      Width = 746
      Height = 16
      Align = alTop
      BevelOuter = bvNone
      Color = 7960943
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentBackground = False
      ParentFont = False
      TabOrder = 1
      StyleElements = []
      ExplicitWidth = 742
      object Label8: TLabel
        Left = 0
        Top = 0
        Width = 746
        Height = 16
        Align = alClient
        Alignment = taCenter
        Caption = 'Parcelas geradas'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -15
        Font.Name = 'Roboto'
        Font.Style = [fsBold]
        ParentFont = False
        StyleElements = []
        ExplicitWidth = 117
        ExplicitHeight = 18
      end
    end
  end
  object pnContaGerencial: TPanel [7]
    Tag = 99
    Left = 0
    Top = 199
    Width = 748
    Height = 56
    Align = alTop
    BevelOuter = bvNone
    Caption = '.'
    Color = clWhite
    ParentBackground = False
    TabOrder = 2
    Visible = False
    StyleElements = []
    ExplicitWidth = 744
    object Label44: TLabel
      Left = 4
      Top = 10
      Width = 159
      Height = 14
      Caption = 'Conta gerencial do financeiro'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Roboto'
      Font.Style = []
      ParentFont = False
      StyleElements = []
    end
    object Label14: TLabel
      Left = 638
      Top = 12
      Width = 18
      Height = 14
      Caption = 'At'#233
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Roboto'
      Font.Style = []
      ParentFont = False
      StyleElements = []
    end
    object cbContaGerencial: TcxLookupComboBox
      Left = 2
      Top = 26
      ParentFont = False
      Properties.DropDownAutoSize = True
      Properties.DropDownRows = 30
      Properties.IncrementalFilteringOptions = [ifoHighlightSearchText, ifoUseContainsOperator]
      Properties.KeyFieldNames = 'COD_CONTA'
      Properties.ListColumns = <
        item
          Caption = 'C'#243'digo'
          Width = 90
          FieldName = 'COD_FORMATADO'
        end
        item
          Caption = 'Descri'#231#227'o da conta financeira'
          FieldName = 'DESCRICAO'
        end>
      Properties.ListFieldIndex = 1
      Properties.ListOptions.CaseInsensitive = True
      Properties.ListOptions.ColumnSorting = False
      Properties.ListSource = dmContasAPagar.dsQryCsPlanoContas
      Properties.MaxLength = 50
      Properties.ReadOnly = False
      EditValue = '0'
      Style.Font.Charset = ANSI_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -15
      Style.Font.Name = 'Roboto'
      Style.Font.Style = []
      Style.IsFontAssigned = True
      TabOrder = 0
      OnEnter = Edit1Enter
      OnExit = Edit1Exit
      Width = 470
    end
    object ckbRepetirDespesa: TCheckBox
      Left = 495
      Top = 7
      Width = 122
      Height = 17
      Caption = 'Repetir esta despesa'
      TabOrder = 1
      OnClick = ckbRepetirDespesaClick
    end
    object cbTempoRepeticao: TComboBox
      Left = 495
      Top = 26
      Width = 134
      Height = 28
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Segoe UI'
      Font.Style = []
      ItemIndex = 2
      ParentFont = False
      TabOrder = 2
      Text = 'Mensalmente'
      OnChange = cbTempoRepeticaoChange
      Items.Strings = (
        'Semanalmente'
        'Quinzenalmente'
        'Mensalmente'
        'Anualmente')
    end
    object edDataRepeticao: TcxDateEdit
      Left = 635
      Top = 26
      EditValue = 0d
      ParentFont = False
      Properties.ImmediatePost = True
      Properties.OnEditValueChanged = edDataRepeticaoPropertiesEditValueChanged
      Style.Font.Charset = ANSI_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -15
      Style.Font.Name = 'Roboto'
      Style.Font.Style = []
      Style.IsFontAssigned = True
      TabOrder = 3
      OnContextPopup = edDataRepeticaoContextPopup
      OnEnter = Edit1Enter
      OnExit = Edit1Exit
      OnKeyDown = Edit1KeyDown
      Width = 110
    end
  end
  object pnDetalhamento: TPanel [8]
    Tag = 99
    Left = 0
    Top = 255
    Width = 748
    Height = 100
    Align = alTop
    BevelOuter = bvNone
    Caption = '.'
    Color = clWhite
    Enabled = False
    ParentBackground = False
    TabOrder = 3
    Visible = False
    StyleElements = []
    ExplicitWidth = 744
    object Panel10: TPanel
      Tag = 99
      Left = 0
      Top = 0
      Width = 748
      Height = 16
      Align = alTop
      BevelOuter = bvNone
      Color = 7960943
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentBackground = False
      ParentFont = False
      TabOrder = 0
      StyleElements = []
      ExplicitWidth = 744
      object Panel12: TPanel
        Tag = 99
        Left = 0
        Top = 0
        Width = 748
        Height = 16
        Align = alTop
        BevelOuter = bvNone
        Color = 7960943
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentBackground = False
        ParentFont = False
        TabOrder = 0
        StyleElements = []
        ExplicitWidth = 744
        object Label16: TLabel
          Left = 0
          Top = 0
          Width = 748
          Height = 16
          Align = alClient
          Alignment = taCenter
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -15
          Font.Name = 'Roboto'
          Font.Style = [fsBold]
          ParentFont = False
          StyleElements = []
          ExplicitWidth = 4
          ExplicitHeight = 18
        end
        object Label17: TLabel
          Left = 0
          Top = 0
          Width = 748
          Height = 16
          Align = alClient
          Alignment = taCenter
          Caption = 'Detalhamento da despesa'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -15
          Font.Name = 'Roboto'
          Font.Style = [fsBold]
          ParentFont = False
          StyleElements = []
          ExplicitWidth = 173
          ExplicitHeight = 18
        end
      end
    end
  end
  inherited cliques: TActionList
    Left = 920
    Top = 65528
  end
  inherited actlBusca: TJvControlActionList
    Left = 58
    Top = 576
  end
  inherited popMenuExportacaoGrid: TPopupMenu
    Left = 112
    Top = 576
  end
  object tbParcelas: TRxMemoryData
    FieldDefs = <>
    Left = 788
    Top = 16
    object tbParcelasdataVencimento: TDateField
      FieldName = 'dataVencimento'
      DisplayFormat = 'DD/MM/YYY'
    end
    object tbParcelasdescricaoConta: TStringField
      FieldName = 'descricaoConta'
      Size = 50
    end
    object tbParcelasnumeroControle: TStringField
      FieldName = 'numeroControle'
      Size = 8
    end
    object tbParcelasvalorParcela: TCurrencyField
      FieldName = 'valorParcela'
    end
    object tbParcelasvalorMulta: TCurrencyField
      FieldName = 'valorMulta'
    end
    object tbParcelasvalorMora: TFloatField
      FieldName = 'valorMora'
    end
    object tbParcelasvalorDesconto: TFloatField
      FieldName = 'valorDesconto'
    end
    object tbParcelasflagMulta: TSmallintField
      FieldName = 'flagMulta'
    end
    object tbParcelasflagMora: TSmallintField
      FieldName = 'flagMora'
    end
    object tbParcelasflagDesconto: TSmallintField
      FieldName = 'flagDesconto'
    end
    object tbParcelasdiasDesconto: TIntegerField
      FieldName = 'diasDesconto'
    end
    object tbParcelasdiaSemana: TStringField
      FieldName = 'diaSemana'
      Size = 16
    end
    object tbParcelasparcela: TStringField
      FieldName = 'parcela'
      Size = 5
    end
  end
  object dsParcelas: TDataSource
    DataSet = tbParcelas
    Left = 964
  end
end
