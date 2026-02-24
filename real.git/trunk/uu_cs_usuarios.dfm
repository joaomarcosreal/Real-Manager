inherited frm_cs_usuarios: Tfrm_cs_usuarios
  Caption = 'Consulta de usu'#225'rios'
  ClientHeight = 470
  ClientWidth = 562
  OldCreateOrder = True
  ExplicitWidth = 570
  ExplicitHeight = 497
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel3: TPanel
    Width = 562
    Height = 86
    ExplicitWidth = 500
    ExplicitHeight = 86
    inherited ed_parametro: TEdit
      Top = 61
      Width = 270
      ExplicitTop = 61
      ExplicitWidth = 270
    end
    inherited RadioGroup1: TRadioGroup
      Width = 270
      Columns = 2
      ItemIndex = 0
      Items.Strings = (
        'Nome do usu'#225'rio'
        'Login')
      ExplicitWidth = 270
    end
  end
  inherited Panel1: TPanel
    Top = 86
    Width = 562
    Height = 333
    ExplicitTop = 86
    ExplicitWidth = 500
    ExplicitHeight = 148
    inherited DBGrid1: TDBGrid
      Top = 7
      Width = 550
      Height = 322
      Columns = <
        item
          Expanded = False
          FieldName = 'CODIGO'
          Title.Caption = 'C'#243'digo'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NOME'
          Title.Caption = 'Nome'
          Width = 276
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'LOGIN'
          Title.Caption = 'Login'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'STATUS'
          Title.Caption = 'Status'
          Width = 96
          Visible = True
        end>
    end
  end
  inherited Panel2: TPanel
    Top = 419
    Width = 562
    Height = 51
    ExplicitTop = 420
    ExplicitWidth = 562
    ExplicitHeight = 51
    inherited bt_selecionar: TBitBtn
      Top = 0
      Width = 281
      Height = 51
      ExplicitTop = 0
      ExplicitWidth = 281
      ExplicitHeight = 51
    end
    inherited bt_cancelar: TBitBtn
      Left = 283
      Top = 0
      Width = 279
      Height = 50
      Glyph.Data = {00000000}
      ExplicitLeft = 283
      ExplicitTop = 0
      ExplicitWidth = 279
      ExplicitHeight = 50
    end
  end
end
