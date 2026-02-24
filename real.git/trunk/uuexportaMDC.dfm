inherited frmExportaMDC: TfrmExportaMDC
  Left = 301
  Top = 222
  Width = 396
  Height = 169
  Caption = 'Exporta'#231#227'o de dados do  Sistema MDC'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited botao_pesquisa: TSpeedButton
    Left = 126
    Top = -26
  end
  inherited Edit1: TEdit
    Left = 0
    Top = -21
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 388
    Height = 82
    Align = alClient
    TabOrder = 1
    object SpeedButton1: TSpeedButton
      Left = 301
      Top = 38
      Width = 23
      Height = 22
    end
    object Label1: TLabel
      Left = 8
      Top = 24
      Width = 187
      Height = 13
      Caption = 'Caminho do arquivo de conex'#227'o:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object edCaminho: TEdit
      Left = 8
      Top = 40
      Width = 289
      Height = 21
      TabOrder = 0
      Text = 'c:\restaurante\exportaMDC.udl'
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 82
    Width = 388
    Height = 60
    Align = alBottom
    TabOrder = 2
    object BitBtn1: TBitBtn
      Left = 0
      Top = 2
      Width = 193
      Height = 57
      Caption = 'BitBtn1'
      TabOrder = 0
      OnClick = BitBtn1Click
    end
    object BitBtn2: TBitBtn
      Left = 195
      Top = 2
      Width = 193
      Height = 57
      Caption = 'BitBtn1'
      TabOrder = 1
    end
  end
  object cn: TADOConnection
    ConnectionString = 'FILE NAME=c:\Restaurante\exportaMDC.udl'
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 280
  end
  object OpenDialog1: TOpenDialog
    Left = 248
  end
  object qry: TADOQuery
    Connection = cn
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from item')
    Left = 312
  end
end
