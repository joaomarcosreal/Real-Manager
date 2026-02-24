inherited frmCsDepartamentos: TfrmCsDepartamentos
  Left = 673
  Top = 51
  Caption = 'Consulta de Departamentos'
  ClientHeight = 414
  ClientWidth = 340
  ExplicitWidth = 356
  ExplicitHeight = 453
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel3: TPanel
    Tag = 99
    Width = 340
    Height = 41
    Color = clBlack
    ExplicitWidth = 340
    ExplicitHeight = 41
    inherited Label1: TLabel
      Top = -42
      ExplicitTop = -42
    end
    object Label2: TLabel [1]
      Left = 20
      Top = 10
      Width = 284
      Height = 23
      Caption = 'Selecione o departamento'
      Font.Charset = ANSI_CHARSET
      Font.Color = clYellow
      Font.Height = -19
      Font.Name = 'Verdana'
      Font.Style = [fsBold]
      ParentFont = False
    end
    inherited ed_parametro: TEdit
      Top = -29
      ExplicitTop = -29
    end
    inherited RadioGroup1: TRadioGroup
      Top = -78
      ExplicitTop = -78
    end
  end
  inherited Panel1: TPanel
    Top = 41
    Width = 340
    Height = 318
    ExplicitTop = 41
    ExplicitWidth = 340
    ExplicitHeight = 318
    inherited DBGrid1: TDBGrid
      Top = 12
      Width = 334
      Height = 301
      Font.Height = -16
      OnDrawColumnCell = DBGrid1DrawColumnCell
      Columns = <
        item
          Expanded = False
          FieldName = 'CODIGO'
          Title.Caption = 'C'#243'digo'
          Width = 48
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DESCRICAO'
          Title.Caption = 'Descri'#231#227'o do departamento'
          Width = 262
          Visible = True
        end>
    end
  end
  inherited Panel2: TPanel
    Top = 359
    Width = 340
    Height = 55
    ExplicitTop = 359
    ExplicitWidth = 340
    ExplicitHeight = 55
    inherited bt_selecionar: TBitBtn
      Top = 0
      Width = 166
      Height = 51
      ExplicitTop = 0
      ExplicitWidth = 166
      ExplicitHeight = 51
    end
    inherited bt_cancelar: TBitBtn
      Left = 169
      Top = 0
      Width = 167
      Height = 51
      ExplicitLeft = 169
      ExplicitTop = 0
      ExplicitWidth = 167
      ExplicitHeight = 51
    end
  end
end
