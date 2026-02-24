inherited frm_cs_fornecedores: Tfrm_cs_fornecedores
  Left = 212
  Top = 24
  Caption = 'Pesquisa Fornecedores'
  ClientHeight = 503
  ClientWidth = 993
  Position = poScreenCenter
  ExplicitWidth = 1005
  ExplicitHeight = 541
  TextHeight = 13
  inherited Panel3: TPanel
    Top = 49
    Width = 993
    Height = 64
    ExplicitTop = 49
    ExplicitWidth = 993
    ExplicitHeight = 64
    inherited Label1: TLabel
      Left = 2
      Top = 5
      Width = 256
      Height = 20
      Caption = 'Digite as iniciais do participante'
      Font.Height = -16
      StyleElements = []
      ExplicitLeft = 2
      ExplicitTop = 5
      ExplicitWidth = 256
      ExplicitHeight = 20
    end
    inherited ed_parametro: TEdit
      Left = 2
      Top = 25
      Width = 975
      Height = 33
      Font.Height = -21
      ParentFont = False
      OnChange = Edit1Change
      ExplicitLeft = 2
      ExplicitTop = 25
      ExplicitWidth = 975
      ExplicitHeight = 33
    end
    inherited RadioGroup1: TRadioGroup
      Left = 0
      Top = -35
      Width = 991
      Columns = 3
      ItemIndex = 0
      Items.Strings = (
        'Raz'#227'o Social'
        'Nome Fantasia'
        'CNPJ')
      Visible = False
      ExplicitLeft = 0
      ExplicitTop = -35
      ExplicitWidth = 991
    end
  end
  inherited Panel1: TPanel
    Top = 113
    Width = 993
    Height = 339
    ExplicitTop = 113
    ExplicitWidth = 993
    ExplicitHeight = 339
    inherited DBGrid1: TDBGrid
      Width = 993
      Height = 339
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
      OnDrawColumnCell = DBGrid1DrawColumnCell
      Columns = <
        item
          Expanded = False
          FieldName = 'COD_FORNECEDOR'
          Title.Caption = 'C'#243'digo'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NOME_FANTASIA'
          Title.Caption = 'Nome Fantasia'
          Width = 327
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'RAZAO_SOCIAL'
          Title.Caption = 'Raz'#227'o Social'
          Width = 289
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NOME_CIDADE'
          Title.Caption = 'Cidade'
          Width = 142
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CGC_CPF'
          Title.Caption = 'CNPJ'
          Width = 128
          Visible = True
        end>
    end
  end
  inherited Panel2: TPanel
    Top = 452
    Width = 993
    Height = 51
    ExplicitTop = 452
    ExplicitWidth = 993
    ExplicitHeight = 51
    inherited bt_cancelar: TAdvGlassButton
      Left = 798
      Top = 6
      Width = 179
      Height = 43
      ExplicitLeft = 798
      ExplicitTop = 6
      ExplicitWidth = 179
      ExplicitHeight = 43
    end
    inherited bt_selecionar: TAdvGlassButton
      Left = 592
      Top = 6
      Width = 200
      Height = 44
      ExplicitLeft = 592
      ExplicitTop = 6
      ExplicitWidth = 200
      ExplicitHeight = 44
    end
  end
  object Panel4: TPanel
    Tag = 99
    Left = 0
    Top = 0
    Width = 993
    Height = 49
    Align = alTop
    Color = 12615680
    ParentBackground = False
    TabOrder = 3
    StyleElements = []
    object lbTitulo: TLabel
      Left = 10
      Top = 6
      Width = 735
      Height = 33
      AutoSize = False
      Caption = 'Consulta de participantes fiscais'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -27
      Font.Name = 'Calibri'
      Font.Style = []
      ParentFont = False
      StyleElements = []
    end
  end
end
