inherited frmCadGarcons: TfrmCadGarcons
  Left = 765
  Top = 203
  Caption = 'Cadastro de Gar'#231'ons'
  ClientHeight = 198
  ClientWidth = 306
  OldCreateOrder = True
  ExplicitWidth = 322
  ExplicitHeight = 237
  PixelsPerInch = 96
  TextHeight = 13
  inherited pn_principal: TPanel
    Width = 306
    Height = 156
    ExplicitWidth = 306
    ExplicitHeight = 156
    inherited pn_codigo: TPanel
      Width = 304
      ExplicitWidth = 304
      inherited bt_pesquisa: TSpeedButton
        Left = 43
        Top = 20
        Height = 21
        ExplicitLeft = 43
        ExplicitTop = 20
        ExplicitHeight = 21
      end
      object Label2: TLabel [1]
        Left = 4
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
        Width = 38
        ExplicitWidth = 38
      end
    end
    object Panel1: TPanel
      Left = 1
      Top = 47
      Width = 304
      Height = 108
      Align = alClient
      TabOrder = 1
      object Label6: TLabel
        Left = 7
        Top = 12
        Width = 98
        Height = 13
        Caption = 'Nome do gar'#231'on:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object ed_nome_garcon: TDBEdit
        Left = 6
        Top = 28
        Width = 227
        Height = 21
        CharCase = ecUpperCase
        DataField = 'APELIDO'
        DataSource = dm.ds_qry_garcons
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        OnExit = Edit1Exit
        OnKeyDown = Edit1KeyDown
      end
      object pn_metres: TPanel
        Left = 0
        Top = 56
        Width = 345
        Height = 49
        BevelOuter = bvNone
        TabOrder = 2
        object Label8: TLabel
          Left = 6
          Top = 2
          Width = 27
          Height = 13
          Caption = 'C'#243'd.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object bt_pesq_metre: TSpeedButton
          Left = 44
          Top = 20
          Width = 22
          Height = 19
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
        object Label1: TLabel
          Left = 69
          Top = 0
          Width = 166
          Height = 13
          Caption = 'Nome do Maitre respons'#225'vel:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object ed_cod_metre: TDBEdit
          Left = 7
          Top = 18
          Width = 35
          Height = 21
          CharCase = ecUpperCase
          DataField = 'COD_METRE'
          DataSource = dm.ds_qry_garcons
          TabOrder = 0
          OnExit = Edit1Exit
          OnKeyDown = Edit1KeyDown
        end
        object Panel2: TPanel
          Left = 68
          Top = 12
          Width = 222
          Height = 27
          BevelOuter = bvNone
          Enabled = False
          TabOrder = 1
          object ed_nome_metre: TDBEdit
            Left = 1
            Top = 5
            Width = 216
            Height = 21
            CharCase = ecUpperCase
            Color = clBlack
            DataField = 'APELIDO1'
            DataSource = dm.ds_qry_garcons
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
      object ckb_metre: TDBCheckBox
        Left = 239
        Top = 30
        Width = 66
        Height = 17
        Caption = 'Maitre'
        DataField = 'METRE'
        DataSource = dm.ds_qry_garcons
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
        ValueChecked = '1'
        ValueUnchecked = '0'
        OnClick = ckb_metreClick
        OnExit = Edit1Exit
        OnKeyDown = Edit1KeyDown
      end
    end
  end
  inherited pn_botoes: TPanel
    Top = 156
    Width = 306
    ExplicitTop = 156
    ExplicitWidth = 306
    inherited bt_novo: TBitBtn
      Width = 50
      Caption = 'Novo'
      ExplicitWidth = 50
    end
    inherited bt_alterar: TBitBtn
      Left = 101
      Width = 50
      Caption = 'Alterar'
      ExplicitLeft = 101
      ExplicitWidth = 50
    end
    inherited bt_gravar: TBitBtn
      Left = 152
      Width = 50
      Caption = 'Gravar'
      ExplicitLeft = 152
      ExplicitWidth = 50
    end
    inherited bt_cancelar: TBitBtn
      Left = 202
      Width = 50
      Caption = 'Cancelar'
      ExplicitLeft = 202
      ExplicitWidth = 50
    end
    inherited bt_sair: TBitBtn
      Left = 252
      Width = 50
      Caption = 'S&air'
      ExplicitLeft = 252
      ExplicitWidth = 50
    end
    inherited bt_excluir: TBitBtn
      Left = 151
      Top = -43
      Width = 50
      Caption = 'Excluir'
      Visible = False
      ExplicitLeft = 151
      ExplicitTop = -43
      ExplicitWidth = 50
    end
    inherited bt_consultar: TBitBtn
      Left = 51
      Width = 50
      Caption = 'Consultar'
      ExplicitLeft = 51
      ExplicitWidth = 50
    end
    inherited bt_imprimir: TBitBtn
      Left = 427
      Top = -61
      Visible = False
      ExplicitLeft = 427
      ExplicitTop = -61
    end
  end
end
