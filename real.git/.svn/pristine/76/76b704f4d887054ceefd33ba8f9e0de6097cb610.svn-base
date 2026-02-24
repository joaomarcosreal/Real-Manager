inherited frmCadReg60A: TfrmCadReg60A
  Caption = 'Cadastro de Registros 60 Anal'#237'ticos - 60A'
  ClientHeight = 127
  ClientWidth = 476
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited pn_principal: TPanel
    Width = 476
    Height = 85
    inherited pn_codigo: TPanel
      Width = 474
      Height = 30
      inherited bt_pesquisa: TSpeedButton
        Left = 83
        Top = 5
      end
      inherited ed_codigo: TMaskEdit
        Top = 5
        Width = 78
      end
    end
    object Panel1: TPanel
      Left = 1
      Top = 31
      Width = 474
      Height = 53
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
        Left = 280
        Top = 11
        Width = 53
        Height = 13
        Caption = 'Al'#237'quota:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label4: TLabel
        Left = 355
        Top = 11
        Width = 99
        Height = 13
        Caption = 'Valor acumulado:'
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
        DataSource = dm.dsQryReg60A
        TabOrder = 0
        OnEnter = Edit1Enter
        OnExit = Edit1Exit
        OnKeyDown = Edit1KeyDown
      end
      object edValorAcumulado: TDBEdit
        Left = 354
        Top = 24
        Width = 111
        Height = 21
        DataField = 'VALOR_ACUMULADO'
        DataSource = dm.dsQryReg60A
        TabOrder = 3
        OnEnter = Edit1Enter
        OnExit = Edit1Exit
        OnKeyDown = Edit1KeyDown
      end
      object lkAliquota: TDBLookupComboBox
        Left = 275
        Top = 24
        Width = 76
        Height = 21
        DataField = 'ALIQUOTA'
        DataSource = dm.dsQryReg60A
        KeyField = 'SINTEGRA'
        ListField = 'SINTEGRA'
        ListSource = dm.dsQryAliquotas
        TabOrder = 2
        OnEnter = Edit1Enter
        OnExit = Edit1Exit
        OnKeyDown = Edit1KeyDown
      end
      object lkNumeroSerie: TDBLookupComboBox
        Left = 82
        Top = 24
        Width = 190
        Height = 21
        DataField = 'NUM_SERIE'
        DataSource = dm.dsQryReg60A
        KeyField = 'NUM_SERIE'
        ListField = 'DESCRICAO'
        ListSource = dm.dsQryECFS
        TabOrder = 1
        OnEnter = Edit1Enter
        OnExit = Edit1Exit
        OnKeyDown = Edit1KeyDown
      end
    end
  end
  inherited pn_botoes: TPanel
    Top = 85
    Width = 476
    inherited bt_novo: TBitBtn
      Width = 79
    end
    inherited bt_alterar: TBitBtn
      Left = 80
      Width = 79
    end
    inherited bt_gravar: TBitBtn
      Left = 238
      Width = 79
    end
    inherited bt_cancelar: TBitBtn
      Left = 317
      Width = 79
    end
    inherited bt_sair: TBitBtn
      Left = 396
      Width = 79
    end
    inherited bt_excluir: TBitBtn
      Left = 159
      Width = 79
    end
    inherited bt_consultar: TBitBtn
      Top = -51
      Visible = False
    end
    inherited bt_imprimir: TBitBtn
      Top = -54
      Visible = False
    end
  end
end
