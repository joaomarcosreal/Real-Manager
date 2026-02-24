unit uuDMCadProdutos;

interface

uses
  System.SysUtils, System.Classes, uu_data_module, Data.DB, IBX.IBCustomDataSet,
  IBX.IBQuery, IBX.IBDatabase;

type
  TdmCadProduto = class(TDataModule)
    qryUnidadeEntrada: TIBQuery;
    qryUnidadeEntradaCOD_UNIDADE: TIBStringField;
    qryUnidadeEntradaDESCRICAO: TIBStringField;
    qryUnidadeEntradaSIGLA: TIBStringField;
    qryUnidadeEntradaPARAMETRO: TIBBCDField;
    qryUnidadeEntradaCOD_PADRAO: TIBStringField;
    tsConsultas: TIBTransaction;
    dsQryUnidades: TDataSource;
    qryGruposTouch: TIBQuery;
    dsGruposTouch: TDataSource;
    qryGruposTouchCODIGO: TIBStringField;
    qryGruposTouchDESCRICAO: TIBStringField;
    qryGruposTouchORDEM: TSmallintField;
    qryGruposTouchCOD_GRUPO: TIBStringField;
    qryMiniPrinters: TIBQuery;
    dsQryMiniPrinters: TDataSource;
    qryMiniPrintersCOD_MINIPRINTER: TIBStringField;
    qryMiniPrintersDESCRICAO: TIBStringField;
    qryMiniPrintersMARCA: TSmallintField;
    qryMiniPrintersMODELO: TSmallintField;
    qryMiniPrintersN_ESTACAO: TSmallintField;
    qryMiniPrintersPORTA: TIBStringField;
    qryMiniPrintersIMPRIME_EXTRATO: TSmallintField;
    qryMiniPrintersCORTA_PAPEL: TSmallintField;
    qryMiniPrintersSALTOS: TSmallintField;
    qryMiniPrintersVIAS: TSmallintField;
    qryAliquotas: TIBQuery;
    dsAliquotas: TDataSource;
    qryAliquotasCOD_ALIQUOTA: TIBStringField;
    qryAliquotasDESCRICAO: TIBStringField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmCadProduto: TdmCadProduto;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.
