object frm_listagem_produtos: Tfrm_listagem_produtos
  Left = 188
  Top = 107
  Width = 423
  Height = 168
  Caption = 'Listagem de produtos'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel2: TPanel
    Left = 0
    Top = 104
    Width = 415
    Height = 37
    Align = alBottom
    TabOrder = 0
    object bt_imprimir: TBitBtn
      Left = 0
      Top = 2
      Width = 209
      Height = 34
      Caption = 'Imprimir '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      OnClick = bt_imprimirClick
    end
    object bt_sair: TBitBtn
      Left = 211
      Top = 3
      Width = 202
      Height = 34
      Caption = 'Sair'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      OnClick = bt_sairClick
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 0
    Width = 415
    Height = 5
    Align = alTop
    TabOrder = 1
  end
  object Panel4: TPanel
    Left = 0
    Top = 5
    Width = 415
    Height = 99
    Align = alClient
    TabOrder = 2
    object lb: TLabel
      Left = 219
      Top = 17
      Width = 58
      Height = 13
      Caption = 'Cd. Grupo'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object bt_pesq_grupo: TSpeedButton
      Left = 261
      Top = 30
      Width = 23
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
      OnClick = bt_pesq_grupoClick
    end
    object Label14: TLabel
      Left = 289
      Top = 17
      Width = 89
      Height = 13
      Caption = 'Nome do Grupo'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object RadioGroup1: TRadioGroup
      Left = 16
      Top = 21
      Width = 193
      Height = 60
      Caption = 'Tipo do Relat'#243'rio'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Verdana'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
    end
    object cb_tipo_relatorio: TComboBox
      Left = 32
      Top = 44
      Width = 170
      Height = 21
      Color = clWhite
      DropDownCount = 10
      ItemHeight = 13
      ItemIndex = 0
      TabOrder = 1
      Text = 'Todos os Grupos'
      OnEnter = cb_tipo_relatorioEnter
      OnExit = cb_tipo_relatorioExit
      OnKeyDown = cb_tipo_relatorioKeyDown
      Items.Strings = (
        'Todos os Grupos'
        'Apenas grupo selecionado')
    end
    object ed_cod_grupo: TFocusEdit
      Left = 220
      Top = 31
      Width = 37
      Height = 21
      CharCase = ecUpperCase
      TabOrder = 2
      OnEnter = cb_tipo_relatorioEnter
      OnExit = cb_tipo_relatorioExit
      OnKeyDown = cb_tipo_relatorioKeyDown
      NormalColor = clWindow
      FocusColor = clYellow
    end
    object ed_desc_grupo: TFocusEdit
      Left = 288
      Top = 31
      Width = 113
      Height = 21
      CharCase = ecUpperCase
      Enabled = False
      TabOrder = 3
      OnEnter = cb_tipo_relatorioEnter
      OnExit = cb_tipo_relatorioEnter
      OnKeyDown = cb_tipo_relatorioKeyDown
      NormalColor = clWindow
      FocusColor = clYellow
    end
    object cbk_visualizar: TCheckBox
      Left = 221
      Top = 74
      Width = 153
      Height = 17
      Caption = 'Visualizar Relat'#243'rio'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 5
      OnEnter = cb_tipo_relatorioEnter
      OnExit = cb_tipo_relatorioExit
      OnKeyDown = cb_tipo_relatorioKeyDown
    end
    object ckb_ficha_tec: TCheckBox
      Left = 221
      Top = 58
      Width = 153
      Height = 17
      Caption = 'Imprimir ficha t'#233'cnica'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 4
      OnEnter = cb_tipo_relatorioEnter
      OnExit = cb_tipo_relatorioExit
      OnKeyDown = cb_tipo_relatorioKeyDown
    end
  end
  object rdp: TRDprint
    ImpressoraPersonalizada.NomeImpressora = 'Modelo Personalizado - (Epson)'
    ImpressoraPersonalizada.AvancaOitavos = '27 48'
    ImpressoraPersonalizada.AvancaSextos = '27 50'
    ImpressoraPersonalizada.SaltoPagina = '12'
    ImpressoraPersonalizada.TamanhoPagina = '27 67 66'
    ImpressoraPersonalizada.Negrito = '27 69'
    ImpressoraPersonalizada.Italico = '27 52'
    ImpressoraPersonalizada.Sublinhado = '27 45 49'
    ImpressoraPersonalizada.Expandido = '27 14'
    ImpressoraPersonalizada.Normal10 = '18 27 80'
    ImpressoraPersonalizada.Comprimir12 = '18 27 77'
    ImpressoraPersonalizada.Comprimir17 = '27 80 27 15'
    ImpressoraPersonalizada.Comprimir20 = '27 77 27 15'
    ImpressoraPersonalizada.Reset = '27 80 18 20 27 53 27 70 27 45 48'
    ImpressoraPersonalizada.Inicializar = '27 64'
    OpcoesPreview.PaginaZebrada = True
    OpcoesPreview.Remalina = False
    OpcoesPreview.CaptionPreview = 'Rdprint Preview'
    OpcoesPreview.PreviewZoom = 100
    OpcoesPreview.CorPapelPreview = clWhite
    OpcoesPreview.CorLetraPreview = clBlack
    OpcoesPreview.Preview = True
    OpcoesPreview.BotaoSetup = Ativo
    OpcoesPreview.BotaoImprimir = Ativo
    OpcoesPreview.BotaoGravar = Ativo
    OpcoesPreview.BotaoLer = Ativo
    Autor = Deltress
    About = 'RDprint 3.0h - Registrado'
    Acentuacao = Transliterate
    CaptionSetup = 'Rdprint Setup'
    UsaGerenciadorImpr = True
    CorForm = clBtnFace
    CorFonte = clBlack
    Impressora = Grafico
    PortaComunicacao = 'LPT1'
    TestarPorta = True
    TamanhoQteLinhas = 66
    TamanhoQteColunas = 90
    TamanhoQteLPP = Seis
    NumeroPaginaInicial = 1
    PaginaInicial = 1
    PaginaFinal = 9999
    NumerodeCopias = 1
    FonteTamanhoPadrao = S17cpp
    FonteEstiloPadrao = []
    Orientacao = poPortrait
    Left = 352
    Top = 32
  end
end
