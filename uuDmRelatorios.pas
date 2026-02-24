unit uuDmRelatorios;

interface

uses
  SysUtils, Classes, frxClass, frxDBSet, DB, cxImage,
  frxExportPDF,
  frxExportXLS, frxExportRTF,
  frxExportHTMLDiv, frxExportXLSX,  frxCross, frxExportBIFF,


  FireDAC.Comp.Client,
  IBX.IBCustomDataSet, IBX.IBQuery,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, frxChart,
  frxExportHelpers, frxExportBaseDialog, FireDAC.Phys.Intf, FireDAC.DApt.Intf;

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
    qryComprasPorGrupo: TIBQuery;
    dtComprasPorGrupo: TfrxDBDataset;
    qryComprasItem: TIBQuery;
    dtComprasPorItem: TfrxDBDataset;
    qryItemMaisBaratoPeriodo: TIBQuery;
    dtItemMaisBaratoPeriodo: TfrxDBDataset;
    dtItemMaisCaroPeriodo: TfrxDBDataset;
    qryItemMaisCaroPeriodo: TIBQuery;
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
    dtItensLancamentosRD: TfrxDBDataset;
    qryRelAnaliseGerencialMensal: TIBQuery;
    frxCrossObject1: TfrxCrossObject;
    frxBIFFExport1: TfrxBIFFExport;
    qryRelEstornos: TIBQuery;
    dtQryRelEstornos: TfrxDBDataset;
    qryComprasRefCruzada: TIBQuery;
    dtComprasRefCruzada: TfrxDBDataset;
    qryTotaisCompraRefCruzada: TIBQuery;
    dtTotaisCompraRefCruzada: TfrxDBDataset;
    qryProdutosVendidosHoraGrupo: TIBQuery;
    dtProdutosVendidosHoraGrupo: TfrxDBDataset;
    qryNotasInutilizadas: TIBQuery;
    dtNotasInutilizadas: TfrxDBDataset;
    qryRelInventario: TFDQuery;
    qryRelItensInventario: TFDQuery;
    qryRelInventarioCODIGO: TLargeintField;
    qryRelInventarioDATA_INVENTARIO: TDateField;
    qryRelInventarioDATA_SISTEMA: TDateField;
    qryRelInventarioDATA_HORA_SO: TSQLTimeStampField;
    qryRelInventarioCOD_HISTORICO: TIntegerField;
    qryRelInventarioCOD_USUARIO: TStringField;
    qryRelInventarioNOME_USUARIO: TStringField;
    qryRelInventarioTOTAL_PERDAS: TBCDField;
    qryRelInventarioTOTAL_INVENTARIO: TBCDField;
    qryRelInventarioCOD_EMPRESA: TIntegerField;
    qryRelInventarioOBS: TStringField;
    qryRelInventarioTOTAL_SOBRAS: TBCDField;
    dsRelInventario: TfrxDBDataset;
    qryRelItensInventarioCODIGO: TLargeintField;
    qryRelItensInventarioCOD_INVENTARIO: TLargeintField;
    qryRelItensInventarioCOD_PRODUTO: TStringField;
    qryRelItensInventarioDESCRICAO: TStringField;
    qryRelItensInventarioESTOQUE_SISTEMA: TFMTBCDField;
    qryRelItensInventarioESTOQUE_APURADO: TFMTBCDField;
    qryRelItensInventarioCOD_UNIDADE: TStringField;
    qryRelItensInventarioDESC_UNIDADE: TStringField;
    qryRelItensInventarioCUSTO: TBCDField;
    qryRelItensInventarioAJUSTE: TBCDField;
    qryRelItensInventarioTOTAL_AJUSTE: TFMTBCDField;
    qryRelItensInventarioTOTAL_INVENTARIO: TBCDField;
    dtRelItensInventario: TfrxDBDataset;
    qryRelInventariosPeriodo: TFDQuery;
    dtInventarios: TfrxDBDataset;
    qryRelInventariosPeriodoCODIGO: TLargeintField;
    qryRelInventariosPeriodoDATA_INVENTARIO: TDateField;
    qryRelInventariosPeriodoCOD_HISTORICO: TIntegerField;
    qryRelInventariosPeriodoDESCRICAO_HISTORICO: TStringField;
    qryRelInventariosPeriodoNOME_USUARIO: TStringField;
    qryRelInventariosPeriodoTOTAL_SOBRAS: TBCDField;
    qryRelInventariosPeriodoTOTAL_PERDAS: TBCDField;
    qryRelInventariosPeriodoTOTAL_INVENTARIO: TBCDField;
    DataSource1: TDataSource;
    qryRelItensInventarioNOMEGRUPO: TStringField;
    qryResumoInventarios: TFDQuery;
    frxDBDataset1: TfrxDBDataset;
    qryRelFatComparativoMensal: TFDQuery;
    DTqryRelFatComparativoMensal: TfrxDBDataset;
    qryRelFatCompDia: TFDQuery;
    dtqryRelFatCompDia: TfrxDBDataset;
    dtMovimentoMesa: TfrxDBDataset;
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
    procedure LoadPicture(AObjectPictureName: string; ACxImageObject: TcxImage);
  end;

var
  dRelatorios: TdRelatorios;
  periodoRelatorio : string;
  filtroRelatorio : string;
  ItemSelecionado : string;

implementation



{$R *.dfm}

procedure TdRelatorios.LoadPicture(AObjectPictureName : string; ACxImageObject : TcxImage);
begin
  TfrxPictureView(rpt.FindObject(AObjectPictureName)).Picture.Assign(ACxImageObject.Picture);
end;


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
