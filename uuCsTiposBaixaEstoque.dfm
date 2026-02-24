inherited frmCsTiposBaixaEstoque: TfrmCsTiposBaixaEstoque
  Left = 315
  Top = 205
  BorderIcons = []
  Caption = 'Consulta de  Tipos de baixa de Estoque'
  TextHeight = 13
  inherited Panel3: TPanel
    Height = 4
    ExplicitHeight = 4
    inherited Label1: TLabel
      Top = 10
      Visible = False
      ExplicitTop = 10
    end
    inherited ed_parametro: TEdit
      Top = 23
      Visible = False
      ExplicitTop = 23
    end
    inherited RadioGroup1: TRadioGroup
      Top = -43
      Visible = False
      ExplicitTop = -43
    end
  end
  inherited Panel1: TPanel
    Top = 4
    Height = 226
    Caption = ''
    ExplicitTop = 4
    ExplicitHeight = 225
    inherited DBGrid1: TDBGrid
      Height = 226
      Columns = <
        item
          Expanded = False
          FieldName = 'COD_tipo'
          Title.Caption = 'C'#243'digo'
          Width = 50
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DESCRICAO'
          Title.Caption = 'Descri'#231#227'o'
          Width = 380
          Visible = True
        end>
    end
  end
  inherited Panel2: TPanel
    Top = 230
    Height = 49
    ExplicitTop = 229
    ExplicitHeight = 49
    inherited bt_cancelar: TAdvGlassButton
      Left = 232
      Width = 230
      Height = 42
      ExplicitLeft = 232
      ExplicitWidth = 230
      ExplicitHeight = 42
    end
    inherited bt_selecionar: TAdvGlassButton
      Width = 230
      Height = 43
      ExplicitWidth = 230
      ExplicitHeight = 43
    end
  end
end
