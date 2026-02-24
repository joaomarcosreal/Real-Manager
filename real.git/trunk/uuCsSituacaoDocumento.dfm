inherited frmCsSituacaoDocumento: TfrmCsSituacaoDocumento
  Left = 496
  Top = 232
  Width = 643
  Height = 429
  Caption = 'Consuta Situa'#231#227'o do documento fiscal'
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel3: TPanel
    Tag = 99
    Width = 635
    Height = 41
    Color = clBlack
    inherited Label1: TLabel
      Top = -43
      Visible = False
    end
    object Label2: TLabel [1]
      Left = 152
      Top = 8
      Width = 313
      Height = 29
      Caption = 'Situa'#231#227'o do documento'
      Font.Charset = ANSI_CHARSET
      Font.Color = clYellow
      Font.Height = -24
      Font.Name = 'Verdana'
      Font.Style = [fsBold]
      ParentFont = False
    end
    inherited ed_parametro: TEdit
      Top = -30
      Visible = False
    end
    inherited RadioGroup1: TRadioGroup
      Top = -79
      Visible = False
    end
  end
  inherited Panel1: TPanel
    Top = 41
    Width = 635
    Height = 310
    inherited DBGrid1: TDBGrid
      Left = 11
      Width = 622
      Height = 301
      Font.Height = -16
      OnDrawColumnCell = DBGrid1DrawColumnCell
      Columns = <
        item
          Expanded = False
          FieldName = 'COD_SITUACAO'
          Title.Caption = 'C'#243'digo'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -16
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Width = 58
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
          Width = 521
          Visible = True
        end>
    end
  end
  inherited Panel2: TPanel
    Top = 351
    Width = 635
    Height = 51
    inherited bt_selecionar: TBitBtn
      Top = 1
      Width = 316
      Height = 48
    end
    inherited bt_cancelar: TBitBtn
      Left = 318
      Top = 2
      Width = 313
      Height = 47
    end
  end
end
