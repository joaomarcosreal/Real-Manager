object frm_cs_c_custo: Tfrm_cs_c_custo
  Left = 156
  Top = 118
  Caption = 'Consulta de Centros de custo'
  ClientHeight = 181
  ClientWidth = 327
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OnActivate = FormActivate
  TextHeight = 13
  object Panel2: TPanel
    Left = 0
    Top = 143
    Width = 327
    Height = 38
    Align = alBottom
    BevelWidth = 2
    TabOrder = 0
    object bt_selecionar: TBitBtn
      Left = 3
      Top = 3
      Width = 174
      Height = 34
      Caption = 'Selecionar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      OnClick = bt_selecionarClick
    end
    object bt_sair: TBitBtn
      Left = 177
      Top = 2
      Width = 160
      Height = 34
      Caption = 'Sair'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      OnClick = bt_sairClick
    end
  end
  object Panel4: TPanel
    Left = 0
    Top = 0
    Width = 327
    Height = 41
    Align = alTop
    BevelWidth = 2
    TabOrder = 1
    object Label3: TLabel
      Left = 16
      Top = 1
      Width = 98
      Height = 13
      Caption = 'Digite as iniciais:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object ed_descricao: TEdit
      Left = 16
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
    end
  end
  object Panel5: TPanel
    Left = 0
    Top = 41
    Width = 327
    Height = 102
    Align = alClient
    TabOrder = 2
    object DBGrid1: TDBGrid
      Left = 8
      Top = 8
      Width = 326
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
