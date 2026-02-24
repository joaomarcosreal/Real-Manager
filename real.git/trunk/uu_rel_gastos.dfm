object frm_rel_gasto_diario: Tfrm_rel_gasto_diario
  Left = 89
  Top = 88
  Width = 307
  Height = 160
  Caption = 'Relat'#243'rio de gastos - Por per'#237'odo'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Panel4: TPanel
    Left = 0
    Top = 5
    Width = 299
    Height = 91
    Align = alClient
    TabOrder = 2
    object Panel1: TPanel
      Left = 8
      Top = 14
      Width = 289
      Height = 73
      BevelInner = bvLowered
      TabOrder = 0
      object ed_data_final: TMaskEdit
        Left = 136
        Top = 18
        Width = 120
        Height = 32
        EditMask = '99/99/9999'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        MaxLength = 10
        ParentFont = False
        TabOrder = 1
        Text = '  /  /    '
        OnEnter = ed_data_inicialEnter
        OnExit = ed_data_inicialExit
        OnKeyDown = ed_data_inicialKeyDown
      end
      object ed_data_inicial: TMaskEdit
        Left = 8
        Top = 19
        Width = 119
        Height = 32
        EditMask = '99/99/9999'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        MaxLength = 10
        ParentFont = False
        TabOrder = 0
        Text = '  /  /    '
        OnEnter = ed_data_inicialEnter
        OnExit = ed_data_inicialExit
        OnKeyDown = ed_data_inicialKeyDown
      end
      object cbk_visualizar: TCheckBox
        Left = 137
        Top = 53
        Width = 136
        Height = 15
        Caption = 'Visualizar Relat'#243'rio'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 2
        OnKeyDown = ed_data_inicialKeyDown
      end
    end
    object Panel5: TPanel
      Left = 17
      Top = 8
      Width = 112
      Height = 12
      BevelOuter = bvNone
      Caption = 'Informe o per'#237'odo'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 96
    Width = 299
    Height = 37
    Align = alBottom
    TabOrder = 0
    object bt_imprimir: TBitBtn
      Left = 0
      Top = 2
      Width = 148
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
      Left = 149
      Top = 3
      Width = 148
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
    Width = 299
    Height = 5
    Align = alTop
    TabOrder = 1
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
    OpcoesPreview.PaginaZebrada = False
    OpcoesPreview.Remalina = False
    OpcoesPreview.CaptionPreview = 'Rdprint Preview'
    OpcoesPreview.PreviewZoom = 100
    OpcoesPreview.CorPapelPreview = clWhite
    OpcoesPreview.CorLetraPreview = clBlack
    OpcoesPreview.Preview = False
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
    Impressora = Epson
    PortaComunicacao = 'LPT1'
    TestarPorta = False
    TamanhoQteLinhas = 66
    TamanhoQteColunas = 90
    TamanhoQteLPP = Seis
    NumeroPaginaInicial = 1
    PaginaInicial = 1
    PaginaFinal = 9999
    NumerodeCopias = 1
    FonteTamanhoPadrao = S12cpp
    FonteEstiloPadrao = []
    Orientacao = poPortrait
    Left = 160
  end
end
