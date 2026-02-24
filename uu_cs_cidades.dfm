inherited frm_cs_cidades: Tfrm_cs_cidades
  Left = 403
  Top = 181
  Caption = 'Consulta de Cidades'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel3: TPanel
    Height = 44
    ExplicitHeight = 44
    inherited Label1: TLabel
      Top = 7
      Width = 219
      Caption = 'Digite as iniciais da cidade procurada:'
      ExplicitTop = 7
      ExplicitWidth = 219
    end
    inherited ed_parametro: TEdit
      Top = 20
      ExplicitTop = 20
    end
    inherited RadioGroup1: TRadioGroup
      Top = -44
      Visible = False
      ExplicitTop = -44
    end
  end
  inherited Panel1: TPanel
    Top = 44
    Height = 154
    Caption = ''
    ExplicitTop = 44
    ExplicitHeight = 154
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
    Top = 198
    Height = 44
    ExplicitTop = 198
    ExplicitHeight = 44
    inherited bt_selecionar: TBitBtn
      Top = 1
      Width = 290
      Height = 40
      ExplicitTop = 1
      ExplicitWidth = 290
      ExplicitHeight = 40
    end
    inherited bt_cancelar: TBitBtn
      Left = 293
      Top = 2
      Width = 290
      Height = 39
      ExplicitLeft = 293
      ExplicitTop = 2
      ExplicitWidth = 290
      ExplicitHeight = 39
    end
  end
end
