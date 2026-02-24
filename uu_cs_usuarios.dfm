inherited frm_cs_usuarios: Tfrm_cs_usuarios
  Caption = 'Consulta de usu'#225'rios'
  ClientHeight = 469
  ClientWidth = 561
  ExplicitWidth = 573
  ExplicitHeight = 507
  TextHeight = 13
  inherited Panel3: TPanel
    Width = 561
    Height = 86
    ExplicitWidth = 557
    ExplicitHeight = 86
    inherited Label1: TLabel
      Left = 0
      ExplicitLeft = 0
    end
    inherited ed_parametro: TEdit
      Left = 0
      Top = 61
      Width = 558
      ExplicitLeft = 0
      ExplicitTop = 61
      ExplicitWidth = 558
    end
    inherited RadioGroup1: TRadioGroup
      Left = 0
      Width = 558
      Columns = 2
      ItemIndex = 0
      Items.Strings = (
        'Nome do usu'#225'rio'
        'Login')
      ExplicitLeft = 0
      ExplicitWidth = 558
    end
  end
  inherited Panel1: TPanel
    Top = 86
    Width = 561
    Height = 327
    ExplicitTop = 86
    ExplicitWidth = 557
    ExplicitHeight = 326
    inherited DBGrid1: TDBGrid
      Width = 561
      Height = 327
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
    Top = 413
    Width = 561
    Height = 56
    ExplicitTop = 412
    ExplicitWidth = 557
    ExplicitHeight = 56
    inherited bt_cancelar: TAdvGlassButton
      Left = 392
      Top = 6
      Width = 165
      Height = 51
      Anchors = [akTop, akRight, akBottom]
      ExplicitLeft = 388
      ExplicitTop = 6
      ExplicitWidth = 165
      ExplicitHeight = 51
    end
    inherited bt_selecionar: TAdvGlassButton
      Left = 224
      Top = 6
      Width = 165
      Height = 51
      Anchors = [akTop, akRight, akBottom]
      ExplicitLeft = 220
      ExplicitTop = 6
      ExplicitWidth = 165
      ExplicitHeight = 51
    end
  end
end
