unit uuDmVendas;

interface

uses
  System.SysUtils, System.Classes, IBX.IBCustomDataSet, IBX.IBUpdateSQL,
  Data.DB, IBX.IBQuery;

type
  TdmVendas = class(TDataModule)
    qryVendas: TIBQuery;
    updVendas: TIBUpdateSQL;
    qryVendasCOD_VENDA: TIBStringField;
    qryVendasDATA: TDateField;
    qryVendasHORA: TTimeField;
    qryVendasDATA_SO: TDateField;
    qryVendasDATA_ECF: TDateField;
    qryVendasHORA_ECF: TTimeField;
    qryVendasVALOR_BRUTO: TIBBCDField;
    qryVendasVALOR_DESCONTO: TIBBCDField;
    qryVendasVALOR_TXSERV: TIBBCDField;
    qryVendasVALOR_TOTAL: TIBBCDField;
    qryVendasTOTAL_PAGO: TIBBCDField;
    qryVendasVALOR_TROCO: TIBBCDField;
    qryVendasCOD_USUARIO: TIBStringField;
    qryVendasNUMERO_CAIXA: TIBStringField;
    qryVendasMESA: TIBStringField;
    qryVendasIMP: TSmallintField;
    qryVendasCOD_CAIXA: TIBStringField;
    qryVendasTIPO_VENDA: TSmallintField;
    qryVendasCOD_PEDIDO_DELIVERY: TIBStringField;
    qryVendasCOO_CUPOM: TIBStringField;
    qryVendasQTDE_PESSOAS: TSmallintField;
    qryVendasVALOR_TX_ENTREGA: TIBBCDField;
    qryVendasREDUCAO_Z: TIntegerField;
    qryVendasSELECIONADO: TSmallintField;
    qryVendasDESCONTO_TAXAS: TFMTBCDField;
    qryVendasCHAVE_NFCE: TIBStringField;
    qryVendasNUMERO_NFCE: TIntegerField;
    qryVendasSERIE_NFCE: TSmallintField;
    qryVendasPROTOCOLO_NFCE: TIBStringField;
    qryVendasRECIBO_NFCE: TIBStringField;
    qryVendasOBS_NFCE: TIBStringField;
    qryVendasCONSULTA_OK: TSmallintField;
    qryVendasCOD_EMPRESA: TIBStringField;
    qryVendasPERCENTUAL_DESCONTO: TFMTBCDField;
    qryVendasLOTE_EXPORTACAO_WEB: TLargeintField;
    qryVendasCOD_GARCON_ABRIU: TIBStringField;
    qryVendasMODELO_COMPROVANTE: TSmallintField;
    qryVendasCOD_FORNECEDOR: TIBStringField;
    qryVendasSESSAO_SAT: TLargeintField;
    qryVendasCNF_SAT: TLargeintField;
    qryVendasXML_DOC: TWideMemoField;
    qryVendasCNPJ_CPF_CLIENTE_NF: TIBStringField;
    qryVendasNOME_CLIENTE_NF: TIBStringField;
    qryVendasTENTATIVAS_ENVIO_NFCE: TSmallintField;
    qryVendasTEMPO_EMISSAO_NFCE: TSmallintField;
    qryVendasTABELA_PRECO: TSmallintField;
    qryVendasSTATUS: TSmallintField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmVendas: TdmVendas;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.
