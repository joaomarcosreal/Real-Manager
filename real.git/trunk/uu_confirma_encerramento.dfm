object frm_confirma_encerramento: Tfrm_confirma_encerramento
  Left = 192
  Top = 107
  Width = 513
  Height = 302
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  OnKeyPress = FormKeyPress
  PixelsPerInch = 96
  TextHeight = 13
  object Memo1: TMemo
    Left = 0
    Top = 80
    Width = 505
    Height = 145
    Color = clRed
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    Lines.Strings = (
      'N'#195'O EXISTE MOVIMENTO NO DIA CORRRENTE. '
      'POSSIVELMENTE ENCERRAMENTO DO DIA J'#193' FOI'
      'EFETUADO.'
      ''
      ' DESEJA PROSSEGUIR MESMO ASSIM ?')
    ParentFont = False
    ReadOnly = True
    TabOrder = 0
    OnKeyDown = IAeverButton1KeyDown
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 505
    Height = 76
    Align = alTop
    Color = clBlack
    TabOrder = 1
    object Label1: TLabel
      Left = 184
      Top = 24
      Width = 124
      Height = 29
      Caption = 'ATEN'#199#195'O'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clYellow
      Font.Height = -24
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 228
    Width = 505
    Height = 47
    Align = alBottom
    BevelWidth = 2
    TabOrder = 2
    object IAeverButton1: TBitBtn
      Left = -5
      Top = 3
      Width = 253
      Height = 41
      Caption = 'SIM'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      OnClick = IAeverButton1Click
      OnKeyDown = IAeverButton1KeyDown
    end
    object IAeverButton2: TBitBtn
      Left = 248
      Top = 4
      Width = 253
      Height = 41
      Caption = 'N'#195'O'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      OnClick = IAeverButton2Click
    end
  end
  object Timer1: TTimer
    Enabled = False
    Interval = 500
    OnTimer = Timer1Timer
    Left = 384
    Top = 152
  end
  object Timer2: TTimer
    Enabled = False
    Interval = 500
    OnTimer = Timer2Timer
    Left = 416
    Top = 104
  end
  object Timer3: TTimer
    Enabled = False
    Interval = 100
    Left = 184
    Top = 96
  end
end
