object frm_cs_grupos_: Tfrm_cs_grupos_
  Left = 480
  Top = 268
  Width = 524
  Height = 231
  BorderIcons = []
  Caption = 'Consulta de Grupos de Estoque'
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
    Top = 166
    Width = 516
    Height = 38
    Align = alBottom
    BevelWidth = 2
    TabOrder = 0
    object bt_selecionar: TBitBtn
      Left = 0
      Top = 2
      Width = 257
      Height = 34
      Caption = 'Selecionar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      OnClick = bt_selecionarClick
      OnEnter = ed_descricaoEnter
      OnExit = ed_descricaoExit
    end
    object bt_sair: TBitBtn
      Left = 258
      Top = 2
      Width = 257
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
      OnEnter = ed_descricaoEnter
      OnExit = ed_descricaoExit
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 0
    Width = 516
    Height = 7
    Align = alTop
    BevelWidth = 2
    TabOrder = 1
  end
  object Panel4: TPanel
    Left = 0
    Top = 7
    Width = 516
    Height = 41
    Align = alTop
    BevelWidth = 2
    TabOrder = 2
    object Label3: TLabel
      Left = 6
      Top = 1
      Width = 154
      Height = 13
      Caption = 'Digite as iniciais do Grupo:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object ed_descricao: Tedit
      Left = 6
      Top = 15
      Width = 249
      Height = 21
      CharCase = ecUpperCase
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      MaxLength = 30
      ParentFont = False
      TabOrder = 0
      OnChange = ed_descricaoChange
      OnEnter = ed_descricaoEnter
      OnExit = ed_descricaoExit
      OnKeyDown = ed_descricaoKeyDown
      NormalColor = clWindow
      FocusColor = clYellow
    end
  end
  object Panel5: TPanel
    Left = 0
    Top = 48
    Width = 516
    Height = 118
    Align = alClient
    TabOrder = 3
    object DBGrid1: TDBGrid
      Left = 6
      Top = 8
      Width = 505
      Height = 104
      DataSource = dm.ds_qry_consultas
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = [fsBold]
      OnEnter = ed_descricaoEnter
      OnExit = ed_descricaoExit
      OnKeyDown = ed_descricaoKeyDown
    end
  end
end
