inherited frmCadObsPreparo: TfrmCadObsPreparo
  Left = 350
  Top = 325
  Caption = 'Observa'#231#245'es de Preparo'
  ClientHeight = 150
  ClientWidth = 352
  OldCreateOrder = True
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  inherited pn_principal: TPanel
    Width = 352
    Height = 108
    inherited pn_codigo: TPanel
      Width = 350
      inherited bt_pesquisa: TSpeedButton
        Left = 51
        Top = 20
        Width = 25
        Height = 24
      end
      object Label1: TLabel [1]
        Left = 2
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
      inherited ed_codigo: TMaskEdit
        Width = 46
      end
    end
    object Panel1: TPanel
      Left = 1
      Top = 47
      Width = 350
      Height = 58
      Align = alTop
      TabOrder = 1
      object Label2: TLabel
        Left = 4
        Top = 3
        Width = 5
        Height = 20
        Caption = #39
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object SpeedButton1: TSpeedButton
        Left = 51
        Top = 20
        Width = 25
        Height = 24
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
        OnClick = bt_pesquisaClick
      end
      object edDescricaoObsPreparo: TDBEdit
        Left = 3
        Top = 24
        Width = 334
        Height = 28
        CharCase = ecUpperCase
        DataField = 'DESCRICAO'
        DataSource = dm.dsQryObservacoesPreparo
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        OnKeyDown = Edit1KeyDown
      end
    end
  end
  inherited pn_botoes: TPanel
    Top = 108
    Width = 352
    inherited bt_novo: TBitBtn
      Width = 50
      Caption = 'Novo'
    end
    inherited bt_alterar: TBitBtn
      Left = 101
      Width = 50
      Caption = 'Alterar'
    end
    inherited bt_gravar: TBitBtn
      Left = 201
      Width = 50
      Caption = 'Gravar'
    end
    inherited bt_cancelar: TBitBtn
      Left = 251
      Width = 50
      Caption = 'Cancelar'
    end
    inherited bt_sair: TBitBtn
      Left = 300
      Width = 50
      Caption = 'S&air'
    end
    inherited bt_excluir: TBitBtn
      Left = 151
      Width = 50
      Caption = 'Excluir'
    end
    inherited bt_consultar: TBitBtn
      Left = 51
      Width = 50
      Caption = 'Consultar'
    end
    inherited bt_imprimir: TBitBtn
      Top = -48
      Caption = '&Imprimir'
      Visible = False
    end
  end
end
