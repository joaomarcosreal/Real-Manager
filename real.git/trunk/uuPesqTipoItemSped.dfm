inherited frmPesqTipoItemSPED: TfrmPesqTipoItemSPED
  Left = 391
  Top = 193
  Width = 353
  Height = 442
  BorderIcons = []
  Caption = 'Consulta de tipos de '#237'tens'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel3: TPanel
    Tag = 99
    Width = 345
    Height = 47
    Color = clBlack
    inherited Label1: TLabel
      Top = -50
      Visible = False
    end
    object Label2: TLabel [1]
      Left = 82
      Top = 9
      Width = 168
      Height = 29
      Caption = 'Tipos de '#237'tens'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clLime
      Font.Height = -24
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    inherited ed_parametro: TEdit
      Top = -37
      Visible = False
    end
    inherited RadioGroup1: TRadioGroup
      Top = -86
      Visible = False
    end
  end
  inherited Panel1: TPanel
    Top = 47
    Width = 345
    Height = 313
    inherited DBGrid1: TDBGrid
      Width = 334
      Height = 300
      Columns = <
        item
          Expanded = False
          FieldName = 'COD_TIPO'
          Title.Caption = 'C'#243'digo'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DESCRICAO'
          Title.Caption = 'Descri'#231#227'o'
          Visible = True
        end>
    end
  end
  inherited Panel2: TPanel
    Top = 360
    Width = 345
    Height = 55
    inherited bt_selecionar: TBitBtn
      Width = 172
      Height = 49
    end
    inherited bt_cancelar: TBitBtn
      Left = 173
      Top = 4
      Width = 172
      Height = 48
    end
  end
end
