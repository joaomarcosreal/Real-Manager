inherited frm_formas_pagto: Tfrm_formas_pagto
  Left = 413
  Top = 303
  Caption = 'Formas de Pagamento - (Caixa /ECF)'
  ClientHeight = 365
  ClientWidth = 739
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited pn_principal: TPanel
    Width = 739
    Height = 323
    inherited pn_codigo: TPanel
      Width = 737
      inherited bt_pesquisa: TSpeedButton
        Left = 47
        Top = 21
      end
      inherited ed_codigo: TMaskEdit
        Left = 6
        Width = 39
      end
    end
    object Panel1: TPanel
      Left = 1
      Top = 47
      Width = 737
      Height = 275
      Align = alClient
      TabOrder = 1
      object Label1: TLabel
        Left = 6
        Top = 8
        Width = 58
        Height = 13
        Caption = 'Descri'#231#227'o'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label2: TLabel
        Left = 206
        Top = 8
        Width = 54
        Height = 13
        Caption = 'C'#243'd. ECF'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label3: TLabel
        Left = 270
        Top = 8
        Width = 30
        Height = 13
        Caption = 'Tipo:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label4: TLabel
        Left = 326
        Top = 8
        Width = 38
        Height = 13
        Caption = 'Troco:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label5: TLabel
        Left = 6
        Top = 48
        Width = 77
        Height = 13
        Caption = 'Dias p/ Cred.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object ed_desc_f: TDBEdit
        Left = 6
        Top = 24
        Width = 193
        Height = 21
        DataField = 'DESCRICAO'
        DataSource = dm.ds_qry_formas_pagto
        TabOrder = 0
      end
      object ed_rp: TDBEdit
        Left = 206
        Top = 24
        Width = 49
        Height = 21
        DataField = 'RP'
        DataSource = dm.ds_qry_formas_pagto
        TabOrder = 1
      end
      object DBEdit1: TDBEdit
        Left = 270
        Top = 24
        Width = 43
        Height = 21
        DataField = 'RP'
        DataSource = dm.ds_qry_formas_pagto
        TabOrder = 2
      end
      object DBCheckBox1: TDBCheckBox
        Left = 328
        Top = 27
        Width = 25
        Height = 17
        TabOrder = 3
        ValueChecked = 'True'
        ValueUnchecked = 'False'
      end
      object DBEdit2: TDBEdit
        Left = 6
        Top = 64
        Width = 80
        Height = 21
        DataField = 'RP'
        DataSource = dm.ds_qry_formas_pagto
        TabOrder = 4
      end
      object TreeView1: TTreeView
        Left = 384
        Top = 88
        Width = 121
        Height = 97
        Indent = 19
        TabOrder = 5
      end
    end
  end
  inherited pn_botoes: TPanel
    Top = 323
    Width = 739
    inherited bt_novo: TBitBtn
      Width = 50
      Caption = 'Novo'
    end
    inherited bt_alterar: TBitBtn
      Left = 102
      Width = 50
      Caption = 'Alterar'
    end
    inherited bt_gravar: TBitBtn
      Left = 204
      Width = 50
      Caption = 'Gravar'
    end
    inherited bt_cancelar: TBitBtn
      Left = 255
      Width = 50
      Caption = 'Cancelar'
    end
    inherited bt_sair: TBitBtn
      Left = 306
      Width = 50
      Caption = 'S&air'
    end
    inherited bt_excluir: TBitBtn
      Left = 153
      Width = 50
      Caption = 'Excluir'
    end
    inherited bt_consultar: TBitBtn
      Left = 51
      Width = 50
      Caption = 'Consultar'
    end
    inherited bt_imprimir: TBitBtn
      Left = 451
      Top = -48
      Visible = False
    end
  end
end
