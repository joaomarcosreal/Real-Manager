unit realrest_DfmCheck_Unit;

interface

implementation

uses
  uu_data_module,
  uu_frm_principal,
  uu_cs_produtos,
  uu_transferir_item,
  uu_transferir_mesa,
  uu_cs_grupos_estoque,
  uu_cad_usuarios,
  uu_centro_custo,
  uu_cs_c_custo,
  uu_encerramento,
  uu_extrato,
  uu_troca_senha,
  uu_caixa_restaurante,
  uu_confirma_encerramento,
  uu_modelo,
  uu_modelo_consultas,
  uu_cs_fornecedores,
  uu_cs_usuarios,
  uu_modelo_rel_datas,
  uu_manutencao_grupos,
  UU_DM_RELATORIOS,
  uu_cad_contas,
  uu_cad_historico,
  uu_cs_historicos,
  uu_modelo_Vazio,
  uu_cancela_item_restaurante,
  uu_cs_tipos_operacao,
  uu_cad_fornecedor,
  uu_cs_cidades,
  uu_cs_grupos_fornecedores,
  uu_cs_grupos,
  uu_cs_item_estoque,
  uu_cs_unidades,
  uu_cad_garcons,
  uu_cs_garcons,
  uu_cad_grupos,
  uu_cs_formas_pagto,
  uu_cad_clientes,
  uu_cs_tipos_cliente,
  uu_cs_clientes,
  uu_cad_tipo_cliente,
  uu_pagamento_faturado,
  uu_cs_mini_printer,
  uu_obs_lancamento_caixa,
  uuEntradasAvulsas,
  uu_cs_tipos_documentos,
  uu_cs_tipos_entrada,
  uu_cs_entradas,
  uu_cs_aliquotas,
  uuCadUnidades,
  uuSelecaoSabores,
  uu_transferencia_estoque_para_pontodevenda,
  uu_consulta_faturas,
  uu_dm_consultas,
  uu_cs_clientes_reduzido,
  uu_clientes_na_casa,
  uuLiberarCliente,
  uuAberturaCaixa,
  uuFechamentoCaixa,
  uu_cad_clientes_delivery,
  uuPesquisaClientesDelivery,
  uuPrincipalDelivery,
  Sobre,
  uuSelecaoCouvert,
  uuPedidoDelivery,
  uuExpedicaoDelivery,
  uSelecionaGrupo,
  uuCadBairros,
  uuRelRakingProdutos,
  uuRelAniversariantes,
  uuRelConsumoClientesNaCasa,
  uuRelConferenciaCaixa,
  uuCadMotivoCancelamento,
  uuCadTiposSangria,
  uuCsTiposSangria,
  uuSangria,
  uuRelatorioPedidosDelivery,
  uuRelContatoEstrategicoDelivery,
  uuLogTouch,
  uuRegistroSistema,
  uuParabensRegistro,
  uuSistemaBloqueado,
  uuAvisoExpiracao,
  uuLicenca,
  uuCsMotivosEstorno,
  uuCadObservacoesPreparo,
  uuCsObservacoesPreparo,
  uuCadTiposBaixaEstoque,
  uuCsTiposBaixaEstoque,
  uuDmRelatorios,
  uu_listagem_fornecedores,
  uu_relatorio_estoque,
  uu_rel_compras_por_fornecedor,
  uu_rel_compras_por_grupo,
  uu_rel_compras_por_Item,
  uuRelatorioCaixa,
  uuCsCFOP,
  uuCsModeloNotaFiscal,
  uuCsCST,
  uu_rel_producao_Garcons,
  uuRelFaturamento,
  uuCsBairros,
  uuSelecaoSaboresPizza,
  uuSelecaoTamanhoPizza,
  uuDadosCartaoCredito,
  uuGerarSpedFiscal,
  uuCadEntregadores,
  uuCsEntregradores,
  uuRelPedidosPorEntregador,
  uuCadObservacaoClienteDelivery,
  uuControleCartoes,
  uuTransformacaoSubmateria,
  uucsSubmaterias,
  uuRelClientesBoateData,
  uuRelatorioBaixasManuais,
  uuRelatorioEstoqueReposicao,
  uuCadSaboresPizza,
  uucsSaboresPizza,
  uuPesqTipoItemSped,
  uuCsNCM,
  uuCsGeneroItemSPED,
  uuCsProdutosGeral,
  uuIdentificaClienteECF,
  uu_frm_pergunta,
  uuCadCidade,
  uu_cs_estados,
  uuCadNotasConsumidor,
  uuRelNotasVendaConsumidor,
  uuCadNotasTransportadora,
  uuCsPlanoContas,
  uuRelNotasFrete,
  uuCsNotasSaida,
  uu_rel_notas_saida_fornecedor,
  uuFrmTroco,
  uuCsCSTPISCofins,
  uuRelFaturasAbertasPorFaturamento,
  uuRelFaturasAbertasPorVencimento,
  uRelFaturasAbertasDetalhada,
  uu_recebimentos_parciais,
  uuContasPagarEntradas,
  uuLancamentoContasAPagar,
  uuRelProducaoGarconsSintetico,
  uuRelTaxaServico,
  uuManutencaoContasApagar,
  uuCsLojas,
  uuLeituraBarrasPesoRestaurante,
  uuBaixaTitulosContasApagar,
  uuDesconto,
  uuOperacoesCaixa,
  uUSuprimentoExtra,
  uuQtdePessoas,
  uuCsDepartamentos,
  uuBaixaContasAssinadas,
  uuRecebimentoContaAssinada,
  uuCadPromoter,
  uuCsPromoters,
  uuCsSituacaoDocumento,
  uuCadGruposTouch,
  uuCsGruposTouch,
  uuCapturaXMLNFE,
  uuRelRankingProdutos,
  uuCadItemFornecedorEntrada,
  uuPainelAguarde,
  uuSenhaGarcon,
  uuLeCartaoLancamento,
  uuRelEstatisticoPeriodo,
  frm_modelo_rel_datasa,
  uuCadGruposObservacao,
  uuAuditoriaCartoes,
  uuRelResCaixaTurno,
  uu_entradas,
  uuFrenteCaixa,
  uuCancelaItemPDV,
  uuProjecaoVendas,
  uuRelApuracaoGrupos,
  uuObsManifestacao,
  uuComparaProdutosNFE,
  uListagemProdutos,
  uuConsultaGruposRD,
  uuAssociaProdutoFornecedor,
  uuGerarEtiquetas,
  uuLancamentosRD,
  uuSaidasNotaFiscal,
  uuEnvioContingencia,
  uuDisponibilidadeVenda,
  uuDigitaPesoManualmente,
  uuLancamentosSalao,
  uuExportaXMLNFCE,
  uuListagemLancamentosRD,
  uuCancelamentoNFCEChave,
  uuMensagemTEF,
  uuRelProdutosCSTPIS,
  uuRelAuditoriaPedidos,
  uuReimpressaoDanfeNFCE,
  uuRelLancamentosNotas,
  uuEmissaoNFEEncerramento,
  uuRelItensRDGrupo,
  uuFrmInutilizacoesNFCE,
  uuRelProdutosVariosPeriodos,
  uuConfNFCEEmitidas,
  uuExportaXMLEntradas,
  uuRelCancelamentoProdutos,
  uuConsultaInfSat,
  uuDmVendas,
  uuCancelaNFCEChave,
  uuDMPedidoDelivery,
  uuDMCadProdutos,
  uuRelRankingClientesDelivery,
  uuMensagemExpiracaoCertificado,
  uuRelComprasRefCruzada,
  uufrmCartaCorrecao,
  uuInventario,
  uuDMInventarios,
  uuControleInventarios,
  uuDmControleInventarios,
  uuExtratoDiversasMesas,
  uuGeraArquivoBalanca,
  uuDMFrenteCaixa,
  uuDMExpedicaoDelivery,
  uuDmFrenteCaixaRestaurante,
  uuFrmRelRepasseEntregadores,
  uuParametrosSistema,
  uuControleBaixas,
  uuBaixasManuais,
  uuRelSangrias,
  uuFrmErrosInutilizacao,
  uuDMRelMovimentacoesEstoque,
  uuDmManifestacaoNFE,
  uuFrmIntegracoesBairro,
  uuDmIntegracoes,
  uuFrmReajusteSaboresPizza,
  uuListagemTabelasPreco,
  uuRelFaturamentoPorOperador,
  uuRelCurvaABCProdutosVendidos,
  uuFrmEmail,
  uuRelCurvaABCProdutosComprados,
  uuDmConsultaProdutosEstoque,
  uuRelFichasTecnicas,
  uuRelFaturamentoComparativoMensal,
  uuSelecionaAdquirente,
  uuAuditoriaCaixas,
  uuProducaoSubProdutos,
  uuRelRecebimentosCartoes,
  uu_rel_produtosPeriodo,
  uufrmTestes,
  uuDMProducaoSubprodutos,
  uuDmAtualizaBase,
  uuDMAuditoriaCaixa,
  uuFrmGruposAdicionais,
  uuDMGruposAdicionais,
  uuTestes,
  uu_produtos,
  uuDmCadUnidadesMedida,
  uuDMDRE,
  uuDRE,
  uuRelDREComparativo,
  uuRealDialog,
  SysUtils;

procedure TestDfmFormConsistency;
begin
{ dm: Tdm }
  with Tdm(nil) do { uu_data_module.pas }
  begin
    dbrestaurante.ClassName; { dbrestaurante: TIBDatabase; }
    transacao.ClassName; { transacao: TIBTransaction; }
    qryauxiliar.ClassName; { qryauxiliar: TIBQuery; }
    dsqryauxiliar.ClassName; { dsqryauxiliar: TDataSource; }
    qrymax.ClassName; { qrymax: TIBQuery; }
    qryauxiliar2.ClassName; { qryauxiliar2: TIBQuery; }
    dsqryauxiliar2.ClassName; { dsqryauxiliar2: TDataSource; }
    qryauxiliar3.ClassName; { qryauxiliar3: TIBQuery; }
    composicoes_temp.ClassName; { composicoes_temp: TRxMemoryData; }
    composicoes_tempdes_unidade.ClassName; { composicoes_tempdes_unidade: TStringField; }
    composicoes_tempdescricao_item.ClassName; { composicoes_tempdescricao_item: TStringField; }
    composicoes_tempdescricao_c_custo.ClassName; { composicoes_tempdescricao_c_custo: TStringField; }
    composicoes_tempcod_produto.ClassName; { composicoes_tempcod_produto: TStringField; }
    composicoes_tempcod_item.ClassName; { composicoes_tempcod_item: TStringField; }
    composicoes_tempcod_c_custo.ClassName; { composicoes_tempcod_c_custo: TStringField; }
    composicoes_tempUnidade.ClassName; { composicoes_tempUnidade: TStringField; }
    composicoes_tempquantidade.ClassName; { composicoes_tempquantidade: TFloatField; }
    ds_composicoes_temp.ClassName; { ds_composicoes_temp: TDataSource; }
    qry_consultas.ClassName; { qry_consultas: TIBQuery; }
    ds_qry_consultas.ClassName; { ds_qry_consultas: TDataSource; }
    modulos_temp.ClassName; { modulos_temp: TRxMemoryData; }
    modulos_tempcod_modulo.ClassName; { modulos_tempcod_modulo: TStringField; }
    modulos_tempcod_mod.ClassName; { modulos_tempcod_mod: TStringField; }
    modulos_tempdescricao.ClassName; { modulos_tempdescricao: TStringField; }
    modulos_temppermite.ClassName; { modulos_temppermite: TIntegerField; }
    submodulos_temp.ClassName; { submodulos_temp: TRxMemoryData; }
    submodulos_tempcod_modulo.ClassName; { submodulos_tempcod_modulo: TStringField; }
    submodulos_tempcod_mod.ClassName; { submodulos_tempcod_mod: TStringField; }
    submodulos_tempdescricao.ClassName; { submodulos_tempdescricao: TStringField; }
    submodulos_temppermite.ClassName; { submodulos_temppermite: TIntegerField; }
    dsqryauxiliar3.ClassName; { dsqryauxiliar3: TDataSource; }
    tb_usuarios.ClassName; { tb_usuarios: TIBTable; }
    dsusuarios.ClassName; { dsusuarios: TDataSource; }
    ac_recebimentos_temp.ClassName; { ac_recebimentos_temp: TRxMemoryData; }
    ac_recebimentos_tempcod_forma.ClassName; { ac_recebimentos_tempcod_forma: TStringField; }
    ac_recebimentos_tempDescricao.ClassName; { ac_recebimentos_tempDescricao: TStringField; }
    ac_recebimentos_tempvalor.ClassName; { ac_recebimentos_tempvalor: TFloatField; }
    transRemota.ClassName; { transRemota: TIBTransaction; }
    gastos_temp.ClassName; { gastos_temp: TRxMemoryData; }
    gastos_tempcodigo_item.ClassName; { gastos_tempcodigo_item: TStringField; }
    gastos_tempqtde.ClassName; { gastos_tempqtde: TFloatField; }
    gastos_tempdescricao.ClassName; { gastos_tempdescricao: TStringField; }
    gastos_tempunidade.ClassName; { gastos_tempunidade: TStringField; }
    gastos_tempcusto_unitario.ClassName; { gastos_tempcusto_unitario: TFloatField; }
    ds_gastos_temp.ClassName; { ds_gastos_temp: TDataSource; }
    ds_tabmemoria.ClassName; { ds_tabmemoria: TDataSource; }
    ds_acompanhamentos_temp.ClassName; { ds_acompanhamentos_temp: TDataSource; }
    proc_abate_estoque.ClassName; { proc_abate_estoque: TIBStoredProc; }
    ds_tb_parametros.ClassName; { ds_tb_parametros: TDataSource; }
    transLog.ClassName; { transLog: TIBTransaction; }
    qry_itens_estoque.ClassName; { qry_itens_estoque: TIBQuery; }
    qry_itens_estoqueCOD_ITEM.ClassName; { qry_itens_estoqueCOD_ITEM: TIBStringField; }
    qry_itens_estoqueDESCRICAO_ITEM.ClassName; { qry_itens_estoqueDESCRICAO_ITEM: TIBStringField; }
    qry_itens_estoqueDATA_CADASTRO.ClassName; { qry_itens_estoqueDATA_CADASTRO: TDateField; }
    qry_itens_estoqueDATA_ULTIMA_REPOSICAO.ClassName; { qry_itens_estoqueDATA_ULTIMA_REPOSICAO: TDateField; }
    qry_itens_estoqueVALOR_CUSTO.ClassName; { qry_itens_estoqueVALOR_CUSTO: TIBBCDField; }
    qry_itens_estoqueQUANTIDADE_MAXIMA.ClassName; { qry_itens_estoqueQUANTIDADE_MAXIMA: TIBBCDField; }
    qry_itens_estoqueQUANTIDADE_MINIMA.ClassName; { qry_itens_estoqueQUANTIDADE_MINIMA: TIBBCDField; }
    qry_itens_estoqueESTOQUE_LIQUIDO.ClassName; { qry_itens_estoqueESTOQUE_LIQUIDO: TIBBCDField; }
    qry_itens_estoqueUNIDADE_ENTRADA.ClassName; { qry_itens_estoqueUNIDADE_ENTRADA: TIBStringField; }
    qry_itens_estoqueCOD_UNIDADE_FRACAO.ClassName; { qry_itens_estoqueCOD_UNIDADE_FRACAO: TIBStringField; }
    qry_itens_estoqueBARRAS.ClassName; { qry_itens_estoqueBARRAS: TIBStringField; }
    qry_itens_estoquePRODUTO_FINAL.ClassName; { qry_itens_estoquePRODUTO_FINAL: TIBStringField; }
    qry_itens_estoqueCOD_GRUPO.ClassName; { qry_itens_estoqueCOD_GRUPO: TIBStringField; }
    qry_itens_estoqueCFOP.ClassName; { qry_itens_estoqueCFOP: TIBStringField; }
    qry_itens_estoqueCST.ClassName; { qry_itens_estoqueCST: TIBStringField; }
    qry_itens_estoqueDESC_GRUPO.ClassName; { qry_itens_estoqueDESC_GRUPO: TIBStringField; }
    qry_itens_estoqueDESC_UNIDADE.ClassName; { qry_itens_estoqueDESC_UNIDADE: TIBStringField; }
    qry_itens_estoquePARAMETRO.ClassName; { qry_itens_estoquePARAMETRO: TIBBCDField; }
    qry_itens_estoqueESTOQUE.ClassName; { qry_itens_estoqueESTOQUE: TFloatField; }
    qry_itens_estoqueDESCUNIDADEFRACAO.ClassName; { qry_itens_estoqueDESCUNIDADEFRACAO: TIBStringField; }
    qry_itens_estoqueDESCRICAOCFOP.ClassName; { qry_itens_estoqueDESCRICAOCFOP: TIBStringField; }
    qry_itens_estoqueDESCRICAOCST.ClassName; { qry_itens_estoqueDESCRICAOCST: TIBStringField; }
    qry_itens_estoqueSIGLA_NOTA.ClassName; { qry_itens_estoqueSIGLA_NOTA: TIBStringField; }
    qry_itens_estoqueSUBMATERIA.ClassName; { qry_itens_estoqueSUBMATERIA: TSmallintField; }
    ds_qry_itens_estoque.ClassName; { ds_qry_itens_estoque: TDataSource; }
    upd_itens_estoque.ClassName; { upd_itens_estoque: TIBUpdateSQL; }
    qry_lanc_caixa.ClassName; { qry_lanc_caixa: TIBQuery; }
    qry_fornecedores.ClassName; { qry_fornecedores: TIBQuery; }
    qry_fornecedoresCOD_FORNECEDOR.ClassName; { qry_fornecedoresCOD_FORNECEDOR: TIBStringField; }
    qry_fornecedoresBAIRRO.ClassName; { qry_fornecedoresBAIRRO: TIBStringField; }
    qry_fornecedoresCEP.ClassName; { qry_fornecedoresCEP: TIBStringField; }
    qry_fornecedoresTELEFONE.ClassName; { qry_fornecedoresTELEFONE: TIBStringField; }
    qry_fornecedoresFAX.ClassName; { qry_fornecedoresFAX: TIBStringField; }
    qry_fornecedoresEMAIL.ClassName; { qry_fornecedoresEMAIL: TIBStringField; }
    qry_fornecedoresATUALIZA_CUSTO.ClassName; { qry_fornecedoresATUALIZA_CUSTO: TSmallintField; }
    qry_fornecedoresCGC_CPF.ClassName; { qry_fornecedoresCGC_CPF: TIBStringField; }
    qry_fornecedoresINSCRICAO_ESTADUAL.ClassName; { qry_fornecedoresINSCRICAO_ESTADUAL: TIBStringField; }
    qry_fornecedoresCODIGO_REPRESENTANTE.ClassName; { qry_fornecedoresCODIGO_REPRESENTANTE: TIntegerField; }
    qry_fornecedoresOBSERVACAO.ClassName; { qry_fornecedoresOBSERVACAO: TIBStringField; }
    qry_fornecedoresDATA_CADASTRO.ClassName; { qry_fornecedoresDATA_CADASTRO: TDateField; }
    qry_fornecedoresDATA_ULTIMA_COMPRA.ClassName; { qry_fornecedoresDATA_ULTIMA_COMPRA: TDateField; }
    qry_fornecedoresCONTATO.ClassName; { qry_fornecedoresCONTATO: TIBStringField; }
    qry_fornecedoresCOD_ESTADO.ClassName; { qry_fornecedoresCOD_ESTADO: TIBStringField; }
    qry_fornecedoresINSCRICAO_MUNICIPAL.ClassName; { qry_fornecedoresINSCRICAO_MUNICIPAL: TIBStringField; }
    qry_fornecedoresCOD_CIDADE.ClassName; { qry_fornecedoresCOD_CIDADE: TIBStringField; }
    qry_fornecedoresNOME_CIDADE.ClassName; { qry_fornecedoresNOME_CIDADE: TIBStringField; }
    qry_fornecedoresNOMEESTADO.ClassName; { qry_fornecedoresNOMEESTADO: TIBStringField; }
    qry_fornecedoresRAZAO_SOCIAL.ClassName; { qry_fornecedoresRAZAO_SOCIAL: TIBStringField; }
    qry_fornecedoresNOME_FANTASIA.ClassName; { qry_fornecedoresNOME_FANTASIA: TIBStringField; }
    qry_fornecedoresNUM_ENDERECO.ClassName; { qry_fornecedoresNUM_ENDERECO: TIBStringField; }
    qry_fornecedoresCOMPLEMENTO.ClassName; { qry_fornecedoresCOMPLEMENTO: TIBStringField; }
    qry_fornecedoresENDERECO.ClassName; { qry_fornecedoresENDERECO: TIBStringField; }
    qry_fornecedoresCOD_PAIS.ClassName; { qry_fornecedoresCOD_PAIS: TIBStringField; }
    ds_qry_fornecedores.ClassName; { ds_qry_fornecedores: TDataSource; }
    upd_fornecedores.ClassName; { upd_fornecedores: TIBUpdateSQL; }
    qry_historicos_caixa.ClassName; { qry_historicos_caixa: TIBQuery; }
    qry_historicos_caixaCOD_HISTORICO.ClassName; { qry_historicos_caixaCOD_HISTORICO: TIBStringField; }
    qry_historicos_caixaDESCRICAO.ClassName; { qry_historicos_caixaDESCRICAO: TIBStringField; }
    qry_historicos_caixaDATA_CADASTRO.ClassName; { qry_historicos_caixaDATA_CADASTRO: TDateField; }
    ds_qry_historicos_caixa.ClassName; { ds_qry_historicos_caixa: TDataSource; }
    upd_historicos_caixa.ClassName; { upd_historicos_caixa: TIBUpdateSQL; }
    qry_grupos.ClassName; { qry_grupos: TIBQuery; }
    qry_gruposCOD_GRUPO.ClassName; { qry_gruposCOD_GRUPO: TIBStringField; }
    qry_gruposDESCRICAO.ClassName; { qry_gruposDESCRICAO: TIBStringField; }
    qry_gruposRESULTADO_RD.ClassName; { qry_gruposRESULTADO_RD: TSmallintField; }
    qry_gruposPERC_PROJ_RD.ClassName; { qry_gruposPERC_PROJ_RD: TIBBCDField; }
    qry_gruposMOSTRA_NO_RD.ClassName; { qry_gruposMOSTRA_NO_RD: TSmallintField; }
    upd_grupos.ClassName; { upd_grupos: TIBUpdateSQL; }
    ds_qry_grupos.ClassName; { ds_qry_grupos: TDataSource; }
    ds_qry_garcons.ClassName; { ds_qry_garcons: TDataSource; }
    qry_garcons.ClassName; { qry_garcons: TIBQuery; }
    qry_garconsCOD_GARCON.ClassName; { qry_garconsCOD_GARCON: TIBStringField; }
    qry_garconsAPELIDO.ClassName; { qry_garconsAPELIDO: TIBStringField; }
    qry_garconsMETRE.ClassName; { qry_garconsMETRE: TSmallintField; }
    qry_garconsCOD_METRE.ClassName; { qry_garconsCOD_METRE: TIBStringField; }
    qry_garconsAPELIDO1.ClassName; { qry_garconsAPELIDO1: TIBStringField; }
    up_qry_garcons.ClassName; { up_qry_garcons: TIBUpdateSQL; }
    qry_formas_pagto.ClassName; { qry_formas_pagto: TIBQuery; }
    qry_formas_pagtoCOD_FORMA.ClassName; { qry_formas_pagtoCOD_FORMA: TIBStringField; }
    qry_formas_pagtoDESCRICAO.ClassName; { qry_formas_pagtoDESCRICAO: TIBStringField; }
    qry_formas_pagtoRP.ClassName; { qry_formas_pagtoRP: TSmallintField; }
    qry_formas_pagtoTIPO.ClassName; { qry_formas_pagtoTIPO: TSmallintField; }
    qry_formas_pagtoPERMITE_TROCO.ClassName; { qry_formas_pagtoPERMITE_TROCO: TSmallintField; }
    upd_formas_pagto.ClassName; { upd_formas_pagto: TIBUpdateSQL; }
    ds_qry_formas_pagto.ClassName; { ds_qry_formas_pagto: TDataSource; }
    qry_tipos_cli.ClassName; { qry_tipos_cli: TIBQuery; }
    qry_tipos_cliCOD_TIPO.ClassName; { qry_tipos_cliCOD_TIPO: TIBStringField; }
    qry_tipos_cliDESCRICAO.ClassName; { qry_tipos_cliDESCRICAO: TIBStringField; }
    qry_tipos_cliPRAZO.ClassName; { qry_tipos_cliPRAZO: TIntegerField; }
    upd_tipos_cli.ClassName; { upd_tipos_cli: TIBUpdateSQL; }
    ds_clientes.ClassName; { ds_clientes: TDataSource; }
    qry_clientes.ClassName; { qry_clientes: TIBQuery; }
    qry_clientesCOD_CLI.ClassName; { qry_clientesCOD_CLI: TIBStringField; }
    qry_clientesRAZAO_SOCIAL.ClassName; { qry_clientesRAZAO_SOCIAL: TIBStringField; }
    qry_clientesNOME_FANTASIA.ClassName; { qry_clientesNOME_FANTASIA: TIBStringField; }
    qry_clientesENDERECO.ClassName; { qry_clientesENDERECO: TIBStringField; }
    qry_clientesBAIRRO.ClassName; { qry_clientesBAIRRO: TIBStringField; }
    qry_clientesCEP.ClassName; { qry_clientesCEP: TIBStringField; }
    qry_clientesTELEFONE.ClassName; { qry_clientesTELEFONE: TIBStringField; }
    qry_clientesFAX.ClassName; { qry_clientesFAX: TIBStringField; }
    qry_clientesEMAIL.ClassName; { qry_clientesEMAIL: TIBStringField; }
    qry_clientesCOD_TIPO.ClassName; { qry_clientesCOD_TIPO: TIBStringField; }
    qry_clientesATUALIZA_CUSTO.ClassName; { qry_clientesATUALIZA_CUSTO: TSmallintField; }
    qry_clientesCGC_CPF.ClassName; { qry_clientesCGC_CPF: TIBStringField; }
    qry_clientesINSCRICAO_ESTADUAL.ClassName; { qry_clientesINSCRICAO_ESTADUAL: TIBStringField; }
    qry_clientesINSCRICAO_MUNICIPAL.ClassName; { qry_clientesINSCRICAO_MUNICIPAL: TIBStringField; }
    qry_clientesOBSERVACAO.ClassName; { qry_clientesOBSERVACAO: TIBStringField; }
    qry_clientesDATA_CADASTRO.ClassName; { qry_clientesDATA_CADASTRO: TDateField; }
    qry_clientesDATA_ULTIMA_COMPRA.ClassName; { qry_clientesDATA_ULTIMA_COMPRA: TDateField; }
    qry_clientesSITUACAO.ClassName; { qry_clientesSITUACAO: TSmallintField; }
    qry_clientesCREDITO.ClassName; { qry_clientesCREDITO: TIBBCDField; }
    qry_clientesPRAZO_PAGAMENTO.ClassName; { qry_clientesPRAZO_PAGAMENTO: TIntegerField; }
    qry_clientesDTNASCIMENTO.ClassName; { qry_clientesDTNASCIMENTO: TDateField; }
    qry_clientesRG.ClassName; { qry_clientesRG: TIBStringField; }
    qry_clientesCARTAO.ClassName; { qry_clientesCARTAO: TIBStringField; }
    upd_clientes.ClassName; { upd_clientes: TIBUpdateSQL; }
    ds_tipos_cli.ClassName; { ds_tipos_cli: TDataSource; }
    qry_faturas.ClassName; { qry_faturas: TIBQuery; }
    qry_faturasCOD_FATURA.ClassName; { qry_faturasCOD_FATURA: TIBStringField; }
    qry_faturasCOD_CLI.ClassName; { qry_faturasCOD_CLI: TIBStringField; }
    qry_faturasDATA_FATURA.ClassName; { qry_faturasDATA_FATURA: TDateField; }
    qry_faturasDATA_VENCIMENTO.ClassName; { qry_faturasDATA_VENCIMENTO: TDateField; }
    qry_faturasDATA_PAGAMENTO.ClassName; { qry_faturasDATA_PAGAMENTO: TDateField; }
    qry_faturasVALOR_FATURA.ClassName; { qry_faturasVALOR_FATURA: TIBBCDField; }
    qry_faturasVALOR_PAGO.ClassName; { qry_faturasVALOR_PAGO: TIBBCDField; }
    qry_faturasCOD_USUARIO_INCLUSAO.ClassName; { qry_faturasCOD_USUARIO_INCLUSAO: TIBStringField; }
    qry_faturasCOD_USUARIO_BAIXA.ClassName; { qry_faturasCOD_USUARIO_BAIXA: TIBStringField; }
    qry_faturasSTATUS.ClassName; { qry_faturasSTATUS: TSmallintField; }
    qry_faturasCOD_VENDA.ClassName; { qry_faturasCOD_VENDA: TIBStringField; }
    qry_faturasOBSERVACAO.ClassName; { qry_faturasOBSERVACAO: TIBStringField; }
    qry_faturasRAZAO_SOCIAL.ClassName; { qry_faturasRAZAO_SOCIAL: TIBStringField; }
    qry_faturasUSUARIO_INCLUSAO.ClassName; { qry_faturasUSUARIO_INCLUSAO: TIBStringField; }
    qry_faturasUSUARIO_BAIXA.ClassName; { qry_faturasUSUARIO_BAIXA: TIBStringField; }
    qry_faturasSELECAO.ClassName; { qry_faturasSELECAO: TSmallintField; }
    upd_faturas.ClassName; { upd_faturas: TIBUpdateSQL; }
    qry_remota2.ClassName; { qry_remota2: TIBQuery; }
    qry_importacoes.ClassName; { qry_importacoes: TIBQuery; }
    qry_remota.ClassName; { qry_remota: TIBQuery; }
    tbComprasTemp.ClassName; { tbComprasTemp: TRxMemoryData; }
    tbComprasTempcodigo.ClassName; { tbComprasTempcodigo: TStringField; }
    tbComprasTempdescricao.ClassName; { tbComprasTempdescricao: TStringField; }
    tbComprasTempquantidade.ClassName; { tbComprasTempquantidade: TFloatField; }
    tbComprasTempcodUnidade.ClassName; { tbComprasTempcodUnidade: TStringField; }
    tbComprasTempsiglaUnidade.ClassName; { tbComprasTempsiglaUnidade: TStringField; }
    tbComprasTemppreco.ClassName; { tbComprasTemppreco: TCurrencyField; }
    tbComprasTempCST.ClassName; { tbComprasTempCST: TStringField; }
    tbComprasTempCFOP.ClassName; { tbComprasTempCFOP: TStringField; }
    tbComprasTempdesconto.ClassName; { tbComprasTempdesconto: TCurrencyField; }
    tbComprasTempoutrasDespAcessorias.ClassName; { tbComprasTempoutrasDespAcessorias: TCurrencyField; }
    tbComprasTempbaseICMS.ClassName; { tbComprasTempbaseICMS: TCurrencyField; }
    tbComprasTempvalorICMS.ClassName; { tbComprasTempvalorICMS: TCurrencyField; }
    tbComprasTempbaseICMSST.ClassName; { tbComprasTempbaseICMSST: TCurrencyField; }
    tbComprasTempvalorICMSST.ClassName; { tbComprasTempvalorICMSST: TCurrencyField; }
    tbComprasTempvalorIPI.ClassName; { tbComprasTempvalorIPI: TCurrencyField; }
    tbComprasTempaliquotaIPI.ClassName; { tbComprasTempaliquotaIPI: TFloatField; }
    tbComprasTempaliquotaICMS.ClassName; { tbComprasTempaliquotaICMS: TFloatField; }
    tbComprasTempdescUnidade.ClassName; { tbComprasTempdescUnidade: TStringField; }
    tbComprasTempparamUnidade.ClassName; { tbComprasTempparamUnidade: TFloatField; }
    tbComprasTempordem.ClassName; { tbComprasTempordem: TStringField; }
    tbComprasTemptotal.ClassName; { tbComprasTemptotal: TCurrencyField; }
    tbComprasTempvalorFrete.ClassName; { tbComprasTempvalorFrete: TCurrencyField; }
    tbComprasTempvalorSeguro.ClassName; { tbComprasTempvalorSeguro: TCurrencyField; }
    tbComprasTempvalorFCP.ClassName; { tbComprasTempvalorFCP: TCurrencyField; }
    tbComprasTempvalorFCPST.ClassName; { tbComprasTempvalorFCPST: TCurrencyField; }
    tbComprasTempvalorImpostoImportacao.ClassName; { tbComprasTempvalorImpostoImportacao: TCurrencyField; }
    tbComprasTempValorCustoReal.ClassName; { tbComprasTempValorCustoReal: TCurrencyField; }
    dsComprasTemp.ClassName; { dsComprasTemp: TDataSource; }
    qry_entradas.ClassName; { qry_entradas: TIBQuery; }
    qry_entradasCOD_ENTRADA.ClassName; { qry_entradasCOD_ENTRADA: TIBStringField; }
    qry_entradasCOD_FORNECEDOR.ClassName; { qry_entradasCOD_FORNECEDOR: TIBStringField; }
    qry_entradasCOD_USUARIO.ClassName; { qry_entradasCOD_USUARIO: TIBStringField; }
    qry_entradasQTDE_ITENS.ClassName; { qry_entradasQTDE_ITENS: TSmallintField; }
    qry_entradasDATA.ClassName; { qry_entradasDATA: TDateField; }
    qry_entradasHORA.ClassName; { qry_entradasHORA: TTimeField; }
    qry_entradasNOME_USUARIO_ENTRADA.ClassName; { qry_entradasNOME_USUARIO_ENTRADA: TIBStringField; }
    qry_entradasDATA_EMISSAO.ClassName; { qry_entradasDATA_EMISSAO: TDateField; }
    qry_entradasDATA_ENTRADA.ClassName; { qry_entradasDATA_ENTRADA: TDateField; }
    qry_entradasNUMERO_NOTA.ClassName; { qry_entradasNUMERO_NOTA: TIBStringField; }
    qry_entradasSERIE_NOTA.ClassName; { qry_entradasSERIE_NOTA: TIBStringField; }
    qry_entradasMODELO_NOTA.ClassName; { qry_entradasMODELO_NOTA: TIBStringField; }
    qry_entradasBASE_ICMS.ClassName; { qry_entradasBASE_ICMS: TIBBCDField; }
    qry_entradasVALOR_ICMS.ClassName; { qry_entradasVALOR_ICMS: TIBBCDField; }
    qry_entradasBASE_ICMS_SUBST.ClassName; { qry_entradasBASE_ICMS_SUBST: TIBBCDField; }
    qry_entradasVALOR_ICMS_SUBST.ClassName; { qry_entradasVALOR_ICMS_SUBST: TIBBCDField; }
    qry_entradasVALOR_PRODUTOS.ClassName; { qry_entradasVALOR_PRODUTOS: TIBBCDField; }
    qry_entradasFRETE.ClassName; { qry_entradasFRETE: TIBBCDField; }
    qry_entradasSEGURO.ClassName; { qry_entradasSEGURO: TIBBCDField; }
    qry_entradasDESCONTO.ClassName; { qry_entradasDESCONTO: TIBBCDField; }
    qry_entradasOUTRAS_DESPESAS.ClassName; { qry_entradasOUTRAS_DESPESAS: TIBBCDField; }
    qry_entradasVALOR_IPI.ClassName; { qry_entradasVALOR_IPI: TIBBCDField; }
    qry_entradasTOTAL_NOTA.ClassName; { qry_entradasTOTAL_NOTA: TIBBCDField; }
    qry_entradasMES_REF_CONTABIL.ClassName; { qry_entradasMES_REF_CONTABIL: TIBStringField; }
    qry_entradasCOD_EMP_GRUPO.ClassName; { qry_entradasCOD_EMP_GRUPO: TIBStringField; }
    qry_entradasCHAVE_NFE.ClassName; { qry_entradasCHAVE_NFE: TIBStringField; }
    qry_entradasTIPO_ENTRADA.ClassName; { qry_entradasTIPO_ENTRADA: TSmallintField; }
    qry_entradasINFORMACOES_COMPLEMENTARES.ClassName; { qry_entradasINFORMACOES_COMPLEMENTARES: TIBStringField; }
    qry_entradasINFORMACOES_FISCO.ClassName; { qry_entradasINFORMACOES_FISCO: TIBStringField; }
    qry_entradasXRAZAOSOCIAL.ClassName; { qry_entradasXRAZAOSOCIAL: TIBStringField; }
    qry_entradasXCNPJ.ClassName; { qry_entradasXCNPJ: TIBStringField; }
    qry_entradasXINSCRICAOESTADUAL.ClassName; { qry_entradasXINSCRICAOESTADUAL: TIBStringField; }
    qry_entradasXNOMECIDADE.ClassName; { qry_entradasXNOMECIDADE: TIBStringField; }
    qry_entradasXUF.ClassName; { qry_entradasXUF: TIBStringField; }
    qry_entradasXMODELONOTA.ClassName; { qry_entradasXMODELONOTA: TIBStringField; }
    qry_entradasXDESCRICAOLOJA.ClassName; { qry_entradasXDESCRICAOLOJA: TIBStringField; }
    qry_entradasCOD_EMPRESA.ClassName; { qry_entradasCOD_EMPRESA: TIBStringField; }
    ds_entradas.ClassName; { ds_entradas: TDataSource; }
    upd_entradas.ClassName; { upd_entradas: TIBUpdateSQL; }
    qryReceitas.ClassName; { qryReceitas: TIBQuery; }
    qryReceitasCOD_RECEITA.ClassName; { qryReceitasCOD_RECEITA: TIBStringField; }
    qryReceitasCOD_GRUPO_RECEITA.ClassName; { qryReceitasCOD_GRUPO_RECEITA: TIBStringField; }
    qryReceitasDESCRICAO.ClassName; { qryReceitasDESCRICAO: TIBStringField; }
    qryReceitasPESSOAS.ClassName; { qryReceitasPESSOAS: TSmallintField; }
    qryReceitasPESO.ClassName; { qryReceitasPESO: TIBBCDField; }
    qryReceitasCALORIAS.ClassName; { qryReceitasCALORIAS: TIBBCDField; }
    qryReceitasPROTEINAS.ClassName; { qryReceitasPROTEINAS: TIBBCDField; }
    qryReceitasCARBOIDRATOS.ClassName; { qryReceitasCARBOIDRATOS: TIBBCDField; }
    qryReceitasPREPARO.ClassName; { qryReceitasPREPARO: TIBStringField; }
    qryReceitasDESCRICAO_GRUPO.ClassName; { qryReceitasDESCRICAO_GRUPO: TIBStringField; }
    dsQryReceitas.ClassName; { dsQryReceitas: TDataSource; }
    updQryReceitas.ClassName; { updQryReceitas: TIBUpdateSQL; }
    tbReceitasTemp.ClassName; { tbReceitasTemp: TRxMemoryData; }
    tbReceitasTempcodigoItem.ClassName; { tbReceitasTempcodigoItem: TStringField; }
    tbReceitasTempdescricaoItem.ClassName; { tbReceitasTempdescricaoItem: TStringField; }
    tbReceitasTempcodUnidade.ClassName; { tbReceitasTempcodUnidade: TStringField; }
    tbReceitasTempquantidade.ClassName; { tbReceitasTempquantidade: TFloatField; }
    tbReceitasTempdescricaoUnidade.ClassName; { tbReceitasTempdescricaoUnidade: TStringField; }
    dsReceitasTemp.ClassName; { dsReceitasTemp: TDataSource; }
    lack.ClassName; { lack: TIBQuery; }
    lackCOD_REG.ClassName; { lackCOD_REG: TIBStringField; }
    lackDATA.ClassName; { lackDATA: TDateField; }
    lackVALOR_ACUMULADO.ClassName; { lackVALOR_ACUMULADO: TIBBCDField; }
    lackALIQUOTA.ClassName; { lackALIQUOTA: TIBStringField; }
    lackNUM_SERIE.ClassName; { lackNUM_SERIE: TIBStringField; }
    dsQryReg60A.ClassName; { dsQryReg60A: TDataSource; }
    updQryReg60A.ClassName; { updQryReg60A: TIBUpdateSQL; }
    qryAliquotas.ClassName; { qryAliquotas: TIBQuery; }
    qryAliquotasCOD_ALIQUOTA.ClassName; { qryAliquotasCOD_ALIQUOTA: TIBStringField; }
    qryAliquotasDESCRICAO.ClassName; { qryAliquotasDESCRICAO: TIBStringField; }
    qryAliquotasPARAMETRO.ClassName; { qryAliquotasPARAMETRO: TIBStringField; }
    qryAliquotasSINTEGRA.ClassName; { qryAliquotasSINTEGRA: TIBStringField; }
    qryAliquotasPARAMETRO1.ClassName; { qryAliquotasPARAMETRO1: TIBStringField; }
    qryAliquotasPARAMETRO2.ClassName; { qryAliquotasPARAMETRO2: TIBStringField; }
    qryAliquotasPARAMETRO3.ClassName; { qryAliquotasPARAMETRO3: TIBStringField; }
    qryAliquotasPARAMETRO4.ClassName; { qryAliquotasPARAMETRO4: TIBStringField; }
    qryAliquotasPERCENTAGEM.ClassName; { qryAliquotasPERCENTAGEM: TIBStringField; }
    updQryAliquotas.ClassName; { updQryAliquotas: TIBUpdateSQL; }
    dsQryAliquotas.ClassName; { dsQryAliquotas: TDataSource; }
    qryECFS.ClassName; { qryECFS: TIBQuery; }
    qryECFSCOD_ECF.ClassName; { qryECFSCOD_ECF: TIBStringField; }
    qryECFSNUM_SERIE.ClassName; { qryECFSNUM_SERIE: TIBStringField; }
    qryECFSNUMORDEM.ClassName; { qryECFSNUMORDEM: TIBStringField; }
    qryECFSDESCRICAO.ClassName; { qryECFSDESCRICAO: TIBStringField; }
    updQryECFS.ClassName; { updQryECFS: TIBUpdateSQL; }
    dsQryECFS.ClassName; { dsQryECFS: TDataSource; }
    transacaoProcedure.ClassName; { transacaoProcedure: TIBTransaction; }
    updQryReg60M.ClassName; { updQryReg60M: TIBUpdateSQL; }
    qryUnidades.ClassName; { qryUnidades: TIBQuery; }
    qryUnidadesCOD_UNIDADE.ClassName; { qryUnidadesCOD_UNIDADE: TIBStringField; }
    qryUnidadesDESCRICAO.ClassName; { qryUnidadesDESCRICAO: TIBStringField; }
    qryUnidadesSIGLA.ClassName; { qryUnidadesSIGLA: TIBStringField; }
    qryUnidadesPARAMETRO.ClassName; { qryUnidadesPARAMETRO: TIBBCDField; }
    qryUnidadesCOD_PADRAO.ClassName; { qryUnidadesCOD_PADRAO: TIBStringField; }
    qryUnidadesDESCRICAOUNIDADEPADRAO.ClassName; { qryUnidadesDESCRICAOUNIDADEPADRAO: TIBStringField; }
    dsQryUnidades.ClassName; { dsQryUnidades: TDataSource; }
    updQryUnidades.ClassName; { updQryUnidades: TIBUpdateSQL; }
    qryTrasnferenciasEstoque.ClassName; { qryTrasnferenciasEstoque: TIBQuery; }
    dsTrasnferenciasEstoque.ClassName; { dsTrasnferenciasEstoque: TDataSource; }
    updTrasnferenciasEstoque.ClassName; { updTrasnferenciasEstoque: TIBUpdateSQL; }
    qryConsultaFaturas.ClassName; { qryConsultaFaturas: TIBQuery; }
    qryConsultaFaturasCOD_FATURA.ClassName; { qryConsultaFaturasCOD_FATURA: TIBStringField; }
    qryConsultaFaturasCOD_CLI.ClassName; { qryConsultaFaturasCOD_CLI: TIBStringField; }
    qryConsultaFaturasDATA_FATURA.ClassName; { qryConsultaFaturasDATA_FATURA: TDateField; }
    qryConsultaFaturasDATA_VENCIMENTO.ClassName; { qryConsultaFaturasDATA_VENCIMENTO: TDateField; }
    qryConsultaFaturasDATA_PAGAMENTO.ClassName; { qryConsultaFaturasDATA_PAGAMENTO: TDateField; }
    qryConsultaFaturasVALOR_FATURA.ClassName; { qryConsultaFaturasVALOR_FATURA: TIBBCDField; }
    qryConsultaFaturasVALOR_PAGO.ClassName; { qryConsultaFaturasVALOR_PAGO: TIBBCDField; }
    qryConsultaFaturasSTATUS.ClassName; { qryConsultaFaturasSTATUS: TSmallintField; }
    qryConsultaFaturasCOD_VENDA.ClassName; { qryConsultaFaturasCOD_VENDA: TIBStringField; }
    qryConsultaFaturasSELECAO.ClassName; { qryConsultaFaturasSELECAO: TSmallintField; }
    qryConsultaFaturasUSUARIO_INCLUSAO.ClassName; { qryConsultaFaturasUSUARIO_INCLUSAO: TIBStringField; }
    qryConsultaFaturasHORA.ClassName; { qryConsultaFaturasHORA: TTimeField; }
    qryConsultaFaturasOBSERVACAO.ClassName; { qryConsultaFaturasOBSERVACAO: TIBStringField; }
    qryConsultaFaturasCODIGOVENDA.ClassName; { qryConsultaFaturasCODIGOVENDA: TIBStringField; }
    updQryConsultaFaturas.ClassName; { updQryConsultaFaturas: TIBUpdateSQL; }
    dsQryConsultaFaturas.ClassName; { dsQryConsultaFaturas: TDataSource; }
    ds_qry_faturas.ClassName; { ds_qry_faturas: TDataSource; }
    qryTotaisFaturas.ClassName; { qryTotaisFaturas: TIBQuery; }
    dsQryTotaisFaturas.ClassName; { dsQryTotaisFaturas: TDataSource; }
    dsCheckin.ClassName; { dsCheckin: TDataSource; }
    updQryCheckin.ClassName; { updQryCheckin: TIBUpdateSQL; }
    qryClientesNaCasa.ClassName; { qryClientesNaCasa: TIBQuery; }
    qryClientesNaCasaCOD_CARTAO.ClassName; { qryClientesNaCasaCOD_CARTAO: TIBStringField; }
    qryClientesNaCasaRAZAO_SOCIAL.ClassName; { qryClientesNaCasaRAZAO_SOCIAL: TIBStringField; }
    dsQryClientesNaCasa.ClassName; { dsQryClientesNaCasa: TDataSource; }
    transacaoAuxiliar.ClassName; { transacaoAuxiliar: TIBTransaction; }
    procProcessaCaixa.ClassName; { procProcessaCaixa: TIBStoredProc; }
    qryClientesDelivery.ClassName; { qryClientesDelivery: TIBQuery; }
    qryClientesDeliveryCODIGO.ClassName; { qryClientesDeliveryCODIGO: TIBStringField; }
    qryClientesDeliveryNOME.ClassName; { qryClientesDeliveryNOME: TIBStringField; }
    qryClientesDeliveryTELEFONE.ClassName; { qryClientesDeliveryTELEFONE: TIBStringField; }
    qryClientesDeliverySEXO.ClassName; { qryClientesDeliverySEXO: TIBStringField; }
    qryClientesDeliveryENDERECO.ClassName; { qryClientesDeliveryENDERECO: TIBStringField; }
    qryClientesDeliveryCOD_BAIRRO.ClassName; { qryClientesDeliveryCOD_BAIRRO: TIntegerField; }
    qryClientesDeliveryFREQ_COMPRA.ClassName; { qryClientesDeliveryFREQ_COMPRA: TIntegerField; }
    qryClientesDeliveryULTIMO_PEDIDO.ClassName; { qryClientesDeliveryULTIMO_PEDIDO: TIBStringField; }
    qryClientesDeliveryDT_NASCIMENTO.ClassName; { qryClientesDeliveryDT_NASCIMENTO: TDateField; }
    qryClientesDeliveryEMAIL.ClassName; { qryClientesDeliveryEMAIL: TIBStringField; }
    qryClientesDeliveryCELULAR.ClassName; { qryClientesDeliveryCELULAR: TIBStringField; }
    qryClientesDeliveryDESCRICAOBAIRRO.ClassName; { qryClientesDeliveryDESCRICAOBAIRRO: TIBStringField; }
    qryClientesDeliveryCOMPLEMENTO.ClassName; { qryClientesDeliveryCOMPLEMENTO: TIBStringField; }
    qryClientesDeliveryREFERENCIA1.ClassName; { qryClientesDeliveryREFERENCIA1: TIBStringField; }
    qryClientesDeliveryREFERENCIA2.ClassName; { qryClientesDeliveryREFERENCIA2: TIBStringField; }
    qryClientesDeliveryDATA_CADASTRO.ClassName; { qryClientesDeliveryDATA_CADASTRO: TDateField; }
    dsQryClientesDelivery.ClassName; { dsQryClientesDelivery: TDataSource; }
    updClientesDelivery.ClassName; { updClientesDelivery: TIBUpdateSQL; }
    qryBairro.ClassName; { qryBairro: TIBQuery; }
    updQryBairro.ClassName; { updQryBairro: TIBUpdateSQL; }
    dsQryBairro.ClassName; { dsQryBairro: TDataSource; }
    qryProdutos.ClassName; { qryProdutos: TIBQuery; }
    dsQryProdutos.ClassName; { dsQryProdutos: TDataSource; }
    qryConferenciaCaixa.ClassName; { qryConferenciaCaixa: TIBQuery; }
    dsQryConferenciaCaixa.ClassName; { dsQryConferenciaCaixa: TDataSource; }
    qryTiposSangria.ClassName; { qryTiposSangria: TIBQuery; }
    qryTiposSangriaCODIGO.ClassName; { qryTiposSangriaCODIGO: TIBStringField; }
    qryTiposSangriaDESCRICAO.ClassName; { qryTiposSangriaDESCRICAO: TIBStringField; }
    upQryTiposSangria.ClassName; { upQryTiposSangria: TIBUpdateSQL; }
    dsQryTiposSangria.ClassName; { dsQryTiposSangria: TDataSource; }
    qryMotivosEstorno.ClassName; { qryMotivosEstorno: TIBQuery; }
    qryMotivosEstornoCODIGO.ClassName; { qryMotivosEstornoCODIGO: TIBStringField; }
    qryMotivosEstornoDESCRICAO.ClassName; { qryMotivosEstornoDESCRICAO: TIBStringField; }
    dsQryMotivosEstorno.ClassName; { dsQryMotivosEstorno: TDataSource; }
    updQryMovtivosEstornos.ClassName; { updQryMovtivosEstornos: TIBUpdateSQL; }
    qryObservacoesPreparo.ClassName; { qryObservacoesPreparo: TIBQuery; }
    qryObservacoesPreparoCOD_OBS.ClassName; { qryObservacoesPreparoCOD_OBS: TIBStringField; }
    qryObservacoesPreparoDESCRICAO.ClassName; { qryObservacoesPreparoDESCRICAO: TIBStringField; }
    dsQryObservacoesPreparo.ClassName; { dsQryObservacoesPreparo: TDataSource; }
    updQryObservacoesPreparo.ClassName; { updQryObservacoesPreparo: TIBUpdateSQL; }
    qryTiposBaixaEstoque.ClassName; { qryTiposBaixaEstoque: TIBQuery; }
    qryTiposBaixaEstoqueCOD_TIPO.ClassName; { qryTiposBaixaEstoqueCOD_TIPO: TIBStringField; }
    qryTiposBaixaEstoqueDESCRICAO.ClassName; { qryTiposBaixaEstoqueDESCRICAO: TIBStringField; }
    dsQryTiposBaixaEstoque.ClassName; { dsQryTiposBaixaEstoque: TDataSource; }
    updQryTiposBaixaEstoque.ClassName; { updQryTiposBaixaEstoque: TIBUpdateSQL; }
    qrySaboresPizza.ClassName; { qrySaboresPizza: TIBQuery; }
    qrySaboresPizzaCODIGO.ClassName; { qrySaboresPizzaCODIGO: TIBStringField; }
    qrySaboresPizzaDESCRICAO.ClassName; { qrySaboresPizzaDESCRICAO: TIBStringField; }
    qrySaboresPizzaBBALCAO.ClassName; { qrySaboresPizzaBBALCAO: TIBStringField; }
    qrySaboresPizzaBDELIVERY.ClassName; { qrySaboresPizzaBDELIVERY: TIBStringField; }
    qrySaboresPizzaPBALCAO.ClassName; { qrySaboresPizzaPBALCAO: TIBStringField; }
    qrySaboresPizzaPDELIVERY.ClassName; { qrySaboresPizzaPDELIVERY: TIBStringField; }
    qrySaboresPizzaMBALCAO.ClassName; { qrySaboresPizzaMBALCAO: TIBStringField; }
    qrySaboresPizzaMDELIVERY.ClassName; { qrySaboresPizzaMDELIVERY: TIBStringField; }
    qrySaboresPizzaGBALCAO.ClassName; { qrySaboresPizzaGBALCAO: TIBStringField; }
    qrySaboresPizzaGDELIVERY.ClassName; { qrySaboresPizzaGDELIVERY: TIBStringField; }
    qrySaboresPizzaFBALCAO.ClassName; { qrySaboresPizzaFBALCAO: TIBStringField; }
    qrySaboresPizzaFDELIVERY.ClassName; { qrySaboresPizzaFDELIVERY: TIBStringField; }
    qrySaboresPizzaPRECOBBALCAO.ClassName; { qrySaboresPizzaPRECOBBALCAO: TIBBCDField; }
    qrySaboresPizzaPRECOBDELIVERY.ClassName; { qrySaboresPizzaPRECOBDELIVERY: TIBBCDField; }
    qrySaboresPizzaPRECOPBALCAO.ClassName; { qrySaboresPizzaPRECOPBALCAO: TIBBCDField; }
    qrySaboresPizzaPRECOPDELIVERY.ClassName; { qrySaboresPizzaPRECOPDELIVERY: TIBBCDField; }
    qrySaboresPizzaPRECOMBALCAO.ClassName; { qrySaboresPizzaPRECOMBALCAO: TIBBCDField; }
    qrySaboresPizzaPRECOMDELIVERY.ClassName; { qrySaboresPizzaPRECOMDELIVERY: TIBBCDField; }
    qrySaboresPizzaPRECOGBALCAO.ClassName; { qrySaboresPizzaPRECOGBALCAO: TIBBCDField; }
    qrySaboresPizzaPRECOGDELIVERY.ClassName; { qrySaboresPizzaPRECOGDELIVERY: TIBBCDField; }
    qrySaboresPizzaPRECOFBALCAO.ClassName; { qrySaboresPizzaPRECOFBALCAO: TIBBCDField; }
    qrySaboresPizzaPRECOFDELIVERY.ClassName; { qrySaboresPizzaPRECOFDELIVERY: TIBBCDField; }
    qrySaboresPizzaDESCBBALCAO.ClassName; { qrySaboresPizzaDESCBBALCAO: TIBStringField; }
    qrySaboresPizzaDESCBDELIVERY.ClassName; { qrySaboresPizzaDESCBDELIVERY: TIBStringField; }
    qrySaboresPizzaDESCPBALCAO.ClassName; { qrySaboresPizzaDESCPBALCAO: TIBStringField; }
    qrySaboresPizzaDESCPDELIVERY.ClassName; { qrySaboresPizzaDESCPDELIVERY: TIBStringField; }
    qrySaboresPizzaDESCMBALCAO.ClassName; { qrySaboresPizzaDESCMBALCAO: TIBStringField; }
    qrySaboresPizzaDESCMDELIVERY.ClassName; { qrySaboresPizzaDESCMDELIVERY: TIBStringField; }
    qrySaboresPizzaDESCGBALCAO.ClassName; { qrySaboresPizzaDESCGBALCAO: TIBStringField; }
    qrySaboresPizzaDESCGDELIVERY.ClassName; { qrySaboresPizzaDESCGDELIVERY: TIBStringField; }
    qrySaboresPizzaDESCFBALCAO.ClassName; { qrySaboresPizzaDESCFBALCAO: TIBStringField; }
    qrySaboresPizzaDESCFDELIVERY.ClassName; { qrySaboresPizzaDESCFDELIVERY: TIBStringField; }
    dsQrySaboresPizza.ClassName; { dsQrySaboresPizza: TDataSource; }
    updSaboresPizza.ClassName; { updSaboresPizza: TIBUpdateSQL; }
    tbSaboresPizzaTemp.ClassName; { tbSaboresPizzaTemp: TRxMemoryData; }
    tbSaboresPizzaTempcodigo.ClassName; { tbSaboresPizzaTempcodigo: TStringField; }
    tbSaboresPizzaTemptamanho.ClassName; { tbSaboresPizzaTemptamanho: TStringField; }
    tbSaboresPizzaTempdescricao.ClassName; { tbSaboresPizzaTempdescricao: TStringField; }
    tbSaboresPizzaTempobs.ClassName; { tbSaboresPizzaTempobs: TStringField; }
    tbSaboresPizzaTempproporcao.ClassName; { tbSaboresPizzaTempproporcao: TFloatField; }
    tbSaboresPizzaTempvalorSabor.ClassName; { tbSaboresPizzaTempvalorSabor: TFloatField; }
    tbSaboresPizzaTempcodProduto.ClassName; { tbSaboresPizzaTempcodProduto: TStringField; }
    dsSaboresPizzaTemp.ClassName; { dsSaboresPizzaTemp: TDataSource; }
    dsQryUltimosPedidosDelivery.ClassName; { dsQryUltimosPedidosDelivery: TDataSource; }
    dsQryItensUltimosPedidosDelivery.ClassName; { dsQryItensUltimosPedidosDelivery: TDataSource; }
    qryEntregadores.ClassName; { qryEntregadores: TIBQuery; }
    qryEntregadoresCODIGO.ClassName; { qryEntregadoresCODIGO: TIBStringField; }
    qryEntregadoresNOME_ENTREGADOR.ClassName; { qryEntregadoresNOME_ENTREGADOR: TIBStringField; }
    qryEntregadoresPERC_COMISSAO_PEDIDO.ClassName; { qryEntregadoresPERC_COMISSAO_PEDIDO: TIBBCDField; }
    qryEntregadoresCOMISSAO_POR_PEDIDO.ClassName; { qryEntregadoresCOMISSAO_POR_PEDIDO: TIBBCDField; }
    qryEntregadoresVALOR_DIARIA.ClassName; { qryEntregadoresVALOR_DIARIA: TIBBCDField; }
    qryEntregadoresSTATUS.ClassName; { qryEntregadoresSTATUS: TSmallintField; }
    updQryEntregadores.ClassName; { updQryEntregadores: TIBUpdateSQL; }
    dsQryEntregadores.ClassName; { dsQryEntregadores: TDataSource; }
    dsQryObsClientesDelivery.ClassName; { dsQryObsClientesDelivery: TDataSource; }
    qryCartoes.ClassName; { qryCartoes: TIBQuery; }
    dsQryCartoes.ClassName; { dsQryCartoes: TDataSource; }
    proc_abate_submateria.ClassName; { proc_abate_submateria: TIBStoredProc; }
    qryDadosPAF.ClassName; { qryDadosPAF: TIBQuery; }
    qryDadosPAFMD5_PAF.ClassName; { qryDadosPAFMD5_PAF: TIBStringField; }
    qryDadosPAFNOME_EMPRESA.ClassName; { qryDadosPAFNOME_EMPRESA: TIBStringField; }
    qryDadosPAFCNPJ.ClassName; { qryDadosPAFCNPJ: TIBStringField; }
    qryDadosPAFINSCRICAO_ESTADUAL.ClassName; { qryDadosPAFINSCRICAO_ESTADUAL: TIBStringField; }
    qryDadosPAFINSCRICAO_MUNICIPAL.ClassName; { qryDadosPAFINSCRICAO_MUNICIPAL: TIBStringField; }
    qryDadosPAFCONTATO.ClassName; { qryDadosPAFCONTATO: TIBStringField; }
    qryDadosPAFENDERECO.ClassName; { qryDadosPAFENDERECO: TIBStringField; }
    qryDadosPAFCIDADE.ClassName; { qryDadosPAFCIDADE: TIBStringField; }
    qryDadosPAFCEP.ClassName; { qryDadosPAFCEP: TIBStringField; }
    qryDadosPAFUF.ClassName; { qryDadosPAFUF: TIBStringField; }
    qryDadosPAFTELEFONE.ClassName; { qryDadosPAFTELEFONE: TIBStringField; }
    qryDadosPAFEMAIL.ClassName; { qryDadosPAFEMAIL: TIBStringField; }
    qryDadosPAFNOME_PAF.ClassName; { qryDadosPAFNOME_PAF: TIBStringField; }
    qryDadosPAFVERSAO_PAF.ClassName; { qryDadosPAFVERSAO_PAF: TIBStringField; }
    qryDadosPAFVERSAO_ER.ClassName; { qryDadosPAFVERSAO_ER: TIBStringField; }
    updQryDadosPAF.ClassName; { updQryDadosPAF: TIBUpdateSQL; }
    dsQryCidade.ClassName; { dsQryCidade: TDataSource; }
    qryCidade.ClassName; { qryCidade: TIBQuery; }
    qryCidadeCOD_CIDADE.ClassName; { qryCidadeCOD_CIDADE: TIBStringField; }
    qryCidadeNOME.ClassName; { qryCidadeNOME: TIBStringField; }
    qryCidadeUF.ClassName; { qryCidadeUF: TIBStringField; }
    qryCidadeESTADO.ClassName; { qryCidadeESTADO: TIBStringField; }
    qryNotasConsumidor.ClassName; { qryNotasConsumidor: TIBQuery; }
    qryNotasConsumidorCODIGO.ClassName; { qryNotasConsumidorCODIGO: TIBStringField; }
    qryNotasConsumidorNUMERO_NOTA.ClassName; { qryNotasConsumidorNUMERO_NOTA: TIBStringField; }
    qryNotasConsumidorSERIE.ClassName; { qryNotasConsumidorSERIE: TIBStringField; }
    qryNotasConsumidorSUB_SERIE.ClassName; { qryNotasConsumidorSUB_SERIE: TIBStringField; }
    qryNotasConsumidorDATA_DOC.ClassName; { qryNotasConsumidorDATA_DOC: TDateTimeField; }
    qryNotasConsumidorDATA_LANCAMENTO.ClassName; { qryNotasConsumidorDATA_LANCAMENTO: TDateTimeField; }
    qryNotasConsumidorMES_REF_CONTABIL.ClassName; { qryNotasConsumidorMES_REF_CONTABIL: TIBStringField; }
    qryNotasConsumidorCFOP.ClassName; { qryNotasConsumidorCFOP: TIBStringField; }
    qryNotasConsumidorCST_ICMS.ClassName; { qryNotasConsumidorCST_ICMS: TIBStringField; }
    qryNotasConsumidorNUMERO_CUPOM_FISCAL.ClassName; { qryNotasConsumidorNUMERO_CUPOM_FISCAL: TIBStringField; }
    qryNotasConsumidorNUMERO_ECF.ClassName; { qryNotasConsumidorNUMERO_ECF: TIBStringField; }
    qryNotasConsumidorCPF_CNPJ_ADQUIRENTE.ClassName; { qryNotasConsumidorCPF_CNPJ_ADQUIRENTE: TIBStringField; }
    qryNotasConsumidorVALOR_MERCADORIAS.ClassName; { qryNotasConsumidorVALOR_MERCADORIAS: TIBBCDField; }
    qryNotasConsumidorBASE_ICMS.ClassName; { qryNotasConsumidorBASE_ICMS: TIBBCDField; }
    qryNotasConsumidorREDUCAO_BASE_ICMS.ClassName; { qryNotasConsumidorREDUCAO_BASE_ICMS: TIBBCDField; }
    qryNotasConsumidorALIQ_ICMS.ClassName; { qryNotasConsumidorALIQ_ICMS: TIBBCDField; }
    qryNotasConsumidorVALOR_ICMS.ClassName; { qryNotasConsumidorVALOR_ICMS: TIBBCDField; }
    qryNotasConsumidorVALOR_DOC.ClassName; { qryNotasConsumidorVALOR_DOC: TIBBCDField; }
    qryNotasConsumidorCANCELADO.ClassName; { qryNotasConsumidorCANCELADO: TSmallintField; }
    qryNotasConsumidorDESC_CFOP.ClassName; { qryNotasConsumidorDESC_CFOP: TIBStringField; }
    qryNotasConsumidorDESC_CST.ClassName; { qryNotasConsumidorDESC_CST: TIBStringField; }
    updNotasConsumidor.ClassName; { updNotasConsumidor: TIBUpdateSQL; }
    dsQryNotasConsumidor.ClassName; { dsQryNotasConsumidor: TDataSource; }
    qryNotasTransporte.ClassName; { qryNotasTransporte: TIBQuery; }
    qryNotasTransporteCODIGO.ClassName; { qryNotasTransporteCODIGO: TIBStringField; }
    qryNotasTransporteCOD_FORNECEDOR.ClassName; { qryNotasTransporteCOD_FORNECEDOR: TIBStringField; }
    qryNotasTransporteNUMERO_NOTA.ClassName; { qryNotasTransporteNUMERO_NOTA: TIBStringField; }
    qryNotasTransporteSERIE.ClassName; { qryNotasTransporteSERIE: TIBStringField; }
    qryNotasTransporteSUB_SERIE.ClassName; { qryNotasTransporteSUB_SERIE: TIBStringField; }
    qryNotasTransporteSITUACAO.ClassName; { qryNotasTransporteSITUACAO: TIBStringField; }
    qryNotasTransporteDATA_EMISSAO.ClassName; { qryNotasTransporteDATA_EMISSAO: TDateTimeField; }
    qryNotasTransporteDATA_SERVICO.ClassName; { qryNotasTransporteDATA_SERVICO: TDateTimeField; }
    qryNotasTransporteDATA_LANCAMENTO.ClassName; { qryNotasTransporteDATA_LANCAMENTO: TDateTimeField; }
    qryNotasTransporteMES_REF_CONTABIL.ClassName; { qryNotasTransporteMES_REF_CONTABIL: TIBStringField; }
    qryNotasTransporteMODELO_NOTA.ClassName; { qryNotasTransporteMODELO_NOTA: TIBStringField; }
    qryNotasTransporteCFOP.ClassName; { qryNotasTransporteCFOP: TIBStringField; }
    qryNotasTransporteCST_ICMS.ClassName; { qryNotasTransporteCST_ICMS: TIBStringField; }
    qryNotasTransporteVALOR_SERVICO.ClassName; { qryNotasTransporteVALOR_SERVICO: TIBBCDField; }
    qryNotasTransporteDESCONTO.ClassName; { qryNotasTransporteDESCONTO: TIBBCDField; }
    qryNotasTransporteBASE_ICMS.ClassName; { qryNotasTransporteBASE_ICMS: TIBBCDField; }
    qryNotasTransporteREDUCAO_BASE_ICMS.ClassName; { qryNotasTransporteREDUCAO_BASE_ICMS: TIBBCDField; }
    qryNotasTransporteALIQ_ICMS.ClassName; { qryNotasTransporteALIQ_ICMS: TIBBCDField; }
    qryNotasTransporteVALOR_ICMS.ClassName; { qryNotasTransporteVALOR_ICMS: TIBBCDField; }
    qryNotasTransporteVALOR_NAO_TRIBUTADO.ClassName; { qryNotasTransporteVALOR_NAO_TRIBUTADO: TIBBCDField; }
    qryNotasTransporteVALOR_DOC.ClassName; { qryNotasTransporteVALOR_DOC: TIBBCDField; }
    qryNotasTransporteTIPO_CTE.ClassName; { qryNotasTransporteTIPO_CTE: TIBStringField; }
    qryNotasTransporteRAZAO_SOCIAL.ClassName; { qryNotasTransporteRAZAO_SOCIAL: TIBStringField; }
    qryNotasTransporteCGC_CPF.ClassName; { qryNotasTransporteCGC_CPF: TIBStringField; }
    qryNotasTransporteDESC_CFOP.ClassName; { qryNotasTransporteDESC_CFOP: TIBStringField; }
    qryNotasTransporteDESC_CST.ClassName; { qryNotasTransporteDESC_CST: TIBStringField; }
    qryNotasTransporteDESC_MODELO.ClassName; { qryNotasTransporteDESC_MODELO: TIBStringField; }
    qryNotasTransporteID_FRETE.ClassName; { qryNotasTransporteID_FRETE: TSmallintField; }
    qryNotasTransporteDESC_SITUACAO.ClassName; { qryNotasTransporteDESC_SITUACAO: TIBStringField; }
    qryNotasTransporteCHAVE_CTE.ClassName; { qryNotasTransporteCHAVE_CTE: TIBStringField; }
    qryNotasTransporteTIPODOC.ClassName; { qryNotasTransporteTIPODOC: TSmallintField; }
    updNotasTransporte.ClassName; { updNotasTransporte: TIBUpdateSQL; }
    dsQryNotasTransporte.ClassName; { dsQryNotasTransporte: TDataSource; }
    qry_saidas.ClassName; { qry_saidas: TIBQuery; }
    qry_saidasCOD_SAIDA.ClassName; { qry_saidasCOD_SAIDA: TIBStringField; }
    qry_saidasCOD_FORNECEDOR.ClassName; { qry_saidasCOD_FORNECEDOR: TIBStringField; }
    qry_saidasCOD_USUARIO.ClassName; { qry_saidasCOD_USUARIO: TIBStringField; }
    qry_saidasQTDE_ITENS.ClassName; { qry_saidasQTDE_ITENS: TSmallintField; }
    qry_saidasDATA.ClassName; { qry_saidasDATA: TDateField; }
    qry_saidasHORA.ClassName; { qry_saidasHORA: TTimeField; }
    qry_saidasNOME_USUARIO_SAIDA.ClassName; { qry_saidasNOME_USUARIO_SAIDA: TIBStringField; }
    qry_saidasCNPJ.ClassName; { qry_saidasCNPJ: TIBStringField; }
    qry_saidasIE.ClassName; { qry_saidasIE: TIBStringField; }
    qry_saidasUF.ClassName; { qry_saidasUF: TIBStringField; }
    qry_saidasDATA_EMISSAO.ClassName; { qry_saidasDATA_EMISSAO: TDateField; }
    qry_saidasDATA_SAIDA.ClassName; { qry_saidasDATA_SAIDA: TDateField; }
    qry_saidasNUMERO_NOTA.ClassName; { qry_saidasNUMERO_NOTA: TIBStringField; }
    qry_saidasSERIE_NOTA.ClassName; { qry_saidasSERIE_NOTA: TIBStringField; }
    qry_saidasMODELO_NOTA.ClassName; { qry_saidasMODELO_NOTA: TIBStringField; }
    qry_saidasCFOP_NOTA.ClassName; { qry_saidasCFOP_NOTA: TIBStringField; }
    qry_saidasBASE_ICMS.ClassName; { qry_saidasBASE_ICMS: TIBBCDField; }
    qry_saidasVALOR_ICMS.ClassName; { qry_saidasVALOR_ICMS: TIBBCDField; }
    qry_saidasBASE_ICMS_SUBST.ClassName; { qry_saidasBASE_ICMS_SUBST: TIBBCDField; }
    qry_saidasVALOR_ICMS_SUBST.ClassName; { qry_saidasVALOR_ICMS_SUBST: TIBBCDField; }
    qry_saidasVALOR_PRODUTOS.ClassName; { qry_saidasVALOR_PRODUTOS: TIBBCDField; }
    qry_saidasFRETE.ClassName; { qry_saidasFRETE: TIBBCDField; }
    qry_saidasSEGURO.ClassName; { qry_saidasSEGURO: TIBBCDField; }
    qry_saidasDESCONTO.ClassName; { qry_saidasDESCONTO: TIBBCDField; }
    qry_saidasOUTRAS_DESPESAS.ClassName; { qry_saidasOUTRAS_DESPESAS: TIBBCDField; }
    qry_saidasVALOR_IPI.ClassName; { qry_saidasVALOR_IPI: TIBBCDField; }
    qry_saidasTOTAL_NOTA.ClassName; { qry_saidasTOTAL_NOTA: TIBBCDField; }
    qry_saidasXRAZAOSOCIAL.ClassName; { qry_saidasXRAZAOSOCIAL: TIBStringField; }
    qry_saidasXCNPJ.ClassName; { qry_saidasXCNPJ: TIBStringField; }
    qry_saidasXINSCRICAOESTADUAL.ClassName; { qry_saidasXINSCRICAOESTADUAL: TIBStringField; }
    qry_saidasXNOMECIDADE.ClassName; { qry_saidasXNOMECIDADE: TIBStringField; }
    qry_saidasXUF.ClassName; { qry_saidasXUF: TIBStringField; }
    qry_saidasXMODELONOTA.ClassName; { qry_saidasXMODELONOTA: TIBStringField; }
    qry_saidasXCFOPDESCRICAO.ClassName; { qry_saidasXCFOPDESCRICAO: TIBStringField; }
    qry_saidasNUMERO_CUPOM_FISCAL.ClassName; { qry_saidasNUMERO_CUPOM_FISCAL: TIBStringField; }
    qry_saidasNUMERO_ECF.ClassName; { qry_saidasNUMERO_ECF: TIBStringField; }
    qry_saidasCHAVE_NFE.ClassName; { qry_saidasCHAVE_NFE: TIBStringField; }
    qry_saidasSITUACAO.ClassName; { qry_saidasSITUACAO: TIBStringField; }
    qry_saidasXDESCSITUACAONOTA.ClassName; { qry_saidasXDESCSITUACAONOTA: TIBStringField; }
    qry_saidasTIPO_SAIDA.ClassName; { qry_saidasTIPO_SAIDA: TSmallintField; }
    updQrySaidas.ClassName; { updQrySaidas: TIBUpdateSQL; }
    ds_qry_saidas.ClassName; { ds_qry_saidas: TDataSource; }
    qryCsContasApagar.ClassName; { qryCsContasApagar: TIBQuery; }
    dsQryContasApagar.ClassName; { dsQryContasApagar: TDataSource; }
    dsItensFatura.ClassName; { dsItensFatura: TDataSource; }
    qryItensConsultaFatura.ClassName; { qryItensConsultaFatura: TIBQuery; }
    qryItensConsultaFaturaCOD_EMPRESA.ClassName; { qryItensConsultaFaturaCOD_EMPRESA: TIBStringField; }
    qryItensConsultaFaturaCOD_VENDA.ClassName; { qryItensConsultaFaturaCOD_VENDA: TIBStringField; }
    qryItensConsultaFaturaCOD_PRODUTO.ClassName; { qryItensConsultaFaturaCOD_PRODUTO: TIBStringField; }
    qryItensConsultaFaturaDESCRICAO.ClassName; { qryItensConsultaFaturaDESCRICAO: TIBStringField; }
    qryItensConsultaFaturaPARAMETRO_CONTAGEM.ClassName; { qryItensConsultaFaturaPARAMETRO_CONTAGEM: TIBBCDField; }
    qryItensConsultaFaturaCOD_GRUPO.ClassName; { qryItensConsultaFaturaCOD_GRUPO: TIBStringField; }
    qryItensConsultaFaturaCOD_ALIQUOTA.ClassName; { qryItensConsultaFaturaCOD_ALIQUOTA: TIBStringField; }
    qryItensConsultaFaturaQUANTIDADE_REAL.ClassName; { qryItensConsultaFaturaQUANTIDADE_REAL: TFMTBCDField; }
    qryItensConsultaFaturaQUANTIDADE_CONTAGEM.ClassName; { qryItensConsultaFaturaQUANTIDADE_CONTAGEM: TFloatField; }
    qryItensConsultaFaturaVALOR_UNITARIO.ClassName; { qryItensConsultaFaturaVALOR_UNITARIO: TIBBCDField; }
    qryItensConsultaFaturaTOTAL.ClassName; { qryItensConsultaFaturaTOTAL: TFloatField; }
    qryItensConsultaFaturaDATA.ClassName; { qryItensConsultaFaturaDATA: TDateField; }
    qryItensConsultaFaturaHORA.ClassName; { qryItensConsultaFaturaHORA: TDateTimeField; }
    qryItensConsultaFaturaMESA.ClassName; { qryItensConsultaFaturaMESA: TIBStringField; }
    qryItensConsultaFaturaCOD_GARCON.ClassName; { qryItensConsultaFaturaCOD_GARCON: TIBStringField; }
    qryItensConsultaFaturaCOD_USUARIO.ClassName; { qryItensConsultaFaturaCOD_USUARIO: TIBStringField; }
    qryItensConsultaFaturaDESCRICAO_GRUPO.ClassName; { qryItensConsultaFaturaDESCRICAO_GRUPO: TIBStringField; }
    qryItensConsultaFaturaNOME_USUARIO.ClassName; { qryItensConsultaFaturaNOME_USUARIO: TIBStringField; }
    qryItensConsultaFaturaCOD_CAIXA.ClassName; { qryItensConsultaFaturaCOD_CAIXA: TIBStringField; }
    tb_parametros.ClassName; { tb_parametros: TIBTable; }
    tb_parametrosDATA_SISTEMA.ClassName; { tb_parametrosDATA_SISTEMA: TDateField; }
    tb_parametrosRAZAO_SOCIAL.ClassName; { tb_parametrosRAZAO_SOCIAL: TIBStringField; }
    tb_parametrosNOME_FANTASIA.ClassName; { tb_parametrosNOME_FANTASIA: TIBStringField; }
    tb_parametrosCNPJ.ClassName; { tb_parametrosCNPJ: TIBStringField; }
    tb_parametrosIE.ClassName; { tb_parametrosIE: TIBStringField; }
    tb_parametrosIM.ClassName; { tb_parametrosIM: TIBStringField; }
    tb_parametrosCOD_CIDADE.ClassName; { tb_parametrosCOD_CIDADE: TIBStringField; }
    tb_parametrosCOD_MUNICIPIO_IBGE.ClassName; { tb_parametrosCOD_MUNICIPIO_IBGE: TIBStringField; }
    tb_parametrosLOGRADOURO.ClassName; { tb_parametrosLOGRADOURO: TIBStringField; }
    tb_parametrosCOMPLEMENTO.ClassName; { tb_parametrosCOMPLEMENTO: TIBStringField; }
    tb_parametrosNUMERO.ClassName; { tb_parametrosNUMERO: TIBStringField; }
    tb_parametrosBAIRRO.ClassName; { tb_parametrosBAIRRO: TIBStringField; }
    tb_parametrosUF.ClassName; { tb_parametrosUF: TIBStringField; }
    tb_parametrosCEP.ClassName; { tb_parametrosCEP: TIBStringField; }
    tb_parametrosTELEFONE_EMPRESA.ClassName; { tb_parametrosTELEFONE_EMPRESA: TIBStringField; }
    tb_parametrosFAX_EMPRESA.ClassName; { tb_parametrosFAX_EMPRESA: TIBStringField; }
    tb_parametrosCONTATO.ClassName; { tb_parametrosCONTATO: TIBStringField; }
    tb_parametrosPERFIL_SPED.ClassName; { tb_parametrosPERFIL_SPED: TIBStringField; }
    tb_parametrosIND_ATIVIDADE.ClassName; { tb_parametrosIND_ATIVIDADE: TIBStringField; }
    tb_parametrosCOD_SUFRAMA.ClassName; { tb_parametrosCOD_SUFRAMA: TIBStringField; }
    tb_parametrosNOME_CONTABILISTA.ClassName; { tb_parametrosNOME_CONTABILISTA: TIBStringField; }
    tb_parametrosCPF_CONTABILISTA.ClassName; { tb_parametrosCPF_CONTABILISTA: TIBStringField; }
    tb_parametrosCRC_CONTABILISTA.ClassName; { tb_parametrosCRC_CONTABILISTA: TIBStringField; }
    tb_parametrosCNPJ_CONTABILISTA.ClassName; { tb_parametrosCNPJ_CONTABILISTA: TIBStringField; }
    tb_parametrosCEP_CONTABILISTA.ClassName; { tb_parametrosCEP_CONTABILISTA: TIBStringField; }
    tb_parametrosENDERECO_CONTABILISTA.ClassName; { tb_parametrosENDERECO_CONTABILISTA: TIBStringField; }
    tb_parametrosCOMPLEMENTO_END_CONTABILISTA.ClassName; { tb_parametrosCOMPLEMENTO_END_CONTABILISTA: TIBStringField; }
    tb_parametrosNUMERO_END_CONTABILISTA.ClassName; { tb_parametrosNUMERO_END_CONTABILISTA: TIBStringField; }
    tb_parametrosBAIRRO_CONTABILISTA.ClassName; { tb_parametrosBAIRRO_CONTABILISTA: TIBStringField; }
    tb_parametrosTELEFONE_CONTABILISTA.ClassName; { tb_parametrosTELEFONE_CONTABILISTA: TIBStringField; }
    tb_parametrosFAX_CONTABILISTA.ClassName; { tb_parametrosFAX_CONTABILISTA: TIBStringField; }
    tb_parametrosULTIMAHORA.ClassName; { tb_parametrosULTIMAHORA: TDateTimeField; }
    tb_parametrosSENHA_PADRAO.ClassName; { tb_parametrosSENHA_PADRAO: TIBStringField; }
    tb_parametrosPERCENTUAL_SERVICO_GARCOM.ClassName; { tb_parametrosPERCENTUAL_SERVICO_GARCOM: TIBBCDField; }
    tb_parametrosPERCENTUAL_SERVICO_CASA.ClassName; { tb_parametrosPERCENTUAL_SERVICO_CASA: TIBBCDField; }
    tb_parametrosPERCENTUAL_SERVICO_FUNCIONARIOS.ClassName; { tb_parametrosPERCENTUAL_SERVICO_FUNCIONARIOS: TIBBCDField; }
    tb_parametrosZERAR_ICMS_ENTRADAS.ClassName; { tb_parametrosZERAR_ICMS_ENTRADAS: TSmallintField; }
    tb_parametrosALTERAR_UN_NAS_ENTRADAS.ClassName; { tb_parametrosALTERAR_UN_NAS_ENTRADAS: TSmallintField; }
    tb_parametrosCOUVERT_MASC_PAGANTE.ClassName; { tb_parametrosCOUVERT_MASC_PAGANTE: TIBStringField; }
    tb_parametrosCOUVERT_MASC_LISTA.ClassName; { tb_parametrosCOUVERT_MASC_LISTA: TIBStringField; }
    tb_parametrosCOUVERT_FEM_PAGANTE.ClassName; { tb_parametrosCOUVERT_FEM_PAGANTE: TIBStringField; }
    tb_parametrosCOUVERT_FEM_LISTA.ClassName; { tb_parametrosCOUVERT_FEM_LISTA: TIBStringField; }
    tb_parametrosCOUVERT_VIP.ClassName; { tb_parametrosCOUVERT_VIP: TIBStringField; }
    tb_parametrosINI_FAIXA_MASC.ClassName; { tb_parametrosINI_FAIXA_MASC: TIntegerField; }
    tb_parametrosFIM_FAIXA_MASC.ClassName; { tb_parametrosFIM_FAIXA_MASC: TSmallintField; }
    tb_parametrosINI_FAIXA_FEM.ClassName; { tb_parametrosINI_FAIXA_FEM: TIntegerField; }
    tb_parametrosFIM_FAIXA_FEM.ClassName; { tb_parametrosFIM_FAIXA_FEM: TIntegerField; }
    tb_parametrosINI_FAIXA_VIP.ClassName; { tb_parametrosINI_FAIXA_VIP: TIntegerField; }
    tb_parametrosFIM_FAIXA_VIP.ClassName; { tb_parametrosFIM_FAIXA_VIP: TIntegerField; }
    tb_parametrosBOATE.ClassName; { tb_parametrosBOATE: TSmallintField; }
    tb_parametrosRECEBE_COUVERT_ENTRADA.ClassName; { tb_parametrosRECEBE_COUVERT_ENTRADA: TSmallintField; }
    tb_parametrosCOUVERT_MASC_PRECONVITE.ClassName; { tb_parametrosCOUVERT_MASC_PRECONVITE: TIBStringField; }
    tb_parametrosCOUVERT_FEM_PRECONVITE.ClassName; { tb_parametrosCOUVERT_FEM_PRECONVITE: TIBStringField; }
    tb_parametrosALIQUOTA_ICMS.ClassName; { tb_parametrosALIQUOTA_ICMS: TIBBCDField; }
    tb_parametrosRED_BASE_ICMS.ClassName; { tb_parametrosRED_BASE_ICMS: TFloatField; }
    tb_parametrosPERCENTUAL_COM_EXT_GARCOM.ClassName; { tb_parametrosPERCENTUAL_COM_EXT_GARCOM: TIBBCDField; }
    tb_parametrosEMAIL_CONTABILISTA.ClassName; { tb_parametrosEMAIL_CONTABILISTA: TIBStringField; }
    tb_parametrosNUM_SERIE_CERTIFICADO.ClassName; { tb_parametrosNUM_SERIE_CERTIFICADO: TIBStringField; }
    tb_parametrosSENHA_CERTIFICADO.ClassName; { tb_parametrosSENHA_CERTIFICADO: TIBStringField; }
    tb_parametrosULT_NSU_NFE_DEST.ClassName; { tb_parametrosULT_NSU_NFE_DEST: TIBStringField; }
    tb_parametrosUSA_COD_GARCON.ClassName; { tb_parametrosUSA_COD_GARCON: TSmallintField; }
    tb_parametrosCOBRA_SERVICO.ClassName; { tb_parametrosCOBRA_SERVICO: TSmallintField; }
    tb_parametrosCSC_NFCE.ClassName; { tb_parametrosCSC_NFCE: TIBStringField; }
    tb_parametrosID_CSC_NFCE.ClassName; { tb_parametrosID_CSC_NFCE: TIBStringField; }
    tb_parametrosNOME_CIDADE_CONTRIBUINTE.ClassName; { tb_parametrosNOME_CIDADE_CONTRIBUINTE: TIBStringField; }
    tb_parametrosCOD_EMPRESA.ClassName; { tb_parametrosCOD_EMPRESA: TIBStringField; }
    tb_parametrosULTIMA_VENDA_EXP.ClassName; { tb_parametrosULTIMA_VENDA_EXP: TIBStringField; }
    tb_parametrosREGIME_TRIBUTACAO.ClassName; { tb_parametrosREGIME_TRIBUTACAO: TSmallintField; }
    tb_parametrosCREDITO_ENTRADAS.ClassName; { tb_parametrosCREDITO_ENTRADAS: TSmallintField; }
    tb_parametrosIMPOSTO_SIMP_NAC_NFCE.ClassName; { tb_parametrosIMPOSTO_SIMP_NAC_NFCE: TSmallintField; }
    tb_parametrosALIQ_IBPT.ClassName; { tb_parametrosALIQ_IBPT: TIBBCDField; }
    tb_parametrosCHAVE_AUTENTICACAO_TEF.ClassName; { tb_parametrosCHAVE_AUTENTICACAO_TEF: TIBStringField; }
    tb_parametrosNUMERO_NFE.ClassName; { tb_parametrosNUMERO_NFE: TIntegerField; }
    tb_parametrosSERIE_NFE.ClassName; { tb_parametrosSERIE_NFE: TIntegerField; }
    tb_parametrosQTD_VIAS_SANGRIA.ClassName; { tb_parametrosQTD_VIAS_SANGRIA: TSmallintField; }
    tb_parametrosCSC_NFCE_HOMOLOGACAO.ClassName; { tb_parametrosCSC_NFCE_HOMOLOGACAO: TIBStringField; }
    tb_parametrosID_CSC_NFCE_HOMOLOGACAO.ClassName; { tb_parametrosID_CSC_NFCE_HOMOLOGACAO: TIBStringField; }
    tb_parametrosPIZZA_MAIS_CARA.ClassName; { tb_parametrosPIZZA_MAIS_CARA: TSmallintField; }
    tb_parametrosASSINATURA_SAT.ClassName; { tb_parametrosASSINATURA_SAT: TIBStringField; }
    tb_parametrosCNPJ_SWHOUSE.ClassName; { tb_parametrosCNPJ_SWHOUSE: TIBStringField; }
    tb_parametrosCOD_ATIVACAO_SAT.ClassName; { tb_parametrosCOD_ATIVACAO_SAT: TIBStringField; }
    tb_parametrosTIPO_ENVIO_NFCE.ClassName; { tb_parametrosTIPO_ENVIO_NFCE: TSmallintField; }
    tb_parametrosTIPO_ENVIO_NFE.ClassName; { tb_parametrosTIPO_ENVIO_NFE: TSmallintField; }
    tb_parametrosAGUARDA_CONSULTA_RET_NFCE.ClassName; { tb_parametrosAGUARDA_CONSULTA_RET_NFCE: TIBBCDField; }
    tb_parametrosTENTATIVAS_CONSULTA_RET_NFCE.ClassName; { tb_parametrosTENTATIVAS_CONSULTA_RET_NFCE: TSmallintField; }
    tb_parametrosTIMEOUT_RET_NFCE.ClassName; { tb_parametrosTIMEOUT_RET_NFCE: TIBBCDField; }
    tb_parametrosINTERVALO_TENTATIVAS_NFCE.ClassName; { tb_parametrosINTERVALO_TENTATIVAS_NFCE: TIBBCDField; }
    tb_parametrosMAX_NFCE_SEM_CPF.ClassName; { tb_parametrosMAX_NFCE_SEM_CPF: TIBBCDField; }
    tb_parametrosMSG_PROMO_DELIVERY.ClassName; { tb_parametrosMSG_PROMO_DELIVERY: TIBStringField; }
    tb_parametrosMSG_PROMO_CONTA.ClassName; { tb_parametrosMSG_PROMO_CONTA: TIBStringField; }
    tb_parametrosNUMERO_CARTA_CORRECAO_NFE.ClassName; { tb_parametrosNUMERO_CARTA_CORRECAO_NFE: TIntegerField; }
    tb_parametrosNUMERO_CARTA_CORRECAO_NFCE.ClassName; { tb_parametrosNUMERO_CARTA_CORRECAO_NFCE: TIntegerField; }
    tb_parametrosPFX_CERTIFICADO.ClassName; { tb_parametrosPFX_CERTIFICADO: TWideMemoField; }
    tb_parametrosIMP_ENDERECO_CLIENTE_PRODUCAO.ClassName; { tb_parametrosIMP_ENDERECO_CLIENTE_PRODUCAO: TSmallintField; }
    tb_parametrosMSG_DELIVERY_GD.ClassName; { tb_parametrosMSG_DELIVERY_GD: TSmallintField; }
    tb_parametrosMSG_DELIVERY_DESTAQUE.ClassName; { tb_parametrosMSG_DELIVERY_DESTAQUE: TSmallintField; }
    tb_parametrosMSG_CONTA_GD.ClassName; { tb_parametrosMSG_CONTA_GD: TSmallintField; }
    tb_parametrosMSG_CONTA_DESTAQUE.ClassName; { tb_parametrosMSG_CONTA_DESTAQUE: TSmallintField; }
    tb_parametrosLOGO_COMPROVANTES.ClassName; { tb_parametrosLOGO_COMPROVANTES: TIBStringField; }
    tb_parametrosTAB_PRECOS_DELIVERY.ClassName; { tb_parametrosTAB_PRECOS_DELIVERY: TSmallintField; }
    tb_parametrosCOMPROVANTE_DELIVERY_AGRUPADO.ClassName; { tb_parametrosCOMPROVANTE_DELIVERY_AGRUPADO: TSmallintField; }
    tb_parametrosIDENTIFICA_CLIENTE_BALCAO.ClassName; { tb_parametrosIDENTIFICA_CLIENTE_BALCAO: TSmallintField; }
    tb_parametrosTEMPO_PREP_DELIVERY.ClassName; { tb_parametrosTEMPO_PREP_DELIVERY: TSmallintField; }
    tb_parametrosIMPRIME_OBS_COMPROVANTE_DELIV.ClassName; { tb_parametrosIMPRIME_OBS_COMPROVANTE_DELIV: TSmallintField; }
    tb_parametrosULT_NSU_CTE.ClassName; { tb_parametrosULT_NSU_CTE: TIBStringField; }
    tb_parametrosINTEGRACAO_PLATAFORMAS.ClassName; { tb_parametrosINTEGRACAO_PLATAFORMAS: TSmallintField; }
    tb_parametrosDESCRICAO_EMPRESA.ClassName; { tb_parametrosDESCRICAO_EMPRESA: TIBStringField; }
    tb_parametrosIMP_DADOS_PLATAFORMA_COMP_DELIV.ClassName; { tb_parametrosIMP_DADOS_PLATAFORMA_COMP_DELIV: TSmallintField; }
    tb_parametrosIMP_DADOS_PLATAFORMA_PRODUCAO.ClassName; { tb_parametrosIMP_DADOS_PLATAFORMA_PRODUCAO: TSmallintField; }
    tb_parametrosREGISTRA_ENTREGA_IFOOD.ClassName; { tb_parametrosREGISTRA_ENTREGA_IFOOD: TSmallintField; }
    qryPromoters.ClassName; { qryPromoters: TIBQuery; }
    dsQryPromoters.ClassName; { dsQryPromoters: TDataSource; }
    updQryPromoters.ClassName; { updQryPromoters: TIBUpdateSQL; }
    qryCsSaboresPizza.ClassName; { qryCsSaboresPizza: TIBQuery; }
    dsQryCsSaboresPizza.ClassName; { dsQryCsSaboresPizza: TDataSource; }
    qryCsObservacoes.ClassName; { qryCsObservacoes: TIBQuery; }
    dsQryCsObservacoes.ClassName; { dsQryCsObservacoes: TDataSource; }
    tbObservacoesTemp.ClassName; { tbObservacoesTemp: TRxMemoryData; }
    tbObservacoesTempdescricao.ClassName; { tbObservacoesTempdescricao: TStringField; }
    dsObervacoesTemp.ClassName; { dsObervacoesTemp: TDataSource; }
    tbGuarnicoesTemp.ClassName; { tbGuarnicoesTemp: TRxMemoryData; }
    tbGuarnicoesTempcodigo.ClassName; { tbGuarnicoesTempcodigo: TStringField; }
    tbGuarnicoesTempdescricao.ClassName; { tbGuarnicoesTempdescricao: TStringField; }
    dsGuarnicoesTemp.ClassName; { dsGuarnicoesTemp: TDataSource; }
    qryGruposTouch.ClassName; { qryGruposTouch: TIBQuery; }
    qryGruposTouchCODIGO.ClassName; { qryGruposTouchCODIGO: TIBStringField; }
    qryGruposTouchDESCRICAO.ClassName; { qryGruposTouchDESCRICAO: TIBStringField; }
    dsGruposTouch.ClassName; { dsGruposTouch: TDataSource; }
    updGruposTouch.ClassName; { updGruposTouch: TIBUpdateSQL; }
    qryGuarnicoes.ClassName; { qryGuarnicoes: TIBQuery; }
    qryGuarnicoesCODIGO.ClassName; { qryGuarnicoesCODIGO: TIBStringField; }
    qryGuarnicoesDESCRICAO.ClassName; { qryGuarnicoesDESCRICAO: TIBStringField; }
    dsGuarnicoes.ClassName; { dsGuarnicoes: TDataSource; }
    updGuarnicoes.ClassName; { updGuarnicoes: TIBUpdateSQL; }
    qryMapaMesasSalao.ClassName; { qryMapaMesasSalao: TIBQuery; }
    dsMapaMesasSalao.ClassName; { dsMapaMesasSalao: TDataSource; }
    qryProjecaoReceitaRD.ClassName; { qryProjecaoReceitaRD: TIBQuery; }
    qryProjecaoReceitaRDDATA.ClassName; { qryProjecaoReceitaRDDATA: TDateField; }
    qryProjecaoReceitaRDPROJECAO.ClassName; { qryProjecaoReceitaRDPROJECAO: TFloatField; }
    qryProjecaoReceitaRDREPROJECAO.ClassName; { qryProjecaoReceitaRDREPROJECAO: TFloatField; }
    qryProjecaoReceitaRDFATURAMENTO_REAL.ClassName; { qryProjecaoReceitaRDFATURAMENTO_REAL: TFloatField; }
    qryProjecaoReceitaRDDIA.ClassName; { qryProjecaoReceitaRDDIA: TIBStringField; }
    dsProjecaoReceitaRD.ClassName; { dsProjecaoReceitaRD: TDataSource; }
    updQryProjecaoReceitasRD.ClassName; { updQryProjecaoReceitasRD: TIBUpdateSQL; }
    qryProjecaoDespesasRD.ClassName; { qryProjecaoDespesasRD: TIBQuery; }
    qryProjecaoDespesasRDRESULTADO.ClassName; { qryProjecaoDespesasRDRESULTADO: TSmallintField; }
    qryProjecaoDespesasRDMES.ClassName; { qryProjecaoDespesasRDMES: TSmallintField; }
    qryProjecaoDespesasRDANO.ClassName; { qryProjecaoDespesasRDANO: TSmallintField; }
    qryProjecaoDespesasRDCOD_GRUPO.ClassName; { qryProjecaoDespesasRDCOD_GRUPO: TIBStringField; }
    qryProjecaoDespesasRDNIVEL.ClassName; { qryProjecaoDespesasRDNIVEL: TSmallintField; }
    qryProjecaoDespesasRDDESCRICAO.ClassName; { qryProjecaoDespesasRDDESCRICAO: TIBStringField; }
    qryProjecaoDespesasRDPROJECAO_INICIAL.ClassName; { qryProjecaoDespesasRDPROJECAO_INICIAL: TFloatField; }
    qryProjecaoDespesasRDPERC_PROJ_FAT.ClassName; { qryProjecaoDespesasRDPERC_PROJ_FAT: TIBBCDField; }
    qryProjecaoDespesasRDREPROJECAO.ClassName; { qryProjecaoDespesasRDREPROJECAO: TFloatField; }
    qryProjecaoDespesasRDPERC_REPROJ_FAT.ClassName; { qryProjecaoDespesasRDPERC_REPROJ_FAT: TIBBCDField; }
    qryProjecaoDespesasRDTOTAL.ClassName; { qryProjecaoDespesasRDTOTAL: TFloatField; }
    qryProjecaoDespesasRDPERC_FAT_REAL.ClassName; { qryProjecaoDespesasRDPERC_FAT_REAL: TIBBCDField; }
    qryProjecaoDespesasRDSALDO.ClassName; { qryProjecaoDespesasRDSALDO: TFloatField; }
    qryProjecaoDespesasRDPERC_GERAL.ClassName; { qryProjecaoDespesasRDPERC_GERAL: TIBBCDField; }
    qryProjecaoDespesasRDPERC_GRUPO_PAI.ClassName; { qryProjecaoDespesasRDPERC_GRUPO_PAI: TIBBCDField; }
    qryProjecaoDespesasRDPROJ_FAT_MES.ClassName; { qryProjecaoDespesasRDPROJ_FAT_MES: TFloatField; }
    qryProjecaoDespesasRDREPROJ_FAT_MES.ClassName; { qryProjecaoDespesasRDREPROJ_FAT_MES: TFloatField; }
    qryProjecaoDespesasRDFAT_REAL_MES.ClassName; { qryProjecaoDespesasRDFAT_REAL_MES: TFloatField; }
    dsQryProjecaoDespesasRD.ClassName; { dsQryProjecaoDespesasRD: TDataSource; }
    updQryProjecaoDespesasRD.ClassName; { updQryProjecaoDespesasRD: TIBUpdateSQL; }
    qryComparaProdutosNFE.ClassName; { qryComparaProdutosNFE: TIBQuery; }
    qryComparaProdutosNFECNPJ_FORNECEDOR.ClassName; { qryComparaProdutosNFECNPJ_FORNECEDOR: TIBStringField; }
    qryComparaProdutosNFECOD_PROD_FORNECEDOR.ClassName; { qryComparaProdutosNFECOD_PROD_FORNECEDOR: TIBStringField; }
    qryComparaProdutosNFECOD_PRODUTO_INTERNO.ClassName; { qryComparaProdutosNFECOD_PRODUTO_INTERNO: TIBStringField; }
    qryComparaProdutosNFECFOP_ENTRADA.ClassName; { qryComparaProdutosNFECFOP_ENTRADA: TIBStringField; }
    qryComparaProdutosNFECST_ENTRADA.ClassName; { qryComparaProdutosNFECST_ENTRADA: TIBStringField; }
    qryComparaProdutosNFEUNIDADE_ENTRADA.ClassName; { qryComparaProdutosNFEUNIDADE_ENTRADA: TIBStringField; }
    qryComparaProdutosNFEFATOR_CONVERSAO.ClassName; { qryComparaProdutosNFEFATOR_CONVERSAO: TIBBCDField; }
    qryComparaProdutosNFEOPERACAO.ClassName; { qryComparaProdutosNFEOPERACAO: TSmallintField; }
    qryComparaProdutosNFECFOP_FORNECEDOR.ClassName; { qryComparaProdutosNFECFOP_FORNECEDOR: TIBStringField; }
    qryComparaProdutosNFECST_FORNECEDOR.ClassName; { qryComparaProdutosNFECST_FORNECEDOR: TIBStringField; }
    qryComparaProdutosNFENCM.ClassName; { qryComparaProdutosNFENCM: TIBStringField; }
    qryComparaProdutosNFEDESCRICAO_FORNECEDOR.ClassName; { qryComparaProdutosNFEDESCRICAO_FORNECEDOR: TIBStringField; }
    qryComparaProdutosNFEUNIDADE_COMERCIALIZADA.ClassName; { qryComparaProdutosNFEUNIDADE_COMERCIALIZADA: TIBStringField; }
    qryComparaProdutosNFEULTIMA_CHAVE.ClassName; { qryComparaProdutosNFEULTIMA_CHAVE: TIBStringField; }
    qryComparaProdutosNFEDESCRICAO.ClassName; { qryComparaProdutosNFEDESCRICAO: TIBStringField; }
    qryComparaProdutosNFERAZAO_SOCIAL.ClassName; { qryComparaProdutosNFERAZAO_SOCIAL: TIBStringField; }
    qryComparaProdutosNFEDESCRICAO_UNIDADE.ClassName; { qryComparaProdutosNFEDESCRICAO_UNIDADE: TIBStringField; }
    qryComparaProdutosNFECOD_GRUPO.ClassName; { qryComparaProdutosNFECOD_GRUPO: TIBStringField; }
    qryComparaProdutosNFEGRUPO_ASSOCIADO.ClassName; { qryComparaProdutosNFEGRUPO_ASSOCIADO: TIBStringField; }
    dsQryComparaProdutosNFE.ClassName; { dsQryComparaProdutosNFE: TDataSource; }
    qryCsProdEtiquetas.ClassName; { qryCsProdEtiquetas: TIBQuery; }
    qryCsProdEtiquetasCOD_PRODUTO.ClassName; { qryCsProdEtiquetasCOD_PRODUTO: TIBStringField; }
    qryCsProdEtiquetasDESCRICAO.ClassName; { qryCsProdEtiquetasDESCRICAO: TIBStringField; }
    qryCsProdEtiquetasVALOR_UNITARIO.ClassName; { qryCsProdEtiquetasVALOR_UNITARIO: TIBBCDField; }
    qryCsProdEtiquetasCOD_GRUPO.ClassName; { qryCsProdEtiquetasCOD_GRUPO: TIBStringField; }
    qryCsProdEtiquetasCAMINHO_FOTO.ClassName; { qryCsProdEtiquetasCAMINHO_FOTO: TIBStringField; }
    dsQryCsProdEtiquetas.ClassName; { dsQryCsProdEtiquetas: TDataSource; }
    tbLancamentosRDTEMP.ClassName; { tbLancamentosRDTEMP: TRxMemoryData; }
    tbLancamentosRDTEMPCOD_GRUPO.ClassName; { tbLancamentosRDTEMPCOD_GRUPO: TStringField; }
    tbLancamentosRDTEMPvalor.ClassName; { tbLancamentosRDTEMPvalor: TCurrencyField; }
    tbLancamentosRDTEMPdescricao.ClassName; { tbLancamentosRDTEMPdescricao: TStringField; }
    dsLancamentosRDTemp.ClassName; { dsLancamentosRDTemp: TDataSource; }
    qryLancamentosRD.ClassName; { qryLancamentosRD: TIBQuery; }
    qryLancamentosRDCODIGO.ClassName; { qryLancamentosRDCODIGO: TIBStringField; }
    qryLancamentosRDCOD_FORNECEDOR.ClassName; { qryLancamentosRDCOD_FORNECEDOR: TIBStringField; }
    qryLancamentosRDNUM_DOC.ClassName; { qryLancamentosRDNUM_DOC: TIBStringField; }
    qryLancamentosRDDATA_LANCAMENTO.ClassName; { qryLancamentosRDDATA_LANCAMENTO: TDateTimeField; }
    qryLancamentosRDDATA_DOCUMENTO.ClassName; { qryLancamentosRDDATA_DOCUMENTO: TDateField; }
    qryLancamentosRDDATA_RD.ClassName; { qryLancamentosRDDATA_RD: TDateField; }
    qryLancamentosRDOBSERVACOES.ClassName; { qryLancamentosRDOBSERVACOES: TIBStringField; }
    qryLancamentosRDRAZAO_SOCIAL.ClassName; { qryLancamentosRDRAZAO_SOCIAL: TIBStringField; }
    qryLancamentosRDNOME_USUARIO.ClassName; { qryLancamentosRDNOME_USUARIO: TIBStringField; }
    updQryLancamentosRD.ClassName; { updQryLancamentosRD: TIBUpdateSQL; }
    dsQryLancamentosRD.ClassName; { dsQryLancamentosRD: TDataSource; }
    ACBrPosPrinter1.ClassName; { ACBrPosPrinter1: TACBrPosPrinter; }
    procGeraInutilizacoes.ClassName; { procGeraInutilizacoes: TIBStoredProc; }
    dsQryVendasCaixa.ClassName; { dsQryVendasCaixa: TDataSource; }
    JvVigenereCipher1.ClassName; { JvVigenereCipher1: TJvVigenereCipher; }
    sat.ClassName; { sat: TACBrSAT; }
    extratoSat.ClassName; { extratoSat: TACBrSATExtratoESCPOS; }
    ACBrTEFD1.ClassName; { ACBrTEFD1: TACBrTEFD; }
    fdRestaurante.ClassName; { fdRestaurante: TFDConnection; }
    qryVendasCanceladas.ClassName; { qryVendasCanceladas: TIBQuery; }
    qryVendasCanceladasCOD_VENDA.ClassName; { qryVendasCanceladasCOD_VENDA: TIBStringField; }
    qryVendasCanceladasDATA.ClassName; { qryVendasCanceladasDATA: TDateField; }
    qryVendasCanceladasHORA.ClassName; { qryVendasCanceladasHORA: TTimeField; }
    qryVendasCanceladasDATA_SO.ClassName; { qryVendasCanceladasDATA_SO: TDateField; }
    qryVendasCanceladasDATA_ECF.ClassName; { qryVendasCanceladasDATA_ECF: TDateField; }
    qryVendasCanceladasHORA_ECF.ClassName; { qryVendasCanceladasHORA_ECF: TTimeField; }
    qryVendasCanceladasVALOR_BRUTO.ClassName; { qryVendasCanceladasVALOR_BRUTO: TIBBCDField; }
    qryVendasCanceladasVALOR_DESCONTO.ClassName; { qryVendasCanceladasVALOR_DESCONTO: TIBBCDField; }
    qryVendasCanceladasVALOR_TXSERV.ClassName; { qryVendasCanceladasVALOR_TXSERV: TIBBCDField; }
    qryVendasCanceladasVALOR_TOTAL.ClassName; { qryVendasCanceladasVALOR_TOTAL: TIBBCDField; }
    qryVendasCanceladasTOTAL_PAGO.ClassName; { qryVendasCanceladasTOTAL_PAGO: TIBBCDField; }
    qryVendasCanceladasVALOR_TROCO.ClassName; { qryVendasCanceladasVALOR_TROCO: TIBBCDField; }
    qryVendasCanceladasCOD_USUARIO.ClassName; { qryVendasCanceladasCOD_USUARIO: TIBStringField; }
    qryVendasCanceladasNUMERO_CAIXA.ClassName; { qryVendasCanceladasNUMERO_CAIXA: TIBStringField; }
    qryVendasCanceladasMESA.ClassName; { qryVendasCanceladasMESA: TIBStringField; }
    qryVendasCanceladasIMP.ClassName; { qryVendasCanceladasIMP: TSmallintField; }
    qryVendasCanceladasCOD_CAIXA.ClassName; { qryVendasCanceladasCOD_CAIXA: TIBStringField; }
    qryVendasCanceladasTIPO_VENDA.ClassName; { qryVendasCanceladasTIPO_VENDA: TSmallintField; }
    qryVendasCanceladasCOD_PEDIDO_DELIVERY.ClassName; { qryVendasCanceladasCOD_PEDIDO_DELIVERY: TIBStringField; }
    qryVendasCanceladasCOO_CUPOM.ClassName; { qryVendasCanceladasCOO_CUPOM: TIBStringField; }
    qryVendasCanceladasQTDE_PESSOAS.ClassName; { qryVendasCanceladasQTDE_PESSOAS: TSmallintField; }
    qryVendasCanceladasVALOR_TX_ENTREGA.ClassName; { qryVendasCanceladasVALOR_TX_ENTREGA: TIBBCDField; }
    qryVendasCanceladasREDUCAO_Z.ClassName; { qryVendasCanceladasREDUCAO_Z: TIntegerField; }
    qryVendasCanceladasSELECIONADO.ClassName; { qryVendasCanceladasSELECIONADO: TSmallintField; }
    qryVendasCanceladasDESCONTO_TAXAS.ClassName; { qryVendasCanceladasDESCONTO_TAXAS: TFMTBCDField; }
    qryVendasCanceladasCHAVE_NFCE.ClassName; { qryVendasCanceladasCHAVE_NFCE: TIBStringField; }
    qryVendasCanceladasNUMERO_NFCE.ClassName; { qryVendasCanceladasNUMERO_NFCE: TIntegerField; }
    qryVendasCanceladasSERIE_NFCE.ClassName; { qryVendasCanceladasSERIE_NFCE: TSmallintField; }
    qryVendasCanceladasPROTOCOLO_NFCE.ClassName; { qryVendasCanceladasPROTOCOLO_NFCE: TIBStringField; }
    qryVendasCanceladasRECIBO_NFCE.ClassName; { qryVendasCanceladasRECIBO_NFCE: TIBStringField; }
    qryVendasCanceladasOBS_NFCE.ClassName; { qryVendasCanceladasOBS_NFCE: TIBStringField; }
    qryVendasCanceladasCONSULTA_OK.ClassName; { qryVendasCanceladasCONSULTA_OK: TSmallintField; }
    qryVendasCanceladasCOD_EMPRESA.ClassName; { qryVendasCanceladasCOD_EMPRESA: TIBStringField; }
    qryVendasCanceladasPERCENTUAL_DESCONTO.ClassName; { qryVendasCanceladasPERCENTUAL_DESCONTO: TFMTBCDField; }
    qryVendasCanceladasLOTE_EXPORTACAO_WEB.ClassName; { qryVendasCanceladasLOTE_EXPORTACAO_WEB: TLargeintField; }
    qryVendasCanceladasCOD_GARCON_ABRIU.ClassName; { qryVendasCanceladasCOD_GARCON_ABRIU: TIBStringField; }
    qryVendasCanceladasMODELO_COMPROVANTE.ClassName; { qryVendasCanceladasMODELO_COMPROVANTE: TSmallintField; }
    qryVendasCanceladasCOD_FORNECEDOR.ClassName; { qryVendasCanceladasCOD_FORNECEDOR: TIBStringField; }
    qryVendasCanceladasSESSAO_SAT.ClassName; { qryVendasCanceladasSESSAO_SAT: TLargeintField; }
    qryVendasCanceladasCNF_SAT.ClassName; { qryVendasCanceladasCNF_SAT: TLargeintField; }
    qryVendasCanceladasXML_DOC.ClassName; { qryVendasCanceladasXML_DOC: TWideMemoField; }
    qryVendasCanceladasCNPJ_CPF_CLIENTE_NF.ClassName; { qryVendasCanceladasCNPJ_CPF_CLIENTE_NF: TIBStringField; }
    qryVendasCanceladasNOME_CLIENTE_NF.ClassName; { qryVendasCanceladasNOME_CLIENTE_NF: TIBStringField; }
    qryVendasCanceladasTENTATIVAS_ENVIO_NFCE.ClassName; { qryVendasCanceladasTENTATIVAS_ENVIO_NFCE: TSmallintField; }
    qryVendasCanceladasTEMPO_EMISSAO_NFCE.ClassName; { qryVendasCanceladasTEMPO_EMISSAO_NFCE: TSmallintField; }
    updVendasCanceladas.ClassName; { updVendasCanceladas: TIBUpdateSQL; }
    qryConsultaProdutos.ClassName; { qryConsultaProdutos: TIBQuery; }
    qryConsultaProdutosCOD_BARRAS.ClassName; { qryConsultaProdutosCOD_BARRAS: TIBStringField; }
    qryConsultaProdutosDESCRICAO.ClassName; { qryConsultaProdutosDESCRICAO: TIBStringField; }
    qryConsultaProdutosVALOR_UNITARIO.ClassName; { qryConsultaProdutosVALOR_UNITARIO: TIBBCDField; }
    qryConsultaProdutosCOD_GRUPO.ClassName; { qryConsultaProdutosCOD_GRUPO: TIBStringField; }
    qryConsultaProdutosCOD_PRODUTO.ClassName; { qryConsultaProdutosCOD_PRODUTO: TIBStringField; }
    qryConsultaProdutosGRUPO.ClassName; { qryConsultaProdutosGRUPO: TIBStringField; }
    qryConsultaProdutosCOD_GRUPO_RAIZ.ClassName; { qryConsultaProdutosCOD_GRUPO_RAIZ: TIBStringField; }
    qryConsultaProdutosDESC_GRUPO_RAIZ.ClassName; { qryConsultaProdutosDESC_GRUPO_RAIZ: TIBStringField; }
    qryConsultaProdutosCOD_GRUPO_PAI.ClassName; { qryConsultaProdutosCOD_GRUPO_PAI: TIBStringField; }
    qryConsultaProdutosDESC_GRUPO.ClassName; { qryConsultaProdutosDESC_GRUPO: TIBStringField; }
    qryConsultaProdutosQUANTIDADE.ClassName; { qryConsultaProdutosQUANTIDADE: TIBBCDField; }
    qryConsultaProdutosQTDFRACAO.ClassName; { qryConsultaProdutosQTDFRACAO: TFloatField; }
    qryConsultaProdutosESTOQUE.ClassName; { qryConsultaProdutosESTOQUE: TIBStringField; }
    qryConsultaProdutosPRECOPADRAO.ClassName; { qryConsultaProdutosPRECOPADRAO: TIBBCDField; }
    dsConsultaProdutos.ClassName; { dsConsultaProdutos: TDataSource; }
    qryEstrutura.ClassName; { qryEstrutura: TIBQuery; }
    ExeInfo1.ClassName; { ExeInfo1: TExeInfo; }
    dsTbFormasPagamento.ClassName; { dsTbFormasPagamento: TDataSource; }
    ACBrInStore1.ClassName; { ACBrInStore1: TACBrInStore; }
    qryMovimentoMesa.ClassName; { qryMovimentoMesa: TIBQuery; }
    dsQryMovimentoMesa.ClassName; { dsQryMovimentoMesa: TDataSource; }
    dsQryMovimentoMesaResumido.ClassName; { dsQryMovimentoMesaResumido: TDataSource; }
    balanca2.ClassName; { balanca2: TACBrBAL; }
    balanca.ClassName; { balanca: TACBrBAL; }
    ead.ClassName; { ead: TACBrEAD; }
    ACBrGAV1.ClassName; { ACBrGAV1: TACBrGAV; }
    qryConfigPDVS.ClassName; { qryConfigPDVS: TIBQuery; }
    qryConfigPDVSNUMERO_CAIXA.ClassName; { qryConfigPDVSNUMERO_CAIXA: TIBStringField; }
    qryConfigPDVSSERIE_NFCE_NORMAL.ClassName; { qryConfigPDVSSERIE_NFCE_NORMAL: TIntegerField; }
    qryConfigPDVSNUMERO_NFCE_NORMAL.ClassName; { qryConfigPDVSNUMERO_NFCE_NORMAL: TIntegerField; }
    qryConfigPDVSNUMERO_NFCE_NORMAL_HOMOLOGACAO.ClassName; { qryConfigPDVSNUMERO_NFCE_NORMAL_HOMOLOGACAO: TIntegerField; }
    dsConfigPDVS.ClassName; { dsConfigPDVS: TDataSource; }
    updQryConfigPDVS.ClassName; { updQryConfigPDVS: TIBUpdateSQL; }
    qryErrosInutilizacao.ClassName; { qryErrosInutilizacao: TIBQuery; }
    dsQryErrosInutilizacoes.ClassName; { dsQryErrosInutilizacoes: TDataSource; }
    tbCsClientesDelivery.ClassName; { tbCsClientesDelivery: TFDMemTable; }
    memTbPermissoes.ClassName; { memTbPermissoes: TFDMemTable; }
    IdThreadComponent1.ClassName; { IdThreadComponent1: TIdThreadComponent; }
    acbrCTE.ClassName; { acbrCTE: TACBrCTe; }
    danfeCTE.ClassName; { danfeCTE: TACBrCTeDACTEFR; }
    tbTamanhosPizzaReajuste.ClassName; { tbTamanhosPizzaReajuste: TFDMemTable; }
    dsSaboresPizzaReajuste.ClassName; { dsSaboresPizzaReajuste: TDataSource; }
    tbSaboresPizzaReajuste.ClassName; { tbSaboresPizzaReajuste: TFDMemTable; }
    folderDialog.ClassName; { folderDialog: TJvBrowseForFolderDialog; }
    ACBrMail1.ClassName; { ACBrMail1: TACBrMail; }
    tbFormasPagamento.ClassName; { tbFormasPagamento: TFDMemTable; }
    qryEmpresas.ClassName; { qryEmpresas: TFDQuery; }
    qryEmpresasCOD_EMPRESA.ClassName; { qryEmpresasCOD_EMPRESA: TStringField; }
    qryEmpresasDESCRICAO_EMPRESA.ClassName; { qryEmpresasDESCRICAO_EMPRESA: TStringField; }
    dsQryEmpresas.ClassName; { dsQryEmpresas: TDataSource; }
    tbGruposCombo.ClassName; { tbGruposCombo: TFDMemTable; }
    qryProdutosAdicionais.ClassName; { qryProdutosAdicionais: TFDQuery; }
    qryProdutosAdicionaisID.ClassName; { qryProdutosAdicionaisID: TLargeintField; }
    qryProdutosAdicionaisCOD_PRODUTO.ClassName; { qryProdutosAdicionaisCOD_PRODUTO: TStringField; }
    qryProdutosAdicionaisDESCRICAO.ClassName; { qryProdutosAdicionaisDESCRICAO: TStringField; }
    qryProdutosAdicionaisVALOR.ClassName; { qryProdutosAdicionaisVALOR: TBCDField; }
    qryProdutosAdicionaisID_GRUPO.ClassName; { qryProdutosAdicionaisID_GRUPO: TLargeintField; }
    dsQryProdutosAdicionais.ClassName; { dsQryProdutosAdicionais: TDataSource; }
    tbAdquirentesTemp.ClassName; { tbAdquirentesTemp: TFDMemTable; }
    dsTbAdquirentesTemp.ClassName; { dsTbAdquirentesTemp: TDataSource; }
    danfeESCPos.ClassName; { danfeESCPos: TACBrNFeDANFeESCPOS; }
    danfeFR.ClassName; { danfeFR: TACBrNFeDANFCEFR; }
    ACBrNFe1.ClassName; { ACBrNFe1: TACBrNFe; }
    ACBrNFeDANFEFR1.ClassName; { ACBrNFeDANFEFR1: TACBrNFeDANFEFR; }
    tbMovimentoMesa.ClassName; { tbMovimentoMesa: TFDMemTable; }
    dsTbMovimentoMesa.ClassName; { dsTbMovimentoMesa: TDataSource; }
    qryVendasCaixa.ClassName; { qryVendasCaixa: TFDQuery; }
  end;

{ frm_principal: Tfrm_principal }
  with Tfrm_principal(nil) do { uu_frm_principal.pas }
  begin
    memoFormatacaoDelivery.ClassName; { memoFormatacaoDelivery: TMemo; }
    memo_avisos.ClassName; { memo_avisos: TMemo; }
    memoChavePrivada.ClassName; { memoChavePrivada: TMemo; }
    memoChavePublica.ClassName; { memoChavePublica: TMemo; }
    WBResposta.ClassName; { WBResposta: TWebBrowser; }
    memo1.ClassName; { memo1: TMemo; }
    memoPagamentosTEF.ClassName; { memoPagamentosTEF: TMemo; }
    memoObsMiniprinter.ClassName; { memoObsMiniprinter: TMemo; }
    Panel2.ClassName; { Panel2: TPanel; }
    lbNomeEmpresa.ClassName; { lbNomeEmpresa: TLabel; }
    lbIpLocal.ClassName; { lbIpLocal: TLabel; }
    lbNumeroEstacao.ClassName; { lbNumeroEstacao: TLabel; }
    lbIpDoServidor.ClassName; { lbIpDoServidor: TLabel; }
    lbNumeroLicenca.ClassName; { lbNumeroLicenca: TLabel; }
    lbVersao.ClassName; { lbVersao: TLabel; }
    lbNomeUsuario.ClassName; { lbNomeUsuario: TLabel; }
    imgFundo.ClassName; { imgFundo: TImage; }
    AdvOfficeImage2.ClassName; { AdvOfficeImage2: TAdvOfficeImage; }
    Image3.ClassName; { Image3: TImage; }
    Image4.ClassName; { Image4: TImage; }
    Image5.ClassName; { Image5: TImage; }
    Image6.ClassName; { Image6: TImage; }
    AdvOfficeImage1.ClassName; { AdvOfficeImage1: TAdvOfficeImage; }
    lbDescricaoEmpresa.ClassName; { lbDescricaoEmpresa: TLabel; }
    Panel1.ClassName; { Panel1: TPanel; }
    lbDataDoSistema.ClassName; { lbDataDoSistema: TLabel; }
    Label1.ClassName; { Label1: TLabel; }
    Image1.ClassName; { Image1: TImage; }
    Panel4.ClassName; { Panel4: TPanel; }
    Panel5.ClassName; { Panel5: TPanel; }
    Image2.ClassName; { Image2: TImage; }
    lbCaptionCertificado.ClassName; { lbCaptionCertificado: TLabel; }
    lbDiasExpiracaoCertificado.ClassName; { lbDiasExpiracaoCertificado: TLabel; }
    Panel6.ClassName; { Panel6: TPanel; }
    pnLicenca.ClassName; { pnLicenca: TPanel; }
    imgLicenca.ClassName; { imgLicenca: TImage; }
    Label2.ClassName; { Label2: TLabel; }
    lbDataExpiracaoSerial.ClassName; { lbDataExpiracaoSerial: TLabel; }
    Panel7.ClassName; { Panel7: TPanel; }
    Panel3.ClassName; { Panel3: TPanel; }
    Label4.ClassName; { Label4: TLabel; }
    PngSpeedButton1.ClassName; { PngSpeedButton1: TPngSpeedButton; }
    PngSpeedButton2.ClassName; { PngSpeedButton2: TPngSpeedButton; }
    PngSpeedButton3.ClassName; { PngSpeedButton3: TPngSpeedButton; }
    PngSpeedButton4.ClassName; { PngSpeedButton4: TPngSpeedButton; }
    PngSpeedButton5.ClassName; { PngSpeedButton5: TPngSpeedButton; }
    PngSpeedButton6.ClassName; { PngSpeedButton6: TPngSpeedButton; }
    MainMenu1.ClassName; { MainMenu1: TAdvMainMenu; }
    I10000000.ClassName; { I10000000: TMenuItem; }
    I10001000.ClassName; { I10001000: TMenuItem; }
    I10002001.ClassName; { I10002001: TMenuItem; }
    I10003000.ClassName; { I10003000: TMenuItem; }
    I10019000.ClassName; { I10019000: TMenuItem; }
    I10004000.ClassName; { I10004000: TMenuItem; }
    I10004001.ClassName; { I10004001: TMenuItem; }
    I10004004.ClassName; { I10004004: TMenuItem; }
    I10004005.ClassName; { I10004005: TMenuItem; }
    I10006000.ClassName; { I10006000: TMenuItem; }
    fghfg.ClassName; { fghfg: TMenuItem; }
    I10008000.ClassName; { I10008000: TMenuItem; }
    I10014000.ClassName; { I10014000: TMenuItem; }
    I10020000.ClassName; { I10020000: TMenuItem; }
    I10009000.ClassName; { I10009000: TMenuItem; }
    I10010000.ClassName; { I10010000: TMenuItem; }
    I10011000.ClassName; { I10011000: TMenuItem; }
    I10012000.ClassName; { I10012000: TMenuItem; }
    I10016000.ClassName; { I10016000: TMenuItem; }
    I10016001.ClassName; { I10016001: TMenuItem; }
    I10016002.ClassName; { I10016002: TMenuItem; }
    I10017000.ClassName; { I10017000: TMenuItem; }
    I10021000.ClassName; { I10021000: TMenuItem; }
    I10018000.ClassName; { I10018000: TMenuItem; }
    I10018001.ClassName; { I10018001: TMenuItem; }
    I10015000.ClassName; { I10015000: TMenuItem; }
    I10013000.ClassName; { I10013000: TMenuItem; }
    I10013001.ClassName; { I10013001: TMenuItem; }
    I10013005.ClassName; { I10013005: TMenuItem; }
    N1.ClassName; { N1: TMenuItem; }
    Nmenu_sair.ClassName; { Nmenu_sair: TMenuItem; }
    I20000000.ClassName; { I20000000: TMenuItem; }
    I20001001.ClassName; { I20001001: TMenuItem; }
    I20001002.ClassName; { I20001002: TMenuItem; }
    I20001003.ClassName; { I20001003: TMenuItem; }
    I20001004.ClassName; { I20001004: TMenuItem; }
    I20001008.ClassName; { I20001008: TMenuItem; }
    I20001015.ClassName; { I20001015: TMenuItem; }
    I40000000.ClassName; { I40000000: TMenuItem; }
    I40001001.ClassName; { I40001001: TMenuItem; }
    I40007001.ClassName; { I40007001: TMenuItem; }
    I40002001.ClassName; { I40002001: TMenuItem; }
    I40006001.ClassName; { I40006001: TMenuItem; }
    I40008001.ClassName; { I40008001: TMenuItem; }
    I40005001.ClassName; { I40005001: TMenuItem; }
    I80000000.ClassName; { I80000000: TMenuItem; }
    I80001000.ClassName; { I80001000: TMenuItem; }
    I80001001.ClassName; { I80001001: TMenuItem; }
    I80001005.ClassName; { I80001005: TMenuItem; }
    I80003000.ClassName; { I80003000: TMenuItem; }
    I80003001.ClassName; { I80003001: TMenuItem; }
    A1.ClassName; { A1: TMenuItem; }
    I80002000.ClassName; { I80002000: TMenuItem; }
    I80002002.ClassName; { I80002002: TMenuItem; }
    I80002003.ClassName; { I80002003: TMenuItem; }
    I80002004.ClassName; { I80002004: TMenuItem; }
    I80002005.ClassName; { I80002005: TMenuItem; }
    I60000000.ClassName; { I60000000: TMenuItem; }
    I60001000.ClassName; { I60001000: TMenuItem; }
    I60001001.ClassName; { I60001001: TMenuItem; }
    I60001002.ClassName; { I60001002: TMenuItem; }
    I60002000.ClassName; { I60002000: TMenuItem; }
    I60002001.ClassName; { I60002001: TMenuItem; }
    I60002002.ClassName; { I60002002: TMenuItem; }
    I60003001.ClassName; { I60003001: TMenuItem; }
    I60004000.ClassName; { I60004000: TMenuItem; }
    I60004001.ClassName; { I60004001: TMenuItem; }
    I60004002.ClassName; { I60004002: TMenuItem; }
    I60004003.ClassName; { I60004003: TMenuItem; }
    I60004004.ClassName; { I60004004: TMenuItem; }
    I60006001.ClassName; { I60006001: TMenuItem; }
    I60007001.ClassName; { I60007001: TMenuItem; }
    I60008001.ClassName; { I60008001: TMenuItem; }
    I60009001.ClassName; { I60009001: TMenuItem; }
    I60010001.ClassName; { I60010001: TMenuItem; }
    I60011001.ClassName; { I60011001: TMenuItem; }
    USURIOS1.ClassName; { USURIOS1: TMenuItem; }
    I60012001.ClassName; { I60012001: TMenuItem; }
    I70000000.ClassName; { I70000000: TMenuItem; }
    I70002000.ClassName; { I70002000: TMenuItem; }
    I70002030.ClassName; { I70002030: TMenuItem; }
    I70002031.ClassName; { I70002031: TMenuItem; }
    N3.ClassName; { N3: TMenuItem; }
    I70002001.ClassName; { I70002001: TMenuItem; }
    I70002003.ClassName; { I70002003: TMenuItem; }
    I70002002.ClassName; { I70002002: TMenuItem; }
    I70002005.ClassName; { I70002005: TMenuItem; }
    I70002006.ClassName; { I70002006: TMenuItem; }
    N4.ClassName; { N4: TMenuItem; }
    I70002010.ClassName; { I70002010: TMenuItem; }
    I70004000.ClassName; { I70004000: TMenuItem; }
    I70004001.ClassName; { I70004001: TMenuItem; }
    I70004005.ClassName; { I70004005: TMenuItem; }
    I70004002.ClassName; { I70004002: TMenuItem; }
    I70004004.ClassName; { I70004004: TMenuItem; }
    I70004003.ClassName; { I70004003: TMenuItem; }
    I70013000.ClassName; { I70013000: TMenuItem; }
    I70013001.ClassName; { I70013001: TMenuItem; }
    I70013002.ClassName; { I70013002: TMenuItem; }
    I70005000.ClassName; { I70005000: TMenuItem; }
    I70005001.ClassName; { I70005001: TMenuItem; }
    I70005002.ClassName; { I70005002: TMenuItem; }
    I70005003.ClassName; { I70005003: TMenuItem; }
    I70006000.ClassName; { I70006000: TMenuItem; }
    I70006001.ClassName; { I70006001: TMenuItem; }
    I70006002.ClassName; { I70006002: TMenuItem; }
    I70006003.ClassName; { I70006003: TMenuItem; }
    I70007000.ClassName; { I70007000: TMenuItem; }
    I70007001.ClassName; { I70007001: TMenuItem; }
    I70007003.ClassName; { I70007003: TMenuItem; }
    I70007002.ClassName; { I70007002: TMenuItem; }
    I70007004.ClassName; { I70007004: TMenuItem; }
    I70007005.ClassName; { I70007005: TMenuItem; }
    I70007006.ClassName; { I70007006: TMenuItem; }
    I70003000.ClassName; { I70003000: TMenuItem; }
    I70003001.ClassName; { I70003001: TMenuItem; }
    I70003002.ClassName; { I70003002: TMenuItem; }
    I70003003.ClassName; { I70003003: TMenuItem; }
    I70003004.ClassName; { I70003004: TMenuItem; }
    I70008000.ClassName; { I70008000: TMenuItem; }
    I70008001.ClassName; { I70008001: TMenuItem; }
    I70008005.ClassName; { I70008005: TMenuItem; }
    C1.ClassName; { C1: TMenuItem; }
    I70010000.ClassName; { I70010000: TMenuItem; }
    I70010015.ClassName; { I70010015: TMenuItem; }
    I70010020.ClassName; { I70010020: TMenuItem; }
    I70010021.ClassName; { I70010021: TMenuItem; }
    I70009000.ClassName; { I70009000: TMenuItem; }
    I70009001.ClassName; { I70009001: TMenuItem; }
    I70009002.ClassName; { I70009002: TMenuItem; }
    I70020000.ClassName; { I70020000: TMenuItem; }
    I70020001.ClassName; { I70020001: TMenuItem; }
    I70020002.ClassName; { I70020002: TMenuItem; }
    I70020003.ClassName; { I70020003: TMenuItem; }
    I70020004.ClassName; { I70020004: TMenuItem; }
    I70020005.ClassName; { I70020005: TMenuItem; }
    I70011000.ClassName; { I70011000: TMenuItem; }
    I70011001.ClassName; { I70011001: TMenuItem; }
    I70011002.ClassName; { I70011002: TMenuItem; }
    I70011003.ClassName; { I70011003: TMenuItem; }
    I70012001.ClassName; { I70012001: TMenuItem; }
    I99000000.ClassName; { I99000000: TMenuItem; }
    I99000001c1.ClassName; { I99000001c1: TMenuItem; }
    I99000002.ClassName; { I99000002: TMenuItem; }
    I99000003.ClassName; { I99000003: TMenuItem; }
    estes1.ClassName; { estes1: TMenuItem; }
    serial.ClassName; { serial: TOgDaysCode; }
    OgMakeKeys1.ClassName; { OgMakeKeys1: TOgMakeKeys; }
    timerVerificaLicenca.ClassName; { timerVerificaLicenca: TTimer; }
    verificaAlteracaoRelogio.ClassName; { verificaAlteracaoRelogio: TTimer; }
    timePanelLicenca.ClassName; { timePanelLicenca: TTimer; }
    validador.ClassName; { validador: TACBrValidador; }
    escreveExtenso.ClassName; { escreveExtenso: TACBrExtenso; }
    infoPC.ClassName; { infoPC: TJvComputerInfoEx; }
  end;

{ frm_consulta_produtos: Tfrm_consulta_produtos }
  with Tfrm_consulta_produtos(nil) do { uu_cs_produtos.pas }
  begin
    Panel2.ClassName; { Panel2: TPanel; }
    btSelecionar.ClassName; { btSelecionar: TAdvGlassButton; }
    btSair.ClassName; { btSair: TAdvGlassButton; }
    Panel3.ClassName; { Panel3: TPanel; }
    Panel4.ClassName; { Panel4: TPanel; }
    Label3.ClassName; { Label3: TLabel; }
    SpeedButton1.ClassName; { SpeedButton1: TSpeedButton; }
    ed_descricao_produto.ClassName; { ed_descricao_produto: TEdit; }
    Panel1.ClassName; { Panel1: TPanel; }
    lbTitulo.ClassName; { lbTitulo: TLabel; }
    Panel5.ClassName; { Panel5: TPanel; }
    pnTeclado.ClassName; { pnTeclado: TPanel; }
    AdvTouchKeyboard1.ClassName; { AdvTouchKeyboard1: TAdvTouchKeyboard; }
    JvPageList1.ClassName; { JvPageList1: TJvPageList; }
    pgTabelaPadrao.ClassName; { pgTabelaPadrao: TJvStandardPage; }
    gridTabelaPadrao.ClassName; { gridTabelaPadrao: TcxGrid; }
    gridTabelaPadraoDBTableView1.ClassName; { gridTabelaPadraoDBTableView1: TcxGridDBTableView; }
    gridTabelaPadraoDBTableView1COD_BARRAS.ClassName; { gridTabelaPadraoDBTableView1COD_BARRAS: TcxGridDBColumn; }
    s.ClassName; { s: TcxGridDBColumn; }
    gridTabelaPadraoDBTableView1Column2.ClassName; { gridTabelaPadraoDBTableView1Column2: TcxGridDBColumn; }
    gridTabelaPadraoDBTableView1Column1.ClassName; { gridTabelaPadraoDBTableView1Column1: TcxGridDBColumn; }
    gridTabelaPadraoDBTableView1VALOR_UNITARIO.ClassName; { gridTabelaPadraoDBTableView1VALOR_UNITARIO: TcxGridDBColumn; }
    gridTabelaPadraoLevel1.ClassName; { gridTabelaPadraoLevel1: TcxGridLevel; }
    pgTabelaAcessoria.ClassName; { pgTabelaAcessoria: TJvStandardPage; }
    gridTabelaAcessoria.ClassName; { gridTabelaAcessoria: TcxGrid; }
    cxGridDBTableView1.ClassName; { cxGridDBTableView1: TcxGridDBTableView; }
    cxGridDBColumn1.ClassName; { cxGridDBColumn1: TcxGridDBColumn; }
    cxGridDBColumn2.ClassName; { cxGridDBColumn2: TcxGridDBColumn; }
    cxGridDBColumn3.ClassName; { cxGridDBColumn3: TcxGridDBColumn; }
    cxGridDBColumn4.ClassName; { cxGridDBColumn4: TcxGridDBColumn; }
    cxGridDBTableView1Column1.ClassName; { cxGridDBTableView1Column1: TcxGridDBColumn; }
    cxGridDBColumn5.ClassName; { cxGridDBColumn5: TcxGridDBColumn; }
    cxGridLevel1.ClassName; { cxGridLevel1: TcxGridLevel; }
    cxStyleRepository1.ClassName; { cxStyleRepository1: TcxStyleRepository; }
    cxStyle2.ClassName; { cxStyle2: TcxStyle; }
    cxStyle1.ClassName; { cxStyle1: TcxStyle; }
    AdvPopupTouchKeyBoard1.ClassName; { AdvPopupTouchKeyBoard1: TAdvPopupTouchKeyBoard; }
    AdvSmoothPopupTouchKeyBoard1.ClassName; { AdvSmoothPopupTouchKeyBoard1: TAdvSmoothPopupTouchKeyBoard; }
    PopupMenu1.ClassName; { PopupMenu1: TPopupMenu; }
    ActionList1.ClassName; { ActionList1: TActionList; }
    actExecutaConsulta.ClassName; { actExecutaConsulta: TAction; }
  end;

{ frm_transferir_item: Tfrm_transferir_item }
  with Tfrm_transferir_item(nil) do { uu_transferir_item.pas }
  begin
    Panel3.ClassName; { Panel3: TPanel; }
    Panel5.ClassName; { Panel5: TPanel; }
    Label1.ClassName; { Label1: TLabel; }
    ed_mesa_destino.ClassName; { ed_mesa_destino: TEdit; }
    Panel4.ClassName; { Panel4: TPanel; }
    Label4.ClassName; { Label4: TLabel; }
    cmbMotivo.ClassName; { cmbMotivo: TRxDBLookupCombo; }
    Panel6.ClassName; { Panel6: TPanel; }
    Label5.ClassName; { Label5: TLabel; }
    memoObs.ClassName; { memoObs: TMemo; }
    Panel2.ClassName; { Panel2: TPanel; }
    AdvGlassButton1.ClassName; { AdvGlassButton1: TAdvGlassButton; }
    AdvGlassButton3.ClassName; { AdvGlassButton3: TAdvGlassButton; }
    Panel1.ClassName; { Panel1: TPanel; }
    lbTitulo.ClassName; { lbTitulo: TLabel; }
  end;

{ frm_transferir_mesa: Tfrm_transferir_mesa }
  with Tfrm_transferir_mesa(nil) do { uu_transferir_mesa.pas }
  begin
    Panel1.ClassName; { Panel1: TPanel; }
    lbl1.ClassName; { lbl1: TLabel; }
    lbl3.ClassName; { lbl3: TLabel; }
    pnNumeroMesa.ClassName; { pnNumeroMesa: TPanel; }
    Label1.ClassName; { Label1: TLabel; }
    edMesa.ClassName; { edMesa: TEdit; }
    pnl1.ClassName; { pnl1: TPanel; }
    lbl4.ClassName; { lbl4: TLabel; }
    edtMesaDestino.ClassName; { edtMesaDestino: TEdit; }
    Panel4.ClassName; { Panel4: TPanel; }
    DBGrid1.ClassName; { DBGrid1: TDBGrid; }
    Panel2.ClassName; { Panel2: TPanel; }
    btTransferirMesa.ClassName; { btTransferirMesa: TAdvGlassButton; }
    AdvGlassButton3.ClassName; { AdvGlassButton3: TAdvGlassButton; }
    tbTransferencia.ClassName; { tbTransferencia: TRxMemoryData; }
    tbTransferenciamesa.ClassName; { tbTransferenciamesa: TStringField; }
    DataSource1.ClassName; { DataSource1: TDataSource; }
  end;

{ frm_cs_grupos_: Tfrm_cs_grupos_ }
  with Tfrm_cs_grupos_(nil) do { uu_cs_grupos_estoque.pas }
  begin
    Panel2.ClassName; { Panel2: TPanel; }
    bt_selecionar.ClassName; { bt_selecionar: TBitBtn; }
    bt_sair.ClassName; { bt_sair: TBitBtn; }
    Panel3.ClassName; { Panel3: TPanel; }
    Panel4.ClassName; { Panel4: TPanel; }
    Label3.ClassName; { Label3: TLabel; }
    ed_descricao.ClassName; { ed_descricao: Tedit; }
    Panel5.ClassName; { Panel5: TPanel; }
    DBGrid1.ClassName; { DBGrid1: TDBGrid; }
  end;

{ frm_cad_usuarios: Tfrm_cad_usuarios }
  with Tfrm_cad_usuarios(nil) do { uu_cad_usuarios.pas }
  begin
    Panel1.ClassName; { Panel1: TPanel; }
    Label6.ClassName; { Label6: TLabel; }
    AdvOfficeImage1.ClassName; { AdvOfficeImage1: TAdvOfficeImage; }
    AdvOfficeImage2.ClassName; { AdvOfficeImage2: TAdvOfficeImage; }
    pn_permissoes.ClassName; { pn_permissoes: TPanel; }
    ckb_modulos.ClassName; { ckb_modulos: TCheckListBox; }
    ckb_submodulos.ClassName; { ckb_submodulos: TCheckListBox; }
    ckbPermitirtudo.ClassName; { ckbPermitirtudo: TCheckBox; }
    Panel3.ClassName; { Panel3: TPanel; }
    bt_pesq_usuario.ClassName; { bt_pesq_usuario: TSpeedButton; }
    Label1.ClassName; { Label1: TLabel; }
    Label2.ClassName; { Label2: TLabel; }
    Label3.ClassName; { Label3: TLabel; }
    Label4.ClassName; { Label4: TLabel; }
    ed_cod_usuario.ClassName; { ed_cod_usuario: TEdit; }
    ed_nome.ClassName; { ed_nome: TEdit; }
    ed_login.ClassName; { ed_login: TEdit; }
    ed_cargo.ClassName; { ed_cargo: TEdit; }
    ckbRedefinir.ClassName; { ckbRedefinir: TCheckBox; }
    ckbUsuarioAtivo.ClassName; { ckbUsuarioAtivo: TCheckBox; }
    Panel2.ClassName; { Panel2: TPanel; }
    bt_novo.ClassName; { bt_novo: TAdvGlassButton; }
    bt_alterar.ClassName; { bt_alterar: TAdvGlassButton; }
    bt_excluir.ClassName; { bt_excluir: TAdvGlassButton; }
    bt_gravar.ClassName; { bt_gravar: TAdvGlassButton; }
    bt_cancelar.ClassName; { bt_cancelar: TAdvGlassButton; }
    bt_sair.ClassName; { bt_sair: TAdvGlassButton; }
  end;

{ frm_centros_custo: Tfrm_centros_custo }
  with Tfrm_centros_custo(nil) do { uu_centro_custo.pas }
  begin
    Panel12.ClassName; { Panel12: TPanel; }
    bt_excluir.ClassName; { bt_excluir: TBitBtn; }
    bt_alterar.ClassName; { bt_alterar: TBitBtn; }
    bt_novo.ClassName; { bt_novo: TBitBtn; }
    bt_gravar.ClassName; { bt_gravar: TBitBtn; }
    bt_cancelar.ClassName; { bt_cancelar: TBitBtn; }
    bt_sair.ClassName; { bt_sair: TBitBtn; }
    Panel2.ClassName; { Panel2: TPanel; }
    painel.ClassName; { painel: TPanel; }
    Label1.ClassName; { Label1: TLabel; }
    Label14.ClassName; { Label14: TLabel; }
    bt_pesq_cc.ClassName; { bt_pesq_cc: TSpeedButton; }
    ed_cod_cc.ClassName; { ed_cod_cc: TEdit; }
    ed_desc_cc.ClassName; { ed_desc_cc: TEdit; }
  end;

{ frm_cs_c_custo: Tfrm_cs_c_custo }
  with Tfrm_cs_c_custo(nil) do { uu_cs_c_custo.pas }
  begin
    Panel2.ClassName; { Panel2: TPanel; }
    bt_selecionar.ClassName; { bt_selecionar: TBitBtn; }
    bt_sair.ClassName; { bt_sair: TBitBtn; }
    Panel4.ClassName; { Panel4: TPanel; }
    Label3.ClassName; { Label3: TLabel; }
    ed_descricao.ClassName; { ed_descricao: TEdit; }
    Panel5.ClassName; { Panel5: TPanel; }
    DBGrid1.ClassName; { DBGrid1: TDBGrid; }
  end;

{ frm_encerramento: Tfrm_encerramento }
  with Tfrm_encerramento(nil) do { uu_encerramento.pas }
  begin
    Label16.ClassName; { Label16: TLabel; }
    Label30.ClassName; { Label30: TLabel; }
    pn_faturamento.ClassName; { pn_faturamento: TPanel; }
    Label6.ClassName; { Label6: TLabel; }
    Panel4.ClassName; { Panel4: TPanel; }
    bt_confirma_fatura.ClassName; { bt_confirma_fatura: TBitBtn; }
    bt_cancelar.ClassName; { bt_cancelar: TBitBtn; }
    Panel3.ClassName; { Panel3: TPanel; }
    SpeedButton2.ClassName; { SpeedButton2: TSpeedButton; }
    Label5.ClassName; { Label5: TLabel; }
    Label10.ClassName; { Label10: TLabel; }
    Panel5.ClassName; { Panel5: TPanel; }
    Label7.ClassName; { Label7: TLabel; }
    ed_desc_cliente.ClassName; { ed_desc_cliente: TEdit; }
    ed_cod_cliente.ClassName; { ed_cod_cliente: TEdit; }
    Panel2.ClassName; { Panel2: TPanel; }
    gp_desconto.ClassName; { gp_desconto: TGroupBox; }
    Panel1.ClassName; { Panel1: TPanel; }
    lbTitMesa.ClassName; { lbTitMesa: TLabel; }
    lb_mesa.ClassName; { lb_mesa: TLabel; }
    lblTitulo.ClassName; { lblTitulo: TLabel; }
    pnTeclado.ClassName; { pnTeclado: TPanel; }
    AdvOfficeImage8.ClassName; { AdvOfficeImage8: TAdvOfficeImage; }
    pgControles.ClassName; { pgControles: TJvPageList; }
    pgValorForma.ClassName; { pgValorForma: TJvStandardPage; }
    Panel15.ClassName; { Panel15: TPanel; }
    Label18.ClassName; { Label18: TLabel; }
    Panel17.ClassName; { Panel17: TPanel; }
    Label19.ClassName; { Label19: TLabel; }
    edValorFormaTouch.ClassName; { edValorFormaTouch: TJvValidateEdit; }
    AdvSmoothTouchKeyBoard2.ClassName; { AdvSmoothTouchKeyBoard2: TAdvSmoothTouchKeyBoard; }
    pgOpcoes.ClassName; { pgOpcoes: TJvStandardPage; }
    btApagarForma.ClassName; { btApagarForma: TPngSpeedButton; }
    btCpfNota.ClassName; { btCpfNota: TPngSpeedButton; }
    btDesconto.ClassName; { btDesconto: TPngSpeedButton; }
    PngSpeedButton3.ClassName; { PngSpeedButton3: TPngSpeedButton; }
    btEncerrarVenda.ClassName; { btEncerrarVenda: TPngSpeedButton; }
    PngSpeedButton5.ClassName; { PngSpeedButton5: TPngSpeedButton; }
    PngSpeedButton4.ClassName; { PngSpeedButton4: TPngSpeedButton; }
    pnFormasPagamento.ClassName; { pnFormasPagamento: TPanel; }
    pn_fiscal.ClassName; { pn_fiscal: TPanel; }
    Label2.ClassName; { Label2: TLabel; }
    Label4.ClassName; { Label4: TLabel; }
    lbTaxaServico.ClassName; { lbTaxaServico: TLabel; }
    Memo1.ClassName; { Memo1: TMemo; }
    ed_codigo_forma.ClassName; { ed_codigo_forma: TEdit; }
    ed_valor_tx_serv.ClassName; { ed_valor_tx_serv: TJvValidateEdit; }
    ed_valor_forma.ClassName; { ed_valor_forma: TJvValidateEdit; }
    Panel14.ClassName; { Panel14: TPanel; }
    cxGrid1.ClassName; { cxGrid1: TcxGrid; }
    cxGrid1DBTableView1.ClassName; { cxGrid1DBTableView1: TcxGridDBTableView; }
    cxGrid1DBTableView1Column1.ClassName; { cxGrid1DBTableView1Column1: TcxGridDBColumn; }
    cxGrid1DBTableView1Column2.ClassName; { cxGrid1DBTableView1Column2: TcxGridDBColumn; }
    cxGrid1Level1.ClassName; { cxGrid1Level1: TcxGridLevel; }
    Panel13.ClassName; { Panel13: TPanel; }
    Label17.ClassName; { Label17: TLabel; }
    AdvOfficeImage6.ClassName; { AdvOfficeImage6: TAdvOfficeImage; }
    ed_valor_troco.ClassName; { ed_valor_troco: TJvValidateEdit; }
    pgDesconto.ClassName; { pgDesconto: TJvStandardPage; }
    Panel18.ClassName; { Panel18: TPanel; }
    Label8.ClassName; { Label8: TLabel; }
    Label9.ClassName; { Label9: TLabel; }
    rdPercentual.ClassName; { rdPercentual: TRadioButton; }
    rdValor.ClassName; { rdValor: TRadioButton; }
    edValorDesconto.ClassName; { edValorDesconto: TJvValidateEdit; }
    AdvSmoothTouchKeyBoard1.ClassName; { AdvSmoothTouchKeyBoard1: TAdvSmoothTouchKeyBoard; }
    pgCPFCliente.ClassName; { pgCPFCliente: TJvStandardPage; }
    Label20.ClassName; { Label20: TLabel; }
    Label21.ClassName; { Label21: TLabel; }
    Label24.ClassName; { Label24: TLabel; }
    edCpf.ClassName; { edCpf: TEdit; }
    edNomeCliente.ClassName; { edNomeCliente: TEdit; }
    Panel19.ClassName; { Panel19: TPanel; }
    Label22.ClassName; { Label22: TLabel; }
    Label23.ClassName; { Label23: TLabel; }
    edEndereco.ClassName; { edEndereco: TEdit; }
    AdvTouchKeyboard1.ClassName; { AdvTouchKeyboard1: TAdvSmoothTouchKeyBoard; }
    pgModeloNFE.ClassName; { pgModeloNFE: TJvStandardPage; }
    PngSpeedButton1.ClassName; { PngSpeedButton1: TPngSpeedButton; }
    PngSpeedButton2.ClassName; { PngSpeedButton2: TPngSpeedButton; }
    Panel20.ClassName; { Panel20: TPanel; }
    Label25.ClassName; { Label25: TLabel; }
    Label26.ClassName; { Label26: TLabel; }
    Label27.ClassName; { Label27: TLabel; }
    pgNomeClienteProducao.ClassName; { pgNomeClienteProducao: TJvStandardPage; }
    Label29.ClassName; { Label29: TLabel; }
    Panel21.ClassName; { Panel21: TPanel; }
    Label3.ClassName; { Label3: TLabel; }
    Label28.ClassName; { Label28: TLabel; }
    edNomeClienteProducaoComanda.ClassName; { edNomeClienteProducaoComanda: TEdit; }
    JvPageList1.ClassName; { JvPageList1: TJvPageList; }
    pgFormasPagamentoPrincipal.ClassName; { pgFormasPagamentoPrincipal: TJvStandardPage; }
    PanelFormasPagamentoPrincipal.ClassName; { PanelFormasPagamentoPrincipal: TPanel; }
    pgList.ClassName; { pgList: TJvPageList; }
    pgMensagens.ClassName; { pgMensagens: TJvStandardPage; }
    pnMensagens.ClassName; { pnMensagens: TPanel; }
    memoMensagens.ClassName; { memoMensagens: TMemo; }
    pgTotais.ClassName; { pgTotais: TJvStandardPage; }
    Panel6.ClassName; { Panel6: TPanel; }
    Label11.ClassName; { Label11: TLabel; }
    AdvOfficeImage2.ClassName; { AdvOfficeImage2: TAdvOfficeImage; }
    ed_valor_bruto.ClassName; { ed_valor_bruto: TJvValidateEdit; }
    Panel7.ClassName; { Panel7: TPanel; }
    Label12.ClassName; { Label12: TLabel; }
    AdvOfficeImage3.ClassName; { AdvOfficeImage3: TAdvOfficeImage; }
    ed_total_tx_serv.ClassName; { ed_total_tx_serv: TJvValidateEdit; }
    Panel8.ClassName; { Panel8: TPanel; }
    Label13.ClassName; { Label13: TLabel; }
    AdvOfficeImage4.ClassName; { AdvOfficeImage4: TAdvOfficeImage; }
    ed_total_entrega.ClassName; { ed_total_entrega: TJvValidateEdit; }
    Panel10.ClassName; { Panel10: TPanel; }
    Label14.ClassName; { Label14: TLabel; }
    AdvOfficeImage1.ClassName; { AdvOfficeImage1: TAdvOfficeImage; }
    ed_total_desconto.ClassName; { ed_total_desconto: TJvValidateEdit; }
    Panel9.ClassName; { Panel9: TPanel; }
    Label1.ClassName; { Label1: TLabel; }
    AdvOfficeImage7.ClassName; { AdvOfficeImage7: TAdvOfficeImage; }
    ed_total_pago.ClassName; { ed_total_pago: TJvValidateEdit; }
    Panel11.ClassName; { Panel11: TPanel; }
    Label15.ClassName; { Label15: TLabel; }
    AdvOfficeImage5.ClassName; { AdvOfficeImage5: TAdvOfficeImage; }
    ed_total_conta.ClassName; { ed_total_conta: TJvValidateEdit; }
    Panel12.ClassName; { Panel12: TPanel; }
    DBCtrlGrid1.ClassName; { DBCtrlGrid1: TDBCtrlGrid; }
    pgMensagensErro.ClassName; { pgMensagensErro: TJvStandardPage; }
    pnMensagensErro.ClassName; { pnMensagensErro: TPanel; }
    imgPainelErro.ClassName; { imgPainelErro: TImage; }
    lbTituloMensagem.ClassName; { lbTituloMensagem: TPanel; }
    lbTempoMensagem.ClassName; { lbTempoMensagem: TLabel; }
    Memo2.ClassName; { Memo2: TMemo; }
    ActivityIndicator.ClassName; { ActivityIndicator: TdxActivityIndicator; }
    lbMensagemErro.ClassName; { lbMensagemErro: TMemo; }
    dsFormasPagtoTemp.ClassName; { dsFormasPagtoTemp: TDataSource; }
    ACBrCalculadora1.ClassName; { ACBrCalculadora1: TACBrCalculadora; }
    ImageList1.ClassName; { ImageList1: TImageList; }
    Timer2.ClassName; { Timer2: TTimer; }
    Timer1.ClassName; { Timer1: TTimer; }
    timerTempoMensagem.ClassName; { timerTempoMensagem: TTimer; }
    tbFormasPagamentoTemp.ClassName; { tbFormasPagamentoTemp: TFDMemTable; }
    tbFormasPagamentoTempcodForma.ClassName; { tbFormasPagamentoTempcodForma: TStringField; }
    tbFormasPagamentoTempdescricaoForma.ClassName; { tbFormasPagamentoTempdescricaoForma: TStringField; }
    tbFormasPagamentoTempvalorForma.ClassName; { tbFormasPagamentoTempvalorForma: TCurrencyField; }
    tbFormasPagamentoTempcodCliFaturado.ClassName; { tbFormasPagamentoTempcodCliFaturado: TStringField; }
    tbFormasPagamentoTempobservacoesFaturado.ClassName; { tbFormasPagamentoTempobservacoesFaturado: TStringField; }
    tbFormasPagamentoTempNSU.ClassName; { tbFormasPagamentoTempNSU: TStringField; }
    tbFormasPagamentoTemprede.ClassName; { tbFormasPagamentoTemprede: TStringField; }
    tbFormasPagamentoTempAutorizacaoTEF.ClassName; { tbFormasPagamentoTempAutorizacaoTEF: TStringField; }
    tbFormasPagamentoTempDataVencimento.ClassName; { tbFormasPagamentoTempDataVencimento: TDateField; }
    tbFormasPagamentoTempComprovanteEstabelecimento.ClassName; { tbFormasPagamentoTempComprovanteEstabelecimento: TStringField; }
    tbFormasPagamentoTempComprovanteCliente.ClassName; { tbFormasPagamentoTempComprovanteCliente: TStringField; }
    tbFormasPagamentoTempidConfigPagamento.ClassName; { tbFormasPagamentoTempidConfigPagamento: TSmallintField; }
    dsFormasPagamentoTemp.ClassName; { dsFormasPagamentoTemp: TDataSource; }
    cxStyleRepository1.ClassName; { cxStyleRepository1: TcxStyleRepository; }
    cxStyle1.ClassName; { cxStyle1: TcxStyle; }
    ActionList1.ClassName; { ActionList1: TActionList; }
    actAdicionaFormaPagamento.ClassName; { actAdicionaFormaPagamento: TAction; }
    ACBrValidador1.ClassName; { ACBrValidador1: TACBrValidador; }
    tmEncerrarConta.ClassName; { tmEncerrarConta: TTimer; }
  end;

{ frm_extrato: Tfrm_extrato }
  with Tfrm_extrato(nil) do { uu_extrato.pas }
  begin
    pn_fiscal.ClassName; { pn_fiscal: TPanel; }
    Label3.ClassName; { Label3: TLabel; }
    lbEditDesconto.ClassName; { lbEditDesconto: TLabel; }
    btBesbloquearDesconto.ClassName; { btBesbloquearDesconto: TAeroSpeedButton; }
    Label6.ClassName; { Label6: TLabel; }
    Panel2.ClassName; { Panel2: TPanel; }
    btImprimir.ClassName; { btImprimir: TAdvGlassButton; }
    AdvGlassButton1.ClassName; { AdvGlassButton1: TAdvGlassButton; }
    edQtdPessoas.ClassName; { edQtdPessoas: TcxSpinEdit; }
    Panel3.ClassName; { Panel3: TPanel; }
    Label4.ClassName; { Label4: TLabel; }
    AdvOfficeImage2.ClassName; { AdvOfficeImage2: TAdvOfficeImage; }
    lbTotalProdutos.ClassName; { lbTotalProdutos: TJvValidateEdit; }
    Panel4.ClassName; { Panel4: TPanel; }
    Label5.ClassName; { Label5: TLabel; }
    lbTotalServicos.ClassName; { lbTotalServicos: TLabel; }
    AdvOfficeImage3.ClassName; { AdvOfficeImage3: TAdvOfficeImage; }
    Panel5.ClassName; { Panel5: TPanel; }
    Label13.ClassName; { Label13: TLabel; }
    lbPagamentosParciais.ClassName; { lbPagamentosParciais: TLabel; }
    AdvOfficeImage4.ClassName; { AdvOfficeImage4: TAdvOfficeImage; }
    Panel6.ClassName; { Panel6: TPanel; }
    Label15.ClassName; { Label15: TLabel; }
    lbDesconto.ClassName; { lbDesconto: TLabel; }
    AdvOfficeImage1.ClassName; { AdvOfficeImage1: TAdvOfficeImage; }
    Panel7.ClassName; { Panel7: TPanel; }
    Label7.ClassName; { Label7: TLabel; }
    lbTotalConta.ClassName; { lbTotalConta: TLabel; }
    AdvOfficeImage5.ClassName; { AdvOfficeImage5: TAdvOfficeImage; }
    edValorDesconto.ClassName; { edValorDesconto: TJvValidateEdit; }
    rdDesconto.ClassName; { rdDesconto: TRadioGroup; }
    rdPercentual.ClassName; { rdPercentual: TRadioButton; }
    rdValor.ClassName; { rdValor: TRadioButton; }
    pnl_desconto.ClassName; { pnl_desconto: TPanel; }
    ckb_desconto.ClassName; { ckb_desconto: TCheckBox; }
    Panel1.ClassName; { Panel1: TPanel; }
    Label1.ClassName; { Label1: TLabel; }
    lb_mesa.ClassName; { lb_mesa: TLabel; }
    Label2.ClassName; { Label2: TLabel; }
    dsMesas.ClassName; { dsMesas: TDataSource; }
  end;

{ frm_troca_senha: Tfrm_troca_senha }
  with Tfrm_troca_senha(nil) do { uu_troca_senha.pas }
  begin
    Panel2.ClassName; { Panel2: TPanel; }
    Label2.ClassName; { Label2: TLabel; }
    Label3.ClassName; { Label3: TLabel; }
    Label4.ClassName; { Label4: TLabel; }
    ed_senha_atual.ClassName; { ed_senha_atual: TMaskEdit; }
    ed_nova_senha.ClassName; { ed_nova_senha: TMaskEdit; }
    ed_confirmacao.ClassName; { ed_confirmacao: TMaskEdit; }
    AdvTouchKeyboard1.ClassName; { AdvTouchKeyboard1: TAdvSmoothTouchKeyBoard; }
    Panel1.ClassName; { Panel1: TPanel; }
    lb_mesa.ClassName; { lb_mesa: TLabel; }
    lblTitulo.ClassName; { lblTitulo: TLabel; }
    Panel3.ClassName; { Panel3: TPanel; }
    btSelecionar.ClassName; { btSelecionar: TAdvGlassButton; }
    btSair.ClassName; { btSair: TAdvGlassButton; }
  end;

{ frm_caixa_restaurante: Tfrm_caixa_restaurante }
  with Tfrm_caixa_restaurante(nil) do { uu_caixa_restaurante.pas }
  begin
    Label11.ClassName; { Label11: TLabel; }
    imgMapa.ClassName; { imgMapa: TImage; }
    imgMesa.ClassName; { imgMesa: TImage; }
    memo_codigos_formas.ClassName; { memo_codigos_formas: TMemo; }
    Panel2.ClassName; { Panel2: TPanel; }
    lb_hora.ClassName; { lb_hora: TLabel; }
    Panel11.ClassName; { Panel11: TPanel; }
    panelPrincipal.ClassName; { panelPrincipal: TPanel; }
    pgListPrincipal.ClassName; { pgListPrincipal: TJvPageList; }
    pgPrincipal.ClassName; { pgPrincipal: TJvStandardPage; }
    Panel4.ClassName; { Panel4: TPanel; }
    pnFundoPrincipal.ClassName; { pnFundoPrincipal: TPanel; }
    Panel5.ClassName; { Panel5: TPanel; }
    pnPgListMovimento.ClassName; { pnPgListMovimento: TPanel; }
    pgLista.ClassName; { pgLista: TJvPageList; }
    pgMapaMesas.ClassName; { pgMapaMesas: TJvStandardPage; }
    DBCtrlGrid1.ClassName; { DBCtrlGrid1: TDBCtrlGrid; }
    pnInfoMesas.ClassName; { pnInfoMesas: TPanel; }
    edQtdMesas.ClassName; { edQtdMesas: TEdit; }
    edMesasPagto.ClassName; { edMesasPagto: TEdit; }
    pgMovimentoMesa.ClassName; { pgMovimentoMesa: TJvStandardPage; }
    lb_cod_produto.ClassName; { lb_cod_produto: TLabel; }
    pgListGridMovimento.ClassName; { pgListGridMovimento: TJvPageList; }
    pgMovimentoDetalhado.ClassName; { pgMovimentoDetalhado: TJvStandardPage; }
    pnModoVisualizacao.ClassName; { pnModoVisualizacao: TPanel; }
    rdg_modo_visualizacao.ClassName; { rdg_modo_visualizacao: TRadioGroup; }
    cxGrid1.ClassName; { cxGrid1: TcxGrid; }
    tbViewDetalhado.ClassName; { tbViewDetalhado: TcxGridDBTableView; }
    tbViewDetalhadoSelecionado.ClassName; { tbViewDetalhadoSelecionado: TcxGridDBColumn; }
    tbViewDetalhadoCOD_BARRAS.ClassName; { tbViewDetalhadoCOD_BARRAS: TcxGridDBColumn; }
    tbViewDetalhadoDESCRICAO.ClassName; { tbViewDetalhadoDESCRICAO: TcxGridDBColumn; }
    tbViewDetalhadoQUANTIDADE.ClassName; { tbViewDetalhadoQUANTIDADE: TcxGridDBColumn; }
    tbViewDetalhadoVALOR_UNITARIO.ClassName; { tbViewDetalhadoVALOR_UNITARIO: TcxGridDBColumn; }
    tbViewDetalhadoDESCONTO.ClassName; { tbViewDetalhadoDESCONTO: TcxGridDBColumn; }
    tbViewDetalhadoTOTAL.ClassName; { tbViewDetalhadoTOTAL: TcxGridDBColumn; }
    tbViewDetalhadoNomeCliente.ClassName; { tbViewDetalhadoNomeCliente: TcxGridDBColumn; }
    tbViewDetalhadoOBSERVACOES.ClassName; { tbViewDetalhadoOBSERVACOES: TcxGridDBColumn; }
    tbViewDetalhadoColumn1.ClassName; { tbViewDetalhadoColumn1: TcxGridDBColumn; }
    tbViewDetalhadoColumnPago.ClassName; { tbViewDetalhadoColumnPago: TcxGridDBColumn; }
    tbViewResumido.ClassName; { tbViewResumido: TcxGridDBTableView; }
    cxGridDBColumn12.ClassName; { cxGridDBColumn12: TcxGridDBColumn; }
    cxGridDBColumn13.ClassName; { cxGridDBColumn13: TcxGridDBColumn; }
    cxGridDBColumn14.ClassName; { cxGridDBColumn14: TcxGridDBColumn; }
    cxGridDBColumn15.ClassName; { cxGridDBColumn15: TcxGridDBColumn; }
    cxGridDBColumn16.ClassName; { cxGridDBColumn16: TcxGridDBColumn; }
    cxGridDBTableView1Column17.ClassName; { cxGridDBTableView1Column17: TcxGridDBColumn; }
    lvDetalhado.ClassName; { lvDetalhado: TcxGridLevel; }
    lvResumido.ClassName; { lvResumido: TcxGridLevel; }
    pnMenu.ClassName; { pnMenu: TPanel; }
    pnLinhaAzulMenu.ClassName; { pnLinhaAzulMenu: TPanel; }
    pgListOpcoes.ClassName; { pgListOpcoes: TJvPageList; }
    pgMenu.ClassName; { pgMenu: TJvStandardPage; }
    Panel8.ClassName; { Panel8: TPanel; }
    btPreConta.ClassName; { btPreConta: TPngSpeedButton; }
    btReceberConta.ClassName; { btReceberConta: TPngSpeedButton; }
    btCancelarItem.ClassName; { btCancelarItem: TPngSpeedButton; }
    btTransferirMesa.ClassName; { btTransferirMesa: TPngSpeedButton; }
    btTransferirItem.ClassName; { btTransferirItem: TPngSpeedButton; }
    btRecebimentosParciais.ClassName; { btRecebimentosParciais: TPngSpeedButton; }
    btReabrirMesa.ClassName; { btReabrirMesa: TPngSpeedButton; }
    btDelivery.ClassName; { btDelivery: TPngSpeedButton; }
    btFuncoesDoCaixa.ClassName; { btFuncoesDoCaixa: TPngSpeedButton; }
    Panel29.ClassName; { Panel29: TPanel; }
    pgCancelarItens.ClassName; { pgCancelarItens: TJvStandardPage; }
    pgTransferirItens.ClassName; { pgTransferirItens: TJvStandardPage; }
    Panel1.ClassName; { Panel1: TPanel; }
    lbTitulo.ClassName; { lbTitulo: TLabel; }
    pnTransferirItem.ClassName; { pnTransferirItem: TPanel; }
    Panel17.ClassName; { Panel17: TPanel; }
    Panel18.ClassName; { Panel18: TPanel; }
    Panel14.ClassName; { Panel14: TPanel; }
    Panel15.ClassName; { Panel15: TPanel; }
    Panel16.ClassName; { Panel16: TPanel; }
    Label6.ClassName; { Label6: TLabel; }
    Label12.ClassName; { Label12: TLabel; }
    Label13.ClassName; { Label13: TLabel; }
    edMesaDestino.ClassName; { edMesaDestino: TEdit; }
    cmbMotivoTransferenciaItem.ClassName; { cmbMotivoTransferenciaItem: TRxDBLookupCombo; }
    memoObsTransferenciaItem.ClassName; { memoObsTransferenciaItem: TMemo; }
    Panel32.ClassName; { Panel32: TPanel; }
    AdvGlassButton1.ClassName; { AdvGlassButton1: TAdvGlassButton; }
    AdvGlassButton3.ClassName; { AdvGlassButton3: TAdvGlassButton; }
    pnTopo.ClassName; { pnTopo: TPanel; }
    pn_mesa.ClassName; { pn_mesa: TPanel; }
    Label15.ClassName; { Label15: TLabel; }
    edNumeroMesa.ClassName; { edNumeroMesa: TEdit; }
    pn_garcon.ClassName; { pn_garcon: TPanel; }
    Label1.ClassName; { Label1: TLabel; }
    edCodGarcon.ClassName; { edCodGarcon: TEdit; }
    pnCodProduto.ClassName; { pnCodProduto: TPanel; }
    Label2.ClassName; { Label2: TLabel; }
    edCodProduto.ClassName; { edCodProduto: TEdit; }
    pnQuantidade.ClassName; { pnQuantidade: TPanel; }
    lbQuantidade.ClassName; { lbQuantidade: TLabel; }
    edQuantidade.ClassName; { edQuantidade: TEdit; }
    pnDadosProduto.ClassName; { pnDadosProduto: TPanel; }
    Label3.ClassName; { Label3: TLabel; }
    Label5.ClassName; { Label5: TLabel; }
    ed_descricao_produto.ClassName; { ed_descricao_produto: TEdit; }
    ed_valor_produto.ClassName; { ed_valor_produto: TEdit; }
    pnStatus.ClassName; { pnStatus: TPanel; }
    Label14.ClassName; { Label14: TLabel; }
    lbNomeUsuario.ClassName; { lbNomeUsuario: TLabel; }
    AdvOfficeImage5.ClassName; { AdvOfficeImage5: TAdvOfficeImage; }
    lbNomeEmpresa.ClassName; { lbNomeEmpresa: TLabel; }
    AdvOfficeImage8.ClassName; { AdvOfficeImage8: TAdvOfficeImage; }
    lbDataSistema.ClassName; { lbDataSistema: TLabel; }
    AdvOfficeImage7.ClassName; { AdvOfficeImage7: TAdvOfficeImage; }
    lbHora.ClassName; { lbHora: TLabel; }
    Panel3.ClassName; { Panel3: TPanel; }
    Panel6.ClassName; { Panel6: TPanel; }
    AdvOfficeImage1.ClassName; { AdvOfficeImage1: TAdvOfficeImage; }
    Label4.ClassName; { Label4: TLabel; }
    ed_valor_bruto.ClassName; { ed_valor_bruto: TJvValidateEdit; }
    Panel7.ClassName; { Panel7: TPanel; }
    AdvOfficeImage2.ClassName; { AdvOfficeImage2: TAdvOfficeImage; }
    Label7.ClassName; { Label7: TLabel; }
    ed_total_tx_serv.ClassName; { ed_total_tx_serv: TJvValidateEdit; }
    Panel9.ClassName; { Panel9: TPanel; }
    AdvOfficeImage3.ClassName; { AdvOfficeImage3: TAdvOfficeImage; }
    Label8.ClassName; { Label8: TLabel; }
    ed_total_desconto.ClassName; { ed_total_desconto: TJvValidateEdit; }
    Panel10.ClassName; { Panel10: TPanel; }
    Label9.ClassName; { Label9: TLabel; }
    AdvOfficeImage9.ClassName; { AdvOfficeImage9: TAdvOfficeImage; }
    ed_total_pago.ClassName; { ed_total_pago: TJvValidateEdit; }
    Panel21.ClassName; { Panel21: TPanel; }
    AdvOfficeImage4.ClassName; { AdvOfficeImage4: TAdvOfficeImage; }
    Label10.ClassName; { Label10: TLabel; }
    ed_total_conta.ClassName; { ed_total_conta: TJvValidateEdit; }
    Panel30.ClassName; { Panel30: TPanel; }
    Panel27.ClassName; { Panel27: TPanel; }
    Panel28.ClassName; { Panel28: TPanel; }
    pgCombos.ClassName; { pgCombos: TJvStandardPage; }
    Panel13.ClassName; { Panel13: TPanel; }
    pnPrincipalCombos.ClassName; { pnPrincipalCombos: TPanel; }
    Panel19.ClassName; { Panel19: TPanel; }
    pnTopoGrupos.ClassName; { pnTopoGrupos: TPanel; }
    Panel20.ClassName; { Panel20: TPanel; }
    Panel22.ClassName; { Panel22: TPanel; }
    DBCtrlGrid2.ClassName; { DBCtrlGrid2: TDBCtrlGrid; }
    Panel23.ClassName; { Panel23: TPanel; }
    DBText5.ClassName; { DBText5: TDBText; }
    DBText6.ClassName; { DBText6: TDBText; }
    Panel24.ClassName; { Panel24: TPanel; }
    Panel25.ClassName; { Panel25: TPanel; }
    Panel26.ClassName; { Panel26: TPanel; }
    pnGruposAdicionais.ClassName; { pnGruposAdicionais: TPanel; }
    pnTitulo.ClassName; { pnTitulo: TPanel; }
    lbTituloGrupoCompo.ClassName; { lbTituloGrupoCompo: TLabel; }
    btSom.ClassName; { btSom: TPngSpeedButton; }
    pnDataHora.ClassName; { pnDataHora: TPanel; }
    Panel12.ClassName; { Panel12: TPanel; }
    Timer1.ClassName; { Timer1: TTimer; }
    PopupMenu1.ClassName; { PopupMenu1: TPopupMenu; }
    Selecionartodos1.ClassName; { Selecionartodos1: TMenuItem; }
    Removerseleodeetodos1.ClassName; { Removerseleodeetodos1: TMenuItem; }
    N1.ClassName; { N1: TMenuItem; }
    CancelamentodeProduto1.ClassName; { CancelamentodeProduto1: TMenuItem; }
    RANSFERNCIA1.ClassName; { RANSFERNCIA1: TMenuItem; }
    N2.ClassName; { N2: TMenuItem; }
    Receberlanamentosdestepedido1.ClassName; { Receberlanamentosdestepedido1: TMenuItem; }
    pisca1.ClassName; { pisca1: TTimer; }
    pisca2.ClassName; { pisca2: TTimer; }
    cxStyleRepository1.ClassName; { cxStyleRepository1: TcxStyleRepository; }
    cxStyle2.ClassName; { cxStyle2: TcxStyle; }
    cxStyle1.ClassName; { cxStyle1: TcxStyle; }
    cxHintStyleController1.ClassName; { cxHintStyleController1: TcxHintStyleController; }
    timerHint.ClassName; { timerHint: TTimer; }
    cxImageList1.ClassName; { cxImageList1: TcxImageList; }
    ACBrCalculadora1.ClassName; { ACBrCalculadora1: TACBrCalculadora; }
  end;

{ frm_confirma_encerramento: Tfrm_confirma_encerramento }
  with Tfrm_confirma_encerramento(nil) do { uu_confirma_encerramento.pas }
  begin
    Memo1.ClassName; { Memo1: TMemo; }
    Panel1.ClassName; { Panel1: TPanel; }
    Label1.ClassName; { Label1: TLabel; }
    Panel3.ClassName; { Panel3: TPanel; }
    IAeverButton1.ClassName; { IAeverButton1: TBitBtn; }
    IAeverButton2.ClassName; { IAeverButton2: TBitBtn; }
    Timer1.ClassName; { Timer1: TTimer; }
    Timer2.ClassName; { Timer2: TTimer; }
    Timer3.ClassName; { Timer3: TTimer; }
  end;

{ frm_modelo_cadastro: Tfrm_modelo_cadastro }
  with Tfrm_modelo_cadastro(nil) do { uu_modelo.pas }
  begin
    pn_principal.ClassName; { pn_principal: TPanel; }
    pn_codigo.ClassName; { pn_codigo: TPanel; }
    bt_pesquisa.ClassName; { bt_pesquisa: TSpeedButton; }
    ed_codigo.ClassName; { ed_codigo: TMaskEdit; }
    pn_botoes.ClassName; { pn_botoes: TPanel; }
    bt_novo.ClassName; { bt_novo: TBitBtn; }
    bt_alterar.ClassName; { bt_alterar: TBitBtn; }
    bt_gravar.ClassName; { bt_gravar: TBitBtn; }
    bt_cancelar.ClassName; { bt_cancelar: TBitBtn; }
    bt_sair.ClassName; { bt_sair: TBitBtn; }
    bt_excluir.ClassName; { bt_excluir: TBitBtn; }
    bt_consultar.ClassName; { bt_consultar: TBitBtn; }
    bt_imprimir.ClassName; { bt_imprimir: TBitBtn; }
  end;

{ frm_modelo_pesquisas: Tfrm_modelo_pesquisas }
  with Tfrm_modelo_pesquisas(nil) do { uu_modelo_consultas.pas }
  begin
    Panel3.ClassName; { Panel3: TPanel; }
    Label1.ClassName; { Label1: TLabel; }
    ed_parametro.ClassName; { ed_parametro: TEdit; }
    RadioGroup1.ClassName; { RadioGroup1: TRadioGroup; }
    Panel1.ClassName; { Panel1: TPanel; }
    DBGrid1.ClassName; { DBGrid1: TDBGrid; }
    Panel2.ClassName; { Panel2: TPanel; }
    bt_selecionar.ClassName; { bt_selecionar: TBitBtn; }
    bt_cancelar.ClassName; { bt_cancelar: TBitBtn; }
  end;

{ frm_cs_fornecedores: Tfrm_cs_fornecedores }
  with Tfrm_cs_fornecedores(nil) do { uu_cs_fornecedores.pas }
  begin
    Panel3.ClassName; { Panel3: TPanel; }
    Label1.ClassName; { Label1: TLabel; }
    ed_parametro.ClassName; { ed_parametro: TEdit; }
    RadioGroup1.ClassName; { RadioGroup1: TRadioGroup; }
    Panel1.ClassName; { Panel1: TPanel; }
    DBGrid1.ClassName; { DBGrid1: TDBGrid; }
    Panel2.ClassName; { Panel2: TPanel; }
    bt_selecionar.ClassName; { bt_selecionar: TBitBtn; }
    bt_cancelar.ClassName; { bt_cancelar: TBitBtn; }
    Panel4.ClassName; { Panel4: TPanel; }
    lbTitulo.ClassName; { lbTitulo: TLabel; }
  end;

{ frm_cs_usuarios: Tfrm_cs_usuarios }
  with Tfrm_cs_usuarios(nil) do { uu_cs_usuarios.pas }
  begin
    Panel3.ClassName; { Panel3: TPanel; }
    ed_parametro.ClassName; { ed_parametro: TEdit; }
    RadioGroup1.ClassName; { RadioGroup1: TRadioGroup; }
    Panel1.ClassName; { Panel1: TPanel; }
    DBGrid1.ClassName; { DBGrid1: TDBGrid; }
    Panel2.ClassName; { Panel2: TPanel; }
    bt_selecionar.ClassName; { bt_selecionar: TBitBtn; }
    bt_cancelar.ClassName; { bt_cancelar: TBitBtn; }
  end;

{ frm_modelo_relatorio_data: Tfrm_modelo_relatorio_data }
  with Tfrm_modelo_relatorio_data(nil) do { uu_modelo_rel_datas.pas }
  begin
    Panel4.ClassName; { Panel4: TPanel; }
    RadioGroup1.ClassName; { RadioGroup1: TRadioGroup; }
    Panel5.ClassName; { Panel5: TPanel; }
    Label1.ClassName; { Label1: TLabel; }
    Label2.ClassName; { Label2: TLabel; }
    ed_data_inicial.ClassName; { ed_data_inicial: TMaskEdit; }
    ed_data_final.ClassName; { ed_data_final: TMaskEdit; }
    cbk_visualizar.ClassName; { cbk_visualizar: TCheckBox; }
    Panel2.ClassName; { Panel2: TPanel; }
    bt_imprimir.ClassName; { bt_imprimir: TBitBtn; }
    bt_sair.ClassName; { bt_sair: TBitBtn; }
  end;

{ frm_painel_erros: Tfrm_painel_erros }
  with Tfrm_painel_erros(nil) do { uu_manutencao_grupos.pas }
  begin
    Panel1.ClassName; { Panel1: TPanel; }
    Memo1.ClassName; { Memo1: TMemo; }
    BitBtn1.ClassName; { BitBtn1: TBitBtn; }
    Timer1.ClassName; { Timer1: TTimer; }
    Timer2.ClassName; { Timer2: TTimer; }
  end;

{ dm_relatorios: Tdm_relatorios }
  with Tdm_relatorios(nil) do { UU_DM_RELATORIOS.pas }
  begin
    ds_parametros.ClassName; { ds_parametros: TDataSource; }
    qryEstornosCaixa.ClassName; { qryEstornosCaixa: TIBQuery; }
    dtProdutos.ClassName; { dtProdutos: TfrxDBDataset; }
    qryParametros.ClassName; { qryParametros: TIBQuery; }
    dtBairros.ClassName; { dtBairros: TfrxDBDataset; }
    dtParametros.ClassName; { dtParametros: TfrxDBDataset; }
    qryRelatorioMargemProdutos.ClassName; { qryRelatorioMargemProdutos: TIBQuery; }
    dtRelatorioMargemProdutos.ClassName; { dtRelatorioMargemProdutos: TfrxDBDataset; }
    qryClientesAniversariantes.ClassName; { qryClientesAniversariantes: TIBQuery; }
    dtClientesAniversariantes.ClassName; { dtClientesAniversariantes: TfrxDBDataset; }
    qryConsumoClientes.ClassName; { qryConsumoClientes: TIBQuery; }
    dtConsumoClientes.ClassName; { dtConsumoClientes: TfrxDBDataset; }
    qryConferenciaCaixa.ClassName; { qryConferenciaCaixa: TIBQuery; }
    dtConferenciaCAixa.ClassName; { dtConferenciaCAixa: TfrxDBDataset; }
    qryClientesPedidosDelivery.ClassName; { qryClientesPedidosDelivery: TIBQuery; }
    qryClientesPedidosDeliveryCODIGO.ClassName; { qryClientesPedidosDeliveryCODIGO: TIBStringField; }
    qryClientesPedidosDeliveryNOME.ClassName; { qryClientesPedidosDeliveryNOME: TIBStringField; }
    qryClientesPedidosDeliveryTELEFONE.ClassName; { qryClientesPedidosDeliveryTELEFONE: TIBStringField; }
    qryClientesPedidosDeliverySEXO.ClassName; { qryClientesPedidosDeliverySEXO: TIBStringField; }
    qryClientesPedidosDeliveryENDERECO.ClassName; { qryClientesPedidosDeliveryENDERECO: TIBStringField; }
    qryClientesPedidosDeliveryCOD_BAIRRO.ClassName; { qryClientesPedidosDeliveryCOD_BAIRRO: TIntegerField; }
    qryClientesPedidosDeliveryCOMPLEMENTO.ClassName; { qryClientesPedidosDeliveryCOMPLEMENTO: TIBStringField; }
    qryClientesPedidosDeliveryREFERENCIA1.ClassName; { qryClientesPedidosDeliveryREFERENCIA1: TIBStringField; }
    qryClientesPedidosDeliveryREFERENCIA2.ClassName; { qryClientesPedidosDeliveryREFERENCIA2: TIBStringField; }
    qryProdutosVendidosCaixa.ClassName; { qryProdutosVendidosCaixa: TIBQuery; }
    qryProdutosVendidosCaixaCOD_PRODUTO.ClassName; { qryProdutosVendidosCaixaCOD_PRODUTO: TIBStringField; }
    qryProdutosVendidosCaixaCOD_GRUPO.ClassName; { qryProdutosVendidosCaixaCOD_GRUPO: TIBStringField; }
    qryProdutosVendidosCaixaDESCRICAO_GRUPO.ClassName; { qryProdutosVendidosCaixaDESCRICAO_GRUPO: TIBStringField; }
    qryProdutosVendidosCaixaDESCRICAO.ClassName; { qryProdutosVendidosCaixaDESCRICAO: TIBStringField; }
    qryProdutosVendidosCaixaQUANTIDADE_REAL.ClassName; { qryProdutosVendidosCaixaQUANTIDADE_REAL: TIBBCDField; }
    qryProdutosVendidosCaixaQUANTIDADE_CONTAGEM.ClassName; { qryProdutosVendidosCaixaQUANTIDADE_CONTAGEM: TIBBCDField; }
    qryProdutosVendidosCaixaVALOR_UNITARIO.ClassName; { qryProdutosVendidosCaixaVALOR_UNITARIO: TIBBCDField; }
    qryProdutosVendidosCaixaTOT.ClassName; { qryProdutosVendidosCaixaTOT: TFloatField; }
    qryProdutosVendidosCaixaCOD_BARRAS.ClassName; { qryProdutosVendidosCaixaCOD_BARRAS: TIBStringField; }
    qryProdutosVendidosCaixaCOD_G_RAIZ.ClassName; { qryProdutosVendidosCaixaCOD_G_RAIZ: TIBStringField; }
    qryProdutosVendidosCaixaDESC_G_RAIZ.ClassName; { qryProdutosVendidosCaixaDESC_G_RAIZ: TIBStringField; }
    qryProdutosVendidosCaixaCOD_G_PAI.ClassName; { qryProdutosVendidosCaixaCOD_G_PAI: TIBStringField; }
    qryProdutosVendidosCaixaDESC_G_PAI.ClassName; { qryProdutosVendidosCaixaDESC_G_PAI: TIBStringField; }
    qryProdutosVendidosCaixaCOD_GRUPO1.ClassName; { qryProdutosVendidosCaixaCOD_GRUPO1: TIBStringField; }
    qryProdutosVendidosCaixaDESC_GRUPO.ClassName; { qryProdutosVendidosCaixaDESC_GRUPO: TIBStringField; }
    dtClientesDelivery.ClassName; { dtClientesDelivery: TfrxDBDataset; }
    dsClientesDelivery.ClassName; { dsClientesDelivery: TDataSource; }
    qryPedidosClientesDelivery.ClassName; { qryPedidosClientesDelivery: TIBQuery; }
    dtPedidosClientesDelivery.ClassName; { dtPedidosClientesDelivery: TfrxDBDataset; }
    qryItensPedidoDelivery.ClassName; { qryItensPedidoDelivery: TIBQuery; }
    dsPedidosClientesDelivery.ClassName; { dsPedidosClientesDelivery: TDataSource; }
    dtItensPedidoDelivery.ClassName; { dtItensPedidoDelivery: TfrxDBDataset; }
    dsQryItensPedidosDelivery.ClassName; { dsQryItensPedidosDelivery: TDataSource; }
    qryContatoEstrategicoDelivery.ClassName; { qryContatoEstrategicoDelivery: TIBQuery; }
    dtContatoEstrategicoDelivery.ClassName; { dtContatoEstrategicoDelivery: TfrxDBDataset; }
    qryVendas.ClassName; { qryVendas: TIBQuery; }
    dtVendas.ClassName; { dtVendas: TfrxDBDataset; }
    qryPagamentosVendas.ClassName; { qryPagamentosVendas: TIBQuery; }
    dsQryVendas.ClassName; { dsQryVendas: TDataSource; }
    dtPagamentosVenda.ClassName; { dtPagamentosVenda: TfrxDBDataset; }
    dtProdutosVendidosCaixa.ClassName; { dtProdutosVendidosCaixa: TfrxDBDataset; }
    dtEstornosCaixa.ClassName; { dtEstornosCaixa: TfrxDBDataset; }
    qryTransferenciasProdutos.ClassName; { qryTransferenciasProdutos: TIBQuery; }
    dtTransferenciasProdutos.ClassName; { dtTransferenciasProdutos: TfrxDBDataset; }
    qryResumoCaixa.ClassName; { qryResumoCaixa: TIBQuery; }
    dtResumoCaixa.ClassName; { dtResumoCaixa: TfrxDBDataset; }
    qryResumoChurrascaria.ClassName; { qryResumoChurrascaria: TIBQuery; }
    dtResumoChurrascaria.ClassName; { dtResumoChurrascaria: TfrxDBDataset; }
    qryIndicadoresCaixa.ClassName; { qryIndicadoresCaixa: TIBQuery; }
    dtIndicadoresCaixa.ClassName; { dtIndicadoresCaixa: TfrxDBDataset; }
    qryTransferenciasMesa.ClassName; { qryTransferenciasMesa: TIBQuery; }
    dtTransferenciasMesa.ClassName; { dtTransferenciasMesa: TfrxDBDataset; }
    qryEstornosMesa.ClassName; { qryEstornosMesa: TIBQuery; }
    dtEstornosMesa.ClassName; { dtEstornosMesa: TfrxDBDataset; }
    qryRelFaturamento.ClassName; { qryRelFaturamento: TIBQuery; }
    dtFaturamento.ClassName; { dtFaturamento: TfrxDBDataset; }
    dtFaturamentoDiarioPeriodoSintetico.ClassName; { dtFaturamentoDiarioPeriodoSintetico: TfrxDBDataset; }
    dtFaturamentoMensalPeriodoAnalitico.ClassName; { dtFaturamentoMensalPeriodoAnalitico: TfrxDBDataset; }
    dtFaturamentoMensalPeriodoSintetico.ClassName; { dtFaturamentoMensalPeriodoSintetico: TfrxDBDataset; }
    qryMovimentoAuditoriaMesas.ClassName; { qryMovimentoAuditoriaMesas: TIBQuery; }
    qryAuditoriaMesas.ClassName; { qryAuditoriaMesas: TIBQuery; }
    dtRelatorioAuditoriaMesas.ClassName; { dtRelatorioAuditoriaMesas: TfrxDBDataset; }
    dsAuditoriaMesas.ClassName; { dsAuditoriaMesas: TDataSource; }
    dtMovimentoAuditoriaMesas.ClassName; { dtMovimentoAuditoriaMesas: TfrxDBDataset; }
    qryRecebimentosAuditoriaMesas.ClassName; { qryRecebimentosAuditoriaMesas: TIBQuery; }
    dtRecebimentosAuditoria.ClassName; { dtRecebimentosAuditoria: TfrxDBDataset; }
    qryPedidosEntregadores.ClassName; { qryPedidosEntregadores: TIBQuery; }
    dtQryPedidosEntregadores.ClassName; { dtQryPedidosEntregadores: TfrxDBDataset; }
    dtClientesBoatePeriodo.ClassName; { dtClientesBoatePeriodo: TfrxDBDataset; }
    qryClientesBoatePeriodo.ClassName; { qryClientesBoatePeriodo: TIBQuery; }
    qryEspelhoNotasEntrada.ClassName; { qryEspelhoNotasEntrada: TIBQuery; }
    dsQryEspelhoNotasEntrada.ClassName; { dsQryEspelhoNotasEntrada: TDataSource; }
    dtNotasEntrada.ClassName; { dtNotasEntrada: TfrxDBDataset; }
    qryItensEspelhoNotasEntrada.ClassName; { qryItensEspelhoNotasEntrada: TIBQuery; }
    dsQryItensEspelhoNotasEntrada.ClassName; { dsQryItensEspelhoNotasEntrada: TDataSource; }
    dtItensNotasEntrada.ClassName; { dtItensNotasEntrada: TfrxDBDataset; }
    qryNotasConsumidor.ClassName; { qryNotasConsumidor: TIBQuery; }
    dtNotasConsumidor.ClassName; { dtNotasConsumidor: TfrxDBDataset; }
    qryNotasTransporte.ClassName; { qryNotasTransporte: TIBQuery; }
    dtNotasTransporte.ClassName; { dtNotasTransporte: TfrxDBDataset; }
    qryConfLVFSEntradas.ClassName; { qryConfLVFSEntradas: TIBQuery; }
    dtConfLVFEntradas.ClassName; { dtConfLVFEntradas: TfrxDBDataset; }
    qryEspelhoNotaSaida.ClassName; { qryEspelhoNotaSaida: TIBQuery; }
    dsQryEspelhoNotaSaida.ClassName; { dsQryEspelhoNotaSaida: TDataSource; }
    dtEspelhoNotaSaida.ClassName; { dtEspelhoNotaSaida: TfrxDBDataset; }
    qryItensEspelhoNotaSaida.ClassName; { qryItensEspelhoNotaSaida: TIBQuery; }
    dsQryItensEspelhoNotaSaida.ClassName; { dsQryItensEspelhoNotaSaida: TDataSource; }
    dtItensNotaSaida.ClassName; { dtItensNotaSaida: TfrxDBDataset; }
    qryFaturasAbertas.ClassName; { qryFaturasAbertas: TIBQuery; }
    dtFaturasAbertas.ClassName; { dtFaturasAbertas: TfrxDBDataset; }
    dtFaturasAbertasDetalhado.ClassName; { dtFaturasAbertasDetalhado: TfrxDBDataset; }
    qryProdutosFatura.ClassName; { qryProdutosFatura: TIBQuery; }
    dsFaturasAbertas.ClassName; { dsFaturasAbertas: TDataSource; }
    dtProdutosFaturasAbertas.ClassName; { dtProdutosFaturasAbertas: TfrxDBDataset; }
    qryTitulosCpagEntrada.ClassName; { qryTitulosCpagEntrada: TIBQuery; }
    DsqryTitulosCpagEntrada.ClassName; { DsqryTitulosCpagEntrada: TDataSource; }
    DtTitulosCpagEntrada.ClassName; { DtTitulosCpagEntrada: TfrxDBDataset; }
    qryProducaoGarconsSintetico.ClassName; { qryProducaoGarconsSintetico: TIBQuery; }
    dtProducaoGarconsSintetico.ClassName; { dtProducaoGarconsSintetico: TfrxDBDataset; }
    dtProducaoGarconsSinteticoAgrupado.ClassName; { dtProducaoGarconsSinteticoAgrupado: TfrxDBDataset; }
    qryTaxaServico.ClassName; { qryTaxaServico: TIBQuery; }
    dtTaxaServicoRateado.ClassName; { dtTaxaServicoRateado: TfrxDBDataset; }
    dtTaxaDeServicoDiario.ClassName; { dtTaxaDeServicoDiario: TfrxDBDataset; }
    dtTaxaServicoAgrupadoData.ClassName; { dtTaxaServicoAgrupadoData: TfrxDBDataset; }
    dtTaxaServicoAuditoria.ClassName; { dtTaxaServicoAuditoria: TfrxDBDataset; }
    qryPlanoContas.ClassName; { qryPlanoContas: TIBQuery; }
    dtPlanoContas.ClassName; { dtPlanoContas: TfrxDBDataset; }
    qryContasApagar.ClassName; { qryContasApagar: TIBQuery; }
    dtContasApagar.ClassName; { dtContasApagar: TfrxDBDataset; }
    qrySangrias.ClassName; { qrySangrias: TIBQuery; }
    dtSangrias.ClassName; { dtSangrias: TfrxDBDataset; }
    qryConsumoAtualMesas.ClassName; { qryConsumoAtualMesas: TIBQuery; }
    dtConsumoAtualMesas.ClassName; { dtConsumoAtualMesas: TfrxDBDataset; }
    qryBorderoContasPagar.ClassName; { qryBorderoContasPagar: TIBQuery; }
    dtBorderoContasApagar.ClassName; { dtBorderoContasApagar: TfrxDBDataset; }
    DsqryBorderoContasPagar.ClassName; { DsqryBorderoContasPagar: TDataSource; }
    qryParcelasContasApagar.ClassName; { qryParcelasContasApagar: TIBQuery; }
    DtqryParcelasContasApagar.ClassName; { DtqryParcelasContasApagar: TfrxDBDataset; }
    dtRankingProdutos.ClassName; { dtRankingProdutos: TfrxDBDataset; }
    qryRelEstatisticaVendas.ClassName; { qryRelEstatisticaVendas: TIBQuery; }
    dtRelEstatisticaVendas.ClassName; { dtRelEstatisticaVendas: TfrxDBDataset; }
    qryResumoCaixaTurno.ClassName; { qryResumoCaixaTurno: TIBQuery; }
    dtResumoCaixaTurno.ClassName; { dtResumoCaixaTurno: TfrxDBDataset; }
    qryProdutosTransferenciaMesas.ClassName; { qryProdutosTransferenciaMesas: TIBQuery; }
    frxDBDataset1.ClassName; { frxDBDataset1: TfrxDBDataset; }
    dsQryTransferenciaMesas.ClassName; { dsQryTransferenciaMesas: TDataSource; }
    qryRD.ClassName; { qryRD: TIBQuery; }
    dtRd.ClassName; { dtRd: TfrxDBDataset; }
    qryRelGruposApuracao.ClassName; { qryRelGruposApuracao: TIBQuery; }
    ddtRelGruposApuracao.ClassName; { ddtRelGruposApuracao: TfrxDBDataset; }
    qryRelGruposApuracaoSintetico.ClassName; { qryRelGruposApuracaoSintetico: TIBQuery; }
    frxDBDataset2.ClassName; { frxDBDataset2: TfrxDBDataset; }
    qryComparativoVendas.ClassName; { qryComparativoVendas: TIBQuery; }
    dtComparativoPeriodoVendas.ClassName; { dtComparativoPeriodoVendas: TfrxDBDataset; }
    dtManifestacaoNFE.ClassName; { dtManifestacaoNFE: TfrxDBDataset; }
    qryProd.ClassName; { qryProd: TIBQuery; }
    dtProd.ClassName; { dtProd: TfrxDBDataset; }
    dtProjecoesRD.ClassName; { dtProjecoesRD: TfrxDBDataset; }
    qryProjecaoRD.ClassName; { qryProjecaoRD: TIBQuery; }
    qryProjecaoRDRESULTADO.ClassName; { qryProjecaoRDRESULTADO: TSmallintField; }
    qryProjecaoRDCOD_GRUPO_RAIZ.ClassName; { qryProjecaoRDCOD_GRUPO_RAIZ: TIBStringField; }
    qryProjecaoRDDESC_RAIZ.ClassName; { qryProjecaoRDDESC_RAIZ: TIBStringField; }
    qryProjecaoRDDESDOBRAMENTO_PAI.ClassName; { qryProjecaoRDDESDOBRAMENTO_PAI: TIBStringField; }
    qryProjecaoRDCOD_GRUPO_PAI.ClassName; { qryProjecaoRDCOD_GRUPO_PAI: TIBStringField; }
    qryProjecaoRDDESC_PAI.ClassName; { qryProjecaoRDDESC_PAI: TIBStringField; }
    qryProjecaoRDDESDOBRAMENTO_FILHO.ClassName; { qryProjecaoRDDESDOBRAMENTO_FILHO: TIBStringField; }
    qryProjecaoRDCOD_GRUPO.ClassName; { qryProjecaoRDCOD_GRUPO: TIBStringField; }
    qryProjecaoRDNIVEL.ClassName; { qryProjecaoRDNIVEL: TSmallintField; }
    qryProjecaoRDDESCRICAO.ClassName; { qryProjecaoRDDESCRICAO: TIBStringField; }
    qryProjecaoRDPROJECAO_INICIAL.ClassName; { qryProjecaoRDPROJECAO_INICIAL: TFloatField; }
    qryProjecaoRDPERC_PROJ_FAT.ClassName; { qryProjecaoRDPERC_PROJ_FAT: TIBBCDField; }
    qryProjecaoRDREPROJECAO.ClassName; { qryProjecaoRDREPROJECAO: TFloatField; }
    qryProjecaoRDPERC_REPROJ_FAT.ClassName; { qryProjecaoRDPERC_REPROJ_FAT: TIBBCDField; }
    qryProjecaoRDTOTAL.ClassName; { qryProjecaoRDTOTAL: TFloatField; }
    qryProjecaoRDPERC_FAT_REAL.ClassName; { qryProjecaoRDPERC_FAT_REAL: TIBBCDField; }
    qryProjecaoRDSALDO.ClassName; { qryProjecaoRDSALDO: TFloatField; }
    qryProjecaoRDPERC_GERAL.ClassName; { qryProjecaoRDPERC_GERAL: TIBBCDField; }
    qryProjecaoRDPERC_GRUPO_PAI.ClassName; { qryProjecaoRDPERC_GRUPO_PAI: TIBBCDField; }
    qryProjecaoRDPROJ_FAT_MES.ClassName; { qryProjecaoRDPROJ_FAT_MES: TFloatField; }
    qryProjecaoRDREPROJ_FAT_MES.ClassName; { qryProjecaoRDREPROJ_FAT_MES: TFloatField; }
    qryProjecaoRDFAT_REAL_MES.ClassName; { qryProjecaoRDFAT_REAL_MES: TFloatField; }
    dsProjecaoRD.ClassName; { dsProjecaoRD: TDataSource; }
    rpt.ClassName; { rpt: TfrxReport; }
    Data.ClassName; { Data: TfrxDataPage; }
    Page1.ClassName; { Page1: TfrxReportPage; }
    ReportTitle3.ClassName; { ReportTitle3: TfrxReportTitle; }
    Memo43.ClassName; { Memo43: TfrxMemoView; }
    Memo44.ClassName; { Memo44: TfrxMemoView; }
    Memo49.ClassName; { Memo49: TfrxMemoView; }
    Memo57.ClassName; { Memo57: TfrxMemoView; }
    Memo58.ClassName; { Memo58: TfrxMemoView; }
    Memo61.ClassName; { Memo61: TfrxMemoView; }
    Memo42.ClassName; { Memo42: TfrxMemoView; }
    ReportSummary1.ClassName; { ReportSummary1: TfrxReportSummary; }
    DBCross1.ClassName; { DBCross1: TfrxDBCrossView; }
    Page2.ClassName; { Page2: TfrxReportPage; }
    ReportTitle1.ClassName; { ReportTitle1: TfrxReportTitle; }
    Memo1.ClassName; { Memo1: TfrxMemoView; }
    Memo2.ClassName; { Memo2: TfrxMemoView; }
    Memo3.ClassName; { Memo3: TfrxMemoView; }
    Memo5.ClassName; { Memo5: TfrxMemoView; }
    Memo6.ClassName; { Memo6: TfrxMemoView; }
    Memo7.ClassName; { Memo7: TfrxMemoView; }
    Memo4.ClassName; { Memo4: TfrxMemoView; }
    Header1.ClassName; { Header1: TfrxHeader; }
    Memo9.ClassName; { Memo9: TfrxMemoView; }
    Memo10.ClassName; { Memo10: TfrxMemoView; }
    Memo11.ClassName; { Memo11: TfrxMemoView; }
    Memo12.ClassName; { Memo12: TfrxMemoView; }
    Memo13.ClassName; { Memo13: TfrxMemoView; }
    Memo14.ClassName; { Memo14: TfrxMemoView; }
    Memo15.ClassName; { Memo15: TfrxMemoView; }
    Memo16.ClassName; { Memo16: TfrxMemoView; }
    MasterData1.ClassName; { MasterData1: TfrxMasterData; }
    SysMemo2.ClassName; { SysMemo2: TfrxSysMemoView; }
    SysMemo3.ClassName; { SysMemo3: TfrxSysMemoView; }
    SysMemo4.ClassName; { SysMemo4: TfrxSysMemoView; }
    SysMemo5.ClassName; { SysMemo5: TfrxSysMemoView; }
    SysMemo6.ClassName; { SysMemo6: TfrxSysMemoView; }
    Memo8.ClassName; { Memo8: TfrxMemoView; }
    ReportSummary2.ClassName; { ReportSummary2: TfrxReportSummary; }
    SysMemo7.ClassName; { SysMemo7: TfrxSysMemoView; }
    SysMemo8.ClassName; { SysMemo8: TfrxSysMemoView; }
    SysMemo9.ClassName; { SysMemo9: TfrxSysMemoView; }
    SysMemo10.ClassName; { SysMemo10: TfrxSysMemoView; }
    SysMemo11.ClassName; { SysMemo11: TfrxSysMemoView; }
    Page3.ClassName; { Page3: TfrxReportPage; }
    Chart1.ClassName; { Chart1: TfrxChartView; }
    qryProdutosGarcons.ClassName; { qryProdutosGarcons: TIBQuery; }
    qryProdutosGarconsCOD_GARCON.ClassName; { qryProdutosGarconsCOD_GARCON: TIBStringField; }
    qryProdutosGarconsAPELIDO.ClassName; { qryProdutosGarconsAPELIDO: TIBStringField; }
    qryProdutosGarconsCOD_BARRAS.ClassName; { qryProdutosGarconsCOD_BARRAS: TIBStringField; }
    qryProdutosGarconsDESCRICAO.ClassName; { qryProdutosGarconsDESCRICAO: TIBStringField; }
    qryProdutosGarconsDESC_G_RAIZ.ClassName; { qryProdutosGarconsDESC_G_RAIZ: TIBStringField; }
    qryProdutosGarconsDESC_G_PAI.ClassName; { qryProdutosGarconsDESC_G_PAI: TIBStringField; }
    qryProdutosGarconsDESCRICAO_GRUPO.ClassName; { qryProdutosGarconsDESCRICAO_GRUPO: TIBStringField; }
    qryProdutosGarconsCOD_GRUPO.ClassName; { qryProdutosGarconsCOD_GRUPO: TIBStringField; }
    qryProdutosGarconsQUANTIDADE_VENDIDA.ClassName; { qryProdutosGarconsQUANTIDADE_VENDIDA: TFMTBCDField; }
    qryProdutosGarconsTOTAL_VENDIDO.ClassName; { qryProdutosGarconsTOTAL_VENDIDO: TFMTBCDField; }
    qryProdutosGarconsTOTAL_COMISSAO.ClassName; { qryProdutosGarconsTOTAL_COMISSAO: TFMTBCDField; }
    dsProdutosGarcons.ClassName; { dsProdutosGarcons: TDataSource; }
    qryProdutosVendidosCSTPis.ClassName; { qryProdutosVendidosCSTPis: TIBQuery; }
    dtProdutosVendidosPisCofins.ClassName; { dtProdutosVendidosPisCofins: TfrxDBDataset; }
    qryAlteracoesPedidos.ClassName; { qryAlteracoesPedidos: TIBQuery; }
    QryPedidosAlterados.ClassName; { QryPedidosAlterados: TIBQuery; }
    QryPedidosAlteradosCOD_PEDIDO.ClassName; { QryPedidosAlteradosCOD_PEDIDO: TIBStringField; }
    dtPedidosAlterados.ClassName; { dtPedidosAlterados: TfrxDBDataset; }
    dsPedidosAlterados.ClassName; { dsPedidosAlterados: TDataSource; }
    dtAlteracoesPedido.ClassName; { dtAlteracoesPedido: TfrxDBDataset; }
    qryProdutosAlteracaoPedido.ClassName; { qryProdutosAlteracaoPedido: TIBQuery; }
    dsQryAlteracoesPedidos.ClassName; { dsQryAlteracoesPedidos: TDataSource; }
    dtProdutosAlteracaoPedido.ClassName; { dtProdutosAlteracaoPedido: TfrxDBDataset; }
    frxDOCXExport1.ClassName; { frxDOCXExport1: TfrxDOCXExport; }
    dtFaturamentoDiarioPeriodoSinteticoEstacao.ClassName; { dtFaturamentoDiarioPeriodoSinteticoEstacao: TfrxDBDataset; }
    qryRelComparativoProdutos.ClassName; { qryRelComparativoProdutos: TIBQuery; }
    dscdsRelProdutosVendidosTemp.ClassName; { dscdsRelProdutosVendidosTemp: TDataSource; }
    DTVARIOSPERIODOS.ClassName; { DTVARIOSPERIODOS: TfrxDBDataset; }
    qryRelEstaticoVendaDiario.ClassName; { qryRelEstaticoVendaDiario: TIBQuery; }
    dtEstatisticoVendasDiario.ClassName; { dtEstatisticoVendasDiario: TfrxDBDataset; }
    cdsRelProdutosVendidosTemp.ClassName; { cdsRelProdutosVendidosTemp: TClientDataSet; }
    cdsRelProdutosVendidosTempcod_empresa.ClassName; { cdsRelProdutosVendidosTempcod_empresa: TStringField; }
    cdsRelProdutosVendidosTempnome_empresa.ClassName; { cdsRelProdutosVendidosTempnome_empresa: TStringField; }
    cdsRelProdutosVendidosTempdata_inicial.ClassName; { cdsRelProdutosVendidosTempdata_inicial: TDateField; }
    cdsRelProdutosVendidosTempdata_final.ClassName; { cdsRelProdutosVendidosTempdata_final: TDateField; }
    cdsRelProdutosVendidosTempalias_empresa.ClassName; { cdsRelProdutosVendidosTempalias_empresa: TStringField; }
    cdsRelProdutosVendidosTempHORA_INICIAL.ClassName; { cdsRelProdutosVendidosTempHORA_INICIAL: TTimeField; }
    cdsRelProdutosVendidosTempHORA_FINAL.ClassName; { cdsRelProdutosVendidosTempHORA_FINAL: TTimeField; }
    frxDBDataset3.ClassName; { frxDBDataset3: TfrxDBDataset; }
    qryRdComparativo.ClassName; { qryRdComparativo: TIBQuery; }
    dtRdComparativo.ClassName; { dtRdComparativo: TfrxDBDataset; }
    qryRelFatHora.ClassName; { qryRelFatHora: TIBQuery; }
    qryRelFatHoraHORA.ClassName; { qryRelFatHoraHORA: TSmallintField; }
    qryRelFatHoraDATA.ClassName; { qryRelFatHoraDATA: TDateField; }
    qryRelFatHoraTC.ClassName; { qryRelFatHoraTC: TIntegerField; }
    qryRelFatHoraTOTAL.ClassName; { qryRelFatHoraTOTAL: TIBBCDField; }
    qryRelFatHoraTM.ClassName; { qryRelFatHoraTM: TIBBCDField; }
    DTFatHora.ClassName; { DTFatHora: TfrxDBDataset; }
    frxDBDataset4.ClassName; { frxDBDataset4: TfrxDBDataset; }
    qryRankClientesDelivery.ClassName; { qryRankClientesDelivery: TIBQuery; }
    dtRankClientesDelivery.ClassName; { dtRankClientesDelivery: TfrxDBDataset; }
    qryRelParametrosFiscais.ClassName; { qryRelParametrosFiscais: TIBQuery; }
    qryRelParametrosFiscaisCOD_PRODUTO.ClassName; { qryRelParametrosFiscaisCOD_PRODUTO: TIBStringField; }
    qryRelParametrosFiscaisDESCRICAO.ClassName; { qryRelParametrosFiscaisDESCRICAO: TIBStringField; }
    qryRelParametrosFiscaisCFOP_SAIDA.ClassName; { qryRelParametrosFiscaisCFOP_SAIDA: TIBStringField; }
    qryRelParametrosFiscaisCSOSN.ClassName; { qryRelParametrosFiscaisCSOSN: TIBStringField; }
    qryRelParametrosFiscaisCST_SAIDA.ClassName; { qryRelParametrosFiscaisCST_SAIDA: TIBStringField; }
    qryRelParametrosFiscaisNCM.ClassName; { qryRelParametrosFiscaisNCM: TIBStringField; }
    qryRelParametrosFiscaisCEST.ClassName; { qryRelParametrosFiscaisCEST: TIBStringField; }
    qryRelParametrosFiscaisALIQ_ICMS.ClassName; { qryRelParametrosFiscaisALIQ_ICMS: TIBStringField; }
    qryRelParametrosFiscaisDESC_GRUPO.ClassName; { qryRelParametrosFiscaisDESC_GRUPO: TIBStringField; }
    qryRelParametrosFiscaisCOD_GRUPO.ClassName; { qryRelParametrosFiscaisCOD_GRUPO: TIBStringField; }
    qryRelParametrosFiscaisREDUCAO_BASE_ICMS.ClassName; { qryRelParametrosFiscaisREDUCAO_BASE_ICMS: TFMTBCDField; }
    qryRelParametrosFiscaisCST_PIS_COFINS.ClassName; { qryRelParametrosFiscaisCST_PIS_COFINS: TIBStringField; }
    qryRelParametrosFiscaisALIQ_PIS.ClassName; { qryRelParametrosFiscaisALIQ_PIS: TIBBCDField; }
    qryRelParametrosFiscaisALIQ_COFINS.ClassName; { qryRelParametrosFiscaisALIQ_COFINS: TIBBCDField; }
    dtRelParametrosFiscais.ClassName; { dtRelParametrosFiscais: TfrxDBDataset; }
    qryResumoMotoboys.ClassName; { qryResumoMotoboys: TIBQuery; }
    frxDBDataset5.ClassName; { frxDBDataset5: TfrxDBDataset; }
    qryRelSangrias.ClassName; { qryRelSangrias: TIBQuery; }
    dtRelSangrias.ClassName; { dtRelSangrias: TfrxDBDataset; }
    qryRelDetalhesVenda.ClassName; { qryRelDetalhesVenda: TIBQuery; }
    dqryRelDetalhesVenda.ClassName; { dqryRelDetalhesVenda: TfrxDBDataset; }
    dsQryRelDetalhesVenda.ClassName; { dsQryRelDetalhesVenda: TDataSource; }
    qryRelProdutosDetalhes.ClassName; { qryRelProdutosDetalhes: TIBQuery; }
    dQryProdutosDetalhesVenda.ClassName; { dQryProdutosDetalhesVenda: TfrxDBDataset; }
    qryPagamentosDetalheVenda.ClassName; { qryPagamentosDetalheVenda: TIBQuery; }
    frxDBDataset6.ClassName; { frxDBDataset6: TfrxDBDataset; }
    qryRelFichasTecnicas.ClassName; { qryRelFichasTecnicas: TIBQuery; }
    DtqryRelFichasTecnicas.ClassName; { DtqryRelFichasTecnicas: TfrxDBDataset; }
    qryItensFichaTecnica.ClassName; { qryItensFichaTecnica: TIBQuery; }
    dsRelFichasTecnicas.ClassName; { dsRelFichasTecnicas: TDataSource; }
    dtqryItensFichaTecnica.ClassName; { dtqryItensFichaTecnica: TfrxDBDataset; }
    qryRelProdutosVendidos.ClassName; { qryRelProdutosVendidos: TIBQuery; }
    dtQryRelProdutosVendidos.ClassName; { dtQryRelProdutosVendidos: TfrxDBDataset; }
    DtqryRelRankingProdutos.ClassName; { DtqryRelRankingProdutos: TfrxDBDataset; }
    qryRankingProdutos.ClassName; { qryRankingProdutos: TFDQuery; }
    qryRelRecebimentosCartoes.ClassName; { qryRelRecebimentosCartoes: TFDQuery; }
    DtqryRelRecebimentosCartoes.ClassName; { DtqryRelRecebimentosCartoes: TfrxDBDataset; }
    qryRelLancamentosRD.ClassName; { qryRelLancamentosRD: TIBQuery; }
    dtLancamentosRD.ClassName; { dtLancamentosRD: TfrxDBDataset; }
    qryCompras.ClassName; { qryCompras: TIBQuery; }
    dtCompras.ClassName; { dtCompras: TfrxDBDataset; }
    qryItensCompra.ClassName; { qryItensCompra: TIBQuery; }
    dtItensCompra.ClassName; { dtItensCompra: TfrxDBDataset; }
    dsQryCompras.ClassName; { dsQryCompras: TDataSource; }
    frxPDFExport1.ClassName; { frxPDFExport1: TfrxPDFExport; }
    frxXMLExport1.ClassName; { frxXMLExport1: TfrxXMLExport; }
    frxCSVExport1.ClassName; { frxCSVExport1: TfrxCSVExport; }
    frxXLSExport1.ClassName; { frxXLSExport1: TfrxXLSExport; }
    frxXLSXExport1.ClassName; { frxXLSXExport1: TfrxXLSXExport; }
    frxDOCXExport2.ClassName; { frxDOCXExport2: TfrxDOCXExport; }
    dtFaturamentoResumido.ClassName; { dtFaturamentoResumido: TfrxDBDataset; }
    frxChartObject1.ClassName; { frxChartObject1: TfrxChartObject; }
  end;

{ frm_cad_contas: Tfrm_cad_contas }
  with Tfrm_cad_contas(nil) do { uu_cad_contas.pas }
  begin
    pn_principal.ClassName; { pn_principal: TPanel; }
    pn_codigo.ClassName; { pn_codigo: TPanel; }
    bt_pesquisa.ClassName; { bt_pesquisa: TSpeedButton; }
    ed_codigo.ClassName; { ed_codigo: TMaskEdit; }
    pn_descricao.ClassName; { pn_descricao: TPanel; }
    Label1.ClassName; { Label1: TLabel; }
    ed_descricao.ClassName; { ed_descricao: TEdit; }
    ckb_fixa.ClassName; { ckb_fixa: TCheckBox; }
    pn_botoes.ClassName; { pn_botoes: TPanel; }
    bt_alterar.ClassName; { bt_alterar: TBitBtn; }
    bt_gravar.ClassName; { bt_gravar: TBitBtn; }
    bt_cancelar.ClassName; { bt_cancelar: TBitBtn; }
    bt_sair.ClassName; { bt_sair: TBitBtn; }
    bt_excluir.ClassName; { bt_excluir: TBitBtn; }
    bt_consultar.ClassName; { bt_consultar: TBitBtn; }
    bt_imprimir.ClassName; { bt_imprimir: TBitBtn; }
  end;

{ frm_cad_historico_caixa: Tfrm_cad_historico_caixa }
  with Tfrm_cad_historico_caixa(nil) do { uu_cad_historico.pas }
  begin
    pn_principal.ClassName; { pn_principal: TPanel; }
    pn_codigo.ClassName; { pn_codigo: TPanel; }
    bt_pesquisa.ClassName; { bt_pesquisa: TSpeedButton; }
    ed_codigo.ClassName; { ed_codigo: TMaskEdit; }
    pn_descricao.ClassName; { pn_descricao: TPanel; }
    Label1.ClassName; { Label1: TLabel; }
    ed_descricao.ClassName; { ed_descricao: TDBEdit; }
    pn_botoes.ClassName; { pn_botoes: TPanel; }
    bt_novo.ClassName; { bt_novo: TBitBtn; }
    bt_alterar.ClassName; { bt_alterar: TBitBtn; }
    bt_gravar.ClassName; { bt_gravar: TBitBtn; }
    bt_cancelar.ClassName; { bt_cancelar: TBitBtn; }
    bt_sair.ClassName; { bt_sair: TBitBtn; }
    bt_excluir.ClassName; { bt_excluir: TBitBtn; }
    bt_consultar.ClassName; { bt_consultar: TBitBtn; }
    bt_imprimir.ClassName; { bt_imprimir: TBitBtn; }
  end;

{ frm_cs_historicos_caixa: Tfrm_cs_historicos_caixa }
  with Tfrm_cs_historicos_caixa(nil) do { uu_cs_historicos.pas }
  begin
    Panel3.ClassName; { Panel3: TPanel; }
    Label1.ClassName; { Label1: TLabel; }
    ed_parametro.ClassName; { ed_parametro: TEdit; }
    RadioGroup1.ClassName; { RadioGroup1: TRadioGroup; }
    Panel1.ClassName; { Panel1: TPanel; }
    DBGrid1.ClassName; { DBGrid1: TDBGrid; }
  end;

{ frm_modelo_vazio: Tfrm_modelo_vazio }
  with Tfrm_modelo_vazio(nil) do { uu_modelo_Vazio.pas }
  begin
    botao_pesquisa.ClassName; { botao_pesquisa: TSpeedButton; }
    Edit1.ClassName; { Edit1: TEdit; }
    cliques.ClassName; { cliques: TActionList; }
    actPesquisaFormaPagamento.ClassName; { actPesquisaFormaPagamento: TControlAction; }
    actExitFormaPagamento.ClassName; { actExitFormaPagamento: TAction; }
    actlBusca.ClassName; { actlBusca: TJvControlActionList; }
    ACTF2ed_cod_grupo_fornecedor.ClassName; { ACTF2ed_cod_grupo_fornecedor: TAction; }
    ACTF2ed_cod_fornecedor.ClassName; { ACTF2ed_cod_fornecedor: TAction; }
    ACTF2edCodBairro.ClassName; { ACTF2edCodBairro: TAction; }
    ACTF2ed_cod_tipo_documento.ClassName; { ACTF2ed_cod_tipo_documento: TAction; }
    ACTF2ed_cod_tipo_entrada.ClassName; { ACTF2ed_cod_tipo_entrada: TAction; }
    ACTF2ed_cfop.ClassName; { ACTF2ed_cfop: TAction; }
    ACTF2edCfopTransferencia.ClassName; { ACTF2edCfopTransferencia: TAction; }
    ACTF2edCfopDevolucao.ClassName; { ACTF2edCfopDevolucao: TAction; }
    ACTF2edCodTipoItemSped.ClassName; { ACTF2edCodTipoItemSped: TAction; }
    ACTF2edCodNCM.ClassName; { ACTF2edCodNCM: TAction; }
    ACTF2edCodGeneroItem.ClassName; { ACTF2edCodGeneroItem: TAction; }
    ACTF2ed_cefop_entradas.ClassName; { ACTF2ed_cefop_entradas: TAction; }
    ACTF2ed_cefop_saidas.ClassName; { ACTF2ed_cefop_saidas: TAction; }
    ACTF2ed_cod_modelo_nota_fiscal.ClassName; { ACTF2ed_cod_modelo_nota_fiscal: TAction; }
    ACTF2edCodSituacaoDocFiscal.ClassName; { ACTF2edCodSituacaoDocFiscal: TAction; }
    ACTF2ed_cst.ClassName; { ACTF2ed_cst: TAction; }
    ACTF2edCstSaida.ClassName; { ACTF2edCstSaida: TAction; }
    ACTF2edCstTransferencia.ClassName; { ACTF2edCstTransferencia: TAction; }
    ACTF2edCstDevolucao.ClassName; { ACTF2edCstDevolucao: TAction; }
    ACTF2edCstPisCofins.ClassName; { ACTF2edCstPisCofins: TAction; }
    ACTF2ed_cod_usuario.ClassName; { ACTF2ed_cod_usuario: TAction; }
    ACTF2ed_cod_grupo.ClassName; { ACTF2ed_cod_grupo: TAction; }
    ACTF2edCodGrupoRD.ClassName; { ACTF2edCodGrupoRD: TAction; }
    ACTF2ed_cod_historico.ClassName; { ACTF2ed_cod_historico: TAction; }
    ACTF2ed_cod_cidade.ClassName; { ACTF2ed_cod_cidade: TAction; }
    ACTF2edCodGrupoTouch.ClassName; { ACTF2edCodGrupoTouch: TAction; }
    ACTF2ed_cod_estado.ClassName; { ACTF2ed_cod_estado: TAction; }
    ACTF2ed_cod_centro_custo.ClassName; { ACTF2ed_cod_centro_custo: TAction; }
    ACTF2ed_cod_item.ClassName; { ACTF2ed_cod_item: TAction; }
    ACTF2ed_cod_item_saida.ClassName; { ACTF2ed_cod_item_saida: TAction; }
    ACTF2edCodSubmateria.ClassName; { ACTF2edCodSubmateria: TAction; }
    ACTF2edCodTipoBaixaEstoque.ClassName; { ACTF2edCodTipoBaixaEstoque: TAction; }
    ACTF2ed_cod_barras_item.ClassName; { ACTF2ed_cod_barras_item: TAction; }
    ACTF2ed_cod_un_entrada.ClassName; { ACTF2ed_cod_un_entrada: TAction; }
    ACTF2ed_cod_un_saida.ClassName; { ACTF2ed_cod_un_saida: TAction; }
    ACTF2edCodSaborPizza.ClassName; { ACTF2edCodSaborPizza: TAction; }
    ACTF2edCodUnFracao.ClassName; { ACTF2edCodUnFracao: TAction; }
    ACTF2edCodUnPadrao.ClassName; { ACTF2edCodUnPadrao: TAction; }
    ACTF2ed_cod_garcon.ClassName; { ACTF2ed_cod_garcon: TAction; }
    ACTF2edCodPromoter.ClassName; { ACTF2edCodPromoter: TAction; }
    ACTF2edCodDepartamento.ClassName; { ACTF2edCodDepartamento: TAction; }
    ACTF2edCodGuarnicao.ClassName; { ACTF2edCodGuarnicao: TAction; }
    ACTF2ed_cod_metre.ClassName; { ACTF2ed_cod_metre: TAction; }
    ACTF2ed_cod_tipo_cliente.ClassName; { ACTF2ed_cod_tipo_cliente: TAction; }
    ACTF2ed_cod_cliente.ClassName; { ACTF2ed_cod_cliente: TAction; }
    ACTF2ed_cod_cliente_reduzido.ClassName; { ACTF2ed_cod_cliente_reduzido: TAction; }
    ACTF2edRgCliente.ClassName; { ACTF2edRgCliente: TAction; }
    ACTF2ed_cod_mini_printer.ClassName; { ACTF2ed_cod_mini_printer: TAction; }
    ACTF2edTelClienteDelivery.ClassName; { ACTF2edTelClienteDelivery: TAction; }
    ACTF2edCodBarrasProduto.ClassName; { ACTF2edCodBarrasProduto: TAction; }
    ACTF2edCodProduto.ClassName; { ACTF2edCodProduto: TAction; }
    edCodPizza.ClassName; { edCodPizza: TAction; }
    ACTF2edCodAliquota.ClassName; { ACTF2edCodAliquota: TAction; }
    ACTF2edCodFormaPagamento.ClassName; { ACTF2edCodFormaPagamento: TAction; }
    ACTF2edCodLoja.ClassName; { ACTF2edCodLoja: TAction; }
    ACTF2edCodCliDelivery.ClassName; { ACTF2edCodCliDelivery: TAction; }
    ACTF2edCodEntregador.ClassName; { ACTF2edCodEntregador: TAction; }
  end;

{ frm_cancela_item_restaurante: Tfrm_cancela_item_restaurante }
  with Tfrm_cancela_item_restaurante(nil) do { uu_cancela_item_restaurante.pas }
  begin
    botao_pesquisa.ClassName; { botao_pesquisa: TSpeedButton; }
    Edit1.ClassName; { Edit1: TEdit; }
    Panel2.ClassName; { Panel2: TPanel; }
    Panel4.ClassName; { Panel4: TPanel; }
    Label4.ClassName; { Label4: TLabel; }
    cmbMotivo.ClassName; { cmbMotivo: TRxDBLookupCombo; }
    Panel6.ClassName; { Panel6: TPanel; }
    Label5.ClassName; { Label5: TLabel; }
    memoObs.ClassName; { memoObs: TMemo; }
    Panel3.ClassName; { Panel3: TPanel; }
    Label2.ClassName; { Label2: TLabel; }
    lbDescricaoProduto.ClassName; { lbDescricaoProduto: TLabel; }
    Label3.ClassName; { Label3: TLabel; }
    Panel7.ClassName; { Panel7: TPanel; }
    AdvTouchKeyboard1.ClassName; { AdvTouchKeyboard1: TAdvTouchKeyboard; }
    Panel9.ClassName; { Panel9: TPanel; }
    btConfirmar.ClassName; { btConfirmar: TAdvGlassButton; }
    btCancelar.ClassName; { btCancelar: TAdvGlassButton; }
  end;

{ frm_cs_tipos_operacao: Tfrm_cs_tipos_operacao }
  with Tfrm_cs_tipos_operacao(nil) do { uu_cs_tipos_operacao.pas }
  begin
    Panel3.ClassName; { Panel3: TPanel; }
    Label1.ClassName; { Label1: TLabel; }
    ed_parametro.ClassName; { ed_parametro: TEdit; }
    RadioGroup1.ClassName; { RadioGroup1: TRadioGroup; }
    Panel1.ClassName; { Panel1: TPanel; }
    DBGrid1.ClassName; { DBGrid1: TDBGrid; }
  end;

{ frmCadFornecedores: TfrmCadFornecedores }
  with TfrmCadFornecedores(nil) do { uu_cad_fornecedor.pas }
  begin
    pn_principal.ClassName; { pn_principal: TPanel; }
    pn_codigo.ClassName; { pn_codigo: TPanel; }
    bt_pesquisa.ClassName; { bt_pesquisa: TSpeedButton; }
    ed_codigo.ClassName; { ed_codigo: TMaskEdit; }
    pn_campos.ClassName; { pn_campos: TPanel; }
    Label1.ClassName; { Label1: TLabel; }
    Label2.ClassName; { Label2: TLabel; }
    Label12.ClassName; { Label12: TLabel; }
    Label14.ClassName; { Label14: TLabel; }
    Label3.ClassName; { Label3: TLabel; }
    Label4.ClassName; { Label4: TLabel; }
    Label7.ClassName; { Label7: TLabel; }
    Label8.ClassName; { Label8: TLabel; }
    Label9.ClassName; { Label9: TLabel; }
    Label10.ClassName; { Label10: TLabel; }
    Label11.ClassName; { Label11: TLabel; }
    Label15.ClassName; { Label15: TLabel; }
    Label19.ClassName; { Label19: TLabel; }
    Label20.ClassName; { Label20: TLabel; }
    Label22.ClassName; { Label22: TLabel; }
    Panel2.ClassName; { Panel2: TPanel; }
    ed_razao_social.ClassName; { ed_razao_social: TDBEdit; }
    ed_nome_fantasia.ClassName; { ed_nome_fantasia: TDBEdit; }
    ckCNPJ.ClassName; { ckCNPJ: TRadioButton; }
    ckCPF.ClassName; { ckCPF: TRadioButton; }
    ed_cnpj.ClassName; { ed_cnpj: TDBEdit; }
    ed_ie.ClassName; { ed_ie: TDBEdit; }
    i_municipal.ClassName; { i_municipal: TDBEdit; }
    ed_endereco.ClassName; { ed_endereco: TDBEdit; }
    DBEdit1.ClassName; { DBEdit1: TDBEdit; }
    DBEdit2.ClassName; { DBEdit2: TDBEdit; }
    ed_bairro.ClassName; { ed_bairro: TDBEdit; }
    ed_cep.ClassName; { ed_cep: TDBEdit; }
    ed_telefone.ClassName; { ed_telefone: TDBEdit; }
    ed_fax.ClassName; { ed_fax: TDBEdit; }
    ed_email.ClassName; { ed_email: TDBEdit; }
    DBMemo1.ClassName; { DBMemo1: TDBMemo; }
    ckbEstrangeiro.ClassName; { ckbEstrangeiro: TCheckBox; }
    cbPais.ClassName; { cbPais: TcxLookupComboBox; }
    cbEstado.ClassName; { cbEstado: TcxLookupComboBox; }
    cbCidade.ClassName; { cbCidade: TcxLookupComboBox; }
    pn_botoes.ClassName; { pn_botoes: TPanel; }
    bt_novo.ClassName; { bt_novo: TBitBtn; }
    bt_alterar.ClassName; { bt_alterar: TBitBtn; }
    bt_gravar.ClassName; { bt_gravar: TBitBtn; }
    bt_cancelar.ClassName; { bt_cancelar: TBitBtn; }
    bt_sair.ClassName; { bt_sair: TBitBtn; }
    bt_excluir.ClassName; { bt_excluir: TBitBtn; }
    bt_consultar.ClassName; { bt_consultar: TBitBtn; }
    bt_imprimir.ClassName; { bt_imprimir: TBitBtn; }
  end;

{ frm_cs_cidades: Tfrm_cs_cidades }
  with Tfrm_cs_cidades(nil) do { uu_cs_cidades.pas }
  begin
    Panel3.ClassName; { Panel3: TPanel; }
    Label1.ClassName; { Label1: TLabel; }
    ed_parametro.ClassName; { ed_parametro: TEdit; }
    RadioGroup1.ClassName; { RadioGroup1: TRadioGroup; }
    Panel1.ClassName; { Panel1: TPanel; }
    DBGrid1.ClassName; { DBGrid1: TDBGrid; }
    Panel2.ClassName; { Panel2: TPanel; }
    bt_selecionar.ClassName; { bt_selecionar: TBitBtn; }
    bt_cancelar.ClassName; { bt_cancelar: TBitBtn; }
  end;

{ frm_cs_grupos_fornecedores: Tfrm_cs_grupos_fornecedores }
  with Tfrm_cs_grupos_fornecedores(nil) do { uu_cs_grupos_fornecedores.pas }
  begin
    Panel3.ClassName; { Panel3: TPanel; }
    Label1.ClassName; { Label1: TLabel; }
    ed_parametro.ClassName; { ed_parametro: TEdit; }
    RadioGroup1.ClassName; { RadioGroup1: TRadioGroup; }
    Panel1.ClassName; { Panel1: TPanel; }
    DBGrid1.ClassName; { DBGrid1: TDBGrid; }
  end;

{ frm_cs_grupos: Tfrm_cs_grupos }
  with Tfrm_cs_grupos(nil) do { uu_cs_grupos.pas }
  begin
    Panel3.ClassName; { Panel3: TPanel; }
    Label1.ClassName; { Label1: TLabel; }
    ed_parametro.ClassName; { ed_parametro: TEdit; }
    RadioGroup1.ClassName; { RadioGroup1: TRadioGroup; }
    Panel1.ClassName; { Panel1: TPanel; }
    DBGrid1.ClassName; { DBGrid1: TDBGrid; }
    Panel2.ClassName; { Panel2: TPanel; }
    bt_selecionar.ClassName; { bt_selecionar: TBitBtn; }
    bt_cancelar.ClassName; { bt_cancelar: TBitBtn; }
  end;

{ frm_cs_itens: Tfrm_cs_itens }
  with Tfrm_cs_itens(nil) do { uu_cs_item_estoque.pas }
  begin
    Panel7.ClassName; { Panel7: TPanel; }
    Label5.ClassName; { Label5: TLabel; }
    Panel3.ClassName; { Panel3: TPanel; }
    Panel1.ClassName; { Panel1: TPanel; }
    Panel2.ClassName; { Panel2: TPanel; }
    Label1.ClassName; { Label1: TLabel; }
    edDescricaoProduto.ClassName; { edDescricaoProduto: TEdit; }
    Panel4.ClassName; { Panel4: TPanel; }
    cxGrid1.ClassName; { cxGrid1: TcxGrid; }
    cxGrid1DBTableView1.ClassName; { cxGrid1DBTableView1: TcxGridDBTableView; }
    cxGrid1DBTableView1COD_PRODUTO.ClassName; { cxGrid1DBTableView1COD_PRODUTO: TcxGridDBColumn; }
    cxGrid1DBTableView1DESCRICAO.ClassName; { cxGrid1DBTableView1DESCRICAO: TcxGridDBColumn; }
    cxGrid1DBTableView1ESTOQUE.ClassName; { cxGrid1DBTableView1ESTOQUE: TcxGridDBColumn; }
    cxGrid1DBTableView1DESCUNIDADE.ClassName; { cxGrid1DBTableView1DESCUNIDADE: TcxGridDBColumn; }
    cxGrid1DBTableView1QUANTIDADE_MINIMA.ClassName; { cxGrid1DBTableView1QUANTIDADE_MINIMA: TcxGridDBColumn; }
    cxGrid1DBTableView1FOLGA.ClassName; { cxGrid1DBTableView1FOLGA: TcxGridDBColumn; }
    cxGrid1Level1.ClassName; { cxGrid1Level1: TcxGridLevel; }
    Panel5.ClassName; { Panel5: TPanel; }
    btSair.ClassName; { btSair: TAdvGlassButton; }
    btSelecionar.ClassName; { btSelecionar: TAdvGlassButton; }
    cxStyleRepository1.ClassName; { cxStyleRepository1: TcxStyleRepository; }
    cxStyle2.ClassName; { cxStyle2: TcxStyle; }
    stCabecalho.ClassName; { stCabecalho: TcxStyle; }
    stConfirmada.ClassName; { stConfirmada: TcxStyle; }
    stCancelada.ClassName; { stCancelada: TcxStyle; }
    stCiencia.ClassName; { stCiencia: TcxStyle; }
    stSelecionada.ClassName; { stSelecionada: TcxStyle; }
  end;

{ frm_cs_unidades: Tfrm_cs_unidades }
  with Tfrm_cs_unidades(nil) do { uu_cs_unidades.pas }
  begin
    Panel3.ClassName; { Panel3: TPanel; }
    Label1.ClassName; { Label1: TLabel; }
    ed_parametro.ClassName; { ed_parametro: TEdit; }
    RadioGroup1.ClassName; { RadioGroup1: TRadioGroup; }
    Panel1.ClassName; { Panel1: TPanel; }
    DBGrid1.ClassName; { DBGrid1: TDBGrid; }
    Panel2.ClassName; { Panel2: TPanel; }
    bt_selecionar.ClassName; { bt_selecionar: TBitBtn; }
    bt_cancelar.ClassName; { bt_cancelar: TBitBtn; }
  end;

{ frmCadGarcons: TfrmCadGarcons }
  with TfrmCadGarcons(nil) do { uu_cad_garcons.pas }
  begin
    pn_principal.ClassName; { pn_principal: TPanel; }
    pn_codigo.ClassName; { pn_codigo: TPanel; }
    bt_pesquisa.ClassName; { bt_pesquisa: TSpeedButton; }
    Label2.ClassName; { Label2: TLabel; }
    ed_codigo.ClassName; { ed_codigo: TMaskEdit; }
    Panel1.ClassName; { Panel1: TPanel; }
    Label6.ClassName; { Label6: TLabel; }
    ed_nome_garcon.ClassName; { ed_nome_garcon: TDBEdit; }
    pn_metres.ClassName; { pn_metres: TPanel; }
    Label8.ClassName; { Label8: TLabel; }
    bt_pesq_metre.ClassName; { bt_pesq_metre: TSpeedButton; }
    Label1.ClassName; { Label1: TLabel; }
    ed_cod_metre.ClassName; { ed_cod_metre: TDBEdit; }
    Panel2.ClassName; { Panel2: TPanel; }
    ed_nome_metre.ClassName; { ed_nome_metre: TDBEdit; }
    ckb_metre.ClassName; { ckb_metre: TDBCheckBox; }
    pn_botoes.ClassName; { pn_botoes: TPanel; }
    bt_novo.ClassName; { bt_novo: TBitBtn; }
    bt_alterar.ClassName; { bt_alterar: TBitBtn; }
    bt_gravar.ClassName; { bt_gravar: TBitBtn; }
    bt_cancelar.ClassName; { bt_cancelar: TBitBtn; }
    bt_sair.ClassName; { bt_sair: TBitBtn; }
    bt_excluir.ClassName; { bt_excluir: TBitBtn; }
    bt_consultar.ClassName; { bt_consultar: TBitBtn; }
    bt_imprimir.ClassName; { bt_imprimir: TBitBtn; }
  end;

{ frm_cs_garcons: Tfrm_cs_garcons }
  with Tfrm_cs_garcons(nil) do { uu_cs_garcons.pas }
  begin
    Panel3.ClassName; { Panel3: TPanel; }
    Label1.ClassName; { Label1: TLabel; }
    ed_parametro.ClassName; { ed_parametro: TEdit; }
    RadioGroup1.ClassName; { RadioGroup1: TRadioGroup; }
    Panel1.ClassName; { Panel1: TPanel; }
    DBGrid1.ClassName; { DBGrid1: TDBGrid; }
    Panel2.ClassName; { Panel2: TPanel; }
    bt_selecionar.ClassName; { bt_selecionar: TBitBtn; }
    bt_cancelar.ClassName; { bt_cancelar: TBitBtn; }
  end;

{ frm_cad_grupos: Tfrm_cad_grupos }
  with Tfrm_cad_grupos(nil) do { uu_cad_grupos.pas }
  begin
    pn_principal.ClassName; { pn_principal: TPanel; }
    pn_codigo.ClassName; { pn_codigo: TPanel; }
    bt_pesquisa.ClassName; { bt_pesquisa: TSpeedButton; }
    ed_codigo.ClassName; { ed_codigo: TMaskEdit; }
    pn_descricao.ClassName; { pn_descricao: TPanel; }
    Label14.ClassName; { Label14: TLabel; }
    Label1.ClassName; { Label1: TLabel; }
    ed_descricao.ClassName; { ed_descricao: TDBEdit; }
    DBEdit1.ClassName; { DBEdit1: TDBEdit; }
    DBCheckBox1.ClassName; { DBCheckBox1: TDBCheckBox; }
    DBCheckBox2.ClassName; { DBCheckBox2: TDBCheckBox; }
    pn_botoes.ClassName; { pn_botoes: TPanel; }
    bt_novo.ClassName; { bt_novo: TBitBtn; }
    bt_alterar.ClassName; { bt_alterar: TBitBtn; }
    bt_gravar.ClassName; { bt_gravar: TBitBtn; }
    bt_cancelar.ClassName; { bt_cancelar: TBitBtn; }
    bt_sair.ClassName; { bt_sair: TBitBtn; }
    bt_excluir.ClassName; { bt_excluir: TBitBtn; }
    bt_consultar.ClassName; { bt_consultar: TBitBtn; }
    bt_imprimir.ClassName; { bt_imprimir: TBitBtn; }
  end;

{ frm_cs_formas_pagto: Tfrm_cs_formas_pagto }
  with Tfrm_cs_formas_pagto(nil) do { uu_cs_formas_pagto.pas }
  begin
    Panel3.ClassName; { Panel3: TPanel; }
    Label1.ClassName; { Label1: TLabel; }
    ed_parametro.ClassName; { ed_parametro: TEdit; }
    RadioGroup1.ClassName; { RadioGroup1: TRadioGroup; }
    Panel1.ClassName; { Panel1: TPanel; }
    DBGrid1.ClassName; { DBGrid1: TDBGrid; }
    Panel2.ClassName; { Panel2: TPanel; }
    bt_selecionar.ClassName; { bt_selecionar: TBitBtn; }
    bt_cancelar.ClassName; { bt_cancelar: TBitBtn; }
  end;

{ frm_cad_clientes: Tfrm_cad_clientes }
  with Tfrm_cad_clientes(nil) do { uu_cad_clientes.pas }
  begin
    pn_principal.ClassName; { pn_principal: TPanel; }
    pn_codigo.ClassName; { pn_codigo: TPanel; }
    bt_pesquisa.ClassName; { bt_pesquisa: TSpeedButton; }
    pn_campos.ClassName; { pn_campos: TPanel; }
    lb_razao.ClassName; { lb_razao: TLabel; }
    Label3.ClassName; { Label3: TLabel; }
    Label4.ClassName; { Label4: TLabel; }
    Label7.ClassName; { Label7: TLabel; }
    Label8.ClassName; { Label8: TLabel; }
    Label9.ClassName; { Label9: TLabel; }
    Label10.ClassName; { Label10: TLabel; }
    Label13.ClassName; { Label13: TLabel; }
    Label17.ClassName; { Label17: TLabel; }
    Label1.ClassName; { Label1: TLabel; }
    ed_endereco.ClassName; { ed_endereco: TDBEdit; }
    ed_bairro.ClassName; { ed_bairro: TDBEdit; }
    ed_cep.ClassName; { ed_cep: TDBEdit; }
    ed_telefone.ClassName; { ed_telefone: TDBEdit; }
    ed_fax.ClassName; { ed_fax: TDBEdit; }
    ed_email.ClassName; { ed_email: TDBEdit; }
    ckb_situacao.ClassName; { ckb_situacao: TDBCheckBox; }
    DBMemo1.ClassName; { DBMemo1: TDBMemo; }
    ed_razao_social.ClassName; { ed_razao_social: TDBEdit; }
    GroupBox1.ClassName; { GroupBox1: TGroupBox; }
    ckCNPJ.ClassName; { ckCNPJ: TRadioButton; }
    ckCPF.ClassName; { ckCPF: TRadioButton; }
    ed_cnpj.ClassName; { ed_cnpj: TDBEdit; }
    DBEdit1.ClassName; { DBEdit1: TDBEdit; }
    DBEdit2.ClassName; { DBEdit2: TDBEdit; }
    pn_botoes.ClassName; { pn_botoes: TPanel; }
    bt_novo.ClassName; { bt_novo: TBitBtn; }
    bt_alterar.ClassName; { bt_alterar: TBitBtn; }
    bt_gravar.ClassName; { bt_gravar: TBitBtn; }
    bt_cancelar.ClassName; { bt_cancelar: TBitBtn; }
    bt_sair.ClassName; { bt_sair: TBitBtn; }
    bt_excluir.ClassName; { bt_excluir: TBitBtn; }
    bt_consultar.ClassName; { bt_consultar: TBitBtn; }
    bt_imprimir.ClassName; { bt_imprimir: TBitBtn; }
  end;

{ frm_cs_tipos_cliente: Tfrm_cs_tipos_cliente }
  with Tfrm_cs_tipos_cliente(nil) do { uu_cs_tipos_cliente.pas }
  begin
    Panel3.ClassName; { Panel3: TPanel; }
    Label1.ClassName; { Label1: TLabel; }
    ed_parametro.ClassName; { ed_parametro: TEdit; }
    RadioGroup1.ClassName; { RadioGroup1: TRadioGroup; }
    Panel1.ClassName; { Panel1: TPanel; }
    DBGrid1.ClassName; { DBGrid1: TDBGrid; }
    Panel2.ClassName; { Panel2: TPanel; }
    bt_selecionar.ClassName; { bt_selecionar: TBitBtn; }
    bt_cancelar.ClassName; { bt_cancelar: TBitBtn; }
  end;

{ frm_cs_clientes: Tfrm_cs_clientes }
  with Tfrm_cs_clientes(nil) do { uu_cs_clientes.pas }
  begin
    Panel3.ClassName; { Panel3: TPanel; }
    Label1.ClassName; { Label1: TLabel; }
    RadioGroup1.ClassName; { RadioGroup1: TRadioGroup; }
    Panel1.ClassName; { Panel1: TPanel; }
    DBGrid1.ClassName; { DBGrid1: TDBGrid; }
    Panel2.ClassName; { Panel2: TPanel; }
    bt_selecionar.ClassName; { bt_selecionar: TBitBtn; }
    bt_cancelar.ClassName; { bt_cancelar: TBitBtn; }
  end;

{ frm_cad_tipo_cliente: Tfrm_cad_tipo_cliente }
  with Tfrm_cad_tipo_cliente(nil) do { uu_cad_tipo_cliente.pas }
  begin
    pn_principal.ClassName; { pn_principal: TPanel; }
    pn_codigo.ClassName; { pn_codigo: TPanel; }
    bt_pesquisa.ClassName; { bt_pesquisa: TSpeedButton; }
    ed_codigo.ClassName; { ed_codigo: TMaskEdit; }
    pn_descricao.ClassName; { pn_descricao: TPanel; }
    Label14.ClassName; { Label14: TLabel; }
    Label1.ClassName; { Label1: TLabel; }
    ed_descricao.ClassName; { ed_descricao: TDBEdit; }
    DBEdit1.ClassName; { DBEdit1: TDBEdit; }
    pn_botoes.ClassName; { pn_botoes: TPanel; }
    bt_novo.ClassName; { bt_novo: TBitBtn; }
    bt_alterar.ClassName; { bt_alterar: TBitBtn; }
    bt_gravar.ClassName; { bt_gravar: TBitBtn; }
    bt_cancelar.ClassName; { bt_cancelar: TBitBtn; }
    bt_sair.ClassName; { bt_sair: TBitBtn; }
    bt_excluir.ClassName; { bt_excluir: TBitBtn; }
    bt_consultar.ClassName; { bt_consultar: TBitBtn; }
    bt_imprimir.ClassName; { bt_imprimir: TBitBtn; }
  end;

{ frm_pagamento_faturado: Tfrm_pagamento_faturado }
  with Tfrm_pagamento_faturado(nil) do { uu_pagamento_faturado.pas }
  begin
    botao_pesquisa.ClassName; { botao_pesquisa: TSpeedButton; }
    Edit1.ClassName; { Edit1: TEdit; }
    Panel1.ClassName; { Panel1: TPanel; }
    SpeedButton1.ClassName; { SpeedButton1: TSpeedButton; }
    BitBtn1.ClassName; { BitBtn1: TBitBtn; }
    BitBtn2.ClassName; { BitBtn2: TBitBtn; }
    Panel2.ClassName; { Panel2: TPanel; }
    bt_pesq_cliente.ClassName; { bt_pesq_cliente: TSpeedButton; }
    Label1.ClassName; { Label1: TLabel; }
    ed_cod_cliente.ClassName; { ed_cod_cliente: TEdit; }
    Panel3.ClassName; { Panel3: TPanel; }
    lb_nome_fantasia.ClassName; { lb_nome_fantasia: TLabel; }
    ed_desc_cliente.ClassName; { ed_desc_cliente: TEdit; }
    Panel7.ClassName; { Panel7: TPanel; }
    Label6.ClassName; { Label6: TLabel; }
    Label7.ClassName; { Label7: TLabel; }
    edDataVencimento.ClassName; { edDataVencimento: TAdvDateTimePicker; }
    memoObs.ClassName; { memoObs: TMemo; }
    Panel4.ClassName; { Panel4: TPanel; }
    Label3.ClassName; { Label3: TLabel; }
    Panel5.ClassName; { Panel5: TPanel; }
    Label2.ClassName; { Label2: TLabel; }
    Label4.ClassName; { Label4: TLabel; }
    Label5.ClassName; { Label5: TLabel; }
    edLimiteTotalClienteFaturado.ClassName; { edLimiteTotalClienteFaturado: TCurrencyEdit; }
    edLimiteUtilizadolClienteFaturado.ClassName; { edLimiteUtilizadolClienteFaturado: TCurrencyEdit; }
    edLimiteLivreClienteFaturado.ClassName; { edLimiteLivreClienteFaturado: TCurrencyEdit; }
    cliques.ClassName; { cliques: TActionList; }
  end;

{ frm_cs_miniprinters: Tfrm_cs_miniprinters }
  with Tfrm_cs_miniprinters(nil) do { uu_cs_mini_printer.pas }
  begin
    Panel3.ClassName; { Panel3: TPanel; }
    Label1.ClassName; { Label1: TLabel; }
    ed_parametro.ClassName; { ed_parametro: TEdit; }
    RadioGroup1.ClassName; { RadioGroup1: TRadioGroup; }
    Panel1.ClassName; { Panel1: TPanel; }
    DBGrid1.ClassName; { DBGrid1: TDBGrid; }
    Panel2.ClassName; { Panel2: TPanel; }
    bt_selecionar.ClassName; { bt_selecionar: TBitBtn; }
    bt_cancelar.ClassName; { bt_cancelar: TBitBtn; }
  end;

{ frm_obs_lancamento_caixa: Tfrm_obs_lancamento_caixa }
  with Tfrm_obs_lancamento_caixa(nil) do { uu_obs_lancamento_caixa.pas }
  begin
    botao_pesquisa.ClassName; { botao_pesquisa: TSpeedButton; }
    Edit1.ClassName; { Edit1: TEdit; }
    Panel2.ClassName; { Panel2: TPanel; }
    btTecladoVirtual.ClassName; { btTecladoVirtual: TSpeedButton; }
    memo_obs.ClassName; { memo_obs: TMemo; }
    memo_obs_complementar.ClassName; { memo_obs_complementar: TMemo; }
    bt_selecionar.ClassName; { bt_selecionar: TBitBtn; }
    Panel7.ClassName; { Panel7: TPanel; }
    pgGrupos.ClassName; { pgGrupos: TJvPageControl; }
    TabSheet1.ClassName; { TabSheet1: TTabSheet; }
    btgp1.ClassName; { btgp1: TJvImgBtn; }
    btgp2.ClassName; { btgp2: TJvImgBtn; }
    btgp3.ClassName; { btgp3: TJvImgBtn; }
    btgp4.ClassName; { btgp4: TJvImgBtn; }
    btgp5.ClassName; { btgp5: TJvImgBtn; }
    btgp6.ClassName; { btgp6: TJvImgBtn; }
    btgp7.ClassName; { btgp7: TJvImgBtn; }
    btgp8.ClassName; { btgp8: TJvImgBtn; }
    TabSheet2.ClassName; { TabSheet2: TTabSheet; }
    btgp9.ClassName; { btgp9: TJvImgBtn; }
    btgp10.ClassName; { btgp10: TJvImgBtn; }
    btgp11.ClassName; { btgp11: TJvImgBtn; }
    btgp12.ClassName; { btgp12: TJvImgBtn; }
    btgp13.ClassName; { btgp13: TJvImgBtn; }
    btgp14.ClassName; { btgp14: TJvImgBtn; }
    btgp15.ClassName; { btgp15: TJvImgBtn; }
    btgp16.ClassName; { btgp16: TJvImgBtn; }
    TabSheet3.ClassName; { TabSheet3: TTabSheet; }
    btgp17.ClassName; { btgp17: TJvImgBtn; }
    btgp18.ClassName; { btgp18: TJvImgBtn; }
    btgp19.ClassName; { btgp19: TJvImgBtn; }
    btgp20.ClassName; { btgp20: TJvImgBtn; }
    btgp21.ClassName; { btgp21: TJvImgBtn; }
    btgp22.ClassName; { btgp22: TJvImgBtn; }
    btgp23.ClassName; { btgp23: TJvImgBtn; }
    btgp24.ClassName; { btgp24: TJvImgBtn; }
    SpeedButton5.ClassName; { SpeedButton5: TSpeedButton; }
    SpeedButton4.ClassName; { SpeedButton4: TSpeedButton; }
    pgProdutos.ClassName; { pgProdutos: TJvPageControl; }
    TabSheet6.ClassName; { TabSheet6: TTabSheet; }
    JvImgBtn37.ClassName; { JvImgBtn37: TJvImgBtn; }
    JvImgBtn38.ClassName; { JvImgBtn38: TJvImgBtn; }
    JvImgBtn39.ClassName; { JvImgBtn39: TJvImgBtn; }
    JvImgBtn40.ClassName; { JvImgBtn40: TJvImgBtn; }
    JvImgBtn41.ClassName; { JvImgBtn41: TJvImgBtn; }
    JvImgBtn42.ClassName; { JvImgBtn42: TJvImgBtn; }
    JvImgBtn43.ClassName; { JvImgBtn43: TJvImgBtn; }
    JvImgBtn44.ClassName; { JvImgBtn44: TJvImgBtn; }
    JvImgBtn45.ClassName; { JvImgBtn45: TJvImgBtn; }
    JvImgBtn46.ClassName; { JvImgBtn46: TJvImgBtn; }
    JvImgBtn47.ClassName; { JvImgBtn47: TJvImgBtn; }
    JvImgBtn48.ClassName; { JvImgBtn48: TJvImgBtn; }
    JvImgBtn49.ClassName; { JvImgBtn49: TJvImgBtn; }
    JvImgBtn50.ClassName; { JvImgBtn50: TJvImgBtn; }
    JvImgBtn51.ClassName; { JvImgBtn51: TJvImgBtn; }
    JvImgBtn52.ClassName; { JvImgBtn52: TJvImgBtn; }
    JvImgBtn53.ClassName; { JvImgBtn53: TJvImgBtn; }
    JvImgBtn54.ClassName; { JvImgBtn54: TJvImgBtn; }
    JvImgBtn361.ClassName; { JvImgBtn361: TJvImgBtn; }
    JvImgBtn362.ClassName; { JvImgBtn362: TJvImgBtn; }
    JvImgBtn363.ClassName; { JvImgBtn363: TJvImgBtn; }
    JvImgBtn364.ClassName; { JvImgBtn364: TJvImgBtn; }
    JvImgBtn365.ClassName; { JvImgBtn365: TJvImgBtn; }
    JvImgBtn366.ClassName; { JvImgBtn366: TJvImgBtn; }
    JvImgBtn367.ClassName; { JvImgBtn367: TJvImgBtn; }
    JvImgBtn368.ClassName; { JvImgBtn368: TJvImgBtn; }
    JvImgBtn369.ClassName; { JvImgBtn369: TJvImgBtn; }
    TabSheet7.ClassName; { TabSheet7: TTabSheet; }
    JvImgBtn1.ClassName; { JvImgBtn1: TJvImgBtn; }
    JvImgBtn2.ClassName; { JvImgBtn2: TJvImgBtn; }
    JvImgBtn3.ClassName; { JvImgBtn3: TJvImgBtn; }
    JvImgBtn4.ClassName; { JvImgBtn4: TJvImgBtn; }
    JvImgBtn5.ClassName; { JvImgBtn5: TJvImgBtn; }
    JvImgBtn6.ClassName; { JvImgBtn6: TJvImgBtn; }
    JvImgBtn7.ClassName; { JvImgBtn7: TJvImgBtn; }
    JvImgBtn8.ClassName; { JvImgBtn8: TJvImgBtn; }
    JvImgBtn9.ClassName; { JvImgBtn9: TJvImgBtn; }
    JvImgBtn10.ClassName; { JvImgBtn10: TJvImgBtn; }
    JvImgBtn11.ClassName; { JvImgBtn11: TJvImgBtn; }
    JvImgBtn12.ClassName; { JvImgBtn12: TJvImgBtn; }
    JvImgBtn13.ClassName; { JvImgBtn13: TJvImgBtn; }
    JvImgBtn14.ClassName; { JvImgBtn14: TJvImgBtn; }
    JvImgBtn15.ClassName; { JvImgBtn15: TJvImgBtn; }
    JvImgBtn16.ClassName; { JvImgBtn16: TJvImgBtn; }
    JvImgBtn17.ClassName; { JvImgBtn17: TJvImgBtn; }
    JvImgBtn18.ClassName; { JvImgBtn18: TJvImgBtn; }
    JvImgBtn19.ClassName; { JvImgBtn19: TJvImgBtn; }
    JvImgBtn20.ClassName; { JvImgBtn20: TJvImgBtn; }
    JvImgBtn21.ClassName; { JvImgBtn21: TJvImgBtn; }
    JvImgBtn22.ClassName; { JvImgBtn22: TJvImgBtn; }
    JvImgBtn23.ClassName; { JvImgBtn23: TJvImgBtn; }
    JvImgBtn24.ClassName; { JvImgBtn24: TJvImgBtn; }
    JvImgBtn25.ClassName; { JvImgBtn25: TJvImgBtn; }
    JvImgBtn26.ClassName; { JvImgBtn26: TJvImgBtn; }
    JvImgBtn27.ClassName; { JvImgBtn27: TJvImgBtn; }
    TabSheet8.ClassName; { TabSheet8: TTabSheet; }
    JvImgBtn28.ClassName; { JvImgBtn28: TJvImgBtn; }
    JvImgBtn29.ClassName; { JvImgBtn29: TJvImgBtn; }
    JvImgBtn30.ClassName; { JvImgBtn30: TJvImgBtn; }
    JvImgBtn31.ClassName; { JvImgBtn31: TJvImgBtn; }
    JvImgBtn32.ClassName; { JvImgBtn32: TJvImgBtn; }
    JvImgBtn33.ClassName; { JvImgBtn33: TJvImgBtn; }
    JvImgBtn34.ClassName; { JvImgBtn34: TJvImgBtn; }
    JvImgBtn35.ClassName; { JvImgBtn35: TJvImgBtn; }
    JvImgBtn36.ClassName; { JvImgBtn36: TJvImgBtn; }
    JvImgBtn55.ClassName; { JvImgBtn55: TJvImgBtn; }
    JvImgBtn56.ClassName; { JvImgBtn56: TJvImgBtn; }
    JvImgBtn57.ClassName; { JvImgBtn57: TJvImgBtn; }
    JvImgBtn58.ClassName; { JvImgBtn58: TJvImgBtn; }
    JvImgBtn59.ClassName; { JvImgBtn59: TJvImgBtn; }
    JvImgBtn60.ClassName; { JvImgBtn60: TJvImgBtn; }
    JvImgBtn61.ClassName; { JvImgBtn61: TJvImgBtn; }
    JvImgBtn62.ClassName; { JvImgBtn62: TJvImgBtn; }
    JvImgBtn63.ClassName; { JvImgBtn63: TJvImgBtn; }
    JvImgBtn64.ClassName; { JvImgBtn64: TJvImgBtn; }
    JvImgBtn65.ClassName; { JvImgBtn65: TJvImgBtn; }
    JvImgBtn66.ClassName; { JvImgBtn66: TJvImgBtn; }
    JvImgBtn67.ClassName; { JvImgBtn67: TJvImgBtn; }
    JvImgBtn68.ClassName; { JvImgBtn68: TJvImgBtn; }
    JvImgBtn69.ClassName; { JvImgBtn69: TJvImgBtn; }
    JvImgBtn70.ClassName; { JvImgBtn70: TJvImgBtn; }
    JvImgBtn71.ClassName; { JvImgBtn71: TJvImgBtn; }
    JvImgBtn72.ClassName; { JvImgBtn72: TJvImgBtn; }
    TabSheet9.ClassName; { TabSheet9: TTabSheet; }
    JvImgBtn73.ClassName; { JvImgBtn73: TJvImgBtn; }
    JvImgBtn74.ClassName; { JvImgBtn74: TJvImgBtn; }
    JvImgBtn75.ClassName; { JvImgBtn75: TJvImgBtn; }
    JvImgBtn76.ClassName; { JvImgBtn76: TJvImgBtn; }
    JvImgBtn77.ClassName; { JvImgBtn77: TJvImgBtn; }
    JvImgBtn78.ClassName; { JvImgBtn78: TJvImgBtn; }
    JvImgBtn79.ClassName; { JvImgBtn79: TJvImgBtn; }
    JvImgBtn80.ClassName; { JvImgBtn80: TJvImgBtn; }
    JvImgBtn81.ClassName; { JvImgBtn81: TJvImgBtn; }
    JvImgBtn82.ClassName; { JvImgBtn82: TJvImgBtn; }
    JvImgBtn83.ClassName; { JvImgBtn83: TJvImgBtn; }
    JvImgBtn84.ClassName; { JvImgBtn84: TJvImgBtn; }
    JvImgBtn85.ClassName; { JvImgBtn85: TJvImgBtn; }
    JvImgBtn86.ClassName; { JvImgBtn86: TJvImgBtn; }
    JvImgBtn87.ClassName; { JvImgBtn87: TJvImgBtn; }
    JvImgBtn88.ClassName; { JvImgBtn88: TJvImgBtn; }
    JvImgBtn89.ClassName; { JvImgBtn89: TJvImgBtn; }
    JvImgBtn90.ClassName; { JvImgBtn90: TJvImgBtn; }
    JvImgBtn91.ClassName; { JvImgBtn91: TJvImgBtn; }
    JvImgBtn92.ClassName; { JvImgBtn92: TJvImgBtn; }
    JvImgBtn93.ClassName; { JvImgBtn93: TJvImgBtn; }
    JvImgBtn94.ClassName; { JvImgBtn94: TJvImgBtn; }
    JvImgBtn95.ClassName; { JvImgBtn95: TJvImgBtn; }
    JvImgBtn96.ClassName; { JvImgBtn96: TJvImgBtn; }
    JvImgBtn97.ClassName; { JvImgBtn97: TJvImgBtn; }
    JvImgBtn98.ClassName; { JvImgBtn98: TJvImgBtn; }
    JvImgBtn99.ClassName; { JvImgBtn99: TJvImgBtn; }
    TabSheet10.ClassName; { TabSheet10: TTabSheet; }
    JvImgBtn100.ClassName; { JvImgBtn100: TJvImgBtn; }
    JvImgBtn101.ClassName; { JvImgBtn101: TJvImgBtn; }
    JvImgBtn102.ClassName; { JvImgBtn102: TJvImgBtn; }
    JvImgBtn103.ClassName; { JvImgBtn103: TJvImgBtn; }
    JvImgBtn104.ClassName; { JvImgBtn104: TJvImgBtn; }
    JvImgBtn105.ClassName; { JvImgBtn105: TJvImgBtn; }
    JvImgBtn106.ClassName; { JvImgBtn106: TJvImgBtn; }
    JvImgBtn107.ClassName; { JvImgBtn107: TJvImgBtn; }
    JvImgBtn108.ClassName; { JvImgBtn108: TJvImgBtn; }
    JvImgBtn109.ClassName; { JvImgBtn109: TJvImgBtn; }
    JvImgBtn110.ClassName; { JvImgBtn110: TJvImgBtn; }
    JvImgBtn111.ClassName; { JvImgBtn111: TJvImgBtn; }
    JvImgBtn112.ClassName; { JvImgBtn112: TJvImgBtn; }
    JvImgBtn113.ClassName; { JvImgBtn113: TJvImgBtn; }
    JvImgBtn114.ClassName; { JvImgBtn114: TJvImgBtn; }
    JvImgBtn115.ClassName; { JvImgBtn115: TJvImgBtn; }
    JvImgBtn116.ClassName; { JvImgBtn116: TJvImgBtn; }
    JvImgBtn117.ClassName; { JvImgBtn117: TJvImgBtn; }
    JvImgBtn118.ClassName; { JvImgBtn118: TJvImgBtn; }
    JvImgBtn119.ClassName; { JvImgBtn119: TJvImgBtn; }
    JvImgBtn120.ClassName; { JvImgBtn120: TJvImgBtn; }
    JvImgBtn121.ClassName; { JvImgBtn121: TJvImgBtn; }
    JvImgBtn122.ClassName; { JvImgBtn122: TJvImgBtn; }
    JvImgBtn123.ClassName; { JvImgBtn123: TJvImgBtn; }
    JvImgBtn124.ClassName; { JvImgBtn124: TJvImgBtn; }
    JvImgBtn125.ClassName; { JvImgBtn125: TJvImgBtn; }
    JvImgBtn126.ClassName; { JvImgBtn126: TJvImgBtn; }
    TabSheet11.ClassName; { TabSheet11: TTabSheet; }
    JvImgBtn127.ClassName; { JvImgBtn127: TJvImgBtn; }
    JvImgBtn128.ClassName; { JvImgBtn128: TJvImgBtn; }
    JvImgBtn129.ClassName; { JvImgBtn129: TJvImgBtn; }
    JvImgBtn130.ClassName; { JvImgBtn130: TJvImgBtn; }
    JvImgBtn131.ClassName; { JvImgBtn131: TJvImgBtn; }
    JvImgBtn132.ClassName; { JvImgBtn132: TJvImgBtn; }
    JvImgBtn133.ClassName; { JvImgBtn133: TJvImgBtn; }
    JvImgBtn134.ClassName; { JvImgBtn134: TJvImgBtn; }
    JvImgBtn135.ClassName; { JvImgBtn135: TJvImgBtn; }
    JvImgBtn136.ClassName; { JvImgBtn136: TJvImgBtn; }
    JvImgBtn137.ClassName; { JvImgBtn137: TJvImgBtn; }
    JvImgBtn138.ClassName; { JvImgBtn138: TJvImgBtn; }
    JvImgBtn139.ClassName; { JvImgBtn139: TJvImgBtn; }
    JvImgBtn140.ClassName; { JvImgBtn140: TJvImgBtn; }
    JvImgBtn141.ClassName; { JvImgBtn141: TJvImgBtn; }
    JvImgBtn142.ClassName; { JvImgBtn142: TJvImgBtn; }
    JvImgBtn143.ClassName; { JvImgBtn143: TJvImgBtn; }
    JvImgBtn144.ClassName; { JvImgBtn144: TJvImgBtn; }
    JvImgBtn145.ClassName; { JvImgBtn145: TJvImgBtn; }
    JvImgBtn146.ClassName; { JvImgBtn146: TJvImgBtn; }
    JvImgBtn147.ClassName; { JvImgBtn147: TJvImgBtn; }
    JvImgBtn148.ClassName; { JvImgBtn148: TJvImgBtn; }
    JvImgBtn149.ClassName; { JvImgBtn149: TJvImgBtn; }
    JvImgBtn150.ClassName; { JvImgBtn150: TJvImgBtn; }
    JvImgBtn151.ClassName; { JvImgBtn151: TJvImgBtn; }
    JvImgBtn152.ClassName; { JvImgBtn152: TJvImgBtn; }
    JvImgBtn153.ClassName; { JvImgBtn153: TJvImgBtn; }
    TabSheet12.ClassName; { TabSheet12: TTabSheet; }
    JvImgBtn154.ClassName; { JvImgBtn154: TJvImgBtn; }
    JvImgBtn155.ClassName; { JvImgBtn155: TJvImgBtn; }
    JvImgBtn156.ClassName; { JvImgBtn156: TJvImgBtn; }
    JvImgBtn157.ClassName; { JvImgBtn157: TJvImgBtn; }
    JvImgBtn158.ClassName; { JvImgBtn158: TJvImgBtn; }
    JvImgBtn159.ClassName; { JvImgBtn159: TJvImgBtn; }
    JvImgBtn160.ClassName; { JvImgBtn160: TJvImgBtn; }
    JvImgBtn161.ClassName; { JvImgBtn161: TJvImgBtn; }
    JvImgBtn162.ClassName; { JvImgBtn162: TJvImgBtn; }
    JvImgBtn163.ClassName; { JvImgBtn163: TJvImgBtn; }
    JvImgBtn164.ClassName; { JvImgBtn164: TJvImgBtn; }
    JvImgBtn165.ClassName; { JvImgBtn165: TJvImgBtn; }
    JvImgBtn166.ClassName; { JvImgBtn166: TJvImgBtn; }
    JvImgBtn167.ClassName; { JvImgBtn167: TJvImgBtn; }
    JvImgBtn168.ClassName; { JvImgBtn168: TJvImgBtn; }
    JvImgBtn169.ClassName; { JvImgBtn169: TJvImgBtn; }
    JvImgBtn170.ClassName; { JvImgBtn170: TJvImgBtn; }
    JvImgBtn171.ClassName; { JvImgBtn171: TJvImgBtn; }
    JvImgBtn172.ClassName; { JvImgBtn172: TJvImgBtn; }
    JvImgBtn173.ClassName; { JvImgBtn173: TJvImgBtn; }
    JvImgBtn174.ClassName; { JvImgBtn174: TJvImgBtn; }
    JvImgBtn175.ClassName; { JvImgBtn175: TJvImgBtn; }
    JvImgBtn176.ClassName; { JvImgBtn176: TJvImgBtn; }
    JvImgBtn177.ClassName; { JvImgBtn177: TJvImgBtn; }
    JvImgBtn178.ClassName; { JvImgBtn178: TJvImgBtn; }
    JvImgBtn179.ClassName; { JvImgBtn179: TJvImgBtn; }
    JvImgBtn180.ClassName; { JvImgBtn180: TJvImgBtn; }
    TabSheet13.ClassName; { TabSheet13: TTabSheet; }
    JvImgBtn181.ClassName; { JvImgBtn181: TJvImgBtn; }
    JvImgBtn182.ClassName; { JvImgBtn182: TJvImgBtn; }
    JvImgBtn183.ClassName; { JvImgBtn183: TJvImgBtn; }
    JvImgBtn184.ClassName; { JvImgBtn184: TJvImgBtn; }
    JvImgBtn185.ClassName; { JvImgBtn185: TJvImgBtn; }
    JvImgBtn186.ClassName; { JvImgBtn186: TJvImgBtn; }
    JvImgBtn187.ClassName; { JvImgBtn187: TJvImgBtn; }
    JvImgBtn188.ClassName; { JvImgBtn188: TJvImgBtn; }
    JvImgBtn189.ClassName; { JvImgBtn189: TJvImgBtn; }
    JvImgBtn190.ClassName; { JvImgBtn190: TJvImgBtn; }
    JvImgBtn191.ClassName; { JvImgBtn191: TJvImgBtn; }
    JvImgBtn192.ClassName; { JvImgBtn192: TJvImgBtn; }
    JvImgBtn193.ClassName; { JvImgBtn193: TJvImgBtn; }
    JvImgBtn194.ClassName; { JvImgBtn194: TJvImgBtn; }
    JvImgBtn195.ClassName; { JvImgBtn195: TJvImgBtn; }
    JvImgBtn196.ClassName; { JvImgBtn196: TJvImgBtn; }
    JvImgBtn197.ClassName; { JvImgBtn197: TJvImgBtn; }
    JvImgBtn198.ClassName; { JvImgBtn198: TJvImgBtn; }
    JvImgBtn199.ClassName; { JvImgBtn199: TJvImgBtn; }
    JvImgBtn200.ClassName; { JvImgBtn200: TJvImgBtn; }
    JvImgBtn201.ClassName; { JvImgBtn201: TJvImgBtn; }
    JvImgBtn202.ClassName; { JvImgBtn202: TJvImgBtn; }
    JvImgBtn203.ClassName; { JvImgBtn203: TJvImgBtn; }
    JvImgBtn204.ClassName; { JvImgBtn204: TJvImgBtn; }
    JvImgBtn205.ClassName; { JvImgBtn205: TJvImgBtn; }
    JvImgBtn206.ClassName; { JvImgBtn206: TJvImgBtn; }
    JvImgBtn207.ClassName; { JvImgBtn207: TJvImgBtn; }
    TabSheet14.ClassName; { TabSheet14: TTabSheet; }
    JvImgBtn208.ClassName; { JvImgBtn208: TJvImgBtn; }
    JvImgBtn209.ClassName; { JvImgBtn209: TJvImgBtn; }
    JvImgBtn210.ClassName; { JvImgBtn210: TJvImgBtn; }
    JvImgBtn211.ClassName; { JvImgBtn211: TJvImgBtn; }
    JvImgBtn212.ClassName; { JvImgBtn212: TJvImgBtn; }
    JvImgBtn213.ClassName; { JvImgBtn213: TJvImgBtn; }
    JvImgBtn214.ClassName; { JvImgBtn214: TJvImgBtn; }
    JvImgBtn215.ClassName; { JvImgBtn215: TJvImgBtn; }
    JvImgBtn216.ClassName; { JvImgBtn216: TJvImgBtn; }
    JvImgBtn217.ClassName; { JvImgBtn217: TJvImgBtn; }
    JvImgBtn218.ClassName; { JvImgBtn218: TJvImgBtn; }
    JvImgBtn219.ClassName; { JvImgBtn219: TJvImgBtn; }
    JvImgBtn220.ClassName; { JvImgBtn220: TJvImgBtn; }
    JvImgBtn221.ClassName; { JvImgBtn221: TJvImgBtn; }
    JvImgBtn222.ClassName; { JvImgBtn222: TJvImgBtn; }
    JvImgBtn223.ClassName; { JvImgBtn223: TJvImgBtn; }
    JvImgBtn224.ClassName; { JvImgBtn224: TJvImgBtn; }
    JvImgBtn225.ClassName; { JvImgBtn225: TJvImgBtn; }
    JvImgBtn226.ClassName; { JvImgBtn226: TJvImgBtn; }
    JvImgBtn227.ClassName; { JvImgBtn227: TJvImgBtn; }
    JvImgBtn228.ClassName; { JvImgBtn228: TJvImgBtn; }
    JvImgBtn229.ClassName; { JvImgBtn229: TJvImgBtn; }
    JvImgBtn230.ClassName; { JvImgBtn230: TJvImgBtn; }
    JvImgBtn231.ClassName; { JvImgBtn231: TJvImgBtn; }
    JvImgBtn232.ClassName; { JvImgBtn232: TJvImgBtn; }
    JvImgBtn233.ClassName; { JvImgBtn233: TJvImgBtn; }
    JvImgBtn234.ClassName; { JvImgBtn234: TJvImgBtn; }
    TabSheet15.ClassName; { TabSheet15: TTabSheet; }
    JvImgBtn235.ClassName; { JvImgBtn235: TJvImgBtn; }
    JvImgBtn236.ClassName; { JvImgBtn236: TJvImgBtn; }
    JvImgBtn237.ClassName; { JvImgBtn237: TJvImgBtn; }
    JvImgBtn238.ClassName; { JvImgBtn238: TJvImgBtn; }
    JvImgBtn239.ClassName; { JvImgBtn239: TJvImgBtn; }
    JvImgBtn240.ClassName; { JvImgBtn240: TJvImgBtn; }
    JvImgBtn241.ClassName; { JvImgBtn241: TJvImgBtn; }
    JvImgBtn242.ClassName; { JvImgBtn242: TJvImgBtn; }
    JvImgBtn243.ClassName; { JvImgBtn243: TJvImgBtn; }
    JvImgBtn244.ClassName; { JvImgBtn244: TJvImgBtn; }
    JvImgBtn245.ClassName; { JvImgBtn245: TJvImgBtn; }
    JvImgBtn246.ClassName; { JvImgBtn246: TJvImgBtn; }
    JvImgBtn247.ClassName; { JvImgBtn247: TJvImgBtn; }
    JvImgBtn248.ClassName; { JvImgBtn248: TJvImgBtn; }
    JvImgBtn249.ClassName; { JvImgBtn249: TJvImgBtn; }
    JvImgBtn250.ClassName; { JvImgBtn250: TJvImgBtn; }
    JvImgBtn251.ClassName; { JvImgBtn251: TJvImgBtn; }
    JvImgBtn252.ClassName; { JvImgBtn252: TJvImgBtn; }
    JvImgBtn253.ClassName; { JvImgBtn253: TJvImgBtn; }
    JvImgBtn254.ClassName; { JvImgBtn254: TJvImgBtn; }
    JvImgBtn255.ClassName; { JvImgBtn255: TJvImgBtn; }
    JvImgBtn256.ClassName; { JvImgBtn256: TJvImgBtn; }
    JvImgBtn257.ClassName; { JvImgBtn257: TJvImgBtn; }
    JvImgBtn258.ClassName; { JvImgBtn258: TJvImgBtn; }
    JvImgBtn259.ClassName; { JvImgBtn259: TJvImgBtn; }
    JvImgBtn260.ClassName; { JvImgBtn260: TJvImgBtn; }
    JvImgBtn261.ClassName; { JvImgBtn261: TJvImgBtn; }
    TabSheet16.ClassName; { TabSheet16: TTabSheet; }
    JvImgBtn262.ClassName; { JvImgBtn262: TJvImgBtn; }
    JvImgBtn263.ClassName; { JvImgBtn263: TJvImgBtn; }
    JvImgBtn264.ClassName; { JvImgBtn264: TJvImgBtn; }
    JvImgBtn265.ClassName; { JvImgBtn265: TJvImgBtn; }
    JvImgBtn266.ClassName; { JvImgBtn266: TJvImgBtn; }
    JvImgBtn267.ClassName; { JvImgBtn267: TJvImgBtn; }
    JvImgBtn268.ClassName; { JvImgBtn268: TJvImgBtn; }
    JvImgBtn269.ClassName; { JvImgBtn269: TJvImgBtn; }
    JvImgBtn270.ClassName; { JvImgBtn270: TJvImgBtn; }
    JvImgBtn271.ClassName; { JvImgBtn271: TJvImgBtn; }
    JvImgBtn272.ClassName; { JvImgBtn272: TJvImgBtn; }
    JvImgBtn273.ClassName; { JvImgBtn273: TJvImgBtn; }
    JvImgBtn274.ClassName; { JvImgBtn274: TJvImgBtn; }
    JvImgBtn275.ClassName; { JvImgBtn275: TJvImgBtn; }
    JvImgBtn276.ClassName; { JvImgBtn276: TJvImgBtn; }
    JvImgBtn277.ClassName; { JvImgBtn277: TJvImgBtn; }
    JvImgBtn278.ClassName; { JvImgBtn278: TJvImgBtn; }
    JvImgBtn279.ClassName; { JvImgBtn279: TJvImgBtn; }
    JvImgBtn280.ClassName; { JvImgBtn280: TJvImgBtn; }
    JvImgBtn281.ClassName; { JvImgBtn281: TJvImgBtn; }
    JvImgBtn282.ClassName; { JvImgBtn282: TJvImgBtn; }
    JvImgBtn283.ClassName; { JvImgBtn283: TJvImgBtn; }
    JvImgBtn284.ClassName; { JvImgBtn284: TJvImgBtn; }
    JvImgBtn285.ClassName; { JvImgBtn285: TJvImgBtn; }
    JvImgBtn286.ClassName; { JvImgBtn286: TJvImgBtn; }
    JvImgBtn287.ClassName; { JvImgBtn287: TJvImgBtn; }
    JvImgBtn288.ClassName; { JvImgBtn288: TJvImgBtn; }
    TabSheet17.ClassName; { TabSheet17: TTabSheet; }
    JvImgBtn289.ClassName; { JvImgBtn289: TJvImgBtn; }
    JvImgBtn290.ClassName; { JvImgBtn290: TJvImgBtn; }
    JvImgBtn291.ClassName; { JvImgBtn291: TJvImgBtn; }
    JvImgBtn292.ClassName; { JvImgBtn292: TJvImgBtn; }
    JvImgBtn293.ClassName; { JvImgBtn293: TJvImgBtn; }
    JvImgBtn294.ClassName; { JvImgBtn294: TJvImgBtn; }
    JvImgBtn295.ClassName; { JvImgBtn295: TJvImgBtn; }
    JvImgBtn296.ClassName; { JvImgBtn296: TJvImgBtn; }
    JvImgBtn297.ClassName; { JvImgBtn297: TJvImgBtn; }
    JvImgBtn298.ClassName; { JvImgBtn298: TJvImgBtn; }
    JvImgBtn299.ClassName; { JvImgBtn299: TJvImgBtn; }
    JvImgBtn300.ClassName; { JvImgBtn300: TJvImgBtn; }
    JvImgBtn301.ClassName; { JvImgBtn301: TJvImgBtn; }
    JvImgBtn302.ClassName; { JvImgBtn302: TJvImgBtn; }
    JvImgBtn303.ClassName; { JvImgBtn303: TJvImgBtn; }
    JvImgBtn304.ClassName; { JvImgBtn304: TJvImgBtn; }
    JvImgBtn305.ClassName; { JvImgBtn305: TJvImgBtn; }
    JvImgBtn306.ClassName; { JvImgBtn306: TJvImgBtn; }
    JvImgBtn307.ClassName; { JvImgBtn307: TJvImgBtn; }
    JvImgBtn308.ClassName; { JvImgBtn308: TJvImgBtn; }
    JvImgBtn309.ClassName; { JvImgBtn309: TJvImgBtn; }
    JvImgBtn310.ClassName; { JvImgBtn310: TJvImgBtn; }
    JvImgBtn311.ClassName; { JvImgBtn311: TJvImgBtn; }
    JvImgBtn312.ClassName; { JvImgBtn312: TJvImgBtn; }
    JvImgBtn313.ClassName; { JvImgBtn313: TJvImgBtn; }
    JvImgBtn314.ClassName; { JvImgBtn314: TJvImgBtn; }
    JvImgBtn315.ClassName; { JvImgBtn315: TJvImgBtn; }
    TabSheet18.ClassName; { TabSheet18: TTabSheet; }
    JvImgBtn316.ClassName; { JvImgBtn316: TJvImgBtn; }
    JvImgBtn317.ClassName; { JvImgBtn317: TJvImgBtn; }
    JvImgBtn318.ClassName; { JvImgBtn318: TJvImgBtn; }
    JvImgBtn319.ClassName; { JvImgBtn319: TJvImgBtn; }
    JvImgBtn320.ClassName; { JvImgBtn320: TJvImgBtn; }
    JvImgBtn321.ClassName; { JvImgBtn321: TJvImgBtn; }
    JvImgBtn322.ClassName; { JvImgBtn322: TJvImgBtn; }
    JvImgBtn323.ClassName; { JvImgBtn323: TJvImgBtn; }
    JvImgBtn324.ClassName; { JvImgBtn324: TJvImgBtn; }
    JvImgBtn325.ClassName; { JvImgBtn325: TJvImgBtn; }
    JvImgBtn326.ClassName; { JvImgBtn326: TJvImgBtn; }
    JvImgBtn327.ClassName; { JvImgBtn327: TJvImgBtn; }
    JvImgBtn328.ClassName; { JvImgBtn328: TJvImgBtn; }
    JvImgBtn329.ClassName; { JvImgBtn329: TJvImgBtn; }
    JvImgBtn330.ClassName; { JvImgBtn330: TJvImgBtn; }
    JvImgBtn331.ClassName; { JvImgBtn331: TJvImgBtn; }
    JvImgBtn332.ClassName; { JvImgBtn332: TJvImgBtn; }
    JvImgBtn333.ClassName; { JvImgBtn333: TJvImgBtn; }
    JvImgBtn334.ClassName; { JvImgBtn334: TJvImgBtn; }
    JvImgBtn335.ClassName; { JvImgBtn335: TJvImgBtn; }
    JvImgBtn336.ClassName; { JvImgBtn336: TJvImgBtn; }
    JvImgBtn337.ClassName; { JvImgBtn337: TJvImgBtn; }
    JvImgBtn338.ClassName; { JvImgBtn338: TJvImgBtn; }
    JvImgBtn339.ClassName; { JvImgBtn339: TJvImgBtn; }
    JvImgBtn340.ClassName; { JvImgBtn340: TJvImgBtn; }
    JvImgBtn341.ClassName; { JvImgBtn341: TJvImgBtn; }
    JvImgBtn342.ClassName; { JvImgBtn342: TJvImgBtn; }
    TabSheet19.ClassName; { TabSheet19: TTabSheet; }
    JvImgBtn343.ClassName; { JvImgBtn343: TJvImgBtn; }
    JvImgBtn344.ClassName; { JvImgBtn344: TJvImgBtn; }
    JvImgBtn345.ClassName; { JvImgBtn345: TJvImgBtn; }
    JvImgBtn346.ClassName; { JvImgBtn346: TJvImgBtn; }
    JvImgBtn347.ClassName; { JvImgBtn347: TJvImgBtn; }
    JvImgBtn348.ClassName; { JvImgBtn348: TJvImgBtn; }
    JvImgBtn349.ClassName; { JvImgBtn349: TJvImgBtn; }
    JvImgBtn350.ClassName; { JvImgBtn350: TJvImgBtn; }
    JvImgBtn351.ClassName; { JvImgBtn351: TJvImgBtn; }
    JvImgBtn352.ClassName; { JvImgBtn352: TJvImgBtn; }
    JvImgBtn353.ClassName; { JvImgBtn353: TJvImgBtn; }
    JvImgBtn354.ClassName; { JvImgBtn354: TJvImgBtn; }
    JvImgBtn355.ClassName; { JvImgBtn355: TJvImgBtn; }
    JvImgBtn356.ClassName; { JvImgBtn356: TJvImgBtn; }
    JvImgBtn357.ClassName; { JvImgBtn357: TJvImgBtn; }
    JvImgBtn358.ClassName; { JvImgBtn358: TJvImgBtn; }
    JvImgBtn359.ClassName; { JvImgBtn359: TJvImgBtn; }
    JvImgBtn360.ClassName; { JvImgBtn360: TJvImgBtn; }
    JvImgBtn370.ClassName; { JvImgBtn370: TJvImgBtn; }
    JvImgBtn371.ClassName; { JvImgBtn371: TJvImgBtn; }
    JvImgBtn372.ClassName; { JvImgBtn372: TJvImgBtn; }
    JvImgBtn373.ClassName; { JvImgBtn373: TJvImgBtn; }
    JvImgBtn374.ClassName; { JvImgBtn374: TJvImgBtn; }
    JvImgBtn375.ClassName; { JvImgBtn375: TJvImgBtn; }
    JvImgBtn376.ClassName; { JvImgBtn376: TJvImgBtn; }
    JvImgBtn377.ClassName; { JvImgBtn377: TJvImgBtn; }
    JvImgBtn378.ClassName; { JvImgBtn378: TJvImgBtn; }
    TabSheet20.ClassName; { TabSheet20: TTabSheet; }
    JvImgBtn379.ClassName; { JvImgBtn379: TJvImgBtn; }
    JvImgBtn380.ClassName; { JvImgBtn380: TJvImgBtn; }
    JvImgBtn381.ClassName; { JvImgBtn381: TJvImgBtn; }
    JvImgBtn382.ClassName; { JvImgBtn382: TJvImgBtn; }
    JvImgBtn383.ClassName; { JvImgBtn383: TJvImgBtn; }
    JvImgBtn384.ClassName; { JvImgBtn384: TJvImgBtn; }
    JvImgBtn385.ClassName; { JvImgBtn385: TJvImgBtn; }
    JvImgBtn386.ClassName; { JvImgBtn386: TJvImgBtn; }
    JvImgBtn387.ClassName; { JvImgBtn387: TJvImgBtn; }
    JvImgBtn388.ClassName; { JvImgBtn388: TJvImgBtn; }
    JvImgBtn389.ClassName; { JvImgBtn389: TJvImgBtn; }
    JvImgBtn390.ClassName; { JvImgBtn390: TJvImgBtn; }
    JvImgBtn391.ClassName; { JvImgBtn391: TJvImgBtn; }
    JvImgBtn392.ClassName; { JvImgBtn392: TJvImgBtn; }
    JvImgBtn393.ClassName; { JvImgBtn393: TJvImgBtn; }
    JvImgBtn394.ClassName; { JvImgBtn394: TJvImgBtn; }
    JvImgBtn395.ClassName; { JvImgBtn395: TJvImgBtn; }
    JvImgBtn396.ClassName; { JvImgBtn396: TJvImgBtn; }
    JvImgBtn397.ClassName; { JvImgBtn397: TJvImgBtn; }
    JvImgBtn398.ClassName; { JvImgBtn398: TJvImgBtn; }
    JvImgBtn399.ClassName; { JvImgBtn399: TJvImgBtn; }
    JvImgBtn400.ClassName; { JvImgBtn400: TJvImgBtn; }
    JvImgBtn401.ClassName; { JvImgBtn401: TJvImgBtn; }
    JvImgBtn402.ClassName; { JvImgBtn402: TJvImgBtn; }
    JvImgBtn403.ClassName; { JvImgBtn403: TJvImgBtn; }
    JvImgBtn404.ClassName; { JvImgBtn404: TJvImgBtn; }
    JvImgBtn405.ClassName; { JvImgBtn405: TJvImgBtn; }
    TabSheet21.ClassName; { TabSheet21: TTabSheet; }
    JvImgBtn406.ClassName; { JvImgBtn406: TJvImgBtn; }
    JvImgBtn407.ClassName; { JvImgBtn407: TJvImgBtn; }
    JvImgBtn408.ClassName; { JvImgBtn408: TJvImgBtn; }
    JvImgBtn409.ClassName; { JvImgBtn409: TJvImgBtn; }
    JvImgBtn410.ClassName; { JvImgBtn410: TJvImgBtn; }
    JvImgBtn411.ClassName; { JvImgBtn411: TJvImgBtn; }
    JvImgBtn412.ClassName; { JvImgBtn412: TJvImgBtn; }
    JvImgBtn413.ClassName; { JvImgBtn413: TJvImgBtn; }
    JvImgBtn414.ClassName; { JvImgBtn414: TJvImgBtn; }
    JvImgBtn415.ClassName; { JvImgBtn415: TJvImgBtn; }
    JvImgBtn416.ClassName; { JvImgBtn416: TJvImgBtn; }
    JvImgBtn417.ClassName; { JvImgBtn417: TJvImgBtn; }
    JvImgBtn418.ClassName; { JvImgBtn418: TJvImgBtn; }
    JvImgBtn419.ClassName; { JvImgBtn419: TJvImgBtn; }
    JvImgBtn420.ClassName; { JvImgBtn420: TJvImgBtn; }
    JvImgBtn421.ClassName; { JvImgBtn421: TJvImgBtn; }
    JvImgBtn422.ClassName; { JvImgBtn422: TJvImgBtn; }
    JvImgBtn423.ClassName; { JvImgBtn423: TJvImgBtn; }
    JvImgBtn424.ClassName; { JvImgBtn424: TJvImgBtn; }
    JvImgBtn425.ClassName; { JvImgBtn425: TJvImgBtn; }
    JvImgBtn426.ClassName; { JvImgBtn426: TJvImgBtn; }
    JvImgBtn427.ClassName; { JvImgBtn427: TJvImgBtn; }
    JvImgBtn428.ClassName; { JvImgBtn428: TJvImgBtn; }
    JvImgBtn429.ClassName; { JvImgBtn429: TJvImgBtn; }
    JvImgBtn430.ClassName; { JvImgBtn430: TJvImgBtn; }
    JvImgBtn431.ClassName; { JvImgBtn431: TJvImgBtn; }
    JvImgBtn432.ClassName; { JvImgBtn432: TJvImgBtn; }
    TabSheet22.ClassName; { TabSheet22: TTabSheet; }
    JvImgBtn433.ClassName; { JvImgBtn433: TJvImgBtn; }
    JvImgBtn434.ClassName; { JvImgBtn434: TJvImgBtn; }
    JvImgBtn435.ClassName; { JvImgBtn435: TJvImgBtn; }
    JvImgBtn436.ClassName; { JvImgBtn436: TJvImgBtn; }
    JvImgBtn437.ClassName; { JvImgBtn437: TJvImgBtn; }
    JvImgBtn438.ClassName; { JvImgBtn438: TJvImgBtn; }
    JvImgBtn439.ClassName; { JvImgBtn439: TJvImgBtn; }
    JvImgBtn440.ClassName; { JvImgBtn440: TJvImgBtn; }
    JvImgBtn441.ClassName; { JvImgBtn441: TJvImgBtn; }
    JvImgBtn442.ClassName; { JvImgBtn442: TJvImgBtn; }
    JvImgBtn443.ClassName; { JvImgBtn443: TJvImgBtn; }
    JvImgBtn444.ClassName; { JvImgBtn444: TJvImgBtn; }
    JvImgBtn445.ClassName; { JvImgBtn445: TJvImgBtn; }
    JvImgBtn446.ClassName; { JvImgBtn446: TJvImgBtn; }
    JvImgBtn447.ClassName; { JvImgBtn447: TJvImgBtn; }
    JvImgBtn448.ClassName; { JvImgBtn448: TJvImgBtn; }
    JvImgBtn449.ClassName; { JvImgBtn449: TJvImgBtn; }
    JvImgBtn450.ClassName; { JvImgBtn450: TJvImgBtn; }
    JvImgBtn451.ClassName; { JvImgBtn451: TJvImgBtn; }
    JvImgBtn452.ClassName; { JvImgBtn452: TJvImgBtn; }
    JvImgBtn453.ClassName; { JvImgBtn453: TJvImgBtn; }
    JvImgBtn454.ClassName; { JvImgBtn454: TJvImgBtn; }
    JvImgBtn455.ClassName; { JvImgBtn455: TJvImgBtn; }
    JvImgBtn456.ClassName; { JvImgBtn456: TJvImgBtn; }
    JvImgBtn457.ClassName; { JvImgBtn457: TJvImgBtn; }
    JvImgBtn458.ClassName; { JvImgBtn458: TJvImgBtn; }
    JvImgBtn459.ClassName; { JvImgBtn459: TJvImgBtn; }
    TabSheet23.ClassName; { TabSheet23: TTabSheet; }
    JvImgBtn460.ClassName; { JvImgBtn460: TJvImgBtn; }
    JvImgBtn461.ClassName; { JvImgBtn461: TJvImgBtn; }
    JvImgBtn462.ClassName; { JvImgBtn462: TJvImgBtn; }
    JvImgBtn463.ClassName; { JvImgBtn463: TJvImgBtn; }
    JvImgBtn464.ClassName; { JvImgBtn464: TJvImgBtn; }
    JvImgBtn465.ClassName; { JvImgBtn465: TJvImgBtn; }
    JvImgBtn466.ClassName; { JvImgBtn466: TJvImgBtn; }
    JvImgBtn467.ClassName; { JvImgBtn467: TJvImgBtn; }
    JvImgBtn468.ClassName; { JvImgBtn468: TJvImgBtn; }
    JvImgBtn469.ClassName; { JvImgBtn469: TJvImgBtn; }
    JvImgBtn470.ClassName; { JvImgBtn470: TJvImgBtn; }
    JvImgBtn471.ClassName; { JvImgBtn471: TJvImgBtn; }
    JvImgBtn472.ClassName; { JvImgBtn472: TJvImgBtn; }
    JvImgBtn473.ClassName; { JvImgBtn473: TJvImgBtn; }
    JvImgBtn474.ClassName; { JvImgBtn474: TJvImgBtn; }
    JvImgBtn475.ClassName; { JvImgBtn475: TJvImgBtn; }
    JvImgBtn476.ClassName; { JvImgBtn476: TJvImgBtn; }
    JvImgBtn477.ClassName; { JvImgBtn477: TJvImgBtn; }
    JvImgBtn478.ClassName; { JvImgBtn478: TJvImgBtn; }
    JvImgBtn479.ClassName; { JvImgBtn479: TJvImgBtn; }
    JvImgBtn480.ClassName; { JvImgBtn480: TJvImgBtn; }
    JvImgBtn481.ClassName; { JvImgBtn481: TJvImgBtn; }
    JvImgBtn482.ClassName; { JvImgBtn482: TJvImgBtn; }
    JvImgBtn483.ClassName; { JvImgBtn483: TJvImgBtn; }
    JvImgBtn484.ClassName; { JvImgBtn484: TJvImgBtn; }
    JvImgBtn485.ClassName; { JvImgBtn485: TJvImgBtn; }
    JvImgBtn486.ClassName; { JvImgBtn486: TJvImgBtn; }
    TabSheet24.ClassName; { TabSheet24: TTabSheet; }
    JvImgBtn487.ClassName; { JvImgBtn487: TJvImgBtn; }
    JvImgBtn488.ClassName; { JvImgBtn488: TJvImgBtn; }
    JvImgBtn489.ClassName; { JvImgBtn489: TJvImgBtn; }
    JvImgBtn490.ClassName; { JvImgBtn490: TJvImgBtn; }
    JvImgBtn491.ClassName; { JvImgBtn491: TJvImgBtn; }
    JvImgBtn492.ClassName; { JvImgBtn492: TJvImgBtn; }
    JvImgBtn493.ClassName; { JvImgBtn493: TJvImgBtn; }
    JvImgBtn494.ClassName; { JvImgBtn494: TJvImgBtn; }
    JvImgBtn495.ClassName; { JvImgBtn495: TJvImgBtn; }
    JvImgBtn496.ClassName; { JvImgBtn496: TJvImgBtn; }
    JvImgBtn497.ClassName; { JvImgBtn497: TJvImgBtn; }
    JvImgBtn498.ClassName; { JvImgBtn498: TJvImgBtn; }
    JvImgBtn499.ClassName; { JvImgBtn499: TJvImgBtn; }
    JvImgBtn500.ClassName; { JvImgBtn500: TJvImgBtn; }
    JvImgBtn501.ClassName; { JvImgBtn501: TJvImgBtn; }
    JvImgBtn502.ClassName; { JvImgBtn502: TJvImgBtn; }
    JvImgBtn503.ClassName; { JvImgBtn503: TJvImgBtn; }
    JvImgBtn504.ClassName; { JvImgBtn504: TJvImgBtn; }
    JvImgBtn505.ClassName; { JvImgBtn505: TJvImgBtn; }
    JvImgBtn506.ClassName; { JvImgBtn506: TJvImgBtn; }
    JvImgBtn507.ClassName; { JvImgBtn507: TJvImgBtn; }
    JvImgBtn508.ClassName; { JvImgBtn508: TJvImgBtn; }
    JvImgBtn509.ClassName; { JvImgBtn509: TJvImgBtn; }
    JvImgBtn510.ClassName; { JvImgBtn510: TJvImgBtn; }
    JvImgBtn511.ClassName; { JvImgBtn511: TJvImgBtn; }
    JvImgBtn512.ClassName; { JvImgBtn512: TJvImgBtn; }
    JvImgBtn513.ClassName; { JvImgBtn513: TJvImgBtn; }
    TabSheet25.ClassName; { TabSheet25: TTabSheet; }
    JvImgBtn514.ClassName; { JvImgBtn514: TJvImgBtn; }
    JvImgBtn515.ClassName; { JvImgBtn515: TJvImgBtn; }
    JvImgBtn516.ClassName; { JvImgBtn516: TJvImgBtn; }
    JvImgBtn517.ClassName; { JvImgBtn517: TJvImgBtn; }
    JvImgBtn518.ClassName; { JvImgBtn518: TJvImgBtn; }
    JvImgBtn519.ClassName; { JvImgBtn519: TJvImgBtn; }
    JvImgBtn520.ClassName; { JvImgBtn520: TJvImgBtn; }
    JvImgBtn521.ClassName; { JvImgBtn521: TJvImgBtn; }
    JvImgBtn522.ClassName; { JvImgBtn522: TJvImgBtn; }
    JvImgBtn523.ClassName; { JvImgBtn523: TJvImgBtn; }
    JvImgBtn524.ClassName; { JvImgBtn524: TJvImgBtn; }
    JvImgBtn525.ClassName; { JvImgBtn525: TJvImgBtn; }
    JvImgBtn526.ClassName; { JvImgBtn526: TJvImgBtn; }
    JvImgBtn527.ClassName; { JvImgBtn527: TJvImgBtn; }
    JvImgBtn528.ClassName; { JvImgBtn528: TJvImgBtn; }
    JvImgBtn529.ClassName; { JvImgBtn529: TJvImgBtn; }
    JvImgBtn530.ClassName; { JvImgBtn530: TJvImgBtn; }
    JvImgBtn531.ClassName; { JvImgBtn531: TJvImgBtn; }
    JvImgBtn532.ClassName; { JvImgBtn532: TJvImgBtn; }
    JvImgBtn533.ClassName; { JvImgBtn533: TJvImgBtn; }
    JvImgBtn534.ClassName; { JvImgBtn534: TJvImgBtn; }
    JvImgBtn535.ClassName; { JvImgBtn535: TJvImgBtn; }
    JvImgBtn536.ClassName; { JvImgBtn536: TJvImgBtn; }
    JvImgBtn537.ClassName; { JvImgBtn537: TJvImgBtn; }
    JvImgBtn538.ClassName; { JvImgBtn538: TJvImgBtn; }
    JvImgBtn539.ClassName; { JvImgBtn539: TJvImgBtn; }
    JvImgBtn540.ClassName; { JvImgBtn540: TJvImgBtn; }
    Panel1.ClassName; { Panel1: TPanel; }
    btOb1.ClassName; { btOb1: TJvImgBtn; }
    btOb2.ClassName; { btOb2: TJvImgBtn; }
    btOb3.ClassName; { btOb3: TJvImgBtn; }
    btOb4.ClassName; { btOb4: TJvImgBtn; }
    btOb5.ClassName; { btOb5: TJvImgBtn; }
    btOb6.ClassName; { btOb6: TJvImgBtn; }
    btOb7.ClassName; { btOb7: TJvImgBtn; }
    btOb8.ClassName; { btOb8: TJvImgBtn; }
    btOb9.ClassName; { btOb9: TJvImgBtn; }
    btOb10.ClassName; { btOb10: TJvImgBtn; }
    pnTeclado.ClassName; { pnTeclado: TPanel; }
    btFecharTeclado.ClassName; { btFecharTeclado: TSpeedButton; }
    AdvTouchKeyboard1.ClassName; { AdvTouchKeyboard1: TAdvTouchKeyboard; }
  end;

{ frmEntradasAvulsas: TfrmEntradasAvulsas }
  with TfrmEntradasAvulsas(nil) do { uuEntradasAvulsas.pas }
  begin
    pn_principal.ClassName; { pn_principal: TPanel; }
    pn_codigo.ClassName; { pn_codigo: TPanel; }
    bt_pesquisa.ClassName; { bt_pesquisa: TSpeedButton; }
    Label7.ClassName; { Label7: TLabel; }
    ed_codigo.ClassName; { ed_codigo: TMaskEdit; }
    pnFornecedor.ClassName; { pnFornecedor: TPanel; }
    Label6.ClassName; { Label6: TLabel; }
    Label30.ClassName; { Label30: TLabel; }
    edDataEmissaoNotaFiscal.ClassName; { edDataEmissaoNotaFiscal: TDBDateEdit; }
    edDataEntradaNotaFiscal.ClassName; { edDataEntradaNotaFiscal: TDBDateEdit; }
    gpFornecedor.ClassName; { gpFornecedor: TGroupBox; }
    Label2.ClassName; { Label2: TLabel; }
    bt_pesq_fornecedor.ClassName; { bt_pesq_fornecedor: TSpeedButton; }
    Label1.ClassName; { Label1: TLabel; }
    ed_cod_fornecedor.ClassName; { ed_cod_fornecedor: TDBEdit; }
    Panel1.ClassName; { Panel1: TPanel; }
    ed_razao_social_fornecedor.ClassName; { ed_razao_social_fornecedor: TDBEdit; }
    Panel3.ClassName; { Panel3: TPanel; }
    pn_campos.ClassName; { pn_campos: TPanel; }
    pnItens.ClassName; { pnItens: TPanel; }
    GroupBox3.ClassName; { GroupBox3: TGroupBox; }
    Label9.ClassName; { Label9: TLabel; }
    bt_pesq_item_estoque_cod.ClassName; { bt_pesq_item_estoque_cod: TSpeedButton; }
    Label10.ClassName; { Label10: TLabel; }
    Label14.ClassName; { Label14: TLabel; }
    Label15.ClassName; { Label15: TLabel; }
    Label17.ClassName; { Label17: TLabel; }
    bt_pesq_un_entrada.ClassName; { bt_pesq_un_entrada: TSpeedButton; }
    Label18.ClassName; { Label18: TLabel; }
    Label45.ClassName; { Label45: TLabel; }
    Panel5.ClassName; { Panel5: TPanel; }
    ed_desc_item.ClassName; { ed_desc_item: TEdit; }
    Panel6.ClassName; { Panel6: TPanel; }
    ed_desc_un_entrada.ClassName; { ed_desc_un_entrada: TEdit; }
    BitBtn1.ClassName; { BitBtn1: TBitBtn; }
    ed_cod_item.ClassName; { ed_cod_item: TEdit; }
    EDIquantidade.ClassName; { EDIquantidade: TCurrencyEdit; }
    ed_cod_un_entrada.ClassName; { ed_cod_un_entrada: TEdit; }
    edTotalItem.ClassName; { edTotalItem: TCurrencyEdit; }
    Panel2.ClassName; { Panel2: TPanel; }
    EDIpreco.ClassName; { EDIpreco: TCurrencyEdit; }
    DBGrid1.ClassName; { DBGrid1: TDBGrid; }
    Panel7.ClassName; { Panel7: TPanel; }
    Label39.ClassName; { Label39: TLabel; }
    edTotalNotaFiscal.ClassName; { edTotalNotaFiscal: TDBEdit; }
    pn_botoes.ClassName; { pn_botoes: TPanel; }
    bt_novo.ClassName; { bt_novo: TBitBtn; }
    bt_alterar.ClassName; { bt_alterar: TBitBtn; }
    bt_gravar.ClassName; { bt_gravar: TBitBtn; }
    bt_cancelar.ClassName; { bt_cancelar: TBitBtn; }
    bt_sair.ClassName; { bt_sair: TBitBtn; }
    bt_excluir.ClassName; { bt_excluir: TBitBtn; }
    bt_consultar.ClassName; { bt_consultar: TBitBtn; }
    bt_imprimir.ClassName; { bt_imprimir: TBitBtn; }
    Panel8.ClassName; { Panel8: TPanel; }
    Label46.ClassName; { Label46: TLabel; }
    pvdDadosNota.ClassName; { pvdDadosNota: TXMLTransformProvider; }
    cdsDadosNota.ClassName; { cdsDadosNota: TClientDataSet; }
    DataSource1.ClassName; { DataSource1: TDataSource; }
    PopupMenu1.ClassName; { PopupMenu1: TPopupMenu; }
    Apagartem1.ClassName; { Apagartem1: TMenuItem; }
  end;

{ frm_cs_tipos_documentos: Tfrm_cs_tipos_documentos }
  with Tfrm_cs_tipos_documentos(nil) do { uu_cs_tipos_documentos.pas }
  begin
    Panel3.ClassName; { Panel3: TPanel; }
    Label1.ClassName; { Label1: TLabel; }
    ed_parametro.ClassName; { ed_parametro: TEdit; }
    RadioGroup1.ClassName; { RadioGroup1: TRadioGroup; }
    Panel1.ClassName; { Panel1: TPanel; }
    DBGrid1.ClassName; { DBGrid1: TDBGrid; }
    Panel2.ClassName; { Panel2: TPanel; }
    bt_selecionar.ClassName; { bt_selecionar: TBitBtn; }
    bt_cancelar.ClassName; { bt_cancelar: TBitBtn; }
  end;

{ frm_cs_tipos_entrada: Tfrm_cs_tipos_entrada }
  with Tfrm_cs_tipos_entrada(nil) do { uu_cs_tipos_entrada.pas }
  begin
    Panel3.ClassName; { Panel3: TPanel; }
    Label1.ClassName; { Label1: TLabel; }
    ed_parametro.ClassName; { ed_parametro: TEdit; }
    RadioGroup1.ClassName; { RadioGroup1: TRadioGroup; }
    Panel1.ClassName; { Panel1: TPanel; }
    DBGrid1.ClassName; { DBGrid1: TDBGrid; }
    Panel2.ClassName; { Panel2: TPanel; }
    bt_selecionar.ClassName; { bt_selecionar: TBitBtn; }
    bt_cancelar.ClassName; { bt_cancelar: TBitBtn; }
  end;

{ frm_cs_entradas: Tfrm_cs_entradas }
  with Tfrm_cs_entradas(nil) do { uu_cs_entradas.pas }
  begin
    Panel3.ClassName; { Panel3: TPanel; }
    Label1.ClassName; { Label1: TLabel; }
    ed_parametro.ClassName; { ed_parametro: TEdit; }
    RadioGroup1.ClassName; { RadioGroup1: TRadioGroup; }
    BitBtn1.ClassName; { BitBtn1: TBitBtn; }
    gpFornecedor.ClassName; { gpFornecedor: TGroupBox; }
    Label2.ClassName; { Label2: TLabel; }
    bt_pesq_fornecedor.ClassName; { bt_pesq_fornecedor: TSpeedButton; }
    Label6.ClassName; { Label6: TLabel; }
    Panel4.ClassName; { Panel4: TPanel; }
    ed_razao_social_fornecedor.ClassName; { ed_razao_social_fornecedor: TEdit; }
    ed_cod_fornecedor.ClassName; { ed_cod_fornecedor: TEdit; }
    GroupBox2.ClassName; { GroupBox2: TGroupBox; }
    Panel5.ClassName; { Panel5: TPanel; }
    Label3.ClassName; { Label3: TLabel; }
    Label7.ClassName; { Label7: TLabel; }
    edDataEntradaInicial.ClassName; { edDataEntradaInicial: TMaskEdit; }
    edDataEntradaFinal.ClassName; { edDataEntradaFinal: TMaskEdit; }
    GroupBox3.ClassName; { GroupBox3: TGroupBox; }
    Panel6.ClassName; { Panel6: TPanel; }
    Label8.ClassName; { Label8: TLabel; }
    Label11.ClassName; { Label11: TLabel; }
    MaskEdit1.ClassName; { MaskEdit1: TMaskEdit; }
    MaskEdit2.ClassName; { MaskEdit2: TMaskEdit; }
    gpNota.ClassName; { gpNota: TGroupBox; }
    Panel7.ClassName; { Panel7: TPanel; }
    edNumeroNota.ClassName; { edNumeroNota: TEdit; }
    gpChave.ClassName; { gpChave: TGroupBox; }
    Panel8.ClassName; { Panel8: TPanel; }
    edChaveNFE.ClassName; { edChaveNFE: TEdit; }
    Panel1.ClassName; { Panel1: TPanel; }
    DBGrid1.ClassName; { DBGrid1: TDBGrid; }
    Panel2.ClassName; { Panel2: TPanel; }
    bt_selecionar.ClassName; { bt_selecionar: TBitBtn; }
    bt_cancelar.ClassName; { bt_cancelar: TBitBtn; }
  end;

{ frmCsAliquotas: TfrmCsAliquotas }
  with TfrmCsAliquotas(nil) do { uu_cs_aliquotas.pas }
  begin
    Panel3.ClassName; { Panel3: TPanel; }
    Label1.ClassName; { Label1: TLabel; }
    ed_parametro.ClassName; { ed_parametro: TEdit; }
    RadioGroup1.ClassName; { RadioGroup1: TRadioGroup; }
    Panel1.ClassName; { Panel1: TPanel; }
    DBGrid1.ClassName; { DBGrid1: TDBGrid; }
    Panel2.ClassName; { Panel2: TPanel; }
    bt_selecionar.ClassName; { bt_selecionar: TBitBtn; }
    bt_cancelar.ClassName; { bt_cancelar: TBitBtn; }
  end;

{ frmCadUnidades: TfrmCadUnidades }
  with TfrmCadUnidades(nil) do { uuCadUnidades.pas }
  begin
    JvPageList1.ClassName; { JvPageList1: TJvPageList; }
    pgListagem.ClassName; { pgListagem: TJvStandardPage; }
    Panel3.ClassName; { Panel3: TPanel; }
    AdvGlassButton3.ClassName; { AdvGlassButton3: TAdvGlassButton; }
    AdvGlassButton4.ClassName; { AdvGlassButton4: TAdvGlassButton; }
    cxGrid1.ClassName; { cxGrid1: TcxGrid; }
    cxGrid1DBTableView1.ClassName; { cxGrid1DBTableView1: TcxGridDBTableView; }
    cxGrid1DBTableView1COD_UNIDADE.ClassName; { cxGrid1DBTableView1COD_UNIDADE: TcxGridDBColumn; }
    cxGrid1DBTableView1DESCRICAO.ClassName; { cxGrid1DBTableView1DESCRICAO: TcxGridDBColumn; }
    cxGrid1DBTableView1SIGLA.ClassName; { cxGrid1DBTableView1SIGLA: TcxGridDBColumn; }
    cxGrid1DBTableView1PARAMETRO.ClassName; { cxGrid1DBTableView1PARAMETRO: TcxGridDBColumn; }
    cxGrid1Level1.ClassName; { cxGrid1Level1: TcxGridLevel; }
    Panel1.ClassName; { Panel1: TPanel; }
    Label1.ClassName; { Label1: TLabel; }
    pgCadastro.ClassName; { pgCadastro: TJvStandardPage; }
    Label3.ClassName; { Label3: TLabel; }
    Label4.ClassName; { Label4: TLabel; }
    Label5.ClassName; { Label5: TLabel; }
    edDescricao.ClassName; { edDescricao: TEdit; }
    edSigla.ClassName; { edSigla: TEdit; }
    edValor.ClassName; { edValor: TCurrencyEdit; }
    Panel2.ClassName; { Panel2: TPanel; }
    btVoltar.ClassName; { btVoltar: TAdvGlassButton; }
    AdvGlassButton1.ClassName; { AdvGlassButton1: TAdvGlassButton; }
    Panel4.ClassName; { Panel4: TPanel; }
    Label2.ClassName; { Label2: TLabel; }
    cxStyleRepository1.ClassName; { cxStyleRepository1: TcxStyleRepository; }
    cxStyle1.ClassName; { cxStyle1: TcxStyle; }
    cxStyle2.ClassName; { cxStyle2: TcxStyle; }
    PopupMenu1.ClassName; { PopupMenu1: TPopupMenu; }
    Alterarunidade1.ClassName; { Alterarunidade1: TMenuItem; }
  end;

{ frmSelecaoSabores: TfrmSelecaoSabores }
  with TfrmSelecaoSabores(nil) do { uuSelecaoSabores.pas }
  begin
    botao_pesquisa.ClassName; { botao_pesquisa: TSpeedButton; }
    SpeedButton1.ClassName; { SpeedButton1: TSpeedButton; }
    Edit1.ClassName; { Edit1: TEdit; }
    Edit2.ClassName; { Edit2: TEdit; }
    Panel1.ClassName; { Panel1: TPanel; }
    bt_selecionar.ClassName; { bt_selecionar: TBitBtn; }
    Panel2.ClassName; { Panel2: TPanel; }
    memo_obs.ClassName; { memo_obs: TMemo; }
    ScrollBox1.ClassName; { ScrollBox1: TScrollBox; }
    ckb0.ClassName; { ckb0: TCheckBox; }
  end;

{ frmTransferenciaEstoque: TfrmTransferenciaEstoque }
  with TfrmTransferenciaEstoque(nil) do { uu_transferencia_estoque_para_pontodevenda.pas }
  begin
    pn_principal.ClassName; { pn_principal: TPanel; }
    pn_codigo.ClassName; { pn_codigo: TPanel; }
    Label6.ClassName; { Label6: TLabel; }
    Panel1.ClassName; { Panel1: TPanel; }
    gpDadosTransferencia.ClassName; { gpDadosTransferencia: TGroupBox; }
    SpeedButton1.ClassName; { SpeedButton1: TSpeedButton; }
    Label2.ClassName; { Label2: TLabel; }
    Label3.ClassName; { Label3: TLabel; }
    Label4.ClassName; { Label4: TLabel; }
    Label5.ClassName; { Label5: TLabel; }
    SpeedButton2.ClassName; { SpeedButton2: TSpeedButton; }
    Label7.ClassName; { Label7: TLabel; }
    Panel2.ClassName; { Panel2: TPanel; }
    Edit2.ClassName; { Edit2: TEdit; }
    ed_loc.ClassName; { ed_loc: TEdit; }
    Edit3.ClassName; { Edit3: TEdit; }
    Edit4.ClassName; { Edit4: TEdit; }
    Edit5.ClassName; { Edit5: TEdit; }
    gpEstoqueAlmoxarifado.ClassName; { gpEstoqueAlmoxarifado: TGroupBox; }
    Label24.ClassName; { Label24: TLabel; }
    Label10.ClassName; { Label10: TLabel; }
    Label1.ClassName; { Label1: TLabel; }
    Label11.ClassName; { Label11: TLabel; }
    Label9.ClassName; { Label9: TLabel; }
    bt_pesq_item_estoque_barras.ClassName; { bt_pesq_item_estoque_barras: TSpeedButton; }
    Panel5.ClassName; { Panel5: TPanel; }
    ed_desc_item.ClassName; { ed_desc_item: TEdit; }
    ed_estoque_item.ClassName; { ed_estoque_item: TEdit; }
    ed_unidade_item.ClassName; { ed_unidade_item: TEdit; }
    ed_cod_item.ClassName; { ed_cod_item: TEdit; }
    ed_cod_barras_item.ClassName; { ed_cod_barras_item: TEdit; }
    pn_botoes.ClassName; { pn_botoes: TPanel; }
    bt_alterar.ClassName; { bt_alterar: TBitBtn; }
    bt_gravar.ClassName; { bt_gravar: TBitBtn; }
    bt_cancelar.ClassName; { bt_cancelar: TBitBtn; }
    bt_sair.ClassName; { bt_sair: TBitBtn; }
    bt_excluir.ClassName; { bt_excluir: TBitBtn; }
    bt_consultar.ClassName; { bt_consultar: TBitBtn; }
    bt_imprimir.ClassName; { bt_imprimir: TBitBtn; }
  end;

{ frm_consulta_faturas: Tfrm_consulta_faturas }
  with Tfrm_consulta_faturas(nil) do { uu_consulta_faturas.pas }
  begin
    botao_pesquisa.ClassName; { botao_pesquisa: TSpeedButton; }
    Edit1.ClassName; { Edit1: TEdit; }
    pn_codigo.ClassName; { pn_codigo: TPanel; }
    bt_pesquisa.ClassName; { bt_pesquisa: TSpeedButton; }
    bt_pesq_cliente.ClassName; { bt_pesq_cliente: TSpeedButton; }
    Label2.ClassName; { Label2: TLabel; }
    Label5.ClassName; { Label5: TLabel; }
    Label6.ClassName; { Label6: TLabel; }
    ed_codigo.ClassName; { ed_codigo: TMaskEdit; }
    Panel3.ClassName; { Panel3: TPanel; }
    Label3.ClassName; { Label3: TLabel; }
    Label4.ClassName; { Label4: TLabel; }
    ed_desc_cliente.ClassName; { ed_desc_cliente: TEdit; }
    ed_cod_cliente.ClassName; { ed_cod_cliente: TEdit; }
    rdgFiltroDatas.ClassName; { rdgFiltroDatas: TRadioGroup; }
    ed_data_inicial.ClassName; { ed_data_inicial: TMaskEdit; }
    ed_data_final.ClassName; { ed_data_final: TMaskEdit; }
    btExibirFaturas.ClassName; { btExibirFaturas: TBitBtn; }
    Panel2.ClassName; { Panel2: TPanel; }
    DBGrid.ClassName; { DBGrid: TDBGrid; }
    ckbSelecionarTodas.ClassName; { ckbSelecionarTodas: TCheckBox; }
    BitBtn2.ClassName; { BitBtn2: TBitBtn; }
    Panel1.ClassName; { Panel1: TPanel; }
    Label9.ClassName; { Label9: TLabel; }
    Label1.ClassName; { Label1: TLabel; }
    edTotalDebito.ClassName; { edTotalDebito: TCurrencyEdit; }
    edTotalSelecionado.ClassName; { edTotalSelecionado: TCurrencyEdit; }
  end;

{ dm_consultas: Tdm_consultas }
  with Tdm_consultas(nil) do { uu_dm_consultas.pas }
  begin
    qryTiposClientes.ClassName; { qryTiposClientes: TIBQuery; }
    dsTiposClientes.ClassName; { dsTiposClientes: TDataSource; }
    qryUnidades.ClassName; { qryUnidades: TIBQuery; }
    qryUnidadesCOD_UNIDADE.ClassName; { qryUnidadesCOD_UNIDADE: TIBStringField; }
    qryUnidadesDESCRICAO.ClassName; { qryUnidadesDESCRICAO: TIBStringField; }
    qryUnidadesSIGLA.ClassName; { qryUnidadesSIGLA: TIBStringField; }
    qryUnidadesPARAMETRO.ClassName; { qryUnidadesPARAMETRO: TIBBCDField; }
    qryUnidadesCOD_PADRAO.ClassName; { qryUnidadesCOD_PADRAO: TIBStringField; }
    dsUnidades.ClassName; { dsUnidades: TDataSource; }
    qryInsumos.ClassName; { qryInsumos: TIBQuery; }
    qryInsumosCOD_PRODUTO.ClassName; { qryInsumosCOD_PRODUTO: TIBStringField; }
    qryInsumosDESCRICAO.ClassName; { qryInsumosDESCRICAO: TIBStringField; }
    qryInsumosGRUPO.ClassName; { qryInsumosGRUPO: TIBStringField; }
    dsInsumos.ClassName; { dsInsumos: TDataSource; }
    tsConsultas.ClassName; { tsConsultas: TIBTransaction; }
    qryUnidadeCompra.ClassName; { qryUnidadeCompra: TIBQuery; }
    qryUnidadeCompraCOD_UNIDADE.ClassName; { qryUnidadeCompraCOD_UNIDADE: TIBStringField; }
    qryUnidadeCompraDESCRICAO.ClassName; { qryUnidadeCompraDESCRICAO: TIBStringField; }
    qryUnidadeCompraSIGLA.ClassName; { qryUnidadeCompraSIGLA: TIBStringField; }
    qryUnidadeCompraPARAMETRO.ClassName; { qryUnidadeCompraPARAMETRO: TIBBCDField; }
    qryUnidadeCompraCOD_PADRAO.ClassName; { qryUnidadeCompraCOD_PADRAO: TIBStringField; }
    dsUnidadeCompra.ClassName; { dsUnidadeCompra: TDataSource; }
    qryUnidadeFracao.ClassName; { qryUnidadeFracao: TIBQuery; }
    qryUnidadeFracaoCOD_UNIDADE.ClassName; { qryUnidadeFracaoCOD_UNIDADE: TIBStringField; }
    qryUnidadeFracaoDESCRICAO.ClassName; { qryUnidadeFracaoDESCRICAO: TIBStringField; }
    qryUnidadeFracaoSIGLA.ClassName; { qryUnidadeFracaoSIGLA: TIBStringField; }
    qryUnidadeFracaoPARAMETRO.ClassName; { qryUnidadeFracaoPARAMETRO: TIBBCDField; }
    qryUnidadeFracaoCOD_PADRAO.ClassName; { qryUnidadeFracaoCOD_PADRAO: TIBStringField; }
    dsUnidadeFracao.ClassName; { dsUnidadeFracao: TDataSource; }
    qryGruposTree.ClassName; { qryGruposTree: TIBQuery; }
    qryGruposTreeDESCRICAO.ClassName; { qryGruposTreeDESCRICAO: TIBStringField; }
    qryGruposTreeCOD_GRUPO.ClassName; { qryGruposTreeCOD_GRUPO: TIBStringField; }
    qryGruposTreeCOD_GRUPO_PAI.ClassName; { qryGruposTreeCOD_GRUPO_PAI: TIBStringField; }
    dsGruposTree.ClassName; { dsGruposTree: TDataSource; }
    qryPaises.ClassName; { qryPaises: TIBQuery; }
    qryPaisesCODPAIS.ClassName; { qryPaisesCODPAIS: TIBStringField; }
    qryPaisesNOMPAIS.ClassName; { qryPaisesNOMPAIS: TIBStringField; }
    dsQryPaises.ClassName; { dsQryPaises: TDataSource; }
    qryEstados.ClassName; { qryEstados: TIBQuery; }
    qryEstadosCODIGO.ClassName; { qryEstadosCODIGO: TIBStringField; }
    qryEstadosNOME.ClassName; { qryEstadosNOME: TIBStringField; }
    qryEstadosSIGLA.ClassName; { qryEstadosSIGLA: TIBStringField; }
    dsQryEstados.ClassName; { dsQryEstados: TDataSource; }
    qryCidade.ClassName; { qryCidade: TIBQuery; }
    qryCidadeCOD_CIDADE.ClassName; { qryCidadeCOD_CIDADE: TIBStringField; }
    qryCidadeCODIGO_ESTADO.ClassName; { qryCidadeCODIGO_ESTADO: TIBStringField; }
    qryCidadeNOME.ClassName; { qryCidadeNOME: TIBStringField; }
    dsQryCidade.ClassName; { dsQryCidade: TDataSource; }
  end;

{ frmPesquisaClienteReduzido: TfrmPesquisaClienteReduzido }
  with TfrmPesquisaClienteReduzido(nil) do { uu_cs_clientes_reduzido.pas }
  begin
    Panel3.ClassName; { Panel3: TPanel; }
    Label1.ClassName; { Label1: TLabel; }
    ed_parametro.ClassName; { ed_parametro: TEdit; }
    RadioGroup1.ClassName; { RadioGroup1: TRadioGroup; }
    Panel1.ClassName; { Panel1: TPanel; }
    DBGrid1.ClassName; { DBGrid1: TDBGrid; }
    Panel2.ClassName; { Panel2: TPanel; }
    bt_selecionar.ClassName; { bt_selecionar: TBitBtn; }
    bt_cancelar.ClassName; { bt_cancelar: TBitBtn; }
    Panel4.ClassName; { Panel4: TPanel; }
    Label2.ClassName; { Label2: TLabel; }
  end;

{ frmClientesNaCasa: TfrmClientesNaCasa }
  with TfrmClientesNaCasa(nil) do { uu_clientes_na_casa.pas }
  begin
    botao_pesquisa.ClassName; { botao_pesquisa: TSpeedButton; }
    Edit1.ClassName; { Edit1: TEdit; }
    Panel1.ClassName; { Panel1: TPanel; }
    Label2.ClassName; { Label2: TLabel; }
    RadioGroup1.ClassName; { RadioGroup1: TRadioGroup; }
    edNomeCliente.ClassName; { edNomeCliente: TEdit; }
    rdTipo.ClassName; { rdTipo: TRadioGroup; }
    Panel3.ClassName; { Panel3: TPanel; }
    Label3.ClassName; { Label3: TLabel; }
    lbTotClientesNaCasa.ClassName; { lbTotClientesNaCasa: TLabel; }
    Label4.ClassName; { Label4: TLabel; }
    Label5.ClassName; { Label5: TLabel; }
    lbTotClientesEntraram.ClassName; { lbTotClientesEntraram: TLabel; }
    lbTotClientesSairam.ClassName; { lbTotClientesSairam: TLabel; }
    DBGrid1.ClassName; { DBGrid1: TDBGrid; }
    btSair.ClassName; { btSair: TBitBtn; }
    Panel2.ClassName; { Panel2: TPanel; }
    Label6.ClassName; { Label6: TLabel; }
  end;

{ frmLiberarCliente: TfrmLiberarCliente }
  with TfrmLiberarCliente(nil) do { uuLiberarCliente.pas }
  begin
    lbInformacoes.ClassName; { lbInformacoes: TLabel; }
    lbEstadoCliente.ClassName; { lbEstadoCliente: TLabel; }
    Label2.ClassName; { Label2: TLabel; }
    lbCartaoCliente.ClassName; { lbCartaoCliente: TLabel; }
    lbNomeCliente.ClassName; { lbNomeCliente: TLabel; }
    Edit1.ClassName; { Edit1: TEdit; }
    edNumeroCartao.ClassName; { edNumeroCartao: TEdit; }
    Panel1.ClassName; { Panel1: TPanel; }
    Image1.ClassName; { Image1: TImage; }
    img_estado_cartao.ClassName; { img_estado_cartao: TImage; }
    lbPasseCartao.ClassName; { lbPasseCartao: TLabel; }
    edCartao.ClassName; { edCartao: TEdit; }
    Panel2.ClassName; { Panel2: TPanel; }
    Panel3.ClassName; { Panel3: TPanel; }
    Timer1.ClassName; { Timer1: TTimer; }
  end;

{ frmAberturaCaixa: TfrmAberturaCaixa }
  with TfrmAberturaCaixa(nil) do { uuAberturaCaixa.pas }
  begin
    Panel1.ClassName; { Panel1: TPanel; }
    Label1.ClassName; { Label1: TLabel; }
    edValorFundo.ClassName; { edValorFundo: TCurrencyEdit; }
    B30001002.ClassName; { B30001002: TBitBtn; }
    BitBtn1.ClassName; { BitBtn1: TBitBtn; }
    Panel4.ClassName; { Panel4: TPanel; }
    Label2.ClassName; { Label2: TLabel; }
    lbecf.ClassName; { lbecf: TLabel; }
    lbDataEcf.ClassName; { lbDataEcf: TLabel; }
    ckbCobrarTaxa.ClassName; { ckbCobrarTaxa: TCheckBox; }
    rdTipoCaixa.ClassName; { rdTipoCaixa: TRadioGroup; }
    ckbCodGarcon.ClassName; { ckbCodGarcon: TCheckBox; }
    rdTurno.ClassName; { rdTurno: TRadioGroup; }
    AdvTouchKeyboard1.ClassName; { AdvTouchKeyboard1: TAdvSmoothTouchKeyBoard; }
    cliques.ClassName; { cliques: TActionList; }
    actlBusca.ClassName; { actlBusca: TJvControlActionList; }
  end;

{ frmFechamentoCaixa: TfrmFechamentoCaixa }
  with TfrmFechamentoCaixa(nil) do { uuFechamentoCaixa.pas }
  begin
    Panel1.ClassName; { Panel1: TPanel; }
    Panel4.ClassName; { Panel4: TPanel; }
    Label1.ClassName; { Label1: TLabel; }
    Label2.ClassName; { Label2: TLabel; }
    Panel6.ClassName; { Panel6: TPanel; }
    DBCtrlGrid2.ClassName; { DBCtrlGrid2: TDBCtrlGrid; }
    Panel2.ClassName; { Panel2: TPanel; }
    gp_formas.ClassName; { gp_formas: TGroupBox; }
    Label13.ClassName; { Label13: TLabel; }
    Label14.ClassName; { Label14: TLabel; }
    btPesqFormaPagto.ClassName; { btPesqFormaPagto: TSpeedButton; }
    edCodFormaPagamento.ClassName; { edCodFormaPagamento: TEdit; }
    ed_valor_forma.ClassName; { ed_valor_forma: TCurrencyEdit; }
    Panel3.ClassName; { Panel3: TPanel; }
    DBGrid1.ClassName; { DBGrid1: TDBGrid; }
    Panel5.ClassName; { Panel5: TPanel; }
    btFecharCaixa.ClassName; { btFecharCaixa: TAdvGlassButton; }
    AdvGlassButton3.ClassName; { AdvGlassButton3: TAdvGlassButton; }
    AdvSmoothTouchKeyBoard1.ClassName; { AdvSmoothTouchKeyBoard1: TAdvSmoothTouchKeyBoard; }
    Panel13.ClassName; { Panel13: TPanel; }
    Label43.ClassName; { Label43: TLabel; }
    edDescricaoForma.ClassName; { edDescricaoForma: TEdit; }
    tbFormasPagamentoTemp.ClassName; { tbFormasPagamentoTemp: TRxMemoryData; }
    tbFormasPagamentoTempcodForma.ClassName; { tbFormasPagamentoTempcodForma: TStringField; }
    tbFormasPagamentoTempdescricaoForma.ClassName; { tbFormasPagamentoTempdescricaoForma: TStringField; }
    tbFormasPagamentoTempvalorForma.ClassName; { tbFormasPagamentoTempvalorForma: TCurrencyField; }
    dsFormasPagtoTemp.ClassName; { dsFormasPagtoTemp: TDataSource; }
  end;

{ frmCadClientesDelivery: TfrmCadClientesDelivery }
  with TfrmCadClientesDelivery(nil) do { uu_cad_clientes_delivery.pas }
  begin
    pn_principal.ClassName; { pn_principal: TPanel; }
    Label1.ClassName; { Label1: TLabel; }
    Label2.ClassName; { Label2: TLabel; }
    Label4.ClassName; { Label4: TLabel; }
    Label5.ClassName; { Label5: TLabel; }
    Label6.ClassName; { Label6: TLabel; }
    Label7.ClassName; { Label7: TLabel; }
    Label8.ClassName; { Label8: TLabel; }
    Label10.ClassName; { Label10: TLabel; }
    Label48.ClassName; { Label48: TLabel; }
    bt_pesq_bairro.ClassName; { bt_pesq_bairro: TSpeedButton; }
    Label11.ClassName; { Label11: TLabel; }
    Label12.ClassName; { Label12: TLabel; }
    Label13.ClassName; { Label13: TLabel; }
    pn_codigo.ClassName; { pn_codigo: TPanel; }
    bt_pesquisa.ClassName; { bt_pesquisa: TSpeedButton; }
    Label9.ClassName; { Label9: TLabel; }
    ed_codigo.ClassName; { ed_codigo: TMaskEdit; }
    cxDBDateEdit1.ClassName; { cxDBDateEdit1: TcxDBDateEdit; }
    cmbSexo.ClassName; { cmbSexo: TcxDBComboBox; }
    edTelefone.ClassName; { edTelefone: TDBEdit; }
    edNome.ClassName; { edNome: TDBEdit; }
    edEndereco.ClassName; { edEndereco: TDBEdit; }
    edComplemento.ClassName; { edComplemento: TDBEdit; }
    edReferencia1.ClassName; { edReferencia1: TDBEdit; }
    edReferencia2.ClassName; { edReferencia2: TDBEdit; }
    edFreqCompra.ClassName; { edFreqCompra: TDBEdit; }
    Panel3.ClassName; { Panel3: TPanel; }
    Label3.ClassName; { Label3: TLabel; }
    edDescBairro.ClassName; { edDescBairro: TDBEdit; }
    edCodBairro.ClassName; { edCodBairro: TDBEdit; }
    edEmail.ClassName; { edEmail: TDBEdit; }
    edDtNascimento.ClassName; { edDtNascimento: TDBDateEdit; }
    DBEdit1.ClassName; { DBEdit1: TDBEdit; }
    pn_botoes.ClassName; { pn_botoes: TPanel; }
    bt_novo.ClassName; { bt_novo: TBitBtn; }
    bt_alterar.ClassName; { bt_alterar: TBitBtn; }
    bt_gravar.ClassName; { bt_gravar: TBitBtn; }
    bt_cancelar.ClassName; { bt_cancelar: TBitBtn; }
    bt_sair.ClassName; { bt_sair: TBitBtn; }
    bt_excluir.ClassName; { bt_excluir: TBitBtn; }
    bt_consultar.ClassName; { bt_consultar: TBitBtn; }
    bt_imprimir.ClassName; { bt_imprimir: TBitBtn; }
  end;

{ frmPesquisaClienteDelivery: TfrmPesquisaClienteDelivery }
  with TfrmPesquisaClienteDelivery(nil) do { uuPesquisaClientesDelivery.pas }
  begin
    Panel3.ClassName; { Panel3: TPanel; }
    ed_parametro.ClassName; { ed_parametro: TEdit; }
    RadioGroup1.ClassName; { RadioGroup1: TRadioGroup; }
    Panel1.ClassName; { Panel1: TPanel; }
    DBGrid1.ClassName; { DBGrid1: TDBGrid; }
    Panel2.ClassName; { Panel2: TPanel; }
    bt_selecionar.ClassName; { bt_selecionar: TBitBtn; }
    bt_cancelar.ClassName; { bt_cancelar: TBitBtn; }
  end;

{ frmPrincipalDelivery: TfrmPrincipalDelivery }
  with TfrmPrincipalDelivery(nil) do { uuPrincipalDelivery.pas }
  begin
    botao_pesquisa.ClassName; { botao_pesquisa: TSpeedButton; }
    Edit1.ClassName; { Edit1: TEdit; }
    Panel1.ClassName; { Panel1: TPanel; }
    BitBtn1.ClassName; { BitBtn1: TBitBtn; }
    BitBtn4.ClassName; { BitBtn4: TBitBtn; }
    BitBtn2.ClassName; { BitBtn2: TBitBtn; }
    BitBtn3.ClassName; { BitBtn3: TBitBtn; }
  end;

{ frmSobre: TfrmSobre }
  with TfrmSobre(nil) do { Sobre.pas }
  begin
    Image1.ClassName; { Image1: TImage; }
    lColaboradores.ClassName; { lColaboradores: TLabel; }
    lVersao.ClassName; { lVersao: TLabel; }
    lDesenvolvedores.ClassName; { lDesenvolvedores: TLabel; }
    lACBr.ClassName; { lACBr: TLabel; }
    lNome.ClassName; { lNome: TLabel; }
    Label1.ClassName; { Label1: TLabel; }
    Label2.ClassName; { Label2: TLabel; }
    bAjuda.ClassName; { bAjuda: TBitBtn; }
    BitBtn1.ClassName; { BitBtn1: TBitBtn; }
    Timer1.ClassName; { Timer1: TTimer; }
  end;

{ frmSelecaoCouvert: TfrmSelecaoCouvert }
  with TfrmSelecaoCouvert(nil) do { uuSelecaoCouvert.pas }
  begin
    Edit1.ClassName; { Edit1: TEdit; }
    pnBotoes.ClassName; { pnBotoes: TPanel; }
    btSelecionar.ClassName; { btSelecionar: TBitBtn; }
    btCancelar.ClassName; { btCancelar: TBitBtn; }
    pnPrincipal.ClassName; { pnPrincipal: TPanel; }
    rdgTipoEntrada.ClassName; { rdgTipoEntrada: TRadioGroup; }
    Panel3.ClassName; { Panel3: TPanel; }
    Label1.ClassName; { Label1: TLabel; }
    Label2.ClassName; { Label2: TLabel; }
  end;

{ frmPedidosDelivery: TfrmPedidosDelivery }
  with TfrmPedidosDelivery(nil) do { uuPedidoDelivery.pas }
  begin
    botao_pesquisa.ClassName; { botao_pesquisa: TSpeedButton; }
    Image4.ClassName; { Image4: TImage; }
    Label29.ClassName; { Label29: TLabel; }
    Label30.ClassName; { Label30: TLabel; }
    Label31.ClassName; { Label31: TLabel; }
    Label12.ClassName; { Label12: TLabel; }
    Label13.ClassName; { Label13: TLabel; }
    Edit1.ClassName; { Edit1: TEdit; }
    pgControle.ClassName; { pgControle: TJvPageList; }
    pgPedido.ClassName; { pgPedido: TJvStandardPage; }
    PanelPedidoDelivery.ClassName; { PanelPedidoDelivery: TPanel; }
    Label14.ClassName; { Label14: TLabel; }
    Panel5.ClassName; { Panel5: TPanel; }
    pnProduto.ClassName; { pnProduto: TCurvyPanel; }
    Label2.ClassName; { Label2: TLabel; }
    btPesqProdutoCodBarras.ClassName; { btPesqProdutoCodBarras: TSpeedButton; }
    Label3.ClassName; { Label3: TLabel; }
    Label1.ClassName; { Label1: TLabel; }
    Label5.ClassName; { Label5: TLabel; }
    Label35.ClassName; { Label35: TLabel; }
    edQuantidade.ClassName; { edQuantidade: TCurvyEdit; }
    edCodBarrasProduto.ClassName; { edCodBarrasProduto: TCurvyEdit; }
    edCodProduto.ClassName; { edCodProduto: TCurvyEdit; }
    Panel6.ClassName; { Panel6: TPanel; }
    edDescricaoProduto.ClassName; { edDescricaoProduto: TCurvyEdit; }
    edValorUnitarioProduto.ClassName; { edValorUnitarioProduto: TCurvyEdit; }
    CurvyPanel2.ClassName; { CurvyPanel2: TCurvyPanel; }
    Label17.ClassName; { Label17: TLabel; }
    Image8.ClassName; { Image8: TImage; }
    Label18.ClassName; { Label18: TLabel; }
    pnTopo.ClassName; { pnTopo: TPanel; }
    pnTelefoneCliente.ClassName; { pnTelefoneCliente: TCurvyPanel; }
    btPesqCliente.ClassName; { btPesqCliente: TSpeedButton; }
    edTelClienteDelivery.ClassName; { edTelClienteDelivery: TCurvyEdit; }
    lbTituloTelefone.ClassName; { lbTituloTelefone: TcxLabel; }
    pnSelecionaTabPreco.ClassName; { pnSelecionaTabPreco: TCurvyPanel; }
    btMudaTabelaPreco.ClassName; { btMudaTabelaPreco: TPngSpeedButton; }
    lbDescTabelaPreco.ClassName; { lbDescTabelaPreco: TLabel; }
    Panel3.ClassName; { Panel3: TPanel; }
    CurvyPanel1.ClassName; { CurvyPanel1: TCurvyPanel; }
    edNomeCliente.ClassName; { edNomeCliente: TCurvyEdit; }
    edTelClienteConsulta.ClassName; { edTelClienteConsulta: TCurvyEdit; }
    cxLabel3.ClassName; { cxLabel3: TcxLabel; }
    cxLabel4.ClassName; { cxLabel4: TcxLabel; }
    edComplementoCliente.ClassName; { edComplementoCliente: TCurvyEdit; }
    cxLabel5.ClassName; { cxLabel5: TcxLabel; }
    edReferenciaCliente.ClassName; { edReferenciaCliente: TCurvyEdit; }
    edReferencia2cliente.ClassName; { edReferencia2cliente: TCurvyEdit; }
    edBairroCliente.ClassName; { edBairroCliente: TCurvyEdit; }
    edCelularCliente.ClassName; { edCelularCliente: TCurvyEdit; }
    cxLabel1.ClassName; { cxLabel1: TcxLabel; }
    CurvyPanel5.ClassName; { CurvyPanel5: TCurvyPanel; }
    edEnderecoCliente.ClassName; { edEnderecoCliente: TMemo; }
    edCodClienteDelivery.ClassName; { edCodClienteDelivery: TEdit; }
    edCodbairro.ClassName; { edCodbairro: TEdit; }
    CurvyPanel3.ClassName; { CurvyPanel3: TCurvyPanel; }
    btSair.ClassName; { btSair: TAdvGlassButton; }
    btGravar.ClassName; { btGravar: TAdvGlassButton; }
    CurvyPanel4.ClassName; { CurvyPanel4: TCurvyPanel; }
    Panel8.ClassName; { Panel8: TPanel; }
    Label11.ClassName; { Label11: TLabel; }
    AdvOfficeImage1.ClassName; { AdvOfficeImage1: TAdvOfficeImage; }
    ed_valor_bruto.ClassName; { ed_valor_bruto: TJvValidateEdit; }
    Panel9.ClassName; { Panel9: TPanel; }
    Label19.ClassName; { Label19: TLabel; }
    AdvOfficeImage2.ClassName; { AdvOfficeImage2: TAdvOfficeImage; }
    ed_total_tx_serv.ClassName; { ed_total_tx_serv: TJvValidateEdit; }
    Panel11.ClassName; { Panel11: TPanel; }
    Label9.ClassName; { Label9: TLabel; }
    AdvOfficeImage6.ClassName; { AdvOfficeImage6: TAdvOfficeImage; }
    ed_total_conta.ClassName; { ed_total_conta: TJvValidateEdit; }
    pnFormasPagamento.ClassName; { pnFormasPagamento: TCurvyPanel; }
    pageList2.ClassName; { pageList2: TJvPageList; }
    pgFormasPagto.ClassName; { pgFormasPagto: TJvStandardPage; }
    Label7.ClassName; { Label7: TLabel; }
    Label8.ClassName; { Label8: TLabel; }
    Image2.ClassName; { Image2: TImage; }
    Label16.ClassName; { Label16: TLabel; }
    PngSpeedButton1.ClassName; { PngSpeedButton1: TPngSpeedButton; }
    cbkEntrega.ClassName; { cbkEntrega: TCheckBox; }
    cbkRetiraBalcao.ClassName; { cbkRetiraBalcao: TCheckBox; }
    Panel1.ClassName; { Panel1: TPanel; }
    edDescricaoForma.ClassName; { edDescricaoForma: TCurvyEdit; }
    edCodFormaPagamento.ClassName; { edCodFormaPagamento: TCurvyEdit; }
    edValorForma.ClassName; { edValorForma: TCurvyEdit; }
    DBGrid1.ClassName; { DBGrid1: TDBGrid; }
    Panel4.ClassName; { Panel4: TPanel; }
    Label4.ClassName; { Label4: TLabel; }
    AdvOfficeImage4.ClassName; { AdvOfficeImage4: TAdvOfficeImage; }
    ed_total_pago.ClassName; { ed_total_pago: TJvValidateEdit; }
    Panel12.ClassName; { Panel12: TPanel; }
    Label10.ClassName; { Label10: TLabel; }
    AdvOfficeImage5.ClassName; { AdvOfficeImage5: TAdvOfficeImage; }
    edTroco.ClassName; { edTroco: TJvValidateEdit; }
    Panel10.ClassName; { Panel10: TPanel; }
    Label21.ClassName; { Label21: TLabel; }
    AdvOfficeImage3.ClassName; { AdvOfficeImage3: TAdvOfficeImage; }
    edTotalDescontos.ClassName; { edTotalDescontos: TJvValidateEdit; }
    pgObsClientes.ClassName; { pgObsClientes: TJvStandardPage; }
    Label15.ClassName; { Label15: TLabel; }
    Image1.ClassName; { Image1: TImage; }
    JvDBGrid1.ClassName; { JvDBGrid1: TJvDBGrid; }
    edNovaObservacao.ClassName; { edNovaObservacao: TCurvyEdit; }
    ckbAlertaPedidos.ClassName; { ckbAlertaPedidos: TcxCheckBox; }
    ckbImprimeProducao.ClassName; { ckbImprimeProducao: TcxCheckBox; }
    pgUltimosPedidos.ClassName; { pgUltimosPedidos: TJvStandardPage; }
    JvDBGrid2.ClassName; { JvDBGrid2: TJvDBGrid; }
    dbgItensPedido.ClassName; { dbgItensPedido: TJvDBGrid; }
    cxLabel10.ClassName; { cxLabel10: TcxLabel; }
    cxLabel11.ClassName; { cxLabel11: TcxLabel; }
    pgDesconto.ClassName; { pgDesconto: TJvStandardPage; }
    Panel7.ClassName; { Panel7: TPanel; }
    Label6.ClassName; { Label6: TLabel; }
    Label20.ClassName; { Label20: TLabel; }
    rdPercentual.ClassName; { rdPercentual: TRadioButton; }
    rdValor.ClassName; { rdValor: TRadioButton; }
    edValorDesconto.ClassName; { edValorDesconto: TJvValidateEdit; }
    btAplicardesconto.ClassName; { btAplicardesconto: TAdvGlassButton; }
    pgCPFNota.ClassName; { pgCPFNota: TJvStandardPage; }
    Label24.ClassName; { Label24: TLabel; }
    Label25.ClassName; { Label25: TLabel; }
    Panel13.ClassName; { Panel13: TPanel; }
    Label22.ClassName; { Label22: TLabel; }
    Label23.ClassName; { Label23: TLabel; }
    edCpf.ClassName; { edCpf: TEdit; }
    edNomeClienteNota.ClassName; { edNomeClienteNota: TEdit; }
    pgTabelaPreco.ClassName; { pgTabelaPreco: TJvStandardPage; }
    Panel14.ClassName; { Panel14: TPanel; }
    Label26.ClassName; { Label26: TLabel; }
    Label27.ClassName; { Label27: TLabel; }
    DBCtrlGrid1.ClassName; { DBCtrlGrid1: TDBCtrlGrid; }
    pgAgendamento.ClassName; { pgAgendamento: TJvStandardPage; }
    Label32.ClassName; { Label32: TLabel; }
    Label34.ClassName; { Label34: TLabel; }
    Panel18.ClassName; { Panel18: TPanel; }
    Label33.ClassName; { Label33: TLabel; }
    edDataEntrega.ClassName; { edDataEntrega: TAdvDateTimePicker; }
    edHoraEntrega.ClassName; { edHoraEntrega: TAdvDateTimePicker; }
    JvTabBar1.ClassName; { JvTabBar1: TJvTabBar; }
    pgListMovimentoProdutos.ClassName; { pgListMovimentoProdutos: TJvPageList; }
    pgProdutosPedido.ClassName; { pgProdutosPedido: TJvStandardPage; }
    pnMovimento.ClassName; { pnMovimento: TCurvyPanel; }
    pnProdutos.ClassName; { pnProdutos: TPanel; }
    ScrollBox1.ClassName; { ScrollBox1: TScrollBox; }
    painelProdutos.ClassName; { painelProdutos: TAdvPanel; }
    lbOrdem.ClassName; { lbOrdem: TLabel; }
    lbDescricaoProduto.ClassName; { lbDescricaoProduto: TLabel; }
    lbQuantidadeProduto.ClassName; { lbQuantidadeProduto: TLabel; }
    lbX.ClassName; { lbX: TLabel; }
    lbValorUnitarioProduto.ClassName; { lbValorUnitarioProduto: TLabel; }
    lbTotalProduto.ClassName; { lbTotalProduto: TLabel; }
    btDeleteProduto.ClassName; { btDeleteProduto: TImage; }
    shapeLinha.ClassName; { shapeLinha: TShape; }
    lbDescontoItem.ClassName; { lbDescontoItem: TLabel; }
    memoObsItem.ClassName; { memoObsItem: TMemo; }
    pgConsultaFormasPagamento.ClassName; { pgConsultaFormasPagamento: TJvStandardPage; }
    DBCtrlGrid2.ClassName; { DBCtrlGrid2: TDBCtrlGrid; }
    pgResumoProdutos.ClassName; { pgResumoProdutos: TJvStandardPage; }
    cxGrid1.ClassName; { cxGrid1: TcxGrid; }
    cxGrid1DBTableView1.ClassName; { cxGrid1DBTableView1: TcxGridDBTableView; }
    cxgrdbclmnGrid1DBTableView1COD_BARRAS.ClassName; { cxgrdbclmnGrid1DBTableView1COD_BARRAS: TcxGridDBColumn; }
    cxgrdbclmnGrid1DBTableView1DESCRICAO.ClassName; { cxgrdbclmnGrid1DBTableView1DESCRICAO: TcxGridDBColumn; }
    cxgrdbclmnGrid1DBTableView1QUANTIDADE.ClassName; { cxgrdbclmnGrid1DBTableView1QUANTIDADE: TcxGridDBColumn; }
    cxgrdbclmnGrid1DBTableView1VALOR_UNITARIO.ClassName; { cxgrdbclmnGrid1DBTableView1VALOR_UNITARIO: TcxGridDBColumn; }
    cxgrdbclmnGrid1DBTableView1TOTAL.ClassName; { cxgrdbclmnGrid1DBTableView1TOTAL: TcxGridDBColumn; }
    cxGrid1Level1.ClassName; { cxGrid1Level1: TcxGridLevel; }
    pgConsultaCliente.ClassName; { pgConsultaCliente: TJvStandardPage; }
    Panel2.ClassName; { Panel2: TPanel; }
    Label28.ClassName; { Label28: TLabel; }
    lbHora.ClassName; { lbHora: TLabel; }
    Panel15.ClassName; { Panel15: TPanel; }
    AdvGlassButton1.ClassName; { AdvGlassButton1: TAdvGlassButton; }
    Panel16.ClassName; { Panel16: TPanel; }
    rdTipoConsultaCliente.ClassName; { rdTipoConsultaCliente: TRadioGroup; }
    pnFiltrosPesquisa.ClassName; { pnFiltrosPesquisa: TPanel; }
    lbNomeCliente.ClassName; { lbNomeCliente: TLabel; }
    lbEnderecoCliente.ClassName; { lbEnderecoCliente: TLabel; }
    lbEnderecoBairro.ClassName; { lbEnderecoBairro: TLabel; }
    edNomeClienteConsulta.ClassName; { edNomeClienteConsulta: TCurvyEdit; }
    edEnderecoConsultaCliente.ClassName; { edEnderecoConsultaCliente: TCurvyEdit; }
    edEnderecoConsultaBairro.ClassName; { edEnderecoConsultaBairro: TCurvyEdit; }
    Panel17.ClassName; { Panel17: TPanel; }
    gridConsultaClientes.ClassName; { gridConsultaClientes: TcxGrid; }
    gridConsultaClientesDBTableView1.ClassName; { gridConsultaClientesDBTableView1: TcxGridDBTableView; }
    gridConsultaClientesDBTableView1Column1.ClassName; { gridConsultaClientesDBTableView1Column1: TcxGridDBColumn; }
    gridConsultaClientesDBTableView1Column2.ClassName; { gridConsultaClientesDBTableView1Column2: TcxGridDBColumn; }
    gridConsultaClientesDBTableView1Column3.ClassName; { gridConsultaClientesDBTableView1Column3: TcxGridDBColumn; }
    gridConsultaClientesDBTableView1Column4.ClassName; { gridConsultaClientesDBTableView1Column4: TcxGridDBColumn; }
    gridConsultaClientesDBTableView1Column5.ClassName; { gridConsultaClientesDBTableView1Column5: TcxGridDBColumn; }
    gridConsultaClientesLevel1.ClassName; { gridConsultaClientesLevel1: TcxGridLevel; }
    PopupMenu1.ClassName; { PopupMenu1: TPopupMenu; }
    Excluir1.ClassName; { Excluir1: TMenuItem; }
    PopupMenu2.ClassName; { PopupMenu2: TPopupMenu; }
    MenuItem1.ClassName; { MenuItem1: TMenuItem; }
    cliques.ClassName; { cliques: TActionList; }
    actlBusca.ClassName; { actlBusca: TJvControlActionList; }
    ImageList1.ClassName; { ImageList1: TImageList; }
    JvPopupMenu1.ClassName; { JvPopupMenu1: TJvPopupMenu; }
    Excluirobservao1.ClassName; { Excluirobservao1: TMenuItem; }
    ApplicationEvents1.ClassName; { ApplicationEvents1: TApplicationEvents; }
    PopupMenu3.ClassName; { PopupMenu3: TPopupMenu; }
    Copiarestepedido1.ClassName; { Copiarestepedido1: TMenuItem; }
    ACBrValidador1.ClassName; { ACBrValidador1: TACBrValidador; }
    cxStyleRepository1.ClassName; { cxStyleRepository1: TcxStyleRepository; }
    cxStyle2.ClassName; { cxStyle2: TcxStyle; }
    cxStyle1.ClassName; { cxStyle1: TcxStyle; }
    cxStyleRepository2.ClassName; { cxStyleRepository2: TcxStyleRepository; }
    cxStyle3.ClassName; { cxStyle3: TcxStyle; }
    cxStyle4.ClassName; { cxStyle4: TcxStyle; }
  end;

{ frmExpedicaoDelivery: TfrmExpedicaoDelivery }
  with TfrmExpedicaoDelivery(nil) do { uuExpedicaoDelivery.pas }
  begin
    botao_pesquisa.ClassName; { botao_pesquisa: TSpeedButton; }
    Label6.ClassName; { Label6: TLabel; }
    Label5.ClassName; { Label5: TLabel; }
    Label8.ClassName; { Label8: TLabel; }
    PngSpeedButton1.ClassName; { PngSpeedButton1: TPngSpeedButton; }
    PngSpeedButton9.ClassName; { PngSpeedButton9: TPngSpeedButton; }
    PngSpeedButton10.ClassName; { PngSpeedButton10: TPngSpeedButton; }
    Edit1.ClassName; { Edit1: TEdit; }
    pnPrincipal.ClassName; { pnPrincipal: TPanel; }
    pnTitulo.ClassName; { pnTitulo: TPanel; }
    lbTitulo.ClassName; { lbTitulo: TLabel; }
    btSom.ClassName; { btSom: TPngSpeedButton; }
    pnDataHora.ClassName; { pnDataHora: TPanel; }
    lbDataSistema.ClassName; { lbDataSistema: TLabel; }
    lbHora.ClassName; { lbHora: TLabel; }
    pnAtualizarIntegracao.ClassName; { pnAtualizarIntegracao: TPanel; }
    Label4.ClassName; { Label4: TLabel; }
    btAtualizarLista.ClassName; { btAtualizarLista: TPngSpeedButton; }
    edDataPedidosPlataforma.ClassName; { edDataPedidosPlataforma: TJvDateTimePicker; }
    ckbApenasNaoLancados.ClassName; { ckbApenasNaoLancados: TCheckBox; }
    plControle.ClassName; { plControle: TJvPageList; }
    pgExpedicao.ClassName; { pgExpedicao: TJvStandardPage; }
    pnPrincipalExpedicao.ClassName; { pnPrincipalExpedicao: TPanel; }
    pnFiltrosExpedicao.ClassName; { pnFiltrosExpedicao: TPanel; }
    btFiltraPedidos.ClassName; { btFiltraPedidos: TPngSpeedButton; }
    Label3.ClassName; { Label3: TLabel; }
    Label1.ClassName; { Label1: TLabel; }
    btNovoPedido.ClassName; { btNovoPedido: TPngSpeedButton; }
    btClientes.ClassName; { btClientes: TPngSpeedButton; }
    btBairros.ClassName; { btBairros: TPngSpeedButton; }
    btConsultarPedido.ClassName; { btConsultarPedido: TPngSpeedButton; }
    btSair.ClassName; { btSair: TPngSpeedButton; }
    Label7.ClassName; { Label7: TLabel; }
    btPedidosPlataforma.ClassName; { btPedidosPlataforma: TPngSpeedButton; }
    RadioGroup1.ClassName; { RadioGroup1: TRadioGroup; }
    rdTipoEntrega.ClassName; { rdTipoEntrega: TRadioGroup; }
    rdFiltro.ClassName; { rdFiltro: TRadioGroup; }
    rdpOrdem.ClassName; { rdpOrdem: TRadioGroup; }
    edDataEntrega.ClassName; { edDataEntrega: TDateEdit; }
    edHoraInicial.ClassName; { edHoraInicial: TMaskEdit; }
    edHoraFinal.ClassName; { edHoraFinal: TMaskEdit; }
    rdExibePedidos.ClassName; { rdExibePedidos: TRadioGroup; }
    edNomeCliente.ClassName; { edNomeCliente: TCurvyEdit; }
    Panel6.ClassName; { Panel6: TPanel; }
    Label9.ClassName; { Label9: TLabel; }
    PngSpeedButton2.ClassName; { PngSpeedButton2: TPngSpeedButton; }
    spinTempo.ClassName; { spinTempo: TSpinEdit; }
    cxGrid1.ClassName; { cxGrid1: TcxGrid; }
    cxGrid1DBTableView1.ClassName; { cxGrid1DBTableView1: TcxGridDBTableView; }
    cxGrid1DBTableView1Column1.ClassName; { cxGrid1DBTableView1Column1: TcxGridDBColumn; }
    SeiLa.ClassName; { SeiLa: TcxGridDBColumn; }
    cxGrid1DBTableView1Column2.ClassName; { cxGrid1DBTableView1Column2: TcxGridDBColumn; }
    cxGrid1DBTableView1Column3.ClassName; { cxGrid1DBTableView1Column3: TcxGridDBColumn; }
    cxGrid1DBTableView1Column4.ClassName; { cxGrid1DBTableView1Column4: TcxGridDBColumn; }
    cxGrid1DBTableView1Column8.ClassName; { cxGrid1DBTableView1Column8: TcxGridDBColumn; }
    cxGrid1DBTableView1Column10.ClassName; { cxGrid1DBTableView1Column10: TcxGridDBColumn; }
    cxGrid1DBTableView1Column5.ClassName; { cxGrid1DBTableView1Column5: TcxGridDBColumn; }
    cxGrid1DBTableView1Column6.ClassName; { cxGrid1DBTableView1Column6: TcxGridDBColumn; }
    cxGrid1DBTableView1Column11.ClassName; { cxGrid1DBTableView1Column11: TcxGridDBColumn; }
    cxGrid1DBTableView1Column9.ClassName; { cxGrid1DBTableView1Column9: TcxGridDBColumn; }
    cxGrid1DBTableView1Column7.ClassName; { cxGrid1DBTableView1Column7: TcxGridDBColumn; }
    cxGrid1DBTableView1Column13.ClassName; { cxGrid1DBTableView1Column13: TcxGridDBColumn; }
    cxGrid1DBTableView1Column14.ClassName; { cxGrid1DBTableView1Column14: TcxGridDBColumn; }
    cxGrid1DBTableView1Column12.ClassName; { cxGrid1DBTableView1Column12: TcxGridDBColumn; }
    cxGrid1DBTableView1Column15.ClassName; { cxGrid1DBTableView1Column15: TcxGridDBColumn; }
    cxGrid1DBTableView1Column16.ClassName; { cxGrid1DBTableView1Column16: TcxGridDBColumn; }
    cxGrid1DBTableView1Column17.ClassName; { cxGrid1DBTableView1Column17: TcxGridDBColumn; }
    cxGrid1Level1.ClassName; { cxGrid1Level1: TcxGridLevel; }
    pnRodapeExpedicao.ClassName; { pnRodapeExpedicao: TPanel; }
    lbQtdPedidosAbertos.ClassName; { lbQtdPedidosAbertos: TLabel; }
    lbTotalPedidosAbertos.ClassName; { lbTotalPedidosAbertos: TLabel; }
    shapeAberto.ClassName; { shapeAberto: TShape; }
    lbAberto.ClassName; { lbAberto: TLabel; }
    ShapeRecebidos.ClassName; { ShapeRecebidos: TShape; }
    lbTotalPedidosRecebidos.ClassName; { lbTotalPedidosRecebidos: TLabel; }
    lbQtdPedidosRecebidos.ClassName; { lbQtdPedidosRecebidos: TLabel; }
    lbRecebidos.ClassName; { lbRecebidos: TLabel; }
    ShapeGeral.ClassName; { ShapeGeral: TShape; }
    lbTotalPedidosGeral.ClassName; { lbTotalPedidosGeral: TLabel; }
    lbQtdPedidosGeral.ClassName; { lbQtdPedidosGeral: TLabel; }
    lbGeral.ClassName; { lbGeral: TLabel; }
    lbNomeUsuario.ClassName; { lbNomeUsuario: TLabel; }
    AdvOfficeImage1.ClassName; { AdvOfficeImage1: TAdvOfficeImage; }
    lbNumeroEstacao.ClassName; { lbNumeroEstacao: TLabel; }
    AdvOfficeImage2.ClassName; { AdvOfficeImage2: TAdvOfficeImage; }
    Label10.ClassName; { Label10: TLabel; }
    lbTempoMedio.ClassName; { lbTempoMedio: TLabel; }
    Shape1.ClassName; { Shape1: TShape; }
    pgEntregadores.ClassName; { pgEntregadores: TJvStandardPage; }
    dbgEntregadores.ClassName; { dbgEntregadores: TDBCtrlGrid; }
    Panel1.ClassName; { Panel1: TPanel; }
    PngSpeedButton11.ClassName; { PngSpeedButton11: TPngSpeedButton; }
    pnl1.ClassName; { pnl1: TPanel; }
    Panel4.ClassName; { Panel4: TPanel; }
    Label27.ClassName; { Label27: TLabel; }
    lblNumeroPedidoEntregadores.ClassName; { lblNumeroPedidoEntregadores: TLabel; }
    Panel2.ClassName; { Panel2: TPanel; }
    Label31.ClassName; { Label31: TLabel; }
    lblNomeClienteEntregadores.ClassName; { lblNomeClienteEntregadores: TLabel; }
    Panel5.ClassName; { Panel5: TPanel; }
    Label32.ClassName; { Label32: TLabel; }
    lblEnderecoEntregadores.ClassName; { lblEnderecoEntregadores: TLabel; }
    Panel27.ClassName; { Panel27: TPanel; }
    Label33.ClassName; { Label33: TLabel; }
    lblBairroEntregadores.ClassName; { lblBairroEntregadores: TLabel; }
    pnl2.ClassName; { pnl2: TPanel; }
    pnl3.ClassName; { pnl3: TPanel; }
    pnl4.ClassName; { pnl4: TPanel; }
    pgPedidosPlataformas.ClassName; { pgPedidosPlataformas: TJvStandardPage; }
    pnPedidos.ClassName; { pnPedidos: TPanel; }
    gridPlataformas.ClassName; { gridPlataformas: TcxGrid; }
    gridPlataformasDBTableView1.ClassName; { gridPlataformasDBTableView1: TcxGridDBTableView; }
    gridPlataformasDBTableView1Column4.ClassName; { gridPlataformasDBTableView1Column4: TcxGridDBColumn; }
    gridPlataformasDBTableView1Column2.ClassName; { gridPlataformasDBTableView1Column2: TcxGridDBColumn; }
    gridPlataformasDBTableView1Column7.ClassName; { gridPlataformasDBTableView1Column7: TcxGridDBColumn; }
    gridPlataformasDBTableView1Column11.ClassName; { gridPlataformasDBTableView1Column11: TcxGridDBColumn; }
    gridPlataformasDBTableView1Column1.ClassName; { gridPlataformasDBTableView1Column1: TcxGridDBColumn; }
    gridPlataformasDBTableView1Column3.ClassName; { gridPlataformasDBTableView1Column3: TcxGridDBColumn; }
    cancelado.ClassName; { cancelado: TcxGridDBColumn; }
    confirmado.ClassName; { confirmado: TcxGridDBColumn; }
    colStatusInt.ClassName; { colStatusInt: TcxGridDBColumn; }
    clienteAssociado.ClassName; { clienteAssociado: TcxGridDBColumn; }
    StatusIntegracaoSistema.ClassName; { StatusIntegracaoSistema: TcxGridDBColumn; }
    gridPlataformasLevel1.ClassName; { gridPlataformasLevel1: TcxGridLevel; }
    pnDadosDoPedido.ClassName; { pnDadosDoPedido: TPanel; }
    pnDadosDoCliente.ClassName; { pnDadosDoCliente: TPanel; }
    Panel19.ClassName; { Panel19: TPanel; }
    Label2.ClassName; { Label2: TLabel; }
    lbNomeCliente.ClassName; { lbNomeCliente: TLabel; }
    pnClienteNovo.ClassName; { pnClienteNovo: TPanel; }
    Panel21.ClassName; { Panel21: TPanel; }
    Label11.ClassName; { Label11: TLabel; }
    lbBairro.ClassName; { lbBairro: TLabel; }
    Panel22.ClassName; { Panel22: TPanel; }
    Label21.ClassName; { Label21: TLabel; }
    lbEnderecoCliente.ClassName; { lbEnderecoCliente: TLabel; }
    Panel23.ClassName; { Panel23: TPanel; }
    Label12.ClassName; { Label12: TLabel; }
    lbNomeLoja.ClassName; { lbNomeLoja: TLabel; }
    Panel25.ClassName; { Panel25: TPanel; }
    Label14.ClassName; { Label14: TLabel; }
    lbNumeroPedidoCliente.ClassName; { lbNumeroPedidoCliente: TLabel; }
    Panel3.ClassName; { Panel3: TPanel; }
    PngSpeedButton7.ClassName; { PngSpeedButton7: TPngSpeedButton; }
    pgTipoEntrega.ClassName; { pgTipoEntrega: TJvPageList; }
    pgDelivery.ClassName; { pgDelivery: TJvStandardPage; }
    Panel24.ClassName; { Panel24: TPanel; }
    Label15.ClassName; { Label15: TLabel; }
    lbObservacoesEntrega.ClassName; { lbObservacoesEntrega: TLabel; }
    pgParaLevar.ClassName; { pgParaLevar: TJvStandardPage; }
    Panel34.ClassName; { Panel34: TPanel; }
    Label34.ClassName; { Label34: TLabel; }
    pnProdutosPedido.ClassName; { pnProdutosPedido: TPanel; }
    pnCabecalhoProdutos.ClassName; { pnCabecalhoProdutos: TPanel; }
    Label13.ClassName; { Label13: TLabel; }
    Panel7.ClassName; { Panel7: TPanel; }
    Label16.ClassName; { Label16: TLabel; }
    Panel8.ClassName; { Panel8: TPanel; }
    Label17.ClassName; { Label17: TLabel; }
    Panel13.ClassName; { Panel13: TPanel; }
    Panel14.ClassName; { Panel14: TPanel; }
    Label18.ClassName; { Label18: TLabel; }
    Panel15.ClassName; { Panel15: TPanel; }
    Panel16.ClassName; { Panel16: TPanel; }
    Panel11.ClassName; { Panel11: TPanel; }
    Panel9.ClassName; { Panel9: TPanel; }
    pnItens.ClassName; { pnItens: TPanel; }
    scrollPedidos.ClassName; { scrollPedidos: TScrollBox; }
    pnItemPedido.ClassName; { pnItemPedido: TPanel; }
    pnNomeProduto.ClassName; { pnNomeProduto: TPanel; }
    lbNomeProduto.ClassName; { lbNomeProduto: TLabel; }
    pnQtdProduto.ClassName; { pnQtdProduto: TPanel; }
    lbQtdProduto.ClassName; { lbQtdProduto: TLabel; }
    Panel17.ClassName; { Panel17: TPanel; }
    pnTotalProduto.ClassName; { pnTotalProduto: TPanel; }
    lbTotalProduto.ClassName; { lbTotalProduto: TLabel; }
    pnPrecoProduto.ClassName; { pnPrecoProduto: TPanel; }
    lbPrecoProduto.ClassName; { lbPrecoProduto: TLabel; }
    Panel10.ClassName; { Panel10: TPanel; }
    Panel12.ClassName; { Panel12: TPanel; }
    pnBotoesAceitarPedido.ClassName; { pnBotoesAceitarPedido: TPanel; }
    itRejeitarPedido.ClassName; { itRejeitarPedido: TPngSpeedButton; }
    itConfirmarPedido.ClassName; { itConfirmarPedido: TPngSpeedButton; }
    PngSpeedButton8.ClassName; { PngSpeedButton8: TPngSpeedButton; }
    pgLocalizacaoCliente.ClassName; { pgLocalizacaoCliente: TJvStandardPage; }
    pnWebView.ClassName; { pnWebView: TPanel; }
    Panel18.ClassName; { Panel18: TPanel; }
    PngSpeedButton3.ClassName; { PngSpeedButton3: TPngSpeedButton; }
    PngSpeedButton4.ClassName; { PngSpeedButton4: TPngSpeedButton; }
    PngSpeedButton5.ClassName; { PngSpeedButton5: TPngSpeedButton; }
    PngSpeedButton6.ClassName; { PngSpeedButton6: TPngSpeedButton; }
    pnDadosLocalizacao.ClassName; { pnDadosLocalizacao: TPanel; }
    lbLocalizacaoCliente.ClassName; { lbLocalizacaoCliente: TLabel; }
    lbNomeClienteLocalizacao.ClassName; { lbNomeClienteLocalizacao: TLabel; }
    Label19.ClassName; { Label19: TLabel; }
    Label20.ClassName; { Label20: TLabel; }
    pgAssociacaoCliente.ClassName; { pgAssociacaoCliente: TJvStandardPage; }
    pnAssociacaoCliente.ClassName; { pnAssociacaoCliente: TPanel; }
    Panel20.ClassName; { Panel20: TPanel; }
    Panel26.ClassName; { Panel26: TPanel; }
    Label22.ClassName; { Label22: TLabel; }
    lbNomeClienteAssociacao.ClassName; { lbNomeClienteAssociacao: TLabel; }
    Panel28.ClassName; { Panel28: TPanel; }
    Label24.ClassName; { Label24: TLabel; }
    lbBairroClienteAssociacao.ClassName; { lbBairroClienteAssociacao: TLabel; }
    Panel29.ClassName; { Panel29: TPanel; }
    Label26.ClassName; { Label26: TLabel; }
    lbEnderecoClienteAssociacao.ClassName; { lbEnderecoClienteAssociacao: TLabel; }
    Panel31.ClassName; { Panel31: TPanel; }
    Label30.ClassName; { Label30: TLabel; }
    lbObsClienteAssociacao.ClassName; { lbObsClienteAssociacao: TEdit; }
    Panel33.ClassName; { Panel33: TPanel; }
    Label23.ClassName; { Label23: TLabel; }
    lbNumeroPedidoAssociacao.ClassName; { lbNumeroPedidoAssociacao: TLabel; }
    Panel30.ClassName; { Panel30: TPanel; }
    pnFiltrosPesquisa.ClassName; { pnFiltrosPesquisa: TPanel; }
    Label28.ClassName; { Label28: TLabel; }
    Label29.ClassName; { Label29: TLabel; }
    lbEnderecoBairro.ClassName; { lbEnderecoBairro: TLabel; }
    Label25.ClassName; { Label25: TLabel; }
    edNomeClienteConsulta.ClassName; { edNomeClienteConsulta: TCurvyEdit; }
    edEnderecoConsultaCliente.ClassName; { edEnderecoConsultaCliente: TCurvyEdit; }
    edEnderecoConsultaBairro.ClassName; { edEnderecoConsultaBairro: TCurvyEdit; }
    edNumeroConsultaAssociacao.ClassName; { edNumeroConsultaAssociacao: TCurvyEdit; }
    Panel32.ClassName; { Panel32: TPanel; }
    btAssociarCliente.ClassName; { btAssociarCliente: TPngSpeedButton; }
    btClienteSemCadastro.ClassName; { btClienteSemCadastro: TPngSpeedButton; }
    gridConsultaClientes.ClassName; { gridConsultaClientes: TcxGrid; }
    gridConsultaClientesDBTableView1.ClassName; { gridConsultaClientesDBTableView1: TcxGridDBTableView; }
    gridConsultaClientesDBTableView1Column1.ClassName; { gridConsultaClientesDBTableView1Column1: TcxGridDBColumn; }
    gridConsultaClientesDBTableView1Column2.ClassName; { gridConsultaClientesDBTableView1Column2: TcxGridDBColumn; }
    gridConsultaClientesDBTableView1Column3.ClassName; { gridConsultaClientesDBTableView1Column3: TcxGridDBColumn; }
    gridConsultaClientesDBTableView1Column4.ClassName; { gridConsultaClientesDBTableView1Column4: TcxGridDBColumn; }
    gridConsultaClientesDBTableView1Column5.ClassName; { gridConsultaClientesDBTableView1Column5: TcxGridDBColumn; }
    gridConsultaClientesDBTableView1Column6.ClassName; { gridConsultaClientesDBTableView1Column6: TcxGridDBColumn; }
    gridConsultaClientesLevel1.ClassName; { gridConsultaClientesLevel1: TcxGridLevel; }
    cliques.ClassName; { cliques: TActionList; }
    actlBusca.ClassName; { actlBusca: TJvControlActionList; }
    tmAtualizaPedidosExpedicao.ClassName; { tmAtualizaPedidosExpedicao: TTimer; }
    PopupMenu1.ClassName; { PopupMenu1: TPopupMenu; }
    Alteraropedido1.ClassName; { Alteraropedido1: TMenuItem; }
    EXCLUIROPEDIDO1.ClassName; { EXCLUIROPEDIDO1: TMenuItem; }
    SAIDADOPEDIDO1.ClassName; { SAIDADOPEDIDO1: TMenuItem; }
    N1.ClassName; { N1: TMenuItem; }
    RECEBEPEDIDO1.ClassName; { RECEBEPEDIDO1: TMenuItem; }
    timerHora.ClassName; { timerHora: TTimer; }
    HTMLHint1.ClassName; { HTMLHint1: THTMLHint; }
    cxHintStyleController1.ClassName; { cxHintStyleController1: TcxHintStyleController; }
    cxStyleRepository1.ClassName; { cxStyleRepository1: TcxStyleRepository; }
    cxStyle2.ClassName; { cxStyle2: TcxStyle; }
    cxStyle1.ClassName; { cxStyle1: TcxStyle; }
    cxStyle3.ClassName; { cxStyle3: TcxStyle; }
    cxStyle4.ClassName; { cxStyle4: TcxStyle; }
    cxStyle5.ClassName; { cxStyle5: TcxStyle; }
    cxImageList1.ClassName; { cxImageList1: TcxImageList; }
    timerDesabilitaHint.ClassName; { timerDesabilitaHint: TTimer; }
    timerTempoPreparo.ClassName; { timerTempoPreparo: TTimer; }
    tmPoling.ClassName; { tmPoling: TTimer; }
    PopupMenu2.ClassName; { PopupMenu2: TPopupMenu; }
    itCienciaCancelamento.ClassName; { itCienciaCancelamento: TMenuItem; }
    MenuItem1.ClassName; { MenuItem1: TMenuItem; }
    C2.ClassName; { C2: TMenuItem; }
    player.ClassName; { player: TJvWavePlayer; }
    tmAlertaPedidosPlataforma.ClassName; { tmAlertaPedidosPlataforma: TTimer; }
    IdSSLIOHandlerSocketOpenSSL1.ClassName; { IdSSLIOHandlerSocketOpenSSL1: TIdSSLIOHandlerSocketOpenSSL; }
    cxStyleRepository2.ClassName; { cxStyleRepository2: TcxStyleRepository; }
    cxStyle6.ClassName; { cxStyle6: TcxStyle; }
    cxStyle7.ClassName; { cxStyle7: TcxStyle; }
    stConfirmada.ClassName; { stConfirmada: TcxStyle; }
    stCancelada.ClassName; { stCancelada: TcxStyle; }
    stCiencia.ClassName; { stCiencia: TcxStyle; }
    stSemManifesto.ClassName; { stSemManifesto: TcxStyle; }
    stNaoRealizada.ClassName; { stNaoRealizada: TcxStyle; }
    cxImageListPedidosPlataforma.ClassName; { cxImageListPedidosPlataforma: TcxImageList; }
  end;

{ frmSelecionaGrupo: TfrmSelecionaGrupo }
  with TfrmSelecionaGrupo(nil) do { uSelecionaGrupo.pas }
  begin
    botao_pesquisa.ClassName; { botao_pesquisa: TSpeedButton; }
    Edit1.ClassName; { Edit1: TEdit; }
    Panel1.ClassName; { Panel1: TPanel; }
    Panel3.ClassName; { Panel3: TPanel; }
    Label1.ClassName; { Label1: TLabel; }
    edDescricaoGrupo.ClassName; { edDescricaoGrupo: TEdit; }
    DBGrid1.ClassName; { DBGrid1: TDBGrid; }
    Panel2.ClassName; { Panel2: TPanel; }
    btSair.ClassName; { btSair: TAdvGlassButton; }
    btSelecionar.ClassName; { btSelecionar: TAdvGlassButton; }
    Panel4.ClassName; { Panel4: TPanel; }
    lbTop.ClassName; { lbTop: TLabel; }
    ImageList1.ClassName; { ImageList1: TImageList; }
  end;

{ frmCadBairros: TfrmCadBairros }
  with TfrmCadBairros(nil) do { uuCadBairros.pas }
  begin
    pn_principal.ClassName; { pn_principal: TPanel; }
    Label2.ClassName; { Label2: TLabel; }
    Label1.ClassName; { Label1: TLabel; }
    Label5.ClassName; { Label5: TLabel; }
    pn_codigo.ClassName; { pn_codigo: TPanel; }
    bt_pesquisa.ClassName; { bt_pesquisa: TSpeedButton; }
    Label3.ClassName; { Label3: TLabel; }
    ed_codigo.ClassName; { ed_codigo: TMaskEdit; }
    Panel1.ClassName; { Panel1: TPanel; }
    Label4.ClassName; { Label4: TLabel; }
    AdvOfficeImage1.ClassName; { AdvOfficeImage1: TAdvOfficeImage; }
    AdvOfficeImage2.ClassName; { AdvOfficeImage2: TAdvOfficeImage; }
    edTxEtrega.ClassName; { edTxEtrega: TDBEdit; }
    edDescricao.ClassName; { edDescricao: TDBEdit; }
    edRepasse.ClassName; { edRepasse: TDBEdit; }
    pn_botoes.ClassName; { pn_botoes: TPanel; }
    bt_novo.ClassName; { bt_novo: TBitBtn; }
    bt_alterar.ClassName; { bt_alterar: TBitBtn; }
    bt_gravar.ClassName; { bt_gravar: TBitBtn; }
    bt_cancelar.ClassName; { bt_cancelar: TBitBtn; }
    bt_sair.ClassName; { bt_sair: TBitBtn; }
    bt_excluir.ClassName; { bt_excluir: TBitBtn; }
    bt_consultar.ClassName; { bt_consultar: TBitBtn; }
    bt_imprimir.ClassName; { bt_imprimir: TBitBtn; }
  end;

{ frmRelRankingProdutos: TfrmRelRankingProdutos }
  with TfrmRelRankingProdutos(nil) do { uuRelRakingProdutos.pas }
  begin
    botao_pesquisa.ClassName; { botao_pesquisa: TSpeedButton; }
    SpeedButton1.ClassName; { SpeedButton1: TSpeedButton; }
    Edit1.ClassName; { Edit1: TEdit; }
    Edit2.ClassName; { Edit2: TEdit; }
    btSelecionar.ClassName; { btSelecionar: TAdvGlassButton; }
    btSair.ClassName; { btSair: TAdvGlassButton; }
    Panel1.ClassName; { Panel1: TPanel; }
    RadioGroup1.ClassName; { RadioGroup1: TRadioGroup; }
    Panel2.ClassName; { Panel2: TPanel; }
    Label4.ClassName; { Label4: TLabel; }
    Label3.ClassName; { Label3: TLabel; }
    cbk_visualizar.ClassName; { cbk_visualizar: TCheckBox; }
    ed_data_inicial.ClassName; { ed_data_inicial: TAdvDateTimePicker; }
    ed_data_final.ClassName; { ed_data_final: TAdvDateTimePicker; }
    GroupBox1.ClassName; { GroupBox1: TGroupBox; }
    cbEmpresas.ClassName; { cbEmpresas: TcxCheckComboBox; }
    GroupBox2.ClassName; { GroupBox2: TGroupBox; }
    ckbTodas.ClassName; { ckbTodas: TCheckBox; }
    ckbMesas.ClassName; { ckbMesas: TCheckBox; }
    ckbBalcao.ClassName; { ckbBalcao: TCheckBox; }
    ckbDelivery.ClassName; { ckbDelivery: TCheckBox; }
    GroupBox3.ClassName; { GroupBox3: TGroupBox; }
    Label2.ClassName; { Label2: TLabel; }
    bt_pesq_grupo.ClassName; { bt_pesq_grupo: TSpeedButton; }
    ed_cod_grupo.ClassName; { ed_cod_grupo: TMaskEdit; }
    Panel3.ClassName; { Panel3: TPanel; }
    Label1.ClassName; { Label1: TLabel; }
    ed_desc_grupo.ClassName; { ed_desc_grupo: TMaskEdit; }
    rdTipoRanking.ClassName; { rdTipoRanking: TRadioGroup; }
    rdTipoCombo.ClassName; { rdTipoCombo: TRadioGroup; }
    pnTitulo.ClassName; { pnTitulo: TPanel; }
    lbTitulo.ClassName; { lbTitulo: TLabel; }
    cliques.ClassName; { cliques: TActionList; }
  end;

{ frmRelAniversariantes: TfrmRelAniversariantes }
  with TfrmRelAniversariantes(nil) do { uuRelAniversariantes.pas }
  begin
    botao_pesquisa.ClassName; { botao_pesquisa: TSpeedButton; }
    SpeedButton1.ClassName; { SpeedButton1: TSpeedButton; }
    SpeedButton2.ClassName; { SpeedButton2: TSpeedButton; }
    Edit1.ClassName; { Edit1: TEdit; }
    Edit2.ClassName; { Edit2: TEdit; }
    Edit3.ClassName; { Edit3: TEdit; }
    BitBtn1.ClassName; { BitBtn1: TBitBtn; }
    BitBtn2.ClassName; { BitBtn2: TBitBtn; }
    Panel1.ClassName; { Panel1: TPanel; }
    RadioGroup1.ClassName; { RadioGroup1: TRadioGroup; }
    RadioGroup2.ClassName; { RadioGroup2: TRadioGroup; }
    RadioGroup4.ClassName; { RadioGroup4: TRadioGroup; }
    RadioGroup5.ClassName; { RadioGroup5: TRadioGroup; }
    RadioGroup3.ClassName; { RadioGroup3: TRadioGroup; }
    Panel5.ClassName; { Panel5: TPanel; }
    Label3.ClassName; { Label3: TLabel; }
    Label4.ClassName; { Label4: TLabel; }
    cbk_visualizar.ClassName; { cbk_visualizar: TCheckBox; }
    cmbInicio.ClassName; { cmbInicio: TComboBox; }
    cmbFim.ClassName; { cmbFim: TComboBox; }
    Panel2.ClassName; { Panel2: TPanel; }
    Label1.ClassName; { Label1: TLabel; }
    Label2.ClassName; { Label2: TLabel; }
    Label5.ClassName; { Label5: TLabel; }
    CheckBox3.ClassName; { CheckBox3: TCheckBox; }
    edIdadeInicial.ClassName; { edIdadeInicial: TEdit; }
    edIdadeFinal.ClassName; { edIdadeFinal: TEdit; }
    ckbFaixa.ClassName; { ckbFaixa: TCheckBox; }
    ckbEmail.ClassName; { ckbEmail: TCheckBox; }
    ckbTelefone.ClassName; { ckbTelefone: TCheckBox; }
  end;

{ frmConsumoClientesNaCasa: TfrmConsumoClientesNaCasa }
  with TfrmConsumoClientesNaCasa(nil) do { uuRelConsumoClientesNaCasa.pas }
  begin
    botao_pesquisa.ClassName; { botao_pesquisa: TSpeedButton; }
    SpeedButton1.ClassName; { SpeedButton1: TSpeedButton; }
    SpeedButton2.ClassName; { SpeedButton2: TSpeedButton; }
    Edit1.ClassName; { Edit1: TEdit; }
    Edit2.ClassName; { Edit2: TEdit; }
    Edit3.ClassName; { Edit3: TEdit; }
    BitBtn1.ClassName; { BitBtn1: TBitBtn; }
    BitBtn2.ClassName; { BitBtn2: TBitBtn; }
    Panel1.ClassName; { Panel1: TPanel; }
    RadioGroup1.ClassName; { RadioGroup1: TRadioGroup; }
    Panel5.ClassName; { Panel5: TPanel; }
    Label3.ClassName; { Label3: TLabel; }
    Label4.ClassName; { Label4: TLabel; }
    edCartaoInicial.ClassName; { edCartaoInicial: TMaskEdit; }
    edCartaoFinal.ClassName; { edCartaoFinal: TMaskEdit; }
    cbk_visualizar.ClassName; { cbk_visualizar: TCheckBox; }
  end;

{ frmConferenciaCaixa: TfrmConferenciaCaixa }
  with TfrmConferenciaCaixa(nil) do { uuRelConferenciaCaixa.pas }
  begin
    botao_pesquisa.ClassName; { botao_pesquisa: TSpeedButton; }
    Edit1.ClassName; { Edit1: TEdit; }
    Panel4.ClassName; { Panel4: TPanel; }
    Label1.ClassName; { Label1: TLabel; }
    Label2.ClassName; { Label2: TLabel; }
    Panel2.ClassName; { Panel2: TPanel; }
    btFecharCaixa.ClassName; { btFecharCaixa: TBitBtn; }
    BitBtn1.ClassName; { BitBtn1: TBitBtn; }
    Panel1.ClassName; { Panel1: TPanel; }
    RadioGroup1.ClassName; { RadioGroup1: TRadioGroup; }
    edData.ClassName; { edData: TMaskEdit; }
    BitBtn2.ClassName; { BitBtn2: TBitBtn; }
    Panel3.ClassName; { Panel3: TPanel; }
    DBGrid1.ClassName; { DBGrid1: TDBGrid; }
  end;

{ frmCadMotivosCancelamento: TfrmCadMotivosCancelamento }
  with TfrmCadMotivosCancelamento(nil) do { uuCadMotivoCancelamento.pas }
  begin
    pn_principal.ClassName; { pn_principal: TPanel; }
    pn_codigo.ClassName; { pn_codigo: TPanel; }
    bt_pesquisa.ClassName; { bt_pesquisa: TSpeedButton; }
    Label1.ClassName; { Label1: TLabel; }
    ed_codigo.ClassName; { ed_codigo: TMaskEdit; }
    Panel1.ClassName; { Panel1: TPanel; }
    Label2.ClassName; { Label2: TLabel; }
    edDescricaoMotivoEstorno.ClassName; { edDescricaoMotivoEstorno: TDBEdit; }
    pn_botoes.ClassName; { pn_botoes: TPanel; }
    bt_novo.ClassName; { bt_novo: TBitBtn; }
    bt_alterar.ClassName; { bt_alterar: TBitBtn; }
    bt_gravar.ClassName; { bt_gravar: TBitBtn; }
    bt_cancelar.ClassName; { bt_cancelar: TBitBtn; }
    bt_sair.ClassName; { bt_sair: TBitBtn; }
    bt_excluir.ClassName; { bt_excluir: TBitBtn; }
    bt_consultar.ClassName; { bt_consultar: TBitBtn; }
    bt_imprimir.ClassName; { bt_imprimir: TBitBtn; }
  end;

{ frmCadTiposSangria: TfrmCadTiposSangria }
  with TfrmCadTiposSangria(nil) do { uuCadTiposSangria.pas }
  begin
    pn_principal.ClassName; { pn_principal: TPanel; }
    pn_codigo.ClassName; { pn_codigo: TPanel; }
    bt_pesquisa.ClassName; { bt_pesquisa: TSpeedButton; }
    Label1.ClassName; { Label1: TLabel; }
    ed_codigo.ClassName; { ed_codigo: TMaskEdit; }
    Panel1.ClassName; { Panel1: TPanel; }
    Label2.ClassName; { Label2: TLabel; }
    edDescricaoTIpoSangria.ClassName; { edDescricaoTIpoSangria: TDBEdit; }
    pn_botoes.ClassName; { pn_botoes: TPanel; }
    bt_novo.ClassName; { bt_novo: TBitBtn; }
    bt_alterar.ClassName; { bt_alterar: TBitBtn; }
    bt_gravar.ClassName; { bt_gravar: TBitBtn; }
    bt_cancelar.ClassName; { bt_cancelar: TBitBtn; }
    bt_sair.ClassName; { bt_sair: TBitBtn; }
    bt_excluir.ClassName; { bt_excluir: TBitBtn; }
    bt_consultar.ClassName; { bt_consultar: TBitBtn; }
    bt_imprimir.ClassName; { bt_imprimir: TBitBtn; }
  end;

{ frmCsTiposSangria: TfrmCsTiposSangria }
  with TfrmCsTiposSangria(nil) do { uuCsTiposSangria.pas }
  begin
    Panel3.ClassName; { Panel3: TPanel; }
    Label1.ClassName; { Label1: TLabel; }
    ed_parametro.ClassName; { ed_parametro: TEdit; }
    RadioGroup1.ClassName; { RadioGroup1: TRadioGroup; }
    Panel1.ClassName; { Panel1: TPanel; }
    DBGrid1.ClassName; { DBGrid1: TDBGrid; }
    Panel2.ClassName; { Panel2: TPanel; }
    bt_selecionar.ClassName; { bt_selecionar: TBitBtn; }
    bt_cancelar.ClassName; { bt_cancelar: TBitBtn; }
  end;

{ frmSangria: TfrmSangria }
  with TfrmSangria(nil) do { uuSangria.pas }
  begin
    botao_pesquisa.ClassName; { botao_pesquisa: TSpeedButton; }
    Edit1.ClassName; { Edit1: TEdit; }
    Panel4.ClassName; { Panel4: TPanel; }
    Label2.ClassName; { Label2: TLabel; }
    Label3.ClassName; { Label3: TLabel; }
    Panel1.ClassName; { Panel1: TPanel; }
    Label1.ClassName; { Label1: TLabel; }
    Label4.ClassName; { Label4: TLabel; }
    Label5.ClassName; { Label5: TLabel; }
    Label6.ClassName; { Label6: TLabel; }
    btPesqFormaPagto.ClassName; { btPesqFormaPagto: TSpeedButton; }
    Label13.ClassName; { Label13: TLabel; }
    cbTipoSangria.ClassName; { cbTipoSangria: TRxDBLookupCombo; }
    edValorSangria.ClassName; { edValorSangria: TCurrencyEdit; }
    memoObsSangria.ClassName; { memoObsSangria: TMemo; }
    edCodFormaPagamento.ClassName; { edCodFormaPagamento: TEdit; }
    Panel3.ClassName; { Panel3: TPanel; }
    edDescFormaPagto.ClassName; { edDescFormaPagto: TEdit; }
    Panel2.ClassName; { Panel2: TPanel; }
    btConfirmar.ClassName; { btConfirmar: TBitBtn; }
    btCancelar.ClassName; { btCancelar: TBitBtn; }
  end;

{ frmRelPedidosDeliveryPorCliente: TfrmRelPedidosDeliveryPorCliente }
  with TfrmRelPedidosDeliveryPorCliente(nil) do { uuRelatorioPedidosDelivery.pas }
  begin
    frm_modelo_rel_datas.ClassName; { frm_modelo_rel_datas: TPanel; }
    RadioGroup2.ClassName; { RadioGroup2: TRadioGroup; }
    RadioGroup1.ClassName; { RadioGroup1: TRadioGroup; }
    Panel5.ClassName; { Panel5: TPanel; }
    Label2.ClassName; { Label2: TLabel; }
    ed_data_final.ClassName; { ed_data_final: TMaskEdit; }
    Panel2.ClassName; { Panel2: TPanel; }
    bt_imprimir.ClassName; { bt_imprimir: TBitBtn; }
    bt_sair.ClassName; { bt_sair: TBitBtn; }
    Panel3.ClassName; { Panel3: TPanel; }
    Label3.ClassName; { Label3: TLabel; }
    btPesqClienteDelivery.ClassName; { btPesqClienteDelivery: TSpeedButton; }
    Panel1.ClassName; { Panel1: TPanel; }
    Label4.ClassName; { Label4: TLabel; }
    edNomeClienteDelivery.ClassName; { edNomeClienteDelivery: TMaskEdit; }
    edCodCliDelivery.ClassName; { edCodCliDelivery: TMaskEdit; }
  end;

{ frmRelContatoEstrategicoDelivery: TfrmRelContatoEstrategicoDelivery }
  with TfrmRelContatoEstrategicoDelivery(nil) do { uuRelContatoEstrategicoDelivery.pas }
  begin
    frm_modelo_rel_datas.ClassName; { frm_modelo_rel_datas: TPanel; }
    RadioGroup1.ClassName; { RadioGroup1: TRadioGroup; }
    Panel5.ClassName; { Panel5: TPanel; }
    Label1.ClassName; { Label1: TLabel; }
    Label2.ClassName; { Label2: TLabel; }
    ed_data_inicial.ClassName; { ed_data_inicial: TMaskEdit; }
    ed_data_final.ClassName; { ed_data_final: TMaskEdit; }
    Panel2.ClassName; { Panel2: TPanel; }
    bt_imprimir.ClassName; { bt_imprimir: TBitBtn; }
    bt_sair.ClassName; { bt_sair: TBitBtn; }
    rdgSelecaoFiltro.ClassName; { rdgSelecaoFiltro: TRadioGroup; }
    Panel1.ClassName; { Panel1: TPanel; }
    Label3.ClassName; { Label3: TLabel; }
    Label4.ClassName; { Label4: TLabel; }
    Label5.ClassName; { Label5: TLabel; }
    edInicioFaixa.ClassName; { edInicioFaixa: TEdit; }
    edFimFaixa.ClassName; { edFimFaixa: TEdit; }
    ckbDatas.ClassName; { ckbDatas: TCheckBox; }
  end;

{ frmLoginTouch: TfrmLoginTouch }
  with TfrmLoginTouch(nil) do { uuLogTouch.pas }
  begin
    Panel1.ClassName; { Panel1: TPanel; }
    lbTitulo.ClassName; { lbTitulo: TLabel; }
    JvGradient1.ClassName; { JvGradient1: TPanel; }
    gpUsuario.ClassName; { gpUsuario: TGroupBox; }
    AdvOfficeImage1.ClassName; { AdvOfficeImage1: TAdvOfficeImage; }
    AdvOfficeImage2.ClassName; { AdvOfficeImage2: TAdvOfficeImage; }
    edCodUsuario.ClassName; { edCodUsuario: TEdit; }
    edSenha.ClassName; { edSenha: TEdit; }
    Panel2.ClassName; { Panel2: TPanel; }
    B20002003.ClassName; { B20002003: TJvTransparentButton; }
    gpEmpresas.ClassName; { gpEmpresas: TGroupBox; }
    cbEmpresas.ClassName; { cbEmpresas: TcxLookupComboBox; }
    AdvTouchKeyboard1.ClassName; { AdvTouchKeyboard1: TAdvSmoothTouchKeyBoard; }
    ACBrEnterTab1.ClassName; { ACBrEnterTab1: TACBrEnterTab; }
    FDMemTable1.ClassName; { FDMemTable1: TFDMemTable; }
  end;

{ frmRegistroSistema: TfrmRegistroSistema }
  with TfrmRegistroSistema(nil) do { uuRegistroSistema.pas }
  begin
    botao_pesquisa.ClassName; { botao_pesquisa: TSpeedButton; }
    Edit1.ClassName; { Edit1: TEdit; }
    Panel1.ClassName; { Panel1: TPanel; }
    Label1.ClassName; { Label1: TLabel; }
    Label10.ClassName; { Label10: TLabel; }
    Panel3.ClassName; { Panel3: TPanel; }
    Panel5.ClassName; { Panel5: TPanel; }
    BitBtn1.ClassName; { BitBtn1: TBitBtn; }
    BitBtn2.ClassName; { BitBtn2: TBitBtn; }
    Panel2.ClassName; { Panel2: TPanel; }
    Label7.ClassName; { Label7: TLabel; }
    Label8.ClassName; { Label8: TLabel; }
    Label6.ClassName; { Label6: TLabel; }
    Label9.ClassName; { Label9: TLabel; }
    Label2.ClassName; { Label2: TLabel; }
    Label11.ClassName; { Label11: TLabel; }
    Label12.ClassName; { Label12: TLabel; }
    edCnpj.ClassName; { edCnpj: TMaskEdit; }
    edLicenca.ClassName; { edLicenca: TEdit; }
    edIdMaquina.ClassName; { edIdMaquina: TEdit; }
    edEstacao.ClassName; { edEstacao: TEdit; }
    edProduto.ClassName; { edProduto: TEdit; }
    edData.ClassName; { edData: TMaskEdit; }
    edHora.ClassName; { edHora: TMaskEdit; }
    Panel6.ClassName; { Panel6: TPanel; }
    Label4.ClassName; { Label4: TLabel; }
    Label5.ClassName; { Label5: TLabel; }
    Label13.ClassName; { Label13: TLabel; }
    Label14.ClassName; { Label14: TLabel; }
    q1.ClassName; { q1: TEdit; }
    q2.ClassName; { q2: TEdit; }
    q3.ClassName; { q3: TEdit; }
    q4.ClassName; { q4: TEdit; }
  end;

{ frmParabensRegistro: TfrmParabensRegistro }
  with TfrmParabensRegistro(nil) do { uuParabensRegistro.pas }
  begin
    botao_pesquisa.ClassName; { botao_pesquisa: TSpeedButton; }
    Edit1.ClassName; { Edit1: TEdit; }
    Panel1.ClassName; { Panel1: TPanel; }
    Label1.ClassName; { Label1: TLabel; }
    Image1.ClassName; { Image1: TImage; }
    Label2.ClassName; { Label2: TLabel; }
    Label3.ClassName; { Label3: TLabel; }
    Memo1.ClassName; { Memo1: TMemo; }
    Edit2.ClassName; { Edit2: TEdit; }
    Edit3.ClassName; { Edit3: TEdit; }
    Edit4.ClassName; { Edit4: TEdit; }
    Panel2.ClassName; { Panel2: TPanel; }
    Label4.ClassName; { Label4: TLabel; }
    Image2.ClassName; { Image2: TImage; }
    Label5.ClassName; { Label5: TLabel; }
    Label6.ClassName; { Label6: TLabel; }
    lbExpiracao.ClassName; { lbExpiracao: TLabel; }
    Memo2.ClassName; { Memo2: TMemo; }
    q1.ClassName; { q1: TEdit; }
    q2.ClassName; { q2: TEdit; }
    q3.ClassName; { q3: TEdit; }
    q4.ClassName; { q4: TEdit; }
    BitBtn1.ClassName; { BitBtn1: TBitBtn; }
  end;

{ frmSistemaBloqueado: TfrmSistemaBloqueado }
  with TfrmSistemaBloqueado(nil) do { uuSistemaBloqueado.pas }
  begin
    botao_pesquisa.ClassName; { botao_pesquisa: TSpeedButton; }
    Edit1.ClassName; { Edit1: TEdit; }
    Panel1.ClassName; { Panel1: TPanel; }
    Image1.ClassName; { Image1: TImage; }
    MEMO.ClassName; { MEMO: TMemo; }
    Panel2.ClassName; { Panel2: TPanel; }
    BitBtn1.ClassName; { BitBtn1: TBitBtn; }
    BitBtn2.ClassName; { BitBtn2: TBitBtn; }
    Panel3.ClassName; { Panel3: TPanel; }
    memo1.ClassName; { memo1: TMemo; }
    Timer1.ClassName; { Timer1: TTimer; }
    Timer2.ClassName; { Timer2: TTimer; }
  end;

{ frmAvisoExpiracao: TfrmAvisoExpiracao }
  with TfrmAvisoExpiracao(nil) do { uuAvisoExpiracao.pas }
  begin
    botao_pesquisa.ClassName; { botao_pesquisa: TSpeedButton; }
    SpeedButton1.ClassName; { SpeedButton1: TSpeedButton; }
    Edit1.ClassName; { Edit1: TEdit; }
    Edit2.ClassName; { Edit2: TEdit; }
    frmAvisoExpiracao.ClassName; { frmAvisoExpiracao: TPanel; }
    Image1.ClassName; { Image1: TImage; }
    lbaviso.ClassName; { lbaviso: TLabel; }
    lbExpiracao.ClassName; { lbExpiracao: TLabel; }
    lbaviso1.ClassName; { lbaviso1: TLabel; }
    Label4.ClassName; { Label4: TLabel; }
    Label5.ClassName; { Label5: TLabel; }
    Panel2.ClassName; { Panel2: TPanel; }
    BitBtn1.ClassName; { BitBtn1: TBitBtn; }
    BitBtn2.ClassName; { BitBtn2: TBitBtn; }
    Panel3.ClassName; { Panel3: TPanel; }
    memo1.ClassName; { memo1: TMemo; }
    Timer1.ClassName; { Timer1: TTimer; }
    Timer2.ClassName; { Timer2: TTimer; }
  end;

{ frmLicenca: TfrmLicenca }
  with TfrmLicenca(nil) do { uuLicenca.pas }
  begin
    botao_pesquisa.ClassName; { botao_pesquisa: TSpeedButton; }
    Edit1.ClassName; { Edit1: TEdit; }
    Panel1.ClassName; { Panel1: TPanel; }
    Image1.ClassName; { Image1: TImage; }
    Label1.ClassName; { Label1: TLabel; }
    Label2.ClassName; { Label2: TLabel; }
    Label3.ClassName; { Label3: TLabel; }
    Label4.ClassName; { Label4: TLabel; }
    Label5.ClassName; { Label5: TLabel; }
    Label7.ClassName; { Label7: TLabel; }
    Image2.ClassName; { Image2: TImage; }
    Image3.ClassName; { Image3: TImage; }
    Label9.ClassName; { Label9: TLabel; }
    Label10.ClassName; { Label10: TLabel; }
    Label8.ClassName; { Label8: TLabel; }
    Label6.ClassName; { Label6: TLabel; }
    Memo1.ClassName; { Memo1: TMemo; }
    edLicenca.ClassName; { edLicenca: TEdit; }
    edCNPJ.ClassName; { edCNPJ: TMaskEdit; }
    edIdMaquina.ClassName; { edIdMaquina: TEdit; }
  end;

{ frmCsMotivosEstorno: TfrmCsMotivosEstorno }
  with TfrmCsMotivosEstorno(nil) do { uuCsMotivosEstorno.pas }
  begin
    Panel3.ClassName; { Panel3: TPanel; }
    Label1.ClassName; { Label1: TLabel; }
    ed_parametro.ClassName; { ed_parametro: TEdit; }
    RadioGroup1.ClassName; { RadioGroup1: TRadioGroup; }
    Panel1.ClassName; { Panel1: TPanel; }
    DBGrid1.ClassName; { DBGrid1: TDBGrid; }
    Panel2.ClassName; { Panel2: TPanel; }
    bt_selecionar.ClassName; { bt_selecionar: TBitBtn; }
    bt_cancelar.ClassName; { bt_cancelar: TBitBtn; }
  end;

{ frmCadObsPreparo: TfrmCadObsPreparo }
  with TfrmCadObsPreparo(nil) do { uuCadObservacoesPreparo.pas }
  begin
    pn_principal.ClassName; { pn_principal: TPanel; }
    pn_codigo.ClassName; { pn_codigo: TPanel; }
    bt_pesquisa.ClassName; { bt_pesquisa: TSpeedButton; }
    Label1.ClassName; { Label1: TLabel; }
    ed_codigo.ClassName; { ed_codigo: TMaskEdit; }
    Panel1.ClassName; { Panel1: TPanel; }
    Label2.ClassName; { Label2: TLabel; }
    SpeedButton1.ClassName; { SpeedButton1: TSpeedButton; }
    edDescricaoObsPreparo.ClassName; { edDescricaoObsPreparo: TDBEdit; }
    pn_botoes.ClassName; { pn_botoes: TPanel; }
    bt_novo.ClassName; { bt_novo: TBitBtn; }
    bt_alterar.ClassName; { bt_alterar: TBitBtn; }
    bt_gravar.ClassName; { bt_gravar: TBitBtn; }
    bt_cancelar.ClassName; { bt_cancelar: TBitBtn; }
    bt_sair.ClassName; { bt_sair: TBitBtn; }
    bt_excluir.ClassName; { bt_excluir: TBitBtn; }
    bt_consultar.ClassName; { bt_consultar: TBitBtn; }
    bt_imprimir.ClassName; { bt_imprimir: TBitBtn; }
  end;

{ frmCsObservacoesPreparo: TfrmCsObservacoesPreparo }
  with TfrmCsObservacoesPreparo(nil) do { uuCsObservacoesPreparo.pas }
  begin
    Panel3.ClassName; { Panel3: TPanel; }
    Label1.ClassName; { Label1: TLabel; }
    ed_parametro.ClassName; { ed_parametro: TEdit; }
    RadioGroup1.ClassName; { RadioGroup1: TRadioGroup; }
    Panel1.ClassName; { Panel1: TPanel; }
    DBGrid1.ClassName; { DBGrid1: TDBGrid; }
    Panel2.ClassName; { Panel2: TPanel; }
    bt_selecionar.ClassName; { bt_selecionar: TBitBtn; }
    bt_cancelar.ClassName; { bt_cancelar: TBitBtn; }
  end;

{ frmCadTiposBaixaEstoque: TfrmCadTiposBaixaEstoque }
  with TfrmCadTiposBaixaEstoque(nil) do { uuCadTiposBaixaEstoque.pas }
  begin
    pn_principal.ClassName; { pn_principal: TPanel; }
    pn_codigo.ClassName; { pn_codigo: TPanel; }
    bt_pesquisa.ClassName; { bt_pesquisa: TSpeedButton; }
    Label1.ClassName; { Label1: TLabel; }
    ed_codigo.ClassName; { ed_codigo: TMaskEdit; }
    Panel1.ClassName; { Panel1: TPanel; }
    Label2.ClassName; { Label2: TLabel; }
    edDescricaoTipoBaixaEstoque.ClassName; { edDescricaoTipoBaixaEstoque: TDBEdit; }
    pn_botoes.ClassName; { pn_botoes: TPanel; }
    bt_novo.ClassName; { bt_novo: TBitBtn; }
    bt_alterar.ClassName; { bt_alterar: TBitBtn; }
    bt_gravar.ClassName; { bt_gravar: TBitBtn; }
    bt_cancelar.ClassName; { bt_cancelar: TBitBtn; }
    bt_sair.ClassName; { bt_sair: TBitBtn; }
    bt_excluir.ClassName; { bt_excluir: TBitBtn; }
    bt_consultar.ClassName; { bt_consultar: TBitBtn; }
    bt_imprimir.ClassName; { bt_imprimir: TBitBtn; }
  end;

{ frmCsTiposBaixaEstoque: TfrmCsTiposBaixaEstoque }
  with TfrmCsTiposBaixaEstoque(nil) do { uuCsTiposBaixaEstoque.pas }
  begin
    Panel3.ClassName; { Panel3: TPanel; }
    Label1.ClassName; { Label1: TLabel; }
    ed_parametro.ClassName; { ed_parametro: TEdit; }
    RadioGroup1.ClassName; { RadioGroup1: TRadioGroup; }
    Panel1.ClassName; { Panel1: TPanel; }
    DBGrid1.ClassName; { DBGrid1: TDBGrid; }
    Panel2.ClassName; { Panel2: TPanel; }
    bt_selecionar.ClassName; { bt_selecionar: TBitBtn; }
    bt_cancelar.ClassName; { bt_cancelar: TBitBtn; }
  end;

{ dRelatorios: TdRelatorios }
  with TdRelatorios(nil) do { uuDmRelatorios.pas }
  begin
    qryParametros.ClassName; { qryParametros: TIBQuery; }
    dtParametros.ClassName; { dtParametros: TfrxDBDataset; }
    qryProdutos.ClassName; { qryProdutos: TIBQuery; }
    dtProdutos.ClassName; { dtProdutos: TfrxDBDataset; }
    qryUnidades.ClassName; { qryUnidades: TIBQuery; }
    dtUnidades.ClassName; { dtUnidades: TfrxDBDataset; }
    qryGarcons.ClassName; { qryGarcons: TIBQuery; }
    dtGarcons.ClassName; { dtGarcons: TfrxDBDataset; }
    qryTiposBaixa.ClassName; { qryTiposBaixa: TIBQuery; }
    dtTiposBaixa.ClassName; { dtTiposBaixa: TfrxDBDataset; }
    qryMotivosEstorno.ClassName; { qryMotivosEstorno: TIBQuery; }
    dtMotivosEstorno.ClassName; { dtMotivosEstorno: TfrxDBDataset; }
    qryObsPreparo.ClassName; { qryObsPreparo: TIBQuery; }
    dtObsPreparo.ClassName; { dtObsPreparo: TfrxDBDataset; }
    qryTiposSangria.ClassName; { qryTiposSangria: TIBQuery; }
    dtTiposSangria.ClassName; { dtTiposSangria: TfrxDBDataset; }
    qryFornecedores.ClassName; { qryFornecedores: TIBQuery; }
    dtFornecedores.ClassName; { dtFornecedores: TfrxDBDataset; }
    qryGruposFornecedor.ClassName; { qryGruposFornecedor: TIBQuery; }
    dtGruposFornecedor.ClassName; { dtGruposFornecedor: TfrxDBDataset; }
    qryItensEstoque.ClassName; { qryItensEstoque: TIBQuery; }
    dtItensEstoque.ClassName; { dtItensEstoque: TfrxDBDataset; }
    qryComprasPorGrupo.ClassName; { qryComprasPorGrupo: TIBQuery; }
    dtComprasPorGrupo.ClassName; { dtComprasPorGrupo: TfrxDBDataset; }
    qryComprasItem.ClassName; { qryComprasItem: TIBQuery; }
    dtComprasPorItem.ClassName; { dtComprasPorItem: TfrxDBDataset; }
    qryItemMaisBaratoPeriodo.ClassName; { qryItemMaisBaratoPeriodo: TIBQuery; }
    dtItemMaisBaratoPeriodo.ClassName; { dtItemMaisBaratoPeriodo: TfrxDBDataset; }
    dtItemMaisCaroPeriodo.ClassName; { dtItemMaisCaroPeriodo: TfrxDBDataset; }
    qryItemMaisCaroPeriodo.ClassName; { qryItemMaisCaroPeriodo: TIBQuery; }
    qryCaixas.ClassName; { qryCaixas: TIBQuery; }
    qryCaixasCODIGO.ClassName; { qryCaixasCODIGO: TIBStringField; }
    qryCaixasDATA_ABERTURA.ClassName; { qryCaixasDATA_ABERTURA: TDateField; }
    qryCaixasHORA_ABERTURA.ClassName; { qryCaixasHORA_ABERTURA: TTimeField; }
    qryCaixasDATA_FECHAMENTO.ClassName; { qryCaixasDATA_FECHAMENTO: TDateField; }
    qryCaixasHORA_FECHAMENTO.ClassName; { qryCaixasHORA_FECHAMENTO: TTimeField; }
    qryCaixasSUPRIMENTO_INICIAL.ClassName; { qryCaixasSUPRIMENTO_INICIAL: TIBBCDField; }
    qryCaixasTOTAL_RECEBIMENTOS.ClassName; { qryCaixasTOTAL_RECEBIMENTOS: TIBBCDField; }
    qryCaixasTOTAL_SUPRIMENTOS.ClassName; { qryCaixasTOTAL_SUPRIMENTOS: TIBBCDField; }
    qryCaixasTOTAL_SANGRIAS.ClassName; { qryCaixasTOTAL_SANGRIAS: TIBBCDField; }
    qryCaixasCOD_USUARIO.ClassName; { qryCaixasCOD_USUARIO: TIBStringField; }
    qryCaixasNOME_USUARIO.ClassName; { qryCaixasNOME_USUARIO: TIBStringField; }
    qryCaixasNUMERO_CAIXA.ClassName; { qryCaixasNUMERO_CAIXA: TIBStringField; }
    qryCaixasSTATUS.ClassName; { qryCaixasSTATUS: TSmallintField; }
    qryCaixasDATA_SISTEMA.ClassName; { qryCaixasDATA_SISTEMA: TDateField; }
    qryCaixasCOBRA_SERVICO.ClassName; { qryCaixasCOBRA_SERVICO: TSmallintField; }
    qryCaixasTURNO.ClassName; { qryCaixasTURNO: TSmallintField; }
    qryCaixasSELECIONADO.ClassName; { qryCaixasSELECIONADO: TSmallintField; }
    qryCaixasDESCRICAO.ClassName; { qryCaixasDESCRICAO: TIBStringField; }
    dsCaixas.ClassName; { dsCaixas: TDataSource; }
    qryVendas.ClassName; { qryVendas: TIBQuery; }
    dsQryVendas.ClassName; { dsQryVendas: TDataSource; }
    dtVendas.ClassName; { dtVendas: TfrxDBDataset; }
    qryRecebimentos.ClassName; { qryRecebimentos: TIBQuery; }
    dtRecebimentos.ClassName; { dtRecebimentos: TfrxDBDataset; }
    qryComposicoesProduto.ClassName; { qryComposicoesProduto: TIBQuery; }
    dsComposicoesProduto.ClassName; { dsComposicoesProduto: TDataSource; }
    dsQryProdutos.ClassName; { dsQryProdutos: TDataSource; }
    dtComposicoesProduto.ClassName; { dtComposicoesProduto: TfrxDBDataset; }
    qryBaixasManuais.ClassName; { qryBaixasManuais: TIBQuery; }
    dtBaixasManuais.ClassName; { dtBaixasManuais: TfrxDBDataset; }
    qryBaixasManuaisSintetico.ClassName; { qryBaixasManuaisSintetico: TIBQuery; }
    dtBaixasManuaisSintetico.ClassName; { dtBaixasManuaisSintetico: TfrxDBDataset; }
    qrySaidas.ClassName; { qrySaidas: TIBQuery; }
    dsQrySaidas.ClassName; { dsQrySaidas: TDataSource; }
    dtSaidas.ClassName; { dtSaidas: TfrxDBDataset; }
    qryItensSaidas.ClassName; { qryItensSaidas: TIBQuery; }
    dtItensSaidas.ClassName; { dtItensSaidas: TfrxDBDataset; }
    qryCartoes.ClassName; { qryCartoes: TIBQuery; }
    dtCartoes.ClassName; { dtCartoes: TfrxDBDataset; }
    QryFundoCartoes.ClassName; { QryFundoCartoes: TIBQuery; }
    dtFundoCartoes.ClassName; { dtFundoCartoes: TfrxDBDataset; }
    dtComprasGrupoAnalitico.ClassName; { dtComprasGrupoAnalitico: TfrxDBDataset; }
    rpt.ClassName; { rpt: TfrxReport; }
    Data.ClassName; { Data: TfrxDataPage; }
    Page1.ClassName; { Page1: TfrxReportPage; }
    MasterData1.ClassName; { MasterData1: TfrxMasterData; }
    dtFornecedoresCOD_FORNECEDOR.ClassName; { dtFornecedoresCOD_FORNECEDOR: TfrxMemoView; }
    dtFornecedoresNOME_FANTASIA.ClassName; { dtFornecedoresNOME_FANTASIA: TfrxMemoView; }
    dtFornecedoresTELEFONE.ClassName; { dtFornecedoresTELEFONE: TfrxMemoView; }
    Memo2.ClassName; { Memo2: TfrxMemoView; }
    dtFornecedoresEMAIL.ClassName; { dtFornecedoresEMAIL: TfrxMemoView; }
    dtFornecedoresDATA_CADASTRO.ClassName; { dtFornecedoresDATA_CADASTRO: TfrxMemoView; }
    Memo3.ClassName; { Memo3: TfrxMemoView; }
    ReportTitle1.ClassName; { ReportTitle1: TfrxReportTitle; }
    dtParametrosRAZAO_SOCIAL.ClassName; { dtParametrosRAZAO_SOCIAL: TfrxMemoView; }
    dtParametrosNOME_FANTASIA.ClassName; { dtParametrosNOME_FANTASIA: TfrxMemoView; }
    Memo6.ClassName; { Memo6: TfrxMemoView; }
    Memo1.ClassName; { Memo1: TfrxMemoView; }
    Memo14.ClassName; { Memo14: TfrxMemoView; }
    Memo5.ClassName; { Memo5: TfrxMemoView; }
    PageFooter1.ClassName; { PageFooter1: TfrxPageFooter; }
    Memo16.ClassName; { Memo16: TfrxMemoView; }
    Memo18.ClassName; { Memo18: TfrxMemoView; }
    Memo15.ClassName; { Memo15: TfrxMemoView; }
    Memo17.ClassName; { Memo17: TfrxMemoView; }
    PageHeader1.ClassName; { PageHeader1: TfrxPageHeader; }
    Memo4.ClassName; { Memo4: TfrxMemoView; }
    Memo7.ClassName; { Memo7: TfrxMemoView; }
    Memo8.ClassName; { Memo8: TfrxMemoView; }
    Memo9.ClassName; { Memo9: TfrxMemoView; }
    Memo10.ClassName; { Memo10: TfrxMemoView; }
    Memo11.ClassName; { Memo11: TfrxMemoView; }
    Memo12.ClassName; { Memo12: TfrxMemoView; }
    frxXLSXExport1.ClassName; { frxXLSXExport1: TfrxXLSXExport; }
    frxHTML5DivExport1.ClassName; { frxHTML5DivExport1: TfrxHTML5DivExport; }
    frxHTML4DivExport1.ClassName; { frxHTML4DivExport1: TfrxHTML4DivExport; }
    frxPDFExport1.ClassName; { frxPDFExport1: TfrxPDFExport; }
    frxXLSExport1.ClassName; { frxXLSExport1: TfrxXLSExport; }
    frxRTFExport1.ClassName; { frxRTFExport1: TfrxRTFExport; }
    qryNFCEEnviadas.ClassName; { qryNFCEEnviadas: TIBQuery; }
    dtNFCEEnviadas.ClassName; { dtNFCEEnviadas: TfrxDBDataset; }
    dtQryRD.ClassName; { dtQryRD: TfrxDBDataset; }
    qryNotasRDPeriodo.ClassName; { qryNotasRDPeriodo: TIBQuery; }
    qryNotasRDPeriodoCODIGO.ClassName; { qryNotasRDPeriodoCODIGO: TIBStringField; }
    qryNotasRDPeriodoCOD_FORNECEDOR.ClassName; { qryNotasRDPeriodoCOD_FORNECEDOR: TIBStringField; }
    qryNotasRDPeriodoRAZAO_SOCIAL.ClassName; { qryNotasRDPeriodoRAZAO_SOCIAL: TIBStringField; }
    qryNotasRDPeriodoNUM_DOC.ClassName; { qryNotasRDPeriodoNUM_DOC: TIBStringField; }
    qryNotasRDPeriodoDATA_DOCUMENTO.ClassName; { qryNotasRDPeriodoDATA_DOCUMENTO: TDateField; }
    qryNotasRDPeriodoDATA_LANCAMENTO.ClassName; { qryNotasRDPeriodoDATA_LANCAMENTO: TDateField; }
    qryNotasRDPeriodoDATA_RD.ClassName; { qryNotasRDPeriodoDATA_RD: TDateField; }
    qryNotasRDPeriodoTOTAL_NOTA.ClassName; { qryNotasRDPeriodoTOTAL_NOTA: TIBBCDField; }
    qryNotasRDPeriodoTOTAL_LANCAMENTOS.ClassName; { qryNotasRDPeriodoTOTAL_LANCAMENTOS: TFloatField; }
    qryNotasRDPeriodoDATA_VENCIMENTO.ClassName; { qryNotasRDPeriodoDATA_VENCIMENTO: TDateField; }
    qryNotasRDPeriodoOBSERVACOES.ClassName; { qryNotasRDPeriodoOBSERVACOES: TIBStringField; }
    dtNotasRDPeriodo.ClassName; { dtNotasRDPeriodo: TfrxDBDataset; }
    qryNotasRDPeriodoItens.ClassName; { qryNotasRDPeriodoItens: TIBQuery; }
    qryNotasRDPeriodoItensCOD_LANC_RD.ClassName; { qryNotasRDPeriodoItensCOD_LANC_RD: TIBStringField; }
    qryNotasRDPeriodoItensCOD_GRUPO.ClassName; { qryNotasRDPeriodoItensCOD_GRUPO: TIBStringField; }
    qryNotasRDPeriodoItensVALOR.ClassName; { qryNotasRDPeriodoItensVALOR: TFloatField; }
    qryNotasRDPeriodoItensDESCRICAO.ClassName; { qryNotasRDPeriodoItensDESCRICAO: TIBStringField; }
    dsNotasRDPeriodo.ClassName; { dsNotasRDPeriodo: TDataSource; }
    dtNotasRDPeriodoItens.ClassName; { dtNotasRDPeriodoItens: TfrxDBDataset; }
    qryRelItensCompraRDGrupo.ClassName; { qryRelItensCompraRDGrupo: TIBQuery; }
    dtItensCompraRD.ClassName; { dtItensCompraRD: TfrxDBDataset; }
    qryRelItensLancamentosRD.ClassName; { qryRelItensLancamentosRD: TIBQuery; }
    IBStringField1.ClassName; { IBStringField1: TIBStringField; }
    IBStringField2.ClassName; { IBStringField2: TIBStringField; }
    FloatField1.ClassName; { FloatField1: TFloatField; }
    IBStringField3.ClassName; { IBStringField3: TIBStringField; }
    dtItensLancamentosRD.ClassName; { dtItensLancamentosRD: TfrxDBDataset; }
    qryRelAnaliseGerencialMensal.ClassName; { qryRelAnaliseGerencialMensal: TIBQuery; }
    updQryCaixas.ClassName; { updQryCaixas: TIBUpdateSQL; }
    frxCrossObject1.ClassName; { frxCrossObject1: TfrxCrossObject; }
    frxBIFFExport1.ClassName; { frxBIFFExport1: TfrxBIFFExport; }
    qryRelEstornos.ClassName; { qryRelEstornos: TIBQuery; }
    dtQryRelEstornos.ClassName; { dtQryRelEstornos: TfrxDBDataset; }
    qryComprasRefCruzada.ClassName; { qryComprasRefCruzada: TIBQuery; }
    dtComprasRefCruzada.ClassName; { dtComprasRefCruzada: TfrxDBDataset; }
    qryTotaisCompraRefCruzada.ClassName; { qryTotaisCompraRefCruzada: TIBQuery; }
    dtTotaisCompraRefCruzada.ClassName; { dtTotaisCompraRefCruzada: TfrxDBDataset; }
    qryProdutosVendidosHoraGrupo.ClassName; { qryProdutosVendidosHoraGrupo: TIBQuery; }
    dtProdutosVendidosHoraGrupo.ClassName; { dtProdutosVendidosHoraGrupo: TfrxDBDataset; }
    qryNotasInutilizadas.ClassName; { qryNotasInutilizadas: TIBQuery; }
    dtNotasInutilizadas.ClassName; { dtNotasInutilizadas: TfrxDBDataset; }
    qryRelInventario.ClassName; { qryRelInventario: TFDQuery; }
    qryRelInventarioCODIGO.ClassName; { qryRelInventarioCODIGO: TLargeintField; }
    qryRelInventarioDATA_INVENTARIO.ClassName; { qryRelInventarioDATA_INVENTARIO: TDateField; }
    qryRelInventarioDATA_SISTEMA.ClassName; { qryRelInventarioDATA_SISTEMA: TDateField; }
    qryRelInventarioDATA_HORA_SO.ClassName; { qryRelInventarioDATA_HORA_SO: TSQLTimeStampField; }
    qryRelInventarioCOD_HISTORICO.ClassName; { qryRelInventarioCOD_HISTORICO: TIntegerField; }
    qryRelInventarioCOD_USUARIO.ClassName; { qryRelInventarioCOD_USUARIO: TStringField; }
    qryRelInventarioNOME_USUARIO.ClassName; { qryRelInventarioNOME_USUARIO: TStringField; }
    qryRelInventarioTOTAL_PERDAS.ClassName; { qryRelInventarioTOTAL_PERDAS: TBCDField; }
    qryRelInventarioTOTAL_INVENTARIO.ClassName; { qryRelInventarioTOTAL_INVENTARIO: TBCDField; }
    qryRelInventarioCOD_EMPRESA.ClassName; { qryRelInventarioCOD_EMPRESA: TIntegerField; }
    qryRelInventarioOBS.ClassName; { qryRelInventarioOBS: TStringField; }
    qryRelInventarioTOTAL_SOBRAS.ClassName; { qryRelInventarioTOTAL_SOBRAS: TBCDField; }
    qryRelItensInventario.ClassName; { qryRelItensInventario: TFDQuery; }
    qryRelItensInventarioCODIGO.ClassName; { qryRelItensInventarioCODIGO: TLargeintField; }
    qryRelItensInventarioCOD_INVENTARIO.ClassName; { qryRelItensInventarioCOD_INVENTARIO: TLargeintField; }
    qryRelItensInventarioCOD_PRODUTO.ClassName; { qryRelItensInventarioCOD_PRODUTO: TStringField; }
    qryRelItensInventarioDESCRICAO.ClassName; { qryRelItensInventarioDESCRICAO: TStringField; }
    qryRelItensInventarioESTOQUE_SISTEMA.ClassName; { qryRelItensInventarioESTOQUE_SISTEMA: TFMTBCDField; }
    qryRelItensInventarioESTOQUE_APURADO.ClassName; { qryRelItensInventarioESTOQUE_APURADO: TFMTBCDField; }
    qryRelItensInventarioCOD_UNIDADE.ClassName; { qryRelItensInventarioCOD_UNIDADE: TStringField; }
    qryRelItensInventarioDESC_UNIDADE.ClassName; { qryRelItensInventarioDESC_UNIDADE: TStringField; }
    qryRelItensInventarioCUSTO.ClassName; { qryRelItensInventarioCUSTO: TBCDField; }
    qryRelItensInventarioAJUSTE.ClassName; { qryRelItensInventarioAJUSTE: TBCDField; }
    qryRelItensInventarioTOTAL_AJUSTE.ClassName; { qryRelItensInventarioTOTAL_AJUSTE: TFMTBCDField; }
    qryRelItensInventarioTOTAL_INVENTARIO.ClassName; { qryRelItensInventarioTOTAL_INVENTARIO: TBCDField; }
    qryRelItensInventarioNOMEGRUPO.ClassName; { qryRelItensInventarioNOMEGRUPO: TStringField; }
    dsRelInventario.ClassName; { dsRelInventario: TfrxDBDataset; }
    dtRelItensInventario.ClassName; { dtRelItensInventario: TfrxDBDataset; }
    dtInventarios.ClassName; { dtInventarios: TfrxDBDataset; }
    DataSource1.ClassName; { DataSource1: TDataSource; }
    qryResumoInventarios.ClassName; { qryResumoInventarios: TFDQuery; }
    frxDBDataset1.ClassName; { frxDBDataset1: TfrxDBDataset; }
    qryRelFatComparativoMensal.ClassName; { qryRelFatComparativoMensal: TFDQuery; }
    DTqryRelFatComparativoMensal.ClassName; { DTqryRelFatComparativoMensal: TfrxDBDataset; }
    qryRelFatCompDia.ClassName; { qryRelFatCompDia: TFDQuery; }
    dtqryRelFatCompDia.ClassName; { dtqryRelFatCompDia: TfrxDBDataset; }
    qryRelCurvaABCProdutosVendidos.ClassName; { qryRelCurvaABCProdutosVendidos: TFDQuery; }
    dtCurvaABCProdutosVendidos.ClassName; { dtCurvaABCProdutosVendidos: TfrxDBDataset; }
    frxChartObject1.ClassName; { frxChartObject1: TfrxChartObject; }
  end;

{ frmListagemFornecedores: TfrmListagemFornecedores }
  with TfrmListagemFornecedores(nil) do { uu_listagem_fornecedores.pas }
  begin
    SpeedButton1.ClassName; { SpeedButton1: TSpeedButton; }
    Edit2.ClassName; { Edit2: TEdit; }
    Panel4.ClassName; { Panel4: TPanel; }
    BitBtn1.ClassName; { BitBtn1: TBitBtn; }
    BitBtn2.ClassName; { BitBtn2: TBitBtn; }
    Panel1.ClassName; { Panel1: TPanel; }
    gpOrdem.ClassName; { gpOrdem: TRadioGroup; }
  end;

{ frmRelatorioEstoqueConferencia: TfrmRelatorioEstoqueConferencia }
  with TfrmRelatorioEstoqueConferencia(nil) do { uu_relatorio_estoque.pas }
  begin
    botao_pesquisa.ClassName; { botao_pesquisa: TSpeedButton; }
    SpeedButton1.ClassName; { SpeedButton1: TSpeedButton; }
    SpeedButton2.ClassName; { SpeedButton2: TSpeedButton; }
    SpeedButton3.ClassName; { SpeedButton3: TSpeedButton; }
    SpeedButton4.ClassName; { SpeedButton4: TSpeedButton; }
    Edit1.ClassName; { Edit1: TEdit; }
    Edit2.ClassName; { Edit2: TEdit; }
    Edit3.ClassName; { Edit3: TEdit; }
    Edit4.ClassName; { Edit4: TEdit; }
    Edit5.ClassName; { Edit5: TEdit; }
    Panel4.ClassName; { Panel4: TPanel; }
    BitBtn1.ClassName; { BitBtn1: TBitBtn; }
    BitBtn2.ClassName; { BitBtn2: TBitBtn; }
    Panel1.ClassName; { Panel1: TPanel; }
    ckAgrupar.ClassName; { ckAgrupar: TCheckBox; }
    gpOrdem.ClassName; { gpOrdem: TRadioGroup; }
    pn_grupos.ClassName; { pn_grupos: TPanel; }
    Label1.ClassName; { Label1: TLabel; }
    Label2.ClassName; { Label2: TLabel; }
    bt_pesq_grupo.ClassName; { bt_pesq_grupo: TSpeedButton; }
    ed_cod_grupo.ClassName; { ed_cod_grupo: TMaskEdit; }
    Panel3.ClassName; { Panel3: TPanel; }
    ed_desc_grupo.ClassName; { ed_desc_grupo: TMaskEdit; }
  end;

{ frmRelEntradasPorFornecedor: TfrmRelEntradasPorFornecedor }
  with TfrmRelEntradasPorFornecedor(nil) do { uu_rel_compras_por_fornecedor.pas }
  begin
    SpeedButton1.ClassName; { SpeedButton1: TSpeedButton; }
    SpeedButton2.ClassName; { SpeedButton2: TSpeedButton; }
    Edit2.ClassName; { Edit2: TEdit; }
    Edit3.ClassName; { Edit3: TEdit; }
    Panel1.ClassName; { Panel1: TPanel; }
    gpOrdem.ClassName; { gpOrdem: TRadioGroup; }
    cknItensNota.ClassName; { cknItensNota: TCheckBox; }
    RadioGroup1.ClassName; { RadioGroup1: TRadioGroup; }
    Panel3.ClassName; { Panel3: TPanel; }
    Label4.ClassName; { Label4: TLabel; }
    Label3.ClassName; { Label3: TLabel; }
    cbk_visualizar.ClassName; { cbk_visualizar: TCheckBox; }
    edDataFinal.ClassName; { edDataFinal: TAdvDateTimePicker; }
    edDataInicial.ClassName; { edDataInicial: TAdvDateTimePicker; }
    GroupBox1.ClassName; { GroupBox1: TGroupBox; }
    cbEmpresas.ClassName; { cbEmpresas: TcxCheckComboBox; }
    pnFornecedor.ClassName; { pnFornecedor: TPanel; }
    Label6.ClassName; { Label6: TLabel; }
    Label5.ClassName; { Label5: TLabel; }
    bt_pesq_fornecedor.ClassName; { bt_pesq_fornecedor: TSpeedButton; }
    ed_cod_fornecedor.ClassName; { ed_cod_fornecedor: TMaskEdit; }
    Panel6.ClassName; { Panel6: TPanel; }
    ed_nome_fantasia_fornecedor.ClassName; { ed_nome_fantasia_fornecedor: TMaskEdit; }
    pnTitulo.ClassName; { pnTitulo: TPanel; }
    lbTitulo.ClassName; { lbTitulo: TLabel; }
    btSelecionar.ClassName; { btSelecionar: TAdvGlassButton; }
    btSair.ClassName; { btSair: TAdvGlassButton; }
  end;

{ frmRelEntradasPorGrupo: TfrmRelEntradasPorGrupo }
  with TfrmRelEntradasPorGrupo(nil) do { uu_rel_compras_por_grupo.pas }
  begin
    SpeedButton1.ClassName; { SpeedButton1: TSpeedButton; }
    SpeedButton2.ClassName; { SpeedButton2: TSpeedButton; }
    SpeedButton3.ClassName; { SpeedButton3: TSpeedButton; }
    Edit2.ClassName; { Edit2: TEdit; }
    Edit3.ClassName; { Edit3: TEdit; }
    Edit4.ClassName; { Edit4: TEdit; }
    Panel1.ClassName; { Panel1: TPanel; }
    RadioGroup2.ClassName; { RadioGroup2: TRadioGroup; }
    Panel5.ClassName; { Panel5: TPanel; }
    Label3.ClassName; { Label3: TLabel; }
    Label4.ClassName; { Label4: TLabel; }
    cbk_visualizar.ClassName; { cbk_visualizar: TCheckBox; }
    edDe.ClassName; { edDe: TDateEdit; }
    edAte.ClassName; { edAte: TDateEdit; }
    Panel9.ClassName; { Panel9: TPanel; }
    Label9.ClassName; { Label9: TLabel; }
    bt_pesq_grupo.ClassName; { bt_pesq_grupo: TSpeedButton; }
    Label10.ClassName; { Label10: TLabel; }
    ed_cod_grupo.ClassName; { ed_cod_grupo: TMaskEdit; }
    Panel10.ClassName; { Panel10: TPanel; }
    ed_desc_grupo.ClassName; { ed_desc_grupo: TMaskEdit; }
    Panel2.ClassName; { Panel2: TPanel; }
    Label6.ClassName; { Label6: TLabel; }
    Label5.ClassName; { Label5: TLabel; }
    bt_pesq_fornecedor.ClassName; { bt_pesq_fornecedor: TSpeedButton; }
    ed_cod_fornecedor.ClassName; { ed_cod_fornecedor: TMaskEdit; }
    Panel6.ClassName; { Panel6: TPanel; }
    ed_nome_fantasia_fornecedor.ClassName; { ed_nome_fantasia_fornecedor: TMaskEdit; }
    Panel4.ClassName; { Panel4: TPanel; }
    BitBtn1.ClassName; { BitBtn1: TBitBtn; }
    BitBtn2.ClassName; { BitBtn2: TBitBtn; }
    gpOrdem.ClassName; { gpOrdem: TRadioGroup; }
  end;

{ frmRelEntradasPorItem: TfrmRelEntradasPorItem }
  with TfrmRelEntradasPorItem(nil) do { uu_rel_compras_por_Item.pas }
  begin
    SpeedButton1.ClassName; { SpeedButton1: TSpeedButton; }
    SpeedButton2.ClassName; { SpeedButton2: TSpeedButton; }
    SpeedButton3.ClassName; { SpeedButton3: TSpeedButton; }
    SpeedButton4.ClassName; { SpeedButton4: TSpeedButton; }
    Edit2.ClassName; { Edit2: TEdit; }
    Edit3.ClassName; { Edit3: TEdit; }
    Edit4.ClassName; { Edit4: TEdit; }
    Edit5.ClassName; { Edit5: TEdit; }
    Panel1.ClassName; { Panel1: TPanel; }
    RadioGroup2.ClassName; { RadioGroup2: TRadioGroup; }
    Panel5.ClassName; { Panel5: TPanel; }
    Label3.ClassName; { Label3: TLabel; }
    Label4.ClassName; { Label4: TLabel; }
    cbk_visualizar.ClassName; { cbk_visualizar: TCheckBox; }
    edDe.ClassName; { edDe: TDateEdit; }
    edAte.ClassName; { edAte: TDateEdit; }
    Panel9.ClassName; { Panel9: TPanel; }
    Label9.ClassName; { Label9: TLabel; }
    bt_pesq_item_estoque_cod.ClassName; { bt_pesq_item_estoque_cod: TSpeedButton; }
    Label10.ClassName; { Label10: TLabel; }
    ed_cod_item.ClassName; { ed_cod_item: TMaskEdit; }
    Panel10.ClassName; { Panel10: TPanel; }
    ed_desc_item.ClassName; { ed_desc_item: TMaskEdit; }
    Panel2.ClassName; { Panel2: TPanel; }
    Label6.ClassName; { Label6: TLabel; }
    Label5.ClassName; { Label5: TLabel; }
    bt_pesq_fornecedor.ClassName; { bt_pesq_fornecedor: TSpeedButton; }
    ed_cod_fornecedor.ClassName; { ed_cod_fornecedor: TMaskEdit; }
    Panel6.ClassName; { Panel6: TPanel; }
    ed_nome_fantasia_fornecedor.ClassName; { ed_nome_fantasia_fornecedor: TMaskEdit; }
    Panel4.ClassName; { Panel4: TPanel; }
    BitBtn1.ClassName; { BitBtn1: TBitBtn; }
    BitBtn2.ClassName; { BitBtn2: TBitBtn; }
  end;

{ frmRelatorioCaixa: TfrmRelatorioCaixa }
  with TfrmRelatorioCaixa(nil) do { uuRelatorioCaixa.pas }
  begin
    botao_pesquisa.ClassName; { botao_pesquisa: TSpeedButton; }
    SpeedButton1.ClassName; { SpeedButton1: TSpeedButton; }
    SpeedButton2.ClassName; { SpeedButton2: TSpeedButton; }
    Edit1.ClassName; { Edit1: TEdit; }
    Edit2.ClassName; { Edit2: TEdit; }
    Edit3.ClassName; { Edit3: TEdit; }
    Panel4.ClassName; { Panel4: TPanel; }
    BitBtn1.ClassName; { BitBtn1: TBitBtn; }
    BitBtn2.ClassName; { BitBtn2: TBitBtn; }
    Panel1.ClassName; { Panel1: TPanel; }
    Panel3.ClassName; { Panel3: TPanel; }
    lbCaixasEncontrados.ClassName; { lbCaixasEncontrados: TLabel; }
    DBGrid1.ClassName; { DBGrid1: TDBGrid; }
    Panel6.ClassName; { Panel6: TPanel; }
    RadioGroup2.ClassName; { RadioGroup2: TRadioGroup; }
    Panel5.ClassName; { Panel5: TPanel; }
    Label3.ClassName; { Label3: TLabel; }
    cbk_visualizar.ClassName; { cbk_visualizar: TCheckBox; }
    edData.ClassName; { edData: TDateEdit; }
    BitBtn3.ClassName; { BitBtn3: TBitBtn; }
    DBCheckBox1.ClassName; { DBCheckBox1: TDBCheckBox; }
    Panel2.ClassName; { Panel2: TPanel; }
    Label2.ClassName; { Label2: TLabel; }
    ckbMiniPrinter.ClassName; { ckbMiniPrinter: TCheckBox; }
    gpOrdemDetalhamento.ClassName; { gpOrdemDetalhamento: TRadioGroup; }
    Panel7.ClassName; { Panel7: TPanel; }
    rdRelatorioCaixa.ClassName; { rdRelatorioCaixa: TRadioGroup; }
  end;

{ frmCsCFOP: TfrmCsCFOP }
  with TfrmCsCFOP(nil) do { uuCsCFOP.pas }
  begin
    Panel3.ClassName; { Panel3: TPanel; }
    Label1.ClassName; { Label1: TLabel; }
    ed_parametro.ClassName; { ed_parametro: TEdit; }
    RadioGroup1.ClassName; { RadioGroup1: TRadioGroup; }
    Panel1.ClassName; { Panel1: TPanel; }
    DBGrid1.ClassName; { DBGrid1: TDBGrid; }
    Panel2.ClassName; { Panel2: TPanel; }
    bt_selecionar.ClassName; { bt_selecionar: TBitBtn; }
    bt_cancelar.ClassName; { bt_cancelar: TBitBtn; }
  end;

{ frmCsModeloNotaFiscal: TfrmCsModeloNotaFiscal }
  with TfrmCsModeloNotaFiscal(nil) do { uuCsModeloNotaFiscal.pas }
  begin
    Panel3.ClassName; { Panel3: TPanel; }
    Label1.ClassName; { Label1: TLabel; }
    Label2.ClassName; { Label2: TLabel; }
    ed_parametro.ClassName; { ed_parametro: TEdit; }
    RadioGroup1.ClassName; { RadioGroup1: TRadioGroup; }
    Panel1.ClassName; { Panel1: TPanel; }
    DBGrid1.ClassName; { DBGrid1: TDBGrid; }
    Panel2.ClassName; { Panel2: TPanel; }
    bt_selecionar.ClassName; { bt_selecionar: TBitBtn; }
    bt_cancelar.ClassName; { bt_cancelar: TBitBtn; }
  end;

{ frmCsCST: TfrmCsCST }
  with TfrmCsCST(nil) do { uuCsCST.pas }
  begin
    Panel3.ClassName; { Panel3: TPanel; }
    Label1.ClassName; { Label1: TLabel; }
    Label2.ClassName; { Label2: TLabel; }
    ed_parametro.ClassName; { ed_parametro: TEdit; }
    RadioGroup1.ClassName; { RadioGroup1: TRadioGroup; }
    Panel1.ClassName; { Panel1: TPanel; }
    DBGrid1.ClassName; { DBGrid1: TDBGrid; }
    Panel2.ClassName; { Panel2: TPanel; }
    bt_selecionar.ClassName; { bt_selecionar: TBitBtn; }
    bt_cancelar.ClassName; { bt_cancelar: TBitBtn; }
  end;

{ frmRelProducaoGarcons: TfrmRelProducaoGarcons }
  with TfrmRelProducaoGarcons(nil) do { uu_rel_producao_Garcons.pas }
  begin
    frm_modelo_rel_datas.ClassName; { frm_modelo_rel_datas: TPanel; }
    RadioGroup1.ClassName; { RadioGroup1: TRadioGroup; }
    Panel5.ClassName; { Panel5: TPanel; }
    Panel2.ClassName; { Panel2: TPanel; }
    bt_imprimir.ClassName; { bt_imprimir: TBitBtn; }
    bt_sair.ClassName; { bt_sair: TBitBtn; }
    ckbComissionado.ClassName; { ckbComissionado: TCheckBox; }
    RadioGroup3.ClassName; { RadioGroup3: TRadioGroup; }
    Panel4.ClassName; { Panel4: TPanel; }
    Label3.ClassName; { Label3: TLabel; }
    bt_pesq_garcon.ClassName; { bt_pesq_garcon: TSpeedButton; }
    Label4.ClassName; { Label4: TLabel; }
    Panel6.ClassName; { Panel6: TPanel; }
    ed_nome_garcon.ClassName; { ed_nome_garcon: TEdit; }
    ed_cod_garcon.ClassName; { ed_cod_garcon: TEdit; }
    RadioGroup2.ClassName; { RadioGroup2: TRadioGroup; }
    Panel3.ClassName; { Panel3: TPanel; }
    Label15.ClassName; { Label15: TLabel; }
    bt_pesq_grupo.ClassName; { bt_pesq_grupo: TSpeedButton; }
    Label16.ClassName; { Label16: TLabel; }
    Panel1.ClassName; { Panel1: TPanel; }
    ed_desc_grupo.ClassName; { ed_desc_grupo: TEdit; }
    ed_cod_grupo.ClassName; { ed_cod_grupo: TEdit; }
    Panel7.ClassName; { Panel7: TPanel; }
    Label5.ClassName; { Label5: TLabel; }
    Label6.ClassName; { Label6: TLabel; }
  end;

{ frmRelatorioFaturamentoDiarioPeriodoAnalitico: TfrmRelatorioFaturamentoDiarioPeriodoAnalitico }
  with TfrmRelatorioFaturamentoDiarioPeriodoAnalitico(nil) do { uuRelFaturamento.pas }
  begin
    botao_pesquisa.ClassName; { botao_pesquisa: TSpeedButton; }
    SpeedButton1.ClassName; { SpeedButton1: TSpeedButton; }
    SpeedButton2.ClassName; { SpeedButton2: TSpeedButton; }
    SpeedButton3.ClassName; { SpeedButton3: TSpeedButton; }
    Edit1.ClassName; { Edit1: TEdit; }
    Edit2.ClassName; { Edit2: TEdit; }
    Edit3.ClassName; { Edit3: TEdit; }
    Edit4.ClassName; { Edit4: TEdit; }
    Panel1.ClassName; { Panel1: TPanel; }
    Panel2.ClassName; { Panel2: TPanel; }
    GroupBox1.ClassName; { GroupBox1: TGroupBox; }
    cbFormasPagamento.ClassName; { cbFormasPagamento: TcxCheckComboBox; }
    GroupBox3.ClassName; { GroupBox3: TGroupBox; }
    ckbTodos.ClassName; { ckbTodos: TCheckBox; }
    ckbECF.ClassName; { ckbECF: TCheckBox; }
    ckbNFCE.ClassName; { ckbNFCE: TCheckBox; }
    ckbNFE.ClassName; { ckbNFE: TCheckBox; }
    ckbSAT.ClassName; { ckbSAT: TCheckBox; }
    ckbAvulso.ClassName; { ckbAvulso: TCheckBox; }
    rdgTipoVenda.ClassName; { rdgTipoVenda: TRadioGroup; }
    GroupBox2.ClassName; { GroupBox2: TGroupBox; }
    cbEmpresas.ClassName; { cbEmpresas: TcxCheckComboBox; }
    RadioGroup1.ClassName; { RadioGroup1: TRadioGroup; }
    Panel3.ClassName; { Panel3: TPanel; }
    Label2.ClassName; { Label2: TLabel; }
    Label1.ClassName; { Label1: TLabel; }
    ed_data_inicial.ClassName; { ed_data_inicial: TAdvDateTimePicker; }
    ed_data_final.ClassName; { ed_data_final: TAdvDateTimePicker; }
    rdTipoRelatorio.ClassName; { rdTipoRelatorio: TRadioGroup; }
    pnTitulo.ClassName; { pnTitulo: TPanel; }
    lbTitulo.ClassName; { lbTitulo: TLabel; }
    btSair.ClassName; { btSair: TAdvGlassButton; }
    btSelecionar.ClassName; { btSelecionar: TAdvGlassButton; }
    cliques.ClassName; { cliques: TActionList; }
  end;

{ frmCsBairros: TfrmCsBairros }
  with TfrmCsBairros(nil) do { uuCsBairros.pas }
  begin
    Panel3.ClassName; { Panel3: TPanel; }
    Label1.ClassName; { Label1: TLabel; }
    ed_parametro.ClassName; { ed_parametro: TEdit; }
    RadioGroup1.ClassName; { RadioGroup1: TRadioGroup; }
    Panel1.ClassName; { Panel1: TPanel; }
    DBGrid1.ClassName; { DBGrid1: TDBGrid; }
    Panel2.ClassName; { Panel2: TPanel; }
    bt_selecionar.ClassName; { bt_selecionar: TBitBtn; }
    bt_cancelar.ClassName; { bt_cancelar: TBitBtn; }
  end;

{ frmSelecaoSaboresPizza: TfrmSelecaoSaboresPizza }
  with TfrmSelecaoSaboresPizza(nil) do { uuSelecaoSaboresPizza.pas }
  begin
    botao_pesquisa.ClassName; { botao_pesquisa: TSpeedButton; }
    SpeedButton38.ClassName; { SpeedButton38: TSpeedButton; }
    SpeedButton37.ClassName; { SpeedButton37: TSpeedButton; }
    Edit1.ClassName; { Edit1: TEdit; }
    BitBtn3.ClassName; { BitBtn3: TBitBtn; }
    pnTeclado.ClassName; { pnTeclado: TPanel; }
    btFecharTeclado.ClassName; { btFecharTeclado: TSpeedButton; }
    AdvTouchKeyboard1.ClassName; { AdvTouchKeyboard1: TAdvTouchKeyboard; }
    pgProdutos.ClassName; { pgProdutos: TJvPageControl; }
    TabSheet1.ClassName; { TabSheet1: TTabSheet; }
    JvImgBtn1.ClassName; { JvImgBtn1: TJvImgBtn; }
    JvImgBtn6.ClassName; { JvImgBtn6: TJvImgBtn; }
    JvImgBtn11.ClassName; { JvImgBtn11: TJvImgBtn; }
    JvImgBtn16.ClassName; { JvImgBtn16: TJvImgBtn; }
    JvImgBtn21.ClassName; { JvImgBtn21: TJvImgBtn; }
    JvImgBtn26.ClassName; { JvImgBtn26: TJvImgBtn; }
    JvImgBtn31.ClassName; { JvImgBtn31: TJvImgBtn; }
    JvImgBtn36.ClassName; { JvImgBtn36: TJvImgBtn; }
    JvImgBtn59.ClassName; { JvImgBtn59: TJvImgBtn; }
    JvImgBtn2.ClassName; { JvImgBtn2: TJvImgBtn; }
    JvImgBtn7.ClassName; { JvImgBtn7: TJvImgBtn; }
    JvImgBtn12.ClassName; { JvImgBtn12: TJvImgBtn; }
    JvImgBtn17.ClassName; { JvImgBtn17: TJvImgBtn; }
    JvImgBtn22.ClassName; { JvImgBtn22: TJvImgBtn; }
    JvImgBtn27.ClassName; { JvImgBtn27: TJvImgBtn; }
    JvImgBtn32.ClassName; { JvImgBtn32: TJvImgBtn; }
    JvImgBtn55.ClassName; { JvImgBtn55: TJvImgBtn; }
    JvImgBtn60.ClassName; { JvImgBtn60: TJvImgBtn; }
    JvImgBtn3.ClassName; { JvImgBtn3: TJvImgBtn; }
    JvImgBtn8.ClassName; { JvImgBtn8: TJvImgBtn; }
    JvImgBtn13.ClassName; { JvImgBtn13: TJvImgBtn; }
    JvImgBtn18.ClassName; { JvImgBtn18: TJvImgBtn; }
    JvImgBtn23.ClassName; { JvImgBtn23: TJvImgBtn; }
    JvImgBtn28.ClassName; { JvImgBtn28: TJvImgBtn; }
    JvImgBtn33.ClassName; { JvImgBtn33: TJvImgBtn; }
    JvImgBtn56.ClassName; { JvImgBtn56: TJvImgBtn; }
    JvImgBtn61.ClassName; { JvImgBtn61: TJvImgBtn; }
    JvImgBtn4.ClassName; { JvImgBtn4: TJvImgBtn; }
    JvImgBtn9.ClassName; { JvImgBtn9: TJvImgBtn; }
    JvImgBtn14.ClassName; { JvImgBtn14: TJvImgBtn; }
    JvImgBtn19.ClassName; { JvImgBtn19: TJvImgBtn; }
    JvImgBtn24.ClassName; { JvImgBtn24: TJvImgBtn; }
    JvImgBtn29.ClassName; { JvImgBtn29: TJvImgBtn; }
    JvImgBtn34.ClassName; { JvImgBtn34: TJvImgBtn; }
    JvImgBtn57.ClassName; { JvImgBtn57: TJvImgBtn; }
    JvImgBtn62.ClassName; { JvImgBtn62: TJvImgBtn; }
    JvImgBtn5.ClassName; { JvImgBtn5: TJvImgBtn; }
    JvImgBtn10.ClassName; { JvImgBtn10: TJvImgBtn; }
    JvImgBtn15.ClassName; { JvImgBtn15: TJvImgBtn; }
    JvImgBtn20.ClassName; { JvImgBtn20: TJvImgBtn; }
    JvImgBtn25.ClassName; { JvImgBtn25: TJvImgBtn; }
    JvImgBtn30.ClassName; { JvImgBtn30: TJvImgBtn; }
    JvImgBtn35.ClassName; { JvImgBtn35: TJvImgBtn; }
    JvImgBtn58.ClassName; { JvImgBtn58: TJvImgBtn; }
    JvImgBtn63.ClassName; { JvImgBtn63: TJvImgBtn; }
    TabSheet2.ClassName; { TabSheet2: TTabSheet; }
    JvImgBtn37.ClassName; { JvImgBtn37: TJvImgBtn; }
    JvImgBtn38.ClassName; { JvImgBtn38: TJvImgBtn; }
    JvImgBtn39.ClassName; { JvImgBtn39: TJvImgBtn; }
    JvImgBtn40.ClassName; { JvImgBtn40: TJvImgBtn; }
    JvImgBtn41.ClassName; { JvImgBtn41: TJvImgBtn; }
    JvImgBtn42.ClassName; { JvImgBtn42: TJvImgBtn; }
    JvImgBtn43.ClassName; { JvImgBtn43: TJvImgBtn; }
    JvImgBtn44.ClassName; { JvImgBtn44: TJvImgBtn; }
    JvImgBtn45.ClassName; { JvImgBtn45: TJvImgBtn; }
    JvImgBtn46.ClassName; { JvImgBtn46: TJvImgBtn; }
    JvImgBtn47.ClassName; { JvImgBtn47: TJvImgBtn; }
    JvImgBtn48.ClassName; { JvImgBtn48: TJvImgBtn; }
    JvImgBtn49.ClassName; { JvImgBtn49: TJvImgBtn; }
    JvImgBtn50.ClassName; { JvImgBtn50: TJvImgBtn; }
    JvImgBtn51.ClassName; { JvImgBtn51: TJvImgBtn; }
    JvImgBtn52.ClassName; { JvImgBtn52: TJvImgBtn; }
    JvImgBtn53.ClassName; { JvImgBtn53: TJvImgBtn; }
    JvImgBtn54.ClassName; { JvImgBtn54: TJvImgBtn; }
    JvImgBtn64.ClassName; { JvImgBtn64: TJvImgBtn; }
    JvImgBtn65.ClassName; { JvImgBtn65: TJvImgBtn; }
    JvImgBtn66.ClassName; { JvImgBtn66: TJvImgBtn; }
    JvImgBtn67.ClassName; { JvImgBtn67: TJvImgBtn; }
    JvImgBtn68.ClassName; { JvImgBtn68: TJvImgBtn; }
    JvImgBtn69.ClassName; { JvImgBtn69: TJvImgBtn; }
    JvImgBtn70.ClassName; { JvImgBtn70: TJvImgBtn; }
    JvImgBtn71.ClassName; { JvImgBtn71: TJvImgBtn; }
    JvImgBtn72.ClassName; { JvImgBtn72: TJvImgBtn; }
    JvImgBtn73.ClassName; { JvImgBtn73: TJvImgBtn; }
    JvImgBtn74.ClassName; { JvImgBtn74: TJvImgBtn; }
    JvImgBtn75.ClassName; { JvImgBtn75: TJvImgBtn; }
    JvImgBtn76.ClassName; { JvImgBtn76: TJvImgBtn; }
    JvImgBtn77.ClassName; { JvImgBtn77: TJvImgBtn; }
    JvImgBtn78.ClassName; { JvImgBtn78: TJvImgBtn; }
    JvImgBtn79.ClassName; { JvImgBtn79: TJvImgBtn; }
    JvImgBtn80.ClassName; { JvImgBtn80: TJvImgBtn; }
    JvImgBtn81.ClassName; { JvImgBtn81: TJvImgBtn; }
    JvImgBtn82.ClassName; { JvImgBtn82: TJvImgBtn; }
    JvImgBtn83.ClassName; { JvImgBtn83: TJvImgBtn; }
    JvImgBtn84.ClassName; { JvImgBtn84: TJvImgBtn; }
    JvImgBtn85.ClassName; { JvImgBtn85: TJvImgBtn; }
    JvImgBtn86.ClassName; { JvImgBtn86: TJvImgBtn; }
    JvImgBtn87.ClassName; { JvImgBtn87: TJvImgBtn; }
    JvImgBtn88.ClassName; { JvImgBtn88: TJvImgBtn; }
    JvImgBtn89.ClassName; { JvImgBtn89: TJvImgBtn; }
    JvImgBtn90.ClassName; { JvImgBtn90: TJvImgBtn; }
    TabSheet3.ClassName; { TabSheet3: TTabSheet; }
    JvImgBtn91.ClassName; { JvImgBtn91: TJvImgBtn; }
    JvImgBtn92.ClassName; { JvImgBtn92: TJvImgBtn; }
    JvImgBtn93.ClassName; { JvImgBtn93: TJvImgBtn; }
    JvImgBtn94.ClassName; { JvImgBtn94: TJvImgBtn; }
    JvImgBtn95.ClassName; { JvImgBtn95: TJvImgBtn; }
    JvImgBtn96.ClassName; { JvImgBtn96: TJvImgBtn; }
    JvImgBtn97.ClassName; { JvImgBtn97: TJvImgBtn; }
    JvImgBtn98.ClassName; { JvImgBtn98: TJvImgBtn; }
    JvImgBtn99.ClassName; { JvImgBtn99: TJvImgBtn; }
    JvImgBtn100.ClassName; { JvImgBtn100: TJvImgBtn; }
    JvImgBtn101.ClassName; { JvImgBtn101: TJvImgBtn; }
    JvImgBtn102.ClassName; { JvImgBtn102: TJvImgBtn; }
    JvImgBtn103.ClassName; { JvImgBtn103: TJvImgBtn; }
    JvImgBtn104.ClassName; { JvImgBtn104: TJvImgBtn; }
    JvImgBtn105.ClassName; { JvImgBtn105: TJvImgBtn; }
    JvImgBtn106.ClassName; { JvImgBtn106: TJvImgBtn; }
    JvImgBtn107.ClassName; { JvImgBtn107: TJvImgBtn; }
    JvImgBtn108.ClassName; { JvImgBtn108: TJvImgBtn; }
    JvImgBtn109.ClassName; { JvImgBtn109: TJvImgBtn; }
    JvImgBtn110.ClassName; { JvImgBtn110: TJvImgBtn; }
    JvImgBtn111.ClassName; { JvImgBtn111: TJvImgBtn; }
    JvImgBtn112.ClassName; { JvImgBtn112: TJvImgBtn; }
    JvImgBtn113.ClassName; { JvImgBtn113: TJvImgBtn; }
    JvImgBtn114.ClassName; { JvImgBtn114: TJvImgBtn; }
    JvImgBtn115.ClassName; { JvImgBtn115: TJvImgBtn; }
    JvImgBtn116.ClassName; { JvImgBtn116: TJvImgBtn; }
    JvImgBtn117.ClassName; { JvImgBtn117: TJvImgBtn; }
    JvImgBtn118.ClassName; { JvImgBtn118: TJvImgBtn; }
    JvImgBtn119.ClassName; { JvImgBtn119: TJvImgBtn; }
    JvImgBtn120.ClassName; { JvImgBtn120: TJvImgBtn; }
    JvImgBtn121.ClassName; { JvImgBtn121: TJvImgBtn; }
    JvImgBtn122.ClassName; { JvImgBtn122: TJvImgBtn; }
    JvImgBtn123.ClassName; { JvImgBtn123: TJvImgBtn; }
    JvImgBtn124.ClassName; { JvImgBtn124: TJvImgBtn; }
    JvImgBtn125.ClassName; { JvImgBtn125: TJvImgBtn; }
    JvImgBtn126.ClassName; { JvImgBtn126: TJvImgBtn; }
    JvImgBtn127.ClassName; { JvImgBtn127: TJvImgBtn; }
    JvImgBtn128.ClassName; { JvImgBtn128: TJvImgBtn; }
    JvImgBtn129.ClassName; { JvImgBtn129: TJvImgBtn; }
    JvImgBtn130.ClassName; { JvImgBtn130: TJvImgBtn; }
    JvImgBtn131.ClassName; { JvImgBtn131: TJvImgBtn; }
    JvImgBtn132.ClassName; { JvImgBtn132: TJvImgBtn; }
    JvImgBtn133.ClassName; { JvImgBtn133: TJvImgBtn; }
    JvImgBtn134.ClassName; { JvImgBtn134: TJvImgBtn; }
    JvImgBtn135.ClassName; { JvImgBtn135: TJvImgBtn; }
    Panel2.ClassName; { Panel2: TPanel; }
    Label3.ClassName; { Label3: TLabel; }
    btOb1.ClassName; { btOb1: TJvImgBtn; }
    btOb2.ClassName; { btOb2: TJvImgBtn; }
    btOb3.ClassName; { btOb3: TJvImgBtn; }
    btOb4.ClassName; { btOb4: TJvImgBtn; }
    rdTipoMassa.ClassName; { rdTipoMassa: TRadioGroup; }
    BitBtn1.ClassName; { BitBtn1: TBitBtn; }
    memo_obs.ClassName; { memo_obs: TMemo; }
    BitBtn2.ClassName; { BitBtn2: TBitBtn; }
  end;

{ frmSelecaoTamanhoPizza: TfrmSelecaoTamanhoPizza }
  with TfrmSelecaoTamanhoPizza(nil) do { uuSelecaoTamanhoPizza.pas }
  begin
    botao_pesquisa.ClassName; { botao_pesquisa: TSpeedButton; }
    Edit1.ClassName; { Edit1: TEdit; }
    Panel4.ClassName; { Panel4: TPanel; }
    Panel1.ClassName; { Panel1: TPanel; }
    Image1.ClassName; { Image1: TImage; }
    Label1.ClassName; { Label1: TLabel; }
    Panel2.ClassName; { Panel2: TPanel; }
    Image2.ClassName; { Image2: TImage; }
    Label2.ClassName; { Label2: TLabel; }
    Panel3.ClassName; { Panel3: TPanel; }
    Image3.ClassName; { Image3: TImage; }
    Label3.ClassName; { Label3: TLabel; }
    Panel5.ClassName; { Panel5: TPanel; }
    Image5.ClassName; { Image5: TImage; }
    Label5.ClassName; { Label5: TLabel; }
    Panel6.ClassName; { Panel6: TPanel; }
    SpeedButton2.ClassName; { SpeedButton2: TSpeedButton; }
    Panel7.ClassName; { Panel7: TPanel; }
    Label6.ClassName; { Label6: TLabel; }
    pnTeclado.ClassName; { pnTeclado: TPanel; }
    btFecharTeclado.ClassName; { btFecharTeclado: TSpeedButton; }
    AdvTouchKeyboard1.ClassName; { AdvTouchKeyboard1: TAdvTouchKeyboard; }
  end;

{ frmDadosCartaoDeCredito: TfrmDadosCartaoDeCredito }
  with TfrmDadosCartaoDeCredito(nil) do { uuDadosCartaoCredito.pas }
  begin
    botao_pesquisa.ClassName; { botao_pesquisa: TSpeedButton; }
    Edit1.ClassName; { Edit1: TEdit; }
    Panel1.ClassName; { Panel1: TPanel; }
    BitBtn1.ClassName; { BitBtn1: TBitBtn; }
    BitBtn2.ClassName; { BitBtn2: TBitBtn; }
    Panel2.ClassName; { Panel2: TPanel; }
    Label1.ClassName; { Label1: TLabel; }
    Panel3.ClassName; { Panel3: TPanel; }
    Label2.ClassName; { Label2: TLabel; }
    Label3.ClassName; { Label3: TLabel; }
    Label4.ClassName; { Label4: TLabel; }
    Label5.ClassName; { Label5: TLabel; }
    edNumeroCartao.ClassName; { edNumeroCartao: TEdit; }
    edNomeOperadora.ClassName; { edNomeOperadora: TEdit; }
    edValidade.ClassName; { edValidade: TEdit; }
    edCodigoCartao.ClassName; { edCodigoCartao: TEdit; }
  end;

{ FrmGerarSpedFiscal: TFrmGerarSpedFiscal }
  with TFrmGerarSpedFiscal(nil) do { uuGerarSpedFiscal.pas }
  begin
    botao_pesquisa.ClassName; { botao_pesquisa: TSpeedButton; }
    Edit1.ClassName; { Edit1: TEdit; }
    pnTitulo.ClassName; { pnTitulo: TPanel; }
    lbTitulo.ClassName; { lbTitulo: TLabel; }
    pgList.ClassName; { pgList: TJvPageList; }
    pgPrincipal.ClassName; { pgPrincipal: TJvStandardPage; }
    Panel2.ClassName; { Panel2: TPanel; }
    lbl1.ClassName; { lbl1: TLabel; }
    GroupBox1.ClassName; { GroupBox1: TGroupBox; }
    Label1.ClassName; { Label1: TLabel; }
    Label2.ClassName; { Label2: TLabel; }
    cbMes.ClassName; { cbMes: TComboBox; }
    cbAno.ClassName; { cbAno: TComboBox; }
    cbVersaoArquivo.ClassName; { cbVersaoArquivo: TComboBox; }
    ckbGerarInventario.ClassName; { ckbGerarInventario: TCheckBox; }
    rdTipoGeracao.ClassName; { rdTipoGeracao: TRadioGroup; }
    ckb495.ClassName; { ckb495: TCheckBox; }
    edDataVencimento.ClassName; { edDataVencimento: TDateEdit; }
    ckbSintegra.ClassName; { ckbSintegra: TCheckBox; }
    edDataInicial.ClassName; { edDataInicial: TJvDateEdit; }
    edDataFinal.ClassName; { edDataFinal: TJvDateEdit; }
    Panel3.ClassName; { Panel3: TPanel; }
    AdvGlassButton1.ClassName; { AdvGlassButton1: TAdvGlassButton; }
    AdvGlassButton2.ClassName; { AdvGlassButton2: TAdvGlassButton; }
    pgAguarde.ClassName; { pgAguarde: TJvStandardPage; }
    Panel1.ClassName; { Panel1: TPanel; }
    lbAguarde.ClassName; { lbAguarde: TLabel; }
    Label3.ClassName; { Label3: TLabel; }
    pgArquivo.ClassName; { pgArquivo: TProgressBar; }
    sped.ClassName; { sped: TACBrSPEDFiscal; }
    sv.ClassName; { sv: TSaveDialog; }
    Timer1.ClassName; { Timer1: TTimer; }
    Timer2.ClassName; { Timer2: TTimer; }
    Timer3.ClassName; { Timer3: TTimer; }
    tmAguarde.ClassName; { tmAguarde: TTimer; }
    sintegra.ClassName; { sintegra: TACBrSintegra; }
    folderDialog.ClassName; { folderDialog: TJvBrowseForFolderDialog; }
  end;

{ frmCadEntregadores: TfrmCadEntregadores }
  with TfrmCadEntregadores(nil) do { uuCadEntregadores.pas }
  begin
    pn_principal.ClassName; { pn_principal: TPanel; }
    pn_codigo.ClassName; { pn_codigo: TPanel; }
    bt_pesquisa.ClassName; { bt_pesquisa: TSpeedButton; }
    ed_codigo.ClassName; { ed_codigo: TMaskEdit; }
    Panel1.ClassName; { Panel1: TPanel; }
    Label6.ClassName; { Label6: TLabel; }
    edNomeEntregador.ClassName; { edNomeEntregador: TDBEdit; }
    edValorDiaria.ClassName; { edValorDiaria: TDBEdit; }
    edPecPedido.ClassName; { edPecPedido: TDBEdit; }
    edComissaoPedido.ClassName; { edComissaoPedido: TDBEdit; }
    JvDBCheckBox1.ClassName; { JvDBCheckBox1: TJvDBCheckBox; }
    pn_botoes.ClassName; { pn_botoes: TPanel; }
    bt_novo.ClassName; { bt_novo: TBitBtn; }
    bt_alterar.ClassName; { bt_alterar: TBitBtn; }
    bt_gravar.ClassName; { bt_gravar: TBitBtn; }
    bt_cancelar.ClassName; { bt_cancelar: TBitBtn; }
    bt_sair.ClassName; { bt_sair: TBitBtn; }
    bt_excluir.ClassName; { bt_excluir: TBitBtn; }
    bt_consultar.ClassName; { bt_consultar: TBitBtn; }
    bt_imprimir.ClassName; { bt_imprimir: TBitBtn; }
  end;

{ frmCsEntregadores: TfrmCsEntregadores }
  with TfrmCsEntregadores(nil) do { uuCsEntregradores.pas }
  begin
    Panel3.ClassName; { Panel3: TPanel; }
    Label1.ClassName; { Label1: TLabel; }
    ed_parametro.ClassName; { ed_parametro: TEdit; }
    RadioGroup1.ClassName; { RadioGroup1: TRadioGroup; }
    Panel1.ClassName; { Panel1: TPanel; }
  end;

{ frmRelPedidosEntregador: TfrmRelPedidosEntregador }
  with TfrmRelPedidosEntregador(nil) do { uuRelPedidosPorEntregador.pas }
  begin
    botao_pesquisa.ClassName; { botao_pesquisa: TSpeedButton; }
    SpeedButton1.ClassName; { SpeedButton1: TSpeedButton; }
    SpeedButton2.ClassName; { SpeedButton2: TSpeedButton; }
    SpeedButton3.ClassName; { SpeedButton3: TSpeedButton; }
    SpeedButton4.ClassName; { SpeedButton4: TSpeedButton; }
    Edit1.ClassName; { Edit1: TEdit; }
    Edit2.ClassName; { Edit2: TEdit; }
    Edit3.ClassName; { Edit3: TEdit; }
    Edit4.ClassName; { Edit4: TEdit; }
    Edit5.ClassName; { Edit5: TEdit; }
    Panel4.ClassName; { Panel4: TPanel; }
    BitBtn1.ClassName; { BitBtn1: TBitBtn; }
    BitBtn2.ClassName; { BitBtn2: TBitBtn; }
    Panel1.ClassName; { Panel1: TPanel; }
    Panel6.ClassName; { Panel6: TPanel; }
    RadioGroup2.ClassName; { RadioGroup2: TRadioGroup; }
    Panel5.ClassName; { Panel5: TPanel; }
    Label3.ClassName; { Label3: TLabel; }
    cbk_visualizar.ClassName; { cbk_visualizar: TCheckBox; }
    edDataInicial.ClassName; { edDataInicial: TDateEdit; }
    Panel3.ClassName; { Panel3: TPanel; }
    Label1.ClassName; { Label1: TLabel; }
    CheckBox1.ClassName; { CheckBox1: TCheckBox; }
    edDataFinal.ClassName; { edDataFinal: TDateEdit; }
    Panel2.ClassName; { Panel2: TPanel; }
    Label48.ClassName; { Label48: TLabel; }
    bt_pesq_entregador.ClassName; { bt_pesq_entregador: TSpeedButton; }
    edCodEntregador.ClassName; { edCodEntregador: TEdit; }
    Panel7.ClassName; { Panel7: TPanel; }
    Label4.ClassName; { Label4: TLabel; }
    edNomeEntregador.ClassName; { edNomeEntregador: TEdit; }
    rdpAgrupar.ClassName; { rdpAgrupar: TRadioGroup; }
  end;

{ frmCadObsClienteDelivery: TfrmCadObsClienteDelivery }
  with TfrmCadObsClienteDelivery(nil) do { uuCadObservacaoClienteDelivery.pas }
  begin
    botao_pesquisa.ClassName; { botao_pesquisa: TSpeedButton; }
    Edit1.ClassName; { Edit1: TEdit; }
    Panel1.ClassName; { Panel1: TPanel; }
    BitBtn1.ClassName; { BitBtn1: TBitBtn; }
    BitBtn2.ClassName; { BitBtn2: TBitBtn; }
    Panel2.ClassName; { Panel2: TPanel; }
    Label1.ClassName; { Label1: TLabel; }
    memo_obs.ClassName; { memo_obs: TMemo; }
    ckbAlerta.ClassName; { ckbAlerta: TCheckBox; }
  end;

{ frmControleCartoes: TfrmControleCartoes }
  with TfrmControleCartoes(nil) do { uuControleCartoes.pas }
  begin
    botao_pesquisa.ClassName; { botao_pesquisa: TSpeedButton; }
    Edit1.ClassName; { Edit1: TEdit; }
    Panel1.ClassName; { Panel1: TPanel; }
    DBGrid1.ClassName; { DBGrid1: TDBGrid; }
    Panel3.ClassName; { Panel3: TPanel; }
    livre.ClassName; { livre: TImage; }
    Label3.ClassName; { Label3: TLabel; }
    bloqueado.ClassName; { bloqueado: TImage; }
    Label4.ClassName; { Label4: TLabel; }
    consumo.ClassName; { consumo: TImage; }
    Label5.ClassName; { Label5: TLabel; }
    pagou.ClassName; { pagou: TImage; }
    Label6.ClassName; { Label6: TLabel; }
    Panel2.ClassName; { Panel2: TPanel; }
    btBloqueia.ClassName; { btBloqueia: TBitBtn; }
    btLibera.ClassName; { btLibera: TBitBtn; }
    BitBtn1.ClassName; { BitBtn1: TBitBtn; }
    BitBtn2.ClassName; { BitBtn2: TBitBtn; }
    Panel5.ClassName; { Panel5: TPanel; }
    GroupBox1.ClassName; { GroupBox1: TGroupBox; }
    edDe.ClassName; { edDe: TEdit; }
    edAte.ClassName; { edAte: TEdit; }
    BitBtn4.ClassName; { BitBtn4: TBitBtn; }
    PopupMenu1.ClassName; { PopupMenu1: TPopupMenu; }
    Bloquearcarto1.ClassName; { Bloquearcarto1: TMenuItem; }
    Liberarcarto1.ClassName; { Liberarcarto1: TMenuItem; }
  end;

{ frmTransformacoesSubmateria: TfrmTransformacoesSubmateria }
  with TfrmTransformacoesSubmateria(nil) do { uuTransformacaoSubmateria.pas }
  begin
    pn_principal.ClassName; { pn_principal: TPanel; }
    pn_codigo.ClassName; { pn_codigo: TPanel; }
    bt_pesquisa.ClassName; { bt_pesquisa: TSpeedButton; }
    Label1.ClassName; { Label1: TLabel; }
    Label4.ClassName; { Label4: TLabel; }
    ed_codigo.ClassName; { ed_codigo: TMaskEdit; }
    pnItem.ClassName; { pnItem: TPanel; }
    btPesqSubmateria.ClassName; { btPesqSubmateria: TSpeedButton; }
    Label22.ClassName; { Label22: TLabel; }
    Label2.ClassName; { Label2: TLabel; }
    Panel7.ClassName; { Panel7: TPanel; }
    Label21.ClassName; { Label21: TLabel; }
    Label3.ClassName; { Label3: TLabel; }
    Label6.ClassName; { Label6: TLabel; }
    edDescricaoSubmateria.ClassName; { edDescricaoSubmateria: TEdit; }
    Edit1.ClassName; { Edit1: TEdit; }
    Edit2.ClassName; { Edit2: TEdit; }
    edCodSubmateria.ClassName; { edCodSubmateria: TEdit; }
    btAtualizar.ClassName; { btAtualizar: TBitBtn; }
    edQuantidade.ClassName; { edQuantidade: TCurrencyEdit; }
    Panel4.ClassName; { Panel4: TPanel; }
    Panel1.ClassName; { Panel1: TPanel; }
    pn_botoes.ClassName; { pn_botoes: TPanel; }
    bt_novo.ClassName; { bt_novo: TBitBtn; }
    bt_alterar.ClassName; { bt_alterar: TBitBtn; }
    bt_gravar.ClassName; { bt_gravar: TBitBtn; }
    bt_cancelar.ClassName; { bt_cancelar: TBitBtn; }
    bt_sair.ClassName; { bt_sair: TBitBtn; }
    bt_excluir.ClassName; { bt_excluir: TBitBtn; }
    bt_consultar.ClassName; { bt_consultar: TBitBtn; }
    bt_imprimir.ClassName; { bt_imprimir: TBitBtn; }
    FDMemTable1.ClassName; { FDMemTable1: TFDMemTable; }
  end;

{ frmCsSubMaterias: TfrmCsSubMaterias }
  with TfrmCsSubMaterias(nil) do { uucsSubmaterias.pas }
  begin
    Panel3.ClassName; { Panel3: TPanel; }
    Label1.ClassName; { Label1: TLabel; }
    ed_parametro.ClassName; { ed_parametro: TEdit; }
    RadioGroup1.ClassName; { RadioGroup1: TRadioGroup; }
    Panel1.ClassName; { Panel1: TPanel; }
    DBGrid1.ClassName; { DBGrid1: TDBGrid; }
    Panel2.ClassName; { Panel2: TPanel; }
    bt_selecionar.ClassName; { bt_selecionar: TBitBtn; }
    bt_cancelar.ClassName; { bt_cancelar: TBitBtn; }
    Panel4.ClassName; { Panel4: TPanel; }
    lbTitulo.ClassName; { lbTitulo: TLabel; }
  end;

{ frmRelatorioclientesData: TfrmRelatorioclientesData }
  with TfrmRelatorioclientesData(nil) do { uuRelClientesBoateData.pas }
  begin
    botao_pesquisa.ClassName; { botao_pesquisa: TSpeedButton; }
    Edit1.ClassName; { Edit1: TEdit; }
    Panel1.ClassName; { Panel1: TPanel; }
    BitBtn1.ClassName; { BitBtn1: TBitBtn; }
    BitBtn2.ClassName; { BitBtn2: TBitBtn; }
    Panel2.ClassName; { Panel2: TPanel; }
    RadioGroup1.ClassName; { RadioGroup1: TRadioGroup; }
    Panel5.ClassName; { Panel5: TPanel; }
    Label3.ClassName; { Label3: TLabel; }
    Label4.ClassName; { Label4: TLabel; }
    ed_data_inicial.ClassName; { ed_data_inicial: TMaskEdit; }
    ed_data_final.ClassName; { ed_data_final: TMaskEdit; }
    cbk_visualizar.ClassName; { cbk_visualizar: TCheckBox; }
    rdOrdenacao.ClassName; { rdOrdenacao: TRadioGroup; }
  end;

{ frmRelatorioBaixasManuais: TfrmRelatorioBaixasManuais }
  with TfrmRelatorioBaixasManuais(nil) do { uuRelatorioBaixasManuais.pas }
  begin
    botao_pesquisa.ClassName; { botao_pesquisa: TSpeedButton; }
    Edit1.ClassName; { Edit1: TEdit; }
    Panel10.ClassName; { Panel10: TPanel; }
    Label9.ClassName; { Label9: TLabel; }
    Panel4.ClassName; { Panel4: TPanel; }
    gdProdutosMovimentacao.ClassName; { gdProdutosMovimentacao: TcxGrid; }
    gdProdutosMovimentacaoDBTableView1.ClassName; { gdProdutosMovimentacaoDBTableView1: TcxGridDBTableView; }
    gdProdutosMovimentacaoDBTableView1DATA.ClassName; { gdProdutosMovimentacaoDBTableView1DATA: TcxGridDBColumn; }
    gdProdutosMovimentacaoDBTableView1COD_ITEM.ClassName; { gdProdutosMovimentacaoDBTableView1COD_ITEM: TcxGridDBColumn; }
    gdProdutosMovimentacaoDBTableView1DESCRICAO.ClassName; { gdProdutosMovimentacaoDBTableView1DESCRICAO: TcxGridDBColumn; }
    gdProdutosMovimentacaoDBTableView1OPERACAO.ClassName; { gdProdutosMovimentacaoDBTableView1OPERACAO: TcxGridDBColumn; }
    gdProdutosMovimentacaoDBTableView1QUANTIDADE.ClassName; { gdProdutosMovimentacaoDBTableView1QUANTIDADE: TcxGridDBColumn; }
    gdProdutosMovimentacaoDBTableView1CUSTO.ClassName; { gdProdutosMovimentacaoDBTableView1CUSTO: TcxGridDBColumn; }
    gdProdutosMovimentacaoDBTableView1UNIDADE.ClassName; { gdProdutosMovimentacaoDBTableView1UNIDADE: TcxGridDBColumn; }
    gdProdutosMovimentacaoDBTableView1TOTAL.ClassName; { gdProdutosMovimentacaoDBTableView1TOTAL: TcxGridDBColumn; }
    gdProdutosMovimentacaoDBTableView1DESCRICAOORIGEM.ClassName; { gdProdutosMovimentacaoDBTableView1DESCRICAOORIGEM: TcxGridDBColumn; }
    gdProdutosMovimentacaoDBTableView1DESCRICAOTIPO.ClassName; { gdProdutosMovimentacaoDBTableView1DESCRICAOTIPO: TcxGridDBColumn; }
    gdProdutosMovimentacaoDBTableView1HORA.ClassName; { gdProdutosMovimentacaoDBTableView1HORA: TcxGridDBColumn; }
    gdProdutosMovimentacaoDBTableView1USUARIO.ClassName; { gdProdutosMovimentacaoDBTableView1USUARIO: TcxGridDBColumn; }
    gdProdutosMovimentacaoDBTableView1OBSERVACOES.ClassName; { gdProdutosMovimentacaoDBTableView1OBSERVACOES: TcxGridDBColumn; }
    gdProdutosMovimentacaoDBTableView1DESCRICAOGRUPO.ClassName; { gdProdutosMovimentacaoDBTableView1DESCRICAOGRUPO: TcxGridDBColumn; }
    gdProdutosMovimentacaoDBTableView1ESTOQUE_ANTERIOR.ClassName; { gdProdutosMovimentacaoDBTableView1ESTOQUE_ANTERIOR: TcxGridDBColumn; }
    gdProdutosMovimentacaoDBTableView1ESTOQUE_ATUALIZADO.ClassName; { gdProdutosMovimentacaoDBTableView1ESTOQUE_ATUALIZADO: TcxGridDBColumn; }
    gdProdutosMovimentacaoLevel1.ClassName; { gdProdutosMovimentacaoLevel1: TcxGridLevel; }
    Panel2.ClassName; { Panel2: TPanel; }
    btSair.ClassName; { btSair: TAdvGlassButton; }
    btSelecionar.ClassName; { btSelecionar: TAdvGlassButton; }
    Panel1.ClassName; { Panel1: TPanel; }
    btPesquisar.ClassName; { btPesquisar: TPngSpeedButton; }
    RadioGroup2.ClassName; { RadioGroup2: TRadioGroup; }
    Panel5.ClassName; { Panel5: TPanel; }
    Label3.ClassName; { Label3: TLabel; }
    Label4.ClassName; { Label4: TLabel; }
    cbk_visualizar.ClassName; { cbk_visualizar: TCheckBox; }
    edDataInicio.ClassName; { edDataInicio: TDateEdit; }
    edDataFim.ClassName; { edDataFim: TDateEdit; }
    edHoraIni.ClassName; { edHoraIni: TJvTimeEdit; }
    edHoraFim.ClassName; { edHoraFim: TJvTimeEdit; }
    Panel3.ClassName; { Panel3: TPanel; }
    Label1.ClassName; { Label1: TLabel; }
    Label2.ClassName; { Label2: TLabel; }
    bt_pesq_grupo.ClassName; { bt_pesq_grupo: TSpeedButton; }
    ed_cod_grupo.ClassName; { ed_cod_grupo: TMaskEdit; }
    Panel7.ClassName; { Panel7: TPanel; }
    ed_desc_grupo.ClassName; { ed_desc_grupo: TMaskEdit; }
    cliques.ClassName; { cliques: TActionList; }
    actlBusca.ClassName; { actlBusca: TJvControlActionList; }
    dxComponentPrinter1.ClassName; { dxComponentPrinter1: TdxComponentPrinter; }
    dxComponentPrinter1Link1.ClassName; { dxComponentPrinter1Link1: TdxGridReportLink; }
    cxStyleRepository1.ClassName; { cxStyleRepository1: TcxStyleRepository; }
    cxStyle1.ClassName; { cxStyle1: TcxStyle; }
    cxStyle2.ClassName; { cxStyle2: TcxStyle; }
    cxStyleRepository2.ClassName; { cxStyleRepository2: TcxStyleRepository; }
    cxStyle3.ClassName; { cxStyle3: TcxStyle; }
  end;

{ frmRelatorioEstoqueReposicao: TfrmRelatorioEstoqueReposicao }
  with TfrmRelatorioEstoqueReposicao(nil) do { uuRelatorioEstoqueReposicao.pas }
  begin
    botao_pesquisa.ClassName; { botao_pesquisa: TSpeedButton; }
    SpeedButton1.ClassName; { SpeedButton1: TSpeedButton; }
    SpeedButton2.ClassName; { SpeedButton2: TSpeedButton; }
    Edit1.ClassName; { Edit1: TEdit; }
    Edit2.ClassName; { Edit2: TEdit; }
    Edit3.ClassName; { Edit3: TEdit; }
    Panel4.ClassName; { Panel4: TPanel; }
    BitBtn1.ClassName; { BitBtn1: TBitBtn; }
    BitBtn2.ClassName; { BitBtn2: TBitBtn; }
    Panel1.ClassName; { Panel1: TPanel; }
    ckAgrupar.ClassName; { ckAgrupar: TCheckBox; }
    gpOrdem.ClassName; { gpOrdem: TRadioGroup; }
    pn_grupos.ClassName; { pn_grupos: TPanel; }
    Label1.ClassName; { Label1: TLabel; }
    Label2.ClassName; { Label2: TLabel; }
    bt_pesq_grupo.ClassName; { bt_pesq_grupo: TSpeedButton; }
    ed_cod_grupo.ClassName; { ed_cod_grupo: TMaskEdit; }
    Panel3.ClassName; { Panel3: TPanel; }
    ed_desc_grupo.ClassName; { ed_desc_grupo: TMaskEdit; }
  end;

{ frmCadSaboresPizza: TfrmCadSaboresPizza }
  with TfrmCadSaboresPizza(nil) do { uuCadSaboresPizza.pas }
  begin
    pn_principal.ClassName; { pn_principal: TPanel; }
    pn_codigo.ClassName; { pn_codigo: TPanel; }
    bt_pesquisa.ClassName; { bt_pesquisa: TSpeedButton; }
    Label12.ClassName; { Label12: TLabel; }
    ed_codigo.ClassName; { ed_codigo: TMaskEdit; }
    pnCampos.ClassName; { pnCampos: TPanel; }
    Label1.ClassName; { Label1: TLabel; }
    RadioGroup2.ClassName; { RadioGroup2: TRadioGroup; }
    RadioGroup1.ClassName; { RadioGroup1: TRadioGroup; }
    edDescSaborPizza.ClassName; { edDescSaborPizza: TDBEdit; }
    Panel2.ClassName; { Panel2: TPanel; }
    Label2.ClassName; { Label2: TLabel; }
    Label3.ClassName; { Label3: TLabel; }
    Label4.ClassName; { Label4: TLabel; }
    Label5.ClassName; { Label5: TLabel; }
    Label6.ClassName; { Label6: TLabel; }
    Label13.ClassName; { Label13: TLabel; }
    Label14.ClassName; { Label14: TLabel; }
    btPesqCodPizzaBbro.ClassName; { btPesqCodPizzaBbro: TSpeedButton; }
    btPesqCodPizzaBpeq.ClassName; { btPesqCodPizzaBpeq: TSpeedButton; }
    btPesqCodPizzaBmed.ClassName; { btPesqCodPizzaBmed: TSpeedButton; }
    btPesqCodPizzaBgde.ClassName; { btPesqCodPizzaBgde: TSpeedButton; }
    btPesqCodPizzaBfam.ClassName; { btPesqCodPizzaBfam: TSpeedButton; }
    Label17.ClassName; { Label17: TLabel; }
    Panel1.ClassName; { Panel1: TPanel; }
    edDescPizzaBbro.ClassName; { edDescPizzaBbro: TDBEdit; }
    edDescPizzaBpeq.ClassName; { edDescPizzaBpeq: TDBEdit; }
    edDescPizzaBmed.ClassName; { edDescPizzaBmed: TDBEdit; }
    edDescPizzaBgde.ClassName; { edDescPizzaBgde: TDBEdit; }
    edDescPizzaBfam.ClassName; { edDescPizzaBfam: TDBEdit; }
    edCodPizzaBbro.ClassName; { edCodPizzaBbro: TDBEdit; }
    edPrecoPizzaBbro.ClassName; { edPrecoPizzaBbro: TDBEdit; }
    edCodPizzaBpeq.ClassName; { edCodPizzaBpeq: TDBEdit; }
    edPrecoPizzaBpeq.ClassName; { edPrecoPizzaBpeq: TDBEdit; }
    edCodPizzaBmed.ClassName; { edCodPizzaBmed: TDBEdit; }
    edPrecoPizzaBmed.ClassName; { edPrecoPizzaBmed: TDBEdit; }
    edCodPizzaBgde.ClassName; { edCodPizzaBgde: TDBEdit; }
    edPrecoPizzaBgde.ClassName; { edPrecoPizzaBgde: TDBEdit; }
    edCodPizzaBfam.ClassName; { edCodPizzaBfam: TDBEdit; }
    edPrecoPizzaBfam.ClassName; { edPrecoPizzaBfam: TDBEdit; }
    Panel3.ClassName; { Panel3: TPanel; }
    Label7.ClassName; { Label7: TLabel; }
    Label8.ClassName; { Label8: TLabel; }
    Label9.ClassName; { Label9: TLabel; }
    Label10.ClassName; { Label10: TLabel; }
    Label11.ClassName; { Label11: TLabel; }
    Label15.ClassName; { Label15: TLabel; }
    btPesqCodPizzaDbro.ClassName; { btPesqCodPizzaDbro: TSpeedButton; }
    btPesqCodPizzaDpeq.ClassName; { btPesqCodPizzaDpeq: TSpeedButton; }
    btPesqCodPizzaDmed.ClassName; { btPesqCodPizzaDmed: TSpeedButton; }
    btPesqCodPizzaDgde.ClassName; { btPesqCodPizzaDgde: TSpeedButton; }
    btPesqCodPizzaDfam.ClassName; { btPesqCodPizzaDfam: TSpeedButton; }
    Label18.ClassName; { Label18: TLabel; }
    Label16.ClassName; { Label16: TLabel; }
    Panel4.ClassName; { Panel4: TPanel; }
    edDescPizzaDbro.ClassName; { edDescPizzaDbro: TDBEdit; }
    edDescPizzaDpeq.ClassName; { edDescPizzaDpeq: TDBEdit; }
    edDescPizzaDmed.ClassName; { edDescPizzaDmed: TDBEdit; }
    edDescPizzaDgde.ClassName; { edDescPizzaDgde: TDBEdit; }
    edDescPizzaDfam.ClassName; { edDescPizzaDfam: TDBEdit; }
    edCodPizzaDbro.ClassName; { edCodPizzaDbro: TDBEdit; }
    edPrecoPizzaDbro.ClassName; { edPrecoPizzaDbro: TDBEdit; }
    edCodPizzaDpeq.ClassName; { edCodPizzaDpeq: TDBEdit; }
    edPrecoPizzaDpeq.ClassName; { edPrecoPizzaDpeq: TDBEdit; }
    edCodPizzaDmed.ClassName; { edCodPizzaDmed: TDBEdit; }
    edPrecoPizzaDmed.ClassName; { edPrecoPizzaDmed: TDBEdit; }
    edCodPizzaDgde.ClassName; { edCodPizzaDgde: TDBEdit; }
    edPrecoPizzaDgde.ClassName; { edPrecoPizzaDgde: TDBEdit; }
    edCodPizzaDfam.ClassName; { edCodPizzaDfam: TDBEdit; }
    edPrecoPizzaDfam.ClassName; { edPrecoPizzaDfam: TDBEdit; }
    ckbReajustaPreco.ClassName; { ckbReajustaPreco: TCheckBox; }
    Panel5.ClassName; { Panel5: TPanel; }
    Label19.ClassName; { Label19: TLabel; }
    pn_botoes.ClassName; { pn_botoes: TPanel; }
    bt_novo.ClassName; { bt_novo: TBitBtn; }
    bt_alterar.ClassName; { bt_alterar: TBitBtn; }
    bt_gravar.ClassName; { bt_gravar: TBitBtn; }
    bt_cancelar.ClassName; { bt_cancelar: TBitBtn; }
    bt_sair.ClassName; { bt_sair: TBitBtn; }
    bt_excluir.ClassName; { bt_excluir: TBitBtn; }
    bt_consultar.ClassName; { bt_consultar: TBitBtn; }
    bt_imprimir.ClassName; { bt_imprimir: TBitBtn; }
  end;

{ frmCsSaboresPizza: TfrmCsSaboresPizza }
  with TfrmCsSaboresPizza(nil) do { uucsSaboresPizza.pas }
  begin
    Panel3.ClassName; { Panel3: TPanel; }
    Label1.ClassName; { Label1: TLabel; }
    ed_parametro.ClassName; { ed_parametro: TEdit; }
    RadioGroup1.ClassName; { RadioGroup1: TRadioGroup; }
    Panel1.ClassName; { Panel1: TPanel; }
    DBGrid1.ClassName; { DBGrid1: TDBGrid; }
    Panel2.ClassName; { Panel2: TPanel; }
    bt_selecionar.ClassName; { bt_selecionar: TBitBtn; }
    bt_cancelar.ClassName; { bt_cancelar: TBitBtn; }
  end;

{ frmPesqTipoItemSPED: TfrmPesqTipoItemSPED }
  with TfrmPesqTipoItemSPED(nil) do { uuPesqTipoItemSped.pas }
  begin
    Panel3.ClassName; { Panel3: TPanel; }
    Label1.ClassName; { Label1: TLabel; }
    Label2.ClassName; { Label2: TLabel; }
    ed_parametro.ClassName; { ed_parametro: TEdit; }
    RadioGroup1.ClassName; { RadioGroup1: TRadioGroup; }
    Panel1.ClassName; { Panel1: TPanel; }
    DBGrid1.ClassName; { DBGrid1: TDBGrid; }
    Panel2.ClassName; { Panel2: TPanel; }
    bt_selecionar.ClassName; { bt_selecionar: TBitBtn; }
    bt_cancelar.ClassName; { bt_cancelar: TBitBtn; }
  end;

{ frmCsNCM: TfrmCsNCM }
  with TfrmCsNCM(nil) do { uuCsNCM.pas }
  begin
    Panel3.ClassName; { Panel3: TPanel; }
    Label1.ClassName; { Label1: TLabel; }
    ed_parametro.ClassName; { ed_parametro: TEdit; }
    RadioGroup1.ClassName; { RadioGroup1: TRadioGroup; }
    Panel1.ClassName; { Panel1: TPanel; }
    DBGrid1.ClassName; { DBGrid1: TDBGrid; }
    Panel2.ClassName; { Panel2: TPanel; }
    bt_selecionar.ClassName; { bt_selecionar: TBitBtn; }
    bt_cancelar.ClassName; { bt_cancelar: TBitBtn; }
  end;

{ frmCsGeneroItemSPED: TfrmCsGeneroItemSPED }
  with TfrmCsGeneroItemSPED(nil) do { uuCsGeneroItemSPED.pas }
  begin
    Panel3.ClassName; { Panel3: TPanel; }
    Label1.ClassName; { Label1: TLabel; }
    ed_parametro.ClassName; { ed_parametro: TEdit; }
    RadioGroup1.ClassName; { RadioGroup1: TRadioGroup; }
    Panel1.ClassName; { Panel1: TPanel; }
    DBGrid1.ClassName; { DBGrid1: TDBGrid; }
    Panel2.ClassName; { Panel2: TPanel; }
    bt_selecionar.ClassName; { bt_selecionar: TBitBtn; }
    bt_cancelar.ClassName; { bt_cancelar: TBitBtn; }
  end;

{ frmCsProdutosGeral: TfrmCsProdutosGeral }
  with TfrmCsProdutosGeral(nil) do { uuCsProdutosGeral.pas }
  begin
    Panel7.ClassName; { Panel7: TPanel; }
    lbTituloConsulta.ClassName; { lbTituloConsulta: TLabel; }
    Panel1.ClassName; { Panel1: TPanel; }
    Panel2.ClassName; { Panel2: TPanel; }
    Label1.ClassName; { Label1: TLabel; }
    edDescricaoProduto.ClassName; { edDescricaoProduto: TEdit; }
    Panel5.ClassName; { Panel5: TPanel; }
    cxGrid1.ClassName; { cxGrid1: TcxGrid; }
    cxGrid1DBTableView1.ClassName; { cxGrid1DBTableView1: TcxGridDBTableView; }
    cxGrid1DBTableView1COD_PRODUTO.ClassName; { cxGrid1DBTableView1COD_PRODUTO: TcxGridDBColumn; }
    cxGrid1DBTableView1DESCRICAO.ClassName; { cxGrid1DBTableView1DESCRICAO: TcxGridDBColumn; }
    cxGrid1DBTableView1Column4.ClassName; { cxGrid1DBTableView1Column4: TcxGridDBColumn; }
    cxGrid1DBTableView1Column1.ClassName; { cxGrid1DBTableView1Column1: TcxGridDBColumn; }
    cxGrid1DBTableView1Column2.ClassName; { cxGrid1DBTableView1Column2: TcxGridDBColumn; }
    cxGrid1DBTableView1Column3.ClassName; { cxGrid1DBTableView1Column3: TcxGridDBColumn; }
    cxGrid1Level1.ClassName; { cxGrid1Level1: TcxGridLevel; }
    Panel6.ClassName; { Panel6: TPanel; }
    btSair.ClassName; { btSair: TAdvGlassButton; }
    btSelecionar.ClassName; { btSelecionar: TAdvGlassButton; }
    cxStyleRepository1.ClassName; { cxStyleRepository1: TcxStyleRepository; }
    cxStyle2.ClassName; { cxStyle2: TcxStyle; }
    stCabecalho.ClassName; { stCabecalho: TcxStyle; }
    stConfirmada.ClassName; { stConfirmada: TcxStyle; }
    stCancelada.ClassName; { stCancelada: TcxStyle; }
    stCiencia.ClassName; { stCiencia: TcxStyle; }
    stSelecionada.ClassName; { stSelecionada: TcxStyle; }
  end;

{ frmIdentificaClienteECF: TfrmIdentificaClienteECF }
  with TfrmIdentificaClienteECF(nil) do { uuIdentificaClienteECF.pas }
  begin
    botao_pesquisa.ClassName; { botao_pesquisa: TSpeedButton; }
    Edit1.ClassName; { Edit1: TEdit; }
    Panel2.ClassName; { Panel2: TPanel; }
    Label3.ClassName; { Label3: TLabel; }
    Label1.ClassName; { Label1: TLabel; }
    Label2.ClassName; { Label2: TLabel; }
    edNomeCliente.ClassName; { edNomeCliente: TEdit; }
    edCpf.ClassName; { edCpf: TEdit; }
    edEndereco.ClassName; { edEndereco: TEdit; }
    AdvTouchKeyboard1.ClassName; { AdvTouchKeyboard1: TAdvTouchKeyboard; }
    btImprimir.ClassName; { btImprimir: TAdvGlassButton; }
    AdvGlassButton1.ClassName; { AdvGlassButton1: TAdvGlassButton; }
    Panel1.ClassName; { Panel1: TPanel; }
    lb_mesa.ClassName; { lb_mesa: TLabel; }
    Label4.ClassName; { Label4: TLabel; }
    cliques.ClassName; { cliques: TActionList; }
    ACBrValidador1.ClassName; { ACBrValidador1: TACBrValidador; }
  end;

{ frmPergunta: TfrmPergunta }
  with TfrmPergunta(nil) do { uu_frm_pergunta.pas }
  begin
    botao_pesquisa.ClassName; { botao_pesquisa: TSpeedButton; }
    SpeedButton1.ClassName; { SpeedButton1: TSpeedButton; }
    Edit1.ClassName; { Edit1: TEdit; }
    Edit2.ClassName; { Edit2: TEdit; }
    pnFundo.ClassName; { pnFundo: TPanel; }
    pnTitulo.ClassName; { pnTitulo: TPanel; }
    lb_mesa.ClassName; { lb_mesa: TLabel; }
    lblTitulo.ClassName; { lblTitulo: TLabel; }
    Panel3.ClassName; { Panel3: TPanel; }
    btSim.ClassName; { btSim: TAdvGlassButton; }
    btNao.ClassName; { btNao: TAdvGlassButton; }
    Panel2.ClassName; { Panel2: TPanel; }
    Memo1.ClassName; { Memo1: TMemo; }
    ActionList1.ClassName; { ActionList1: TActionList; }
    ControlAction1.ClassName; { ControlAction1: TControlAction; }
    Action1.ClassName; { Action1: TAction; }
    JvControlActionList1.ClassName; { JvControlActionList1: TJvControlActionList; }
    Action2.ClassName; { Action2: TAction; }
    Action3.ClassName; { Action3: TAction; }
    Action4.ClassName; { Action4: TAction; }
    Action5.ClassName; { Action5: TAction; }
    Action6.ClassName; { Action6: TAction; }
    Action7.ClassName; { Action7: TAction; }
    Action8.ClassName; { Action8: TAction; }
    Action9.ClassName; { Action9: TAction; }
    Action10.ClassName; { Action10: TAction; }
    Action11.ClassName; { Action11: TAction; }
    Action12.ClassName; { Action12: TAction; }
    Action13.ClassName; { Action13: TAction; }
    Action14.ClassName; { Action14: TAction; }
    Action15.ClassName; { Action15: TAction; }
    Action16.ClassName; { Action16: TAction; }
    Action17.ClassName; { Action17: TAction; }
    Action18.ClassName; { Action18: TAction; }
    Action19.ClassName; { Action19: TAction; }
    Action20.ClassName; { Action20: TAction; }
    Action21.ClassName; { Action21: TAction; }
    Action22.ClassName; { Action22: TAction; }
    Action23.ClassName; { Action23: TAction; }
    Action24.ClassName; { Action24: TAction; }
    Action25.ClassName; { Action25: TAction; }
    Action26.ClassName; { Action26: TAction; }
    Action27.ClassName; { Action27: TAction; }
    Action28.ClassName; { Action28: TAction; }
    Action29.ClassName; { Action29: TAction; }
    Action30.ClassName; { Action30: TAction; }
    Action31.ClassName; { Action31: TAction; }
    Action32.ClassName; { Action32: TAction; }
    Action33.ClassName; { Action33: TAction; }
    Action34.ClassName; { Action34: TAction; }
    Action35.ClassName; { Action35: TAction; }
    Action36.ClassName; { Action36: TAction; }
    Action37.ClassName; { Action37: TAction; }
    Action38.ClassName; { Action38: TAction; }
    Action39.ClassName; { Action39: TAction; }
    Action40.ClassName; { Action40: TAction; }
    Action41.ClassName; { Action41: TAction; }
    Action42.ClassName; { Action42: TAction; }
    Action43.ClassName; { Action43: TAction; }
    Action44.ClassName; { Action44: TAction; }
    Action45.ClassName; { Action45: TAction; }
    Action46.ClassName; { Action46: TAction; }
    Action47.ClassName; { Action47: TAction; }
    Action48.ClassName; { Action48: TAction; }
    Action49.ClassName; { Action49: TAction; }
    Action50.ClassName; { Action50: TAction; }
    Action51.ClassName; { Action51: TAction; }
    Action52.ClassName; { Action52: TAction; }
    Action53.ClassName; { Action53: TAction; }
    Action54.ClassName; { Action54: TAction; }
    Action55.ClassName; { Action55: TAction; }
    Action56.ClassName; { Action56: TAction; }
    Action57.ClassName; { Action57: TAction; }
    Action58.ClassName; { Action58: TAction; }
    tmApaga.ClassName; { tmApaga: TTimer; }
    tmAcende.ClassName; { tmAcende: TTimer; }
  end;

{ frmCadCidade: TfrmCadCidade }
  with TfrmCadCidade(nil) do { uuCadCidade.pas }
  begin
    pn_principal.ClassName; { pn_principal: TPanel; }
    pn_codigo.ClassName; { pn_codigo: TPanel; }
    bt_pesquisa.ClassName; { bt_pesquisa: TSpeedButton; }
    ed_codigo.ClassName; { ed_codigo: TMaskEdit; }
    Panel1.ClassName; { Panel1: TPanel; }
    Label1.ClassName; { Label1: TLabel; }
    edDescricaoCidade.ClassName; { edDescricaoCidade: TDBEdit; }
    Panel13.ClassName; { Panel13: TPanel; }
    pn_botoes.ClassName; { pn_botoes: TPanel; }
    bt_novo.ClassName; { bt_novo: TBitBtn; }
    bt_alterar.ClassName; { bt_alterar: TBitBtn; }
    bt_gravar.ClassName; { bt_gravar: TBitBtn; }
    bt_cancelar.ClassName; { bt_cancelar: TBitBtn; }
    bt_sair.ClassName; { bt_sair: TBitBtn; }
    bt_excluir.ClassName; { bt_excluir: TBitBtn; }
    bt_consultar.ClassName; { bt_consultar: TBitBtn; }
    bt_imprimir.ClassName; { bt_imprimir: TBitBtn; }
  end;

{ frmCsEstados: TfrmCsEstados }
  with TfrmCsEstados(nil) do { uu_cs_estados.pas }
  begin
    Panel3.ClassName; { Panel3: TPanel; }
    Label1.ClassName; { Label1: TLabel; }
    ed_parametro.ClassName; { ed_parametro: TEdit; }
    RadioGroup1.ClassName; { RadioGroup1: TRadioGroup; }
    Panel1.ClassName; { Panel1: TPanel; }
    DBGrid1.ClassName; { DBGrid1: TDBGrid; }
    Panel2.ClassName; { Panel2: TPanel; }
    bt_selecionar.ClassName; { bt_selecionar: TBitBtn; }
    bt_cancelar.ClassName; { bt_cancelar: TBitBtn; }
  end;

{ frmCadNotasConsumidor: TfrmCadNotasConsumidor }
  with TfrmCadNotasConsumidor(nil) do { uuCadNotasConsumidor.pas }
  begin
    pn_principal.ClassName; { pn_principal: TPanel; }
    pn_codigo.ClassName; { pn_codigo: TPanel; }
    bt_pesquisa.ClassName; { bt_pesquisa: TSpeedButton; }
    ed_codigo.ClassName; { ed_codigo: TMaskEdit; }
    Panel1.ClassName; { Panel1: TPanel; }
    Label2.ClassName; { Label2: TLabel; }
    Label3.ClassName; { Label3: TLabel; }
    Label4.ClassName; { Label4: TLabel; }
    Label5.ClassName; { Label5: TLabel; }
    bt_pesq_cfop_entrada.ClassName; { bt_pesq_cfop_entrada: TSpeedButton; }
    Label23.ClassName; { Label23: TLabel; }
    Label22.ClassName; { Label22: TLabel; }
    Label40.ClassName; { Label40: TLabel; }
    bt_pesq_cst.ClassName; { bt_pesq_cst: TSpeedButton; }
    Label14.ClassName; { Label14: TLabel; }
    Label1.ClassName; { Label1: TLabel; }
    Panel4.ClassName; { Panel4: TPanel; }
    ed_descricao_cfop_entradas.ClassName; { ed_descricao_cfop_entradas: TDBEdit; }
    Panel21.ClassName; { Panel21: TPanel; }
    Label39.ClassName; { Label39: TLabel; }
    ed_descricao_cst.ClassName; { ed_descricao_cst: TDBEdit; }
    ckbCancelada.ClassName; { ckbCancelada: TCheckBox; }
    edNumeroNotaFiscal.ClassName; { edNumeroNotaFiscal: TDBEdit; }
    DBEdit2.ClassName; { DBEdit2: TDBEdit; }
    DBEdit3.ClassName; { DBEdit3: TDBEdit; }
    edDataEmissaoNotaFiscal.ClassName; { edDataEmissaoNotaFiscal: TDBDateEdit; }
    GroupBox1.ClassName; { GroupBox1: TGroupBox; }
    Label6.ClassName; { Label6: TLabel; }
    Label7.ClassName; { Label7: TLabel; }
    edNumeroCupomFiscal.ClassName; { edNumeroCupomFiscal: TDBEdit; }
    edNumeroECF.ClassName; { edNumeroECF: TDBEdit; }
    ed_cefop_entradas.ClassName; { ed_cefop_entradas: TDBEdit; }
    DBEdit12.ClassName; { DBEdit12: TDBEdit; }
    ed_cst.ClassName; { ed_cst: TDBEdit; }
    edValorDoc.ClassName; { edValorDoc: TDBEdit; }
    pn_botoes.ClassName; { pn_botoes: TPanel; }
    bt_novo.ClassName; { bt_novo: TBitBtn; }
    bt_alterar.ClassName; { bt_alterar: TBitBtn; }
    bt_gravar.ClassName; { bt_gravar: TBitBtn; }
    bt_cancelar.ClassName; { bt_cancelar: TBitBtn; }
    bt_sair.ClassName; { bt_sair: TBitBtn; }
    bt_excluir.ClassName; { bt_excluir: TBitBtn; }
    bt_consultar.ClassName; { bt_consultar: TBitBtn; }
    bt_imprimir.ClassName; { bt_imprimir: TBitBtn; }
  end;

{ frmRelatorioNotasConsumidor: TfrmRelatorioNotasConsumidor }
  with TfrmRelatorioNotasConsumidor(nil) do { uuRelNotasVendaConsumidor.pas }
  begin
    botao_pesquisa.ClassName; { botao_pesquisa: TSpeedButton; }
    SpeedButton1.ClassName; { SpeedButton1: TSpeedButton; }
    SpeedButton2.ClassName; { SpeedButton2: TSpeedButton; }
    Edit1.ClassName; { Edit1: TEdit; }
    Edit2.ClassName; { Edit2: TEdit; }
    Edit3.ClassName; { Edit3: TEdit; }
    Panel4.ClassName; { Panel4: TPanel; }
    BitBtn1.ClassName; { BitBtn1: TBitBtn; }
    BitBtn2.ClassName; { BitBtn2: TBitBtn; }
    Panel1.ClassName; { Panel1: TPanel; }
    GroupBox1.ClassName; { GroupBox1: TGroupBox; }
    Panel5.ClassName; { Panel5: TPanel; }
    Label3.ClassName; { Label3: TLabel; }
    Label4.ClassName; { Label4: TLabel; }
    cbk_visualizar.ClassName; { cbk_visualizar: TCheckBox; }
    edDe.ClassName; { edDe: TDateEdit; }
    edAte.ClassName; { edAte: TDateEdit; }
    GroupBox5.ClassName; { GroupBox5: TGroupBox; }
    Label46.ClassName; { Label46: TLabel; }
    cbMesRefContabil.ClassName; { cbMesRefContabil: TComboBox; }
    edAnoRefContabil.ClassName; { edAnoRefContabil: TEdit; }
    gpTipoRelatorio.ClassName; { gpTipoRelatorio: TRadioGroup; }
  end;

{ frmCadNotasTransporte: TfrmCadNotasTransporte }
  with TfrmCadNotasTransporte(nil) do { uuCadNotasTransportadora.pas }
  begin
    pn_principal.ClassName; { pn_principal: TPanel; }
    pn_codigo.ClassName; { pn_codigo: TPanel; }
    bt_pesquisa.ClassName; { bt_pesquisa: TSpeedButton; }
    ed_codigo.ClassName; { ed_codigo: TMaskEdit; }
    Panel1.ClassName; { Panel1: TPanel; }
    gpFornecedor.ClassName; { gpFornecedor: TGroupBox; }
    Label2.ClassName; { Label2: TLabel; }
    bt_pesq_fornecedor.ClassName; { bt_pesq_fornecedor: TSpeedButton; }
    Label1.ClassName; { Label1: TLabel; }
    Label27.ClassName; { Label27: TLabel; }
    ed_cod_fornecedor.ClassName; { ed_cod_fornecedor: TDBEdit; }
    Panel3.ClassName; { Panel3: TPanel; }
    ed_razao_social_fornecedor.ClassName; { ed_razao_social_fornecedor: TDBEdit; }
    Panel11.ClassName; { Panel11: TPanel; }
    ed_cnpj_fornecedor.ClassName; { ed_cnpj_fornecedor: TDBEdit; }
    gpDadosNota.ClassName; { gpDadosNota: TGroupBox; }
    Label5.ClassName; { Label5: TLabel; }
    Label40.ClassName; { Label40: TLabel; }
    bt_pesq_cst.ClassName; { bt_pesq_cst: TSpeedButton; }
    bt_pesq_cfop.ClassName; { bt_pesq_cfop: TSpeedButton; }
    Label41.ClassName; { Label41: TLabel; }
    Label18.ClassName; { Label18: TLabel; }
    btPesqSituacaoDocFiscal.ClassName; { btPesqSituacaoDocFiscal: TSpeedButton; }
    Label3.ClassName; { Label3: TLabel; }
    Label6.ClassName; { Label6: TLabel; }
    Label7.ClassName; { Label7: TLabel; }
    Label8.ClassName; { Label8: TLabel; }
    Label30.ClassName; { Label30: TLabel; }
    Panel2.ClassName; { Panel2: TPanel; }
    Panel21.ClassName; { Panel21: TPanel; }
    Label39.ClassName; { Label39: TLabel; }
    ed_descricao_cst.ClassName; { ed_descricao_cst: TDBEdit; }
    Panel22.ClassName; { Panel22: TPanel; }
    Label42.ClassName; { Label42: TLabel; }
    ed_descricao_cfop.ClassName; { ed_descricao_cfop: TDBEdit; }
    Panel4.ClassName; { Panel4: TPanel; }
    edDescSituacaoDocFiscal.ClassName; { edDescSituacaoDocFiscal: TDBEdit; }
    edNumeroNotaFiscal.ClassName; { edNumeroNotaFiscal: TDBEdit; }
    DBEdit2.ClassName; { DBEdit2: TDBEdit; }
    DBEdit3.ClassName; { DBEdit3: TDBEdit; }
    edDataEmissaoNotaFiscal.ClassName; { edDataEmissaoNotaFiscal: TDBDateEdit; }
    edDataEntradaNotaFiscal.ClassName; { edDataEntradaNotaFiscal: TDBDateEdit; }
    edCodSituacaoDocFiscal.ClassName; { edCodSituacaoDocFiscal: TDBEdit; }
    ed_cst.ClassName; { ed_cst: TDBEdit; }
    ed_cfop.ClassName; { ed_cfop: TDBEdit; }
    rdTipoFrete.ClassName; { rdTipoFrete: TRadioGroup; }
    rdTipoDOC.ClassName; { rdTipoDOC: TRadioGroup; }
    pnDCTe.ClassName; { pnDCTe: TPanel; }
    GroupBox3.ClassName; { GroupBox3: TGroupBox; }
    edChaveCTE.ClassName; { edChaveCTE: TDBEdit; }
    rdTipoDCTE.ClassName; { rdTipoDCTE: TRadioGroup; }
    GroupBox1.ClassName; { GroupBox1: TGroupBox; }
    Label11.ClassName; { Label11: TLabel; }
    Label16.ClassName; { Label16: TLabel; }
    Label12.ClassName; { Label12: TLabel; }
    Label15.ClassName; { Label15: TLabel; }
    Label13.ClassName; { Label13: TLabel; }
    Label14.ClassName; { Label14: TLabel; }
    Label17.ClassName; { Label17: TLabel; }
    Label4.ClassName; { Label4: TLabel; }
    DBEdit7.ClassName; { DBEdit7: TDBEdit; }
    DBEdit4.ClassName; { DBEdit4: TDBEdit; }
    DBEdit5.ClassName; { DBEdit5: TDBEdit; }
    DBEdit6.ClassName; { DBEdit6: TDBEdit; }
    edAliquotaICMS.ClassName; { edAliquotaICMS: TDBEdit; }
    DBEdit10.ClassName; { DBEdit10: TDBEdit; }
    DBEdit8.ClassName; { DBEdit8: TDBEdit; }
    edValorMercadorias.ClassName; { edValorMercadorias: TDBEdit; }
    pn_botoes.ClassName; { pn_botoes: TPanel; }
    bt_novo.ClassName; { bt_novo: TBitBtn; }
    bt_alterar.ClassName; { bt_alterar: TBitBtn; }
    bt_gravar.ClassName; { bt_gravar: TBitBtn; }
    bt_cancelar.ClassName; { bt_cancelar: TBitBtn; }
    bt_sair.ClassName; { bt_sair: TBitBtn; }
    bt_excluir.ClassName; { bt_excluir: TBitBtn; }
    bt_consultar.ClassName; { bt_consultar: TBitBtn; }
    bt_imprimir.ClassName; { bt_imprimir: TBitBtn; }
  end;

{ frm_cs_contas: Tfrm_cs_contas }
  with Tfrm_cs_contas(nil) do { uuCsPlanoContas.pas }
  begin
    botao_pesquisa.ClassName; { botao_pesquisa: TSpeedButton; }
    SpeedButton1.ClassName; { SpeedButton1: TSpeedButton; }
    Edit1.ClassName; { Edit1: TEdit; }
    Edit2.ClassName; { Edit2: TEdit; }
    Panel1.ClassName; { Panel1: TPanel; }
    Label1.ClassName; { Label1: TLabel; }
    PageControl1.ClassName; { PageControl1: TPageControl; }
    TabSheet1.ClassName; { TabSheet1: TTabSheet; }
    Panel3.ClassName; { Panel3: TPanel; }
    TreeView1.ClassName; { TreeView1: TTreeView; }
    TabSheet2.ClassName; { TabSheet2: TTabSheet; }
    Panel4.ClassName; { Panel4: TPanel; }
    Label2.ClassName; { Label2: TLabel; }
    edDescricao.ClassName; { edDescricao: TEdit; }
    Panel5.ClassName; { Panel5: TPanel; }
    DBGrid1.ClassName; { DBGrid1: TDBGrid; }
    Panel2.ClassName; { Panel2: TPanel; }
    BitBtn1.ClassName; { BitBtn1: TBitBtn; }
    BitBtn2.ClassName; { BitBtn2: TBitBtn; }
    ImageList1.ClassName; { ImageList1: TImageList; }
  end;

{ frmRelNotasFrete: TfrmRelNotasFrete }
  with TfrmRelNotasFrete(nil) do { uuRelNotasFrete.pas }
  begin
    botao_pesquisa.ClassName; { botao_pesquisa: TSpeedButton; }
    SpeedButton1.ClassName; { SpeedButton1: TSpeedButton; }
    SpeedButton2.ClassName; { SpeedButton2: TSpeedButton; }
    SpeedButton3.ClassName; { SpeedButton3: TSpeedButton; }
    Edit1.ClassName; { Edit1: TEdit; }
    Edit2.ClassName; { Edit2: TEdit; }
    Edit3.ClassName; { Edit3: TEdit; }
    Edit4.ClassName; { Edit4: TEdit; }
    Panel1.ClassName; { Panel1: TPanel; }
    RadioGroup2.ClassName; { RadioGroup2: TRadioGroup; }
    Panel5.ClassName; { Panel5: TPanel; }
    Label3.ClassName; { Label3: TLabel; }
    Label4.ClassName; { Label4: TLabel; }
    cbk_visualizar.ClassName; { cbk_visualizar: TCheckBox; }
    edDe.ClassName; { edDe: TDateEdit; }
    edAte.ClassName; { edAte: TDateEdit; }
    Panel2.ClassName; { Panel2: TPanel; }
    Label6.ClassName; { Label6: TLabel; }
    Label5.ClassName; { Label5: TLabel; }
    bt_pesq_fornecedor.ClassName; { bt_pesq_fornecedor: TSpeedButton; }
    ed_cod_fornecedor.ClassName; { ed_cod_fornecedor: TMaskEdit; }
    Panel6.ClassName; { Panel6: TPanel; }
    ed_nome_fantasia_fornecedor.ClassName; { ed_nome_fantasia_fornecedor: TMaskEdit; }
    Panel4.ClassName; { Panel4: TPanel; }
    BitBtn1.ClassName; { BitBtn1: TBitBtn; }
    BitBtn2.ClassName; { BitBtn2: TBitBtn; }
  end;

{ frmCsNotasSaida: TfrmCsNotasSaida }
  with TfrmCsNotasSaida(nil) do { uuCsNotasSaida.pas }
  begin
    Panel3.ClassName; { Panel3: TPanel; }
    Label1.ClassName; { Label1: TLabel; }
    ed_parametro.ClassName; { ed_parametro: TEdit; }
    RadioGroup1.ClassName; { RadioGroup1: TRadioGroup; }
    gpFornecedor.ClassName; { gpFornecedor: TGroupBox; }
    Label2.ClassName; { Label2: TLabel; }
    bt_pesq_fornecedor.ClassName; { bt_pesq_fornecedor: TSpeedButton; }
    Label6.ClassName; { Label6: TLabel; }
    Panel4.ClassName; { Panel4: TPanel; }
    ed_razao_social_fornecedor.ClassName; { ed_razao_social_fornecedor: TEdit; }
    ed_cod_fornecedor.ClassName; { ed_cod_fornecedor: TEdit; }
    GroupBox2.ClassName; { GroupBox2: TGroupBox; }
    Panel5.ClassName; { Panel5: TPanel; }
    Label3.ClassName; { Label3: TLabel; }
    Label7.ClassName; { Label7: TLabel; }
    edDataEntradaInicial.ClassName; { edDataEntradaInicial: TMaskEdit; }
    edDataEntradaFinal.ClassName; { edDataEntradaFinal: TMaskEdit; }
    GroupBox4.ClassName; { GroupBox4: TGroupBox; }
    Panel7.ClassName; { Panel7: TPanel; }
    edNumeroNota.ClassName; { edNumeroNota: TEdit; }
    BitBtn1.ClassName; { BitBtn1: TBitBtn; }
    Panel1.ClassName; { Panel1: TPanel; }
    DBGrid1.ClassName; { DBGrid1: TDBGrid; }
    Panel2.ClassName; { Panel2: TPanel; }
    bt_selecionar.ClassName; { bt_selecionar: TBitBtn; }
    bt_cancelar.ClassName; { bt_cancelar: TBitBtn; }
  end;

{ frmRelSaidasPorFornecedor: TfrmRelSaidasPorFornecedor }
  with TfrmRelSaidasPorFornecedor(nil) do { uu_rel_notas_saida_fornecedor.pas }
  begin
    botao_pesquisa.ClassName; { botao_pesquisa: TSpeedButton; }
    SpeedButton1.ClassName; { SpeedButton1: TSpeedButton; }
    SpeedButton2.ClassName; { SpeedButton2: TSpeedButton; }
    SpeedButton3.ClassName; { SpeedButton3: TSpeedButton; }
    Edit1.ClassName; { Edit1: TEdit; }
    Edit2.ClassName; { Edit2: TEdit; }
    Edit3.ClassName; { Edit3: TEdit; }
    Edit4.ClassName; { Edit4: TEdit; }
    Panel1.ClassName; { Panel1: TPanel; }
    RadioGroup2.ClassName; { RadioGroup2: TRadioGroup; }
    gpOrdem.ClassName; { gpOrdem: TRadioGroup; }
    Panel5.ClassName; { Panel5: TPanel; }
    Label3.ClassName; { Label3: TLabel; }
    Label4.ClassName; { Label4: TLabel; }
    cbk_visualizar.ClassName; { cbk_visualizar: TCheckBox; }
    edDe.ClassName; { edDe: TDateEdit; }
    edAte.ClassName; { edAte: TDateEdit; }
    Panel2.ClassName; { Panel2: TPanel; }
    Label6.ClassName; { Label6: TLabel; }
    Label5.ClassName; { Label5: TLabel; }
    bt_pesq_fornecedor.ClassName; { bt_pesq_fornecedor: TSpeedButton; }
    ed_cod_fornecedor.ClassName; { ed_cod_fornecedor: TMaskEdit; }
    Panel6.ClassName; { Panel6: TPanel; }
    ed_nome_fantasia_fornecedor.ClassName; { ed_nome_fantasia_fornecedor: TMaskEdit; }
    Panel4.ClassName; { Panel4: TPanel; }
    BitBtn1.ClassName; { BitBtn1: TBitBtn; }
    BitBtn2.ClassName; { BitBtn2: TBitBtn; }
    cknItensNota.ClassName; { cknItensNota: TCheckBox; }
  end;

{ frmPainelTroco: TfrmPainelTroco }
  with TfrmPainelTroco(nil) do { uuFrmTroco.pas }
  begin
    botao_pesquisa.ClassName; { botao_pesquisa: TSpeedButton; }
    Edit1.ClassName; { Edit1: TEdit; }
    Panel1.ClassName; { Panel1: TPanel; }
    Memo1.ClassName; { Memo1: TMemo; }
    Panel2.ClassName; { Panel2: TPanel; }
    pn_troco.ClassName; { pn_troco: TPanel; }
    Timer1.ClassName; { Timer1: TTimer; }
    Timer2.ClassName; { Timer2: TTimer; }
    timerFecha.ClassName; { timerFecha: TTimer; }
  end;

{ frmCsCSTPISCOFINS: TfrmCsCSTPISCOFINS }
  with TfrmCsCSTPISCOFINS(nil) do { uuCsCSTPISCofins.pas }
  begin
    Panel3.ClassName; { Panel3: TPanel; }
    Label1.ClassName; { Label1: TLabel; }
    Label2.ClassName; { Label2: TLabel; }
    ed_parametro.ClassName; { ed_parametro: TEdit; }
    RadioGroup1.ClassName; { RadioGroup1: TRadioGroup; }
    Panel1.ClassName; { Panel1: TPanel; }
    DBGrid1.ClassName; { DBGrid1: TDBGrid; }
    Panel2.ClassName; { Panel2: TPanel; }
    bt_selecionar.ClassName; { bt_selecionar: TBitBtn; }
    bt_cancelar.ClassName; { bt_cancelar: TBitBtn; }
  end;

{ frmRelFaturasAbertasPorFaturamento: TfrmRelFaturasAbertasPorFaturamento }
  with TfrmRelFaturasAbertasPorFaturamento(nil) do { uuRelFaturasAbertasPorFaturamento.pas }
  begin
    botao_pesquisa.ClassName; { botao_pesquisa: TSpeedButton; }
    SpeedButton1.ClassName; { SpeedButton1: TSpeedButton; }
    SpeedButton2.ClassName; { SpeedButton2: TSpeedButton; }
    SpeedButton3.ClassName; { SpeedButton3: TSpeedButton; }
    SpeedButton4.ClassName; { SpeedButton4: TSpeedButton; }
    SpeedButton5.ClassName; { SpeedButton5: TSpeedButton; }
    SpeedButton6.ClassName; { SpeedButton6: TSpeedButton; }
    Edit1.ClassName; { Edit1: TEdit; }
    Edit2.ClassName; { Edit2: TEdit; }
    Edit3.ClassName; { Edit3: TEdit; }
    Edit4.ClassName; { Edit4: TEdit; }
    Edit5.ClassName; { Edit5: TEdit; }
    Edit6.ClassName; { Edit6: TEdit; }
    Edit7.ClassName; { Edit7: TEdit; }
    Panel4.ClassName; { Panel4: TPanel; }
    BitBtn1.ClassName; { BitBtn1: TBitBtn; }
    BitBtn2.ClassName; { BitBtn2: TBitBtn; }
    Panel1.ClassName; { Panel1: TPanel; }
    Panel6.ClassName; { Panel6: TPanel; }
    RadioGroup2.ClassName; { RadioGroup2: TRadioGroup; }
    Panel5.ClassName; { Panel5: TPanel; }
    Label3.ClassName; { Label3: TLabel; }
    cbk_visualizar.ClassName; { cbk_visualizar: TCheckBox; }
    edDataInicial.ClassName; { edDataInicial: TDateEdit; }
    Panel3.ClassName; { Panel3: TPanel; }
    Label1.ClassName; { Label1: TLabel; }
    CheckBox1.ClassName; { CheckBox1: TCheckBox; }
    edDataFinal.ClassName; { edDataFinal: TDateEdit; }
    Panel2.ClassName; { Panel2: TPanel; }
    Label48.ClassName; { Label48: TLabel; }
    bt_pesq_cliente.ClassName; { bt_pesq_cliente: TSpeedButton; }
    ed_cod_cliente.ClassName; { ed_cod_cliente: TEdit; }
    Panel7.ClassName; { Panel7: TPanel; }
    Label4.ClassName; { Label4: TLabel; }
    ed_desc_cliente.ClassName; { ed_desc_cliente: TEdit; }
    rdTipoPeriodo.ClassName; { rdTipoPeriodo: TRadioGroup; }
    rdStatusFatura.ClassName; { rdStatusFatura: TRadioGroup; }
  end;

{ frmRelFaturasAbertasPorVencimento: TfrmRelFaturasAbertasPorVencimento }
  with TfrmRelFaturasAbertasPorVencimento(nil) do { uuRelFaturasAbertasPorVencimento.pas }
  begin
    botao_pesquisa.ClassName; { botao_pesquisa: TSpeedButton; }
    SpeedButton1.ClassName; { SpeedButton1: TSpeedButton; }
    SpeedButton2.ClassName; { SpeedButton2: TSpeedButton; }
    SpeedButton3.ClassName; { SpeedButton3: TSpeedButton; }
    SpeedButton4.ClassName; { SpeedButton4: TSpeedButton; }
    SpeedButton5.ClassName; { SpeedButton5: TSpeedButton; }
    SpeedButton6.ClassName; { SpeedButton6: TSpeedButton; }
    SpeedButton7.ClassName; { SpeedButton7: TSpeedButton; }
    Edit1.ClassName; { Edit1: TEdit; }
    Edit2.ClassName; { Edit2: TEdit; }
    Edit3.ClassName; { Edit3: TEdit; }
    Edit4.ClassName; { Edit4: TEdit; }
    Edit5.ClassName; { Edit5: TEdit; }
    Edit6.ClassName; { Edit6: TEdit; }
    Edit7.ClassName; { Edit7: TEdit; }
    Edit8.ClassName; { Edit8: TEdit; }
    Panel4.ClassName; { Panel4: TPanel; }
    BitBtn1.ClassName; { BitBtn1: TBitBtn; }
    BitBtn2.ClassName; { BitBtn2: TBitBtn; }
    Panel1.ClassName; { Panel1: TPanel; }
    Panel6.ClassName; { Panel6: TPanel; }
    RadioGroup2.ClassName; { RadioGroup2: TRadioGroup; }
    Panel5.ClassName; { Panel5: TPanel; }
    Label3.ClassName; { Label3: TLabel; }
    cbk_visualizar.ClassName; { cbk_visualizar: TCheckBox; }
    edDataInicial.ClassName; { edDataInicial: TDateEdit; }
    Panel3.ClassName; { Panel3: TPanel; }
    Label1.ClassName; { Label1: TLabel; }
    CheckBox1.ClassName; { CheckBox1: TCheckBox; }
    edDataFinal.ClassName; { edDataFinal: TDateEdit; }
    Panel2.ClassName; { Panel2: TPanel; }
    Label48.ClassName; { Label48: TLabel; }
    bt_pesq_cliente.ClassName; { bt_pesq_cliente: TSpeedButton; }
    ed_cod_cliente.ClassName; { ed_cod_cliente: TEdit; }
    Panel7.ClassName; { Panel7: TPanel; }
    Label4.ClassName; { Label4: TLabel; }
    ed_desc_cliente.ClassName; { ed_desc_cliente: TEdit; }
    ckbTodas.ClassName; { ckbTodas: TCheckBox; }
  end;

{ frmRelFaturasAbertasDetalhada: TfrmRelFaturasAbertasDetalhada }
  with TfrmRelFaturasAbertasDetalhada(nil) do { uRelFaturasAbertasDetalhada.pas }
  begin
    botao_pesquisa.ClassName; { botao_pesquisa: TSpeedButton; }
    SpeedButton1.ClassName; { SpeedButton1: TSpeedButton; }
    SpeedButton2.ClassName; { SpeedButton2: TSpeedButton; }
    SpeedButton3.ClassName; { SpeedButton3: TSpeedButton; }
    SpeedButton4.ClassName; { SpeedButton4: TSpeedButton; }
    SpeedButton5.ClassName; { SpeedButton5: TSpeedButton; }
    SpeedButton6.ClassName; { SpeedButton6: TSpeedButton; }
    SpeedButton7.ClassName; { SpeedButton7: TSpeedButton; }
    SpeedButton8.ClassName; { SpeedButton8: TSpeedButton; }
    Edit1.ClassName; { Edit1: TEdit; }
    Edit2.ClassName; { Edit2: TEdit; }
    Edit3.ClassName; { Edit3: TEdit; }
    Edit4.ClassName; { Edit4: TEdit; }
    Edit5.ClassName; { Edit5: TEdit; }
    Edit6.ClassName; { Edit6: TEdit; }
    Edit7.ClassName; { Edit7: TEdit; }
    Edit8.ClassName; { Edit8: TEdit; }
    Edit9.ClassName; { Edit9: TEdit; }
    Panel4.ClassName; { Panel4: TPanel; }
    BitBtn1.ClassName; { BitBtn1: TBitBtn; }
    BitBtn2.ClassName; { BitBtn2: TBitBtn; }
    Panel1.ClassName; { Panel1: TPanel; }
    Panel6.ClassName; { Panel6: TPanel; }
    rdPeriodo.ClassName; { rdPeriodo: TRadioGroup; }
    Panel5.ClassName; { Panel5: TPanel; }
    Label3.ClassName; { Label3: TLabel; }
    cbk_visualizar.ClassName; { cbk_visualizar: TCheckBox; }
    edDataInicial.ClassName; { edDataInicial: TDateEdit; }
    Panel3.ClassName; { Panel3: TPanel; }
    Label1.ClassName; { Label1: TLabel; }
    CheckBox1.ClassName; { CheckBox1: TCheckBox; }
    edDataFinal.ClassName; { edDataFinal: TDateEdit; }
    rdFiltro.ClassName; { rdFiltro: TRadioGroup; }
    rdStatusFatura.ClassName; { rdStatusFatura: TRadioGroup; }
    rdTipoPeriodo.ClassName; { rdTipoPeriodo: TRadioGroup; }
    Panel2.ClassName; { Panel2: TPanel; }
    Label48.ClassName; { Label48: TLabel; }
    bt_pesq_cliente.ClassName; { bt_pesq_cliente: TSpeedButton; }
    ed_cod_cliente.ClassName; { ed_cod_cliente: TEdit; }
    Panel7.ClassName; { Panel7: TPanel; }
    Label4.ClassName; { Label4: TLabel; }
    ed_desc_cliente.ClassName; { ed_desc_cliente: TEdit; }
  end;

{ frm_recebimento_parcial: Tfrm_recebimento_parcial }
  with Tfrm_recebimento_parcial(nil) do { uu_recebimentos_parciais.pas }
  begin
    botao_pesquisa.ClassName; { botao_pesquisa: TSpeedButton; }
    Edit1.ClassName; { Edit1: TEdit; }
    Panel5.ClassName; { Panel5: TPanel; }
    Panel4.ClassName; { Panel4: TPanel; }
    Label1.ClassName; { Label1: TLabel; }
    bt_pesquisa_forma.ClassName; { bt_pesquisa_forma: TSpeedButton; }
    Label4.ClassName; { Label4: TLabel; }
    edCodFormaPagamento.ClassName; { edCodFormaPagamento: TEdit; }
    edValor.ClassName; { edValor: TCurrencyEdit; }
    BitBtn1.ClassName; { BitBtn1: TBitBtn; }
    Panel13.ClassName; { Panel13: TPanel; }
    Label43.ClassName; { Label43: TLabel; }
    edDescricaoForma.ClassName; { edDescricaoForma: TEdit; }
    Panel3.ClassName; { Panel3: TPanel; }
    lb_mesa.ClassName; { lb_mesa: TLabel; }
    Label2.ClassName; { Label2: TLabel; }
    lbTitulo.ClassName; { lbTitulo: TLabel; }
    Panel1.ClassName; { Panel1: TPanel; }
    DBGrid1.ClassName; { DBGrid1: TDBGrid; }
    Panel2.ClassName; { Panel2: TPanel; }
    btImprimirInventario.ClassName; { btImprimirInventario: TAdvGlassButton; }
    AdvGlassButton3.ClassName; { AdvGlassButton3: TAdvGlassButton; }
    Panel6.ClassName; { Panel6: TPanel; }
    Label5.ClassName; { Label5: TLabel; }
    edTotalFormas.ClassName; { edTotalFormas: TCurrencyEdit; }
    Panel7.ClassName; { Panel7: TPanel; }
    cliques.ClassName; { cliques: TActionList; }
    actlBusca.ClassName; { actlBusca: TJvControlActionList; }
    tbRecebimentosParciais.ClassName; { tbRecebimentosParciais: TRxMemoryData; }
    tbRecebimentosParciaismesa.ClassName; { tbRecebimentosParciaismesa: TStringField; }
    tbRecebimentosParciaiscodForma.ClassName; { tbRecebimentosParciaiscodForma: TStringField; }
    tbRecebimentosParciaisvalor.ClassName; { tbRecebimentosParciaisvalor: TCurrencyField; }
    tbRecebimentosParciaisdescricaoForma.ClassName; { tbRecebimentosParciaisdescricaoForma: TStringField; }
    tbRecebimentosParciaisHORA.ClassName; { tbRecebimentosParciaisHORA: TStringField; }
    dsRecebimentosParciais.ClassName; { dsRecebimentosParciais: TDataSource; }
    PopupMenu1.ClassName; { PopupMenu1: TPopupMenu; }
    A1.ClassName; { A1: TMenuItem; }
  end;

{ frmContasApagarEntradas: TfrmContasApagarEntradas }
  with TfrmContasApagarEntradas(nil) do { uuContasPagarEntradas.pas }
  begin
    botao_pesquisa.ClassName; { botao_pesquisa: TSpeedButton; }
    Edit1.ClassName; { Edit1: TEdit; }
    Panel1.ClassName; { Panel1: TPanel; }
    Label14.ClassName; { Label14: TLabel; }
    Label15.ClassName; { Label15: TLabel; }
    Panel2.ClassName; { Panel2: TPanel; }
    GroupBox1.ClassName; { GroupBox1: TGroupBox; }
    Label2.ClassName; { Label2: TLabel; }
    Label1.ClassName; { Label1: TLabel; }
    Label27.ClassName; { Label27: TLabel; }
    Label17.ClassName; { Label17: TLabel; }
    Label21.ClassName; { Label21: TLabel; }
    Panel3.ClassName; { Panel3: TPanel; }
    ed_razao_social_fornecedor.ClassName; { ed_razao_social_fornecedor: TEdit; }
    Panel11.ClassName; { Panel11: TPanel; }
    Label16.ClassName; { Label16: TLabel; }
    ed_cnpj_fornecedor.ClassName; { ed_cnpj_fornecedor: TEdit; }
    edNumeroEntrada.ClassName; { edNumeroEntrada: TEdit; }
    edNumeroNota.ClassName; { edNumeroNota: TEdit; }
    edDataDoc.ClassName; { edDataDoc: TDateEdit; }
    ed_cod_fornecedor.ClassName; { ed_cod_fornecedor: TEdit; }
    gp_loja.ClassName; { gp_loja: TGroupBox; }
    Panel9.ClassName; { Panel9: TPanel; }
    edDescLoja.ClassName; { edDescLoja: TDBEdit; }
    edCodLoja.ClassName; { edCodLoja: TDBEdit; }
    Panel4.ClassName; { Panel4: TPanel; }
    Panel5.ClassName; { Panel5: TPanel; }
    bt_pesq_centro_custo.ClassName; { bt_pesq_centro_custo: TSpeedButton; }
    Label3.ClassName; { Label3: TLabel; }
    Label4.ClassName; { Label4: TLabel; }
    Label5.ClassName; { Label5: TLabel; }
    Label6.ClassName; { Label6: TLabel; }
    Label7.ClassName; { Label7: TLabel; }
    Label8.ClassName; { Label8: TLabel; }
    Label9.ClassName; { Label9: TLabel; }
    Label19.ClassName; { Label19: TLabel; }
    Panel6.ClassName; { Panel6: TPanel; }
    ed_desc_c_custo.ClassName; { ed_desc_c_custo: TEdit; }
    edDescricaoConta.ClassName; { edDescricaoConta: TEdit; }
    edTotalConta.ClassName; { edTotalConta: TCurrencyEdit; }
    edNumeroParcelas.ClassName; { edNumeroParcelas: TCurrencyEdit; }
    edPrazoParcelas.ClassName; { edPrazoParcelas: TCurrencyEdit; }
    btGerar.ClassName; { btGerar: TBitBtn; }
    ed_cod_centro_custo.ClassName; { ed_cod_centro_custo: TEdit; }
    ckbDiasUteis.ClassName; { ckbDiasUteis: TCheckBox; }
    edDataVencimento.ClassName; { edDataVencimento: TcxDateEdit; }
    edDataRD.ClassName; { edDataRD: TcxDateEdit; }
    Panel8.ClassName; { Panel8: TPanel; }
    DBGrid1.ClassName; { DBGrid1: TDBGrid; }
    btSair.ClassName; { btSair: TBitBtn; }
    btLancar.ClassName; { btLancar: TBitBtn; }
    Panel7.ClassName; { Panel7: TPanel; }
    Label20.ClassName; { Label20: TLabel; }
    memoObs.ClassName; { memoObs: TMemo; }
    DBGrid3.ClassName; { DBGrid3: TDBGrid; }
    Panel10.ClassName; { Panel10: TPanel; }
    Label18.ClassName; { Label18: TLabel; }
    tbParcelas.ClassName; { tbParcelas: TRxMemoryData; }
    tbParcelasdataVencimento.ClassName; { tbParcelasdataVencimento: TDateField; }
    tbParcelasdescricaoConta.ClassName; { tbParcelasdescricaoConta: TStringField; }
    tbParcelasnumeroControle.ClassName; { tbParcelasnumeroControle: TStringField; }
    tbParcelasvalorParcela.ClassName; { tbParcelasvalorParcela: TCurrencyField; }
    tbParcelasvalorMulta.ClassName; { tbParcelasvalorMulta: TCurrencyField; }
    tbParcelasvalorMora.ClassName; { tbParcelasvalorMora: TFloatField; }
    tbParcelasvalorDesconto.ClassName; { tbParcelasvalorDesconto: TFloatField; }
    tbParcelasflagMulta.ClassName; { tbParcelasflagMulta: TSmallintField; }
    tbParcelasflagMora.ClassName; { tbParcelasflagMora: TSmallintField; }
    tbParcelasflagDesconto.ClassName; { tbParcelasflagDesconto: TSmallintField; }
    tbParcelasdiasDesconto.ClassName; { tbParcelasdiasDesconto: TIntegerField; }
    tbParcelasdiaSemana.ClassName; { tbParcelasdiaSemana: TStringField; }
    tbParcelasparcela.ClassName; { tbParcelasparcela: TStringField; }
    dsParcelas.ClassName; { dsParcelas: TDataSource; }
  end;

{ frmLancamentoContasApagar: TfrmLancamentoContasApagar }
  with TfrmLancamentoContasApagar(nil) do { uuLancamentoContasAPagar.pas }
  begin
    pn_principal.ClassName; { pn_principal: TPanel; }
    pn_codigo.ClassName; { pn_codigo: TPanel; }
    bt_pesquisa.ClassName; { bt_pesquisa: TSpeedButton; }
    Label7.ClassName; { Label7: TLabel; }
    lbCodEntrada.ClassName; { lbCodEntrada: TLabel; }
    Label26.ClassName; { Label26: TLabel; }
    ed_codigo.ClassName; { ed_codigo: TMaskEdit; }
    Panel11.ClassName; { Panel11: TPanel; }
    Label25.ClassName; { Label25: TLabel; }
    edDataLancamento.ClassName; { edDataLancamento: TDateEdit; }
    Panel1.ClassName; { Panel1: TPanel; }
    Label14.ClassName; { Label14: TLabel; }
    Label15.ClassName; { Label15: TLabel; }
    lbCodPrimeiraConta.ClassName; { lbCodPrimeiraConta: TLabel; }
    Panel5.ClassName; { Panel5: TPanel; }
    bt_pesq_centro_custo.ClassName; { bt_pesq_centro_custo: TSpeedButton; }
    Label3.ClassName; { Label3: TLabel; }
    Label4.ClassName; { Label4: TLabel; }
    Label5.ClassName; { Label5: TLabel; }
    Label6.ClassName; { Label6: TLabel; }
    Label9.ClassName; { Label9: TLabel; }
    Label10.ClassName; { Label10: TLabel; }
    Label11.ClassName; { Label11: TLabel; }
    Label12.ClassName; { Label12: TLabel; }
    Label13.ClassName; { Label13: TLabel; }
    Label1.ClassName; { Label1: TLabel; }
    Label2.ClassName; { Label2: TLabel; }
    Label8.ClassName; { Label8: TLabel; }
    bt_pesq_fornecedor.ClassName; { bt_pesq_fornecedor: TSpeedButton; }
    Label16.ClassName; { Label16: TLabel; }
    Label21.ClassName; { Label21: TLabel; }
    Label24.ClassName; { Label24: TLabel; }
    Panel6.ClassName; { Panel6: TPanel; }
    ed_desc_c_custo.ClassName; { ed_desc_c_custo: TEdit; }
    Panel3.ClassName; { Panel3: TPanel; }
    ed_razao_social_fornecedor.ClassName; { ed_razao_social_fornecedor: TEdit; }
    ed_cod_fornecedor.ClassName; { ed_cod_fornecedor: TEdit; }
    edNumeroNotaFiscal.ClassName; { edNumeroNotaFiscal: TEdit; }
    ed_cod_centro_custo.ClassName; { ed_cod_centro_custo: TEdit; }
    edDescricaoConta.ClassName; { edDescricaoConta: TEdit; }
    edTotalConta.ClassName; { edTotalConta: TCurrencyEdit; }
    edDataVencimento.ClassName; { edDataVencimento: TDateEdit; }
    edMulta.ClassName; { edMulta: TCurrencyEdit; }
    ckbMulta.ClassName; { ckbMulta: TCheckBox; }
    edMora.ClassName; { edMora: TCurrencyEdit; }
    ckbMora.ClassName; { ckbMora: TCheckBox; }
    edDesconto.ClassName; { edDesconto: TCurrencyEdit; }
    ckbDesconto.ClassName; { ckbDesconto: TCheckBox; }
    edDiasDesconto.ClassName; { edDiasDesconto: TCurrencyEdit; }
    edNumeroParcelas.ClassName; { edNumeroParcelas: TCurrencyEdit; }
    edDataRD.ClassName; { edDataRD: TDateEdit; }
    edDataDocumento.ClassName; { edDataDocumento: TDateEdit; }
    PageControl1.ClassName; { PageControl1: TPageControl; }
    TabSheet1.ClassName; { TabSheet1: TTabSheet; }
    DBGrid1.ClassName; { DBGrid1: TDBGrid; }
    Panel7.ClassName; { Panel7: TPanel; }
    Label22.ClassName; { Label22: TLabel; }
    Label23.ClassName; { Label23: TLabel; }
    Panel2.ClassName; { Panel2: TPanel; }
    bt_pesq_grupo.ClassName; { bt_pesq_grupo: TSpeedButton; }
    Label19.ClassName; { Label19: TLabel; }
    Label43.ClassName; { Label43: TLabel; }
    Label20.ClassName; { Label20: TLabel; }
    Panel4.ClassName; { Panel4: TPanel; }
    ed_desc_grupo.ClassName; { ed_desc_grupo: TEdit; }
    btAdicionar.ClassName; { btAdicionar: TBitBtn; }
    edValor.ClassName; { edValor: TCurrencyEdit; }
    ed_cod_grupo.ClassName; { ed_cod_grupo: TEdit; }
    DBGrid3.ClassName; { DBGrid3: TDBGrid; }
    memoObs.ClassName; { memoObs: TMemo; }
    Panel8.ClassName; { Panel8: TPanel; }
    edTotalRD.ClassName; { edTotalRD: TCurrencyEdit; }
    Panel10.ClassName; { Panel10: TPanel; }
    Label17.ClassName; { Label17: TLabel; }
    pn_botoes.ClassName; { pn_botoes: TPanel; }
    bt_novo.ClassName; { bt_novo: TBitBtn; }
    bt_alterar.ClassName; { bt_alterar: TBitBtn; }
    bt_gravar.ClassName; { bt_gravar: TBitBtn; }
    bt_cancelar.ClassName; { bt_cancelar: TBitBtn; }
    bt_sair.ClassName; { bt_sair: TBitBtn; }
    bt_excluir.ClassName; { bt_excluir: TBitBtn; }
    bt_consultar.ClassName; { bt_consultar: TBitBtn; }
    bt_imprimir.ClassName; { bt_imprimir: TBitBtn; }
    tbParcelas.ClassName; { tbParcelas: TRxMemoryData; }
    tbParcelasdataVencimento.ClassName; { tbParcelasdataVencimento: TDateField; }
    tbParcelasdescricaoConta.ClassName; { tbParcelasdescricaoConta: TStringField; }
    tbParcelasnumeroControle.ClassName; { tbParcelasnumeroControle: TStringField; }
    tbParcelasvalorParcela.ClassName; { tbParcelasvalorParcela: TCurrencyField; }
    tbParcelasvalorMulta.ClassName; { tbParcelasvalorMulta: TCurrencyField; }
    tbParcelasvalorMora.ClassName; { tbParcelasvalorMora: TFloatField; }
    tbParcelasvalorDesconto.ClassName; { tbParcelasvalorDesconto: TFloatField; }
    tbParcelasflagMulta.ClassName; { tbParcelasflagMulta: TSmallintField; }
    tbParcelasflagMora.ClassName; { tbParcelasflagMora: TSmallintField; }
    tbParcelasflagDesconto.ClassName; { tbParcelasflagDesconto: TSmallintField; }
    tbParcelasdiasDesconto.ClassName; { tbParcelasdiasDesconto: TIntegerField; }
    tbParcelasdiaSemana.ClassName; { tbParcelasdiaSemana: TStringField; }
    tbParcelasparcela.ClassName; { tbParcelasparcela: TStringField; }
    tbParcelasCodLancRD.ClassName; { tbParcelasCodLancRD: TStringField; }
    dsParcelas.ClassName; { dsParcelas: TDataSource; }
    PopupMenu1.ClassName; { PopupMenu1: TPopupMenu; }
    Excluir1.ClassName; { Excluir1: TMenuItem; }
  end;

{ frmRelProducaoGarconsSintetico: TfrmRelProducaoGarconsSintetico }
  with TfrmRelProducaoGarconsSintetico(nil) do { uuRelProducaoGarconsSintetico.pas }
  begin
    frm_modelo_rel_datas.ClassName; { frm_modelo_rel_datas: TPanel; }
    RadioGroup1.ClassName; { RadioGroup1: TRadioGroup; }
    Panel5.ClassName; { Panel5: TPanel; }
    Panel2.ClassName; { Panel2: TPanel; }
    bt_imprimir.ClassName; { bt_imprimir: TBitBtn; }
    bt_sair.ClassName; { bt_sair: TBitBtn; }
    rdpAgrupamento.ClassName; { rdpAgrupamento: TRadioGroup; }
    Panel1.ClassName; { Panel1: TPanel; }
    Label3.ClassName; { Label3: TLabel; }
    Label4.ClassName; { Label4: TLabel; }
  end;

{ frmRelTaxaServico: TfrmRelTaxaServico }
  with TfrmRelTaxaServico(nil) do { uuRelTaxaServico.pas }
  begin
    frm_modelo_rel_datas.ClassName; { frm_modelo_rel_datas: TPanel; }
    RadioGroup1.ClassName; { RadioGroup1: TRadioGroup; }
    Panel2.ClassName; { Panel2: TPanel; }
    bt_imprimir.ClassName; { bt_imprimir: TBitBtn; }
    bt_sair.ClassName; { bt_sair: TBitBtn; }
    rdpAgrupamento.ClassName; { rdpAgrupamento: TRadioGroup; }
    Panel1.ClassName; { Panel1: TPanel; }
    Label3.ClassName; { Label3: TLabel; }
    Label4.ClassName; { Label4: TLabel; }
  end;

{ frmManutencaoContasApagar: TfrmManutencaoContasApagar }
  with TfrmManutencaoContasApagar(nil) do { uuManutencaoContasApagar.pas }
  begin
    botao_pesquisa.ClassName; { botao_pesquisa: TSpeedButton; }
    Edit1.ClassName; { Edit1: TEdit; }
    Panel3.ClassName; { Panel3: TPanel; }
    Label1.ClassName; { Label1: TLabel; }
    Label4.ClassName; { Label4: TLabel; }
    Label5.ClassName; { Label5: TLabel; }
    Label12.ClassName; { Label12: TLabel; }
    ed_parametro.ClassName; { ed_parametro: TEdit; }
    RadioGroup1.ClassName; { RadioGroup1: TRadioGroup; }
    gpFornecedor.ClassName; { gpFornecedor: TGroupBox; }
    Label2.ClassName; { Label2: TLabel; }
    bt_pesq_fornecedor.ClassName; { bt_pesq_fornecedor: TSpeedButton; }
    Label6.ClassName; { Label6: TLabel; }
    Panel4.ClassName; { Panel4: TPanel; }
    ed_razao_social_fornecedor.ClassName; { ed_razao_social_fornecedor: TEdit; }
    ed_cod_fornecedor.ClassName; { ed_cod_fornecedor: TEdit; }
    rdpContas.ClassName; { rdpContas: TRadioGroup; }
    btPesquisar.ClassName; { btPesquisar: TBitBtn; }
    btImprimir.ClassName; { btImprimir: TBitBtn; }
    rdFiltroData.ClassName; { rdFiltroData: TRadioGroup; }
    edNumeroNota.ClassName; { edNumeroNota: TEdit; }
    BitBtn1.ClassName; { BitBtn1: TBitBtn; }
    gp_loja.ClassName; { gp_loja: TGroupBox; }
    Label18.ClassName; { Label18: TLabel; }
    btPesqLoja.ClassName; { btPesqLoja: TSpeedButton; }
    Label28.ClassName; { Label28: TLabel; }
    Panel9.ClassName; { Panel9: TPanel; }
    edDescLoja.ClassName; { edDescLoja: TEdit; }
    edCodLoja.ClassName; { edCodLoja: TEdit; }
    edDias.ClassName; { edDias: TRxSpinEdit; }
    edValorNota.ClassName; { edValorNota: TCurrencyEdit; }
    ckbExibeCancelados.ClassName; { ckbExibeCancelados: TCheckBox; }
    GroupBox2.ClassName; { GroupBox2: TGroupBox; }
    Panel5.ClassName; { Panel5: TPanel; }
    Label3.ClassName; { Label3: TLabel; }
    Label7.ClassName; { Label7: TLabel; }
    ed_data_inicial.ClassName; { ed_data_inicial: TDateEdit; }
    ed_data_final.ClassName; { ed_data_final: TDateEdit; }
    Panel1.ClassName; { Panel1: TPanel; }
    Label8.ClassName; { Label8: TLabel; }
    Label9.ClassName; { Label9: TLabel; }
    Label10.ClassName; { Label10: TLabel; }
    Label11.ClassName; { Label11: TLabel; }
    DBGrid1.ClassName; { DBGrid1: TDBGrid; }
    Panel6.ClassName; { Panel6: TPanel; }
    Panel7.ClassName; { Panel7: TPanel; }
    Panel10.ClassName; { Panel10: TPanel; }
    Panel11.ClassName; { Panel11: TPanel; }
    Panel2.ClassName; { Panel2: TPanel; }
    Panel8.ClassName; { Panel8: TPanel; }
    Label14.ClassName; { Label14: TLabel; }
    Label15.ClassName; { Label15: TLabel; }
    PopupMenu1.ClassName; { PopupMenu1: TPopupMenu; }
    N1.ClassName; { N1: TMenuItem; }
    Alterardados1.ClassName; { Alterardados1: TMenuItem; }
    BaixarttuloPagar1.ClassName; { BaixarttuloPagar1: TMenuItem; }
    Excluirttulo1.ClassName; { Excluirttulo1: TMenuItem; }
    N2.ClassName; { N2: TMenuItem; }
    ImageList1.ClassName; { ImageList1: TImageList; }
  end;

{ frmCsLojas: TfrmCsLojas }
  with TfrmCsLojas(nil) do { uuCsLojas.pas }
  begin
    Panel3.ClassName; { Panel3: TPanel; }
    Label1.ClassName; { Label1: TLabel; }
    Label2.ClassName; { Label2: TLabel; }
    Label3.ClassName; { Label3: TLabel; }
    ed_parametro.ClassName; { ed_parametro: TEdit; }
    RadioGroup1.ClassName; { RadioGroup1: TRadioGroup; }
    Panel1.ClassName; { Panel1: TPanel; }
    DBGrid1.ClassName; { DBGrid1: TDBGrid; }
    Panel2.ClassName; { Panel2: TPanel; }
    bt_selecionar.ClassName; { bt_selecionar: TBitBtn; }
    bt_cancelar.ClassName; { bt_cancelar: TBitBtn; }
  end;

{ frmLerPesoRestauranteBarras: TfrmLerPesoRestauranteBarras }
  with TfrmLerPesoRestauranteBarras(nil) do { uuLeituraBarrasPesoRestaurante.pas }
  begin
    botao_pesquisa.ClassName; { botao_pesquisa: TSpeedButton; }
    Edit1.ClassName; { Edit1: TEdit; }
    Panel1.ClassName; { Panel1: TPanel; }
    Image1.ClassName; { Image1: TImage; }
    Label1.ClassName; { Label1: TLabel; }
    edCodigoBarras.ClassName; { edCodigoBarras: TEdit; }
    Timer1.ClassName; { Timer1: TTimer; }
  end;

{ frmBaixaTituloContasApagar: TfrmBaixaTituloContasApagar }
  with TfrmBaixaTituloContasApagar(nil) do { uuBaixaTitulosContasApagar.pas }
  begin
    botao_pesquisa.ClassName; { botao_pesquisa: TSpeedButton; }
    Edit1.ClassName; { Edit1: TEdit; }
    Panel2.ClassName; { Panel2: TPanel; }
    Label1.ClassName; { Label1: TLabel; }
    Label7.ClassName; { Label7: TLabel; }
    edDataPagamento.ClassName; { edDataPagamento: TDateEdit; }
    Panel1.ClassName; { Panel1: TPanel; }
    BitBtn1.ClassName; { BitBtn1: TBitBtn; }
    BitBtn2.ClassName; { BitBtn2: TBitBtn; }
    Panel4.ClassName; { Panel4: TPanel; }
    Label2.ClassName; { Label2: TLabel; }
    Label3.ClassName; { Label3: TLabel; }
    Label4.ClassName; { Label4: TLabel; }
    Label5.ClassName; { Label5: TLabel; }
    Label6.ClassName; { Label6: TLabel; }
    edNumeroTitulo.ClassName; { edNumeroTitulo: TEdit; }
    edParcela.ClassName; { edParcela: TEdit; }
    edDescricaoConta.ClassName; { edDescricaoConta: TEdit; }
    edValor.ClassName; { edValor: TCurrencyEdit; }
    edVencimento.ClassName; { edVencimento: TDateEdit; }
    Panel5.ClassName; { Panel5: TPanel; }
    F01.ClassName; { F01: TRadioButton; }
    F02.ClassName; { F02: TRadioButton; }
    F03.ClassName; { F03: TRadioButton; }
    Panel3.ClassName; { Panel3: TPanel; }
    Label14.ClassName; { Label14: TLabel; }
    Label15.ClassName; { Label15: TLabel; }
  end;

{ frmDesconto: TfrmDesconto }
  with TfrmDesconto(nil) do { uuDesconto.pas }
  begin
    botao_pesquisa.ClassName; { botao_pesquisa: TSpeedButton; }
    Edit1.ClassName; { Edit1: TEdit; }
    Panel1.ClassName; { Panel1: TPanel; }
    Label2.ClassName; { Label2: TLabel; }
    Panel2.ClassName; { Panel2: TPanel; }
    rdPercentual.ClassName; { rdPercentual: TRadioButton; }
    rdValor.ClassName; { rdValor: TRadioButton; }
    Panel3.ClassName; { Panel3: TPanel; }
    Label4.ClassName; { Label4: TLabel; }
    edValorDesconto.ClassName; { edValorDesconto: TCurrencyEdit; }
    btImprimir.ClassName; { btImprimir: TAdvGlassButton; }
    AdvGlassButton1.ClassName; { AdvGlassButton1: TAdvGlassButton; }
    cliques.ClassName; { cliques: TActionList; }
  end;

{ frmOperacoesDeCaixa: TfrmOperacoesDeCaixa }
  with TfrmOperacoesDeCaixa(nil) do { uuOperacoesCaixa.pas }
  begin
    botao_pesquisa.ClassName; { botao_pesquisa: TSpeedButton; }
    Edit1.ClassName; { Edit1: TEdit; }
    Panel1.ClassName; { Panel1: TPanel; }
    lbMensagem.ClassName; { lbMensagem: TLabel; }
    btSangria.ClassName; { btSangria: TBitBtn; }
    btSuprimento.ClassName; { btSuprimento: TBitBtn; }
    btNFCEcontingencia.ClassName; { btNFCEcontingencia: TBitBtn; }
    btRelParcial.ClassName; { btRelParcial: TBitBtn; }
    lbContasAssinadas.ClassName; { lbContasAssinadas: TBitBtn; }
    btFecharCaixa.ClassName; { btFecharCaixa: TBitBtn; }
    btFechar.ClassName; { btFechar: TBitBtn; }
    btMudarOperador.ClassName; { btMudarOperador: TBitBtn; }
    btSairDoSistema.ClassName; { btSairDoSistema: TBitBtn; }
    BitBtn1.ClassName; { BitBtn1: TBitBtn; }
    BitBtn3.ClassName; { BitBtn3: TBitBtn; }
    BitBtn2.ClassName; { BitBtn2: TBitBtn; }
  end;

{ frmSuprimentoExtra: TfrmSuprimentoExtra }
  with TfrmSuprimentoExtra(nil) do { uUSuprimentoExtra.pas }
  begin
    botao_pesquisa.ClassName; { botao_pesquisa: TSpeedButton; }
    Edit1.ClassName; { Edit1: TEdit; }
    Panel1.ClassName; { Panel1: TPanel; }
    Label2.ClassName; { Label2: TLabel; }
    Panel2.ClassName; { Panel2: TPanel; }
    Label1.ClassName; { Label1: TLabel; }
    edvalorSuprimento.ClassName; { edvalorSuprimento: TCurrencyEdit; }
    Panel3.ClassName; { Panel3: TPanel; }
    BitBtn1.ClassName; { BitBtn1: TBitBtn; }
    BitBtn2.ClassName; { BitBtn2: TBitBtn; }
  end;

{ frmQtdPessoas: TfrmQtdPessoas }
  with TfrmQtdPessoas(nil) do { uuQtdePessoas.pas }
  begin
    botao_pesquisa.ClassName; { botao_pesquisa: TSpeedButton; }
    SpeedButton3.ClassName; { SpeedButton3: TSpeedButton; }
    SpeedButton2.ClassName; { SpeedButton2: TSpeedButton; }
    SpeedButton1.ClassName; { SpeedButton1: TSpeedButton; }
    Edit1.ClassName; { Edit1: TEdit; }
    Panel1.ClassName; { Panel1: TPanel; }
    Label1.ClassName; { Label1: TLabel; }
    Label2.ClassName; { Label2: TLabel; }
    lbMesa.ClassName; { lbMesa: TLabel; }
    ed_quantidade.ClassName; { ed_quantidade: TEdit; }
  end;

{ frmCsDepartamentos: TfrmCsDepartamentos }
  with TfrmCsDepartamentos(nil) do { uuCsDepartamentos.pas }
  begin
    Panel3.ClassName; { Panel3: TPanel; }
    Label1.ClassName; { Label1: TLabel; }
    Label2.ClassName; { Label2: TLabel; }
    ed_parametro.ClassName; { ed_parametro: TEdit; }
    RadioGroup1.ClassName; { RadioGroup1: TRadioGroup; }
    Panel1.ClassName; { Panel1: TPanel; }
    DBGrid1.ClassName; { DBGrid1: TDBGrid; }
    Panel2.ClassName; { Panel2: TPanel; }
    bt_selecionar.ClassName; { bt_selecionar: TBitBtn; }
    bt_cancelar.ClassName; { bt_cancelar: TBitBtn; }
  end;

{ frmBaixaFaturas: TfrmBaixaFaturas }
  with TfrmBaixaFaturas(nil) do { uuBaixaContasAssinadas.pas }
  begin
    botao_pesquisa.ClassName; { botao_pesquisa: TSpeedButton; }
    Edit1.ClassName; { Edit1: TEdit; }
    Panel1.ClassName; { Panel1: TPanel; }
    Label1.ClassName; { Label1: TLabel; }
    Label2.ClassName; { Label2: TLabel; }
    Panel2.ClassName; { Panel2: TPanel; }
    Panel3.ClassName; { Panel3: TPanel; }
    bt_pesq_cliente.ClassName; { bt_pesq_cliente: TSpeedButton; }
    Label48.ClassName; { Label48: TLabel; }
    Panel7.ClassName; { Panel7: TPanel; }
    Label4.ClassName; { Label4: TLabel; }
    ed_desc_cliente.ClassName; { ed_desc_cliente: TEdit; }
    ed_cod_cliente.ClassName; { ed_cod_cliente: TEdit; }
    btListarFaturas.ClassName; { btListarFaturas: TBitBtn; }
    Panel4.ClassName; { Panel4: TPanel; }
    cxGrid.ClassName; { cxGrid: TcxGrid; }
    cxGridDBTableView1.ClassName; { cxGridDBTableView1: TcxGridDBTableView; }
    cxGridDBTableView1SELECAO.ClassName; { cxGridDBTableView1SELECAO: TcxGridDBColumn; }
    cxGridDBTableView1DATA_FATURA.ClassName; { cxGridDBTableView1DATA_FATURA: TcxGridDBColumn; }
    cxGridDBTableView1HORA.ClassName; { cxGridDBTableView1HORA: TcxGridDBColumn; }
    cxGridDBTableView1DATA_VENCIMENTO.ClassName; { cxGridDBTableView1DATA_VENCIMENTO: TcxGridDBColumn; }
    cxGridDBTableView1USUARIO_INCLUSAO.ClassName; { cxGridDBTableView1USUARIO_INCLUSAO: TcxGridDBColumn; }
    cxGridDBTableView1VALOR_FATURA.ClassName; { cxGridDBTableView1VALOR_FATURA: TcxGridDBColumn; }
    cxGridDBTableView2.ClassName; { cxGridDBTableView2: TcxGridDBTableView; }
    cxGridDBTableView2COD_PRODUTO.ClassName; { cxGridDBTableView2COD_PRODUTO: TcxGridDBColumn; }
    cxGridDBTableView2DESCRICAO.ClassName; { cxGridDBTableView2DESCRICAO: TcxGridDBColumn; }
    cxGridDBTableView2QUANTIDADE_REAL.ClassName; { cxGridDBTableView2QUANTIDADE_REAL: TcxGridDBColumn; }
    cxGridDBTableView2VALOR_UNITARIO.ClassName; { cxGridDBTableView2VALOR_UNITARIO: TcxGridDBColumn; }
    cxGridDBTableView2TOTAL.ClassName; { cxGridDBTableView2TOTAL: TcxGridDBColumn; }
    cxGridLevel2.ClassName; { cxGridLevel2: TcxGridLevel; }
    cxGridLevel1.ClassName; { cxGridLevel1: TcxGridLevel; }
    Panel5.ClassName; { Panel5: TPanel; }
    btDesmarcarTodos.ClassName; { btDesmarcarTodos: TSpeedButton; }
    btMarcarTodos.ClassName; { btMarcarTodos: TSpeedButton; }
    btCalcularTotal.ClassName; { btCalcularTotal: TSpeedButton; }
    Panel6.ClassName; { Panel6: TPanel; }
    Label3.ClassName; { Label3: TLabel; }
    Label5.ClassName; { Label5: TLabel; }
    edTotalAberto.ClassName; { edTotalAberto: TCurrencyEdit; }
    edTotalSelecionadas.ClassName; { edTotalSelecionadas: TCurrencyEdit; }
    Panel8.ClassName; { Panel8: TPanel; }
    btBaixasFaturas.ClassName; { btBaixasFaturas: TSpeedButton; }
    SpeedButton2.ClassName; { SpeedButton2: TSpeedButton; }
    cxStyleRepository1.ClassName; { cxStyleRepository1: TcxStyleRepository; }
    cxStyle1.ClassName; { cxStyle1: TcxStyle; }
    cxStyle2.ClassName; { cxStyle2: TcxStyle; }
    cxStyle3.ClassName; { cxStyle3: TcxStyle; }
  end;

{ frmEncerramentoContasAssinadas: TfrmEncerramentoContasAssinadas }
  with TfrmEncerramentoContasAssinadas(nil) do { uuRecebimentoContaAssinada.pas }
  begin
    botao_pesquisa.ClassName; { botao_pesquisa: TSpeedButton; }
    Edit1.ClassName; { Edit1: TEdit; }
    Panel2.ClassName; { Panel2: TPanel; }
    gp_formas.ClassName; { gp_formas: TGroupBox; }
    Label13.ClassName; { Label13: TLabel; }
    Label14.ClassName; { Label14: TLabel; }
    bt_pesquisa_forma.ClassName; { bt_pesquisa_forma: TSpeedButton; }
    edCodFormaPagamento.ClassName; { edCodFormaPagamento: TEdit; }
    ed_valor_forma.ClassName; { ed_valor_forma: TCurrencyEdit; }
    Panel7.ClassName; { Panel7: TPanel; }
    DBGrid1.ClassName; { DBGrid1: TDBGrid; }
    Panel5.ClassName; { Panel5: TPanel; }
    Label4.ClassName; { Label4: TLabel; }
    edDescricaoForma.ClassName; { edDescricaoForma: TEdit; }
    Panel4.ClassName; { Panel4: TPanel; }
    Label2.ClassName; { Label2: TLabel; }
    Label5.ClassName; { Label5: TLabel; }
    Label6.ClassName; { Label6: TLabel; }
    edTotalFaturas.ClassName; { edTotalFaturas: TCurrencyEdit; }
    edTotalFormas.ClassName; { edTotalFormas: TCurrencyEdit; }
    edTroco.ClassName; { edTroco: TCurrencyEdit; }
    Panel3.ClassName; { Panel3: TPanel; }
    AdvGlassButton1.ClassName; { AdvGlassButton1: TAdvGlassButton; }
    AdvGlassButton3.ClassName; { AdvGlassButton3: TAdvGlassButton; }
    Panel1.ClassName; { Panel1: TPanel; }
    lbTitulo.ClassName; { lbTitulo: TLabel; }
    lbCodCliente.ClassName; { lbCodCliente: TLabel; }
    lbNomeCliente.ClassName; { lbNomeCliente: TLabel; }
    cliques.ClassName; { cliques: TActionList; }
    dsFormasPagtoTemp.ClassName; { dsFormasPagtoTemp: TDataSource; }
    tbFormasPagamentoTemp.ClassName; { tbFormasPagamentoTemp: TRxMemoryData; }
    tbFormasPagamentoTempcodForma.ClassName; { tbFormasPagamentoTempcodForma: TStringField; }
    tbFormasPagamentoTempdescricaoForma.ClassName; { tbFormasPagamentoTempdescricaoForma: TStringField; }
    tbFormasPagamentoTempvalorForma.ClassName; { tbFormasPagamentoTempvalorForma: TCurrencyField; }
    tbFormasPagamentoTemprp.ClassName; { tbFormasPagamentoTemprp: TStringField; }
  end;

{ frmCadPromoters: TfrmCadPromoters }
  with TfrmCadPromoters(nil) do { uuCadPromoter.pas }
  begin
    pn_principal.ClassName; { pn_principal: TPanel; }
    pn_codigo.ClassName; { pn_codigo: TPanel; }
    bt_pesquisa.ClassName; { bt_pesquisa: TSpeedButton; }
    ed_codigo.ClassName; { ed_codigo: TMaskEdit; }
    edNomePromoter.ClassName; { edNomePromoter: TDBEdit; }
    pn_botoes.ClassName; { pn_botoes: TPanel; }
    bt_novo.ClassName; { bt_novo: TBitBtn; }
    bt_alterar.ClassName; { bt_alterar: TBitBtn; }
    bt_gravar.ClassName; { bt_gravar: TBitBtn; }
    bt_cancelar.ClassName; { bt_cancelar: TBitBtn; }
    bt_sair.ClassName; { bt_sair: TBitBtn; }
    bt_excluir.ClassName; { bt_excluir: TBitBtn; }
    bt_consultar.ClassName; { bt_consultar: TBitBtn; }
    bt_imprimir.ClassName; { bt_imprimir: TBitBtn; }
  end;

{ frmCsPromoters: TfrmCsPromoters }
  with TfrmCsPromoters(nil) do { uuCsPromoters.pas }
  begin
    Panel3.ClassName; { Panel3: TPanel; }
    Label1.ClassName; { Label1: TLabel; }
    ed_parametro.ClassName; { ed_parametro: TEdit; }
    RadioGroup1.ClassName; { RadioGroup1: TRadioGroup; }
    Panel1.ClassName; { Panel1: TPanel; }
    DBGrid1.ClassName; { DBGrid1: TDBGrid; }
    Panel2.ClassName; { Panel2: TPanel; }
    bt_selecionar.ClassName; { bt_selecionar: TBitBtn; }
    bt_cancelar.ClassName; { bt_cancelar: TBitBtn; }
  end;

{ frmCsSituacaoDocumento: TfrmCsSituacaoDocumento }
  with TfrmCsSituacaoDocumento(nil) do { uuCsSituacaoDocumento.pas }
  begin
    Panel3.ClassName; { Panel3: TPanel; }
    Label1.ClassName; { Label1: TLabel; }
    Label2.ClassName; { Label2: TLabel; }
    ed_parametro.ClassName; { ed_parametro: TEdit; }
    RadioGroup1.ClassName; { RadioGroup1: TRadioGroup; }
    Panel1.ClassName; { Panel1: TPanel; }
    DBGrid1.ClassName; { DBGrid1: TDBGrid; }
    Panel2.ClassName; { Panel2: TPanel; }
    bt_selecionar.ClassName; { bt_selecionar: TBitBtn; }
    bt_cancelar.ClassName; { bt_cancelar: TBitBtn; }
  end;

{ frmCadGruposTouch: TfrmCadGruposTouch }
  with TfrmCadGruposTouch(nil) do { uuCadGruposTouch.pas }
  begin
    pn_principal.ClassName; { pn_principal: TPanel; }
    pn_codigo.ClassName; { pn_codigo: TPanel; }
    bt_pesquisa.ClassName; { bt_pesquisa: TSpeedButton; }
    ed_codigo.ClassName; { ed_codigo: TMaskEdit; }
    Panel1.ClassName; { Panel1: TPanel; }
    Label6.ClassName; { Label6: TLabel; }
    edDescGrupoTouch.ClassName; { edDescGrupoTouch: TDBEdit; }
    pn_botoes.ClassName; { pn_botoes: TPanel; }
    bt_novo.ClassName; { bt_novo: TBitBtn; }
    bt_alterar.ClassName; { bt_alterar: TBitBtn; }
    bt_gravar.ClassName; { bt_gravar: TBitBtn; }
    bt_cancelar.ClassName; { bt_cancelar: TBitBtn; }
    bt_sair.ClassName; { bt_sair: TBitBtn; }
    bt_excluir.ClassName; { bt_excluir: TBitBtn; }
    bt_consultar.ClassName; { bt_consultar: TBitBtn; }
    bt_imprimir.ClassName; { bt_imprimir: TBitBtn; }
  end;

{ frmCsGruposTouch: TfrmCsGruposTouch }
  with TfrmCsGruposTouch(nil) do { uuCsGruposTouch.pas }
  begin
    Panel3.ClassName; { Panel3: TPanel; }
    Label1.ClassName; { Label1: TLabel; }
    ed_parametro.ClassName; { ed_parametro: TEdit; }
    RadioGroup1.ClassName; { RadioGroup1: TRadioGroup; }
    Panel1.ClassName; { Panel1: TPanel; }
    DBGrid1.ClassName; { DBGrid1: TDBGrid; }
    Panel2.ClassName; { Panel2: TPanel; }
    bt_selecionar.ClassName; { bt_selecionar: TBitBtn; }
    bt_cancelar.ClassName; { bt_cancelar: TBitBtn; }
  end;

{ frmManifestacaoNFE: TfrmManifestacaoNFE }
  with TfrmManifestacaoNFE(nil) do { uuCapturaXMLNFE.pas }
  begin
    botao_pesquisa.ClassName; { botao_pesquisa: TSpeedButton; }
    Edit1.ClassName; { Edit1: TEdit; }
    WebBrowser1.ClassName; { WebBrowser1: TWebBrowser; }
    Memo2.ClassName; { Memo2: TMemo; }
    Panel3.ClassName; { Panel3: TPanel; }
    pgControle.ClassName; { pgControle: TJvPageList; }
    pgManifestacao.ClassName; { pgManifestacao: TJvStandardPage; }
    Panel4.ClassName; { Panel4: TPanel; }
    Label5.ClassName; { Label5: TLabel; }
    lbDescricaoEmpresa.ClassName; { lbDescricaoEmpresa: TLabel; }
    CheckBox1.ClassName; { CheckBox1: TCheckBox; }
    pnPegarXML.ClassName; { pnPegarXML: TPanel; }
    Label3.ClassName; { Label3: TLabel; }
    Label9.ClassName; { Label9: TLabel; }
    btPesquisar.ClassName; { btPesquisar: TPngSpeedButton; }
    PngSpeedButton4.ClassName; { PngSpeedButton4: TPngSpeedButton; }
    PngSpeedButton5.ClassName; { PngSpeedButton5: TPngSpeedButton; }
    PngSpeedButton6.ClassName; { PngSpeedButton6: TPngSpeedButton; }
    btAssociar.ClassName; { btAssociar: TPngSpeedButton; }
    PngSpeedButton8.ClassName; { PngSpeedButton8: TPngSpeedButton; }
    btConsultarSefaz.ClassName; { btConsultarSefaz: TPngSpeedButton; }
    btnNovaConsulta.ClassName; { btnNovaConsulta: TBitBtn; }
    GroupBox2.ClassName; { GroupBox2: TGroupBox; }
    Panel2.ClassName; { Panel2: TPanel; }
    rdMesAtual.ClassName; { rdMesAtual: TRadioButton; }
    rdAnoAtual.ClassName; { rdAnoAtual: TRadioButton; }
    rdEscolherPeriodo.ClassName; { rdEscolherPeriodo: TRadioButton; }
    rdMesSelecionado.ClassName; { rdMesSelecionado: TRadioButton; }
    pglSelecaoDatas.ClassName; { pglSelecaoDatas: TJvPageList; }
    pgSelecaoPeriodo.ClassName; { pgSelecaoPeriodo: TJvStandardPage; }
    Label2.ClassName; { Label2: TLabel; }
    Label1.ClassName; { Label1: TLabel; }
    edAte.ClassName; { edAte: TDateEdit; }
    edDe.ClassName; { edDe: TDateEdit; }
    pgSelecaoMes.ClassName; { pgSelecaoMes: TJvStandardPage; }
    Label21.ClassName; { Label21: TLabel; }
    cbMes.ClassName; { cbMes: TComboBox; }
    cbAno.ClassName; { cbAno: TComboBox; }
    pgSelecaoDatasNaoExibir.ClassName; { pgSelecaoDatasNaoExibir: TJvStandardPage; }
    pgNaoExibir.ClassName; { pgNaoExibir: TJvStandardPage; }
    rdMesAnterior.ClassName; { rdMesAnterior: TRadioButton; }
    gpChave.ClassName; { gpChave: TGroupBox; }
    Panel8.ClassName; { Panel8: TPanel; }
    edChaveNFE.ClassName; { edChaveNFE: TEdit; }
    edRazaoSocial.ClassName; { edRazaoSocial: TEdit; }
    edNumeroNota.ClassName; { edNumeroNota: TEdit; }
    rdTipoDocumento.ClassName; { rdTipoDocumento: TRadioGroup; }
    pnOpcoesGrid.ClassName; { pnOpcoesGrid: TPanel; }
    Label4.ClassName; { Label4: TLabel; }
    pglistOpcoesGrid.ClassName; { pglistOpcoesGrid: TJvPageList; }
    pgOpcoesManifestacao.ClassName; { pgOpcoesManifestacao: TJvStandardPage; }
    PngSpeedButton12.ClassName; { PngSpeedButton12: TPngSpeedButton; }
    PngSpeedButton13.ClassName; { PngSpeedButton13: TPngSpeedButton; }
    PngSpeedButton11.ClassName; { PngSpeedButton11: TPngSpeedButton; }
    PngSpeedButton10.ClassName; { PngSpeedButton10: TPngSpeedButton; }
    PngSpeedButton9.ClassName; { PngSpeedButton9: TPngSpeedButton; }
    Panel1.ClassName; { Panel1: TPanel; }
    Label13.ClassName; { Label13: TLabel; }
    Label14.ClassName; { Label14: TLabel; }
    pgLancamentoFrete.ClassName; { pgLancamentoFrete: TJvStandardPage; }
    btDesistirLancamentoCTE.ClassName; { btDesistirLancamentoCTE: TPngSpeedButton; }
    btConfirmaLancamentoCTE.ClassName; { btConfirmaLancamentoCTE: TPngSpeedButton; }
    Panel7.ClassName; { Panel7: TPanel; }
    Label15.ClassName; { Label15: TLabel; }
    Label16.ClassName; { Label16: TLabel; }
    rdTipoFrete.ClassName; { rdTipoFrete: TRadioGroup; }
    pnlGrid.ClassName; { pnlGrid: TPanel; }
    lbMensagens.ClassName; { lbMensagens: TLabel; }
    memoRespWS.ClassName; { memoRespWS: TMemo; }
    pgListGrid.ClassName; { pgListGrid: TJvPageList; }
    pgGridNotas.ClassName; { pgGridNotas: TJvStandardPage; }
    cxGrid1.ClassName; { cxGrid1: TcxGrid; }
    cxGrid1DBTableView1.ClassName; { cxGrid1DBTableView1: TcxGridDBTableView; }
    cxGrid1DBTableView1Column1.ClassName; { cxGrid1DBTableView1Column1: TcxGridDBColumn; }
    cxGrid1DBTableView1Column2.ClassName; { cxGrid1DBTableView1Column2: TcxGridDBColumn; }
    cxGrid1DBTableView1Column3.ClassName; { cxGrid1DBTableView1Column3: TcxGridDBColumn; }
    cxGrid1DBTableView1Column5.ClassName; { cxGrid1DBTableView1Column5: TcxGridDBColumn; }
    cxGrid1DBTableView1Column4.ClassName; { cxGrid1DBTableView1Column4: TcxGridDBColumn; }
    cxGrid1DBTableView1Column12.ClassName; { cxGrid1DBTableView1Column12: TcxGridDBColumn; }
    cxGrid1DBTableView1Column6.ClassName; { cxGrid1DBTableView1Column6: TcxGridDBColumn; }
    cxGrid1DBTableView1Column8.ClassName; { cxGrid1DBTableView1Column8: TcxGridDBColumn; }
    cxGrid1DBTableView1Column7.ClassName; { cxGrid1DBTableView1Column7: TcxGridDBColumn; }
    cxGrid1DBTableView1Column10.ClassName; { cxGrid1DBTableView1Column10: TcxGridDBColumn; }
    cxGrid1DBTableView1Column11.ClassName; { cxGrid1DBTableView1Column11: TcxGridDBColumn; }
    cxGrid1Level1.ClassName; { cxGrid1Level1: TcxGridLevel; }
    pnAguarde.ClassName; { pnAguarde: TPanel; }
    pgConsulta.ClassName; { pgConsulta: TJvPageList; }
    pgDadosConsulta.ClassName; { pgDadosConsulta: TJvStandardPage; }
    Panel9.ClassName; { Panel9: TPanel; }
    Label6.ClassName; { Label6: TLabel; }
    ckbConsultarNFE.ClassName; { ckbConsultarNFE: TCheckBox; }
    ckbConsultarCTES.ClassName; { ckbConsultarCTES: TCheckBox; }
    btImprimirInventario.ClassName; { btImprimirInventario: TAdvGlassButton; }
    AdvGlassButton1.ClassName; { AdvGlassButton1: TAdvGlassButton; }
    rdUltNSU.ClassName; { rdUltNSU: TRadioGroup; }
    pnUltNSUNFE.ClassName; { pnUltNSUNFE: TPanel; }
    lbUltNsuNFE.ClassName; { lbUltNsuNFE: TLabel; }
    PngSpeedButton1.ClassName; { PngSpeedButton1: TPngSpeedButton; }
    RadioGroup1.ClassName; { RadioGroup1: TRadioGroup; }
    Panel5.ClassName; { Panel5: TPanel; }
    PngSpeedButton2.ClassName; { PngSpeedButton2: TPngSpeedButton; }
    lbUltNsuCTE.ClassName; { lbUltNsuCTE: TLabel; }
    pgConsultando.ClassName; { pgConsultando: TJvStandardPage; }
    prog.ClassName; { prog: TAdvCircularProgress; }
    Image1.ClassName; { Image1: TImage; }
    Label17.ClassName; { Label17: TLabel; }
    Label18.ClassName; { Label18: TLabel; }
    lbTempoDecorrido.ClassName; { lbTempoDecorrido: TLabel; }
    Panel10.ClassName; { Panel10: TPanel; }
    Label7.ClassName; { Label7: TLabel; }
    RadioGroup3.ClassName; { RadioGroup3: TRadioGroup; }
    Panel11.ClassName; { Panel11: TPanel; }
    lbNsuNfeAtual.ClassName; { lbNsuNfeAtual: TLabel; }
    Panel12.ClassName; { Panel12: TPanel; }
    Label10.ClassName; { Label10: TLabel; }
    PngSpeedButton3.ClassName; { PngSpeedButton3: TPngSpeedButton; }
    RadioGroup4.ClassName; { RadioGroup4: TRadioGroup; }
    Panel13.ClassName; { Panel13: TPanel; }
    lbNsucteAtual.ClassName; { lbNsucteAtual: TLabel; }
    pgProcessandoXML.ClassName; { pgProcessandoXML: TJvStandardPage; }
    lbNotaAtual.ClassName; { lbNotaAtual: TLabel; }
    Panel14.ClassName; { Panel14: TPanel; }
    Label8.ClassName; { Label8: TLabel; }
    progProcessando.ClassName; { progProcessando: TProgressBar; }
    pgExportando.ClassName; { pgExportando: TJvStandardPage; }
    Panel6.ClassName; { Panel6: TPanel; }
    Label12.ClassName; { Label12: TLabel; }
    pgExporta.ClassName; { pgExporta: TProgressBar; }
    pgLancamentoNota.ClassName; { pgLancamentoNota: TJvStandardPage; }
    Panel21.ClassName; { Panel21: TPanel; }
    Label36.ClassName; { Label36: TLabel; }
    lbRazaoSocialFornecedor.ClassName; { lbRazaoSocialFornecedor: TLabel; }
    Label38.ClassName; { Label38: TLabel; }
    lbNumeroNotaFiscal.ClassName; { lbNumeroNotaFiscal: TLabel; }
    Label19.ClassName; { Label19: TLabel; }
    lbSerieNotaFiscal.ClassName; { lbSerieNotaFiscal: TLabel; }
    Label42.ClassName; { Label42: TLabel; }
    Label43.ClassName; { Label43: TLabel; }
    lbChaveNotaFiscal.ClassName; { lbChaveNotaFiscal: TLabel; }
    lbDataEmissaoNFE.ClassName; { lbDataEmissaoNFE: TLabel; }
    pnProdutosNFE.ClassName; { pnProdutosNFE: TPanel; }
    pgItensNota.ClassName; { pgItensNota: TJvPageList; }
    pgGridItensNota.ClassName; { pgGridItensNota: TJvStandardPage; }
    Panel16.ClassName; { Panel16: TPanel; }
    Label23.ClassName; { Label23: TLabel; }
    cxGrid2.ClassName; { cxGrid2: TcxGrid; }
    cxGridDBTableView1.ClassName; { cxGridDBTableView1: TcxGridDBTableView; }
    cxGridDBTableView1ordem.ClassName; { cxGridDBTableView1ordem: TcxGridDBColumn; }
    cxGridDBTableView1codProduto.ClassName; { cxGridDBTableView1codProduto: TcxGridDBColumn; }
    cxGridDBTableView1descricaoProduto.ClassName; { cxGridDBTableView1descricaoProduto: TcxGridDBColumn; }
    cxGridDBTableView1CFOP.ClassName; { cxGridDBTableView1CFOP: TcxGridDBColumn; }
    cxGridDBTableView1CST.ClassName; { cxGridDBTableView1CST: TcxGridDBColumn; }
    cxGridDBTableView1Quantidade.ClassName; { cxGridDBTableView1Quantidade: TcxGridDBColumn; }
    cxGridDBTableView1SiglaUnidade.ClassName; { cxGridDBTableView1SiglaUnidade: TcxGridDBColumn; }
    cxGridDBTableView1Preco.ClassName; { cxGridDBTableView1Preco: TcxGridDBColumn; }
    cxGridDBTableView1Desconto.ClassName; { cxGridDBTableView1Desconto: TcxGridDBColumn; }
    cxGridDBTableView1ValorIPI.ClassName; { cxGridDBTableView1ValorIPI: TcxGridDBColumn; }
    cxGridDBTableView1ValorICMS.ClassName; { cxGridDBTableView1ValorICMS: TcxGridDBColumn; }
    cxGridDBTableView1ValorICMSST.ClassName; { cxGridDBTableView1ValorICMSST: TcxGridDBColumn; }
    cxGridDBTableView1OutrasDespesas.ClassName; { cxGridDBTableView1OutrasDespesas: TcxGridDBColumn; }
    cxGridDBTableView1DescricaoUnidade.ClassName; { cxGridDBTableView1DescricaoUnidade: TcxGridDBColumn; }
    cxGridDBTableView1ParametroUnidade.ClassName; { cxGridDBTableView1ParametroUnidade: TcxGridDBColumn; }
    cxGridDBTableView1BaseICMS.ClassName; { cxGridDBTableView1BaseICMS: TcxGridDBColumn; }
    cxGridDBTableView1AliquotaICMS.ClassName; { cxGridDBTableView1AliquotaICMS: TcxGridDBColumn; }
    cxGridDBTableView1BaseICMSST.ClassName; { cxGridDBTableView1BaseICMSST: TcxGridDBColumn; }
    cxGridDBTableView1AliquotaICMSST.ClassName; { cxGridDBTableView1AliquotaICMSST: TcxGridDBColumn; }
    cxGridDBTableView1AliquotaIPI.ClassName; { cxGridDBTableView1AliquotaIPI: TcxGridDBColumn; }
    cxGridLevel1.ClassName; { cxGridLevel1: TcxGridLevel; }
    Panel17.ClassName; { Panel17: TPanel; }
    Panel24.ClassName; { Panel24: TPanel; }
    Label35.ClassName; { Label35: TLabel; }
    Panel25.ClassName; { Panel25: TPanel; }
    Label22.ClassName; { Label22: TLabel; }
    edDataEntradaNFE.ClassName; { edDataEntradaNFE: TAdvDateTimePicker; }
    Panel18.ClassName; { Panel18: TPanel; }
    pnTotaisNFE.ClassName; { pnTotaisNFE: TPanel; }
    pnOutrasDesp.ClassName; { pnOutrasDesp: TPanel; }
    Label32.ClassName; { Label32: TLabel; }
    edTotalOutrasDespesasNFE.ClassName; { edTotalOutrasDespesasNFE: TJvValidateEdit; }
    pnTotalBaseICMSNFE.ClassName; { pnTotalBaseICMSNFE: TPanel; }
    Label26.ClassName; { Label26: TLabel; }
    edTotalBaseICMSNFE.ClassName; { edTotalBaseICMSNFE: TJvValidateEdit; }
    pnTotalBaseICMSST.ClassName; { pnTotalBaseICMSST: TPanel; }
    Label27.ClassName; { Label27: TLabel; }
    edTotalBaseICMSSTNFE.ClassName; { edTotalBaseICMSSTNFE: TJvValidateEdit; }
    pnTotalDesconto.ClassName; { pnTotalDesconto: TPanel; }
    Label33.ClassName; { Label33: TLabel; }
    edTotalDescontoNFE.ClassName; { edTotalDescontoNFE: TJvValidateEdit; }
    pnTotalIPI.ClassName; { pnTotalIPI: TPanel; }
    Label30.ClassName; { Label30: TLabel; }
    edTotalIPINFE.ClassName; { edTotalIPINFE: TJvValidateEdit; }
    pnTotalProdutosNFE.ClassName; { pnTotalProdutosNFE: TPanel; }
    Label24.ClassName; { Label24: TLabel; }
    edTotalProdutosNFE.ClassName; { edTotalProdutosNFE: TJvValidateEdit; }
    pnTotalSeguro.ClassName; { pnTotalSeguro: TPanel; }
    Label31.ClassName; { Label31: TLabel; }
    edTotalSeguroNFE.ClassName; { edTotalSeguroNFE: TJvValidateEdit; }
    pnValorICMSNFE.ClassName; { pnValorICMSNFE: TPanel; }
    Label29.ClassName; { Label29: TLabel; }
    edTotalICMSNFE.ClassName; { edTotalICMSNFE: TJvValidateEdit; }
    PNValorICMSST.ClassName; { PNValorICMSST: TPanel; }
    Label28.ClassName; { Label28: TLabel; }
    edTotalICMSSTNFE.ClassName; { edTotalICMSSTNFE: TJvValidateEdit; }
    pnTotalFreteNFE.ClassName; { pnTotalFreteNFE: TPanel; }
    Label25.ClassName; { Label25: TLabel; }
    edTotalFreteNFE.ClassName; { edTotalFreteNFE: TJvValidateEdit; }
    pnTotalNota.ClassName; { pnTotalNota: TPanel; }
    Label20.ClassName; { Label20: TLabel; }
    edTotalNFE.ClassName; { edTotalNFE: TJvValidateEdit; }
    Panel23.ClassName; { Panel23: TPanel; }
    PngSpeedButton14.ClassName; { PngSpeedButton14: TPngSpeedButton; }
    PngSpeedButton7.ClassName; { PngSpeedButton7: TPngSpeedButton; }
    pnFiltros.ClassName; { pnFiltros: TPanel; }
    Panel15.ClassName; { Panel15: TPanel; }
    Label11.ClassName; { Label11: TLabel; }
    rdManifestacao.ClassName; { rdManifestacao: TRadioGroup; }
    rdXML.ClassName; { rdXML: TRadioGroup; }
    rdLancada.ClassName; { rdLancada: TRadioGroup; }
    rdOrdem.ClassName; { rdOrdem: TRadioGroup; }
    btPequisaInventarios.ClassName; { btPequisaInventarios: TAdvGlassButton; }
    cliques.ClassName; { cliques: TActionList; }
    actlBusca.ClassName; { actlBusca: TJvControlActionList; }
    RxPopupMenu1.ClassName; { RxPopupMenu1: TRxPopupMenu; }
    menuManifestacao.ClassName; { menuManifestacao: TMenuItem; }
    itVisualizarDanfe.ClassName; { itVisualizarDanfe: TMenuItem; }
    itLancarNotasEntrada.ClassName; { itLancarNotasEntrada: TMenuItem; }
    itLancarCTE.ClassName; { itLancarCTE: TMenuItem; }
    itCancelarEntrada.ClassName; { itCancelarEntrada: TMenuItem; }
    N1.ClassName; { N1: TMenuItem; }
    Copiarchave1.ClassName; { Copiarchave1: TMenuItem; }
    S1.ClassName; { S1: TMenuItem; }
    C1.ClassName; { C1: TMenuItem; }
    N2.ClassName; { N2: TMenuItem; }
    S2.ClassName; { S2: TMenuItem; }
    R1.ClassName; { R1: TMenuItem; }
    N3.ClassName; { N3: TMenuItem; }
    cxStyleRepository1.ClassName; { cxStyleRepository1: TcxStyleRepository; }
    cxStyle2.ClassName; { cxStyle2: TcxStyle; }
    stlRegistro.ClassName; { stlRegistro: TcxStyle; }
    stConfirmada.ClassName; { stConfirmada: TcxStyle; }
    stCancelada.ClassName; { stCancelada: TcxStyle; }
    stCiencia.ClassName; { stCiencia: TcxStyle; }
    stSemManifesto.ClassName; { stSemManifesto: TcxStyle; }
    stNaoRealizada.ClassName; { stNaoRealizada: TcxStyle; }
    cxImageList1.ClassName; { cxImageList1: TcxImageList; }
    tmAguarde.ClassName; { tmAguarde: TTimer; }
  end;

{ frmRelRankingProdutosAntes: TfrmRelRankingProdutosAntes }
  with TfrmRelRankingProdutosAntes(nil) do { uuRelRankingProdutos.pas }
  begin
    botao_pesquisa.ClassName; { botao_pesquisa: TSpeedButton; }
    SpeedButton1.ClassName; { SpeedButton1: TSpeedButton; }
    SpeedButton2.ClassName; { SpeedButton2: TSpeedButton; }
    Edit1.ClassName; { Edit1: TEdit; }
    Edit2.ClassName; { Edit2: TEdit; }
    Edit3.ClassName; { Edit3: TEdit; }
    btSelecionar.ClassName; { btSelecionar: TAdvGlassButton; }
    btSair.ClassName; { btSair: TAdvGlassButton; }
    Panel1.ClassName; { Panel1: TPanel; }
    RadioGroup1.ClassName; { RadioGroup1: TRadioGroup; }
    pn_grupos.ClassName; { pn_grupos: TPanel; }
    Label1.ClassName; { Label1: TLabel; }
    Label2.ClassName; { Label2: TLabel; }
    bt_pesq_grupo.ClassName; { bt_pesq_grupo: TSpeedButton; }
    Panel3.ClassName; { Panel3: TPanel; }
    ed_desc_grupo.ClassName; { ed_desc_grupo: TMaskEdit; }
    ed_cod_grupo.ClassName; { ed_cod_grupo: TMaskEdit; }
    rdTipoRel.ClassName; { rdTipoRel: TRadioGroup; }
    rdRanking.ClassName; { rdRanking: TRadioGroup; }
    Panel2.ClassName; { Panel2: TPanel; }
    Label4.ClassName; { Label4: TLabel; }
    Label3.ClassName; { Label3: TLabel; }
    cbk_visualizar.ClassName; { cbk_visualizar: TCheckBox; }
    edDataInicial.ClassName; { edDataInicial: TAdvDateTimePicker; }
    edDataFinal.ClassName; { edDataFinal: TAdvDateTimePicker; }
    GroupBox1.ClassName; { GroupBox1: TGroupBox; }
    cbEmpresas.ClassName; { cbEmpresas: TcxCheckComboBox; }
    pnTitulo.ClassName; { pnTitulo: TPanel; }
    lbTitulo.ClassName; { lbTitulo: TLabel; }
  end;

{ frmCadItemFornecedorEntrada: TfrmCadItemFornecedorEntrada }
  with TfrmCadItemFornecedorEntrada(nil) do { uuCadItemFornecedorEntrada.pas }
  begin
    botao_pesquisa.ClassName; { botao_pesquisa: TSpeedButton; }
    Edit1.ClassName; { Edit1: TEdit; }
    Panel1.ClassName; { Panel1: TPanel; }
    GroupBox1.ClassName; { GroupBox1: TGroupBox; }
    Label1.ClassName; { Label1: TLabel; }
    Label2.ClassName; { Label2: TLabel; }
    Label3.ClassName; { Label3: TLabel; }
    Label4.ClassName; { Label4: TLabel; }
    Label5.ClassName; { Label5: TLabel; }
    Label6.ClassName; { Label6: TLabel; }
    edDescProdutoFornecedor.ClassName; { edDescProdutoFornecedor: TEdit; }
    edCodProdutoFornecedor.ClassName; { edCodProdutoFornecedor: TEdit; }
    edCFOPfornecedor.ClassName; { edCFOPfornecedor: TEdit; }
    edCSTfornecedor.ClassName; { edCSTfornecedor: TEdit; }
    edNCMfornecedor.ClassName; { edNCMfornecedor: TEdit; }
    edUnidFornecedor.ClassName; { edUnidFornecedor: TEdit; }
    edCodFornecedor.ClassName; { edCodFornecedor: TEdit; }
    edNomeFornecedor.ClassName; { edNomeFornecedor: TEdit; }
  end;

{ frmPainelAguarde: TfrmPainelAguarde }
  with TfrmPainelAguarde(nil) do { uuPainelAguarde.pas }
  begin
    Panel1.ClassName; { Panel1: TPanel; }
    lbTempo.ClassName; { lbTempo: TLabel; }
    Panel3.ClassName; { Panel3: TPanel; }
    Label2.ClassName; { Label2: TLabel; }
    Panel2.ClassName; { Panel2: TPanel; }
    Label1.ClassName; { Label1: TLabel; }
    Image1.ClassName; { Image1: TImage; }
    lbMensagem.ClassName; { lbMensagem: TLabel; }
    lbTentativas.ClassName; { lbTentativas: TLabel; }
  end;

{ frmSenhaGarcon: TfrmSenhaGarcon }
  with TfrmSenhaGarcon(nil) do { uuSenhaGarcon.pas }
  begin
    botao_pesquisa.ClassName; { botao_pesquisa: TSpeedButton; }
    Edit1.ClassName; { Edit1: TEdit; }
    AdvTouchKeyboard1.ClassName; { AdvTouchKeyboard1: TAdvTouchKeyboard; }
    Panel1.ClassName; { Panel1: TPanel; }
    Image1.ClassName; { Image1: TImage; }
    Label1.ClassName; { Label1: TLabel; }
    Edit2.ClassName; { Edit2: TEdit; }
    Panel2.ClassName; { Panel2: TPanel; }
    Label2.ClassName; { Label2: TLabel; }
  end;

{ frmLeCartaoLancamento: TfrmLeCartaoLancamento }
  with TfrmLeCartaoLancamento(nil) do { uuLeCartaoLancamento.pas }
  begin
    botao_pesquisa.ClassName; { botao_pesquisa: TSpeedButton; }
    img_estado_cartao.ClassName; { img_estado_cartao: TImage; }
    Edit1.ClassName; { Edit1: TEdit; }
    Panel2.ClassName; { Panel2: TPanel; }
    edNumeroCartao.ClassName; { edNumeroCartao: TEdit; }
    Timer1.ClassName; { Timer1: TTimer; }
    tmClear.ClassName; { tmClear: TTimer; }
  end;

{ frmRelEstatisticoPeriodo: TfrmRelEstatisticoPeriodo }
  with TfrmRelEstatisticoPeriodo(nil) do { uuRelEstatisticoPeriodo.pas }
  begin
    botao_pesquisa.ClassName; { botao_pesquisa: TSpeedButton; }
    SpeedButton1.ClassName; { SpeedButton1: TSpeedButton; }
    SpeedButton2.ClassName; { SpeedButton2: TSpeedButton; }
    Edit1.ClassName; { Edit1: TEdit; }
    Edit2.ClassName; { Edit2: TEdit; }
    Edit3.ClassName; { Edit3: TEdit; }
    btSair.ClassName; { btSair: TAdvGlassButton; }
    btSelecionar.ClassName; { btSelecionar: TAdvGlassButton; }
    pnn.ClassName; { pnn: TPanel; }
    Label3.ClassName; { Label3: TLabel; }
    RadioGroup1.ClassName; { RadioGroup1: TRadioGroup; }
    Panel2.ClassName; { Panel2: TPanel; }
    Label2.ClassName; { Label2: TLabel; }
    Label1.ClassName; { Label1: TLabel; }
    ed_data_inicial.ClassName; { ed_data_inicial: TAdvDateTimePicker; }
    ed_data_final.ClassName; { ed_data_final: TAdvDateTimePicker; }
    GroupBox1.ClassName; { GroupBox1: TGroupBox; }
    Panel3.ClassName; { Panel3: TPanel; }
    ckbSegunda.ClassName; { ckbSegunda: TCheckBox; }
    ckbTerca.ClassName; { ckbTerca: TCheckBox; }
    ckbQuarta.ClassName; { ckbQuarta: TCheckBox; }
    ckbQuinta.ClassName; { ckbQuinta: TCheckBox; }
    ckbSexta.ClassName; { ckbSexta: TCheckBox; }
    ckbDomingo.ClassName; { ckbDomingo: TCheckBox; }
    ckbSabado.ClassName; { ckbSabado: TCheckBox; }
    ckbTodos.ClassName; { ckbTodos: TCheckBox; }
    rdOrdem.ClassName; { rdOrdem: TRadioGroup; }
    rdTipoOrdem.ClassName; { rdTipoOrdem: TRadioGroup; }
    edHoraFinal.ClassName; { edHoraFinal: TcxTimeEdit; }
    edHoraInicial.ClassName; { edHoraInicial: TcxTimeEdit; }
    GroupBox2.ClassName; { GroupBox2: TGroupBox; }
    cbEmpresas.ClassName; { cbEmpresas: TcxCheckComboBox; }
    pnTitulo.ClassName; { pnTitulo: TPanel; }
    lbTitulo.ClassName; { lbTitulo: TLabel; }
    cliques.ClassName; { cliques: TActionList; }
    actlBusca.ClassName; { actlBusca: TJvControlActionList; }
  end;

{ frm_modelo_rel_datas: Tfrm_modelo_rel_datas }
  with Tfrm_modelo_rel_datas(nil) do { frm_modelo_rel_datasa.pas }
  begin
    frm_modelo_rel_datas.ClassName; { frm_modelo_rel_datas: TPanel; }
    RadioGroup1.ClassName; { RadioGroup1: TRadioGroup; }
    Panel5.ClassName; { Panel5: TPanel; }
    Label1.ClassName; { Label1: TLabel; }
    Label2.ClassName; { Label2: TLabel; }
    ed_data_inicial.ClassName; { ed_data_inicial: TMaskEdit; }
    ed_data_final.ClassName; { ed_data_final: TMaskEdit; }
    Panel2.ClassName; { Panel2: TPanel; }
    bt_imprimir.ClassName; { bt_imprimir: TBitBtn; }
    bt_sair.ClassName; { bt_sair: TBitBtn; }
  end;

{ frmCadGruposObs: TfrmCadGruposObs }
  with TfrmCadGruposObs(nil) do { uuCadGruposObservacao.pas }
  begin
    pn_principal.ClassName; { pn_principal: TPanel; }
    pn_codigo.ClassName; { pn_codigo: TPanel; }
    bt_pesquisa.ClassName; { bt_pesquisa: TSpeedButton; }
    ed_codigo.ClassName; { ed_codigo: TMaskEdit; }
    Panel1.ClassName; { Panel1: TPanel; }
    Label6.ClassName; { Label6: TLabel; }
    edDescGrupoTouch.ClassName; { edDescGrupoTouch: TDBEdit; }
    pn_botoes.ClassName; { pn_botoes: TPanel; }
    bt_novo.ClassName; { bt_novo: TBitBtn; }
    bt_alterar.ClassName; { bt_alterar: TBitBtn; }
    bt_gravar.ClassName; { bt_gravar: TBitBtn; }
    bt_cancelar.ClassName; { bt_cancelar: TBitBtn; }
    bt_sair.ClassName; { bt_sair: TBitBtn; }
    bt_excluir.ClassName; { bt_excluir: TBitBtn; }
    bt_consultar.ClassName; { bt_consultar: TBitBtn; }
    bt_imprimir.ClassName; { bt_imprimir: TBitBtn; }
  end;

{ frmAuditoriaCartoes: TfrmAuditoriaCartoes }
  with TfrmAuditoriaCartoes(nil) do { uuAuditoriaCartoes.pas }
  begin
    botao_pesquisa.ClassName; { botao_pesquisa: TSpeedButton; }
    Edit1.ClassName; { Edit1: TEdit; }
    pnl1.ClassName; { pnl1: TPanel; }
    lbl1.ClassName; { lbl1: TLabel; }
    pnl2.ClassName; { pnl2: TPanel; }
    edtNumeroCartao.ClassName; { edtNumeroCartao: TEdit; }
    pnl3.ClassName; { pnl3: TPanel; }
    dbgrd1.ClassName; { dbgrd1: TDBGrid; }
    pnl4.ClassName; { pnl4: TPanel; }
    btnLibera.ClassName; { btnLibera: TBitBtn; }
    btn1.ClassName; { btn1: TBitBtn; }
    tbCartoes.ClassName; { tbCartoes: TRxMemoryData; }
    strngfldCartoescartao.ClassName; { strngfldCartoescartao: TStringField; }
    ds1.ClassName; { ds1: TDataSource; }
  end;

{ frmRelResCaixaTurno: TfrmRelResCaixaTurno }
  with TfrmRelResCaixaTurno(nil) do { uuRelResCaixaTurno.pas }
  begin
    botao_pesquisa.ClassName; { botao_pesquisa: TSpeedButton; }
    SpeedButton1.ClassName; { SpeedButton1: TSpeedButton; }
    SpeedButton2.ClassName; { SpeedButton2: TSpeedButton; }
    Edit1.ClassName; { Edit1: TEdit; }
    Edit2.ClassName; { Edit2: TEdit; }
    Edit3.ClassName; { Edit3: TEdit; }
    BitBtn1.ClassName; { BitBtn1: TBitBtn; }
    BitBtn2.ClassName; { BitBtn2: TBitBtn; }
    Panel1.ClassName; { Panel1: TPanel; }
    RadioGroup1.ClassName; { RadioGroup1: TRadioGroup; }
    Panel5.ClassName; { Panel5: TPanel; }
    Label3.ClassName; { Label3: TLabel; }
    Label4.ClassName; { Label4: TLabel; }
    ed_data_inicial.ClassName; { ed_data_inicial: TMaskEdit; }
    ed_data_final.ClassName; { ed_data_final: TMaskEdit; }
    cbk_visualizar.ClassName; { cbk_visualizar: TCheckBox; }
    rdTurno.ClassName; { rdTurno: TRadioGroup; }
    rdTipo.ClassName; { rdTipo: TRadioGroup; }
  end;

{ frm_entradas: Tfrm_entradas }
  with Tfrm_entradas(nil) do { uu_entradas.pas }
  begin
    pn_principal.ClassName; { pn_principal: TPanel; }
    pn_codigo.ClassName; { pn_codigo: TPanel; }
    bt_pesquisa.ClassName; { bt_pesquisa: TSpeedButton; }
    Label7.ClassName; { Label7: TLabel; }
    ed_codigo.ClassName; { ed_codigo: TMaskEdit; }
    pn_campos.ClassName; { pn_campos: TPanel; }
    pnNota.ClassName; { pnNota: TPanel; }
    GroupBox2.ClassName; { GroupBox2: TGroupBox; }
    Label32.ClassName; { Label32: TLabel; }
    Label33.ClassName; { Label33: TLabel; }
    Label35.ClassName; { Label35: TLabel; }
    Label36.ClassName; { Label36: TLabel; }
    Label37.ClassName; { Label37: TLabel; }
    Label38.ClassName; { Label38: TLabel; }
    Label39.ClassName; { Label39: TLabel; }
    Label5.ClassName; { Label5: TLabel; }
    Label25.ClassName; { Label25: TLabel; }
    Label26.ClassName; { Label26: TLabel; }
    Label44.ClassName; { Label44: TLabel; }
    edBaseCalculoICMS.ClassName; { edBaseCalculoICMS: TDBEdit; }
    edValorICMS.ClassName; { edValorICMS: TDBEdit; }
    edBaseCalculoICMSSubst.ClassName; { edBaseCalculoICMSSubst: TDBEdit; }
    edValorICMSSubst.ClassName; { edValorICMSSubst: TDBEdit; }
    edValorProdutos.ClassName; { edValorProdutos: TDBEdit; }
    edValorFrete.ClassName; { edValorFrete: TDBEdit; }
    edValorSeguro.ClassName; { edValorSeguro: TDBEdit; }
    edValorDesconto.ClassName; { edValorDesconto: TDBEdit; }
    edOutrasDespesas.ClassName; { edOutrasDespesas: TDBEdit; }
    edValorIPI.ClassName; { edValorIPI: TDBEdit; }
    Panel7.ClassName; { Panel7: TPanel; }
    edTotalNotaFiscal.ClassName; { edTotalNotaFiscal: TDBEdit; }
    pnCabecalho.ClassName; { pnCabecalho: TPanel; }
    Label30.ClassName; { Label30: TLabel; }
    edDataEntradaNotaFiscal.ClassName; { edDataEntradaNotaFiscal: TDBDateEdit; }
    DBGrid1.ClassName; { DBGrid1: TDBGrid; }
    Panel16.ClassName; { Panel16: TPanel; }
    Label4.ClassName; { Label4: TLabel; }
    Panel2.ClassName; { Panel2: TPanel; }
    Label6.ClassName; { Label6: TLabel; }
    pnFornecedor.ClassName; { pnFornecedor: TPanel; }
    Panel1.ClassName; { Panel1: TPanel; }
    Panel3.ClassName; { Panel3: TPanel; }
    Label1.ClassName; { Label1: TLabel; }
    Label2.ClassName; { Label2: TLabel; }
    lbNumeroNotaFiscal.ClassName; { lbNumeroNotaFiscal: TLabel; }
    lbRazaoSocialFornecedor.ClassName; { lbRazaoSocialFornecedor: TLabel; }
    Label3.ClassName; { Label3: TLabel; }
    lbSerieNotaFiscal.ClassName; { lbSerieNotaFiscal: TLabel; }
    Label23.ClassName; { Label23: TLabel; }
    lbChaveNotaFiscal.ClassName; { lbChaveNotaFiscal: TLabel; }
    Label27.ClassName; { Label27: TLabel; }
    lbDataEmissaoNFE.ClassName; { lbDataEmissaoNFE: TLabel; }
    pn_botoes.ClassName; { pn_botoes: TPanel; }
    bt_novo.ClassName; { bt_novo: TBitBtn; }
    bt_alterar.ClassName; { bt_alterar: TBitBtn; }
    bt_gravar.ClassName; { bt_gravar: TBitBtn; }
    bt_cancelar.ClassName; { bt_cancelar: TBitBtn; }
    bt_sair.ClassName; { bt_sair: TBitBtn; }
    bt_excluir.ClassName; { bt_excluir: TBitBtn; }
    bt_consultar.ClassName; { bt_consultar: TBitBtn; }
    bt_imprimir.ClassName; { bt_imprimir: TBitBtn; }
    Panel8.ClassName; { Panel8: TPanel; }
    Label22.ClassName; { Label22: TLabel; }
  end;

{ frmFrenteCaixa: TfrmFrenteCaixa }
  with TfrmFrenteCaixa(nil) do { uuFrenteCaixa.pas }
  begin
    SpeedButton3.ClassName; { SpeedButton3: TSpeedButton; }
    memo_codigos_formas.ClassName; { memo_codigos_formas: TMemo; }
    Panel2.ClassName; { Panel2: TPanel; }
    lb_hora.ClassName; { lb_hora: TLabel; }
    pgListPrincipal.ClassName; { pgListPrincipal: TJvPageList; }
    pgMovimentoCaixa.ClassName; { pgMovimentoCaixa: TJvStandardPage; }
    pnMovimentoMesa.ClassName; { pnMovimentoMesa: TPanel; }
    lb_cod_produto.ClassName; { lb_cod_produto: TLabel; }
    Panel4.ClassName; { Panel4: TPanel; }
    Label8.ClassName; { Label8: TLabel; }
    AdvOfficeImage1.ClassName; { AdvOfficeImage1: TAdvOfficeImage; }
    Label7.ClassName; { Label7: TLabel; }
    lbHora.ClassName; { lbHora: TLabel; }
    lbNomeUsuario.ClassName; { lbNomeUsuario: TLabel; }
    AdvOfficeImage2.ClassName; { AdvOfficeImage2: TAdvOfficeImage; }
    AdvOfficeImage3.ClassName; { AdvOfficeImage3: TAdvOfficeImage; }
    lbDataSistema.ClassName; { lbDataSistema: TLabel; }
    AdvOfficeImage4.ClassName; { AdvOfficeImage4: TAdvOfficeImage; }
    lbNumeroEstacao.ClassName; { lbNumeroEstacao: TLabel; }
    AdvOfficeImage5.ClassName; { AdvOfficeImage5: TAdvOfficeImage; }
    ed_total_conta.ClassName; { ed_total_conta: TCurrencyEdit; }
    Panel16.ClassName; { Panel16: TPanel; }
    imgGrupo.ClassName; { imgGrupo: TImage; }
    pnQtde.ClassName; { pnQtde: TPanel; }
    Label6.ClassName; { Label6: TLabel; }
    Label2.ClassName; { Label2: TLabel; }
    Label13.ClassName; { Label13: TLabel; }
    Label12.ClassName; { Label12: TLabel; }
    Label1.ClassName; { Label1: TLabel; }
    ed_quantidade.ClassName; { ed_quantidade: TCurrencyEdit; }
    edValorUnitario.ClassName; { edValorUnitario: TCurrencyEdit; }
    edTotalProduto.ClassName; { edTotalProduto: TCurrencyEdit; }
    pnDescricaoProduto.ClassName; { pnDescricaoProduto: TPanel; }
    Label3.ClassName; { Label3: TLabel; }
    ed_descricao_produto.ClassName; { ed_descricao_produto: TEdit; }
    pnBotoes.ClassName; { pnBotoes: TPanel; }
    Label4.ClassName; { Label4: TLabel; }
    btFecharConta.ClassName; { btFecharConta: TJvTransparentButton; }
    B20002003.ClassName; { B20002003: TJvTransparentButton; }
    btOperacoesCaixa.ClassName; { btOperacoesCaixa: TJvTransparentButton; }
    JvTransparentButton2.ClassName; { JvTransparentButton2: TJvTransparentButton; }
    btAcessoDelivery.ClassName; { btAcessoDelivery: TJvTransparentButton; }
    pnGrupos.ClassName; { pnGrupos: TPanel; }
    Label9.ClassName; { Label9: TLabel; }
    PngSpeedButton1.ClassName; { PngSpeedButton1: TPngSpeedButton; }
    JvTransparentButton1.ClassName; { JvTransparentButton1: TPngSpeedButton; }
    JvTransparentButton3.ClassName; { JvTransparentButton3: TPngSpeedButton; }
    dbgGrupos.ClassName; { dbgGrupos: TDBCtrlGrid; }
    Panel1.ClassName; { Panel1: TPanel; }
    DBText1.ClassName; { DBText1: TDBText; }
    pnProdutos.ClassName; { pnProdutos: TPanel; }
    Label11.ClassName; { Label11: TLabel; }
    dbgProdutos.ClassName; { dbgProdutos: TDBCtrlGrid; }
    Panel3.ClassName; { Panel3: TPanel; }
    DBText2.ClassName; { DBText2: TDBText; }
    Panel5.ClassName; { Panel5: TPanel; }
    DBText3.ClassName; { DBText3: TDBText; }
    pnScroll.ClassName; { pnScroll: TPanel; }
    ScrollBox1.ClassName; { ScrollBox1: TAdvScrollBox; }
    painelProdutos.ClassName; { painelProdutos: TAdvPanel; }
    lbOrdem.ClassName; { lbOrdem: TLabel; }
    lbDescricaoProduto.ClassName; { lbDescricaoProduto: TLabel; }
    lbQuantidadeProduto.ClassName; { lbQuantidadeProduto: TLabel; }
    lbX.ClassName; { lbX: TLabel; }
    lbValorUnitarioProduto.ClassName; { lbValorUnitarioProduto: TLabel; }
    lbTotalProduto.ClassName; { lbTotalProduto: TLabel; }
    btDeleteProduto.ClassName; { btDeleteProduto: TPngSpeedButton; }
    btObsProduto.ClassName; { btObsProduto: TPngSpeedButton; }
    lbDescontoItem.ClassName; { lbDescontoItem: TLabel; }
    CurvyPanel1.ClassName; { CurvyPanel1: TCurvyPanel; }
    Label5.ClassName; { Label5: TLabel; }
    ed_cod_produto.ClassName; { ed_cod_produto: TEdit; }
    pgCombos.ClassName; { pgCombos: TJvStandardPage; }
    Panel6.ClassName; { Panel6: TPanel; }
    pnPrincipalCombos.ClassName; { pnPrincipalCombos: TPanel; }
    Panel8.ClassName; { Panel8: TPanel; }
    pnTopoGrupos.ClassName; { pnTopoGrupos: TPanel; }
    Panel7.ClassName; { Panel7: TPanel; }
    Panel10.ClassName; { Panel10: TPanel; }
    DBCtrlGrid2.ClassName; { DBCtrlGrid2: TDBCtrlGrid; }
    Panel17.ClassName; { Panel17: TPanel; }
    DBText5.ClassName; { DBText5: TDBText; }
    DBText6.ClassName; { DBText6: TDBText; }
    Panel12.ClassName; { Panel12: TPanel; }
    Panel9.ClassName; { Panel9: TPanel; }
    Panel13.ClassName; { Panel13: TPanel; }
    pnGruposAdicionais.ClassName; { pnGruposAdicionais: TPanel; }
    pnTitulo.ClassName; { pnTitulo: TPanel; }
    lbTituloGrupoCompo.ClassName; { lbTituloGrupoCompo: TLabel; }
    btSom.ClassName; { btSom: TPngSpeedButton; }
    pnDataHora.ClassName; { pnDataHora: TPanel; }
    Timer1.ClassName; { Timer1: TTimer; }
    ACBrCalculadora1.ClassName; { ACBrCalculadora1: TACBrCalculadora; }
    peed.ClassName; { peed: TImageList; }
  end;

{ frmCancelaItemPDV: TfrmCancelaItemPDV }
  with TfrmCancelaItemPDV(nil) do { uuCancelaItemPDV.pas }
  begin
    botao_pesquisa.ClassName; { botao_pesquisa: TSpeedButton; }
    Edit1.ClassName; { Edit1: TEdit; }
    Panel1.ClassName; { Panel1: TPanel; }
    DBGrid1.ClassName; { DBGrid1: TDBGrid; }
    Panel2.ClassName; { Panel2: TPanel; }
    btConsultarProdutos.ClassName; { btConsultarProdutos: TJvTransparentButton; }
    JvTransparentButton1.ClassName; { JvTransparentButton1: TJvTransparentButton; }
    btConfirmar.ClassName; { btConfirmar: TJvTransparentButton; }
    btDesistir.ClassName; { btDesistir: TJvTransparentButton; }
  end;

{ frmProjecaoVendas: TfrmProjecaoVendas }
  with TfrmProjecaoVendas(nil) do { uuProjecaoVendas.pas }
  begin
    pn_principal.ClassName; { pn_principal: TPanel; }
    pn_codigo.ClassName; { pn_codigo: TPanel; }
    DBGrid1.ClassName; { DBGrid1: TDBGrid; }
    pn_botoes.ClassName; { pn_botoes: TPanel; }
    bt_novo.ClassName; { bt_novo: TBitBtn; }
    bt_alterar.ClassName; { bt_alterar: TBitBtn; }
    bt_gravar.ClassName; { bt_gravar: TBitBtn; }
    bt_cancelar.ClassName; { bt_cancelar: TBitBtn; }
    bt_sair.ClassName; { bt_sair: TBitBtn; }
    bt_excluir.ClassName; { bt_excluir: TBitBtn; }
    bt_consultar.ClassName; { bt_consultar: TBitBtn; }
    bt_imprimir.ClassName; { bt_imprimir: TBitBtn; }
    Panel2.ClassName; { Panel2: TPanel; }
    SpeedButton3.ClassName; { SpeedButton3: TSpeedButton; }
    SpeedButton4.ClassName; { SpeedButton4: TSpeedButton; }
    Panel3.ClassName; { Panel3: TPanel; }
    cal.ClassName; { cal: TMonthCalendar; }
    Panel1.ClassName; { Panel1: TPanel; }
    pnAlterar.ClassName; { pnAlterar: TPanel; }
    Label1.ClassName; { Label1: TLabel; }
    Label2.ClassName; { Label2: TLabel; }
    Label3.ClassName; { Label3: TLabel; }
    SpeedButton1.ClassName; { SpeedButton1: TSpeedButton; }
    SpeedButton2.ClassName; { SpeedButton2: TSpeedButton; }
    Panel5.ClassName; { Panel5: TPanel; }
    edProjInicial.ClassName; { edProjInicial: TDBEdit; }
    edReprojecao.ClassName; { edReprojecao: TDBEdit; }
    edFaturamentoReal.ClassName; { edFaturamentoReal: TDBEdit; }
  end;

{ frmRealApuracaoGrupos: TfrmRealApuracaoGrupos }
  with TfrmRealApuracaoGrupos(nil) do { uuRelApuracaoGrupos.pas }
  begin
    botao_pesquisa.ClassName; { botao_pesquisa: TSpeedButton; }
    Edit1.ClassName; { Edit1: TEdit; }
    RadioGroup1.ClassName; { RadioGroup1: TRadioGroup; }
    BitBtn1.ClassName; { BitBtn1: TBitBtn; }
    BitBtn2.ClassName; { BitBtn2: TBitBtn; }
    edDataFinal.ClassName; { edDataFinal: TDateEdit; }
    cal1.ClassName; { cal1: TMonthCalendar; }
    rdTipoRelatorio.ClassName; { rdTipoRelatorio: TRadioGroup; }
  end;

{ frmObservacaoManifesto: TfrmObservacaoManifesto }
  with TfrmObservacaoManifesto(nil) do { uuObsManifestacao.pas }
  begin
    botao_pesquisa.ClassName; { botao_pesquisa: TSpeedButton; }
    Edit1.ClassName; { Edit1: TEdit; }
    Panel1.ClassName; { Panel1: TPanel; }
    AdvGlassButton1.ClassName; { AdvGlassButton1: TAdvGlassButton; }
    AdvGlassButton3.ClassName; { AdvGlassButton3: TAdvGlassButton; }
    Panel2.ClassName; { Panel2: TPanel; }
    Label1.ClassName; { Label1: TLabel; }
    Label2.ClassName; { Label2: TLabel; }
    Panel3.ClassName; { Panel3: TPanel; }
    memoObservacoes.ClassName; { memoObservacoes: TMemo; }
    cliques.ClassName; { cliques: TActionList; }
  end;

{ frmComparaProdutosNFEFornecedor: TfrmComparaProdutosNFEFornecedor }
  with TfrmComparaProdutosNFEFornecedor(nil) do { uuComparaProdutosNFE.pas }
  begin
    botao_pesquisa.ClassName; { botao_pesquisa: TSpeedButton; }
    Edit1.ClassName; { Edit1: TEdit; }
    Panel1.ClassName; { Panel1: TPanel; }
    Panel2.ClassName; { Panel2: TPanel; }
    Label4.ClassName; { Label4: TLabel; }
    bt_pesq_grupo.ClassName; { bt_pesq_grupo: TSpeedButton; }
    Label5.ClassName; { Label5: TLabel; }
    PngSpeedButton1.ClassName; { PngSpeedButton1: TPngSpeedButton; }
    btPesquisar.ClassName; { btPesquisar: TPngSpeedButton; }
    rdProdutosExibir.ClassName; { rdProdutosExibir: TRadioGroup; }
    gpFornecedor.ClassName; { gpFornecedor: TGroupBox; }
    Label2.ClassName; { Label2: TLabel; }
    bt_pesq_fornecedor.ClassName; { bt_pesq_fornecedor: TSpeedButton; }
    Label1.ClassName; { Label1: TLabel; }
    Label3.ClassName; { Label3: TLabel; }
    Panel4.ClassName; { Panel4: TPanel; }
    ed_razao_social_fornecedor.ClassName; { ed_razao_social_fornecedor: TEdit; }
    Panel13.ClassName; { Panel13: TPanel; }
    ed_cod_fornecedor.ClassName; { ed_cod_fornecedor: TEdit; }
    ed_cnpj_fornecedor.ClassName; { ed_cnpj_fornecedor: TEdit; }
    rdOrdem.ClassName; { rdOrdem: TRadioGroup; }
    edDescricaoProduto.ClassName; { edDescricaoProduto: TEdit; }
    ed_cod_grupo.ClassName; { ed_cod_grupo: TEdit; }
    Panel6.ClassName; { Panel6: TPanel; }
    Label6.ClassName; { Label6: TLabel; }
    ed_desc_grupo.ClassName; { ed_desc_grupo: TEdit; }
    Panel3.ClassName; { Panel3: TPanel; }
    lbQtdProdutos.ClassName; { lbQtdProdutos: TLabel; }
    DBGrid1.ClassName; { DBGrid1: TDBGrid; }
    Panel7.ClassName; { Panel7: TPanel; }
    lbTop.ClassName; { lbTop: TLabel; }
    Panel8.ClassName; { Panel8: TPanel; }
    AdvOfficeImage1.ClassName; { AdvOfficeImage1: TAdvOfficeImage; }
    lbNomeUsuario.ClassName; { lbNomeUsuario: TLabel; }
    AdvOfficeImage2.ClassName; { AdvOfficeImage2: TAdvOfficeImage; }
    lbNumeroEstacao.ClassName; { lbNumeroEstacao: TLabel; }
    AdvOfficeImage4.ClassName; { AdvOfficeImage4: TAdvOfficeImage; }
    lbDataSistema.ClassName; { lbDataSistema: TLabel; }
    AdvOfficeImage3.ClassName; { AdvOfficeImage3: TAdvOfficeImage; }
    lbHora.ClassName; { lbHora: TLabel; }
    PopupMenu1.ClassName; { PopupMenu1: TPopupMenu; }
    Associar1.ClassName; { Associar1: TMenuItem; }
    VisualizarltimoDANFEdecompra1.ClassName; { VisualizarltimoDANFEdecompra1: TMenuItem; }
    timerHora.ClassName; { timerHora: TTimer; }
  end;

{ frmListagemProdutos: TfrmListagemProdutos }
  with TfrmListagemProdutos(nil) do { uListagemProdutos.pas }
  begin
    botao_pesquisa.ClassName; { botao_pesquisa: TSpeedButton; }
    Edit1.ClassName; { Edit1: TEdit; }
    Panel4.ClassName; { Panel4: TPanel; }
    BitBtn1.ClassName; { BitBtn1: TBitBtn; }
    BitBtn2.ClassName; { BitBtn2: TBitBtn; }
    Panel1.ClassName; { Panel1: TPanel; }
    SpeedButton1.ClassName; { SpeedButton1: TcxButton; }
    gTipoListagem.ClassName; { gTipoListagem: TRadioGroup; }
    gpOrdem.ClassName; { gpOrdem: TRadioGroup; }
    pn_grupos.ClassName; { pn_grupos: TPanel; }
    Label1.ClassName; { Label1: TLabel; }
    Label2.ClassName; { Label2: TLabel; }
    bt_pesq_grupo.ClassName; { bt_pesq_grupo: TSpeedButton; }
    ed_cod_grupo.ClassName; { ed_cod_grupo: TMaskEdit; }
    Panel3.ClassName; { Panel3: TPanel; }
    ed_desc_grupo.ClassName; { ed_desc_grupo: TMaskEdit; }
    cliques.ClassName; { cliques: TActionList; }
    actlBusca.ClassName; { actlBusca: TJvControlActionList; }
    SaveDialog.ClassName; { SaveDialog: TSaveDialog; }
  end;

{ frmConsultaGruposRD: TfrmConsultaGruposRD }
  with TfrmConsultaGruposRD(nil) do { uuConsultaGruposRD.pas }
  begin
    botao_pesquisa.ClassName; { botao_pesquisa: TSpeedButton; }
    SpeedButton1.ClassName; { SpeedButton1: TSpeedButton; }
    Edit1.ClassName; { Edit1: TEdit; }
    Edit2.ClassName; { Edit2: TEdit; }
    Panel1.ClassName; { Panel1: TPanel; }
    Label1.ClassName; { Label1: TLabel; }
    Panel3.ClassName; { Panel3: TPanel; }
    TreeView1.ClassName; { TreeView1: TTreeView; }
    Panel2.ClassName; { Panel2: TPanel; }
    BitBtn1.ClassName; { BitBtn1: TBitBtn; }
    BitBtn2.ClassName; { BitBtn2: TBitBtn; }
    ImageList1.ClassName; { ImageList1: TImageList; }
  end;

{ frmAssociaProdutoFornecedor: TfrmAssociaProdutoFornecedor }
  with TfrmAssociaProdutoFornecedor(nil) do { uuAssociaProdutoFornecedor.pas }
  begin
    botao_pesquisa.ClassName; { botao_pesquisa: TSpeedButton; }
    Edit1.ClassName; { Edit1: TEdit; }
    Panel1.ClassName; { Panel1: TPanel; }
    Label1.ClassName; { Label1: TLabel; }
    Label2.ClassName; { Label2: TLabel; }
    Label3.ClassName; { Label3: TLabel; }
    Label4.ClassName; { Label4: TLabel; }
    Label5.ClassName; { Label5: TLabel; }
    Label6.ClassName; { Label6: TLabel; }
    edCodProdFornecedor.ClassName; { edCodProdFornecedor: TEdit; }
    edDescProdFornecedor.ClassName; { edDescProdFornecedor: TEdit; }
    edUnidadeFornecedor.ClassName; { edUnidadeFornecedor: TEdit; }
    edCFOPFornecedor.ClassName; { edCFOPFornecedor: TEdit; }
    edCSTFornecedor.ClassName; { edCSTFornecedor: TEdit; }
    edNCMFornecedor.ClassName; { edNCMFornecedor: TEdit; }
    edNomeFornecedor.ClassName; { edNomeFornecedor: TEdit; }
    edCnpjFornecedor.ClassName; { edCnpjFornecedor: TEdit; }
    Panel2.ClassName; { Panel2: TPanel; }
    Label9.ClassName; { Label9: TLabel; }
    bt_pesq_item_estoque_cod.ClassName; { bt_pesq_item_estoque_cod: TSpeedButton; }
    Label7.ClassName; { Label7: TLabel; }
    Label8.ClassName; { Label8: TLabel; }
    Label10.ClassName; { Label10: TLabel; }
    Label12.ClassName; { Label12: TLabel; }
    SpeedButton1.ClassName; { SpeedButton1: TSpeedButton; }
    ed_cod_item.ClassName; { ed_cod_item: TEdit; }
    Panel5.ClassName; { Panel5: TPanel; }
    ed_desc_item.ClassName; { ed_desc_item: TEdit; }
    ed_unidade_item.ClassName; { ed_unidade_item: TEdit; }
    rdTipoOperacao.ClassName; { rdTipoOperacao: TRadioGroup; }
    pnfator.ClassName; { pnfator: TPanel; }
    Label13.ClassName; { Label13: TLabel; }
    edFatorConversao.ClassName; { edFatorConversao: TCurrencyEdit; }
    edCfopEntrada.ClassName; { edCfopEntrada: TEdit; }
    edCSTEntrada.ClassName; { edCSTEntrada: TEdit; }
    Panel9.ClassName; { Panel9: TPanel; }
    BitBtn1.ClassName; { BitBtn1: TBitBtn; }
    BitBtn2.ClassName; { BitBtn2: TBitBtn; }
    Panel4.ClassName; { Panel4: TPanel; }
    Panel6.ClassName; { Panel6: TPanel; }
    Panel7.ClassName; { Panel7: TPanel; }
    Panel8.ClassName; { Panel8: TPanel; }
  end;

{ frmGerarEtiquetas: TfrmGerarEtiquetas }
  with TfrmGerarEtiquetas(nil) do { uuGerarEtiquetas.pas }
  begin
    botao_pesquisa.ClassName; { botao_pesquisa: TSpeedButton; }
    Edit1.ClassName; { Edit1: TEdit; }
    Panel1.ClassName; { Panel1: TPanel; }
    Label2.ClassName; { Label2: TLabel; }
    Label4.ClassName; { Label4: TLabel; }
    Panel2.ClassName; { Panel2: TPanel; }
    Panel6.ClassName; { Panel6: TPanel; }
    DBGrid1.ClassName; { DBGrid1: TDBGrid; }
    Panel3.ClassName; { Panel3: TPanel; }
    bt_pesq_grupo.ClassName; { bt_pesq_grupo: TSpeedButton; }
    Label3.ClassName; { Label3: TLabel; }
    RadioGroup1.ClassName; { RadioGroup1: TRadioGroup; }
    Panel13.ClassName; { Panel13: TPanel; }
    Label43.ClassName; { Label43: TLabel; }
    ed_desc_grupo.ClassName; { ed_desc_grupo: TEdit; }
    BitBtn3.ClassName; { BitBtn3: TBitBtn; }
    ed_cod_grupo.ClassName; { ed_cod_grupo: TEdit; }
    Panel14.ClassName; { Panel14: TPanel; }
    edCodInicial.ClassName; { edCodInicial: TEdit; }
    edCodFinal.ClassName; { edCodFinal: TEdit; }
    GroupBox1.ClassName; { GroupBox1: TGroupBox; }
    edDescProduto.ClassName; { edDescProduto: TEdit; }
    RadioGroup2.ClassName; { RadioGroup2: TRadioGroup; }
    ckbEstoque.ClassName; { ckbEstoque: TCheckBox; }
    Panel4.ClassName; { Panel4: TPanel; }
    Panel5.ClassName; { Panel5: TPanel; }
    Image1.ClassName; { Image1: TImage; }
    Panel8.ClassName; { Panel8: TPanel; }
    Panel9.ClassName; { Panel9: TPanel; }
    Panel11.ClassName; { Panel11: TPanel; }
    DBGrid2.ClassName; { DBGrid2: TDBGrid; }
    Panel7.ClassName; { Panel7: TPanel; }
    Panel10.ClassName; { Panel10: TPanel; }
    BitBtn1.ClassName; { BitBtn1: TBitBtn; }
    BitBtn2.ClassName; { BitBtn2: TBitBtn; }
    Panel12.ClassName; { Panel12: TPanel; }
    Label1.ClassName; { Label1: TLabel; }
    Edit2.ClassName; { Edit2: TEdit; }
    PopupMenu1.ClassName; { PopupMenu1: TPopupMenu; }
    Adicionar1.ClassName; { Adicionar1: TMenuItem; }
    PopupMenu2.ClassName; { PopupMenu2: TPopupMenu; }
    MenuItem1.ClassName; { MenuItem1: TMenuItem; }
    ImageList1.ClassName; { ImageList1: TImageList; }
  end;

{ frmLancamentosRD: TfrmLancamentosRD }
  with TfrmLancamentosRD(nil) do { uuLancamentosRD.pas }
  begin
    pn_principal.ClassName; { pn_principal: TPanel; }
    pn_codigo.ClassName; { pn_codigo: TPanel; }
    bt_pesquisa.ClassName; { bt_pesquisa: TSpeedButton; }
    Label5.ClassName; { Label5: TLabel; }
    ed_codigo.ClassName; { ed_codigo: TMaskEdit; }
    Panel1.ClassName; { Panel1: TPanel; }
    pnFornecedor.ClassName; { pnFornecedor: TPanel; }
    Label6.ClassName; { Label6: TLabel; }
    Label30.ClassName; { Label30: TLabel; }
    Label4.ClassName; { Label4: TLabel; }
    gpFornecedor.ClassName; { gpFornecedor: TGroupBox; }
    Label2.ClassName; { Label2: TLabel; }
    bt_pesq_fornecedor.ClassName; { bt_pesq_fornecedor: TSpeedButton; }
    Label1.ClassName; { Label1: TLabel; }
    ed_cod_fornecedor.ClassName; { ed_cod_fornecedor: TDBEdit; }
    Panel3.ClassName; { Panel3: TPanel; }
    ed_razao_social_fornecedor.ClassName; { ed_razao_social_fornecedor: TDBEdit; }
    Panel13.ClassName; { Panel13: TPanel; }
    edDataEmissaoNotaFiscal.ClassName; { edDataEmissaoNotaFiscal: TDBDateEdit; }
    edDataEntradaNotaFiscal.ClassName; { edDataEntradaNotaFiscal: TDBDateEdit; }
    edNumeroNotaFiscal.ClassName; { edNumeroNotaFiscal: TDBEdit; }
    Panel2.ClassName; { Panel2: TPanel; }
    bt_pesq_grupo.ClassName; { bt_pesq_grupo: TSpeedButton; }
    Label3.ClassName; { Label3: TLabel; }
    Label43.ClassName; { Label43: TLabel; }
    Panel4.ClassName; { Panel4: TPanel; }
    ed_desc_grupo.ClassName; { ed_desc_grupo: TEdit; }
    btAdicionar.ClassName; { btAdicionar: TBitBtn; }
    edValor.ClassName; { edValor: TCurrencyEdit; }
    ed_cod_grupo.ClassName; { ed_cod_grupo: TEdit; }
    Panel5.ClassName; { Panel5: TPanel; }
    DBGrid1.ClassName; { DBGrid1: TDBGrid; }
    Panel6.ClassName; { Panel6: TPanel; }
    Panel7.ClassName; { Panel7: TPanel; }
    memoObs.ClassName; { memoObs: TMemo; }
    Panel8.ClassName; { Panel8: TPanel; }
    Label7.ClassName; { Label7: TLabel; }
    edTotalLancamentos.ClassName; { edTotalLancamentos: TCurrencyEdit; }
    pn_botoes.ClassName; { pn_botoes: TPanel; }
    bt_novo.ClassName; { bt_novo: TBitBtn; }
    bt_alterar.ClassName; { bt_alterar: TBitBtn; }
    bt_gravar.ClassName; { bt_gravar: TBitBtn; }
    bt_cancelar.ClassName; { bt_cancelar: TBitBtn; }
    bt_sair.ClassName; { bt_sair: TBitBtn; }
    bt_excluir.ClassName; { bt_excluir: TBitBtn; }
    bt_consultar.ClassName; { bt_consultar: TBitBtn; }
    bt_imprimir.ClassName; { bt_imprimir: TBitBtn; }
    PopupMenu1.ClassName; { PopupMenu1: TPopupMenu; }
    Excluir1.ClassName; { Excluir1: TMenuItem; }
  end;

{ frm_saidas: Tfrm_saidas }
  with Tfrm_saidas(nil) do { uuSaidasNotaFiscal.pas }
  begin
    pn_principal.ClassName; { pn_principal: TPanel; }
    pn_codigo.ClassName; { pn_codigo: TPanel; }
    bt_pesquisa.ClassName; { bt_pesquisa: TSpeedButton; }
    Label7.ClassName; { Label7: TLabel; }
    ed_codigo.ClassName; { ed_codigo: TMaskEdit; }
    pnFornecedor.ClassName; { pnFornecedor: TPanel; }
    Panel1.ClassName; { Panel1: TPanel; }
    GroupBox1.ClassName; { GroupBox1: TGroupBox; }
    Label2.ClassName; { Label2: TLabel; }
    bt_pesq_fornecedor.ClassName; { bt_pesq_fornecedor: TSpeedButton; }
    Label1.ClassName; { Label1: TLabel; }
    Label27.ClassName; { Label27: TLabel; }
    Label29.ClassName; { Label29: TLabel; }
    Label28.ClassName; { Label28: TLabel; }
    Label31.ClassName; { Label31: TLabel; }
    ed_cod_fornecedor.ClassName; { ed_cod_fornecedor: TDBEdit; }
    Panel3.ClassName; { Panel3: TPanel; }
    ed_razao_social_fornecedor.ClassName; { ed_razao_social_fornecedor: TDBEdit; }
    Panel11.ClassName; { Panel11: TPanel; }
    ed_cnpj_fornecedor.ClassName; { ed_cnpj_fornecedor: TDBEdit; }
    Panel12.ClassName; { Panel12: TPanel; }
    ed_cidade_fornecedor.ClassName; { ed_cidade_fornecedor: TDBEdit; }
    Panel13.ClassName; { Panel13: TPanel; }
    ed_uf_fornecedor.ClassName; { ed_uf_fornecedor: TDBEdit; }
    Panel15.ClassName; { Panel15: TPanel; }
    ed_ie_fornecedor.ClassName; { ed_ie_fornecedor: TDBEdit; }
    pn_campos.ClassName; { pn_campos: TPanel; }
    pnNota.ClassName; { pnNota: TPanel; }
    GroupBox2.ClassName; { GroupBox2: TGroupBox; }
    Label36.ClassName; { Label36: TLabel; }
    Label37.ClassName; { Label37: TLabel; }
    Label38.ClassName; { Label38: TLabel; }
    Label39.ClassName; { Label39: TLabel; }
    Label44.ClassName; { Label44: TLabel; }
    edValorFrete.ClassName; { edValorFrete: TDBEdit; }
    edValorSeguro.ClassName; { edValorSeguro: TDBEdit; }
    edValorDesconto.ClassName; { edValorDesconto: TDBEdit; }
    edOutrasDespesas.ClassName; { edOutrasDespesas: TDBEdit; }
    Panel2.ClassName; { Panel2: TPanel; }
    Label32.ClassName; { Label32: TLabel; }
    Label33.ClassName; { Label33: TLabel; }
    Label26.ClassName; { Label26: TLabel; }
    Label25.ClassName; { Label25: TLabel; }
    Label5.ClassName; { Label5: TLabel; }
    Label35.ClassName; { Label35: TLabel; }
    edBaseCalculoICMS.ClassName; { edBaseCalculoICMS: TDBEdit; }
    edValorICMS.ClassName; { edValorICMS: TDBEdit; }
    edBaseCalculoICMSSubst.ClassName; { edBaseCalculoICMSSubst: TDBEdit; }
    edValorICMSSubst.ClassName; { edValorICMSSubst: TDBEdit; }
    edValorProdutos.ClassName; { edValorProdutos: TDBEdit; }
    edValorIPI.ClassName; { edValorIPI: TDBEdit; }
    Panel9.ClassName; { Panel9: TPanel; }
    edTotalNotaFiscal.ClassName; { edTotalNotaFiscal: TDBEdit; }
    pnItens.ClassName; { pnItens: TPanel; }
    PageControl1.ClassName; { PageControl1: TPageControl; }
    TabSheet1.ClassName; { TabSheet1: TTabSheet; }
    GroupBox3.ClassName; { GroupBox3: TGroupBox; }
    Label9.ClassName; { Label9: TLabel; }
    btPesqProdutos.ClassName; { btPesqProdutos: TSpeedButton; }
    Label10.ClassName; { Label10: TLabel; }
    Label14.ClassName; { Label14: TLabel; }
    Label15.ClassName; { Label15: TLabel; }
    Label17.ClassName; { Label17: TLabel; }
    bt_pesq_un_entrada.ClassName; { bt_pesq_un_entrada: TSpeedButton; }
    Label18.ClassName; { Label18: TLabel; }
    Label20.ClassName; { Label20: TLabel; }
    Label24.ClassName; { Label24: TLabel; }
    Label40.ClassName; { Label40: TLabel; }
    Label42.ClassName; { Label42: TLabel; }
    Label8.ClassName; { Label8: TLabel; }
    Label19.ClassName; { Label19: TLabel; }
    Label13.ClassName; { Label13: TLabel; }
    Label12.ClassName; { Label12: TLabel; }
    Label34.ClassName; { Label34: TLabel; }
    Label47.ClassName; { Label47: TLabel; }
    Label11.ClassName; { Label11: TLabel; }
    Label43.ClassName; { Label43: TLabel; }
    Panel5.ClassName; { Panel5: TPanel; }
    ed_desc_item.ClassName; { ed_desc_item: TEdit; }
    EDIAliquotaICMSSAIDAITEM.ClassName; { EDIAliquotaICMSSAIDAITEM: TCurrencyEdit; }
    EDIAliquotaIPI.ClassName; { EDIAliquotaIPI: TCurrencyEdit; }
    Panel7.ClassName; { Panel7: TPanel; }
    DBGrid1.ClassName; { DBGrid1: TDBGrid; }
    Panel6.ClassName; { Panel6: TPanel; }
    ed_desc_un_entrada.ClassName; { ed_desc_un_entrada: TEdit; }
    BitBtn1.ClassName; { BitBtn1: TBitBtn; }
    ed_cod_item_saida.ClassName; { ed_cod_item_saida: TEdit; }
    EDIpreco.ClassName; { EDIpreco: TCurrencyEdit; }
    EDIdesconto.ClassName; { EDIdesconto: TCurrencyEdit; }
    EDIBaseICMS.ClassName; { EDIBaseICMS: TCurrencyEdit; }
    EDIVALORICMS.ClassName; { EDIVALORICMS: TCurrencyEdit; }
    EDIbaseICMSST.ClassName; { EDIbaseICMSST: TCurrencyEdit; }
    ediValorICMSST.ClassName; { ediValorICMSST: TCurrencyEdit; }
    EDIvalorIPI.ClassName; { EDIvalorIPI: TCurrencyEdit; }
    edOutrasDespItem.ClassName; { edOutrasDespItem: TCurrencyEdit; }
    EDIquantidade.ClassName; { EDIquantidade: TCurrencyEdit; }
    ed_cod_un_entrada.ClassName; { ed_cod_un_entrada: TEdit; }
    edNCMITEM.ClassName; { edNCMITEM: TEdit; }
    ed_cfop_saida_item.ClassName; { ed_cfop_saida_item: TEdit; }
    ed_cst_saida_item.ClassName; { ed_cst_saida_item: TEdit; }
    TabSheet2.ClassName; { TabSheet2: TTabSheet; }
    TabSheet3.ClassName; { TabSheet3: TTabSheet; }
    GroupBox4.ClassName; { GroupBox4: TGroupBox; }
    Label22.ClassName; { Label22: TLabel; }
    DBGrid2.ClassName; { DBGrid2: TDBGrid; }
    DBEdit1.ClassName; { DBEdit1: TDBEdit; }
    BitBtn2.ClassName; { BitBtn2: TBitBtn; }
    pnCabecalho.ClassName; { pnCabecalho: TPanel; }
    btPesqSituacaoDocFiscal.ClassName; { btPesqSituacaoDocFiscal: TSpeedButton; }
    Label3.ClassName; { Label3: TLabel; }
    Label21.ClassName; { Label21: TLabel; }
    gpDadosNota.ClassName; { gpDadosNota: TGroupBox; }
    Label4.ClassName; { Label4: TLabel; }
    Label16.ClassName; { Label16: TLabel; }
    Label6.ClassName; { Label6: TLabel; }
    Label30.ClassName; { Label30: TLabel; }
    edNumeroNotaFiscal.ClassName; { edNumeroNotaFiscal: TDBEdit; }
    edSerieNotaFiscal.ClassName; { edSerieNotaFiscal: TDBEdit; }
    edDataEmissaoNotaFiscal.ClassName; { edDataEmissaoNotaFiscal: TDBDateEdit; }
    edDataEntradaNotaFiscal.ClassName; { edDataEntradaNotaFiscal: TDBDateEdit; }
    gpOperacao.ClassName; { gpOperacao: TGroupBox; }
    rdVenda.ClassName; { rdVenda: TRadioButton; }
    rdDevolucao.ClassName; { rdDevolucao: TRadioButton; }
    rdTransferencia.ClassName; { rdTransferencia: TRadioButton; }
    gpTipoNota.ClassName; { gpTipoNota: TGroupBox; }
    rdModelo01.ClassName; { rdModelo01: TRadioButton; }
    rdNotaEletronica.ClassName; { rdNotaEletronica: TRadioButton; }
    pnChaveNFE.ClassName; { pnChaveNFE: TPanel; }
    Label49.ClassName; { Label49: TLabel; }
    edChaveNFE.ClassName; { edChaveNFE: TDBEdit; }
    pnCupomFiscal.ClassName; { pnCupomFiscal: TPanel; }
    ckbCupomAnexo.ClassName; { ckbCupomAnexo: TCheckBox; }
    pnNumeroCupom.ClassName; { pnNumeroCupom: TPanel; }
    Label45.ClassName; { Label45: TLabel; }
    Label48.ClassName; { Label48: TLabel; }
    edNumeroCupomFiscal.ClassName; { edNumeroCupomFiscal: TDBEdit; }
    edNumeroECF.ClassName; { edNumeroECF: TDBEdit; }
    edCodSituacaoDocFiscal.ClassName; { edCodSituacaoDocFiscal: TDBEdit; }
    Panel10.ClassName; { Panel10: TPanel; }
    edDescSituacaoDocFiscal.ClassName; { edDescSituacaoDocFiscal: TDBEdit; }
    pn_botoes.ClassName; { pn_botoes: TPanel; }
    bt_novo.ClassName; { bt_novo: TBitBtn; }
    bt_alterar.ClassName; { bt_alterar: TBitBtn; }
    bt_gravar.ClassName; { bt_gravar: TBitBtn; }
    bt_cancelar.ClassName; { bt_cancelar: TBitBtn; }
    bt_sair.ClassName; { bt_sair: TBitBtn; }
    bt_excluir.ClassName; { bt_excluir: TBitBtn; }
    bt_consultar.ClassName; { bt_consultar: TBitBtn; }
    bt_imprimir.ClassName; { bt_imprimir: TBitBtn; }
    Panel8.ClassName; { Panel8: TPanel; }
    Label46.ClassName; { Label46: TLabel; }
  end;

{ frmEnvioContingencia: TfrmEnvioContingencia }
  with TfrmEnvioContingencia(nil) do { uuEnvioContingencia.pas }
  begin
    Panel1.ClassName; { Panel1: TPanel; }
    Label15.ClassName; { Label15: TLabel; }
    lbQtdNotas.ClassName; { lbQtdNotas: TLabel; }
    Label2.ClassName; { Label2: TLabel; }
    Label3.ClassName; { Label3: TLabel; }
    Panel2.ClassName; { Panel2: TPanel; }
    DBGrid1.ClassName; { DBGrid1: TDBGrid; }
    pnInutlizacoes.ClassName; { pnInutlizacoes: TPanel; }
    lbpnInutilizacoes.ClassName; { lbpnInutilizacoes: TLabel; }
    lbQtdInut.ClassName; { lbQtdInut: TLabel; }
    Panel4.ClassName; { Panel4: TPanel; }
    Label1.ClassName; { Label1: TLabel; }
    pgInutilizacoes.ClassName; { pgInutilizacoes: TProgressBar; }
    Panel3.ClassName; { Panel3: TPanel; }
    btAtivarModoContingencia.ClassName; { btAtivarModoContingencia: TBitBtn; }
    btEnvioContingencia.ClassName; { btEnvioContingencia: TBitBtn; }
    btReimprimirCancelarNFCE.ClassName; { btReimprimirCancelarNFCE: TBitBtn; }
    BitBtn1.ClassName; { BitBtn1: TBitBtn; }
    BitBtn2.ClassName; { BitBtn2: TBitBtn; }
    dsContingencia.ClassName; { dsContingencia: TDataSource; }
    OpenDialog1.ClassName; { OpenDialog1: TOpenDialog; }
    tbContingencia.ClassName; { tbContingencia: TFDMemTable; }
    tbContingenciacod_venda.ClassName; { tbContingenciacod_venda: TStringField; }
    tbContingenciachaveNFCE.ClassName; { tbContingenciachaveNFCE: TStringField; }
    tbContingenciavalor.ClassName; { tbContingenciavalor: TBCDField; }
    tbContingencianumeroNFCE.ClassName; { tbContingencianumeroNFCE: TIntegerField; }
    tbContingenciadata.ClassName; { tbContingenciadata: TDateField; }
    tbContingenciaserie.ClassName; { tbContingenciaserie: TIntegerField; }
    tbContingenciaobs_nfce.ClassName; { tbContingenciaobs_nfce: TStringField; }
    tbContingenciatentativas.ClassName; { tbContingenciatentativas: TSmallintField; }
    img.ClassName; { img: TImageList; }
    PopupMenu2.ClassName; { PopupMenu2: TPopupMenu; }
    VisualizarDANFE1.ClassName; { VisualizarDANFE1: TMenuItem; }
    ReimprimirDanfe1.ClassName; { ReimprimirDanfe1: TMenuItem; }
  end;

{ frmDisponibilidadeVenda: TfrmDisponibilidadeVenda }
  with TfrmDisponibilidadeVenda(nil) do { uuDisponibilidadeVenda.pas }
  begin
    botao_pesquisa.ClassName; { botao_pesquisa: TSpeedButton; }
    Edit1.ClassName; { Edit1: TEdit; }
    Panel3.ClassName; { Panel3: TPanel; }
    Label15.ClassName; { Label15: TLabel; }
    Panel4.ClassName; { Panel4: TPanel; }
    BitBtn1.ClassName; { BitBtn1: TBitBtn; }
    BitBtn4.ClassName; { BitBtn4: TBitBtn; }
    Panel5.ClassName; { Panel5: TPanel; }
    Panel2.ClassName; { Panel2: TPanel; }
    Label1.ClassName; { Label1: TLabel; }
    cxGrid2.ClassName; { cxGrid2: TcxGrid; }
    cxGridDBTableView1.ClassName; { cxGridDBTableView1: TcxGridDBTableView; }
    cxGridDBTableView1cod_produto.ClassName; { cxGridDBTableView1cod_produto: TcxGridDBColumn; }
    cxGridDBTableView1vende.ClassName; { cxGridDBTableView1vende: TcxGridDBColumn; }
    cxGridDBTableView1descricao.ClassName; { cxGridDBTableView1descricao: TcxGridDBColumn; }
    cxGridDBTableView1cod_barras.ClassName; { cxGridDBTableView1cod_barras: TcxGridDBColumn; }
    cxGridDBTableView1valor_unitario.ClassName; { cxGridDBTableView1valor_unitario: TcxGridDBColumn; }
    cxGridLevel1.ClassName; { cxGridLevel1: TcxGridLevel; }
    cxGrid1.ClassName; { cxGrid1: TcxGrid; }
    cxGrid1DBTableView1.ClassName; { cxGrid1DBTableView1: TcxGridDBTableView; }
    cxGrid1DBTableView1descricao.ClassName; { cxGrid1DBTableView1descricao: TcxGridDBColumn; }
    cxGrid1DBTableView1valor_unitario.ClassName; { cxGrid1DBTableView1valor_unitario: TcxGridDBColumn; }
    cxGrid1Level1.ClassName; { cxGrid1Level1: TcxGridLevel; }
    Panel1.ClassName; { Panel1: TPanel; }
    DBGrid1.ClassName; { DBGrid1: TDBGrid; }
    cliques.ClassName; { cliques: TActionList; }
    tbGruposTouch.ClassName; { tbGruposTouch: TRxMemoryData; }
    tbGruposTouchcodGrupo.ClassName; { tbGruposTouchcodGrupo: TStringField; }
    tbGruposTouchdescricao.ClassName; { tbGruposTouchdescricao: TStringField; }
    tbGruposTouchordem.ClassName; { tbGruposTouchordem: TIntegerField; }
    tbGruposTouchdisponivel.ClassName; { tbGruposTouchdisponivel: TSmallintField; }
    dsGruposTouch.ClassName; { dsGruposTouch: TDataSource; }
    dsProdutos.ClassName; { dsProdutos: TDataSource; }
    img.ClassName; { img: TImageList; }
    dsProdutosTabelaTemp.ClassName; { dsProdutosTabelaTemp: TDataSource; }
    GProdutosTabelaPreco.ClassName; { GProdutosTabelaPreco: TFDMemTable; }
    cxStyleRepository1.ClassName; { cxStyleRepository1: TcxStyleRepository; }
    cxStyle1.ClassName; { cxStyle1: TcxStyle; }
    NaoEditavel.ClassName; { NaoEditavel: TcxStyle; }
    cxStyle2.ClassName; { cxStyle2: TcxStyle; }
    cxImageList1.ClassName; { cxImageList1: TcxImageList; }
    PopupMenu1.ClassName; { PopupMenu1: TPopupMenu; }
    Disponibilizarvenda1.ClassName; { Disponibilizarvenda1: TMenuItem; }
    Indisponibilizarvenda1.ClassName; { Indisponibilizarvenda1: TMenuItem; }
    DefiniropcionaisComplementos1.ClassName; { DefiniropcionaisComplementos1: TMenuItem; }
    tbProdutos.ClassName; { tbProdutos: TFDMemTable; }
  end;

{ frmDigitaPesoManualmente: TfrmDigitaPesoManualmente }
  with TfrmDigitaPesoManualmente(nil) do { uuDigitaPesoManualmente.pas }
  begin
    botao_pesquisa.ClassName; { botao_pesquisa: TSpeedButton; }
    Edit1.ClassName; { Edit1: TEdit; }
    Panel1.ClassName; { Panel1: TPanel; }
    Label1.ClassName; { Label1: TLabel; }
    AdvTouchKeyboard1.ClassName; { AdvTouchKeyboard1: TAdvTouchKeyboard; }
    Panel2.ClassName; { Panel2: TPanel; }
    ed_quantidade.ClassName; { ed_quantidade: TCurrencyEdit; }
  end;

{ frmLancamentosSalao: TfrmLancamentosSalao }
  with TfrmLancamentosSalao(nil) do { uuLancamentosSalao.pas }
  begin
    memo_codigos_formas.ClassName; { memo_codigos_formas: TMemo; }
    Panel2.ClassName; { Panel2: TPanel; }
    lb_hora.ClassName; { lb_hora: TLabel; }
    pnMovimentoMesa.ClassName; { pnMovimentoMesa: TPanel; }
    lb_cod_produto.ClassName; { lb_cod_produto: TLabel; }
    pn_garcon.ClassName; { pn_garcon: TPanel; }
    lbGarcon.ClassName; { lbGarcon: TLabel; }
    ed_cod_garcon.ClassName; { ed_cod_garcon: TEdit; }
    pn_mesa.ClassName; { pn_mesa: TPanel; }
    Label21.ClassName; { Label21: TLabel; }
    ed_numero_mesa.ClassName; { ed_numero_mesa: TEdit; }
    pn_produto.ClassName; { pn_produto: TPanel; }
    Label2.ClassName; { Label2: TLabel; }
    Label3.ClassName; { Label3: TLabel; }
    bt_peq_produto.ClassName; { bt_peq_produto: TSpeedButton; }
    Label5.ClassName; { Label5: TLabel; }
    ed_cod_produto.ClassName; { ed_cod_produto: TEdit; }
    Panel5.ClassName; { Panel5: TPanel; }
    ed_descricao_produto.ClassName; { ed_descricao_produto: TEdit; }
    ed_valor_produto.ClassName; { ed_valor_produto: TEdit; }
    pnQtde.ClassName; { pnQtde: TPanel; }
    Label6.ClassName; { Label6: TLabel; }
    SpeedButton2.ClassName; { SpeedButton2: TSpeedButton; }
    SpeedButton3.ClassName; { SpeedButton3: TSpeedButton; }
    ed_quantidade.ClassName; { ed_quantidade: TEdit; }
    pnTeclado.ClassName; { pnTeclado: TPanel; }
    AdvTouchKeyboard1.ClassName; { AdvTouchKeyboard1: TAdvTouchKeyboard; }
    brReabre.ClassName; { brReabre: TJvTransparentButton; }
    pnInfoMesas.ClassName; { pnInfoMesas: TPanel; }
    edQtdMesas.ClassName; { edQtdMesas: TEdit; }
    edMesasPagto.ClassName; { edMesasPagto: TEdit; }
    pnFuncoesMesa.ClassName; { pnFuncoesMesa: TPanel; }
    SpeedButton1.ClassName; { SpeedButton1: TSpeedButton; }
    SpeedButton11.ClassName; { SpeedButton11: TSpeedButton; }
    xB20002001.ClassName; { xB20002001: TJvTransparentButton; }
    B20002001.ClassName; { B20002001: TJvTransparentButton; }
    JvTransparentButton2.ClassName; { JvTransparentButton2: TJvTransparentButton; }
    pnProdutosTouch.ClassName; { pnProdutosTouch: TPanel; }
    Panel7.ClassName; { Panel7: TPanel; }
    pgGrupos.ClassName; { pgGrupos: TJvPageControl; }
    TabSheet1.ClassName; { TabSheet1: TTabSheet; }
    btgp1.ClassName; { btgp1: TJvImgBtn; }
    btgp2.ClassName; { btgp2: TJvImgBtn; }
    btgp3.ClassName; { btgp3: TJvImgBtn; }
    btgp4.ClassName; { btgp4: TJvImgBtn; }
    btgp5.ClassName; { btgp5: TJvImgBtn; }
    btgp6.ClassName; { btgp6: TJvImgBtn; }
    btgp7.ClassName; { btgp7: TJvImgBtn; }
    TabSheet2.ClassName; { TabSheet2: TTabSheet; }
    btgp8.ClassName; { btgp8: TJvImgBtn; }
    btgp9.ClassName; { btgp9: TJvImgBtn; }
    btgp10.ClassName; { btgp10: TJvImgBtn; }
    btgp11.ClassName; { btgp11: TJvImgBtn; }
    btgp12.ClassName; { btgp12: TJvImgBtn; }
    btgp13.ClassName; { btgp13: TJvImgBtn; }
    btgp14.ClassName; { btgp14: TJvImgBtn; }
    TabSheet3.ClassName; { TabSheet3: TTabSheet; }
    btgp15.ClassName; { btgp15: TJvImgBtn; }
    btgp16.ClassName; { btgp16: TJvImgBtn; }
    btgp17.ClassName; { btgp17: TJvImgBtn; }
    btgp18.ClassName; { btgp18: TJvImgBtn; }
    btgp19.ClassName; { btgp19: TJvImgBtn; }
    btgp20.ClassName; { btgp20: TJvImgBtn; }
    btgp21.ClassName; { btgp21: TJvImgBtn; }
    TabSheet4.ClassName; { TabSheet4: TTabSheet; }
    btgp22.ClassName; { btgp22: TJvImgBtn; }
    btgp23.ClassName; { btgp23: TJvImgBtn; }
    btgp24.ClassName; { btgp24: TJvImgBtn; }
    btgp25.ClassName; { btgp25: TJvImgBtn; }
    btgp26.ClassName; { btgp26: TJvImgBtn; }
    btgp27.ClassName; { btgp27: TJvImgBtn; }
    btgp28.ClassName; { btgp28: TJvImgBtn; }
    TabSheet5.ClassName; { TabSheet5: TTabSheet; }
    btgp29.ClassName; { btgp29: TJvImgBtn; }
    btgp30.ClassName; { btgp30: TJvImgBtn; }
    btgp31.ClassName; { btgp31: TJvImgBtn; }
    btgp32.ClassName; { btgp32: TJvImgBtn; }
    btgp33.ClassName; { btgp33: TJvImgBtn; }
    btgp34.ClassName; { btgp34: TJvImgBtn; }
    btgp35.ClassName; { btgp35: TJvImgBtn; }
    SpeedButton5.ClassName; { SpeedButton5: TSpeedButton; }
    SpeedButton4.ClassName; { SpeedButton4: TSpeedButton; }
    pgProdutos.ClassName; { pgProdutos: TJvPageControl; }
    TabSheet6.ClassName; { TabSheet6: TTabSheet; }
    btpd011.ClassName; { btpd011: TJvImgBtn; }
    btpd012.ClassName; { btpd012: TJvImgBtn; }
    btpd013.ClassName; { btpd013: TJvImgBtn; }
    btpd014.ClassName; { btpd014: TJvImgBtn; }
    JvImgBtn1.ClassName; { JvImgBtn1: TJvImgBtn; }
    JvImgBtn2.ClassName; { JvImgBtn2: TJvImgBtn; }
    JvImgBtn3.ClassName; { JvImgBtn3: TJvImgBtn; }
    JvImgBtn4.ClassName; { JvImgBtn4: TJvImgBtn; }
    JvImgBtn5.ClassName; { JvImgBtn5: TJvImgBtn; }
    JvImgBtn6.ClassName; { JvImgBtn6: TJvImgBtn; }
    JvImgBtn7.ClassName; { JvImgBtn7: TJvImgBtn; }
    JvImgBtn8.ClassName; { JvImgBtn8: TJvImgBtn; }
    JvImgBtn9.ClassName; { JvImgBtn9: TJvImgBtn; }
    JvImgBtn10.ClassName; { JvImgBtn10: TJvImgBtn; }
    JvImgBtn11.ClassName; { JvImgBtn11: TJvImgBtn; }
    JvImgBtn12.ClassName; { JvImgBtn12: TJvImgBtn; }
    JvImgBtn13.ClassName; { JvImgBtn13: TJvImgBtn; }
    JvImgBtn14.ClassName; { JvImgBtn14: TJvImgBtn; }
    JvImgBtn15.ClassName; { JvImgBtn15: TJvImgBtn; }
    JvImgBtn16.ClassName; { JvImgBtn16: TJvImgBtn; }
    JvImgBtn17.ClassName; { JvImgBtn17: TJvImgBtn; }
    JvImgBtn18.ClassName; { JvImgBtn18: TJvImgBtn; }
    JvImgBtn19.ClassName; { JvImgBtn19: TJvImgBtn; }
    JvImgBtn20.ClassName; { JvImgBtn20: TJvImgBtn; }
    JvImgBtn21.ClassName; { JvImgBtn21: TJvImgBtn; }
    JvImgBtn22.ClassName; { JvImgBtn22: TJvImgBtn; }
    JvImgBtn23.ClassName; { JvImgBtn23: TJvImgBtn; }
    JvImgBtn24.ClassName; { JvImgBtn24: TJvImgBtn; }
    TabSheet7.ClassName; { TabSheet7: TTabSheet; }
    JvImgBtn25.ClassName; { JvImgBtn25: TJvImgBtn; }
    JvImgBtn26.ClassName; { JvImgBtn26: TJvImgBtn; }
    JvImgBtn27.ClassName; { JvImgBtn27: TJvImgBtn; }
    JvImgBtn28.ClassName; { JvImgBtn28: TJvImgBtn; }
    JvImgBtn29.ClassName; { JvImgBtn29: TJvImgBtn; }
    JvImgBtn30.ClassName; { JvImgBtn30: TJvImgBtn; }
    JvImgBtn31.ClassName; { JvImgBtn31: TJvImgBtn; }
    JvImgBtn32.ClassName; { JvImgBtn32: TJvImgBtn; }
    JvImgBtn33.ClassName; { JvImgBtn33: TJvImgBtn; }
    JvImgBtn34.ClassName; { JvImgBtn34: TJvImgBtn; }
    JvImgBtn35.ClassName; { JvImgBtn35: TJvImgBtn; }
    JvImgBtn36.ClassName; { JvImgBtn36: TJvImgBtn; }
    JvImgBtn37.ClassName; { JvImgBtn37: TJvImgBtn; }
    JvImgBtn38.ClassName; { JvImgBtn38: TJvImgBtn; }
    JvImgBtn39.ClassName; { JvImgBtn39: TJvImgBtn; }
    JvImgBtn40.ClassName; { JvImgBtn40: TJvImgBtn; }
    JvImgBtn41.ClassName; { JvImgBtn41: TJvImgBtn; }
    JvImgBtn42.ClassName; { JvImgBtn42: TJvImgBtn; }
    JvImgBtn43.ClassName; { JvImgBtn43: TJvImgBtn; }
    JvImgBtn44.ClassName; { JvImgBtn44: TJvImgBtn; }
    JvImgBtn45.ClassName; { JvImgBtn45: TJvImgBtn; }
    JvImgBtn46.ClassName; { JvImgBtn46: TJvImgBtn; }
    JvImgBtn47.ClassName; { JvImgBtn47: TJvImgBtn; }
    JvImgBtn48.ClassName; { JvImgBtn48: TJvImgBtn; }
    JvImgBtn49.ClassName; { JvImgBtn49: TJvImgBtn; }
    JvImgBtn50.ClassName; { JvImgBtn50: TJvImgBtn; }
    JvImgBtn51.ClassName; { JvImgBtn51: TJvImgBtn; }
    JvImgBtn52.ClassName; { JvImgBtn52: TJvImgBtn; }
    TabSheet8.ClassName; { TabSheet8: TTabSheet; }
    JvImgBtn53.ClassName; { JvImgBtn53: TJvImgBtn; }
    JvImgBtn54.ClassName; { JvImgBtn54: TJvImgBtn; }
    JvImgBtn55.ClassName; { JvImgBtn55: TJvImgBtn; }
    JvImgBtn56.ClassName; { JvImgBtn56: TJvImgBtn; }
    JvImgBtn60.ClassName; { JvImgBtn60: TJvImgBtn; }
    JvImgBtn59.ClassName; { JvImgBtn59: TJvImgBtn; }
    JvImgBtn58.ClassName; { JvImgBtn58: TJvImgBtn; }
    JvImgBtn57.ClassName; { JvImgBtn57: TJvImgBtn; }
    JvImgBtn61.ClassName; { JvImgBtn61: TJvImgBtn; }
    JvImgBtn62.ClassName; { JvImgBtn62: TJvImgBtn; }
    JvImgBtn63.ClassName; { JvImgBtn63: TJvImgBtn; }
    JvImgBtn64.ClassName; { JvImgBtn64: TJvImgBtn; }
    JvImgBtn68.ClassName; { JvImgBtn68: TJvImgBtn; }
    JvImgBtn67.ClassName; { JvImgBtn67: TJvImgBtn; }
    JvImgBtn66.ClassName; { JvImgBtn66: TJvImgBtn; }
    JvImgBtn65.ClassName; { JvImgBtn65: TJvImgBtn; }
    JvImgBtn69.ClassName; { JvImgBtn69: TJvImgBtn; }
    JvImgBtn70.ClassName; { JvImgBtn70: TJvImgBtn; }
    JvImgBtn71.ClassName; { JvImgBtn71: TJvImgBtn; }
    JvImgBtn72.ClassName; { JvImgBtn72: TJvImgBtn; }
    JvImgBtn76.ClassName; { JvImgBtn76: TJvImgBtn; }
    JvImgBtn75.ClassName; { JvImgBtn75: TJvImgBtn; }
    JvImgBtn74.ClassName; { JvImgBtn74: TJvImgBtn; }
    JvImgBtn73.ClassName; { JvImgBtn73: TJvImgBtn; }
    JvImgBtn77.ClassName; { JvImgBtn77: TJvImgBtn; }
    JvImgBtn78.ClassName; { JvImgBtn78: TJvImgBtn; }
    JvImgBtn79.ClassName; { JvImgBtn79: TJvImgBtn; }
    JvImgBtn80.ClassName; { JvImgBtn80: TJvImgBtn; }
    TabSheet9.ClassName; { TabSheet9: TTabSheet; }
    JvImgBtn81.ClassName; { JvImgBtn81: TJvImgBtn; }
    JvImgBtn82.ClassName; { JvImgBtn82: TJvImgBtn; }
    JvImgBtn83.ClassName; { JvImgBtn83: TJvImgBtn; }
    JvImgBtn84.ClassName; { JvImgBtn84: TJvImgBtn; }
    JvImgBtn85.ClassName; { JvImgBtn85: TJvImgBtn; }
    JvImgBtn86.ClassName; { JvImgBtn86: TJvImgBtn; }
    JvImgBtn87.ClassName; { JvImgBtn87: TJvImgBtn; }
    JvImgBtn88.ClassName; { JvImgBtn88: TJvImgBtn; }
    JvImgBtn89.ClassName; { JvImgBtn89: TJvImgBtn; }
    JvImgBtn90.ClassName; { JvImgBtn90: TJvImgBtn; }
    JvImgBtn91.ClassName; { JvImgBtn91: TJvImgBtn; }
    JvImgBtn92.ClassName; { JvImgBtn92: TJvImgBtn; }
    JvImgBtn93.ClassName; { JvImgBtn93: TJvImgBtn; }
    JvImgBtn94.ClassName; { JvImgBtn94: TJvImgBtn; }
    JvImgBtn95.ClassName; { JvImgBtn95: TJvImgBtn; }
    JvImgBtn96.ClassName; { JvImgBtn96: TJvImgBtn; }
    JvImgBtn97.ClassName; { JvImgBtn97: TJvImgBtn; }
    JvImgBtn98.ClassName; { JvImgBtn98: TJvImgBtn; }
    JvImgBtn99.ClassName; { JvImgBtn99: TJvImgBtn; }
    JvImgBtn100.ClassName; { JvImgBtn100: TJvImgBtn; }
    JvImgBtn101.ClassName; { JvImgBtn101: TJvImgBtn; }
    JvImgBtn102.ClassName; { JvImgBtn102: TJvImgBtn; }
    JvImgBtn103.ClassName; { JvImgBtn103: TJvImgBtn; }
    JvImgBtn104.ClassName; { JvImgBtn104: TJvImgBtn; }
    JvImgBtn105.ClassName; { JvImgBtn105: TJvImgBtn; }
    JvImgBtn106.ClassName; { JvImgBtn106: TJvImgBtn; }
    JvImgBtn107.ClassName; { JvImgBtn107: TJvImgBtn; }
    JvImgBtn108.ClassName; { JvImgBtn108: TJvImgBtn; }
    TabSheet10.ClassName; { TabSheet10: TTabSheet; }
    JvImgBtn109.ClassName; { JvImgBtn109: TJvImgBtn; }
    JvImgBtn110.ClassName; { JvImgBtn110: TJvImgBtn; }
    JvImgBtn111.ClassName; { JvImgBtn111: TJvImgBtn; }
    JvImgBtn112.ClassName; { JvImgBtn112: TJvImgBtn; }
    JvImgBtn113.ClassName; { JvImgBtn113: TJvImgBtn; }
    JvImgBtn114.ClassName; { JvImgBtn114: TJvImgBtn; }
    JvImgBtn115.ClassName; { JvImgBtn115: TJvImgBtn; }
    JvImgBtn116.ClassName; { JvImgBtn116: TJvImgBtn; }
    JvImgBtn117.ClassName; { JvImgBtn117: TJvImgBtn; }
    JvImgBtn118.ClassName; { JvImgBtn118: TJvImgBtn; }
    JvImgBtn119.ClassName; { JvImgBtn119: TJvImgBtn; }
    JvImgBtn120.ClassName; { JvImgBtn120: TJvImgBtn; }
    JvImgBtn121.ClassName; { JvImgBtn121: TJvImgBtn; }
    JvImgBtn122.ClassName; { JvImgBtn122: TJvImgBtn; }
    JvImgBtn123.ClassName; { JvImgBtn123: TJvImgBtn; }
    JvImgBtn124.ClassName; { JvImgBtn124: TJvImgBtn; }
    JvImgBtn125.ClassName; { JvImgBtn125: TJvImgBtn; }
    JvImgBtn126.ClassName; { JvImgBtn126: TJvImgBtn; }
    JvImgBtn127.ClassName; { JvImgBtn127: TJvImgBtn; }
    JvImgBtn128.ClassName; { JvImgBtn128: TJvImgBtn; }
    JvImgBtn129.ClassName; { JvImgBtn129: TJvImgBtn; }
    JvImgBtn130.ClassName; { JvImgBtn130: TJvImgBtn; }
    JvImgBtn131.ClassName; { JvImgBtn131: TJvImgBtn; }
    JvImgBtn132.ClassName; { JvImgBtn132: TJvImgBtn; }
    JvImgBtn133.ClassName; { JvImgBtn133: TJvImgBtn; }
    JvImgBtn134.ClassName; { JvImgBtn134: TJvImgBtn; }
    JvImgBtn135.ClassName; { JvImgBtn135: TJvImgBtn; }
    JvImgBtn136.ClassName; { JvImgBtn136: TJvImgBtn; }
    TabSheet11.ClassName; { TabSheet11: TTabSheet; }
    JvImgBtn137.ClassName; { JvImgBtn137: TJvImgBtn; }
    JvImgBtn138.ClassName; { JvImgBtn138: TJvImgBtn; }
    JvImgBtn139.ClassName; { JvImgBtn139: TJvImgBtn; }
    JvImgBtn140.ClassName; { JvImgBtn140: TJvImgBtn; }
    JvImgBtn141.ClassName; { JvImgBtn141: TJvImgBtn; }
    JvImgBtn142.ClassName; { JvImgBtn142: TJvImgBtn; }
    JvImgBtn143.ClassName; { JvImgBtn143: TJvImgBtn; }
    JvImgBtn144.ClassName; { JvImgBtn144: TJvImgBtn; }
    JvImgBtn145.ClassName; { JvImgBtn145: TJvImgBtn; }
    JvImgBtn146.ClassName; { JvImgBtn146: TJvImgBtn; }
    JvImgBtn147.ClassName; { JvImgBtn147: TJvImgBtn; }
    JvImgBtn148.ClassName; { JvImgBtn148: TJvImgBtn; }
    JvImgBtn149.ClassName; { JvImgBtn149: TJvImgBtn; }
    JvImgBtn150.ClassName; { JvImgBtn150: TJvImgBtn; }
    JvImgBtn151.ClassName; { JvImgBtn151: TJvImgBtn; }
    JvImgBtn152.ClassName; { JvImgBtn152: TJvImgBtn; }
    JvImgBtn153.ClassName; { JvImgBtn153: TJvImgBtn; }
    JvImgBtn154.ClassName; { JvImgBtn154: TJvImgBtn; }
    JvImgBtn155.ClassName; { JvImgBtn155: TJvImgBtn; }
    JvImgBtn156.ClassName; { JvImgBtn156: TJvImgBtn; }
    JvImgBtn157.ClassName; { JvImgBtn157: TJvImgBtn; }
    JvImgBtn158.ClassName; { JvImgBtn158: TJvImgBtn; }
    JvImgBtn159.ClassName; { JvImgBtn159: TJvImgBtn; }
    JvImgBtn160.ClassName; { JvImgBtn160: TJvImgBtn; }
    JvImgBtn161.ClassName; { JvImgBtn161: TJvImgBtn; }
    JvImgBtn162.ClassName; { JvImgBtn162: TJvImgBtn; }
    JvImgBtn163.ClassName; { JvImgBtn163: TJvImgBtn; }
    JvImgBtn164.ClassName; { JvImgBtn164: TJvImgBtn; }
    TabSheet12.ClassName; { TabSheet12: TTabSheet; }
    JvImgBtn165.ClassName; { JvImgBtn165: TJvImgBtn; }
    JvImgBtn166.ClassName; { JvImgBtn166: TJvImgBtn; }
    JvImgBtn167.ClassName; { JvImgBtn167: TJvImgBtn; }
    JvImgBtn168.ClassName; { JvImgBtn168: TJvImgBtn; }
    JvImgBtn169.ClassName; { JvImgBtn169: TJvImgBtn; }
    JvImgBtn170.ClassName; { JvImgBtn170: TJvImgBtn; }
    JvImgBtn171.ClassName; { JvImgBtn171: TJvImgBtn; }
    JvImgBtn172.ClassName; { JvImgBtn172: TJvImgBtn; }
    JvImgBtn173.ClassName; { JvImgBtn173: TJvImgBtn; }
    JvImgBtn174.ClassName; { JvImgBtn174: TJvImgBtn; }
    JvImgBtn175.ClassName; { JvImgBtn175: TJvImgBtn; }
    JvImgBtn176.ClassName; { JvImgBtn176: TJvImgBtn; }
    JvImgBtn177.ClassName; { JvImgBtn177: TJvImgBtn; }
    JvImgBtn178.ClassName; { JvImgBtn178: TJvImgBtn; }
    JvImgBtn179.ClassName; { JvImgBtn179: TJvImgBtn; }
    JvImgBtn180.ClassName; { JvImgBtn180: TJvImgBtn; }
    JvImgBtn181.ClassName; { JvImgBtn181: TJvImgBtn; }
    JvImgBtn182.ClassName; { JvImgBtn182: TJvImgBtn; }
    JvImgBtn183.ClassName; { JvImgBtn183: TJvImgBtn; }
    JvImgBtn184.ClassName; { JvImgBtn184: TJvImgBtn; }
    JvImgBtn185.ClassName; { JvImgBtn185: TJvImgBtn; }
    JvImgBtn186.ClassName; { JvImgBtn186: TJvImgBtn; }
    JvImgBtn187.ClassName; { JvImgBtn187: TJvImgBtn; }
    JvImgBtn188.ClassName; { JvImgBtn188: TJvImgBtn; }
    JvImgBtn189.ClassName; { JvImgBtn189: TJvImgBtn; }
    JvImgBtn190.ClassName; { JvImgBtn190: TJvImgBtn; }
    JvImgBtn191.ClassName; { JvImgBtn191: TJvImgBtn; }
    JvImgBtn192.ClassName; { JvImgBtn192: TJvImgBtn; }
    TabSheet13.ClassName; { TabSheet13: TTabSheet; }
    JvImgBtn193.ClassName; { JvImgBtn193: TJvImgBtn; }
    JvImgBtn194.ClassName; { JvImgBtn194: TJvImgBtn; }
    JvImgBtn195.ClassName; { JvImgBtn195: TJvImgBtn; }
    JvImgBtn196.ClassName; { JvImgBtn196: TJvImgBtn; }
    JvImgBtn197.ClassName; { JvImgBtn197: TJvImgBtn; }
    JvImgBtn198.ClassName; { JvImgBtn198: TJvImgBtn; }
    JvImgBtn199.ClassName; { JvImgBtn199: TJvImgBtn; }
    JvImgBtn200.ClassName; { JvImgBtn200: TJvImgBtn; }
    JvImgBtn201.ClassName; { JvImgBtn201: TJvImgBtn; }
    JvImgBtn202.ClassName; { JvImgBtn202: TJvImgBtn; }
    JvImgBtn203.ClassName; { JvImgBtn203: TJvImgBtn; }
    JvImgBtn204.ClassName; { JvImgBtn204: TJvImgBtn; }
    JvImgBtn205.ClassName; { JvImgBtn205: TJvImgBtn; }
    JvImgBtn206.ClassName; { JvImgBtn206: TJvImgBtn; }
    JvImgBtn207.ClassName; { JvImgBtn207: TJvImgBtn; }
    JvImgBtn208.ClassName; { JvImgBtn208: TJvImgBtn; }
    JvImgBtn209.ClassName; { JvImgBtn209: TJvImgBtn; }
    JvImgBtn210.ClassName; { JvImgBtn210: TJvImgBtn; }
    JvImgBtn211.ClassName; { JvImgBtn211: TJvImgBtn; }
    JvImgBtn212.ClassName; { JvImgBtn212: TJvImgBtn; }
    JvImgBtn213.ClassName; { JvImgBtn213: TJvImgBtn; }
    JvImgBtn214.ClassName; { JvImgBtn214: TJvImgBtn; }
    JvImgBtn215.ClassName; { JvImgBtn215: TJvImgBtn; }
    JvImgBtn216.ClassName; { JvImgBtn216: TJvImgBtn; }
    JvImgBtn217.ClassName; { JvImgBtn217: TJvImgBtn; }
    JvImgBtn218.ClassName; { JvImgBtn218: TJvImgBtn; }
    JvImgBtn219.ClassName; { JvImgBtn219: TJvImgBtn; }
    JvImgBtn220.ClassName; { JvImgBtn220: TJvImgBtn; }
    TabSheet14.ClassName; { TabSheet14: TTabSheet; }
    JvImgBtn221.ClassName; { JvImgBtn221: TJvImgBtn; }
    JvImgBtn222.ClassName; { JvImgBtn222: TJvImgBtn; }
    JvImgBtn223.ClassName; { JvImgBtn223: TJvImgBtn; }
    JvImgBtn224.ClassName; { JvImgBtn224: TJvImgBtn; }
    JvImgBtn225.ClassName; { JvImgBtn225: TJvImgBtn; }
    JvImgBtn226.ClassName; { JvImgBtn226: TJvImgBtn; }
    JvImgBtn227.ClassName; { JvImgBtn227: TJvImgBtn; }
    JvImgBtn228.ClassName; { JvImgBtn228: TJvImgBtn; }
    JvImgBtn229.ClassName; { JvImgBtn229: TJvImgBtn; }
    JvImgBtn230.ClassName; { JvImgBtn230: TJvImgBtn; }
    JvImgBtn231.ClassName; { JvImgBtn231: TJvImgBtn; }
    JvImgBtn232.ClassName; { JvImgBtn232: TJvImgBtn; }
    JvImgBtn233.ClassName; { JvImgBtn233: TJvImgBtn; }
    JvImgBtn234.ClassName; { JvImgBtn234: TJvImgBtn; }
    JvImgBtn235.ClassName; { JvImgBtn235: TJvImgBtn; }
    JvImgBtn236.ClassName; { JvImgBtn236: TJvImgBtn; }
    JvImgBtn237.ClassName; { JvImgBtn237: TJvImgBtn; }
    JvImgBtn238.ClassName; { JvImgBtn238: TJvImgBtn; }
    JvImgBtn239.ClassName; { JvImgBtn239: TJvImgBtn; }
    JvImgBtn240.ClassName; { JvImgBtn240: TJvImgBtn; }
    JvImgBtn241.ClassName; { JvImgBtn241: TJvImgBtn; }
    JvImgBtn242.ClassName; { JvImgBtn242: TJvImgBtn; }
    JvImgBtn243.ClassName; { JvImgBtn243: TJvImgBtn; }
    JvImgBtn244.ClassName; { JvImgBtn244: TJvImgBtn; }
    JvImgBtn245.ClassName; { JvImgBtn245: TJvImgBtn; }
    JvImgBtn246.ClassName; { JvImgBtn246: TJvImgBtn; }
    JvImgBtn247.ClassName; { JvImgBtn247: TJvImgBtn; }
    JvImgBtn248.ClassName; { JvImgBtn248: TJvImgBtn; }
    TabSheet15.ClassName; { TabSheet15: TTabSheet; }
    JvImgBtn249.ClassName; { JvImgBtn249: TJvImgBtn; }
    JvImgBtn250.ClassName; { JvImgBtn250: TJvImgBtn; }
    JvImgBtn251.ClassName; { JvImgBtn251: TJvImgBtn; }
    JvImgBtn252.ClassName; { JvImgBtn252: TJvImgBtn; }
    JvImgBtn253.ClassName; { JvImgBtn253: TJvImgBtn; }
    JvImgBtn254.ClassName; { JvImgBtn254: TJvImgBtn; }
    JvImgBtn255.ClassName; { JvImgBtn255: TJvImgBtn; }
    JvImgBtn256.ClassName; { JvImgBtn256: TJvImgBtn; }
    JvImgBtn257.ClassName; { JvImgBtn257: TJvImgBtn; }
    JvImgBtn258.ClassName; { JvImgBtn258: TJvImgBtn; }
    JvImgBtn259.ClassName; { JvImgBtn259: TJvImgBtn; }
    JvImgBtn260.ClassName; { JvImgBtn260: TJvImgBtn; }
    JvImgBtn261.ClassName; { JvImgBtn261: TJvImgBtn; }
    JvImgBtn262.ClassName; { JvImgBtn262: TJvImgBtn; }
    JvImgBtn263.ClassName; { JvImgBtn263: TJvImgBtn; }
    JvImgBtn264.ClassName; { JvImgBtn264: TJvImgBtn; }
    JvImgBtn265.ClassName; { JvImgBtn265: TJvImgBtn; }
    JvImgBtn266.ClassName; { JvImgBtn266: TJvImgBtn; }
    JvImgBtn267.ClassName; { JvImgBtn267: TJvImgBtn; }
    JvImgBtn268.ClassName; { JvImgBtn268: TJvImgBtn; }
    JvImgBtn269.ClassName; { JvImgBtn269: TJvImgBtn; }
    JvImgBtn270.ClassName; { JvImgBtn270: TJvImgBtn; }
    JvImgBtn271.ClassName; { JvImgBtn271: TJvImgBtn; }
    JvImgBtn272.ClassName; { JvImgBtn272: TJvImgBtn; }
    JvImgBtn273.ClassName; { JvImgBtn273: TJvImgBtn; }
    JvImgBtn274.ClassName; { JvImgBtn274: TJvImgBtn; }
    JvImgBtn275.ClassName; { JvImgBtn275: TJvImgBtn; }
    JvImgBtn276.ClassName; { JvImgBtn276: TJvImgBtn; }
    TabSheet16.ClassName; { TabSheet16: TTabSheet; }
    JvImgBtn277.ClassName; { JvImgBtn277: TJvImgBtn; }
    JvImgBtn278.ClassName; { JvImgBtn278: TJvImgBtn; }
    JvImgBtn279.ClassName; { JvImgBtn279: TJvImgBtn; }
    JvImgBtn280.ClassName; { JvImgBtn280: TJvImgBtn; }
    JvImgBtn281.ClassName; { JvImgBtn281: TJvImgBtn; }
    JvImgBtn282.ClassName; { JvImgBtn282: TJvImgBtn; }
    JvImgBtn283.ClassName; { JvImgBtn283: TJvImgBtn; }
    JvImgBtn284.ClassName; { JvImgBtn284: TJvImgBtn; }
    JvImgBtn285.ClassName; { JvImgBtn285: TJvImgBtn; }
    JvImgBtn286.ClassName; { JvImgBtn286: TJvImgBtn; }
    JvImgBtn287.ClassName; { JvImgBtn287: TJvImgBtn; }
    JvImgBtn288.ClassName; { JvImgBtn288: TJvImgBtn; }
    JvImgBtn289.ClassName; { JvImgBtn289: TJvImgBtn; }
    JvImgBtn290.ClassName; { JvImgBtn290: TJvImgBtn; }
    JvImgBtn291.ClassName; { JvImgBtn291: TJvImgBtn; }
    JvImgBtn292.ClassName; { JvImgBtn292: TJvImgBtn; }
    JvImgBtn293.ClassName; { JvImgBtn293: TJvImgBtn; }
    JvImgBtn294.ClassName; { JvImgBtn294: TJvImgBtn; }
    JvImgBtn295.ClassName; { JvImgBtn295: TJvImgBtn; }
    JvImgBtn296.ClassName; { JvImgBtn296: TJvImgBtn; }
    JvImgBtn297.ClassName; { JvImgBtn297: TJvImgBtn; }
    JvImgBtn298.ClassName; { JvImgBtn298: TJvImgBtn; }
    JvImgBtn299.ClassName; { JvImgBtn299: TJvImgBtn; }
    JvImgBtn300.ClassName; { JvImgBtn300: TJvImgBtn; }
    JvImgBtn301.ClassName; { JvImgBtn301: TJvImgBtn; }
    JvImgBtn302.ClassName; { JvImgBtn302: TJvImgBtn; }
    JvImgBtn303.ClassName; { JvImgBtn303: TJvImgBtn; }
    JvImgBtn304.ClassName; { JvImgBtn304: TJvImgBtn; }
    TabSheet17.ClassName; { TabSheet17: TTabSheet; }
    JvImgBtn305.ClassName; { JvImgBtn305: TJvImgBtn; }
    JvImgBtn306.ClassName; { JvImgBtn306: TJvImgBtn; }
    JvImgBtn307.ClassName; { JvImgBtn307: TJvImgBtn; }
    JvImgBtn308.ClassName; { JvImgBtn308: TJvImgBtn; }
    JvImgBtn309.ClassName; { JvImgBtn309: TJvImgBtn; }
    JvImgBtn310.ClassName; { JvImgBtn310: TJvImgBtn; }
    JvImgBtn311.ClassName; { JvImgBtn311: TJvImgBtn; }
    JvImgBtn312.ClassName; { JvImgBtn312: TJvImgBtn; }
    JvImgBtn313.ClassName; { JvImgBtn313: TJvImgBtn; }
    JvImgBtn314.ClassName; { JvImgBtn314: TJvImgBtn; }
    JvImgBtn315.ClassName; { JvImgBtn315: TJvImgBtn; }
    JvImgBtn316.ClassName; { JvImgBtn316: TJvImgBtn; }
    JvImgBtn317.ClassName; { JvImgBtn317: TJvImgBtn; }
    JvImgBtn318.ClassName; { JvImgBtn318: TJvImgBtn; }
    JvImgBtn319.ClassName; { JvImgBtn319: TJvImgBtn; }
    JvImgBtn320.ClassName; { JvImgBtn320: TJvImgBtn; }
    JvImgBtn321.ClassName; { JvImgBtn321: TJvImgBtn; }
    JvImgBtn322.ClassName; { JvImgBtn322: TJvImgBtn; }
    JvImgBtn323.ClassName; { JvImgBtn323: TJvImgBtn; }
    JvImgBtn324.ClassName; { JvImgBtn324: TJvImgBtn; }
    JvImgBtn325.ClassName; { JvImgBtn325: TJvImgBtn; }
    JvImgBtn326.ClassName; { JvImgBtn326: TJvImgBtn; }
    JvImgBtn327.ClassName; { JvImgBtn327: TJvImgBtn; }
    JvImgBtn328.ClassName; { JvImgBtn328: TJvImgBtn; }
    JvImgBtn329.ClassName; { JvImgBtn329: TJvImgBtn; }
    JvImgBtn330.ClassName; { JvImgBtn330: TJvImgBtn; }
    JvImgBtn331.ClassName; { JvImgBtn331: TJvImgBtn; }
    JvImgBtn332.ClassName; { JvImgBtn332: TJvImgBtn; }
    TabSheet18.ClassName; { TabSheet18: TTabSheet; }
    JvImgBtn333.ClassName; { JvImgBtn333: TJvImgBtn; }
    JvImgBtn334.ClassName; { JvImgBtn334: TJvImgBtn; }
    JvImgBtn335.ClassName; { JvImgBtn335: TJvImgBtn; }
    JvImgBtn336.ClassName; { JvImgBtn336: TJvImgBtn; }
    JvImgBtn337.ClassName; { JvImgBtn337: TJvImgBtn; }
    JvImgBtn338.ClassName; { JvImgBtn338: TJvImgBtn; }
    JvImgBtn339.ClassName; { JvImgBtn339: TJvImgBtn; }
    JvImgBtn340.ClassName; { JvImgBtn340: TJvImgBtn; }
    JvImgBtn341.ClassName; { JvImgBtn341: TJvImgBtn; }
    JvImgBtn342.ClassName; { JvImgBtn342: TJvImgBtn; }
    JvImgBtn343.ClassName; { JvImgBtn343: TJvImgBtn; }
    JvImgBtn344.ClassName; { JvImgBtn344: TJvImgBtn; }
    JvImgBtn345.ClassName; { JvImgBtn345: TJvImgBtn; }
    JvImgBtn346.ClassName; { JvImgBtn346: TJvImgBtn; }
    JvImgBtn347.ClassName; { JvImgBtn347: TJvImgBtn; }
    JvImgBtn348.ClassName; { JvImgBtn348: TJvImgBtn; }
    JvImgBtn349.ClassName; { JvImgBtn349: TJvImgBtn; }
    JvImgBtn350.ClassName; { JvImgBtn350: TJvImgBtn; }
    JvImgBtn351.ClassName; { JvImgBtn351: TJvImgBtn; }
    JvImgBtn352.ClassName; { JvImgBtn352: TJvImgBtn; }
    JvImgBtn353.ClassName; { JvImgBtn353: TJvImgBtn; }
    JvImgBtn354.ClassName; { JvImgBtn354: TJvImgBtn; }
    JvImgBtn355.ClassName; { JvImgBtn355: TJvImgBtn; }
    JvImgBtn356.ClassName; { JvImgBtn356: TJvImgBtn; }
    JvImgBtn357.ClassName; { JvImgBtn357: TJvImgBtn; }
    JvImgBtn358.ClassName; { JvImgBtn358: TJvImgBtn; }
    JvImgBtn359.ClassName; { JvImgBtn359: TJvImgBtn; }
    JvImgBtn360.ClassName; { JvImgBtn360: TJvImgBtn; }
    TabSheet19.ClassName; { TabSheet19: TTabSheet; }
    JvImgBtn361.ClassName; { JvImgBtn361: TJvImgBtn; }
    JvImgBtn362.ClassName; { JvImgBtn362: TJvImgBtn; }
    JvImgBtn363.ClassName; { JvImgBtn363: TJvImgBtn; }
    JvImgBtn364.ClassName; { JvImgBtn364: TJvImgBtn; }
    JvImgBtn365.ClassName; { JvImgBtn365: TJvImgBtn; }
    JvImgBtn366.ClassName; { JvImgBtn366: TJvImgBtn; }
    JvImgBtn367.ClassName; { JvImgBtn367: TJvImgBtn; }
    JvImgBtn368.ClassName; { JvImgBtn368: TJvImgBtn; }
    JvImgBtn369.ClassName; { JvImgBtn369: TJvImgBtn; }
    JvImgBtn370.ClassName; { JvImgBtn370: TJvImgBtn; }
    JvImgBtn371.ClassName; { JvImgBtn371: TJvImgBtn; }
    JvImgBtn372.ClassName; { JvImgBtn372: TJvImgBtn; }
    JvImgBtn373.ClassName; { JvImgBtn373: TJvImgBtn; }
    JvImgBtn374.ClassName; { JvImgBtn374: TJvImgBtn; }
    JvImgBtn375.ClassName; { JvImgBtn375: TJvImgBtn; }
    JvImgBtn376.ClassName; { JvImgBtn376: TJvImgBtn; }
    JvImgBtn377.ClassName; { JvImgBtn377: TJvImgBtn; }
    JvImgBtn378.ClassName; { JvImgBtn378: TJvImgBtn; }
    JvImgBtn379.ClassName; { JvImgBtn379: TJvImgBtn; }
    JvImgBtn380.ClassName; { JvImgBtn380: TJvImgBtn; }
    JvImgBtn381.ClassName; { JvImgBtn381: TJvImgBtn; }
    JvImgBtn382.ClassName; { JvImgBtn382: TJvImgBtn; }
    JvImgBtn383.ClassName; { JvImgBtn383: TJvImgBtn; }
    JvImgBtn384.ClassName; { JvImgBtn384: TJvImgBtn; }
    JvImgBtn385.ClassName; { JvImgBtn385: TJvImgBtn; }
    JvImgBtn386.ClassName; { JvImgBtn386: TJvImgBtn; }
    JvImgBtn387.ClassName; { JvImgBtn387: TJvImgBtn; }
    JvImgBtn388.ClassName; { JvImgBtn388: TJvImgBtn; }
    TabSheet20.ClassName; { TabSheet20: TTabSheet; }
    JvImgBtn389.ClassName; { JvImgBtn389: TJvImgBtn; }
    JvImgBtn390.ClassName; { JvImgBtn390: TJvImgBtn; }
    JvImgBtn391.ClassName; { JvImgBtn391: TJvImgBtn; }
    JvImgBtn392.ClassName; { JvImgBtn392: TJvImgBtn; }
    JvImgBtn393.ClassName; { JvImgBtn393: TJvImgBtn; }
    JvImgBtn394.ClassName; { JvImgBtn394: TJvImgBtn; }
    JvImgBtn395.ClassName; { JvImgBtn395: TJvImgBtn; }
    JvImgBtn396.ClassName; { JvImgBtn396: TJvImgBtn; }
    JvImgBtn397.ClassName; { JvImgBtn397: TJvImgBtn; }
    JvImgBtn398.ClassName; { JvImgBtn398: TJvImgBtn; }
    JvImgBtn399.ClassName; { JvImgBtn399: TJvImgBtn; }
    JvImgBtn400.ClassName; { JvImgBtn400: TJvImgBtn; }
    JvImgBtn401.ClassName; { JvImgBtn401: TJvImgBtn; }
    JvImgBtn402.ClassName; { JvImgBtn402: TJvImgBtn; }
    JvImgBtn403.ClassName; { JvImgBtn403: TJvImgBtn; }
    JvImgBtn404.ClassName; { JvImgBtn404: TJvImgBtn; }
    JvImgBtn405.ClassName; { JvImgBtn405: TJvImgBtn; }
    JvImgBtn406.ClassName; { JvImgBtn406: TJvImgBtn; }
    JvImgBtn407.ClassName; { JvImgBtn407: TJvImgBtn; }
    JvImgBtn408.ClassName; { JvImgBtn408: TJvImgBtn; }
    JvImgBtn409.ClassName; { JvImgBtn409: TJvImgBtn; }
    JvImgBtn410.ClassName; { JvImgBtn410: TJvImgBtn; }
    JvImgBtn411.ClassName; { JvImgBtn411: TJvImgBtn; }
    JvImgBtn412.ClassName; { JvImgBtn412: TJvImgBtn; }
    JvImgBtn413.ClassName; { JvImgBtn413: TJvImgBtn; }
    JvImgBtn414.ClassName; { JvImgBtn414: TJvImgBtn; }
    JvImgBtn415.ClassName; { JvImgBtn415: TJvImgBtn; }
    JvImgBtn416.ClassName; { JvImgBtn416: TJvImgBtn; }
    TabSheet21.ClassName; { TabSheet21: TTabSheet; }
    JvImgBtn417.ClassName; { JvImgBtn417: TJvImgBtn; }
    JvImgBtn418.ClassName; { JvImgBtn418: TJvImgBtn; }
    JvImgBtn419.ClassName; { JvImgBtn419: TJvImgBtn; }
    JvImgBtn420.ClassName; { JvImgBtn420: TJvImgBtn; }
    JvImgBtn421.ClassName; { JvImgBtn421: TJvImgBtn; }
    JvImgBtn422.ClassName; { JvImgBtn422: TJvImgBtn; }
    JvImgBtn423.ClassName; { JvImgBtn423: TJvImgBtn; }
    JvImgBtn424.ClassName; { JvImgBtn424: TJvImgBtn; }
    JvImgBtn425.ClassName; { JvImgBtn425: TJvImgBtn; }
    JvImgBtn426.ClassName; { JvImgBtn426: TJvImgBtn; }
    JvImgBtn427.ClassName; { JvImgBtn427: TJvImgBtn; }
    JvImgBtn428.ClassName; { JvImgBtn428: TJvImgBtn; }
    JvImgBtn429.ClassName; { JvImgBtn429: TJvImgBtn; }
    JvImgBtn430.ClassName; { JvImgBtn430: TJvImgBtn; }
    JvImgBtn431.ClassName; { JvImgBtn431: TJvImgBtn; }
    JvImgBtn432.ClassName; { JvImgBtn432: TJvImgBtn; }
    JvImgBtn433.ClassName; { JvImgBtn433: TJvImgBtn; }
    JvImgBtn434.ClassName; { JvImgBtn434: TJvImgBtn; }
    JvImgBtn435.ClassName; { JvImgBtn435: TJvImgBtn; }
    JvImgBtn436.ClassName; { JvImgBtn436: TJvImgBtn; }
    JvImgBtn437.ClassName; { JvImgBtn437: TJvImgBtn; }
    JvImgBtn438.ClassName; { JvImgBtn438: TJvImgBtn; }
    JvImgBtn439.ClassName; { JvImgBtn439: TJvImgBtn; }
    JvImgBtn440.ClassName; { JvImgBtn440: TJvImgBtn; }
    JvImgBtn441.ClassName; { JvImgBtn441: TJvImgBtn; }
    JvImgBtn442.ClassName; { JvImgBtn442: TJvImgBtn; }
    JvImgBtn443.ClassName; { JvImgBtn443: TJvImgBtn; }
    JvImgBtn444.ClassName; { JvImgBtn444: TJvImgBtn; }
    TabSheet22.ClassName; { TabSheet22: TTabSheet; }
    JvImgBtn445.ClassName; { JvImgBtn445: TJvImgBtn; }
    JvImgBtn446.ClassName; { JvImgBtn446: TJvImgBtn; }
    JvImgBtn447.ClassName; { JvImgBtn447: TJvImgBtn; }
    JvImgBtn448.ClassName; { JvImgBtn448: TJvImgBtn; }
    JvImgBtn449.ClassName; { JvImgBtn449: TJvImgBtn; }
    JvImgBtn450.ClassName; { JvImgBtn450: TJvImgBtn; }
    JvImgBtn451.ClassName; { JvImgBtn451: TJvImgBtn; }
    JvImgBtn452.ClassName; { JvImgBtn452: TJvImgBtn; }
    JvImgBtn453.ClassName; { JvImgBtn453: TJvImgBtn; }
    JvImgBtn454.ClassName; { JvImgBtn454: TJvImgBtn; }
    JvImgBtn455.ClassName; { JvImgBtn455: TJvImgBtn; }
    JvImgBtn456.ClassName; { JvImgBtn456: TJvImgBtn; }
    JvImgBtn457.ClassName; { JvImgBtn457: TJvImgBtn; }
    JvImgBtn458.ClassName; { JvImgBtn458: TJvImgBtn; }
    JvImgBtn459.ClassName; { JvImgBtn459: TJvImgBtn; }
    JvImgBtn460.ClassName; { JvImgBtn460: TJvImgBtn; }
    JvImgBtn461.ClassName; { JvImgBtn461: TJvImgBtn; }
    JvImgBtn462.ClassName; { JvImgBtn462: TJvImgBtn; }
    JvImgBtn463.ClassName; { JvImgBtn463: TJvImgBtn; }
    JvImgBtn464.ClassName; { JvImgBtn464: TJvImgBtn; }
    JvImgBtn465.ClassName; { JvImgBtn465: TJvImgBtn; }
    JvImgBtn466.ClassName; { JvImgBtn466: TJvImgBtn; }
    JvImgBtn467.ClassName; { JvImgBtn467: TJvImgBtn; }
    JvImgBtn468.ClassName; { JvImgBtn468: TJvImgBtn; }
    JvImgBtn469.ClassName; { JvImgBtn469: TJvImgBtn; }
    JvImgBtn470.ClassName; { JvImgBtn470: TJvImgBtn; }
    JvImgBtn471.ClassName; { JvImgBtn471: TJvImgBtn; }
    JvImgBtn472.ClassName; { JvImgBtn472: TJvImgBtn; }
    TabSheet23.ClassName; { TabSheet23: TTabSheet; }
    JvImgBtn473.ClassName; { JvImgBtn473: TJvImgBtn; }
    JvImgBtn474.ClassName; { JvImgBtn474: TJvImgBtn; }
    JvImgBtn475.ClassName; { JvImgBtn475: TJvImgBtn; }
    JvImgBtn476.ClassName; { JvImgBtn476: TJvImgBtn; }
    JvImgBtn477.ClassName; { JvImgBtn477: TJvImgBtn; }
    JvImgBtn478.ClassName; { JvImgBtn478: TJvImgBtn; }
    JvImgBtn479.ClassName; { JvImgBtn479: TJvImgBtn; }
    JvImgBtn480.ClassName; { JvImgBtn480: TJvImgBtn; }
    JvImgBtn481.ClassName; { JvImgBtn481: TJvImgBtn; }
    JvImgBtn482.ClassName; { JvImgBtn482: TJvImgBtn; }
    JvImgBtn483.ClassName; { JvImgBtn483: TJvImgBtn; }
    JvImgBtn484.ClassName; { JvImgBtn484: TJvImgBtn; }
    JvImgBtn485.ClassName; { JvImgBtn485: TJvImgBtn; }
    JvImgBtn486.ClassName; { JvImgBtn486: TJvImgBtn; }
    JvImgBtn487.ClassName; { JvImgBtn487: TJvImgBtn; }
    JvImgBtn488.ClassName; { JvImgBtn488: TJvImgBtn; }
    JvImgBtn489.ClassName; { JvImgBtn489: TJvImgBtn; }
    JvImgBtn490.ClassName; { JvImgBtn490: TJvImgBtn; }
    JvImgBtn491.ClassName; { JvImgBtn491: TJvImgBtn; }
    JvImgBtn492.ClassName; { JvImgBtn492: TJvImgBtn; }
    JvImgBtn493.ClassName; { JvImgBtn493: TJvImgBtn; }
    JvImgBtn494.ClassName; { JvImgBtn494: TJvImgBtn; }
    JvImgBtn495.ClassName; { JvImgBtn495: TJvImgBtn; }
    JvImgBtn496.ClassName; { JvImgBtn496: TJvImgBtn; }
    JvImgBtn497.ClassName; { JvImgBtn497: TJvImgBtn; }
    JvImgBtn498.ClassName; { JvImgBtn498: TJvImgBtn; }
    JvImgBtn499.ClassName; { JvImgBtn499: TJvImgBtn; }
    JvImgBtn500.ClassName; { JvImgBtn500: TJvImgBtn; }
    TabSheet24.ClassName; { TabSheet24: TTabSheet; }
    JvImgBtn501.ClassName; { JvImgBtn501: TJvImgBtn; }
    JvImgBtn502.ClassName; { JvImgBtn502: TJvImgBtn; }
    JvImgBtn503.ClassName; { JvImgBtn503: TJvImgBtn; }
    JvImgBtn504.ClassName; { JvImgBtn504: TJvImgBtn; }
    JvImgBtn505.ClassName; { JvImgBtn505: TJvImgBtn; }
    JvImgBtn506.ClassName; { JvImgBtn506: TJvImgBtn; }
    JvImgBtn507.ClassName; { JvImgBtn507: TJvImgBtn; }
    JvImgBtn508.ClassName; { JvImgBtn508: TJvImgBtn; }
    JvImgBtn509.ClassName; { JvImgBtn509: TJvImgBtn; }
    JvImgBtn510.ClassName; { JvImgBtn510: TJvImgBtn; }
    JvImgBtn511.ClassName; { JvImgBtn511: TJvImgBtn; }
    JvImgBtn512.ClassName; { JvImgBtn512: TJvImgBtn; }
    JvImgBtn513.ClassName; { JvImgBtn513: TJvImgBtn; }
    JvImgBtn514.ClassName; { JvImgBtn514: TJvImgBtn; }
    JvImgBtn515.ClassName; { JvImgBtn515: TJvImgBtn; }
    JvImgBtn516.ClassName; { JvImgBtn516: TJvImgBtn; }
    JvImgBtn517.ClassName; { JvImgBtn517: TJvImgBtn; }
    JvImgBtn518.ClassName; { JvImgBtn518: TJvImgBtn; }
    JvImgBtn519.ClassName; { JvImgBtn519: TJvImgBtn; }
    JvImgBtn520.ClassName; { JvImgBtn520: TJvImgBtn; }
    JvImgBtn521.ClassName; { JvImgBtn521: TJvImgBtn; }
    JvImgBtn522.ClassName; { JvImgBtn522: TJvImgBtn; }
    JvImgBtn523.ClassName; { JvImgBtn523: TJvImgBtn; }
    JvImgBtn524.ClassName; { JvImgBtn524: TJvImgBtn; }
    JvImgBtn525.ClassName; { JvImgBtn525: TJvImgBtn; }
    JvImgBtn526.ClassName; { JvImgBtn526: TJvImgBtn; }
    JvImgBtn527.ClassName; { JvImgBtn527: TJvImgBtn; }
    JvImgBtn528.ClassName; { JvImgBtn528: TJvImgBtn; }
    TabSheet25.ClassName; { TabSheet25: TTabSheet; }
    JvImgBtn529.ClassName; { JvImgBtn529: TJvImgBtn; }
    JvImgBtn530.ClassName; { JvImgBtn530: TJvImgBtn; }
    JvImgBtn531.ClassName; { JvImgBtn531: TJvImgBtn; }
    JvImgBtn532.ClassName; { JvImgBtn532: TJvImgBtn; }
    JvImgBtn533.ClassName; { JvImgBtn533: TJvImgBtn; }
    JvImgBtn534.ClassName; { JvImgBtn534: TJvImgBtn; }
    JvImgBtn535.ClassName; { JvImgBtn535: TJvImgBtn; }
    JvImgBtn536.ClassName; { JvImgBtn536: TJvImgBtn; }
    JvImgBtn537.ClassName; { JvImgBtn537: TJvImgBtn; }
    JvImgBtn538.ClassName; { JvImgBtn538: TJvImgBtn; }
    JvImgBtn539.ClassName; { JvImgBtn539: TJvImgBtn; }
    JvImgBtn540.ClassName; { JvImgBtn540: TJvImgBtn; }
    JvImgBtn541.ClassName; { JvImgBtn541: TJvImgBtn; }
    JvImgBtn542.ClassName; { JvImgBtn542: TJvImgBtn; }
    JvImgBtn543.ClassName; { JvImgBtn543: TJvImgBtn; }
    JvImgBtn544.ClassName; { JvImgBtn544: TJvImgBtn; }
    JvImgBtn545.ClassName; { JvImgBtn545: TJvImgBtn; }
    JvImgBtn546.ClassName; { JvImgBtn546: TJvImgBtn; }
    JvImgBtn547.ClassName; { JvImgBtn547: TJvImgBtn; }
    JvImgBtn548.ClassName; { JvImgBtn548: TJvImgBtn; }
    JvImgBtn549.ClassName; { JvImgBtn549: TJvImgBtn; }
    JvImgBtn550.ClassName; { JvImgBtn550: TJvImgBtn; }
    JvImgBtn551.ClassName; { JvImgBtn551: TJvImgBtn; }
    JvImgBtn552.ClassName; { JvImgBtn552: TJvImgBtn; }
    JvImgBtn553.ClassName; { JvImgBtn553: TJvImgBtn; }
    JvImgBtn554.ClassName; { JvImgBtn554: TJvImgBtn; }
    JvImgBtn555.ClassName; { JvImgBtn555: TJvImgBtn; }
    JvImgBtn556.ClassName; { JvImgBtn556: TJvImgBtn; }
    TabSheet26.ClassName; { TabSheet26: TTabSheet; }
    JvImgBtn557.ClassName; { JvImgBtn557: TJvImgBtn; }
    JvImgBtn558.ClassName; { JvImgBtn558: TJvImgBtn; }
    JvImgBtn559.ClassName; { JvImgBtn559: TJvImgBtn; }
    JvImgBtn560.ClassName; { JvImgBtn560: TJvImgBtn; }
    JvImgBtn561.ClassName; { JvImgBtn561: TJvImgBtn; }
    JvImgBtn562.ClassName; { JvImgBtn562: TJvImgBtn; }
    JvImgBtn563.ClassName; { JvImgBtn563: TJvImgBtn; }
    JvImgBtn564.ClassName; { JvImgBtn564: TJvImgBtn; }
    JvImgBtn565.ClassName; { JvImgBtn565: TJvImgBtn; }
    JvImgBtn566.ClassName; { JvImgBtn566: TJvImgBtn; }
    JvImgBtn567.ClassName; { JvImgBtn567: TJvImgBtn; }
    JvImgBtn568.ClassName; { JvImgBtn568: TJvImgBtn; }
    JvImgBtn569.ClassName; { JvImgBtn569: TJvImgBtn; }
    JvImgBtn570.ClassName; { JvImgBtn570: TJvImgBtn; }
    JvImgBtn571.ClassName; { JvImgBtn571: TJvImgBtn; }
    JvImgBtn572.ClassName; { JvImgBtn572: TJvImgBtn; }
    JvImgBtn573.ClassName; { JvImgBtn573: TJvImgBtn; }
    JvImgBtn574.ClassName; { JvImgBtn574: TJvImgBtn; }
    JvImgBtn575.ClassName; { JvImgBtn575: TJvImgBtn; }
    JvImgBtn576.ClassName; { JvImgBtn576: TJvImgBtn; }
    JvImgBtn577.ClassName; { JvImgBtn577: TJvImgBtn; }
    JvImgBtn578.ClassName; { JvImgBtn578: TJvImgBtn; }
    JvImgBtn579.ClassName; { JvImgBtn579: TJvImgBtn; }
    JvImgBtn580.ClassName; { JvImgBtn580: TJvImgBtn; }
    JvImgBtn581.ClassName; { JvImgBtn581: TJvImgBtn; }
    JvImgBtn582.ClassName; { JvImgBtn582: TJvImgBtn; }
    JvImgBtn583.ClassName; { JvImgBtn583: TJvImgBtn; }
    JvImgBtn584.ClassName; { JvImgBtn584: TJvImgBtn; }
    TabSheet27.ClassName; { TabSheet27: TTabSheet; }
    JvImgBtn585.ClassName; { JvImgBtn585: TJvImgBtn; }
    JvImgBtn586.ClassName; { JvImgBtn586: TJvImgBtn; }
    JvImgBtn587.ClassName; { JvImgBtn587: TJvImgBtn; }
    JvImgBtn588.ClassName; { JvImgBtn588: TJvImgBtn; }
    JvImgBtn589.ClassName; { JvImgBtn589: TJvImgBtn; }
    JvImgBtn590.ClassName; { JvImgBtn590: TJvImgBtn; }
    JvImgBtn591.ClassName; { JvImgBtn591: TJvImgBtn; }
    JvImgBtn592.ClassName; { JvImgBtn592: TJvImgBtn; }
    JvImgBtn593.ClassName; { JvImgBtn593: TJvImgBtn; }
    JvImgBtn594.ClassName; { JvImgBtn594: TJvImgBtn; }
    JvImgBtn595.ClassName; { JvImgBtn595: TJvImgBtn; }
    JvImgBtn596.ClassName; { JvImgBtn596: TJvImgBtn; }
    JvImgBtn597.ClassName; { JvImgBtn597: TJvImgBtn; }
    JvImgBtn598.ClassName; { JvImgBtn598: TJvImgBtn; }
    JvImgBtn599.ClassName; { JvImgBtn599: TJvImgBtn; }
    JvImgBtn600.ClassName; { JvImgBtn600: TJvImgBtn; }
    JvImgBtn601.ClassName; { JvImgBtn601: TJvImgBtn; }
    JvImgBtn602.ClassName; { JvImgBtn602: TJvImgBtn; }
    JvImgBtn603.ClassName; { JvImgBtn603: TJvImgBtn; }
    JvImgBtn604.ClassName; { JvImgBtn604: TJvImgBtn; }
    JvImgBtn605.ClassName; { JvImgBtn605: TJvImgBtn; }
    JvImgBtn606.ClassName; { JvImgBtn606: TJvImgBtn; }
    JvImgBtn607.ClassName; { JvImgBtn607: TJvImgBtn; }
    JvImgBtn608.ClassName; { JvImgBtn608: TJvImgBtn; }
    JvImgBtn609.ClassName; { JvImgBtn609: TJvImgBtn; }
    JvImgBtn610.ClassName; { JvImgBtn610: TJvImgBtn; }
    JvImgBtn611.ClassName; { JvImgBtn611: TJvImgBtn; }
    JvImgBtn612.ClassName; { JvImgBtn612: TJvImgBtn; }
    TabSheet28.ClassName; { TabSheet28: TTabSheet; }
    JvImgBtn613.ClassName; { JvImgBtn613: TJvImgBtn; }
    JvImgBtn614.ClassName; { JvImgBtn614: TJvImgBtn; }
    JvImgBtn615.ClassName; { JvImgBtn615: TJvImgBtn; }
    JvImgBtn616.ClassName; { JvImgBtn616: TJvImgBtn; }
    JvImgBtn617.ClassName; { JvImgBtn617: TJvImgBtn; }
    JvImgBtn618.ClassName; { JvImgBtn618: TJvImgBtn; }
    JvImgBtn619.ClassName; { JvImgBtn619: TJvImgBtn; }
    JvImgBtn620.ClassName; { JvImgBtn620: TJvImgBtn; }
    JvImgBtn621.ClassName; { JvImgBtn621: TJvImgBtn; }
    JvImgBtn622.ClassName; { JvImgBtn622: TJvImgBtn; }
    JvImgBtn623.ClassName; { JvImgBtn623: TJvImgBtn; }
    JvImgBtn624.ClassName; { JvImgBtn624: TJvImgBtn; }
    JvImgBtn625.ClassName; { JvImgBtn625: TJvImgBtn; }
    JvImgBtn626.ClassName; { JvImgBtn626: TJvImgBtn; }
    JvImgBtn627.ClassName; { JvImgBtn627: TJvImgBtn; }
    JvImgBtn628.ClassName; { JvImgBtn628: TJvImgBtn; }
    JvImgBtn629.ClassName; { JvImgBtn629: TJvImgBtn; }
    JvImgBtn630.ClassName; { JvImgBtn630: TJvImgBtn; }
    JvImgBtn631.ClassName; { JvImgBtn631: TJvImgBtn; }
    JvImgBtn632.ClassName; { JvImgBtn632: TJvImgBtn; }
    JvImgBtn633.ClassName; { JvImgBtn633: TJvImgBtn; }
    JvImgBtn634.ClassName; { JvImgBtn634: TJvImgBtn; }
    JvImgBtn635.ClassName; { JvImgBtn635: TJvImgBtn; }
    JvImgBtn636.ClassName; { JvImgBtn636: TJvImgBtn; }
    JvImgBtn637.ClassName; { JvImgBtn637: TJvImgBtn; }
    JvImgBtn638.ClassName; { JvImgBtn638: TJvImgBtn; }
    JvImgBtn639.ClassName; { JvImgBtn639: TJvImgBtn; }
    JvImgBtn640.ClassName; { JvImgBtn640: TJvImgBtn; }
    TabSheet29.ClassName; { TabSheet29: TTabSheet; }
    JvImgBtn641.ClassName; { JvImgBtn641: TJvImgBtn; }
    JvImgBtn642.ClassName; { JvImgBtn642: TJvImgBtn; }
    JvImgBtn643.ClassName; { JvImgBtn643: TJvImgBtn; }
    JvImgBtn644.ClassName; { JvImgBtn644: TJvImgBtn; }
    JvImgBtn645.ClassName; { JvImgBtn645: TJvImgBtn; }
    JvImgBtn646.ClassName; { JvImgBtn646: TJvImgBtn; }
    JvImgBtn647.ClassName; { JvImgBtn647: TJvImgBtn; }
    JvImgBtn648.ClassName; { JvImgBtn648: TJvImgBtn; }
    JvImgBtn649.ClassName; { JvImgBtn649: TJvImgBtn; }
    JvImgBtn650.ClassName; { JvImgBtn650: TJvImgBtn; }
    JvImgBtn651.ClassName; { JvImgBtn651: TJvImgBtn; }
    JvImgBtn652.ClassName; { JvImgBtn652: TJvImgBtn; }
    JvImgBtn653.ClassName; { JvImgBtn653: TJvImgBtn; }
    JvImgBtn654.ClassName; { JvImgBtn654: TJvImgBtn; }
    JvImgBtn655.ClassName; { JvImgBtn655: TJvImgBtn; }
    JvImgBtn656.ClassName; { JvImgBtn656: TJvImgBtn; }
    JvImgBtn657.ClassName; { JvImgBtn657: TJvImgBtn; }
    JvImgBtn658.ClassName; { JvImgBtn658: TJvImgBtn; }
    JvImgBtn659.ClassName; { JvImgBtn659: TJvImgBtn; }
    JvImgBtn660.ClassName; { JvImgBtn660: TJvImgBtn; }
    JvImgBtn661.ClassName; { JvImgBtn661: TJvImgBtn; }
    JvImgBtn662.ClassName; { JvImgBtn662: TJvImgBtn; }
    JvImgBtn663.ClassName; { JvImgBtn663: TJvImgBtn; }
    JvImgBtn664.ClassName; { JvImgBtn664: TJvImgBtn; }
    JvImgBtn665.ClassName; { JvImgBtn665: TJvImgBtn; }
    JvImgBtn666.ClassName; { JvImgBtn666: TJvImgBtn; }
    JvImgBtn667.ClassName; { JvImgBtn667: TJvImgBtn; }
    JvImgBtn668.ClassName; { JvImgBtn668: TJvImgBtn; }
    TabSheet30.ClassName; { TabSheet30: TTabSheet; }
    JvImgBtn669.ClassName; { JvImgBtn669: TJvImgBtn; }
    JvImgBtn670.ClassName; { JvImgBtn670: TJvImgBtn; }
    JvImgBtn671.ClassName; { JvImgBtn671: TJvImgBtn; }
    JvImgBtn672.ClassName; { JvImgBtn672: TJvImgBtn; }
    JvImgBtn673.ClassName; { JvImgBtn673: TJvImgBtn; }
    JvImgBtn674.ClassName; { JvImgBtn674: TJvImgBtn; }
    JvImgBtn675.ClassName; { JvImgBtn675: TJvImgBtn; }
    JvImgBtn676.ClassName; { JvImgBtn676: TJvImgBtn; }
    JvImgBtn677.ClassName; { JvImgBtn677: TJvImgBtn; }
    JvImgBtn678.ClassName; { JvImgBtn678: TJvImgBtn; }
    JvImgBtn679.ClassName; { JvImgBtn679: TJvImgBtn; }
    JvImgBtn680.ClassName; { JvImgBtn680: TJvImgBtn; }
    JvImgBtn681.ClassName; { JvImgBtn681: TJvImgBtn; }
    JvImgBtn682.ClassName; { JvImgBtn682: TJvImgBtn; }
    JvImgBtn683.ClassName; { JvImgBtn683: TJvImgBtn; }
    JvImgBtn684.ClassName; { JvImgBtn684: TJvImgBtn; }
    JvImgBtn685.ClassName; { JvImgBtn685: TJvImgBtn; }
    JvImgBtn686.ClassName; { JvImgBtn686: TJvImgBtn; }
    JvImgBtn687.ClassName; { JvImgBtn687: TJvImgBtn; }
    JvImgBtn688.ClassName; { JvImgBtn688: TJvImgBtn; }
    JvImgBtn689.ClassName; { JvImgBtn689: TJvImgBtn; }
    JvImgBtn690.ClassName; { JvImgBtn690: TJvImgBtn; }
    JvImgBtn691.ClassName; { JvImgBtn691: TJvImgBtn; }
    JvImgBtn692.ClassName; { JvImgBtn692: TJvImgBtn; }
    JvImgBtn693.ClassName; { JvImgBtn693: TJvImgBtn; }
    JvImgBtn694.ClassName; { JvImgBtn694: TJvImgBtn; }
    JvImgBtn695.ClassName; { JvImgBtn695: TJvImgBtn; }
    JvImgBtn696.ClassName; { JvImgBtn696: TJvImgBtn; }
    TabSheet31.ClassName; { TabSheet31: TTabSheet; }
    JvImgBtn697.ClassName; { JvImgBtn697: TJvImgBtn; }
    JvImgBtn698.ClassName; { JvImgBtn698: TJvImgBtn; }
    JvImgBtn699.ClassName; { JvImgBtn699: TJvImgBtn; }
    JvImgBtn700.ClassName; { JvImgBtn700: TJvImgBtn; }
    JvImgBtn701.ClassName; { JvImgBtn701: TJvImgBtn; }
    JvImgBtn702.ClassName; { JvImgBtn702: TJvImgBtn; }
    JvImgBtn703.ClassName; { JvImgBtn703: TJvImgBtn; }
    JvImgBtn704.ClassName; { JvImgBtn704: TJvImgBtn; }
    JvImgBtn705.ClassName; { JvImgBtn705: TJvImgBtn; }
    JvImgBtn706.ClassName; { JvImgBtn706: TJvImgBtn; }
    JvImgBtn707.ClassName; { JvImgBtn707: TJvImgBtn; }
    JvImgBtn708.ClassName; { JvImgBtn708: TJvImgBtn; }
    JvImgBtn709.ClassName; { JvImgBtn709: TJvImgBtn; }
    JvImgBtn710.ClassName; { JvImgBtn710: TJvImgBtn; }
    JvImgBtn711.ClassName; { JvImgBtn711: TJvImgBtn; }
    JvImgBtn712.ClassName; { JvImgBtn712: TJvImgBtn; }
    JvImgBtn713.ClassName; { JvImgBtn713: TJvImgBtn; }
    JvImgBtn714.ClassName; { JvImgBtn714: TJvImgBtn; }
    JvImgBtn715.ClassName; { JvImgBtn715: TJvImgBtn; }
    JvImgBtn716.ClassName; { JvImgBtn716: TJvImgBtn; }
    JvImgBtn717.ClassName; { JvImgBtn717: TJvImgBtn; }
    JvImgBtn718.ClassName; { JvImgBtn718: TJvImgBtn; }
    JvImgBtn719.ClassName; { JvImgBtn719: TJvImgBtn; }
    JvImgBtn720.ClassName; { JvImgBtn720: TJvImgBtn; }
    JvImgBtn721.ClassName; { JvImgBtn721: TJvImgBtn; }
    JvImgBtn722.ClassName; { JvImgBtn722: TJvImgBtn; }
    JvImgBtn723.ClassName; { JvImgBtn723: TJvImgBtn; }
    JvImgBtn724.ClassName; { JvImgBtn724: TJvImgBtn; }
    TabSheet32.ClassName; { TabSheet32: TTabSheet; }
    JvImgBtn725.ClassName; { JvImgBtn725: TJvImgBtn; }
    JvImgBtn726.ClassName; { JvImgBtn726: TJvImgBtn; }
    JvImgBtn727.ClassName; { JvImgBtn727: TJvImgBtn; }
    JvImgBtn728.ClassName; { JvImgBtn728: TJvImgBtn; }
    JvImgBtn729.ClassName; { JvImgBtn729: TJvImgBtn; }
    JvImgBtn730.ClassName; { JvImgBtn730: TJvImgBtn; }
    JvImgBtn731.ClassName; { JvImgBtn731: TJvImgBtn; }
    JvImgBtn732.ClassName; { JvImgBtn732: TJvImgBtn; }
    JvImgBtn733.ClassName; { JvImgBtn733: TJvImgBtn; }
    JvImgBtn734.ClassName; { JvImgBtn734: TJvImgBtn; }
    JvImgBtn735.ClassName; { JvImgBtn735: TJvImgBtn; }
    JvImgBtn736.ClassName; { JvImgBtn736: TJvImgBtn; }
    JvImgBtn737.ClassName; { JvImgBtn737: TJvImgBtn; }
    JvImgBtn738.ClassName; { JvImgBtn738: TJvImgBtn; }
    JvImgBtn739.ClassName; { JvImgBtn739: TJvImgBtn; }
    JvImgBtn740.ClassName; { JvImgBtn740: TJvImgBtn; }
    JvImgBtn741.ClassName; { JvImgBtn741: TJvImgBtn; }
    JvImgBtn742.ClassName; { JvImgBtn742: TJvImgBtn; }
    JvImgBtn743.ClassName; { JvImgBtn743: TJvImgBtn; }
    JvImgBtn744.ClassName; { JvImgBtn744: TJvImgBtn; }
    JvImgBtn745.ClassName; { JvImgBtn745: TJvImgBtn; }
    JvImgBtn746.ClassName; { JvImgBtn746: TJvImgBtn; }
    JvImgBtn747.ClassName; { JvImgBtn747: TJvImgBtn; }
    JvImgBtn748.ClassName; { JvImgBtn748: TJvImgBtn; }
    JvImgBtn749.ClassName; { JvImgBtn749: TJvImgBtn; }
    JvImgBtn750.ClassName; { JvImgBtn750: TJvImgBtn; }
    JvImgBtn751.ClassName; { JvImgBtn751: TJvImgBtn; }
    JvImgBtn752.ClassName; { JvImgBtn752: TJvImgBtn; }
    TabSheet33.ClassName; { TabSheet33: TTabSheet; }
    JvImgBtn753.ClassName; { JvImgBtn753: TJvImgBtn; }
    JvImgBtn754.ClassName; { JvImgBtn754: TJvImgBtn; }
    JvImgBtn755.ClassName; { JvImgBtn755: TJvImgBtn; }
    JvImgBtn756.ClassName; { JvImgBtn756: TJvImgBtn; }
    JvImgBtn757.ClassName; { JvImgBtn757: TJvImgBtn; }
    JvImgBtn758.ClassName; { JvImgBtn758: TJvImgBtn; }
    JvImgBtn759.ClassName; { JvImgBtn759: TJvImgBtn; }
    JvImgBtn760.ClassName; { JvImgBtn760: TJvImgBtn; }
    JvImgBtn761.ClassName; { JvImgBtn761: TJvImgBtn; }
    JvImgBtn762.ClassName; { JvImgBtn762: TJvImgBtn; }
    JvImgBtn763.ClassName; { JvImgBtn763: TJvImgBtn; }
    JvImgBtn764.ClassName; { JvImgBtn764: TJvImgBtn; }
    JvImgBtn765.ClassName; { JvImgBtn765: TJvImgBtn; }
    JvImgBtn766.ClassName; { JvImgBtn766: TJvImgBtn; }
    JvImgBtn767.ClassName; { JvImgBtn767: TJvImgBtn; }
    JvImgBtn768.ClassName; { JvImgBtn768: TJvImgBtn; }
    JvImgBtn769.ClassName; { JvImgBtn769: TJvImgBtn; }
    JvImgBtn770.ClassName; { JvImgBtn770: TJvImgBtn; }
    JvImgBtn771.ClassName; { JvImgBtn771: TJvImgBtn; }
    JvImgBtn772.ClassName; { JvImgBtn772: TJvImgBtn; }
    JvImgBtn773.ClassName; { JvImgBtn773: TJvImgBtn; }
    JvImgBtn774.ClassName; { JvImgBtn774: TJvImgBtn; }
    JvImgBtn775.ClassName; { JvImgBtn775: TJvImgBtn; }
    JvImgBtn776.ClassName; { JvImgBtn776: TJvImgBtn; }
    JvImgBtn777.ClassName; { JvImgBtn777: TJvImgBtn; }
    JvImgBtn778.ClassName; { JvImgBtn778: TJvImgBtn; }
    JvImgBtn779.ClassName; { JvImgBtn779: TJvImgBtn; }
    JvImgBtn780.ClassName; { JvImgBtn780: TJvImgBtn; }
    TabSheet34.ClassName; { TabSheet34: TTabSheet; }
    JvImgBtn781.ClassName; { JvImgBtn781: TJvImgBtn; }
    JvImgBtn782.ClassName; { JvImgBtn782: TJvImgBtn; }
    JvImgBtn783.ClassName; { JvImgBtn783: TJvImgBtn; }
    JvImgBtn784.ClassName; { JvImgBtn784: TJvImgBtn; }
    JvImgBtn785.ClassName; { JvImgBtn785: TJvImgBtn; }
    JvImgBtn786.ClassName; { JvImgBtn786: TJvImgBtn; }
    JvImgBtn787.ClassName; { JvImgBtn787: TJvImgBtn; }
    JvImgBtn788.ClassName; { JvImgBtn788: TJvImgBtn; }
    JvImgBtn789.ClassName; { JvImgBtn789: TJvImgBtn; }
    JvImgBtn790.ClassName; { JvImgBtn790: TJvImgBtn; }
    JvImgBtn791.ClassName; { JvImgBtn791: TJvImgBtn; }
    JvImgBtn792.ClassName; { JvImgBtn792: TJvImgBtn; }
    JvImgBtn793.ClassName; { JvImgBtn793: TJvImgBtn; }
    JvImgBtn794.ClassName; { JvImgBtn794: TJvImgBtn; }
    JvImgBtn795.ClassName; { JvImgBtn795: TJvImgBtn; }
    JvImgBtn796.ClassName; { JvImgBtn796: TJvImgBtn; }
    JvImgBtn797.ClassName; { JvImgBtn797: TJvImgBtn; }
    JvImgBtn798.ClassName; { JvImgBtn798: TJvImgBtn; }
    JvImgBtn799.ClassName; { JvImgBtn799: TJvImgBtn; }
    JvImgBtn800.ClassName; { JvImgBtn800: TJvImgBtn; }
    JvImgBtn801.ClassName; { JvImgBtn801: TJvImgBtn; }
    JvImgBtn802.ClassName; { JvImgBtn802: TJvImgBtn; }
    JvImgBtn803.ClassName; { JvImgBtn803: TJvImgBtn; }
    JvImgBtn804.ClassName; { JvImgBtn804: TJvImgBtn; }
    JvImgBtn805.ClassName; { JvImgBtn805: TJvImgBtn; }
    JvImgBtn806.ClassName; { JvImgBtn806: TJvImgBtn; }
    JvImgBtn807.ClassName; { JvImgBtn807: TJvImgBtn; }
    JvImgBtn808.ClassName; { JvImgBtn808: TJvImgBtn; }
    TabSheet35.ClassName; { TabSheet35: TTabSheet; }
    JvImgBtn809.ClassName; { JvImgBtn809: TJvImgBtn; }
    JvImgBtn810.ClassName; { JvImgBtn810: TJvImgBtn; }
    JvImgBtn811.ClassName; { JvImgBtn811: TJvImgBtn; }
    JvImgBtn812.ClassName; { JvImgBtn812: TJvImgBtn; }
    JvImgBtn813.ClassName; { JvImgBtn813: TJvImgBtn; }
    JvImgBtn814.ClassName; { JvImgBtn814: TJvImgBtn; }
    JvImgBtn815.ClassName; { JvImgBtn815: TJvImgBtn; }
    JvImgBtn816.ClassName; { JvImgBtn816: TJvImgBtn; }
    JvImgBtn817.ClassName; { JvImgBtn817: TJvImgBtn; }
    JvImgBtn818.ClassName; { JvImgBtn818: TJvImgBtn; }
    JvImgBtn819.ClassName; { JvImgBtn819: TJvImgBtn; }
    JvImgBtn820.ClassName; { JvImgBtn820: TJvImgBtn; }
    JvImgBtn821.ClassName; { JvImgBtn821: TJvImgBtn; }
    JvImgBtn822.ClassName; { JvImgBtn822: TJvImgBtn; }
    JvImgBtn823.ClassName; { JvImgBtn823: TJvImgBtn; }
    JvImgBtn824.ClassName; { JvImgBtn824: TJvImgBtn; }
    JvImgBtn825.ClassName; { JvImgBtn825: TJvImgBtn; }
    JvImgBtn826.ClassName; { JvImgBtn826: TJvImgBtn; }
    JvImgBtn827.ClassName; { JvImgBtn827: TJvImgBtn; }
    JvImgBtn828.ClassName; { JvImgBtn828: TJvImgBtn; }
    JvImgBtn829.ClassName; { JvImgBtn829: TJvImgBtn; }
    JvImgBtn830.ClassName; { JvImgBtn830: TJvImgBtn; }
    JvImgBtn831.ClassName; { JvImgBtn831: TJvImgBtn; }
    JvImgBtn832.ClassName; { JvImgBtn832: TJvImgBtn; }
    JvImgBtn833.ClassName; { JvImgBtn833: TJvImgBtn; }
    JvImgBtn834.ClassName; { JvImgBtn834: TJvImgBtn; }
    JvImgBtn835.ClassName; { JvImgBtn835: TJvImgBtn; }
    JvImgBtn836.ClassName; { JvImgBtn836: TJvImgBtn; }
    TabSheet36.ClassName; { TabSheet36: TTabSheet; }
    JvImgBtn837.ClassName; { JvImgBtn837: TJvImgBtn; }
    JvImgBtn838.ClassName; { JvImgBtn838: TJvImgBtn; }
    JvImgBtn839.ClassName; { JvImgBtn839: TJvImgBtn; }
    JvImgBtn840.ClassName; { JvImgBtn840: TJvImgBtn; }
    JvImgBtn841.ClassName; { JvImgBtn841: TJvImgBtn; }
    JvImgBtn842.ClassName; { JvImgBtn842: TJvImgBtn; }
    JvImgBtn843.ClassName; { JvImgBtn843: TJvImgBtn; }
    JvImgBtn844.ClassName; { JvImgBtn844: TJvImgBtn; }
    JvImgBtn845.ClassName; { JvImgBtn845: TJvImgBtn; }
    JvImgBtn846.ClassName; { JvImgBtn846: TJvImgBtn; }
    JvImgBtn847.ClassName; { JvImgBtn847: TJvImgBtn; }
    JvImgBtn848.ClassName; { JvImgBtn848: TJvImgBtn; }
    JvImgBtn849.ClassName; { JvImgBtn849: TJvImgBtn; }
    JvImgBtn850.ClassName; { JvImgBtn850: TJvImgBtn; }
    JvImgBtn851.ClassName; { JvImgBtn851: TJvImgBtn; }
    JvImgBtn852.ClassName; { JvImgBtn852: TJvImgBtn; }
    JvImgBtn853.ClassName; { JvImgBtn853: TJvImgBtn; }
    JvImgBtn854.ClassName; { JvImgBtn854: TJvImgBtn; }
    JvImgBtn855.ClassName; { JvImgBtn855: TJvImgBtn; }
    JvImgBtn856.ClassName; { JvImgBtn856: TJvImgBtn; }
    JvImgBtn857.ClassName; { JvImgBtn857: TJvImgBtn; }
    JvImgBtn858.ClassName; { JvImgBtn858: TJvImgBtn; }
    JvImgBtn859.ClassName; { JvImgBtn859: TJvImgBtn; }
    JvImgBtn860.ClassName; { JvImgBtn860: TJvImgBtn; }
    JvImgBtn861.ClassName; { JvImgBtn861: TJvImgBtn; }
    JvImgBtn862.ClassName; { JvImgBtn862: TJvImgBtn; }
    JvImgBtn863.ClassName; { JvImgBtn863: TJvImgBtn; }
    JvImgBtn864.ClassName; { JvImgBtn864: TJvImgBtn; }
    TabSheet37.ClassName; { TabSheet37: TTabSheet; }
    JvImgBtn865.ClassName; { JvImgBtn865: TJvImgBtn; }
    JvImgBtn866.ClassName; { JvImgBtn866: TJvImgBtn; }
    JvImgBtn867.ClassName; { JvImgBtn867: TJvImgBtn; }
    JvImgBtn868.ClassName; { JvImgBtn868: TJvImgBtn; }
    JvImgBtn869.ClassName; { JvImgBtn869: TJvImgBtn; }
    JvImgBtn870.ClassName; { JvImgBtn870: TJvImgBtn; }
    JvImgBtn871.ClassName; { JvImgBtn871: TJvImgBtn; }
    JvImgBtn872.ClassName; { JvImgBtn872: TJvImgBtn; }
    JvImgBtn873.ClassName; { JvImgBtn873: TJvImgBtn; }
    JvImgBtn874.ClassName; { JvImgBtn874: TJvImgBtn; }
    JvImgBtn875.ClassName; { JvImgBtn875: TJvImgBtn; }
    JvImgBtn876.ClassName; { JvImgBtn876: TJvImgBtn; }
    JvImgBtn877.ClassName; { JvImgBtn877: TJvImgBtn; }
    JvImgBtn878.ClassName; { JvImgBtn878: TJvImgBtn; }
    JvImgBtn879.ClassName; { JvImgBtn879: TJvImgBtn; }
    JvImgBtn880.ClassName; { JvImgBtn880: TJvImgBtn; }
    JvImgBtn881.ClassName; { JvImgBtn881: TJvImgBtn; }
    JvImgBtn882.ClassName; { JvImgBtn882: TJvImgBtn; }
    JvImgBtn883.ClassName; { JvImgBtn883: TJvImgBtn; }
    JvImgBtn884.ClassName; { JvImgBtn884: TJvImgBtn; }
    JvImgBtn885.ClassName; { JvImgBtn885: TJvImgBtn; }
    JvImgBtn886.ClassName; { JvImgBtn886: TJvImgBtn; }
    JvImgBtn887.ClassName; { JvImgBtn887: TJvImgBtn; }
    JvImgBtn888.ClassName; { JvImgBtn888: TJvImgBtn; }
    JvImgBtn889.ClassName; { JvImgBtn889: TJvImgBtn; }
    JvImgBtn890.ClassName; { JvImgBtn890: TJvImgBtn; }
    JvImgBtn891.ClassName; { JvImgBtn891: TJvImgBtn; }
    JvImgBtn892.ClassName; { JvImgBtn892: TJvImgBtn; }
    TabSheet38.ClassName; { TabSheet38: TTabSheet; }
    JvImgBtn893.ClassName; { JvImgBtn893: TJvImgBtn; }
    JvImgBtn894.ClassName; { JvImgBtn894: TJvImgBtn; }
    JvImgBtn895.ClassName; { JvImgBtn895: TJvImgBtn; }
    JvImgBtn896.ClassName; { JvImgBtn896: TJvImgBtn; }
    JvImgBtn897.ClassName; { JvImgBtn897: TJvImgBtn; }
    JvImgBtn898.ClassName; { JvImgBtn898: TJvImgBtn; }
    JvImgBtn899.ClassName; { JvImgBtn899: TJvImgBtn; }
    JvImgBtn900.ClassName; { JvImgBtn900: TJvImgBtn; }
    JvImgBtn901.ClassName; { JvImgBtn901: TJvImgBtn; }
    JvImgBtn902.ClassName; { JvImgBtn902: TJvImgBtn; }
    JvImgBtn903.ClassName; { JvImgBtn903: TJvImgBtn; }
    JvImgBtn904.ClassName; { JvImgBtn904: TJvImgBtn; }
    JvImgBtn905.ClassName; { JvImgBtn905: TJvImgBtn; }
    JvImgBtn906.ClassName; { JvImgBtn906: TJvImgBtn; }
    JvImgBtn907.ClassName; { JvImgBtn907: TJvImgBtn; }
    JvImgBtn908.ClassName; { JvImgBtn908: TJvImgBtn; }
    JvImgBtn909.ClassName; { JvImgBtn909: TJvImgBtn; }
    JvImgBtn910.ClassName; { JvImgBtn910: TJvImgBtn; }
    JvImgBtn911.ClassName; { JvImgBtn911: TJvImgBtn; }
    JvImgBtn912.ClassName; { JvImgBtn912: TJvImgBtn; }
    JvImgBtn913.ClassName; { JvImgBtn913: TJvImgBtn; }
    JvImgBtn914.ClassName; { JvImgBtn914: TJvImgBtn; }
    JvImgBtn915.ClassName; { JvImgBtn915: TJvImgBtn; }
    JvImgBtn916.ClassName; { JvImgBtn916: TJvImgBtn; }
    JvImgBtn917.ClassName; { JvImgBtn917: TJvImgBtn; }
    JvImgBtn918.ClassName; { JvImgBtn918: TJvImgBtn; }
    JvImgBtn919.ClassName; { JvImgBtn919: TJvImgBtn; }
    JvImgBtn920.ClassName; { JvImgBtn920: TJvImgBtn; }
    TabSheet39.ClassName; { TabSheet39: TTabSheet; }
    JvImgBtn921.ClassName; { JvImgBtn921: TJvImgBtn; }
    JvImgBtn922.ClassName; { JvImgBtn922: TJvImgBtn; }
    JvImgBtn923.ClassName; { JvImgBtn923: TJvImgBtn; }
    JvImgBtn924.ClassName; { JvImgBtn924: TJvImgBtn; }
    JvImgBtn925.ClassName; { JvImgBtn925: TJvImgBtn; }
    JvImgBtn926.ClassName; { JvImgBtn926: TJvImgBtn; }
    JvImgBtn927.ClassName; { JvImgBtn927: TJvImgBtn; }
    JvImgBtn928.ClassName; { JvImgBtn928: TJvImgBtn; }
    JvImgBtn929.ClassName; { JvImgBtn929: TJvImgBtn; }
    JvImgBtn930.ClassName; { JvImgBtn930: TJvImgBtn; }
    JvImgBtn931.ClassName; { JvImgBtn931: TJvImgBtn; }
    JvImgBtn932.ClassName; { JvImgBtn932: TJvImgBtn; }
    JvImgBtn933.ClassName; { JvImgBtn933: TJvImgBtn; }
    JvImgBtn934.ClassName; { JvImgBtn934: TJvImgBtn; }
    JvImgBtn935.ClassName; { JvImgBtn935: TJvImgBtn; }
    JvImgBtn936.ClassName; { JvImgBtn936: TJvImgBtn; }
    JvImgBtn937.ClassName; { JvImgBtn937: TJvImgBtn; }
    JvImgBtn938.ClassName; { JvImgBtn938: TJvImgBtn; }
    JvImgBtn939.ClassName; { JvImgBtn939: TJvImgBtn; }
    JvImgBtn940.ClassName; { JvImgBtn940: TJvImgBtn; }
    JvImgBtn941.ClassName; { JvImgBtn941: TJvImgBtn; }
    JvImgBtn942.ClassName; { JvImgBtn942: TJvImgBtn; }
    JvImgBtn943.ClassName; { JvImgBtn943: TJvImgBtn; }
    JvImgBtn944.ClassName; { JvImgBtn944: TJvImgBtn; }
    JvImgBtn945.ClassName; { JvImgBtn945: TJvImgBtn; }
    JvImgBtn946.ClassName; { JvImgBtn946: TJvImgBtn; }
    JvImgBtn947.ClassName; { JvImgBtn947: TJvImgBtn; }
    JvImgBtn948.ClassName; { JvImgBtn948: TJvImgBtn; }
    TabSheet40.ClassName; { TabSheet40: TTabSheet; }
    JvImgBtn949.ClassName; { JvImgBtn949: TJvImgBtn; }
    JvImgBtn950.ClassName; { JvImgBtn950: TJvImgBtn; }
    JvImgBtn951.ClassName; { JvImgBtn951: TJvImgBtn; }
    JvImgBtn952.ClassName; { JvImgBtn952: TJvImgBtn; }
    JvImgBtn953.ClassName; { JvImgBtn953: TJvImgBtn; }
    JvImgBtn954.ClassName; { JvImgBtn954: TJvImgBtn; }
    JvImgBtn955.ClassName; { JvImgBtn955: TJvImgBtn; }
    JvImgBtn956.ClassName; { JvImgBtn956: TJvImgBtn; }
    JvImgBtn957.ClassName; { JvImgBtn957: TJvImgBtn; }
    JvImgBtn958.ClassName; { JvImgBtn958: TJvImgBtn; }
    JvImgBtn959.ClassName; { JvImgBtn959: TJvImgBtn; }
    JvImgBtn960.ClassName; { JvImgBtn960: TJvImgBtn; }
    JvImgBtn961.ClassName; { JvImgBtn961: TJvImgBtn; }
    JvImgBtn962.ClassName; { JvImgBtn962: TJvImgBtn; }
    JvImgBtn963.ClassName; { JvImgBtn963: TJvImgBtn; }
    JvImgBtn964.ClassName; { JvImgBtn964: TJvImgBtn; }
    JvImgBtn965.ClassName; { JvImgBtn965: TJvImgBtn; }
    JvImgBtn966.ClassName; { JvImgBtn966: TJvImgBtn; }
    JvImgBtn967.ClassName; { JvImgBtn967: TJvImgBtn; }
    JvImgBtn968.ClassName; { JvImgBtn968: TJvImgBtn; }
    JvImgBtn969.ClassName; { JvImgBtn969: TJvImgBtn; }
    JvImgBtn970.ClassName; { JvImgBtn970: TJvImgBtn; }
    JvImgBtn971.ClassName; { JvImgBtn971: TJvImgBtn; }
    JvImgBtn972.ClassName; { JvImgBtn972: TJvImgBtn; }
    JvImgBtn973.ClassName; { JvImgBtn973: TJvImgBtn; }
    JvImgBtn974.ClassName; { JvImgBtn974: TJvImgBtn; }
    JvImgBtn975.ClassName; { JvImgBtn975: TJvImgBtn; }
    JvImgBtn976.ClassName; { JvImgBtn976: TJvImgBtn; }
    pnBotesProdutos.ClassName; { pnBotesProdutos: TPanel; }
    btConfirmaLancamentos.ClassName; { btConfirmaLancamentos: TSpeedButton; }
    btEstornaProduto.ClassName; { btEstornaProduto: TSpeedButton; }
    SpeedButton8.ClassName; { SpeedButton8: TSpeedButton; }
    pnProdutosMesa.ClassName; { pnProdutosMesa: TPanel; }
    btResumir.ClassName; { btResumir: TSpeedButton; }
    SpeedButton6.ClassName; { SpeedButton6: TSpeedButton; }
    SpeedButton10.ClassName; { SpeedButton10: TSpeedButton; }
    SpeedButton9.ClassName; { SpeedButton9: TSpeedButton; }
    SpeedButton7.ClassName; { SpeedButton7: TSpeedButton; }
    Panel1.ClassName; { Panel1: TPanel; }
    D30001011.ClassName; { D30001011: TDBGrid; }
    Panel3.ClassName; { Panel3: TPanel; }
    Label10.ClassName; { Label10: TLabel; }
    lbTxServ.ClassName; { lbTxServ: TLabel; }
    Label4.ClassName; { Label4: TLabel; }
    ed_valor_bruto.ClassName; { ed_valor_bruto: TCurrencyEdit; }
    ed_total_tx_serv.ClassName; { ed_total_tx_serv: TCurrencyEdit; }
    ed_total_conta.ClassName; { ed_total_conta: TCurrencyEdit; }
    pnMapaMesas.ClassName; { pnMapaMesas: TPanel; }
    imgMapa.ClassName; { imgMapa: TImage; }
    DBGrid1.ClassName; { DBGrid1: TDBGrid; }
    edLixo.ClassName; { edLixo: TEdit; }
    Timer1.ClassName; { Timer1: TTimer; }
  end;

{ frmExportaXMLNfce: TfrmExportaXMLNfce }
  with TfrmExportaXMLNfce(nil) do { uuExportaXMLNFCE.pas }
  begin
    botao_pesquisa.ClassName; { botao_pesquisa: TSpeedButton; }
    Edit1.ClassName; { Edit1: TEdit; }
    Panel4.ClassName; { Panel4: TPanel; }
    Label21.ClassName; { Label21: TLabel; }
    Label3.ClassName; { Label3: TLabel; }
    cbMes.ClassName; { cbMes: TComboBox; }
    cbAno.ClassName; { cbAno: TComboBox; }
    rdgListagem.ClassName; { rdgListagem: TRadioGroup; }
    BitBtn4.ClassName; { BitBtn4: TBitBtn; }
    AdvGlassButton1.ClassName; { AdvGlassButton1: TAdvGlassButton; }
    rdMesSelecionado.ClassName; { rdMesSelecionado: TRadioButton; }
    GroupBox1.ClassName; { GroupBox1: TGroupBox; }
    Label1.ClassName; { Label1: TLabel; }
    edDe.ClassName; { edDe: TDateEdit; }
    edAte.ClassName; { edAte: TDateEdit; }
    pnTitulo.ClassName; { pnTitulo: TPanel; }
    lbTitulo.ClassName; { lbTitulo: TLabel; }
    Panel1.ClassName; { Panel1: TPanel; }
    Panel2.ClassName; { Panel2: TPanel; }
    Label2.ClassName; { Label2: TLabel; }
    ProgressBar1.ClassName; { ProgressBar1: TProgressBar; }
    Panel6.ClassName; { Panel6: TPanel; }
    AdvGlassButton3.ClassName; { AdvGlassButton3: TAdvGlassButton; }
    cxPageControl1.ClassName; { cxPageControl1: TcxPageControl; }
    cxTabSheet1.ClassName; { cxTabSheet1: TcxTabSheet; }
    DBGrid1.ClassName; { DBGrid1: TDBGrid; }
    cliques.ClassName; { cliques: TActionList; }
    actlBusca.ClassName; { actlBusca: TJvControlActionList; }
    folderDialog.ClassName; { folderDialog: TJvBrowseForFolderDialog; }
    tbErrosExP.ClassName; { tbErrosExP: TFDMemTable; }
    tbErrosExPcodVenda.ClassName; { tbErrosExPcodVenda: TStringField; }
    tbErrosExPchaveNFE.ClassName; { tbErrosExPchaveNFE: TStringField; }
    tbErrosExPserie.ClassName; { tbErrosExPserie: TIntegerField; }
    tbErrosExPmodelo.ClassName; { tbErrosExPmodelo: TIntegerField; }
    tbErrosExPnumeroNota.ClassName; { tbErrosExPnumeroNota: TIntegerField; }
    tbErrosExPmsgErro.ClassName; { tbErrosExPmsgErro: TStringField; }
    tbErrosExPvalorVenda.ClassName; { tbErrosExPvalorVenda: TCurrencyField; }
    tbErrosExPvalorXML.ClassName; { tbErrosExPvalorXML: TCurrencyField; }
    tbErrosExPdata.ClassName; { tbErrosExPdata: TDateField; }
    tbErrosExPxmlDaNota.ClassName; { tbErrosExPxmlDaNota: TMemoField; }
    tbErrosExPcancelada.ClassName; { tbErrosExPcancelada: TBooleanField; }
    tbErrosExPprotVenda.ClassName; { tbErrosExPprotVenda: TStringField; }
    tbErrosExPprotXML.ClassName; { tbErrosExPprotXML: TStringField; }
    dsErrosEXP.ClassName; { dsErrosEXP: TDataSource; }
    PopupMenu1.ClassName; { PopupMenu1: TPopupMenu; }
    VisualizaroDanfe1.ClassName; { VisualizaroDanfe1: TMenuItem; }
    AtualizarXML1.ClassName; { AtualizarXML1: TMenuItem; }
  end;

{ frmRelLancamentosRD: TfrmRelLancamentosRD }
  with TfrmRelLancamentosRD(nil) do { uuListagemLancamentosRD.pas }
  begin
    botao_pesquisa.ClassName; { botao_pesquisa: TSpeedButton; }
    Edit1.ClassName; { Edit1: TEdit; }
    pnTitulo.ClassName; { pnTitulo: TPanel; }
    lbTitulo.ClassName; { lbTitulo: TLabel; }
    btSelecionar.ClassName; { btSelecionar: TAdvGlassButton; }
    btSair.ClassName; { btSair: TAdvGlassButton; }
    Panel4.ClassName; { Panel4: TPanel; }
    RadioGroup2.ClassName; { RadioGroup2: TRadioGroup; }
    Panel5.ClassName; { Panel5: TPanel; }
    Label4.ClassName; { Label4: TLabel; }
    Label3.ClassName; { Label3: TLabel; }
    cbk_visualizar.ClassName; { cbk_visualizar: TCheckBox; }
    edDataInicial.ClassName; { edDataInicial: TAdvDateTimePicker; }
    edDataFinal.ClassName; { edDataFinal: TAdvDateTimePicker; }
    GroupBox1.ClassName; { GroupBox1: TGroupBox; }
    cbEmpresas.ClassName; { cbEmpresas: TcxCheckComboBox; }
    rdFiltro.ClassName; { rdFiltro: TRadioGroup; }
    ckbOrdem.ClassName; { ckbOrdem: TRadioGroup; }
    ckbFiltroRD.ClassName; { ckbFiltroRD: TCheckBox; }
    rdgResumo.ClassName; { rdgResumo: TRadioGroup; }
    pnFornecedor.ClassName; { pnFornecedor: TPanel; }
    Label6.ClassName; { Label6: TLabel; }
    Label5.ClassName; { Label5: TLabel; }
    bt_pesq_fornecedor.ClassName; { bt_pesq_fornecedor: TSpeedButton; }
    ed_cod_fornecedor.ClassName; { ed_cod_fornecedor: TMaskEdit; }
    Panel6.ClassName; { Panel6: TPanel; }
    ed_nome_fantasia_fornecedor.ClassName; { ed_nome_fantasia_fornecedor: TMaskEdit; }
    cliques.ClassName; { cliques: TActionList; }
    actlBusca.ClassName; { actlBusca: TJvControlActionList; }
  end;

{ frmCancelamentoNFCEChave: TfrmCancelamentoNFCEChave }
  with TfrmCancelamentoNFCEChave(nil) do { uuCancelamentoNFCEChave.pas }
  begin
    botao_pesquisa.ClassName; { botao_pesquisa: TSpeedButton; }
    Edit1.ClassName; { Edit1: TEdit; }
    Panel1.ClassName; { Panel1: TPanel; }
    Label3.ClassName; { Label3: TLabel; }
    Panel2.ClassName; { Panel2: TPanel; }
    Label1.ClassName; { Label1: TLabel; }
    Label2.ClassName; { Label2: TLabel; }
    edChaveNFCE.ClassName; { edChaveNFCE: TEdit; }
    edProtocolo.ClassName; { edProtocolo: TEdit; }
    Panel3.ClassName; { Panel3: TPanel; }
    BitBtn1.ClassName; { BitBtn1: TBitBtn; }
    BitBtn2.ClassName; { BitBtn2: TBitBtn; }
  end;

{ frmMensagemTEF: TfrmMensagemTEF }
  with TfrmMensagemTEF(nil) do { uuMensagemTEF.pas }
  begin
    botao_pesquisa.ClassName; { botao_pesquisa: TSpeedButton; }
    Edit1.ClassName; { Edit1: TEdit; }
    Panel1.ClassName; { Panel1: TPanel; }
    memoInformacoesCartao.ClassName; { memoInformacoesCartao: TMemo; }
    pnSimNao.ClassName; { pnSimNao: TPanel; }
    SpeedButton1.ClassName; { SpeedButton1: TSpeedButton; }
    SpeedButton2.ClassName; { SpeedButton2: TSpeedButton; }
    Panel2.ClassName; { Panel2: TPanel; }
    memoMsg.ClassName; { memoMsg: TMemo; }
    tecladoTouch.ClassName; { tecladoTouch: TAdvTouchKeyboard; }
    SpeedButton3.ClassName; { SpeedButton3: TSpeedButton; }
    SpeedButton4.ClassName; { SpeedButton4: TSpeedButton; }
    edParametro.ClassName; { edParametro: TEdit; }
  end;

{ frmRelProdutosCSTPis: TfrmRelProdutosCSTPis }
  with TfrmRelProdutosCSTPis(nil) do { uuRelProdutosCSTPIS.pas }
  begin
    botao_pesquisa.ClassName; { botao_pesquisa: TSpeedButton; }
    SpeedButton1.ClassName; { SpeedButton1: TSpeedButton; }
    SpeedButton2.ClassName; { SpeedButton2: TSpeedButton; }
    Edit1.ClassName; { Edit1: TEdit; }
    Edit2.ClassName; { Edit2: TEdit; }
    Edit3.ClassName; { Edit3: TEdit; }
    BitBtn1.ClassName; { BitBtn1: TBitBtn; }
    BitBtn2.ClassName; { BitBtn2: TBitBtn; }
    Panel1.ClassName; { Panel1: TPanel; }
    RadioGroup1.ClassName; { RadioGroup1: TRadioGroup; }
    Panel5.ClassName; { Panel5: TPanel; }
    Label3.ClassName; { Label3: TLabel; }
    Label4.ClassName; { Label4: TLabel; }
    ed_data_inicial.ClassName; { ed_data_inicial: TMaskEdit; }
    ed_data_final.ClassName; { ed_data_final: TMaskEdit; }
    cbk_visualizar.ClassName; { cbk_visualizar: TCheckBox; }
    pn_grupos.ClassName; { pn_grupos: TPanel; }
  end;

{ frmRelAuditoriaPedidos: TfrmRelAuditoriaPedidos }
  with TfrmRelAuditoriaPedidos(nil) do { uuRelAuditoriaPedidos.pas }
  begin
    botao_pesquisa.ClassName; { botao_pesquisa: TSpeedButton; }
    SpeedButton1.ClassName; { SpeedButton1: TSpeedButton; }
    SpeedButton2.ClassName; { SpeedButton2: TSpeedButton; }
    SpeedButton3.ClassName; { SpeedButton3: TSpeedButton; }
    Edit1.ClassName; { Edit1: TEdit; }
    Edit2.ClassName; { Edit2: TEdit; }
    Edit3.ClassName; { Edit3: TEdit; }
    Edit4.ClassName; { Edit4: TEdit; }
    BitBtn1.ClassName; { BitBtn1: TBitBtn; }
    BitBtn2.ClassName; { BitBtn2: TBitBtn; }
    Panel1.ClassName; { Panel1: TPanel; }
    RadioGroup1.ClassName; { RadioGroup1: TRadioGroup; }
    Panel2.ClassName; { Panel2: TPanel; }
    Label1.ClassName; { Label1: TLabel; }
    Label2.ClassName; { Label2: TLabel; }
    ed_data_inicial.ClassName; { ed_data_inicial: TDateEdit; }
    ed_data_final.ClassName; { ed_data_final: TDateEdit; }
    rdFiltro.ClassName; { rdFiltro: TRadioGroup; }
  end;

{ frmGerenciamentoVendasCaixa: TfrmGerenciamentoVendasCaixa }
  with TfrmGerenciamentoVendasCaixa(nil) do { uuReimpressaoDanfeNFCE.pas }
  begin
    botao_pesquisa.ClassName; { botao_pesquisa: TSpeedButton; }
    Edit1.ClassName; { Edit1: TEdit; }
    Panel1.ClassName; { Panel1: TPanel; }
    Label1.ClassName; { Label1: TLabel; }
    pgList.ClassName; { pgList: TJvPageList; }
    pgPrincipal.ClassName; { pgPrincipal: TJvStandardPage; }
    Panel2.ClassName; { Panel2: TPanel; }
    Label4.ClassName; { Label4: TLabel; }
    Label5.ClassName; { Label5: TLabel; }
    Label6.ClassName; { Label6: TLabel; }
    Label8.ClassName; { Label8: TLabel; }
    PngSpeedButton1.ClassName; { PngSpeedButton1: TPngSpeedButton; }
    PngSpeedButton5.ClassName; { PngSpeedButton5: TPngSpeedButton; }
    GroupBox2.ClassName; { GroupBox2: TGroupBox; }
    Panel5.ClassName; { Panel5: TPanel; }
    Label3.ClassName; { Label3: TLabel; }
    Label7.ClassName; { Label7: TLabel; }
    ed_data_inicial.ClassName; { ed_data_inicial: TDateEdit; }
    ed_data_final.ClassName; { ed_data_final: TDateEdit; }
    edNotaInicial.ClassName; { edNotaInicial: TEdit; }
    edNotaFinal.ClassName; { edNotaFinal: TEdit; }
    rdgPDV.ClassName; { rdgPDV: TRadioGroup; }
    edNumeroPDV.ClassName; { edNumeroPDV: TEdit; }
    rdgTipoVenda.ClassName; { rdgTipoVenda: TRadioGroup; }
    rdgDocumento.ClassName; { rdgDocumento: TRadioGroup; }
    edMesa.ClassName; { edMesa: TEdit; }
    edValor.ClassName; { edValor: TEdit; }
    GroupBox1.ClassName; { GroupBox1: TGroupBox; }
    cbFormasPagamento.ClassName; { cbFormasPagamento: TcxCheckComboBox; }
    ckbDataMovimento.ClassName; { ckbDataMovimento: TRadioButton; }
    ckbDataRelogio.ClassName; { ckbDataRelogio: TRadioButton; }
    GroupBox3.ClassName; { GroupBox3: TGroupBox; }
    cbEmpresas.ClassName; { cbEmpresas: TcxCheckComboBox; }
    rdDesconto.ClassName; { rdDesconto: TRadioGroup; }
    GroupBox4.ClassName; { GroupBox4: TGroupBox; }
    cbFornecedores.ClassName; { cbFornecedores: TcxCheckComboBox; }
    rdFiltroFornecedor.ClassName; { rdFiltroFornecedor: TRadioGroup; }
    pnl1.ClassName; { pnl1: TPanel; }
    cxGrid1.ClassName; { cxGrid1: TcxGrid; }
    cxGrid1DBTableView1.ClassName; { cxGrid1DBTableView1: TcxGridDBTableView; }
    cxGrid1DBTableView1Column1.ClassName; { cxGrid1DBTableView1Column1: TcxGridDBColumn; }
    cxGrid1DBTableView1Column2.ClassName; { cxGrid1DBTableView1Column2: TcxGridDBColumn; }
    cxGrid1DBTableView1Column3.ClassName; { cxGrid1DBTableView1Column3: TcxGridDBColumn; }
    cxGrid1DBTableView1Column14.ClassName; { cxGrid1DBTableView1Column14: TcxGridDBColumn; }
    cxGrid1DBTableView1Column4.ClassName; { cxGrid1DBTableView1Column4: TcxGridDBColumn; }
    cxGrid1DBTableView1Column7.ClassName; { cxGrid1DBTableView1Column7: TcxGridDBColumn; }
    cxGrid1DBTableView1Column5.ClassName; { cxGrid1DBTableView1Column5: TcxGridDBColumn; }
    cxGrid1DBTableView1Column6.ClassName; { cxGrid1DBTableView1Column6: TcxGridDBColumn; }
    cxGrid1DBTableView1Column8.ClassName; { cxGrid1DBTableView1Column8: TcxGridDBColumn; }
    cxGrid1DBTableView1Column9.ClassName; { cxGrid1DBTableView1Column9: TcxGridDBColumn; }
    cxGrid1DBTableView1Column10.ClassName; { cxGrid1DBTableView1Column10: TcxGridDBColumn; }
    cxGrid1DBTableView1Column11.ClassName; { cxGrid1DBTableView1Column11: TcxGridDBColumn; }
    cxGrid1DBTableView1Column12.ClassName; { cxGrid1DBTableView1Column12: TcxGridDBColumn; }
    cxGrid1DBTableView1Column13.ClassName; { cxGrid1DBTableView1Column13: TcxGridDBColumn; }
    cxGrid1Level1.ClassName; { cxGrid1Level1: TcxGridLevel; }
    pgEmail.ClassName; { pgEmail: TJvStandardPage; }
    cliques.ClassName; { cliques: TActionList; }
    actlBusca.ClassName; { actlBusca: TJvControlActionList; }
    img.ClassName; { img: TImageList; }
    img2.ClassName; { img2: TImageList; }
    PopupMenu1.ClassName; { PopupMenu1: TPopupMenu; }
    VisualizarDanfe1.ClassName; { VisualizarDanfe1: TMenuItem; }
    ReimprimirDanfe1.ClassName; { ReimprimirDanfe1: TMenuItem; }
    Cartadecorreo1.ClassName; { Cartadecorreo1: TMenuItem; }
    CancelarNFENFCe1.ClassName; { CancelarNFENFCe1: TMenuItem; }
    E1.ClassName; { E1: TMenuItem; }
    C1.ClassName; { C1: TMenuItem; }
    C2.ClassName; { C2: TMenuItem; }
    E2.ClassName; { E2: TMenuItem; }
    D1.ClassName; { D1: TMenuItem; }
    cxStyleRepository1.ClassName; { cxStyleRepository1: TcxStyleRepository; }
    cxStyle2.ClassName; { cxStyle2: TcxStyle; }
    stlRegistro.ClassName; { stlRegistro: TcxStyle; }
    stConfirmada.ClassName; { stConfirmada: TcxStyle; }
    stCancelada.ClassName; { stCancelada: TcxStyle; }
    stCiencia.ClassName; { stCiencia: TcxStyle; }
    stSemManifesto.ClassName; { stSemManifesto: TcxStyle; }
    stNaoRealizada.ClassName; { stNaoRealizada: TcxStyle; }
  end;

{ frmRelLancamentosNotasRD: TfrmRelLancamentosNotasRD }
  with TfrmRelLancamentosNotasRD(nil) do { uuRelLancamentosNotas.pas }
  begin
    botao_pesquisa.ClassName; { botao_pesquisa: TSpeedButton; }
    Edit1.ClassName; { Edit1: TEdit; }
    Panel1.ClassName; { Panel1: TPanel; }
    BitBtn1.ClassName; { BitBtn1: TBitBtn; }
    BitBtn2.ClassName; { BitBtn2: TBitBtn; }
    Panel2.ClassName; { Panel2: TPanel; }
    RadioGroup1.ClassName; { RadioGroup1: TRadioGroup; }
    Panel3.ClassName; { Panel3: TPanel; }
    Label1.ClassName; { Label1: TLabel; }
    Label2.ClassName; { Label2: TLabel; }
    ed_data_inicial.ClassName; { ed_data_inicial: TDateEdit; }
    ed_data_final.ClassName; { ed_data_final: TDateEdit; }
    rdTipo.ClassName; { rdTipo: TRadioGroup; }
  end;

{ frmEmissaoNFEEncerramento: TfrmEmissaoNFEEncerramento }
  with TfrmEmissaoNFEEncerramento(nil) do { uuEmissaoNFEEncerramento.pas }
  begin
    botao_pesquisa.ClassName; { botao_pesquisa: TSpeedButton; }
    Edit1.ClassName; { Edit1: TEdit; }
    Panel5.ClassName; { Panel5: TPanel; }
    BitBtn1.ClassName; { BitBtn1: TBitBtn; }
    BitBtn2.ClassName; { BitBtn2: TBitBtn; }
    Panel6.ClassName; { Panel6: TPanel; }
    Label3.ClassName; { Label3: TLabel; }
    memoInformacoesAdicionais.ClassName; { memoInformacoesAdicionais: TMemo; }
    pnDadosFornecedor.ClassName; { pnDadosFornecedor: TPanel; }
    gpFornecedor.ClassName; { gpFornecedor: TGroupBox; }
    Label2.ClassName; { Label2: TLabel; }
    bt_pesq_fornecedor.ClassName; { bt_pesq_fornecedor: TSpeedButton; }
    Label1.ClassName; { Label1: TLabel; }
    Panel3.ClassName; { Panel3: TPanel; }
    ed_razao_social_fornecedor.ClassName; { ed_razao_social_fornecedor: TEdit; }
    Panel13.ClassName; { Panel13: TPanel; }
    ed_cod_fornecedor.ClassName; { ed_cod_fornecedor: TEdit; }
    Panel1.ClassName; { Panel1: TPanel; }
    lblTitulo.ClassName; { lblTitulo: TLabel; }
  end;

{ frmRelItensRdGrupo: TfrmRelItensRdGrupo }
  with TfrmRelItensRdGrupo(nil) do { uuRelItensRDGrupo.pas }
  begin
    botao_pesquisa.ClassName; { botao_pesquisa: TSpeedButton; }
    SpeedButton1.ClassName; { SpeedButton1: TSpeedButton; }
    SpeedButton2.ClassName; { SpeedButton2: TSpeedButton; }
    SpeedButton3.ClassName; { SpeedButton3: TSpeedButton; }
    SpeedButton4.ClassName; { SpeedButton4: TSpeedButton; }
    Edit1.ClassName; { Edit1: TEdit; }
    Edit2.ClassName; { Edit2: TEdit; }
    Edit3.ClassName; { Edit3: TEdit; }
    Edit4.ClassName; { Edit4: TEdit; }
    Edit5.ClassName; { Edit5: TEdit; }
    Panel1.ClassName; { Panel1: TPanel; }
    RadioGroup2.ClassName; { RadioGroup2: TRadioGroup; }
    Panel5.ClassName; { Panel5: TPanel; }
    Label3.ClassName; { Label3: TLabel; }
    Label4.ClassName; { Label4: TLabel; }
    cbk_visualizar.ClassName; { cbk_visualizar: TCheckBox; }
    edDe.ClassName; { edDe: TDateEdit; }
    edAte.ClassName; { edAte: TDateEdit; }
    Panel9.ClassName; { Panel9: TPanel; }
    Label9.ClassName; { Label9: TLabel; }
    bt_pesq_grupo.ClassName; { bt_pesq_grupo: TSpeedButton; }
    Label10.ClassName; { Label10: TLabel; }
    ed_cod_grupo.ClassName; { ed_cod_grupo: TMaskEdit; }
    Panel10.ClassName; { Panel10: TPanel; }
    ed_desc_grupo.ClassName; { ed_desc_grupo: TMaskEdit; }
    Panel2.ClassName; { Panel2: TPanel; }
    Label6.ClassName; { Label6: TLabel; }
    Label5.ClassName; { Label5: TLabel; }
    bt_pesq_fornecedor.ClassName; { bt_pesq_fornecedor: TSpeedButton; }
    ed_cod_fornecedor.ClassName; { ed_cod_fornecedor: TMaskEdit; }
    Panel6.ClassName; { Panel6: TPanel; }
    ed_nome_fantasia_fornecedor.ClassName; { ed_nome_fantasia_fornecedor: TMaskEdit; }
    Panel4.ClassName; { Panel4: TPanel; }
    BitBtn1.ClassName; { BitBtn1: TBitBtn; }
    BitBtn2.ClassName; { BitBtn2: TBitBtn; }
  end;

{ frmInutilizacoesNFCE: TfrmInutilizacoesNFCE }
  with TfrmInutilizacoesNFCE(nil) do { uuFrmInutilizacoesNFCE.pas }
  begin
    botao_pesquisa.ClassName; { botao_pesquisa: TSpeedButton; }
    Edit1.ClassName; { Edit1: TEdit; }
    pnInutlizacoes.ClassName; { pnInutlizacoes: TPanel; }
    lbpnInutilizacoes.ClassName; { lbpnInutilizacoes: TLabel; }
    lbQtdInut.ClassName; { lbQtdInut: TLabel; }
    Panel4.ClassName; { Panel4: TPanel; }
    Label1.ClassName; { Label1: TLabel; }
    pgInutilizacoes.ClassName; { pgInutilizacoes: TProgressBar; }
  end;

{ frmRelProdutosVariosPeriodos: TfrmRelProdutosVariosPeriodos }
  with TfrmRelProdutosVariosPeriodos(nil) do { uuRelProdutosVariosPeriodos.pas }
  begin
    botao_pesquisa.ClassName; { botao_pesquisa: TSpeedButton; }
    SpeedButton1.ClassName; { SpeedButton1: TSpeedButton; }
    SpeedButton2.ClassName; { SpeedButton2: TSpeedButton; }
    Edit1.ClassName; { Edit1: TEdit; }
    Edit2.ClassName; { Edit2: TEdit; }
    Edit3.ClassName; { Edit3: TEdit; }
    BitBtn1.ClassName; { BitBtn1: TBitBtn; }
    BitBtn2.ClassName; { BitBtn2: TBitBtn; }
    Panel1.ClassName; { Panel1: TPanel; }
    pn_grupos.ClassName; { pn_grupos: TPanel; }
    Label1.ClassName; { Label1: TLabel; }
    Label2.ClassName; { Label2: TLabel; }
    bt_pesq_grupo.ClassName; { bt_pesq_grupo: TSpeedButton; }
    Panel3.ClassName; { Panel3: TPanel; }
    ed_desc_grupo.ClassName; { ed_desc_grupo: TMaskEdit; }
    ed_cod_grupo.ClassName; { ed_cod_grupo: TMaskEdit; }
    Panel4.ClassName; { Panel4: TPanel; }
    DBGrid1.ClassName; { DBGrid1: TDBGrid; }
    Panel2.ClassName; { Panel2: TPanel; }
    Label3.ClassName; { Label3: TLabel; }
    Label4.ClassName; { Label4: TLabel; }
    SpeedButton3.ClassName; { SpeedButton3: TSpeedButton; }
    Label5.ClassName; { Label5: TLabel; }
    Label6.ClassName; { Label6: TLabel; }
    gp_loja.ClassName; { gp_loja: TGroupBox; }
    Label7.ClassName; { Label7: TLabel; }
    btPesqLoja.ClassName; { btPesqLoja: TSpeedButton; }
    Label28.ClassName; { Label28: TLabel; }
    Panel9.ClassName; { Panel9: TPanel; }
    edDescLoja.ClassName; { edDescLoja: TEdit; }
    edCodLoja.ClassName; { edCodLoja: TEdit; }
    edDe.ClassName; { edDe: TDateEdit; }
    edAte.ClassName; { edAte: TDateEdit; }
    BitBtn3.ClassName; { BitBtn3: TBitBtn; }
    edHoraInicial.ClassName; { edHoraInicial: TJvTimeEdit; }
    edHoraFinal.ClassName; { edHoraFinal: TJvTimeEdit; }
    PopupMenu1.ClassName; { PopupMenu1: TPopupMenu; }
    Excluir1.ClassName; { Excluir1: TMenuItem; }
  end;

{ frmConferenciaNFCEEmitidas: TfrmConferenciaNFCEEmitidas }
  with TfrmConferenciaNFCEEmitidas(nil) do { uuConfNFCEEmitidas.pas }
  begin
    botao_pesquisa.ClassName; { botao_pesquisa: TSpeedButton; }
    Edit1.ClassName; { Edit1: TEdit; }
    Button1.ClassName; { Button1: TButton; }
    Memo1.ClassName; { Memo1: TMemo; }
  end;

{ frmExportaXMLEntradas: TfrmExportaXMLEntradas }
  with TfrmExportaXMLEntradas(nil) do { uuExportaXMLEntradas.pas }
  begin
    botao_pesquisa.ClassName; { botao_pesquisa: TSpeedButton; }
    Edit1.ClassName; { Edit1: TEdit; }
    Panel1.ClassName; { Panel1: TPanel; }
    Label14.ClassName; { Label14: TLabel; }
    Label1.ClassName; { Label1: TLabel; }
    GroupBox2.ClassName; { GroupBox2: TGroupBox; }
    Panel5.ClassName; { Panel5: TPanel; }
    Label3.ClassName; { Label3: TLabel; }
    Label7.ClassName; { Label7: TLabel; }
    ed_data_inicial.ClassName; { ed_data_inicial: TDateEdit; }
    ed_data_final.ClassName; { ed_data_final: TDateEdit; }
    Panel3.ClassName; { Panel3: TPanel; }
    Panel4.ClassName; { Panel4: TPanel; }
    Panel6.ClassName; { Panel6: TPanel; }
    BitBtn2.ClassName; { BitBtn2: TBitBtn; }
    Panel7.ClassName; { Panel7: TPanel; }
    BitBtn3.ClassName; { BitBtn3: TBitBtn; }
    ProgressBar1.ClassName; { ProgressBar1: TProgressBar; }
    FolderDialog1.ClassName; { FolderDialog1: TFolderDialog; }
    folderDialog.ClassName; { folderDialog: TJvBrowseForFolderDialog; }
  end;

{ frmRelCancelamentosProdutos: TfrmRelCancelamentosProdutos }
  with TfrmRelCancelamentosProdutos(nil) do { uuRelCancelamentoProdutos.pas }
  begin
    botao_pesquisa.ClassName; { botao_pesquisa: TSpeedButton; }
    Edit1.ClassName; { Edit1: TEdit; }
    Panel6.ClassName; { Panel6: TPanel; }
    lbTitulo.ClassName; { lbTitulo: TLabel; }
    Label6.ClassName; { Label6: TLabel; }
    Panel4.ClassName; { Panel4: TPanel; }
    BitBtn1.ClassName; { BitBtn1: TBitBtn; }
    BitBtn2.ClassName; { BitBtn2: TBitBtn; }
    Panel1.ClassName; { Panel1: TPanel; }
    Label1.ClassName; { Label1: TLabel; }
    RadioGroup1.ClassName; { RadioGroup1: TRadioGroup; }
    Panel2.ClassName; { Panel2: TPanel; }
    Label2.ClassName; { Label2: TLabel; }
    CheckBox2.ClassName; { CheckBox2: TCheckBox; }
    edDataInicial.ClassName; { edDataInicial: TDateEdit; }
    Panel7.ClassName; { Panel7: TPanel; }
    Label4.ClassName; { Label4: TLabel; }
    CheckBox3.ClassName; { CheckBox3: TCheckBox; }
    edDataFinal.ClassName; { edDataFinal: TDateEdit; }
    Panel3.ClassName; { Panel3: TPanel; }
    Label3.ClassName; { Label3: TLabel; }
    Label5.ClassName; { Label5: TLabel; }
    edHoraInicial.ClassName; { edHoraInicial: TJvTimeEdit; }
    edHoraFinal.ClassName; { edHoraFinal: TJvTimeEdit; }
    cliques.ClassName; { cliques: TActionList; }
  end;

{ frmConsultaInfSat: TfrmConsultaInfSat }
  with TfrmConsultaInfSat(nil) do { uuConsultaInfSat.pas }
  begin
    botao_pesquisa.ClassName; { botao_pesquisa: TSpeedButton; }
    Edit1.ClassName; { Edit1: TEdit; }
    Panel1.ClassName; { Panel1: TPanel; }
    Label1.ClassName; { Label1: TLabel; }
    Label2.ClassName; { Label2: TLabel; }
    BitBtn1.ClassName; { BitBtn1: TBitBtn; }
    BitBtn3.ClassName; { BitBtn3: TBitBtn; }
    BitBtn4.ClassName; { BitBtn4: TBitBtn; }
    Panel2.ClassName; { Panel2: TPanel; }
    Memo1.ClassName; { Memo1: TMemo; }
  end;

{ dmVendas: TdmVendas }
  with TdmVendas(nil) do { uuDmVendas.pas }
  begin
    qryVendas.ClassName; { qryVendas: TIBQuery; }
    qryVendasCOD_VENDA.ClassName; { qryVendasCOD_VENDA: TIBStringField; }
    qryVendasDATA.ClassName; { qryVendasDATA: TDateField; }
    qryVendasHORA.ClassName; { qryVendasHORA: TTimeField; }
    qryVendasDATA_SO.ClassName; { qryVendasDATA_SO: TDateField; }
    qryVendasDATA_ECF.ClassName; { qryVendasDATA_ECF: TDateField; }
    qryVendasHORA_ECF.ClassName; { qryVendasHORA_ECF: TTimeField; }
    qryVendasVALOR_BRUTO.ClassName; { qryVendasVALOR_BRUTO: TIBBCDField; }
    qryVendasVALOR_DESCONTO.ClassName; { qryVendasVALOR_DESCONTO: TIBBCDField; }
    qryVendasVALOR_TXSERV.ClassName; { qryVendasVALOR_TXSERV: TIBBCDField; }
    qryVendasVALOR_TOTAL.ClassName; { qryVendasVALOR_TOTAL: TIBBCDField; }
    qryVendasTOTAL_PAGO.ClassName; { qryVendasTOTAL_PAGO: TIBBCDField; }
    qryVendasVALOR_TROCO.ClassName; { qryVendasVALOR_TROCO: TIBBCDField; }
    qryVendasCOD_USUARIO.ClassName; { qryVendasCOD_USUARIO: TIBStringField; }
    qryVendasNUMERO_CAIXA.ClassName; { qryVendasNUMERO_CAIXA: TIBStringField; }
    qryVendasMESA.ClassName; { qryVendasMESA: TIBStringField; }
    qryVendasIMP.ClassName; { qryVendasIMP: TSmallintField; }
    qryVendasCOD_CAIXA.ClassName; { qryVendasCOD_CAIXA: TIBStringField; }
    qryVendasTIPO_VENDA.ClassName; { qryVendasTIPO_VENDA: TSmallintField; }
    qryVendasCOD_PEDIDO_DELIVERY.ClassName; { qryVendasCOD_PEDIDO_DELIVERY: TIBStringField; }
    qryVendasCOO_CUPOM.ClassName; { qryVendasCOO_CUPOM: TIBStringField; }
    qryVendasQTDE_PESSOAS.ClassName; { qryVendasQTDE_PESSOAS: TSmallintField; }
    qryVendasVALOR_TX_ENTREGA.ClassName; { qryVendasVALOR_TX_ENTREGA: TIBBCDField; }
    qryVendasREDUCAO_Z.ClassName; { qryVendasREDUCAO_Z: TIntegerField; }
    qryVendasSELECIONADO.ClassName; { qryVendasSELECIONADO: TSmallintField; }
    qryVendasDESCONTO_TAXAS.ClassName; { qryVendasDESCONTO_TAXAS: TFMTBCDField; }
    qryVendasCHAVE_NFCE.ClassName; { qryVendasCHAVE_NFCE: TIBStringField; }
    qryVendasNUMERO_NFCE.ClassName; { qryVendasNUMERO_NFCE: TIntegerField; }
    qryVendasSERIE_NFCE.ClassName; { qryVendasSERIE_NFCE: TSmallintField; }
    qryVendasPROTOCOLO_NFCE.ClassName; { qryVendasPROTOCOLO_NFCE: TIBStringField; }
    qryVendasRECIBO_NFCE.ClassName; { qryVendasRECIBO_NFCE: TIBStringField; }
    qryVendasOBS_NFCE.ClassName; { qryVendasOBS_NFCE: TIBStringField; }
    qryVendasCONSULTA_OK.ClassName; { qryVendasCONSULTA_OK: TSmallintField; }
    qryVendasCOD_EMPRESA.ClassName; { qryVendasCOD_EMPRESA: TIBStringField; }
    qryVendasPERCENTUAL_DESCONTO.ClassName; { qryVendasPERCENTUAL_DESCONTO: TFMTBCDField; }
    qryVendasLOTE_EXPORTACAO_WEB.ClassName; { qryVendasLOTE_EXPORTACAO_WEB: TLargeintField; }
    qryVendasCOD_GARCON_ABRIU.ClassName; { qryVendasCOD_GARCON_ABRIU: TIBStringField; }
    qryVendasMODELO_COMPROVANTE.ClassName; { qryVendasMODELO_COMPROVANTE: TSmallintField; }
    qryVendasCOD_FORNECEDOR.ClassName; { qryVendasCOD_FORNECEDOR: TIBStringField; }
    qryVendasSESSAO_SAT.ClassName; { qryVendasSESSAO_SAT: TLargeintField; }
    qryVendasCNF_SAT.ClassName; { qryVendasCNF_SAT: TLargeintField; }
    qryVendasXML_DOC.ClassName; { qryVendasXML_DOC: TWideMemoField; }
    qryVendasCNPJ_CPF_CLIENTE_NF.ClassName; { qryVendasCNPJ_CPF_CLIENTE_NF: TIBStringField; }
    qryVendasNOME_CLIENTE_NF.ClassName; { qryVendasNOME_CLIENTE_NF: TIBStringField; }
    qryVendasTENTATIVAS_ENVIO_NFCE.ClassName; { qryVendasTENTATIVAS_ENVIO_NFCE: TSmallintField; }
    qryVendasTEMPO_EMISSAO_NFCE.ClassName; { qryVendasTEMPO_EMISSAO_NFCE: TSmallintField; }
    qryVendasTABELA_PRECO.ClassName; { qryVendasTABELA_PRECO: TSmallintField; }
    qryVendasSTATUS.ClassName; { qryVendasSTATUS: TSmallintField; }
    updVendas.ClassName; { updVendas: TIBUpdateSQL; }
  end;

{ frmCancelaNFCEChave: TfrmCancelaNFCEChave }
  with TfrmCancelaNFCEChave(nil) do { uuCancelaNFCEChave.pas }
  begin
    botao_pesquisa.ClassName; { botao_pesquisa: TSpeedButton; }
    Label1.ClassName; { Label1: TLabel; }
    Label2.ClassName; { Label2: TLabel; }
    Edit1.ClassName; { Edit1: TEdit; }
    edProtocolo.ClassName; { edProtocolo: TEdit; }
    Button1.ClassName; { Button1: TButton; }
    edChave.ClassName; { edChave: TEdit; }
    cliques.ClassName; { cliques: TActionList; }
  end;

{ dmPedidoDelivery: TdmPedidoDelivery }
  with TdmPedidoDelivery(nil) do { uuDMPedidoDelivery.pas }
  begin
    dsObservacoesClientes.ClassName; { dsObservacoesClientes: TDataSource; }
    dsUltimosPedidos.ClassName; { dsUltimosPedidos: TDataSource; }
    dsQryItensUltimosPedidos.ClassName; { dsQryItensUltimosPedidos: TDataSource; }
    dsFormasPagtoTemp.ClassName; { dsFormasPagtoTemp: TDataSource; }
    tbFormasPagamentoTemp.ClassName; { tbFormasPagamentoTemp: TRxMemoryData; }
    tbFormasPagamentoTempcodForma.ClassName; { tbFormasPagamentoTempcodForma: TStringField; }
    tbFormasPagamentoTempdescricaoForma.ClassName; { tbFormasPagamentoTempdescricaoForma: TStringField; }
    tbFormasPagamentoTempvalorForma.ClassName; { tbFormasPagamentoTempvalorForma: TCurrencyField; }
    tbFormasPagamentoTemprp.ClassName; { tbFormasPagamentoTemprp: TStringField; }
    tbFormasPagamentoTempoperadoraCartao.ClassName; { tbFormasPagamentoTempoperadoraCartao: TStringField; }
    tbFormasPagamentoTempnumeroCartao.ClassName; { tbFormasPagamentoTempnumeroCartao: TStringField; }
    tbFormasPagamentoTempvalidadeCartao.ClassName; { tbFormasPagamentoTempvalidadeCartao: TStringField; }
    tbFormasPagamentoTempcodigoCartao.ClassName; { tbFormasPagamentoTempcodigoCartao: TStringField; }
    tbFormasPagamentoTempcodCliFaturamento.ClassName; { tbFormasPagamentoTempcodCliFaturamento: TStringField; }
    tbFormasPagamentoTempobsFaturamento.ClassName; { tbFormasPagamentoTempobsFaturamento: TStringField; }
    dsQryTabelaPrecos.ClassName; { dsQryTabelaPrecos: TDataSource; }
    tbCsClientesDelivery.ClassName; { tbCsClientesDelivery: TFDMemTable; }
    dsConsultaClientes.ClassName; { dsConsultaClientes: TDataSource; }
    tbObservacoesClientes.ClassName; { tbObservacoesClientes: TFDMemTable; }
    tbUltimosPedidos.ClassName; { tbUltimosPedidos: TFDMemTable; }
    tbItensUltimosPedidos.ClassName; { tbItensUltimosPedidos: TFDMemTable; }
    tbTabelaDePrecos.ClassName; { tbTabelaDePrecos: TFDMemTable; }
    FDGUIxWaitCursor1.ClassName; { FDGUIxWaitCursor1: TFDGUIxWaitCursor; }
    dsMovimentoResumido.ClassName; { dsMovimentoResumido: TDataSource; }
    tbMovimentoResumido.ClassName; { tbMovimentoResumido: TFDMemTable; }
  end;

{ dmCadProduto: TdmCadProduto }
  with TdmCadProduto(nil) do { uuDMCadProdutos.pas }
  begin
    qryUnidadeEntrada.ClassName; { qryUnidadeEntrada: TIBQuery; }
    qryUnidadeEntradaCOD_UNIDADE.ClassName; { qryUnidadeEntradaCOD_UNIDADE: TIBStringField; }
    qryUnidadeEntradaDESCRICAO.ClassName; { qryUnidadeEntradaDESCRICAO: TIBStringField; }
    qryUnidadeEntradaSIGLA.ClassName; { qryUnidadeEntradaSIGLA: TIBStringField; }
    qryUnidadeEntradaPARAMETRO.ClassName; { qryUnidadeEntradaPARAMETRO: TIBBCDField; }
    qryUnidadeEntradaCOD_PADRAO.ClassName; { qryUnidadeEntradaCOD_PADRAO: TIBStringField; }
    tsConsultas.ClassName; { tsConsultas: TIBTransaction; }
    dsQryUnidades.ClassName; { dsQryUnidades: TDataSource; }
    qryGruposTouch.ClassName; { qryGruposTouch: TIBQuery; }
    qryGruposTouchCODIGO.ClassName; { qryGruposTouchCODIGO: TIBStringField; }
    qryGruposTouchDESCRICAO.ClassName; { qryGruposTouchDESCRICAO: TIBStringField; }
    qryGruposTouchORDEM.ClassName; { qryGruposTouchORDEM: TSmallintField; }
    qryGruposTouchCOD_GRUPO.ClassName; { qryGruposTouchCOD_GRUPO: TIBStringField; }
    dsGruposTouch.ClassName; { dsGruposTouch: TDataSource; }
    qryMiniPrinters.ClassName; { qryMiniPrinters: TIBQuery; }
    qryMiniPrintersCOD_MINIPRINTER.ClassName; { qryMiniPrintersCOD_MINIPRINTER: TIBStringField; }
    qryMiniPrintersDESCRICAO.ClassName; { qryMiniPrintersDESCRICAO: TIBStringField; }
    qryMiniPrintersMARCA.ClassName; { qryMiniPrintersMARCA: TSmallintField; }
    qryMiniPrintersMODELO.ClassName; { qryMiniPrintersMODELO: TSmallintField; }
    qryMiniPrintersN_ESTACAO.ClassName; { qryMiniPrintersN_ESTACAO: TSmallintField; }
    qryMiniPrintersPORTA.ClassName; { qryMiniPrintersPORTA: TIBStringField; }
    qryMiniPrintersIMPRIME_EXTRATO.ClassName; { qryMiniPrintersIMPRIME_EXTRATO: TSmallintField; }
    qryMiniPrintersCORTA_PAPEL.ClassName; { qryMiniPrintersCORTA_PAPEL: TSmallintField; }
    qryMiniPrintersSALTOS.ClassName; { qryMiniPrintersSALTOS: TSmallintField; }
    qryMiniPrintersVIAS.ClassName; { qryMiniPrintersVIAS: TSmallintField; }
    dsQryMiniPrinters.ClassName; { dsQryMiniPrinters: TDataSource; }
    qryAliquotas.ClassName; { qryAliquotas: TIBQuery; }
    qryAliquotasCOD_ALIQUOTA.ClassName; { qryAliquotasCOD_ALIQUOTA: TIBStringField; }
    qryAliquotasDESCRICAO.ClassName; { qryAliquotasDESCRICAO: TIBStringField; }
    dsAliquotas.ClassName; { dsAliquotas: TDataSource; }
  end;

{ frmRankingClientesDelivery: TfrmRankingClientesDelivery }
  with TfrmRankingClientesDelivery(nil) do { uuRelRankingClientesDelivery.pas }
  begin
    botao_pesquisa.ClassName; { botao_pesquisa: TSpeedButton; }
    Edit1.ClassName; { Edit1: TEdit; }
    Panel4.ClassName; { Panel4: TPanel; }
    BitBtn1.ClassName; { BitBtn1: TBitBtn; }
    BitBtn2.ClassName; { BitBtn2: TBitBtn; }
    Panel1.ClassName; { Panel1: TPanel; }
    Label3.ClassName; { Label3: TLabel; }
    RadioGroup1.ClassName; { RadioGroup1: TRadioGroup; }
    Panel2.ClassName; { Panel2: TPanel; }
    Label2.ClassName; { Label2: TLabel; }
    cbk_visualizar.ClassName; { cbk_visualizar: TCheckBox; }
    edDataInicial.ClassName; { edDataInicial: TDateEdit; }
    Panel3.ClassName; { Panel3: TPanel; }
    Label1.ClassName; { Label1: TLabel; }
    CheckBox1.ClassName; { CheckBox1: TCheckBox; }
    edDataFinal.ClassName; { edDataFinal: TDateEdit; }
    spinRank.ClassName; { spinRank: TSpinEdit; }
    rdTipoRelatorio.ClassName; { rdTipoRelatorio: TRadioGroup; }
    cliques.ClassName; { cliques: TActionList; }
  end;

{ frmMensagemExpiracaoCertificado: TfrmMensagemExpiracaoCertificado }
  with TfrmMensagemExpiracaoCertificado(nil) do { uuMensagemExpiracaoCertificado.pas }
  begin
    Image1.ClassName; { Image1: TImage; }
    lbTitulo.ClassName; { lbTitulo: TLabel; }
    lbDiasExpiracao.ClassName; { lbDiasExpiracao: TLabel; }
    Image2.ClassName; { Image2: TImage; }
    Label2.ClassName; { Label2: TLabel; }
    lbExpiracao.ClassName; { lbExpiracao: TLabel; }
    Panel1.ClassName; { Panel1: TPanel; }
    memoMensagens.ClassName; { memoMensagens: TMemo; }
    ckbConfirmacao.ClassName; { ckbConfirmacao: TCheckBox; }
  end;

{ frmRelComprasRefCruzada: TfrmRelComprasRefCruzada }
  with TfrmRelComprasRefCruzada(nil) do { uuRelComprasRefCruzada.pas }
  begin
    GroupBox1.ClassName; { GroupBox1: TGroupBox; }
    Label1.ClassName; { Label1: TLabel; }
    cbMes.ClassName; { cbMes: TComboBox; }
    cbAno.ClassName; { cbAno: TComboBox; }
    edDataInicial.ClassName; { edDataInicial: TJvDateEdit; }
    edDataFinal.ClassName; { edDataFinal: TJvDateEdit; }
    Panel1.ClassName; { Panel1: TPanel; }
    BitBtn1.ClassName; { BitBtn1: TBitBtn; }
    BitBtn2.ClassName; { BitBtn2: TBitBtn; }
  end;

{ frmCartaCorrecao: TfrmCartaCorrecao }
  with TfrmCartaCorrecao(nil) do { uufrmCartaCorrecao.pas }
  begin
    botao_pesquisa.ClassName; { botao_pesquisa: TSpeedButton; }
    Edit1.ClassName; { Edit1: TEdit; }
    Panel1.ClassName; { Panel1: TPanel; }
    Label1.ClassName; { Label1: TLabel; }
    Label2.ClassName; { Label2: TLabel; }
    frmCartaCorrecao.ClassName; { frmCartaCorrecao: TPanel; }
    BitBtn1.ClassName; { BitBtn1: TBitBtn; }
    BitBtn2.ClassName; { BitBtn2: TBitBtn; }
    Panel3.ClassName; { Panel3: TPanel; }
    Memo1.ClassName; { Memo1: TMemo; }
    cliques.ClassName; { cliques: TActionList; }
  end;

{ frmInventario: TfrmInventario }
  with TfrmInventario(nil) do { uuInventario.pas }
  begin
    botao_pesquisa.ClassName; { botao_pesquisa: TSpeedButton; }
    Edit1.ClassName; { Edit1: TEdit; }
    frmCorpo.ClassName; { frmCorpo: TPanel; }
    Label4.ClassName; { Label4: TLabel; }
    Label2.ClassName; { Label2: TLabel; }
    Label6.ClassName; { Label6: TLabel; }
    Label12.ClassName; { Label12: TLabel; }
    bt_pesq_item_estoque_cod.ClassName; { bt_pesq_item_estoque_cod: TSpeedButton; }
    Label5.ClassName; { Label5: TLabel; }
    AdvGlassButton2.ClassName; { AdvGlassButton2: TAdvGlassButton; }
    edEstoqueApurado.ClassName; { edEstoqueApurado: TJvValidateEdit; }
    edValorUnitario.ClassName; { edValorUnitario: TJvValidateEdit; }
    ed_cod_item.ClassName; { ed_cod_item: TEdit; }
    Panel2.ClassName; { Panel2: TPanel; }
    ed_desc_item.ClassName; { ed_desc_item: TEdit; }
    gdProdutosInventario.ClassName; { gdProdutosInventario: TcxGrid; }
    gdProdutosInventarioDBTableView1.ClassName; { gdProdutosInventarioDBTableView1: TcxGridDBTableView; }
    gdProdutosInventarioDBTableView1Column2.ClassName; { gdProdutosInventarioDBTableView1Column2: TcxGridDBColumn; }
    gdProdutosInventarioDBTableView1COD_PRODUTO.ClassName; { gdProdutosInventarioDBTableView1COD_PRODUTO: TcxGridDBColumn; }
    gdProdutosInventarioDBTableView1DESCRICAO.ClassName; { gdProdutosInventarioDBTableView1DESCRICAO: TcxGridDBColumn; }
    gdProdutosInventarioDBTableView1QTDE_SISTEMA.ClassName; { gdProdutosInventarioDBTableView1QTDE_SISTEMA: TcxGridDBColumn; }
    gdProdutosInventarioDBTableView1Column1.ClassName; { gdProdutosInventarioDBTableView1Column1: TcxGridDBColumn; }
    gdProdutosInventarioDBTableView1QTDE_APURADA.ClassName; { gdProdutosInventarioDBTableView1QTDE_APURADA: TcxGridDBColumn; }
    gdProdutosInventarioDBTableView1CUSTO.ClassName; { gdProdutosInventarioDBTableView1CUSTO: TcxGridDBColumn; }
    gdProdutosInventarioDBTableView1AJUSTE.ClassName; { gdProdutosInventarioDBTableView1AJUSTE: TcxGridDBColumn; }
    gdProdutosInventarioDBTableView1VALOR_AJUSTE.ClassName; { gdProdutosInventarioDBTableView1VALOR_AJUSTE: TcxGridDBColumn; }
    gdProdutosInventarioDBTableView1TOTAL_ESTOQUE.ClassName; { gdProdutosInventarioDBTableView1TOTAL_ESTOQUE: TcxGridDBColumn; }
    gdProdutosInventarioLevel1.ClassName; { gdProdutosInventarioLevel1: TcxGridLevel; }
    frmTopo.ClassName; { frmTopo: TPanel; }
    Label8.ClassName; { Label8: TLabel; }
    Label10.ClassName; { Label10: TLabel; }
    Label3.ClassName; { Label3: TLabel; }
    edDataInventario.ClassName; { edDataInventario: TAdvDateTimePicker; }
    cbHistoricoInventario.ClassName; { cbHistoricoInventario: TcxLookupComboBox; }
    memoObservacoes.ClassName; { memoObservacoes: TMemo; }
    ckbFolhaCOnferencia.ClassName; { ckbFolhaCOnferencia: TCheckBox; }
    Panel1.ClassName; { Panel1: TPanel; }
    Label1.ClassName; { Label1: TLabel; }
    Panel3.ClassName; { Panel3: TPanel; }
    AdvGlassButton1.ClassName; { AdvGlassButton1: TAdvGlassButton; }
    AdvGlassButton3.ClassName; { AdvGlassButton3: TAdvGlassButton; }
    bt_pesq_grupo.ClassName; { bt_pesq_grupo: TAdvGlassButton; }
    cliques.ClassName; { cliques: TActionList; }
    PopupMenu1.ClassName; { PopupMenu1: TPopupMenu; }
    E1.ClassName; { E1: TMenuItem; }
    cxStyleRepository1.ClassName; { cxStyleRepository1: TcxStyleRepository; }
    cxStyle1.ClassName; { cxStyle1: TcxStyle; }
    cxStyleRepository2.ClassName; { cxStyleRepository2: TcxStyleRepository; }
    cxStyle2.ClassName; { cxStyle2: TcxStyle; }
  end;

{ dmInventarios: TdmInventarios }
  with TdmInventarios(nil) do { uuDMInventarios.pas }
  begin
    qryHistoricosInventarios.ClassName; { qryHistoricosInventarios: TFDQuery; }
    dsQryHistoricosInventario.ClassName; { dsQryHistoricosInventario: TDataSource; }
    tbItensInventarioTemp.ClassName; { tbItensInventarioTemp: TFDMemTable; }
    tbItensInventarioTempsel.ClassName; { tbItensInventarioTempsel: TBooleanField; }
    tbItensInventarioTempCOD_PRODUTO.ClassName; { tbItensInventarioTempCOD_PRODUTO: TStringField; }
    tbItensInventarioTempDESCRICAO.ClassName; { tbItensInventarioTempDESCRICAO: TStringField; }
    tbItensInventarioTempQTDE_APURADA.ClassName; { tbItensInventarioTempQTDE_APURADA: TBCDField; }
    tbItensInventarioTempAJUSTE.ClassName; { tbItensInventarioTempAJUSTE: TBCDField; }
    tbItensInventarioTempCOD_UNIDADE.ClassName; { tbItensInventarioTempCOD_UNIDADE: TStringField; }
    tbItensInventarioTempDESC_UNIDADE.ClassName; { tbItensInventarioTempDESC_UNIDADE: TStringField; }
    tbItensInventarioTempCUSTO.ClassName; { tbItensInventarioTempCUSTO: TCurrencyField; }
    tbItensInventarioTempTOTAL_AJUSTE.ClassName; { tbItensInventarioTempTOTAL_AJUSTE: TCurrencyField; }
    tbItensInventarioTempQTDE_SISTEMA.ClassName; { tbItensInventarioTempQTDE_SISTEMA: TBCDField; }
    tbItensInventarioTempTOTAL_ESTOQUE.ClassName; { tbItensInventarioTempTOTAL_ESTOQUE: TCurrencyField; }
    qryCsProdutos.ClassName; { qryCsProdutos: TFDQuery; }
    qryCsProdutosCOD_PRODUTO.ClassName; { qryCsProdutosCOD_PRODUTO: TStringField; }
    qryCsProdutosDESCRICAO.ClassName; { qryCsProdutosDESCRICAO: TStringField; }
    qryCsProdutosESTOQUE_ATUAL.ClassName; { qryCsProdutosESTOQUE_ATUAL: TFMTBCDField; }
    qryCsProdutosVALOR_CUSTO.ClassName; { qryCsProdutosVALOR_CUSTO: TBCDField; }
    qryCsProdutosVALOR_ESTOQUE.ClassName; { qryCsProdutosVALOR_ESTOQUE: TFMTBCDField; }
    qryCsProdutosCOD_UNIDADE.ClassName; { qryCsProdutosCOD_UNIDADE: TStringField; }
    qryCsProdutosDESCRICAO_UNIDADE.ClassName; { qryCsProdutosDESCRICAO_UNIDADE: TStringField; }
    qryCsProdutosGRUPO.ClassName; { qryCsProdutosGRUPO: TStringField; }
    dsItensIventario.ClassName; { dsItensIventario: TDataSource; }
    dsQryCsProdutos.ClassName; { dsQryCsProdutos: TDataSource; }
    qryInventarios.ClassName; { qryInventarios: TFDQuery; }
    qryInventariosCODIGO.ClassName; { qryInventariosCODIGO: TLargeintField; }
    qryInventariosDATA_INVENTARIO.ClassName; { qryInventariosDATA_INVENTARIO: TDateField; }
    qryInventariosDATA_SISTEMA.ClassName; { qryInventariosDATA_SISTEMA: TDateField; }
    qryInventariosCOD_HISTORICO.ClassName; { qryInventariosCOD_HISTORICO: TIntegerField; }
    qryInventariosCOD_USUARIO.ClassName; { qryInventariosCOD_USUARIO: TStringField; }
    qryInventariosNOME_USUARIO.ClassName; { qryInventariosNOME_USUARIO: TStringField; }
    qryInventariosTOTAL_PERDAS.ClassName; { qryInventariosTOTAL_PERDAS: TBCDField; }
    qryInventariosTOTAL_INVENTARIO.ClassName; { qryInventariosTOTAL_INVENTARIO: TBCDField; }
    qryInventariosCOD_EMPRESA.ClassName; { qryInventariosCOD_EMPRESA: TIntegerField; }
    qryInventariosOBS.ClassName; { qryInventariosOBS: TStringField; }
    qryInventariosDATA_HORA_SO.ClassName; { qryInventariosDATA_HORA_SO: TSQLTimeStampField; }
    qryInventariosTOTAL_SOBRAS.ClassName; { qryInventariosTOTAL_SOBRAS: TBCDField; }
    qryItensInventario.ClassName; { qryItensInventario: TFDQuery; }
    qryItensInventarioCODIGO.ClassName; { qryItensInventarioCODIGO: TLargeintField; }
    qryItensInventarioCOD_INVENTARIO.ClassName; { qryItensInventarioCOD_INVENTARIO: TLargeintField; }
    qryItensInventarioCOD_PRODUTO.ClassName; { qryItensInventarioCOD_PRODUTO: TStringField; }
    qryItensInventarioESTOQUE_SISTEMA.ClassName; { qryItensInventarioESTOQUE_SISTEMA: TFMTBCDField; }
    qryItensInventarioESTOQUE_APURADO.ClassName; { qryItensInventarioESTOQUE_APURADO: TFMTBCDField; }
    qryItensInventarioCOD_UNIDADE.ClassName; { qryItensInventarioCOD_UNIDADE: TStringField; }
    qryItensInventarioCUSTO.ClassName; { qryItensInventarioCUSTO: TBCDField; }
    qryItensInventarioAJUSTE.ClassName; { qryItensInventarioAJUSTE: TBCDField; }
    qryItensInventarioTOTAL_INVENTARIO.ClassName; { qryItensInventarioTOTAL_INVENTARIO: TBCDField; }
    qryCsProdutosPorGrupo.ClassName; { qryCsProdutosPorGrupo: TFDQuery; }
    qryCsProdutosPorGrupoCOD_PRODUTO.ClassName; { qryCsProdutosPorGrupoCOD_PRODUTO: TStringField; }
    qryCsProdutosPorGrupoDESCRICAO.ClassName; { qryCsProdutosPorGrupoDESCRICAO: TStringField; }
    qryCsProdutosPorGrupoESTOQUE_ATUAL.ClassName; { qryCsProdutosPorGrupoESTOQUE_ATUAL: TFMTBCDField; }
    qryCsProdutosPorGrupoVALOR_CUSTO.ClassName; { qryCsProdutosPorGrupoVALOR_CUSTO: TBCDField; }
    qryCsProdutosPorGrupoVALOR_ESTOQUE.ClassName; { qryCsProdutosPorGrupoVALOR_ESTOQUE: TFMTBCDField; }
    qryCsProdutosPorGrupoCOD_UNIDADE.ClassName; { qryCsProdutosPorGrupoCOD_UNIDADE: TStringField; }
    qryCsProdutosPorGrupoDESCRICAO_UNIDADE.ClassName; { qryCsProdutosPorGrupoDESCRICAO_UNIDADE: TStringField; }
    qryCsProdutosPorGrupoGRUPO.ClassName; { qryCsProdutosPorGrupoGRUPO: TStringField; }
    qryHistoricosBaixaEstoque.ClassName; { qryHistoricosBaixaEstoque: TFDQuery; }
    qryHistoricosBaixaEstoqueCOD_TIPO.ClassName; { qryHistoricosBaixaEstoqueCOD_TIPO: TStringField; }
    qryHistoricosBaixaEstoqueDESCRICAO.ClassName; { qryHistoricosBaixaEstoqueDESCRICAO: TStringField; }
    dsQryHistoricosBaixaEstoque.ClassName; { dsQryHistoricosBaixaEstoque: TDataSource; }
    qryUnidadesMedidaProduto.ClassName; { qryUnidadesMedidaProduto: TFDQuery; }
    qryUnidadesMedidaProdutoCOD_UNIDADE.ClassName; { qryUnidadesMedidaProdutoCOD_UNIDADE: TStringField; }
    qryUnidadesMedidaProdutoDESCRICAO.ClassName; { qryUnidadesMedidaProdutoDESCRICAO: TStringField; }
    qryUnidadesMedidaProdutoSIGLA.ClassName; { qryUnidadesMedidaProdutoSIGLA: TStringField; }
    qryUnidadesMedidaProdutoPARAMETRO.ClassName; { qryUnidadesMedidaProdutoPARAMETRO: TBCDField; }
    qryUnidadesMedidaProdutoCOD_PADRAO.ClassName; { qryUnidadesMedidaProdutoCOD_PADRAO: TStringField; }
    dsQryUnidadeMedidaProduto.ClassName; { dsQryUnidadeMedidaProduto: TDataSource; }
    dsTbItensBaixaTemp.ClassName; { dsTbItensBaixaTemp: TDataSource; }
    tbItensBaixaTemp.ClassName; { tbItensBaixaTemp: TFDMemTable; }
    tbItensBaixaTempCOD_PRODUTO.ClassName; { tbItensBaixaTempCOD_PRODUTO: TStringField; }
    tbItensBaixaTempDESCRICAO.ClassName; { tbItensBaixaTempDESCRICAO: TStringField; }
    tbItensBaixaTempQTDE_APURADA.ClassName; { tbItensBaixaTempQTDE_APURADA: TBCDField; }
    tbItensBaixaTempTOTAL_ESTOQUE.ClassName; { tbItensBaixaTempTOTAL_ESTOQUE: TCurrencyField; }
    tbItensBaixaTempCOD_UNIDADE_BAIXA.ClassName; { tbItensBaixaTempCOD_UNIDADE_BAIXA: TStringField; }
    tbItensBaixaTempDESC_UNIDADE_BAIXA.ClassName; { tbItensBaixaTempDESC_UNIDADE_BAIXA: TStringField; }
    tbItensBaixaTempCUSTO.ClassName; { tbItensBaixaTempCUSTO: TFloatField; }
    qryItensBaixaEstoque.ClassName; { qryItensBaixaEstoque: TFDQuery; }
    qryItensBaixaEstoqueCOD_BAIXA.ClassName; { qryItensBaixaEstoqueCOD_BAIXA: TStringField; }
    qryItensBaixaEstoqueCOD_TIPO.ClassName; { qryItensBaixaEstoqueCOD_TIPO: TStringField; }
    qryItensBaixaEstoqueCOD_ITEM.ClassName; { qryItensBaixaEstoqueCOD_ITEM: TStringField; }
    qryItensBaixaEstoqueCOD_UNIDADE.ClassName; { qryItensBaixaEstoqueCOD_UNIDADE: TStringField; }
    qryItensBaixaEstoqueQUANTIDADE.ClassName; { qryItensBaixaEstoqueQUANTIDADE: TFMTBCDField; }
    qryItensBaixaEstoqueDATA.ClassName; { qryItensBaixaEstoqueDATA: TDateField; }
    qryItensBaixaEstoqueHORA.ClassName; { qryItensBaixaEstoqueHORA: TTimeField; }
    qryItensBaixaEstoqueOBSERVACOES.ClassName; { qryItensBaixaEstoqueOBSERVACOES: TStringField; }
    qryItensBaixaEstoqueUSUARIO.ClassName; { qryItensBaixaEstoqueUSUARIO: TStringField; }
    qryItensBaixaEstoqueESTOQUE_ANTERIOR.ClassName; { qryItensBaixaEstoqueESTOQUE_ANTERIOR: TBCDField; }
    qryItensBaixaEstoqueESTOQUE_ATUALIZADO.ClassName; { qryItensBaixaEstoqueESTOQUE_ATUALIZADO: TBCDField; }
    qryItensBaixaEstoqueCUSTO_UNITARIO_ITEM.ClassName; { qryItensBaixaEstoqueCUSTO_UNITARIO_ITEM: TBCDField; }
    qryItensBaixaEstoqueID.ClassName; { qryItensBaixaEstoqueID: TLargeintField; }
    qryItensBaixaEstoqueDATA_SO.ClassName; { qryItensBaixaEstoqueDATA_SO: TSQLTimeStampField; }
    qryItensBaixaEstoqueCOD_ORIGEM.ClassName; { qryItensBaixaEstoqueCOD_ORIGEM: TSmallintField; }
    qryItensBaixaEstoqueTIPO_MOVIMENTACAO.ClassName; { qryItensBaixaEstoqueTIPO_MOVIMENTACAO: TSmallintField; }
    qryItensBaixaEstoqueID_PRODUCAO.ClassName; { qryItensBaixaEstoqueID_PRODUCAO: TLargeintField; }
  end;

{ frmControleInventarios: TfrmControleInventarios }
  with TfrmControleInventarios(nil) do { uuControleInventarios.pas }
  begin
    SpeedButton1.ClassName; { SpeedButton1: TSpeedButton; }
    Edit2.ClassName; { Edit2: TEdit; }
    frmCorpo.ClassName; { frmCorpo: TPanel; }
    Label4.ClassName; { Label4: TLabel; }
    JvDBGrid1.ClassName; { JvDBGrid1: TJvDBGrid; }
    frmTopo.ClassName; { frmTopo: TPanel; }
    Label8.ClassName; { Label8: TLabel; }
    Label15.ClassName; { Label15: TLabel; }
    cbHistoricoInventario.ClassName; { cbHistoricoInventario: TcxLookupComboBox; }
    RadioGroup1.ClassName; { RadioGroup1: TRadioGroup; }
    RadioGroup2.ClassName; { RadioGroup2: TRadioGroup; }
    Panel6.ClassName; { Panel6: TPanel; }
    Label13.ClassName; { Label13: TLabel; }
    ed_desc_item.ClassName; { ed_desc_item: TEdit; }
    Panel2.ClassName; { Panel2: TPanel; }
    Label2.ClassName; { Label2: TLabel; }
    Label3.ClassName; { Label3: TLabel; }
    edDataInicial.ClassName; { edDataInicial: TAdvDateTimePicker; }
    edDataFinal.ClassName; { edDataFinal: TAdvDateTimePicker; }
    Panel4.ClassName; { Panel4: TPanel; }
    bt_pesq_item_estoque_cod.ClassName; { bt_pesq_item_estoque_cod: TSpeedButton; }
    Label5.ClassName; { Label5: TLabel; }
    ed_cod_item.ClassName; { ed_cod_item: TEdit; }
    RadioGroup3.ClassName; { RadioGroup3: TRadioGroup; }
    Panel5.ClassName; { Panel5: TPanel; }
    bt_pesq_grupo.ClassName; { bt_pesq_grupo: TSpeedButton; }
    Label6.ClassName; { Label6: TLabel; }
    ed_cod_grupo.ClassName; { ed_cod_grupo: TEdit; }
    Panel7.ClassName; { Panel7: TPanel; }
    Label12.ClassName; { Label12: TLabel; }
    ed_desc_grupo.ClassName; { ed_desc_grupo: TEdit; }
    btPequisaInventarios.ClassName; { btPequisaInventarios: TAdvGlassButton; }
    Panel1.ClassName; { Panel1: TPanel; }
    Label1.ClassName; { Label1: TLabel; }
    Label14.ClassName; { Label14: TLabel; }
    Panel3.ClassName; { Panel3: TPanel; }
    btImprimirInventario.ClassName; { btImprimirInventario: TAdvGlassButton; }
    AdvGlassButton3.ClassName; { AdvGlassButton3: TAdvGlassButton; }
    AdvGlassButton4.ClassName; { AdvGlassButton4: TAdvGlassButton; }
    Panel8.ClassName; { Panel8: TPanel; }
    Label7.ClassName; { Label7: TLabel; }
    lbTotalSobras.ClassName; { lbTotalSobras: TLabel; }
    Panel9.ClassName; { Panel9: TPanel; }
    Label16.ClassName; { Label16: TLabel; }
    lbTotalFaltas.ClassName; { lbTotalFaltas: TLabel; }
    Panel10.ClassName; { Panel10: TPanel; }
    Label9.ClassName; { Label9: TLabel; }
    lbTotalInventarios.ClassName; { lbTotalInventarios: TLabel; }
    cliques.ClassName; { cliques: TActionList; }
    actlBusca.ClassName; { actlBusca: TJvControlActionList; }
    ActionList1.ClassName; { ActionList1: TActionList; }
    ControlAction1.ClassName; { ControlAction1: TControlAction; }
    Action1.ClassName; { Action1: TAction; }
    PopupMenu1.ClassName; { PopupMenu1: TPopupMenu; }
    I1.ClassName; { I1: TMenuItem; }
    P1.ClassName; { P1: TMenuItem; }
  end;

{ dmControleInventarios: TdmControleInventarios }
  with TdmControleInventarios(nil) do { uuDmControleInventarios.pas }
  begin
    qryHistoricosInventarios.ClassName; { qryHistoricosInventarios: TFDQuery; }
    qryHistoricosInventariosCODIGO.ClassName; { qryHistoricosInventariosCODIGO: TStringField; }
    qryHistoricosInventariosDESCRICAO.ClassName; { qryHistoricosInventariosDESCRICAO: TStringField; }
    dsQryHistoricosInventario.ClassName; { dsQryHistoricosInventario: TDataSource; }
    QryConsultaInventario.ClassName; { QryConsultaInventario: TFDQuery; }
    QryConsultaInventarioCODIGO.ClassName; { QryConsultaInventarioCODIGO: TLargeintField; }
    QryConsultaInventarioDATA_INVENTARIO.ClassName; { QryConsultaInventarioDATA_INVENTARIO: TDateField; }
    QryConsultaInventarioHORA.ClassName; { QryConsultaInventarioHORA: TTimeField; }
    QryConsultaInventarioCOD_HISTORICO.ClassName; { QryConsultaInventarioCOD_HISTORICO: TIntegerField; }
    QryConsultaInventarioDESCRICAO_HISTORICO.ClassName; { QryConsultaInventarioDESCRICAO_HISTORICO: TStringField; }
    QryConsultaInventarioNOME_USUARIO.ClassName; { QryConsultaInventarioNOME_USUARIO: TStringField; }
    QryConsultaInventarioTOTAL_SOBRAS.ClassName; { QryConsultaInventarioTOTAL_SOBRAS: TBCDField; }
    QryConsultaInventarioTOTAL_PERDAS.ClassName; { QryConsultaInventarioTOTAL_PERDAS: TBCDField; }
    QryConsultaInventarioTOTAL_INVENTARIO.ClassName; { QryConsultaInventarioTOTAL_INVENTARIO: TBCDField; }
    QryConsultaInventarioOBS.ClassName; { QryConsultaInventarioOBS: TStringField; }
    dsConsultaInventarios.ClassName; { dsConsultaInventarios: TDataSource; }
    qryHistoricosBaixaEstoque.ClassName; { qryHistoricosBaixaEstoque: TFDQuery; }
    qryHistoricosBaixaEstoqueCOD_TIPO.ClassName; { qryHistoricosBaixaEstoqueCOD_TIPO: TStringField; }
    qryHistoricosBaixaEstoqueDESCRICAO.ClassName; { qryHistoricosBaixaEstoqueDESCRICAO: TStringField; }
    dsQryHistoricosBaixaEstoque.ClassName; { dsQryHistoricosBaixaEstoque: TDataSource; }
  end;

{ frmExtratoDiversasMesas: TfrmExtratoDiversasMesas }
  with TfrmExtratoDiversasMesas(nil) do { uuExtratoDiversasMesas.pas }
  begin
    Panel1.ClassName; { Panel1: TPanel; }
    Label2.ClassName; { Label2: TLabel; }
    Panel2.ClassName; { Panel2: TPanel; }
    Label1.ClassName; { Label1: TLabel; }
    Panel4.ClassName; { Panel4: TPanel; }
    Label3.ClassName; { Label3: TLabel; }
    ltMesas.ClassName; { ltMesas: TcxListBox; }
    edNumeroMesa.ClassName; { edNumeroMesa: TEdit; }
    ckbTodasAsMesas.ClassName; { ckbTodasAsMesas: TcxCheckBox; }
    Panel3.ClassName; { Panel3: TPanel; }
    btImprimir.ClassName; { btImprimir: TAdvGlassButton; }
    AdvGlassButton3.ClassName; { AdvGlassButton3: TAdvGlassButton; }
    cliques.ClassName; { cliques: TActionList; }
  end;

{ frmGerarArquivoCargaBalanca: TfrmGerarArquivoCargaBalanca }
  with TfrmGerarArquivoCargaBalanca(nil) do { uuGeraArquivoBalanca.pas }
  begin
    botao_pesquisa.ClassName; { botao_pesquisa: TSpeedButton; }
    Edit1.ClassName; { Edit1: TEdit; }
    Panel1.ClassName; { Panel1: TPanel; }
    Label1.ClassName; { Label1: TLabel; }
    Panel2.ClassName; { Panel2: TPanel; }
    Label2.ClassName; { Label2: TLabel; }
    Label3.ClassName; { Label3: TLabel; }
    cbxModelo.ClassName; { cbxModelo: TComboBox; }
    edtDiretorio.ClassName; { edtDiretorio: TEdit; }
    BitBtn1.ClassName; { BitBtn1: TBitBtn; }
    cxProgressBar1.ClassName; { cxProgressBar1: TcxProgressBar; }
    Panel3.ClassName; { Panel3: TPanel; }
    btImprimir.ClassName; { btImprimir: TAdvGlassButton; }
    AdvGlassButton1.ClassName; { AdvGlassButton1: TAdvGlassButton; }
    ACBrCargaBal1.ClassName; { ACBrCargaBal1: TACBrCargaBal; }
  end;

{ dmFrenteCaixa: TdmFrenteCaixa }
  with TdmFrenteCaixa(nil) do { uuDMFrenteCaixa.pas }
  begin
    qryGruposTouch.ClassName; { qryGruposTouch: TIBQuery; }
    tsGruposTouch.ClassName; { tsGruposTouch: TIBTransaction; }
    qryProdutosTouch.ClassName; { qryProdutosTouch: TIBQuery; }
    qryProdutosTouchCOD_PRODUTO.ClassName; { qryProdutosTouchCOD_PRODUTO: TIBStringField; }
    qryProdutosTouchCOD_BARRAS.ClassName; { qryProdutosTouchCOD_BARRAS: TIBStringField; }
    qryProdutosTouchCOD_GRUPO_TOUCH.ClassName; { qryProdutosTouchCOD_GRUPO_TOUCH: TIBStringField; }
    qryProdutosTouchDESCRICAO.ClassName; { qryProdutosTouchDESCRICAO: TIBStringField; }
    qryProdutosTouchVALOR_UNITARIO.ClassName; { qryProdutosTouchVALOR_UNITARIO: TIBBCDField; }
    dsGruposTouch.ClassName; { dsGruposTouch: TDataSource; }
    dsProdutosTouch.ClassName; { dsProdutosTouch: TDataSource; }
  end;

{ dmExpedicaoDelivery: TdmExpedicaoDelivery }
  with TdmExpedicaoDelivery(nil) do { uuDMExpedicaoDelivery.pas }
  begin
    dsTbEntregadores.ClassName; { dsTbEntregadores: TDataSource; }
    dsQryExpedicaoDElivery.ClassName; { dsQryExpedicaoDElivery: TDataSource; }
    tbExpedicaoDelivery.ClassName; { tbExpedicaoDelivery: TFDMemTable; }
    tbPolling.ClassName; { tbPolling: TFDMemTable; }
    dsPolling.ClassName; { dsPolling: TDataSource; }
    FDGUIxWaitCursor1.ClassName; { FDGUIxWaitCursor1: TFDGUIxWaitCursor; }
    tbParametrosIntegracao.ClassName; { tbParametrosIntegracao: TFDMemTable; }
    tbCsClientesDelivery.ClassName; { tbCsClientesDelivery: TFDMemTable; }
    dsCsClientesDelivery.ClassName; { dsCsClientesDelivery: TDataSource; }
    tbEntregadores.ClassName; { tbEntregadores: TFDMemTable; }
  end;

{ dmFrenteCaixaRestaurante: TdmFrenteCaixaRestaurante }
  with TdmFrenteCaixaRestaurante(nil) do { uuDmFrenteCaixaRestaurante.pas }
  begin
  end;

{ frmRelRepasseEntregadores: TfrmRelRepasseEntregadores }
  with TfrmRelRepasseEntregadores(nil) do { uuFrmRelRepasseEntregadores.pas }
  begin
    botao_pesquisa.ClassName; { botao_pesquisa: TSpeedButton; }
    RadioGroup1.ClassName; { RadioGroup1: TRadioGroup; }
    Edit1.ClassName; { Edit1: TEdit; }
    Panel1.ClassName; { Panel1: TPanel; }
    Label2.ClassName; { Label2: TLabel; }
    Label1.ClassName; { Label1: TLabel; }
    ed_data_final.ClassName; { ed_data_final: TDateEdit; }
    ed_data_inicial.ClassName; { ed_data_inicial: TDateEdit; }
    btImprimirInventario.ClassName; { btImprimirInventario: TAdvGlassButton; }
    AdvGlassButton1.ClassName; { AdvGlassButton1: TAdvGlassButton; }
    Panel2.ClassName; { Panel2: TPanel; }
    Label3.ClassName; { Label3: TLabel; }
    cliques.ClassName; { cliques: TActionList; }
  end;

{ frmParametrosSistema: TfrmParametrosSistema }
  with TfrmParametrosSistema(nil) do { uuParametrosSistema.pas }
  begin
    botao_pesquisa.ClassName; { botao_pesquisa: TSpeedButton; }
    Edit1.ClassName; { Edit1: TEdit; }
    Panel1.ClassName; { Panel1: TPanel; }
    Label1.ClassName; { Label1: TLabel; }
    Image1.ClassName; { Image1: TImage; }
    JvTabBar1.ClassName; { JvTabBar1: TJvTabBar; }
    Panel2.ClassName; { Panel2: TPanel; }
    AdvGlassButton1.ClassName; { AdvGlassButton1: TAdvGlassButton; }
    btImprimir.ClassName; { btImprimir: TAdvGlassButton; }
    pgPrincipal.ClassName; { pgPrincipal: TJvPageList; }
    pgDadosEmpresa.ClassName; { pgDadosEmpresa: TJvStandardPage; }
    Label9.ClassName; { Label9: TLabel; }
    Label10.ClassName; { Label10: TLabel; }
    Label11.ClassName; { Label11: TLabel; }
    Label12.ClassName; { Label12: TLabel; }
    Label13.ClassName; { Label13: TLabel; }
    Label14.ClassName; { Label14: TLabel; }
    Label15.ClassName; { Label15: TLabel; }
    Label16.ClassName; { Label16: TLabel; }
    Label17.ClassName; { Label17: TLabel; }
    Label18.ClassName; { Label18: TLabel; }
    Label19.ClassName; { Label19: TLabel; }
    Label20.ClassName; { Label20: TLabel; }
    Label21.ClassName; { Label21: TLabel; }
    Label22.ClassName; { Label22: TLabel; }
    edRazoSocial.ClassName; { edRazoSocial: TEdit; }
    edNomeFantasia.ClassName; { edNomeFantasia: TEdit; }
    edCNPJ.ClassName; { edCNPJ: TMaskEdit; }
    edIE.ClassName; { edIE: TMaskEdit; }
    edIM.ClassName; { edIM: TMaskEdit; }
    edCEP.ClassName; { edCEP: TMaskEdit; }
    cbCidade.ClassName; { cbCidade: TcxLookupComboBox; }
    edEstado.ClassName; { edEstado: TMaskEdit; }
    edLogradouro.ClassName; { edLogradouro: TEdit; }
    edNumero.ClassName; { edNumero: TMaskEdit; }
    edBairro.ClassName; { edBairro: TEdit; }
    edComplemento.ClassName; { edComplemento: TEdit; }
    edTelefone.ClassName; { edTelefone: TMaskEdit; }
    edNomeResponsavel.ClassName; { edNomeResponsavel: TEdit; }
    pgCertificado.ClassName; { pgCertificado: TJvStandardPage; }
    Label2.ClassName; { Label2: TLabel; }
    Label3.ClassName; { Label3: TLabel; }
    PngSpeedButton1.ClassName; { PngSpeedButton1: TPngSpeedButton; }
    Label5.ClassName; { Label5: TLabel; }
    edSenhaCertificado.ClassName; { edSenhaCertificado: TEdit; }
    edLocalArquivoCertificado.ClassName; { edLocalArquivoCertificado: TEdit; }
    edNumeroSerieCertificado.ClassName; { edNumeroSerieCertificado: TEdit; }
    pgNFE.ClassName; { pgNFE: TJvStandardPage; }
    Label4.ClassName; { Label4: TLabel; }
    Label23.ClassName; { Label23: TLabel; }
    Label24.ClassName; { Label24: TLabel; }
    cxcx.ClassName; { cxcx: TLabel; }
    Label6.ClassName; { Label6: TLabel; }
    Label7.ClassName; { Label7: TLabel; }
    Label8.ClassName; { Label8: TLabel; }
    edSerieNFE.ClassName; { edSerieNFE: TMaskEdit; }
    edUltimaNFE.ClassName; { edUltimaNFE: TSpinEdit; }
    edCartaCorrecaoNFE.ClassName; { edCartaCorrecaoNFE: TSpinEdit; }
    rdgTipoEnvioNFE.ClassName; { rdgTipoEnvioNFE: TRadioGroup; }
    DBGrid1.ClassName; { DBGrid1: TDBGrid; }
    RadioGroup1.ClassName; { RadioGroup1: TRadioGroup; }
    edCSCProducaoNFCE.ClassName; { edCSCProducaoNFCE: TEdit; }
    edIDProducao.ClassName; { edIDProducao: TEdit; }
    edCSCHomologacaoNFCE.ClassName; { edCSCHomologacaoNFCE: TEdit; }
    edIDHomologacaoNFCE.ClassName; { edIDHomologacaoNFCE: TEdit; }
    pgDataDoSistema.ClassName; { pgDataDoSistema: TJvStandardPage; }
    Label25.ClassName; { Label25: TLabel; }
    edDataDoSistema.ClassName; { edDataDoSistema: TAdvDateTimePicker; }
    rdRegimeEmpresa.ClassName; { rdRegimeEmpresa: TRadioGroup; }
    cliques.ClassName; { cliques: TActionList; }
    OpenDialog1.ClassName; { OpenDialog1: TOpenDialog; }
  end;

{ frmControleBaixas: TfrmControleBaixas }
  with TfrmControleBaixas(nil) do { uuControleBaixas.pas }
  begin
    SpeedButton1.ClassName; { SpeedButton1: TSpeedButton; }
    Edit2.ClassName; { Edit2: TEdit; }
    frmCorpo.ClassName; { frmCorpo: TPanel; }
    Label4.ClassName; { Label4: TLabel; }
    JvDBGrid1.ClassName; { JvDBGrid1: TJvDBGrid; }
    frmTopo.ClassName; { frmTopo: TPanel; }
    Label8.ClassName; { Label8: TLabel; }
    Label15.ClassName; { Label15: TLabel; }
    cbHistoricoBaixaEstoque.ClassName; { cbHistoricoBaixaEstoque: TcxLookupComboBox; }
    RadioGroup1.ClassName; { RadioGroup1: TRadioGroup; }
    RadioGroup2.ClassName; { RadioGroup2: TRadioGroup; }
    Panel6.ClassName; { Panel6: TPanel; }
    Label13.ClassName; { Label13: TLabel; }
    ed_desc_item.ClassName; { ed_desc_item: TEdit; }
    Panel2.ClassName; { Panel2: TPanel; }
    Label2.ClassName; { Label2: TLabel; }
    Label3.ClassName; { Label3: TLabel; }
    edDataInicial.ClassName; { edDataInicial: TAdvDateTimePicker; }
    edDataFinal.ClassName; { edDataFinal: TAdvDateTimePicker; }
    Panel4.ClassName; { Panel4: TPanel; }
    bt_pesq_item_estoque_cod.ClassName; { bt_pesq_item_estoque_cod: TSpeedButton; }
    Label5.ClassName; { Label5: TLabel; }
    ed_cod_item.ClassName; { ed_cod_item: TEdit; }
    RadioGroup3.ClassName; { RadioGroup3: TRadioGroup; }
    Panel5.ClassName; { Panel5: TPanel; }
    bt_pesq_grupo.ClassName; { bt_pesq_grupo: TSpeedButton; }
    Label6.ClassName; { Label6: TLabel; }
    ed_cod_grupo.ClassName; { ed_cod_grupo: TEdit; }
    Panel7.ClassName; { Panel7: TPanel; }
    Label12.ClassName; { Label12: TLabel; }
    ed_desc_grupo.ClassName; { ed_desc_grupo: TEdit; }
    btPequisaInventarios.ClassName; { btPequisaInventarios: TAdvGlassButton; }
    Panel1.ClassName; { Panel1: TPanel; }
    Label1.ClassName; { Label1: TLabel; }
    Label14.ClassName; { Label14: TLabel; }
    Panel3.ClassName; { Panel3: TPanel; }
    btImprimirInventario.ClassName; { btImprimirInventario: TAdvGlassButton; }
    AdvGlassButton3.ClassName; { AdvGlassButton3: TAdvGlassButton; }
    AdvGlassButton4.ClassName; { AdvGlassButton4: TAdvGlassButton; }
    Panel10.ClassName; { Panel10: TPanel; }
    Label9.ClassName; { Label9: TLabel; }
    lbTotalInventarios.ClassName; { lbTotalInventarios: TLabel; }
    cliques.ClassName; { cliques: TActionList; }
    ActionList1.ClassName; { ActionList1: TActionList; }
    ControlAction1.ClassName; { ControlAction1: TControlAction; }
    Action1.ClassName; { Action1: TAction; }
    PopupMenu1.ClassName; { PopupMenu1: TPopupMenu; }
    I1.ClassName; { I1: TMenuItem; }
  end;

{ frmBaixasManuais: TfrmBaixasManuais }
  with TfrmBaixasManuais(nil) do { uuBaixasManuais.pas }
  begin
    botao_pesquisa.ClassName; { botao_pesquisa: TSpeedButton; }
    Edit1.ClassName; { Edit1: TEdit; }
    frmCorpo.ClassName; { frmCorpo: TPanel; }
    Label4.ClassName; { Label4: TLabel; }
    Label2.ClassName; { Label2: TLabel; }
    Label12.ClassName; { Label12: TLabel; }
    bt_pesq_item_estoque_cod.ClassName; { bt_pesq_item_estoque_cod: TSpeedButton; }
    Label5.ClassName; { Label5: TLabel; }
    Label6.ClassName; { Label6: TLabel; }
    Label7.ClassName; { Label7: TLabel; }
    AdvGlassButton2.ClassName; { AdvGlassButton2: TAdvGlassButton; }
    edEstoqueApurado.ClassName; { edEstoqueApurado: TJvValidateEdit; }
    ed_cod_item.ClassName; { ed_cod_item: TEdit; }
    Panel2.ClassName; { Panel2: TPanel; }
    ed_desc_item.ClassName; { ed_desc_item: TEdit; }
    gdProdutosBaixa.ClassName; { gdProdutosBaixa: TcxGrid; }
    gdProdutosBaixaDBTableView1.ClassName; { gdProdutosBaixaDBTableView1: TcxGridDBTableView; }
    gdProdutosBaixaDBTableView1COD_PRODUTO.ClassName; { gdProdutosBaixaDBTableView1COD_PRODUTO: TcxGridDBColumn; }
    gdProdutosBaixaDBTableView1DESCRICAO.ClassName; { gdProdutosBaixaDBTableView1DESCRICAO: TcxGridDBColumn; }
    gdProdutosBaixaDBTableView1QTDE_APURADA.ClassName; { gdProdutosBaixaDBTableView1QTDE_APURADA: TcxGridDBColumn; }
    gdProdutosBaixaDBTableView1DescUnBaixa.ClassName; { gdProdutosBaixaDBTableView1DescUnBaixa: TcxGridDBColumn; }
    gdProdutosBaixaDBTableView1CUSTO.ClassName; { gdProdutosBaixaDBTableView1CUSTO: TcxGridDBColumn; }
    gdProdutosBaixaDBTableView1TOTAL_ESTOQUE.ClassName; { gdProdutosBaixaDBTableView1TOTAL_ESTOQUE: TcxGridDBColumn; }
    gdProdutosBaixaLevel1.ClassName; { gdProdutosBaixaLevel1: TcxGridLevel; }
    cbUnidadeMedidaBaixa.ClassName; { cbUnidadeMedidaBaixa: TcxLookupComboBox; }
    frmTopo.ClassName; { frmTopo: TPanel; }
    Label8.ClassName; { Label8: TLabel; }
    Label10.ClassName; { Label10: TLabel; }
    Label3.ClassName; { Label3: TLabel; }
    edDataBaixa.ClassName; { edDataBaixa: TAdvDateTimePicker; }
    cbHistoricoBaixaEstoque.ClassName; { cbHistoricoBaixaEstoque: TcxLookupComboBox; }
    memoObservacoes.ClassName; { memoObservacoes: TMemo; }
    Panel1.ClassName; { Panel1: TPanel; }
    Label1.ClassName; { Label1: TLabel; }
    Panel3.ClassName; { Panel3: TPanel; }
    AdvGlassButton1.ClassName; { AdvGlassButton1: TAdvGlassButton; }
    AdvGlassButton3.ClassName; { AdvGlassButton3: TAdvGlassButton; }
    cliques.ClassName; { cliques: TActionList; }
    PopupMenu1.ClassName; { PopupMenu1: TPopupMenu; }
    E1.ClassName; { E1: TMenuItem; }
    cxStyleRepository1.ClassName; { cxStyleRepository1: TcxStyleRepository; }
    cxStyle1.ClassName; { cxStyle1: TcxStyle; }
    cxStyleRepository2.ClassName; { cxStyleRepository2: TcxStyleRepository; }
    cxStyle2.ClassName; { cxStyle2: TcxStyle; }
  end;

{ frmRelSangrias: TfrmRelSangrias }
  with TfrmRelSangrias(nil) do { uuRelSangrias.pas }
  begin
    Panel1.ClassName; { Panel1: TPanel; }
    Label1.ClassName; { Label1: TLabel; }
    Panel2.ClassName; { Panel2: TPanel; }
    Label4.ClassName; { Label4: TLabel; }
    Panel3.ClassName; { Panel3: TPanel; }
    Label2.ClassName; { Label2: TLabel; }
    CheckBox1.ClassName; { CheckBox1: TCheckBox; }
    edDataInicial.ClassName; { edDataInicial: TDateEdit; }
    Panel4.ClassName; { Panel4: TPanel; }
    Label3.ClassName; { Label3: TLabel; }
    CheckBox2.ClassName; { CheckBox2: TCheckBox; }
    edDataFinal.ClassName; { edDataFinal: TDateEdit; }
    AdvGlassButton1.ClassName; { AdvGlassButton1: TAdvGlassButton; }
    btImprimirInventario.ClassName; { btImprimirInventario: TAdvGlassButton; }
    cbTipoSangria.ClassName; { cbTipoSangria: TcxLookupComboBox; }
    rdTipoAgrupamento.ClassName; { rdTipoAgrupamento: TRadioGroup; }
    cliques.ClassName; { cliques: TActionList; }
  end;

{ frmErrosInutilizacao: TfrmErrosInutilizacao }
  with TfrmErrosInutilizacao(nil) do { uuFrmErrosInutilizacao.pas }
  begin
    botao_pesquisa.ClassName; { botao_pesquisa: TSpeedButton; }
    Label1.ClassName; { Label1: TLabel; }
    lbQtdNotasErro.ClassName; { lbQtdNotasErro: TLabel; }
    Edit1.ClassName; { Edit1: TEdit; }
    btSair.ClassName; { btSair: TAdvGlassButton; }
    DBGrid1.ClassName; { DBGrid1: TDBGrid; }
    Panel1.ClassName; { Panel1: TPanel; }
    Label2.ClassName; { Label2: TLabel; }
    Label3.ClassName; { Label3: TLabel; }
    ckb.ClassName; { ckb: TCheckBox; }
    cliques.ClassName; { cliques: TActionList; }
  end;

{ dmRelMovimentacoesEstoque: TdmRelMovimentacoesEstoque }
  with TdmRelMovimentacoesEstoque(nil) do { uuDMRelMovimentacoesEstoque.pas }
  begin
    qryHistoricosMovEstoque.ClassName; { qryHistoricosMovEstoque: TFDQuery; }
    qryHistoricosMovEstoqueCOD_TIPO.ClassName; { qryHistoricosMovEstoqueCOD_TIPO: TStringField; }
    qryHistoricosMovEstoqueDESCRICAO.ClassName; { qryHistoricosMovEstoqueDESCRICAO: TStringField; }
    qryHistoricosMovEstoqueTIPO_MOVIMENTACAO.ClassName; { qryHistoricosMovEstoqueTIPO_MOVIMENTACAO: TStringField; }
    dsqryHistoricosMovEstoque.ClassName; { dsqryHistoricosMovEstoque: TDataSource; }
    qryOrigensMovEstoque.ClassName; { qryOrigensMovEstoque: TFDQuery; }
    qryOrigensMovEstoqueCODIGO.ClassName; { qryOrigensMovEstoqueCODIGO: TIntegerField; }
    qryOrigensMovEstoqueDESCRICAO.ClassName; { qryOrigensMovEstoqueDESCRICAO: TStringField; }
    qryOrigensMovEstoqueTIPO_MOVIMENTACAO.ClassName; { qryOrigensMovEstoqueTIPO_MOVIMENTACAO: TStringField; }
    dsQryOrigensMovEstoque.ClassName; { dsQryOrigensMovEstoque: TDataSource; }
    qryRelMovimentacoes.ClassName; { qryRelMovimentacoes: TFDQuery; }
    dsQryMovimentacoes.ClassName; { dsQryMovimentacoes: TDataSource; }
  end;

{ dmManifestacaoNFE: TdmManifestacaoNFE }
  with TdmManifestacaoNFE(nil) do { uuDmManifestacaoNFE.pas }
  begin
    dsManifestacaoNFE.ClassName; { dsManifestacaoNFE: TDataSource; }
    tbManifestacaoNFE.ClassName; { tbManifestacaoNFE: TFDMemTable; }
    TBExportacao.ClassName; { TBExportacao: TFDMemTable; }
    dtManifestacaoNFE.ClassName; { dtManifestacaoNFE: TfrxDBDataset; }
    rpt.ClassName; { rpt: TfrxReport; }
    Data.ClassName; { Data: TfrxDataPage; }
    Page1.ClassName; { Page1: TfrxReportPage; }
    PageFooter1.ClassName; { PageFooter1: TfrxPageFooter; }
    Memo1.ClassName; { Memo1: TfrxMemoView; }
    ReportTitle1.ClassName; { ReportTitle1: TfrxReportTitle; }
    Memo41.ClassName; { Memo41: TfrxMemoView; }
    Line1.ClassName; { Line1: TfrxLineView; }
    Memo42.ClassName; { Memo42: TfrxMemoView; }
    Memo43.ClassName; { Memo43: TfrxMemoView; }
    Memo44.ClassName; { Memo44: TfrxMemoView; }
    Memo45.ClassName; { Memo45: TfrxMemoView; }
    Memo46.ClassName; { Memo46: TfrxMemoView; }
    GroupHeader2.ClassName; { GroupHeader2: TfrxGroupHeader; }
    Memo5.ClassName; { Memo5: TfrxMemoView; }
    Memo14.ClassName; { Memo14: TfrxMemoView; }
    Memo15.ClassName; { Memo15: TfrxMemoView; }
    Memo16.ClassName; { Memo16: TfrxMemoView; }
    Memo17.ClassName; { Memo17: TfrxMemoView; }
    Memo18.ClassName; { Memo18: TfrxMemoView; }
    MasterData1.ClassName; { MasterData1: TfrxMasterData; }
    Memo2.ClassName; { Memo2: TfrxMemoView; }
    Memo3.ClassName; { Memo3: TfrxMemoView; }
    Memo4.ClassName; { Memo4: TfrxMemoView; }
    Memo7.ClassName; { Memo7: TfrxMemoView; }
    BarCode1.ClassName; { BarCode1: TfrxBarCodeView; }
    GroupFooter1.ClassName; { GroupFooter1: TfrxGroupFooter; }
    Memo6.ClassName; { Memo6: TfrxMemoView; }
    Memo8.ClassName; { Memo8: TfrxMemoView; }
    Memo9.ClassName; { Memo9: TfrxMemoView; }
    ReportSummary1.ClassName; { ReportSummary1: TfrxReportSummary; }
    Memo10.ClassName; { Memo10: TfrxMemoView; }
    Memo11.ClassName; { Memo11: TfrxMemoView; }
    Memo12.ClassName; { Memo12: TfrxMemoView; }
    Memo13.ClassName; { Memo13: TfrxMemoView; }
    frxPDFExport1.ClassName; { frxPDFExport1: TfrxPDFExport; }
    frxDOCXExport1.ClassName; { frxDOCXExport1: TfrxDOCXExport; }
    frxBIFFExport1.ClassName; { frxBIFFExport1: TfrxBIFFExport; }
    frxXMLExport1.ClassName; { frxXMLExport1: TfrxXMLExport; }
    frxXLSExport1.ClassName; { frxXLSExport1: TfrxXLSExport; }
    tbItensEntradaNFE.ClassName; { tbItensEntradaNFE: TFDMemTable; }
    tbItensEntradaNFEordem.ClassName; { tbItensEntradaNFEordem: TIntegerField; }
    tbItensEntradaNFEcodProduto.ClassName; { tbItensEntradaNFEcodProduto: TStringField; }
    tbItensEntradaNFEdescricaoProduto.ClassName; { tbItensEntradaNFEdescricaoProduto: TStringField; }
    tbItensEntradaNFEQuantidade.ClassName; { tbItensEntradaNFEQuantidade: TFMTBCDField; }
    tbItensEntradaNFEPreco.ClassName; { tbItensEntradaNFEPreco: TCurrencyField; }
    tbItensEntradaNFECodUnidade.ClassName; { tbItensEntradaNFECodUnidade: TStringField; }
    tbItensEntradaNFEDescricaoUnidade.ClassName; { tbItensEntradaNFEDescricaoUnidade: TStringField; }
    tbItensEntradaNFESiglaUnidade.ClassName; { tbItensEntradaNFESiglaUnidade: TStringField; }
    tbItensEntradaNFEParametroUnidade.ClassName; { tbItensEntradaNFEParametroUnidade: TBCDField; }
    tbItensEntradaNFECST.ClassName; { tbItensEntradaNFECST: TStringField; }
    tbItensEntradaNFECFOP.ClassName; { tbItensEntradaNFECFOP: TStringField; }
    tbItensEntradaNFEDesconto.ClassName; { tbItensEntradaNFEDesconto: TCurrencyField; }
    tbItensEntradaNFEOutrasDespesas.ClassName; { tbItensEntradaNFEOutrasDespesas: TCurrencyField; }
    tbItensEntradaNFEBaseICMS.ClassName; { tbItensEntradaNFEBaseICMS: TCurrencyField; }
    tbItensEntradaNFEValorICMS.ClassName; { tbItensEntradaNFEValorICMS: TCurrencyField; }
    tbItensEntradaNFEAliquotaICMS.ClassName; { tbItensEntradaNFEAliquotaICMS: TFMTBCDField; }
    tbItensEntradaNFEBaseICMSST.ClassName; { tbItensEntradaNFEBaseICMSST: TCurrencyField; }
    tbItensEntradaNFEValorICMSST.ClassName; { tbItensEntradaNFEValorICMSST: TCurrencyField; }
    tbItensEntradaNFEAliquotaICMSST.ClassName; { tbItensEntradaNFEAliquotaICMSST: TFMTBCDField; }
    tbItensEntradaNFEValorIPI.ClassName; { tbItensEntradaNFEValorIPI: TCurrencyField; }
    tbItensEntradaNFEAliquotaIPI.ClassName; { tbItensEntradaNFEAliquotaIPI: TFMTBCDField; }
    tbItensEntradaNFETotal.ClassName; { tbItensEntradaNFETotal: TCurrencyField; }
    dsItensEntradaNFE.ClassName; { dsItensEntradaNFE: TDataSource; }
  end;

{ frmConfigIntegracoes: TfrmConfigIntegracoes }
  with TfrmConfigIntegracoes(nil) do { uuFrmIntegracoesBairro.pas }
  begin
    botao_pesquisa.ClassName; { botao_pesquisa: TSpeedButton; }
    Edit1.ClassName; { Edit1: TEdit; }
    Panel1.ClassName; { Panel1: TPanel; }
    Label1.ClassName; { Label1: TLabel; }
    AdvOfficeImage1.ClassName; { AdvOfficeImage1: TAdvOfficeImage; }
    Panel2.ClassName; { Panel2: TPanel; }
    AdvOfficeImage2.ClassName; { AdvOfficeImage2: TAdvOfficeImage; }
    pgIntegracoes.ClassName; { pgIntegracoes: TJvPageList; }
    pgParametrosEmpresa.ClassName; { pgParametrosEmpresa: TJvStandardPage; }
    cxGrid3.ClassName; { cxGrid3: TcxGrid; }
    cxGridDBTableView2.ClassName; { cxGridDBTableView2: TcxGridDBTableView; }
    cxGridDBColumn4.ClassName; { cxGridDBColumn4: TcxGridDBColumn; }
    cxGridDBColumn5.ClassName; { cxGridDBColumn5: TcxGridDBColumn; }
    cxGridLevel2.ClassName; { cxGridLevel2: TcxGridLevel; }
    pgBairros.ClassName; { pgBairros: TJvStandardPage; }
    btBairros.ClassName; { btBairros: TPngSpeedButton; }
    Label3.ClassName; { Label3: TLabel; }
    cxGrid1.ClassName; { cxGrid1: TcxGrid; }
    cxGrid1DBTableView1.ClassName; { cxGrid1DBTableView1: TcxGridDBTableView; }
    cxGrid1DBTableView1Column1.ClassName; { cxGrid1DBTableView1Column1: TcxGridDBColumn; }
    cxGrid1DBTableView1Column2.ClassName; { cxGrid1DBTableView1Column2: TcxGridDBColumn; }
    cxGrid1DBTableView1Column3.ClassName; { cxGrid1DBTableView1Column3: TcxGridDBColumn; }
    cxGrid1Level1.ClassName; { cxGrid1Level1: TcxGridLevel; }
    pgFormasDePagamento.ClassName; { pgFormasDePagamento: TJvStandardPage; }
    cxGrid2.ClassName; { cxGrid2: TcxGrid; }
    cxGridDBTableView1.ClassName; { cxGridDBTableView1: TcxGridDBTableView; }
    cxGridDBColumn1.ClassName; { cxGridDBColumn1: TcxGridDBColumn; }
    cxGridDBColumn2.ClassName; { cxGridDBColumn2: TcxGridDBColumn; }
    cxGridDBTableView1Column2.ClassName; { cxGridDBTableView1Column2: TcxGridDBColumn; }
    cxGridDBTableView1Column1.ClassName; { cxGridDBTableView1Column1: TcxGridDBColumn; }
    cxGridLevel1.ClassName; { cxGridLevel1: TcxGridLevel; }
    JvTabBar1.ClassName; { JvTabBar1: TJvTabBar; }
    Panel3.ClassName; { Panel3: TPanel; }
    AdvOfficeImage3.ClassName; { AdvOfficeImage3: TAdvOfficeImage; }
    Panel4.ClassName; { Panel4: TPanel; }
    AdvOfficeImage4.ClassName; { AdvOfficeImage4: TAdvOfficeImage; }
    Label2.ClassName; { Label2: TLabel; }
    lkpEmpresa.ClassName; { lkpEmpresa: TcxLookupComboBox; }
    AdvGlassButton1.ClassName; { AdvGlassButton1: TAdvGlassButton; }
    AdvGlassButton2.ClassName; { AdvGlassButton2: TAdvGlassButton; }
    cliques.ClassName; { cliques: TActionList; }
    actlBusca.ClassName; { actlBusca: TJvControlActionList; }
    cxStyleRepository1.ClassName; { cxStyleRepository1: TcxStyleRepository; }
    cxStyle1.ClassName; { cxStyle1: TcxStyle; }
    cxStyle3.ClassName; { cxStyle3: TcxStyle; }
    cxStyle9.ClassName; { cxStyle9: TcxStyle; }
    cxStyleRepository2.ClassName; { cxStyleRepository2: TcxStyleRepository; }
    cxStyle2.ClassName; { cxStyle2: TcxStyle; }
    cxStyleRepository3.ClassName; { cxStyleRepository3: TcxStyleRepository; }
    cxStyle4.ClassName; { cxStyle4: TcxStyle; }
    cxStyle5.ClassName; { cxStyle5: TcxStyle; }
    cxStyle6.ClassName; { cxStyle6: TcxStyle; }
    cxStyle7.ClassName; { cxStyle7: TcxStyle; }
    cxStyle8.ClassName; { cxStyle8: TcxStyle; }
  end;

{ dmIntegracoes: TdmIntegracoes }
  with TdmIntegracoes(nil) do { uuDmIntegracoes.pas }
  begin
    qryCsBairrosSistema.ClassName; { qryCsBairrosSistema: TFDQuery; }
    dsIntegracoesBairro.ClassName; { dsIntegracoesBairro: TDataSource; }
    dsBairrosSistema.ClassName; { dsBairrosSistema: TDataSource; }
    qryConsultaEmpresas.ClassName; { qryConsultaEmpresas: TFDQuery; }
    dsCsPlataformas.ClassName; { dsCsPlataformas: TDataSource; }
    qryCsFormasPagamento.ClassName; { qryCsFormasPagamento: TFDQuery; }
    dsFormasPagamento.ClassName; { dsFormasPagamento: TDataSource; }
    tbIntegraBairros.ClassName; { tbIntegraBairros: TFDMemTable; }
    tbIntegraFormasPagto.ClassName; { tbIntegraFormasPagto: TFDMemTable; }
    dsIntegraFormaPagto.ClassName; { dsIntegraFormaPagto: TDataSource; }
    FDQuery1.ClassName; { FDQuery1: TFDQuery; }
    TEMP.ClassName; { TEMP: TDataSource; }
    tbIntegracoesParametros.ClassName; { tbIntegracoesParametros: TFDMemTable; }
    csParametros.ClassName; { csParametros: TDataSource; }
  end;

{ frmReajusteSaboresPizza: TfrmReajusteSaboresPizza }
  with TfrmReajusteSaboresPizza(nil) do { uuFrmReajusteSaboresPizza.pas }
  begin
    pnTitulo.ClassName; { pnTitulo: TPanel; }
    lbTitulo.ClassName; { lbTitulo: TLabel; }
    pnDataHora.ClassName; { pnDataHora: TPanel; }
    Panel1.ClassName; { Panel1: TPanel; }
    AdvGlassButton1.ClassName; { AdvGlassButton1: TAdvGlassButton; }
    AdvGlassButton3.ClassName; { AdvGlassButton3: TAdvGlassButton; }
    Panel2.ClassName; { Panel2: TPanel; }
    Label1.ClassName; { Label1: TLabel; }
    cxGrid1.ClassName; { cxGrid1: TcxGrid; }
    cxGrid1DBTableView1.ClassName; { cxGrid1DBTableView1: TcxGridDBTableView; }
    sabor.ClassName; { sabor: TcxGridDBColumn; }
    grupo.ClassName; { grupo: TcxGridDBColumn; }
    cxGrid1DBTableView1Column3.ClassName; { cxGrid1DBTableView1Column3: TcxGridDBColumn; }
    cxGrid1DBTableView1Column4.ClassName; { cxGrid1DBTableView1Column4: TcxGridDBColumn; }
    cxGrid1Level1.ClassName; { cxGrid1Level1: TcxGridLevel; }
    edNomeDoSabor.ClassName; { edNomeDoSabor: TEdit; }
    cliques.ClassName; { cliques: TActionList; }
    actlBusca.ClassName; { actlBusca: TJvControlActionList; }
    cxStyleRepository2.ClassName; { cxStyleRepository2: TcxStyleRepository; }
    cxStyle6.ClassName; { cxStyle6: TcxStyle; }
    cxStyle7.ClassName; { cxStyle7: TcxStyle; }
    cxstyl1.ClassName; { cxstyl1: TcxStyle; }
  end;

{ frmListagemTabelasPreco: TfrmListagemTabelasPreco }
  with TfrmListagemTabelasPreco(nil) do { uuListagemTabelasPreco.pas }
  begin
    botao_pesquisa.ClassName; { botao_pesquisa: TSpeedButton; }
    Edit1.ClassName; { Edit1: TEdit; }
    pnTitulo.ClassName; { pnTitulo: TPanel; }
    lbTitulo.ClassName; { lbTitulo: TLabel; }
    Panel1.ClassName; { Panel1: TPanel; }
    btSelecionar.ClassName; { btSelecionar: TAdvGlassButton; }
    btSair.ClassName; { btSair: TAdvGlassButton; }
    Panel2.ClassName; { Panel2: TPanel; }
    Label1.ClassName; { Label1: TLabel; }
    cbkExibirPercentuais.ClassName; { cbkExibirPercentuais: TCheckBox; }
    cbTabelaPreco.ClassName; { cbTabelaPreco: TcxCheckComboBox; }
    cliques.ClassName; { cliques: TActionList; }
    actlBusca.ClassName; { actlBusca: TJvControlActionList; }
    FDMemTable1.ClassName; { FDMemTable1: TFDMemTable; }
  end;

{ frmRelFaturamentoPorOperador: TfrmRelFaturamentoPorOperador }
  with TfrmRelFaturamentoPorOperador(nil) do { uuRelFaturamentoPorOperador.pas }
  begin
    botao_pesquisa.ClassName; { botao_pesquisa: TSpeedButton; }
    Edit1.ClassName; { Edit1: TEdit; }
    pnTitulo.ClassName; { pnTitulo: TPanel; }
    lbTitulo.ClassName; { lbTitulo: TLabel; }
    Panel2.ClassName; { Panel2: TPanel; }
    Label1.ClassName; { Label1: TLabel; }
    Label2.ClassName; { Label2: TLabel; }
    Panel3.ClassName; { Panel3: TPanel; }
    Label3.ClassName; { Label3: TLabel; }
    Label4.ClassName; { Label4: TLabel; }
    ed_data_inicial.ClassName; { ed_data_inicial: TAdvDateTimePicker; }
    ed_data_final.ClassName; { ed_data_final: TAdvDateTimePicker; }
    rdTipoRelatorio.ClassName; { rdTipoRelatorio: TRadioGroup; }
    cbFormasPagamento.ClassName; { cbFormasPagamento: TcxCheckComboBox; }
    cbOperadores.ClassName; { cbOperadores: TcxCheckComboBox; }
    Panel1.ClassName; { Panel1: TPanel; }
    btSelecionar.ClassName; { btSelecionar: TAdvGlassButton; }
    btSair.ClassName; { btSair: TAdvGlassButton; }
    cliques.ClassName; { cliques: TActionList; }
    actlBusca.ClassName; { actlBusca: TJvControlActionList; }
    FDMemTable1.ClassName; { FDMemTable1: TFDMemTable; }
  end;

{ frmRelCurvaABCProdutosVendidos: TfrmRelCurvaABCProdutosVendidos }
  with TfrmRelCurvaABCProdutosVendidos(nil) do { uuRelCurvaABCProdutosVendidos.pas }
  begin
    botao_pesquisa.ClassName; { botao_pesquisa: TSpeedButton; }
    Edit1.ClassName; { Edit1: TEdit; }
    pnTitulo.ClassName; { pnTitulo: TPanel; }
    lbTitulo.ClassName; { lbTitulo: TLabel; }
    Panel2.ClassName; { Panel2: TPanel; }
    Label1.ClassName; { Label1: TLabel; }
    Label2.ClassName; { Label2: TLabel; }
    Label5.ClassName; { Label5: TLabel; }
    RadioGroup1.ClassName; { RadioGroup1: TRadioGroup; }
    Panel3.ClassName; { Panel3: TPanel; }
    Label3.ClassName; { Label3: TLabel; }
    Label4.ClassName; { Label4: TLabel; }
    ed_data_inicial.ClassName; { ed_data_inicial: TAdvDateTimePicker; }
    ed_data_final.ClassName; { ed_data_final: TAdvDateTimePicker; }
    edPCTA.ClassName; { edPCTA: TJvValidateEdit; }
    edPCTB.ClassName; { edPCTB: TJvValidateEdit; }
    edPCTC.ClassName; { edPCTC: TJvValidateEdit; }
    Panel1.ClassName; { Panel1: TPanel; }
    btSelecionar.ClassName; { btSelecionar: TAdvGlassButton; }
    btSair.ClassName; { btSair: TAdvGlassButton; }
    cliques.ClassName; { cliques: TActionList; }
    actlBusca.ClassName; { actlBusca: TJvControlActionList; }
  end;

{ frmEmail: TfrmEmail }
  with TfrmEmail(nil) do { uuFrmEmail.pas }
  begin
    Panel1.ClassName; { Panel1: TPanel; }
    Label1.ClassName; { Label1: TLabel; }
    Panel2.ClassName; { Panel2: TPanel; }
    PngSpeedButton4.ClassName; { PngSpeedButton4: TPngSpeedButton; }
    PngSpeedButton1.ClassName; { PngSpeedButton1: TPngSpeedButton; }
    Panel3.ClassName; { Panel3: TPanel; }
    edEmail.ClassName; { edEmail: TEdit; }
  end;

{ frmRelCurvaABCProdutosComprados: TfrmRelCurvaABCProdutosComprados }
  with TfrmRelCurvaABCProdutosComprados(nil) do { uuRelCurvaABCProdutosComprados.pas }
  begin
    SpeedButton1.ClassName; { SpeedButton1: TSpeedButton; }
    Edit2.ClassName; { Edit2: TEdit; }
    pnTitulo.ClassName; { pnTitulo: TPanel; }
    lbTitulo.ClassName; { lbTitulo: TLabel; }
    Panel2.ClassName; { Panel2: TPanel; }
    Label1.ClassName; { Label1: TLabel; }
    Label2.ClassName; { Label2: TLabel; }
    Label5.ClassName; { Label5: TLabel; }
    RadioGroup1.ClassName; { RadioGroup1: TRadioGroup; }
    Panel3.ClassName; { Panel3: TPanel; }
    Label3.ClassName; { Label3: TLabel; }
    Label4.ClassName; { Label4: TLabel; }
    ed_data_inicial.ClassName; { ed_data_inicial: TAdvDateTimePicker; }
    ed_data_final.ClassName; { ed_data_final: TAdvDateTimePicker; }
    edPCTA.ClassName; { edPCTA: TJvValidateEdit; }
    edPCTB.ClassName; { edPCTB: TJvValidateEdit; }
    edPCTC.ClassName; { edPCTC: TJvValidateEdit; }
    Panel1.ClassName; { Panel1: TPanel; }
    btSelecionar.ClassName; { btSelecionar: TAdvGlassButton; }
    btSair.ClassName; { btSair: TAdvGlassButton; }
    cliques.ClassName; { cliques: TActionList; }
    ActionList1.ClassName; { ActionList1: TActionList; }
    ControlAction1.ClassName; { ControlAction1: TControlAction; }
    Action1.ClassName; { Action1: TAction; }
    JvControlActionList1.ClassName; { JvControlActionList1: TJvControlActionList; }
    Action2.ClassName; { Action2: TAction; }
    Action3.ClassName; { Action3: TAction; }
    Action4.ClassName; { Action4: TAction; }
    Action5.ClassName; { Action5: TAction; }
    Action6.ClassName; { Action6: TAction; }
    Action7.ClassName; { Action7: TAction; }
    Action8.ClassName; { Action8: TAction; }
    Action9.ClassName; { Action9: TAction; }
    Action10.ClassName; { Action10: TAction; }
    Action11.ClassName; { Action11: TAction; }
    Action12.ClassName; { Action12: TAction; }
    Action13.ClassName; { Action13: TAction; }
    Action14.ClassName; { Action14: TAction; }
    Action15.ClassName; { Action15: TAction; }
    Action16.ClassName; { Action16: TAction; }
    Action17.ClassName; { Action17: TAction; }
    Action18.ClassName; { Action18: TAction; }
    Action19.ClassName; { Action19: TAction; }
    Action20.ClassName; { Action20: TAction; }
    Action21.ClassName; { Action21: TAction; }
    Action22.ClassName; { Action22: TAction; }
    Action23.ClassName; { Action23: TAction; }
    Action24.ClassName; { Action24: TAction; }
    Action25.ClassName; { Action25: TAction; }
    Action26.ClassName; { Action26: TAction; }
    Action27.ClassName; { Action27: TAction; }
    Action28.ClassName; { Action28: TAction; }
    Action29.ClassName; { Action29: TAction; }
    Action30.ClassName; { Action30: TAction; }
    Action31.ClassName; { Action31: TAction; }
    Action32.ClassName; { Action32: TAction; }
    Action33.ClassName; { Action33: TAction; }
    Action34.ClassName; { Action34: TAction; }
    Action35.ClassName; { Action35: TAction; }
    Action36.ClassName; { Action36: TAction; }
    Action37.ClassName; { Action37: TAction; }
    Action38.ClassName; { Action38: TAction; }
    Action39.ClassName; { Action39: TAction; }
    Action40.ClassName; { Action40: TAction; }
    Action41.ClassName; { Action41: TAction; }
    Action42.ClassName; { Action42: TAction; }
    Action43.ClassName; { Action43: TAction; }
    Action44.ClassName; { Action44: TAction; }
    Action45.ClassName; { Action45: TAction; }
    Action46.ClassName; { Action46: TAction; }
    Action47.ClassName; { Action47: TAction; }
    Action48.ClassName; { Action48: TAction; }
    Action49.ClassName; { Action49: TAction; }
    Action50.ClassName; { Action50: TAction; }
    Action51.ClassName; { Action51: TAction; }
    Action52.ClassName; { Action52: TAction; }
    Action53.ClassName; { Action53: TAction; }
    Action54.ClassName; { Action54: TAction; }
    Action55.ClassName; { Action55: TAction; }
    Action56.ClassName; { Action56: TAction; }
    Action57.ClassName; { Action57: TAction; }
    Action58.ClassName; { Action58: TAction; }
    FDMemTable1.ClassName; { FDMemTable1: TFDMemTable; }
  end;

{ dmConsultaProdutos: TdmConsultaProdutos }
  with TdmConsultaProdutos(nil) do { uuDmConsultaProdutosEstoque.pas }
  begin
    dsTbProdutosEstoque.ClassName; { dsTbProdutosEstoque: TDataSource; }
    dsTbProdutosGeral.ClassName; { dsTbProdutosGeral: TDataSource; }
  end;

{ frmRelFichasTecnicas: TfrmRelFichasTecnicas }
  with TfrmRelFichasTecnicas(nil) do { uuRelFichasTecnicas.pas }
  begin
    botao_pesquisa.ClassName; { botao_pesquisa: TSpeedButton; }
    Edit1.ClassName; { Edit1: TEdit; }
    pnTitulo.ClassName; { pnTitulo: TPanel; }
    lbTitulo.ClassName; { lbTitulo: TLabel; }
    Panel2.ClassName; { Panel2: TPanel; }
    RadioGroup2.ClassName; { RadioGroup2: TRadioGroup; }
    pn_grupos.ClassName; { pn_grupos: TPanel; }
    Label1.ClassName; { Label1: TLabel; }
    Label2.ClassName; { Label2: TLabel; }
    bt_pesq_grupo.ClassName; { bt_pesq_grupo: TSpeedButton; }
    ed_cod_grupo.ClassName; { ed_cod_grupo: TMaskEdit; }
    Panel3.ClassName; { Panel3: TPanel; }
    ed_desc_grupo.ClassName; { ed_desc_grupo: TMaskEdit; }
    rdTipoRelatorio.ClassName; { rdTipoRelatorio: TRadioGroup; }
    rdFiltroProduto.ClassName; { rdFiltroProduto: TRadioGroup; }
    edParametro.ClassName; { edParametro: TJvValidateEdit; }
    ckbNaoImprimirInsumos.ClassName; { ckbNaoImprimirInsumos: TCheckBox; }
    RadioGroup1.ClassName; { RadioGroup1: TRadioGroup; }
    Panel4.ClassName; { Panel4: TPanel; }
    Label3.ClassName; { Label3: TLabel; }
    Label4.ClassName; { Label4: TLabel; }
    btPesqProdutos.ClassName; { btPesqProdutos: TSpeedButton; }
    edCodProduto.ClassName; { edCodProduto: TMaskEdit; }
    Panel5.ClassName; { Panel5: TPanel; }
    ed_desc_produto.ClassName; { ed_desc_produto: TMaskEdit; }
    Panel1.ClassName; { Panel1: TPanel; }
    btSelecionar.ClassName; { btSelecionar: TAdvGlassButton; }
    btSair.ClassName; { btSair: TAdvGlassButton; }
    cliques.ClassName; { cliques: TActionList; }
    actlBusca.ClassName; { actlBusca: TJvControlActionList; }
  end;

{ frmRelFaturamentoComparativoMensal: TfrmRelFaturamentoComparativoMensal }
  with TfrmRelFaturamentoComparativoMensal(nil) do { uuRelFaturamentoComparativoMensal.pas }
  begin
    SpeedButton1.ClassName; { SpeedButton1: TSpeedButton; }
    Edit2.ClassName; { Edit2: TEdit; }
    pnTitulo.ClassName; { pnTitulo: TPanel; }
    lbTitulo.ClassName; { lbTitulo: TLabel; }
    Panel2.ClassName; { Panel2: TPanel; }
    RadioGroup1.ClassName; { RadioGroup1: TRadioGroup; }
    Panel3.ClassName; { Panel3: TPanel; }
    Label3.ClassName; { Label3: TLabel; }
    Label4.ClassName; { Label4: TLabel; }
    ed_data_inicial.ClassName; { ed_data_inicial: TAdvDateTimePicker; }
    ed_data_final.ClassName; { ed_data_final: TAdvDateTimePicker; }
    Panel1.ClassName; { Panel1: TPanel; }
    btSelecionar.ClassName; { btSelecionar: TAdvGlassButton; }
    btSair.ClassName; { btSair: TAdvGlassButton; }
    ActionList1.ClassName; { ActionList1: TActionList; }
    ControlAction1.ClassName; { ControlAction1: TControlAction; }
    Action1.ClassName; { Action1: TAction; }
    JvControlActionList1.ClassName; { JvControlActionList1: TJvControlActionList; }
    Action2.ClassName; { Action2: TAction; }
    Action3.ClassName; { Action3: TAction; }
    Action4.ClassName; { Action4: TAction; }
    Action5.ClassName; { Action5: TAction; }
    Action6.ClassName; { Action6: TAction; }
    Action7.ClassName; { Action7: TAction; }
    Action8.ClassName; { Action8: TAction; }
    Action9.ClassName; { Action9: TAction; }
    Action10.ClassName; { Action10: TAction; }
    Action11.ClassName; { Action11: TAction; }
    Action12.ClassName; { Action12: TAction; }
    Action13.ClassName; { Action13: TAction; }
    Action14.ClassName; { Action14: TAction; }
    Action15.ClassName; { Action15: TAction; }
    Action16.ClassName; { Action16: TAction; }
    Action17.ClassName; { Action17: TAction; }
    Action18.ClassName; { Action18: TAction; }
    Action19.ClassName; { Action19: TAction; }
    Action20.ClassName; { Action20: TAction; }
    Action21.ClassName; { Action21: TAction; }
    Action22.ClassName; { Action22: TAction; }
    Action23.ClassName; { Action23: TAction; }
    Action24.ClassName; { Action24: TAction; }
    Action25.ClassName; { Action25: TAction; }
    Action26.ClassName; { Action26: TAction; }
    Action27.ClassName; { Action27: TAction; }
    Action28.ClassName; { Action28: TAction; }
    Action29.ClassName; { Action29: TAction; }
    Action30.ClassName; { Action30: TAction; }
    Action31.ClassName; { Action31: TAction; }
    Action32.ClassName; { Action32: TAction; }
    Action33.ClassName; { Action33: TAction; }
    Action34.ClassName; { Action34: TAction; }
    Action35.ClassName; { Action35: TAction; }
    Action36.ClassName; { Action36: TAction; }
    Action37.ClassName; { Action37: TAction; }
    Action38.ClassName; { Action38: TAction; }
    Action39.ClassName; { Action39: TAction; }
    Action40.ClassName; { Action40: TAction; }
    Action41.ClassName; { Action41: TAction; }
    Action42.ClassName; { Action42: TAction; }
    Action43.ClassName; { Action43: TAction; }
    Action44.ClassName; { Action44: TAction; }
    Action45.ClassName; { Action45: TAction; }
    Action46.ClassName; { Action46: TAction; }
    Action47.ClassName; { Action47: TAction; }
    Action48.ClassName; { Action48: TAction; }
    Action49.ClassName; { Action49: TAction; }
    Action50.ClassName; { Action50: TAction; }
    Action51.ClassName; { Action51: TAction; }
    Action52.ClassName; { Action52: TAction; }
    Action53.ClassName; { Action53: TAction; }
    Action54.ClassName; { Action54: TAction; }
    Action55.ClassName; { Action55: TAction; }
    Action56.ClassName; { Action56: TAction; }
    Action57.ClassName; { Action57: TAction; }
    Action58.ClassName; { Action58: TAction; }
  end;

{ frmSelecionaAdquirente: TfrmSelecionaAdquirente }
  with TfrmSelecionaAdquirente(nil) do { uuSelecionaAdquirente.pas }
  begin
    Panel1.ClassName; { Panel1: TPanel; }
    lblTitulo.ClassName; { lblTitulo: TLabel; }
    Panel2.ClassName; { Panel2: TPanel; }
    Panel4.ClassName; { Panel4: TPanel; }
    Label1.ClassName; { Label1: TLabel; }
    AdvTouchKeyboard1.ClassName; { AdvTouchKeyboard1: TAdvTouchKeyboard; }
    edNSUOperacao.ClassName; { edNSUOperacao: TEdit; }
    Panel5.ClassName; { Panel5: TPanel; }
    cxGrid1.ClassName; { cxGrid1: TcxGrid; }
    cxGrid1DBTableView1.ClassName; { cxGrid1DBTableView1: TcxGridDBTableView; }
    cxGrid1DBTableView1Column1.ClassName; { cxGrid1DBTableView1Column1: TcxGridDBColumn; }
    cxGrid1Level1.ClassName; { cxGrid1Level1: TcxGridLevel; }
    Panel3.ClassName; { Panel3: TPanel; }
    btConfirmar.ClassName; { btConfirmar: TAdvGlassButton; }
    cliques.ClassName; { cliques: TActionList; }
    actlBusca.ClassName; { actlBusca: TJvControlActionList; }
    cxStyleRepository1.ClassName; { cxStyleRepository1: TcxStyleRepository; }
    cxStyle2.ClassName; { cxStyle2: TcxStyle; }
    stlRegistro.ClassName; { stlRegistro: TcxStyle; }
    stConfirmada.ClassName; { stConfirmada: TcxStyle; }
    stCancelada.ClassName; { stCancelada: TcxStyle; }
    stCiencia.ClassName; { stCiencia: TcxStyle; }
    stSemManifesto.ClassName; { stSemManifesto: TcxStyle; }
    stNaoRealizada.ClassName; { stNaoRealizada: TcxStyle; }
    cxstyl1.ClassName; { cxstyl1: TcxStyle; }
  end;

{ frmAuditoriaCaixas: TfrmAuditoriaCaixas }
  with TfrmAuditoriaCaixas(nil) do { uuAuditoriaCaixas.pas }
  begin
    botao_pesquisa.ClassName; { botao_pesquisa: TSpeedButton; }
    SpeedButton2.ClassName; { SpeedButton2: TSpeedButton; }
    Edit1.ClassName; { Edit1: TEdit; }
    Edit3.ClassName; { Edit3: TEdit; }
    pglPrincipal.ClassName; { pglPrincipal: TJvPageList; }
    pgListagemCaixas.ClassName; { pgListagemCaixas: TJvStandardPage; }
    SpeedButton1.ClassName; { SpeedButton1: TSpeedButton; }
    SpeedButton3.ClassName; { SpeedButton3: TSpeedButton; }
    SpeedButton4.ClassName; { SpeedButton4: TSpeedButton; }
    Edit2.ClassName; { Edit2: TEdit; }
    Edit4.ClassName; { Edit4: TEdit; }
    Edit5.ClassName; { Edit5: TEdit; }
    frmCorpo.ClassName; { frmCorpo: TPanel; }
    Label4.ClassName; { Label4: TLabel; }
    cxGrid1.ClassName; { cxGrid1: TcxGrid; }
    cxGrid1DBTableView1.ClassName; { cxGrid1DBTableView1: TcxGridDBTableView; }
    cxGrid1DBTableView1CODIGO.ClassName; { cxGrid1DBTableView1CODIGO: TcxGridDBColumn; }
    cxGrid1DBTableView1DATA_SISTEMA.ClassName; { cxGrid1DBTableView1DATA_SISTEMA: TcxGridDBColumn; }
    cxGrid1DBTableView1STATUS.ClassName; { cxGrid1DBTableView1STATUS: TcxGridDBColumn; }
    cxGrid1DBTableView1NOME_USUARIO.ClassName; { cxGrid1DBTableView1NOME_USUARIO: TcxGridDBColumn; }
    cxGrid1DBTableView1TURNO.ClassName; { cxGrid1DBTableView1TURNO: TcxGridDBColumn; }
    cxGrid1DBTableView1ABERTURA.ClassName; { cxGrid1DBTableView1ABERTURA: TcxGridDBColumn; }
    cxGrid1DBTableView1FECHAMENTO.ClassName; { cxGrid1DBTableView1FECHAMENTO: TcxGridDBColumn; }
    cxGrid1DBTableView1SUPRIMENTOS.ClassName; { cxGrid1DBTableView1SUPRIMENTOS: TcxGridDBColumn; }
    cxGrid1DBTableView1VENDAS.ClassName; { cxGrid1DBTableView1VENDAS: TcxGridDBColumn; }
    cxGrid1DBTableView1SANGRIAS.ClassName; { cxGrid1DBTableView1SANGRIAS: TcxGridDBColumn; }
    cxGrid1DBTableView1SISTEMA.ClassName; { cxGrid1DBTableView1SISTEMA: TcxGridDBColumn; }
    cxGrid1DBTableView1OPERADOR.ClassName; { cxGrid1DBTableView1OPERADOR: TcxGridDBColumn; }
    cxGrid1DBTableView1DIFERENCA.ClassName; { cxGrid1DBTableView1DIFERENCA: TcxGridDBColumn; }
    cxGrid1DBTableView1DIFERENCA_PAGAR.ClassName; { cxGrid1DBTableView1DIFERENCA_PAGAR: TcxGridDBColumn; }
    cxGrid1Level1.ClassName; { cxGrid1Level1: TcxGridLevel; }
    frmTopo.ClassName; { frmTopo: TPanel; }
    RadioGroup1.ClassName; { RadioGroup1: TRadioGroup; }
    Panel2.ClassName; { Panel2: TPanel; }
    Label2.ClassName; { Label2: TLabel; }
    Label3.ClassName; { Label3: TLabel; }
    edDataInicial.ClassName; { edDataInicial: TAdvDateTimePicker; }
    edDataFinal.ClassName; { edDataFinal: TAdvDateTimePicker; }
    btPequisaInventarios.ClassName; { btPequisaInventarios: TAdvGlassButton; }
    rdTipoCaixa.ClassName; { rdTipoCaixa: TRadioGroup; }
    Panel1.ClassName; { Panel1: TPanel; }
    Label1.ClassName; { Label1: TLabel; }
    Label14.ClassName; { Label14: TLabel; }
    Panel3.ClassName; { Panel3: TPanel; }
    AdvGlassButton3.ClassName; { AdvGlassButton3: TAdvGlassButton; }
    pgAuditoria.ClassName; { pgAuditoria: TJvStandardPage; }
    cliques.ClassName; { cliques: TActionList; }
    actlBusca.ClassName; { actlBusca: TJvControlActionList; }
    ActionList1.ClassName; { ActionList1: TActionList; }
    ControlAction1.ClassName; { ControlAction1: TControlAction; }
    Action1.ClassName; { Action1: TAction; }
    JvControlActionList1.ClassName; { JvControlActionList1: TJvControlActionList; }
    Action2.ClassName; { Action2: TAction; }
    Action3.ClassName; { Action3: TAction; }
    Action4.ClassName; { Action4: TAction; }
    Action5.ClassName; { Action5: TAction; }
    Action6.ClassName; { Action6: TAction; }
    Action7.ClassName; { Action7: TAction; }
    Action8.ClassName; { Action8: TAction; }
    Action9.ClassName; { Action9: TAction; }
    Action10.ClassName; { Action10: TAction; }
    Action11.ClassName; { Action11: TAction; }
    Action12.ClassName; { Action12: TAction; }
    Action13.ClassName; { Action13: TAction; }
    Action14.ClassName; { Action14: TAction; }
    Action15.ClassName; { Action15: TAction; }
    Action16.ClassName; { Action16: TAction; }
    Action17.ClassName; { Action17: TAction; }
    Action18.ClassName; { Action18: TAction; }
    Action19.ClassName; { Action19: TAction; }
    Action20.ClassName; { Action20: TAction; }
    Action21.ClassName; { Action21: TAction; }
    Action22.ClassName; { Action22: TAction; }
    Action23.ClassName; { Action23: TAction; }
    Action24.ClassName; { Action24: TAction; }
    Action25.ClassName; { Action25: TAction; }
    Action26.ClassName; { Action26: TAction; }
    Action27.ClassName; { Action27: TAction; }
    Action28.ClassName; { Action28: TAction; }
    Action29.ClassName; { Action29: TAction; }
    Action30.ClassName; { Action30: TAction; }
    Action31.ClassName; { Action31: TAction; }
    Action32.ClassName; { Action32: TAction; }
    Action33.ClassName; { Action33: TAction; }
    Action34.ClassName; { Action34: TAction; }
    Action35.ClassName; { Action35: TAction; }
    Action36.ClassName; { Action36: TAction; }
    Action37.ClassName; { Action37: TAction; }
    Action38.ClassName; { Action38: TAction; }
    Action39.ClassName; { Action39: TAction; }
    Action40.ClassName; { Action40: TAction; }
    Action41.ClassName; { Action41: TAction; }
    Action42.ClassName; { Action42: TAction; }
    Action43.ClassName; { Action43: TAction; }
    Action44.ClassName; { Action44: TAction; }
    Action45.ClassName; { Action45: TAction; }
    Action46.ClassName; { Action46: TAction; }
    Action47.ClassName; { Action47: TAction; }
    Action48.ClassName; { Action48: TAction; }
    Action49.ClassName; { Action49: TAction; }
    Action50.ClassName; { Action50: TAction; }
    Action51.ClassName; { Action51: TAction; }
    Action52.ClassName; { Action52: TAction; }
    Action53.ClassName; { Action53: TAction; }
    Action54.ClassName; { Action54: TAction; }
    Action55.ClassName; { Action55: TAction; }
    Action56.ClassName; { Action56: TAction; }
    Action57.ClassName; { Action57: TAction; }
    Action58.ClassName; { Action58: TAction; }
    cxStyleRepository1.ClassName; { cxStyleRepository1: TcxStyleRepository; }
    cxStyle2.ClassName; { cxStyle2: TcxStyle; }
    stlRegistro.ClassName; { stlRegistro: TcxStyle; }
    stConfirmada.ClassName; { stConfirmada: TcxStyle; }
    stCancelada.ClassName; { stCancelada: TcxStyle; }
    stCiencia.ClassName; { stCiencia: TcxStyle; }
    stSemManifesto.ClassName; { stSemManifesto: TcxStyle; }
    stNaoRealizada.ClassName; { stNaoRealizada: TcxStyle; }
  end;

{ frmProducaoSubProdutos: TfrmProducaoSubProdutos }
  with TfrmProducaoSubProdutos(nil) do { uuProducaoSubProdutos.pas }
  begin
    jvPrincipal.ClassName; { jvPrincipal: TJvPageList; }
    pgListagem.ClassName; { pgListagem: TJvStandardPage; }
    SpeedButton1.ClassName; { SpeedButton1: TSpeedButton; }
    SpeedButton3.ClassName; { SpeedButton3: TSpeedButton; }
    SpeedButton4.ClassName; { SpeedButton4: TSpeedButton; }
    Edit2.ClassName; { Edit2: TEdit; }
    Edit4.ClassName; { Edit4: TEdit; }
    Edit5.ClassName; { Edit5: TEdit; }
    pnCorpo.ClassName; { pnCorpo: TPanel; }
    Label4.ClassName; { Label4: TLabel; }
    cxGrid1.ClassName; { cxGrid1: TcxGrid; }
    cxGrid1DBTableView1.ClassName; { cxGrid1DBTableView1: TcxGridDBTableView; }
    cxGrid1DBTableView1ID.ClassName; { cxGrid1DBTableView1ID: TcxGridDBColumn; }
    cxGrid1DBTableView1PROCESSADA.ClassName; { cxGrid1DBTableView1PROCESSADA: TcxGridDBColumn; }
    cxGrid1DBTableView1DATA.ClassName; { cxGrid1DBTableView1DATA: TcxGridDBColumn; }
    cxGrid1DBTableView1HISTORICO.ClassName; { cxGrid1DBTableView1HISTORICO: TcxGridDBColumn; }
    cxGrid1DBTableView1DATA_PROCESSAMENTO.ClassName; { cxGrid1DBTableView1DATA_PROCESSAMENTO: TcxGridDBColumn; }
    cxGrid1DBTableView1NOME_USUARIO.ClassName; { cxGrid1DBTableView1NOME_USUARIO: TcxGridDBColumn; }
    cxGrid1DBTableView1CUSTO_PRODUCAO.ClassName; { cxGrid1DBTableView1CUSTO_PRODUCAO: TcxGridDBColumn; }
    cxGrid1DBTableView1CUSTO_PERDAS.ClassName; { cxGrid1DBTableView1CUSTO_PERDAS: TcxGridDBColumn; }
    cxGrid1Level1.ClassName; { cxGrid1Level1: TcxGridLevel; }
    frmTopo.ClassName; { frmTopo: TPanel; }
    Label25.ClassName; { Label25: TLabel; }
    RadioGroup2.ClassName; { RadioGroup2: TRadioGroup; }
    RadioGroup1.ClassName; { RadioGroup1: TRadioGroup; }
    Panel2.ClassName; { Panel2: TPanel; }
    Label2.ClassName; { Label2: TLabel; }
    Label3.ClassName; { Label3: TLabel; }
    edDataInicial.ClassName; { edDataInicial: TAdvDateTimePicker; }
    edDataFinal.ClassName; { edDataFinal: TAdvDateTimePicker; }
    btPequisaInventarios.ClassName; { btPequisaInventarios: TAdvGlassButton; }
    Panel13.ClassName; { Panel13: TPanel; }
    Label23.ClassName; { Label23: TLabel; }
    ed_desc_item.ClassName; { ed_desc_item: TEdit; }
    Panel14.ClassName; { Panel14: TPanel; }
    bt_pesq_item_estoque_cod.ClassName; { bt_pesq_item_estoque_cod: TSpeedButton; }
    Label24.ClassName; { Label24: TLabel; }
    ed_cod_item.ClassName; { ed_cod_item: TEdit; }
    cbHistoricosConsulta.ClassName; { cbHistoricosConsulta: TcxLookupComboBox; }
    Panel1.ClassName; { Panel1: TPanel; }
    Label1.ClassName; { Label1: TLabel; }
    Label14.ClassName; { Label14: TLabel; }
    Panel3.ClassName; { Panel3: TPanel; }
    AdvGlassButton4.ClassName; { AdvGlassButton4: TAdvGlassButton; }
    AdvGlassButton3.ClassName; { AdvGlassButton3: TAdvGlassButton; }
    pgCadastro.ClassName; { pgCadastro: TJvStandardPage; }
    Panel4.ClassName; { Panel4: TPanel; }
    Label5.ClassName; { Label5: TLabel; }
    Label6.ClassName; { Label6: TLabel; }
    Panel6.ClassName; { Panel6: TPanel; }
    AdvGlassButton2.ClassName; { AdvGlassButton2: TAdvGlassButton; }
    AdvGlassButton5.ClassName; { AdvGlassButton5: TAdvGlassButton; }
    pnCabecalhoProducao.ClassName; { pnCabecalhoProducao: TPanel; }
    Label11.ClassName; { Label11: TLabel; }
    Label12.ClassName; { Label12: TLabel; }
    Label13.ClassName; { Label13: TLabel; }
    edDataProducao.ClassName; { edDataProducao: TAdvDateTimePicker; }
    cbHistoricoProducao.ClassName; { cbHistoricoProducao: TcxLookupComboBox; }
    memoObservacoes.ClassName; { memoObservacoes: TMemo; }
    Panel5.ClassName; { Panel5: TPanel; }
    btPesqSubmateria.ClassName; { btPesqSubmateria: TSpeedButton; }
    Label22.ClassName; { Label22: TLabel; }
    Label9.ClassName; { Label9: TLabel; }
    edCodSubmateria.ClassName; { edCodSubmateria: TEdit; }
    pnProdutosProducao.ClassName; { pnProdutosProducao: TPanel; }
    Label21.ClassName; { Label21: TLabel; }
    Label7.ClassName; { Label7: TLabel; }
    Label8.ClassName; { Label8: TLabel; }
    edDescricaoSubmateria.ClassName; { edDescricaoSubmateria: TEdit; }
    edEstoqueSubproduto.ClassName; { edEstoqueSubproduto: TEdit; }
    edRendimentoSubproduto.ClassName; { edRendimentoSubproduto: TEdit; }
    edQuantidade.ClassName; { edQuantidade: TCurrencyEdit; }
    AdvGlassButton1.ClassName; { AdvGlassButton1: TAdvGlassButton; }
    pnItensProducao.ClassName; { pnItensProducao: TPanel; }
    Label10.ClassName; { Label10: TLabel; }
    cxGrid2.ClassName; { cxGrid2: TcxGrid; }
    cxGridDBTableView1.ClassName; { cxGridDBTableView1: TcxGridDBTableView; }
    cxGridDBTableView1codProduto.ClassName; { cxGridDBTableView1codProduto: TcxGridDBColumn; }
    cxGridDBTableView1Descricao.ClassName; { cxGridDBTableView1Descricao: TcxGridDBColumn; }
    cxGridDBTableView1qtdeProduzida.ClassName; { cxGridDBTableView1qtdeProduzida: TcxGridDBColumn; }
    cxGridDBTableView1Unidade.ClassName; { cxGridDBTableView1Unidade: TcxGridDBColumn; }
    cxGridDBTableView1percentualReceita.ClassName; { cxGridDBTableView1percentualReceita: TcxGridDBColumn; }
    cxGridDBTableView1custoUnitario.ClassName; { cxGridDBTableView1custoUnitario: TcxGridDBColumn; }
    cxGridDBTableView1custoTotal.ClassName; { cxGridDBTableView1custoTotal: TcxGridDBColumn; }
    cxGridLevel1.ClassName; { cxGridLevel1: TcxGridLevel; }
    pgFichaProducao.ClassName; { pgFichaProducao: TJvStandardPage; }
    Panel7.ClassName; { Panel7: TPanel; }
    Label15.ClassName; { Label15: TLabel; }
    Panel8.ClassName; { Panel8: TPanel; }
    Panel10.ClassName; { Panel10: TPanel; }
    Label20.ClassName; { Label20: TLabel; }
    Label17.ClassName; { Label17: TLabel; }
    Label18.ClassName; { Label18: TLabel; }
    Label19.ClassName; { Label19: TLabel; }
    edDescricaoProdutoFichaProducao.ClassName; { edDescricaoProdutoFichaProducao: TEdit; }
    edQuantidadeFichaProducao.ClassName; { edQuantidadeFichaProducao: TEdit; }
    edPercentualFichaProducao.ClassName; { edPercentualFichaProducao: TEdit; }
    edUnidadeFichaProducao.ClassName; { edUnidadeFichaProducao: TEdit; }
    Panel9.ClassName; { Panel9: TPanel; }
    Label16.ClassName; { Label16: TLabel; }
    cxGrid3.ClassName; { cxGrid3: TcxGrid; }
    cxGridDBTableView2.ClassName; { cxGridDBTableView2: TcxGridDBTableView; }
    cxGridDBTableView2COD_PRODUTO_BAIXA.ClassName; { cxGridDBTableView2COD_PRODUTO_BAIXA: TcxGridDBColumn; }
    cxGridDBTableView2DESCRICAO_PROD_BAIXA.ClassName; { cxGridDBTableView2DESCRICAO_PROD_BAIXA: TcxGridDBColumn; }
    cxGridDBTableView2ESTOQUEATUAL.ClassName; { cxGridDBTableView2ESTOQUEATUAL: TcxGridDBColumn; }
    cxGridDBTableView2UNIDADEESTOQUE.ClassName; { cxGridDBTableView2UNIDADEESTOQUE: TcxGridDBColumn; }
    cxGridDBTableView2QTDERECEITA.ClassName; { cxGridDBTableView2QTDERECEITA: TcxGridDBColumn; }
    cxGridDBTableView2DESCRICAO_UNIDADE.ClassName; { cxGridDBTableView2DESCRICAO_UNIDADE: TcxGridDBColumn; }
    cxGridDBTableView2CUSTO_UNITARIO_PRODUTO.ClassName; { cxGridDBTableView2CUSTO_UNITARIO_PRODUTO: TcxGridDBColumn; }
    cxGridDBTableView2CUSTORECEITA.ClassName; { cxGridDBTableView2CUSTORECEITA: TcxGridDBColumn; }
    cxGridDBTableView2QTDEPRODUCAO.ClassName; { cxGridDBTableView2QTDEPRODUCAO: TcxGridDBColumn; }
    cxGridDBTableView2CUSTOPRODUCAO.ClassName; { cxGridDBTableView2CUSTOPRODUCAO: TcxGridDBColumn; }
    cxGridLevel2.ClassName; { cxGridLevel2: TcxGridLevel; }
    Panel12.ClassName; { Panel12: TPanel; }
    Panel11.ClassName; { Panel11: TPanel; }
    AdvGlassButton7.ClassName; { AdvGlassButton7: TAdvGlassButton; }
    btImprimirInventario.ClassName; { btImprimirInventario: TAdvGlassButton; }
    cliques.ClassName; { cliques: TActionList; }
    actlBusca.ClassName; { actlBusca: TJvControlActionList; }
    cxStyleRepository1.ClassName; { cxStyleRepository1: TcxStyleRepository; }
    cxStyle2.ClassName; { cxStyle2: TcxStyle; }
    stlRegistro.ClassName; { stlRegistro: TcxStyle; }
    stConfirmada.ClassName; { stConfirmada: TcxStyle; }
    stCancelada.ClassName; { stCancelada: TcxStyle; }
    stCiencia.ClassName; { stCiencia: TcxStyle; }
    stSemManifesto.ClassName; { stSemManifesto: TcxStyle; }
    stNaoRealizada.ClassName; { stNaoRealizada: TcxStyle; }
    HeaderStl.ClassName; { HeaderStl: TcxStyle; }
    popCadastro.ClassName; { popCadastro: TPopupMenu; }
    V1.ClassName; { V1: TMenuItem; }
    E1.ClassName; { E1: TMenuItem; }
    cxImageList1.ClassName; { cxImageList1: TcxImageList; }
    popListagem.ClassName; { popListagem: TPopupMenu; }
    itEditarProducao.ClassName; { itEditarProducao: TMenuItem; }
    itExcluirProducao.ClassName; { itExcluirProducao: TMenuItem; }
    I1.ClassName; { I1: TMenuItem; }
    P1.ClassName; { P1: TMenuItem; }
  end;

{ frmRelRecebimentosCartoes: TfrmRelRecebimentosCartoes }
  with TfrmRelRecebimentosCartoes(nil) do { uuRelRecebimentosCartoes.pas }
  begin
    botao_pesquisa.ClassName; { botao_pesquisa: TSpeedButton; }
    Edit1.ClassName; { Edit1: TEdit; }
    pnTitulo.ClassName; { pnTitulo: TPanel; }
    lbTitulo.ClassName; { lbTitulo: TLabel; }
    btSelecionar.ClassName; { btSelecionar: TAdvGlassButton; }
    btSair.ClassName; { btSair: TAdvGlassButton; }
    Panel1.ClassName; { Panel1: TPanel; }
    RadioGroup1.ClassName; { RadioGroup1: TRadioGroup; }
    Panel2.ClassName; { Panel2: TPanel; }
    Label4.ClassName; { Label4: TLabel; }
    Label3.ClassName; { Label3: TLabel; }
    cbk_visualizar.ClassName; { cbk_visualizar: TCheckBox; }
    edDataInicial.ClassName; { edDataInicial: TAdvDateTimePicker; }
    edDataFinal.ClassName; { edDataFinal: TAdvDateTimePicker; }
    GroupBox1.ClassName; { GroupBox1: TGroupBox; }
    cbEmpresas.ClassName; { cbEmpresas: TcxCheckComboBox; }
    GroupBox3.ClassName; { GroupBox3: TGroupBox; }
    cbFormasPagamento.ClassName; { cbFormasPagamento: TcxCheckComboBox; }
    GroupBox4.ClassName; { GroupBox4: TGroupBox; }
    cbAdquirentes.ClassName; { cbAdquirentes: TcxCheckComboBox; }
    rdTipoData.ClassName; { rdTipoData: TRadioGroup; }
    cliques.ClassName; { cliques: TActionList; }
    actlBusca.ClassName; { actlBusca: TJvControlActionList; }
  end;

{ frmRelProdutosPeriodo: TfrmRelProdutosPeriodo }
  with TfrmRelProdutosPeriodo(nil) do { uu_rel_produtosPeriodo.pas }
  begin
    botao_pesquisa.ClassName; { botao_pesquisa: TSpeedButton; }
    SpeedButton1.ClassName; { SpeedButton1: TSpeedButton; }
    Edit1.ClassName; { Edit1: TEdit; }
    Edit2.ClassName; { Edit2: TEdit; }
    btSelecionar.ClassName; { btSelecionar: TAdvGlassButton; }
    btSair.ClassName; { btSair: TAdvGlassButton; }
    Panel1.ClassName; { Panel1: TPanel; }
    RadioGroup1.ClassName; { RadioGroup1: TRadioGroup; }
    Panel2.ClassName; { Panel2: TPanel; }
    Label4.ClassName; { Label4: TLabel; }
    Label3.ClassName; { Label3: TLabel; }
    cbk_visualizar.ClassName; { cbk_visualizar: TCheckBox; }
    ed_data_inicial.ClassName; { ed_data_inicial: TAdvDateTimePicker; }
    ed_data_final.ClassName; { ed_data_final: TAdvDateTimePicker; }
    GroupBox1.ClassName; { GroupBox1: TGroupBox; }
    cbEmpresas.ClassName; { cbEmpresas: TcxCheckComboBox; }
    GroupBox2.ClassName; { GroupBox2: TGroupBox; }
    ckbTodas.ClassName; { ckbTodas: TCheckBox; }
    ckbMesas.ClassName; { ckbMesas: TCheckBox; }
    ckbBalcao.ClassName; { ckbBalcao: TCheckBox; }
    ckbDelivery.ClassName; { ckbDelivery: TCheckBox; }
    GroupBox3.ClassName; { GroupBox3: TGroupBox; }
    Label2.ClassName; { Label2: TLabel; }
    bt_pesq_grupo.ClassName; { bt_pesq_grupo: TSpeedButton; }
    ed_cod_grupo.ClassName; { ed_cod_grupo: TMaskEdit; }
    Panel3.ClassName; { Panel3: TPanel; }
    Label1.ClassName; { Label1: TLabel; }
    ed_desc_grupo.ClassName; { ed_desc_grupo: TMaskEdit; }
    rdOrdem.ClassName; { rdOrdem: TRadioGroup; }
    rdTipoCombo.ClassName; { rdTipoCombo: TRadioGroup; }
    pnTitulo.ClassName; { pnTitulo: TPanel; }
    lbTitulo.ClassName; { lbTitulo: TLabel; }
    cliques.ClassName; { cliques: TActionList; }
  end;

{ frmSincronizarBase: TfrmSincronizarBase }
  with TfrmSincronizarBase(nil) do { uufrmTestes.pas }
  begin
    RadioGroup1.ClassName; { RadioGroup1: TRadioGroup; }
    Button1.ClassName; { Button1: TButton; }
    Panel1.ClassName; { Panel1: TPanel; }
    lb_mesa.ClassName; { lb_mesa: TLabel; }
    lblTitulo.ClassName; { lblTitulo: TLabel; }
    Panel2.ClassName; { Panel2: TPanel; }
    btSincronizar.ClassName; { btSincronizar: TAdvGlassButton; }
    btSair.ClassName; { btSair: TAdvGlassButton; }
    Panel3.ClassName; { Panel3: TPanel; }
    lbStatus.ClassName; { lbStatus: TLabel; }
    ProgressBar1.ClassName; { ProgressBar1: TProgressBar; }
    DataSource1.ClassName; { DataSource1: TDataSource; }
    memTb.ClassName; { memTb: TFDMemTable; }
  end;

{ dmProducaoSubprodutos: TdmProducaoSubprodutos }
  with TdmProducaoSubprodutos(nil) do { uuDMProducaoSubprodutos.pas }
  begin
    qryHistoricosProducao.ClassName; { qryHistoricosProducao: TFDQuery; }
    dsQryHistoricosProducao.ClassName; { dsQryHistoricosProducao: TDataSource; }
    tbSubprodutosProducao.ClassName; { tbSubprodutosProducao: TFDMemTable; }
    tbSubprodutosProducaocodProduto.ClassName; { tbSubprodutosProducaocodProduto: TStringField; }
    tbSubprodutosProducaoDescricao.ClassName; { tbSubprodutosProducaoDescricao: TStringField; }
    tbSubprodutosProducaocustoUnitario.ClassName; { tbSubprodutosProducaocustoUnitario: TCurrencyField; }
    tbSubprodutosProducaocustoTotal.ClassName; { tbSubprodutosProducaocustoTotal: TCurrencyField; }
    tbSubprodutosProducaopercentualReceita.ClassName; { tbSubprodutosProducaopercentualReceita: TBCDField; }
    tbSubprodutosProducaocodUnidade.ClassName; { tbSubprodutosProducaocodUnidade: TStringField; }
    tbSubprodutosProducaoUnidade.ClassName; { tbSubprodutosProducaoUnidade: TStringField; }
    tbSubprodutosProducaoqtdeProduzida.ClassName; { tbSubprodutosProducaoqtdeProduzida: TBCDField; }
    tbSubprodutosProducaorendimentoReceita.ClassName; { tbSubprodutosProducaorendimentoReceita: TBCDField; }
    dsTbProdutosProducaoTemp.ClassName; { dsTbProdutosProducaoTemp: TDataSource; }
    dsFichaProducao.ClassName; { dsFichaProducao: TDataSource; }
    tbFichaProducao.ClassName; { tbFichaProducao: TFDMemTable; }
    dsListagemProducao.ClassName; { dsListagemProducao: TDataSource; }
    tbListagemProducao.ClassName; { tbListagemProducao: TFDMemTable; }
    qryRelFichaProducao.ClassName; { qryRelFichaProducao: TFDQuery; }
    DtqryRelFichaProducao.ClassName; { DtqryRelFichaProducao: TfrxDBDataset; }
    qryRelOrdemProducao.ClassName; { qryRelOrdemProducao: TFDQuery; }
    dtQryRelOrdemProducao.ClassName; { dtQryRelOrdemProducao: TfrxDBDataset; }
    qryProdutosOrdemProducao.ClassName; { qryProdutosOrdemProducao: TFDQuery; }
    DtQryProdutosOrdemProducao.ClassName; { DtQryProdutosOrdemProducao: TfrxDBDataset; }
    qryInsumosOrdemProducao.ClassName; { qryInsumosOrdemProducao: TFDQuery; }
    dtqryInsumosOrdemProducao.ClassName; { dtqryInsumosOrdemProducao: TfrxDBDataset; }
  end;

{ dmAtualizaBase: TdmAtualizaBase }
  with TdmAtualizaBase(nil) do { uuDmAtualizaBase.pas }
  begin
    qryGrupos.ClassName; { qryGrupos: TFDQuery; }
    updQryGrupos.ClassName; { updQryGrupos: TFDUpdateSQL; }
    tsAtualizacao.ClassName; { tsAtualizacao: TFDTransaction; }
    qryProdutos.ClassName; { qryProdutos: TFDQuery; }
    updQryProdutos.ClassName; { updQryProdutos: TFDUpdateSQL; }
    qryGruposAdicionais.ClassName; { qryGruposAdicionais: TFDQuery; }
    updGruposAdicionais.ClassName; { updGruposAdicionais: TFDUpdateSQL; }
    qryProdutosGruposAdicionais.ClassName; { qryProdutosGruposAdicionais: TFDQuery; }
    updProdutosGruposAdicionais.ClassName; { updProdutosGruposAdicionais: TFDUpdateSQL; }
    qryGruposTouch.ClassName; { qryGruposTouch: TFDQuery; }
    updGruposTouch.ClassName; { updGruposTouch: TFDUpdateSQL; }
    qryUsuarios.ClassName; { qryUsuarios: TFDQuery; }
    updUsuarios.ClassName; { updUsuarios: TFDUpdateSQL; }
    qryPermissoes.ClassName; { qryPermissoes: TFDQuery; }
    updPermissoes.ClassName; { updPermissoes: TFDUpdateSQL; }
    qryModulos.ClassName; { qryModulos: TFDQuery; }
    updModulos.ClassName; { updModulos: TFDUpdateSQL; }
  end;

{ dmAuditoriaCaixa: TdmAuditoriaCaixa }
  with TdmAuditoriaCaixa(nil) do { uuDMAuditoriaCaixa.pas }
  begin
    dsqryListagemCaixas.ClassName; { dsqryListagemCaixas: TDataSource; }
    tbListagemCaixas.ClassName; { tbListagemCaixas: TFDMemTable; }
  end;

{ frmCadastroGruposAdicionais: TfrmCadastroGruposAdicionais }
  with TfrmCadastroGruposAdicionais(nil) do { uuFrmGruposAdicionais.pas }
  begin
    botao_pesquisa.ClassName; { botao_pesquisa: TSpeedButton; }
    Edit1.ClassName; { Edit1: TEdit; }
    pgList.ClassName; { pgList: TJvPageList; }
    pgListagem.ClassName; { pgListagem: TJvStandardPage; }
    pnTitulo.ClassName; { pnTitulo: TPanel; }
    lbTitulo.ClassName; { lbTitulo: TLabel; }
    lbDescricaoProduto.ClassName; { lbDescricaoProduto: TLabel; }
    Panel3.ClassName; { Panel3: TPanel; }
    AdvGlassButton4.ClassName; { AdvGlassButton4: TAdvGlassButton; }
    AdvGlassButton3.ClassName; { AdvGlassButton3: TAdvGlassButton; }
    gridGrupos.ClassName; { gridGrupos: TcxGrid; }
    tbGrupos.ClassName; { tbGrupos: TcxGridDBTableView; }
    tbGruposID.ClassName; { tbGruposID: TcxGridDBColumn; }
    tbGruposNOME.ClassName; { tbGruposNOME: TcxGridDBColumn; }
    tbGruposDESCRICAO.ClassName; { tbGruposDESCRICAO: TcxGridDBColumn; }
    tbGruposDESCRICAOTIPO.ClassName; { tbGruposDESCRICAOTIPO: TcxGridDBColumn; }
    tbGruposQTDMIN.ClassName; { tbGruposQTDMIN: TcxGridDBColumn; }
    tbGruposQTDMAX.ClassName; { tbGruposQTDMAX: TcxGridDBColumn; }
    gridGruposLevel1.ClassName; { gridGruposLevel1: TcxGridLevel; }
    Panel1.ClassName; { Panel1: TPanel; }
    AdvGlassButton7.ClassName; { AdvGlassButton7: TAdvGlassButton; }
    AdvGlassButton8.ClassName; { AdvGlassButton8: TAdvGlassButton; }
    pgProdutos.ClassName; { pgProdutos: TJvStandardPage; }
    Panel2.ClassName; { Panel2: TPanel; }
    Label1.ClassName; { Label1: TLabel; }
    Panel4.ClassName; { Panel4: TPanel; }
    AdvGlassButton1.ClassName; { AdvGlassButton1: TAdvGlassButton; }
    AdvGlassButton2.ClassName; { AdvGlassButton2: TAdvGlassButton; }
    cxGrid2.ClassName; { cxGrid2: TcxGrid; }
    cxGridDBTableView1.ClassName; { cxGridDBTableView1: TcxGridDBTableView; }
    cxGridDBTableView1ID.ClassName; { cxGridDBTableView1ID: TcxGridDBColumn; }
    cxGridDBTableView1DESCRICAO.ClassName; { cxGridDBTableView1DESCRICAO: TcxGridDBColumn; }
    cxGridDBTableView1TIPO.ClassName; { cxGridDBTableView1TIPO: TcxGridDBColumn; }
    cxGridDBTableView1QTD.ClassName; { cxGridDBTableView1QTD: TcxGridDBColumn; }
    cxGridDBTableView1VALOR.ClassName; { cxGridDBTableView1VALOR: TcxGridDBColumn; }
    cxGridLevel1.ClassName; { cxGridLevel1: TcxGridLevel; }
    Panel5.ClassName; { Panel5: TPanel; }
    AdvGlassButton12.ClassName; { AdvGlassButton12: TAdvGlassButton; }
    AdvGlassButton13.ClassName; { AdvGlassButton13: TAdvGlassButton; }
    AdvGlassButton19.ClassName; { AdvGlassButton19: TAdvGlassButton; }
    AdvGlassButton5.ClassName; { AdvGlassButton5: TAdvGlassButton; }
    pgCadastro.ClassName; { pgCadastro: TJvStandardPage; }
    Panel6.ClassName; { Panel6: TPanel; }
    Label2.ClassName; { Label2: TLabel; }
    Panel8.ClassName; { Panel8: TPanel; }
    Label3.ClassName; { Label3: TLabel; }
    Label4.ClassName; { Label4: TLabel; }
    Panel7.ClassName; { Panel7: TPanel; }
    AdvGlassButton15.ClassName; { AdvGlassButton15: TAdvGlassButton; }
    AdvGlassButton16.ClassName; { AdvGlassButton16: TAdvGlassButton; }
    edNomeGrupo.ClassName; { edNomeGrupo: TEdit; }
    edDescricaoGrupo.ClassName; { edDescricaoGrupo: TEdit; }
    rdTipoGrupo.ClassName; { rdTipoGrupo: TRadioGroup; }
    rdTipoQtdSelecao.ClassName; { rdTipoQtdSelecao: TRadioGroup; }
    pnQuantidades.ClassName; { pnQuantidades: TPanel; }
    Label6.ClassName; { Label6: TLabel; }
    Label5.ClassName; { Label5: TLabel; }
    edQtdMaxima.ClassName; { edQtdMaxima: TSpinEdit; }
    edQtdMinima.ClassName; { edQtdMinima: TSpinEdit; }
    cliques.ClassName; { cliques: TActionList; }
    actlBusca.ClassName; { actlBusca: TJvControlActionList; }
    cxStyleRepository1.ClassName; { cxStyleRepository1: TcxStyleRepository; }
    cxStyle2.ClassName; { cxStyle2: TcxStyle; }
    stlRegistro.ClassName; { stlRegistro: TcxStyle; }
    stConfirmada.ClassName; { stConfirmada: TcxStyle; }
    stCancelada.ClassName; { stCancelada: TcxStyle; }
    stCiencia.ClassName; { stCiencia: TcxStyle; }
    stSemManifesto.ClassName; { stSemManifesto: TcxStyle; }
    stNaoRealizada.ClassName; { stNaoRealizada: TcxStyle; }
    HeaderStl.ClassName; { HeaderStl: TcxStyle; }
    PopupMenu1.ClassName; { PopupMenu1: TPopupMenu; }
    AlterarAdicionarprodutos1.ClassName; { AlterarAdicionarprodutos1: TMenuItem; }
    Alterarprodutosdogrupo1.ClassName; { Alterarprodutosdogrupo1: TMenuItem; }
    Excluirgrupo1.ClassName; { Excluirgrupo1: TMenuItem; }
    PopupMenu2.ClassName; { PopupMenu2: TPopupMenu; }
    Excluiropcionalobservao1.ClassName; { Excluiropcionalobservao1: TMenuItem; }
  end;

{ dmGruposAdicionais: TdmGruposAdicionais }
  with TdmGruposAdicionais(nil) do { uuDMGruposAdicionais.pas }
  begin
    qryGruposAdicionais.ClassName; { qryGruposAdicionais: TFDQuery; }
    dsGruposAdicionais.ClassName; { dsGruposAdicionais: TDataSource; }
    qryProdutosGruposAdicionais.ClassName; { qryProdutosGruposAdicionais: TFDQuery; }
    dsQryProdutosGruposAdicionais.ClassName; { dsQryProdutosGruposAdicionais: TDataSource; }
    updProdutosGruposAdicionais.ClassName; { updProdutosGruposAdicionais: TFDUpdateSQL; }
  end;

{ frmTestes: TfrmTestes }
  with TfrmTestes(nil) do { uuTestes.pas }
  begin
    Button1.ClassName; { Button1: TButton; }
  end;

{ frm_produtos: Tfrm_produtos }
  with Tfrm_produtos(nil) do { uu_produtos.pas }
  begin
    pn_informacoes_item.ClassName; { pn_informacoes_item: TPanel; }
    btPesqProdutos.ClassName; { btPesqProdutos: TSpeedButton; }
    Label1.ClassName; { Label1: TLabel; }
    edCodProduto.ClassName; { edCodProduto: TEdit; }
    GroupBox7.ClassName; { GroupBox7: TGroupBox; }
    ckbCodSistema.ClassName; { ckbCodSistema: TRadioButton; }
    ckbCodCardapio.ClassName; { ckbCodCardapio: TRadioButton; }
    Panel1.ClassName; { Panel1: TPanel; }
    bt_alterar.ClassName; { bt_alterar: TBitBtn; }
    bt_gravar.ClassName; { bt_gravar: TBitBtn; }
    bt_cancelar.ClassName; { bt_cancelar: TBitBtn; }
    bt_sair.ClassName; { bt_sair: TBitBtn; }
    bt_excluir.ClassName; { bt_excluir: TBitBtn; }
    bt_novo.ClassName; { bt_novo: TBitBtn; }
    pnInformacoesEstoque.ClassName; { pnInformacoesEstoque: TPanel; }
    Label30.ClassName; { Label30: TLabel; }
    Label31.ClassName; { Label31: TLabel; }
    Label32.ClassName; { Label32: TLabel; }
    Label35.ClassName; { Label35: TLabel; }
    Label38.ClassName; { Label38: TLabel; }
    Label45.ClassName; { Label45: TLabel; }
    Label16.ClassName; { Label16: TLabel; }
    Label11.ClassName; { Label11: TLabel; }
    Panel24.ClassName; { Panel24: TPanel; }
    edValorCompra.ClassName; { edValorCompra: TCurrencyEdit; }
    edEstoqueAtual.ClassName; { edEstoqueAtual: TCurrencyEdit; }
    edEstoqueMax.ClassName; { edEstoqueMax: TCurrencyEdit; }
    edEstoqueMin.ClassName; { edEstoqueMin: TCurrencyEdit; }
    edRendimento.ClassName; { edRendimento: TCurrencyEdit; }
    cbUnidadeFracao.ClassName; { cbUnidadeFracao: TcxLookupComboBox; }
    cbUnidadeEntrada.ClassName; { cbUnidadeEntrada: TcxLookupComboBox; }
    edPercPerda.ClassName; { edPercPerda: TCurrencyEdit; }
    ckbAbateFicha.ClassName; { ckbAbateFicha: TCheckBox; }
    pnFichaTecnica.ClassName; { pnFichaTecnica: TPanel; }
    Panel5.ClassName; { Panel5: TPanel; }
    Panel2.ClassName; { Panel2: TPanel; }
    bt_pesq_item_estoque_cod.ClassName; { bt_pesq_item_estoque_cod: TSpeedButton; }
    Label17.ClassName; { Label17: TLabel; }
    Label22.ClassName; { Label22: TLabel; }
    Label5.ClassName; { Label5: TLabel; }
    Panel4.ClassName; { Panel4: TPanel; }
    Label10.ClassName; { Label10: TLabel; }
    ed_desc_item.ClassName; { ed_desc_item: TEdit; }
    ed_cod_item.ClassName; { ed_cod_item: TEdit; }
    ed_qtd_item.ClassName; { ed_qtd_item: TCurrencyEdit; }
    BitBtn1.ClassName; { BitBtn1: TBitBtn; }
    cbUnidadeFichaTecnica.ClassName; { cbUnidadeFichaTecnica: TcxLookupComboBox; }
    Panel6.ClassName; { Panel6: TPanel; }
    dbg_ficha_tec.ClassName; { dbg_ficha_tec: TDBGrid; }
    PageControl1.ClassName; { PageControl1: TPageControl; }
    TabSheet7.ClassName; { TabSheet7: TTabSheet; }
    Label51.ClassName; { Label51: TLabel; }
    rdTamanhoPizza.ClassName; { rdTamanhoPizza: TRadioGroup; }
    ckbPizza.ClassName; { ckbPizza: TCheckBox; }
    edPrecoPizzaBT.ClassName; { edPrecoPizzaBT: TCurrencyEdit; }
    edPrecoPizzaPQ.ClassName; { edPrecoPizzaPQ: TCurrencyEdit; }
    edPrecoPizzaMD.ClassName; { edPrecoPizzaMD: TCurrencyEdit; }
    edPrecoPizzaGD.ClassName; { edPrecoPizzaGD: TCurrencyEdit; }
    edPrecoPizzaFM.ClassName; { edPrecoPizzaFM: TCurrencyEdit; }
    memoSabores.ClassName; { memoSabores: TMemo; }
    BitBtn5.ClassName; { BitBtn5: TBitBtn; }
    TabSheet10.ClassName; { TabSheet10: TTabSheet; }
    Label52.ClassName; { Label52: TLabel; }
    Label54.ClassName; { Label54: TLabel; }
    Label41.ClassName; { Label41: TLabel; }
    Label42.ClassName; { Label42: TLabel; }
    BitBtn6.ClassName; { BitBtn6: TBitBtn; }
    edCodCardapioClone.ClassName; { edCodCardapioClone: TEdit; }
    edDescricaoClone.ClassName; { edDescricaoClone: TEdit; }
    edValorClone.ClassName; { edValorClone: TCurrencyEdit; }
    edDescricaoReduzidaClone.ClassName; { edDescricaoReduzidaClone: TEdit; }
    BitBtn2.ClassName; { BitBtn2: TBitBtn; }
    Panel14.ClassName; { Panel14: TPanel; }
    ckbCompra.ClassName; { ckbCompra: TCheckBox; }
    ckbVende.ClassName; { ckbVende: TCheckBox; }
    ckbSubProduto.ClassName; { ckbSubProduto: TCheckBox; }
    pnInformacoesGerais.ClassName; { pnInformacoesGerais: TPanel; }
    Label3.ClassName; { Label3: TLabel; }
    Label13.ClassName; { Label13: TLabel; }
    Label2.ClassName; { Label2: TLabel; }
    bt_pesq_grupo.ClassName; { bt_pesq_grupo: TSpeedButton; }
    Label18.ClassName; { Label18: TLabel; }
    Label19.ClassName; { Label19: TLabel; }
    Label20.ClassName; { Label20: TLabel; }
    Label21.ClassName; { Label21: TLabel; }
    Label4.ClassName; { Label4: TLabel; }
    Label9.ClassName; { Label9: TLabel; }
    Label36.ClassName; { Label36: TLabel; }
    Label37.ClassName; { Label37: TLabel; }
    Label39.ClassName; { Label39: TLabel; }
    Label40.ClassName; { Label40: TLabel; }
    Label43.ClassName; { Label43: TLabel; }
    Panel3.ClassName; { Panel3: TPanel; }
    Label23.ClassName; { Label23: TLabel; }
    ed_desc_grupo.ClassName; { ed_desc_grupo: TEdit; }
    ed_cod_barras.ClassName; { ed_cod_barras: TEdit; }
    ed_descricao_produto.ClassName; { ed_descricao_produto: TEdit; }
    edDescricaoReduzida.ClassName; { edDescricaoReduzida: TEdit; }
    ed_preco.ClassName; { ed_preco: TCurrencyEdit; }
    ed_cod_grupo.ClassName; { ed_cod_grupo: TEdit; }
    edParametroContabil.ClassName; { edParametroContabil: TCurrencyEdit; }
    cbGrupoTouch.ClassName; { cbGrupoTouch: TcxLookupComboBox; }
    cbLocalImpressao.ClassName; { cbLocalImpressao: TcxLookupComboBox; }
    edComissao.ClassName; { edComissao: TCurrencyEdit; }
    edLucroMax.ClassName; { edLucroMax: TCurrencyEdit; }
    edImpostos.ClassName; { edImpostos: TCurrencyEdit; }
    edOutrasTaxas.ClassName; { edOutrasTaxas: TCurrencyEdit; }
    edMaoObra.ClassName; { edMaoObra: TCurrencyEdit; }
    ckbIncideServico.ClassName; { ckbIncideServico: TCheckBox; }
    ckbPrecoVariavel.ClassName; { ckbPrecoVariavel: TCheckBox; }
    ckbVendaFracionada.ClassName; { ckbVendaFracionada: TCheckBox; }
    ckbCalculaQtde.ClassName; { ckbCalculaQtde: TCheckBox; }
    ckbImprimeFichaFF.ClassName; { ckbImprimeFichaFF: TCheckBox; }
    ckbCouvert.ClassName; { ckbCouvert: TCheckBox; }
    ckbRequerObs.ClassName; { ckbRequerObs: TCheckBox; }
    ckbBalanca.ClassName; { ckbBalanca: TCheckBox; }
    GroupBox1.ClassName; { GroupBox1: TGroupBox; }
    Label8.ClassName; { Label8: TLabel; }
    Label24.ClassName; { Label24: TLabel; }
    Label25.ClassName; { Label25: TLabel; }
    Label7.ClassName; { Label7: TLabel; }
    Label14.ClassName; { Label14: TLabel; }
    Label26.ClassName; { Label26: TLabel; }
    Label27.ClassName; { Label27: TLabel; }
    cbAliquotaICMS.ClassName; { cbAliquotaICMS: TcxLookupComboBox; }
    edReducaoBase.ClassName; { edReducaoBase: TCurrencyEdit; }
    ed_cefop_saidas.ClassName; { ed_cefop_saidas: TEdit; }
    edCstSaida.ClassName; { edCstSaida: TEdit; }
    edCodNCM.ClassName; { edCodNCM: TEdit; }
    edCest.ClassName; { edCest: TEdit; }
    un_ecf.ClassName; { un_ecf: TEdit; }
    GroupBox2.ClassName; { GroupBox2: TGroupBox; }
    Label28.ClassName; { Label28: TLabel; }
    Label29.ClassName; { Label29: TLabel; }
    edAliquotaPis.ClassName; { edAliquotaPis: TCurrencyEdit; }
    edCstPisCofins.ClassName; { edCstPisCofins: TEdit; }
    GroupBox3.ClassName; { GroupBox3: TGroupBox; }
    Label33.ClassName; { Label33: TLabel; }
    Label34.ClassName; { Label34: TLabel; }
    edCstPIS.ClassName; { edCstPIS: TEdit; }
    edAliquotaCofins.ClassName; { edAliquotaCofins: TCurrencyEdit; }
    GroupBox4.ClassName; { GroupBox4: TGroupBox; }
    Label12.ClassName; { Label12: TLabel; }
    btPesqTipoItemSped.ClassName; { btPesqTipoItemSped: TSpeedButton; }
    Label15.ClassName; { Label15: TLabel; }
    btPesqGeneroItem.ClassName; { btPesqGeneroItem: TSpeedButton; }
    edCodTipoItemSped.ClassName; { edCodTipoItemSped: TEdit; }
    edCodGeneroItem.ClassName; { edCodGeneroItem: TEdit; }
    rdIPPT.ClassName; { rdIPPT: TRadioGroup; }
    rdIAT.ClassName; { rdIAT: TRadioGroup; }
    edValidade.ClassName; { edValidade: TCurrencyEdit; }
    pic_dialog.ClassName; { pic_dialog: TOpenDialog; }
    ImageList1.ClassName; { ImageList1: TImageList; }
    PopupMenu1.ClassName; { PopupMenu1: TPopupMenu; }
    Excluirdaficha1.ClassName; { Excluirdaficha1: TMenuItem; }
  end;

{ dmCadUnidadesMedida: TdmCadUnidadesMedida }
  with TdmCadUnidadesMedida(nil) do { uuDmCadUnidadesMedida.pas }
  begin
    qryUnidadesMedida.ClassName; { qryUnidadesMedida: TFDQuery; }
    dsUnidadesMedida.ClassName; { dsUnidadesMedida: TDataSource; }
  end;

{ dmDRE: TdmDRE }
  with TdmDRE(nil) do { uuDMDRE.pas }
  begin
    dtDREComparativo.ClassName; { dtDREComparativo: TfrxDBDataset; }
    qryDREComparativo.ClassName; { qryDREComparativo: TFDQuery; }
    qryResumoDREComparativo.ClassName; { qryResumoDREComparativo: TFDQuery; }
    dtResumoDREComparativo.ClassName; { dtResumoDREComparativo: TfrxDBDataset; }
    dtDRE.ClassName; { dtDRE: TfrxDBDataset; }
    qryDRE.ClassName; { qryDRE: TFDQuery; }
    dtResumoDRE.ClassName; { dtResumoDRE: TfrxDBDataset; }
    qryResumoDRE.ClassName; { qryResumoDRE: TFDQuery; }
    dsQryDRE.ClassName; { dsQryDRE: TDataSource; }
  end;

{ FrmDRE: TFrmDRE }
  with TFrmDRE(nil) do { uuDRE.pas }
  begin
    botao_pesquisa.ClassName; { botao_pesquisa: TSpeedButton; }
    Edit1.ClassName; { Edit1: TEdit; }
    pn_principal.ClassName; { pn_principal: TPanel; }
    pn_codigo.ClassName; { pn_codigo: TPanel; }
    bt_pesquisa.ClassName; { bt_pesquisa: TSpeedButton; }
    ed_codigo.ClassName; { ed_codigo: TMaskEdit; }
    cxGrid1.ClassName; { cxGrid1: TcxGrid; }
    cxGrid1DBTableView1.ClassName; { cxGrid1DBTableView1: TcxGridDBTableView; }
    cxGrid1DBTableView1COD_GRUPO.ClassName; { cxGrid1DBTableView1COD_GRUPO: TcxGridDBColumn; }
    cxGrid1DBTableView1GRUPO.ClassName; { cxGrid1DBTableView1GRUPO: TcxGridDBColumn; }
    cxGrid1DBTableView1TOTAL_MES.ClassName; { cxGrid1DBTableView1TOTAL_MES: TcxGridDBColumn; }
    cxGrid1DBTableView1P_DESP_MES.ClassName; { cxGrid1DBTableView1P_DESP_MES: TcxGridDBColumn; }
    cxGrid1DBTableView1CMV_MES.ClassName; { cxGrid1DBTableView1CMV_MES: TcxGridDBColumn; }
    cxGrid1DBTableView1TOTAL_MES_ANTERIOR.ClassName; { cxGrid1DBTableView1TOTAL_MES_ANTERIOR: TcxGridDBColumn; }
    cxGrid1DBTableView1P_DESP_M_ANTERIOR.ClassName; { cxGrid1DBTableView1P_DESP_M_ANTERIOR: TcxGridDBColumn; }
    cxGrid1DBTableView1CMV_MES_ANT.ClassName; { cxGrid1DBTableView1CMV_MES_ANT: TcxGridDBColumn; }
    cxGrid1DBTableView1CRE_MES_ANT.ClassName; { cxGrid1DBTableView1CRE_MES_ANT: TcxGridDBColumn; }
    cxGrid1DBTableView1TOTAL_ANO_ANTERIOR.ClassName; { cxGrid1DBTableView1TOTAL_ANO_ANTERIOR: TcxGridDBColumn; }
    cxGrid1DBTableView1P_DESP_A_ANTERIOR.ClassName; { cxGrid1DBTableView1P_DESP_A_ANTERIOR: TcxGridDBColumn; }
    cxGrid1DBTableView1CMV_ANO_ANT.ClassName; { cxGrid1DBTableView1CMV_ANO_ANT: TcxGridDBColumn; }
    cxGrid1DBTableView1CRE_ANO_ANT.ClassName; { cxGrid1DBTableView1CRE_ANO_ANT: TcxGridDBColumn; }
    cxGrid1Level1.ClassName; { cxGrid1Level1: TcxGridLevel; }
    pn_botoes.ClassName; { pn_botoes: TPanel; }
    bt_novo.ClassName; { bt_novo: TBitBtn; }
    bt_alterar.ClassName; { bt_alterar: TBitBtn; }
    bt_gravar.ClassName; { bt_gravar: TBitBtn; }
    bt_cancelar.ClassName; { bt_cancelar: TBitBtn; }
    bt_excluir.ClassName; { bt_excluir: TBitBtn; }
    bt_consultar.ClassName; { bt_consultar: TBitBtn; }
    AdvGlassButton3.ClassName; { AdvGlassButton3: TAdvGlassButton; }
    btImprimirInventario.ClassName; { btImprimirInventario: TAdvGlassButton; }
    Panel2.ClassName; { Panel2: TPanel; }
    GroupBox1.ClassName; { GroupBox1: TGroupBox; }
    Label6.ClassName; { Label6: TLabel; }
    cbMes.ClassName; { cbMes: TComboBox; }
    cbAno.ClassName; { cbAno: TComboBox; }
    rdTipoDRE.ClassName; { rdTipoDRE: TRadioGroup; }
    GroupBox2.ClassName; { GroupBox2: TGroupBox; }
    eDiaLimite.ClassName; { eDiaLimite: TSpinEdit; }
    Panel1.ClassName; { Panel1: TPanel; }
    lbTitulo.ClassName; { lbTitulo: TLabel; }
    cliques.ClassName; { cliques: TActionList; }
    actlBusca.ClassName; { actlBusca: TJvControlActionList; }
    sv.ClassName; { sv: TSaveDialog; }
    PopupMenu1.ClassName; { PopupMenu1: TPopupMenu; }
    Detalhar1.ClassName; { Detalhar1: TMenuItem; }
    ListagemdeInsumoscomprados1.ClassName; { ListagemdeInsumoscomprados1: TMenuItem; }
    cxStyleRepository1.ClassName; { cxStyleRepository1: TcxStyleRepository; }
    cxStyle1.ClassName; { cxStyle1: TcxStyle; }
    cxStyleRepository2.ClassName; { cxStyleRepository2: TcxStyleRepository; }
    cxStyle2.ClassName; { cxStyle2: TcxStyle; }
    cxStyle3.ClassName; { cxStyle3: TcxStyle; }
  end;

{ frmDREComparativo: TfrmDREComparativo }
  with TfrmDREComparativo(nil) do { uuRelDREComparativo.pas }
  begin
    SpeedButton1.ClassName; { SpeedButton1: TSpeedButton; }
    Edit2.ClassName; { Edit2: TEdit; }
    pnTitulo.ClassName; { pnTitulo: TPanel; }
    lbTitulo.ClassName; { lbTitulo: TLabel; }
    Panel2.ClassName; { Panel2: TPanel; }
    RadioGroup1.ClassName; { RadioGroup1: TRadioGroup; }
    Panel3.ClassName; { Panel3: TPanel; }
    Label3.ClassName; { Label3: TLabel; }
    Label4.ClassName; { Label4: TLabel; }
    ed_data_inicial.ClassName; { ed_data_inicial: TAdvDateTimePicker; }
    ed_data_final.ClassName; { ed_data_final: TAdvDateTimePicker; }
    Panel1.ClassName; { Panel1: TPanel; }
    btSelecionar.ClassName; { btSelecionar: TAdvGlassButton; }
    btSair.ClassName; { btSair: TAdvGlassButton; }
    ActionList1.ClassName; { ActionList1: TActionList; }
    ControlAction1.ClassName; { ControlAction1: TControlAction; }
    Action1.ClassName; { Action1: TAction; }
    JvControlActionList1.ClassName; { JvControlActionList1: TJvControlActionList; }
    Action2.ClassName; { Action2: TAction; }
    Action3.ClassName; { Action3: TAction; }
    Action4.ClassName; { Action4: TAction; }
    Action5.ClassName; { Action5: TAction; }
    Action6.ClassName; { Action6: TAction; }
    Action7.ClassName; { Action7: TAction; }
    Action8.ClassName; { Action8: TAction; }
    Action9.ClassName; { Action9: TAction; }
    Action10.ClassName; { Action10: TAction; }
    Action11.ClassName; { Action11: TAction; }
    Action12.ClassName; { Action12: TAction; }
    Action13.ClassName; { Action13: TAction; }
    Action14.ClassName; { Action14: TAction; }
    Action15.ClassName; { Action15: TAction; }
    Action16.ClassName; { Action16: TAction; }
    Action17.ClassName; { Action17: TAction; }
    Action18.ClassName; { Action18: TAction; }
    Action19.ClassName; { Action19: TAction; }
    Action20.ClassName; { Action20: TAction; }
    Action21.ClassName; { Action21: TAction; }
    Action22.ClassName; { Action22: TAction; }
    Action23.ClassName; { Action23: TAction; }
    Action24.ClassName; { Action24: TAction; }
    Action25.ClassName; { Action25: TAction; }
    Action26.ClassName; { Action26: TAction; }
    Action27.ClassName; { Action27: TAction; }
    Action28.ClassName; { Action28: TAction; }
    Action29.ClassName; { Action29: TAction; }
    Action30.ClassName; { Action30: TAction; }
    Action31.ClassName; { Action31: TAction; }
    Action32.ClassName; { Action32: TAction; }
    Action33.ClassName; { Action33: TAction; }
    Action34.ClassName; { Action34: TAction; }
    Action35.ClassName; { Action35: TAction; }
    Action36.ClassName; { Action36: TAction; }
    Action37.ClassName; { Action37: TAction; }
    Action38.ClassName; { Action38: TAction; }
    Action39.ClassName; { Action39: TAction; }
    Action40.ClassName; { Action40: TAction; }
    Action41.ClassName; { Action41: TAction; }
    Action42.ClassName; { Action42: TAction; }
    Action43.ClassName; { Action43: TAction; }
    Action44.ClassName; { Action44: TAction; }
    Action45.ClassName; { Action45: TAction; }
    Action46.ClassName; { Action46: TAction; }
    Action47.ClassName; { Action47: TAction; }
    Action48.ClassName; { Action48: TAction; }
    Action49.ClassName; { Action49: TAction; }
    Action50.ClassName; { Action50: TAction; }
    Action51.ClassName; { Action51: TAction; }
    Action52.ClassName; { Action52: TAction; }
    Action53.ClassName; { Action53: TAction; }
    Action54.ClassName; { Action54: TAction; }
    Action55.ClassName; { Action55: TAction; }
    Action56.ClassName; { Action56: TAction; }
    Action57.ClassName; { Action57: TAction; }
    Action58.ClassName; { Action58: TAction; }
  end;

{ frmRealDialog: TfrmRealDialog }
  with TfrmRealDialog(nil) do { uuRealDialog.pas }
  begin
    pnFundo.ClassName; { pnFundo: TPanel; }
    pnTitulo.ClassName; { pnTitulo: TPanel; }
    lblTitulo.ClassName; { lblTitulo: TLabel; }
    pnMemo.ClassName; { pnMemo: TPanel; }
    pnImagem.ClassName; { pnImagem: TPanel; }
    img.ClassName; { img: TImage; }
    Panel3.ClassName; { Panel3: TPanel; }
    Panel4.ClassName; { Panel4: TPanel; }
    pnPergunta.ClassName; { pnPergunta: TPanel; }
    btSim.ClassName; { btSim: TAdvGlassButton; }
    btNao.ClassName; { btNao: TAdvGlassButton; }
    pnOk.ClassName; { pnOk: TPanel; }
    btOk.ClassName; { btOk: TAdvGlassButton; }
    Panel1.ClassName; { Panel1: TPanel; }
    memoMensagem.ClassName; { memoMensagem: TMemo; }
    tmApaga.ClassName; { tmApaga: TTimer; }
    tmAcende.ClassName; { tmAcende: TTimer; }
    JvImageList1.ClassName; { JvImageList1: TJvImageList; }
  end;

end;

end.
