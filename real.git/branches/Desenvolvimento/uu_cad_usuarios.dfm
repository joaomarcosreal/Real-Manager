object frm_cad_usuarios: Tfrm_cad_usuarios
  Left = 95
  Top = 9
  Caption = 'Cadastro de Usu'#225'rios'
  ClientHeight = 667
  ClientWidth = 704
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Panel12: TPanel
    Left = 0
    Top = 631
    Width = 704
    Height = 36
    Align = alBottom
    BevelWidth = 2
    TabOrder = 0
    object bt_excluir: TBitBtn
      Left = 238
      Top = 2
      Width = 116
      Height = 29
      Caption = 'Excluir'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      OnClick = bt_excluirClick
      OnEnter = ed_cod_usuarioEnter
      OnExit = ed_cod_usuarioExit
      OnKeyDown = bt_novoKeyDown
    end
    object bt_alterar: TBitBtn
      Left = 122
      Top = 2
      Width = 116
      Height = 29
      Caption = 'Alterar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      OnClick = bt_alterarClick
      OnEnter = ed_cod_usuarioEnter
      OnExit = ed_cod_usuarioExit
      OnKeyDown = bt_novoKeyDown
    end
    object bt_novo: TBitBtn
      Left = 6
      Top = 2
      Width = 116
      Height = 29
      Caption = 'Novo'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      OnClick = bt_novoClick
      OnEnter = ed_cod_usuarioEnter
      OnExit = ed_cod_usuarioExit
      OnKeyDown = bt_novoKeyDown
    end
    object bt_gravar: TBitBtn
      Left = 354
      Top = 2
      Width = 116
      Height = 29
      Caption = 'Gravar'
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
      OnClick = bt_gravarClick
      OnEnter = ed_cod_usuarioEnter
      OnExit = ed_cod_usuarioExit
      OnKeyDown = bt_novoKeyDown
    end
    object bt_cancelar: TBitBtn
      Left = 470
      Top = 2
      Width = 116
      Height = 29
      Caption = 'Cancelar'
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 4
      OnClick = bt_cancelarClick
      OnEnter = ed_cod_usuarioEnter
      OnExit = ed_cod_usuarioExit
      OnKeyDown = bt_novoKeyDown
    end
    object bt_sair: TBitBtn
      Left = 587
      Top = 2
      Width = 114
      Height = 29
      Caption = 'Sair'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 5
      OnClick = bt_sairClick
      OnEnter = ed_cod_usuarioEnter
      OnExit = ed_cod_usuarioExit
      OnKeyDown = bt_novoKeyDown
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 704
    Height = 631
    Align = alClient
    TabOrder = 1
    object Panel3: TPanel
      Left = 0
      Top = -5
      Width = 105
      Height = 40
      BevelWidth = 2
      Enabled = False
      TabOrder = 0
      object bt_pesq_usuario: TSpeedButton
        Left = 61
        Top = 14
        Width = 23
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
        OnClick = bt_pesq_usuarioClick
      end
      object Label1: TLabel
        Left = 6
        Top = 2
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
      object ed_cod_usuario: TEdit
        Left = 7
        Top = 15
        Width = 50
        Height = 21
        CharCase = ecUpperCase
        TabOrder = 0
        OnEnter = ed_cod_usuarioEnter
        OnExit = ed_cod_usuarioExit
        OnKeyDown = ed_cod_usuarioKeyDown
      end
    end
    object Panel4: TPanel
      Left = 105
      Top = 0
      Width = 256
      Height = 40
      BevelWidth = 2
      Enabled = False
      TabOrder = 1
      object Label2: TLabel
        Left = 6
        Top = 2
        Width = 93
        Height = 13
        Caption = 'Nome Completo:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object ed_nome: TEdit
        Left = 5
        Top = 14
        Width = 244
        Height = 21
        CharCase = ecUpperCase
        MaxLength = 40
        TabOrder = 0
        OnEnter = ed_cod_usuarioEnter
        OnExit = ed_cod_usuarioExit
        OnKeyDown = ed_cod_usuarioKeyDown
      end
    end
    object Panel5: TPanel
      Left = 362
      Top = -1
      Width = 199
      Height = 41
      BevelWidth = 2
      Enabled = False
      TabOrder = 2
      object Label3: TLabel
        Left = 6
        Top = 2
        Width = 38
        Height = 13
        Caption = 'Cargo:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object ed_cargo: TEdit
        Left = 7
        Top = 14
        Width = 178
        Height = 21
        CharCase = ecUpperCase
        MaxLength = 15
        TabOrder = 0
        OnEnter = ed_cod_usuarioEnter
        OnExit = ed_cod_usuarioExit
        OnKeyDown = ed_cod_usuarioKeyDown
      end
    end
    object Panel6: TPanel
      Left = 561
      Top = -1
      Width = 141
      Height = 41
      BevelWidth = 2
      Enabled = False
      TabOrder = 3
      object Label4: TLabel
        Left = 6
        Top = 2
        Width = 36
        Height = 13
        Caption = 'Login:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object ed_login: TEdit
        Left = 7
        Top = 14
        Width = 130
        Height = 21
        CharCase = ecUpperCase
        MaxLength = 15
        TabOrder = 0
        OnEnter = ed_cod_usuarioEnter
        OnExit = ed_cod_usuarioExit
        OnKeyDown = ed_cod_usuarioKeyDown
      end
    end
    object Panel7: TPanel
      Left = 0
      Top = 41
      Width = 703
      Height = 41
      BevelWidth = 2
      BorderWidth = 2
      TabOrder = 4
      object Label5: TLabel
        Left = 261
        Top = 3
        Width = 153
        Height = 33
        Caption = 'Permiss'#245'es'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -24
        Font.Name = 'Arial Black'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object ckbRedefinir: TCheckBox
        Left = 585
        Top = 5
        Width = 113
        Height = 17
        Caption = 'Redefinir senha'
        TabOrder = 0
      end
      object ckbUsuarioAtivo: TCheckBox
        Left = 585
        Top = 21
        Width = 113
        Height = 17
        Caption = 'Usuario ativo'
        TabOrder = 1
      end
    end
    object pn_permissoes: TPanel
      Left = 0
      Top = 82
      Width = 704
      Height = 548
      BevelWidth = 2
      BorderWidth = 2
      Enabled = False
      TabOrder = 5
      object ckb_modulos: TCheckListBox
        Left = 6
        Top = 10
        Width = 347
        Height = 529
        OnClickCheck = ckb_modulosClickCheck
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        HeaderColor = clInactiveBorder
        IntegralHeight = True
        ItemHeight = 15
        ParentFont = False
        TabOrder = 0
        OnClick = ckb_modulosClick
        OnEnter = ed_cod_usuarioEnter
        OnExit = ed_cod_usuarioExit
        OnKeyDown = ed_cod_usuarioKeyDown
      end
      object ckb_submodulos: TCheckListBox
        Left = 358
        Top = 10
        Width = 341
        Height = 529
        OnClickCheck = ckb_submodulosClickCheck
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ItemHeight = 15
        ParentFont = False
        TabOrder = 1
        OnEnter = ed_cod_usuarioEnter
        OnExit = ed_cod_usuarioExit
        OnKeyDown = ed_cod_usuarioKeyDown
      end
    end
  end
end
