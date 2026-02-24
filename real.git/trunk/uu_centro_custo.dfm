object frm_centros_custo: Tfrm_centros_custo
  Left = 192
  Top = 107
  Caption = 'Centros de custos'
  ClientHeight = 86
  ClientWidth = 395
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Panel12: TPanel
    Left = 0
    Top = 59
    Width = 395
    Height = 27
    Align = alBottom
    BevelWidth = 2
    TabOrder = 0
    object bt_excluir: TBitBtn
      Left = 133
      Top = 2
      Width = 64
      Height = 22
      Caption = 'Excluir'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      OnClick = bt_excluirClick
      OnExit = ed_cod_ccExit
      OnKeyDown = bt_novoKeyDown
    end
    object bt_alterar: TBitBtn
      Left = 68
      Top = 2
      Width = 64
      Height = 22
      Caption = 'Alterar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      OnClick = bt_alterarClick
      OnExit = ed_cod_ccExit
      OnKeyDown = bt_novoKeyDown
    end
    object bt_novo: TBitBtn
      Left = 3
      Top = 2
      Width = 64
      Height = 22
      Caption = 'Novo'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      OnClick = bt_novoClick
      OnExit = ed_cod_ccExit
      OnKeyDown = bt_novoKeyDown
    end
    object bt_gravar: TBitBtn
      Left = 198
      Top = 2
      Width = 64
      Height = 22
      Caption = 'Gravar'
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
      OnClick = bt_gravarClick
      OnExit = ed_cod_ccExit
      OnKeyDown = bt_novoKeyDown
    end
    object bt_cancelar: TBitBtn
      Left = 263
      Top = 2
      Width = 64
      Height = 23
      Caption = 'Cancelar'
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 4
      OnClick = bt_cancelarClick
      OnExit = ed_cod_ccExit
      OnKeyDown = bt_novoKeyDown
    end
    object bt_sair: TBitBtn
      Left = 328
      Top = 2
      Width = 64
      Height = 22
      Caption = 'Sair'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 5
      OnClick = bt_sairClick
      OnExit = ed_cod_ccExit
      OnKeyDown = bt_novoKeyDown
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 395
    Height = 5
    Align = alTop
    BevelWidth = 2
    TabOrder = 1
  end
  object painel: TPanel
    Left = 0
    Top = 5
    Width = 395
    Height = 53
    Align = alTop
    BevelWidth = 2
    Enabled = False
    TabOrder = 2
    object Label1: TLabel
      Left = 24
      Top = 8
      Width = 44
      Height = 13
      Caption = 'C'#243'digo:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label14: TLabel
      Left = 113
      Top = 8
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
    object bt_pesq_cc: TSpeedButton
      Left = 77
      Top = 21
      Width = 25
      Height = 22
      Enabled = False
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
      OnClick = bt_pesq_ccClick
    end
    object ed_cod_cc: TEdit
      Left = 23
      Top = 22
      Width = 50
      Height = 21
      CharCase = ecUpperCase
      Enabled = False
      TabOrder = 0
      OnExit = ed_cod_ccExit
      OnKeyDown = ed_cod_ccKeyDown
    end
    object ed_desc_cc: TEdit
      Left = 112
      Top = 22
      Width = 153
      Height = 21
      CharCase = ecUpperCase
      MaxLength = 20
      TabOrder = 1
      OnExit = ed_cod_ccExit
      OnKeyDown = ed_cod_ccKeyDown
    end
  end
end
