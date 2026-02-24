inherited frmRelTaxaServico: TfrmRelTaxaServico
  Caption = 'Relat'#243'rio de Taxa de Servi'#231'o'
  ClientHeight = 192
  ClientWidth = 488
  ExplicitWidth = 500
  ExplicitHeight = 230
  TextHeight = 13
  inherited frm_modelo_rel_datas: TPanel
    Top = 49
    Width = 488
    Height = 143
    Color = clWhite
    ParentBackground = False
    ExplicitTop = 49
    ExplicitWidth = 484
    ExplicitHeight = 142
    inherited RadioGroup1: TRadioGroup
      Top = 2
      Height = 82
      ExplicitTop = 2
      ExplicitHeight = 82
    end
    inherited Panel2: TPanel
      Top = 97
      Width = 486
      Height = 45
      BevelOuter = bvNone
      ExplicitTop = 96
      ExplicitWidth = 482
      ExplicitHeight = 45
      inherited bt_imprimir: TBitBtn
        Top = 1
        Width = 236
        Height = 42
        OnClick = bt_imprimirClick
        ExplicitTop = 1
        ExplicitWidth = 236
        ExplicitHeight = 42
      end
      inherited bt_sair: TBitBtn
        Left = 238
        Top = 2
        Width = 236
        Height = 42
        ExplicitLeft = 238
        ExplicitTop = 2
        ExplicitWidth = 236
        ExplicitHeight = 42
      end
    end
    object rdpAgrupamento: TRadioGroup
      Left = 312
      Top = 3
      Width = 163
      Height = 81
      ItemIndex = 3
      Items.Strings = (
        'Agrupado por Gar'#231'om'
        'Agrupado por Data'
        'Acumulado di'#225'rio'
        'Rateado'
        'Auditoria de Tx. de Servi'#231'o')
      TabOrder = 3
    end
  end
  object Panel1: TPanel [3]
    Tag = 99
    Left = 0
    Top = 0
    Width = 488
    Height = 49
    Align = alTop
    BevelOuter = bvNone
    Color = 12615680
    ParentBackground = False
    TabOrder = 2
    ExplicitWidth = 484
    object Label3: TLabel
      Left = 9
      Top = 6
      Width = 261
      Height = 24
      Caption = 'Relat'#243'rio de taxa de servi'#231'o'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -19
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
  end
end
