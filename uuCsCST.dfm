inherited frmCsCST: TfrmCsCST
  Left = 457
  Top = 196
  Caption = 'Consulta C'#243'digo de Situa'#231#227'o Tribut'#225'ria'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel3: TPanel
    Tag = 99
    Height = 51
    Color = clBlack
    ExplicitHeight = 51
    inherited Label1: TLabel
      Left = -176
      Top = -32
      Width = 144
      Caption = 'Digite as iniciais da CST:'
      Visible = False
      ExplicitLeft = -176
      ExplicitTop = -32
      ExplicitWidth = 144
    end
    object Label2: TLabel [1]
      Tag = 99
      Left = 70
      Top = 15
      Width = 347
      Height = 25
      Caption = 'C'#243'digo da Situa'#231#227'o Tribut'#225'ria'
      Font.Charset = ANSI_CHARSET
      Font.Color = clYellow
      Font.Height = -21
      Font.Name = 'Verdana'
      Font.Style = [fsBold]
      ParentFont = False
    end
    inherited ed_parametro: TEdit
      Left = -176
      Top = -19
      Width = 215
      Visible = False
      ExplicitLeft = -176
      ExplicitTop = -19
      ExplicitWidth = 215
    end
    inherited RadioGroup1: TRadioGroup
      Left = -142
      Top = -36
      ExplicitLeft = -142
      ExplicitTop = -36
    end
  end
  inherited Panel1: TPanel
    Top = 51
    Height = 139
    ExplicitTop = 51
    ExplicitHeight = 139
    inherited DBGrid1: TDBGrid
      Width = 492
      Height = 270
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
      OnDrawColumnCell = DBGrid1DrawColumnCell
      Columns = <
        item
          Expanded = False
          FieldName = 'CST'
          Title.Caption = 'C'#243'digo '
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DESCRICAO'
          Title.Caption = 'Descri'#231#227'o'
          Width = 400
          Visible = True
        end>
    end
  end
  inherited Panel2: TPanel
    Top = 190
    Height = 52
    ExplicitTop = 190
    ExplicitHeight = 52
    inherited bt_selecionar: TBitBtn
      Height = 45
      ExplicitHeight = 45
    end
    inherited bt_cancelar: TBitBtn
      Height = 44
      ExplicitHeight = 44
    end
  end
end
