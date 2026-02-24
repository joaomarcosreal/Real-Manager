inherited frmPesquisaClienteDelivery: TfrmPesquisaClienteDelivery
  Left = 176
  Top = 118
  Caption = 'Pesquisa de Clientes - Delivery'
  ClientHeight = 499
  ClientWidth = 992
  OldCreateOrder = True
  Position = poScreenCenter
  ExplicitWidth = 1000
  ExplicitHeight = 526
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel3: TPanel
    Width = 992
    Height = 87
    ExplicitWidth = 992
    ExplicitHeight = 87
    inherited ed_parametro: TEdit
      Width = 988
      Height = 28
      Font.Height = -16
      ParentFont = False
      ExplicitWidth = 988
      ExplicitHeight = 28
    end
    inherited RadioGroup1: TRadioGroup
      Width = 574
      Caption = 'Filtros  ( F2 - Mudar de campo) '
      Columns = 4
      ItemIndex = 0
      Items.Strings = (
        'Nome'
        'Telefone'
        'Bairro'
        'Endere'#231'o')
      ExplicitWidth = 574
    end
  end
  inherited Panel1: TPanel
    Top = 87
    Width = 992
    Height = 325
    ExplicitWidth = 690
    ExplicitHeight = 330
    inherited DBGrid1: TDBGrid
      Left = 1
      Top = 1
      Width = 990
      Height = 323
      Align = alClient
      OnDrawColumnCell = DBGrid1DrawColumnCell
      Columns = <
        item
          Expanded = False
          FieldName = 'CODIGO'
          Title.Caption = 'C'#243'digo'
          Width = 44
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NOME'
          Title.Caption = 'Nome'
          Width = 242
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'TELEFONE'
          Title.Caption = 'Telefone'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DESCRICAO'
          Title.Caption = 'Bairro'
          Width = 120
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ENDERECO'
          Title.Caption = 'Endereco'
          Width = 329
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'COMPLEMENTO'
          Title.Caption = 'Complemento'
          Width = 200
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'REFERENCIA1'
          Title.Caption = 'Referencia(1)'
          Width = 200
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'REFERENCIA2'
          Title.Caption = 'Refer'#234'ncia(2)'
          Width = 200
          Visible = True
        end>
    end
  end
  inherited Panel2: TPanel
    Top = 412
    Width = 992
    Height = 87
    ExplicitTop = 413
    ExplicitWidth = 992
    ExplicitHeight = 87
    inherited bt_selecionar: TBitBtn
      Left = 1
      Top = 3
      Width = 496
      Height = 79
      Font.Height = -19
      ParentFont = False
      ExplicitLeft = 1
      ExplicitTop = 3
      ExplicitWidth = 496
      ExplicitHeight = 79
    end
    inherited bt_cancelar: TBitBtn
      Left = 498
      Top = 3
      Width = 491
      Height = 79
      Font.Height = -19
      ParentFont = False
      ExplicitLeft = 498
      ExplicitTop = 3
      ExplicitWidth = 491
      ExplicitHeight = 79
    end
  end
end
