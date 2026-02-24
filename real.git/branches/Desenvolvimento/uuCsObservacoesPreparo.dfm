inherited frmCsObservacoesPreparo: TfrmCsObservacoesPreparo
  Width = 334
  Height = 389
  Caption = 'Consulta de Observa'#231#245'es de Preparo'
  OldCreateOrder = True
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel3: TPanel
    Width = 326
    Height = 3
    Visible = False
    inherited Label1: TLabel
      Visible = False
    end
    inherited ed_parametro: TEdit
      Visible = False
    end
    inherited RadioGroup1: TRadioGroup
      Visible = False
    end
  end
  inherited Panel1: TPanel
    Top = 3
    Width = 326
    Height = 321
    inherited DBGrid1: TDBGrid
      Width = 319
      Height = 309
      Columns = <
        item
          Expanded = False
          FieldName = 'COD_OBS'
          Title.Caption = 'C'#243'digo'
          Width = 50
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DESCRICAO'
          Title.Caption = 'Descri'#231#227'o'
          Width = 250
          Visible = True
        end>
    end
  end
  inherited Panel2: TPanel
    Top = 324
    Width = 326
    inherited bt_selecionar: TBitBtn
      Width = 160
    end
    inherited bt_cancelar: TBitBtn
      Left = 163
      Width = 160
    end
  end
end
