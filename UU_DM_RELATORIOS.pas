unit UU_DM_RELATORIOS;

interface

uses
  SysUtils, Classes, DB, strutils, frxClass, frxDBSet, DBClient, frxPreview,
  FireDAC.Comp.Client, IBX.IBCustomDataSet, IBX.IBQuery, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, frxExportDOCX,
  frxExportXLSX, frxExportXLS, frxExportCSV, frxExportXML, frxExportPDF,
  frxExportBaseDialog, frxChart, FireDAC.Phys.Intf, FireDAC.DApt.Intf, frxRich;

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
    qryRelFaturamento: TIBQuery;
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
    qryRankClientesDelivery: TIBQuery;
    dtRankClientesDelivery: TfrxDBDataset;
    qryRelParametrosFiscais: TIBQuery;
    qryRelParametrosFiscaisCOD_PRODUTO: TIBStringField;
    qryRelParametrosFiscaisDESCRICAO: TIBStringField;
    qryRelParametrosFiscaisCFOP_SAIDA: TIBStringField;
    qryRelParametrosFiscaisCSOSN: TIBStringField;
    qryRelParametrosFiscaisCST_SAIDA: TIBStringField;
    qryRelParametrosFiscaisNCM: TIBStringField;
    qryRelParametrosFiscaisCEST: TIBStringField;
    qryRelParametrosFiscaisALIQ_ICMS: TIBStringField;
    qryRelParametrosFiscaisDESC_GRUPO: TIBStringField;
    qryRelParametrosFiscaisCOD_GRUPO: TIBStringField;
    qryRelParametrosFiscaisREDUCAO_BASE_ICMS: TFMTBCDField;
    dtRelParametrosFiscais: TfrxDBDataset;
    qryRelParametrosFiscaisCST_PIS_COFINS: TIBStringField;
    qryRelParametrosFiscaisALIQ_PIS: TIBBCDField;
    qryRelParametrosFiscaisALIQ_COFINS: TIBBCDField;
    qryResumoMotoboys: TIBQuery;
    dtResumoMotoboys: TfrxDBDataset;
    qryRelSangrias: TIBQuery;
    dtRelSangrias: TfrxDBDataset;
    qryRelDetalhesVenda: TIBQuery;
    dqryRelDetalhesVenda: TfrxDBDataset;
    dsQryRelDetalhesVenda: TDataSource;
    qryRelProdutosDetalhes: TIBQuery;
    dQryProdutosDetalhesVenda: TfrxDBDataset;
    qryPagamentosDetalheVenda: TIBQuery;
    frxDBDataset6: TfrxDBDataset;
    qryRelFichasTecnicas: TIBQuery;
    DtqryRelFichasTecnicas: TfrxDBDataset;
    qryItensFichaTecnica: TIBQuery;
    dsRelFichasTecnicas: TDataSource;
    dtqryItensFichaTecnica: TfrxDBDataset;
    qryRelProdutosVendidos: TIBQuery;
    dtQryRelProdutosVendidos: TfrxDBDataset;
    DtqryRelRankingProdutos: TfrxDBDataset;
    qryRankingProdutos: TFDQuery;
    qryRelRecebimentosCartoes: TFDQuery;
    DtqryRelRecebimentosCartoes: TfrxDBDataset;
    qryRelLancamentosRD: TIBQuery;
    dtLancamentosRD: TfrxDBDataset;
    qryCompras: TIBQuery;
    dtCompras: TfrxDBDataset;
    qryItensCompra: TIBQuery;
    dtItensCompra: TfrxDBDataset;
    dsQryCompras: TDataSource;
    frxPDFExport1: TfrxPDFExport;
    frxXMLExport1: TfrxXMLExport;
    frxCSVExport1: TfrxCSVExport;
    frxXLSExport1: TfrxXLSExport;
    frxXLSXExport1: TfrxXLSXExport;
    frxDOCXExport2: TfrxDOCXExport;
    dtFaturamentoResumido: TfrxDBDataset;
    qryRelInsumosProducao: TFDQuery;
    dtRelInsumosProducao: TfrxDBDataset;
    frxChartObject1: TfrxChartObject;
    dtCurvaABCProdutosVendidos: TfrxDBDataset;
    qryRelCurvaABCProdutosVendidos: TFDQuery;
    frxDBDataset7: TfrxDBDataset;
    qryQRCodesMesa: TFDQuery;
    dtQrCcodesMesa: TfrxDBDataset;
    dtDRENovo: TfrxDBDataset;
    frxRichObject1: TfrxRichObject;
    procedure rptBeforeConnect(Sender: TfrxCustomDatabase; var Connected: Boolean);
    procedure rptGetValue(const VarName: string; var Value: Variant);
  private
    procedure RegistraComponentesExcel;



    { Private declarations }

  public
    { Public declarations }
    procedure setVariavelRelatorio(AVarName, AValor: string);
    procedure setDiaDaSemanaRelatorio(Adia: smallint; AValor: boolean);
    procedure setFormaPagamentoRelatorio(forma: string);
    function getFormaDePagamento(): string;
    procedure setPeriodoRelatorio(periodo: string);
    function getPeriodoRelatorio(): string;
    procedure setNomeOperador(operador: string);
    function getNomeOperador(): string;
    procedure setNumeroCaixa(caixa: string);
    function getNumeroCaixa(): string;
    function getObservacaoRelatorio(): string;
    procedure setObservacaoRelatorio(observacao: string);
    procedure setImprimirDetalhes(AImprimir: Boolean);
  end;

var
  dm_relatorios: Tdm_relatorios;
  periodoRelatorio: string;
  V_EMPRESAS_SELECIONADAS: string;
  V_ADQUIRENTES_SELECIONADAS: string;
  V_FORMAS_PAGAMENTO_SELECIONADAS: string;
  V_TIPO_OPERACAO_CREDITO_SELECIONADAS: string;
  V_TIPO_DATA_SELECIONADA: string;
  V_GRUPO_SELECIONADO: string;
  V_TOTAL_PRODUTOS, V_TOTAL_DESCONTOS, V_TOTAL: string;
  V_NOME_MES_ATUAL, V_NOME_MES_ANTERIOR, V_NOME_MES_ANO_ANTERIOR: string;
  V_MESAS, V_BALCAO, V_DELIVERY: Boolean;
  V_TODOS_PRODUTOS, V_APENAS_COMBOS: Boolean;
  nomeOperador: string;
  observacaoRelatorio: string;
  formaPagamentoErlatorio: string;
  imprimir_detalhes: boolean;
  numeroCaixa: string;
  SEG, TER, QUA, QUI, SEX, SAB, DOM: boolean;

implementation

uses
  uu_data_module;



{$R *.dfm}

procedure Tdm_relatorios.rptBeforeConnect(Sender: TfrxCustomDatabase; var Connected: Boolean);
begin
  qryParametros.Active := true;
end;

procedure Tdm_relatorios.rptGetValue(const VarName: string; var Value: Variant);
begin
  if VarName = 'PeriodoRelatorio' then
  begin
    Value := getPeriodoRelatorio();
  end;

  if VarName = 'NomeOperador' then
  begin
    Value := getNomeOperador;
  end;

  if VarName = 'NumeroCaixa' then
  begin
    Value := numeroCaixa;
  end;

  if VarName = 'FORMADEPAGAMENTO' then
  begin
    Value := getFormaDePagamento();
  end;

  if VarName = 'IMPRIMIR_DETALHES' then
  begin
    Value := getFormaDePagamento();
  end;

  if VarName = 'observacaoRelatorio' then
  begin
    Value := getObservacaoRelatorio();
  end;

  if VarName = 'SEG' then
    Value := BoolToStr(SEG);

  if VarName = 'TER' then
    Value := BoolToStr(TER);

  if VarName = 'QUA' then
    Value := BoolToStr(QUA);

  if VarName = 'QUI' then
    Value := BoolToStr(QUI);

  if VarName = 'SEX' then
    Value := BoolToStr(SEX);

  if VarName = 'SAB' then
    Value := BoolToStr(SAB);

  if VarName = 'DOM' then
    Value := BoolToStr(DOM);

  if VarName = 'V_EMPRESAS_SELECIONADAS' then
    Value := V_EMPRESAS_SELECIONADAS;

  if VarName = 'V_MESAS' then
    Value := BoolToStr(V_MESAS);

  if VarName = 'V_BALCAO' then
    Value := BoolToStr(V_BALCAO);

  if VarName = 'V_DELIVERY' then
    Value := BoolToStr(V_DELIVERY);

  if VarName = 'V_GRUPO_SELECIONADO' then
    Value := V_GRUPO_SELECIONADO;

  if VarName = 'V_TOTAL_PRODUTOS' then
    Value := V_TOTAL_PRODUTOS;

  if VarName = 'V_TOTAL_DESCONTOS' then
    Value := V_TOTAL_DESCONTOS;

  if VarName = 'V_TOTAL' then
    Value := V_TOTAL;

  if VarName = 'V_NOME_MES_ATUAL' then
    Value := V_NOME_MES_ATUAL;
  if VarName = 'V_NOME_MES_ANTERIOR' then
    Value := V_NOME_MES_ANTERIOR;
  if VarName = 'V_NOME_MES_ANO_ANTERIOR' then
    Value := V_NOME_MES_ANO_ANTERIOR;

  if VarName = 'IMPRIME_DETALHES' then
    Value := BoolToStr(imprimir_detalhes);

  if VarName = 'V_TODOS_PRODUTOS' then
    Value := V_TODOS_PRODUTOS;

  if VarName = 'V_APENAS_COMBOS' then
    Value := V_APENAS_COMBOS;

  if VarName = 'V_ADQUIRENTES_SELECIONADAS' then
    Value := V_ADQUIRENTES_SELECIONADAS;

  if VarName = 'V_FORMAS_PAGAMENTO_SELECIONADAS' then
    Value := V_FORMAS_PAGAMENTO_SELECIONADAS;

  if VarName = 'V_TIPO_OPERACAO_CREDITO_SELECIONADAS' then
    Value := V_TIPO_OPERACAO_CREDITO_SELECIONADAS;

  if VarName = 'V_TIPO_DATA_SELECIONADA' then
    Value := V_TIPO_DATA_SELECIONADA;

end;

procedure Tdm_relatorios.setVariavelRelatorio(AVarName: string; AValor: string);
begin

  case AnsiIndexStr(UpperCase(AVarName), ['V_EMPRESAS_SELECIONADAS', 'SEG', 'TER', 'QUA', 'QUI', 'SEX', 'SAB', 'DOM', 'V_MESAS', 'V_BALCAO', 'V_DELIVERY', 'V_GRUPO_SELECIONADO', 'V_TOTAL_PRODUTOS', 'V_TOTAL_DESCONTOS', 'V_TOTAL', 'V_NOME_MES_ATUAL', 'V_NOME_MES_ANTERIOR', 'V_NOME_MES_ANO_ANTERIOR', 'V_TODOS_PRODUTOS', 'V_APENAS_COMBOS', 'V_ADQUIRENTES_SELECIONADAS', 'V_FORMAS_PAGAMENTO_SELECIONADAS', 'V_TIPO_OPERACAO_CREDITO_SELECIONADAS', 'V_TIPO_DATA_SELECIONADA']) of
    0:
      V_EMPRESAS_SELECIONADAS := AValor;
    1:
      SEG := StrToBool(AValor);
    2:
      TER := StrToBool(AValor);
    3:
      QUA := StrToBool(AValor);
    4:
      QUI := StrToBool(AValor);
    5:
      SEX := StrToBool(AValor);
    6:
      SAB := StrToBool(AValor);
    7:
      DOM := StrToBool(AValor);
    8:
      V_MESAS := StrToBool(AValor);
    9:
      V_BALCAO := StrToBool(AValor);
    10:
      V_DELIVERY := StrToBool(AValor);
    11:
      V_GRUPO_SELECIONADO := AValor;
    12:
      V_TOTAL_PRODUTOS := AValor;
    13:
      V_TOTAL_DESCONTOS := AValor;
    14:
      V_TOTAL := AValor;
    15:
      V_NOME_MES_ATUAL := AValor;
    16:
      V_NOME_MES_ANTERIOR := AValor;
    17:
      V_NOME_MES_ANO_ANTERIOR := AValor;
    18:
      V_TODOS_PRODUTOS := StrToBool(AValor);
    19:
      V_APENAS_COMBOS := StrToBool(AValor);
    20:
      V_ADQUIRENTES_SELECIONADAS := AValor;
    21:
      V_FORMAS_PAGAMENTO_SELECIONADAS := AValor;
    22:
      V_TIPO_OPERACAO_CREDITO_SELECIONADAS := AValor;
    23:
      V_TIPO_DATA_SELECIONADA := AValor;

  end;

end;

procedure Tdm_relatorios.setPeriodoRelatorio(periodo: string);
begin
  periodoRelatorio := periodo;
end;

function Tdm_relatorios.getPeriodoRelatorio(): string;
begin
  result := periodoRelatorio;
end;

procedure Tdm_relatorios.setDiaDaSemanaRelatorio(Adia: smallint; AValor: boolean);
begin
  case Adia of
    0:
      DOM := AValor;
    1:
      SEG := AValor;
    2:
      TER := AValor;
    3:
      QUA := AValor;
    4:
      QUI := AValor;
    5:
      SEX := AValor;
    6:
      SAB := AValor;
  end;
end;

procedure Tdm_relatorios.setFormaPagamentoRelatorio(forma: string);
begin
  formaPagamentoErlatorio := forma;
end;

procedure Tdm_relatorios.setImprimirDetalhes(AImprimir: Boolean);
begin
  imprimir_detalhes := AImprimir;
end;

function Tdm_relatorios.getFormaDePagamento(): string;
begin
  result := formaPagamentoErlatorio;
end;

procedure Tdm_relatorios.setNomeOperador(operador: string);
begin
  nomeOperador := operador;
end;

procedure Tdm_relatorios.setObservacaoRelatorio(observacao: string);
begin
  observacaoRelatorio := observacao;
end;

function Tdm_relatorios.getObservacaoRelatorio(): string;
begin
  result := observacaoRelatorio;
end;

function Tdm_relatorios.getNomeOperador(): string;
begin
  result := nomeOperador;
end;

procedure Tdm_relatorios.setNumeroCaixa(caixa: string);
begin
  numeroCaixa := caixa;
end;

function Tdm_relatorios.getNumeroCaixa(): string;
begin
  result := numeroCaixa;
end;

procedure Tdm_relatorios.RegistraComponentesExcel();
begin
  rpt.PreviewOptions.AllowEdit := True;
  rpt.PreviewOptions.Buttons := rpt.PreviewOptions.Buttons + [pbExport];
  rpt.EngineOptions.SilentMode := true;
end;

end.

