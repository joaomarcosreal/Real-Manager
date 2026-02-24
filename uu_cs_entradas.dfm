inherited frm_cs_entradas: Tfrm_cs_entradas
  Left = 14
  Top = 83
  Caption = 'Consulta de Entradas'
  ClientHeight = 615
  ClientWidth = 1005
  Position = poScreenCenter
  ExplicitWidth = 1017
  ExplicitHeight = 653
  TextHeight = 13
  inherited Panel3: TPanel
    Width = 1005
    Height = 125
    ExplicitWidth = 1001
    ExplicitHeight = 125
    inherited Label1: TLabel
      Left = 19
      Top = -27
      Visible = False
      ExplicitLeft = 19
      ExplicitTop = -27
    end
    inherited ed_parametro: TEdit
      Top = -46
      Visible = False
      ExplicitTop = -46
    end
    inherited RadioGroup1: TRadioGroup
      Top = -95
      Width = 278
      Columns = 2
      Items.Strings = (
        'Raz'#227'o Social'
        'Nome Fantasia')
      Visible = False
      ExplicitTop = -95
      ExplicitWidth = 278
    end
    object BitBtn1: TBitBtn
      Left = 385
      Top = 71
      Width = 109
      Height = 48
      Caption = 'Localizar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      Glyph.Data = {
        DE010000424DDE01000000000000760000002800000024000000120000000100
        0400000000006801000000000000000000001000000000000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00666666666666
        6666666666666666666666660000666666666666666666666666666666666666
        0000666666666666666666666666666666666666000060000066666000006667
        7777666667777766000060700066666070006667877766666787776600006070
        00666660700066678777666667877766000060000000F00000006667777777F7
        7777776600006070000000700000666787777777877777660000607000006070
        0000666787777767877777660000607000006070000066678777776787777766
        0000660000000000000666667777777777777666000066607000F07000666666
        678777F787776666000066600000600000666666677777677777666600006666
        00066600066666666677766677766666000066667F06667F06666666667F7666
        7F76666600006666000666000666666666777666777666660000666666666666
        6666666666666666666666660000666666666666666666666666666666666666
        0000}
      Layout = blGlyphTop
      NumGlyphs = 2
      ParentFont = False
      TabOrder = 7
      OnClick = BitBtn1Click
    end
    object gpFornecedor: TGroupBox
      Left = 3
      Top = 10
      Width = 494
      Height = 60
      Caption = 'Informe o fornecedor'
      TabOrder = 2
      object Label2: TLabel
        Left = 5
        Top = 21
        Width = 74
        Height = 13
        Caption = 'C'#243'd. Fornec:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object bt_pesq_fornecedor: TSpeedButton
        Left = 72
        Top = 35
        Width = 20
        Height = 22
        Flat = True
        Glyph.Data = {
          DE010000424DDE01000000000000760000002800000024000000120000000100
          0400000000006801000000000000000000001000000010000000000000000000
          80000080000000808000800000008000800080800000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00666666666666
          6666666666666666666666660000666666666666666666666666666666666666
          0000666666666666666666666666666666666666000060000066666000006668
          8888666668888866000060800066666080006668788866666878886600006080
          00666660800066687888666668788866000060000000F00000006668888888F8
          8888886600006080000000800000666878888888788888660000608000006080
          0000666878888868788888660000608000006080000066687888886878888866
          0000660000000000000666668888888888888666000066608000F08000666666
          687888F878886666000066600000600000666666688888688888666600006666
          00066600066666666688866688866666000066668F06668F06666666668F8666
          8F86666600006666000666000666666666888666888666660000666666666666
          6666666666666666666666660000666666666666666666666666666666666666
          0000}
        NumGlyphs = 2
        OnClick = botao_pesquisaClick
      end
      object Label6: TLabel
        Left = 98
        Top = 19
        Width = 209
        Height = 13
        Caption = 'Raz'#227'o Social / Nome  do fornecedor'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Panel4: TPanel
        Left = 97
        Top = 32
        Width = 392
        Height = 24
        BevelOuter = bvNone
        Enabled = False
        TabOrder = 0
        object ed_razao_social_fornecedor: TEdit
          Left = 2
          Top = 2
          Width = 365
          Height = 21
          Color = clBlack
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clYellow
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 0
        end
      end
      object ed_cod_fornecedor: TEdit
        Left = 6
        Top = 35
        Width = 64
        Height = 21
        TabOrder = 1
        OnChange = Edit1Change
        OnEnter = Edit1Enter
        OnExit = edChaveNFEExit
        OnKeyDown = Edit1KeyDown
      end
    end
    object GroupBox2: TGroupBox
      Left = 507
      Top = 12
      Width = 168
      Height = 59
      Caption = 'Data de Entrada:'
      TabOrder = 3
      object Panel5: TPanel
        Left = 2
        Top = 15
        Width = 164
        Height = 42
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 0
        object Label3: TLabel
          Left = 6
          Top = -2
          Width = 70
          Height = 13
          Caption = 'Data Inicial:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label7: TLabel
          Left = 87
          Top = -1
          Width = 63
          Height = 13
          Caption = 'Data Final:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object edDataEntradaInicial: TMaskEdit
          Left = 7
          Top = 12
          Width = 67
          Height = 21
          EditMask = '99/99/9999;1;_'
          MaxLength = 10
          TabOrder = 0
          Text = '  /  /    '
          OnEnter = Edit1Enter
          OnExit = edChaveNFEExit
          OnKeyDown = Edit1KeyDown
        end
        object edDataEntradaFinal: TMaskEdit
          Left = 88
          Top = 13
          Width = 71
          Height = 21
          EditMask = '99/99/9999;1;_'
          MaxLength = 10
          TabOrder = 1
          Text = '  /  /    '
          OnEnter = Edit1Enter
          OnExit = edChaveNFEExit
          OnKeyDown = Edit1KeyDown
        end
      end
    end
    object GroupBox3: TGroupBox
      Left = 680
      Top = 12
      Width = 171
      Height = 59
      Caption = 'Data de Lan'#231'amento'
      TabOrder = 4
      object Panel6: TPanel
        Left = 2
        Top = 15
        Width = 167
        Height = 42
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 0
        object Label8: TLabel
          Left = 6
          Top = -2
          Width = 70
          Height = 13
          Caption = 'Data Inicial:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label11: TLabel
          Left = 87
          Top = -1
          Width = 63
          Height = 13
          Caption = 'Data Final:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object MaskEdit1: TMaskEdit
          Left = 7
          Top = 12
          Width = 73
          Height = 21
          EditMask = '99/99/9999;0;_'
          MaxLength = 10
          TabOrder = 0
          Text = ''
          OnEnter = Edit1Enter
          OnExit = edChaveNFEExit
          OnKeyDown = Edit1KeyDown
        end
        object MaskEdit2: TMaskEdit
          Left = 88
          Top = 13
          Width = 75
          Height = 21
          EditMask = '99/99/9999;0;_'
          MaxLength = 10
          TabOrder = 1
          Text = ''
          OnEnter = Edit1Enter
          OnExit = edChaveNFEExit
          OnKeyDown = Edit1KeyDown
        end
      end
    end
    object gpNota: TGroupBox
      Left = 858
      Top = 15
      Width = 134
      Height = 54
      Caption = 'N'#250'mero da Nota Fiscal'
      TabOrder = 5
      object Panel7: TPanel
        Left = 2
        Top = 15
        Width = 130
        Height = 37
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 0
        object edNumeroNota: TEdit
          Left = 5
          Top = 10
          Width = 116
          Height = 21
          TabOrder = 0
          OnEnter = Edit1Enter
          OnExit = edChaveNFEExit
          OnKeyDown = ed_parametroKeyDown
        end
      end
    end
    object gpChave: TGroupBox
      Left = 2
      Top = 70
      Width = 377
      Height = 52
      Caption = 'Chave da NF-E'
      TabOrder = 6
      object Panel8: TPanel
        Left = 2
        Top = 15
        Width = 373
        Height = 35
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 0
        object edChaveNFE: TEdit
          Left = 5
          Top = 10
          Width = 360
          Height = 21
          TabOrder = 0
          OnEnter = Edit1Enter
          OnExit = edChaveNFEExit
          OnKeyDown = ed_parametroKeyDown
        end
      end
    end
  end
  inherited Panel1: TPanel
    Top = 125
    Width = 1005
    Height = 426
    ExplicitTop = 125
    ExplicitWidth = 1001
    ExplicitHeight = 425
    inherited DBGrid1: TDBGrid
      Width = 1005
      Height = 426
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
      OnDrawColumnCell = DBGrid1DrawColumnCell
      Columns = <
        item
          Expanded = False
          FieldName = 'COD_ENTRADA'
          Title.Caption = 'C'#243'digo'
          Width = 60
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'RAZAO_SOCIAL'
          Title.Caption = 'Nome / Raz'#227'o Social do fornecedor'
          Width = 265
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DESCRICAO_TP_ENTRADA'
          Title.Caption = 'Tipo de entrada'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'DESC_TP_DOC'
          Title.Caption = 'Tipo do documento'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'NUMERO_NOTA'
          Title.Caption = 'N'#186' da nota'
          Width = 132
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'TOTAL_NOTA'
          Title.Caption = 'Total'
          Width = 104
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DATA_EMISSAO'
          Title.Caption = 'Emiss'#227'o'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DATA_ENTRADA'
          Title.Caption = 'Entrada'
          Width = 93
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DATA'
          Title.Caption = 'Lan'#231'ada em:'
          Width = 80
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'HORA'
          Title.Caption = 'Hora'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'NOME_USUARIO'
          Title.Caption = 'Usu'#225'rio'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'DESCRICAOLoja'
          Title.Caption = 'Loja '
          Width = 177
          Visible = True
        end>
    end
  end
  inherited Panel2: TPanel
    Top = 551
    Width = 1005
    Height = 64
    ExplicitTop = 550
    ExplicitWidth = 1001
    ExplicitHeight = 64
    inherited bt_cancelar: TAdvGlassButton
      Left = 502
      Top = 3
      Width = 499
      Height = 61
      ExplicitLeft = 502
      ExplicitTop = 3
      ExplicitWidth = 499
      ExplicitHeight = 61
    end
    inherited bt_selecionar: TAdvGlassButton
      Top = 2
      Width = 501
      Height = 62
      ExplicitTop = 2
      ExplicitWidth = 501
      ExplicitHeight = 62
    end
  end
end
