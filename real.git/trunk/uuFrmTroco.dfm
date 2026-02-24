inherited frmPainelTroco: TfrmPainelTroco
  Left = 180
  Top = 204
  BorderIcons = [biHelp]
  BorderStyle = bsNone
  Caption = 'Troco a repassar'
  ClientHeight = 308
  ClientWidth = 659
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited botao_pesquisa: TSpeedButton
    Top = -25
  end
  inherited Edit1: TEdit
    Top = -22
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 657
    Height = 177
    Enabled = False
    Font.Charset = ANSI_CHARSET
    Font.Color = clRed
    Font.Height = -21
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
    object Memo1: TMemo
      Left = 1
      Top = 1
      Width = 655
      Height = 175
      Align = alClient
      Alignment = taCenter
      BevelInner = bvNone
      BevelKind = bkFlat
      Color = clRed
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -64
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      Lines.Strings = (
        ''
        'VALOR DO TROCO')
      ParentFont = False
      TabOrder = 0
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 177
    Width = 657
    Height = 130
    Enabled = False
    Font.Charset = ANSI_CHARSET
    Font.Color = clRed
    Font.Height = -21
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 2
    object pn_troco: TPanel
      Tag = 99
      Left = 0
      Top = 0
      Width = 657
      Height = 128
      Color = clBlack
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -80
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
    end
  end
  object Timer1: TTimer
    Enabled = False
    Interval = 500
    OnTimer = Timer1Timer
    Left = 393
    Top = 46
  end
  object Timer2: TTimer
    Enabled = False
    Interval = 500
    OnTimer = Timer2Timer
    Left = 425
    Top = 44
  end
  object timerFecha: TTimer
    Enabled = False
    Interval = 3000
    OnTimer = timerFechaTimer
    Left = 96
    Top = 25
  end
end
