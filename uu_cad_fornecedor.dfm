inherited frmCadFornecedores: TfrmCadFornecedores
  Left = 115
  Top = 188
  Caption = 'Cadastro de Participantes'
  ClientHeight = 455
  ClientWidth = 694
  OnDestroy = FormDestroy
  ExplicitWidth = 706
  ExplicitHeight = 493
  TextHeight = 13
  inherited pn_principal: TPanel
    Width = 694
    Height = 407
    ExplicitWidth = 690
    ExplicitHeight = 406
    inherited pn_codigo: TPanel
      Width = 692
      Height = 47
      OnExit = botao_pesquisaClick
      ExplicitWidth = 688
      ExplicitHeight = 47
      inherited bt_pesquisa: TSpeedButton
        Left = 66
        Top = 20
        Width = 24
        Height = 21
        ExplicitLeft = 66
        ExplicitTop = 20
        ExplicitWidth = 24
        ExplicitHeight = 21
      end
      inherited ed_codigo: TMaskEdit
        Width = 62
        ExplicitWidth = 62
      end
    end
    object pn_campos: TPanel
      Left = 1
      Top = 48
      Width = 692
      Height = 358
      Align = alClient
      Enabled = False
      TabOrder = 1
      ExplicitWidth = 688
      ExplicitHeight = 357
      object Label1: TLabel
        Left = 7
        Top = 45
        Width = 76
        Height = 13
        Caption = 'Raz'#227'o Social'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label2: TLabel
        Left = 8
        Top = 83
        Width = 85
        Height = 13
        Caption = 'Nome Fantasia'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label12: TLabel
        Left = 7
        Top = 122
        Width = 106
        Height = 13
        Caption = 'Inscri'#231#227'o Estadual'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label14: TLabel
        Left = 127
        Top = 122
        Width = 115
        Height = 13
        Caption = 'Inscri'#231#227'o Municipal:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label3: TLabel
        Left = 245
        Top = 123
        Width = 59
        Height = 13
        Caption = 'Endere'#231'o:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label4: TLabel
        Left = 352
        Top = 163
        Width = 38
        Height = 13
        Caption = 'Bairro:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label7: TLabel
        Left = 596
        Top = 163
        Width = 27
        Height = 13
        Caption = 'Cep:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label8: TLabel
        Left = 302
        Top = 239
        Width = 55
        Height = 13
        Caption = 'Telefone:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label9: TLabel
        Left = 438
        Top = 236
        Width = 25
        Height = 13
        Caption = 'Fax:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label10: TLabel
        Left = 7
        Top = 237
        Width = 39
        Height = 13
        Caption = 'E-mail:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label11: TLabel
        Left = 636
        Top = 120
        Width = 44
        Height = 13
        Caption = 'N'#250'mero'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label15: TLabel
        Left = 7
        Top = 163
        Width = 80
        Height = 13
        Caption = 'Complemento:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label19: TLabel
        Left = 7
        Top = 201
        Width = 27
        Height = 13
        Caption = 'Pa'#237's'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label20: TLabel
        Left = 216
        Top = 201
        Width = 40
        Height = 13
        Caption = 'Estado'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label22: TLabel
        Left = 423
        Top = 200
        Width = 40
        Height = 13
        Caption = 'Cidade'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object PngSpeedButton1: TPngSpeedButton
        Left = 184
        Top = 17
        Width = 115
        Height = 22
        Caption = 'Buscar dados online'
        OnClick = PngSpeedButton1Click
      end
      object Label5: TLabel
        Left = 8
        Top = 281
        Width = 75
        Height = 13
        Caption = 'Observa'#231#245'es'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Panel2: TPanel
        Left = 87
        Top = 191
        Width = 209
        Height = 28
        BevelOuter = bvNone
        Enabled = False
        TabOrder = 0
      end
      object ed_razao_social: TDBEdit
        Left = 7
        Top = 61
        Width = 689
        Height = 21
        CharCase = ecUpperCase
        DataField = 'RAZAO_SOCIAL'
        DataSource = dm.ds_qry_fornecedores
        TabOrder = 4
        OnEnter = Edit1Enter
        OnExit = Edit1Exit
        OnKeyDown = Edit1KeyDown
      end
      object ed_nome_fantasia: TDBEdit
        Left = 8
        Top = 96
        Width = 688
        Height = 21
        CharCase = ecUpperCase
        DataField = 'NOME_FANTASIA'
        DataSource = dm.ds_qry_fornecedores
        TabOrder = 5
        OnEnter = Edit1Enter
        OnExit = Edit1Exit
        OnKeyDown = Edit1KeyDown
      end
      object ckCNPJ: TRadioButton
        Left = 8
        Top = 10
        Width = 57
        Height = 17
        Caption = 'CNPJ'
        Checked = True
        TabOrder = 1
        TabStop = True
        OnClick = ckCNPJClick
        OnEnter = Edit1Enter
        OnExit = Edit1Exit
        OnKeyDown = Edit1KeyDown
      end
      object ckCPF: TRadioButton
        Left = 8
        Top = 25
        Width = 57
        Height = 17
        Caption = 'CPF'
        TabOrder = 2
        OnClick = ckCPFClick
        OnEnter = Edit1Enter
        OnExit = Edit1Exit
        OnKeyDown = Edit1KeyDown
      end
      object ed_cnpj: TDBEdit
        Left = 64
        Top = 18
        Width = 119
        Height = 21
        DataField = 'CGC_CPF'
        DataSource = dm.ds_qry_fornecedores
        TabOrder = 3
        OnEnter = Edit1Enter
        OnExit = Edit1Exit
        OnKeyDown = Edit1KeyDown
      end
      object ed_ie: TDBEdit
        Left = 7
        Top = 136
        Width = 110
        Height = 21
        CharCase = ecUpperCase
        DataField = 'INSCRICAO_ESTADUAL'
        DataSource = dm.ds_qry_fornecedores
        TabOrder = 6
        OnEnter = Edit1Enter
        OnExit = Edit1Exit
        OnKeyDown = Edit1KeyDown
        OnKeyPress = ed_ieKeyPress
      end
      object i_municipal: TDBEdit
        Left = 126
        Top = 136
        Width = 110
        Height = 21
        CharCase = ecUpperCase
        DataField = 'INSCRICAO_MUNICIPAL'
        DataSource = dm.ds_qry_fornecedores
        TabOrder = 7
        OnEnter = Edit1Enter
        OnExit = Edit1Exit
        OnKeyDown = Edit1KeyDown
      end
      object ed_endereco: TDBEdit
        Left = 242
        Top = 136
        Width = 389
        Height = 21
        CharCase = ecUpperCase
        DataField = 'ENDERECO'
        DataSource = dm.ds_qry_fornecedores
        TabOrder = 8
        OnEnter = Edit1Enter
        OnExit = Edit1Exit
        OnKeyDown = Edit1KeyDown
      end
      object DBEdit1: TDBEdit
        Left = 637
        Top = 136
        Width = 59
        Height = 21
        CharCase = ecUpperCase
        DataField = 'NUM_ENDERECO'
        DataSource = dm.ds_qry_fornecedores
        TabOrder = 9
        OnEnter = Edit1Enter
        OnExit = Edit1Exit
        OnKeyDown = Edit1KeyDown
      end
      object DBEdit2: TDBEdit
        Left = 7
        Top = 177
        Width = 330
        Height = 21
        CharCase = ecUpperCase
        DataField = 'COMPLEMENTO'
        DataSource = dm.ds_qry_fornecedores
        TabOrder = 10
        OnEnter = Edit1Enter
        OnExit = Edit1Exit
        OnKeyDown = Edit1KeyDown
      end
      object ed_bairro: TDBEdit
        Left = 351
        Top = 177
        Width = 231
        Height = 21
        CharCase = ecUpperCase
        DataField = 'BAIRRO'
        DataSource = dm.ds_qry_fornecedores
        TabOrder = 11
        OnEnter = Edit1Enter
        OnExit = Edit1Exit
        OnKeyDown = Edit1KeyDown
      end
      object ed_cep: TDBEdit
        Left = 596
        Top = 177
        Width = 100
        Height = 21
        CharCase = ecUpperCase
        DataField = 'CEP'
        DataSource = dm.ds_qry_fornecedores
        TabOrder = 12
        OnEnter = Edit1Enter
        OnKeyDown = Edit1KeyDown
      end
      object ed_telefone: TDBEdit
        Left = 302
        Top = 254
        Width = 127
        Height = 21
        CharCase = ecUpperCase
        DataField = 'TELEFONE'
        DataSource = dm.ds_qry_fornecedores
        TabOrder = 17
        OnEnter = Edit1Enter
        OnExit = Edit1Exit
        OnKeyDown = Edit1KeyDown
      end
      object ed_fax: TDBEdit
        Left = 434
        Top = 255
        Width = 127
        Height = 21
        CharCase = ecUpperCase
        DataField = 'FAX'
        DataSource = dm.ds_qry_fornecedores
        TabOrder = 18
        OnEnter = Edit1Enter
        OnExit = Edit1Exit
        OnKeyDown = Edit1KeyDown
      end
      object ed_email: TDBEdit
        Left = 7
        Top = 254
        Width = 284
        Height = 21
        CharCase = ecLowerCase
        DataField = 'EMAIL'
        DataSource = dm.ds_qry_fornecedores
        TabOrder = 16
        OnEnter = Edit1Enter
        OnExit = Edit1Exit
        OnKeyDown = Edit1KeyDown
      end
      object DBMemo1: TDBMemo
        Left = 8
        Top = 297
        Width = 396
        Height = 42
        DataField = 'OBSERVACAO'
        DataSource = dm.ds_qry_fornecedores
        TabOrder = 19
        OnKeyDown = Edit1KeyDown
      end
      object ckbEstrangeiro: TCheckBox
        Left = 552
        Top = 20
        Width = 144
        Height = 17
        Caption = 'O cliente '#233' estrangeiro ?'
        TabOrder = 20
        OnClick = ckbEstrangeiroClick
      end
      object cbPais: TcxLookupComboBox
        Left = 7
        Top = 214
        Properties.DropDownAutoSize = True
        Properties.DropDownRows = 10
        Properties.DropDownSizeable = True
        Properties.GridMode = True
        Properties.KeyFieldNames = 'CODPAIS'
        Properties.ListColumns = <
          item
            Caption = 'C'#243'digo'
            FieldName = 'CODPAIS'
          end
          item
            Caption = 'Nome do pa'#237's'
            MinWidth = 150
            FieldName = 'NOMPAIS'
          end>
        Properties.ListFieldIndex = 1
        Properties.ListOptions.CaseInsensitive = True
        Properties.ListSource = dm_consultas.dsQryPaises
        Properties.ReadOnly = False
        TabOrder = 13
        OnEnter = Edit1Enter
        OnExit = Edit1Exit
        OnKeyDown = Edit1KeyDown
        Width = 201
      end
      object cbEstado: TcxLookupComboBox
        Left = 216
        Top = 214
        Properties.DropDownAutoSize = True
        Properties.DropDownRows = 10
        Properties.DropDownSizeable = True
        Properties.GridMode = True
        Properties.KeyFieldNames = 'CODIGO'
        Properties.ListColumns = <
          item
            Caption = 'C'#243'digo'
            FieldName = 'CODIGO'
          end
          item
            Caption = 'Nome do estado'
            MinWidth = 150
            FieldName = 'NOME'
          end
          item
            Caption = 'UF'
            FieldName = 'SIGLA'
          end>
        Properties.ListFieldIndex = 1
        Properties.ListOptions.CaseInsensitive = True
        Properties.ListSource = dm_consultas.dsQryEstados
        Properties.ReadOnly = False
        TabOrder = 14
        OnClick = cbEstadoClick
        OnEnter = Edit1Enter
        OnExit = Edit1Exit
        OnKeyDown = Edit1KeyDown
        Width = 201
      end
      object cbCidade: TcxLookupComboBox
        Left = 423
        Top = 213
        Properties.DropDownAutoSize = True
        Properties.DropDownRows = 10
        Properties.DropDownSizeable = True
        Properties.GridMode = True
        Properties.KeyFieldNames = 'COD_CIDADE'
        Properties.ListColumns = <
          item
            Caption = 'C'#243'digo'
            MinWidth = 50
            Width = 50
            FieldName = 'COD_CIDADE'
          end
          item
            Caption = 'Nome da cidade'
            MinWidth = 150
            FieldName = 'NOME'
          end>
        Properties.ListFieldIndex = 1
        Properties.ListOptions.CaseInsensitive = True
        Properties.ListSource = dm_consultas.dsQryCidade
        Properties.ReadOnly = False
        TabOrder = 15
        OnEnter = Edit1Enter
        OnExit = Edit1Exit
        OnKeyDown = Edit1KeyDown
        Width = 273
      end
    end
  end
  inherited pn_botoes: TPanel
    Top = 407
    Width = 694
    Height = 48
    ExplicitTop = 406
    ExplicitWidth = 690
    ExplicitHeight = 48
    inherited bt_novo: TBitBtn
      Width = 99
      Height = 45
      ExplicitWidth = 99
      ExplicitHeight = 45
    end
    inherited bt_alterar: TBitBtn
      Left = 201
      Width = 99
      Height = 45
      ExplicitLeft = 201
      ExplicitWidth = 99
      ExplicitHeight = 45
    end
    inherited bt_gravar: TBitBtn
      Left = 400
      Width = 99
      Height = 45
      ExplicitLeft = 400
      ExplicitWidth = 99
      ExplicitHeight = 45
    end
    inherited bt_cancelar: TBitBtn
      Left = 500
      Width = 99
      Height = 45
      ExplicitLeft = 500
      ExplicitWidth = 99
      ExplicitHeight = 45
    end
    inherited bt_sair: TBitBtn
      Left = 600
      Width = 97
      Height = 45
      ExplicitLeft = 600
      ExplicitWidth = 97
      ExplicitHeight = 45
    end
    inherited bt_excluir: TBitBtn
      Left = 300
      Width = 99
      Height = 45
      ExplicitLeft = 300
      ExplicitWidth = 99
      ExplicitHeight = 45
    end
    inherited bt_consultar: TBitBtn
      Left = 100
      Width = 99
      Height = 45
      ExplicitLeft = 100
      ExplicitWidth = 99
      ExplicitHeight = 45
    end
    inherited bt_imprimir: TBitBtn
      Left = 451
      Top = -86
      Visible = False
      ExplicitLeft = 451
      ExplicitTop = -86
    end
  end
end
