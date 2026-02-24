inherited frm_rel_produtos: Tfrm_rel_produtos
  Left = 410
  Top = 300
  Width = 619
  Height = 188
  Caption = 'Relat'#243'rio de Produtos'
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel2: TPanel
    Width = 611
    Height = 161
    inherited ckb_tipo: TCheckBox
      Top = 32
    end
    inherited pn_grupos: TPanel
      Left = 192
      Top = 8
    end
    inherited Panel1: TPanel
      Top = 115
      Width = 609
      inherited bt_selecionar: TBitBtn
        Caption = 'Imprimir'
        OnClick = bt_selecionarClick
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000130B0000130B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00300000000000
          00033FFFFFFFFFFFFFFF0888888888888880777777777777777F088888888888
          8880777777777777777F0000000000000000FFFFFFFFFFFFFFFF0F8F8F8F8F8F
          8F80777777777777777F08F8F8F8F8F8F9F0777777777777777F0F8F8F8F8F8F
          8F807777777777777F7F0000000000000000777777777777777F3330FFFFFFFF
          03333337F3FFFF3F7F333330F0000F0F03333337F77773737F333330FFFFFFFF
          03333337F3FF3FFF7F333330F00F000003333337F773777773333330FFFF0FF0
          33333337F3FF7F3733333330F08F0F0333333337F7737F7333333330FFFF0033
          33333337FFFF7733333333300000033333333337777773333333}
      end
      inherited bt_cancelar: TBitBtn
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000120B0000120B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00330000000000
          03333377777777777F333301BBBBBBBB033333773F3333337F3333011BBBBBBB
          0333337F73F333337F33330111BBBBBB0333337F373F33337F333301110BBBBB
          0333337F337F33337F333301110BBBBB0333337F337F33337F333301110BBBBB
          0333337F337F33337F333301110BBBBB0333337F337F33337F333301110BBBBB
          0333337F337F33337F333301110BBBBB0333337F337FF3337F33330111B0BBBB
          0333337F337733337F333301110BBBBB0333337F337F33337F333301110BBBBB
          0333337F3F7F33337F333301E10BBBBB0333337F7F7F33337F333301EE0BBBBB
          0333337F777FFFFF7F3333000000000003333377777777777333}
      end
    end
    object CheckBox1: TCheckBox
      Left = 8
      Top = 80
      Width = 185
      Height = 17
      Caption = 'Somente Al'#237'quota Informada'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 3
      OnClick = ckb_tipoClick
      OnExit = Edit1Exit
      OnKeyDown = Edit1KeyDown
    end
    object Panel4: TPanel
      Left = 195
      Top = 58
      Width = 404
      Height = 52
      BevelOuter = bvNone
      TabOrder = 4
      object Label3: TLabel
        Left = 93
        Top = 4
        Width = 47
        Height = 13
        Caption = 'Aliquota'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label4: TLabel
        Left = 1
        Top = 3
        Width = 56
        Height = 13
        Caption = 'C'#243'd. Aliq.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object SpeedButton1: TSpeedButton
        Left = 60
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
      object Panel5: TPanel
        Left = 85
        Top = 17
        Width = 156
        Height = 26
        BevelOuter = bvNone
        Enabled = False
        TabOrder = 0
        object edDescAliquota: TMaskEdit
          Left = 8
          Top = 3
          Width = 136
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
      object edCodAliquota: TMaskEdit
        Left = 0
        Top = 19
        Width = 50
        Height = 21
        TabOrder = 1
        OnExit = Edit1Exit
        OnKeyDown = Edit1KeyDown
      end
    end
  end
end
