inherited frmImportaLivrosEntrada: TfrmImportaLivrosEntrada
  Left = 2
  Top = 41
  Width = 1023
  Height = 710
  Caption = 'frmImportaLivrosEntrada'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited botao_pesquisa: TSpeedButton
    Top = -26
    Visible = True
  end
  inherited Edit1: TEdit
    Top = -23
    Visible = True
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 1015
    Height = 73
    Align = alTop
    Caption = 'Panel1'
    TabOrder = 1
  end
  object Panel2: TPanel
    Left = 0
    Top = 642
    Width = 1015
    Height = 41
    Align = alBottom
    Caption = 'Panel2'
    TabOrder = 2
  end
  object Panel3: TPanel
    Left = 0
    Top = 73
    Width = 1015
    Height = 569
    Align = alClient
    TabOrder = 3
    object memoArquivoEntradas: TMemo
      Left = 6
      Top = -155
      Width = 3000
      Height = 148
      Lines.Strings = (
        'memoArquivoEntradas')
      TabOrder = 0
    end
    object PageControl1: TPageControl
      Left = 1
      Top = 1
      Width = 1013
      Height = 567
      ActivePage = TabSheet1
      Align = alClient
      TabOrder = 1
      object TabSheet1: TTabSheet
        Caption = 'Importar Livro Fiscal'
        object SpeedButton1: TSpeedButton
          Left = 310
          Top = 25
          Width = 27
          Height = 26
          Glyph.Data = {
            36030000424D3603000000000000360000002800000010000000100000000100
            18000000000000030000EB0A0000EB0A00000000000000000000FFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFEFEFEFCFCFCFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF4F4F4DDDDDDD2
            D2D2E3E3E3F9F9F9FFFFFFFFFFFFFCFCFCFDFDFDFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFF1F1F1C0C0C0878788767676979797D9D9D9F4F4F4E5E5E5D2D2
            D2D9D9D9F1F1F1FEFEFEFFFFFFFFFFFFFFFFFFF1F1F1B9B9B978706B967E6F6A
            6868666666A5A5A5C5C5C5979797777777838383C1C1C1F4F4F4FFFFFFFFFFFF
            F0F0F0B7B7B76B6C6DFAC795FFCC9ADEB48F6768696D6D6D7E7D7E987E6E7A71
            6B6767678E8E8EE4E4E4FEFEFEEEEEEEB4B4B4676768908C8BFFE4C0FFE8CDFF
            E2B35F5F5F646667C0A388FFD3A1FFCB9A72716E7F7F7FDEDEDEF4F4F4B1B1B1
            4D4D4D9E9E9EB6B8BAC5B0A7FFF5EEF2D3B643454896989AD5BBA7FFF0DAFFE9
            C58C7E729C9C9CE8E8E8C2C2C26F6F6F7A7A7A929292EEEEEEE3E2E4897D7B68
            64655D5E5ECBCBCCC1BBBAE4D3CEFADCC4868581D7D7D7F9F9F9545454ABABAB
            AEAEAE9D9D9D9A9A9A7373734848485A5A5A818181FFFFFFFFFFFF8583839D9C
            9CDFDFDFF9F9F9FFFFFF656565868686D2D2D2C3C3C3B3B3B398989881818171
            7171747474616161737373CCCCCCF7F7F7FFFFFFFFFFFFFFFFFFD7D7D7858585
            9696969C9C9C8A8A8A8E8E8E979797949494777777B6B6B6F2F2F2FDFDFDFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6F6F6BCBCBC939393BC
            BCBCF0F0F0FCFCFCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
          OnClick = SpeedButton1Click
        end
        object Label1: TLabel
          Left = 2
          Top = 17
          Width = 236
          Height = 13
          Caption = 'Selecione o arquivo do Livro de Entradas'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lbQtdNotas: TLabel
          Left = 160
          Top = 495
          Width = 6
          Height = 20
          Color = clBtnFace
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -16
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentColor = False
          ParentFont = False
        end
        object lbTotalNotas: TLabel
          Left = 160
          Top = 515
          Width = 6
          Height = 20
          Color = clBtnFace
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -16
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentColor = False
          ParentFont = False
        end
        object DBGrid2: TDBGrid
          Left = -1
          Top = 66
          Width = 986
          Height = 455
          DataSource = DataSource1
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          Columns = <
            item
              Expanded = False
              FieldName = 'dataEntrada'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'dataEmissao'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'tipoDoc'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'numeroNota'
              Width = 63
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'serie'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CFOP'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'valor'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'nomeFornecedor'
              Width = 260
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'cnpj'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'IE'
              Width = 138
              Visible = True
            end>
        end
        object BitBtn1: TBitBtn
          Left = 344
          Top = 8
          Width = 113
          Height = 49
          Caption = 'Importar'
          TabOrder = 1
          OnClick = BitBtn1Click
        end
        object edCaminhoArquivoEntrada: TEdit
          Left = 1
          Top = 31
          Width = 305
          Height = 21
          TabOrder = 2
        end
      end
    end
  end
  object OpenDialog1: TOpenDialog
    Filter = 'Arquivo de texto|*.TXT'
    Left = 48
    Top = 65520
  end
  object tbImportacao: TRxMemoryData
    FieldDefs = <
      item
        Name = 'dataEntrada'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'tipoDoc'
        DataType = ftString
        Size = 8
      end
      item
        Name = 'serie'
        DataType = ftString
        Size = 4
      end
      item
        Name = 'numeroNota'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'dataEmissao'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'cnpj'
        DataType = ftString
        Size = 18
      end>
    Left = 728
    Top = 17
    object tbImportacaodataEntrada: TStringField
      FieldName = 'dataEntrada'
      Size = 10
    end
    object tbImportacaotipoDoc: TStringField
      FieldName = 'tipoDoc'
      Size = 8
    end
    object tbImportacaoserie: TStringField
      FieldName = 'serie'
      Size = 4
    end
    object tbImportacaonumeroNota: TStringField
      FieldName = 'numeroNota'
      Size = 10
    end
    object tbImportacaodataEmissao: TStringField
      FieldName = 'dataEmissao'
      Size = 10
    end
    object tbImportacaocnpj: TStringField
      FieldName = 'cnpj'
      Size = 18
    end
    object tbImportacaoUF: TStringField
      FieldName = 'UF'
      Size = 2
    end
    object tbImportacaoIE: TStringField
      FieldName = 'IE'
      Size = 25
    end
    object tbImportacaovalor: TStringField
      FieldName = 'valor'
    end
    object tbImportacaoCFOP: TStringField
      FieldName = 'CFOP'
      Size = 6
    end
    object tbImportacaonomeFornecedor: TStringField
      FieldName = 'nomeFornecedor'
      Size = 150
    end
  end
  object DataSource1: TDataSource
    DataSet = tbImportacao
    Left = 752
    Top = 17
  end
end
