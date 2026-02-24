inherited frmPesqTipoItemSPED: TfrmPesqTipoItemSPED
  Left = 391
  Top = 193
  BorderIcons = []
  Caption = 'Consulta de tipos de '#237'tens'
  ClientHeight = 562
  ClientWidth = 528
  ExplicitWidth = 540
  ExplicitHeight = 600
  TextHeight = 13
  inherited Panel3: TPanel
    Tag = 99
    Width = 528
    Height = 34
    Color = 12615680
    ExplicitWidth = 528
    ExplicitHeight = 34
    inherited Label1: TLabel
      Top = -50
      Visible = False
      StyleElements = []
      ExplicitTop = -50
    end
    object lbTitulo: TLabel [1]
      Left = 3
      Top = 4
      Width = 392
      Height = 34
      AutoSize = False
      Caption = 'Tipos de '#237'tens - Sped fiscal'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -19
      Font.Name = 'Calibri'
      Font.Style = [fsBold]
      ParentFont = False
      Layout = tlCenter
      StyleElements = []
    end
    inherited ed_parametro: TEdit
      Top = -37
      Visible = False
      ExplicitTop = -37
    end
    inherited RadioGroup1: TRadioGroup
      Top = -86
      Visible = False
      ExplicitTop = -86
    end
  end
  inherited Panel1: TPanel
    Top = 34
    Width = 528
    Height = 477
    ExplicitTop = 47
    ExplicitHeight = 177
    inherited DBGrid1: TDBGrid
      Width = 528
      Height = 477
      TitleFont.Height = -16
      OnEnter = nil
      Columns = <
        item
          Expanded = False
          FieldName = 'COD_TIPO'
          Title.Caption = 'C'#243'digo'
          Width = 60
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DESCRICAO'
          Title.Caption = 'Descri'#231#227'o'
          Width = 423
          Visible = True
        end>
    end
  end
  inherited Panel2: TPanel
    Top = 511
    Width = 528
    Height = 51
    ExplicitTop = 484
    ExplicitWidth = 528
    ExplicitHeight = 51
    inherited bt_cancelar: TAdvGlassButton
      Left = 356
      Top = 4
      Width = 172
      Height = 48
      ExplicitLeft = 356
      ExplicitTop = 4
      ExplicitWidth = 172
      ExplicitHeight = 48
    end
    inherited bt_selecionar: TAdvGlassButton
      Left = 178
      Top = 4
      Width = 172
      Height = 49
      ExplicitLeft = 178
      ExplicitTop = 4
      ExplicitWidth = 172
      ExplicitHeight = 49
    end
  end
end
