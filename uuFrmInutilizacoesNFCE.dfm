inherited frmInutilizacoesNFCE: TfrmInutilizacoesNFCE
  Left = 352
  Top = 182
  BorderIcons = []
  Caption = 'frmInutilizacoesNFCE'
  ClientWidth = 391
  ExplicitWidth = 407
  PixelsPerInch = 96
  TextHeight = 13
  inherited botao_pesquisa: TSpeedButton
    Left = -18
    Top = -11
    ExplicitLeft = -18
    ExplicitTop = -11
  end
  inherited Edit1: TEdit
    Left = -144
    Top = -8
    ExplicitLeft = -144
    ExplicitTop = -8
  end
  object pnInutlizacoes: TPanel [2]
    Left = 0
    Top = 0
    Width = 391
    Height = 187
    Align = alClient
    BevelInner = bvSpace
    BevelWidth = 2
    BorderStyle = bsSingle
    TabOrder = 1
    Visible = False
    object lbpnInutilizacoes: TLabel
      Left = 34
      Top = 84
      Width = 263
      Height = 13
      Caption = 'O sistema est'#225' processando as inutiliza'#231#245'es...'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lbQtdInut: TLabel
      Left = 18
      Top = 58
      Width = 3
      Height = 13
    end
    object Panel4: TPanel
      Tag = 99
      Left = 4
      Top = 4
      Width = 379
      Height = 40
      Align = alTop
      Caption = 'Panel4'
      Color = clBlack
      TabOrder = 0
      object Label1: TLabel
        Left = 128
        Top = 16
        Width = 99
        Height = 24
        Caption = 'Aguarde...'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clYellow
        Font.Height = -19
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
    end
    object pgInutilizacoes: TProgressBar
      Left = 32
      Top = 104
      Width = 305
      Height = 41
      TabOrder = 1
    end
  end
end
