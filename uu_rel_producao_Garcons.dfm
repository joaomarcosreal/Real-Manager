inherited frmRelProducaoGarcons: TfrmRelProducaoGarcons
  Left = 393
  Top = 142
  Caption = 'Relat'#243'rio de produ'#231#227'o de Gar'#231'ons'
  ClientHeight = 384
  ClientWidth = 372
  ExplicitWidth = 388
  ExplicitHeight = 423
  PixelsPerInch = 96
  TextHeight = 13
  inherited frm_modelo_rel_datas: TPanel
    Top = 61
    Width = 372
    Height = 323
    ExplicitTop = 61
    ExplicitWidth = 372
    ExplicitHeight = 323
    inherited RadioGroup1: TRadioGroup
      Left = 16
      Width = 328
      TabOrder = 4
      ExplicitLeft = 16
      ExplicitWidth = 328
    end
    inherited Panel5: TPanel
      Left = 29
      TabOrder = 0
      ExplicitLeft = 29
    end
    inherited Panel2: TPanel
      Top = 278
      Width = 370
      Height = 44
      TabOrder = 6
      ExplicitTop = 278
      ExplicitWidth = 370
      ExplicitHeight = 44
      inherited bt_imprimir: TBitBtn
        Left = 1
        Width = 184
        Height = 40
        OnClick = bt_imprimirClick
        ExplicitLeft = 1
        ExplicitWidth = 184
        ExplicitHeight = 40
      end
      inherited bt_sair: TBitBtn
        Left = 185
        Top = 2
        Width = 184
        Height = 40
        ExplicitLeft = 185
        ExplicitTop = 2
        ExplicitWidth = 184
        ExplicitHeight = 40
      end
    end
    object ckbComissionado: TCheckBox
      Left = 4
      Top = 254
      Width = 229
      Height = 19
      Caption = 'Somente produtos Comissionados'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
    end
    object RadioGroup3: TRadioGroup
      Left = 17
      Top = 85
      Width = 328
      Height = 74
      Caption = 'Gar'#231'ons'
      Color = clBtnFace
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Verdana'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
      TabOrder = 7
    end
    object Panel4: TPanel
      Left = 33
      Top = 103
      Width = 276
      Height = 46
      BevelOuter = bvNone
      Caption = 'Panel3'
      TabOrder = 2
      object Label3: TLabel
        Left = 4
        Top = 5
        Width = 72
        Height = 13
        Caption = 'Cod. Garcon'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object bt_pesq_garcon: TSpeedButton
        Left = 59
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
        OnClick = botao_pesquisaClick
      end
      object Label4: TLabel
        Left = 85
        Top = 6
        Width = 96
        Height = 13
        Caption = 'Nome do Gar'#231'on'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Panel6: TPanel
        Left = 86
        Top = 18
        Width = 184
        Height = 27
        BevelOuter = bvNone
        Enabled = False
        TabOrder = 1
        object ed_nome_garcon: TEdit
          Left = 2
          Top = 2
          Width = 219
          Height = 21
          CharCase = ecUpperCase
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
      object ed_cod_garcon: TEdit
        Left = 6
        Top = 20
        Width = 51
        Height = 21
        CharCase = ecUpperCase
        TabOrder = 0
        OnChange = ed_cod_garconChange
        OnExit = Edit1Exit
        OnKeyDown = Edit1KeyDown
      end
    end
    object RadioGroup2: TRadioGroup
      Left = 18
      Top = 174
      Width = 326
      Height = 74
      Caption = 'Grupo de produtos'
      Color = clBtnFace
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Verdana'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
      TabOrder = 5
    end
    object Panel3: TPanel
      Left = 22
      Top = 187
      Width = 309
      Height = 46
      BevelOuter = bvNone
      Caption = 'Panel3'
      TabOrder = 3
      object Label15: TLabel
        Left = 4
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
        Left = 59
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
        OnClick = botao_pesquisaClick
      end
      object Label16: TLabel
        Left = 85
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
      object Panel1: TPanel
        Left = 85
        Top = 18
        Width = 227
        Height = 27
        BevelOuter = bvNone
        Enabled = False
        TabOrder = 1
        object ed_desc_grupo: TEdit
          Left = 2
          Top = 2
          Width = 220
          Height = 21
          CharCase = ecUpperCase
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
      object ed_cod_grupo: TEdit
        Left = 6
        Top = 20
        Width = 51
        Height = 21
        CharCase = ecUpperCase
        TabOrder = 0
        OnChange = ed_cod_grupoChange
        OnExit = Edit1Exit
        OnKeyDown = Edit1KeyDown
      end
    end
  end
  object Panel7: TPanel [3]
    Tag = 99
    Left = 0
    Top = 0
    Width = 372
    Height = 61
    Align = alTop
    Color = clBlack
    TabOrder = 2
    object Label5: TLabel
      Left = 40
      Top = 8
      Width = 275
      Height = 20
      Caption = 'Produ'#231#227'o de Gar'#231'ons (Detalhado)'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clYellow
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label6: TLabel
      Left = 9
      Top = 34
      Width = 350
      Height = 13
      Caption = 'Informe o per'#237'odo desejado com os filtros que deseja analisar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clLime
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
  end
end
