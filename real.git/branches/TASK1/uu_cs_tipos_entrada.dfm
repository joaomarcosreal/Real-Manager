inherited frm_cs_tipos_entrada: Tfrm_cs_tipos_entrada
  Width = 346
  Caption = 'Consulta de Tipos de entrada'
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel3: TPanel
    Width = 338
    Height = 49
    inherited Label1: TLabel
      Top = 12
      Width = 206
      Caption = 'Digite as iniciais do tipo de entrada:'
    end
    inherited ed_parametro: TEdit
      Top = 25
      Width = 278
    end
    inherited RadioGroup1: TRadioGroup
      Top = -47
    end
  end
  inherited Panel1: TPanel
    Top = 49
    Width = 338
    Height = 154
    inherited DBGrid1: TDBGrid
      Width = 329
      Height = 146
      Columns = <
        item
          Expanded = False
          FieldName = 'COD_TIPO_ENTRADA'
          Title.Caption = 'C'#243'digo'
          Width = 45
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DESCRICAO'
          Title.Caption = 'Descri'#231#227'o'
          Width = 242
          Visible = True
        end>
    end
  end
  inherited Panel2: TPanel
    Width = 338
    inherited bt_selecionar: TBitBtn
      Width = 166
    end
    inherited bt_cancelar: TBitBtn
      Left = 169
      Width = 166
    end
  end
end
