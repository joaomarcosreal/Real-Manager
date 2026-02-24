inherited frmRelProducaoGarconsSintetico: TfrmRelProducaoGarconsSintetico
  Caption = 'Produ'#231#227'o de Gar'#231'ons - Sint'#233'tico'
  PixelsPerInch = 96
  TextHeight = 13
  inherited frm_modelo_rel_datas: TPanel
    Top = 49
    Height = 62
    ExplicitTop = 49
    ExplicitWidth = 318
    ExplicitHeight = 62
    inherited RadioGroup1: TRadioGroup
      Left = 5
      Caption = ''
      ExplicitLeft = 5
    end
    inherited Panel5: TPanel
      Left = 7
      ExplicitLeft = 7
    end
    inherited Panel2: TPanel
      Top = 16
      Width = 316
      Height = 45
      ExplicitTop = 16
      ExplicitWidth = 316
      ExplicitHeight = 45
      inherited bt_imprimir: TBitBtn
        Top = 3
        Width = 229
        Height = 42
        OnClick = bt_imprimirClick
        ExplicitTop = 3
        ExplicitWidth = 229
        ExplicitHeight = 42
      end
      inherited bt_sair: TBitBtn
        Left = 229
        Width = 229
        Height = 42
        ExplicitLeft = 229
        ExplicitWidth = 229
        ExplicitHeight = 42
      end
    end
    object rdpAgrupamento: TRadioGroup
      Left = 304
      Top = 8
      Width = 145
      Height = 71
      ItemIndex = 2
      Items.Strings = (
        'Agrupar por Gar'#231'om'
        'Agrupar por Data'
        'N'#227'o Agrupar')
      TabOrder = 3
    end
  end
  object Panel1: TPanel [3]
    Tag = 99
    Left = 0
    Top = 0
    Width = 318
    Height = 49
    Align = alTop
    Color = clBlack
    TabOrder = 2
    object Label3: TLabel
      Left = 144
      Top = 8
      Width = 175
      Height = 20
      Caption = 'Produ'#231#227'o de Gar'#231'ons'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clYellow
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label4: TLabel
      Left = 120
      Top = 29
      Width = 216
      Height = 13
      Caption = 'Informe o per'#237'odo que deseja analisar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clLime
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
  end
end
