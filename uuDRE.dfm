inherited FrmDRE: TFrmDRE
  Left = 112
  Top = 0
  ClientHeight = 704
  ClientWidth = 939
  OnDestroy = FormDestroy
  ExplicitWidth = 951
  ExplicitHeight = 742
  TextHeight = 13
  inherited botao_pesquisa: TSpeedButton
    Top = -31
    Height = 17
    ExplicitTop = -31
    ExplicitHeight = 17
  end
  inherited Edit1: TEdit
    Top = -28
    ExplicitTop = -28
  end
  object pn_principal: TPanel [2]
    Left = 0
    Top = 129
    Width = 939
    Height = 495
    Align = alClient
    Color = clWhite
    ParentBackground = False
    TabOrder = 1
    ExplicitWidth = 935
    ExplicitHeight = 494
    object pn_codigo: TPanel
      Left = 1
      Top = 1
      Width = 937
      Height = 0
      Align = alTop
      TabOrder = 0
      Visible = False
      ExplicitWidth = 933
      object bt_pesquisa: TSpeedButton
        Left = 126
        Top = 24
        Width = 22
        Height = 17
        Flat = True
        Glyph.Data = {
          DE010000424DDE01000000000000760000002800000024000000120000000100
          0400000000006801000000000000000000001000000010000000000000000000
          80000080000000808000800000008000800080800000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00666666666666
          6666666666666666666666660000666666666666666666666666666666666666
          0000666666666666666666666666666666666666000060000066666000006668
          8888666668888866000060800066666080006668788866666878886600006080
          00666660800066687888666668788866000060000000F00000006668888888F8
          8888886600006080000000800000666878888888788888660000608000006080
          0000666878888868788888660000608000006080000066687888886878888866
          0000660000000000000666668888888888888666000066608000F08000666666
          687888F878886666000066600000600000666666688888688888666600006666
          00066600066666666688866688866666000066668F06668F06666666668F8666
          8F86666600006666000666000666666666888666888666660000666666666666
          6666666666666666666666660000666666666666666666666666666666666666
          0000}
        NumGlyphs = 2
      end
      object ed_codigo: TMaskEdit
        Left = 3
        Top = 21
        Width = 121
        Height = 21
        TabOrder = 0
        Text = ''
        OnKeyDown = Edit1KeyDown
      end
    end
    object cxGrid1: TcxGrid
      Left = 1
      Top = 1
      Width = 937
      Height = 493
      Align = alClient
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Corr'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      ExplicitWidth = 933
      ExplicitHeight = 492
      object cxGrid1DBTableView1: TcxGridDBTableView
        PopupMenu = PopupMenu1
        Navigator.Buttons.CustomButtons = <>
        ScrollbarAnnotations.CustomAnnotations = <>
        DataController.DataSource = dmDRE.dsQryDRE
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
        OptionsData.CancelOnExit = False
        OptionsData.Deleting = False
        OptionsData.DeletingConfirmation = False
        OptionsData.Editing = False
        OptionsView.GroupByBox = False
        Styles.Header = cxStyle1
        object cxGrid1DBTableView1COD_GRUPO: TcxGridDBColumn
          Caption = 'C'#243'digo'
          DataBinding.FieldName = 'COD_GRUPO'
          DataBinding.IsNullValueType = True
          Width = 60
        end
        object cxGrid1DBTableView1GRUPO: TcxGridDBColumn
          Caption = 'Nome do grupo'
          DataBinding.FieldName = 'GRUPO'
          DataBinding.IsNullValueType = True
          Width = 178
        end
        object cxGrid1DBTableView1TOTAL_MES: TcxGridDBColumn
          Caption = 'M'#234's atual'
          DataBinding.FieldName = 'TOTAL_MES'
          DataBinding.IsNullValueType = True
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Styles.Content = cxStyle1
          Styles.Header = cxStyle2
          Width = 85
        end
        object cxGrid1DBTableView1P_DESP_MES: TcxGridDBColumn
          Caption = '% Despesa'
          DataBinding.FieldName = 'P_DESP_MES'
          DataBinding.IsNullValueType = True
          Styles.Content = cxStyle1
          Styles.Header = cxStyle1
          Width = 60
        end
        object cxGrid1DBTableView1CMV_MES: TcxGridDBColumn
          Caption = 'CMV'
          DataBinding.FieldName = 'CMV_MES'
          DataBinding.IsNullValueType = True
          Styles.Content = cxStyle1
          Styles.Header = cxStyle1
          Width = 45
        end
        object cxGrid1DBTableView1TOTAL_MES_ANTERIOR: TcxGridDBColumn
          Caption = 'M'#234's anterior'
          DataBinding.FieldName = 'TOTAL_MES_ANTERIOR'
          DataBinding.IsNullValueType = True
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Styles.Content = cxStyle3
          Width = 85
        end
        object cxGrid1DBTableView1P_DESP_M_ANTERIOR: TcxGridDBColumn
          Caption = '% Despesa'
          DataBinding.FieldName = 'P_DESP_M_ANTERIOR'
          DataBinding.IsNullValueType = True
          Styles.Content = cxStyle3
          Width = 60
        end
        object cxGrid1DBTableView1CMV_MES_ANT: TcxGridDBColumn
          Caption = 'CMV'
          DataBinding.FieldName = 'CMV_MES_ANT'
          DataBinding.IsNullValueType = True
          Styles.Content = cxStyle3
          Width = 45
        end
        object cxGrid1DBTableView1CRE_MES_ANT: TcxGridDBColumn
          Caption = '% Cresc.'
          DataBinding.FieldName = 'CRE_MES_ANT'
          DataBinding.IsNullValueType = True
          Styles.Content = cxStyle3
          Width = 48
        end
        object cxGrid1DBTableView1TOTAL_ANO_ANTERIOR: TcxGridDBColumn
          Caption = 'Ano anterior'
          DataBinding.FieldName = 'TOTAL_ANO_ANTERIOR'
          DataBinding.IsNullValueType = True
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Styles.Content = cxStyle1
          Width = 85
        end
        object cxGrid1DBTableView1P_DESP_A_ANTERIOR: TcxGridDBColumn
          Caption = '% Despesa'
          DataBinding.FieldName = 'P_DESP_A_ANTERIOR'
          DataBinding.IsNullValueType = True
          Styles.Content = cxStyle1
          Width = 70
        end
        object cxGrid1DBTableView1CMV_ANO_ANT: TcxGridDBColumn
          Caption = 'CMV'
          DataBinding.FieldName = 'CMV_ANO_ANT'
          DataBinding.IsNullValueType = True
          Styles.Content = cxStyle1
          Width = 45
        end
        object cxGrid1DBTableView1CRE_ANO_ANT: TcxGridDBColumn
          Caption = '% Cresc.'
          DataBinding.FieldName = 'CRE_ANO_ANT'
          DataBinding.IsNullValueType = True
          Styles.Content = cxStyle1
          Width = 48
        end
      end
      object cxGrid1Level1: TcxGridLevel
        GridView = cxGrid1DBTableView1
      end
    end
    object sPageControl1: TsPageControl
      Left = 388
      Top = 117
      Width = 289
      Height = 193
      ActivePage = sTabSheet1
      TabOrder = 2
      object sTabSheet1: TsTabSheet
        Caption = 'sTabSheet1'
      end
    end
    object cxPageControl1: TcxPageControl
      Left = 172
      Top = 170
      Width = 289
      Height = 193
      TabOrder = 3
      Properties.ActivePage = cxTabSheet1
      Properties.CustomButtons.Buttons = <>
      ClientRectBottom = 189
      ClientRectLeft = 4
      ClientRectRight = 285
      ClientRectTop = 24
      object cxTabSheet1: TcxTabSheet
        Caption = 'cxTabSheet1'
        ImageIndex = 0
      end
    end
  end
  object pn_botoes: TPanel [3]
    Left = 0
    Top = 624
    Width = 939
    Height = 80
    Align = alBottom
    Color = clWhite
    ParentBackground = False
    TabOrder = 2
    ExplicitTop = 623
    ExplicitWidth = 935
    object bt_novo: TBitBtn
      Left = 1
      Top = -51
      Width = 74
      Height = 39
      Caption = 'Novo (F3)'
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333303333
        333333333337FF3333333333330003333333333333777F333333333333080333
        3333333F33777FF33F3333B33B000B33B3333373F777773F7333333BBB0B0BBB
        33333337737F7F77F333333BBB0F0BBB33333337337373F73F3333BBB0F7F0BB
        B333337F3737F73F7F3333BB0FB7BF0BB3333F737F37F37F73FFBBBB0BF7FB0B
        BBB3773F7F37337F377333BB0FBFBF0BB333337F73F333737F3333BBB0FBF0BB
        B3333373F73FF7337333333BBB000BBB33333337FF777337F333333BBBBBBBBB
        3333333773FF3F773F3333B33BBBBB33B33333733773773373333333333B3333
        333333333337F33333333333333B333333333333333733333333}
      Layout = blGlyphTop
      NumGlyphs = 2
      TabOrder = 0
      Visible = False
    end
    object bt_alterar: TBitBtn
      Left = 1
      Top = -61
      Width = 128
      Height = 50
      Caption = 'Alterar (F5)'
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00500005000555
        555557777F777555F55500000000555055557777777755F75555005500055055
        555577F5777F57555555005550055555555577FF577F5FF55555500550050055
        5555577FF77577FF555555005050110555555577F757777FF555555505099910
        555555FF75777777FF555005550999910555577F5F77777775F5500505509990
        3055577F75F77777575F55005055090B030555775755777575755555555550B0
        B03055555F555757575755550555550B0B335555755555757555555555555550
        BBB35555F55555575F555550555555550BBB55575555555575F5555555555555
        50BB555555555555575F555555555555550B5555555555555575}
      Layout = blGlyphTop
      NumGlyphs = 2
      TabOrder = 2
      Visible = False
    end
    object bt_gravar: TBitBtn
      Left = 130
      Top = -61
      Width = 128
      Height = 50
      Caption = 'Gravar (F7)'
      Enabled = False
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
        555555555555555555555555555555555555555555FF55555555555559055555
        55555555577FF5555555555599905555555555557777F5555555555599905555
        555555557777FF5555555559999905555555555777777F555555559999990555
        5555557777777FF5555557990599905555555777757777F55555790555599055
        55557775555777FF5555555555599905555555555557777F5555555555559905
        555555555555777FF5555555555559905555555555555777FF55555555555579
        05555555555555777FF5555555555557905555555555555777FF555555555555
        5990555555555555577755555555555555555555555555555555}
      Layout = blGlyphTop
      NumGlyphs = 2
      TabOrder = 4
      Visible = False
    end
    object bt_cancelar: TBitBtn
      Left = 259
      Top = -61
      Width = 122
      Height = 50
      Caption = 'Cancelar (ESC)'
      Enabled = False
      Glyph.Data = {
        DE010000424DDE01000000000000760000002800000024000000120000000100
        0400000000006801000000000000000000001000000000000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        333333333333333333333333000033337733333333333333333F333333333333
        0000333911733333973333333377F333333F3333000033391117333911733333
        37F37F333F77F33300003339111173911117333337F337F3F7337F3300003333
        911117111117333337F3337F733337F3000033333911111111733333337F3337
        3333F7330000333333911111173333333337F333333F73330000333333311111
        7333333333337F3333373333000033333339111173333333333337F333733333
        00003333339111117333333333333733337F3333000033333911171117333333
        33337333337F333300003333911173911173333333373337F337F33300003333
        9117333911173333337F33737F337F33000033333913333391113333337FF733
        37F337F300003333333333333919333333377333337FFF730000333333333333
        3333333333333333333777330000333333333333333333333333333333333333
        0000}
      Layout = blGlyphTop
      NumGlyphs = 2
      TabOrder = 5
      Visible = False
    end
    object bt_excluir: TBitBtn
      Left = 222
      Top = -51
      Width = 74
      Height = 39
      Caption = 'Excluir (F6)'
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
        55555FFFFFFF5F55FFF5777777757559995777777775755777F7555555555550
        305555555555FF57F7F555555550055BB0555555555775F777F55555550FB000
        005555555575577777F5555550FB0BF0F05555555755755757F555550FBFBF0F
        B05555557F55557557F555550BFBF0FB005555557F55575577F555500FBFBFB0
        B05555577F555557F7F5550E0BFBFB00B055557575F55577F7F550EEE0BFB0B0
        B05557FF575F5757F7F5000EEE0BFBF0B055777FF575FFF7F7F50000EEE00000
        B0557777FF577777F7F500000E055550805577777F7555575755500000555555
        05555777775555557F5555000555555505555577755555557555}
      Layout = blGlyphTop
      NumGlyphs = 2
      TabOrder = 3
      Visible = False
    end
    object bt_consultar: TBitBtn
      Left = 75
      Top = -51
      Width = 74
      Height = 39
      Caption = 'Consultar (F4)'
      Glyph.Data = {
        DE010000424DDE01000000000000760000002800000024000000120000000100
        0400000000006801000000000000000000001000000000000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00666666666666
        6666666666666666666666660000666666666666666666666666666666666666
        0000666666666666666666666666666666666666000060000066666000006667
        7777666667777766000060700066666070006667877766666787776600006070
        00666660700066678777666667877766000060000000F00000006667777777F7
        7777776600006070000000700000666787777777877777660000607000006070
        0000666787777767877777660000607000006070000066678777776787777766
        0000660000000000000666667777777777777666000066607000F07000666666
        678777F787776666000066600000600000666666677777677777666600006666
        00066600066666666677766677766666000066667F06667F06666666667F7666
        7F76666600006666000666000666666666777666777666660000666666666666
        6666666666666666666666660000666666666666666666666666666666666666
        0000}
      Layout = blGlyphTop
      NumGlyphs = 2
      TabOrder = 1
      Visible = False
    end
    object AdvGlassButton3: TAdvGlassButton
      Left = 796
      Top = 10
      Width = 142
      Height = 60
      BackColor = 12615680
      ButtonDirection = bdLeft
      Caption = 'Sair'
      CornerRadius = 0
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
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
      TabOrder = 6
      Version = '1.3.3.1'
      OnClick = AdvGlassButton3Click
    end
    object btImprimirInventario: TAdvGlassButton
      Left = 650
      Top = 10
      Width = 142
      Height = 60
      BackColor = 12615680
      ButtonDirection = bdLeft
      Caption = 'Imprimir'
      CornerRadius = 0
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
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
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEF7F7F7EBEBEBEB
        EBEBEEEEEEE5E5E5E4E4E4F1F1F1FCFCFCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7F7F7E5E5
        E5C4C4C4A1A1A1A1A1A1AAAAAA909090909090B4B4B4D9D9D9EEEEEEFBFBFBFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9F9F9
        E8E8E8C9C9C99D9D9D8989898383837373738282828080807575756666668383
        83AEAEAED4D4D4ECECECFAFAFAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA
        FAFAEBEBEBCECECEA3A3A39090909B9B9BDBDBDBA0A0A0919191D1D1D19C9C9C
        8A8A8A7F7F7F7878786464647D7D7DA7A7A7D0D0D0EAEAEAF9F9F9FFFFFFFFFF
        FFFCFCFCEEEEEED3D3D3A7A7A7949494999999D6D6D6F7F7F7F4F4F4ABABABB7
        B7B7E5E5E59F9F9FA7A7A7A3A3A38D8D8D7C7C7C7A7A7A646464787878A2A2A2
        D2D2D2F7F7F7F9F9F9DCDCDCADADAD9696969A9A9AD2D2D2F6F6F6F4F4F4E6E6
        E6DADADA989898ABABABD5D5D5898989929292A4A4A4A9A9A9A8A8A890909079
        79797B7B7B6767678F8F8FE4E4E4E4E4E4A3A3A39A9A9ACDCDCDF5F5F5F3F3F3
        E7E7E7DCDCDCEAEAEAF5F5F59E9E9EB2B2B2F2F2F29595959B9B9B9090909090
        90A1A1A1ABABABADADAD939393777777747474DBDBDBA9A9A9CACACAF2F2F2F3
        F3F3E7E7E7DCDCDCE9E9E9F5F5F5F7F7F7F4F4F4969696B2B2B2F7F7F7909090
        9999999D9D9D9F9F9F9595959191919C9C9CB3B3B3797979727272DADADAA3A3
        A3F8F8F8E8E8E8DCDCDCE8E8E8F5F5F5F5F5F5F5F5F5F8F8F8F6F6F6909090B1
        B1B1FDFDFD8D8D8D9696969999999B9B9B9F9F9FA3A3A39D9D9D959595767676
        717171D9D9D9A3A3A3E2E2E2E7E7E7F4F4F4F4F4F4F5F5F5F6F6F6F8F8F8FAFA
        FAF7F7F7888888B0B0B0FFFFFF8989899393939595959898989B9B9B9E9E9EA2
        A2A2A9A9A9797979717171D9D9D9A8A8A8F9F9F9F4F4F4F4F4F4F6F6F6F7F7F7
        F8F8F8FAFAFAFDFDFDFAFAFA848484B0B0B0FFFFFF8686869191919292929595
        959898989B9B9B9D9D9DA4A4A47B7B7B717171D9D9D9AAAAAAF9F9F9F5F5F5F6
        F6F6F8F8F8F9F9F9FBFBFBFDFDFDF5F5F5E6E6E6727272A1A1A1F8F8F8767676
        8181818A8A8A9393939696969797979A9A9AA1A1A1797979717171D9D9D9AEAE
        AEFDFDFDF7F7F7F9F9F9FAFAFAFBFBFBFEFEFEF7F7F7F1F1F1FAFAFA777777AB
        ABABFFFFFF8888888686868686868383838686869292929898989F9F9F7B7B7B
        727272DADADAAFAFAFFEFEFEF9F9F9FBFBFBFCFCFCFFFFFFFFFFFFEAEAEAFFFF
        FFF3F3F3939293B7B7B7E8E8E8BBBBBBBEBEBEA9A9A98B8B8B8D8D8D88888887
        87878D8D8D7D7D7D727272DADADAB2B2B2FFFFFFFBFBFBFDFDFDFEFEFEFFFFFF
        F0F0F0FBFBFBFFFFFFCFD3CFABADACB5B4B4A6A6A6E6E6E6C1C1C1A6A6A6BDBD
        BDB3B3B39F9F9F8E8E8E9494947C7C7C838383E0E0E0B6B6B6FFFFFFFFFFFFFE
        FEFEFFFFFFF9F9F9F1F1F1FFFFFFFFFEFF78D89395DAA5D2CFD2FFFFFFFFFFFF
        FFFFFFFFFFFFDFDFDFBDBDBDACACACC1C1C1C2C2C27D7D7DB6B6B6F0F0F0B8B8
        B8FFFFFFFFFFFFFFFFFFF6F6F6F0F0F0FFFFFFFFFFFFDAD9D99EB0A5C1C4B8FF
        FCEEFFFAF4FFFDFBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCFCFCF919191B0B0B0
        EAEAEAFDFDFDB9B9B9F5F5F5EDEDEDEEEEEEF7F7F7FFFFFFFFFFFFECECECC4C4
        C4C1C1C4F2DAB4FFEAC4FFEDCDFFF1D8FFF6E4FFFCF0FFFFFCFFFFFDCCCCCC96
        9696C8C8C8F1F1F1FEFEFEFFFFFFB8B8B8FFFFFFFFFFFFFFFFFFFBFBFBF0F0F0
        E0E0E0D0D0D0CECFCF9F9B93AB9C7FC9B591E1CAA0EBD4ACE2CFB1C8BEAEACA8
        A39B9B9ABEBEBEEBEBEBFBFBFBFFFFFFFFFFFFFFFFFFB7B7B7EDEDEDEEEEEEED
        EDEDE7E7E7E2E2E2DFDFDFD5D5D5B2B2B28383857475776264668B8D918A8C8E
        939496AEAEAED7D8D8F7F7F7FEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEAEA
        EAD5D5D5CBCBCBC4C4C4BBBBBBC1C1C1C7C7C7CCCCCCD5D5D5DDDDDDE0E0E0DA
        DADAC9C9C99F9F9FB8B8B8E8E8E8FDFDFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFDFDEFEFEFE1E1E1D2D2D2C1C1
        C1B2B2B2A6A6A6A6A6A6B6B6B6CCCCCCEEEEEEFCFCFCFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
      ParentFont = False
      ShineColor = clWhite
      TabOrder = 7
      Version = '1.3.3.1'
      OnClick = btImprimirInventarioClick
    end
  end
  object Panel2: TPanel [4]
    Tag = 99
    Left = 0
    Top = 57
    Width = 939
    Height = 72
    Align = alTop
    BevelOuter = bvNone
    Color = clWhite
    ParentBackground = False
    TabOrder = 3
    ExplicitWidth = 935
    DesignSize = (
      939
      72)
    object GroupBox1: TGroupBox
      Left = 3
      Top = 0
      Width = 238
      Height = 69
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      object Label6: TLabel
        Left = 3
        Top = 12
        Width = 168
        Height = 20
        Caption = 'Selecione m'#234's e ano'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object cbMes: TComboBox
        Left = 7
        Top = 34
        Width = 128
        Height = 28
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ItemIndex = 0
        ParentFont = False
        TabOrder = 0
        Text = 'Janeiro'
        OnChange = cbMesChange
        Items.Strings = (
          'Janeiro'
          'Fevereiro'
          'Mar'#231'o'
          'Abril'
          'Maio'
          'Junho'
          'Julho'
          'Agosto'
          'Setembro'
          'Outubro'
          'Novembro'
          'Dezembro')
      end
      object cbAno: TComboBox
        Left = 141
        Top = 34
        Width = 83
        Height = 28
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ItemIndex = 0
        ParentFont = False
        TabOrder = 1
        Text = '2017'
        OnChange = cbAnoChange
        Items.Strings = (
          '2017')
      end
    end
    object RadioGroup2: TRadioGroup
      Left = 243
      Top = 0
      Width = 278
      Height = 69
      Caption = 'Informe o Per'#237'odo'
      Color = clWhite
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Verdana'
      Font.Style = [fsBold]
      ParentBackground = False
      ParentColor = False
      ParentFont = False
      TabOrder = 1
    end
    object Panel5: TPanel
      Left = 246
      Top = 13
      Width = 268
      Height = 52
      BevelOuter = bvNone
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentBackground = False
      ParentFont = False
      TabOrder = 2
      object Label4: TLabel
        Left = 135
        Top = -4
        Width = 34
        Height = 20
        Caption = 'At'#233':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label3: TLabel
        Left = 4
        Top = -4
        Width = 29
        Height = 20
        Caption = 'De:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object cbk_visualizar: TCheckBox
        Left = 151
        Top = -38
        Width = 153
        Height = 17
        Caption = 'Visualizar Relat'#243'rio'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        Visible = False
      end
      object edDataInicial: TAdvDateTimePicker
        Left = 3
        Top = 16
        Width = 118
        Height = 32
        Date = 43537.000000000000000000
        Format = ''
        Time = 0.668379629627452200
        DoubleBuffered = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Kind = dkDate
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
      object edDataFinal: TAdvDateTimePicker
        Left = 135
        Top = 16
        Width = 125
        Height = 32
        Date = 43537.000000000000000000
        Format = ''
        Time = 0.669004629628034300
        DoubleBuffered = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Kind = dkDate
        ParentDoubleBuffered = False
        ParentFont = False
        TabOrder = 2
        BorderStyle = bsSingle
        Ctl3D = True
        DateTime = 43537.669004629630000000
        Version = '1.3.6.6'
        LabelFont.Charset = DEFAULT_CHARSET
        LabelFont.Color = clWindowText
        LabelFont.Height = -11
        LabelFont.Name = 'Tahoma'
        LabelFont.Style = []
      end
    end
    object btSelecionar: TAdvGlassButton
      Left = 788
      Top = 6
      Width = 130
      Height = 60
      Anchors = [akTop, akRight, akBottom]
      BackColor = 12615680
      ButtonDirection = bdLeft
      Caption = 'Processar consulta'
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
      ParentFont = False
      ShineColor = clWhite
      TabOrder = 3
      Version = '1.3.3.1'
      OnClick = btSelecionarClick
      ExplicitLeft = 784
    end
    object GroupBox3: TGroupBox
      Left = 520
      Top = 13
      Width = 282
      Height = 57
      Caption = 'Empresa'
      Color = clWhite
      ParentBackground = False
      ParentColor = False
      TabOrder = 4
      object cbEmpresas: TcxCheckComboBox
        Left = 4
        Top = 16
        ParentFont = False
        Properties.EmptySelectionText = 'Nenhuma tabela selecionada'
        Properties.Items = <
          item
            Description = 'asdasd'
            ShortDescription = 'dasdas'
          end
          item
            Description = 'werwerw'
            Enabled = False
            ShortDescription = 'rwerwer'
          end
          item
            Description = '34535345'
            Enabled = False
            ShortDescription = '534534'
          end>
        Properties.OnClickCheck = cbEmpresasPropertiesClickCheck
        Style.Color = clWhite
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -19
        Style.Font.Name = 'MS Sans Serif'
        Style.Font.Style = []
        Style.Shadow = True
        Style.IsFontAssigned = True
        StyleDisabled.Color = clBtnFace
        TabOrder = 0
        Width = 275
      end
    end
  end
  object Panel1: TPanel [5]
    Tag = 99
    Left = 0
    Top = 0
    Width = 939
    Height = 57
    Align = alTop
    Color = 12615680
    Font.Charset = ANSI_CHARSET
    Font.Color = clYellow
    Font.Height = -19
    Font.Name = 'Arial Rounded MT Bold'
    Font.Style = []
    ParentBackground = False
    ParentFont = False
    TabOrder = 4
    ExplicitWidth = 935
    object lbTitulo: TLabel
      Left = 11
      Top = 11
      Width = 531
      Height = 39
      AutoSize = False
      Caption = 'DRE - Demonstra'#231#227'o do resultado do exerc'#237'cio'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -27
      Font.Name = 'Calibri'
      Font.Style = [fsBold]
      ParentFont = False
    end
  end
  inherited cliques: TActionList
    Left = 795
    Top = 10
  end
  inherited actlBusca: TJvControlActionList
    Left = 756
    Top = 11
  end
  object sv: TSaveDialog
    FileName = 'sped.txt'
    Left = 842
    Top = 15
  end
  object PopupMenu1: TPopupMenu
    Left = 580
    Top = 32
    object Detalhar1: TMenuItem
      Caption = 'Listar Lan'#231'amentos (Notas)'
      OnClick = Detalhar1Click
    end
    object ListagemdeInsumoscomprados1: TMenuItem
      Caption = 'Listagem de Insumos comprados'
      OnClick = ListagemdeInsumoscomprados1Click
    end
  end
  object cxStyleRepository1: TcxStyleRepository
    PixelsPerInch = 96
    object cxStyle1: TcxStyle
      AssignedValues = [svColor, svFont]
      Color = 5614335
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 33023
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
    end
  end
  object cxStyleRepository2: TcxStyleRepository
    Left = 625
    Top = 30
    PixelsPerInch = 96
    object cxStyle2: TcxStyle
    end
    object cxStyle3: TcxStyle
      AssignedValues = [svColor, svFont]
      Color = 550167807
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 13303807
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
    end
  end
end
