inherited frmCsReg60A: TfrmCsReg60A
  Left = 105
  Top = 140
  Width = 824
  Caption = 'Consulta de dados de Redu'#231#245'es Z'
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel3: TPanel
    Width = 816
    Height = 49
    inherited Label1: TLabel
      Top = -49
      Visible = False
    end
    object De: TLabel [1]
      Left = 8
      Top = 8
      Width = 69
      Height = 13
      Caption = 'Data inicial:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label2: TLabel [2]
      Left = 88
      Top = 8
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
    inherited ed_parametro: TEdit
      Top = -36
      Visible = False
    end
    inherited RadioGroup1: TRadioGroup
      Left = -13
      Top = -50
      Visible = False
    end
    object edDataInicial: TMaskEdit
      Left = 8
      Top = 24
      Width = 73
      Height = 21
      EditMask = '99/99/9999;1;_'
      MaxLength = 10
      TabOrder = 2
      Text = '  /  /    '
      OnEnter = Edit1Enter
      OnExit = Edit1Exit
      OnKeyDown = Edit1KeyDown
    end
    object edDataFinal: TMaskEdit
      Left = 88
      Top = 24
      Width = 73
      Height = 21
      EditMask = '99/99/9999;1;_'
      MaxLength = 10
      TabOrder = 3
      Text = '  /  /    '
      OnEnter = Edit1Enter
      OnExit = Edit1Exit
      OnKeyDown = Edit1KeyDown
    end
    object BitBtn1: TBitBtn
      Left = 168
      Top = 23
      Width = 81
      Height = 22
      Caption = 'Filtrar'
      TabOrder = 4
      OnClick = BitBtn1Click
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000130B0000130B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        33033333333333333F7F3333333333333000333333333333F777333333333333
        000333333333333F777333333333333000333333333333F77733333333333300
        033333333FFF3F777333333700073B703333333F7773F77733333307777700B3
        33333377333777733333307F8F8F7033333337F333F337F3333377F8F9F8F773
        3333373337F3373F3333078F898F870333337F33F7FFF37F333307F99999F703
        33337F377777337F3333078F898F8703333373F337F33373333377F8F9F8F773
        333337F3373337F33333307F8F8F70333333373FF333F7333333330777770333
        333333773FF77333333333370007333333333333777333333333}
      NumGlyphs = 2
    end
  end
  inherited Panel1: TPanel
    Top = 49
    Width = 816
    Height = 155
    inherited DBGrid1: TDBGrid
      Width = 806
      Columns = <
        item
          Expanded = False
          FieldName = 'COD_REG'
          Title.Caption = 'C'#243'digo'
          Width = 65
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DATA'
          Title.Caption = 'Data'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'num_serie'
          Title.Caption = 'N'#186' de s'#233'rie'
          Width = 125
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'COO_INI'
          Title.Caption = 'COO Inicial'
          Width = 74
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'COO_FIM'
          Title.Caption = 'COO FINAL'
          Width = 116
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ALIQ7'
          Title.Caption = '7%'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ALIQ12'
          Title.Caption = '12%'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ALIQ17'
          Title.Caption = '17%'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ALIQ25'
          Title.Caption = '25%'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'SUBSTITUICAO'
          Title.Caption = 'Substitui'#231#227'o'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ISENCAO'
          Title.Caption = 'Isen'#231#227'o'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NAOTRIBUTADO'
          Title.Caption = 'N'#227'o tributado'
          Visible = True
        end>
    end
  end
  inherited Panel2: TPanel
    Width = 816
    inherited bt_selecionar: TBitBtn
      Width = 404
    end
    inherited bt_cancelar: TBitBtn
      Left = 406
      Width = 404
    end
  end
end
