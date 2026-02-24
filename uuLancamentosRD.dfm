inherited frmLancamentosRD: TfrmLancamentosRD
  Caption = 'Lan'#231'amentos RD'
  ClientHeight = 360
  ClientWidth = 689
  OldCreateOrder = True
  ExplicitWidth = 705
  ExplicitHeight = 399
  PixelsPerInch = 96
  TextHeight = 13
  inherited pn_principal: TPanel
    Width = 689
    Height = 315
    ExplicitWidth = 689
    ExplicitHeight = 315
    inherited pn_codigo: TPanel
      Width = 687
      ExplicitWidth = 687
      inherited bt_pesquisa: TSpeedButton
        Left = 83
        Top = 17
        Width = 27
        Height = 23
        ExplicitLeft = 83
        ExplicitTop = 17
        ExplicitWidth = 27
        ExplicitHeight = 23
      end
      object Label5: TLabel [1]
        Left = 4
        Top = 4
        Width = 100
        Height = 13
        Caption = 'C'#243'd. Lan'#231'amento'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      inherited ed_codigo: TMaskEdit
        Top = 18
        Width = 78
        ExplicitTop = 18
        ExplicitWidth = 78
      end
    end
    object Panel1: TPanel
      Left = -3
      Top = 47
      Width = 690
      Height = 58
      Caption = 'Panel1'
      TabOrder = 1
      object pnFornecedor: TPanel
        Left = 4
        Top = 3
        Width = 687
        Height = 55
        TabOrder = 0
        object Label6: TLabel
          Left = 389
          Top = 10
          Width = 89
          Height = 14
          Caption = 'Data documento'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label30: TLabel
          Left = 486
          Top = 9
          Width = 40
          Height = 14
          Caption = 'Data RD'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label4: TLabel
          Left = 579
          Top = 9
          Width = 57
          Height = 14
          Caption = 'N'#186' da Nota:'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object gpFornecedor: TGroupBox
          Left = 2
          Top = -3
          Width = 382
          Height = 56
          Caption = 'Dados do Fornecedor   '
          TabOrder = 0
          object Label2: TLabel
            Left = 2
            Top = 13
            Width = 40
            Height = 13
            Caption = 'C'#243'digo'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object bt_pesq_fornecedor: TSpeedButton
            Left = 46
            Top = 27
            Width = 19
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
          object Label1: TLabel
            Left = 71
            Top = 13
            Width = 80
            Height = 13
            Caption = 'Raz'#227'o Social:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object ed_cod_fornecedor: TDBEdit
            Left = 3
            Top = 29
            Width = 41
            Height = 21
            DataField = 'COD_FORNECEDOR'
            DataSource = dm.dsQryLancamentosRD
            TabOrder = 0
            OnEnter = Edit1Enter
            OnExit = Edit1Exit
            OnKeyDown = Edit1KeyDown
          end
          object Panel3: TPanel
            Left = 68
            Top = 24
            Width = 310
            Height = 24
            BevelOuter = bvNone
            Enabled = False
            TabOrder = 1
            object ed_razao_social_fornecedor: TDBEdit
              Left = 3
              Top = 5
              Width = 308
              Height = 21
              Color = clBlack
              DataField = 'RAZAO_SOCIAL'
              DataSource = dm.dsQryLancamentosRD
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clYellow
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              TabOrder = 0
            end
          end
          object Panel13: TPanel
            Left = 845
            Top = 24
            Width = 29
            Height = 24
            BevelOuter = bvNone
            Enabled = False
            TabOrder = 2
          end
        end
        object edDataEmissaoNotaFiscal: TDBDateEdit
          Left = 389
          Top = 25
          Width = 89
          Height = 21
          DataField = 'DATA_DOCUMENTO'
          DataSource = dm.dsQryLancamentosRD
          NumGlyphs = 2
          TabOrder = 1
          OnEnter = Edit1Enter
          OnExit = Edit1Exit
          OnKeyDown = Edit1KeyDown
        end
        object edDataEntradaNotaFiscal: TDBDateEdit
          Left = 485
          Top = 25
          Width = 89
          Height = 21
          DataField = 'DATA_RD'
          DataSource = dm.dsQryLancamentosRD
          NumGlyphs = 2
          TabOrder = 2
          OnEnter = Edit1Enter
          OnExit = Edit1Exit
          OnKeyDown = Edit1KeyDown
        end
        object edNumeroNotaFiscal: TDBEdit
          Left = 576
          Top = 23
          Width = 109
          Height = 21
          DataField = 'NUM_DOC'
          DataSource = dm.dsQryLancamentosRD
          TabOrder = 3
          OnEnter = Edit1Enter
          OnExit = Edit1Exit
          OnKeyDown = Edit1KeyDown
        end
      end
    end
    object Panel2: TPanel
      Left = 0
      Top = 107
      Width = 439
      Height = 42
      TabOrder = 2
      object bt_pesq_grupo: TSpeedButton
        Left = 65
        Top = 15
        Width = 24
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
      object Label3: TLabel
        Left = 5
        Top = 0
        Width = 39
        Height = 13
        Caption = 'Grupo:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label43: TLabel
        Left = 93
        Top = -1
        Width = 114
        Height = 13
        Caption = 'Descri'#231#227'o do Grupo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Panel4: TPanel
        Tag = 99
        Left = 89
        Top = 12
        Width = 209
        Height = 27
        BevelOuter = bvNone
        Enabled = False
        TabOrder = 0
        object ed_desc_grupo: TEdit
          Left = 3
          Top = 4
          Width = 202
          Height = 21
          CharCase = ecUpperCase
          Color = clBlack
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clYellow
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          MaxLength = 3
          ParentFont = False
          TabOrder = 0
        end
      end
      object btAdicionar: TBitBtn
        Left = 390
        Top = 6
        Width = 46
        Height = 32
        Glyph.Data = {
          36030000424D3603000000000000360000002800000010000000100000000100
          18000000000000030000EB0A0000EB0A00000000000000000000FFFFFFFFFFFF
          FFFFFFFFFFFFF7F7F7E9E9E9DEDEDED9D9D9D9D9D9DEDEDEE8E8E8F6F6F6FEFE
          FEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCFCFCEBEBEBC8C8C89D9D9D7E7E7E71
          71717171717C7C7C9A9A9AC4C4C4E9E9E9FCFCFCFFFFFFFFFFFFFFFFFFFCFCFC
          E5E5E59FAB9F518351217217146C02146A01206B14477647616A61737373A9A9
          A9E2E2E2FCFCFCFFFFFFFFFFFFECECEC7CA97C0A81090990000794000A8F0016
          86002C7700386A001B6905567A56696969A8A8A8E8E8E8FFFFFFF8F8F889B889
          048D0705A40A049F0933CC6666FF9966FF9966FF990B89003B6D01276B02567A
          56737373C4C4C4F7F7F7D1E0D1138E170BA8170AA3160AA315539B51FFF8FFFF
          F7FF66FF990099000191003B6C001B6B056169619A9A9AE8E8E86CAB6C2AB138
          0FA92311AA2310A922539B51FFF9FFFFFAFF66FF99029B06009A001089003A6C
          014776477C7C7CDEDEDE30983039C05033CC6666FF9966FF9933CC66F9F4F9FE
          F7FC66FF9966FF9966FF9966FF99357501206F14717171DADADA1D982343C55E
          539B51FCE9F9F0E4ECF1EBF0F1EFF1F5F3F4FFF8FCFFF8FFFFF4FF66FF991D83
          00146D00717171DADADA209C2659D077539B51FDECFDF2E9F2F0EBF0ECEBECEF
          EEEFF8F3F8FFF8FFFFF5FF66FF99118E00126E007D7D7DDEDEDE36A3387ADF9A
          539B51539B51539B518EC18EF1EBF1F2ECF133CC66539B51539B5133CC661195
          042175179D9D9DE9E9E979BD7971D78E51D47C2ECA602FC960539B51F2E8F2F0
          E4ED66FF9914AD2B0EA72007A312139106508450C8C8C8F7F7F7E7F5E731AA36
          8CE8B03ACF6D2FCB64539B51FEECFEFCE7F766FF9916AF2E11AA220AA9181084
          0B9FAC9FEBEBEBFFFFFFFFFFFFAADFAA3FB84F8AE9B04CD57B219827539B5153
          9B5133CC6616B02F12B02707920C7CAA7CE5E5E5FCFCFCFFFFFFFFFFFFFFFFFF
          AADFAA31AB3775DB9476E19D50D2783BC65F30C05024B23911911589BA89ECEC
          ECFCFCFCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE7F5E779BD793BA73C25A22C22
          9E28329D336CAE6CD1E1D1F8F8F8FFFFFFFFFFFFFFFFFFFFFFFF}
        TabOrder = 3
        OnClick = btAdicionarClick
      end
      object edValor: TCurrencyEdit
        Left = 295
        Top = 13
        Width = 92
        Height = 21
        AutoSize = False
        DisplayFormat = 'R$ 0.00;'
        TabOrder = 2
        OnEnter = Edit1Enter
        OnExit = Edit1Exit
        OnKeyDown = Edit1KeyDown
      end
      object ed_cod_grupo: TEdit
        Left = 4
        Top = 17
        Width = 58
        Height = 21
        CharCase = ecUpperCase
        TabOrder = 1
        OnEnter = Edit1Enter
        OnExit = Edit1Exit
        OnKeyDown = Edit1KeyDown
      end
    end
    object Panel5: TPanel
      Left = 0
      Top = 150
      Width = 438
      Height = 136
      TabOrder = 3
      object DBGrid1: TDBGrid
        Left = 2
        Top = 5
        Width = 431
        Height = 129
        DataSource = dm.dsLancamentosRDTemp
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        OnDrawColumnCell = DBGrid1DrawColumnCell
        OnEnter = Edit1Enter
        OnExit = Edit1Exit
        Columns = <
          item
            Expanded = False
            FieldName = 'COD_GRUPO'
            Title.Caption = 'C'#243'd. Grupo'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -13
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'descricao'
            Title.Caption = 'Descri'#231#227'o'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -13
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 190
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'valor'
            Title.Caption = 'Valor'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -13
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 118
            Visible = True
          end>
      end
    end
    object Panel6: TPanel
      Left = 439
      Top = 106
      Width = 248
      Height = 41
      Caption = 'Observa'#231#245'es'
      TabOrder = 4
    end
    object Panel7: TPanel
      Left = 438
      Top = 149
      Width = 248
      Height = 164
      Caption = 'Panel6'
      TabOrder = 5
      object memoObs: TMemo
        Left = 2
        Top = 1
        Width = 241
        Height = 161
        TabOrder = 0
      end
    end
    object Panel8: TPanel
      Left = 1
      Top = 287
      Width = 437
      Height = 26
      BevelOuter = bvLowered
      Enabled = False
      TabOrder = 6
      object Label7: TLabel
        Left = 250
        Top = 8
        Width = 34
        Height = 13
        Caption = 'Total:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object edTotalLancamentos: TCurrencyEdit
        Left = 289
        Top = 3
        Width = 147
        Height = 21
        AutoSize = False
        Color = clBlack
        DisplayFormat = 'R$ 0.00;'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clYellow
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        OnEnter = Edit1Enter
        OnExit = Edit1Exit
        OnKeyDown = Edit1KeyDown
      end
    end
  end
  inherited pn_botoes: TPanel
    Top = 315
    Width = 689
    Height = 45
    ExplicitTop = 315
    ExplicitWidth = 689
    ExplicitHeight = 45
    inherited bt_novo: TBitBtn
      Width = 129
      Height = 43
      ExplicitWidth = 129
      ExplicitHeight = 43
    end
    inherited bt_alterar: TBitBtn
      Top = -64
      Visible = False
      ExplicitTop = -64
    end
    inherited bt_gravar: TBitBtn
      Left = 271
      Width = 142
      Height = 43
      ExplicitLeft = 271
      ExplicitWidth = 142
      ExplicitHeight = 43
    end
    inherited bt_cancelar: TBitBtn
      Left = 415
      Width = 137
      Height = 43
      ExplicitLeft = 415
      ExplicitWidth = 137
      ExplicitHeight = 43
    end
    inherited bt_sair: TBitBtn
      Left = 552
      Width = 137
      Height = 43
      ExplicitLeft = 552
      ExplicitWidth = 137
      ExplicitHeight = 43
    end
    inherited bt_excluir: TBitBtn
      Left = 130
      Width = 141
      Height = 43
      ExplicitLeft = 130
      ExplicitWidth = 141
      ExplicitHeight = 43
    end
    inherited bt_consultar: TBitBtn
      Top = -64
      Visible = False
      ExplicitTop = -64
    end
    inherited bt_imprimir: TBitBtn
      Top = -63
      Visible = False
      ExplicitTop = -63
    end
  end
  object PopupMenu1: TPopupMenu
    Left = 199
    Top = 59
    object Excluir1: TMenuItem
      Caption = 'Excluir'
      OnClick = Excluir1Click
    end
  end
end
