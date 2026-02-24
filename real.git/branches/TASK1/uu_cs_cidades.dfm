inherited frm_cs_cidades: Tfrm_cs_cidades
  Left = 403
  Top = 181
  Width = 591
  Height = 403
  Caption = 'Consulta de Cidades'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel3: TPanel
    Width = 583
    Height = 44
    inherited Label1: TLabel
      Top = 7
      Width = 219
      Caption = 'Digite as iniciais da cidade procurada:'
    end
    inherited ed_parametro: TEdit
      Top = 20
    end
    inherited RadioGroup1: TRadioGroup
      Top = -44
      Visible = False
    end
  end
  inherited Panel1: TPanel
    Top = 44
    Width = 583
    Height = 288
    Caption = ''
    inherited DBGrid1: TDBGrid
      Top = 8
      Width = 579
      Height = 277
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
      OnDrawColumnCell = DBGrid1DrawColumnCell
      Columns = <
        item
          Expanded = False
          FieldName = 'COD_CIDADE'
          Title.Caption = 'C'#243'digo'
          Width = 78
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CIDADE'
          Title.Caption = 'Nome da cidade'
          Width = 347
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ESTADO'
          Title.Caption = 'Estado'
          Width = 120
          Visible = True
        end>
    end
  end
  inherited Panel2: TPanel
    Top = 332
    Width = 583
    Height = 44
    inherited bt_selecionar: TBitBtn
      Top = 1
      Width = 290
      Height = 40
    end
    inherited bt_cancelar: TBitBtn
      Left = 293
      Top = 2
      Width = 290
      Height = 39
    end
  end
end
