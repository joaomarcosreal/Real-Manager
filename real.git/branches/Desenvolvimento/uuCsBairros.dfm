inherited frmCsBairros: TfrmCsBairros
  Left = 399
  Top = 155
  Width = 497
  Height = 370
  Caption = 'Consulta de Bairros'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel3: TPanel
    Width = 489
    Height = 49
    inherited Label1: TLabel
      Top = 3
      Width = 152
      Caption = 'Digite as iniciais do bairro:'
    end
    inherited ed_parametro: TEdit
      Top = 16
      Width = 483
      Height = 28
      Font.Height = -16
      ParentFont = False
    end
    inherited RadioGroup1: TRadioGroup
      Left = -5
      Top = -52
      Visible = False
    end
  end
  inherited Panel1: TPanel
    Top = 49
    Width = 489
    Height = 242
    inherited DBGrid1: TDBGrid
      Width = 480
      Height = 235
      Font.Height = -16
      OnDrawColumnCell = DBGrid1DrawColumnCell
      Columns = <
        item
          Expanded = False
          FieldName = 'CODIGO'
          Title.Caption = 'C'#243'd.'
          Width = 39
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DESCRICAO'
          Title.Caption = 'Nome do Bairro'
          Width = 279
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'TXENTREGA'
          Title.Caption = 'Tx. Ent.'
          Width = 120
          Visible = True
        end>
    end
  end
  inherited Panel2: TPanel
    Top = 291
    Width = 489
    Height = 52
    inherited bt_selecionar: TBitBtn
      Top = 2
      Width = 244
      Height = 48
      Font.Height = -16
      ParentFont = False
    end
    inherited bt_cancelar: TBitBtn
      Left = 246
      Top = 3
      Width = 244
      Height = 48
      Font.Height = -16
      ParentFont = False
    end
  end
end
