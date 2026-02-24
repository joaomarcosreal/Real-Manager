inherited frmPedidosDelivery: TfrmPedidosDelivery
  Caption = 
    'Real Manager - Delivery - Sistema de Automa'#231#227'o Comercial Para Ba' +
    'res e Restaurantes'
  ClientHeight = 684
  ClientWidth = 1238
  PopupMode = pmAuto
  Position = poOwnerFormCenter
  PrintScale = poNone
  ScreenSnap = True
  OnDestroy = FormDestroy
  ExplicitWidth = 1250
  ExplicitHeight = 722
  TextHeight = 13
  inherited botao_pesquisa: TSpeedButton
    Tag = 99
    Left = 102
    Top = -33
    ExplicitLeft = 102
    ExplicitTop = -33
  end
  object Image4: TImage [1]
    Left = 384
    Top = 544
    Width = 105
    Height = 105
  end
  object Label29: TLabel [2]
    Left = 216
    Top = 24
    Width = 38
    Height = 13
    Caption = 'Label29'
    StyleElements = []
  end
  object Label30: TLabel [3]
    Left = 224
    Top = 32
    Width = 38
    Height = 13
    Caption = 'Label30'
    StyleElements = []
  end
  object Label31: TLabel [4]
    Left = 360
    Top = 48
    Width = 38
    Height = 13
    Caption = 'Label31'
    StyleElements = []
  end
  object Label12: TLabel [5]
    Left = 672
    Top = 48
    Width = 38
    Height = 13
    Caption = 'Label12'
    StyleElements = []
  end
  object Label13: TLabel [6]
    Left = 664
    Top = 56
    Width = 38
    Height = 13
    Caption = 'Label13'
    StyleElements = []
  end
  inherited Edit1: TEdit
    Left = -24
    Top = -28
    StyleElements = []
    ExplicitLeft = -24
    ExplicitTop = -28
  end
  object pgControle: TJvPageList [8]
    Left = 0
    Top = 0
    Width = 1238
    Height = 684
    ActivePage = pgPedido
    PropagateEnable = False
    Align = alClient
    ExplicitWidth = 1234
    ExplicitHeight = 683
    object pgPedido: TJvStandardPage
      Left = 0
      Top = 0
      Width = 1238
      Height = 684
      ParentCustomHint = False
      Caption = 'pgPedido'
      Color = clBlack
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = False
      ExplicitWidth = 1234
      ExplicitHeight = 683
      object PanelPedidoDelivery: TPanel
        Tag = 99
        Left = 0
        Top = 34
        Width = 1238
        Height = 650
        Align = alClient
        Color = clWhite
        ParentBackground = False
        TabOrder = 1
        StyleElements = []
        ExplicitWidth = 1234
        ExplicitHeight = 649
        object Label14: TLabel
          Left = 920
          Top = 136
          Width = 38
          Height = 13
          Caption = 'Label14'
          StyleElements = []
        end
        object Panel5: TPanel
          Tag = 99
          Left = 1
          Top = 200
          Width = 1
          Height = 449
          Align = alLeft
          Color = 15451300
          TabOrder = 3
          StyleElements = []
          ExplicitHeight = 448
        end
        object pnProduto: TPanel
          Tag = 99
          Left = 1
          Top = 141
          Width = 1236
          Height = 59
          Align = alTop
          Color = clWhite
          ParentBackground = False
          TabOrder = 1
          StyleElements = []
          ExplicitWidth = 1232
          object btPesqProdutoCodBarras: TSpeedButton
            Tag = 99
            Left = 184
            Top = 19
            Width = 41
            Height = 36
            Flat = True
            Glyph.Data = {
              360C0000424D360C000000000000360000002800000020000000200000000100
              180000000000000C0000EB0A0000EB0A00000000000000000000FFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFE
              F1F1F1DFDFDFDFDFDFE9E9E9DFDFDFDDDDDDE4E4E4DDDDDDDFDFDFE9E9E9DFDF
              DFDDDDDDE4E4E4DDDDDDDFDFDFE9E9E9DFDFDFDDDDDDE4E4E4DDDDDDDFDFDFE9
              E9E9DFDFDFDDDDDDE4E4E4DDDDDDDFDFDFF1F1F1FEFEFEFFFFFFFFFFFFF1F1F1
              BBBBBB8D8D8D939393B3B3B39393938D8D8DA4A4A48D8D8D939393B3B3B39393
              938D8D8DA4A4A48D8D8D939393B3B3B39393938D8D8DA4A4A48D8D8D939393B3
              B3B39393938D8D8DA4A4A48D8D8D8D8D8DBBBBBBF1F1F1FFFFFFFFFFFFCEB2A5
              993300993300A791869A34019A3401A87E69993300993300AC958A9A34019A34
              01A87E69993300993300AC958A9A34019A3401A87E69993300993300AC958A9A
              34019A3401A87E69993300993300937F768D8D8DE0E0E0FFFFFFFFFFFF9A3401
              A16E55A67258D1C1B9BE8265BC8164D4B7A9BD8164BC8164DECDC5BE8265BC81
              64D4B7A9BD8164BC8164DECDC5BE8265BC8164D4B7A9BD8164BC8164DECDC5BE
              8265BC8164D4B7A9BD8164B77D619A3401939393DFDFDFFFFFFFFFFFFF9A3401
              AB755BC3C3C3F1F1F1FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFBE82659A3401B3B3B3E9E9E9FFFFFFFFFFFFCDB1A4
              9B8F89AAAAAAECECECFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFDECDC5AC958A939393DFDFDFFFFFFFFFFFFF9A3401
              A16E55AAAAAAECECECFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8F8
              F8E9E9E9DEDEDEE0E0E0ECECECFBFBFBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFBC81649A3401939393DFDFDFFFFFFFFFFFFF9A3401
              AB755BC3C3C3F2F2F2FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF4F4F4D0D0
              D09B9B9B7E7E7E848484A8A8A8DBDBDBF9F9F9FFFFFFFFFFFFFFFFFFFDFDFDF8
              F8F8F7F7F7FCFCFCFFFFFFBE82659A3401B3B3B3E9E9E9FFFFFFFFFFFFCDB1A4
              9B8F89AAAAAAECECECFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF5F5F5C4C4C46D6F
              6F4A4F524A4C4F6162626565659A9A9AE0E0E0FDFDFDFFFFFFF6F6F6DEDEDEC7
              C7C7C3C3C3D7D7D7EEEEEEDBCAC2AC958A939393DFDFDFFFFFFFFFFFFF9A3401
              A16E55AAAAAAECECECFFFFFFFFFFFFFFFFFFFFFFFFF6F6F6C7C7C76C6F708977
              6CC3987DC59E877B787658595B6B6B6BB9B9B9F1F1F1F2F2F2C8C8C88B8B8B75
              75756C6C6C808080B6B6B6B77D619A3401939393DFDFDFFFFFFFFFFFFF9A3401
              AB755BC3C3C3F2F2F2FFFFFFFFFFFFFFFFFFF5F5F5C6C6C66C6E6E847971F9C0
              8DF3BF8EF0BB8BEBB5896C6A6A696A6A919191D1D1D1BCBCBC686A6B5D5E5F67
              67694A4D50666666777777AB765B9A3401B3B3B3E9E9E9FFFFFFFFFFFFCDB1A4
              9B8F89AAAAAAECECECFFFFFFFFFFFFF3F3F3C4C4C45F5F5F6F7275CAA787FFDA
              A9FFD7ABFFD5A9FFD29CCAAB8F5C5E606A6A6A9090906A6D6E988170E5AB81E0
              A87DC9A8924F54576565658E837E9C877D929292DFDFDFFFFFFFFFFFFF9A3401
              A16E55AAAAAAECECECFEFEFEF1F1F1BEBEBE5E5E5E6E6E6E909396CAA991FFE7
              C5FFE3CBFFE2C5FFDBB4F9CCA144484C686868555656797775FFCF97FFD09DFE
              CE99FCC490B39F8C595B5C95664F9A3401929292DFDFDFFFFFFFFFFFFF9A3401
              AB755BC3C3C3EFEFEFEEEEEEB8B8B85656566F6F6F949494A4A7A8AC9992FFE6
              D3FFFAEFFFF0E0FFE7C8E3C09F3C40433C3C3C88898BA2948BFFE1B4FFDDBDFF
              DCBAFFD8ABF4C89D4C4F549767509A3401B2B2B2E9E9E9FFFFFFFFFFFFCDB1A4
              9B8F89A7A7A7D8D8D8AFAFAF535353424242959595AAAAAABBBBBCBAB9BCB597
              8EF2E8E6FFF6E9FFF1D284786E3B3D3E919191AAABACA09896FFE1C5FFF1DFFF
              ECD8FFE2C3FFD3A74D51558E837E9C877D929292DFDFDFFFFFFFFFFFFF9A3401
              A16E559C9C9C9F9F9F444444606060515151848484C7C7C7D3D3D3E4E5E5A8A8
              A9957D7BA58980806F6B4E5052535354B6B6B6BFBFBFBABDBFC3A89CFFF9F5FF
              FFF7FFF4D7CAAE956E7071AB755B9A3401939393DFDFDFFFFFFFFFFFFF9A3401
              AB755B9797973C3C3C9B9B9BEEEEEE7B7B7B4F4F4FBBBBBBF4F4F4FFFFFFFFFF
              FF909393666969717373676767303030CECECED4D4D4E6E8E8B4B1B2A98E89D4
              B5A8C6A69569686AB7B8B8B97F629A3401B3B3B3E9E9E9FFFFFFFFFFFFCDB1A4
              998E88585858393939EDEDED848484B5B5B5C2C2C25D5D5D909090B3B3B35A5A
              5A3F3F3F5151516A6A6A5D5D5D606060EDEDEDF4F4F4FFFFFFFFFFFFBBBEBF6E
              6E6F949495D1D1D1F4F4F4DCCBC3AC9489939393DFDFDFFFFFFFFFFFFF9A3401
              A16E554B4B4B4848488B8B8BBCBCBCCCCCCCCACACAC7C7C79A9A9A7575755E5E
              5E4F4F4F4D4D4D3D3D3D3A3A3A7C7C7CBEBEBED8D8D8C2C2C27F7F7F595A5ABE
              BEBEF4F4F4FEFEFEFFFFFFBC81649A3401939393DFDFDFFFFFFFFFFFFF9A3401
              AB755B6C6C6C505050787878D6D6D6CBCBCBBEBEBEB6B6B6B2B2B2AFAFAFABAB
              ABA3A3A39595958A8A8A7E7E7E717171696969353535434343ABABABF1F1F1FD
              FDFDFFFFFFFFFFFFFFFFFFBE82659A3401B3B3B3E9E9E9FFFFFFFFFFFFCDB1A4
              9B8F899F9F9F6161615A5A5A565656898989A5A5A5B1B1B1AFAFAFA6A6A69E9E
              9E9E9E9E9F9F9FA2A2A2A8A8A8919191545454919191E6E6E6FBFBFBFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFDECDC5AC958A939393DFDFDFFFFFFFFFFFFF9A3401
              A16E55AAAAAADBDBDBB3B3B3B1B1B1C8C8C8ABABAB8A8A8A7676766B6B6B7373
              737B7B7B7F7F7F7D7D7D5E5E5E777777D5D5D5F8F8F8FFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFBC81649A3401939393DFDFDFFFFFFFFFFFFF9A3401
              AB755BC3C3C3F2F2F2FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0F0F09999
              995D5D5D666666A2A2A2D3D3D3F8F8F8FEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFBE82659A3401B3B3B3E9E9E9FFFFFFFFFFFFCDB1A4
              9B8F89AAAAAAECECECFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFDECDC5AC958A939393DFDFDFFFFFFFFFFFFF9A3401
              A16E55AAAAAAECECECFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFBC81649A3401939393DFDFDFFFFFFFFFFFFF9A3401
              AB755BC3C3C3F1F1F1FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFBE82659A3401B3B3B3E9E9E9FFFFFFFFFFFFCDB1A4
              9B8F89A4A4A4DCDCDCF1F1F1ECECECEBEBEBEFEFEFEBEBEBECECECF1F1F1ECEC
              ECEBEBEBEFEFEFEBEBEBECECECF1F1F1ECECECEBEBEBEFEFEFEBEBEBECECECF1
              F1F1ECECECEBEBEBEEEEEED1C1B9A79186939393DFDFDFFFFFFFFFFFFF9A3401
              A06D55838383A4A4A4C3C3C3AAAAAAA6A6A6B7B7B7A6A6A6AAAAAAC3C3C3AAAA
              AAA6A6A6B7B7B7A6A6A6AAAAAAC3C3C3AAAAAAA6A6A6B7B7B7A6A6A6AAAAAAC3
              C3C3AAAAAAA6A6A6B7B7B7A571589A34018D8D8DE0E0E0FFFFFFFFFFFF9A3401
              AD775CA06D559B8F89AB755BA16E559A857BA67258A06D559B8F89AB755BA16E
              559A857BA67258A06D559B8F89AB755BA16E559A857BA67258A06D559B8F89AB
              755BA16E559A857BA67258A06D559A3401BBBBBBF1F1F1FFFFFFFFFFFFE0C2B3
              993300993300CDB1A49A34019A3401BE8F77993300993300CDB1A49A34019A34
              01BE8F77993300993300CDB1A49A34019A3401BE8F77993300993300CDB1A49A
              34019A3401BE8F77993300993300CDB1A4F1F1F1FEFEFEFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
            OnClick = botao_pesquisaClick
          end
          object Label35: TLabel
            Left = 5
            Top = 59
            Width = 462
            Height = 13
            AutoSize = False
            Caption = 
              'Utilize ctrl+R para alternar a visualiza'#231#227'o dos produtos entre o' +
              's modos resumido / detalhado'
            Color = 12615680
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentColor = False
            ParentFont = False
            Transparent = True
            StyleElements = []
          end
          object Label1: TLabel
            Left = 4
            Top = 3
            Width = 175
            Height = 15
            AutoSize = False
            Caption = 'C'#243'digo do produto / c'#243'd. barras'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Calibri'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label2: TLabel
            Left = 231
            Top = 2
            Width = 175
            Height = 15
            AutoSize = False
            Caption = 'Nome do produto / Descri'#231#227'o'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Calibri'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label5: TLabel
            Left = 914
            Top = 3
            Width = 50
            Height = 15
            AutoSize = False
            Caption = 'Pre'#231'o'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Calibri'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label3: TLabel
            Left = 1094
            Top = 2
            Width = 82
            Height = 15
            AutoSize = False
            Caption = 'Quantidade'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Calibri'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object edQuantidade: TEdit
            Tag = 99
            Left = 1092
            Top = 18
            Width = 140
            Height = 34
            Color = clWhite
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Height = -21
            Font.Name = 'Calibri'
            Font.Style = []
            ParentFont = False
            TabOrder = 3
            StyleElements = []
            OnEnter = Edit1Enter
            OnExit = edQuantidadeExit
            OnKeyDown = Edit1KeyDown
          end
          object edCodBarrasProduto: TEdit
            Tag = 99
            Left = 3
            Top = 19
            Width = 175
            Height = 34
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Height = -21
            Font.Name = 'Calibri'
            Font.Style = []
            ParentFont = False
            TabOrder = 0
            StyleElements = []
            OnChange = edCodBarrasProdutoChange
            OnEnter = Edit1Enter
            OnExit = edCodBarrasProdutoExit
            OnKeyDown = Edit1KeyDown
          end
          object edCodProduto: TEdit
            Tag = 99
            Left = 872
            Top = -36
            Width = 125
            Height = 35
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Height = -24
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            TabOrder = 1
            Visible = False
            StyleElements = []
            OnEnter = Edit1Enter
            OnExit = Edit1Exit
            OnKeyDown = Edit1KeyDown
          end
          object Panel6: TPanel
            Left = 232
            Top = 18
            Width = 854
            Height = 35
            BevelOuter = bvNone
            Caption = 'Panel1'
            Color = clWhite
            Enabled = False
            ParentBackground = False
            TabOrder = 2
            StyleElements = []
            object edDescricaoProduto: TEdit
              Tag = 99
              Left = 0
              Top = 0
              Width = 676
              Height = 34
              Color = 15724527
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Height = -21
              Font.Name = 'Calibri'
              Font.Style = [fsBold]
              ParentFont = False
              TabOrder = 0
              StyleElements = []
            end
            object edValorUnitarioProduto: TEdit
              Tag = 99
              Left = 682
              Top = 0
              Width = 172
              Height = 34
              Color = 15724527
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Height = -21
              Font.Name = 'Calibri'
              Font.Style = [fsBold]
              ParentFont = False
              ReadOnly = True
              TabOrder = 1
              StyleElements = []
            end
          end
        end
        object pnTopo: TPanel
          Left = 1
          Top = 1
          Width = 1236
          Height = 124
          Align = alTop
          Color = clWhite
          ParentBackground = False
          TabOrder = 0
          StyleElements = []
          ExplicitWidth = 1232
          object btPesqCliente: TSpeedButton
            Tag = 99
            Left = 119
            Top = 36
            Width = 33
            Height = 35
            Flat = True
            Glyph.Data = {
              36030000424D3603000000000000360000002800000010000000100000000100
              18000000000000030000C40E0000C40E000000000000000000007CADD782BAE7
              84BEEC84BEEC84BEEC7FB5E19DC2E1FFFFFFFFFFFF9DC2E17FB5E184BEEC84BE
              EC84BEEC82BAE77CADD75897CC7BB8E986C3F286C3F286C3F26FADDF81B1D9FF
              FFFFFFFFFF81B1D96FADDF86C3F286C3F286C3F27BB8E95897CC5897CC7BB8E9
              86C3F286C3F286C3F26FADDF81B1D9FFFFFFFFFFFF81B1D96FADDF86C3F286C3
              F286C3F27BB8E95897CCEAEEEB7F84548D9160939564939564858754CBCDB9FF
              FFFFFFFFFFCBCDB98587549395649395648D91607F8454EAEEEBFFFEFE858348
              908B4D989252989252888447A2B2AAB6D1E9B6D1E9A2B2AA8884479892529892
              52908B4D858348FFFEFEFFFFFF94915E8F8A4C989252989252888447688E9858
              97CC5897CC688E988884479892529892528F8A4C94915EFFFFFFFFFFFFA2A074
              8E894B9892529892528884478BA4A391BADD91BADD8BA4A38884479892529892
              528E894BA2A074FFFFFFFFFFFFB2B08B8C884A989252989252888447D0CFB8FF
              FFFFFFFFFFD0CFB88884479892529892528C884AB2B08BFFFFFFFFFFFFC1BFA1
              8B8749989252989252888447D0CFB8DDDCCCDDDCCCD0CFB88884479892529892
              528B8749C1BFA1FFFFFFFFFFFFCFCEB7898548989252989252888447688E9865
              90A26590A2688E98888447989252989252898548CFCEB7FFFFFFFFFFFFDFDECE
              88844798925298925288844771939B689FCB689FCB71939B8884479892529892
              52888447DFDECEFFFFFFFFFFFFF7F6F2C4C3A68D894B938E4E93915BEDEDE4FF
              FFFFFFFFFFEDEDE493915B938E4E8D894BC4C3A6F7F6F2FFFFFFFFFFFFFFFFFF
              F3F3ED8A86499892529D9B6BFFFFFFFFFFFFFFFFFFFFFFFF9D9B6B9892528A86
              49F3F3EDFFFFFFFFFFFFFFFFFFFFFFFFF6F6F28F91619491579FA384FFFFFFFF
              FFFFFFFFFFFFFFFF9FA3849491578F9161F6F6F2FFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFF73A9D673B1E2A6C8E4FFFFFFFFFFFFFFFFFFFFFFFFA6C8E473B1E273A9
              D6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE8E7D8A5AA87A0A685AFB08CFCFCFAFF
              FFFFFFFFFFFCFCFAAFB08CA0A685A5AA87E8E7D8FFFFFFFFFFFF}
            OnClick = btPesqClienteClick
          end
          object Label37: TLabel
            Left = 6
            Top = 26
            Width = 104
            Height = 15
            Caption = 'Telefone do cliente'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Calibri'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Panel3: TPanel
            Tag = 99
            Left = 1
            Top = 1
            Width = 1234
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
            ExplicitWidth = 1230
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
            object Label36: TLabel
              Left = 21
              Top = 0
              Width = 1213
              Height = 16
              Align = alClient
              Caption = 'Dados e endere'#231'o do cliente'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWhite
              Font.Height = -15
              Font.Name = 'Calibri'
              Font.Style = [fsBold]
              ParentFont = False
              StyleElements = []
              ExplicitWidth = 176
              ExplicitHeight = 18
            end
          end
          object edTelClienteDelivery: TEdit
            Tag = 99
            Left = 3
            Top = 43
            Width = 111
            Height = 27
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -16
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 4
            StyleElements = []
            OnEnter = Edit1Enter
            OnExit = Edit1Exit
            OnKeyDown = edTelClienteDeliveryKeyDown
          end
          object edCodbairro: TEdit
            Left = 451
            Top = 15
            Width = 31
            Height = 21
            TabOrder = 2
            Visible = False
            StyleElements = []
          end
          object edCodClienteDelivery: TEdit
            Left = 414
            Top = 15
            Width = 31
            Height = 21
            TabOrder = 1
            Visible = False
            StyleElements = []
          end
          object Panel20: TPanel
            Left = 122
            Top = 26
            Width = 1113
            Height = 46
            BevelOuter = bvNone
            Caption = 'Panel20'
            Color = clWhite
            Enabled = False
            ParentBackground = False
            TabOrder = 3
            StyleElements = []
            object Label38: TLabel
              Left = 0
              Top = 0
              Width = 91
              Height = 15
              Caption = 'Nome do cliente'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Calibri'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label43: TLabel
              Left = 497
              Top = 0
              Width = 47
              Height = 15
              Caption = 'Telefone'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Calibri'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label44: TLabel
              Left = 617
              Top = 0
              Width = 38
              Height = 15
              Caption = 'Celular'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Calibri'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label40: TLabel
              Left = 739
              Top = 0
              Width = 33
              Height = 15
              Caption = 'Bairro'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Calibri'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object edNomeCliente: TEdit
              Tag = 99
              Left = 0
              Top = 17
              Width = 486
              Height = 23
              Color = 15724527
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -17
              Font.Name = 'Calibri'
              Font.Style = [fsBold]
              ParentFont = False
              TabOrder = 0
              Text = 'JO'#195'O MARCOS SANTOS DA SILVA'
              StyleElements = []
              OnEnter = Edit1Enter
              OnExit = Edit1Exit
              OnKeyDown = edTelClienteDeliveryKeyDown
            end
            object edTelClienteConsulta: TEdit
              Tag = 99
              Left = 497
              Top = 17
              Width = 111
              Height = 29
              Color = 15724527
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -17
              Font.Name = 'Calibri'
              Font.Style = [fsBold]
              ParentFont = False
              TabOrder = 1
              StyleElements = []
              OnEnter = Edit1Enter
              OnExit = Edit1Exit
              OnKeyDown = edTelClienteDeliveryKeyDown
            end
            object edCelularCliente: TEdit
              Tag = 99
              Left = 617
              Top = 17
              Width = 111
              Height = 29
              Color = 15724527
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -17
              Font.Name = 'Calibri'
              Font.Style = [fsBold]
              ParentFont = False
              TabOrder = 2
              StyleElements = []
              OnEnter = Edit1Enter
              OnExit = Edit1Exit
              OnKeyDown = edTelClienteDeliveryKeyDown
            end
            object edBairroCliente: TEdit
              Tag = 99
              Left = 739
              Top = 17
              Width = 370
              Height = 29
              Color = 15724527
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -17
              Font.Name = 'Calibri'
              Font.Style = [fsBold]
              ParentFont = False
              TabOrder = 3
              StyleElements = []
              OnEnter = Edit1Enter
              OnExit = Edit1Exit
              OnKeyDown = edTelClienteDeliveryKeyDown
            end
          end
          object Panel21: TPanel
            Left = 3
            Top = 72
            Width = 1234
            Height = 47
            Caption = 'Panel21'
            Color = clWhite
            Enabled = False
            ParentBackground = False
            TabOrder = 5
            StyleElements = []
            object Label46: TLabel
              Left = 3
              Top = 0
              Width = 51
              Height = 15
              Caption = 'Endere'#231'o'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Calibri'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label47: TLabel
              Left = 463
              Top = 0
              Width = 79
              Height = 15
              Caption = 'Complemento'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Calibri'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label48: TLabel
              Left = 814
              Top = 0
              Width = 58
              Height = 15
              Caption = 'Refer'#234'ncia'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Calibri'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object edEnderecoCliente: TEdit
              Tag = 99
              Left = 4
              Top = 17
              Width = 453
              Height = 29
              Color = 15724527
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -17
              Font.Name = 'Calibri'
              Font.Style = [fsBold]
              ParentFont = False
              TabOrder = 0
              StyleElements = []
              OnEnter = Edit1Enter
              OnExit = Edit1Exit
              OnKeyDown = edTelClienteDeliveryKeyDown
            end
            object edComplementoCliente: TEdit
              Tag = 99
              Left = 463
              Top = 17
              Width = 346
              Height = 29
              Color = 15724527
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -17
              Font.Name = 'Calibri'
              Font.Style = [fsBold]
              ParentFont = False
              TabOrder = 1
              StyleElements = []
              OnEnter = Edit1Enter
              OnExit = Edit1Exit
              OnKeyDown = edTelClienteDeliveryKeyDown
            end
            object edReferenciaCliente: TEdit
              Tag = 99
              Left = 811
              Top = 17
              Width = 418
              Height = 29
              Color = 15724527
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -17
              Font.Name = 'Calibri'
              Font.Style = [fsBold]
              ParentFont = False
              TabOrder = 2
              StyleElements = []
              OnEnter = Edit1Enter
              OnExit = Edit1Exit
              OnKeyDown = edTelClienteDeliveryKeyDown
            end
          end
        end
        object Panel19: TPanel
          Tag = 99
          Left = 1
          Top = 125
          Width = 1236
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
          TabOrder = 2
          StyleElements = []
          ExplicitWidth = 1232
          object Shape2: TShape
            Left = 0
            Top = 0
            Width = 21
            Height = 16
            Align = alLeft
            Pen.Color = 40176
            Pen.Width = 10
            Shape = stCircle
          end
          object Label45: TLabel
            Left = 21
            Top = 0
            Width = 1215
            Height = 16
            Align = alClient
            Caption = #205'tens do pedido'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWhite
            Font.Height = -15
            Font.Name = 'Calibri'
            Font.Style = [fsBold]
            ParentFont = False
            StyleElements = []
            ExplicitWidth = 97
            ExplicitHeight = 18
          end
        end
        object pnMovimentoPedido: TPanel
          Left = 2
          Top = 200
          Width = 835
          Height = 449
          Align = alClient
          BevelOuter = bvNone
          Color = clSilver
          ParentBackground = False
          TabOrder = 4
          StyleElements = []
          ExplicitWidth = 831
          ExplicitHeight = 448
          object Panel7: TPanel
            Tag = 99
            Left = 0
            Top = 0
            Width = 835
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
            ExplicitWidth = 831
            object Label17: TLabel
              Left = 0
              Top = 0
              Width = 835
              Height = 16
              Align = alClient
              Alignment = taCenter
              Caption = #204'tens'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWhite
              Font.Height = -15
              Font.Name = 'Roboto'
              Font.Style = [fsBold]
              ParentFont = False
              StyleElements = []
              ExplicitWidth = 33
              ExplicitHeight = 18
            end
          end
          object pgListMovimentoProdutos: TJvPageList
            Left = 0
            Top = 16
            Width = 835
            Height = 433
            ActivePage = pgProdutosPedido
            PropagateEnable = False
            Align = alClient
            ExplicitWidth = 831
            ExplicitHeight = 380
            object pgResumoProdutos: TJvStandardPage
              Left = 0
              Top = 0
              Width = 835
              Height = 433
              ExplicitHeight = 381
              object cxGrid1: TcxGrid
                Left = 0
                Top = 0
                Width = 835
                Height = 433
                ParentCustomHint = False
                Align = alClient
                TabOrder = 0
                ExplicitHeight = 381
                object cxGrid1DBTableView1: TcxGridDBTableView
                  Navigator.Buttons.CustomButtons = <>
                  ScrollbarAnnotations.CustomAnnotations = <>
                  DataController.DataSource = dmPedidoDelivery.dsMovimentoResumido
                  DataController.Summary.DefaultGroupSummaryItems = <>
                  DataController.Summary.FooterSummaryItems = <>
                  DataController.Summary.SummaryGroups = <>
                  OptionsData.CancelOnExit = False
                  OptionsData.Deleting = False
                  OptionsData.DeletingConfirmation = False
                  OptionsData.Editing = False
                  OptionsData.Inserting = False
                  OptionsView.GroupByBox = False
                  Styles.Content = cxStyle1
                  Styles.ContentEven = cxStyle2
                  object cxgrdbclmnGrid1DBTableView1COD_BARRAS: TcxGridDBColumn
                    Caption = 'C'#243'digo'
                    DataBinding.FieldName = 'COD_BARRAS'
                    DataBinding.IsNullValueType = True
                    Width = 65
                  end
                  object cxgrdbclmnGrid1DBTableView1DESCRICAO: TcxGridDBColumn
                    Caption = 'Descri'#231#227'o do produto'
                    DataBinding.FieldName = 'DESCRICAO'
                    DataBinding.IsNullValueType = True
                    Width = 226
                  end
                  object cxgrdbclmnGrid1DBTableView1QUANTIDADE: TcxGridDBColumn
                    Caption = 'Qtde'
                    DataBinding.FieldName = 'QUANTIDADE'
                    DataBinding.IsNullValueType = True
                    Width = 48
                  end
                  object cxgrdbclmnGrid1DBTableView1VALOR_UNITARIO: TcxGridDBColumn
                    Caption = 'Pre'#231'o'
                    DataBinding.FieldName = 'VALOR_UNITARIO'
                    DataBinding.IsNullValueType = True
                    PropertiesClassName = 'TcxCurrencyEditProperties'
                    Width = 86
                  end
                  object cxgrdbclmnGrid1DBTableView1TOTAL: TcxGridDBColumn
                    Caption = 'Total'
                    DataBinding.FieldName = 'TOTAL'
                    DataBinding.IsNullValueType = True
                    PropertiesClassName = 'TcxCurrencyEditProperties'
                  end
                end
                object cxGrid1Level1: TcxGridLevel
                  GridView = cxGrid1DBTableView1
                end
              end
            end
            object pgProdutosPedido: TJvStandardPage
              Left = 0
              Top = 0
              Width = 835
              Height = 433
              Caption = 'pgProdutosPedido'
              ExplicitWidth = 831
              ExplicitHeight = 380
              object Panel28: TPanel
                Left = 0
                Top = 428
                Width = 835
                Height = 5
                Align = alBottom
                BevelOuter = bvNone
                Color = clWhite
                ParentBackground = False
                TabOrder = 0
                StyleElements = []
                ExplicitTop = 375
                ExplicitWidth = 831
              end
              object Panel32: TPanel
                Left = 0
                Top = 371
                Width = 835
                Height = 5
                Align = alBottom
                BevelOuter = bvNone
                Color = clWhite
                ParentBackground = False
                TabOrder = 1
                StyleElements = []
                ExplicitTop = 318
                ExplicitWidth = 831
              end
              object Panel29: TPanel
                Left = 0
                Top = 376
                Width = 835
                Height = 52
                Align = alBottom
                BevelOuter = bvNone
                Color = clWhite
                Enabled = False
                ParentBackground = False
                TabOrder = 2
                StyleElements = []
                ExplicitTop = 323
                ExplicitWidth = 831
                object Panel30: TPanel
                  Left = 0
                  Top = 0
                  Width = 205
                  Height = 52
                  Align = alLeft
                  BevelOuter = bvNone
                  Color = 6697728
                  Enabled = False
                  ParentBackground = False
                  TabOrder = 0
                  StyleElements = []
                  object Label21: TLabel
                    Left = 0
                    Top = 0
                    Width = 205
                    Height = 21
                    Align = alTop
                    Alignment = taRightJustify
                    Caption = 'Produtos'
                    Color = 3289650
                    Font.Charset = ANSI_CHARSET
                    Font.Color = clWhite
                    Font.Height = -17
                    Font.Name = 'Calibri'
                    Font.Style = [fsBold]
                    ParentColor = False
                    ParentFont = False
                    Transparent = True
                    StyleElements = []
                    ExplicitLeft = 209
                    ExplicitWidth = 64
                  end
                  object AdvOfficeImage2: TAdvOfficeImage
                    Left = 9
                    Top = 3
                    Width = 48
                    Height = 49
                    Picture.Data = {
                      89504E470D0A1A0A0000000D49484452000000400000004008040000000060B9
                      550000000467414D410000B18F0BFC6105000000206348524D00007A26000080
                      840000FA00000080E8000075300000EA6000003A98000017709CBA513C000000
                      02624B47440000AA8D2332000000097048597300000EC400000EC401952B0E1B
                      0000000774494D4507E3071F01020DAB1B2C5D00000A604944415468DEBDD969
                      9496D59107F0FFDB80A07117B7A8891AA246D946630617D404CF04155CD051C7
                      C1313A4AA2C19918A3C6ED98E4B864704693A833A331EEE6008A4B70413D262E
                      A831021E05DC11141117864590A5E9EEDF7C786FBFFD76378A104EEEA77AAAEA
                      DEAAE756DDBA5575934EC3600F9AEC2A9B642D86AD5D6F8AFBECB336B393384A
                      8BEA98A2DB1ACFDEC8DB657693FDD64E812918E7548B306C8D679F81F79DE471
                      3CB8760A2CC0FE8909F8C91ACFBE12B724FE11AFAE9D028F61BA9B34E1C0359E
                      7D3C96BBDE4CDCBE760AF4B5A058F1D6D5F27631D019FE55FF1AA6C1C365F6FB
                      BEB2560A24B677815F397AB57C03BDAE753C69E79A5227BAC64F6CBE96E23B89
                      D9CA41F6D4A513FE402BB0C20BA66BC2DCB5FEE3CF11BEA15B34835906B7A374
                      F3369EAB0AB5B77770DFBA57A06ACF859AD068FF3ACA607C6ABBDAF777D06C9B
                      752BFE60343B3ED1D3139858473B074FD47D572CC0C16B2EA5E17368072579B8
                      323AA9CCCBD949F6D5BD466B49D2B58EB7922E499AD7AD025D92AC2CF0CA0EDC
                      2F26F9A6AFD7BE8764A334E5E53557E07386C3D0E8E0C4978CC7A43A5A17D330
                      559F2431D887B8739D8A4F34988866AF5B8866DF6D47DDD36230D387E06D5BAE
                      6305125B78A0049A79FEA913B5AFE70AB5C5385BAF9D8CCA6A95D82DFDB2284F
                      5596AE92FA8DF44E632655E62436C8C0F4CD16999D4995E7D7F96EAC46CD1E2E
                      A9DD2130DDA17F4BF13D3D0FE67BD068CF5809AEB0DAFDFD62CB6FEC04BF31D6
                      2DCEB64B07DA168E759EBF6089335BE384EDDC06CEF9EB8557FCD8FCBAAD6D36
                      C65685D6D5E59615FC32FB7698791956E8F5D789EF660C98EB4617BAD29FC16C
                      D71BEB372614DAC32674BCBCADEF184BF1DFBAF8B6FF35034B3DEDC435328B6B
                      D0ECE2B610EC00B3EAF6A3C9481D62A9EE86BAC327856389B9DA8F476DF445C5
                      EFA5193FE880DD5553CD1C67B4A37435D8CDB5B3B0D02D458D65EE73A25D7CDB
                      759A71FF17DC05B7E2F14ED8DF63B92BEDDDBE6E70967945F462773A5C773B79
                      11136D6C4B473B5DBFC4504DB4CF2DDA2FFF75831D68FB2431178B3CE11AA7F9
                      7B5F4A12FBA0D9E1AB98F93A3E35D6D1D6B7831F9783C9228FD6F6EC7F34B805
                      F7AF5AF810D36A969AEF990EB66BF6A6719EC7BDAB9CFD2B3C625B679A582B6D
                      5EAAF9C23B9ED182531C88E536EDBCC0F95AD0EC5D1FD784FE9F7F708E5B4DB1
                      A24E9591F672A1BE1DE657F7A6B9F0BCE212BB256EC61B06A8247E81E91ACCC1
                      491DC51FA205E3EC9A24B632C8BD98EF9786EB6F3D5DEDE17857F880F257933A
                      AC5029E7E34D97B6295752B7AAF9B6D78C3E7E8D873A2A3009F7EAA2BFDB4C34
                      C1284FD5FDF34AD38D7191238D2FE640351D31DCF2EA4D69149EEDB06E37F370
                      7CF97A1A97DA178DB6A867DB1EF432D0D27676BFD768D33476F086463B7A0117
                      25894BF17C9238001F7732ED0DB8A7C023F1868A77706A3DD311782FF12C26FA
                      6717180BD5FAD67AFA3AC1151E30B3A8F0A44FF1A6F513A3D1E25BA5309DDD49
                      81415866E324B18D26ECE53FF1583DD34578D856E06BE538D2D2B9436063E3EA
                      F6E26D930BB4D414CDF8AFC2B7A373ED9624BAF8002716FCE3F80F7BA3A9F54E
                      49F98B51066141C10CC3AC551EB7C3C1910E292959B3EBBD58D478488FC23511
                      9715F85A3C50E0EF63A68A19D4C551D3F02F7E84A70AE6128C5FA502DD2DC051
                      89CD7DCF08BB24D633C80887F9A19F15AE3331A31A721D8015364B123DADC400
                      5768AB2B74D788FE6EC4750577172E2FF076ED2B43B760F42A545B85B5934483
                      F7704AE19A80ABF54773A9ACF4C34A3D3CDF76F5780D2714788E650E284B6D9D
                      38A4ED6C27BE67827E75D61E5EF07FC2A8025F8D470A7C32DED7E015FC7B1535
                      1CAF6AB0986AFDA787264ACEBF39F86A92D8051FD9C83C1C5B167CBA6EAFAE6B
                      339C1FE0DD6284015859753A9B5A8E817E518B1A7E89B1BE06D5186D4F345A2F
                      491C844FCA42C33033F15B8C2B824676B07663B533D06AED24513113DF2F33C6
                      E35ABBA1C58E0D49FA24999A3E496657162605F37AA5B1064FAD6883938C4972
                      68D5DAB92BCDD939DF4C924CCC9C74CB11495299973F26392E492A72572B5C66
                      1F9BB7323D951CD390A4779269E95D164F0DD306B7E2FB14FC9FF2517A646892
                      543ECC9335412DB9BB83A0E34AC63426C901B64D92FC21CBB365F6CE9824431A
                      6C921D924CFD4C05FA74C04F4D2ACD9D041D5BB29C3149069510734F1AB36DF6
                      4B92CAE4BC952E3926492A9FE4A524BDF244927EB11F3ED5607A9D07BF4735E9
                      50B148E99615D7EC9D24F5B7BA9E1AA966C5C5DA23CA3A0FE0DA025FA674180C
                      F029F6B33F1657BDF52FBA5B49B5DB55FC7EA724B123546FAE76AE59BDD54FAE
                      3BDBBF2EF028B544CE89F848D724D1172D7E66127856571763523550FE4E7FAC
                      AC66BF0EC4E2E2D74331A72C77125A8D51CD801EAE3BDB73ABE1CA5E68F6E524
                      B191A5F84EE17AA576878CB38D5E16E2A70DC5B17A2779A3B2A2CD033AF87D47
                      776CB576CF24C9BD59916DB27FB1F69B69C8514952599C47EA7C656C9265B938
                      BBE4F80CCC1FB34966E5DA86EC9A645ABE9CE48D5508EA78060AECB46C98D9E9
                      966149525998C7EA04753C72C34AD37B4C921E999573F341C66687BC9FC32A4B
                      A211FD9C86B7AAD7AF89F8B722686A5BFE660E8626894DC10D75D61EDEC9DAD5
                      06DE0696D0DADAF052CD084B5C571A1ADEC1709B5A88051E71A54F5AEDA69B15
                      D8B3CE35774CD27A72BE85A66A63A258BB74C94CC759051E839B0A7C019ADDE3
                      B8D69B24891B315937FB9853976A6C9924FAA0C9FA35D76C0DC9A76152E22DFC
                      B0AC330EBF2DF0CFF0E7020FC382E2DEBDC0657648DBB09B46DC6F535D0D76BE
                      2731B7D04EC06B051E59BB3CE22ADC96B8BC2E833816F3CB212D71BE448F4518
                      52B8AA87F0E32A2D491A2AAF6564E4F0BC93BBB34FDECCE4CF70C17A78F724AF
                      14B7DAAFDCEA0F644936CBC14952792D2FA7926393A4B23CE3EB9CF2CCFC2EB3
                      D23323523F1CE5DD7679EF55053F1E9714F8199C59E0D9B548F92A7E54B0A3D5
                      5AFC2EC0E4020FC5C2EADE24B6F1585BE2D3A64277835DEA3E33AA0554C1CE52
                      9E6D4A2BF6A024B1B116AAAD073FC773B5DF6051352BB4B316AD95437767F94A
                      A2A7111ED784E6CF7C0A294DF8BD8B67B72DF2D53AD71C806525EE1DDCCEDA0B
                      71449DB54F2FF0664E36A1748E78E333DF229C0756DA2029D5DED222E830BC5F
                      B84EC194029F0ECE2D5FB7E3F705DED76E898D0D37BE5659CE32AA9A27AE5A7C
                      0F8BF150CD0023F042817F8A470B7C25EE28F0B5A8D58986607239AA1B38CEB8
                      5A0FE93D57DB67358D099B80236C58BE77726A2D31BD535BD1F1202E2CF09345
                      40B59C59CFDF257A38CA684B0AE503D7394043BEC828CBB598E13E973ACEEE4A
                      4BDE0067B53E589885230B3CBF18ED1B4581216EB7A8889EE706833A3FF67C9E
                      02DBBABB4379BAC28BEE709E43DB5E841CE9C2D243D9AC700DD3D577DD546BE8
                      2D70B343BED8BB6B27ABE89A5EE993DEE99DBED9B9DD7BC2A24CCDB4BC9CE999
                      5A692DE17E9EF3D23D6F64F3542FE6C5F943C6E69172B1AF8D02ED94D920BBA7
                      6FF6489FF449FBF7A0F7322D2F675A66E4F6541FEC96E6C18CC94395656BB0E5
                      AB53A09D323DD337BDD33B7DB247DA77FA96E6FCCCCEA3954FD74CF41A2A50A7
                      4A253BA64FF648BFEC915E793367571E5BF3555AC7FF032E11D4333D0AC4D200
                      00002574455874646174653A63726561746500323031392D30372D3330543233
                      3A30323A31332B30323A3030C2AC67160000002574455874646174653A6D6F64
                      69667900323031392D30372D33305432333A30323A31332B30323A3030B3F1DF
                      AA0000001974455874536F667477617265007777772E696E6B73636170652E6F
                      72679BEE3C1A0000000049454E44AE426082}
                    Stretch = True
                    Version = '1.1.1.0'
                  end
                  object ed_valor_bruto: TJvValidateEdit
                    Left = 81
                    Top = 21
                    Width = 124
                    Height = 31
                    StyleElements = []
                    Align = alRight
                    AutoSize = False
                    BevelInner = bvNone
                    BevelOuter = bvNone
                    BorderStyle = bsNone
                    Color = 6697728
                    CriticalPoints.MaxValueIncluded = False
                    CriticalPoints.MinValueIncluded = False
                    DisplayFormat = dfCurrency
                    DecimalPlaces = 2
                    EditText = '8935,22'
                    Font.Charset = ANSI_CHARSET
                    Font.Color = clWhite
                    Font.Height = -24
                    Font.Name = 'Calibri'
                    Font.Style = [fsBold]
                    ParentFont = False
                    TabOrder = 0
                    ExplicitLeft = 149
                  end
                end
                object Panel31: TPanel
                  Left = 210
                  Top = 0
                  Width = 205
                  Height = 52
                  Align = alLeft
                  BevelOuter = bvNone
                  Color = 6697728
                  Enabled = False
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = 10790052
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  ParentBackground = False
                  ParentFont = False
                  TabOrder = 2
                  StyleElements = []
                  object Label39: TLabel
                    Left = 0
                    Top = 0
                    Width = 205
                    Height = 21
                    Align = alTop
                    Alignment = taRightJustify
                    Caption = 'Taxa de entrega'
                    Color = 11119360
                    Font.Charset = ANSI_CHARSET
                    Font.Color = clWhite
                    Font.Height = -17
                    Font.Name = 'Calibri'
                    Font.Style = [fsBold]
                    ParentColor = False
                    ParentFont = False
                    Transparent = True
                    StyleElements = []
                    ExplicitLeft = 161
                    ExplicitWidth = 112
                  end
                  object AdvOfficeImage3: TAdvOfficeImage
                    Left = 5
                    Top = 4
                    Width = 49
                    Height = 48
                    Picture.Data = {
                      89504E470D0A1A0A0000000D49484452000000400000004008040000000060B9
                      550000000467414D410000B18F0BFC6105000000206348524D00007A26000080
                      840000FA00000080E8000075300000EA6000003A98000017709CBA513C000000
                      02624B47440000AA8D2332000000097048597300000DD700000DD70142289B78
                      0000000774494D4507E3071F01041E79FFCA05000005A34944415468DEED994B
                      4C94571480BFCB8C03C3C8A38022A8158A55415151908AB136DA14AA7DC536DD
                      58E3C6A65D344D30B15DB449BBECA24DECA2E9233E92C6B42655D3342A62224D
                      4AA5848AA2202A42E5311451666490E131AFD345A7E338F30FF0CB0C6C7A36F3
                      CFFDEF3DE73BE7DE7BEEF9FF1FA629922D5FC87519973B725CB6CBDCE9EAD367
                      DC2045725B46C423225E19973BF2A964CD9CF938C99646F1CA43F14AB7544ABC
                      1E2D71D32048E4650A1FD1104736CFB266A600CC6C614E489B813CF2670AC0C8
                      428DD6249E982900C1A9D1EA626CA600C668D068EDA563A60046A8A233A4CDCE
                      9FB44C43A71E112441F64B57D046B4C90FB2597469313E8661858924E2703097
                      4318D9CA422CB819E022C7A857BAB4E9E82D719849228554B2C8619C1A9EE3AA
                      FA430A2966014EAED1A46C8FC6081309FE3F6EC695EFB122204612B160219525
                      E4534821B998B88E934FA8967A9A557384A1060A49F45F7BB9892DBC4B440051
                      CC219E7812C8A28035AC6515E98145EBC04A3E0BD8CE22DC62C7ADB4A63E817D
                      D4038250C461EA26051088C3880123669EA298629E612986B0717D34B00B2FF3
                      39C15D3EA24346F16ACCA789F5FC9B1B52B4775C68040C2CA298524A59434AC4
                      59F132481F69FCC6164A68249EB7A8A103AF46DF3DFEDF260D37C2C2BE56BE97
                      61995C3AE50331CA7239211FCBB7922D5F8B5D8ECAAA307D16391C1853279BB4
                      6C0685454CECE6B5C0A299483A398789659470904A32282795729E96501F8393
                      F5289EC9A6209179CCD5D898BD5CA1893676B31913E0A0995616B19B6AEE2A9F
                      BCC73C14696CE20A7F85000CEB0118A6131B19FEA1A3B4D3420B4DF4328C93E7
                      49F31FBE1DD462A68C22DE553E29623B89401C5B391F02E0A69A65FEEB6AFE9E
                      044079E4185E36E2A5931BDCC2860307838C2B248917C843015E6E7081C5ECA4
                      8B06E07D92FD515BC14AA9530E9074569204282CD4F9EFBA291537E0A24BB569
                      47006E718433F818C2CEA00A5ED31514930480954BB828239FEF189122D67294
                      5D240366D691C72551E4B39FE408EBC7C569E952E39A00CA4D37DDE163248D37
                      79D2EF492BF5E4F00A239C268177F8995FD88A05035042815C067A384E2A8924
                      30C29D10653EDA83B7EBD40EA372D66301E00157E967072B388795552CE7337A
                      A9630129C0625E27131366124920011363B47256B923AB9ECA5990C12E32FDFE
                      B7D344363B18E51466DEE08CEA0439C916528078B651463C664C81E105D4CB80
                      8A78464FA520A9A0C49F1D7C34D24319ABB9C965F258C18F005CA0CD5F882531
                      9F9420F35046F244562605900CF60692F23D2EE3A5807BD4226CE357650550F7
                      A9E15E0405FDB898A04699700A04E0258AF9EF51C38A1313D769A39625ACA632
                      D0B58A0A32833CF7E1C6830B073F31A055074C0900451A95819202B278953A1A
                      E9C142290DEAE10ABFC669CCCCC787170F1EC67030849D160E4F5C254F501109
                      98799B2FC36E8C729B4E86D8A7FA827A1BC927131783DC679061A5AF34D40488
                      931CE989701EF6C887D3363029409A7C1EC1BC4F6AE5C9589B3749998C4400B8
                      2DFB63EF7F8E9C145F04FFAB24375A7622E40149A68CF2084BD4CA057A620A20
                      90CBDE88B5511B35CA4394443B02E96C62839F653CE4DE283769266AA20120B0
                      949D5880710ED2C7A379AC87661EC414800C3652023839CE019C2199BC8B1BFA
                      9EFE2696B0542C90CF8B2433C4590EA8D6B08466D5F7FCAF1B8014D6B3011B55
                      7CA32E86DD7562A53FB600B9AC6398531CD2300F7D742B576C012CD839C2D1E0
                      CA35487AE98DA6792D8076BEA24F0D47E83FC0408C0154FF84731C75007D2FA9
                      041BF6D904F0709FA1D904188A4AA5330D80078C44D7BC5E00A7BED7B0B10018
                      9D5D00176E5DFDA30EE0C5A7AB7FD4017CB30F10E54DF87F04F49F05B30C6098
                      D61796C70408F6D914F6996E0600A29E7CF50234075EB10A7D5A9F1C620D7018
                      3B6E042F367EA76D0A3AA32D5221E7E5AE5C943D921E7DEDFF003304A290A958
                      EA090000002574455874646174653A63726561746500323031392D30372D3330
                      5432333A30343A33302B30323A3030BC7F0AB10000002574455874646174653A
                      6D6F6469667900323031392D30372D33305432333A30343A33302B30323A3030
                      CD22B20D0000001974455874536F667477617265007777772E696E6B73636170
                      652E6F72679BEE3C1A0000000049454E44AE426082}
                    Stretch = True
                    Version = '1.1.1.0'
                  end
                  object ed_total_tx_serv: TJvValidateEdit
                    Left = 79
                    Top = 21
                    Width = 126
                    Height = 31
                    StyleElements = []
                    Align = alRight
                    AutoSize = False
                    BevelInner = bvNone
                    BevelOuter = bvNone
                    BorderStyle = bsNone
                    Color = 6697728
                    CriticalPoints.MaxValueIncluded = False
                    CriticalPoints.MinValueIncluded = False
                    DisplayFormat = dfCurrency
                    DecimalPlaces = 2
                    EditText = '0,00'
                    Font.Charset = ANSI_CHARSET
                    Font.Color = clWhite
                    Font.Height = -24
                    Font.Name = 'Calibri'
                    Font.Style = [fsBold]
                    ParentFont = False
                    TabOrder = 0
                  end
                end
                object Panel33: TPanel
                  Left = 420
                  Top = 0
                  Width = 205
                  Height = 52
                  Align = alLeft
                  BevelOuter = bvNone
                  Color = 6697728
                  Enabled = False
                  ParentBackground = False
                  TabOrder = 4
                  StyleElements = []
                  object Label42: TLabel
                    Left = 0
                    Top = 0
                    Width = 205
                    Height = 21
                    Align = alTop
                    Alignment = taRightJustify
                    Caption = 'Desconto'
                    Color = clWhite
                    Font.Charset = ANSI_CHARSET
                    Font.Color = clWhite
                    Font.Height = -17
                    Font.Name = 'Calibri'
                    Font.Style = [fsBold]
                    ParentColor = False
                    ParentFont = False
                    Transparent = True
                    StyleElements = []
                    ExplicitLeft = 206
                    ExplicitWidth = 67
                  end
                  object AdvOfficeImage1: TAdvOfficeImage
                    Left = 1
                    Top = -7
                    Width = 41
                    Height = 81
                    Picture.Data = {
                      89504E470D0A1A0A0000000D4948445200000020000000200804000000D973B2
                      7F0000000467414D410000B18F0BFC6105000000206348524D00007A26000080
                      840000FA00000080E8000075300000EA6000003A98000017709CBA513C000000
                      02624B47440000AA8D2332000000097048597300000EC400000EC401952B0E1B
                      0000000774494D4507E3071F003B34FB5843D8000002394944415448C7A5953D
                      4F545110869FB3022E41488868F8051616A82895DAD9584A6194686534C44E2D
                      6CC4D8428C86684720DAF899188D40A71590F88106FF80216663B1D10801376C
                      161E0B77D77B2F77F512DFEACEBC73DEC9CC9973075260DE3E43CC13EC334F56
                      38A64ED95DB7BB9D56C7B21ECFFB43D5A227003CEE5755976DCD26D0EF1F8C3B
                      1EB1FAB3093CB5119E6439DEEECF8602253B92F101C0269ED203401BAD74FC45
                      7F9912AB002C7032546A023B2912D81AA42B7C871C40F8C67C822EF225113ECC
                      6CCC331FBE47F9A158ADD70CE0192B75CF2878211633144FB03F42CD8097BD05
                      DEAF7A16CCDBE9624C607FB2A4CF91FC9D56D45E4F577BDF033E8C1D5FAC8D7A
                      AE7ABC9796BA569966B601ADAC0170257CF21CA762F99A3810CD3E6829A23E09
                      DEF1A53947D51706F7B892321383B5C179B0891C00F0A8250B76D9E2FB0683F5
                      C0767C9B426C38E76BCBAE7B0C1CB131DEA40BD430021E73DD355F39EB46BA40
                      5A09BFF1DE16BB2C58F2308003A925A434F13756DC63F0857ADB6D4E7A179C4A
                      6962ED1A2D2404CE811755EDF788BAE16EAFD6D982BDB139081F28C7EEF95918
                      772F370168A604AC53667B9DAFF0B1F128EBA29DE65DA85AF7C05B5E02E72231
                      F1514E3CA6F3E068DDAA78160CDE88C55C8F0BBC8B91330E272EED8BC5448FDE
                      558BFF8F1FCAAEF00D9A0058E239FB80ADFDD296D285DB521E4E0DABEE48C6E7
                      928EB0CA74C3FC9361E59F02C0A3C8F7041311EB71B6EE345A6D4B19575BEA72
                      9D32FB7205F31EDAB4DE0FBA3D2DF61725696A662A36387A0000002574455874
                      646174653A63726561746500323031392D30372D33305432323A35393A35322B
                      30323A3030B4B0EC680000002574455874646174653A6D6F6469667900323031
                      392D30372D33305432323A35393A35322B30323A3030C5ED54D4000000197445
                      5874536F667477617265007777772E696E6B73636170652E6F72679BEE3C1A00
                      00000049454E44AE426082}
                    Version = '1.1.1.0'
                  end
                  object edTotalDescontos: TJvValidateEdit
                    Left = 38
                    Top = 21
                    Width = 167
                    Height = 31
                    StyleElements = []
                    Align = alRight
                    AutoSize = False
                    BevelInner = bvNone
                    BevelOuter = bvNone
                    BorderStyle = bsNone
                    Color = 6697728
                    CriticalPoints.MaxValueIncluded = False
                    CriticalPoints.MinValueIncluded = False
                    DisplayFormat = dfCurrency
                    DecimalPlaces = 2
                    EditText = '0,00'
                    Font.Charset = ANSI_CHARSET
                    Font.Color = clWhite
                    Font.Height = -24
                    Font.Name = 'Calibri'
                    Font.Style = [fsBold]
                    ParentFont = False
                    TabOrder = 0
                    ExplicitLeft = 37
                    ExplicitTop = 15
                  end
                end
                object Panel37: TPanel
                  Left = 205
                  Top = 0
                  Width = 5
                  Height = 52
                  Align = alLeft
                  BevelOuter = bvNone
                  Color = clWhite
                  ParentBackground = False
                  TabOrder = 1
                  StyleElements = []
                  ExplicitLeft = 273
                end
                object Panel38: TPanel
                  Left = 415
                  Top = 0
                  Width = 5
                  Height = 52
                  Align = alLeft
                  BevelOuter = bvNone
                  Color = clWhite
                  ParentBackground = False
                  TabOrder = 3
                  StyleElements = []
                  ExplicitLeft = 551
                end
                object Panel39: TPanel
                  Left = 625
                  Top = 0
                  Width = 5
                  Height = 52
                  Align = alLeft
                  BevelOuter = bvNone
                  Color = clWhite
                  ParentBackground = False
                  TabOrder = 5
                  StyleElements = []
                  ExplicitLeft = 829
                end
                object Panel40: TPanel
                  Left = 630
                  Top = 0
                  Width = 5
                  Height = 52
                  Align = alLeft
                  BevelOuter = bvNone
                  Color = clWhite
                  ParentBackground = False
                  TabOrder = 6
                  StyleElements = []
                  ExplicitLeft = 834
                end
                object Panel11: TPanel
                  Left = 630
                  Top = 0
                  Width = 205
                  Height = 52
                  Align = alRight
                  BevelOuter = bvNone
                  Color = 6697728
                  Enabled = False
                  ParentBackground = False
                  TabOrder = 7
                  StyleElements = []
                  ExplicitLeft = 10
                  object Label9: TLabel
                    Left = 0
                    Top = 0
                    Width = 205
                    Height = 23
                    Align = alTop
                    Alignment = taRightJustify
                    Caption = 'Total'
                    Color = 2657063
                    Font.Charset = ANSI_CHARSET
                    Font.Color = clWhite
                    Font.Height = -19
                    Font.Name = 'Calibri'
                    Font.Style = [fsBold]
                    ParentColor = False
                    ParentFont = False
                    Transparent = True
                    StyleElements = []
                    ExplicitLeft = 167
                    ExplicitWidth = 38
                  end
                  object AdvOfficeImage5: TAdvOfficeImage
                    Left = 5
                    Top = 0
                    Width = 49
                    Height = 52
                    Picture.Data = {
                      89504E470D0A1A0A0000000D49484452000000400000004008040000000060B9
                      550000000467414D410000B18F0BFC6105000000206348524D00007A26000080
                      840000FA00000080E8000075300000EA6000003A98000017709CBA513C000000
                      02624B47440000AA8D2332000000097048597300000DD700000DD70142289B78
                      0000000774494D4507E3071F01070A48084DBB000007BF4944415468DECD997B
                      5094E715C67FEFB22C9715969BA8A351A3C6BB18143B552356A5C6694CD44C63
                      5343D444D399261D4D339D74A69969274E326DDA4E9ACE541DDB491B63ADD2AA
                      21B6716262A2D824B578A988977A41AC80800888E8B25C769FFE81C07EEC2EB0
                      02699FFFF6BCFB9EF37CE79CF79CF3BD1FFC8F61FA4BB16C24308D3124114935
                      D739CB65E3FE5208C890CA7C9692412C91D83078F1D2C4153E279713A6A95F09
                      28892C9E268D446C1472856A3C24329029A4E0A18C4FD9C171E3EB27021A4F36
                      CB184209B9E4730D378DF888248A04C6924526D11C673BBB8CA7EF7D8F666893
                      4A7451BF54968629D2B286E23559ABB55795CAD77A0DE87BF393B549A5CAD73A
                      8D96AD5DFAB89E565CFBAF78CDD56695E8A49E5344DF9A4FD1EBBAAA7F6AAD52
                      2DF2033AA9E16A0FB5223555BF56B9BED0C37D69DE285BA7745E2F7698974D09
                      5AA85BF2699DC629AA5D1EA174BDAB1AED564ADF1118A65CDDD09B1AE3677E90
                      D6294F2DF2EABC36EAAB8A695F8B5296FEA54A65833D40553449C4857D3A1630
                      99623EE672BBC4C93C7E84F81B4D8C61250EDED4B956B5A65185E4F00A6BB53B
                      80000FF008A3C376C10C06B383C28EF3CD40B271B1990D34F00D5E63091F7189
                      E6BBAB557CC41AD2191F4860162F11471D0AC37C3471DCE224E57E3227E978F8
                      85B909BCA7C52C6308B1D4B52E1A9FAE7388A7783890801D0797D8414B1804A6
                      F008A7B966BC16A90F70083090C708AAF15FBFC567AC624E802E7D4F75DADD91
                      B33D81D6A844DB34C9221BA9DD6AD06F9420A7A26593A3A33600C8A1D96A51A1
                      2D409BC1207C848314ECD4622DAE95FC0E1F2F708C7758C730BCC6AAB3991B18
                      86042740581900B144E0B13818D3C02196729AD17C9337F882C51DC710C08826
                      9A7186F2407804DC7849A073D81A39C46C26B19C0F88E365A6594210810B3B95
                      F620EAC2F740194DA460794225309766B34F17B8423EEF92CE589D300DED7F70
                      3018511E482088079480936A3C21AB53216E26926C910DE1559AF4B169A64525
                      1491461231741070321D2F85DDE68062F50A39E4B095C7E40A41E022C50C6294
                      A5C51A1C8C6336002E86E2A09E46BF751799B470209807C0E7F7ACCFF02C89B8
                      99482A6E7D0A243098CEADB4021F99E453D02EA9651FEBD9A0ADDC612E533947
                      51C739512C939846358783E580152B18CE6B5CE019A631957C52799C87E8ECB9
                      51C4F0350EABC8DCBE2BA92187F12C249946EEA792B739DD56A804C3584E1439
                      5C0F95031D48C17089132C258A1822886420E3080C5D15292CA548874D0BDC6D
                      383FE7142F11C5760EB09FEBEDFF4D6511F3B8CAEF8D2F4408FC7E1F64042B99
                      C734AAB88A9B3276732E08812896309515D4AAA0B5E4188FFE4E216B48E4B71C
                      E9988595C002B231ECA420483B6EF3513BDE2695494CA48A7DE49B461A39C291
                      205B0CD7F83E5934F2079D6A356744ADDE27898B34B52B1E4416AB19C57B6C35
                      DE60048C75163047F5133249E03287B9163A558CF421293CC71212D9A602CA4D
                      EB63FC94286E98B6D41BC9429E6434FBD96C4A2038016B08308514D2039806ED
                      C4C3B364319E5D1C540535DC31C520A3685C24338147998F21972DE644EBAE4E
                      0414A40E6A004944E2A686C6AE072553AF9D94B39699BC4C36791CA158F5F888
                      2685346692413457789F77CC7FDAF674F640402B9293452C258533FC8502BF4A
                      169C42330754C02256318127598B9D06DCC4034D3450432EDB386AFC668DEE93
                      70095BB0D3C20232785507314412D90587666E986DDA431A8BF816E38008CAA8
                      E20C79E471B5D3D012D403D64EF00362F819C778919964908F8B652C26D44B45
                      037F6507B7CD1DFEA17F13C50F799D8DD49990CDAD7B02A9187239C902A6108F
                      931164D1D52BC54D3EE1B6DFEF063CA68BDE1A9C80B5102DE78F543011514435
                      35ACE757410A512B1A29A59430D06D12B281546631923A36729016A0948A90FA
                      14307ADD03016B088A799EB1B828E5D2DD82E2C5DB7303BD26605A285219763C
                      B4F4C77D4EE7580619496548611871F4EDEB74080F00560F289EB564E0A482BD
                      FADCDCEC6F028139F0042FE0C4CD1C46E2561EC2892BA43E2FF5E64E6F095843
                      B09AE1BC4511DF6606E91CC3C502A67741E088F687E3A7EE3D30081BC7282093
                      0719808344BEC2A321EB400B4D1CA64F097CC67DACE40A19D47195DB94B297B2
                      9009D9C4516AFB36049B18CE441EA49E3FDF9D88F6B33F1C13BDF48039A6E759
                      4832E7C833957D67B86B02D689E80217FADE701B7A5088FA17C1B2F94B340F76
                      8D21CD2FA79D4CC0C1037A220C1D973863BD010F8B008770590671077616313F
                      0C1D6EE6E862784DD89FC010BC7C4858E5D382C524E3C416E6A58E1F011B6EDE
                      086F8AB16026B1BDB9F4B703A2AC634E0F170AE73A2F086CBDDBDE1386DD11F0
                      E020A21727CF83880EFA208618C0DD35051B15D8198CE39E0994E3E3BEA0FB23
                      1941EBDD4997048EE3E521E2EF99C071BC64068E28B23388341A39DBF5086B63
                      0F1E96313EBCCB593F7C401D5F275D4E8B7943324B18CA518ABB39A04AD401B9
                      B545B3E4BC974C9043DB755BBBB450AEB60F33B26BA8D6A848D7B4A2BBFD7653
                      AB3771B10217BB38AF7A5AC2EE05394CE7319CECE4946EE2258AC164B28A01E4
                      B2A7BBCD06404FF15D26D1402117A8BF876634977462B9C929CEE26620698CA1
                      924FF8B1A9E86E6B9BD3A6F31DE6904464AF2B83F0E2A188EDFCA927F3B15F11
                      D5FDA431EA1EBE1759D14C15A72908F6A1FAFF12FF05C0D21CC1E2B693FC0000
                      002574455874646174653A63726561746500323031392D30372D33305432333A
                      30373A31302B30323A3030156DB6CF0000002574455874646174653A6D6F6469
                      667900323031392D30372D33305432333A30373A31302B30323A303064300E73
                      0000001974455874536F667477617265007777772E696E6B73636170652E6F72
                      679BEE3C1A0000000049454E44AE426082}
                    Stretch = True
                    Version = '1.1.1.0'
                  end
                  object ed_total_conta: TJvValidateEdit
                    Left = 81
                    Top = 23
                    Width = 124
                    Height = 29
                    StyleElements = []
                    Align = alRight
                    AutoSize = False
                    BevelInner = bvNone
                    BevelOuter = bvNone
                    BorderStyle = bsNone
                    Color = 6697728
                    CriticalPoints.MaxValueIncluded = False
                    CriticalPoints.MinValueIncluded = False
                    DisplayFormat = dfCurrency
                    DecimalPlaces = 2
                    EditText = '0,00'
                    Font.Charset = ANSI_CHARSET
                    Font.Color = clWhite
                    Font.Height = -24
                    Font.Name = 'Calibri'
                    Font.Style = [fsBold]
                    ParentFont = False
                    TabOrder = 0
                  end
                end
              end
              object cxGrid2: TcxGrid
                Left = 0
                Top = 0
                Width = 835
                Height = 371
                Align = alClient
                BevelInner = bvNone
                BevelOuter = bvNone
                BorderStyle = cxcbsNone
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -15
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 3
                LookAndFeel.NativeStyle = True
                ExplicitTop = 8
                object tbViewDetalhado: TcxGridDBTableView
                  PopupMenu = PopMovimento
                  Navigator.Buttons.CustomButtons = <>
                  ScrollbarAnnotations.CustomAnnotations = <>
                  DataController.DataSource = dm.dsTbMovimentoMesa
                  DataController.Summary.DefaultGroupSummaryItems = <
                    item
                      Format = '# Lan'#231'amento(s)'
                      Kind = skCount
                      Position = spFooter
                      Column = tbViewDetalhadoDESCRICAO
                    end
                    item
                      Kind = skSum
                      Position = spFooter
                    end
                    item
                      Format = '#0.000'
                      Kind = skSum
                    end
                    item
                      Kind = skSum
                      Position = spFooter
                    end
                    item
                      Format = '#0.000'
                      Kind = skSum
                    end
                    item
                      Format = '#0.00'
                      Kind = skSum
                      Position = spFooter
                      Column = tbViewDetalhadoTOTAL
                    end
                    item
                      Format = '#0.00'
                      Kind = skSum
                      Column = tbViewDetalhadoTOTAL
                    end
                    item
                      Kind = skSum
                      Position = spFooter
                      Column = tbViewDetalhadoQuantidade
                    end>
                  DataController.Summary.FooterSummaryItems = <
                    item
                      Format = '# Lan'#231'amento(s)'
                      Kind = skCount
                      Column = tbViewDetalhadoDESCRICAO
                    end
                    item
                      Kind = skSum
                    end
                    item
                      Format = '#0.000'
                      Kind = skSum
                    end
                    item
                      Format = '#0.00'
                      Kind = skSum
                      Column = tbViewDetalhadoTOTAL
                    end
                    item
                      Kind = skSum
                      Column = tbViewDetalhadoQuantidade
                    end>
                  DataController.Summary.SummaryGroups = <>
                  OptionsBehavior.DragHighlighting = False
                  OptionsBehavior.DragOpening = False
                  OptionsBehavior.DragScrolling = False
                  OptionsBehavior.ShowHourglassCursor = False
                  OptionsBehavior.ColumnHeaderHints = False
                  OptionsBehavior.CopyPreviewToClipboard = False
                  OptionsBehavior.ExpandMasterRowOnDblClick = False
                  OptionsBehavior.ImmediateEditor = False
                  OptionsCustomize.ColumnHidingOnGrouping = False
                  OptionsCustomize.ColumnHorzSizing = False
                  OptionsCustomize.ColumnMoving = False
                  OptionsData.CancelOnExit = False
                  OptionsData.Deleting = False
                  OptionsData.DeletingConfirmation = False
                  OptionsData.Inserting = False
                  OptionsSelection.HideFocusRectOnExit = False
                  OptionsSelection.UnselectFocusedRecordOnExit = False
                  OptionsView.NoDataToDisplayInfoText = 'Sem dados para exibir'
                  OptionsView.CellAutoHeight = True
                  OptionsView.ExpandButtonsForEmptyDetails = False
                  OptionsView.Footer = True
                  OptionsView.GridLineColor = clBlack
                  OptionsView.GroupByBox = False
                  OptionsView.GroupFooterMultiSummaries = True
                  OptionsView.GroupFooters = gfVisibleWhenExpanded
                  OptionsView.GroupRowHeight = 24
                  OptionsView.GroupSummaryLayout = gslAlignWithColumns
                  OptionsView.Indicator = True
                  OptionsView.IndicatorWidth = 7
                  Styles.Content = cxStyle1
                  Styles.ContentOdd = cxStyle2
                  object tbViewDetalhadoCOD_BARRAS: TcxGridDBColumn
                    Caption = 'C'#243'digo'
                    DataBinding.FieldName = 'COD_BARRAS'
                    DataBinding.IsNullValueType = True
                    Options.Editing = False
                    Width = 55
                  end
                  object tbViewDetalhadoDESCRICAO: TcxGridDBColumn
                    Caption = 'Descri'#231#227'o'
                    DataBinding.FieldName = 'DESCRICAO'
                    DataBinding.IsNullValueType = True
                    Options.Editing = False
                    Width = 300
                  end
                  object tbViewDetalhadoQuantidade: TcxGridDBColumn
                    Caption = 'Qtde'
                    DataBinding.FieldName = 'Quantidade'
                    DataBinding.IsNullValueType = True
                    PropertiesClassName = 'TcxCurrencyEditProperties'
                    Options.Editing = False
                    Width = 75
                  end
                  object tbViewDetalhadoVALOR_UNITARIO: TcxGridDBColumn
                    Caption = 'Pre'#231'o'
                    DataBinding.FieldName = 'VALOR_UNITARIO'
                    DataBinding.IsNullValueType = True
                    PropertiesClassName = 'TcxCurrencyEditProperties'
                    Options.Editing = False
                    Width = 75
                  end
                  object tbViewDetalhadoDESCONTO: TcxGridDBColumn
                    Caption = 'Desc.'
                    DataBinding.FieldName = 'DESCONTO'
                    DataBinding.IsNullValueType = True
                    Options.Editing = False
                    Width = 50
                  end
                  object tbViewDetalhadoTOTAL: TcxGridDBColumn
                    Caption = 'Total'
                    DataBinding.FieldName = 'TOTAL'
                    DataBinding.IsNullValueType = True
                    PropertiesClassName = 'TcxCurrencyEditProperties'
                    Options.Editing = False
                    Width = 90
                  end
                  object tbViewDetalhadoOBSERVACOES: TcxGridDBColumn
                    Caption = 'Observa'#231#245'es'
                    DataBinding.FieldName = 'Quantidade'
                    DataBinding.IsNullValueType = True
                    Options.Editing = False
                    Width = 140
                  end
                end
                object lvDetalhado: TcxGridLevel
                  GridView = tbViewDetalhado
                end
              end
            end
          end
        end
        object pnFormasPagamento: TPanel
          Tag = 99
          Left = 837
          Top = 200
          Width = 400
          Height = 449
          Align = alRight
          BevelOuter = bvNone
          Color = clWhite
          TabOrder = 5
          StyleElements = []
          ExplicitLeft = 833
          ExplicitHeight = 448
          object pageList2: TJvPageList
            Left = 3
            Top = 0
            Width = 397
            Height = 449
            ActivePage = pgFormasPagto
            PropagateEnable = False
            Align = alClient
            ExplicitLeft = 49
            ExplicitTop = 1
            ExplicitWidth = 398
            ExplicitHeight = 446
            object pgFormasPagto: TJvStandardPage
              Left = 0
              Top = 0
              Width = 397
              Height = 449
              Caption = '.'
              ExplicitLeft = 8
              ExplicitWidth = 398
              ExplicitHeight = 446
              object Panel9: TPanel
                Left = 0
                Top = 347
                Width = 397
                Height = 15
                Align = alBottom
                BevelOuter = bvNone
                Color = clWhite
                ParentBackground = False
                TabOrder = 0
                StyleElements = []
                ExplicitLeft = 5
                ExplicitTop = 349
                ExplicitWidth = 398
              end
              object Panel14: TPanel
                Left = 0
                Top = 362
                Width = 397
                Height = 87
                Align = alBottom
                BevelOuter = bvNone
                Color = clWhite
                ParentBackground = False
                TabOrder = 1
                StyleElements = []
                ExplicitTop = 359
                ExplicitWidth = 398
                object btSair: TPngSpeedButton
                  Left = 197
                  Top = 0
                  Width = 200
                  Height = 87
                  Align = alRight
                  Caption = 'Sair'
                  Flat = True
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = 12615680
                  Font.Height = -17
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  ParentFont = False
                  OnClick = btSairClick
                  PngImage.Data = {
                    89504E470D0A1A0A0000000D49484452000000300000003008060000005702F9
                    87000000097048597300000B1300000B1301009A9C18000002E74944415478DA
                    ED994D68134114C7DF6C623606AD54442F0A457B49EC490F1EFC486A40B03D88
                    172F1669D15A905AA916F550CC56F1A4496DA1A8D08AE2C11A443C885F55B22B
                    568B062F25151504455104F55083A6C68CFF7C341A8D3469BE76611EBC37B3C9
                    CC7BEF97373BD94C18195C58A5131000954E4000CC388273463DF77DE86CC4F0
                    2FC50BCD39CC13B44749A9FF5A3A0045DD033BF0D7B45198688100F1D8ABA037
                    49716D2B25C06DD83A04BC88E1CDE82F81BEC3F57922F33952D6BF9A3583A29D
                    809F0E00C82504D0D464EB74D1D9E01C7A3FD94824ED42E0CD7855828B7B44B1
                    41F4AF61297CCF0F20A060BE0700B3BE17F303C80CBE14B6192E76A2AD817E4E
                    54499286E888735CFF00E9F739AAA0E2062754856D456B813E86E741B29A87E9
                    D0BA497D036426B408B6096E5BD13AA0616248D0E3F41A03605A125BAFBA06EE
                    1F41B5FF574FAF00B9CE1500024000FC0360ED7DB19CFF8CDEA2186B8F1CB4DF
                    311C0029419B3CCFF6003D3B20B6CC04A13F80B8F8420BE518BB9B0B4445014C
                    C7C62E4816EB0E49B26859523373E2AB19232B2E3645BA1C2302A0D800865F42
                    5901FA5F56C9533FD45C922F1A80D51B7213A70D2C4A43DF0EAF7C530880EC0B
                    D522F111685BD9B651F964682F5C9D4AB9BC8E07ECEEA9FDF671437D91CDF58E
                    2FE3DCB41BBFD45BE1F552E480A3D3500069F173134D6041292C664C807CE60A
                    0001200004402E478B37601720C8DAE203A8C761BB4A7BB4D8A3B511E767D0BB
                    42C4FBC8E31A25C6786E006A6A1CCBF2B459AEC3DDC4198FD6895E37B41AFA14
                    00FD541D1EA68E86480100653A5E4F2713B411859B10701F254FDD3E4251197E
                    1A097CC83EA780FBA7E800BF3FB8F8A99B1B53E3208D94FC9FE072627929F541
                    FD03642418A8850B3C89520B743EF421AEFB8862570113D53F401A64AC8A58A4
                    05D589C3AC80BE454506E07E3BF493FE01A6C5EF37D1B3C50DD860B0BCB83BF5
                    EA6BEC3235C600F85394401D6C3B76ACE7D87A7B8D07502611009516015069F9
                    05E62CD0407CB9956E0000000049454E44AE426082}
                  ExplicitTop = -9
                end
                object btGravar: TPngSpeedButton
                  Left = 22
                  Top = 0
                  Width = 169
                  Height = 87
                  Caption = 'Salvar'
                  Flat = True
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = 12615680
                  Font.Height = -17
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  ParentFont = False
                  StyleElements = []
                  OnClick = btGravarClick
                  PngImage.Data = {
                    89504E470D0A1A0A0000000D49484452000000300000003008060000005702F9
                    87000000097048597300000B1300000B1301009A9C18000001C34944415478DA
                    EDD5B14AC3401CC7F17F0407C1A98AE003B88993B35217ABA3B5A338BAF90205
                    89833E834E3E8288D549458B75F21D1C7D81B6600B8D5792188E5C2E97BBFFDD
                    3F91FE202453F2FD10423CA8F83CEA8019803AE07F032EBAABD0DEFAAE26E0FC
                    ED1882E00A2068815FEF540B10C6DF447D2386686621CA07E0E3E36522CA0510
                    C74B11E501C8E33311E500A8C50B11F48062F129042D402F9E43D001CCE2E3DD
                    D20070E21FA1363C700F408C87D3FD9FFC9B5C7FCEC3C9E6B88CF1907B23BFBB
                    0130B9631FCB11FBE2DFCB162F0784F1CFEC6A991D03866868232CC56703F8F8
                    787A088BF16280383E5E9F21F6941128F1DE03D4064D517C1A208F4F10739306
                    9CEDF4A8E379805ABC1AC2517C0228162F47388C0F017AF10902BC5DF0B73F28
                    E223C0EB0B3BD7F51F18213C58731D1F017A2B00E3E91B5837400CD9B1E03A1E
                    FE1E888330985E7C02A04574D84FEA50279E07D0208CE2D300B708E37831C00D
                    02253E1B601781162F07D841A0C6E7037011E8F16A001CC43D8B6F61C7AB03CC
                    10D6E28B01F41056E38B038A21ACC7EB01D4104EE2F5017284B378338018E134
                    DE1CC023BE5CC7E300A6BB7C5A82C551DF753C1E80703300F52A0FF805AABD5C
                    08268EC5A70000000049454E44AE426082}
                end
              end
              object Panel13: TPanel
                Left = 0
                Top = 128
                Width = 397
                Height = 219
                Align = alClient
                Caption = 'Panel13'
                TabOrder = 2
                ExplicitLeft = 62
                ExplicitTop = 144
                ExplicitWidth = 398
                ExplicitHeight = 217
                object Panel22: TPanel
                  Tag = 99
                  Left = 1
                  Top = 1
                  Width = 395
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
                  ExplicitWidth = 388
                  object Shape5: TShape
                    Left = 0
                    Top = 0
                    Width = 21
                    Height = 16
                    Align = alLeft
                    Pen.Color = 40176
                    Pen.Width = 10
                    Shape = stCircle
                  end
                  object Label19: TLabel
                    Left = 21
                    Top = 0
                    Width = 374
                    Height = 16
                    Align = alClient
                    Caption = 'Formas de pagamento do pedido'
                    Font.Charset = ANSI_CHARSET
                    Font.Color = clWhite
                    Font.Height = -15
                    Font.Name = 'Calibri'
                    Font.Style = [fsBold]
                    ParentFont = False
                    StyleElements = []
                    ExplicitLeft = 27
                    ExplicitTop = -1
                    ExplicitWidth = 375
                  end
                end
                object Panel24: TPanel
                  Left = 1
                  Top = 17
                  Width = 395
                  Height = 201
                  Align = alClient
                  BevelOuter = bvNone
                  Color = clWhite
                  ParentBackground = False
                  TabOrder = 1
                  StyleElements = []
                  ExplicitLeft = 3
                  ExplicitTop = 18
                  object Label22: TLabel
                    Left = 348
                    Top = 8
                    Width = 35
                    Height = 18
                    AutoSize = False
                    Caption = 'Valor'
                    Font.Charset = ANSI_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -15
                    Font.Name = 'Calibri'
                    Font.Style = [fsBold]
                    ParentFont = False
                  end
                  object Label23: TLabel
                    Left = 2
                    Top = 8
                    Width = 216
                    Height = 18
                    AutoSize = False
                    Caption = 'Selecione a forma de pagamento'
                    Font.Charset = ANSI_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -15
                    Font.Name = 'Calibri'
                    Font.Style = [fsBold]
                    ParentFont = False
                  end
                  object Label4: TLabel
                    Left = 137
                    Top = 158
                    Width = 152
                    Height = 20
                    Alignment = taRightJustify
                    AutoSize = False
                    Caption = 'Total de pagamentos:'
                    Font.Charset = ANSI_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -16
                    Font.Name = 'Calibri'
                    Font.Style = [fsBold]
                    ParentFont = False
                  end
                  object Label10: TLabel
                    Left = 157
                    Top = 176
                    Width = 134
                    Height = 20
                    Alignment = taRightJustify
                    AutoSize = False
                    Caption = 'Troco:'
                    Font.Charset = ANSI_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -16
                    Font.Name = 'Calibri'
                    Font.Style = [fsBold]
                    ParentFont = False
                  end
                  object edValorForma: TEdit
                    Tag = 99
                    Left = 244
                    Top = 27
                    Width = 142
                    Height = 27
                    Alignment = taRightJustify
                    Font.Charset = ANSI_CHARSET
                    Font.Color = clBlack
                    Font.Height = -16
                    Font.Name = 'Calibri'
                    Font.Style = []
                    ParentFont = False
                    TabOrder = 1
                    StyleElements = []
                    OnEnter = Edit1Enter
                    OnExit = edValorFormaExit
                    OnKeyDown = Edit1KeyDown
                  end
                  object Panel26: TPanel
                    Left = 0
                    Top = 60
                    Width = 396
                    Height = 92
                    BevelOuter = bvNone
                    Caption = 'Panel24'
                    Color = clWhite
                    ParentBackground = False
                    TabOrder = 2
                    object DBGrid1: TDBGrid
                      Left = 0
                      Top = 0
                      Width = 396
                      Height = 92
                      Align = alClient
                      DataSource = dmPedidoDelivery.dsFormasPagtoTemp
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -19
                      Font.Name = 'MS Sans Serif'
                      Font.Style = []
                      Options = [dgIndicator, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
                      ParentFont = False
                      PopupMenu = popFormasPagamento
                      ReadOnly = True
                      TabOrder = 0
                      TitleFont.Charset = DEFAULT_CHARSET
                      TitleFont.Color = clWindowText
                      TitleFont.Height = -11
                      TitleFont.Name = 'MS Sans Serif'
                      TitleFont.Style = []
                      Columns = <
                        item
                          Expanded = False
                          FieldName = 'descricaoForma'
                          Font.Charset = DEFAULT_CHARSET
                          Font.Color = clWindowText
                          Font.Height = -21
                          Font.Name = 'MS Sans Serif'
                          Font.Style = []
                          Width = 240
                          Visible = True
                        end
                        item
                          Expanded = False
                          FieldName = 'valorForma'
                          Width = 120
                          Visible = True
                        end>
                    end
                  end
                  object edCodFormaPagamento: TcxLookupComboBox
                    Left = 2
                    Top = 27
                    ParentFont = False
                    Properties.DropDownAutoSize = True
                    Properties.DropDownRows = 25
                    Properties.ImmediateDropDownWhenActivated = True
                    Properties.ImmediatePost = True
                    Properties.IncrementalFilteringOptions = [ifoUseContainsOperator]
                    Properties.KeyFieldNames = 'COD_FORMA'
                    Properties.ListColumns = <
                      item
                        Caption = 'C'#243'digo'
                        FieldName = 'COD_FORMA'
                      end
                      item
                        Caption = 'Descri'#231#227'o da forma'
                        FieldName = 'DESCRICAO'
                      end>
                    Properties.ListFieldIndex = 1
                    Properties.ListSource = dmPedidoDelivery.dsQryCsFormasPagamento
                    Properties.ReadOnly = False
                    EditValue = ''
                    Style.Font.Charset = ANSI_CHARSET
                    Style.Font.Color = clWindowText
                    Style.Font.Height = -16
                    Style.Font.Name = 'Calibri'
                    Style.Font.Style = []
                    Style.IsFontAssigned = True
                    TabOrder = 0
                    OnEnter = edCodFormaPagamentoEnter
                    OnKeyDown = edCodFormaPagamentoKeyDown
                    Width = 226
                  end
                  object Panel4: TPanel
                    Tag = 99
                    Left = 0
                    Top = 201
                    Width = 395
                    Height = 0
                    Align = alBottom
                    BevelOuter = bvNone
                    Color = 7960943
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWhite
                    Font.Height = -13
                    Font.Name = 'MS Sans Serif'
                    Font.Style = []
                    ParentBackground = False
                    ParentFont = False
                    TabOrder = 3
                    StyleElements = []
                  end
                  object ed_total_pago: TJvValidateEdit
                    Left = 295
                    Top = 158
                    Width = 99
                    Height = 20
                    StyleElements = []
                    AutoSize = False
                    BevelInner = bvNone
                    BevelOuter = bvNone
                    BorderStyle = bsNone
                    Color = clWhite
                    CriticalPoints.MaxValueIncluded = False
                    CriticalPoints.MinValueIncluded = False
                    DisplayFormat = dfCurrency
                    DecimalPlaces = 2
                    EditText = '0,00'
                    Font.Charset = ANSI_CHARSET
                    Font.Color = clBlack
                    Font.Height = -16
                    Font.Name = 'Calibri'
                    Font.Style = [fsBold]
                    ParentFont = False
                    TabOrder = 4
                  end
                  object edTroco: TJvValidateEdit
                    Left = 295
                    Top = 176
                    Width = 99
                    Height = 20
                    StyleElements = []
                    AutoSize = False
                    BevelInner = bvNone
                    BevelOuter = bvNone
                    BorderStyle = bsNone
                    Color = clWhite
                    CriticalPoints.MaxValueIncluded = False
                    CriticalPoints.MinValueIncluded = False
                    DisplayFormat = dfCurrency
                    DecimalPlaces = 2
                    EditText = '0,00'
                    Font.Charset = ANSI_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -16
                    Font.Name = 'Calibri'
                    Font.Style = [fsBold]
                    ParentFont = False
                    TabOrder = 5
                  end
                end
              end
              object Panel8: TPanel
                Left = 0
                Top = 64
                Width = 397
                Height = 64
                Align = alTop
                Caption = 'Panel13'
                TabOrder = 3
                ExplicitTop = 0
                ExplicitWidth = 398
                object Panel10: TPanel
                  Tag = 99
                  Left = 1
                  Top = 1
                  Width = 395
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
                  ExplicitWidth = 396
                  object Shape3: TShape
                    Left = 0
                    Top = 0
                    Width = 21
                    Height = 16
                    Align = alLeft
                    Pen.Color = 40176
                    Pen.Width = 10
                    Shape = stCircle
                  end
                  object Label8: TLabel
                    Left = 21
                    Top = 0
                    Width = 374
                    Height = 16
                    Align = alClient
                    Caption = 'Dados para emiss'#227'o de NFC-e'
                    Font.Charset = ANSI_CHARSET
                    Font.Color = clWhite
                    Font.Height = -15
                    Font.Name = 'Calibri'
                    Font.Style = [fsBold]
                    ParentFont = False
                    StyleElements = []
                    ExplicitWidth = 182
                    ExplicitHeight = 18
                  end
                end
                object Panel34: TPanel
                  Left = 1
                  Top = 17
                  Width = 395
                  Height = 46
                  Align = alClient
                  BevelOuter = bvNone
                  Color = clWhite
                  ParentBackground = False
                  TabOrder = 1
                  StyleElements = []
                  ExplicitWidth = 396
                  object Label7: TLabel
                    Left = 4
                    Top = 0
                    Width = 65
                    Height = 18
                    Caption = 'CPF / CNPJ'
                    Font.Charset = ANSI_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -15
                    Font.Name = 'Calibri'
                    Font.Style = [fsBold]
                    ParentFont = False
                    StyleElements = []
                  end
                  object Label11: TLabel
                    Left = 122
                    Top = 0
                    Width = 124
                    Height = 18
                    Caption = 'Nome / Raz'#227'o social'
                    Font.Charset = ANSI_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -15
                    Font.Name = 'Calibri'
                    Font.Style = [fsBold]
                    ParentFont = False
                    StyleElements = []
                  end
                  object edCpf: TEdit
                    Left = 4
                    Top = 18
                    Width = 114
                    Height = 24
                    CharCase = ecUpperCase
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -15
                    Font.Name = 'MS Sans Serif'
                    Font.Style = []
                    MaxLength = 14
                    ParentFont = False
                    TabOrder = 0
                    StyleElements = []
                    OnEnter = Edit1Enter
                    OnKeyDown = Edit1KeyDown
                  end
                  object edNomeClienteNota: TEdit
                    Left = 122
                    Top = 18
                    Width = 258
                    Height = 24
                    CharCase = ecUpperCase
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -15
                    Font.Name = 'MS Sans Serif'
                    Font.Style = []
                    MaxLength = 30
                    ParentFont = False
                    TabOrder = 1
                    StyleElements = []
                    OnEnter = Edit1Enter
                    OnKeyDown = Edit1KeyDown
                  end
                end
              end
              object Panel25: TPanel
                Left = 0
                Top = 0
                Width = 397
                Height = 64
                Align = alTop
                Caption = 'Panel13'
                TabOrder = 4
                ExplicitTop = 8
                ExplicitWidth = 398
                object Panel35: TPanel
                  Tag = 99
                  Left = 1
                  Top = 1
                  Width = 395
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
                  ExplicitWidth = 396
                  object Shape4: TShape
                    Left = 0
                    Top = 0
                    Width = 21
                    Height = 16
                    Align = alLeft
                    Pen.Color = 40176
                    Pen.Width = 10
                    Shape = stCircle
                  end
                  object Label15: TLabel
                    Left = 21
                    Top = 0
                    Width = 374
                    Height = 16
                    Align = alClient
                    Caption = 'Agendamento da entrega do pedido'
                    Font.Charset = ANSI_CHARSET
                    Font.Color = clWhite
                    Font.Height = -15
                    Font.Name = 'Calibri'
                    Font.Style = [fsBold]
                    ParentFont = False
                    StyleElements = []
                    ExplicitWidth = 223
                    ExplicitHeight = 18
                  end
                end
                object Panel36: TPanel
                  Left = 1
                  Top = 17
                  Width = 395
                  Height = 46
                  Align = alClient
                  BevelOuter = bvNone
                  Color = clWhite
                  ParentBackground = False
                  TabOrder = 1
                  StyleElements = []
                  ExplicitWidth = 396
                  object Label16: TLabel
                    Left = 102
                    Top = 1
                    Width = 48
                    Height = 16
                    Caption = 'Hor'#225'rio:'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -15
                    Font.Name = 'MS Sans Serif'
                    Font.Style = []
                    ParentFont = False
                    StyleElements = []
                  end
                  object Label18: TLabel
                    Left = 5
                    Top = 1
                    Width = 29
                    Height = 16
                    Caption = 'Data'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -15
                    Font.Name = 'MS Sans Serif'
                    Font.Style = []
                    ParentFont = False
                    StyleElements = []
                  end
                  object edDataEntrega: TAdvDateTimePicker
                    Left = 5
                    Top = 17
                    Width = 91
                    Height = 24
                    Date = 43537.000000000000000000
                    Format = ''
                    Time = 0.668379629627452200
                    DoubleBuffered = True
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -15
                    Font.Name = 'MS Sans Serif'
                    Font.Style = []
                    Kind = dkDate
                    ParentDoubleBuffered = False
                    ParentFont = False
                    TabOrder = 0
                    BorderStyle = bsSingle
                    Ctl3D = True
                    DateTime = 43537.668379629630000000
                    Version = '1.3.6.6'
                    LabelFont.Charset = DEFAULT_CHARSET
                    LabelFont.Color = clWindowText
                    LabelFont.Height = -11
                    LabelFont.Name = 'Tahoma'
                    LabelFont.Style = []
                  end
                  object edHoraEntrega: TAdvDateTimePicker
                    Left = 102
                    Top = 17
                    Width = 70
                    Height = 24
                    Date = 43537.000000000000000000
                    Format = ''
                    Time = 0.668379629627452200
                    DoubleBuffered = True
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -15
                    Font.Name = 'MS Sans Serif'
                    Font.Style = []
                    Kind = dkTime
                    ParentDoubleBuffered = False
                    ParentFont = False
                    TabOrder = 1
                    BorderStyle = bsSingle
                    Ctl3D = True
                    DateTime = 43537.668379629630000000
                    Version = '1.3.6.6'
                    LabelFont.Charset = DEFAULT_CHARSET
                    LabelFont.Color = clWindowText
                    LabelFont.Height = -11
                    LabelFont.Name = 'Tahoma'
                    LabelFont.Style = []
                  end
                  object cbkRetiraBalcao: TCheckBox
                    Left = 230
                    Top = -2
                    Width = 163
                    Height = 27
                    Caption = 'Retirar no balc'#227'o'
                    Color = clWhite
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -15
                    Font.Name = 'MS Sans Serif'
                    Font.Style = []
                    ParentColor = False
                    ParentFont = False
                    TabOrder = 2
                    OnClick = cbkRetiraBalcaoClick
                    OnEnter = Edit1Enter
                    OnExit = Edit1Exit
                    OnKeyDown = Edit1KeyDown
                  end
                  object cbkEntrega: TCheckBox
                    Left = 229
                    Top = 19
                    Width = 162
                    Height = 27
                    Caption = 'N'#227'o cobrar entrega'
                    Color = clWhite
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -15
                    Font.Name = 'MS Sans Serif'
                    Font.Style = []
                    ParentColor = False
                    ParentFont = False
                    TabOrder = 3
                    OnClick = cbkEntregaClick
                    OnEnter = Edit1Enter
                    OnExit = Edit1Exit
                    OnKeyDown = Edit1KeyDown
                  end
                end
              end
            end
            object pgDesconto: TJvStandardPage
              Left = 0
              Top = 0
              Width = 397
              Height = 449
              Caption = '.'
              ExplicitWidth = 398
              ExplicitHeight = 447
              object Panel18: TPanel
                Tag = 99
                Left = 0
                Top = 0
                Width = 397
                Height = 65
                Align = alTop
                BevelOuter = bvNone
                Color = 12615680
                ParentBackground = False
                TabOrder = 0
                StyleElements = []
                ExplicitWidth = 398
                object Label6: TLabel
                  Left = 0
                  Top = 33
                  Width = 397
                  Height = 33
                  Align = alTop
                  Alignment = taCenter
                  Caption = 'o valor do desconto'
                  Font.Charset = ANSI_CHARSET
                  Font.Color = clWhite
                  Font.Height = -27
                  Font.Name = 'Calibri'
                  Font.Style = [fsBold]
                  ParentFont = False
                  StyleElements = []
                  ExplicitWidth = 223
                end
                object Label20: TLabel
                  Left = 0
                  Top = 0
                  Width = 397
                  Height = 33
                  Align = alTop
                  Alignment = taCenter
                  Caption = 'Informe o tipo e'
                  Font.Charset = ANSI_CHARSET
                  Font.Color = clWhite
                  Font.Height = -27
                  Font.Name = 'Calibri'
                  Font.Style = [fsBold]
                  ParentFont = False
                  StyleElements = []
                  ExplicitWidth = 183
                end
              end
              object rdPercentual: TRadioButton
                Left = 68
                Top = 82
                Width = 169
                Height = 30
                Caption = 'Percentual'
                Checked = True
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -24
                Font.Name = 'Arial Black'
                Font.Style = [fsBold]
                ParentFont = False
                TabOrder = 1
                TabStop = True
                OnEnter = Edit1Enter
              end
              object rdValor: TRadioButton
                Left = 259
                Top = 82
                Width = 118
                Height = 30
                Caption = 'Valor'
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -24
                Font.Name = 'Arial Black'
                Font.Style = [fsBold]
                ParentFont = False
                TabOrder = 2
                OnEnter = Edit1Enter
              end
              object edValorDesconto: TJvValidateEdit
                Left = 69
                Top = 118
                Width = 300
                Height = 65
                StyleElements = []
                CriticalPoints.MaxValueIncluded = False
                CriticalPoints.MinValueIncluded = False
                DisplayFormat = dfFloat
                DecimalPlaces = 2
                EditText = '0'
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -47
                Font.Name = 'Verdana'
                Font.Style = [fsBold]
                ParentFont = False
                TabOrder = 3
                OnEnter = Edit1Enter
                OnKeyDown = edValorDescontoKeyDown
              end
              object btAplicardesconto: TAdvGlassButton
                Left = 67
                Top = 256
                Width = 315
                Height = 50
                BackColor = 12615680
                Caption = 'Aplicar o desconto '
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -19
                Font.Name = 'Tahoma'
                Font.Style = []
                ForeColor = clWhite
                GlowColor = 16760205
                ImageIndex = -1
                InnerBorderColor = clBlack
                Layout = blGlyphTop
                OuterBorderColor = clWhite
                ParentFont = False
                ShineColor = clWhite
                TabOrder = 4
                Version = '1.3.3.1'
                OnClick = btAplicardescontoClick
              end
            end
            object pgTabelaPreco: TJvStandardPage
              Left = 0
              Top = 0
              Width = 397
              Height = 449
              Caption = 'pgTabelasPre'#231'o'
              ExplicitWidth = 398
              ExplicitHeight = 447
              object Panel23: TPanel
                Tag = 99
                Left = 0
                Top = 0
                Width = 397
                Height = 57
                Align = alTop
                Anchors = [akTop, akRight]
                Color = 12615680
                ParentBackground = False
                TabOrder = 0
                StyleElements = []
                ExplicitWidth = 398
                object Label26: TLabel
                  Left = 712
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
                  StyleElements = []
                end
                object Label27: TLabel
                  Left = 1
                  Top = 1
                  Width = 395
                  Height = 55
                  Align = alClient
                  Alignment = taCenter
                  Caption = 'Selecione a tabela de pre'#231'os'
                  Font.Charset = ANSI_CHARSET
                  Font.Color = clWhite
                  Font.Height = -24
                  Font.Name = 'Calibri'
                  Font.Style = []
                  ParentFont = False
                  Layout = tlCenter
                  StyleElements = []
                  ExplicitWidth = 280
                  ExplicitHeight = 29
                end
              end
              object DBCtrlGrid1: TDBCtrlGrid
                Left = 0
                Top = 57
                Width = 397
                Height = 392
                Align = alClient
                DataSource = dmPedidoDelivery.dsQryTabelaPrecos
                Font.Charset = DEFAULT_CHARSET
                Font.Color = 12615680
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                PanelHeight = 98
                PanelWidth = 380
                ParentFont = False
                TabOrder = 1
                RowCount = 4
                OnClick = DBCtrlGrid1Click
                OnPaintPanel = DBCtrlGrid1PaintPanel
                ExplicitWidth = 398
                ExplicitHeight = 390
              end
            end
          end
          object Panel1: TPanel
            Tag = 99
            Left = 0
            Top = 0
            Width = 3
            Height = 449
            Align = alLeft
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
            ExplicitLeft = 1
            ExplicitTop = 1
            ExplicitHeight = 447
          end
        end
      end
      object pnTitulo: TPanel
        Tag = 99
        Left = 0
        Top = 0
        Width = 1238
        Height = 34
        Align = alTop
        Color = 12615680
        ParentBackground = False
        TabOrder = 0
        StyleElements = []
        ExplicitWidth = 1234
        object lbTitulo: TLabel
          Left = 5
          Top = 2
          Width = 392
          Height = 34
          AutoSize = False
          Caption = 'Delivery - Pedidos'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -19
          Font.Name = 'Calibri'
          Font.Style = [fsBold]
          ParentFont = False
          Layout = tlCenter
          StyleElements = []
        end
      end
    end
    object pgConsultaCliente: TJvStandardPage
      Left = 0
      Top = 0
      Width = 1238
      Height = 684
      Caption = 'pgConsultaCliente'
      Color = clWhite
      object Panel2: TPanel
        Tag = 99
        Left = 0
        Top = 0
        Width = 1238
        Height = 64
        Align = alTop
        Color = 12615680
        ParentBackground = False
        TabOrder = 0
        StyleElements = []
        DesignSize = (
          1238
          64)
        object Label28: TLabel
          Left = 8
          Top = 19
          Width = 377
          Height = 39
          AutoSize = False
          Caption = 'Consulta de clientes'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -27
          Font.Name = 'Calibri'
          Font.Style = [fsBold]
          ParentFont = False
          StyleElements = []
        end
        object lbHora: TLabel
          Left = 1100
          Top = 13
          Width = 134
          Height = 45
          Anchors = [akTop, akRight]
          Caption = '22:25:33'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -37
          Font.Name = 'Calibri'
          Font.Style = [fsBold]
          ParentFont = False
          StyleElements = []
        end
      end
      object Panel15: TPanel
        Left = 0
        Top = 621
        Width = 1238
        Height = 63
        Align = alBottom
        Color = clWhite
        ParentBackground = False
        TabOrder = 4
        StyleElements = []
        DesignSize = (
          1238
          63)
        object AdvGlassButton1: TAdvGlassButton
          Left = 1078
          Top = 7
          Width = 156
          Height = 50
          Anchors = [akTop, akRight, akBottom]
          BackColor = 12615680
          ButtonDirection = bdLeft
          Caption = 'Voltar'
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
          TabOrder = 0
          Version = '1.3.3.1'
          OnClick = AdvGlassButton1Click
        end
      end
      object Panel16: TPanel
        Left = 0
        Top = 81
        Width = 1238
        Height = 112
        Align = alTop
        Color = clWhite
        ParentBackground = False
        TabOrder = 2
        StyleElements = []
        object rdTipoConsultaCliente: TRadioGroup
          Left = 1
          Top = 1
          Width = 1236
          Height = 48
          Align = alTop
          Caption = 'Digite as iniciais (F2 - mudar o filtro )'
          Columns = 5
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ItemIndex = 0
          Items.Strings = (
            'Nome'
            'Telefone'
            'Celular')
          ParentFont = False
          TabOrder = 0
          OnClick = rdTipoConsultaClienteClick
        end
        object pnFiltrosPesquisa: TPanel
          Left = 1
          Top = 55
          Width = 1236
          Height = 56
          Align = alBottom
          BevelOuter = bvNone
          Color = clWhite
          ParentBackground = False
          TabOrder = 1
          StyleElements = []
          object lbNomeCliente: TLabel
            Left = 5
            Top = -1
            Width = 117
            Height = 20
            Caption = 'Nome do Cliente'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -16
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            StyleElements = []
          end
          object lbEnderecoCliente: TLabel
            Left = 330
            Top = -1
            Width = 69
            Height = 20
            Caption = 'Endere'#231'o'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -16
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            StyleElements = []
          end
          object lbEnderecoBairro: TLabel
            Left = 695
            Top = -1
            Width = 42
            Height = 20
            Caption = 'Bairro'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -16
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            StyleElements = []
          end
          object edNomeClienteConsulta: TEdit
            Left = 2
            Top = 19
            Width = 320
            Height = 35
            TabStop = False
            CharCase = ecUpperCase
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Height = -24
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            TabOrder = 0
            StyleElements = []
            OnChange = edNomeClienteConsultaChange
            OnKeyDown = edNomeClienteConsultaKeyDown
          end
          object edEnderecoConsultaCliente: TEdit
            Left = 325
            Top = 19
            Width = 362
            Height = 35
            TabStop = False
            CharCase = ecUpperCase
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Height = -24
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            TabOrder = 1
            StyleElements = []
            OnChange = edNomeClienteConsultaChange
            OnKeyDown = edNomeClienteConsultaKeyDown
          end
          object edEnderecoConsultaBairro: TEdit
            Left = 691
            Top = 19
            Width = 542
            Height = 35
            TabStop = False
            CharCase = ecUpperCase
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Height = -24
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            TabOrder = 2
            StyleElements = []
            OnChange = edNomeClienteConsultaChange
            OnKeyDown = edNomeClienteConsultaKeyDown
          end
        end
      end
      object Panel17: TPanel
        Left = 0
        Top = 64
        Width = 1238
        Height = 17
        Align = alTop
        BevelOuter = bvNone
        Color = clWhite
        ParentBackground = False
        TabOrder = 1
        StyleElements = []
      end
      object gridConsultaClientes: TcxGrid
        Left = 0
        Top = 193
        Width = 1238
        Height = 428
        Align = alClient
        TabOrder = 3
        object gridConsultaClientesDBTableView1: TcxGridDBTableView
          PopupMenu = PopMovimento
          OnKeyDown = gridConsultaClientesDBTableView1KeyDown
          Navigator.Buttons.CustomButtons = <>
          ScrollbarAnnotations.CustomAnnotations = <>
          OnCellDblClick = gridConsultaClientesDBTableView1CellDblClick
          OnCustomDrawCell = gridConsultaClientesDBTableView1CustomDrawCell
          DataController.DataSource = dmPedidoDelivery.dsConsultaClientes
          DataController.Summary.DefaultGroupSummaryItems = <
            item
              Format = 'R$ ,0.00;-R$ ,0.00'
              Kind = skSum
            end
            item
              Format = 'R$ ,0.00;-R$ ,0.00'
              Kind = skSum
              Position = spFooter
            end
            item
              Format = 'R$ ,0.00;-R$ ,0.00'
              Kind = skSum
            end
            item
              Format = 'R$ ,0.00;-R$ ,0.00'
              Position = spFooter
            end>
          DataController.Summary.FooterSummaryItems = <
            item
              Kind = skSum
            end
            item
              Kind = skSum
            end>
          DataController.Summary.SummaryGroups = <>
          OptionsData.CancelOnExit = False
          OptionsData.Deleting = False
          OptionsData.DeletingConfirmation = False
          OptionsData.Editing = False
          OptionsData.Inserting = False
          OptionsSelection.CellSelect = False
          OptionsSelection.HideFocusRectOnExit = False
          OptionsSelection.InvertSelect = False
          OptionsSelection.UnselectFocusedRecordOnExit = False
          OptionsView.DataRowHeight = 24
          OptionsView.GroupByBox = False
          OptionsView.GroupFooterMultiSummaries = True
          OptionsView.GroupFooters = gfVisibleWhenExpanded
          OptionsView.GroupSummaryLayout = gslAlignWithColumns
          Preview.AutoHeight = False
          Styles.Content = cxStyle1
          Styles.ContentOdd = cxStyle2
          object gridConsultaClientesDBTableView1Column1: TcxGridDBColumn
            Caption = 'C'#243'digo'
            DataBinding.FieldName = 'NOME'
            DataBinding.IsNullValueType = True
            Width = 329
          end
          object gridConsultaClientesDBTableView1Column2: TcxGridDBColumn
            Caption = 'Bairro'
            DataBinding.FieldName = 'DESCBAIRRO'
            DataBinding.IsNullValueType = True
            Width = 196
          end
          object gridConsultaClientesDBTableView1Column3: TcxGridDBColumn
            Caption = 'Telefone'
            DataBinding.FieldName = 'TELEFONE'
            DataBinding.IsNullValueType = True
            Width = 104
          end
          object gridConsultaClientesDBTableView1Column4: TcxGridDBColumn
            Caption = 'Celular'
            DataBinding.FieldName = 'CELULAR'
            DataBinding.IsNullValueType = True
            Width = 97
          end
          object gridConsultaClientesDBTableView1Column5: TcxGridDBColumn
            Caption = 'Endere'#231'o'
            DataBinding.FieldName = 'ENDERECO'
            DataBinding.IsNullValueType = True
            Width = 500
          end
        end
        object gridConsultaClientesLevel1: TcxGridLevel
          GridView = gridConsultaClientesDBTableView1
        end
      end
    end
  end
  object PopMovimento: TPopupMenu [9]
    Left = 717
    Top = 318
    object Excluir1: TMenuItem
      Caption = 'Excluir produto do pedido'
      OnClick = Excluir1Click
    end
  end
  object PopupMenu2: TPopupMenu [10]
    Left = 974
    Top = 45
    object MenuItem1: TMenuItem
      Caption = 'Excluir'
    end
  end
  inherited cliques: TActionList
    Left = 903
    Top = 111
  end
  inherited actlBusca: TJvControlActionList
    Left = 1123
    Top = 53
  end
  inherited popMenuExportacaoGrid: TPopupMenu
    Left = 1215
    Top = 54
  end
  object ImageList1: TImageList
    Left = 987
    Top = 102
    Bitmap = {
      494C010102000500040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000001000000001002000000000000010
      0000000000000000000000000000000000000000000000000000F9F9F900E3E3
      E300DADADA00DADADA00DCDCDC00DDDDDD00DEDEDE00DFDFDF00E1E1E100E3E3
      E300EBEBEB00FBFBFB0000000000000000000000000000000000000000000000
      0000F9F9F900F4F4F400F9F9F90000000000000000000000000000000000FCFC
      FC00EEEEEE00E4E4E400EDEDED00FCFCFC000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000E4E4E4009595
      95007474740074747400777777007B7B7B007D7D7D0081818100858585008B8B
      8B00A9A9A900E9E9E9000000000000000000000000000000000000000000F7F7
      F700D6D6D600BBBBBB00CCCCCC00E3E3E300F3F3F300FCFCFC00FBFBFB00E4E4
      E400B1B1B10090909000B1B1B100EEEEEE000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000A4767600B586
      8700B2878600A07B8700A9807F00A37C7C009F7A7A009D7A7A009E7C7C009A80
      80007C7C7C00DDDDDD0000000000000000000000000000000000FCFCFC00C7D9
      DE006CABBE006D7679007272720091919100B7B7B700D3D3D300D0D0D0008099
      CB00938D8700807F7D008C8C8C00E3E3E3000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000AB797900FFF1
      EC00FFFFF7009EAEFE00FFFEFB00FFF8FA00FFF7F900FFEDEF00FDE8E900B288
      880072727200DBDBDB0000000000000000000000000000000000E8EBEB0036C0
      E700BAF6FF0052D8FA003FACC7006080860064646500717171007187B300387F
      F30080DFFF00989288009C9C9C00E9E9E9000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000AC797900FCE9
      E100FFF5E2009EA7E900FFEDD600FFE7D500FFE5D300FFE3D000FFE9D400B68A
      860072727200DADADA00000000000000000000000000FBFBFB0082CDE6009EEE
      FC00C6EAEF00E8F8FA00FCFFFF00CEF6FD00A1E3F4007CAAE1003381FC0072E2
      FF00388AFA00637DB200A0A0A000EAEAEA000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000AF7C7D00FCE8
      DA00FFF4DC00A2A9E800FFEFD800FFE8D700FFE6D300FFE4D100FFE8D500B68C
      870072727200DADADA00000000000000000000000000E5EDF00031C3EC00EDFF
      FF00E0F9FA0098A1A300777B7D00757574007F80800091908D008DC6D7003387
      FF007BA8E800A4A5A60093939300E6E6E6000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000B07E7E00FCEE
      EB00FFFBF200A3B1F600FFF7EE00FFF1EC00FFEFEC00FFEEEB00FFF3F100B791
      900072727200DADADA000000000000000000000000008BD3EB0095EFFB00CCF0
      F400A1A8A900BEAE9400FFD18400FED08500FED698009A948B008F8F8C0098BA
      F600D0F7FE0020B8E000B5B5B500F1F1F1000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000B4808000FCEE
      E600FFF9EA00A6B2F100FFF3E400FFEDE200FFEBDF00FFE9DD00FFEEE000B991
      8C0072727200DADADA000000000000000000F9F9F90035C5EF00D5FFFF00D3F3
      F7007D7E7D00FFDD9700F2D59800EFCD9000F1C88200FED99D007F848600D4E9
      EF007BE5FD007EB0BD00E2E2E200FDFDFD000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000B6838300FDEB
      DD00FFF5DF00A8B3EA00FFF1DB00FFEBDA00FFE9D600FFE7D500FFECD800B990
      8E0072727200DADADA000000000000000000D4E9EF004CD2F000B5FCFB00E5FF
      FF007B787300FFEEBD00F8E8BB00F4DDA900F0D09400FFD59000797A7900E1FC
      FF0054ABC500CECECE00F9F9F900000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000B9858500FFF4
      EF00FFFDF200ACBAF300FFF7E800FFEFE400FFEDDF00FFEADB00FFEDDB00BA90
      8B0073737300DADADA00000000000000000090C9DF0088EFF90087DDE700BAE1
      EA0081817D00FFFFEA00FFFEEF00F9EDC200F6DAA000FFDA96008185860092DA
      EE009DA2A200E9E9E90000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000BC888800FEF2
      EA00FFFEF000AEBDF600FFFBF100FFF6F300FFF7F300FFF6F500FFFDFE00BA94
      950073737300DBDBDB0000000000000000005AB3D500B3FFFF00B1FFFF00D7FF
      FF00A2AAAB00DEDAC400FFFFF200FFF7CB00FFE7A600B5AB99009AA8AA009DBE
      C800CFCFCF00FAFAFA0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000BF8B8C00FFF0
      DF00FFF9E200B4BEED00FFF6DE00FFF0DB00FFEAD700FFE8D500FFEED800B990
      8A0075757500DCDCDC00000000000000000036B0D50099F8F90056BAD10072D3
      E100CEF6F800A3ABAB0081807E007B7975007E7F7F00A2AAAA0099DBEB009D9E
      9E00E9E9E9000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000C28E8E00F3ED
      EE00ECEEEC0099A5C800C0C1C000D3D4D500AEADAE007D7C7E00B0B1B200896D
      6D0086868600E0E0E000000000000000000033B8DD00B9FFFF00A3FFFF008BEF
      F50072D7E400A6DBE700B7E0EB00C5EAF100CEF4F700CBFDFF005897AE00BFBF
      BF00F6F6F6000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000C9949400DFD7
      D7007E7D7C005D5E6E00B8AAA8008E858500665E5E009E878700A68A8A006A5E
      5E00B3B3B300ECECEC00000000000000000035BCE90035BEE30054D1E9007DEC
      F700A6FFFF00B4FFFF00ADFFFF0096F2F40086DEE8005ED8ED0079919900D7D7
      D700FDFDFD000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000BCA3A300C29F
      9F0064606000867979008E8484007471710062606000807E7E008A8A8A009495
      9500E8E8E800FCFCFC00000000000000000000000000F7FDFE00C8E9F70094D6
      EF0061C1E70038BEE80033BCDF0056D5EA008EF7FC0034C2E300B9BBBC00ECEC
      EC00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000EEEEEE008C8E
      8E00888888009192920097979700AFAFAF00C0C1C100C8C8C800D2D2D200F5F5
      F500FDFDFD000000000000000000000000000000000000000000000000000000
      00000000000000000000F7FCFE00C7E5F10093CDE40080CFEA00F1F1F100FCFC
      FC00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000100000000100010000000000800000000000000000000000
      000000000000000000000000FFFFFF00C003F1E000000000C003E00000000000
      C003C00000000000C003C00000000000C003800000000000C003800000000000
      C003800000000000C003000000000000C003000100000000C003000300000000
      C003000300000000C003000700000000C003000700000000C003000700000000
      C003800F00000000C007FC0F0000000000000000000000000000000000000000
      000000000000}
  end
  object JvPopupMenu1: TJvPopupMenu
    ImageMargin.Left = 0
    ImageMargin.Top = 0
    ImageMargin.Right = 0
    ImageMargin.Bottom = 0
    ImageSize.Height = 16
    ImageSize.Width = 16
    Left = 1051
    Top = 54
    object Excluirobservao1: TMenuItem
      Caption = 'Excluir observa'#231#227'o'
      ImageIndex = 0
      OnClick = Excluirobservao1Click
    end
  end
  object ApplicationEvents1: TApplicationEvents
    Left = 1049
    Top = 111
  end
  object PopupMenu3: TPopupMenu
    Left = 1168
    Top = 59
    object Copiarestepedido1: TMenuItem
      Caption = 'Copiar este pedido'
      OnClick = Copiarestepedido1Click
    end
  end
  object ACBrValidador1: TACBrValidador
    IgnorarChar = './-'
    Left = 1176
    Top = 108
  end
  object cxStyleRepository1: TcxStyleRepository
    Left = 858
    Top = 141
    PixelsPerInch = 96
    object cxStyle2: TcxStyle
      AssignedValues = [svColor, svFont]
      Color = 15658734
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
    end
    object cxStyle1: TcxStyle
      AssignedValues = [svColor, svFont]
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
    end
  end
  object cxStyleRepository2: TcxStyleRepository
    Left = 1122
    Top = 126
    PixelsPerInch = 96
    object cxStyle3: TcxStyle
      AssignedValues = [svColor, svFont]
      Color = 15658734
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 12615680
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = []
    end
    object cxStyle4: TcxStyle
      AssignedValues = [svFont]
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = []
    end
  end
  object popFormasPagamento: TPopupMenu
    Left = 1138
    Top = 175
    object E1: TMenuItem
      Caption = 'Excluir forma de pagamento'
      OnClick = E1Click
    end
  end
end
