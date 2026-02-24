inherited frmCancelaNFCEChave: TfrmCancelaNFCEChave
  Caption = 'frmCancelaNFCEChave'
  ClientHeight = 137
  ClientWidth = 477
  ExplicitWidth = 493
  ExplicitHeight = 176
  TextHeight = 13
  inherited botao_pesquisa: TSpeedButton
    Left = 110
    Top = 8
    ExplicitLeft = 110
    ExplicitTop = 8
  end
  object Label1: TLabel [1]
    Left = 8
    Top = 47
    Width = 31
    Height = 13
    Caption = 'Chave'
  end
  object Label2: TLabel [2]
    Left = 282
    Top = 47
    Width = 48
    Height = 13
    Caption = 'Protocolo:'
  end
  inherited Edit1: TEdit
    Left = 8
    Top = 20
    Width = 210
    ExplicitLeft = 8
    ExplicitTop = 20
    ExplicitWidth = 210
  end
  object edProtocolo: TEdit [4]
    Tag = 99
    Left = 282
    Top = 66
    Width = 143
    Height = 21
    TabOrder = 1
    OnChange = Edit1Change
    OnEnter = Edit1Enter
    OnExit = Edit1Exit
    OnKeyDown = Edit1KeyDown
  end
  object Button1: TButton [5]
    Left = 350
    Top = 93
    Width = 75
    Height = 25
    Caption = 'Cancelar'
    TabOrder = 2
    OnClick = Button1Click
  end
  object edChave: TEdit [6]
    Tag = 99
    Left = 8
    Top = 66
    Width = 249
    Height = 21
    TabOrder = 3
    OnChange = Edit1Change
    OnEnter = Edit1Enter
    OnExit = Edit1Exit
    OnKeyDown = Edit1KeyDown
  end
  inherited cliques: TActionList
    Left = 136
    Top = 8
  end
end
