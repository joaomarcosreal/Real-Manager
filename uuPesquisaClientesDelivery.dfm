inherited frmPesquisaClienteDelivery: TfrmPesquisaClienteDelivery
  Left = 176
  Top = 118
  Caption = 'Pesquisa de Clientes - Delivery'
  ClientHeight = 499
  ClientWidth = 992
  Position = poScreenCenter
  ExplicitWidth = 1004
  ExplicitHeight = 537
  TextHeight = 13
  inherited Panel3: TPanel
    Width = 992
    Height = 91
    ExplicitWidth = 992
    ExplicitHeight = 91
    inherited ed_parametro: TEdit
      Top = 58
      Width = 988
      Height = 28
      Font.Height = -16
      ParentFont = False
      ExplicitTop = 58
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
    Top = 91
    Width = 992
    Height = 321
    ExplicitTop = 87
    ExplicitWidth = 988
    ExplicitHeight = 324
    inherited DBGrid1: TDBGrid
      Width = 992
      Height = 321
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
    ExplicitTop = 411
    ExplicitWidth = 988
    ExplicitHeight = 87
    inherited bt_cancelar: TAdvGlassButton
      Left = 498
      Width = 491
      Height = 79
      Font.Height = -19
      ExplicitLeft = 498
      ExplicitWidth = 491
      ExplicitHeight = 79
    end
    inherited bt_selecionar: TAdvGlassButton
      Left = 1
      Width = 496
      Height = 79
      Font.Height = -19
      ExplicitLeft = 1
      ExplicitWidth = 496
      ExplicitHeight = 79
    end
  end
end
