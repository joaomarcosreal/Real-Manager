inherited frm_cad_receitas: Tfrm_cad_receitas
  Left = 147
  Top = 130
  Caption = 'Cadastro de receitas'
  ClientHeight = 537
  ClientWidth = 792
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  object Label8: TLabel [0]
    Left = 229
    Top = 93
    Width = 50
    Height = 13
    Caption = 'Calorias:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  inherited pn_principal: TPanel
    Width = 792
    Height = 495
    inherited pn_codigo: TPanel
      Width = 790
      Enabled = False
      inherited bt_pesquisa: TSpeedButton
        Top = 20
      end
    end
    object pn_campos: TPanel
      Left = 1
      Top = 47
      Width = 790
      Height = 447
      Align = alClient
      Enabled = False
      TabOrder = 1
      object Panel1: TPanel
        Left = 1
        Top = 1
        Width = 788
        Height = 98
        Align = alTop
        TabOrder = 0
        object Label1: TLabel
          Left = 7
          Top = 5
          Width = 69
          Height = 13
          Caption = 'Cod. Grupo:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object bt_pesq_grupo: TSpeedButton
          Left = 60
          Top = 23
          Width = 22
          Height = 18
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
        end
        object Label2: TLabel
          Left = 87
          Top = 6
          Width = 116
          Height = 13
          Caption = 'Descri'#231#227'o do grupo:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label3: TLabel
          Left = 317
          Top = 6
          Width = 62
          Height = 13
          Caption = 'Descri'#231#227'o:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label4: TLabel
          Left = 5
          Top = 45
          Width = 52
          Height = 13
          Caption = 'Pessoas:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label5: TLabel
          Left = 69
          Top = 45
          Width = 33
          Height = 13
          Caption = 'Peso:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label6: TLabel
          Left = 128
          Top = 45
          Width = 50
          Height = 13
          Caption = 'Calorias:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label7: TLabel
          Left = 193
          Top = 45
          Width = 60
          Height = 13
          Caption = 'Prote'#237'nas:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label9: TLabel
          Left = 268
          Top = 45
          Width = 76
          Height = 13
          Caption = 'Carboidratos:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object edCodigoGrupo: TDBEdit
          Left = 5
          Top = 20
          Width = 51
          Height = 21
          CharCase = ecUpperCase
          DataField = 'COD_GRUPO_RECEITA'
          DataSource = dm.dsQryReceitas
          TabOrder = 0
          OnEnter = Edit1Enter
          OnExit = Edit1Exit
          OnKeyDown = Edit1KeyDown
        end
        object Panel2: TPanel
          Left = 85
          Top = 18
          Width = 227
          Height = 27
          BevelOuter = bvNone
          Enabled = False
          TabOrder = 1
          object edDescricaoGrupo: TDBEdit
            Left = 2
            Top = 2
            Width = 220
            Height = 21
            CharCase = ecUpperCase
            Color = clBlack
            DataField = 'DESCRICAO_GRUPO'
            DataSource = dm.dsQryReceitas
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clYellow
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 0
          end
        end
        object edDescricaoReceita: TDBEdit
          Left = 317
          Top = 18
          Width = 356
          Height = 21
          CharCase = ecUpperCase
          DataField = 'DESCRICAO'
          DataSource = dm.dsQryReceitas
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 2
          OnEnter = Edit1Enter
          OnExit = Edit1Exit
          OnKeyDown = Edit1KeyDown
        end
        object edPessoas: TDBEdit
          Left = 6
          Top = 61
          Width = 51
          Height = 21
          CharCase = ecUpperCase
          DataField = 'PESSOAS'
          DataSource = dm.dsQryReceitas
          TabOrder = 3
          OnEnter = Edit1Enter
          OnExit = Edit1Exit
          OnKeyDown = Edit1KeyDown
        end
        object edPeso: TDBEdit
          Left = 70
          Top = 61
          Width = 51
          Height = 21
          CharCase = ecUpperCase
          DataField = 'PESO'
          DataSource = dm.dsQryReceitas
          TabOrder = 4
          OnEnter = Edit1Enter
          OnExit = Edit1Exit
          OnKeyDown = Edit1KeyDown
        end
        object edCalorias: TDBEdit
          Left = 129
          Top = 61
          Width = 51
          Height = 21
          CharCase = ecUpperCase
          DataField = 'CALORIAS'
          DataSource = dm.dsQryReceitas
          TabOrder = 5
          OnEnter = Edit1Enter
          OnExit = Edit1Exit
          OnKeyDown = Edit1KeyDown
        end
        object edProteinas: TDBEdit
          Left = 194
          Top = 61
          Width = 59
          Height = 21
          CharCase = ecUpperCase
          DataField = 'PROTEINAS'
          DataSource = dm.dsQryReceitas
          TabOrder = 6
          OnEnter = Edit1Enter
          OnExit = Edit1Exit
          OnKeyDown = Edit1KeyDown
        end
        object edCarboidratos: TDBEdit
          Left = 269
          Top = 61
          Width = 75
          Height = 21
          CharCase = ecUpperCase
          DataField = 'CARBOIDRATOS'
          DataSource = dm.dsQryReceitas
          TabOrder = 7
          OnEnter = Edit1Enter
          OnExit = Edit1Exit
          OnKeyDown = Edit1KeyDown
        end
      end
      object Panel4: TPanel
        Left = 1
        Top = 99
        Width = 788
        Height = 48
        Align = alTop
        TabOrder = 1
        object Label10: TLabel
          Left = 5
          Top = 6
          Width = 44
          Height = 13
          Caption = 'C'#243'digo:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object bt_pesq_item_estoque_barras: TSpeedButton
          Left = 75
          Top = 18
          Width = 22
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
        end
        object Label11: TLabel
          Left = 103
          Top = 4
          Width = 109
          Height = 13
          Caption = 'Descri'#231#227'o do '#237'tem:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label12: TLabel
          Left = 336
          Top = 3
          Width = 70
          Height = 13
          Caption = 'Quantidade:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label13: TLabel
          Left = 418
          Top = 4
          Width = 65
          Height = 13
          Caption = 'C'#243'd. Unid.:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label14: TLabel
          Left = 503
          Top = 1
          Width = 129
          Height = 13
          Caption = 'Descri'#231#227'o da unidade:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object bt_pesq_un_entrada: TSpeedButton
          Left = 476
          Top = 18
          Width = 22
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
        end
        object Panel5: TPanel
          Left = 100
          Top = 17
          Width = 237
          Height = 24
          BevelOuter = bvNone
          Enabled = False
          TabOrder = 4
          object ed_desc_item: TEdit
            Left = 1
            Top = 1
            Width = 230
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
        object BitBtn1: TBitBtn
          Left = 684
          Top = 14
          Width = 86
          Height = 25
          Caption = 'Adicionar'
          TabOrder = 3
          OnClick = BitBtn1Click
          Glyph.Data = {
            DE010000424DDE01000000000000760000002800000024000000120000000100
            0400000000006801000000000000000000001000000000000000000000000000
            8000008000000080800080000000800080008080000080808000C0C0C0000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
            3333333333333333333333330000333333333333333333333333F33333333333
            00003333344333333333333333377F3333333333000033334224333333333333
            337337F3333333330000333422224333333333333733337F3333333300003342
            222224333333333373333337F3333333000034222A22224333333337F337F333
            7F33333300003222A3A2224333333337F3737F337F33333300003A2A333A2224
            33333337F73337F337F33333000033A33333A222433333337333337F337F3333
            0000333333333A222433333333333337F337F33300003333333333A222433333
            333333337F337F33000033333333333A222433333333333337F337F300003333
            33333333A222433333333333337F337F00003333333333333A22433333333333
            3337F37F000033333333333333A223333333333333337F730000333333333333
            333A333333333333333337330000333333333333333333333333333333333333
            0000}
          NumGlyphs = 2
        end
        object ed_cod_item: TEdit
          Left = 4
          Top = 18
          Width = 69
          Height = 21
          TabOrder = 0
          OnEnter = Edit1Enter
          OnExit = Edit1Exit
          OnKeyDown = Edit1KeyDown
        end
        object edQtde: TCurrencyEdit
          Left = 338
          Top = 18
          Width = 65
          Height = 21
          AutoSize = False
          DisplayFormat = '0.000;'
          TabOrder = 1
          OnEnter = Edit1Enter
          OnExit = Edit1Exit
          OnKeyDown = Edit1KeyDown
        end
        object ed_cod_un_entrada: TEdit
          Left = 418
          Top = 18
          Width = 54
          Height = 21
          TabOrder = 2
          OnEnter = Edit1Enter
          OnExit = Edit1Exit
          OnKeyDown = Edit1KeyDown
        end
        object Panel7: TPanel
          Left = 502
          Top = 15
          Width = 181
          Height = 24
          BevelOuter = bvNone
          Enabled = False
          TabOrder = 5
          object ed_desc_un_entrada: TEdit
            Left = 2
            Top = 2
            Width = 176
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
      end
      object pn_grade: TPanel
        Left = 1
        Top = 147
        Width = 788
        Height = 183
        Align = alTop
        BevelInner = bvRaised
        BevelOuter = bvNone
        BevelWidth = 2
        TabOrder = 2
        object Label15: TLabel
          Left = 249
          Top = 1
          Width = 190
          Height = 19
          Caption = 'Ficha t'#233'cnica do produto'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label16: TLabel
          Left = 212
          Top = 164
          Width = 362
          Height = 14
          Caption = 
            'Para navegar na grade tecle F7 - Para excluir um '#237'tem tecle DELE' +
            'TE'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object dbg_ficha_tec: TDBGrid
          Left = 2
          Top = 19
          Width = 775
          Height = 142
          DataSource = dm.dsReceitasTemp
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clBlack
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = [fsBold]
          OnEnter = Edit1Enter
          OnExit = Edit1Exit
          Columns = <
            item
              Color = clBtnFace
              Expanded = False
              FieldName = 'codigoItem'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clNavy
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ReadOnly = True
              Title.Caption = 'C'#243'digo'
              Width = 71
              Visible = True
            end
            item
              Color = clBtnFace
              Expanded = False
              FieldName = 'descricaoItem'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clNavy
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ReadOnly = True
              Title.Caption = 'Descri'#231#227'o'
              Width = 330
              Visible = True
            end
            item
              Color = clBtnFace
              Expanded = False
              FieldName = 'descricaoUnidade'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clNavy
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ReadOnly = True
              Title.Caption = 'Unidade'
              Width = 208
              Visible = True
            end
            item
              Color = 16776176
              Expanded = False
              FieldName = 'quantidade'
              Title.Caption = 'Quantidade'
              Width = 109
              Visible = True
            end>
        end
      end
      object Panel6: TPanel
        Left = 1
        Top = 330
        Width = 788
        Height = 116
        Align = alClient
        TabOrder = 3
        object DBMemo1: TDBMemo
          Left = 8
          Top = 8
          Width = 521
          Height = 89
          DataField = 'PREPARO'
          DataSource = dm.dsQryReceitas
          TabOrder = 0
          OnEnter = Edit1Enter
          OnExit = Edit1Exit
        end
      end
    end
  end
  inherited pn_botoes: TPanel
    Top = 495
    Width = 792
    inherited bt_novo: TBitBtn
      Width = 99
    end
    inherited bt_alterar: TBitBtn
      Left = 199
      Width = 99
    end
    inherited bt_gravar: TBitBtn
      Left = 398
      Width = 99
    end
    inherited bt_cancelar: TBitBtn
      Left = 497
      Width = 99
    end
    inherited bt_sair: TBitBtn
      Left = 694
      Width = 99
    end
    inherited bt_excluir: TBitBtn
      Left = 298
      Width = 99
    end
    inherited bt_consultar: TBitBtn
      Left = 100
      Width = 99
    end
    inherited bt_imprimir: TBitBtn
      Left = 595
      Top = 2
      Width = 99
    end
  end
end
