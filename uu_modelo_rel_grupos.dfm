inherited frm_modelo_rel_grupos: Tfrm_modelo_rel_grupos
  Width = 426
  Height = 172
  Caption = ''
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited botao_pesquisa: TSpeedButton
    Top = 2
  end
  inherited Edit1: TEdit
    Top = -33
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 418
    Height = 145
    Align = alClient
    TabOrder = 1
    object ckb_tipo: TCheckBox
      Left = 8
      Top = 24
      Width = 185
      Height = 17
      Caption = 'Somente grupo selecionado'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      OnClick = ckb_tipoClick
      OnExit = Edit1Exit
      OnKeyDown = Edit1KeyDown
    end
    object pn_grupos: TPanel
      Left = 8
      Top = 48
      Width = 404
      Height = 52
      BevelOuter = bvNone
      Enabled = False
      TabOrder = 1
      object Label1: TLabel
        Left = 109
        Top = 4
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
      object Label2: TLabel
        Left = 9
        Top = 3
        Width = 65
        Height = 13
        Caption = 'C'#243'd. Grupo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object bt_pesq_grupo: TSpeedButton
        Left = 76
        Top = 19
        Width = 23
        Height = 22
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
        NumGlyphs = 2
        OnClick = botao_pesquisaClick
      end
      object Panel3: TPanel
        Left = 101
        Top = 17
        Width = 304
        Height = 26
        BevelOuter = bvNone
        Enabled = False
        TabOrder = 0
        object ed_desc_grupo: TMaskEdit
          Left = 8
          Top = 3
          Width = 289
          Height = 21
          Color = clBlack
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clYellow
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 0
          OnKeyDown = Edit1KeyDown
        end
      end
      object ed_cod_grupo: TMaskEdit
        Left = 0
        Top = 19
        Width = 72
        Height = 21
        TabOrder = 1
        OnExit = Edit1Exit
        OnKeyDown = Edit1KeyDown
      end
    end
    object Panel1: TPanel
      Left = 1
      Top = 99
      Width = 416
      Height = 45
      Align = alBottom
      TabOrder = 2
      OnClick = Panel1Click
      object bt_selecionar: TBitBtn
        Left = 2
        Top = 3
        Width = 206
        Height = 40
        Caption = 'Selecionar'
        TabOrder = 0
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000000000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00300000000000
          00033FFFFFFFFFFFFFFF0888888888888880777777777777777F088888888888
          8880777777777777777F0000000000000000FFFFFFFFFFFFFFFF0F8F8F8F8F8F
          8F80777777777777777F08F8F8F8F8F8F9F0777777777777777F0F8F8F8F8F8F
          8F807777777777777F7F0000000000000000777777777777777F3330FFFFFFFF
          03333337F3FFFF3F7F333330F0000F0F03333337F77773737F333330FFFFFFFF
          03333337F3FF3FFF7F333330F00F000003333337F773777773333330FFFF0FF0
          33333337F3FF7F3733333330F08F0F0333333337F7737F7333333330FFFF0033
          33333337FFFF7733333333300000033333333337777773333333}
        NumGlyphs = 2
      end
      object bt_cancelar: TBitBtn
        Left = 208
        Top = 4
        Width = 206
        Height = 39
        Caption = 'Fechar'
        TabOrder = 1
        OnClick = bt_cancelarClick
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000120B0000120B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00330000000000
          03333377777777777F333301111111110333337F333333337F33330111111111
          0333337F333333337F333301111111110333337F333333337F33330111111111
          0333337F333333337F333301111111110333337F333333337F33330111111111
          0333337F3333333F7F333301111111B10333337F333333737F33330111111111
          0333337F333333337F333301111111110333337F33FFFFF37F3333011EEEEE11
          0333337F377777F37F3333011EEEEE110333337F37FFF7F37F3333011EEEEE11
          0333337F377777337F333301111111110333337F333333337F33330111111111
          0333337FFFFFFFFF7F3333000000000003333377777777777333}
        NumGlyphs = 2
      end
    end
  end
end
