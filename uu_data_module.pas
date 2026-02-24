unit uu_data_module;

interface

uses
  windows, ComObj, Vcl.Imaging.pngimage, System.NetEncoding, Vcl.Imaging.jpeg,
  Graphics, cxPC, cxGraphics, ACBrDFeUtil, pcnLeitor, pcnNFeR, pcnNFeW,
  ACBrNFeConfiguracoes, ACBrNFe.Classes, ACBrNFeNotasFiscais, Produto, ShellAPI,
  JclStrings, cxImage, ACBrTEFDClass, System.UITypes, uCapturaImagem,
  System.SysUtils, System.JSON, system.JSON.Types, UUDadosConexaoAPIReplicacao,
  RealFramework, RealDaoExecute, URealDatasets, TransferenciaItem,
  System.Generics.Collections, DB, ACBrDeviceSerial, Classes, ACBrUtil,
  ACBrDFeSSL, System.AnsiStrings, blcksock, ACBrTEFComum, System.DateUtils,
  synacode, FireDAC.Stan.Option, pcteConversaoCTe, Vcl.Clipbrd,
  IdThreadComponent, ACBrGAV, ACBrEAD, ACBrBAL, ACBrInStore, ExeInfo,
  ACBrNFeDanfeFR, IdBaseComponent, FireDAC.Comp.Client, ACBrTEFD, ACBrNFe,
  ACBrSAT, JvCipher, ACBrDFeReport, ACBrNFeDANFeESCPOS, ACBrPosPrinter,
  IBX.IBTable, RxMemDS, typinfo, pcnConversao, pcnConversaoNFe, Stdctrls,
  dialogs, inifiles, XmlIntf, forms, wininet, Variants, controls, dbctrls,
  ExtCtrls, zlib, ACBrDevice, PRINTERS, registry, XMLDoc, ACBrSATClass,
  uuConsultaInfSat, Vcl.DialogMessage, FireDAC.Comp.DataSet, ACBrCTe,
  ACBrCTeDACTEFR, frameworkMobile, JvBrowseFolder, ACBrMail, IdGlobal,
  IdSSLOpenSSL, IBX.IBCustomDataSet, IBX.IBStoredProc, IBX.IBUpdateSQL,
  IBX.IBQuery, IBX.IBDatabase, FireDAC.Stan.Intf, FireDAC.Stan.Error,
  FireDAC.UI.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Phys,
  FireDAC.Phys.FB, FireDAC.VCLUI.Wait, FireDAC.Stan.Param, FireDAC.DatS,
  FireDAC.DApt, ACBrNFeDANFEClass, ACBrDFeDANFeReport, JvBaseDlg,
  ACBrCTeDACTEClass, ACBrDFe, ACBrSATExtratoClass, JvComponentBase, ACBrBase,
  REST.Types, REST.Client, Data.Bind.Components, Data.Bind.ObjectScope,
  ACBrSATExtratoESCPOS, FireDAC.Stan.Async, Alcinoe.StringUtils, Alcinoe.JSONDoc,
  IdComponent, IdTCPConnection, IdTCPClient, cxGridExportLink,    // Principal unit para exportação
        // Suporte ao Excel
  dxSpreadSheetCore,   // Funções core do Excel
  dxSpreadSheetTypes,  // Tipos de dados do Excel
  dxCore, dxSpreadSheetUtils, dxSpreadSheetStrs, cxGrid, cxGridDBTableView,
  cxGridTableView, cxGridCustomView, cxGridCustomTableView, FireDAC.Phys.Intf,
  FireDAC.Phys.FBDef, FireDAC.DApt.Intf, FireDAC.Phys.IBBase;

type
  TTipoOperacaoNFE = (TOpVenda, TOpTransferencia, TOpDevolucao, TopDevolucaoDeVenda, TOpNotaReferenciada);

  TTipoComprovante = (TcPreConta, TcEncerramento, TcTransferenciaItem, TcTransferenciaMesa);

  TTipoModuloVenda = (TeDelivery, TeBalcao, TeMesas);

  TTipoPesquisaProduto = (TeCodProduto, TeCodBarras);

  TTipoExportacaoCxGrid = (TExpXLSX, TExpHTML, TExpCSV, TExpTXT, TExpXML);

  THttpStatusCode = (scAccepted, scAmbiguous, scBadGateway, scBadRequest, scConflict, scContinue, scCreated, scExpectationFailed, scForbidden, scFound, scGatewayTimeout, scGone, scHttpVersionNotSupported, scInternalServerError, scLengthRequired, scMethodNotAllowed, scMoved, scMovedPermanently, scMultipleChoices, scNoContent, scNonAuthoritativeInformation, scNotAcceptable, scNotFound, scNotImplemented, scNotModified, scOK, scPartialContent, scPaymentRequired, scPreconditionFailed,
    scProxyAuthenticationRequired, scRedirect, scRedirectKeepVerb, scRedirectMethod, scRequestedRangeNotSatisfiable, scRequestEntityTooLarge, scRequestTimeout, scRequestUriTooLong, scResetContent, scSeeOther, scServiceUnavailable, scSwitchingProtocols, scTemporaryRedirect, scUnauthorized, scUnsupportedMediaType, scUnused, scUpgradeRequired, scUseProxy, scUnknown);

  tEstadoEcfSimulado = (tpsLivre, tpsVenda, tpsSubTotal, tpsTotalPagar, tpsPagamento, tpsRelatorio);

  tEstadoNFE = (tIndefinido, tNaoExisteSefaz, tCancelada, tAutorizada);

  tTipoLogin = (tLoginInicial, tPermissaoAcesso);

  TTipoProduto = (tProdutoTodos, tProdutoEstoque, tProdutoVenda, tSubProduto);

  TTipoOperacaoCrud = (TOperacaoNovo, ToperacaoAlterar, TOperacaoExclusao);

type
  TEstruturaPeriodo = record
    Inicio: TDate;
    Fim: TDate;
  end;

type
  TextratoEmitido = class
  public
    extratoValido: SmallInt;
    tipoDesconto: SmallInt;
    valorDesconto: Double;
    valorCouvert: Double;
    valorServico: Double;
    horaEmissao: TTime;
    codUsuario: string;
  end;

type
  TTabelaPreco = class
    codigo: Integer;
    descricao: string;
    sigla: string;
  end;

type
  Tdm = class(TDataModule)
    dbrestaurante: TIBDatabase;
    transacao: TIBTransaction;
    qryauxiliar: TIBQuery;
    dsqryauxiliar: TDataSource;
    qrymax: TIBQuery;
    qryauxiliar2: TIBQuery;
    dsqryauxiliar2: TDataSource;
    qryauxiliar3: TIBQuery;
    composicoes_temp: TRxMemoryData;
    composicoes_tempcod_item: TStringField;
    composicoes_tempcod_produto: TStringField;
    composicoes_tempcod_c_custo: TStringField;
    composicoes_tempdescricao_item: TStringField;
    composicoes_tempdescricao_c_custo: TStringField;
    ds_composicoes_temp: TDataSource;
    qry_consultas: TIBQuery;
    ds_qry_consultas: TDataSource;
    modulos_temp: TRxMemoryData;
    modulos_tempcod_modulo: TStringField;
    modulos_tempcod_mod: TStringField;
    modulos_tempdescricao: TStringField;
    submodulos_temp: TRxMemoryData;
    submodulos_tempcod_modulo: TStringField;
    submodulos_tempcod_mod: TStringField;
    submodulos_tempdescricao: TStringField;
    submodulos_temppermite: TIntegerField;
    modulos_temppermite: TIntegerField;
    composicoes_tempUnidade: TStringField;
    composicoes_tempdes_unidade: TStringField;
    dsqryauxiliar3: TDataSource;
    tb_usuarios: TIBTable;
    dsusuarios: TDataSource;
    ac_recebimentos_temp: TRxMemoryData;
    ac_recebimentos_tempcod_forma: TStringField;
    ac_recebimentos_tempDescricao: TStringField;
    ac_recebimentos_tempvalor: TFloatField;
    gastos_temp: TRxMemoryData;
    gastos_tempcodigo_item: TStringField;
    gastos_tempqtde: TFloatField;
    gastos_tempdescricao: TStringField;
    ds_gastos_temp: TDataSource;
    gastos_tempunidade: TStringField;
    gastos_tempcusto_unitario: TFloatField;
    ds_tabmemoria: TDataSource;
    ds_acompanhamentos_temp: TDataSource;
    proc_abate_estoque: TIBStoredProc;
    ds_tb_parametros: TDataSource;
    transLog: TIBTransaction;
    qry_itens_estoque: TIBQuery;
    ds_qry_itens_estoque: TDataSource;
    upd_itens_estoque: TIBUpdateSQL;
    qry_lanc_caixa: TIBQuery;
    qry_fornecedores: TIBQuery;
    ds_qry_fornecedores: TDataSource;
    upd_fornecedores: TIBUpdateSQL;
    qry_historicos_caixa: TIBQuery;
    ds_qry_historicos_caixa: TDataSource;
    upd_historicos_caixa: TIBUpdateSQL;
    qry_historicos_caixaCOD_HISTORICO: TIBStringField;
    qry_historicos_caixaDESCRICAO: TIBStringField;
    qry_historicos_caixaDATA_CADASTRO: TDateField;
    qry_grupos: TIBQuery;
    upd_grupos: TIBUpdateSQL;
    ds_qry_grupos: TDataSource;
    qry_gruposCOD_GRUPO: TIBStringField;
    qry_gruposDESCRICAO: TIBStringField;
    ds_qry_garcons: TDataSource;
    qry_garcons: TIBQuery;
    up_qry_garcons: TIBUpdateSQL;
    qry_garconsCOD_GARCON: TIBStringField;
    qry_garconsAPELIDO: TIBStringField;
    qry_garconsMETRE: TSmallintField;
    qry_garconsCOD_METRE: TIBStringField;
    qry_garconsAPELIDO1: TIBStringField;
    qry_formas_pagto: TIBQuery;
    upd_formas_pagto: TIBUpdateSQL;
    ds_qry_formas_pagto: TDataSource;
    qry_formas_pagtoCOD_FORMA: TIBStringField;
    qry_formas_pagtoDESCRICAO: TIBStringField;
    qry_formas_pagtoRP: TSmallintField;
    ds_clientes: TDataSource;
    qry_clientes: TIBQuery;
    upd_clientes: TIBUpdateSQL;
    qry_faturas: TIBQuery;
    upd_faturas: TIBUpdateSQL;
    qry_remota: TIBQuery;
    qry_faturasCOD_FATURA: TIBStringField;
    qry_faturasCOD_CLI: TIBStringField;
    qry_faturasDATA_FATURA: TDateField;
    qry_faturasDATA_VENCIMENTO: TDateField;
    qry_faturasDATA_PAGAMENTO: TDateField;
    qry_faturasVALOR_FATURA: TIBBCDField;
    qry_faturasVALOR_PAGO: TIBBCDField;
    qry_faturasCOD_USUARIO_INCLUSAO: TIBStringField;
    qry_faturasCOD_USUARIO_BAIXA: TIBStringField;
    qry_faturasSTATUS: TSmallintField;
    qry_faturasCOD_VENDA: TIBStringField;
    qry_faturasOBSERVACAO: TIBStringField;
    qry_faturasRAZAO_SOCIAL: TIBStringField;
    qry_faturasUSUARIO_INCLUSAO: TIBStringField;
    qry_faturasUSUARIO_BAIXA: TIBStringField;
    tbComprasTemp: TRxMemoryData;
    dsComprasTemp: TDataSource;
    qry_entradas: TIBQuery;
    ds_entradas: TDataSource;
    upd_entradas: TIBUpdateSQL;
    qryReceitas: TIBQuery;
    dsQryReceitas: TDataSource;
    updQryReceitas: TIBUpdateSQL;
    tbReceitasTemp: TRxMemoryData;
    dsReceitasTemp: TDataSource;
    tbReceitasTempcodigoItem: TStringField;
    tbReceitasTempdescricaoItem: TStringField;
    tbReceitasTempcodUnidade: TStringField;
    tbReceitasTempquantidade: TFloatField;
    tbReceitasTempdescricaoUnidade: TStringField;
    qryReceitasCOD_RECEITA: TIBStringField;
    qryReceitasCOD_GRUPO_RECEITA: TIBStringField;
    qryReceitasDESCRICAO: TIBStringField;
    qryReceitasPESSOAS: TSmallintField;
    qryReceitasPESO: TIBBCDField;
    qryReceitasCALORIAS: TIBBCDField;
    qryReceitasPROTEINAS: TIBBCDField;
    qryReceitasCARBOIDRATOS: TIBBCDField;
    qryReceitasPREPARO: TIBStringField;
    qryReceitasDESCRICAO_GRUPO: TIBStringField;
    qryAliquotas: TIBQuery;
    updQryAliquotas: TIBUpdateSQL;
    dsQryAliquotas: TDataSource;
    qryAliquotasCOD_ALIQUOTA: TIBStringField;
    qryAliquotasDESCRICAO: TIBStringField;
    qryAliquotasPARAMETRO: TIBStringField;
    qryAliquotasSINTEGRA: TIBStringField;
    qryAliquotasPARAMETRO1: TIBStringField;
    qryAliquotasPARAMETRO2: TIBStringField;
    qryECFS: TIBQuery;
    updQryECFS: TIBUpdateSQL;
    qryECFSCOD_ECF: TIBStringField;
    qryECFSNUM_SERIE: TIBStringField;
    qryECFSNUMORDEM: TIBStringField;
    qryECFSDESCRICAO: TIBStringField;
    dsQryECFS: TDataSource;
    transacaoProcedure: TIBTransaction;
    qryUnidades: TIBQuery;
    dsQryUnidades: TDataSource;
    updQryUnidades: TIBUpdateSQL;
    qryUnidadesCOD_UNIDADE: TIBStringField;
    qryUnidadesDESCRICAO: TIBStringField;
    qryUnidadesSIGLA: TIBStringField;
    qryUnidadesPARAMETRO: TIBBCDField;
    qryUnidadesCOD_PADRAO: TIBStringField;
    qryUnidadesDESCRICAOUNIDADEPADRAO: TIBStringField;
    qryTrasnferenciasEstoque: TIBQuery;
    dsTrasnferenciasEstoque: TDataSource;
    updTrasnferenciasEstoque: TIBUpdateSQL;
    qry_faturasSELECAO: TSmallintField;
    qryConsultaFaturas: TIBQuery;
    updQryConsultaFaturas: TIBUpdateSQL;
    dsQryConsultaFaturas: TDataSource;
    ds_qry_faturas: TDataSource;
    qry_clientesCOD_CLI: TIBStringField;
    qry_clientesRAZAO_SOCIAL: TIBStringField;
    qry_clientesNOME_FANTASIA: TIBStringField;
    qry_clientesENDERECO: TIBStringField;
    qry_clientesBAIRRO: TIBStringField;
    qry_clientesCEP: TIBStringField;
    qry_clientesTELEFONE: TIBStringField;
    qry_clientesFAX: TIBStringField;
    qry_clientesEMAIL: TIBStringField;
    qry_clientesCOD_TIPO: TIBStringField;
    qry_clientesATUALIZA_CUSTO: TSmallintField;
    qry_clientesCGC_CPF: TIBStringField;
    qry_clientesINSCRICAO_ESTADUAL: TIBStringField;
    qry_clientesINSCRICAO_MUNICIPAL: TIBStringField;
    qry_clientesOBSERVACAO: TIBStringField;
    qry_clientesDATA_CADASTRO: TDateField;
    qry_clientesDATA_ULTIMA_COMPRA: TDateField;
    qry_clientesSITUACAO: TSmallintField;
    qry_clientesCREDITO: TIBBCDField;
    qry_clientesPRAZO_PAGAMENTO: TIntegerField;
    qry_clientesDTNASCIMENTO: TDateField;
    qry_clientesRG: TIBStringField;
    qry_clientesCARTAO: TIBStringField;
    qryClientesNaCasa: TIBQuery;
    qryClientesNaCasaCOD_CARTAO: TIBStringField;
    qryClientesNaCasaRAZAO_SOCIAL: TIBStringField;
    dsQryClientesNaCasa: TDataSource;
    transacaoAuxiliar: TIBTransaction;
    procProcessaCaixa: TIBStoredProc;
    qryClientesDelivery: TIBQuery;
    dsQryClientesDelivery: TDataSource;
    updClientesDelivery: TIBUpdateSQL;
    qryBairro: TIBQuery;
    updQryBairro: TIBUpdateSQL;
    dsQryBairro: TDataSource;
    qryAliquotasPARAMETRO3: TIBStringField;
    qryAliquotasPARAMETRO4: TIBStringField;
    qryAliquotasPERCENTAGEM: TIBStringField;
    qry_formas_pagtoTIPO: TSmallintField;
    qry_formas_pagtoPERMITE_TROCO: TSmallintField;
    qryProdutos: TIBQuery;
    dsQryProdutos: TDataSource;
    qryConferenciaCaixa: TIBQuery;
    dsQryConferenciaCaixa: TDataSource;
    qryTiposSangria: TIBQuery;
    qryTiposSangriaCODIGO: TIBStringField;
    qryTiposSangriaDESCRICAO: TIBStringField;
    upQryTiposSangria: TIBUpdateSQL;
    dsQryTiposSangria: TDataSource;
    qryMotivosEstorno: TIBQuery;
    qryMotivosEstornoCODIGO: TIBStringField;
    qryMotivosEstornoDESCRICAO: TIBStringField;
    dsQryMotivosEstorno: TDataSource;
    updQryMovtivosEstornos: TIBUpdateSQL;
    qryObservacoesPreparo: TIBQuery;
    dsQryObservacoesPreparo: TDataSource;
    updQryObservacoesPreparo: TIBUpdateSQL;
    qryObservacoesPreparoCOD_OBS: TIBStringField;
    qryObservacoesPreparoDESCRICAO: TIBStringField;
    qryTiposBaixaEstoque: TIBQuery;
    dsQryTiposBaixaEstoque: TDataSource;
    updQryTiposBaixaEstoque: TIBUpdateSQL;
    qryTiposBaixaEstoqueCOD_TIPO: TIBStringField;
    qryTiposBaixaEstoqueDESCRICAO: TIBStringField;
    tbComprasTempcodigo: TStringField;
    tbComprasTempdescricao: TStringField;
    tbComprasTempquantidade: TFloatField;
    tbComprasTempcodUnidade: TStringField;
    tbComprasTempsiglaUnidade: TStringField;
    tbComprasTempCST: TStringField;
    tbComprasTempCFOP: TStringField;
    tbComprasTempdesconto: TCurrencyField;
    tbComprasTempbaseICMS: TCurrencyField;
    tbComprasTempvalorICMS: TCurrencyField;
    tbComprasTempbaseICMSST: TCurrencyField;
    tbComprasTempvalorICMSST: TCurrencyField;
    tbComprasTempvalorIPI: TCurrencyField;
    tbComprasTempdescUnidade: TStringField;
    tbComprasTempparamUnidade: TFloatField;
    qry_itens_estoqueCOD_ITEM: TIBStringField;
    qry_itens_estoqueDESCRICAO_ITEM: TIBStringField;
    qry_itens_estoqueDATA_CADASTRO: TDateField;
    qry_itens_estoqueDATA_ULTIMA_REPOSICAO: TDateField;
    qry_itens_estoqueVALOR_CUSTO: TIBBCDField;
    qry_itens_estoqueQUANTIDADE_MAXIMA: TIBBCDField;
    qry_itens_estoqueQUANTIDADE_MINIMA: TIBBCDField;
    qry_itens_estoqueESTOQUE_LIQUIDO: TIBBCDField;
    qry_itens_estoqueUNIDADE_ENTRADA: TIBStringField;
    qry_itens_estoqueCOD_UNIDADE_FRACAO: TIBStringField;
    qry_itens_estoqueBARRAS: TIBStringField;
    qry_itens_estoquePRODUTO_FINAL: TIBStringField;
    qry_itens_estoqueCOD_GRUPO: TIBStringField;
    qry_itens_estoqueCFOP: TIBStringField;
    qry_itens_estoqueCST: TIBStringField;
    qry_itens_estoqueDESC_GRUPO: TIBStringField;
    qry_itens_estoqueDESC_UNIDADE: TIBStringField;
    qry_itens_estoquePARAMETRO: TIBBCDField;
    qry_itens_estoqueESTOQUE: TFloatField;
    qry_itens_estoqueDESCUNIDADEFRACAO: TIBStringField;
    qry_itens_estoqueDESCRICAOCFOP: TIBStringField;
    qry_itens_estoqueDESCRICAOCST: TIBStringField;
    qry_itens_estoqueSIGLA_NOTA: TIBStringField;
    tbComprasTempaliquotaICMS: TFloatField;
    tbComprasTempaliquotaIPI: TFloatField;
    tbComprasTempordem: TStringField;
    qrySaboresPizza: TIBQuery;
    dsQrySaboresPizza: TDataSource;
    updSaboresPizza: TIBUpdateSQL;
    tbSaboresPizzaTemp: TRxMemoryData;
    tbSaboresPizzaTempcodigo: TStringField;
    tbSaboresPizzaTemptamanho: TStringField;
    tbSaboresPizzaTempdescricao: TStringField;
    dsSaboresPizzaTemp: TDataSource;
    qryClientesDeliveryCODIGO: TIBStringField;
    qryClientesDeliveryNOME: TIBStringField;
    qryClientesDeliveryTELEFONE: TIBStringField;
    qryClientesDeliverySEXO: TIBStringField;
    qryClientesDeliveryENDERECO: TIBStringField;
    qryClientesDeliveryCOD_BAIRRO: TIntegerField;
    qryClientesDeliveryFREQ_COMPRA: TIntegerField;
    qryClientesDeliveryULTIMO_PEDIDO: TIBStringField;
    qryClientesDeliveryDT_NASCIMENTO: TDateField;
    qryClientesDeliveryEMAIL: TIBStringField;
    qryClientesDeliveryCELULAR: TIBStringField;
    qryClientesDeliveryDESCRICAOBAIRRO: TIBStringField;
    dsQryUltimosPedidosDelivery: TDataSource;
    dsQryItensUltimosPedidosDelivery: TDataSource;
    qryEntregadores: TIBQuery;
    updQryEntregadores: TIBUpdateSQL;
    dsQryEntregadores: TDataSource;
    dsQryObsClientesDelivery: TDataSource;
    dsTbCartoes: TDataSource;
    qry_itens_estoqueSUBMATERIA: TSmallintField;
    proc_abate_submateria: TIBStoredProc;
    qrySaboresPizzaCODIGO: TIBStringField;
    qrySaboresPizzaDESCRICAO: TIBStringField;
    qrySaboresPizzaBBALCAO: TIBStringField;
    qrySaboresPizzaBDELIVERY: TIBStringField;
    qrySaboresPizzaPBALCAO: TIBStringField;
    qrySaboresPizzaPDELIVERY: TIBStringField;
    qrySaboresPizzaMBALCAO: TIBStringField;
    qrySaboresPizzaMDELIVERY: TIBStringField;
    qrySaboresPizzaGBALCAO: TIBStringField;
    qrySaboresPizzaGDELIVERY: TIBStringField;
    qrySaboresPizzaFBALCAO: TIBStringField;
    qrySaboresPizzaFDELIVERY: TIBStringField;
    updQryDadosPAF: TIBUpdateSQL;
    dsQryCidade: TDataSource;
    qryCidade: TIBQuery;
    qryNotasConsumidor: TIBQuery;
    updNotasConsumidor: TIBUpdateSQL;
    dsQryNotasConsumidor: TDataSource;
    qryNotasConsumidorCODIGO: TIBStringField;
    qryNotasConsumidorNUMERO_NOTA: TIBStringField;
    qryNotasConsumidorSERIE: TIBStringField;
    qryNotasConsumidorSUB_SERIE: TIBStringField;
    qryNotasConsumidorDATA_DOC: TDateTimeField;
    qryNotasConsumidorDATA_LANCAMENTO: TDateTimeField;
    qryNotasConsumidorMES_REF_CONTABIL: TIBStringField;
    qryNotasConsumidorCFOP: TIBStringField;
    qryNotasConsumidorCST_ICMS: TIBStringField;
    qryNotasConsumidorNUMERO_CUPOM_FISCAL: TIBStringField;
    qryNotasConsumidorNUMERO_ECF: TIBStringField;
    qryNotasConsumidorCPF_CNPJ_ADQUIRENTE: TIBStringField;
    qryNotasConsumidorVALOR_MERCADORIAS: TIBBCDField;
    qryNotasConsumidorBASE_ICMS: TIBBCDField;
    qryNotasConsumidorREDUCAO_BASE_ICMS: TIBBCDField;
    qryNotasConsumidorALIQ_ICMS: TIBBCDField;
    qryNotasConsumidorVALOR_ICMS: TIBBCDField;
    qryNotasConsumidorVALOR_DOC: TIBBCDField;
    qryNotasConsumidorCANCELADO: TSmallintField;
    qryNotasConsumidorDESC_CFOP: TIBStringField;
    qryNotasConsumidorDESC_CST: TIBStringField;
    qryNotasTransporte: TIBQuery;
    updNotasTransporte: TIBUpdateSQL;
    dsQryNotasTransporte: TDataSource;
    qryNotasTransporteCODIGO: TIBStringField;
    qryNotasTransporteCOD_FORNECEDOR: TIBStringField;
    qryNotasTransporteNUMERO_NOTA: TIBStringField;
    qryNotasTransporteSERIE: TIBStringField;
    qryNotasTransporteSUB_SERIE: TIBStringField;
    qryNotasTransporteSITUACAO: TIBStringField;
    qryNotasTransporteDATA_EMISSAO: TDateTimeField;
    qryNotasTransporteDATA_SERVICO: TDateTimeField;
    qryNotasTransporteDATA_LANCAMENTO: TDateTimeField;
    qryNotasTransporteMES_REF_CONTABIL: TIBStringField;
    qryNotasTransporteMODELO_NOTA: TIBStringField;
    qryNotasTransporteCFOP: TIBStringField;
    qryNotasTransporteCST_ICMS: TIBStringField;
    qryNotasTransporteVALOR_SERVICO: TIBBCDField;
    qryNotasTransporteDESCONTO: TIBBCDField;
    qryNotasTransporteBASE_ICMS: TIBBCDField;
    qryNotasTransporteREDUCAO_BASE_ICMS: TIBBCDField;
    qryNotasTransporteALIQ_ICMS: TIBBCDField;
    qryNotasTransporteVALOR_ICMS: TIBBCDField;
    qryNotasTransporteVALOR_NAO_TRIBUTADO: TIBBCDField;
    qryNotasTransporteVALOR_DOC: TIBBCDField;
    qryNotasTransporteTIPO_CTE: TIBStringField;
    qryNotasTransporteRAZAO_SOCIAL: TIBStringField;
    qryNotasTransporteCGC_CPF: TIBStringField;
    qryNotasTransporteDESC_CFOP: TIBStringField;
    qryNotasTransporteDESC_CST: TIBStringField;
    qryNotasTransporteDESC_MODELO: TIBStringField;
    qryNotasTransporteID_FRETE: TSmallintField;
    tbComprasTempoutrasDespAcessorias: TCurrencyField;
    tbComprasTemptotal: TCurrencyField;
    tbComprasTemppreco: TCurrencyField;
    qry_saidas: TIBQuery;
    updQrySaidas: TIBUpdateSQL;
    ds_qry_saidas: TDataSource;
    qry_saidasCOD_SAIDA: TIBStringField;
    qry_saidasCOD_FORNECEDOR: TIBStringField;
    qry_saidasCOD_USUARIO: TIBStringField;
    qry_saidasQTDE_ITENS: TSmallintField;
    qry_saidasDATA: TDateField;
    qry_saidasHORA: TTimeField;
    qry_saidasNOME_USUARIO_SAIDA: TIBStringField;
    qry_saidasCNPJ: TIBStringField;
    qry_saidasIE: TIBStringField;
    qry_saidasUF: TIBStringField;
    qry_saidasDATA_EMISSAO: TDateField;
    qry_saidasDATA_SAIDA: TDateField;
    qry_saidasNUMERO_NOTA: TIBStringField;
    qry_saidasSERIE_NOTA: TIBStringField;
    qry_saidasMODELO_NOTA: TIBStringField;
    qry_saidasCFOP_NOTA: TIBStringField;
    qry_saidasBASE_ICMS: TIBBCDField;
    qry_saidasVALOR_ICMS: TIBBCDField;
    qry_saidasBASE_ICMS_SUBST: TIBBCDField;
    qry_saidasVALOR_ICMS_SUBST: TIBBCDField;
    qry_saidasVALOR_PRODUTOS: TIBBCDField;
    qry_saidasFRETE: TIBBCDField;
    qry_saidasSEGURO: TIBBCDField;
    qry_saidasDESCONTO: TIBBCDField;
    qry_saidasOUTRAS_DESPESAS: TIBBCDField;
    qry_saidasVALOR_IPI: TIBBCDField;
    qry_saidasTOTAL_NOTA: TIBBCDField;
    qry_saidasXRAZAOSOCIAL: TIBStringField;
    qry_saidasXCNPJ: TIBStringField;
    qry_saidasXINSCRICAOESTADUAL: TIBStringField;
    qry_saidasXNOMECIDADE: TIBStringField;
    qry_saidasXUF: TIBStringField;
    qry_saidasXMODELONOTA: TIBStringField;
    qry_saidasXCFOPDESCRICAO: TIBStringField;
    qryCsContasApagar: TIBQuery;
    dsQryContasApagar: TDataSource;
    qryConsultaFaturasCOD_FATURA: TIBStringField;
    qryConsultaFaturasCOD_CLI: TIBStringField;
    qryConsultaFaturasDATA_FATURA: TDateField;
    qryConsultaFaturasDATA_VENCIMENTO: TDateField;
    qryConsultaFaturasDATA_PAGAMENTO: TDateField;
    qryConsultaFaturasVALOR_FATURA: TIBBCDField;
    qryConsultaFaturasVALOR_PAGO: TIBBCDField;
    qryConsultaFaturasSTATUS: TSmallintField;
    qryConsultaFaturasCOD_VENDA: TIBStringField;
    qryConsultaFaturasSELECAO: TSmallintField;
    qryConsultaFaturasUSUARIO_INCLUSAO: TIBStringField;
    qryConsultaFaturasHORA: TTimeField;
    qryConsultaFaturasOBSERVACAO: TIBStringField;
    qryConsultaFaturasCODIGOVENDA: TIBStringField;
    tb_parametros: TIBTable;
    tb_parametrosDATA_SISTEMA: TDateField;
    tb_parametrosRAZAO_SOCIAL: TIBStringField;
    tb_parametrosNOME_FANTASIA: TIBStringField;
    tb_parametrosCNPJ: TIBStringField;
    tb_parametrosIE: TIBStringField;
    tb_parametrosIM: TIBStringField;
    tb_parametrosCOD_CIDADE: TIBStringField;
    tb_parametrosCOD_MUNICIPIO_IBGE: TIBStringField;
    tb_parametrosLOGRADOURO: TIBStringField;
    tb_parametrosCOMPLEMENTO: TIBStringField;
    tb_parametrosNUMERO: TIBStringField;
    tb_parametrosBAIRRO: TIBStringField;
    tb_parametrosUF: TIBStringField;
    tb_parametrosCEP: TIBStringField;
    tb_parametrosTELEFONE_EMPRESA: TIBStringField;
    tb_parametrosFAX_EMPRESA: TIBStringField;
    tb_parametrosCONTATO: TIBStringField;
    tb_parametrosPERFIL_SPED: TIBStringField;
    tb_parametrosIND_ATIVIDADE: TIBStringField;
    tb_parametrosCOD_SUFRAMA: TIBStringField;
    tb_parametrosNOME_CONTABILISTA: TIBStringField;
    tb_parametrosCPF_CONTABILISTA: TIBStringField;
    tb_parametrosCRC_CONTABILISTA: TIBStringField;
    tb_parametrosCNPJ_CONTABILISTA: TIBStringField;
    tb_parametrosCEP_CONTABILISTA: TIBStringField;
    tb_parametrosENDERECO_CONTABILISTA: TIBStringField;
    tb_parametrosCOMPLEMENTO_END_CONTABILISTA: TIBStringField;
    tb_parametrosNUMERO_END_CONTABILISTA: TIBStringField;
    tb_parametrosBAIRRO_CONTABILISTA: TIBStringField;
    tb_parametrosTELEFONE_CONTABILISTA: TIBStringField;
    tb_parametrosFAX_CONTABILISTA: TIBStringField;
    tb_parametrosULTIMAHORA: TDateTimeField;
    tb_parametrosSENHA_PADRAO: TIBStringField;
    tb_parametrosPERCENTUAL_SERVICO_GARCOM: TIBBCDField;
    tb_parametrosPERCENTUAL_SERVICO_CASA: TIBBCDField;
    tb_parametrosPERCENTUAL_SERVICO_FUNCIONARIOS: TIBBCDField;
    tb_parametrosZERAR_ICMS_ENTRADAS: TSmallintField;
    tb_parametrosALTERAR_UN_NAS_ENTRADAS: TSmallintField;
    tb_parametrosCOUVERT_MASC_PAGANTE: TIBStringField;
    tb_parametrosCOUVERT_MASC_LISTA: TIBStringField;
    tb_parametrosCOUVERT_FEM_PAGANTE: TIBStringField;
    tb_parametrosCOUVERT_FEM_LISTA: TIBStringField;
    tb_parametrosCOUVERT_VIP: TIBStringField;
    tb_parametrosINI_FAIXA_MASC: TIntegerField;
    tb_parametrosFIM_FAIXA_MASC: TSmallintField;
    tb_parametrosINI_FAIXA_FEM: TIntegerField;
    tb_parametrosFIM_FAIXA_FEM: TIntegerField;
    tb_parametrosINI_FAIXA_VIP: TIntegerField;
    tb_parametrosFIM_FAIXA_VIP: TIntegerField;
    tb_parametrosBOATE: TSmallintField;
    tb_parametrosRECEBE_COUVERT_ENTRADA: TSmallintField;
    tb_parametrosCOUVERT_MASC_PRECONVITE: TIBStringField;
    tb_parametrosCOUVERT_FEM_PRECONVITE: TIBStringField;
    qryPromoters: TIBQuery;
    dsQryPromoters: TDataSource;
    qryCsSaboresPizza: TIBQuery;
    dsQryCsSaboresPizza: TDataSource;
    qryEntregadoresCODIGO: TIBStringField;
    qryEntregadoresNOME_ENTREGADOR: TIBStringField;
    qryEntregadoresPERC_COMISSAO_PEDIDO: TIBBCDField;
    qryEntregadoresCOMISSAO_POR_PEDIDO: TIBBCDField;
    qryEntregadoresVALOR_DIARIA: TIBBCDField;
    qryCsObservacoes: TIBQuery;
    dsQryCsObservacoes: TDataSource;
    tbObservacoesTemp: TRxMemoryData;
    dsObervacoesTemp: TDataSource;
    tbObservacoesTempdescricao: TStringField;
    dsGuarnicoesTemp: TDataSource;
    tbSaboresPizzaTempobs: TStringField;
    qryNotasTransporteDESC_SITUACAO: TIBStringField;
    qrySaboresPizzaPRECOBBALCAO: TIBBCDField;
    qrySaboresPizzaPRECOBDELIVERY: TIBBCDField;
    qrySaboresPizzaPRECOPBALCAO: TIBBCDField;
    qrySaboresPizzaPRECOPDELIVERY: TIBBCDField;
    qrySaboresPizzaPRECOMBALCAO: TIBBCDField;
    qrySaboresPizzaPRECOMDELIVERY: TIBBCDField;
    qrySaboresPizzaPRECOGBALCAO: TIBBCDField;
    qrySaboresPizzaPRECOGDELIVERY: TIBBCDField;
    qrySaboresPizzaPRECOFBALCAO: TIBBCDField;
    qrySaboresPizzaPRECOFDELIVERY: TIBBCDField;
    qrySaboresPizzaDESCBBALCAO: TIBStringField;
    qrySaboresPizzaDESCBDELIVERY: TIBStringField;
    qrySaboresPizzaDESCPBALCAO: TIBStringField;
    qrySaboresPizzaDESCPDELIVERY: TIBStringField;
    qrySaboresPizzaDESCMBALCAO: TIBStringField;
    qrySaboresPizzaDESCMDELIVERY: TIBStringField;
    qrySaboresPizzaDESCGBALCAO: TIBStringField;
    qrySaboresPizzaDESCGDELIVERY: TIBStringField;
    qrySaboresPizzaDESCFBALCAO: TIBStringField;
    qrySaboresPizzaDESCFDELIVERY: TIBStringField;
    qry_saidasNUMERO_CUPOM_FISCAL: TIBStringField;
    qry_saidasNUMERO_ECF: TIBStringField;
    qry_saidasCHAVE_NFE: TIBStringField;
    qry_saidasSITUACAO: TIBStringField;
    qry_saidasXDESCSITUACAONOTA: TIBStringField;
    qry_saidasTIPO_SAIDA: TSmallintField;
    qryGruposTouch: TIBQuery;
    dsGruposTouch: TDataSource;
    updGruposTouch: TIBUpdateSQL;
    qryGruposTouchCODIGO: TIBStringField;
    qryGruposTouchDESCRICAO: TIBStringField;
    tb_parametrosALIQUOTA_ICMS: TIBBCDField;
    tb_parametrosRED_BASE_ICMS: TFloatField;
    qry_fornecedoresCOD_FORNECEDOR: TIBStringField;
    qry_fornecedoresBAIRRO: TIBStringField;
    qry_fornecedoresCEP: TIBStringField;
    qry_fornecedoresTELEFONE: TIBStringField;
    qry_fornecedoresFAX: TIBStringField;
    qry_fornecedoresEMAIL: TIBStringField;
    qry_fornecedoresATUALIZA_CUSTO: TSmallintField;
    qry_fornecedoresCGC_CPF: TIBStringField;
    qry_fornecedoresINSCRICAO_ESTADUAL: TIBStringField;
    qry_fornecedoresCODIGO_REPRESENTANTE: TIntegerField;
    qry_fornecedoresOBSERVACAO: TIBStringField;
    qry_fornecedoresDATA_CADASTRO: TDateField;
    qry_fornecedoresDATA_ULTIMA_COMPRA: TDateField;
    qry_fornecedoresCONTATO: TIBStringField;
    qry_fornecedoresCOD_ESTADO: TIBStringField;
    qry_fornecedoresINSCRICAO_MUNICIPAL: TIBStringField;
    qry_fornecedoresCOD_CIDADE: TIBStringField;
    qry_fornecedoresNOME_CIDADE: TIBStringField;
    qry_fornecedoresNOMEESTADO: TIBStringField;
    qryMapaMesasSalao: TIBQuery;
    dsMapaMesasSalao: TDataSource;
    tb_parametrosPERCENTUAL_COM_EXT_GARCOM: TIBBCDField;
    tb_parametrosEMAIL_CONTABILISTA: TIBStringField;
    tb_parametrosNUM_SERIE_CERTIFICADO: TIBStringField;
    tb_parametrosSENHA_CERTIFICADO: TIBStringField;
    tb_parametrosULT_NSU_NFE_DEST: TIBStringField;
    qry_fornecedoresRAZAO_SOCIAL: TIBStringField;
    qry_fornecedoresNOME_FANTASIA: TIBStringField;
    tb_parametrosUSA_COD_GARCON: TSmallintField;
    tb_parametrosCOBRA_SERVICO: TSmallintField;
    qryProjecaoReceitaRD: TIBQuery;
    dsProjecaoReceitaRD: TDataSource;
    updQryProjecaoReceitasRD: TIBUpdateSQL;
    qryProjecaoReceitaRDDATA: TDateField;
    qryProjecaoReceitaRDPROJECAO: TFloatField;
    qryProjecaoReceitaRDREPROJECAO: TFloatField;
    qryProjecaoReceitaRDFATURAMENTO_REAL: TFloatField;
    qryProjecaoReceitaRDDIA: TIBStringField;
    qryProjecaoDespesasRD: TIBQuery;
    dsQryProjecaoDespesasRD: TDataSource;
    updQryProjecaoDespesasRD: TIBUpdateSQL;
    qryNotasTransporteCHAVE_CTE: TIBStringField;
    qryNotasTransporteTIPODOC: TSmallintField;
    qryComparaProdutosNFE: TIBQuery;
    dsQryComparaProdutosNFE: TDataSource;
    qryCsProdEtiquetas: TIBQuery;
    dsQryCsProdEtiquetas: TDataSource;
    qryCsProdEtiquetasCOD_PRODUTO: TIBStringField;
    qryCsProdEtiquetasDESCRICAO: TIBStringField;
    qryCsProdEtiquetasVALOR_UNITARIO: TIBBCDField;
    qryCsProdEtiquetasCOD_GRUPO: TIBStringField;
    qryCsProdEtiquetasCAMINHO_FOTO: TIBStringField;
    tbLancamentosRDTEMP: TRxMemoryData;
    tbLancamentosRDTEMPCOD_GRUPO: TStringField;
    tbLancamentosRDTEMPvalor: TCurrencyField;
    dsLancamentosRDTemp: TDataSource;
    tbLancamentosRDTEMPdescricao: TStringField;
    qryLancamentosRD: TIBQuery;
    updQryLancamentosRD: TIBUpdateSQL;
    dsQryLancamentosRD: TDataSource;
    qryLancamentosRDCODIGO: TIBStringField;
    qryLancamentosRDCOD_FORNECEDOR: TIBStringField;
    qryLancamentosRDNUM_DOC: TIBStringField;
    qryLancamentosRDDATA_LANCAMENTO: TDateTimeField;
    qryLancamentosRDDATA_DOCUMENTO: TDateField;
    qryLancamentosRDDATA_RD: TDateField;
    qryLancamentosRDOBSERVACOES: TIBStringField;
    qryLancamentosRDRAZAO_SOCIAL: TIBStringField;
    qryLancamentosRDNOME_USUARIO: TIBStringField;
    tb_parametrosCSC_NFCE: TIBStringField;
    tb_parametrosID_CSC_NFCE: TIBStringField;
    tb_parametrosNOME_CIDADE_CONTRIBUINTE: TIBStringField;
    ACBrPosPrinter1: TACBrPosPrinter;
    tb_parametrosCOD_EMPRESA: TIBStringField;
    tb_parametrosULTIMA_VENDA_EXP: TIBStringField;
    tb_parametrosREGIME_TRIBUTACAO: TSmallintField;
    tb_parametrosCREDITO_ENTRADAS: TSmallintField;
    qryProjecaoDespesasRDRESULTADO: TSmallintField;
    qryProjecaoDespesasRDMES: TSmallintField;
    qryProjecaoDespesasRDANO: TSmallintField;
    qryProjecaoDespesasRDCOD_GRUPO: TIBStringField;
    qryProjecaoDespesasRDNIVEL: TSmallintField;
    qryProjecaoDespesasRDDESCRICAO: TIBStringField;
    qryProjecaoDespesasRDPROJECAO_INICIAL: TFloatField;
    qryProjecaoDespesasRDPERC_PROJ_FAT: TIBBCDField;
    qryProjecaoDespesasRDREPROJECAO: TFloatField;
    qryProjecaoDespesasRDPERC_REPROJ_FAT: TIBBCDField;
    qryProjecaoDespesasRDTOTAL: TFloatField;
    qryProjecaoDespesasRDPERC_FAT_REAL: TIBBCDField;
    qryProjecaoDespesasRDSALDO: TFloatField;
    qryProjecaoDespesasRDPERC_GERAL: TIBBCDField;
    qryProjecaoDespesasRDPERC_GRUPO_PAI: TIBBCDField;
    qryProjecaoDespesasRDPROJ_FAT_MES: TFloatField;
    qryProjecaoDespesasRDREPROJ_FAT_MES: TFloatField;
    qryProjecaoDespesasRDFAT_REAL_MES: TFloatField;
    tb_parametrosIMPOSTO_SIMP_NAC_NFCE: TSmallintField;
    tb_parametrosALIQ_IBPT: TIBBCDField;
    procGeraInutilizacoes: TIBStoredProc;
    tb_parametrosCHAVE_AUTENTICACAO_TEF: TIBStringField;
    tb_parametrosNUMERO_NFE: TIntegerField;
    tb_parametrosSERIE_NFE: TIntegerField;
    qry_fornecedoresNUM_ENDERECO: TIBStringField;
    qry_fornecedoresCOMPLEMENTO: TIBStringField;
    dsQryVendasCaixa: TDataSource;
    tbSaboresPizzaTempproporcao: TFloatField;
    tbSaboresPizzaTempvalorSabor: TFloatField;
    tbSaboresPizzaTempcodProduto: TStringField;
    tb_parametrosQTD_VIAS_SANGRIA: TSmallintField;
    JvVigenereCipher1: TJvVigenereCipher;
    tb_parametrosCSC_NFCE_HOMOLOGACAO: TIBStringField;
    tb_parametrosID_CSC_NFCE_HOMOLOGACAO: TIBStringField;
    tb_parametrosPIZZA_MAIS_CARA: TSmallintField;
    sat: TACBrSAT;
    tb_parametrosASSINATURA_SAT: TIBStringField;
    tb_parametrosCNPJ_SWHOUSE: TIBStringField;
    tb_parametrosCOD_ATIVACAO_SAT: TIBStringField;
    extratoSat: TACBrSATExtratoESCPOS;
    qry_gruposRESULTADO_RD: TSmallintField;
    qry_gruposPERC_PROJ_RD: TIBBCDField;
    qry_gruposMOSTRA_NO_RD: TSmallintField;
    ACBrTEFD1: TACBrTEFD;
    fdRestaurante: TFDConnection;
    tb_parametrosTIPO_ENVIO_NFCE: TSmallintField;
    tb_parametrosTIPO_ENVIO_NFE: TSmallintField;
    tb_parametrosAGUARDA_CONSULTA_RET_NFCE: TIBBCDField;
    tb_parametrosTENTATIVAS_CONSULTA_RET_NFCE: TSmallintField;
    tb_parametrosTIMEOUT_RET_NFCE: TIBBCDField;
    tb_parametrosINTERVALO_TENTATIVAS_NFCE: TIBBCDField;
    tb_parametrosMAX_NFCE_SEM_CPF: TIBBCDField;
    tb_parametrosMSG_PROMO_DELIVERY: TIBStringField;
    tb_parametrosMSG_PROMO_CONTA: TIBStringField;
    qry_entradasCOD_ENTRADA: TIBStringField;
    qry_entradasCOD_FORNECEDOR: TIBStringField;
    qry_entradasCOD_USUARIO: TIBStringField;
    qry_entradasQTDE_ITENS: TSmallintField;
    qry_entradasDATA: TDateField;
    qry_entradasHORA: TTimeField;
    qry_entradasNOME_USUARIO_ENTRADA: TIBStringField;
    qry_entradasDATA_EMISSAO: TDateField;
    qry_entradasDATA_ENTRADA: TDateField;
    qry_entradasNUMERO_NOTA: TIBStringField;
    qry_entradasSERIE_NOTA: TIBStringField;
    qry_entradasMODELO_NOTA: TIBStringField;
    qry_entradasBASE_ICMS: TIBBCDField;
    qry_entradasVALOR_ICMS: TIBBCDField;
    qry_entradasBASE_ICMS_SUBST: TIBBCDField;
    qry_entradasVALOR_ICMS_SUBST: TIBBCDField;
    qry_entradasVALOR_PRODUTOS: TIBBCDField;
    qry_entradasFRETE: TIBBCDField;
    qry_entradasSEGURO: TIBBCDField;
    qry_entradasDESCONTO: TIBBCDField;
    qry_entradasOUTRAS_DESPESAS: TIBBCDField;
    qry_entradasVALOR_IPI: TIBBCDField;
    qry_entradasTOTAL_NOTA: TIBBCDField;
    qry_entradasMES_REF_CONTABIL: TIBStringField;
    qry_entradasCOD_EMP_GRUPO: TIBStringField;
    qry_entradasCHAVE_NFE: TIBStringField;
    qry_entradasTIPO_ENTRADA: TSmallintField;
    qry_entradasINFORMACOES_COMPLEMENTARES: TIBStringField;
    qry_entradasINFORMACOES_FISCO: TIBStringField;
    qry_entradasXRAZAOSOCIAL: TIBStringField;
    qry_entradasXCNPJ: TIBStringField;
    qry_entradasXINSCRICAOESTADUAL: TIBStringField;
    qry_entradasXNOMECIDADE: TIBStringField;
    qry_entradasXUF: TIBStringField;
    qry_entradasXMODELONOTA: TIBStringField;
    qry_entradasXDESCRICAOLOJA: TIBStringField;
    qryVendasCanceladas: TIBQuery;
    updVendasCanceladas: TIBUpdateSQL;
    qryConsultaProdutos: TIBQuery;
    dsConsultaProdutos: TDataSource;
    qryConsultaProdutosCOD_BARRAS: TIBStringField;
    qryConsultaProdutosDESCRICAO: TIBStringField;
    qryConsultaProdutosVALOR_UNITARIO: TIBBCDField;
    qryConsultaProdutosCOD_GRUPO: TIBStringField;
    qryConsultaProdutosCOD_PRODUTO: TIBStringField;
    qryEstrutura: TIBQuery;
    ExeInfo1: TExeInfo;
    dsTbFormasPagamento: TDataSource;
    ACBrInStore1: TACBrInStore;
    qryConsultaProdutosGRUPO: TIBStringField;
    qryVendasCanceladasCOD_VENDA: TIBStringField;
    qryVendasCanceladasDATA: TDateField;
    qryVendasCanceladasHORA: TTimeField;
    qryVendasCanceladasDATA_SO: TDateField;
    qryVendasCanceladasDATA_ECF: TDateField;
    qryVendasCanceladasHORA_ECF: TTimeField;
    qryVendasCanceladasVALOR_BRUTO: TIBBCDField;
    qryVendasCanceladasVALOR_DESCONTO: TIBBCDField;
    qryVendasCanceladasVALOR_TXSERV: TIBBCDField;
    qryVendasCanceladasVALOR_TOTAL: TIBBCDField;
    qryVendasCanceladasTOTAL_PAGO: TIBBCDField;
    qryVendasCanceladasVALOR_TROCO: TIBBCDField;
    qryVendasCanceladasCOD_USUARIO: TIBStringField;
    qryVendasCanceladasNUMERO_CAIXA: TIBStringField;
    qryVendasCanceladasMESA: TIBStringField;
    qryVendasCanceladasIMP: TSmallintField;
    qryVendasCanceladasCOD_CAIXA: TIBStringField;
    qryVendasCanceladasTIPO_VENDA: TSmallintField;
    qryVendasCanceladasCOD_PEDIDO_DELIVERY: TIBStringField;
    qryVendasCanceladasCOO_CUPOM: TIBStringField;
    qryVendasCanceladasQTDE_PESSOAS: TSmallintField;
    qryVendasCanceladasVALOR_TX_ENTREGA: TIBBCDField;
    qryVendasCanceladasREDUCAO_Z: TIntegerField;
    qryVendasCanceladasSELECIONADO: TSmallintField;
    qryVendasCanceladasDESCONTO_TAXAS: TFMTBCDField;
    qryVendasCanceladasCHAVE_NFCE: TIBStringField;
    qryVendasCanceladasNUMERO_NFCE: TIntegerField;
    qryVendasCanceladasSERIE_NFCE: TSmallintField;
    qryVendasCanceladasPROTOCOLO_NFCE: TIBStringField;
    qryVendasCanceladasRECIBO_NFCE: TIBStringField;
    qryVendasCanceladasOBS_NFCE: TIBStringField;
    qryVendasCanceladasCONSULTA_OK: TSmallintField;
    qryVendasCanceladasCOD_EMPRESA: TIBStringField;
    qryVendasCanceladasPERCENTUAL_DESCONTO: TFMTBCDField;
    qryVendasCanceladasLOTE_EXPORTACAO_WEB: TLargeintField;
    qryVendasCanceladasCOD_GARCON_ABRIU: TIBStringField;
    qryVendasCanceladasMODELO_COMPROVANTE: TSmallintField;
    qryVendasCanceladasCOD_FORNECEDOR: TIBStringField;
    qryVendasCanceladasSESSAO_SAT: TLargeintField;
    qryVendasCanceladasCNF_SAT: TLargeintField;
    qryVendasCanceladasXML_DOC: TWideMemoField;
    qryVendasCanceladasCNPJ_CPF_CLIENTE_NF: TIBStringField;
    qryVendasCanceladasNOME_CLIENTE_NF: TIBStringField;
    qryVendasCanceladasTENTATIVAS_ENVIO_NFCE: TSmallintField;
    qryVendasCanceladasTEMPO_EMISSAO_NFCE: TSmallintField;
    qryEntregadoresSTATUS: TSmallintField;
    qryMovimentoMesa: TIBQuery;
    dsQryMovimentoMesa: TDataSource;
    dsQryMovimentoMesaResumido: TDataSource;
    ead: TACBrEAD;
    ACBrGAV1: TACBrGAV;
    tb_parametrosNUMERO_CARTA_CORRECAO_NFE: TIntegerField;
    tb_parametrosNUMERO_CARTA_CORRECAO_NFCE: TIntegerField;
    tb_parametrosPFX_CERTIFICADO: TWideMemoField;
    qryConfigPDVS: TIBQuery;
    dsConfigPDVS: TDataSource;
    qryConfigPDVSNUMERO_CAIXA: TIBStringField;
    qryConfigPDVSSERIE_NFCE_NORMAL: TIntegerField;
    qryConfigPDVSNUMERO_NFCE_NORMAL: TIntegerField;
    qryConfigPDVSNUMERO_NFCE_NORMAL_HOMOLOGACAO: TIntegerField;
    updQryConfigPDVS: TIBUpdateSQL;
    qryCidadeCOD_CIDADE: TIBStringField;
    qryCidadeNOME: TIBStringField;
    qryCidadeUF: TIBStringField;
    qryCidadeESTADO: TIBStringField;
    tb_parametrosIMP_ENDERECO_CLIENTE_PRODUCAO: TSmallintField;
    qry_fornecedoresENDERECO: TIBStringField;
    qry_fornecedoresCOD_PAIS: TIBStringField;
    qryErrosInutilizacao: TIBQuery;
    dsQryErrosInutilizacoes: TDataSource;
    qryConsultaProdutosCOD_GRUPO_RAIZ: TIBStringField;
    qryConsultaProdutosDESC_GRUPO_RAIZ: TIBStringField;
    qryConsultaProdutosCOD_GRUPO_PAI: TIBStringField;
    qryConsultaProdutosDESC_GRUPO: TIBStringField;
    qryConsultaProdutosQUANTIDADE: TIBBCDField;
    qryConsultaProdutosQTDFRACAO: TFloatField;
    qryConsultaProdutosESTOQUE: TIBStringField;
    qryConsultaProdutosPRECOPADRAO: TIBBCDField;
    tb_parametrosMSG_DELIVERY_GD: TSmallintField;
    tb_parametrosMSG_DELIVERY_DESTAQUE: TSmallintField;
    tb_parametrosMSG_CONTA_GD: TSmallintField;
    tb_parametrosMSG_CONTA_DESTAQUE: TSmallintField;
    tb_parametrosLOGO_COMPROVANTES: TIBStringField;
    tb_parametrosTAB_PRECOS_DELIVERY: TSmallintField;
    tb_parametrosCOMPROVANTE_DELIVERY_AGRUPADO: TSmallintField;
    tb_parametrosIDENTIFICA_CLIENTE_BALCAO: TSmallintField;
    tbCsClientesDelivery: TFDMemTable;
    memTbPermissoes: TFDMemTable;
    tb_parametrosTEMPO_PREP_DELIVERY: TSmallintField;
    tb_parametrosIMPRIME_OBS_COMPROVANTE_DELIV: TSmallintField;
    IdThreadComponent1: TIdThreadComponent;
    ACBrCTe: TACBrCTe;
    danfeCTE: TACBrCTeDACTEFR;
    tb_parametrosULT_NSU_CTE: TIBStringField;
    tb_parametrosINTEGRACAO_PLATAFORMAS: TSmallintField;
    tbTamanhosPizzaReajuste: TFDMemTable;
    dsSaboresPizzaReajuste: TDataSource;
    tbSaboresPizzaReajuste: TFDMemTable;
    qryClientesDeliveryCOMPLEMENTO: TIBStringField;
    qryClientesDeliveryREFERENCIA1: TIBStringField;
    qryClientesDeliveryREFERENCIA2: TIBStringField;
    qryClientesDeliveryDATA_CADASTRO: TDateField;
    folderDialog: TJvBrowseForFolderDialog;
    ACBrMail1: TACBrMail;
    tbComprasTempvalorFrete: TCurrencyField;
    tbComprasTempvalorSeguro: TCurrencyField;
    tbComprasTempvalorFCP: TCurrencyField;
    tbComprasTempvalorFCPST: TCurrencyField;
    tbComprasTempvalorImpostoImportacao: TCurrencyField;
    tbComprasTempValorCustoReal: TCurrencyField;
    tbFormasPagamento: TFDMemTable;
    tb_parametrosDESCRICAO_EMPRESA: TIBStringField;
    tb_parametrosIMP_DADOS_PLATAFORMA_COMP_DELIV: TSmallintField;
    tb_parametrosIMP_DADOS_PLATAFORMA_PRODUCAO: TSmallintField;
    tb_parametrosREGISTRA_ENTREGA_IFOOD: TSmallintField;
    qryEmpresas: TFDQuery;
    qryEmpresasCOD_EMPRESA: TStringField;
    qryEmpresasDESCRICAO_EMPRESA: TStringField;
    dsQryEmpresas: TDataSource;
    tbGruposCombo: TFDMemTable;
    qryProdutosAdicionais: TFDQuery;
    dsQryProdutosAdicionais: TDataSource;
    qry_entradasCOD_EMPRESA: TIBStringField;
    tbAdquirentesTemp: TFDMemTable;
    dsTbAdquirentesTemp: TDataSource;
    qryComparaProdutosNFECNPJ_FORNECEDOR: TIBStringField;
    qryComparaProdutosNFECOD_PROD_FORNECEDOR: TIBStringField;
    qryComparaProdutosNFECOD_PRODUTO_INTERNO: TIBStringField;
    qryComparaProdutosNFECFOP_ENTRADA: TIBStringField;
    qryComparaProdutosNFECST_ENTRADA: TIBStringField;
    qryComparaProdutosNFEUNIDADE_ENTRADA: TIBStringField;
    qryComparaProdutosNFEFATOR_CONVERSAO: TIBBCDField;
    qryComparaProdutosNFEOPERACAO: TSmallintField;
    qryComparaProdutosNFECFOP_FORNECEDOR: TIBStringField;
    qryComparaProdutosNFECST_FORNECEDOR: TIBStringField;
    qryComparaProdutosNFENCM: TIBStringField;
    qryComparaProdutosNFEDESCRICAO_FORNECEDOR: TIBStringField;
    qryComparaProdutosNFEUNIDADE_COMERCIALIZADA: TIBStringField;
    qryComparaProdutosNFEULTIMA_CHAVE: TIBStringField;
    qryComparaProdutosNFEDESCRICAO: TIBStringField;
    qryComparaProdutosNFERAZAO_SOCIAL: TIBStringField;
    qryComparaProdutosNFEDESCRICAO_UNIDADE: TIBStringField;
    qryComparaProdutosNFECOD_GRUPO: TIBStringField;
    qryComparaProdutosNFEGRUPO_ASSOCIADO: TIBStringField;
    danfeESCPos: TACBrNFeDANFeESCPOS;
    danfeFR: TACBrNFeDANFCEFR;
    ACBrNFe1: TACBrNFe;
    composicoes_tempquantidade: TFloatField;
    tbMovimentoMesa: TFDMemTable;
    dsTbMovimentoMesa: TDataSource;
    qryVendasCaixa: TFDQuery;
    qryProdutosAdicionaisID: TLargeintField;
    qryProdutosAdicionaisID_GRUPO: TLargeintField;
    qryProdutosAdicionaisCOD_PRODUTO: TStringField;
    qryProdutosAdicionaisDESCRICAO: TStringField;
    qryProdutosAdicionaisVALOR: TFMTBCDField;
    tb_parametrosULTIMA_CONSULTA_DFE: TDateTimeField;
    tb_parametrosINF_COMP_NFE: TWideMemoField;
    tbCartoes: TFDMemTable;
    tbCartoescod_cartao: TStringField;
    tbCartoesdescricao: TStringField;
    tbCartoesdescricao_status: TStringField;
    tbCartoesnome_cliente: TStringField;
    tb_parametrosID_UF: TSmallintField;
    RESTClient1: TRESTClient;
    RESTResponse1: TRESTResponse;
    RESTRequest1: TRESTRequest;
    tbComprasTempvalorTotal: TCurrencyField;
    qryItensConsultaFatura: TIBQuery;
    qryItensConsultaFaturaCOD_EMPRESA: TIBStringField;
    qryItensConsultaFaturaCOD_VENDA: TIBStringField;
    qryItensConsultaFaturaCOD_PRODUTO: TIBStringField;
    qryItensConsultaFaturaDESCRICAO: TIBStringField;
    qryItensConsultaFaturaPARAMETRO_CONTAGEM: TIBBCDField;
    qryItensConsultaFaturaCOD_GRUPO: TIBStringField;
    qryItensConsultaFaturaCOD_ALIQUOTA: TIBStringField;
    qryItensConsultaFaturaQUANTIDADE_REAL: TFMTBCDField;
    qryItensConsultaFaturaQUANTIDADE_CONTAGEM: TFloatField;
    qryItensConsultaFaturaVALOR_UNITARIO: TIBBCDField;
    qryItensConsultaFaturaTOTAL: TFloatField;
    qryItensConsultaFaturaDATA: TDateField;
    qryItensConsultaFaturaHORA: TDateTimeField;
    qryItensConsultaFaturaMESA: TIBStringField;
    qryItensConsultaFaturaCOD_GARCON: TIBStringField;
    qryItensConsultaFaturaCOD_USUARIO: TIBStringField;
    qryItensConsultaFaturaDESCRICAO_GRUPO: TIBStringField;
    qryItensConsultaFaturaNOME_USUARIO: TIBStringField;
    qryItensConsultaFaturaCOD_CAIXA: TIBStringField;
    dsItensFatura: TDataSource;
    balanca: TACBrBAL;
    ACBrNFeDANFEFR1: TACBrNFeDANFEFR;
    SocketClient: TIdTCPClient;
    qryTabelasDePrecos: TFDQuery;
    dsQryTabelaPrecos: TDataSource;
    FDPhysFBDriverLink1: TFDPhysFBDriverLink;
    dsParticipantes: TDataSource;
    qryParticipantes: TFDQuery;
    dsQryParticipantes: TDataSource;
    qryClientesMesa: TFDQuery;
    dsQryClientesMesa: TDataSource;
    qryClientesMesaNOME_CLIENTE: TStringField;
    qryClientesMesaGUID_CLIENTE: TStringField;
    qryClientesMesaCOD_CLIENTE: TStringField;
    qryClientesMesaSEL: TIntegerField;
    qryClientesMesaMESA: TStringField;
    memTbClientesMesa: TFDMemTable;
    memTbClientesMesaNOME_CLIENTE: TStringField;
    memTbClientesMesaGUID_CLIENTE: TStringField;
    memTbClientesMesaCOD_CLIENTE: TStringField;
    memTbClientesMesaSEL: TIntegerField;
    memTbClientesMesaMESA: TStringField;
    qryDRE: TFDQuery;
    dsQryDRE: TDataSource;
    qryProdutosDRE: TFDQuery;
    dsQryProdutosDRE: TDataSource;
    qryEntradasGrupoDRE: TFDQuery;
    dsQryEntradasGrupoDRE: TDataSource;
    qryProdutosEntradaDRE: TFDQuery;
    dsqryProdutosEntradaDRE: TDataSource;
    qryContasAPagarDRE: TFDQuery;
    dsQryContasAPagarDRE: TDataSource;
    qryContasAPagarEntradasDRE: TFDQuery;
    dsqryContasAPagarEntradasDRE: TDataSource;
    function AppIsRunning(ActivateIt: Boolean): Boolean;
    function verificaMesaBalcao(AMesa: string): Boolean;
    function verificaTamanhoPizza(codigo: string; tipoCodigo: SmallInt): SmallInt;
    function TrocaVirgPPto(Valor: string): string;
    function TrocaPontoPVirgula(Valor: string): string;
    function removePonto(Text: string): string;
    function removeVirgula(Text: string): string;
    function verificaseExisteMovimentoMesaBalcao(): Boolean;
    function verificaseExisteMovimentoMesa(AMesa: string): Boolean;
    function getCodMesaBalcao(): string;
    function getCodMesaDelivery(): string;
    function getCodGarconMesaDelivery(): string;
    procedure ComprimirArquivoZIP(ArquivoCompacto: TFileName; Arquivos: array of TFileName);
    procedure atualizaDataDoSistema;
    procedure adicionaLog(observacao: string);
    procedure adicionaLogSAT(observacao: string);
    procedure adicionalogTEF(observacao: string);
    function getSerieNFCE(): Integer;
    function getNumeroNFCE(): Integer;
    function getNumeroNFE(): Integer;
    function verificaSeUltimaNFCEConstaNasVendas(): Boolean;
    function EnviaNFCE(): Boolean;
    procedure AdicionaNFCENaListaDeNotasParaCancelar(modelo: Integer);
    procedure desabilitaCltrAltDel();
    procedure habilitaCltrAltDel();
    function verificaStatusNotasSefaz(chaveNFCE: string): Boolean;
    function verificaNotasContingencia(): Boolean;
    function verificaNotasContingenciaNoCaixa(): Boolean;
    function getCodGarconMesaBalcao(): string;
    procedure setFormaEmissaoNFCE(forma: Integer);
    function enviaNFCEContingencia: Boolean;
    function cancelaNFCE(chaveNFCE: string; protocolo: string; serie: Integer; numeroNFCE: Integer; justificativa: string): Boolean;
    function setFormaEmissaOnlineNFE(): Boolean;
    function verificaSeErroNFEPermiteContingencia(erro: SmallInt; mensagem: string): SmallInt;
    function getCodClientePedidoDelivery(codPedido: string): string;
    procedure efetuaBaixaNoPedidoDelivery(codPedido: string; cod_Venda: string; cod_caixa: string);
    function somaDiasData(Data: TDate; dias: Integer): TDate;
    function getTempoEntreHoras(horaInicial: TTime; horaFinal: TTime): string;
    function moduloNumero(numero: Integer): Integer;
    function maior(Tabela: string; Campo: string): Integer;
    function maiorOperacao(Tabela: string; Campo: string): Integer;
    function TestaCgc(xCGC: string): Boolean;
    function MemoInterbase(Sender: TObject): string;
    function DiferencaEntreHoras(Hora_Final: TTime; Hora_Inicial: TTime): string;
    function ImpDireita(Valor: string; const tamanho: Integer): string;
    function cria_log_de_erros(origem_do_erro: TStrings; modulo_do_erro: string; descricao: string; usuario: string): Boolean;
    function verifica_permissao(cod_modulo: string; cod_mod: string; usuario: string; mensagem: Boolean): Boolean;
    function centralizar(S: string; Len: Byte): string;
    function al_left(s: string; n: Integer): string;
    function al_rigth(s: string; n: Integer): string;
    function LeIni(tipo: Integer; grupo: string; chave: string): string;
    function LeIniImpressoes(tipo: Integer; grupo: string; chave: string): string;
    function retorna_informacao(parametro: string; tabela: Integer; field: Integer): string;
    function retiraAcentos(Str: string): string;
    function retornaCodProduto(codBarrasProduto: string): string;
    procedure gravaini(grupo: string; chave: string; valor: string);
    function grava_arq_texto(nome_arq: string; texto: string): Boolean;
    function corretor_string(): string;
    function procura_simbolo(palavra: string; simbolo: string): Integer;
    procedure ExpXML(DataSet: TDataSet; Arq: string);
    function decriptografa(Str: string; chave: string): string;
    function criptografa(Str: string; chave: string): string;
    procedure atualizaObservacoesProduto(idProduto: Integer; observacao: string);
    function FormataCNPJ(cnpj: string): string;
    function formatar_memo_sql(memo: TMemo): string;
    function organizarCupom(Str: string; str2: string; Chr: string): string;
    function getCodMetreResponsavel(codGarcon: string): string;
    function abre_porta_imp_NF(marca: Integer; modelo: Integer; porta: string): string;
    function fecha_porta_imp_NF(marca: Integer; modelo: Integer; porta: string): string;
    procedure gravarStream(codStream: string; tipo: string; med: string; stream: string);
    function verifica_intervalo_hora(horaIni: string; horaFim: string): Boolean;

    // RELATÓRIOS

    function removeCaracteres(Text: string): string;
    function AnsiLength(const s: string): Integer;
    function BuscaTroca(Text, Busca, Troca: string): string;
    function retiraCaracter(Text, Busca, Troca: string): string;
    function trocaCaracteresEpson(Str: string): string;
    function VerificaConexaoInternet: Boolean;
    function TBRound(Value: Extended; Decimals: Integer): Extended;
    function imprimeCabecalhoRelatorioDiversoNF(marca: Integer; modelo: Integer; titulo: string): string;
    procedure imprimeReciboRecebimentoFaturas(marca: Integer; codCliente: string; nomeCliente: string; totalFaturas: Real);
    procedure imprimirPromissorias(marca: Integer; codVenda: string);
    procedure imprimeProtocoloLancamentoRd(evento: SmallInt; codLancamento: string);
    function imprimeCabecalhoECF(marca: Integer; tipo: Integer; AMesa: string; codVenda: string; codPedidoDelivery: string; codCliente: string; nomeCliente: string; via: SmallInt): Boolean;
    procedure imprimeComprovanteSangria(marca: Integer; codSangria: string);
    procedure imprimeComprovanteRecebimentoParcial(marca: Integer; AMesa: string);

    procedure imprimeResumoDoDia(marca: Integer; dataSistema: TDate);
    procedure ImprimeVendasPorGarconAbriuMesa(marca: Integer; numeroCaixa: string);
    function imprimeMovimentoContaECF(marca: Integer; AMesa: string; codVenda: string): string;
    function imprimeRecebimentosParciaisECF(marca: Integer; AMesa: string): string;
    function imprime_rodape_ExtratoContaNF(marca: Integer; modelo: Integer; tipo: Integer; nPessoas: Integer; subtotal: Double; couvert: Double; txServico: Double; repique: Double; desconto: Double; totalConta: Double; totalPago: Double; troco: Double; layout: Integer): string;
    procedure imprimeEstornoMesa(marca: Integer; AMesa: string);
    procedure ListarArquivos(Diretorio: string; Sub: Boolean; lista: TStrings);
    function imprimeRodapeExtratoContaECF(AMesa: string; codVenda: string; marca: Integer; tipo: Integer; nPessoas: Integer; subtotal: Double; couvert: Double; txServico: Double; repique: Double; desconto: Double; totalConta: Double; totalPago: Double; troco: Double; txEtrega: Double): string;
    function imprimeTextoMiniPrinter(AStr: string): Boolean;
    function imprimeTexoImpressoraNFCE: Boolean;
    procedure configuraImpressoraNFCE();
    procedure configuraImpressoraNaoFiscal();
    function getTotalPagamentosParciais(AMesa: string): Double;
    function imprimeRecebimentosParciais(marca: Integer; modelo: Integer; AMesa: string): string;

   /// Funções de impressora não fiscal
    function imp_bmp_impNF(marca: Integer; modelo: Integer; indice: Integer; img: WideString; posicao: Integer): string;
    function cortaPapelImpNF(arquivo: string; marca: Integer; modelo: Integer): string;
    function AbreGaveta(marca: Integer; modelo: Integer): string;


   //////////////////////////////////////////////////////////////////////////////
    function imprimeLinhaECF(marca: Integer; linha: WideString; negrito: Boolean; italico: Boolean; sublinhado: Boolean; tam: Boolean; comprimido: Boolean; largura: Boolean; altura: Boolean): string;
    function imprimeLinhaArquivo(marca: Integer; linha: WideString; negrito: Boolean; italico: Boolean; sublinhado: Boolean; tam: Boolean; comprimido: Boolean; largura: Boolean; altura: Boolean): string;
    function imprime_linha_impNF(marca: Integer; modelo: Integer; linha: WideString; negrito: Boolean; italico: Boolean; sublinhado: Boolean; tam: Boolean; comprimido: Boolean; largura: Boolean; altura: Boolean): string;
    function formatacao_daruma(negrito: Boolean; italico: Boolean; sublinhado: Boolean; tam: Boolean; comprimido: Boolean; largura: Boolean; altura: Boolean): string;
    function formatacao_daruma_final(negrito: Boolean; italico: Boolean; sublinhado: Boolean; tam: Boolean; comprimido: Boolean; largura: Boolean; altura: Boolean): string;
    function formatacaoBematech(negrito: Boolean; italico: Boolean; sublinhado: Boolean; tam: Boolean; comprimido: Boolean; largura: Boolean; altura: Boolean): string;
    function formatacaoACBRInicial(negrito: Boolean; italico: Boolean; sublinhado: Boolean; tam: Boolean; comprimido: Boolean; largura: Boolean; altura: Boolean): string;
    function formatacaoACBRFinal(negrito: Boolean; italico: Boolean; sublinhado: Boolean; tam: Boolean; comprimido: Boolean; largura: Boolean; altura: Boolean): string;
    function formatacaoElginXprint(negrito: Boolean; italico: Boolean; sublinhado: Boolean; tam: Boolean; comprimido: Boolean; largura: Boolean; altura: Boolean): string;
    function formatacaoElginI9(negrito: Boolean; italico: Boolean; sublinhado: Boolean; tam: Boolean; comprimido: Boolean; largura: Boolean; altura: Boolean): string;
    function formatacaoBematechFinal(negrito: Boolean; italico: Boolean; sublinhado: Boolean; tam: Boolean; comprimido: Boolean; largura: Boolean; altura: Boolean): string;
    function formatacaoDarumaNova(negrito: Boolean; italico: Boolean; sublinhado: Boolean; tam: Boolean; comprimido: Boolean; largura: Boolean; altura: Boolean): string;
    function formatacaoDarumaNovaFinal(negrito: Boolean; italico: Boolean; sublinhado: Boolean; tam: Boolean; comprimido: Boolean; largura: Boolean; altura: Boolean): string;
    function formatacao_Epson(negrito: Boolean; italico: Boolean; sublinhado: Boolean; tam: Boolean; comprimido: Boolean; largura: Boolean; altura: Boolean): string;
    procedure reimprimirDanfe(parametro: string; campo: SmallInt; visualizar: Boolean; cancelada: Boolean);
    function fAlinhaD(const Texto, Key, Espaco, Decimal: string): string;
    function alinha_valor_a_direita(tam_str: Integer; Str: string): string;
//   function  imprime_cabecalho_Cupom(marca : integer; modelo : integer; tipo : integer ; mesa : string; layout : integer; codVenda : string) : boolean;
    function imprimeCabecalhoEstornoDeMesa(marca: Integer; modelo: Integer; tipo: Integer; AMesa: string; layout: Integer): Boolean;
    procedure configuraBalancas();
   ///////////////////////////////

    function verificaPermissaoAcao(modulo: string; exibirMensagem: Boolean; solicitarUsuario: Boolean): Boolean;
    procedure exibe_painel_troco(mensagem: string; troco: string);
    procedure EncerraPainelDeErros();



   ///
    function imprimirExtratoTerminal(marca: Integer; modelo: Integer): string;
    procedure DataModuleCreate(Sender: TObject);
    function asteriscos(qtd: Integer): string;
    procedure ComPortRxChar(Sender: TObject; Count: Integer);
    function PadC(S: string; Len: Byte): string;
    procedure gravarEstornoDeItem(AMesa: string; codMotivo: string; descricaoMotivo: string; CodProduto: string; descriCaoProduto: string; qtde: Double; valorUnitario: Double; obs: string; imprimirCancelamento: Boolean; codCliente: string; nomeCliente: string; idMovimento: Integer);
    procedure imprimirEstornoDeItem(codEstorno: string; codCliente: string; nomeCliente: string);
    function imprimirTransferenciaDeProduto(codTransferencia: string): string;
    procedure atualizaTentativasEnvioNFCE(observacao: string; codVenda: string);
    procedure apagaExtratosEmitidos(AMesa: string);
    procedure ApagaAberturaDaMesa(AMesa: string);
    function getUltimoExtratoEmitidoMesa(AMesa: string): TextratoEmitido;
    function verificaExtratosEmitidos(AMesa: string): Boolean;
    procedure imprimeListagemMesasAbertas(marca: Integer; modelo: Integer);
    function geraCodigo(AGenerator: string; tam: Integer): string;
    function geraID(AGenerator: string): Largeint;
    procedure qry_itens_estoqueBeforePost(DataSet: TDataSet);
    function verificaExistenciaUsuario(cod_usuario: string): Boolean;
    function verificaTipoFormaPagamento(cod_forma: string): Integer;
    function getTipoPagamentoNFCE(cod_forma: string): TpcnFormaPagamento;
    function getTipoFormaIntegrada(AForma: integer): boolean;
    function getTipoPagamentoSAT(cod_forma: string): TpcnCodigoMP;
    function verificaExistenciaRecebimentosParciais(AMesa: string): Boolean;
    function retornaCampoQQTabela(tabela: string; campos: string; cp_pesq: string; param_pesq: string; cp_ret: Integer): string;
    function verificaSeProdutoEstaNaConta(codProduto: string; AMesa: string): Boolean;
    function AnsiToUtf8(x: AnsiString): string;
    procedure imprimeCabecalhoMiniPrinter(marca: Integer; modelo: Integer; titulo: string);
    procedure imprimeProdutosMiniPrinter(marca: Integer; modelo: Integer);
    procedure imprimeGarconsMiniPrinter(marca: Integer; modelo: Integer);
    procedure saltaLinhasMiniPrinter(marca: Integer; modelo: Integer);
    function maiorVenda(Tabela: string; Campo: string): Integer;
    procedure estornarMesaInteira(marca: Integer; modelo: Integer; AMesa: string; valorTotal: Double);
    procedure gravarRepique(codVenda: string; totalVenda: string; valor: Double);
    procedure insereExtratosEmitidos(AMesa: string);
    procedure enviaProdutoParaFilaImpressao(cod_garcon: string; cod_produto: string; AMesa: string; quantidade: Double; observacao: string; sabores: string; tipo: string; terminal: Integer; idMovimentoMesa: string; tipoMassa: string);
//    function ImprimeFilaDeImpressao(delivery: Boolean; codPedidoDelivery: string; operacao: SmallInt): string;
    function verificaProdutoImprimeLocalProducao(cod_produto: string): Boolean;
    function verificaProdutoImprimeDelivery(cod_produto: string): Boolean;
    function verificaProdutoImprimeMesas(cod_produto: string): Boolean;
    function verificaProdutoImprimeBalcao(cod_produto: string): Boolean;
    procedure formataCabecalhoDelivery(codPedido: string);
    procedure imprimirFichas(codVenda: string);
    procedure tbComprasTempCalcFields(DataSet: TDataSet);
    procedure tbComprasTempvalorUnitarioValidate(Sender: TField);
    procedure tbComprasTempqtdeValidate(Sender: TField);
    procedure imprimeComprovanteDelivery(codPedido: string; operacao: SmallInt; AMensagemEntregador: string);

    function getCodCouvertAutomatico(tipoCouvert: SmallInt; AMesa: string): string;
    function verificaSeCobraCouvertNoDIa(): Boolean;
    function verificaSeMesaTemMovimento(AMesa: string): Boolean;
    function getNomeGarconAbriuMesa(AMesa: string): string;
    function getCodGarconAbriuMesa(Amesa: string): string;
    function getHoraAberturaDaMesa(AMesa: string): TTime;
    procedure aplicaDescontoItem(AMesa: string; codMovimento: string; valor: Double);

    // Função de Gravação em Arquivo
    procedure gravaStrEmArquivoDeTexto(arquivo: string; Str: string);
    function imprimeLinhaEmArquivo(Arquivo: string; marca: Integer; modelo: Integer; linha: WideString; negrito: Boolean; italico: Boolean; sublinhado: Boolean; tam: Boolean; comprimido: Boolean; largura: Boolean; altura: Boolean): string;
    function inicializarSAT(): Boolean;
    function enviarCupomSat(): Boolean;
    procedure gravaCabecalhoPedidoDelivery(Arquivo: string; marca: Integer; modelo: Integer; codigoPedido: string; operacao: SmallInt);
    procedure gravaCabecalhoPedidoNoArquivoDeImpressao(Arquivo: string; n_seq: string; cod_garcon: string; marca: Integer; modelo: Integer; AMesa: string; tipo: Integer);
    procedure gravaProdutosDoPedidoNoArquivo(Arquivo: string; marca: Integer; modelo: Integer; codProduto: string; descricaoProduto: string; quantidade: Double; preco: Double; observacoes: string; sabores: string; tipoMassa: string; idLancamento: Integer);
    procedure saltosNoArquivoTexto(Arquivo: string; marca: Integer; modelo: Integer; saltos: Integer);
    function verificaSeFuncionaComoBoate(): Boolean;
    function verificaSeRecebeCouvertEntrada(): Boolean;
    procedure DataModuleDestroy(Sender: TObject);
    function verificaSomaProporcoesPizza(): Boolean;
    procedure ExportaDatasetExcel(DataSet: TDataSet; Arq: string);
    procedure dbrestauranteIdleTimer(Sender: TObject);
    procedure satGetsignAC(var Chave: AnsiString);
    procedure satGetcodigoDeAtivacao(var Chave: AnsiString);
    procedure satGravarLog(const ALogLine: string; var Tratado: Boolean);
    procedure satMensagemSEFAZ(ACod: Integer; AMensagem: string);
    procedure ACBrTEFD1ExibeMsg(Operacao: TACBrTEFDOperacaoMensagem; Mensagem: string; var AModalResult: TModalResult);
    procedure ACBrTEFD1ComandaECF(Operacao: TACBrTEFDOperacaoECF; Resp: TACBrTEFDResp; var RetornoECF: Integer);
    procedure ACBrTEFD1ComandaECFAbreVinculado(COO, IndiceECF: string; Valor: Double; var RetornoECF: Integer);
    procedure ACBrTEFD1ComandaECFImprimeVia(TipoRelatorio: TACBrTEFDTipoRelatorio; Via: Integer; ImagemComprovante: TStringList; var RetornoECF: Integer);
    procedure ACBrTEFD1ComandaECFPagamento(IndiceECF: string; Valor: Double; var RetornoECF: Integer);
    procedure ACBrTEFD1ComandaECFSubtotaliza(DescAcre: Double; var RetornoECF: Integer);
    procedure ACBrTEFD1InfoECF(Operacao: TACBrTEFDInfoECF; var RetornoECF: string);
    procedure ACBrTEFD1GravarLog(const GP: TACBrTEFDTipo; ALogLine: string; var Tratado: Boolean);
    procedure ACBrTEFD1AntesFinalizarRequisicao(Req: TACBrTEFDReq);
    procedure qryVendasCaixaTIPO_VENDAGetText(Sender: TField; var Text: string; DisplayText: Boolean);
    procedure IdThreadComponent1BeforeRun(Sender: TIdThreadComponent);
    procedure IdThreadComponent1Run(Sender: TIdThreadComponent);
    function GetTempDirectory: string;
    function getNCMProduto(tipoConsulta: SmallInt; codigo: string): string;
    function getCESTProduto(tipoConsulta: SmallInt; codigo: string): string;
    function getCFOPProduto(tipoConsulta: SmallInt; codigo: string): string;
    function getCSTProduto(tipoConsulta: SmallInt; codigo: string): string;
    procedure verificaErrosNFCEEmitidas;
    procedure inserirXMLNotasDestinadas(Xml: string);
    procedure imprimePedidoProducao(sequenciaImpressao: string);
    procedure configuraImpressoraProducao(numeroImpressora: Integer);
    procedure imprimeTextoACBR(texto: TStringList);
    procedure imprimeCabecalhoPedido(strComprovante: TStringList; horaPedido: TDateTime; AMesa, garcom, guidSeq: string; via: SmallInt);

    procedure imprimePreContaTodasAsMesas;
    procedure ativarModoContingenciaOfflineNFCE;
    procedure desativarModoContingenciaOFFlineNFCE;
    procedure CancelaNotasPendentes;
    procedure CancelaNotasPendentesPorSubstituicao;
    function cancelaNFECarregadaPorSubstituicao(justificativa, chaveNotaSubstituta: string): Boolean;
    function verificaExistenciaNotasPendentesCancelamento: Boolean;
    procedure cancelaNFEPelaChave(chave, protocolo, justificativa: string);
    procedure IdThreadComponent1Terminate(Sender: TIdThreadComponent);
    procedure apagaNotaCarregadaACBRdaTabelaDeErros();
    procedure gravarEventoNFE(chave, xmlEvento: string; dataHoraEvento: TDateTime);

    procedure atualizaDescontosDaVenda(codVenda: string);
    procedure balanca2LePeso(Peso: Double; Resposta: AnsiString);
    procedure balancaLePeso(Peso: Double; Resposta: AnsiString);
    procedure imprimePedidoDeliveryNaProducao(ACodPedido: string; Aevento: SmallInt);
    procedure setTabelaPrecoAtual(Acodigo: Integer);
    procedure modificaTabelaDePrecoItensLancados(ANumeroMesa: string; ACodigoTabela: Integer);
    procedure imprimePedidoProducaoBalcao(ANumeroMesaBalcao, ANomeClienteBalcao: string);
    function getMemTable(memTable: TFDMemTable; ASQL: string): Boolean;
    procedure gerarEmpresasSelecionadas(LEmpresas: string);

//    function getMemTableDataPuro(memTable: TFDMemTable; ASQL: string): Boolean;
    function executaSQL(ASQL: string): Boolean;

//    function LeIni(tipo : integer;grupo: string; chave:string): string;
    procedure getDadosDoPedido(APedido: TPedidoPlataforma);
    function verificaSubtotalPedidoPlataforma(APedido: TPedidoPlataforma): boolean;
  private
    { Private declarations }

    GDadosAPIReplicacao: TDadosAPIReplicacao;
    LogStrings: TStringList;
    caminhoConfigs: string;
    IdSSLIOHandlerSocketOpenSSL1: TIdSSLIOHandlerSocketOpenSSL;
    URL_Base: string;
    tabelaPrecoAtual: TTabelaPreco;
    numeroTransacaoTef: SmallInt;
    estadoSimuladoEcf: tEstadoEcfSimulado;
    tipoOperacaoTEF: SmallInt;
    operacaoADMTEF: Boolean;
    testouExpiracaoCertificadoEntrada: Boolean;
    LDesativaCapturaLogs: boolean;
    function TemAtributo(Attr, Val: Integer): Boolean;
    function gerarEAssinarNFCE: Boolean;
    procedure adicionaLinhaArquivoExtrato(Str: string);
    procedure setMensagemOperadorTEF(mensagem: string);
    function getMensagemOperadorTEF: string;
    procedure imprimeCancelamentoPedidoProducao(codEstorno: string);
    function cancelaNFECarregadaACBR(justificativa: string): Boolean;
    procedure atualizaStatusCancelamentoNFE;
    procedure parametrizaArquivoDeLogoNFE(AnotaEmissaoPropria: Boolean);
    procedure verificaExpiracaoCertificadoDigital;
    function getSerieNFCEEmContingencia: Integer;
    function getNumeroNFCEEmContingencia: Integer;
    function getNumeroCartaCorrecaoNFE: Integer;
    procedure AtualizaChaveNotaSubstitutaCancelar(chaveParaCancelar, chaveNFCESubstituta: string);
    function Converte(cmd: string): string;
    procedure imprimeCabecalhoPedidoBalcao(strComprovante: TStringList; ANomeCliente: string; via: SmallInt);
    procedure getProdutosDoPedidoPlataforma(APedido: TPedidoPlataforma);
    procedure getPagamentosDoPedidoPlataforma(APedido: TPedidoPlataforma);
    procedure SalvarXMLCarregadoACBR(ATipoDocumento: integer; AChave: string; AlocalArquivo: string);
    function getMensagemEmailNFE: string;
    procedure CriaDadosConexaoRest;
    procedure getSaboresPizzaPedidoPlataforma(APedido: TPedidoPlataforma; AIdProdutoPedido: integer);
    procedure imprimeCabecalhoPedidoDeliveryProducao(ACodPedido: string; AIdPedidoIntegracao: LargeInt; evento: SmallInt; strComprovante: TStringList; AViaPedido: SmallInt; AQueryPedido: TIBQuery);
    function Tdm(ACodProduto: string; AParent: TPanel): Boolean;
    procedure filtraProdutosGrupoAdicionais(AGrupoCombo: integer);
    function getNumeroNFCE2: integer;
    procedure criaBotaoGrupoCombo(ALinha, AColuna: SmallInt; ACodigoGrupo: Integer; ADescricao: string; AParent: TPanel; ASelecionado: Boolean; AOnClick: TNotifyEvent);
    procedure CreateRealDAOExecute;
    procedure ConfigureRealConnectionDatabaseParams(AConnection: TRealConnection);
    procedure ConfigureRealConnectionRESTParams(AConnection: TRealConnection);
    procedure SelecionaItemUnicoMovimentoMesa;
    procedure gravarTransferenciaDeItem(AListaSQL: TList<string>; ATransferencia: TTransferenciaItem);
    function ConvertToStatusCode(Value: integer): THttpStatusCode;
    procedure AddBodyForm(ARequisicao: TRESTRequest; ABody: TStringList);
    procedure AddHeaders(ARequisicao: TRESTRequest; AHeaders: TStringList);
    procedure AddCustomBody(ARequisicao: TRESTRequest; ABody: TStringList);
    procedure CarregaDadosAPIReplicacao(ADados: TDadosAPIReplicacao);
    procedure ImprimeResumodeParciais(ACodCaixa, ACodEmpresa: string);
    procedure ImprimeComprovanteDeSuprimento(ACodEmpresa, ACodCAixa: string; Avalor: double; AAbertura: boolean);
    function getSQLResumoCaixa(ACodEmpresa, ACodCaixa: string): string;
    procedure ImprimeVendasPorModalidade(ACodEmpresa, ACodCaixa: string; ARelatorio: Tstringlist);
    function getSQLVendasPorModalidade(ACodEmpresa, ACodCaixa: string): string;
    procedure ImprimeApuracaoDoCaixa(ACodEmpresa, ACodCaixa: string; ARelatorio: Tstringlist);
    function getSQLApuracaoDeCaixa(ACodEmpresa, ACodCaixa: string): string;
    procedure ImprimeDescontosDoCaixa(ACodEmpresa, ACodCaixa: string; ARelatorio: Tstringlist);
    function GetSQLDescontosCaixa(ACodEmpresa, ACodCaixa: string): string;
    procedure ImprimeTaxaServicoDoCaixa(ACodEmpresa, ACodCaixa: string; ARelatorio: Tstringlist);
    function GetSQLPedidosPorEntregador(ACodEmpresa, ACodCaixa: string): string;
    procedure ImprimePedidosPorEntregador(ACodEmpresa, ACodCaixa: string; ARelatorio: Tstringlist);
    function getSQLProdutosVendidosCaixa(ACodEmpresa, ACodCaixa: string; ADataCaixa: Tdate): string;
    function IsInteger(const Number: Double): Boolean;
    function FormatNumberStr(const ANumber: Double): string;
    procedure imprimeSangriasCaixa(ACodEmpresa, ACodCaixa: string; ARelatorio: Tstringlist);
    function getSQLSangriasCaixa(ACodEmpresa, ACodCaixa: string): string;
    procedure imprimeSuprimentosCaixa(ACodEmpresa, ACodCaixa: string; ARelatorio: Tstringlist);
    function getSQLSuprimentosCaixa(ACodEmpresa, ACodCaixa: string): string;
    function getSQLPendurasEfetuadas(ACodEmpresa, ACodCaixa: string): string;
    procedure imprimePendurasCaixa(ACodEmpresa, ACodCaixa: string; ARelatorio: Tstringlist);
    procedure ImprimeCabecalhoRelatorioCaixa(ACodEmpresa, ACodCaixa: string; ARelatorio: Tstringlist; ATipoImpressao: TTipoRelatorioCaixa);
    procedure imprimeProdutosVendidosCaixa(ACodEmpresa, ACodCaixa: string; ADataCaixa: TDate; ARelatorio: Tstringlist);
    function getImageServerParams: TStringList;
    procedure getDataFromExternalDatabase(SQL: TStringList; MemTable: TFDMemTable; Params: TStringList);
    procedure ExecuteSQLExternalDatabase(SQL, Params: TStringList);
    procedure GetSQLPrecosTabelasProdutos(ALista: TStringlist);
    function ProcessarMensagemRejeicao(const Mensagem: string): string;
    procedure ConfiguraImpressoraExpedicao;
    function ImprimeTextoImpressoraExpedicao(AStr: string): Boolean;
    function FormatarNumeroCom3CasasOuInteiro(Valor: Double): string;
    function getSQLEstornosEfetuados(ACodEmpresa, ACodCaixa: string): string;
    procedure imprimeEstornosCaixa(ACodEmpresa, ACodCaixa: string; ARelatorio: Tstringlist);
    function LeIniImpressoesDelivery(tipo: Integer; grupo, chave: string): string;
    procedure configuraImpressoraProducaoDelivery(numeroImpressora: Integer);
    function StringToStringList(const AText: string): TStringList;
























































//    function getMemTableByAPI(AMemTable: TDataset; ASQL: string): string;
  public
    { Public declarations }
    LImageServerParams: TStringList;
    RealDaoExecute: TRealDAOExecute;
    Fmt: TFormatSettings;
    ConexaoRest: Boolean;
    diasExpiracaoCertificado: Integer;
    TEFAutenticou: Boolean;
    tentarNovamenteCappta: SmallInt;
    tipoViaCappta: Integer;
    parametroRecebidoCappta: string;
    podeFecharFormMensagens: Boolean;
    tempoFormMensagens: SmallInt;
    terminouEnvioNFCE: Boolean;
    tentandoEmissaoContingencia: Boolean;
    nfceEnviada: Boolean;
    function DateOnly(const ADate: TDateTime): TDate;
    function getPeriodoAnoAnterior(const LDataInicio, LDataFim: TDate): TEstruturaPeriodo;
    function getPeriodoMesAnterior(const LDataInicio, LDataFim: TDate): TEstruturaPeriodo;
    procedure VisualizarNFEDeEntrada(AChaveDocumento: string);
    function FormataDataFirebird(const ADate: TDateTime): string;
    procedure enviaNFEPorEmail(AEmail: string);
    procedure MarcarNumeracaoNFE(AID, AOpcao: Integer);
    function BuscaEntradaPorChaveNFE(AChave: string): string;
    procedure getDadosParticipante(ACodigo: string; AMemTable: TFDMemTable);
    procedure IniciaNotaFiscal(ANota: NotaFiscal; AOperacao: TTipoOperacaoNFE);
    procedure PreencheDadosDadosDoEmitente(ANota: NotaFiscal);
    procedure PreencheDadosDestinatarioNFE(ACodigoParticipante: string; ANota: NotaFiscal);
    procedure CopiarProdutosDaNFE(ANFDestino: NotaFiscal; AChaveNFE: string);
    procedure RecalcularTotaisNFReferenciada(ANota: NotaFiscal);

    function StringListToList(const SL: TStringList): TList<string>;
    procedure GravarXMLGrandeNotasDestinadas(const AChaveNFE, AXML: string);
    function GetSQLExcluirPedidosDeIntegracaoAntigos: string;
    function GetJsonPagamentoIntegracao(AIDPagamento: string): string;
    procedure ForcarReintegracao(AIDPedido: string);
    function GetNomeDiaDaSemana(Data: TDate): string;
    function GetXMLFromVendasByChave(AChave: string): string;
    function FormatJSON(const AJsonString: string): string;
    procedure CloseAllDataSets(DataModule: TDataModule);
    procedure AtualizarCustosDaVenda(ACodVenda: string);
    procedure carregarFormasDePagamento(ATodas: Boolean);
    procedure RecebePedidosLancamentoIndividual(AMesaDestino: string);
    procedure SepararContaCliente(AMesaOrigem, AMesaDestino, ACodCliente: string);
    procedure AgruparProdutos(LMemTable: TFDMemTable; AProdutoBase: string);
    function BuscaMesaDestinoRecebimentoIndividual: string;
    function ValidaParametrosTransferenciaItem(AMesaOrigem, AMesaDestino: string): Boolean;
    procedure TransfereProdutosSelecionados(ATransferencia: TTransferenciaItem);
    procedure ImprimeTransferenciaProdutos(ATransferencia: TTransferenciaItem);
    procedure SelecionaItemMovimentoMesa();
    procedure SelecionaTodosOsItensMovimentoMesa(ASelecionar: Boolean);
    function verificaItenSelecionadosMovimentoMesa: boolean;
    procedure recriarTabelasDePreco();
    function configuraACBRMail: boolean;

    function StrtoMultilineStr(AStr: string; AtamanhoMaxLinha: Integer): string;
    procedure gerarFatura(codCliente: string; codVenda: string; valorFatura: Double; obs: string; dataVencimento: TDate);
    function autenticaTEF: Boolean;
    procedure setEstadoSimuladoECF(estado: tEstadoEcfSimulado);
    function getEstadoSimuladoECF: tEstadoEcfSimulado;
    procedure setTipoOperacaoTEF(tipo: SmallInt);
    function getTipoOperacaoTEF: SmallInt;
    procedure setOperacaoADMTEF(operacao: Boolean);
    procedure parametrizaAcbrNFE(modeloNfe: TpcnModeloDF; visualizar: Boolean; ANotaEmissaoPropria: Boolean);
    procedure parametrizaAcbrCTE;
    procedure SetTabelaPrecoPadrao;
    function getTabelaPrecoAtual: TTabelaPreco;
    procedure ExportarXMLVenda(AChaveNFE: string; ACancelada: Boolean; ACaminho: string);
    function getXMLNFEDestinada(AChaveNFE: string): string;
    procedure ExecutaBlocoDeInstrucoes(AListaSQL: TList<string>; AQtdBlocos: smallint);
    procedure ExecutaBlocoDeInstrucoesTransacao(AListaSQL: TList<string>; AQtdBlocos: smallint; ts: TFDtransaction);
    procedure AtualizaPrecosSaboresPizzaTabelaPrecos(AMesa: string; ATabela: integer);
    function criaGruposCombo(ACodProduto: string; AParent: TPanel; AcodGrupoSelecionado: LongInt; AonClick: TNotifyEvent): Boolean;
    procedure destroiComponentes(AParent: TComponent);
    function verificaSeTodosGruposComboForamSelecionados: Boolean;
    function validarCredenciaisUsuario(AEmpresa, ACodigoUsuario, ASenha: string): boolean;
    procedure setCodEmpresa(ACodEmpresa: string);
    procedure SplitXML(AXML: string; LLista: Tstringlist);
    function IntToBol(AIntNumber: integer): boolean;
    function BoolToInt(Abol: boolean): smallint;

    procedure ApagarItensDoPedidoDoMovimento(AcodPedido: string);
    procedure exibe_painel_erro(mensagem, captionBotao: string; ATipoDialogo: TMsgDlgType = mtError);
    function GetDadosAPIReplicacao: TDadosAPIReplicacao;
    procedure GravarTransacaoTEF(ACodFormaPagamento, AMesa: string; AValor: double);
    function getSQLRelatorioTaxaServico(ACodEmpresa, ACodCaixa: string; ADataInicial, ADataFinal: TDateTime): string;
    procedure EmitirRelatorioDeCaixaNaMiniPrinter(ACodEmpresa: string; ACodCaixa: string; ATipoImpressao: TTipoRelatorioCaixa);
    procedure gravarSuprimento(ACodEmpresa, ACodCaixa: string; AValor: double; AAbertura: boolean);
    function CorrigeImpressaoComprovanteTEF(AOperadora, AStrComprovante: string): string;
    function GerarAuditoriaDeCaixa(ACodEmpresa, ACodCaixa: string): LargeInt;
    function getIdAuditoriaDeCAixa(ACodEmpresa, ACodCaixa: string): LargeInt;
    procedure getDadosAuditoriaDeCaixa(AMemTable: TFDMemTable; AIDAuditoria: LargeInt);

    procedure VisualizarDetalhamentoDaVenda(ACodEmpresa, ACodVenda: string);
    function GenerateGUID: string;
    procedure CapturarImagemCamera(LLogImagem: TLogImagem);
    function RemoveChars(const S, CharsToRemove: string): string;
    procedure DisplayBase64ImageIncxImage(cxImage: TcxImage; Base64String: string);
    function getBase64FromImageServer(LGUID: string): string;
    procedure InsereChavesMovimento(ANumeroCaixa, ANumeroMesa: string);
    function carregarXMLVenda(AChave: string; ACancelada: boolean): Boolean;
    procedure LimpaInformacoesDaMesa(AMesa, ANumeroCaixa: string);
    function emitirCartaCorrecao(AChaveNFE, textoCartaCorrecao: string): string;
    function StringIsInArray(const SearchString: string; const StringArray: array of string): Boolean;
    function CFOPIsSubstituicaoTributaria(const CFOP: string): Boolean;
    function CSTICMSIsSubstituicaoTributariaCST(const CST: string): Boolean;
    function HTTPRequest(AMethod: TRestRequestMethod; ASucessCode: THttpStatusCode; AURL_Base: string; ARota: string; URLParam: string; AHeaders: TStringList; ABody: TStringList; AResponseString: TStringList; AConnectTimeout: Integer; AReadTimeout: Integer; ABodyType: string): Boolean;
    procedure ExcluirProduto(ACodProduto: string);
    function verificaPossibilidadeExclusaoDoProduto(ACodProduto: string): boolean;
    procedure AtivarOuDesativarProduto(ACodProduto: string; LOpcao: integer);
    procedure ExportarCXGrid(ACxGrid: TcxGrid; AFormato: TTipoExportacaoCxGrid);
    function IsFileInUse(const FileName: string): Boolean;
    procedure VisualizarDanfeCompra(AChave: string);
    procedure getDadosProduto(LTipoPesquisa: TTipoPesquisaProduto; ACodigo: string; AProduto: Produto.TProduto);
    procedure ImprimeComprovanteMesa(ATipoComprovante: TTipoComprovante; AMesa: string; AMesDestino: string; AImprimeProducao: boolean);
    procedure SalvarAuditoriaDeCaixa(ATbAuditoria: TFDMemTable; AObservacao: string; AIdHistoricoAuditoria: Integer);
    procedure AgruparNomesClienteMesa(ANomeCliente: string);

  end;

type
  TKeySizeIndex = (ks64, ks128, ks192, ks256);

const
  cTabNormalHex = '#F3F6FB';
  cTabActiveHex = '#1E73BE';
  cTextNormalHex = '#333F4A';
  cTextActiveHex = '#FFFFFF';
  KeySizes: array[TKeySizeIndex] of Byte = (8, 16, 24, 32);
  HTTP_CODES: array[THttpStatusCode] of integer = (202{scAccepted}, 300{scAmbiguous}, 502{scBadGateway}, 400{scBadRequest}, 409{scConflict}, 100{scContinue}, 201{scCreated}, 417{scExpectationFailed}, 403{scForbidden}, 302{scFound}, 504{scGatewayTimeout}, 410{scGone}, 505{scHttpVersionNotSupported}, 500{scInternalServerError}, 411{scLengthRequired}, 405{scMethodNotAllowed}, 301{scMoved}, 301{scMovedPermanently}, 300{scMultipleChoices}, 204{scNoContent}, 203{scNonAuthoritativeInformation}, 406
    {scNotAcceptable}, 404{scNotFound}, 501{scNotImplemented}, 304{scNotModified}, 200{scOK}, 206{scPartialContent}, 402{scPaymentRequired}, 412{scPreconditionFailed}, 407{scProxyAuthenticationRequired}, 302{scRedirect}, 307{scRedirectKeepVerb}, 303{scRedirectMethod}, 416{scRequestedRangeNotSatisfiable}, 413{scRequestEntityTooLarge}, 408{scRequestTimeout}, 414{scRequestUriTooLong}, 205{scResetContent}, 303{scSeeOther}, 503{scServiceUnavailable}, 101{scSwitchingProtocols}, 307{scTemporaryRedirect}, 401{scUnauthorized}, 415{scUnsupportedMediaType}, 306{scUnused}, 426{scUpgradeRequired}, 305{scUseProxy}, 0{scUnknown}
      );

var
  Key: array[0..32] of Byte;
  PlainText: string;
  CipherText: string;
  cor_ao_entrar: TColor;
  cor_ao_sair: TColor;
  layoutExtrato: SmallInt;
  RetornoPorta: string;

var
  dm: Tdm;

implementation

uses
  uu_frm_principal, Math, uu_manutencao_grupos, uu_modelo_Vazio, uuLogTouch,
  uuFrmTroco, uuRecebimentoContaAssinada, ACBrNFeWebServices, uu_encerramento,
  uuOperacoesCaixa, uuMensagemExpiracaoCertificado, uuPrototipoCaixaREstaurante,
  UU_DM_RELATORIOS;

{$R *.dfm}

procedure Tdm.atualizaDataDoSistema();
begin

  dm.tb_parametros.Active := False;
  dm.tb_parametros.Active := True;
  data_do_sistema := dm.tb_parametros.Fieldbyname('data_sistema').value;
  frm_principal.lbDataDoSistema.Caption := FormatDateTime('DD/MM/YY', data_do_sistema);
end;

function Tdm.TemAtributo(Attr, Val: Integer): Boolean;
begin
  Result := Attr and Val = Val;
end;

procedure TDM.carregarFormasDePagamento(ATodas: Boolean);
var
  LSQL: TStringList;
begin

  LSQL := TStringList.Create;

  try
    try
      LSQL.Clear;
      LSQL.Add('  select  * from formas_pagamento fp ');
      if (ATodas = False) then
      begin
        LSQL.Add('     where coalesce(fp.desativada,0) <> 1 ');
      end;
      LSQL.Add('      order by cod_forma ');
      dm.getMemTable(tbFormasPagamento, LSQL.Text);
    except
      on E: Exception do
      begin
        dm.exibe_painel_erro('Erro ao carregar formas de pagamento ', 'Ok');
        raise Exception.Create('Erro ao carregar formas de pagamento. ' + sLineBreak + sLineBreak + e.Message);
      end;
    end;
  finally
    FreeAndNil(LSQL);
  end;
end;

function Tdm.TrocaVirgPPto(Valor: string): string;
var
  i: Integer;
begin
  if Valor <> ' ' then
  begin
    for i := 0 to Length(Valor) do
    begin
      if Valor[i] = '.' then
      begin
        Valor[i] := ',';
      end
      else if Valor[i] = ',' then
      begin
        Valor[i] := '.';
      end;
    end;
  end;
  Result := Valor;
end;

function Tdm.TrocaPontoPVirgula(Valor: string): string;
//
// Troca a virgula pelo ponto em um valor Float
//
var
  i: Integer;
begin
  if Valor <> ' ' then
  begin
    for i := 0 to Length(Valor) do
    begin
      if Valor[i] = ',' then
      begin
        Valor[i] := '.';
      end
      else if Valor[i] = '.' then
      begin
        Valor[i] := ',';
      end;
    end;
  end;
  Result := Valor;
end;

function Tdm.removeVirgula(Text: string): string;
var
  n: Integer;
  total: Integer;
  contador: Integer;
  achou: Boolean;
  chars: array[1..10] of string;
begin
  total := 1;
  contador := 1;

  chars[1] := ',';
  while (contador <= total) do
  begin

    n := 1;
    while ((n <= Length(Text))) do//for n := 1 to length(Text) do
    begin
      if Copy(Text, n, 1) = chars[contador] then
      begin
        Delete(Text, n, 1);
        achou := True;
      end;
      n := n + 1;
    end;
    contador := contador + 1;
  end;

  Result := Text;
end;

function Tdm.removePonto(Text: string): string;
var
  n: Integer;
  total: Integer;
  contador: Integer;
  achou: Boolean;
  chars: array[1..10] of string;
begin
  total := 1;
  contador := 1;

  chars[1] := '.';
  while (contador <= total) do
  begin

    n := 1;
    while ((n <= Length(Text))) do//for n := 1 to length(Text) do
    begin
      if Copy(Text, n, 1) = chars[contador] then
      begin
        Delete(Text, n, 1);
        achou := True;
      end;
      n := n + 1;
    end;
    contador := contador + 1;
  end;

  Result := Text;
end;

function Tdm.DiferencaEntreHoras(Hora_Final: TTime; Hora_Inicial: TTime): string;
var
  A, M, H, M1, M2, H1, H2: Real;
  T1, T2: string;
label
  Passa;
begin
  A := 0;
  T1 := TimeToStr(Hora_Final);
  T2 := TimeToStr(Hora_Inicial);
  if (T1 <> '00:00:00') and (T2 <> '00:00:00') then
  begin
    M1 := StrToFloat(T1[4] + T1[5]);
    M2 := StrToFloat(T2[4] + T2[5]);
    if M1 = 0 then
    begin
      A := 1;
      M := 60 - M2;
      goto Passa;
    end;
    if M1 > M2 then
      M := M1 - M2
    else
      M := M2 - M1;
Passa:
    if M < 0 then
    begin
      M := 60 - M;
    end;
    if M > 60 then
    begin
      M := 60 - M;
    end;
    H1 := StrToFloat(T1[1] + T1[2]);
    H2 := StrToFloat(T2[1] + T2[2]);
    H := H1 - H2;
    if H1 <> H2 then
      H := H - A;
    Result := FloatToStr(H) + ':' + FloatToStr(M);
  end
  else
    Result := '00:00';
end;

function Tdm.maior(Tabela: string; Campo: string): Integer;
begin
  QryMax.Active := False;
  QryMax.SQL.Clear;
  QryMax.SQL.Add('Select max(' + Campo + ') as Maior from ' + Tabela);
  QryMax.Active := True;
  if QryMax.eof or (QryMax['Maior'] < 1) then
    Maior := 1
  else
    Maior := QryMax['Maior'] + 1;
  QryMax.Active := False;
end;

function Tdm.maiorOperacao(Tabela: string; Campo: string): Integer;
var
  qryMaxOp: TIBQuery;
begin

  qryMaxOp := TIBQuery.create(self);
  qryMaxOp.database := dbrestaurante;
  qryMaxOp.transaction := transLog;
  qryMaxOp.Active := False;
  qryMaxOp.sql.clear;

  qryMaxOp.SQL.Add('Select max(' + Campo + ') as Maior from ' + Tabela);
  qryMaxOp.Active := True;
  if qryMaxOp.eof or (qryMaxOp['Maior'] < 1) then
    MaiorOperacao := 1
  else
    maiorOperacao := qryMaxOp['Maior'] + 1;
  qryMaxOp.Active := False;
  FreeAndNil(qryMaxOp);
end;

function Tdm.cria_log_de_erros(origem_do_erro: TStrings; modulo_do_erro: string; descricao: string; usuario: string): Boolean;
begin
  ShowMessage('Ocorreu um erro no sistema!  Um log de erros foi criado no formato DATA+HORA na pasta logs do Sistema. Abra o arquivo e envio por fax ou email para a Real Sofwares');
  if FileExists(patchAplicacao + 'logs\log_erros' + FormatDateTime('DDMMYY', Date) + FormatDateTime('HHMM', Time)) then
  begin
    DeleteFile(patchAplicacao + 'logs\log_erros' + FormatDateTime('DDMMYY', Date) + FormatDateTime('HHMM', Time));
  end;
  origem_do_erro.Add('');
  origem_do_erro.Add('****************************************************');
  origem_do_erro.Add('Erro no módulo de : ' + modulo_do_erro);
  origem_do_erro.Add('Usuário ativo : ' + usuario);
  origem_do_erro.Add('Descrição:' + descricao);
  origem_do_erro.Add('****************************************************');
  origem_do_erro.AddStrings(origem_do_erro);
  origem_do_erro.SaveToFile(patchAplicacao + 'logs\log_erros' + FormatDateTime('DDMMYY', Date) + FormatDateTime('HHMM', Time) + '.err');
end;

function Tdm.MemoInterbase(Sender: TObject): string;
var
  sMemo: string;
  Ind: Integer;
begin
  sMemo := '';
  for Ind := 0 to (Sender as TMemo).Lines.Count - 1 do
  begin
    if Ind = 0 then
      sMemo := (Sender as TMemo).Lines[Ind]
    else
      sMemo := sMemo + '\r\n' + (Sender as TMemo).Lines[Ind];
  end;
  Result := sMemo;
end;

function Tdm.TestaCgc(xCGC: string): Boolean;
{Testa se o CGC é válido ou não}
var
  d1, d4, xx, nCount, fator, resto, digito1, digito2: Integer;
  Check: string;
begin
  d1 := 0;
  d4 := 0;
  xx := 1;
  for nCount := 1 to Length(xCGC) - 2 do
  begin
    if Pos(Copy(xCGC, nCount, 1), '/-.') = 0 then
    begin
      if xx < 5 then
      begin
        fator := 6 - xx;
      end
      else
      begin
        fator := 14 - xx;
      end;
      d1 := d1 + StrToInt(Copy(xCGC, nCount, 1)) * fator;
      if xx < 6 then
      begin
        fator := 7 - xx;
      end
      else
      begin
        fator := 15 - xx;
      end;
      d4 := d4 + StrToInt(Copy(xCGC, nCount, 1)) * fator;
      xx := xx + 1;
    end;
  end;
  resto := (d1 mod 11);
  if resto < 2 then
  begin
    digito1 := 0;
  end
  else
  begin
    digito1 := 11 - resto;
  end;
  d4 := d4 + 2 * digito1;
  resto := (d4 mod 11);
  if resto < 2 then
  begin
    digito2 := 0;
  end
  else
  begin
    digito2 := 11 - resto;
  end;
  Check := IntToStr(digito1) + IntToStr(digito2);
  if Check <> Copy(xCGC, Succ(Length(xCGC) - 2), 2) then
  begin
    Result := False;
  end
  else
  begin
    Result := True;
  end;
end;

function Tdm.VerificaConexaoInternet: Boolean;
var
  flags: DWORD;
begin

  result := InternetCheckConnection('http://www.google.com', 1, 0);

  if Result = False then
  begin
    //////dm.adicionalog('Sem conexão com a internet');
  end
  else
  begin
    //////dm.adicionalog('Conexão com a internet Ok');
  end;

end;

function Tdm.ImpDireita(Valor: string; const tamanho: Integer): string;
begin
  Result := Copy('                                                  ', 1, tamanho - Length(Valor)) + Valor;
end;

function Tdm.verifica_permissao(cod_modulo: string; cod_mod: string; usuario: string; mensagem: Boolean): Boolean;
begin

  try
    dm.getMemTable(memTbPermissoes, 'select coalesce(permite,0) as permite from permissoes where cod_modulo=' + QuotedStr(cod_modulo) + ' and cod_mod=' + QuotedStr(cod_mod) + ' and cod_usuario=' + QuotedStr(usuario));

    if ((memTbPermissoes.IsEmpty = False) and (memTbPermissoes.FieldByName('permite').Value = 1)) then
      Result := True
    else
    begin
      if mensagem = True then
      begin
        ShowRealDialog(frm_principal, tmAviso, 'Sem permissão', 'Você não tem permissão para acessar esta funcionalidade');
      end;
      Result := False;
    end;

  finally
    memTbPermissoes.Active := False;
  end;

end;

function Tdm.centralizar(S: string; Len: Byte): string;
var
  Str: string;
  L: Byte;
begin
  Str := '';
  if Len < Length(S) then
  begin
    Result := '';
    Exit;
  end;
  L := (Len - Length(S)) div 2;
  while L > 0 do
  begin
    Str := Str + ' ';
    Dec(L);
  end;
  for L := 1 to Length(S) do
  begin
    Str := Str + S[L];
  end;
  Result := Str;
end;

function Tdm.al_left(s: string; n: Integer): string;
begin
  Result := Format('%-' + IntToStr(n) + '.' + IntToStr(n) + 's', [s]);
end;

function Tdm.al_rigth(s: string; n: Integer): string;
begin
  Result := Format('%' + IntToStr(n) + '.' + IntToStr(n) + 's', [s]);
end;

function Tdm.LeIni(tipo: Integer; grupo: string; chave: string): string;
var
  ArqIni: TIniFile;
  I: integer;
begin

  ArqIni := TIniFile.Create(caminhoConfigs + 'config.Ini');

  case tipo of
    1:
      begin
        Result := IntToStr(ArqIni.ReadInteger(grupo, chave, 0));
      end;
    2:
      begin
        Result := ArqIni.ReadString(grupo, chave, '0');
      end;
  end;
  ArqIni.Free;
end;

function Tdm.verificaNotasContingencia(): Boolean;
begin
  dm.qryauxiliar.Active := False;
  dm.qryauxiliar.SQL.clear;
  dm.qryauxiliar.SQL.Add(' select * from vendas v where v.protocolo_nfce=' + QuotedStr('CONTINGENCIA'));
  dm.qryauxiliar.Active := True;

  if dm.qryauxiliar.IsEmpty then
    result := False
  else
    result := True;

end;

function Tdm.verificaNotasContingenciaNoCaixa(): Boolean;
begin
  dm.qryauxiliar.Active := False;
  dm.qryauxiliar.SQL.clear;
  dm.qryauxiliar.SQL.Add(' select * from vendas v where v.protocolo_nfce=' + QuotedStr('CONTINGENCIA') + ' and v.numero_caixa=' + QuotedStr(numero_caixa));
  dm.qryauxiliar.Active := True;

  if dm.qryauxiliar.IsEmpty then
    result := False
  else
    result := True;

end;

procedure Tdm.atualizaObservacoesProduto(idProduto: Integer; observacao: string);
begin
  dm.qryauxiliar.SQL.Clear;
  dm.qryauxiliar.SQL.Add('update movimento_mesa ms set ms.observacoes= ' + QuotedStr(BuscaTroca(Trim(observacao), LineBreak, '')));
  dm.qryauxiliar.SQL.Add(' where ms.id=' + IntToStr(idProduto));
  //////dm.adicionalog(dm.qryauxiliar.SQL.Text );
  dm.qryauxiliar.ExecSQL;

  dm.qryauxiliar.SQL.Clear;
  dm.qryauxiliar.SQL.Add('update fila_de_impressao ms set ms.observacoes=' + QuotedStr(BuscaTroca(Trim(observacao), LineBreak, '')));
  dm.qryauxiliar.SQL.Add(' where ms.ID_MOVIMENTO_MESA=' + IntToStr(idProduto));
  //////dm.adicionalog(dm.qryauxiliar.SQL.text);
  dm.qryauxiliar.ExecSQL;

  dm.transacao.Active := True;
  dm.transacao.Commit;

end;

function Tdm.LeIniImpressoes(tipo: Integer; grupo: string; chave: string): string;
var
  ArqIni: TIniFile;
  caminho: string;
begin
  ArqIni := TIniFile.Create(caminhoConfigs + 'configImpressoes.Ini');
  case tipo of
    1:
      begin
        Result := IntToStr(ArqIni.ReadInteger(grupo, chave, 0));
      end;
    2:
      begin
        Result := ArqIni.ReadString(grupo, chave, '0');
      end;
  end;
  ArqIni.Free;
end;

function Tdm.LeIniImpressoesDelivery(tipo: Integer; grupo: string; chave: string): string;
var
  ArqIni: TIniFile;
  caminho: string;
begin
  ArqIni := TIniFile.Create(caminhoConfigs + 'configImpressoes_delivery.Ini');
  case tipo of
    1:
      begin
        Result := IntToStr(ArqIni.ReadInteger(grupo, chave, 0));
      end;
    2:
      begin
        Result := ArqIni.ReadString(grupo, chave, '0');
      end;
  end;
  ArqIni.Free;
end;

procedure Tdm.gravaini(grupo: string; chave: string; valor: string);
var
  ArqIni: TIniFile;
begin
  ArqIni := TIniFile.Create(caminhoConfigs + 'config.Ini');
  try
    ArqIni.WriteString(grupo, chave, valor);
  finally
    ArqIni.Free;
  end;
end;

function Tdm.grava_arq_texto(nome_arq: string; texto: string): Boolean;
var
  F: TextFile;
begin
  try
    AssignFile(F, nome_arq);
  except
    begin
      ShowMessage('Erro ao tentar gravar no arquivo texto!');
      Result := False;
      Exit;
    end;
  end;

  if not FileExists(nome_arq) then
  begin
    Rewrite(F)
  end;
  try
    begin
      Append(F);
      Writeln(F, texto);
      CloseFile(F);
      Result := True;
    end;
  except
    begin
      ShowMessage('Erro ao gravar no arquivo de texto!');
      result := False;
    end;
  end;
end;

function Tdm.criptografa(str: string; chave: string): string;
begin
  Result := JvVigenereCipher1.EncodeString(chave, str);

end;

function Tdm.decriptografa(str: string; chave: string): string;
begin
  Result := JvVigenereCipher1.DecodeString(chave, str);
end;

function Tdm.procura_simbolo(palavra: string; simbolo: string): Integer;
var
  tamanho_string: Integer;
  cont: Integer;
  ini, fim: Integer;
  posicao: Integer;
  valor: string;
begin
  ini := 0;
  fim := 1;
  posicao := 0;
  cont := 0;
  tamanho_string := 0;
  tamanho_string := Length(palavra);
  while cont < tamanho_string do
  begin
    valor := Copy(palavra, ini, ini - 1);
    if valor = simbolo then
    begin
      posicao := ini;
    end
    else
    begin
      ini := ini + 1;
      fim := ini + 1;
    end;
    cont := cont + 1;
  end;
  Result := posicao;
end;

function Tdm.corretor_string(): string;
var
  i: Integer;
const
  Str = '1234567890ABCDEFGHIJKLMNOPQRSTUVWXYZ';
  Max = 6;
begin
  for i := 1 to Max do
  begin
    result := result + Str[Random(Length(Str)) + 1];
  end;
end;

function Tdm.FormataCNPJ(CNPJ: string): string;
begin
  Result := Copy(CNPJ, 1, 2) + '.' + Copy(CNPJ, 3, 3) + '.' + Copy(CNPJ, 6, 3) + '/' + Copy(CNPJ, 9, 4) + '-' + Copy(CNPJ, 13, 2);
end;

function Tdm.formatar_memo_sql(memo: TMemo): string;
var
  ct: Integer;
  str: string;
begin
  str := '''';
  for ct := 0 to memo.Lines.Count - 1 do
  begin
    str := str + ' ' + memo.Lines[ct];
  end;
  str := str + '''';
  result := str;

end;

function TDM.validarCredenciaisUsuario(AEmpresa: string; ACodigoUsuario: string; ASenha: string): boolean;
var
  LSQL: TStringList;
  LTbAux: TFDMemTable;
begin

  LTbAux := TFDMemTable.Create(Self);
  LSQL := TstringList.create;
  result := False;

  try
    try
      ACodigoUsuario := FormatFloat('000', StrToFloat(ACodigoUsuario));
      LSQL.Clear;
      LSQL.Add('select coalesce(u.senha,' + QuotedStr('1234') + ') as senha from usuarios u where u.cod_usuario=' + QuotedStr(ACodigoUsuario));
      dm.getMemTable(LTbAux, LSQL.Text);

      if LTbAux.FieldByName('senha').Value <> ASenha then
        Result := False
      else
      begin

        Result := true;
      end;
    except
      on E: Exception do
      begin
        exibe_painel_erro('Erro ao consultar credenciais!' + sLineBreak + sLineBreak + E.Message, 'Ok');
      end;

    end;
  finally
    FreeAndNil(LSQL);
    LTbAux.Active := false;
    FreeAndNil(LTbAux);
  end;
end;

procedure Tdm.DataModuleCreate(Sender: TObject);
var
  pastaConfig: string;
  I: integer;
begin

  GDadosAPIReplicacao := TDadosAPIReplicacao.Create;
  LImageServerParams := getImageServerParams();

  caminhoConfigs := ExtractFilePath(Application.ExeName);
  for I := 0 to ParamCount do
  begin
    if (Pos('/config', LowerCase(ParamStr(I))) = 1) then
    begin
      pastaConfig := Copy(ParamStr(I), 9, 600);
      caminhoConfigs := caminhoConfigs + pastaConfig + '\';
    end;
  end;

  Fmt := TFormatSettings.Create();
  LogStrings := TStringList.Create;

  LDesativaCapturaLogs := IntToBol(StrToInt(dm.LeIni(2, 'BANCO_DE_DADOS', 'DesativaCapturaDeLogs')));
  SetTabelaPrecoPadrao();
  cor_ao_entrar := clMoneyGreen;
  cor_ao_sair := clWhite;
  dbrestaurante.Connected := False;
  fdRestaurante.Connected := False;
  testouExpiracaoCertificadoEntrada := False;
  CriaDadosConexaoRest();
  CreateRealDAOExecute();
  CarregaDadosAPIReplicacao(GDadosAPIReplicacao);

end;

procedure Tdm.CarregaDadosAPIReplicacao(ADados: TDadosAPIReplicacao);
begin
  ADados.Servidor := dm.LeIni(2, 'CONFIG_API', 'servidor');
  ADados.Porta := dm.LeIni(2, 'CONFIG_API', 'porta');
  ADados.MerchantID := dm.LeIni(2, 'CONFIG_API', 'MerchantID');
  ADados.Token := dm.LeIni(2, 'CONFIG_API', 'Token');
  ADados.PermiteSincronizar := StrToBool(dm.LeIni(2, 'CONFIG_API', 'permiteSincronizar'));
end;

function TDm.GetDadosAPIReplicacao(): TDadosAPIReplicacao;
begin
  result := self.GDadosAPIReplicacao;
end;

procedure TDM.ConfigureRealConnectionDatabaseParams(AConnection: TRealConnection);
var
  LDatabaseServerAddress, LDatabaseServerPort, LDatabasePath, LDatabaseUsername, LDatabasePassword: string;
begin
  try
    try
      LDatabaseServerAddress := dm.LeIni(2, 'BANCO_DE_DADOS', 'servidor');
      LDatabaseServerPort := dm.LeIni(2, 'BANCO_DE_DADOS', 'porta');
      LDatabasePath := dm.LeIni(2, 'BANCO_DE_DADOS', 'local_bd');
      LDatabaseUsername := dm.LeIni(2, 'BANCO_DE_DADOS', 'usuario');
      LDatabasePassword := dm.LeIni(2, 'BANCO_DE_DADOS', 'senha');

      AConnection.Params.Clear;
      AConnection.Params.Add('DriverID=' + 'FB');
      AConnection.Params.Add('Server=' + LDatabaseServerAddress);
      AConnection.Params.Add('Port=' + LDatabaseServerPort);
      AConnection.Params.Add('Database=' + LDatabasePath);
      AConnection.Params.Add('User_Name=' + LDatabaseUsername);
      AConnection.Params.Add('Password=' + LDatabasePassword);
      AConnection.Params.Add('Protocol=TCPIP');

      AConnection.DriverName := 'FB';
      AConnection.LoginPrompt := FALSE;
      AConnection.UpdateOptions.CountUpdatedRecords := False;

    except
      on E: Exception do
      begin
        raise Exception.Create(E.Message);
      end;

    end;
  finally

  end;

end;

procedure TDM.ConfigureRealConnectionRESTParams(AConnection: TRealConnection);
begin
  try
    try
    {
      AConnection.Rest.DatabaseParams.Servidor := dm.LeIni(2, 'CONFIG_API', 'servidorBanco');
      AConnection.Rest.DatabaseParams.Porta := dm.LeIni(2, 'CONFIG_API', 'portaBanco');
      AConnection.Rest.DatabaseParams.LocalBanco := dm.LeIni(2, 'CONFIG_API', 'LocalBanco');
      AConnection.Rest.ServerParams.ServerAddress := dm.LeIni(2, 'CONFIG_API', 'servidor');
      AConnection.Rest.ServerParams.ServerPort := dm.LeIni(2, 'CONFIG_API', 'porta');
     }
    except
      on E: Exception do
      begin
        raise Exception.Create(E.Message);
      end;
    end;
  finally

  end;

end;

procedure TDM.CreateRealDAOExecute();
begin

  RealDaoExecute := TRealDAOExecute.Create;
//  RealDaoExecute.Connection := TRealConnection.Create(Self);

  try
    try
      ConfigureRealConnectionDatabaseParams(RealDaoExecute.Connection);
      ConfigureRealConnectionRESTParams(RealDaoExecute.Connection);
    except
      on E: Exception do
      begin
        raise Exception.Create(E.Message);
        RealDaoExecute.Connection.Free;
        RealDaoExecute.Free;
      end;
    end;
  finally

  end;
end;

procedure Tdm.CriaDadosConexaoRest();
var
  LServidor: string;
  LPorta: string;
begin
  IdSSLIOHandlerSocketOpenSSL1 := TIdSSLIOHandlerSocketOpenSSL.Create(nil);
  IdSSLIOHandlerSocketOpenSSL1.Name := 'IdSSLIOHandlerSocketOpenSSL1';
  IdSSLIOHandlerSocketOpenSSL1.MaxLineAction := maException;
  IdSSLIOHandlerSocketOpenSSL1.Port := 0;
  IdSSLIOHandlerSocketOpenSSL1.DefaultPort := 0;

  if (StrToInt(dm.LeIni(2, 'CONFIG_API', 'usarAPI')) = 1) then
  begin
    ConexaoRest := true;
    LServidor := dm.LeIni(2, 'CONFIG_API', 'servidor');
    LPorta := dm.LeIni(2, 'CONFIG_API', 'porta');
    URL_Base := 'http://' + LServidor + ':' + LPorta;
  end
  else
  begin
    conexaoRest := false;
  end;
end;

procedure Tdm.SetTabelaPrecoPadrao();
begin

  if (tabelaPrecoAtual <> nil) then
    FreeAndNil(tabelaPrecoAtual);
  tabelaPrecoAtual := TTabelaPreco.Create();
  tabelaPrecoAtual.codigo := 0;
  tabelaPrecoAtual.descricao := 'Tabela padrão';
  tabelaPrecoAtual.sigla := 'TBP';
end;

procedure Tdm.setTabelaPrecoAtual(Acodigo: Integer);
var
  ts: TIBTransaction;
  q: TIBQuery;
begin

  ts := TIBTransaction.Create(nil);
  ts.Params.Add('read_committed');
  ts.Params.Add('rec_version');
  ts.Params.Add('nowait');
  ts.DefaultDatabase := dm.dbrestaurante;
  ts.Active := False;
  ts.Active := True;

  q := TIBQuery.create(self);
  q.Database := dm.dbrestaurante;
  q.Transaction := ts;
  q.Active := False;
  q.SQL.Clear;

  try
    try
      q.Active := False;
      q.SQL.Clear;
      q.sql.Add('select codigo, descricao, prefixo from tabelas_preco p where p.codigo=' + IntToStr(Acodigo));
      q.Active := True;
      tabelaPrecoAtual.codigo := Acodigo;
      tabelaPrecoAtual.descricao := q.FieldByName('descricao').Value;
      tabelaPrecoAtual.sigla := q.FieldByName('prefixo').Value;
    except
      tabelaPrecoAtual.codigo := 0;
      tabelaPrecoAtual.descricao := 'Tabela padrão';
      tabelaPrecoAtual.sigla := 'TBP';
      ShowRealDialog(frm_principal, tmErro, 'Ocorreu  um erro', 'Erro ao setar a tabela de preços!');
    end;

  finally
    q.Active := False;
    FreeAndNil(q);

    ts.Active := False;
    FreeAndNil(ts);

  end;

end;

function Tdm.getTabelaPrecoAtual(): TTabelaPreco;
begin
  result := tabelaPrecoAtual;
end;

function Tdm.retorna_informacao(parametro: string; tabela: Integer; field: Integer): string;
begin
  dm.qry_consultas.Active := False;
  dm.qry_consultas.sql.clear;
  case tabela of
    1:
      begin        // 1 Cadastro de itens
        qry_consultas.sql.add('select * from itens_estoque where cod_item=' + QuotedStr(parametro));
      end;
    2:
      begin        // 2 cadastro de produtos

      end;
    3:
      begin       // 3 cadastro de unidades
        qry_consultas.sql.add('select un.cod_unidade,un.descricao,un.sigla,un.parametro,un.cod_padrao from unidades un where cod_unidade=' + QuotedStr(parametro));
      end;

    4:
      begin
        qry_consultas.sql.add('select * from grupos where cod_grupo=' + QuotedStr(parametro));
      end;

    5:
      begin
        qry_consultas.sql.add('select * from centros_de_custo where cod_c_custo=' + QuotedStr(parametro));
      end;

    6:
      begin
        qry_consultas.sql.add('select * from tipos_baixa where cod_tipo=' + QuotedStr(parametro));
      end;

    7:
      begin
        qry_consultas.sql.add('select * from usuarios where cod_usuario=' + QuotedStr(parametro));
      end;
    8:
      begin
        qry_consultas.SQL.add('select f.cod_forma,f.descricao,f.rp from formas_pagamento f where f.descricao=' + QuotedStr(parametro));
      end;
  end;

  qry_consultas.Active := True;
  if not dm.qry_consultas.IsEmpty then
    Result := qry_consultas.Fields[field].AsString
  else
    Result := 'EMPTY';
end;

procedure Tdm.recriarTabelasDePreco();
var
  LSQL: TStringList;
begin

  LSQL := TstringList.create;

  try
    try
      LSQL.Add('  execute procedure recriar_tabelas_preco');
      executaSQL(LSQL.Text);
    except
      on E: Exception do
      begin
        dm.exibe_painel_erro('Erro ao ', 'Ok');
        raise Exception.Create('Erro ao realizar operação');
      end;
    end;
  finally
    FreeAndNil(LSQL);

  end;
end;

function Tdm.abre_porta_imp_NF(marca: Integer; modelo: Integer; porta: string): string;
var
  ret: Integer;
begin
  Result := 'OK';
  case marca of
    1:
      begin
        porta := porta + #0;
//         comport.Port:=porta;
        case modelo of

          1:
            begin

              try
//               comport.Open;
              except
                begin
                  ShowMessage('Erro abrindo a porta ' + porta);
                  Exit;
                end;
              end;

              result := 'OK';
            end;
        end;
      end;
    2:
      begin
        porta := porta + #0;
        case modelo of

          1:
            begin
//               comport.Port:=porta;
  //             comport.Open;
              result := 'OK';
            end;
        end;
      end;

    3:
      begin
        try
          begin
//           comport.Port:=porta;
  //         comport.Open;
            result := 'OK';
          end
        except
          result := 'Erro ao abrir a porta serial. Verifique a conexão dos cabos e tente novamente';
        end;
      end;
    4:
      begin
        case modelo of
          1:
            begin    // Térmica TM-T88II
              try
                begin

//                      comport.Port:=porta;
  //                    comport.Open;
    //                  result:='OK';
                end
              except
                result := 'Erro ao abrir a porta serial. Verifique a conexão dos cabos e tente novamente';
              end;

            end;

        end;

      end;

    5:
      begin  // Epson
        case modelo of
          1:
            begin    // Térmica TM-T88II
              try
                begin

//                      comport.Port:=porta;
//                      comport.Open;
                  result := 'OK';
                end
              except
                result := 'Erro ao abrir a porta serial. Verifique a conexão dos cabos e tente novamente';
              end;

         {         result:= analisa_retorno_nfiscal(marca,modelo,Inttostr(controladorEpson.Open(porta)));
                  if (result ='OK') then
                     result:= analisa_retorno_nfiscal(marca,modelo,Inttostr(controladorEpson.ClaimDevice(1000)));
                     if (Result = 'OK') then
                       controladorEpson.DeviceEnabled:=true;
                       }
            end;

        end;

      end;
  end;

end;

function Tdm.getXMLNFEDestinada(AChaveNFE: string): string;
var
  LSQL: TStringList;
  LTB: TFDMemTable;
begin
  LSQL := TStringList.Create;
  LTB := TFDMemTable.Create(self);
  Result := '';

  try
    try
      LSQL.Clear;
      LSQL.add('  select  cast(nf.xml_nota as blob sub_type text character set utf8) as xml ');
      LSQL.add('  from nfe_destinadas nf    where nf.chave_nfe =' + QuotedStr(AChaveNFE));
      getMemTable(LTB, LSQL.Text);
      Result := trim(LTB.FieldByName('xml').Value);
    except
      on E: Exception do
      begin
        exibe_painel_erro('Erro ao buscar XML do documento!', 'Ok');
      end;
    end;
  finally
    FreeAndNil(LSQL);
    LTB.Active := false;
    FreeAndNil(LTB);
  end;
end;

function Tdm.configuraACBRMail: boolean;
var
  LSQL: TStringList;
  LTB: TFDMemTable;
begin

  LSQL := TStringList.Create;
  LTB := TFDMemTable.Create(Self);

  try
    try
      LSQL.Clear;
      LSQL.Add('select * from parametros_email');
      getMemTable(LTB, LSQL.Text);

      if LTB.IsEmpty = false then
      begin
        ACBrMail1.Clear;

        ACBrMail1.Host := LTB.FieldByName('SMTP_SERVER').Value;
        ACBrMail1.Username := LTB.FieldByName('USUARIO').Value;
        ACBrMail1.From := LTB.FieldByName('USUARIO').Value;
        ACBrMail1.FromName := nome_fantasia;
        ACBrMail1.Password := LTB.FieldByName('SENHA').Value;
        ACBrMail1.Port := LTB.FieldByName('PORTA').Value;
        ACBrMail1.IsHTML := StrToBool(IntToStr(LTB.FieldByName('HTML').Value));
        ACBrMail1.IsHTML := StrToBool(IntToStr(LTB.FieldByName('HTML').Value));
        ACBrMail1.SetSSL := StrToBool(IntToStr(LTB.FieldByName('SSL').Value));
        ACBrMail1.SetTLS := StrToBool(IntToStr(LTB.FieldByName('TLS').Value));
        ACBrMail1.TimeOut := LTB.FieldByName('timeout').Value;
        ACBrMail1.DeliveryConfirmation := StrToBool(IntToStr(LTB.FieldByName('CONFIRMACAO_LEITURA').Value));
      end
      else
      begin
        exibe_painel_erro('Parâmetros de email ainda não foram definidos!', 'Ok');
      end;

    except
      on E: Exception do
      begin
        exibe_painel_erro('Erro ao configurar componente de E-mail' + sLineBreak + sLineBreak + E.Message, 'Ok');
      end;
    end;
  finally
    FreeAndNil(LSQL);
    FreeAndNil(LTB);
  end;
end;

function Tdm.getMensagemEmailNFE: string;
var
  LSQL: TStringList;
  LTB: TFDMemTable;
begin

  LSQL := TStringList.Create;
  LTB := TFDMemTable.Create(Self);

  try
    try
      LSQL.Clear;
      LSQL.Add('select * from parametros_email');
      getMemTable(LTB, LSQL.Text);

      if LTB.IsEmpty = false then
      begin
        Result := LTB.FieldByName('TXT_NFE').Value;

      end
      else
      begin
        exibe_painel_erro('Parâmetros de email ainda não foram definidos!', 'Ok');
      end;

    except
      on E: Exception do
      begin
        exibe_painel_erro('Erro ao configurar componente de E-mail' + sLineBreak + sLineBreak + E.Message, 'Ok');
      end;
    end;
  finally
    FreeAndNil(LSQL);
    FreeAndNil(LTB);
  end;

end;

procedure Tdm.ACBrTEFD1AntesFinalizarRequisicao(Req: TACBrTEFDReq);
begin

  if ((dm.getEstadoSimuladoECF = tpsVenda) or (dm.getEstadoSimuladoECF = tpsPagamento)) then
  begin
    case tipoOperacaoTEF of
      1:
        begin // venda a crédito
          Req.GravaInformacao(730, 000, '1'); // Tipo da operação = Venda
          Req.GravaInformacao(731, 000, '1'); // Tipo do Cartão =Credito
          Req.GravaInformacao(732, 000, '1'); // Tipo = A vista
        end;

      2:
        begin    // Venda a débito
          Req.GravaInformacao(730, 000, '1');
          Req.GravaInformacao(731, 000, '2');  // Tipo cartão = Débito
          Req.GravaInformacao(732, 000, '1');
        end;

      3:
        begin
          Req.GravaInformacao(730, 000, '1');
          Req.GravaInformacao(731, 000, '3');
          Req.GravaInformacao(732, 000, '1');
        end;

      4:
        begin
          Req.GravaInformacao(730, 000, '1');
          Req.GravaInformacao(731, 000, '1');
          Req.GravaInformacao(732, 000, '1');
        end;

      5:
        begin
          Req.GravaInformacao(010, 000, 'CERTIF');
          Req.GravaInformacao(730, 000, '1');
          Req.GravaInformacao(731, 000, '1');
          Req.GravaInformacao(732, 000, '1');
        end;

        //pix shipay
        6:
        begin
          Req.GravaInformacao(730, 000, '1');
          Req.GravaInformacao(731, 000, '5');
          Req.GravaInformacao(732, 000, '1');
        end;

    end;
  end;

end;

procedure Tdm.ACBrTEFD1ComandaECF(Operacao: TACBrTEFDOperacaoECF; Resp: TACBrTEFDResp; var RetornoECF: Integer);
begin
  try
    case Operacao of
      opeAbreGerencial:
        begin

        end;

       //  MemoCupomTEF.Lines.Add('Abre Gerencial') {ACBrECF1.AbreRelatorioGerencial} ;

      opeFechaCupom:
        begin
          estadoSimuladoEcf := tpsLivre;
        end;

      opeSubTotalizaCupom:
        begin
        // MemoCupomTEF.Lines.Add('Sub Totaliza');
        end;

      opeFechaGerencial, opeFechaVinculado:
        estadoSimuladoEcf := tpsRelatorio;

      opePulaLinhas:
        begin
       //   MemoCupomTEF.Lines.Add('PulaLinhas');
          Sleep(200);
        end;

      opeImprimePagamentos:
        begin
         // MemoCupomTEF.Lines.Add('ImprimePagamentos');
        end;
    end;
    RetornoECF := 1;
  except
    RetornoECF := 0;
  end;

end;

procedure Tdm.ACBrTEFD1ComandaECFAbreVinculado(COO, IndiceECF: string; Valor: Double; var RetornoECF: Integer);
begin
  RetornoECF := 1;
end;

procedure Tdm.ACBrTEFD1ComandaECFImprimeVia(TipoRelatorio: TACBrTEFDTipoRelatorio; Via: Integer; ImagemComprovante: TStringList; var RetornoECF: Integer);
begin

  //////dm.adicionalogTEF('Iniciou a impressão da via ' + IntToStr(Via));

  case TipoRelatorio of
    trGerencial:
      begin
        if FileExists(caminhoArquivoExtrato) then
          DeleteFile(caminhoArquivoExtrato);
        ImagemComprovante.Add(sLineBreak + sLineBreak + sLineBreak);
        dm.adicionaLinhaArquivoExtrato(ImagemComprovante.Text);
      //adicionaLinhaArquivoExtrato('</corte_parcial>');
        //////dm.adicionalogTEF('COMPROVANTE TEF GERENCIAL:' + ImagemComprovante.Text);
      end;
    trVinculado:
      begin
        if FileExists(caminhoArquivoExtrato) then
          DeleteFile(caminhoArquivoExtrato);
        ImagemComprovante.Add(sLineBreak + sLineBreak + sLineBreak);
        dm.adicionaLinhaArquivoExtrato(ImagemComprovante.Text);
      //adicionaLinhaArquivoExtrato('</corte_parcial>');
        //////dm.adicionalogTEF('COMP TEF VINCULADO:' + ImagemComprovante.Text);
      end;

  end;

  //////dm.adicionalogTEF(' Vai mandar imrpimir na impressora a via ' + IntToStr(Via));
  ACBrPosPrinter1.LinhasEntreCupons := StrToInt(dm.LeIni(1, 'IMPRESSORA_NAO_FISCAL_01', 'linhasAposCupom'));
  frm_principal.memo_avisos.Lines.Clear;
  frm_principal.memo_avisos.Lines.LoadFromFile(caminhoArquivoExtrato);
  dm.imprimeTextoMiniPrinter(frm_principal.memo_avisos.Lines.Text);
  RetornoECF := 1;

  //////dm.adicionalogTEF('Finalizou a impressão da via ' + IntToStr(Via));

end;

procedure Tdm.ACBrTEFD1ComandaECFPagamento(IndiceECF: string; Valor: Double; var RetornoECF: Integer);
begin
  RetornoECF := 1;
end;

procedure Tdm.ACBrTEFD1ComandaECFSubtotaliza(DescAcre: Double; var RetornoECF: Integer);
begin
  estadoSimuladoEcf := tpsPagamento;
  RetornoECF := 1;

end;

procedure Tdm.setMensagemOperadorTEF(mensagem: string);
begin

  if operacaoADMTEF = False then
  begin
    frm_encerramento.setMensagemOperador(mensagem);
  end
  else
  begin
    frmOperacoesDeCaixa.setMensagemOperador(mensagem);
  end;
end;

function Tdm.getMensagemOperadorTEF(): string;
begin
  if operacaoADMTEF = False then
  begin
    result := frm_encerramento.getMensagemOperador;

  end
  else
  begin
    Result := frmOperacoesDeCaixa.getMensagemOperador;
  end;
end;

procedure Tdm.ACBrTEFD1ExibeMsg(Operacao: TACBrTEFDOperacaoMensagem; Mensagem: string; var AModalResult: TModalResult);
var
  Fim: TDateTime;
  OldMensagem: string;
begin
//  StatusBar1.Panels[1].Text := '' ;
//  StatusBar1.Panels[2].Text := '' ;

  case Operacao of

    opmOK:
      setMensagemOperadorTEF(Mensagem);
       //AModalResult := MessageDlg( Mensagem, mtInformation, [mbOK], 0);

    opmYesNo:
      AModalResult := MessageDlg(Mensagem, mtConfirmation, [mbYes, mbNo], 0);

    opmExibirMsgOperador, opmRemoverMsgOperador:
      setMensagemOperadorTEF(Mensagem);

    opmExibirMsgCliente, opmRemoverMsgCliente:
      setMensagemOperadorTEF(Mensagem);

//    opmDestaqueVia :         setMensagemOperadorTEF (mensagem);
    {
       begin
       {
         OldMensagem :=         getMensagemOperadorTEF ();
         try
          setMensagemOperadorTEF (mensagem);


            Fim := IncSecond( now, 3)  ;
            repeat
               sleep(700) ;
                        setMensagemOperadorTEF(mensagem + ' ' + IntToStr(SecondsBetween(Fim,now)));
               Application.ProcessMessages;
            until (now > Fim) ;

         finally
                    setMensagemOperadorTEF(OldMensagem);
         end;

         }
//       end;

  end;

//  Application.ProcessMessages;
end;

procedure Tdm.ACBrTEFD1GravarLog(const GP: TACBrTEFDTipo; ALogLine: string; var Tratado: Boolean);
begin
  //////dm.adicionalog('Log do TEF: ' + ALogLine);
end;

procedure Tdm.ACBrTEFD1InfoECF(Operacao: TACBrTEFDInfoECF; var RetornoECF: string);
var
  ASubTotal: Double;
begin
  case Operacao of
    ineSubTotal:
      begin
        ASubTotal := StringToFloatDef(FloatToStr(frm_encerramento.gettotalVenda), 0);
         //ASubTotal := ASubTotal - StringToFloatDef(EditTotalPago.Text, 0){ + Tratar Desconto e Acrescimo aqui: StringToFloatDef(edValorDescAcre.Text, 0)};
        RetornoECF := FloatToStr(ASubTotal);
        if estadoSimuladoEcf = tpsPagamento then
          RetornoECF := FloatToStr(0);
      end;

    ineTotalAPagar:
      RetornoECF := '0';

    ineEstadoECF:
      begin
        case estadoSimuladoEcf of
          tpsLivre:
            RetornoECF := 'L';
          tpsVenda:
            RetornoECF := 'V';
          tpsPagamento:
            RetornoECF := 'P';
          tpsRelatorio:
            RetornoECF := 'R';
        else
          RetornoECF := 'O';
        end;
      end;
  end;

end;

function Tdm.fecha_porta_imp_NF(marca: Integer; modelo: Integer; porta: string): string;
begin
  case marca of
    1:
      begin
        case modelo of
          1:
            begin

            end;

          2:
            begin

            end;
        end;
      end;
    2:
      begin

      end;
    3:
      begin

      end;
    4:
      begin

      end;

    5:
      begin  // Epson
        case modelo of
          1:
            begin    // Térmica TM-T88II
              try
                begin

//                      comport.Port:=porta;
  //                    comport.Open;
                  result := 'OK';
                end
              except
                result := 'Erro ao abrir a porta serial. Verifique a conexão dos cabos e tente novamente';
              end;


{                  controladorEpson.DeviceEnabled:=false;
                  result:= analisa_retorno_nfiscal(marca,modelo,Inttostr(controladorEpson.ReleaseDevice));
                  result:= analisa_retorno_nfiscal(marca,modelo,Inttostr(controladorEpson.Close));
 }

            end;

        end;

      end;
  end;
end;

function Tdm.formatacao_Epson(negrito: Boolean; italico: Boolean; sublinhado: Boolean; tam: Boolean; comprimido: Boolean; largura: Boolean; altura: Boolean): string;
var
  formato: string;
begin

  formato := Chr(27) + Chr(64);

  if (negrito = True) then
    formato := formato + Chr(13) + Chr(10) + Chr(27) + Chr(69);

  if sublinhado = True then
//   formato:=formato+chr(27)+'-'+'1';

    if tam then
    begin
      formato := formato + Chr(13) + Chr(10) + Chr(27) + Chr(77) + Chr(48);
      formato := formato + Chr(13) + Chr(10) + Chr(29) + Chr(33) + Chr(16);
    end
    else
    begin
      formato := formato + Chr(13) + Chr(10) + Chr(27) + Chr(77) + Chr(48);
      formato := formato + Chr(13) + Chr(10) + Chr(29) + Chr(0) + Chr(16);
    end;

  Result := formato;
end;

function Tdm.formatacao_daruma(negrito: Boolean; italico: Boolean; sublinhado: Boolean; tam: Boolean; comprimido: Boolean; largura: Boolean; altura: Boolean): string;
var
  formato: string;
begin

  if (negrito = True) then
    result := result + '<b>';

  if italico = True then
    result := result + '<i>';

  if sublinhado = True then
    result := result + '<s>';

  if tam = True then
    result := result + '<n>';

  if comprimido = True then
    result := result + '<c>';

  if altura then
    result := result + '<e>';

end;

function Tdm.formatacaoACBRInicial(negrito: Boolean; italico: Boolean; sublinhado: Boolean; tam: Boolean; comprimido: Boolean; largura: Boolean; altura: Boolean): string;
var
  formato: string;
begin
 //formato:=chr(27)+'@';
  if (negrito = True) then
    formato := formato + '<N>';

  if sublinhado = True then
    formato := formato + '<S>';

  if tam then
  begin
    formato := formato + '<E>';
  end;
  Result := formato;
end;

function Tdm.formatacaoACBRFinal(negrito: Boolean; italico: Boolean; sublinhado: Boolean; tam: Boolean; comprimido: Boolean; largura: Boolean; altura: Boolean): string;
var
  formato: string;
begin
  formato := '';

  if (negrito = True) then
    formato := formato + '</N>';

  if sublinhado = True then
    formato := formato + '</S>';

  if tam then
  begin
    formato := formato + '</E>';
  end;
  Result := formato;
end;

function Tdm.formatacaoBematech(negrito: Boolean; italico: Boolean; sublinhado: Boolean; tam: Boolean; comprimido: Boolean; largura: Boolean; altura: Boolean): string;
var
  formato: string;
begin


//formato:=chr(27)+'@';

  if (negrito = True) then
    formato := formato + Chr(27) + 'E';

  if sublinhado = True then
    formato := formato + Chr(27) + '-' + '1';

  if tam then
  begin
    formato := formato + Chr(27) + 'W1';
  end;
  Result := formato;
end;

function Tdm.formatacaoElginXprint(negrito: Boolean; italico: Boolean; sublinhado: Boolean; tam: Boolean; comprimido: Boolean; largura: Boolean; altura: Boolean): string;
var
  formato: string;
begin

  formato := Chr(27) + '@';

  if (negrito = True) then
    formato := formato + Chr(27) + 'W';

  if tam then
  begin
    formato := formato + Chr(27) + 'W0';
  end;
  Result := formato;
end;

function Tdm.formatacaoElginI9(negrito: Boolean; italico: Boolean; sublinhado: Boolean; tam: Boolean; comprimido: Boolean; largura: Boolean; altura: Boolean): string;
var
  formato: string;
begin

  formato := Chr(27) + '@';

  if (negrito = True) then
    formato := Chr(27) + Chr(33) + ' ';

  if tam then
  begin
//   formato:=formato+chr(27)+ 'W0';
  end;
  Result := formato;
end;

function Tdm.formatacaoBematechFinal(negrito: Boolean; italico: Boolean; sublinhado: Boolean; tam: Boolean; comprimido: Boolean; largura: Boolean; altura: Boolean): string;
var
  formato: string;
begin
  formato := '';
  if (negrito = True) then
    formato := formato + Chr(27) + 'F';

  if sublinhado = True then
    formato := formato + Chr(27) + '-' + '0';

  if tam then
  begin
    formato := formato + Chr(27) + 'W0';
  end;
  Result := formato;
end;

function Tdm.formatacaoDarumaNova(negrito: Boolean; italico: Boolean; sublinhado: Boolean; tam: Boolean; comprimido: Boolean; largura: Boolean; altura: Boolean): string;
var
  formato: string;
begin
// if comprimido=true then
//   formato:=formato+chr(30);


  if (negrito = True) then
    formato := formato + Chr(27) + 'E1';

  if italico = True then
    formato := formato + Chr(27) + '4';

  if sublinhado = True then
    formato := formato + Chr(27) + '-1';

  if tam then
  begin
    formato := formato + Chr(27) + 'W1';
  end;
  Result := formato;
end;

function Tdm.formatacaoDarumaNovaFinal(negrito: Boolean; italico: Boolean; sublinhado: Boolean; tam: Boolean; comprimido: Boolean; largura: Boolean; altura: Boolean): string;
var
  formato: string;
begin
  formato := '';
  if (negrito = True) then
    formato := formato + Chr(27) + 'E0';

  if sublinhado = True then
    formato := formato + Chr(27) + '-' + '0';

// if comprimido=true then
//   formato:=formato+chr(27)+'P';

  if tam then
  begin
    formato := formato + Chr(27) + 'W' + '0';
  end;

  Result := formato;
end;








// fim nova daruma

function Tdm.formatacao_daruma_final(negrito: Boolean; italico: Boolean; sublinhado: Boolean; tam: Boolean; comprimido: Boolean; largura: Boolean; altura: Boolean): string;
var
  formato: string;
begin

  if negrito then
    formato := formato + '</b>';

  if italico then
    formato := formato + '</i>';

  if sublinhado then
    formato := formato + '</s>';

  if tam then
    formato := formato + '</n>';

  if comprimido then
    formato := formato + '</c>';

  if altura then
    formato := formato + '</e>';

  Result := formato;

end;

function Tdm.imprime_linha_impNF(marca: Integer; modelo: Integer; linha: WideString; negrito: Boolean; italico: Boolean; sublinhado: Boolean; tam: Boolean; comprimido: Boolean; largura: Boolean; altura: Boolean): string;
var
  formato: Integer;
  dummy: Integer;
  tipoletraBmt, italicoBmt, sublinhadoBmt, expBmt, negritoBmt: Integer;
begin
  case marca of
    1:
      begin
        if comprimido = True then
          tipoletraBmt := 1
        else
          tipoletraBmt := 3;
        if italico = True then
          italicoBmt := 1
        else
          italicoBmt := 0;
        if sublinhado = True then
          sublinhadoBmt := 1
        else
          sublinhadoBmt := 0;
        if largura = True then
          expBmt := 1
        else
          expBmt := 0;
        if negrito = True then
          negritoBmt := 1
        else
          negritoBmt := 0;

        case modelo of
          1:
            begin

           //    FormataTX(linha+Chr(13)+Chr(10),tipoletraBmt,italicoBmt,sublinhadoBmt,expBmt,negritoBmt);
              result := 'OK';
            end;
          2:
            begin
             //  FormataTX(linha+Chr(13)+Chr(10),tipoletraBmt,italicoBmt,sublinhadoBmt,expBmt,negritoBmt);
              result := 'OK';
            end;

        end;

      end;

    2:
      begin
        case modelo of
          1:
            begin
              linha := formatacao_daruma(negrito, italico, sublinhado, tam, comprimido, largura, altura) + linha;
              linha := linha + formatacao_daruma_final(negrito, italico, sublinhado, tam, comprimido, largura, altura);
//               Daruma_DUAL_ImprimirTexto(linha,0);

            end;

          2:
            begin
              linha := formatacao_daruma(negrito, italico, sublinhado, tam, comprimido, largura, altura) + linha;
              linha := linha + formatacao_daruma_final(negrito, italico, sublinhado, tam, comprimido, largura, altura);
//               Daruma_DUAL_ImprimirTexto(linha,0);

            end;

        end;

      end;
    3:
      begin

      end;
    4:
      begin
        case modelo of
          1:
            begin
//                formato:=formatacao_epson(negrito,italico,sublinhado,tam,comprimido,largura,altura);
              linha := trocaCaracteresEpson(linha);
              linha := Chr(27) + '!' + Chr(formato) + linha + Chr(13) + Chr(10);
//                comport.writestr(linha);

            end;
        end;

      end;

    5:
      begin  // Epson
//         formato:=formatacao_epson(negrito,italico,sublinhado,tam,comprimido,largura,altura);
        linha := trocaCaracteresEpson(linha);
        linha := Chr(27) + '!' + Chr(formato) + linha + Chr(13) + Chr(10);

        case modelo of
          1:
            begin    // Térmica TM-T88II
//                  Result:=analisa_retorno_fiscal(marca,modelo,IntToStr(controladorEpson.DirectIO(PTR_DI_OUTPUT_NORMAL,dummy,linha)));
//                comport.writestr(linha);
            end;

        end;

      end;
  end;
end;

procedure Tdm.apagaNotaCarregadaACBRdaTabelaDeErros();
var
  ts: TIBTransaction;
  qryApagaNotas: TIBQuery;
  modelo: SmallInt;
begin
  ts := TIBTransaction.Create(self);
  ts.DefaultDatabase := dm.dbrestaurante;
  ts.Active := False;
  ts.Active := True;

  qryApagaNotas := TIBQuery.Create(Self);
  qryApagaNotas.Database := dbrestaurante;
  qryApagaNotas.Transaction := ts;
  qryApagaNotas.Active := False;

  try
    qryApagaNotas.SQL.Clear;
    qryApagaNotas.SQL.Add('delete from nfce_emitidas nf where chave=' + QuotedStr(Copy(dm.ACBrNFe1.NotasFiscais[0].NFe.infNFe.ID, 4, 60)));
    qryApagaNotas.ExecSQL;
    ////////dm.adicionalog(qryApagaNotas.SQL.Text);
    adicionaLog('apagou  a nota ' + Copy(dm.ACBrNFe1.NotasFiscais[0].NFe.infNFe.ID, 4, 60) + ' da tabela de erros');
    ts.Commit;

  finally
    ts.Active := False;
    FreeAndNil(ts);
    qryApagaNotas.Active := False;
    FreeAndNil(qryApagaNotas);

  end;

end;

procedure Tdm.setCodEmpresa(ACodEmpresa: string);
begin
  codEmpresa := ACodEmpresa;
  dm.tb_parametros.Active := False;
  dm.tb_parametros.Filtered := False;
  dm.tb_parametros.Active := true;
  dm.tb_parametros.Filtered := true;
  dm.tb_parametros.Filter := 'cod_empresa=' + Quotedstr(ACodEmpresa);
  dm.tb_parametros.Refresh;
end;

procedure Tdm.atualizaStatusCancelamentoNFE();
var
  codigo_venda: string;
  modelo: SmallInt;
  qryApagaNotas: TIBQuery;
begin
  if dm.ACBrNFe1.NotasFiscais[0].NFe.Ide.modelo = 65 then
    modelo := 2
  else
    modelo := 3;

  transLog.Active := True;

  try

    try
      codigo_venda := dm.geraCodigo('G_VENDAS', 8);
      transLog.Active := True;
      qryVendasCanceladas.Active := True;
      qryVendasCanceladas.Append;
      qryVendasCanceladasCOD_VENDA.Value := codigo_venda;
      qryVendasCanceladasCOD_EMPRESA.value := codEmpresa;
      qryVendasCanceladasDATA.Value := dm.ACBrNFe1.NotasFiscais[0].NFe.Ide.dEmi;
      qryVendasCanceladasDATA_SO.Value := dm.ACBrNFe1.NotasFiscais[0].NFe.Ide.dEmi;
      qryVendasCanceladasMODELO_COMPROVANTE.Value := modelo;
      qryVendasCanceladasSERIE_NFCE.Value := dm.ACBrNFe1.NotasFiscais[0].NFe.Ide.serie;
      qryVendasCanceladasNUMERO_NFCE.Value := dm.ACBrNFe1.NotasFiscais[0].NFe.Ide.nNF;
      qryVendasCanceladasCHAVE_NFCE.Value := Copy(dm.ACBrNFe1.NotasFiscais[0].NFe.infNFe.ID, 4, 60);
      qryVendasCanceladasXML_DOC.Value := dm.ACBrNFe1.NotasFiscais[0].Xml;
      qryVendasCanceladasVALOR_TOTAL.Value := dm.ACBrNFe1.NotasFiscais[0].NFe.Total.ICMSTot.vNF;
      qryVendasCanceladas.Post;
      adicionaLog('Inseriu a nota ' + Copy(dm.ACBrNFe1.NotasFiscais[0].NFe.infNFe.ID, 4, 60) + ' nas vendas canceladas');
      dm.transLog.Commit;
      apagaNotaCarregadaACBRdaTabelaDeErros();
    except
      on E: Exception do
      begin
        dm.transLog.Rollback;
        //////dm.adicionalog('Ocorreu erro ao incluir a nota nas vendas canceladas ' + E.Message);
      end;

    end;

  finally

    qryApagaNotas.Active := False;
    FreeAndNil(qryApagaNotas);
  end;
end;

procedure Tdm.ExecutaBlocoDeInstrucoes(AListaSQL: TList<string>; AQtdBlocos: smallint);
var
  LBloco: TStringList;
  ctLinhas: Integer;
  ts: TFDTransaction;
  q: TFDQuery;
  LFormatoBlocoInstrucoes: string;
  ct: integer;
  LStrSize: integer;
begin

  ts := TFDTransaction.Create(Self);
  ts.Connection := fdRestaurante;
  q := TFDQuery.Create(Self);
  q.Connection := dm.fdRestaurante;
  q.Transaction := ts;
  LBloco := TStringList.Create();
  LStrSize := 0;

  LBloco.Clear;
  LFormatoBlocoInstrucoes := 'execute block' + ' as' + ' begin' + '  :vpBlocoInstrucoes' + 'end';

  try

    try
      ts.StartTransaction;

      for ct := 0 to AListaSQL.Count - 1 do
      begin
        LBloco.Add(AListaSQL.Items[ct]);
        LStrSize := ((Length(LBloco.Text) * SizeOf(Char)) div 1024);

        if ((LBloco.Count >= AQtdBlocos) or (LStrSize >= 48)) then
        begin
          q.SQL.Clear;

          q.SQL.Add(LFormatoBlocoInstrucoes);
          q.SQL.Text := StringReplace(q.SQL.Text, ':vpBlocoInstrucoes', LBloco.Text, [rfReplaceAll]);
          dm.adicionalog(q.SQL.Text);
          q.ExecSQL;
          LBloco.Clear;

        end
        else
        begin

        end;
      end;

      if LBloco.Count > 0 then
      begin
        //////dm.adicionalog('Tenta executar b  loco - Tamanho do buffer ' + Inttostr(LStrSize) + 'Kbytes');
        LStrSize := ((Length(LBloco.Text) * SizeOf(Char)) div 1024);
        q.SQL.Clear;
        q.SQL.Add(LFormatoBlocoInstrucoes);
        q.SQL.Text := StringReplace(q.SQL.Text, ':vpBlocoInstrucoes', LBloco.Text, [rfReplaceAll]);
        dm.adicionalog(q.SQL.Text);
        q.ExecSQL;
        //////dm.adicionalog('Bloco executado com sucesso!');

      end;

      //////dm.adicionalog('Tenta fazer commit das alterações');
      ts.Commit;
      //////dm.adicionalog('Fez commit');
    except
      on E: Exception do
      begin
        ts.Rollback;
        dm.adicionalog('Erro ao executar bloco de instruções. ' + sLineBreak + sLineBreak + 'Erro: ' + E.Message);
        dm.adicionalog(q.SQL.Text);
        dm.exibe_painel_erro('Erro ao executar bloco de instruções ExecuteBlock', 'Ok');
        raise Exception.Create('Erro ao executar bloco de instruções. ' + sLineBreak + sLineBreak + 'Erro: ' + E.Message);
      end;

    end;

  finally
    FreeAndNil(LBloco);
    FreeAndNil(ts);
  end;
end;

procedure Tdm.ExecutaBlocoDeInstrucoesTransacao(AListaSQL: TList<string>; AQtdBlocos: smallint; ts: TFDtransaction);
var
  LBloco: TStringList;
  ctLinhas: Integer;
  q: TFDQuery;
  LFormatoBlocoInstrucoes: string;
  ct: integer;
  LStrSize: integer;
begin
  q := TFDQuery.Create(Self);
  q.Connection := dm.fdRestaurante;
  q.Transaction := ts;
  LBloco := TStringList.Create();
  LStrSize := 0;

  LBloco.Clear;
  LFormatoBlocoInstrucoes := 'execute block' + ' as' + ' begin' + '  :vpBlocoInstrucoes' + 'end';

  try

    try
      ts.StartTransaction;

      for ct := 0 to AListaSQL.Count - 1 do
      begin
        LBloco.Add(AListaSQL.Items[ct]);
        LStrSize := ((Length(LBloco.Text) * SizeOf(Char)) div 1024);

        if ((LBloco.Count >= AQtdBlocos) or (LStrSize >= 48)) then
        begin
          q.SQL.Clear;

          q.SQL.Add(LFormatoBlocoInstrucoes);
          q.SQL.Text := StringReplace(q.SQL.Text, ':vpBlocoInstrucoes', LBloco.Text, [rfReplaceAll]);
          dm.adicionalog(q.SQL.Text);
          q.ExecSQL;
          LBloco.Clear;

        end
        else
        begin

        end;
      end;

      if LBloco.Count > 0 then
      begin
        //////dm.adicionalog('Tenta executar b  loco - Tamanho do buffer ' + Inttostr(LStrSize) + 'Kbytes');
        LStrSize := ((Length(LBloco.Text) * SizeOf(Char)) div 1024);
        q.SQL.Clear;
        q.SQL.Add(LFormatoBlocoInstrucoes);
        q.SQL.Text := StringReplace(q.SQL.Text, ':vpBlocoInstrucoes', LBloco.Text, [rfReplaceAll]);
        dm.adicionalog(q.SQL.Text);
        q.ExecSQL;
        //////dm.adicionalog('Bloco executado com sucesso!');

      end;

      //////dm.adicionalog('Tenta fazer commit das alterações');
      ts.Commit;
      //////dm.adicionalog('Fez commit');
    except
      on E: Exception do
      begin
        ts.Rollback;
        dm.adicionalog('Erro ao executar bloco de instruções. ' + sLineBreak + sLineBreak + 'Erro: ' + E.Message);
        dm.adicionalog(q.SQL.Text);
        dm.exibe_painel_erro('Erro ao executar bloco de instruções ExecuteBlock', 'Ok');
        raise Exception.Create('Erro ao executar bloco de instruções. ' + sLineBreak + sLineBreak + 'Erro: ' + E.Message);
      end;

    end;

  finally
    FreeAndNil(LBloco);
  end;
end;

function Tdm.cancelaNFECarregadaACBR(justificativa: string): Boolean;
var
  statusNota: tEstadoNFE;
begin

  Result := False;
  try
    ACBrNFe1.Cancelamento(justificativa, 0);
    statusNota := tIndefinido;

    ACBrNFe1.Consultar;

    adicionaLog('O método de consultar retornou ' + IntToStr(dm.ACBrNFe1.WebServices.Consulta.cStat));

    case dm.ACBrNFe1.WebServices.Consulta.cStat of
      100:
        statusNota := tAutorizada;
      150:
        statusNota := tAutorizada;
      217:
        statusNota := tNaoExisteSefaz;
      218:
        statusNota := tCancelada;
      101:
        statusNota := tCancelada;

    else
      begin
        statusNota := tIndefinido;
      end;
    end;

    case statusNota of
      tIndefinido:
        ;
      tNaoExisteSefaz:
        begin
          apagaNotaCarregadaACBRdaTabelaDeErros();
          //////dm.adicionalog('Nota não foi encontrada na sefaz');
          Result := False;
          Exit;
        end;

      tCancelada:
        begin
          atualizaStatusCancelamentoNFE();
          //////dm.adicionalog('Nota não foi encontrada na sefaz');
          result := True;
          Exit
        end;

      tAutorizada:
        begin
          ////dm.adicionalog('Nota tentou ser cancelada, mas não foi possível!');
          result := False;
          Exit
        end;
    end;

    Result := True;

  except
    on E: Exception do
    begin
      //////dm.adicionalog('Erro ao cancelar a nota com chave ' + Copy(dm.ACBrNFe1.NotasFiscais[0].NFe.infNFe.ID, 4, 60) + sLineBreak + 'Serie: ' + IntToStr(dm.ACBrNFe1.NotasFiscais[0].NFe.Ide.serie) + sLineBreak + 'Número: ' + IntToStr(dm.ACBrNFe1.NotasFiscais[0].NFe.Ide.nNF) + sLineBreak + 'XML: ' + sLineBreak + dm.ACBrNFe1.NotasFiscais[0].Xml);
      //////dm.adicionalog('Mensagem do erro: ' + E.Message);
      Result := False;
    end;

  end;
end;

procedure Tdm.atualizaDescontosDaVenda(codVenda: string);
var
  q: TIBQuery;
begin
  q := TIBQuery.create(self);
  q.Database := dm.dbrestaurante;
  q.Transaction := dm.transacao;

  try

    q.Active := False;
    q.SQL.Clear;

    q.sql.Add('          update vendas v set v.percentual_desconto=    ');
    q.sql.Add('                        ( ');
    q.sql.Add('                            cast(v.valor_desconto as numeric(10,8)) /');
    q.sql.Add('                             (');
    q.sql.Add('                               cast(v.valor_bruto      as numeric(10,8)) +');
    q.sql.Add('                               cast(v.valor_txserv     as numeric(10,8)) +');
    q.sql.Add('                               cast(v.valor_tx_entrega as numeric(10,8))');
    q.sql.Add('                              )');
    q.sql.Add('                        )');
    q.sql.Add('             where  v.cod_venda=' + QuotedStr(codVenda));
    q.ExecSQL;

    q.Active := False;
    q.SQL.Clear;
    q.SQL.Add('            update vendas v set v.desconto_taxas =  (udf_roundabnt(v.percentual_desconto,8) * (v.valor_txserv + v.valor_tx_entrega ) ) ');
    q.sql.Add('             where  v.cod_venda=' + QuotedStr(codVenda));
    q.ExecSQL;

    q.Active := False;
    q.SQL.Clear;
    q.sql.Add('update movimento_venda mv set mv.desconto =  ');
    q.sql.Add('         (');
    q.sql.Add('         (select v.percentual_desconto   from vendas v where v.cod_venda = mv.cod_venda)');
    q.sql.Add('          * (mv.valor_unitario * mv.quantidade)) ');
    q.sql.Add('             where  mv.cod_venda=' + QuotedStr(codVenda));
    q.ExecSQL;
  finally
    q.active := False;
    FreeAndNil(q);

  end;

end;

function Tdm.verificaItenSelecionadosMovimentoMesa(): boolean;
begin
  tbMovimentoMesa.First;
  tbMovimentoMesa.DisableControls;
  tbMovimentoMesa.First;
  Result := false;
  try
    while (not tbMovimentoMesa.Eof) and (Result <> true) do
    begin
      if (tbMovimentoMesa.FieldByName('selecionado').value = 1) then
        Result := true;
      tbMovimentoMesa.next;
    end;

  finally
    tbMovimentoMesa.EnableControls;
    tbMovimentoMesa.First;

  end;
end;

procedure TDM.SelecionaItemMovimentoMesa();
begin
  dm.tbMovimentoMesa.DisableControls;
  try
    try

      SelecionaItemUnicoMovimentoMesa;
    except
      on E: Exception do
      begin
        showRealDialog(frm_principal, tmErro, 'Erro', 'Erro ao selecionar ítens! ' + sLineBreak + sLineBreak + E.Message, 22, false);
      end;

    end;
  finally
    dm.tbMovimentoMesa.EnableControls;
  end;

end;

procedure Tdm.SelecionaItemUnicoMovimentoMesa();
begin
  dm.tbMovimentoMesa.Edit;
  if dm.tbMovimentoMesa.FieldByName('selecionado').Value = 0 then
    dm.tbMovimentoMesa.FieldByName('selecionado').Value := 1
  else
    dm.tbMovimentoMesa.FieldByName('selecionado').Value := 0;
  dm.tbMovimentoMesa.Post;
end;

function Tdm.cancelaNFECarregadaPorSubstituicao(justificativa: string; chaveNotaSubstituta: string): Boolean;
var
  statusNota: tEstadoNFE;
  lmsg: string;
begin

  Result := False;
  try
    ACBrNFe1.Consultar;

    ACBrNFe1.EventoNFe.Evento.Clear;
    with ACBrNFe1.EventoNFe.Evento.Add do
    begin
      infEvento.chNFe := Copy(dm.ACBrNFe1.NotasFiscais[0].NFe.infNFe.ID, 4, 60);
      infEvento.CNPJ := CNPJ;
      infEvento.dhEvento := Now;
      infEvento.tpEvento := teCancSubst;
      infEvento.detEvento.xJust := justificativa;
      infEvento.detEvento.nProt := dm.ACBrNFe1.NotasFiscais[0].NFe.procNFe.nProt;
      infEvento.detEvento.cOrgaoAutor := dm.ACBrNFe1.NotasFiscais[0].NFe.Ide.cUF;
      infEvento.detEvento.verAplic := '1.0';
      infEvento.detEvento.chNFeRef := chaveNotaSubstituta;
    end;

    ACBrNFe1.EnviarEvento(dm.ACBrNFe1.NotasFiscais[0].NFe.Ide.nNF);

    //////dm.adicionalog('XML DO EVENTO DE CANCELAMENTO POR SUBSTITUICAO');
    //////dm.adicionalog(dm.AcbrNFe1.WebServices.EnvEvento.EventoRetorno.retEvento.Items[0].RetInfEvento.XML);
    with dm.ACBrNFe1.WebServices.EnvEvento.EventoRetorno.retEvento.Items[0].RetInfEvento do
    begin
      lmsg := 'Id: ' + Id + #13 + 'tpAmb: ' + TpAmbToStr(tpAmb) + #13 + 'verAplic: ' + verAplic + #13 + 'cOrgao: ' + IntToStr(cOrgao) + #13 + 'cStat: ' + IntToStr(cStat) + #13 + 'xMotivo: ' + xMotivo + #13 + 'chNFe: ' + chNFe + #13 + 'tpEvento: ' + TpEventoToStr(tpEvento) + #13 + 'xEvento: ' + xEvento + #13 + 'nSeqEvento: ' + IntToStr(nSeqEvento) + #13 + 'CNPJDest: ' + CNPJDest + #13 + 'emailDest: ' + emailDest + #13 + 'dhRegEvento: ' + DateTimeToStr(dhRegEvento) + #13 + 'nProt: ' + nProt;
    end;

    //////dm.adicionalog('Log do retorno do evento de cancelamento por substituição');
    //////dm.adicionalog(lmsg);

    if dm.ACBrNFe1.WebServices.Consulta.cStat = 135 then
      gravarEventoNFE(Copy(dm.ACBrNFe1.NotasFiscais[0].NFe.infNFe.ID, 4, 60), dm.AcbrNFe1.WebServices.EnvEvento.EventoRetorno.retEvento.Items[0].RetInfEvento.XML, Now);

    statusNota := tIndefinido;
    ACBrNFe1.Consultar;
    adicionaLog('O método de consultar retornou ' + IntToStr(dm.ACBrNFe1.WebServices.Consulta.cStat));
    case dm.ACBrNFe1.WebServices.Consulta.cStat of
      100:
        statusNota := tAutorizada;
      150:
        statusNota := tAutorizada;
      217:
        statusNota := tNaoExisteSefaz;
      218:
        statusNota := tCancelada;
      101:
        statusNota := tCancelada;

    else
      begin
        statusNota := tIndefinido;
      end;
    end;

    case statusNota of
      tIndefinido:
        ;
      tNaoExisteSefaz:
        begin
          apagaNotaCarregadaACBRdaTabelaDeErros();
          //////dm.adicionalog('Nota não foi encontrada na sefaz');
          Result := False;
          Exit;
        end;

      tCancelada:
        begin
          atualizaStatusCancelamentoNFE();
          //////dm.adicionalog('Nota não foi encontrada na sefaz');
          result := True;
          Exit
        end;

      tAutorizada:
        begin
          //////dm.adicionalog('Nota tentou ser cancelada, mas não foi possível!');
          result := False;
          Exit
        end;
    end;

    Result := True;

  except
    on E: Exception do
    begin
      //////dm.adicionalog('Erro ao cancelar a nota com chave ' + Copy(dm.ACBrNFe1.NotasFiscais[0].NFe.infNFe.ID, 4, 60) + sLineBreak + 'Serie: ' + IntToStr(dm.ACBrNFe1.NotasFiscais[0].NFe.Ide.serie) + sLineBreak + 'Número: ' + IntToStr(dm.ACBrNFe1.NotasFiscais[0].NFe.Ide.nNF) + sLineBreak + 'XML: ' + sLineBreak + dm.ACBrNFe1.NotasFiscais[0].Xml);
      //////dm.adicionalog('Mensagem do erro: ' + E.Message);
      Result := False;
    end;

  end;
end;

function Tdm.verificaExistenciaNotasPendentesCancelamento(): Boolean;
var
  qryNotasErrro: TIBQuery;
  ts: TIBTransaction;
begin
  //////dm.adicionalog('Tenta fazer cancelamento de notas pendentes mais recentes');
  ts := TIBTransaction.Create(self);
  ts.DefaultDatabase := dm.dbrestaurante;
  ts.Active := False;
  ts.Active := True;

  qryNotasErrro := TIBQuery.Create(Self);
  qryNotasErrro.Database := dbrestaurante;
  qryNotasErrro.Transaction := ts;

  try
    qryNotasErrro.Active := False;
    qryNotasErrro.SQL.Clear;
    qryNotasErrro.SQL.Add('select * from nfce_emitidas order by codigo');
    qryNotasErrro.Active := True;
    qryNotasErrro.FetchAll;

    if qryNotasErrro.IsEmpty then
      Result := False
    else
      Result := True;

  finally

    qryNotasErrro.Active := False;
    FreeAndNil(qryNotasErrro);
    ts.Rollback;
    ts.Active := False;
    FreeAndNil(ts);
  end;

end;

procedure Tdm.CancelaNotasPendentes();
var
  qryNotasErrro: TIBQuery;
  ts: TIBTransaction;
  statusNota: tEstadoNFE;
begin

  if (dm.VerificaConexaoInternet() = True) then
  begin
    ts := TIBTransaction.Create(self);
    ts.DefaultDatabase := dm.dbrestaurante;
    ts.Active := False;
    ts.Active := True;

    qryNotasErrro := TIBQuery.Create(Self);
    qryNotasErrro.Database := dbrestaurante;
    qryNotasErrro.Transaction := ts;

    try
      begin

        qryNotasErrro.Active := False;
        qryNotasErrro.SQL.Clear;
        qryNotasErrro.SQL.Add('  delete from nfce_emitidas nf where exists');
        qryNotasErrro.SQL.Add('     (select v.chave_nfce from vendas v where v.chave_nfce = nf.chave)');
        qryNotasErrro.ExecSQL;
        ts.Commit;

        qryNotasErrro.Active := False;
        qryNotasErrro.SQL.Clear;
        qryNotasErrro.SQL.Add('select * from nfce_emitidas nf where udf_minutesbetween (current_timestamp,nf.data) > 3 and modelo=2');
        qryNotasErrro.SQL.Add(' union all ');
        qryNotasErrro.SQL.Add(' select * from nfce_emitidas nf where udf_minutesbetween (current_timestamp,nf.data) > 3 and modelo = 3');
        qryNotasErrro.Active := True;
        qryNotasErrro.FetchAll;

        if (qryNotasErrro.IsEmpty = False) then
        begin
          //////dm.adicionalog('Encontrou ' + IntToStr(qryNotasErrro.RecordCount) + ' notas pendentes de verificação de cancelamento');
          qryNotasErrro.First;

          while not qryNotasErrro.Eof do
          begin
            case qryNotasErrro.FieldByName('modelo').Value of
              2:
                dm.parametrizaAcbrNFE(moNFCe, False, True);
              3:
                dm.parametrizaAcbrNFE(moNFe, False, True);
            end;

            dm.ACBrNFe1.NotasFiscais.Clear;
            dm.ACBrNFe1.NotasFiscais.LoadFromString(qryNotasErrro.FieldByName('xml_nota').Value, False);

            //////dm.adicionalog('Verifica a nota para efetuar cancelamento ' + Copy(dm.ACBrNFe1.NotasFiscais[0].NFe.infNFe.ID, 4, 60) + sLineBreak + 'Serie: ' + IntToStr(dm.ACBrNFe1.NotasFiscais[0].NFe.Ide.serie) + sLineBreak + 'Número: ' + IntToStr(dm.ACBrNFe1.NotasFiscais[0].NFe.Ide.nNF) + sLineBreak + 'XML: ' + sLineBreak + dm.ACBrNFe1.NotasFiscais[0].Xml);

            statusNota := tIndefinido;

            try
              begin
                ACBrNFe1.Consultar;

                adicionaLog('O método de consultar retornou ' + IntToStr(dm.ACBrNFe1.WebServices.Consulta.cStat));

                case dm.ACBrNFe1.WebServices.Consulta.cStat of
                  100:
                    statusNota := tAutorizada;
                  150:
                    statusNota := tAutorizada;
                  217:
                    statusNota := tNaoExisteSefaz;
                  218:
                    statusNota := tCancelada;
                  101:
                    statusNota := tCancelada;

                else
                  begin
                    statusNota := tIndefinido;
                  end;
                end;

                case statusNota of
                  tIndefinido:
                    ;
                  tNaoExisteSefaz:
                    apagaNotaCarregadaACBRdaTabelaDeErros();
                  tCancelada:
                    atualizaStatusCancelamentoNFE();
                  tAutorizada:
                    cancelaNFECarregadaACBR('Cancelada por problemas técnicos no momento da emissão');
                end;

              end;

            except
              on E: Exception do
              begin
                //////dm.adicionalog('Erro ao consultar o status da nota ' + qryNotasErrro.FieldByName('xml_nota').Value + '  na sefaz');
                //////dm.adicionalog('Erro: ' + E.Message);
              end
            end;
            qryNotasErrro.Next;
          end;

        end
        else
        begin
          ////////dm.adicionalog('Nenhuma nota  pendente de verificação de cancelamento');
        end;
      end;
    finally
      begin
        qryNotasErrro.Active := False;
        FreeAndNil(qryNotasErrro);
        ts.Rollback;
        ts.Active := False;
        FreeAndNil(ts);
      end;
    end;
  end;

end;

procedure Tdm.CancelaNotasPendentesPorSubstituicao();
var
  qryNotasErrro: TIBQuery;
  ts: TIBTransaction;
  statusNota: tEstadoNFE;
begin
  ////dm.adicionalog('Tenta fazer cancelamento de notas pendentes por substituição');

  if (dm.VerificaConexaoInternet() = True) then
  begin
    ts := TIBTransaction.Create(self);
    ts.DefaultDatabase := dm.dbrestaurante;
    ts.Active := False;
    ts.Active := True;

    qryNotasErrro := TIBQuery.Create(Self);
    qryNotasErrro.Database := dbrestaurante;
    qryNotasErrro.Transaction := ts;

    try
      begin

        qryNotasErrro.Active := False;
        qryNotasErrro.SQL.Clear;
        qryNotasErrro.SQL.Add('  delete from nfce_emitidas nf where exists');
        qryNotasErrro.SQL.Add('     (select v.chave_nfce from vendas v where v.chave_nfce = nf.chave)');
        qryNotasErrro.ExecSQL;
        ts.Commit;

        qryNotasErrro.Active := False;
        qryNotasErrro.SQL.Clear;
        qryNotasErrro.SQL.Add('select nf.*, v.protocolo_nfce as protocolo_chave_substituta ');
        qryNotasErrro.SQL.Add('       from nfce_emitidas nf  ');
        qryNotasErrro.SQL.Add('       inner join vendas v on (v.chave_nfce = nf.chave_nota_substituta)  ');
        qryNotasErrro.SQL.Add('          where udf_minutesbetween (current_timestamp,nf.data) > 30  ');
        qryNotasErrro.SQL.Add('           and v.protocolo_nfce <> ' + QuotedStr('CONTINGENCIA') + '  order by codigo  ');
         /////////dm.adicionalog(qryNotasErrro.SQL.Text);

        qryNotasErrro.Active := True;
        qryNotasErrro.FetchAll;

        if (qryNotasErrro.IsEmpty = False) then
        begin
          //////dm.adicionalog('Encontrou ' + IntToStr(qryNotasErrro.RecordCount) + ' notas pendentes de verificação de cancelamento por substituição');
          qryNotasErrro.First;

          while not qryNotasErrro.Eof do
          begin
            dm.parametrizaAcbrNFE(moNFCe, False, True);
            dm.ACBrNFe1.NotasFiscais.Clear;
            dm.ACBrNFe1.NotasFiscais.LoadFromString(qryNotasErrro.FieldByName('xml_nota').Value, False);

            //////dm.adicionalog('Verifica a nota para efetuar cancelamento por substituição ' + Copy(dm.ACBrNFe1.NotasFiscais[0].NFe.infNFe.ID, 4, 60) + sLineBreak + 'Serie: ' + IntToStr(dm.ACBrNFe1.NotasFiscais[0].NFe.Ide.serie) + sLineBreak + 'Número: ' + IntToStr(dm.ACBrNFe1.NotasFiscais[0].NFe.Ide.nNF) + sLineBreak + 'XML: ' + sLineBreak + dm.ACBrNFe1.NotasFiscais[0].Xml);

            statusNota := tIndefinido;

            try
              begin
                ACBrNFe1.Consultar;

                adicionaLog('O método de consultar retornou ' + IntToStr(dm.ACBrNFe1.WebServices.Consulta.cStat));

                case dm.ACBrNFe1.WebServices.Consulta.cStat of
                  100:
                    statusNota := tAutorizada;
                  150:
                    statusNota := tAutorizada;
                  217:
                    statusNota := tNaoExisteSefaz;
                  218:
                    statusNota := tCancelada;
                  101:
                    statusNota := tCancelada;

                else
                  begin
                    statusNota := tIndefinido;
                  end;
                end;

                case statusNota of
                  tIndefinido:
                    ;
                  tNaoExisteSefaz:
                    apagaNotaCarregadaACBRdaTabelaDeErros();
                  tCancelada:
                    atualizaStatusCancelamentoNFE();
                  tAutorizada:
                    cancelaNFECarregadaPorSubstituicao('Cancelada por problemas técnicos no momento da emissão', qryNotasErrro.FieldByName('chave_nota_substituta').Value);
                end;
              end;

            except
              on E: Exception do
              begin
                //////dm.adicionalog('Erro ao consultar o status da nota ' + qryNotasErrro.FieldByName('xml_nota').Value + '  na sefaz');
                ////dm.adicionalog('Erro: ' + E.Message);
              end
            end;
            qryNotasErrro.Next;
          end;

        end
        else
        begin
          ////dm.adicionalog('Nenhuma nota  pendente de verificação de cancelamento por substituição');
        end;
      end;
    finally
      begin
        qryNotasErrro.Active := False;
        FreeAndNil(qryNotasErrro);
        ts.Rollback;
        ts.Active := False;
        FreeAndNil(ts);
      end;
    end;
  end;

end;

function Tdm.enviaNFCEContingencia(): Boolean;
var
  qtdEmitidas: Integer;
begin

  qtdEmitidas := StrToInt(dm.LeIni(2, 'NFCE', 'qtdeEmitidasContingencia'));
  Result := False;

  dm.gravaini('NFCE', 'formaEmissao', '2');
  dm.gravaini('NFCE', 'dataHoraContingencia', DateToStr(Date));
  dm.gravaini('NFCE', 'formaEmissao', '2');
  setFormaEmissaoNFCE(2);
  ACBrNFe1.NotasFiscais[0].NFe.Ide.dhCont := StrToDate(dm.LeIni(2, 'NFCE', 'dataHoraContingencia'));
  ACBrNFe1.NotasFiscais[0].NFe.Ide.xJust := dm.LeIni(2, 'NFCE', 'justificativaContingenciaOFFLINE');

  ACBrNFe1.NotasFiscais[0].NFe.Ide.serie := getSerieNFCEEmContingencia();
  ACBrNFe1.NotasFiscais[0].NFe.Ide.nNF := 1;

  adicionaLog('Pegou o número ' + IntToStr(ACBrNFe1.NotasFiscais[0].NFe.Ide.nNF));

  try
    dm.ACBrNFe1.NotasFiscais.GerarNFe();
  except
    on E: Exception do
    begin
      adicionaLog('Erro ao gerar nota em contingência. ' + e.Message);
      raise Exception.Create('Erro ao gerar nota em contingência. ' + e.Message);
      Exit;
    end;
  end;

  try
    dm.ACBrNFe1.NotasFiscais[0].Assinar;
  except
    on E: Exception do
    begin
      adicionaLog('Erro ao assinar nota em contingência. ' + e.Message);
      raise Exception.Create('Erro ao assinar nota em contingência. ' + e.Message);
      Exit;
    end;
  end;

  try
    dm.ACBrNFe1.NotasFiscais[0].Validar;
  except
    on E: Exception do
    begin
      adicionaLog('Erro ao validar nota em contingência. ' + e.Message);
      raise Exception.Create('Erro ao validar nota em contingência. ' + e.Message);
      Exit;
    end;
  end;

  ACBrNFe1.NotasFiscais[0].NFe.Ide.serie := getSerieNFCEEmContingencia();
  ACBrNFe1.NotasFiscais[0].NFe.Ide.nNF := getNumeroNFCEEmContingencia();
  dm.ACBrNFe1.NotasFiscais.GerarNFe();
  dm.ACBrNFe1.NotasFiscais[0].Assinar;
  dm.ACBrNFe1.NotasFiscais[0].Validar;

  qtdEmitidas := qtdEmitidas + 1;
  dm.gravaini('NFCE', 'qtdeEmitidasContingencia', IntToStr(qtdEmitidas));
  dm.ACBrNFe1.NotasFiscais[0].NFe.procNFe.nProt := 'CONTINGENCIA';

  ////dm.adicionalog('XML da NFC-e de número: ' + IntToStr(ACBrNFe1.NotasFiscais[0].NFe.Ide.nNF));
  ////dm.adicionalog(dm.ACBrNFe1.NotasFiscais[0].Xml);

  result := True;

end;

function Tdm.gerarEAssinarNFCE(): Boolean;
var
  nomeArquivoTemporario: string;
  localArquivoTemporario: string;
begin

  try
    dm.ACBrNFe1.NotasFiscais.GerarNFe;
  except
    on E: Exception do
    begin
      frm_encerramento.SetMensagemPainelInformacoes('Erro ao gerar a nota.', ' Verifique o arquivo de log para mais detalhes.', 10, 4, True);

      adicionaLog('Deu erro na geração da nota de chave ');
      Result := False;
      Exit;
    end;
  end;

  adicionaLog('Gerou a nota com a chave ' + Copy(dm.ACBrNFe1.NotasFiscais[0].NFe.infNFe.ID, 4, 60));
  dm.gravaini('NFCE', 'formaEmissao', '1');
  adicionaLog('Tenta assinar a nota ' + Copy(dm.ACBrNFe1.NotasFiscais[0].NFe.infNFe.ID, 4, 60));
  //Tenta assinar a nota

  try
    begin
      dm.ACBrNFe1.NotasFiscais[0].Assinar;
      adicionaLog('Assinou  a nota ' + Copy(dm.ACBrNFe1.NotasFiscais[0].NFe.infNFe.ID, 4, 60));
    end;
  except
    on E: Exception do
    begin
      frm_encerramento.SetMensagemPainelInformacoes('Erro ao assinar a nota.', ' Verique se o certificado digital está instalado e se é válido.', 10, 4, True);

      adicionaLog('Erro na assinatura  da nota com a chave ' + Copy(dm.ACBrNFe1.NotasFiscais[0].NFe.infNFe.ID, 4, 60) + '   ' + E.Message);

      Result := False;
      Exit;
    end;
  end;

  adicionaLog('Tenta validar a nota ' + Copy(dm.ACBrNFe1.NotasFiscais[0].NFe.infNFe.ID, 4, 60));

  // Tenta validar a nota
  try
    begin

      dm.ACBrNFe1.NotasFiscais[0].Validar;
      adicionaLog('Validou a nota com a  chave ' + Copy(dm.ACBrNFe1.NotasFiscais[0].NFe.infNFe.ID, 4, 60));
    end;

  except
    on E: Exception do
    begin

      frm_encerramento.SetMensagemPainelInformacoes('Erro ao validar os dados da nota.', ' Verifique os NCM dos produtos que compõem o documento fiscal.', 10, 4, True);

      adicionaLog('Erro na validação da nota com a chave ' + Copy(dm.ACBrNFe1.NotasFiscais[0].NFe.infNFe.ID, 4, 60) + '   ' + E.Message);
      Result := False;
      Exit;
    end;
  end;

  ACBrNFe1.NotasFiscais[0].NFe.Ide.serie := getSerieNFCE();
  ACBrNFe1.NotasFiscais[0].NFe.Ide.nNF := getNumeroNFCE();

  dm.ACBrNFe1.NotasFiscais.GerarNFe;
  dm.ACBrNFe1.NotasFiscais[0].Assinar;
  dm.ACBrNFe1.NotasFiscais[0].Validar;

  result := True;
end;

procedure Tdm.setFormaEmissaoNFCE(forma: Integer);
begin

  with dm.ACBrNFe1.NotasFiscais[0].NFe do
  begin
    case forma of
      1:
        begin
          dm.ACBrNFe1.Configuracoes.Geral.FormaEmissao := teNormal;
          Ide.tpEmis := teNormal;
        end;
      2:
        begin
          dm.ACBrNFe1.Configuracoes.Geral.FormaEmissao := teOffLine;
          Ide.tpEmis := teOffLine;

        end;

      3:
        begin
          dm.ACBrNFe1.Configuracoes.Geral.FormaEmissao := teSVCAN;
          Ide.tpEmis := teSVCAN;
        end;

      4:
        begin
          dm.ACBrNFe1.Configuracoes.Geral.FormaEmissao := teSVCRS;
          Ide.tpEmis := teSVCRS;
        end;

      5:
        begin
          dm.ACBrNFe1.Configuracoes.Geral.FormaEmissao := teSVCSP;
          Ide.tpEmis := teSVCSP;
        end;

      6:
        begin
          dm.ACBrNFe1.Configuracoes.Geral.FormaEmissao := teSCAN;
          Ide.tpEmis := teSCAN;
        end;

    end;
  end;
end;

procedure Tdm.imprimeTextoACBR(texto: TStringList);
var
  LTextoImpressao: string;
begin

  try
    ////dm.adicionalog(texto.Text);
    try
      begin
        ACBrPosPrinter1.LinhasBuffer := 0;
        ACBrPosPrinter1.ControlePorta := False;
        ACBrPosPrinter1.TraduzirTags := True;
        ACBrPosPrinter1.IgnorarTags := False;
        aCBrPosPrinter1.Ativar;

        ////dm.adicionalog('Comandou a impressão do texto para a porta: ' + ACBrPosPrinter1.Porta);
        LTextoImpressao := StringReplace(texto.text, sLineBreak, '', [rfReplaceAll]);
        ACBrPosPrinter1.Imprimir(texto.Text);
        ACBrPosPrinter1.CortarPapel(True);
      end;
    except
      on E: Exception do
      begin
        aCBrPosPrinter1.desativar;
        dm.exibe_painel_erro('Erro ao imprimir: ' + e.Message, 'Ok');
      end;
    end;

  finally
    aCBrPosPrinter1.desativar;
  end;

end;

procedure Tdm.configuraImpressoraNFCE();
begin
  if (dm.ACBrPosPrinter1 <> nil) then
  begin
    dm.ACBrPosPrinter1.Desativar;
    FreeAndNil(dm.ACBrPosPrinter1);
  end;

  dm.ACBrPosPrinter1 := TACBrPosPrinter.Create(self);

  danfeESCPos.PosPrinter := dm.ACBrPosPrinter1;
  ACBrPosPrinter1.Desativar;

  case (StrToInt(dm.LeIni(2, 'IMPRESSORA_NFCE', 'marca'))) of
    1:
      ACBrPosPrinter1.Modelo := ppEscBematech;
    2:
      ACBrPosPrinter1.Modelo := ppEscEpsonP2;
    3:
      ACBrPosPrinter1.Modelo := ppEscPosEpson;
    4:
      ACBrPosPrinter1.Modelo := ppEscDaruma;
    5:
      ACBrPosPrinter1.Modelo := ppEscDiebold;
    6:
      ACBrPosPrinter1.Modelo := ppEscVox;
    7:
      ACBrPosPrinter1.Modelo := ppTexto;
  end;

  ACBrPosPrinter1.Device.Porta := dm.LeIni(2, 'IMPRESSORA_NFCE', 'porta');
  ACBrPosPrinter1.Device.Baud := StrToInt(dm.LeIni(2, 'IMPRESSORA_NFCE', 'velocidade'));

  ACBrPosPrinter1.configLogo.keyCode1 := StrToInt(dm.LeIni(2, 'IMPRESSORA_NFCE', 'keycode1'));
  ACBrPosPrinter1.configLogo.keyCode2 := StrToInt(dm.LeIni(2, 'IMPRESSORA_NFCE', 'keycode2'));
  ACBrPosPrinter1.configLogo.IgnorarLogo := IntToBol(StrToInt(dm.LeIni(2, 'IMPRESSORA_NFCE', 'ignorarLogo')));
  danfeESCPos.ImprimeLogoLateral := IntToBol(StrToInt(dm.LeIni(2, 'IMPRESSORA_NFCE', 'LogoLateral')));
  danfeESCPos.ExpandeLogoMarca := IntToBol(StrToInt(dm.LeIni(2, 'IMPRESSORA_NFCE', 'ExpandeLogo')));

  case StrToInt(dm.LeIni(2, 'IMPRESSORA_NFCE', 'paridade')) of
    0:
      ACBrPosPrinter1.Device.Parity := pNone;
    1:
      ACBrPosPrinter1.Device.Parity := pEven;
    2:
      ACBrPosPrinter1.Device.Parity := pMark;
    3:
      ACBrPosPrinter1.Device.Parity := pOdd;
    4:
      ACBrPosPrinter1.Device.Parity := pSpace;
  end;

  case StrToInt(dm.LeIni(2, 'IMPRESSORA_NFCE', 'stopBits')) of
    1:
      ACBrPosPrinter1.Device.Stop := s1;
    2:
      ACBrPosPrinter1.Device.Stop := s1eMeio;
    3:
      ACBrPosPrinter1.Device.Stop := s2;
  end;

  case StrToInt(dm.LeIni(2, 'IMPRESSORA_NFCE', 'fluxo')) of
    0:
      ACBrPosPrinter1.Device.HandShake := hsNenhum;
    1:
      ACBrPosPrinter1.Device.HandShake := hsXON_XOFF;
    2:
      ACBrPosPrinter1.Device.HandShake := hsRTS_CTS;
    3:
      ACBrPosPrinter1.Device.HandShake := hsDTR_DSR;
  end;

  case StrToInt(dm.LeIni(2, 'IMPRESSORA_NFCE', 'paginaDeCodigo')) of
    0:
      ACBrPosPrinter1.PaginaDeCodigo := pc850;
    1:
      ACBrPosPrinter1.PaginaDeCodigo := pcNone;
    2:
      ACBrPosPrinter1.PaginaDeCodigo := pc437;
    3:
      ACBrPosPrinter1.PaginaDeCodigo := pc850;
    4:
      ACBrPosPrinter1.PaginaDeCodigo := pc852;
    5:
      ACBrPosPrinter1.PaginaDeCodigo := pc860;
    6:
      ACBrPosPrinter1.PaginaDeCodigo := pcUTF8;
    7:
      ACBrPosPrinter1.PaginaDeCodigo := pc1252;
  end;

  dm.ACBrPosPrinter1.LinhasEntreCupons := StrToInt(dm.LeIni(1, 'IMPRESSORA_NFCE', 'linhasEntreCupons'));

  case StrToInt(dm.LeIni(1, 'IMPRESSORA_NFCE', 'colunas')) of
    0:
      dm.ACBrPosPrinter1.ColunasFonteNormal := 48;
    1:
      dm.ACBrPosPrinter1.ColunasFonteNormal := 48;
    2:
      dm.ACBrPosPrinter1.ColunasFonteNormal := 42;
  end;

  ACBrPosPrinter1.IgnorarTags := False;
  ACBrPosPrinter1.Desativar;
  ACBrPosPrinter1.Ativar;

end;

function Tdm.setFormaEmissaOnlineNFE(): Boolean;
var
  ct: Integer;
  chave: string;
  serie: Integer;
  numeroNF: Integer;
  nomeArquivoTemporario: string;
  nomeArquivoDefinitivo: string;
  localArquivoTemporario: string;
  localArquivoDefinitivo: string;
  tentativasConsulta, tentativaAtual: SmallInt;
  notaFoiEnviada: Boolean;
  msgErroEnvio: string;
  msgTempoLimite2: string;
  codErroEnvioNota: SmallInt;
  mensagemErroEnvioNota: string;
begin
  dm.tb_parametros.Active := True;
  notaFoiEnviada := False;
  result := False;

  case dm.ACBrNFe1.Configuracoes.Geral.FormaEmissao of
    teNormal:
      begin
        dm.ACBrNFe1.NotasFiscais[0].NFe.Ide.tpEmis := teNormal;
      end;

    teSVCRS:
      begin
        dm.ACBrNFe1.NotasFiscais[0].NFe.Ide.tpEmis := teSVCRS;
      end;

  end;

  msgTempoLimite2 := 'Erro Interno: 12002' + 'Erro HTTP: 4' + 'Erro: Requisição não enviada.' + '12002 - O tempo limite da operação foi atingido';

  adicionaLog('Inicia a emissão da NFE online');
//  ACBrNFe1.NotasFiscais[0].NFe.Ide.cNF := 44;
  ACBrNFe1.NotasFiscais[0].NFe.Ide.serie := dm.tb_parametrosSERIE_NFE.Value;
  ACBrNFe1.NotasFiscais[0].NFe.Ide.nNF := getNumeroNFE();
  adicionaLog('Pegou o número ' + IntToStr(ACBrNFe1.NotasFiscais[0].NFe.Ide.nNF));

  try
    dm.ACBrNFe1.NotasFiscais.GerarNFe;
  except
    on E: Exception do
    begin
      adicionaLog('Deu erro na geração da nota de chave ');

      dm.ACBrNFe1.NotasFiscais[0].GravarXML(Copy(dm.ACBrNFe1.NotasFiscais[0].NFe.infNFe.ID, 4, 60) + '_ERRO_VALIDACAO_' + FormatDateTime('HH#MM#SS', data_do_sistema) + '.xml', dm.LeIni(2, 'NFE', 'CaminhoErroEnviar') + '\' + FormatDateTime('YYYMM', data_do_sistema));
      exibe_painel_erro('ERRRO GERAR  NFCE'#13#10#13#10 + ' Antes de ativar o modo de força em contingência offline, envie uma foto deste erro para a Real Softwares!' + #13#10#13#10 + E.message, 'Ok');
      Result := False;
      Exit;

    end;
  end;

  chave := Copy(dm.ACBrNFe1.NotasFiscais[0].NFe.infNFe.ID, 4, 60);
  serie := ACBrNFe1.NotasFiscais[0].NFe.Ide.serie;
  numeroNF := ACBrNFe1.NotasFiscais[0].NFe.Ide.nNF;

  adicionaLog('Gerou a nota com a chave ' + Copy(dm.ACBrNFe1.NotasFiscais[0].NFe.infNFe.ID, 4, 60));

  adicionaLog('Tenta assinar a nota ' + Copy(dm.ACBrNFe1.NotasFiscais[0].NFe.infNFe.ID, 4, 60));

  //Tenta assinar a nota
  try
    begin
      dm.ACBrNFe1.NotasFiscais[0].Assinar;
      adicionaLog('Assinou  a nota ' + Copy(dm.ACBrNFe1.NotasFiscais[0].NFe.infNFe.ID, 4, 60));
    end;
  except
    on E: Exception do
    begin
      adicionaLog('Erro na assinatura  da nota com a chave ' + Copy(dm.ACBrNFe1.NotasFiscais[0].NFe.infNFe.ID, 4, 60) + '   ' + E.Message);

      dm.ACBrNFe1.NotasFiscais[0].GravarXML(Copy(dm.ACBrNFe1.NotasFiscais[0].NFe.infNFe.ID, 4, 60) + '_ERRO_VALIDACAO_' + FormatDateTime('HH#MM#SS', data_do_sistema) + '.xml', dm.LeIni(2, 'NFE', 'CaminhoErroEnviar') + '\' + FormatDateTime('YYYMM', data_do_sistema));
      exibe_painel_erro('ERRO AO ASSINAR NF-E'#13#10#13#10 + ' Antes de ativar o modo de força em contingência offline, envie uma foto deste erro para a Real Softwares!' + #13#10#13#10 + E.message, 'Ok');
      Result := False;
      Exit;
    end;
  end;

  adicionaLog('Tenta validar a nota ' + Copy(dm.ACBrNFe1.NotasFiscais[0].NFe.infNFe.ID, 4, 60));
  // Tenta validar a nota
  try
    begin

      dm.ACBrNFe1.NotasFiscais[0].Validar;
      adicionaLog('Validou a nota com a  chave ' + Copy(dm.ACBrNFe1.NotasFiscais[0].NFe.infNFe.ID, 4, 60));
    end;

  except
    on E: Exception do
    begin

      adicionaLog('Erro na validação da nota com a chave ' + Copy(dm.ACBrNFe1.NotasFiscais[0].NFe.infNFe.ID, 4, 60) + '   ' + E.Message);
      dm.ACBrNFe1.NotasFiscais[0].GravarXML(Copy(dm.ACBrNFe1.NotasFiscais[0].NFe.infNFe.ID, 4, 60) + '_ERRO_VALIDACAO_' + FormatDateTime('HH#MM#SS', data_do_sistema) + '.xml', dm.LeIni(2, 'NFE', 'CaminhoErroEnviar') + '\' + FormatDateTime('YYYMM', data_do_sistema));
      exibe_painel_erro('ERRRO AO VALIDAR A NFE'#13#10#13#10 + ' Antes de ativar o modo de força em contingência offline, envie uma foto deste erro para a Real Softwares!' + #13#10#13#10 + E.message, 'Ok');
      Result := False;
      Exit;
    end;
  end;

  nomeArquivoTemporario := FormatDateTime('DDMMHHMMSS', Now) + '_' + Copy(dm.ACBrNFe1.NotasFiscais[0].NFe.infNFe.ID, 4, 60) + '.xml';
  nomeArquivoDefinitivo := Copy(dm.ACBrNFe1.NotasFiscais[0].NFe.infNFe.ID, 4, 60) + '.xml';

  localArquivoTemporario := dm.LeIni(2, 'NFE', 'caminhoArquivosXML') + '\' + FormatDateTime('YYYMM', data_do_sistema) + '\temp\';
  localArquivoDefinitivo := dm.LeIni(2, 'NFE', 'caminhoArquivosXML') + '\' + FormatDateTime('YYYMM', data_do_sistema) + '\';

  adicionaLog('Tentar gravar em disco o arquivo temporario da nota com a chave ' + Copy(dm.ACBrNFe1.NotasFiscais[0].NFe.infNFe.ID, 4, 60));
      //Tenta gravar a nota em disco
  try
    begin
      dm.ACBrNFe1.NotasFiscais[0].GravarXML(nomeArquivoTemporario, localArquivoTemporario);
      adicionaLog('gravou em disco a nota com a chave ' + Copy(dm.ACBrNFe1.NotasFiscais[0].NFe.infNFe.ID, 4, 60));
    end;
  except
    on E: Exception do
    begin
      adicionaLog(' erro gravar em disco a nota com a chave ' + Copy(dm.ACBrNFe1.NotasFiscais[0].NFe.infNFe.ID, 4, 60) + '   ' + E.Message + ' no pasta' + dm.LeIni(2, 'NFE', 'caminhoArquivosXML') + '\' + FormatDateTime('YYYMM', data_do_sistema));
      dm.ACBrNFe1.NotasFiscais[0].GravarXML(Copy(dm.ACBrNFe1.NotasFiscais[0].NFe.infNFe.ID, 4, 60) + '_ERRO_ENVIO.xml', dm.LeIni(2, 'NFCE', 'CaminhoErroEnviar') + '\' + FormatDateTime('YYYMM', data_do_sistema));
      exibe_painel_erro('ERRO AO GRAVAR A NOTA EM DISCO!' + #13#10#13#10 + E.message, 'Ok');
      Result := True;
      Exit;
    end;
  end;

  adicionaLog('XML da NF-e Gerada:');
  adicionaLog(dm.ACBrNFe1.NotasFiscais[0].Xml);
  AdicionaNFCENaListaDeNotasParaCancelar(3);

  try
    begin
      dm.ACBrNFe1.WebServices.Retorno.Protocolo := '';
      dm.ACBrNFe1.Enviar(ACBrNFe1.NotasFiscais[0].NFe.Ide.nNF, False, nfeSincrona, False);
      adicionaLog('Tenta enviar a nota com a chave ' + Copy(dm.ACBrNFe1.NotasFiscais[0].NFe.infNFe.ID, 4, 60));

      if nfeSincrona then
      begin
        dm.adicionalog('Tipo do envio: Síncrono');
        codErroEnvioNota := dm.ACBrNFe1.WebServices.Enviar.cStat;
        mensagemErroEnvioNota := dm.ACBrNFe1.WebServices.Enviar.xMotivo;
      end
      else
      begin
        dm.adicionalog('Tipo do envio: Assíncrono');
        codErroEnvioNota := dm.ACBrNFe1.WebServices.Retorno.cStat;
        mensagemErroEnvioNota := dm.ACBrNFe1.WebServices.Retorno.xMsg;
      end;

      adicionaLog('Enviou a a nota com a chave ' + Copy(dm.ACBrNFe1.NotasFiscais[0].NFe.infNFe.ID, 4, 60));
      adicionaLog('Retorno do envio :' + IntToStr(codErroEnvioNota) + ' - ' + msgErroEnvio);
      notaFoiEnviada := True;
    end;
  except
    on E: Exception do
    begin
      dm.ACBrNFe1.NotasFiscais[0].GravarXML(Copy(dm.ACBrNFe1.NotasFiscais[0].NFe.infNFe.ID, 4, 60) + '_ERRO_ENVIO.xml', dm.LeIni(2, 'NFE', 'CaminhoErroEnviar') + '\' + FormatDateTime('YYYMM', data_do_sistema));
      msgErroEnvio := e.Message;
      adicionaLog(msgErroEnvio);
      if ((Pos('12002', msgErroEnvio) > 0) or (Pos('12057', msgErroEnvio) > 0)) then
      begin
        adicionaLog('OCORREU O PROBLEMA DE TEMPO DE LIMITE!');
        tentativasConsulta := 10;
        notaFoiEnviada := False;
        tentativaAtual := 0;

        while ((tentativaAtual < tentativasConsulta) and (notaFoiEnviada = False)) do
        begin
          adicionaLog(IntToStr(tentativaAtual) + ' tentativa de consulta');
          dm.ACBrNFe1.NotasFiscais.Clear;
          dm.ACBrNFe1.NotasFiscais.LoadFromFile(localArquivoTemporario + nomeArquivoTemporario);

          try
            ACBrNFe1.Consultar;
          except
            begin

            end
          end;

//                   if  ( trim(dm.ACBrNFe1.WebServices.Consulta.XMotivo) = 'Autorizado o uso da NF-e') then
          if ((dm.ACBrNFe1.WebServices.Consulta.cStat = 100) or (dm.ACBrNFe1.WebServices.Consulta.cStat = 150)) then
          begin
            notaFoiEnviada := True;
          end;

          if (notaFoiEnviada = False) then
            Sleep(2000);

          tentativaAtual := tentativaAtual + 1;
        end
      end
      else
      begin
        notaFoiEnviada := False;
        result := False;
      end;
    end;
  end;

  if ((codErroEnvioNota = 100) or (codErroEnvioNota = 150)) then
  begin
    notaFoiEnviada := True;
  end
  else
  begin
    notaFoiEnviada := False;
  end;

  if notaFoiEnviada then
  begin
    adicionaLog('Tentar gravar em disco o arquivo definitivo da nota com a chave ' + Copy(dm.ACBrNFe1.NotasFiscais[0].NFe.infNFe.ID, 4, 60));
      //Tenta gravar a nota em disco
    try
      begin
        dm.ACBrNFe1.NotasFiscais[0].GravarXML(nomeArquivoDefinitivo, localArquivoDefinitivo);
        DeleteFile(localArquivoTemporario + nomeArquivoTemporario);
        adicionaLog('gravou em disco o arquivo definitivo da nota com a chave ' + Copy(dm.ACBrNFe1.NotasFiscais[0].NFe.infNFe.ID, 4, 60));
      end;
    except
      on E: Exception do
      begin
        adicionaLog(' erro gravar em disco a nota com a chave ' + Copy(dm.ACBrNFe1.NotasFiscais[0].NFe.infNFe.ID, 4, 60) + '   ' + E.Message + ' no pasta' + dm.LeIni(2, 'NFE', 'caminhoArquivosXML') + '\' + FormatDateTime('YYYMM', data_do_sistema));
        dm.ACBrNFe1.NotasFiscais[0].GravarXML(Copy(dm.ACBrNFe1.NotasFiscais[0].NFe.infNFe.ID, 4, 60) + '_ERRO_ENVIO.xml', dm.LeIni(2, 'NFE', 'CaminhoErroEnviar') + '\' + FormatDateTime('YYYMM', data_do_sistema));
        exibe_painel_erro('ERRO AO GRAVAR A NOTA EM DISCO!' + #13#10#13#10 + E.message, 'Ok');
        Result := True;
        Exit;
      end;
    end;
  end
  else
  begin
    msgErroEnvio := ProcessarMensagemRejeicao(msgErroEnvio);
    DeleteFile(localArquivoTemporario + nomeArquivoTemporario);
    adicionaLog('Erro no envio da nota com a chave ' + chave + '   ' + msgErroEnvio);
    exibe_painel_erro('erro no envio da nota com a chave ' + chave + '   ' + msgErroEnvio, 'Ok');

    result := False;
    Exit;
  end;

  result := True;
end;

procedure Tdm.configuraImpressoraNaoFiscal();
var
  LArquivoLogImpressao: string;
begin
  LArquivoLogImpressao := patchAplicacao + 'impressoes\' + FormatDateTime('YYY', Date) + '_' + FormatDateTime('MM', Date) + '_' + FormatDateTime('DD', Date) + '.prt';

  if (dm.ACBrPosPrinter1 <> nil) then
  begin
    dm.ACBrPosPrinter1.Desativar;
    FreeAndNil(dm.ACBrPosPrinter1);
  end;

  dm.ACBrPosPrinter1 := TACBrPosPrinter.Create(self);
  ACBrPosPrinter1.Desativar;

  if (StrToInt(dm.LeIni(2, 'IMPRESSORA_NAO_FISCAL_01', 'debug'))) <> 1 then
  begin

    case (StrToInt(dm.LeIni(2, 'IMPRESSORA_NAO_FISCAL_01', 'marca'))) of
      1:
        ACBrPosPrinter1.Modelo := ppEscBematech;
      2:
        ACBrPosPrinter1.Modelo := ppEscEpsonP2;
      3:
        ACBrPosPrinter1.Modelo := ppEscPosEpson;
      4:
        ACBrPosPrinter1.Modelo := ppEscDaruma;
      5:
        ACBrPosPrinter1.Modelo := ppEscDiebold;
      6:
        ACBrPosPrinter1.Modelo := ppEscVox;

      12:
        ACBrPosPrinter1.Modelo := ppTexto;
    end;

    case StrToInt(dm.LeIni(2, 'IMPRESSORA_NAO_FISCAL_01', 'paginaDeCodigo')) of
      0:
        ACBrPosPrinter1.PaginaDeCodigo := pc850;
      1:
        ACBrPosPrinter1.PaginaDeCodigo := pcNone;
      2:
        ACBrPosPrinter1.PaginaDeCodigo := pc437;
      3:
        ACBrPosPrinter1.PaginaDeCodigo := pc850;
      4:
        ACBrPosPrinter1.PaginaDeCodigo := pc852;
      5:
        ACBrPosPrinter1.PaginaDeCodigo := pc860;
      6:
        ACBrPosPrinter1.PaginaDeCodigo := pcUTF8;
      7:
        ACBrPosPrinter1.PaginaDeCodigo := pc1252;
    end;

    dm.ACBrPosPrinter1.LinhasEntreCupons := StrToInt(dm.LeIni(1, 'IMPRESSORA_NAO_FISCAL_01', 'linhasEntreCupons'));

    case StrToInt(dm.LeIni(1, 'IMPRESSORA_NAO_FISCAL_01', 'colunas')) of
      0:
        dm.ACBrPosPrinter1.ColunasFonteNormal := 48;
      1:
        dm.ACBrPosPrinter1.ColunasFonteNormal := 48;
      2:
        dm.ACBrPosPrinter1.ColunasFonteNormal := 42;
    end;

    ACBrPosPrinter1.Device.Porta := dm.LeIni(2, 'IMPRESSORA_NAO_FISCAL_01', 'porta');
    ACBrPosPrinter1.Device.Baud := StrToInt(dm.LeIni(2, 'IMPRESSORA_NAO_FISCAL_01', 'velocidade'));
    ACBrPosPrinter1.configLogo.IgnorarLogo := IntToBol(StrToInt(dm.LeIni(2, 'IMPRESSORA_NAO_FISCAL_01', 'ignorarLogo')));
    ACBrPosPrinter1.configLogo.keyCode1 := StrToInt(dm.LeIni(2, 'IMPRESSORA_NAO_FISCAL_01', 'keycode1'));
    ACBrPosPrinter1.configLogo.keyCode2 := StrToInt(dm.LeIni(2, 'IMPRESSORA_NAO_FISCAL_01', 'keycode2'));
    danfeESCPos.ImprimeLogoLateral := IntToBol(StrToInt(dm.LeIni(2, 'IMPRESSORA_NAO_FISCAL_01', 'LogoLateral')));
    danfeESCPos.ExpandeLogoMarca := IntToBol(StrToInt(dm.LeIni(2, 'IMPRESSORA_NAO_FISCAL_01', 'ExpandeLogo')));

    ACBrPosPrinter1.TraduzirTags := True;

    case StrToInt(dm.LeIni(2, 'IMPRESSORA_NAO_FISCAL_01', 'paridade')) of
      0:
        ACBrPosPrinter1.Device.Parity := pNone;
      1:
        ACBrPosPrinter1.Device.Parity := pEven;
      2:
        ACBrPosPrinter1.Device.Parity := pMark;
      3:
        ACBrPosPrinter1.Device.Parity := pOdd;
      4:
        ACBrPosPrinter1.Device.Parity := pSpace;
    end;

    case StrToInt(dm.LeIni(2, 'IMPRESSORA_NAO_FISCAL_01', 'stopBits')) of
      1:
        ACBrPosPrinter1.Device.Stop := s1;
      2:
        ACBrPosPrinter1.Device.Stop := s1eMeio;
      3:
        ACBrPosPrinter1.Device.Stop := s2;
    end;

    case StrToInt(dm.LeIni(2, 'IMPRESSORA_NAO_FISCAL_01', 'fluxo')) of
      0:
        ACBrPosPrinter1.Device.HandShake := hsNenhum;
      1:
        ACBrPosPrinter1.Device.HandShake := hsXON_XOFF;
      2:
        ACBrPosPrinter1.Device.HandShake := hsRTS_CTS;
      3:
        ACBrPosPrinter1.Device.HandShake := hsDTR_DSR;
    end;
  end
  else
  begin
    ACBrPosPrinter1.Modelo := ppTexto;
    ACBrPosPrinter1.Porta := LArquivoLogImpressao;

  end;

end;

procedure Tdm.ConfiguraImpressoraExpedicao();
var
  LArquivoLogImpressao: string;
begin
  LArquivoLogImpressao := patchAplicacao + 'impressoes\' + FormatDateTime('YYY', Date) + '_' + FormatDateTime('MM', Date) + '_' + FormatDateTime('DD', Date) + '.prt';

  if (dm.ACBrPosPrinter1 <> nil) then
  begin
    dm.ACBrPosPrinter1.Desativar;
    FreeAndNil(dm.ACBrPosPrinter1);
  end;

  dm.ACBrPosPrinter1 := TACBrPosPrinter.Create(self);
  ACBrPosPrinter1.Desativar;

  if (StrToInt(dm.LeIni(2, 'IMPRESSORA_EXPEDICAO', 'debug'))) <> 1 then
  begin

    case (StrToInt(dm.LeIni(2, 'IMPRESSORA_EXPEDICAO', 'marca'))) of
      1:
        ACBrPosPrinter1.Modelo := ppEscBematech;
      2:
        ACBrPosPrinter1.Modelo := ppEscEpsonP2;
      3:
        ACBrPosPrinter1.Modelo := ppEscPosEpson;
      4:
        ACBrPosPrinter1.Modelo := ppEscDaruma;
      5:
        ACBrPosPrinter1.Modelo := ppEscDiebold;
      6:
        ACBrPosPrinter1.Modelo := ppEscVox;

      12:
        ACBrPosPrinter1.Modelo := ppTexto;
    end;

    case StrToInt(dm.LeIni(2, 'IMPRESSORA_EXPEDICAO', 'paginaDeCodigo')) of
      0:
        ACBrPosPrinter1.PaginaDeCodigo := pc850;
      1:
        ACBrPosPrinter1.PaginaDeCodigo := pcNone;
      2:
        ACBrPosPrinter1.PaginaDeCodigo := pc437;
      3:
        ACBrPosPrinter1.PaginaDeCodigo := pc850;
      4:
        ACBrPosPrinter1.PaginaDeCodigo := pc852;
      5:
        ACBrPosPrinter1.PaginaDeCodigo := pc860;
      6:
        ACBrPosPrinter1.PaginaDeCodigo := pcUTF8;
      7:
        ACBrPosPrinter1.PaginaDeCodigo := pc1252;
    end;

    dm.ACBrPosPrinter1.LinhasEntreCupons := StrToInt(dm.LeIni(1, 'IMPRESSORA_EXPEDICAO', 'linhasEntreCupons'));

    case StrToInt(dm.LeIni(1, 'IMPRESSORA_EXPEDICAO', 'colunas')) of
      0:
        dm.ACBrPosPrinter1.ColunasFonteNormal := 48;
      1:
        dm.ACBrPosPrinter1.ColunasFonteNormal := 48;
      2:
        dm.ACBrPosPrinter1.ColunasFonteNormal := 42;
    end;

    ACBrPosPrinter1.Device.Porta := dm.LeIni(2, 'IMPRESSORA_EXPEDICAO', 'porta');
    ACBrPosPrinter1.Device.Baud := StrToInt(dm.LeIni(2, 'IMPRESSORA_EXPEDICAO', 'velocidade'));
    ACBrPosPrinter1.configLogo.IgnorarLogo := IntToBol(StrToInt(dm.LeIni(2, 'IMPRESSORA_EXPEDICAO', 'ignorarLogo')));
    ACBrPosPrinter1.configLogo.keyCode1 := StrToInt(dm.LeIni(2, 'IMPRESSORA_EXPEDICAO', 'keycode1'));
    ACBrPosPrinter1.configLogo.keyCode2 := StrToInt(dm.LeIni(2, 'IMPRESSORA_EXPEDICAO', 'keycode2'));
    danfeESCPos.ImprimeLogoLateral := IntToBol(StrToInt(dm.LeIni(2, 'IMPRESSORA_EXPEDICAO', 'LogoLateral')));
    danfeESCPos.ExpandeLogoMarca := IntToBol(StrToInt(dm.LeIni(2, 'IMPRESSORA_EXPEDICAO', 'ExpandeLogo')));

    ACBrPosPrinter1.TraduzirTags := True;

    case StrToInt(dm.LeIni(2, 'IMPRESSORA_EXPEDICAO', 'paridade')) of
      0:
        ACBrPosPrinter1.Device.Parity := pNone;
      1:
        ACBrPosPrinter1.Device.Parity := pEven;
      2:
        ACBrPosPrinter1.Device.Parity := pMark;
      3:
        ACBrPosPrinter1.Device.Parity := pOdd;
      4:
        ACBrPosPrinter1.Device.Parity := pSpace;
    end;

    case StrToInt(dm.LeIni(2, 'IMPRESSORA_EXPEDICAO', 'stopBits')) of
      1:
        ACBrPosPrinter1.Device.Stop := s1;
      2:
        ACBrPosPrinter1.Device.Stop := s1eMeio;
      3:
        ACBrPosPrinter1.Device.Stop := s2;
    end;

    case StrToInt(dm.LeIni(2, 'IMPRESSORA_EXPEDICAO', 'fluxo')) of
      0:
        ACBrPosPrinter1.Device.HandShake := hsNenhum;
      1:
        ACBrPosPrinter1.Device.HandShake := hsXON_XOFF;
      2:
        ACBrPosPrinter1.Device.HandShake := hsRTS_CTS;
      3:
        ACBrPosPrinter1.Device.HandShake := hsDTR_DSR;
    end;
  end
  else
  begin
    ACBrPosPrinter1.Modelo := ppTexto;
    ACBrPosPrinter1.Porta := LArquivoLogImpressao;

  end;

end;

function Tdm.imprimeTextoMiniPrinter(AStr: string): Boolean;
var
  linhasMemo: Integer;
  contador: Integer;
  nomeImpressora: string;
  ctLinha: Integer;
  ret: Integer;
  strComprovante: TStringList;
begin
  strComprovante := TStringList.Create;
  strComprovante.Add(AStr);

  configuraImpressoraNaoFiscal();

  imprimeTextoACBR(strComprovante);
  FreeAndNil(strComprovante);
  Result := True;
end;

function Tdm.ImprimeTextoImpressoraExpedicao(AStr: string): Boolean;
var
  linhasMemo: Integer;
  contador: Integer;
  nomeImpressora: string;
  ctLinha: Integer;
  ret: Integer;
  strComprovante: TStringList;
begin
  strComprovante := TStringList.Create;
  strComprovante.Add(AStr);
  ConfiguraImpressoraExpedicao;
  imprimeTextoACBR(strComprovante);
  FreeAndNil(strComprovante);
  Result := True;
end;

function Tdm.imprimeTexoImpressoraNFCE: Boolean;
var
  linhasMemo: Integer;
  contador: Integer;
  nomeImpressora: string;
  ctLinha: Integer;
  ret: Integer;
  strComprovante: TStringList;
begin
  strComprovante := TStringList.Create;
  strComprovante.Add(frm_principal.memo_avisos.Lines.Text);
  configuraImpressoraNFCE();
  imprimeTextoACBR(strComprovante);
  FreeAndNil(strComprovante);
  Result := True;
end;

function Tdm.imprimeLinhaEmArquivo(Arquivo: string; marca: Integer; modelo: Integer; linha: WideString; negrito: Boolean; italico: Boolean; sublinhado: Boolean; tam: Boolean; comprimido: Boolean; largura: Boolean; altura: Boolean): string;
var
  formato: string;
  dummy: Integer;
  tipoletraBmt, italicoBmt, sublinhadoBmt, expBmt, negritoBmt: Integer;
begin

  case marca of
    1:
      begin
        linha := formatacaoBematech(negrito, italico, sublinhado, tam, comprimido, largura, altura) + linha;
        linha := linha + formatacaoBematechFinal(negrito, italico, sublinhado, tam, comprimido, largura, altura);
        linha := linha + #13#10;
        gravaStrEmArquivoDeTexto(Arquivo, linha);
      end;

    2:
      begin
        linha := formatacaoBematech(negrito, italico, sublinhado, tam, comprimido, largura, altura) + linha;
        linha := linha + formatacaoBematechFinal(negrito, italico, sublinhado, tam, comprimido, largura, altura);
        linha := linha + #13#10;
        gravaStrEmArquivoDeTexto(Arquivo, linha);
      end;

    3:
      begin

        formato := Chr(27) + Chr(64);
        gravaStrEmArquivoDeTexto(patchAplicacao + 'extrato.dat', formato);

        if negrito then
        begin
          formato := formato + Chr(27) + Chr(69) + Chr(1);
          gravaStrEmArquivoDeTexto(patchAplicacao + 'extrato.dat', formato);
        end;

        if tam then
        begin
          formato := formato + Chr(29) + Chr(33) + Chr(16);
          gravaStrEmArquivoDeTexto(patchAplicacao + 'extrato.dat', formato);
        end;
        linha := formato + linha + Chr(13) + Chr(10);
        gravaStrEmArquivoDeTexto(Arquivo, linha);

             {
             linha:= formatacaoACBRInicial (negrito,italico,sublinhado,tam,comprimido,largura,altura)+linha;
             linha:= linha+formatacaoACBRFinal(negrito,italico,sublinhado,tam,comprimido,largura,altura);
             linha:=linha+chr(13)+chr(10);
             gravaStrEmArquivoDeTexto(arquivo,linha);
              }
      end;
  end;

end;

function Tdm.cortaPapelImpNF(arquivo: string; marca: Integer; modelo: Integer): string;
begin

  case marca of
    1:
      begin
        gravaStrEmArquivoDeTexto(arquivo, Chr(27) + Chr(109));
      end;
    2:
      begin

        gravaStrEmArquivoDeTexto(arquivo, Chr(29) + Chr(86) + Chr(65));
      end;
    3:
      begin
//            gravaStrEmArquivoDeTexto(arquivo,'</corte_parcial>');
        gravaStrEmArquivoDeTexto(arquivo, Chr(13) + Chr(10));
        gravaStrEmArquivoDeTexto(arquivo, Chr(29) + Chr(86) + Chr(65));

      end;
    4:
      begin

        gravaStrEmArquivoDeTexto(arquivo, Chr(27) + Chr(109));
      end;

    5:
      begin

      end;

    6:
      begin

        gravaStrEmArquivoDeTexto(arquivo, Chr(13) + Chr(10));
        gravaStrEmArquivoDeTexto(arquivo, Chr(29) + Chr(86) + Chr(65));

      end;

  end;

end;

function Tdm.AbreGaveta(marca: Integer; modelo: Integer): string;
var
  sComando: string;
begin

  if (StrToInt(dm.LeIni(2, 'IMPRESSORA_NAO_FISCAL_01', 'via_dll')) = 1) and (StrToInt(dm.LeIni(2, 'IMPRESSORA_NAO_FISCAL_01', 'usarAcbr')) = 1) then
  begin
    dm.configuraImpressoraNFCE();
    dm.ACBrPosPrinter1.AbrirGaveta;
    dm.ACBrPosPrinter1.Desativar;
    Exit;

  end;

  if (StrToInt(dm.LeIni(1, 'IMPRESSORA_FISCAL', 'instalada')) = 1) and (StrToInt(dm.LeIni(1, 'IMPRESSORA_FISCAL', 'usarAcbr')) = 1) then
    marca := StrToInt(dm.LeIni(1, 'IMPRESSORA_FISCAL', 'marca'))
  else
    marca := StrToInt(dm.LeIni(1, 'IMPRESSORA_NAO_FISCAL_01', 'marca'));

  case marca of
    1:
      begin
        if (StrToInt(dm.LeIni(2, 'IMPRESSORA_NAO_FISCAL_01', 'via_dll')) = 1) then
        begin
          sComando := #27 + #118 + #140;
        end
        else
        begin
          if FileExists(caminhoArquivoExtrato) then
            DeleteFile(caminhoArquivoExtrato);
          gravaStrEmArquivoDeTexto(patchAplicacao + 'extrato.dat', Chr(27) + Chr(118) + Chr(140));
          frm_principal.memo_avisos.Lines.LoadFromFile(caminhoArquivoExtrato);
          imprimeTextoMiniPrinter(frm_principal.memo_avisos.Lines.Text);
        end;

      end;
    2:
      begin

      end;
    3:
      begin

      end;
    4:
      begin
        gravaStrEmArquivoDeTexto(patchAplicacao + 'extrato.dat', Chr(27) + Chr(22));
      end;

    5:
      begin

      end;
  end;
end;

function Tdm.imp_bmp_impNF(marca: Integer; modelo: Integer; indice: Integer; img: WideString; posicao: Integer): string;
begin

  case marca of
    1:
      begin

      end;
    2:
      begin

      end;
    3:
      begin

      end;
    4:
      begin

      end;

    5:
      begin  // Epson
        case modelo of
          1:
            begin    // Térmica TM-T88II
///                 case posicao of
//                   1: img:= IntToStr(PTR_BM_LEFT);
  //                 2: img:= IntToStr(PTR_BM_CENTER);
    //               3: img:= IntToStr(PTR_BM_RIGHT);
   //              end;
//                 Result:=analisa_retorno_nfiscal(marca,modelo,IntToStr(controladorEpson.DirectIO(PTR_DI_PRINT_FLASH_BITMAP,INDICE,img)));
            end;

        end;

      end;
  end;
end;

function imprime_imagem_imp_termicaNF(marca: Integer; modelo: Integer; indice: Integer): string;
var
  data: WideString;
begin

  case marca of
    1:
      begin

      end;
    2:
      begin

      end;
    3:
      begin

      end;
    4:
      begin

      end;

    5:
      begin  // Epson
        case modelo of
          1:
            begin    // Térmica TM-T88II
//                  data:= inttostr(PTR_BM_CENTER);
//                  controladorEpson.DirectIO(PTR_DI_PRINT_FLASH_BITMAP,indice,data);
            end;

        end;

      end;
  end;
end;

function Tdm.imprimeCabecalhoEstornoDeMesa(marca: Integer; modelo: Integer; tipo: Integer; AMesa: string; layout: Integer): Boolean;
var
  str: string;
begin

  case marca of
    1:
      begin
        case modelo of
          1:
            begin
              dm.imprime_linha_impNF(marca, modelo, dm.centralizar(nome_fantasia, 30), True, False, False, False, True, True, True);
              dm.imprime_linha_impNF(marca, modelo, '------------------------------------------------------------', False, False, False, False, True, False, True);
              dm.imprime_linha_impNF(marca, modelo, dm.centralizar('Estorno de mesa', 30), True, False, False, False, True, True, True);
              dm.imprime_linha_impNF(marca, modelo, 'Mesa: ' + AMesa, True, False, False, False, True, True, True);

              str := FormatDateTime('DD/MM/YYY', Date) + ' ' + FormatDateTime('HH:MM:SS', Time);
              dm.imprime_linha_impNF(marca, modelo, str, False, False, False, False, True, False, False);
              str := 'Operador: ' + nome_usuario;
              dm.imprime_linha_impNF(marca, modelo, str, False, False, False, False, True, False, False);
              dm.imprime_linha_impNF(marca, modelo, '------------------------------------------------------------', False, False, False, False, True, False, True);

              str := '########****************************';
              str := dm.organizarCupom(str, 'Cod.', '#');
              str := dm.organizarCupom(str, 'Descricao', '*');
              dm.imprime_linha_impNF(marca, modelo, str, False, False, False, False, False, False, False);
              str := '##########$$$$$********%%%%%%%%%%%%%';
              str := dm.organizarCupom(str, 'Qtd.', '#');
              str := dm.organizarCupom(str, ' ', '$');
              str := dm.organizarCupom(str, 'Vl. un.', '*');
              str := dm.organizarCupom(str, 'Total', '%');
              dm.imprime_linha_impNF(marca, modelo, str, False, False, False, False, False, False, False);
              dm.imprime_linha_impNF(marca, modelo, '------------------------------------------------------------', False, False, False, False, True, False, True);
            end;

        end;

      end;
    2:
      begin
        case modelo of
          1:
            begin

              dm.imprime_linha_impNF(marca, modelo, dm.centralizar(nome_fantasia, 24), True, False, False, True, False, True, False);
              dm.imprime_linha_impNF(marca, modelo, '------------------------------------------------', False, False, False, True, False, False, False);
              dm.imprime_linha_impNF(marca, modelo, dm.centralizar('Estorno de mesa', 24), True, False, False, True, False, True, False);
              dm.imprime_linha_impNF(marca, modelo, 'Mesa: ' + AMesa, True, False, False, False, True, True, True);
              str := FormatDateTime('DD/MM/YYY', Date) + ' ' + FormatDateTime('HH:MM:SS', Time);
              dm.imprime_linha_impNF(marca, modelo, str, False, False, False, False, True, False, False);
              str := 'Operador: ' + nome_usuario;
              dm.imprime_linha_impNF(marca, modelo, str, False, False, False, False, True, False, False);

              dm.imprime_linha_impNF(marca, modelo, '------------------------------------------------', False, False, False, True, False, False, False);

              if (layout = 1) then
              begin
                str := '########********************************';
                str := dm.organizarCupom(str, 'Cod.', '#');
                str := dm.organizarCupom(str, 'Descricao', '*');
                dm.imprime_linha_impNF(marca, modelo, str, False, False, False, False, True, False, False);
                str := '##########$$$$$***************%%%%%%%%%%%%%%';
                str := dm.organizarCupom(str, 'Qtd.', '#');
                str := dm.organizarCupom(str, ' ', '$');
                str := dm.organizarCupom(str, 'Vl. un.', '*');
                str := dm.organizarCupom(str, 'Total', '%');
              end
              else
              begin
                str := '###***************************%%%%%%%%%%%%%%';
                str := dm.organizarCupom(str, 'Qtd', '#');
                str := dm.organizarCupom(str, 'Descricao', '*');
                str := dm.organizarCupom(str, 'Total', '%');
              end;

              dm.imprime_linha_impNF(marca, modelo, str, False, False, False, False, True, False, False);
              dm.imprime_linha_impNF(marca, modelo, '------------------------------------------------', False, False, False, True, False, False, False);
            end;

          2:
            begin
                   //DARUMA DR600
              dm.imprime_linha_impNF(marca, modelo, '------------------------------------------------', False, False, False, True, False, False, False);
              dm.imprime_linha_impNF(marca, modelo, dm.centralizar('Estorno de mesa', 24), True, False, False, False, False, False, True);
              dm.imprime_linha_impNF(marca, modelo, 'Mesa: ' + AMesa, True, False, False, False, True, True, True);
              str := FormatDateTime('DD/MM/YYY', Date) + ' ' + FormatDateTime('HH:MM:SS', Time);
              dm.imprime_linha_impNF(marca, modelo, str, False, False, False, False, True, False, False);
              str := 'Operador: ' + nome_usuario;
              dm.imprime_linha_impNF(marca, modelo, str, False, False, False, False, True, False, False);

              dm.imprime_linha_impNF(marca, modelo, '------------------------------------------------', False, False, False, True, False, False, False);

              if (layout = 1) then
              begin
                str := '########********************************';
                str := dm.organizarCupom(str, 'Cod.', '#');
                str := dm.organizarCupom(str, 'Descricao', '*');
                dm.imprime_linha_impNF(marca, modelo, str, False, False, False, True, True, False, False);
                str := '##########$$$$$************************%%%%%%%%%%%%%%%%';
                str := dm.organizarCupom(str, 'Qtd.', '#');
                str := dm.organizarCupom(str, ' ', '$');
                str := dm.organizarCupom(str, 'Vl. un.', '*');
                str := dm.organizarCupom(str, 'Total', '%');
              end
              else
              begin
                str := '###***************************%%%%%%%%%%%%%%';
                str := dm.organizarCupom(str, 'Qtd', '#');
                str := dm.organizarCupom(str, 'Descricao', '*');
                str := dm.organizarCupom(str, 'Total', '%');
              end;

              dm.imprime_linha_impNF(marca, modelo, str, False, False, False, False, True, False, False);
              dm.imprime_linha_impNF(marca, modelo, '------------------------------------------------', False, False, False, True, False, False, False);
            end;

        end;
      end;

    3:
      begin

      end;
    4:
      begin
        case modelo of
          1:
            begin
              dm.imprime_linha_impNF(marca, modelo, dm.centralizar(nome_fantasia, 24), True, False, False, True, False, True, False);
              dm.imprime_linha_impNF(marca, modelo, '------------------------------------------------', False, False, False, True, False, False, False);
              dm.imprime_linha_impNF(marca, modelo, dm.centralizar('Estorno de mesa', 24), True, False, False, True, False, True, False);
              dm.imprime_linha_impNF(marca, modelo, 'Mesa: ' + AMesa, True, False, False, False, True, True, True);

              str := FormatDateTime('DD/MM/YYY', Date) + ' ' + FormatDateTime('HH:MM:SS', Time);
              dm.imprime_linha_impNF(marca, modelo, str, False, False, False, False, True, False, False);
              str := 'Operador: ' + nome_usuario;
              dm.imprime_linha_impNF(marca, modelo, str, False, False, False, False, True, False, False);

              dm.imprime_linha_impNF(marca, modelo, '------------------------------------------------', False, False, False, True, False, False, False);

              if (layout = 1) then
              begin
                str := '########********************************';
                str := dm.organizarCupom(str, 'Cod.', '#');
                str := dm.organizarCupom(str, 'Descricao', '*');
                dm.imprime_linha_impNF(marca, modelo, str, False, False, False, False, True, False, False);
                str := '##########$$$$$***************%%%%%%%%%%%%%%';
                str := dm.organizarCupom(str, 'Qtd.', '#');
                str := dm.organizarCupom(str, ' ', '$');
                str := dm.organizarCupom(str, 'Vl. un.', '*');
                str := dm.organizarCupom(str, 'Total', '%');
              end
              else
              begin
                str := '###***************************%%%%%%%%%%%%%%';
                str := dm.organizarCupom(str, 'Qtd', '#');
                str := dm.organizarCupom(str, 'Descricao', '*');
                str := dm.organizarCupom(str, 'Total', '%');
              end;

              dm.imprime_linha_impNF(marca, modelo, str, False, False, False, False, True, False, False);
              dm.imprime_linha_impNF(marca, modelo, '------------------------------------------------', False, False, False, True, False, False, False);

            end;
        end;

      end;

    5:
      begin  // Epson
        case modelo of
          1:
            begin    // Térmica TM-T88II

              dm.imprime_linha_impNF(marca, modelo, dm.centralizar(nome_fantasia, 30), True, False, False, True, False, True, False);
              dm.imprime_linha_impNF(marca, modelo, '--------------------------------------------------------', False, False, False, True, False, False, False);
              dm.imprime_linha_impNF(marca, modelo, dm.centralizar('Estorno de mesa', 24), True, False, False, True, False, True, False);
              dm.imprime_linha_impNF(marca, modelo, 'Mesa: ' + AMesa, True, False, False, False, True, True, True);
              str := FormatDateTime('DD/MM/YYY', Date) + ' ' + FormatDateTime('HH:MM:SS', Time);
              dm.imprime_linha_impNF(marca, modelo, str, False, False, False, False, True, False, False);
              str := 'Operador: ' + nome_usuario;
              dm.imprime_linha_impNF(marca, modelo, str, False, False, False, False, True, False, False);

              dm.imprime_linha_impNF(marca, modelo, '--------------------------------------------------------', False, False, False, True, False, False, False);

              if (layout = 1) then
              begin
                str := '########********************************';
                str := dm.organizarCupom(str, 'Cod.', '#');
                str := dm.organizarCupom(str, 'Descricao', '*');
                dm.imprime_linha_impNF(marca, modelo, str, False, False, False, False, False, False, False);
                str := '##########$$$$$***************%%%%%%%%%%%%%%';
                str := dm.organizarCupom(str, 'Qtd.', '#');
                str := dm.organizarCupom(str, ' ', '$');
                str := dm.organizarCupom(str, 'Vl. un.', '*');
                str := dm.organizarCupom(str, 'Total', '%');
              end
              else
              begin
                str := '###***************************%%%%%%%%%%%%%%';
                str := dm.organizarCupom(str, 'Qtd', '#');
                str := dm.organizarCupom(str, 'Descricao', '*');
                str := dm.organizarCupom(str, 'Total', '%');
              end;
              dm.imprime_linha_impNF(marca, modelo, '--------------------------------------------------------', False, False, False, True, False, False, False);
            end;

        end;

      end;
  end;

end;

function Tdm.imprimeCabecalhoRelatorioDiversoNF(marca: Integer; modelo: Integer; titulo: string): string;
var
  str: string;
begin

  dm.imprime_linha_impNF(marca, modelo, dm.centralizar(nome_fantasia, 30), True, False, False, True, False, True, False);
  dm.imprime_linha_impNF(marca, modelo, '--------------------------------------------------------', False, False, False, True, False, False, False);
  dm.imprime_linha_impNF(marca, modelo, dm.centralizar(titulo, 30), True, False, False, True, False, True, False);
  str := FormatDateTime('DD/MM/YYY', Date) + ' ' + FormatDateTime('HH:MM:SS', Time);
  dm.imprime_linha_impNF(marca, modelo, str, False, False, False, False, True, False, False);
  str := 'Operador: ' + nome_usuario;
  dm.imprime_linha_impNF(marca, modelo, str, False, False, False, False, True, False, False);

end;

function Tdm.getTotalPagamentosParciais(AMesa: string): Double;
var
  q: TIBQuery;
  formato, str: string;
begin

  q := TIBQuery.create(self);
  q.Database := dm.dbrestaurante;
  q.Transaction := dm.transacao;

  q.Active := False;
  q.SQL.Clear;
  q.SQL.Add('select sum(valor) as total  from recebimento_parcial');
  q.sql.add(' where mesa=' + QuotedStr(AMesa));
  q.Active := True;

  if (q.fieldbyname('total').value = Null) then
    result := 0
  else
    result := q.fieldbyname('total').value;

  q.Active := False;
  FreeAndNil(q);

end;

function Tdm.imprimeRecebimentosParciais(marca: Integer; modelo: Integer; AMesa: string): string;
var
  q: TIBQuery;
  formato, str: string;
begin

  q := TIBQuery.create(self);
  q.Database := dm.dbrestaurante;
  q.Transaction := dm.transacao;

  q.Active := False;
  q.SQL.Clear;
  q.SQL.Add('select r.*, f.descricao from recebimento_parcial r ');
  q.sql.add(' inner join formas_pagamento f on (f.cod_forma = r.cod_forma) ');
  q.sql.add(' where r.mesa=' + QuotedStr(AMesa));
  q.Active := True;
  q.First;

  if (q.IsEmpty = False) then
  begin
    case marca of

      1:
        begin
          case modelo of
            1:
              begin
                dm.imprime_linha_impNF(marca, modelo, '------------------------------------------------------------', False, False, False, True, True, False, False);
                dm.imprime_linha_impNF(marca, modelo, dm.centralizar('PAGAMENTOS PARCIAIS REALIZADOS', 60), False, False, False, True, True, False, False);
                dm.imprime_linha_impNF(marca, modelo, '', False, False, False, True, False, False, False);

                while not q.Eof do
                begin
                  formato := '############################ %%%%%%%%%';
                  str := formato;
                  str := dm.organizarCupom(str, q.fieldbyname('descricao').value, '#');
                  str := dm.organizarCupom(str, FormatFloat('R$ ###,###,##0.00 ', q.fieldbyname('valor').value), '%');
                  dm.imprime_linha_impNF(marca, modelo, str, False, False, False, False, False, False, False);
                  q.Next;
                end;

                dm.imprime_linha_impNF(marca, modelo, ' ', False, False, False, True, False, False, False);
                str := formato;
                str := dm.organizarCupom(str, 'Total', '#');
                str := dm.organizarCupom(str, FormatFloat('R$ ###,###,##0.00 ', getTotalPagamentosParciais(AMesa)), '%');
                dm.imprime_linha_impNF(marca, modelo, str, True, False, False, False, False, False, False);
              end;
          end;

        end;

      2:
        begin
          case modelo of
            2:
              begin
                dm.imprime_linha_impNF(marca, modelo, '------------------------------------------------', False, False, False, True, False, False, False);
                dm.imprime_linha_impNF(marca, modelo, dm.centralizar('PAGAMENTOS PARCIAIS REALIZADOS', 42), True, False, False, True, False, False, False);
                dm.imprime_linha_impNF(marca, modelo, '', False, False, False, True, False, False, False);
                while not q.Eof do
                begin
                  formato := '#################################%%%%%%%%%%%%%';
                  str := formato;
                  str := dm.organizarCupom(str, q.fieldbyname('descricao').value, '#');
                  str := dm.organizarCupom(str, FormatFloat('R$ ###,###,##0.00 ', q.fieldbyname('valor').value), '%');
                  dm.imprime_linha_impNF(marca, modelo, str, False, False, False, False, False, False, False);
                  q.Next;
                end;

                dm.imprime_linha_impNF(marca, modelo, ' ', False, False, False, True, False, False, False);
                str := formato;
                str := dm.organizarCupom(str, 'Total', '#');
                str := dm.organizarCupom(str, FormatFloat('R$ ###,###,##0.00 ', getTotalPagamentosParciais(AMesa)), '%');
                dm.imprime_linha_impNF(marca, modelo, str, True, False, False, False, False, False, False);
              end;
          end;
        end;

      4:
        begin
          case modelo of
            1:
              begin
                dm.imprime_linha_impNF(marca, modelo, '------------------------------------------------', False, False, False, True, False, False, False);
                dm.imprime_linha_impNF(marca, modelo, dm.centralizar('PAGAMENTOS PARCIAIS REALIZADOS', 48), False, False, False, True, False, False, False);
                dm.imprime_linha_impNF(marca, modelo, '', False, False, False, True, False, False, False);
                while not q.Eof do
                begin
                  formato := '#####################%%%%%%%%%%%%%%';
                  str := formato;
                  str := dm.organizarCupom(str, q.fieldbyname('descricao').value, '#');
                  str := dm.organizarCupom(str, FormatFloat('R$ ###,###,##0.00 ', q.fieldbyname('valor').value), '%');
                  dm.imprime_linha_impNF(marca, modelo, str, False, False, False, False, True, False, False);
                  q.Next;
                end;

                dm.imprime_linha_impNF(marca, modelo, ' ', False, False, False, True, False, False, False);
                str := formato;
                str := dm.organizarCupom(str, 'Total', '#');
                str := dm.organizarCupom(str, FormatFloat('R$ ###,###,##0.00 ', getTotalPagamentosParciais(AMesa)), '%');
                dm.imprime_linha_impNF(marca, modelo, str, False, False, False, True, False, False, False);
              end;
          end;
        end;

    end;
  end;

  q.Active := False;
  FreeAndNil(q);
end;

function Tdm.imprime_rodape_ExtratoContaNF(marca: Integer; modelo: Integer; tipo: Integer; nPessoas: Integer; subtotal: Double; couvert: Double; txServico: Double; repique: Double; desconto: Double; totalConta: Double; totalPago: Double; troco: Double; layout: Integer): string;
var
  str: string;
  formato: string;
begin
  case marca of
    1:
      begin
        case modelo of
          1:
            begin
              dm.imprime_linha_impNF(marca, modelo, '------------------------------------------------', True, False, False, False, False, False, False);
              str := '#########################%%%%%%%%%%%%%%%%%%%%%%';
              str := dm.organizarCupom(str, 'Subtotal:', '#');
              str := dm.organizarCupom(str, dm.alinha_valor_a_direita(20, FormatFloat('R$ ###,###,##0.00', (subtotal))), '%');
              dm.imprime_linha_impNF(marca, modelo, str, False, False, False, False, False, False, False);
              if (couvert > 0) then
              begin
                str := '#########################%%%%%%%%%%%%%%%%%%%%%%';
                str := dm.organizarCupom(str, 'Couvert:', '#');
                str := dm.organizarCupom(str, dm.alinha_valor_a_direita(20, FormatFloat('R$ ###,###,##0.00', (couvert))), '%');
                dm.imprime_linha_impNF(marca, modelo, str, False, False, False, False, False, False, False);
              end;

              if (txServico > 0) then
              begin
                str := '#########################%%%%%%%%%%%%%%%%%%%%%%';
                str := dm.organizarCupom(str, 'Serv.(opcional)', '#');
                str := dm.organizarCupom(str, dm.alinha_valor_a_direita(20, FormatFloat('R$ ###,###,##0.00', (txServico))), '%');
                dm.imprime_linha_impNF(marca, modelo, str, False, False, False, False, False, False, False);

              end;

              if (repique > 0) then
              begin
                str := '#########################%%%%%%%%%%%%%%%%%%%%%%';
                str := dm.organizarCupom(str, 'Repique:', '#');
                str := dm.organizarCupom(str, dm.alinha_valor_a_direita(20, FormatFloat('R$ ###,###,##0.00', (repique))), '%');
                dm.imprime_linha_impNF(marca, modelo, str, False, False, False, False, False, False, False);
              end;

              if (desconto > 0) then
              begin
                str := '#########################%%%%%%%%%%%%%%%%%%%%%%';
                str := dm.organizarCupom(str, 'Desconto', '#');
                str := dm.organizarCupom(str, dm.alinha_valor_a_direita(20, FormatFloat('R$ ###,###,##0.00', (desconto))), '%');
                dm.imprime_linha_impNF(marca, modelo, str, False, False, False, False, False, False, False);
              end;

              if ((totalPago > 0) and (tipo = 1)) then
              begin
                str := '#########################%%%%%%%%%%%%%%%%%%%%%%';
                str := dm.organizarCupom(str, 'Total real da conta:', '#');
                str := dm.organizarCupom(str, dm.alinha_valor_a_direita(20, FormatFloat('R$ ###,###,##0.00', (totalConta + totalPago))), '%');
                dm.imprime_linha_impNF(marca, modelo, str, False, False, False, False, False, False, False);

                str := '*******************************&&&&&&&&&&&&&&&&&';
                str := dm.organizarCupom(str, '', '*');
                str := dm.organizarCupom(str, '------------------', '&');
                dm.imprime_linha_impNF(1, 1, str, True, False, False, False, False, False, False);

                str := '#########################%%%%%%%%%%%%%%%%%%%%%%';
                str := dm.organizarCupom(str, 'Valor restante:', '#');
                str := dm.organizarCupom(str, dm.alinha_valor_a_direita(20, FormatFloat('R$ ###,###,##0.00', (totalConta))), '%');
                dm.imprime_linha_impNF(marca, modelo, str, True, False, False, False, False, False, False);
              end
              else
              begin
                str := '*******************************&&&&&&&&&&&&&&&&&';
                str := dm.organizarCupom(str, '', '*');
                str := dm.organizarCupom(str, '------------------', '&');
                dm.imprime_linha_impNF(1, 1, str, True, False, False, False, False, False, False);

                str := '#########################%%%%%%%%%%%%%%%%%%%%%%';
                str := dm.organizarCupom(str, 'TOTAL DA CONTA:', '#');
                str := dm.organizarCupom(str, dm.alinha_valor_a_direita(20, FormatFloat('R$ ###,###,##0.00', (totalConta))), '%');
                dm.imprime_linha_impNF(marca, modelo, str, True, False, False, False, False, False, False);
              end;

              if (nPessoas > 1) then
              begin
                dm.imprime_linha_impNF(marca, modelo, '------------------------------------------------', True, False, False, False, False, False, False);
                dm.imprime_linha_impNF(marca, modelo, dm.centralizar('DIVISAO DA CONTA', 60), True, False, False, True, True, False, False);

                str := '#########################%%%%%%%%%%%%%%%%%%%%%%';
                str := dm.organizarCupom(str, 'N. Pessoas:', '#');
                str := dm.organizarCupom(str, dm.alinha_valor_a_direita(20, IntToStr(nPessoas)), '%');
                dm.imprime_linha_impNF(marca, modelo, str, False, False, False, False, False, False, False);

                str := '#########################%%%%%%%%%%%%%%%%%%%%%%';
                str := dm.organizarCupom(str, 'Vl. por pessoa:', '#');
                str := dm.organizarCupom(str, dm.alinha_valor_a_direita(20, FormatFloat('R$ ###,###,##0.00', (totalConta / nPessoas))), '%');
                dm.imprime_linha_impNF(marca, modelo, str, False, False, False, False, False, False, False);
              end;

              if ((totalPago > 0) and (layout = 2)) then
              begin
                dm.imprime_linha_impNF(marca, modelo, '------------------------------------------------', False, False, False, False, False, False, False);
                str := '#########################%%%%%%%%%%%%%%%%%%%%%%';
                str := dm.organizarCupom(str, 'Total pago:', '#');
                str := dm.organizarCupom(str, alinha_valor_a_direita(10, FormatFloat('R$ ###,###,##0.00 ', totalPago)), '%');
                dm.imprime_linha_impNF(marca, modelo, str, False, False, False, False, False, False, False);
              end;

              if (troco > 0) then
              begin
                str := '#########################%%%%%%%%%%%%%%%%%%%%%%';
                str := dm.organizarCupom(str, 'Troco:', '#');
                str := dm.organizarCupom(str, alinha_valor_a_direita(10, FormatFloat('R$ ###,###,##0.00 ', troco)), '%');
                dm.imprime_linha_impNF(marca, modelo, str, False, False, False, False, False, False, False);
              end;

              dm.imprime_linha_impNF(marca, modelo, '------------------------------------------------', False, False, False, False, False, False, False);
              dm.imprime_linha_impNF(marca, modelo, dm.centralizar('Doc. de conferência', 40), True, False, False, False, False, False, False);
              dm.imprime_linha_impNF(marca, modelo, dm.centralizar('Não tem valor fiscal', 40), True, False, False, True, False, False, False);
              dm.imprime_linha_impNF(marca, modelo, dm.centralizar('Aguarde o seu cupom fiscal', 40), True, False, False, True, False, False, False);
              dm.imprime_linha_impNF(marca, modelo, '------------------------------------------------', False, False, False, False, False, False, False);
            end;
        end;
      end;
    2:
      begin
        case modelo of
          2:
            begin

                   //zarCupom(str,alinha_valor_a_direita(10, FormatFloat('R$ ###,###,##0.00 ',qryExtrato.fieldbyname('total').value)),'%');
              formato := '#################################%%%%%%%%%%%%%';
              dm.imprime_linha_impNF(marca, modelo, '------------------------------------------------', False, False, False, True, False, False, False);
              str := formato;
              str := dm.organizarCupom(str, 'N. Pessoas:', '#');
              str := dm.organizarCupom(str, IntToStr(nPessoas), '%');
              dm.imprime_linha_impNF(marca, modelo, str, False, False, False, False, False, False, False);

              str := formato;
              str := dm.organizarCupom(str, 'Subtotal:', '#');
              str := dm.organizarCupom(str, FormatFloat('R$ ###,###,##0.00 ', subtotal), '%');
              dm.imprime_linha_impNF(marca, modelo, str, False, False, False, False, False, False, False);

              if (couvert > 0) then
              begin
                str := formato;
                str := dm.organizarCupom(str, 'Couvert:', '#');
                str := dm.organizarCupom(str, FormatFloat('R$ ###,###,##0.00 ', couvert), '%');
                dm.imprime_linha_impNF(marca, modelo, str, False, False, False, False, False, False, False);
              end;

              if (txServico > 0) then
              begin
                str := formato;
                str := dm.organizarCupom(str, 'Serv.(opcional):', '#');
                str := dm.organizarCupom(str, FormatFloat('R$ ###,###,##0.00 ', txServico), '%');
                dm.imprime_linha_impNF(marca, modelo, str, False, False, False, False, False, False, False);
              end;

              if (repique > 0) then
              begin
                str := formato;
                str := dm.organizarCupom(str, 'Repique :', '#');
                str := dm.organizarCupom(str, FormatFloat('R$ ###,###,##0.00 ', repique), '%');
                dm.imprime_linha_impNF(marca, modelo, str, False, False, False, False, False, False, False);
              end;

              if (desconto > 0) then
              begin
                str := formato;
                str := dm.organizarCupom(str, 'Desconto:', '#');
                str := dm.organizarCupom(str, FormatFloat('R$ ###,###,##0.00 ', desconto), '%');
                dm.imprime_linha_impNF(marca, modelo, str, False, False, False, False, False, False, False);
              end;

              str := formato;
              str := dm.organizarCupom(str, 'Vl. por pessoa:', '#');
              str := dm.organizarCupom(str, FormatFloat('R$ ###,###,##0.00 ', ((totalConta) / nPessoas)), '%');
              dm.imprime_linha_impNF(marca, modelo, str, False, False, False, False, False, False, False);

              dm.imprime_linha_impNF(marca, modelo, '  ', False, False, False, False, False, False, False);

              formato := '####################%%%%%%%%%%%%%%%%%%%%%';
              str := formato;

              str := formato;
              if ((totalPago > 0) and (tipo = 1)) then
              begin
                str := dm.organizarCupom(str, 'Total real da conta:', '#');
                str := dm.organizarCupom(str, FormatFloat('R$ ###,###,##0.00 ', totalConta + totalPago), '%');
                dm.imprime_linha_impNF(marca, modelo, str, True, False, False, False, False, False, False);
                str := formato;
                str := dm.organizarCupom(str, 'Valor restante:', '#');
                str := dm.organizarCupom(str, FormatFloat('R$ ###,###,##0.00 ', totalConta), '%');
                dm.imprime_linha_impNF(marca, modelo, str, True, False, False, False, False, False, False);
              end
              else
              begin
                str := dm.organizarCupom(str, 'Total da conta:', '#');
                str := dm.organizarCupom(str, FormatFloat('<e>R$ ###,###,##0.00 ', totalConta), '%');
                dm.imprime_linha_impNF(marca, modelo, str, True, False, False, False, False, False, False);
              end;

              str := dm.organizarCupom(str, 'Total da conta:', '#');
              str := dm.organizarCupom(str, FormatFloat('<e>R$ ###,###,##0.00 ', totalConta), '%');
              dm.imprime_linha_impNF(marca, modelo, str, True, False, False, False, False, False, False);

              if ((totalPago > 0) and (layout = 2)) then
              begin
                str := formato;
                str := dm.organizarCupom(str, 'Total pago:', '#');
                str := dm.organizarCupom(str, alinha_valor_a_direita(10, FormatFloat('R$ ###,###,##0.00 ', totalPago)), '%');
                dm.imprime_linha_impNF(marca, modelo, str, False, False, False, False, False, False, False);
              end;

              if (troco > 0) then
              begin
                str := formato;
                str := dm.organizarCupom(str, 'Troco:', '#');
                str := dm.organizarCupom(str, alinha_valor_a_direita(10, FormatFloat('R$ ###,###,##0.00 ', troco)), '%');
                dm.imprime_linha_impNF(marca, modelo, str, False, False, False, False, False, False, False);
              end;

              dm.imprime_linha_impNF(marca, modelo, '------------------------------------------------', False, False, False, True, False, False, False);
              dm.imprime_linha_impNF(marca, modelo, dm.centralizar('Doc. de conferencia', 40), False, False, False, False, False, False, False);
              dm.imprime_linha_impNF(marca, modelo, dm.centralizar('Nao tem valor fiscal', 40), True, False, False, True, False, False, False);
              dm.imprime_linha_impNF(marca, modelo, dm.centralizar('Aguarde o seu cupom fiscal', 40), True, False, False, True, False, False, False);
              dm.imprime_linha_impNF(marca, modelo, '------------------------------------------------', False, False, False, True, False, False, False);

            end;
        end;
      end;
    3:
      begin

      end;
    4:
      begin
        case modelo of
          1:
            begin
              formato := '#####################%%%%%%%%%%%%%%';
              dm.imprime_linha_impNF(marca, modelo, '------------------------------------------------', False, False, False, True, False, False, False);
              str := formato;
              str := dm.organizarCupom(str, 'N. Pessoas:', '#');
              str := dm.organizarCupom(str, IntToStr(nPessoas), '%');
              dm.imprime_linha_impNF(marca, modelo, str, False, False, False, False, True, False, False);

              str := formato;
              str := dm.organizarCupom(str, 'Subtotal:', '#');
              str := dm.organizarCupom(str, FormatFloat('R$ ###,###,##0.00 ', subtotal), '%');
              dm.imprime_linha_impNF(marca, modelo, str, False, False, False, False, True, False, False);

              if (couvert > 0) then
              begin
                str := formato;
                str := dm.organizarCupom(str, 'Couvert:', '#');
                str := dm.organizarCupom(str, FormatFloat('R$ ###,###,##0.00 ', couvert), '%');
                dm.imprime_linha_impNF(marca, modelo, str, False, False, False, False, True, False, False);
              end;

              if (txServico > 0) then
              begin
                str := formato;
                str := dm.organizarCupom(str, 'Serv.(opcional):', '#');
                str := dm.organizarCupom(str, FormatFloat('R$ ###,###,##0.00 ', txServico), '%');
                dm.imprime_linha_impNF(marca, modelo, str, False, False, False, False, True, False, False);
              end;

              if (repique > 0) then
              begin
                str := formato;
                str := dm.organizarCupom(str, 'Repique):', '#');
                str := dm.organizarCupom(str, FormatFloat('R$ ###,###,##0.00 ', repique), '%');
                dm.imprime_linha_impNF(marca, modelo, str, False, False, False, False, True, False, False);
              end;

              if (desconto > 0) then
              begin
                str := formato;
                str := dm.organizarCupom(str, 'Desconto:', '#');
                str := dm.organizarCupom(str, FormatFloat('R$ ###,###,##0.00 ', desconto), '%');
                dm.imprime_linha_impNF(marca, modelo, str, False, False, False, False, True, False, False);
              end;

              str := formato;
              str := dm.organizarCupom(str, 'Vl. por pessoa:', '#');
              str := dm.organizarCupom(str, FormatFloat('R$ ###,###,##0.00 ', (totalConta / nPessoas)), '%');
              dm.imprime_linha_impNF(marca, modelo, str, False, False, False, False, True, False, False);

              str := formato;

              str := formato;
              if ((totalPago > 0) and (tipo = 1)) then
              begin
                str := dm.organizarCupom(str, 'Total real da conta:', '#');
                str := dm.organizarCupom(str, FormatFloat('R$ ###,###,##0.00 ', totalConta + totalPago), '%');
                dm.imprime_linha_impNF(marca, modelo, str, True, False, False, False, True, False, False);
                str := formato;
                str := dm.organizarCupom(str, 'Valor restante:', '#');
                str := dm.organizarCupom(str, FormatFloat('R$ ###,###,##0.00 ', totalConta), '%');
                dm.imprime_linha_impNF(marca, modelo, str, True, False, False, False, True, False, False);
              end
              else
              begin
                str := dm.organizarCupom(str, 'Total da conta:', '#');
                str := dm.organizarCupom(str, FormatFloat('R$ ###,###,##0.00 ', totalConta), '%');
                dm.imprime_linha_impNF(marca, modelo, str, True, False, False, False, True, False, False);
              end;

              if ((totalPago > 0) and (layout = 2)) then
              begin
                str := formato;
                str := dm.organizarCupom(str, FormatFloat('R$ ###,###,##0.00 ', totalPago), '%');
                dm.imprime_linha_impNF(marca, modelo, str, False, False, False, False, True, False, False);
              end;

              if (troco > 0) then
              begin
                str := formato;
                str := dm.organizarCupom(str, 'Troco:', '#');
                str := dm.organizarCupom(str, FormatFloat('R$ ###,###,##0.00 ', troco), '%');
                dm.imprime_linha_impNF(marca, modelo, str, False, False, False, False, True, False, False);
              end;

              dm.imprime_linha_impNF(marca, modelo, '------------------------------------------------', False, False, False, True, False, False, False);
              dm.imprime_linha_impNF(marca, modelo, dm.centralizar('Documento para simples conferência', 48), False, False, False, True, False, False, False);
              dm.imprime_linha_impNF(marca, modelo, dm.centralizar('Não tem valor fiscal', 48), True, False, False, True, False, False, False);
              dm.imprime_linha_impNF(marca, modelo, '------------------------------------------------', False, False, False, True, False, False, False);

            end;

        end;

      end;

    5:
      begin  // Epson
        case modelo of
          1:
            begin    // Térmica TM-T88II
              dm.imprime_linha_impNF(marca, modelo, '--------------------------------------------------------', False, False, False, True, False, False, False);
              str := '##########################%%%%%%%%%%%%%%';
              str := dm.organizarCupom(str, 'Subtotal:', '#');
              str := dm.organizarCupom(str, dm.alinha_valor_a_direita(12, FormatFloat('R$ ###,###,##0.00', (subtotal))), '%');
              dm.imprime_linha_impNF(marca, modelo, str, False, False, False, False, True, False, False);
              if (couvert > 0) then
              begin
                str := '##########################%%%%%%%%%%%%%%';
                str := dm.organizarCupom(str, 'Couvert:', '#');
                str := dm.organizarCupom(str, dm.alinha_valor_a_direita(12, FormatFloat('R$ ###,###,##0.00', (couvert))), '%');
                dm.imprime_linha_impNF(marca, modelo, str, False, False, False, False, True, False, False);
              end;

              if (txServico > 0) then
              begin
                str := '##########################%%%%%%%%%%%%%%';
                str := dm.organizarCupom(str, 'Serv.(opcional):', '#');
                str := dm.organizarCupom(str, dm.alinha_valor_a_direita(12, FormatFloat('R$ ###,###,##0.00', (txServico))), '%');
                dm.imprime_linha_impNF(marca, modelo, str, False, False, False, False, True, False, False);
              end;

              if (repique > 0) then
              begin
                str := '##########################%%%%%%%%%%%%%%';
                str := dm.organizarCupom(str, 'Repique:', '#');
                str := dm.organizarCupom(str, dm.alinha_valor_a_direita(12, FormatFloat('R$ ###,###,##0.00', (repique))), '%');
                dm.imprime_linha_impNF(marca, modelo, str, False, False, False, False, True, False, False);
              end;

              if (desconto > 0) then
              begin
                str := '##########################%%%%%%%%%%%%%%';
                str := dm.organizarCupom(str, 'Desconto', '#');
                str := dm.organizarCupom(str, dm.alinha_valor_a_direita(12, FormatFloat('R$ ###,###,##0.00', (desconto))), '%');
                dm.imprime_linha_impNF(marca, modelo, str, False, False, False, False, True, False, False);
              end;

              if ((totalPago > 0) and (tipo = 1)) then
              begin
                str := '##########################%%%%%%%%%%%%%%';
                str := dm.organizarCupom(str, 'Total real da conta:', '#');
                str := dm.organizarCupom(str, dm.alinha_valor_a_direita(12, FormatFloat('R$ ###,###,##0.00', (totalConta + totalPago))), '%');
                dm.imprime_linha_impNF(marca, modelo, str, False, False, False, False, True, False, False);

                str := '*************************&&&&&&&&&&&&&&&';
                str := dm.organizarCupom(str, '', '*');
                str := dm.organizarCupom(str, '-------------------', '&');
                dm.imprime_linha_impNF(marca, modelo, str, True, False, False, False, False, False, False);

                str := '##########################%%%%%%%%%%%%%%';
                str := dm.organizarCupom(str, 'Valor restante:', '#');
                str := dm.organizarCupom(str, dm.alinha_valor_a_direita(12, FormatFloat('R$ ###,###,##0.00', (totalConta))), '%');
                dm.imprime_linha_impNF(marca, modelo, str, True, False, False, False, True, False, False);
              end
              else
              begin
                str := '*************************&&&&&&&&&&&&&&&';
                str := dm.organizarCupom(str, '', '*');
                str := dm.organizarCupom(str, '-------------------', '&');
                dm.imprime_linha_impNF(marca, modelo, str, True, False, False, False, False, False, False);

                str := '##########################%%%%%%%%%%%%%%';
                str := dm.organizarCupom(str, 'TOTAL DA CONTA:', '#');
                str := dm.organizarCupom(str, dm.alinha_valor_a_direita(12, FormatFloat('R$ ###,###,##0.00', (totalConta))), '%');
                dm.imprime_linha_impNF(marca, modelo, str, True, False, False, False, False, False, False);
              end;

              if (nPessoas > 1) then
              begin
                dm.imprime_linha_impNF(marca, modelo, '--------------------------------------------------------', False, False, False, True, False, False, False);
                dm.imprime_linha_impNF(marca, modelo, dm.centralizar('DIVISAO DA CONTA', 60), True, False, False, True, True, False, False);

                str := '##########################%%%%%%%%%%%%%%';
                str := dm.organizarCupom(str, 'N. Pessoas:', '#');
                str := dm.organizarCupom(str, dm.alinha_valor_a_direita(12, IntToStr(nPessoas)), '%');
                dm.imprime_linha_impNF(marca, modelo, str, True, False, False, False, False, False, False);

                str := '##########################%%%%%%%%%%%%%%';
                str := dm.organizarCupom(str, 'Vl. por pessoa:', '#');
                str := dm.organizarCupom(str, dm.alinha_valor_a_direita(12, FormatFloat('R$ ###,###,##0.00', (totalConta / nPessoas))), '%');
                dm.imprime_linha_impNF(marca, modelo, str, True, False, False, False, False, False, False);
              end;

              if ((totalPago > 0) and (layout = 2)) then
              begin
                dm.imprime_linha_impNF(marca, modelo, '--------------------------------------------------------', False, False, False, True, False, False, False);
                str := '##########################%%%%%%%%%%%%%%';
                str := dm.organizarCupom(str, 'TOTAL PAGO:    ', '#');
                str := dm.organizarCupom(str, dm.alinha_valor_a_direita(12, FormatFloat('R$ ###,###,##0.00', totalPago)), '%');
                dm.imprime_linha_impNF(marca, modelo, str, True, False, False, False, False, False, False);
              end;

              if (troco > 0) then
              begin
                str := '##########################%%%%%%%%%%%%%%';
                str := dm.organizarCupom(str, 'Troco:', '#');
                str := dm.organizarCupom(str, alinha_valor_a_direita(12, FormatFloat('R$ ###,###,##0.00 ', troco)), '%');
                dm.imprime_linha_impNF(marca, modelo, str, True, False, False, False, False, False, False);
              end;

              dm.imprime_linha_impNF(marca, modelo, '--------------------------------------------------------', False, False, False, True, False, False, False);
              dm.imprime_linha_impNF(marca, modelo, dm.centralizar('Doc. de conferência', 40), True, False, False, False, False, False, False);
              dm.imprime_linha_impNF(marca, modelo, dm.centralizar('Não tem valor fiscal', 40), True, False, False, False, False, False, False);
              dm.imprime_linha_impNF(marca, modelo, dm.centralizar('Aguarde o seu cupom fiscal', 40), True, False, False, False, False, False, False);
              dm.imprime_linha_impNF(marca, modelo, '--------------------------------------------------------', False, False, False, True, False, False, False);
            end;
        end;

      end;
  end;

  dm.imprime_linha_impNF(marca, modelo, '', False, False, False, True, False, False, False);
  dm.imprime_linha_impNF(marca, modelo, '', False, False, False, True, False, False, False);
  dm.imprime_linha_impNF(marca, modelo, '', False, False, False, True, False, False, False);
  dm.imprime_linha_impNF(marca, modelo, '', False, False, False, True, False, False, False);
  dm.imprime_linha_impNF(marca, modelo, '', False, False, False, True, False, False, False);
  dm.imprime_linha_impNF(marca, modelo, '', False, False, False, True, False, False, False);
  dm.imprime_linha_impNF(marca, modelo, '', False, False, False, True, False, False, False);
  dm.imprime_linha_impNF(marca, modelo, '', False, False, False, True, False, False, False);

//   cortaPapelImpNF(marca,modelo);
end;

procedure Tdm.exibe_painel_erro(mensagem: string; captionBotao: string; ATipoDialogo: TMsgDlgType = mtError);
var
  LTipoMensagem: TTipoMensagem;
begin
  case ATipoDialogo of
    TMsgDlgType.mtWarning:
      LTipoMensagem := tmAviso;
    TMsgDlgType.mtError:
      LTipoMensagem := tmErro;
    TMsgDlgType.mtInformation:
      LTipoMensagem := tmAviso;
    TMsgDlgType.mtConfirmation:
      LTipoMensagem := tmConfirmacao;
    TMsgDlgType.mtCustom:
      LTipoMensagem := tmSucesso;
  end;
//  Clipboard.AsText := mensagem;
  showRealDialog(frm_principal, LTipoMensagem, '', mensagem, 16, false);
end;

procedure Tdm.exibe_painel_troco(mensagem: string; troco: string);
begin
  Application.CreateForm(TfrmPainelTroco, frmPainelTroco);
//  frmPainelTroco.Memo1.lines.add(mensagem);
  frmPainelTroco.pn_troco.Caption := troco;
  frmPainelTroco.Showmodal;
  FreeAndNil(frmPainelTroco);

end;

procedure Tdm.EncerraPainelDeErros();
begin
  frm_painel_erros.close;
end;

procedure Tdm.imprimirFichas(codVenda: string);
var
  q: TIBQuery;
  ct: SmallInt;
begin

  q := TIBQuery.create(self);
  q.Database := dm.dbrestaurante;
  q.Transaction := dm.transacao;

  q.Active := False;
  q.SQL.Clear;

  q.SQL.Add('  select mv.id,p.descricao, mv.quantidade   from movimento_venda mv ');
  q.SQL.Add('   inner join produtos p on (p.cod_produto = mv.cod_produto)');
  q.SQL.Add('    where mv.cod_venda=' + QuotedStr(codVenda));
  q.SQL.Add('     and p.imprimir_ficha=1 ');
  q.Active := True;
  q.FetchAll;

  if not q.IsEmpty then
  begin

    if FileExists(caminhoArquivoExtrato) then
      DeleteFile(caminhoArquivoExtrato);

    while not q.Eof do
    begin
      for ct := 1 to q.FieldByName('quantidade').value do
      begin
        adicionaLinhaArquivoExtrato('</zera>  ');
        adicionaLinhaArquivoExtrato('</linha_dupla>');
        adicionaLinhaArquivoExtrato('<ce><e>' + nome_fantasia + '</e></ce>');
        adicionaLinhaArquivoExtrato('</linha_dupla>');
        adicionaLinhaArquivoExtrato(FormatDateTime('DD/MM/YYY', Date) + ' ' + FormatDateTime('HH:MM:SS', Time));
        adicionaLinhaArquivoExtrato('Caixa Nº: ' + ultimoCaixaAberto);
        adicionaLinhaArquivoExtrato('Operador: ' + nome_usuario_responsavel);
        adicionaLinhaArquivoExtrato('<ce><e>Ficha id nº ' + IntToStr(q.FieldByName('id').value) + '</e></ce>');
//             adicionaLinhaArquivoExtrato('</ce><e>'+Inttostr(ct)+' de '+Inttostr(q.FieldByName('quantidade').value)+'</e>');
        adicionaLinhaArquivoExtrato('</linha_simples>');
        adicionaLinhaArquivoExtrato('<e>' + q.FieldByName('descricao').value + '</e>');
        adicionaLinhaArquivoExtrato('</linha_simples>');
        adicionaLinhaArquivoExtrato('</ce><ean13>' + IntToStr(q.FieldByName('id').value) + '</ean13>');
        adicionaLinhaArquivoExtrato('</fn><ce>Válida por até 2 horas após a compra </ce>');
        adicionaLinhaArquivoExtrato('</linha_simples>');
        adicionaLinhaArquivoExtrato('</corte_parcial>');

      end;

      q.Next;
    end;

    ACBrPosPrinter1.LinhasEntreCupons := StrToInt(dm.LeIni(1, 'IMPRESSORA_NAO_FISCAL_01', 'linhasAposCupom'));
    frm_principal.memo_avisos.Lines.LoadFromFile(caminhoArquivoExtrato);
    ////dm.adicionalog(frm_principal.memo_avisos.Lines.Text);
    imprimeTextoMiniPrinter(frm_principal.memo_avisos.Lines.Text);

  end;

  q.Active := False;
  FreeAndNil(q);

end;

function Tdm.verificaPermissaoAcao(modulo: string; exibirMensagem: Boolean; solicitarUsuario: Boolean): Boolean;
begin

  codigo_usuario_responsavel := codigo_usuario;
  nome_usuario_responsavel := nome_usuario;
  nome_comp_usuario_responsavel := nome_completo_usuario;

  if (dm.verifica_permissao(Trim(Copy(modulo, 2, 5)), Trim(Copy(modulo, 7, 15)), codigo_usuario, False) = False) then
  begin
    Result := False;
    if solicitarUsuario then
    begin
      Application.CreateForm(TfrmLoginTouch, frmLoginTouch);
      frmLoginTouch.setTipoOperacao(tPermissaoAcesso);
      frmLoginTouch.ShowModal;
      frmLoginTouch.free;

      if (dm.verifica_permissao(Trim(Copy(modulo, 2, 5)), Trim(Copy(modulo, 7, 15)), codigo_usuario_responsavel, False) = True) then
        Result := True
      else
        Result := False
    end;

  end
  else
    Result := True;

  if (Result = False) and (exibirMensagem = True) then
  begin
    exibe_painel_erro('Você não possui permissão para executar a função selecionada!', 'Ok');
  end;

end;

function Tdm.verifica_intervalo_hora(horaIni: string; horaFim: string): Boolean;
var
  horaInicial, minutoInicial: Integer;
  horaFinal, minutoFinal: Integer;
begin
  horaInicial := StrToInt(Copy(horaIni, 0, 2));
  minutoInicial := StrToInt(Copy(horaIni, 3, 2));

  horaFinal := StrToInt(Copy(horaFim, 0, 2));
  minutoFinal := StrToInt(Copy(horaFim, 3, 2));

  if (horaInicial <> horaFinal) then
  begin
    Result := False;
  end
  else
  begin
    minutoInicial := minutoInicial - minutoFinal;
    if (moduloNumero(minutoInicial) > 15) then
      Result := False
    else
      Result := True;
  end;
end;

function Tdm.moduloNumero(numero: Integer): Integer;
begin
  if (numero < 0) then
    numero := numero *  - 1;

  result := numero;
end;

function Tdm.asteriscos(qtd: Integer): string;
var
  cont: Integer;
begin
  cont := 0;
  while (cont <= qtd) do
  begin
    result := result + '*';
    cont := cont + 1;
  end;
end;
// * * * Dica extraída do Deephi 2.0 * * * //
// * * * * [Evoluindo sem Limites] * * * * //
// * * * * Número: 0197 Testada:  * * * * //

function Tdm.PadC(S: string; Len: Byte): string;
var
  Str: string;
  L: Byte;
begin
  Str := '';
  if Len < Length(S) then
  begin
    Result := '';
    Exit;
  end;
  L := (Len - Length(S)) div 2;
  while L > 0 do
  begin
    Str := Str + ' ';
    Dec(L);
  end;
  for L := 1 to Length(S) do
  begin
    Str := Str + S[L];
  end;
  Result := Str;
end;

function Tdm.BuscaTroca(Text, Busca, Troca: string): string;
var
  n: Integer;
  achou: Boolean;
begin
  n := 0;
  achou := False;

  while ((n < Length(Text)) and (achou = False)) do//for n := 1 to length(Text) do
  begin
    if Copy(Text, n, 1) = Busca then
    begin
      Delete(Text, n, 1);
      Insert(Troca, Text, n);
      achou := True;
    end;
    n := n + 1;
  end;
  Result := Text;
end;

procedure Tdm.ComPortRxChar(Sender: TObject; Count: Integer);
begin
// Comentado
//  comport.ReadStr(RetornoPorta,count);
  ShowMessage(RetornoPorta);
end;

function Tdm.retiraCaracter(Text, Busca, Troca: string): string;
var
  n: Integer;
  achou: Boolean;
begin
  n := 1;

  while ((n <= Length(Text))) do//for n := 1 to length(Text) do
  begin
    if Copy(Text, n, 1) = Busca then
    begin
      Delete(Text, n, 1);
      Insert(Troca, Text, n);
      achou := True;
    end;
    n := n + 1;
  end;
  Result := Text;
end;

function Tdm.removeCaracteres(Text: string): string;
var
  n: Integer;
  total: Integer;
  contador: Integer;
  achou: Boolean;
  chars: array[1..11] of string;
begin
  total := 11;
  contador := 1;

  chars[1] := 'ç';
  chars[2] := 'Ç';
  chars[3] := ':';
  chars[4] := '?';
  chars[5] := ';';
  chars[6] := '.';
  chars[7] := ',';
  chars[8] := '/';
  chars[9] := '-';
  chars[10] := 'R';
  chars[11] := '$';

  while (contador <= total) do
  begin

    n := 1;
    while ((n <= Length(Text))) do//for n := 1 to length(Text) do
    begin
      if Copy(Text, n, 1) = chars[contador] then
      begin
        Delete(Text, n, 1);
        achou := True;
      end;
      n := n + 1;
    end;
    contador := contador + 1;
  end;

  Result := Text;
end;

function Tdm.organizarCupom(str: string; str2: string; chr: string): string;
var
  ct: Integer;
  tam: Integer;
begin

  tam := StrLen(PChar(str2));
  ct := 1;
  result := str;
  while (ct <= tam) do
  begin
    result := BuscaTroca(result, chr, Copy(str2, ct, 1));
    ct := ct + 1;
  end;

  Result := retiraCaracter(result, chr, ' ');
end;

function Tdm.trocaCaracteresEpson(str: string): string;
begin

  str := BuscaTroca(str, 'ç', chr(135));
  str := BuscaTroca(str, 'Ç', chr(128));

  str := BuscaTroca(str, 'é', chr(130));
  str := BuscaTroca(str, 'É', chr(144));
  str := BuscaTroca(str, 'ê', chr(136));
  str := BuscaTroca(str, 'Ê', chr(202));

  str := BuscaTroca(str, 'í', chr(161));

  str := BuscaTroca(str, 'á', chr(160));
  str := BuscaTroca(str, 'â', chr(131));
  str := BuscaTroca(str, 'ã', chr(227));
  str := BuscaTroca(str, 'Á', chr(181));
  str := BuscaTroca(str, 'À', chr(183));
  str := BuscaTroca(str, 'Ã', chr(195));

  str := BuscaTroca(str, 'ô', chr(147));
  str := BuscaTroca(str, 'ó', chr(162));
  Result := str;

end;

procedure Tdm.atualizaTentativasEnvioNFCE(observacao: string; codVenda: string);
var
  q: TIBQuery;
begin

  q := TIBQuery.Create(self);
  q.Database := DBRESTAURANTE;
  q.Transaction := transLog;

  q.Active := False;
  q.SQL.Clear;
  q.SQL.Add(' update vendas v set v.TENTATIVAS_ENVIO_NFCE = TENTATIVAS_ENVIO_NFCE +1,');
  q.SQL.Add('  v.OBS_NFCE=' + QuotedStr(observacao));
  q.SQL.Add('  where v.cod_venda=' + QuotedStr(codVenda));

  adicionaLog('SQL da tentativa de autualização de tentativas: ' + q.SQL.Text);

  try
    begin
      q.ExecSQL;
      ////dm.adicionalog('Atualizou tentativas com sucesso!');
    end;
  except
    on E: Exception do
    begin
      ////dm.adicionalog('Erro ao atualizar tentativas de envio de NFC-e ' + E.Message);
      Exit;
    end;
  end;

  if transLog.Active = False then
    transLog.Active := True;
  transLog.Commit;

  FreeAndNil(q);
end;

procedure Tdm.insereExtratosEmitidos(AMesa: string);
var
  q: TIBQuery;
begin

  q := TIBQuery.Create(self);
  q.Database := DBRESTAURANTE;
  q.Transaction := transLog;

  q.SQL.Add('  insert into extratos_emitidos (mesa, valor_couvert, ');
  q.SQL.Add('                                 valor_servico,data,hora_emissao, cod_usuario)');
  q.SQL.Add('        select mesa_saida,');
  q.SQL.Add(' 0,r.valortxserv,current_date, current_time,');
  q.SQL.Add('               ' + QuotedStr(codigo_usuario));
  q.SQL.Add('   from rodapeextrato3(' + QuotedStr(AMesa) + ' ,0)  r');

  try
    begin
      q.ExecSQL;
    end;
  except
    begin
      ShowMessage('Ocorreu um erro no sistema!  Um log de erros foi criado no formato DATA+HORA na pasta logs do Sistema. Abra o arquivo e envio por fax ou email para a Real Systems');
      dm.cria_log_de_erros(q.sql, 'Módulo de caixa', 'Erro ao inserir em extratos emitidos', codigo_usuario);
      Exit;
    end;
  end;

  if transLog.Active = False then
    transLog.Active := True;
  transLog.Commit;

  FreeAndNil(q);
end;

function Tdm.getUltimoExtratoEmitidoMesa(AMesa: string): TextratoEmitido;
var
  q: TIBQuery;
begin
  q := TIBQuery.Create(self);
  q.Database := DBRESTAURANTE;
  q.Transaction := transLog;

  q.Active := False;
  q.SQL.Clear;
  q.sql.add('select * from extratos_emitidos where mesa=' + QuotedStr(AMesa) + ' order by hora_emissao');
  q.active := True;
  q.Last;

  Result := TextratoEmitido.Create();

  if (q.IsEmpty) then
  begin
    Result.extratoValido := 0;
    Result.tipoDesconto := 0;
    Result.valorDesconto := 0;
    Result.valorCouvert := 0;
    Result.valorServico := 0;
    Result.codUsuario := '';
  end
  else
  begin
    Result.extratoValido := 1;
    Result.tipoDesconto := q.fieldbyname('tipo_desconto').value;
    Result.valorDesconto := q.fieldbyname('valor_desconto').value;
    Result.valorCouvert := q.fieldbyname('valor_couvert').value;
    Result.valorServico := q.fieldbyname('valor_servico').value;
    Result.codUsuario := q.fieldbyname('cod_usuario').value;
  end;

  FreeAndNil(q);
end;

procedure Tdm.apagaExtratosEmitidos(AMesa: string);
var
  q: TIBQuery;
begin

  q := TIBQuery.Create(self);
  q.Database := DBRESTAURANTE;
  q.Transaction := transLog;

  q.Active := False;
  q.SQL.Clear;
  q.SQL.Add('delete from extratos_emitidos where mesa=' + QuotedStr(AMesa));

  try
    begin
      q.ExecSQL;
    end;
  except
    begin
      ShowMessage('Ocorreu um erro no sistema!  Um log de erros foi criado no formato DATA+HORA na pasta logs do Sistema. Abra o arquivo e envio por fax ou email para a Real Softwares');
      dm.cria_log_de_erros(q.sql, 'Módulo de caixa', 'Erro ao apagar  extratos emitidos', codigo_usuario);
      Exit;
    end;
  end;

  if transLog.Active = False then
    transLog.Active := True;
  transLog.Commit;

  FreeAndNil(q);

end;

procedure Tdm.ApagaAberturaDaMesa(AMesa: string);
var
  q: TIBQuery;
begin

  q := TIBQuery.Create(self);
  q.Database := DBRESTAURANTE;
  q.Transaction := transLog;

  q.Active := False;
  q.SQL.Clear;
  q.SQL.Add('delete from informacoes_mesa where mesa=' + QuotedStr(AMesa));

  try
    begin
      q.ExecSQL;
    end;
  except
    begin
      ShowMessage('Ocorreu um erro no sistema!  Um log de erros foi criado no formato DATA+HORA na pasta logs do Sistema. Abra o arquivo e envio por fax ou email para a Real Systems');
      dm.cria_log_de_erros(q.sql, 'Módulo de caixa', 'Erro ao apagar LOG de MESA', codigo_usuario);
      Exit;
    end;
  end;

  if transLog.Active = False then
    transLog.Active := True;
  transLog.Commit;

  FreeAndNil(q);
end;

function Tdm.verificaExtratosEmitidos(AMesa: string): Boolean;
var
  q: TIBQuery;
begin
  q := TIBQuery.Create(self);
  q.Database := DBRESTAURANTE;
  q.Transaction := transacao;

  q.Active := False;
  q.SQL.Clear;
  q.sql.add('select * from extratos_emitidos where mesa=' + QuotedStr(AMesa));
  q.active := True;

  if q.isempty then
    result := False
  else
    result := True;

  q.Active := False;
// Q.Destroy;
  FreeAndNil(q);

end;

procedure Tdm.imprimeListagemMesasAbertas(marca: Integer; modelo: Integer);
var
  q: TIBQuery;
  str: string;
begin

  q := TIBQuery.Create(self);
  q.Database := DBRESTAURANTE;
  q.transaction := transacao;
  q.active := False;
  q.sql.clear;
  q.sql.add('select sum(quantidade),cod_mesa from movimento_mesa group by cod_mesa');
  q.active := True;
  q.first;

  case marca of
    2:
      begin
        case modelo of
          2:
            begin
              dm.imprime_linha_impNF(marca, modelo, dm.centralizar(nome_fantasia, 24), True, False, False, True, False, True, False);
              dm.imprime_linha_impNF(marca, modelo, '------------------------------------------------', False, False, False, True, False, False, False);
              dm.imprime_linha_impNF(marca, modelo, dm.centralizar('Mesas abertas', 24), True, False, False, True, False, True, False);
              str := FormatDateTime('DD/MM/YYY', Date) + ' ' + FormatDateTime('HH:MM:SS', Time);
              dm.imprime_linha_impNF(marca, modelo, str, False, False, False, False, True, False, False);
              str := 'Operador: ' + nome_usuario;
              dm.imprime_linha_impNF(marca, modelo, str, False, False, False, False, True, False, False);
              dm.imprime_linha_impNF(marca, modelo, '------------------------------------------------', False, False, False, True, False, False, False);

              while not q.Eof do
              begin
                dm.imprime_linha_impNF(marca, modelo, q.fieldbyname('cod_mesa').value, False, False, False, True, False, False, False);
                q.Next;
              end;

            end;
        end;

      end;

    4:
      begin
        case modelo of
          1:
            begin
              dm.imprime_linha_impNF(marca, modelo, dm.centralizar(nome_fantasia, 24), True, False, False, True, False, True, False);
              dm.imprime_linha_impNF(marca, modelo, '------------------------------------------------', False, False, False, True, False, False, False);
              dm.imprime_linha_impNF(marca, modelo, dm.centralizar('Mesas abertas', 24), True, False, False, True, False, True, False);
              str := FormatDateTime('DD/MM/YYY', Date) + ' ' + FormatDateTime('HH:MM:SS', Time);
              dm.imprime_linha_impNF(marca, modelo, str, False, False, False, False, True, False, False);
              str := 'Operador: ' + nome_usuario;
              dm.imprime_linha_impNF(marca, modelo, str, False, False, False, False, True, False, False);
              dm.imprime_linha_impNF(marca, modelo, '------------------------------------------------', False, False, False, True, False, False, False);

              while not q.Eof do
              begin
                dm.imprime_linha_impNF(marca, modelo, q.fieldbyname('cod_mesa').value, False, False, False, True, False, False, False);
                q.Next;
              end;

            end;
        end;
      end;

    5:
      begin
        case modelo of
          1:
            begin
              dm.imprime_linha_impNF(marca, modelo, dm.centralizar(nome_fantasia, 30), True, False, False, True, False, True, False);
              dm.imprime_linha_impNF(marca, modelo, '------------------------------------------------', False, False, False, True, False, False, False);
              dm.imprime_linha_impNF(marca, modelo, dm.centralizar('Mesas abertas', 30), True, False, False, True, False, True, False);
              str := FormatDateTime('DD/MM/YYY', Date) + ' ' + FormatDateTime('HH:MM:SS', Time);
              dm.imprime_linha_impNF(marca, modelo, str, False, False, False, False, True, False, False);
              str := 'Operador: ' + nome_usuario;
              dm.imprime_linha_impNF(marca, modelo, str, False, False, False, False, True, False, False);
              dm.imprime_linha_impNF(marca, modelo, '------------------------------------------------', False, False, False, True, False, False, False);

              while not q.Eof do
              begin
                dm.imprime_linha_impNF(marca, modelo, q.fieldbyname('cod_mesa').value, False, False, False, True, False, False, False);
                q.Next;
              end;

            end;
        end;
      end;
  end;

  dm.imprime_linha_impNF(marca, modelo, '', False, False, False, True, False, False, False);
  dm.imprime_linha_impNF(marca, modelo, '', False, False, False, True, False, False, False);
  dm.imprime_linha_impNF(marca, modelo, '', False, False, False, True, False, False, False);
  dm.imprime_linha_impNF(marca, modelo, '', False, False, False, True, False, False, False);
  dm.imprime_linha_impNF(marca, modelo, '', False, False, False, True, False, False, False);
  dm.imprime_linha_impNF(marca, modelo, '', False, False, False, True, False, False, False);
  dm.imprime_linha_impNF(marca, modelo, '', False, False, False, True, False, False, False);
  dm.imprime_linha_impNF(marca, modelo, '', False, False, False, True, False, False, False);

  FreeAndNil(q);

end;

function Tdm.alinha_valor_a_direita(tam_str: Integer; str: string): string;
var
  tamanho: Integer;
begin
  tamanho := Length(str);
  while (tamanho <= tam_str) do
  begin
    str := ' ' + str;
    tamanho := tamanho + 1;
  end;
  result := str;
end;

function Tdm.geraID(AGenerator: string): LargeInt;
var
  qryGeraID: TFDQuery;
begin
  qryGeraID := TFDQuery.Create(Self);
  qryGeraID.Connection := fdRestaurante;

  try
    qryGeraID.Active := False;
    qryGeraID.SQL.Clear;
    qryGeraID.SQL.Add('select gen_id(' + AGenerator + ', 1) from rdb$database');
    qryGeraID.Active := True;
    Result := qryGeraID.Fields[0].Value;
  finally
    qryGeraID.Active := False;
    FreeAndNil(qryGeraID);
  end;
end;

function Tdm.geraCodigo(AGenerator: string; tam: Integer): string;
var
  zeros: string;
  ct: Integer;
begin
  ct := 0;

  while ct < tam do
  begin
    zeros := zeros + '0';
    ct := ct + 1;
  end;
  with TIBQuery.Create(Application) do
  try
    DataBase := dbrestaurante;
    Transaction := transacao;
    SQL.Text := 'select gen_id(' + AGenerator + ', 1) from rdb$database';
    Open;
    result := FormatFloat(zeros, Fields[0].AsInteger);
  finally
    Free;
  end;
end;

procedure Tdm.qryVendasCaixaTIPO_VENDAGetText(Sender: TField; var Text: string; DisplayText: Boolean);
begin
  Text := EmptyStr;

end;

procedure Tdm.qry_itens_estoqueBeforePost(DataSet: TDataSet);
begin
  dm.qryauxiliar.Active := False;
  dm.qryauxiliar.SQL.clear;
  dm.qryauxiliar.sql.add('select un.parametro from unidades un where cod_unidade=' + QuotedStr(dm.qry_itens_estoque.fieldbyname('unidade_entrada').value));
  dm.qryauxiliar.Active := True;
  dm.qry_itens_estoque.FieldByName('estoque_liquido').Value := dm.qry_itens_estoque.FieldByName('estoque').Value * dm.qryauxiliar.fieldbyname('parametro').value;
end;

function Tdm.verificaExistenciaUsuario(cod_usuario: string): Boolean;
var
  q: TIBQuery;
begin
  q := TIBQuery.Create(Self);
  q.Database := dbrestaurante;
  q.Transaction := transacao;

  q.active := False;
  q.sql.clear;
  q.sql.add('select * from usuarios where cod_usuario=' + QuotedStr(cod_usuario));
  q.active := True;

  result := not (q.IsEmpty);
  FreeAndNil(q);
end;

procedure Tdm.saltaLinhasMiniPrinter(marca: Integer; modelo: Integer);
begin
  dm.imprime_linha_impNF(marca, modelo, '', False, False, False, True, False, False, False);
  dm.imprime_linha_impNF(marca, modelo, '', False, False, False, True, False, False, False);
  dm.imprime_linha_impNF(marca, modelo, '', False, False, False, True, False, False, False);
  dm.imprime_linha_impNF(marca, modelo, '', False, False, False, True, False, False, False);
  dm.imprime_linha_impNF(marca, modelo, '', False, False, False, True, False, False, False);
  dm.imprime_linha_impNF(marca, modelo, '', False, False, False, True, False, False, False);
  dm.imprime_linha_impNF(marca, modelo, '', False, False, False, True, False, False, False);
  dm.imprime_linha_impNF(marca, modelo, '', False, False, False, True, False, False, False);
end;

function Tdm.retornaCampoQQTabela(tabela: string; campos: string; cp_pesq: string; param_pesq: string; cp_ret: Integer): string;
var
  q: TIBQuery;
begin
  q := TIBQuery.Create(Self);
  q.Database := dbrestaurante;
  q.Transaction := transacao;

  q.Active := False;
  q.SQL.clear;
  q.sql.add('select ' + campos + ' from ' + tabela + ' where ' + cp_pesq + '=' + QuotedStr(param_pesq));
  q.active := True;

  if (q.IsEmpty = True) then
    Result := 'NÃO ENCONTRADO'
  else
    result := q.fields[cp_ret].AsString;

  FreeAndNil(q);
end;

procedure Tdm.imprimeCabecalhoMiniPrinter(marca: Integer; modelo: Integer; titulo: string);
var
  str: string;
begin
  case marca of
    2:
      begin
        case modelo of
          2:
            begin
              dm.imprime_linha_impNF(marca, modelo, '------------------------------------------------', False, False, False, True, False, False, False);
              dm.imprime_linha_impNF(marca, modelo, dm.centralizar(titulo, 24), True, False, False, False, False, False, True);
              str := FormatDateTime('DD/MM/YYY', Date) + ' ' + FormatDateTime('HH:MM:SS', Time);
              dm.imprime_linha_impNF(marca, modelo, str, False, False, False, False, True, False, False);
              str := 'Operador: ' + nome_usuario;
              dm.imprime_linha_impNF(marca, modelo, str, False, False, False, False, True, False, False);
              dm.imprime_linha_impNF(marca, modelo, '------------------------------------------------', False, False, False, True, False, False, False);
            end;
        end;
      end;
  end;
end;

procedure Tdm.imprimeProdutosMiniPrinter(marca: Integer; modelo: Integer);
var
  q: TIBQuery;
  str: string;
begin

  q := TIBQuery.Create(self);
  q.Database := dbrestaurante;
  q.Transaction := transacao;
  q.Active := False;
  q.sql.clear;

  q.SQL.add('select  cod_produto, cod_barras,descricao, valor_unitario from produtos order by cod_barras');
  q.Active := True;
  q.First;
  imprimeCabecalhoMiniPrinter(marca, modelo, 'Listagem de produtos');
  case marca of
    1:
      begin
        case modelo of
          1:
            begin
              str := '######****************************************%%%%%%%%%%%';
              str := dm.organizarCupom(str, 'Cod.', '#');
              str := dm.organizarCupom(str, 'Descricao', '*');
              str := dm.organizarCupom(str, 'Preco', '%');
              dm.imprime_linha_impNF(marca, modelo, str, True, False, False, False, True, False, False);
              dm.imprime_linha_impNF(marca, modelo, '------------------------------------------------', False, False, False, True, False, False, False);
              while not q.Eof do
              begin
                str := '######****************************************%%%%%%%%%%%';
                str := dm.organizarCupom(str, q.fieldbyname('cod_barras').value, '#');
                str := dm.organizarCupom(str, q.fieldbyname('descricao').value, '*');
                str := dm.organizarCupom(str, FormatFloat('R$ ###,###,##0.00 ', q.fieldbyname('valor_unitario').value), '%');
                dm.imprime_linha_impNF(marca, modelo, str, False, False, False, False, True, False, False);
                q.Next;
              end;
              saltaLinhasMiniPrinter(marca, modelo);
            end;
        end;
      end;
  end;

  FreeAndNil(q);
end;

procedure Tdm.imprimeGarconsMiniPrinter(marca: Integer; modelo: Integer);
var
  q: TIBQuery;
  str: string;
begin

  q := TIBQuery.Create(self);
  q.Database := dbrestaurante;
  q.Transaction := transacao;
  q.Active := False;
  q.sql.clear;

  q.SQL.add('select * from garcons order by cod_garcon');
  q.Active := True;
  q.First;
  imprimeCabecalhoMiniPrinter(marca, modelo, 'Listagem de garcons');
  case marca of
    2:
      begin
        case modelo of
          2:
            begin
              str := '######****************************************';
              str := dm.organizarCupom(str, 'Cod.', '#');
              str := dm.organizarCupom(str, 'Nome', '*');
              dm.imprime_linha_impNF(marca, modelo, str, True, False, False, False, True, False, False);
              dm.imprime_linha_impNF(marca, modelo, '------------------------------------------------', False, False, False, True, False, False, False);
              while not q.Eof do
              begin
                str := '######****************************************';
                str := dm.organizarCupom(str, q.fieldbyname('cod_garcon').value, '#');
                str := dm.organizarCupom(str, q.fieldbyname('apelido').value, '*');
                dm.imprime_linha_impNF(marca, modelo, str, False, False, False, False, True, False, False);
                q.Next;
              end;
              saltaLinhasMiniPrinter(marca, modelo);
            end;
        end;
      end;
  end;

  FreeAndNil(q);
end;

function Tdm.maiorVenda(Tabela: string; Campo: string): Integer;
var
  QryMax: TIBQuery;
begin
  QryMax := TIBQuery.Create(self);
  QryMax.Database := dbrestaurante;
  QryMax.Transaction := transacao;

  QryMax.Active := False;
  QryMax.SQL.Clear;
  QryMax.SQL.Add('Select max(' + Campo + ') as Maior from vendas where imp=1');
  QryMax.Active := True;
  if QryMax.eof or (QryMax['Maior'] < 1) then
    MaiorVenda := 1
  else
    MaiorVenda := QryMax['Maior'] + 1;
  QryMax.Active := False;
  FreeAndNil(QryMax);
end;

procedure Tdm.imprimeEstornoMesa(marca: Integer; AMesa: string);
var
  QryM: TIBQuery;
  valorBruto: Double;
  txServ: Double;
begin
  QryM := TIBQuery.Create(self);
  QryM.Database := dbrestaurante;
  QryM.Transaction := transacao;

  frm_principal.memo_avisos.Lines.clear;
  if FileExists(caminhoArquivoExtrato) then
    DeleteFile(caminhoArquivoExtrato);
  dm.imprimeCabecalhoECF(marca, 3, AMesa, '', '', '', '', 1);
  dm.imprimeMovimentoContaECF(marca, AMesa, '');

  QryM.Active := False;
  QryM.sql.clear;
  QryM.sql.add('select * from rodapeextrato3(' + QuotedStr(AMesa) + ',' + dm.TrocaVirgPPto(FloatToStr(percentualTaxaServico)) + ')');
  QryM.Active := True;

  valorBruto := QryM.fieldbyname('VALORBRUTO').Value;
  txServ := QryM.fieldbyname('VALORTXSERV').Value;

  dm.imprimeRodapeExtratoContaECF(AMesa, '', marca_impressora_fiscal, 1, 1, valorBruto, 0, txServ, 0, 0, valorBruto + txServ, 0, 0, 0);

  frm_principal.memo_avisos.Lines.LoadFromFile(caminhoArquivoExtrato);
  imprimeTextoMiniPrinter(frm_principal.memo_avisos.Lines.Text);
  QryM.Active := False;
  FreeAndNil(QryM);
end;

procedure Tdm.estornarMesaInteira(marca: Integer; modelo: Integer; AMesa: string; valorTotal: Double);
var
  result: string;
begin

  if (StrToInt(LeIni(1, 'CANCELAMENTO_DE_MESA', 'imprime_comprovante')) = 1) then
  begin
    imprimeEstornoMesa(marca, AMesa);
  end;

  qryauxiliar.Active := False;
  qryauxiliar.sql.Clear;
  qryauxiliar.sql.add('delete from movimento_mesa where cod_mesa=' + QuotedStr(AMesa));
  qryauxiliar.ExecSQL;

  qryauxiliar.Active := False;
  qryauxiliar.sql.clear;
  qryauxiliar.sql.add('delete from recebimento_parcial where mesa=' + QuotedStr(AMesa));
  qryauxiliar.ExecSQL;

  qryauxiliar.Active := False;
  qryauxiliar.sql.clear;
  qryauxiliar.sql.add('delete from extratos_emitidos where mesa=' + QuotedStr(AMesa));
  qryauxiliar.ExecSQL;

  if transacao.Active = False then
    transacao.Active := True;
  transacao.Commit;
end;

function Tdm.getTipoPagamentoNFCE(cod_forma: string): TpcnFormaPagamento;
var
  q: TIBQuery;
begin

  q := TIBQuery.Create(self);
  q.Transaction := dm.transacao;
  q.Database := dm.dbrestaurante;

  q.Active := False;
  q.sql.clear;
  q.sql.add('select rp from formas_pagamento where cod_forma=' + QuotedStr(cod_forma));
  q.Active := True;

  case StrToInt(q.FieldByName('rp').value) of
    1:
      result := fpDinheiro;
    2:
      result := fpCheque;
    3:
      result := fpCartaoCredito;
    4:
      result := fpCartaoDebito;
    5:
      result := fpCreditoLoja;
    6:
      result := fpValeAlimentacao;
    7:
      result := fpValeRefeicao;
    8:
      result := fpValePresente;
    9:
      result := fpValeCombustivel;
    10:
      result := fpValeAlimentacao;
    11:
      result := fpValeAlimentacao;
    12:
      result := fpValePresente;
    13:
      result := fpValeCombustivel;

    15:
      result := fpBoletoBancario;
    16:
      result := fpDepositoBancario;
    17:
      result := fpPagamentoInstantaneo;
    18:
      result := fpTransfBancario;
    19:
      result := fpPagamentoInstantaneo;
    20:
      result := fpPagamentoInstantaneoEstatico;
    21:
      result := fpCreditoEmLojaPorDevolucao;
    22:
      result := fpFalhaHardware;
    90:
      result := fpSemPagamento;

    99:
      result := fpOutro;
  end;
  FreeAndNil(q);
end;

function Tdm.getTipoFormaIntegrada(AForma: integer): boolean;
begin

  case AForma of
    1:
      result := false;
    2:
      result := false;
    3:
      result := true;
    4:
      result := true;
    5:
      result := false;
    6:
      result := false;
    7:
      result := false;
    8:
      result := false;
    9:
      result := false;
    10:
      result := true;
    11:
      result := true;
    12:
      result := true;
    13:
      result := true;
    14:
      result := true;

    15:
      result := true;
    16:
      result := false;
    17:
      result := true;
    18:
      result := true;
    19:
      result := false;
    20:
      result := false;
    21:
      result := false;
    22:
      result := false;
    90:
      result := false;
    99:
      result := false;
  end;

end;

function Tdm.getTipoPagamentoSAT(cod_forma: string): TpcnCodigoMP;
var
  q: TIBQuery;
begin

  q := TIBQuery.Create(self);
  q.Transaction := dm.transacao;
  q.Database := dm.dbrestaurante;

  q.Active := False;
  q.sql.clear;
  q.sql.add('select rp from formas_pagamento where cod_forma=' + QuotedStr(cod_forma));
  q.Active := True;

  case StrToInt(q.FieldByName('rp').value) of
    1:
      result := mpDinheiro;
    2:
      result := mpCheque;
    3:
      result := mpCartaodeCredito;
    4:
      result := mpCartaodeDebito;
    5:
      result := mpCreditoLoja;
    10:
      result := mpValeAlimentacao;
    11:
      result := mpValeRefeicao;
    12:
      result := mpValePresente;
    13:
      result := mpValeCombustivel;
    14:
      result := mpOutros;
  end;
  FreeAndNil(q);
end;

function Tdm.verificaTipoFormaPagamento(cod_forma: string): Integer;
var
  q: TIBQuery;
begin

  q := TIBQuery.Create(self);
  q.Transaction := dm.transacao;
  q.Database := dm.dbrestaurante;

  q.Active := False;
  q.sql.clear;
  q.sql.add('select * from formas_pagamento where cod_forma=' + QuotedStr(cod_forma));
  q.Active := True;

  result := q.fieldbyname('tipo').value;
  FreeAndNil(q);
end;

procedure Tdm.gerarEmpresasSelecionadas(LEmpresas: string);
var
  q: TIBQuery;
  q2: TFDQuery;
begin
  q := TIBQuery.Create(self);
  q.Transaction := dm.transacao;
  q.Database := dm.dbrestaurante;

  q2 := TFDQuery.Create(self);
  q2.Connection := fdRestaurante;
  q2.Transaction := fdRestaurante.Transaction;

  try
    q.Active := False;
    q.sql.clear;
    q.sql.add(' delete from SELECAO_EMPRESAS');
    q.ExecSQL;

    q2.sql.clear;
    q2.sql := q.SQL;
    q2.ExecSQL;

    q.sql.Clear;
    q.sql.add('   insert into SELECAO_EMPRESAS ');
    q.sql.add('   select cod_empresa from parametros p ');
    q.sql.add('    where p.cod_empresa in (' + LEmpresas + ')');
    q.ExecSQL;
    q2.sql.clear;
    q2.sql := q.SQL;
    q2.ExecSQL;

  finally
    FreeAndNil(q);
    FreeAndNil(q2);
  end;

end;

function Tdm.somaDiasData(data: TDate; dias: Integer): TDate;
begin
  result := data + dias;

end;

procedure Tdm.gerarFatura(codCliente: string; codVenda: string; valorFatura: Double; obs: string; dataVencimento: TDate);
var
  q: TIBQuery;
  frmVazio: Tfrm_modelo_vazio;
  codFatura: string;
begin
  q := TIBQuery.Create(self);
  q.Database := dbrestaurante;
  q.Transaction := transacao;
  q.Active := False;
  q.SQL.clear;
  Application.CreateForm(Tfrm_modelo_vazio, frmVazio);
//  dataVencimento := FormatDateTime('DD.MM.YYY',somaDiasData(data_do_sistema, frmVazio.getPrazoCliente(codCliente)));
  codFatura := geraCodigo('G_FATURAS', 6);

  q.SQL.Add('insert into faturas (cod_empresa, cod_caixa, cod_fatura,cod_cli,cod_venda,data_fatura,hora,data_vencimento,valor_fatura,usuario_inclusao,observacao)');
  q.sql.add(' values (');
  q.SQL.add('' + QuotedStr(codEmpresa) + ',');
  q.SQL.add('' + QuotedStr(ultimoCaixaAberto) + ',');
  q.SQL.add('' + QuotedStr(codFatura) + ',');
  q.SQL.add('' + QuotedStr(codCliente) + ',');
  q.SQL.add('' + QuotedStr(codVenda) + ',');
  q.SQL.add('' + QuotedStr(FormatDateTime('DD.MM.YYY', data_do_sistema)) + ',');
  q.SQL.add('' + QuotedStr(FormatDateTime('HH:MM:SS', Time)) + ',');
  q.SQL.add('' + QuotedStr(FormatDateTime('DD.MM.YYY', dataVencimento)) + ',');
  q.SQL.add('' + QuotedStr(TrocaVirgPPto(FloatToStr(valorFatura))) + ',');
  q.SQL.add('' + QuotedStr(nome_usuario) + ',');
  q.SQL.add('' + QuotedStr(obs) + ')');
  try
    begin
      q.ExecSQL;
    end;
  except
    begin
      ShowMessage('Ocorreu um erro no sistema!  Um log de errro foi criado no formato DATA+HORA na pasta logs do Sistema. Abra o arquivo e envio por fax ou email para a Real Systems');
      dm.cria_log_de_erros(q.sql, 'Módulo de caixa', 'Erro inserir fatura', codigo_usuario);
      Exit;
    end;
  end;

  q.Active := False;
  q.SQL.clear;
  q.sql.add('update clientes set data_ultima_compra=' + QuotedStr(FormatDateTime('DD.MM.YYY', data_do_sistema)) + ' where cod_cli=' + QuotedStr(codCliente));
  try
    begin
      q.ExecSQL;
    end;
  except
    begin
      ShowMessage('Ocorreu um erro no sistema!  Um log de errro foi criado no formato DATA+HORA na pasta logs do Sistema. Abra o arquivo e envio por fax ou email para a Real Systems');
      dm.cria_log_de_erros(q.sql, 'Módulo de caixa', 'Erro ao atualizar data ultima compra do cliente', codigo_usuario);
      Exit;
    end;
  end;

  FreeAndNil(q);
  FreeAndNil(frmVazio);

end;

function Tdm.verificaExistenciaRecebimentosParciais(AMesa: string): Boolean;
var
  q: TIBQuery;
begin
  q := TIBQuery.Create(self);
  q.Database := dm.dbrestaurante;
  q.Transaction := dm.transacao;
  q.Active := False;
  q.SQL.clear;

  q.sql.add('select * from recebimento_parcial where mesa=' + QuotedStr(AMesa));
  q.active := True;

  if q.IsEmpty then
    result := True
  else
    result := False;

  FreeAndNil(q);
end;

procedure Tdm.enviaProdutoParaFilaImpressao(cod_garcon: string; cod_produto: string; AMesa: string; quantidade: Double; observacao: string; sabores: string; tipo: string; terminal: Integer; idMovimentoMesa: string; tipoMassa: string);
var
  ts: TIBTransaction;
  q: TIBQuery;
  frmVazio: Tfrm_modelo_vazio;
  impressora: string;
begin

  ts := TIBTransaction.Create(nil);
  ts.Params.Add('read_committed');
  ts.Params.Add('rec_version');
  ts.Params.Add('nowait');
  ts.DefaultDatabase := dm.dbrestaurante;
  ts.Active := False;
  ts.Active := True;

  q := TIBQuery.create(self);
  q.Database := dm.dbrestaurante;
  q.Transaction := ts;
  q.Active := False;
  q.SQL.Clear;
  Application.CreateForm(Tfrm_modelo_vazio, frmVazio);

  try

    if getCodMesaBalcao <> AMesa then
      impressora := frmVazio.getCodMiniPrinterProduto(cod_produto)
    else
    begin
      if (StrToInt(dm.LeIni(2, 'CAIXA', 'balcaoImprimeFichas')) = 1) then
        impressora := FormatFloat('000', StrToInt(dm.LeIni(2, 'CAIXA', 'codMiniprinterBalcao')))
      else
        impressora := frmVazio.getCodMiniPrinterProduto(cod_produto);
    end;

    q.sql.add('insert into fila_de_impressao (mesa,cod_garcon,cod_produto,quantidade,data,hora_pedido');
    q.sql.add(',cod_usuario_enviou,observacoes,sabores,numero_caixa,status,tipo,terminal,cod_miniprinter,id_movimento_mesa,tipo_massa) values (');
    q.sql.add('' + QuotedStr(AMesa) + ',');
    q.sql.add('' + QuotedStr(cod_garcon) + ',');
    q.sql.add('' + QuotedStr(frmVazio.getCodProduto(cod_produto)) + ',');
    q.sql.add('' + TrocaVirgPPto(FloatToStr(quantidade)) + ',');
    q.sql.add('' + QuotedStr(FormatDateTime('DD.MM.YYY', data_do_sistema)) + ',');
    q.sql.add('' + QuotedStr(FormatDateTime('HH:MM:ss', Time)) + ',');
    q.sql.add('' + QuotedStr(codigo_usuario) + ',');
    q.sql.add('' + QuotedStr(observacao) + ',' + QuotedStr(sabores) + ',' + QuotedStr(dm.LeIni(2, 'CAIXA', 'numero')) + ',-1' + ',' + tipo + ',' + IntToStr(terminal) + ',');
    q.sql.add('' + QuotedStr(impressora) + ',');
    q.SQL.add(idMovimentoMesa + ',');
    q.sql.add('' + QuotedStr(tipoMassa) + ')');

    ////dm.adicionalog('Envia produto do pedido para a fila de impressão');
    ////////dm.adicionalog(q.SQL.Text);


    try
      begin
        q.ExecSQL;
        ts.Commit;
      end;
    except
      begin
        dm.cria_log_de_erros(dm.qryauxiliar.sql, 'Lançamento no caixa ', 'Erro ao lançar produto na fila de impressão', codigo_usuario);
        Exit;
      end;
    end;
  finally
    FreeAndNil(q);
    FreeAndNil(frmVazio);
    ts.Active := False;
  end;

end;

procedure Tdm.tbComprasTempCalcFields(DataSet: TDataSet);
begin
  tbComprasTemptotal.Value := tbComprasTemppreco.value * tbComprasTempquantidade.Value;
  tbComprasTempvalorTotal.Value := tbComprasTemptotal.Value + tbComprasTempvalorIPI.value + tbComprasTempvalorICMSST.value;
  tbComprasTempvalorTotal.Value := tbComprasTempvalorTotal.Value + tbComprasTempvalorFrete.value + tbComprasTempvalorSeguro.value;
  tbComprasTempvalorTotal.Value := tbComprasTempvalorTotal.Value + tbComprasTempvalorFCPST.value + tbComprasTempvalorImpostoImportacao.value;
  tbComprasTempvalorTotal.Value := tbComprasTempvalorTotal.Value + tbComprasTempoutrasDespAcessorias.value;
  tbComprasTempvalorTotal.Value := tbComprasTempvalorTotal.Value - tbComprasTempdesconto.value;
//        LCustoRealItem := (LTotalItem + LValorIPIItem + LValorICMSSTItem + LOutrasDespesasItem +
// LValorFreteItem + LValorSeguroItem + LValorFCPTSTItem + LValorImpostoImportacaoItem) - LValorDescontoItem;
end;

function Tdm.fAlinhaD(const Texto, Key, Espaco, Decimal: string): string;
var
  vChar, vDiv: string;
  I: Integer;
begin
  vDiv := '1';
  for I := 1 to StrToInt(Decimal) do
    vDiv := vDiv + '0';
  vChar := Copy(Texto, 1, Length(Texto) - 1); //, Texto + Key );
//vChar := IfThen( Key = #8,
  while (Pos(',', vChar) > 0) or (Pos('.', vChar) > 0) do
  begin
    Delete(vChar, Pos('.', vChar), 1);
    Delete(vChar, Pos(',', vChar), 1);
  end;
  if vChar = '' then
    vChar := '0';
  result := Format('%' + Espaco + '.' + Decimal + 'n', [StrToFloat(vChar) / StrToInt(vDiv)]);
end;

procedure Tdm.tbComprasTempvalorUnitarioValidate(Sender: TField);
begin
  if (tbComprasTemppreco.Value <= 0) then
  begin
    ShowMessage('Valor unitário deve ser maior que ZERO');
  end;

end;

procedure Tdm.tbComprasTempqtdeValidate(Sender: TField);
begin
  if (tbComprasTempquantidade.Value <= 0) then
  begin
    ShowMessage('Quantidade deve ser superior à zero!');
  end;
end;

function Tdm.retiraAcentos(str: string): string;
var
  i: Integer;
begin
  for i := 1 to Length(str) do
    case str[i] of
      'á':
        str[i] := 'a';
      'é':
        str[i] := 'e';
      'í':
        str[i] := 'i';
      'ó':
        str[i] := 'o';
      'ú':
        str[i] := 'u';
      'à':
        str[i] := 'a';
      'è':
        str[i] := 'e';
      'ì':
        str[i] := 'i';
      'ò':
        str[i] := 'o';
      'ù':
        str[i] := 'u';
      'â':
        str[i] := 'a';
      'ê':
        str[i] := 'e';
      'î':
        str[i] := 'i';
      'ô':
        str[i] := 'o';
      'û':
        str[i] := 'u';
      'ä':
        str[i] := 'a';
      'ë':
        str[i] := 'e';
      'ï':
        str[i] := 'i';
      'ö':
        str[i] := 'o';
      'ü':
        str[i] := 'u';
      'ã':
        str[i] := 'a';
      'õ':
        str[i] := 'o';
      'ñ':
        str[i] := 'n';
      'ç':
        str[i] := 'c';
      'Á':
        str[i] := 'A';
      'É':
        str[i] := 'E';
      'Í':
        str[i] := 'I';
      'Ó':
        str[i] := 'O';
      'Ú':
        str[i] := 'U';
      'À':
        str[i] := 'A';
      'È':
        str[i] := 'E';
      'Ì':
        str[i] := 'I';
      'Ò':
        str[i] := 'O';
      'Ù':
        str[i] := 'U';
      'Â':
        str[i] := 'A';
      'Ê':
        str[i] := 'E';
      'Î':
        str[i] := 'I';
      'Ô':
        str[i] := 'O';
      'Û':
        str[i] := 'U';
      'Ä':
        str[i] := 'A';
      'Ë':
        str[i] := 'E';
      'Ï':
        str[i] := 'I';
      'Ö':
        str[i] := 'O';
      'Ü':
        str[i] := 'U';
      'Ã':
        str[i] := 'A';
      'Õ':
        str[i] := 'O';
      'Ñ':
        str[i] := 'N';
      'Ç':
        str[i] := 'C';
    end;
  result := str;
end;

procedure Tdm.imprimirEstornoDeItem(codEstorno: string; codCliente: string; nomeCliente: string);
var
  q: TIBQuery;
  marca: Integer;
  str: string;
  ct: Integer;
begin

  q := TIBQuery.create(self);
  q.Database := dm.dbrestaurante;
  q.Transaction := dm.transacao;

  if (localDeEmissaoDeExtrato = 1) then
    marca := marca_impressora_fiscal
  else
    marca := marca_impressora_nao_fiscal_01;

  q.Active := False;
  q.sql.clear;
  q.sql.add('select es.*,es.descricaoMotivo, (es.quantidade * es.valor_unitario) as total, c.nome_usuario');
  q.sql.add('  from estornos es ');
  q.sql.add('    inner join caixas c on (c.codigo = es.cod_caixa)');
  q.sql.add('    where es.codigo=' + QuotedStr(codEstorno));
  q.Active := True;

  frm_principal.memo_avisos.Lines.clear;
  if FileExists(caminhoArquivoExtrato) then
    DeleteFile(caminhoArquivoExtrato);
  imprimeLinhaECF(marca, linhaExtrato, False, False, False, False, False, False, False);
  imprimeLinhaECF(marca, linhaExtrato, False, False, False, False, False, False, False);
  imprimeLinhaECF(marca, dm.centralizar(nome_fantasia, qtdColunasExpandidoECF), True, False, False, True, False, True, False);
  dm.imprimeLinhaECF(marca, dm.centralizar('ESTORNO', qtdColunasExpandidoECF), True, False, False, True, False, True, False);
  str := 'Estorno: ' + q.fieldbyname('codigo').value;
  imprimeLinhaECF(marca, str, False, False, False, False, True, False, False);
  str := 'Mesa/Cartao: ' + q.fieldbyname('mesa').value;
  imprimeLinhaECF(marca, str, False, False, False, False, True, False, False);
  if (Trim(codCliente) <> '') then
  begin
    str := 'Cod Cliente: ' + codCliente;
    imprimeLinhaECF(marca, str, True, False, True, False, True, False, False);
    str := 'Cliente: ' + nomeCliente;
    imprimeLinhaECF(marca, str, True, False, True, False, True, False, False);
  end;
  str := 'N. Caixa: ' + q.fieldbyname('cod_caixa').value;
  imprimeLinhaECF(marca, str, True, False, False, False, True, False, False);
  str := 'Operador: ' + q.fieldbyname('NOME_USUARIO').value;
  imprimeLinhaECF(marca, str, True, False, False, False, True, False, False);
  str := 'Data: ' + FormatDateTime('DD/MM/YYY', data_do_sistema);
  imprimeLinhaECF(marca, str, True, False, False, False, True, False, False);

  str := 'Hora: ' + FormatDateTime('hh:mm:ss', q.fieldbyname('hora').value);
  imprimeLinhaECF(marca, str, False, False, False, False, True, False, False);

  imprimeLinhaECF(marca, linhaExtrato, False, False, False, False, False, False, False);
  str := formatoCabecalhoExtrato;
  str := dm.organizarCupom(str, 'Qtd.', '#');
  str := organizarCupom(str, Copy('Descricao', 0, 15), '*');
  str := dm.organizarCupom(str, dm.alinha_valor_a_direita(alinhamentoDireitaTotal, 'Total'), '%');
  imprimeLinhaECF(marca, Trim(str), False, False, False, False, False, False, False);
  imprimeLinhaECF(marca, linhaExtrato, False, False, False, False, False, False, False);

  str := formatoCabecalhoExtrato;
  str := dm.organizarCupom(str, q.fieldbyname('quantidade').value, '#');
  str := dm.organizarCupom(str, Copy(q.fieldbyname('descricao').value, 0, 25), '*');
  str := Trim(dm.organizarCupom(str, dm.alinha_valor_a_direita(alinhamentoDireitaTotal, FormatFloat('R$ ###,###,##0.00 ', (q.fieldbyname('total').value))), '%'));
  imprimeLinhaECF(marca, Trim(str), False, False, False, False, True, False, False);
  imprimeLinhaECF(marca, Trim(''), False, False, False, False, False, False, False);
  str := 'Motivo: ' + q.fieldbyname('DESCRICAOMOTIVO').value;
  imprimeLinhaECF(marca, str, False, False, False, False, True, False, False);

  if (Trim(q.FieldByName('obs').Value) <> '') then
  begin
    imprimeLinhaECF(marca, 'Observacoes:', False, False, False, False, False, False, False);
    frm_principal.memoObsMiniprinter.Lines.Clear;
    frm_principal.memoObsMiniprinter.Lines.add(q.FieldByName('obs').Value);
    for ct := 0 to frm_principal.memoObsMiniprinter.Lines.Count do
    begin
      imprimeLinhaECF(marca, frm_principal.memoObsMiniprinter.Lines[ct], True, False, False, False, True, False, False);
    end;
  end;

  imprimeLinhaECF(marca, linhaExtrato, False, False, False, False, False, False, False);
  imprimeLinhaECF(marca, '', False, False, False, False, False, False, False);
  imprimeLinhaECF(marca, '', False, False, False, False, False, False, False);

  imprimeLinhaECF(marca, dm.centralizar('------------------------------', qtdColunasNormalECF), False, False, False, False, False, False, False);
  imprimeLinhaECF(marca, dm.centralizar('Assinatura do Operador', qtdColunasNormalECF), False, False, False, False, False, False, False);

  for ct := 0 to StrToInt(dm.LeIni(2, 'extrato', 'linhasFinalExtrato')) do
  begin
    imprimeLinhaECF(marca, '                     ', False, False, False, False, False, False, False);
  end;

  frm_principal.memo_avisos.Lines.LoadFromFile(caminhoArquivoExtrato);
  imprimeTextoMiniPrinter(frm_principal.memo_avisos.Lines.Text);

  FreeAndNil(q);
end;

function Tdm.imprimirTransferenciaDeProduto(codTransferencia: string): string;
var
  q: TIBQuery;
  marca: Integer;
  str: string;
  ct: Integer;
begin

  q := TIBQuery.create(self);
  q.Database := dm.dbrestaurante;
  q.Transaction := dm.transacao;

  if (localDeEmissaoDeExtrato = 1) then
    marca := marca_impressora_fiscal
  else
    marca := marca_impressora_nao_fiscal_01;

  q.Active := False;
  q.sql.clear;
  q.sql.add('select t.*,t.descricaoMotivo, (t.quantidade * t.valor_unitario) as total, c.nome_usuario');
  q.sql.add('  from transferencias_produto t ');
  q.sql.add('    inner join caixas c on (c.codigo = t.cod_caixa)');
  q.sql.add('    where t.codigo=' + QuotedStr(codTransferencia));
  q.Active := True;

  frm_principal.memo_avisos.Lines.clear;
  if FileExists(caminhoArquivoExtrato) then
    DeleteFile(caminhoArquivoExtrato);
  imprimeLinhaECF(marca, dm.centralizar(nome_fantasia, qtdColunasExpandidoECF), True, False, False, True, False, True, False);
  dm.imprimeLinhaECF(marca, dm.centralizar('TF. DE PRODUTO', qtdColunasExpandidoECF), True, False, False, True, False, True, False);
  imprimeLinhaECF(marca, ' ', False, False, False, False, True, False, False);

  str := 'Transferencia Nº: ' + q.fieldbyname('codigo').value;
  imprimeLinhaECF(marca, str, False, False, False, False, True, False, False);
  imprimeLinhaECF(marca, 'ORIGEM:  ' + q.fieldbyname('MESA_ORIGEM').value + ' / ' + 'DESTINO:  ' + q.fieldbyname('MESA_DESTINO').value, False, False, False, False, True, False, False);

  str := 'N. Caixa: ' + q.fieldbyname('cod_caixa').value + '    ' + 'Operador: ' + Trim(q.fieldbyname('NOME_USUARIO').value);
  imprimeLinhaECF(marca, str, False, False, False, False, True, False, False);
  str := 'Data: ' + FormatDateTime('DD/MM/YYY', data_do_sistema) + '   ' + 'Hora: ' + FormatDateTime('hh:mm:ss', q.fieldbyname('hora').value);
  imprimeLinhaECF(marca, str, False, False, False, False, True, False, False);

  imprimeLinhaECF(marca, linhaExtrato, False, False, False, False, False, False, False);
  str := formatoCabecalhoExtrato;
  str := dm.organizarCupom(str, 'Qtd.', '#');
  str := organizarCupom(str, Copy('Descricao', 0, 15), '*');
  str := dm.organizarCupom(str, dm.alinha_valor_a_direita(alinhamentoDireitaTotal, 'Total'), '%');
  imprimeLinhaECF(marca, Trim(str), False, False, False, False, False, False, False);
  imprimeLinhaECF(marca, linhaExtrato, False, False, False, False, False, False, False);

  str := formatoCabecalhoExtrato;
  str := dm.organizarCupom(str, q.fieldbyname('quantidade').value, '#');
  str := dm.organizarCupom(str, Copy(q.fieldbyname('descricao').value, 0, 25), '*');
  str := Trim(dm.organizarCupom(str, dm.alinha_valor_a_direita(alinhamentoDireitaTotal, FormatFloat('R$ ###,###,##0.00 ', (q.fieldbyname('total').value))), '%'));
  imprimeLinhaECF(marca, Trim(str), False, False, False, False, True, False, False);
  imprimeLinhaECF(marca, Trim(''), False, False, False, False, False, False, False);
  str := 'Motivo: ' + q.fieldbyname('DESCRICAOMOTIVO').value;
  imprimeLinhaECF(marca, str, False, False, False, False, True, False, False);

  if (Trim(q.FieldByName('obs').Value) <> '') then
  begin
    imprimeLinhaECF(marca, 'Observacoes:', False, False, False, False, False, False, False);
    frm_principal.memoObsMiniprinter.Lines.Clear;
    frm_principal.memoObsMiniprinter.Lines.add(q.FieldByName('obs').Value);
    for ct := 0 to frm_principal.memoObsMiniprinter.Lines.Count do
    begin
      imprimeLinhaECF(marca, frm_principal.memoObsMiniprinter.Lines[ct], True, False, False, False, True, False, False);
    end;
  end;

  imprimeLinhaECF(marca, linhaExtrato, False, False, False, False, False, False, False);
  imprimeLinhaECF(marca, '', False, False, False, False, False, False, False);
  imprimeLinhaECF(marca, '', False, False, False, False, False, False, False);

  imprimeLinhaECF(marca, dm.centralizar('------------------------------', qtdColunasNormalECF), False, False, False, False, False, False, False);
  imprimeLinhaECF(marca, dm.centralizar('Assinatura do Operador', qtdColunasNormalECF), False, False, False, False, False, False, False);

  for ct := 0 to StrToInt(dm.LeIni(2, 'extrato', 'linhasFinalExtrato')) do
  begin
    imprimeLinhaECF(marca, '                     ', False, False, False, False, False, False, False);
  end;

  frm_principal.memo_avisos.Lines.LoadFromFile(caminhoArquivoExtrato);
  imprimeTextoMiniPrinter(frm_principal.memo_avisos.Lines.Text);
  FreeAndNil(q);

end;

procedure tdm.SelecionaTodosOsItensMovimentoMesa(ASelecionar: Boolean);
begin

  try
    try
      tbMovimentoMesa.DisableControls;
      tbMovimentoMesa.First;
      while not tbMovimentoMesa.Eof do
      begin
        tbMovimentoMesa.Edit;

        if ASelecionar then
          tbMovimentoMesa.FieldByName('selecionado').Value := 1
        else
          tbMovimentoMesa.FieldByName('selecionado').Value := 0;

        tbMovimentoMesa.Post;
        tbMovimentoMesa.Next;
      end;
    except
      on E: Exception do
      begin
        raise Exception.Create(E.Message);
      end;

    end;
  finally
    tbMovimentoMesa.EnableControls;
  end;
end;

procedure Tdm.gravarEstornoDeItem(AMesa: string; codMotivo: string; descricaoMotivo: string; CodProduto: string; descriCaoProduto: string; qtde: Double; valorUnitario: Double; obs: string; imprimirCancelamento: Boolean; codCliente: string; nomeCliente: string; idMovimento: Integer);
var
  codEstorno: string;
  LSQL: TStringlist;
begin

  LSQL := TStringlist.create;

  try
    try
      begin

        codEstorno := geraCodigo('G_ESTORNOS', 6);
        LSQL.clear;
        LSQL.Add(' insert into estornos (codigo,cod_motivo,descricaoMotivo,mesa,cod_produto,descricao,quantidade,valor_unitario,cod_caixa,obs,cod_usuario_autorizou,nome_usuario_autorizou,ID,cod_empresa ) values (');
        LSQL.Add(QuotedStr(codEstorno) + ',');
        LSQL.Add(QuotedStr(codMotivo) + ',');
        LSQL.Add(QuotedStr(descricaoMotivo) + ',');
        LSQL.Add(QuotedStr(AMesa) + ',');
        LSQL.Add(QuotedStr(CodProduto) + ',');
        LSQL.Add(QuotedStr(descriCaoProduto) + ',');
        LSQL.Add(TrocaVirgPPto(FloatToStr(qtde)) + ',');
        LSQL.Add(TrocaVirgPPto(FloatToStr(valorUnitario)) + ',');
        LSQL.Add(QuotedStr(ultimoCaixaAberto) + ',');
        LSQL.Add(QuotedStr(obs) + ',');
        LSQL.Add(QuotedStr(codigo_usuario_responsavel) + ',');
        LSQL.Add(QuotedStr(nome_usuario_responsavel) + ',');
        LSQL.Add(IntToStr(idMovimento) + ',');
        LSQL.Add(QuotedStr(codEmpresa) + ');');
        executaSQL(LSQL.Text);

        if (StrToInt(LeIni(1, 'CANCELAMENTO_DE_ITEM', 'imprime_comprovante')) = 1) then
          dm.imprimirEstornoDeItem(codEstorno, codCliente, nomeCliente);

      end;
    except
      on E: Exception do
      begin
        raise Exception.Create('Erro ao gravar estorno de ítem! ' + LineBreak + E.message);
      end;
    end;
  finally
    FreeAndNil(LSQL);
  end;

  if imprimirCancelamento then
    imprimeCancelamentoPedidoProducao(codEstorno);

end;

procedure Tdm.ImprimeTransferenciaProdutos(ATransferencia: TTransferenciaItem);
var
  LComprovanteTransferencia: TStringList;
  LCodProduto, LDescricaoProduto, LValorUnitario, LQuantidade, LTotal: string;
  LDeslocamentoNormal, LDeslocamentoExpandido, LctLinhas: integer;
begin
  LComprovanteTransferencia := TStringList.Create;
  tbMovimentoMesa.DisableControls;
  try
    try

      LDeslocamentoNormal := StrToInt(LeIni(2, 'extrato', 'deslocamentoNormal'));
      LDeslocamentoExpandido := StrToInt(LeIni(2, 'extrato', 'deslocamentoExpandido'));
      LComprovanteTransferencia.add('</linha_dupla>');
      LComprovanteTransferencia.add('<e><n>' + PadCenter(nome_fantasia, 24 - LDeslocamentoExpandido, ' ') + '</n></e>');
      LComprovanteTransferencia.add('<e></ae><n>Movimento:</N><e></ae>:vpDataMovimento </e>');
      LComprovanteTransferencia.add('</fn></ae><n>Hora desta impressão: </N></fn>:vpHoraImpressao');
      LComprovanteTransferencia.add('Caixa Nº: ' + ultimoCaixaAberto);
      LComprovanteTransferencia.add('Operador: ' + nome_usuario);
      LComprovanteTransferencia.add('<e>' + PadCenter('Transf de ítens', 24 - LDeslocamentoExpandido, ' ') + '</e>');
      LComprovanteTransferencia.add('</linha_simples>');
      LComprovanteTransferencia.add('<e>Origem: ' + ATransferencia.MesaOrigem + ' </e>');
      LComprovanteTransferencia.add('<e>Destino: ' + ATransferencia.MesaDestino + ' </e>');
      LComprovanteTransferencia.add('</linha_dupla>');
      LComprovanteTransferencia.add('<n>' + PadRight('Cód.', 7, ' ') + PadRight('Descrição', 41 - LDeslocamentoNormal) + '</n>');
      LComprovanteTransferencia.add('<n>' + PadRight('Qtde.', 14, ' ') + PadLeft('Vl Unitário', 15) + PadLeft('Total', 19 - LDeslocamentoNormal) + '</n>');
      LComprovanteTransferencia.add('</linha_simples>');
      LComprovanteTransferencia.Text := StringReplace(LComprovanteTransferencia.Text, ':vpDataMovimento', DateToStr(data_do_sistema), [rfReplaceAll]);
      LComprovanteTransferencia.Text := StringReplace(LComprovanteTransferencia.Text, ':vpHoraImpressao', FormatDateTime('DD/MM/YYY HH:MM', now), [rfReplaceAll]);

      tbMovimentoMesa.first;

      while not tbMovimentoMesa.Eof do
      begin

        if (tbMovimentoMesa.FieldByName('selecionado').Value = 1) then
        begin
          LCodProduto := tbMovimentoMesa.FieldByName('COD_BARRAS').Value;
          LDescricaoProduto := tbMovimentoMesa.FieldByName('descricao').Value;
          LValorUnitario := FormatFloat('R$ ###,###,##0.00', tbMovimentoMesa.FieldByName('valor_unitario').Value);
          if Frac(tbMovimentoMesa.FieldByName('quantidade').Value) > 0 then
            LQuantidade := FormatFloat('#0.000', tbMovimentoMesa.FieldByName('quantidade').Value)
          else
            LQuantidade := IntToStr(tbMovimentoMesa.FieldByName('quantidade').Value);

          LTotal := FormatFloat('R$ ###,###,##0.00', tbMovimentoMesa.FieldByName('total').Value);

          LComprovanteTransferencia.add(PadRight(LCodProduto, 7, ' ') + PadRight(LDescricaoProduto, 41 - LDeslocamentoNormal));
          LComprovanteTransferencia.add(PadRight(LQuantidade, 14, ' ') + PadLeft(LValorUnitario, 15) + PadLeft(LTotal, 19 - LDeslocamentoNormal));
        end;
        tbMovimentoMesa.Next;
      end;

      LComprovanteTransferencia.add('</linha_simples>');

      LComprovanteTransferencia.add('<e> </e>');
      LComprovanteTransferencia.add('<e>Obs</e>');
      LComprovanteTransferencia.add(ATransferencia.Observacao);
      LComprovanteTransferencia.add('<e> </e>');
      LComprovanteTransferencia.add('</fn></ce>--------------------------');
      LComprovanteTransferencia.add('</fn></ce> Assinatura do responsável');

      for LctLinhas := 1 to StrToInt(LeIni(2, 'IMPRESSORA_NAO_FISCAL_01', 'linhasAposCupom')) do
      begin
        LComprovanteTransferencia.add(' ');
      end;

      configuraImpressoraNaoFiscal();
      imprimeTextoACBR(LComprovanteTransferencia);
      dm.adicionaLog(LComprovanteTransferencia.Text);
    except
      on E: Exception do
      begin
        raise Exception.Create('Erro ao imprimir a transferência! ' + sLineBreak + E.Message);
      end;
    end;
  finally
    FreeAndNil(LComprovanteTransferencia);
    tbMovimentoMesa.EnableControls;

  end;
end;

procedure Tdm.AgruparNomesClienteMesa(ANomeCliente: string);
var
  LListaSQL: TList<string>;
  LSQL: TStringList;
  ACodigosTransferidos: string;
  LPegouNOme: boolean;
  LIdsTransferir: string;
begin
  LListaSQL := TList<string>.Create;
  LSQL := TStringList.Create;
  ACodigosTransferidos := '';
  LPegouNOme := false;

  try
    LIdsTransferir := '(-1';
    tbMovimentoMesa.DisableControls;
    tbMovimentoMesa.First;
    while not tbMovimentoMesa.Eof do
    begin
      if (tbMovimentoMesa.FieldByName('selecionado').Value = 1) then
      begin
        LIdsTransferir := LIdsTransferir + ',' + Inttostr(tbMovimentoMesa.FieldByName('id').Value);
      end;
      tbMovimentoMesa.Next;
    end;

    LIdsTransferir := LIdsTransferir + ');';

    LSQL.add('update movimento_mesa ms set ms.nome_cliente =' + Quotedstr(ANomeCliente) + ' where ms.id in ' + LIdsTransferir);
    executaSQL(LSQL.Text);

  finally
    FreeAndNil(LListaSQL);
    FreeAndNil(LSQL);
    tbMovimentoMesa.EnableControls;

  end;

end;

procedure Tdm.TransfereProdutosSelecionados(ATransferencia: TTransferenciaItem);
var
  LListaSQL: TList<string>;
  LSQL: TStringList;
  ACodigosTransferidos: string;
begin

  LListaSQL := TList<string>.Create;
  LSQL := TStringList.Create;
  ACodigosTransferidos := '';

  try
    try
      tbMovimentoMesa.DisableControls;
      tbMovimentoMesa.First;
      while not tbMovimentoMesa.Eof do
      begin
        if (tbMovimentoMesa.FieldByName('selecionado').Value = 1) then
        begin
          ATransferencia.CodTransferencia := geraCodigo('G_TRANSFERENCIAS_PRODUTO', 6);
          ATransferencia.IDMovimento := tbMovimentoMesa.FieldByName('id').Value;
          ATransferencia.CodProduto := tbMovimentoMesa.FieldByName('cod_produto').Value;
          ATransferencia.DescricaoProduto := tbMovimentoMesa.FieldByName('descricao').Value;
          ATransferencia.Quantidade := tbMovimentoMesa.FieldByName('quantidade').Value;
          ATransferencia.ValorUnitario := tbMovimentoMesa.FieldByName('valor_unitario').Value;
          gravarTransferenciaDeItem(LListaSQL, ATransferencia);
          ACodigosTransferidos := ACodigosTransferidos + ',' + ATransferencia.CodTransferencia;
        end;
        tbMovimentoMesa.Next;
      end;

      dm.ExecutaBlocoDeInstrucoes(LListaSQL, 20);
    except
      on E: Exception do
      begin
        raise Exception.Create('Erro ao transferir ítens!' + sLineBreak + sLineBreak + E.Message);
      end;
    end;
  finally
    FreeAndNil(LListaSQL);
    FreeAndNil(LSQL);
    tbMovimentoMesa.EnableControls;

  end;
end;

procedure Tdm.RecebePedidosLancamentoIndividual(AMesaDestino: string);
var
  LSQL: TStringList;
  LMemTable: TFDMemTable;
  LGuidPagamento: string;
  LListaSQL: TList<string>;
begin
  LSQL := TStringList.Create;
  LMemTable := TFDMemTable.Create(self);
  LListaSQL := TList<string>.Create;
  LGuidPagamento := tbMovimentoMesa.FieldByName('GUID_PAGAMENTO').Value;

  try
    try
      LSQL.Clear;
      LListaSQL.Clear;
      LSQL.add(' update movimento_mesa set cod_mesa=' + Quotedstr(AMesaDestino));
      LSQL.add(',obs_paf=' + Quotedstr('TF pagamento'));
      LSQL.add(' where GUID_PAGAMENTO=' + QuotedStr(LGuidPagamento) + ';');
      LListaSQL.Add(LSQL.Text);

      LSQL.Clear;
      LSQL.Add(' update RECEBIMENTO_PARCIAL set mesa=' + Quotedstr(AMesaDestino) + ' where GUID_PAGAMENTO=' + QuotedStr(LGuidPagamento) + ';');
      LListaSQL.Add(LSQL.Text);
      ExecutaBlocoDeInstrucoes(LListaSQL, 30);

    except
      on E: Exception do
      begin
        raise Exception.Create(E.Message);
      end;

    end;
  finally
    FreeAndNil(LSQL);
    FreeAndNil(LMemTable);
    FreeAndNil(LListaSQL);
  end;

end;

procedure Tdm.SepararContaCliente(AMesaOrigem: string; AMesaDestino: string; ACodCliente: string);
var
  LSQL: TStringList;
  LMemTable: TFDMemTable;
  LGuidPagamento: string;
  LListaSQL: TList<string>;
begin
  LSQL := TStringList.Create;
  LMemTable := TFDMemTable.Create(self);
  LListaSQL := TList<string>.Create;
  LGuidPagamento := tbMovimentoMesa.FieldByName('GUID_PAGAMENTO').Value;

  try
    try
      LSQL.Clear;
      LListaSQL.Clear;
      LSQL.add(' update movimento_mesa set cod_mesa=' + Quotedstr(AMesaDestino));
      LSQL.add(',obs_paf=' + Quotedstr('TF pagamento'));
      LSQL.add(' where cod_mesa=' + QUotedstr(AMesaOrigem) + ' and nome_cliente=' + Quotedstr(ACodCliente) + ';');
      LListaSQL.Add(LSQL.Text);
      dm.adicionaLog(LSQL.text);

      {
      LSQL.Clear;
      LSQL.Add(' update RECEBIMENTO_PARCIAL set mesa=' + Quotedstr(AMesaDestino) + ' where GUID_PAGAMENTO=' + QuotedStr(LGuidPagamento) + ';');
      LListaSQL.Add(LSQL.Text);
      }
      ExecutaBlocoDeInstrucoes(LListaSQL, 30);

    except
      on E: Exception do
      begin
        raise Exception.Create(E.Message);
      end;

    end;
  finally
    FreeAndNil(LSQL);
    FreeAndNil(LMemTable);
    FreeAndNil(LListaSQL);
  end;

end;

function Tdm.BuscaMesaDestinoRecebimentoIndividual(): string;
var
  LSQL: TStringList;
  LMemTable: TFDMemTable;
begin
  LSQL := TStringList.Create;
  LMemTable := TFDMemTable.Create(self);

  try
    try
      LSQL.Clear;
      LSQL.Add('select first 1 c.cod_cartao as mesa from cartoes c ');
      LSQL.Add(' where c.cod_cartao between ' + Quotedstr('0700') + ' and ' + Quotedstr('0800'));
      LSQL.Add('  and c.cod_cartao not in    ');
      LSQL.Add('   ( select distinct cod_mesa from movimento_mesa ');
      LSQL.Add('union all ');
      LSQL.Add('    select distinct rp.mesa as cod_mesa from recebimento_parcial rp )');
      LSQL.Add(' order by c.cod_cartao');
      dm.adicionaLog(LSQL.text);
      getMemTable(LMemTable, LSQL.Text);
      if LMemTable.IsEmpty = false then
        result := LMemTable.Fields[0].Value;

    except
      on E: Exception do
      begin
        raise Exception.Create(E.Message);
      end;

    end;
  finally
    FreeAndNil(LSQL);
    FreeAndNil(LMemTable);
  end;

end;

function Tdm.ValidaParametrosTransferenciaItem(AMesaOrigem: string; AMesaDestino: string): Boolean;
begin

  result := false;

  try

    try
      AMesaOrigem := FormatFloat('0000', StrToInt(AMesaOrigem));
      if StrToInt(AMesaOrigem) > 999 then
        raise Exception.Create('Mesa de origem inválida!');
    except
      raise Exception.Create('Mesa de origem inválida!');
    end;

    try

      AMesaOrigem := FormatFloat('0000', StrToInt(AMesaDestino));
      if StrToInt(AMesaOrigem) > 999 then
        raise Exception.Create('Mesa de destino inválida!');
      result := true;
    except
      raise Exception.Create('Mesa de destino inválida!');
    end;

  finally

  end;

end;

procedure Tdm.gravarTransferenciaDeItem(AListaSQL: TList<string>; ATransferencia: TTransferenciaItem);
var
  LSQL: Tstringlist;
begin

  LSQL := TStringList.Create;
  LSQL.Clear;

  try
    try
      ATransferencia.MesaOrigem := FormatFloat('0000', StrToInt(ATransferencia.MesaOrigem));
      ATransferencia.MesaDestino := FormatFloat('0000', StrToInt(ATransferencia.MesaDestino));

      LSQL.clear;
      LSQL.add(' insert into TRANSFERENCIAS_PRODUTO(codigo,id_movimento,mesa_origem,mesa_destino,cod_motivo,cod_produto,descricao,quantidade,valor_unitario,cod_caixa,obs,COD_USUARIO_AUTORIZOU,NOME_USUARIO_AUTORIZOU,cod_empresa) values (');
      LSQL.add(QuotedStr(ATransferencia.CodTransferencia) + ',');
      LSQL.add(Inttostr(ATransferencia.IDMovimento) + ',');
      LSQL.add(QuotedStr(ATransferencia.MesaOrigem) + ',');
      LSQL.add(QuotedStr(ATransferencia.MesaDestino) + ',');
      LSQL.add(QuotedStr(ATransferencia.CodMOtivo) + ',');
      LSQL.add(QuotedStr(ATransferencia.CodProduto) + ',');
      LSQL.add(QuotedStr(ATransferencia.DescricaoProduto) + ',');
      LSQL.add(TrocaVirgPPto(FloatToStr(ATransferencia.Quantidade)) + ',');
      LSQL.add(TrocaVirgPPto(FloatToStr(ATransferencia.ValorUnitario)) + ',');
      LSQL.add(QuotedStr(ultimoCaixaAberto) + ',');
      LSQL.add(QuotedStr(ATransferencia.Observacao) + ',');
      LSQL.add(QuotedStr(codigo_usuario_responsavel) + ',');
      LSQL.add(QuotedStr(nome_usuario_responsavel) + ',');
      LSQL.add(QuotedStr(CodEmpresa) + ');');
      AListaSQL.Add(LSQL.Text);

      LSQL.Clear;
      LSQL.add(' update movimento_mesa set cod_mesa=' + Quotedstr(ATransferencia.MesaDestino));
      LSQL.add(',obs_paf=' + Quotedstr('TF. mesa ' + IntToStr(StrToInt(ATransferencia.MesaOrigem))));
      LSQL.add(' where id=' + Inttostr(ATransferencia.IDMovimento) + ';');
      AListaSQL.Add(LSQL.Text);

    except
      on E: Exception do
      begin
        raise Exception.Create('Erro ao gravar transferência de ítem! ' + sLineBreak + sLineBreak + E.Message);
      end;
    end;
  finally
    FreeAndNil(LSQL);
  end;
end;

function Tdm.retornaCodProduto(codBarrasProduto: string): string;
var
  q: TIBQuery;
begin
  q := TIBQuery.Create(self);
  q.Database := dm.dbrestaurante;
  q.Transaction := dm.transacao;
  q.Active := False;

  q.SQL.Clear;
  q.SQL.add('select cod_produto from produtos where cod_barras=' + QuotedStr(codBarrasProduto));
  q.Active := True;
  result := q.fieldbyname('cod_produto').value;

  q.Active := False;
  FreeAndNil(q);
end;

function Tdm.getCodMetreResponsavel(codGarcon: string): string;
var
  Q: TIBQuery;
begin
  Q := TIBQuery.Create(self);
  Q.Database := dm.dbrestaurante;
  Q.Transaction := dm.transacao;
  Q.Active := False;
  Q.SQL.clear;

  Q.sql.add('select coalesce(cod_metre,' + Quotedstr('000') + ') as cod_metre from garcons where cod_garcon=' + QuotedStr(codGarcon));
  Q.active := True;

  result := Q.fieldbyname('cod_metre').value;

  Q.Active := False;
  FreeAndNil(Q);

end;

function TDM.getNomeGarconAbriuMesa(AMesa: string): string;
var
  LSQL: TStringList;
  LTbAux: TFDMemTable;
begin
  LTbAux := TFDMemTable.Create(Self);
  LSQL := TstringList.create;

  try
    try

      LSQL.Add('select first 1 g.apelido as apelido from movimento_mesa mv');
      LSQL.add(' inner join garcons g on (g.cod_garcon = mv.cod_garcon)');
      LSQL.add(' where ');
      LSQL.add(' mv.cod_mesa=' + QuotedStr(AMesa) + ' order by mv.hora_lancamento');
      dm.getMemTable(LTbAux, LSQL.Text);

      if LTbAux.IsEmpty = false then
        result := LTbAux.fieldbyname('apelido').value
      else
        result := '';

    except
      on E: Exception do
      begin
        dm.exibe_painel_erro('Erro ao buscar o nome do Garçon que abriu a mesa ' + sLineBreak + sLineBreak + E.Message, 'Ok');
        raise Exception.Create('Erro ao buscar o nome do Garçon que abriu a mesa ' + sLineBreak + sLineBreak + E.Message);
      end;
    end;
  finally
    FreeAndNil(LSQL);
    LTbAux.Active := false;
    FreeAndNil(LTbAux);
  end;
end;

function Tdm.getCodGarconAbriuMesa(AMesa: string): string;
var
  LSQL: TStringList;
  LTbAux: TFDMemTable;
begin
  LTbAux := TFDMemTable.Create(Self);
  LSQL := TstringList.create;

  try
    try

      LSQL.Add('select first 1 g.cod_garcon from movimento_mesa mv');
      LSQL.add(' inner join garcons g on (g.cod_garcon = mv.cod_garcon)');
      LSQL.add(' where ');
      LSQL.add(' mv.cod_mesa=' + QuotedStr(AMesa) + ' order by mv.hora_lancamento');
      dm.getMemTable(LTbAux, LSQL.Text);

      if LTbAux.IsEmpty = false then
        result := LTbAux.fieldbyname('cod_garcon').value
      else
        result := '';

    except
      on E: Exception do
      begin
        dm.exibe_painel_erro('Erro ao buscar o código do  Garçon que abriu a mesa ' + sLineBreak + sLineBreak + E.Message, 'Ok');
        raise Exception.Create('Erro ao buscar o código  do Garçon que abriu a mesa ' + sLineBreak + sLineBreak + E.Message);
      end;
    end;
  finally
    FreeAndNil(LSQL);
    LTbAux.Active := false;
    FreeAndNil(LTbAux);
  end;
end;

function Tdm.getHoraAberturaDaMesa(AMesa: string): TTime;
var
  Q: TIBQuery;
begin
  Q := TIBQuery.Create(self);
  Q.Database := dm.dbrestaurante;
  Q.Transaction := dm.transacao;
  Q.Active := False;
  Q.SQL.clear;

  Q.SQL.Add('select mv.hora mv');
  Q.sql.add(' where ');
  Q.sql.add(' mv.cod_mesa=' + QuotedStr(AMesa) + ' order by mv.cod_movimento');
  Q.Active := True;
  result := Q.fieldbyname('hora_lancamento').value;

  Q.Active := False;
  FreeAndNil(Q);
end;

function Tdm.imprimirExtratoTerminal(marca: Integer; modelo: Integer): string;
begin
//  dm.imprime_cabecalho_Cupom(marca_impressora_nao_fiscal_01,modelo_impressora_nao_fiscal_01,1,lb_mesa.caption,StrToInt(dm.LeIni(1,'EXTRATO','layout')),'' );
//  dm.imprime_MovimentoNF(marca_impressora_nao_fiscal_01,modelo_impressora_nao_fiscal_01,lb_mesa.Caption,StrToInt(dm.LeIni(1,'EXTRATO','layout'))  );
//  dm.imprimeRecebimentosParciais(marca,modelo,lb_mesa.Caption);
//  dm.imprime_rodape_ExtratoContaNF(marca_impressora_nao_fiscal_01,modelo_impressora_nao_fiscal_01,1,StrToInt(ed_n_pessoas.text),
//  ed_valor_bruto.Value,ed_total_couvert.Value,ed_total_tx_serv.Value,0, ed_total_desconto.value,ed_total_conta.Value, dm.getTotalPagamentosParciais(lb_mesa.Caption),0,1);
end;



{
function Tdm.ImprimeCabecalhoExtrato(Arquivo : string; numImpressora,tipo : integer ; mesa : string; layout : integer; codVenda : string) : boolean;
var
 str : string;
begin

   dm.imprimeLinhaEmArquivo(Arquivo,numImpressora,'------------------------------------------------',false,false,false,false,true,false,false);
   case tipo of
     1: dm.imprimeLinhaEmArquivo(Arquivo,numImpressora, dm.centralizar('Extrato de conta',24),false,false,false,false,true,true,true);
     2: dm.imprimeLinhaEmArquivo(Arquivo,numImpressora, dm.centralizar('Encerramento de conta',24),false,false,false,false,true,true,true);
     3: dm.imprimeLinhaEmArquivo(Arquivo,numImpressora, dm.centralizar('Estorno de mesa',24),false,false,false,false,true,true,true);
   end;

   if ( trim(codVenda) <> '') then
   begin
     dm.imprimeLinhaEmArquivo(Arquivo,numImpressora,dm.centralizar('COD. '+codVenda,24),false,false,false,false,true,true,true);
   end;

   dm.imprimeLinhaEmArquivo(Arquivo,numImpressora,dm.centralizar(dm.LeIni(2,'CAIXA','titulo_cabecalho_cupom')+' '+mesa,24),false,false,false,false,true,true,true);
   str:=FormatDateTime('DD/MM/YYY',DATE)+' '+FormatDateTime('HH:MM:SS',time);
   dm.imprimeLinhaEmArquivo(Arquivo,numImpressora,str,false,false,false,false,true,false,false);
   str:='Operador: '+nome_usuario;
   dm.imprimeLinhaEmArquivo(Arquivo,numImpressora,str,false,false,false,false,true,false,false);
   dm.imprimeLinhaEmArquivo(Arquivo,numImpressora,'------------------------------------------------------------', false,false,false,false,true,false,true);
   if (trim(getNomeGarconAbriuMesa(mesa)) <> 'BALCAO') then
   begin
     Str:='Garcon: '+getNomeGarconAbriuMesa(mesa);
     dm.imprimeLinhaEmArquivo(Arquivo,numImpressora,str,false,false,false,false,true,false,false);
   end;

   dm.imprimeLinhaEmArquivo(Arquivo,numImpressora,'------------------------------------------------------------', false,false,false,false,true,false,true);
   str:='########****************************';
   str:=dm.organizarCupom(str,'Cod.','#');
   str:=dm.organizarCupom(str,'Descricao','*');
   dm.imprimeLinhaEmArquivo(Arquivo,numImpressora,str,false,false,false,false,false,false,false);
   str:='##########$$$$$********%%%%%%%%%%%%%';
   str:=dm.organizarCupom(str,'Qtd.','#');
   str:=dm.organizarCupom(str,' ','$');
   str:=dm.organizarCupom(str,'Vl. un.','*');
   str:=dm.organizarCupom(str,'Total','%');
   dm.imprimeLinhaEmArquivo(Arquivo,numImpressora,str,false,false,false,false,false,false,false);
   dm.imprimeLinhaEmArquivo(Arquivo,numImpressora,'------------------------------------------------------------', false,false,false,false,true,false,true);

      5: begin  // Epson
            case modelo of
             1:  begin    // Térmica TM-T88II

                   dm.imprime_linha_impNF(marca,modelo,dm.centralizar(nome_fantasia,30),true,false,false,true,false,true,false);
                   dm.imprime_linha_impNF(marca,modelo,'------------------------------------------------------',false,false,false,true,false,false,false);


                  case tipo of
                   1: dm.imprime_linha_impNF(marca,modelo,dm.centralizar('Extrato de conta',24),true,false,false,true,false,true,false);
                   2: dm.imprime_linha_impNF(marca,modelo,dm.centralizar('Encerramento de conta',24),true,false,false,true,false,true,false);
                   3: dm.imprime_linha_impNF(marca,modelo,dm.centralizar('Estorno de mesa',24),true,false,false,true,false,true,false);
                   4: dm.imprime_linha_impNF(marca,modelo,dm.centralizar('COMPROVANTE DE PEDIDO ',24),true,false,false,true,false,true,false);
                  end;

                   if ( trim(codVenda) <> '') then
                   begin
                    dm.imprime_linha_impNF(marca,modelo,dm.centralizar('COD. '+codVenda,24),true,false,false,true,false,true,false);
                   end;

                   if (verificaMesaBalcao(mesa) = false) then
                     dm.imprime_linha_impNF(marca,modelo,dm.centralizar(dm.LeIni(2,'CAIXA','titulo_cabecalho_cupom')+' '+mesa,30),true,false,false,true,false,true,false)
                   else
                    dm.imprime_linha_impNF(marca,modelo,dm.centralizar(dm.getDescricaoPedidoBalcao,30),true,false,false,true,false,true,false);



                   str:=FormatDateTime('DD/MM/YYY',DATE)+' '+FormatDateTime('HH:MM:SS',time);
                   dm.imprime_linha_impNF(marca,modelo,str,false,false,false,false,true,false,false);
                   str:='Operador: '+nome_usuario;
                   dm.imprime_linha_impNF(marca,modelo,str,false,false,false,false,true,false,false);
                   if (trim(getNomeGarconAbriuMesa(mesa)) <> 'BALCAO') then
                   begin
                     Str:='Garcon: '+getNomeGarconAbriuMesa(mesa);
                     dm.imprime_linha_impNF(marca,modelo,str,false,false,false,false,true,false,false);
                   end;
                   dm.imprime_linha_impNF(marca,modelo,'--------------------------------------------------------',false,false,false,true,false,false,false);

                   if (tipo <> 2 ) then
                   begin
                     if (layout = 1) then
                       begin
                         str:='########********************************';
                         str:=dm.organizarCupom(str,'Cod.','#');
                         str:=dm.organizarCupom(str,'Descricao','*');
                         dm.imprime_linha_impNF(marca,modelo,str,false,false,false,false,true,false,false);
                         str:='##########$$$$$***************%%%%%%%%%%';
                         str:=dm.organizarCupom(str,'Qtd.','#');
                         str:=dm.organizarCupom(str,' ','$');
                         str:=dm.organizarCupom(str,'Vl. un.','*');
                         str:=dm.organizarCupom(str,'Total','%');
                         dm.imprime_linha_impNF(marca,modelo,str,false,false,false,false,true,false,false);
                       end
                     else
                       begin
                         str:='###***************************%%%%%%%%%%%%%%';
                         str:=dm.organizarCupom(str,'Qtd','#');
                         str:=dm.organizarCupom(str,'Descricao','*');
                         str:=dm.organizarCupom(str,'Total','%');
                       end;
                       dm.imprime_linha_impNF(marca,modelo,'--------------------------------------------------------',false,false,false,true,false,false,false);
                   end;
                 end;



          end;

         end;
    end;

end;


}

procedure Tdm.gravaStrEmArquivoDeTexto(arquivo: string; str: string);
var
  f: TextFile;
begin
  AssignFile(f, arquivo);
  if (FileExists(arquivo) = False) then
    Rewrite(f)
  else
    Append(f);
  Write(f, str);
  CloseFile(f);
end;

procedure Tdm.adicionaLinhaArquivoExtrato(str: string);
var
  f: TextFile;
begin
  str := chr(13) + chr(10) + str;
  AssignFile(f, caminhoArquivoExtrato);
  if (FileExists(caminhoArquivoExtrato) = False) then
    Rewrite(f)
  else
    Append(f);
  Write(f, str);
  CloseFile(f);
end;

procedure Tdm.gravaCabecalhoPedidoDelivery(Arquivo: string; marca: Integer; modelo: Integer; codigoPedido: string; operacao: SmallInt);
var
  str: string;
  frmVazio: Tfrm_modelo_vazio;
  f: TextFile;
begin
  Application.CreateForm(Tfrm_modelo_vazio, frmVazio);
  dm.imprimeLinhaEmArquivo(Arquivo, marca, modelo, dm.centralizar(nome_fantasia, 24), False, False, False, True, True, True, True);

  dm.qryauxiliar.Active := False;
  dm.qryauxiliar.sql.clear;
  dm.qryauxiliar.sql.add('select p.cod_cliente, cd.nome,udf_trim( cd.endereco) as endereco, b.descricao as bairro, p.retira_balcao from pedidos_delivery p ');
  dm.qryauxiliar.sql.add(' inner join clientes_delivery  cd on (cd.codigo = p.cod_cliente) ');
  dm.qryauxiliar.sql.add('inner join bairro b on (b.codigo = cd.cod_bairro) ');
  dm.qryauxiliar.sql.add('  where p.codigo=' + QuotedStr(codigoPedido));
  dm.qryauxiliar.Active := True;

  case operacao of
    1:
      begin
        dm.imprimeLinhaEmArquivo(Arquivo, marca, modelo, dm.centralizar('DELIVERY', 24), False, False, False, True, True, True, True);
        dm.imprimeLinhaEmArquivo(Arquivo, marca, modelo, dm.centralizar(codigoPedido, 24), False, False, False, True, True, True, True);

        str := 'CLIENTE: ' + dm.qryauxiliar.fieldbyname('cod_cliente').Value + ' - ' + dm.qryauxiliar.fieldbyname('nome').Value;
        dm.imprimeLinhaEmArquivo(Arquivo, marca, modelo, str, False, False, False, False, True, False, False);

        if imprimeEnderecoNaProducaoDelivery then
        begin
          str := 'ENDEREÇO: ' + dm.qryauxiliar.fieldbyname('ENDERECO').Value;
          dm.imprimeLinhaEmArquivo(Arquivo, marca, modelo, str, False, False, False, False, True, False, False);

          str := 'BAIRRO: ' + dm.qryauxiliar.fieldbyname('BAIRRO').Value;
          dm.imprimeLinhaEmArquivo(Arquivo, marca, modelo, str, False, False, False, False, True, False, False);
        end;

      end;

    2:
      begin
        dm.imprimeLinhaEmArquivo(Arquivo, marca, modelo, dm.centralizar('## ALTERAR O PEDIDO ##', 24), False, False, False, True, True, True, True);
        dm.imprimeLinhaEmArquivo(Arquivo, marca, modelo, dm.centralizar(codigoPedido, 24), False, False, False, True, True, True, True);
      end;

    3:
      begin
        dm.imprimeLinhaEmArquivo(Arquivo, marca, modelo, dm.centralizar('!! CANCELAR O PEDIDO !!', 24), False, False, False, True, True, True, True);
        dm.imprimeLinhaEmArquivo(Arquivo, marca, modelo, dm.centralizar(codigoPedido, 24), False, False, False, True, True, True, True);
      end;
  end;

  dm.imprimeLinhaEmArquivo(Arquivo, marca, modelo, '', False, False, False, False, True, False, False);
  str := 'Data: ' + FormatDateTime('DD/MM/YYY', Date);
  dm.imprimeLinhaEmArquivo(Arquivo, marca, modelo, str, False, False, False, False, True, False, False);
  str := 'Hora: ' + FormatDateTime('HH:MM:SS', Time);
  dm.imprimeLinhaEmArquivo(Arquivo, marca, modelo, str, False, False, False, False, True, False, False);

  if dm.qryauxiliar.fieldbyname('retira_balcao').Value = 1 then
  begin
    dm.imprimeLinhaEmArquivo(Arquivo, marca, modelo, '------------------------------------------------', False, False, False, False, True, False, False);
    dm.imprimeLinhaEmArquivo(Arquivo, marca, modelo, dm.centralizar('RETIRAR NO BALCAO', 24), False, False, False, True, True, True, True);
  end;

  dm.imprimeLinhaEmArquivo(Arquivo, marca, modelo, '------------------------------------------------', False, False, False, False, True, False, False);
  str := '#########*******************************';
  str := dm.organizarCupom(str, 'Qtde', '#');
  str := dm.organizarCupom(str, 'Descricao', '*');
  str := dm.organizarCupom(str, '', '*');
  dm.imprimeLinhaEmArquivo(Arquivo, marca, modelo, str, False, False, False, False, True, False, False);
  FreeAndNil(frmVazio);
  dm.qryauxiliar.Active := False;
end;

procedure Tdm.gravaCabecalhoPedidoNoArquivoDeImpressao(Arquivo: string; n_seq: string; cod_garcon: string; marca: Integer; modelo: Integer; AMesa: string; tipo: Integer);
var
  str: string;
  frmVazio: Tfrm_modelo_vazio;
  f: TextFile;
begin
  Application.CreateForm(Tfrm_modelo_vazio, frmVazio);

  case tipo of
    1:
      begin
        dm.imprimeLinhaEmArquivo(Arquivo, marca, modelo, dm.centralizar('PEDIDO ' + n_seq, 24), False, False, False, True, True, True, True);
        dm.imprimeLinhaEmArquivo(Arquivo, marca, modelo, str, False, False, False, False, True, False, False);
      end;
    2:
      begin
        dm.imprimeLinhaEmArquivo(Arquivo, marca, modelo, dm.centralizar('********************', 24), False, False, False, True, True, True, True);
        dm.imprimeLinhaEmArquivo(Arquivo, marca, modelo, dm.centralizar('*** CANCELAMENTO ***', 24), False, False, False, True, True, True, True);
        dm.imprimeLinhaEmArquivo(Arquivo, marca, modelo, dm.centralizar('********************', 24), False, False, False, True, True, True, True);
        dm.imprimeLinhaEmArquivo(Arquivo, marca, modelo, str, False, False, False, False, True, False, False);
      end;
    3:
      dm.imprimeLinhaEmArquivo(Arquivo, marca, modelo, dm.centralizar('AVISO DE PEDIDO ATRASADO ' + n_seq, 24), True, False, False, True, False, True, False);
  end;

  if (dm.verificaMesaBalcao(AMesa) = False) then
  begin
    str := dm.centralizar('Mesa: ' + AMesa, 24);
    dm.imprimeLinhaEmArquivo(Arquivo, marca, modelo, str, False, False, False, True, True, True, True)
  end
  else
  begin
//       str:=dm.centralizar(dm.getDescricaoPedidoBalcao(),24);
    dm.imprimeLinhaEmArquivo(Arquivo, marca, modelo, str, False, False, False, False, True, True, True);
  end;

  str := 'Data: ' + FormatDateTime('DD/MM/YYY', Date);
  dm.imprimeLinhaEmArquivo(Arquivo, marca, modelo, str, False, False, False, False, True, False, False);
  str := 'Hora: ' + FormatDateTime('HH:MM:SS', Time);
  dm.imprimeLinhaEmArquivo(Arquivo, marca, modelo, str, False, False, False, False, True, False, False);
  str := 'Garcon: ' + frmVazio.getNomeGarcon(cod_garcon);
  dm.imprimeLinhaEmArquivo(Arquivo, marca, modelo, str, False, False, False, False, True, False, False);
  dm.imprimeLinhaEmArquivo(Arquivo, marca, modelo, '------------------------------------------', False, False, False, False, True, False, False);

  str := '#########*******************************';
  str := dm.organizarCupom(str, 'Qtde', '#');
  str := dm.organizarCupom(str, 'Descricao', '*');
  str := dm.organizarCupom(str, '', '*');
  dm.imprimeLinhaEmArquivo(Arquivo, marca, modelo, str, False, False, False, False, True, False, False);
  FreeAndNil(frmVazio);
end;

function Tdm.verificaTamanhoPizza(codigo: string; tipoCodigo: SmallInt): SmallInt;
var
  q: TIBQuery;
begin
  q := TIBQuery.create(self);
  q.database := dm.dbrestaurante;
  q.transaction := dm.transacao;

  q.active := False;
  q.sql.clear;
  q.sql.add(' select cod_produto, pizza, tam_pizza from produtos  ');
  if (tipoCodigo = 1) then
    q.sql.add(' where  cod_produto=' + QuotedStr(codigo))
  else
    q.sql.add(' where  cod_barras=' + QuotedStr(codigo));

  q.active := True;
  if (q.FieldByName('pizza').Value = 0) then
    result := 0
  else
  begin
    if q.FieldByName('tam_pizza').Value = 'B' then
      result := 1;
    if q.FieldByName('tam_pizza').Value = 'P' then
      result := 2;
    if q.FieldByName('tam_pizza').Value = 'M' then
      result := 3;
    if q.FieldByName('tam_pizza').Value = 'G' then
      result := 4;
    if q.FieldByName('tam_pizza').Value = 'F' then
      result := 5;
  end;

  q.Active := False;
  FreeAndNil(q);
end;

procedure Tdm.gravaProdutosDoPedidoNoArquivo(Arquivo: string; marca: Integer; modelo: Integer; codProduto: string; descricaoProduto: string; quantidade: Double; preco: Double; observacoes: string; sabores: string; tipoMassa: string; idLancamento: Integer);
var
  str: string;
  totalLinhas: Integer;
  LinhaAtual: Integer;
begin
  descricaoProduto := descricaoProduto;
   {

  case verificaTamanhoPizza(codProduto,1) of
   0: descricaoProduto := descricaoProduto;
//   1: descricaoProduto := 'PIZZA COMBO';
   1: descricaoProduto := 'PIZZA BROTINHO';
   2: descricaoProduto := 'PIZZA PEQUENA';
   3: descricaoProduto := 'PIZZA MEDIA';
   4: descricaoProduto := 'PIZZA GRANDE';
//   5: descricaoProduto := 'PIZZA DO DIA';
   5: descricaoProduto := 'PIZZA FAMILIA';
  end;
    }


  try
    begin
      str := '#####***********************************';
      StrToInt(FloatToStr(quantidade));
      str := dm.organizarCupom(str, IntToStr(StrToInt(FloatToStr(quantidade))), '#');
    end;
  except
    begin
      str := '#####***********************************';
      str := dm.organizarCupom(str, FormatFloat('#0.000', quantidade), '#');
    end;
  end;
  str := dm.organizarCupom(str, descricaoProduto, '*');
  dm.imprimeLinhaEmArquivo(Arquivo, marca, modelo, str, False, False, False, True, True, True, True);
  str := 'ID: ' + IntToStr(idLancamento);
  dm.imprimeLinhaEmArquivo(Arquivo, marca, modelo, str, False, False, False, False, True, False, False);
  if tipoMassa <> '' then
  begin
    dm.imprimeLinhaEmArquivo(Arquivo, marca, modelo, '# ' + tipoMassa + ' #', False, False, False, True, True, True, True);
  end;

  if ((Trim(sabores) <> '') or (Trim(observacoes) <> '')) then
  begin
    if (Trim(sabores) <> '') then
    begin
      frm_principal.memoObsMiniprinter.clear;
      frm_principal.memoObsMiniprinter.Lines.Add(Trim(sabores));

      dm.imprimeLinhaEmArquivo(Arquivo, marca, modelo, 'Sabores:', True, False, False, True, True, True, True);
      dm.imprimeLinhaEmArquivo(Arquivo, marca, modelo, '--', True, False, False, True, True, True, True);
      totalLinhas := frm_principal.memoObsMiniprinter.Lines.count;
      LinhaAtual := 0;
      str := '';
      while LinhaAtual < totalLinhas do
      begin
//           str:='########################################';
//           str:=dm.organizarCupom(str,frm_principal.memoObsMiniprinter.Lines[linhaAtual],'#');
        str := Trim(frm_principal.memoObsMiniprinter.Lines[LinhaAtual]);
        dm.imprimeLinhaEmArquivo(Arquivo, marca, modelo, str, False, False, False, True, True, True, True);
        LinhaAtual := LinhaAtual + 1;
      end;

    end;

    if (Trim(observacoes) <> '') then
    begin
      frm_principal.memoObsMiniprinter.clear;
      frm_principal.memoObsMiniprinter.Lines.Add(Trim(observacoes));
      dm.imprimeLinhaEmArquivo(Arquivo, marca, modelo, 'OBS:', True, False, False, True, True, True, True);
      totalLinhas := frm_principal.memoObsMiniprinter.Lines.count;
      LinhaAtual := 0;
      while LinhaAtual < totalLinhas do
      begin
        str := '########################################';
        str := dm.organizarCupom(str, frm_principal.memoObsMiniprinter.Lines[LinhaAtual], '#');
        dm.imprimeLinhaEmArquivo(Arquivo, marca, modelo, str, False, False, False, True, True, True, True);
        LinhaAtual := LinhaAtual + 1;
      end;
    end;
  end;
  dm.imprimeLinhaEmArquivo(Arquivo, marca, modelo, '------------------------------------------', False, False, False, False, True, False, False);
end;

procedure Tdm.saltosNoArquivoTexto(Arquivo: string; marca: Integer; modelo: Integer; saltos: Integer);
var
  ct: Integer;
begin
  for ct := 1 to saltos do
    dm.imprimeLinhaEmArquivo(Arquivo, marca, modelo, ' ', False, False, False, False, True, True, False);
end;

procedure Tdm.satGetcodigoDeAtivacao(var Chave: AnsiString);
begin
  dm.tb_parametros.Active := True;
  Chave := dm.tb_parametrosCOD_ATIVACAO_SAT.Value;
end;

procedure Tdm.satGetsignAC(var Chave: AnsiString);
begin
  dm.tb_parametros.Active := True;
  Chave := dm.tb_parametrosASSINATURA_SAT.Value;
end;

procedure Tdm.satGravarLog(const ALogLine: string; var Tratado: Boolean);
begin
  adicionaLogSAT(ALogLine);
  Tratado := False;
end;

procedure Tdm.satMensagemSEFAZ(ACod: Integer; AMensagem: string);
begin
  adicionaLog('Mensagem Sefaz: (' + IntToStr(ACod) + ') - ' + AMensagem);
end;

procedure Tdm.gravarStream(codStream: string; tipo: string; med: string; stream: string);
var
  Q: TIBQuery;
begin
  Q := TIBQuery.Create(self);
  Q.Database := dm.dbrestaurante;
  Q.Transaction := transacao;
  Q.Active := False;
  Q.SQL.clear;

  Q.SQL.add('insert into stream (cod_stream,data,hora,cod_usuario,tipo,med,stream) values(');
  Q.sql.add('' + QuotedStr(codStream) + ',');
  Q.sql.add('' + QuotedStr(FormatDateTime('DD.MM.YYY', data_do_sistema)) + ',');
  Q.sql.add('' + QuotedStr(FormatDateTime('HH:MM:SS', Time)) + ',');
  Q.sql.add('' + QuotedStr(codigo_usuario) + ',');
  Q.sql.add('' + tipo + ',');
  Q.sql.add('' + TrocaVirgPPto(med) + ',');
  Q.sql.add('' + QuotedStr(stream) + ')');
  Q.ExecSQL;

  Q.Active := False;
  FreeAndNil(Q);
end;

function Tdm.getCodGarconMesaBalcao(): string;
var
  Q: TIBQuery;
begin
  Q := TIBQuery.Create(self);
  Q.Database := dm.dbrestaurante;
  Q.Transaction := transacao;
  Q.Active := False;
  Q.SQL.clear;

  Q.SQL.add('select * from configuracoes_estacao where numero_caixa=' + QuotedStr(numero_caixa));
  Q.Active := True;
  result := Q.fieldbyname('cod_garcon').value;

  Q.Active := False;
  FreeAndNil(Q);

end;

function Tdm.getCodMesaBalcao(): string;
var
  Q: TIBQuery;
begin

  Q := TIBQuery.Create(self);
  Q.Database := dm.dbrestaurante;
  Q.Transaction := transacao;
  Q.Active := False;
  Q.SQL.clear;

  Q.SQL.add('select * from configuracoes_estacao where numero_caixa=' + QuotedStr(numero_caixa));
  Q.Active := True;
  result := Q.fieldbyname('cod_mesa').value;

  Q.Active := False;
  FreeAndNil(Q);
end;

function Tdm.getCodMesaDelivery(): string;
var
  Q: TIBQuery;
begin

  Q := TIBQuery.Create(self);
  Q.Database := dm.dbrestaurante;
  Q.Transaction := transacao;
  Q.Active := False;
  Q.SQL.clear;

  Q.SQL.add('select * from configuracoes_estacao where numero_caixa=' + QuotedStr(numero_caixa));
  Q.Active := True;

  if (Q.fieldbyname('cod_mesa_delivery').value = Null) then
  begin
    ShowMessage('Código de mesa para o delivery não foi definido');
    result := '5000';
    Exit;
  end
  else
    result := Q.fieldbyname('cod_mesa_delivery').value;

  Q.Active := False;
  FreeAndNil(Q);
end;

function Tdm.getCodGarconMesaDelivery(): string;
var
  Q: TIBQuery;
begin
  Q := TIBQuery.Create(self);
  Q.Database := dm.dbrestaurante;
  Q.Transaction := transacao;
  Q.Active := False;
  Q.SQL.clear;

  Q.SQL.add('select * from configuracoes_estacao where numero_caixa=' + QuotedStr(numero_caixa));
  Q.Active := True;

  if (Q.fieldbyname('cod_garcon_delivery').value = Null) then
  begin
    ShowMessage('Código de Garçom para o delivery não foi definido.');
    result := '000';
    Exit;
  end
  else
    result := Q.fieldbyname('cod_garcon_delivery').value;

  Q.Active := False;
  FreeAndNil(Q);
end;

function Tdm.getSerieNFCE(): Integer;
var
  Q: TIBQuery;
begin
  Q := TIBQuery.Create(self);
  Q.Database := dm.dbrestaurante;
  Q.Transaction := transacao;
  Q.Active := False;
  Q.SQL.clear;

  Q.SQL.add('select SERIE_NFCE_NORMAL from configuracoes_estacao where numero_caixa=' + QuotedStr(numero_caixa));
  Q.Active := True;

  if (Q.fieldbyname('SERIE_NFCE_NORMAL').value = Null) then
  begin
    ShowMessage('Série da NFCE NORMAL não definida');
    result := 1;
    Exit;
  end
  else
    result := Q.fieldbyname('SERIE_NFCE_NORMAL').value;

  Q.Active := False;
  FreeAndNil(Q);
end;

function Tdm.getSerieNFCEEmContingencia(): Integer;
var
  Q: TIBQuery;
begin
  Q := TIBQuery.Create(self);
  Q.Database := dm.dbrestaurante;
  Q.Transaction := transacao;
  Q.Active := False;
  Q.SQL.clear;

  Q.SQL.add('select SERIE_NFCE_NORMAL from configuracoes_estacao where numero_caixa=' + QuotedStr(numero_caixa));
  Q.Active := True;

  if (Q.fieldbyname('SERIE_NFCE_NORMAL').value = Null) then
  begin
    ShowMessage('Série da NFCE em contingência não definida');
    result := 1;
    Exit;
  end
  else
    result := Q.fieldbyname('SERIE_NFCE_NORMAL').value;

  Q.Active := False;
  FreeAndNil(Q);
end;

procedure Tdm.cancelaNFEPelaChave(chave: string; protocolo: string; justificativa: string);
var
  numeroNota: Integer;
begin
  parametrizaAcbrNFE(moNFCe, False, True);
  numeroNota := StrToInt(Copy(chave, 26, 9));

  dm.ACBrNFe1.EventoNFe.Evento.Clear;
  with dm.ACBrNFe1.EventoNFe.Evento.Add do
  begin
    infEvento.chNFe := chave;
    infEvento.CNPJ := dm.tb_parametrosCNPJ.Value;
    infEvento.dhEvento := Now;
    infEvento.tpEvento := teCancelamento;
    infEvento.detEvento.xJust := justificativa;
    infEvento.detEvento.nProt := protocolo;

  end;

  try
    begin
      ACBrNFe1.EnviarEvento(numeroNota);
      dm.adicionalog('Sistema cancelou a nota de chave ' + chave);
      dm.adicionalog(ACBrNFe1.WebServices.EnvEvento.RetWS);
      dm.adicionalog(ACBrNFe1.WebServices.EnvEvento.RetornoWS);
      dm.adicionalog(IntToStr(ACBrNFe1.WebServices.EnvEvento.cStat));
      dm.adicionalog('Protocolo: ' + ACBrNFe1.WebServices.EnvEvento.EventoRetorno.retEvento.Items[0].RetInfEvento.nProt);

      if (Trim(dm.AcbrNFe1.WebServices.EnvEvento.EventoRetorno.retEvento.Items[0].RetInfEvento.nProt) <> '') then
      begin
        dm.adicionalog('XML DO EVENTO DE cancelamento');
        dm.adicionalog(dm.AcbrNFe1.WebServices.EnvEvento.EventoRetorno.retEvento.Items[0].RetInfEvento.XML);
      end;

    end;

  except
    on E: Exception do

    begin
      exibe_painel_erro('Erro ao cancelar NFCE: ' + e.Message, 'Ok');
      adicionaLog('Erro ao cancelar a nfce ' + chave + ' mensage: ' + E.Message);

      Exit;
    end;
  end;

end;

function Tdm.cancelaNFCE(chaveNFCE: string; protocolo: string; serie: Integer; numeroNFCE: Integer; justificativa: string): Boolean;
begin
  dm.transacao.Active := False;
  dm.transacao.Active := True;
  dm.procGeraInutilizacoes.ExecProc;
  dm.transacao.Commit;
  dm.transacao.Active := False;
  dm.transacao.Active := True;

  result := False;

  tb_parametros.Active := True;

  dm.ACBrNFe1.EventoNFe.Evento.Clear;
  with dm.ACBrNFe1.EventoNFe.Evento.new do
  begin
    infEvento.chNFe := chaveNFCE;
    infEvento.CNPJ := dm.tb_parametrosCNPJ.Value;
    infEvento.dhEvento := Now;
    infEvento.tpEvento := teCancelamento;
    infEvento.detEvento.xJust := justificativa;
    infEvento.detEvento.nProt := protocolo;
  end;

  try
    begin
      ACBrNFe1.EnviarEvento(numeroNFCE);
      dm.adicionalog('Sistema cancelou a nota de chave ' + chaveNFCE);
      dm.adicionalog(ACBrNFe1.WebServices.EnvEvento.RetWS);
      dm.adicionalog(ACBrNFe1.WebServices.EnvEvento.RetornoWS);
      dm.adicionalog(IntToStr(ACBrNFe1.WebServices.EnvEvento.cStat));
      dm.adicionalog('Protocolo: ' + ACBrNFe1.WebServices.EnvEvento.EventoRetorno.retEvento.Items[0].RetInfEvento.nProt);
    end;

  except
    on E: Exception do

    begin
      adicionaLog('Erro ao cancelar a nfce ' + chaveNFCE + ' mensage: ' + E.Message);
      result := False;
      Exit;
    end;
  end;

  if ACBrNFe1.WebServices.EnvEvento.EventoRetorno.retEvento.Items[0].RetInfEvento.cStat <> 135 then
  begin
//        exibe_painel_erro('O SISTEMA NÃO CONSEGUIU CANCELAR A NOTA.!','OK');
    result := False;
    Exit;
  end
  else
  begin
    protocolo := ACBrNFe1.WebServices.EnvEvento.EventoRetorno.retEvento.Items[0].RetInfEvento.nProt;

    dm.transacao.Active := True;

    dm.qryauxiliar.Active := False;
    dm.qryauxiliar.sql.clear;
    dm.qryauxiliar.sql.add(' select * from inutilizacoes_nfce i');
    dm.qryauxiliar.sql.Add('  where i.serie=' + IntToStr(serie) + ' and i.nota=' + IntToStr(numeroNFCE));
    dm.qryauxiliar.Active := True;

    if dm.qryauxiliar.IsEmpty then
    begin
      dm.qryauxiliar.Active := False;
      dm.qryauxiliar.sql.clear;
      dm.qryauxiliar.sql.add(' insert into inutilizacoes_nfce(serie,nota,emitida) values (');
      dm.qryauxiliar.sql.Add(IntToStr(serie) + ',' + IntToStr(numeroNFCE) + ',0)');
      dm.qryauxiliar.ExecSQL;
      dm.transacao.Commit;
    end;

    dm.qryauxiliar.Active := False;
    dm.qryauxiliar.sql.clear;
    dm.qryauxiliar.sql.add('update inutilizacoes_nfce i set  i.inutilizada=1, i.cancelada=1, i.data_hora_inutilizacao=current_date,  i.protocolo_cancelamento=' + QuotedStr(protocolo));
    dm.qryauxiliar.sql.Add('  where i.serie=' + IntToStr(serie) + ' and i.nota=' + IntToStr(numeroNFCE));
    dm.qryauxiliar.ExecSQL;
    dm.transacao.Commit;



//    exibe_painel_erro('NOTA FISCAL EM DUPLICIDADE FOI CANCELADA. TENTE EMITIR A NOTA NOVAMENTE!','OK');
    result := True;
    Exit;
  end;

end;

function Tdm.getNumeroNFE(): Integer;
var
  Q: TIBQuery;
  numeroNota: Integer;
begin
  Q := TIBQuery.Create(self);
  Q.Database := dm.dbrestaurante;
  Q.Transaction := transacao;
  Q.Active := False;
  Q.SQL.clear;

  Q.SQL.add('select * from parametros ');
  Q.Active := True;

  if (Q.fieldbyname('NUMERO_NFE').value = Null) then
  begin
    numeroNota := 1;
  end;

  numeroNota := Q.fieldbyname('NUMERO_NFE').value + 1;
  Q.Active := False;
  Q.sql.Clear;
  Q.SQL.Add('update parametros set  NUMERO_NFE =' + IntToStr(numeroNota));
  Q.ExecSQL;

  result := numeroNota;

  Q.Active := False;
  FreeAndNil(Q);
end;

function Tdm.getNumeroCartaCorrecaoNFE(): Integer;
var
  Q: TIBQuery;
  numeroNota: Integer;
  ts: TIBTransaction;
begin
  ts := TIBTransaction.Create(self);
  ts.DefaultDatabase := dm.dbrestaurante;
  ts.Active := False;

  Q := TIBQuery.Create(self);
  Q.Database := dm.dbrestaurante;
  Q.Transaction := ts;
  Q.Active := False;
  Q.SQL.clear;

  try
    ts.Active := True;
    Q.SQL.add('select NUMERO_CARTA_CORRECAO_NFE from parametros ');
    Q.Active := True;

    if (Q.fieldbyname('NUMERO_CARTA_CORRECAO_NFE').value = Null) then
    begin
      numeroNota := 1;
    end;
    numeroNota := Q.fieldbyname('NUMERO_CARTA_CORRECAO_NFE').value + 1;
    Q.Active := False;
    Q.sql.Clear;
    Q.SQL.Add('update parametros set  NUMERO_CARTA_CORRECAO_NFE =' + IntToStr(numeroNota));
    Q.ExecSQL;

    ts.Commit;
    result := numeroNota;

  finally
    Q.Active := False;
    FreeAndNil(Q);
    FreeAndNil(ts);
  end;

end;

function Tdm.emitirCartaCorrecao(AChaveNFE: string; textoCartaCorrecao: string): string;
var
  idCartaCorrecao: Integer;
  dataHoraEvento: TDateTime;
  LXMLEventoRecebido: string;
  LMensagemEvento: string;
begin

  ACBrNFe1.NotasFiscais.Clear;
  ACBrNFe1.EventoNFe.Evento.Clear;
  dm.parametrizaAcbrNFE(moNFe, False, True);
  dm.carregarXMLVenda(AChaveNFE, false);
  ACBrNFe1.Consultar();

  LMensagemEvento := '';

  try
    try
      idCartaCorrecao := getNumeroCartaCorrecaoNFE;
      dataHoraEvento := Now;

      with ACBrNFe1.EventoNFe.Evento.Add do
      begin
        infEvento.chNFe := AChaveNFE;
        infEvento.CNPJ := CNPJ;
        infEvento.dhEvento := dataHoraEvento;
        infEvento.tpEvento := teCCe;
        infEvento.detEvento.xCorrecao := textoCartaCorrecao;
      end;

      ACBrNFe1.EnviarEvento(idCartaCorrecao);
      LXMLEventoRecebido := ACBrNFe1.WebServices.EnvEvento.RetWS;
      LMensagemEvento := ACBrNFe1.WebServices.EnvEvento.Msg;

      dm.gravarEventoNFE(AChaveNFE, LXMLEventoRecebido, dataHoraEvento);
      result := LMensagemEvento;

    except
      on E: Exception do
        raise Exception.Create(E.message + sLineBreak + LMensagemEvento);

    end;

  finally

  end;

end;

procedure Tdm.gravarEventoNFE(chave: string; xmlEvento: string; dataHoraEvento: TDateTime);
var
  Q: TIBQuery;
  ts: TIBTransaction;
  idEvento: Integer;
begin
  ts := TIBTransaction.Create(self);
  ts.DefaultDatabase := dbrestaurante;
  ts.Active := False;
  ts.Active := True;

  Q := TIBQuery.Create(self);
  Q.Database := dm.dbrestaurante;
  Q.Transaction := ts;
  Q.Active := False;
  Q.SQL.clear;

  try

    try
      idEvento := StrToInt(geraCodigo('G_EVENTOS_NFE', 15));
      Q.Active := False;
      Q.SQL.Clear;
      Q.SQL.Add('insert into eventos_nfe(id_evento, data_hora, xml_evento,usuario, tipo_evento, chave_nfe) values (');
      Q.SQL.Add(IntToStr(idEvento) + ',');
      Q.SQL.Add(QuotedStr(FormatDateTime('DD.MM.YY HH:MM:SS', dataHoraEvento)) + ',');
      Q.SQL.Add(QuotedStr(xmlEvento) + ',');
      Q.SQL.Add(QuotedStr(nome_usuario) + ',1,');
      Q.SQL.Add(QuotedStr(chave) + ')');
      ////dm.adicionalog('SQL de inserção do evento: ');
     ////////dm.adicionalog(q.SQL.Text);
      Q.ExecSQL;
      ts.Commit;

    except
      on E: Exception do
      begin
        exibe_painel_erro('Erro ao gravar evento na tabela de eventos de nfe', 'OK');
        ////dm.adicionalog('Erro ao inserir evento ' + E.Message);
        dm.transLog.Rollback;
        ts.Rollback;
      end;
    end;

  finally
    Q.Active := False;
    FreeAndNil(Q);
    FreeAndNil(ts);
  end;

end;

function Tdm.getNumeroNFCE2(): integer;
var
  LSQL: TStringList;
  LTbAux: TFDMemTable;
  LCampo: string;
  LNumeroNota: integer;
begin
  LTbAux := TFDMemTable.Create(Self);
  LSQL := TstringList.create;

  try
    try

      case dm.ACBrNFe1.Configuracoes.WebServices.Ambiente of
        taHomologacao:
          LCampo := 'NUMERO_NFCE_NORMAL_HOMOLOGACAO';
        taProducao:
          LCampo := 'NUMERO_NFCE_NORMAL';
      end;

      LSQL.Clear;
      LSQL.Add('select ' + LCampo + ' from configuracoes_estacao where numero_caixa=' + QuotedStr(numero_caixa));
      dm.getMemTable(LTbAux, LSQL.Text);
      LNumeroNota := LTbAux.Fields[0].Value + 1;

      LSQL.Clear;
      LSQL.Add('update configuracoes_estacao set  ' + LCampo + '=' + IntToStr(LNumeroNota) + ' where numero_caixa=' + QuotedStr(numero_caixa));
      dm.executaSQL(LSQL.Text);

      result := LNumeroNota;
    except
      on E: Exception do
      begin
        dm.exibe_painel_erro('Erro ao obter número da nota fiscal eletrônica ', 'Ok');
        raise Exception.Create('Erro ao obter número da NFC-e');
      end;
    end;
  finally
    FreeAndNil(LSQL);
    LTbAux.Active := false;
    FreeAndNil(LTbAux);
  end;
end;

function Tdm.getNumeroNFCE(): Integer;
var
  Q: TIBQuery;
  numeroNota: Integer;
  achou: Boolean;
  campoNumeroNota: string;
begin
  Q := TIBQuery.Create(self);
  Q.Database := dm.dbrestaurante;
  Q.Transaction := transLog;
  Q.Active := False;
  Q.SQL.clear;

  transLog.Active := False;
  transLog.Active := True;

  Q.SQL.add('select * from configuracoes_estacao where numero_caixa=' + QuotedStr(numero_caixa));
  Q.Active := True;

  if dm.ACBrNFe1.Configuracoes.WebServices.Ambiente = taHomologacao then
  begin
    campoNumeroNota := 'NUMERO_NFCE_NORMAL_HOMOLOGACAO';
  end
  else
  begin
    campoNumeroNota := 'NUMERO_NFCE_NORMAL';
  end;

  numeroNota := Q.fieldbyname(campoNumeroNota).value + 1;
  Q.Active := False;
  Q.sql.Clear;
  Q.SQL.Add('update configuracoes_estacao set  ' + campoNumeroNota + '=' + IntToStr(numeroNota) + ' where numero_caixa=' + QuotedStr(numero_caixa));
  Q.ExecSQL;

  if transLog.Active = False then
    transLog.Active := True;
  transLog.Commit;

  Q.Active := False;
  FreeAndNil(Q);
  result := numeroNota;
end;

function Tdm.getNumeroNFCEEmContingencia(): Integer;
var
  Q: TIBQuery;
  numeroNota: Integer;
  achou: Boolean;
  campoNumeroNota: string;
begin
  Q := TIBQuery.Create(self);
  Q.Database := dm.dbrestaurante;
  Q.Transaction := transLog;
  Q.Active := False;
  Q.SQL.clear;

  transLog.Active := False;
  transLog.Active := True;

  Q.SQL.add('select * from configuracoes_estacao where numero_caixa=' + QuotedStr(numero_caixa));
  Q.Active := True;

  if dm.ACBrNFe1.Configuracoes.WebServices.Ambiente = taHomologacao then
  begin
    campoNumeroNota := 'NUMERO_NFCE_NORMAL_HOMOLOGACAO';
  end
  else
  begin
    campoNumeroNota := 'NUMERO_NFCE_NORMAL';
  end;

  numeroNota := Q.fieldbyname(campoNumeroNota).value + 1;
  Q.Active := False;
  Q.sql.Clear;
  Q.SQL.Add('update configuracoes_estacao set  ' + campoNumeroNota + '=' + IntToStr(numeroNota) + ' where numero_caixa=' + QuotedStr(numero_caixa));
  Q.ExecSQL;

  if transLog.Active = False then
    transLog.Active := True;
  transLog.Commit;

  Q.Active := False;
  FreeAndNil(Q);
  result := numeroNota;
end;


//procedure Tdm.retornaNumeroNFCE();
//var
//  Q : TIBQuery;
//  numeronota : integer;
//  campoNumeroNota : string;
//begin
//  q := TIBQuery.Create(self);
//  q.Database := dm.dbrestaurante;
//  q.Transaction := translog;
//
//  transLog.Active := false;
//  transLog.Active := true;
//
//  q.Active:=false;
//  q.SQL.clear;
//
//  q.Active := false;
//  q.sql.add('  select coalesce(max (v.numero_nfce),1) as numero from vendas v ');
//  q.sql.add('  where v.numero_caixa='+Quotedstr(numero_caixa ) +' and v.serie_nfce='+IntToStr(getSerieNFCE));
//  q.sql.add('  and v.MODELO_COMPROVANTE=2');
//
//  q.Active := true;
//
//
//  numeroNota := q.fieldbyname('numero').Value;
//  adicionaLog('Retornou a numerção da nota para '+IntToStr(numeroNota  ));
//
//
//    if   dm.ACBrNFe1.Configuracoes.WebServices.Ambiente = taHomologacao  then
//   begin
//     campoNumeroNota        := 'NUMERO_NFCE_NORMAL_HOMOLOGACAO';
//   end
//  else
//   begin
//     campoNumeroNota        := 'NUMERO_NFCE_NORMAL';
//   end;
//
//
//  q.Active := false;
//  q.sql.Clear;
//  q.SQL.Add('update configuracoes_estacao set  '+campoNumeroNota+' ='+IntToStr(numeroNota)+ ' where numero_caixa='+Quotedstr(numero_caixa ));
//  Q.ExecSQL;
//
//
//
//  if transLog.Active = false then transLog.Active:=true;
//  transLog.Commit;
//
//
//
//  q.Active:=false;
//  FreeAndNil(q);
//end;

function Tdm.verificaMesaBalcao(AMesa: string): Boolean;
var
  Q: TIBQuery;
begin
  Q := TIBQuery.Create(self);
  Q.Database := dm.dbrestaurante;
  Q.Transaction := transacao;
  Q.Active := False;
  Q.SQL.clear;

  Q.SQL.add('select * from configuracoes_estacao where cod_mesa=' + QuotedStr(AMesa));
  Q.active := True;
  if Q.IsEmpty then
    result := False
  else
    result := True;

  Q.Active := False;
  FreeAndNil(Q);

end;

function Tdm.verificaseExisteMovimentoMesaBalcao(): Boolean;
var
  Q: TIBQuery;
begin
  Q := TIBQuery.Create(self);
  Q.Database := dm.dbrestaurante;
  Q.Transaction := transacao;
  Q.Active := False;
  Q.SQL.clear;

  Q.SQL.add('select * from movimento_mesa where cod_mesa=' + QuotedStr(getCodMesaBalcao));
  Q.Active := True;

  if Q.IsEmpty then
    result := False
  else
    result := True;

  Q.Active := False;
  FreeAndNil(Q);

end;

function Tdm.verificaseExisteMovimentoMesa(AMesa: string): Boolean;
var
  Q: TIBQuery;
begin
  Q := TIBQuery.Create(self);
  Q.Database := dm.dbrestaurante;
  Q.Transaction := transacao;
  Q.Active := False;
  Q.SQL.clear;

  Q.SQL.add('select * from movimento_mesa where cod_mesa=' + QuotedStr(AMesa));
  Q.Active := True;

  if Q.IsEmpty then
  begin
    result := False
  end
  else
  begin
    result := True;
  end;

  Q.Active := False;
  FreeAndNil(Q);

end;

function Tdm.verificaProdutoImprimeLocalProducao(cod_produto: string): Boolean;
var
  q: TIBQuery;
begin
  q := TIBQuery.create(self);
  q.database := dm.dbrestaurante;
  q.transaction := dm.transacao;

  q.active := False;
  q.sql.clear;
  q.sql.add(' select p.cod_produto, p.cod_miniprinter, m.cod_miniprinter as cod_mp from produtos p ');
  q.sql.add(' inner join miniprinters m on (m.cod_miniprinter = p.cod_miniprinter)');
  q.sql.add(' where p.cod_produto=' + QuotedStr(cod_produto));
  q.active := True;
  if (q.FieldByName('cod_mp').Value = '001') then
    result := False
  else
    result := True;

  q.Active := False;
  FreeAndNil(q);
end;

function Tdm.verificaProdutoImprimeDelivery(cod_produto: string): Boolean;
var
  q: TIBQuery;
begin
  q := TIBQuery.create(self);
  q.database := dm.dbrestaurante;
  q.transaction := dm.transacao;

  q.active := False;
  q.sql.clear;
  q.sql.add(' select imp_delivery from produtos where cod_produto=' + QuotedStr(cod_produto));
  q.active := True;
  if (q.FieldByName('imp_delivery').value = 0) then
    result := False
  else
    result := True;
  q.Active := False;
  FreeAndNil(q);
end;

function Tdm.verificaProdutoImprimeMesas(cod_produto: string): Boolean;
var
  q: TIBQuery;
begin
  q := TIBQuery.create(self);
  q.database := dm.dbrestaurante;
  q.transaction := dm.transacao;

  q.active := False;
  q.sql.clear;
  q.sql.add(' select imp_mesas from produtos where cod_produto=' + QuotedStr(cod_produto));
  q.active := True;
  if (q.FieldByName('imp_mesas').value = 0) then
    result := False
  else
    result := True;
  q.Active := False;
  FreeAndNil(q);
end;

function Tdm.verificaProdutoImprimeBalcao(cod_produto: string): Boolean;
var
  q: TIBQuery;
begin
  q := TIBQuery.create(self);
  q.database := dm.dbrestaurante;
  q.transaction := dm.transacao;

  q.active := False;
  q.sql.clear;
  q.sql.add(' select imp_balcao from produtos where cod_produto=' + QuotedStr(cod_produto));
  q.active := True;
  if (q.FieldByName('imp_balcao').value = 0) then
    result := False
  else
    result := True;
  q.Active := False;
  FreeAndNil(q);
end;

procedure Tdm.gravarRepique(codVenda: string; totalVenda: string; valor: Double);
var
  q: TIBQuery;
begin
  q := TIBQuery.create(self);
  q.database := dm.dbrestaurante;
  q.transaction := dm.transacao;

  q.active := False;
  q.sql.add('insert into repiques (cod_venda,data_venda,valor,imp) values (');
  q.sql.add('' + QuotedStr(codVenda) + ',');
  q.sql.add('' + QuotedStr(FormatDateTime('DD.MM.YYY', data_do_sistema)) + ',');
  q.sql.add('' + TrocaVirgPPto(FloatToStr(valor)) + ',0');

  try
    begin
      q.ExecSQL;
    end;
  except
    begin
      cria_log_de_erros(q.SQL, 'Encerramento de venda', 'Erro ao gravar repique', codigo_usuario);
      Exit;
    end;
  end;

  q.Active := False;
  FreeAndNil(q);
end;

procedure Tdm.aplicaDescontoItem(AMesa: string; codMovimento: string; valor: Double);
var
  Q: TIBQuery;
  valorDesconto: Double;
begin
  Q := TIBQuery.Create(self);
  Q.Database := dbrestaurante;
  Q.Transaction := transacao;
  Q.Active := False;

  if (frm_caixa_restaurante.rdg_modo_visualizacao.ItemIndex = 0) then
  begin
    Q.Active := False;
    Q.sql.clear;
    Q.sql.add('update movimento_mesa set desconto=' + TrocaVirgPPto(FloatToStr(valor)) + ' where cod_mesa=' + QuotedStr(AMesa) + ' and cod_movimento=' + QuotedStr(codMovimento));
    Q.ExecSQL;
  end;

  if transacao.Active = False then
    transacao.Active := True;
  transacao.Commit;

  Q.Active := False;
  FreeAndNil(Q);

end;

function Tdm.TBRound(Value: Extended; Decimals: Integer): Extended;
var
  Factor, Fraction: Extended;
begin
  Factor := IntPower(10, Decimals);
  { A conversão para string e depois para float evita
    erros de arredondamentos indesejáveis. }
  Value := StrToFloat(FloatToStr(Value * Factor));
  result := Int(Value);
  Fraction := Frac(Value);
  if Fraction >= 0.5 then
    result := result + 1
  else if Fraction <= -0.5 then
    result := result - 1;
  result := result / Factor;
end;

function Tdm.Tdm(ACodProduto: string; AParent: TPanel): Boolean;
begin

end;

function Tdm.AppIsRunning(ActivateIt: Boolean): Boolean;
var
  hSem: THandle;
  hWndMe: HWND;
  AppTitle: string;
begin
  result := False;
  AppTitle := Application.Title;
  hSem := CreateSemaphore(nil, 0, 1, PChar(AppTitle));
  if ((hSem <> 0) and (GetLastError() = ERROR_ALREADY_EXISTS)) then
  begin
    CloseHandle(hSem);
    result := True;
  end;
  if result and ActivateIt then
  begin
    Application.Title := 'zzzzzzz';
    hWndMe := FindWindow(nil, PChar(AppTitle));
    if (hWndMe <> 0) then
    begin
      if IsIconic(hWndMe) then
      begin
        ShowWindow(hWndMe, SW_SHOWNORMAL);
      end
      else
      begin
        SetForegroundWindow(hWndMe);
      end;
    end;
  end;
end;

function Tdm.verificaSeCobraCouvertNoDIa(): Boolean;
var
  qryRetornaCouvert: TIBQuery;
begin
  qryRetornaCouvert := TIBQuery.Create(Self);
  qryRetornaCouvert.Database := dbrestaurante;
  qryRetornaCouvert.Transaction := transacao;

  qryRetornaCouvert.Active := False;
  qryRetornaCouvert.SQL.clear;
  qryRetornaCouvert.SQL.add('select * from valores_servico_e_couvert where  dia =' + QuotedStr(UpperCase(FormatDateTime('DDDD', data_do_sistema))));
  qryRetornaCouvert.Active := True;

  if qryRetornaCouvert.FieldByName('cobra_couvert').Value = 1 then
    result := True
  else
    result := False;

  qryRetornaCouvert.Active := False;
  FreeAndNil(qryRetornaCouvert);
end;

function Tdm.getTempoEntreHoras(horaInicial: TTime; horaFinal: TTime): string;
var
  horaMax, horaMin: TTime;
  hIni, hFim: Integer;
  nHoras: Integer;
  nMinutos: Integer;
  FIni, FFim: TDateTime;
begin
  FIni := horaInicial;
  FFim := horaFinal;

  if (horaInicial > horaFinal) then
  begin
    result := TimeToStr((StrToTime('23:59:59') - FIni) + FFim)
  end
  else
  begin
    result := TimeToStr(FFim - FIni);
  end;
{

  horaMax:=StrToTime('23:59:58');
  horaMax:=StrToTime('00:00:00');

  if (dataFinal > dataInicial) then
   begin
     nHoras := 24 - strToInt(FormatDateTime('HH',horaInicial));
     nHoras := nHoras+strToInt(FormatDateTime('HH',horaFinal));
   end
  else
    begin
      hIni:= strToInt(FormatDateTime('HH',horaInicial));
      hFim:= strToInt(FormatDateTime('HH',horaFinal));
      nHoras:= hFim - hIni;
    end;

   nMinutos := abs( MinuteOfTheHour(horaFinal) - MinuteOfTheHour(horaInicial) );

  dateutils
   result:= Inttostr(nhoras) +' hora(s) e '+IntToStr(nminutos)+' minuto(s)';

}
end;

function Tdm.verificaSeProdutoEstaNaConta(codProduto: string; AMesa: string): Boolean;
var
  qryAux: TIBQuery;
begin
  transacao.Active := False;
  transacao.Active := True;
  qryAux := TIBQuery.Create(Self);
  qryAux.Database := dbrestaurante;
  qryAux.Transaction := transacao;
  qryAux.Active := False;
  qryAux.SQL.clear;
  qryAux.sql.add('select * from movimento_mesa where cod_mesa=' + QuotedStr(AMesa) + ' and cod_produto=' + QuotedStr(codProduto));
  qryAux.Active := True;

  if qryAux.IsEmpty = True then
    result := False
  else
    result := True;

  qryAux.Active := False;
  FreeAndNil(qryAux);

end;

function Tdm.getCodCouvertAutomatico(tipoCouvert: SmallInt; AMesa: string): string;
var
  qryCouvertAutomatico: TIBQuery;
begin
  //  se a variável tipo for = 1  é o couvert normal
  //  Se a variável tipo for = 2 é o Couvert com Pré-convite
  //  Se a variável tipo for = 3 é CORTESIA
  transacao.Active := False;
  transacao.Active := True;
  qryCouvertAutomatico := TIBQuery.Create(Self);
  qryCouvertAutomatico.Database := dbrestaurante;
  qryCouvertAutomatico.Transaction := transacao;
  qryCouvertAutomatico.Active := False;
  qryCouvertAutomatico.SQL.clear;
  qryCouvertAutomatico.SQL.add('select c.*   from configuracoes_cartoes c  where');
  qryCouvertAutomatico.SQL.add(AMesa + ' between c.inicio_faixa and c.fim_faixa ');
  qryCouvertAutomatico.Active := True;

  case tipoCouvert of
    0:
      result := qryCouvertAutomatico.fieldbyname(Copy(UpperCase(retiraAcentos(FormatDateTime('DDDD', data_do_sistema))), 0, 3)).Value;
    1:
      result := qryCouvertAutomatico.fieldbyname(Copy(UpperCase(retiraAcentos(FormatDateTime('DDDD', data_do_sistema))), 0, 3) + 'PREC').Value;
    2:
      result := qryCouvertAutomatico.fieldbyname('VIP').Value;
  end;

  qryCouvertAutomatico.Active := False;
  FreeAndNil(qryCouvertAutomatico);

end;

function Tdm.verificaSeMesaTemMovimento(AMesa: string): Boolean;
var
  LQryConsulta: TIBQuery;
  Ltransacao: TIBTransaction;
  LnomeGenerator: string;
begin

  LnomeGenerator := 'G_OBS_CLIENTES_DELIVERY';
  Ltransacao := TIBTransaction.Create(nil);
  LQryConsulta := TIBQuery.Create(nil);
  Ltransacao.Params.Add('read_committed');
  Ltransacao.Params.Add('rec_version');
  Ltransacao.Params.Add('nowait');

  try
    Ltransacao.DefaultDatabase := dm.dbrestaurante;
    Ltransacao.Active := False;
    Ltransacao.Active := True;
    LQryConsulta.Database := dm.dbrestaurante;
    LQryConsulta.Transaction := Ltransacao;
    LQryConsulta := TIBQuery.Create(Self);
    LQryConsulta.Database := dbrestaurante;
    LQryConsulta.Transaction := Ltransacao;
    LQryConsulta.Active := False;
    LQryConsulta.SQL.clear;

    LQryConsulta.SQL.add('select cod_mesa from movimento_mesa where cod_mesa=' + QuotedStr(AMesa));
    LQryConsulta.Active := True;

    if LQryConsulta.IsEmpty then
      result := False
    else
      result := True;

  finally
    LQryConsulta.Active := False;
    FreeAndNil(LQryConsulta);
    Ltransacao.Active := False;
    FreeAndNil(Ltransacao);
  end;

end;

function Tdm.imprimeLinhaArquivo(marca: Integer; linha: WideString; negrito: Boolean; italico: Boolean; sublinhado: Boolean; tam: Boolean; comprimido: Boolean; largura: Boolean; altura: Boolean): string;
var
  formato: string;
  dummy: Integer;
  tipoletraBmt, italicoBmt, sublinhadoBmt, expBmt, negritoBmt: Integer;
begin
  if tam = True then
    expBmt := 1;

  case marca of
    1:
      begin

        if comprimido = True then
          tipoletraBmt := 1
        else
          tipoletraBmt := 3;
        if italico = True then
          italicoBmt := 1
        else
          italicoBmt := 0;
        if sublinhado = True then
          sublinhadoBmt := 1
        else
          sublinhadoBmt := 0;
        if largura = True then
          expBmt := 1
        else
          expBmt := 0;
        if negrito = True then
          negritoBmt := 1
        else
          negritoBmt := 0;

        if (StrToInt(dm.LeIni(1, 'IMPRESSORA_NAO_FISCAL_01', 'via_dll')) = 1) then
        begin
//             linha := '200'+Inttostr(expBmt)+Inttostr(negritoBmt)+linha+#13#10;

          linha := formatacaoBematech(negrito, italico, sublinhado, tam, comprimido, largura, altura) + linha;
          linha := linha + formatacaoBematechFinal(negrito, italico, sublinhado, tam, comprimido, largura, altura);
          linha := linha + #13#10;

        end
        else
        begin
          linha := formatacaoBematech(negrito, italico, sublinhado, tam, comprimido, largura, altura) + linha;
          linha := linha + formatacaoBematechFinal(negrito, italico, sublinhado, tam, comprimido, largura, altura);
          linha := linha + #13#10;
        end;

        gravaStrEmArquivoDeTexto(patchAplicacao + 'extrato.dat', linha);

      end;

    2:
      begin
        linha := formatacaoDarumaNova(negrito, italico, sublinhado, tam, comprimido, largura, altura) + linha;
        linha := linha + formatacaoDarumaNovaFinal(negrito, italico, sublinhado, tam, comprimido, largura, altura);
        linha := linha + chr(13) + chr(10);

        gravaStrEmArquivoDeTexto(patchAplicacao + 'extrato.dat', linha);
      end;

    3:
      begin
        formato := chr(27) + chr(64);
        gravaStrEmArquivoDeTexto(patchAplicacao + 'extrato.dat', formato);

        if negrito then
        begin
          formato := formato + chr(27) + chr(69) + chr(1);
          gravaStrEmArquivoDeTexto(patchAplicacao + 'extrato.dat', formato);
        end;

        if tam then
        begin
          formato := formato + chr(29) + chr(33) + chr(16);
          gravaStrEmArquivoDeTexto(patchAplicacao + 'extrato.dat', formato);
        end;
        linha := linha + chr(13) + chr(10);
        gravaStrEmArquivoDeTexto(patchAplicacao + 'extrato.dat', linha);

      end;

    4:
      begin
        linha := linha + chr(13) + chr(10);
        gravaStrEmArquivoDeTexto(patchAplicacao + 'extrato.dat', linha);
      end;

    5:
      begin
        linha := formatacaoElginXprint(negrito, italico, sublinhado, tam, comprimido, largura, altura) + linha;
        linha := linha + chr(13) + chr(10);
        gravaStrEmArquivoDeTexto(patchAplicacao + 'extrato.dat', linha);
      end;
  end;
end;

function Tdm.imprimeLinhaECF(marca: Integer; linha: WideString; negrito: Boolean; italico: Boolean; sublinhado: Boolean; tam: Boolean; comprimido: Boolean; largura: Boolean; altura: Boolean): string;
var
  formato: string;
  dummy: Integer;
  tipoletraBmt, italicoBmt, sublinhadoBmt, expBmt, negritoBmt: Integer;
begin
  if tam = True then
    expBmt := 1;

  if (StrToInt(dm.LeIni(1, 'IMPRESSORA_NAO_FISCAL_01', 'usarACBR')) = 1) then
  begin
    linha := formatacaoACBRInicial(negrito, italico, sublinhado, tam, comprimido, largura, altura) + linha;
    linha := linha + formatacaoACBRFinal(negrito, italico, sublinhado, tam, comprimido, largura, altura);
    linha := linha + chr(13) + chr(10);
    gravaStrEmArquivoDeTexto(patchAplicacao + 'extrato.dat', linha);
  end
  else
  begin
    case marca of
      1:
        begin

          if comprimido = True then
            tipoletraBmt := 1
          else
            tipoletraBmt := 3;
          if italico = True then
            italicoBmt := 1
          else
            italicoBmt := 0;
          if sublinhado = True then
            sublinhadoBmt := 1
          else
            sublinhadoBmt := 0;
          if largura = True then
            expBmt := 1
          else
            expBmt := 0;
          if negrito = True then
            negritoBmt := 1
          else
            negritoBmt := 0;

          if (StrToInt(dm.LeIni(1, 'IMPRESSORA_NAO_FISCAL_01', 'via_dll')) = 1) then
          begin
//             linha := '200'+Inttostr(expBmt)+Inttostr(negritoBmt)+linha+#13#10;

            linha := formatacaoBematech(negrito, italico, sublinhado, tam, comprimido, largura, altura) + linha;
            linha := linha + formatacaoBematechFinal(negrito, italico, sublinhado, tam, comprimido, largura, altura);
            linha := linha + #13#10;

          end
          else
          begin
            linha := formatacaoBematech(negrito, italico, sublinhado, tam, comprimido, largura, altura) + linha;
            linha := linha + formatacaoBematechFinal(negrito, italico, sublinhado, tam, comprimido, largura, altura);
            linha := linha + #13#10;
          end;

          gravaStrEmArquivoDeTexto(patchAplicacao + 'extrato.dat', linha);

        end;

      2:
        begin
          linha := formatacaoDarumaNova(negrito, italico, sublinhado, tam, comprimido, largura, altura) + linha;
          linha := linha + formatacaoDarumaNovaFinal(negrito, italico, sublinhado, tam, comprimido, largura, altura);
          linha := linha + chr(13) + chr(10);

          gravaStrEmArquivoDeTexto(patchAplicacao + 'extrato.dat', linha);
        end;

      3:
        begin
          formato := chr(27) + chr(64);
            //gravaStrEmArquivoDeTexto(patchAplicacao+'extrato.dat',formato);

          if negrito then
          begin
            formato := formato + chr(27) + chr(69) + chr(1);
                  // gravaStrEmArquivoDeTexto(patchAplicacao+'extrato.dat',formato);
          end;

          if tam then
          begin
            formato := formato + chr(29) + chr(33) + chr(16);
                  // gravaStrEmArquivoDeTexto(patchAplicacao+'extrato.dat',formato);
          end;
          linha := linha + chr(13) + chr(10);

          gravaStrEmArquivoDeTexto(patchAplicacao + 'extrato.dat', formato + linha);

        end;

      4:
        begin
          linha := linha + chr(13) + chr(10);
          gravaStrEmArquivoDeTexto(patchAplicacao + 'extrato.dat', linha);
        end;

      5:
        begin
          linha := formatacaoElginXprint(negrito, italico, sublinhado, tam, comprimido, largura, altura) + linha;
          linha := linha + chr(13) + chr(10);
          gravaStrEmArquivoDeTexto(patchAplicacao + 'extrato.dat', linha);
        end;

      6:
        begin
          linha := formatacaoElginI9(negrito, italico, sublinhado, tam, comprimido, largura, altura) + linha;
          linha := linha + chr(13) + chr(10);
          gravaStrEmArquivoDeTexto(patchAplicacao + 'extrato.dat', linha);
        end;

      7:
        begin
        end;

    end;
  end;

end;

procedure Tdm.imprimeReciboRecebimentoFaturas(marca: Integer; codCliente: string; nomeCliente: string; totalFaturas: Real);
var
  str: string;
  frmVazio: Tfrm_modelo_vazio;
  ct: Integer;
  tamStr: Integer;
begin

  Application.CreateForm(Tfrm_modelo_vazio, frmVazio);

  tb_parametros.Active := True;
  frm_principal.memo_avisos.Lines.clear;
  if FileExists(caminhoArquivoExtrato) then
    DeleteFile(caminhoArquivoExtrato);
  imprimeLinhaECF(marca, linhaExtrato, False, False, False, False, False, False, False);
  imprimeLinhaECF(marca, dm.centralizar(nome_fantasia, qtdColunasExpandidoECF), True, False, False, True, False, True, False);
  imprimeLinhaECF(marca, linhaExtrato, False, False, False, False, False, False, False);
  str := FormatDateTime('DD/MM/YYY', Date) + ' ' + FormatDateTime('HH:MM:SS', Time);
  imprimeLinhaECF(marca, str, False, False, False, False, True, False, False);
  str := 'N. Caixa: ' + ultimoCaixaAberto;
  imprimeLinhaECF(marca, str, False, False, False, False, True, False, False);
  str := 'Operador: ' + nome_usuario_responsavel;
  imprimeLinhaECF(marca, str, False, False, False, False, True, False, False);
  imprimeLinhaECF(marca, linhaExtrato, False, False, False, False, False, False, False);
  imprimeLinhaECF(marca, dm.centralizar('RECIBO DE PENDURA', qtdColunasExpandidoECF), True, False, False, True, False, True, False);
  imprimeLinhaECF(marca, linhaExtrato, False, False, False, False, False, False, False);
  str := 'Recebi de ' + codCliente + '-' + nomeCliente;
  imprimeLinhaECF(marca, str, False, False, False, False, True, False, False);
  str := 'A importancia de ' + FormatFloat('R$ ###,###,##0.00', totalFaturas);
  imprimeLinhaECF(marca, str, False, False, False, False, True, False, False);
  str := 'Ref. ao pagto das faturas (penduras):';
  imprimeLinhaECF(marca, ' ', False, False, False, False, True, False, False);
  imprimeLinhaECF(marca, str, False, False, False, False, True, False, False);
  dm.qryConsultaFaturas.First;
  dm.qryConsultaFaturas.First;
  while not dm.qryConsultaFaturas.Eof do
  begin
    if dm.qryConsultaFaturasSELECAO.Value = 1 then
    begin
      str := dm.qryConsultaFaturasCOD_FATURA.Value + '  -  ' + FormatFloat('R$ ###,###,##0.00', dm.qryConsultaFaturasVALOR_FATURA.value);
      imprimeLinhaECF(marca, str, False, False, False, False, True, False, False);
    end;
    dm.qryConsultaFaturas.Next;
  end;

  frmEncerramentoContasAssinadas.tbFormasPagamentoTemp.First;
  while not frmEncerramentoContasAssinadas.tbFormasPagamentoTemp.Eof do
  begin
    if (frmEncerramentoContasAssinadas.tbFormasPagamentoTemp.Bof) then
    begin
      dm.imprimeLinhaECF(marca, linhaExtrato, True, False, False, False, False, False, False);
      dm.imprimeLinhaECF(marca, dm.centralizar('FORMAS DE PAGAMENTO', qtdColunasNormalECF), True, False, False, False, False, False, False);
    end;
    str := formatoRodapeExtrato;
    str := dm.organizarCupom(str, frmEncerramentoContasAssinadas.tbFormasPagamentoTempdescricaoForma.value, '#');
    str := dm.organizarCupom(str, '', '*');
    str := dm.organizarCupom(str, '', '%');
    tamStr := alinhamentoDireitaTotal - Length(Trim(str));
    str := Trim(str) + dm.alinha_valor_a_direita(tamStr, FormatFloat('R$ ###,###,##0.00 ', (frmEncerramentoContasAssinadas.tbFormasPagamentoTempvalorForma.value)));

    dm.imprimeLinhaECF(marca, Trim(str), False, False, False, False, False, False, False);
    frmEncerramentoContasAssinadas.tbFormasPagamentoTemp.Next;
  end;

  imprimeLinhaECF(marca, '', False, False, False, False, True, False, False);
  imprimeLinhaECF(marca, '', False, False, False, False, True, False, False);
  imprimeLinhaECF(marca, '', False, False, False, False, True, False, False);
  imprimeLinhaECF(marca, '', False, False, False, False, True, False, False);
  imprimeLinhaECF(marca, dm.centralizar('------------------------------', qtdColunasNormalECF), False, False, False, False, False, False, False);
  imprimeLinhaECF(marca, dm.centralizar(nome_comp_usuario_responsavel, qtdColunasNormalECF), False, False, False, False, False, False, False);

  if impressora_fiscal_instalada = 0 then
  begin
    for ct := 0 to StrToInt(dm.LeIni(2, 'extrato', 'linhasFinalExtrato')) do
    begin
      imprimeLinhaECF(marca, '                     ', False, False, False, False, False, False, False);
    end;
  end;

  frm_principal.memo_avisos.Lines.LoadFromFile(caminhoArquivoExtrato);
  imprimeTextoMiniPrinter(frm_principal.memo_avisos.Lines.Text);

end;

function Tdm.imprimeCabecalhoECF(marca: Integer; tipo: Integer; AMesa: string; codVenda: string; codPedidoDelivery: string; codCliente: string; nomeCliente: string; via: SmallInt): Boolean;
var
  str: string;
  ct: Integer;
  q: TIBQuery;
begin
  q := TIBQuery.create(self);
  q.Database := dm.dbrestaurante;
  q.Transaction := dm.transacao;
  q.Active := False;

  try
    try
      q.SQL.Clear;
      q.sql.add('select first 1  udf_minutesbetween(mm.hora_lancamento,current_timestamp) as TOTAL_MINUTOS');
      q.sql.add('        ,(udf_minutesbetween(mm.hora_lancamento,current_timestamp) /60) as HORAS');
      q.sql.add('      ,udf_mod(udf_minutesbetween(mm.hora_lancamento,current_timestamp),60) as MINUTOS,');
      q.sql.add(' coalesce(c.descricao,' + Quotedstr('') + ') as descricao_mesa,coalesce(c.nome_cliente,' + Quotedstr('') + ') as nome_cliente');
      ;
      q.sql.add('        from movimento_mesa mm');
      q.sql.add('  inner join cartoes c on (c.cod_cartao = mm.cod_mesa)');
      q.sql.add('       where mm.cod_mesa=' + QuotedStr(AMesa));
      q.sql.add('        order by mm.hora_lancamento asc');
      dm.adicionaLog(q.sql.Text);
      q.Active := True;
      ct := 0;

      if q.IsEmpty = false then
      begin
        imprimeLinhaECF(marca, ' ', False, False, False, False, False, False, False);
        if (localDeEmissaoDeExtrato = 1) then
        begin

        end
        else
        begin
          dm.imprimeLinhaECF(marca, dm.centralizar(nome_fantasia, qtdColunasExpandidoECF), True, False, False, True, False, True, False);
          imprimeLinhaECF(marca, dm.centralizar('', qtdColunasExpandidoECF), True, False, False, True, False, True, False)
        end;

        imprimeLinhaECF(marca, linhaExtrato, False, False, False, False, False, False, False);

        if (AMesa <> mesaDelivery) then
        begin
          case tipo of
            1:
              dm.imprimeLinhaECF(marca, dm.centralizar('CONFERENCIA DE MESA', qtdColunasExpandidoECF), True, False, False, True, False, True, False);
            2:
              begin
                dm.imprimeLinhaECF(marca, dm.centralizar('ENCERRAMENTO', qtdColunasExpandidoECF), True, False, False, True, False, True, False);
                dm.imprimeLinhaECF(marca, dm.centralizar('VENDA N ' + IntToStr(StrToInt(codVenda)), qtdColunasExpandidoECF), True, False, False, True, False, True, False);
                dm.imprimeLinhaECF(marca, dm.centralizar('Mesa:' + IntToStr(StrToInt(AMesa)), qtdColunasExpandidoECF), True, False, False, True, False, True, False);

                if (trim(q.FieldByName('descricao_mesa').Value) <> '') then
                begin
                  dm.imprimeLinhaECF(marca, dm.centralizar(q.FieldByName('descricao_mesa').Value, qtdColunasExpandidoECF), True, False, False, True, False, True, False);

                end;
                if (trim(q.FieldByName('nome_cliente').Value) <> '') then
                begin
                  dm.imprimeLinhaECF(marca, dm.centralizar('Cliente: ' + q.FieldByName('nome_cliente').Value, qtdColunasExpandidoECF), True, False, False, True, False, True, False);

                end;

              end;
            3:
              dm.imprimeLinhaECF(marca, dm.centralizar('ESTORNO DE MESA', qtdColunasExpandidoECF), True, False, False, True, False, True, False);
            4:
              dm.imprimeLinhaECF(marca, dm.centralizar('COMPROVANTE DE PEDIDO', qtdColunasExpandidoECF), True, False, False, True, False, True, False);
          end;
        end;

        dm.imprimeLinhaECF(marca, dm.centralizar('VIA ' + IntToStr(via), qtdColunasExpandidoECF), True, False, False, True, False, True, False);
        imprimeLinhaECF(marca, linhaExtrato, False, False, False, False, False, False, False);

        str := FormatDateTime('DD/MM/YYY', Date) + ' ' + FormatDateTime('HH:MM:SS', Time);
        imprimeLinhaECF(marca, str, False, False, False, False, True, False, False);

        if ((AMesa <> mesaDelivery) and (AMesa <> mesaBalcao)) then
        begin
          imprimeLinhaECF(marca, dm.LeIni(2, 'CAIXA', 'titulo_cabecalho_cupom') + ' ' + AMesa, True, False, False, True, False, True, False)
        end
        else
        begin
          if (AMesa = mesaDelivery) then
          begin
            if tipo <> 2 then
              imprimeLinhaECF(marca, dm.centralizar('DELIVERY', qtdColunasExpandidoECF), True, False, False, True, False, True, False)
            else
              imprimeLinhaECF(marca, dm.centralizar('BAIXA-DELIVERY', qtdColunasExpandidoECF), True, False, False, True, False, True, False);

            imprimeLinhaECF(marca, dm.centralizar('PED.: ' + codPedidoDelivery, qtdColunasExpandidoECF), True, False, False, True, False, True, False);
            imprimeLinhaECF(marca, Trim(str), False, False, False, False, True, False, False);
          end
          else
            imprimeLinhaECF(marca, dm.centralizar('BALCAO - ' + codPedidoDelivery, qtdColunasExpandidoECF), True, False, False, True, False, True, False)
        end;


    // Pega permanencia.


        q.Active := False;
        q.SQL.Clear;
        q.sql.add('select first 1  udf_minutesbetween(mm.hora_lancamento,current_timestamp) as TOTAL_MINUTOS');
        q.sql.add('        ,(udf_minutesbetween(mm.hora_lancamento,current_timestamp) /60) as HORAS');
        q.sql.add('      ,udf_mod(udf_minutesbetween(mm.hora_lancamento,current_timestamp),60) as MINUTOS');
        q.sql.add('        from movimento_mesa mm');
        q.sql.add('       where mm.cod_mesa=' + QuotedStr(AMesa));
        q.sql.add('        order by mm.hora_lancamento asc');
        q.Active := True;

        str := 'Caixa Nº: ' + ultimoCaixaAberto;
        imprimeLinhaECF(marca, str, False, False, False, False, True, False, False);
        str := 'Operador: ' + nome_usuario_responsavel;
        imprimeLinhaECF(marca, str, False, False, False, False, True, False, False);
        str := 'Garcon: ' + getNomeGarconAbriuMesa(AMesa);
        imprimeLinhaECF(marca, str, False, False, False, False, True, False, False);

        if (Trim(codCliente) <> '') then
        begin
          str := 'Cod Cliente: ' + codCliente;
          imprimeLinhaECF(marca, str, True, False, True, False, True, False, False);
          str := 'Cliente: ' + nomeCliente;
          imprimeLinhaECF(marca, str, True, False, True, False, True, False, False);
        end;

        if q.IsEmpty = False then
        begin
          str := 'Tempo de Atendimento: ' + FormatFloat('00', StrToFloat(q.fieldbyname('HORAS').Value)) + ':' + FormatFloat('00', StrToFloat(q.fieldbyname('MINUTOS').Value));
          imprimeLinhaECF(marca, str, False, False, False, False, True, False, False);
        end;

        if (AMesa = mesaDelivery) then
        begin
          str := 'Pedido ' + codPedidoDelivery;
          imprimeLinhaECF(marca, str, False, False, False, False, True, False, False);
          formataCabecalhoDelivery(codPedidoDelivery);

          for ct := 0 to frm_principal.memoFormatacaoDelivery.Lines.Count do
          begin
            str := frm_principal.memoFormatacaoDelivery.Lines[ct];
            imprimeLinhaECF(marca, str, False, False, False, False, True, False, False);
          end;
        end;

        if (tipo <> 2) then
        begin
          if layoutExtrato = 1 then
          begin
            imprimeLinhaECF(marca, linhaExtrato, False, False, False, False, False, False, False);
            str := formatoCabecalhoExtrato;
            str := dm.organizarCupom(str, 'Qtd.', '#');
            str := organizarCupom(str, Copy('Descricao', 0, 15), '*');
            str := dm.organizarCupom(str, dm.alinha_valor_a_direita(alinhamentoDireitaTotal, 'Total'), '%');
            imprimeLinhaECF(marca, Trim(str), False, False, False, False, False, False, False);
            imprimeLinhaECF(marca, linhaExtrato, False, False, False, False, False, False, False);
          end
          else
          begin
            imprimeLinhaECF(marca, linhaExtrato, False, False, False, False, False, False, False);
            str := formatoCabecalhoExtratoLayout2Linha1;
            str := dm.organizarCupom(str, 'Cod.', '#');
            str := dm.organizarCupom(str, 'Descricao', '*');
            imprimeLinhaECF(marca, Trim(str), False, False, False, False, False, False, False);
            str := formatoCabecalhoExtratoLayout2Linha2;
            str := dm.organizarCupom(str, 'Qtd.', '#');
            str := dm.organizarCupom(str, ' ', '$');
            str := dm.organizarCupom(str, 'Vl. un.', '*');
            str := dm.organizarCupom(str, 'Total', '%');
            imprimeLinhaECF(marca, Trim(str), False, False, False, False, False, False, False);
            imprimeLinhaECF(marca, linhaExtrato, False, False, False, False, False, False, False);
          end;
        end
        else
        begin
          if (StrToInt(dm.LeIni(1, 'ENCERRAMENTO', 'imprime_movimento')) = 1) then
          begin
            if layoutExtrato = 1 then
            begin
              imprimeLinhaECF(marca, linhaExtrato, False, False, False, False, False, False, False);
              str := formatoCabecalhoExtrato;
              str := dm.organizarCupom(str, 'Qtd.', '#');
              str := organizarCupom(str, Copy('Descricao', 0, 15), '*');
              str := dm.organizarCupom(str, dm.alinha_valor_a_direita(alinhamentoDireitaTotal, 'Total'), '%');
              imprimeLinhaECF(marca, Trim(str), False, False, False, False, False, False, False);
              imprimeLinhaECF(marca, linhaExtrato, False, False, False, False, False, False, False);
            end
            else
            begin
              imprimeLinhaECF(marca, linhaExtrato, False, False, False, False, False, False, False);
              str := formatoCabecalhoExtratoLayout2Linha1;
              str := dm.organizarCupom(str, 'Cod.', '#');
              str := dm.organizarCupom(str, 'Descricao', '*');
              imprimeLinhaECF(marca, Trim(str), False, False, False, False, False, False, False);
              str := formatoCabecalhoExtratoLayout2Linha2;
              str := dm.organizarCupom(str, 'Qtd.', '#');
              str := dm.organizarCupom(str, ' ', '$');
              str := dm.organizarCupom(str, 'Vl. un.', '*');
              str := dm.organizarCupom(str, 'Total', '%');
              imprimeLinhaECF(marca, Trim(str), False, False, False, False, False, False, False);
              imprimeLinhaECF(marca, linhaExtrato, False, False, False, False, False, False, False);
            end;

          end;
        end;

      end
      else
      begin
        ShowRealDialog(frm_principal, tmAviso, 'Aviso', 'Sem dados para a emissão do comprovante. Verifique a tabela de cartões!');
      end;

    except
      on E: Exception do
      begin
        ShowRealDialog(frm_principal, tmErro, 'Ocorreu  um erro', 'Erro ao imprimir o comprovante!' + sLineBreak + 'Detalhes: ' + E.Message);

      end;
    end;
  finally
    q.active := False;
    FreeAndNil(q);
  end;
end;

procedure Tdm.imprimirPromissorias(marca: Integer; codVenda: string);
var
  str: string;
  ct: Integer;
  q: TIBQuery;
  vias: Integer;
  tamStr: Integer;
begin

  tb_parametros.Active := True;
  frm_principal.memo_avisos.Lines.clear;

  q := TIBQuery.create(self);
  q.Database := dm.dbrestaurante;
  q.Transaction := dm.transacao;

  try

    try

      q.SQL.add('select f.cod_fatura, c.cod_cli,coalesce(c.cgc_cpf,' + Quotedstr('') + ') as cgc_cpf, c.razao_social, f.data_fatura,f.data_vencimento,');
      q.SQL.add('        f.valor_fatura,f.cod_venda,f.hora   from faturas f');
      q.SQL.add('       inner join clientes c on (c.cod_cli = f.cod_cli)');
      q.sql.add(' where f.cod_venda=' + QuotedStr(codVenda));

      q.Active := True;

      if (q.IsEmpty = False) then
      begin
        q.First;
        while not q.eof do
        begin

          for vias := 1 to 2 do
          begin
            string_auxiliar := 'S';
            if (vias = 2) then
            begin
              string_auxiliar := 'N';
              if (ShowRealDialog(frm_principal, tmConfirmacao, 'Confirme', 'Imprimir a via do cliente ?') = teSim) then
              begin
                string_auxiliar := 'S';
              end;
            end
            else
            begin
              string_auxiliar := 'S';
            end;

            if (string_auxiliar = 'S') then
            begin
              if FileExists(caminhoArquivoExtrato) then
                DeleteFile(caminhoArquivoExtrato);
              imprimeLinhaECF(marca, linhaExtrato, False, False, False, False, False, False, False);
              imprimeLinhaECF(marca, dm.centralizar(nome_fantasia, qtdColunasExpandidoECF), True, False, False, True, False, True, False);
              imprimeLinhaECF(marca, linhaExtrato, False, False, False, False, False, False, False);
              str := FormatDateTime('DD/MM/YYY', Date) + ' ' + FormatDateTime('HH:MM:SS', Time);
              imprimeLinhaECF(marca, str, False, False, False, False, True, False, False);
              str := 'N. Caixa: ' + ultimoCaixaAberto;
              imprimeLinhaECF(marca, str, False, False, False, False, True, False, False);
              str := 'Operador: ' + nome_usuario_responsavel;
              str := 'N. Promissoria: ' + q.fieldbyname('cod_fatura').Value;
              imprimeLinhaECF(marca, str, False, False, False, False, True, False, False);

              imprimeLinhaECF(marca, ' ', False, False, False, False, True, False, False);
              imprimeLinhaECF(marca, linhaExtrato, False, False, False, False, False, False, False);
              imprimeLinhaECF(marca, dm.centralizar('NOTA PROMISSORIA', qtdColunasExpandidoECF), True, False, False, True, False, True, False);
              imprimeLinhaECF(marca, linhaExtrato, False, False, False, False, False, False, False);
              if vias = 1 then
              begin
                imprimeLinhaECF(marca, dm.centralizar('VIA DA EMPRESA', qtdColunasExpandidoECF), True, False, False, True, False, True, False);
                imprimeLinhaECF(marca, linhaExtrato, False, False, False, False, False, False, False);
              end
              else
              begin
                imprimeLinhaECF(marca, dm.centralizar('VIA DO CLIENTE', qtdColunasExpandidoECF), True, False, False, True, False, True, False);
                imprimeLinhaECF(marca, linhaExtrato, False, False, False, False, False, False, False);

              end;

              imprimeLinhaECF(marca, ' ', False, False, False, False, False, False, False);
              imprimeLinhaECF(marca, ' ', False, False, False, False, False, False, False);
              str := 'Cliente : ' + q.fieldbyname('cod_cli').Value + ' - ' + q.fieldbyname('razao_social').Value;
              imprimeLinhaECF(marca, str, False, False, False, False, True, False, False);
              imprimeLinhaECF(marca, '  ', False, False, False, False, True, False, False);
              imprimeLinhaECF(marca, '  ', False, False, False, False, True, False, False);
              str := 'NA DATA ' + FormatDateTime('DD/MM/YY', q.fieldbyname('data_vencimento').Value) + ', PAGAREI À';
              imprimeLinhaECF(marca, str, False, False, False, False, True, False, False);
              str := razao_social;
              imprimeLinhaECF(marca, str, False, False, False, False, True, False, False);
              str := 'CPF/CNPJ: ' + CNPJ;
              imprimeLinhaECF(marca, str, False, False, False, False, True, False, False);

              str := 'OU À SUA ORDEM, A QUANTIA DE ' + FormatFloat('R$ #0.00', q.fieldbyname('valor_fatura').Value);
              imprimeLinhaECF(marca, str, False, False, False, False, True, False, False);

              str := frm_principal.escreveExtenso.ValorToTexto(q.fieldbyname('valor_fatura').Value);
              imprimeLinhaECF(marca, str, False, False, False, False, True, False, False);
              str := 'EM MOEDA CORRENTE NACIONAL.';
              imprimeLinhaECF(marca, str, False, False, False, False, True, False, False);

              imprimeLinhaECF(marca, '  ', False, False, False, False, True, False, False);
              imprimeLinhaECF(marca, '  ', False, False, False, False, True, False, False);
              imprimeLinhaECF(marca, '  ', False, False, False, False, True, False, False);
              imprimeLinhaECF(marca, '  ', False, False, False, False, True, False, False);
              imprimeLinhaECF(marca, dm.centralizar('------------------------------', qtdColunasNormalECF), False, False, False, False, False, False, False);
              imprimeLinhaECF(marca, dm.centralizar(q.fieldbyname('razao_social').Value, qtdColunasNormalECF), False, False, False, False, False, False, False);
              imprimeLinhaECF(marca, dm.centralizar('CNPJ/CPF: ' + q.fieldbyname('CGC_CPF').Value, qtdColunasNormalECF), False, False, False, False, False, False, False);

              if impressora_fiscal_instalada = 0 then
              begin
                for ct := 0 to StrToInt(dm.LeIni(2, 'extrato', 'linhasFinalExtrato')) do
                begin
                  imprimeLinhaECF(marca, '                     ', False, False, False, False, False, False, False);
                end;
              end;

              frm_principal.memo_avisos.Lines.LoadFromFile(caminhoArquivoExtrato);
              imprimeTextoMiniPrinter(frm_principal.memo_avisos.Lines.Text);

            end
            else
            begin

            end;
          end;
          q.next;

        end;
      end;

    except
      on E: Exception do
      begin
        ShowRealDialog(frm_principal, tmErro, 'Ocorreu  um erro', 'Erro ao imprimir notas promissórias!' + sLineBreak + 'Erro: ' + E.Message);
      end;

    end;
  finally
    q.active := false;
    FreeAndNil(q);

  end;

end;

function tdm.getSQLResumoCaixa(ACodEmpresa, ACodCaixa: string): string;
var
  LSQL: Tstringlist;
begin
  LSQL := TStringList.create;
  try

    LSQL.add('with CTECaixasEmpresa as (                                                          ');
    LSQL.add('    select                                                                          ');
    LSQL.add('      1 as id,                                                                      ');
    LSQL.add('      c.cod_empresa,  c.codigo, p.descricao_empresa,                                ');
    LSQL.add('      c.nome_usuario,                                                               ');
    LSQL.add('      c.data_sistema,                                                               ');
    LSQL.add('      cast((c.data_abertura ||' + Quotedstr(' ') + '||c.hora_abertura)as timestamp) abertura,    ');
    LSQL.add('      cast((c.data_fechamento ||' + Quotedstr(' ') + '||c.hora_fechamento) as timestamp) fechamento,    ');
    LSQL.add('      c.data_auditoria,                                                             ');
    LSQL.add('      coalesce(c.auditado,0) as auditado                                            ');
    LSQL.add('      from caixas c                                                                 ');
    LSQL.add('        inner join parametros p on (p.cod_empresa = c.cod_empresa)                  ');
    LSQL.add('          where c.cod_empresa = :ACodEmpresa                                        ');
    LSQL.add('             and c.codigo = :ACodCaixa                                              ');
    LSQL.add('                                                                                    ');
    LSQL.add('    ),                                                                              ');
    LSQL.add('                                                                                    ');
    LSQL.add('                                                                                    ');
    LSQL.add(' CTEResumoCaixa as (                                                                ');
    LSQL.add('    select 1 as id,                                                                 ');
    LSQL.add('           coalesce(udf_roundabnt(sum(v.valor_bruto),2),0) as totalProdutos,        ');
    LSQL.add('           coalesce(udf_roundabnt(sum(v.valor_txserv),2),0) as totalTaxaServico,    ');
    LSQL.add('           coalesce(udf_roundabnt(sum(v.valor_tx_entrega),2),0) as totalTaxaEntrega,');
    LSQL.add('           coalesce(udf_roundabnt(sum(v.valor_desconto),2),0) as totalDescontos     ');
    LSQL.add('        from vendas v                                                               ');
    LSQL.add('         where v.cod_empresa=:ACodEmpresa                                           ');
    LSQL.add('              and v.cod_caixa=:ACodCaixa                                            ');
    LSQL.add('              and coalesce(v.cancelada,0) =0                                                    ');
    LSQL.add('     ),                                                                             ');
    LSQL.add('                                                                                    ');
    LSQL.add('                                                                                    ');
    LSQL.add('  CTEVendas as (                                                                    ');
    LSQL.add('           select  1 as id,                                                         ');
    LSQL.add('         coalesce(count(*),0) as qtdeVendas,                                        ');
    LSQL.add('         coalesce(udf_roundabnt(sum(v.valor_total),2),0) as totalVendas             ');
    LSQL.add('          from vendas v                                                             ');
    LSQL.add('           where v.cod_empresa = :ACodEmpresa                                       ');
    LSQL.add('             and v.cod_caixa = :ACodCaixa                                           ');
    LSQL.add('         ),                                                                         ');
    LSQL.add('                                                                                    ');
    LSQL.add('  CTEVendasCanceladas as (                                                          ');
    LSQL.add('           select  1 as id,                                                         ');
    LSQL.add('         coalesce(count(*),0) as qtdVendasCanceladas,                               ');
    LSQL.add('         coalesce(udf_roundabnt(sum(v.valor_total),2),0) as totalVendasCanceladas   ');
    LSQL.add('          from vendas v                                                             ');
    LSQL.add('           where v.cod_empresa = :ACodEmpresa                                       ');
    LSQL.add('             and v.cod_caixa = :ACodCaixa                                           ');
    LSQL.add('             and coalesce(v.cancelada,0) = 1                                                    ');
    LSQL.add('         ),                                                                         ');
    LSQL.add('                                                                                    ');
    LSQL.add('  CTEpendurasRecebidas as (                                                         ');
    LSQL.add('      select 1 as id,                                                               ');
    LSQL.add('           coalesce(udf_roundabnt(sum(rc.valor),2),0) as totalPendurasRecebidas     ');
    LSQL.add('           from recebimentos_fatura rc                                              ');
    LSQL.add('           where rc.cod_empresa=:ACodEmpresa                                        ');
    LSQL.add('             and rc.cod_caixa = :ACodCaixa                                          ');
    LSQL.add('     ),                                                                             ');
    LSQL.add('  CTEtotalSuprimentos as (                                                          ');
    LSQL.add('                 select 1 as id,                                                    ');
    LSQL.add('                  coalesce(udf_roundabnt(sum(su.valor),2),0) as totalSuprimentos ');
    LSQL.add('                      from suprimentos su ');
    LSQL.add('                  where su.cod_empresa =:ACodEmpresa                                ');
    LSQL.add('                        and su.cod_caixa =:ACodCaixa                                ');
    LSQL.add('                      ),                                                            ');
    LSQL.add('  CTEtotalSangrias as (                                                             ');
    LSQL.add('                 select 1 as id,                                                    ');
    LSQL.add('                  coalesce(udf_roundabnt(sum(sa.valor),2),0) as totalSangrias from sangrias sa');
    LSQL.add('                  where sa.cod_empresa =:ACodEmpresa                                ');
    LSQL.add('                        and sa.cod_caixa =:ACodCaixa                                ');
    LSQL.add('                      ),                                                            ');
    LSQL.add('                                                                                    ');
    LSQL.add('  CTEParciaisEmitidos as(                                                           ');
    LSQL.add('                  select                                                            ');
    LSQL.add('                    1 as id,                                                        ');
    LSQL.add('                    coalesce(count(*),0) as qtdParciaisEmitidos                     ');
    LSQL.add('                     from parciais_caixa pc                                         ');
    LSQL.add('                    where pc.cod_empresa =:ACodEmpresa                              ');
    LSQL.add('                      and pc.cod_caixa = :ACodCaixa                                 ');
    LSQL.add('                     )                                                              ');
    LSQL.add('                                                                                    ');
    LSQL.add('                                                                                    ');
    LSQL.add('   select                                                                           ');
    LSQL.add('           ce.codigo, ce.data_sistema,                                              ');
    LSQL.add('           ce.nome_usuario,                                                         ');
    LSQL.add('           ce.abertura,                                                             ');
    LSQL.add('           ce.fechamento,                                                           ');
    LSQL.add('           rc.totalProdutos, rc.totalTaxaServico,                                   ');
    LSQL.add('           rc.totalTaxaEntrega, rc.totalDescontos,                                  ');
    LSQL.add('           pr.totalPendurasRecebidas,                                               ');
    LSQL.add('           su.totalSuprimentos,                                                     ');
    LSQL.add('           ((su.totalSuprimentos+ rc.totalProdutos + rc.totalTaxaEntrega ');
    LSQL.add('           + rc.totalTaxaServico + pr.totalPendurasRecebidas) - sa.totalSangrias - rc.totalDescontos) as SaldoCaixa,');
    LSQL.add('           sa.totalSangrias,                                                        ');
    LSQL.add('           pa.qtdParciaisEmitidos,                                                  ');
    LSQL.add('           vv.qtdeVendas,                                                           ');
    LSQL.add('           vv.totalVendas,                                                          ');
    LSQL.add('           vcc.qtdVendasCanceladas,                                                 ');
    LSQL.add('           vcc.totalVendasCanceladas                                                ');
    LSQL.add('      from CTEresumoCaixa rc                                                        ');
    LSQL.add('        inner join CTEpendurasRecebidas pr on (pr.id = rc.id)                       ');
    LSQL.add('        inner join CTEtotalSuprimentos su on (su.id = rc.id)                        ');
    LSQL.add('        inner join CTEtotalSangrias sa on (sa.id = rc.id)                           ');
    LSQL.add('        inner join CTEParciaisEmitidos pa on (pa.id = rc.id)                        ');
    LSQL.add('        inner join CTECaixasEmpresa ce on (ce.id = rc.id)                           ');
    LSQL.add('        inner join CTEVendasCanceladas vcc on (vcc.id = rc.id)                      ');
    LSQL.add('        inner join CTEVendas           vv on (vv.id = rc.id)                        ');
    LSQL.Text := StringReplace(LSQL.Text, ':ACodCaixa', Quotedstr(ACodCaixa), [rfReplaceAll]);
    LSQL.Text := StringReplace(LSQL.Text, ':ACodEmpresa', Quotedstr(ACodEmpresa), [rfReplaceAll]);
    dm.adicionaLog(LSQL.text);
    result := LSQL.text;
  finally
    FreeAndNil(LSQL);
  end;

end;

function tdm.getSQLVendasPorModalidade(ACodEmpresa, ACodCaixa: string): string;
var
  LSQL: Tstringlist;
begin
  LSQL := TStringList.create;
  try

    LSQL.add(' with CTEVendasPorModalidade as (                ');
    LSQL.add('   select                                        ');
    LSQL.add('    case v.tipo_venda ');
    LSQL.add('     when 1 then ' + Quotedstr('Mesa'));
    LSQL.add('     when 2 then ' + Quotedstr('Balcão'));
    LSQL.add('     when 3 then ' + Quotedstr('Delivery'));
    LSQL.add('    end as tipo,                                 ');
    LSQL.add('    v.tipo_venda,                                ');
    LSQL.add('    count(*) as qtd,                             ');
    LSQL.add('          sum(v.valor_bruto) as total            ');
    LSQL.add('     from vendas v                               ');
    LSQL.add('      where v.cod_empresa = :ACodEmpresa         ');
    LSQL.add('         and v.cod_caixa = :ACodCaixa            ');
    LSQL.add('      group by v.tipo_venda                      ');
    LSQL.add('   union all                                     ');
    LSQL.add('                                                 ');
    LSQL.add('    select ' + Quotedstr('  *Pessoas') + ' as tipo,                  ');
    LSQL.add('   ' + Quotedstr('1.2') + ' as tipo_venda,                          ');
    LSQL.add('    sum(v.qtde_pessoas) as qtd,                  ');
    LSQL.add('    sum(v.valor_bruto) as total                  ');
    LSQL.add('     from vendas v                               ');
    LSQL.add('      where v.cod_empresa = :ACodEmpresa         ');
    LSQL.add('         and v.cod_caixa = :ACodCaixa            ');
    LSQL.add('         and v.tipo_venda = 1                    ');
    LSQL.add('      group by v.tipo_venda                      ');
    LSQL.add('  )                                              ');
    LSQL.add('   select vdm.tipo_venda,                        ');
    LSQL.add('          vdm.tipo,                              ');
    LSQL.add('          vdm.qtd,                               ');
    LSQL.add('          vdm.total,                             ');
    LSQL.add('          (vdm.total / vdm.qtd) as ticketMedio   ');
    LSQL.add('    from CTEVendasPorModalidade vdm              ');
    LSQL.add('    order by vdm.tipo_venda                          ');
    LSQL.Text := StringReplace(LSQL.Text, ':ACodCaixa', Quotedstr(ACodCaixa), [rfReplaceAll]);
    LSQL.Text := StringReplace(LSQL.Text, ':ACodEmpresa', Quotedstr(ACodEmpresa), [rfReplaceAll]);
    dm.adicionaLog(LSQL.text);
    result := LSQL.text;
  finally
    FreeAndNil(LSQL);
  end;

end;

function tdm.getSQLPendurasEfetuadas(ACodEmpresa, ACodCaixa: string): string;
var
  LSQL: Tstringlist;
begin
  LSQL := TStringList.create;
  try

    LSQL.add('  select f.cod_fatura, f.hora, f.cod_venda,f.cod_cli,');
    LSQL.add('         F.usuario_inclusao,                         ');
    LSQL.add('         f.valor_fatura, f.observacao                ');
    LSQL.add('   from faturas f                                    ');
    LSQL.add('  where f.cod_empresa =:ACodEmpresa                  ');
    LSQL.add('   and f.cod_caixa=:ACodCaixa                        ');
    LSQL.add('   order by f.cod_fatura                             ');

    LSQL.text := StringReplace(LSQL.Text, ':ACodCaixa', Quotedstr(ACodCaixa), [rfReplaceAll]);
    LSQL.text := StringReplace(LSQL.Text, ':ACodEmpresa', Quotedstr(ACodEmpresa), [rfReplaceAll]);
    dm.adicionaLog(LSQL.text);
    result := LSQL.text;
  finally
    FreeAndNil(LSQL);
  end;

end;

function tdm.getSQLEstornosEfetuados(ACodEmpresa, ACodCaixa: string): string;
var
  LSQL: Tstringlist;
begin
  LSQL := TStringList.create;
  try
    LSQL.add(' select e.mesa, e.quantidade, p.descricao, e.hora,e.valor_unitario, (e.quantidade * e.valor_unitario) as total ');
    LSQL.add('  from estornos e                                                                     ');
    LSQL.add('    inner join produtos p on (p.cod_produto = e.cod_produto)                          ');
    LSQL.add('  where                                                                               ');
    LSQL.add('  e.cod_empresa = :ACodEmpresa                                                        ');
    LSQL.add('  and e.cod_caixa = :ACodCaixa                                                        ');
    LSQL.add('  order by e.codigo');

    LSQL.text := StringReplace(LSQL.Text, ':ACodCaixa', Quotedstr(ACodCaixa), [rfReplaceAll]);
    LSQL.text := StringReplace(LSQL.Text, ':ACodEmpresa', Quotedstr(ACodEmpresa), [rfReplaceAll]);
    dm.adicionaLog(LSQL.text);
    result := LSQL.text;
  finally
    FreeAndNil(LSQL);
  end;

end;

function tdm.getSQLSangriasCaixa(ACodEmpresa, ACodCaixa: string): string;
var
  LSQL: Tstringlist;
begin
  LSQL := TStringList.create;
  try

    LSQL.add('  select                                                        ');
    LSQL.add('   s.codigo, s.valor,ts.descricao,                              ');
    LSQL.add('   s.nome_usuario_autorizou as usuario_autorizacao,             ');
    LSQL.add('   s.obs, s.hora                                                ');
    LSQL.add('   from sangrias s                                              ');
    LSQL.add('    inner join tipos_sangria ts on (ts.codigo = s.codigo_tipo)  ');
    LSQL.add('   where s.cod_empresa=:ACodEmpresa                             ');
    LSQL.add('     and s.cod_caixa=:ACodCaixa                                 ');
    LSQL.add('     order by s.hora                                            ');

    LSQL.text := StringReplace(LSQL.Text, ':ACodCaixa', Quotedstr(ACodCaixa), [rfReplaceAll]);
    LSQL.text := StringReplace(LSQL.Text, ':ACodEmpresa', Quotedstr(ACodEmpresa), [rfReplaceAll]);
    dm.adicionaLog(LSQL.text);
    result := LSQL.text;
  finally
    FreeAndNil(LSQL);
  end;

end;

function tdm.getSQLSuprimentosCaixa(ACodEmpresa, ACodCaixa: string): string;
var
  LSQL: Tstringlist;
begin
  LSQL := TStringList.create;
  try

    LSQL.add(' select su.hora, su.valor             ');
    LSQL.add('   from suprimentos su                ');
    LSQL.add('  where su.cod_empresa=:ACodEmpresa   ');
    LSQL.add('    and su.cod_caixa=:ACodCaixa       ');
    LSQL.add('   order by su.id                     ');

    LSQL.text := StringReplace(LSQL.Text, ':ACodCaixa', Quotedstr(ACodCaixa), [rfReplaceAll]);
    LSQL.text := StringReplace(LSQL.Text, ':ACodEmpresa', Quotedstr(ACodEmpresa), [rfReplaceAll]);
    dm.adicionaLog(LSQL.text);
    result := LSQL.text;
  finally
    FreeAndNil(LSQL);
  end;

end;

function tdm.getSQLApuracaoDeCaixa(ACodEmpresa, ACodCaixa: string): string;
var
  LSQL: Tstringlist;
begin
  LSQL := TStringList.create;
  try

    LSQL.add(' select * from (');
    LSQL.add(' select fp.descricao,');
    LSQL.add(' coalesce(ap.total_sistema,0) as total_sistema,');
    LSQL.add(' coalesce(ap.total_operador,0) as total_operador,');
    LSQL.add(' coalesce(ap.diferenca,0) as total_diferenca ');
    LSQL.add(' from apuracao_caixa ap ');
    LSQL.add(' join formas_pagamento fp on (fp.cod_forma = ap.cod_forma) ');
    LSQL.add(' where ap.cod_empresa=:ACodEmpresa');
    LSQL.add(' and ap.cod_caixa=:ACodCaixa');
    LSQL.add(' order by fp.cod_forma ');
    LSQL.add(' ) where (total_sistema <> 0) or (total_operador <> 0) or (total_diferenca <> 0)');
    LSQL.text := StringReplace(LSQL.Text, ':ACodCaixa', Quotedstr(ACodCaixa), [rfReplaceAll]);
    LSQL.text := StringReplace(LSQL.Text, ':ACodEmpresa', Quotedstr(ACodEmpresa), [rfReplaceAll]);
    dm.adicionaLog(LSQL.text);
    result := LSQL.text;
  finally
    FreeAndNil(LSQL);
  end;

end;

function tdm.GetSQLDescontosCaixa(ACodEmpresa, ACodCaixa: string): string;
var
  LSQL: Tstringlist;
begin
  LSQL := TStringList.create;
  try
    LSQL.add(' select v.mesa, v.hora, v.valor_bruto,  ');
    LSQL.add('   v.valor_desconto, v.valor_total      ');
    LSQL.add('        from vendas v                   ');
    LSQL.add('  where v.cod_empresa = :ACodEmpresa    ');
    LSQL.add('   and v.cod_caixa =:ACodCaixa          ');
    LSQL.add('   and v.valor_desconto > 0             ');
    LSQL.add('   order by v.cod_venda                 ');
    LSQL.text := StringReplace(LSQL.Text, ':ACodCaixa', Quotedstr(ACodCaixa), [rfReplaceAll]);
    LSQL.text := StringReplace(LSQL.Text, ':ACodEmpresa', Quotedstr(ACodEmpresa), [rfReplaceAll]);
    dm.adicionaLog(LSQL.text);
    result := LSQL.text;
  finally
    FreeAndNil(LSQL);
  end;

end;

procedure Tdm.ImprimeResumodeParciais(ACodCaixa: string; ACodEmpresa: string);
var
  LQry: TIBQuery;
  LSQL: TStringList;
begin

  LQry := TIBQuery.Create(self);
  LQry.Database := dm.dbrestaurante;
  LQry.Transaction := dm.transacao;

  LSQL := TStringList.create;

  try
    LSQL.Add('select * PARCIAIS_CAIXA p where p.cod_caixa=' + Quotedstr(ACodCaixa) + ' and p.cod_empresa =' + Quotedstr(ACodEmpresa));
  finally
    freeAndNil(LQry);
    freeAndNil(LSQL);
  end;

end;

procedure tdm.ImprimeCabecalhoRelatorioCaixa(ACodEmpresa: string; ACodCaixa: string; ARelatorio: Tstringlist; ATipoImpressao: TTipoRelatorioCaixa);
var
  ts: TIBTransaction;
  LQryCabecalho: TIBQuery;
  modelo: SmallInt;
  LStrTitulo, LstrValor, LLinha: string;
begin
  ts := TIBTransaction.Create(self);
  ts.DefaultDatabase := dm.dbrestaurante;
  ts.Active := False;
  ts.Active := True;

  LQryCabecalho := TIBQuery.Create(Self);
  LQryCabecalho.Database := dbrestaurante;
  LQryCabecalho.Transaction := ts;
  LQryCabecalho.Active := False;

  try
    try
      LQryCabecalho.SQL.Add(getSQLResumoCaixa(ACodEmpresa, ACodCaixa));
      LQryCabecalho.Active := true;

      ARelatorio.add('</zera>');
      ARelatorio.add('</linha_dupla>');
      ARelatorio.add('<e></ce><n>:VpNomeEmpresa</N>');
      ARelatorio.add('<e></ce><n>Rel. Caixa - Nº :vpNumeroCaixa</N>');
      case ATipoImpressao of
        TRParcial:
          begin
            ARelatorio.add('<in><e></ce><n>PARCIAL</N></in>');
          end;
        TRFechamento:
          begin
            ARelatorio.add('<in><e></ce><n>FECHAMENTO</N></in>');
          end;
        TRReimpressao:
          begin
            ARelatorio.add('<in><e></ce><n>REIMPRESSAO</N></in>');
          end;

      end;

      ARelatorio.add('</linha_dupla>');
      ARelatorio.add('<e></ae><n>Movimento:</N><e></ae>:vpDataMovimento </e>');
      if (LQryCabecalho.fieldbyname('qtdParciaisEmitidos').Value > 1) then
      begin
        ARelatorio.add('</ce><n><in>Atenção! </in></N>');
        ARelatorio.add('</ce><n><in>:vpQtdParciaisImpressos relatórios parciais foram impressos! </in></N>');
      end;

      ARelatorio.add('</fn></ae><n>Hora desta impressão: </N></fn>:vpHoraImpressao');
      ARelatorio.add('</fn></ae><n>Operador: </N></fn>:vpNomeOperador');
      ARelatorio.add('</fn><S></ae><n>Abriu: </N></s></fn>:vpHoraAbertura </fn></ae><n><S>Fechou: </N></s></fn>:vpHoraFechamento');
      ARelatorio.add('</linha_simples>');
      ARelatorio.add('<e></ce><n><i>RESUMO DO CAIXA</N></in>');
      ARelatorio.add('</linha_simples>');

      ARelatorio.add('</fn></ad><n>:vpTituloSuprimentos</N></fn>:vpSuprimentos');
      ARelatorio.add('</fn></ad><n>:vpTituloProdutosVendidos</N></fn>:vpProdutosVendidos');
      ARelatorio.add('</fn></ad><n>:vpTituloGorjetas</N></fn>:vpGorjetas');
      ARelatorio.add('</fn></ad><n>:vpTituloTaxaEntrega</N></fn>:vpTaxasDeEntrega');
      ARelatorio.add('</fn></ad><n>:vpTituloPendurasRecebidas</N></fn>:vpPendurasRecebidas');
      ARelatorio.add('</fn></ad><n>:vpTituloSangrias</N></fn>:vpSangrias');
      ARelatorio.add('</fn></ad><n>:vpTituloDescontos</N></fn>:vpValorDescontos');

      ARelatorio.add('</fn></ad><n>:vpLinhaFechamento</N></fn>');
      ARelatorio.add('</fn></ad><n>:vpTituloSaldoGaveta</N></fn>:vpSaldoGaveta');
      ARelatorio.add('</linha_simples>');

      //Descontos

      ARelatorio.add('</fn></ad><n>:vpTituloVendasCanceladasQtd</N></fn>:vpValorVendasCanceladasQtd');
      ARelatorio.add('</fn></ad><n>:vpTituloVendasCanceladasTotal</N></fn>:vpValorVendasCanceladasTotal');
      ARelatorio.add('</linha_simples>');
      ARelatorio.Text := StringReplace(ARelatorio.Text, ':VpNomeEmpresa', nome_fantasia, [rfReplaceAll]);
      ARelatorio.Text := StringReplace(ARelatorio.Text, ':vpNumeroCaixa', LQryCabecalho.fieldbyname('codigo').AsString, [rfReplaceAll]);
      ARelatorio.Text := StringReplace(ARelatorio.Text, ':vpDataMovimento', LQryCabecalho.fieldbyname('data_sistema').AsString, [rfReplaceAll]);
      ARelatorio.Text := StringReplace(ARelatorio.Text, ':vpQtdParciaisImpressos', LQryCabecalho.fieldbyname('qtdParciaisEmitidos').AsString, [rfReplaceAll]);
      ARelatorio.Text := StringReplace(ARelatorio.Text, ':vpHoraImpressao', FormatDateTime('DD/MM/YYY HH:MM', now), [rfReplaceAll]);
      ARelatorio.Text := StringReplace(ARelatorio.Text, ':vpNomeOperador', LQryCabecalho.fieldbyname('nome_usuario').AsString, [rfReplaceAll]);
      ARelatorio.Text := StringReplace(ARelatorio.Text, ':vpHoraAbertura', FormatDateTime('DD/MM/YYY HH:MM', LQryCabecalho.fieldbyname('abertura').AsDateTime), [rfReplaceAll]);
      if (LQryCabecalho.fieldbyname('fechamento').Value <> null) then
        ARelatorio.Text := StringReplace(ARelatorio.Text, ':vpHoraFechamento', FormatDateTime('DD/MM/YYY HH:MM', LQryCabecalho.fieldbyname('fechamento').AsDateTime), [rfReplaceAll])
      else
        ARelatorio.Text := StringReplace(ARelatorio.Text, ':vpHoraFechamento', '<in>Ainda aberto</in>', [rfReplaceAll]);

      //Suprimentos
      LStrTitulo := PadRightA('    Suprimentos(Fundo):', 36, '.');
      LstrValor := PadLeft(FormatFloat('R$ ###,###,##0.00', LQryCabecalho.fieldbyname('totalSuprimentos').Value), 12, '.');
      ARelatorio.Text := StringReplace(ARelatorio.Text, ':vpTituloSuprimentos', LStrTitulo, [rfReplaceAll]);
      ARelatorio.Text := StringReplace(ARelatorio.Text, ':vpSuprimentos', LstrValor, [rfReplaceAll]);

      //Produtos vendidos
      LStrTitulo := PadRightA('    + Produtos vendidos(S/Descontos):', 36, '.');
      LstrValor := PadLeft(FormatFloat('R$ ###,###,##0.00', LQryCabecalho.fieldbyname('totalProdutos').AsCurrency), 12, '.');
      ARelatorio.Text := StringReplace(ARelatorio.Text, ':vpTituloProdutosVendidos', LStrTitulo, [rfReplaceAll]);
      ARelatorio.Text := StringReplace(ARelatorio.Text, ':vpProdutosVendidos', LstrValor, [rfReplaceAll]);

      //Gorjetas
      LStrTitulo := PadRightA('    + Gorjetas:', 36, '.');
      LstrValor := PadLeft(FormatFloat('R$ ###,###,##0.00', LQryCabecalho.fieldbyname('totalTaxaServico').AsCurrency), 12, '.');
      ARelatorio.Text := StringReplace(ARelatorio.Text, ':vpTituloGorjetas', LStrTitulo, [rfReplaceAll]);
      ARelatorio.Text := StringReplace(ARelatorio.Text, ':vpGorjetas', LstrValor, [rfReplaceAll]);

      //Entregas
      LStrTitulo := PadRightA('    + Taxa de entrega:', 36, '.');
      LstrValor := PadLeft(FormatFloat('R$ ###,###,##0.00', LQryCabecalho.fieldbyname('totalTaxaEntrega').AsCurrency), 12, '.');
      ARelatorio.Text := StringReplace(ARelatorio.Text, ':vpTituloTaxaEntrega', LStrTitulo, [rfReplaceAll]);
      ARelatorio.Text := StringReplace(ARelatorio.Text, ':vpTaxasDeEntrega', LstrValor, [rfReplaceAll]);


      //Penduras recebidas
      LStrTitulo := PadRightA('    + Penduras recebidas:', 36, '.');
      LstrValor := PadLeft(FormatFloat('R$ ###,###,##0.00', LQryCabecalho.fieldbyname('totalPendurasRecebidas').AsCurrency), 12, '.');
      ARelatorio.Text := StringReplace(ARelatorio.Text, ':vpTituloPendurasRecebidas', LStrTitulo, [rfReplaceAll]);
      ARelatorio.Text := StringReplace(ARelatorio.Text, ':vpPendurasRecebidas', LstrValor, [rfReplaceAll]);

      //Sangrias
      LStrTitulo := PadRightA('    - Sangrias(retiradas):', 36, '.');
      LstrValor := PadLeft(FormatFloat('-R$ ###,###,##0.00', LQryCabecalho.fieldbyname('totalSangrias').AsCurrency), 12, '.');
      ARelatorio.Text := StringReplace(ARelatorio.Text, ':vpTituloSangrias', LStrTitulo, [rfReplaceAll]);
      ARelatorio.Text := StringReplace(ARelatorio.Text, ':vpSangrias', LstrValor, [rfReplaceAll]);

      LstrValor := PadLeft('', 12, '-');
      ARelatorio.Text := StringReplace(ARelatorio.Text, ':vpLinhaFechamento', LstrValor, [rfReplaceAll]);

      //Descontos
      LStrTitulo := PadRightA('   - Descontos:', 36, '.');
      LstrValor := PadLeft(FormatFloat('R$ ###,###,##0.00', LQryCabecalho.fieldbyname('totalDescontos').AsCurrency), 12, '.');
      ARelatorio.Text := StringReplace(ARelatorio.Text, ':vpTituloDescontos', LStrTitulo, [rfReplaceAll]);
      ARelatorio.Text := StringReplace(ARelatorio.Text, ':vpValorDescontos', LstrValor, [rfReplaceAll]);


      //Saldo
      LStrTitulo := PadRightA('    = Saldo na gaveta:', 36, '.');
      LstrValor := PadLeft(FormatFloat('R$ ###,###,##0.00', LQryCabecalho.fieldbyname('SaldoCaixa').AsCurrency), 12, '.');
      ARelatorio.Text := StringReplace(ARelatorio.Text, ':vpTituloSaldoGaveta', LStrTitulo, [rfReplaceAll]);
      ARelatorio.Text := StringReplace(ARelatorio.Text, ':vpSaldoGaveta', LstrValor, [rfReplaceAll]);


      //Vendas qtde
      LStrTitulo := PadRight('    Vendas canceladas(qtde):', 36, '.');
      LstrValor := PadLeft(LQryCabecalho.fieldbyname('qtdVendasCanceladas').Asstring, 12, ' ');
      ARelatorio.Text := StringReplace(ARelatorio.Text, ':vpTituloVendasCanceladasQtd', LStrTitulo, [rfReplaceAll]);
      ARelatorio.Text := StringReplace(ARelatorio.Text, ':vpValorVendasCanceladasQtd', LstrValor, [rfReplaceAll]);


      //Vendas total
      LStrTitulo := PadRightA('    Vendas canceladas(total):', 36, '.');
      LstrValor := PadLeft(FormatFloat('R$ ###,###,##0.00', LQryCabecalho.fieldbyname('totalVendasCanceladas').AsCurrency), 12, '.');
      ARelatorio.Text := StringReplace(ARelatorio.Text, ':vpTituloVendasCanceladasTotal', LStrTitulo, [rfReplaceAll]);
      ARelatorio.Text := StringReplace(ARelatorio.Text, ':vpValorVendasCanceladasTotal', LstrValor, [rfReplaceAll]);

    except
      on E: Exception do
      begin
        raise Exception.create(e.Message);
      end;

    end;
  finally
    FreeAndNil(ts);
    FreeAndNil(LQryCabecalho);
  end;

end;

procedure tdm.ImprimeVendasPorModalidade(ACodEmpresa: string; ACodCaixa: string; ARelatorio: Tstringlist);
var
  ts: TIBTransaction;
  LQryVendasPorModalidade: TIBQuery;
  modelo: SmallInt;
  LModalidade, LQtde, LTotal, LTicket, LLinha: string;
begin
  ts := TIBTransaction.Create(self);
  ts.DefaultDatabase := dm.dbrestaurante;
  ts.Active := False;
  ts.Active := True;

  LQryVendasPorModalidade := TIBQuery.Create(Self);
  LQryVendasPorModalidade.Database := dbrestaurante;
  LQryVendasPorModalidade.Transaction := ts;
  LQryVendasPorModalidade.Active := False;

  try
    try
      LQryVendasPorModalidade.SQL.clear;
      LQryVendasPorModalidade.sql.add(getSQLVendasPorModalidade(ACodEmpresa, ACodCaixa));
      LQryVendasPorModalidade.Active := true;
      LQryVendasPorModalidade.FetchAll;
      LQryVendasPorModalidade.first;

      if (LQryVendasPorModalidade.IsEmpty = false) then
      begin
        ARelatorio.add('<e></ce><n><in>RESUMO POR MODALIDADE</in></N>');
        ARelatorio.add('</linha_simples>');
        LModalidade := PadCenter('Modalidade', 13, ' ');
        LQtde := PadCenter('Qtde', 4, ' ');
        LTotal := PadLeftA('Total', 14, ' ');
        LTicket := PadLeftA('Ticket Méd.', 17, ' ');
        LLinha := LModalidade + LQtde + LTotal + LTicket;
        ARelatorio.add('</fn></ce><n>' + LLinha + '</N>');
        ARelatorio.add('</linha_simples>');
        while not LQryVendasPorModalidade.eof do
        begin

          LModalidade := PadCenter(LQryVendasPorModalidade.fieldbyname('tipo').asstring, 13, ' ');
          LQtde := PadCenter(LQryVendasPorModalidade.fieldbyname('qtd').asstring, 4, ' ');
          if (trim(LQryVendasPorModalidade.fieldbyname('tipo_venda').Value) <> '1.2') then
          begin

            LTotal := PadLeftA(FormatFloat('R$ ###,###,##0.00', LQryVendasPorModalidade.fieldbyname('total').AsCurrency), 14, ' ');
          end
          else
          begin
            LTotal := PadLeftA('', 14, ' ');
          end;
          LTicket := PadLeftA(FormatFloat('R$ ###,###,##0.00', LQryVendasPorModalidade.fieldbyname('ticketmedio').AsCurrency), 17, ' ');
          LLinha := LModalidade + LQtde + LTotal + LTicket;
          ARelatorio.add(LLinha);
          LQryVendasPorModalidade.Next;
        end;
      end;
      ARelatorio.add('</linha_simples>');
      ARelatorio.add('</fn></ae><c><n>Valor de produtos. Não inclui gorjetas e taxa de entrega </N></c>');
      ARelatorio.add('</linha_simples>');
    except
      on E: Exception do
      begin
        raise Exception.create(e.Message);
      end;

    end;
  finally
    FreeAndNil(ts);
    FreeAndNil(LQryVendasPorModalidade);
  end;
end;

procedure tdm.ImprimeApuracaoDoCaixa(ACodEmpresa: string; ACodCaixa: string; ARelatorio: Tstringlist);
var
  ts: TIBTransaction;
  LQryApuracaoCaixa: TIBQuery;
  modelo: SmallInt;
  LFormaPagamento, LValorSistema, LValorOperador, LDiferenca, LLinha: string;
  lSomaDiferenca: double;
begin
  ts := TIBTransaction.Create(self);
  ts.DefaultDatabase := dm.dbrestaurante;
  ts.Active := False;
  ts.Active := True;

  LQryApuracaoCaixa := TIBQuery.Create(Self);
  LQryApuracaoCaixa.Database := dbrestaurante;
  LQryApuracaoCaixa.Transaction := ts;
  LQryApuracaoCaixa.Active := False;

  try
    try
      LQryApuracaoCaixa.SQL.clear;
      LQryApuracaoCaixa.Active := False;
      LQryApuracaoCaixa.SQL.Clear;
      LQryApuracaoCaixa.sql.Add(getSQLApuracaoDeCaixa(ACodEmpresa, ACodCaixa));
      LQryApuracaoCaixa.Active := true;
      LQryApuracaoCaixa.FetchAll;
      LQryApuracaoCaixa.first;

      if (LQryApuracaoCaixa.IsEmpty = false) then
      begin
        ARelatorio.add('<e></ce><n><in>APURAÇÃO DE CAIXA</in></N>');
        ARelatorio.add('</fn></ae><c><n>Lembre: o valor de suprimentos entra no total recebido em dinheiro!</N></c>');
        ARelatorio.add('</linha_simples>');
        LFormaPagamento := PadCenter('Forma de pagto', 15, ' ');
        LValorSistema := PadLeftA('Sistema', 11, ' ');
        LValorOperador := PadLeftA('Operador', 11, ' ');
        LDiferenca := PadLeftA('Diferença', 11, ' ');
        LLinha := LFormaPagamento + LValorSistema + LValorOperador + LDiferenca;
        ARelatorio.add('</fn></ce><n>' + LLinha + '</N>');
        ARelatorio.add('</linha_simples>');
        lSomaDiferenca := 0;
        while not LQryApuracaoCaixa.eof do
        begin

          LFormaPagamento := PadRightA(LQryApuracaoCaixa.fieldbyname('descricao').asstring, 15, ' ');
          LValorSistema := PadLeftA(FormatFloat('###,###,##0.00 ', LQryApuracaoCaixa.fieldbyname('total_sistema').AsCurrency), 11, ' ');
          LValorOperador := PadLeftA(FormatFloat('###,###,##0.00', LQryApuracaoCaixa.fieldbyname('total_operador').AsCurrency), 11, ' ');
          LDiferenca := PadLeftA(FormatFloat('###,###,##0.00', LQryApuracaoCaixa.fieldbyname('total_diferenca').AsCurrency), 11, ' ');
          LLinha := LFormaPagamento + LValorSistema + LValorOperador + LDiferenca;
          ARelatorio.add(LLinha);
          lSomaDiferenca := lSomaDiferenca + LQryApuracaoCaixa.fieldbyname('total_diferenca').Value;
          LQryApuracaoCaixa.Next;
        end;
      end;
      ARelatorio.add('</linha_simples>');
      if (round(lSomaDiferenca) <> 0) then
      begin

        LFormaPagamento := PadRightA('Diferença total', 15, ' ');
        LDiferenca := PadLeftA(FormatFloat('###,###,##0.00', lSomaDiferenca), 33, ' ');
        LLinha := LFormaPagamento + LDiferenca;
        ARelatorio.add('</fn></ce><n><i>' + LLinha + '</in>');
        ARelatorio.add('</linha_simples>');
      end;

      ARelatorio.add('</fn></ae><c><n>Sistema  = Recebimentos computados pelo sistema </N></c>');
      ARelatorio.add('</fn></ae><c><n>Operador = Valor informado pelo operador no fechamento do caixa </N></c>');
      ARelatorio.add('</fn></ae><c><n>Diferença= Sistema - Operador </N></c>');
      ARelatorio.add('</fn></ae><c><n>Dinheiro = (Suprimentos + Vendas pagas em dinheiro) - Sangrias  </N></c>');
    except
      on E: Exception do
      begin
        raise Exception.create(e.Message);
      end;

    end;
  finally
    FreeAndNil(ts);
    FreeAndNil(LQryApuracaoCaixa);
  end;
end;

procedure tdm.ImprimeDescontosDoCaixa(ACodEmpresa: string; ACodCaixa: string; ARelatorio: Tstringlist);
var
  ts: TIBTransaction;
  LQryDescontos: TIBQuery;
  modelo: SmallInt;
  LMesa, LHora, LSubtotal, LDesconto, LTotal, LLinha: string;
  LTotalDescontos: double;
begin
  ts := TIBTransaction.Create(self);
  ts.DefaultDatabase := dm.dbrestaurante;
  ts.Active := False;
  ts.Active := True;

  LQryDescontos := TIBQuery.Create(Self);
  LQryDescontos.Database := dbrestaurante;
  LQryDescontos.Transaction := ts;
  LQryDescontos.Active := False;

  try
    try
      LQryDescontos.SQL.clear;
      LQryDescontos.Active := False;
      LQryDescontos.SQL.Clear;
      LQryDescontos.sql.Add(GetSQLDescontosCaixa(ACodEmpresa, ACodCaixa));
      LQryDescontos.Active := true;
      LQryDescontos.FetchAll;
      LQryDescontos.first;

      if (LQryDescontos.IsEmpty = false) then
      begin
        ARelatorio.add('</linha_simples>');
        ARelatorio.add('<e></ce><n>DESCONTOS EFETUADOS</in></N>');
        ARelatorio.add('</linha_simples>');
        LMesa := PadRightA('Mesa', 4, ' ');
        LHora := PadRightA('Hora', 6, ' ');
        LSubtotal := PadLeftA('Subtotal', 12, ' ');
        LDesconto := PadLeftA('Desconto', 13, ' ');
        LTotal := PadLeftA('Total', 13, ' ');
        LLinha := LMesa + LHora + LSubtotal + LDesconto + LTotal;
        ARelatorio.add('</fn></ad>' + LLinha + '</N>');
        ARelatorio.add('</linha_simples>');
        LTotalDescontos := 0;
        while not LQryDescontos.eof do
        begin

          LMesa := PadRightA(LQryDescontos.fieldbyname('mesa').asstring, 4, ' ');
          LHora := PadRightA(LQryDescontos.fieldbyname('hora').asstring, 6, ' ');
          LSubtotal := PadLeftA(FormatFloat('###,###,##0.00', LQryDescontos.fieldbyname('valor_bruto').AsCurrency), 12, ' ');
          LDesconto := PadLeftA(FormatFloat('###,###,##0.00', LQryDescontos.fieldbyname('valor_desconto').AsCurrency), 13, ' ');
          LTotal := PadLeftA(FormatFloat('###,###,##0.00', LQryDescontos.fieldbyname('valor_total').AsCurrency), 13, ' ');
          LLinha := LMesa + LHora + LSubtotal + LDesconto + LTotal;
          ARelatorio.add(LLinha);
          LTotalDescontos := LTotalDescontos + LQryDescontos.fieldbyname('valor_desconto').Value;
          LQryDescontos.Next;
        end;
        ARelatorio.add('</linha_simples>');
      end;

      if (round(LTotalDescontos) <> 0) then
      begin

        LMesa := 'Total de descontos: ';
        LDesconto := FormatFloat('R$ ###,###,##0.00', LTotalDescontos);
        LLinha := LMesa + LDesconto;
        ARelatorio.add('</fn></ae><n><i>' + LLinha + '</in>');
      end;

    except
      on E: Exception do
      begin
        raise Exception.create(e.Message);
      end;

    end;
  finally
    FreeAndNil(ts);
    FreeAndNil(LQryDescontos);
  end;
end;

procedure tdm.ImprimeTaxaServicoDoCaixa(ACodEmpresa: string; ACodCaixa: string; ARelatorio: Tstringlist);
var
  ts: TIBTransaction;
  LQryTaxaServico: TIBQuery;
  modelo: SmallInt;
  LGarcon, LTotalGarcon, LTotalFuncionarios, LTotalCasa, LLinha: string;
  LGeralGarcons, LGeralFuncionarios, LGeralCasa: double;
begin
  ts := TIBTransaction.Create(self);
  ts.DefaultDatabase := dm.dbrestaurante;
  ts.Active := False;
  ts.Active := True;

  LQryTaxaServico := TIBQuery.Create(Self);
  LQryTaxaServico.Database := dbrestaurante;
  LQryTaxaServico.Transaction := ts;
  LQryTaxaServico.Active := False;

  try
    try
      LQryTaxaServico.SQL.clear;
      LQryTaxaServico.Active := False;
      LQryTaxaServico.SQL.Clear;
      LQryTaxaServico.sql.Add(getSQLRelatorioTaxaServico(ACodEmpresa, ACodCaixa, 0, 0));

      LQryTaxaServico.Active := true;
      LQryTaxaServico.FetchAll;
      LQryTaxaServico.first;

      if (LQryTaxaServico.IsEmpty = false) then
      begin
        ARelatorio.add('</linha_simples>');
        ARelatorio.add('<e></ce><n><in>RATEIO DE GORJETAS</in></N>');
        ARelatorio.add('</linha_simples>');
        LGarcon := PadRightA('Nome', 15, ' ');
        LTotalGarcon := PadLeftA('Tot. Garçom', 11, ' ');
        LTotalFuncionarios := PadLeftA('Equipe', 11, ' ');
        LTotalCasa := PadLeftA('Casa', 11, ' ');
        LLinha := LGarcon + LTotalGarcon + LTotalFuncionarios + LTotalCasa;
        ARelatorio.add('</fn></ad>' + LLinha + '</N>');
        ARelatorio.add('</linha_simples>');
        LGeralGarcons := 0;
        LGeralFuncionarios := 0;
        LGeralCasa := 0;
        while not LQryTaxaServico.eof do
        begin

          LGarcon := PadRightA(LQryTaxaServico.fieldbyname('nome').asstring, 15, ' ');
          LTotalGarcon := PadLeftA(FormatFloat('###,###,##0.00', LQryTaxaServico.fieldbyname('total_taxa_garcon').AsCurrency), 11, ' ');
          LTotalFuncionarios := PadLeftA(FormatFloat('###,###,##0.00', LQryTaxaServico.fieldbyname('total_taxa_funcionarios').AsCurrency), 11, ' ');
          LTotalCasa := PadLeftA(FormatFloat('###,###,##0.00', LQryTaxaServico.fieldbyname('total_taxa_casa').AsCurrency), 11, ' ');
          LLinha := LGarcon + LTotalGarcon + LTotalFuncionarios + LTotalCasa;
          ARelatorio.add(LLinha);
          LGeralGarcons := LGeralGarcons + LQryTaxaServico.fieldbyname('total_taxa_garcon').Value;
          LGeralFuncionarios := LGeralFuncionarios + LQryTaxaServico.fieldbyname('total_taxa_funcionarios').Value;
          LGeralCasa := LGeralCasa + LQryTaxaServico.fieldbyname('total_taxa_casa').Value;

          LQryTaxaServico.Next;
        end;
        ARelatorio.add('</linha_simples>');
      end;

      LGarcon := PadRightA('', 15, ' ');
      LTotalGarcon := PadLeftA(FormatFloat('###,###,##0.00', LGeralGarcons), 11, ' ');
      LTotalFuncionarios := PadLeftA(FormatFloat('###,###,##0.00', LGeralFuncionarios), 11, ' ');
      LTotalCasa := PadLeftA(FormatFloat('###,###,##0.00', LGeralCasa), 11, ' ');
      LLinha := LGarcon + LTotalGarcon + LTotalFuncionarios + LTotalCasa;
      ARelatorio.add('</fn><n></ae>' + LLinha + '');

    except
      on E: Exception do
      begin
        raise Exception.create(e.Message);
      end;

    end;
  finally
    FreeAndNil(ts);
    FreeAndNil(LQryTaxaServico);
  end;
end;

procedure tdm.imprimePendurasCaixa(ACodEmpresa: string; ACodCaixa: string; ARelatorio: Tstringlist);
var
  ts: TIBTransaction;
  LQryPendurasCaixa: TIBQuery;
  modelo: SmallInt;
  LFatura, LHora, LCodVenda, LValorFatura, LObs, LLinha: string;
  LTotalFaturas: double;
begin
  ts := TIBTransaction.Create(self);
  ts.DefaultDatabase := dm.dbrestaurante;
  ts.Active := False;
  ts.Active := True;

  LQryPendurasCaixa := TIBQuery.Create(Self);
  LQryPendurasCaixa.Database := dbrestaurante;
  LQryPendurasCaixa.Transaction := ts;
  LQryPendurasCaixa.Active := False;

  try
    try
      LQryPendurasCaixa.SQL.clear;
      LQryPendurasCaixa.Active := False;
      LQryPendurasCaixa.SQL.Clear;
      LQryPendurasCaixa.sql.Add(getSQLPendurasEfetuadas(ACodEmpresa, ACodCaixa));

      LQryPendurasCaixa.Active := true;
      LQryPendurasCaixa.FetchAll;
      LQryPendurasCaixa.first;

      if (LQryPendurasCaixa.IsEmpty = false) then
      begin
        ARelatorio.add('</linha_simples>');
        ARelatorio.add('<e></ce><n><in>PENDURAS EFETUADAS</in></N>');
        ARelatorio.add('</linha_simples>');
        LFatura := PadRightA('Fatura', 9, ' ');
        LHora := PadRightA('Hora', 17, ' ');
        LCodVenda := PadRightA('Venda nº', 11, ' ');
        LValorFatura := PadLeftA('Valor', 11, ' ');
        LLinha := LFatura + LHora + LCodVenda + LValorFatura;
        ARelatorio.add('</fn></ad><n>' + LLinha + '</N>');
        ARelatorio.add('</linha_simples>');
        LTotalFaturas := 0;

        while not LQryPendurasCaixa.eof do
        begin
          LFatura := PadRightA(LQryPendurasCaixa.FieldByName('cod_fatura').Value, 9, ' ');
          LHora := PadRightA(LQryPendurasCaixa.FieldByName('hora').Value, 17, ' ');
          LCodVenda := PadRightA(LQryPendurasCaixa.FieldByName('cod_venda').Value, 11, ' ');
          LValorFatura := PadLeftA(FormatFloat('###,###,##0.00', LQryPendurasCaixa.FieldByName('valor_fatura').Value), 11, ' ');
          LLinha := LFatura + LHora + LCodVenda + LValorFatura;
          ARelatorio.add('</fn></ad>' + LLinha + '</N>');
          ARelatorio.add('</linha_simples>');
          LTotalFaturas := LQryPendurasCaixa.FieldByName('valor_fatura').Value;
          LQryPendurasCaixa.Next;
        end;
        ARelatorio.add('</linha_simples>');
      end;

      ARelatorio.add('</fn><n></ae>' + LLinha + '');

    except
      on E: Exception do
      begin
        raise Exception.create(e.Message);
      end;

    end;
  finally
    FreeAndNil(ts);
    FreeAndNil(LQryPendurasCaixa);
  end;
end;

procedure tdm.imprimeEstornosCaixa(ACodEmpresa: string; ACodCaixa: string; ARelatorio: Tstringlist);
var
  ts: TIBTransaction;
  LQryEstornos: TIBQuery;
  modelo: SmallInt;
  LQuantidade, LHora, LNomeProduto, LValorUnitario, LTotal, LObs, LLinha: string;
  LMesa: string;
begin
  ts := TIBTransaction.Create(self);
  ts.DefaultDatabase := dm.dbrestaurante;
  ts.Active := False;
  ts.Active := True;

  LQryEstornos := TIBQuery.Create(Self);
  LQryEstornos.Database := dbrestaurante;
  LQryEstornos.Transaction := ts;
  LQryEstornos.Active := False;

  try
    try
      LQryEstornos.SQL.clear;
      LQryEstornos.Active := False;
      LQryEstornos.SQL.Clear;
      LQryEstornos.sql.Add(getSQLEstornosEfetuados(ACodEmpresa, ACodCaixa));

      LQryEstornos.Active := true;
      LQryEstornos.FetchAll;
      LQryEstornos.first;

      if (LQryEstornos.IsEmpty = false) then
      begin
        ARelatorio.add('<e></ce><n><in>ESTORNOS DE PRODUTOS</in></N></e>');
        ARelatorio.add('</linha_simples>');
        ARelatorio.add('</fn></ad>' + PadRight('Mesa.', 7, ' ') + PadRight('Descrição', 41) + '</N>');
        ARelatorio.add('</fn></ad>' + PadRight('Qtde.', 14, ' ') + PadLeft('Vl Unitário', 15) + PadLeft('Total', 19) + '</N>');
        ARelatorio.add('</linha_simples>');

        while not LQryEstornos.eof do
        begin
          LMesa := LQryEstornos.FieldByName('mesa').Value;
          LQuantidade := LQryEstornos.FieldByName('quantidade').Value;
          LHora := LQryEstornos.FieldByName('hora').AsString;
          LNomeProduto := LQryEstornos.FieldByName('descricao').Value;
          LValorUnitario := FormatFloat('R$ ###,###,##0.00', LQryEstornos.FieldByName('valor_unitario').Value);
          LTotal := FormatFloat('R$ ###,###,##0.00', LQryEstornos.FieldByName('total').Value);

          ARelatorio.add('</fn></ad>' + PadRight(LMesa, 7, ' ') + PadRight(LNomeProduto, 41) + '</N>');
          ARelatorio.add('</fn></ad>' + (PadRight(LQuantidade, 14, ' ') + PadLeft(LValorUnitario, 15) + PadLeft(LTotal, 19)) + '</N>');
          ARelatorio.add('</linha_simples>');
          LQryEstornos.Next;
        end;
        ARelatorio.add('</linha_simples>');
      end;

//      ARelatorio.add('</fn><n></ae>' + LLinha + '');

    except
      on E: Exception do
      begin
        raise Exception.create(e.Message);
      end;

    end;
  finally
    FreeAndNil(ts);
    FreeAndNil(LQryEstornos);
  end;
end;

function TDM.FormatarNumeroCom3CasasOuInteiro(Valor: Double): string;
begin
  if Frac(Valor) = 0 then
    result := FormatFloat('0', Valor)  // Número inteiro, sem casas decimais
  else
    result := FormatFloat('0.000', Valor);  // Número com 3 casas decimais
end;

procedure tdm.ImprimePedidosPorEntregador(ACodEmpresa: string; ACodCaixa: string; ARelatorio: Tstringlist);
var
  ts: TIBTransaction;
  LQryPedidos: TIBQuery;
  LNomeEntregador, LQtdePedidos, LTotalEntregas, LLinha: string;
  LSomaEntregas: double;
begin
  ts := TIBTransaction.Create(self);
  ts.DefaultDatabase := dm.dbrestaurante;
  ts.Active := False;
  ts.Active := True;

  LQryPedidos := TIBQuery.Create(Self);
  LQryPedidos.Database := dbrestaurante;
  LQryPedidos.Transaction := ts;
  LQryPedidos.Active := False;

  try
    try
      LQryPedidos.SQL.clear;
      LQryPedidos.Active := False;
      LQryPedidos.SQL.Clear;
      LQryPedidos.sql.Add(GetSQLPedidosPorEntregador(ACodEmpresa, ACodCaixa));

      LQryPedidos.Active := true;
      LQryPedidos.FetchAll;
      LQryPedidos.first;

      if (LQryPedidos.IsEmpty = false) then
      begin
        ARelatorio.add('</linha_simples>');
        ARelatorio.add('<e></ce><n><in>PEDIDOS POR ENTREGADOR</in></N>');
        ARelatorio.add('</linha_simples>');
        LNomeEntregador := PadRightA('Nome', 15, ' ');
        LQtdePedidos := PadLeftA('Qtd pedidos', 11, ' ');
        LTotalEntregas := PadLeftA('Total:', 22, ' ');
        LLinha := LNomeEntregador + LQtdePedidos + LTotalEntregas;
        ARelatorio.add('</fn></ad>' + LLinha + '</N>');
        ARelatorio.add('</linha_simples>');
        LSomaEntregas := 0;
        while not LQryPedidos.eof do
        begin

          LNomeEntregador := PadRightA(LQryPedidos.fieldbyname('nome_entregador').asstring, 15, ' ');
          LQtdePedidos := PadLeftA(LQryPedidos.fieldbyname('QtdePedidos').asstring, 11, ' ');
          LTotalEntregas := PadLeftA(FormatFloat('###,###,##0.00', LQryPedidos.fieldbyname('TotalEntregas').AsCurrency), 22, ' ');
          LLinha := LNomeEntregador + LQtdePedidos + LTotalEntregas;
          ARelatorio.add(LLinha);
          LSomaEntregas := LSomaEntregas + LQryPedidos.fieldbyname('TotalEntregas').Value;

          LQryPedidos.Next;
        end;
        ARelatorio.add('</linha_simples>');

        LNomeEntregador := PadRightA('Total de entregas', 22, ' ');
        LTotalEntregas := PadLeftA(FormatFloat('R$ ###,###,##0.00', LSomaEntregas), 26, ' ');
        LLinha := LNomeEntregador + LTotalEntregas;
        ARelatorio.add('</fn><n></ae>' + LLinha + '');
      end;

    except
      on E: Exception do
      begin
        raise Exception.create(e.Message);
      end;

    end;
  finally
    FreeAndNil(ts);
    FreeAndNil(LQryPedidos);
  end;
end;

procedure tdm.imprimeSuprimentosCaixa(ACodEmpresa: string; ACodCaixa: string; ARelatorio: Tstringlist);
var
  ts: TIBTransaction;
  LQrySuprimentos: TIBQuery;
  LTotalizador, LHoraSuprimento, LValorSuprimento, LLinha: string;
  LTotalSuprimentos: double;
begin
  ts := TIBTransaction.Create(self);
  ts.DefaultDatabase := dm.dbrestaurante;
  ts.Active := False;
  ts.Active := True;

  LQrySuprimentos := TIBQuery.Create(Self);
  LQrySuprimentos.Database := dbrestaurante;
  LQrySuprimentos.Transaction := ts;
  LQrySuprimentos.Active := False;

  try
    try
      LQrySuprimentos.SQL.clear;
      LQrySuprimentos.Active := False;
      LQrySuprimentos.SQL.Clear;
      LQrySuprimentos.sql.Add(getSQLSuprimentosCaixa(ACodEmpresa, ACodCaixa));

      LQrySuprimentos.Active := true;
      LQrySuprimentos.FetchAll;
      LQrySuprimentos.first;

      if (LQrySuprimentos.IsEmpty = false) then
      begin
        ARelatorio.add('</linha_simples>');
        ARelatorio.add('<e></ce><n><in>SUPRIMENTOS EFETUADOS</in></N>');
        ARelatorio.add('</linha_simples>');
        LHoraSuprimento := PadRightA('Hora', 10, ' ');
        LValorSuprimento := PadLeftA('Valor', 54, ' ');
        LLinha := LHoraSuprimento + LValorSuprimento;
        ARelatorio.add('</fn></ae><c><n>' + LLinha);
        ARelatorio.add('</linha_simples>');

        LTotalSuprimentos := 0;
        while not LQrySuprimentos.eof do
        begin
          LHoraSuprimento := PadRightA(LQrySuprimentos.FieldByName('hora').AsString, 10, ' ');
          LValorSuprimento := PadLeftA(FormatFloat('R$ ###,###,##0.00', LQrySuprimentos.FieldByName('valor').Value), 54, ' ');
          LLinha := LHoraSuprimento + LValorSuprimento;
          ARelatorio.add('</fn></ae><c>' + LLinha);

          LTotalSuprimentos := LTotalSuprimentos + LQrySuprimentos.FieldByName('valor').Value;
          LQrySuprimentos.Next;
        end;
        ARelatorio.add('</linha_simples>');
        LTotalizador := PadRightA('Total de Suprimentos:', 21, ' ');
        LValorSuprimento := PadLeftA(FormatFloat('R$ ###,###,##0.00', LQrySuprimentos.FieldByName('valor').Value), 43, ' ');
        LLinha := LTotalizador + LValorSuprimento;
        ARelatorio.add('</fn><c><n>' + LLinha + '</c>');
      end;

    except
      on E: Exception do
      begin
        raise Exception.create(e.Message);
      end;

    end;
  finally
    FreeAndNil(ts);
    FreeAndNil(LQrySuprimentos);
  end;
end;

procedure tdm.imprimeSangriasCaixa(ACodEmpresa: string; ACodCaixa: string; ARelatorio: Tstringlist);
var
  ts: TIBTransaction;
  LQrySangrias: TIBQuery;
  LHoraSangria, LNomeUsuarioAutorizou, LValorSangria, LLinha: string;
  LObservacoesSangria: string;
  LTotalSangrias: double;
begin
  ts := TIBTransaction.Create(self);
  ts.DefaultDatabase := dm.dbrestaurante;
  ts.Active := False;
  ts.Active := True;

  LQrySangrias := TIBQuery.Create(Self);
  LQrySangrias.Database := dbrestaurante;
  LQrySangrias.Transaction := ts;
  LQrySangrias.Active := False;

  try
    try
      LQrySangrias.SQL.clear;
      LQrySangrias.Active := False;
      LQrySangrias.SQL.Clear;
      LQrySangrias.sql.Add(getSQLSangriasCaixa(ACodEmpresa, ACodCaixa));

      LQrySangrias.Active := true;
      LQrySangrias.FetchAll;
      LQrySangrias.first;

      if (LQrySangrias.IsEmpty = false) then
      begin
        ARelatorio.add('</linha_simples>');
        ARelatorio.add('<e></ce><n><in>SANGRIAS EFETUADAS</in></N>');
        ARelatorio.add('</linha_simples>');
        LHoraSangria := PadRightA('Hora', 10, ' ');
        LNomeUsuarioAutorizou := PadRightA('Usuario autorizador', 41, ' ');
        LValorSangria := PadLeftA('Valor', 13, ' ');
        LLinha := LHoraSangria + LNomeUsuarioAutorizou + LValorSangria;
        ARelatorio.add('</fn></ae><c><n>' + LLinha);
        LObservacoesSangria := PadCenter('Observações', 64, ' ');
        LLinha := LObservacoesSangria;
        ARelatorio.add('</fn></ae><c><n>' + LLinha);
        ARelatorio.add('</linha_simples>');

        LTotalSangrias := 0;
        while not LQrySangrias.eof do
        begin
          LHoraSangria := PadRightA(LQrySangrias.FieldByName('hora').AsString, 10, ' ');
          LNomeUsuarioAutorizou := PadRightA(LQrySangrias.FieldByName('usuario_autorizacao').AsString, 41, ' ');
          LValorSangria := PadLeftA(FormatFloat('R$ ###,###,##0.00', LQrySangrias.FieldByName('valor').Value), 13, ' ');
          LLinha := LHoraSangria + LNomeUsuarioAutorizou + LValorSangria;
          ARelatorio.add('</fn></ae><c>' + LLinha);

          if (trim(LQrySangrias.FieldByName('obs').Value) <> '') then
          begin
            LObservacoesSangria := PadRightA(LQrySangrias.FieldByName('obs').AsString, 64, ' ');
            LLinha := LObservacoesSangria;
            ARelatorio.add('</fn></ae><c>' + LLinha);
          end;

          LTotalSangrias := LTotalSangrias + LQrySangrias.FieldByName('valor').Value;
          ARelatorio.add('</linha_simples>');
          LQrySangrias.Next;
        end;

        LNomeUsuarioAutorizou := PadRightA('Total de sangrias:', 18, ' ');
        LValorSangria := PadLeftA(FormatFloat('R$ ###,###,##0.00', LTotalSangrias), 46, ' ');
        LLinha := LNomeUsuarioAutorizou + LValorSangria;
        ARelatorio.add('</fn><c><n>' + LLinha + '</c>');
      end;

    except
      on E: Exception do
      begin
        raise Exception.create(e.Message);
      end;

    end;
  finally
    FreeAndNil(ts);
    FreeAndNil(LQrySangrias);
  end;
end;

procedure tdm.imprimeProdutosVendidosCaixa(ACodEmpresa: string; ACodCaixa: string; ADataCaixa: TDate; ARelatorio: Tstringlist);
var
  ts: TIBTransaction;
  LQryProdutosVendidos: TIBQuery;
  LCodProduto, LNomeProduto, LDescricaoProduto, LLinha: string;
  LQtdDelivery, LQtdMesas, LQtdBalcao: string;
  LTotalDelivery, LTotalMesas, LTotalBalcao: string;
  LGrupoAtual, LGrupoAnterior: string;
begin
  ts := TIBTransaction.Create(self);
  ts.DefaultDatabase := dm.dbrestaurante;
  ts.Active := False;
  ts.Active := True;

  LQryProdutosVendidos := TIBQuery.Create(Self);
  LQryProdutosVendidos.Database := dbrestaurante;
  LQryProdutosVendidos.Transaction := ts;
  LQryProdutosVendidos.Active := False;

  try
    try
      LQryProdutosVendidos.SQL.clear;
      LQryProdutosVendidos.Active := False;
      LQryProdutosVendidos.SQL.Clear;
      LQryProdutosVendidos.sql.Add(getSQLProdutosVendidosCaixa(ACodEmpresa, ACodCaixa, ADataCaixa));

      LQryProdutosVendidos.Active := true;
      LQryProdutosVendidos.FetchAll;
      LQryProdutosVendidos.first;

      if (LQryProdutosVendidos.IsEmpty = false) then
      begin

        ARelatorio.add('</linha_simples>');
        ARelatorio.add('<e></ce><n><in>PRODUTOS VENDIDOS</in></N>');
        ARelatorio.add('</linha_simples>');
        LNomeProduto := PadRightA('Código', 15, ' ');
        LDescricaoProduto := PadRightA('Descrição do produto', 49, ' ');
        LLinha := LNomeProduto + LDescricaoProduto;
        ARelatorio.add('</fn></ae><c><n>' + LLinha);
        LNomeProduto := PadCenter('Quantidades', 30, ' ');
        LDescricaoProduto := PadCenter('Totais(R$)', 30, ' ');
        LLinha := LNomeProduto + '    ' + LDescricaoProduto;
        ARelatorio.add('</fn></ae><c><n>' + LLinha);
        LQtdMesas := PadLeftA('Mesas', 10, ' ');
        LQtdBalcao := PadLeftA('Balcão', 10, ' ');
        LQtdDelivery := PadLeftA('Delivery', 10, ' ');
        LTotalMesas := PadLeftA('Mesas', 10, ' ');
        LTotalBalcao := PadLeftA('Balcão', 10, ' ');
        LTotalDelivery := PadLeftA('Delivery', 10, ' ');
        LLinha := LQtdMesas + LQtdBalcao + LQtdDelivery + '    ' + LTotalMesas + LTotalBalcao + LTotalDelivery;
        ARelatorio.add('</fn></ae><c><n>' + LLinha);

        ARelatorio.add('</linha_simples>');
        LGrupoAnterior := '';

        while not LQryProdutosVendidos.eof do
        begin
          if LGrupoAnterior <> trim(LQryProdutosVendidos.FieldByName('grupo').AsString) then
          begin
            LGrupoAnterior := LQryProdutosVendidos.FieldByName('grupo').AsString;
            ARelatorio.add('</fn><in></ae>' + LGrupoAnterior + '</in></N>');
          end;
          LNomeProduto := PadRightA(LQryProdutosVendidos.FieldByName('cod_produto').AsString, 15, ' ');
          LDescricaoProduto := PadRightA(LQryProdutosVendidos.FieldByName('descricao').AsString, 49, ' ');
          LLinha := LNomeProduto + LDescricaoProduto;
          ARelatorio.add('</fn></ae><c>' + LLinha);
          LQtdMesas := PadLeftA(FormatNumberStr(LQryProdutosVendidos.FieldByName('qtdmesa').Value), 10, ' ');
          LQtdBalcao := PadLeftA(FormatNumberStr(LQryProdutosVendidos.FieldByName('qtdbalcao').Value), 10, ' ');
          LQtdDelivery := PadLeftA(FormatNumberStr(LQryProdutosVendidos.FieldByName('qtdDelivery').Value), 10, ' ');

          LTotalMesas := PadLeftA(FormatFloat('###,###,##0.00', LQryProdutosVendidos.FieldByName('totalmesa').Value), 10, ' ');
          LTotalBalcao := PadLeftA(FormatFloat('###,###,##0.00', LQryProdutosVendidos.FieldByName('totalbalcao').Value), 10, ' ');
          LTotalDelivery := PadLeftA(FormatFloat('###,###,##0.00', LQryProdutosVendidos.FieldByName('totaldelivery').Value), 10, ' ');
          LLinha := LQtdMesas + LQtdBalcao + LQtdDelivery + '    ' + LTotalMesas + LTotalBalcao + LTotalDelivery;
          ARelatorio.add('</fn></ae><c>' + LLinha + '</c>');

          LQryProdutosVendidos.Next;
        end;
        ARelatorio.add('</linha_simples>');
      end;

    except
      on E: Exception do
      begin
        raise Exception.create(e.Message);
      end;

    end;
  finally
    FreeAndNil(ts);
    FreeAndNil(LQryProdutosVendidos);
  end;
end;

procedure Tdm.imprimeComprovanteSangria(marca: Integer; codSangria: string);
var
  str: string;
  ct: Integer;
  frmVazio: Tfrm_modelo_vazio;
  q: TIBQuery;
  vias: SmallInt;
begin

  if FileExists(caminhoArquivoExtrato) then
    DeleteFile(caminhoArquivoExtrato);
  if FileExists(caminhoArquivoExtrato) then
    DeleteFile(caminhoArquivoExtrato);
  q := TIBQuery.Create(self);
  q.Database := dm.dbrestaurante;
  q.Transaction := dm.transacao;
  q.active := False;
  q.SQL.clear;
  q.sql.add('select s.valor, s.codigo, s.codigo_tipo,s.cod_caixa,');
  q.sql.add('       s.cod_forma,f.descricao as descricao_forma,s.obs,s.cod_usuario_autorizou,s.nome_usuario_autorizou');
  q.sql.add('  from sangrias s');
  q.sql.add('  inner join formas_pagamento f on (f.cod_forma = s.cod_forma)');
  q.sql.add('  where s.codigo=' + QuotedStr(codSangria));
  q.Active := True;

  Application.CreateForm(Tfrm_modelo_vazio, frmVazio);
  for vias := 1 to qtdViasSangria do
  begin
    if FileExists(caminhoArquivoExtrato) then
      DeleteFile(caminhoArquivoExtrato);
    imprimeLinhaECF(marca, dm.centralizar(nome_fantasia, qtdColunasExpandidoECF), True, False, False, True, False, True, False);
    imprimeLinhaECF(marca, ' ', False, False, False, False, False, False, False);
    imprimeLinhaECF(marca, linhaExtrato, False, False, False, False, False, False, False);
    imprimeLinhaECF(marca, dm.centralizar('SANGRIA DE CAIXA', qtdColunasExpandidoECF), True, False, False, True, False, True, False);
    imprimeLinhaECF(marca, dm.centralizar('VIA ' + IntToStr(vias), qtdColunasExpandidoECF), True, False, False, True, False, True, False);
    imprimeLinhaECF(marca, dm.centralizar(FormatDateTime('DD/MM/YY', frmVazio.getDataSistemaCaixa(q.FieldByName('cod_caixa').Value)), qtdColunasExpandidoECF), True, False, False, True, False, True, False);
    imprimeLinhaECF(marca, '', True, False, False, False, True, False, False);
    str := 'Cod. Caixa.........: ' + q.FieldByName('cod_caixa').Value;
    imprimeLinhaECF(marca, str, True, False, False, False, True, False, False);
    str := 'Cod. Sangria.......: ' + q.FieldByName('codigo').Value;
    imprimeLinhaECF(marca, str, True, False, False, False, True, False, False);
    str := 'Operador...........: ' + frmVazio.getNomeOperadorCaixa(q.FieldByName('cod_caixa').Value);
    imprimeLinhaECF(marca, str, True, False, False, False, True, False, False);
    str := 'Hora...............: ' + FormatDateTime('HH:MM:SS', Time);
    imprimeLinhaECF(marca, str, True, False, False, False, True, False, False);
    str := 'Valor...............: ' + FormatFloat('R$ ###,###,##0.00', q.FieldByName('valor').Value);
    imprimeLinhaECF(marca, str, True, False, False, False, True, False, False);
    str := 'Forma de Pagto......: ' + q.FieldByName('descricao_forma').Value;
    imprimeLinhaECF(marca, str, True, False, False, False, True, False, False);

    if (Trim(q.FieldByName('obs').Value) <> '') then
    begin
      imprimeLinhaECF(marca, 'Observacoes:', False, False, False, False, False, False, False);
      frm_principal.memoObsMiniprinter.Lines.Clear;
      frm_principal.memoObsMiniprinter.Lines.add(q.FieldByName('obs').Value);
      for ct := 0 to frm_principal.memoObsMiniprinter.Lines.Count do
      begin
        imprimeLinhaECF(marca, frm_principal.memoObsMiniprinter.Lines[ct], True, False, False, False, True, False, False);
      end;
    end;

    imprimeLinhaECF(marca, dm.centralizar('------------------------------', qtdColunasNormalECF), False, False, False, False, False, False, False);
    imprimeLinhaECF(marca, dm.centralizar('AUTORIZADA POR:  ' + q.FieldByName('nome_usuario_autorizou').Value, qtdColunasNormalECF), False, False, False, False, False, False, False);

    imprimeLinhaECF(marca, linhaExtrato, False, False, False, False, False, False, False);
    imprimeLinhaECF(marca, '', False, False, False, False, False, False, False);
    imprimeLinhaECF(marca, '', False, False, False, False, False, False, False);
    imprimeLinhaECF(marca, dm.centralizar('------------------------------', qtdColunasNormalECF), False, False, False, False, False, False, False);
    imprimeLinhaECF(marca, dm.centralizar('Assinatura do Operador', qtdColunasNormalECF), False, False, False, False, False, False, False);

    imprimeLinhaECF(marca, '', False, False, False, False, False, False, False);
    imprimeLinhaECF(marca, '', False, False, False, False, False, False, False);

    imprimeLinhaECF(marca, dm.centralizar('------------------------------', qtdColunasNormalECF), False, False, False, False, False, False, False);
    imprimeLinhaECF(marca, dm.centralizar('Assinatura do Recebedor', qtdColunasNormalECF), False, False, False, False, False, False, False);
    imprimeLinhaECF(marca, linhaExtrato, False, False, False, False, False, False, False);
    imprimeLinhaECF(marca, '', False, False, False, False, False, False, False);
    imprimeLinhaECF(marca, '', False, False, False, False, False, False, False);
    imprimeLinhaECF(marca, linhaExtrato, False, False, False, False, False, False, False);

    for ct := 0 to StrToInt(dm.LeIni(2, 'extrato', 'linhasFinalExtrato')) do
    begin
      imprimeLinhaECF(marca, '                     ', False, False, False, False, False, False, False);
    end;
    frm_principal.memo_avisos.Lines.LoadFromFile(caminhoArquivoExtrato);
    imprimeTextoMiniPrinter(frm_principal.memo_avisos.Lines.Text);

  end;

  FreeAndNil(q);
  FreeAndNil(frmVazio);
end;

procedure Tdm.imprimeComprovanteRecebimentoParcial(marca: Integer; AMesa: string);
var
  str: string;
  ct: Integer;
  frmVazio: Tfrm_modelo_vazio;
  q: TIBQuery;
  totalRecebimentos: Double;
begin

  if FileExists(caminhoArquivoExtrato) then
    DeleteFile(caminhoArquivoExtrato);
  if FileExists(caminhoArquivoExtrato) then
    DeleteFile(caminhoArquivoExtrato);
  q := TIBQuery.Create(self);
  q.Database := dm.dbrestaurante;
  q.Transaction := dm.transacao;

  Application.CreateForm(Tfrm_modelo_vazio, frmVazio);
  imprimeLinhaECF(marca, dm.centralizar(nome_fantasia, qtdColunasExpandidoECF), True, False, False, True, False, True, False);
  imprimeLinhaECF(marca, ' ', False, False, False, False, False, False, False);
  imprimeLinhaECF(marca, linhaExtrato, False, False, False, False, False, False, False);
  imprimeLinhaECF(marca, dm.centralizar('RECEBIMENTOS PARCIAIS', qtdColunasExpandidoECF), True, False, False, True, False, True, False);
  imprimeLinhaECF(marca, dm.centralizar('Mesa: ' + AMesa, qtdColunasExpandidoECF), True, False, False, True, False, True, False);
  imprimeLinhaECF(marca, dm.centralizar(FormatDateTime('DD/MM/YY', data_do_sistema), qtdColunasExpandidoECF), True, False, False, True, False, True, False);
  imprimeLinhaECF(marca, '', True, False, False, False, True, False, False);
  str := 'Cod. Caixa.........: ' + ultimoCaixaAberto;
  imprimeLinhaECF(marca, str, True, False, False, False, True, False, False);
  str := 'Operador...........: ' + nome_usuario;
  imprimeLinhaECF(marca, str, True, False, False, False, True, False, False);
  str := 'Hora...............: ' + FormatDateTime('HH:MM:SS', Time);
  imprimeLinhaECF(marca, str, True, False, False, False, True, False, False);

  str := '#########################*******************';
  str := dm.organizarCupom(str, 'Forma', '#');
  str := dm.organizarCupom(str, 'Operador', '%');
  str := dm.organizarCupom(str, 'Valor', '*');
  imprimeLinhaECF(marca, Trim(str), True, False, False, False, True, False, False);
  imprimeLinhaECF(marca, linhaExtrato, False, False, False, False, False, False, False);

  q.active := False;
  q.SQL.clear;
  q.sql.add('select r.*,f.descricao from recebimento_parcial r inner join formas_pagamento f on (f.cod_forma = r.cod_forma) where r.mesa=' + QuotedStr(AMesa));
  q.Active := True;
  q.first;

  totalRecebimentos := 0;
  while not q.eof do
  begin
    str := '#########################*******************';
    str := dm.organizarCupom(str, q.fieldbyname('descricao').Value, '#');
    str := dm.organizarCupom(str, FormatFloat('R$ ###,###,##0.00', q.fieldbyname('valor').Value), '*');
    totalRecebimentos := totalRecebimentos + q.fieldbyname('valor').Value;
    imprimeLinhaECF(marca, Trim(str), False, False, False, False, True, False, False);
    q.Next;
  end;

  imprimeLinhaECF(marca, linhaExtrato, False, False, False, False, False, False, False);
  imprimeLinhaECF(marca, '', False, False, False, False, False, False, False);
  imprimeLinhaECF(marca, '', False, False, False, False, False, False, False);

  imprimeLinhaECF(marca, dm.centralizar('Assinatura do Operador', qtdColunasNormalECF), False, False, False, False, False, False, False);
  imprimeLinhaECF(marca, linhaExtrato, False, False, False, False, False, False, False);

  for ct := 0 to StrToInt(dm.LeIni(2, 'extrato', 'linhasFinalExtrato')) do
  begin
    imprimeLinhaECF(marca, '                     ', False, False, False, False, False, False, False);
  end;

  frm_principal.memo_avisos.Lines.LoadFromFile(caminhoArquivoExtrato);
  imprimeTextoMiniPrinter(frm_principal.memo_avisos.Lines.Text);

  FreeAndNil(q);
  FreeAndNil(frmVazio);
end;
//
//procedure Tdm.imprimeEstornosCaixa(marca: Integer; numeroCaixa: string);
//var
//  str: string;
//  ct: Integer;
//  frmVazio: Tfrm_modelo_vazio;
//  q: TIBQuery;
//  diferenca: string;
//  qtdEstornos: Integer;
//begin
//  q := TIBQuery.create(self);
//  q.Database := dm.dbrestaurante;
//  q.Transaction := dm.transacao;
//  q.Active := False;
//  q.SQL.Clear;
//  q.SQL.add(' select es.*,(es.quantidade * es.valor_unitario) as total, c.nome_usuario');
//  q.SQL.add('  from estornos es');
//  q.SQL.add('    inner join caixas c on (c.codigo = es.cod_caixa)');
//  q.sql.add('    where es.cod_caixa=' + QuotedStr(numeroCaixa));
//  q.SQL.add('    order by es.mesa,es.hora');
//  q.active := True;
//  q.first;
//
//  if q.IsEmpty = False then
//  begin
//    qtdEstornos := 0;
//    imprimeLinhaECF(marca, '', True, False, False, False, True, False, False);
//    imprimeLinhaECF(marca, '', True, False, False, False, True, False, False);
//    imprimeLinhaECF(marca, linhaExtrato, False, False, False, False, False, False, False);
//    imprimeLinhaECF(marca, dm.centralizar('ESTORNOS', qtdColunasExpandidoECF), True, False, False, True, False, True, False);
//    imprimeLinhaECF(marca, linhaExtrato, False, False, False, False, False, False, False);
//    str := '#######@@@@@@@$$$$$$$%%%%%%%%!!!!!!!!!!!!';
//    str := dm.organizarCupom(str, 'Cod.', '#');
//    str := dm.organizarCupom(str, 'Mesa.', '@');
//    str := dm.organizarCupom(str, 'Prod.', '$');
//    str := dm.organizarCupom(str, 'Qtde', '%');
//    str := dm.organizarCupom(str, 'Total', '!');
//    imprimeLinhaECF(marca, str, False, False, False, False, True, False, False);
//    imprimeLinhaECF(marca, linhaExtrato, False, False, False, False, False, False, False);
//
//    while not q.Eof do
//    begin
//      str := '#######@@@@@@@$$$$$$$%%%%%%%%%%!!!!!!!!!!!';
//      str := dm.organizarCupom(str, q.fieldbyname('codigo').Value, '#');
//      str := dm.organizarCupom(str, q.fieldbyname('MESA').Value, '@');
//      str := dm.organizarCupom(str, q.fieldbyname('cod_produto').Value, '$');
//      str := dm.organizarCupom(str, FormatFloat('###,###,##0.000', q.fieldbyname('quantidade').Value), '%');
//      str := dm.organizarCupom(str, FormatFloat('R$ ###,###,##0.00', q.fieldbyname('total').Value), '!');
//      imprimeLinhaECF(marca, Trim(str), False, False, False, False, False, False, False);
//      qtdEstornos := qtdEstornos + 1;
//      q.next;
//    end;
//    q.Active := False;
//    q.SQL.Clear;
//    q.SQL.add(' select sum (es.quantidade * es.valor_unitario) as total');
//    q.SQL.add('  from estornos es');
//    q.sql.add('    where es.cod_caixa=' + QuotedStr(numeroCaixa));
//    q.active := True;
//
//    imprimeLinhaECF(marca, '', False, False, False, False, False, False, False);
//    imprimeLinhaECF(marca, 'Qtd.  de Estornos: ' + IntToStr(qtdEstornos), True, False, False, False, False, False, False);
//    imprimeLinhaECF(marca, 'Total de Estornos: ' + FormatFloat('R$ ###,###,##0.00', q.fieldbyname('total').Value), True, False, False, False, False, False, False);
//  end;
//  FreeAndNil(q);
//  FreeAndNil(frmVazio);
//end;

procedure Tdm.imprimeResumoDoDia(marca: Integer; dataSistema: TDate);
var
  str: string;
  ct: Integer;
  frmVazio: Tfrm_modelo_vazio;
  q: TIBQuery;
  diferenca: string;
begin
  str := '#############$$$$$$$$$%%%%%%%%%%************';
  str := dm.organizarCupom(str, 'Forma', '#');
  str := dm.organizarCupom(str, 'Sistema', '$');
  str := dm.organizarCupom(str, 'Operador', '%');
  str := dm.organizarCupom(str, 'Dif.', '*');
  imprimeLinhaECF(marca, Trim(str), True, False, False, False, True, False, False);
  imprimeLinhaECF(marca, linhaExtrato, False, False, False, False, False, False, False);
  q := TIBQuery.create(self);
  q.Database := dm.dbrestaurante;
  q.Transaction := dm.transacao;

  q.Active := False;
  q.sql.clear;
  q.SQL.add('   select fp.cod_forma, fp.descricao, sum(r.valor) as total_forma   from recebimentos r ');
  q.SQL.add('  inner join formas_pagamento fp on (fp.cod_forma = r.cod_forma)');
//  q.SQL.add('  where r.data='10.09.2015'');
  q.SQL.add('  group by fp.cod_forma, fp.descricao');
  q.Active := True;

  while not q.eof do
  begin
    str := '#########################$$$$$$$$$%%%%%%%%%%';
    str := dm.organizarCupom(str, q.fieldbyname('descricao').Value, '#');
    str := dm.organizarCupom(str, FormatFloat('###,###,##0.00', q.fieldbyname('total_forma').Value), '$');
    str := dm.organizarCupom(str, '', '%');
    imprimeLinhaECF(marca, Trim(str), False, False, False, False, True, False, False);
    q.Next;
  end;
  imprimeLinhaECF(marca, linhaExtrato, False, False, False, False, False, False, False);

  q.Active := False;
  q.sql.clear;
  q.sql.add('select sum(total_sistema)as total_entradas,sum(diferenca) as total_diferenca,sum(apenas_vendas) as total_vendas, sum(total_sistema) as total_sistema, sum(total_suprimentos) as total_suprimentos,');
  q.sql.add(' sum(total_sangrias) as total_sangrias,sum(total_penduras) as total_penduras ');
  q.sql.Add(' from apuracao_caixa where cod_caixa=' + QuotedStr('00025'));
  q.active := True;

//  frm_principal.memo_avisos.Visible := true;
  frm_principal.memo_avisos.Lines := q.SQL;

  str := '###########$$$$$$$$$$$$%%%%%%%************';
  str := dm.organizarCupom(str, 'Totais: ', '#');
  str := dm.organizarCupom(str, FormatFloat('###,###,##0.00', q.fieldbyname('total_entradas').Value), '$');
  str := dm.organizarCupom(str, FormatFloat('###,###,##0.00', 0), '%');

  if q.fieldbyname('total_diferenca').Value > 0 then
    diferenca := '+' + FormatFloat('###,###,##0.00', q.fieldbyname('total_diferenca').Value)
  else
    diferenca := FormatFloat('###,###,##0.00', q.fieldbyname('total_diferenca').Value);

  str := dm.organizarCupom(str, diferenca, '*');
  imprimeLinhaECF(marca, (str), True, False, False, False, True, False, False);
  imprimeLinhaECF(marca, '', True, False, False, False, True, False, False);
  str := 'Suprimentos............: ' + FormatFloat('R$ ###,###,##0.00', q.fieldbyname('total_suprimentos').Value);
  imprimeLinhaECF(marca, (str), True, False, False, False, True, False, False);
  str := 'Sangrias...............: ' + FormatFloat('R$ ###,###,##0.00', q.fieldbyname('total_sangrias').Value);
  imprimeLinhaECF(marca, (str), True, False, False, False, True, False, False);
  str := 'Penduras Recebidas.....: ' + FormatFloat('R$ ###,###,##0.00', q.fieldbyname('total_penduras').Value);
  imprimeLinhaECF(marca, (str), True, False, False, False, True, False, False);

  str := 'Vendas (Com Tx. Serv.).: ' + FormatFloat('R$ ###,###,##0.00', q.fieldbyname('total_vendas').Value);
  imprimeLinhaECF(marca, (str), True, False, False, False, True, False, False);
//  str:='Vendas (Sem Tx. Serv.).: '+formatFloat('R$ ###,###,##0.00',q.fieldbyname('total_vendas').value - frmVazio.getTotalTaxaServicoCaixa(numeroCaixa) );
  imprimeLinhaECF(marca, (str), True, False, False, False, True, False, False);
  imprimeLinhaECF(marca, linhaExtrato, False, False, False, False, False, False, False);
  str := 'Saldo em caixa.........: ' + FormatFloat('R$ ###,###,##0.00', q.fieldbyname('total_entradas').Value);
  imprimeLinhaECF(marca, (str), True, False, False, False, True, False, False);
//  str:='Taxa de Servico........: '+formatFloat('R$ ###,###,##0.00',frmVazio.getTotalTaxaServicoCaixa(numeroCaixa) );
  imprimeLinhaECF(marca, (str), True, False, False, False, True, False, False);
  imprimeLinhaECF(marca, linhaExtrato, False, False, False, False, False, False, False);


  {
  // Pega os descontos efetuados por este operador...

  q.Active:=false;
  q.sql.clear;
  q.sql.add('select * from vendas where valor_desconto >0 and  cod_caixa='+QUotedstr(numeroCaixa)+' order by cod_venda');
  q.Active:=true;

  if q.IsEmpty = false then
   begin
     imprimeLinhaECF(marca,'',true,false,false,false,true,false,false);
     imprimeLinhaECF(marca,'DESCONTOS EFETUADOS',true,false,false,false,false,false,false);
     imprimeLinhaECF(marca,linhaExtrato,false,false,false,false,false,false,false);
     str:='#######$$$$$$$$%%%%%%%%%%%%***************';
     str:=dm.organizarCupom(str,'Mesa','#');
     str:=dm.organizarCupom(str,'Hora','$');
     str:=dm.organizarCupom(str,'Total','%');
     str:=dm.organizarCupom(str,'Desconto','*');
     imprimeLinhaECF(marca,trim(str),true,false,false,false,true,false,false);
     imprimeLinhaECF(marca,linhaExtrato,false,false,false,false,false,false,false);
     while not q.Eof do
     begin
       str:='#######$$$$$$$$%%%%%%%%%%%%%%***************';
       str:=dm.organizarCupom(str,q.fieldbyname('mesa').value,'#');
       str:=dm.organizarCupom(str,formatDateTime('HH:MM',q.fieldbyname('hora').value),'$');
       str:=dm.organizarCupom(str,formatFloat('R$ ###,###,##0.00',q.fieldbyname('valor_total').value ),'%');
       str:=dm.organizarCupom(str,formatFloat('R$ ###,###,##0.00',q.fieldbyname('valor_desconto').value ),'*');
       str:=dm.organizarCupom(str,diferenca,'*');
       imprimeLinhaECF(marca,trim(str),false,false,false,false,true,false,false);
       q.Next;
     end;
   end;

   }

  q.Active := False;
  FreeAndNil(q);

  FreeAndNil(frmVazio);
end;

procedure Tdm.ImprimeVendasPorGarconAbriuMesa(marca: Integer; numeroCaixa: string);
var
  str: string;
  ct: Integer;
  frmVazio: Tfrm_modelo_vazio;
  q: TIBQuery;
  diferenca: string;
  totalServico, totalVendas, totalServicoCasa, totalServicoFuncionarios: Double;
  totalOutrasComisssoes: Double;
  totalGeral: Double;
  percServicoGarcon, percServicoCasa, percServicoFuncionarios: Double;
begin

  percServicoGarcon := dm.tb_parametrosPERCENTUAL_SERVICO_GARCOM.Value / 100;
  percServicoCasa := dm.tb_parametrosPERCENTUAL_SERVICO_CASA.Value / 100;
  percServicoFuncionarios := dm.tb_parametrosPERCENTUAL_SERVICO_FUNCIONARIOS.Value / 100;

  totalServico := 0;
  totalServicoCasa := 0;
  totalServicoFuncionarios := 0;

  q := TIBQuery.create(self);
  q.Database := dm.dbrestaurante;
  q.Transaction := dm.transacao;

  q.Active := False;
  q.SQL.Clear;
  q.SQL.add('select v.cod_garcon_abriu, g.apelido as nome,   count(*) as ct, ');
  q.SQL.add('     sum(v.valor_total) as total, ');
  q.SQL.add('     sum(v.valor_txserv) as totalServico, ');
  q.SQL.add('      ( sum(v.valor_txserv) * ' + dm.TrocaVirgPPto(FloatToStr(percServicoGarcon)) + ') as totalGarcon, ');
  q.SQL.add('      ( sum(v.valor_txserv) * ' + dm.TrocaVirgPPto(FloatToStr(percServicoCasa)) + ') as totalCasa, ');
  q.SQL.add('      ( sum(v.valor_txserv) * ' + dm.TrocaVirgPPto(FloatToStr(percServicoFuncionarios)) + ') as totalFuncionarios ');
  q.SQL.add('      from vendas v ');
  q.SQL.add('   inner join garcons g on (g.cod_garcon = v.cod_garcon_abriu) ');
  q.SQL.add('   where cod_caixa=' + QuotedStr(numeroCaixa));
  q.SQL.add('   group by v.cod_garcon_abriu, g.apelido  ');
  ////////dm.adicionalog(q.SQL.Text);

  q.active := True;

  if not q.IsEmpty then
  begin
    imprimeLinhaECF(marca, '', True, False, False, False, True, False, False);
    imprimeLinhaECF(marca, '', True, False, False, False, True, False, False);
    imprimeLinhaECF(marca, linhaExtrato, False, False, False, False, False, False, False);
    imprimeLinhaECF(marca, dm.centralizar('VENDAS POR GARÇOM', qtdColunasExpandidoECF), True, False, False, True, False, True, False);
    imprimeLinhaECF(marca, linhaExtrato, False, False, False, False, False, False, False);
    imprimeLinhaECF(marca, linhaExtrato, False, False, False, False, False, False, False);

    q.First;

    while not q.eof do
    begin
      str := '############################################';
      str := dm.organizarCupom(str, q.FieldByName('nome').Value, '#');
      imprimeLinhaECF(marca, Trim(str), True, False, False, False, True, False, False);

      str := '############################################';
      str := dm.organizarCupom(str, '  Qtd.  de Vendas: ' + IntToStr(q.FieldByName('ct').Value), '#');
      imprimeLinhaECF(marca, (str), False, False, False, False, True, False, False);

      str := '############################################';
      str := dm.organizarCupom(str, '  Total de Vendas: ' + FormatFloat('###,###,##0.00', q.fieldbyname('total').Value), '#');
      imprimeLinhaECF(marca, (str), False, False, False, False, True, False, False);

      str := '############################################';
      str := dm.organizarCupom(str, '  Total de Serviço    : ' + FormatFloat('###,###,##0.00', q.fieldbyname('totalServico').Value), '#');
      imprimeLinhaECF(marca, (str), False, False, False, False, True, False, False);

      str := '############################################';
      str := dm.organizarCupom(str, '  Serviço do Garçon-' + FloatToStr(percServicoGarcon) + '%: ' + FormatFloat('###,###,##0.00', q.fieldbyname('totalGarcon').Value), '#');
      imprimeLinhaECF(marca, (str), False, False, False, False, True, False, False);

      totalServico := totalServico + q.fieldbyname('totalServico').Value;
      totalServicoCasa := totalServicoCasa + q.fieldbyname('totalCasa').Value;
      totalServicoFuncionarios := totalServicoFuncionarios + q.fieldbyname('totalFuncionarios').Value;

      q.Next;
    end;
  end;
  imprimeLinhaECF(marca, linhaExtrato, False, False, False, False, False, False, False);

  if totalServicoCasa > 0 then
  begin
    str := '############################################';
    str := dm.organizarCupom(str, 'Serviço da casa   : ' + FormatFloat('###,###,##0.00', totalServicoCasa), '#');
    imprimeLinhaECF(marca, Trim(str), True, False, False, False, True, False, False);
  end;

  if totalServicoFuncionarios > 0 then
  begin
    str := '############################################';
    str := dm.organizarCupom(str, 'Serviço funcionarios : ' + FormatFloat('###,###,##0.00', totalServicoFuncionarios), '#');
    imprimeLinhaECF(marca, Trim(str), True, False, False, False, True, False, False);
  end;

  imprimeLinhaECF(marca, linhaExtrato, False, False, False, False, False, False, False);

end;

function Tdm.imprimeMovimentoContaECF(marca: Integer; AMesa: string; codVenda: string): string;
var
  str: WideString;
  quantidade: string;
  tamStr: Integer;
  LQryConsulta: TIBQuery;
  descricaoProduto: string;
  Ltransacao: TIBTransaction;
begin
  Ltransacao := TIBTransaction.Create(nil);
  Ltransacao.Params.Add('read_committed');
  Ltransacao.Params.Add('rec_version');
  Ltransacao.Params.Add('nowait');

  Ltransacao.DefaultDatabase := dm.dbrestaurante;
  Ltransacao.Active := False;
  Ltransacao.Active := True;
  LQryConsulta := TIBQuery.Create(nil);
  LQryConsulta.Database := dm.dbrestaurante;
  LQryConsulta.Transaction := Ltransacao;

  try

    if (Trim(codVenda) = '') then
    begin
      LQryConsulta.SQL.add(' select mv.*,  udf_roundabnt((mv.valor_unitario * mv.qtde ),2) as total from ( select  vm.cod_produto, p.cod_barras, sum(vm.quantidade)   as qtde, vm.valor_unitario,p.descricao,vm.cancelado, vm.sabores ');
      LQryConsulta.SQL.add('   from movimento_mesa vm ');
      LQryConsulta.SQL.add('       inner join produtos p on (p.cod_produto = vm.cod_produto) ');
      LQryConsulta.SQL.add('    where vm.cod_mesa =' + QuotedStr(AMesa) + ' and vm.valor_unitario >= 0 ');
      LQryConsulta.SQL.add('         group by vm.cod_produto,p.cod_barras, p.descricao,vm.cancelado,vm.valor_unitario,vm.sabores,total ');
      LQryConsulta.SQL.add('          order by cancelado,cod_barras asc) mv ');
      adicionaLog(LQryConsulta.SQL.Text);
      LQryConsulta.Active := True;
      LQryConsulta.FetchAll;
    end
    else
    begin
      LQryConsulta.SQL.add(' select mv.*,  udf_roundabnt((mv.valor_unitario * mv.qtde ),2) as total,' + QuotedStr('') + ' as sabores ');
      LQryConsulta.SQL.add(' from ( select  vm.cod_produto, p.cod_barras, sum(vm.quantidade)   as qtde,');
      LQryConsulta.SQL.add('  vm.valor_unitario,p.descricao');
      LQryConsulta.SQL.add('    from movimento_venda   vm ');
      LQryConsulta.SQL.add('        inner join produtos p on (p.cod_produto = vm.cod_produto) ');
      LQryConsulta.SQL.add('     where vm.cod_venda=' + QuotedStr(codVenda));
      LQryConsulta.SQL.add('          group by vm.cod_produto,p.cod_barras, p.descricao,vm.valor_unitario');
      LQryConsulta.SQL.add('           order by cod_barras asc) mv');
      adicionaLog(LQryConsulta.SQL.Text);
      LQryConsulta.Active := True;
      LQryConsulta.FetchAll;

    end;

    if LQryConsulta.IsEmpty then
    begin
      ////dm.adicionalog('Sem movimento na conta informada!');
    end
    else
    begin
      ////dm.adicionalog('Existia movimento para impressão dos ítens');
    end;

    while not LQryConsulta.Eof do
    begin
      descricaoProduto := LQryConsulta.fieldbyname('descricao').Value;

      try
        quantidade := IntToStr(StrToInt(FloatToStr(LQryConsulta.fieldbyname('qtde').Value)));
      except
        begin
          quantidade := FormatFloat('###,###,##0.000', (LQryConsulta.fieldbyname('qtde').Value));
        end;
      end;

      if layoutExtrato = 1 then
      begin
        str := formatoCabecalhoExtrato;
        str := dm.organizarCupom(str, quantidade, '#');
        str := dm.organizarCupom(str, Copy(descricaoProduto, 0, 25), '*');
        str := Trim(dm.organizarCupom(str, dm.alinha_valor_a_direita(alinhamentoDireitaTotal, FormatFloat('R$ ###,###,##0.000 ', (LQryConsulta.fieldbyname('total').Value))), '%'));
        imprimeLinhaECF(marca, Trim(str), False, False, False, False, True, False, False);
      end
      else
      begin
        str := formatoCabecalhoExtratoLayout2Linha1;
        str := dm.organizarCupom(str, Copy(LQryConsulta.fieldbyname('cod_barras').Value, 0, 6), '#');
        str := dm.organizarCupom(str, Copy(descricaoProduto, 0, 30), '*');
        imprimeLinhaECF(marca, Trim(str), False, False, False, False, False, False, False);

        str := formatoCabecalhoExtratoLayout2Linha2;
        str := dm.organizarCupom(str, quantidade, '#');
        str := dm.organizarCupom(str, 'X', '$');
        str := Trim(dm.organizarCupom(str, FormatFloat('###,###,##0.00 ', (LQryConsulta.fieldbyname('valor_unitario').Value)), '*'));
        str := dm.organizarCupom(str, '', '%');
        tamStr := alinhamentoDireitaTotal - Length(Trim(str));
        str := Trim(str) + dm.alinha_valor_a_direita(tamStr, FormatFloat('R$ ###,###,##0.00 ', (LQryConsulta.fieldbyname('total').Value)));
        imprimeLinhaECF(marca, Trim(str), False, False, False, False, False, False, False);

        if (AMesa = mesaDelivery) then
        begin
          if (LQryConsulta.fieldbyname('sabores').Value <> '') then
          begin
            imprimeLinhaECF(marca, 'Sabores: ', False, False, False, False, False, False, False);
            imprimeLinhaECF(marca, '--', False, False, False, False, False, False, False);
            imprimeLinhaECF(marca, '' + Trim(dm.BuscaTroca(LQryConsulta.fieldbyname('sabores').Value, #10#13, ' , ')), False, False, False, False, False, False, False);
          end;

        end;

      end;
      LQryConsulta.Next;
    end;
  finally
    LQryConsulta.Active := False;
    Ltransacao.Active := False;
    FreeAndNil(LQryConsulta);
    FreeAndNil(Ltransacao);
  end;

end;

function Tdm.imprimeRecebimentosParciaisECF(marca: Integer; AMesa: string): string;
var
  q: TIBQuery;
  formato, str: string;
begin

  q := TIBQuery.create(self);
  q.Database := dm.dbrestaurante;
  q.Transaction := dm.transacao;

  q.Active := False;
  q.SQL.Clear;
  q.SQL.Add('select r.*, f.descricao from recebimento_parcial r ');
  q.sql.add(' inner join formas_pagamento f on (f.cod_forma = r.cod_forma) ');
  q.sql.add(' where r.mesa=' + QuotedStr(AMesa));
  q.Active := True;
  q.First;

  if (q.IsEmpty = False) then
  begin
    imprimeLinhaECF(marca, linhaExtrato, False, False, False, False, False, False, False);
    imprimeLinhaECF(marca, dm.centralizar('PAGAMENTOS PARCIAIS REALIZADOS', qtdColunasNormalECF), True, False, False, False, False, False, False);
    imprimeLinhaECF(marca, '', False, False, False, True, False, False, False);
    while not q.Eof do
    begin

      str := formatoCabecalhoExtrato;
      str := dm.organizarCupom(str, q.fieldbyname('descricao').Value, '#');
      str := dm.organizarCupom(str, '', '*');
      str := dm.organizarCupom(str, dm.alinha_valor_a_direita(alinhamentoDireitaTotal, FormatFloat('R$ ###,###,##0.00 ', (q.fieldbyname('valor').Value))), '%');
      imprimeLinhaECF(marca, Trim(str), False, False, False, False, True, False, False);
      q.Next;
    end;

    str := formatoCabecalhoExtrato;
    imprimeLinhaECF(marca, ' ', False, False, False, False, False, False, False);
    str := dm.organizarCupom(str, 'Total', '#');
    str := dm.organizarCupom(str, '', '*');
    str := dm.organizarCupom(str, dm.alinha_valor_a_direita(alinhamentoDireitaTotal, FormatFloat('R$ ###,###,##0.00 ', (getTotalPagamentosParciais(AMesa)))), '%');
    imprimeLinhaECF(marca, Trim(str), False, False, False, False, False, False, False);

  end;
  q.Active := False;
  FreeAndNil(q);
end;

function Tdm.imprimeRodapeExtratoContaECF(AMesa: string; codVenda: string; marca: Integer; tipo: Integer; nPessoas: Integer; subtotal: Double; couvert: Double; txServico: Double; repique: Double; desconto: Double; totalConta: Double; totalPago: Double; troco: Double; txEtrega: Double): string;
var
  str: string;
  formato: string;
  q: TIBQuery;
  ct: Integer;
  tamStr: Integer;
begin

  q := TIBQuery.create(self);
  q.Database := dbrestaurante;
  q.Transaction := transacao;

  if imprimirTaxaServicoNoExtrato = 0 then
  begin
    totalConta := totalConta - txServico;
    txServico := 0;
  end;

  imprimeLinhaECF(marca, linhaExtrato, False, False, False, False, False, False, False);

  str := formatoLinhaTotalizador;
  str := dm.organizarCupom(str, dm.alinha_valor_a_direita(alinhamentoDireitaTotal, 'Consumo:   ' + FormatFloat('R$ ###,###,##0.00 ', (subtotal))), '%');
  imprimeLinhaECF(marca, str, False, False, False, False, False, False, False);

  if (txServico > 0) and (imprimirTaxaServicoNoExtrato = 1) then
  begin
    str := formatoLinhaTotalizador;
    str := dm.organizarCupom(str, dm.alinha_valor_a_direita(alinhamentoDireitaTotal, dm.LeIni(2, 'extrato', 'descricaoTaxaServico') + ':   ' + FormatFloat('R$ ###,###,##0.00 ', (txServico))), '%');
    imprimeLinhaECF(marca, str, False, False, False, False, False, False, False);
  end;

  str := formatoLinhaTotalizador;
  str := dm.organizarCupom(str, dm.alinha_valor_a_direita(alinhamentoDireitaTotal, '------------'), '%');
  imprimeLinhaECF(marca, str, False, False, False, False, False, False, False);

  str := formatoLinhaTotalizador;
  str := dm.organizarCupom(str, dm.alinha_valor_a_direita(alinhamentoDireitaTotal, 'Subtotal :' + FormatFloat('R$ ###,###,##0.00 ', (subtotal + txServico))), '%');
  imprimeLinhaECF(marca, str, False, False, False, False, False, False, False);

  str := formatoLinhaTotalizador;
  str := dm.organizarCupom(str, dm.alinha_valor_a_direita(alinhamentoDireitaTotal, '--------------------'), '%');
  imprimeLinhaECF(marca, str, False, False, False, False, False, False, False);

  if (couvert > 0) then
  begin

    str := formatoLinhaTotalizador;
    str := dm.organizarCupom(str, dm.alinha_valor_a_direita(alinhamentoDireitaTotal, '+ Couvert:   ' + FormatFloat('R$ ###,###,##0.00 ', (couvert))), '%');
    imprimeLinhaECF(marca, str, False, False, False, False, False, False, False);
  end;

  if (txEtrega > 0) then
  begin
    str := formatoLinhaTotalizador;
    str := dm.organizarCupom(str, dm.alinha_valor_a_direita(alinhamentoDireitaTotal, '+ Tx. de Entrega:  ' + FormatFloat('R$ ###,###,##0.00 ', (txEtrega))), '%');
    imprimeLinhaECF(marca, str, False, False, False, False, False, False, False);
  end;

  if (desconto > 0) then
  begin
    str := formatoLinhaTotalizador;
    str := dm.organizarCupom(str, dm.alinha_valor_a_direita(alinhamentoDireitaTotal, 'Desconto:  ' + FormatFloat('- R$ ###,###,##0.00 ', (desconto))), '%');
    imprimeLinhaECF(marca, str, False, False, False, False, True, False, False);
  end;

  if ((totalPago > 0) and (tipo <> 2)) then
  begin
    str := formatoLinhaTotalizador;
    str := dm.organizarCupom(str, dm.alinha_valor_a_direita(alinhamentoDireitaTotal, 'Ja foi pago:  ' + FormatFloat('- R$ ###,###,##0.00 ', (totalPago))), '%');
    imprimeLinhaECF(marca, str, False, False, False, False, True, False, False);
  end;

  imprimeLinhaECF(marca, linhaExtrato, False, False, False, False, False, False, False);
  if ((totalPago > 0) and (tipo = 1)) then
  begin

    str := formatoLinhaTotalizadorGeral;
    str := dm.organizarCupom(str, 'Total:', '#');
    str := dm.organizarCupom(str, '', '*');
    str := dm.organizarCupom(str, dm.alinha_valor_a_direita(alinhamentoDireitaTotalGeral, FormatFloat('R$ ###,###,##0.00 ', (totalConta))), '%');
    imprimeLinhaECF(marca, Trim(str), True, False, False, True, False, True, False);
  end
  else
  begin
    str := formatoLinhaTotalizadorGeral;

    if totalPago > 0 then
      str := dm.organizarCupom(str, 'Total:', '#')
    else
      str := dm.organizarCupom(str, 'Total:', '#');

    str := dm.organizarCupom(str, '', '*');
    str := dm.organizarCupom(str, dm.alinha_valor_a_direita(alinhamentoDireitaTotalGeral, FormatFloat('R$ ###,###,##0.00 ', (totalConta))), '%');
    imprimeLinhaECF(marca, Trim(str), True, False, False, True, False, True, False);
  end;
  imprimeLinhaECF(marca, ' ', True, False, False, True, False, True, False);

  if ((nPessoas > 1) and (AMesa <> mesaBalcao) and (AMesa <> mesaDelivery)) then
  begin

    str := formatoRodapeExtrato;
    str := dm.organizarCupom(str, 'Qtde de Pessoas...:  ', '#');
    str := dm.organizarCupom(str, '', '*');
    str := dm.organizarCupom(str, IntToStr(nPessoas), '%');
    imprimeLinhaECF(marca, Trim(str), False, False, False, False, False, False, False);

    str := formatoRodapeExtrato;

    str := dm.organizarCupom(str, 'Valor por pessoa..:  ', '#');
    str := dm.organizarCupom(str, '', '*');
    str := dm.organizarCupom(str, FormatFloat('R$ ###,###,##0.00 ', (totalConta / nPessoas)), '%');
    imprimeLinhaECF(marca, Trim(str), False, False, False, False, False, False, False);
  end;

  if ((codVenda <> '') and (tipo <> 2)) then
  begin
    if (AMesa = mesaDelivery) then
    begin
      q.Active := False;
      q.sql.clear;
      q.sql.add(' select rd.cod_pedido, rd.cod_forma, rd.valor, fp.descricao  from recebimentos_delivery rd ');
      q.sql.add('            inner join formas_pagamento fp on (fp.cod_forma = rd.cod_forma ) ');
      q.sql.add(' where rd.cod_pedido=' + QuotedStr(codVenda));
      q.Active := True;
      q.First;
      if (q.IsEmpty = False) then
      begin
        imprimeLinhaECF(marca, linhaExtrato, False, False, False, False, False, False, False);
        while not q.Eof do
        begin
          str := formatoRodapeExtrato;
          str := dm.organizarCupom(str, q.fieldbyname('descricao').Value, '#');
          str := dm.organizarCupom(str, '', '*');
          str := dm.organizarCupom(str, '', '%');
          tamStr := alinhamentoDireitaTotal - Length(Trim(str));
          str := Trim(str) + dm.alinha_valor_a_direita(tamStr, FormatFloat('R$ ###,###,##0.00 ', (q.fieldbyname('valor').Value)));
          imprimeLinhaECF(marca, Trim(str), True, False, False, False, False, False, False);
          q.Next;
        end;
        imprimeLinhaECF(marca, linhaExtrato, False, False, False, False, False, False, False);
      end;
    end
    else
    begin

    end;
  end;

  if (troco > 0) then
  begin
    str := formatoLinhaTotalizador;
    str := dm.organizarCupom(str, dm.alinha_valor_a_direita(alinhamentoDireitaTotal, 'Troco:    ' + FormatFloat('R$ ###,###,##0.00 ', (troco))), '%');
    imprimeLinhaECF(marca, str, False, False, False, False, False, False, False);
  end;

  if ((imprimirTaxaServicoNoExtrato = 0) and (AMesa <> mesaDelivery) and (AMesa <> mesaBalcao)) then
  begin
    imprimeLinhaECF(marca, '', False, False, False, False, False, False, False);
    imprimeLinhaECF(marca, '', False, False, False, False, False, False, False);
    imprimeLinhaECF(marca, '', False, False, False, False, False, False, False);
    imprimeLinhaECF(marca, '', False, False, False, False, False, False, False);
    imprimeLinhaECF(marca, '', False, False, False, False, False, False, False);
    imprimeLinhaECF(marca, '', False, False, False, False, False, False, False);
    imprimeLinhaECF(marca, '', False, False, False, False, False, False, False);
    imprimeLinhaECF(marca, '', False, False, False, False, False, False, False);
    imprimeLinhaECF(marca, '', False, False, False, False, False, False, False);
  end;

  if (tipo = 1) then
  begin
    if (StrToInt(dm.LeIni(2, 'extrato', 'msgCupomFiscal')) = 1) then
    begin
      imprimeLinhaECF(marca, linhaExtrato, False, False, False, False, False, False, False);
      dm.imprimeLinhaECF(marca, dm.centralizar('AGUARDE A EMISSAO', qtdColunasExpandidoECF), True, False, False, True, False, True, False);
      dm.imprimeLinhaECF(marca, dm.centralizar('DO CUPOM FISCAL', qtdColunasExpandidoECF), True, False, False, True, False, True, False);
    end;
  end;
  imprimeLinhaECF(marca, linhaExtrato, False, False, False, False, False, False, False);

  if (tipo = 1) then
  begin
    if (StrToInt(dm.LeIni(2, 'extrato', 'msgPromocional')) = 1) then
    begin
      for ct := 1 to StrToInt(dm.LeIni(2, 'extrato', 'qtdLinhasMsgPromocional')) do
      begin
        dm.imprimeLinhaECF(marca, dm.centralizar(dm.LeIni(2, 'extrato', 'msgPromocionalLinha' + IntToStr(ct)), alinhamentoDireitaTotal), False, False, False, False, False, False, False);
      end;

      imprimeLinhaECF(marca, linhaExtrato, False, False, False, False, False, False, False);
    end;
  end;

  for ct := 1 to StrToInt(LeIni(2, 'IMPRESSORA_NAO_FISCAL_01', 'linhasAposCupom')) do
  begin
    imprimeLinhaECF(marca, '                     ', False, False, False, False, False, False, False);
  end;
  imprimeLinhaECF(marca, '.', False, False, False, False, False, False, False);

  q.Active := False;
  FreeAndNil(q);
end;

procedure Tdm.imprimeProtocoloLancamentoRd(evento: SmallInt; codLancamento: string);
var
  q: TIBQuery;
  str: string;
  ct: Integer;
  strComprovante: TStringList;
begin

  strComprovante := TStringList.Create;
  q := TIBQuery.create(self);
  q.Database := dm.dbrestaurante;
  q.Transaction := dm.transacao;
  try
    strComprovante.Clear;
    frm_principal.memo_avisos.Lines.clear;
    if FileExists(caminhoArquivoExtrato) then
      DeleteFile(caminhoArquivoExtrato);

    q.Active := False;
    q.SQL.Clear;
    q.sql.add(' select lr.*,cp.data_vencimento, f.nome_fantasia, f.razao_social    from lancamentos_rd lr ');
    q.sql.add('  inner join contas_a_pagar cp on (cp.codigo = lr.cod_ct_pagar) ');
    q.sql.add('      inner join fornecedor f on (f.cod_fornecedor = lr.cod_fornecedor) ');
    q.sql.add('  where lr.codigo =' + QuotedStr(codLancamento));
    q.Active := True;

  //  frm_principal.memoObsMiniprinter.Lines.Clear;
  //   frm_principal.memoObsMiniprinter.Lines.Add(trim(q.fieldbyname('observacoes').Value));
    strComprovante.add('</zera>>');
    strComprovante.add('<e><n>' + PadCenter(razao_social, 24, ' ') + '</n></e>');
    strComprovante.add('<e>' + PadCenter('PROTOCOLO', 24, ' ') + '</e>');

    if evento = 2 then
    begin
      strComprovante.add('</linha_dupla>');
      strComprovante.add('<e><n> A L T E R A Ç Ã O </e></n>');
      strComprovante.add('</linha_dupla>');
    end;

    strComprovante.Add(FormatDateTime('DD/MM/YY', Date) + '  -  ' + FormatDateTime('HH:MM:SS', Time));
    strComprovante.Add('<e><n> Fornecedor: ' + q.fieldbyname('razao_social').Value + '</n></e>');
    strComprovante.Add('<e><n> Valor: ' + FormatFloat('R$ ###,###,##0.00 ', q.fieldbyname('total').Value) + '</n></e>');
    strComprovante.Add('<e><n> DOC  : ' + q.fieldbyname('num_doc').Value + '</n></e>');
    strComprovante.Add('Cod. RD   :  ' + codLancamento);
    strComprovante.Add('Cod. Ct.pagar  : ' + q.fieldbyname('cod_ct_pagar').Value);
    strComprovante.add('</linha_dupla>');
    strComprovante.Add('Lançado em: ' + FormatDateTime('DD/MM/YY', q.fieldbyname('data_lancamento').Value));
    strComprovante.Add('Data Doc  :   ' + FormatDateTime('DD/MM/YY', q.fieldbyname('data_documento').Value));
    strComprovante.Add('<e><n> Vencimento:  ' + FormatDateTime('DD/MM/YY', q.fieldbyname('data_vencimento').Value) + '</n></e>');
    strComprovante.Add('Data RD: ' + FormatDateTime('DD/MM/YY', q.fieldbyname('data_rd').Value));
    strComprovante.Add('Lançado por: ' + q.fieldbyname('nome_usuario').Value);
    strComprovante.add('</linha_dupla>');
    strComprovante.Add(' ');
    strComprovante.Add(' ');
    strComprovante.Add('Conferido por: ___________________________');
    strComprovante.Add(' ');
    strComprovante.add('<e><n>' + PadCenter('___________________________', 24, ' ') + '</n></e>');
    strComprovante.add('' + PadCenter('Assinatura do conferente', 48, ' ') + '');
    strComprovante.add('</linha_dupla>');
    strComprovante.add('<e><n>' + PadCenter('DETALHAMENTO', 24, ' ') + '</n></e>');

    q.Active := False;
    q.SQL.Clear;

    q.sql.add('   select itr.*, g.descricao from itens_lancamento_rd itr');
    q.sql.add('     inner join grupos g on (g.cod_grupo = itr.cod_grupo) ');
    q.sql.add('     where itr.cod_lanc_rd=' + QuotedStr(codLancamento));
    q.Active := True;

    q.First;
    while not q.Eof do
    begin
      strComprovante.add(q.fieldbyname('descricao').Value + ' -- ' + FormatFloat('R$ ###,###,##0.00 ', q.fieldbyname('valor').Value));
      q.Next;
    end;
    strComprovante.add('</linha_dupla>');
    strComprovante.add('<e><n>' + 'OBS' + '</n></e>');

    for ct := 0 to frm_principal.memoObsMiniprinter.Lines.Count - 1 do
    begin
      strComprovante.Add(frm_principal.memoObsMiniprinter.Lines[ct]);
    end;

    for ct := 1 to StrToInt(LeIni(2, 'IMPRESSORA_NAO_FISCAL_01', 'linhasAposCupom')) do
    begin
      strComprovante.add(' ');
    end;

//     strComprovante.add('</corte_parcial>');
    ////dm.adicionalog(strComprovante.Text);
    configuraImpressoraNaoFiscal();
    imprimeTextoACBR(strComprovante);

  finally
    FreeAndNil(q);
    FreeAndNil(strComprovante);
  end;

end;

procedure Tdm.imprimeComprovanteDelivery(codPedido: string; operacao: SmallInt; AMensagemEntregador: string);
var
  ts: TIBTransaction;
  q: TIBQuery;
  qClienteNovo: TIBQuery;
  qItensPedido: TIBQuery;
  qformasPagto: TIBQuery;
  strComprovante: TStringList;
  codProduto: string;
  descricaoProduto: string;
  quantidade: string;
  valorUnitario, total: string;
  totalConta: string;
  descricaoFP: string;
  valorFP: string;
  ct: Integer;
  I: Integer;
  LSQL: TStringList;
  LMemTable: TFDMemTable;
  LIDPedidoPlataforma, LLocalizadorPlataforma: LongInt;
  LQtdPedidosCliente: integer;
  LTelefonePLataforma: string;
begin
  strComprovante := TStringList.Create;
  strComprovante.Clear;

  ts := TIBTransaction.Create(Self);
  ts.Name := RandomName(8);
  ts.DefaultDatabase := dm.dbrestaurante;
  ts.Active := False;
  ts.Active := True;

  ////dm.adicionalog('Transacao imprime comprovante delivery ' + IntToStr(ts.TransactionID));

  LSQL := TStringList.Create;
  LMemTable := TFDMemTable.Create(self);

  q := TIBQuery.create(self);
  q.Database := dbrestaurante;
  q.Transaction := ts;
  q.sql.clear;
  qItensPedido := TIBQuery.create(self);
  qItensPedido.Database := dbrestaurante;
  qItensPedido.Transaction := ts;
  qItensPedido.sql.clear;

  qformasPagto := TIBQuery.create(self);
  qformasPagto.Database := dbrestaurante;
  qformasPagto.Transaction := ts;
  qformasPagto.sql.clear;

  qClienteNovo := TIBQuery.create(self);
  qClienteNovo.Database := dbrestaurante;
  qClienteNovo.Transaction := ts;
  qClienteNovo.sql.clear;

  try
    q.Active := False;
    q.SQL.Clear;
    q.sql.add(' select p.codigo,p.cod_cliente, coalesce( c.nome,' + QuotedStr('') + ') as nome, ');
    q.sql.add('        coalesce(c.telefone,' + QuotedStr('') + ') as telefone,');
    q.sql.add('        coalesce(c.celular,' + QuotedStr('') + ') as celular,');
    q.sql.add('        coalesce(c.endereco,' + QuotedStr('') + ') as endereco, ');
    q.sql.add('       coalesce(c.complemento,' + QuotedStr('') + ') as complemento, ');
    q.sql.add('       coalesce(c.referencia1,' + QuotedStr('') + ') as ref1,');
    q.sql.add('       coalesce(c.referencia2,' + QuotedStr('') + ') as ref2,');
    q.sql.add('       coalesce(b.descricao,' + QuotedStr('') + ') as bairro,');
    q.sql.add('       p.valor_bruto,');
    q.sql.add('       p.valor_entrega,');
    q.sql.add('       p.valor_desconto,');
    q.sql.add('       p.valor_total,');
    q.sql.add('       p.valor_troco,');
    q.sql.add('       p.retira_balcao, tb.descricao as descTabelaPreco, p.ID_PEDIDO_INTEGRACAO');
    q.sql.add('  from pedidos_delivery  p');
    q.sql.add('   inner join clientes_delivery c on (c.codigo = p.cod_cliente)');
    q.sql.add('   inner join bairro b on (b.codigo = c.cod_bairro)');
    q.sql.add('   inner join tabelas_preco tb on (tb.codigo = p.tabela_preco) ');
    q.sql.add('  where p.codigo=' + QuotedStr(codPedido));
    q.Active := True;

    qClienteNovo.active := false;
    qClienteNovo.sql.clear;
    qClienteNovo.sql.add('   select count(*) as ct from pedidos_delivery pd');
    qClienteNovo.sql.add(' where pd.cod_cliente=' + Quotedstr(q.FieldByName('cod_cliente').Value));
    qClienteNovo.sql.add('and pd.codigo <> ' + Quotedstr(q.FieldByName('codigo').Value));
    qClienteNovo.Active := true;
    LQtdPedidosCliente := qClienteNovo.FieldByName('ct').Value;
    qClienteNovo.active := false;

    strComprovante.Clear;
    q.GetFieldNames(strComprovante);
    dm.adicionalog(q.sql.Text);

    strComprovante.Clear;
    strComprovante.add('</zera>');

    strComprovante.add('</zera>');

    if FileExists(logoComprovantes, True) then
      strComprovante.add('</ce><bmp>' + logoComprovantes + '</bmp>')
    else
    begin
      ////dm.adicionalog('Arquivo de logo não encontrado para impressão');
    end;

    strComprovante.add('<e>' + PadCenter(nome_fantasia, 24, ' ') + '</e>');
    strComprovante.add('</fn></ae>' + FormatDateTime('DD/MM/YYY', Date) + ' ' + FormatDateTime('HH:MM:SS', Time));
    strComprovante.add('</fn></ae>Caixa Nº: ' + ultimoCaixaAberto);
    strComprovante.add('</fn></ae>Operador: ' + nome_usuario_responsavel);
    strComprovante.add('<S></fn></ae><n>' + q.FieldByName('descTabelaPreco').Value + '</N></s>');
    strComprovante.add('<n></linha_dupla></N>');
    case operacao of
      1:
        begin

        end;
      2:
        begin
          strComprovante.add('<n></ce><e># ALTERAÇÃO DO PEDIDO #</N></e>');
        end;
      3:
        begin
          strComprovante.add('<n></ce><e>## EXCLUSÃO DO PEDIDO #</N></e>');
        end;
    end;

    strComprovante.add('</ce><e>DELIVERY - PED. ' + IntToStr(StrToInt(codPedido)) + '</e>');
    strComprovante.add('</ce><e>numeroVia</e>');

    LIDPedidoPlataforma := q.FieldByName('ID_PEDIDO_INTEGRACAO').Value;

    strComprovante.add('<n></linha_simples></N>');
    strComprovante.add('</fn></ce><n>DADOS DO CLIENTE</N>');
    strComprovante.add('</linha_simples>');

    strComprovante.add('</fn></ae><n>Cliente:</N>  ' + q.FieldByName('nome').Value);
    strComprovante.add('</fn></ae><n>Telefone:</N> ' + q.FieldByName('telefone').Value);
    strComprovante.add('</fn></ae><n>Celular:</N>  ' + q.FieldByName('celular').Value);

    if LQtdPedidosCliente = 0 then
    begin
      strComprovante.add('<in><n></ce><e>ATENÇÃO: CLIENTE NOVO!!</N></e></in>');
    end
    else
    begin
      strComprovante.add('</fn></ae><n>Qtde de pedidos até hoje:' + Inttostr(LQtdPedidosCliente));
    end;
    strComprovante.add('</linha_simples>');

    if q.FieldByName('retira_balcao').Value = 0 then
    begin
      strComprovante.add('</fn></ae><n>Endereço:</N> ' + q.FieldByName('endereco').Value);
      strComprovante.add('</fn></ae><n>Bairro:</N> ' + q.FieldByName('bairro').Value);
      strComprovante.add('</fn></ae><n>Complemento:</N>  ' + q.FieldByName('complemento').Value);
      strComprovante.add('</fn></ae><n>Ref 1:</N>  ' + q.FieldByName('ref1').Value);
      strComprovante.add('</fn></ae><n>Ref 2:</N>  ' + q.FieldByName('ref2').Value);
      strComprovante.add('</linha_simples>');

    end
    else
    begin
      strComprovante.add('</ce><e><n><S>RETIRADA NO BALCÃO</S></N></e>');
      strComprovante.add('</fn>');
      strComprovante.add('</linha_simples>');
    end;

    if LIDPedidoPlataforma <> 0 then
    begin
      if (imprimeDadosPlataformaComprovanteDelivery = True) then
      begin
        LSQL.Clear;
        LSQL.Add('  select ip.id, ip.id_reduzido_plataforma as idPlataforma, ip.localizador, coalesce(ip.telefone_plataforma,' + Quotedstr('') + ') as telefone_plataforma  from integracoes_pedidos ip');
        LSQL.Add('      where ip.id =' + Inttostr(LIDPedidoPlataforma));
        dm.getMemTable(LMemTable, LSQL.Text);
        if LMemTable.IsEmpty = false then
        begin
          strComprovante.add('</fn></ce><n>DADOS DA PLATAFORMA</N>');
          LLocalizadorPlataforma := LMemTable.FieldByName('localizador').Value;
          LIDPedidoPlataforma := LMemTable.FieldByName('idPlataforma').Value;
          LTelefonePLataforma := LMemTable.FieldByName('telefone_plataforma').Value;
          strComprovante.add('</ae><e>ID: #' + IntToStr(LIDPedidoPlataforma) + '</e>');
          strComprovante.add('</ae><e>Localizador: ' + IntToStr(LLocalizadorPlataforma) + '</e>');
          strComprovante.add('</ae><e>Tel: ' + LTelefonePLataforma + '</e>');
          strComprovante.add('</linha_simples>');
        end;
      end;
    end;

    strComprovante.add('<n>' + PadRight('Cód.', 7, ' ') + PadRight('Descrição', 41) + '</n>');
    strComprovante.add('<n>' + PadRight('Qtde.', 14, ' ') + PadLeft('Vl Unitário', 15) + PadLeft('Total', 19) + '</n>');
    strComprovante.add('</linha_simples>');

    if ComprovanteDeliveryAgrupado = False then
    begin
      qItensPedido.Active := False;
      qItensPedido.SQL.Clear;
      qItensPedido.sql.add('   select it.cod_produto, p.cod_barras, p.descricao, it.quantidade, ');
      qItensPedido.sql.add('          it.valor_unitario, coalesce(it.sabores,' + QuotedStr('') + ') as sabores, coalesce(it.observacoes,' + QuotedStr('') + ') as observacoes, ');
      qItensPedido.sql.add('           udf_roundabnt( (it.valor_unitario  * it.quantidade ),2) as total ');
      qItensPedido.sql.add('              from itens_pedido_delivery it ');
      qItensPedido.sql.add('                 inner join produtos p on (p.cod_produto  = it.cod_produto) ');
      qItensPedido.sql.add('          where it.cod_pedido=' + QuotedStr(codPedido));
    end
    else
    begin
      qItensPedido.sql.add('       select it.cod_produto, p.cod_barras, p.descricao, sum(it.quantidade) as quantidade, ');
      qItensPedido.sql.add('             it.valor_unitario,');
      qItensPedido.sql.add('              udf_roundabnt(  sum((it.valor_unitario  * it.quantidade )),2) as total');
      qItensPedido.sql.add('                 from itens_pedido_delivery it');
      qItensPedido.sql.add('                    inner join produtos p on (p.cod_produto  = it.cod_produto)');
      qItensPedido.sql.add('          where it.cod_pedido=' + QuotedStr(codPedido));
      qItensPedido.sql.add('              group by it.cod_produto, p.cod_barras, p.descricao, it.valor_unitario');
    end;

//    dm.adicionalog(qItensPedido.SQL.Text);
    qItensPedido.Active := True;
    qItensPedido.FetchAll;

    qItensPedido.First;
    while not qItensPedido.Eof do
    begin
      codProduto := qItensPedido.FieldByName('COD_BARRAS').Value;
      descricaoProduto := qItensPedido.FieldByName('descricao').Value;
      valorUnitario := FormatFloat('R$ ###,###,##0.00', qItensPedido.FieldByName('valor_unitario').Value);

      if Frac(qItensPedido.FieldByName('quantidade').Value) > 0 then
        quantidade := FormatFloat('#0.000', qItensPedido.FieldByName('quantidade').Value)
      else
        quantidade := IntToStr(qItensPedido.FieldByName('quantidade').Value);

      total := FormatFloat('R$ ###,###,##0.00', qItensPedido.FieldByName('total').Value);

      strComprovante.add(PadRight(codProduto, 7, ' ') + PadRight(descricaoProduto, 41));
      strComprovante.add(PadRight(quantidade, 14, ' ') + PadLeft(valorUnitario, 15) + PadLeft(total, 19));

      if (ComprovanteDeliveryAgrupado = False) then
      begin
        if (qItensPedido.fieldbyname('sabores').Value <> '') then
        begin
          strComprovante.add('</ad></fn><n>Sabores:</N>');
          strComprovante.add(dm.BuscaTroca(qItensPedido.fieldbyname('sabores').Value, LineBreak, ','));
        end;
      end;

      if ((imprimeObsComprovanteDelivery) and (ComprovanteDeliveryAgrupado = False)) then
      begin
        if (qItensPedido.fieldbyname('observacoes').Value <> '') then
        begin
          strComprovante.add('</ad></fn><n>Obs:</N>');
          strComprovante.add('</ad></fn><n>' + dm.BuscaTroca(qItensPedido.fieldbyname('observacoes').Value + '</N>', LineBreak, ','));
        end;
      end;

      qItensPedido.Next;
    end;

    if (trim(AMensagemEntregador) <> '') then
    begin

      strComprovante.add('<in><a><n></ce><e> ATENÇÃO ENTREGADOR! </N></e></a></in>');
      strComprovante.add('</FN> ');
      strComprovante.add('<e> ' + AMensagemEntregador + '</e>');
      strComprovante.add('</FN> ');
      strComprovante.add('<in><a><n></ce><e>                    </N></e></a></in>');
    end;

    strComprovante.add('</linha_simples>');
    strComprovante.add('</fn></ce><n>FORMAS DE PAGAMENTO</N>');
    strComprovante.add('</linha_simples>');

    qformasPagto.Active := False;
    qformasPagto.SQL.Clear;
    qformasPagto.SQL.Add(' select rd.cod_forma, fp.descricao, rd.valor  from recebimentos_delivery rd ');
    qformasPagto.SQL.Add('  inner join formas_pagamento fp on (fp.cod_forma = rd.cod_forma)');
    qformasPagto.SQL.Add('    where rd.cod_pedido=' + QuotedStr(codPedido));
    qformasPagto.Active := True;
    qformasPagto.FetchAll;
    qformasPagto.First;

    ////dm.adicionalog('Retornou ' + IntToStr(qformasPagto.RecordCount) + ' pagamentos do pedido ' + codPedido);

    while not qformasPagto.Eof do
    begin
      descricaoFP := qformasPagto.Fields[1].Value;
      valorFP := FormatFloat('R$ ###,###,##0.00', qformasPagto.Fields[2].Value);
      strComprovante.add(PadRight(descricaoFP, 14, ' ') + PadLeft('', 15) + PadLeft(valorFP, 19));
      qformasPagto.Next;
    end;
    strComprovante.add('</linha_simples>');
    qformasPagto.Active := False;

    strComprovante.add(PadRight(' Produtos:', 20) + PadLeft(FormatFloat('R$ ###,###,##0.00 ', q.FieldByName('valor_bruto').Value), 28));

    if q.FieldByName('valor_entrega').Value > 0 then
      strComprovante.add(PadRight(' + Taxa de entrega:', 20) + PadLeft(FormatFloat('R$ ###,###,##0.00 ', q.FieldByName('valor_entrega').Value), 28))
    else
      strComprovante.add(PadRight(' + Taxa de entrega:', 20) + PadLeft('ISENTO', 28));

    if q.FieldByName('valor_desconto').Value > 0 then
      strComprovante.add(PadRight(' - Desconto:', 20) + PadLeft(FormatFloat('R$ ###,###,##0.00 ', q.FieldByName('valor_desconto').Value), 28));

    strComprovante.add('</linha_simples>');
    strComprovante.add('<e><n>' + PadRight('Total:', 7) + PadLeft(FormatFloat('R$ ###,###,##0.00 ', q.FieldByName('valor_total').Value), 17) + '</e></N>');
    strComprovante.add('</linha_simples>');
    if q.FieldByName('valor_troco').Value > 0 then
      strComprovante.add('<e><n>' + PadRight('Troco:', 7) + PadLeft(FormatFloat('R$ ###,###,##0.00 ', q.FieldByName('valor_troco').Value), 17) + '</e></N>');

    strComprovante.add('</linha_simples>');

    if (Trim(msg_promo_delivery) <> '') then
    begin
      strComprovante.add('</fn></ce><n>' + msg_promo_delivery + '</N>');
      strComprovante.add('</linha_simples>');
    end;

    for ct := 1 to StrToInt(LeIni(2, 'IMPRESSORA_EXPEDICAO', 'linhasAposCupom')) do
    begin
      strComprovante.add(' ');
    end;

    for I := 1 to viasComprovanteDelivery do
    begin
      strComprovante.Text := StringReplace(strComprovante.Text, 'numeroVia', IntToStr(I) + 'ª Via', [rfReplaceAll]);
//       adicionaLog(strComprovante.Text);


      ImprimeTextoImpressoraExpedicao(strComprovante.Text);
    end;

  finally
    q.Active := False;
    ts.Active := False;
    qItensPedido.Active := False;
    FreeAndNil(qformasPagto);
    FreeAndNil(q);
    FreeAndNil(qItensPedido);
    FreeAndNil(qClienteNovo);
    FreeAndNil(ts);
    FreeAndNil(strComprovante);
    FreeAndNil(LSQL);
    FreeAndNil(LMemTable);
  end;

end;

procedure Tdm.modificaTabelaDePrecoItensLancados(ANumeroMesa: string; ACodigoTabela: Integer);
var
  ts: TIBTransaction;
  q: TIBQuery;
begin

  ts := TIBTransaction.Create(nil);
  ts.Params.Add('read_committed');
  ts.Params.Add('rec_version');
  ts.Params.Add('nowait');
  ts.DefaultDatabase := dm.dbrestaurante;
  ts.Active := False;
  ts.Active := True;

  q := TIBQuery.create(self);
  q.Database := dm.dbrestaurante;
  q.Transaction := ts;
  q.Active := False;
  q.SQL.Clear;

  try
    try
      q.Active := False;
      q.SQL.Clear;

      case ACodigoTabela of
        0:
          begin
            q.SQL.Add('update movimento_mesa ms set ms.tabela_preco=0, ms.valor_unitario = ');
            q.SQL.Add(' (select p.valor_unitario from produtos p ');
            q.SQL.Add('  where p.cod_produto=ms.cod_produto)');
            q.SQL.Add('  where ms.cod_mesa=' + QuotedStr(ANumeroMesa));
          end;
        99:
          begin
            q.SQL.Add('update movimento_mesa ms set ms.tabela_preco=0, ms.valor_unitario = ');
            q.SQL.Add(' (select p.valor_custo from produtos p ');
            q.SQL.Add('  where p.cod_produto=ms.cod_produto)');
            q.SQL.Add('  where ms.cod_mesa=' + QuotedStr(ANumeroMesa));
          end;

      else
        begin
          q.SQL.Add('update movimento_mesa ms set ms.tabela_preco=' + IntToStr(ACodigoTabela) + ',ms.valor_unitario = ');
          q.SQL.Add(' (select tb.valor_unitario from produtos_tabela_precos tb ');
          q.SQL.Add('  where tb.cod_tabela=' + IntToStr(ACodigoTabela) + ' and tb.cod_produto=ms.cod_produto)');
          q.SQL.Add('  where ms.cod_mesa=' + QuotedStr(ANumeroMesa));

        end;
      end;

      q.ExecSQL;
      ts.Commit;
    except
      dm.exibe_painel_erro('Erro ao mudar preços dos produtos lançados para a tabela de preços selecionada!', 'Ok');
    end;

  finally
    q.Active := False;
    FreeAndNil(q);

    ts.Active := False;
    FreeAndNil(ts);
  end;

end;

procedure Tdm.AtualizaPrecosSaboresPizzaTabelaPrecos(AMesa: string; ATabela: integer);
var
  LSQL: TStringList;
  LTbAux: TFDMemTable;
  LListaSQL: TList<string>;
begin
  LTbAux := TFDMemTable.Create(Self);
  LSQL := TstringList.create;
  LListaSQL := TList<string>.Create;

  try
    try
      if ATabela = 0 then
      begin
        LSQL.clear;
        LSQL.Add('  update sabores_pizza_movimento_mesa ms ');
        LSQL.Add('set ms.valor_unitario_sabor = (select p.valor_unitario');
        LSQL.Add('      from produtos p where p.cod_produto = ms.cod_produto);');
      end
      else
      begin
        LSQL.clear;
        LSQL.add(' update sabores_pizza_movimento_mesa ms                           ');
        LSQL.add('   set ms.valor_unitario_sabor =                                  ');
        LSQL.add('          (select pt.valor_unitario from produtos_tabela_precos pt');
        LSQL.add('            where pt.cod_tabela=' + Inttostr(ATabela));
        LSQL.add('            and pt.cod_produto = ms.cod_produto)                  ');
        LSQL.add('   where ms.cod_mesa=' + QuotedStr(AMesa) + ';');
      end;

      LListaSQL.Add(LSQL.Text);

      LSQL.add(' update movimento_mesa ms                                                           ');
      LSQL.add('   set ms.valor_unitario =                                                          ');
      LSQL.add('    ( select  udf_roundabnt( sum(sb.quantidade * sb.valor_unitario_sabor),2)        ');
      LSQL.add('       from sabores_pizza_movimento_mesa  sb                                        ');
      LSQL.add('        where sb.id_mov_mesa = ms.id)                                               ');
      LSQL.add('    where  ms.id in (select sb.id_mov_mesa from  sabores_pizza_movimento_mesa sb)   ');
      LSQL.add('	   and ms.cod_mesa=' + QuotedStr(AMesa) + ';');

      LListaSQL.Add(LSQL.Text);

      ExecutaBlocoDeInstrucoes(LListaSQL, 25);

    except
      on E: Exception do
      begin
        dm.exibe_painel_erro('Erro ao ', 'Ok');
        raise Exception.Create('Erro ao realizar operação');
      end;
    end;
  finally
    FreeAndNil(LSQL);
    FreeAndNil(LListaSQL);

  end;
end;

procedure Tdm.formataCabecalhoDelivery(codPedido: string);
var
  q: TIBQuery;
  linha: string;
begin
  q := TIBQuery.create(self);
  q.Database := dbrestaurante;
  q.Transaction := transacao;
  q.sql.clear;
  q.Active := False;
  frm_principal.memoFormatacaoDelivery.Lines.Clear;
  q.sql.add('select p.codigo,p.cod_cliente, c.nome,c.telefone, c.endereco,c.complemento,c.referencia1,c.referencia2,b.descricao, p.retira_balcao  from pedidos_delivery  p');
  q.sql.add('   inner join clientes_delivery c on (c.codigo = p.cod_cliente)');
  q.sql.add('   inner join bairro b on (b.codigo = c.cod_bairro)');
  q.sql.add('  where p.codigo=' + QuotedStr(codPedido));
  q.Active := True;

  frm_principal.memoFormatacaoDelivery.Lines.Add('Nome: ' + q.fieldbyname('nome').Value);
  frm_principal.memoFormatacaoDelivery.Lines.Add('Telefone: ' + q.fieldbyname('telefone').Value);

  if q.fieldbyname('retira_balcao').Value = 1 then
  begin
    linha := formatacaoACBRInicial(True, False, False, True, False, True, False) + 'RETIRAR NO BALCAO';
    linha := linha + formatacaoACBRFinal(True, False, False, True, False, True, False);
    linha := '<C>' + linha + '</C>';
    frm_principal.memoFormatacaoDelivery.Lines.Add(linha);

  end
  else
  begin
    frm_principal.memoFormatacaoDelivery.Lines.Add('Endereco: ' + q.fieldbyname('endereco').Value);
    frm_principal.memoFormatacaoDelivery.Lines.Add('Bairro ' + q.fieldbyname('descricao').Value);

    if ((q.fieldbyname('complemento').Value <> Null) and (Trim(q.fieldbyname('complemento').Value) <> '')) then
    begin
      frm_principal.memoFormatacaoDelivery.Lines.Add('Complemento: ' + q.fieldbyname('complemento').Value);
    end;

    if ((q.fieldbyname('referencia1').Value <> Null) and (Trim(q.fieldbyname('referencia1').Value) <> '')) then
    begin
      frm_principal.memoFormatacaoDelivery.Lines.Add('Ref 1: ' + q.fieldbyname('referencia1').Value);
    end;

    if ((q.fieldbyname('referencia2').Value <> Null) and (Trim(q.fieldbyname('referencia2').Value) <> '')) then
    begin
      frm_principal.memoFormatacaoDelivery.Lines.Add('Ref 2: ' + q.fieldbyname('referencia2').Value);
    end;
  end;

  q.Active := False;
  FreeAndNil(q);
end;

function Tdm.getCodClientePedidoDelivery(codPedido: string): string;
var
  Q: TIBQuery;
begin
  Q := TIBQuery.Create(self);
  Q.Database := dm.dbrestaurante;
  Q.Transaction := transacao;
  Q.Active := False;
  Q.SQL.clear;
  Q.SQL.add('select cod_cliente from pedidos_delivery where codigo=' + QuotedStr(codPedido));
  Q.Active := True;
  result := Q.fieldbyname('cod_cliente').Value;
  Q.Active := False;
  FreeAndNil(Q);
end;

procedure Tdm.efetuaBaixaNoPedidoDelivery(codPedido: string; cod_Venda: string; cod_caixa: string);
var
  q: TIBQuery;
begin
  q := TIBQuery.create(self);
  q.Database := dbrestaurante;
  q.Transaction := transacao;
  q.sql.clear;
  q.Active := False;
  q.SQL.add('update pedidos_delivery set data=' + QuotedStr(FormatDateTime('DD.MM.YYY', data_do_sistema)) + ',');
  q.SQL.add(' status=3, hora_pagamento = current_timestamp, cod_caixa=' + QuotedStr(cod_caixa) + ', cod_venda=' + QuotedStr(cod_Venda) + ' where codigo=' + QuotedStr(codPedido));
  q.ExecSQL;

  q.Active := False;
  q.sql.clear;
  q.sql.add('update clientes_delivery set ultimo_pedido=' + QuotedStr(codPedido));
  q.SQL.add(' where codigo=' + QuotedStr(getCodClientePedidoDelivery(codPedido)));
  q.ExecSQL;

  q.Active := False;
  FreeAndNil(q);
end;

procedure Tdm.EmitirRelatorioDeCaixaNaMiniPrinter(ACodEmpresa: string; ACodCaixa: string; ATipoImpressao: TTipoRelatorioCaixa);
var
  q: TIBQuery;
  frmVazio: Tfrm_modelo_vazio;
  LRelatorio: TStringList;
  LDataCaixa: TDate;
begin
  Application.CreateForm(Tfrm_modelo_vazio, frmVazio);

  q := TIBQuery.Create(self);
  q.Database := dm.dbrestaurante;
  q.Transaction := dm.transacao;
  q.active := False;
  LRelatorio := TStringlist.create;

  try
    try
      q.SQL.clear;
      q.SQL.add('select data_sistema from caixas c where c.cod_empresa=' + Quotedstr(ACodEmpresa) + ' and c.codigo=' + QUotedstr(ACodCaixa));
      q.Active := true;
      LDataCaixa := q.fields[0].Value;
      q.Active := false;

      case ATipoImpressao of
        TRParcial:
          begin
            q.SQL.clear;
            q.sql.Add('insert into PARCIAIS_CAIXA(cod_empresa,cod_caixa,usuario) values (');
            q.sql.Add(QuotedStr(CodEmpresa) + ',');
            q.sql.Add(QuotedStr(ultimoCaixaAberto) + ',');
            q.sql.Add(QuotedStr(nome_usuario_responsavel) + ')');
            q.ExecSQL;
          end;
      end;

      q.active := false;
      q.sql.clear;
      q.sql.add(' execute procedure PROCESSACAIXA(' + Quotedstr(ACodCaixa) + ',' + Quotedstr(ACodEmpresa) + ');');
      q.ExecSQL;
      dm.transacao.Commit;

      ImprimeCabecalhoRelatorioCaixa(ACodEmpresa, ACodCaixa, LRelatorio, ATipoImpressao);
      ImprimeVendasPorModalidade(ACodEmpresa, ACodCaixa, LRelatorio);
      ImprimeApuracaoDoCaixa(ACodEmpresa, ACodCaixa, LRelatorio);
      imprimeSuprimentosCaixa(ACodEmpresa, ACodCaixa, LRelatorio);
      imprimeSangriasCaixa(ACodEmpresa, ACodCaixa, LRelatorio);
      ImprimeDescontosDoCaixa(ACodEmpresa, ACodCaixa, LRelatorio);
      imprimePendurasCaixa(ACodEmpresa, ACodCaixa, LRelatorio);

      if (IntToBol(StrToInt(dm.LeIni(2, 'RELATORIO_DE_CAIXA', 'impResGarcom'))) = true) then
        ImprimeTaxaServicoDoCaixa(ACodEmpresa, ACodCaixa, LRelatorio);

      ImprimePedidosPorEntregador(ACodEmpresa, ACodCaixa, LRelatorio);
      imprimeProdutosVendidosCaixa(ACodEmpresa, ACodCaixa, LDataCaixa, LRelatorio);

      if (IntToBol(StrToInt(dm.LeIni(2, 'RELATORIO_DE_CAIXA', 'imprimeCancelamentoItens'))) = true) then
        imprimeEstornosCaixa(ACodEmpresa, ACodCaixa, LRelatorio);

      LRelatorio.add(' ');
      LRelatorio.add(' ');
      LRelatorio.add(' ');
      LRelatorio.add(' ');
      configuraImpressoraNaoFiscal;
      imprimeTextoACBR(LRelatorio);

    except
      on E: Exception do
      begin
        if dm.transacao.Active then
          dm.transacao.Rollback;
        ShowRealDialog(frm_principal, tmErro, 'Ocorreu  um erro', 'Erro ao emitir relatório parcial de caixa! ' + sLineBreak + 'Erro: ' + E.Message);
      end;

    end;
  finally
    FreeAndNil(frmVazio);
    FreeAndNil(q);
    FreeAndNil(LRelatorio);
  end;

end;

function Tdm.AnsiLength(const s: string): Integer;
//
// Retorna o tamanho da string independente do seu tipo (Shortstring, Ansistring, Widstring...)
//
var
  p, q: PChar;
begin
  result := 0;
  p := PChar(s);
  q := p + Length(s);
  while p < q do
  begin
    Inc(result);
    if p^ in LeadBytes then
      Inc(p, 2)
    else
      Inc(p);
  end;

end;

function Tdm.verificaSeFuncionaComoBoate(): Boolean;
begin
  dm.tb_parametros.Active := True;
  if (dm.tb_parametrosBOATE.Value = 0) then
    result := False
  else
    result := True;

end;

function Tdm.verificaSeRecebeCouvertEntrada(): Boolean;
begin
  dm.tb_parametros.Active := True;
  if (dm.tb_parametrosRECEBE_COUVERT_ENTRADA.Value = 0) then
    result := False
  else
    result := True;

end;

procedure Tdm.ExpXML(DataSet: TDataSet; Arq: string);
var
  i: Integer;
  xml: TXMLDocument;
  reg, campo: IXMLNode;
begin
  xml := TXMLDocument.Create(nil);
  try
    xml.Active := True;
    DataSet.First;
    xml.DocumentElement := xml.CreateElement('DataSet', '');
    DataSet.First;
    while not DataSet.Eof do
    begin
      reg := xml.DocumentElement.AddChild('row');
      for i := 0 to DataSet.Fields.Count - 1 do
      begin
        campo := reg.AddChild(DataSet.Fields[i].DisplayLabel);
        campo.Text := DataSet.Fields[i].DisplayText;
      end;
      DataSet.Next;
    end;
    xml.SaveToFile(Arq);
  finally
    xml.free;
  end;
end;

procedure Tdm.configuraBalancas();
var
  LMensagem: TStringlist;
begin

  LMensagem := TStringList.create;
  dm.balanca.Desativar;
//  dm.balanca2.Desativar;

  try
    try

      if (StrToInt(dm.LeIni(2, 'BALANCA', 'instalada')) = 1) then
      begin
        dm.balanca.Modelo := TACBrBALModelo(StrToInt(dm.LeIni(2, 'BALANCA', 'fabricante')));
        dm.balanca.Device.HandShake := TACBrHandShake(0);
        dm.balanca.Device.Parity := TACBrSerialParity(0);
        dm.balanca.Device.Stop := TACBrSerialStop(0);
        dm.balanca.Device.Data := 8;
        dm.balanca.Device.Baud := StrToInt(velocidadeBalanca);
        dm.balanca.Device.Porta := portaDaBalanca;
        dm.balanca.Ativar;
      end
    except
      LMensagem.Add('Erro ao configurar balança 01');
      LMensagem.Add('Porta: ' + portaDaBalanca);
      LMensagem.Add('Velocidade: ' + velocidadeBalanca);
      LMensagem.add('Data:   ' + bitsDadosBalanca);
      LMensagem.add('stopBits:   ' + stopBitsBalanca);
      LMensagem.add('Paridade:   ' + paridadeBalanca);
      LMensagem.Add('Modelo/Fab: ' + fabricanteBalanca);
      LMensagem.add('Handshake:  ' + fluxoBalanca);
      dm.adicionaLog(LMensagem.Text);
      dm.exibe_painel_erro('Erro ao conectar à balança 01. Verifique a porta ou cabo de conexão!' + sLineBreak + LMensagem.text, 'Continuar');

    end;

  finally
    dm.balanca.Desativar;
    FreeAndNil(LMensagem);

  end;

end;

procedure Tdm.reimprimirDanfe(parametro: string; campo: SmallInt; visualizar: Boolean; cancelada: Boolean);
var
  localArquivoXML: string;
  q: TIBQuery;
begin

  if (dm.ACBrPosPrinter1 <> nil) then
  begin
    dm.ACBrPosPrinter1.Desativar;
    FreeAndNil(dm.ACBrPosPrinter1);
  end;

  dm.ACBrPosPrinter1 := TACBrPosPrinter.Create(self);

  q := TIBQuery.create(self);
  q.Database := dm.dbrestaurante;
  q.Transaction := dm.transacao;

  q.Active := False;
  q.SQL.Clear;

  if cancelada = False then
  begin
    if campo = 1 then
      q.SQL.Add('select v.modelo_comprovante,v.xml_doc from vendas v where v.chave_nfce=' + QuotedStr(parametro))
    else
      q.SQL.Add('select v.modelo_comprovante,v.xml_doc from vendas v where v.cod_venda=' + QuotedStr(parametro));
  end
  else
  begin
    if campo = 1 then
      q.SQL.Add('select v.modelo_comprovante,v.xml_doc from vendas_canceladas v where v.chave_nfce=' + QuotedStr(parametro))
    else
      q.SQL.Add('select v.modelo_comprovante,v.xml_doc from vendas_canceladas v where v.cod_venda=' + QuotedStr(parametro));

  end;
  q.Active := True;

  if q.IsEmpty then
  begin
    ShowMessage('Documento não localizado para reimpressão!');

  end
  else
  begin
    if ((q.FieldByName('modelo_comprovante').Value = 2) or (q.FieldByName('modelo_comprovante').Value = 3)) then
    begin
      dm.ACBrNFe1.NotasFiscais.Clear;

      if (q.FieldByName('modelo_comprovante').Value = 2) then  // Se for NFC-e
      begin
        dm.parametrizaAcbrNFE(moNFCe, visualizar, True);
        dm.ACBrNFe1.NotasFiscais.LoadFromString(q.FieldByName('xml_doc').Value);

        if visualizar = False then
        begin
          try
            dm.configuraImpressoraNFCE();
            dm.ACBrNFe1.NotasFiscais[0].Imprimir;
            ShowRealDialog(frm_principal, tmSucesso, 'Sucesso', 'Nota enviada para a impressora com sucesso!', 22, true)
          except
            begin
              dm.exibe_painel_erro('Erro ao comunicar com a impressora de NFC-e!', 'fechar');
              Exit;
            end;
          end;
        end
        else
        begin

          dm.ACBrNFe1.NotasFiscais[0].Imprimir;
        end;

      end
      else    // Se for NF-e
      begin
        dm.parametrizaAcbrNFE(moNFe, visualizar, True);
        dm.ACBrNFeDANFEFR1.TipoDANFE := tiPaisagem;
        dm.ACBrNFe1.NotasFiscais.LoadFromString(q.FieldByName('xml_doc').Value);
        dm.ACBrNFe1.NotasFiscais[0].Imprimir;
      end;

    end
    else
    begin
      if (q.FieldByName('modelo_comprovante').Value = 4) then
      begin
        dm.parametrizaAcbrNFE(moNFCe, False, True);
        try
          dm.configuraImpressoraNFCE();
        except
          begin
            dm.exibe_painel_erro('Erro ao comunicar com a impressora de NFC-e!', 'fechar');
            Exit;
          end;
        end;

        dm.sat.ImprimirExtrato();
        dm.ACBrPosPrinter1.CortarPapel(True);
      end
      else
      begin
        exibe_painel_erro('O Documento de encerramento desta venda não foi uma NFE ou NFC-e!', 'Ok');
        Exit;
      end;
    end;

  end;

  inherited;

  q.Active := False;
  FreeAndNil(q);
end;

procedure Tdm.enviaNFEPorEmail(AEmail: string);
var
  LMensagem: TStringList;
  LAssunto: string;
  LDestinatarios: TStringList;
  ANumeroNota, ADataEmissao, AChaveNFE, AValor: string;
begin
//  LDestinatarios := TStringList.Create;
  LMensagem := TStringList.Create;

  LDestinatarios := StringToStringList(AEmail);

  try
    try
      ANumeroNota := Inttostr(ACBrNFe1.NotasFiscais.Items[0].NFe.Ide.nNF);
      ADataEmissao := FormatDateTime('DD/MM/YYY', ACBrNFe1.NotasFiscais.Items[0].NFe.Ide.dEmi);
      AChaveNFE := ACBrNFe1.NotasFiscais.Items[0].NFe.infNFe.ID;
      AValor := FormatFloat('R$ ###,###,##0.00 ', ACBrNFe1.NotasFiscais.Items[0].NFe.Total.ICMSTot.vNF);

      configuraACBRMail;
      LMensagem.Add(getMensagemEmailNFE);
      LMensagem.Text := StringReplace(LMensagem.text, ':vpNomeEmpresa', nome_fantasia, [rfReplaceAll]);
      LMensagem.Text := StringReplace(LMensagem.text, ':vpNumeroNota', ANumeroNota, [rfReplaceAll]);
      LMensagem.Text := StringReplace(LMensagem.text, ':vpData', ADataEmissao, [rfReplaceAll]);
      LMensagem.Text := StringReplace(LMensagem.text, ':vpChave', AChaveNFE, [rfReplaceAll]);
      LMensagem.Text := StringReplace(LMensagem.text, ':vpValor', AValor, [rfReplaceAll]);

      LAssunto := 'Nota fiscal Nº ' + ANumeroNota + ' --- ' + razao_social;
      ACBrNFe1.NotasFiscais[0].EnviarEmail(AEmail, LAssunto, LMensagem, True, LDestinatarios, nil);
      exibe_painel_erro('E-mail enviado com sucesso!', 'Ok', mtInformation);
    except
      on E: Exception do
      begin
        exibe_painel_erro('Erro ao enviar o email!' + sLineBreak + sLineBreak + 'Mensagem: ' + E.Message, 'Ok');
      end;

    end;
  finally
    FreeAndNil(LDestinatarios);
    FreeAndNil(LMensagem);
  end;

end;

function Tdm.carregarXMLVenda(AChave: string; ACancelada: boolean): Boolean;
var
  Ltb: TFDMemTable;
  LSQL: TStringList;
begin
  result := false;
  Ltb := TFDMemTable.Create(self);
  LSQL := TStringList.Create;

  try
    try
      if ACancelada then
        LSQL.Add('select v.modelo_comprovante,v.xml_doc from vendas_canceladas v where v.chave_nfce=' + QuotedStr(AChave))
      else
        LSQL.Add('select v.modelo_comprovante,v.xml_doc from vendas v where v.chave_nfce=' + QuotedStr(AChave));

      getMemTable(Ltb, LSQL.Text);

      case Ltb.FieldByName('modelo_comprovante').Value of
        2:
          dm.parametrizaAcbrNFE(moNFCe, true, false);
        3:
          dm.parametrizaAcbrNFE(moNFe, true, false);
      end;

      dm.ACBrNFe1.NotasFiscais.Clear;
      dm.ACBrNFe1.NotasFiscais.LoadFromString(Ltb.FieldByName('xml_doc').Value, false);
      result := true;

    except
      on E: Exception do
      begin
        exibe_painel_erro('Erro ao carregar XML do documento!', 'Ok');
        result := false;
      end;
    end;

  finally
    FreeAndNil(Ltb);
    FreeAndNil(LSQL);
  end;
end;

procedure Tdm.parametrizaArquivoDeLogoNFE(ANotaEmissaoPropria: Boolean);
begin
  ACBrNFeDANFEFR1.Logo := '';
  if ANotaEmissaoPropria then
  begin
    try
      if FileExists(patchAplicacao + '\imagens\logoNFEPadrao.jpg') then
        ACBrNFeDANFEFR1.Logo := patchAplicacao + '\imagens\logoNFEPadrao.jpg'
      else
        ACBrNFeDANFEFR1.Logo := '';

    except
      ////dm.adicionalog('Ocorreu erro ao carregar o arquivo do logotipo da NFE');
      ////dm.adicionalog('Caminho do arquivo: ' + dm.LeIni(2, 'NFE', 'ArquivoLogoTipoNFE'));
      ACBrNFeDANFEFR1.Logo := '';
    end;

  end;

end;

procedure TDM.ExportarXMLVenda(AChaveNFE: string; ACancelada: Boolean; ACaminho: string);
var
  LnomeArquivo: string;
begin

  try
    try
      if carregarXMLVenda(AChaveNFE, ACancelada) then
      begin
        LnomeArquivo := AChaveNFE + '.xml';
        Clipboard.AsText := ACBrNFe1.NotasFiscais[0].xml;
        if (trim(ACaminho) <> '') then
        begin
//          dm.folderDialog.Execute;
          SalvarXMLCarregadoACBR(1, AChaveNFE, ACaminho);
        end
        else
        begin

          dm.exibe_painel_erro('Conteúdo do XML copiado para a área de transferência!', 'Ok');
        end;
      end;

    except
      on E: Exception do
      begin
        dm.exibe_painel_erro('Erro exportar documento ' + sLineBreak + sLineBreak + 'Erro: ' + E.Message, 'Ok');
      end;

    end;

  finally

  end;

end;

procedure TDM.SalvarXMLCarregadoACBR(ATipoDocumento: integer; AChave: string; AlocalArquivo: string);
begin
  try
    try
      case ATipoDocumento of
        1:
          begin
            ACBrNFe1.NotasFiscais.GravarXML(AlocalArquivo + AChave + '.xml');
            ACBrNFe1.DANFE.PathPDF := AlocalArquivo + AChave + '.pdf';
            ACBrNFe1.NotasFiscais.ImprimirPDF;
          end;
        2:
          begin
    //        dm.acbrCTE.conhecimentos.GravarXML(AlocalArquivo);
          end;
      end;

    except
      on E: Exception do
      begin
        dm.exibe_painel_erro('Erro ao gravar documento ' + E.Message, 'Ok');

      end;

    end;
  finally

  end;
end;

procedure Tdm.parametrizaAcbrNFE(modeloNfe: TpcnModeloDF; visualizar: Boolean; ANotaEmissaoPropria: Boolean);
var
  wincrypt: Boolean;
  temCertificadoInstalado: Boolean;
begin
  ////dm.adicionalog('Inicia parametrização do ACBRNFe');

  dm.tb_parametros.Active := True;

  temCertificadoInstalado := (tb_parametrosPFX_CERTIFICADO.Value <> Null) and (tb_parametrosPFX_CERTIFICADO.Value <> '');

  if (temCertificadoInstalado = True) then
  begin
    ////dm.adicionalog('Tem certificado informado nos parâmetros');
    parametrizaArquivoDeLogoNFE(ANotaEmissaoPropria);
    case StrToInt(dm.LeIni(2, 'NFE', 'libAutenticacao')) of
      1:
        begin
          ////dm.adicionalog('Vai decodificar o BASE64');
          dm.ACBrNFe1.Configuracoes.Certificados.DadosPFX := DecodeBase64(dm.tb_parametrosPFX_CERTIFICADO.Value);
          ////dm.adicionalog('DADOS LIDOS DO BASE 64');
//           DM.ACBrNFe1.Configuracoes.Certificados.NumeroSerie := dm.tb_parametrosNUM_SERIE_CERTIFICADO.Value;
          dm.ACBrNFe1.Configuracoes.Certificados.Senha := dm.tb_parametrosSENHA_CERTIFICADO.Value;
          dm.ACBrNFe1.SSL.CarregarCertificado;
//           ACBrNFe1.SSL.CarregarCertificado;
          ACBrNFe1.Configuracoes.Geral.SSLLib := libWinCrypt;
          ACBrNFe1.Configuracoes.Geral.SSLCryptLib := cryWinCrypt;
          ACBrNFe1.Configuracoes.Geral.SSLHttpLib := httpWinHttp;
          ACBrNFe1.Configuracoes.Geral.SSLXmlSignLib := xsLibXml2;
          dm.ACBrNFe1.SSL.SSLType := LT_TLSv1_2;
          ////dm.adicionalog('Lib de autenticação: Wincrypt');
        end;

      3:
        begin
          dm.ACBrNFe1.Configuracoes.Certificados.DadosPFX := DecodeBase64(dm.tb_parametrosPFX_CERTIFICADO.Value);
//           DM.ACBrNFe1.Configuracoes.Certificados.NumeroSerie := dm.tb_parametrosNUM_SERIE_CERTIFICADO.Value;
           //         ACBrNFe1.Configuracoes.Certificados.ArquivoPFX := patchAplicacao+'certificados\'+cnpj+'.pfx';
          dm.ACBrNFe1.Configuracoes.Certificados.Senha := dm.tb_parametrosSENHA_CERTIFICADO.Value;
          ACBrNFe1.SSL.CarregarCertificado;
          if (ACBrNFe1.SSL.CertificadoLido) then
          begin
            adicionaLog('Certificado lido foi: ' + ACBrNFe1.SSL.CertNumeroSerie);
          end
          else
          begin
            adicionaLog('Erro ao ler o certificado via openssl');
          end;

          dm.ACBrNFe1.Configuracoes.Geral.SSLLib := libOpenSSL;
          dm.ACBrNFe1.Configuracoes.Geral.SSLCryptLib := cryOpenSSL;
          ACBrNFe1.Configuracoes.Geral.SSLHttpLib := httpOpenSSL;
          ACBrNFe1.Configuracoes.Geral.SSLXmlSignLib := xsLibXml2;
          dm.ACBrNFe1.SSL.SSLType := LT_TLSv1_2;
          ////dm.adicionalog('Lib de autenticação: OpenSSL');
        end;

    end;

    dm.ACBrNFe1.Configuracoes.Geral.VersaoDF := ve400;

    dm.ACBrNFe1.Configuracoes.Arquivos.PathSchemas := dm.LeIni(2, 'NFE', 'caminhoSCHEMAS');
    dm.ACBrNFe1.Configuracoes.Arquivos.PathNFe := dm.LeIni(2, 'NFE', 'caminhoArquivosXML');
    dm.ACBrNFe1.Configuracoes.Arquivos.Salvar := False;
    dm.ACBrNFe1.Configuracoes.WebServices.UF := dm.tb_parametrosUF.Value;
    dm.ACBrNFe1.Configuracoes.Geral.ModeloDF := modeloNfe;

    dm.ACBrNFe1.Configuracoes.Geral.FormaEmissao := teNormal;

    if modeloNfe = moNFCe then
    begin
      dm.ACBrNFeDANFEFR1.TipoDANFE := tiNFCe;
      ACBrNFe1.Configuracoes.Geral.VersaoQRCode := veqr200;
      ////dm.adicionalog('Versão do QRCode: 2.0');

      if visualizar then
      begin
        dm.ACBrNFe1.DANFE := danfeFR;
        ACBrNFeDANFEFR1.TipoDANFE := tiNFCe;
        dm.ACBrNFe1.DANFE.TipoDANFE := tiRetrato;
        danfeFR.FastFile := patchAplicacao + '\relatorios\DANFeNFCe.fr3';
      end
      else
      begin
        dm.ACBrNFe1.DANFE := danfeESCPos;
        danfeESCPos.TipoDANFE := tiNFCe;
        dm.ACBrNFe1.DANFE.TipoDANFE := tiSemGeracao;
      end;

      case StrToInt(dm.LeIni(1, 'NFCE', 'ambienteEmissao')) of
        1:
          begin
            dm.ACBrNFe1.Configuracoes.WebServices.Ambiente := taHomologacao;
            dm.ACBrNFe1.Configuracoes.Geral.CSC := dm.tb_parametrosCSC_NFCE_HOMOLOGACAO.Value;
            dm.ACBrNFe1.Configuracoes.Geral.IdCSC := dm.tb_parametrosID_CSC_NFCE_HOMOLOGACAO.Value;

          end;
        2:
          begin
            dm.ACBrNFe1.Configuracoes.WebServices.Ambiente := taProducao;
            dm.ACBrNFe1.Configuracoes.Geral.CSC := dm.tb_parametrosCSC_NFCE.value;
            dm.ACBrNFe1.Configuracoes.Geral.IdCSC := dm.tb_parametrosID_CSC_NFCE.Value;
          end;
      end;

    end
    else
    begin
      dm.ACBrNFe1.DANFE := ACBrNFeDANFEFR1;
      ACBrNFeDANFEFR1.TipoDANFE := tiRetrato;
      dm.ACBrNFe1.DANFE.TipoDANFE := tiRetrato;
      ACBrNFeDANFEFR1.FastFile := patchAplicacao + '\relatorios\DANFeRetrato.fr3';
      dm.ACBrNFe1.Configuracoes.Geral.CSC := '';
      dm.ACBrNFe1.Configuracoes.Geral.IdCSC := '';
      dm.ACBrNFe1.Configuracoes.WebServices.Ambiente := taProducao;

      case StrToInt(dm.LeIni(1, 'NFE', 'ambienteEmissao')) of
        1:
          begin
            dm.ACBrNFe1.Configuracoes.WebServices.Ambiente := taHomologacao;
          end;
        2:
          begin
            dm.ACBrNFe1.Configuracoes.WebServices.Ambiente := taProducao;
          end;
      end;

    end;

    case StrToInt(dm.LeIni(1, 'NFE', 'formaEmissao')) of
      1:
        begin
          dm.ACBrNFe1.Configuracoes.Geral.FormaEmissao := teNormal;
        end;

      2:
        begin
          dm.ACBrNFe1.Configuracoes.Geral.FormaEmissao := teSVCRS;
        end;

    end;


    ////dm.adicionalog('Testa expiração do certificado digital:');
    if testouExpiracaoCertificadoEntrada = False then
    begin
      verificaExpiracaoCertificadoDigital();
      testouExpiracaoCertificadoEntrada := True;
    end;

  end;

end;

procedure Tdm.parametrizaAcbrCTE();
var
  wincrypt: Boolean;
  temCertificadoInstalado: Boolean;
begin
  ////dm.adicionalog('Inicia parametrização do ACBRCTE');

  dm.tb_parametros.Active := True;

  temCertificadoInstalado := (tb_parametrosPFX_CERTIFICADO.Value <> Null) and (tb_parametrosPFX_CERTIFICADO.Value <> '');

  if (temCertificadoInstalado = True) then
  begin
    ////dm.adicionalog('Tem certificado informado nos parâmetros');
    case StrToInt(dm.LeIni(2, 'CTE', 'libAutenticacao')) of
      1:
        begin
          ////dm.adicionalog('Vai decodificar o BASE64');
          ACBrCTe.Configuracoes.Certificados.DadosPFX := '';
          ACBRcte.Configuracoes.Certificados.DadosPFX := DecodeBase64(dm.tb_parametrosPFX_CERTIFICADO.Value);
          adicionaLog('DADOS LIDOS DO BASE 64');
          ACBrCTe.Configuracoes.Geral.SSLLib := libWinCrypt;
          ACBrCTe.Configuracoes.Geral.SSLCryptLib := cryWinCrypt;
          ACBrCTe.Configuracoes.Geral.SSLHttpLib := httpWinHttp;
          ACBrCTe.Configuracoes.Geral.SSLXmlSignLib := xsLibXml2;
          ACBRcte.SSL.SSLType := LT_all;
          dm.ACBRcte.Configuracoes.Certificados.Senha := dm.tb_parametrosSENHA_CERTIFICADO.Value;
          dm.ACBRcte.SSL.CarregarCertificado;
          ////dm.adicionalog('Lib de autenticação: Wincrypt');
        end;

      2:
        begin
          dm.ACBRcte.Configuracoes.Certificados.DadosPFX := DecodeBase64(dm.tb_parametrosPFX_CERTIFICADO.Value);
//           DM.ACBRcte.Configuracoes.Certificados.NumeroSerie := dm.tb_parametrosNUM_SERIE_CERTIFICADO.Value;
          dm.ACBRcte.Configuracoes.Certificados.Senha := dm.tb_parametrosSENHA_CERTIFICADO.Value;
          ACBrCTe.SSL.CarregarCertificado;
          ACBrCTe.Configuracoes.Geral.SSLLib := libCapicom;
          dm.ACBRcte.Configuracoes.Geral.SSLCryptLib := cryCapicom;
          ACBrCTe.Configuracoes.Geral.SSLHttpLib := httpWinINet;
          ACBrCTe.Configuracoes.Geral.SSLXmlSignLib := xsMsXmlCapicom;
          dm.ACBRcte.SSL.SSLType := LT_all;
          ////dm.adicionalog('Lib de autenticação: Capicom');
        end;

      3:
        begin
          dm.ACBRcte.Configuracoes.Certificados.DadosPFX := DecodeBase64(dm.tb_parametrosPFX_CERTIFICADO.Value);
//           DM.ACBRcte.Configuracoes.Certificados.NumeroSerie := dm.tb_parametrosNUM_SERIE_CERTIFICADO.Value;
           //         ACBRcte.Configuracoes.Certificados.ArquivoPFX := patchAplicacao+'certificados\'+cnpj+'.pfx';
          dm.ACBRcte.Configuracoes.Certificados.Senha := dm.tb_parametrosSENHA_CERTIFICADO.Value;
          ACBrCTe.SSL.CarregarCertificado;
          if (ACBrCTe.SSL.CertificadoLido) then
          begin
            adicionaLog('Certificado lido foi: ' + ACBrCTe.SSL.CertNumeroSerie);
          end
          else
          begin
            adicionaLog('Erro ao ler o certificado via openssl');
          end;

          dm.ACBRcte.Configuracoes.Geral.SSLLib := libOpenSSL;
          dm.ACBRcte.Configuracoes.Geral.SSLCryptLib := cryOpenSSL;
          ACBrCTe.Configuracoes.Geral.SSLHttpLib := httpOpenSSL;
          ACBrCTe.Configuracoes.Geral.SSLXmlSignLib := xsLibXml2;
          dm.ACBRcte.SSL.SSLType := LT_all;
          ////dm.adicionalog('Lib de autenticação: OpenSSL');
        end;

    end;

    {
     case strToInt( dm.LeIni(2,'CTE','versao')) of
      0:   begin
//            dm.ACBRcte.Configuracoes.Geral.VersaoDF            := ve
            ////dm.adicionalog('CTE Versão 2.0');
           end;
      1:   begin
             dm.ACBRcte.Configuracoes.Geral.VersaoDF           := ve300;
             ////dm.adicionalog('CTE Versão 3.0');
           end;

     end;
     }

    dm.ACBRcte.Configuracoes.Arquivos.PathSchemas := patchAplicacao + '\schemas\cte';
    dm.ACBRcte.Configuracoes.Arquivos.PathCTe := dm.LeIni(2, 'CTE', 'caminhoArquivosXML');
    dm.ACBRcte.Configuracoes.Arquivos.Salvar := False;
    dm.ACBRcte.Configuracoes.WebServices.UF := dm.tb_parametrosUF.Value;
    dm.ACBRcte.Configuracoes.Geral.ModeloDF := moCTe;
    dm.ACBRcte.Configuracoes.Geral.FormaEmissao := teNormal;
    dm.ACBRcte.Configuracoes.WebServices.Ambiente := taProducao;
    danfeCTE.FastFile := patchAplicacao + '\relatorios\DACTE_Retrato.fr3';
    danfeCTE.FastFileEvento := patchAplicacao + '\relatorios\DACTE_EVENTOS.fr3';
    danfeCTE.FastFileEvento := patchAplicacao + '\relatorios\DACTE_INUTILIZACAO.fr3';

  end;

end;

procedure Tdm.verificaExpiracaoCertificadoDigital();
var
  temCertificadoInstalado: Boolean;
begin

  temCertificadoInstalado := (tb_parametrosNUM_SERIE_CERTIFICADO.Value <> Null) and (Trim(tb_parametrosNUM_SERIE_CERTIFICADO.Value) <> '');

  if temCertificadoInstalado then
  begin

    diasExpiracaoCertificado := DaysBetween(Now, dm.ACBrNFe1.SSL.CertDataVenc);
    ////dm.adicionalog('Faltam ' + IntToStr(diasExpiracaoCertificado) + ' para expirar o certificado!');

    if (diasExpiracaoCertificado <= 30) then
    begin
      if (StrToInt(dm.LeIni(1, 'NFE', 'NaoAlertarCertificadoVencido')) = 0) then
      begin

        Application.CreateForm(TfrmMensagemExpiracaoCertificado, frmMensagemExpiracaoCertificado);
        try
          try
            frmMensagemExpiracaoCertificado.setDataexpiracao(dm.ACBrNFe1.SSL.CertDataVenc);
            frmMensagemExpiracaoCertificado.ShowModal;
          except
            exibe_painel_erro('Erro ao verificar data de expiração do certificado!', 'Ok');
            ////dm.adicionalog('Erro ao verificar data de expiração do certificado digital');
          end;
        finally
          frmMensagemExpiracaoCertificado.Free;
        end;
      end;
    end;

  end
  else
  begin
    diasExpiracaoCertificado := -1;
    ////dm.adicionalog('Certificado digital não instalado o definido na tabela de parâmetros!');
    testouExpiracaoCertificadoEntrada := True;
  end;

end;

procedure Tdm.DataModuleDestroy(Sender: TObject);
begin
  dm.dbrestaurante.Connected := False;

  if Assigned(RealDaoExecute) then
  begin
    RealDaoExecute.Connection.connected := false;
    RealDaoExecute.free;
  end;

  FreeAndNil(tabelaPrecoAtual);
  FreeAndNil(IdSSLIOHandlerSocketOpenSSL1);
  FreeAndNil(LogStrings);
  FreeAndNil(GDadosAPIReplicacao);
  FreeAndNil(LImageServerParams);
end;

procedure Tdm.ListarArquivos(Diretorio: string; Sub: Boolean; lista: TStrings);
var
  F: TSearchRec;
  Ret: Integer;
  TempNome: string;
begin

  Ret := FindFirst(Diretorio + '\*.*', faAnyFile, F);
  try
    while Ret = 0 do
    begin
      if TemAtributo(F.Attr, faDirectory) then
      begin
        if (F.Name <> '.') and (F.Name <> '..') then
          if Sub = True then
          begin
            TempNome := Diretorio + '\' + F.Name;
            ListarArquivos(TempNome, True, lista);
          end;
      end
      else
      begin
        lista.Add(Diretorio + '\' + F.Name);
//       lista.Add(F.Name);
      end;
      Ret := FindNext(F);
    end;
  finally
    begin
      FindClose(F);
    end;
  end;

end;

function Tdm.verificaStatusNotasSefaz(chaveNFCE: string): Boolean;
begin
  inherited;

  parametrizaAcbrNFE(moNFCe, False, True);
  dm.ACBrNFe1.NotasFiscais.Clear;
  dm.ACBrNFe1.WebServices.Consulta.NFeChave := chaveNFCE;
  dm.ACBrNFe1.WebServices.Consulta.Executar;

//   showmessage('Motivo: '+  trim(dm.ACBrNFe1.WebServices.Consulta.XMotivo));


  if (Trim(dm.ACBrNFe1.WebServices.Consulta.XMotivo) = 'Autorizado o uso da NF-e') then
  begin
    dm.qryauxiliar2.Active := False;
    dm.qryauxiliar2.sql.clear;
    dm.qryauxiliar2.sql.add('update vendas v set  v.consulta_ok=1, v.protocolo_nfce =' + QuotedStr(dm.ACBrNFe1.WebServices.Consulta.Protocolo) + ' ,v.obs_nfce=' + QuotedStr(dm.ACBrNFe1.WebServices.Consulta.XMotivo));
    dm.qryauxiliar2.sql.add(' where v.chave_nfce=' + QuotedStr(chaveNFCE));
    dm.qryauxiliar2.ExecSQL;
    result := True;
  end
  else
  begin
    dm.qryauxiliar2.Active := False;
    dm.qryauxiliar2.sql.clear;
    dm.qryauxiliar2.sql.add('update vendas v set  v.consulta_ok=0, v.obs_nfce=' + QuotedStr(dm.ACBrNFe1.WebServices.Consulta.XMotivo));
    dm.qryauxiliar2.sql.add(' where v.chave_nfce=' + QuotedStr(chaveNFCE));
    dm.qryauxiliar2.ExecSQL;

    result := False;

  end;

  dm.transacao.Commit;
  dm.transacao.Active := False;
  dm.transacao.Active := True;

end;

procedure Tdm.habilitaCltrAltDel();
var
  reg: TRegistry;
begin
  // uses Registry
  // vamos criar uma instância da classe TRegistry
  reg := TRegistry.Create;

  // vamos abrir a chave que contém a entrada DisableTaskMgr
  reg.OpenKey('Software\Microsoft\Windows\CurrentVersion\Policies\system', True);

  // para habilitar basta excluir o valor da entrada
  reg.DeleteValue('DisableTaskMgr');
  reg.CloseKey;

  // vamos liberar o registro
  reg.Free;
end;

procedure Tdm.IdThreadComponent1BeforeRun(Sender: TIdThreadComponent);
begin
  nfceEnviada := False;
  terminouEnvioNFCE := False;
end;

procedure Tdm.IdThreadComponent1Run(Sender: TIdThreadComponent);
begin
  nfceEnviada := EnviaNFCE();
  IdThreadComponent1.Terminate;

end;

procedure Tdm.IdThreadComponent1Terminate(Sender: TIdThreadComponent);
begin
  terminouEnvioNFCE := True;
end;

procedure Tdm.desabilitaCltrAltDel();
var
  reg: TRegistry;
begin
  // uses Registry
  // vamos criar uma instância da classe TRegistry
  reg := TRegistry.Create;

  // vamos abrir a chave que contém a entrada DisableTaskMgr
  reg.OpenKey('Software\Microsoft\Windows\CurrentVersion\Policies\system', True);

  // vamos desabilitar o Gerenciador de Tarefas
  // se o valor fornecido for 1, o gerenciador será desabilitado
  reg.WriteString('DisableTaskMgr', '1');
  reg.CloseKey;

  // para habilitar basta excluir o valor da entrada
  //reg.DeleteValue('DisableTaskMgr');
  //reg.CloseKey;
  // vamos liberar o registro
  reg.Free;
end;

procedure Tdm.ComprimirArquivoZIP(ArquivoCompacto: TFileName; Arquivos: array of TFileName);
var
  FileInName: TFileName;
  FileEntrada, FileSaida: TFileStream;
  Compressor: TCompressionStream;
  NumArq, I, Len, Size: Integer;
  Fim: Byte;
begin

  FileSaida := TFileStream.Create(ArquivoCompacto, fmCreate or fmShareExclusive);

  Compressor := TCompressionStream.Create(clMax, FileSaida);

  NumArq := Length(Arquivos);

  Compressor.Write(NumArq, SizeOf(Integer));

  try

    for I := Low(Arquivos) to High(Arquivos) do
    begin

      FileEntrada := TFileStream.Create(Arquivos[I], fmOpenRead and fmShareExclusive);

      try

        FileInName := ExtractFileName(Arquivos[I]);

        Len := Length(FileInName);

        Compressor.Write(Len, SizeOf(Integer));

        Compressor.Write(FileInName[1], Len);

        Size := FileEntrada.Size;

        Compressor.Write(Size, SizeOf(Integer));

        Compressor.CopyFrom(FileEntrada, FileEntrada.Size);

        Fim := 0;

        Compressor.Write(Fim, SizeOf(Byte));

      finally

        FileEntrada.Free;

      end;

    end;

  finally

    FreeAndNil(Compressor);

    FreeAndNil(FileSaida);

  end;

end;

procedure Tdm.adicionalog(observacao: string);
var
  arq: TextFile;
  linha: string;
  nomeDoArquivo: string;
begin

  if (LDesativaCapturaLogs = false) then
  begin
    try

      observacao := FormatDateTime('HH:MM:SS', Time) + ' - ' + observacao;
      nomeDoArquivo := patchAplicacao + 'logs\' + FormatDateTime('YYY', Date) + '_' + FormatDateTime('MM', Date) + '_' + FormatDateTime('DD', Date) + '.log';
      AssignFile(arq, nomeDoArquivo);

      if not FileExists(nomeDoArquivo) then
        Rewrite(arq)
      else
        Append(arq);
      Writeln(arq, observacao);
      CloseFile(arq);
    finally

    end;
  end;

end;

procedure Tdm.adicionalogTEF(observacao: string);
var
  arq: TextFile;
  linha: string;
  nomeDoArquivo: string;
begin

  observacao := FormatDateTime('HH:MM:SS', Time) + ' - ' + observacao;
  nomeDoArquivo := patchAplicacao + 'logs\TEF_' + FormatDateTime('YYY', Date) + '_' + FormatDateTime('MM', Date) + '_' + FormatDateTime('DD', Date) + '.log';
  AssignFile(arq, nomeDoArquivo);

  if not FileExists(nomeDoArquivo) then
    Rewrite(arq)
  else
    Append(arq);

  Writeln(arq, observacao);
  CloseFile(arq);

end;

procedure Tdm.adicionalogSAT(observacao: string);
var
  arq: TextFile;
  linha: string;
  nomeDoArquivo: string;
begin
  observacao := FormatDateTime('HH:MM:SS', Time) + ' - ' + observacao;
  nomeDoArquivo := patchAplicacao + 'logs\SAT\' + FormatDateTime('YYY', Date) + '_' + FormatDateTime('MM', Date) + '_' + FormatDateTime('DD', Date) + '.log';
  AssignFile(arq, nomeDoArquivo);

  if not FileExists(nomeDoArquivo) then
    Rewrite(arq)
  else
    Append(arq);

  Writeln(arq, observacao);
  CloseFile(arq);
end;

procedure Tdm.setEstadoSimuladoECF(estado: tEstadoEcfSimulado);
begin
  estadoSimuladoEcf := estado;
end;

function Tdm.getEstadoSimuladoECF(): tEstadoEcfSimulado;
begin
  result := estadoSimuladoEcf;
end;

procedure Tdm.setOperacaoADMTEF(operacao: Boolean);
begin
  operacaoADMTEF := operacao;
end;

procedure Tdm.setTipoOperacaoTEF(tipo: SmallInt);
begin
  tipoOperacaoTEF := tipo;
end;

function Tdm.getTipoOperacaoTEF(): SmallInt;
begin
  result := tipoOperacaoTEF;
end;

function Tdm.autenticaTEF(): Boolean;
var
  resultadoAutenticacao, pdv: Integer;
  cnpj, chaveAutenticacao: string;
begin
  ACBrTEFD1.EsperaSleep := 250;
  ACBrTEFD1.EsperaSTS := 9;

  if (VerificaConexaoInternet = False) then
  begin
    exibe_painel_erro('Internet indisponível. Verifique a conexão', 'Ok');
    result := False;
    Exit;
  end;

  try
    dm.ACBrTEFD1.DesInicializar(gpTefDial);
  except
    begin
      TEFAutenticou := False;
      exibe_painel_erro('Erro ao DesInicializar o servidor de TEF!', 'Ok');
      Exit;
    end;
  end;

  try
    dm.ACBrTEFD1.Inicializar(gpTefDial);
    TEFAutenticou := True;
  except
    begin
      TEFAutenticou := False;
      exibe_painel_erro('Não foi possível conectar ao servidor de TEF!', 'Ok');
      Exit;
    end;
  end;

  result := TEFAutenticou;

end;

function Tdm.Converte(cmd: string): string;
var
  A: Integer;
begin
  result := '';
  for A := 1 to Length(cmd) do
  begin
    if not (cmd[A] in ['A'..'Z', 'a'..'z', '0'..'9', ' ', '.', ',', '/', '?', '<', '>', ';', ':', ']', '[', '{', '}', '\', '|', '=', '+', '-', '_', ')', '(', '*', '&', '^', '%', '$', '#', '@', '!', '~', ']']) then
      result := result + '#' + IntToStr(Ord(cmd[A])) + ' '
    else
      result := result + cmd[A] + ' ';
  end;
end;

procedure Tdm.balanca2LePeso(Peso: Double; Resposta: AnsiString);
var
  valid: Integer;
begin
  inherited;
//   showmessage(formatFloat('##0.000', Peso ));
  pesoLidoBalanca := FormatFloat('##0.000', Peso);
  respostaLeituraBalanca := Converte(Resposta);

  ////dm.adicionalog('Peso lido na funcao :' + pesoLidoBalanca);

  if Peso > 0 then
  begin
    sucessoLeituraPeso := True;
  end
  else
  begin
    valid := Trunc(balanca.UltimoPesoLido);
    case valid of
      0:
        begin
          dm.exibe_painel_erro('TimeOut !' + sLineBreak + 'Coloque o produto sobre a Balança!', 'Continuar');
          sucessoLeituraPeso := False;
        end;
      -1:
        begin
          dm.exibe_painel_erro('Peso Instavel ! ' + sLineBreak + 'Tente Nova Leitura', 'Continuar');
          sucessoLeituraPeso := False;
        end;
      -2:
        begin
          dm.exibe_painel_erro('Peso Negativo !', 'Continuar');
          sucessoLeituraPeso := False;
        end;
      -10:
        begin
          dm.exibe_painel_erro('Sobrepeso !', 'Continuar');
          sucessoLeituraPeso := False;
        end;
    end;
  end;
end;

procedure Tdm.balancaLePeso(Peso: Double; Resposta: AnsiString);
var
  valid: Integer;
begin
  inherited;
//   showmessage(formatFloat('##0.000', Peso ));
  pesoLidoBalanca := FormatFloat('##0.000', Peso);
  respostaLeituraBalanca := Converte(Resposta);

  ////dm.adicionalog('Peso lido na funcao :' + pesoLidoBalanca);

  if Peso > 0 then
  begin
    sucessoLeituraPeso := True;
    dm.adicionaLog('Peso lido: ' + pesoLidoBalanca);
  end
  else
  begin
    valid := Trunc(balanca.UltimoPesoLido);
    case valid of
      0:
        begin
          dm.exibe_painel_erro('TimeOut !' + sLineBreak + 'Coloque o produto sobre a Balança!', 'Continuar');
          sucessoLeituraPeso := False;
        end;
      -1:
        begin
          dm.exibe_painel_erro('Peso Instavel ! ' + sLineBreak + 'Tente Nova Leitura', 'Continuar');
          sucessoLeituraPeso := False;
        end;
      -2:
        begin
          dm.exibe_painel_erro('Peso Negativo !', 'Continuar');
          sucessoLeituraPeso := False;
        end;
      -10:
        begin
          dm.exibe_painel_erro('Sobrepeso !', 'Continuar');
          sucessoLeituraPeso := False;
        end;
    end;
  end;

end;

function Tdm.AnsiToUtf8(x: AnsiString): string;
  { Function that recieves ansi string and converts
    to UTF8 string }
var
  i: Integer;
  b1, b2: Byte;
begin
  result := x;
  for i := Length(result) downto 1 do
    if result[i] = #127 then
    begin
      b1 := $C0 or (Ord(result[i]) shr 6);
      b2 := $80 or (Ord(result[i]) and $3F);
      result[i] := chr(b1);
      Insert(chr(b2), result, i + 1);
    end;
end;

procedure Tdm.ExportaDatasetExcel(DataSet: TDataSet; Arq: string);
var
  ExcApp: OleVariant;
  i, l: Integer;
begin
  ExcApp := CreateOleObject('Excel.Application');
  ExcApp.Visible := True;
  ExcApp.WorkBooks.Add;
  DataSet.First;
  l := 1;
  //Adicionar titulos
  for i := 0 to DataSet.Fields.Count - 1 do
  begin

    ExcApp.WorkBooks[1].Sheets[1].Cells[l, i + 1] := DataSet.Fields[i].DisplayName;

  end;

  l := 2;
  DataSet.First;
  while not DataSet.EOF do
  begin
    for i := 0 to DataSet.Fields.Count - 1 do
      ExcApp.WorkBooks[1].Sheets[1].Cells[l, i + 1] := DataSet.Fields[i].DisplayText;
    DataSet.Next;
    l := l + 1;
  end;
  ExcApp.WorkBooks[1].SaveAs(Arq);
end;

function Tdm.getNCMProduto(tipoConsulta: SmallInt; codigo: string): string;
var
  q: TIBQuery;
  formato, str: string;
begin
  if dm.transLog.Active = False then
    dm.transLog.Active := True;
  q := TIBQuery.create(self);
  q.Database := dm.dbrestaurante;
  q.Transaction := dm.transLog;

  q.Active := False;
  q.SQL.Clear;

  q.SQL.Clear;

  if tipoConsulta = 0 then
    q.SQL.Add('select coalesce(ncm,' + QuotedStr('') + ') as resultado from produtos p where p.cod_barras=' + QuotedStr(codigo))
  else
    q.SQL.Add('select coalesce(ncm,' + QuotedStr('') + ') as resultado from produtos p where p.cod_produto=' + QuotedStr(codigo));

  adicionaLog(q.SQL.Text);

  q.Active := True;
  q.FetchAll;

  result := q.FieldByName('resultado').Value;

  FreeAndNil(q);
end;

function Tdm.getCFOPProduto(tipoConsulta: SmallInt; codigo: string): string;
var
  q: TIBQuery;
  formato, str: string;
begin
  if dm.transLog.Active = False then
    dm.transLog.Active := True;
  q := TIBQuery.create(self);
  q.Database := dm.dbrestaurante;
  q.Transaction := dm.transLog;

  q.Active := False;
  q.SQL.Clear;

  q.SQL.Clear;

  if tipoConsulta = 0 then
    q.SQL.Add('select coalesce(cfop_saida,' + QuotedStr('') + ') as resultado from produtos p where p.cod_barras=' + QuotedStr(codigo))
  else
    q.SQL.Add('select coalesce(cfop_saida,' + QuotedStr('') + ') as resultado from produtos p where p.cod_produto=' + QuotedStr(codigo));

  adicionaLog(q.SQL.Text);

  q.Active := True;
  q.FetchAll;

  result := q.FieldByName('resultado').Value;

  FreeAndNil(q);
end;

function Tdm.getCSTProduto(tipoConsulta: SmallInt; codigo: string): string;
var
  q: TIBQuery;
  formato, str: string;
begin
  if dm.transLog.Active = False then
    dm.transLog.Active := True;
  q := TIBQuery.create(self);
  q.Database := dm.dbrestaurante;
  q.Transaction := dm.transLog;

  q.Active := False;
  q.SQL.Clear;

  q.SQL.Clear;

  if tipoConsulta = 0 then
    q.SQL.Add('select coalesce(cst_saida,' + QuotedStr('') + ') as resultado from produtos p where p.cod_barras=' + QuotedStr(codigo))
  else
    q.SQL.Add('select coalesce(cst_saida,' + QuotedStr('') + ') as resultado from produtos p where p.cod_produto=' + QuotedStr(codigo));

  adicionaLog(q.SQL.Text);

  q.Active := True;
  q.FetchAll;

  result := q.FieldByName('resultado').Value;

  FreeAndNil(q);
end;

function Tdm.getCESTProduto(tipoConsulta: SmallInt; codigo: string): string;
var
  q: TIBQuery;
  formato, str: string;
begin
  if dm.transLog.Active = False then
    dm.transLog.Active := True;
  q := TIBQuery.create(self);
  q.Database := dm.dbrestaurante;
  q.Transaction := dm.transLog;

  q.Active := False;
  q.SQL.Clear;

  q.SQL.Clear;

  if tipoConsulta = 0 then
    q.SQL.Add('select coalesce(cest,' + QuotedStr('') + ') as resultado from produtos p where p.cod_barras=' + QuotedStr(codigo))
  else
    q.SQL.Add('select coalesce(cest,' + QuotedStr('') + ')as resultado from produtos p where p.cod_produto=' + QuotedStr(codigo));

  adicionaLog(q.SQL.Text);

  q.Active := True;
  q.FetchAll;
  result := q.FieldByName('resultado').Value;

  FreeAndNil(q);
end;

function Tdm.verificaSeErroNFEPermiteContingencia(erro: SmallInt; mensagem: string): SmallInt;
var
  q: TIBQuery;
  formato, str: string;
begin
  if dm.transLog.Active = False then
    dm.transLog.Active := True;
  q := TIBQuery.create(self);
  q.Database := dm.dbrestaurante;
  q.Transaction := dm.transLog;

  q.Active := False;
  q.SQL.Clear;

  q.SQL.Clear;
  q.SQL.Add('select * from ERROS_NFE where codigo=' + IntToStr(erro) + ' and catalogado=1');
  adicionaLog(q.SQL.Text);
  q.Active := True;
  q.FetchAll;

  if q.IsEmpty then
  begin
    adicionaLog('Erro ainda não catalogado');

    q.Active := False;
    q.SQL.Clear;
    q.SQL.Add('select * from ERROS_NFE where codigo=' + IntToStr(erro));
    q.Active := True;
    if q.IsEmpty = True then
    begin
      q.Active := False;
      q.SQL.Clear;
      q.SQL.Add('insert into erros_nfe (codigo,descricao,travar_emissao,catalogado) values (');
      q.sql.Add('' + IntToStr(erro) + ',');
      q.sql.Add('' + QuotedStr(mensagem) + ',');
      q.sql.Add('' + IntToStr(1) + ',');
      q.sql.Add('' + IntToStr(0) + ')');
      adicionaLog(q.SQL.Text);
      q.ExecSQL;

      if dm.transLog.Active = False then
        dm.transLog.Active := True;
      dm.transLog.Commit;
    end;

    result := -1;
  end
  else
  begin
    if q.FieldByName('TRAVAR_EMISSAO').Value = 1 then
      result := 0
    else
      result := 1;
  end;

  q.Active := False;
  FreeAndNil(q);
end;

function Tdm.EnviaNFCE(): Boolean;
var
  notaEnviada: Boolean;
  LMensagemErro: string;
  serie: Integer;
  numeroNF: Integer;
  segundosMensagem: SmallInt;
  codErroEnvioNota: SmallInt;
  retornoErroNFCE: SmallInt;
  LChaveNFCE: string;
  chaveNotaContingencia: string;
begin
  notaEnviada := False;
  adicionaLog('Inicia a emissão da nota online');
  setFormaEmissaoNFCE(StrToInt(dm.LeIni(1, 'NFCE', 'formaEmissaoOnline')));
  dm.gravaini('NFCE', 'formaEmissao', '1');
  ACBrNFe1.NotasFiscais[0].NFe.Ide.serie := getSerieNFCE();
  ACBrNFe1.NotasFiscais[0].NFe.Ide.nNF := 1;
  adicionaLog('Pegou o número ' + IntToStr(ACBrNFe1.NotasFiscais[0].NFe.Ide.nNF));

  if gerarEAssinarNFCE() then
  begin
    numeroNF := ACBrNFe1.NotasFiscais[0].NFe.Ide.nNF;
    ////dm.adicionalog('XML da NFC-e de número: ' + IntToStr(numeroNF));
    ////dm.adicionalog(dm.ACBrNFe1.NotasFiscais[0].xml);

    AdicionaNFCENaListaDeNotasParaCancelar(2);
    LChaveNFCE := Copy(dm.ACBrNFe1.NotasFiscais[0].NFe.infNFe.ID, 4, 60);

    try
      begin
        dm.ACBrNFe1.Enviar(dm.ACBrNFe1.NotasFiscais[0].NFe.Ide.nNF, False, nfceSincrona, True);
        adicionaLog('Enviou a a nota com a chave ' + Copy(dm.ACBrNFe1.NotasFiscais[0].NFe.infNFe.ID, 4, 60));
        notaEnviada := True;
        podeFecharFormMensagens := True;
      end;
    except
      on E: Exception do
      begin
        adicionaLog('     Ocorreu erro no envio da nota ' + Copy(dm.ACBrNFe1.NotasFiscais[0].NFe.infNFe.ID, 4, 60));
        LMensagemErro := ProcessarMensagemRejeicao(E.message);
        adicionaLog('          ' + LMensagemErro);
      end;
    end;

    if nfceSincrona then
    begin
      ////dm.adicionalog('Tipo do envio: Síncrono');
      codErroEnvioNota := ACBrNFe1.WebServices.Enviar.cStat;
      LMensagemErro := LMensagemErro; //ACBrNFe1.WebServices.Enviar.xMotivo;
    end
    else
    begin
      ////dm.adicionalog('Tipo do envio: Assíncrono');
      codErroEnvioNota := ACBrNFe1.WebServices.Retorno.cStat;
      LMensagemErro := LMensagemErro; //ACBrNFe1.WebServices.Retorno.xMsg;
    end;

    ////dm.adicionalog('Código de retorno envio ' + IntToStr(codErroEnvioNota));
    ////dm.adicionalog('Mensagem do envio: ' + mensagemErroEnvioNota);

    if codErroEnvioNota <> 100 then
    begin
      notaEnviada := False;
    end;

    if notaEnviada then
    begin
  //           RemoveNFCEDaListaDeNotasParaCancelar(2);
      result := True;
    end
    else
    begin
      retornoErroNFCE := verificaSeErroNFEPermiteContingencia(codErroEnvioNota, LMensagemErro);
      if retornoErroNFCE = 1 then
      begin

        ativarModoContingenciaOfflineNFCE();
        ////dm.adicionalog('Ativou a contingência automática');

        segundosMensagem := 2;
        tentandoEmissaoContingencia := True;
        frm_encerramento.SetMensagemPainelInformacoes('Emitindo em modo de contingência offline.', ' O Sistema não conseguiu se conectar com o servidor da SEFAZ.' + '´Possivelmente sua conexão está instável ou o servidor está congestionado.', segundosMensagem, 4, True);

        while (segundosMensagem >= 0) do
        begin

          frm_encerramento.SetMensagemPainelInformacoes('Emitindo em modo de contingência offline.', ' O Sistema não conseguiu se conectar com o servidor da SEFAZ.' + '´Possivelmente sua conexão está instável ou o servidor está congestionado.', segundosMensagem, 4, True);
          Sleep(1000);
          Application.ProcessMessages();
          segundosMensagem := segundosMensagem - 1;
        end;

        if enviaNFCEContingencia then
        begin
          chaveNotaContingencia := Copy(dm.ACBrNFe1.NotasFiscais[0].NFe.infNFe.ID, 4, 60);
          AtualizaChaveNotaSubstitutaCancelar(LChaveNFCE, chaveNotaContingencia);
          result := True;
        end
        else
        begin
          result := False;
        end;
        dm.tentandoEmissaoContingencia := False;

      end
      else
      begin

        if retornoErroNFCE = -1 then
        begin
                        // erro não catalogado!;
          frm_encerramento.SetMensagemPainelInformacoes('Erro não catalogado!', ' O sistema obteve um código de erro ainda não catalogado da Sefaz.' + LineBreak + LineBreak + 'Entre em contato Urgente com a Real Softwares e comunique o erro.' + LineBreak + LineBreak + 'Código: ' + IntToStr(codErroEnvioNota) + LineBreak + 'Erro: ' + LMensagemErro, 0, 2, False);
          result := False;

        end
        else
        begin
          frm_encerramento.SetMensagemPainelInformacoes('Erro no envio da NFC-e', ' Não foi possível enviar a nota. Verifique o erro' + ' reportado abaixo e proceda com as correções. Se tiver' + ' dúvidas, entre em contato com o suporte da Real Softwares' + LineBreak + LineBreak + LMensagemErro, 0, 2, False);
          result := False;

        end;
      end;

    end;

  end
  else
  begin

    result := False;
  end;

end;

function TDM.ProcessarMensagemRejeicao(const Mensagem: string): string;
var
  PosInicio, PosFim, nItem: Integer;
  NomeItem, CodigoItem: string;
begin
  // Procurar pela substring "[nItem:"
  PosInicio := Pos('[nItem:', Mensagem);
  if PosInicio > 0 then
  begin
    // Localizar o final da substring "[nItem:XXX]"
    PosFim := Pos(']', Copy(Mensagem, PosInicio, Length(Mensagem))) + PosInicio - 1;
    if PosFim > PosInicio then
    begin
      // Extrair o número do item
      nItem := StrToIntDef(Copy(Mensagem, PosInicio + 7, PosFim - PosInicio - 7), -1);

      if nItem > 0 then
      begin
        // Obter o índice correto (índice base 0 no Delphi)
        Dec(nItem);

        try
          // Obter o nome do item
          NomeItem := dm.ACBrNFe1.NotasFiscais[0].NFe.det[nItem].Prod.xProd;
          // Obter o código do item
          CodigoItem := dm.ACBrNFe1.NotasFiscais[0].NFe.det[nItem].Prod.cProd;

          // Formatar a mensagem com nome e código do item
          result := Format('%s no ítem "%s = código %s"', [Copy(Mensagem, 1, PosInicio - 1), NomeItem, CodigoItem]);
        except
          on E: Exception do
            result := 'Erro ao processar item: ' + E.Message;
        end;
      end
      else
        result := 'Erro: Número do item inválido.';
    end
    else
      result := 'Erro: Formato inválido para [nItem:XXX].';
  end
  else
    result := Mensagem; // Retornar a mensagem original se não encontrar "[nItem:XXX]"
end;

procedure Tdm.ativarModoContingenciaOfflineNFCE;
begin
  ////dm.adicionalog('Usuario: ' + nome_usuario + '  ativou o modo de contingência');
  dm.gravaini('NFCE', 'formaEmissao', '2');
  dm.gravaini('NFCE', 'forçarContingenciaOffline', '1');
  dm.gravaini('NFCE', 'dataHoraContingencia', DateToStr(Date));
  dm.gravaini('NFCE', 'qtdeEmitidasContingencia', IntToStr(0));
end;

procedure Tdm.desativarModoContingenciaOFFlineNFCE();
begin
  ////dm.adicionalog('Modo de contingência offline foi desabilitado');
  dm.gravaini('NFCE', 'forçarContingenciaOffline', '0');
  dm.gravaini('NFCE', 'qtdeEmitidasContingencia', IntToStr(0));

end;

procedure Tdm.AdicionaNFCENaListaDeNotasParaCancelar(modelo: Integer);
var
  codNFCE: Largeint;
  q: TIBQuery;
begin

  q := TIBQuery.Create(self);
  q.Database := DBRESTAURANTE;
  q.Transaction := transLog;
  dm.transLog.Active := True;

  try

    adicionaLog('Insere a nota na tabela de NFC-e emitidas');
    codNFCE := StrToInt(geraCodigo('G_NFCE_EMITIDAS', 9));
    q.Active := False;
    q.SQL.Clear;
    q.SQL.Add('insert into NFCE_EMITIDAS (codigo,modelo,chave,serie,numero,protocolo,xml_nota) values (' + QuotedStr(IntToStr(codNFCE)) + ',');
    q.SQL.Add('' + IntToStr(modelo) + ',');
    q.SQL.Add('' + QuotedStr(Copy(dm.ACBrNFe1.NotasFiscais[0].NFe.infNFe.ID, 4, 60)) + ',');
    q.SQL.Add('' + IntToStr(dm.ACBrNFe1.NotasFiscais[0].NFe.Ide.serie) + ',');
    q.SQL.Add('' + IntToStr(dm.ACBrNFe1.NotasFiscais[0].NFe.Ide.nNF) + ',');
    q.SQL.Add('' + QuotedStr(dm.ACBrNFe1.NotasFiscais[0].NFe.procNFe.nProt) + ',');
    q.SQL.Add('' + QuotedStr(dm.ACBrNFe1.NotasFiscais[0].xml) + ')');

    adicionaLog('                 ' + q.SQL.Text);
    try
      q.ExecSQL;
      dm.transLog.Commit;
    except
      on E: Exception do
      begin
        adicionaLog('Ocorreu um erro ao adcionar a nota na tabela de NFC-e emitidas');
        adicionaLog('    O erro foi ' + E.Message);

      end;
    end;

  finally
    FreeAndNil(q);
    transLog.Active := False;
  end;
end;

procedure Tdm.AtualizaChaveNotaSubstitutaCancelar(chaveParaCancelar: string; chaveNFCESubstituta: string);
var
  codNFCE: Largeint;
  q: TIBQuery;
begin

  q := TIBQuery.Create(self);
  q.Database := DBRESTAURANTE;
  q.Transaction := transLog;
  dm.transLog.Active := True;

  try

    q.Active := False;
    q.SQL.Clear;
    q.SQL.Add('update nfce_emitidas nf set nf.chave_nota_substituta=' + QuotedStr(chaveNFCESubstituta) + ' where nf.chave=' + QuotedStr(chaveParaCancelar));
    adicionaLog('                 ' + q.SQL.Text);
    try
      q.ExecSQL;
      dm.transLog.Commit;
    except
      on E: Exception do
      begin
        adicionaLog('Ocorreu um erro ao atualizar a chave da nota substituta');
        adicionaLog('    O erro foi ' + E.Message);

      end;
    end;

  finally
    FreeAndNil(q);
    transLog.Active := False;
  end;
end;

function Tdm.verificaSeUltimaNFCEConstaNasVendas(): Boolean;
var
  chaveUltimaNFCE: string;
begin

  result := False;
  dm.qryauxiliar.Active := False;
  dm.qryauxiliar.sql.Clear;
  dm.qryauxiliar.sql.Add('select CHAVE_ULTIMA from configuracoes_estacao where numero_caixa=' + QuotedStr(numero_caixa));
  dm.qryauxiliar.Active := True;

  if (dm.qryauxiliar.FieldByName('chave_ultima').Value <> Null) then
  begin
    chaveUltimaNFCE := Trim(dm.qryauxiliar.fieldbyname('chave_ultima').Value);

    if (chaveUltimaNFCE <> '') then
    begin
      dm.qryauxiliar.Active := False;
      dm.qryauxiliar.SQL.Clear;
      dm.qryauxiliar.SQL.add('select count(*) as ct from vendas v where v.chave_nfce=' + QuotedStr(chaveUltimaNFCE));
      dm.qryauxiliar.Active := True;

      if (dm.qryauxiliar.FieldByName('ct').Value = 0) then
      begin
        adicionaLog('Ultima NFC-e emitida não foi encontrada na tabela de vendas');
        result := False;
      end
      else
      begin
        adicionaLog('Ultima not foi encontrada na tabela de vendas');
        result := True;
      end;
    end
    else
    begin
      adicionaLog('Chave da última nota estava vazia!');
      result := True;

    end;

  end
  else
  begin
    adicionaLog('Campo da última nota estava nulo!');
    result := True;
  end;

end;

function Tdm.verificaSomaProporcoesPizza(): Boolean;
var
  somaProporcoes: Double;
  digitos: SmallInt;
begin

  dm.tbSaboresPizzaTemp.first;
  somaProporcoes := 0;
  digitos := 2;
  while not dm.tbSaboresPizzaTemp.Eof do
  begin
    somaProporcoes := dm.tbSaboresPizzaTempproporcao.Value + somaProporcoes;
    dm.tbSaboresPizzaTemp.Next;
  end;

  somaProporcoes := RoundABNT(somaProporcoes, digitos);
  if (somaProporcoes <> 1) then
  begin
    result := False;
  end
  else
  begin
    result := True;
  end;
end;

procedure Tdm.dbrestauranteIdleTimer(Sender: TObject);
begin
  Application.ProcessMessages;
end;

function Tdm.inicializarSAT(): Boolean;
begin
  with dm.sat do
  begin
    modelo := satDinamico_stdcall;
    ArqLOG := patchAplicacao + 'logs\SAT\' + FormatDateTime('YYY', Date) + '_' + FormatDateTime('MM', Date) + '_' + FormatDateTime('DD', Date) + '.log';
    NomeDLL := patchAplicacao + 'DLL\SAT\TANCA\SAT.DLL';
    Config.ide_numeroCaixa := StrToInt(numero_caixa);

    case StrToInt(dm.LeIni(1, 'SAT', 'ambienteEmissao')) of
      1:
        begin
          Config.ide_tpAmb := taHomologacao;
        end;
      2:
        begin
          Config.ide_tpAmb := taProducao;
        end;
    end;

    Config.ide_CNPJ := dm.tb_parametrosCNPJ_SWHOUSE.Value;
    Config.emit_CNPJ := dm.tb_parametrosCNPJ.Value;
    Config.emit_IE := dm.tb_parametrosIE.Value;
    Config.emit_IM := '';

    if simplesNacional then
      Config.emit_cRegTrib := RTSimplesNacional
    else
      Config.emit_cRegTrib := RTRegimeNormal;

    Config.emit_cRegTribISSQN := RTISSNenhum;
    Config.emit_indRatISSQN := irNao;
    Config.PaginaDeCodigo := 0;
    Config.EhUTF8 := False;
    Config.infCFe_versaoDadosEnt := StringToFloat('0.07');

//   localArquivoTemporario  := dm.LeIni(2,'NFCE','caminhoArquivosXML')+'\'+FormatDateTime('YYYMM',data_do_sistema  )+'\temp\';
  // localArquivoDefinitivo := dm.LeIni(2,'NFCE','caminhoArquivosXML')+'\'+FormatDateTime('YYYMM',data_do_sistema  )+'\';

    ConfigArquivos.PastaEnvio := dm.LeIni(2, 'SAT', 'caminhoArquivosXML') + '\' + FormatDateTime('YYYMM', data_do_sistema) + '\temp\';
    ConfigArquivos.PastaCFeVenda := dm.LeIni(2, 'SAT', 'caminhoArquivosXML') + '\' + FormatDateTime('YYYMM', data_do_sistema) + '';
//    ConfigArquivos.PastaCFeCancelamento :=
    ConfigArquivos.SalvarCFe := True;
    ConfigArquivos.SalvarCFeCanc := True;
    ConfigArquivos.SalvarEnvio := True;
    ConfigArquivos.SepararPorCNPJ := False;
    ConfigArquivos.SepararPorMes := False;
    CFe.IdentarXML := True;
    CFe.TamanhoIdentacao := 3;
    Inicializado := True;

  end;

end;

function Tdm.enviarCupomSat(): Boolean;
var
  retornoSat: Integer;
  mensagem: string;
begin
  frm_principal.memo_avisos.Lines.Clear;
  frm_principal.Visible := True;
  frm_principal.memo_avisos.Lines.text := dm.sat.CFe.GerarXML(True);
  ////dm.adicionalog(frm_principal.memo_avisos.Lines.Text);
  dm.sat.EnviarDadosVenda(frm_principal.memo_avisos.Lines.Text);

  retornoSat := dm.sat.Resposta.codigoDeRetorno;

  case retornoSat of
    6000:
      begin
        result := True;
      end;

    6001:
      begin
        mensagem := 'Código de ativação do SAT inválido!';
        result := False;
      end;

    6002:
      begin
        mensagem := 'SAT ainda não ativado!';
        result := False;
      end;

    6003:
      begin
        mensagem := 'SAT não vinculado ao AC';
        result := False;
      end;

    6004:
      begin
        mensagem := 'Vinculação do AC não confere';
        result := False;
      end;

    6005:
      begin
        mensagem := 'Tamanho do CFe superior a 1500KB';
        result := False;
      end;

    6006:
      begin
        mensagem := 'SAT bloqueado pelo contribuinte';
        result := False;
      end;

    6007:
      begin
        mensagem := 'SAT bloqueado pela SEFAZ';
        result := False;
      end;

    6008:
      begin
        mensagem := ' SAT bloqueado por falta de comunicação';
        result := False;
      end;

    6009:
      begin
        mensagem := 'SAT bloqueado, código de ativação incorreto';
        result := False;
      end;

    6010:
      begin
        mensagem := ' Erro de validação do conteúdo';
        result := False;
      end;

    6098:
      begin
        mensagem := 'SAT em processamento ou desligado. ';
        result := False;
      end;

    6099:
      begin
        mensagem := 'Erro desconhecido na emissão';
        result := False;
      end;
  end;

  if retornoSat <> 6000 then
  begin
    if (ShowRealDialog(frm_principal, tmConfirmacao, 'Confirme', 'Verificar LOG do SAT?') = teSim) then
    begin
      Application.CreateForm(TfrmConsultaInfSat, frmConsultaInfSat);
      frmConsultaInfSat.ShowModal;
      frmConsultaInfSat.Free;
    end;
  end;

end;

procedure Tdm.verificaErrosNFCEEmitidas();
var
  ts: TIBTransaction;
  q: TIBQuery;
  qupdate: TIBQuery;
begin

  ts := TIBTransaction.Create(Self);
  ts.Name := RandomName(8);
  ts.DefaultDatabase := dm.dbrestaurante;
  ts.Active := False;
  ts.Active := True;

  ////dm.adicionalog('Transacao erros notas emitidas ' + IntToStr(ts.TransactionID));

  q := TIBQuery.create(self);
  q.Database := dbrestaurante;
  q.Transaction := ts;
  q.sql.clear;

  qupdate := TIBQuery.create(self);
  qupdate.Database := dbrestaurante;
  qupdate.Transaction := ts;
  qupdate.sql.clear;

  q.Active := False;
  q.SQL.Clear;
  q.Active := False;
  q.SQL.clear;
  q.SQL.Add(' delete from nfce_emitidas nf where ');
  q.SQL.Add(' exists (   select *  from vendas  v   ');
  q.SQL.Add('  where v.modelo_comprovante = nf.modelo  ');
  q.SQL.Add('        and v.serie_nfce = nf.serie ');
  q.SQL.Add('        and v.numero_nfce = nf.numero) ');
  ////////dm.adicionalog(q.SQL.Text);
  q.ExecSQL;

  ts.Commit;
  ts.Active := False;

  q.Active := False;
  q.SQL.Clear;
  q.SQL.Add(' select * from nfce_emitidas nf ');
  q.SQL.Add('   where not exists ( ');
  q.SQL.Add('     select * from vendas v where ');
  q.SQL.Add('      v.modelo_comprovante=nf.modelo and ');
  q.SQL.Add('      v.serie_nfce = nf.serie and ');
  q.SQL.Add('      v.numero_nfce = nf.numero) ');
  q.Active := True;
  q.First;

  while not q.Eof do
  begin
    if (q.FieldByName('modelo').Value = 2) then
    begin
      dm.parametrizaAcbrNFE(moNFCe, False, True);
    end
    else
    begin
      dm.parametrizaAcbrNFE(moNFe, False, True);
    end;

    dm.ACBrNFe1.NotasFiscais.Clear;
    dm.ACBrNFe1.NotasFiscais.LoadFromString(q.FieldByName('xml_nota').Value, False);

    try
      dm.ACBrNFe1.Consultar;
      qupdate.Active := False;
      qupdate.SQL.Clear;
      qupdate.SQL.add(' update nfce_emitidas nf set ');
      qupdate.sql.add('    v.numero=' + IntToStr(dm.ACBrNFe1.NotasFiscais[0].NFe.Ide.nNF));
      qupdate.sql.add('   ,v.chave=' + QuotedStr(Copy(dm.ACBrNFe1.NotasFiscais[0].NFe.infNFe.ID, 4, 60)));
      qupdate.sql.add('   ,v.protocolo=' + QuotedStr(dm.ACBrNFe1.NotasFiscais[0].NFe.procNFe.nProt));
      qupdate.sql.add('   ,v.xml_nota=' + QuotedStr(dm.ACBrNFe1.NotasFiscais[0].xml) + ',');
      qupdate.sql.add('    v.retorno=' + IntToStr(dm.ACBrNFe1.WebServices.Consulta.cStat));
      qupdate.SQL.Add('  where v.codigo=' + QuotedStr(q.FieldByName('codigo').Value));

      ////dm.adicionalog('Executa atualização  do XML da NF-e emitida com erro');
        ////////dm.adicionalog(qupdate.SQL.Text);
      qupdate.ExecSQL;
    except
      on E: Exception do
      begin
        ////dm.adicionalog('NFE : ' + q.FieldByName('chave').Value);
        ////dm.adicionalog('Verificação de NFCE emitidas. Erro: ' + E.Message);
      end
    end;
    q.Next;
  end;
  ts.Commit;

  ts.Active := False;

  FreeAndNil(ts);
  FreeAndNil(q);
  FreeAndNil(qupdate);
end;

procedure Tdm.inserirXMLNotasDestinadas(xml: string);
var
  caminhoArquivo: string;
  ts: TIBTransaction;
  q: TIBQuery;
begin

  dm.parametrizaAcbrNFE(moNFe, False, True);
  dm.ACBrNFe1.NotasFiscais.LoadFromString(xml, False);

  if dm.ACBrNFe1.NotasFiscais[0].NFe.Dest.CNPJCPF <> CNPJ then
  begin
    ShowMessage('Empresa atual não é o destinatário desta nota!');
    Exit;

  end;

  ts := TIBTransaction.Create(Self);
  ts.Name := RandomName(8);
  ts.DefaultDatabase := dm.dbrestaurante;
  ts.Active := False;
  ts.Active := True;

  ////dm.adicionalog('Transacao Apaga notas acbr ' + IntToStr(ts.TransactionID));

  q := TIBQuery.create(self);
  q.Database := dbrestaurante;
  q.Transaction := ts;
  q.sql.clear;

  dm.ACBrNFe1.NotasFiscais[0].GravarXML(Copy(dm.ACBrNFe1.NotasFiscais[0].NFe.infNFe.ID, 4, 60) + '-nfe.xml', patchXMLEntradas);
  caminhoArquivo := patchXMLEntradas + Copy(dm.ACBrNFe1.NotasFiscais[0].NFe.infNFe.ID, 4, 60) + '-nfe.xml';

  ts.Active := True;
  q.SQL.Clear;
  q.Active := False;
  q.sql.Clear;
  q.SQL.Add(' select * from nfe_destinadas nf where nf.chave_nfe=' + QuotedStr(Copy(dm.ACBrNFe1.NotasFiscais[0].NFe.infNFe.ID, 4, 60)));
  q.Active := True;
  if q.IsEmpty then
  begin
    q.Active := False;
    q.sql.clear;
    q.sql.add('insert into NFE_DESTINADAS (cod_empressa, chave_nfe,cnpj,ie,nome_fornecedor,data_emissao,numero_nota,status_nfe,tipo_manifestacao,valor_nota,caminho_xml,xml_nota) values (');
    q.sql.add('' + QuotedStr(codEmpresa) + ',');
    q.sql.add('' + QuotedStr(Copy(dm.ACBrNFe1.NotasFiscais[0].NFe.infNFe.ID, 4, 60)) + ',');
    q.sql.add('' + QuotedStr(dm.ACBrNFe1.NotasFiscais[0].NFe.Emit.CNPJCPF) + ',');
    q.sql.add('' + QuotedStr(dm.ACBrNFe1.NotasFiscais[0].NFe.Emit.IE) + ',');
    q.sql.add('' + QuotedStr(UpperCase(dm.ACBrNFe1.NotasFiscais[0].NFe.Emit.xNome)) + ',');
    q.sql.add('' + QuotedStr(FormatDateTime('DD.MM.YY', dm.ACBrNFe1.NotasFiscais[0].NFe.Ide.dEmi)) + ',');
    q.sql.add('' + QuotedStr(FormatFloat('000000000000000', dm.ACBrNFe1.NotasFiscais[0].NFe.Ide.nNF)) + ',');
    q.sql.add('' + QuotedStr('0') + ',');
    q.sql.add(IntToStr(1) + ',');
    q.sql.add('' + dm.TrocaVirgPPto(FloatToStr(dm.ACBrNFe1.NotasFiscais[0].NFe.Total.ICMSTot.vNF)) + ',');
    q.sql.add('' + QuotedStr(caminhoArquivo) + ',');
    q.sql.add('' + QuotedStr(dm.ACBrNFe1.NotasFiscais[0].xml) + ')');
      ////////dm.adicionalog(q.SQL.Text);

    try
      q.ExecSQL;
    except
      begin
        ShowMessage('Erro ao inserir nota no banco!');
        frm_principal.memo_avisos.Lines.Clear;
        frm_principal.memo_avisos.Lines := q.SQL;
        frm_principal.memo_avisos.Visible := True;
           ////////dm.adicionalog(q.SQL.text);
        ts.Rollback;
        Exit;
      end;
    end;
  end;

  ts.Commit;

  FreeAndNil(ts);
  FreeAndNil(q);
end;

procedure Tdm.configuraImpressoraProducao(numeroImpressora: Integer);
begin

  if (dm.ACBrPosPrinter1 <> nil) then
  begin
    dm.ACBrPosPrinter1.Desativar;
    FreeAndNil(dm.ACBrPosPrinter1);
  end;

  dm.ACBrPosPrinter1 := TACBrPosPrinter.Create(self);

  case (StrToInt(LeIniImpressoes(2, 'IMPRESSORA_' + FormatFloat('000', numeroImpressora), 'marca'))) of
    1:
      ACBrPosPrinter1.Modelo := ppEscBematech;
    2:
      ACBrPosPrinter1.Modelo := ppEscEpsonP2;
    3:
      ACBrPosPrinter1.Modelo := ppEscPosEpson;
    4:
      ACBrPosPrinter1.Modelo := ppEscDaruma;
    5:
      ACBrPosPrinter1.Modelo := ppEscDiebold;
    6:
      ACBrPosPrinter1.Modelo := ppEscVox;
    7:
      ACBrPosPrinter1.Modelo := ppTexto;
  end;

  ACBrPosPrinter1.Device.Porta := LeIniImpressoes(2, 'IMPRESSORA_' + FormatFloat('000', numeroImpressora), 'porta');
  ACBrPosPrinter1.Device.Baud := StrToInt(LeIniImpressoes(2, 'IMPRESSORA_' + FormatFloat('000', numeroImpressora), 'velocidade'));
  ACBrPosPrinter1.TraduzirTags := True;

  case StrToInt(LeIniImpressoes(2, 'IMPRESSORA_' + FormatFloat('000', numeroImpressora), 'paridade')) of
    0:
      ACBrPosPrinter1.Device.Parity := pNone;
    1:
      ACBrPosPrinter1.Device.Parity := pEven;
    2:
      ACBrPosPrinter1.Device.Parity := pMark;
    3:
      ACBrPosPrinter1.Device.Parity := pOdd;
    4:
      ACBrPosPrinter1.Device.Parity := pSpace;
  end;

  case StrToInt(LeIniImpressoes(2, 'IMPRESSORA_' + FormatFloat('000', numeroImpressora), 'stopBits')) of
    1:
      ACBrPosPrinter1.Device.Stop := s1;
    2:
      ACBrPosPrinter1.Device.Stop := s1eMeio;
    3:
      ACBrPosPrinter1.Device.Stop := s2;
  end;

  case StrToInt(LeIniImpressoes(2, 'IMPRESSORA_' + FormatFloat('000', numeroImpressora), 'fluxo')) of
    0:
      ACBrPosPrinter1.Device.HandShake := hsNenhum;
    1:
      ACBrPosPrinter1.Device.HandShake := hsXON_XOFF;
    2:
      ACBrPosPrinter1.Device.HandShake := hsRTS_CTS;
    3:
      ACBrPosPrinter1.Device.HandShake := hsDTR_DSR;
  end;

  case StrToInt(LeIniImpressoes(2, 'IMPRESSORA_' + FormatFloat('000', numeroImpressora), 'paginaDeCodigo')) of
    0:
      ACBrPosPrinter1.PaginaDeCodigo := pc850;
    1:
      ACBrPosPrinter1.PaginaDeCodigo := pcNone;
    2:
      ACBrPosPrinter1.PaginaDeCodigo := pc437;
    3:
      ACBrPosPrinter1.PaginaDeCodigo := pc850;
    4:
      ACBrPosPrinter1.PaginaDeCodigo := pc852;
    5:
      ACBrPosPrinter1.PaginaDeCodigo := pc860;
    6:
      ACBrPosPrinter1.PaginaDeCodigo := pcUTF8;
    7:
      ACBrPosPrinter1.PaginaDeCodigo := pc1252;
  end;

  case StrToInt(LeIniImpressoes(2, 'IMPRESSORA_' + FormatFloat('000', numeroImpressora), 'colunas')) of
    0:
      dm.ACBrPosPrinter1.ColunasFonteNormal := 48;
    1:
      dm.ACBrPosPrinter1.ColunasFonteNormal := 48;
    2:
      dm.ACBrPosPrinter1.ColunasFonteNormal := 42;
  end;

end;

procedure Tdm.configuraImpressoraProducaoDelivery(numeroImpressora: Integer);
begin
  if (dm.ACBrPosPrinter1 <> nil) then
  begin
    dm.ACBrPosPrinter1.Desativar;
    FreeAndNil(dm.ACBrPosPrinter1);
  end;

  dm.ACBrPosPrinter1 := TACBrPosPrinter.Create(self);

  case (StrToInt(LeIniImpressoesDelivery(2, 'IMPRESSORA_' + FormatFloat('000', numeroImpressora), 'marca'))) of
    1:
      ACBrPosPrinter1.Modelo := ppEscBematech;
    2:
      ACBrPosPrinter1.Modelo := ppEscEpsonP2;
    3:
      ACBrPosPrinter1.Modelo := ppEscPosEpson;
    4:
      ACBrPosPrinter1.Modelo := ppEscDaruma;
    5:
      ACBrPosPrinter1.Modelo := ppEscDiebold;
    6:
      ACBrPosPrinter1.Modelo := ppEscVox;
    7:
      ACBrPosPrinter1.Modelo := ppTexto;
  end;

  ACBrPosPrinter1.Device.Porta := LeIniImpressoesDelivery(2, 'IMPRESSORA_' + FormatFloat('000', numeroImpressora), 'porta');
  ACBrPosPrinter1.Device.Baud := StrToInt(LeIniImpressoesDelivery(2, 'IMPRESSORA_' + FormatFloat('000', numeroImpressora), 'velocidade'));
  ACBrPosPrinter1.TraduzirTags := True;

  case StrToInt(LeIniImpressoesDelivery(2, 'IMPRESSORA_' + FormatFloat('000', numeroImpressora), 'paridade')) of
    0:
      ACBrPosPrinter1.Device.Parity := pNone;
    1:
      ACBrPosPrinter1.Device.Parity := pEven;
    2:
      ACBrPosPrinter1.Device.Parity := pMark;
    3:
      ACBrPosPrinter1.Device.Parity := pOdd;
    4:
      ACBrPosPrinter1.Device.Parity := pSpace;
  end;

  case StrToInt(LeIniImpressoesDelivery(2, 'IMPRESSORA_' + FormatFloat('000', numeroImpressora), 'stopBits')) of
    1:
      ACBrPosPrinter1.Device.Stop := s1;
    2:
      ACBrPosPrinter1.Device.Stop := s1eMeio;
    3:
      ACBrPosPrinter1.Device.Stop := s2;
  end;

  case StrToInt(LeIniImpressoesDelivery(2, 'IMPRESSORA_' + FormatFloat('000', numeroImpressora), 'fluxo')) of
    0:
      ACBrPosPrinter1.Device.HandShake := hsNenhum;
    1:
      ACBrPosPrinter1.Device.HandShake := hsXON_XOFF;
    2:
      ACBrPosPrinter1.Device.HandShake := hsRTS_CTS;
    3:
      ACBrPosPrinter1.Device.HandShake := hsDTR_DSR;
  end;

  case StrToInt(LeIniImpressoesDelivery(2, 'IMPRESSORA_' + FormatFloat('000', numeroImpressora), 'paginaDeCodigo')) of
    0:
      ACBrPosPrinter1.PaginaDeCodigo := pc850;
    1:
      ACBrPosPrinter1.PaginaDeCodigo := pcNone;
    2:
      ACBrPosPrinter1.PaginaDeCodigo := pc437;
    3:
      ACBrPosPrinter1.PaginaDeCodigo := pc850;
    4:
      ACBrPosPrinter1.PaginaDeCodigo := pc852;
    5:
      ACBrPosPrinter1.PaginaDeCodigo := pc860;
    6:
      ACBrPosPrinter1.PaginaDeCodigo := pcUTF8;
    7:
      ACBrPosPrinter1.PaginaDeCodigo := pc1252;
  end;

  case StrToInt(LeIniImpressoesDelivery(2, 'IMPRESSORA_' + FormatFloat('000', numeroImpressora), 'colunas')) of
    0:
      dm.ACBrPosPrinter1.ColunasFonteNormal := 48;
    1:
      dm.ACBrPosPrinter1.ColunasFonteNormal := 48;
    2:
      dm.ACBrPosPrinter1.ColunasFonteNormal := 42;
  end;
  dm.ACBrPosPrinter1.LinhasEntreCupons := StrToInt(LeIniImpressoesDelivery(2, 'IMPRESSORA_' + FormatFloat('000', numeroImpressora), 'linhasEntreCupons'))

end;

procedure Tdm.imprimeCabecalhoPedido(strComprovante: TStringList; horaPedido: TDateTime; AMesa, garcom, guidSeq: string; via: SmallInt);
var
  nSeq: string;
  hPedido, hImpressao: string;
begin
  nSeq := geraCodigo('G_FILA_IMPRESSAO', 5);
  hPedido := Trim(FormatDateTime('DD/MM/YYY HH:MM:SS', horaPedido));
  hImpressao := Trim(FormatDateTime('DD/MM/YYY HH:MM:SS', Now));

  strComprovante.Clear;
  strComprovante.add('</zera>');
  strComprovante.add('</ce><e>' + nome_fantasia + '</e>');
  strComprovante.add('<n></linha_dupla></N>');
//   strComprovante.add('<e>'+PadCenter(nome_fantasia,24,' ')  +'</e>');
  strComprovante.add('<e><a>' + 'MESA: ' + Inttostr(StrToInt(AMesa)) + '</a></e>');
  strComprovante.add('<e>' + PadCenter('PEDIDO ' + nSeq, 24, ' ') + '</e>');
  strComprovante.add('<ae><N><e>' + 'VIA: ' + IntToStr(via) + '</e></n></Ae>');
  strComprovante.add('</ae></fn>Hora Pedido: ' + hPedido + '</Ae>');
  strComprovante.add('</ae></fn>Hora impressão: ' + hImpressao + '</Ae>');
  strComprovante.add('</fn>Sequencia: </ae>' + guidSeq + ' - (Windows)');
  strComprovante.add('</fn></ae>Garçom: ' + garcom);
  strComprovante.add('<n></linha_dupla></N>');
end;

procedure Tdm.imprimeCabecalhoPedidoBalcao(strComprovante: TStringList; ANomeCliente: string; via: SmallInt);
var
  nSeq: string;
  hPedido, hImpressao: string;
begin
  nSeq := geraCodigo('G_FILA_IMPRESSAO', 5);
  hPedido := Trim(FormatDateTime('DD/MM/YYY HH:MM:SS', Now));

  strComprovante.Clear;
  strComprovante.add('</zera>');
  strComprovante.add('</ce><e>' + nome_fantasia + '</e>');
  strComprovante.add('<n></linha_dupla></N>');
//   strComprovante.add('<e>'+PadCenter(nome_fantasia,24,' ')  +'</e>');
  strComprovante.add('<e><a>' + PadCenter('PEDIDO BALCÃO', 24, ' ') + '</a></e>');

  if Trim(ANomeCliente) <> '' then
  begin
    strComprovante.add('<n></linha_dupla></N>');
    strComprovante.add('</ae></fn>Nome do Cliente / Comanda </Ae>');
    strComprovante.add('</ce><a><in><e>' + ANomeCliente + '</e></in></a>');
    strComprovante.add('<n></linha_dupla></N>');
  end;

//   strComprovante.add('<ae><N><e>'+'Mesa: '+mesa+'</e></n></Ae>');
  strComprovante.add('<ae><N><e>' + 'VIA: ' + IntToStr(via) + '</e></n></Ae>');
  strComprovante.add('</ae></fn>Hora Pedido: ' + hPedido + '</Ae>');
  strComprovante.add('</ae></fn>Hora impressão: ' + hImpressao + '</Ae>');
//   strComprovante.add('</fn>Sequencia: </ae>'+guidSeq+' - (Windows)');
  strComprovante.add('<n></linha_dupla></N>');
end;

procedure Tdm.imprimeCabecalhoPedidoDeliveryProducao(ACodPedido: string; AIdPedidoIntegracao: LargeInt; evento: SmallInt; strComprovante: TStringList; AViaPedido: SmallInt; AQueryPedido: TIBQuery);
var
  nSeq: string;
  hPedido, hImpressao: string;
  LLocalizadorPlataforma: largeint;
  LSQL: TStringList;
  LMemTable: TFDMemTable;
begin

  LSQL := TStringList.Create;
  LMemTable := TFDMemTable.Create(Self);

  try
    try
      nSeq := geraCodigo('G_FILA_IMPRESSAO', 5);
      hPedido := Trim(FormatDateTime('DD/MM/YYY HH:MM:SS', Now));
      hImpressao := Trim(FormatDateTime('DD/MM/YYY HH:MM:SS', Now));
      strComprovante.Clear;
      strComprovante.add('</zera>');

      strComprovante.add('<n></linha_dupla></N>');
      strComprovante.add('</ce><e>' + nome_fantasia + '</e>');

      case evento of
        1:
          begin
            strComprovante.add('<n></linha_dupla></N>');
            strComprovante.add('<e><a>DELIVERY</a></e>');
          end;

        2:
          begin
            strComprovante.add('<n></linha_dupla></N>');
            strComprovante.add('<e><a><a><in><e>' + '* ALTERAR DELIVERY* ' + '</a></e></e></in></a>');

          end;

        3:
          begin
            strComprovante.add('<n></linha_dupla></N>');
            strComprovante.add('<a><in><e>' + '* CANCELAR  DELIVERY* ' + '</e></in></a>');
          end;
      end;

      strComprovante.add('<in></ce><e> Pedido nº ' + IntToStr(StrToInt(ACodPedido)) + '</e></in>');
      strComprovante.add('</ce><ae><N><e>' + 'VIA: ' + IntToStr(AViaPedido) + '</e></n></Ae>');

      if AQueryPedido.FieldByName('retira_balcao').Value = 1 then
        strComprovante.add('<a><in><e>' + '* RETIRAR NO BALCÃO* ' + '</e></in></a>');

      strComprovante.add('<n></linha_dupla></N>');

      if AIdPedidoIntegracao <> 0 then
      begin
        if (imprimeDadosPlataformaProducaoDelivery = true) then
        begin
          LSQL.Clear;
          LSQL.Add('  select ip.id, ip.id_reduzido_plataforma as idPlataforma, ip.localizador   from integracoes_pedidos ip');
          LSQL.Add('      where ip.id =' + Inttostr(AIdPedidoIntegracao));
          dm.getMemTable(LMemTable, LSQL.Text);
          if LMemTable.IsEmpty = false then
          begin
            strComprovante.add('</fn></ce><n>DADOS DA PLATAFORMA</N>');
            LLocalizadorPlataforma := LMemTable.FieldByName('localizador').Value;
            AIdPedidoIntegracao := LMemTable.FieldByName('idPlataforma').Value;
            strComprovante.add('</ae><e>ID  : #' + IntToStr(AIdPedidoIntegracao) + '</e>');
            strComprovante.add('</ae><e>Localizador:  ' + IntToStr(LLocalizadorPlataforma) + '</e>');
            strComprovante.add('</ae><n></linha_simples></N>');
          end;
        end;
      end;

      strComprovante.add('</ae></fn>Cliente: ' + AQueryPedido.fieldbyname('cod_cli').Value + ' - ' + AQueryPedido.fieldbyname('nomeCliente').Value + '</Ae>');
      if imprimeEnderecoNaProducaoDelivery then
      begin
        strComprovante.add('</ae></fn>Endereço: ' + AQueryPedido.fieldbyname('endereco').Value + '</Ae>');
        strComprovante.add('</ae></fn>Bairro:   ' + AQueryPedido.fieldbyname('bairro').Value + '</Ae>');
      end;

      strComprovante.add('</ae></fn>Hora Pedido:    ' + hPedido + '</Ae>');
      strComprovante.add('</ae></fn>Hora impressão: ' + hImpressao + '</Ae>');
      strComprovante.add('</ae></fn>Lançado por:    ' + AQueryPedido.fieldbyname('usuario').Value + '</Ae>');
      strComprovante.add('</ae></fn>Estação:       ' + AQueryPedido.fieldbyname('numero_caixa').Value + '</Ae>');
      strComprovante.add('<n></linha_dupla></N>');
    except
      on E: Exception do
      begin

      end;
    end;

  finally
    FreeAndNil(LMemTable);
    FreeAndNil(LSQL);
  end;

end;

procedure Tdm.imprimePedidoProducao(sequenciaImpressao: string);
var
  qMovtoMesa: TIBQuery;
  qryImpressoraProducao: TIBQuery;
  ts: TIBTransaction;
  dataHoraLancamento: TDateTimeField;
  nomeImpressora: string;
  ctLinhasFimCupom: SmallInt;
  ctViasPedido: SmallInt;
  qtdeProduto: string;
  descricaoProduto: string;
  strComprovante: TStringList;
begin

  strComprovante := TStringList.Create;

  ts := TIBTransaction.Create(Self);
  ts.Name := RandomName(8);
  ts.DefaultDatabase := dm.dbrestaurante;
  ts.Active := False;
  ts.Active := True;

  qMovtoMesa := TIBQuery.Create(Self);
  qMovtoMesa.Name := 'Movto' + IntToStr(Random(8));
  qMovtoMesa.Database := dbrestaurante;
  qMovtoMesa.Transaction := ts;

  qryImpressoraProducao := TIBQuery.Create(Self);
  qryImpressoraProducao.Name := 'Printer' + IntToStr(Random(8));
  qryImpressoraProducao.Database := dbrestaurante;
  qryImpressoraProducao.Transaction := ts;

  try
    qryImpressoraProducao.Active := False;
    qryImpressoraProducao.SQL.Clear;
    qryImpressoraProducao.SQL.Add(' select * from miniprinters mp ');
    qryImpressoraProducao.SQL.Add('    where mp.cod_miniprinter <> ' + QuotedStr('001'));
    qryImpressoraProducao.SQL.Add('    order by mp.cod_miniprinter ');
    qryImpressoraProducao.Active := True;

    qryImpressoraProducao.First;

    while not qryImpressoraProducao.eof do
    begin
      for ctViasPedido := 1 to qryImpressoraProducao.FieldByName('vias').Value do
      begin
        strComprovante.Clear;
        qMovtoMesa.Active := False;
        qMovtoMesa.SQL.Clear;
        qMovtoMesa.SQL.Add(' select  ');
        qMovtoMesa.SQL.Add('         ms.cod_mesa, p.descricao, ms.quantidade, ms.valor_unitario, ms.id,');
        qMovtoMesa.SQL.Add('         ms.cod_garcon, ms.hora_lancamento,ms.numero_caixa,');
        qMovtoMesa.SQL.Add('         ms.observacoes, ms.tipo_massa,ms.sabores,');
        qMovtoMesa.SQL.Add('         g.apelido as garcom,');
        qMovtoMesa.SQL.Add('         mp.marca, mp.modelo, mp.corta_papel');
        qMovtoMesa.SQL.Add('     from movimento_mesa ms');
        qMovtoMesa.SQL.Add('      inner join produtos p on (p.cod_produto = ms.cod_produto)');
        qMovtoMesa.SQL.Add('      inner join miniprinters  mp on (mp.cod_miniprinter = p.cod_miniprinter)');
        qMovtoMesa.SQL.Add('      inner join garcons g on (g.cod_garcon = ms.cod_garcon)');
        qMovtoMesa.SQL.Add('        where ms.seq_impressao = ' + QuotedStr(sequenciaImpressao));
        qMovtoMesa.SQL.add(' and p.cod_miniprinter=' + QuotedStr(qryImpressoraProducao.FieldByName('cod_miniprinter').Value));
        qMovtoMesa.Active := True;
        qMovtoMesa.First;

        if (qMovtoMesa.IsEmpty = False) then
        begin
          imprimeCabecalhoPedido(strComprovante, qMovtoMesa.fieldbyname('hora_lancamento').AsDateTime, qMovtoMesa.fieldbyname('cod_mesa').Value, qMovtoMesa.fieldbyname('garcom').Value, sequenciaImpressao, ctViasPedido);

          while not qMovtoMesa.Eof do
          begin
            if (Frac(qMovtoMesa.FieldByName('quantidade').Value) > 0) then
              qtdeProduto := FormatFloat('#0.000', qMovtoMesa.FieldByName('quantidade').Value)
            else
              qtdeProduto := IntToStr(StrToInt(qMovtoMesa.FieldByName('quantidade').AsString));

            strComprovante.add('<n><e></ae>' + qtdeProduto + '  ' + '</ad>' + qMovtoMesa.FieldByName('descricao').Value + '</e></N><C> (id: ' + qMovtoMesa.FieldByName('id').asstring + ')</C>');
            if (Trim(qMovtoMesa.FieldByName('sabores').Value) <> '') then
            begin

              strComprovante.Add('#' + qMovtoMesa.FieldByName('tipo_massa').Value + '#');
              strComprovante.Add('**SABOR(ES):');
              strComprovante.add('<e></ae>' + qMovtoMesa.FieldByName('SABORES').Value + '</e>');
              strComprovante.Add('**');
            end;

            if (Trim(qMovtoMesa.FieldByName('observacoes').Value) <> '') then
            begin
              strComprovante.Add('** Observações:');
              strComprovante.add('<e></ae>' + qMovtoMesa.FieldByName('observacoes').Value + '</e>');
            end;

            strComprovante.Add('</linha_simples>');
            qMovtoMesa.Next;
          end;

          for ctLinhasFimCupom := 1 to StrToInt(LeIniImpressoes(2, 'IMPRESSORA_' + FormatFloat('000', qryImpressoraProducao.fieldbyname('cod_miniprinter').Value), 'linhasAposCupom')) do
          begin
            strComprovante.add(' ');
          end;

          configuraImpressoraProducao(qryImpressoraProducao.fieldbyname('cod_miniprinter').Value);
          imprimeTextoACBR(strComprovante);

          adicionaLog(strComprovante.Text);
        end;

      end;
      qryImpressoraProducao.Next;
    end;

    try
      qMovtoMesa.active := False;
      qMovtoMesa.SQL.Clear;
      qMovtoMesa.SQL.Add('update movimento_mesa ms set ms.impresso=1 where ms.seq_impressao=' + QuotedStr(sequenciaImpressao));
        ////////dm.adicionalog(qMovtoMesa.SQL.Text);
      qMovtoMesa.ExecSQL;
    except
      begin
        ShowMessage('Erro ao atualizar flag de impressão!');
      end;

    end;
  finally
    ts.Commit;
    strComprovante.Clear;

    qMovtoMesa.Active := False;
    FreeAndNil(qMovtoMesa);

    qryImpressoraProducao.Active := False;
    FreeAndNil(qryImpressoraProducao);

    FreeAndNil(ts);
    FreeAndNil(strComprovante);
  end;

end;

procedure Tdm.imprimePedidoProducaoBalcao(ANumeroMesaBalcao: string; ANomeClienteBalcao: string);
var
  qMovtoMesa: TIBQuery;
  qryImpressoraProducao: TIBQuery;
  ts: TIBTransaction;
  dataHoraLancamento: TDateTimeField;
  nomeImpressora: string;
  ctLinhasFimCupom: SmallInt;
  ctViasPedido: SmallInt;
  qtdeProduto: string;
  descricaoProduto: string;
  strComprovante: TStringList;
begin

  strComprovante := TStringList.Create;

  ts := TIBTransaction.Create(Self);
  ts.Name := RandomName(8);
  ts.DefaultDatabase := dm.dbrestaurante;
  ts.Active := False;
  ts.Active := True;

  qMovtoMesa := TIBQuery.Create(Self);
  qMovtoMesa.Name := 'Movto' + IntToStr(Random(8));
  qMovtoMesa.Database := dbrestaurante;
  qMovtoMesa.Transaction := ts;

  qryImpressoraProducao := TIBQuery.Create(Self);
  qryImpressoraProducao.Name := 'Printer' + IntToStr(Random(8));
  qryImpressoraProducao.Database := dbrestaurante;
  qryImpressoraProducao.Transaction := ts;

  try
    qryImpressoraProducao.Active := False;
    qryImpressoraProducao.SQL.Clear;
    qryImpressoraProducao.SQL.Add(' select * from miniprinters mp ');
    qryImpressoraProducao.SQL.Add('    where mp.cod_miniprinter <> ' + QuotedStr('001'));
    qryImpressoraProducao.SQL.Add('    order by mp.cod_miniprinter ');
    qryImpressoraProducao.Active := True;

    qryImpressoraProducao.First;

    while not qryImpressoraProducao.eof do
    begin
      for ctViasPedido := 1 to qryImpressoraProducao.FieldByName('vias').Value do
      begin
        strComprovante.Clear;
        qMovtoMesa.Active := False;
        qMovtoMesa.SQL.Clear;
        qMovtoMesa.SQL.Add(' select  ');
        qMovtoMesa.SQL.Add('         ms.cod_mesa, p.descricao, ms.quantidade, ms.valor_unitario, ms.id,');
        qMovtoMesa.SQL.Add('        ms.cod_garcon, ms.hora_lancamento,ms.numero_caixa,');
        qMovtoMesa.SQL.Add('         coalesce(ms.observacoes,' + Quotedstr('') + ') as observacoes, ms.tipo_massa,coalesce(ms.sabores,' + Quotedstr('') + ') as sabores,');
        qMovtoMesa.SQL.Add('        g.apelido as garcom,');
        qMovtoMesa.SQL.Add('        mp.marca, mp.modelo, mp.corta_papel');
        qMovtoMesa.SQL.Add('     from movimento_mesa ms');
        qMovtoMesa.SQL.Add('      inner join produtos p on (p.cod_produto = ms.cod_produto)');
        qMovtoMesa.SQL.Add('      inner join miniprinters  mp on (mp.cod_miniprinter = p.cod_miniprinter)');
        qMovtoMesa.SQL.Add('      inner join garcons g on (g.cod_garcon = ms.cod_garcon)');
        qMovtoMesa.SQL.Add('        where ms.cod_mesa = ' + QuotedStr(ANumeroMesaBalcao));
        qMovtoMesa.SQL.add(' and p.cod_miniprinter=' + QuotedStr(qryImpressoraProducao.FieldByName('cod_miniprinter').Value));
        dm.adicionalog(qMovtoMesa.SQL.Text);
        qMovtoMesa.Active := True;
        qMovtoMesa.First;

        if (qMovtoMesa.IsEmpty = False) then
        begin
          imprimeCabecalhoPedidoBalcao(strComprovante, ANomeClienteBalcao, ctViasPedido);

          while not qMovtoMesa.Eof do
          begin
            if (Frac(qMovtoMesa.FieldByName('quantidade').Value) > 0) then
              qtdeProduto := FormatFloat('#0.000', qMovtoMesa.FieldByName('quantidade').Value)
            else
              qtdeProduto := IntToStr(StrToInt(qMovtoMesa.FieldByName('quantidade').AsString));

            strComprovante.add('<n><e></ae>' + qtdeProduto + '  ' + '</ad>' + qMovtoMesa.FieldByName('descricao').Value + '</e></N><C> (id: ' + qMovtoMesa.FieldByName('id').asstring + ')</C>');
            if (Trim(qMovtoMesa.FieldByName('sabores').Value) <> '') then
            begin
              strComprovante.Add('**SABOR(ES):');
              strComprovante.add('<e></ae>' + qMovtoMesa.FieldByName('SABORES').Value + '</e>');
              strComprovante.Add('**');
            end;

            if (Trim(qMovtoMesa.FieldByName('observacoes').Value) <> '') then
            begin
              strComprovante.Add('** Observações:');
              strComprovante.add('<e></ae>' + qMovtoMesa.FieldByName('observacoes').Value + '</e>');
            end;

            strComprovante.Add('</linha_simples>');
            qMovtoMesa.Next;
          end;

          for ctLinhasFimCupom := 1 to StrToInt(LeIniImpressoes(2, 'IMPRESSORA_' + FormatFloat('000', qryImpressoraProducao.fieldbyname('cod_miniprinter').Value), 'linhasAposCupom')) do
          begin
            strComprovante.add(' ');
          end;

          configuraImpressoraProducao(qryImpressoraProducao.fieldbyname('cod_miniprinter').Value);
          imprimeTextoACBR(strComprovante);
          adicionaLog(strComprovante.Text);
        end;

      end;
      qryImpressoraProducao.Next;
    end;

    try
      qMovtoMesa.active := False;
      qMovtoMesa.SQL.Clear;
      qMovtoMesa.SQL.Add('update movimento_mesa ms set ms.impresso=1 where ms.seq_impressao=' + QuotedStr(''));
        ////////dm.adicionalog(qMovtoMesa.SQL.Text);
      qMovtoMesa.ExecSQL;
    except
      begin
        ShowMessage('Erro ao atualizar flag de impressão!');
      end;

    end;
  finally
    ts.Commit;
    strComprovante.Clear;

    qMovtoMesa.Active := False;
    FreeAndNil(qMovtoMesa);

    qryImpressoraProducao.Active := False;
    FreeAndNil(qryImpressoraProducao);

    FreeAndNil(ts);
    FreeAndNil(strComprovante);
  end;
end;

procedure Tdm.imprimePedidoDeliveryNaProducao(ACodPedido: string; Aevento: SmallInt);
var
  qItensPedido: TIBQuery;
  qryImpressoraProducao: TIBQuery;
  ts: TIBTransaction;
  dataHoraLancamento: TDateTimeField;
  nomeImpressora: string;
  ctLinhasFimCupom: SmallInt;
  ctViasPedido: SmallInt;
  qtdeProduto: string;
  descricaoProduto: string;
  strComprovante: TStringList;
  LIDPedidoIntegracao: Largeint;
  LTemProdutoPrincipal: boolean;
  LProdutoPrincipal: boolean;
begin

  strComprovante := TStringList.Create;

  ts := TIBTransaction.Create(Self);
  ts.Name := RandomName(8);
  ts.DefaultDatabase := dm.dbrestaurante;
  ts.Active := False;

  qItensPedido := TIBQuery.Create(Self);
  qItensPedido.Name := 'Movto' + IntToStr(Random(8));
  qItensPedido.Database := dbrestaurante;
  qItensPedido.Transaction := ts;

  qryImpressoraProducao := TIBQuery.Create(Self);
  qryImpressoraProducao.Name := 'Printer' + IntToStr(Random(8));
  qryImpressoraProducao.Database := dbrestaurante;
  qryImpressoraProducao.Transaction := ts;
  ts.Active := True;

  try
    qryImpressoraProducao.Active := False;
    qryImpressoraProducao.SQL.Clear;
    qryImpressoraProducao.SQL.Add(' select * from miniprinters mp ');
    qryImpressoraProducao.SQL.Add('    where mp.cod_miniprinter <> ' + QuotedStr('001'));
    qryImpressoraProducao.SQL.Add('    order by mp.cod_miniprinter ');
    qryImpressoraProducao.Active := True;
    qryImpressoraProducao.First;

    while not qryImpressoraProducao.eof do
    begin
      for ctViasPedido := 1 to qryImpressoraProducao.FieldByName('vias').Value do
      begin
        strComprovante.Clear;
        qItensPedido.Active := False;
        qItensPedido.SQL.Clear;
        qItensPedido.SQL.Add(' select it.cod_pedido, it.cod_produto, prod.cod_barras,                       ');
        qItensPedido.SQL.Add('        prod.descricao, it.quantidade, it.id, it.observacoes,                 ');
        qItensPedido.SQL.Add('        it.sabores, it.tipo_massa, it.hora_lancamento, u.login as usuario,    ');
        qItensPedido.SQL.Add('        it.numero_caixa,prod.cod_miniprinter,                                 ');
        qItensPedido.SQL.Add('        cd.codigo as cod_cli, cd.nome as nomeCliente,                         ');
        qItensPedido.SQL.Add('        cd.endereco, b.descricao as bairro,pd.retira_balcao, pd.ID_PEDIDO_INTEGRACAO, coalesce(it.produto_principal,0) as produto_principal');
        qItensPedido.SQL.Add('        from itens_pedido_delivery it                                         ');
        qItensPedido.SQL.Add('   inner join  produtos prod on (prod.cod_produto = it.cod_produto)           ');
        qItensPedido.SQL.Add('   inner join  pedidos_delivery pd on (pd.codigo = it.cod_pedido)             ');
        qItensPedido.SQL.Add('   inner join  clientes_delivery cd on (cd.codigo = pd.cod_cliente)           ');
        qItensPedido.SQL.Add('   inner join  bairro b on  (b.codigo = cd.cod_bairro)                        ');
        qItensPedido.SQL.Add('   inner join  usuarios u on (u.cod_usuario = it.cod_usuario)                 ');
        qItensPedido.SQL.Add('   where prod.cod_miniprinter=' + QuotedStr(qryImpressoraProducao.FieldByName('cod_miniprinter').Value));
        qItensPedido.SQL.Add(' and it.cod_pedido=' + QuotedStr(ACodPedido));
        qItensPedido.SQL.Add('   order by it.id');
           ////////dm.adicionalog(qItensPedido.SQL.Text);
        qItensPedido.Active := True;
        qItensPedido.First;

        if (qItensPedido.IsEmpty = False) then
        begin
          LIDPedidoIntegracao := qItensPedido.FieldByName('ID_PEDIDO_INTEGRACAO').Value;
          imprimeCabecalhoPedidoDeliveryProducao(ACodPedido, LIDPedidoIntegracao, Aevento, strComprovante, ctViasPedido, qItensPedido);

          while not qItensPedido.Eof do
          begin
            LTemProdutoPrincipal := false;
            LProdutoPrincipal := false;

            if qItensPedido.FieldByName('produto_principal').Value = 1 then
            begin
              LProdutoPrincipal := true;
              strComprovante.add('</linha_dupla>');
            end
            else
              LProdutoPrincipal := false;

            if (Frac(qItensPedido.FieldByName('quantidade').Value) > 0) then
              qtdeProduto := FormatFloat('#0.000', qItensPedido.FieldByName('quantidade').Value)
            else
              qtdeProduto := IntToStr(StrToInt(qItensPedido.FieldByName('quantidade').AsString));

            if (LProdutoPrincipal = true) then
              strComprovante.add('<n><e></ae>' + qtdeProduto + ' ' + qItensPedido.FieldByName('descricao').Value + '</N></e><c> #' + qItensPedido.FieldByName('id').asstring + '</C>')
            else
              strComprovante.add('</FB><e><c></ae>  > ' + qtdeProduto + ' ' + '</ad>' + qItensPedido.FieldByName('descricao').Value + '</e>'); // + qItensPedido.FieldByName('id').asstring + '</C></N>');

            if (Trim(qItensPedido.FieldByName('sabores').Value) <> '') then
            begin
              strComprovante.Add('</linha_simples>');
              strComprovante.Add('**SABOR(ES):');
              strComprovante.add('<e></ae>' + qItensPedido.FieldByName('SABORES').Value + '</e>');
              strComprovante.Add('**');
              strComprovante.Add('</linha_simples>');
            end;

            if (Trim(qItensPedido.FieldByName('observacoes').Value) <> '') then
            begin
              strComprovante.Add('</linha_simples>');
              strComprovante.Add('** Observações:');
              strComprovante.add('</FB><e><c></ae>' + qItensPedido.FieldByName('observacoes').Value + '</e>');
              strComprovante.Add('</linha_simples>');
            end;
            qItensPedido.Next;
          end;

          for ctLinhasFimCupom := 1 to StrToInt(LeIniImpressoesDelivery(2, 'IMPRESSORA_' + FormatFloat('000', qryImpressoraProducao.fieldbyname('cod_miniprinter').Value), 'linhasAposCupom')) do
          begin
            strComprovante.add(' ');
          end;

          dm.adicionaLog(strComprovante.Text);
          configuraImpressoraProducaoDelivery(qryImpressoraProducao.fieldbyname('cod_miniprinter').Value);
          imprimeTextoACBR(strComprovante);
        end;

      end;
      qryImpressoraProducao.Next;
    end;

  finally
    ts.Commit;
    strComprovante.Clear;

    qItensPedido.Active := False;
    FreeAndNil(qItensPedido);

    qryImpressoraProducao.Active := False;
    FreeAndNil(qryImpressoraProducao);

    FreeAndNil(ts);
    FreeAndNil(strComprovante);
  end;

end;

procedure Tdm.imprimeCancelamentoPedidoProducao(codEstorno: string);
var
  qMovtoMesa: TIBQuery;
  ts: TIBTransaction;
  dataHoraLancamento: TDateTimeField;
  nomeImpressora: string;
  ct: SmallInt;
  qtdeProduto: string;
  descricaoProduto: string;
  strComprovante: TStringList;
  LArquivoLogImpressao: string;
begin

  strComprovante := TStringList.Create;

  ts := TIBTransaction.Create(Self);
  ts.Name := RandomName(8);
  ts.DefaultDatabase := dm.dbrestaurante;
  ts.Active := False;
  ts.Active := True;

  qMovtoMesa := TIBQuery.Create(Self);
  qMovtoMesa.Name := 'Movto' + RandomName(8);
  qMovtoMesa.Database := dbrestaurante;
  qMovtoMesa.Transaction := ts;
//  dm.adicionaLog(' Vai imprimir o cancelamento na produção');

  try
    strComprovante.Clear;
    qMovtoMesa.Active := False;
    qMovtoMesa.SQL.Clear;
    qMovtoMesa.SQL.Add('  select et.codigo, et.mesa, et.id, ');
    qMovtoMesa.SQL.Add('         et.descricaomotivo, et.quantidade,');
    qMovtoMesa.SQL.Add('         et.nome_usuario_autorizou,');
    qMovtoMesa.SQL.Add('         et.cod_caixa, et.hora, et.obs,');
    qMovtoMesa.SQL.Add('         p.descricao, p.cod_miniprinter');
    qMovtoMesa.SQL.Add('          from estornos et');
    qMovtoMesa.SQL.Add('          inner join produtos p on (p.cod_barras = et.cod_produto)');
    qMovtoMesa.SQL.Add('           where p.cod_miniprinter <> ' + QuotedStr('001'));
    qMovtoMesa.SQL.Add('           and et.codigo=' + QuotedStr(codEstorno));
   ////////dm.adicionalog(qMovtoMesa.SQL.Text);
    qMovtoMesa.Active := True;
    qMovtoMesa.First;
//  dm.adicionaLog(' Buscou os dados do produto');

    if (qMovtoMesa.IsEmpty = False) then
    begin
      strComprovante.Clear;
      strComprovante.add('<n></linha_dupla></N>');
      strComprovante.add('<e>' + PadCenter(nome_fantasia, 24, ' ') + '</e>');
      strComprovante.add('<e><in>' + PadCenter('CANCELAR PRODUÇÃO', 24, ' ') + '</in></e>');
      strComprovante.add('<e><in>' + PadCenter('Estorno nº ' + codEstorno, 24, ' ') + '</in></e>');
      strComprovante.add('<ae><N><e><in>' + 'Mesa: ' + qMovtoMesa.FieldByName('mesa').Value + '</in></e></n></Ae>');
      strComprovante.add('</ae></fn>Hora: ' + Trim(FormatDateTime('DD/MM/YYY HH:MM:SS', Now) + '</Ae>'));
      strComprovante.add('</fn></ae>Caixa Nº: ' + ultimoCaixaAberto);
      strComprovante.add('</fn></ae>Usurio logado: ' + nome_usuario);
      strComprovante.add('</fn></ae>Autorizado por:: ' + qMovtoMesa.FieldByName('nome_usuario_autorizou').Value);
      strComprovante.add('</fn></ae>Motivo: ' + qMovtoMesa.FieldByName('descricaomotivo').Value);
      strComprovante.add('<n></linha_dupla></N>');

      if (Frac(qMovtoMesa.FieldByName('quantidade').Value) > 0) then
        qtdeProduto := FormatFloat('#0.000', qMovtoMesa.FieldByName('quantidade').Value)
      else
        qtdeProduto := IntToStr(StrToInt(qMovtoMesa.FieldByName('quantidade').AsString));

      strComprovante.add('<n><e></ae>' + qtdeProduto + '  ' + '</ad>' + qMovtoMesa.FieldByName('descricao').Value + '</e></N><C> (id: ' + qMovtoMesa.FieldByName('id').asstring + ')</C>');

      if (Trim(qMovtoMesa.FieldByName('obs').Value) <> '') then
      begin
        strComprovante.Add('** Observações:');
        strComprovante.add('<e></ae>' + qMovtoMesa.FieldByName('obs').Value + '</e>');
      end;

      strComprovante.Add('</linha_simples>');

      for ct := 1 to StrToInt(LeIniImpressoes(2, 'IMPRESSORA_' + FormatFloat('000', qMovtoMesa.fieldbyname('cod_miniprinter').Value), 'linhasAposCupom')) do
      begin
        strComprovante.add(' ');
      end;

      adicionaLog(strComprovante.Text);
      configuraImpressoraProducao(qMovtoMesa.fieldbyname('cod_miniprinter').Value);
      dm.adicionaLog(' Vai tentar imprimir na produção');

      if StrToInt(LeIniImpressoes(2, 'IMPRESSORA_' + FormatFloat('000', qMovtoMesa.fieldbyname('cod_miniprinter').Value), 'debug')) <> 1 then
      begin
        imprimeTextoACBR(strComprovante);
      end
      else
      begin
        LArquivoLogImpressao := ACBrPosPrinter1.Porta;
        LArquivoLogImpressao := StringReplace(LArquivoLogImpressao, ':', '_', [rfReplaceAll]);
        LArquivoLogImpressao := patchAplicacao + 'impressoes\' + FormatDateTime('yyymmddhhmmss', now) + '.prt';
        imprimeTextoACBR(strComprovante);
        dm.adicionaLog(' Imprimiu na produção');
        dm.adicionaLog(' vai gerar o arquivo de texto');
        ACBrPosPrinter1.Modelo := ppTexto;
        ACBrPosPrinter1.Porta := LArquivoLogImpressao;
        imprimeTextoACBR(strComprovante);
        dm.adicionaLog(' Salvou em arquivo');

      end;

      strComprovante.Clear;
    end;
  finally
    ts.Rollback;
    qMovtoMesa.active := false;

    FreeAndNil(qMovtoMesa);
    FreeAndNil(ts);
    FreeAndNil(strComprovante);
  end;

end;

procedure Tdm.imprimePreContaTodasAsMesas();
var
  LQryConsulta: TIBQuery;
  Ltransacao: TIBTransaction;
  LnomeGenerator: string;
begin

  LnomeGenerator := 'G_OBS_CLIENTES_DELIVERY';
  Ltransacao := TIBTransaction.Create(nil);
  Ltransacao.Params.Add('read_committed');
  Ltransacao.Params.Add('rec_version');
  Ltransacao.Params.Add('nowait');

  Ltransacao.DefaultDatabase := dm.dbrestaurante;
  Ltransacao.Active := False;
  Ltransacao.Active := True;
  LQryConsulta := TIBQuery.Create(nil);
  LQryConsulta.Database := dm.dbrestaurante;
  LQryConsulta.Transaction := Ltransacao;

  try
    LQryConsulta.Active := False;
    LQryConsulta.SQL.Clear;
    LQryConsulta.SQL.Add('select distinct cod_mesa as mesa from movimento_mesa order by cod_mesa');
    LQryConsulta.Active := True;
    LQryConsulta.First;

    while not LQryConsulta.Eof do
    begin
      ImprimeComprovanteMesa(TcPreConta, LQryConsulta.FieldByName('mesa').Value, '', false);
      LQryConsulta.Next;
    end;

  finally
    LQryConsulta.Active := False;
    Ltransacao.Active := False;
    FreeAndNil(LQryConsulta);
    FreeAndNil(Ltransacao);
  end;

end;

function Tdm.StrtoMultilineStr(AStr: string; AtamanhoMaxLinha: Integer): string;
var
  PalavrasDescricao: TStringList;
  ct: Integer;
  linha, linhaTemp: string;
begin
  PalavrasDescricao := TStringList.Create;
//  AStr := 'TEMAKI CAMARÃO EMPANADO';

  try
    PalavrasDescricao.Clear;
    PalavrasDescricao.Clear;
    PalavrasDescricao.Delimiter := ' ';
    PalavrasDescricao.StrictDelimiter := True;
    PalavrasDescricao.DelimitedText := AStr;
    linhaTemp := '';
    linha := '';
    ct := 0;

    while ct < PalavrasDescricao.Count do
    begin
      if Length((linhaTemp + PalavrasDescricao[ct])) > AtamanhoMaxLinha then
      begin
        if linha <> '' then
        begin
          linha := linha + sLineBreak + PalavrasDescricao[ct];
          linhaTemp := '';
          ct := ct + 1;
        end
        else
        begin
          linha := linha + PalavrasDescricao[ct];
        end;

      end
      else
      begin
        if (linha <> '') and (Length(linhaTemp + PalavrasDescricao[ct]) >= AtamanhoMaxLinha) then
        begin
          linha := linha + sLineBreak;
          linha := linha + ' ' + PalavrasDescricao[ct];
          linhaTemp := '';
        end
        else
        begin

          linhaTemp := linha + ' ' + PalavrasDescricao[ct];
          linha := linhaTemp;
//                linhaTemp :='';


        end;

        ct := ct + 1;
      end;

    end;

  finally
    FreeAndNil(PalavrasDescricao);
  end;

  result := linha;
end;

procedure Tdm.ImprimeComprovanteMesa(ATipoComprovante: TTipoComprovante; AMesa: string; AMesDestino: string; AImprimeProducao: boolean);
var
  pessoas: SmallInt;
  terminal, garcom: string;
  tempoAtendimento: string;
  codProduto: string;
  descricaoProduto: string;
  quantidade: string;
  valorUnitario, total: string;
  Subtotal: string;
  totalConta: string;
  consumo, valorPago, servico, desconto, valorRestante, faltaPagar: string;
  valorPorPessoa: string;
  ct: SmallInt;
  qryAux: TIBQuery;
  qryProdutosPreConta: TIBQuery;
  qryRodapePreConta: TIBQuery;
  ts: TIBTransaction;
  strPreConta: TStringList;
  deslocamentoNormal: Integer;
  deslocamentoExpandido: Integer;
  LImprimeMovimentoTransferencia: boolean;
begin

  strPreConta := TStringList.Create;

  ts := TIBTransaction.Create(Self);
  ts.Name := RandomName(8);
  ts.DefaultDatabase := dm.dbrestaurante;
  ts.Active := False;
  ts.Active := True;

  qryAux := TIBQuery.Create(Self);
  qryAux.Name := 'Movto' + IntToStr(Random(8));
  qryAux.Database := dbrestaurante;
  qryAux.Transaction := ts;

  qryProdutosPreConta := TIBQuery.Create(Self);
  qryProdutosPreConta.Name := 'prod' + IntToStr(Random(8));
  qryProdutosPreConta.Database := dbrestaurante;
  qryProdutosPreConta.Transaction := ts;

  qryRodapePreConta := TIBQuery.Create(Self);
  qryRodapePreConta.Name := 'rodaPe' + IntToStr(Random(8));
  qryRodapePreConta.Database := dbrestaurante;
  qryRodapePreConta.Transaction := ts;

  try
    terminal := numero_caixa;
    LImprimeMovimentoTransferencia := StrToBool(dm.LeIni(2, 'TRANSFERENCIA_DE_MESA', 'imprime_movimento'));
    deslocamentoNormal := StrToInt(LeIni(2, 'extrato', 'deslocamentoNormal'));
    deslocamentoExpandido := StrToInt(LeIni(2, 'extrato', 'deslocamentoExpandido'));
    ;

    qryProdutosPreConta.Active := False;
    qryProdutosPreConta.SQL.Clear;
    qryProdutosPreConta.SQL.Add(' select pr.cod_barras,   pr.descricao,    mv.valor_unitario, ');
    qryProdutosPreConta.SQL.Add('        sum(mv.quantidade) as quantidade, ');
    qryProdutosPreConta.SQL.Add('        sum( udf_roundabnt((mv.valor_unitario * mv.quantidade),2))   as total ');
    qryProdutosPreConta.sql.add('             , coalesce(c.descricao,' + Quotedstr('') + ') as descricao_mesa, coalesce(c.nome_cliente,' + QUotedstr('') + ') as nome_cliente  ');
    qryProdutosPreConta.SQL.Add('             from movimento_mesa mv ');
    qryProdutosPreConta.SQL.Add('  left join cartoes c on (c.cod_cartao = mv.cod_mesa)');
    qryProdutosPreConta.SQL.Add('             inner join produtos pr on (pr.cod_produto=mv.cod_produto) ');
    qryProdutosPreConta.SQL.Add('           where   mv.cod_mesa=' + QuotedStr(AMesa));
    qryProdutosPreConta.SQL.Add('        group by c.descricao, c.nome_cliente, pr.cod_barras,pr.descricao, mv.valor_unitario ');
    dm.adicionaLog(qryProdutosPreConta.SQL.Text);
    qryProdutosPreConta.Active := True;
    qryProdutosPreConta.FetchAll;

    qryRodapePreConta.Active := False;
    qryRodapePreConta.SQL.Clear;
    qryRodapePreConta.SQL.Add('select * from rodapeextrato3(' + QuotedStr(AMesa) + ',0) r ');
    qryRodapePreConta.Active := True;

    pessoas := qryRodapePreConta.FieldByName('QTDPESSOAS').Value;
    consumo := FormatFloat('R$ ###,###,##0.00', qryRodapePreConta.FieldByName('valorbruto').Value);
    servico := FormatFloat('R$ ###,###,##0.00', qryRodapePreConta.FieldByName('valortxserv').Value);
    desconto := FormatFloat('R$ ###,###,##0.00', qryRodapePreConta.FieldByName('VALORTOTALDESCONTO').Value);
    valorPago := FormatFloat('R$ ###,###,##0.00', qryRodapePreConta.FieldByName('valorPago').Value);
    valorRestante := FormatFloat('R$ ###,###,##0.00', qryRodapePreConta.FieldByName('valorrestante').Value);
    Subtotal := FormatFloat('R$ ###,###,##0.00', (qryRodapePreConta.FieldByName('valorbruto').Value - qryRodapePreConta.FieldByName('VALORTOTALDESCONTO').Value));
    valorPorPessoa := valorRestante;

    if pessoas > 1 then
      if (pessoas) > 1 then
        valorPorPessoa := FormatFloat('R$ ###,###,##0.00', RoundABNT((qryRodapePreConta.FieldByName('valorrestante').Value / (pessoas)), 5));

    totalConta := FormatFloat('R$ ###,###,##0.00', qryRodapePreConta.FieldByName('valortotal').Value);

    strPreConta.Clear;
    strPreConta.add('</zera>>');

    if FileExists(logoComprovantes, True) then
      strPreConta.add('</ce><bmp>' + logoComprovantes + '</bmp>')
    else
    begin
      ////dm.adicionalog('Arquivo de logo não encontrado para impressão');
    end;

    case ATipoComprovante of
      TcPreConta:
        begin
          strPreConta.add('</linha_dupla>');
          strPreConta.add('<e><n>' + PadCenter(nome_fantasia, 24 - deslocamentoExpandido, ' ') + '</n></e>');
          strPreConta.add('<e>' + PadCenter('Pré-conta', 24 - deslocamentoExpandido, ' ') + '</e>');
          strPreConta.add('</linha_dupla>');
          if (trim(qryProdutosPreConta.FieldByName('descricao_mesa').Value) <> '') then
          begin
            strPreConta.add('</ae><e>' + PadCenter(qryProdutosPreConta.FieldByName('descricao_mesa').Value, 24, ' ') + '</e>');
          end
          else
          begin
            strPreConta.add('<e>Mesa: ' + AMesa + ' </e>');
          end;
          if (trim(qryProdutosPreConta.FieldByName('nome_cliente').Value) <> '') then
          begin
            strPreConta.add('</fn></ce><e> Cliente: ' + qryProdutosPreConta.FieldByName('nome_cliente').Value + ' </e></N>');
          end;

        end;
      TcTransferenciaMesa:
        begin
          strPreConta.add('</linha_dupla>');
          strPreConta.add('<e><n>' + PadCenter(nome_fantasia, 24 - deslocamentoExpandido, ' ') + '</n></e>');
          strPreConta.add('<e>' + PadCenter('Transf. de Mesas', 24 - deslocamentoExpandido, ' ') + '</e>');
          strPreConta.add('</linha_dupla>');
          if (trim(qryProdutosPreConta.FieldByName('descricao_mesa').Value) <> '') then
          begin
            strPreConta.add('</ae><e>' + PadCenter(qryProdutosPreConta.FieldByName('descricao_mesa').Value, 24, ' ') + '</e>');
          end
          else
          begin
            strPreConta.add('<e>Mesa de origem: ' + AMesa + ' </e>');
            strPreConta.add('<e>Mesa de destino: ' + AMesDestino + ' </e>');
          end;
          if (trim(qryProdutosPreConta.FieldByName('nome_cliente').Value) <> '') then
          begin
            strPreConta.add('</fn></ce><e> Cliente: ' + qryProdutosPreConta.FieldByName('nome_cliente').Value + ' </e></N>');
          end;
          strPreConta.add('</linha_dupla>');
        end;
    end;

    strPreConta.add(FormatDateTime('DD/MM/YYY', Date) + ' ' + FormatDateTime('HH:MM:SS', Time));
    strPreConta.add('Tipo do terminal: Windows');
    strPreConta.add('Caixa Nº: ' + ultimoCaixaAberto);
    strPreConta.add('Operador: ' + nome_usuario);
    strPreConta.add('Garçom que abriu: ' + qryRodapePreConta.FieldByName('nome_garcon_abriu').Value);
    strPreConta.add('Tempo de atendimento: ' + qryRodapePreConta.FieldByName('tempo_permanencia').Value);

    if (((ATipoComprovante = TcTransferenciaMesa) and (LImprimeMovimentoTransferencia)) or (ATipoComprovante = TcPreConta)) then
    begin

      strPreConta.add('</linha_simples>');
      strPreConta.add('<n>' + PadRight('Cód.', 7, ' ') + PadRight('Descrição', 41 - deslocamentoNormal) + '</n>');
      strPreConta.add('<n>' + PadRight('Qtde.', 14, ' ') + PadLeft('Vl Unitário', 15) + PadLeft('Total', 19 - deslocamentoNormal) + '</n>');
      strPreConta.add('</linha_simples>');

      qryProdutosPreConta.First;
      while not qryProdutosPreConta.Eof do
      begin
        codProduto := qryProdutosPreConta.FieldByName('COD_BARRAS').Value;
        descricaoProduto := qryProdutosPreConta.FieldByName('descricao').Value;
        valorUnitario := FormatFloat('R$ ###,###,##0.00', qryProdutosPreConta.FieldByName('valor_unitario').Value);
        if Frac(qryProdutosPreConta.FieldByName('quantidade').Value) > 0 then
          quantidade := FormatFloat('#0.000', qryProdutosPreConta.FieldByName('quantidade').Value)
        else
          quantidade := IntToStr(qryProdutosPreConta.FieldByName('quantidade').Value);

        total := FormatFloat('R$ ###,###,##0.00', qryProdutosPreConta.FieldByName('total').Value);

        strPreConta.add(PadRight(codProduto, 7, ' ') + PadRight(descricaoProduto, 41 - deslocamentoNormal));
        strPreConta.add(PadRight(quantidade, 14, ' ') + PadLeft(valorUnitario, 15) + PadLeft(total, 19 - deslocamentoNormal));

        qryProdutosPreConta.Next;
      end;
    end;

    strPreConta.add('</linha_simples>');

    strPreConta.add(PadRight(' Consumo:', 20) + PadLeft(consumo, 28 - deslocamentoNormal));
    strPreConta.add(PadRight(' - ' + 'Desconto:', 20) + PadLeft(desconto, 28 - deslocamentoNormal));

    if qryRodapePreConta.FieldByName('VALORTOTALDESCONTO').Value > 0 then
    begin
      strPreConta.add('</linha_simples>');
      strPreConta.add('<n>' + PadRight('Subtotal:', 20) + PadLeft(Subtotal, 28 - deslocamentoNormal));
      strPreConta.add('</linha_simples>');
    end;

    strPreConta.add(PadRight(' + ' + dm.LeIni(2, 'extrato', 'descricaoTaxaServico') + ':', 20) + PadLeft(servico, 28 - deslocamentoNormal));

    if qryRodapePreConta.FieldByName('valorPago').Value > 0 then
    begin
      strPreConta.add('<n>' + PadRight(' - Já foi pago:', 20) + PadLeft(valorPago, 28 - deslocamentoNormal));
      strPreConta.add('</linha_simples>');
      strPreConta.add('<e>' + 'Falta receber: ' + valorRestante + '</e>');
    end
    else
    begin
      strPreConta.add('</linha_simples>');
      strPreConta.add('<e>' + PadRight('Total:', 7) + PadLeft(totalConta, 17 - deslocamentoExpandido) + '</e>');
    end;

    if (pessoas) > 1 then
    begin
      strPreConta.add('<e>' + PadRight('Pessoas:', 9) + PadLeft(IntToStr(pessoas), 12 - deslocamentoExpandido) + '</e>');
      strPreConta.add('<e>' + PadRight('Por Pessoa:', 12) + PadLeft(valorPorPessoa, 12 - deslocamentoExpandido) + '</e>');

    end;

    if (Trim(msg_promo_conta) <> '') then
    begin
      strPreConta.add('</linha_simples>');
      strPreConta.add('</fn></ce><n>' + msg_promo_conta + '</N>');
      strPreConta.add('</linha_simples>');
    end;

    for ct := 1 to StrToInt(LeIni(2, 'IMPRESSORA_NAO_FISCAL_01', 'linhasAposCupom')) do
    begin
      strPreConta.add(' ');
    end;

    try
      ts.Commit;
    except
      begin
        ShowMessage('Erro ao commitar transação de impressão!');
      end;
    end;

    ////dm.adicionalog(strPreConta.Text);
    configuraImpressoraNaoFiscal();
    imprimeTextoACBR(strPreConta);

    if ((ATipoComprovante = TcTransferenciaMesa) and (AImprimeProducao)) then
    begin
      qryProdutosPreConta.active := false;
      qryProdutosPreConta.sql.clear;
      qryProdutosPreConta.sql.add('  select distinct p.cod_miniprinter as cod_miniprinter from movimento_mesa ms ');
      qryProdutosPreConta.sql.add('   inner join produtos p on (p.cod_produto = ms.cod_produto) ');
      qryProdutosPreConta.sql.add('    where p.cod_miniprinter <> ' + Quotedstr('001'));
      qryProdutosPreConta.sql.add('     and ms.cod_mesa=' + Quotedstr(AMesa));
      qryProdutosPreConta.active := true;
      qryProdutosPreConta.FetchAll;
      qryProdutosPreConta.first;

      while not qryProdutosPreConta.eof do
      begin
        configuraImpressoraProducao(qryProdutosPreConta.fieldbyname('cod_miniprinter').Value);
        imprimeTextoACBR(strPreConta);
        qryProdutosPreConta.next;
      end;
    end;

  finally
    qryAux.Active := False;
    qryProdutosPreConta.Active := False;
    qryRodapePreConta.Active := False;
    FreeAndNil(qryAux);
    FreeAndNil(qryProdutosPreConta);
    FreeAndNil(qryRodapePreConta);
    FreeAndNil(ts);
    FreeAndNil(strPreConta);
  end;

end;

procedure Tdm.GravarTransacaoTEF(ACodFormaPagamento: string; AMesa: string; AValor: double);
var
  LQry: TIBQuery;
  LTs: TIBTransaction;
  LTransacaoTEF: TACBrTEFResp;
  LSQL: TStringList;
begin

  LSQL := TStringList.Create;

  LTs := TIBTransaction.Create(nil);
  LTs.Params.Add('read_committed');
  LTs.Params.Add('rec_version');
  LTs.Params.Add('nowait');

  LTs.DefaultDatabase := dm.dbrestaurante;
  LTs.Active := False;
  LTs.Active := True;
  LQry := TIBQuery.Create(nil);
  LQry.Database := dm.dbrestaurante;
  LQry.Transaction := LTs;

  try
    try

      LTransacaoTEF := ACBrTEFD1.RespostasPendentes[ACBrTEFD1.RespostasPendentes.Count - 1];
      LQry.SQL.clear;
      LSQL.Add('insert into RECEBIMENTO_PARCIAL (mesa, cod_forma, valor, cod_usuario,');
      LSQL.Add('TEF_NSU,TEF_REDE,TEF_AUTORIZACAO,TEF_COMPROVANTE_EMPRESA,TEF_COMPROVANTE_CLIENTE,');
      LSQL.Add('TEF_CNPJ_CREDENCIADORA)');
      LSQL.Add(' values(');
      LSQL.Add(Quotedstr(AMesa) + ',');
      LSQL.Add(QUotedstr(ACodFormaPagamento) + ',');
      LSQL.Add(TrocaVirgPPto(Floattostr(AValor)) + ',');
      LSQL.Add(Quotedstr(codigo_usuario) + ',');
      LSQL.Add(QUotedstr(LTransacaoTEF.NSU) + ',');
      LSQL.Add(QUotedstr(LTransacaoTEF.Rede) + ',');
      LSQL.Add(QUotedstr(LTransacaoTEF.CodigoAutorizacaoTransacao) + ',');
      LSQL.Add(QUotedstr(LTransacaoTEF.ImagemComprovante1aVia.Text) + ',');
      LSQL.Add(QUotedstr(LTransacaoTEF.ImagemComprovante2aVia.Text) + ',');
      LSQL.Add(QUotedstr(LTransacaoTEF.NFCeSAT.CNPJCredenciadora) + ')');
      LQry.sql.Add(LSQL.Text);
      dm.adicionaLog(LSQL.Text);
      LQry.ExecSQL;
      LTs.Commit;

    except
      on E: Exception do
      begin
        raise E.Create('Erro ao gravar operação de TEF: ' + E.Message);
      end;

    end;

  finally

    if LTs.Active then
      LTs.Rollback;
    LQry.Active := False;
    LTs.Active := False;
    FreeAndNil(LQry);
    FreeAndNil(LTs);
  end;
end;

procedure Tdm.LimpaInformacoesDaMesa(AMesa: string; ANumeroCaixa: string);
var
  LSQL: TStringList;
  LListaSQL: TList<string>;
begin

  LListaSQL := TList<string>.Create;
  LSQL := TStringList.Create;

  try
    try
      LSQL.Clear;
      LSQL.add('delete from movimento_mesa mv  where mv.cod_mesa=' + QuotedStr(AMesa));
      LSQL.add(' and mv.guid in (  ');
      LSQL.add('    select ch.guid  ');
      LSQL.add('       from chaves_selecionadas_movimento ch ');
      LSQL.add('    where ch.numero_caixa = :vpNumeroCaixa and ch.numero_mesa = :vpNumeroMesa);');
      LSQL.Text := StringReplace(LSQL.Text, ':vpNumeroCaixa', Quotedstr(ANumeroCaixa), [rfReplaceAll]);
      LSQL.Text := StringReplace(LSQL.Text, ':vpNumeroMesa', Quotedstr(AMesa), [rfReplaceAll]);
      LListaSQL.add(LSQL.text);

      LSQL.Clear;
      LSQL.add('delete from recebimento_parcial rp where rp.mesa=' + QuotedStr(AMesa));
      LSQL.add(' and rp.guid in (  ');
      LSQL.add('    select ch.guid  ');
      LSQL.add('       from chaves_selecionadas_movimento ch ');
      LSQL.add('    where ch.numero_caixa = :vpNumeroCaixa and ch.numero_mesa = :vpNumeroMesa);');
      LSQL.Text := StringReplace(LSQL.Text, ':vpNumeroCaixa', Quotedstr(ANumeroCaixa), [rfReplaceAll]);
      LSQL.Text := StringReplace(LSQL.Text, ':vpNumeroMesa', Quotedstr(AMesa), [rfReplaceAll]);
      LListaSQL.add(LSQL.text);

      LSQL.Clear;
      LSQL.add(' delete from sabores_pizza_movimento_mesa  where cod_mesa=' + QuotedStr(AMesa) + ';');
      LSQL.Text := StringReplace(LSQL.Text, ':vpNumeroMesa', Quotedstr(AMesa), [rfReplaceAll]);
      LListaSQL.add(LSQL.text);

      LSQL.Clear;
      LSQL.add('delete from extratos_emitidos where mesa=' + QuotedStr(AMesa) + ';');
      LSQL.Text := StringReplace(LSQL.Text, ':vpNumeroMesa', Quotedstr(AMesa), [rfReplaceAll]);
      LListaSQL.add(LSQL.text);

      LSQL.Clear;
      LSQL.add('delete from INFORMACOES_MESA where mesa=' + QuotedStr(AMesa) + ';');
      LSQL.Text := StringReplace(LSQL.Text, ':vpNumeroMesa', Quotedstr(AMesa), [rfReplaceAll]);
      LListaSQL.add(LSQL.text);

      LSQL.Clear;
      LSQL.add('delete from fila_de_impressao where mesa=' + QuotedStr(AMesa) + ';');
      LSQL.Text := StringReplace(LSQL.Text, ':vpNumeroMesa', Quotedstr(AMesa), [rfReplaceAll]);
      LListaSQL.add(LSQL.text);

      LSQL.Clear;
      LSQL.add(' update cartoes c set c.localizacao = null where c.cod_cartao=' + QuotedStr(AMesa) + ';');
      LSQL.Text := StringReplace(LSQL.Text, ':vpNumeroMesa', Quotedstr(AMesa), [rfReplaceAll]);
      LListaSQL.add(LSQL.text);

      LSQL.Clear;
      LSQL.add(' delete from CHAVES_SELECIONADAS_MOVIMENTO where numero_caixa= :vpNumeroCaixa;');
      LSQL.Text := StringReplace(LSQL.Text, ':vpNumeroCaixa', Quotedstr(ANumeroCaixa), [rfReplaceAll]);
      LListaSQL.add(LSQL.text);

      LSQL.Clear;
      LSQL.add(' delete from CHAVES_SELECIONADAS_MOVIMENTO where numero_mesa= :vpNumeroMesa;');
      LSQL.Text := StringReplace(LSQL.Text, ':vpNumeroMesa', Quotedstr(AMesa), [rfReplaceAll]);
      LListaSQL.add(LSQL.text);

      dm.ExecutaBlocoDeInstrucoes(LListaSQL, 150);

    except
      on E: Exception do
      begin
        raise Exception.Create('Erro ao limpar dados da mesa/pedido ' + E.Message);
      end;
    end;

  finally
    FreeAndNil(LSQL);
    FreeAndNil(LListaSQL);
  end;
end;

function Tdm.GetTempDirectory: string;
var
  tempFolder: array[0..MAX_PATH] of Char;
begin
  GetTempPath(MAX_PATH, @tempFolder);
  result := StrPas(tempFolder);
end;
     {
function Tdm.getMemTable(memTable: TFDMemTable; ASQL: string): Boolean;
var
  ts: TFDTransaction;
  q: TFDQuery;
begin

  result := False;

  ts := TFDTransaction.Create(Self);
  ts.Connection := fdRestaurante;
  q := TFDQuery.Create(Self);
  q.Connection := dm.fdRestaurante;
  q.Transaction := ts;

  try
    try
      ts.StartTransaction;
      q.Active := False;
      q.SQL.Clear;
      q.SQL.add(ASQL);
      q.Active := True;
      q.FetchAll;
      memTable.Active := False;
      memTable.CopyDataSet(q, [coStructure, coRestart, coAppend]);
      q.Active := False;
      ts.Commit;
    except
      on E: Exception do
      begin
        dm.exibe_painel_erro('Erro ao obter tabela em memória : ' + E.Message + sLineBreak + sLineBreak + ASQL, 'Ok');
        ////dm.adicionalog('Erro ao obter tabela em memória : ' + E.Message + sLineBreak + sLineBreak + ASQL);
        ////dm.adicionalog(ASQL);
        ts.Rollback;
      end;
    end;
  finally
    q.Active := False;
    FreeAndNil(q);
    FreeAndNil(ts);
  end;
end;

}

function Tdm.getMemTable(memTable: TFDMemTable; ASQL: string): Boolean;
var
  ts: TFDTransaction;
  q: TFDQuery;
  tempo: integer;
  inicio: TDateTIme;
begin

  result := False;
  inicio := Now;

  if ConexaoRest = false then
  begin

    ts := TFDTransaction.Create(Self);
    ts.Connection := fdRestaurante;
    q := TFDQuery.Create(Self);
    q.Connection := dm.fdRestaurante;
    q.Transaction := ts;

    try
      try

        ts.StartTransaction;
        q.Active := False;
        q.SQL.Clear;
        q.SQL.add(ASQL);
        q.Active := True;
        q.FetchAll;
        memTable.Active := False;

        memTable.LogChanges := False;
        memTable.ResourceOptions.SilentMode := True;
        memTable.UpdateOptions.LockMode := lmNone;
        memTable.UpdateOptions.LockPoint := lpDeferred;
        memTable.UpdateOptions.FetchGeneratorsPoint := gpImmediate;
        memTable.DisableControls;
//      memTable.Data := q.Data;

        memTable.CopyDataSet(q, [coStructure, coRestart, coAppend]);
        memTable.EnableControls;
        q.Active := False;
        ts.Commit;
//        ShowMessage('Tempo da requisição: ' + IntToStr(SecondsBetween(inicio, now)) + ' segundos conexão direta');
      except
        on E: Exception do
        begin
          dm.exibe_painel_erro('Erro ao obter tabela em memória : ' + E.Message + sLineBreak + sLineBreak + ASQL, 'Ok');
          ////dm.adicionalog('Erro ao obter tabela em memória : ' + E.Message + sLineBreak + sLineBreak + ASQL);
          dm.adicionalog(ASQL);
          ts.Rollback;
          raise Exception.Create('Erro ao obter tabela em memória!');
        end;
      end;
    finally
      q.Active := False;
      FreeAndNil(q);
      FreeAndNil(ts);
    end;
  end
  else
  begin
    try

//      getMemTableByAPI(memTable, ASQL);
//     ShowMessage('Tempo da requisição: ' + IntToStr(SecondsBetween(inicio, now)) + ' segundos via REST JSON');
    except
      on E: Exception do
      begin
        dm.exibe_painel_erro('Erro ao buscar tabela em memória na API ' + sLineBreak + sLineBreak + 'Erro: ' + E.Message + sLineBreak + sLineBreak + 'Envie essa mensagem para a Real softwares!', 'Ok');
      end;

    end;

  end;

end;
    {
function TDM.getMemTableByAPI(AMemTable: TDataset; ASQL: string): string;
var
  JsonSTreamEnvio: TStringStream;
  URL_Endpoint, URL_Requisicao: string;
  HTTPClient: TIdHTTP;
  linha: string;
  LDWJsonValue: TJSONValue;
  LdadosRequisicao: TDadosRequisicaoAPIHorse;
  LDadosRetornados: TDadosRequisicaoAPIHorse;
  LBody: string;
begin

  result := 'Erro';
  LDWJsonValue := TJSONValue.Create;
  LdadosRequisicao := TDadosRequisicaoAPIHorse.Create;
  LdadosRequisicao.DatabaseParams := TDadosConexaoBanco.Create;
  JsonSTreamEnvio := TStringStream.Create;

  LdadosRequisicao.Comandos.Clear;
  LdadosRequisicao.DatabaseParams.Servidor := dm.LeIni(2, 'CONFIG_API', 'servidorBanco');
  LdadosRequisicao.DatabaseParams.LocalBanco := dm.LeIni(2, 'CONFIG_API', 'LocalBanco');
  LdadosRequisicao.DatabaseParams.Porta := dm.LeIni(2, 'CONFIG_API', 'portaBanco');
  LdadosRequisicao.Comandos.Add(ASQL);
  LBody := TJson.ObjectToJsonString(LdadosRequisicao);

  URL_Base := 'http://' + dm.LeIni(2, 'CONFIG_API', 'servidor') + ':' + dm.LeIni(2, 'CONFIG_API', 'porta');
  URL_Endpoint := '/getMemTable';
  URL_Requisicao := URL_Base + URL_Endpoint;

  HTTPClient := TidHTTP.Create;
  HTTPClient.IOHandler := IdSSLIOHandlerSocketOpenSSL1;
  HTTPClient.Request.Clear;
  HTTPClient.Request.ContentType := 'application/json';
  HTTPClient.Request.Charset := 'UTF-8';
  HTTPClient.Request.BasicAuthentication := false;
  HTTPClient.Request.CustomHeaders.Clear;
  HTTPClient.Request.CustomHeaders.AddValue('cache-control', 'no-cache');
  HTTPClient.Request.CustomHeaders.AddValue('Content-Type', 'application/json');
  HTTPClient.Request.CustomHeaders.AddValue('Accept', 'application/json');
  HTTPClient.Request.CustomHeaders.AddValue('cache-control', 'no-cache');
  HTTPClient.ProtocolVersion := pv1_1;

  try
    try
      JsonSTreamEnvio.Clear;
      JsonSTreamEnvio.WriteString(LBody);
      result := HTTPClient.Post(URL_Requisicao, JsonSTreamEnvio);
//          Result := ACBrUTF8ToAnsi(Result);


      if HTTPClient.ResponseCode = 200 then
      begin
        LDWJsonValue.WriteToDataset2(result, AMemTable);
      end
      else
      begin
        result := 'erro';
        raise Exception.Create('Erro ao obter dados. Resultado da requisição ' + Inttostr(HTTPClient.ResponseCode));
      end;

    except
      on E: Exception do
      begin
        raise Exception.Create('Erro ao obter dados.' + E.Message);
      end;

    end;
  finally
    JsonSTreamEnvio.Free;
    FreeAndNil(HTTPClient);
    FreeAndNil(LDWJsonValue);

    LdadosRequisicao.Comandos.Clear;
    LdadosRequisicao.Comandos.free;
  end;
end;
      }

function Tdm.executaSQL(ASQL: string): Boolean;
var
  ts: TFDTransaction;
  q: TFDQuery;
  LMensagem: string;
begin

  result := False;

  ts := TFDTransaction.Create(Self);
  ts.Connection := fdRestaurante;
  q := TFDQuery.Create(Self);
  q.Connection := dm.fdRestaurante;
  q.Transaction := ts;

  try
    try
      ts.StartTransaction;
      q.Active := False;
      q.SQL.Clear;
      q.SQL.Add(ASQL);
      q.ExecSQL;
      q.Active := False;
      ts.Commit;
    except
      on E: Exception do
      begin
        LMensagem := 'Erro ao executar SQL :' + E.Message + sLineBreak + sLineBreak + ASQL;
        ShowRealDialog(frm_principal, tmErro, 'Ocorreu  um erro', 'Erro ao executar operações no banco de dados!', 18);
        dm.adicionaLog(LMensagem);
        raise Exception.Create(LMensagem);
        ts.Rollback;
      end;
    end;
  finally
    q.Active := False;
    FreeAndNil(q);
    FreeAndNil(ts);
  end;
end;

procedure Tdm.getSaboresPizzaPedidoPlataforma(APedido: TPedidoPlataforma; AIdProdutoPedido: integer);
begin

end;

procedure Tdm.getProdutosDoPedidoPlataforma(APedido: TPedidoPlataforma);
var
  LSQL: TStringList;
  tbAux: TFDMemTable;
  LItemPedido: TProdutoPlataforma;
  idProdutoPedido: LongInt;
  LSaborPizza: TSaborPizzaPlataforma;
  tbSaboresPizza: TFDMemTable;
begin

  LSQL := TStringList.Create;
  tbAux := TFDMemTable.Create(self);
  tbSaboresPizza := TFDMemTable.Create(self);

  try
    try
      APedido.destroiListaDeProdutos;
      APedido.criaListaDeProdutos;

//      LSQL.Add(' select * from r_integracoes_produtos_pedido(' + IntTostr(APedido.idPedido) + ')');

      LSQL.Clear;
      LSQL.Add('    select pp.id, pp.cod_produto, p.descricao,pp.quantidade, pp.preco, (pp.quantidade * pp.preco) as total, pp.observacoes, pp.pizza, pp.sabores, pp.tam_pizza, pp.id_pai ');
      LSQL.Add('from integracoes_produtos_pedido pp');
      LSQL.Add('inner join produtos p on (p.cod_barras = pp.cod_produto)');
      LSQL.Add('where pp.id_pedido=:VPIDPedido');
      LSQL.Add('order by pp.id ');
      LSQL.Text := StringReplace(LSQL.Text, ':VPIDPedido', IntTostr(APedido.idPedido), [rfReplaceAll]);
      dm.adicionalog(LSQL.Text);

      getMemTable(tbAux, LSQL.Text);

      tbAux.First;
      while not tbAux.eof do
      begin
        LItemPedido := TProdutoPlataforma.Create;
        idProdutoPedido := tbAux.FieldByName('id').Value;
        LItemPedido.IDProdutoPai := tbAux.FieldByName('id_pai').Value;
        LItemPedido.CodigoPDV := tbAux.FieldByName('cod_produto').Value;
        LItemPedido.Nome := tbAux.FieldByName('descricao').Value;
        LItemPedido.quantidade := tbAux.FieldByName('quantidade').Value;
        LItemPedido.preco := tbAux.FieldByName('preco').Value;
        LItemPedido.total := tbAux.FieldByName('total').Value;
        LItemPedido.ObservacaoPreparo := tbAux.FieldByName('observacoes').Value;

        LItemPedido.pizza := StrToBool(Inttostr(tbAux.FieldByName('pizza').Value));
        if LItemPedido.pizza then
        begin
          LItemPedido.saboresPizzaDescricao := tbAux.FieldByName('sabores').Value;
          LSQL.Clear;
          LSQL.Add('select * from  INTEGRACOES_SABORES_PIZZA  sb where sb.id_pedido=' + INttostr(APedido.idPedido) + ' and sb.ID_PROD_PEDIDO=' + IntToStr(idProdutoPedido));
          LSQL.Add(' order by id');
          getMemTable(tbSaboresPizza, LSQL.Text);
          tbSaboresPizza.First;

          while not tbSaboresPizza.Eof do
          begin
            LSaborPizza := TSaborPizzaPlataforma.Create;
            LSaborPizza.codSabor := tbSaboresPizza.FieldByName('cod_sabor').Value;
            LSaborPizza.codProduto := tbSaboresPizza.FieldByName('cod_produto').Value;
            LSaborPizza.proporcao := tbSaboresPizza.FieldByName('proporcao').Value;
            LSaborPizza.Descricao := tbSaboresPizza.FieldByName('descricao').Value;
            LSaborPizza.Quantidade := tbSaboresPizza.FieldByName('quantidade').Value;
            LSaborPizza.valorUnitario := tbSaboresPizza.FieldByName('VALOR_UNITARIO').Value;
            LItemPedido.SaboresPizza.Add(LSaborPizza);
            tbSaboresPizza.Next;
          end;
        end;

        APedido.Produtos.Add(LItemPedido);
        tbAux.Next;
      end;

      if APedido.TaxaServico > 0 then
      begin
        LItemPedido := TProdutoPlataforma.Create;

        idProdutoPedido := tbAux.FieldByName('id').Value;
        LItemPedido.IDProdutoPai := 0;
        LItemPedido.CodigoPDV := '99997';
        LItemPedido.Nome := 'TAXA DE SERVICO IFOOD';
        LItemPedido.quantidade := 1;
        LItemPedido.preco := APedido.TaxaServico;
        LItemPedido.total := APedido.TaxaServico;
        LItemPedido.ObservacaoPreparo := '';
        APedido.Produtos.Add(LItemPedido);
      end;

    except
      on E: Exception do
      begin
        ////dm.adicionalog(LSQL.Text);
        dm.exibe_painel_erro('Erro ao buscar os produtos do pedido na plataforma!', 'Ok');
        raise Exception.Create('Erro ao buscar os produtos do pedido na plataforma!');
      end;
    end;

  finally
    FreeAndNil(LSQL);
    FreeAndNil(tbAux);
    FreeAndNil(tbSaboresPizza);
   // FreeAndNil(LItemPedido);
  end;
end;

procedure Tdm.getPagamentosDoPedidoPlataforma(APedido: TPedidoPlataforma);
var
  LSQL: TStringList;
  tbAux: TFDMemTable;
  LFormaPagto: TFormaPagtoPlataforma;
begin

  LSQL := TStringList.Create;
  tbAux := TFDMemTable.Create(self);

  try
    try
      APedido.destroiListaDePagamentos;
      APedido.criaListaDePagamentos;
      LSQL.Clear;
      LSQL.Add('  select fpi.id, fpi.codigo_pdv, fps.descricao, fp.valor, coalesce(fp.transacao,' + Quotedstr('') + ') as bandeira ');
      LSQL.Add('    from  integracoes_pedidos_pagto fp');
      LSQL.Add('      inner join integracoes_formas_pagto fpi on (fpi.id = fp.id_forma_pagamento)');
      LSQL.Add('      inner join formas_pagamento fps on (fps.cod_forma = fpi.codigo_pdv)');
      LSQL.Add('      where fp.id_pedido=' + IntToStr(APedido.idPedido));
      getMemTable(tbAux, LSQL.Text);
      ////dm.adicionalog(LSQL.Text);

      tbAux.First;
      while not tbAux.eof do
      begin
        LFormaPagto := TFormaPagtoPlataforma.Create;
        LFormaPagto.id := tbAux.FieldByName('id').Value;
        LFormaPagto.descricao := tbAux.FieldByName('descricao').Value;
        if (trim(tbAux.FieldByName('bandeira').Value) <> '') then
          LFormaPagto.descricao := LFormaPagto.descricao + ' (' + tbAux.FieldByName('bandeira').Value + ')';

        LFormaPagto.codigoPDV := tbAux.FieldByName('codigo_pdv').Value;
        LFormaPagto.valor := tbAux.FieldByName('valor').Value;
        APedido.Pagamentos.Add(LFormaPagto);
        tbAux.Next;
      end;

    except
      on E: Exception do
      begin
        dm.exibe_painel_erro('Erro ao buscar as formas de pagamento do pedido na plataforma!', 'Ok');
        raise Exception.Create('Erro ao buscar as formas de pagamento do pedido na plataforma!');
      end;
    end;

  finally
    FreeAndNil(LSQL);
    FreeAndNil(tbAux);
  end;
end;

procedure Tdm.getDadosDoPedido(APedido: TPedidoPlataforma);
var
  LSQL: TStringList;
  tbAux: TFDMemTable;
begin

  LSQL := TStringList.Create;
  tbAux := TFDMemTable.Create(self);

  try

    try

      LSQL.add(' select p.id,p.RESPONSAVEL_ENTREGA, p.telefone_pedido, p.id_pedido_plataforma, p.localizador,p.tipo_entrega, p.status_integracao_sistema, ');
      LSQL.add('   p.codigo_plataforma, p.cpf_nota, ipf.nome as NomePlataforma,coalesce(p.PAGAMENTO_PENDENTE,0) as PAGAMENTO_PENDENTE, ');
      LSQL.add('   ipf.tabela_preco , p.confirmado, p.cancelado, (p.complemento ||' + QuotedStr(' - ') + ' || coalesce(ed.referencia,' + QuotedStr('') + ')' + ') as complemento,p.subtotal_pedido,p.valor_taxa_entrega,p.total_pedido, coalesce(p.desconto,0) as desconto, coalesce(p.taxas_adicionais,0) as taxasAdicionais,');
      LSQL.add('       ic.id as IdCliente,ic.UUID_PLATAFORMA,ic.ID_NUMERICO_PLATAFORMA, ic.nome as NomeClientePlataforma, coalesce(cd.telefone,' + QuotedStr('') + ') as telefoneSistema, ic.qtd_pedidos,  cast(coalesce(cd.codigo,0) as integer) as CodClienteSistema,  coalesce(cd.nome,' + QuotedStr('') + ') as nomeClienteSistema,');
      LSQL.add('       cast(coalesce(br.codigo,0) as integer) as codBairroSistema, coalesce(br.descricao,' + QuotedStr('') + ') as DescricaoBairroSistema,    ');
      LSQL.Add('         ed.id as IdEndereco,  ed.endereco_completo as EnderecoCompleto, ed.numero as numeroEndereco, ed.cep, ed.id_logradouro, ed.latitude, ed.longitude');
      LSQL.add('         from integracoes_pedidos p                                                                                       ');
      LSQL.add('         inner  join integracoes_plataformas ipf on (ipf.id = p.codigo_plataforma)                                        ');
      LSQL.add('         left   join integracoes_clientes      ic on (ic.id = p.id_cliente)                                               ');
      LSQL.add('         left   join integracoes_enderecos     ed on (ed.id = p.id_endereco)                                              ');
      LSQL.add('         left   join integracoes_logradouros   el on (el.id = ed.id_logradouro)                                           ');
      LSQL.add('         left   join integracoes_bairro        eb on (eb.id = el.id_bairro)                                               ');
      LSQL.add('         left   join bairro                    br on (br.codigo = eb.cod_bairro_sistema)                                  ');
      LSQL.add('         left   join clientes_delivery         cd on (cd.codigo = ic.cod_cliente_sistema)                                 ');
      LSQL.add('         where p.id =' + IntToStr(APedido.idPedido));
      dm.getMemTable(tbAux, LSQL.Text);
      dm.adicionalog(LSQL.Text);

      if tbAux.IsEmpty = False then
      begin
        APedido.Plataforma.id := tbAux.FieldByName('codigo_plataforma').Value;
        APedido.Plataforma.Nome := tbAux.FieldByName('NomePlataforma').Value;
        APedido.Plataforma.CodTabelaPreco := tbAux.FieldByName('tabela_preco').Value;
        APedido.idPedidoPlataforma := tbAux.FieldByName('id_pedido_plataforma').Value;

        APedido.idClientePlataforma := tbAux.FieldByName('IdCliente').Value;
        APedido.StatusIntegracaoAtual := tbAux.FieldByName('status_integracao_sistema').Value;
        APedido.codClienteSistema := tbAux.FieldByName('CodClienteSistema').Value;
        APedido.NomeClienteSistema := tbAux.FieldByName('nomeClienteSistema').Value;
        APedido.codBairroSistema := tbAux.FieldByName('codBairroSistema').Value;
        APedido.NomeBairroSistema := tbAux.FieldByName('DescricaoBairroSistema').Value;
        APedido.Complemento := tbAux.FieldByName('complemento').Value;
        APedido.confirmado := StrToBool(IntToStr(tbAux.FieldByName('confirmado').Value));
        APedido.cancelado := StrToBool(IntToStr(tbAux.FieldByName('cancelado').Value));
        APedido.integrado := StrToBool(IntToStr(tbAux.FieldByName('status_integracao_sistema').Value));
        APedido.retirarNoLocal := StrToBool(IntToStr(tbAux.FieldByName('tipo_entrega').Value));
        APedido.ResponsavelEntrega := StrToBool(IntToStr(tbAux.FieldByName('RESPONSAVEL_ENTREGA').Value));

        APedido.Localizador := tbAux.FieldByName('localizador').Value;
        APedido.subtotal := tbAux.FieldByName('SUBTOTAL_PEDIDO').Value;
        APedido.TaxaDeEntrega := tbAux.FieldByName('VALOR_TAXA_ENTREGA').Value;
        APedido.TaxaServico := tbAux.FieldByName('TaxasAdicionais').Value;
        APedido.Total := tbAux.FieldByName('TOTAL_PEDIDO').Value;
        APedido.Desconto := tbAux.FieldByName('desconto').Value;
        APedido.ValorPagamentoPendente := tbAux.FieldByName('PAGAMENTO_PENDENTE').Value;

        APedido.cliente.ID := tbAux.FieldByName('IdCliente').Value;
        APedido.cliente.codPlataforma := tbAux.FieldByName('codigo_plataforma').Value;
        APedido.cliente.Nome := tbAux.FieldByName('NomeClientePlataforma').Value;
        APedido.cliente.telefone := tbAux.FieldByName('telefoneSistema').Value;

        case APedido.cliente.codPlataforma of
          1:
            begin
              if Trim(APedido.cliente.telefone) = '' then
                APedido.cliente.telefone := (APedido.Localizador);

            end;
          2:
            begin
              APedido.cliente.telefone := tbAux.FieldByName('telefone_pedido').Value
            end;
        end;

        APedido.CPFCliente := tbAux.FieldByName('cpf_nota').Value;
        APedido.cliente.IDClientePlataforma := tbAux.FieldByName('UUID_PLATAFORMA').Value;
        APedido.cliente.IDNumericoPlataforma := tbAux.FieldByName('ID_NUMERICO_PLATAFORMA').Value;
        APedido.cliente.QtdPedidos := tbAux.FieldByName('qtd_pedidos').Value;

        APedido.Endereco.ID := tbAux.FieldByName('IdEndereco').Value;
        APedido.Endereco.idCliente := tbAux.FieldByName('IdCliente').Value;
        APedido.Endereco.CodPlataforma := tbAux.FieldByName('codigo_plataforma').Value;
        APedido.Endereco.Endereco := tbAux.FieldByName('EnderecoCompleto').Value;
        APedido.Endereco.numero := tbAux.FieldByName('numeroEndereco').Value;
        APedido.Endereco.CEP := tbAux.FieldByName('cep').Value;
        APedido.Endereco.IdLogradouro := tbAux.FieldByName('id_logradouro').Value;
        APedido.Endereco.Latitude := tbAux.FieldByName('latitude').Value;
        APedido.Endereco.longitude := tbAux.FieldByName('longitude').Value;
        getProdutosDoPedidoPlataforma(APedido);
        getPagamentosDoPedidoPlataforma(APedido);

        if APedido.codClienteSistema <> 0 then
          APedido.clienteIntegrado := True
        else
          APedido.clienteIntegrado := False;

        if APedido.codBairroSistema <> 0 then
          APedido.bairroIntegrado := True
        else
          APedido.bairroIntegrado := False;
      end;

    except
      on E: Exception do
      begin
        dm.exibe_painel_erro('Erro ao pegar status de pedido ' + IntToStr(APedido.idPedido) + sLineBreak + sLineBreak + E.Message, 'Ok');

      end
    end;
  finally
    tbAux.Close;
    FreeAndNil(LSQL);
    FreeAndNil(tbAux);
  end
end;

function Tdm.verificaSubtotalPedidoPlataforma(APedido: TPedidoPlataforma): boolean;
var
  i: Integer;
  totalProdutos: double;
begin
  result := False;
  totalProdutos := 0;
  for i := 0 to APedido.Produtos.Count - 1 do
  begin
    totalProdutos := totalProdutos + APedido.Produtos[i].total;
  end;

  if RoundABNT(totalProdutos, 2) = RoundABNT((APedido.subtotal + APedido.TaxaServico), 2) then
    result := True;
end;

procedure TDm.destroiComponentes(AParent: TComponent);
var
  cp: TComponent;
  I: integer;
  ct: Integer;
begin

  ct := AParent.ComponentCount;
  I := 0;

  while (I < ct) do
  begin
    if (I >= AParent.ComponentCount) then
      I := 0;

    if (AParent.ComponentCount > 0) then
    begin
      cp := (AParent.Components[I]);
      if assigned(cp) then
      begin
        destroiComponentes(cp);
        cp.Free;
      end;
    end
    else
    begin
      exit;
    end;

    I := I + 1;

  end;

end;

function Tdm.verificaSeTodosGruposComboForamSelecionados(): Boolean;
begin
  result := false;
  tbGruposCombo.First;
  while not tbGruposCombo.Eof do
  begin
    if (tbGruposCombo.FieldByName('codProdutoSelecionado').Value = '00000') then
    begin
      dm.exibe_painel_erro('Você ainda não selecionou o produto para o grupo: ' + tbGruposCombo.FieldByName('nome').Value, 'Ok');
      result := false;
      Exit;
    end;

    tbGruposCombo.Next;
  end;

  result := true;
end;

function TDM.criaGruposCombo(ACodProduto: string; AParent: TPanel; AcodGrupoSelecionado: LongInt; AonClick: TNotifyEvent): Boolean;
var
  LSQL: TStringList;
  selecionado: Boolean;
  LLinha, LColuna: SmallInt;
begin
  LSQL := TstringList.create;
  result := false;
  try
    try
      destroiComponentes(AParent);

      if (AcodGrupoSelecionado = 0) then
      begin
        LSQL.add(' select ga.id, ga.id as id_grupo_adicional,                                  ');
        LSQL.add('        ga.nome, ga.descricao,' + QuotedStr('00000') + ' as codProdutoSelecionado, 1.001 as valorProdutoSelecionado');
        LSQL.add('  from grupos_adicionais ga                                   ');
        LSQL.add('     where ga.cod_produto =' + Quotedstr(ACodProduto) + ' and ga.tipo in (0,1)  order by ga.id   ');
        dm.getMemTable(tbGruposCombo, LSQL.Text);
      end;

      if tbGruposCombo.IsEmpty = false then
      begin
        tbGruposCombo.First;
        selecionado := false;
        if AcodGrupoSelecionado = 0 then
        begin
          selecionado := true;
          AcodGrupoSelecionado := tbGruposCombo.FieldByName('id_grupo_adicional').Value
        end;

        if tbGruposCombo.RecordCount < 5 then
          AParent.Height := 70
        else
          AParent.Height := 140;

        LLinha := 1;
        LColuna := 0;

        while not tbGruposCombo.eof do
        begin
          if (AcodGrupoSelecionado = tbGruposCombo.FieldByName('id_grupo_adicional').Value) then
            selecionado := true;

          if LColuna >= 5 then
          begin
            LLinha := LLinha + 1;
            LColuna := 1;
          end
          else
          begin
            LColuna := LColuna + 1;
          end;

          criaBotaoGrupoCombo(LLinha, LColuna, tbGruposCombo.FieldByName('id_grupo_adicional').Value, tbGruposCombo.FieldByName('nome').Value, AParent, selecionado, AonClick);
          selecionado := false;
          tbGruposCombo.Next;
        end;

        tbGruposCombo.Locate('id_grupo_adicional', AcodGrupoSelecionado, []);
        filtraProdutosGrupoAdicionais(AcodGrupoSelecionado);

        result := true;
      end
      else
        result := false;

    except
      on E: Exception do
      begin
        dm.exibe_painel_erro('Erro ao criar os grupos do combo ' + sLineBreak + sLineBreak + E.Message, 'Ok');
        dm.adicionaLog('Erro ao criar os grupos do combo ' + sLineBreak + sLineBreak + E.Message);
        raise Exception.Create('Erro ao realizar operação');
      end;
    end;
  finally
    FreeAndNil(LSQL);
  end;
end;

procedure Tdm.filtraProdutosGrupoAdicionais(AGrupoCombo: integer);
var
  LSQL: TStringList;
begin
  LSQL := TstringList.create;

  try
    try
      LSQL.Clear;
      LSQL.Add('select pg.id,pg.id_grupo, pg.cod_produto,p.descricao,pg.valor ');
      LSQL.Add('      from produtos_grupos_adicionais pg');
      LSQL.Add('        inner join produtos p on (p.cod_produto = pg.cod_produto)');
      LSQL.Add('       where p.vende=1 and pg.id_grupo=' + Inttostr(AGrupoCombo) + ' order by p.descricao');
      qryProdutosAdicionais.Active := false;
      qryProdutosAdicionais.SQL.Clear;
      qryProdutosAdicionais.SQL.Add(LSQL.Text);
      qryProdutosAdicionais.Active := true;
      qryProdutosAdicionais.FetchAll;

    except
      on E: Exception do
      begin
        dm.exibe_painel_erro('Erro ao filtrar produtos do grupo de adicionais ', 'Ok');
        dm.adicionaLog(qryProdutosAdicionais.SQL.Text);
        raise Exception.Create('Erro ao filtrar produtos do grupo de adicionais');
      end;
    end;
  finally
    FreeAndNil(LSQL);

  end;
end;

procedure TDM.criaBotaoGrupoCombo(ALinha: SmallInt; AColuna: SmallInt; ACodigoGrupo: longint; ADescricao: string; AParent: TPanel; ASelecionado: Boolean; AOnClick: TNotifyEvent);
var
  pnGrupoCombo: TPanel;
  Image1: TImage;
  Label14: TLabel;
begin

  pnGrupoCombo := TPanel.Create(AParent);
  Image1 := TImage.Create(AParent);
  Label14 := TLabel.Create(AParent);

  try
    try
      pnGrupoCombo.Name := 'pnGrupoCombo_' + IntToStr(ACodigoGrupo);
      Image1.Name := 'imgGrupoCombo_' + IntToStr(ACodigoGrupo);
      Label14.Name := 'lbGrupoCombo_' + IntToStr(ACodigoGrupo);

      pnGrupoCombo.Parent := AParent;
      {
      pnGrupoCombo.Left := 210;

      if AIndice > 5 then
      begin
        pnGrupoCombo.Top := 132;
        if AIndice = 5 then
          pnGrupoCombo.Left := 0;
      end
      else
      }

      if AColuna = 1 then
        pnGrupoCombo.Left := 0
      else
        pnGrupoCombo.Left := (AColuna - 1) * 210;

      if ALinha = 1 then
        pnGrupoCombo.Top := 0
      else
        pnGrupoCombo.Top := (ALinha - 1) * 66;

      pnGrupoCombo.Width := 210;
      pnGrupoCombo.Height := 66;
      pnGrupoCombo.Align := alNone;
      pnGrupoCombo.BevelOuter := bvNone;
      pnGrupoCombo.Color := clWhite;
      pnGrupoCombo.ParentBackground := False;
      pnGrupoCombo.TabOrder := 0;
//      pnGrupoCombo.OnClick := AOnClick;
      pnGrupoCombo.Caption := '';

      Image1.Parent := pnGrupoCombo;

      Image1.Left := AParent.Width;
      Image1.OnClick := AOnClick;
      Image1.Top := 0;
      Image1.Width := 210;
      Image1.Height := 66;
      Image1.Align := alClient;
      if ASelecionado then
      begin
        Image1.Picture.LoadFromFile(patchAplicacao + 'imagens\timeline\selecionado.png');
        Label14.Font.Color := clwhite;
      end
      else
      begin

        Image1.Picture.LoadFromFile(patchAplicacao + 'imagens\timeline\combo.png');
        Label14.Font.Color := $00FFE09F;

      end;

      Label14.Parent := pnGrupoCombo;

      Label14.Caption := ADescricao;
      Label14.Left := 26;
      Label14.Top := 9;
      Label14.Width := 154;
      Label14.Height := 69;
      Label14.Alignment := taCenter;
      Label14.AutoSize := False;
      Label14.Caption := ADescricao;
      Label14.ParentFont := False;
      Label14.Font.Charset := ANSI_CHARSET;

      Label14.Font.Height := -19;
      Label14.Font.Name := 'Verdana';
      Label14.Font.Style := [];
      Label14.WordWrap := True;
      Label14.Transparent := True;
      Label14.OnClick := AOnClick;
    except

    end;
  finally

  end;

end;

procedure TDM.GravarXMLGrandeNotasDestinadas(const AChaveNFE, AXML: string);
var
  Q: TFDQuery;
  Ts: TFDTransaction;
begin

  Ts := TFDTransaction.Create(nil);
  Q := TFDQuery.Create(nil);
  try
    Ts.Connection := fdRestaurante;
    Q.Connection := fdRestaurante;
    Q.Transaction := Ts;

    try
      Ts.StartTransaction;
      Q.SQL.add(' update nfe_destinadas nf set nf.xml_nota=:AXML where nf.chave_nfe= :chave');
      Q.Prepare;
      Q.ParamByName('AXML').Value := AXML;
      Q.ParamByName('chave').Value := AChaveNFE;
      Q.ExecSQL;
      Ts.Commit;
    except
      on E: EFDDBEngineException do
      begin
        if Ts.Active then
          Ts.Rollback;
        raise Exception.CreateFmt('Erro ao gravar XML da nota %s: %s', [AChaveNFE, E.Message]);
      end;
      on E: Exception do
      begin
        if Ts.Active then
          Ts.Rollback;
        raise;
      end;
    end;
  finally
    Q.Free;
    Ts.Free;
  end;
end;

procedure TDM.SplitXML(AXML: string; LLista: Tstringlist);
var
  LTamanho: integer;
  LQtdeBloco: integer;
  I, inicio, fim: Integer;
  LStrAux: string;
  LCompletou: boolean;
begin
  LTamanho := StrLen(Pchar(AXML));
  LQtdeBloco := Round(LTamanho / 5);

  inicio := 0;
  fim := LQtdeBloco;
  LCompletou := false;
  while LCompletou = false do
  begin
    LStrAux := copy(AXML, inicio, LQtdeBloco);
    if trim(LStrAux) <> '' then
    begin
      LLista.Add(LStrAux);
      inicio := fim + 1;
      fim := fim + LQtdeBloco;
    end
    else
      LCompletou := true;
  end;
end;


{ TDadosRequisicaoAPIHorse }



{ TclasseTeste }

function TDM.IntToBol(AIntNumber: integer): boolean;
begin
  if AIntNumber = 0 then
    result := false
  else
    result := true;
end;

function TDM.BoolToInt(Abol: boolean): smallint;
begin
  if Abol = true then
    result := 1
  else
    result := 0;
end;

procedure Tdm.ApagarItensDoPedidoDoMovimento(AcodPedido: string);
var
  q: TIBQuery;
  ts: TIBTransaction;
begin

  ts := TIBTransaction.Create(nil);
  ts.Params.Add('read_committed');
  ts.Params.Add('rec_version');
  ts.Params.Add('nowait');
  ts.DefaultDatabase := dm.dbrestaurante;

  q := TIBQuery.Create(self);
  q.Database := dm.dbrestaurante;
  q.Transaction := ts;

  try

    try
      begin
        q.SQL.Add(' delete from movimento_mesa ms ');
        q.SQL.Add('  where ms.id in  (select ip.id');
        q.SQL.Add('       from itens_pedido_delivery ip where ip.cod_pedido = :vpCodPedido)');
        q.Prepare;
        q.ParamByName('vpCodPedido').Value := AcodPedido;

        q.ExecSQL;
        ts.Commit;
      end;
    except
      on E: Exception do
      begin
        ts.Rollback;
        raise Exception.Create('Erro ao apagar ítens do movimento. ' + sLineBreak + 'Erro:' + E.Message);
      end;
    end

  finally
    q.Active := false;
    FreeAndNil(q);

    ts.Active := false;
    FreeAndNil(ts);
  end;
end;

function TDM.ConvertToStatusCode(Value: integer): THttpStatusCode;
begin
  for result := Low(THttpStatusCode) to High(THttpStatusCode) do
    if Value = HTTP_CODES[result] then
      Exit;

  result := scUnknown;
end;

procedure TDM.AddHeaders(ARequisicao: TRESTRequest; AHeaders: TStringList);
var
  AParam: TRESTRequestParameter;
  I: Integer;
begin
  for I := 0 to AHeaders.Count - 1 do
  begin
    AParam := TRESTRequestParameter.Create(ARequisicao.Params);
    AParam.Kind := pkHTTPHEADER;
    AParam.Name := trim(AHeaders.Names[I]);
    AParam.Value := trim(AHeaders.ValueFromIndex[I]);
    AParam.Options := [poDoNotEncode];
  end;
end;

procedure TDM.AddBodyForm(ARequisicao: TRESTRequest; ABody: TStringList);
var
  AParam: TRESTRequestParameter;
  I: Integer;
begin
  for I := 0 to ABody.Count - 1 do
  begin
    AParam := TRESTRequestParameter.Create(ARequisicao.Params);
    AParam.Name := triM(ABody.Names[I]);
    AParam.Value := triM(ABody.ValueFromIndex[I]);
    AParam.Options := [poDoNotEncode];
    AParam.ContentType := 'application/x-www-form-urlencoded';
  end;
end;

function TDM.HTTPRequest(AMethod: TRestRequestMethod; ASucessCode: THttpStatusCode; AURL_Base: string; ARota: string; URLParam: string; AHeaders: TStringList; ABody: TStringList; AResponseString: TStringList; AConnectTimeout: Integer; AReadTimeout: Integer; ABodyType: string): Boolean;
var
  LURI: string;
  Resposta: string;
  LBuffer: TBytes;
  Request: TRESTRequest;
  Response: TRESTResponse;
  ResponseCode: THttpStatusCode;
  I: Integer;
begin

  Request := TRESTRequest.Create(self);
  Response := TRESTResponse.Create(self);

  AResponseString.Clear;
  result := false;

  try
    try
      RESTClient1.BaseURL := AURL_Base + ARota;
      RESTClient1.BaseURL := StringReplace(RESTClient1.BaseURL, ':URLParam_0', URLParam, [rfReplaceAll, rfIgnoreCase]);

      RESTClient1.ContentType := 'application/json';

      Request.Client := RESTClient1;
      Request.Response := Response;
      Request.AssignedValues := RESTRequest1.AssignedValues;
      Request.Method := AMethod;

      Request.ConnectTimeout := AConnectTimeout * 1000;
      Request.ReadTimeout := AReadTimeout * 1000;
      AddHeaders(Request, AHeaders);

      if ((Request.Method in [rmPOST, rmPUT]) and (trim(ABody.Text) <> '')) then
      begin

        if ABodyType = 'application/x-www-form-urlencoded' then
        begin
          RESTClient1.ContentType := 'application/x-www-form-urlencoded';
          AddBodyForm(Request, ABody)
        end
        else
        begin
          AddCustomBody(Request, ABody);
        end;

      end;

      try
        try
          Request.Execute;
        except
          on E: Exception do
          begin
            raise Exception.Create(e.Message);
            result := false;
          end;
        end;

        ResponseCode := ConvertToStatusCode(Response.StatusCode);
        if not (ResponseCode in [scInternalServerError, scNotFound, scBadRequest]) then
        begin

          if ResponseCode in [ASucessCode, scNoContent, scOk, scAccepted] then
          begin

            Resposta := Response.Content;
            AResponseString.Text := Resposta;
            result := true;
          end
          else
          begin
            AResponseString.Clear;
            AResponseString.Add('Url: ' + RESTClient1.BaseURL);
            AResponseString.Add('Status: ' + Response.StatusText);
            AResponseString.Add('Retorno: ' + Response.Content);
            result := false;
          end;
        end;

      except
        on E: Exception do
        begin
          AResponseString.Clear;
          AResponseString.Add('Status: ' + Response.StatusText);
          AResponseString.Add('Retorno: ' + Response.Content);

          raise Exception.Create('Erro na requisição Http ' + e.Message);
          AResponseString.Clear;
          result := false;
        end;
      end;

    except
      on E: Exception do
      begin
        raise Exception.Create('Erro ao fazer requisição http!' + sLineBreak + sLineBreak + E.Message);
        result := false;
      end;

    end;

  finally

    FreeAndNil(Request);
    FreeAndNil(Response);

  end;
end;

procedure TDM.AddCustomBody(ARequisicao: TRESTRequest; ABody: TStringList);
var
  AParam: TRESTRequestParameter;
begin

  AParam := TRESTRequestParameter.Create(ARequisicao.Params);
  AParam.Name := 'bodyE6F48B38F5CF428EBB4450B1DD2EE28F';
  AParam.Value := ABody.Text;
  AParam.Options := [poDoNotEncode];
  AParam.Kind := pkREQUESTBODY;
  AParam.ContentType := ctAPPLICATION_JSON;

end;

procedure TDM.AtualizarCustosDaVenda(ACodVenda: string);
var
  LSQL: TStringList;
begin
  LSQL := TStringList.Create;
  try
    LSQL.add(' UPDATE movimento_venda mv                                                    ');
    LSQL.add(' SET mv.custo = (                                                             ');
    LSQL.add('     SELECT  SUM(cp.custo_unitario_produto * cp.qtd_baixa_prod)               ');
    LSQL.add('        FROM calcula_custo_produto_novo(mv.cod_produto ,mv.cod_produto,1) cp) ');
    LSQL.add('        WHERE mv.cod_venda =' + Quotedstr(ACodVenda));
    try
      dm.executaSQL(LSQL.Text);
    except
      on E: Exception do
      begin
        dm.adicionaLog('Erro ao atualizar custos da venda nº ' + ACodVenda);
        dm.adicionaLog('Erro: ' + e.Message);
      end;
    end;
  finally
    FreeAndNil(LSQL);
  end;
end;

function Tdm.GetSQLPedidosPorEntregador(ACodEmpresa: string; ACodCaixa: string): string;
var
  LSQL: Tstringlist;
  LDataInicial, LDataFinal: string;
begin
  LSQL := TStringList.Create;

  try
    try
      LSQL.Add(' select count(*) as QtdePedidos,                                      ');
      LSQL.Add('        et.nome_entregador,                                           ');
      LSQL.Add('        sum(pd.valor_entrega) as TotalEntregas                        ');
      LSQL.Add('    from pedidos_delivery pd                                          ');
      LSQL.Add('       inner join entregadores et on (et.codigo = pd.cod_entregador)  ');
      LSQL.Add('    where pd.status=3                                                 ');
      LSQL.Add('   and pd.cod_caixa=:ACodCaixa                                        ');
      LSQL.Add('   and pd.cod_empresa=:ACodEmpresa                                    ');
      LSQL.Add('    group by pd.cod_entregador , et.nome_entregador                   ');
      LSQL.text := StringReplace(LSQL.text, ':ACodCaixa', Quotedstr(ACodCaixa), [rfReplaceAll]);
      LSQL.text := StringReplace(LSQL.text, ':ACodEmpresa', Quotedstr(ACodEmpresa), [rfReplaceAll]);
      dm.adicionaLog(LSQL.Text);
      result := LSQL.Text;

    except
      on E: Exception do
      begin
        raise E.Create('Erro ao gerar o SQL do relatório de taxa de serviço');
      end;

    end;
  finally
    FreeAndNil(LSQL);
  end;
end;

function Tdm.getSQLProdutosVendidosCaixa(ACodEmpresa: string; ACodCaixa: string; ADataCaixa: Tdate): string;
var
  LSQL: Tstringlist;
  LDataInicial, LDataFinal: string;
begin
  LSQL := TStringList.Create;

  try
    try
      LSQL.add(' with ProdutosVendidos as (                                                                                     ');
      LSQL.add('   select cod_produto, p.descricao, p.cod_grupo                                                                 ');
      LSQL.add('      from produtos p                                                                                           ');
      LSQL.add('       where p.cod_produto                                                                                      ');
      LSQL.add('        in                                                                                                      ');
      LSQL.add('         ( select mv.cod_produto                                                                                ');
      LSQL.add('           from movimento_venda mv                                                                              ');
      LSQL.add('             where mv.cod_empresa=:ACodEmpresa                                                                  ');
      LSQL.add('              and mv.cod_caixa=:ACodCaixa   ');
      LSQL.add('              and mv.data=' + Quotedstr(FormatDateTime('DD.MM.YYY', ADataCaixa)));
      LSQL.add('         )                                                                                                      ');
      LSQL.add('                                                                                                                ');
      LSQL.add('  ),                                                                                                            ');
      LSQL.add(' ProdutosMesa as (                                                                                              ');
      LSQL.add('    select mv.cod_produto,                                                                                      ');
      LSQL.add('           coalesce(sum(mv.quantidade),0) as qtdMesa,                                                           ');
      LSQL.add('            coalesce( sum(mv.quantidade * mv.valor_unitario),0) as totalMesa                                    ');
      LSQL.add('            from movimento_venda mv                                                                             ');
      LSQL.add('           inner join vendas v on (v.cod_venda = mv.cod_venda)                                                  ');
      LSQL.add('            where v.cod_empresa=:ACodEmpresa                                                                    ');
      LSQL.add('              and v.cod_caixa=:ACodCaixa                                                                        ');
      LSQL.add('              and v.tipo_venda=1                                                                                ');
      LSQL.add('              and coalesce(v.cancelada,0) =0                                                                                ');
      LSQL.add('              and mv.data=' + Quotedstr(FormatDateTime('DD.MM.YYY', ADataCaixa)));
      LSQL.add('             group by mv.cod_produto                                                                            ');
      LSQL.add('   ),                                                                                                           ');
      LSQL.add('   ProdutosBalcao  as (                                                                                         ');
      LSQL.add('    select mv.cod_produto,                                                                                      ');
      LSQL.add('             coalesce(sum(mv.quantidade),0) as qtdBalcao,                                                       ');
      LSQL.add('             coalesce(sum(mv.quantidade * mv.valor_unitario),0) as totalBalcao                                  ');
      LSQL.add('            from movimento_venda mv                                                                             ');
      LSQL.add('           inner join vendas v on (v.cod_venda = mv.cod_venda)                                                  ');
      LSQL.add('            where v.cod_empresa=:ACodEmpresa                                                                    ');
      LSQL.add('              and v.cod_caixa=:ACodCaixa                                                                        ');
      LSQL.add('              and v.tipo_venda=2                                                                                ');
      LSQL.add('              and coalesce(v.cancelada,0) =0                                                                                ');
      LSQL.add('              and mv.data=' + Quotedstr(FormatDateTime('DD.MM.YYY', ADataCaixa)));
      LSQL.add('             group by mv.cod_produto                                                                            ');
      LSQL.add('    ),                                                                                                          ');
      LSQL.add('    ProdutosDelivery as (                                                                                       ');
      LSQL.add('    select mv.cod_produto,                                                                                      ');
      LSQL.add('            coalesce( sum(mv.quantidade),0) as qtdDelivery,                                                     ');
      LSQL.add('             coalesce(sum(mv.quantidade * mv.valor_unitario),0) as totalDelivery                                ');
      LSQL.add('            from movimento_venda mv                                                                             ');
      LSQL.add('           inner join vendas v on (v.cod_venda = mv.cod_venda)                                                  ');
      LSQL.add('            where v.cod_empresa=:ACodEmpresa                                                                    ');
      LSQL.add('              and v.cod_caixa=:ACodCaixa                                                                        ');
      LSQL.add('              and v.tipo_venda=3                                                                                ');
      LSQL.add('              and coalesce(v.cancelada,0) =0                                                                                ');
      LSQL.add('              and mv.data=' + Quotedstr(FormatDateTime('DD.MM.YYY', ADataCaixa)));
      LSQL.add('             group by mv.cod_produto                                                                            ');
      LSQL.add('     )                                                                                                          ');
      LSQL.add('      select pd.cod_produto,                                                                                    ');
      LSQL.add('             pd.cod_grupo,                                                                                      ');
      LSQL.add('             pd.descricao, trim(rg.descricao) as grupo,                                                         ');
      LSQL.add('             udf_roundabnt(coalesce(PM.qtdMesa, 0),3) as qtdMesa,                                               ');
      LSQL.add('             coalesce(PM.totalMesa, 0) as totalMesa,                                                            ');
      LSQL.add('             udf_roundabnt(coalesce(PB.qtdBalcao, 0),3) as QtdBalcao,                                           ');
      LSQL.add('             coalesce(PB.totalBalcao, 0) as totalBalcao,                                                        ');
      LSQL.add('             udf_roundabnt(coalesce(PL.qtdDelivery, 0),3) as qtdDelivery,                                       ');
      LSQL.add('             coalesce(PL.totalDelivery, 0) as totalDelivery,                                                    ');
      LSQL.add('             (coalesce(totalMesa,0) + coalesce(totalBalcao,0) + coalesce(totalDelivery,0) ) as TotalVendas      ');
      LSQL.add('              from ProdutosVendidos pd                                                                          ');
      LSQL.add('          left  join ProdutosBalcao PB on (pb.cod_produto = pd.cod_produto)                                     ');
      LSQL.add('          left  join ProdutosMesa PM on (PM.cod_produto = pd.cod_produto)                                       ');
      LSQL.add('          left join ProdutosDelivery PL on (PL.cod_produto = pd.cod_produto)                                    ');
      LSQL.add('          inner join r_grupos rg on (rg.cod_grupo = pd.cod_grupo)                                               ');
      LSQL.add('          order by rg.cod_grupo_raiz, rg.desdobramento_pai, rg.desdobramento_filho, pd.descricao                ');

      LSQL.text := StringReplace(LSQL.text, ':ACodCaixa', Quotedstr(ACodCaixa), [rfReplaceAll]);
      LSQL.text := StringReplace(LSQL.text, ':ACodEmpresa', Quotedstr(ACodEmpresa), [rfReplaceAll]);
      dm.adicionaLog(LSQL.Text);
      result := LSQL.Text;

    except
      on E: Exception do
      begin
        raise E.Create('Erro ao gerar o SQL de produtos vendidos do caixa!');
      end;

    end;
  finally
    FreeAndNil(LSQL);
  end;
end;

function Tdm.getSQLRelatorioTaxaServico(ACodEmpresa: string; ACodCaixa: string; ADataInicial: TDateTime; ADataFinal: TDateTime): string;
var
  LSQL: Tstringlist;
  LDataInicial, LDataFinal: string;
begin
  LSQL := TStringList.Create;
  if trim(ACodCaixa) <> '' then
  begin
    LDataInicial := Quotedstr(FormatDateTime('DD.MM.YYY', ADataInicial));
    LDataFinal := Quotedstr(FormatDateTime('DD.MM.YYY', ADataFinal));
  end;

  try
    try

      LSQL.add('  with movimentoGarcon as                                                                                                                                                ');
      LSQL.add('   (                                                                                                                                                                     ');
      LSQL.add('                                                                                                                                                                         ');
      LSQL.add('      select 1 as id,                                                                                                                                                    ');
      LSQL.add('         mv.cod_garcon,                                                                                                                                                  ');
      LSQL.add('          coalesce(udf_roundabnt(sum(mv.quantidade * mv.valor_unitario),2),0) as totalVendasGarcon                                                                       ');
      LSQL.add('           from movimento_venda mv                                                                                                                                       ');
      LSQL.add('            inner join produtos p on (p.cod_produto = mv.cod_produto)                                                                                                    ');
      LSQL.add('            inner join vendas v on   ( (v.cod_venda = mv.cod_venda) and (v.cod_empresa = mv.cod_empresa) and (v.valor_txserv > 0) )                                                               ');
      LSQL.add(' where 1=1');
      if trim(ACodCaixa) <> '' then
      begin
        LSQL.add('              and mv.cod_caixa=:ACodCaixa                                                                                                                              ');
      end
      else
      begin
        LSQL.add('  and v.data between :ADataInicial and :ADataFinal ');
      end;

      LSQL.add('                 and mv.cod_empresa=:ACodEmpresa                                                                                                                         ');
      LSQL.add('                 and v.valor_txserv > 0                                                                                                                                  ');
      LSQL.add('             and p.incide_servico=1                                                                                                                                      ');
      LSQL.add('            group by mv.cod_garcon                                                                                                                                       ');
      LSQL.add('    ),                                                                                                                                                                   ');
      LSQL.add('                                                                                                                                                                         ');
      LSQL.add('   comissoesExtras as                                                                                                                                                    ');
      LSQL.add('   (                                                                                                                                                                     ');
      LSQL.add('                                                                                                                                                                         ');
      LSQL.add('      select 1 as id,                                                                                                                                                    ');
      LSQL.add('         mv.cod_garcon,                                                                                                                                                  ');
      LSQL.add('          coalesce(udf_roundabnt(sum(mv.quantidade * p.valor_comissao ),2),0) as totalComissoesExtras                                                                    ');
      LSQL.add('           from movimento_venda mv                                                                                                                                       ');
      LSQL.add('            inner join produtos p on (p.cod_produto = mv.cod_produto)                                                                                                    ');
      LSQL.add('            inner join vendas v on   ( (v.cod_venda = mv.cod_venda) and (v.cod_empresa = mv.cod_empresa) )                                                               ');
      LSQL.add(' where 1=1');
      if trim(ACodCaixa) <> '' then
      begin
        LSQL.add('              and mv.cod_caixa=:ACodCaixa                                                                                                                              ');
      end
      else
      begin
        LSQL.add('  and v.data between :ADataInicial and :ADataFinal ');
      end;

      LSQL.add('                 and mv.cod_empresa=:ACodEmpresa                                                                                                                         ');
      LSQL.add('             and p.valor_comissao > 0                                                                                                                                    ');
      LSQL.add('            group by mv.cod_garcon                                                                                                                                       ');
      LSQL.add('    ),                                                                                                                                                                   ');
      LSQL.add('                                                                                                                                                                         ');
      LSQL.add('                                                                                                                                                                         ');
      LSQL.add('   vendasComTxServico as                                                                                                                                                 ');
      LSQL.add('   (                                                                                                                                                                     ');
      LSQL.add('     select 1 as id,                                                                                                                                                     ');
      LSQL.add(' coalesce( sum(v.valor_bruto ),0) as totalVendasPagaramTxServico,    ');
      LSQL.add('     coalesce( sum(v.valor_txserv),0) as totalTaxaServico                                                                                                                ');
      LSQL.add('        from vendas v                                                                                                                                                    ');
      LSQL.add(' where 1=1');
      if trim(ACodCaixa) <> '' then
      begin
        LSQL.add('       and cod_caixa=:ACodCaixa                                                                                                                                      ');
      end
      else
      begin
        LSQL.add('  and v.data between :ADataInicial and :ADataFinal ');
      end;
      LSQL.add('            and v.cod_empresa = :ACodEmpresa                                                                                                                             ');
      LSQL.add('            and v.valor_txserv > 0                                                                                                                                       ');
      LSQL.add('                                                                                                                                                                         ');
      LSQL.add('   ),                                                                                                                                                                    ');
      LSQL.add('                                                                                                                                                                         ');
      LSQL.add('   percentuaisParametros as                                                                                                                                              ');
      LSQL.add('   (                                                                                                                                                                     ');
      LSQL.add('     select 1 as id,                                                                                                                                                     ');
      LSQL.add('           coalesce( (pr.percentual_servico_garcom / 100),0) as pctGarcon,                                                                                               ');
      LSQL.add('           coalesce( (pr.percentual_servico_casa / 100),0) as pctCasa,                                                                                                   ');
      LSQL.add('           coalesce((pr.percentual_servico_funcionarios / 100),0) as pctFuncionarios                                                                                     ');
      LSQL.add('            from parametros pr                                                                                                                                           ');
      LSQL.add('            where pr.cod_empresa = :ACodEmpresa                                                                                                                          ');
      LSQL.add('    )                                                                                                                                                                    ');
      LSQL.add('                                                                                                                                                                         ');
      LSQL.add('                                                                                                                                                                         ');

      LSQL.add('    select mg.cod_garcon,g.apelido as nome,totalVendasPagaramTxServico,                                                                                                                                               ');
      LSQL.add('          coalesce(mg.totalVendasGarcon,0)as totalVendasGarcon ,                                                                                                         ');
      LSQL.add('          coalesce(vt.totalTaxaServico,0) as totalTaxaServico ,                                                                                                          ');
      LSQL.add(' case totalVendasPagaramTxServico                                                                                                                                                      ');
      LSQL.add('  when 0   then 0                                                                                                                                                                      ');
      LSQL.add('  else                                                                                                                                                                                 ');
      LSQL.add('    coalesce( ( (mg.totalVendasGarcon ) / (totalVendasPagaramTxServico)),0)                                                                                                            ');
      LSQL.add(' end  as indiceGarcon,                                                                                                                                                                 ');
      LSQL.add('                                                                                                                                                                                       ');
      LSQL.add(' coalesce(ce.totalComissoesExtras,0) as totalComissoesExtras,                                                                                                                          ');
      LSQL.add(' coalesce( ( coalesce( ( (mg.totalVendasGarcon ) / (totalVendasPagaramTxServico)),0) * totalTaxaServico)   * pp.pctGarcon ,0)  as total_taxa_garcon,                                   ');
      LSQL.add(' coalesce( ( coalesce( ( (mg.totalVendasGarcon ) / (totalVendasPagaramTxServico)),0) * totalTaxaServico) * pp.pctFuncionarios  ,0)  as total_taxa_funcionarios,                        ');
      LSQL.add(' coalesce( ( coalesce( ( (mg.totalVendasGarcon ) / (totalVendasPagaramTxServico)),0) * totalTaxaServico) * pp.pctCasa  ,0)  as total_taxa_casa,                                        ');
      LSQL.add(' coalesce( ( coalesce( ( (mg.totalVendasGarcon ) / (totalVendasPagaramTxServico)),0) * totalTaxaServico)   * pp.pctGarcon ,0) +  coalesce(ce.totalComissoesExtras,0) total_a_receber   ');
      LSQL.add('                                                                                                                                                                                       ');

      LSQL.add('         from movimentoGarcon mg                                                                                                                                         ');
      LSQL.add('   inner join garcons g on (g.cod_garcon = mg.cod_garcon) ');
      LSQL.add('     left join vendasComTxServico vt on (vt.id = mg.id)                                                                                                                  ');
      LSQL.add('     inner join percentuaisParametros pp on (pp.id = mg.id) ');
      LSQL.add('     left join comissoesExtras ce on (ce.id = mg.id) ');

      LSQL.text := StringReplace(LSQL.text, ':ACodCaixa', Quotedstr(ACodCaixa), [rfReplaceAll]);
      LSQL.text := StringReplace(LSQL.text, ':ACodEmpresa', Quotedstr(ACodEmpresa), [rfReplaceAll]);
      LSQL.text := StringReplace(LSQL.text, ':ADataInicial', LDataInicial, [rfReplaceAll]);
      LSQL.text := StringReplace(LSQL.text, ':ADataFinal', LDataFinal, [rfReplaceAll]);
      dm.adicionaLog(LSQL.Text);
      result := LSQL.Text;

    except
      on E: Exception do
      begin
        raise E.Create('Erro ao gerar o SQL do relatório de taxa de serviço');
      end;

    end;
  finally
    FreeAndNil(LSQL);
  end;
end;

procedure TDM.gravarSuprimento(ACodEmpresa, ACodCaixa: string; AValor: double; AAbertura: boolean);
var
  ts: TIBTransaction;
  LQry: TIBQuery;
begin

  ts := TIBTransaction.Create(nil);
  ts.Params.Add('read_committed');
  ts.Params.Add('rec_version');
  ts.Params.Add('nowait');
  ts.DefaultDatabase := dm.dbrestaurante;
  ts.Active := False;
  ts.Active := True;

  LQry := TIBQuery.create(self);
  LQry.Database := dm.dbrestaurante;
  LQry.Transaction := ts;
  LQry.Active := False;
  LQry.SQL.Clear;
  try
    try

      LQry.Active := false;
      LQry.sql.Clear;
      LQry.Active := false;
      LQry.sql.Clear;
      LQry.SQL.Add('insert into suprimentos (id,cod_empresa,cod_forma,valor,data,cod_usuario,cod_caixa) values (');
      LQry.sql.add('gen_id(id_suprimento,1),');
      LQry.sql.add('' + QuotedStr(codEmpresa) + ',');
      LQry.sql.add('' + QuotedStr('001') + ',');
      LQry.sql.add('' + dm.TrocaVirgPPto(trim(FloatToStr(AValor))) + ',');
      LQry.sql.add('' + QuotedStr(FormatDateTime('DD.MM.YYY', data_do_sistema)) + ',');
      LQry.sql.add('' + QuotedStr(codigo_usuario) + ',');
      LQry.sql.add('' + QUotedstr(ultimoCaixaAberto) + ')');
      LQry.ExecSQL;
      ts.Commit;
      ImprimeComprovanteDeSuprimento(ACodEmpresa, ACodCaixa, AValor, AAbertura);
    except
      on E: Exception do
      begin
        if ts.Active then
          ts.Rollback;
        ShowRealDialog(frm_principal, tmErro, 'Erro', 'Erro ao gravar suprimento!' + sLineBreak + 'Erro: ' + E.Message);
      end;
    end;

  finally
    FreeandNil(ts);
    FreeAndNil(LQry);
  end;

end;

procedure Tdm.ImprimeComprovanteDeSuprimento(ACodEmpresa: string; ACodCAixa: string; Avalor: double; AAbertura: boolean);
var
  LSQL: TStringList;
begin
  LSQL := TStringList.create;
  try
    try
      LSQL.add('</zera>');
      LSQL.add('</linha_dupla>');
      LSQL.add('<e></ce><n>:VpNomeEmpresa</N>');
      if (AAbertura = false) then
      begin
        LSQL.add('<e></ce><n>SUPRIMENTO DE CAIXA</N>');
      end
      else
      begin
        LSQL.add('<e></ce><n>ABERTURA DE CAIXA</N>');
      end;
      LSQL.add('<e></ce><n>CAIXA Nº :vpNumeroCaixa</N>');
      LSQL.add('</linha_dupla>');
      LSQL.add('<e></ae><n>Movimento:</N><e></ae>:vpDataMovimento');
      LSQL.add('</fn></ae><n>Hora desta impressão: </N></fn>:vpHoraImpressao');
      LSQL.add('</fn></ae><n>Operador: </N></fn>:vpNomeOperador');
      LSQL.add('</linha_simples>');
      LSQL.add('</fn></ad><n><e> Valor: :vpValor </N></fn>');
      LSQL.add('</fn></ad><n>-----------------------------------</N></fn>');
      LSQL.add('</linha_simples>');

      LSQL.add('</fn></ad><n>--------------------</N></fn>');
      LSQL.add('</fn></ae><n>Este comprovante faz parte do seu caixa. Guarde-o e anexe ao seu fechamento de caixa. </N></fn>');

      LSQL.add('<e></ce><n></N>');
      LSQL.add('<e></ce><n></N>');
      LSQL.add('<e></ce><n></N>');
      LSQL.Text := StringReplace(LSQL.Text, ':vpDataMovimento', FormatDateTime('DD/MM/YYY', data_do_sistema), [rfReplaceAll]);
      LSQL.Text := StringReplace(LSQL.Text, ':vpHoraImpressao', FormatDateTime('DD/MM/YYY HH:MM:SS', now), [rfReplaceAll]);
      LSQL.Text := StringReplace(LSQL.Text, ':VpNomeEmpresa', nome_fantasia, [rfReplaceAll]);
      LSQL.Text := StringReplace(LSQL.Text, ':vpNumeroCaixa', ACodCAixa, [rfReplaceAll]);
      LSQL.Text := StringReplace(LSQL.Text, ':vpNomeOperador', nome_usuario_responsavel, [rfReplaceAll]);
      LSQL.Text := StringReplace(LSQL.Text, ':vpValor', FormatFloat('R$ ###,###,##0.00 ', Avalor), [rfReplaceAll]);

      configuraImpressoraNaoFiscal();
      imprimeTextoACBR(LSQL);

    except
      on E: Exception do
      begin
        ShowRealDialog(frm_principal, tmErro, 'Ocorreu  um erro', 'Erro ao imprimir comprovante de suprimento!');
      end;
    end;
  finally
    FreeAndNil(LSQL);
  end;

end;

function Tdm.IsInteger(const Number: Double): Boolean;
begin
  result := Number = Round(Number);
end;

function Tdm.FormatNumberStr(const ANumber: Double): string;
var
  LisInteger: boolean;
begin
  LisInteger := ANumber = Round(ANumber);
  if LisInteger then
    result := FormatFloat('#0', ANumber)
  else
    result := FormatFloat('#0.00', ANumber);

end;

function TDM.CorrigeImpressaoComprovanteTEF(AOperadora: string; AStrComprovante: string): string;
var
  LSTR: TStringlist;
  IndiceOperadora: integer;
begin
  LSTR := Tstringlist.Create;
  try
    IndiceOperadora := StrIndex(AOperadora, ['SHIPAY']);

    case IndiceOperadora of
      0:
        begin
          LSTR.add('</zera>');
          LSTR.add('</linha_dupla>');
          LSTR.add('<e></ce><n>:VpNomeEmpresa</N>');
          LSTR.add('<e></ce><n>COMPROVANTE DE TRANSACAO PIX</N>');
          LSTR.add(AStrComprovante);
          LSTR.add('</linha_dupla>');
          LSTR.add('</pular_linhas>');
          LSTR.Text := StringReplace(LSTR.Text, ':VpNomeEmpresa', nome_fantasia, [rfReplaceAll]);

        end;
      1:
        begin
          LSTR.add(AStrComprovante);
        end
    else
      begin
        LSTR.add(AStrComprovante);
      end;

    end;
    result := LSTR.Text;
  finally
    freeAndNil(LSTR);
  end;

end;

procedure TDM.getDadosAuditoriaDeCaixa(AMemTable: TFDMemTable; AIDAuditoria: LargeInt);
var
  LSQL: TStringlist;
begin
  LSQL := TStringList.Create;
  LSQL.Clear;
  AMemTable.Active := true;

  try
    try
      LSQL.add('  select                                                                          ');
      LSQL.add('   ca.ID,ca.ID_AUDITORIA,ca.COD_EMPRESA,ca.COD_CAIXA, ca.COD_FORMA, fp.descricao, ');
      LSQL.add('   ca.TOTAL_SUPRIMENTOS,ca.TOTAL_SANGRIAS,ca.TOTAL_RECEBIMENTOS_VENDAS,           ');
      LSQL.add('   ca.TOTAL_RECEBIMENTOS_PENDURAS,ca.SALDO_SISTEMA,ca.TOTAL_OPERADOR,             ');
      LSQL.add('   ca.DIFERENCA_OPERADOR,ca.TOTAL_AUDITORIA,ca.DIFERENCA_AUDITORIA,coalesce(ca.OBS,' + Quotedstr('') + ') as obs ');
      LSQL.add('  from caixas_auditoria ca                                                        ');
      LSQL.add('     inner join formas_pagamento fp on (fp.cod_forma = ca.cod_forma)              ');
      LSQL.add('  where ca.id_auditoria = :vpIdAuditoria                                                    ');
      LSQL.add('  order by ca.cod_forma                                                           ');
      LSQL.text := StringReplace(LSQL.text, ':vpIdAuditoria', Inttostr(AIDAuditoria), [rfReplaceAll]);
      dm.adicionaLog(LSQL.text);
      getMemTable(AMemTable, LSQL.text);

    except
      on E: Exception do
      begin
        ShowRealDialog(frm_principal, tmErro, 'Erro', 'Erro ao buscar dados de auditoria de caixa!');
      end;

    end;
  finally
    FreeAndNil(LSQL);
  end;
end;

function TDM.getIdAuditoriaDeCAixa(ACodEmpresa: string; ACodCaixa: string): LargeInt;
var
  LSQL: TStringlist;
  LQry: TFDQuery;
  LMemTable: TFDMemTable;
begin

  LSQL := TStringList.Create;
  LQry := TFDQuery.Create(Self);
  LMemTable := TFDMemTable.Create(self);
  LSQL.Clear;

  try
    try
      result := 0;
      LSQL.add(' select distinct coalesce(id_auditoria,0) as id ');
      LSQL.add('  from caixas_auditoria ca ');
      LSQL.add(' inner join caixas c on (c.codigo = ca.cod_caixa)');
      LSQL.add(' where ca.cod_empresa=:ACodEmpresa and ca.cod_caixa =:ACodCaixa ');
      LSQL.add(' and c.status =0');
      LSQL.text := StringReplace(LSQL.text, ':ACodCaixa', Quotedstr(ACodCaixa), [rfReplaceAll]);
      LSQL.text := StringReplace(LSQL.text, ':ACodEmpresa', Quotedstr(ACodEmpresa), [rfReplaceAll]);
      getMemTable(LMemTable, LSQL.Text);

      if LMemTable.IsEmpty = false then
        result := LMemTable.Fields[0].Value

    except
      on E: Exception do
      begin
        ShowRealDialog(frm_principal, tmErro, 'Erro', 'Erro ao buscar ID da auditoria de caixa!');
      end;

    end;
  finally
    FreeAndNil(LSQL);
    FreeAndNil(LQry);
    FreeAndNil(LMemTable);
  end;
end;

function TDM.GerarAuditoriaDeCaixa(ACodEmpresa: string; ACodCaixa: string): LargeInt;
var
  LSQL: TStringlist;
  LQry: TFDQuery;
  LMemTable: TFDMemTable;
  LIDAuditoria: largeint;
  LListaSQL: TList<string>;
begin

  LListaSQL := TList<string>.Create;
  LSQL := TStringList.Create;
  LQry := TFDQuery.Create(Self);
  LMemTable := TFDMemTable.Create(self);
  LSQL.Clear;

  try
    try
      getMemTable(LMemTable, 'select gen_id(g_id_auditoria_caixa,1) from  rdb$database');
      LIDAuditoria := LMemTable.fields[0].Value;

      LSQL.add('   delete from caixas_auditoria ca where ca.cod_empresa=:ACodEmpresa and ca.cod_caixa=:ACodCaixa;');
      LSQL.add('   update caixas ca set ca.auditado=2 where ca.cod_empresa=:ACodEmpresa and ca.codigo=:ACodCaixa;');
      LSQL.add('   insert into caixas_auditoria(                                                 ');
      LSQL.add('    ID,                                                                          ');
      LSQL.add('    ID_AUDITORIA,COD_EMPRESA,                                                    ');
      LSQL.add('    COD_CAIXA,                                                                   ');
      LSQL.add('    COD_FORMA,                                                                   ');
      LSQL.add('    TOTAL_SUPRIMENTOS,                                                           ');
      LSQL.add('    TOTAL_SANGRIAS,                                                              ');
      LSQL.add('    TOTAL_RECEBIMENTOS_VENDAS,                                                   ');
      LSQL.add('    TOTAL_RECEBIMENTOS_PENDURAS,                                                 ');
      LSQL.add('    SALDO_SISTEMA,                                                               ');
      LSQL.add('    TOTAL_OPERADOR,                                                              ');
      LSQL.add('    DIFERENCA_OPERADOR)                                                          ');
      LSQL.add('                                                                                 ');
      LSQL.add('   select gen_id(g_id_auditoria_formas,1),                                       ');
      LSQL.add('         :vpIdAuditoria,                                                         ');
      LSQL.add('         :ACodEmpresa,                                                         ');
      LSQL.add('         :ACodCaixa,                                                             ');
      LSQL.add('         cod_forma,                                                              ');
      LSQL.add('         total_suprimentos,                                                      ');
      LSQL.add('         total_sangrias,                                                         ');
      LSQL.add('         total_recebimentos_vendas,                                              ');
      LSQL.add('         total_recebimentos_penduras,                                            ');
      LSQL.add('         SaldoSistema,                                                           ');
      LSQL.add('         total_operador,                                                         ');
      LSQL.add('         diferenca_operador                                                      ');
      LSQL.add('   from (                                                                        ');
      LSQL.add('                                                                                 ');
      LSQL.add('    with FormasPagto as (                                                        ');
      LSQL.add('      select fp.cod_forma, fp.descricao, fp.tef                                  ');
      LSQL.add('        from formas_pagamento fp                                                 ');
      LSQL.add('       where fp.desativada =0                                                    ');
      LSQL.add('      ),                                                                         ');
      LSQL.add('     SangriasCaixa as (                                                          ');
      LSQL.add('       select ' + Quotedstr('001') + ' as cod_forma,                                                ');
      LSQL.add('              sum(s.valor) as totalSangrias                                      ');
      LSQL.add('        from sangrias s                                                          ');
      LSQL.add('        where s.cod_empresa =:ACodEmpresa                                        ');
      LSQL.add('          and s.cod_caixa = :ACodCaixa                                           ');
      LSQL.add('      ),                                                                         ');
      LSQL.add('                                                                                 ');
      LSQL.add('    SuprimentosCaixa as (                                                        ');
      LSQL.add('     select ' + Quotedstr('001') + ' as cod_forma,                                                  ');
      LSQL.add('                  sum(s.valor) as totalSuprimentos                               ');
      LSQL.add('       from suprimentos s                                                        ');
      LSQL.add('        where s.cod_empresa =:ACodEmpresa                                        ');
      LSQL.add('          and s.cod_caixa = :ACodCaixa                                           ');
      LSQL.add('     ),                                                                          ');
      LSQL.add('                                                                                 ');
      LSQL.add('     RecebimentosCaixa as (                                                      ');
      LSQL.add('       select r.cod_forma,                                                       ');
      LSQL.add('         sum(r.valor) as totalRecebimentos                                       ');
      LSQL.add('         from recebimentos r                                                     ');
      LSQL.add('        where r.cod_empresa =:ACodEmpresa                                        ');
      LSQL.add('          and r.cod_caixa = :ACodCaixa                                           ');
      LSQL.add('        group by r.cod_forma                                                     ');
      LSQL.add('     ),                                                                          ');
      LSQL.add('     RecebimentosPenduras as (                                                   ');
      LSQL.add('       select r.cod_forma,                                                       ');
      LSQL.add('         sum(r.valor) as totalPenduras                                           ');
      LSQL.add('         from recebimentos_fatura r                                              ');
      LSQL.add('        where r.cod_empresa =:ACodEmpresa                                        ');
      LSQL.add('          and r.cod_caixa = :ACodCaixa                                           ');
      LSQL.add('        group by r.cod_forma                                                     ');
      LSQL.add('     ),                                                                          ');
      LSQL.add('                                                                                 ');
      LSQL.add('                                                                                 ');
      LSQL.add('     ApuracaoCaixa as (                                                          ');
      LSQL.add('       select                                                                    ');
      LSQL.add('         ap.cod_forma, ap.total_operador, ap.diferenca                           ');
      LSQL.add('        from apuracao_caixa ap                                                   ');
      LSQL.add('          where ap.cod_empresa = :ACodEmpresa                                    ');
      LSQL.add('           and ap.cod_caixa = :ACodCaixa                                         ');
      LSQL.add('      )                                                                          ');
      LSQL.add('                                                                                 ');
      LSQL.add('    select                                                                       ');
      LSQL.add('      fp.cod_forma, fp.descricao,                                                ');
      LSQL.add('       coalesce(sp.totalSuprimentos,0) as total_suprimentos,                     ');
      LSQL.add('       coalesce(sa.totalSangrias,0) as total_sangrias,                           ');
      LSQL.add('       coalesce(rs.totalRecebimentos,0) as total_recebimentos_vendas,            ');
      LSQL.add('       coalesce(rp.totalPenduras,0) as total_recebimentos_penduras,              ');
      LSQL.add('       sum( (coalesce(sp.totalSuprimentos,0) +                                   ');
      LSQL.add('             coalesce(rs.totalRecebimentos,0)                                    ');
      LSQL.add('             )                                                                   ');
      LSQL.add('             - coalesce(sa.totalSangrias,0)                                      ');
      LSQL.add('           ) as SaldoSistema,                                                    ');
      LSQL.add('          ap.total_operador,                                                     ');
      LSQL.add('          ap.diferenca as diferenca_operador                                     ');
      LSQL.add('         from FormasPagto fp                                                     ');
      LSQL.add('         left join SuprimentosCaixa sp on (sp.cod_forma = fp.cod_forma)          ');
      LSQL.add('         left join SangriasCaixa sa on (sa.cod_forma = fp.cod_forma)             ');
      LSQL.add('         left join ApuracaoCaixa ap on (ap.cod_forma = fp.cod_forma)             ');
      LSQL.add('         left join RecebimentosCaixa rs on (rs.cod_forma = fp.cod_forma)         ');
      LSQL.add('         left join RecebimentosPenduras rp on (rp.cod_forma = fp.cod_forma)      ');
      LSQL.add('    group by cod_forma, descricao, tef, totalSuprimentos,                        ');
      LSQL.add('             totalSangrias, totalRecebimentos,total_recebimentos_penduras,       ');
      LSQL.add('             ap.total_operador,ap.diferenca                                      ');
      LSQL.add(');                                                                                ');

      LSQL.text := StringReplace(LSQL.text, ':vpIdAuditoria', Inttostr(LIDAuditoria), [rfReplaceAll]);
      LSQL.text := StringReplace(LSQL.text, ':ACodCaixa', Quotedstr(ACodCaixa), [rfReplaceAll]);
      LSQL.text := StringReplace(LSQL.text, ':ACodEmpresa', Quotedstr(ACodEmpresa), [rfReplaceAll]);
      dm.adicionaLog(LSQL.Text);
      LListaSQL.Add(LSQL.Text);
      ExecutaBlocoDeInstrucoes(LListaSQL, 200);
      result := LIDAuditoria;

    except
      on E: Exception do
      begin
        ShowRealDialog(frm_principal, tmErro, 'Erro ao gerar SQL', 'Erro ao gerar SQL de auditoria de caixa!');
      end;

    end;
  finally
    FreeAndNil(LSQL);
    FreeAndNil(LQry);
    FreeAndNil(LMemTable);
    FreeAndNil(LListaSQL);

  end;
end;

procedure TDM.SalvarAuditoriaDeCaixa(ATbAuditoria: TFDMemTable; AObservacao: string; AIdHistoricoAuditoria: Integer);
var
  LSQL: TStringlist;
  LQry: TFDQuery;
  LListaSQL: TList<string>;
begin

  LListaSQL := TList<string>.Create;
  LSQL := TStringList.Create;
  LSQL.Clear;

  try
    try
      LSQL.clear;
      ATbAuditoria.first;
      while not ATbAuditoria.eof do
      begin
        LSQL.clear;
        LSQL.add('update CAIXAS_AUDITORIA ca set');
        LSQL.add(' ca.total_auditoria=' + TrocaVirgPPto(FloatToStr(ATbAuditoria.FieldByName('TOTAL_AUDITORIA').Value)) + ',');
        LSQL.add(' ca.DIFERENCA_AUDITORIA=' + TrocaVirgPPto(FloatToStr(ATbAuditoria.FieldByName('DIFERENCA_AUDITORIA').Value)) + ',');
        LSQL.add(' ca.obs =' + Quotedstr(ATbAuditoria.FieldByName('obs').Value));
        LSQL.add(' where ca.id=' + Inttostr(ATbAuditoria.FieldByName('id').Value) + ';');
        LListaSQL.add(LSQL.text);
        ATbAuditoria.Next;
      end;

      LSQL.clear;
      LSQL.Add(' update caixas ca set ca.auditado=1, ');
      LSQL.Add(' cod_usuario_auditoria=' + Quotedstr(codigo_usuario) + ',');
      LSQL.Add(' data_auditoria= current_timestamp, ');
      LSQL.add(' obs_auditoria=' + Quotedstr(AObservacao) + ',');
      LSQL.Add(' id_historico_auditoria=' + Inttostr(AIdHistoricoAuditoria) + ',');
      LSQL.Add(' diferenca_pagar = ');
      LSQL.add('      (select coalesce(sum(ca2.diferenca_auditoria),0)');
      LSQL.add('      from caixas_auditoria ca2');
      LSQL.add('        where ca2.cod_empresa=:ACodEmpresa and ca2.cod_caixa=:ACodCaixa)');

      LSQL.Add(' where ca.cod_empresa=:ACodEmpresa and ca.codigo=:ACodCaixa;');
      LSQL.text := StringReplace(LSQL.text, ':ACodCaixa', Quotedstr(ATbAuditoria.FieldByName('cod_caixa').Value), [rfReplaceAll]);
      LSQL.text := StringReplace(LSQL.text, ':ACodEmpresa', Quotedstr(ATbAuditoria.FieldByName('cod_empresa').Value), [rfReplaceAll]);
      LListaSQL.add(LSQL.text);

      ExecutaBlocoDeInstrucoes(LListaSQL, 200);

    except
      on E: Exception do
      begin
        ShowRealDialog(frm_principal, tmErro, 'Erro ao salvar', 'Ocorreu um erro ao salvar a auditoria!' + sLineBreak + sLineBreak + E.Message);
      end;

    end;
  finally
    FreeAndNil(LSQL);
  end;
end;

procedure TDM.VisualizarDetalhamentoDaVenda(ACodEmpresa: string; ACodVenda: string);
begin
  dm_relatorios.qryRelDetalhesVenda.Active := false;
  dm_relatorios.qryRelProdutosDetalhes.Active := false;
  dm_relatorios.qryPagamentosDetalheVenda.Active := false;

  try
    try
      dm_relatorios.qryRelDetalhesVenda.ParamByName('ACodVenda').Value := ACodVenda;
      dm_relatorios.qryRelDetalhesVenda.ParamByName('ACodEmpresa').Value := ACodEmpresa;

      dm_relatorios.qryRelDetalhesVenda.Active := true;
      dm_relatorios.qryRelProdutosDetalhes.Active := True;
      dm_relatorios.qryPagamentosDetalheVenda.Active := True;

      dm_relatorios.rpt.LoadFromFile(patchAplicacao + '\relatorios\relDetalhesVenda.fr3');
      dm_relatorios.rpt.ShowReport(true);
    except
      on E: Exception do
      begin
        ShowRealDialog(frm_principal, tmErro, 'Erro', 'Erro ao visualizar detalhamento de vendas!');
      end;

    end;

  finally
    dm_relatorios.qryRelDetalhesVenda.Active := false;
    dm_relatorios.qryRelProdutosDetalhes.Active := false;
    dm_relatorios.qryPagamentosDetalheVenda.Active := false;

  end;

end;

procedure TDM.CloseAllDataSets(DataModule: TDataModule);
var
  i: Integer;
  Component: TComponent;
begin
  for i := 0 to DataModule.ComponentCount - 1 do
  begin
    Component := DataModule.Components[i];
    if Component is TDataSet then
    begin
      TDataSet(Component).Close;
    end;
  end;
end;

function TDM.FormatJSON(const AJsonString: string): string;
var
  LALJsonDocumentU: TALJSONNodeW;
begin

  LALJsonDocumentU := TALJSONNodeW.Create('');
  try
//    LALJsonDocumentU.Options := [doNodeAutoIndent];
//    LALJsonDocumentU.LoadFromJSONString(AJsonString);
//    result := string(LALJsonDocumentU.JSON);


  finally
    FreeAndNil(LALJsonDocumentU);
  end;

end;

function TDM.GenerateGUID: string;
var
  GUID: TGUID;
begin
  CreateGUID(GUID);
  result := RemoveChars(GUIDToString(GUID), '{}-');
end;

procedure TDM.CapturarImagemCamera(LLogImagem: TLogImagem);
var
  LGuid: string;
begin
  LGuid := GenerateGUID;

  try
    SocketClient.Host := LImageServerParams.Values['camera_server'];
    SocketClient.Port := StrToInt(LImageServerParams.Values['camera_port']);
    SocketClient.Connect;

    SocketClient.IOHandler.WriteLn(LLogImagem.ToJSON);
  finally
    SocketClient.Disconnect;
  end;
end;

function TDM.getImageServerParams: TStringList;
var
  IniFile: TIniFile;
  FileName: string;
  AppDir: string;
begin
  result := TStringList.Create;

  AppDir := ExtractFilePath(ParamStr(0));
  FileName := IncludeTrailingPathDelimiter(AppDir) + 'config.ini';


  // Ler os parâmetros do arquivo INI
  IniFile := TIniFile.Create(FileName);
  try
    result.Values['instalado'] := IniFile.ReadString('SERVIDOR_IMAGENS', 'instalado', '0');
    result.Values['camera_server'] := IniFile.ReadString('SERVIDOR_IMAGENS', 'server', 'localhost');
    result.Values['camera_port'] := IniFile.ReadString('SERVIDOR_IMAGENS', 'camera_port', '8095');
    result.Values['captura_salao'] := IniFile.ReadString('SERVIDOR_IMAGENS', 'captura_salao', '0');
    result.Values['captura_balcao'] := IniFile.ReadString('SERVIDOR_IMAGENS', 'captura_balcao', '0');
    result.Values['captura_encerramento'] := IniFile.ReadString('SERVIDOR_IMAGENS', 'captura_encerramento', '0');
    result.Values['database_server'] := IniFile.ReadString('SERVIDOR_IMAGENS', 'database_server', 'localhost');
    result.Values['database_file'] := IniFile.ReadString('SERVIDOR_IMAGENS', 'database_file', 'localhost');
    result.Values['database_port'] := IniFile.ReadString('SERVIDOR_IMAGENS', 'database_port', '3050');
    result.Values['database_user'] := IniFile.ReadString('SERVIDOR_IMAGENS', 'database_user', 'SYSDBA');
    result.Values['database_password'] := IniFile.ReadString('SERVIDOR_IMAGENS', 'database_password', 'masterkey');

  finally
    IniFile.Free;
  end;
end;

function TDM.RemoveChars(const S: string; const CharsToRemove: string): string;
var
  I: Integer;
  NewStr: string;
begin
  NewStr := '';
  for I := 1 to Length(S) do
  begin
    if Pos(S[I], CharsToRemove) = 0 then
      NewStr := NewStr + S[I];
  end;
  result := NewStr;
end;

procedure TDM.getDataFromExternalDatabase(SQL: TStringList; MemTable: TFDMemTable; Params: TStringList);
var
  FDQuery: TFDQuery;
  FDConnection: TFDConnection;
begin
  FDConnection := TFDConnection.Create(nil);
  FDQuery := TFDQuery.Create(nil);
  try
    // Configurar a conexão Firebird
    FDConnection.Params.DriverID := 'FB';
    FDConnection.Params.Database := Params.Values['database_file'];
    FDConnection.Params.UserName := Params.Values['database_user'];
    FDConnection.Params.Password := Params.Values['database_password'];
    FDConnection.Params.Values['Server'] := Params.Values['database_server'];
    FDConnection.Params.Values['Port'] := Params.Values['database_port'];
    FDConnection.Connected := True;

    // Configurar a consulta SQL
    FDQuery.Connection := FDConnection;
    FDQuery.SQL.Text := SQL.Text;

    // Executar a consulta SQL e copiar os dados para a MemTable
    MemTable.Close;
    FDQuery.Open;
    MemTable.CopyDataSet(FDQuery, [coStructure, coAppend]);
  finally
    FDQuery.Free;
    FDConnection.Free;
  end;
end;

procedure TDM.ExecuteSQLExternalDatabase(SQL: TStringList; Params: TStringList);
var
  FDConnection: TFDConnection;
  FDCommand: TFDCommand;
begin
  FDConnection := TFDConnection.Create(nil);
  FDCommand := TFDCommand.Create(nil);
  try
    // Configurar a conexão Firebird
    FDConnection.Params.DriverID := 'FB';
    FDConnection.Params.Database := Params.Values['database_file'];
    FDConnection.Params.UserName := Params.Values['database_user'];
    FDConnection.Params.Password := Params.Values['database_password'];
    FDConnection.Params.Values['Server'] := Params.Values['database_server'];
    FDConnection.Params.Values['Port'] := Params.Values['database_port'];
    FDConnection.Connected := True;

    // Configurar o comando SQL
    FDCommand.Connection := FDConnection;
    FDCommand.CommandText.Text := SQL.Text;

    // Executar o comando SQL
    FDCommand.Execute;
  finally
    FDCommand.Free;
    FDConnection.Free;
  end;
end;

function Tdm.getBase64FromImageServer(LGUID: string): string;
var
  LMemTable: TFDMemTable;
  LSQL: TStringList;
begin
  result := '';
  LSQL := TStringList.create;
  LMemTable := TFDMemTable.Create(self);

  try
    LSQL.Clear;
    LSQL.add('select imagem from imagens where guid=' + Quotedstr(LGUID) + ';');
    getDataFromExternalDatabase(LSQL, LMemTable, LImageServerParams);
    if (LMemTable.IsEmpty = false) then
      result := trim(LMemTable.Fields[0].Value);
  finally
    LMemTable.active := false;
    FreeAndNil(LSQL);
    FreeAndNil(LMemTable);
  end;

end;

procedure TDM.DisplayBase64ImageIncxImage(cxImage: TcxImage; Base64String: string);
var
  ImageData: TBytes;
  PngImage: TPngImage;
  JpegImage: TJPEGImage;
  MemoryStream: TMemoryStream;
begin
  // Decodificar a string Base64 para obter os dados da imagem
  ImageData := TNetEncoding.Base64.DecodeStringToBytes(Base64String);

  // Verificar o tipo de imagem (PNG ou JPEG)
  if (ImageData[0] = $89) and (ImageData[1] = $50) and (ImageData[2] = $4E) and (ImageData[3] = $47) then
  begin
    // Imagem PNG
    MemoryStream := TMemoryStream.Create;
    try
      MemoryStream.Write(ImageData[0], Length(ImageData));
      MemoryStream.Position := 0;
      PngImage := TPngImage.Create;
      try
        PngImage.LoadFromStream(MemoryStream);
        cxImage.Picture.Assign(PngImage);
      finally
        PngImage.Free;
      end;
    finally
      MemoryStream.Free;
    end;
  end
  else if (ImageData[0] = $FF) and (ImageData[1] = $D8) then
  begin
    // Imagem JPEG
    MemoryStream := TMemoryStream.Create;
    try
      MemoryStream.Write(ImageData[0], Length(ImageData));
      MemoryStream.Position := 0;
      JpegImage := TJPEGImage.Create;
      try
        JpegImage.LoadFromStream(MemoryStream);
        cxImage.Picture.Assign(JpegImage);
      finally
        JpegImage.Free;
      end;
    finally
      MemoryStream.Free;
    end;
  end
  else
  begin
    // Tipo de imagem desconhecido
    raise Exception.Create('Tipo de imagem desconhecido.');
  end;
end;

function TDM.GetXMLFromVendasByChave(AChave: string): string;
var
  LMemTable: TFDMemTable;
  LSQL: string;
begin

  LMemTable := TFDMemTable.Create(self);
  try
    LSQL := 'select v.xml_doc from vendas v where v.chave_nfce=' + QuotedStr(AChave);
    getMemTable(LMemTable, LSQL);
    if LMemTable.IsEmpty = false then
      result := LMemTable.FieldByName('xml_doc').Value
    else
      result := '';
  finally
    FreeAndNil(LMemTable);
  end;
end;

procedure TDM.InsereChavesMovimento(ANumeroCaixa: string; ANumeroMesa: string);
var
  LSQL: TStringList;
  LListaSQL: TList<string>;
  LMemTable: TFDMemTable;
begin
  LListaSQL := TList<string>.Create;
  LSQL := TStringList.Create;
  LMemTable := TFDMemTable.Create(nil);

  try
    try

     {LSQL.clear;
      LSQL.add('select coalesce(count(*),0) ct from CHAVES_SELECIONADAS_MOVIMENTO where numero_mesa=' + QUotedstr(ANumeroMesa) + ' and  NUMERO_CAIXA <> ' + Quotedstr(ANumeroCaixa));
      dm.getMemTable(LMemTable, LSQL.text);


      if LMemTable.fieldbyname('ct').Value > 0 then
      begin
        raise Exception.Create('Mesa está com movimento aberto em outro PDV / Estação. Saia da mesa nas demais estações e tente novamente!');
      end;
      }

      LSQL.clear;
      LSQL.add('delete from CHAVES_SELECIONADAS_MOVIMENTO where numero_mesa= :vpNumeroMesa;');
      LSQL.text := StringReplace(LSQL.text, ':vpNumeroMesa', Quotedstr(ANumeroMesa), [rfReplaceAll]);
      LListaSQL.Add(LSQL.text);

      LSQL.clear;
      LSQL.add('delete from CHAVES_SELECIONADAS_MOVIMENTO where numero_caixa= :vpNumeroCaixa;');
      LSQL.text := StringReplace(LSQL.text, ':vpNumeroCaixa', Quotedstr(ANumeroCaixa), [rfReplaceAll]);
      LListaSQL.Add(LSQL.text);

      LSQL.clear;
      LSQL.add(' insert into chaves_selecionadas_movimento(GUID, NUMERO_CAIXA, NUMERO_MESA)    ');
      LSQL.add('  select ms.guid, :vpNumeroCaixa,:vpNumeroMesa from movimento_mesa ms         ');
      LSQL.add('    where ms.cod_mesa =:vpNumeroMesa                                          ');
      LSQL.add('   union all                                                                  ');
      LSQL.add('  select  rp.guid,:vpNumeroCaixa , :vpNumeroMesa  from recebimento_parcial rp ');
      LSQL.add('    where rp.mesa= :vpNumeroMesa;');
      LSQL.text := StringReplace(LSQL.text, ':vpNumeroCaixa', Quotedstr(ANumeroCaixa), [rfReplaceAll]);
      LSQL.text := StringReplace(LSQL.text, ':vpNumeroMesa', Quotedstr(ANumeroMesa), [rfReplaceAll]);
      LListaSQL.Add(LSQL.text);
      ExecutaBlocoDeInstrucoes(LListaSQL, 40);
    except
      on E: Exception do
      begin
        raise Exception.Create(E.message);
      end;

    end;
  finally
    FreeAndNil(LListaSQL);
    FreeAndNil(LSQL);
    FreeAndNil(LMemTable);
  end;
end;

function Tdm.GetNomeDiaDaSemana(Data: TDate): string;
var
  LDia: Word;
begin
  LDia := DayOfWeek(Data);
  case LDia of
    1:
      result := 'Domingo';
    2:
      result := 'Segunda';
    3:
      result := 'Terça';
    4:
      result := 'Quarta';
    5:
      result := 'Quinta';
    6:
      result := 'Sexta';
    7:
      result := 'Sábado';
  end;
end;

function TSepararPalavrasString(APalavra: string; AQtdLetras: Integer; AQuoted: Boolean = False): string;
var
  Palavras: TStringList;
  I: Integer;
  Resultado: string;
begin
  Palavras := TStringList.Create;
  try
    Palavras.Delimiter := ' ';
    Palavras.DelimitedText := APalavra;
    Resultado := '';
    for I := 0 to Palavras.Count - 1 do
    begin
      if Length(Palavras[I]) >= AQtdLetras then
      begin
        if Resultado <> '' then
          Resultado := Resultado + ',';
        if AQuoted then
          Resultado := Resultado + '''' + Palavras[I] + '''';
        Resultado := Resultado + Palavras[I];
      end;
    end;
  finally
    Palavras.Free;
  end;
  result := Resultado;
end;

function TDM.StringIsInArray(const SearchString: string; const StringArray: array of string): Boolean;
var
  i: Integer;
begin
  result := False;
  for i := Low(StringArray) to High(StringArray) do
  begin
    if Pos(SearchString, StringArray[i]) > 0 then
    begin
      result := True;
      Exit;
    end;
  end;
end;

function TDM.CFOPIsSubstituicaoTributaria(const CFOP: string): Boolean;
const
  CFOPsST: array[0..7] of string = ('5403', '5404', '5405', '6153', '6154', '6404', '6403', '6405');
var
  i: Integer;
begin
  result := False;
  for i := Low(CFOPsST) to High(CFOPsST) do
  begin
    if CFOP = CFOPsST[i] then
    begin
      result := True;
      Exit;
    end;
  end;
end;

function TDM.CSTICMSIsSubstituicaoTributariaCST(const CST: string): Boolean;
const
  CSTsST: array[0..4] of string = ('10', '30', '60', '70', '90');
var
  i: Integer;
begin
  result := False;
  for i := Low(CSTsST) to High(CSTsST) do
  begin
    if CST = CSTsST[i] then
    begin
      result := True;
      Exit;
    end;
  end;
end;

procedure TDM.ExcluirProduto(ACodProduto: string);
var
  LListaSQL: TList<string>;
  LSQL: TStringList;
begin
  LListaSQL := TList<string>.Create;
  LSQL := TStringList.Create;
  try
    LSQL.add(' delete from composicoes_produto cp where cp.cod_produto = :VPCodProduto;');
    LSQL.add(' delete from composicoes_produto cp where cp.cod_produto_baixa = :VPCodProduto;');
    LSQL.add(' delete from movimento_venda mv where mv.cod_produto =:VPCodProduto;');
    LSQL.add(' delete from produtos p where p.cod_produto =:VPCodProduto;');
    LSQL.Text := StringReplace(LSQL.Text, ':VPCodProduto', ACodProduto, [rfReplaceAll]);

    LListaSQL.add(LSQL.Text);
    ExecutaBlocoDeInstrucoes(LListaSQL, 120);
    try

    except
      on e: Exception do
      begin
        raise Exception.Create('Ocorreu um erro durante a exclusão. Verifique o arquivo de LOG gerado para obter detalhes');
      end;
    end;

  finally
    FreeAndNil(LListaSQL);
    FreeAndNil(LSQL);
  end;

end;

procedure TDM.AgruparProdutos(LMemTable: TFDMemTable; AProdutoBase: string);
var
  LProdutoTransferir: string;
  LListaSQL: TList<string>;
begin
  LListaSQL := TList<string>.Create;

  try
    LMemTable.First;
    while not LMemTable.eof do
    begin
      LProdutoTransferir := LMemTable.FieldByName('cod_produto').Value;
      if LProdutoTransferir <> AProdutoBase then
      begin
        LListaSQL.Add(' update movimento_venda mv set mv.cod_produto=' + Quotedstr(AProdutoBase) + ' where mv.cod_produto =' + Quotedstr(LProdutoTransferir) + ';');
        LListaSQL.Add(' update movimento_mesa ms set ms.cod_produto =' + Quotedstr(AProdutoBase) + ' where ms.cod_produto  =' + Quotedstr(LProdutoTransferir) + ';');
        LListaSQL.Add(' update composicoes_produto cp set cp.cod_produto_baixa = ' + Quotedstr(AProdutoBase) + ' where cp.cod_produto_baixa =' + Quotedstr(LProdutoTransferir) + ';');
        LListaSQL.Add(' update itens_entrada ite set ite.cod_item =' + Quotedstr(AProdutoBase) + ' where ite.cod_item =' + Quotedstr(LProdutoTransferir) + ';');

        LListaSQL.Add('delete from produtos p where p.cod_produto=' + Quotedstr(LProdutoTransferir) + ';');

      end;
      LMemTable.Next;
    end;

    dm.ExecutaBlocoDeInstrucoes(LListaSQL, 20);
  finally
    FreeAndNil(LListaSQL);
  end;
end;

function TDM.verificaPossibilidadeExclusaoDoProduto(ACodProduto: string): boolean;
var
  LSQL: TStringList;
  LTbAux: TFDMemTable;
  LTabela: integer;
  LQtdRegistros: integer;
begin
  LTbAux := TFDMemTable.Create(Self);
  LSQL := TstringList.create;
  try
    LSQL.add(' select 1 as tabela, coalesce(count(mv.cod_produto),0) as registros from movimento_venda    ');
    LSQL.add('    mv where mv.cod_produto =:VPCodProduto    ');
    LSQL.add(' union all');
    LSQL.add('   select 2 as tabela, coalesce(count(ite.cod_item),0)  as registros from itens_entrada ite');
    LSQL.add('    where ite.cod_item =:VPCodProduto');
    LSQL.add(' union all');
    LSQL.add('   select 3 as tabela, coalesce(count(cp.cod_produto_baixa),0) as registros from composicoes_produto cp');
    LSQL.add('    where cp.cod_produto_baixa = :VPCodProduto and cp.cod_produto <> :VPCodProduto');
    LSQL.Text := StringReplace(LSQL.Text, ':VPCodProduto', ACodProduto, [rfReplaceAll]);

    dm.getmemtable(LTbAux, LSQL.text);

    LTbAux.First;
    while not LTbAux.eof do
    begin
      LTabela := LTbAux.FieldByName('tabela').Value;
      LQtdRegistros := LTbAux.FieldByName('registros').Value;

      if LQtdRegistros > 0 then
      begin
        case LTabela of
          1:
            raise Exception.Create('Não é possível excluir este produto pois existe histórico de ' + Inttostr(LQtdRegistros) + ' vendas para o mesmo.');

          2:
            raise Exception.Create('Não é possível excluir este produto pois existe histórico de ' + Inttostr(LQtdRegistros) + ' compras para o mesmo.');

          3:
            raise Exception.Create('Não é possível excluir este produto pois ele está presente em ' + Inttostr(LQtdRegistros) + ' fichas técnicas');

        end;
      end;
      LTbAux.next;
    end;
    result := true;
  finally
    FreeAndNil(LTbAux);
    FreeAndNil(LSQL);
  end;
end;

procedure TDM.AtivarOuDesativarProduto(ACodProduto: string; LOpcao: integer);
var
  LListaSQL: TList<string>;
  LSQL: TStringList;
begin
  LListaSQL := TList<string>.Create;
  LSQL := TStringList.Create;
  try

    case LOpcao of
      1:
        LSQL.add(' update produtos p set p.compra=0, p.vende=0 where p.cod_produto = :VPCodProduto;');
      2:
        LSQL.add(' update produtos p set p.compra=0  where p.cod_produto = :VPCodProduto;');
      3:
        LSQL.add(' update produtos p set p.vende=0  where p.cod_produto = :VPCodProduto;');
      4:
        LSQL.add(' update produtos p set p.compra=1, p.vende=1 where p.cod_produto = :VPCodProduto;');
      5:
        LSQL.add(' update produtos p set p.compra=1  where p.cod_produto = :VPCodProduto;');
      6:
        LSQL.add(' update produtos p set p.vende=1  where p.cod_produto = :VPCodProduto;');
    end;

    LSQL.Text := StringReplace(LSQL.Text, ':VPCodProduto', ACodProduto, [rfReplaceAll]);

    LListaSQL.add(LSQL.Text);
    ExecutaBlocoDeInstrucoes(LListaSQL, 120);
    try

    except
      on e: Exception do
      begin
        raise Exception.Create('Ocorreu um erro durante a exclusão. Verifique o arquivo de LOG gerado para obter detalhes');
      end;
    end;

  finally
    FreeAndNil(LListaSQL);
    FreeAndNil(LSQL);
  end;

end;

function TDM.IsFileInUse(const FileName: string): Boolean;
var
  HFileRes: HFILE;
begin
  result := False;
  if not FileExists(FileName) then
    Exit;

  HFileRes := CreateFile(PChar(FileName), GENERIC_READ or GENERIC_WRITE, 0, nil, OPEN_EXISTING, FILE_ATTRIBUTE_NORMAL, 0);

  result := (HFileRes = INVALID_HANDLE_VALUE);

  if not result then
    CloseHandle(HFileRes);
end;

procedure Tdm.ExportarCXGrid(ACxGrid: TcxGrid; AFormato: TTipoExportacaoCxGrid);
var
  SaveDialog: TSaveDialog;
  ExcelFile: string;
begin
  SaveDialog := TSaveDialog.Create(nil);
  try
    SaveDialog.Title := 'Salvar Como';
    SaveDialog.DefaultExt := 'xlsx';

    case AFormato of
      TExpXLSX:
        SaveDialog.Filter := 'Excel (*.xlsx)|*.xlsx|Todos os Arquivos (*.*)|*.*';
      TExpHTML:
        SaveDialog.Filter := 'HTML (*.HTML)|*.HTML|Todos os Arquivos (*.*)|*.*';
      TExpCSV:
        SaveDialog.Filter := 'CSV (*.CSV)|*.CSV|Todos os Arquivos (*.*)|*.*';
      TExpTXT:
        SaveDialog.Filter := 'TXT (*.TXT)|*.TXT|Todos os Arquivos (*.*)|*.*';
      TExpXML:
        SaveDialog.Filter := 'XML (*.XML)|*.XML|Todos os Arquivos (*.*)|*.*';
    end;

    SaveDialog.FilterIndex := 1;
    SaveDialog.Options := [ofOverwritePrompt, ofHideReadOnly, ofEnableSizing];

    if SaveDialog.Execute then
    begin
      ExcelFile := SaveDialog.FileName;

      // Verifica se arquivo está em uso
      Screen.Cursor := crHourGlass;
      try

        case AFormato of
          TExpXLSX:
            ExportGridDataToXLSX(ExcelFile, ACxGrid, True, True, True, 'xlsx', nil);
          TExpHTML:
            ExportGridDataToHTML(ExcelFile, ACxGrid, True, True, 'html', nil);
          TExpCSV:
            ExportGridDataToCSV(ExcelFile, ACxGrid, True, True, ';', 'CSV', nil);
          TExpTXT:
            ExportGridDataToTEXT(ExcelFile, ACxGrid, True, True, 'TXT', nil, nil);
          TExpXML:
            ExportGridDataToXML(ExcelFile, ACxGrid, True, True, 'XML', nil);
        end;

        if FileExists(ExcelFile) then
        begin
          if Application.MessageBox('Arquivo exportado com sucesso! Deseja abrir o arquivo?', 'Confirmação', MB_YESNO + MB_ICONQUESTION) = IDYES then
          begin
            ShellExecute(0, 'open', PChar(ExcelFile), nil, nil, SW_SHOWNORMAL);
          end;
        end;

      finally
        Screen.Cursor := crDefault;
      end;
    end;

  finally
    SaveDialog.Free;
  end;

end;

procedure TDM.ForcarReintegracao(AIDPedido: string);
var
  LSQL: TStringList;
begin
  LSQL := TStringlist.Create;
  try

    try

      LSQL.add(' update integracoes_pedidos p');
      LSQL.add('   set p.json_processado=0, p.status_integracao_sistema=0,');
      LSQL.add('   p.hora_pedido_plataforma=current_timestamp, p.integrado=0');
      LSQL.add('    where p.id_pedido_plataforma=' + Quotedstr(AIDPedido));
      executaSQL(LSQL.text);

    except
      on E: exception do
        raise Exception.Create('Erro ao reintegrar pedido ' + E.message);
    end;

  finally
    FreeAndNil(LSQL);
  end;

end;

procedure Tdm.VisualizarDanfeCompra(AChave: string);
var
  ts: TIBTransaction;
  LQuery: TIBQuery;
begin
  inherited;

  ts := TIBTransaction.Create(self);
  ts.DefaultDatabase := dm.dbrestaurante;
  ts.Active := false;
  ts.Active := true;

  LQuery := TIBQuery.Create(Self);
  LQuery.Database := dm.dbrestaurante;
  LQuery.Transaction := ts;
  LQuery.Active := false;

  try
    LQuery.Active := false;
    LQuery.SQL.Clear;
    LQuery.SQL.Add('select xml_nota from nfe_destinadas  nf where nf.chave_nfe=' + Quotedstr(AChave));
    LQuery.Active := true;
    dm.ACBrNFe1.NotasFiscais.Clear;
    dm.parametrizaAcbrNFE(moNFe, true, false);
    dm.ACBrNFe1.NotasFiscais.LoadFromString(LQuery.FieldByName('xml_nota').Value, false);
    dm.ACBrNFe1.NotasFiscais.Imprimir;

  finally
    LQuery.Close;
    ts.Active := false;
    FreeAndNil(LQuery);
    FreeAndNil(ts);
  end;

end;

procedure Tdm.GetSQLPrecosTabelasProdutos(ALista: TStringlist);
var
  ts: TIBTransaction;
  LQuery: TIBQuery;
  LCodigo: string;
begin
  inherited;

  ts := TIBTransaction.Create(self);
  ts.DefaultDatabase := dm.dbrestaurante;
  ts.Active := false;
  ts.Active := true;

  LQuery := TIBQuery.Create(Self);
  LQuery.Database := dm.dbrestaurante;
  LQuery.Transaction := ts;
  LQuery.Active := false;

  try
    LQuery.active := false;
    LQuery.sql.Clear;
    LQuery.sql.add('select * from tabelas_preco tb where tb.codigo <> 0 order by codigo');
    LQuery.Active := true;
    LQuery.first;

    if LQuery.isEmpty = false then
      ALista.Add(',');

    while not LQuery.eof do
    begin
      LCodigo := FormatFloat('000', LQuery.FieldByName('codigo').Value);
      ALista.Add('  coalesce( (select tb.valor_unitario from produtos_tabela_precos tb ');
      ALista.Add(' where tb.cod_tabela=' + QuotedStr(LCodigo) + ' and tb.cod_produto = p.cod_produto),0) preco_tabela_' + LCodigo);
      LQuery.next;
      if not LQuery.eof then
        ALista.Add(',');

    end;

  finally
    LQuery.Close;
    ts.Active := false;
    FreeAndNil(LQuery);
    FreeAndNil(ts);

  end;
end;

procedure TDm.getDadosProduto(LTipoPesquisa: TTipoPesquisaProduto; ACodigo: string; AProduto: Produto.TProduto);
var
  ts: TIBTransaction;
  LQuery: TIBQuery;
  LSQL: TStringlist;
begin
  inherited;

  ts := TIBTransaction.Create(self);
  ts.DefaultDatabase := dm.dbrestaurante;
  ts.Active := false;
  ts.Active := true;

  LQuery := TIBQuery.Create(Self);
  LQuery.Database := dm.dbrestaurante;
  LQuery.Transaction := ts;
  LQuery.Active := false;
  LSQL := TStringlist.Create;

  try
    LSQL.clear;
    LSQL.Add('select p.*, p.valor_unitario as preco_tabela_000 ');
    GetSQLPrecosTabelasProdutos(LSQL);

    case LTipoPesquisa of
      TeCodProduto:
        LSQL.Add('  from produtos p where p.cod_produto=' + Quotedstr(ACodigo));
      TeCodBarras:
        LSQL.Add(' from produtos p  where p.cod_barras=' + Quotedstr(ACodigo));
    end;
    adicionaLog(LSQL.text);
    LQuery.SQL.clear;
    LQuery.sql.add(LSQL.Text);
    LQuery.Active := true;

    if LQuery.IsEmpty then
      raise Exception.Create('Produto não encontrado!');

    AProduto.codigo := LQuery.fieldbyname('cod_produto').Value;
    AProduto.CodigoBarras := LQuery.fieldbyname('cod_barras').Value;
    AProduto.Preco := LQuery.fieldbyname('valor_unitario').Value;
    AProduto.descricao := LQuery.fieldbyname('descricao').Value;
    AProduto.UnidadeNFE := LQuery.fieldbyname('un_ecf').Value;
    AProduto.CodImpressoraProducao := LQuery.fieldbyname('cod_miniprinter').Value;
    AProduto.Preco := LQuery.Fieldbyname('preco_tabela_' + FormatFloat('000', getTabelaPrecoAtual.codigo)).Value;
    AProduto.QuantidadeCalculada := IntToBol(LQuery.fieldbyname('calcula_qtde').Value);
    AProduto.RequerObservacao := IntToBol(LQuery.fieldbyname('requer_observacao').Value);
    AProduto.Compra := IntToBol(LQuery.fieldbyname('compra').Value);
    AProduto.Vende := IntToBol(LQuery.fieldbyname('vende').Value);
    AProduto.Subproduto := IntToBol(LQuery.fieldbyname('submateria').Value);

  finally
    LQuery.Close;
    ts.Active := false;
    FreeAndNil(LQuery);
    FreeAndNil(ts);
    FreeAndNIl(LSQL);
  end;
end;

function TDM.GetJsonPagamentoIntegracao(AIDPagamento: string): string;
var
  LMemTable: TFDMemTable;
  LSQL: TStringlist;
begin
  LMemTable := TFDMemTable.Create(self);
  LSQL := TStringList.Create;

  try

    LSQL.add(' select coalesce(ev.json,' + Quotedstr('') + ') as json from integracoes_eventos_pedido ev ');
    LSQL.add('  where ev.nome_evento=' + Quotedstr('PAID') + ' and ev.payment_id=' + Quotedstr(AIDPagamento));
    getMemTable(LMemTable, LSQL.text);

    if LMemTable.RecordCount = 0 then
      raise Exception.Create('Evento de pagamento não encontrado!')
    else
      result := LMemTable.Fields[0].Value;
  finally
    FreeAndNil(LSQL);
    FreeAndNil(LMemTable);
  end;

end;

function TDM.GetSQLExcluirPedidosDeIntegracaoAntigos(): string;
var
  LSQL: TStringList;
  LDiasExclusao: integer;
begin

  LSQL := TStringList.Create;
  try
    try

      LSQL.add(' delete  from integracoes_eventos_pedido ev                            ');
      LSQL.add('    where ev.data_hora_evento < DATEADD(DAY, -3, CURRENT_TIMESTAMP);   ');
      LSQL.add('                                                                       ');
      LSQL.add(' delete from integracoes_pedidos p                                     ');
      LSQL.add('  where p.hora_pedido_plataforma < DATEADD(DAY, -3, CURRENT_TIMESTAMP);');
      LSQL.add('                                                                       ');
      LSQL.add('  delete from integracoes_produtos_pedido pp                           ');
      LSQL.add('   where pp.id_pedido                                                  ');
      LSQL.add('      not in (select ped.id from integracoes_pedidos ped);             ');
      LSQL.add('  delete from integracoes_produtos ip                                  ');
      LSQL.add('   where ip.id not in                                                  ');
      LSQL.add('       (select ipp.id_produto from integracoes_produtos_pedido ipp);   ');
      LSQL.add('                                                                       ');
      LSQL.add('  delete from integracoes_json_pedidos ijs                             ');
      LSQL.add('   where ijs.id_pedido                                                 ');
      LSQL.add('      not in (select ped.id from integracoes_pedidos ped);             ');
      LSQL.add('                                                                       ');
      LSQL.add('  delete from integracoes_pedidos_pagto ipag                           ');
      LSQL.add('   where ipag.id_pedido                                                ');
      LSQL.add('      not in (select ped.id from integracoes_pedidos ped);             ');
      result := LSQL.text;
    except
      on E: Exception do
      begin
        ShowRealDialog(frm_principal, tmErro, 'Ocorreu  um erro', 'Erro ao excluir pedidos antigos de integrações!' + sLineBreak + sLineBreak + E.Message, 20);
      end;
    end;
  finally
    FreeAndNil(LSQL);
  end;

end;

procedure TDm.getDadosParticipante(ACodigo: string; AMemTable: TFDMemTable);
var
  LSQL: TStringlist;
begin

  LSQL := TStringlist.Create;

  try

    LSQL.Add(' select F.cod_fornecedor, coalesce(F.RAZAO_SOCIAL,' + Quotedstr('') + ' ) as RAZAO_SOCIAL,');
    LSQL.Add('  coalesce(F.cgc_cpf,' + Quotedstr('') + ' ) as documento ,                     ');
    LSQL.Add('  coalesce(F.NOME_FANTASIA,' + Quotedstr('') + ' ) as NOME_FANTASIA ,                     ');
    LSQL.Add('  coalesce(F.ENDERECO,' + Quotedstr('') + ' ) as ENDERECO,   ');
    LSQL.Add('  coalesce(F.NUM_ENDERECO,' + Quotedstr('0') + ' ) as NUMERO,   ');
    LSQL.Add('  coalesce(F.COMPLEMENTO,' + Quotedstr('') + ' ) as COMPLEMENTO,                          ');
    LSQL.Add('  coalesce(F.BAIRRO,' + Quotedstr('') + ' ) as BAIRRO,                                    ');
    LSQL.Add('  coalesce(F.CEP,' + Quotedstr('') + ' )as CEP,                                           ');
    LSQL.Add('  coalesce(F.TELEFONE,' + Quotedstr('') + ' ) as TELEFONE,                                ');
    LSQL.Add('  coalesce(F.EMAIL,' + Quotedstr('') + ') AS EMAIL,                                               ');
    LSQL.Add('  coalesce(F.INSCRICAO_ESTADUAL,' + Quotedstr('') + ' ) INSCRICAO_ESTADUAL,               ');
    LSQL.Add('  coalesce(F.CONTATO,' + Quotedstr('') + ' ) as CONTATO,                                  ');
    LSQL.Add('   c.cod_cidade as codCidade,c.nome as nomeCidade, e.sigla as uf                        ');
    LSQL.Add('    from fornecedor F                                                                   ');
    LSQL.Add('   inner join cidade c on (c.cod_cidade = f.cod_cidade)                                 ');
    LSQL.Add('   inner join estado e on (e.codigo = f.cod_estado)                                     ');
    LSQL.add(' where f.cod_fornecedor = ' + Quotedstr(ACodigo));
                                                                {


    LSQL.add('select F.cod_fornecedor, coalesce(F.RAZAO_SOCIAL,' + Quotedstr('') + '),');
    LSQL.add(' coalesce(F.NOME_FANTASIA,' + Quotedstr('') + '),');
    LSQL.add(' coalesce(F.ENDERECO,' + Quotedstr('') + '),NUM_ENDERECO as numero,');
    LSQL.add(' coalesce(F.COMPLEMENTO,' + Quotedstr('') + '),');
    LSQL.add(' coalesce(F.BAIRRO,' + Quotedstr('') + '),');
    LSQL.add(' coalesce(F.CEP,' + Quotedstr('') + '),');
    LSQL.add(' coalesce(F.TELEFONE,' + Quotedstr('') + '),');
    LSQL.add(' coalesce(F.EMAIL,' + Quotedstr('') + '),');
    LSQL.add(' coalesce(F.INSCRICAO_ESTADUAL,' + Quotedstr('') + '),');
    LSQL.add(' coalesce(F.CONTATO,' + Quotedstr('') + '),');
    LSQL.add(' c.cod_cidade as codCidade,c.nome as nomeCidade');
    LSQL.add('   from fornecedor F');
    LSQL.ADD('  inner join cidade c on (c.cod_cidade = f.cod_cidade) ');
    LSQL.ADD('  inner join estado e on (e.codigo = f.cod_estado) ');
    LSQL.add(' where f.cod_fornecedor = ' + Quotedstr(ACodigo));
    }
    dm.adicionaLog(LSQL.text);
    getMemTable(AMemTable, LSQL.text);

  finally
    FreeAndNil(LSQL);
  end;

end;

procedure TDm.PreencheDadosDadosDoEmitente(ANota: NotaFiscal);
begin
  dm.tb_parametros.Active := true;

  try
    try

      ANota.Nfe.Ide.cUF := UFtoCUF(dm.tb_parametrosUF.Value);
      ANota.Nfe.Ide.cMunFG := StrToInt(dm.tb_parametrosCOD_MUNICIPIO_IBGE.value);

      ANota.Nfe.Ide.tpImp := tiRetrato;
      ANota.Nfe.Ide.indPres := pcPresencial;
      ANota.Nfe.Ide.idDest := doInterna;

      with ANota.Nfe.autXML.Add do
      begin
        CNPJCPF := dm.tb_parametrosCNPJ_CONTABILISTA.Value;
      end;

      ANota.NFe.infRespTec.CNPJ := '08101553000142';
      ANota.NFe.infRespTec.xContato := 'JOÃO MARCOS SANTOS DA SILVA';
      ANota.NFe.infRespTec.email := 'joao@realsoftwares.com.br';
      ANota.NFe.infRespTec.fone := '71999882928';

      ANota.Nfe.emit.CNPJCPF := dm.tb_parametrosCNPJ.Value;
      ANota.Nfe.emit.IE := dm.tb_parametrosIE.Value;
      ANota.Nfe.emit.xNome := dm.tb_parametrosRAZAO_SOCIAL.Value;
      ANota.Nfe.emit.xFant := dm.tb_parametrosNOME_FANTASIA.Value;
      ANota.Nfe.Emit.EnderEmit.fone := dm.tb_parametrosTELEFONE_EMPRESA.Value;
      ANota.Nfe.Emit.EnderEmit.CEP := StrToInt(dm.tb_parametrosCEP.value);
      ANota.Nfe.Emit.EnderEmit.xLgr := dm.tb_parametrosLOGRADOURO.Value;
      ANota.Nfe.Emit.EnderEmit.nro := dm.tb_parametrosNUMERO.Value;
      ANota.Nfe.Emit.EnderEmit.xCpl := dm.tb_parametrosCOMPLEMENTO.Value;
      ANota.Nfe.Emit.EnderEmit.xBairro := dm.tb_parametrosBAIRRO.Value;

      ANota.Nfe.Emit.EnderEmit.cMun := StrToInt(dm.tb_parametrosCOD_MUNICIPIO_IBGE.Value);
      ANota.Nfe.Emit.EnderEmit.xMun := dm.tb_parametrosNOME_CIDADE_CONTRIBUINTE.Value;
      ANota.Nfe.Emit.EnderEmit.UF := dm.tb_parametrosUF.Value;
      ANota.Nfe.Emit.EnderEmit.cPais := 1058;
      ANota.Nfe.Emit.EnderEmit.xPais := 'BRASIL';
      ANota.Nfe.Emit.IEST := '';

      case dm.tb_parametrosREGIME_TRIBUTACAO.Value of
        0:  //Regime normal (Lucro presumido)
          begin
            ANota.Nfe.Emit.CRT := crtRegimeNormal;
          end;

        1:
          begin
            ANota.Nfe.Emit.CRT := crtSimplesNacional;
          end;

      end;

    except
      on E: Exception do
      begin
        raise Exception.Create('Erro ao preencher dados do emitente!  ' + E.Message);
      end;

    end;

  finally

  end;
end;

procedure TDm.IniciaNotaFiscal(ANota: NotaFiscal; AOperacao: TTipoOperacaoNFE);
var
  LNaturezaOperacao: string;
begin

  case AOperacao of
    TOpVenda:
      begin
        LNaturezaOperacao := 'VENDA';
        ANota.Nfe.Ide.finNFe := fnNormal;
      end;
    TOpTransferencia:
      begin
        LNaturezaOperacao := 'Transferência de produtos entre matriz/filiais';
        ANota.Nfe.Ide.finNFe := fnNormal;
      end;

    TOpDevolucao:
      begin
        LNaturezaOperacao := 'Devolução de mercadorias';
        ANota.Nfe.Ide.finNFe := fnDevolucao;
      end;

    TOpDevolucaoDeVenda:
      begin
        LNaturezaOperacao := 'Devolução de venda';
        ANota.Nfe.Ide.finNFe := fnDevolucao;
      end;

    TOpNotaReferenciada:
      begin
        LNaturezaOperacao := 'Lanc. efet. em decorr. de emissao de doc. fisc já emitido';
      end;

  end;

  ANota.Nfe.Ide.natOp := LNaturezaOperacao;
  ANota.Nfe.Ide.indPag := ipVista;
  ANota.Nfe.Ide.modelo := 55;
  ANota.Nfe.Ide.serie := 1;
  ANota.Nfe.Ide.nNF := 1;
  ANota.Nfe.Ide.dEmi := now;
  ANota.Nfe.Ide.dSaiEnt := now;
  ANota.Nfe.Ide.hSaiEnt := now;
  ANota.Nfe.Ide.tpNF := tnSaida;
  ANota.Nfe.Transp.modFrete := mfSemFrete;
end;

procedure TDm.PreencheDadosDestinatarioNFE(ACodigoParticipante: string; ANota: NotaFiscal);
var
  LMemTable: TFDMemTable;
begin

  LMemTable := TFDMemTable.Create(self);

  try
    try
      getDadosParticipante(ACodigoParticipante, LMemTable);
      if LMemTable.IsEmpty = false then
      begin
      // Define se o consumidor está comprando para consumo ou revenda.
        ANota.Nfe.Ide.indFinal := cfConsumidorFinal;

        if LMemTable.fieldbyname('UF').Value <> dm.tb_parametrosUF.Value then
          ANota.NFe.Ide.idDest := doInterestadual;

        if (trim(LMemTable.FieldByName('INSCRICAO_ESTADUAL').Value) <> '') then
        begin

          if (trim(uppercase(LMemTable.FieldByName('INSCRICAO_ESTADUAL').Value)) = 'ISENTO') then
          begin
            ANota.NFe.Dest.indIEDest := inIsento;
            ANota.NFe.Dest.IE := '';
          end
          else
          begin
            ANota.NFe.Dest.indIEDest := inContribuinte;
            ANota.NFe.Dest.IE := LMemTable.FieldByName('INSCRICAO_ESTADUAL').Value;
          end;
        end
        else
        begin
          ANota.NFe.Dest.indIEDest := inNaoContribuinte;
          ANota.NFe.Dest.IE := '';
        end;

        ANota.NFe.Dest.CNPJCPF := LMemTable.FieldByName('documento').Value;
        ANota.NFe.Dest.ISUF := '';
        ANota.NFe.Dest.xNome := LMemTable.FieldByName('RAZAO_SOCIAL').Value;
        ANota.NFe.Dest.EnderDest.Fone := LMemTable.FieldByName('TELEFONE').Value;
        ANota.NFe.Dest.EnderDest.CEP := LMemTable.FieldByName('CEP').Value;
        ANota.NFe.Dest.EnderDest.xLgr := LMemTable.FieldByName('ENDERECO').Value;
        ANota.NFe.Dest.EnderDest.nro := LMemTable.FieldByName('NUMERO').Value;
        ANota.NFe.Dest.EnderDest.xCpl := LMemTable.FieldByName('COMPLEMENTO').Value;
        ANota.NFe.Dest.EnderDest.xBairro := LMemTable.FieldByName('BAIRRO').Value;
        ANota.NFe.Dest.EnderDest.cMun := LMemTable.FieldByName('codCidade').Value;
        ANota.NFe.Dest.EnderDest.xMun := LMemTable.FieldByName('nomeCidade').Value;
        ANota.NFe.Dest.EnderDest.UF := LMemTable.FieldByName('UF').Value;
        ANota.NFe.Dest.EnderDest.cPais := 1058;
        ANota.NFe.Dest.EnderDest.xPais := 'BRASIL';

      end
      else
      begin
        raise Exception.Create('Sem dados para o participante selecionado!');
      end;

    except
      on E: Exception do
      begin
        raise Exception.Create('Erro ao preencher dados do participante! ' + sLineBreak + sLineBreak + E.Message);
      end;

    end;

  finally
    LMemTable.Active := false;
    freeAndNil(LMemTable);
  end;
end;

procedure Tdm.CopiarProdutosDaNFE(ANFDestino: NotaFiscal; AChaveNFE: string);
var
  LXMLNota: string;
  LACBRNFeTemp: TACBrNFe;
  ctItens: Integer;
  LProdutos: TDetCollection;
begin

  LACBRNFeTemp := TACBrNFe.Create(self);

  try
    try

      LXMLNota := GetXMLFromVendasByChave(AChaveNFE);
      LACBRNFeTemp.NotasFiscais.LoadFromString(LXMLNota, false);
      LProdutos := LACBRNFeTemp.NotasFiscais[0].NFe.Det;

      with ANFDestino.NFe.Ide.NFref.Add do
        refNFe := AChaveNFE;

      for ctItens := 0 to LProdutos.Count - 1 do
      begin
        with ANFDestino.NFe.Det.Add do
        begin
          prod.nItem := LProdutos.Items[ctItens].Prod.nItem;
          Prod.cProd := LProdutos.Items[ctItens].Prod.cProd;
          Prod.cEAN := LProdutos.Items[ctItens].Prod.cEAN;
          Prod.xProd := LProdutos.Items[ctItens].Prod.xProd;
          Prod.NCM := LProdutos.Items[ctItens].Prod.NCM;
          Prod.CEST := LProdutos.Items[ctItens].Prod.CEST;
          Prod.EXTIPI := LProdutos.Items[ctItens].Prod.EXTIPI;
          Prod.CFOP := '5929';
          if ANFDestino.NFe.Ide.idDest = doInterestadual then
            Prod.CFOP := '6929';


//      Prod.CFOP := LProdutos.Items[ctItens].Prod.CFOP;
          Prod.uCom := LProdutos.Items[ctItens].Prod.uCom;
          Prod.qCom := LProdutos.Items[ctItens].Prod.qCom;
          Prod.vUnCom := LProdutos.Items[ctItens].Prod.vUnCom;
          Prod.vProd := LProdutos.Items[ctItens].Prod.vProd;
          Prod.cEANTrib := LProdutos.Items[ctItens].Prod.cEANTrib;
          Prod.uTrib := LProdutos.Items[ctItens].Prod.uTrib;
          Prod.qTrib := LProdutos.Items[ctItens].Prod.qTrib;
          Prod.vUnTrib := LProdutos.Items[ctItens].Prod.vUnTrib;
          Prod.vFrete := LProdutos.Items[ctItens].Prod.vFrete;
          Prod.vSeg := LProdutos.Items[ctItens].Prod.vSeg;
          Prod.vDesc := LProdutos.Items[ctItens].Prod.vDesc;
          Prod.vOutro := LProdutos.Items[ctItens].Prod.vOutro;
          Prod.indTot := LProdutos.Items[ctItens].Prod.indTot;
          Prod.nFCI := LProdutos.Items[ctItens].Prod.nFCI;


      // Campos do ICMS - Lucro Presumido
          Imposto.ICMS.CST := LProdutos.Items[ctItens].Imposto.ICMS.CST;
          Imposto.ICMS.modBC := LProdutos.Items[ctItens].Imposto.ICMS.modBC;

          Imposto.ICMS.modBCST := LProdutos.Items[ctItens].Imposto.ICMS.modBCST;
          Imposto.PIS.CST := LProdutos.Items[ctItens].Imposto.PIS.CST;
          Imposto.COFINS.CST := LProdutos.Items[ctItens].Imposto.COFINS.CST;


      // CAmpos ICMS  - Simples Nacional
          Imposto.ICMS.CSOSN := LProdutos.Items[ctItens].Imposto.ICMS.CSOSN;
        end;
      end;
    except
      on E: Exception do
      begin
        raise Exception.Create('Erro ao copiar produtos da NF-e com chave ' + AChaveNFE + sLineBreak + sLineBreak + E.message);
      end;

    end;
  finally
    FreeAndNil(LACBRNFeTemp);
  end;

end;

procedure Tdm.RecalcularTotaisNFReferenciada(ANota: NotaFiscal);
var
  totvProd, totvFrete, totvSeg, totvDesc, totvOutro: Currency;
  LProdutos: TDetCollection;
  ctItens: integer;
begin
  totvProd := 0;
  totvFrete := 0;
  totvSeg := 0;
  totvDesc := 0;
  totvOutro := 0;

  LProdutos := ANota.NFE.Det;
  try
    try
      for ctItens := 0 to LProdutos.Count - 1 do
      begin
        totvProd := totvProd + LProdutos.Items[ctItens].Prod.vProd;
        totvFrete := totvFrete + LProdutos.Items[ctItens].Prod.vFrete;
        totvSeg := totvSeg + LProdutos.Items[ctItens].Prod.vSeg;
        totvDesc := totvDesc + LProdutos.Items[ctItens].Prod.vDesc;
        totvOutro := totvOutro + LProdutos.Items[ctItens].Prod.vOutro;
      end;

      ANota.NFE.Total.ICMSTot.vProd := totvProd;
      ANota.NFE.Total.ICMSTot.vFrete := totvFrete;
      ANota.NFE.Total.ICMSTot.vSeg := totvSeg;
      ANota.NFE.Total.ICMSTot.vDesc := totvDesc;
      ANota.NFE.Total.ICMSTot.vOutro := totvOutro;
      ANota.NFE.Total.ICMSTot.vNF := (totvProd + totvFrete + totvSeg + totvOutro) - totvDesc;

      with ANota.NFE.pag.Add do
      begin
        tpag := fpSemPagamento;
      end

    except
      on E: Exception do
      begin
        raise Exception.Create('Erro ao recalcular totais da nota!');
      end;

    end;
  finally

  end;

end;

function Tdm.BuscaEntradaPorChaveNFE(AChave: string): string;
var
  LSQL: string;
  LTbAux: TFDMemTable;
begin

  result := '';
  LTbAux := TFDMemTable.Create(nil);
  LSQL := ' select e.cod_entrada from entradas e where e.chave_nfe=' + Quotedstr(AChave);

  try
    getMemTable(LTbAux, LSQL);

    if (LTbAux.IsEmpty = false) then
      result := LTbAux.FieldByName('cod_entrada').Value;

  finally
    FreeAndNil(LTbAux);
  end;

end;

procedure TDM.MarcarNumeracaoNFE(AID: integer; AOpcao: Integer);
var
  LSQL: string;
begin

  try
    try
      case AOpcao of
        1:
          LSQL := 'update inutilizacoes_nfce nf set nf.inutilizada=1, nf.emitida=0, nf.cancelada=0, tentativas=0, nf.data_hora_inutilizacao=current_date where nf.id=' + Inttostr(AID);
        2:
          LSQL := 'update inutilizacoes_nfce nf set nf.inutilizada=0, nf.emitida=1, nf.cancelada=0, tentativas=0 where nf.id=' + Inttostr(AID);
        3:
          LSQL := 'update inutilizacoes_nfce nf set nf.inutilizada=1, nf.emitida=0, nf.cancelada=1, tentativas=0, nf.data_hora_inutilizacao=current_date where nf.id=' + Inttostr(AID);
        4:
          LSQL := 'update inutilizacoes_nfce nf set nf.tentativas = 0 where nf.tentaivas >3';
      end;

      executaSQL(LSQL);
      ShowRealDialog(frm_principal, tmSucesso, 'Sucesso!', 'Inutilzação efetuada!')
    except
      on E: Exception do
      begin
        ShowRealDialog(frm_principal, tmErro, 'Ocorreu  um erro', 'Erro ao realizar inutilização: ' + sLineBreak + E.Message);
      end;
    end;

  finally

  end;

end;

function Tdm.StringToStringList(const AText: string): TStringList;
begin
  result := TStringList.Create;
  try
    result.Delimiter := ';';
    result.StrictDelimiter := True; // garante que só o ';' será usado, ignorando espaços
    result.DelimitedText := AText;
  except
    result.Free;
    raise;
  end;
end;

function TDM.DateOnly(const ADate: TDateTime): TDate;
begin
  result := DateOf(ADate);  // garante só a parte da data
end;

function TDM.getPeriodoMesAnterior(const LDataInicio, LDataFim: TDate): TEstruturaPeriodo;
begin
  result.Inicio := DateOnly(IncMonth(LDataInicio, -1));
  result.Fim := DateOnly(IncMonth(LDataFim, -1));
end;

function TDM.getPeriodoAnoAnterior(const LDataInicio, LDataFim: TDate): TEstruturaPeriodo;
begin
  result.Inicio := DateOnly(IncYear(LDataInicio, -1));
  result.Fim := DateOnly(IncYear(LDataFim, -1));
end;

function TDM.FormataDataFirebird(const ADate: TDateTime): string;
begin
  result := FormatDateTime('dd.mm.yyyy', ADate);
  result := Quotedstr(result);
end;

function TDM.StringListToList(const SL: TStringList): TList<string>;
var
  I: Integer;
begin
  result := TList<string>.Create;
  for I := 0 to SL.Count - 1 do
    result.Add(SL[I]);
end;

procedure TDM.VisualizarNFEDeEntrada(AChaveDocumento: string);
var
  LXMLDocumento: string;
begin

  try
    LXMLDocumento := dm.getXMLNFEDestinada(AChaveDocumento);
    dm.parametrizaAcbrNFE(moNFe, true, false);
    dm.ACBrNFe1.NotasFiscais.Clear;
    dm.ACBrNFe1.NotasFiscais.LoadFromString(LXMLDocumento, false);
    dm.ACBrNFe1.NotasFiscais.Imprimir;

  except
    on E: exception do
    begin
      raise Exception.Create(E.Message);

    end;
  end;
end;

end.

