inherited frmCsBairros: TfrmCsBairros
  Left = 399
  Top = 155
  Caption = 'Consulta de Bairros'
  ClientHeight = 504
  ClientWidth = 501
  ExplicitHeight = 542
  TextHeight = 13
  inherited Panel3: TPanel
    Width = 501
    Height = 49
    ExplicitHeight = 49
    inherited Label1: TLabel
      Top = 3
      Width = 152
      Caption = 'Digite as iniciais do bairro:'
      ExplicitTop = 3
      ExplicitWidth = 152
    end
    inherited ed_parametro: TEdit
      Top = 16
      Width = 498
      Height = 28
      Font.Height = -16
      ParentFont = False
      ExplicitTop = 16
      ExplicitWidth = 498
      ExplicitHeight = 28
    end
    inherited RadioGroup1: TRadioGroup
      Left = -5
      Top = -52
      Visible = False
      ExplicitLeft = -5
      ExplicitTop = -52
    end
  end
  inherited Panel1: TPanel
    Top = 49
    Width = 501
    Height = 403
    ExplicitTop = 49
    ExplicitHeight = 177
    inherited DBGrid1: TDBGrid
      Height = 403
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
    Top = 452
    Width = 501
    Height = 52
    ExplicitTop = 226
    ExplicitHeight = 52
    inherited bt_cancelar: TAdvGlassButton
      Left = 326
      Top = 4
      Width = 175
      Height = 48
      Font.Height = -16
      ExplicitLeft = 326
      ExplicitTop = 4
      ExplicitWidth = 175
      ExplicitHeight = 48
    end
    inherited bt_selecionar: TAdvGlassButton
      Left = 141
      Top = 4
      Width = 179
      Height = 48
      Font.Height = -16
      ExplicitLeft = 141
      ExplicitTop = 4
      ExplicitWidth = 179
      ExplicitHeight = 48
    end
  end
end
