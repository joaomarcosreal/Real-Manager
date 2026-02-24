object frm_caixa_restaurante: Tfrm_caixa_restaurante
  Left = 174
  Top = 124
  BorderStyle = bsSingle
  BorderWidth = 1
  ClientHeight = 540
  ClientWidth = 789
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 13
  object Panel4: TPanel
    Left = 0
    Top = 0
    Width = 108
    Height = 46
    Caption = 'BALC'#195'O'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Comic Sans MS'
    Font.Style = []
    ParentFont = False
    TabOrder = 9
  end
  object pn_mesa: TPanel
    Left = 0
    Top = -1
    Width = 104
    Height = 47
    BevelWidth = 2
    TabOrder = 0
    object Label21: TLabel
      Left = 6
      Top = 5
      Width = 89
      Height = 13
      Caption = 'Mesa/Comanda'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object ed_numero_mesa: TFocusEdit
      Left = 4
      Top = 20
      Width = 93
      Height = 21
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      OnChange = ed_numero_mesaChange
      OnEnter = ed_numero_mesaEnter
      OnExit = ed_numero_mesaExit
      OnKeyDown = ed_numero_mesaKeyDown
      NormalColor = clWindow
      FocusColor = clYellow
    end
  end
  object pn_garcon: TPanel
    Left = 103
    Top = -1
    Width = 95
    Height = 46
    BevelWidth = 2
    TabOrder = 1
    object Label1: TLabel
      Left = 5
      Top = 5
      Width = 76
      Height = 13
      Caption = 'Cod. Gar'#231'on:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object bt_pesquisa_garcon: TSpeedButton
      Left = 61
      Top = 18
      Width = 28
      Height = 23
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
      OnClick = bt_pesquisa_garconClick
    end
    object ed_cod_garcon: TFocusEdit
      Left = 3
      Top = 19
      Width = 54
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      OnChange = ed_cod_garconChange
      OnEnter = ed_numero_mesaEnter
      OnExit = ed_numero_mesaExit
      OnKeyDown = ed_numero_mesaKeyDown
      NormalColor = clWindow
      FocusColor = clYellow
    end
  end
  object pn_produto: TPanel
    Left = 198
    Top = 0
    Width = 592
    Height = 46
    BevelWidth = 2
    TabOrder = 2
    object Label2: TLabel
      Left = 5
      Top = 4
      Width = 61
      Height = 13
      Caption = 'Cod. Prod:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object bt_pesq_produto: TSpeedButton
      Left = 60
      Top = 18
      Width = 26
      Height = 23
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
      OnClick = bt_pesq_produtoClick
    end
    object Label3: TLabel
      Left = 91
      Top = 5
      Width = 62
      Height = 13
      Caption = 'Descri'#231#227'o:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label5: TLabel
      Left = 404
      Top = 4
      Width = 38
      Height = 13
      Caption = 'Pre'#231'o:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label6: TLabel
      Left = 468
      Top = 4
      Width = 32
      Height = 13
      Caption = 'Qtde:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lbNumeroComanda: TLabel
      Left = 512
      Top = 7
      Width = 75
      Height = 13
      Caption = 'N'#186' Comanda:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object ed_cod_produto: TFocusEdit
      Left = 4
      Top = 18
      Width = 53
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      OnChange = ed_cod_produtoChange
      OnEnter = ed_numero_mesaEnter
      OnExit = ed_numero_mesaExit
      OnKeyDown = ed_numero_mesaKeyDown
      NormalColor = clWindow
      FocusColor = clYellow
    end
    object ed_descricao_produto: TFocusEdit
      Left = 90
      Top = 19
      Width = 309
      Height = 21
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      OnEnter = ed_numero_mesaEnter
      OnExit = ed_numero_mesaExit
      NormalColor = clWindow
      FocusColor = clYellow
    end
    object ed_valor_produto: TFocusEdit
      Left = 403
      Top = 19
      Width = 61
      Height = 21
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 2
      OnEnter = ed_numero_mesaEnter
      OnExit = ed_numero_mesaExit
      OnKeyDown = ed_numero_mesaKeyDown
      NormalColor = clWindow
      FocusColor = clYellow
    end
    object ed_quantidade: TFocusEdit
      Left = 467
      Top = 19
      Width = 42
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 3
      Text = '1'
      OnChange = ed_quantidadeChange
      OnEnter = ed_numero_mesaEnter
      OnExit = ed_numero_mesaExit
      OnKeyDown = ed_numero_mesaKeyDown
      NormalColor = clWindow
      FocusColor = clYellow
    end
    object ed_numero_comanda: TFocusEdit
      Left = 512
      Top = 19
      Width = 70
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      MaxLength = 10
      ParentFont = False
      TabOrder = 4
      OnEnter = ed_numero_mesaEnter
      OnExit = ed_numero_mesaExit
      OnKeyDown = ed_numero_mesaKeyDown
      NormalColor = clWindow
      FocusColor = clYellow
    end
  end
  object memo_codigos_formas: TMemo
    Left = 327
    Top = -110
    Width = 144
    Height = 73
    BevelInner = bvLowered
    BevelOuter = bvNone
    BorderStyle = bsNone
    Enabled = False
    TabOrder = 3
    Visible = False
  end
  object Panel2: TPanel
    Left = 447
    Top = -480
    Width = 346
    Height = 408
    Color = 10930928
    TabOrder = 4
    object lb_hora: TLabel
      Left = 24
      Top = 8
      Width = 294
      Height = 86
      Caption = '00:00:00'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -73
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
    end
  end
  object Panel3: TPanel
    Left = 459
    Top = 206
    Width = 329
    Height = 315
    BevelWidth = 2
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
    TabOrder = 5
    object Image1: TImage
      Left = 11
      Top = 12
      Width = 121
      Height = 105
    end
    object Panel1: TPanel
      Left = 3
      Top = 121
      Width = 325
      Height = 90
      BevelOuter = bvLowered
      BevelWidth = 2
      TabOrder = 0
      object descricao_prod: TLabel
        Left = 12
        Top = 26
        Width = 60
        Height = 19
        Caption = 'JJHJHJ'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Visible = False
      end
      object lb_preco: TLabel
        Left = 79
        Top = 41
        Width = 13
        Height = 52
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -37
        Font.Name = 'Arial Black'
        Font.Style = [fsBold]
        ParentFont = False
        Visible = False
      end
      object lb_cod_produto: TLabel
        Left = 0
        Top = 0
        Width = 75
        Height = 14
        Caption = 'lb_cod_produto'
        Visible = False
      end
    end
    object G30001012: TGroupBox
      Left = 4
      Top = 218
      Width = 321
      Height = 91
      Enabled = False
      TabOrder = 1
      object Label10: TLabel
        Left = 5
        Top = 9
        Width = 72
        Height = 16
        Caption = 'Valor Bruto'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label12: TLabel
        Left = 121
        Top = 9
        Width = 72
        Height = 16
        Caption = 'Tx. Servi'#231'o'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label19: TLabel
        Left = 195
        Top = 49
        Width = 36
        Height = 16
        Caption = 'Total:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label4: TLabel
        Left = 217
        Top = 10
        Width = 64
        Height = 16
        Caption = 'Descontos'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object ed_valor_bruto: TCurrencyEdit
        Left = 6
        Top = 24
        Width = 109
        Height = 23
        AutoSize = False
        Color = clBlue
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
      end
      object ed_total_tx_serv: TCurrencyEdit
        Left = 122
        Top = 25
        Width = 90
        Height = 23
        AutoSize = False
        Color = clBlue
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -15
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
      end
      object ed_total_conta: TCurrencyEdit
        Left = 197
        Top = 62
        Width = 108
        Height = 25
        AutoSize = False
        Color = clBlue
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 2
      end
      object edTotalDescontos: TCurrencyEdit
        Left = 218
        Top = 25
        Width = 90
        Height = 23
        AutoSize = False
        Color = clBlue
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 3
      end
    end
  end
  object pn_controle: TPanel
    Left = 458
    Top = 47
    Width = 336
    Height = 157
    BevelWidth = 2
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
    TabOrder = 6
    object G30001013: TGroupBox
      Left = 2
      Top = 1
      Width = 331
      Height = 155
      TabOrder = 0
      object B30001002: TBitBtn
        Left = 4
        Top = 9
        Width = 105
        Height = 35
        Hint = 'Emite um extrato ( Pr'#233'-conta / Fechamento) da mesa informada.'
        Caption = 'Extrato-F3'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -7
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        OnClick = B30001002Click
        OnKeyDown = B30001002KeyDown
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000130B0000130B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00300000000000
          00033FFFFFFFFFFFFFFF0888888888888880777777777777777F088888888888
          8880777777777777777F0000000000000000FFFFFFFFFFFFFFFF0F8F8F8F8F8F
          8F80777777777777777F08F8F8F8F8F8F9F0777777777777777F0F8F8F8F8F8F
          8F807777777777777F7F0000000000000000777777777777777F3330FFFFFFFF
          03333337F3FFFF3F7F333330F0000F0F03333337F77773737F333330FFFFFFFF
          03333337F3FF3FFF7F333330F00F000003333337F773777773333330FFFF0FF0
          33333337F3FF7F3733333330F08F0F0333333337F7737F7333333330FFFF0033
          33333337FFFF7733333333300000033333333337777773333333}
        NumGlyphs = 2
      end
      object B30001003: TBitBtn
        Left = 109
        Top = 9
        Width = 105
        Height = 35
        Hint = 
          'Efetua baixa da conta, informando'#13#10'as formas de pagamento da mes' +
          'ma.'
        Caption = 'Fechar-F4'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -7
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 1
        OnClick = B30001003Click
        OnKeyDown = B30001002KeyDown
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000120B0000120B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333330000000
          00003333377777777777333330FFFFFFFFF03FF3F7FFFF33FFF7003000000FF0
          00F077F7777773F77737E00FBFBFB0FFFFF07773333FF7FF33F7E0FBFB00000F
          F0F077F333777773F737E0BFBFBFBFB0FFF077F3333FFFF733F7E0FBFB00000F
          F0F077F333777773F737E0BFBFBFBFB0FFF077F33FFFFFF733F7E0FB0000000F
          F0F077FF777777733737000FB0FFFFFFFFF07773F7F333333337333000FFFFFF
          FFF0333777F3FFF33FF7333330F000FF0000333337F777337777333330FFFFFF
          0FF0333337FFFFFF7F37333330CCCCCC0F033333377777777F73333330FFFFFF
          0033333337FFFFFF773333333000000003333333377777777333}
        NumGlyphs = 2
      end
      object B30001004: TBitBtn
        Left = 214
        Top = 9
        Width = 114
        Height = 35
        Hint = 
          'Cancela o '#237'tem selecionado na grade ao lado.'#13#10'Quando o lan'#231'ament' +
          'o tiver quantidade maior que 1, o sistema'#13#10'solicitar'#225' a quantida' +
          'de a ser estornada.'
        Caption = 'Cancela item - F5'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -7
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 2
        OnClick = B30001004Click
        OnKeyDown = B30001002KeyDown
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
        NumGlyphs = 2
      end
      object B30001005: TBitBtn
        Left = 4
        Top = 44
        Width = 105
        Height = 35
        Hint = 
          'Envia uma mensagem para a impressora do estacionamento, '#13#10'para q' +
          'ue o manobrista possa buscar o carro do cliente do ticket inform' +
          'ado'
        Caption = 'Estac. - F6'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -7
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 3
        OnClick = B30001005Click
        OnKeyDown = B30001002KeyDown
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000120B0000120B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
          3333333333333333333333333333333333333FFFFFFFFFFFFFFF000000000000
          000077777777777777770FFFFFFFFFFFFFF07F3333FFF33333370FFFF777FFFF
          FFF07F333777333333370FFFFFFFFFFFFFF07F3333FFFFFF33370FFFF777777F
          FFF07F33377777733FF70FFFFFFFFFFF99907F3FFF33333377770F777FFFFFFF
          9CA07F77733333337F370FFFFFFFFFFF9A907FFFFFFFFFFF7FF7000000000000
          0000777777777777777733333333333333333333333333333333333333333333
          3333333333333333333333333333333333333333333333333333333333333333
          3333333333333333333333333333333333333333333333333333}
        NumGlyphs = 2
      end
      object B30001016: TBitBtn
        Left = 109
        Top = 44
        Width = 105
        Height = 35
        Caption = 'Estona mesa -F7'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -7
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 4
        OnClick = B30001016Click
        OnKeyDown = B30001002KeyDown
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000120B0000120B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333300000000
          0000333377777777777733330FFFFFFFFFF033337F3FFF3F3FF733330F000F0F
          00F033337F777373773733330FFFFFFFFFF033337F3FF3FF3FF733330F00F00F
          00F033337F773773773733330FFFFFFFFFF033337FF3333FF3F7333300FFFF00
          F0F03333773FF377F7373330FB00F0F0FFF0333733773737F3F7330FB0BF0FB0
          F0F0337337337337373730FBFBF0FB0FFFF037F333373373333730BFBF0FB0FF
          FFF037F3337337333FF700FBFBFB0FFF000077F333337FF37777E0BFBFB000FF
          0FF077FF3337773F7F37EE0BFB0BFB0F0F03777FF3733F737F73EEE0BFBF00FF
          00337777FFFF77FF7733EEEE0000000003337777777777777333}
        NumGlyphs = 2
      end
      object B30001008: TBitBtn
        Left = 4
        Top = 80
        Width = 105
        Height = 35
        Hint = 'Faz uma transfer'#234'ncia de mesa ou agrupamento.'
        Caption = 'Transf. Mesa-F9'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -7
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 6
        OnClick = B30001008Click
        OnKeyDown = B30001002KeyDown
        Glyph.Data = {
          8E010000424D8E010000000000007600000028000000230000000E0000000100
          0400000000001801000000000000000000001000000010000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
          888888888888888888888880F444800000000000888888888000000000008880
          F000807888888880088888888078888888800880F00080777777777080888888
          807777777770808F7BBB88077777777080888888880777777770808FFFFF8880
          0000000800888888888000000008008FFFFF8807777777700888888888077777
          7770088FDDDD88070000007088888888880700000070888F73A688070FFFF070
          888888CCC8070FFFF070888DDFFD88070FFFF0708888888CC8070FFFF070888F
          77F68807000000708C8888C8C807000000708880000088077777770088CCCC88
          880777777700888CCCCC88800000000888888888888000000008888888888888
          888888888888888888888888888888800000}
        NumGlyphs = 2
      end
      object B30001009: TBitBtn
        Left = 109
        Top = 80
        Width = 105
        Height = 35
        Hint = 
          'Transfere o '#237'tem selecionado na grade ao lado para uma mesa a se' +
          'r informada.'
        Caption = 'Transf. '#237'tem-F10'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -7
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 7
        OnClick = B30001009Click
        OnKeyDown = B30001002KeyDown
        Glyph.Data = {
          36030000424D3603000000000000360000002800000010000000100000000100
          1800000000000003000000000000000000000000000000000000FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF303030606060FFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFF000000303030C0C0C0909090FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000007F0000303030C0C0C09090
          90FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFF3F0000BF0000303030C0C0C0909090FFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6060609090909090907F0000BF00003030
          30C0C0C0909090FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF303030909090C0C0C0C0
          C0C09090906060607F0000FF0000BF0000303030C0C0C0909090FFFFFFFFFFFF
          303030909090C0C0C09090906060600000000000007F0000BF0000FF0000FF00
          00BF0000303030303030FFFFFF303030C0C0C09090903030300000003F0000BF
          0000FF0000FF0000FF0000FF0000FF0000FF0000FF3F005F3F00303030C0C0C0
          3030300000003F0000BF0000FF0000FF0000FF0000FF3F00FF7F00FF3F00FF00
          00FF3F00DFBF00200000FFFFFF000000000000BF0000FF0000FF0000FF0000FF
          0000FFBF00BF7F009F3F00FF7F00FF3F00DFBF00200000FFFFFF0000007F3F00
          BF7F00FF7F00FF7F00FF0000FF0000FFBF007F3F00FFFFFF400000FFBF00DFBF
          00200000FFFFFFFFFFFF400000400000400000400000BF7F00FF0000FFBF007F
          3F00FFFFFFFFFFFF7F3F00DFBF00200000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFBF7F00FFBF007F3F00FFFFFFFFFFFF200000BF7F00200000FFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBF7F007F3F00FFFFFFFF
          FFFFFFFFFF200000200000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFF600000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
      end
      object B30001010: TBitBtn
        Left = 214
        Top = 80
        Width = 114
        Height = 35
        Hint = 
          'Efetua um cr'#233'dito na mesa do cliente. '#218'til'#13#10' nos casos em que um' +
          ' dos clientes da mesa vai embora'#13#10'e deseja efetuar o pagamento d' +
          'e uma parte da conta.'
        Caption = 'Pagto. Parc. F11'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -7
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 8
        OnClick = B30001010Click
        OnKeyDown = B30001002KeyDown
        Glyph.Data = {
          D6050000424DD605000000000000360000002800000018000000140000000100
          180000000000A0050000202E0000202E00000000000000000000FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF2EDEFD3C0
          CAFFFFFFFFFFFFFFFFFFFFFFFFFEFEFFFEFFFFFEFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFCDB0BECDADBCFFFFFFFFFFFFFDFDFEE4D8E9F4F1F7FFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFA36D90DECAD3FFF9D9FCEAA7C49C94B87F53EFC653
          ECCA5FF1D682F9EBBDFCFBF4FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE5FDFE94F5
          F8D4FCFDF9FFFFFFFFFFFFFFFFFFFFFBDECABD8A465BE0AE35EBB308B1682495
          4835E4A503F1B200EDAF00E3A302DEA002E8BA31F5E5B5FFFFFFFFFFFFFFFFFF
          FFFFFFC0FCFD027F881D6F7A4BBCCC93F6FED1FDE1F3D356EB9F0DD8880CF1AC
          00E1A009AC6533DB9C0FEAAE02CE8E16BA7828BD7A27D6980EE7A800E6AB0DF5
          E6B4FFFFFFFFFFFFFFFFFF96EDF40B4A47495400325B171354441B6B663D9674
          6BBB77A6C84ED0BE27E8B713F7B807FCB700E9A304CC7E15D38613E8A203F0AB
          00EEAB00E9A500EABD41FFFFFFFFFFFEFFFFFF57CFDC1436227BA00B84B21378
          9B145B73113A541A1B4F360D615E1C7D7C408F7669A16589B561A3C04FBDC83C
          CEC32CDEC120E5BE1CE7B713E6AA02E8B00FFFFFFFFFFFFFF4FFFF2CA1B22F3D
          057DAB1187B1317DA92C79AC1F83B32581A51E718815586D0E3752191F482917
          50441055560F5B621E65632E796939876D3DA788A1C24EF5B00BFFFFFFFFFFFF
          BDFEFF0A5F6D50600087B62C71A01D6196035D930064970C89B1438DBA367BA6
          1E81AB1B88AD287D9D1D718D19617C19516D104B6D162C3F12096F84AAC751FB
          BC3EFFFFFFFFFEF177DCCB0937336C8C0F7EAE275C92026196005E940074A222
          84B02E648E0BA1AA92AFC87580AD2278A7276BA01180AE2D87B32487B7153B52
          101E918BD4BC21FEDC9EFFFFFFEFE89E3497782336157DAC1480AD3061950360
          95005F95027FAA2F78A810688923C5C6C3C1D49076A50C73A21E59910066980B
          87B0387BA71221391C2FA282EACE55FFFAF0FFF0CEBFC94C1459575068078BBB
          188AB5316FA21862980661950680A93372A310859A5BDBDCD791B33E79A81371
          A11E5F94005E940078A722779E161338284EC4ACFFF3CEFFFFFFFFD77671B963
          0038563F570F5C790B6D850C7B991783AA1F83B0248FBA418DB939789D27B8C8
          918CB3337FAB2E6196075F95005E94027EAE296C8C0F0A3B3774EBF3FFFFFFFE
          FFFFEFBE349CB8435CA86F3D937924877F1C78702266522A5C343D5E21556E15
          708F1A7CA3197FAC1892B83F8AB33F6EA11863990677A4268CB937637F050840
          4282F2FCFFFFFFFFFFFFE8B517EEA900F1B307E6B711D9BB1DCAC52FA2C0546C
          B77746A8812183781568651D53452D5528486C1A69871282A21F8BB1318EB938
          86BA1A64800A07414389F3FCFFFFFFFFFFFFEBBF3FE7A800E9AC00EBAC00F0AF
          00C97E1BE49709F9AF00EFB303D6C026B4C64E93BC5B66A868338C7A166C6517
          55372F52165165037594066C8B010E433E85EFF9FFFFFFFFFFFFF4E0A2E7A600
          E8A900F0B500BD7B268E464ADCA00CEFB400B66E29CA7C1CFCB000EFA000DF9C
          0FE3C01EB4C14D8CD6C15FBCD02B869115615624461904241F77DCE2FFFFFFFF
          FFFFFCFEFEF1D684EAB007D490069C502FD9970BEDAF00ECAC00954B3CBA731B
          EEB100DEA00F9C5240D89F56FFF7CBFFFFFFFFFFFFEEFFFFB5F8FF6BD3DF2D94
          9C56D3D8FFFFFFFFFFFFFEFFFFFEFFFFF4E7C0C49470DEAF4EEFBB21EAB41FE9
          B524A66447E0B75CF3D87FFAECB5E0CDCCBA97B7F9F7FAFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFEEFFFFCAFEFFFAFFFEFFFFFFFFFFFFFFFFFFFAFEFFF5F5FCFEFD
          F3FAF5E1FCF6DEF7F1DDD9C1C5FCFAF8FEFFFFFEFFFFFFFFFFF2EBEEF9F6F8FF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFFFFFFFFFF}
      end
      object btTrocaMod: TBitBtn
        Left = 4
        Top = 116
        Width = 105
        Height = 35
        Hint = 'Efetua  um suprimento no ECF (Emissor de Cupom Fiscal)'
        Caption = 'Balc'#227'o - B'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -7
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 9
        OnClick = btTrocaModClick
        OnKeyDown = B30001002KeyDown
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
        NumGlyphs = 2
      end
      object B30001014: TBitBtn
        Left = 109
        Top = 116
        Width = 105
        Height = 35
        Hint = 
          'Efetua uma sangria no valor informado no ECF (Emissor de Cupom F' +
          'iscal)'
        Caption = 'Suprimento'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -7
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 10
        OnClick = B30001014Click
        OnKeyDown = B30001002KeyDown
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000130B0000130B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF003333330B7FFF
          FFB0333333777F3333773333330B7FFFFFB0333333777F3333773333330B7FFF
          FFB0333333777F3333773333330B7FFFFFB03FFFFF777FFFFF77000000000077
          007077777777777777770FFFFFFFF00077B07F33333337FFFF770FFFFFFFF000
          7BB07F3FF3FFF77FF7770F00F000F00090077F77377737777F770FFFFFFFF039
          99337F3FFFF3F7F777FF0F0000F0F09999937F7777373777777F0FFFFFFFF999
          99997F3FF3FFF77777770F00F000003999337F773777773777F30FFFF0FF0339
          99337F3FF7F3733777F30F08F0F0337999337F7737F73F7777330FFFF0039999
          93337FFFF7737777733300000033333333337777773333333333}
        NumGlyphs = 2
      end
      object B30001006: TBitBtn
        Left = 214
        Top = 116
        Width = 114
        Height = 35
        Hint = 
          'Emite o relat'#243'rio fiscal ref. ao movimento do dia fiscal corrent' +
          'e no ECF (Emissor de cupom fiscal)'
        Caption = 'Leitura X'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -7
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 11
        OnClick = B30001006Click
        OnKeyDown = B30001002KeyDown
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000130B0000130B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333000000
          000333FFF3777777777F3000330FFFFFFF033777FF7F3FF3FF7F07B7030F00F0
          0F0377777F7F7737737F0BBB030FFFFFFF0377777F7F3FFFF37F07B7030F0000
          FF037777737F7777337F3000330FFFFFFF033777337F3FF3FF7F3333330F00F0
          00033333337F7737777F3333330FFFF0FF033FFFFF7F3FF7F3730000030F08F0
          F03377777F7F7737F7330999030FFFF0033377777F7FFFF77333099903000000
          333377777F7777773333099903333333333377777F33FFFFFFF3000003300000
          00337777733777777733333333330CCC033333333333777773333333333330C0
          3333333333333777333333333333330333333333333333733333}
        NumGlyphs = 2
      end
      object B30001007: TBitBtn
        Left = 214
        Top = 44
        Width = 114
        Height = 35
        Hint = 'Efetua um desconto em um produto '
        Caption = 'Desconto em item'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -7
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 5
        OnClick = B30001007Click
        OnKeyDown = B30001002KeyDown
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000130B0000130B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333344
          4443333333333338883333333333344444443388833333888883344433333444
          4444388888333888888844444333344444443388888338888888344444433344
          4443373388883888888833344444333444333733388883888883333344444333
          3333733333888838883333333344444333333333333888833333333333344444
          3333333333338888333333344433444444333333888338888333334444433344
          4443333888883388883334444444333444443388888883388883344444443333
          3444378888888333888334444444333333444388888883333888334444433333
          3334333888883333338333344433333333333333888777333333}
        NumGlyphs = 2
      end
    end
  end
  object Panel5: TPanel
    Left = -1
    Top = 45
    Width = 459
    Height = 477
    BevelWidth = 2
    TabOrder = 7
    object fundo_caixa: TImage
      Left = 5
      Top = 32
      Width = 415
      Height = 435
      Stretch = True
      Transparent = True
      Visible = False
    end
    object Label18: TLabel
      Left = 6
      Top = 10
      Width = 130
      Height = 13
      Caption = 'F12- Navega na Grade'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
    end
    object D30001011: TDBGrid
      Left = 7
      Top = 31
      Width = 449
      Height = 438
      DataSource = dm.ds_qry_movimento_mesa
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ParentShowHint = False
      PopupMenu = PopupMenu1
      ReadOnly = True
      ShowHint = True
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = [fsBold]
      OnDrawDataCell = D30001011DrawDataCell
      OnDrawColumnCell = D30001011DrawColumnCell
      OnEnter = ed_numero_mesaEnter
      OnExit = D30001011Exit
      OnKeyDown = ed_numero_mesaKeyDown
      OnMouseMove = D30001011MouseMove
    end
    object rdg_modo_visualizacao: TRadioGroup
      Left = 248
      Top = 1
      Width = 185
      Height = 28
      Caption = 'Modo de Visualiza'#231#227'o - ctrl+a'
      Columns = 2
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ItemIndex = 0
      Items.Strings = (
        'Anal'#237'tico'
        'Resumido')
      ParentFont = False
      TabOrder = 1
      OnClick = rdg_modo_visualizacaoClick
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 521
    Width = 789
    Height = 19
    Panels = <
      item
        Width = 50
      end>
  end
  object PopupMenu1: TPopupMenu
    Left = 354
    Top = 342
    object ransferirtem1: TMenuItem
      Caption = 'Transferir '#237'tem'
      OnClick = ransferirtem1Click
    end
    object Cancelartem1: TMenuItem
      Caption = 'Cancelar '#237'tem'
      OnClick = Cancelartem1Click
    end
  end
end
