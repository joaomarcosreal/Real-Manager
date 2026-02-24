inherited frm_cad_grupos: Tfrm_cad_grupos
  Left = 355
  Caption = 'Cadastro de Grupos '
  ClientHeight = 167
  ClientWidth = 354
  ExplicitWidth = 366
  ExplicitHeight = 205
  TextHeight = 13
  inherited pn_principal: TPanel
    Width = 354
    Height = 125
    ExplicitWidth = 350
    ExplicitHeight = 124
    inherited pn_codigo: TPanel
      Width = 352
      Height = 38
      ExplicitWidth = 348
      ExplicitHeight = 38
      inherited bt_pesquisa: TSpeedButton
        Left = 61
        Top = 12
        ExplicitLeft = 61
        ExplicitTop = 12
      end
      inherited ed_codigo: TMaskEdit
        Left = 4
        Top = 12
        Width = 52
        CharCase = ecUpperCase
        EditMask = '9.99.999;0;_'
        MaxLength = 8
        ExplicitLeft = 4
        ExplicitTop = 12
        ExplicitWidth = 52
      end
    end
    object pn_descricao: TPanel
      Left = 1
      Top = 39
      Width = 352
      Height = 85
      Align = alClient
      TabOrder = 1
      ExplicitWidth = 348
      ExplicitHeight = 84
      object Label14: TLabel
        Left = 6
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
      object Label1: TLabel
        Left = 267
        Top = 5
        Width = 64
        Height = 13
        Caption = '% Proje'#231#227'o'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object ed_descricao: TDBEdit
        Left = 5
        Top = 18
        Width = 260
        Height = 21
        CharCase = ecUpperCase
        DataField = 'DESCRICAO'
        DataSource = dm.ds_qry_grupos
        TabOrder = 0
        OnEnter = ed_codigoEnter
        OnExit = ed_codigoExit
        OnKeyDown = Edit1KeyDown
      end
      object DBEdit1: TDBEdit
        Left = 271
        Top = 17
        Width = 62
        Height = 21
        CharCase = ecUpperCase
        DataField = 'PERC_PROJ_RD'
        DataSource = dm.ds_qry_grupos
        TabOrder = 1
        OnEnter = ed_codigoEnter
        OnExit = ed_codigoExit
        OnKeyDown = Edit1KeyDown
      end
      object DBCheckBox1: TDBCheckBox
        Left = 6
        Top = 44
        Width = 105
        Height = 17
        Caption = 'Mostrar no RD'
        DataField = 'MOSTRA_NO_RD'
        DataSource = dm.ds_qry_grupos
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 2
        ValueChecked = '1'
        ValueUnchecked = '0'
      end
      object DBCheckBox2: TDBCheckBox
        Left = 6
        Top = 63
        Width = 105
        Height = 17
        Caption = 'Resultado RD'
        DataField = 'RESULTADO_RD'
        DataSource = dm.ds_qry_grupos
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 3
        ValueChecked = '1'
        ValueUnchecked = '0'
      end
    end
  end
  inherited pn_botoes: TPanel
    Top = 125
    Width = 354
    ExplicitTop = 124
    ExplicitWidth = 350
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
      Left = 202
      Width = 50
      Caption = 'Gravar'
      ExplicitLeft = 202
      ExplicitWidth = 50
    end
    inherited bt_cancelar: TBitBtn
      Left = 253
      Width = 50
      Caption = 'Cancelar'
      ExplicitLeft = 253
      ExplicitWidth = 50
    end
    inherited bt_sair: TBitBtn
      Left = 303
      Width = 50
      Caption = 'S&air'
      ExplicitLeft = 303
      ExplicitWidth = 50
    end
    inherited bt_excluir: TBitBtn
      Left = 151
      Width = 50
      Caption = 'Excluir'
      ExplicitLeft = 151
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
      Top = -57
      Visible = False
      ExplicitTop = -57
    end
  end
end
