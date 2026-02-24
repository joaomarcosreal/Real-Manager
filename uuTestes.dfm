inherited frmTestes: TfrmTestes
  Caption = 'frmTestes'
  ClientHeight = 542
  ClientWidth = 946
  ExplicitWidth = 958
  ExplicitHeight = 580
  TextHeight = 13
  inherited Edit1: TEdit
    Left = 24
    Top = 8
    Width = 233
    Text = ''
    ExplicitLeft = 24
    ExplicitTop = 8
    ExplicitWidth = 233
  end
  object Button1: TButton [2]
    Left = 32
    Top = 136
    Width = 233
    Height = 25
    Caption = 'Importa CSV'
    TabOrder = 1
    OnClick = Button1Click
  end
  object Button2: TButton [3]
    Left = 388
    Top = 34
    Width = 153
    Height = 41
    Caption = 'Button2'
    TabOrder = 2
    OnClick = Button2Click
  end
  object Memo1: TMemo [4]
    Left = 562
    Top = 66
    Width = 345
    Height = 143
    Lines.Strings = (
      'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX')
    TabOrder = 3
  end
  object edArquivoCSV: TJvFilenameEdit [5]
    Left = 32
    Top = 96
    Width = 225
    Height = 21
    AddQuotes = False
    Flat = False
    ParentFlat = False
    TabOrder = 4
    Text = ''
  end
  object DBGrid1: TDBGrid [6]
    Left = 0
    Top = 300
    Width = 946
    Height = 242
    Align = alBottom
    DataSource = DSQryDRE
    TabOrder = 5
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
  end
  object Button3: TButton [7]
    Left = 8
    Top = 248
    Width = 156
    Height = 25
    Caption = 'Selecionar Dados do DRE'
    TabOrder = 6
    OnClick = Button3Click
  end
  object Button4: TButton [8]
    Left = 388
    Top = 248
    Width = 188
    Height = 25
    Caption = 'Popular planilha'
    TabOrder = 7
    OnClick = Button4Click
  end
  inherited cliques: TActionList
    Left = 344
    Top = 32
  end
  inherited actlBusca: TJvControlActionList
    Left = 344
    Top = 64
  end
  inherited popMenuExportacaoGrid: TPopupMenu
    Left = 353
    Top = 130
  end
  object RelatorioComparativoAnual: TFDQuery
    Connection = dm.fdRestaurante
    Left = 266
    Top = 233
  end
  object DSQryDRE: TDataSource
    DataSet = RelatorioComparativoAnual
    Left = 326
    Top = 231
  end
  object SaveDialog1: TSaveDialog
    Left = 694
    Top = 254
  end
end
