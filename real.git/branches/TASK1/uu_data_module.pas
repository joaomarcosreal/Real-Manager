
unit uu_data_module;

interface


uses  IBCustomDataSet, IBUpdateSQL,windows, ComObj,
  IBStoredProc, DB, IBQuery, LbCipher ,LbUtils,  IBDatabase, Classes,acbrutil,ACBrDFeSSL,
  SysUtils,  system.AnsiStrings,   blcksock           ,ACBrTEFDClass, System.DateUtils,

  pcnConversao,pcnConversaoNFE,
  IBTable,Stdctrls,dialogs,inifiles,XmlIntf, Graphics,forms,wininet,
  Variants,controls, dbctrls, ExtCtrls, ACBrECF,  ACBrDFe, zlib, acbrdevice,
  OnGuard,ogutil, RDprint, PRINTERS,registry, ACBrNFeDANFEClass,acbrbal,
  ACBrNFeDANFEFR, ACBrNFe,
  ACBrNFeDANFeESCPOS,XMLDoc, ACBrSATClass,
  ACBrPosPrinter, RxMemDS,
  ACBrNFeDANFEFRDM, JvCipher, JvComponentBase, ACBrBase, ACBrSAT,
  ACBrSATExtratoClass, ACBrSATExtratoESCPOS, uuConsultaInfSat, ACBrTEFD,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf,
  FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async,
  FireDAC.Phys, FireDAC.VCLUI.Wait, FireDAC.Phys.FBDef, FireDAC.Phys.IBBase,
  FireDAC.Phys.FB, FireDAC.Comp.Client, IdThreadComponent, IdBaseComponent,
  ACBrDFeReport, ACBrDFeDANFeReport, Vcl.DialogMessage;



  type
  tEstadoEcfSimulado = (tpsLivre, tpsVenda, tpsSubTotal, tpsTotalPagar, tpsPagamento, tpsRelatorio);
  tEstadoNFE = (tIndefinido,tNaoExisteSefaz, tCancelada, tAutorizada);


  type TextratoEmitido = class
   public
    extratoValido : smallint;
    tipoDesconto  : smallint;
    valorDesconto : double;
    valorCouvert  : double;
    valorServico  : double;
    horaEmissao   : Ttime;
    codUsuario    : string;
  end;


  type TInformacoesDaMesa = class
   public
     horaAbertura : Ttime;
     dataServidor : Tdate;
     horaServidor : Tdate;
     qtdePessoas  : integer;
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
    itens_cot_temp: TRxMemoryData;
    itens_cot_tempCOD_COTACAO: TStringField;
    itens_cot_tempCOD_ITEM: TStringField;
    itens_cot_tempVALOR_EMBALAGEM: TFloatField;
    itens_cot_tempDESCRICAO: TStringField;
    qryauxiliar3: TIBQuery;
    itens_cot_tempQTDE_ITEM: TFloatField;
    itens_cot_tempQTDE_EMBALAGENS: TFloatField;
    itens_cot_tempITENS_EMB: TFloatField;
    composicoes_temp: TRxMemoryData;
    composicoes_tempcod_item: TStringField;
    composicoes_tempcod_produto: TStringField;
    composicoes_tempquantidade: TFloatField;
    composicoes_tempcod_c_custo: TStringField;
    composicoes_tempdescricao_item: TStringField;
    composicoes_tempdescricao_c_custo: TStringField;
    ds_composicoes_temp: TDataSource;
    qry_consultas: TIBQuery;
    ds_qry_consultas: TDataSource;
    qry_movimento_mesa: TIBQuery;
    ds_qry_movimento_mesa: TDataSource;
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
    transRemota: TIBTransaction;
    tb_mem_rel_custo: TRxMemoryData;
    gastos_temp: TRxMemoryData;
    gastos_tempcodigo_item: TStringField;
    gastos_tempqtde: TFloatField;
    gastos_tempdescricao: TStringField;
    ds_gastos_temp: TDataSource;
    gastos_tempunidade: TStringField;
    gastos_tempcusto_unitario: TFloatField;
    ds_tabmemoria: TDataSource;
    tb_acompanhamentos_temp: TRxMemoryData;
    tb_acompanhamentos_tempcod_acompanhamento: TStringField;
    tb_acompanhamentos_tempdescricao: TStringField;
    ds_acompanhamentos_temp: TDataSource;
    tb_acompanhamentos_tempqtde: TSmallintField;
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
    qry_grupos_fornecedores: TIBQuery;
    upd_grupos_fornecedores: TIBUpdateSQL;
    ds_qry_grupos_fornecedores: TDataSource;
    qry_grupos_fornecedoresCODIGO: TIBStringField;
    qry_grupos_fornecedoresDESCRICAO: TIBStringField;
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
    qry_tipos_cli: TIBQuery;
    upd_tipos_cli: TIBUpdateSQL;
    ds_clientes: TDataSource;
    qry_clientes: TIBQuery;
    upd_clientes: TIBUpdateSQL;
    ds_tipos_cli: TDataSource;
    qry_tipos_cliCOD_TIPO: TIBStringField;
    qry_tipos_cliDESCRICAO: TIBStringField;
    qry_tipos_cliPRAZO: TIntegerField;
    qry_faturas: TIBQuery;
    upd_faturas: TIBUpdateSQL;
    qry_remota2: TIBQuery;
    qry_importacoes: TIBQuery;
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
    lack: TIBQuery;
    dsQryReg60A: TDataSource;
    updQryReg60A: TIBUpdateSQL;
    lackCOD_REG: TIBStringField;
    lackDATA: TDateField;
    lackVALOR_ACUMULADO: TIBBCDField;
    lackALIQUOTA: TIBStringField;
    lackNUM_SERIE: TIBStringField;
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
    qryReg60M: TIBQuery;
    dsQryReg60M: TDataSource;
    updQryReg60M: TIBUpdateSQL;
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
    qryTotaisFaturas: TIBQuery;
    dsQryTotaisFaturas: TDataSource;
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
    dsCheckin: TDataSource;
    updQryCheckin: TIBUpdateSQL;
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
    qryReg60MCOD_REG: TIBStringField;
    qryReg60MDATA: TDateField;
    qryReg60MNUM_SERIE: TIBStringField;
    qryReg60MNUM_ORD: TIBStringField;
    qryReg60MMODELO: TIBStringField;
    qryReg60MCOO_INI: TIBStringField;
    qryReg60MCOO_FIM: TIBStringField;
    qryReg60MCONT_Z: TIBStringField;
    qryReg60MCO_REIN_OP: TIBStringField;
    qryReg60MCANCELAMENTOS: TFloatField;
    qryReg60MDESCONTOS: TFloatField;
    qryReg60MSUBSTITUICAO: TFloatField;
    qryReg60MISENCAO: TFloatField;
    qryReg60MNAOTRIBUTADO: TFloatField;
    qryReg60MALIQ7: TFloatField;
    qryReg60MALIQ12: TFloatField;
    qryReg60MALIQ17: TFloatField;
    qryReg60MALIQ25: TFloatField;
    qryReg60MVENDA_BRUTA: TFloatField;
    qryReg60MTOT_GERAL: TFloatField;
    qryExpedicaoDelivery: TIBQuery;
    dsQryExpedicaoDElivery: TDataSource;
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
    qryClientesDeliveryCOMPLEMENTO: TIBStringField;
    qryClientesDeliveryREFERENCIA1: TIBStringField;
    qryClientesDeliveryREFERENCIA2: TIBStringField;
    qryClientesDeliveryFREQ_COMPRA: TIntegerField;
    qryClientesDeliveryULTIMO_PEDIDO: TIBStringField;
    qryClientesDeliveryDT_NASCIMENTO: TDateField;
    qryClientesDeliveryEMAIL: TIBStringField;
    qryClientesDeliveryCELULAR: TIBStringField;
    qryClientesDeliveryDESCRICAOBAIRRO: TIBStringField;
    QryUltimosPedidosDelivery: TIBQuery;
    qryItensUltimosPedidos: TIBQuery;
    dsQryUltimosPedidosDelivery: TDataSource;
    dsQryItensUltimosPedidosDelivery: TDataSource;
    qryEntregadores: TIBQuery;
    updQryEntregadores: TIBUpdateSQL;
    dsQryEntregadores: TDataSource;
    qryObsClientesDelivery: TIBQuery;
    dsQryObsClientesDelivery: TDataSource;
    qryCartoes: TIBQuery;
    dsQryCartoes: TDataSource;
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
    qryDadosPAF: TIBQuery;
    updQryDadosPAF: TIBUpdateSQL;
    qryDadosPAFMD5_PAF: TIBStringField;
    qryDadosPAFNOME_EMPRESA: TIBStringField;
    qryDadosPAFCNPJ: TIBStringField;
    qryDadosPAFINSCRICAO_ESTADUAL: TIBStringField;
    qryDadosPAFINSCRICAO_MUNICIPAL: TIBStringField;
    qryDadosPAFCONTATO: TIBStringField;
    qryDadosPAFENDERECO: TIBStringField;
    qryDadosPAFCIDADE: TIBStringField;
    qryDadosPAFCEP: TIBStringField;
    qryDadosPAFUF: TIBStringField;
    qryDadosPAFTELEFONE: TIBStringField;
    qryDadosPAFEMAIL: TIBStringField;
    qryDadosPAFNOME_PAF: TIBStringField;
    qryDadosPAFVERSAO_PAF: TIBStringField;
    qryDadosPAFVERSAO_ER: TIBStringField;
    qryEcfEmUso: TIBQuery;
    updQryEcfEmUso: TIBUpdateSQL;
    updQryCidade: TIBUpdateSQL;
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
    dsItensFatura: TDataSource;
    qryItensConsultaFatura: TIBQuery;
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
    updQryPromoters: TIBUpdateSQL;
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
    tbGuarnicoesTemp: TRxMemoryData;
    dsGuarnicoesTemp: TDataSource;
    tbGuarnicoesTempcodigo: TStringField;
    tbGuarnicoesTempdescricao: TStringField;
    tbSaboresPizzaTempobs: TStringField;
    qryCidadeCOD_CIDADE: TIBStringField;
    qryCidadeNOME: TIBStringField;
    qryCidadeCODIGO_ESTADO: TIBStringField;
    qryCidadeNOMEESTADO: TIBStringField;
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
    qryGuarnicoes: TIBQuery;
    dsGuarnicoes: TDataSource;
    updGuarnicoes: TIBUpdateSQL;
    qryGuarnicoesCODIGO: TIBStringField;
    qryGuarnicoesDESCRICAO: TIBStringField;
    tb_parametrosALIQUOTA_ICMS: TIBBCDField;
    tb_parametrosRED_BASE_ICMS: TFloatField;
    qry_fornecedoresCOD_FORNECEDOR: TIBStringField;
    qry_fornecedoresENDERECO: TIBStringField;
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
    qryMiniprinters: TIBQuery;
    tb_parametrosUSA_COD_GARCON: TSmallintField;
    tb_parametrosCOBRA_SERVICO: TSmallintField;
    qryReg60A: TIBQuery;
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
    qryManifestacaoNFE: TIBQuery;
    dsManifestacaoNFE: TDataSource;
    qryManifestacaoNFECHAVE_NFE: TIBStringField;
    qryManifestacaoNFECNPJ: TIBStringField;
    qryManifestacaoNFEIE: TIBStringField;
    qryManifestacaoNFENOME_FORNECEDOR: TIBStringField;
    qryManifestacaoNFEDATA_EMISSAO: TDateField;
    qryManifestacaoNFEVALOR_NOTA: TIBBCDField;
    qryManifestacaoNFENUMERO_NOTA: TIBStringField;
    qryManifestacaoNFECAMINHO_XML: TIBStringField;
    qryManifestacaoNFEDATA_INSERCAO: TDateTimeField;
    qryManifestacaoNFESTATUS_NFE: TSmallintField;
    qryManifestacaoNFELANCADA: TSmallintField;
    qryManifestacaoNFEFORN_CADASTRADO: TSmallintField;
    qryManifestacaoNFETIPO_MANIFESTACAO: TSmallintField;
    qryManifestacaoNFEDATA_HORA_MANIFESTACAO: TDateTimeField;
    qryManifestacaoNFEID_MANIFESTACAO: TIBStringField;
    qryManifestacaoNFEPROTOCOLO_MANIFESTACAO: TIBStringField;
    qryManifestacaoNFEXML_BAIXADO: TIntegerField;
    qryManifestacaoNFEMANIFESTO: TIBStringField;
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
    ACBrNFeDANFeESCPOS1: TACBrNFeDANFeESCPOS;
    ACBrNFeDANFEFR1: TACBrNFeDANFEFR;
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
    qryComparaProdutosNFEUNIDADE_COMERCIALIZADA: TIBStringField;
    qryComparaProdutosNFEDESCRICAO_FORNECEDOR: TIBStringField;
    qryComparaProdutosNFEULTIMA_CHAVE: TIBStringField;
    qryComparaProdutosNFEDESCRICAO: TIBStringField;
    qryComparaProdutosNFERAZAO_SOCIAL: TIBStringField;
    qryComparaProdutosNFEDESCRICAO_UNIDADE: TIBStringField;
    tb_parametrosNUMERO_NFE: TIntegerField;
    tb_parametrosSERIE_NFE: TIntegerField;
    qry_fornecedoresNUM_ENDERECO: TIBStringField;
    qry_fornecedoresCOMPLEMENTO: TIBStringField;
    qryVendasCaixa: TIBQuery;
    dsQryVendasCaixa: TDataSource;
    qryVendasCaixaCOD_VENDA: TIBStringField;
    qryVendasCaixaHORA: TTimeField;
    qryVendasCaixaMESA: TIBStringField;
    qryVendasCaixaVALOR_BRUTO: TIBBCDField;
    qryVendasCaixaVALOR_TXSERV: TIBBCDField;
    qryVendasCaixaVALOR_TX_ENTREGA: TIBBCDField;
    qryVendasCaixaVALOR_TOTAL: TIBBCDField;
    qryVendasCaixaMODELO_COMPROVANTE: TSmallintField;
    qryVendasCaixaCHAVE_NFCE: TIBStringField;
    qryVendasCaixaPROTOCOLO_NFCE: TIBStringField;
    qryVendasCaixaCOO_CUPOM: TIBStringField;
    qryVendasCaixaNUMERO_NFCE: TIntegerField;
    qryVendasCaixaVALOR_DESCONTO: TIBBCDField;
    qryVendasCaixaDATA_SO: TDateField;
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
    qry_gruposRESULTADO_RD: TSmallintField;
    qry_gruposPERC_PROJ_RD: TIBBCDField;
    qry_gruposMOSTRA_NO_RD: TSmallintField;
    qryVendasCaixaSERIE_NFCE: TSmallintField;
    ACBrNFe1: TACBrNFe;
    qryManifestacaoNFEOBS_MANIFESTACAO: TIBStringField;
    qryManifestacaoNFEPROCESSADA: TSmallintField;
    qryManifestacaoNFEXML_NOTA: TWideMemoField;
    ACBrTEFD1: TACBrTEFD;
    fdRestaurante: TFDConnection;
    FDPhysFBDriverLink1: TFDPhysFBDriverLink;
    qryVendasCaixaXML_DOC: TWideMemoField;
    qryVendasCaixaTIPO: TIBStringField;
    qryVendasCaixaDESC_MODELO_COMPROVANTE: TIBStringField;
    qryVendasCaixaNUMERO_CAIXA: TIBStringField;
    qryVendasCaixaTIPO_VENDA: TSmallintField;
    IdThreadComponent1: TIdThreadComponent;
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
    qryVendasCanceladasCOD_VENDA: TIBStringField;
    qryVendasCanceladasCOD_EMPRESA: TIBStringField;
    qryVendasCanceladasDATA: TDateField;
    qryVendasCanceladasDATA_SO: TDateField;
    qryVendasCanceladasDATA_HORA_CANCELAMENTO: TDateTimeField;
    qryVendasCanceladasMODELO_COMPROVANTE: TSmallintField;
    qryVendasCanceladasSERIE_NFCE: TSmallintField;
    qryVendasCanceladasNUMERO_NFCE: TIntegerField;
    qryVendasCanceladasXML_DOC: TWideMemoField;
    qryVendasCanceladasVALOR_TOTAL: TIBBCDField;
    qryVendasCanceladasCOD_USUARIO_CANCELAMENTO: TIBStringField;
    qryVendasCanceladasCHAVE_NFCE: TIBStringField;
    updVendasCanceladas: TIBUpdateSQL;
    ACBrNFeDANFCEFR1: TACBrNFeDANFCEFR;
    qryConsultaProdutos: TIBQuery;
    dsConsultaProdutos: TDataSource;
    qryConsultaProdutosCOD_BARRAS: TIBStringField;
    qryConsultaProdutosDESCRICAO: TIBStringField;
    qryConsultaProdutosVALOR_UNITARIO: TIBBCDField;
    qryConsultaProdutosCOD_GRUPO: TIBStringField;
    qryConsultaProdutosCOD_PRODUTO: TIBStringField;
    qryEstrutura: TIBQuery;
    qryExpedicaoDeliveryCODIGO: TIBStringField;
    qryExpedicaoDeliveryCOD_CLIENTE: TIBStringField;
    qryExpedicaoDeliveryVALOR_BRUTO: TIBBCDField;
    qryExpedicaoDeliveryVALOR_DESCONTO: TIBBCDField;
    qryExpedicaoDeliveryTAXA_ENTREGA: TIBBCDField;
    qryExpedicaoDeliveryVALOR_PEDIDO: TIBBCDField;
    qryExpedicaoDeliveryHORA_PEDIDO: TDateTimeField;
    qryExpedicaoDeliveryNOME_CLIENTE: TIBStringField;
    qryExpedicaoDeliveryTELEFONE: TIBStringField;
    qryExpedicaoDeliveryENDERECO: TIBStringField;
    qryExpedicaoDeliveryBAIRRO: TIBStringField;
    qryExpedicaoDeliveryHORA_LANCAMENTO: TDateTimeField;
    qryExpedicaoDeliveryHORA_SAIDA: TDateTimeField;
    qryExpedicaoDeliveryMINUTOS_SAIDA: TLargeintField;
    qryExpedicaoDeliveryTEMPO_SAIDA: TIBStringField;
    qryExpedicaoDeliveryENTREGADOR: TIBStringField;
    qryExpedicaoDeliveryRETIRA_BALCAO: TSmallintField;
    qryExpedicaoDeliveryDATA_HORA_ENTREGA: TDateTimeField;
    qryExpedicaoDeliveryHORA_AGENDADA: TTimeField;
    qryExpedicaoDeliverySTATUS_PEDIDO: TIntegerField;

    function AppIsRunning(ActivateIt: boolean) : Boolean;
    function verificaMesaBalcao(mesa : string) : boolean;
    function verificaTamanhoPizza(codigo : string; tipoCodigo : smallint) : smallint;
    
    function TrocaVirgPPto(Valor: string): String;
    function TrocaPontoPVirgula(Valor: string): String;
    function removePonto(Text : string) : string;

    function removeVirgula(Text : string) : string;
    function verificaseExisteMovimentoMesaBalcao() : boolean;
    function verificaseExisteMovimentoMesa(mesa : string) : boolean;
    function getCodMesaBalcao() : string;
    function getCodMesaDelivery() : string;
    function getCodGarconMesaDelivery() : string;
    procedure ComprimirArquivoZIP(ArquivoCompacto: TFileName; Arquivos: array of TFileName);
    procedure atualizaDataDoSistema;

    procedure adicionaLog(observacao: string);
    procedure adicionaLogSAT(observacao: string);

    function  getSerieNFCE() : integer;
    function  getNumeroNFCE() : integer;



    function  getNumeroNFE() : integer;




    function   verificaSeUltimaNFCEConstaNasVendas() : Boolean;
    function   EnviaNFCE() : Boolean;
    procedure  AdicionaNFCENaListaDeNotasParaCancelar(modelo : integer);



    procedure desabilitaCltrAltDel();
    procedure habilitaCltrAltDel();
    function  verificaStatusNotasSefaz(chaveNFCE : string) : boolean;
    function  verificaNotasContingencia() : boolean;
    function  verificaNotasContingenciaNoCaixa() : boolean;
    function  getCodGarconMesaBalcao() : string;
    function  getDescricaoPedidoBalcao() : string;
    //nfe
    procedure setFormaEmissaoNFCE(forma : integer);
    function  enviaNFCEContingencia: boolean;
    function  cancelaNFCE(chaveNFCE : string; protocolo: string; serie : integer; numeroNFCE : integer; justificativa : string) : boolean;


    function  setFormaEmissaOnlineNFE   () : boolean;

    function verificaSeErroNFEPermiteContingencia(erro: smallint;
        mensagem: string): smallint;



    function  getCodClientePedidoDelivery(codPedido : string) : string;
    procedure efetuaBaixaNoPedidoDelivery(codPedido : string ; cod_Venda : string ; cod_caixa : string ) ;

    procedure deletaDadosREgistroECF();
    procedure efetuaAberturaDaMesa(mesa : string);
    function  verificaSeAMesaFoiAberta(mesa : string) : boolean;
    function somaDiasData(data : Tdate ; dias : integer) : Tdate;
    function getTempoEntreHoras(horaInicial : Ttime; horaFinal : Ttime) : string;
    function moduloNumero(numero : integer) : integer;
    function maior(Tabela:String;Campo:String):Integer;
    function maiorOperacao(Tabela:String;Campo:String):Integer;
    function TestaCgc(xCGC: String):Boolean;
    function MemoInterbase(Sender: TObject): string;
    Function DiferencaEntreHoras(Hora_Final:TTime;Hora_Inicial:TTime):String;
    function ImpDireita(Valor: string; const tamanho: integer): string;
    function cria_log_de_erros (origem_do_erro : Tstrings; modulo_do_erro : string ;descricao : string; usuario : string) : boolean;
    function verifica_permissao(cod_modulo : string;cod_mod : string;usuario :string;mensagem:boolean) : boolean;
    function centralizar(S:string; Len:byte):string;
    function al_left(s:string; n:integer): string;
    function al_rigth(s:string; n:integer): string;
    function LeIni(tipo : integer;grupo: string;chave:string): string;
    function LeIniImpressoes(tipo : integer;grupo: string;chave:string): string;
    function LeIni2(tipo : integer;grupo: string;chave:string): string;
    function LeArquivoIniCaminho(arquivo : string; tipo : integer;grupo: string;chave:string): string;    
    function LeIniTerminais(tipo : integer;grupo: string;chave:string): string;
    function LeIniImpressoras(tipo : integer;grupo: string;chave:string): string;
    function retorna_informacao(parametro : string; tabela : integer; field : integer ) : string;
    function  retiraAcentos ( str: String ): String;
    function retornaCodProduto(codBarrasProduto : string) : string;
    procedure gravaini(grupo: string;chave:string;valor: string);
    function grava_arq_texto(nome_arq : string;texto : string) : boolean;
    function corretor_string() : string;
     function procura_simbolo(palavra : string; simbolo : string) : integer;
    procedure ExpXML(DataSet : TDataSet; Arq : string);
    function decriptografa(str : string; chave : string) : string;
    function criptografa(str : string; chave : string) : string;


    procedure atualizaObservacoesProduto(idProduto: integer;
      observacao: string);


    
    Function FormataCNPJ(CNPJ : string): string;
    function formatar_memo_sql(memo : Tmemo) : string;
    function  organizarCupom(str : string; str2: string; chr : string) : string;
    function  getCodMetreResponsavel(codGarcon : string) : string;
    function abre_porta_imp_NF(marca : integer; modelo : integer; porta : string) : string;
    function fecha_porta_imp_NF(marca : integer; modelo : integer; porta : string) : string;

    procedure gravarStream(codStream : string; tipo : string; med : string; stream : string);
    function verifica_intervalo_hora(horaIni : string; horaFim : string) : boolean;

    // RELATÓRIOS

    function removeCaracteres(Text : string) : string;
    function AnsiLength(const s: string): integer;
    function BuscaTroca(Text,Busca,Troca : string) : string;
   function  retiraCaracter(Text,Busca,Troca : string) : string;
   function trocaCaracteresEpson(str : string) : string;


   function VerificaConexaoInternet: boolean;

   function TBRound(Value: Extended; Decimals: integer): Extended;
   function  imprimeCabecalhoRelatorioDiversoNF(marca : integer; modelo : integer ; titulo : string) : string;

   procedure imprimeReciboRecebimentoFaturas(marca: integer ; codCliente : string ; nomeCliente : string ; totalFaturas : real);
   procedure imprimirPromissorias(marca : INTEGER; codVenda : string);

   function  gerarDadosRegistro60MECF() : boolean;
   function gerarDadosRegistro60mECFaRQUIVOS(CAMINHO : STRING) : boolean;
   procedure imprimeProtocoloLancamentoRd(evento : smallint; codLancamento : string);
   function imprimePreConta(mesa : string; marca : integer; tipo: integer; nPessoas :
         integer; subtotal : double;
         couvert : double ;
         txServico : double;
         repique   : double;
         desconto : double;
         totalConta : double;
         totalPago: double;
         troco : double;codigoVenda : string; txEtrega : double; codPedidoDelivery : string; codCliente : string; nomeCliente : string ; via : smallint) : boolean;

  procedure   imprimeComprovanteTransferenciaMesa(origem : string; destino : string ; codigo : string; totalOrigem : double; totalDestino : double);

   function   imprimeCabecalhoECF(marca : integer; tipo : integer;  mesa : string; codVenda : string; codPedidoDelivery : string; codCliente : string; nomeCliente : string; via : smallint) : boolean;
   procedure  imprimeRelatorioCaixa(marca : integer; NumeroCaixa : string);
   procedure  imprimeRelatorioEncerramentoDia(marca : integer; data : Tdate);
   procedure  imprimeComprovanteSangria(marca : integer; codSangria : string);
   procedure  imprimeComprovanteRecebimentoParcial(marca : integer; mesa : string);
   procedure  imprimeCabecalhoRelatorioDeCaixa(marca : integer; numeroCaixa : string);
   procedure  imprimeCabecalhoRelatorioDeEncerramentoDia(marca : integer; data: Tdate);
   procedure  imprimeProdutosVendidosCaixa(marca : integer; numeroCaixa : string);
   procedure  imprimePedidosDeliveryCaixa(marca : integer; numeroCaixa : string);   
   procedure  imprimeEstornosCaixa(marca : integer; numeroCaixa : string);
   procedure  imprimeResumoCaixa(marca : integer; numeroCaixa : string);
   procedure  imprimeResumoDoDia(marca : integer; dataSistema : Tdate);
   procedure  imprimeResumoGarcons(marca : integer; numeroCaixa : string);
   procedure  ImprimeVendasPorGarconAbriuMesa(marca : integer; numeroCaixa : string);   
   function   imprimeMovimentoContaECF(marca : integer; mesa : string; codVenda : string) : string;
   function   imprimeRecebimentosParciaisECF(marca : integer;  mesa : string) : string;
   function imprime_rodape_ExtratoContaNF(marca : integer; modelo : integer; tipo: integer; nPessoas :
         integer; subtotal : double;
         couvert : double ;
         txServico : double;
         repique   : double;
         desconto : double;
         totalConta : double;
         totalPago: double;
         troco : double; layout : integer) : string;



   procedure  emtirRelatorioParcialDeCaixa();

   procedure imprimeEstornoMesa(marca : integer; mesa : string);
   procedure ListarArquivos(Diretorio: string; Sub:Boolean ; lista : TStrings );

   function  imprimeRodapeExtratoContaECF(mesa : string; codVenda : string; marca : integer; tipo: integer; nPessoas :
         integer; subtotal : double;
         couvert : double ;
         txServico : double;
         repique   : double;
         desconto : double;
         totalConta : double;
         totalPago: double;
         troco : double; txEtrega : double) : string;



   function imprimeTexoMiniPrinter : boolean;
   function imprimeTexoImpressoraNFCE : boolean;
   procedure configuraImpressoraNFCE();
   procedure configuraImpressoraNaoFiscal();
   function imprimePedido(miniprinter : string; marca : integer) : boolean;
   function imprimePedido2(miniprinter : string;  mesa : string) : boolean;

   function getTotalPagamentosParciais(mesa : string) : double;
   function imprimeRecebimentosParciais(marca : integer; modelo : integer; mesa : string) : string;

   /// Funções de impressora não fiscal
   function imp_bmp_impNF(marca : integer; modelo : integer; indice : integer; img : Widestring; posicao : integer) : string;
  function cortaPapelImpNF(arquivo : string; marca : integer ; modelo  : integer) : string;
  function AbreGaveta(marca : integer ; modelo  : integer) : string;


   //////////////////////////////////////////////////////////////////////////////
   function imprimeLinhaECF(marca : integer; linha : Widestring;
         negrito :boolean; italico : boolean; sublinhado : boolean; tam : boolean;
         comprimido : boolean; largura : boolean; altura : boolean ) : string;


   function imprimeLinhaArquivo(marca : integer; linha : Widestring;
         negrito :boolean; italico : boolean; sublinhado : boolean; tam : boolean;
         comprimido : boolean; largura : boolean; altura : boolean ) : string;




   function imprime_linha_impNF(marca : integer; modelo : integer; linha : widestring;
         negrito :boolean; italico : boolean; sublinhado : boolean; tam : boolean;
         comprimido : boolean; largura : boolean; altura : boolean ) : string;


   function formatacao_daruma(negrito :boolean; italico : boolean; sublinhado : boolean; tam : boolean;
          comprimido : boolean; largura : boolean; altura : boolean ) : string;
   function formatacao_daruma_final(negrito :boolean; italico : boolean; sublinhado : boolean; tam : boolean;
          comprimido : boolean; largura : boolean; altura : boolean ) : string;

   function formatacaoBematech(negrito :boolean; italico : boolean; sublinhado : boolean; tam : boolean;
          comprimido : boolean; largura : boolean; altura : boolean ) : string;

function formatacaoACBRInicial(negrito :boolean; italico : boolean; sublinhado : boolean; tam : boolean;
          comprimido : boolean; largura : boolean; altura : boolean ) : string;

function formatacaoACBRFinal(negrito :boolean; italico : boolean; sublinhado : boolean; tam : boolean;
          comprimido : boolean; largura : boolean; altura : boolean ) : string;

 function formatacaoElginXprint(negrito :boolean; italico : boolean; sublinhado : boolean; tam : boolean;
        comprimido : boolean; largura : boolean; altura : boolean ) : string;

 function formatacaoElginI9(negrito :boolean; italico : boolean; sublinhado : boolean; tam : boolean;
        comprimido : boolean; largura : boolean; altura : boolean ) : string;



  function formatacaoBematechFinal(negrito :boolean; italico : boolean; sublinhado : boolean; tam : boolean;
          comprimido : boolean; largura : boolean; altura : boolean ) : string;

   function formatacaoDarumaNova(negrito :boolean; italico : boolean; sublinhado : boolean; tam : boolean;
          comprimido : boolean; largura : boolean; altura : boolean ) : string;

  function formatacaoDarumaNovaFinal(negrito :boolean; italico : boolean; sublinhado : boolean; tam : boolean;
          comprimido : boolean; largura : boolean; altura : boolean ) : string;

  function formatacao_Epson(negrito :boolean; italico : boolean; sublinhado : boolean; tam : boolean;
          comprimido : boolean; largura : boolean; altura : boolean ) : string;

    procedure reimprimirDanfe(parametro: string; campo: smallint;
      visualizar: boolean; cancelada : boolean);


  Function  fAlinhaD( const Texto, Key, Espaco, Decimal : String ): String;
  function  alinha_valor_a_direita(tam_str : integer; str : string) : string;
//   function  imprime_cabecalho_Cupom(marca : integer; modelo : integer; tipo : integer ; mesa : string; layout : integer; codVenda : string) : boolean;
   function  imprimeCabecalhoEstornoDeMesa(marca : integer; modelo : integer; tipo : integer ; mesa : string; layout : integer) : boolean;


  procedure configuraBalancas();
   ///////////////////////////////

   function  verificaPermissaoAcao(modulo : string) : boolean;
   procedure exibe_painel_erro(mensagem : string; captionBotao: string);
   procedure exibe_painel_troco(mensagem : string; troco : string);


   function painelDePergunta(mensagem : string ; tamFonte : integer) : boolean;



   procedure EncerraPainelDeErros();



   ///
   function imprimirExtratoTerminal(marca : integer; modelo : integer) : string;



    procedure DataModuleCreate(Sender: TObject);
    function asteriscos(qtd: integer  ) : string;
    procedure ComPortRxChar(Sender: TObject; Count: Integer);

   function  PadC(S:string; Len:byte):string;

   procedure gravarEstornoDeItem(mesa : string; codMotivo : string; descricaoMotivo: string; CodProduto : string; descriCaoProduto : string; qtde : double ; valorUnitario : double; obs : string; imprimirCancelamento : boolean; codCliente : string; nomeCliente : string ; idMovimento : integer);
   procedure gravarTransferenciaDeItem(mesaOrigem  : string; mesaDestino: string; codMotivo : string; descricaoMotivo: string; CodProduto : string; descriCaoProduto : string; qtde : double ; valorUnitario : double; obs : string);

   procedure imprimirEstornoDeItem(codEstorno : string; codCliente : string; nomeCliente : string);
   function  imprimirTransferenciaDeProduto(codTransferencia : string ) : string;


   procedure insereExtratosEmitidos(mesa : string; tipo_desconto : smallint; valorDesconto : double; valorCouvert : double; valorServico : double; cooExtrato : string; cerExtrato : string; ecf_extrato : string );
   procedure  atualizaTentativasEnvioNFCE(observacao : string; codVenda : string);
   procedure apagaExtratosEmitidos(mesa : string);
   procedure ApagaAberturaDaMesa(mesa : string);
   function  getUltimoExtratoEmitidoMesa(mesa : string) : TExtratoEmitido;
   function  getInformacoesDaMesa(mesa : string) : TinformacoesDaMesa;
   function  verificaExtratosEmitidos(mesa : string) : boolean;
   procedure imprimeListagemMesasAbertas(marca : integer; modelo : integer);
   function geraCodigo(AGenerator: string; tam : integer): string;
   procedure qry_itens_estoqueBeforePost(DataSet: TDataSet);
   function  verificaExistenciaUsuario(cod_usuario : string) : boolean;
   function  verificaTipoFormaPagamento(cod_forma : string) : integer;
   function  getTipoPagamentoNFCE(cod_forma : string) : TpcnFormaPagamento;
   function  getTipoPagamentoSAT(cod_forma : string) : TpcnCodigoMP;
   function  verificaExistenciaRecebimentosParciais(mesa : string) : boolean;
   function retornaCampoQQTabela(tabela : string; campos : string;cp_pesq: string; param_pesq: string;
  cp_ret : integer) : string;

   function verificaSeProdutoEstaNaConta(codProduto : string; mesa : string) : boolean;


   function    AnsiToUtf8(x: ansistring): string;


   procedure  imprimeCabecalhoMiniPrinter(marca : integer; modelo : integer; titulo : string);
   procedure  imprimeProdutosMiniPrinter(marca : integer; modelo : integer);
   procedure  imprimeGarconsMiniPrinter(marca : integer; modelo : integer);
   procedure  saltaLinhasMiniPrinter(marca : integer; modelo : integer);


   function maiorVenda(Tabela:String;Campo:String):Integer;
   procedure estornarMesaInteira(marca : integer ; modelo : integer; mesa : string; valorTotal : double);
   procedure impAssinaturaUsuario(marca : integer ; modelo : integer);
   procedure gravarRepique(codVenda : string; totalVenda : string; valor : double);


   procedure enviaProdutoParaFilaImpressao(cod_garcon : string; cod_produto : string ; mesa : string; quantidade : double ; observacao : string; sabores : string; tipo : string; terminal : integer; idMovimentoMesa : string; tipoMassa : string);

   function   ImprimeFilaDeImpressao(delivery : boolean; codPedidoDelivery : string; operacao : smallint) : string;

   function   verificaProdutoImprimeLocalProducao(cod_produto: string) : boolean;
   function   verificaProdutoImprimeDelivery(cod_produto: string) : boolean;
   function   verificaProdutoImprimeMesas(cod_produto: string) : boolean;
   function   verificaProdutoImprimeBalcao(cod_produto: string) : boolean;      

   procedure  formataCabecalhoDelivery(codPedido : string);
    procedure imprimirFichas(codVenda : string);

    procedure imprimeCancelamentoPedidoLocalProducao(mesa : string; codProduto : string; quantidade : double; cod_movimento : string);

    procedure tbComprasTempCalcFields(DataSet: TDataSet);
    procedure tbComprasTempvalorUnitarioValidate(Sender: TField);
    procedure tbComprasTempqtdeValidate(Sender: TField);

    procedure imprimeComprovanteDelivery(codPedido: string; operacao : smallint);


    function  getCodCouvertAutomatico(tipoCouvert : smallint; mesa : string) : string;
    function  verificaSeCobraCouvertNoDIa() : boolean;
    function  verificaSeMesaTemMovimento(mesa : string) : boolean;
    function  getNomeGarconAbriuMesa(mesa : string) : string;
    function  getCodGarconAbriuMesa(mesa : string) : string;
    function  getHoraAberturaDaMesa(mesa : string) : Ttime;
    function  getNumSequencia(cod_miniprinter : string) : string;
    procedure aplicaDescontoItem(mesa : string; codMovimento : string ; valor : double);

    // Função de Gravação em Arquivo
    procedure gravaStrEmArquivoDeTexto(arquivo : string;  str : string);

   function imprimeLinhaEmArquivo(Arquivo : string; marca: integer; modelo : integer; linha : Widestring;
         negrito :boolean; italico : boolean; sublinhado : boolean; tam : boolean;
         comprimido : boolean; largura : boolean; altura : boolean ) : string;


    function  inicializarSAT() : boolean;
    function   enviarCupomSat() : boolean;

    procedure gravaCabecalhoPedidoDelivery(Arquivo : string; marca : integer; modelo :integer; codigoPedido : string; operacao : smallint);
    procedure gravaCabecalhoPedidoNoArquivoDeImpressao(Arquivo : string; n_seq : string; cod_garcon: string; marca : integer; modelo :integer ; mesa : string; tipo : integer);
   procedure gravaProdutosDoPedidoNoArquivo(Arquivo : string; marca : integer; modelo : integer;codProduto : string; descricaoProduto : string; quantidade : double; preco : double; observacoes : string; sabores : string; tipoMassa : string ; idLancamento : integer  );
    procedure saltosNoArquivoTexto(Arquivo : string; marca : integer; modelo : integer; saltos : integer);
    function  verificaSeFuncionaComoBoate() : boolean;
    function  verificaSeRecebeCouvertEntrada() : boolean;
    procedure DataModuleDestroy(Sender: TObject);
    function verificaSomaProporcoesPizza() : Boolean;



   procedure ExportaDatasetExcel(DataSet: TDataSet; Arq: string);
    procedure dbrestauranteIdleTimer(Sender: TObject);
    procedure satGetsignAC(var Chave: AnsiString);
    procedure satGetcodigoDeAtivacao(var Chave: AnsiString);
    procedure satGravarLog(const ALogLine: string; var Tratado: Boolean);
    procedure satMensagemSEFAZ(ACod: Integer; AMensagem: string);
    procedure ACBrTEFD1ExibeMsg(Operacao: TACBrTEFDOperacaoMensagem;
      Mensagem: string; var AModalResult: TModalResult);
    procedure ACBrTEFD1ComandaECF(Operacao: TACBrTEFDOperacaoECF;
      Resp: TACBrTEFDResp; var RetornoECF: Integer);
    procedure ACBrTEFD1ComandaECFAbreVinculado(COO, IndiceECF: string;
      Valor: Double; var RetornoECF: Integer);
    procedure ACBrTEFD1ComandaECFImprimeVia(
      TipoRelatorio: TACBrTEFDTipoRelatorio; Via: Integer;
      ImagemComprovante: TStringList; var RetornoECF: Integer);
    procedure ACBrTEFD1ComandaECFPagamento(IndiceECF: string; Valor: Double;
      var RetornoECF: Integer);
    procedure ACBrTEFD1ComandaECFSubtotaliza(DescAcre: Double;
      var RetornoECF: Integer);
    procedure ACBrTEFD1InfoECF(Operacao: TACBrTEFDInfoECF;
      var RetornoECF: string);
    procedure ACBrTEFD1GravarLog(const GP: TACBrTEFDTipo; ALogLine: string;
      var Tratado: Boolean);
    procedure ACBrTEFD1AntesFinalizarRequisicao(Req: TACBrTEFDReq);
    procedure qryVendasCaixaTIPO_VENDAGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure IdThreadComponent1BeforeRun(Sender: TIdThreadComponent);
    procedure IdThreadComponent1Run(Sender: TIdThreadComponent);


    function getNCMProduto(tipoConsulta: smallint; codigo: string): string;
    function getCESTProduto(tipoConsulta: smallint; codigo: string): string;
    function getCFOPProduto(tipoConsulta: smallint; codigo: string): string;
    function getCSTProduto(tipoConsulta : smallint; codigo : string) : string;
    procedure verificaErrosNFCEEmitidas;
    procedure inserirXMLNotasDestinadas(xml: string);


    procedure imprimePedidoProducao(sequenciaImpressao: string);
    procedure configuraImpressoraProducao(numeroImpressora: integer);
    procedure imprimeTextoACBR(texto: Tstringlist);
    procedure imprimeCabecalhoPedido(strComprovante: TStringList; horaPedido: TDateTime; mesa, garcom, guidSeq: string; via: Smallint);


    procedure ImprimePreContaMesa(mesa: string; pessoas: smallint);
    procedure ativarModoContingenciaOfflineNFCE;
    procedure desativarModoContingenciaOFFlineNFCE;
    procedure CancelaNotasPendentes;
    procedure CancelaNotasPendentesPorSubstituicao;
    function cancelaNFECarregadaPorSubstituicao(justificativa,
      chaveNotaSubstituta: string): boolean;

    function  verificaExistenciaNotasPendentesCancelamento: boolean;
    procedure cancelaNFEPelaChave(chave, protocolo, justificativa: string);
    procedure IdThreadComponent1Terminate(Sender: TIdThreadComponent);
    procedure apagaNotaCarregadaACBRdaTabelaDeErros();

    procedure gravarEventoNFE(chave, xmlEvento: string;
      dataHoraEvento: TDateTime);
    function emitirCartaCorrecao(chave, textoCartaCorrecao: string): boolean;
    procedure atualizaDescontosDaVenda(codVenda: string);


//    function LeIni(tipo : integer;grupo: string; chave:string): string;
  private
    { Private declarations }

    numeroTransacaoTef : smallint;
    estadoSimuladoEcf : tEstadoEcfSimulado;
    tipoOperacaoTEF : smallint;
    operacaoADMTEF : boolean;
    testouExpiracaoCertificadoEntrada : boolean;

    function TemAtributo(Attr, Val: Integer): Boolean;
    function gerarEAssinarNFCE: boolean;
    procedure adicionaLinhaArquivoExtrato(str: string);
    procedure setMensagemOperadorTEF(mensagem: string);
    function getMensagemOperadorTEF: string;
    procedure imprimeCancelamentoPedidoProducao(codEstorno: string);

    function cancelaNFECarregadaACBR(justificativa: string): boolean;
    procedure atualizaStatusCancelamentoNFE;
    procedure parametrizaArquivoDeLogoNFE(AnotaEmissaoPropria: boolean);
    procedure verificaExpiracaoCertificadoDigital;
    function getSerieNFCEEmContingencia: integer;
    function getNumeroNFCEEmContingencia: integer;
    function getNumeroCartaCorrecaoNFE: integer;
    procedure AtualizaChaveNotaSubstitutaCancelar(chaveParaCancelar,
      chaveNFCESubstituta: string);







  public
    { Public declarations }
//     clienteCappta : IClienteCappta;
     TEFAutenticou : boolean;
     tentarNovamenteCappta : smallint;
     tipoViaCappta : integer;
     parametroRecebidoCappta : string;

     podeFecharFormMensagens : boolean;
     tempoFormMensagens : smallint;

     terminouEnvioNFCE : boolean;
     tentandoEmissaoContingencia : boolean;
     nfceEnviada : boolean;


    procedure gerarFatura(codCliente : string; codVenda : string; valorFatura : double ; obs : string );
    function autenticaTEF: boolean;
    procedure setNumeroTransacaoTef(num: smallint);
    function getNumeroTransacaoTef: smallint;
    procedure setEstadoSimuladoECF(estado: tEstadoEcfSimulado);
    function getEstadoSimuladoECF: tEstadoEcfSimulado;
    procedure setTipoOperacaoTEF(tipo : smallint);
    function  getTipoOperacaoTEF: smallint;
    procedure setOperacaoADMTEF(operacao: boolean);
    procedure parametrizaAcbrNFE(modeloNfe: TpcnModeloDF; visualizar : boolean;
      ANotaEmissaoPropria: boolean);



  end;

type
  TKeySizeIndex = (ks64, ks128, ks192, ks256);


const
  KeySizes : array[TKeySizeIndex] of Byte = (8, 16, 24, 32);

var

  Key : array[0..32] of Byte;
  PlainText        : string;
  CipherText        : string;
  cor_ao_entrar : TColor;
  cor_ao_sair   : TColor;
  layoutExtrato : smallint;


  RetornoPorta : string;



var
  dm: Tdm;


implementation

uses uu_frm_principal, Math, uu_manutencao_grupos,
  
   uu_modelo_vazio,
   uu_caixa_restaurante, uuLogTouch,
  uu_frm_pergunta, uuFrmTroco, uuQtdePessoas,
  uuRecebimentoContaAssinada, uu_confirma_extrato, uuPainelAguarde,
  ACBrNFeWebServices, uu_encerramento, uuOperacoesCaixa,
  uuMensagemExpiracaoCertificado;

{$R *.dfm}



procedure TDM.atualizaDataDoSistema();
begin

  dm.tb_parametros.Active:=false;
  dm.tb_parametros.Active:=true;
  data_do_sistema:=dm.tb_parametros.Fieldbyname('data_sistema').value;
  frm_principal. dxStatusBar1.Panels[1].Text:='Data do Sistema: '+FormatDateTime('DD/MM/YY',data_do_sistema);
end;


function Tdm.TemAtributo(Attr, Val: Integer): Boolean;
begin
  Result := Attr and Val = Val;
end ;

function Tdm.TrocaVirgPPto(Valor: string): String;
var i:integer;
begin
if Valor <> ' ' then
   begin
   for i := 0 to Length(Valor) do
       begin
       if Valor[i]='.' then
          begin
          Valor[i]:=',';
          end
       else if Valor[i] = ',' then
               begin
               Valor[i]:='.';
               end;
       end;
   end;
   Result := valor;
end;

function Tdm.TrocaPontoPVirgula(Valor: string): String;
//
// Troca a virgula pelo ponto em um valor Float
//
var i:integer;
begin
if Valor <> ' ' then
   begin
   for i := 0 to Length(Valor) do
       begin
       if Valor[i]=',' then
          begin
          Valor[i]:='.';
          end
       else if Valor[i] = '.' then
               begin
               Valor[i]:=',';
               end;
       end;
   end;
   Result := valor;
end;

function Tdm.removeVirgula(Text : string) : string;
var
n : integer;
total : integer;
contador : integer;
achou : boolean;
chars : array[1..10] of string;
begin
  total:=1;
  contador:=1;


 chars[1]:=',';
 while (contador <= total ) do
 begin


  n:=1;
  while( (n <=  length(Text)) ) do//for n := 1 to length(Text) do
  begin
    if Copy(Text,n,1) = chars[contador] then
      begin
        Delete(Text,n,1);
        achou:=true;
      end;
    n:=n+1;
   end;
  contador := contador +1;
 end;

  Result := Text;
end;

function Tdm.removePonto(Text : string) : string;
var
n : integer;
total : integer;
contador : integer;
achou : boolean;
chars : array[1..10] of string;
begin
  total:=1;
  contador:=1;


 chars[1]:='.';
 while (contador <= total ) do
 begin


  n:=1;
  while( (n <=  length(Text)) ) do//for n := 1 to length(Text) do
  begin
    if Copy(Text,n,1) = chars[contador] then
      begin
        Delete(Text,n,1);
        achou:=true;
      end;
    n:=n+1;
   end;
  contador := contador +1;
 end;

  Result := Text;
end;

Function Tdm.DiferencaEntreHoras(Hora_Final:TTime;Hora_Inicial:TTime):String;
Var  A,M,H,M1,M2,H1,H2 : Real;
     T1,T2 : String;
Label Passa;
begin
        A  := 0;
        T1 := TimeToStr(Hora_Final);
        T2 := TimeToStr(Hora_Inicial);
        If (T1 <> '00:00:00') and (T2 <> '00:00:00') then begin
                 M1 := StrToFloat(T1[4] + T1[5]);
                 M2 := StrToFloat(T2[4] + T2[5]);
                 If M1 = 0 then begin
                       A := 1;
                       M := 60 - M2;
                       Goto Passa;
                 end;
                 If M1 > M2 then
                    M  := M1 - M2
                 else
                    M  := M2 - M1;
                 Passa:
                 If M < 0 then begin
                         M := 60 - M;
                 end;
                 If M > 60 then begin
                         M := 60 - M;
                 end;
                 H1 := StrToFloat(T1[1] + T1[2]);
                 H2 := StrToFloat(T2[1] + T2[2]);
                 H  := H1 - H2;
                 If H1 <> H2 then
                     H  := H - A;
         Result := FloatToStr(H) + ':' + FloatToStr(M);
 end else
         Result := '00:00';
end;


function Tdm.maior(Tabela:String;Campo:String):Integer;
begin
QryMax.Active:=False;
QryMax.SQL.Clear;
QryMax.SQL.Add('Select max('+Campo+') as Maior from '+Tabela);
QryMax.Active:=True;
if QryMax.eof or (QryMax['Maior']<1) then
Maior:=1
else
Maior:= QryMax['Maior']+1;
QryMax.Active:=False;
end;




function Tdm.maiorOperacao(Tabela:String;Campo:String):Integer;
var
 qryMaxOp : TIBquery;
begin

QryMaxOp:=TIBquery.create(self);
qryMaxOp.database:=dbrestaurante;
qryMaxOp.transaction:=transLog;
QryMaxOp.Active:=False;
QryMaxOp.SQL.Clear;
QryMaxOp.SQL.Add('Select max('+Campo+') as Maior from '+Tabela);
QryMaxOp.Active:=True;
if QryMaxOp.eof or (QryMaxOp['Maior']<1) then
MaiorOperacao:=1
else
maiorOperacao:= QryMaxOp['Maior']+1;
QryMaxOp.Active:=False;
FreeAndNil(qryMaxOp);
end;


function Tdm.cria_log_de_erros(origem_do_erro : Tstrings ; modulo_do_erro : string ; descricao : string;  usuario : string) : boolean;
begin
  ShowMessage('Ocorreu um erro no sistema!  Um log de erros foi criado no formato DATA+HORA na pasta logs do Sistema. Abra o arquivo e envio por fax ou email para a Real Sofwares');
  if FileExists(patchAplicacao+'logs\log_erros'+FormatDateTime('DDMMYY',date)+FormatDateTime('HHMM',time))
   then
      begin
        DeleteFile(patchAplicacao+'logs\log_erros'+FormatDateTime('DDMMYY',date)+FormatDateTime('HHMM',time));
      end;
     origem_do_erro.Add('');
     origem_do_erro.Add('****************************************************');
     origem_do_erro.Add('Erro no módulo de : '+modulo_do_erro);
     origem_do_erro.Add('Usuário ativo : '+usuario);
     origem_do_erro.Add('Descrição:' +descricao);
     origem_do_erro.Add('****************************************************');
     origem_do_erro.AddStrings(origem_do_erro);
     origem_do_erro.SaveToFile(patchAplicacao+'logs\log_erros'+FormatDateTime('DDMMYY',date)+FormatDateTime('HHMM',time)+'.err');
end;

function Tdm.MemoInterbase(Sender: TObject): string;
var sMemo: string;
    Ind: integer;
begin
sMemo:='';
For ind:=0 to (Sender as TMemo).Lines.Count-1 do
    Begin
    If Ind=0 then
       sMemo:=(Sender as TMemo).Lines[ind]
    Else
       sMemo:=sMemo+'\r\n'+(Sender as TMemo).Lines[ind];
    End;
Result:=sMemo;
End;



function Tdm.TestaCgc(xCGC: String):Boolean;
{Testa se o CGC é válido ou não}
Var
d1,d4,xx,nCount,fator,resto,digito1,digito2 : Integer;
Check : String;
begin
d1 := 0;
d4 := 0;
xx := 1;
for nCount := 1 to Length( xCGC )-2 do
    begin
    if Pos( Copy( xCGC, nCount, 1 ), '/-.' ) = 0 then
       begin
       if xx < 5 then
          begin
          fator := 6 - xx;
          end
       else
          begin
          fator := 14 - xx;
          end;
       d1 := d1 + StrToInt( Copy( xCGC, nCount, 1 ) ) * fator;
       if xx < 6 then
          begin
          fator := 7 - xx;
          end
       else
          begin
          fator := 15 - xx;
          end;
       d4 := d4 + StrToInt( Copy( xCGC, nCount, 1 ) ) * fator;
       xx := xx+1;
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
   Check := IntToStr(Digito1) + IntToStr(Digito2);
   if Check <> copy(xCGC,succ(length(xCGC)-2),2) then
      begin
      Result := False;
      end
   else
      begin
      Result := True;
      end;
end;


function Tdm.VerificaConexaoInternet: boolean;
var
 flags : DWORD;
begin

    result := InternetCheckConnection('http://www.google.com', 1, 0);


end;


function Tdm. ImpDireita(Valor: string; const tamanho: integer): string;
Begin
   Result:=copy('                                                  ',1,tamanho-Length(valor))+valor;
End;

function Tdm.verifica_permissao(cod_modulo : string;cod_mod : string;usuario:string;mensagem:boolean) : boolean;
begin
  qrymax.Active:=false;
  qrymax.sql.clear;
  qrymax.sql.add('select * from permissoes where cod_modulo='+Quotedstr(cod_modulo)+' and cod_mod='+Quotedstr(cod_mod)+' and cod_usuario='+Quotedstr(usuario));
  qrymax.Active:=true;
  if qrymax.IsEmpty then
  begin
   Result:=false;
   exit;
  end;

  if qrymax.FieldByName('permite').Value= 1 then
   Result:=true
  else
   Result:=false;


  if ( (result=false) and (mensagem= true)) then
  showmessage('Você não tem permissão para acessar este módulo/função!');
end;



function Tdm.centralizar(S:string; Len:byte):string;
var
 Str:String;
 L:byte;
begin
str :='';
if len < Length(s) then begin
  Result := '';
  Exit;
  end;
l:=(Len-Length(S)) div 2;
while l > 0 do begin
  str:=str+' ';
  dec(l);
  end;
for l:=1 to length(S) do begin
  str := str+s[L];
  end;
 Result := str;
end;

function Tdm.al_left(s:string; n:integer): string;
begin
  Result := Format('%-' + IntToStr(n) + '.' + IntToStr(n) + 's', [s]);
end;

function Tdm.al_rigth(s:string; n:integer): string;
begin
  Result:=Format('%' + IntToStr(n) + '.' + IntToStr(n) + 's', [s]);
end;




function Tdm.LeIni(tipo : integer;grupo: string;chave:string): string;
var
ArqIni : tIniFile;
caminho : string;
begin
ArqIni := tIniFile.Create(ExtractFilePath( Application.ExeName )+'config.Ini');
 case tipo of
  1 : begin
        Result:=Inttostr(ArqIni.ReadInteger(grupo,chave,0));
      end;
  2 : begin
        Result:=ArqIni.ReadString(grupo,chave,'0');
      end;
 end;
ArqIni.Free;
end;



function Tdm.verificaNotasContingencia() : boolean;
begin
  dm.qryauxiliar.Active := false;
  dm.qryauxiliar.SQL.clear;
  dm.qryauxiliar.SQL.Add(' select * from vendas v where v.protocolo_nfce='+Quotedstr('CONTINGENCIA'));
  dm.qryauxiliar.Active := true;

  if dm.qryauxiliar.IsEmpty then
   result := false
  else
   result := true;

end;




function Tdm.verificaNotasContingenciaNoCaixa() : boolean;
begin
  dm.qryauxiliar.Active := false;
  dm.qryauxiliar.SQL.clear;
  dm.qryauxiliar.SQL.Add(' select * from vendas v where v.protocolo_nfce='+Quotedstr('CONTINGENCIA')+' and v.numero_caixa='+QuotedStr(numero_caixa));
  dm.qryauxiliar.Active := true;

  if dm.qryauxiliar.IsEmpty then
   result := false
  else
   result := true;

end;

procedure Tdm.atualizaObservacoesProduto(idProduto : integer; observacao : string);
begin
  dm.qryauxiliar.SQL.Clear;
  dm.qryauxiliar.SQL.Add('update movimento_mesa ms set ms.observacoes= '+Quotedstr(BuscaTroca(trim(observacao),LineBreak,'')));
  dm.qryauxiliar.SQL.Add(' where ms.id='+Inttostr(idProduto));
  dm.adicionaLog(dm.qryauxiliar.SQL.Text );
  dm.qryauxiliar.ExecSQL;


  dm.qryauxiliar.SQL.Clear;
  dm.qryauxiliar.SQL.Add('update fila_de_impressao ms set ms.observacoes='+Quotedstr(BuscaTroca(trim(observacao),LineBreak,'')));
  dm.qryauxiliar.SQL.Add(' where ms.ID_MOVIMENTO_MESA='+Inttostr(idProduto));
  dm.adicionaLog(dm.qryauxiliar.SQL.text);
  dm.qryauxiliar.ExecSQL;

  dm.transacao.Active := true;
  dm.transacao.Commit;


end;




function Tdm.LeIniImpressoes(tipo : integer;grupo: string;chave:string): string;
var
ArqIni : tIniFile;
caminho : string;
begin
ArqIni := tIniFile.Create(ExtractFilePath( Application.ExeName )+'configImpressoes.Ini');
 case tipo of
  1 : begin
        Result:=Inttostr(ArqIni.ReadInteger(grupo,chave,0));
      end;
  2 : begin
        Result:=ArqIni.ReadString(grupo,chave,'0');
      end;
 end;
ArqIni.Free;
end;



function Tdm.LeArquivoIniCaminho(arquivo : string; tipo : integer;grupo: string;chave:string): string;
var
ArqIni : tIniFile;
caminho : string;
begin
ArqIni := tIniFile.Create(arquivo);
 case tipo of
  1 : begin
        Result:=Inttostr(ArqIni.ReadInteger(grupo,chave,0));
      end;
  2 : begin
        Result:=ArqIni.ReadString(grupo,chave,'0');
      end;
 end;
ArqIni.Free;
end;






function Tdm.LeIniTerminais(tipo : integer;grupo: string;chave:string): string;
var
ArqIni : tIniFile;
caminho : string;
begin

ArqIni := tIniFile.Create(ExtractFilePath( Application.ExeName )+'terminais.Ini');

 case tipo of
  1 : begin
        Result:=Inttostr(ArqIni.ReadInteger(grupo,chave,0));
      end;
  2 : begin
        Result:=ArqIni.ReadString(grupo,chave,'0');
      end;
 end;
ArqIni.Free;
end;


function Tdm.LeIni2(tipo : integer;grupo: string;chave:string): string;
var
ArqIni : tIniFile;
begin
  ArqIni := tIniFile.Create(ExtractFilePath( Application.ExeName )+'xpconfig.Ini');
 case tipo of
  1 : begin
        Result:=Inttostr(ArqIni.ReadInteger(grupo,chave,0));
      end;
  2 : begin
        Result:=ArqIni.ReadString(grupo,chave,'0');
      end;
 end;
ArqIni.Free;
end;


function Tdm.LeIniImpressoras(tipo : integer;grupo: string;chave:string): string;
var
ArqIni : tIniFile;
caminho : string;
begin
ArqIni := tIniFile.Create(ExtractFilePath( Application.ExeName )+'configImpressoes.Ini');

 case tipo of
  1 : begin
        Result:=Inttostr(ArqIni.ReadInteger(grupo,chave,0));
      end;
  2 : begin
        Result:=ArqIni.ReadString(grupo,chave,'0');
      end;
 end;
ArqIni.Free;
end;



procedure Tdm.gravaini(grupo: string;chave:string;valor: string);
var
ArqIni : TIniFile;
begin
ArqIni := tIniFile.Create(ExtractFilePath( Application.ExeName )+'config.Ini');
Try
  ArqIni.WriteString(grupo,chave, valor);
Finally
ArqIni.Free;
end;
end;

function  Tdm.grava_arq_texto(nome_arq : string;texto : string): boolean;
var
 F : TextFile;
begin
  try
    AssignFile(F,nome_arq);
  except
    begin
      ShowMessage('Erro ao tentar gravar no arquivo texto!');
      Result:=false;
      exit;
    end;
  end;

  if not FileExists(nome_arq) then
   begin
    Rewrite(f)
   end;
  TRY
   BEGIN
     Append(F);
     Writeln(F,texto);
     closefile(F);
     Result:=true;
   end;
  except
    begin
      showmessage('Erro ao gravar no arquivo de texto!');
      result:=false;
    end;
  end;
end;




function Tdm.criptografa(str : string; chave : string) : string;

begin
  Result := JvVigenereCipher1.EncodeString(chave,str);



end;

function Tdm.decriptografa(str : string; chave : string) : string;
begin
 Result := JvVigenereCipher1.DecodeString(chave,str);
end;



function Tdm.procura_simbolo(palavra : string; simbolo : string) : integer;
var
 tamanho_string : integer;
 cont : integer;
 ini,fim : integer;
 posicao: integer;
 valor : string;
begin
  ini:=0;
  fim:=1;
  posicao:=0;
  cont:=0;
  tamanho_string:=0;
  tamanho_string:= length(palavra);
  while cont < tamanho_string do
  begin
     valor:=Copy(palavra,ini,ini-1);
     if valor = simbolo then
      begin
        posicao:=ini;
      end
     else
      begin
        ini:=ini+1;
        fim:=ini+1;
      end;
      cont:=cont+1;
  end;
  Result:=posicao;
end;

function Tdm.corretor_string() : string;
var
 i:integer;
const
  str='1234567890ABCDEFGHIJKLMNOPQRSTUVWXYZ';
  max=6;
begin
  for i:=1 to max do
  begin
    result:=result+str[random(length(str))+1];
  end;
end;


Function Tdm.FormataCNPJ(CNPJ : string): string;
    begin
    Result :=Copy(CNPJ,1,2)+'.'+Copy(CNPJ,3,3)+'.'+Copy(CNPJ,6,3)+'/'+Copy(CNPJ,9,4)+'-'+Copy(CNPJ,13,2);
    end;



function Tdm.formatar_memo_sql(memo : Tmemo) : string;
var
 ct : integer;
 str: string;
begin
   str:='''';
   for ct:=0 to memo.Lines.Count-1 do
   begin
    str:=str+' '+memo.Lines[ct];
   end;
      str:=str+'''';
   result:=str;

end;









procedure Tdm.DataModuleCreate(Sender: TObject);
begin
{  clienteCappta  := CoClienteCappta.Create;

  TEFAutenticou  := false;
  }cor_ao_entrar:=clMoneyGreen;
  cor_ao_sair:=clWhite;
  dbrestaurante.Connected:=false;
  fdRestaurante.Connected := false;
  testouExpiracaoCertificadoEntrada := false;


end;



function Tdm.retorna_informacao(parametro : string; tabela : integer; field : integer ) : string;
begin
  dm.qry_consultas.Active:=false;
  dm.qry_consultas.sql.clear;
  case tabela of
    1: begin        // 1 Cadastro de itens
         qry_consultas.sql.add('select * from itens_estoque where cod_item='+Quotedstr(parametro));
       end;
    2: begin        // 2 cadastro de produtos

       end;
    3: begin       // 3 cadastro de unidades
         qry_consultas.sql.add('select un.cod_unidade,un.descricao,un.sigla,un.parametro,un.cod_padrao from unidades un where cod_unidade='+Quotedstr(parametro));
       end;

    4: begin
         qry_consultas.sql.add('select * from grupos where cod_grupo='+Quotedstr(parametro));
       end;

    5: begin
         qry_consultas.sql.add('select * from centros_de_custo where cod_c_custo='+Quotedstr(parametro));
       end;

    6: begin
         qry_consultas.sql.add('select * from tipos_baixa where cod_tipo='+Quotedstr(parametro));
       end;

    7: begin
         qry_consultas.sql.add('select * from usuarios where cod_usuario='+Quotedstr(parametro));
       end;
    8: begin
         qry_consultas.SQL.add('select f.cod_forma,f.descricao,f.rp from formas_pagamento f where f.descricao='+Quotedstr(parametro));
       end;
  end;

  qry_consultas.Active:=true;
  if not dm.qry_consultas.IsEmpty then
     Result:=qry_consultas.Fields[field].AsString
  else
     Result:='EMPTY';
end;

















function Tdm.abre_porta_imp_NF(marca : integer; modelo : integer; porta : string) : string;
var
  ret : integer;
begin
Result:='OK';
  case marca of
    1: begin
         porta:=porta+#0;
//         comport.Port:=porta;
         case modelo of

          1 : begin

               try
//               comport.Open;
               except
                begin
                   showmessage('Erro abrindo a porta '+porta);
                   exit;
                end;
               end;



               result:='OK';
              end;
         end;
       end;
    2: begin
         porta:=porta+#0;
         case modelo of

          1 : begin
//               comport.Port:=porta;
  //             comport.Open;
               result:='OK';
              end;
         end;
       end;


    3: begin
         try
          begin
//           comport.Port:=porta;
  //         comport.Open;
           result:='OK';
          end
         except
          result:='Erro ao abrir a porta serial. Verifique a conexão dos cabos e tente novamente';
         end;
       end;
    4: begin
         case modelo of
           1:  begin    // Térmica TM-T88II
                  try
                    begin

//                      comport.Port:=porta;
  //                    comport.Open;
    //                  result:='OK';
                    end
                  except
                      result:='Erro ao abrir a porta serial. Verifique a conexão dos cabos e tente novamente';
                  end;

               end;

         end;


       end;

    5: begin  // Epson
         case modelo of
           1:  begin    // Térmica TM-T88II
                  try
                    begin

//                      comport.Port:=porta;
//                      comport.Open;
                      result:='OK';
                    end
                  except
                      result:='Erro ao abrir a porta serial. Verifique a conexão dos cabos e tente novamente';
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


procedure Tdm.ACBrTEFD1AntesFinalizarRequisicao(Req: TACBrTEFDReq);
begin

 if ( ( DM.getEstadoSimuladoECF = tpsVenda) or ( DM.getEstadoSimuladoECF = tpsPagamento  ))  then
  begin
     case tipoOperacaoTEF of
      1: begin // venda a crédito
            Req.GravaInformacao(730,000,'1'); // Tipo da operação = Venda
            Req.GravaInformacao(731,000,'1'); // Tipo do Cartão =Credito
            Req.GravaInformacao(732,000,'1'); // Tipo = A vista
          end;

      2: begin    // Venda a débito
            Req.GravaInformacao(730,000,'1');
            Req.GravaInformacao(731,000,'2');  // Tipo cartão = Débito
            Req.GravaInformacao(732,000,'1');
          end;


      3: begin
            Req.GravaInformacao(730,000,'1');
            Req.GravaInformacao(731,000,'3');
            Req.GravaInformacao(732,000,'1');
          end;


      4: begin
            Req.GravaInformacao(730,000,'1');
            Req.GravaInformacao(731,000,'1');
            Req.GravaInformacao(732,000,'1');
          end;


      5: begin
            Req.GravaInformacao(010,000,'CERTIF');
            Req.GravaInformacao(730,000,'1');
            Req.GravaInformacao(731,000,'1');
            Req.GravaInformacao(732,000,'1');
          end;


      end;
  end;




end;

procedure Tdm.ACBrTEFD1ComandaECF(Operacao: TACBrTEFDOperacaoECF;
  Resp: TACBrTEFDResp; var RetornoECF: Integer);
begin
  try
    case Operacao of
      opeAbreGerencial :
       begin

       end;

       //  MemoCupomTEF.Lines.Add('Abre Gerencial') {ACBrECF1.AbreRelatorioGerencial} ;

      opeFechaCupom :
       begin
        estadoSimuladoEcf := tpsLivre;
       end;


      opeSubTotalizaCupom :
       begin
        // MemoCupomTEF.Lines.Add('Sub Totaliza');
       end;

      opeFechaGerencial, opeFechaVinculado :
         estadoSimuladoEcf := tpsRelatorio;

      opePulaLinhas :
        begin
       //   MemoCupomTEF.Lines.Add('PulaLinhas');
          Sleep(200);
        end;

      opeImprimePagamentos :
        begin
         // MemoCupomTEF.Lines.Add('ImprimePagamentos');
        end;
    end;
    RetornoECF := 1 ;
  except
    RetornoECF := 0 ;
  end;


end;

procedure Tdm.ACBrTEFD1ComandaECFAbreVinculado(COO, IndiceECF: string;
  Valor: Double; var RetornoECF: Integer);
begin
  RetornoECF := 1;
end;

procedure Tdm.ACBrTEFD1ComandaECFImprimeVia(
  TipoRelatorio: TACBrTEFDTipoRelatorio; Via: Integer;
  ImagemComprovante: TStringList; var RetornoECF: Integer);
begin




 case TipoRelatorio of
   trGerencial :
    begin
      If FileExists(caminhoArquivoExtrato) then DeleteFile(caminhoArquivoExtrato);
      dm.adicionaLinhaArquivoExtrato(ImagemComprovante.Text);
      adicionaLinhaArquivoExtrato('</corte_parcial>');
      dm.adicionaLog  ('COMPROVANTE TEF GERENCIAL:' + ImagemComprovante.Text);
    end;
   trVinculado :
    begin
      If FileExists(caminhoArquivoExtrato) then DeleteFile(caminhoArquivoExtrato);
      dm.adicionaLinhaArquivoExtrato(ImagemComprovante.Text);
      adicionaLinhaArquivoExtrato('</corte_parcial>');
      dm.adicionaLog  ('COMP TEF VINCULADO:' + ImagemComprovante.Text);
    end;




  end;


 ACBrPosPrinter1.LinhasEntreCupons := StrToInt(dm.LeIni(1,'IMPRESSORA_NAO_FISCAL_01','linhasAposCupom'));
 frm_principal.memo_avisos.Lines.Clear;
 frm_principal.memo_avisos.Lines.LoadFromFile(caminhoArquivoExtrato);
 dm.imprimeTexoMiniPrinter();
 RetornoECF := 1 ;

end;

procedure Tdm.ACBrTEFD1ComandaECFPagamento(IndiceECF: string; Valor: Double;
  var RetornoECF: Integer);
begin
  RetornoECF := 1;
end;

procedure Tdm.ACBrTEFD1ComandaECFSubtotaliza(DescAcre: Double;
  var RetornoECF: Integer);
begin
   estadoSimuladoEcf := tpsPagamento;
  RetornoECF := 1 ;

end;

procedure Tdm.setMensagemOperadorTEF(mensagem : string);
begin

  if operacaoADMTEF = false  then
   begin
     frm_encerramento.setMensagemOperador(mensagem);
    end
 else
  begin
    frmOperacoesDeCaixa.setMensagemOperador(mensagem);
  end;
end;

function Tdm.getMensagemOperadorTEF() : string;
begin
    if operacaoADMTEF = false  then
   begin
     result :=  frm_encerramento.getMensagemOperador;

   end
 else
  begin
    Result := frmOperacoesDeCaixa.getMensagemOperador;
  end;
end;


procedure Tdm.ACBrTEFD1ExibeMsg(Operacao: TACBrTEFDOperacaoMensagem;
  Mensagem: string; var AModalResult: TModalResult);
var
   Fim : TDateTime;
   OldMensagem : String;
begin
//  StatusBar1.Panels[1].Text := '' ;
//  StatusBar1.Panels[2].Text := '' ;

  case Operacao of

    opmOK :
       AModalResult := MessageDlg( Mensagem, mtInformation, [mbOK], 0);

    opmYesNo :
       AModalResult := MessageDlg( Mensagem, mtConfirmation, [mbYes,mbNo], 0);

    opmExibirMsgOperador, opmRemoverMsgOperador :
         setMensagemOperadorTEF(mensagem);

    opmExibirMsgCliente, opmRemoverMsgCliente :
        setMensagemOperadorTEF(mensagem);

    opmDestaqueVia :
       begin
         OldMensagem :=         getMensagemOperadorTEF ();
         try
          setMensagemOperadorTEF (mensagem);

            { Aguardando 3 segundos }
            Fim := IncSecond( now, 3)  ;
            repeat
               sleep(200) ;
                        setMensagemOperadorTEF(mensagem + ' ' + IntToStr(SecondsBetween(Fim,now)));
               Application.ProcessMessages;
            until (now > Fim) ;

         finally
                    setMensagemOperadorTEF(OldMensagem);
         end;
       end;
  end;

  Application.ProcessMessages;
end;

procedure Tdm.ACBrTEFD1GravarLog(const GP: TACBrTEFDTipo; ALogLine: string;
  var Tratado: Boolean);
begin
  dm.adicionaLog('Log do TEF: '+ALogLine);
end;

procedure Tdm.ACBrTEFD1InfoECF(Operacao: TACBrTEFDInfoECF;
  var RetornoECF: string);
var
   ASubTotal: Double;
begin
     case Operacao of
     ineSubTotal :
       begin
         ASubTotal := StringToFloatDef(Floattostr(frm_encerramento.gettotalVenda) ,0);
         //ASubTotal := ASubTotal - StringToFloatDef(EditTotalPago.Text, 0){ + Tratar Desconto e Acrescimo aqui: StringToFloatDef(edValorDescAcre.Text, 0)};
         RetornoECF := FloatToStr(ASubTotal);
         if estadoSimuladoEcf = tpsPagamento then
           RetornoECF := FloatToStr(0);
       end;

     ineTotalAPagar :
       RetornoECF := '0';

     ineEstadoECF :
       begin
         Case estadoSimuladoEcf of
           tpsLivre     : RetornoECF := 'L' ;
           tpsVenda     : RetornoECF := 'V' ;
           tpsPagamento : RetornoECF := 'P' ;
           tpsRelatorio : RetornoECF := 'R' ;
         else
           RetornoECF := 'O' ;
         end;
       end;
   end;

end;

function Tdm.fecha_porta_imp_NF(marca : integer; modelo : integer; porta : string) : string;
begin
  case marca of
    1: begin
         case modelo of
           1: begin

              end;

           2: begin

              end;
         end;
       end;
    2: begin

       end;
    3: begin

       end;
    4: begin

       end;

    5: begin  // Epson
         case modelo of
           1:  begin    // Térmica TM-T88II
                  try
                    begin

//                      comport.Port:=porta;
  //                    comport.Open;
                      result:='OK';
                    end
                  except
                      result:='Erro ao abrir a porta serial. Verifique a conexão dos cabos e tente novamente';
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


function Tdm.formatacao_Epson(negrito :boolean; italico : boolean; sublinhado : boolean; tam : boolean;
          comprimido : boolean; largura : boolean; altura : boolean ) : string;
var
 formato : string;
begin


 formato:= chr(27) + chr(64);

 if (negrito=true) then
   formato:=formato+chr(13)+chr(10)+chr(27) + chr(69);

 if sublinhado=true then
//   formato:=formato+chr(27)+'-'+'1';

 if tam then
  begin
   formato:=formato+chr(13)+chr(10)  + chr(27) + chr(77) + chr(48);
   formato:= formato + chr(13)+chr(10)+ chr(29) + chr(33) + chr(16);
  end
 else
  begin
   formato:=formato+chr(13)+chr(10) + chr(27) + chr(77) + chr(48);
   formato:= formato+chr(13)+chr(10)+  chr(29) + chr(0) + chr(16);
  end;



  Result:=formato;
end;





function Tdm.formatacao_daruma(negrito :boolean; italico : boolean; sublinhado : boolean; tam : boolean;
          comprimido : boolean; largura : boolean; altura : boolean ) : string;
var
   formato : string;
begin

 if (negrito=true) then
   result:=result+'<b>';

 if italico=true then
   result:=result+'<i>';

 if sublinhado=true then
   result:=result+'<s>';

 if tam=true then
   result:=result+'<n>';

 if comprimido=true then
   result:=result+'<c>';

 if altura then
   result:=result+'<e>';



end;




function Tdm.formatacaoACBRInicial(negrito :boolean; italico : boolean; sublinhado : boolean; tam : boolean;
          comprimido : boolean; largura : boolean; altura : boolean ) : string;

var
  formato : string;
begin
 //formato:=chr(27)+'@';
 if (negrito=true) then
   formato:=formato+'<N>';

 if sublinhado=true then
   formato:=formato+'<S>';

 if tam then
 begin
   formato:=formato+'<E>';
 end;
 Result:=formato;
end;

function Tdm.formatacaoACBRFinal(negrito :boolean; italico : boolean; sublinhado : boolean; tam : boolean;
          comprimido : boolean; largura : boolean; altura : boolean ) : string;
var
 formato : string;
begin
 formato:='';

 if (negrito=true) then
   formato:=formato+'</N>';

 if sublinhado=true then
   formato:=formato+'</S>';

 if tam then
 begin
   formato:=formato+'</E>';
 end;
 Result:=formato;
end;


function Tdm.formatacaoBematech(negrito :boolean; italico : boolean; sublinhado : boolean; tam : boolean;
          comprimido : boolean; largura : boolean; altura : boolean ) : string;
var
 formato : string;
begin


//formato:=chr(27)+'@';

 if (negrito=true) then
   formato:=formato+chr(27)+'E';

 if sublinhado=true then
   formato:=formato+chr(27)+'-'+'1';

 if tam then
 begin
   formato:=formato+chr(27)+ 'W1';
 end;
 Result:=formato;
end;





function Tdm.formatacaoElginXprint(negrito :boolean; italico : boolean; sublinhado : boolean; tam : boolean;
          comprimido : boolean; largura : boolean; altura : boolean ) : string;
var
 formato : string;
begin


formato:=chr(27)+'@';

 if (negrito=true) then
   formato:=formato+chr(27)+'W';


 if tam then
 begin
   formato:=formato+chr(27)+ 'W0';
 end;
 Result:=formato;
end;





function Tdm.formatacaoElginI9(negrito :boolean; italico : boolean; sublinhado : boolean; tam : boolean;
          comprimido : boolean; largura : boolean; altura : boolean ) : string;
var
 formato : string;
begin


formato:=chr(27)+'@';


 if (negrito=true) then
   formato:=chr(27)+ chr(33)+' ' ;


 if tam then
 begin
//   formato:=formato+chr(27)+ 'W0';
 end;
 Result:=formato;
end;


function Tdm.formatacaoBematechFinal(negrito :boolean; italico : boolean; sublinhado : boolean; tam : boolean;
          comprimido : boolean; largura : boolean; altura : boolean ) : string;

var
 formato : string;
begin
formato:='';
 if (negrito=true) then
   formato:=formato+chr(27)+'F';


 if sublinhado=true then
   formato:=formato+chr(27)+'-'+'0';

 if tam then
 begin
   formato:=formato+chr(27)+'W0';
 end;
 Result:=formato;
end;






function Tdm.formatacaoDarumaNova(negrito :boolean; italico : boolean; sublinhado : boolean; tam : boolean;
          comprimido : boolean; largura : boolean; altura : boolean ) : string;
var
 formato : string;
begin
// if comprimido=true then
//   formato:=formato+chr(30);


 if (negrito=true) then
   formato:=formato+chr(27)+'E1';

 if italico=true then
   formato:=formato+chr(27)+'4';

 if sublinhado=true then
   formato:=formato+chr(27)+'-1';


 if tam then
 begin
   formato:=formato+chr(27)+ 'W1';
 end;
 Result:=formato;
end;

function Tdm.formatacaoDarumaNovaFinal(negrito :boolean; italico : boolean; sublinhado : boolean; tam : boolean;
          comprimido : boolean; largura : boolean; altura : boolean ) : string;

var
 formato : string;
begin
formato:='';
 if (negrito=true) then
   formato:=formato+chr(27)+'E0';


 if sublinhado=true then
   formato:=formato+chr(27)+'-'+'0';

// if comprimido=true then
//   formato:=formato+chr(27)+'P';

 if tam then
 begin
   formato:=formato+chr(27)+'W'+'0';
 end;

 Result:=formato;
end;








// fim nova daruma

















function Tdm.formatacao_daruma_final(negrito :boolean; italico : boolean; sublinhado : boolean; tam : boolean;
          comprimido : boolean; largura : boolean; altura : boolean ) : string;
var
 formato : string;
begin

 if negrito then
   formato:=formato+'</b>';

 if italico then
   formato:=formato+'</i>';

 if sublinhado then
   formato:=formato+'</s>';

 if tam then
   formato:=formato+'</n>';

 if comprimido then
   formato:=formato+'</c>';

 if altura then
    formato:=formato+'</e>';

 Result:=formato;

end;




function Tdm.imprime_linha_impNF(marca : integer; modelo : integer; linha : Widestring;
         negrito :boolean; italico : boolean; sublinhado : boolean; tam : boolean;
         comprimido : boolean; largura : boolean; altura : boolean ) : string;
var
 formato : integer;
 dummy : integer;

 tipoletraBmt, italicoBmt, sublinhadoBmt, expBmt, negritoBmt : integer;
begin
    case marca of
    1: begin
         if comprimido = true then tipoletraBmt:=1 else tipoletraBmt:=3;
         if italico = true then italicoBmt:=1 else italicoBmt:=0;
         if sublinhado = true then sublinhadoBmt:=1 else sublinhadoBmt:=0;
         if largura = true then expBmt:=1 else expBmt:=0;
         if negrito = true then negritoBmt:=1 else negritoBmt:=0;

         case modelo of
          1: begin

           //    FormataTX(linha+Chr(13)+Chr(10),tipoletraBmt,italicoBmt,sublinhadoBmt,expBmt,negritoBmt);
               result:='OK';
             end;
          2: begin
             //  FormataTX(linha+Chr(13)+Chr(10),tipoletraBmt,italicoBmt,sublinhadoBmt,expBmt,negritoBmt);
               result:='OK';
             end;

         end;


       end;

    2: begin
         case modelo of
           1: begin
               linha:=formatacao_daruma(negrito,italico,sublinhado,tam,comprimido,largura,altura)+linha;
               linha:=linha+formatacao_daruma_final(negrito,italico,sublinhado,tam,comprimido,largura,altura);
//               Daruma_DUAL_ImprimirTexto(linha,0);

             end;

           2: begin
               linha:=formatacao_daruma(negrito,italico,sublinhado,tam,comprimido,largura,altura)+linha;
               linha:=linha+formatacao_daruma_final(negrito,italico,sublinhado,tam,comprimido,largura,altura);
//               Daruma_DUAL_ImprimirTexto(linha,0);

             end;

         end;

       end;
    3: begin


       end;
    4: begin
         case modelo of
           1: begin
//                formato:=formatacao_epson(negrito,italico,sublinhado,tam,comprimido,largura,altura);
                linha:=trocaCaracteresEpson(linha);
                linha:=chr(27)+'!'+Chr(formato)+linha+chr(13)+chr(10);
//                comport.writestr(linha);

              end;
         end;

       end;

    5: begin  // Epson

//         formato:=formatacao_epson(negrito,italico,sublinhado,tam,comprimido,largura,altura);
         linha:=trocaCaracteresEpson(linha);
         linha:=chr(27)+'!'+Chr(formato)+linha+chr(13)+chr(10);


         case modelo of
           1:  begin    // Térmica TM-T88II
//                  Result:=analisa_retorno_fiscal(marca,modelo,IntToStr(controladorEpson.DirectIO(PTR_DI_OUTPUT_NORMAL,dummy,linha)));
//                comport.writestr(linha);
               end;

         end;

       end;
  end;
end;


procedure tdm.apagaNotaCarregadaACBRdaTabelaDeErros();
var
  ts: TIBTransaction;
  qryApagaNotas : TIBQuery;
  modelo : SmallInt;
begin
  ts      :=   TIBTransaction.Create(self);
  ts.DefaultDatabase   :=  dm.dbrestaurante;
  ts.Active := false;
  ts.Active := true;


  qryApagaNotas := TIBQuery.Create(Self);
  qryApagaNotas.Database :=dbrestaurante;
  qryApagaNotas.Transaction := ts;
  qryApagaNotas.Active := false;


  try
    qryApagaNotas.SQL.Clear;
    {
    qryApagaNotas.SQL.Add('delete from nfce_emitidas nf where nf.modelo='+Inttostr(modelo));
    qryApagaNotas.SQL.Add(' and nf.serie='+Inttostr(dm.ACBrNFe1.NotasFiscais[0].NFe.Ide.serie));
    qryApagaNotas.SQL.add(' and nf.numero='+Inttostr(dm.ACBrNFe1.NotasFiscais[0].NFe.Ide.nNF));
     }
    qryApagaNotas.SQL.Add('delete from nfce_emitidas nf where chave='+Quotedstr(copy(dm.ACBrNFe1.NotasFiscais[0].NFe.infNFe.ID,4,60)));
    qryApagaNotas.ExecSQL;
    dm.adicionaLog(qryApagaNotas.SQL.Text);
    adicionaLog('apagou  a nota '+copy(dm.ACBrNFe1.NotasFiscais[0].NFe.infNFe.ID,4,60) +' da tabela de erros');
    ts.Commit;

  finally
    ts.Active := false;
    FreeAndNil(ts);
    qryApagaNotas.Active := false;
    FreeAndNil(qryApagaNotas);


  end;




end;


procedure Tdm.atualizaStatusCancelamentoNFE();
var
 codigo_venda : string;
 modelo : SmallInt;
 qryApagaNotas : TIBQuery;

begin
 if dm.ACBrNFe1.NotasFiscais[0].NFe.Ide.modelo =65 then
   modelo := 2
 else
   modelo := 3;


 transLog.Active := true;

 try

   try
      codigo_venda:= dm.geraCodigo('G_VENDAS',8);
      transLog.Active := true;
      qryVendasCanceladas.Active := true;
      qryVendasCanceladas.Append;
      qryVendasCanceladasCOD_VENDA .Value             := codigo_venda;
      qryVendasCanceladasCOD_EMPRESA.value            := codEmpresa;
      qryVendasCanceladasDATA.Value                   := dm.ACBrNFe1.NotasFiscais[0].NFe.Ide.dEmi;
      qryVendasCanceladasDATA_SO.Value                := dm.ACBrNFe1.NotasFiscais[0].NFe.Ide.dEmi;
      qryVendasCanceladasDATA_HORA_CANCELAMENTO.Value := Now;
      qryVendasCanceladasMODELO_COMPROVANTE.Value     := modelo;
      qryVendasCanceladasSERIE_NFCE.Value             := dm.ACBrNFe1.NotasFiscais[0].NFe.Ide.serie;
      qryVendasCanceladasNUMERO_NFCE.Value            := dm.ACBrNFe1.NotasFiscais[0].NFe.Ide.nNF;
      qryVendasCanceladasCHAVE_NFCE.Value             := copy(dm.ACBrNFe1.NotasFiscais[0].NFe.infNFe.ID,4,60);
      qryVendasCanceladasXML_DOC.Value                := dm.ACBrNFe1.NotasFiscais[0].XML;
      qryVendasCanceladasVALOR_TOTAL.Value            := dm.ACBrNFe1.NotasFiscais[0].NFe.Total.ICMSTot.vNF;
      qryVendasCanceladas.Post;
      adicionaLog('Inseriu a nota '+copy(dm.ACBrNFe1.NotasFiscais[0].NFe.infNFe.ID,4,60) +' nas vendas canceladas');
      dm.transLog.Commit;
      apagaNotaCarregadaACBRdaTabelaDeErros();
    except
       on E : Exception  do
        begin
            dm.transLog.Rollback;
            dm.adicionaLog('Ocorreu erro ao incluir a nota nas vendas canceladas '+E.Message);
        end;

   end;

 finally

   qryApagaNotas.Active := false;
   FreeAndNil(qryApagaNotas);
 end;
end;

function Tdm.cancelaNFECarregadaACBR(justificativa : string) : boolean;
var
 statusNota : tEstadoNFE;
begin

    Result := false;
    try
      ACBrNFe1.Cancelamento(justificativa,0);
      statusNota := tIndefinido;

      ACBrNFe1.Consultar;

      adicionaLog('O método de consultar retornou '+Inttostr(dm.ACBrNFe1.WebServices.Consulta.cStat));

      case dm.ACBrNFe1.WebServices.Consulta.cStat of
        100:  statusNota := tAutorizada;
        150:  statusNota := tAutorizada;
        217:  statusNota := tNaoExisteSefaz;
        218:  statusNota := tCancelada;
        101:  statusNota := tCancelada;

        else
         begin
           statusNota := tIndefinido;
         end;
      end;

      case statusNota  of
        tIndefinido: ;
        tNaoExisteSefaz :
           begin
              apagaNotaCarregadaACBRdaTabelaDeErros();
               dm.adicionaLog('Nota não foi encontrada na sefaz');
               Result := false;
               exit;
           end;

        tCancelada:
           begin
            atualizaStatusCancelamentoNFE();
            dm.adicionaLog('Nota não foi encontrada na sefaz');
            result := true;
            exit
           end;



        tAutorizada:
           begin
                dm.adicionaLog('Nota tentou ser cancelada, mas não foi possível!');
                result := false;
                exit
           end;
      end;


      Result := true;


    except
    on E : Exception  do
     begin
       dm.adicionaLog('Erro ao cancelar a nota com chave '+copy(dm.ACBrNFe1.NotasFiscais[0].NFe.infNFe.ID,4,60)+ sLineBreak
          +'Serie: '+Inttostr(dm.ACBrNFe1.NotasFiscais[0].NFe.Ide.serie)+sLineBreak
          +'Número: '+IntToStr(dm.ACBrNFe1.NotasFiscais[0].NFe.Ide.nNF)+sLineBreak
          +'XML: '+sLineBreak+dm.ACBrNFe1.NotasFiscais[0].XML);
          dm.adicionaLog('Mensagem do erro: '+E.Message);
         Result := false;
     end;

    end;
end;


procedure Tdm.atualizaDescontosDaVenda(codVenda : string);
var
 q : TIBQuery;
begin
  q := TIBquery.create(self);
  q.Database := dm.dbrestaurante;
  q.Transaction := dm.transacao;


 try

   q.Active := false;
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
   q.sql.Add('             where  v.cod_venda='+Quotedstr(codVenda));
   q.ExecSQL;


   q.Active := false;
   q.SQL.Clear;
   q.SQL.Add('            update vendas v set v.desconto_taxas =  (udf_roundabnt(v.percentual_desconto,8) * (v.valor_txserv + v.valor_tx_entrega ) ) ');
   q.sql.Add('             where  v.cod_venda='+Quotedstr(codVenda));
   q.ExecSQL;

   q.Active := false;
   q.SQL.Clear;
   q.sql.Add('update movimento_venda mv set mv.desconto =  ');
   q.sql.Add('         (');
   q.sql.Add('         (select v.percentual_desconto   from vendas v where v.cod_venda = mv.cod_venda)');
   q.sql.Add('          * (mv.valor_unitario * mv.quantidade)) ');
   q.sql.Add('             where  mv.cod_venda='+Quotedstr(codVenda));
   q.ExecSQL;
 finally
  q.active := false;
  FreeAndNil(q);

 end;


end;



function Tdm.cancelaNFECarregadaPorSubstituicao(justificativa : string; chaveNotaSubstituta: string) : boolean;
var
 statusNota : tEstadoNFE;
 lmsg: string;
begin

    Result := false;
    try
     ACBrNFe1.Consultar;

      ACBrNFe1.EventoNFe.Evento.Clear;
      with ACBrNFe1.EventoNFe.Evento.Add do
       begin
         infEvento.chNFe :=  copy(dm.ACBrNFe1.NotasFiscais[0].NFe.infNFe.ID,4,60);
         infEvento.CNPJ   := cnpj;
         infEvento.dhEvento := now;
         infEvento.tpEvento := teCancSubst;
         infEvento.detEvento.xJust := Justificativa;
         infEvento.detEvento.nProt := dm.ACBrNFe1.NotasFiscais[0].NFe.procNFe.nProt;
         infEvento.detEvento.cOrgaoAutor := dm.ACBrNFe1.NotasFiscais[0].NFe.Ide.cUF ;
         infEvento.detEvento.verAplic := '1.0';
         infEvento.detEvento.chNFeRef := chaveNotaSubstituta;
       end;


       ACBrNFe1.EnviarEvento(dm.ACBrNFe1.NotasFiscais[0].NFe.Ide.nNF);

       dm.adicionaLog('XML DO EVENTO DE CANCELAMENTO POR SUBSTITUICAO');
       dm.adicionaLog(dm.AcbrNFe1.WebServices.EnvEvento.EventoRetorno.retEvento.Items[0].RetInfEvento.XML);
        with dm.ACBrNFe1.WebServices.EnvEvento.EventoRetorno.retEvento.Items[0].RetInfEvento do
        begin
          lMsg:=
          'Id: '+Id+#13+
          'tpAmb: '+TpAmbToStr(tpAmb)+#13+
          'verAplic: '+verAplic+#13+
          'cOrgao: '+IntToStr(cOrgao)+#13+
          'cStat: '+IntToStr(cStat)+#13+
          'xMotivo: '+xMotivo+#13+
          'chNFe: '+chNFe+#13+
          'tpEvento: '+TpEventoToStr(tpEvento)+#13+
          'xEvento: '+xEvento+#13+
          'nSeqEvento: '+IntToStr(nSeqEvento)+#13+
          'CNPJDest: '+CNPJDest+#13+
          'emailDest: '+emailDest+#13+
          'dhRegEvento: '+DateTimeToStr(dhRegEvento)+#13+
          'nProt: '+nProt;
        end;

      dm.adicionaLog('Log do retorno do evento de cancelamento por substituição');
      dm.adicionaLog(lmsg);


      if dm.ACBrNFe1.WebServices.Consulta.cStat = 135 then
       gravarEventoNFE(copy(dm.ACBrNFe1.NotasFiscais[0].NFe.infNFe.ID,4,60),dm.AcbrNFe1.WebServices.EnvEvento.EventoRetorno.retEvento.Items[0].RetInfEvento.XML,now);

      statusNota := tIndefinido;
      ACBrNFe1.Consultar;
      adicionaLog('O método de consultar retornou '+Inttostr(dm.ACBrNFe1.WebServices.Consulta.cStat));
      case dm.ACBrNFe1.WebServices.Consulta.cStat of
        100:  statusNota := tAutorizada;
        150:  statusNota := tAutorizada;
        217:  statusNota := tNaoExisteSefaz;
        218:  statusNota := tCancelada;
        101:  statusNota := tCancelada;

        else
         begin
           statusNota := tIndefinido;
         end;
      end;

      case statusNota  of
        tIndefinido: ;
        tNaoExisteSefaz :
           begin
              apagaNotaCarregadaACBRdaTabelaDeErros();
               dm.adicionaLog('Nota não foi encontrada na sefaz');
               Result := false;
               exit;
           end;

        tCancelada:
           begin
            atualizaStatusCancelamentoNFE();
            dm.adicionaLog('Nota não foi encontrada na sefaz');
            result := true;
            exit
           end;



        tAutorizada:
           begin
                dm.adicionaLog('Nota tentou ser cancelada, mas não foi possível!');
                result := false;
                exit
           end;
      end;


      Result := true;


    except
    on E : Exception  do
     begin
       dm.adicionaLog('Erro ao cancelar a nota com chave '+copy(dm.ACBrNFe1.NotasFiscais[0].NFe.infNFe.ID,4,60)+ sLineBreak
          +'Serie: '+Inttostr(dm.ACBrNFe1.NotasFiscais[0].NFe.Ide.serie)+sLineBreak
          +'Número: '+IntToStr(dm.ACBrNFe1.NotasFiscais[0].NFe.Ide.nNF)+sLineBreak
          +'XML: '+sLineBreak+dm.ACBrNFe1.NotasFiscais[0].XML);
          dm.adicionaLog('Mensagem do erro: '+E.Message);
         Result := false;
     end;

    end;
end;


function Tdm.verificaExistenciaNotasPendentesCancelamento() : boolean;
var
 qryNotasErrro : TIBQuery;
 ts: TIBTransaction;

begin
   dm.adicionaLog('Tenta fazer cancelamento de notas pendentes mais recentes');
   ts      :=   TIBTransaction.Create(self);
   ts.DefaultDatabase   :=  dm.dbrestaurante;
   ts.Active := false;
   ts.Active := true;


   qryNotasErrro := TIBQuery.Create(Self);
   qryNotasErrro.Database :=dbrestaurante;
   qryNotasErrro.Transaction := ts;

   try
     qryNotasErrro.Active := false;
     qryNotasErrro.SQL.Clear;
     qryNotasErrro.SQL.Add('select * from nfce_emitidas order by codigo');
     qryNotasErrro.Active := true;
     qryNotasErrro.FetchAll;

     if qryNotasErrro.IsEmpty then
        Result := false
     else
       Result := true;

   finally

     qryNotasErrro.Active := false;
      FreeAndNil(qryNotasErrro);
      ts.Rollback;
      ts.Active := false;
      FreeAndNil(ts);
   end;



end;

procedure Tdm.CancelaNotasPendentes();
var
 qryNotasErrro : TIBQuery;
 ts: TIBTransaction;
 statusNota : tEstadoNFE;
begin


 if (dm.VerificaConexaoInternet() = true) then
  begin
     ts      :=   TIBTransaction.Create(self);
     ts.DefaultDatabase   :=  dm.dbrestaurante;
     ts.Active := false;
     ts.Active := true;



     qryNotasErrro := TIBQuery.Create(Self);
     qryNotasErrro.Database :=dbrestaurante;
     qryNotasErrro.Transaction := ts;

     try
       begin




         qryNotasErrro.Active := false;
         qryNotasErrro.SQL.Clear;
         qryNotasErrro.SQL.Add('  delete from nfce_emitidas nf where exists');
         qryNotasErrro.SQL.Add('     (select v.chave_nfce from vendas v where v.chave_nfce = nf.chave)');
         qryNotasErrro.ExecSQL;
         ts.Commit;



         qryNotasErrro.Active := false;
         qryNotasErrro.SQL.Clear;
         qryNotasErrro.SQL.Add('select * from nfce_emitidas nf ');
         qryNotasErrro.SQL.Add('select * from nfce_emitidas nf where udf_minutesbetween (current_timestamp,nf.data) between 3 and 30 and modelo=2 ');
         qryNotasErrro.SQL.Add(' union all ');
         qryNotasErrro.SQL.Add(' select * from nfce_emitidas nf where udf_minutesbetween (current_timestamp,nf.data) > 3 and modelo = 3');
         qryNotasErrro.Active := true;
         qryNotasErrro.FetchAll;

         if ( qryNotasErrro.IsEmpty = false  ) then
          begin
            dm.adicionaLog('Encontrou '+Inttostr(qryNotasErrro.RecordCount)+' notas pendentes de verificação de cancelamento');
            qryNotasErrro.First;

            while not qryNotasErrro.Eof  do
              begin
              case  qryNotasErrro.FieldByName('modelo').Value of
                 2: dm.parametrizaAcbrNFE(moNFCe,false,true);
                 3: dm.parametrizaAcbrNFE(moNFe,false,true);
              end;


               dm.ACBrNFe1.NotasFiscais.Clear;
               dm.ACBrNFe1.NotasFiscais.LoadFromString(qryNotasErrro.FieldByName('xml_nota').Value,false);

               dm.adicionaLog('Verifica a nota para efetuar cancelamento '+copy(dm.ACBrNFe1.NotasFiscais[0].NFe.infNFe.ID,4,60)+ sLineBreak
                  +'Serie: '+Inttostr(dm.ACBrNFe1.NotasFiscais[0].NFe.Ide.serie)+sLineBreak
                  +'Número: '+IntToStr(dm.ACBrNFe1.NotasFiscais[0].NFe.Ide.nNF)+sLineBreak
                  +'XML: '+sLineBreak+dm.ACBrNFe1.NotasFiscais[0].XML);




               statusNota :=tIndefinido;

               try
                  begin
                    ACBrNFe1.Consultar;

                    adicionaLog('O método de consultar retornou '+Inttostr(dm.ACBrNFe1.WebServices.Consulta.cStat));

                    case dm.ACBrNFe1.WebServices.Consulta.cStat of
                      100:  statusNota := tAutorizada;
                      150:  statusNota := tAutorizada;
                      217:  statusNota := tNaoExisteSefaz;
                      218:  statusNota := tCancelada;
                      101:  statusNota := tCancelada;

                      else
                       begin
                         statusNota := tIndefinido;
                       end;
                    end;

                    case statusNota  of
                      tIndefinido: ;
                      tNaoExisteSefaz : apagaNotaCarregadaACBRdaTabelaDeErros();
                      tCancelada:       atualizaStatusCancelamentoNFE();
                      tAutorizada:      cancelaNFECarregadaACBR('Cancelada por problemas técnicos no momento da emissão');
                    end;


                  end;


                except
                    on E : Exception  do
                 begin
                     dm.adicionaLog('Erro ao consultar o status da nota '+qryNotasErrro.FieldByName('xml_nota').Value+'  na sefaz');
                     dm.adicionaLog('Erro: '+E.Message);
                  end
                end;
               qryNotasErrro.Next;
              end;

          end
         else
          begin
              dm.adicionaLog('Nenhuma nota  pendente de verificação de cancelamento');
          end;
       end;
     finally
        begin
          qryNotasErrro.Active := false;
          FreeAndNil(qryNotasErrro);
          ts.Rollback;
          ts.Active := false;
          FreeAndNil(ts);
        end;
     end;
  end;

end;






procedure Tdm.CancelaNotasPendentesPorSubstituicao();
var
 qryNotasErrro : TIBQuery;
 ts: TIBTransaction;
 statusNota : tEstadoNFE;
begin
  dm.adicionaLog('Tenta fazer cancelamento de notas pendentes por substituição');

 if (dm.VerificaConexaoInternet() = true) then
  begin
     ts      :=   TIBTransaction.Create(self);
     ts.DefaultDatabase   :=  dm.dbrestaurante;
     ts.Active := false;
     ts.Active := true;



     qryNotasErrro := TIBQuery.Create(Self);
     qryNotasErrro.Database :=dbrestaurante;
     qryNotasErrro.Transaction := ts;

     try
       begin




         qryNotasErrro.Active := false;
         qryNotasErrro.SQL.Clear;
         qryNotasErrro.SQL.Add('  delete from nfce_emitidas nf where exists');
         qryNotasErrro.SQL.Add('     (select v.chave_nfce from vendas v where v.chave_nfce = nf.chave)');
         qryNotasErrro.ExecSQL;
         ts.Commit;



         qryNotasErrro.Active := false;
         qryNotasErrro.SQL.Clear;
         qryNotasErrro.SQL.Add('select nf.*, v.protocolo_nfce as protocolo_chave_substituta ');
         qryNotasErrro.SQL.Add('       from nfce_emitidas nf  ');
         qryNotasErrro.SQL.Add('       inner join vendas v on (v.chave_nfce = nf.chave_nota_substituta)  ');
         qryNotasErrro.SQL.Add('          where udf_minutesbetween (current_timestamp,nf.data) > 30  ');
         qryNotasErrro.SQL.Add('           and v.protocolo_nfce <> '+Quotedstr('CONTINGENCIA')+'  order by codigo  ');
         dm.adicionaLog(qryNotasErrro.SQL.Text);

         qryNotasErrro.Active := true;
         qryNotasErrro.FetchAll;

         if ( qryNotasErrro.IsEmpty = false  ) then
          begin
            dm.adicionaLog('Encontrou '+Inttostr(qryNotasErrro.RecordCount)+' notas pendentes de verificação de cancelamento por substituição');
            qryNotasErrro.First;

            while not qryNotasErrro.Eof  do
              begin
               dm.parametrizaAcbrNFE(moNFCe,false,true);
               dm.ACBrNFe1.NotasFiscais.Clear;
               dm.ACBrNFe1.NotasFiscais.LoadFromString(qryNotasErrro.FieldByName('xml_nota').Value,false);

               dm.adicionaLog('Verifica a nota para efetuar cancelamento por substituição '+copy(dm.ACBrNFe1.NotasFiscais[0].NFe.infNFe.ID,4,60)+ sLineBreak
                  +'Serie: '+Inttostr(dm.ACBrNFe1.NotasFiscais[0].NFe.Ide.serie)+sLineBreak
                  +'Número: '+IntToStr(dm.ACBrNFe1.NotasFiscais[0].NFe.Ide.nNF)+sLineBreak
                  +'XML: '+sLineBreak+dm.ACBrNFe1.NotasFiscais[0].XML);




               statusNota :=tIndefinido;

               try
                  begin
                    ACBrNFe1.Consultar;

                    adicionaLog('O método de consultar retornou '+Inttostr(dm.ACBrNFe1.WebServices.Consulta.cStat));

                    case dm.ACBrNFe1.WebServices.Consulta.cStat of
                      100:  statusNota := tAutorizada;
                      150:  statusNota := tAutorizada;
                      217:  statusNota := tNaoExisteSefaz;
                      218:  statusNota := tCancelada;
                      101:  statusNota := tCancelada;

                      else
                       begin
                         statusNota := tIndefinido;
                       end;
                    end;

                    case statusNota  of
                      tIndefinido: ;
                      tNaoExisteSefaz : apagaNotaCarregadaACBRdaTabelaDeErros();
                      tCancelada:       atualizaStatusCancelamentoNFE();
                      tAutorizada:      cancelaNFECarregadaPorSubstituicao('Cancelada por problemas técnicos no momento da emissão',qryNotasErrro.FieldByName('chave_nota_substituta').Value);
                    end;
                  end;


                except
                    on E : Exception  do
                 begin
                     dm.adicionaLog('Erro ao consultar o status da nota '+qryNotasErrro.FieldByName('xml_nota').Value+'  na sefaz');
                     dm.adicionaLog('Erro: '+E.Message);
                  end
                end;
               qryNotasErrro.Next;
              end;

          end
         else
          begin
              dm.adicionaLog('Nenhuma nota  pendente de verificação de cancelamento por substituição');
          end;
       end;
     finally
        begin
          qryNotasErrro.Active := false;
          FreeAndNil(qryNotasErrro);
          ts.Rollback;
          ts.Active := false;
          FreeAndNil(ts);
        end;
     end;
  end;

end;



function Tdm.enviaNFCEContingencia() : boolean;
var
 qtdEmitidas : integer;
begin

  qtdEmitidas := StrToInt(dm.LeIni(2,'NFCE','qtdeEmitidasContingencia'));
  Result := false;

  dm.gravaini('NFCE','formaEmissao','2');
  dm.gravaini('NFCE','dataHoraContingencia',DateToStr(date));
  dm.gravaini('NFCE','formaEmissao','2');
  setFormaEmissaoNFCE(2);
  ACBrNFe1.NotasFiscais[0].NFe.Ide.dhCont := StrToDate ( dm.LeIni(2,'NFCE','dataHoraContingencia') );
  ACBrNFe1.NotasFiscais[0].NFe.Ide.xJust  := dm.LeIni(2,'NFCE','justificativaContingenciaOFFLINE');



  ACBrNFe1.NotasFiscais[0].NFe.Ide.serie := getSerieNFCEEmContingencia();
  ACBrNFe1.NotasFiscais[0].NFe.Ide.nNF  := 1;




  adicionaLog('Pegou o número '+Inttostr( ACBrNFe1.NotasFiscais[0].NFe.Ide.nNF));


  try
    dm.ACBrNFe1.NotasFiscais.GerarNFe();
  except
       on E : Exception  do
        begin
           adicionaLog('Erro ao gerar nota em contingência. '+e.Message);
           raise Exception.Create('Erro ao gerar nota em contingência. '+e.Message);
           exit;
        end;
  end;


  try
    dm.ACBrNFe1.NotasFiscais[0].Assinar;
  except
       on E : Exception  do
        begin
           adicionaLog('Erro ao assinar nota em contingência. '+e.Message);
           raise Exception.Create('Erro ao assinar nota em contingência. '+e.Message);
           exit;
        end;
  end;


  try
    dm.ACBrNFe1.NotasFiscais[0].Validar;
  except
       on E : Exception  do
        begin
           adicionaLog('Erro ao validar nota em contingência. '+e.Message);
           raise Exception.Create('Erro ao validar nota em contingência. '+e.Message);
           exit;
        end;
  end;




  ACBrNFe1.NotasFiscais[0].NFe.Ide.serie := getSerieNFCEEmContingencia();
  ACBrNFe1.NotasFiscais[0].NFe.Ide.nNF  := getNumeroNFCEEmContingencia();
  dm.ACBrNFe1.NotasFiscais.GerarNFe();
  dm.ACBrNFe1.NotasFiscais[0].Assinar;
  dm.ACBrNFe1.NotasFiscais[0].Validar;


  qtdEmitidas := qtdEmitidas +1;
  dm.gravaini('NFCE','qtdeEmitidasContingencia',Inttostr(qtdEmitidas));
  dm.ACBrNFe1.NotasFiscais[0].NFe.procNFe.nProt:='CONTINGENCIA';

  dm.adicionaLog('XML da NFC-e de número: '+Inttostr( ACBrNFe1.NotasFiscais[0].NFe.Ide.nNF));
  dm.adicionaLog(dm.ACBrNFe1.NotasFiscais[0].XML);

  result := true;




end;


function Tdm.gerarEAssinarNFCE() : boolean;
 var
  nomeArquivoTemporario : string;
  localArquivoTemporario : string;

begin

  try
    dm.ACBrNFe1.NotasFiscais.GerarNFe;
  except
    on E : Exception  do
     begin
      frm_encerramento.SetMensagemPainelInformacoes('Erro ao gerar a nota.',
                          ' Verifique o arquivo de log para mais detalhes.'
                            ,10,4,true);


       adicionaLog('Deu erro na geração da nota de chave ');
       Result := false;
       exit;
     end;
  end;



  adicionaLog('Gerou a nota com a chave '+copy(dm.ACBrNFe1.NotasFiscais[0].NFe.infNFe.ID,4,60));
  dm.gravaini('NFCE','formaEmissao','1');
    adicionaLog('Tenta assinar a nota '+copy(dm.ACBrNFe1.NotasFiscais[0].NFe.infNFe.ID,4,60));
  //Tenta assinar a nota

  try
   begin
      dm.ACBrNFe1.NotasFiscais[0].Assinar;
     adicionaLog('Assinou  a nota '+copy(dm.ACBrNFe1.NotasFiscais[0].NFe.infNFe.ID,4,60));
    end;
  except
       on E : Exception  do
     begin
      frm_encerramento.SetMensagemPainelInformacoes('Erro ao assinar a nota.',
                          ' Verique se o certificado digital está instalado e se é válido.'
                            ,10,4,true);


       adicionaLog('Erro na assinatura  da nota com a chave '+copy(dm.ACBrNFe1.NotasFiscais[0].NFe.infNFe.ID,4,60)+'   '+E.Message);

       Result := false;
       exit;
     end;
   end;

  adicionaLog('Tenta validar a nota '+copy(dm.ACBrNFe1.NotasFiscais[0].NFe.infNFe.ID,4,60));

  // Tenta validar a nota
  try
   begin

      dm.ACBrNFe1.NotasFiscais[0].Validar;
      adicionaLog('Validou a nota com a  chave '+copy(dm.ACBrNFe1.NotasFiscais[0].NFe.infNFe.ID,4,60));
   end;

  except
       on E : Exception  do
     begin

      frm_encerramento.SetMensagemPainelInformacoes('Erro ao validar os dados da nota.',
                          ' Verifique os NCM dos produtos que compõem o documento fiscal.'
                            ,10,4,true);

       adicionaLog('Erro na validação da nota com a chave '+copy(dm.ACBrNFe1.NotasFiscais[0].NFe.infNFe.ID,4,60)+'   '+E.Message);
       Result := false;
       exit;
     end;
   end;


  ACBrNFe1.NotasFiscais[0].NFe.Ide.serie := getSerieNFCE ();
  ACBrNFe1.NotasFiscais[0].NFe.Ide.nNF  := getNumeroNFCE ();
  dm.ACBrNFe1.NotasFiscais.GerarNFe;
  dm.ACBrNFe1.NotasFiscais[0].Assinar;
  dm.ACBrNFe1.NotasFiscais[0].Validar;

  result := true;
end;







procedure Tdm.setFormaEmissaoNFCE(forma : integer );
begin

 with dm.ACBrNFe1.NotasFiscais[0].NFe do
  begin
   case forma  of
    1: begin
         dm.ACBrNFe1.Configuracoes.Geral.FormaEmissao := teNormal;
         Ide.tpEmis     := teNormal;
       end;
    2: begin
         dm.ACBrNFe1.Configuracoes.Geral.FormaEmissao := teOffLine;
         Ide.tpEmis     := teOffLine;

       end;

    3: begin
         dm.ACBrNFe1.Configuracoes.Geral.FormaEmissao := teSVCAN;
         Ide.tpEmis    := teSVCAN;
       end;

    4: begin
         dm.ACBrNFe1.Configuracoes.Geral.FormaEmissao := teSVCRS;
         Ide.tpEmis    := teSVCRS;
       end;

    5: begin
         dm.ACBrNFe1.Configuracoes.Geral.FormaEmissao := teSVCSP;
         Ide.tpEmis    := teSVCSP;
       end;

    6: begin
         dm.ACBrNFe1.Configuracoes.Geral.FormaEmissao := teSCAN;
         Ide.tpEmis    := teSCAN;
       end;


   end;
  end;
end;


procedure Tdm.imprimeTextoACBR(texto : Tstringlist);
begin

 try
   dm.adicionaLog('Entrou na função de impressão via dll');
   dm.adicionaLog('Comandou a impressão do texto para a porta: '+ACBrPosPrinter1.Porta);
   try
    begin
     ACBrPosPrinter1.LinhasBuffer := 0;
     ACBrPosPrinter1.LinhasEntreCupons :=0;
     ACBrPosPrinter1.EspacoEntreLinhas := 0;
     ACBrPosPrinter1.ColunasFonteNormal := 48;
     ACBrPosPrinter1.CortaPapel := true;
     ACBrPosPrinter1.ControlePorta := false;
     ACBrPosPrinter1.TraduzirTags := true;
     ACBrPosPrinter1.IgnorarTags := false;
     ACBrPosPrinter1.PaginaDeCodigo := TACBrPosPaginaCodigo(2);
     aCBrPosPrinter1.Ativar;


      dm.adicionaLog('Comandou a impressão do texto para a porta: '+ACBrPosPrinter1.Porta);
      ACBrPosPrinter1.Imprimir(texto.Text);
//      if (StrToInt(dm.LeIni(2,'IMPRESSORA_NAO_FISCAL_01','cortaPapel')) = 1) then
  //      ACBrPosPrinter1.CortarPapel(true);
    end;
   except
    begin
      aCBrPosPrinter1.desativar;
      adicionaLog('Erro ao imprimir');
    end;
   end;

 finally
   aCBrPosPrinter1.desativar;
 end;

end;



procedure Tdm.configuraImpressoraNFCE();
begin
 if (dm.ACBrPosPrinter1 <> nil )  then
    begin
      dm.ACBrPosPrinter1.Desativar;
      FreeAndNil(dm.ACBrPosPrinter1);
    end;

 dm.ACBrPosPrinter1 := TACBrPosPrinter.Create(self);

 ACBrNFeDANFeESCPOS1.PosPrinter := dm.ACBrPosPrinter1;
 ACBrPosPrinter1.Desativar;
 if (StrToInt(dm.LeIni(2,'IMPRESSORA_NFCE','via_dll')) = 1) then
  begin

   case (StrToInt(dm.LeIni(2,'IMPRESSORA_NFCE','marca'))) of
    1:   ACBrPosPrinter1.Modelo        := ppEscBematech;
    2:   ACBrPosPrinter1.Modelo := ppEscEpsonP2;
    3:   ACBrPosPrinter1.Modelo := ppEscPosEpson;
    4:   ACBrPosPrinter1.Modelo := ppEscDaruma;
    5:   ACBrPosPrinter1.Modelo := ppEscDiebold;
    6:   ACBrPosPrinter1.Modelo := ppEscVox;
    7:  ACBrPosPrinter1.Modelo := ppTexto;
   end;

   ACBrPosPrinter1.Device.Porta  := dm.LeIni(2,'IMPRESSORA_NFCE','porta');
   ACBrPosPrinter1.Device.Baud   := StrToInt(dm.LeIni(2,'IMPRESSORA_NFCE','velocidade'));

      case StrToInt(dm.LeIni(2,'IMPRESSORA_NFCE','paridade')) of
       0:  ACBrPosPrinter1.Device.Parity := pNone;
       1:  ACBrPosPrinter1.Device.Parity := pEven;
       2:  ACBrPosPrinter1.Device.Parity := pMark;
       3:  ACBrPosPrinter1.Device.Parity := pOdd;
       4:  ACBrPosPrinter1.Device.Parity := pSpace;
      end;


      case StrToInt(dm.LeIni(2,'IMPRESSORA_NFCE','stopBits')) of
       1: ACBrPosPrinter1.Device.Stop := s1;
       2: ACBrPosPrinter1.Device.Stop := s1eMeio;
       3: ACBrPosPrinter1.Device.Stop := s2;
      end;

      case StrToInt(dm.LeIni(2,'IMPRESSORA_NFCE','fluxo')) of
       0: ACBrPosPrinter1.Device.HandShake := hsNenhum;
       1: ACBrPosPrinter1.Device.HandShake := hsXON_XOFF;
       2: ACBrPosPrinter1.Device.HandShake := hsRTS_CTS;
       3: ACBrPosPrinter1.Device.HandShake := hsDTR_DSR;
      end;

   dm.ACBrPosPrinter1.LinhasEntreCupons := StrToInt(dm.LeIni(1,'IMPRESSORA_NFCE','linhasEntreCupons'));
   ACBrPosPrinter1.IgnorarTags   := false;
   ACBrPosPrinter1.Desativar;
   ACBrPosPrinter1.Ativar;
  end
end;




function  Tdm.setFormaEmissaOnlineNFE   () : boolean;
var
 ct : integer;
 chave : string;
 serie : integer;
 numeroNF : integer;
 nomeArquivoTemporario : string;
 nomeArquivoDefinitivo : string;

 localArquivoTemporario : string;
 localArquivoDefinitivo : string;
 tentativasConsulta, tentativaAtual : smallint;
 notaFoiEnviada : boolean;

 msgErroEnvio : string;
 msgTempoLimite2 : string;




begin
  dm.tb_parametros.Active := true;
  notaFoiEnviada := false;
  result := false;

  msgTempoLimite2:= 'Erro Interno: 12002'+
                    'Erro HTTP: 4'+
                    'Erro: Requisição não enviada.'+
                    '12002 - O tempo limite da operação foi atingido';


  adicionaLog('Inicia a emissão da NFE online');
//  ACBrNFe1.NotasFiscais[0].NFe.Ide.cNF := 44;
  ACBrNFe1.NotasFiscais[0].NFe.Ide.serie := dm.tb_parametrosSERIE_NFE.Value;
   ACBrNFe1.NotasFiscais[0].NFe.Ide.nNF  := getNumeroNFE();
  adicionaLog('Pegou o número '+Inttostr( ACBrNFe1.NotasFiscais[0].NFe.Ide.nNF));


  try
    dm.ACBrNFe1.NotasFiscais.GerarNFe;
  except
    on E : Exception  do
     begin
       adicionaLog('Deu erro na geração da nota de chave ');

       dm.ACBrNFe1.NotasFiscais[0].GravarXML(copy(dm.ACBrNFe1.NotasFiscais[0].NFe.infNFe.ID,4,60)+'_ERRO_VALIDACAO_'+FormatDateTime('HH#MM#SS',data_do_sistema)+'.xml', dm.LeIni(2,'NFE','CaminhoErroEnviar')+
       '\'+FormatDateTime('YYYMM',data_do_sistema ));
       exibe_painel_erro('ERRRO GERAR  NFCE'#13#10#13#10+' Antes de ativar o modo de força em contingência offline, envie uma foto deste erro para a Real Softwares!'
        +#13#10#13#10+ E.message,'Ok');
       Result := false;
       exit;

     end;
  end;

  chave    :=  copy(dm.ACBrNFe1.NotasFiscais[0].NFe.infNFe.ID,4,60);
  serie    :=  ACBrNFe1.NotasFiscais[0].NFe.Ide.serie;
  numeroNF :=  ACBrNFe1.NotasFiscais[0].NFe.Ide.nNF;


  adicionaLog('Gerou a nota com a chave '+copy(dm.ACBrNFe1.NotasFiscais[0].NFe.infNFe.ID,4,60));


    adicionaLog('Tenta assinar a nota '+copy(dm.ACBrNFe1.NotasFiscais[0].NFe.infNFe.ID,4,60));

  //Tenta assinar a nota
  try
   begin
      dm.ACBrNFe1.NotasFiscais[0].Assinar;
     adicionaLog('Assinou  a nota '+copy(dm.ACBrNFe1.NotasFiscais[0].NFe.infNFe.ID,4,60));
    end;
  except
       on E : Exception  do
     begin
       adicionaLog('Erro na assinatura  da nota com a chave '+copy(dm.ACBrNFe1.NotasFiscais[0].NFe.infNFe.ID,4,60)+'   '+E.Message);

        dm.ACBrNFe1.NotasFiscais[0].GravarXML(copy(dm.ACBrNFe1.NotasFiscais[0].NFe.infNFe.ID,4,60)+'_ERRO_VALIDACAO_'+FormatDateTime('HH#MM#SS',data_do_sistema)+'.xml', dm.LeIni(2,'NFE','CaminhoErroEnviar')+
       '\'+FormatDateTime('YYYMM',data_do_sistema ));
       exibe_painel_erro('ERRO AO ASSINAR NF-E'#13#10#13#10+' Antes de ativar o modo de força em contingência offline, envie uma foto deste erro para a Real Softwares!'
        +#13#10#13#10+ E.message,'Ok');
       Result := false;
       exit;
     end;
   end;



     adicionaLog('Tenta validar a nota '+copy(dm.ACBrNFe1.NotasFiscais[0].NFe.infNFe.ID,4,60));
  // Tenta validar a nota
  try
   begin

      dm.ACBrNFe1.NotasFiscais[0].Validar;
      adicionaLog('Validou a nota com a  chave '+copy(dm.ACBrNFe1.NotasFiscais[0].NFe.infNFe.ID,4,60));
   end;

  except
       on E : Exception  do
     begin

       adicionaLog('Erro na validação da nota com a chave '+copy(dm.ACBrNFe1.NotasFiscais[0].NFe.infNFe.ID,4,60)+'   '+E.Message);
       dm.ACBrNFe1.NotasFiscais[0].GravarXML(copy(dm.ACBrNFe1.NotasFiscais[0].NFe.infNFe.ID,4,60)+'_ERRO_VALIDACAO_'+FormatDateTime('HH#MM#SS',data_do_sistema)+'.xml', dm.LeIni(2,'NFE','CaminhoErroEnviar')+
       '\'+FormatDateTime('YYYMM',data_do_sistema ));
       exibe_painel_erro('ERRRO AO VALIDAR A NFE'#13#10#13#10+' Antes de ativar o modo de força em contingência offline, envie uma foto deste erro para a Real Softwares!'
        +#13#10#13#10+ E.message,'Ok');
       Result := false;
       exit;
     end;
   end;



   nomeArquivoTemporario   :=  FormatDateTime('DDMMHHMMSS',now)+'_'+copy(dm.ACBrNFe1.NotasFiscais[0].NFe.infNFe.ID,4,60)+'.xml';
   nomeArquivoDefinitivo   :=  copy(dm.ACBrNFe1.NotasFiscais[0].NFe.infNFe.ID,4,60)+'.xml';

   localArquivoTemporario  := dm.LeIni(2,'NFE','caminhoArquivosXML')+'\'+FormatDateTime('YYYMM',data_do_sistema  )+'\temp\';
   localArquivoDefinitivo := dm.LeIni(2,'NFE','caminhoArquivosXML')+'\'+FormatDateTime('YYYMM',data_do_sistema  )+'\';

       adicionaLog('Tentar gravar em disco o arquivo temporario da nota com a chave '+copy(dm.ACBrNFe1.NotasFiscais[0].NFe.infNFe.ID,4,60));
      //Tenta gravar a nota em disco
      try
       begin
          dm.ACBrNFe1.NotasFiscais[0].GravarXML(nomeArquivoTemporario,localArquivoTemporario);
          adicionaLog('gravou em disco a nota com a chave '+copy(dm.ACBrNFe1.NotasFiscais[0].NFe.infNFe.ID,4,60));
        end;
      except
          on E : Exception  do
         begin
          adicionaLog(' erro gravar em disco a nota com a chave '+copy(dm.ACBrNFe1.NotasFiscais[0].NFe.infNFe.ID,4,60)+'   '+E.Message+' no pasta'+ dm.LeIni(2,'NFE','caminhoArquivosXML')+
          '\'+FormatDateTime('YYYMM',data_do_sistema  ));
           dm.ACBrNFe1.NotasFiscais[0].GravarXML(copy(dm.ACBrNFe1.NotasFiscais[0].NFe.infNFe.ID,4,60)+'_ERRO_ENVIO.xml', dm.LeIni(2,'NFCE','CaminhoErroEnviar')+
           '\'+FormatDateTime('YYYMM',data_do_sistema ));
           exibe_painel_erro('ERRO AO GRAVAR A NOTA EM DISCO!'
            +#13#10#13#10+ E.message,'Ok');
           Result := true;
           exit;
         end;
       end;


      adicionaLog('XML da NF-e Gerada:');
      adicionaLog(dm.ACBrNFe1.NotasFiscais[0].XML);
      AdicionaNFCENaListaDeNotasParaCancelar(3);




      try
       begin
          dm.ACBrNFe1.WebServices.Retorno.Protocolo :='';
          dm.ACBrNFe1.Enviar(ACBrNFe1.NotasFiscais[0].NFe.Ide.nNF, false, nfeSincrona  ,false);
          adicionaLog('Enviou a a nota com a chave '+copy(dm.ACBrNFe1.NotasFiscais[0].NFe.infNFe.ID,4,60));
          notaFoiEnviada  := true;
        end;
      except
        on E : Exception  do
         begin
           dm.ACBrNFe1.NotasFiscais[0].GravarXML(copy(dm.ACBrNFe1.NotasFiscais[0].NFe.infNFe.ID,4,60)+'_ERRO_ENVIO.xml', dm.LeIni(2,'NFE','CaminhoErroEnviar')+
           '\'+FormatDateTime('YYYMM',data_do_sistema ));

           msgErroEnvio := e.Message;
           adicionaLog(msgErroEnvio);
           if (  (Pos('12002',msgErroEnvio) > 0) or  (Pos('12057',msgErroEnvio) > 0) ) then
              begin
                adicionaLog('OCORREU O PROBLEMA DE TEMPO DE LIMITE!');
                tentativasConsulta := 10;
                notaFoiEnviada := false;
                tentativaAtual:=0;

                while ( (tentativaAtual < tentativasConsulta) and (notaFoiEnviada = false) ) do
                 begin
                   adicionaLog(IntToStr(tentativaAtual) +' tentativa de consulta');
                   dm.ACBrNFe1.NotasFiscais.Clear;
                   dm.ACBrNFe1.NotasFiscais.LoadFromFile(localArquivoTemporario+nomeArquivoTemporario);

                   try
                     ACBrNFe1.Consultar;
                   except
                    begin

                    end
                   end;

//                   if  ( trim(dm.ACBrNFe1.WebServices.Consulta.XMotivo) = 'Autorizado o uso da NF-e') then
                    if (  (dm.ACBrNFe1.WebServices.Consulta.cStat  = 100) or (dm.ACBrNFe1.WebServices.Consulta.cStat  = 150)  )  then
                     begin
                        notaFoiEnviada := true;
                     end;

                   if (notaFoiEnviada = false) then
                     sleep(8000);

                   tentativaAtual := tentativaAtual + 1;
                 end
              end
           else
             begin
               notaFoiEnviada := false;
               result := false;

             end;


         end;
      end;

  if notaFoiEnviada  then
   begin
       adicionaLog('Tentar gravar em disco o arquivo definitivo da nota com a chave '+copy(dm.ACBrNFe1.NotasFiscais[0].NFe.infNFe.ID,4,60));
      //Tenta gravar a nota em disco
      try
       begin
          dm.ACBrNFe1.NotasFiscais[0].GravarXML(nomeArquivoDefinitivo ,localArquivoDefinitivo);
          DeleteFile(localArquivoTemporario+nomeArquivoTemporario);
          adicionaLog('gravou em disco o arquivo definitivo da nota com a chave '+copy(dm.ACBrNFe1.NotasFiscais[0].NFe.infNFe.ID,4,60));
        end;
      except
          on E : Exception  do
         begin
          adicionaLog(' erro gravar em disco a nota com a chave '+copy(dm.ACBrNFe1.NotasFiscais[0].NFe.infNFe.ID,4,60)+'   '+E.Message+' no pasta'+ dm.LeIni(2,'NFE','caminhoArquivosXML')+
          '\'+FormatDateTime('YYYMM',data_do_sistema  ));
           dm.ACBrNFe1.NotasFiscais[0].GravarXML(copy(dm.ACBrNFe1.NotasFiscais[0].NFe.infNFe.ID,4,60)+'_ERRO_ENVIO.xml', dm.LeIni(2,'NFE','CaminhoErroEnviar')+
           '\'+FormatDateTime('YYYMM',data_do_sistema ));
           exibe_painel_erro('ERRO AO GRAVAR A NOTA EM DISCO!'
            +#13#10#13#10+ E.message,'Ok');
           Result := true;
           exit;
         end;
       end;
    end
  else
   begin

     DeleteFile(localArquivoTemporario+nomeArquivoTemporario);
     adicionaLog('Erro no envio da nota com a chave '+chave+'   '+msgErroEnvio);
     exibe_painel_erro('erro no envio da nota com a chave '+chave+'   '+msgErroEnvio,'Ok');

     result := false;
     exit;
   end;

  result:= true;
end;




procedure Tdm.configuraImpressoraNaoFiscal();
begin

 if (dm.ACBrPosPrinter1 <> nil )  then
    begin
      dm.ACBrPosPrinter1.Desativar;
      FreeAndNil(dm.ACBrPosPrinter1);
    end;

 dm.ACBrPosPrinter1 := TACBrPosPrinter.Create(self);
 ACBrPosPrinter1.Desativar;
 if (StrToInt(dm.LeIni(2,'IMPRESSORA_NAO_FISCAL_01','via_dll')) = 1) then
  begin

   case (StrToInt(dm.LeIni(2,'IMPRESSORA_NAO_FISCAL_01','marca'))) of
    1:   ACBrPosPrinter1.Modelo        := ppEscBematech;
    2:   ACBrPosPrinter1.Modelo := ppEscEpsonP2;
    3:   ACBrPosPrinter1.Modelo := ppEscPosEpson;
    4:   ACBrPosPrinter1.Modelo := ppEscDaruma;
    5:   ACBrPosPrinter1.Modelo := ppEscDiebold;
    6:   ACBrPosPrinter1.Modelo := ppEscVox;
    7:  ACBrPosPrinter1.Modelo := ppTexto;
   end;

     ACBrPosPrinter1.Device.Porta  := dm.LeIni(2,'IMPRESSORA_NAO_FISCAL_01','porta');
     ACBrPosPrinter1.Device.Baud   := StrToInt(dm.LeIni(2,'IMPRESSORA_NAO_FISCAL_01','velocidade'));
     ACBrPosPrinter1.TraduzirTags :=  true;

      case StrToInt(dm.LeIni(2,'IMPRESSORA_NAO_FISCAL_01','paridade')) of
       0:  ACBrPosPrinter1.Device.Parity := pNone;
       1:  ACBrPosPrinter1.Device.Parity := pEven;
       2:  ACBrPosPrinter1.Device.Parity := pMark;
       3:  ACBrPosPrinter1.Device.Parity := pOdd;
       4:  ACBrPosPrinter1.Device.Parity := pSpace;
      end;


      case StrToInt(dm.LeIni(2,'IMPRESSORA_NAO_FISCAL_01','stopBits')) of
       1: ACBrPosPrinter1.Device.Stop := s1;
       2: ACBrPosPrinter1.Device.Stop := s1eMeio;
       3: ACBrPosPrinter1.Device.Stop := s2;
      end;

      case StrToInt(dm.LeIni(2,'IMPRESSORA_NAO_FISCAL_01','fluxo')) of
       0: ACBrPosPrinter1.Device.HandShake := hsNenhum;
       1: ACBrPosPrinter1.Device.HandShake := hsXON_XOFF;
       2: ACBrPosPrinter1.Device.HandShake := hsRTS_CTS;
       3: ACBrPosPrinter1.Device.HandShake := hsDTR_DSR;
      end;
  end

end;





function Tdm.imprimeTexoMiniPrinter : boolean;
var
 linhasMemo : integer;
 contador : integer;
 rdp : TRDprint;

 nomeImpressora : string;
 ctLinha : integer;
 ret : integer;
begin


try
   if (StrToInt(dm.LeIni(2,'IMPRESSORA_NAO_FISCAL_01','via_dll')) = 1) then
    begin
     dm.adicionaLog('Entrou na função de impressão via dll');
     configuraImpressoraNaoFiscal ();

     try
      begin
       dm.ACBrPosPrinter1.LinhasBuffer := 0;
  //     dm.ACBrPosPrinter1.LinhasEntreCupons := 0;
       dm.ACBrPosPrinter1.EspacoEntreLinhas := 0;
       dm.ACBrPosPrinter1.ColunasFonteNormal := 48;
       dm.ACBrPosPrinter1.CortaPapel := true;
       dm.ACBrPosPrinter1.ControlePorta := false;
       dm.ACBrPosPrinter1.TraduzirTags := true;
       dm.ACBrPosPrinter1.IgnorarTags := false;
       dm.ACBrPosPrinter1.PaginaDeCodigo := TACBrPosPaginaCodigo(2);
       dm.aCBrPosPrinter1.Ativar;

        dm.adicionaLog('Comanda a impressão do texto');
        dm.adicionaLog(frm_principal.memo_avisos.Lines.Text);
        ACBrPosPrinter1.Imprimir(trim(frm_principal.memo_avisos.Lines.Text));

        if (StrToInt(dm.LeIni(2,'IMPRESSORA_NAO_FISCAL_01','cortaPapel')) = 1) then
          ACBrPosPrinter1.CortarPapel(true);

      end;
     except
      begin
       aCBrPosPrinter1.desativar;
        dm.exibe_painel_erro('Erro ao chamar função de impressão. Verifique os cabos da impressora!','Ok');
      end;
     end;
     dm.aCBrPosPrinter1.desativar;

    end
   else
    begin

     rdp := TRDprint.Create(Self);
      with rdp do
      begin
        Name := 'rdp';
        ImpressoraPersonalizada.NomeImpressora := 'Modelo Personalizado - (Epson)';
        ImpressoraPersonalizada.SaltoPagina:='0';
        OpcoesPreview.PaginaZebrada := False;
        OpcoesPreview.Remalina := False;
        OpcoesPreview.CaptionPreview := 'Rdprint Preview';
        OpcoesPreview.PreviewZoom := 100;
        OpcoesPreview.CorPapelPreview := clWhite;
        OpcoesPreview.CorLetraPreview := clBlack;
        OpcoesPreview.Preview := False;
        OpcoesPreview.BotaoSetup := Ativo;
        OpcoesPreview.BotaoImprimir := Ativo;
        OpcoesPreview.BotaoGravar := Ativo;
        OpcoesPreview.BotaoLer := Ativo;
        Autor := Deltress;
        About := 'RDprint 3.0h - Registrado';
        Acentuacao := Transliterate;
        CaptionSetup := 'Rdprint Setup';
        UsaGerenciadorImpr := false;
        CorForm := clBtnFace;
        CorFonte := clBlack;
        Impressora := Personalizado;
        TamanhoQteLinhas := 0;
        TamanhoQteColunas := 0;
        TamanhoQteLPP := Seis;
  //      NumeroPaginaInicial := 1;
  //      PaginaInicial := 1;
  //      PaginaFinal := 9999;
        NumerodeCopias := 1;
        Orientacao := poPortrait;
        UsaGerenciadorImpr:=true;
      end;


     try
       TRY
        nomeImpressora := LeIni(2,'EXTRATO','nomeImpressoraWindows');
        rdp.SetPrinterbyName(nomeImpressora);
        ctlinha:=1;
        rdp.Abrir;
        rdp.Impressora       := BOBINA;  // Depois do Abrir para FORÇAR o modelo BOBINA (sem comando)
        rdp.TamanhoQteLinhas := 1;   // Evita o salto indesejado no final
        rdp.TamanhoQteColunas:= 48;  // Não importa... O preview Não deve ser mostrado...
        rdp.Acentuacao       := SemAcento;
        rdp.MostrarProgresso := false;
        rdp.Imp(ctlinha,1,' ');
        For contador:=0 to (frm_principal.memo_avisos.Lines.Count-1) do
         begin
           rdp.Imp(ctlinha,1,  frm_principal.memo_avisos.Lines[contador]);
           ctlinha:=ctlinha+1;
         end;
        rdp.Imp(ctlinha,1,chr(13)+chr(10));
        rdp.Fechar;
       finally
         FreeAndNil(rdp);
       end;


     except
      on E : Exception  do
       begin
         dm.exibe_painel_erro('Ocorreu um erro ao realizar a impressão. Verifique os cabos da impressora e tente novamente!','Ok');
         adicionaLog('Erro ao realizar impressão via rdprint '+E.Message);
         exit;

       end;

     end;


    end;
 finally
   ACBrPosPrinter1.Desativar;
 end;


end;



function Tdm.imprimeTexoImpressoraNFCE : boolean;
var
 linhasMemo : integer;
 contador : integer;
 rdp : TRDprint;

 nomeImpressora : string;
 ctLinha : integer;
 ret : integer;
begin


   try

     configuraImpressoraNFCE();
     dm.ACBrPosPrinter1.LinhasBuffer := 0;
     dm.ACBrPosPrinter1.LinhasEntreCupons := 0;
     dm.ACBrPosPrinter1.EspacoEntreLinhas := 0;
     dm.ACBrPosPrinter1.ColunasFonteNormal := 48;
     dm.ACBrPosPrinter1.ControlePorta := false;
     dm.ACBrPosPrinter1.LinhasBuffer := 0;
     dm.ACBrPosPrinter1.EspacoEntreLinhas := 0;
     dm.ACBrPosPrinter1.ColunasFonteNormal := 48;
     dm.ACBrPosPrinter1.CortaPapel := true;
     dm.ACBrPosPrinter1.ControlePorta := false;
     dm.ACBrPosPrinter1.TraduzirTags := true;
     dm.ACBrPosPrinter1.IgnorarTags := false;
     dm.ACBrPosPrinter1.PaginaDeCodigo := TACBrPosPaginaCodigo(2);
     frm_principal.memo_avisos.Lines.LoadFromFile(caminhoArquivoExtrato);
     dm.aCBrPosPrinter1.Ativar;

     ACBrPosPrinter1.Imprimir(trim(frm_principal.memo_avisos.Lines.Text));
        if (StrToInt(dm.LeIni(2,'IMPRESSORA_NFCE','cortaPapel')) = 1) then
          ACBrPosPrinter1.CortarPapel(true);

     dm.aCBrPosPrinter1.desativar;
   finally
     dm.ACBrPosPrinter1.Desativar;
   end;
end;


function Tdm.imprimePedido2(miniprinter : string;  mesa : string) : boolean;
var
 linhasMemo : integer;
 contador : integer;
 rdp : Trdprint;
 nomeImpressora : string;
 ctLinha : integer;
 ret : integer;
begin

if (  (verificaMesaBalcao(mesa)) and   (StrToInt(dm.LeIni(2,'CAIXA','balcaoImprimeFichas')) = 1) and (StrToInt(dm.LeIni(2,'IMPRESSORA_NAO_FISCAL_01','via_dll')) = 1)  )   then
  begin
   configuraImpressoraNaoFiscal ();
   ACBrNFeDANFeESCPOS1.ImprimirRelatorio(frm_principal.memo_avisos.Lines);
   ACBrPosPrinter1.Desativar;
  end


 else
  begin

   nomeImpressora :=  LeIniImpressoes (2,'IMPRESSORA_'+miniprinter,'nomeImpressora');
   rdp.SetPrinterbyName(nomeImpressora);
   ctlinha:=1;
   TRY
    rdp.Abrir;
   except
   end;


   rdp.Imp(ctlinha,1,' ');
   For contador:=0 to (frm_principal.memo_avisos.Lines.Count-1) do
    begin
      rdp.Imp(ctlinha,1,frm_principal.memo_avisos.Lines[contador]);
      ctlinha:=ctlinha+1;
    end;

    rdp.Imp(ctlinha,1,chr(13)+chr(10));

   try
    begin
     rdp.Fechar;
    end;
   except
   end;
   
   FreeAndNil(rdp);

  end;


end;




function Tdm.imprimePedido(miniprinter : string; marca : integer) : boolean;
var
 linhasMemo : integer;
 contador : integer;
 nomeImpressora : string;
 ctLinha : integer;
 ret : integer;
 rdp : TRDprint;
begin

      rdp := TRDprint.Create(Self);
    with rdp do
    begin
      Name := 'rdp';
      ImpressoraPersonalizada.NomeImpressora := 'Modelo Personalizado - (Epson)';
      ImpressoraPersonalizada.SaltoPagina:='0';
      OpcoesPreview.PaginaZebrada := False;
      OpcoesPreview.Remalina := False;
      OpcoesPreview.CaptionPreview := 'Rdprint Preview';
      OpcoesPreview.PreviewZoom := 100;
      OpcoesPreview.CorPapelPreview := clWhite;
      OpcoesPreview.CorLetraPreview := clBlack;
      OpcoesPreview.Preview := False;
      OpcoesPreview.BotaoSetup := Ativo;
      OpcoesPreview.BotaoImprimir := Ativo;
      OpcoesPreview.BotaoGravar := Ativo;
      OpcoesPreview.BotaoLer := Ativo;
      Autor := Deltress;
      About := 'RDprint 3.0h - Registrado';
      Acentuacao := Transliterate;
      CaptionSetup := 'Rdprint Setup';
      CorForm := clBtnFace;
      CorFonte := clBlack;
      Impressora := Personalizado;
      TamanhoQteLinhas := 0;
      TamanhoQteColunas := 0;
      TamanhoQteLPP := Seis;
      NumerodeCopias := 1;
      Orientacao := poPortrait;
      UsaGerenciadorImpr:=true;
    end;

   //dm.ACBrPosPrinter1.Porta :=LeIniImpressoes (2,'IMPRESSORA_'+miniprinter,'nomeImpressora');
   nomeImpressora := LeIniImpressoes (2,'IMPRESSORA_'+miniprinter,'nomeImpressora');
   rdp.SetPrinterbyName(nomeImpressora);
   ctlinha:=1;
   TRY
    rdp.Abrir;
   except
   end;

      rdp.Impressora       := BOBINA;  // Depois do Abrir para FORÇAR o modelo BOBINA (sem comando)
     rdp.TamanhoQteLinhas := 1;   // Evita o salto indesejado no final
     rdp.TamanhoQteColunas:= 48;  // Não importa... O preview Não deve ser mostrado...
     rdp.Acentuacao       := SemAcento;
     rdp.MostrarProgresso := false;



   rdp.Imp(ctlinha,1,' ');

   For contador:=0 to (frm_principal.memo_avisos.Lines.Count-1) do
    begin
      rdp.Imp(ctlinha,1,  frm_principal.memo_avisos.Lines[contador]);
      ctlinha:=ctlinha+1;
    end;

    rdp.Imp(ctlinha,1,chr(13)+chr(10));

   try
    begin
     rdp.Fechar;
    end;
   except
   end;

    FreeAndNil(rdp);

end;










function Tdm.imprimeLinhaEmArquivo(Arquivo : string; marca: integer; modelo : integer; linha : Widestring;
         negrito :boolean; italico : boolean; sublinhado : boolean; tam : boolean;
         comprimido : boolean; largura : boolean; altura : boolean ) : string;
var
 formato : string;
 dummy : integer;
 tipoletraBmt, italicoBmt, sublinhadoBmt, expBmt, negritoBmt : integer;

begin




    case marca of
      1: begin
             linha:= formatacaoBematech(negrito,italico,sublinhado,tam,comprimido,largura,altura)+linha;
             linha:= linha+formatacaoBematechFinal(negrito,italico,sublinhado,tam,comprimido,largura,altura);
             linha:=linha+#13#10;
             gravaStrEmArquivoDeTexto(arquivo,linha);
         end;

      2: begin
             linha:= formatacaoBematech(negrito,italico,sublinhado,tam,comprimido,largura,altura)+linha;
             linha:= linha+formatacaoBematechFinal(negrito,italico,sublinhado,tam,comprimido,largura,altura);
             linha:=linha+#13#10;
             gravaStrEmArquivoDeTexto(arquivo,linha);
         end;





       3: begin

            formato:= chr(27) + chr(64);
            gravaStrEmArquivoDeTexto(patchAplicacao+'extrato.dat',formato);

            if negrito then
             begin
               formato:= formato + chr(27) + chr(69) + chr(1);
               gravaStrEmArquivoDeTexto(patchAplicacao+'extrato.dat',formato);
            end;

            if tam then
             begin
               formato:= formato + chr(29) + chr(33) + chr(16);
               gravaStrEmArquivoDeTexto(patchAplicacao+'extrato.dat',formato);
             end;
              linha:=formato+linha+chr(13)+chr(10);
              gravaStrEmArquivoDeTexto(arquivo,linha);

             {
             linha:= formatacaoACBRInicial (negrito,italico,sublinhado,tam,comprimido,largura,altura)+linha;
             linha:= linha+formatacaoACBRFinal(negrito,italico,sublinhado,tam,comprimido,largura,altura);
             linha:=linha+chr(13)+chr(10);
             gravaStrEmArquivoDeTexto(arquivo,linha);
              }
         end;
    end;

end;



function Tdm.cortaPapelImpNF(arquivo : string; marca : integer ; modelo  : integer) : string;
begin

    case marca of
      1: begin
          gravaStrEmArquivoDeTexto(arquivo,chr(27)+chr(109));
         end;
      2: begin

          gravaStrEmArquivoDeTexto(arquivo,chr(29) + chr(86) + chr(65));
         end;
      3: begin
//            gravaStrEmArquivoDeTexto(arquivo,'</corte_parcial>');
           gravaStrEmArquivoDeTexto(arquivo,chr(13)+chr(10));
           gravaStrEmArquivoDeTexto(arquivo,chr(29) + chr(86) + chr(65));

         end;
      4: begin

          gravaStrEmArquivoDeTexto(arquivo,chr(27)+chr(109));
         end;

      5: begin

         end;

      6: begin

          gravaStrEmArquivoDeTexto(arquivo,chr(13)+chr(10));
          gravaStrEmArquivoDeTexto(arquivo,chr(29) + chr(86) + chr(65));

         end;

     end;

end;

function Tdm.AbreGaveta(marca : integer ; modelo  : integer) : string;
var
 sComando : string;
begin


 if (StrToInt(dm.LeIni(2,'IMPRESSORA_NAO_FISCAL_01','via_dll')) = 1) and (StrToInt(dm.LeIni(2,'IMPRESSORA_NAO_FISCAL_01','usarAcbr')) = 1) then
  begin
    dm.configuraImpressoraNFCE();
    dm.ACBrPosPrinter1.AbrirGaveta;
    dm.ACBrPosPrinter1.Desativar;
    exit;

  end;


  if (StrToInt(dm.LeIni(1,'IMPRESSORA_FISCAL','instalada')) = 1) and  ( StrToInt(dm.LeIni(1,'IMPRESSORA_FISCAL','usarAcbr')) = 1) then
      marca  := StrToInt(dm.LeIni(1,'IMPRESSORA_FISCAL','marca'))
  else
      marca := StrToInt(dm.LeIni(1,'IMPRESSORA_NAO_FISCAL_01','marca'));



  if (StrToInt(dm.LeIni(1,'IMPRESSORA_FISCAL','instalada')) = 1) and  ( StrToInt(dm.LeIni(1,'IMPRESSORA_FISCAL','usarAcbr')) = 1) then
    frm_principal.ecf.AbreGaveta
  else
   begin
      case marca of
        1: begin
             if (StrToInt(dm.LeIni(2,'IMPRESSORA_NAO_FISCAL_01','via_dll')) = 1) then
              begin
//                ConfiguraModeloImpressora(modelo_impressora_nao_fiscal_01);
//                iniciaPorta(porta_impressora_nao_fiscal_01);
                sComando := #27 + #118 + #140;
//                ComandoTX( sComando, Length( sComando ));
              end
             else
              begin
                  If FileExists(caminhoArquivoExtrato) then DeleteFile(caminhoArquivoExtrato);
                  gravaStrEmArquivoDeTexto(patchAplicacao+'extrato.dat',chr(27)+chr(118)+chr(140));
                  frm_principal.memo_avisos.Lines.LoadFromFile(caminhoArquivoExtrato);
                  imprimeTexoMiniPrinter;
              end;

           end;
        2: begin

           end;
        3: begin

           end;
        4: begin
            gravaStrEmArquivoDeTexto(patchAplicacao+'extrato.dat',chr(27)+chr(22));
           end;

        5: begin

           end;
      end;

   end;

 end;



function Tdm.imp_bmp_impNF(marca : integer; modelo : integer; indice : integer; img : Widestring; posicao : integer) : string;
begin

  case marca of
    1: begin

       end;
    2: begin

       end;
    3: begin


       end;
    4: begin

       end;

    5: begin  // Epson
         case modelo of
           1:  begin    // Térmica TM-T88II
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


function imprime_imagem_imp_termicaNF(marca : integer; modelo : integer; indice : integer) : string;
var
 data : WideString;
begin

  case marca of
    1: begin

       end;
    2: begin

       end;
    3: begin

       end;
    4: begin

       end;

    5: begin  // Epson
         case modelo of
           1:  begin    // Térmica TM-T88II
//                  data:= inttostr(PTR_BM_CENTER);
//                  controladorEpson.DirectIO(PTR_DI_PRINT_FLASH_BITMAP,indice,data);
               end;

         end;

       end;
  end;
end;



function  Tdm.imprimeCabecalhoEstornoDeMesa(marca : integer; modelo : integer; tipo : integer ; mesa : string; layout : integer) : boolean;
var
 str : string;
begin

    case marca of
      1: begin
           case modelo of
            1: begin
                   dm.imprime_linha_impNF(marca,modelo,dm.centralizar(nome_fantasia,30),true,false,false,false,true,true,true);
                   dm.imprime_linha_impNF(marca,modelo,'------------------------------------------------------------', false,false,false,false,true,false,true);
                   dm.imprime_linha_impNF(marca,modelo,dm.centralizar('Estorno de mesa',30),true,false,false,false,true,true,true);
                   dm.imprime_linha_impNF(marca,modelo,'Mesa: '+mesa,true,false,false,false,true,true,true);

                   str:=FormatDateTime('DD/MM/YYY',DATE)+' '+FormatDateTime('HH:MM:SS',time);
                   dm.imprime_linha_impNF(marca,modelo,str,false,false,false,false,true,false,false);
                   str:='Operador: '+nome_usuario;
                   dm.imprime_linha_impNF(marca,modelo,str,false,false,false,false,true,false,false);
                   dm.imprime_linha_impNF(marca,modelo,'------------------------------------------------------------', false,false,false,false,true,false,true);

                    str:='########****************************';
                    str:=dm.organizarCupom(str,'Cod.','#');
                    str:=dm.organizarCupom(str,'Descricao','*');
                    dm.imprime_linha_impNF(marca,modelo,str,false,false,false,false,false,false,false);
                    str:='##########$$$$$********%%%%%%%%%%%%%';
                    str:=dm.organizarCupom(str,'Qtd.','#');
                    str:=dm.organizarCupom(str,' ','$');
                    str:=dm.organizarCupom(str,'Vl. un.','*');
                    str:=dm.organizarCupom(str,'Total','%');
                    dm.imprime_linha_impNF(marca,modelo,str,false,false,false,false,false,false,false);
                    dm.imprime_linha_impNF(marca,modelo,'------------------------------------------------------------', false,false,false,false,true,false,true);
               end;

           end;


         end;
      2: begin
            case modelo of
            1: begin

                   dm.imprime_linha_impNF(marca,modelo,dm.centralizar(nome_fantasia,24),true,false,false,true,false,true,false);
                   dm.imprime_linha_impNF(marca,modelo,'------------------------------------------------',false,false,false,true,false,false,false);
                   dm.imprime_linha_impNF(marca,modelo,dm.centralizar('Estorno de mesa',24),true,false,false,true,false,true,false);
                   dm.imprime_linha_impNF(marca,modelo,'Mesa: '+mesa,true,false,false,false,true,true,true);
                   str:=FormatDateTime('DD/MM/YYY',DATE)+' '+FormatDateTime('HH:MM:SS',time);
                   dm.imprime_linha_impNF(marca,modelo,str,false,false,false,false,true,false,false);
                   str:='Operador: '+nome_usuario;
                   dm.imprime_linha_impNF(marca,modelo,str,false,false,false,false,true,false,false);

                   dm.imprime_linha_impNF(marca,modelo,'------------------------------------------------',false,false,false,true,false,false,false);

                   if (layout = 1) then
                     begin
                       str:='########********************************';
                       str:=dm.organizarCupom(str,'Cod.','#');
                       str:=dm.organizarCupom(str,'Descricao','*');
                       dm.imprime_linha_impNF(marca,modelo,str,false,false,false,false,true,false,false);
                       str:='##########$$$$$***************%%%%%%%%%%%%%%';
                       str:=dm.organizarCupom(str,'Qtd.','#');
                       str:=dm.organizarCupom(str,' ','$');
                       str:=dm.organizarCupom(str,'Vl. un.','*');
                       str:=dm.organizarCupom(str,'Total','%');
                     end
                   else
                     begin
                       str:='###***************************%%%%%%%%%%%%%%';
                       str:=dm.organizarCupom(str,'Qtd','#');
                       str:=dm.organizarCupom(str,'Descricao','*');
                       str:=dm.organizarCupom(str,'Total','%');
                     end;

                   dm.imprime_linha_impNF(marca,modelo,str,false,false,false,false,true,false,false);
                   dm.imprime_linha_impNF(marca,modelo,'------------------------------------------------',false,false,false,true,false,false,false);
               end;

            2: begin
                   //DARUMA DR600
                   dm.imprime_linha_impNF(marca,modelo,'------------------------------------------------',false,false,false,true,false,false,false);
                   dm.imprime_linha_impNF(marca,modelo,dm.centralizar('Estorno de mesa',24),true,false,false,false,false,false,true);
                   dm.imprime_linha_impNF(marca,modelo,'Mesa: '+mesa,true,false,false,false,true,true,true);
                   str:=FormatDateTime('DD/MM/YYY',DATE)+' '+FormatDateTime('HH:MM:SS',time);
                   dm.imprime_linha_impNF(marca,modelo,str,false,false,false,false,true,false,false);
                   str:='Operador: '+nome_usuario;
                   dm.imprime_linha_impNF(marca,modelo,str,false,false,false,false,true,false,false);

                   dm.imprime_linha_impNF(marca,modelo,'------------------------------------------------',false,false,false,true,false,false,false);

                   if (layout = 1) then
                     begin
                       str:='########********************************';
                       str:=dm.organizarCupom(str,'Cod.','#');
                       str:=dm.organizarCupom(str,'Descricao','*');
                       dm.imprime_linha_impNF(marca,modelo,str,false,false,false,true,true,false,false);
                       str:='##########$$$$$************************%%%%%%%%%%%%%%%%';
                       str:=dm.organizarCupom(str,'Qtd.','#');
                       str:=dm.organizarCupom(str,' ','$');
                       str:=dm.organizarCupom(str,'Vl. un.','*');
                       str:=dm.organizarCupom(str,'Total','%');
                     end
                   else
                     begin
                       str:='###***************************%%%%%%%%%%%%%%';
                       str:=dm.organizarCupom(str,'Qtd','#');
                       str:=dm.organizarCupom(str,'Descricao','*');
                       str:=dm.organizarCupom(str,'Total','%');
                     end;

                   dm.imprime_linha_impNF(marca,modelo,str,false,false,false,false,true,false,false);
                   dm.imprime_linha_impNF(marca,modelo,'------------------------------------------------',false,false,false,true,false,false,false);
               end;



           end;
         end;



      3: begin

         end;
      4: begin
           case modelo of
            1: begin
                   dm.imprime_linha_impNF(marca,modelo,dm.centralizar(nome_fantasia,24),true,false,false,true,false,true,false);
                   dm.imprime_linha_impNF(marca,modelo,'------------------------------------------------',false,false,false,true,false,false,false);
                   dm.imprime_linha_impNF(marca,modelo,dm.centralizar('Estorno de mesa',24),true,false,false,true,false,true,false);
                   dm.imprime_linha_impNF(marca,modelo,'Mesa: '+mesa,true,false,false,false,true,true,true);

                   str:=FormatDateTime('DD/MM/YYY',DATE)+' '+FormatDateTime('HH:MM:SS',time);
                   dm.imprime_linha_impNF(marca,modelo,str,false,false,false,false,true,false,false);
                   str:='Operador: '+nome_usuario;
                   dm.imprime_linha_impNF(marca,modelo,str,false,false,false,false,true,false,false);

                   dm.imprime_linha_impNF(marca,modelo,'------------------------------------------------',false,false,false,true,false,false,false);

                   if (layout = 1) then
                     begin
                       str:='########********************************';
                       str:=dm.organizarCupom(str,'Cod.','#');
                       str:=dm.organizarCupom(str,'Descricao','*');
                       dm.imprime_linha_impNF(marca,modelo,str,false,false,false,false,true,false,false);
                       str:='##########$$$$$***************%%%%%%%%%%%%%%';
                       str:=dm.organizarCupom(str,'Qtd.','#');
                       str:=dm.organizarCupom(str,' ','$');
                       str:=dm.organizarCupom(str,'Vl. un.','*');
                       str:=dm.organizarCupom(str,'Total','%');
                     end
                   else
                     begin
                       str:='###***************************%%%%%%%%%%%%%%';
                       str:=dm.organizarCupom(str,'Qtd','#');
                       str:=dm.organizarCupom(str,'Descricao','*');
                       str:=dm.organizarCupom(str,'Total','%');
                     end;

                   dm.imprime_linha_impNF(marca,modelo,str,false,false,false,false,true,false,false);
                   dm.imprime_linha_impNF(marca,modelo,'------------------------------------------------',false,false,false,true,false,false,false);

               end;
           end;

         end;

      5: begin  // Epson
            case modelo of
             1:  begin    // Térmica TM-T88II

                   dm.imprime_linha_impNF(marca,modelo,dm.centralizar(nome_fantasia,30),true,false,false,true,false,true,false);
                   dm.imprime_linha_impNF(marca,modelo,'--------------------------------------------------------',false,false,false,true,false,false,false);
                   dm.imprime_linha_impNF(marca,modelo,dm.centralizar('Estorno de mesa',24),true,false,false,true,false,true,false);
                   dm.imprime_linha_impNF(marca,modelo,'Mesa: '+mesa,true,false,false,false,true,true,true);
                   str:=FormatDateTime('DD/MM/YYY',DATE)+' '+FormatDateTime('HH:MM:SS',time);
                   dm.imprime_linha_impNF(marca,modelo,str,false,false,false,false,true,false,false);
                   str:='Operador: '+nome_usuario;
                   dm.imprime_linha_impNF(marca,modelo,str,false,false,false,false,true,false,false);

                    dm.imprime_linha_impNF(marca,modelo,'--------------------------------------------------------',false,false,false,true,false,false,false);

                   if (layout = 1) then
                     begin
                       str:='########********************************';
                       str:=dm.organizarCupom(str,'Cod.','#');
                       str:=dm.organizarCupom(str,'Descricao','*');
                       dm.imprime_linha_impNF(marca,modelo,str,false,false,false,false,false,false,false);
                       str:='##########$$$$$***************%%%%%%%%%%%%%%';
                       str:=dm.organizarCupom(str,'Qtd.','#');
                       str:=dm.organizarCupom(str,' ','$');
                       str:=dm.organizarCupom(str,'Vl. un.','*');
                       str:=dm.organizarCupom(str,'Total','%');
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


function Tdm.imprimeCabecalhoRelatorioDiversoNF(marca : integer; modelo : integer ; titulo : string) : string;
var
 str : string;
begin


 dm.imprime_linha_impNF(marca,modelo,dm.centralizar(nome_fantasia,30),true,false,false,true,false,true,false);
 dm.imprime_linha_impNF(marca,modelo,'--------------------------------------------------------',false,false,false,true,false,false,false);
 dm.imprime_linha_impNF(marca,modelo,dm.centralizar(titulo,30),true,false,false,true,false,true,false);
 str:=FormatDateTime('DD/MM/YYY',DATE)+' '+FormatDateTime('HH:MM:SS',time);
 dm.imprime_linha_impNF(marca,modelo,str,false,false,false,false,true,false,false);
 str:='Operador: '+nome_usuario;
 dm.imprime_linha_impNF(marca,modelo,str,false,false,false,false,true,false,false);



end;

function Tdm.getTotalPagamentosParciais(mesa : string) : double;
var
 q : TIBQuery;
 formato,str : string;
begin

  q := TIBquery.create(self);
  q.Database := dm.dbrestaurante;
  q.Transaction := dm.transacao;

  q.Active:=false;
  q.SQL.Clear;
  q.SQL.Add('select sum(valor) as total  from recebimento_parcial');
  q.sql.add(' where mesa='+Quotedstr(mesa));
  q.Active:=true;

  if (q.fieldbyname('total').value = null) then
    result:=0
  else
    result:=q.fieldbyname('total').value;

  q.Active:=false;
  FreeAndNil(q);

end;


function Tdm.imprimeRecebimentosParciais(marca : integer; modelo : integer; mesa : string) : string;
var
 q : TIBQuery;
 formato,str : string;
begin

  q := TIBquery.create(self);
  q.Database := dm.dbrestaurante;
  q.Transaction := dm.transacao;

  q.Active:=false;
  q.SQL.Clear;
  q.SQL.Add('select r.*, f.descricao from recebimento_parcial r ');
  q.sql.add(' inner join formas_pagamento f on (f.cod_forma = r.cod_forma) ');
  q.sql.add(' where r.mesa='+Quotedstr(mesa));
  q.Active:=true;
  q.First;

  if (q.IsEmpty = false ) then
  begin
    case marca of

      1 : begin
            case modelo of
              1: begin
                    dm.imprime_linha_impNF(marca,modelo,'------------------------------------------------------------',false,false,false,true,true,false,false);
                    dm.imprime_linha_impNF(marca,modelo,dm.centralizar('PAGAMENTOS PARCIAIS REALIZADOS',60),false,false,false,true,true,false,false);
                    dm.imprime_linha_impNF(marca,modelo,'',false,false,false,true,false,false,false);

                    while not q.Eof do
                     begin
                       formato:='############################ %%%%%%%%%';
                       str:=formato;
                       str:=dm.organizarCupom(str,q.fieldbyname('descricao').value,'#');
                       str:=dm.organizarCupom(str,FormatFloat('R$ ###,###,##0.00 ',q.fieldbyname('valor').value ),'%');
                       dm.imprime_linha_impNF(marca,modelo,str,false,false,false,false,false,false,false);
                       q.Next;
                     end;

                     dm.imprime_linha_impNF(marca,modelo,' ',false,false,false,true,false,false,false);
                     str:=formato;
                     str:=dm.organizarCupom(str,'Total','#');
                     str:=dm.organizarCupom(str,FormatFloat('R$ ###,###,##0.00 ',getTotalPagamentosParciais(mesa) ),'%');
                     dm.imprime_linha_impNF(marca,modelo,str,true,false,false,false,false,false,false);
                 end;
            end;


          end;

      2 : begin
             case modelo of
              2: begin
                   dm.imprime_linha_impNF(marca,modelo,'------------------------------------------------',false,false,false,true,false,false,false);
                   dm.imprime_linha_impNF(marca,modelo,dm.centralizar('PAGAMENTOS PARCIAIS REALIZADOS',42),true,false,false,true,false,false,false);
                   dm.imprime_linha_impNF(marca,modelo,'',false,false,false,true,false,false,false);
                   while not q.Eof do
                   begin
                     formato:='#################################%%%%%%%%%%%%%';
                     str:=formato;
                     str:=dm.organizarCupom(str,q.fieldbyname('descricao').value,'#');
                     str:=dm.organizarCupom(str,FormatFloat('R$ ###,###,##0.00 ',q.fieldbyname('valor').value ),'%');
                     dm.imprime_linha_impNF(marca,modelo,str,false,false,false,false,false,false,false);
                     q.Next;
                   end;

                   dm.imprime_linha_impNF(marca,modelo,' ',false,false,false,true,false,false,false);
                   str:=formato;
                   str:=dm.organizarCupom(str,'Total','#');
                   str:=dm.organizarCupom(str,FormatFloat('R$ ###,###,##0.00 ',getTotalPagamentosParciais(mesa) ),'%');
                   dm.imprime_linha_impNF(marca,modelo,str,true,false,false,false,false,false,false);
                 end;
             end;
          end;

      4 : begin
             case modelo of
              1: begin
                   dm.imprime_linha_impNF(marca,modelo,'------------------------------------------------',false,false,false,true,false,false,false);
                   dm.imprime_linha_impNF(marca,modelo,dm.centralizar('PAGAMENTOS PARCIAIS REALIZADOS',48),false,false,false,true,false,false,false);
                   dm.imprime_linha_impNF(marca,modelo,'',false,false,false,true,false,false,false);
                   while not q.Eof do
                   begin
                     formato:='#####################%%%%%%%%%%%%%%';
                     str:=formato;
                     str:=dm.organizarCupom(str,q.fieldbyname('descricao').value,'#');
                     str:=dm.organizarCupom(str,FormatFloat('R$ ###,###,##0.00 ',q.fieldbyname('valor').value ),'%');
                     dm.imprime_linha_impNF(marca,modelo,str,false,false,false,false,true,false,false);
                     q.Next;
                   end;

                   dm.imprime_linha_impNF(marca,modelo,' ',false,false,false,true,false,false,false);
                   str:=formato;
                   str:=dm.organizarCupom(str,'Total','#');
                   str:=dm.organizarCupom(str,FormatFloat('R$ ###,###,##0.00 ',getTotalPagamentosParciais(mesa) ),'%');
                   dm.imprime_linha_impNF(marca,modelo,str,false,false,false,true,false,false,false);
                 end;
             end;
          end;


    end;
  end;

  q.Active:=false;
  FreeAndNil(q);
end;


 function Tdm.imprime_rodape_ExtratoContaNF(marca : integer; modelo : integer; tipo: integer; nPessoas :
         integer; subtotal : double;
         couvert : double ;
         txServico : double;
         repique   : double;
         desconto : double;
         totalConta : double;
         totalPago: double;
         troco : double; layout : integer) : string;

var
  str : string;
  formato : string;
begin
    case marca of
      1: begin
           case modelo of
             1: begin
                    dm.imprime_linha_impNF(marca,modelo,'------------------------------------------------',true,false,false,false,false,false,false);
                    str:='#########################%%%%%%%%%%%%%%%%%%%%%%';
                    str:=dm.organizarCupom(str,'Subtotal:','#');
                    str:=dm.organizarCupom(str,dm.alinha_valor_a_direita(20, FormatFloat('R$ ###,###,##0.00', (subtotal) )),'%');
                    dm.imprime_linha_impNF(marca,modelo,str,false,false,false,false,false,false,false);
                    if ( couvert > 0 ) then
                     begin
                      str:='#########################%%%%%%%%%%%%%%%%%%%%%%';
                      str:=dm.organizarCupom(str,'Couvert:','#');
                      str:=dm.organizarCupom(str,dm.alinha_valor_a_direita(20, FormatFloat('R$ ###,###,##0.00', (couvert) )),'%');
                      dm.imprime_linha_impNF(marca,modelo,str,false,false,false,false,false,false,false);
                    end;

                    if (txServico > 0 ) then
                     begin
                      str:='#########################%%%%%%%%%%%%%%%%%%%%%%';
                      str:=dm.organizarCupom(str,'Serv.(opcional)','#');
                      str:=dm.organizarCupom(str,dm.alinha_valor_a_direita(20, FormatFloat('R$ ###,###,##0.00', (txServico) )),'%');
                      dm.imprime_linha_impNF(marca,modelo,str,false,false,false,false,false,false,false);

                     end;

                    if (repique > 0 ) then
                      begin
                      str:='#########################%%%%%%%%%%%%%%%%%%%%%%';
                      str:=dm.organizarCupom(str,'Repique:','#');
                      str:=dm.organizarCupom(str,dm.alinha_valor_a_direita(20, FormatFloat('R$ ###,###,##0.00', (repique) )),'%');
                      dm.imprime_linha_impNF(marca,modelo,str,false,false,false,false,false,false,false);
                     end;


                    if ( desconto > 0 ) then
                     begin
                      str:='#########################%%%%%%%%%%%%%%%%%%%%%%';
                      str:=dm.organizarCupom(str,'Desconto','#');
                      str:=dm.organizarCupom(str,dm.alinha_valor_a_direita(20, FormatFloat('R$ ###,###,##0.00', (desconto) )),'%');
                      dm.imprime_linha_impNF(marca,modelo,str,false,false,false,false,false,false,false);
                     end;

                    if ( (totalPago > 0) and (tipo = 1)) then
                     begin
                      str:='#########################%%%%%%%%%%%%%%%%%%%%%%';
                      str:=dm.organizarCupom(str,'Total real da conta:','#');
                      str:=dm.organizarCupom(str,dm.alinha_valor_a_direita(20, FormatFloat('R$ ###,###,##0.00', (totalConta+totalPago) )),'%');
                      dm.imprime_linha_impNF(marca,modelo,str,false,false,false,false,false,false,false);

                      str:='*******************************&&&&&&&&&&&&&&&&&';
                      str:=dm.organizarCupom(str,'','*');
                      str:=dm.organizarCupom(str,'------------------','&');
                      dm.imprime_linha_impNF(1,1,str,true,false,false,false,false,false,false);

                      str:='#########################%%%%%%%%%%%%%%%%%%%%%%';
                      str:=dm.organizarCupom(str,'Valor restante:','#');
                      str:=dm.organizarCupom(str,dm.alinha_valor_a_direita(20, FormatFloat('R$ ###,###,##0.00', (totalConta) )),'%');
                      dm.imprime_linha_impNF(marca,modelo,str,true,false,false,false,false,false,false);
                     end
                    else
                     begin
                       str:='*******************************&&&&&&&&&&&&&&&&&';
                       str:=dm.organizarCupom(str,'','*');
                       str:=dm.organizarCupom(str,'------------------','&');
                       dm.imprime_linha_impNF(1,1,str,true,false,false,false,false,false,false);

                      str:='#########################%%%%%%%%%%%%%%%%%%%%%%';
                      str:=dm.organizarCupom(str,'TOTAL DA CONTA:','#');
                      str:=dm.organizarCupom(str,dm.alinha_valor_a_direita(20, FormatFloat('R$ ###,###,##0.00', (totalConta) )),'%');
                      dm.imprime_linha_impNF(marca,modelo,str,true,false,false,false,false,false,false);
                     end;

                    if (nPessoas >  1) then
                     begin
                       dm.imprime_linha_impNF(marca,modelo,'------------------------------------------------',true,false,false,false,false,false,false);
                       dm.imprime_linha_impNF(marca,modelo,dm.centralizar('DIVISAO DA CONTA',60),true,false,false,true,true,false,false);

                       str:='#########################%%%%%%%%%%%%%%%%%%%%%%';
                       str:=dm.organizarCupom(str,'N. Pessoas:','#');
                       str:=dm.organizarCupom(str,dm.alinha_valor_a_direita(20, Inttostr(nPessoas) ),'%');
                       dm.imprime_linha_impNF(marca,modelo,str,false,false,false,false,false,false,false);

                       str:='#########################%%%%%%%%%%%%%%%%%%%%%%';
                       str:=dm.organizarCupom(str,'Vl. por pessoa:','#');
                       str:=dm.organizarCupom(str,dm.alinha_valor_a_direita(20, FormatFloat('R$ ###,###,##0.00', (totalConta/nPessoas))),'%');
                       dm.imprime_linha_impNF(marca,modelo,str,false,false,false,false,false,false,false);
                     end;



                     if ( (totalPago > 0) and (layout =2)) then
                     begin
                        dm.imprime_linha_impNF(marca,modelo,'------------------------------------------------',false,false,false,false,false,false,false);
                        str:='#########################%%%%%%%%%%%%%%%%%%%%%%';
                        str:=dm.organizarCupom(str,'Total pago:','#');
                        str:=dm.organizarCupom(str,alinha_valor_a_direita(10,FormatFloat('R$ ###,###,##0.00 ',totalPago)),'%');
                        dm.imprime_linha_impNF(marca,modelo,str,false,false,false,false,false,false,false);
                     end;




                    if (troco > 0) then
                     begin
                       str:='#########################%%%%%%%%%%%%%%%%%%%%%%';
                       str:=dm.organizarCupom(str,'Troco:','#');
                       str:=dm.organizarCupom(str,alinha_valor_a_direita(10,FormatFloat('R$ ###,###,##0.00 ',troco)),'%');
                      dm.imprime_linha_impNF(marca,modelo,str,false,false,false,false,false,false,false);
                     end;

                    dm.imprime_linha_impNF(marca,modelo,'------------------------------------------------',false,false,false,false,false,false,false);
                    dm.imprime_linha_impNF(marca,modelo,dm.centralizar('Doc. de conferência',40),true,false,false,false,false,false,false);
                    dm.imprime_linha_impNF(marca,modelo,dm.centralizar('Não tem valor fiscal',40),true,false,false,true,false,false,false);
                    dm.imprime_linha_impNF(marca,modelo,dm.centralizar('Aguarde o seu cupom fiscal',40),true,false,false,true,false,false,false);
                    dm.imprime_linha_impNF(marca,modelo,'------------------------------------------------',false,false,false,false,false,false,false);
                end;
           end;
         end;
      2: begin
           case modelo of
             2: begin

                   //zarCupom(str,alinha_valor_a_direita(10, FormatFloat('R$ ###,###,##0.00 ',qryExtrato.fieldbyname('total').value)),'%');
                    formato:='#################################%%%%%%%%%%%%%';
                    dm.imprime_linha_impNF(marca,modelo,'------------------------------------------------',false,false,false,true,false,false,false);
                    str:=formato;
                    str:=dm.organizarCupom(str,'N. Pessoas:','#');
                    str:=dm.organizarCupom(str,Inttostr(nPessoas),'%');
                    dm.imprime_linha_impNF(marca,modelo,str,false,false,false,false,false,false,false);




                    str:=formato;
                    str:=dm.organizarCupom(str,'Subtotal:','#');
                    str:=dm.organizarCupom(str,FormatFloat('R$ ###,###,##0.00 ',subtotal),'%');
                    dm.imprime_linha_impNF(marca,modelo,str,false,false,false,false,false,false,false);


                    if ( couvert > 0 ) then
                     begin
                      str:=formato;
                      str:=dm.organizarCupom(str,'Couvert:','#');
                      str:=dm.organizarCupom(str,FormatFloat('R$ ###,###,##0.00 ',couvert),'%');
                      dm.imprime_linha_impNF(marca,modelo,str,false,false,false,false,false,false,false);
                    end;

                    if (txServico > 0 ) then
                     begin
                      str:=formato;
                      str:=dm.organizarCupom(str,'Serv.(opcional):','#');
                      str:=dm.organizarCupom(str,FormatFloat('R$ ###,###,##0.00 ',txServico),'%');
                      dm.imprime_linha_impNF(marca,modelo,str,false,false,false,false,false,false,false);
                     end;

                    if (repique > 0 ) then
                     begin
                      str:=formato;
                      str:=dm.organizarCupom(str,'Repique :','#');
                      str:=dm.organizarCupom(str,FormatFloat('R$ ###,###,##0.00 ',repique),'%');
                      dm.imprime_linha_impNF(marca,modelo,str,false,false,false,false,false,false,false);
                     end;

                    if ( desconto > 0 ) then
                     begin
                      str:=formato;
                      str:=dm.organizarCupom(str,'Desconto:','#');
                      str:=dm.organizarCupom(str,FormatFloat('R$ ###,###,##0.00 ',desconto),'%');
                      dm.imprime_linha_impNF(marca,modelo,str,false,false,false,false,false,false,false);
                     end;



                    str:=formato;
                    str:=dm.organizarCupom(str,'Vl. por pessoa:','#');
                    str:=dm.organizarCupom(str,FormatFloat('R$ ###,###,##0.00 ',( (totalConta) /nPessoas)),'%');
                    dm.imprime_linha_impNF(marca,modelo,str,false,false,false,false,false,false,false);

                    dm.imprime_linha_impNF(marca,modelo,'  ',false,false,false,false,false,false,false);

                    formato:='####################%%%%%%%%%%%%%%%%%%%%%';
                    str:=formato;

                    str:=formato;
                    if ( (totalPago > 0) and (tipo = 1)) then
                     begin
                      str:=dm.organizarCupom(str,'Total real da conta:','#');
                      str:=dm.organizarCupom(str,FormatFloat('R$ ###,###,##0.00 ',totalConta+totalPago),'%');
                      dm.imprime_linha_impNF(marca,modelo,str,true,false,false,false,false,false,false);
                      str:=formato;
                      str:=dm.organizarCupom(str,'Valor restante:','#');
                      str:=dm.organizarCupom(str,FormatFloat('R$ ###,###,##0.00 ',totalConta),'%');
                      dm.imprime_linha_impNF(marca,modelo,str,true,false,false,false,false,false,false);
                     end
                    else
                     begin
                      str:=dm.organizarCupom(str,'Total da conta:','#');
                      str:=dm.organizarCupom(str,FormatFloat('<e>R$ ###,###,##0.00 ',totalConta   ),'%');
                      dm.imprime_linha_impNF(marca,modelo,str,true,false,false,false,false,false,false);
                     end;




                    str:=dm.organizarCupom(str,'Total da conta:','#');
                    str:=dm.organizarCupom(str,FormatFloat('<e>R$ ###,###,##0.00 ',totalConta),'%');
                    dm.imprime_linha_impNF(marca,modelo,str,true,false,false,false,false,false,false);


                     if ( (totalPago > 0) and (layout =2)) then
                     begin
                        str:=formato;
                        str:=dm.organizarCupom(str,'Total pago:','#');
                        str:=dm.organizarCupom(str,alinha_valor_a_direita(10,FormatFloat('R$ ###,###,##0.00 ',totalPago)),'%');
                        dm.imprime_linha_impNF(marca,modelo,str,false,false,false,false,false,false,false);
                     end;

                    if (troco > 0) then
                     begin
                        str:=formato;
                        str:=dm.organizarCupom(str,'Troco:','#');
                        str:=dm.organizarCupom(str,alinha_valor_a_direita(10,FormatFloat('R$ ###,###,##0.00 ',troco)),'%');
                      dm.imprime_linha_impNF(marca,modelo,str,false,false,false,false,false,false,false);
                     end;


                    dm.imprime_linha_impNF(marca,modelo,'------------------------------------------------',false,false,false,true,false,false,false);
                    dm.imprime_linha_impNF(marca,modelo,dm.centralizar('Doc. de conferencia',40),false,false,false,false,false,false,false);
                    dm.imprime_linha_impNF(marca,modelo,dm.centralizar('Nao tem valor fiscal',40),true,false,false,true,false,false,false);
                    dm.imprime_linha_impNF(marca,modelo,dm.centralizar('Aguarde o seu cupom fiscal',40),true,false,false,true,false,false,false);
                    dm.imprime_linha_impNF(marca,modelo,'------------------------------------------------',false,false,false,true,false,false,false);

                end;
           end;
         end;
      3: begin

         end;
      4: begin
           case modelo of
            1: begin
                    formato:='#####################%%%%%%%%%%%%%%';
                    dm.imprime_linha_impNF(marca,modelo,'------------------------------------------------',false,false,false,true,false,false,false);
                    str:=formato;
                    str:=dm.organizarCupom(str,'N. Pessoas:','#');
                    str:=dm.organizarCupom(str,Inttostr(nPessoas),'%');
                    dm.imprime_linha_impNF(marca,modelo,str,false,false,false,false,true,false,false);

                    str:=formato;
                    str:=dm.organizarCupom(str,'Subtotal:','#');
                    str:=dm.organizarCupom(str,FormatFloat('R$ ###,###,##0.00 ',subtotal),'%');
                    dm.imprime_linha_impNF(marca,modelo,str,false,false,false,false,true,false,false);


                    if ( couvert > 0 ) then
                     begin
                      str:=formato;
                      str:=dm.organizarCupom(str,'Couvert:','#');
                      str:=dm.organizarCupom(str,FormatFloat('R$ ###,###,##0.00 ',couvert),'%');
                      dm.imprime_linha_impNF(marca,modelo,str,false,false,false,false,true,false,false);
                    end;

                    if (txServico > 0 ) then
                     begin
                      str:=formato;
                      str:=dm.organizarCupom(str,'Serv.(opcional):','#');
                      str:=dm.organizarCupom(str,FormatFloat('R$ ###,###,##0.00 ',txServico),'%');
                      dm.imprime_linha_impNF(marca,modelo,str,false,false,false,false,true,false,false);
                     end;


                    if (repique > 0 ) then
                     begin
                      str:=formato;
                      str:=dm.organizarCupom(str,'Repique):','#');
                      str:=dm.organizarCupom(str,FormatFloat('R$ ###,###,##0.00 ',repique),'%');
                      dm.imprime_linha_impNF(marca,modelo,str,false,false,false,false,true,false,false);
                     end;


                    if ( desconto > 0 ) then
                     begin
                      str:=formato;
                      str:=dm.organizarCupom(str,'Desconto:','#');
                      str:=dm.organizarCupom(str,FormatFloat('R$ ###,###,##0.00 ',desconto),'%');
                      dm.imprime_linha_impNF(marca,modelo,str,false,false,false,false,true,false,false);
                     end;





                    str:=formato;
                    str:=dm.organizarCupom(str,'Vl. por pessoa:','#');
                    str:=dm.organizarCupom(str,FormatFloat('R$ ###,###,##0.00 ',(totalConta/nPessoas)),'%');
                    dm.imprime_linha_impNF(marca,modelo,str,false,false,false,false,true,false,false);

                    str:=formato;




                    str:=formato;
                    if ( (totalPago > 0) and (tipo = 1)) then
                     begin
                      str:=dm.organizarCupom(str,'Total real da conta:','#');
                      str:=dm.organizarCupom(str,FormatFloat('R$ ###,###,##0.00 ',totalConta+totalPago),'%');
                      dm.imprime_linha_impNF(marca,modelo,str,true,false,false,false,true,false,false);
                      str:=formato;
                      str:=dm.organizarCupom(str,'Valor restante:','#');
                      str:=dm.organizarCupom(str,FormatFloat('R$ ###,###,##0.00 ',totalConta),'%');
                      dm.imprime_linha_impNF(marca,modelo,str,true,false,false,false,true,false,false);
                     end
                    else
                     begin
                      str:=dm.organizarCupom(str,'Total da conta:','#');
                      str:=dm.organizarCupom(str,FormatFloat('R$ ###,###,##0.00 ',totalConta   ),'%');
                     dm.imprime_linha_impNF(marca,modelo,str,true,false,false,false,true,false,false);
                     end;




                    if ( (totalPago > 0) and (layout =2)) then
                     begin
                        str:=formato;
                        str:=dm.organizarCupom(str,FormatFloat('R$ ###,###,##0.00 ',totalPago),'%');
                        dm.imprime_linha_impNF(marca,modelo,str,false,false,false,false,true,false,false);
                     end;


                    if (troco > 0) then
                     begin
                        str:=formato;
                        str:=dm.organizarCupom(str,'Troco:','#');
                        str:=dm.organizarCupom(str,FormatFloat('R$ ###,###,##0.00 ',troco),'%');
                        dm.imprime_linha_impNF(marca,modelo,str,false,false,false,false,true,false,false);
                     end;

                    dm.imprime_linha_impNF(marca,modelo,'------------------------------------------------',false,false,false,true,false,false,false);
                    dm.imprime_linha_impNF(marca,modelo,dm.centralizar('Documento para simples conferência',48),false,false,false,true,false,false,false);
                    dm.imprime_linha_impNF(marca,modelo,dm.centralizar('Não tem valor fiscal',48),true,false,false,true,false,false,false);
                    dm.imprime_linha_impNF(marca,modelo,'------------------------------------------------',false,false,false,true,false,false,false);



               end;


         end;

         end;

      5: begin  // Epson
            case modelo of
             1:  begin    // Térmica TM-T88II
                    dm.imprime_linha_impNF(marca,modelo,'--------------------------------------------------------',false,false,false,true,false,false,false);
                    str:='##########################%%%%%%%%%%%%%%';
                    str:=dm.organizarCupom(str,'Subtotal:','#');
                    str:=dm.organizarCupom(str,dm.alinha_valor_a_direita(12, FormatFloat('R$ ###,###,##0.00', (subtotal) )),'%');
                    dm.imprime_linha_impNF(marca,modelo,str,false,false,false,false,true,false,false);
                    if ( couvert > 0 ) then
                     begin
                    str:='##########################%%%%%%%%%%%%%%';
                      str:=dm.organizarCupom(str,'Couvert:','#');
                      str:=dm.organizarCupom(str,dm.alinha_valor_a_direita(12, FormatFloat('R$ ###,###,##0.00', (couvert) )),'%');
                    dm.imprime_linha_impNF(marca,modelo,str,false,false,false,false,true,false,false);
                    end;

                    if (txServico > 0 ) then
                     begin
                      str:='##########################%%%%%%%%%%%%%%';
                      str:=dm.organizarCupom(str,'Serv.(opcional):','#');
                      str:=dm.organizarCupom(str,dm.alinha_valor_a_direita(12, FormatFloat('R$ ###,###,##0.00', (txServico) )),'%');
                      dm.imprime_linha_impNF(marca,modelo,str,false,false,false,false,true,false,false);
                     end;

                    if (repique > 0 ) then
                      begin
                      str:='##########################%%%%%%%%%%%%%%';
                      str:=dm.organizarCupom(str,'Repique:','#');
                      str:=dm.organizarCupom(str,dm.alinha_valor_a_direita(12, FormatFloat('R$ ###,###,##0.00', (repique) )),'%');
                      dm.imprime_linha_impNF(marca,modelo,str,false,false,false,false,true,false,false);
                     end;


                    if ( desconto > 0 ) then
                     begin
                      str:='##########################%%%%%%%%%%%%%%';
                      str:=dm.organizarCupom(str,'Desconto','#');
                      str:=dm.organizarCupom(str,dm.alinha_valor_a_direita(12, FormatFloat('R$ ###,###,##0.00', (desconto) )),'%');
                      dm.imprime_linha_impNF(marca,modelo,str,false,false,false,false,true,false,false);
                     end;

                    if ( (totalPago > 0) and (tipo = 1)) then
                     begin
                      str:='##########################%%%%%%%%%%%%%%';
                      str:=dm.organizarCupom(str,'Total real da conta:','#');
                      str:=dm.organizarCupom(str,dm.alinha_valor_a_direita(12, FormatFloat('R$ ###,###,##0.00', (totalConta+totalPago) )),'%');
                      dm.imprime_linha_impNF(marca,modelo,str,false,false,false,false,true,false,false);


                      str:='*************************&&&&&&&&&&&&&&&';
                      str:=dm.organizarCupom(str,'','*');
                      str:=dm.organizarCupom(str,'-------------------','&');
                      dm.imprime_linha_impNF(marca,modelo,str,true,false,false,false,false,false,false);

                      str:='##########################%%%%%%%%%%%%%%';
                      str:=dm.organizarCupom(str,'Valor restante:','#');
                      str:=dm.organizarCupom(str,dm.alinha_valor_a_direita(12, FormatFloat('R$ ###,###,##0.00', (totalConta) )),'%');
                      dm.imprime_linha_impNF(marca,modelo,str,true,false,false,false,true,false,false);
                     end
                    else
                     begin
                      str:='*************************&&&&&&&&&&&&&&&';
                      str:=dm.organizarCupom(str,'','*');
                      str:=dm.organizarCupom(str,'-------------------','&');
                      dm.imprime_linha_impNF(marca,modelo,str,true,false,false,false,false,false,false);

                      str:='##########################%%%%%%%%%%%%%%';
                      str:=dm.organizarCupom(str,'TOTAL DA CONTA:','#');
                      str:=dm.organizarCupom(str,dm.alinha_valor_a_direita(12, FormatFloat('R$ ###,###,##0.00', (totalConta) )),'%');
                      dm.imprime_linha_impNF(marca,modelo,str,true,false,false,false,false,false,false);
                     end;

                    if (nPessoas >  1) then
                     begin
                       dm.imprime_linha_impNF(marca,modelo,'--------------------------------------------------------',false,false,false,true,false,false,false);
                       dm.imprime_linha_impNF(marca,modelo,dm.centralizar('DIVISAO DA CONTA',60),true,false,false,true,true,false,false);

                       str:='##########################%%%%%%%%%%%%%%';
                       str:=dm.organizarCupom(str,'N. Pessoas:','#');
                       str:=dm.organizarCupom(str,dm.alinha_valor_a_direita(12, Inttostr(nPessoas) ),'%');
                       dm.imprime_linha_impNF(marca,modelo,str,true,false,false,false,false,false,false);

                       str:='##########################%%%%%%%%%%%%%%';
                       str:=dm.organizarCupom(str,'Vl. por pessoa:','#');
                       str:=dm.organizarCupom(str,dm.alinha_valor_a_direita(12, FormatFloat('R$ ###,###,##0.00', (totalConta/nPessoas))),'%');
                       dm.imprime_linha_impNF(marca,modelo,str,true,false,false,false,false,false,false);
                     end;



                     if ( (totalPago > 0) and (layout =2)) then
                     begin
                        dm.imprime_linha_impNF(marca,modelo,'--------------------------------------------------------',false,false,false,true,false,false,false);
                        str:='##########################%%%%%%%%%%%%%%';
                        str:=dm.organizarCupom(str,'TOTAL PAGO:    ','#');
                        str:=dm.organizarCupom(str,dm.alinha_valor_a_direita(12, FormatFloat('R$ ###,###,##0.00',totalPago )),'%');
                        dm.imprime_linha_impNF(marca,modelo,str,true,false,false,false,false,false,false);
                     end;




                    if (troco > 0) then
                     begin
                        str:='##########################%%%%%%%%%%%%%%';
                        str:=dm.organizarCupom(str,'Troco:','#');
                        str:=dm.organizarCupom(str,alinha_valor_a_direita(12,FormatFloat('R$ ###,###,##0.00 ',troco)),'%');
                        dm.imprime_linha_impNF(marca,modelo,str,true,false,false,false,false,false,false);
                     end;

                    dm.imprime_linha_impNF(marca,modelo,'--------------------------------------------------------',false,false,false,true,false,false,false);
                    dm.imprime_linha_impNF(marca,modelo,dm.centralizar('Doc. de conferência',40),true,false,false,false,false,false,false);
                    dm.imprime_linha_impNF(marca,modelo,dm.centralizar('Não tem valor fiscal',40),true,false,false,false,false,false,false);
                    dm.imprime_linha_impNF(marca,modelo,dm.centralizar('Aguarde o seu cupom fiscal',40),true,false,false,false,false,false,false);
                    dm.imprime_linha_impNF(marca,modelo,'--------------------------------------------------------',false,false,false,true,false,false,false);
                 end;
          end;

         end;
    end;

   dm.imprime_linha_impNF(marca,modelo,'',false,false,false,true,false,false,false);
   dm.imprime_linha_impNF(marca,modelo,'',false,false,false,true,false,false,false);
   dm.imprime_linha_impNF(marca,modelo,'',false,false,false,true,false,false,false);
   dm.imprime_linha_impNF(marca,modelo,'',false,false,false,true,false,false,false);
   dm.imprime_linha_impNF(marca,modelo,'',false,false,false,true,false,false,false);
   dm.imprime_linha_impNF(marca,modelo,'',false,false,false,true,false,false,false);
   dm.imprime_linha_impNF(marca,modelo,'',false,false,false,true,false,false,false);
   dm.imprime_linha_impNF(marca,modelo,'',false,false,false,true,false,false,false);

//   cortaPapelImpNF(marca,modelo);
end;





procedure Tdm.exibe_painel_erro(mensagem : string; captionBotao: string);
begin
{
  Application.CreateForm(Tfrm_painel_erros,frm_painel_erros);
  frm_painel_erros.Memo1.lines.add(mensagem);
//  frm_painel_erros.BitBtn1.Caption:=captionBotao;
  frm_painel_erros.Showmodal;
  FreeAndNil(frm_painel_erros);
 }

  if TDialogMessage.ShowMessageDialog(
    mensagem,
    'Atenção',
    mtError,
    ['Fechar'],
    1,
    1
    ) = 1  then
     begin

     end;

end;

procedure Tdm.exibe_painel_troco(mensagem : string; troco : string);
begin
  Application.CreateForm(TfrmPainelTroco,frmPainelTroco);
//  frmPainelTroco.Memo1.lines.add(mensagem);
  frmPainelTroco.pn_troco.Caption := troco;
  frmPainelTroco.Showmodal;
  FreeAndNil(frmPainelTroco);


end;

function Tdm.painelDePergunta(mensagem : string ; tamFonte : integer) : boolean;
begin
  Application.CreateForm(TfrmPergunta,frmPergunta);
  frmPergunta.Memo1.lines.add(mensagem);
  frmPergunta.Memo1.Font.Size := tamFonte;
  frmPergunta.Showmodal;
  FreeAndNil(frmPergunta);
  Result := respostaPergunta;
end;



procedure Tdm.EncerraPainelDeErros();
begin
  frm_painel_erros.close;
end;


procedure Tdm.imprimirFichas(codVenda : string);
var
 q : TIBQuery;
 ct : smallint;
begin

  q := TIBquery.create(self);
  q.Database := dm.dbrestaurante;
  q.Transaction := dm.transacao;

  q.Active := false;
  q.SQL.Clear;

  q.SQL.Add('  select mv.id,p.descricao, mv.quantidade   from movimento_venda mv ');
  q.SQL.Add('   inner join produtos p on (p.cod_produto = mv.cod_produto)');
  q.SQL.Add('    where mv.cod_venda='+Quotedstr(codVenda));
  q.SQL.Add('     and p.imprimir_ficha=1 ');
  q.Active := true;
  q.FetchAll;

  if not q.IsEmpty then
   begin


      If FileExists(caminhoArquivoExtrato) then DeleteFile(caminhoArquivoExtrato);

      while not q.Eof  do
       begin
          for ct := 1 to q.FieldByName('quantidade').value do
           begin
             adicionaLinhaArquivoExtrato('</zera>  ');
             adicionaLinhaArquivoExtrato('</linha_dupla>');
             adicionaLinhaArquivoExtrato('<ce><e>'+nome_fantasia+'</e></ce>');
             adicionaLinhaArquivoExtrato('</linha_dupla>');
             adicionaLinhaArquivoExtrato(FormatDateTime('DD/MM/YYY',DATE)+' '+FormatDateTime('HH:MM:SS',time));
             adicionaLinhaArquivoExtrato('Caixa Nº: '+ultimoCaixaAberto);
             adicionaLinhaArquivoExtrato('Operador: '+nome_usuario_responsavel);
             adicionaLinhaArquivoExtrato('<ce><e>Ficha id nº '+Inttostr(q.FieldByName('id').value)+'</e></ce>');
//             adicionaLinhaArquivoExtrato('</ce><e>'+Inttostr(ct)+' de '+Inttostr(q.FieldByName('quantidade').value)+'</e>');
             adicionaLinhaArquivoExtrato('</linha_simples>');
             adicionaLinhaArquivoExtrato('<e>'+q.FieldByName('descricao').value+'</e>');
             adicionaLinhaArquivoExtrato('</linha_simples>');
             adicionaLinhaArquivoExtrato('</ce><ean13>'+Inttostr(q.FieldByName('id').value)+'</ean13>');
             adicionaLinhaArquivoExtrato('</fn><ce>Válida por até 2 horas após a compra </ce>');
             adicionaLinhaArquivoExtrato('</linha_simples>');
             adicionaLinhaArquivoExtrato('</corte_parcial>');

           end;

          q.Next;
       end;

      ACBrPosPrinter1.LinhasEntreCupons := StrToInt(dm.LeIni(1,'IMPRESSORA_NAO_FISCAL_01','linhasAposCupom'));
      frm_principal.memo_avisos.Lines.LoadFromFile(caminhoArquivoExtrato);
      dm.adicionaLog(frm_principal.memo_avisos.Lines.Text);
      dm.imprimeTexoMiniPrinter();

   end;


   q.Active := false;
   FreeAndNil(q);

end;


function Tdm.verificaPermissaoAcao(modulo : string) : boolean;
begin


{
 if ( StrToInt(dm.LeIni(2,'CAIXA','estacaoLancamentoSalao') ) =1 ) then
  begin
    result:=false;
    exit;
  end;
  }



 codigo_usuario_responsavel:=codigo_usuario;
 nome_usuario_responsavel:=nome_usuario;
 nome_comp_usuario_responsavel:=nome_comp_usuario_responsavel;

 if( dm.verifica_permissao(Trim(copy(modulo,2,5)),
     Trim(copy(modulo,7,15)),codigo_usuario,false)  = False )
   then
     begin

      Application.CreateForm(TfrmLoginTouch ,frmLoginTouch);
      frmLoginTouch.tipo_teste:=1;
      frmLoginTouch.ShowModal;
      frmLoginTouch.free;


        if( dm.verifica_permissao(Trim(copy(modulo,2,5)),
           Trim(copy(modulo,7,15)),codigo_usuario_responsavel,false)  = true )
         then
           Result:=true
       else
          Result:=false
     end
   else
     Result:=true;

   if Result = false then
    begin
      Showmessage('Sem permissão para a ação escolhida!');
    end;

end;





function Tdm.verifica_intervalo_hora(horaIni : string; horaFim : string) : boolean;
var
 horaInicial, minutoInicial : integer;
 horaFinal, minutoFinal : integer;
begin
  horaInicial   := StrToInt(  copy(horaIni,0,2));
  minutoInicial := StrToInt(  copy(horaIni,3,2));

  horaFinal     := StrToInt(  copy(horaFim,0,2));
  minutoFinal   := StrToInt(  copy(horaFim,3,2));

  if (horaInicial <> horaFinal) then
   begin
     Result:=false;
   end
  else
   begin
     minutoInicial:= minutoInicial - minutoFinal;
     if (moduloNumero(minutoInicial) > 15) then
       Result:=false
     else
       Result:=true;
   end;
end;

function Tdm.moduloNumero(numero : integer) : integer;
begin
  if (numero < 0) then
    numero:=numero * -1;

  result:= numero;
end;




function Tdm.asteriscos(qtd : integer) : string;
var
 cont : integer;
begin
  cont:=0;
  while (cont <= qtd ) do
  begin
    result:=result+'*';
    cont:=cont+1;
  end;
end;
// * * * Dica extraída do Deephi 2.0 * * * //
// * * * * [Evoluindo sem Limites] * * * * //
// * * * * Número: 0197 Testada:  * * * * //

function Tdm.PadC(S:string; Len:byte):string;
var
 Str:String;
 L:byte;
begin
str :='';
if len < Length(s) then begin
  Result := '';
  Exit;
  end;
l:=(Len-Length(S)) div 2;
while l > 0 do begin
  str:=str+' ';
  dec(l);
  end;
for l:=1 to length(S) do begin
  str := str+s[L];
  end;
 Result := str;
end;






function Tdm.BuscaTroca(Text,Busca,Troca : string) : string;
var n : integer;
achou : boolean;
begin
  n:=0;
  achou:=false;

  while( (n <  length(Text)) and (achou=false) ) do//for n := 1 to length(Text) do
  begin
    if Copy(Text,n,1) = Busca then
      begin
        Delete(Text,n,1); Insert(Troca,Text,n);
        achou:=true;
      end;
    n:=n+1;
   end;
  Result := Text;
end;

procedure Tdm.ComPortRxChar(Sender: TObject; Count: Integer);
begin
// Comentado
//  comport.ReadStr(RetornoPorta,count);
  ShowMessage(RetornoPorta);
end;


function Tdm.retiraCaracter(Text,Busca,Troca : string) : string;
var n : integer;
achou : boolean;
begin
  n:=1;


  while( (n <=  length(Text)) ) do//for n := 1 to length(Text) do
  begin
    if Copy(Text,n,1) = Busca then
      begin
        Delete(Text,n,1); Insert(Troca,Text,n);
        achou:=true;
      end;
    n:=n+1;
   end;
  Result := Text;
end;


function Tdm.removeCaracteres(Text : string) : string;
var
n : integer;
total : integer;
contador : integer;
achou : boolean;
chars : array[1..11] of string;
begin
  total:=11;
  contador:=1;


 chars[1]:='ç';
 chars[2]:='Ç';
 chars[3]:=':';
 chars[4]:='?';
 chars[5]:=';';
 chars[6]:='.';
 chars[7]:=',';
 chars[8]:='/';
 chars[9]:='-';
 chars[10]:='R';
 chars[11]:='$';

 while (contador <= total ) do
 begin


  n:=1;
  while( (n <=  length(Text)) ) do//for n := 1 to length(Text) do
  begin
    if Copy(Text,n,1) = chars[contador] then
      begin
        Delete(Text,n,1);
        achou:=true;
      end;
    n:=n+1;
   end;
  contador := contador +1;
 end;

  Result := Text;
end;








function Tdm.organizarCupom(str : string; str2: string; chr : string) : string;
var
ct : integer;
tam : integer;
begin



   tam:=strLen(Pchar(str2));
   ct:=1;
   result:=str;
   while(ct <= tam) do
   begin
     result:=BuscaTroca(result,chr,copy(str2,ct,1));
     ct:=ct+1;
   end;

     Result:=retiraCaracter(result,chr,' ');
end;


function Tdm.trocaCaracteresEpson(str : string) : string;
begin

 str:=BuscaTroca(str,'ç',chr(135));
 str:=BuscaTroca(str,'Ç',chr(128));

 str:=BuscaTroca(str,'é',chr(130));
 str:=BuscaTroca(str,'É',chr(144));
 str:=BuscaTroca(str,'ê',chr(136));
 str:=BuscaTroca(str,'Ê',chr(202));


 str:=BuscaTroca(str,'í',chr(161));



 str:=BuscaTroca(str,'á',chr(160));
 str:=BuscaTroca(str,'â',chr(131));
 str:=BuscaTroca(str,'ã',chr(227));
 str:=BuscaTroca(str,'Á',chr(181));
 str:=BuscaTroca(str,'À',chr(183));
 str:=BuscaTroca(str,'Ã',chr(195));



 str:=BuscaTroca(str,'ô',chr(147));
 str:=BuscaTroca(str,'ó',chr(162));
 Result:=STR;

end;




procedure Tdm.atualizaTentativasEnvioNFCE(observacao : string; codVenda : string);
var
 q : TIBQuery;
begin

 q :=TIBQuery.Create(self);
 q.Database:=DBRESTAURANTE;
 q.Transaction:=transLog;



 q.Active:=false;
 q.SQL.Clear;
 q.SQL.Add(' update vendas v set v.TENTATIVAS_ENVIO_NFCE = TENTATIVAS_ENVIO_NFCE +1,');
 q.SQL.Add('  v.OBS_NFCE='+Quotedstr(observacao));
 q.SQL.Add('  where v.cod_venda='+Quotedstr(codVenda));
 adicionaLog('SQL da tentativa de autualização de tentativas: '+q.SQL.Text);

  try
    begin
      q.ExecSQL;
      dm.adicionaLog('Atualizou tentativas com sucesso!');
    end;
  except
   on E : Exception  do
   begin
     dm.adicionaLog('Erro ao atualizar tentativas de envio de NFC-e '+E.Message);
     exit;
   end;
  end;

  if transLog.Active = false then transLog.Active:=true;
  transLog.Commit;

  FreeAndNil(q);
end;


procedure Tdm.insereExtratosEmitidos(mesa : string; tipo_desconto : smallint; valorDesconto : double; valorCouvert : double; valorServico : double; cooExtrato : string; cerExtrato : string; ecf_extrato : string );
var
 q : TIBQuery;
begin

 q :=TIBQuery.Create(self);
 q.Database:=DBRESTAURANTE;
 q.Transaction:=transLog;



 q.Active:=false;
 q.SQL.Clear;
 q.SQL.Add('insert into extratos_emitidos (mesa,tipo_desconto,valor_desconto, valor_couvert, valor_servico,data,hora_emissao,cod_usuario,cooextrato,cerExtrato,ECF_extrato) values ('+Quotedstr(mesa)+',');
 q.sql.add(''+Inttostr(tipo_desconto)+',');
 q.sql.add(''+TrocaVirgPPto(FloatToStr(valorDesconto))+',');
 q.sql.add(''+TrocaVirgPPto(FloatToStr(valorCouvert))+',');
 q.sql.add(''+TrocaVirgPPto(FloatToStr(valorServico))+',');
 q.sql.add(''+Quotedstr(FormatDateTime('DD.MM.YYY',date ))+',');
 q.sql.add(''+Quotedstr(FormatDateTime('HH:MM:SS',time))+',');
 q.sql.add(''+Quotedstr(codigo_usuario)+',');
 q.sql.add(''+Quotedstr(cooExtrato)+',');
  q.sql.add(''+Quotedstr(cerExtrato)+',');
 q.sql.add(''+Quotedstr(ecf_extrato)+')');

  try
    begin
      q.ExecSQL;
    end;
  except
   begin
     ShowMessage('Ocorreu um erro no sistema!  Um log de erros foi criado no formato DATA+HORA na pasta logs do Sistema. Abra o arquivo e envio por fax ou email para a Real Systems');
     dm.cria_log_de_erros(q.sql,'Módulo de caixa','Erro ao inserir em extratos emitidos',codigo_usuario);
     exit;
   end;
  end;

  if transLog.Active = false then transLog.Active:=true;
  transLog.Commit;

  FreeAndNil(q);
end;

function Tdm.getUltimoExtratoEmitidoMesa(mesa : string) : TExtratoEmitido;
var
 q : TIBQuery;
begin
 q :=TIBQuery.Create(self);
 q.Database:=DBRESTAURANTE;
 q.Transaction:=transLog;

 q.Active:=false;
 q.SQL.Clear;
 q.sql.add('select * from extratos_emitidos where mesa='+Quotedstr(mesa)+' order by hora_emissao');
 q.active:=true;
 q.Last;

 Result:= TextratoEmitido.Create();

 if (q.IsEmpty) then
  begin
    Result.extratoValido :=0;
    Result.tipoDesconto:=   0;
    Result.valorDesconto:=  0;
    Result.valorCouvert:=   0;
    Result.valorServico:=   0;
    Result.codUsuario  :=   '';
  end
 else
  begin
    Result.extratoValido:=   1;
    Result.tipoDesconto:=   q.fieldbyname('tipo_desconto').value;
    Result.valorDesconto:=  q.fieldbyname('valor_desconto').value;
    Result.valorCouvert:=   q.fieldbyname('valor_couvert').value;
    Result.valorServico:=   q.fieldbyname('valor_servico').value;
    Result.codUsuario  :=   q.fieldbyname('cod_usuario').value;
  end;

  FreeAndNil(q);
end;


procedure Tdm.apagaExtratosEmitidos(mesa : string);
var
 q : TIBQuery;
begin

 q :=TIBQuery.Create(self);
 q.Database:=DBRESTAURANTE;
 q.Transaction:=transLog;

 q.Active:=false;
 q.SQL.Clear;
 q.SQL.Add('delete from extratos_emitidos where mesa='+QUotedstr(mesa));

  try
    begin
      q.ExecSQL;
    end;
  except
   begin
     ShowMessage('Ocorreu um erro no sistema!  Um log de erros foi criado no formato DATA+HORA na pasta logs do Sistema. Abra o arquivo e envio por fax ou email para a Real Systems');
     dm.cria_log_de_erros(q.sql,'Módulo de caixa','Erro ao apagar  extratos emitidos',codigo_usuario);
     exit;
   end;
  end;

  if transLog.Active = false then transLog.Active:=true;
  transLog.Commit;

  FreeAndNil(q);

end;





procedure Tdm.ApagaAberturaDaMesa(mesa : string);
var
 q : TIBQuery;
begin

 q :=TIBQuery.Create(self);
 q.Database:=DBRESTAURANTE;
 q.Transaction:=transLog;

 q.Active:=false;
 q.SQL.Clear;
 q.SQL.Add('delete from informacoes_mesa where mesa='+QUotedstr(mesa));

  try
    begin
      q.ExecSQL;
    end;
  except
   begin
     ShowMessage('Ocorreu um erro no sistema!  Um log de erros foi criado no formato DATA+HORA na pasta logs do Sistema. Abra o arquivo e envio por fax ou email para a Real Systems');
     dm.cria_log_de_erros(q.sql,'Módulo de caixa','Erro ao apagar LOG de MESA',codigo_usuario);
     exit;
   end;
  end;

  if transLog.Active = false then transLog.Active:=true;
  transLog.Commit;

  FreeAndNil(q);
end;




function Tdm.verificaExtratosEmitidos(mesa : string) : boolean;
var
 q : TIBquery;
begin
 q :=TIBQuery.Create(self);
 q.Database:=DBRESTAURANTE;
 q.Transaction:=transacao;

 q.Active:=false;
 q.SQL.Clear;
 q.sql.add('select * from extratos_emitidos where mesa='+Quotedstr(mesa));
 q.active:=true;

 if q.isempty then
   result:=false
 else
   result:=true;

 q.Active:=false;
// Q.Destroy;
 FreeAndNil(q);


end;


procedure TDM.imprimeListagemMesasAbertas(marca : integer; modelo : integer);
var
 q : TIBquery;
 str : string;
begin

 q :=TIBQuery.Create(self);
 q.Database:=DBRESTAURANTE;
 q.transaction:=transacao;
 q.active:=false;
 q.sql.clear;
 q.sql.add('select sum(quantidade),cod_mesa from movimento_mesa group by cod_mesa');
 q.active:=true;
 q.first;


  case marca of
    2: begin
         case modelo of
           2: begin
                dm.imprime_linha_impNF(marca,modelo,dm.centralizar(nome_fantasia,24),true,false,false,true,false,true,false);
                dm.imprime_linha_impNF(marca,modelo,'------------------------------------------------',false,false,false,true,false,false,false);
                dm.imprime_linha_impNF(marca,modelo,dm.centralizar('Mesas abertas',24),true,false,false,true,false,true,false);
                str:=FormatDateTime('DD/MM/YYY',DATE)+' '+FormatDateTime('HH:MM:SS',time);
                dm.imprime_linha_impNF(marca,modelo,str,false,false,false,false,true,false,false);
                str:='Operador: '+nome_usuario;
                dm.imprime_linha_impNF(marca,modelo,str,false,false,false,false,true,false,false);
                dm.imprime_linha_impNF(marca,modelo,'------------------------------------------------',false,false,false,true,false,false,false);

                while not q.Eof  do
                begin
                   dm.imprime_linha_impNF(marca,modelo,q.fieldbyname('cod_mesa').value,false,false,false,true,false,false,false);
                   q.Next;
                end;


              end;
         end;

       end;




    4: begin
         case modelo of
           1: begin
                dm.imprime_linha_impNF(marca,modelo,dm.centralizar(nome_fantasia,24),true,false,false,true,false,true,false);
                dm.imprime_linha_impNF(marca,modelo,'------------------------------------------------',false,false,false,true,false,false,false);
                dm.imprime_linha_impNF(marca,modelo,dm.centralizar('Mesas abertas',24),true,false,false,true,false,true,false);
                str:=FormatDateTime('DD/MM/YYY',DATE)+' '+FormatDateTime('HH:MM:SS',time);
                dm.imprime_linha_impNF(marca,modelo,str,false,false,false,false,true,false,false);
                str:='Operador: '+nome_usuario;
                dm.imprime_linha_impNF(marca,modelo,str,false,false,false,false,true,false,false);
                dm.imprime_linha_impNF(marca,modelo,'------------------------------------------------',false,false,false,true,false,false,false);

                while not q.Eof  do
                begin
                   dm.imprime_linha_impNF(marca,modelo,q.fieldbyname('cod_mesa').value,false,false,false,true,false,false,false);
                   q.Next;
                end;


              end;
         end;
       end;

    5: begin
         case modelo of
           1: begin
                dm.imprime_linha_impNF(marca,modelo,dm.centralizar(nome_fantasia,30),true,false,false,true,false,true,false);
                dm.imprime_linha_impNF(marca,modelo,'------------------------------------------------',false,false,false,true,false,false,false);
                dm.imprime_linha_impNF(marca,modelo,dm.centralizar('Mesas abertas',30),true,false,false,true,false,true,false);
                str:=FormatDateTime('DD/MM/YYY',DATE)+' '+FormatDateTime('HH:MM:SS',time);
                dm.imprime_linha_impNF(marca,modelo,str,false,false,false,false,true,false,false);
                str:='Operador: '+nome_usuario;
                dm.imprime_linha_impNF(marca,modelo,str,false,false,false,false,true,false,false);
                dm.imprime_linha_impNF(marca,modelo,'------------------------------------------------',false,false,false,true,false,false,false);

                while not q.Eof  do
                begin
                   dm.imprime_linha_impNF(marca,modelo,q.fieldbyname('cod_mesa').value,false,false,false,true,false,false,false);
                   q.Next;
                end;

              end;
         end;
       end;
  end;

   dm.imprime_linha_impNF(marca,modelo,'',false,false,false,true,false,false,false);
   dm.imprime_linha_impNF(marca,modelo,'',false,false,false,true,false,false,false);
   dm.imprime_linha_impNF(marca,modelo,'',false,false,false,true,false,false,false);
   dm.imprime_linha_impNF(marca,modelo,'',false,false,false,true,false,false,false);
   dm.imprime_linha_impNF(marca,modelo,'',false,false,false,true,false,false,false);
   dm.imprime_linha_impNF(marca,modelo,'',false,false,false,true,false,false,false);
   dm.imprime_linha_impNF(marca,modelo,'',false,false,false,true,false,false,false);
   dm.imprime_linha_impNF(marca,modelo,'',false,false,false,true,false,false,false);

   FreeAndNil(q);

end;


function Tdm.alinha_valor_a_direita(tam_str : integer; str : string) : string;
VAR
 tamanho : integer;
begin
  tamanho:= length(str);
  while (tamanho <= tam_str) do
  begin
    str:=' '+str;
    tamanho:=tamanho+1;
  end;
  result:=str;
end;



function TDM.geraCodigo(AGenerator: string; tam : integer): string;
var
 zeros : string;
 ct : integer;
begin
 ct:=0;

 while ct < tam do
 begin
  zeros:=zeros+'0';
  ct:=ct+1;
 end;
 with TIBQuery.Create(Application) do
 try
   DataBase    := dbrestaurante;
   Transaction := transacao;
   SQL.Text := 'select gen_id(' + AGenerator + ', 1) from rdb$database';
   Open;
   result:=Formatfloat(zeros,Fields[0].AsInteger);
 finally
   Free;
 end;
end;



procedure Tdm.qryVendasCaixaTIPO_VENDAGetText(Sender: TField; var Text: string;
  DisplayText: Boolean);
begin
  Text := EmptyStr;

end;

procedure Tdm.qry_itens_estoqueBeforePost(DataSet: TDataSet);
begin
  dm.qryauxiliar.Active:=false;
  dm.qryauxiliar.SQL.clear;
  dm.qryauxiliar.sql.add('select un.parametro from unidades un where cod_unidade='+Quotedstr(dm.qry_itens_estoque.fieldbyname('unidade_entrada').value));
  dm.qryauxiliar.Active:=true;
  dm.qry_itens_estoque.FieldByName('estoque_liquido').Value :=  dm.qry_itens_estoque.FieldByName('estoque').Value * dm.qryauxiliar.fieldbyname('parametro').value;
end;




function Tdm.verificaExistenciaUsuario(cod_usuario : string) : boolean;
var
  q : TIBquery;

begin
  q:= TIBQuery.Create(Self);
  q.Database:= dbrestaurante;
  q.Transaction:=transacao;

  q.active:=false;
  q.sql.clear;
  q.sql.add('select * from usuarios where cod_usuario='+Quotedstr(cod_usuario));
  q.active:=true;

  result:= not (q.IsEmpty);
  FreeAndNil(q);
end;


procedure Tdm.saltaLinhasMiniPrinter(marca : integer; modelo : integer);
begin
   dm.imprime_linha_impNF(marca,modelo,'',false,false,false,true,false,false,false);
   dm.imprime_linha_impNF(marca,modelo,'',false,false,false,true,false,false,false);
   dm.imprime_linha_impNF(marca,modelo,'',false,false,false,true,false,false,false);
   dm.imprime_linha_impNF(marca,modelo,'',false,false,false,true,false,false,false);
   dm.imprime_linha_impNF(marca,modelo,'',false,false,false,true,false,false,false);
   dm.imprime_linha_impNF(marca,modelo,'',false,false,false,true,false,false,false);
   dm.imprime_linha_impNF(marca,modelo,'',false,false,false,true,false,false,false);
   dm.imprime_linha_impNF(marca,modelo,'',false,false,false,true,false,false,false);
end;

function Tdm.retornaCampoQQTabela(tabela : string; campos : string;cp_pesq: string; param_pesq: string;
  cp_ret : integer) : string;

var
  q : TIBquery;
begin
  q:= TIBQuery.Create(Self);
  q.Database:= dbrestaurante;
  q.Transaction:=transacao;

  q.Active:=false;
  q.SQL.clear;
  q.sql.add('select '+campos+' from '+tabela+' where '+cp_pesq+'='+Quotedstr(param_pesq));
  q.active:=true;

  if (q.IsEmpty = true) then
    Result:='NÃO ENCONTRADO'
  ELSE
    result:= q.fields[cp_ret].AsString;

  FreeAndNil(q);
end;


procedure Tdm.imprimeCabecalhoMiniPrinter(marca : integer; modelo : integer; titulo : string);
var
 str : string;
begin
 case marca of
   2: begin
        case modelo of
           2: begin
                 dm.imprime_linha_impNF(marca,modelo,'------------------------------------------------',false,false,false,true,false,false,false);
                 dm.imprime_linha_impNF(marca,modelo,dm.centralizar(titulo,24),true,false,false,false,false,false,true);
                 str:=FormatDateTime('DD/MM/YYY',DATE)+' '+FormatDateTime('HH:MM:SS',time);
                 dm.imprime_linha_impNF(marca,modelo,str,false,false,false,false,true,false,false);
                 str:='Operador: '+nome_usuario;
                 dm.imprime_linha_impNF(marca,modelo,str,false,false,false,false,true,false,false);
                 dm.imprime_linha_impNF(marca,modelo,'------------------------------------------------',false,false,false,true,false,false,false);
              end;
        end;
      end;
 end;
end;


procedure Tdm.imprimeProdutosMiniPrinter(marca : integer; modelo : integer);
var
 q : TIBQuery;
 str : string;
begin

 q := TIBQuery.Create(self);
 q.Database:=dbrestaurante;
 q.Transaction:=transacao;
 q.Active:=false;
 q.sql.clear;

 q.SQL.add('select  cod_produto, cod_barras,descricao, valor_unitario from produtos order by cod_barras');
 q.Active:=true;
 q.First;
 imprimeCabecalhoMiniPrinter(marca,modelo,'Listagem de produtos');
 case marca of
   1: begin
        case modelo of
         1: begin
              str:='######****************************************%%%%%%%%%%%';
              str:=dm.organizarCupom(str,'Cod.','#');
              str:=dm.organizarCupom(str,'Descricao','*');
              str:=dm.organizarCupom(str,'Preco','%');
              dm.imprime_linha_impNF(marca,modelo,str,true,false,false,false,true,false,false);
              dm.imprime_linha_impNF(marca,modelo,'------------------------------------------------',false,false,false,true,false,false,false);
              while not q.Eof do
               begin
                 str:='######****************************************%%%%%%%%%%%';
                 str:=dm.organizarCupom(str,q.fieldbyname('cod_barras').value,'#');
                 str:=dm.organizarCupom(str,q.fieldbyname('descricao').value,'*');
                 str:=dm.organizarCupom(str,FormatFloat('R$ ###,###,##0.00 ',q.fieldbyname('valor_unitario').value),'%');
                 dm.imprime_linha_impNF(marca,modelo,str,false,false,false,false,true,false,false);
                 q.Next;
               end;
               saltaLinhasMiniPrinter(marca,modelo);
            end;
        end;
      end;
 end;

 FreeAndNil(q);
end;


procedure Tdm.imprimeGarconsMiniPrinter(marca : integer; modelo : integer);
var
 q : TIBQuery;
 str : string;
begin

 q := TIBQuery.Create(self);
 q.Database:=dbrestaurante;
 q.Transaction:=transacao;
 q.Active:=false;
 q.sql.clear;

 q.SQL.add('select * from garcons order by cod_garcon');
 q.Active:=true;
 q.First;
 imprimeCabecalhoMiniPrinter(marca,modelo,'Listagem de garcons');
 case marca of
   2: begin
        case modelo of
         2: begin
              str:='######****************************************';
              str:=dm.organizarCupom(str,'Cod.','#');
              str:=dm.organizarCupom(str,'Nome','*');
              dm.imprime_linha_impNF(marca,modelo,str,true,false,false,false,true,false,false);
              dm.imprime_linha_impNF(marca,modelo,'------------------------------------------------',false,false,false,true,false,false,false);
              while not q.Eof do
               begin
                 str:='######****************************************';
                 str:=dm.organizarCupom(str,q.fieldbyname('cod_garcon').value,'#');
                 str:=dm.organizarCupom(str,q.fieldbyname('apelido').value,'*');
                 dm.imprime_linha_impNF(marca,modelo,str,false,false,false,false,true,false,false);
                 q.Next;
               end;
               saltaLinhasMiniPrinter(marca,modelo);
            end;
        end;
      end;
 end;

 FreeAndNil(q);
end;







function Tdm.maiorVenda(Tabela:String;Campo:String):Integer;
var
 QryMax : TIBquery;
begin
QryMax:= TIBquery.Create(self);
QryMax.Database:=dbrestaurante;
QryMax.Transaction:=transacao;


QryMax.Active:=False;
QryMax.SQL.Clear;
QryMax.SQL.Add('Select max('+Campo+') as Maior from vendas where imp=1');
QryMax.Active:=True;
if QryMax.eof or (QryMax['Maior']<1) then
MaiorVenda:=1
else
MaiorVenda:= QryMax['Maior']+1;
QryMax.Active:=False;
FreeAndNil(QryMax);
end;




procedure Tdm.imprimeEstornoMesa(marca : integer; mesa : string);
var
 QryM : TIBquery;
 valorBruto : double;
 txServ: double;
begin
QryM:= TIBquery.Create(self);
QryM.Database:=dbrestaurante;
QryM.Transaction:=transacao;


 frm_principal.memo_avisos.Lines.clear;
 If FileExists(caminhoArquivoExtrato) then DeleteFile(caminhoArquivoExtrato);
 dm.imprimeCabecalhoECF(marca,3,mesa,'','','','',1);
 dm.imprimeMovimentoContaECF(marca,mesa,'');


  QryM.Active:=false;
  QryM.sql.clear;
  QryM.sql.add('select * from rodapeextrato2('+Quotedstr(mesa)+','+dm.TrocaVirgPPto(Floattostr(percentualTaxaServico))+')');
  QryM.Active:=true;

  valorBruto :=     QryM.fieldbyname('VALORBRUTO').Value;
  txServ:=           QryM.fieldbyname('VALORTXSERV').Value;

 dm.imprimeRodapeExtratoContaECF(mesa,'',marca_impressora_fiscal,1,1,valorBruto,0,txServ,0,0,valorBruto+txServ, 0,0,0);



 frm_principal.memo_avisos.Lines.LoadFromFile(caminhoArquivoExtrato);

 if (localDeEmissaoDeExtrato = 1 )  then // Imprime o extrato no ECF
  begin
    frm_principal.ecf.RelatorioGerencial(frm_principal.memo_avisos.lines ,1,codRelatorioGerencialExtrato);
//    frm_principal.ECF.CortaPapel(true);
  end
 else
  begin
   // Chama a função que manda tudo para a impressora.
   imprimeTexoMiniPrinter();
  end;

  QryM.Active:=false;
  FreeAndNil(QryM);
end;



procedure Tdm.estornarMesaInteira(marca : integer ; modelo : integer; mesa : string; valorTotal : double);
var
 result : string;
begin

  if MessageDlg('Confirma estorno da mesa informada ?',mtConfirmation,[mbYes,mbNo],0) = Mrno then exit;
//  dm.logarOperacao('323','ESTORNO DA MESA '+mesa,mesa);



  if (StrtoInt(LeIni(1,'CANCELAMENTO_DE_MESA','imprime_comprovante'))=1 )then
   begin
    imprimeEstornoMesa(marca,mesa);
   end;   


  qryauxiliar.Active:=false;
  qryauxiliar.sql.Clear;
  qryauxiliar.sql.add('delete from movimento_mesa where cod_mesa='+Quotedstr(mesa));
  qryauxiliar.ExecSQL;

  qryauxiliar.Active:=false;
  qryauxiliar.sql.clear;
  qryauxiliar.sql.add('delete from recebimento_parcial where mesa='+Quotedstr(mesa));
  qryauxiliar.ExecSQL;

  qryauxiliar.Active:=false;
  qryauxiliar.sql.clear;
  qryauxiliar.sql.add('delete from extratos_emitidos where mesa='+Quotedstr(mesa));
  qryauxiliar.ExecSQL;

  if transacao.Active = false then transacao.Active:=true;
  transacao.Commit;
end;





procedure Tdm.impAssinaturaUsuario(marca : integer ; modelo : integer);
var
 str : string;
begin

  case marca of
   2: begin
        case modelo of
          2: begin
              dm.imprime_linha_impNF(marca,modelo,'',false,false,false,false,true,false,false);
              dm.imprime_linha_impNF(marca,modelo,'',false,false,false,false,true,false,false);
              dm.imprime_linha_impNF(marca,modelo,dm.centralizar('----------------------------------',48),false,false,false,true,false,false,false);
              dm.imprime_linha_impNF(marca ,modelo ,dm.centralizar(nome_comp_usuario_responsavel,48),false,false,false,true,false,false,false);
             end;

        end;
      end;

   4: begin
        case modelo of
           1: begin
               dm.imprime_linha_impNF(marca,modelo,'',false,false,false,false,true,false,false);
               dm.imprime_linha_impNF(marca,modelo,'',false,false,false,false,true,false,false);
               imprime_linha_impNF(marca ,modelo ,dm.centralizar('---------------------------------',48),false,false,false,false,true,false,false);
               imprime_linha_impNF(marca ,modelo ,dm.centralizar(nome_comp_usuario_responsavel,48),false,false,false,false,true,false,false);

             end;

        end;
      end;

   5: begin
       case modelo of
         1: begin
              dm.imprime_linha_impNF(marca,modelo,'',false,false,false,false,true,false,false);
              dm.imprime_linha_impNF(marca,modelo,'',false,false,false,false,true,false,false);
              dm.imprime_linha_impNF(marca ,modelo ,dm.centralizar('---------------------------------',40),false,false,false,false,true,false,false);
              dm.imprime_linha_impNF(marca ,modelo ,dm.centralizar(nome_comp_usuario_responsavel,40),false,false,false,false,true,false,false);
            end;
       end;
      end;
  end;


  dm.imprime_linha_impNF(marca,modelo,'',false,false,false,false,true,false,false);
  dm.imprime_linha_impNF(marca,modelo,'',false,false,false,false,true,false,false);
  dm.imprime_linha_impNF(marca,modelo,'',false,false,false,false,true,false,false);
  dm.imprime_linha_impNF(marca,modelo,'',false,false,false,false,true,false,false);
  dm.imprime_linha_impNF(marca,modelo,'',false,false,false,false,true,false,false);
  dm.imprime_linha_impNF(marca,modelo,'',false,false,false,false,true,false,false);
  dm.imprime_linha_impNF(marca,modelo,'',false,false,false,false,true,false,false);
  dm.imprime_linha_impNF(marca,modelo,'',false,false,false,false,true,false,false);
  dm.imprime_linha_impNF(marca,modelo,'',false,false,false,false,true,false,false);
  dm.cortaPapelImpNF(caminhoArquivoExtrato,marca,modelo);
end;


function Tdm.getTipoPagamentoNFCE(cod_forma : string) : TpcnFormaPagamento;
var
 q : TIBQuery;
begin

  q := TIBQuery.Create(self);
  q.Transaction := dm.transacao;
  q.Database := dm.dbrestaurante;

  q.Active:=false;
  q.sql.clear;
  q.sql.add('select rp from formas_pagamento where cod_forma='+Quotedstr(cod_forma));
  q.Active:=true;

  case StrToInt( q.FieldByName('rp').value) of
   1: Result := fpDinheiro;
   2: Result := fpCheque;
   3: Result := fpCartaoCredito;
   4: Result := fpCartaoDebito;
   5: Result := fpCreditoLoja;
   6: Result := fpValeAlimentacao;
   7: Result := fpValeRefeicao;
   8: Result := fpValePresente;
   9: Result := fpValeCombustivel;
   10: Result := fpValeAlimentacao;
   11: Result :=  fpValeAlimentacao;
   12: Result := fpValePresente;
   13: Result := fpValeCombustivel;
   99: Result := fpOutro;
  end;
  FreeAndNil(q);
end;


function Tdm.getTipoPagamentoSAT(cod_forma : string) : TpcnCodigoMP;
var
 q : TIBQuery;
begin

  q := TIBQuery.Create(self);
  q.Transaction := dm.transacao;
  q.Database := dm.dbrestaurante;

  q.Active:=false;
  q.sql.clear;
  q.sql.add('select rp from formas_pagamento where cod_forma='+Quotedstr(cod_forma));
  q.Active:=true;

  case StrToInt( q.FieldByName('rp').value) of
   1: Result := MPDinheiro;
   2: Result := mpCheque ;
   3: Result := mpCartaodeCredito ;
   4: Result := mpCartaodeDebito;
   5: Result := mpCreditoLoja;
   10: Result := mpValeAlimentacao;
   11: Result := mpValeRefeicao;
   12: Result := mpValePresente;
   13: Result := mpValeCombustivel;
   14: Result := mpOutros;
  end;
  FreeAndNil(q);
end;

function Tdm.verificaTipoFormaPagamento(cod_forma : string) : integer;
var
 q : TIBQuery;
begin

  q := TIBQuery.Create(self);
  q.Transaction := dm.transacao;
  q.Database := dm.dbrestaurante;

  q.Active:=false;
  q.sql.clear;
  q.sql.add('select * from formas_pagamento where cod_forma='+Quotedstr(cod_forma));
  q.Active:=true;

  result := q.fieldbyname('tipo').value;
  FreeAndNil(q);
end;



function Tdm.somaDiasData(data : Tdate ; dias : integer) : Tdate;
begin
  result:= data + dias;

end;



procedure TDM.gerarFatura(codCliente : string; codVenda : string; valorFatura : double ; obs : string );
var
 q : TIBQuery;
 frmVazio : Tfrm_modelo_vazio;
 dataVencimento : string;
 codFatura : string;

begin
  q := TIBQuery.Create(self);
  q.Database:= dbrestaurante;
  q.Transaction := transacao;
  q.Active:=false;
  q.SQL.clear;
  Application.CreateForm(Tfrm_modelo_vazio,frmVazio);
  dataVencimento := FormatDateTime('DD.MM.YYY',somaDiasData(data_do_sistema, frmVazio.getPrazoCliente(codCliente)));
  codFatura := geraCodigo('G_FATURAS',6);

  q.SQL.Add('insert into faturas (cod_fatura,cod_cli,cod_venda,data_fatura,hora,data_vencimento,valor_fatura,usuario_inclusao,observacao)');
  q.sql.add(' values (');
  q.SQL.add(''+Quotedstr(codFatura)+',');
  q.SQL.add(''+Quotedstr(codCliente)+',');
  q.SQL.add(''+Quotedstr(codVenda)+',');
  q.SQL.add(''+Quotedstr(FormatDateTime('DD.MM.YYY',data_do_sistema))+',');
  q.SQL.add(''+Quotedstr(FormatDateTime('HH:MM:SS',Time))+',');
  q.SQL.add(''+Quotedstr(dataVencimento)+',');
  q.SQL.add(''+Quotedstr(TrocaVirgPPto(FloatToStr(valorFatura)))+',');
  q.SQL.add(''+Quotedstr(nome_usuario)+',');
  q.SQL.add(''+Quotedstr(obs)+')');
  try
    begin
      q.ExecSQL;
    end;
  except
   begin
     ShowMessage('Ocorreu um erro no sistema!  Um log de errro foi criado no formato DATA+HORA na pasta logs do Sistema. Abra o arquivo e envio por fax ou email para a Real Systems');
     dm.cria_log_de_erros(q.sql,'Módulo de caixa','Erro inserir fatura',codigo_usuario);
     exit;
   end;
  end;


  q.Active:=false;
  q.SQL.clear;
  q.sql.add('update clientes set data_ultima_compra='+Quotedstr(FormatDateTime('DD.MM.YYY',data_do_sistema))+' where cod_cli='+Quotedstr(codCliente));
  try
    begin
      q.ExecSQL;
    end;
  except
   begin
     ShowMessage('Ocorreu um erro no sistema!  Um log de errro foi criado no formato DATA+HORA na pasta logs do Sistema. Abra o arquivo e envio por fax ou email para a Real Systems');
     dm.cria_log_de_erros(q.sql,'Módulo de caixa','Erro ao atualizar data ultima compra do cliente',codigo_usuario);
     exit;
   end;
  end;


  FreeAndNil(q);
  FreeAndNil(frmVazio); 

end;


function Tdm.verificaExistenciaRecebimentosParciais(mesa : string) : boolean;
var
q : TIBQuery;
begin
  q := TIBQuery.Create(self);
  q.Database := dm.dbrestaurante;
  q.Transaction := dm.transacao;
  q.Active:=false;
  q.SQL.clear;

  q.sql.add('select * from recebimento_parcial where mesa='+Quotedstr(mesa));
  q.active:=true;

  if q.IsEmpty then
   result:=true
  else
   result:=false;

   FreeAndNil(q);
end;


procedure Tdm.enviaProdutoParaFilaImpressao(cod_garcon : string; cod_produto : string ; mesa : string; quantidade : double ; observacao : string; sabores : string; tipo : string; terminal : integer; idMovimentoMesa : string; tipoMassa : string);
var
 q : TIbquery;
 frmVazio : Tfrm_modelo_vazio;
 impressora :string;
begin
  Application.CreateForm(Tfrm_modelo_vazio,frmVazio);
  q := TIBQuery.Create(self);
  q.Database := dm.dbrestaurante;
  q.Transaction := dm.transacao;
  q.Active:=false;
  q.SQL.clear;

    if  getCodMesaBalcao <> mesa then
     impressora := frmVazio.getCodMiniPrinterProduto(cod_produto)
    else
     begin
        if (StrToInt(dm.LeIni(2, 'CAIXA', 'balcaoImprimeFichas')) = 1) then
          impressora := formatFloat('000',StrToInt(dm.LeIni(2, 'CAIXA', 'codMiniprinterBalcao')))
        else
         impressora := frmVazio.getCodMiniPrinterProduto(cod_produto);
     end;



  q.sql.add('insert into fila_de_impressao (mesa,cod_garcon,cod_produto,quantidade,data,hora_pedido');
  q.sql.add(',cod_usuario_enviou,observacoes,sabores,numero_caixa,status,tipo,terminal,cod_miniprinter,id_movimento_mesa,tipo_massa) values (');
  q.sql.add(''+Quotedstr(mesa)+',');
  q.sql.add(''+Quotedstr(cod_garcon)+',');
  q.sql.add(''+Quotedstr(frmVazio.getCodProduto(cod_produto) )+',');
  q.sql.add(''+TrocaVirgPPto(FloatToStr(quantidade))+',');
  q.sql.add(''+Quotedstr(FormatDateTime('DD.MM.YYY',data_do_sistema))+',');
  q.sql.add(''+Quotedstr(FormatDateTime('HH:MM:ss',time))+',');
  q.sql.add(''+Quotedstr(codigo_usuario )+',');
  q.sql.add(''+Quotedstr(observacao)+','+Quotedstr(sabores)+','+Quotedstr(dm.LeIni(2, 'CAIXA', 'numero'))+',-1'+','+tipo+','+Inttostr(terminal)+',');
  q.sql.add(''+Quotedstr(impressora)+',');
  q.SQL.add(idMovimentoMesa+',');
  q.sql.add(''+Quotedstr(tipoMassa)+')');


  try
    begin
      q.ExecSQL;
    end;
  except
    begin
      dm.cria_log_de_erros(dm.qryauxiliar.sql, 'Lançamento no caixa ', 'Erro ao lançar produto na fila de impressão', codigo_usuario);
      exit;
    end;
  end;

  FreeAndNil(q);
  FreeAndNil(frmVazio);

end;

procedure tdm.imprimeCancelamentoPedidoLocalProducao(mesa : string; codProduto : string; quantidade : double; cod_movimento : string);
var
 q : TIBQuery;
begin
    Q := TIBQuery.Create(self);
    q.Database := dm.dbrestaurante;
    q.Transaction := dm.transacao;
    q.Active:=false;
    q.SQL.clear;
    enviaProdutoParaFilaImpressao(dm.getCodGarconAbriuMesa(mesa),codProduto,mesa,quantidade,'','','2',-1,'0','');
    q.Active:=false;
    FreeAndNil(q); 
end;











procedure Tdm.tbComprasTempCalcFields(DataSet: TDataSet);
begin
  tbComprasTemptotal.Value := tbComprasTemppreco.value * tbComprasTempquantidade.Value;
end;


Function Tdm.fAlinhaD( const Texto, Key, Espaco, Decimal : String ): String;
Var
vChar, vDiv : String;
I : Integer;
begin
vDiv := '1';
For I := 1 to StrToInt( Decimal )do
vDiv := vDiv + '0';
 vchar:= copy( Texto, 1, length( Texto )- 1 );//, Texto + Key );
//vChar := IfThen( Key = #8,
While ( pos( ',', vChar ) > 0 ) or ( pos( '.', vChar ) > 0 ) do
begin
Delete( vChar, pos( '.', vChar ), 1 );
Delete( vChar, pos( ',', vChar ), 1 );
end;
if vChar = '' Then
vChar := '0';
Result := format('%'+Espaco+'.'+Decimal+'n',[strtofloat( vChar )/StrToInt( vDiv )]);
End;


procedure Tdm.tbComprasTempvalorUnitarioValidate(Sender: TField);
begin
  if (tbComprasTemppreco.Value <= 0) then
  begin
    showmessage('Valor unitário deve ser maior que ZERO');
  end;


end;

procedure Tdm.tbComprasTempqtdeValidate(Sender: TField);
begin
  IF (tbComprasTempquantidade.Value <= 0) then
  begin
    showmessage('Quantidade deve ser superior à zero!');
  end;
end;






function Tdm.retiraAcentos ( str: String ): String;
var
i: Integer;
begin
  for i := 1 to Length ( str ) do
  case str[i] of
  'á': str[i] := 'a';
  'é': str[i] := 'e';
  'í': str[i] := 'i';
  'ó': str[i] := 'o';
  'ú': str[i] := 'u';
  'à': str[i] := 'a';
  'è': str[i] := 'e';
  'ì': str[i] := 'i';
  'ò': str[i] := 'o';
  'ù': str[i] := 'u';
  'â': str[i] := 'a';
  'ê': str[i] := 'e';
  'î': str[i] := 'i';
  'ô': str[i] := 'o';
  'û': str[i] := 'u';
  'ä': str[i] := 'a';
  'ë': str[i] := 'e';
  'ï': str[i] := 'i';
  'ö': str[i] := 'o';
  'ü': str[i] := 'u';
  'ã': str[i] := 'a';
  'õ': str[i] := 'o';
  'ñ': str[i] := 'n';
  'ç': str[i] := 'c';
  'Á': str[i] := 'A';
  'É': str[i] := 'E';
  'Í': str[i] := 'I';
  'Ó': str[i] := 'O';
  'Ú': str[i] := 'U';
  'À': str[i] := 'A';
  'È': str[i] := 'E';
  'Ì': str[i] := 'I';
  'Ò': str[i] := 'O';
  'Ù': str[i] := 'U';
  'Â': str[i] := 'A';
  'Ê': str[i] := 'E';
  'Î': str[i] := 'I';
  'Ô': str[i] := 'O';
  'Û': str[i] := 'U';
  'Ä': str[i] := 'A';
  'Ë': str[i] := 'E';
  'Ï': str[i] := 'I';
  'Ö': str[i] := 'O';
  'Ü': str[i] := 'U';
  'Ã': str[i] := 'A';
  'Õ': str[i] := 'O';
  'Ñ': str[i] := 'N';
  'Ç': str[i] := 'C';
end;
Result := str;
end;




procedure Tdm.imprimirEstornoDeItem(codEstorno : string; codCliente : string; nomeCliente : string);
var
 q : TIBQuery;
 marca : integer;
 str : string;
 ct : integer;
begin

  q := TIBquery.create(self);
  q.Database := dm.dbrestaurante;
  q.Transaction := dm.transacao;


  if (localDeEmissaoDeExtrato = 1 )  then
   marca := marca_impressora_fiscal
  else
   marca := marca_impressora_nao_fiscal_01;



  q.Active:=false;
  q.sql.clear;
  q.sql.add('select es.*,es.descricaoMotivo, (es.quantidade * es.valor_unitario) as total, c.nome_usuario' );
  q.sql.add('  from estornos es ');
  q.sql.add('    inner join caixas c on (c.codigo = es.cod_caixa)');
  q.sql.add('    where es.codigo='+Quotedstr(codEstorno  ));
  q.Active:=true;

  frm_principal.memo_avisos.Lines.clear;
  If FileExists(caminhoArquivoExtrato) then DeleteFile(caminhoArquivoExtrato);
  imprimeLinhaECF(marca,linhaExtrato,false,false,false,false,false,false,false);
  imprimeLinhaECF(marca,linhaExtrato,false,false,false,false,false,false,false);
  imprimeLinhaECF(marca,dm.centralizar(nome_fantasia,qtdColunasExpandidoECF),true,false,false,true,false,true,false);
  dm.imprimeLinhaECF(marca,dm.centralizar('ESTORNO',qtdColunasExpandidoECF),true,false,false,true,false,true,false);
  str:='Estorno: '+q.fieldbyname('codigo').value;
  imprimeLinhaECF(marca,str,false,false,false,false,true,false,false);
  str:='Mesa/Cartao: '+q.fieldbyname('mesa').value;
  imprimeLinhaECF(marca,str,false,false,false,false,true,false,false);
  if (trim(codCliente) <> '') then
     begin
      str:='Cod Cliente: '+codCliente;
      imprimeLinhaECF(marca,str,true,false,true,false,true,false,false);
      str:='Cliente: '+nomeCliente;
      imprimeLinhaECF(marca,str,true,false,true,false,true,false,false);
     end;
  str:='N. Caixa: '+q.fieldbyname('cod_caixa').value;
  imprimeLinhaECF(marca,str,true,false,false,false,true,false,false);
  str:='Operador: '+q.fieldbyname('NOME_USUARIO').value;
  imprimeLinhaECF(marca,str,true,false,false,false,true,false,false);
  str:='Data: '+FormatDateTime('DD/MM/YYY',data_do_sistema);
  imprimeLinhaECF(marca,str,true,false,false,false,true,false,false);

  str:='Hora: '+FormatDateTime('hh:mm:ss',q.fieldbyname('hora').value);
  imprimeLinhaECF(marca,str,false,false,false,false,true,false,false);


  imprimeLinhaECF(marca,linhaExtrato,false,false,false,false,false,false,false);
  str:=formatoCabecalhoExtrato;
  str:=dm.organizarCupom(str,'Qtd.','#');
  str:=organizarCupom(str,copy('Descricao',0,15),'*');
  str:=dm.organizarCupom(str,dm.alinha_valor_a_direita(alinhamentoDireitaTotal, 'Total'),'%');
  imprimeLinhaECF(marca,trim(str),false,false,false,false,false,false,false);
  imprimeLinhaECF(marca,linhaExtrato,false,false,false,false,false,false,false);


  str:=formatoCabecalhoExtrato;
  str:=dm.organizarCupom(str, q.fieldbyname('quantidade').value,'#');
  str:=dm.organizarCupom(str,copy(q.fieldbyname('descricao').value,0,25),'*');
  str:=trim(dm.organizarCupom(str,dm.alinha_valor_a_direita(alinhamentoDireitaTotal,FormatFloat('R$ ###,###,##0.00 ', (q.fieldbyname('total').value)      )),'%'));
  imprimeLinhaECF(marca,trim(str),false,false,false,false,true,false,false);
  imprimeLinhaECF(marca,trim(''),false,false,false,false,false,false,false);
  str:='Motivo: '+q.fieldbyname('DESCRICAOMOTIVO').value;
  imprimeLinhaECF(marca,str,false,false,false,false,true,false,false);


  if (trim(q.FieldByName('obs').Value) <> '') then
   begin
    imprimeLinhaECF(marca,'Observacoes:',false,false,false,false,false,false,false);
    frm_principal.memoObsMiniprinter.Lines.Clear;
    frm_principal.memoObsMiniprinter.Lines.add(q.FieldByName('obs').Value);
   for ct:=0 to frm_principal.memoObsMiniprinter.Lines.Count do
    begin
      imprimeLinhaECF(marca,frm_principal.memoObsMiniprinter.Lines[ct],true,false,false,false,true,false,false);
    end;
   end;


   imprimeLinhaECF(marca,linhaExtrato,false,false,false,false,false,false,false);
   imprimeLinhaECF(marca,'',false,false,false,false,false,false,false);
   imprimeLinhaECF(marca,'',false,false,false,false,false,false,false);

   imprimeLinhaECF(marca,dm.centralizar('------------------------------',qtdColunasNormalECF),false,false,false,false,false,false,false);
   imprimeLinhaECF(marca,dm.centralizar('Assinatura do Operador',qtdColunasNormalECF),false,false,false,false,false,false,false);

   for ct:=0 to  StrToInt(dm.LeIni(2,'extrato','linhasFinalExtrato')) do
    begin
     imprimeLinhaECF(marca,'                     ',false,false,false,false,false,false,false);
   end;

  if  (impressora_fiscal_instalada = 0)  then
   begin
     if ( StrToInt(dm.LeIni(2,'IMPRESSORA_NAO_FISCAL_01','cortaPapel')) =1 ) then
         cortaPapelImpNF(caminhoArquivoExtrato, marca,1);
   end;


   frm_principal.memo_avisos.Lines.LoadFromFile(caminhoArquivoExtrato);

   if (localDeEmissaoDeExtrato = 1 )  then // Imprime o extrato no ECF
    begin
      frm_principal.ecf.RelatorioGerencial(frm_principal.memo_avisos.lines ,1,codRelatorioGerencialExtrato);
      frm_principal.ECF.CortaPapel(true);
    end
   else
    begin
      // Chama a função que manda tudo para a impressora.
      imprimeTexoMiniPrinter();
    end;

    FreeAndNil(q);
end;




function tdm.imprimirTransferenciaDeProduto(codTransferencia : string ) : string;
var
 q : TIBQuery;
 marca : integer;
 str : string;
 ct : integer;
begin

  q := TIBquery.create(self);
  q.Database := dm.dbrestaurante;
  q.Transaction := dm.transacao;


  if (localDeEmissaoDeExtrato = 1 )  then
   marca := marca_impressora_fiscal
  else
   marca := marca_impressora_nao_fiscal_01;



  q.Active:=false;
  q.sql.clear;
  q.sql.add('select t.*,t.descricaoMotivo, (t.quantidade * t.valor_unitario) as total, c.nome_usuario' );
  q.sql.add('  from transferencias_produto t ');
  q.sql.add('    inner join caixas c on (c.codigo = t.cod_caixa)');
  q.sql.add('    where t.codigo='+Quotedstr(codTransferencia));
  q.Active:=true;

  frm_principal.memo_avisos.Lines.clear;
  If FileExists(caminhoArquivoExtrato) then DeleteFile(caminhoArquivoExtrato);
  imprimeLinhaECF(marca,dm.centralizar(nome_fantasia,qtdColunasExpandidoECF),true,false,false,true,false,true,false);
  dm.imprimeLinhaECF(marca,dm.centralizar('TF. DE PRODUTO',qtdColunasExpandidoECF),true,false,false,true,false,true,false);
  imprimeLinhaECF(marca,' ',false,false,false,false,true,false,false);

  str:='Transferencia Nº: '+q.fieldbyname('codigo').value;
  imprimeLinhaECF(marca,str,false,false,false,false,true,false,false);
  imprimeLinhaECF(marca,'ORIGEM:  '+q.fieldbyname('MESA_ORIGEM').value+' / '+'DESTINO:  '+q.fieldbyname('MESA_DESTINO').value,false,false,false,false,true,false,false);


  str:='N. Caixa: '+q.fieldbyname('cod_caixa').value +'    '+'Operador: '+trim(q.fieldbyname('NOME_USUARIO').value);
  imprimeLinhaECF(marca,str,false,false,false,false,true,false,false);
  str:='Data: '+FormatDateTime('DD/MM/YYY',data_do_sistema)+'   '+'Hora: '+FormatDateTime('hh:mm:ss',q.fieldbyname('hora').value);
  imprimeLinhaECF(marca,str,false,false,false,false,true,false,false);



  imprimeLinhaECF(marca,linhaExtrato,false,false,false,false,false,false,false);
  str:=formatoCabecalhoExtrato;
  str:=dm.organizarCupom(str,'Qtd.','#');
  str:=organizarCupom(str,copy('Descricao',0,15),'*');
  str:=dm.organizarCupom(str,dm.alinha_valor_a_direita(alinhamentoDireitaTotal, 'Total'),'%');
  imprimeLinhaECF(marca,trim(str),false,false,false,false,false,false,false);
  imprimeLinhaECF(marca,linhaExtrato,false,false,false,false,false,false,false);


  str:=formatoCabecalhoExtrato;
  str:=dm.organizarCupom(str, q.fieldbyname('quantidade').value,'#');
  str:=dm.organizarCupom(str,copy(q.fieldbyname('descricao').value,0,25),'*');
  str:=trim(dm.organizarCupom(str,dm.alinha_valor_a_direita(alinhamentoDireitaTotal,FormatFloat('R$ ###,###,##0.00 ', (q.fieldbyname('total').value)      )),'%'));
  imprimeLinhaECF(marca,trim(str),false,false,false,false,true,false,false);
  imprimeLinhaECF(marca,trim(''),false,false,false,false,false,false,false);
  str:='Motivo: '+q.fieldbyname('DESCRICAOMOTIVO').value;
  imprimeLinhaECF(marca,str,false,false,false,false,true,false,false);


  if (trim(q.FieldByName('obs').Value) <> '') then
   begin
    imprimeLinhaECF(marca,'Observacoes:',false,false,false,false,false,false,false);
    frm_principal.memoObsMiniprinter.Lines.Clear;
    frm_principal.memoObsMiniprinter.Lines.add(q.FieldByName('obs').Value);
   for ct:=0 to frm_principal.memoObsMiniprinter.Lines.Count do
    begin
      imprimeLinhaECF(marca,frm_principal.memoObsMiniprinter.Lines[ct],true,false,false,false,true,false,false);
    end;
   end;


   imprimeLinhaECF(marca,linhaExtrato,false,false,false,false,false,false,false);
   imprimeLinhaECF(marca,'',false,false,false,false,false,false,false);
   imprimeLinhaECF(marca,'',false,false,false,false,false,false,false);

   imprimeLinhaECF(marca,dm.centralizar('------------------------------',qtdColunasNormalECF),false,false,false,false,false,false,false);
   imprimeLinhaECF(marca,dm.centralizar('Assinatura do Operador',qtdColunasNormalECF),false,false,false,false,false,false,false);


   for ct:=0 to  StrToInt(dm.LeIni(2,'extrato','linhasFinalExtrato')) do
    begin
     imprimeLinhaECF(marca,'                     ',false,false,false,false,false,false,false);
   end;

  if  (impressora_fiscal_instalada = 0)  then
   begin
     if ( StrToInt(dm.LeIni(2,'IMPRESSORA_NAO_FISCAL_01','cortaPapel')) =1 ) then
         cortaPapelImpNF(caminhoArquivoExtrato, marca,1);
   end;




   frm_principal.memo_avisos.Lines.LoadFromFile(caminhoArquivoExtrato);

   if (localDeEmissaoDeExtrato = 1 )  then // Imprime o extrato no ECF
    begin
      frm_principal.ecf.RelatorioGerencial(frm_principal.memo_avisos.lines ,1,codRelatorioGerencialExtrato);
    end
   else
    begin
      // Chama a função que manda tudo para a impressora.
      imprimeTexoMiniPrinter();
    end;

    FreeAndNil(q);

end;













procedure Tdm.gravarEstornoDeItem(mesa : string; codMotivo : string; descricaoMotivo: string; CodProduto : string; descriCaoProduto : string; qtde : double ; valorUnitario : double; obs : string; imprimirCancelamento : boolean; codCliente : string; nomeCliente : string ; idMovimento : integer);
var
 q : TIbquery;
 q2 : TIbquery;
 codEstorno : string;
 transacaoEstorno: TIBTransaction;
begin




  transacaoEstorno := TIBTransaction.Create(Self);

  with transacaoEstorno do
  begin
    Name := 'transacaoEstorno';
//    Active := True;
    DefaultDatabase := dbrestaurante;
    Params.Clear;
    Params.Add('read_committed');
    Params.Add('rec_version');
    Params.Add('nowait');
    AutoStopAction := saNone;
  end;

   q := TIBQuery.Create(self);
  q.Database := dm.dbrestaurante;
  q.Transaction := transacaoEstorno;
  q.Active:=false;
  q.SQL.clear;

  transacaoEstorno.Active :=  true;

  codEstorno:=geraCodigo('G_ESTORNOS',6);
  q.Active:=false;
  q.sql.clear;
  q.sql.add(' insert into estornos (codigo,cod_motivo,descricaoMotivo,mesa,cod_produto,descricao,quantidade,valor_unitario,cod_caixa,obs,cod_usuario_autorizou,nome_usuario_autorizou,ID) values (');
  q.sql.add(Quotedstr(codEstorno)+',');
  q.sql.add(Quotedstr(codMotivo)+',');
  q.sql.add(Quotedstr(descricaoMotivo)+',');
  q.sql.add(QuotedStr(mesa)+',');
  q.sql.add(QuotedStr(CodProduto)+',');
  q.sql.add(QuotedStr(descriCaoProduto)+',');
  q.sql.add(TrocaVirgPPto(FloatToStr(qtde))+',');
  q.sql.add(TrocaVirgPPto(FloatToStr(valorUnitario))+',');
  q.sql.add(QuotedStr(ultimoCaixaAberto)+',');
  q.sql.add(QuotedStr(obs)+',');
  q.sql.add(QuotedStr(codigo_usuario_responsavel)+',');
  q.sql.add(QuotedStr(nome_usuario_responsavel)+',');
  q.sql.add(IntToStr(idMovimento)+')');
  try
   begin
    q .ExecSQL;
    dm.adicionaLog('Fez a inserção do estorno');
   end;
  except
   begin
      dm.adicionaLog('erro ao executar estorno '+q.SQL.Text);
   end;
  end;



   transacaoEstorno.Commit;
   FreeAndNil(q);
   transacaoEstorno.Active := false;
   FreeAndNil(transacaoEstorno);

   if imprimirCancelamento then
      imprimeCancelamentoPedidoProducao(codEstorno);




   if (StrtoInt(LeIni(1,'CANCELAMENTO_DE_ITEM','imprime_comprovante'))=1 )then
   imprimirEstornoDeItem(codEstorno,codCliente,nomeCliente);
end;

procedure Tdm.gravarTransferenciaDeItem(mesaOrigem  : string; mesaDestino: string; codMotivo : string; descricaoMotivo: string; CodProduto : string; descriCaoProduto : string; qtde : double ; valorUnitario : double; obs : string);
var
 q : TIbquery;
 codTransferencia : string;
begin
  q := TIBQuery.Create(self);
  q.Database := dm.dbrestaurante;
  q.Transaction := dm.transacao;
  q.Active:=false;
  q.SQL.clear;

  codTransferencia:=geraCodigo('G_TRANSFERENCIAS_PRODUTO',6);
  q.Active:=false;
  q.sql.clear;
  q.sql.add(' insert into TRANSFERENCIAS_PRODUTO(codigo,mesa_origem,mesa_destino,cod_motivo,descricaoMotivo,cod_produto,descricao,quantidade,valor_unitario,cod_caixa,obs,COD_USUARIO_AUTORIZOU,NOME_USUARIO_AUTORIZOU) values (');
  q.sql.add(Quotedstr(codTransferencia)+',');
  q.sql.add(QuotedStr(mesaOrigem)+',');
  q.sql.add(QuotedStr(mesaDestino)+',');
  q.sql.add(Quotedstr(codMotivo)+',');
  q.sql.add(Quotedstr(descricaoMotivo)+',');
  q.sql.add(QuotedStr(CodProduto)+',');
  q.sql.add(QuotedStr(descriCaoProduto)+',');
  q.sql.add(TrocaVirgPPto(FloatToStr(qtde))+',');
  q.sql.add(TrocaVirgPPto(FloatToStr(valorUnitario))+',');
  q.sql.add(QuotedStr(ultimoCaixaAberto)+',');
  q.sql.add(QuotedStr(obs)+',');
  q.sql.add(QuotedStr(codigo_usuario_responsavel)+',');
  q.sql.add(QuotedStr(nome_usuario_responsavel)+')');

  q .ExecSQL;
  FreeAndNil(q);

 if (StrtoInt(LeIni(1,'TRANSFERENCIA_DE_ITEM','imprime_comprovante'))=1 )then
  imprimirTransferenciaDeProduto(codTransferencia);
end;






function Tdm.retornaCodProduto(codBarrasProduto : string) : string;
var
 q : TIBQuery;
begin
  q := TIBQuery.Create(self);
  q.Database := dm.dbrestaurante;
  q.Transaction := dm.transacao;
  q.Active:=false;

  q.SQL.Clear;
  q.SQL.add('select cod_produto from produtos where cod_barras='+Quotedstr(codBarrasProduto));
  q.Active:=true;
  result:= q.fieldbyname('cod_produto').value;

  q.Active:=false;
  FreeAndNil(q); 
end;


function Tdm.getCodMetreResponsavel(codGarcon : string) : string;
var
  Q : TIBQuery;
begin
  q := TIBQuery.Create(self);
  q.Database := dm.dbrestaurante;
  q.Transaction := dm.transacao;
  q.Active:=false;
  q.SQL.clear;

  q.sql.add('select cod_metre from garcons where cod_garcon='+Quotedstr(codGarcon));
  q.active:=true;

  result:=q.fieldbyname('cod_metre').value;

  q.Active:=false;
  FreeAndNil(q); 

end;

function Tdm.getNomeGarconAbriuMesa(mesa : string) : string;
var
  Q : TIBQuery;
begin
  q := TIBQuery.Create(self);
  q.Database := dm.dbrestaurante;
  q.Transaction := dm.transacao;
  q.Active:=false;
  q.SQL.clear;


  q.SQL.Add('select mv.cod_garcon, mv.cod_movimento, g.apelido as apelido from movimento_mesa mv');
  q.sql.add(' inner join garcons g on (g.cod_garcon = mv.cod_garcon)');
  q.sql.add(' where ');
  q.sql.add(' mv.cod_mesa='+Quotedstr(mesa)+' order by mv.hora_lancamento');
  q.Active:=true;
  if q.fieldbyname('apelido').value =NULL THEN
   result:=''
  else
   result:= q.fieldbyname('apelido').value;




   q.Active:=false;
   FreeAndNil(q); 
end;

function Tdm.getCodGarconAbriuMesa(mesa : string) : string;
var
  Q : TIBQuery;
begin
  q := TIBQuery.Create(self);
  q.Database := dm.dbrestaurante;
  q.Transaction := dm.transacao;
  q.Active:=false;
  q.SQL.clear;

  q.SQL.Add('select mv.cod_garcon from movimento_mesa mv');
  q.sql.add(' where ');
  q.sql.add(' mv.cod_mesa='+Quotedstr(mesa)+' order by mv.id');
  q.Active:=true;
  if (q.IsEmpty = false) then
    result:= q.fieldbyname('cod_garcon').value
  else
    Result:='001';


  if result=''  then result :='001';




  q.Active:=false;
  FreeAndNil(q);

end;


function Tdm.getHoraAberturaDaMesa(mesa : string) : Ttime;
var
  Q : TIBQuery;
begin
  q := TIBQuery.Create(self);
  q.Database := dm.dbrestaurante;
  q.Transaction := dm.transacao;
  q.Active:=false;
  q.SQL.clear;

  q.SQL.Add('select mv.hora mv');
  q.sql.add(' where ');
  q.sql.add(' mv.cod_mesa='+Quotedstr(mesa)+' order by mv.cod_movimento');
  q.Active:=true;
  result:= q.fieldbyname('hora_lancamento').value;

  q.Active:=false;
  FreeAndNil(q); 
end;




function  Tdm.getNumSequencia(cod_miniprinter : string) : string;
var
  Q : TIBQuery;
begin
  q := TIBQuery.Create(self);
  q.Database := dm.dbrestaurante;
  q.Transaction := dm.transacao;
  q.Active:=false;
  q.SQL.clear;

  q.sql.add('select   mesa,v.cod_usuario_enviou, v.n_seq from v_fila_impressao v where v.status=0');
  q.sql.add(' and v.cod_miniprinter='+Quotedstr(cod_miniprinter)+' group by  v.mesa,cod_usuario_enviou, v.n_seq');
  q.active:=true;

  result:= q.fieldbyname('n_seq').value;

  q.Active:=false;
  FreeAndNil(q); 

end;



function  Tdm.ImprimeFilaDeImpressao(delivery : boolean; codPedidoDelivery : string; operacao : smallint) : string;
var
// Flag terminal diz se a função foi chamada para fazer atualização
// de um terminal ou de um computador
// Se <> -1 foi chamada por terminal, se = -1 foi chamada por computador (ESTAÇÃO)
  qryFilaDeImpressao : TIBQuery;
  n_seq : string;
  caminhoArquivoTexto : string;
  nomeArquivoTexto : string;
  qryAuxiliar : TIBQuery;
  operacaoImpressao : string;
  desdobramento : string;
  via : integer;
  miniPrinterAtual : string;
  mesa : string;
  descricaoProduto : string;

begin

  qryFilaDeImpressao:= TIBQuery.Create(self);
  qryFilaDeImpressao.Database := dm.dbrestaurante;
  qryFilaDeImpressao.Transaction := transacao;
  qryAuxiliar:= TIBQuery.Create(self);
  qryAuxiliar.Database := dm.dbrestaurante;
  qryAuxiliar.Transaction := transacao;




  IF dm.transacao.Active = FALSE THEN dm.transacao.Active:=TRUE;
  dm.transacao.Commit;
  dm.transacao.Active:=false;
  dm.transacao.Active:=true;


  qryFilaDeImpressao.Active:=false;
  qryFilaDeImpressao.sql.clear;
  qryFilaDeImpressao.sql.add('select * from fila_de_impressao where numero_caixa='+Quotedstr(dm.LeIni(2, 'CAIXA', 'numero'))+'  and status=-1 order by id_movimento_mesa ');
  qryFilaDeImpressao.Active:=true;
  
  if(qryFilaDeImpressao.IsEmpty = false) then
  begin
    n_seq:= dm.geraCodigo('G_FILA_IMPRESSAO',5);
    mesa :=  qryFilaDeImpressao.fieldbyname('mesa').value;

    /// Seleciona todas as miniprinters excluindo a opção de não imprimir.
    qryMiniPrinters.Active:=false;
    qryMiniPrinters.sql.clear;
    qryMiniPrinters.sql.add('select cod_miniprinter,marca,modelo,porta,corta_papel, saltos,vias from miniprinters where cod_miniprinter <> '+Quotedstr('001'));
    qryMiniPrinters.Active:=true;

    while( not qryMiniPrinters.Eof ) do
     begin
       nomeArquivoTexto:=qryMiniPrinters.fieldbyname('cod_miniprinter').Value+n_seq+'.dat';
       caminhoArquivoTexto:=LeIni(2,'PARAMETROS','pastaTemporariaDeImpressoes')+'\'+nomeArquivoTexto;
       qryFilaDeImpressao.Active:=false;
       qryFilaDeImpressao.SQL.clear;
       qryFilaDeImpressao.sql.add('select * from v_fila_impressao where numero_caixa='+Quotedstr(dm.LeIni(2, 'CAIXA', 'numero'))+'  and status=-1');
       qryFilaDeImpressao.SQL.add(' and cod_miniprinter='+Quotedstr(qryMiniPrinters.fieldbyname('cod_miniprinter').Value));
       qryFilaDeImpressao.SQL.add(' order by ID_MOVIMENTO_MESA ');
       qryFilaDeImpressao.Active:=true;


       if(qryFilaDeImpressao.IsEmpty = false ) then
        begin
          desdobramento :='1';
          qryFilaDeImpressao.first;
          if delivery = true then   // Se for um pedido de delivery
           begin
             gravaCabecalhoPedidoDelivery(caminhoArquivoTexto,
                                          qryMiniPrinters.fieldbyname('marca').value,
                                          qryMiniPrinters.fieldbyname('modelo').value,codPedidoDelivery,operacao);


           end
          else
           begin

              if (qryFilaDeImpressao.fieldbyname('mesa').value = mesaBalcao) then
               begin
                 gravaCabecalhoPedidoNoArquivoDeImpressao(caminhoArquivoTexto,codPedidoDelivery+'/'+desdobramento,qryFilaDeImpressao.fieldbyname('cod_garcon').value,
                                                       qryMiniPrinters.fieldbyname('marca').value,
                                                       qryMiniPrinters.fieldbyname('modelo').value,
                                                      qryFilaDeImpressao.fieldbyname('mesa').value,qryFilaDeImpressao.fieldbyname('tipo').value);

               end
              else
               begin
                 gravaCabecalhoPedidoNoArquivoDeImpressao(caminhoArquivoTexto,n_seq+'/'+desdobramento,qryFilaDeImpressao.fieldbyname('cod_garcon').value,
                                                       qryMiniPrinters.fieldbyname('marca').value,
                                                       qryMiniPrinters.fieldbyname('modelo').value,
                                                      qryFilaDeImpressao.fieldbyname('mesa').value,qryFilaDeImpressao.fieldbyname('tipo').value);
               end;
           end;





          while(not qryFilaDeImpressao.Eof) do
          begin

            if qryFilaDeImpressao.fieldbyname('tipo').value = 2 then
               operacaoImpressao:='# CANCELAR # '
            else
               operacaoImpressao:='';

            if (  (verificaMesaBalcao(qryFilaDeImpressao.fieldbyname('mesa').value)) and   (StrToInt(dm.LeIni(2,'CAIXA','balcaoImprimeFichas')) = 1) )   then
             begin
              if not qryFilaDeImpressao.bof then
                 begin
                    gravaCabecalhoPedidoNoArquivoDeImpressao(caminhoArquivoTexto,n_seq+'/'+desdobramento,qryFilaDeImpressao.fieldbyname('cod_garcon').value,
                                                      qryMiniPrinters.fieldbyname('marca').value,
                                                      qryMiniPrinters.fieldbyname('modelo').value,
                                                      qryFilaDeImpressao.fieldbyname('mesa').value,qryFilaDeImpressao.fieldbyname('tipo').value);
               end;
             end;

            gravaProdutosDoPedidoNoArquivo(caminhoArquivoTexto,
                                         qryMiniPrinters.fieldbyname('marca').value,
                                         qryMiniPrinters.fieldbyname('modelo').value,
                                         qryFilaDeImpressao.fieldbyname('cod_produto').Value,
                                         operacaoImpressao+qryFilaDeImpressao.fieldbyname('descricao').Value,
                                         qryFilaDeImpressao.fieldbyname('quantidade').Value,
                                         qryFilaDeImpressao.fieldbyname('valorunitario').Value,
                                         qryFilaDeImpressao.fieldbyname('observacoes').Value,
                                         qryFilaDeImpressao.fieldbyname('sabores').Value,
                                         qryFilaDeImpressao.fieldbyname('tipo_massa').Value,
                                         qryFilaDeImpressao.fieldbyname('ID_MOVIMENTO_MESA').Value);
            desdobramento := IntToStr(strToInt(desdobramento) + 1);
            qryFilaDeImpressao.Next;

            if (not qryFilaDeImpressao.Eof) then
             begin
               if (  (verificaMesaBalcao(qryFilaDeImpressao.fieldbyname('mesa').value)) and   (StrToInt(dm.LeIni(2,'CAIXA','balcaoImprimeFichas')) = 1) and (qryMiniPrinters.fieldbyname('corta_papel').value = 1) )   then
                 begin
                   cortaPapelImpNF(caminhoArquivoTexto,qryMiniPrinters.fieldbyname('marca').value,qryMiniPrinters.fieldbyname('modelo').value);
                 end
               else
                 begin
                   saltosNoArquivoTexto(caminhoArquivoTexto,qryMiniPrinters.fieldbyname('marca').value,
                                                       qryMiniPrinters.fieldbyname('modelo').value,1);
                   end;
             end;
          end;



            saltosNoArquivoTexto(caminhoArquivoTexto,qryMiniPrinters.fieldbyname('marca').value,
                                                   qryMiniPrinters.fieldbyname('modelo').value,qryMiniPrinters.fieldbyname('saltos').Value);

          if (qryMiniPrinters.fieldbyname('corta_papel').value = 1) then
           begin
              cortaPapelImpNF(caminhoArquivoTexto,qryMiniPrinters.fieldbyname('marca').value,qryMiniPrinters.fieldbyname('modelo').value);
           end;




          // Exclui os produtos
          qryAuxiliar.Active:=false;
          qryAuxiliar.SQL.clear;
          qryAuxiliar.SQL.add('delete from fila_de_impressao where numero_caixa='+Quotedstr(dm.LeIni(2, 'CAIXA', 'numero'))+'  and status=-1');
          qryAuxiliar.SQL.add(' and cod_miniprinter='+Quotedstr(qryMiniPrinters.fieldbyname('cod_miniprinter').Value));
          qryAuxiliar.ExecSQL;

          miniPrinterAtual := qryMiniPrinters.fieldbyname('cod_miniprinter').Value;

          for  via:=1 to  qryMiniPrinters.FieldByName('vias').Value do
           begin
              frm_principal.memo_avisos.Lines.Clear;
              frm_principal.memo_avisos.Lines.LoadFromFile(caminhoArquivoTexto);

             //Se não usar o gerenciador de impressões - Imprime diretamente

             if (StrToInt(LeIni(2,'IMPRESSAO_PEDIDOS','usaGerenciador')) = 0) then
              begin
                imprimePedido(miniPrinterAtual, qryMiniPrinters.fieldbyname('marca').value);
              end
             else
              begin
               //Copia o arquivo para a pasta definitiva
               CopyFile(pchar(caminhoArquivoTexto),pchar(LeIni(2,'PARAMETROS','pastaDefinitivaDeImpressoes')+'\'+trim(copy(nomeArquivoTexto,0,3) +inttostr(via)+copy(nomeArquivoTexto,4,100))),true);
              end;
           end;


          //Apaga Arquivo Temporario

          deletefile(caminhoArquivoTexto);


        end;
        // Passa para a próxima miniprinter;
       qryMiniPrinters.Next;
     end;
  end;

   qryAuxiliar.Active:=false;
   qryAuxiliar.sql.Clear;
   qryAuxiliar.SQL.add('update movimento_mesa set impresso=1 where numero_caixa='+Quotedstr(dm.LeIni(2, 'CAIXA', 'numero'))+'  and impresso=0');
   qryAuxiliar.ExecSQL;

   qryAuxiliar.Active:=false;
   FreeAndNil(qryAuxiliar);

   qryFilaDeImpressao.Active:=false;
   FreeAndNil(qryFilaDeImpressao);


   qryMiniPrinters.Active:=false;
//   FreeAndNil(qryMiniPrinters);

  IF dm.transacao.Active = FALSE THEN dm.transacao.Active:=TRUE;
  dm.transacao.Commit;
  Result:=n_seq;
end;


function Tdm.imprimirExtratoTerminal(marca : integer; modelo : integer) : string;
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

procedure Tdm.gravaStrEmArquivoDeTexto(arquivo : string;  str : string);
var
 f : TextFile;
begin
 AssignFile(f,Arquivo);
 if (FileExists(arquivo) = false ) then
   rewrite(f)
 else
   Append(f);
 Write(f,str);
 CloseFile(f);
end;


procedure Tdm.adicionaLinhaArquivoExtrato(str : string);
var
 f : TextFile;
begin
 str := Chr(13) + chr(10) + str;
 AssignFile(f,caminhoArquivoExtrato );
 if (FileExists(caminhoArquivoExtrato) = false ) then
   rewrite(f)
 else
   Append(f);
 Write(f,str);
 CloseFile(f);
end;


procedure Tdm.gravaCabecalhoPedidoDelivery(Arquivo : string; marca : integer; modelo :integer; codigoPedido : string; operacao : smallint);
var
 str : string;
 frmVazio : Tfrm_modelo_vazio;
 f : TextFile;
begin
   Application.CreateForm(Tfrm_modelo_vazio,frmVazio);
   dm.imprimeLinhaEmArquivo(Arquivo,marca,modelo,dm.centralizar(nome_fantasia  ,24),false,false,false,true,true,true,true);

   dm.qryauxiliar.Active := false;
   dm.qryauxiliar.sql.clear;
   dm.qryauxiliar.sql.add('select p.cod_cliente, cd.nome,udf_trim( cd.endereco) as endereco, b.descricao as bairro, p.retira_balcao from pedidos_delivery p ');
   dm.qryauxiliar.sql.add(' inner join clientes_delivery  cd on (cd.codigo = p.cod_cliente) ');
   dm.qryauxiliar.sql.add('inner join bairro b on (b.codigo = cd.cod_bairro) ');
   dm.qryauxiliar.sql.add('  where p.codigo='+Quotedstr(codigoPedido));
   dm.qryauxiliar.Active := true;



   case operacao of
    1: begin
         dm.imprimeLinhaEmArquivo(Arquivo,marca,modelo,dm.centralizar('DELIVERY',24),false,false,false,true,true,true,true);
         dm.imprimeLinhaEmArquivo(Arquivo,marca,modelo,dm.centralizar(codigoPedido,24),false,false,false,true,true,true,true);


         str:='CLIENTE: '+dm.qryauxiliar.fieldbyname('cod_cliente').Value+' - '+dm.qryauxiliar.fieldbyname('nome').Value;
         dm.imprimeLinhaEmArquivo(Arquivo,marca,modelo,str,false,false,false,false,true,false,false);

         str:='ENDEREÇO: '+dm.qryauxiliar.fieldbyname('ENDERECO').Value;
         dm.imprimeLinhaEmArquivo(Arquivo,marca,modelo,str,false,false,false,false,true,false,false);

         str:='BAIRRO: '+dm.qryauxiliar.fieldbyname('BAIRRO').Value;
         dm.imprimeLinhaEmArquivo(Arquivo,marca,modelo,str,false,false,false,false,true,false,false);



       end;

    2: begin
         dm.imprimeLinhaEmArquivo(Arquivo,marca,modelo,dm.centralizar('## ALTERAR O PEDIDO ##',24),false,false,false,true,true,true,true);
         dm.imprimeLinhaEmArquivo(Arquivo,marca,modelo,dm.centralizar(codigoPedido,24),false,false,false,true,true,true,true);
       end;

    3: begin
         dm.imprimeLinhaEmArquivo(Arquivo,marca,modelo,dm.centralizar('!! CANCELAR O PEDIDO !!',24),false,false,false,true,true,true,true);
         dm.imprimeLinhaEmArquivo(Arquivo,marca,modelo,dm.centralizar(codigoPedido,24),false,false,false,true,true,true,true);
       end;
   end;








   dm.imprimeLinhaEmArquivo(Arquivo,marca,modelo,'',false,false,false,false,true,false,false);
   str:='Data: '+FormatDateTime('DD/MM/YYY',DATE);
   dm.imprimeLinhaEmArquivo(Arquivo,marca,modelo,str,false,false,false,false,true,false,false);
   str:='Hora: '+FormatDateTime('HH:MM:SS',time);
   dm.imprimeLinhaEmArquivo(Arquivo,marca,modelo,str,false,false,false,false,true,false,false);

   if dm.qryauxiliar.fieldbyname('retira_balcao').Value = 1 then
    begin
       dm.imprimeLinhaEmArquivo(Arquivo,marca,modelo,'------------------------------------------------',false,false,false,false,true,false,false);
       dm.imprimeLinhaEmArquivo(Arquivo,marca,modelo,dm.centralizar('RETIRAR NO BALCAO',24),false,false,false,true,true,true,true);
    end;


   dm.imprimeLinhaEmArquivo(Arquivo,marca,modelo,'------------------------------------------------',false,false,false,false,true,false,false);
   str:='#########*******************************';
   str:=dm.organizarCupom(str,'Qtde','#');
   str:=dm.organizarCupom(str,'Descricao','*');
   str:=dm.organizarCupom(str,'','*');
   dm.imprimeLinhaEmArquivo(Arquivo,marca,modelo,str,false,false,false,false,true,false,false);
   FreeAndNil(frmVazio);
   dm.qryauxiliar.Active := false;
end;



procedure Tdm.gravaCabecalhoPedidoNoArquivoDeImpressao(Arquivo : string; n_seq : string; cod_garcon: string; marca : integer; modelo :integer ; mesa : string; tipo : integer);
var
 str : string;
 frmVazio : Tfrm_modelo_vazio;
 f : TextFile;
begin
   Application.CreateForm(Tfrm_modelo_vazio,frmVazio);

   case tipo of
     1: begin
         dm.imprimeLinhaEmArquivo(Arquivo,marca,modelo,dm.centralizar('PEDIDO '+n_seq,24),false,false,false,true,true,true,true);
         dm.imprimeLinhaEmArquivo(Arquivo,marca,modelo,str,false,false,false,false,true,false,false);
        end;
     2: begin
         dm.imprimeLinhaEmArquivo(Arquivo,marca,modelo,dm.centralizar('********************',24),false,false,false,true,true,true,true);
         dm.imprimeLinhaEmArquivo(Arquivo,marca,modelo,dm.centralizar('*** CANCELAMENTO ***',24),false,false,false,true,true,true,true);
         dm.imprimeLinhaEmArquivo(Arquivo,marca,modelo,dm.centralizar('********************',24),false,false,false,true,true,true,true);
         dm.imprimeLinhaEmArquivo(Arquivo,marca,modelo,str,false,false,false,false,TRUE,false,false);
        end;
     3: dm.imprimeLinhaEmArquivo(Arquivo,marca,modelo,dm.centralizar('AVISO DE PEDIDO ATRASADO '+n_seq,24),true,false,false,true,false,true,false);
   end;



   if (dm.verificaMesaBalcao(mesa) = false) then
    begin
      str:=dm.centralizar('Mesa: '+mesa,24);
      dm.imprimeLinhaEmArquivo(Arquivo,marca,modelo,str,false,false,false,true,true,true,true)
    end
   else
     begin
       str:=dm.centralizar(dm.getDescricaoPedidoBalcao(),24);
       dm.imprimeLinhaEmArquivo(Arquivo,marca,modelo,str,false,false,false,false,true,true,true);
     end;


   str:='Data: '+FormatDateTime('DD/MM/YYY',DATE);
   dm.imprimeLinhaEmArquivo(Arquivo,marca,modelo,str,false,false,false,false,true,false,false);
   str:='Hora: '+FormatDateTime('HH:MM:SS',time);
   dm.imprimeLinhaEmArquivo(Arquivo,marca,modelo,str,false,false,false,false,true,false,false);
   Str:='Garcon: '+frmVazio.getNomeGarcon(cod_garcon);
   dm.imprimeLinhaEmArquivo(Arquivo,marca,modelo,str,false,false,false,false,true,false,false);
   dm.imprimeLinhaEmArquivo(Arquivo,marca,modelo,'------------------------------------------',false,false,false,false,true,false,false);

   str:='#########*******************************';
   str:=dm.organizarCupom(str,'Qtde','#');
   str:=dm.organizarCupom(str,'Descricao','*');
   str:=dm.organizarCupom(str,'','*');
   dm.imprimeLinhaEmArquivo(Arquivo,marca,modelo,str,false,false,false,false,true,false,false);
FreeAndNil(frmVazio);
end;



function Tdm.verificaTamanhoPizza(codigo : string; tipoCodigo : smallint) : smallint;
var
 q : TIBquery;
begin
 q := TIBquery.create(self);
 q.database:= dm.dbrestaurante;
 q.transaction:= dm.transacao;

 q.active:=false;
 q.sql.clear;
 q.sql.add(' select cod_produto, pizza, tam_pizza from produtos  ');
 if (tipoCodigo = 1 ) then
   q.sql.add(' where  cod_produto='+QuotedStr(codigo))
 else
   q.sql.add(' where  cod_barras='+QuotedStr(codigo));

 q.active:=true;
 if (q.FieldByName('pizza').Value = 0) then
   result := 0
 else
  begin
    if q.FieldByName('tam_pizza').Value = 'B' then  result :=1;
    if q.FieldByName('tam_pizza').Value = 'P' then  result :=2;
    if q.FieldByName('tam_pizza').Value = 'M' then  result :=3;
    if q.FieldByName('tam_pizza').Value = 'G' then  result :=4;
    if q.FieldByName('tam_pizza').Value = 'F' then  result :=5;
  end;

  Q.Active := False;
  FreeAndNil(q);
end;



procedure Tdm.gravaProdutosDoPedidoNoArquivo(Arquivo : string; marca : integer; modelo : integer;codProduto : string; descricaoProduto : string; quantidade : double; preco : double; observacoes : string; sabores : string; tipoMassa : string ; idLancamento : integer  );
var
 str : string;
 totalLinhas : integer;
 LinhaAtual : integer;

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
    str:='#####***********************************';
    StrToInt(Floattostr(quantidade) );
    str:=dm.organizarCupom(str, InttoStr(StrToInt(Floattostr(quantidade)) ) ,'#');
   end;
  except
    begin
      str:='#####***********************************';
      str:=dm.organizarCupom(str, FormatFloat('#0.000',quantidade) ,'#');
    end;
  end;
  str:=dm.organizarCupom(str,descricaoProduto,'*');
  dm.imprimeLinhaEmArquivo(Arquivo,marca,modelo ,str,false,false,false,true,true,true,true);
  str:='ID: '+IntToStr(idLancamento);
 dm.imprimeLinhaEmArquivo(Arquivo,marca,modelo,str ,false,false,false,false,true,false,false);
 if tipoMassa <> '' then
  begin
    dm.imprimeLinhaEmArquivo(Arquivo,marca,modelo ,'# '+ tipoMassa+' #',false,false,false,true,true,true,true);
  end;

  if ( (trim(sabores) <> '') or (trim(observacoes) <>'') ) then
   begin
     if (trim(sabores) <>'') then
      begin
        frm_principal.memoObsMiniprinter.clear;
        frm_principal.memoObsMiniprinter.Lines.Add(trim(sabores));

        dm.imprimeLinhaEmArquivo(Arquivo,marca,modelo,'Sabores:',true,false,false,true,true,true,true);
        dm.imprimeLinhaEmArquivo(Arquivo,marca,modelo,'--',true,false,false,true,true,true,true);
        totalLinhas:= frm_principal.memoObsMiniprinter.Lines.count;
        linhaAtual:=0;
        str:='';
        while linhaAtual < totalLinhas do
          begin
//           str:='########################################';
//           str:=dm.organizarCupom(str,frm_principal.memoObsMiniprinter.Lines[linhaAtual],'#');
             str:=  trim(frm_principal.memoObsMiniprinter.Lines[linhaAtual]);
             dm.imprimeLinhaEmArquivo(Arquivo,marca,modelo,str,false,false,false,true,true,true,true);
            linhaAtual:=linhaAtual+1;
         end;

      end;

     if (trim(observacoes) <>'') then
      begin
       frm_principal.memoObsMiniprinter.clear;
       frm_principal.memoObsMiniprinter.Lines.Add(trim(observacoes));
       dm.imprimeLinhaEmArquivo(Arquivo,marca,modelo,'OBS:',true,false,false,true,true,true,true);
       totalLinhas:= frm_principal.memoObsMiniprinter.Lines.count;
       linhaAtual:=0;
       while linhaAtual < totalLinhas do
          begin
           str:='########################################';
           str:=dm.organizarCupom(str,frm_principal.memoObsMiniprinter.Lines[linhaAtual],'#');
           dm.imprimeLinhaEmArquivo(Arquivo,marca,modelo,str,false,false,false,true,true,true,true);
          linhaAtual:=linhaAtual+1;
          end;
      end;
    end;
   dm.imprimeLinhaEmArquivo(Arquivo,marca,modelo,'------------------------------------------',false,false,false,false,true,false,false);
end;

procedure Tdm.saltosNoArquivoTexto(Arquivo : string; marca : integer; modelo : integer; saltos : integer);
var
ct  : integer;
begin
  for ct:=1 to saltos do
   dm.imprimeLinhaEmArquivo(Arquivo,marca,modelo,' ',FALSE,false,false,false,true,true,false);
end;






procedure Tdm.satGetcodigoDeAtivacao(var Chave: AnsiString);
begin
  dm.tb_parametros.Active := true;
  Chave := dm.tb_parametrosCOD_ATIVACAO_SAT.Value;
end;

procedure Tdm.satGetsignAC(var Chave: AnsiString);
begin
  dm.tb_parametros.Active := true;
  Chave := dm.tb_parametrosASSINATURA_SAT.Value;
end;

procedure Tdm.satGravarLog(const ALogLine: string; var Tratado: Boolean);
begin
  adicionaLogSAT(ALogLine);
  Tratado := false;
end;

procedure Tdm.satMensagemSEFAZ(ACod: Integer; AMensagem: string);
begin
  adicionaLog('Mensagem Sefaz: ('+Inttostr(ACod)+') - '+AMensagem);
end;

procedure Tdm.gravarStream(codStream : string; tipo : string; med : string; stream : string);
var
  Q : TIBQuery;
begin
  q := TIBQuery.Create(self);
  q.Database := dm.dbrestaurante;
  q.Transaction := transacao;
  q.Active:=false;
  q.SQL.clear;

  q.SQL.add('insert into stream (cod_stream,data,hora,cod_usuario,tipo,med,stream) values(');
  q.sql.add(''+Quotedstr(codStream)+',');
  q.sql.add(''+Quotedstr(FormatDateTime('DD.MM.YYY',data_do_sistema))+',');
  q.sql.add(''+Quotedstr(FormatDateTime('HH:MM:SS',Time))+',');
  q.sql.add(''+Quotedstr(codigo_usuario)+',');
  q.sql.add(''+tipo+',');
  q.sql.add(''+TrocaVirgPPto(med)+',');
  q.sql.add(''+Quotedstr(stream)+')');
  q.ExecSQL;

  q.Active:=false;
  FreeAndNil(q); 
end;


function Tdm.getCodGarconMesaBalcao() : string;
var
  Q : TIBQuery;
begin
  q := TIBQuery.Create(self);
  q.Database := dm.dbrestaurante;
  q.Transaction := transacao;
  q.Active:=false;
  q.SQL.clear;

  q.SQL.add('select * from configuracoes_estacao where numero_caixa='+Quotedstr(numero_caixa ));
  q.Active:=true;
  Result:= q.fieldbyname('cod_garcon').value;


  q.Active:=false;
  FreeAndNil(q); 

end;

function Tdm.getCodMesaBalcao() : string;
var
  Q : TIBQuery;
begin

  q := TIBQuery.Create(self);
  q.Database := dm.dbrestaurante;
  q.Transaction := transacao;
  q.Active:=false;
  q.SQL.clear;

  q.SQL.add('select * from configuracoes_estacao where numero_caixa='+Quotedstr(numero_caixa));
  q.Active:=true;
  Result:= q.fieldbyname('cod_mesa').value;

   q.Active:=false;
  FreeAndNil(q);
end;


function Tdm.getCodMesaDelivery() : string;
var
  Q : TIBQuery;
begin

  q := TIBQuery.Create(self);
  q.Database := dm.dbrestaurante;
  q.Transaction := transacao;
  q.Active:=false;
  q.SQL.clear;

  q.SQL.add('select * from configuracoes_estacao where numero_caixa='+Quotedstr(numero_caixa));
  q.Active:=true;

  if (q.fieldbyname('cod_mesa_delivery').value= null) then
   begin
    showmessage('Código de mesa para o delivery não foi definido');
    Result:='5000';
    exit;
   end
  else
  Result:= q.fieldbyname('cod_mesa_delivery').value;

  q.Active:=false;
  FreeAndNil(q); 
end;


function Tdm.getCodGarconMesaDelivery() : string;
var
  Q : TIBQuery;
begin
  q := TIBQuery.Create(self);
  q.Database := dm.dbrestaurante;
  q.Transaction := transacao;
  q.Active:=false;
  q.SQL.clear;

  q.SQL.add('select * from configuracoes_estacao where numero_caixa='+Quotedstr(numero_caixa ));
  q.Active:=true;

  if (q.fieldbyname('cod_garcon_delivery').value = null) then
   begin
    ShowMessage('Código de Garçom para o delivery não foi definido.');
    result:='000';
    exit;
   end
  else
  Result:= q.fieldbyname('cod_garcon_delivery').value;

  q.Active:=false;
  FreeAndNil(q); 
end;




function Tdm.getSerieNFCE() : integer;
var
  Q : TIBQuery;
begin
  q := TIBQuery.Create(self);
  q.Database := dm.dbrestaurante;
  q.Transaction := transacao;
  q.Active:=false;
  q.SQL.clear;

  q.SQL.add('select SERIE_NFCE_NORMAL from configuracoes_estacao where numero_caixa='+Quotedstr(numero_caixa ));
  q.Active:=true;

  if (q.fieldbyname('SERIE_NFCE_NORMAL').value = null) then
   begin
    ShowMessage('Série da NFCE NORMAL não definida');
    result:= 1;
    exit;
   end
  else
  Result:= q.fieldbyname('SERIE_NFCE_NORMAL').value;

  q.Active:=false;
  FreeAndNil(q);
end;




function Tdm.getSerieNFCEEmContingencia() : integer;
var
  Q : TIBQuery;
begin
  q := TIBQuery.Create(self);
  q.Database := dm.dbrestaurante;
  q.Transaction := transacao;
  q.Active:=false;
  q.SQL.clear;

  q.SQL.add('select SERIE_NFCE_NORMAL from configuracoes_estacao where numero_caixa='+Quotedstr(numero_caixa ));
  q.Active:=true;

  if (q.fieldbyname('SERIE_NFCE_NORMAL').value = null) then
   begin
    ShowMessage('Série da NFCE em contingência não definida');
    result:= 1;
    exit;
   end
  else
  Result:= q.fieldbyname('SERIE_NFCE_NORMAL').value;

  q.Active:=false;
  FreeAndNil(q);
end;







procedure Tdm.cancelaNFEPelaChave(chave : string; protocolo :string; justificativa: string);
var
 numeroNota : integer;
begin
  parametrizaAcbrNFE(moNFCe,False,true);
  numeroNota := StrToInt(copy(chave,26,9));

 dm.ACBrNFe1.EventoNFe.Evento.Clear;
  with dm.ACBrNFe1.EventoNFe.Evento.Add do
   begin
     infEvento.chNFe := chave;
     infEvento.CNPJ   := dm.tb_parametrosCNPJ.Value;
     infEvento.dhEvento := now;
     infEvento.tpEvento := teCancelamento;
     infEvento.detEvento.xJust := justificativa;
     infEvento.detEvento.nProt := protocolo;

   end;

  try
   BEGIN
     ACBrNFe1.EnviarEvento(numeroNota );
     dm.adicionaLog('Sistema cancelou a nota de chave '+chave);
     dm.adicionaLog ( ACBrNFe1.WebServices.EnvEvento.RetWS);
     dm.adicionaLog ( ACBrNFe1.WebServices.EnvEvento.RetornoWS);

     dm.adicionaLog (IntToStr(ACBrNFe1.WebServices.EnvEvento.cStat));
     dm.adicionaLog ('Protocolo: '+ACBrNFe1.WebServices.EnvEvento.EventoRetorno.retEvento.Items[0].RetInfEvento.nProt);

     if ( trim(dm.AcbrNFe1.WebServices.EnvEvento.EventoRetorno.retEvento.Items[0].RetInfEvento.nProt) <> '') then
       begin
        dm.adicionaLog('XML DO EVENTO DE cancelamento');
        dm.adicionaLog(dm.AcbrNFe1.WebServices.EnvEvento.EventoRetorno.retEvento.Items[0].RetInfEvento.XML);
       end;

   end;


  except
    on E : Exception  do

     begin
//       exibe_painel_erro('Erro ao cancelar NFCE: '+e.Message,'Ok');
       adicionaLog('Erro ao cancelar a nfce '+chave+' mensage: '+E.Message);
//       Result := false;
       exit;
     end;
  end;





end;


function Tdm.cancelaNFCE(chaveNFCE : string; protocolo: string; serie : integer; numeroNFCE : integer; justificativa : string) : boolean;
begin
  dm.transacao.Active := false;
  dm.transacao.Active := true;
  dm.procGeraInutilizacoes.ExecProc;
  dm.transacao.Commit;
  dm.transacao.Active := false;
  dm.transacao.Active := true;

  result := false;

  tb_parametros.Active := true;

  dm.ACBrNFe1.EventoNFe.Evento.Clear;
  with dm.ACBrNFe1.EventoNFe.Evento.Add do
   begin
     infEvento.chNFe := chaveNFCE;
     infEvento.CNPJ   := dm.tb_parametrosCNPJ.Value;
     infEvento.dhEvento := now;
     infEvento.tpEvento := teCancelamento;
     infEvento.detEvento.xJust := justificativa;
     infEvento.detEvento.nProt := protocolo;
   end;

  try
   BEGIN
     ACBrNFe1.EnviarEvento(numeroNFCE);
     dm.adicionaLog('Sistema cancelou a nota de chave '+chaveNFCE);
     dm.adicionaLog ( ACBrNFe1.WebServices.EnvEvento.RetWS);
     dm.adicionaLog ( ACBrNFe1.WebServices.EnvEvento.RetornoWS);

     dm.adicionaLog (IntToStr(ACBrNFe1.WebServices.EnvEvento.cStat));
     dm.adicionaLog ('Protocolo: '+ACBrNFe1.WebServices.EnvEvento.EventoRetorno.retEvento.Items[0].RetInfEvento.nProt);
   end;


  except
    on E : Exception  do

     begin
//       exibe_painel_erro('Erro ao cancelar NFCE: '+e.Message,'Ok');
       adicionaLog('Erro ao cancelar a nfce '+chaveNFCE+' mensage: '+E.Message);
       Result := false;
       exit;
     end;
  end;


 if ACBrNFe1.WebServices.EnvEvento.EventoRetorno.retEvento.Items[0].RetInfEvento.cStat <> 135 then
      begin
//        exibe_painel_erro('O SISTEMA NÃO CONSEGUIU CANCELAR A NOTA.!','OK');
        result := false;
        exit;
      end

 else
  begin
    protocolo := ACBrNFe1.WebServices.EnvEvento.EventoRetorno.retEvento.Items[0].RetInfEvento.nProt;

    dm.transacao.Active := true;

    dm.qryauxiliar.Active := false;
    dm.qryauxiliar.sql.clear;
    dm.qryauxiliar.sql.add(' select * from inutilizacoes_nfce i');
    dm.qryauxiliar.sql.Add('  where i.serie='+IntToStr(serie) + ' and i.nota='+IntToStr(numeroNFCE));
    dm.qryauxiliar.Active := true;

    if dm.qryauxiliar.IsEmpty then
      begin
        dm.qryauxiliar.Active := false;
        dm.qryauxiliar.sql.clear;
        dm.qryauxiliar.sql.add(' insert into inutilizacoes_nfce(serie,nota,emitida) values (');
        dm.qryauxiliar.sql.Add(IntToStr(serie)+','+IntToStr(numeroNFCE)+',0)');
        dm.qryauxiliar.ExecSQL;
        dm.transacao.Commit;
      end;

    dm.qryauxiliar.Active := false;
    dm.qryauxiliar.sql.clear;
    dm.qryauxiliar.sql.add('update inutilizacoes_nfce i set  i.inutilizada=1, i.cancelada=1, i.data_hora_inutilizacao=current_date,  i.protocolo_cancelamento='+QuotedStr(protocolo) );
    dm.qryauxiliar.sql.Add('  where i.serie='+IntToStr(serie) + ' and i.nota='+IntToStr(numeroNFCE));
    dm.qryauxiliar.ExecSQL;
    dm.transacao.Commit;



//    exibe_painel_erro('NOTA FISCAL EM DUPLICIDADE FOI CANCELADA. TENTE EMITIR A NOTA NOVAMENTE!','OK');
    result := true;
    exit;
  end;


end;


function Tdm.getNumeroNFE () : integer;
var
  Q : TIBQuery;
  numeroNota : integer;
begin
  q := TIBQuery.Create(self);
  q.Database := dm.dbrestaurante;
  q.Transaction := transacao;
  q.Active:=false;
  q.SQL.clear;

  q.SQL.add('select * from parametros ');
  q.Active:=true;

  if (q.fieldbyname('NUMERO_NFE').value = null) then
   begin
     numeroNota := 1;
   end;




  numeroNota:= q.fieldbyname('NUMERO_NFE').value + 1;
  q.Active := false;
  q.sql.Clear;
  q.SQL.Add('update parametros set  NUMERO_NFE ='+IntToStr(numeroNota));
  Q.ExecSQL;


  result := numeroNota;

  q.Active:=false;
  FreeAndNil(q);
end;



function Tdm.getNumeroCartaCorrecaoNFE () : integer;
var
  Q : TIBQuery;
  numeroNota : integer;
  ts: TIBTransaction;
begin
  ts      :=   TIBTransaction.Create(self);
  ts.DefaultDatabase   :=  dm.dbrestaurante;
  ts.Active := false;

  q := TIBQuery.Create(self);
  q.Database := dm.dbrestaurante;
  q.Transaction := ts;
  q.Active:=false;
  q.SQL.clear;

  try
    ts.Active := true;
    q.SQL.add('select * from parametros ');
    q.Active:=true;

    if (q.fieldbyname('NUMERO_NFE').value = null) then
     begin
       numeroNota := 1;
     end;
    numeroNota:= q.fieldbyname('NUMERO_NFE').value + 1;
    q.Active := false;
    q.sql.Clear;
    q.SQL.Add('update parametros set  NUMERO_NFE ='+IntToStr(numeroNota));
    Q.ExecSQL;

    ts.Commit;
    result := numeroNota;

  finally
   q.Active:=false;
   FreeAndNil(q);
   FreeAndNil(ts);
  end;

end;



function Tdm.emitirCartaCorrecao(chave : string; textoCartaCorrecao : string) : boolean;
var
  Q : TIBQuery;
  ts: TIBTransaction;
  idCartaCorrecao : integer;
  dataHoraEvento : TDateTime ;
  xmlEvento : string;
begin





  try
    try
      idCartaCorrecao := getNumeroCartaCorrecaoNFE;
      dataHoraEvento  := Now;


      with ACBrNFe1.EventoNFe.Evento.Add do
       begin
         infEvento.chNFe := chave;
         infEvento.CNPJ   := cnpj;
         infEvento.dhEvento := dataHoraEvento;
         infEvento.tpEvento := teCCe;
         infEvento.nSeqEvento := idCartaCorrecao;
         infEvento.detEvento.xCorrecao := textoCartaCorrecao;
       end;

       try
        ACBrNFe1.EnviarEvento(idCartaCorrecao);
        dm.adicionaLog('Enviou a carta de correção');
        except
            dm.adicionaLog('Erro ao chamar método de envio da carta de correção');
        end;

     xmlEvento := ACBrNFe1.WebServices.EnvEvento.RetWS;

     dm.adicionaLog('XML da carta de correção: '+xmlEvento);
     dm.gravarEventoNFE(chave, xmlEvento,dataHoraEvento);

     dm.exibe_painel_erro('Carta de correção efetuada com sucesso!','Ok');


    except
       on E : Exception  do
        begin
            Result := false;
            dm.transLog.Rollback;
            dm.adicionaLog('Erro ao gerar carta de correção '+E.Message);
            ts.Rollback;
        end;

    end;

  finally
   q.Active:=false;
   FreeAndNil(q);
   FreeAndNil(ts);
  end;

end;



procedure Tdm.gravarEventoNFE(chave : string ; xmlEvento : string ; dataHoraEvento : TDateTime);
VAR
  Q : TIBQuery;
  ts: TIBTransaction;
  idEvento : integer;

begin
  ts      :=   TIBTransaction.Create(self);
  ts.DefaultDatabase   :=  dbrestaurante;
  ts.Active := false;
  ts.Active := true;

  q := TIBQuery.Create(self);
  q.Database := dm.dbrestaurante;
  q.Transaction := ts;
  q.Active:=false;
  q.SQL.clear;

 TRY

   try
     idEvento := StrToInt(geraCodigo('G_EVENTOS_NFE',15));
     Q.Active := false;
     q.SQL.Clear;
     Q.SQL.Add('insert into eventos_nfe(id_evento, data_hora, xml_evento,usuario, tipo_evento, chave_nfe) values (');
     q.SQL.Add(IntToStr(idEvento)+',');
     q.SQL.Add(QuotedStr(FormatDateTime('DD.MM.YY HH:MM:SS',dataHoraEvento))+',');
     q.SQL.Add(QuotedStr(xmlEvento)+',');
     q.SQL.Add(QuotedStr(nome_usuario)+',1,');
     q.SQL.Add(QuotedStr(chave)+')');
     dm.adicionaLog('SQL de inserção do evento: ');
     dm.adicionaLog(q.SQL.Text);
     q.ExecSQL;
     ts.Commit;

   except
       on E : Exception  do
        begin
            exibe_painel_erro('Erro ao gravar evento na tabela de eventos de nfe','OK');
            dm.adicionaLog('Erro ao inserir evento '+E.Message);
            dm.transLog.Rollback;
            ts.Rollback;
        end;
   end;

 FINALLY
   q.Active:=false;
   FreeAndNil(q);
   FreeAndNil(ts);
 END;

end;





function Tdm.getNumeroNFCE () : integer;
var
  Q : TIBQuery;
  numeroNota : integer;
  achou : boolean;
  campoNumeroNota       : string;
begin
  q := TIBQuery.Create(self);
  q.Database := dm.dbrestaurante;
  q.Transaction := transLog;
  q.Active:=false;
  q.SQL.clear;

  transLog.Active := false;
  transLog.Active := true;

  q.SQL.add('select * from configuracoes_estacao where numero_caixa='+Quotedstr(numero_caixa ));
  q.Active:=true;


  if   dm.ACBrNFe1.Configuracoes.WebServices.Ambiente = taHomologacao  then
   begin
     campoNumeroNota        := 'NUMERO_NFCE_NORMAL_HOMOLOGACAO';
   end
  else
   begin
     campoNumeroNota        := 'NUMERO_NFCE_NORMAL';
   end;



  numeroNota:= q.fieldbyname(campoNumeroNota).value + 1;
  q.Active := false;
  q.sql.Clear;
  q.SQL.Add('update configuracoes_estacao set  '+campoNumeroNota+'='+IntToStr(numeroNota)+ ' where numero_caixa='+Quotedstr(numero_caixa ));
  Q.ExecSQL;

  if transLog.Active = false then transLog.Active:=true;
  transLog.Commit;




  q.Active:=false;
  FreeAndNil(q);
  result := numeroNota;
end;




function Tdm.getNumeroNFCEEmContingencia () : integer;
var
  Q : TIBQuery;
  numeroNota : integer;
  achou : boolean;
  campoNumeroNota       : string;
begin
  q := TIBQuery.Create(self);
  q.Database := dm.dbrestaurante;
  q.Transaction := transLog;
  q.Active:=false;
  q.SQL.clear;

  transLog.Active := false;
  transLog.Active := true;

  q.SQL.add('select * from configuracoes_estacao where numero_caixa='+Quotedstr(numero_caixa ));
  q.Active:=true;


  if   dm.ACBrNFe1.Configuracoes.WebServices.Ambiente = taHomologacao  then
   begin
     campoNumeroNota        := 'NUMERO_NFCE_NORMAL_HOMOLOGACAO';
   end
  else
   begin
     campoNumeroNota        := 'NUMERO_NFCE_NORMAL';
   end;



  numeroNota:= q.fieldbyname(campoNumeroNota).value + 1;
  q.Active := false;
  q.sql.Clear;
  q.SQL.Add('update configuracoes_estacao set  '+campoNumeroNota+'='+IntToStr(numeroNota)+ ' where numero_caixa='+Quotedstr(numero_caixa ));
  Q.ExecSQL;

  if transLog.Active = false then transLog.Active:=true;
  transLog.Commit;

  q.Active:=false;
  FreeAndNil(q);
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



function tdm.getDescricaoPedidoBalcao() : string;
var
  Q : TIBQuery;
begin
  q := TIBQuery.Create(self);
  q.Database := dm.dbrestaurante;
  q.Transaction := transacao;
  q.Active:=false;
  q.SQL.clear;

  q.SQL.add('select * from configuracoes_estacao where numero_caixa='+Quotedstr(numero_caixa ));
  q.Active:=true;

  Result:= q.fieldbyname('CABECALHO_PEDIDO_BALCAO').value;

  q.Active:=false;
  FreeAndNil(q); 
end;


function tdm.verificaMesaBalcao(mesa : string) : boolean;
var
  Q : TIBQuery;
begin
  q := TIBQuery.Create(self);
  q.Database := dm.dbrestaurante;
  q.Transaction := transacao;
  q.Active:=false;
  q.SQL.clear;

  q.SQL.add('select * from configuracoes_estacao where cod_mesa='+Quotedstr(mesa));
  q.active:=true;
  if q.IsEmpty then
    result:=false
  else
    result:=true;


  q.Active:=false;
  FreeAndNil(q); 

end;


function tdm.verificaseExisteMovimentoMesaBalcao() : boolean;
var
  Q : TIBQuery;
begin
  q := TIBQuery.Create(self);
  q.Database := dm.dbrestaurante;
  q.Transaction := transacao;
  q.Active:=false;
  q.SQL.clear;

  q.SQL.add('select * from movimento_mesa where cod_mesa='+Quotedstr(getCodMesaBalcao));
  q.Active:=true;

  if q.IsEmpty then
    Result:=false
  else
    Result:=true;

  q.Active:=false;
  FreeAndNil(q); 

end;

function tdm.verificaseExisteMovimentoMesa(mesa : string) : boolean;
var
  Q : TIBQuery;
begin
  q := TIBQuery.Create(self);
  q.Database := dm.dbrestaurante;
  q.Transaction := transacao;
  q.Active:=false;
  q.SQL.clear;

  q.SQL.add('select * from movimento_mesa where cod_mesa='+Quotedstr(mesa));
  q.Active:=true;

  if q.IsEmpty then
   begin
    Result:=false
   end
  else
   begin
    Result:=true;
   end;

   Q.Active:=false;
   FreeAndNil(q); 

end;



function tdm.verificaSeAMesaFoiAberta(mesa : string) : boolean;
var
  Q : TIBQuery;
begin
  q := TIBQuery.Create(self);
  q.Database := dm.dbrestaurante;
  q.Transaction := transacao;
  q.Active:=false;
  q.SQL.clear;
  transacao.active:=false;
  transacao.Active:=true;

  q.SQL.add('select * from informacoes_mesa where mesa='+Quotedstr(mesa));
  q.Active:=true;

  if q.IsEmpty then
    Result:=false
  else
    Result:=true;

   q.Active:=false;
   FreeAndNil(q); 

end;


procedure tdm.efetuaAberturaDaMesa(mesa : string);
var
  Q : TIBQuery;
begin
  q := TIBQuery.Create(self);
  q.Database := dm.dbrestaurante;
  q.Transaction := transacao;
  transacao.Active:=true;
  q.Active:=false;
  q.SQL.clear;

  string_auxiliar :='01';




   if ( (StrToInt(dm.LeIni(2,'CAIXA','NumeroPessoasNaAbertura'))  = 1) and (mesa <> mesaDelivery) and (mesa <> mesaBalcao))  then
    begin
     Application.CreateForm(TfrmQtdPessoas,frmQtdPessoas);
     frmQtdPessoas.lbMesa.Caption := IntToStr(StrToInt(mesa));
     frmQtdPessoas.ShowModal;
     frmQtdPessoas.Free;
    end;


   q.SQL.Clear;
   Q.sql.Add('delete from informacoes_mesa ms where ms.mesa='+Quotedstr(mesa));
   q.ExecSQL;
   q.Active := false;
   q.SQL.Clear;




   string_auxiliar := Inttostr(StrToInt(string_auxiliar));
   q.SQL.add('insert into informacoes_mesa (mesa,hora,cod_usuario,qtd_pessoas) values('+Quotedstr(mesa)+',current_time,'+QuotedStr(codigo_usuario)+',');
   q.sql.add(''+string_auxiliar+')');

  try
    begin
      q.ExecSQL;
    end;
  except
    begin
      cria_log_de_erros(q.SQL, 'Caixa', 'Erro ao incluir log de mesa', codigo_usuario);
      exit;
    end;
  end;
  transacao.Commit;

  q.Active:=false;
  FreeAndNil(q);
end;




function Tdm.verificaProdutoImprimeLocalProducao(cod_produto: string) : boolean;
var
 q : TIBquery;
begin
 q := TIBquery.create(self);
 q.database:= dm.dbrestaurante;
 q.transaction:= dm.transacao;

 q.active:=false;
 q.sql.clear;
 q.sql.add(' select p.cod_produto, p.cod_miniprinter, m.cod_miniprinter as cod_mp from produtos p ');
 q.sql.add(' inner join miniprinters m on (m.cod_miniprinter = p.cod_miniprinter)');
 q.sql.add(' where p.cod_produto='+QuotedStr(cod_produto));
 q.active:=true;
 if (q.FieldByName('cod_mp').Value='001') then
  result:=false
 else
  result:=true;

  q.Active:=false;
  FreeAndNil(q);
end;



function Tdm.verificaProdutoImprimeDelivery(cod_produto: string) : boolean;
var
 q : TIBquery;
begin
 q := TIBquery.create(self);
 q.database:= dm.dbrestaurante;
 q.transaction:= dm.transacao;

 q.active:=false;
 q.sql.clear;
 q.sql.add(' select imp_delivery from produtos where cod_produto='+QuotedStr(cod_produto));
 q.active:=true;
 if (q.FieldByName('imp_delivery').value = 0) then
  result:=false
 else
  result:=true;
 q.Active:=false;
 FreeAndNil(q);
end;



function Tdm.verificaProdutoImprimeMesas(cod_produto: string) : boolean;
var
 q : TIBquery;
begin
 q := TIBquery.create(self);
 q.database:= dm.dbrestaurante;
 q.transaction:= dm.transacao;

 q.active:=false;
 q.sql.clear;
 q.sql.add(' select imp_mesas from produtos where cod_produto='+QuotedStr(cod_produto));
 q.active:=true;
 if (q.FieldByName('imp_mesas').value = 0) then
  result:=false
 else
  result:=true;
 q.Active:=false;
 FreeAndNil(q);
end;


function Tdm.verificaProdutoImprimeBalcao(cod_produto: string) : boolean;
var
 q : TIBquery;
begin
 q := TIBquery.create(self);
 q.database:= dm.dbrestaurante;
 q.transaction:= dm.transacao;

 q.active:=false;
 q.sql.clear;
 q.sql.add(' select imp_balcao from produtos where cod_produto='+QuotedStr(cod_produto));
 q.active:=true;
 if (q.FieldByName('imp_balcao').value = 0) then
  result:=false
 else
  result:=true;
 q.Active:=false;
 FreeAndNil(q);
end;









procedure Tdm.gravarRepique(codVenda : string; totalVenda : string; valor : double);
var
 q : TIBquery;
begin
 q := TIBquery.create(self);
 q.database:= dm.dbrestaurante;
 q.transaction:= dm.transacao;

 q.active:=false;
 q.sql.add('insert into repiques (cod_venda,data_venda,valor,imp) values (');
 q.sql.add(''+Quotedstr(codVenda)+',');
 q.sql.add(''+Quotedstr(FormatDateTime('DD.MM.YYY',data_do_sistema))+',');
 q.sql.add(''+TrocaVirgPPto(FloatToStr(valor))+',0');

  try
    begin
      q.ExecSQL;
    end;
  except
    begin
      cria_log_de_erros(q.SQL, 'Encerramento de venda', 'Erro ao gravar repique', codigo_usuario);
      exit;
    end;
  end;

  q.Active:=false;
  FreeAndNil(q);
end;





procedure Tdm.aplicaDescontoItem(mesa : string; codMovimento : string ; valor : double);
var
 Q : TIBQuery ;
 valorDesconto : double;
begin
   Q := TIBQuery.Create(self);
   Q.Database:= dbrestaurante;
   Q.Transaction := transacao;
   q.Active:=false;

  if (frm_caixa_restaurante.rdg_modo_visualizacao.ItemIndex = 0) then
   begin
      q.Active:=false;
      q.sql.clear;
      q.sql.add('update movimento_mesa set desconto='+TrocaVirgPPto(FloaTTostr(valor))+' where cod_mesa='+Quotedstr(mesa)+' and cod_movimento='+Quotedstr(codMovimento));
      q.ExecSQL;
   end;

   if transacao.Active = false then transacao.Active:=true;
   transacao.Commit;

   q.Active:=false;
   FreeAndNil(q);

end;



function Tdm.TBRound(Value: Extended; Decimals: integer): Extended;
var
  Factor, Fraction: Extended;
begin
  Factor := IntPower(10, Decimals);
  { A conversão para string e depois para float evita
    erros de arredondamentos indesejáveis. }
  Value := StrToFloat(FloatToStr(Value * Factor));
  Result := Int(Value);
  Fraction := Frac(Value);
  if Fraction >= 0.5 then
    Result := Result + 1
  else if Fraction <= -0.5 then
    Result := Result - 1;
  Result := Result / Factor;
end;



function Tdm.AppIsRunning(ActivateIt: boolean) : Boolean;
var
hSem : THandle;
hWndMe : HWnd;
AppTitle: string;
begin
Result := False;
AppTitle := Application.Title;
hSem := CreateSemaphore(nil, 0, 1, pChar(AppTitle));
if ((hSem <> 0) AND (GetLastError() = ERROR_ALREADY_EXISTS)) then
   begin
   CloseHandle(hSem);
   Result := True;
   end;
if Result and ActivateIt then
   begin
   Application.Title :=  'zzzzzzz';
   hWndMe := FindWindow(nil, pChar(AppTitle));
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



function Tdm.verificaSeCobraCouvertNoDIa() : boolean;
var
 qryRetornaCouvert : TIBquery;
begin
  qryRetornaCouvert := TIBQuery.Create(Self);
  qryRetornaCouvert.Database:=dbrestaurante;
  qryRetornaCouvert.Transaction:=transacao;

  qryRetornaCouvert.Active:=false;
  qryRetornaCouvert.SQL.clear;
  qryRetornaCouvert.SQL.add('select * from valores_servico_e_couvert where  dia ='+Quotedstr(UpperCase(FormatDateTime('DDDD',data_do_sistema))) );
  qryRetornaCouvert.Active:=true;

  if qryRetornaCouvert.FieldByName('cobra_couvert').Value = 1 then
    Result:=true
  else
    Result:=false;

  qryRetornaCouvert.Active:=false;
  FreeAndNil(qryRetornaCouvert);
end;








function Tdm.getTempoEntreHoras(horaInicial : Ttime; horaFinal : Ttime) : string;
var
 horaMax,horaMin : TTime;
 hIni, hFim : integer;
 nHoras : integer;
 nMinutos : integer;
 FIni,FFim : TDateTime;
begin
Fini := horaInicial;
FFim := horaFinal;



  If (horaInicial > horaFinal) then
      begin
    Result := TimeToStr((StrTotime('23:59:59')-Fini)+FFim)
    end
else
   begin
   Result := TimeToStr(FFim-Fini);
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


function Tdm.getInformacoesDaMesa(mesa : string) : TinformacoesDaMesa;
var
  qryInformacoesDaMesa : TIBquery;
begin

 transacao.Active:=false;
 transacao.Active:=true;
  qryInformacoesDaMesa := TIBQuery.Create(Self);
  qryInformacoesDaMesa.Database:=dbrestaurante;
 qryInformacoesDaMesa.Transaction:=transacao;

  qryInformacoesDaMesa.Active:=false;
  qryInformacoesDaMesa.SQL.clear;
  qryInformacoesDaMesa.SQL.add('select mesa,hora,current_date as data_servidor, current_time as horas_servidor from informacoes_mesa where mesa='+Quotedstr(mesa));
  qryInformacoesDaMesa.Active:=true;
  result:=TinformacoesDaMesa.create();

  if qryInformacoesDaMesa.IsEmpty  then
   begin
     efetuaAberturaDaMesa(mesa);
     qryInformacoesDaMesa.Active:=false;
     qryInformacoesDaMesa.SQL.clear;
     qryInformacoesDaMesa.SQL.add('select mesa,hora,current_date as data_servidor, current_time as horas_servidor from informacoes_mesa where mesa='+Quotedstr(mesa));
     qryInformacoesDaMesa.Active:=true;

   end;

   Result.horaAbertura:=qryInformacoesDaMesa.fieldbyname('hora').value;
   Result.dataServidor:=qryInformacoesDaMesa.fieldbyname('data_servidor').value;
   Result.horaServidor:=qryInformacoesDaMesa.fieldbyname('horas_servidor').value;

  qryInformacoesDaMesa.Active:=false;
  FreeAndNil(qryInformacoesDaMesa);

end;




function Tdm.verificaSeProdutoEstaNaConta(codProduto : string; mesa : string) : boolean;
var
  qryAux : TIBquery;
begin
 transacao.Active:=false;
 transacao.Active:=true;
 qryAux := TIBQuery.Create(Self);
 qryAux.Database:=dbrestaurante;
 qryAux.Transaction:=transacao;
 qryAux.Active:=false;
 qryAux.SQL.clear;
 qryAux.sql.add('select * from movimento_mesa where cod_mesa='+Quotedstr(mesa)+' and cod_produto='+Quotedstr(codProduto));
 qryAux.Active:=true;

 if qryAux.IsEmpty = true then
   Result:=false
 else
   Result:=true;

 qryAux.Active:=false;
 FreeAndNil(qryAux);


end;


function Tdm.getCodCouvertAutomatico(tipoCouvert : smallint; mesa : string) : string;
var
  qryCouvertAutomatico : TIBquery;
begin
  //  se a variável tipo for = 1  é o couvert normal
  //  Se a variável tipo for = 2 é o Couvert com Pré-convite
  //  Se a variável tipo for = 3 é CORTESIA
 transacao.Active:=false;
 transacao.Active:=true;
 qryCouvertAutomatico := TIBQuery.Create(Self);
 qryCouvertAutomatico.Database:=dbrestaurante;
 qryCouvertAutomatico.Transaction:=transacao;
 qryCouvertAutomatico.Active:=false;
 qryCouvertAutomatico.SQL.clear;
 qryCouvertAutomatico.SQL.add('select c.*   from configuracoes_cartoes c  where');
 qryCouvertAutomatico.SQL.add(mesa+' between c.inicio_faixa and c.fim_faixa ');
 qryCouvertAutomatico.Active:=true;

 case tipoCouvert of
  0: Result:= qryCouvertAutomatico.fieldbyname( copy(UpperCase(retiraAcentos(FormatDateTime('DDDD',data_do_sistema))),0,3)).value;
  1: Result:= qryCouvertAutomatico.fieldbyname( copy(UpperCase(retiraAcentos(FormatDateTime('DDDD',data_do_sistema))),0,3)+'PREC').value;
  2: result:= qryCouvertAutomatico.fieldbyname('VIP').value;
 end;

 qryCouvertAutomatico.Active:=false;
 FreeAndNil(qryCouvertAutomatico);

end;

function Tdm.verificaSeMesaTemMovimento(mesa : string) : boolean;
var
  qryVerificaMesa : TIBquery;
begin
 transacao.Active:=false;
 transacao.Active:=true;
 qryVerificaMesa := TIBQuery.Create(Self);
 qryVerificaMesa.Database:=dbrestaurante;
 qryVerificaMesa.Transaction:=transacao;
 qryVerificaMesa.Active:=false;
 qryVerificaMesa.SQL.clear;

 qryVerificaMesa.SQL.add('select * from movimento_mesa where cod_mesa='+Quotedstr(mesa));
 qryVerificaMesa.Active:=true;

 if qryVerificaMesa.IsEmpty then
   Result:=false
 else
   Result:=true;

  qryVerificaMesa.Active:=false;
  FreeAndNil(qryVerificaMesa);

end;


function Tdm.gerarDadosRegistro60mECF() : boolean;
var
ArqIni : tIniFile;
dataMovimentoECF : TDate;
caminho : string;
ct : integer;
//variaveis do registro 60M
NumSerie,NumECF,NumLoja,NumCOOInicial,NumCOO,NumCRZ,NumCRO : string;
VendaBruta,GrandeTotal,TotalDescontos,TotalCancelamentos,TotalAcrescimos,TotalNaoFiscal : string;
TotalSubstituicaoTributaria,TotalNaoTributado,TotalIsencao  : string;
q : TIBquery;
codigo : string;
begin
 frm_principal.memo_avisos.Lines.Clear;
 dataMovimentoECF:= frm_principal.ECF.DataMovimento;
 frm_principal.memo_avisos.Lines.Add(frm_principal.ECF.DadosReducaoZ);
 caminho:=patchAplicacao+'dadosReducoes\'+FormatDateTime('YYYMMDD',dataMovimentoECF)+'.ini';
  if FileExists(caminho) then
   DeleteFile(caminho);
 frm_principal.memo_avisos.Lines.SaveToFile(caminho);
 ArqIni := tIniFile.Create(caminho);



 // Informacoes do ECF
 NumSerie                    := Trim(ArqIni.ReadString('ECF','NumSerie','0'));
 NumECF                      := Trim(ArqIni.ReadString('ECF','NumECF','0'));
 NumLoja                     := Trim(ArqIni.ReadString('ECF','NumLoja','0'));
 NumCOOInicial               := Trim(ArqIni.ReadString('ECF','NumCOOInicial','0'));
 NumCOO                      := Trim(ArqIni.ReadString('ECF','NumCOO','0'));
 NumCRZ                      := Trim(ArqIni.ReadString('ECF','NumCRZ','0'));
 NumCRO                      := Trim(ArqIni.ReadString('ECF','NumCRO','0'));

 // Informacoes dos Totalizadores
 VendaBruta                  := Trim(ArqIni.ReadString('Totalizadores','VendaBruta','0'));
 GrandeTotal                 := Trim(ArqIni.ReadString('Totalizadores','GrandeTotal','0'));
 TotalDescontos              := Trim(ArqIni.ReadString('Totalizadores','TotalDescontos','0'));
 TotalCancelamentos          := Trim(ArqIni.ReadString('Totalizadores','TotalCancelamentos','0'));
 TotalAcrescimos             := Trim(ArqIni.ReadString('Totalizadores','TotalAcrescimos','0'));
 TotalNaoFiscal              := Trim(ArqIni.ReadString('Totalizadores','TotalNaoFiscal','0'));
 TotalSubstituicaoTributaria := Trim(ArqIni.ReadString('OutrasICMS','TotalSubstituicaoTributaria','0'));
 TotalNaoTributado           := Trim(ArqIni.ReadString('OutrasICMS','TotalNaoTributado','0'));
 TotalIsencao                := Trim(ArqIni.ReadString('OutrasICMS','TotalIsencao','0'));




 codigo :=dm.geraCodigo('G_REG60M',8);
 q := TIBQuery.Create(Self);
 q.Database:=dbrestaurante;
 q.Transaction:=transacao;
 q.Active:=false;
 q.sql.add('insert into reg60M (cod_reg,data,num_serie,num_ord,modelo,coo_ini,coo_fim,cont_z,co_rein_op,');
 q.sql.add('venda_bruta,tot_geral) values (');
 q.sql.add(QuotedStr(codigo)+',');
 q.sql.add(Quotedstr(FormatDateTime('DD.MM.YYY',dataMovimentoECF))+',');
 q.sql.add(QuotedStr(NumSerie)+',');
 q.sql.add(QuotedStr(FormatFloat('000',StrToFloat(NumECF)))+',');
 q.sql.add(QuotedStr('2D')+',');
 q.sql.add(QuotedStr(NumCOOInicial)+',');
 q.sql.add(QuotedStr(NumCOO)+',');
 q.sql.add(QuotedStr(NumCRZ)+',');
 q.sql.add(QuotedStr(FormatFloat('000',StrToFloat(NumCRO)))+',');
 q.sql.add(TrocaVirgPPto(VendaBruta)+',');
 q.sql.add(TrocaVirgPPto(GrandeTotal)+')');
 try
   q.ExecSQL;
 Except
 end;


 // Grava Cancelamentos..
 q.Active:=false;
 q.SQL.Clear;
 codigo :=dm.geraCodigo('G_REG60A',8);
 q.sql.add('insert into REG60A (cod_reg,data,num_serie,valor_acumulado,aliquota) values (');
 q.sql.add(''+Quotedstr(codigo)+',');
 q.sql.add(Quotedstr(FormatDateTime('DD.MM.YYY',dataMovimentoECF))+',');
 q.sql.add(QuotedStr(NumSerie)+',');
 q.sql.add(TrocaVirgPPto(TotalCancelamentos)+',');
 q.sql.add(QuotedStr('CANC')+')');
 q.ExecSQL;

 // Grava descontos
 q.Active:=false;
 q.SQL.Clear;
 codigo :=dm.geraCodigo('G_REG60A',8);
 q.sql.add('insert into REG60A (cod_reg,data,num_serie,valor_acumulado,aliquota) values (');
 q.sql.add(''+Quotedstr(codigo)+',');
 q.sql.add(Quotedstr(FormatDateTime('DD.MM.YYY',dataMovimentoECF))+',');
 q.sql.add(QuotedStr(NumSerie)+',');
 q.sql.add(TrocaVirgPPto(TotalDescontos)+',');
 q.sql.add(QuotedStr('DESC')+')');
 q.ExecSQL;

  // Grava Acresimos
 q.Active:=false;
 q.SQL.Clear;
 codigo :=dm.geraCodigo('G_REG60A',8);
 q.sql.add('insert into REG60A (cod_reg,data,num_serie,valor_acumulado,aliquota) values (');
 q.sql.add(''+Quotedstr(codigo)+',');
 q.sql.add(Quotedstr(FormatDateTime('DD.MM.YYY',dataMovimentoECF))+',');
 q.sql.add(QuotedStr(NumSerie)+',');
 q.sql.add(TrocaVirgPPto(TotalAcrescimos)+',');
 q.sql.add(QuotedStr('ACRE')+')');
 q.ExecSQL;


  // Grava substituição
 q.Active:=false;
 q.SQL.Clear;
 codigo :=dm.geraCodigo('G_REG60A',8);
 q.sql.add('insert into REG60A (cod_reg,data,num_serie,valor_acumulado,aliquota) values (');
 q.sql.add(''+Quotedstr(codigo)+',');
 q.sql.add(Quotedstr(FormatDateTime('DD.MM.YYY',dataMovimentoECF))+',');
 q.sql.add(QuotedStr(NumSerie)+',');
 q.sql.add(TrocaVirgPPto(TotalSubstituicaoTributaria)+',');
 q.sql.add(QuotedStr('F')+')');
 q.ExecSQL;

   // Grava isencao
 q.Active:=false;
 q.SQL.Clear;
 codigo :=dm.geraCodigo('G_REG60A',8);
 q.sql.add('insert into REG60A (cod_reg,data,num_serie,valor_acumulado,aliquota) values (');
 q.sql.add(''+Quotedstr(codigo)+',');
 q.sql.add(Quotedstr(FormatDateTime('DD.MM.YYY',dataMovimentoECF))+',');
 q.sql.add(QuotedStr(NumSerie)+',');
 q.sql.add(TrocaVirgPPto(TotalIsencao)+',');
 q.sql.add(QuotedStr('I')+')');
 q.ExecSQL;

   // Grava nao tributado
 q.Active:=false;
 q.SQL.Clear;
 codigo :=dm.geraCodigo('G_REG60A',8);
 q.sql.add('insert into REG60A (cod_reg,data,num_serie,valor_acumulado,aliquota) values (');
 q.sql.add(''+Quotedstr(codigo)+',');
 q.sql.add(Quotedstr(FormatDateTime('DD.MM.YYY',dataMovimentoECF))+',');
 q.sql.add(QuotedStr(NumSerie)+',');
 q.sql.add(TrocaVirgPPto(TotalNaoTributado)+',');
 q.sql.add(QuotedStr('N')+')');
 q.ExecSQL;



 //Gravação das alíquotas...
 frm_principal.ECF.LerTotaisAliquota;

 for ct := 0 to frm_principal.ecf.aliquotas.Count -1 do
  begin
     q.Active:=false;
     q.SQL.Clear;
     codigo :=dm.geraCodigo('G_REG60A',8);
     q.sql.add('insert into REG60A (cod_reg,data,num_serie,valor_acumulado,aliquota) values (');
     q.sql.add(''+Quotedstr(codigo)+',');
     q.sql.add(Quotedstr(FormatDateTime('DD.MM.YYY',dataMovimentoECF))+',');
     q.sql.add(QuotedStr(NumSerie)+',');
     q.sql.add(TrocaVirgPPto(FormatFloat('#0.00',frm_principal.ecf.Aliquotas[ct].Total) )+',');
     q.sql.add(QuotedStr(removeCaracteres(FormatFloat('#00.00',frm_principal.ecf.Aliquotas[ct].Aliquota)))+')');
     q.ExecSQL;
  end;

 dm.transacao.Commit;
 ArqIni.Free;

 q.Active:=false;
 FreeAndNil(q);
end;




function Tdm.gerarDadosRegistro60mECFaRQUIVOS(CAMINHO : STRING) : boolean;
var
ArqIni : tIniFile;
dataMovimentoECF : TDate;

ct : integer;
//variaveis do registro 60M
NumSerie,NumECF,NumLoja,NumCOOInicial,NumCOO,NumCRZ,NumCRO : string;
VendaBruta,GrandeTotal,TotalDescontos,TotalCancelamentos,TotalAcrescimos,TotalNaoFiscal : string;
TotalSubstituicaoTributaria,TotalNaoTributado,TotalIsencao,total0400  : string;
q : TIBquery;
codigo : string;
begin
// frm_principal.memo_avisos.Lines.Clear;

  ArqIni := tIniFile.Create(caminho);
 dataMovimentoECF:= strToDate( Trim(ArqIni.ReadString('ECF','DataMovimento','0')));


 // Informacoes do ECF
 NumSerie                    := Trim(ArqIni.ReadString('ECF','NumSerie','0'));
 NumECF                      := Trim(ArqIni.ReadString('ECF','NumECF','0'));
 NumLoja                     := Trim(ArqIni.ReadString('ECF','NumLoja','0'));
 NumCOOInicial               := Trim(ArqIni.ReadString('ECF','NumCOOInicial','0'));
 NumCOO                      := Trim(ArqIni.ReadString('ECF','NumCOO','0'));
 NumCRZ                      := Trim(ArqIni.ReadString('ECF','NumCRZ','0'));
 NumCRO                      := Trim(ArqIni.ReadString('ECF','NumCRO','0'));

 // Informacoes dos Totalizadores
 VendaBruta                  := Trim(ArqIni.ReadString('Totalizadores','VendaBruta','0'));
 GrandeTotal                 := Trim(ArqIni.ReadString('Totalizadores','GrandeTotal','0'));
 TotalDescontos              := Trim(ArqIni.ReadString('Totalizadores','TotalDescontos','0'));
 TotalCancelamentos          := Trim(ArqIni.ReadString('Totalizadores','TotalCancelamentos','0'));
 TotalAcrescimos             := Trim(ArqIni.ReadString('Totalizadores','TotalAcrescimos','0'));
 TotalNaoFiscal              := Trim(ArqIni.ReadString('Totalizadores','TotalNaoFiscal','0'));
 TotalSubstituicaoTributaria := Trim(ArqIni.ReadString('OutrasICMS','TotalSubstituicaoTributaria','0'));
 TotalNaoTributado           := Trim(ArqIni.ReadString('OutrasICMS','TotalNaoTributado','0'));
 TotalIsencao                := Trim(ArqIni.ReadString('OutrasICMS','TotalIsencao','0'));
 total0400 :=  Trim(ArqIni.ReadString('Aliquotas','06T0400','0'));



 codigo :=dm.geraCodigo('G_REG60M',8);
 q := TIBQuery.Create(Self);
 q.Database:=dbrestaurante;
 q.Transaction:=transacao;
 q.Active:=false;
 q.sql.add('insert into reg60M (cod_reg,data,num_serie,num_ord,modelo,coo_ini,coo_fim,cont_z,co_rein_op,');
 q.sql.add('venda_bruta,tot_geral) values (');
 q.sql.add(QuotedStr(codigo)+',');
 q.sql.add(Quotedstr(FormatDateTime('DD.MM.YYY',dataMovimentoECF))+',');
 q.sql.add(QuotedStr(NumSerie)+',');
 q.sql.add(QuotedStr(FormatFloat('000',StrToFloat(NumECF)))+',');
 q.sql.add(QuotedStr('2D')+',');
 q.sql.add(QuotedStr(NumCOOInicial)+',');
 q.sql.add(QuotedStr(NumCOO)+',');
 q.sql.add(QuotedStr(NumCRZ)+',');
 q.sql.add(QuotedStr(FormatFloat('000',StrToFloat(NumCRO)))+',');
 q.sql.add(TrocaVirgPPto(VendaBruta)+',');
 q.sql.add(TrocaVirgPPto(GrandeTotal)+')');
 try
   q.ExecSQL;
 Except
 end;


 // Grava Cancelamentos..
 q.Active:=false;
 q.SQL.Clear;
 codigo :=dm.geraCodigo('G_REG60A',8);
 q.sql.add('insert into REG60A (cod_reg,data,num_serie,valor_acumulado,aliquota) values (');
 q.sql.add(''+Quotedstr(codigo)+',');
 q.sql.add(Quotedstr(FormatDateTime('DD.MM.YYY',dataMovimentoECF))+',');
 q.sql.add(QuotedStr(NumSerie)+',');
 q.sql.add(TrocaVirgPPto(TotalCancelamentos)+',');
 q.sql.add(QuotedStr('CANC')+')');
 q.ExecSQL;

 // Grava descontos
 q.Active:=false;
 q.SQL.Clear;
 codigo :=dm.geraCodigo('G_REG60A',8);
 q.sql.add('insert into REG60A (cod_reg,data,num_serie,valor_acumulado,aliquota) values (');
 q.sql.add(''+Quotedstr(codigo)+',');
 q.sql.add(Quotedstr(FormatDateTime('DD.MM.YYY',dataMovimentoECF))+',');
 q.sql.add(QuotedStr(NumSerie)+',');
 q.sql.add(TrocaVirgPPto(TotalDescontos)+',');
 q.sql.add(QuotedStr('DESC')+')');
 q.ExecSQL;

  // Grava Acresimos
 q.Active:=false;
 q.SQL.Clear;
 codigo :=dm.geraCodigo('G_REG60A',8);
 q.sql.add('insert into REG60A (cod_reg,data,num_serie,valor_acumulado,aliquota) values (');
 q.sql.add(''+Quotedstr(codigo)+',');
 q.sql.add(Quotedstr(FormatDateTime('DD.MM.YYY',dataMovimentoECF))+',');
 q.sql.add(QuotedStr(NumSerie)+',');
 q.sql.add(TrocaVirgPPto(TotalAcrescimos)+',');
 q.sql.add(QuotedStr('ACRE')+')');
 q.ExecSQL;


  // Grava substituição
 q.Active:=false;
 q.SQL.Clear;
 codigo :=dm.geraCodigo('G_REG60A',8);
 q.sql.add('insert into REG60A (cod_reg,data,num_serie,valor_acumulado,aliquota) values (');
 q.sql.add(''+Quotedstr(codigo)+',');
 q.sql.add(Quotedstr(FormatDateTime('DD.MM.YYY',dataMovimentoECF))+',');
 q.sql.add(QuotedStr(NumSerie)+',');
 q.sql.add(TrocaVirgPPto(TotalSubstituicaoTributaria)+',');
 q.sql.add(QuotedStr('F')+')');
 q.ExecSQL;

   // Grava isencao
 q.Active:=false;
 q.SQL.Clear;
 codigo :=dm.geraCodigo('G_REG60A',8);
 q.sql.add('insert into REG60A (cod_reg,data,num_serie,valor_acumulado,aliquota) values (');
 q.sql.add(''+Quotedstr(codigo)+',');
 q.sql.add(Quotedstr(FormatDateTime('DD.MM.YYY',dataMovimentoECF))+',');
 q.sql.add(QuotedStr(NumSerie)+',');
 q.sql.add(TrocaVirgPPto(TotalIsencao)+',');
 q.sql.add(QuotedStr('I')+')');
 q.ExecSQL;

   // Grava nao tributado
 q.Active:=false;
 q.SQL.Clear;
 codigo :=dm.geraCodigo('G_REG60A',8);
 q.sql.add('insert into REG60A (cod_reg,data,num_serie,valor_acumulado,aliquota) values (');
 q.sql.add(''+Quotedstr(codigo)+',');
 q.sql.add(Quotedstr(FormatDateTime('DD.MM.YYY',dataMovimentoECF))+',');
 q.sql.add(QuotedStr(NumSerie)+',');
 q.sql.add(TrocaVirgPPto(TotalNaoTributado)+',');
 q.sql.add(QuotedStr('N')+')');
 q.ExecSQL;

    // 4%
q.Active:=false;
 q.SQL.Clear;
 codigo :=dm.geraCodigo('G_REG60A',8);
 q.sql.add('insert into REG60A (cod_reg,data,num_serie,valor_acumulado,aliquota) values (');
 q.sql.add(''+Quotedstr(codigo)+',');
 q.sql.add(Quotedstr(FormatDateTime('DD.MM.YYY',dataMovimentoECF))+',');
 q.sql.add(QuotedStr(NumSerie)+',');
 q.sql.add(TrocaVirgPPto(total0400)+',');
 q.sql.add(QuotedStr('0400')+')');
 q.ExecSQL;

         {

 //Gravação das alíquotas...
 frm_principal.ECF.LerTotaisAliquota;

 for ct := 0 to frm_principal.ecf.aliquotas.Count -1 do
  begin
     q.Active:=false;
     q.SQL.Clear;
     codigo :=dm.geraCodigo('G_REG60A',8);
     q.sql.add('insert into REG60A (cod_reg,data,num_serie,valor_acumulado,aliquota) values (');
     q.sql.add(''+Quotedstr(codigo)+',');
     q.sql.add(Quotedstr(FormatDateTime('DD.MM.YYY',dataMovimentoECF))+',');
     q.sql.add(QuotedStr(NumSerie)+',');
     q.sql.add(TrocaVirgPPto(FormatFloat('#0.00',frm_principal.ecf.Aliquotas[ct].Total) )+',');
     q.sql.add(QuotedStr(removeCaracteres(FormatFloat('#00.00',frm_principal.ecf.Aliquotas[ct].Aliquota)))+')');
     q.ExecSQL;
  end;
    }




 dm.transacao.Commit;
 ArqIni.Free;

 q.Active:=false;
 FreeAndNil(q);
end;


function Tdm.imprimeLinhaArquivo(marca : integer; linha : Widestring;
         negrito :boolean; italico : boolean; sublinhado : boolean; tam : boolean;
         comprimido : boolean; largura : boolean; altura : boolean ) : string;
var
 formato : string;
 dummy : integer;
 tipoletraBmt, italicoBmt, sublinhadoBmt, expBmt, negritoBmt : integer;
begin
   if tam = true then
     expBmt := 1;

    case marca of
      1: begin

           if comprimido = true then tipoletraBmt:=1 else tipoletraBmt:=3;
           if italico = true then italicoBmt:=1 else italicoBmt:=0;
           if sublinhado = true then sublinhadoBmt:=1 else sublinhadoBmt:=0;
           if largura = true then expBmt:=1 else expBmt:=0;
           if negrito = true then negritoBmt:=1 else negritoBmt:=0;

           if (StrToInt(dm.LeIni(1,'IMPRESSORA_NAO_FISCAL_01','via_dll')) = 1) then
            begin
//             linha := '200'+Inttostr(expBmt)+Inttostr(negritoBmt)+linha+#13#10;

             linha:= formatacaoBematech(negrito,italico,sublinhado,tam,comprimido,largura,altura)+linha;
             linha:= linha+formatacaoBematechFinal(negrito,italico,sublinhado,tam,comprimido,largura,altura);
             linha:=linha+#13#10;

            end
           else
            begin
             linha:= formatacaoBematech(negrito,italico,sublinhado,tam,comprimido,largura,altura)+linha;
             linha:= linha+formatacaoBematechFinal(negrito,italico,sublinhado,tam,comprimido,largura,altura);
             linha:=linha+#13#10;
            end;


           gravaStrEmArquivoDeTexto(patchAplicacao+'extrato.dat',linha);

         end;

      2: begin
           linha:=formatacaoDarumaNova (negrito,italico,sublinhado,tam,comprimido,largura,altura)+linha;
           linha:=linha+formatacaoDarumaNovaFinal (negrito,italico,sublinhado,tam,comprimido,largura,altura);
           linha:=linha+chr(13)+chr(10);

          gravaStrEmArquivoDeTexto(patchAplicacao+'extrato.dat',linha);
         end;

      3: begin
            formato:= chr(27) + chr(64);
            gravaStrEmArquivoDeTexto(patchAplicacao+'extrato.dat',formato);

                if negrito then
                 begin
                   formato:= formato + chr(27) + chr(69) + chr(1);
                   gravaStrEmArquivoDeTexto(patchAplicacao+'extrato.dat',formato);
                end;

                if tam then
                 begin
                   formato:= formato + chr(29) + chr(33) + chr(16);
                   gravaStrEmArquivoDeTexto(patchAplicacao+'extrato.dat',formato);
                 end;
                  linha:=linha+chr(13)+chr(10);
                  gravaStrEmArquivoDeTexto(patchAplicacao+'extrato.dat',linha);

         end;

      4: begin
          linha:=linha+chr(13)+chr(10);
          gravaStrEmArquivoDeTexto(patchAplicacao+'extrato.dat',linha);
         end;

      5: begin
          linha:= formatacaoElginXprint(negrito,italico,sublinhado,tam,comprimido,largura,altura)+linha;
          linha:=linha+chr(13)+chr(10);
          gravaStrEmArquivoDeTexto(patchAplicacao+'extrato.dat',linha);
         end;
    end;
end;
















function Tdm.imprimeLinhaECF(marca : integer; linha : Widestring;
         negrito :boolean; italico : boolean; sublinhado : boolean; tam : boolean;
         comprimido : boolean; largura : boolean; altura : boolean ) : string;
var
 formato : string;
 dummy : integer;
 tipoletraBmt, italicoBmt, sublinhadoBmt, expBmt, negritoBmt : integer;
begin
   if tam = true then
     expBmt := 1;


 if (StrToInt(dm.LeIni(1,'IMPRESSORA_NAO_FISCAL_01','usarACBR')) = 1) then
  begin
   linha:= formatacaoACBRInicial(negrito,italico,sublinhado,tam,comprimido,largura,altura)+linha;
   linha:= linha+formatacaoACBRFinal(negrito,italico,sublinhado,tam,comprimido,largura,altura);
   linha:=linha+chr(13)+chr(10);
   gravaStrEmArquivoDeTexto(patchAplicacao+'extrato.dat',linha);
  end

  else
   begin
    case marca of
      1: begin

           if comprimido = true then tipoletraBmt:=1 else tipoletraBmt:=3;
           if italico = true then italicoBmt:=1 else italicoBmt:=0;
           if sublinhado = true then sublinhadoBmt:=1 else sublinhadoBmt:=0;
           if largura = true then expBmt:=1 else expBmt:=0;
           if negrito = true then negritoBmt:=1 else negritoBmt:=0;

           if (StrToInt(dm.LeIni(1,'IMPRESSORA_NAO_FISCAL_01','via_dll')) = 1) then
            begin
//             linha := '200'+Inttostr(expBmt)+Inttostr(negritoBmt)+linha+#13#10;

             linha:= formatacaoBematech(negrito,italico,sublinhado,tam,comprimido,largura,altura)+linha;
             linha:= linha+formatacaoBematechFinal(negrito,italico,sublinhado,tam,comprimido,largura,altura);
             linha:=linha+#13#10;

            end
           else
            begin
             linha:= formatacaoBematech(negrito,italico,sublinhado,tam,comprimido,largura,altura)+linha;
             linha:= linha+formatacaoBematechFinal(negrito,italico,sublinhado,tam,comprimido,largura,altura);
             linha:=linha+#13#10;
            end;


           gravaStrEmArquivoDeTexto(patchAplicacao+'extrato.dat',linha);

         end;

      2: begin
           linha:=formatacaoDarumaNova (negrito,italico,sublinhado,tam,comprimido,largura,altura)+linha;
           linha:=linha+formatacaoDarumaNovaFinal (negrito,italico,sublinhado,tam,comprimido,largura,altura);
           linha:=linha+chr(13)+chr(10);

          gravaStrEmArquivoDeTexto(patchAplicacao+'extrato.dat',linha);
         end;

      3: begin
            formato:= chr(27) + chr(64);
            //gravaStrEmArquivoDeTexto(patchAplicacao+'extrato.dat',formato);

                if negrito then
                 begin
                   formato:= formato + chr(27) + chr(69) + chr(1);
                  // gravaStrEmArquivoDeTexto(patchAplicacao+'extrato.dat',formato);
                end;

                if tam then
                 begin
                   formato:= formato + chr(29) + chr(33) + chr(16);
                  // gravaStrEmArquivoDeTexto(patchAplicacao+'extrato.dat',formato);
                 end;
                  linha:=linha+chr(13)+chr(10);

                  gravaStrEmArquivoDeTexto(patchAplicacao+'extrato.dat',formato+linha);

         end;

      4: begin
          linha:=linha+chr(13)+chr(10);
          gravaStrEmArquivoDeTexto(patchAplicacao+'extrato.dat',linha);
         end;

      5: begin
          linha:= formatacaoElginXprint(negrito,italico,sublinhado,tam,comprimido,largura,altura)+linha;
          linha:=linha+chr(13)+chr(10);
          gravaStrEmArquivoDeTexto(patchAplicacao+'extrato.dat',linha);
         end;


      6: begin
          linha:= formatacaoElginI9 (negrito,italico,sublinhado,tam,comprimido,largura,altura)+linha;
          linha:=linha+chr(13)+chr(10);
          gravaStrEmArquivoDeTexto(patchAplicacao+'extrato.dat',linha);
         end;


      7: begin
         end;

    end;
  end;

end;




procedure Tdm.imprimeReciboRecebimentoFaturas(marca: integer ; codCliente : string ; nomeCliente : string ; totalFaturas : real);
var
 str : string;
  frmVazio : Tfrm_modelo_vazio;

 ct : integer;

 tamStr : integer;
begin

  Application.CreateForm(Tfrm_modelo_vazio,frmVazio);

 tb_parametros.Active := true;
 frm_principal.memo_avisos.Lines.clear;
 If FileExists(caminhoArquivoExtrato) then DeleteFile(caminhoArquivoExtrato);
 imprimeLinhaECF(marca,linhaExtrato,false,false,false,false,false,false,false);
 imprimeLinhaECF(marca,dm.centralizar(nome_fantasia,qtdColunasExpandidoECF),true,false,false,true,false,true,false);
 imprimeLinhaECF(marca,linhaExtrato,false,false,false,false,false,false,false);
 str:=FormatDateTime('DD/MM/YYY',DATE)+' '+FormatDateTime('HH:MM:SS',time);
 imprimeLinhaECF(marca,str,false,false,false,false,true,false,false);
 str:='N. Caixa: '+ultimoCaixaAberto;
 imprimeLinhaECF(marca,str,false,false,false,false,true,false,false);
 str:='Operador: '+nome_usuario_responsavel;
 imprimeLinhaECF(marca,str,false,false,false,false,true,false,false);
 imprimeLinhaECF(marca,linhaExtrato,false,false,false,false,false,false,false);
 imprimeLinhaECF(marca,dm.centralizar('RECIBO DE PENDURA',qtdColunasExpandidoECF),true,false,false,true,false,true,false);
 imprimeLinhaECF(marca,linhaExtrato,false,false,false,false,false,false,false);
 str:='Recebi de '+codCliente+'-'+nomeCliente;
 imprimeLinhaECF(marca,str,false,false,false,false,true,false,false);
 str:='A importancia de '+ formatFloat('R$ ###,###,##0.00',totalFaturas);
 imprimeLinhaECF(marca,str,false,false,false,false,true,false,false);
 str:='Ref. ao pagto das faturas (penduras):';
 imprimeLinhaECF(marca,' ',false,false,false,false,true,false,false);
 imprimeLinhaECF(marca,str,false,false,false,false,true,false,false);
 dm.qryConsultaFaturas.First;
 dm.qryConsultaFaturas.First;
 while not dm.qryConsultaFaturas.Eof do
  begin
   if dm.qryConsultaFaturasSELECAO.Value = 1 then
    begin
      str:= dm.qryConsultaFaturasCOD_FATURA.Value+'  -  '+formatFloat('R$ ###,###,##0.00',dm.qryConsultaFaturasVALOR_FATURA.value);
      imprimeLinhaECF(marca,str,false,false,false,false,true,false,false);
    end;
   dm.qryConsultaFaturas.Next;
  end;


 frmEncerramentoContasAssinadas.tbFormasPagamentoTemp.First;
   while not frmEncerramentoContasAssinadas.tbFormasPagamentoTemp.Eof do
    begin
      if (frmEncerramentoContasAssinadas.tbFormasPagamentoTemp.Bof ) then
       begin
        dm.imprimeLinhaECF(marca,linhaExtrato,true,false,false,false,false,false,false);
        dm.imprimeLinhaECF(marca,dm.centralizar('FORMAS DE PAGAMENTO',qtdColunasNormalECF),true,false,false,false,false,false,false);
       end;
        str:=formatoRodapeExtrato;
        str:=dm.organizarCupom(str,frmEncerramentoContasAssinadas.tbFormasPagamentoTempdescricaoForma.value ,'#');
        str:=dm.organizarCupom(str,'','*');
        str:=dm.organizarCupom(str,'','%');
        tamStr :=alinhamentoDireitaTotal- length(trim(str));
        str:= trim(str)+dm.alinha_valor_a_direita(tamStr,FormatFloat('R$ ###,###,##0.00 ', (frmEncerramentoContasAssinadas.tbFormasPagamentoTempvalorForma.value) ));

        dm.imprimeLinhaECF(marca,trim(str),false,false,false,false,false,false,false);
       frmEncerramentoContasAssinadas.tbFormasPagamentoTemp.Next;
    end;


 imprimeLinhaECF(marca,'',false,false,false,false,true,false,false);
 imprimeLinhaECF(marca,'',false,false,false,false,true,false,false);
 imprimeLinhaECF(marca,'',false,false,false,false,true,false,false);
 imprimeLinhaECF(marca,'',false,false,false,false,true,false,false);
 imprimeLinhaECF(marca,dm.centralizar('------------------------------',qtdColunasNormalECF),false,false,false,false,false,false,false);
 imprimeLinhaECF(marca,dm.centralizar(nome_comp_usuario_responsavel ,qtdColunasNormalECF),false,false,false,false,false,false,false);

 if impressora_fiscal_instalada = 0 then
  begin
   for ct:=0 to  StrToInt(dm.LeIni(2,'extrato','linhasFinalExtrato')) do
      begin
        imprimeLinhaECF(marca,'                     ',false,false,false,false,false,false,false);
      end;
  end;


  frm_principal.memo_avisos.Lines.LoadFromFile(caminhoArquivoExtrato);
   if (localDeEmissaoDeExtrato = 1 )  then // Imprime o extrato no ECF
    begin
      if frmVazio.validacaoArquivoAuxiliarPaf(caminhoArquivoAuxiliarPAF) = false then
        begin
          exit;
        end;
      frm_principal.ecf.RelatorioGerencial(frm_principal.memo_avisos.lines ,1,codRelatorioGerencialExtrato);
    end
   else
    begin
      imprimeTexoMiniPrinter();
    end;



end;




function  Tdm.imprimeCabecalhoECF(marca : integer; tipo : integer;  mesa : string; codVenda : string; codPedidoDelivery : string; codCliente : string; nomeCliente : string; via: smallint) : boolean;
var
 str : string;
 ct : integer;
 informacoesMesa : TInformacoesDaMesa;
 q : TIBQuery;
begin
  q := TIBquery.create(self);
  q.Database := dm.dbrestaurante;
  q.Transaction := dm.transacao;
  q.Active:=false;
  q.SQL.Clear;
  q.sql.add('select first 1  udf_minutesbetween(mm.hora_lancamento,current_timestamp) as TOTAL_MINUTOS');
  q.sql.add('        ,(udf_minutesbetween(mm.hora_lancamento,current_timestamp) /60) as HORAS');
  q.sql.add('      ,udf_mod(udf_minutesbetween(mm.hora_lancamento,current_timestamp),60) as MINUTOS');
  q.sql.add('        from movimento_mesa mm');
  q.sql.add('       where mm.cod_mesa='+QuotedStr(mesa));
  q.sql.add('        order by mm.hora_lancamento asc');
  q.Active:=true;
  ct:=0;

   if ( (mesa <> mesaDelivery) and (mesa <> mesaBalcao ) )
   then
    begin
      informacoesMesa := TInformacoesDaMesa.Create();
      informacoesMesa := getInformacoesDaMesa(mesa);
    end;
{
    if ( trim(codVenda) <> '') then
    begin
     imprimeLinhaECF(marca,dm.centralizar('COD. '+codVenda,qtdColunasExpandidoECF),true,false,false,true,false,true,false);
    end;
 }
   imprimeLinhaECF(marca,' ',false,false,false,false,false,false,false);
    if (localDeEmissaoDeExtrato = 1) then
     begin

     end
    else
     begin
        dm.
        imprimeLinhaECF(marca,dm.centralizar(nome_fantasia,qtdColunasExpandidoECF),true,false,false,true,false,true,false);
        imprimeLinhaECF(marca,dm.centralizar('',qtdColunasExpandidoECF),true,false,false,true,false,true,false)
     end;

   imprimeLinhaECF(marca,linhaExtrato,false,false,false,false,false,false,false);

    if (mesa <> mesaDelivery ) then
     begin
       case tipo of
         1: dm.imprimeLinhaECF(marca,dm.centralizar('CONFERENCIA DE MESA',qtdColunasExpandidoECF),true,false,false,true,false,true,false);
         2: begin
             dm.imprimeLinhaECF(marca,dm.centralizar('ENCERRAMENTO' ,qtdColunasExpandidoECF),true,false,false,true,false,true,false);
             dm.imprimeLinhaECF(marca,dm.centralizar('VENDA N '+Inttostr(StrToInt(codVenda)) ,qtdColunasExpandidoECF),true,false,false,true,false,true,false);
            end;
         3: dm.imprimeLinhaECF(marca,dm.centralizar('ESTORNO DE MESA',qtdColunasExpandidoECF),true,false,false,true,false,true,false);
         4: dm.imprimeLinhaECF(marca,dm.centralizar('COMPROVANTE DE PEDIDO',qtdColunasExpandidoECF),true,false,false,true,false,true,false);
       end;
     end;
   dm.imprimeLinhaECF(marca,dm.centralizar('VIA '+IntToStr(via) ,qtdColunasExpandidoECF),true,false,false,true,false,true,false);
   imprimeLinhaECF(marca,linhaExtrato,false,false,false,false,false,false,false);

    str:=FormatDateTime('DD/MM/YYY',DATE)+' '+FormatDateTime('HH:MM:SS',time);
    imprimeLinhaECF(marca,str,false,false,false,false,true,false,false);

    if ( (mesa <> mesaDelivery ) and (mesa <> mesaBalcao )) then
      imprimeLinhaECF(marca,dm.LeIni(2,'CAIXA','titulo_cabecalho_cupom')+' '+mesa,true,false,false,true,false,true,false)
    else
     begin
        if (mesa = mesaDelivery ) then
          begin
            if tipo <> 2 then
             imprimeLinhaECF(marca,dm.centralizar('DELIVERY',qtdColunasExpandidoECF),true,false,false,true,false,true,false)
            else
             imprimeLinhaECF(marca,dm.centralizar('BAIXA-DELIVERY',qtdColunasExpandidoECF),true,false,false,true,false,true,false);

            imprimeLinhaECF(marca,dm.centralizar('PED.: '+codPedidoDelivery,qtdColunasExpandidoECF),true,false,false,true,false,true,false);
            imprimeLinhaECF(marca,trim(str),false,false,false,false,true,false,false);
          end
        else
          imprimeLinhaECF(marca,dm.centralizar('BALCAO - '+codPedidoDelivery,qtdColunasExpandidoECF),true,false,false,true,false,true,false)
     end;


    // Pega permanencia.


    q.Active:=false;
    q.SQL.Clear;
    q.sql.add('select first 1  udf_minutesbetween(mm.hora_lancamento,current_timestamp) as TOTAL_MINUTOS');
    q.sql.add('        ,(udf_minutesbetween(mm.hora_lancamento,current_timestamp) /60) as HORAS');
    q.sql.add('      ,udf_mod(udf_minutesbetween(mm.hora_lancamento,current_timestamp),60) as MINUTOS');
    q.sql.add('        from movimento_mesa mm');
    q.sql.add('       where mm.cod_mesa='+QuotedStr(mesa));
    q.sql.add('        order by mm.hora_lancamento asc');
    q.Active:=true;


    str:='Caixa Nº: '+ultimoCaixaAberto;
    imprimeLinhaECF(marca,str,false,false,false,false,true,false,false);
    str:='Operador: '+nome_usuario_responsavel;
    imprimeLinhaECF(marca,str,false,false,false,false,true,false,false);
    str:='Garcon: '+getNomeGarconAbriuMesa(mesa);
    imprimeLinhaECF(marca,str,false,false,false,false,true,false,false);

    if (trim(codCliente) <> '') then
     begin
      str:='Cod Cliente: '+codCliente;
      imprimeLinhaECF(marca,str,true,false,true,false,true,false,false);
      str:='Cliente: '+nomeCliente;
      imprimeLinhaECF(marca,str,true,false,true,false,true,false,false);
     end;


    if q.IsEmpty = false then
     begin
       str:='Tempo de Atendimento: '+FormatFloat('00',StrToFloat(q.fieldbyname('HORAS').value))+':'+FormatFloat('00',StrToFloat(q.fieldbyname('MINUTOS').value));
       imprimeLinhaECF(marca,str,false,false,false,false,true,false,false);
     end;


    if ( mesa = mesaDelivery ) then
     begin
       str:='Pedido '+codPedidoDelivery;
       imprimeLinhaECF(marca,str,false,false,false,false,true,false,false);
       formataCabecalhoDelivery(codPedidoDelivery);

       for ct:=0 to frm_principal.memoFormatacaoDelivery.Lines.Count do
        begin
          str:= frm_principal.memoFormatacaoDelivery.Lines[ct];
          imprimeLinhaECF(marca,str,false,false,false,false,true,false,false);
        end;
     end;


    if (  tipo <> 2  ) then
     begin
        if layoutExtrato = 1 then
         begin
           imprimeLinhaECF(marca,linhaExtrato,false,false,false,false,false,false,false);
           str:=formatoCabecalhoExtrato;
           str:=dm.organizarCupom(str,'Qtd.','#');
           str:=organizarCupom(str,copy('Descricao',0,15),'*');
           str:=dm.organizarCupom(str,dm.alinha_valor_a_direita(alinhamentoDireitaTotal, 'Total'),'%');
           imprimeLinhaECF(marca,trim(str),false,false,false,false,false,false,false);
           imprimeLinhaECF(marca,linhaExtrato,false,false,false,false,false,false,false);
         end
        else
         begin
           imprimeLinhaECF(marca,linhaExtrato,false,false,false,false,false,false,false);
           str:=formatoCabecalhoExtratoLayout2Linha1;
           str:=dm.organizarCupom(str,'Cod.','#');
           str:=dm.organizarCupom(str,'Descricao','*');
           imprimeLinhaECF(marca,trim(str),false,false,false,false,false,false,false);
           str:=formatoCabecalhoExtratoLayout2Linha2;
           str:=dm.organizarCupom(str,'Qtd.','#');
           str:=dm.organizarCupom(str,' ','$');
           str:=dm.organizarCupom(str,'Vl. un.','*');
           str:=dm.organizarCupom(str,'Total','%');
           imprimeLinhaECF(marca,trim(str),false,false,false,false,false,false,false);
            imprimeLinhaECF(marca,linhaExtrato,false,false,false,false,false,false,false);
         end;
     end
    else
     begin
       if (StrToInt(dm.LeIni(1,'ENCERRAMENTO','imprime_movimento')) = 1) then
         begin
            if layoutExtrato = 1 then
             begin
               imprimeLinhaECF(marca,linhaExtrato,false,false,false,false,false,false,false);
               str:=formatoCabecalhoExtrato;
               str:=dm.organizarCupom(str,'Qtd.','#');
               str:=organizarCupom(str,copy('Descricao',0,15),'*');
               str:=dm.organizarCupom(str,dm.alinha_valor_a_direita(alinhamentoDireitaTotal, 'Total'),'%');
               imprimeLinhaECF(marca,trim(str),false,false,false,false,false,false,false);
               imprimeLinhaECF(marca,linhaExtrato,false,false,false,false,false,false,false);
             end
            else
             begin
               imprimeLinhaECF(marca,linhaExtrato,false,false,false,false,false,false,false);
               str:=formatoCabecalhoExtratoLayout2Linha1;
               str:=dm.organizarCupom(str,'Cod.','#');
               str:=dm.organizarCupom(str,'Descricao','*');
               imprimeLinhaECF(marca,trim(str),false,false,false,false,false,false,false);
               str:=formatoCabecalhoExtratoLayout2Linha2;
               str:=dm.organizarCupom(str,'Qtd.','#');
               str:=dm.organizarCupom(str,' ','$');
               str:=dm.organizarCupom(str,'Vl. un.','*');
               str:=dm.organizarCupom(str,'Total','%');
               imprimeLinhaECF(marca,trim(str),false,false,false,false,false,false,false);
               imprimeLinhaECF(marca,linhaExtrato,false,false,false,false,false,false,false);
             end;

         end;
     end;




    q.active:=false;
    FreeAndNil(q);
end;



procedure Tdm.imprimirPromissorias(marca : INTEGER; codVenda : string);
var
 str : string;
 ct : integer;
 q : TIBQuery;
  frmVazio : Tfrm_modelo_vazio;
 vias : Integer;


 tamStr : integer;

begin


  Application.CreateForm(Tfrm_modelo_vazio,frmVazio);





 tb_parametros.Active := true;
 frm_principal.memo_avisos.Lines.clear;

  q := TIBquery.create(self);
  q.Database := dm.dbrestaurante;
  q.Transaction := dm.transacao;
  q.Active:=false;
  q.SQL.Clear;
  q.Active := false;

  q.SQL.Clear;

  q.SQL.add('select f.cod_fatura, c.cod_cli, c.cgc_cpf, c.razao_social, f.data_fatura,f.data_vencimento,');
  q.SQL.add('        f.valor_fatura,f.cod_venda,f.hora   from faturas f');
  q.SQL.add('       inner join clientes c on (c.cod_cli = f.cod_cli)');
  q.sql.add(' where f.cod_venda='+Quotedstr(codVenda));

  q.Active := True;

  if ( q.IsEmpty = false)  then
   begin
     q.First;
     while not q.eof do
      begin

       for vias:=1 to 2 do
       begin
         string_auxiliar :='S';
        if (vias = 2) then
          begin
            string_auxiliar := 'N';
            Application.CreateForm(Tfrm_confirma_extrato, frm_confirma_extrato);
            frm_confirma_extrato.setTitulo('Confirmação');
            frm_confirma_extrato.setMensagem('Imprimivir via do cliente ?',16);
            frm_confirma_extrato.ShowModal;
            frm_confirma_extrato.free;
          end
        else
         begin
           string_auxiliar := 'S';
         end;

        if (string_auxiliar = 'S') then
          begin
           If FileExists(caminhoArquivoExtrato) then DeleteFile(caminhoArquivoExtrato);
           imprimeLinhaECF(marca,linhaExtrato,false,false,false,false,false,false,false);
           imprimeLinhaECF(marca,dm.centralizar(nome_fantasia,qtdColunasExpandidoECF),true,false,false,true,false,true,false);
           imprimeLinhaECF(marca,linhaExtrato,false,false,false,false,false,false,false);
           str:=FormatDateTime('DD/MM/YYY',DATE)+' '+FormatDateTime('HH:MM:SS',time);
           imprimeLinhaECF(marca,str,false,false,false,false,true,false,false);
           str:='N. Caixa: '+ultimoCaixaAberto;
           imprimeLinhaECF(marca,str,false,false,false,false,true,false,false);
           str:='Operador: '+nome_usuario_responsavel;
           str:='N. Promissoria: '+q.fieldbyname('cod_fatura').Value;
           imprimeLinhaECF(marca,str,false,false,false,false,true,false,false);

           imprimeLinhaECF(marca,' ',false,false,false,false,true,false,false);
           imprimeLinhaECF(marca,linhaExtrato,false,false,false,false,false,false,false);
           imprimeLinhaECF(marca,dm.centralizar('NOTA PROMISSORIA',qtdColunasExpandidoECF),true,false,false,true,false,true,false);
           imprimeLinhaECF(marca,linhaExtrato,false,false,false,false,false,false,false);
           if vias = 1 then
            begin
             imprimeLinhaECF(marca,dm.centralizar('VIA DA EMPRESA',qtdColunasExpandidoECF),true,false,false,true,false,true,false);
             imprimeLinhaECF(marca,linhaExtrato,false,false,false,false,false,false,false);
           end
          else
           begin
             imprimeLinhaECF(marca,dm.centralizar('VIA DO CLIENTE',qtdColunasExpandidoECF),true,false,false,true,false,true,false);
             imprimeLinhaECF(marca,linhaExtrato,false,false,false,false,false,false,false);


           end;

           imprimeLinhaECF(marca,' ',false,false,false,false,false,false,false);
           imprimeLinhaECF(marca,' ',false,false,false,false,false,false,false);
           str:='Cliente : '+q.fieldbyname('cod_cli').Value +' - '+q.fieldbyname('razao_social').Value;
           imprimeLinhaECF(marca,str,false,false,false,false,true,false,false);
           imprimeLinhaECF(marca,'  ',false,false,false,false,true,false,false);
           imprimeLinhaECF(marca,'  ',false,false,false,false,true,false,false);
           str:='NA DATA '+FormatDateTime('DD/MM/YY',q.fieldbyname('data_vencimento').Value) +', PAGAREI À';
           imprimeLinhaECF(marca,str,false,false,false,false,true,false,false);
           str:=razao_social;
           imprimeLinhaECF(marca,str,false,false,false,false,true,false,false);
           str:='CPF/CNPJ: '+cnpj;
           imprimeLinhaECF(marca,str,false,false,false,false,true,false,false);

           str:='OU À SUA ORDEM, A QUANTIA DE '+FormatFloat('R$ #0.00',q.fieldbyname('valor_fatura').Value);
           imprimeLinhaECF(marca,str,false,false,false,false,true,false,false);


           str:=frm_principal.escreveExtenso.ValorToTexto(q.fieldbyname('valor_fatura').Value);
           imprimeLinhaECF(marca,str,false,false,false,false,true,false,false);
           str:='EM MOEDA CORRENTE NACIONAL.';
           imprimeLinhaECF(marca,str,false,false,false,false,true,false,false);


           imprimeLinhaECF(marca,'  ',false,false,false,false,true,false,false);
           imprimeLinhaECF(marca,'  ',false,false,false,false,true,false,false);
           imprimeLinhaECF(marca,'  ',false,false,false,false,true,false,false);
           imprimeLinhaECF(marca,'  ',false,false,false,false,true,false,false);
           imprimeLinhaECF(marca,dm.centralizar('------------------------------',qtdColunasNormalECF),false,false,false,false,false,false,false);
           imprimeLinhaECF(marca,dm.centralizar(q.fieldbyname('razao_social').Value ,qtdColunasNormalECF),false,false,false,false,false,false,false);
           imprimeLinhaECF(marca,dm.centralizar('CNPJ/CPF: '+q.fieldbyname('CGC_CPF').Value ,qtdColunasNormalECF),false,false,false,false,false,false,false);

           if impressora_fiscal_instalada = 0 then
            begin
             for ct:=0 to  StrToInt(dm.LeIni(2,'extrato','linhasFinalExtrato')) do
                begin
                  imprimeLinhaECF(marca,'                     ',false,false,false,false,false,false,false);
                end;
            end;


            frm_principal.memo_avisos.Lines.LoadFromFile(caminhoArquivoExtrato);
             imprimeTexoMiniPrinter();

           end
        else
         begin

         end;
       end;
       q.next;

      end;
   end;

end;



procedure  Tdm.imprimeCabecalhoRelatorioDeCaixa(marca : integer; numeroCaixa : string);
var
 str : string;
 ct : integer;
 frmVazio : Tfrm_modelo_vazio;
begin

    Application.CreateForm(Tfrm_modelo_vazio,frmVazio);
    imprimeLinhaECF(marca,dm.centralizar(nome_fantasia,qtdColunasExpandidoECF),true,false,false,true,false,true,false);
    imprimeLinhaECF(marca,' ',false,false,false,false,false,false,false);

    if ( frmVazio.verificaSeCaixaEstaAberto(numeroCaixa) = true ) then
      imprimeLinhaECF(marca,dm.centralizar('CAIXA - PARCIAL',qtdColunasExpandidoECF),true,false,false,true,false,true,false)
    else
      imprimeLinhaECF(marca,dm.centralizar('CAIXA - FECHAMENTO',qtdColunasExpandidoECF),true,false,false,true,false,true,false);

    imprimeLinhaECF(marca,dm.centralizar(formatDateTime('DD/MM/YY',frmVazio.getDataSistemaCaixa(numeroCaixa)),qtdColunasExpandidoECF),true,false,false,true,false,true,false);
    imprimeLinhaECF(marca,'',true,false,false,false,true,false,false);
    str:='Cod. Caixa.........: '+numeroCaixa;
    imprimeLinhaECF(marca,str,true,false,false,false,true,false,false);
    str:='Operador...........: '+frmVazio.getNomeOperadorCaixa(numeroCaixa);
    imprimeLinhaECF(marca,str,true,false,false,false,true,false,false);
    str:='Hora de Abertura...: '+FormatDateTime('HH:MM:SS',frmVazio.getHoraAberturaCaixa(numeroCaixa));
    imprimeLinhaECF(marca,str,true,false,false,false,true,false,false);

    if ( frmVazio.verificaSeCaixaEstaAberto(numeroCaixa) = true ) then
      str:='Hora do Parcial........: '+FormatDateTime('HH:MM:SS',time)
    else
     str:='Hora do Fechamento...: '+FormatDateTime('HH:MM:SS',frmVazio.getHoraFechamentoCaixa(numeroCaixa));
    imprimeLinhaECF(marca,str,true,false,false,false,true,false,false);

    str:='Suprimentos........: '+formatFloat('R$ ###,###,##0.00',frmVazio.getTotalSuprimentosCaixa(numeroCaixa));
    imprimeLinhaECF(marca,str,true,false,false,false,true,false,false);
    str:='Sangrias...........: '+formatFloat('R$ ###,###,##0.00',frmVazio.getTotalSangriasCaixa(numeroCaixa));
    imprimeLinhaECF(marca,str,true,false,false,false,true,false,false);
    str:='Penduras Recebidas.: '+formatFloat('R$ ###,###,##0.00',frmVazio.getTotalPendurasRecebidasCaixa(numeroCaixa));
    imprimeLinhaECF(marca,str,true,false,false,false,true,false,false);


    imprimeLinhaECF(marca,linhaExtrato,false,false,false,false,false,false,false);
    imprimeLinhaECF(marca,'',false,false,false,false,false,false,false);

   FreeAndNil(frmVazio);
end;


procedure  Tdm.imprimeCabecalhoRelatorioDeEncerramentoDia(marca : integer; data: Tdate);
var
 str : string;
 ct : integer;
 frmVazio : Tfrm_modelo_vazio;
begin

    Application.CreateForm(Tfrm_modelo_vazio,frmVazio);
    imprimeLinhaECF(marca,dm.centralizar(nome_fantasia,qtdColunasExpandidoECF),true,false,false,true,false,true,false);
    imprimeLinhaECF(marca,' ',false,false,false,false,false,false,false);
    imprimeLinhaECF(marca,dm.centralizar('RELATORIO DE ENCERRAMENTO',qtdColunasExpandidoECF),true,false,false,true,false,true,false);

//    imprimeLinhaECF(marca,dm.centralizar(formatDateTime('DD/MM/YY',data ),qtdColunasExpandidoECF),true,false,false,true,false,true,false);
    imprimeLinhaECF(marca,'',true,false,false,false,true,false,false);
    str:='Hora : '+FormatDateTime('HH:MM:SS',time);
   imprimeLinhaECF(marca,str,true,false,false,false,true,false,false);
//    str:='Suprimentos........: '+formatFloat('R$ ###,###,##0.00',frmVazio.getTotalSuprimentosCaixa(numeroCaixa));
    imprimeLinhaECF(marca,str,true,false,false,false,true,false,false);
//    str:='Sangrias...........: '+formatFloat('R$ ###,###,##0.00',frmVazio.getTotalSangriasCaixa(numeroCaixa));
    imprimeLinhaECF(marca,str,true,false,false,false,true,false,false);
    imprimeLinhaECF(marca,linhaExtrato,false,false,false,false,false,false,false);
    imprimeLinhaECF(marca,'',false,false,false,false,false,false,false);
   FreeAndNil(frmVazio);
end;


procedure  Tdm.imprimeComprovanteSangria(marca : integer; codSangria : string);
var
 str : string;
 ct : integer;
 frmVazio : Tfrm_modelo_vazio;
 q : TIBQuery;
 vias : smallint;

begin

    If FileExists(caminhoArquivoExtrato) then DeleteFile(caminhoArquivoExtrato);
    If FileExists(caminhoArquivoExtrato) then DeleteFile(caminhoArquivoExtrato);
    q:= TIBQuery.Create(self);
    q.Database:=dm.dbrestaurante;
    q.Transaction:=dm.transacao;
    q.active:=false;
    q.SQL.clear;
    q.sql.add('select s.valor, s.codigo, s.codigo_tipo,s.cod_caixa,');
    q.sql.add('       s.cod_forma,f.descricao as descricao_forma,s.obs,s.cod_usuario_autorizou,s.nome_usuario_autorizou');
    q.sql.add('  from sangrias s');
    q.sql.add('  inner join formas_pagamento f on (f.cod_forma = s.cod_forma)');
    q.sql.add('  where s.codigo='+Quotedstr(codSangria));
    q.Active:=true;

    Application.CreateForm(Tfrm_modelo_vazio,frmVazio);
    for vias := 1 to qtdViasSangria  do
     begin
       If FileExists(caminhoArquivoExtrato) then DeleteFile(caminhoArquivoExtrato); 
        imprimeLinhaECF(marca,dm.centralizar(nome_fantasia,qtdColunasExpandidoECF),true,false,false,true,false,true,false);
        imprimeLinhaECF(marca,' ',false,false,false,false,false,false,false);
        imprimeLinhaECF(marca,linhaExtrato,false,false,false,false,false,false,false);
        imprimeLinhaECF(marca,dm.centralizar('SANGRIA DE CAIXA',qtdColunasExpandidoECF),true,false,false,true,false,true,false);
        imprimeLinhaECF(marca,dm.centralizar('VIA '+IntToStr(vias) ,qtdColunasExpandidoECF),true,false,false,true,false,true,false);
        imprimeLinhaECF(marca,dm.centralizar(formatDateTime('DD/MM/YY',frmVazio.getDataSistemaCaixa(q.FieldByName('cod_caixa').Value)),qtdColunasExpandidoECF),true,false,false,true,false,true,false);
        imprimeLinhaECF(marca,'',true,false,false,false,true,false,false);
        str:='Cod. Caixa.........: '+q.FieldByName('cod_caixa').Value;
        imprimeLinhaECF(marca,str,true,false,false,false,true,false,false);
        str:='Cod. Sangria.......: '+q.FieldByName('codigo').Value;
        imprimeLinhaECF(marca,str,true,false,false,false,true,false,false);
        str:='Operador...........: '+frmVazio.getNomeOperadorCaixa(q.FieldByName('cod_caixa').Value);
        imprimeLinhaECF(marca,str,true,false,false,false,true,false,false);
        str:='Hora...............: '+FormatDateTime('HH:MM:SS',time);
        imprimeLinhaECF(marca,str,true,false,false,false,true,false,false);
        str:='Valor...............: '+formatFloat('R$ ###,###,##0.00',q.FieldByName('valor').Value );
        imprimeLinhaECF(marca,str,true,false,false,false,true,false,false);
        str:='Forma de Pagto......: '+q.FieldByName('descricao_forma').Value;
        imprimeLinhaECF(marca,str,true,false,false,false,true,false,false);

        if (trim(q.FieldByName('obs').Value) <> '') then
         begin
           imprimeLinhaECF(marca,'Observacoes:',false,false,false,false,false,false,false);
           frm_principal.memoObsMiniprinter.Lines.Clear;
           frm_principal.memoObsMiniprinter.Lines.add(q.FieldByName('obs').Value);
           for ct:=0 to frm_principal.memoObsMiniprinter.Lines.Count do
            begin
               imprimeLinhaECF(marca,frm_principal.memoObsMiniprinter.Lines[ct],true,false,false,false,true,false,false);
            end;
         end;


        imprimeLinhaECF(marca,dm.centralizar('------------------------------',qtdColunasNormalECF),false,false,false,false,false,false,false);
        imprimeLinhaECF(marca,dm.centralizar('AUTORIZADA POR:  '+q.FieldByName('nome_usuario_autorizou').Value,qtdColunasNormalECF),false,false,false,false,false,false,false);


        imprimeLinhaECF(marca,linhaExtrato,false,false,false,false,false,false,false);
        imprimeLinhaECF(marca,'',false,false,false,false,false,false,false);
        imprimeLinhaECF(marca,'',false,false,false,false,false,false,false);
        imprimeLinhaECF(marca,dm.centralizar('------------------------------',qtdColunasNormalECF),false,false,false,false,false,false,false);
        imprimeLinhaECF(marca,dm.centralizar('Assinatura do Operador',qtdColunasNormalECF),false,false,false,false,false,false,false);

        imprimeLinhaECF(marca,'',false,false,false,false,false,false,false);
        imprimeLinhaECF(marca,'',false,false,false,false,false,false,false);

       imprimeLinhaECF(marca,dm.centralizar('------------------------------',qtdColunasNormalECF),false,false,false,false,false,false,false);
        imprimeLinhaECF(marca,dm.centralizar('Assinatura do Recebedor',qtdColunasNormalECF),false,false,false,false,false,false,false);
        imprimeLinhaECF(marca,linhaExtrato,false,false,false,false,false,false,false);
        imprimeLinhaECF(marca,'',false,false,false,false,false,false,false);
        imprimeLinhaECF(marca,'',false,false,false,false,false,false,false);
        imprimeLinhaECF(marca,linhaExtrato,false,false,false,false,false,false,false);

         for ct:=0 to  StrToInt(dm.LeIni(2,'extrato','linhasFinalExtrato')) do
          begin
           imprimeLinhaECF(marca,'                     ',false,false,false,false,false,false,false);
         end;

        if  (impressora_fiscal_instalada = 0)  then
         begin
           if ( StrToInt(dm.LeIni(2,'IMPRESSORA_NAO_FISCAL_01','cortaPapel')) =1 ) then
               cortaPapelImpNF(caminhoArquivoExtrato, marca,1);
         end;



        frm_principal.memo_avisos.Lines.LoadFromFile(caminhoArquivoExtrato);

        if (localDeEmissaoDeExtrato = 1 )  then // Imprime o extrato no ECF
          begin
             frm_principal.ecf.RelatorioGerencial(frm_principal.memo_avisos.lines ,1,codRelatorioGerencialExtrato);
          end
        else
           begin
             imprimeTexoMiniPrinter();
           end;

     end;

   FreeAndNil(q);
   FreeAndNil(frmVazio);
end;



procedure  Tdm.imprimeComprovanteRecebimentoParcial(marca : integer; mesa : string);
var
 str : string;
 ct : integer;
 frmVazio : Tfrm_modelo_vazio;
 q : TIBQuery;
 totalRecebimentos : double;


begin

    If FileExists(caminhoArquivoExtrato) then DeleteFile(caminhoArquivoExtrato);
    If FileExists(caminhoArquivoExtrato) then DeleteFile(caminhoArquivoExtrato);
    q:= TIBQuery.Create(self);
    q.Database:=dm.dbrestaurante;
    q.Transaction:=dm.transacao;


    Application.CreateForm(Tfrm_modelo_vazio,frmVazio);
    imprimeLinhaECF(marca,dm.centralizar(nome_fantasia,qtdColunasExpandidoECF),true,false,false,true,false,true,false);
    imprimeLinhaECF(marca,' ',false,false,false,false,false,false,false);
    imprimeLinhaECF(marca,linhaExtrato,false,false,false,false,false,false,false);
    imprimeLinhaECF(marca,dm.centralizar('RECEBIMENTOS PARCIAIS',qtdColunasExpandidoECF),true,false,false,true,false,true,false);
    imprimeLinhaECF(marca,dm.centralizar('Mesa: '+mesa,qtdColunasExpandidoECF),true,false,false,true,false,true,false);
    imprimeLinhaECF(marca,dm.centralizar(formatDateTime('DD/MM/YY',data_do_sistema),qtdColunasExpandidoECF),true,false,false,true,false,true,false);
    imprimeLinhaECF(marca,'',true,false,false,false,true,false,false);
    str:='Cod. Caixa.........: '+ultimoCaixaAberto;
    imprimeLinhaECF(marca,str,true,false,false,false,true,false,false);
    str:='Operador...........: '+nome_usuario;
    imprimeLinhaECF(marca,str,true,false,false,false,true,false,false);
    str:='Hora...............: '+FormatDateTime('HH:MM:SS',time);
    imprimeLinhaECF(marca,str,true,false,false,false,true,false,false);




    str:='#########################*******************';
    str:=dm.organizarCupom(str,'Forma','#');
    str:=dm.organizarCupom(str,'Operador','%');
    str:=dm.organizarCupom(str,'Valor','*');
    imprimeLinhaECF(marca,trim(str),true,false,false,false,true,false,false);
    imprimeLinhaECF(marca,linhaExtrato,false,false,false,false,false,false,false);

    q.active:=false;
    q.SQL.clear;
    q.sql.add('select r.*,f.descricao from recebimento_parcial r inner join formas_pagamento f on (f.cod_forma = r.cod_forma) where r.mesa='+Quotedstr(mesa));
    q.Active:=true;
    q.first;

    totalRecebimentos :=0;
    while not q.eof do
     begin
       str:='#########################*******************';
       str:=dm.organizarCupom(str,q.fieldbyname('descricao').value,'#');
       str:=dm.organizarCupom(str,formatFloat('R$ ###,###,##0.00',q.fieldbyname('valor').value   ),'*');
       totalRecebimentos:= totalRecebimentos +   q.fieldbyname('valor').value;
       imprimeLinhaECF(marca,trim(str),false,false,false,false,true,false,false);
       q.Next;
     end;


    imprimeLinhaECF(marca,linhaExtrato,false,false,false,false,false,false,false);
    imprimeLinhaECF(marca,'',false,false,false,false,false,false,false);
    imprimeLinhaECF(marca,'',false,false,false,false,false,false,false);


    imprimeLinhaECF(marca,dm.centralizar('Assinatura do Operador',qtdColunasNormalECF),false,false,false,false,false,false,false);
    imprimeLinhaECF(marca,linhaExtrato,false,false,false,false,false,false,false);


     for ct:=0 to  StrToInt(dm.LeIni(2,'extrato','linhasFinalExtrato')) do
      begin
       imprimeLinhaECF(marca,'                     ',false,false,false,false,false,false,false);
     end;

    if  (impressora_fiscal_instalada = 0)  then
     begin
       if ( StrToInt(dm.LeIni(2,'IMPRESSORA_NAO_FISCAL_01','cortaPapel')) =1 ) then
           cortaPapelImpNF(caminhoArquivoExtrato, marca,1);
   end;



    frm_principal.memo_avisos.Lines.LoadFromFile(caminhoArquivoExtrato);




    if (localDeEmissaoDeExtrato = 1 )  then // Imprime o extrato no ECF
      begin
         frm_principal.ecf.RelatorioGerencial(frm_principal.memo_avisos.lines ,1,codRelatorioGerencialExtrato);
      end
    else
       begin
         imprimeTexoMiniPrinter();
       end;




   FreeAndNil(q);
   FreeAndNil(frmVazio);
end;


procedure  Tdm.imprimeEstornosCaixa(marca : integer; numeroCaixa : string);
var
 str : string;
 ct : integer;
 frmVazio : Tfrm_modelo_vazio;
 q   : TIBQuery;
 diferenca : string;
 qtdEstornos : integer;

 begin
  q := TIBquery.create(self);
  q.Database := dm.dbrestaurante;
  q.Transaction := dm.transacao;
  q.Active:=false;
  q.SQL.Clear;
  q.SQL.add(' select es.*,(es.quantidade * es.valor_unitario) as total, c.nome_usuario');
  q.SQL.add('  from estornos es');
  q.SQL.add('    inner join caixas c on (c.codigo = es.cod_caixa)');
  q.sql.add('    where es.cod_caixa='+Quotedstr(numeroCaixa) );
  q.SQL.add('    order by es.mesa,es.hora');
  q.active:=true;
  q.first;

  if q.IsEmpty = false  then
  begin
    qtdEstornos:= 0;
    imprimeLinhaECF(marca,'',true,false,false,false,true,false,false);
    imprimeLinhaECF(marca,'',true,false,false,false,true,false,false);
    imprimeLinhaECF(marca,linhaExtrato,false,false,false,false,false,false,false);
    imprimeLinhaECF(marca,dm.centralizar('ESTORNOS',qtdColunasExpandidoECF),true,false,false,true,false,true,false);
    imprimeLinhaECF(marca,linhaExtrato,false,false,false,false,false,false,false);
    str:='#######@@@@@@@$$$$$$$%%%%%%%%!!!!!!!!!!!!';
    str:=dm.organizarCupom(str,'Cod.','#');
    str:=dm.organizarCupom(str,'Mesa.','@');
    str:=dm.organizarCupom(str,'Prod.','$');
    str:=dm.organizarCupom(str,'Qtde','%');
    str:=dm.organizarCupom(str,'Total','!');
    imprimeLinhaECF(marca,str,false,false,false,false,true,false,false);
    imprimeLinhaECF(marca,linhaExtrato,false,false,false,false,false,false,false);


    while not q.Eof do
      begin
       str:='#######@@@@@@@$$$$$$$%%%%%%%%%%!!!!!!!!!!!';
       str:=dm.organizarCupom(str,q.fieldbyname('codigo').value,'#');
       str:=dm.organizarCupom(str,q.fieldbyname('MESA').value,'@');
       str:=dm.organizarCupom(str,q.fieldbyname('cod_produto').value,'$');
       str:=dm.organizarCupom(str,formatFloat('###,###,##0.000',q.fieldbyname('quantidade').value),'%');
       str:=dm.organizarCupom(str,formatFloat('R$ ###,###,##0.00',q.fieldbyname('total').value),'!');
       imprimeLinhaECF(marca,trim(str),false,false,false,false,false,false,false);
       qtdEstornos:=qtdEstornos+1;
       q.next;
      end;
    q.Active:=false;
    q.SQL.Clear;
    q.SQL.add(' select sum (es.quantidade * es.valor_unitario) as total');
    q.SQL.add('  from estornos es');
    q.sql.add('    where es.cod_caixa='+Quotedstr(numeroCaixa) );
    q.active:=true;

    imprimeLinhaECF(marca,'',false,false,false,false,false,false,false);
    imprimeLinhaECF(marca,'Qtd.  de Estornos: '+IntToStr(qtdEstornos) ,true,false,false,false,false,false,false);
    imprimeLinhaECF(marca,'Total de Estornos: '+formatFloat('R$ ###,###,##0.00',q.fieldbyname('total').value),true,false,false,false,false,false,false);
  end;
  FreeAndNil(q);
  FreeAndNil(frmVazio);
end;


procedure  Tdm.imprimePedidosDeliveryCaixa(marca : integer; numeroCaixa : string);
var
 str : string;
 ct : integer;
 frmVazio : Tfrm_modelo_vazio;
 q   : TIBQuery;
 q2  : TIBQuery;
 diferenca : string;
 impresso : boolean;

 begin
  q := TIBquery.create(self);
  q.Database := dm.dbrestaurante;
  q.Transaction := dm.transacao;

  q2 := TIBquery.create(self);
  q2.Database := dm.dbrestaurante;
  q2.Transaction := dm.transacao;




  imprimeLinhaECF(marca,'',true,false,false,false,true,false,false);
  imprimeLinhaECF(marca,'',true,false,false,false,true,false,false);

  q.Active := false;
  q.sql.clear;
  q.SQL.Add(' select count(*) as qtde ,pd.cod_entregador,et.nome_entregador  from pedidos_delivery pd ');
  q.SQL.Add('  inner join entregadores et on (et.codigo = pd.cod_entregador) ');
  q.SQL.Add('    where pd.status=3 and pd.cod_caixa='+QuotedStr(numeroCaixa));
  q.SQL.Add('    group by pd.cod_entregador , et.nome_entregador ');
  q.Active := true;

  if not q.IsEmpty  then
   begin
     imprimeLinhaECF(marca,linhaExtrato,false,false,false,false,false,false,false);
     imprimeLinhaECF(marca,dm.centralizar('DELIVERY',qtdColunasExpandidoECF),true,false,false,true,false,true,false);
     imprimeLinhaECF(marca,linhaExtrato,false,false,false,false,false,false,false);
     str:='#########################$$$$$$$$$$$$$$$$$';
     str:=dm.organizarCupom(str,'Entregador','#');
     str:=dm.organizarCupom(str,'Qtde de Ped.','$');
     imprimeLinhaECF(marca,str,false,false,false,false,true,false,false);
     imprimeLinhaECF(marca,linhaExtrato,false,false,false,false,false,false,false);

     q.First;
     while not q.Eof do
      begin
       str:='#########################$$$$$$$%%%%%%%%%%';
       str:=dm.organizarCupom(str,q.fieldbyname('nome_entregador').value,'#');
       str:=dm.organizarCupom(str,' ','$');
       str:=dm.organizarCupom(str,Inttostr(q.fieldbyname('qtde').value) ,'%');
//       imprimeLinhaECF(marca,str,false,false,false,false,true,false,false);
       imprimeLinhaECF(marca,trim(str),false,false,false,false,true,false,false);
       q.Next;
      end;

     imprimeLinhaECF(marca,linhaExtrato,false,false,false,false,false,false,false);
     q2.Active := false;
     q2.SQL.Clear;
     q2.SQL.Add(' select count(*) as qtde ,sum(pd.valor_total) as total from pedidos_delivery pd  ');
     q2.SQL.Add('    where pd.status=3 and pd.cod_caixa='+QuotedStr(numeroCaixa));
     q2.Active := true;
     imprimeLinhaECF(marca,'Num de pedidos: '+inttostr(q2.fieldbyname('qtde').value),true,false,false,false,true,false,false);
     imprimeLinhaECF(marca,'Total.......: '+formatFloat('R$ ###,###,##0.00',q2.fieldbyname('total').value) ,true,false,false,false,true,false,false);
     imprimeLinhaECF(marca,linhaExtrato,false,false,false,false,false,false,false);
   end;


   imprimeLinhaECF(marca,'',false,false,false,false,false,false,false);
   imprimeLinhaECF(marca,'',false,false,false,false,false,false,false);
   imprimeLinhaECF(marca,'',false,false,false,false,false,false,false);
   q.Active:=false;
   FreeAndNil(q);
   q2.Active:=false;
   FreeAndNil(q2);

   FreeAndNil(frmVazio);
end;




procedure  Tdm.imprimeProdutosVendidosCaixa(marca : integer; numeroCaixa : string);
var
 str : string;
 ct : integer;
 frmVazio : Tfrm_modelo_vazio;
 q   : TIBQuery;
 q2  : TIBQuery;
 diferenca : string;
 impresso : boolean;

 begin
  imprimeLinhaECF(marca,'',true,false,false,false,true,false,false);
  imprimeLinhaECF(marca,'',true,false,false,false,true,false,false);

  imprimeLinhaECF(marca,linhaExtrato,false,false,false,false,false,false,false);
  imprimeLinhaECF(marca,dm.centralizar('PRODUTOS VENDIDOS',qtdColunasExpandidoECF),true,false,false,true,false,true,false);
  imprimeLinhaECF(marca,linhaExtrato,false,false,false,false,false,false,false);
  str:='###################$$$$$$$$$$$$$%%%%%%%%%%';
  str:=dm.organizarCupom(str,'Descricao','#');
  str:=dm.organizarCupom(str,'Qtde.','$');
  str:=dm.organizarCupom(str,'Total','%');
  imprimeLinhaECF(marca,str,false,false,false,false,true,false,false);
  imprimeLinhaECF(marca,linhaExtrato,false,false,false,false,false,false,false);


  q := TIBquery.create(self);
  q.Database := dm.dbrestaurante;
  q.Transaction := dm.transacao;

  q2 := TIBquery.create(self);
  q2.Database := dm.dbrestaurante;
  q2.Transaction := dm.transacao;




  q.Active:=false;
  q.SQL.Clear;
  q.SQL.add(' select * from grupos where udf_len(cod_grupo)=6');
  q.SQL.add(' order by cod_grupo');
  q.active:=true;
  q.first;

  while not q.eof do
   begin
     impresso:=false;
     q2.Active:=false;
     q2.SQL.clear;
     q2.sql.add(' select * from r_produtos_vendidos_caixa('+Quotedstr(numeroCaixa)+') rp');
     q2.sql.add('  where rp.cod_grupo='+Quotedstr(q.fieldbyname('cod_grupo').value));
     q2.sql.add(' order by rp.cod_produto');
     dm.adicionaLog(q2.SQL.Text);
     q2.active:=true;
     q2.First;

    if q2.IsEmpty = false then
     begin
       while not q2.Eof do
        begin
           if (impresso = false) then
            begin
              str:='############################################';
              str:=dm.organizarCupom(str,q.fieldbyname('descricao').value,'#');
              imprimeLinhaECF(marca,trim(str),true,false,false,false,true,false,false);
              impresso:=true;
            end;

              str:='######################$$$$$$$%%%%%%%%%%%%%%%';
              str:=dm.organizarCupom(str,Inttostr(StrToInt(copy(q2.fieldbyname('cod_produto').value,0,6))),'@');
              str:=dm.organizarCupom(str,+q2.fieldbyname('descricao').value,'#');
              str:=dm.organizarCupom(str,formatFloat('###,###,##0.000',q2.fieldbyname('quantidade_contagem').value),'$');
              str:=dm.organizarCupom(str,formatFloat('R$ ###,###,##0.00',q2.fieldbyname('total').value),'%');
              imprimeLinhaECF(marca,trim(str),false,false,false,false,true,false,false);
            q2.next;
        end;
        q2.Active:=false;
        q2.SQL.clear;
        q2.sql.add('  select sum(rp.quantidade_contagem) as quantidade_total ,sum(rp.total) as total_grupo from r_produtos_vendidos_caixa('+QuotedStr(numeroCaixa)+') rp');
        q2.sql.add('    where rp.cod_grupo='+Quotedstr(q.fieldbyname('cod_grupo').value));

        q2.active:=true;

        str:='@@@@@@@@@@@@@@@@@@@$$$$$$%%%%%%%%%%%%%%%';
        str:=dm.organizarCupom(str,'Totais:','@');
        str:=dm.organizarCupom(str,formatFloat('###,###,##0.000',q2.fieldbyname('quantidade_total').value),'$');
        str:=dm.organizarCupom(str,formatFloat('R$ ###,###,##0.00',q2.fieldbyname('total_grupo').value),'%');
        imprimeLinhaECF(marca,trim(str),true,false,false,false,true,false,false);
     end;
     q.next;
   end;

   imprimeLinhaECF(marca,'',false,false,false,false,false,false,false);
   imprimeLinhaECF(marca,'',false,false,false,false,false,false,false);
   imprimeLinhaECF(marca,'',false,false,false,false,false,false,false);
   q.Active:=false;
   FreeAndNil(q);
   q2.Active:=false;
   FreeAndNil(q2);

   FreeAndNil(frmVazio);
end;


procedure  Tdm.imprimeResumoCaixa(marca : integer; numeroCaixa : string);
var
 str : string;
 ct : integer;
 frmVazio : Tfrm_modelo_vazio;
 q : TIBQuery;
 diferenca : string;

 begin
  str:='#############$$$$$$$$$%%%%%%%%%%************';
  str:=dm.organizarCupom(str,'Forma','#');
  str:=dm.organizarCupom(str,'Sistema','$');
  str:=dm.organizarCupom(str,'Operador','%');
  str:=dm.organizarCupom(str,'Dif.','*');
  imprimeLinhaECF(marca,trim(str),true,false,false,false,true,false,false);
  imprimeLinhaECF(marca,linhaExtrato,false,false,false,false,false,false,false);
  q := TIBquery.create(self);
  q.Database := dm.dbrestaurante;
  q.Transaction := dm.transacao;

  q.Active:=false;
  q.SQL.Clear;
  q.SQL.add(' select fp.descricao ,ap.total_sistema as total_forma,   ap.*  from apuracao_caixa ap ');
  q.SQL.add(' join formas_pagamento fp on (fp.cod_forma = ap.cod_forma) ');
  q.sql.add(' where ap.cod_caixa='+Quotedstr(numeroCaixa));
  q.active:=true;
  q.first;

  while not q.eof do
   begin
     str:='#############$$$$$$$$$%%%%%%%%%%************';
     str:=dm.organizarCupom(str,q.fieldbyname('descricao').value,'#');
     str:=dm.organizarCupom(str,formatFloat('###,###,##0.00',q.fieldbyname('total_forma').value   ),'$');

     str:=dm.organizarCupom(str,formatFloat('###,###,##0.00',q.fieldbyname('total_operador').value),'%');

     if q.fieldbyname('diferenca').value > 0 then
         diferenca:='+'+formatFloat('###,###,##0.00',q.fieldbyname('diferenca').value)
     else
        diferenca:=formatFloat('###,###,##0.00',q.fieldbyname('diferenca').value);

     str:=dm.organizarCupom(str,diferenca,'*');
     imprimeLinhaECF(marca,trim(str),false,false,false,false,true,false,false);
     q.Next;
   end;
  imprimeLinhaECF(marca,linhaExtrato,false,false,false,false,false,false,false);

  q.Active:=false;
  q.sql.clear;
  q.sql.add('select sum(total_sistema)as total_entradas,sum(diferenca) as total_diferenca,sum(apenas_vendas) as total_vendas, sum(total_sistema) as total_sistema, sum(total_suprimentos) as total_suprimentos,');
  q.sql.add(' sum(total_sangrias) as total_sangrias,sum(total_penduras) as total_penduras ');
  q.sql.Add(' from apuracao_caixa where cod_caixa='+QUotedstr(numeroCaixa));
  q.active:=true;
  str:='###########$$$$$$$$$$$$%%%%%%%************';
  str:=dm.organizarCupom(str,'Totais: ','#');
  str:=dm.organizarCupom(str,formatFloat('###,###,##0.00',q.fieldbyname('total_entradas').value),'$');
  str:=dm.organizarCupom(str,formatFloat('###,###,##0.00',0),'%');

  if q.fieldbyname('total_diferenca').value > 0 then
    diferenca:='+'+formatFloat('###,###,##0.00',q.fieldbyname('total_diferenca').value)
  else
    diferenca:=formatFloat('###,###,##0.00',q.fieldbyname('total_diferenca').value);

  str:=dm.organizarCupom(str,diferenca,'*');
  imprimeLinhaECF(marca,(str),true,false,false,false,true,false,false);
  imprimeLinhaECF(marca,'',true,false,false,false,true,false,false);
  str:='Suprimentos............: '+formatFloat('R$ ###,###,##0.00',q.fieldbyname('total_suprimentos').value);
  imprimeLinhaECF(marca,(str),true,false,false,false,true,false,false);
  str:='Sangrias...............: '+formatFloat('R$ ###,###,##0.00',q.fieldbyname('total_sangrias').value);
  imprimeLinhaECF(marca,(str),true,false,false,false,true,false,false);
  str:='Penduras Recebidas.....: '+formatFloat('R$ ###,###,##0.00',q.fieldbyname('total_penduras').value );
  imprimeLinhaECF(marca,(str),true,false,false,false,true,false,false);

  str:='Vendas (Com Tx. Serv.).: '+formatFloat('R$ ###,###,##0.00',q.fieldbyname('total_vendas').value);
  imprimeLinhaECF(marca,(str),true,false,false,false,true,false,false);
  str:='Vendas (Sem Tx. Serv.).: '+formatFloat('R$ ###,###,##0.00',q.fieldbyname('total_vendas').value - frmVazio.getTotalTaxaServicoCaixa(numeroCaixa) );
  imprimeLinhaECF(marca,(str),true,false,false,false,true,false,false);
  imprimeLinhaECF(marca,linhaExtrato,false,false,false,false,false,false,false);
  str:='Saldo em caixa.........: '+formatFloat('R$ ###,###,##0.00',q.fieldbyname('total_entradas').value);
  imprimeLinhaECF(marca,(str),true,false,false,false,true,false,false);
  str:='Taxa de Servico........: '+formatFloat('R$ ###,###,##0.00',frmVazio.getTotalTaxaServicoCaixa(numeroCaixa) );
  imprimeLinhaECF(marca,(str),true,false,false,false,true,false,false);
  imprimeLinhaECF(marca,linhaExtrato,false,false,false,false,false,false,false);

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

  q.Active:=false;
  FreeAndNil(q);

  FreeAndNil(frmVazio);
end;





procedure  Tdm.imprimeResumoDoDia(marca : integer; dataSistema : Tdate);
var
 str : string;
 ct : integer;
 frmVazio : Tfrm_modelo_vazio;
 q : TIBQuery;
 diferenca : string;

 begin
  str:='#############$$$$$$$$$%%%%%%%%%%************';
  str:=dm.organizarCupom(str,'Forma','#');
  str:=dm.organizarCupom(str,'Sistema','$');
  str:=dm.organizarCupom(str,'Operador','%');
  str:=dm.organizarCupom(str,'Dif.','*');
  imprimeLinhaECF(marca,trim(str),true,false,false,false,true,false,false);
  imprimeLinhaECF(marca,linhaExtrato,false,false,false,false,false,false,false);
  q := TIBquery.create(self);
  q.Database := dm.dbrestaurante;
  q.Transaction := dm.transacao;



  q.Active := false;
  q.sql.clear;
  q.SQL.add('   select fp.cod_forma, fp.descricao, sum(r.valor) as total_forma   from recebimentos r ');
  q.SQL.add('  inner join formas_pagamento fp on (fp.cod_forma = r.cod_forma)');
//  q.SQL.add('  where r.data='10.09.2015'');
  q.SQL.add('  group by fp.cod_forma, fp.descricao');
  q.Active := true;


  while not q.eof do
   begin
     str:='#########################$$$$$$$$$%%%%%%%%%%';
     str:=dm.organizarCupom(str,q.fieldbyname('descricao').value,'#');
     str:=dm.organizarCupom(str,formatFloat('###,###,##0.00',q.fieldbyname('total_forma').value   ),'$');
     str:=dm.organizarCupom(str,'','%');
     imprimeLinhaECF(marca,trim(str),false,false,false,false,true,false,false);
     q.Next;
   end;
  imprimeLinhaECF(marca,linhaExtrato,false,false,false,false,false,false,false);

  q.Active:=false;
  q.sql.clear;
  q.sql.add('select sum(total_sistema)as total_entradas,sum(diferenca) as total_diferenca,sum(apenas_vendas) as total_vendas, sum(total_sistema) as total_sistema, sum(total_suprimentos) as total_suprimentos,');
  q.sql.add(' sum(total_sangrias) as total_sangrias,sum(total_penduras) as total_penduras ');
  q.sql.Add(' from apuracao_caixa where cod_caixa='+QUotedstr('00025'));
  q.active:=true;

//  frm_principal.memo_avisos.Visible := true;
  frm_principal.memo_avisos.Lines := q.SQL;


  str:='###########$$$$$$$$$$$$%%%%%%%************';
  str:=dm.organizarCupom(str,'Totais: ','#');
  str:=dm.organizarCupom(str,formatFloat('###,###,##0.00',q.fieldbyname('total_entradas').value),'$');
  str:=dm.organizarCupom(str,formatFloat('###,###,##0.00',0),'%');

  if q.fieldbyname('total_diferenca').value > 0 then
    diferenca:='+'+formatFloat('###,###,##0.00',q.fieldbyname('total_diferenca').value)
  else
    diferenca:=formatFloat('###,###,##0.00',q.fieldbyname('total_diferenca').value);

  str:=dm.organizarCupom(str,diferenca,'*');
  imprimeLinhaECF(marca,(str),true,false,false,false,true,false,false);
  imprimeLinhaECF(marca,'',true,false,false,false,true,false,false);
  str:='Suprimentos............: '+formatFloat('R$ ###,###,##0.00',q.fieldbyname('total_suprimentos').value);
  imprimeLinhaECF(marca,(str),true,false,false,false,true,false,false);
  str:='Sangrias...............: '+formatFloat('R$ ###,###,##0.00',q.fieldbyname('total_sangrias').value);
  imprimeLinhaECF(marca,(str),true,false,false,false,true,false,false);
  str:='Penduras Recebidas.....: '+formatFloat('R$ ###,###,##0.00',q.fieldbyname('total_penduras').value );
  imprimeLinhaECF(marca,(str),true,false,false,false,true,false,false);

  str:='Vendas (Com Tx. Serv.).: '+formatFloat('R$ ###,###,##0.00',q.fieldbyname('total_vendas').value);
  imprimeLinhaECF(marca,(str),true,false,false,false,true,false,false);
//  str:='Vendas (Sem Tx. Serv.).: '+formatFloat('R$ ###,###,##0.00',q.fieldbyname('total_vendas').value - frmVazio.getTotalTaxaServicoCaixa(numeroCaixa) );
  imprimeLinhaECF(marca,(str),true,false,false,false,true,false,false);
  imprimeLinhaECF(marca,linhaExtrato,false,false,false,false,false,false,false);
  str:='Saldo em caixa.........: '+formatFloat('R$ ###,###,##0.00',q.fieldbyname('total_entradas').value);
  imprimeLinhaECF(marca,(str),true,false,false,false,true,false,false);
//  str:='Taxa de Servico........: '+formatFloat('R$ ###,###,##0.00',frmVazio.getTotalTaxaServicoCaixa(numeroCaixa) );
  imprimeLinhaECF(marca,(str),true,false,false,false,true,false,false);
  imprimeLinhaECF(marca,linhaExtrato,false,false,false,false,false,false,false);


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

  q.Active:=false;
  FreeAndNil(q);

  FreeAndNil(frmVazio);
end;




procedure  Tdm.imprimeResumoGarcons(marca : integer; numeroCaixa : string);
var
 str : string;
 ct : integer;
 frmVazio : Tfrm_modelo_vazio;
 q : TIBQuery;
 diferenca : string;
 totalServico : double;
 totalOutrasComisssoes : double;
 totalGeral : double;
 begin

  imprimeLinhaECF(marca,'',true,false,false,false,true,false,false);
  imprimeLinhaECF(marca,'',true,false,false,false,true,false,false);

  imprimeLinhaECF(marca,linhaExtrato,false,false,false,false,false,false,false);
  imprimeLinhaECF(marca,dm.centralizar('PRODUCAO DE GARCONS',qtdColunasExpandidoECF),true,false,false,true,false,true,false);
  imprimeLinhaECF(marca,linhaExtrato,false,false,false,false,false,false,false);

  str:='#############$$$$$$$$$%%%%%%%%%%************';
  str:=dm.organizarCupom(str,'NOME','#');
  str:=dm.organizarCupom(str,'VENDAS','$');
  str:=dm.organizarCupom(str,'SERVICO','%');
  str:=dm.organizarCupom(str,'VL. A RECEB.','*');
  imprimeLinhaECF(marca,trim(str),true,false,false,false,true,false,false);
  imprimeLinhaECF(marca,linhaExtrato,false,false,false,false,false,false,false);
  q := TIBquery.create(self);
  q.Database := dm.dbrestaurante;
  q.Transaction := dm.transacao;

  q.Active:=false;
  q.SQL.Clear;
  q.SQL.add(' select * from r_taxa_servico_caixa('+Quotedstr(numeroCaixa)+')');
  q.active:=true;
  q.first;

  totalServico :=0;
  totalOutrasComisssoes :=0;
  totalGeral :=0;

  while not q.eof do
   begin
     str:='#############$$$$$$$$$%%%%%%%%%%************';
     str:=dm.organizarCupom(str,q.fieldbyname('nome').value,'#');
     str:=dm.organizarCupom(str,formatFloat('###,###,##0.00',q.fieldbyname('total_vendas').value   ),'$');
     str:=dm.organizarCupom(str,formatFloat('###,###,##0.00',q.fieldbyname('TOTAL_SERVICO').value),'%');
     str:=dm.organizarCupom(str,formatFloat('###,###,##0.00',q.fieldbyname('TOTAL_A_RECEBER').value),'*');

     totalServico              := q.fieldbyname('TOTAL_SERVICO').value + totalServico;
     totalOutrasComisssoes     := q.fieldbyname('total_comissao_extra').value + totalServico;
     totalGeral := (totalServico + totalOutrasComisssoes) + totalGeral;

     imprimeLinhaECF(marca,trim(str),false,false,false,false,true,false,false);
     q.Next;
   end;
  imprimeLinhaECF(marca,linhaExtrato,false,false,false,false,false,false,false);
  str:='########################********************';
  str:=dm.organizarCupom(str,'Tx. Serv..........:','#');
  str:=dm.organizarCupom(str,formatFloat('R$ ###,###,##0.00',totalServico),'*');
  imprimeLinhaECF(marca,trim(str),true,false,false,false,true,false,false);
  str:='########################********************';
  str:=dm.organizarCupom(str,'Comissoes extras..:','#');
  str:=dm.organizarCupom(str,formatFloat('R$ ###,###,##0.00',totalOutrasComisssoes),'*');
  imprimeLinhaECF(marca,trim(str),true,false,false,false,true,false,false);
  str:='########################********************';
  str:=dm.organizarCupom(str,'Total a repassar..:','#');
  str:=dm.organizarCupom(str,formatFloat('R$ ###,###,##0.00',totalGeral),'*');
  imprimeLinhaECF(marca,trim(str),true,false,false,false,true,false,false);
  imprimeLinhaECF(marca,linhaExtrato,false,false,false,false,false,false,false);
end;




procedure  Tdm.ImprimeVendasPorGarconAbriuMesa(marca : integer; numeroCaixa : string);
var
 str : string;
 ct : integer;
 frmVazio : Tfrm_modelo_vazio;
 q : TIBQuery;
 diferenca : string;
 totalServico,totalVendas,totalServicoCasa,totalServicoFuncionarios : double;
 totalOutrasComisssoes : double;
 totalGeral : double;
 percServicoGarcon,percServicoCasa,percServicoFuncionarios : double;
 begin

 percServicoGarcon := dm.tb_parametrosPERCENTUAL_SERVICO_GARCOM.Value / 100;
 percServicoCasa   := dm.tb_parametrosPERCENTUAL_SERVICO_CASA.Value / 100;
 percServicoFuncionarios  := dm.tb_parametrosPERCENTUAL_SERVICO_FUNCIONARIOS.Value /100;

 totalServico :=0;
 totalServicoCasa :=0;
 totalServicoFuncionarios :=0;

  q := TIBquery.create(self);
  q.Database := dm.dbrestaurante;
  q.Transaction := dm.transacao;

  q.Active:=false;
  q.SQL.Clear;
  q.SQL.add('select v.cod_garcon_abriu, g.apelido as nome,   count(*) as ct, ');
  q.SQL.add('     sum(v.valor_total) as total, ');
  q.SQL.add('     sum(v.valor_txserv) as totalServico, ');
  q.SQL.add('      ( sum(v.valor_txserv) * '+dm.TrocaVirgPPto(FloatToStr(percServicoGarcon))+') as totalGarcon, ');
  q.SQL.add('      ( sum(v.valor_txserv) * '+dm.TrocaVirgPPto(FloatToStr( percServicoCasa ))+') as totalCasa, ');
  q.SQL.add('      ( sum(v.valor_txserv) * '+dm.TrocaVirgPPto(FloatToStr(percServicoFuncionarios ))+') as totalFuncionarios ');
  q.SQL.add('      from vendas v ');
  q.SQL.add('   inner join garcons g on (g.cod_garcon = v.cod_garcon_abriu) ');
  q.SQL.add('   where cod_caixa='+QuotedStr(numeroCaixa));
  q.SQL.add('   group by v.cod_garcon_abriu, g.apelido  ');
  dm.adicionaLog(q.SQL.Text);

  q.active:=true;

  if not q.IsEmpty then
   begin
    imprimeLinhaECF(marca,'',true,false,false,false,true,false,false);
    imprimeLinhaECF(marca,'',true,false,false,false,true,false,false);
    imprimeLinhaECF(marca,linhaExtrato,false,false,false,false,false,false,false);
    imprimeLinhaECF(marca,dm.centralizar('VENDAS POR GARÇOM',qtdColunasExpandidoECF),true,false,false,true,false,true,false);
    imprimeLinhaECF(marca,linhaExtrato,false,false,false,false,false,false,false);
    imprimeLinhaECF(marca,linhaExtrato,false,false,false,false,false,false,false);

    q.First;

    while not q.eof do
     begin
      str:='############################################';
      str:=dm.organizarCupom(str,q.FieldByName('nome').value  ,'#');
      imprimeLinhaECF(marca,trim(str),true,false,false,false,true,false,false);

      str:='############################################';
      str:=dm.organizarCupom(str,'  Qtd.  de Vendas: '+Inttostr(q.FieldByName('ct').Value)    ,'#');
      imprimeLinhaECF(marca,(str),false,false,false,false,true,false,false);

      str:='############################################';
      str:=dm.organizarCupom(str,'  Total de Vendas: '+formatFloat('###,###,##0.00',q.fieldbyname('total').value   )    ,'#');
      imprimeLinhaECF(marca,(str),false,false,false,false,true,false,false);

      str:='############################################';
      str:=dm.organizarCupom(str,'  Total de Serviço    : '+formatFloat('###,###,##0.00',q.fieldbyname('totalServico').value   )    ,'#');
      imprimeLinhaECF(marca,(str),false,false,false,false,true,false,false);

      str:='############################################';
      str:=dm.organizarCupom(str,'  Serviço do Garçon-'+Floattostr(percServicoGarcon)+'%: '+formatFloat('###,###,##0.00',q.fieldbyname('totalGarcon').value   )    ,'#');
      imprimeLinhaECF(marca,(str),false,false,false,false,true,false,false);

      totalServico              := totalServico             + q.fieldbyname('totalServico').value;
      totalServicoCasa          := totalServicoCasa         + q.fieldbyname('totalCasa').value;
      totalServicoFuncionarios  := totalServicoFuncionarios + q.fieldbyname('totalFuncionarios').value;

      q.Next;
    end;
   end;
  imprimeLinhaECF(marca,linhaExtrato,false,false,false,false,false,false,false);

  if totalServicoCasa > 0 then
   begin
    str:='############################################';
    str:=dm.organizarCupom(str,'Serviço da casa   : '+formatFloat('###,###,##0.00',totalServicoCasa  )    ,'#');
    imprimeLinhaECF(marca,trim(str),true,false,false,false,true,false,false);
   end;

  if totalServicoFuncionarios > 0 then
  begin
    str:='############################################';
    str:=dm.organizarCupom(str,'Serviço funcionarios : '+formatFloat('###,###,##0.00',totalServicoFuncionarios   )    ,'#');
    imprimeLinhaECF(marca,trim(str),true,false,false,false,true,false,false);
  end;

  imprimeLinhaECF(marca,linhaExtrato,false,false,false,false,false,false,false);

end;


function Tdm.imprimeMovimentoContaECF(marca : integer; mesa : string; codVenda : string) : string;
var

 qryExtrato : TIBquery;
 str : Widestring;
 quantidade : string;
 tamStr : integer;
 descricaoProduto : string;

begin
  qryExtrato := TIBQuery.Create(Self);
  qryExtrato.Database:=dbrestaurante;
  qryExtrato.Transaction:=transacao;

  qryExtrato.active:=false;
  qryExtrato.sql.clear;

  dm.adicionaLog('Chamou a função de impressão dos itens do encerramento');


  if ( trim(codVenda) ='') then
   begin
      qryExtrato.SQL.add(' select mv.*,  udf_roundabnt((mv.valor_unitario * mv.qtde ),2) as total from ( select  vm.cod_produto, p.cod_barras, sum(vm.quantidade)   as qtde, vm.valor_unitario,p.descricao,vm.cancelado, vm.sabores ');
      qryExtrato.SQL.add('   from movimento_mesa vm ');
      qryExtrato.SQL.add('       inner join produtos p on (p.cod_produto = vm.cod_produto) ');
      qryExtrato.SQL.add('    where vm.cod_mesa ='+Quotedstr(mesa)+' and vm.valor_unitario >= 0 ');
      qryExtrato.SQL.add('         group by vm.cod_produto,p.cod_barras, p.descricao,vm.cancelado,vm.valor_unitario,vm.sabores,total ');
      qryExtrato.SQL.add('          order by cancelado,cod_barras asc) mv ');
      adicionaLog(qryExtrato.SQL.Text);
      qryExtrato.Active:=true;
      qryExtrato.FetchAll;
  end
else
 begin
      qryExtrato.SQL.add(' select mv.*,  udf_roundabnt((mv.valor_unitario * mv.qtde ),2) as total,'+Quotedstr('')+' as sabores ');
      qryExtrato.SQL.add(' from ( select  vm.cod_produto, p.cod_barras, sum(vm.quantidade)   as qtde,');
      qryExtrato.SQL.add('  vm.valor_unitario,p.descricao');
      qryExtrato.SQL.add('    from movimento_venda   vm ');
      qryExtrato.SQL.add('        inner join produtos p on (p.cod_produto = vm.cod_produto) ');
      qryExtrato.SQL.add('     where vm.cod_venda='+quotedstr(codVenda));
      qryExtrato.SQL.add('          group by vm.cod_produto,p.cod_barras, p.descricao,vm.valor_unitario');
      qryExtrato.SQL.add('           order by cod_barras asc) mv');
      adicionaLog(qryExtrato.SQL.Text);
      qryExtrato.Active:=true;
      qryExtrato.FetchAll;


 end;





  if qryExtrato.IsEmpty  then
   begin
     dm.adicionaLog('Sem movimento na conta informada!');
   end
  else
   begin
     dm.adicionaLog('Existia movimento para impressão dos ítens');
   end;


  while not qryExtrato.Eof do
  begin
     descricaoProduto := qryExtrato.fieldbyname('descricao').value;


    {
    case verificaTamanhoPizza(qryExtrato.fieldbyname('cod_produto').value,1) of
     0: descricaoProduto := qryExtrato.fieldbyname('descricao').value;
//     1: descricaoProduto := 'PIZZA COMBO';
     1: descricaoProduto := 'PIZZA BROTINHO';
     2: descricaoProduto := 'PIZZA PEQUENA';
     3: descricaoProduto := 'PIZZA MEDIA';
     4: descricaoProduto := 'PIZZA GRANDE';
//     5: descricaoProduto := 'PIZZA DO DIA';
          5: descricaoProduto := 'PIZZA FAMILIA';
    end;
   }


   try
     quantidade := InttoStr(StrToInt(floattostr(qryExtrato.fieldbyname('qtde').value)));
   except
     begin
      quantidade := FormatFloat('###,###,##0.000', (qryExtrato.fieldbyname('qtde').value));
     end;
   end;


   if layoutExtrato = 1 then
    begin
      str:=formatoCabecalhoExtrato;
      str:=dm.organizarCupom(str, quantidade,'#');
      str:=dm.organizarCupom(str,copy(descricaoProduto  ,0,25),'*');
      str:=trim(dm.organizarCupom(str,dm.alinha_valor_a_direita(alinhamentoDireitaTotal,FormatFloat('R$ ###,###,##0.000 ', (qryExtrato.fieldbyname('total').value)      )),'%'));
      imprimeLinhaECF(marca,trim(str),false,false,false,false,true,false,false);
    end
   else
    begin
       str:=formatoCabecalhoExtratoLayout2Linha1;
       str:=dm.organizarCupom(str,copy(qryExtrato.fieldbyname('cod_barras').value,0,6) ,'#');
       str:=dm.organizarCupom(str,copy(descricaoProduto,0,30),'*');
       imprimeLinhaECF(marca,trim(str),false,false,false,false,false,false,false);


       str:=formatoCabecalhoExtratoLayout2Linha2;
       str:=dm.organizarCupom(str, quantidade,'#');
       str:=dm.organizarCupom(str,'X','$');
       str:=trim(dm.organizarCupom(str,FormatFloat('###,###,##0.00 ', (qryExtrato.fieldbyname('valor_unitario').value)      ),'*'));
       str:=dm.organizarCupom(str,'','%');
       tamStr :=alinhamentoDireitaTotal- length(trim(str));
       str:= trim(str)+ dm.alinha_valor_a_direita(tamStr,FormatFloat('R$ ###,###,##0.00 ', (qryExtrato.fieldbyname('total').value)      ));
       imprimeLinhaECF(marca,trim(str),false,false,false,false,false,false,false);

       if (mesa = mesaDelivery) then
        begin
           if (qryExtrato.fieldbyname('sabores').value <> '') then
            begin
              imprimeLinhaECF(marca,'Sabores: ' ,false,false,false,false,false,false,false);
              imprimeLinhaECF(marca,'--' ,false,false,false,false,false,false,false);
              imprimeLinhaECF(marca,''+ trim(dm.BuscaTroca(qryExtrato.fieldbyname('sabores').value,#10#13,' , ')) ,false,false,false,false,false,false,false);
//              imprimeLinhaECF(marca,'Sabores: '+ trim(dm.BuscaTroca(qryExtrato.fieldbyname('sabores').value,#10#13,' , ')) ,false,false,false,false,false,false,false);
            end;


        end;

    end;
   qryExtrato.Next;
  end;

  qryExtrato.Active:=false;
  FreeAndNil(qryExtrato);

  adicionaLog('Terminou a função da impressão do movimento');

end;








function Tdm.imprimeRecebimentosParciaisECF(marca : integer;  mesa : string) : string;
var
 q : TIBQuery;
 formato,str : string;
begin

  q := TIBquery.create(self);
  q.Database := dm.dbrestaurante;
  q.Transaction := dm.transacao;

  q.Active:=false;
  q.SQL.Clear;
  q.SQL.Add('select r.*, f.descricao from recebimento_parcial r ');
  q.sql.add(' inner join formas_pagamento f on (f.cod_forma = r.cod_forma) ');
  q.sql.add(' where r.mesa='+Quotedstr(mesa));
  q.Active:=true;
  q.First;

  if (q.IsEmpty = false ) then
  begin
   imprimeLinhaECF(marca,linhaExtrato,false,false,false,false,false,false,false);
   imprimeLinhaECF(marca,dm.centralizar('PAGAMENTOS PARCIAIS REALIZADOS',qtdColunasNormalECF),true,false,false,false,false,false,false);
   imprimeLinhaECF(marca,'',false,false,false,true,false,false,false);
   while not q.Eof do
     begin



       str:=formatoCabecalhoExtrato;
       str:=dm.organizarCupom(str,q.fieldbyname('descricao').value,'#');
       str:=dm.organizarCupom(str,'','*');
       str:=dm.organizarCupom(str,dm.alinha_valor_a_direita(alinhamentoDireitaTotal,FormatFloat('R$ ###,###,##0.00 ', (q.fieldbyname('valor').value)      )),'%');
       imprimeLinhaECF(marca,trim(str),false,false,false,false,true,false,false);
       q.Next;
     end;

   str:=formatoCabecalhoExtrato;
   imprimeLinhaECF(marca,' ',false,false,false,false,false,false,false);
   str:=dm.organizarCupom(str,'Total','#');
   str:=dm.organizarCupom(str,'','*');
   str:=dm.organizarCupom(str,dm.alinha_valor_a_direita(alinhamentoDireitaTotal,FormatFloat('R$ ###,###,##0.00 ', (getTotalPagamentosParciais(mesa))      )),'%');
   imprimeLinhaECF(marca,trim(str),false,false,false,false,false,false,false);

  end;
  q.Active:=false;
  FreeAndNil(q);
end;






function Tdm.imprimeRodapeExtratoContaECF(mesa : string; codVenda: string; marca : integer; tipo: integer; nPessoas :
         integer; subtotal : double;
         couvert : double ;
         txServico : double;
         repique   : double;
         desconto : double;
         totalConta : double;
         totalPago: double;
         troco : double; txEtrega : double) : string;

var
  str : string;
  formato : string;
  q : TIBQuery;
  ct : integer;
  tamStr : integer;

begin


q := TIBQuery.create(self);
q.Database := dbrestaurante;
q.Transaction := transacao;

if imprimirTaxaServicoNoExtrato = 0 then
 begin
   totalConta := totalConta -txServico ;
   txServico :=0;
 end;

            imprimeLinhaECF(marca,linhaExtrato,false,false,false,false,false,false,false);

            str:=formatoLinhaTotalizador;
            str:=dm.organizarCupom(str,dm.alinha_valor_a_direita(alinhamentoDireitaTotal,'Consumo:   '+FormatFloat('R$ ###,###,##0.00 ', (subtotal)      )),'%');
            imprimeLinhaECF(marca,str,false,false,false,false,false,false,false);


            if (txServico > 0 ) and (imprimirTaxaServicoNoExtrato=1)  then
              begin
               str:=formatoLinhaTotalizador;
               str:=dm.organizarCupom(str,dm.alinha_valor_a_direita(alinhamentoDireitaTotal,dm.LeIni(2,'extrato','descricaoTaxaServico')+':   '+FormatFloat('R$ ###,###,##0.00 ', (txServico)      )),'%');
               imprimeLinhaECF(marca,str,false,false,false,false,false,false,false);
              end;


            str:=formatoLinhaTotalizador;
            str:=dm.organizarCupom(str,dm.alinha_valor_a_direita(alinhamentoDireitaTotal,'------------'),'%');
            imprimeLinhaECF(marca,str,false,false,false,false,false,false,false);


            str:=formatoLinhaTotalizador;
            str:=dm.organizarCupom(str,dm.alinha_valor_a_direita(alinhamentoDireitaTotal,'Subtotal :'+FormatFloat('R$ ###,###,##0.00 ', (subtotal+txServico )      )),'%');
            imprimeLinhaECF(marca,str,false,false,false,false,false,false,false);


            str:=formatoLinhaTotalizador;
            str:=dm.organizarCupom(str,dm.alinha_valor_a_direita(alinhamentoDireitaTotal,'--------------------'),'%');
            imprimeLinhaECF(marca,str,false,false,false,false,false,false,false);




            if ( couvert > 0 ) then
             begin

               str:=formatoLinhaTotalizador;
               str:=dm.organizarCupom(str,dm.alinha_valor_a_direita(alinhamentoDireitaTotal,'+ Couvert:   '+FormatFloat('R$ ###,###,##0.00 ', (couvert)      )),'%');
               imprimeLinhaECF(marca,str,false,false,false,false,false,false,false);
             end;



            if (txEtrega  > 0 ) then
             begin
               str:=formatoLinhaTotalizador;
               str:=dm.organizarCupom(str,dm.alinha_valor_a_direita(alinhamentoDireitaTotal,'+ Tx. de Entrega:  '+FormatFloat('R$ ###,###,##0.00 ', (txEtrega)   )),'%');
               imprimeLinhaECF(marca,str,false,false,false,false,false,false,false);
             end;

            if ( desconto > 0 ) then
             begin
               str:= formatoLinhaTotalizador;
               str:=dm.organizarCupom(str,dm.alinha_valor_a_direita(alinhamentoDireitaTotal,'Desconto:  '+FormatFloat('- R$ ###,###,##0.00 ', (desconto)      )),'%');
               imprimeLinhaECF(marca,str,false,false,false,false,true,false,false);
             end;


            if ( (totalPago > 0) and (tipo <> 2)   ) then
             begin
               str:= formatoLinhaTotalizador;
               str:=dm.organizarCupom(str,dm.alinha_valor_a_direita(alinhamentoDireitaTotal,'Ja foi pago:  '+FormatFloat('- R$ ###,###,##0.00 ', (totalPago)      )),'%');
               imprimeLinhaECF(marca,str,false,false,false,false,true,false,false);
             end;





            imprimeLinhaECF(marca,linhaExtrato,false,false,false,false,false,false,false);
            if ( (totalPago > 0) and (tipo = 1)) then
              begin

               str:=formatoLinhaTotalizadorGeral;
               str:=dm.organizarCupom(str,'Total:','#');
               str:=dm.organizarCupom(str,'','*');
               str:=dm.organizarCupom(str,dm.alinha_valor_a_direita(alinhamentoDireitaTotalGeral,FormatFloat('R$ ###,###,##0.00 ', (totalConta)      )),'%');
               imprimeLinhaECF(marca,trim(str),true,false,false,true,false,true,false);
              end
            else
              begin
               str:=formatoLinhaTotalizadorGeral;

               if totalPago > 0 then
                 str:=dm.organizarCupom(str,'Total:','#')
               else
               str:=dm.organizarCupom(str,'Total:','#');

               str:=dm.organizarCupom(str,'','*');
               str:=dm.organizarCupom(str,dm.alinha_valor_a_direita(alinhamentoDireitaTotalGeral,FormatFloat('R$ ###,###,##0.00 ', (totalConta)      )),'%');
               imprimeLinhaECF(marca,trim(str),true,false,false,true,false,true,false);
              end;
               imprimeLinhaECF(marca,' ',true,false,false,true,false,true,false);



             if ( (nPessoas > 1) and (mesa <> mesaBalcao) and (mesa <>  mesadelivery ))   then
              begin

               str:=formatoRodapeExtrato;
               str:=dm.organizarCupom(str,'Qtde de Pessoas...:  ','#');
               str:=dm.organizarCupom(str,'','*');
               str:=dm.organizarCupom(str,Inttostr(nPessoas) ,'%');
               imprimeLinhaECF(marca,trim(str),false,false,false,false,false,false,false);

               str:=formatoRodapeExtrato;

               str:=dm.organizarCupom(str,'Valor por pessoa..:  ','#');
               str:=dm.organizarCupom(str,'','*');
               str:=dm.organizarCupom(str,FormatFloat('R$ ###,###,##0.00 ', (totalConta/nPessoas)      ),'%');
               imprimeLinhaECF(marca,trim(str),false,false,false,false,false,false,false);
              end;


              if ( (codVenda <> '') and (tipo <> 2) ) then
               begin
                 if  (mesa = mesaDelivery ) then
                   begin
                     q.Active:=false;
                     q.sql.clear;
                     q.sql.add(' select rd.cod_pedido, rd.cod_forma, rd.valor, fp.descricao  from recebimentos_delivery rd ');
                     q.sql.add('            inner join formas_pagamento fp on (fp.cod_forma = rd.cod_forma ) ');
                     q.sql.add(' where rd.cod_pedido='+Quotedstr(codVenda));
                     q.Active :=true;
                     q.First;
                     if (q.IsEmpty = false) then
                      begin
                       imprimeLinhaECF(marca,linhaExtrato,false,false,false,false,false,false,false);
                        while not q.Eof do
                         begin
                           str:=formatoRodapeExtrato;
                           str:=dm.organizarCupom(str,q.fieldbyname('descricao').value ,'#');
                           str:=dm.organizarCupom(str,'','*');
                           str:=dm.organizarCupom(str,'','%');
                           tamStr :=alinhamentoDireitaTotal- length(trim(str));
                           str:= trim(str)+dm.alinha_valor_a_direita(tamstr,FormatFloat('R$ ###,###,##0.00 ', (q.fieldbyname('valor').value)      ));
                           imprimeLinhaECF(marca,trim(str),true,false,FALSe,false,false,false,false);
                           q.Next;
                         end;
                       imprimeLinhaECF(marca,linhaExtrato,false,false,false,false,false,false,false);
                     end;
                   end
                 else
                   begin


                   end;
               end;

            if (troco > 0) then
             begin
               str:=formatoLinhaTotalizador;
               str:=dm.organizarCupom(str,dm.alinha_valor_a_direita(alinhamentoDireitaTotal,'Troco:    '+FormatFloat('R$ ###,###,##0.00 ', (troco)      )),'%');
               imprimeLinhaECF(marca,str,false,false,false,false,false,false,false);
             end;



             if (  (imprimirTaxaServicoNoExtrato = 0) and  (mesa <> mesaDelivery) and (mesa <> mesaBalcao))       then
             begin
               imprimeLinhaECF(marca,'',false,false,false,false,false,false,false);
               imprimeLinhaECF(marca,'',false,false,false,false,false,false,false);
               imprimeLinhaECF(marca,'',false,false,false,false,false,false,false);
               imprimeLinhaECF(marca,'',false,false,false,false,false,false,false);
               imprimeLinhaECF(marca,'',false,false,false,false,false,false,false);
               imprimeLinhaECF(marca,'',false,false,false,false,false,false,false);
               imprimeLinhaECF(marca,'',false,false,false,false,false,false,false);
               imprimeLinhaECF(marca,'',false,false,false,false,false,false,false);
               imprimeLinhaECF(marca,'',false,false,false,false,false,false,false);
             end;

             if (tipo = 1) then
              begin
                if (StrToInt(dm.LeIni(2,'extrato','msgCupomFiscal')) = 1) then
                 begin
                   imprimeLinhaECF(marca,linhaExtrato,false,false,false,false,false,false,false);
                   dm.imprimeLinhaECF(marca,dm.centralizar('AGUARDE A EMISSAO',qtdColunasExpandidoECF),true,false,false,true,false,true,false);
                   dm.imprimeLinhaECF(marca,dm.centralizar('DO CUPOM FISCAL',qtdColunasExpandidoECF),true,false,false,true,false,true,false);
                 end;
              end;
              imprimeLinhaECF(marca,linhaExtrato,false,false,false,false,false,false,false);

             if (tipo = 1) then
              begin
                if (StrToInt(dm.LeIni(2,'extrato','msgPromocional')) = 1) then
                 begin
                   for ct:= 1 to  StrToInt(dm.LeIni(2,'extrato','qtdLinhasMsgPromocional')) do
                    begin
                     dm.imprimeLinhaECF(marca,dm.centralizar(dm.LeIni(2,'extrato','msgPromocionalLinha'+IntToStr(ct)),alinhamentoDireitaTotal),false,false,false,false,false,false,false);
                    end;

                   imprimeLinhaECF(marca,linhaExtrato,false,false,false,false,false,false,false);
                 end;
              end;


             for ct:= 1 to  StrToInt(LeIni(2,'IMPRESSORA_NAO_FISCAL_01','linhasAposCupom')) do
             begin
              imprimeLinhaECF(marca,'                     ',false,false,false,false,false,false,false);
             end;
             imprimeLinhaECF(marca,'.',false,false,false,false,false,false,false);


            if  ( (impressora_fiscal_instalada = 0)  or (localDeEmissaoEncerramento=2) or (localDeEmissaoDeExtrato=2))     then
             begin
               if ( StrToInt(dm.LeIni(2,'IMPRESSORA_NAO_FISCAL_01','cortaPapel')) =1 ) then
                  cortaPapelImpNF(caminhoArquivoExtrato, marca,1);
             end;





  q.Active :=false;
  FreeAndNil(q);
end;


procedure Tdm.imprimeProtocoloLancamentoRd(evento : smallint; codLancamento : string);
var
 q : TIBQuery;
 str : string;
 ct : integer;
 strComprovante : TStringList;
begin

  strComprovante := TStringList.Create;
  q := TIBquery.create(self);
  q.Database := dm.dbrestaurante;
  q.Transaction := dm.transacao;
  try
     strComprovante.Clear;
     frm_principal.memo_avisos.Lines.clear;
     If FileExists(caminhoArquivoExtrato) then DeleteFile(caminhoArquivoExtrato);

    q.Active:=false;
    q.SQL.Clear;
    q.sql.add(' select lr.*,cp.data_vencimento, f.nome_fantasia, f.razao_social    from lancamentos_rd lr ');
    q.sql.add('  inner join contas_a_pagar cp on (cp.codigo = lr.cod_ct_pagar) ');
    q.sql.add('      inner join fornecedor f on (f.cod_fornecedor = lr.cod_fornecedor) ');
    q.sql.add('  where lr.codigo ='+QuotedStr(codLancamento));
    q.Active:=true;

  //  frm_principal.memoObsMiniprinter.Lines.Clear;
  //   frm_principal.memoObsMiniprinter.Lines.Add(trim(q.fieldbyname('observacoes').Value));
    strComprovante.add('</zera>>');
    strComprovante.add('<e><n>'+PadCenter(razao_social,24,' ')  +'</n></e>');
    strComprovante.add('<e>'+PadCenter('PROTOCOLO',24,' ')  +'</e>');

    if evento = 2  then
     begin
      strComprovante.add('</linha_dupla>');
      strComprovante.add('<e><n> A L T E R A Ç Ã O </e></n>');
      strComprovante.add('</linha_dupla>');
     end;

    strComprovante.Add( FormatDateTime('DD/MM/YY',date) + '  -  '+FormatDateTime('HH:MM:SS',time));
    strComprovante.Add('<e><n> Fornecedor: '+q.fieldbyname('razao_social').Value+'</n></e>');
    strComprovante.Add('<e><n> Valor: '+FormatFloat('R$ ###,###,##0.00 ',q.fieldbyname('total').Value)+'</n></e>');
    strComprovante.Add('<e><n> DOC  : '+q.fieldbyname('num_doc').Value+'</n></e>');
    strComprovante.Add('Cod. RD   :  '+codLancamento);
    strComprovante.Add('Cod. Ct.pagar  : '+q.fieldbyname('cod_ct_pagar').Value);
    strComprovante.add('</linha_dupla>');
    strComprovante.Add('Lançado em: '+FormatDateTime('DD/MM/YY',q.fieldbyname('data_lancamento').Value));
    strComprovante.Add('Data Doc  :   '+FormatDateTime('DD/MM/YY',q.fieldbyname('data_documento').Value));
    strComprovante.Add('<e><n> Vencimento:  '+FormatDateTime('DD/MM/YY',q.fieldbyname('data_vencimento').Value)+'</n></e>');
    strComprovante.Add('Data RD: '+FormatDateTime('DD/MM/YY',q.fieldbyname('data_rd').Value));
    strComprovante.Add('Lançado por: '+q.fieldbyname('nome_usuario').Value);
    strComprovante.add('</linha_dupla>');
    strComprovante.Add(' ');
    strComprovante.Add(' ');
    strComprovante.Add('Conferido por: ___________________________');
    strComprovante.Add(' ');
    strComprovante.add('<e><n>'+PadCenter('___________________________',24,' ')  +'</n></e>');
    strComprovante.add(''+PadCenter('Assinatura do conferente',48,' ')  +'');
    strComprovante.add('</linha_dupla>');
    strComprovante.add('<e><n>'+PadCenter('DETALHAMENTO',24,' ')  +'</n></e>');


    q.Active:=false;
    q.SQL.Clear;


    q.sql.add('   select itr.*, g.descricao from itens_lancamento_rd itr');
    q.sql.add('     inner join grupos g on (g.cod_grupo = itr.cod_grupo) ');
    q.sql.add('     where itr.cod_lanc_rd='+QuotedStr(codLancamento));
    q.Active:=true;

    q.First;
    while not q.Eof do
     begin
       strComprovante.add (q.fieldbyname('descricao').Value +' -- '+FormatFloat('R$ ###,###,##0.00 ',q.fieldbyname('valor').Value));
       q.Next;
     end;
    strComprovante.add('</linha_dupla>');
    strComprovante.add('<e><n>'+'OBS'+'</n></e>');

    for ct:=0 to frm_principal.memoObsMiniprinter.Lines.Count -1 do
     begin
      strComprovante.Add(frm_principal.memoObsMiniprinter.Lines[CT]);
     end;

     for ct:= 1 to  StrToInt(LeIni(2,'IMPRESSORA_NAO_FISCAL_01','linhasAposCupom')) do
     begin
      strComprovante.add (' ');
     end;

     strComprovante.add('</corte_parcial>');

     DM.adicionaLog(strComprovante.Text);
     configuraImpressoraNaoFiscal();
     imprimeTextoACBR(strComprovante);


  finally
     FreeAndNil(q);
     FreeAndNil(strComprovante);
  end;

end;


function Tdm.imprimePreConta(mesa : string; marca : integer; tipo: integer; nPessoas :
         integer; subtotal : double;
         couvert : double ;
         txServico : double;
         repique   : double;
         desconto : double;
         totalConta : double;
         totalPago: double;
         troco : double;codigoVenda : string;
         txEtrega : double; codPedidoDelivery : string;
         codCliente : string;
         nomeCliente : string ; via : smallint) : boolean;
var
  frmVazio : Tfrm_modelo_vazio;
begin
   Application.CreateForm(Tfrm_modelo_vazio,frmVazio);
   frm_principal.memo_avisos.Lines.clear;
   If FileExists(caminhoArquivoExtrato) then DeleteFile(caminhoArquivoExtrato);
   dm.imprimeCabecalhoECF(marca,1,mesa,codigoVenda,codPedidoDelivery,codCliente,nomeCliente,via);
   dm.imprimeMovimentoContaECF(marca,mesa,'');
   dm.imprimeRodapeExtratoContaECF(mesa,codigoVenda, marca,1,nPessoas,subtotal,couvert,txServico,repique,desconto,totalConta, totalPago, troco,txEtrega);

   frm_principal.memo_avisos.Lines.LoadFromFile(caminhoArquivoExtrato);

   if (localDeEmissaoDeExtrato = 1 )  then // Imprime o extrato no ECF
    begin
          if frmVazio.validacaoArquivoAuxiliarPaf(caminhoArquivoAuxiliarPAF) = false then
            begin
              exit;
            end;
          frm_principal.ecf.RelatorioGerencial(frm_principal.memo_avisos.lines ,1,codRelatorioGerencialExtrato);

    end
   else
    begin
      imprimeTexoMiniPrinter();
    end;

    FreeAndNil(frmVazio);
end;





procedure  Tdm.imprimeComprovanteTransferenciaMesa(origem : string; destino : string ; codigo : string; totalOrigem : double; totalDestino : double);
var
 q : TIBQuery;
 marca : integer;
 str : string;
 ct : integer;
begin
  q := TIBquery.create(self);
  q.Database := dm.dbrestaurante;
  q.Transaction := dm.transacao;
  q.Active:=false;

  if localDeEmissaoDeExtrato = 1 then
      marca:= marca_impressora_fiscal
  else
     marca:= marca_impressora_nao_fiscal_01;



  frm_principal.memo_avisos.Lines.clear;
  If FileExists(caminhoArquivoExtrato) then DeleteFile(caminhoArquivoExtrato);


  //Inicia formatação do comprovante de transferencia

  if (localDeEmissaoDeExtrato = 1) then
   begin

   end
  else
    begin
        imprimeLinhaECF(marca,dm.centralizar(nome_fantasia,qtdColunasExpandidoECF),true,false,false,true,false,true,false);
        imprimeLinhaECF(marca,dm.centralizar('',qtdColunasExpandidoECF),true,false,false,true,false,true,false)
     end;

  dm.imprimeLinhaECF(marca,dm.centralizar('TRANSF. DE MESA',qtdColunasExpandidoECF),true,false,false,true,false,true,false);
  dm.imprimeLinhaECF(marca,dm.centralizar(origem+' --> '+destino,qtdColunasExpandidoECF),true,false,false,true,false,true,false);

//  dm.imprimeLinhaECF(marca,dm.centralizar(,qtdColunasExpandidoECF),true,false,false,true,false,true,false);


  str:='Codigo: '+codigo;
  imprimeLinhaECF(marca,str,false,false,false,false,true,false,false);

  str:=FormatDateTime('DD/MM/YYY',DATE)+' '+FormatDateTime('HH:MM:SS',time);
  imprimeLinhaECF(marca,str,false,false,false,false,true,false,false);

  str:='Operador: '+nome_usuario_responsavel;
  imprimeLinhaECF(marca,str,false,false,false,false,true,false,false);

  str:='Tot. Origem: '+FormatFloat('R$ ###,###,##0.00 ',totalOrigem);
  imprimeLinhaECF(marca,str,false,false,false,false,true,false,false);

  str:='Tot. destino: '+FormatFloat('R$ ###,###,##0.00 ',totalDestino);
  imprimeLinhaECF(marca,str,false,false,false,false,true,false,false);

  imprimeLinhaECF(marca,linhaExtrato,false,false,false,false,false,false,false);
  q.active:=false;


   imprimeLinhaECF(marca,'',false,false,false,false,false,false,false);
   imprimeLinhaECF(marca,'',false,false,false,false,false,false,false);

   imprimeLinhaECF(marca,dm.centralizar('------------------------------',qtdColunasNormalECF),false,false,false,false,false,false,false);
   imprimeLinhaECF(marca,dm.centralizar('Assinatura do Operador',qtdColunasNormalECF),false,false,false,false,false,false,false);


   for ct:=0 to  StrToInt(dm.LeIni(2,'extrato','linhasFinalExtrato')) do
    begin
     imprimeLinhaECF(marca,'                     ',false,false,false,false,false,false,false);
   end;

  if  (impressora_fiscal_instalada = 0)  then
   begin
     if ( StrToInt(dm.LeIni(2,'IMPRESSORA_NAO_FISCAL_01','cortaPapel')) =1 ) then
         cortaPapelImpNF(caminhoArquivoExtrato, marca,1);
   end;




  // Termina formatacao


   frm_principal.memo_avisos.Lines.LoadFromFile(caminhoArquivoExtrato);
   if (localDeEmissaoDeExtrato = 1 )  then // Imprime o extrato no ECF
    begin
      frm_principal.ecf.RelatorioGerencial(frm_principal.memo_avisos.lines ,1,codRelatorioGerencialExtrato);
//      frm_principal.ECF.CortaPapel(true);
    end
   else
    begin
      // Chama a função que manda tudo para a impressora.
      imprimeTexoMiniPrinter();
    end;


    FreeAndNil(q);
end;








procedure Tdm.imprimeRelatorioCaixa(marca : integer; NumeroCaixa : string);
var
 ct : integer;
begin
   frm_principal.memo_avisos.Lines.clear;
   frm_principal.memo_avisos.Lines.clear;

   if FileExists(caminhoArquivoExtrato) then DeleteFile(caminhoArquivoExtrato);
   If FileExists(caminhoArquivoExtrato) then DeleteFile(caminhoArquivoExtrato);
   imprimeCabecalhoRelatorioDeCaixa(marca,NumeroCaixa);
   imprimeResumoCaixa(marca,NumeroCaixa);
   imprimePedidosDeliveryCaixa(marca, numeroCaixa);
   imprimeProdutosVendidosCaixa(marca, numeroCaixa);
   imprimeEstornosCaixa(marca,NumeroCaixa);



   if ( StrToInt(dm.LeIni(2,'RELATORIO_DE_CAIXA','impResGarcom') ) =1 ) then
    begin
      imprimeResumoGarcons(marca,NumeroCaixa);
    end;

   if ( StrToInt(dm.LeIni(2,'RELATORIO_DE_CAIXA','impVendasGarcomAbriu') ) =1 ) then
    begin
      ImprimeVendasPorGarconAbriuMesa(marca,NumeroCaixa);
    end;


   for ct:=0 to  StrToInt(dm.LeIni(2,'extrato','linhasFinalExtrato')) do
     begin
      imprimeLinhaECF(marca,'                     ',false,false,false,false,false,false,false);
     end;



  if  (impressora_fiscal_instalada = 0)  then
   begin
     if ( StrToInt(dm.LeIni(2,'IMPRESSORA_NAO_FISCAL_01','cortaPapel')) =1 ) then
        cortaPapelImpNF(caminhoArquivoExtrato, marca,1);
   end;


   frm_principal.memo_avisos.Lines.LoadFromFile(caminhoArquivoExtrato);






//   dm.imprimeMovimentoContaECF(marca,mesa);
//   dm.imprimeRecebimentosParciaisECF(marca,mesa);
//   dm.imprimeRodapeExtratoContaECF(mesa,codigoVenda, marca_impressora_fiscal,1,nPessoas,subtotal,couvert,txServico,repique,desconto,totalConta, totalPago, troco,txEtrega);
//   frm_principal.memo_avisos.Lines.LoadFromFile(caminhoArquivoExtrato);

   if (localDeEmissaoDeExtrato = 1 )  then // Imprime o extrato no ECF
    begin
      frm_principal.ecf.RelatorioGerencial(frm_principal.memo_avisos.lines ,1,codRelatorioGerencialExtrato);
    end
   else
    begin
      // Chama a função que manda tudo para a impressora.
      imprimeTexoMiniPrinter();
    end;

end;


procedure Tdm.imprimeRelatorioEncerramentoDia(marca : integer; data : Tdate);
var
 ct : integer;
begin
   frm_principal.memo_avisos.Lines.clear;
   frm_principal.memo_avisos.Lines.clear;

   if FileExists(caminhoArquivoExtrato) then DeleteFile(caminhoArquivoExtrato);
   If FileExists(caminhoArquivoExtrato) then DeleteFile(caminhoArquivoExtrato);
   imprimeCabecalhoRelatorioDeEncerramentoDia(marca,data);
   imprimeResumoDoDia(marca, data);
//   imprimeProdutosVendidosCaixa(marca, numeroCaixa);
//   imprimeEstornosCaixa(marca,NumeroCaixa);


   if ( StrToInt(dm.LeIni(2,'RELATORIO_DE_CAIXA','impResGarcom') ) =1 ) then
    begin
//      imprimeResumoGarcons(marca,numero_caixa);
    end;




   for ct:=0 to  StrToInt(dm.LeIni(2,'extrato','linhasFinalExtrato')) do
     begin
      imprimeLinhaECF(marca,'                     ',false,false,false,false,false,false,false);
     end;

  if  (impressora_fiscal_instalada = 0)  then
   begin
     if ( StrToInt(dm.LeIni(2,'IMPRESSORA_NAO_FISCAL_01','cortaPapel')) =1 ) then
        cortaPapelImpNF(caminhoArquivoExtrato, marca,1);
   end;

   frm_principal.memo_avisos.Lines.LoadFromFile(caminhoArquivoExtrato);






//   dm.imprimeMovimentoContaECF(marca,mesa);
//   dm.imprimeRecebimentosParciaisECF(marca,mesa);
//   dm.imprimeRodapeExtratoContaECF(mesa,codigoVenda, marca_impressora_fiscal,1,nPessoas,subtotal,couvert,txServico,repique,desconto,totalConta, totalPago, troco,txEtrega);
//   frm_principal.memo_avisos.Lines.LoadFromFile(caminhoArquivoExtrato);

   if (localDeEmissaoDeExtrato = 1 )  then // Imprime o extrato no ECF
    begin
      frm_principal.ecf.RelatorioGerencial(frm_principal.memo_avisos.lines ,1,codRelatorioGerencialExtrato);
    end
   else
    begin
      // Chama a função que manda tudo para a impressora.
      imprimeTexoMiniPrinter();
    end;

end;













{
function Tdm.imprimeComprovanteDeliveryECF(mesa : string; marca : integer; tipo: integer; nPessoas :
         integer; subtotal : double;
         couvert : double ;
         txServico : double;
         repique   : double;
         desconto : double;
         totalConta : double;
         totalPago: double;
         troco : double) : string;
begin

   frm_principal.memo_avisos.Lines.clear;
   If FileExists(caminhoArquivoExtrato) then DeleteFile(caminhoArquivoExtrato);
   dm.imprimeCabecalhoECF(marca,1,mesa,'');
   dm.imprimeMovimentoContaECF(marca,mesa);
   dm.imprimeRecebimentosParciaisECF(marca,mesa);
   dm.imprimeRodapeExtratoContaECF(marca_impressora_fiscal,1,nPessoas,subtotal,couvert,txServico,repique,desconto,totalConta, totalPago, troco);
   frm_principal.memo_avisos.Lines.LoadFromFile(caminhoArquivoExtrato);
   frm_principal.ecf.RelatorioGerencial(frm_principal.memo_avisos.lines ,1,codRelatorioGerencialExtrato);

end;

 }




procedure Tdm.imprimeComprovanteDelivery(codPedido : string; operacao : smallint);
var
  ts: TIBTransaction;
  q: TIBQuery;
  qItensPedido : TIBQuery;
  qformasPagto : TIBQuery;
  strComprovante :  TStringList;

  codProduto : string;
  descricaoProduto : string;
  quantidade : string;
  valorUnitario,total : string;
  totalConta : string;

  descricaoFP : string;
  valorFP : string;
  ct : integer;

begin
  strComprovante  := TStringList.Create;
  strComprovante.Clear;

  ts      :=   TIBTransaction.Create(Self);
  ts.Name := RandomName(8);
  ts.DefaultDatabase :=  dm.dbrestaurante;
  ts.Active := false;
  ts.Active := true;


  q:= TIBQuery.create(self);
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


  try
    q.Active :=false;
    q.SQL.Clear;
     q.sql.add(' select p.codigo,p.cod_cliente, coalesce( c.nome,'+Quotedstr('')+') as nome, ');
    q.sql.add('        coalesce(c.telefone,'+Quotedstr('')+') as telefone,');
    q.sql.add('        coalesce(c.celular,'+Quotedstr('')+') as celular,');
    q.sql.add('        coalesce(c.endereco,'+Quotedstr('')+') as endereco, ');
    q.sql.add('       coalesce(c.complemento,'+Quotedstr('')+') as complemento, ');
    q.sql.add('       coalesce(c.referencia1,'+Quotedstr('')+') as ref1,');
    q.sql.add('       coalesce(c.referencia2,'+Quotedstr('')+') as ref2,');
    q.sql.add('       coalesce(b.descricao,'+Quotedstr('')+') as bairro,');
    q.sql.add('       p.valor_bruto,');
    q.sql.add('       p.valor_entrega,');
    q.sql.add('       p.valor_desconto,');
    q.sql.add('       p.valor_total,');
    q.sql.add('       p.valor_troco,');
    q.sql.add('       p.retira_balcao');
    q.sql.add('  from pedidos_delivery  p');
    q.sql.add('   inner join clientes_delivery c on (c.codigo = p.cod_cliente)');
    q.sql.add('   inner join bairro b on (b.codigo = c.cod_bairro)');
    q.sql.add('  where p.codigo='+Quotedstr(codPedido));

    dm.adicionaLog(q.SQL.Text);
    q.Active :=true;

    strComprovante.Clear;
    q.GetFieldNames(strComprovante);
    dm.adicionaLog('Campos :'+ strComprovante.Text);



   strComprovante.Clear;
   strComprovante.add('</zera>');
   strComprovante.add('<n></linha_dupla></N>');
   strComprovante.add('<e>'+PadCenter(nome_fantasia,24,' ')  +'</e>');
   strComprovante.add('</fn></ae>'+FormatDateTime('DD/MM/YYY',date)+' '+FormatDateTime('HH:MM:SS',time));
   strComprovante.add('</fn></ae>Caixa Nº: '+ultimoCaixaAberto);
   strComprovante.add('</fn></ae>Operador: '+nome_usuario_responsavel);
   strComprovante.add('<n></linha_dupla></N>');
   case operacao  of
    1: BEGIN

       END;
    2: BEGIN
        strComprovante.add('<n></ce><e># ALTERAÇÃO DO PEDIDO #</N></e>');
       END;
    3: BEGIN
         strComprovante.add('<n></ce><e>## EXCLUSÃO DO PEDIDO #</N></e>');
       END;
   end;


   strComprovante.add('</ce><e>DELIVERY - PED. '+IntToStr(StrToInt(codPedido))+'</e>');

   strComprovante.add('<n></linha_simples></N>');
   strComprovante.add('</fn></ce><n>DADOS DO CLIENTE</N>');
   strComprovante.add('</linha_simples>');
   strComprovante.add('</fn></ae><n>Cliente:</N>  '+q.FieldByName('nome').value);
   strComprovante.add('</fn></ae><n>Telefone:</N> '+q.FieldByName('telefone').value);
   strComprovante.add('</fn></ae><n>Celular:</N>  '+q.FieldByName('celular').value);
   strComprovante.add('</linha_simples>');


   if q.FieldByName('retira_balcao').Value = 0  then
    begin
     strComprovante.add('</fn></ae><n>Endereço:</N> '+q.FieldByName('endereco').value);
     strComprovante.add('</fn></ae><n>Bairro:</N> '+q.FieldByName('bairro').value);
     strComprovante.add('</fn></ae><n>Complemento:</N>  '+q.FieldByName('complemento').value);
     strComprovante.add('</fn></ae><n>Ref 1:</N>  '+q.FieldByName('ref1').value);
     strComprovante.add('</fn></ae><n>Ref 2:</N>  '+q.FieldByName('ref2').value);
     strComprovante.add('</linha_simples>');
    end
   else
    begin
      strComprovante.add('</ce><e><n><S>RETIRADA NO BALCÃO</S></N></e>');
      strComprovante.add('</fn>');
      strComprovante.add('</linha_simples>');
    end;


    strComprovante.add ('<n>' + PadRight('Cód.',7,' ')+PadRight('Descrição',41)+'</n>' );
    strComprovante.add ('<n>' + PadRight('Qtde.',14,' ') + PadLeft('Vl Unitário',15)+PadLeft('Total',19)+'</n>' );
    strComprovante.add('</linha_simples>');


    qItensPedido.Active :=false;
    qItensPedido.SQL.Clear;
    qItensPedido.sql.add('   select it.cod_produto, p.cod_barras, p.descricao, it.quantidade, ');
    qItensPedido.sql.add('          it.valor_unitario, it.sabores, ');
    qItensPedido.sql.add('           udf_roundabnt( (it.valor_unitario  * it.quantidade ),2) as total ');
    qItensPedido.sql.add('              from itens_pedido_delivery it ');
    qItensPedido.sql.add('                 inner join produtos p on (p.cod_produto  = it.cod_produto) ');
    qItensPedido.sql.add('          where it.cod_pedido='+Quotedstr(codPedido));
    qItensPedido.Active := true;
    qItensPedido.FetchAll;



   qItensPedido.First;
   while not qItensPedido.Eof  do
    begin
       codProduto := qItensPedido.FieldByName('COD_BARRAS').Value;
       descricaoProduto := qItensPedido.FieldByName('descricao').Value;
       valorUnitario :=  FormatFloat('R$ ###,###,##0.00', qItensPedido.FieldByName('valor_unitario').Value);

       if frac( qItensPedido.FieldByName('quantidade').Value) >0  then
         quantidade := FormatFloat('#0.000', qItensPedido.FieldByName('quantidade').Value)
       else
         quantidade := IntToStr(qItensPedido.FieldByName('quantidade').Value);

       total         := FormatFloat('R$ ###,###,##0.00', qItensPedido.FieldByName('total').Value);

       strComprovante.add ( PadRight(codProduto ,7,' ')+PadRight(descricaoProduto,41) );
       strComprovante.add ( PadRight(quantidade,14,' ')+PadLeft(valorUnitario,15)+PadLeft(total,19) );

       if (qItensPedido.fieldbyname('sabores').value <> '') then
        begin
          strComprovante.add('</ad></fn><n>Sabores:</N>');
          strComprovante.add(dm.BuscaTroca(qItensPedido.fieldbyname('sabores').value,LineBreak  ,','));

        end;



       qItensPedido.Next;
    end;
    strComprovante.add('</linha_simples>');
    strComprovante.add('</fn></ce><n>FORMAS DE PAGAMENTO</N>');
    strComprovante.add('</linha_simples>');


    qformasPagto.Active := false;
    qformasPagto.SQL.Clear;
    qformasPagto.SQL.Add(' select rd.cod_forma, fp.descricao, rd.valor  from recebimentos_delivery rd ');
    qformasPagto.SQL.Add('  inner join formas_pagamento fp on (fp.cod_forma = rd.cod_forma)');
    qformasPagto.SQL.Add('    where rd.cod_pedido='+Quotedstr(codPedido));
    qformasPagto.Active := true;
    qformasPagto.FetchAll;
    qformasPagto.First;

    dm.adicionaLog('Retornou '+INttostr(qformasPagto.RecordCount)+' pagamentos do pedido '+codPedido);




    while not qformasPagto.Eof  do
     begin
       descricaoFP   := qformasPagto.Fields[1].Value;
       valorFP       :=  FormatFloat('R$ ###,###,##0.00',qformasPagto.Fields[2].value);
       strComprovante.add ( PadRight(descricaoFP,14,' ')+PadLeft('',15)+PadLeft(valorFP,19) );
       qformasPagto.Next;
     end;
    strComprovante.add('</linha_simples>');
    qformasPagto.Active := false;




    strComprovante.add (PadRight(' Produtos:',20)+PadLeft( FormatFloat('R$ ###,###,##0.00 ', q.FieldByName('valor_bruto').value) ,28));


    if q.FieldByName('valor_entrega').Value > 0 then
     strComprovante.add ( PadRight(' + Taxa de entrega:',20)+PadLeft(FormatFloat('R$ ###,###,##0.00 ',  q.FieldByName('valor_entrega').Value)  ,28) )
    else
     strComprovante.add ( PadRight(' + Taxa de entrega:',20)+PadLeft('ISENTO'  ,28) );


    if q.FieldByName('valor_desconto').Value > 0 then
     strComprovante.add ( PadRight(' - Desconto:',20)+PadLeft(FormatFloat('R$ ###,###,##0.00 ',q.FieldByName('valor_desconto').Value)  ,28) );



    strComprovante.add('</linha_simples>');
    strComprovante.add ('<e><n>'+PadRight('Total:',7)+PadLeft(FormatFloat('R$ ###,###,##0.00 ',q.FieldByName('valor_total').Value) ,17)+'</e></N>' );
   strComprovante.add('</linha_simples>');
    if q.FieldByName('valor_troco').Value > 0 then
    strComprovante.add ('<e><n>'+PadRight('Troco:',7)+PadLeft(FormatFloat('R$ ###,###,##0.00 ',q.FieldByName('valor_troco').Value) ,17)+'</e></N>' );

    strComprovante.add('</linha_simples>');



    if (  trim(msg_promo_delivery) <> '')  then
     begin
      strComprovante.add('</fn></ce><n>MENSAGEM PROMOCIONAL</N>');
      strComprovante.add('</linha_simples>');

      strComprovante.add('</fn></ce><n>'+msg_promo_delivery+'</N>');
     end;




     for ct:= 1 to  StrToInt(LeIni(2,'IMPRESSORA_NAO_FISCAL_01','linhasAposCupom')) do
     begin
      strComprovante.add (' ');
     end;
    strComprovante.add('</corte_parcial>');



    frm_principal.memo_avisos.Lines.Clear;
    frm_principal.memo_avisos.Lines := strComprovante;
    imprimeTexoMiniPrinter;
  finally
    q.Active :=false;
    qItensPedido.Active := false;
    FreeAndNil(qformasPagto);
    FreeAndNil(q);
    FreeAndNil(qItensPedido);
    FreeAndNil(ts);
    FreeAndNil(strComprovante);
  end;

end;


procedure Tdm.formataCabecalhoDelivery(codPedido : string);
var
 q: TIBQuery;
 linha : string;
begin
  q:= TIBQuery.create(self);
  q.Database := dbrestaurante;
  q.Transaction := transacao;
  q.sql.clear;
  q.Active :=false;
  frm_principal.memoFormatacaoDelivery.Lines.Clear;
  q.sql.add('select p.codigo,p.cod_cliente, c.nome,c.telefone, c.endereco,c.complemento,c.referencia1,c.referencia2,b.descricao, p.retira_balcao  from pedidos_delivery  p');
  q.sql.add('   inner join clientes_delivery c on (c.codigo = p.cod_cliente)');
  q.sql.add('   inner join bairro b on (b.codigo = c.cod_bairro)');
  q.sql.add('  where p.codigo='+Quotedstr(codPedido));
  q.Active :=true;


  frm_principal.memoFormatacaoDelivery.Lines.Add('Nome: '+q.fieldbyname('nome').value);
  frm_principal.memoFormatacaoDelivery.Lines.Add('Telefone: '+q.fieldbyname('telefone').value);

  if q.fieldbyname('retira_balcao').value = 1 then
   begin
    linha:= formatacaoACBRInicial(true,false,false,true,false,true,false)+ 'RETIRAR NO BALCAO';
    linha := linha+formatacaoACBRFinal(true,false,false,true,false,true,false);
    linha := '<C>'+linha+'</C>';
    frm_principal.memoFormatacaoDelivery.Lines.Add(linha);

   end
  else
   begin
      frm_principal.memoFormatacaoDelivery.Lines.Add('Endereco: '+q.fieldbyname('endereco').value);
      frm_principal.memoFormatacaoDelivery.Lines.Add('Bairro '+q.fieldbyname('descricao').value);

      if( (q.fieldbyname('complemento').value <> null) and (  trim(q.fieldbyname('complemento').value) <> '') ) then
      begin
         frm_principal.memoFormatacaoDelivery.Lines.Add('Complemento: '+q.fieldbyname('complemento').value);
      end;

      if( (q.fieldbyname('referencia1').value <> null) and (  trim(q.fieldbyname('referencia1').value) <> '') ) then
      begin
         frm_principal.memoFormatacaoDelivery.Lines.Add('Ref 1: '+q.fieldbyname('referencia1').value);
      end;

      if( (q.fieldbyname('referencia2').value <> null) and (  trim(q.fieldbyname('referencia2').value) <> '') ) then
      begin
         frm_principal.memoFormatacaoDelivery.Lines.Add('Ref 2: '+q.fieldbyname('referencia2').value);
      end;
   end;


  q.Active :=false;
  FreeAndNil(q);
end;




function Tdm.getCodClientePedidoDelivery(codPedido : string) : string;
var
  Q : TIBQuery;
begin
  q := TIBQuery.Create(self);
  q.Database := dm.dbrestaurante;
  q.Transaction := transacao;
  q.Active:=false;
  q.SQL.clear;
  q.SQL.add('select cod_cliente from pedidos_delivery where codigo='+QUotedstr(codPedido));
  q.Active:=true;
  Result:= q.fieldbyname('cod_cliente').value;
  q.Active:=false;
  FreeAndNil(q);
end;

procedure Tdm.efetuaBaixaNoPedidoDelivery(codPedido : string ; cod_Venda : string ; cod_caixa : string ) ;
var
 q: TIBQuery;
begin
  q:= TIBQuery.create(self);
  q.Database := dbrestaurante;
  q.Transaction := transacao;
  q.sql.clear;
  q.Active :=false;
  q.SQL.add('update pedidos_delivery set data='+Quotedstr(FormatDateTime('DD.MM.YYY',data_do_sistema))+',');
  q.SQL.add(' status=3, hora_pagamento = current_timestamp, cod_caixa='+QUotedstr(cod_caixa)+', cod_venda='+Quotedstr(cod_venda)+' where codigo='+QUotedstr(codPedido));
  q.ExecSQL;

  q.Active:=false;
  q.sql.clear;
  q.sql.add('update clientes_delivery set ultimo_pedido='+QUotedstr(codPedido));
  q.SQL.add(' where codigo='+Quotedstr(getCodClientePedidoDelivery(codPedido)));
  q.ExecSQL;


  q.Active:=false;
  FreeAndNil(q);
end;







procedure Tdm.emtirRelatorioParcialDeCaixa();
var
 q : Tibquery;
 frmVazio : Tfrm_modelo_vazio;
begin
  Application.CreateForm(Tfrm_modelo_vazio,frmVazio);

  q:= TIBQuery.Create(self);
  q.Database:=dm.dbrestaurante;
  q.Transaction:=dm.transacao;
  q.active:=false;
  dm.procProcessaCaixa.Active:=false;
  dm.procProcessaCaixa.Params[0].Value:=ultimoCaixaAberto;
  dm.procProcessaCaixa.ExecProc;
  q.Active:=false;
  q.sql.clear;
  q.sql.add(' update caixas c set  c.hora_fechamento='+Quotedstr(FormatDateTime('HH:MM:SS',time))+',c.data_fechamento='+Quotedstr(formatDateTime('DD.MM.YY',date)));
  q.sql.add(' , c.total_sangrias='+dm.TrocaVirgPPto(FloatTostr(frmVazio.getTotalSangriasCaixa(ultimoCaixaAberto))));
  q.SQL.add(' where c.codigo='+Quotedstr(ultimoCaixaAberto));
  q.ExecSQL;
  dm.transacao.Commit;

  if localDeEmissaoDeExtrato = 1 then
   begin
    dm.imprimeRelatorioCaixa(marca_impressora_fiscal,ultimoCaixaAberto);
   end
  else
   begin
    dm.imprimeRelatorioCaixa(marca_impressora_nao_fiscal_01,ultimoCaixaAberto);
   end;


  FreeAndNil(frmVazio);
  FreeAndNil(q);
end;













procedure Tdm.deletaDadosREgistroECF();
var
reg: TRegistry;
begin
  reg := TRegistry.Create;
  reg.RootKey := HKEY_LOCAL_MACHINE;
  reg.DeleteKey('SOFTWARE\DarumaFramework\ECF');
  reg.CloseKey();
  reg.Free;
end;



function tdm.AnsiLength(const s: string): integer;
//
// Retorna o tamanho da string independente do seu tipo (Shortstring, Ansistring, Widstring...)
//
var
  p, q: pchar;
begin
  Result := 0;
  p := PChar(s);
  q := p + Length(s);
  while p < q do begin
    inc(Result);
    if p^ in LeadBytes then
      inc(p, 2)
    else
      inc(p);
  end;


end;


function Tdm.verificaSeFuncionaComoBoate() : boolean;
begin
  dm.tb_parametros.Active :=true;
  if (dm.tb_parametrosBOATE.Value = 0) then
   result := false
  else
   result:=true;

end;

function Tdm.verificaSeRecebeCouvertEntrada() : boolean;
begin
  dm.tb_parametros.Active :=true;
  if (dm.tb_parametrosRECEBE_COUVERT_ENTRADA.Value = 0) then
   result := false
  else
   result:=true;

end;




procedure Tdm.ExpXML(DataSet : TDataSet; Arq : string);
var
  i: integer;
  xml: TXMLDocument;
  reg, campo: IXMLNode;
begin
  xml := TXMLDocument.Create(nil);
  try
    xml.Active := True;
    DataSet.First;
    xml.DocumentElement :=
      xml.CreateElement('DataSet','');
    DataSet.First;
    while not DataSet.Eof do
    begin
      reg := xml.DocumentElement.AddChild('row');
      for i := 0 to DataSet.Fields.Count - 1 do
      begin
        campo := reg.AddChild(
          DataSet.Fields[i].DisplayLabel);
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
begin

  if ( StrToInt( dm.LeIni(2,'BALANCA','instalada')) = 1) then
   begin
      frm_principal.balanca.Porta := portaDaBalanca;
      frm_principal.balanca.Device.Baud := strtoInt(velocidadeBalanca);
      frm_principal.balanca.Device.Data := StrToInt(bitsDadosBalanca);

      case strToInt(fabricanteBalanca)  of
       0:  frm_principal.balanca.Modelo  := balToledo;
       1:  frm_principal.balanca.Modelo  := balUrano;
       2:  frm_principal.balanca.Modelo  := balUranoPOP;
       3:  frm_principal.balanca.Modelo  := balFilizola;
       4:  frm_principal.balanca.Modelo  := balMagna;
       5:  frm_principal.balanca.Modelo  := balMagellan;
       6: frm_principal.balanca.Modelo   := balLider;
      end;


      case strToInt(paridadeBalanca)  of

        0:  frm_principal.balanca.Device.Parity := pNone;
        1:  frm_principal.balanca.Device.Parity := pEven;
        2:  frm_principal.balanca.Device.Parity := pMark;
        3:  frm_principal.balanca.Device.Parity := pOdd;
        4:  frm_principal.balanca.Device.Parity := pSpace;
      end;


      case strToInt(stopBitsBalanca)  of
        1: frm_principal.balanca.Device.Stop := s1;
        2: frm_principal.balanca.Device.Stop := s1eMeio;
        3: frm_principal.balanca.Device.Stop := s2;
      end;

      case strToInt(fluxoBalanca) of
        0: frm_principal.balanca.Device.HandShake := hsNenhum;
        1: frm_principal.balanca.Device.HandShake := hsXON_XOFF;
        2: frm_principal.balanca.Device.HandShake := hsRTS_CTS;
        3: frm_principal.balanca.Device.HandShake := hsDTR_DSR;
      end;

      frm_principal.balanca.Desativar;

      try
       begin
        frm_principal.balanca.Ativar;
       end;
      except
        begin
         dm.exibe_painel_erro('Erro ao conectar à balança 01 . Verifique a porta ou cabo de conexão!','Continuar');
        end;
      end;

   end;

  if ( StrToInt( dm.LeIni(2,'BALANCA_02','instalada')) = 1) then
   begin

      frm_principal.balanca2.Porta := portaDaBalanca2;
      frm_principal.balanca2.Device.Baud := strtoInt(velocidadeBalanca2);
      frm_principal.balanca2.Device.Data := StrToInt(bitsDadosBalanca2);

      case strToInt(fabricanteBalanca2)  of
       0:  frm_principal.balanca2.Modelo  := balToledo;
       1:  frm_principal.balanca2.Modelo  := balUrano;
       2:  frm_principal.balanca2.Modelo  := balUranoPOP;
       3:  frm_principal.balanca2.Modelo  := balFilizola;
       4:  frm_principal.balanca2.Modelo  := balMagna;
       5:  frm_principal.balanca2.Modelo  := balMagellan;
       6: frm_principal.balanca2.Modelo   := balLider;
      end;

      case strToInt(paridadeBalanca2)  of
       0:  frm_principal.balanca2.Device.Parity := pNone;
       1:  frm_principal.balanca2.Device.Parity := pEven;
       2:  frm_principal.balanca2.Device.Parity := pMark;
       3:  frm_principal.balanca2.Device.Parity := pOdd;
       4:  frm_principal.balanca2.Device.Parity := pSpace;
      end;


      case strToInt(stopBitsBalanca2)  of
       1: frm_principal.balanca2.Device.Stop := s1;
       2: frm_principal.balanca2.Device.Stop := s1eMeio;
       3: frm_principal.balanca2.Device.Stop := s2;
      end;

      case strToInt(fluxoBalanca2) of
       0: frm_principal.balanca2.Device.HandShake := hsNenhum;
       1: frm_principal.balanca2.Device.HandShake := hsXON_XOFF;
       2: frm_principal.balanca2.Device.HandShake := hsRTS_CTS;
       3: frm_principal.balanca2.Device.HandShake := hsDTR_DSR;
      end;

      frm_principal.balanca2.Desativar;

      try
        begin
         frm_principal.balanca2.Ativar;
        end;
       except
         begin
           dm.exibe_painel_erro('Erro ao conectar à balança 02. Verifique a porta ou cabo de conexão!','Continuar');
         end;
       end;

   end;

   frm_principal.balanca.Desativar;
   frm_principal.balanca2.Desativar;


end;




procedure Tdm.reimprimirDanfe(parametro: string; campo: smallint; visualizar : boolean; cancelada : boolean);
var
 localArquivoXML : string;
 q : TIBQuery;
begin

 if (dm.ACBrPosPrinter1 <> nil )  then
    begin
      dm.ACBrPosPrinter1.Desativar;
      FreeAndNil(dm.ACBrPosPrinter1);
    end;

 dm.ACBrPosPrinter1 := TACBrPosPrinter.Create(self);

  q := TIBquery.create(self);
  q.Database := dm.dbrestaurante;
  q.Transaction := dm.transacao;

  q.Active:=false;
  q.SQL.Clear;


  if cancelada = false  then
   begin
      if campo = 1 then
        q.SQL.Add('select v.modelo_comprovante,v.xml_doc from vendas v where v.chave_nfce='+Quotedstr(parametro))
      else
        q.SQL.Add('select v.modelo_comprovante,v.xml_doc from vendas v where v.cod_venda='+Quotedstr(parametro));
    end
   else
    begin
      if campo = 1 then
        q.SQL.Add('select v.modelo_comprovante,v.xml_doc from vendas_canceladas v where v.chave_nfce='+Quotedstr(parametro))
      else
        q.SQL.Add('select v.modelo_comprovante,v.xml_doc from vendas_canceladas v where v.cod_venda='+Quotedstr(parametro));

    end;
  q.Active := true;

  if q.IsEmpty  then
    begin
      Showmessage('Documento não localizado para reimpressão!');

    end


  else
   begin
      if ( (q.FieldByName('modelo_comprovante').Value  = 2 ) or (q.FieldByName('modelo_comprovante').Value  = 3 ) ) then
       begin
         dm.ACBrNFe1.NotasFiscais.Clear;

         if (q.FieldByName('modelo_comprovante').Value  = 2 ) then  // Se for NFC-e
          begin
            configuraImpressoraNFCE();
            dm.parametrizaAcbrNFE(moNFCe,visualizar ,true);



            if visualizar = false then
             begin
                try
                  dm.configuraImpressoraNFCE();
                except
                   begin
                    dm.exibe_painel_erro('Erro ao comunicar com a impressora de NFC-e!','fechar');
                    exit;
                   end;
                end;
             end;

               dm.ACBrNFe1.NotasFiscais.LoadFromString (q.FieldByName('xml_doc').Value );
               dm.ACBrNFe1.NotasFiscais[0].Imprimir;
               dm.ACBrPosPrinter1.CortarPapel(true);
    //         end;
          end

         else    // Se for NF-e
          begin
               dm.ACBrNFeDANFEFR1.TipoDANFE :=  tiPaisagem;
               dm.ACBrNFe1.NotasFiscais.LoadFromString(q.FieldByName('xml_doc').Value);
               dm.ACBrNFe1.NotasFiscais[0].Imprimir;
          end;


       end
      else
       begin
         if (q.FieldByName('modelo_comprovante').Value = 4) then
          begin
            dm.parametrizaAcbrNFE(moNFCe,false,true);
            try
              dm.configuraImpressoraNFCE();
            except
               begin
                dm.exibe_painel_erro('Erro ao comunicar com a impressora de NFC-e!','fechar');
                exit;
               end;
            end;


            dm.sat.ImprimirExtrato();
            dm.ACBrPosPrinter1.CortarPapel(true);
          end

         else
          begin
           exibe_painel_erro('O Documento de encerramento desta venda não foi uma NFE ou NFC-e!', 'Ok');
           exit;
          end;
       end;



   end;

  inherited;


  q.Active := false;
  FreeAndNil(q);

end;



procedure Tdm.parametrizaArquivoDeLogoNFE(ANotaEmissaoPropria : boolean);
begin
  ACBrNFeDANFEFR1.Logo := '';
  if ANotaEmissaoPropria  then
   begin
     try
      if FileExists(dm.LeIni(2,'NFE','ArquivoLogoTipoNFE')) then
       ACBrNFeDANFEFR1.Logo := dm.LeIni(2,'NFE','ArquivoLogoTipoNFE')
      else
       if FileExists( patchAplicacao+'\imagens\logoNFEPadrao.jpg') then
         ACBrNFeDANFEFR1.Logo  := patchAplicacao+'\imagens\logoNFEPadrao.jpg'
       else
         ACBrNFeDANFEFR1.Logo :='';

     except
       dm.adicionaLog('Ocorreu erro ao carregar o arquivo do logotipo da NFE');
       dm.adicionaLog('Caminho do arquivo: '+ dm.LeIni(2,'NFE','ArquivoLogoTipoNFE'));
       ACBrNFeDANFEFR1.Logo := '';
     end;

   end;


end;

procedure TDM.parametrizaAcbrNFE(modeloNfe: TpcnModeloDF; visualizar : boolean;
  ANotaEmissaoPropria: boolean);
VAR
  wincrypt : boolean;
  temCertificadoInstalado : boolean;
begin
    dm.adicionaLog('Inicia parametrização do ACBRNFe');


  dm.tb_parametros.Active := true;
  temCertificadoInstalado := (tb_parametrosNUM_SERIE_CERTIFICADO.Value <> null) and ( trim(tb_parametrosNUM_SERIE_CERTIFICADO.Value) <> '');

  if  ( temCertificadoInstalado = true )  then
   begin
    dm.adicionaLog('Tem ceritificado informado nos parâmetros');
    parametrizaArquivoDeLogoNFE(ANotaEmissaoPropria);
    case strToInt( dm.LeIni(2,'NFE','libAutenticacao')) of
      1: begin
           DM.ACBrNFe1.Configuracoes.Certificados.NumeroSerie := dm.tb_parametrosNUM_SERIE_CERTIFICADO.Value;
           dm.ACBrNFe1.Configuracoes.Certificados.Senha       := dm.tb_parametrosSENHA_CERTIFICADO.Value;
           ACBrNFe1.Configuracoes.Geral.SSLLib := libWinCrypt;
           ACBrNFe1.Configuracoes.Geral.SSLCryptLib := cryWinCrypt;
           ACBrNFe1.Configuracoes.Geral.SSLHttpLib :=  httpWinHttp;
           ACBrNFe1.Configuracoes.Geral.SSLXmlSignLib := xsLibXml2 ;
           dm.ACBrNFe1.SSL.SSLType := LT_all;
           dm.adicionaLog('Lib de autenticação: Wincrypt');
         end;

      2: begin
           DM.ACBrNFe1.Configuracoes.Certificados.NumeroSerie := dm.tb_parametrosNUM_SERIE_CERTIFICADO.Value;
           dm.ACBrNFe1.Configuracoes.Certificados.Senha       := dm.tb_parametrosSENHA_CERTIFICADO.Value;
           ACBrNFe1.Configuracoes.Geral.SSLLib := libCapicom;
           dm.ACBrNFe1.Configuracoes.Geral.SSLCryptLib := cryCapicom;
           ACBrNFe1.Configuracoes.Geral.SSLHttpLib :=  httpWinINet;
           ACBrNFe1.Configuracoes.Geral.SSLXmlSignLib := xsMsXmlCapicom;
           dm.ACBrNFe1.SSL.SSLType := LT_all;
           dm.adicionaLog('Lib de autenticação: Capicom');
         end;

    3:  begin
           ACBrNFe1.Configuracoes.Certificados.ArquivoPFX := patchAplicacao+'certificados\'+cnpj+'.pfx';
         dm.ACBrNFe1.Configuracoes.Certificados.Senha       := dm.tb_parametrosSENHA_CERTIFICADO.Value;
         ACBrNFe1.SSL.CarregarCertificado;
         if(ACBrNFe1.SSL.CertificadoLido)then
           begin
              adicionaLog('Certificado lido foi: '+ACBrNFe1.SSL.CertNumeroSerie);
           end
         else
          begin
           adicionaLog('Erro ao ler o certificado via openssl');
          end;

         DM.ACBrNFe1.Configuracoes.Geral.SSLLib := libOpenSSL;
         dm.ACBrNFe1.Configuracoes.Geral.SSLCryptLib := cryOpenSSL;
         ACBrNFe1.Configuracoes.Geral.SSLHttpLib :=  httpOpenSSL;
         ACBrNFe1.Configuracoes.Geral.SSLXmlSignLib := xsLibXml2;
         dm.ACBrNFe1.SSL.SSLType := LT_all;
          dm.adicionaLog('Lib de autenticação: OpenSSL');
       end;

    end;

     case strToInt( dm.LeIni(2,'NFE','versaoNFE')) of
      0:   begin
            dm.ACBrNFe1.Configuracoes.Geral.VersaoDF           := ve310;
            dm.adicionaLog('NFE Versão 3.10');
           end;
      1:   begin
             dm.ACBrNFe1.Configuracoes.Geral.VersaoDF           := ve310;
             dm.adicionaLog('NFE Versão 3.10');
           end;
      2 :  begin
            dm.ACBrNFe1.Configuracoes.Geral.VersaoDF           := ve400;
            dm.adicionaLog('NFE Versão 4.0');
           end;
     end;







    dm.ACBrNFe1.Configuracoes.Arquivos.PathSchemas     := dm.LeIni(2,'NFE','caminhoSCHEMAS');
    dm.ACBrNFe1.Configuracoes.Arquivos.PathNFe         := dm.LeIni(2,'NFE','caminhoArquivosXML');
    dm.ACBrNFe1.Configuracoes.Arquivos.Salvar          := false;
    dm.ACBrNFe1.Configuracoes.WebServices.UF           := dm.tb_parametrosUF.Value;
    dm.ACBrNFe1.Configuracoes.Geral.ModeloDF           := modeloNfe;
    dm.ACBrNFe1.Configuracoes.Geral.FormaEmissao := teNormal;

    if modeloNfe = moNFCe  then
     begin
       dm.ACBrNFeDANFEFR1.TipoDANFE :=  tiNFCe;
       ACBrNFe1.Configuracoes.Geral.VersaoQRCode :=veqr200;
       dm.adicionaLog('Versão do QRCode: 2.0');



       if visualizar   then
        begin
         dm.ACBrNFe1.DANFE := ACBrNFeDANFCEFR1;
         ACBrNFeDANFEFR1.TipoDANFE := tiNFCe;
         dm.ACBrNFe1.DANFE.TipoDANFE := tiRetrato;
         ACBrNFeDANFCEFR1  .FastFile :=patchAplicacao+'\relatorios\DANFeNFCe.fr3';
        end
       else
        begin
         dm.ACBrNFe1.DANFE := ACBrNFeDANFeESCPOS1;
         ACBrNFeDANFeESCPOS1.TipoDANFE := tiNFCe;
         dm.ACBrNFe1.DANFE.TipoDANFE := tiSemGeracao;
        end;

       case StrToInt(dm.LeIni(1,'NFCE','ambienteEmissao'))  of
        1: begin
             dm.ACBrNFe1.Configuracoes.WebServices.Ambiente := taHomologacao;
             dm.ACBrNFe1.Configuracoes.Geral.CSC                := dm.tb_parametrosCSC_NFCE_HOMOLOGACAO.Value;
             dm.ACBrNFe1.Configuracoes.Geral.IdCSC              := dm.tb_parametrosID_CSC_NFCE_HOMOLOGACAO.Value;


          end;
        2: begin
             dm.ACBrNFe1.Configuracoes.WebServices.Ambiente := taProducao;
             dm.ACBrNFe1.Configuracoes.Geral.CSC                := dm.tb_parametrosCSC_NFCE.value;
             dm.ACBrNFe1.Configuracoes.Geral.IdCSC              := dm.tb_parametrosID_CSC_NFCE.Value;
           end;
       end;
     end
    else
     begin
       dm.ACBrNFe1.DANFE := ACBrNFeDANFEFR1;
       ACBrNFeDANFEFR1.TipoDANFE := tiRetrato;
       dm.ACBrNFe1.DANFE.TipoDANFE := tiRetrato;
       ACBrNFeDANFEFR1  .FastFile :=patchAplicacao+'\relatorios\DANFePaisagem.fr3';
       dm.ACBrNFe1.Configuracoes.Geral.CSC                := '';
       dm.ACBrNFe1.Configuracoes.Geral.IdCSC              := '';
       dm.ACBrNFe1.Configuracoes.WebServices.Ambiente := taProducao;






       case StrToInt(dm.LeIni(1,'NFE','ambienteEmissao'))  of
        1: begin
             dm.ACBrNFe1.Configuracoes.WebServices.Ambiente := taHomologacao;
          end;
        2: begin
             dm.ACBrNFe1.Configuracoes.WebServices.Ambiente := taProducao;
           end;
       end;

     end;

     dm.adicionaLog('Testa expiração do certificado digital:');
     if testouExpiracaoCertificadoEntrada = false then
      begin
        verificaExpiracaoCertificadoDigital();
        testouExpiracaoCertificadoEntrada := true;
      end;

   end;

end;

procedure Tdm.verificaExpiracaoCertificadoDigital();
var
 temCertificadoInstalado : boolean;
 diasExpiracaoCertificado : integer;
begin


  temCertificadoInstalado := (tb_parametrosNUM_SERIE_CERTIFICADO.Value <> null) and ( trim(tb_parametrosNUM_SERIE_CERTIFICADO.Value) <>  '');

   if temCertificadoInstalado  then
   begin
      diasExpiracaoCertificado := DaysBetween(Now,dm.ACBrNFe1.SSL.CertDataVenc);
      dm.adicionaLog('Faltam '+Inttostr(diasExpiracaoCertificado)+' para expirar o certificado!');

     if ( diasExpiracaoCertificado   <= 30 ) then
      begin
       Application.CreateForm(TfrmMensagemExpiracaoCertificado,frmMensagemExpiracaoCertificado);
       try
        try
          frmMensagemExpiracaoCertificado.setDataexpiracao(dm.ACBrNFe1.SSL.CertDataVenc);
          frmMensagemExpiracaoCertificado.ShowModal;
        except
         exibe_painel_erro('Erro ao verificar data de expiração do certificado!','Ok');
         dm.adicionaLog('Erro ao verificar data de expiração do certificado digital');
        end;
        finally

        frmMensagemExpiracaoCertificado.Free;
       end;
      end;
   end
 else
  begin
    dm.adicionaLog('Certificado digital não instalado o definido na tabela de parâmetros!');
    testouExpiracaoCertificadoEntrada := true;
  end;



end;


procedure Tdm.DataModuleDestroy(Sender: TObject);
begin
  dm.dbrestaurante.Connected := false;
end;



procedure Tdm. ListarArquivos(Diretorio: string; Sub:Boolean ; lista : TStrings );
var
  F: TSearchRec;
  Ret: Integer;
  TempNome: string;
begin

  Ret := FindFirst(Diretorio+'\*.*', faAnyFile, F);
  try
    while Ret = 0 do
    begin
      if TemAtributo(F.Attr, faDirectory) then
      begin
        if (F.Name <> '.') And (F.Name <> '..') then
          if Sub = True then
          begin
            TempNome := Diretorio+'\' + F.Name;
            ListarArquivos(TempNome, True, lista);
          end;
      end
      else
      begin
       lista.Add(Diretorio+'\'+F.Name);
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



function  Tdm.verificaStatusNotasSefaz(chaveNFCE : string) : boolean;
begin
  inherited;


   parametrizaAcbrNFE(moNFCe,false,true);
   dm.ACBrNFe1.NotasFiscais.Clear;
   dm.ACBrNFe1.WebServices.Consulta.NFeChave := chaveNFCE;
   dm.ACBrNFe1.WebServices.Consulta.Executar;

//   showmessage('Motivo: '+  trim(dm.ACBrNFe1.WebServices.Consulta.XMotivo));



     if  ( trim(dm.ACBrNFe1.WebServices.Consulta.XMotivo) = 'Autorizado o uso da NF-e') then
      begin
        dm.qryauxiliar2.Active := false;
        dm.qryauxiliar2.sql.clear;
        dm.qryauxiliar2.sql.add('update vendas v set  v.consulta_ok=1, v.protocolo_nfce ='+Quotedstr(dm.ACBrNFe1.WebServices.Consulta.Protocolo) +' ,v.obs_nfce='+Quotedstr(dm.ACBrNFe1.WebServices.Consulta.XMotivo));
        dm.qryauxiliar2.sql.add(' where v.chave_nfce='+Quotedstr(chaveNFCE ));
        dm.qryauxiliar2.ExecSQL;
        result := true;
      end
     else
      begin
        dm.qryauxiliar2.Active := false;
        dm.qryauxiliar2.sql.clear;
        dm.qryauxiliar2.sql.add('update vendas v set  v.consulta_ok=0, v.obs_nfce='+Quotedstr(dm.ACBrNFe1.WebServices.Consulta.XMotivo));
        dm.qryauxiliar2.sql.add(' where v.chave_nfce='+Quotedstr(chaveNFCE ));
        dm.qryauxiliar2.ExecSQL;

        result := false;

      end;

    dm.transacao.Commit;
    dm.transacao.Active := false;
    dm.transacao.Active := true;

end;

procedure Tdm.habilitaCltrAltDel();
var
  reg: TRegistry;
begin
  // uses Registry

  // vamos criar uma instância da classe TRegistry
  reg := TRegistry.Create;

  // vamos abrir a chave que contém a entrada DisableTaskMgr
  reg.OpenKey('Software\Microsoft\Windows\CurrentVersion\Policies\system',
    True);

  // para habilitar basta excluir o valor da entrada
  reg.DeleteValue('DisableTaskMgr');
  reg.CloseKey;

  // vamos liberar o registro
  reg.Free;
end;

procedure Tdm.IdThreadComponent1BeforeRun(Sender: TIdThreadComponent);
begin
  nfceEnviada := false;
  terminouEnvioNFCE := false;
end;

procedure Tdm.IdThreadComponent1Run(Sender: TIdThreadComponent);
begin
  nfceEnviada :=  EnviaNFCE();
  IdThreadComponent1.Terminate;

end;

procedure Tdm.IdThreadComponent1Terminate(Sender: TIdThreadComponent);
begin
  terminouEnvioNFCE := true;
end;

procedure Tdm.desabilitaCltrAltDel();
var
  reg: TRegistry;
begin
  // uses Registry

  // vamos criar uma instância da classe TRegistry
  reg := TRegistry.Create;

  // vamos abrir a chave que contém a entrada DisableTaskMgr
  reg.OpenKey('Software\Microsoft\Windows\CurrentVersion\Policies\system',
    True);

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

  Fim: Byte ;

begin

     FileSaida := TFileStream.Create(ArquivoCompacto, fmCreate or fmShareExclusive);

     Compressor := TCompressionStream.Create( clMax, FileSaida);

     NumArq := Length(Arquivos);

     Compressor.Write(NumArq, SizeOf(Integer));

     try

        for I := Low(Arquivos) to High(Arquivos) do begin

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


procedure Tdm.adicionaLog(observacao: string);
var arq: TextFile;
linha: String;
nomeDoArquivo : string;

begin
  observacao :=FormatDateTime('HH:MM:SS',Time)+' - '+observacao;
  nomeDoArquivo := patchAplicacao+'logs\'+FormatDateTime('YYY',Date)+'_'+FormatDateTime('MM',date)+'_'+FormatDateTime('DD',Date)+'.log';
  AssignFile ( arq, nomeDoArquivo );

  if not FileExists(nomeDoArquivo ) then
    Rewrite ( arq )
  else
    Append(arq);


  Writeln(arq,observacao);
  CloseFile ( arq );
end;

procedure Tdm.adicionaLogSAT(observacao: string);
var arq: TextFile;
linha: String;
nomeDoArquivo : string;

begin
  observacao :=FormatDateTime('HH:MM:SS',Time)+' - '+observacao;
  nomeDoArquivo := patchAplicacao+'logs\SAT\'+FormatDateTime('YYY',Date)+'_'+FormatDateTime('MM',date)+'_'+FormatDateTime('DD',Date)+'.log';
  AssignFile ( arq, nomeDoArquivo );

  if not FileExists(nomeDoArquivo ) then
    Rewrite ( arq )
  else
    Append(arq);


  Writeln(arq,observacao);
  CloseFile ( arq );
end;



procedure tdm.setEstadoSimuladoECF(estado : tEstadoEcfSimulado );
begin
   estadoSimuladoEcf := estado;
end;


function Tdm.getEstadoSimuladoECF() : tEstadoEcfSimulado;
begin
  result  := estadoSimuladoEcf;
end;

procedure tdm.setOperacaoADMTEF(operacao : boolean);
begin
  operacaoADMTEF := operacao;
end;


procedure tdm.setTipoOperacaoTEF(tipo : smallint);
begin
 tipoOperacaoTEF := tipo;
end;

function Tdm.getTipoOperacaoTEF() : smallint;
begin
 result := tipoOperacaoTEF;
end;

procedure Tdm.setNumeroTransacaoTef(num : smallint);
begin
  numeroTransacaoTef :=num;
end;

function Tdm.getNumeroTransacaoTef() : smallint;
begin
  Result := numeroTransacaoTef;

end;

function Tdm.autenticaTEF() : boolean;
var
 resultadoAutenticacao, pdv  : integer;
 cnpj,chaveAutenticacao  : string;
begin
   ACBrTEFD1.EsperaSleep := 250;
   ACBrTEFD1.EsperaSTS   := 9;

  if  (VerificaConexaoInternet = false) then
   begin
    exibe_painel_erro('Internet indisponível. Verifique a conexão','Ok');
    Result := false;
    exit;
   end;




   try
     dm.ACBrTEFD1.DesInicializar (gpTefDial);
   except
    begin
      TEFAutenticou := false;
      exibe_painel_erro('Erro ao DesInicializar o servidor de TEF!','Ok');
      exit;
    end;
   end;
   
   

   try
     dm.ACBrTEFD1.Inicializar(gpTefDial);
     TEFAutenticou := true;
   except
    begin
      TEFAutenticou := false;
      exibe_painel_erro('Não foi possível conectar ao servidor de TEF!','Ok');
      exit;
    end;
   end;

   Result := TEFAutenticou;


end;



function Tdm.AnsiToUtf8(x: ansistring): string;
  { Function that recieves ansi string and converts
    to UTF8 string }
var
  i: integer;
  b1, b2: byte;
begin
  Result := x;
  for i := Length(Result) downto 1 do
    if Result[i] = #127 then begin
      b1 := $C0 or (ord(Result[i]) shr 6);
      b2 := $80 or (ord(Result[i]) and $3F);
      Result[i] := chr(b1);
      Insert(chr(b2), Result, i + 1);
    end;
end;


procedure Tdm.ExportaDatasetExcel(DataSet: TDataSet; Arq: string);
var
  ExcApp: OleVariant;
  i,l: integer;
begin
  ExcApp := CreateOleObject('Excel.Application');
  ExcApp.Visible := True;
  ExcApp.WorkBooks.Add;
  DataSet.First;
  l := 1;
  //Adicionar titulos
  for i := 0 to DataSet.Fields.Count - 1 do
    begin

      ExcApp.WorkBooks[1].Sheets[1].Cells[l,i + 1] :=
        DataSet.Fields[i].DisplayName;

    end;

  l := 2;
  DataSet.First;
  while not DataSet.EOF do
  begin
    for i := 0 to DataSet.Fields.Count - 1 do
      ExcApp.WorkBooks[1].Sheets[1].Cells[l,i + 1] :=
        DataSet.Fields[i].DisplayText;
    DataSet.Next;
    l := l + 1;
  end;
  ExcApp.WorkBooks[1].SaveAs(Arq);
end;







function Tdm.getNCMProduto(tipoConsulta : smallint; codigo : string) : string;
var
 q : TIBQuery;
 formato,str : string;
begin
  if dm.transLog.Active = false  then dm.transLog.Active:= true;
  q := TIBquery.create(self);
  q.Database := dm.dbrestaurante;
  q.Transaction := dm.transLog;

  q.Active := false;
  q.SQL.Clear;


  q.SQL.Clear;

  if tipoConsulta = 0 then
    q.SQL.Add('select coalesce(ncm,'+Quotedstr('')+') as resultado from produtos p where p.cod_barras='+Quotedstr(codigo))
  else
    q.SQL.Add('select coalesce(ncm,'+Quotedstr('')+') as resultado from produtos p where p.cod_produto='+Quotedstr(codigo));

  adicionaLog(q.SQL.Text);

  q.Active := true;
  q.FetchAll;

  result := q.FieldByName('resultado').Value;

  FreeAndNil(q);
end;



function Tdm.getCFOPProduto(tipoConsulta : smallint; codigo : string) : string;
var
 q : TIBQuery;
 formato,str : string;
begin
  if dm.transLog.Active = false  then dm.transLog.Active:= true;
  q := TIBquery.create(self);
  q.Database := dm.dbrestaurante;
  q.Transaction := dm.transLog;

  q.Active := false;
  q.SQL.Clear;


  q.SQL.Clear;

  if tipoConsulta = 0 then
    q.SQL.Add('select coalesce(cfop_saida,'+Quotedstr('')+') as resultado from produtos p where p.cod_barras='+Quotedstr(codigo))
  else
    q.SQL.Add('select coalesce(cfop_saida,'+Quotedstr('')+') as resultado from produtos p where p.cod_produto='+Quotedstr(codigo));

  adicionaLog(q.SQL.Text);

  q.Active := true;
  q.FetchAll;

  result := q.FieldByName('resultado').Value;

  FreeAndNil(q);
end;




function Tdm.getCSTProduto(tipoConsulta : smallint; codigo : string) : string;
var
 q : TIBQuery;
 formato,str : string;
begin
  if dm.transLog.Active = false  then dm.transLog.Active:= true;
  q := TIBquery.create(self);
  q.Database := dm.dbrestaurante;
  q.Transaction := dm.transLog;

  q.Active := false;
  q.SQL.Clear;


  q.SQL.Clear;

  if tipoConsulta = 0 then
    q.SQL.Add('select coalesce(cst_saida,'+Quotedstr('')+') as resultado from produtos p where p.cod_barras='+Quotedstr(codigo))
  else
    q.SQL.Add('select coalesce(cst_saida,'+Quotedstr('')+') as resultado from produtos p where p.cod_produto='+Quotedstr(codigo));

  adicionaLog(q.SQL.Text);

  q.Active := true;
  q.FetchAll;

  result := q.FieldByName('resultado').Value;

  FreeAndNil(q);
end;




function Tdm.getCESTProduto(tipoConsulta : smallint; codigo : string) : string;
var
 q : TIBQuery;
 formato,str : string;
begin
  if dm.transLog.Active = false  then dm.transLog.Active:= true;
  q := TIBquery.create(self);
  q.Database := dm.dbrestaurante;
  q.Transaction := dm.transLog;

  q.Active := false;
  q.SQL.Clear;


  q.SQL.Clear;

  if tipoConsulta = 0 then
    q.SQL.Add('select coalesce(cest,'+Quotedstr('')+') as resultado from produtos p where p.cod_barras='+Quotedstr(codigo))
  else
    q.SQL.Add('select coalesce(cest,'+Quotedstr('')+')as resultado from produtos p where p.cod_produto='+Quotedstr(codigo));

  adicionaLog(q.SQL.Text);

  q.Active := true;
  q.FetchAll;
  result := q.FieldByName('resultado').Value;



  FreeAndNil(q);
end;

function Tdm.verificaSeErroNFEPermiteContingencia (erro : smallint; mensagem : string ) : smallint;
var
 q : TIBQuery;
 formato,str : string;
begin
  if dm.transLog.Active = false  then dm.transLog.Active:= true;
  q := TIBquery.create(self);
  q.Database := dm.dbrestaurante;
  q.Transaction := dm.transLog;

  q.Active := false;
  q.SQL.Clear;


  q.SQL.Clear;
  q.SQL.Add('select * from ERROS_NFE where codigo='+Inttostr(erro)+' and catalogado=1');
  adicionaLog(q.SQL.Text);
  q.Active := true;
  q.FetchAll;

  if q.IsEmpty  then
   begin
     adicionaLog('Erro ainda não catalogado');

     q.Active := false;
     q.SQL.Clear;
     q.SQL.Add('select * from ERROS_NFE where codigo='+Inttostr(erro));
     q.Active := true;
     if q.IsEmpty  = true then
      begin
       q.Active := false;
       q.SQL.Clear;
       q.SQL.Add('insert into erros_nfe (codigo,descricao,travar_emissao,catalogado) values (');
       q.sql.Add(''+Inttostr(erro)+',');
       q.sql.Add(''+Quotedstr(mensagem)+',');
       q.sql.Add(''+Inttostr(1)+',');
       q.sql.Add(''+Inttostr(0)+')');
       adicionaLog(q.SQL.Text);
       q.ExecSQL;

       if dm.transLog.Active = false  then dm.transLog.Active:= true;
       dm.transLog.Commit;
      end;

     Result := -1;
   end
  else
   begin
     if q.FieldByName('TRAVAR_EMISSAO').Value  = 1 then
      Result := 0
     else
      Result := 1;
   end;

  q.Active := false;
  FreeAndNil(q);
end;


function tdm.EnviaNFCE() : Boolean;
var
 notaEnviada : boolean;
 msgErroEnvio : string;
 serie : integer;
 numeroNF : integer;
 segundosMensagem : smallint;
 codErroEnvioNota : smallint;
 retornoErroNFCE : smallint;
 mensagemErroEnvioNota : string;

 chaveNota : string;
 chaveNotaContingencia : string;



begin
  notaEnviada := false;
  adicionaLog ('Inicia a emissão da nota online');
  setFormaEmissaoNFCE(StrToInt(dm.LeIni(1,'NFCE','formaEmissaoOnline')));
  dm.gravaini('NFCE','formaEmissao','1');
  ACBrNFe1.NotasFiscais[0].NFe.Ide.serie := getSerieNFCE ();
  ACBrNFe1.NotasFiscais[0].NFe.Ide.nNF  := 1;
  adicionaLog('Pegou o número '+Inttostr( ACBrNFe1.NotasFiscais[0].NFe.Ide.nNF));



 if  gerarEAssinarNFCE() then
  begin
     numeroNF := ACBrNFe1.NotasFiscais[0].NFe.Ide.nNF;
     dm.adicionaLog('XML da NFC-e de número: ' +Inttostr(numeroNF));
     dm.adicionaLog(dm.ACBrNFe1.NotasFiscais[0].XML);
//      dm.exibeFormDeMensagens('Enviando NFC-e. Por favor, aguarde...',25,40,700,400);
      AdicionaNFCENaListaDeNotasParaCancelar(2);
      chaveNota := copy(dm.ACBrNFe1.NotasFiscais[0].NFe.infNFe.ID,4,60);

      try
       begin
          dm.adicionaLog('Faz a entativa de enviar a nota...');
          dm.ACBrNFe1.Enviar(dm.ACBrNFe1.NotasFiscais[0].NFe.Ide.nNF ,false, nfceSincrona  ,true);
          adicionaLog('Enviou a a nota com a chave '+copy(dm.ACBrNFe1.NotasFiscais[0].NFe.infNFe.ID,4,60));
          notaEnviada  := true;
          podeFecharFormMensagens := true;
        end;
      except
        on E : Exception  do
         begin
           adicionaLog('     Ocorreu erro no envio da nota '+copy(dm.ACBrNFe1.NotasFiscais[0].NFe.infNFe.ID,4,60));
           msgErroEnvio := e.Message;
           adicionaLog('          '+msgErroEnvio);
         end;
      end;


      if nfceSincrona   then
        begin
          dm.adicionaLog('Tipo do envio: Síncrono');
          codErroEnvioNota := ACBrNFe1.WebServices.Enviar.cStat;
          mensagemErroEnvioNota := msgErroEnvio; //ACBrNFe1.WebServices.Enviar.xMotivo;
        end
      else
       begin
         dm.adicionaLog('Tipo do envio: Assíncrono');
         codErroEnvioNota      := ACBrNFe1.WebServices.Retorno.cStat;
         mensagemErroEnvioNota := msgErroEnvio; //ACBrNFe1.WebServices.Retorno.xMsg;
       end;

       dm.adicionaLog('Código de retorno envio '+IntToStr(codErroEnvioNota)) ;
       dm.adicionaLog('Mensagem do envio: '+mensagemErroEnvioNota);


        if notaEnviada then
         begin
  //           RemoveNFCEDaListaDeNotasParaCancelar(2);
           Result := true;
         end
        else
         begin
               retornoErroNFCE :=  verificaSeErroNFEPermiteContingencia(codErroEnvioNota,mensagemErroEnvioNota);
               if retornoErroNFCE =  1  then
                begin

                   ativarModoContingenciaOfflineNFCE();
                   dm.adicionaLog('Ativou a contingência automática');

                   segundosMensagem := 2;
                   tentandoEmissaoContingencia := true;
                   frm_encerramento.SetMensagemPainelInformacoes('Emitindo em modo de contingência offline.',
                                          ' O Sistema não conseguiu se conectar com o servidor da SEFAZ.' +
                                          '´Possivelmente sua conexão está instável ou o servidor está congestionado.'
                                            ,segundosMensagem,4,true);


                   while (segundosMensagem >=0 ) do
                    begin

                      frm_encerramento.SetMensagemPainelInformacoes('Emitindo em modo de contingência offline.',
                                          ' O Sistema não conseguiu se conectar com o servidor da SEFAZ.' +
                                          '´Possivelmente sua conexão está instável ou o servidor está congestionado.'
                                            ,segundosMensagem,4,true);
                       Sleep(1000);
                       Application.ProcessMessages();
                       segundosMensagem := segundosMensagem -1;
                    end;


                    if enviaNFCEContingencia  then
                     begin
                      chaveNotaContingencia := copy(dm.ACBrNFe1.NotasFiscais[0].NFe.infNFe.ID,4,60);
                      AtualizaChaveNotaSubstitutaCancelar(chaveNota, chaveNotaContingencia);
                      Result := true;
                     end
                    else
                     begin
                       Result := false;
                     end;
                    dm.tentandoEmissaoContingencia :=false;



                end
               else
                begin

                   if retornoErroNFCE = -1 then
                     begin
                        // erro não catalogado!;
                       frm_encerramento.SetMensagemPainelInformacoes('Erro não catalogado!',
                        ' O sistema obteve um código de erro ainda não catalogado da Sefaz.'+
                        LineBreak+LineBreak
                        +'Entre em contato Urgente com a Real Softwares e comunique o erro.' +
                        LineBreak+LineBreak
                        +'Código: '+Inttostr(codErroEnvioNota)+LineBreak
                        +'Erro: '+mensagemErroEnvioNota,0,2,false);
                        Result := false;

                     end
                   else
                     begin
                         frm_encerramento.SetMensagemPainelInformacoes('Erro no envio da NFC-e',
                          ' Não foi possível enviar a nota. Verifique o erro' +
                          ' reportado abaixo e proceda com as correções. Se tiver' +
                          ' dúvidas, entre em contato com o suporte da Real Softwares' +
                           LineBreak+LineBreak +msgErroEnvio,0,2,false);
                           Result := false;

                     end;
                end;


         end;

  end
 else
  begin

//    frmPainelAguarde.Memo1.Lines.Clear;
  //  frmPainelAguarde.Memo1.Lines.add('Ocorreu um erro na assinatura na nota. Entre em contato com a Real Softwares');
//    Sleep(3000);
//    frmPainelAguarde.Close;
    Result := false;
  end;

end;


procedure TDM.ativarModoContingenciaOfflineNFCE;
begin
   dm.adicionaLog('Usuario: '+nome_usuario+'  ativou o modo de contingência');
   dm.gravaini('NFCE','formaEmissao','2');
   dm.gravaini('NFCE','forçarContingenciaOffline','1');
   dm.gravaini('NFCE','dataHoraContingencia',DateToStr(date));
   dm.gravaini('NFCE','qtdeEmitidasContingencia',Inttostr(0));
end;


procedure tdm.desativarModoContingenciaOFFlineNFCE();
begin
 dm.adicionaLog('Modo de contingência offline foi desabilitado');
 dm.gravaini('NFCE','forçarContingenciaOffline','0');
 dm.gravaini('NFCE','qtdeEmitidasContingencia',Inttostr(0));

end;




procedure Tdm.AdicionaNFCENaListaDeNotasParaCancelar(modelo : integer);
var
 codNFCE : Largeint;
 q : TIBQuery;
begin

 q :=TIBQuery.Create(self);
 q.Database:=DBRESTAURANTE;
 q.Transaction:=transLog;
 dm.transLog.Active := true;

  try

     adicionaLog('Insere a nota na tabela de NFC-e emitidas');
     codNFCE := StrToInt(geraCodigo('G_NFCE_EMITIDAS',9));
     q.Active := false;
     q.SQL.Clear;
     q.SQL.Add('insert into NFCE_EMITIDAS (codigo,modelo,chave,serie,numero,protocolo,xml_nota) values ('+QuotedStr(IntToStr(codNFCE))+',');
     q.SQL.Add(''+IntToStr(modelo )+',');
     q.SQL.Add(''+Quotedstr(copy(dm.ACBrNFe1.NotasFiscais[0].NFe.infNFe.ID,4,60))+',');
     q.SQL.Add(''+IntToStr(dm.ACBrNFe1.NotasFiscais[0].NFe.Ide.serie)+',');
     q.SQL.Add(''+Inttostr(dm.ACBrNFe1.NotasFiscais[0].NFe.Ide.nNF)+',');
     q.SQL.Add(''+Quotedstr(dm.ACBrNFe1.NotasFiscais[0].NFe.procNFe.nProt )+',');
     q.SQL.Add(''+Quotedstr( dm.ACBrNFe1.NotasFiscais[0].XML )+')');


     adicionaLog('                 '+q.SQL.Text);
     try
      q.ExecSQL;
      dm.transLog.Commit;
     except
        on E : Exception  do
         begin
          adicionaLog('Ocorreu um erro ao adcionar a nota na tabela de NFC-e emitidas');
          adicionaLog('    O erro foi '+E.Message);

        end;
     end;


  finally
    FreeAndNil(q);
    transLog.Active := false;
  end;
end;



procedure Tdm.AtualizaChaveNotaSubstitutaCancelar(chaveParaCancelar : string; chaveNFCESubstituta : string);
var
 codNFCE : Largeint;
 q : TIBQuery;
begin

 q :=TIBQuery.Create(self);
 q.Database:=DBRESTAURANTE;
 q.Transaction:=transLog;
 dm.transLog.Active := true;

  try



     q.Active := false;
     q.SQL.Clear;
     q.SQL.Add('update nfce_emitidas nf set nf.chave_nota_substituta='+Quotedstr(chaveNFCESubstituta)+' where nf.chave='+Quotedstr(chaveParaCancelar));
     adicionaLog('                 '+q.SQL.Text);
     try
      q.ExecSQL;
      dm.transLog.Commit;
     except
        on E : Exception  do
         begin
          adicionaLog('Ocorreu um erro ao atualizar a chave da nota substituta');
          adicionaLog('    O erro foi '+E.Message);

        end;
     end;


  finally
    FreeAndNil(q);
    transLog.Active := false;
  end;
end;




function Tdm.verificaSeUltimaNFCEConstaNasVendas() : Boolean;
var
 chaveUltimaNFCE : string;
begin




  Result := false;
  dm.qryauxiliar.Active := false;
  dm.qryauxiliar.sql.Clear;
  dm.qryauxiliar.sql.Add('select CHAVE_ULTIMA from configuracoes_estacao where numero_caixa='+Quotedstr(numero_caixa));
  dm.qryauxiliar.Active := true;


  if ( dm.qryauxiliar.FieldByName('chave_ultima').Value <> null ) then
   begin
      chaveUltimaNFCE := Trim(dm.qryauxiliar.fieldbyname('chave_ultima').value);

      if (chaveUltimaNFCE <> '') then
        begin
          dm.qryauxiliar.Active := false;
          dm.qryauxiliar.SQL.Clear;
          dm.qryauxiliar.SQL.add('select count(*) as ct from vendas v where v.chave_nfce='+QUotedstr(chaveUltimaNFCE));
          dm.qryauxiliar.Active := true;

          if (dm.qryauxiliar.FieldByName('ct').Value = 0) then
           begin
             adicionaLog('Ultima NFC-e emitida não foi encontrada na tabela de vendas');
             Result := false;
           end

          else
           begin
             adicionaLog('Ultima not foi encontrada na tabela de vendas');
             Result := true;
           end;
        end
      else
       begin
         adicionaLog('Chave da última nota estava vazia!');
         Result := True;

       end;

   end
  else
   begin
    adicionaLog('Campo da última nota estava nulo!');
    Result := True;
   end;


end;




function Tdm.verificaSomaProporcoesPizza() : Boolean;
var
 somaProporcoes : double;
 digitos : SmallInt;
begin

  dm.tbSaboresPizzaTemp.first;
  somaProporcoes := 0;
  digitos :=2;
  while not dm.tbSaboresPizzaTemp.Eof do
   begin
     somaProporcoes := dm.tbSaboresPizzaTempproporcao.Value + somaProporcoes;
     dm.tbSaboresPizzaTemp.Next;
   end;

   somaProporcoes := RoundABNT(somaProporcoes,digitos);
   if (somaProporcoes  <> 1 ) then
    begin
      Result := false;
    end
  else
   begin
     Result := true;
   end;
end;

procedure Tdm.dbrestauranteIdleTimer(Sender: TObject);
begin
  Application.ProcessMessages;
end;


function TDM.inicializarSAT() : boolean;
begin
  with dm.sat do
  begin
    Modelo  := satDinamico_stdcall;
    ArqLOG  := patchAplicacao+'logs\SAT\'+FormatDateTime('YYY',Date)+'_'+FormatDateTime('MM',date)+'_'+FormatDateTime('DD',Date)+'.log';
    NomeDLL := patchAplicacao+'DLL\SAT\TANCA\SAT.DLL';
    Config.ide_numeroCaixa := StrToInt(numero_caixa);


     case StrToInt(dm.LeIni(1,'SAT','ambienteEmissao'))  of
      1: begin
            Config.ide_tpAmb       := taHomologacao;
        end;
      2: begin
            Config.ide_tpAmb       := taProducao;
         end;
     end;

    Config.ide_CNPJ           :=  dm.tb_parametrosCNPJ_SWHOUSE.Value;
    Config.emit_CNPJ          :=  dm.tb_parametrosCNPJ.Value;
    Config.emit_IE            :=  dm.tb_parametrosIE.Value;
    Config.emit_IM            :=  '';


    if simplesNacional  then
      Config.emit_cRegTrib := RTSimplesNacional
    else
    Config.emit_cRegTrib :=RTRegimeNormal;


    Config.emit_cRegTribISSQN :=  RTISSNenhum;
    Config.emit_indRatISSQN   :=  irNao;
    Config.PaginaDeCodigo     :=  0;
    Config.EhUTF8             :=  false;
    Config.infCFe_versaoDadosEnt := StringToFloat('0.07');

//   localArquivoTemporario  := dm.LeIni(2,'NFCE','caminhoArquivosXML')+'\'+FormatDateTime('YYYMM',data_do_sistema  )+'\temp\';
  // localArquivoDefinitivo := dm.LeIni(2,'NFCE','caminhoArquivosXML')+'\'+FormatDateTime('YYYMM',data_do_sistema  )+'\';

    ConfigArquivos.PastaEnvio           :=  dm.LeIni(2,'SAT','caminhoArquivosXML')+'\'+FormatDateTime('YYYMM',data_do_sistema  )+'\temp\';
    ConfigArquivos.PastaCFeVenda        :=  dm.LeIni(2,'SAT','caminhoArquivosXML')+'\'+FormatDateTime('YYYMM',data_do_sistema  )+'';
//    ConfigArquivos.PastaCFeCancelamento :=
    ConfigArquivos.SalvarCFe      := true;
    ConfigArquivos.SalvarCFeCanc  := true;
    ConfigArquivos.SalvarEnvio    := true;
    ConfigArquivos.SepararPorCNPJ := FALSE;
    ConfigArquivos.SepararPorMes  := false;
    CFe.IdentarXML := true;
    CFe.TamanhoIdentacao := 3;
    Inicializado := true;

  end;

end;



function TDM.enviarCupomSat() : boolean;
var
 retornoSat : integer;
 mensagem : string;
begin
   frm_principal.memo_avisos.Lines.Clear;
   frm_principal.Visible := true;
   frm_principal.memo_avisos.Lines.text := dm.sat.CFe.GerarXML(true);
   dm.adicionaLog(frm_principal.memo_avisos.Lines.Text);
   dm.sat.EnviarDadosVenda(frm_principal.memo_avisos.Lines.Text);


  retornoSat := dm.sat.Resposta.codigoDeRetorno;

  case retornoSat of
   6000: begin
           result := true;
         end;

   6001: begin
           mensagem := 'Código de ativação do SAT inválido!';
           result := false;
         end;

   6002: begin
           mensagem := 'SAT ainda não ativado!';
           result := false;
         end;

   6003: begin
           mensagem := 'SAT não vinculado ao AC';
           result := false;
         end;


   6004: begin
           mensagem := 'Vinculação do AC não confere';
           result := false;
         end;

   6005: begin
           mensagem := 'Tamanho do CFe superior a 1500KB';
           result := false;
         end;


   6006: begin
           mensagem := 'SAT bloqueado pelo contribuinte';
           result := false;
         end;


   6007: begin
           mensagem := 'SAT bloqueado pela SEFAZ';
           result := false;
         end;


   6008: begin
           mensagem := ' SAT bloqueado por falta de comunicação';
           result := false;
         end;


   6009: begin
           mensagem := 'SAT bloqueado, código de ativação incorreto';
           result := false;
         end;


   6010: begin
           mensagem := ' Erro de validação do conteúdo';
           result := false;
         end;


   6098: begin
           mensagem := 'SAT em processamento ou desligado. ';
           result := false;
         end;


   6099: begin
           mensagem := 'Erro desconhecido na emissão';
           result := false;
         end;
   end;


   if retornoSat <>  6000 then
     begin
       if dm.painelDePergunta(Mensagem+#13#10+'DESEJA VERIFICAR O LOG DO SAT ?'+#13#10+#13#10,25) then
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
  qupdate :  TIBQuery;

begin

  ts      :=   TIBTransaction.Create(Self);
  ts.Name := RandomName(8);
  ts.DefaultDatabase :=  dm.dbrestaurante;
  ts.Active := false;
  ts.Active := true;


  q:= TIBQuery.create(self);
  q.Database := dbrestaurante;
  q.Transaction := ts;
  q.sql.clear;

  qupdate:= TIBQuery.create(self);
  qupdate.Database := dbrestaurante;
  qupdate.Transaction := ts;
  qupdate.sql.clear;


  q.Active := false;
  q.SQL.Clear;
  q.Active := false;
  q.SQL.clear;
  q.SQL.Add(' delete from nfce_emitidas nf where ');
  q.SQL.Add(' exists (   select *  from vendas  v   ');
  q.SQL.Add('  where v.modelo_comprovante = nf.modelo  ');
  q.SQL.Add('        and v.serie_nfce = nf.serie ');
  q.SQL.Add('        and v.numero_nfce = nf.numero) ');
  dm.adicionaLog(q.SQL.Text);
  q.ExecSQL;

  ts.Commit;
  ts.Active := false;

  q.Active := false;
  q.SQL.Clear;
  q.SQL.Add(' select * from nfce_emitidas nf ');
  q.SQL.Add('   where not exists ( ');
  q.SQL.Add('     select * from vendas v where ');
  q.SQL.Add('      v.modelo_comprovante=nf.modelo and ');
  q.SQL.Add('      v.serie_nfce = nf.serie and ');
  q.SQL.Add('      v.numero_nfce = nf.numero) ');
  q.Active := true;
  q.First;

  while not q.Eof do
   begin
      if ( q.FieldByName('modelo').Value  =2 ) then
       begin
        dm.parametrizaAcbrNFE(moNFCe,false,true);
       end
      else
       begin
         dm.parametrizaAcbrNFE(moNFe,false, true);
       end;

      dm.ACBrNFe1.NotasFiscais.Clear;
      dm.ACBrNFe1.NotasFiscais.LoadFromString(q.FieldByName('xml_nota').Value ,false);


      try
        dm.ACBrNFe1.Consultar;
        qupdate.Active := false;
        qupdate.SQL.Clear;
        qupdate.SQL.add(' update nfce_emitidas nf set ');
        qupdate.sql.add('    v.numero='+Inttostr(dm.ACBrNFe1.NotasFiscais[0].NFe.Ide.nNF));
        qupdate.sql.add('   ,v.chave='+QuotedStr(copy(dm.ACBrNFe1.NotasFiscais[0].NFe.infNFe.ID,4,60)  ));
        qupdate.sql.add('   ,v.protocolo='+QuotedStr(dm.ACBrNFe1.NotasFiscais[0].NFe.procNFe.nProt));
        qupdate.sql.add('   ,v.xml_nota='+QuotedStr(dm.ACBrNFe1.NotasFiscais[0].XML)+',');
        qupdate.sql.add('    v.retorno='+Inttostr(dm.ACBrNFe1.WebServices.Consulta.cStat) );
        qupdate.SQL.Add('  where v.codigo='+Quotedstr(q.FieldByName('codigo').Value));

        dm.adicionaLog('Executa atualização  do XML da NF-e emitida com erro');
        dm.adicionaLog(qupdate.SQL.Text);
        qupdate.ExecSQL;
      except
         on E : Exception  do
           begin
               dm.adicionaLog('NFE : '+q.FieldByName('chave').Value);
               dm.adicionaLog('Verificação de NFCE emitidas. Erro: '+E.Message);
           end
      end;
      q.Next;
   end;
  ts.Commit;



  FreeAndNil(ts);
  FreeAndNil(q);
  FreeAndNil(qupdate);
end;



procedure tdm.inserirXMLNotasDestinadas(xml : string);
var
 caminhoArquivo : string;
 ts: TIBTransaction;
 q: TIBQuery;
begin




  dm.parametrizaAcbrNFE(moNFe,False, true);
  dm.ACBrNFe1.NotasFiscais.LoadFromString(xml,false);

   if dm.ACBrNFe1.NotasFiscais[0].NFe.Dest.CNPJCPF <>  cnpj  then
    begin
      Showmessage('Empresa atual não é o destinatário desta nota!');
      Exit;

    end;


  ts      :=   TIBTransaction.Create(Self);
  ts.Name := RandomName(8);
  ts.DefaultDatabase :=  dm.dbrestaurante;
  ts.Active := false;
  ts.Active := true;


  q:= TIBQuery.create(self);
  q.Database := dbrestaurante;
  q.Transaction := ts;
  q.sql.clear;


  dm.ACBrNFe1.NotasFiscais[0].GravarXML(copy(dm.ACBrNFe1.NotasFiscais[0].NFe.infNFe.ID,4,60)+'-nfe.xml',patchXMLEntradas);
  caminhoArquivo :=patchXMLEntradas+copy(dm.ACBrNFe1.NotasFiscais[0].NFe.infNFe.ID,4,60)+'-nfe.xml';

  ts.Active := true;
  q.SQL.Clear;
  q.Active := false;
  q.sql.Clear;
  q.SQL.Add(' select * from nfe_destinadas nf where nf.chave_nfe='+Quotedstr(copy(dm.ACBrNFe1.NotasFiscais[0].NFe.infNFe.ID,4,60)));
  q.Active := true;
  if q.IsEmpty  then
   begin
      q.Active := false;
      q.sql.clear;
      q.sql.add('insert into NFE_DESTINADAS (chave_nfe,cnpj,ie,nome_fornecedor,data_emissao,numero_nota,status_nfe,tipo_manifestacao,valor_nota,caminho_xml,xml_nota) values (');
      q.sql.add(''+Quotedstr(copy(dm.ACBrNFe1.NotasFiscais[0].NFe.infNFe.ID,4,60))+',');
      q.sql.add(''+Quotedstr(dm.ACBrNFe1.NotasFiscais[0].NFe.Emit.CNPJCPF)+',');
      q.sql.add(''+Quotedstr(dm.ACBrNFe1.NotasFiscais[0].NFe.Emit.IE)+',');
      q.sql.add(''+Quotedstr(UpperCase(dm.ACBrNFe1.NotasFiscais[0].NFe.Emit.xNome))+',');
      q.sql.add(''+Quotedstr(FormatDateTime('DD.MM.YY',dm.ACBrNFe1.NotasFiscais[0].NFe.Ide.dEmi) )+',');
      q.sql.add(''+Quotedstr(FormatFloat('000000000000000', dm.ACBrNFe1.NotasFiscais[0].NFe.Ide.nNF))+',');
      q.sql.add(''+Quotedstr('0')+',');
      q.sql.add(Inttostr(1) +',');
      q.sql.add(''+dm.TrocaVirgPPto(FloatToStr(dm.ACBrNFe1.NotasFiscais[0].NFe.Total.ICMSTot.vNF))+',');
      q.sql.add(''+Quotedstr(caminhoArquivo)+',');
      q.sql.add(''+Quotedstr(dm.ACBrNFe1.NotasFiscais[0].XML)+')');
      dm.adicionaLog(q.SQL.Text);

      try
       q.ExecSQL;
      except
         begin
           Showmessage('Erro ao inserir nota no banco!');
           frm_principal.memo_avisos.Lines.Clear;
           frm_principal.memo_avisos.Lines := q.SQL;
           frm_principal.memo_avisos.Visible := true;
           dm.adicionaLog(q.SQL.text);
           ts.Rollback;
           exit;
         end;
      end;
   end;

   ts.Commit;

 FreeAndNil(ts);
 FreeAndNil(q);
end;





procedure Tdm.configuraImpressoraProducao(numeroImpressora : integer);
begin
  if (dm.ACBrPosPrinter1 <> nil )  then
    begin
      dm.ACBrPosPrinter1.Desativar;
      FreeAndNil(dm.ACBrPosPrinter1);
    end;

 dm.ACBrPosPrinter1 := TACBrPosPrinter.Create(self);

   case (StrToInt(LeIniImpressoes (2,'IMPRESSORA_'+formatFloat('000',numeroImpressora),'marca'))) of
    1:   ACBrPosPrinter1.Modelo := ppEscBematech;
    2:   ACBrPosPrinter1.Modelo := ppEscEpsonP2;
    3:   ACBrPosPrinter1.Modelo := ppEscPosEpson;
    4:   ACBrPosPrinter1.Modelo := ppEscDaruma;
    5:   ACBrPosPrinter1.Modelo := ppEscDiebold;
    6:   ACBrPosPrinter1.Modelo := ppEscVox;
    7:  ACBrPosPrinter1.Modelo := ppTexto;
   end;

     ACBrPosPrinter1.Device.Porta  := LeIniImpressoes(2,'IMPRESSORA_'+formatFloat('000',numeroImpressora),'porta');
     ACBrPosPrinter1.Device.Baud   := StrToInt(LeIniImpressoes(2,'IMPRESSORA_'+formatFloat('000',numeroImpressora),'velocidade'));
     ACBrPosPrinter1.TraduzirTags :=  true;

      case StrToInt(LeIniImpressoes(2,'IMPRESSORA_'+formatFloat('000',numeroImpressora),'paridade')) of
       0:  ACBrPosPrinter1.Device.Parity := pNone;
       1:  ACBrPosPrinter1.Device.Parity := pEven;
       2:  ACBrPosPrinter1.Device.Parity := pMark;
       3:  ACBrPosPrinter1.Device.Parity := pOdd;
       4:  ACBrPosPrinter1.Device.Parity := pSpace;
      end;


      case StrToInt(LeIniImpressoes(2,'IMPRESSORA_'+formatFloat('000',numeroImpressora),'stopBits')) of
       1: ACBrPosPrinter1.Device.Stop := s1;
       2: ACBrPosPrinter1.Device.Stop := s1eMeio;
       3: ACBrPosPrinter1.Device.Stop := s2;
      end;

      case StrToInt(LeIniImpressoes(2,'IMPRESSORA_'+formatFloat('000',numeroImpressora),'fluxo')) of
       0: ACBrPosPrinter1.Device.HandShake := hsNenhum;
       1: ACBrPosPrinter1.Device.HandShake := hsXON_XOFF;
       2: ACBrPosPrinter1.Device.HandShake := hsRTS_CTS;
       3: ACBrPosPrinter1.Device.HandShake := hsDTR_DSR;
      end;


end;



procedure Tdm.imprimeCabecalhoPedido(strComprovante: TStringList; horaPedido: TDateTime; mesa, garcom, guidSeq: string; via: Smallint );
var
 nSeq : string;
 hPedido, hImpressao : string;
begin
   nSeq :=  geraCodigo('G_FILA_IMPRESSAO',5);
   hPedido   := trim(FormatDateTime('DD/MM/YYY HH:MM:SS',horaPedido));
   hImpressao := trim(FormatDateTime('DD/MM/YYY HH:MM:SS',now));

   strComprovante.Clear;
   strComprovante.add('</zera>');
   strComprovante.add('</ce><e>'+nome_fantasia+'</e>');
   strComprovante.add('<n></linha_dupla></N>');
   strComprovante.add('<e>'+PadCenter(nome_fantasia,24,' ')  +'</e>');
   strComprovante.add('<e>'+PadCenter('PEDIDO '+nSeq  ,24,' ')  +'</e>');

   strComprovante.add('<ae><N><e>'+'Mesa: '+mesa+'</e></n></Ae>');
   strComprovante.add('<ae><N><e>'+'VIA: '+IntToStr(via) +'</e></n></Ae>');
   strComprovante.add('</ae></fn>Hora Pedido: '+hPedido+'</Ae>');
   strComprovante.add('</ae></fn>Hora impressão: '+hImpressao+'</Ae>');
   strComprovante.add('</fn>Sequencia: </ae>'+guidSeq+' - (Windows)');
   strComprovante.add('</fn></ae>Garçom: '+garcom);
   strComprovante.add('<n></linha_dupla></N>');
end;


procedure Tdm.imprimePedidoProducao(sequenciaImpressao : string);
var
 qMovtoMesa :  TIBQuery;
 qryImpressoraProducao :  TIBQuery;
 ts: TIBTransaction;
 dataHoraLancamento : TDateTimeField;
 nomeImpressora : string;
 ctLinhasFimCupom : smallint;
 ctViasPedido : smallint;
 qtdeProduto : string;
 descricaoProduto : string;
 strComprovante : TStringList;
begin

 strComprovante := TStringList.Create;

 ts      :=   TIBTransaction.Create(Self);
 ts.Name := RandomName(8);
 ts.DefaultDatabase   :=  dm.dbrestaurante;
 ts.Active := false;
 ts.Active := true;



 qMovtoMesa := TIBQuery.Create(Self);
 qMovtoMesa.Name := 'Movto'+Inttostr(random(8));
 qMovtoMesa.Database :=dbrestaurante;
 qMovtoMesa.Transaction := ts;

 qryImpressoraProducao := TIBQuery.Create(Self);
 qryImpressoraProducao.Name := 'Printer'+Inttostr(random(8));
 qryImpressoraProducao.Database := dbrestaurante;
 qryImpressoraProducao.Transaction := ts;

 try



     qryImpressoraProducao.Active := false;
     qryImpressoraProducao.SQL.Clear;
     qryImpressoraProducao.SQL.Add(' select * from miniprinters mp ');
     qryImpressoraProducao.SQL.Add('    where mp.cod_miniprinter <> '+Quotedstr('001'));
     qryImpressoraProducao.SQL.Add('    order by mp.cod_miniprinter ');
     qryImpressoraProducao.Active := true;


     qryImpressoraProducao.First;


     while not qryImpressoraProducao.eof do
      begin
        for ctViasPedido :=  1 to qryImpressoraProducao.FieldByName('vias').Value  do
         begin
           strComprovante.Clear;
           qMovtoMesa.Active := false;
           qMovtoMesa.SQL.Clear;
           qMovtoMesa.SQL.Add(' select  ');
           qMovtoMesa.SQL.Add('         ms.cod_mesa, p.descricao, ms.quantidade, ms.valor_unitario, ms.id,');
           qMovtoMesa.SQL.Add('        ms.cod_garcon, ms.hora_lancamento,ms.numero_caixa,');
           qMovtoMesa.SQL.Add('         ms.observacoes, ms.tipo_massa,ms.sabores,');
           qMovtoMesa.SQL.Add('        g.apelido as garcom,');
           qMovtoMesa.SQL.Add('        mp.marca, mp.modelo, mp.corta_papel');
           qMovtoMesa.SQL.Add('     from movimento_mesa ms');
           qMovtoMesa.SQL.Add('      inner join produtos p on (p.cod_produto = ms.cod_produto)');
           qMovtoMesa.SQL.Add('      inner join miniprinters  mp on (mp.cod_miniprinter = p.cod_miniprinter)');
           qMovtoMesa.SQL.Add('      inner join garcons g on (g.cod_garcon = ms.cod_garcon)');
           qMovtoMesa.SQL.Add('        where ms.seq_impressao = '+Quotedstr(sequenciaImpressao));
           qMovtoMesa.SQL.add(' and p.cod_miniprinter='+Quotedstr(qryImpressoraProducao.FieldByName('cod_miniprinter').Value));
           qMovtoMesa.Active := true;
           qMovtoMesa.First;

             if (qMovtoMesa.IsEmpty = false ) then
              begin
                 imprimeCabecalhoPedido(strComprovante,
                                        qMovtoMesa.fieldbyname('hora_lancamento').AsDateTime  ,
                                        qMovtoMesa.fieldbyname('cod_mesa').value,
                                        qMovtoMesa.fieldbyname('garcom').value,
                                        sequenciaImpressao,ctViasPedido);

                 while not qMovtoMesa.Eof  do
                  begin
                    if ( Frac(qMovtoMesa.FieldByName('quantidade').Value) > 0 ) then
                      qtdeProduto := FormatFloat('#0.000',qMovtoMesa.FieldByName('quantidade').Value )
                    else
                        qtdeProduto := Inttostr(StrToInt(qMovtoMesa.FieldByName('quantidade').AsString));

                    strComprovante.add('<n><e></ae>'+qtdeProduto+'  '+'</ad>'+qMovtoMesa.FieldByName('descricao').value+
                                       '</e></N><C> (id: '+qMovtoMesa.FieldByName('id').asstring +')</C>');
                    if (trim(qMovtoMesa.FieldByName('sabores').value) <> '') then
                     begin
                       strComprovante.Add('**SABOR(ES):');
                       strComprovante.add('<e></ae>'+qMovtoMesa.FieldByName('SABORES').value+'</e>');
                       strComprovante.Add('**');
                     end;

                    if (trim(qMovtoMesa.FieldByName('observacoes').value) <> '') then
                     begin
                       strComprovante.Add('** Observações:');
                       strComprovante.add('<e></ae>'+qMovtoMesa.FieldByName('observacoes').value+'</e>');
                     end;

                    strComprovante.Add('</linha_simples>');
                    qMovtoMesa.Next;
                  end;



                 for ctLinhasFimCupom := 1 to  StrToInt(LeIniImpressoes(2, 'IMPRESSORA_'+formatFloat('000'
                                  ,qryImpressoraProducao.fieldbyname('cod_miniprinter').value) ,'linhasAposCupom')) do
                 begin
                    strComprovante.add (' ');
                 end;

                 strComprovante.add('</corte_parcial>');

                 configuraImpressoraProducao( qryImpressoraProducao.fieldbyname('cod_miniprinter').value);

                 imprimeTextoACBR(strComprovante);
                           {
                 configuraImpressoraNaoFiscal();
                 imprimeTextoACBR(strComprovante);
                            }

                 adicionaLog(strComprovante.Text);
    //             imprimeTextoACBR(strComprovante)
              end;





         end;
       qryImpressoraProducao.Next;
      end;


      try
        qMovtoMesa.active := false;
        qMovtoMesa.SQL.Clear;
        qMovtoMesa.SQL.Add('update movimento_mesa ms set ms.impresso=1 where ms.seq_impressao='+Quotedstr(sequenciaImpressao));
        dm.adicionaLog(qMovtoMesa.SQL.Text);
        qMovtoMesa.ExecSQL;
       except
        begin
          ShowMessage('Erro ao atualizar flag de impressão!');
        end;

      end;
 finally
  ts.Commit;
  strComprovante.Clear;
  qryImpressoraProducao.Active := false;
  qryMiniPrinters.Active := false;
  FreeAndNil(qMovtoMesa);
  FreeAndNil(qryImpressoraProducao);
  FreeAndNil(ts);
  FreeAndNil(strComprovante);
 end;


end;





procedure Tdm.imprimeCancelamentoPedidoProducao(codEstorno : string);
var
 qMovtoMesa :  TIBQuery;
 ts: TIBTransaction;
 dataHoraLancamento : TDateTimeField;
 nomeImpressora : string;
 ct : smallint;
 qtdeProduto : string;
 descricaoProduto : string;
 strComprovante : TStringList;
begin

 strComprovante := TStringList.Create;

 ts      :=   TIBTransaction.Create(Self);
 ts.Name := RandomName(8);
 ts.DefaultDatabase   :=  dm.dbrestaurante;
 ts.Active := false;
 ts.Active := true;



 qMovtoMesa := TIBQuery.Create(Self);
 qMovtoMesa.Name := 'Movto'+RandomName(8);
 qMovtoMesa.Database :=dbrestaurante;
 qMovtoMesa.Transaction := ts;

 try
   strComprovante.Clear;
   qMovtoMesa.Active := false;
   qMovtoMesa.SQL.Clear;
   qMovtoMesa.SQL.Add('  select et.codigo, et.mesa, et.id, ');
   qMovtoMesa.SQL.Add('         et.descricaomotivo, et.quantidade,');
   qMovtoMesa.SQL.Add('         et.nome_usuario_autorizou,');
   qMovtoMesa.SQL.Add('         et.cod_caixa, et.hora, et.obs,');
   qMovtoMesa.SQL.Add('         p.descricao, p.cod_miniprinter');
   qMovtoMesa.SQL.Add('          from estornos et');
   qMovtoMesa.SQL.Add('          inner join produtos p on (p.cod_barras = et.cod_produto)');
   qMovtoMesa.SQL.Add('           where p.cod_miniprinter <> '+QuotedStr('001'));
   qMovtoMesa.SQL.Add('           and et.codigo='+QuotedStr(codEstorno));
   dm.adicionaLog(qMovtoMesa.SQL.Text);
   qMovtoMesa.Active := true;
   qMovtoMesa.First;

   if  (qMovtoMesa.IsEmpty = false)  then
    begin
       strComprovante.Clear;
       strComprovante.add('</zera>');
       strComprovante.add('<n></linha_dupla></N>');
       strComprovante.add('<e>'+PadCenter(nome_fantasia,24,' ')  +'</e>');
       strComprovante.add('<e><in>'+PadCenter('CANCELAR PRODUÇÃO',24,' ')  +'</in></e>');
       strComprovante.add('<e><in>'+PadCenter('Estorno nº '+codEstorno,24,' ')  +'</in></e>');
       strComprovante.add('<ae><N><e><in>'+'Mesa: '+qMovtoMesa.FieldByName('mesa').Value+'</in></e></n></Ae>');
       strComprovante.add('</ae></fn>Hora: '+trim(FormatDateTime('DD/MM/YYY HH:MM:SS',now)+'</Ae>'));
       strComprovante.add('</fn></ae>Caixa Nº: '+ultimoCaixaAberto);
       strComprovante.add('</fn></ae>Usurio logado: '+nome_usuario  );
       strComprovante.add('</fn></ae>Autorizado por:: '+qMovtoMesa.FieldByName('nome_usuario_autorizou').Value  );
       strComprovante.add('</fn></ae>Motivo: '+qMovtoMesa.FieldByName('descricaomotivo').Value  );
       strComprovante.add('<n></linha_dupla></N>');

        if ( Frac(qMovtoMesa.FieldByName('quantidade').Value) > 0 ) then
          qtdeProduto := FormatFloat('#0.000',qMovtoMesa.FieldByName('quantidade').Value )
        else
            qtdeProduto := Inttostr(StrToInt(qMovtoMesa.FieldByName('quantidade').AsString));

        strComprovante.add('<n><e></ae>'+qtdeProduto+'  '+'</ad>'+qMovtoMesa.FieldByName('descricao').value+
                           '</e></N><C> (id: '+qMovtoMesa.FieldByName('id').asstring +')</C>');

        if (trim(qMovtoMesa.FieldByName('obs').value) <> '') then
         begin
           strComprovante.Add('** Observações:');
           strComprovante.add('<e></ae>'+qMovtoMesa.FieldByName('obs').value+'</e>');
         end;

        strComprovante.Add('</linha_simples>');



         for ct:= 1 to  StrToInt(LeIniImpressoes(2, 'IMPRESSORA_'+formatFloat('000'
                          ,qMovtoMesa.fieldbyname('cod_miniprinter').value) ,'linhasAposCupom')) do
         begin
            strComprovante.add (' ');
         end;
      strComprovante.add('</corte_parcial>');



       adicionaLog(strComprovante.Text);

       configuraImpressoraProducao( qMovtoMesa.fieldbyname('cod_miniprinter').value);
       imprimeTextoACBR(strComprovante);
       strComprovante.Clear;
    end;
 finally
  FreeAndNil(qMovtoMesa);
  FreeAndNil(ts);
  FreeAndNil(strComprovante);
 end;

end;






procedure Tdm.ImprimePreContaMesa(mesa : string ; pessoas : smallint);
var
  terminal, garcom : string;
  tempoAtendimento : string;
  codProduto : string;
  descricaoProduto : string;
  quantidade : string;
  valorUnitario,total : string;
  totalConta : string;
  consumo,valorPago,servico,valorRestante,faltaPagar  : string;
  valorPorPessoa : string;
  ct : smallint;
  qryAux : TIBQuery;
  qryProdutosPreConta : TIBQuery;
  qryRodapePreConta   : TIBQuery;
  ts     : TIBTransaction;
  strPreConta : TStringList;


begin

 strPreConta := TStringList.Create;

 ts      :=   TIBTransaction.Create(Self);
 ts.Name := RandomName(8);
 ts.DefaultDatabase   :=  dm.dbrestaurante;
 ts.Active := false;
 ts.Active := true;



 qryAux := TIBQuery.Create(Self);
 qryAux.Name := 'Movto'+Inttostr(random(8));
 qryAux.Database :=dbrestaurante;
 qryAux.Transaction := ts;

 qryProdutosPreConta := TIBQuery.Create(Self);
 qryProdutosPreConta.Name := 'prod'+Inttostr(random(8));
 qryProdutosPreConta.Database :=dbrestaurante;
 qryProdutosPreConta.Transaction := ts;

 qryRodapePreConta := TIBQuery.Create(Self);
 qryRodapePreConta.Name := 'rodaPe'+Inttostr(random(8));
 qryRodapePreConta.Database :=dbrestaurante;
 qryRodapePreConta.Transaction := ts;

 try
   terminal := numero_caixa;
   qryAux.Active := false;
   qryAux.SQL.Clear;
   qryAux.SQL.Add(' delete from extratos_emitidos e where e.mesa='+Quotedstr(mesa));
   qryAux.ExecSQL;

   qryAux.Active := false;
   qryAux.sql.Clear;
   qryAux.SQL.Add('  update or insert into informacoes_mesa (mesa,hora,cod_usuario,qtd_pessoas) values (');
   qryAux.SQL.Add(''+Quotedstr(mesa)+',');
   qryAux.SQL.Add('current_time,');
   qryAux.SQL.Add(''+Quotedstr('001')+',');
   qryAux.SQL.Add(''+Inttostr(pessoas)+')');
   qryAux.ExecSQL;

   adicionaLog('Insere ou atualiza a quantidade de pessoas na mesa');
   adicionaLog(qryAux.SQL.Text);





   qryAux.Active := false;
   qryAux.sql.Clear;


   qryAux.SQL.Add('  insert into extratos_emitidos (mesa, valor_desconto, valor_couvert, ');
   qryAux.SQL.Add('                                 valor_servico,data,hora_emissao, cod_usuario,');
   qryAux.SQL.Add('                                 tipo_desconto,cooextrato,cerextrato,ecf_extrato)');
   qryAux.SQL.Add('        select mesa_saida,0,0,r.valortxserv,current_date, current_time,');
   qryAux.SQL.Add('               '+Quotedstr('001')+', 1,'+Quotedstr('')+','+Quotedstr('')+','+Quotedstr(''));
   qryAux.SQL.Add('   from rodapeextrato2('+Quotedstr(mesa)+' ,0)  r');
   qryAux.ExecSQL;


   qryProdutosPreConta.Active := false;
   qryProdutosPreConta.SQL.Clear;
   qryProdutosPreConta.SQL.Add(' select pr.cod_barras,   pr.descricao,    mv.valor_unitario, ');
   qryProdutosPreConta.SQL.Add('        sum(mv.quantidade) as quantidade, ');
   qryProdutosPreConta.SQL.Add('        sum( udf_roundabnt((mv.valor_unitario * mv.quantidade),2))   as total ');
   qryProdutosPreConta.SQL.Add('             from movimento_mesa mv ');
   qryProdutosPreConta.SQL.Add('             inner join produtos pr on (pr.cod_produto=mv.cod_produto) ');
   qryProdutosPreConta.SQL.Add('           where   mv.cod_mesa='+Quotedstr(mesa));
   qryProdutosPreConta.SQL.Add('        group by  pr.cod_barras,pr.descricao, mv.valor_unitario ');
   qryProdutosPreConta.Active := true;
   qryProdutosPreConta.FetchAll;

   qryRodapePreConta .Active := false;
   qryRodapePreConta.SQL.Clear;
   qryRodapePreConta.SQL.Add('select * from rodapeextrato2('+Quotedstr(mesa)+',0) r ');
   qryRodapePreConta.Active := true;

   consumo       :=  FormatFloat('R$ ###,###,##0.00', qryRodapePreConta.FieldByName('valorbruto').Value);
   servico       :=  FormatFloat('R$ ###,###,##0.00', qryRodapePreConta.FieldByName('valortxserv').Value);
   valorPago     :=  FormatFloat('R$ ###,###,##0.00', qryRodapePreConta.FieldByName('valorPago').Value);
   valorRestante :=  FormatFloat('R$ ###,###,##0.00', qryRodapePreConta.FieldByName('valorrestante').Value);
   valorPorPessoa := valorRestante;


   if pessoas > 1  then

   if (pessoas) > 1  then
    valorPorPessoa :=  FormatFloat('R$ ###,###,##0.00',  RoundABNT  ( (qryRodapePreConta.FieldByName('valorrestante').Value  / (pessoas)),5));



   totalConta    :=  FormatFloat('R$ ###,###,##0.00', qryRodapePreConta.FieldByName('valortotal').Value);




   strPreconta.Clear;
   strPreconta.add('</zera>>');
   strPreconta.add('</linha_dupla>');
   strPreconta.add('<e><n>'+PadCenter(nome_fantasia,24,' ')  +'</n></e>');
   strPreconta.add('<e>'+PadCenter('Pré-conta',24,' ')  +'</e>');
   strPreconta.add('</linha_dupla>');
   strPreconta.add('<e>Mesa: '+mesa+' </e>');
   strPreconta.add(FormatDateTime('DD/MM/YYY',date)+' '+FormatDateTime('HH:MM:SS',time));
   strPreconta.add('Caixa Nº: '+ultimoCaixaAberto );
   strPreconta.add('Operador: '+nome_usuario);
   strPreconta.add('Garçom que abriu: '+qryRodapePreConta.FieldByName('nome_garcon_abriu').Value);
   strPreconta.add('Tempo de atendimento: '+qryRodapePreConta.FieldByName('tempo_permanencia').Value);

   strPreconta.add('</linha_simples>');
   strPreconta.add ('<n>' + PadRight('Cód.',7,' ')+PadRight('Descrição',41)+'</n>' );
   strPreconta.add ('<n>' + PadRight('Qtde.',14,' ') + PadLeft('Vl Unitário',15)+PadLeft('Total',19)+'</n>' );
   strPreconta.add('</linha_simples>');

   qryProdutosPreConta.First;
   while not qryProdutosPreConta.Eof  do
    begin
       codProduto := qryProdutosPreConta.FieldByName('COD_BARRAS').Value;
       descricaoProduto := qryProdutosPreConta.FieldByName('descricao').Value;
       valorUnitario :=  FormatFloat('R$ ###,###,##0.00', qryProdutosPreConta.FieldByName('valor_unitario').Value);
       if frac( qryProdutosPreConta.FieldByName('quantidade').Value) >0  then
         quantidade := FormatFloat('#0.000', qryProdutosPreConta.FieldByName('quantidade').Value)
       else
         quantidade := IntToStr(qryProdutosPreConta.FieldByName('quantidade').Value);

       total         := FormatFloat('R$ ###,###,##0.00', qryProdutosPreConta.FieldByName('total').Value);

       strPreconta.add ( PadRight(codProduto ,7,' ')+PadRight(descricaoProduto,41) );
       strPreconta.add ( PadRight(quantidade,14,' ')+PadLeft(valorUnitario,15)+PadLeft(total,19) );
       qryProdutosPreConta.Next;
    end;


   strPreconta.add('</linha_simples>');
   strPreconta.add ( PadRight(' Consumo:',20)+PadLeft(consumo  ,28) );
   strPreconta.add ( PadRight(' + '+dm.LeIni(2,'extrato','descricaoTaxaServico')+':',20)+PadLeft(servico   ,28) );

   if qryRodapePreConta.FieldByName('valorPago').Value > 0 then
    begin
      strPreconta.add ('<n>'+ PadRight(' - Já foi pago:',20)+PadLeft(valorPago  ,28) );
       strPreconta.add('</linha_simples>');
      strPreconta.add ('<e>'+PadRight('Falta pagar:',12)+PadLeft(valorRestante  ,12)+'</e>' );
    end
   else
    begin
      strPreconta.add('</linha_simples>');
      strPreconta.add ('<e>'+PadRight('Total:',7)+PadLeft(totalConta ,17)+'</e>' );
    end;

    if (pessoas) > 1  then
     begin
      strPreconta.add ('<e>'+PadRight('Pessoas:',9)+PadLeft(Inttostr(pessoas)   ,12)+'</e>' );
      strPreconta.add ('<e>'+PadRight('Por Pessoa:',12)+PadLeft(valorPorPessoa,12)+'</e>' );

     end;



    if (StrToInt(LeIni(2,'extrato','msgPromocional')) = 1) then
     begin
       strPreconta.add (' ');
       strPreconta.add('</linha_simples>');
       for ct:= 1 to  StrToInt(LeIni(2,'extrato','qtdLinhasMsgPromocional')) do
        begin
         strPreconta.Add(PadCenter(LeIni(2,'extrato','msgPromocionalLinha'+IntToStr(ct)),48,' '));
        end;
     end;



   for ct:= 1 to  StrToInt(LeIni(2,'IMPRESSORA_NAO_FISCAL_01','linhasAposCupom')) do
   begin
    strPreconta.add (' ');
   end;

   strPreconta.add('</corte_parcial>');

   try
    ts.Commit;
   except
    begin
      showmessage('Erro ao commitar transação de impressão!');
    end;
   end;


   dm.adicionaLog(strPreConta.Text);
   configuraImpressoraNaoFiscal();
   imprimeTextoACBR(strPreconta);

 finally
   qryAux.Active := false;
   qryProdutosPreConta.Active := false;
   qryRodapePreConta.Active := false;
   FreeAndNil (qryAux);
   FreeAndNil(qryProdutosPreConta);
   FreeAndNil(qryRodapePreConta);
   FreeAndNil(ts);
   FreeAndNil(strPreConta);
 end;



end;



end.

