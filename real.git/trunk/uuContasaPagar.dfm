inherited frmContasaPagar: TfrmContasaPagar
  Left = 347
  Top = 233
  Caption = 'Contas '#224' Pagar - Lan'#231'amento'
  ClientHeight = 330
  PixelsPerInch = 96
  TextHeight = 13
  inherited pn_principal: TPanel
    Top = 56
    Height = 232
    inherited pn_codigo: TPanel
      Width = 116
      Height = 39
      Align = alNone
      inherited bt_pesquisa: TSpeedButton
        Left = 87
        Top = 13
        Width = 25
        Height = 20
      end
      object Label2: TLabel [1]
        Left = 2
        Top = 0
        Width = 40
        Height = 13
        Caption = 'C'#243'digo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      inherited ed_codigo: TMaskEdit
        Top = 13
        Width = 81
      end
    end
  end
  inherited pn_botoes: TPanel
    Top = 288
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 595
    Height = 56
    Align = alTop
    Color = clBlack
    TabOrder = 2
    object Label46: TLabel
      Left = 211
      Top = 6
      Width = 172
      Height = 23
      Caption = 'CONTAS '#192' PAGAR'
      Font.Charset = ANSI_CHARSET
      Font.Color = clLime
      Font.Height = -19
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
    end
    object Label1: TLabel
      Left = 195
      Top = 30
      Width = 198
      Height = 18
      Caption = 'Lan'#231'amento de contas'
      Font.Charset = ANSI_CHARSET
      Font.Color = clYellow
      Font.Height = -16
      Font.Name = 'Verdana'
      Font.Style = [fsBold]
      ParentFont = False
    end
  end
end
