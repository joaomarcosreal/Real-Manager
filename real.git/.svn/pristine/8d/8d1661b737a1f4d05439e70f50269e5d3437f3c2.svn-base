inherited frm_cs_fornecedores: Tfrm_cs_fornecedores
  Left = 212
  Top = 24
  Width = 836
  Height = 454
  Caption = 'Pesquisa Fornecedores'
  OldCreateOrder = True
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel3: TPanel
    Width = 828
    Height = 80
    inherited Label1: TLabel
      Left = 4
      Top = 41
    end
    inherited ed_parametro: TEdit
      Left = 5
      Top = 54
      Width = 330
      OnChange = Edit1Change
    end
    inherited RadioGroup1: TRadioGroup
      Left = 7
      Top = 5
      Width = 402
      Columns = 3
      ItemIndex = 0
      Items.Strings = (
        'Raz'#227'o Social'
        'Nome Fantasia'
        'CNPJ')
    end
  end
  inherited Panel1: TPanel
    Top = 80
    Width = 828
    Height = 296
    inherited DBGrid1: TDBGrid
      Left = 2
      Top = 3
      Width = 822
      Height = 289
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
      OnDrawColumnCell = DBGrid1DrawColumnCell
      Columns = <
        item
          Expanded = False
          FieldName = 'COD_FORNECEDOR'
          Title.Caption = 'C'#243'digo'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NOME_FANTASIA'
          Title.Caption = 'Nome Fantasia'
          Width = 212
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'RAZAO_SOCIAL'
          Title.Caption = 'Raz'#227'o Social'
          Width = 240
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NOME_CIDADE'
          Title.Caption = 'Cidade'
          Width = 142
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CGC_CPF'
          Title.Caption = 'CNPJ'
          Width = 128
          Visible = True
        end>
    end
  end
  inherited Panel2: TPanel
    Top = 376
    Width = 828
    Height = 51
    inherited bt_selecionar: TBitBtn
      Width = 413
      Height = 44
    end
    inherited bt_cancelar: TBitBtn
      Left = 414
      Width = 413
      Height = 43
    end
  end
end
