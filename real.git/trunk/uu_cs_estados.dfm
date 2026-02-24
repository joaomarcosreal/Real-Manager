inherited frmCsEstados: TfrmCsEstados
  Left = 323
  Top = 161
  Width = 351
  Height = 301
  Caption = 'Consulta de Estados'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel3: TPanel
    Width = 343
    Height = 54
    inherited Label1: TLabel
      Top = 7
      Width = 158
      Caption = 'Digite as iniciais do estado:'
    end
    inherited ed_parametro: TEdit
      Top = 21
      Width = 167
    end
    inherited RadioGroup1: TRadioGroup
      Top = -45
    end
  end
  inherited Panel1: TPanel
    Top = 54
    Width = 343
    Height = 173
    Caption = ''
    inherited DBGrid1: TDBGrid
      Left = 0
      Top = 12
      Width = 337
      Height = 153
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
          FieldName = 'NOME'
          Title.Caption = 'Nome'
          Width = 200
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'SIGLA'
          Title.Caption = 'UF'
          Width = 30
          Visible = True
        end>
    end
  end
  inherited Panel2: TPanel
    Top = 227
    Width = 343
    Height = 47
    inherited bt_selecionar: TBitBtn
      Width = 170
      Height = 41
    end
    inherited bt_cancelar: TBitBtn
      Left = 174
      Top = 4
      Width = 168
      Height = 40
    end
  end
end
