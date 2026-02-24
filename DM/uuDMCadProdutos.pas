unit uuDMCadProdutos;

interface

uses
  System.SysUtils, System.Variants, System.Classes, Data.DB, IBX.IBCustomDataSet,
  IBX.IBQuery, IBX.IBDatabase, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  RealFramework, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt;

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
    dsClonesTemp: TDataSource;
    tbClonesTemp: TFDMemTable;
    tbClonesTempDescricao: TStringField;
    tbClonesTempvalor: TCurrencyField;
    qryInsumos: TIBQuery;
    dsInsumos: TDataSource;
    qryInsumosCOD_PRODUTO: TIBStringField;
    qryInsumosDESCRICAO: TIBStringField;
    qryInsumosGRUPO: TIBStringField;
    qryInsumosUNIDADE_ENTRADA: TIBStringField;
    qryListagemProdutos: TIBQuery;
    dsListagemProdutos: TDataSource;
    tbListagemProdutos: TFDMemTable;
    qryTipoProdutoSPED: TIBQuery;
    DSqryTipoProdutoSPED: TDataSource;
    qryGeneroItemSPED: TIBQuery;
    dsqryGeneroItemSPED: TDataSource;
    tbClonesTempCodBarras: TStringField;
    FDQuery1: TFDQuery;
    qryCsPlanoContas: TFDQuery;
    dsQryCsPlanoContas: TDataSource;
    procedure DataModuleCreate(Sender: TObject);
    procedure tbClonesTempBeforePost(DataSet: TDataSet);
    procedure DataModuleDestroy(Sender: TObject);

    type
      TEstruturaPeriodo = record
        Inicio: TDate;
        Fim: TDate;
      end;
  private

    { Private declarations }
  public
    { Public declarations }
    procedure OpenDatasets;
    procedure CloseDatasets;
  end;

var
  dmCadProduto: TdmCadProduto;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

uses
  uu_data_module, uu_frm_principal;

{$R *.dfm}

procedure TdmCadProduto.DataModuleCreate(Sender: TObject);
begin
  tbClonesTemp.active := true;
end;

procedure TdmCadProduto.DataModuleDestroy(Sender: TObject);
begin

  CloseDatasets;
end;

procedure TdmCadProduto.tbClonesTempBeforePost(DataSet: TDataSet);
begin
  if trim(tbClonesTempDescricao.Value) = '' then
  begin
    showRealDialog(frm_principal, tmErro, 'Erro', 'Descrição do clone inválida!', 22, false);
    tbClonesTemp.Cancel;
    Exit;
  end;

  if (tbClonesTempvalor.Value < 0) then
  begin
    showRealDialog(frm_principal, tmErro, 'Erro', 'Valor do clone é inválido!', 22, false);
    tbClonesTemp.Cancel;
    exit;
  end;
end;

procedure TdmCadProduto.OpenDatasets();
begin
  qryUnidadeEntrada.Active := true;
  qryGruposTouch.active := true;
  qryMiniPrinters.Active := true;
  qryAliquotas.Active := true;
  qryInsumos.Active := true;
  qryTipoProdutoSPED.Active := true;
  qryGeneroItemSPED.Active := true;
  qryCsPlanoContas.Active := true;

end;

procedure TdmCadProduto.CloseDatasets();
begin
  if tsConsultas.InTransaction then
    tsConsultas.Rollback;

  tbClonesTemp.active := false;
  tbListagemProdutos.Active := false;
  qryUnidadeEntrada.Active := false;
  qryGruposTouch.active := false;
  qryMiniPrinters.Active := false;
  qryAliquotas.Active := false;
  qryInsumos.Active := false;
  qryTipoProdutoSPED.Active := false;
  qryGeneroItemSPED.Active := false;
  qryCsPlanoContas.Active := false;
end;

end.

