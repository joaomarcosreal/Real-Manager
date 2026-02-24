inherited frm_consulta_faturas: Tfrm_consulta_faturas
  Left = 102
  Top = 181
  Caption = 'Controle de Faturas'
  ClientHeight = 276
  ClientWidth = 517
  OldCreateOrder = True
  ExplicitWidth = 533
  ExplicitHeight = 315
  PixelsPerInch = 96
  TextHeight = 13
  inherited botao_pesquisa: TSpeedButton
    Top = -44
    ExplicitTop = -44
  end
  inherited Edit1: TEdit
    Top = -39
    ExplicitTop = -39
  end
  object pn_codigo: TPanel [2]
    Left = 0
    Top = 0
    Width = 517
    Height = 107
    Align = alTop
    TabOrder = 1
    object bt_pesquisa: TSpeedButton
      Left = 100
      Top = -41
      Width = 28
      Height = 22
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
      Visible = False
    end
    object bt_pesq_cliente: TSpeedButton
      Left = 88
      Top = 22
      Width = 22
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
      OnClick = botao_pesquisaClick
    end
    object Label2: TLabel
      Left = 3
      Top = 8
      Width = 73
      Height = 13
      Caption = 'C'#243'd. cliente:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label5: TLabel
      Left = 198
      Top = 53
      Width = 21
      Height = 13
      Caption = 'De:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label6: TLabel
      Left = 294
      Top = 55
      Width = 23
      Height = 13
      Caption = 'at'#233':'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object ed_codigo: TMaskEdit
      Left = 3
      Top = -41
      Width = 94
      Height = 24
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      Text = ''
      Visible = False
      OnKeyDown = Edit1KeyDown
    end
    object Panel3: TPanel
      Left = 110
      Top = 2
      Width = 331
      Height = 45
      BevelOuter = bvNone
      Enabled = False
      TabOrder = 6
      object Label3: TLabel
        Left = 5
        Top = 6
        Width = 85
        Height = 13
        Caption = 'Nome Fantasia'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label4: TLabel
        Left = 360
        Top = 8
        Width = 32
        Height = 13
        Caption = 'Label3'
      end
      object ed_desc_cliente: TEdit
        Left = 4
        Top = 20
        Width = 317
        Height = 24
        Color = clBlack
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clYellow
        Font.Height = -15
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
      end
    end
    object ed_cod_cliente: TEdit
      Left = 4
      Top = 22
      Width = 81
      Height = 24
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      OnEnter = Edit1Enter
      OnExit = Edit1Exit
      OnKeyDown = Edit1KeyDown
    end
    object rdgFiltroDatas: TRadioGroup
      Left = 8
      Top = 50
      Width = 177
      Height = 54
      Caption = 'Filtro de data:'
      Columns = 2
      ItemIndex = 0
      Items.Strings = (
        'Faturamento'
        'Vencimento')
      TabOrder = 2
    end
    object ed_data_inicial: TMaskEdit
      Left = 196
      Top = 68
      Width = 90
      Height = 24
      EditMask = '99/99/9999'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      MaxLength = 10
      ParentFont = False
      TabOrder = 3
      Text = '  /  /    '
      OnKeyDown = Edit1KeyDown
    end
    object ed_data_final: TMaskEdit
      Left = 293
      Top = 69
      Width = 90
      Height = 24
      EditMask = '99/99/9999'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      MaxLength = 10
      ParentFont = False
      TabOrder = 4
      Text = '  /  /    '
      OnKeyDown = Edit1KeyDown
    end
    object btExibirFaturas: TBitBtn
      Left = 389
      Top = 56
      Width = 123
      Height = 41
      Caption = 'Exibir faturas'
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
        55555555FFFFFFFF5555555000000005555555577777777FF555550999999900
        55555575555555775F55509999999901055557F55555557F75F5001111111101
        105577FFFFFFFF7FF75F00000000000011057777777777775F755070FFFFFF0F
        01105777F555557F75F75500FFFFFF0FF0105577F555FF7F57575550FF700008
        8F0055575FF7777555775555000888888F005555777FFFFFFF77555550000000
        0F055555577777777F7F555550FFFFFF0F05555557F5FFF57F7F555550F000FF
        0005555557F777557775555550FFFFFF0555555557F555FF7F55555550FF7000
        05555555575FF777755555555500055555555555557775555555}
      Layout = blGlyphTop
      NumGlyphs = 2
      TabOrder = 5
      OnClick = btExibirFaturasClick
    end
  end
  object Panel2: TPanel [3]
    Left = 0
    Top = 107
    Width = 517
    Height = 169
    Align = alClient
    TabOrder = 2
    object DBGrid: TDBGrid
      Left = 9
      Top = 23
      Width = 344
      Height = 135
      DataSource = dm.dsQryConsultaFaturas
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnCellClick = DBGridCellClick
      OnColEnter = DBGridColEnter
      OnColExit = DBGridColExit
      OnDrawColumnCell = DBGridDrawColumnCell
      Columns = <
        item
          Expanded = False
          FieldName = 'SELECAO'
          Title.Caption = '  '
          Width = 22
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'COD_FATURA'
          Title.Caption = 'C'#243'digo'
          Width = 51
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DATA_FATURA'
          Title.Caption = 'Data'
          Width = 77
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DATA_VENCIMENTO'
          Title.Caption = 'Vencimento'
          Width = 74
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'VALOR_FATURA'
          Title.Caption = 'Valor'
          Width = 65
          Visible = True
        end>
    end
    object ckbSelecionarTodas: TCheckBox
      Left = 11
      Top = 4
      Width = 118
      Height = 17
      Caption = 'Selecionar todas'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      OnClick = ckbSelecionarTodasClick
    end
    object BitBtn2: TBitBtn
      Left = 364
      Top = 120
      Width = 149
      Height = 40
      Caption = 'Baixar'
      Glyph.Data = {
        F2010000424DF201000000000000760000002800000024000000130000000100
        0400000000007C01000000000000000000001000000000000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333334433333
        3333333333377F3333333333000033334224333333333333337337F333333333
        0000333422224333333333333733337F33333333000033422222243333333333
        73333337F3333333000034222A22224333333337F33F33337F33333300003222
        A2A2224333333337F373F3337F33333300003A2A222A222433333337F7333F33
        37F33333000034A22222A22243333337733333F3337F333300004222A2222A22
        2433337F337F333F3337F3330000222A3A2224A22243337F3737F337F3337F33
        0000A2A333A2224A2224337F73337F337F3337F300003A33333A2224A2224337
        333337F337F3337F000033333333A2224A2243333333337F337F337F00003333
        33333A2224A2233333333337F337F73300003333333333A2224A333333333333
        7F337F33000033333333333A222433333333333337F337F30000333333333333
        A224333333333333337F37F300003333333333333A223333333333333337F7F3
        000033333333333333A3333333333333333373330000}
      NumGlyphs = 2
      TabOrder = 2
    end
    object Panel1: TPanel
      Left = 355
      Top = 8
      Width = 153
      Height = 108
      BevelOuter = bvNone
      Enabled = False
      TabOrder = 3
      object Label9: TLabel
        Left = 10
        Top = 8
        Width = 87
        Height = 13
        Caption = 'Saldo devedor:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label1: TLabel
        Left = 11
        Top = 60
        Width = 106
        Height = 13
        Caption = 'Total selecionado:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object edTotalDebito: TCurrencyEdit
        Left = 10
        Top = 20
        Width = 135
        Height = 33
        AutoSize = False
        Color = clRed
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -19
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 0
      end
      object edTotalSelecionado: TCurrencyEdit
        Left = 10
        Top = 72
        Width = 135
        Height = 33
        AutoSize = False
        Color = clGray
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -19
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 1
      end
    end
  end
end
