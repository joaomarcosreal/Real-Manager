inherited frmCsGeneroItemSPED: TfrmCsGeneroItemSPED
  Left = 243
  Top = 62
  Margins.Left = 0
  Margins.Top = 0
  Margins.Right = 0
  Margins.Bottom = 0
  BorderIcons = []
  Caption = 'Consulta de G'#234'nero de '#237'tens'
  ClientHeight = 612
  ClientWidth = 528
  ExplicitWidth = 540
  ExplicitHeight = 650
  TextHeight = 13
  inherited Panel3: TPanel
    Top = 34
    Width = 528
    Height = 46
    ExplicitTop = 24
    ExplicitWidth = 558
    ExplicitHeight = 46
    inherited Label1: TLabel
      Top = 6
      Width = 204
      Caption = 'Digite as iniciais do g'#234'nero do sped'
      StyleElements = []
      ExplicitTop = 6
      ExplicitWidth = 204
    end
    inherited ed_parametro: TEdit
      Top = 19
      Width = 553
      ExplicitTop = 19
      ExplicitWidth = 553
    end
    inherited RadioGroup1: TRadioGroup
      Top = -35
      Visible = False
      ExplicitTop = -35
    end
  end
  inherited Panel1: TPanel
    Top = 80
    Width = 528
    Height = 474
    ExplicitTop = 80
    ExplicitWidth = 556
    ExplicitHeight = 399
    inherited DBGrid1: TDBGrid
      Width = 528
      Height = 474
      TitleFont.Height = -16
      TitleFont.Style = []
      OnEnter = nil
      OnExit = nil
      Columns = <
        item
          Expanded = False
          FieldName = 'CODigo'
          Title.Caption = 'C'#243'digo'
          Width = 47
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DESCRICAO'
          Title.Caption = 'Descri'#231#227'o'
          Width = 446
          Visible = True
        end>
    end
  end
  inherited Panel2: TPanel
    Top = 554
    Width = 528
    Height = 58
    ExplicitTop = 494
    ExplicitWidth = 556
    ExplicitHeight = 58
    inherited bt_cancelar: TAdvGlassButton
      Left = 386
      Top = 6
      OnClick = nil
      ExplicitLeft = 386
      ExplicitTop = 6
    end
    inherited bt_selecionar: TAdvGlassButton
      Left = 238
      Top = 6
      OnClick = nil
      ExplicitLeft = 238
      ExplicitTop = 6
    end
  end
  object pnTitulo: TPanel
    Tag = 99
    Left = 0
    Top = 0
    Width = 528
    Height = 34
    Margins.Left = 0
    Margins.Top = 0
    Margins.Right = 0
    Margins.Bottom = 0
    Align = alTop
    BevelOuter = bvNone
    Color = 12615680
    ParentBackground = False
    TabOrder = 3
    StyleElements = []
    ExplicitLeft = -5
    ExplicitTop = -18
    ExplicitWidth = 558
    object lbTitulo: TLabel
      Left = 3
      Top = 0
      Width = 392
      Height = 34
      AutoSize = False
      Caption = 'G'#234'neros de '#237'tens - Sped Fiscal'
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
