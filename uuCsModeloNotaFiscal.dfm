inherited frmCsModeloNotaFiscal: TfrmCsModeloNotaFiscal
  Left = 274
  Top = 228
  Caption = 'Consulta de Modelos de Notas Fiscais'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel3: TPanel
    Tag = 99
    Height = 46
    Color = clBlack
    ExplicitHeight = 46
    inherited Label1: TLabel
      Left = 2
      Top = -45
      Visible = False
      ExplicitLeft = 2
      ExplicitTop = -45
    end
    object Label2: TLabel [1]
      Left = 72
      Top = 8
      Width = 334
      Height = 29
      Caption = 'Modelos de Notas Fiscais'
      Font.Charset = ANSI_CHARSET
      Font.Color = clYellow
      Font.Height = -24
      Font.Name = 'Verdana'
      Font.Style = [fsBold]
      ParentFont = False
    end
    inherited ed_parametro: TEdit
      Left = 2
      Top = -32
      Visible = False
      ExplicitLeft = 2
      ExplicitTop = -32
    end
    inherited RadioGroup1: TRadioGroup
      Left = -5
      Top = -47
      ExplicitLeft = -5
      ExplicitTop = -47
    end
  end
  inherited Panel1: TPanel
    Top = 46
    Height = 151
    ExplicitTop = 46
    ExplicitHeight = 151
    inherited DBGrid1: TDBGrid
      Top = 9
      Width = 482
      Height = 264
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
      OnDrawColumnCell = DBGrid1DrawColumnCell
      Columns = <
        item
          Expanded = False
          FieldName = 'CODIGO'
          Title.Caption = 'C'#243'digo'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DESCRICAO'
          Title.Caption = 'Descri'#231#227'o'
          Width = 390
          Visible = True
        end>
    end
  end
  inherited Panel2: TPanel
    Top = 197
    Height = 45
    ExplicitTop = 197
    ExplicitHeight = 45
    inherited bt_selecionar: TBitBtn
      Width = 241
      Height = 39
      ExplicitWidth = 241
      ExplicitHeight = 39
    end
    inherited bt_cancelar: TBitBtn
      Left = 245
      Width = 241
      Height = 38
      ExplicitLeft = 245
      ExplicitWidth = 241
      ExplicitHeight = 38
    end
  end
end
