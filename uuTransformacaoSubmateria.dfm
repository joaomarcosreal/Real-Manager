inherited frmTransformacoesSubmateria: TfrmTransformacoesSubmateria
  Left = 109
  Top = 71
  Caption = 'Transforma'#231#227'o de Subprodutos'
  ClientHeight = 661
  ClientWidth = 1225
  ExplicitWidth = 1241
  ExplicitHeight = 700
  TextHeight = 13
  inherited pn_principal: TPanel
    Width = 1225
    Height = 599
    ExplicitWidth = 1225
    ExplicitHeight = 599
    inherited pn_codigo: TPanel
      Tag = 99
      Width = 1227
      Height = 78
      Color = 12615680
      ParentBackground = False
      ExplicitWidth = 1223
      ExplicitHeight = 78
      inherited bt_pesquisa: TSpeedButton
        Left = 63
        Top = -47
        Width = 35
        Height = 33
        Visible = False
        ExplicitLeft = 63
        ExplicitTop = -47
        ExplicitWidth = 35
        ExplicitHeight = 33
      end
      object Label1: TLabel [1]
        Left = 6
        Top = -61
        Width = 44
        Height = 13
        Caption = 'C'#243'digo:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        Visible = False
      end
      object Label4: TLabel [2]
        Left = 3
        Top = 24
        Width = 366
        Height = 33
        Caption = 'Transforma'#231#245'es de subprodutos '
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -27
        Font.Name = 'Calibri'
        Font.Style = [fsBold]
        ParentFont = False
      end
      inherited ed_codigo: TMaskEdit
        Top = -46
        Width = 57
        Height = 32
        Font.Height = -19
        ParentFont = False
        Visible = False
        ExplicitTop = -46
        ExplicitWidth = 57
        ExplicitHeight = 32
      end
    end
    object pnItem: TPanel
      Left = 1
      Top = 79
      Width = 1227
      Height = 71
      Align = alTop
      TabOrder = 1
      ExplicitWidth = 1223
      object btPesqSubmateria: TSpeedButton
        Left = 62
        Top = 28
        Width = 32
        Height = 28
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
        OnClick = botao_pesquisaClick
      end
      object Label22: TLabel
        Left = 5
        Top = 11
        Width = 66
        Height = 16
        Caption = 'C'#243'd. Item'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label2: TLabel
        Left = 920
        Top = 10
        Width = 105
        Height = 16
        Caption = 'Qtde Produ'#231#227'o'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Panel7: TPanel
        Tag = 99
        Left = 98
        Top = 16
        Width = 817
        Height = 47
        BevelOuter = bvNone
        Enabled = False
        TabOrder = 0
        object Label21: TLabel
          Left = 7
          Top = -2
          Width = 176
          Height = 16
          Caption = 'Descri'#231#227'o do subproduto'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label3: TLabel
          Left = 565
          Top = -2
          Width = 96
          Height = 16
          Caption = 'Estoque atual'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label6: TLabel
          Left = 690
          Top = -2
          Width = 121
          Height = 16
          Caption = 'Rendimento ficha'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object edDescricaoSubmateria: TEdit
          Left = 3
          Top = 14
          Width = 560
          Height = 28
          CharCase = ecUpperCase
          Color = clBlack
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          MaxLength = 3
          ParentFont = False
          TabOrder = 0
          Text = 'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
        end
        object Edit1: TEdit
          Left = 565
          Top = 13
          Width = 122
          Height = 28
          CharCase = ecUpperCase
          Color = clBlack
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          MaxLength = 3
          ParentFont = False
          TabOrder = 1
          Text = 'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
        end
        object Edit2: TEdit
          Left = 690
          Top = 13
          Width = 122
          Height = 28
          CharCase = ecUpperCase
          Color = clBlack
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          MaxLength = 3
          ParentFont = False
          TabOrder = 2
          Text = 'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
        end
      end
      object edCodSubmateria: TEdit
        Left = 3
        Top = 27
        Width = 57
        Height = 28
        CharCase = ecUpperCase
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        MaxLength = 3
        ParentFont = False
        TabOrder = 1
        OnEnter = Edit1Enter
        OnExit = Edit1Exit
        OnKeyDown = Edit1KeyDown
      end
      object btAtualizar: TBitBtn
        Left = 1064
        Top = 5
        Width = 156
        Height = 57
        Caption = 'Calcular ficha t'#233'cnica'
        Glyph.Data = {
          360C0000424D360C000000000000360000002800000020000000200000000100
          180000000000000C0000130B0000130B00000000000000000000FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9F9
          F9EEEEEEE4E4E4DEDEDEDDDDDDDFDFDFE6E6E6F1F1F1FCFCFCFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFAFAFAE9E9E9CDCD
          CDAAAAAA8D8D8D7D7D7D7B7B7B828282969696B5B5B5D8D8D8F0F0F0FCFCFCFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF4F4F4D5D5D5A7A09B9A7A
          629D6339A2531DA24E169D53249362437F6B5F686767838383B4B4B4E2E2E2FA
          FAFAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF1F1F1C6C2C0AC815EB0560AD273
          1BF18F2EFF9E36FF9F34FD972CE77F1DC15D0B9C4E1C7F6A5E6A6A6A9F9F9FDC
          DCDCFAFAFAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCFCFC
          F3F3F3F2F2F2FBFBFBFFFFFFFFFFFFF1F1F1C5BAB0AE672AD1731CFFA646FFA6
          45FFA23FFF9E3AFF9C34FF9B31FF9A2CFF9C2AF78B1FB14E0594694D6565659D
          9D9DDFDFDFFCFCFCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9F9F9DCDCDC
          B9B9B9B8B8B8D9D9D9F7F7F7F6F6F6CEC0B2B36118E89038FFAE52FFA64AFFA3
          45FFA141FFA03EFFA03BFFA139FF9D31FF972AFF9B29FF9E25C05A099C6A4A6C
          6C6CADADADECECECFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE7E3DFB39477
          9B7E62706D6A949494D5D5D5D4CAC2B7681DEE9841FFB05BFFA951FFA74DFFA5
          49FFA648FFA543DA7B1FBA5907B85B15B75F22A94E0CBB5809E87D16BE560897
          7764818181CFCFCFF9F9F9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC48646D7822B
          D8852DAA7035636363939292B77738E5923DFFB464FFAD5AFFAB56FFA953FFAB
          51F4993EB95A06BE895DDFCEC1F7F7F7FEFEFEFDFAF9EAD0BEC57E4FAF4B03A5
          480E918B88B4B4B4EFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBE650DFFCC90
          FFCC90D07D1F8E7255957658D37E23FFC17EFFB56CFFB161FFAD5AFFAE5AF199
          40B46015C4AF9CEEEEEEFDFDFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE7C2AAAA
          4C0DC09073C2C2C2EEEEEEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC4782CFDC389
          FFC88EFFC58CC06907BF6809FFC589FFC182FFBB78FFB66CFFB464F9A550B763
          10BBAC9FECECECFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFED
          CDBAD48D5FF0F0F0FBFBFBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCE9253F2B675
          FFCB96FFCD97F1B570EDAB63FFC891FFC488FFC182FFBC79FFBC72C56B09AF97
          7FE1E1E1FDFDFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDAAD7AE7A55C
          FFD2A4FFCC9BFFCE9CFFCD9AFFC893FFC68CFFC488FFC486E1933DAF804DC5C5
          C5F6F6F6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE4C4A0DE963E
          FFDBB5FFD0A1FFCFA1FFCD9CFFCB97FFC892FFC68DFFC284BC690E817C77BCBC
          BCE1E1E1F3F3F3FEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFEFEFEFCFCFCFBFBFBFEFEFEFFFFFFFFFFFFFFFFFFF2E0CAD58621
          FFE1C3FFD3A8FFD2A6FFD0A3FFCD9CFFCA97FFCB95DF943BA8743D605D5B6D6D
          6D8D8D8DC1C1C1F1F1F1FFFFFFFFFFFFFAFAFAF5F5F5F0F0F0ECECECE7E7E7E3
          E3E3DEDEDED8D8D8D0D0D0CFCFCFE2E2E2F9F9F9FFFFFFFFFFFFFCF7F1D07804
          FFE9D0FFD8B1FFD5ACFFD2A7FFCF9FFFCC98FFCB95EFAD64D78728C56C04B874
          2F7E6F61868686DEDEDEF9F9F9E7E7E7CECECEBDBDBDB0B0B0A3A3A39696968A
          8A8A807F7F7C76747C746F727272969696D9D9D9FCFCFCFFFFFFFFFFFFDC861D
          FEDFBFFFE5CAFFD6ACFFD3A8FFD0A1FFCC99FFCA93FFC88EFFC68AFFC27EF6A8
          55BC6C147D7C7BD8D8D8E6E6E6ABA0998D7C708F74639671589C694AA25F38A5
          4E219F440BA94D11B1561C9955336A6867B0B0B0F0F0F0FFFFFFFFFFFFE29D44
          F6C995FFEFDFFFE2C3FFD5ABFFCFA0FFCD9CFFCB95FFC78FFFC588FFC07DFFBD
          72C46B05A9A4A0E6E6E6CF9161B75909C36C23CE7F3DD99053E4A66EF0BB8BFC
          D2A9FFE3BDFFE2BBFFE7BCC3733E88695A919191E5E5E5FFFFFFFFFFFFEEC185
          E5A34CFFEBD7FFEBD7FFE6CCFFD8B0F8C58CF2B56EE9A354E0953CD88422CD74
          0BD79F60E6E6E6F6ECE6B85806FFD296FFC788FFCD95FFD09BFFD3A3FFD4A8FF
          D6ACFFD7AEFFD5ADFFD8AEEAAE7D9A5B3D7E7E7EDEDEDEFFFFFFFFFFFFFEF8F2
          D99735DE9222DB880FD68008DF8C1FE0983CE0A458E0B074E4BE91E8CCADF0E1
          D0F9F9F9FFFFFFFCF9F6B75C0FF7B777FFD5A2FFD19CFFCC97FFCE9CFFD0A2FF
          D2A7FFD5AAFFD5ABFFD6AAFACA99A14921717171D4D4D4FDFDFDFFFFFFFFFFFF
          FFFDFBF9E7CFF8EDDEFAF8F5FEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFEFD0B4C5722EB75805CC7B31ECAC71FFCE9BFFCE9EFF
          D0A2FFD1A5FFD3A6FFD2A4FFDCAB9F3D066C6A6AC6C6C6F8F8F8FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF1E7E1B57141D58843FFCE98FFCB99FF
          CD9BFFCE9FFFD0A0FFCF9EFFD8A5B15516756C68B6B6B6F2F2F2FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFDFDFDDED4CCB0570DFFC68BFFC790FFC891FF
          CA96FFCB98FFCB97FFCA97FFD29CC26F327F6C62A5A5A5ECECECFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFBFBFBF0F0F0F5F5F5FEFEFEFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFECECECC08554DC8E42FFC688FFC486FFC58CFF
          C68FFFCA93FFCA93FFC78EFFCC91D587498A6857959595E6E6E6FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFEEEEEEC2C2C2C9C9C9ECECECFDFDFDFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFDFDFDEEEEEEC6AA90BF630AFFBE76FFBE7AFFBF80FFC183FF
          C98CE69E5CEFAD6FFFC98FFFC687E79E5F916046858585E1E1E1FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFECAB5DBFAC958D8D8DB3B3B3DFDFDFF4F4F4FDFDFDFFFF
          FFFEFEFEF7F7F7E4E4E4BEB0A2B76110F8A651FFB465FFB76DFFBB76FFC07EFF
          C180A94C09AD4D05FFCD95FFC280F7B47198522D7F7F7FDEDEDEFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFEAB778CD7C11A18D75707070939393BDBDBDD6D6D6DDDD
          DDD9D9D9C3C3C3AC9A88B76616F09A41FFAE59FFAC58FFAF5FFFB368FFC077C5
          6D1FA58168C19372C26921FFD69FFFC2799E43129D9D9DE8E8E8FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFCF0E3CF7C0BD17804B78546796F636766667575757D7D
          7D898178AA8052C26805F49A3EFFAB50FFA851FFAA53FFAB55FFB35FE18B38AA
          6838CBCACAF4F2F1B96B37D1782FC96E26AD6E46DCDCDCF9F9F9FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFF0C78BDD8009F08817D17A07BE7211C07B28C576
          1AC96F06E0831EFFA342FFA647FFA447FFA64AFFA74DFFAD53EC953BAE5D1DC4
          BCB5F2F2F2FFFFFFFAF0EADAA888D8AC91EEEAE8FBFBFBFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFEFEE0AA57DE800BFF9828FF9729FC9529FF9A
          30FFA039FFA03BFFA03CFFA03FFFA241FFA343FFB45FEA8F36B25E18C8B9AEF1
          F1F1FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFBE9AF62D97D06FB962AFF9E38FF98
          2CFF992DFF9B31FF9B33FF9F3AFFB15DFFB668D57A1EB46C29D4C7BDF4F4F4FF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF5D1A1CF811ADC8110F29C
          3EFFAC56FFB461FFB463F5AA5BDC8427BD6108CB9869E7E3DFF9F9F9FFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDF9F5E8C79DD295
          4CC7781EC36D0BC16C14C5813AD0A57AE9DFD4F9F9F9FFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
        Layout = blGlyphTop
        TabOrder = 2
        OnClick = btAtualizarClick
      end
      object edQuantidade: TCurrencyEdit
        Left = 921
        Top = 25
        Width = 103
        Height = 32
        AutoSize = False
        DecimalPlaces = 3
        DisplayFormat = ',0.000;'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 3
        Value = 1.000000000000000000
        OnEnter = Edit1Enter
        OnExit = Edit1Exit
        OnKeyDown = Edit1KeyDown
      end
    end
    object Panel4: TPanel
      Tag = 99
      Left = 1
      Top = 161
      Width = 1227
      Height = 378
      Align = alTop
      Caption = 'pnFichaTecnica'
      TabOrder = 2
      ExplicitWidth = 1223
    end
    object Panel1: TPanel
      Left = 1
      Top = 150
      Width = 1227
      Height = 11
      Align = alTop
      TabOrder = 3
      ExplicitWidth = 1223
    end
  end
  inherited pn_botoes: TPanel
    Top = 599
    Width = 1225
    Height = 62
    ExplicitTop = 599
    ExplicitWidth = 1225
    ExplicitHeight = 62
    inherited bt_novo: TBitBtn
      Top = 0
      Width = 242
      Height = 55
      Caption = 'Nova transforma'#231#227'o'
      ExplicitTop = 0
      ExplicitWidth = 242
      ExplicitHeight = 55
    end
    inherited bt_alterar: TBitBtn
      Top = -87
      Visible = False
      ExplicitTop = -87
    end
    inherited bt_gravar: TBitBtn
      Left = 243
      Top = 0
      Width = 242
      Height = 55
      Caption = 'Confirmar transforma'#231#227'o'
      ExplicitLeft = 243
      ExplicitTop = 0
      ExplicitWidth = 242
      ExplicitHeight = 55
    end
    inherited bt_cancelar: TBitBtn
      Left = 486
      Top = 0
      Width = 242
      Height = 55
      ExplicitLeft = 486
      ExplicitTop = 0
      ExplicitWidth = 242
      ExplicitHeight = 55
    end
    inherited bt_sair: TBitBtn
      Left = 728
      Top = 0
      Width = 242
      Height = 55
      ExplicitLeft = 728
      ExplicitTop = 0
      ExplicitWidth = 242
      ExplicitHeight = 55
    end
    inherited bt_excluir: TBitBtn
      Top = -87
      Visible = False
      ExplicitTop = -87
    end
    inherited bt_consultar: TBitBtn
      Left = 195
      Top = -64
      Width = 194
      Height = 55
      Visible = False
      ExplicitLeft = 195
      ExplicitTop = -64
      ExplicitWidth = 194
      ExplicitHeight = 55
    end
    inherited bt_imprimir: TBitBtn
      Top = -49
      Visible = False
      ExplicitTop = -49
    end
  end
  object FDMemTable1: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 479
    Top = 316
  end
end
