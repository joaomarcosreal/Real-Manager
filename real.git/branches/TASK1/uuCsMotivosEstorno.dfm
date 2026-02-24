inherited frmCsMotivosEstorno: TfrmCsMotivosEstorno
  Left = 459
  Top = 317
  Width = 335
  Height = 301
  Caption = 'Consulta de Motivos de Estorno'
  OldCreateOrder = True
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel3: TPanel
    Width = 327
    Height = 2
    Visible = False
    inherited Label1: TLabel
      Top = 10
    end
    inherited ed_parametro: TEdit
      Top = 23
      Visible = False
    end
    inherited RadioGroup1: TRadioGroup
      Top = -41
    end
  end
  inherited Panel1: TPanel
    Top = 2
    Width = 327
    Height = 234
    inherited DBGrid1: TDBGrid
      Width = 317
      Height = 225
      Columns = <
        item
          Expanded = False
          FieldName = 'CODIGO'
          Title.Caption = 'C'#243'digo'
          Width = 50
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DESCRICAO'
          Title.Caption = 'Descricao'
          Width = 250
          Visible = True
        end>
    end
  end
  inherited Panel2: TPanel
    Top = 236
    Width = 327
    inherited bt_selecionar: TBitBtn
      Width = 160
    end
    inherited bt_cancelar: TBitBtn
      Left = 164
      Width = 160
    end
  end
end
