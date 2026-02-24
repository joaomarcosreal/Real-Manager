inherited frmSelecaoSabores: TfrmSelecaoSabores
  Left = 430
  Top = 193
  Caption = 'Selecione os sabores'
  ClientHeight = 293
  ClientWidth = 576
  OldCreateOrder = True
  ExplicitWidth = 592
  ExplicitHeight = 332
  PixelsPerInch = 96
  TextHeight = 13
  inherited botao_pesquisa: TSpeedButton
    Left = 134
    Top = -34
    ExplicitLeft = 134
    ExplicitTop = -34
  end
  object SpeedButton1: TSpeedButton [1]
    Left = 110
    Top = -37
    Width = 22
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
    Visible = False
    OnClick = botao_pesquisaClick
  end
  inherited Edit1: TEdit
    Left = 8
    Top = -29
    ExplicitLeft = 8
    ExplicitTop = -29
  end
  object Edit2: TEdit [3]
    Left = -16
    Top = -32
    Width = 121
    Height = 21
    TabOrder = 1
    Text = 'Edit1'
    Visible = False
    OnEnter = Edit1Enter
    OnExit = Edit1Exit
    OnKeyDown = Edit1KeyDown
  end
  object Panel1: TPanel [4]
    Left = 0
    Top = 252
    Width = 576
    Height = 41
    Align = alBottom
    Caption = 'Panel1'
    TabOrder = 2
    object bt_selecionar: TBitBtn
      Left = 8
      Top = 4
      Width = 569
      Height = 32
      Caption = 'OK- ENTER'
      NumGlyphs = 2
      TabOrder = 0
      OnClick = bt_selecionarClick
    end
  end
  object Panel2: TPanel [5]
    Left = 0
    Top = 0
    Width = 576
    Height = 252
    Align = alClient
    TabOrder = 3
    object memo_obs: TMemo
      Left = 8
      Top = -101
      Width = 297
      Height = 89
      MaxLength = 254
      TabOrder = 1
      Visible = False
      OnKeyDown = memo_obsKeyDown
    end
    object ScrollBox1: TScrollBox
      Left = 8
      Top = 8
      Width = 569
      Height = 249
      TabOrder = 0
      object ckb0: TCheckBox
        Left = 465
        Top = 225
        Width = 97
        Height = 17
        Caption = 'ckb0'
        TabOrder = 0
      end
    end
  end
end
