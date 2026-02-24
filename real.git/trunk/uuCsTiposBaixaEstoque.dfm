inherited frmCsTiposBaixaEstoque: TfrmCsTiposBaixaEstoque
  Left = 315
  Top = 205
  Width = 472
  Height = 384
  BorderIcons = []
  Caption = 'Consulta de  Tipos de baixa de Estoque'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel3: TPanel
    Width = 464
    Height = 4
    inherited Label1: TLabel
      Top = 10
      Visible = False
    end
    inherited ed_parametro: TEdit
      Top = 23
      Visible = False
    end
    inherited RadioGroup1: TRadioGroup
      Top = -43
      Visible = False
    end
  end
  inherited Panel1: TPanel
    Top = 4
    Width = 464
    Height = 304
    Caption = ''
    inherited DBGrid1: TDBGrid
      Width = 455
      Height = 294
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
    Top = 308
    Width = 464
    Height = 49
    inherited bt_selecionar: TBitBtn
      Width = 230
      Height = 43
    end
    inherited bt_cancelar: TBitBtn
      Left = 232
      Width = 230
      Height = 42
    end
  end
end
