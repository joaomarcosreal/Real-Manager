  unit UU_DM_RELATORIOS;

interface

uses
  SysUtils, Classes, DB,
  IBCustomDataSet, IBQuery, frxExportMail,
  frxExportImage, frxExportText, frxExportCSV, frxClass, frxDBSet,
  frxExportPDF, frxExportHTML, frxExportXLS, frxExportXML, frxExportRTF,
  frxChart, frxExportXLSX, ACBrNFeDANFEClass, ACBrNFeDANFEFR,
  frxExportDOCX, frxExportBIFF, DBClient;

type
  Tdm_relatorios = class(TDataModule)
    ds_parametros: TDataSource;
    qryEstornosCaixa: TIBQuery;
    dtProdutos: TfrxDBDataset;
    qryParametros: TIBQuery;
    dtBairros: TfrxDBDataset;
    dtParametros: TfrxDBDataset;
    qryRelatorioMargemProdutos: TIBQuery;
    dtRelatorioMargemProdutos: TfrxDBDataset;
    qryClientesAniversariantes: TIBQuery;
    dtClientesAniversariantes: TfrxDBDataset;
    qryConsumoClientes: TIBQuery;
    dtConsumoClientes: TfrxDBDataset;
    qryConferenciaCaixa: TIBQuery;
    dtConferenciaCAixa: TfrxDBDataset;
    qryClientesPedidosDelivery: TIBQuery;
    qryClientesPedidosDeliveryCODIGO: TIBStringField;
    qryClientesPedidosDeliveryNOME: TIBStringField;
    qryClientesPedidosDeliveryTELEFONE: TIBStringField;
    qryClientesPedidosDeliverySEXO: TIBStringField;
    qryClientesPedidosDeliveryENDERECO: TIBStringField;
    qryClientesPedidosDeliveryCOD_BAIRRO: TIntegerField;
    qryClientesPedidosDeliveryCOMPLEMENTO: TIBStringField;
    qryClientesPedidosDeliveryREFERENCIA1: TIBStringField;
    qryClientesPedidosDeliveryREFERENCIA2: TIBStringField;
    qryProdutosVendidosCaixa: TIBQuery;
    dtClientesDelivery: TfrxDBDataset;
    dsClientesDelivery: TDataSource;
    dtPedidosClientesDelivery: TfrxDBDataset;
    qryItensPedidoDelivery: TIBQuery;
    dsPedidosClientesDelivery: TDataSource;
    dtItensPedidoDelivery: TfrxDBDataset;
    dsQryItensPedidosDelivery: TDataSource;
    qryContatoEstrategicoDelivery: TIBQuery;
    dtContatoEstrategicoDelivery: TfrxDBDataset;
    qryVendas: TIBQuery;
    dtVendas: TfrxDBDataset;
    qryPagamentosVendas: TIBQuery;
    dsQryVendas: TDataSource;
    dtPagamentosVenda: TfrxDBDataset;
    dtProdutosVendidosCaixa: TfrxDBDataset;
    dtEstornosCaixa: TfrxDBDataset;
    qryTransferenciasProdutos: TIBQuery;
    dtTransferenciasProdutos: TfrxDBDataset;
    qryResumoCaixa: TIBQuery;
    dtResumoCaixa: TfrxDBDataset;
    qryResumoChurrascaria: TIBQuery;
    dtResumoChurrascaria: TfrxDBDataset;
    qryIndicadoresCaixa: TIBQuery;
    dtIndicadoresCaixa: TfrxDBDataset;
    qryTransferenciasMesa: TIBQuery;
    dtTransferenciasMesa: TfrxDBDataset;
    qryEstornosMesa: TIBQuery;
    dtEstornosMesa: TfrxDBDataset;
    qryFaturamento: TIBQuery;
    dtFaturamento: TfrxDBDataset;
    dtFaturamentoDiarioPeriodoSintetico: TfrxDBDataset;
    dtFaturamentoMensalPeriodoAnalitico: TfrxDBDataset;
    dtFaturamentoMensalPeriodoSintetico: TfrxDBDataset;
    qryMovimentoAuditoriaMesas: TIBQuery;
    qryPedidosClientesDelivery: TIBQuery;
    qryAuditoriaMesas: TIBQuery;
    dtRelatorioAuditoriaMesas: TfrxDBDataset;
    dsAuditoriaMesas: TDataSource;
    dtMovimentoAuditoriaMesas: TfrxDBDataset;
    qryRecebimentosAuditoriaMesas: TIBQuery;
    dtRecebimentosAuditoria: TfrxDBDataset;
    qryPedidosEntregadores: TIBQuery;
    dtQryPedidosEntregadores: TfrxDBDataset;
    dtClientesBoatePeriodo: TfrxDBDataset;
    qryClientesBoatePeriodo: TIBQuery;
    qryEspelhoNotasEntrada: TIBQuery;
    dsQryEspelhoNotasEntrada: TDataSource;
    dtNotasEntrada: TfrxDBDataset;
    qryItensEspelhoNotasEntrada: TIBQuery;
    dsQryItensEspelhoNotasEntrada: TDataSource;
    dtItensNotasEntrada: TfrxDBDataset;
    qryNotasConsumidor: TIBQuery;
    dtNotasConsumidor: TfrxDBDataset;
    qryNotasTransporte: TIBQuery;
    dtNotasTransporte: TfrxDBDataset;
    qryConfLVFSEntradas: TIBQuery;
    dtConfLVFEntradas: TfrxDBDataset;
    qryEspelhoNotaSaida: TIBQuery;
    dsQryEspelhoNotaSaida: TDataSource;
    dtEspelhoNotaSaida: TfrxDBDataset;
    qryItensEspelhoNotaSaida: TIBQuery;
    dsQryItensEspelhoNotaSaida: TDataSource;
    dtItensNotaSaida: TfrxDBDataset;
    qryFaturasAbertas: TIBQuery;
    dtFaturasAbertas: TfrxDBDataset;
    dtFaturasAbertasDetalhado: TfrxDBDataset;
    qryProdutosFatura: TIBQuery;
    dsFaturasAbertas: TDataSource;
    dtProdutosFaturasAbertas: TfrxDBDataset;
    qryTitulosCpagEntrada: TIBQuery;
    DsqryTitulosCpagEntrada: TDataSource;
    DtTitulosCpagEntrada: TfrxDBDataset;
    qryProducaoGarconsSintetico: TIBQuery;
    dtProducaoGarconsSintetico: TfrxDBDataset;
    dtProducaoGarconsSinteticoAgrupado: TfrxDBDataset;
    qryTaxaServico: TIBQuery;
    dtTaxaServicoRateado: TfrxDBDataset;
    dtTaxaDeServicoDiario: TfrxDBDataset;
    dtTaxaServicoAgrupadoData: TfrxDBDataset;
    dtTaxaServicoAuditoria: TfrxDBDataset;
    qryPlanoContas: TIBQuery;
    dtPlanoContas: TfrxDBDataset;
    qryContasApagar: TIBQuery;
    dtContasApagar: TfrxDBDataset;
    qrySangrias: TIBQuery;
    dtSangrias: TfrxDBDataset;
    qryConsumoAtualMesas: TIBQuery;
    dtConsumoAtualMesas: TfrxDBDataset;
    qryBorderoContasPagar: TIBQuery;
    dtBorderoContasApagar: TfrxDBDataset;
    DsqryBorderoContasPagar: TDataSource;
    qryParcelasContasApagar: TIBQuery;
    DtqryParcelasContasApagar: TfrxDBDataset;
    qryRankingProdutos: TIBQuery;
    dtRankingProdutos: TfrxDBDataset;
    qryRelEstatisticaVendas: TIBQuery;
    dtRelEstatisticaVendas: TfrxDBDataset;
    qryResumoCaixaTurno: TIBQuery;
    dtResumoCaixaTurno: TfrxDBDataset;
    qryProdutosTransferenciaMesas: TIBQuery;
    frxDBDataset1: TfrxDBDataset;
    dsQryTransferenciaMesas: TDataSource;
    qryRD: TIBQuery;
    dtRd: TfrxDBDataset;
    qryRelGruposApuracao: TIBQuery;
    ddtRelGruposApuracao: TfrxDBDataset;
    qryRelGruposApuracaoSintetico: TIBQuery;
    frxDBDataset2: TfrxDBDataset;
    qryComparativoVendas: TIBQuery;
    dtComparativoPeriodoVendas: TfrxDBDataset;
    dtManifestacaoNFE: TfrxDBDataset;
    qryProd: TIBQuery;
    dtProd: TfrxDBDataset;
    dtProjecoesRD: TfrxDBDataset;
    qryProjecaoRD: TIBQuery;
    qryProjecaoRDRESULTADO: TSmallintField;
    qryProjecaoRDCOD_GRUPO_RAIZ: TIBStringField;
    qryProjecaoRDDESC_RAIZ: TIBStringField;
    qryProjecaoRDDESDOBRAMENTO_PAI: TIBStringField;
    qryProjecaoRDCOD_GRUPO_PAI: TIBStringField;
    qryProjecaoRDDESC_PAI: TIBStringField;
    qryProjecaoRDDESDOBRAMENTO_FILHO: TIBStringField;
    qryProjecaoRDCOD_GRUPO: TIBStringField;
    qryProjecaoRDNIVEL: TSmallintField;
    qryProjecaoRDDESCRICAO: TIBStringField;
    qryProjecaoRDPROJECAO_INICIAL: TFloatField;
    qryProjecaoRDPERC_PROJ_FAT: TIBBCDField;
    qryProjecaoRDREPROJECAO: TFloatField;
    qryProjecaoRDPERC_REPROJ_FAT: TIBBCDField;
    qryProjecaoRDTOTAL: TFloatField;
    qryProjecaoRDPERC_FAT_REAL: TIBBCDField;
    qryProjecaoRDSALDO: TFloatField;
    qryProjecaoRDPERC_GERAL: TIBBCDField;
    qryProjecaoRDPERC_GRUPO_PAI: TIBBCDField;
    qryProjecaoRDPROJ_FAT_MES: TFloatField;
    qryProjecaoRDREPROJ_FAT_MES: TFloatField;
    qryProjecaoRDFAT_REAL_MES: TFloatField;
    dsProjecaoRD: TDataSource;
    rpt: TfrxReport;
    frxRTFExport1: TfrxRTFExport;
    frxPDFExport1: TfrxPDFExport;
    qryProdutosGarcons: TIBQuery;
    dsProdutosGarcons: TDataSource;
    qryProdutosVendidosCSTPis: TIBQuery;
    dtProdutosVendidosPisCofins: TfrxDBDataset;
    qryAlteracoesPedidos: TIBQuery;
    QryPedidosAlterados: TIBQuery;
    dtPedidosAlterados: TfrxDBDataset;
    QryPedidosAlteradosCOD_PEDIDO: TIBStringField;
    dsPedidosAlterados: TDataSource;
    dtAlteracoesPedido: TfrxDBDataset;
    qryProdutosAlteracaoPedido: TIBQuery;
    dsQryAlteracoesPedidos: TDataSource;
    dtProdutosAlteracaoPedido: TfrxDBDataset;
    frxXLSExport1: TfrxXLSExport;
    frxXMLExport1: TfrxXMLExport;
    frxBIFFExport1: TfrxBIFFExport;
    frxDOCXExport1: TfrxDOCXExport;
    dtFaturamentoDiarioPeriodoSinteticoEstacao: TfrxDBDataset;
    qryRelComparativoProdutos: TIBQuery;
    dscdsRelProdutosVendidosTemp: TDataSource;
    DTVARIOSPERIODOS: TfrxDBDataset;
    qryRelEstaticoVendaDiario: TIBQuery;
    dtEstatisticoVendasDiario: TfrxDBDataset;
    cdsRelProdutosVendidosTemp: TClientDataSet;
    cdsRelProdutosVendidosTempcod_empresa: TStringField;
    cdsRelProdutosVendidosTempnome_empresa: TStringField;
    cdsRelProdutosVendidosTempdata_inicial: TDateField;
    cdsRelProdutosVendidosTempdata_final: TDateField;
    cdsRelProdutosVendidosTempalias_empresa: TStringField;
    cdsRelProdutosVendidosTempHORA_INICIAL: TTimeField;
    cdsRelProdutosVendidosTempHORA_FINAL: TTimeField;
    frxDBDataset3: TfrxDBDataset;
    qryRdComparativo: TIBQuery;
    dtRdComparativo: TfrxDBDataset;
    qryRelFatHora: TIBQuery;
    qryRelFatHoraHORA: TSmallintField;
    qryRelFatHoraDATA: TDateField;
    qryRelFatHoraTC: TIntegerField;
    qryRelFatHoraTOTAL: TIBBCDField;
    DTFatHora: TfrxDBDataset;
    qryRelFatHoraTM: TIBBCDField;
    qryProdutosGarconsCOD_GARCON: TIBStringField;
    qryProdutosGarconsAPELIDO: TIBStringField;
    qryProdutosGarconsCOD_BARRAS: TIBStringField;
    qryProdutosGarconsDESCRICAO: TIBStringField;
    qryProdutosGarconsDESC_G_RAIZ: TIBStringField;
    qryProdutosGarconsDESC_G_PAI: TIBStringField;
    qryProdutosGarconsDESCRICAO_GRUPO: TIBStringField;
    qryProdutosGarconsCOD_GRUPO: TIBStringField;
    qryProdutosGarconsQUANTIDADE_VENDIDA: TFMTBCDField;
    qryProdutosGarconsTOTAL_VENDIDO: TFMTBCDField;
    qryProdutosGarconsTOTAL_COMISSAO: TFMTBCDField;
    frxDBDataset4: TfrxDBDataset;
    qryProdutosVendidosCaixaCOD_PRODUTO: TIBStringField;
    qryProdutosVendidosCaixaCOD_GRUPO: TIBStringField;
    qryProdutosVendidosCaixaDESCRICAO_GRUPO: TIBStringField;
    qryProdutosVendidosCaixaDESCRICAO: TIBStringField;
    qryProdutosVendidosCaixaQUANTIDADE_REAL: TIBBCDField;
    qryProdutosVendidosCaixaQUANTIDADE_CONTAGEM: TIBBCDField;
    qryProdutosVendidosCaixaVALOR_UNITARIO: TIBBCDField;
    qryProdutosVendidosCaixaTOT: TFloatField;
    qryProdutosVendidosCaixaCOD_BARRAS: TIBStringField;
    qryProdutosVendidosCaixaCOD_G_RAIZ: TIBStringField;
    qryProdutosVendidosCaixaDESC_G_RAIZ: TIBStringField;
    qryProdutosVendidosCaixaCOD_G_PAI: TIBStringField;
    qryProdutosVendidosCaixaDESC_G_PAI: TIBStringField;
    qryProdutosVendidosCaixaCOD_GRUPO1: TIBStringField;
    qryProdutosVendidosCaixaDESC_GRUPO: TIBStringField;
    qryRankClientesDelivery: TIBQuery;
    dtRankClientesDelivery: TfrxDBDataset;
    procedure rptBeforeConnect(Sender: TfrxCustomDatabase;
      var Connected: Boolean);
    procedure rptGetValue(const VarName: String; var Value: Variant);
  private

    { Private declarations }

  public
    { Public declarations }

     procedure setPeriodoRelatorio(periodo : string);
    procedure setDiaDaSemanaRelatorio(Adia: smallint; AValor: boolean);
     procedure setFormaPagamentoRelatorio(forma : string);
     function  getFormaDePagamento() : string;
     function  getPeriodoRelatorio() : string;
     procedure setNomeOperador(operador : string);
     function  getNomeOperador() : string;

     procedure setNumeroCaixa(caixa : string);
     function  getNumeroCaixa() : string;

     function  getObservacaoRelatorio() : string;
     procedure setObservacaoRelatorio(observacao : string);




  end;

var
  dm_relatorios: Tdm_relatorios;
      periodoRelatorio : string;
      nomeOperador : string;
      observacaoRelatorio : string;
      formaPagamentoErlatorio : string;
      numeroCaixa : string;
      SEG,TER,QUA,QUI,SEX,SAB,DOM : boolean;


implementation

uses uu_data_module;

{$R *.dfm}

procedure Tdm_relatorios.rptBeforeConnect(Sender: TfrxCustomDatabase;
  var Connected: Boolean);
begin
 qryParametros.Active:=true;
end;

procedure Tdm_relatorios.rptGetValue(const VarName: String;
  var Value: Variant);
begin
   if  VarName  = 'PeriodoRelatorio' then
    begin
      Value :=  getPeriodoRelatorio();
    end;

   if varName = 'NomeOperador' then
    begin
      value := getNomeOperador;
    end;

   if varName = 'NumeroCaixa' then
    begin
      value := numeroCaixa;
    end;

   if varName = 'FORMADEPAGAMENTO' then
    begin
      value := getFormaDePagamento();
    end;

   if varName = 'observacaoRelatorio' then
    begin
      value := getObservacaoRelatorio();
    end;

    if VarName = 'SEG' then
      Value := BoolToStr(SEG);


    if VarName = 'TER' then
      Value := BoolToStr(TER);

    if VarName = 'QUA' then
      Value := BoolToStr(QUA);

    if VarName = 'QUI' then
      Value :=  BoolToStr(QUI);

    if VarName = 'SEX' then
      Value := BoolToStr(SEX);

    if VarName = 'SAB' then
      Value := BoolToStr(SAB);

    if VarName = 'DOM' then
      Value := BoolToStr(DOM);

end;


procedure Tdm_relatorios.setPeriodoRelatorio(periodo : string);
begin
  periodoRelatorio := periodo;
end;


function Tdm_relatorios.getPeriodoRelatorio() : string;
begin
 result :=  periodoRelatorio;
end;

procedure Tdm_relatorios.setDiaDaSemanaRelatorio(Adia: smallint; AValor : boolean);
begin
  case Adia  of
   0: DOM := AValor;
   1: SEG := AValor;
   2: TER := AValor;
   3: QUA := AValor;
   4: QUI := AValor;
   5: SEX := AValor;
   6: SAB := AValor;
  end;
end;

procedure Tdm_relatorios.setFormaPagamentoRelatorio(forma : string);
begin
  formaPagamentoErlatorio := forma;
end;
function Tdm_relatorios.getFormaDePagamento() : string;
begin
 result := formaPagamentoErlatorio;
end;


procedure Tdm_relatorios.setNomeOperador(operador : string);
begin
  nomeOperador := operador;
end;


procedure Tdm_relatorios.setObservacaoRelatorio(observacao : string);
begin
 observacaoRelatorio := observacao;
end;

function Tdm_relatorios.getObservacaoRelatorio() : string;
begin
  result := observacaoRelatorio;
end;


function Tdm_relatorios.getNomeOperador() : string;
begin
 result :=  nomeOperador;
end;


procedure Tdm_relatorios.setNumeroCaixa(caixa : string);
begin
  numeroCaixa := caixa;
end;


function Tdm_relatorios.getNumeroCaixa() : string;
begin
 result :=  numeroCaixa;
end;



end.
