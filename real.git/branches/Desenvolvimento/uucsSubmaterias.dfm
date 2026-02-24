inherited frmCsSubMaterias: TfrmCsSubMaterias
  Left = 35
  Top = 91
  Width = 999
  Height = 533
  Caption = 'Consulta de Submat'#233'rias-primas'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel3: TPanel
    Width = 991
    Height = 66
    inherited Label1: TLabel
      Left = 4
      Top = 12
      Width = 200
      Height = 20
      Caption = 'Digite as iniciais do '#237'tem:'
      Font.Height = -16
    end
    inherited ed_parametro: TEdit
      Top = 33
      Width = 326
      Height = 28
      Font.Height = -16
      ParentFont = False
    end
    inherited RadioGroup1: TRadioGroup
      Left = 27
      Top = -40
    end
  end
  inherited Panel1: TPanel
    Top = 66
    Width = 991
    Height = 387
    inherited DBGrid1: TDBGrid
      Top = 8
      Width = 981
      Height = 376
      Font.Height = -16
      Columns = <
        item
          Expanded = False
          FieldName = 'COD_PRODUTO'
          Title.Caption = 'C'#243'digo'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -16
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Width = 74
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DESCRICAO'
          Title.Caption = 'Descri'#231#227'o'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -16
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Width = 428
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ESTOQUE'
          Title.Caption = 'Estoque'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -16
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Width = 109
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DESC_UNIDADE'
          Title.Caption = 'Unidade'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -16
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Width = 161
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DESC_GRUPO'
          Title.Caption = 'Grupo'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -16
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Width = 166
          Visible = True
        end>
    end
  end
  inherited Panel2: TPanel
    Top = 453
    Width = 991
    Height = 53
    inherited bt_selecionar: TBitBtn
      Top = 2
      Width = 491
      Height = 49
    end
    inherited bt_cancelar: TBitBtn
      Left = 494
      Top = 3
      Width = 491
      Height = 48
    end
  end
end
