inherited frmRelTaxaServico: TfrmRelTaxaServico
  Width = 485
  Height = 204
  Caption = 'Relat'#243'rio de Taxa de Servi'#231'o'
  PixelsPerInch = 96
  TextHeight = 13
  inherited frm_modelo_rel_datas: TPanel
    Top = 49
    Width = 477
    Height = 128
    inherited RadioGroup1: TRadioGroup
      Top = -2
      Height = 82
    end
    inherited Panel2: TPanel
      Top = 82
      Width = 475
      Height = 45
      inherited bt_imprimir: TBitBtn
        Width = 236
        Height = 42
        OnClick = bt_imprimirClick
      end
      inherited bt_sair: TBitBtn
        Left = 238
        Width = 236
        Height = 42
      end
    end
    object rdpAgrupamento: TRadioGroup
      Left = 312
      Top = -1
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
  object Panel1: TPanel
    Tag = 99
    Left = 0
    Top = 0
    Width = 477
    Height = 49
    Align = alTop
    Color = clBlack
    TabOrder = 2
    object Label3: TLabel
      Left = 120
      Top = 8
      Width = 231
      Height = 20
      Caption = 'Relat'#243'rio de Taxa de Servi'#231'o'
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
