inherited frmCsCFOP: TfrmCsCFOP
  Width = 643
  Height = 355
  Caption = 'Consulta CFOP - C'#243'digo Fiscal de Opera'#231#245'es e Presta'#231#245'es'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel3: TPanel
    Width = 635
    Height = 49
    inherited Label1: TLabel
      Top = 10
      Width = 242
      Caption = 'Digite as iniciais da Opera'#231#227'o / Presta'#231#227'o'
    end
    inherited ed_parametro: TEdit
      Top = 23
      Width = 286
    end
    inherited RadioGroup1: TRadioGroup
      Top = -47
    end
  end
  inherited Panel1: TPanel
    Top = 49
    Width = 635
    Height = 234
    inherited DBGrid1: TDBGrid
      Width = 627
      Height = 223
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
      OnDrawColumnCell = DBGrid1DrawColumnCell
      Columns = <
        item
          Expanded = False
          FieldName = 'CODIGO'
          Title.Caption = 'C'#243'digo'
          Width = 60
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DESCRICAO'
          Title.Caption = 'Descri'#231#227'o'
          Width = 530
          Visible = True
        end>
    end
  end
  inherited Panel2: TPanel
    Top = 283
    Width = 635
    Height = 45
    inherited bt_selecionar: TBitBtn
      Top = 2
      Width = 315
      Height = 42
    end
    inherited bt_cancelar: TBitBtn
      Left = 318
      Top = 3
      Width = 315
      Height = 41
    end
  end
end
