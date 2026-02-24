unit uuDmRelatorios;

interface

uses
  SysUtils, Classes, frxClass, frxDBSet, DB, IBCustomDataSet, IBQuery,
  frxExportMail, frxExportImage, frxExportText, frxExportCSV, frxExportPDF,
  frxExportHTML, frxExportXLS, frxExportXML, frxExportRTF, frxExportDOCX,
  frxExportHTMLDiv, frxExportXLSX, IBUpdateSQL, frxCross, frxExportBIFF;

type
  TdRelatorios = class(TDataModule)
    qryParametros: TIBQuery;
    dtParametros: TfrxDBDataset;
    qryProdutos: TIBQuery;
    dtProdutos: TfrxDBDataset;
    qryUnidades: TIBQuery;
    dtUnidades: TfrxDBDataset;
    qryGarcons: TIBQuery;
    dtGarcons: TfrxDBDataset;
    qryTiposBaixa: TIBQuery;
    dtTiposBaixa: TfrxDBDataset;
    qryMotivosEstorno: TIBQuery;
    dtMotivosEstorno: TfrxDBDataset;
    qryObsPreparo: TIBQuery;
    dtObsPreparo: TfrxDBDataset;
    qryTiposSangria: TIBQuery;
    dtTiposSangria: TfrxDBDataset;
    qryFornecedores: TIBQuery;
    dtFornecedores: TfrxDBDataset;
    qryGruposFornecedor: TIBQuery;
    dtGruposFornecedor: TfrxDBDataset;
    qryItensEstoque: TIBQuery;
    dtItensEstoque: TfrxDBDataset;
    qryCompras: TIBQuery;
    dtCompras: TfrxDBDataset;
    qryItensCompra: TIBQuery;
    dtItensCompra: TfrxDBDataset;
    dsQryCompras: TDataSource;
    qryComprasPorGrupo: TIBQuery;
    dtComprasPorGrupo: TfrxDBDataset;
    qryComprasItem: TIBQuery;
    dtComprasPorItem: TfrxDBDataset;
    qryItemMaisBaratoPeriodo: TIBQuery;
    dtItemMaisBaratoPeriodo: TfrxDBDataset;
    dtItemMaisCaroPeriodo: TfrxDBDataset;
    qryItemMaisCaroPeriodo: TIBQuery;
    qryCaixas: TIBQuery;
    dsCaixas: TDataSource;
    qryVendas: TIBQuery;
    dsQryVendas: TDataSource;
    dtVendas: TfrxDBDataset;
    qryRecebimentos: TIBQuery;
    dtRecebimentos: TfrxDBDataset;
    qryComposicoesProduto: TIBQuery;
    dsComposicoesProduto: TDataSource;
    dsQryProdutos: TDataSource;
    dtComposicoesProduto: TfrxDBDataset;
    qryBaixasManuais: TIBQuery;
    dtBaixasManuais: TfrxDBDataset;
    qryBaixasManuaisSintetico: TIBQuery;
    dtBaixasManuaisSintetico: TfrxDBDataset;
    qrySaidas: TIBQuery;
    dsQrySaidas: TDataSource;
    dtSaidas: TfrxDBDataset;
    qryItensSaidas: TIBQuery;
    dtItensSaidas: TfrxDBDataset;
    qryCartoes: TIBQuery;
    dtCartoes: TfrxDBDataset;
    QryFundoCartoes: TIBQuery;
    dtFundoCartoes: TfrxDBDataset;
    dtComprasGrupoAnalitico: TfrxDBDataset;
    rpt: TfrxReport;
    frxXLSXExport1: TfrxXLSXExport;
    frxHTML5DivExport1: TfrxHTML5DivExport;
    frxHTML4DivExport1: TfrxHTML4DivExport;
    frxPDFExport1: TfrxPDFExport;
    frxXLSExport1: TfrxXLSExport;
    frxRTFExport1: TfrxRTFExport;
    qryNFCEEnviadas: TIBQuery;
    dtNFCEEnviadas: TfrxDBDataset;
    qryRelLancamentosRD: TIBQuery;
    dtLancamentosRD: TfrxDBDataset;
    dtQryRD: TfrxDBDataset;
    qryNotasRDPeriodo: TIBQuery;
    qryNotasRDPeriodoCODIGO: TIBStringField;
    qryNotasRDPeriodoCOD_FORNECEDOR: TIBStringField;
    qryNotasRDPeriodoRAZAO_SOCIAL: TIBStringField;
    qryNotasRDPeriodoNUM_DOC: TIBStringField;
    qryNotasRDPeriodoDATA_DOCUMENTO: TDateField;
    qryNotasRDPeriodoDATA_LANCAMENTO: TDateField;
    qryNotasRDPeriodoDATA_RD: TDateField;
    qryNotasRDPeriodoTOTAL_NOTA: TIBBCDField;
    qryNotasRDPeriodoTOTAL_LANCAMENTOS: TFloatField;
    dtNotasRDPeriodo: TfrxDBDataset;
    qryNotasRDPeriodoDATA_VENCIMENTO: TDateField;
    qryNotasRDPeriodoOBSERVACOES: TIBStringField;
    qryNotasRDPeriodoItens: TIBQuery;
    dsNotasRDPeriodo: TDataSource;
    dtNotasRDPeriodoItens: TfrxDBDataset;
    qryNotasRDPeriodoItensCOD_LANC_RD: TIBStringField;
    qryNotasRDPeriodoItensCOD_GRUPO: TIBStringField;
    qryNotasRDPeriodoItensVALOR: TFloatField;
    qryNotasRDPeriodoItensDESCRICAO: TIBStringField;
    qryRelItensCompraRDGrupo: TIBQuery;
    dtItensCompraRD: TfrxDBDataset;
    qryRelItensLancamentosRD: TIBQuery;
    IBStringField1: TIBStringField;
    IBStringField2: TIBStringField;
    FloatField1: TFloatField;
    IBStringField3: TIBStringField;
    dsqryRelLancamentosRD: TDataSource;
    dtItensLancamentosRD: TfrxDBDataset;
    qryRelAnaliseGerencialMensal: TIBQuery;
    updQryCaixas: TIBUpdateSQL;
    qryCaixasCODIGO: TIBStringField;
    qryCaixasDATA_ABERTURA: TDateField;
    qryCaixasHORA_ABERTURA: TTimeField;
    qryCaixasDATA_FECHAMENTO: TDateField;
    qryCaixasHORA_FECHAMENTO: TTimeField;
    qryCaixasSUPRIMENTO_INICIAL: TIBBCDField;
    qryCaixasTOTAL_RECEBIMENTOS: TIBBCDField;
    qryCaixasTOTAL_SUPRIMENTOS: TIBBCDField;
    qryCaixasTOTAL_SANGRIAS: TIBBCDField;
    qryCaixasCOD_USUARIO: TIBStringField;
    qryCaixasNOME_USUARIO: TIBStringField;
    qryCaixasNUMERO_CAIXA: TIBStringField;
    qryCaixasSTATUS: TSmallintField;
    qryCaixasDATA_SISTEMA: TDateField;
    qryCaixasCOBRA_SERVICO: TSmallintField;
    qryCaixasTURNO: TSmallintField;
    qryCaixasSELECIONADO: TSmallintField;
    qryCaixasDESCRICAO: TIBStringField;
    frxCrossObject1: TfrxCrossObject;
    frxBIFFExport1: TfrxBIFFExport;
    qryRelEstornos: TIBQuery;
    dtQryRelEstornos: TfrxDBDataset;
    dsQryItensCompras: TDataSource;
    qryComprasRefCruzada: TIBQuery;
    dtComprasRefCruzada: TfrxDBDataset;
    qryTotaisCompraRefCruzada: TIBQuery;
    dtTotaisCompraRefCruzada: TfrxDBDataset;
    qryProdutosVendidosHoraGrupo: TIBQuery;
    dtProdutosVendidosHoraGrupo: TfrxDBDataset;
    qryNotasInutilizadas: TIBQuery;
    dtNotasInutilizadas: TfrxDBDataset;
    procedure rptGetValue(const VarName: String; var Value: Variant);

    procedure setPeriodoRelatorio(periodo : string);
    procedure setFiltroRelatorio(filtro : string);


    function  getPeriodoRelatorio() : string;
    function  getFiltroRelatorio() : string;

    function  getItemSelecionado() : string;
    procedure setItemSelecionado(Item: string);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dRelatorios: TdRelatorios;
  periodoRelatorio : string;
  filtroRelatorio : string;
  ItemSelecionado : string;

implementation

uses uu_data_module;

{$R *.dfm}


procedure TdRelatorios.setPeriodoRelatorio(periodo : string);
begin
  periodoRelatorio := periodo;
end;



function TdRelatorios.getPeriodoRelatorio() : string;
begin
 result :=  periodoRelatorio;
end;


procedure TdRelatorios.setFiltroRelatorio(filtro : string);
begin
  filtroRelatorio  := filtro;
end;


function TdRelatorios.getFiltroRelatorio() : string;
begin
 result :=  filtroRelatorio;
end;



procedure TdRelatorios.setItemSelecionado(Item: string);
begin
  ItemSelecionado := Item;
end;


function TdRelatorios.getItemSelecionado() : string;
begin
 result :=  ItemSelecionado
end;






procedure TdRelatorios.rptGetValue(const VarName: String;
  var Value: Variant);
begin
  if  VarName  = 'PeriodoRelatorio' then
    begin
      Value :=  getPeriodoRelatorio();
    end;

  if  VarName  = 'ItemSelecionado' then
    begin
      Value :=  getItemSelecionado;
    end;

  if  VarName  = 'filtroRelatorio' then
    begin
      Value :=  getFiltroRelatorio;
    end;




end;

end.
