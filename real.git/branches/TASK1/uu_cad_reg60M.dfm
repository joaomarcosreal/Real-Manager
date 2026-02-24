inherited frmCadReg60M: TfrmCadReg60M
  Left = 390
  Top = 236
  Caption = 'Entrada de dados de Redu'#231#245'es Z'
  ClientHeight = 232
  ClientWidth = 705
  OldCreateOrder = True
  ExplicitWidth = 713
  ExplicitHeight = 259
  PixelsPerInch = 96
  TextHeight = 13
  object Label10: TLabel [0]
    Left = 93
    Top = 98
    Width = 75
    Height = 13
    Caption = 'Substitui'#231#227'o:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  inherited pn_principal: TPanel
    Width = 705
    Height = 190
    ExplicitWidth = 705
    ExplicitHeight = 190
    inherited pn_codigo: TPanel
      Width = 703
      ExplicitWidth = 703
      inherited bt_pesquisa: TSpeedButton
        Left = 91
        Top = 20
        ExplicitLeft = 91
        ExplicitTop = 20
      end
      inherited ed_codigo: TMaskEdit
        Width = 86
        ExplicitWidth = 86
      end
    end
    object Panel1: TPanel
      Left = 1
      Top = 47
      Width = 703
      Height = 142
      Align = alClient
      TabOrder = 1
      object Label1: TLabel
        Left = 6
        Top = 10
        Width = 28
        Height = 13
        Caption = 'Data'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label2: TLabel
        Left = 82
        Top = 11
        Width = 97
        Height = 13
        Caption = 'Impresora Fiscal:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label3: TLabel
        Left = 278
        Top = 10
        Width = 65
        Height = 13
        Caption = 'COO Inicial'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label4: TLabel
        Left = 358
        Top = 10
        Width = 58
        Height = 13
        Caption = 'COO Final'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label5: TLabel
        Left = 436
        Top = 10
        Width = 83
        Height = 13
        Caption = 'Cont. Rein'#237'cio'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label6: TLabel
        Left = 532
        Top = 10
        Width = 74
        Height = 13
        Caption = 'Cont. Red. Z'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label9: TLabel
        Left = 6
        Top = 89
        Width = 75
        Height = 13
        Caption = 'Substitui'#231#227'o:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label11: TLabel
        Left = 96
        Top = 89
        Width = 50
        Height = 13
        Caption = 'Isen'#231#227'o:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label12: TLabel
        Left = 186
        Top = 89
        Width = 82
        Height = 13
        Caption = 'N'#227'o tributado:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label13: TLabel
        Left = 5
        Top = 50
        Width = 91
        Height = 13
        Caption = 'Cancelamentos:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label14: TLabel
        Left = 191
        Top = 48
        Width = 69
        Height = 13
        Caption = 'Al'#237'quota 7%'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label15: TLabel
        Left = 283
        Top = 48
        Width = 76
        Height = 13
        Caption = 'Al'#237'quota 12%'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label16: TLabel
        Left = 375
        Top = 48
        Width = 76
        Height = 13
        Caption = 'Al'#237'quota 17%'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label17: TLabel
        Left = 466
        Top = 50
        Width = 76
        Height = 13
        Caption = 'Al'#237'quota 25%'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label7: TLabel
        Left = 100
        Top = 50
        Width = 65
        Height = 13
        Caption = 'Descontos:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object edData: TDBEdit
        Left = 4
        Top = 23
        Width = 73
        Height = 21
        DataField = 'DATA'
        DataSource = dm.dsQryReg60M
        TabOrder = 0
        OnKeyDown = Edit1KeyDown
      end
      object lkNumeroSerie: TDBLookupComboBox
        Left = 82
        Top = 24
        Width = 190
        Height = 21
        DataField = 'NUM_SERIE'
        DataSource = dm.dsQryReg60M
        KeyField = 'NUM_SERIE'
        ListField = 'DESCRICAO'
        ListSource = dm.dsQryECFS
        TabOrder = 1
        OnKeyDown = Edit1KeyDown
      end
      object DBEdit1: TDBEdit
        Left = 276
        Top = 23
        Width = 73
        Height = 21
        DataField = 'COO_INI'
        DataSource = dm.dsQryReg60M
        TabOrder = 2
        OnKeyDown = Edit1KeyDown
      end
      object DBEdit2: TDBEdit
        Left = 356
        Top = 23
        Width = 73
        Height = 21
        DataField = 'COO_FIM'
        DataSource = dm.dsQryReg60M
        TabOrder = 3
        OnKeyDown = Edit1KeyDown
      end
      object DBEdit3: TDBEdit
        Left = 434
        Top = 23
        Width = 87
        Height = 21
        DataField = 'CO_REIN_OP'
        DataSource = dm.dsQryReg60M
        TabOrder = 4
        OnKeyDown = Edit1KeyDown
      end
      object DBEdit4: TDBEdit
        Left = 530
        Top = 23
        Width = 79
        Height = 21
        DataField = 'CONT_Z'
        DataSource = dm.dsQryReg60M
        TabOrder = 5
        OnKeyDown = Edit1KeyDown
      end
      object DBEdit7: TDBEdit
        Left = 7
        Top = 103
        Width = 85
        Height = 21
        DataField = 'SUBSTITUICAO'
        DataSource = dm.dsQryReg60M
        TabOrder = 12
        OnKeyDown = Edit1KeyDown
      end
      object DBEdit10: TDBEdit
        Left = 6
        Top = 64
        Width = 85
        Height = 21
        DataField = 'CANCELAMENTOS'
        DataSource = dm.dsQryReg60M
        TabOrder = 6
        OnKeyDown = Edit1KeyDown
      end
      object DBEdit13: TDBEdit
        Left = 375
        Top = 65
        Width = 85
        Height = 21
        DataField = 'ALIQ17'
        DataSource = dm.dsQryReg60M
        TabOrder = 10
        OnKeyDown = Edit1KeyDown
      end
      object DBEdit14: TDBEdit
        Left = 465
        Top = 64
        Width = 85
        Height = 21
        DataField = 'ALIQ25'
        DataSource = dm.dsQryReg60M
        TabOrder = 11
        OnKeyDown = Edit1KeyDown
      end
      object DBEdit8: TDBEdit
        Left = 97
        Top = 102
        Width = 85
        Height = 21
        DataField = 'ISENCAO'
        DataSource = dm.dsQryReg60M
        TabOrder = 13
        OnKeyDown = Edit1KeyDown
      end
      object DBEdit9: TDBEdit
        Left = 187
        Top = 102
        Width = 85
        Height = 21
        DataField = 'NAOTRIBUTADO'
        DataSource = dm.dsQryReg60M
        TabOrder = 14
        OnKeyDown = Edit1KeyDown
      end
      object DBEdit11: TDBEdit
        Left = 188
        Top = 65
        Width = 85
        Height = 21
        DataField = 'ALIQ7'
        DataSource = dm.dsQryReg60M
        TabOrder = 8
        OnKeyDown = Edit1KeyDown
      end
      object DBEdit12: TDBEdit
        Left = 281
        Top = 65
        Width = 85
        Height = 21
        DataField = 'ALIQ12'
        DataSource = dm.dsQryReg60M
        TabOrder = 9
        OnKeyDown = Edit1KeyDown
      end
      object DBEdit5: TDBEdit
        Left = 99
        Top = 63
        Width = 83
        Height = 21
        DataField = 'DESCONTOS'
        DataSource = dm.dsQryReg60M
        TabOrder = 7
        OnKeyDown = Edit1KeyDown
      end
    end
  end
  inherited pn_botoes: TPanel
    Top = 190
    Width = 705
    ExplicitTop = 190
    ExplicitWidth = 705
    inherited bt_novo: TBitBtn
      Width = 90
      ExplicitWidth = 90
    end
    inherited bt_alterar: TBitBtn
      Left = 91
      Width = 90
      ExplicitLeft = 91
      ExplicitWidth = 90
    end
    inherited bt_gravar: TBitBtn
      Left = 271
      Top = 3
      Width = 90
      ExplicitLeft = 271
      ExplicitTop = 3
      ExplicitWidth = 90
    end
    inherited bt_cancelar: TBitBtn
      Left = 362
      Width = 90
      ExplicitLeft = 362
      ExplicitWidth = 90
    end
    inherited bt_sair: TBitBtn
      Left = 624
      Width = 81
      TabOrder = 8
      ExplicitLeft = 624
      ExplicitWidth = 81
    end
    inherited bt_excluir: TBitBtn
      Left = 181
      Top = 3
      Width = 90
      ExplicitLeft = 181
      ExplicitTop = 3
      ExplicitWidth = 90
    end
    inherited bt_consultar: TBitBtn
      Left = 100
      Top = -56
      Width = 90
      Visible = False
      ExplicitLeft = 100
      ExplicitTop = -56
      ExplicitWidth = 90
    end
    inherited bt_imprimir: TBitBtn
      Left = 453
      Top = 2
      Width = 90
      Enabled = True
      ExplicitLeft = 453
      ExplicitTop = 2
      ExplicitWidth = 90
    end
    object btProcessar: TBitBtn
      Left = 543
      Top = 3
      Width = 80
      Height = 39
      Caption = '&Processar'
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00370777033333
        3330337F3F7F33333F3787070003333707303F737773333373F7007703333330
        700077337F3333373777887007333337007733F773F333337733700070333333
        077037773733333F7F37703707333300080737F373333377737F003333333307
        78087733FFF3337FFF7F33300033330008073F3777F33F777F73073070370733
        078073F7F7FF73F37FF7700070007037007837773777F73377FF007777700730
        70007733FFF77F37377707700077033707307F37773F7FFF7337080777070003
        3330737F3F7F777F333778080707770333333F7F737F3F7F3333080787070003
        33337F73FF737773333307800077033333337337773373333333}
      Layout = blGlyphTop
      NumGlyphs = 2
      TabOrder = 7
    end
  end
end
