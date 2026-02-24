unit uu_modelo_vazio;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  PngSpeedButton, System.TypInfo, IBX.IBQuery, dateutils, Dialogs, StdCtrls,
  ExtCtrls, mask, dbctrls, Buttons, DB, AdvGlassButton, DBGrids, wininet,
  CurvyControls, ACBrUtil, RxCurrEdit, FireDAC.Comp.Client, StrUtils,
  Vcl.ActnList, Vcl.DialogMessage, RealFramework, JvControlActions, RxToolEdit,
  JvPageList, JvExControls, JvActionsEngine, System.Actions, cxCheckBox,
  cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxContainer,
  cxEdit, cxTextEdit, cxMaskEdit, cxDropDownEdit, cxCheckComboBox,
  cxDBLookupComboBox, Vcl.ComCtrls, AdvDateTimePicker, JvButton,
  JvTransparentButton, cxStyles, cxDataStorage, cxNavigator, cxDBData, cxClasses,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxGrid, Vcl.Menus;

type
  TSelecaoComboPesquisa = class
    selecionadas: string;
    qtd: integer;
  end;

  TCamposComboPesquisa = class
    cpCodigo: string;
    cpDescricao: string;
    MensagemTodos: string;
    MensagemErro: string;
  end;

  tTipoComboPesquisa = (tiTabelaPrecos, tiUsuariosCaixa, tiFormasPagamento, tiEmpresas, tiAdquirentes, tiFornecedoresRazao, tiFornecedoresNomeFantasia);

  Tfrm_modelo_vazio = class(TForm)
    Edit1: TEdit;
    botao_pesquisa: TSpeedButton;
    cliques: TActionList;
    actPesquisaFormaPagamento: TControlAction;
    actExitFormaPagamento: TAction;
    actlBusca: TJvControlActionList;
    ACTF2ed_cod_grupo_fornecedor: TAction;
    ACTF2ed_cod_fornecedor: TAction;
    ACTF2edCodBairro: TAction;
    ACTF2ed_cod_tipo_documento: TAction;
    ACTF2ed_cod_tipo_entrada: TAction;
    ACTF2ed_cfop: TAction;
    ACTF2edCfopTransferencia: TAction;
    ACTF2edCfopDevolucao: TAction;
    ACTF2edCodTipoItemSped: TAction;
    ACTF2edCodNCM: TAction;
    ACTF2edCodGeneroItem: TAction;
    ACTF2ed_cefop_entradas: TAction;
    ACTF2ed_cefop_saidas: TAction;
    ACTF2ed_cod_modelo_nota_fiscal: TAction;
    ACTF2edCodSituacaoDocFiscal: TAction;
    ACTF2ed_cst: TAction;
    ACTF2edCstSaida: TAction;
    ACTF2edCstTransferencia: TAction;
    ACTF2edCstDevolucao: TAction;
    ACTF2edCstPisCofins: TAction;
    ACTF2ed_cod_usuario: TAction;
    ACTF2ed_cod_grupo: TAction;
    ACTF2edCodGrupoRD: TAction;
    ACTF2ed_cod_historico: TAction;
    ACTF2ed_cod_cidade: TAction;
    ACTF2edCodGrupoTouch: TAction;
    ACTF2ed_cod_estado: TAction;
    ACTF2ed_cod_centro_custo: TAction;
    ACTF2ed_cod_item: TAction;
    ACTF2ed_cod_item_saida: TAction;
    ACTF2edCodSubmateria: TAction;
    ACTF2edCodTipoBaixaEstoque: TAction;
    ACTF2ed_cod_barras_item: TAction;
    ACTF2ed_cod_un_entrada: TAction;
    ACTF2ed_cod_un_saida: TAction;
    ACTF2edCodSaborPizza: TAction;
    ACTF2edCodUnFracao: TAction;
    ACTF2edCodUnPadrao: TAction;
    ACTF2ed_cod_garcon: TAction;
    ACTF2edCodPromoter: TAction;
    ACTF2edCodDepartamento: TAction;
    ACTF2edCodGuarnicao: TAction;
    ACTF2ed_cod_metre: TAction;
    ACTF2ed_cod_tipo_cliente: TAction;
    ACTF2ed_cod_cliente: TAction;
    ACTF2ed_cod_cliente_reduzido: TAction;
    ACTF2edRgCliente: TAction;
    ACTF2ed_cod_mini_printer: TAction;
    ACTF2edTelClienteDelivery: TAction;
    ACTF2edCodBarrasProduto: TAction;
    ACTF2edCodProduto: TAction;
    edCodPizza: TAction;
    ACTF2edCodAliquota: TAction;
    ACTF2edCodFormaPagamento: TAction;
    ACTF2edCodLoja: TAction;
    ACTF2edCodCliDelivery: TAction;
    ACTF2edCodEntregador: TAction;
    actExportaExcel: TAction;
    popMenuExportacaoGrid: TPopupMenu;
    tmExportarExcel: TMenuItem;
    tmExportarHTML: TMenuItem;
    tmExportarCSV: TMenuItem;
    tmExportarTXT: TMenuItem;
    tmExportarXML: TMenuItem;
    procedure Edit1KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure exibe_painel_erro(mensagem: string; captionBotao: string);
    procedure botao_pesquisaClick(Sender: TObject);
    procedure Edit1Exit(Sender: TObject);
    procedure Edit1Enter(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    function ValidarChaveNFe(const ChaveNFe: string): boolean;
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    function iniciarOperacaoComTEF(): boolean;
    function VerificaConexaoInternet: boolean;
    procedure clickControlCurvyExecute(Sender: TObject);
    procedure pesquisaFormaPagamento(Sender: TObject);
    procedure actExitFormaPagamentoExecute(Sender: TObject);
    function validaValorPagamento(Sender: TObject): boolean;
    function validaQuantidade(Sender: TObject): boolean;
    procedure bloqueiaMesa(mesa: string);
    function KeyIsDown(const Key: integer): boolean;
    function verificaSeProdutoPodeSerVendido(codProduto: string; tipo: smallint): boolean;
    function verificaSeProdutoTemAdicionaisFixos(ACodProduto: string): Boolean;
    procedure AtualizaLabelsTabelaPreco;
    procedure ACTF2ed_cod_grupo_fornecedorExecute(Sender: TObject);
    procedure ACTF2ed_cod_fornecedorExecute(Sender: TObject);
    procedure ACTF2edCodBairroExecute(Sender: TObject);
    procedure ACTF2ed_cod_tipo_documentoExecute(Sender: TObject);
    procedure ACTF2ed_cod_tipo_entradaExecute(Sender: TObject);
    procedure ACTF2ed_cfopExecute(Sender: TObject);
    procedure ACTF2edCfopTransferenciaExecute(Sender: TObject);
    procedure ACTF2edCfopDevolucaoExecute(Sender: TObject);
    procedure ACTF2edCodTipoItemSpedExecute(Sender: TObject);
    procedure ACTF2edCodNCMExecute(Sender: TObject);
    procedure ACTF2edCodGeneroItemExecute(Sender: TObject);
    procedure ACTF2ed_cefop_entradasExecute(Sender: TObject);
    procedure ACTF2ed_cefop_saidasExecute(Sender: TObject);
    procedure ACTF2ed_cod_modelo_nota_fiscalExecute(Sender: TObject);
    procedure ACTF2edCodSituacaoDocFiscalExecute(Sender: TObject);
    procedure ACTF2ed_cstExecute(Sender: TObject);
    procedure ACTF2edCstSaidaExecute(Sender: TObject);
    procedure ACTF2edCstTransferenciaExecute(Sender: TObject);
    procedure ACTF2edCstDevolucaoExecute(Sender: TObject);
    procedure ACTF2edCstPisCofinsExecute(Sender: TObject);
    procedure ACTF2ed_cod_usuarioExecute(Sender: TObject);
    procedure ACTF2ed_cod_grupoExecute(Sender: TObject);
    procedure ACTF2ed_cod_historicoExecute(Sender: TObject);
    procedure ACTF2ed_cod_cidadeExecute(Sender: TObject);
    procedure ACTF2edCodGrupoTouchExecute(Sender: TObject);
    procedure ACTF2ed_cod_estadoExecute(Sender: TObject);
    procedure ACTF2ed_cod_centro_custoExecute(Sender: TObject);
    procedure ACTF2ed_cod_itemExecute(Sender: TObject);
    procedure ACTF2ed_cod_item_saidaExecute(Sender: TObject);
    procedure ACTF2edCodSubmateriaExecute(Sender: TObject);
    procedure ACTF2edCodTipoBaixaEstoqueExecute(Sender: TObject);
    procedure ACTF2ed_cod_barras_itemExecute(Sender: TObject);
    procedure ACTF2ed_cod_un_entradaExecute(Sender: TObject);
    procedure ACTF2ed_cod_un_saidaExecute(Sender: TObject);
    procedure ACTF2edCodSaborPizzaExecute(Sender: TObject);
    procedure ACTF2edCodUnFracaoExecute(Sender: TObject);
    procedure ACTF2edCodUnPadraoExecute(Sender: TObject);
    procedure ACTF2ed_cod_garconExecute(Sender: TObject);
    procedure ACTF2edCodPromoterExecute(Sender: TObject);
    procedure ACTF2edCodDepartamentoExecute(Sender: TObject);
    procedure ACTF2ed_cod_metreExecute(Sender: TObject);
    procedure ACTF2ed_cod_tipo_clienteExecute(Sender: TObject);
    procedure ACTF2ed_cod_clienteExecute(Sender: TObject);
    procedure ACTF2ed_cod_cliente_reduzidoExecute(Sender: TObject);
    procedure ACTF2edRgClienteExecute(Sender: TObject);
    procedure ACTF2ed_cod_mini_printerExecute(Sender: TObject);
    procedure ACTF2edTelClienteDeliveryExecute(Sender: TObject);
    procedure ACTF2edCodBarrasProdutoExecute(Sender: TObject);
    procedure ACTF2edCodProdutoExecute(Sender: TObject);
    procedure edCodPizzaExecute(Sender: TObject);
    procedure ACTF2edCodAliquotaExecute(Sender: TObject);
    procedure ACTF2edCodFormaPagamentoExecute(Sender: TObject);
    procedure ACTF2edCodLojaExecute(Sender: TObject);
    procedure ACTF2edCodCliDeliveryExecute(Sender: TObject);
    procedure ACTF2edCodEntregadorExecute(Sender: TObject);
    function verificaValidadeDatas(ADataInicial, ADataFinal: TDate): boolean;
    procedure carregaComboAnos(AComboAno: TComboBox);
    procedure carregaComboMeses(AComboMeses: TComboBox);
    procedure configuraOpcoesData(ARDEscolhido: TRadioButton; AEdDataInicial, AEdDataFinal: TAdvDateTimePicker; AComboMes, AComboAno: TCombobox);
    procedure configuraDataSelecaoPorMes(AComboMes, AComboAno: TComboBox; AEdDataInicial, AEdDataFinal: TAdvDateTimePicker);
    procedure tmExportarCSVClick(Sender: TObject);
    procedure tmExportarHTMLClick(Sender: TObject);
    procedure tmExportarExcelClick(Sender: TObject);
    procedure tmExportarXMLClick(Sender: TObject);
    procedure tmExportarTXTClick(Sender: TObject);
  strict protected
    evento: integer;
  private
    FOnEnterAnonymous: TProc<TObject>;
    cxGridTrabalho: TcxGrid;
    procedure ExibeInformacoesSubProduto(ACodProduto: string);
    function validarNumeroDaMesa(ANumeroMesa: string): Boolean;
    procedure getFornecedoresRazao(ATabela: TFDMemtable);
    procedure getFornecedoresNomeFantasia(ATabela: TFDMemtable);
    procedure PesquisaProdutoCloneFichaTecnica;
    procedure geraTabelaEmpresasSelecionadas(ACombo: TcxCheckComboBox; ASelecaoCombo: TSelecaoComboPesquisa; ATipoCombo: tTipoComboPesquisa);
    procedure AddExportMenuToGrids(AForm: TForm);
    function FindParentGrid(GridView: TcxGridDBTableView): TcxGrid;
    procedure FindGridViews(Grid: TcxGrid; ViewList: TList);
    function FindMenuItem(Items: TMenuItem; Caption: string): TMenuItem;
    procedure GridOnEnter(Sender: TObject);
    function ClonarItemMenu(const Src: TMenuItem; const DestOwner: TComponent): TMenuItem;


    { Private declarations }

  public
    { Public declarations }
    procedure getFormasPagamento(ATabela: TFDMemtable);
    procedure getAdquirentes(ATabela: TFDMemtable);
    procedure getEmpresas(ATabela: TFDMemtable);
    procedure getUsuariosCaixa(ATbUsuarios: TFDMemtable);
    procedure getTabelasDePrecos(ATbPrecos: TFDMemtable);
    procedure getDescricaoCampos(ATipoCombo: tTipoComboPesquisa; ACamposPesquisa: TCamposComboPesquisa);
    procedure carregaDadosCombo(ACombo: TcxCheckComboBox; ATipoCombo: tTipoComboPesquisa);
    procedure getSelecaoCombo(ACombo: TcxCheckComboBox; ASelecaoCombo: TSelecaoComboPesquisa; ATipoCombo: tTipoComboPesquisa);
    procedure getTabelaCombo(ATbAux: TFDMemtable; ATipoCombo: tTipoComboPesquisa; ACamposPesquisa: TCamposComboPesquisa);
    function TrataItemSelecionadoCombo(AItemTag: integer; ATipoCombo: tTipoComboPesquisa): string;
    procedure configuraOnClickCheckCombo(Sender: TObject; ItemIndex: Integer; var AllowToggle: Boolean);
    procedure exibeInformacoes(componenteChavePesquisa: string; componenteRecebeRetorno: string; tabela: string; campos: string; cp_pesq: string; param_pesq: string; cp_ret: integer);
//    function getValorProduto(ACodProduto: string): double;

    // Procedimentos de chamadas para pesquisa
    procedure setTipoNotaFiscalSaida(tipo: smallint);
    procedure pesquisaGrupo();
    procedure pesquisaFornecedor;
    procedure pesquisaGrupoFornecedor;
    procedure pesquisaHistorico;
    procedure pesquisaCidade;
    procedure pesquisaEstado();
    procedure pesquisaCentroDeCusto;
    procedure pesquisaItemEstoque;
    procedure pesquisaSubProduto();
    procedure pesquisaUnidadeEntrada;
    procedure pesquisaUnidadeSaida;
    procedure pesquisaSaborPizza;
    procedure pesquisaUnidadeDeFracao;
    procedure pesquisaUnidadePadrao;
    procedure pesquisaGarcon();
    procedure pesquisaPromoter;
    procedure pesquisaDepartamento();
    procedure pesquisaMetre();
    procedure pesquisaEntregador();
    procedure pesquisaMetreGarcon();
    procedure pesquisaTipoSangria;
    procedure pesquisaMotivoEstorno();
    procedure pesquisaObsPreparo();
    procedure pesquisaGrupoTouch();
    procedure pesquisaTipoBaixaEstoque();
    procedure pesquisaFormaPagto();
    procedure pesquisaLojas();
    procedure pesquisaTipoDeCliente();
    procedure pesquisaCliente();
    procedure pesquisaClienteReduzido();
    procedure pesquisaClienteDelivery();
    function verificaExistenciaClienteDeliveryPorTelefone(telefone: string): boolean;
    procedure pesquisaMiniPrinter();
    procedure pesquisaTiposDocumento();
    procedure pesquisaBairro();
    procedure pesquisaTiposEntrada();
    procedure pesquisaCFOP(tipo: integer);
    procedure pesquisaTipoItemSPED;
    procedure pesquisaNCM;
    procedure pesquisaGeneroItem;
    procedure pesquisaModeloNotaFiscal();
    procedure pesquisaSituacaoDocumentoFiscal();
    procedure pesquisaCST();
    procedure pesquisaCSTPisCofins();
    procedure pesquisaEntradas();
    procedure consultaContasAPagar();
    procedure pesquisaSaidas();
    procedure pesquisaUsuarios();
    procedure pesquisaProdutosCardapio();
    procedure pesquisaProdutosGeral();
    procedure pesquisaProdutoPizza(tamanhoPizza: string; moduloVenda: string);
    procedure pesquisaReg60M();
    procedure pesquisaAliquota();


    // Funções de verificação de existência
    function verificaDatas(data_inicial: string; data_final: string): boolean;
    function verificaSeNumeroInteiro(numero: double): boolean;
    function verificaExistenciaProdutoCodigosEntrada(cod_fornecedor: string; cod_produto: string): Boolean;
    function verificaExistenciaGrupo(cod_grupo: string): boolean;
    function verificaExistenciaGrupoRD(codGrupoRD: string): boolean;
    function verificaExistenciaBairro(codBairro: string): boolean;
    function verificaExistenciaMiniPrinter(cod_miniPrinter: string): boolean;
    function verificaExistenciaPedidoDelivery(codPedido: string): boolean;
    function verificaStatusPedidoDelivery(codPedido: string): smallint;
    function verificaExistenciaCidade(cod_cidade: string): boolean;
    function verificaExistenciaEstado(cod_estado: string): boolean;
    function verificaExistenciaFornecedor(cod_fornecedor: string): boolean;
    function verificaExistenciaFornecedorCNPJ(cnpjFornecedor: string): boolean;
    function verificaSeCaixaEstaAberto(codCaixa: string): boolean;
    function verificaSeCaixaCobraServico(codCaixa: string): boolean;
    function verificaExistenciaHistorico(cod_historico: string): boolean;
    function verificaExistenciaCentroDeCusto(cod_c_custo: string): boolean;
    function verificaExistenciaGrupoFonecedor(cod_grupo_fornecedor: string): boolean;
    function verificaExistenciaSaborPizza(codSabor: string): boolean;
    function verificaExistenciaItemEstoque(cod_item: string; campo: integer): boolean;
    function verificaExistenciaSubmateria(cod_item: string; campo: integer): boolean;
    function verificaExistenciaTipoBaixaEstoque(codTipo: string): boolean;
    function verificaExistenciaContaApagar(codConta: string): boolean;
    function getStatusContaApagar(codConta: string): smallint;
    function getAliasEmpresaGrupo(codEmpresa: string): string;
    function verificaExistenciaClienteDelivery(codCli: string): boolean;
    function verificaEquivalenciaUnidades(cod_un1: string; cod_un2: string): boolean;
    function verificaExistenciaUnidade(cod_unidade: string): boolean;
    function verificaExistenciaGarconMetre(cod_garcon: string): boolean;
    function verificaExistenciaGrupoTouch(codGrupo: string): boolean;
    function verificaExistenciaPromoter(codPromoter: string): boolean;
    function verificaExistenciaDepartamento(codDepartamento: string): boolean;
    function verificaExistenciaGuarnicao(codGuarnicao: string): boolean;
    function verificaExistenciaEntregador(codEntregador: string): boolean;
    function verificaExistenciaMetre(cod_garcon: string): boolean;
    function verificaExistenciaTipoSangria(codTipo: string): boolean;
    function verificaExistenciaMotivoEstorno(codMotivo: string): boolean;
    function verificaExistenciaObservacaoPreparo(codObs: string): boolean;
    function verificaExistenciaTipoDeBaixa(codTipo: string): boolean;
    function verificaExistenciaFormaPagto(cod_forma: string): boolean;
    function getDescricaoFormaPagamento(codForma: string): string;
    function getCodigoRegistradorFormaPagamento(cod_forma: string): string;
    function verificaExistenciaLoja(codLoja: string): boolean;
    function verificaExistenciaTipoDeCliente(cod_tipo_cliente: string): boolean;
    function verificaExistenciaCliente(cod_cliente: string): boolean;
    function verificaExistenciaClienteRG(rg: string): boolean;
    function verificaExistenciaTipoDocumento(cod_tipo_documento: string): boolean;
    function verificaExistenciaTipoEntrada(cod_tipo_entrada: string): boolean;
    function verificaExistenciaCFOP(CFOP: string): boolean;
    function verificaExistenciaTipoItemSPED(codigo: string): boolean;
    function verificaExistenciaNCM(codigo: string): boolean;
    function verificaExistenciaGeneroItem(codigo: string): boolean;
    function verificaExistenciaModeloNotaFiscal(codModelo: string): boolean;
    function verificaExistenciaSituacaoDocumentoFiscal(codSituacao: string): boolean;
    function verificaExistenciaCST(CST: string): boolean;
    function verificaExistenciaCSTPISCofins(CST: string): boolean;
    function verificaExistenciaEntrada(cod_entrada: string): boolean;
    function verificaExistenciaSaida(cod_saida: string): boolean;
    function verificaExistenciaReceita(codReceita: string): boolean;
    function verificaExistenciaUsuario(cod_usuario: string): boolean;
    function verificaExistenciaProduto(codProduto: string; tipo: smallint): boolean;
    function verificaSeProdutoVendeFracionado(codProduto: string; tipo: smallint): boolean;
    function verificaSeProdutoCalculaQtde(codProduto: string; tipo: smallint): boolean;
    function verificaSeProdutoLeQuantidadeDaBalanca(codigo: string; tipoCodigo: smallint): boolean;
    function getBalancaLeitura(codigo: string; tipoCodigo: smallint): smallint;
    function verificaSeProdutoEhPizza(codigo: string; tipoCodigo: smallint): boolean;
    function verificaSeProdutoRequerObservacao(codigo: string; tipoCodigo: smallint): boolean;
    function verificaProdutoDigitaPreco(codBarrasProduto: string): boolean;
    function verificaExistenciaReg60A(codReg: string): boolean;
    function verificaExistenciaReg60M(codReg: string): boolean;
    function verificaExistenciaAliquota(codAliquota: string): boolean;
    function verificaExistenciaFormaDePagamento(codForma: string): boolean;
    function verificaExistenciaCartao(cartao: string): boolean;
    function verificaSeCartaoCobraServico(cartao: string): boolean;


    // Funções de outras verificações
    function verificaExistenciaRecebimentosParciais(mesa: string): boolean;
    function verificaExistenciaFatura(cod_fatura: string): boolean;
    function verificaClienteAtivo(cod_cliente: string): boolean;
    function verificaFormaPagamentoFaturada(cod_forma: string): boolean;
    function verificaClienteTemCredito(cod_cliente: string; valor_pleiteado: double): boolean;
    function verificaCentroDeCustoAnalitico(cod_c_custo: string): boolean;
    function verificaProdutoRequerObservacao(cod_produto: string): boolean;
    function verificaProdutoRequerInformacaoSabor(cod_produto: string): boolean;
    function verificaFaturaBaixada(cod_fatura: string): boolean;
    function verificaMesaTemExtrato(mesa: string): boolean;
    function getEstadoCartao(cartao: string): integer;
    function verificaStatusCartao(cartao: string): boolean;
    function verificaStatusCartaoParaLiberacao(cartao: string): boolean;
    function verificaStatusCartaoNoCheckin(cartao: string): boolean;
    function verificaSeCartaoEstaSendoUtilizado(cartao: string): boolean;
    function verificaSeClienteEstaNaCasa(codCliente: string): boolean;
    function verificaSeExisteCouvertNaConta(mesa: string): boolean;
    function verificaNotaFiscalJaFoiLancada(codFornecedor: string; numeroNota: string; modeloNota: string): boolean;
    function verificaNotaFiscalSaidaJaFoiLancada(numeroNota: string; modelo: string): boolean;
    function verificaNotaFiscalConsumidorJaFoiLancada(numeroNota: string): boolean;
    function verificaExistenciaNotaTransportadora(codigoEntrada: string): boolean;
    function verificaSeUsaCodGarcon(): Boolean;
    function verificaSeCobraServico(): boolean;

    //Getters
    function getCNPJFornecedor(cod_fornecedor: string): string;
    function getCodFornecedorViaCNPJ(cnpj: string): string;
    function getCodOperadorCaixa(codCaixa: string): string;
    function getHoraAberturaCaixa(codCaixa: string): TTime;
    function getHoraFechamentoCaixa(codCaixa: string): Ttime;
    function getNomeOperadorCaixa(codCaixa: string): string;
    function getDataSistemaCaixa(codCaixa: string): Tdate;
    function getTotalSuprimentosCaixa(codCaixa: string): double;
    function getTotalSangriasCaixa(codCaixa: string): Double;
    function getTotalPendurasRecebidasCaixa(codCaixa: string): Double;
    function getTotalTaxaServicoCaixa(codCaixa: string): Double;
    function getValorProdutosMesa(mesa: string): double;
    function getValorPizza(codigo: string; tipoCodigo: integer; tipoVenda: integer): double;
    function getPrazoCliente(cod_cliente: string): integer;
    function getNomeCliente(codCliente: string): string;
    function getEnderecoCliente(codCliente: string): string;
    function getTelefoneCliente(codCliente: string): string;
    function getNomeClienteUsandoCartao(cartao: string): string;
    function getCodClienteUsandoCartao(cartao: string): string;
    function getParametroUnidade(cod_unidade: string): double;
    function getUnidadeEntradaItem(cod_item: string): string;
    function getPermissaoDeTroco(codForma: string): boolean;
    function getTipoTEFFormaPagato(codForma: string): smallint;

//    function  efetuaPagamentoTEFCappta(tipoOperacao : smallint; valorDaOperacao : double ) : boolean;
//    function   iterarOperacaoTEFCappta() : boolean;
 //   procedure exibeMensagemTef( mensagem : string ; tipoMensagem : smallint);
//    procedure requisicaoParametrosCappta(requisicaoParametros: IRequisicaoParametro);
//    procedure  ConfirmaOperacaoTEFCappta();

    function getCodProduto(codBarrasProduto: string): string;
    function getCodProdutoTabelaPrecos(codigo: string): string;
    function getDescricaoProduto(codProduto: string; tipo: smallint): string;
    function getUnidadeMedidaECF(codProduto: string; tipo: smallint): string;
    function getCodNovoProduto(): string;
    function getCodMiniPrinterProduto(codBarrasProduto: string): string;

//    function getValorProdutoTabelaPrecos(codigo: string): double;
    function getNomeGarcon(cod_garcon: string): string;
    function getTipoCFOP(CFOP: string): integer;


    // Validações PAF-ECF
    function getNumeroECFEmUso(numero_serie: string): string;
    procedure SelecionaECFEmUso(numero_serie: string);
    function verificaExistenciaArquivoAuxiliarPAF(caminhoArquivoAuxiliar: string): boolean;
    function getPastaSistemaWindows: string;
    function Converte(cmd: string): string;
    function getValorTxEntregaBairro(codBairro: string): double;
    function getValorTxEntregaPedido(codPedido: string): double;
    function getEstoqueAtualItemEstoque(cod_item: string): double;
    function getCodUnidadeEntradaItemEstoque(cod_item: string): string;
    function getCodEntradaNotaFiscal(codFornecedor: string; numeroNota: string): string;
    function getCodEntradaNotaFiscalSaida(numeroNota: string): string;
    function getcodClienteDeliveryPorTelefone(telefone: string): string;

    // Procedimentos de exibição de informações de consulta
    function verificaSeItemEhSubmateria(cod_item_estoque: string): boolean;
    procedure exibeInformacoesItemEstoque(cod_item_estoque: string; campo: integer);
    procedure exibeInformacoesItemSaida(cod_item_estoque: string; campo: integer);
    procedure exibeInformacoesTipoBaixaEstoque(codTipo: string);
    procedure exibeInformacoesUnidadeEntrada(cod_unidade_entrada: string);
    procedure exibeInformacoesUnidadeSaida(cod_unidade_saida: string);
    procedure exibeInformacoesSaborPizza(codSabor: string);
    procedure exibeInformacoesUnidadeDeFracao(codUnFracao: string);
    procedure exibeInformacoesFornecedor(cod_fornecedor: string);
    procedure exibeInformacoesFornecedorCNPJ(CNPJfornecedor: string);
    procedure exibeInformacoesBairro(codBairro: string);
    procedure exibeInformacoesTiposDocumento(cod_tipo_doc: string);
    procedure exibeInformacoesTiposEntrada(cod_tipo_entrada: string);
    procedure exibeInformacoesCFOP(CFOP: string);
    procedure exibeInformacoesTipoItemSPED(codigo: string);
    procedure exibeInformacoesNCM(codigo: string);
    procedure exibeInformacoesGeneroItem(codigo: string);
    procedure exibeInformacoesCFOPEntrada(CFOP: string);
    procedure exibeInformacoesCFOPSaida(CFOP: string);
    procedure exibeInformacoesCFOPDevolucao(CFOP: string);
    procedure exibeInformacoesCFOPTransferencia(CFOP: string);
    procedure exibeInformacoesModeloNotaFiscal(codModeloNota: string);
    procedure exibeInformacoesSituacaoDocumentoFiscal(codSituacao: string);
    procedure exibeInformacoesCST(CST: string);
    procedure exibeInformacoesCSTPisCofins(CST: string);
    procedure exibeInformacoesCST_saida(CST: string);
    procedure exibeInformacoesCSTDevolucoes(CST: string);
    procedure exibeInformacoesCSTTransferencias(CST: string);
    procedure exibeInformacoesUsuario(cod_usuario: string);
    procedure exibeInformacoesProduto(codProduto: string; tipo: integer);
    procedure exibeInformacoesProdutoPizza(codProdutoPizza: string; tamanhoPizza: string; moduloVenda: string);
    procedure exibeInformacoesAliquota(codAliquota: string);
    procedure exibeInformacoesFormaDePagamento(codForma: string);
    procedure exibeInformacoesLoja(codLoja: string);
    procedure exibeInformacoesClienteFaturamento(codCli: string);
    procedure exibeInformacoesClienteDelivery(codCli: string);
    procedure exibeInformacoesClienteBoateRG(rgCliente: string);
    procedure exibeInformacoesGarcons(codGarcon: string);
    procedure exibeInformacoesPromoter(codPromoter: string);
    procedure exibeInformacoesDepartamento(codDepartamento: string);
    procedure exibeInformacoesGuarnicao(codGuarnicao: string);
    procedure exibeInformacoesGrupoTouch(codGrupoTouch: string);
    procedure exibeInformacoesEntregador(codEntregador: string);
    procedure exibeInformacoesGrupos(codGrupo: string);
    procedure exibeInformacoesGruposRD(codGrupoRD: string);
    procedure exibeInformacoesCentroCusto(codConta: string);
    procedure exibeInformacoesEstado(cod_estado: string);
    function getUFEstado(cod_estado: string): string;
    function getCodEstadoUF(UF: string): string;
    procedure imprimirBorderoContasApagar(codConta: string);
    procedure copiaValoresComponentes();
    procedure retornaValoresComponentes();

    procedure CopiarPopupMenuItens(const Source, Dest: TPopupMenu); overload;
    procedure CopiarPopupMenuItens(const Source, Dest: TPopupMenu; ClearDest: Boolean); overload;
  end;

var
  frm_modelo_vazio: Tfrm_modelo_vazio;
  tipoNotaFiscalSaida: SmallInt;

implementation

uses
  uu_cs_historicos, uu_cs_grupos_fornecedores, uu_frm_principal, uu_cs_cidades,
  uu_data_module, uu_cs_fornecedores, uu_cs_item_estoque, uu_cs_unidades,
  uu_cs_garcons, uu_cs_formas_pagto, uu_cs_tipos_cliente, uu_cs_clientes,
  uu_cs_mini_printer, uu_cs_tipos_documentos, uu_cs_tipos_entrada,
  uu_cs_usuarios, uu_cs_entradas, uu_cs_produtos, uu_cs_reg60A, uu_cs_aliquotas,
  uu_cs_clientes_reduzido, uuPesquisaClientesDelivery, uSelecionaGrupo,
  uuCsTiposSangria, uuCsMotivosEstorno, uuCsObservacoesPreparo,
  uuCsTiposBaixaEstoque, uu_cs_estados, uuCsCFOP, uuCsModeloNotaFiscal, uuCsCST,
  uuCsBairros, uuCsEntregradores, uucsSaboresPizza, uuPesqTipoItemSped, uuCsNCM,
  uuCsGeneroItemSPED, uuCsProdutosGeral, uuCsPlanoContas, uuCsNotasSaida,
  uuCsCSTPISCofins, uuCsLojas, UU_DM_RELATORIOS, uuCsDepartamentos,
  uuCsPromoters, uuCsSituacaoDocumento, uuCsGruposTouch, IBX.IBDatabase, Produto;

{$R *.dfm}

function Tfrm_modelo_vazio.validarNumeroDaMesa(ANumeroMesa: string): Boolean;
begin
  Result := false;

  try
    try
      ANumeroMesa := FormatFloat('0000', StrToFloat(ANumeroMesa));
      if StrToInt(ANumeroMesa) <= 0 then
        raise Exception.Create('Número de mesa inválido!');

      if StrToInt(ANumeroMesa) >= 4999 then
        raise Exception.Create('Número de mesa inválido!');

    except
      on E: Exception do
      begin
        raise Exception.Create('Número de mesa inválido!');
        Result := false;

      end;

    end;

  finally

  end;

end;

procedure Tfrm_modelo_vazio.Edit1KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
var
  i: integer;
  nomeComponente: string;
  achouComponente: boolean;
  tamanhoPizza: string;
  moduloVenda: string;
  ctAcoes: integer;
  acaoAtual: TAction;
begin

  nomeComponente := (Sender as TComponent).Name;

  if Key = VK_RETURN then
  begin
    if ((Sender is TMemo)) then
    begin
      if (trim((Sender as TMemo).Lines[0] + (Sender as TMemo).Lines[1] + (Sender as TMemo).Lines[2] + (Sender as TMemo).Lines[3]) = '') then
      begin
        Perform(WM_NEXTDLGCTL, 0, 0)
      end
    end
    else
    begin
      Perform(WM_NEXTDLGCTL, 0, 0)
    end

  end;

  if Key = vk_escape then
    Close;

  if Key = vk_f2 then
  begin
    acaoAtual := TAction(FindComponent('ACTF2' + nomeComponente));
    if acaoAtual <> nil then
      acaoAtual.Execute;
  end;

end;

procedure Tfrm_modelo_vazio.geraTabelaEmpresasSelecionadas(ACombo: TcxCheckComboBox; ASelecaoCombo: TSelecaoComboPesquisa; ATipoCombo: tTipoComboPesquisa);
var
  i: integer;
begin

  if ACombo.States[0] = cbsChecked then
  begin
    for i := 0 to ACombo.Properties.Items.Count - 1 do
      ACombo.States[i] := cbsChecked;
  end;

  ASelecaoCombo.selecionadas := TrataItemSelecionadoCombo(-1, ATipoCombo);
  ASelecaoCombo.qtd := 0;
  for i := 0 to ACombo.Properties.Items.Count do
  begin
    if ACombo.States[i] = cbsChecked then
    begin
      ASelecaoCombo.selecionadas := ASelecaoCombo.selecionadas + ',' + TrataItemSelecionadoCombo(ACombo.Properties.Items[i].Tag, ATipoCombo);
      ASelecaoCombo.qtd := ASelecaoCombo.qtd + 1;
    end;
  end;
end;

procedure Tfrm_modelo_vazio.getSelecaoCombo(ACombo: TcxCheckComboBox; ASelecaoCombo: TSelecaoComboPesquisa; ATipoCombo: tTipoComboPesquisa);
var
  i: integer;
begin

  if ACombo.States[0] = cbsChecked then
  begin
    for i := 0 to ACombo.Properties.Items.Count - 1 do
      ACombo.States[i] := cbsChecked;
  end;

  ASelecaoCombo.selecionadas := TrataItemSelecionadoCombo(-1, ATipoCombo);
  ASelecaoCombo.qtd := 0;
  for i := 0 to ACombo.Properties.Items.Count - 1 do
  begin
    if ACombo.States[i] = cbsChecked then
    begin
      ASelecaoCombo.selecionadas := ASelecaoCombo.selecionadas + ',' + TrataItemSelecionadoCombo(ACombo.Properties.Items[i].Tag, ATipoCombo);
      ASelecaoCombo.qtd := ASelecaoCombo.qtd + 1;
    end;
  end;

  case ATipoCombo of
    tiTabelaPrecos:
      ;
    tiUsuariosCaixa:
      ;
    tiFormasPagamento:
      ;
    tiEmpresas:
      dm.gerarEmpresasSelecionadas(ASelecaoCombo.selecionadas);
    tiAdquirentes:
      ;
    tiFornecedoresRazao:
      ;
    tiFornecedoresNomeFantasia:
      ;
  end;

end;

procedure Tfrm_modelo_vazio.carregaDadosCombo(ACombo: TcxCheckComboBox; ATipoCombo: tTipoComboPesquisa);
var
  it: TcxCheckComboBoxItem;
  LtbAux: TFDMemTable;
  LCampos: TCamposComboPesquisa;
begin
  LtbAux := TFDMemTable.Create(self);
  LCampos := TCamposComboPesquisa.Create;

  try
    try
      getTabelaCombo(LtbAux, ATipoCombo, LCampos);
      ACombo.Properties.Items.Clear;
      it := ACombo.Properties.Items.Add;
      it.tag := -1;
      it.Description := LCampos.MensagemTodos;
      ACombo.States[it.Index] := cbsChecked;

      LtbAux.First;
      while not LtbAux.eof do
      begin

        while not LtbAux.eof do
        begin
          it := ACombo.Properties.Items.Add;
          it.Tag := StrToInt(LtbAux.FieldByName(LCampos.cpCodigo).AsString);
          it.Description := LtbAux.FieldByName(LCampos.cpDescricao).Value;
          ACombo.States[it.Index] := cbsUnchecked;
          LtbAux.Next;
        end;
      end;
    except
      on E: Exception do
      begin
        dm.exibe_painel_erro(LCampos.MensagemErro, 'Ok');
      end;

    end;

  finally
    ACombo.Properties.OnClickCheck := configuraOnClickCheckCombo;
    LtbAux.Active := false;
    FreeAndNil(LtbAux);
    FreeAndNil(LCampos);
  end;
end;

procedure Tfrm_modelo_vazio.pesquisaReg60M();
var
  i: integer;
begin
  Application.CreateForm(TfrmCsReg60A, frmCsReg60A);
  frmCsReg60A.ShowModal;
  frmCsReg60A.Free;

  for i := 0 to ComponentCount - 1 do
  begin
    if (components[i].Name = 'ed_cod_reg60a') then
      (components[i] as TCustomEdit).text := string_auxiliar;

    if (components[i].Name = 'ed_cod_reg60a') then
      (components[i] as TCustomEdit).text := string_auxiliar2;
  end;

end;

procedure Tfrm_modelo_vazio.exibe_painel_erro(mensagem: string; captionBotao: string);
begin

  if TDialogMessage.ShowMessageDialog(mensagem, 'Atenção', mtError, ['Fechar'], 1, 1) = 1 then
  begin

  end;


{



  Application.CreateForm(Tfrm_painel_erros,frm_painel_erros);
  frm_painel_erros.Memo1.lines.add(mensagem);
//  frm_painel_erros.BitBtn1.Caption:=captionBotao;
  frm_painel_erros.Showmodal;
  FreeAndNil(frm_painel_erros);
  }

end;

procedure Tfrm_modelo_vazio.pesquisaAliquota();
var
  i: integer;
begin
  Application.CreateForm(TfrmCsAliquotas, frmCsAliquotas);
  frmCsAliquotas.ShowModal;
  frmCsAliquotas.Free;

  for i := 0 to ComponentCount - 1 do
  begin
    if (components[i].Name = 'edCodAliquota') then
      (components[i] as TCustomEdit).text := string_auxiliar;

    if (components[i].Name = 'edDescAliquota') then
      (components[i] as TCustomEdit).text := string_auxiliar2;
  end;

end;

procedure Tfrm_modelo_vazio.pesquisaGrupoFornecedor;
var
  i: integer;
begin
  Application.CreateForm(Tfrm_cs_grupos_fornecedores, frm_cs_grupos_fornecedores);
  frm_cs_grupos_fornecedores.showmodal;
  frm_cs_grupos_fornecedores.Free;
  for i := 0 to ComponentCount - 1 do
  begin
    if (components[i].Name = 'ed_cod_grupo_fornecedor') then
      (components[i] as TCustomEdit).text := string_auxiliar;

    if (components[i].Name = 'ed_desc_grupo_fornecedor') then
      (components[i] as TCustomEdit).text := string_auxiliar2;
  end;
end;

procedure Tfrm_modelo_vazio.pesquisaGrupo;
var
  i: integer;
begin
  Application.CreateForm(TfrmSelecionaGrupo, frmSelecionaGrupo);
  frmSelecionaGrupo.showmodal;
  frmSelecionaGrupo.Free;
  for i := 0 to ComponentCount - 1 do
  begin
    if (components[i].Name = 'ed_cod_grupo') then
      (components[i] as TCustomEdit).text := string_auxiliar;

    if (components[i].Name = 'ed_desc_grupo') then
      (components[i] as TCustomEdit).text := string_auxiliar2;
  end;
end;

procedure Tfrm_modelo_vazio.pesquisaFornecedor;
var
  i: integer;
begin
  Application.CreateForm(Tfrm_cs_fornecedores, frm_cs_fornecedores);
  frm_cs_fornecedores.showmodal;
  frm_cs_fornecedores.Free;
end;

procedure Tfrm_modelo_vazio.pesquisaHistorico;
var
  i: integer;
begin
  Application.CreateForm(Tfrm_cs_historicos_caixa, frm_cs_historicos_caixa);
  frm_cs_historicos_caixa.showmodal;
  frm_cs_historicos_caixa.Free;

  for i := 0 to ComponentCount - 1 do
  begin
    if (components[i].Name = 'ed_cod_historico') then
      (components[i] as TCustomEdit).text := string_auxiliar;

    if (components[i].Name = 'ed_desc_historico') then
      (components[i] as TCustomEdit).text := string_auxiliar2
  end;
end;

procedure Tfrm_modelo_vazio.pesquisaCidade;
var
  i: integer;
begin
  Application.CreateForm(Tfrm_cs_cidades, frm_cs_cidades);
  frm_cs_cidades.showmodal;
  frm_cs_cidades.Free;

  for i := 0 to ComponentCount - 1 do
  begin
    if (components[i].Name = 'ed_cod_cidade') then
      (components[i] as TCustomEdit).text := string_auxiliar;

    if (components[i].Name = 'ed_nome_cidade') then
      (components[i] as TCustomEdit).text := string_auxiliar2
  end;
end;

procedure Tfrm_modelo_vazio.pesquisaEstado();
var
  i: integer;
begin
  Application.CreateForm(TfrmCsEstados, frmCsEstados);
  frmCsEstados.ShowModal;
  frmCsEstados.free;

  for i := 0 to ComponentCount - 1 do
  begin
    if (components[i].Name = 'ed_cod_estado') then
      (components[i] as TCustomEdit).text := string_auxiliar;

    if (components[i].Name = 'ed_nome_estado') then
      (components[i] as TCustomEdit).text := string_auxiliar2
  end;
end;

procedure Tfrm_modelo_vazio.pesquisaCentroDeCusto;
var
  I: integer;
begin

  Application.CreateForm(Tfrm_cs_contas, frm_cs_contas);
  frm_cs_contas.showmodal;
  frm_cs_contas.Free;

  for I := 0 to ComponentCount - 1 do
  begin
    if (components[I].Name = 'ed_cod_centro_custo') then
      (components[I] as TCustomEdit).text := string_auxiliar;

    if (components[I].Name = 'ed_desc_c_custo') then
      (components[I] as TCustomEdit).text := string_auxiliar2
  end;

end;

procedure Tfrm_modelo_vazio.pesquisaUnidadeEntrada;
var
  I: integer;
begin

  Application.CreateForm(Tfrm_cs_unidades, frm_cs_unidades);
  frm_cs_unidades.showmodal;
  frm_cs_unidades.Free;

  for I := 0 to ComponentCount - 1 do
  begin
    if (components[I].Name = 'ed_cod_un_entrada') then
      (components[I] as TCustomEdit).text := string_auxiliar;

    if (components[I].Name = 'ed_desc_un_entrada') then
      (components[I] as TCustomEdit).text := string_auxiliar2
  end;

end;

procedure Tfrm_modelo_vazio.pesquisaGarcon;
var
  I: integer;
begin

  Application.CreateForm(Tfrm_cs_garcons, frm_cs_garcons);
  frm_cs_garcons.setTipoPesquisa(0);
  frm_cs_garcons.showmodal;
  frm_cs_garcons.Free;

  for I := 0 to ComponentCount - 1 do
  begin
    if (components[I].Name = 'ed_cod_garcon') then
      (components[I] as TCustomEdit).text := string_auxiliar;

    if (components[I].Name = 'ed_nome_garcon') then
      (components[I] as TCustomEdit).text := string_auxiliar2
  end;
end;

procedure Tfrm_modelo_vazio.pesquisaPromoter;
var
  I: integer;
begin
  Application.CreateForm(TfrmCsPromoters, frmCsPromoters);
  frmCsPromoters.showmodal;
  frmCsPromoters.Free;

  for I := 0 to ComponentCount - 1 do
  begin
    if (components[I].Name = 'edCodPromoter') then
      (components[I] as TCustomEdit).text := string_auxiliar;

    if (components[I].Name = 'edNomePromoter') then
      (components[I] as TCustomEdit).text := string_auxiliar2
  end;
end;

procedure Tfrm_modelo_vazio.pesquisaDepartamento();
var
  I: integer;
begin

  Application.CreateForm(TfrmCsDepartamentos, frmCsDepartamentos);
  frmCsDepartamentos.showmodal;
  frmCsDepartamentos.Free;

  for I := 0 to ComponentCount - 1 do
  begin
    if (components[I].Name = 'edCodDepartamento') then
      (components[I] as TCustomEdit).text := string_auxiliar;

    if (components[I].Name = 'edDescDepartamento') then
      (components[I] as TCustomEdit).text := string_auxiliar2
  end;
end;

procedure Tfrm_modelo_vazio.pesquisaTipoItemSPED;
var
  I: integer;
begin

  Application.CreateForm(TfrmPesqTipoItemSPED, frmPesqTipoItemSPED);
  frmPesqTipoItemSPED.showmodal;
  frmPesqTipoItemSPED.free;

  for I := 0 to ComponentCount - 1 do
  begin
    if (components[I].Name = 'edCodTipoItemSped') then
      (components[I] as TCustomEdit).text := string_auxiliar;

    if (components[I].Name = 'edDescTipoItemSped') then
      (components[I] as TCustomEdit).text := string_auxiliar2;
  end;
end;

procedure Tfrm_modelo_vazio.pesquisaNCM;
var
  I: integer;
begin

  Application.CreateForm(TfrmCsNCM, frmCsNCM);
  frmCsNCM.showmodal;
  frmCsNCM.free;

  for I := 0 to ComponentCount - 1 do
  begin
    if (components[I].Name = 'edCodNCM') then
      (components[I] as TCustomEdit).text := string_auxiliar;

    if (components[I].Name = 'edDescNCM') then
      (components[I] as TCustomEdit).text := string_auxiliar2;
  end;
end;

procedure Tfrm_modelo_vazio.pesquisaGeneroItem;
var
  I: integer;
begin

  Application.CreateForm(TfrmCsGeneroItemSPED, frmCsGeneroItemSPED);
  frmCsGeneroItemSPED.showmodal;
  frmCsGeneroItemSPED.free;

  for I := 0 to ComponentCount - 1 do
  begin
    if (components[I].Name = 'edCodGeneroItem') then
      (components[I] as TCustomEdit).text := string_auxiliar;

    if (components[I].Name = 'edDescGeneroItem') then
      (components[I] as TCustomEdit).text := string_auxiliar2;
  end;
end;

procedure Tfrm_modelo_vazio.pesquisaFormaPagto();
var
  I: integer;
  edCodForma: TComponent;
  edDescricaoForma: TComponent;
begin

  string_auxiliar := '';
  string_auxiliar2 := '';
  string_auxiliar3 := '';

  Application.CreateForm(Tfrm_cs_formas_pagto, frm_cs_formas_pagto);
  frm_cs_formas_pagto.showmodal;
  frm_cs_formas_pagto.Free;
  edCodForma := self.FindComponent('ed_codigo_forma');
  edDescricaoForma := self.FindComponent('edDescricaoForma');

  if edCodForma <> nil then
  begin
    case AnsiIndexStr((edCodForma.ClassName), ['TEdit', 'TCurvyEdit', 'TEdit']) of
      0:
        begin
          (edCodForma as TEdit).Text := string_auxiliar;
        end;
      1:
        begin
          (edCodForma as TCurvyEdit).Text := string_auxiliar;
        end;
    end;
  end;

  if edDescricaoForma <> nil then
  begin

    case AnsiIndexStr((edDescricaoForma.ClassName), ['TEdit', 'TCurvyEdit', 'TEdit']) of
      0:
        begin
          (edDescricaoForma as TEdit).Text := string_auxiliar2;
        end;
      1:
        begin
          (edDescricaoForma as TCurvyEdit).Text := string_auxiliar2;
        end;
    end;
  end;

end;

procedure Tfrm_modelo_vazio.pesquisaLojas();
var
  I: integer;
begin

  Application.CreateForm(TfrmCsLojas, frmCsLojas);
  frmCsLojas.ShowModal;
  frmCsLojas.free;

  for I := 0 to ComponentCount - 1 do
  begin
    if (components[I].Name = 'edCodLoja') then
      (components[I] as TCustomEdit).text := string_auxiliar;

    if (components[I].Name = 'edDescLoja') then
      (components[I] as TCustomEdit).text := string_auxiliar2
  end;
end;

procedure Tfrm_modelo_vazio.pesquisaTipoDeCliente();
var
  I: integer;
begin

  Application.CreateForm(Tfrm_cs_tipos_cliente, frm_cs_tipos_cliente);
  frm_cs_tipos_cliente.showmodal;
  frm_cs_tipos_cliente.Free;

  for I := 0 to ComponentCount - 1 do
  begin
    if (components[I].Name = 'ed_cod_tipo_cliente') then
      (components[I] as TCustomEdit).text := string_auxiliar;

    if (components[I].Name = 'ed_desc_tipo_cliente') then
      (components[I] as TCustomEdit).text := string_auxiliar2
  end;
end;

procedure Tfrm_modelo_vazio.pesquisaCliente();
var
  I: integer;
begin

  Application.CreateForm(Tfrm_cs_clientes, frm_cs_clientes);
  frm_cs_clientes.showmodal;
  frm_cs_clientes.Free;
end;

procedure Tfrm_modelo_vazio.pesquisaClienteReduzido();
var
  I: integer;
begin

  Application.CreateForm(TfrmPesquisaClienteReduzido, frmPesquisaClienteReduzido);
  frmPesquisaClienteReduzido.ShowModal;
  frmPesquisaClienteReduzido.Free;

  for I := 0 to ComponentCount - 1 do
  begin
    if (components[I].Name = 'ed_cod_cliente') then
      (components[I] as TCustomEdit).text := string_auxiliar;

    if (components[I].Name = 'edRgCliente') then
      (components[I] as TCustomEdit).text := string_auxiliar2

  end;
end;

procedure Tfrm_modelo_vazio.pesquisaClienteDelivery();
var
  I: integer;
  edCodCliDelivery: TComponent;
  edTelClienteDelivery: TComponent;
  edNomeClienteDelivery: TComponent;
begin
  string_auxiliar := '';
  string_auxiliar3 := '';
  string_auxiliar2 := '';

  Application.CreateForm(TfrmPesquisaClienteDelivery, frmPesquisaClienteDelivery);
  frmPesquisaClienteDelivery.ShowModal;
  frmPesquisaClienteDelivery.Free;

  edCodCliDelivery := self.FindComponent('edCodCliDelivery');
  edNomeClienteDelivery := self.FindComponent('edNomeClienteDelivery');
  edTelClienteDelivery := self.FindComponent('edTelClienteDelivery');

  if edCodCliDelivery <> nil then
  begin
    case AnsiIndexStr((edCodCliDelivery.ClassName), ['TEdit', 'TCurvyEdit', 'TEdit']) of
      0:
        begin
          (edCodCliDelivery as TEdit).Text := string_auxiliar;
        end;
      1:
        begin
          (edCodCliDelivery as TCurvyEdit).Text := string_auxiliar;
        end;
    end;
  end;

  if edNomeClienteDelivery <> nil then
  begin
    case AnsiIndexStr((edNomeClienteDelivery.ClassName), ['TEdit', 'TCurvyEdit', 'TEdit']) of
      0:
        begin
          (edNomeClienteDelivery as TEdit).Text := string_auxiliar2;
        end;
      1:
        begin
          (edNomeClienteDelivery as TCurvyEdit).Text := string_auxiliar2;
        end;
    end;
  end;

  if edTelClienteDelivery <> nil then
  begin
    case AnsiIndexStr((edTelClienteDelivery.ClassName), ['TEdit', 'TCurvyEdit', 'TEdit']) of
      0:
        begin
          (edTelClienteDelivery as TEdit).Text := string_auxiliar3;
        end;
      1:
        begin
          (edTelClienteDelivery as TCurvyEdit).Text := string_auxiliar3;
        end;
    end;
  end;

end;

procedure Tfrm_modelo_vazio.pesquisaMiniPrinter();
var
  I: integer;
begin

  Application.CreateForm(Tfrm_cs_miniprinters, frm_cs_miniprinters);
  frm_cs_miniprinters.showmodal;
  frm_cs_miniprinters.Free;

  for I := 0 to ComponentCount - 1 do
  begin
    if (components[I].Name = 'ed_cod_mini_printer') then
      (components[I] as TCustomEdit).text := string_auxiliar;

    if (components[I].Name = 'ed_desc_mini_printer') then
      (components[I] as TCustomEdit).text := string_auxiliar2
  end;
end;

procedure Tfrm_modelo_vazio.pesquisaTiposDocumento();
var
  I: integer;
begin

  Application.CreateForm(Tfrm_cs_tipos_documentos, frm_cs_tipos_documentos);
  frm_cs_tipos_documentos.showmodal;
  frm_cs_tipos_documentos.Free;
end;

procedure Tfrm_modelo_vazio.pesquisaBairro();
var
  I: integer;
begin

  Application.CreateForm(TfrmCsBairros, frmCsBairros);
  frmCsBairros.showmodal;
  frmCsBairros.free;
end;

procedure Tfrm_modelo_vazio.pesquisaTiposEntrada();
var
  I: integer;
begin

  Application.CreateForm(Tfrm_cs_tipos_entrada, frm_cs_tipos_entrada);
  frm_cs_tipos_entrada.showmodal;
  frm_cs_tipos_entrada.Free;
end;

procedure Tfrm_modelo_vazio.pesquisaCFOP(tipo: integer);
begin
  Application.CreateForm(TfrmCsCFOP, frmCsCFOP);
  frmCsCFOP.tipoCFOP := tipo;
  frmCsCFOP.showmodal;
  frmCsCFOP.free;
end;

procedure Tfrm_modelo_vazio.pesquisaModeloNotaFiscal();
begin
  Application.CreateForm(TfrmCsModeloNotaFiscal, frmCsModeloNotaFiscal);
  frmCsModeloNotaFiscal.showmodal;
  frmCsModeloNotaFiscal.free;
end;

procedure Tfrm_modelo_vazio.pesquisaSituacaoDocumentoFiscal();
begin
  Application.CreateForm(TfrmCsSituacaoDocumento, frmCsSituacaoDocumento);
  frmCsSituacaoDocumento.ShowModal;
  frmCsSituacaoDocumento.Free;
end;

procedure Tfrm_modelo_vazio.pesquisaCST();
begin
  Application.CreateForm(TfrmCsCST, frmCsCST);
  frmCsCST.showmodal;
  frmCsCST.free;
end;

procedure Tfrm_modelo_vazio.pesquisaCSTPisCofins();
begin
  Application.CreateForm(TfrmCsCSTPISCOFINS, frmCsCSTPISCOFINS);
  frmCsCSTPISCOFINS.showmodal;
  frmCsCSTPISCOFINS.free;
end;

procedure Tfrm_modelo_vazio.pesquisaSaidas();
var
  I: integer;
begin
  Application.CreateForm(TfrmCsNotasSaida, frmCsNotasSaida);
  frmCsNotasSaida.showmodal;
  frmCsNotasSaida.Free;
end;

procedure Tfrm_modelo_vazio.pesquisaEntradas();
begin
  Application.CreateForm(Tfrm_cs_entradas, frm_cs_entradas);
  frm_cs_entradas.showmodal;
  frm_cs_entradas.Free;
end;

procedure Tfrm_modelo_vazio.consultaContasAPagar();
begin
end;

procedure Tfrm_modelo_vazio.pesquisaUsuarios();
var
  I: integer;
begin
  Application.CreateForm(Tfrm_cs_usuarios, frm_cs_usuarios);
  frm_cs_usuarios.showmodal;
  frm_cs_usuarios.Free;
end;

procedure Tfrm_modelo_vazio.pesquisaProdutosCardapio();
var
  I: integer;
begin
  Application.CreateForm(Tfrm_consulta_produtos, frm_consulta_produtos);
  frm_consulta_produtos.ShowModal;
  frm_consulta_produtos.free;
end;

procedure Tfrm_modelo_vazio.pesquisaProdutosGeral();
var
  I: integer;
begin

  string_auxiliar := '';
  string_auxiliar2 := '';
  Application.CreateForm(TfrmCsProdutosGeral, frmCsProdutosGeral);
  frmCsProdutosGeral.showmodal;
  frmCsProdutosGeral.Free;

  for I := 0 to ComponentCount - 1 do
  begin
    if (components[I].Name = 'edCodProduto') then
      (components[I] as TCustomEdit).text := string_auxiliar;

    if (components[I].Name = 'ed_cod_item_saida') then
      (components[I] as TCustomEdit).text := string_auxiliar;

    if (components[I].Name = 'ed_desc_produto') then
      (components[I] as TCustomEdit).text := string_auxiliar2;

  end;

end;

procedure Tfrm_modelo_vazio.PesquisaProdutoCloneFichaTecnica();
begin
  string_auxiliar := '';
  string_auxiliar2 := '';
  Application.CreateForm(TfrmCsProdutosGeral, frmCsProdutosGeral);
  frmCsProdutosGeral.showmodal;
  frmCsProdutosGeral.Free;
end;

procedure Tfrm_modelo_vazio.pesquisaProdutoPizza(tamanhoPizza: string; moduloVenda: string);
var
  I: integer;
begin

  Application.CreateForm(Tfrm_consulta_produtos, frm_consulta_produtos);
  frm_consulta_produtos.showmodal;
  frm_consulta_produtos.Free;
  exibeInformacoesProdutoPizza(string_auxiliar, tamanhoPizza, moduloVenda);

end;

procedure Tfrm_modelo_vazio.pesquisaMetreGarcon;
var
  I: integer;
begin

  Application.CreateForm(Tfrm_cs_garcons, frm_cs_garcons);
  frm_cs_garcons.setTipoPesquisa(0);
  frm_cs_garcons.showmodal;
  frm_cs_garcons.Free;

  for I := 0 to ComponentCount - 1 do
  begin
    if (components[I].Name = 'ed_cod_garcon') then
      (components[I] as TCustomEdit).text := string_auxiliar;

    if (components[I].Name = 'ed_nome_garcon') then
      (components[I] as TCustomEdit).text := string_auxiliar2
  end;
end;

procedure Tfrm_modelo_vazio.pesquisaEntregador();
var
  I: integer;
begin

  Application.CreateForm(TfrmCsEntregadores, frmCsEntregadores);
  frmCsEntregadores.showmodal;
  frmCsEntregadores.Free;

  for I := 0 to ComponentCount - 1 do
  begin
    if (components[I].Name = 'edCodEntregador') then
      (components[I] as TCustomEdit).text := string_auxiliar;

    if (components[I].Name = 'edNomeEntregador') then
      (components[I] as TCustomEdit).text := string_auxiliar2
  end;
end;

procedure Tfrm_modelo_vazio.pesquisaTipoSangria;
var
  I: integer;
begin
  string_auxiliar := '';
  Application.CreateForm(TfrmCsTiposSangria, frmCsTiposSangria);
  frmCsTiposSangria.setTipoPesquisa(0);
  frmCsTiposSangria.showmodal;
  frmCsTiposSangria.Free;

  for I := 0 to ComponentCount - 1 do
  begin
    if (components[I].Name = 'edCodTipoSangria') then
      (components[I] as TCustomEdit).text := string_auxiliar;

    if (components[I].Name = 'ed_Codigo') then
      (components[I] as TCustomEdit).text := string_auxiliar;

    if (components[I].Name = 'edDescricaoTIpoSangria') then
      (components[I] as TCustomEdit).text := string_auxiliar2
  end;
end;

procedure Tfrm_modelo_vazio.pesquisaMotivoEstorno();
var
  I: integer;
begin
  string_auxiliar := '';
  Application.CreateForm(TfrmCsMotivosEstorno, frmCsMotivosEstorno);
  frmCsMotivosEstorno.setTipoPesquisa(0);
  frmCsMotivosEstorno.showmodal;
  frmCsMotivosEstorno.Free;

  for I := 0 to ComponentCount - 1 do
  begin
    if (components[I].Name = 'edCodMotivoEstorno') then
      (components[I] as TCustomEdit).text := string_auxiliar;
    if (components[I].Name = 'ed_Codigo') then
      (components[I] as TCustomEdit).text := string_auxiliar;

    if (components[I].Name = 'edDescricaoMotivoEstorno') then
      (components[I] as TCustomEdit).text := string_auxiliar2
  end;
end;

procedure Tfrm_modelo_vazio.pesquisaObsPreparo();
var
  I: integer;
begin
  string_auxiliar := '';
  Application.CreateForm(TfrmCsObservacoesPreparo, frmCsObservacoesPreparo);
  frmCsObservacoesPreparo.setTipoPesquisa(0);
  frmCsObservacoesPreparo.showmodal;
  frmCsObservacoesPreparo.Free;

  for I := 0 to ComponentCount - 1 do
  begin
    if (components[I].Name = 'edCodObsPreparo') then
      (components[I] as TCustomEdit).text := string_auxiliar;
    if (components[I].Name = 'ed_codigo') then
      (components[I] as TCustomEdit).text := string_auxiliar;

    if (components[I].Name = 'edDescricaoObsPreparo') then
      (components[I] as TCustomEdit).text := string_auxiliar2
  end;
end;

procedure Tfrm_modelo_vazio.pesquisaGrupoTouch();
var
  I: integer;
begin
  string_auxiliar := '';
  Application.CreateForm(TfrmCsGruposTouch, frmCsGruposTouch);
  frmCsGruposTouch.showmodal;
  frmCsGruposTouch.Free;

  for I := 0 to ComponentCount - 1 do
  begin
    if (components[I].Name = 'edCodGrupoTouch') then
      (components[I] as TCustomEdit).text := string_auxiliar;
    if (components[I].Name = 'ed_codigo') then
      (components[I] as TCustomEdit).text := string_auxiliar;

    if (components[I].Name = 'edDescGrupoTouch') then
      (components[I] as TCustomEdit).text := string_auxiliar2
  end;
end;

procedure Tfrm_modelo_vazio.pesquisaTipoBaixaEstoque();
var
  I: integer;
begin
  string_auxiliar := '';
  Application.CreateForm(TfrmCsTiposBaixaEstoque, frmCsTiposBaixaEstoque);
  frmCsTiposBaixaEstoque.setTipoPesquisa(0);
  frmCsTiposBaixaEstoque.showmodal;
  frmCsTiposBaixaEstoque.Free;
end;

procedure Tfrm_modelo_vazio.pesquisaMetre;
var
  I: integer;
begin

  Application.CreateForm(Tfrm_cs_garcons, frm_cs_garcons);
  frm_cs_garcons.setTipoPesquisa(1);
  frm_cs_garcons.showmodal;
  frm_cs_garcons.Free;

  for I := 0 to ComponentCount - 1 do
  begin
    if (components[I].Name = 'ed_cod_metre') then
      (components[I] as TCustomEdit).text := string_auxiliar;

    if (components[I].Name = 'ed_nome_metre') then
      (components[I] as TCustomEdit).text := string_auxiliar2
  end;
end;

procedure Tfrm_modelo_vazio.pesquisaUnidadeSaida;
var
  I: integer;
begin

  Application.CreateForm(Tfrm_cs_unidades, frm_cs_unidades);
  frm_cs_unidades.showmodal;
  frm_cs_unidades.Free;

  for I := 0 to ComponentCount - 1 do
  begin
    if (components[I].Name = 'ed_cod_un_saida') then
      (components[I] as TCustomEdit).text := string_auxiliar;

    if (components[I].Name = 'ed_desc_un_saida') then
      (components[I] as TCustomEdit).text := string_auxiliar2
  end;
end;

procedure Tfrm_modelo_vazio.pesquisaSaborPizza;
var
  I: integer;
begin

  Application.CreateForm(TfrmCsSaboresPizza, frmCsSaboresPizza);
  frmCsSaboresPizza.showmodal;
  frmCsSaboresPizza.Free;

  for I := 0 to ComponentCount - 1 do
  begin
    if (components[I].Name = 'edCodSaborPizza') then
      (components[I] as TCustomEdit).text := string_auxiliar;

    if (components[I].Name = 'edDescSaborPizza') then
      (components[I] as TCustomEdit).text := string_auxiliar2
  end;

end;

procedure Tfrm_modelo_vazio.pesquisaUnidadeDeFracao;
var
  I: integer;
begin

  Application.CreateForm(Tfrm_cs_unidades, frm_cs_unidades);
  frm_cs_unidades.showmodal;
  frm_cs_unidades.Free;

  for I := 0 to ComponentCount - 1 do
  begin
    if (components[I].Name = 'edCodUnFracao') then
      (components[I] as TCustomEdit).text := string_auxiliar;

    if (components[I].Name = 'edDescUnFracao') then
      (components[I] as TCustomEdit).text := string_auxiliar2
  end;

end;

procedure Tfrm_modelo_vazio.getFormasPagamento(ATabela: TFDMemtable);
var
  LSQL: TStringList;
begin
  ATabela.Active := false;
  LSQL := TStringList.Create();
  try
    LSQL.Clear;

    LSQL.Add('  select cast(fp.cod_forma as integer) as codigo, ');
    LSQL.Add('    fp.descricao  from formas_pagamento fp ');
    LSQL.Add('     order by descricao');
    dm.getMemTable(ATabela, LSQL.Text);
  finally
    FreeAndNil(LSQL);
  end;
end;

procedure Tfrm_modelo_vazio.getDescricaoCampos(ATipoCombo: tTipoComboPesquisa; ACamposPesquisa: TCamposComboPesquisa);
begin
  case ATipoCombo of
    tiTabelaPrecos:
      begin
        ACamposPesquisa.cpCodigo := 'codigo';
        ACamposPesquisa.cpDescricao := 'descricao';
        ACamposPesquisa.MensagemErro := 'Erro ao popular combo da tabela de preços!';
        ACamposPesquisa.MensagemTodos := 'Todas';
      end;
    tiUsuariosCaixa:
      begin
        ACamposPesquisa.cpCodigo := 'codigo';
        ACamposPesquisa.cpDescricao := 'nome';
        ACamposPesquisa.MensagemErro := 'Erro ao popular combo de usuários!';
        ACamposPesquisa.MensagemTodos := 'Todos';
      end;

    tiFormasPagamento:
      begin
        ACamposPesquisa.cpCodigo := 'codigo';
        ACamposPesquisa.cpDescricao := 'descricao';
        ACamposPesquisa.MensagemErro := 'Erro ao popular combo formas de recebimento';
        ACamposPesquisa.MensagemTodos := 'Todas';
      end;

    tiEmpresas:
      begin
        ACamposPesquisa.cpCodigo := 'codigo';
        ACamposPesquisa.cpDescricao := 'descricao';
        ACamposPesquisa.MensagemErro := 'Erro ao popular combo de empresas';
        ACamposPesquisa.MensagemTodos := 'Todas';
      end;

    tiAdquirentes:
      begin
        ACamposPesquisa.cpCodigo := 'codigo';
        ACamposPesquisa.cpDescricao := 'descricao';
        ACamposPesquisa.MensagemErro := 'Erro ao popular combo  de adquirentes';
        ACamposPesquisa.MensagemTodos := 'Todas';
      end;

    tiFornecedoresRazao:
      begin
        ACamposPesquisa.cpCodigo := 'codigo';
        ACamposPesquisa.cpDescricao := 'descricao';
        ACamposPesquisa.MensagemErro := 'Erro ao popular combo  de fornecedores';
        ACamposPesquisa.MensagemTodos := 'Todos';
      end;

    tiFornecedoresNomeFantasia:
      begin
        ACamposPesquisa.cpCodigo := 'codigo';
        ACamposPesquisa.cpDescricao := 'descricao';
        ACamposPesquisa.MensagemErro := 'Erro ao popular combo  de fornecedores';
        ACamposPesquisa.MensagemTodos := 'Todos';
      end;

  end;
end;

procedure Tfrm_modelo_vazio.getTabelasDePrecos(ATbPrecos: TFDMemtable);
var
  LSQL: TStringList;
begin
  ATbPrecos.Active := false;
  LSQL := TStringList.Create();
  try
    LSQL.Clear;
    LSQL.Add('select * from tabelas_preco tb order by tb.codigo');
    dm.getMemTable(ATbPrecos, LSQL.Text);
  finally
    FreeAndNil(LSQL);
  end;
end;

procedure Tfrm_modelo_vazio.getEmpresas(ATabela: TFDMemtable);
var
  LSQL: TStringList;
begin
  ATabela.Active := false;
  LSQL := TStringList.Create();
  try
    LSQL.Clear;
    LSQL.Add(' select p.cod_empresa as codigo, p.descricao_empresa descricao from parametros p ');
    LSQL.Add('     order by p.cod_empresa ');
    dm.getMemTable(ATabela, LSQL.Text);
  finally
    FreeAndNil(LSQL);
  end;
end;

procedure Tfrm_modelo_vazio.getAdquirentes(ATabela: TFDMemtable);
var
  LSQL: TStringList;
begin
  ATabela.Active := false;
  LSQL := TStringList.Create();
  try
    LSQL.Clear;
    LSQL.Add(' select id as codigo, nome as descricao from adquirentes order by nome');
    dm.getMemTable(ATabela, LSQL.Text);
  finally
    FreeAndNil(LSQL);
  end;
end;

procedure Tfrm_modelo_vazio.getFornecedoresRazao(ATabela: TFDMemtable);
var
  LSQL: TStringList;
begin
  ATabela.Active := false;
  LSQL := TStringList.Create();
  try
    LSQL.Clear;
    LSQL.Add('   select f.cod_fornecedor as codigo, f.razao_social as descricao from fornecedor f     order by f.razao_social');

    dm.getMemTable(ATabela, LSQL.Text);
  finally
    FreeAndNil(LSQL);
  end;
end;

procedure Tfrm_modelo_vazio.getFornecedoresNomeFantasia(ATabela: TFDMemtable);
var
  LSQL: TStringList;
begin
  ATabela.Active := false;
  LSQL := TStringList.Create();
  try
    LSQL.Clear;
    LSQL.Add('   select f.cod_fornecedor as codigo, f.nome_fantasia as descricao from fornecedor f     order by f.nome_fantasia');

    dm.getMemTable(ATabela, LSQL.Text);
  finally
    FreeAndNil(LSQL);
  end;
end;

procedure Tfrm_modelo_vazio.getUsuariosCaixa(ATbUsuarios: TFDMemtable);
var
  LSQL: TStringList;
begin
  ATbUsuarios.Active := false;
  LSQL := TStringList.Create();
  try
    LSQL.Clear;

    LSQL.Add('   select distinct c.cod_usuario as codigo, u.nome_usuario as nome   from caixas c ');
    LSQL.Add('    inner join usuarios u on (u.cod_usuario = c.cod_usuario) ');
    LSQL.Add('    order by u.nome_usuario ');
    dm.getMemTable(ATbUsuarios, LSQL.Text);
  finally
    FreeAndNil(LSQL);
  end;
end;

procedure Tfrm_modelo_vazio.getTabelaCombo(ATbAux: TFDMemtable; ATipoCombo: tTipoComboPesquisa; ACamposPesquisa: TCamposComboPesquisa);
begin
  getDescricaoCampos(ATipoCombo, ACamposPesquisa);

  case ATipoCombo of
    tiTabelaPrecos:
      getTabelasDePrecos(ATbAux);
    tiUsuariosCaixa:
      getUsuariosCaixa(ATbAux);
    tiFormasPagamento:
      getFormasPagamento(ATbAux);
    tiEmpresas:
      getEmpresas(ATbAux);
    tiAdquirentes:
      getAdquirentes(ATbAux);
    tiFornecedoresRazao:
      getFornecedoresRazao(ATbAux);
    tiFornecedoresNomeFantasia:
      getFornecedoresNomeFantasia(ATbAux);

  end;
end;

procedure Tfrm_modelo_vazio.configuraOnClickCheckCombo(Sender: TObject; ItemIndex: Integer; var AllowToggle: Boolean);
var
  opcao: TCxCheckBoxState;
  i: integer;
begin
  inherited;
  if ItemIndex = 0 then
  begin
    if (Sender as TcxCheckComboBox).States[0] = cbsUnchecked then
      opcao := cbsChecked
    else
      opcao := cbsUnchecked;

    for i := 1 to (Sender as TcxCheckComboBox).Properties.Items.Count - 1 do
      (Sender as TcxCheckComboBox).States[i] := opcao;
  end;
  (Sender as TcxCheckComboBox).Refresh;
  (Sender as TcxCheckComboBox).Repaint;
end;

function Tfrm_modelo_vazio.TrataItemSelecionadoCombo(AItemTag: integer; ATipoCombo: tTipoComboPesquisa): string;
begin

  case ATipoCombo of
    tiTabelaPrecos:
      result := Inttostr(AItemTag);
    tiUsuariosCaixa:
      result := Quotedstr(FormatFloat('000', AItemTag));
    tiFormasPagamento:
      result := Quotedstr(FormatFloat('000', AItemTag));
    tiEmpresas:
      result := Quotedstr(FormatFloat('0000', AItemTag));
    tiAdquirentes:
      result := Inttostr(AItemTag);
    tiFornecedoresRazao:
      result := Quotedstr(FormatFloat('0000', AItemTag));
    tiFornecedoresNomeFantasia:
      result := Quotedstr(FormatFloat('0000', AItemTag));
  end;
end;

procedure Tfrm_modelo_vazio.carregaComboAnos(AComboAno: TComboBox);
var
  anoAtual: integer;
  i: integer;
begin
  inherited;

  anoAtual := CurrentYear+10;
  AComboAno.Clear;
  for i := 0 to 21 do
  begin
    AComboAno.Items.Add(IntToStr(anoAtual - i));
  end;
  AComboAno.ItemIndex := 10;
end;

procedure Tfrm_modelo_vazio.carregaComboMeses(AComboMeses: TComboBox);
var
  i: integer;
  LMes: string;
begin
  inherited;

  try
    AComboMeses.Clear;
    for i := 1 to 12 do
    begin
      LMes := dm.Fmt.LongMonthNames[i];
      AComboMeses.Items.Add(Trim(UpperCase(Copy(LMes, 0, 1)) + Copy(LMes, 2, 15)));
    end;

    AComboMeses.ItemIndex := MonthOf(now) - 1;
  finally

  end;

end;

procedure Tfrm_modelo_vazio.pesquisaUnidadePadrao;
var
  I: integer;
begin

  Application.CreateForm(Tfrm_cs_unidades, frm_cs_unidades);
  frm_cs_unidades.showmodal;
  frm_cs_unidades.Free;

  for I := 0 to ComponentCount - 1 do
  begin
    if (components[I].Name = 'edCodUnPadrao') then
      (components[I] as TCustomEdit).text := string_auxiliar;

    if (components[I].Name = 'edDescUnPadrao') then
      (components[I] as TCustomEdit).text := string_auxiliar2
  end;

end;

procedure Tfrm_modelo_vazio.pesquisaItemEstoque;
var
  I: integer;
begin
  Application.CreateForm(Tfrm_cs_itens, frm_cs_itens);
  frm_cs_itens.showmodal;
  frm_cs_itens.Free;
end;

procedure Tfrm_modelo_vazio.pesquisaSubProduto();
var
  I: integer;
begin
  Application.CreateForm(TfrmCsProdutosGeral, frmCsProdutosGeral);
  frmCsProdutosGeral.setTipoProdutoConsulta(tSubProduto);
  frmCsProdutosGeral.ShowModal;
  frmCsProdutosGeral.Free;
end;

procedure Tfrm_modelo_vazio.botao_pesquisaClick(Sender: TObject);
var
  I: integer;
  nomeEdit: string;
  tamanhoPizza: string;
  moduloVenda: string;
begin

  if Sender is TSpeedButton and ((Sender as TSpeedButton).Name = 'bt_pesq_cod_grupo_fornecedor') then
  begin
    pesquisaGrupoFornecedor();
  end;

  if Sender is TSpeedButton and ((Sender as TSpeedButton).Name = 'btPesqGrupoTouch') then
  begin
    pesquisaGrupoTouch();
  end;

  if Sender is TSpeedButton and ((Sender as TSpeedButton).Name = 'bt_pesq_fornecedor') then
  begin
    pesquisaFornecedor();
    exibeInformacoesFornecedor(string_auxiliar);
  end;

  if Sender is TSpeedButton and ((Sender as TSpeedButton).Name = 'bt_pesq_bairro') then
  begin
    pesquisaBairro();
    exibeInformacoesBairro(string_auxiliar);
  end;

  if Sender is TSpeedButton and ((Sender as TSpeedButton).Name = 'bt_pesq_tipos_documento') then
  begin
    pesquisaTiposDocumento();
    exibeInformacoesTiposDocumento(string_auxiliar);
  end;

  if Sender is TSpeedButton and ((Sender as TSpeedButton).Name = 'bt_pesq_tipos_entrada') then
  begin
    pesquisaTiposEntrada();
    exibeInformacoesTiposEntrada(string_auxiliar);
  end;

  if Sender is TSpeedButton and ((Sender as TSpeedButton).Name = 'bt_pesq_cfop_entrada') then
  begin
    pesquisaCFOP(1);
    exibeInformacoesCFOPEntrada(string_auxiliar);
  end;

  if Sender is TSpeedButton and ((Sender as TSpeedButton).Name = 'bt_pesq_cfop_saida') then
  begin
    pesquisaCFOP(1);
    exibeInformacoesCFOPSaida(string_auxiliar);
  end;

  if Sender is TSpeedButton and ((Sender as TSpeedButton).Name = 'btPesqCfopTransferencia') then
  begin
    pesquisaCFOP(1);
    exibeInformacoesCFOPTransferencia(string_auxiliar);
  end;

  if Sender is TSpeedButton and ((Sender as TSpeedButton).Name = 'btPesqCFOPDevolucao') then
  begin
    pesquisaCFOP(1);
    exibeInformacoesCFOPDevolucao(string_auxiliar);
  end;

  if Sender is TSpeedButton and ((Sender as TSpeedButton).Name = 'bt_pesq_cfop') then
  begin
    pesquisaCFOP(0);
    exibeInformacoesCFOP(string_auxiliar);
  end;

  if Sender is TSpeedButton and ((Sender as TSpeedButton).Name = 'btPesqTipoItemSped') then
  begin
    pesquisaTipoItemSPED();
    exibeInformacoesTipoItemSPED(string_auxiliar);
  end;

  if Sender is TSpeedButton and ((Sender as TSpeedButton).Name = 'btPesqGeneroItem') then
  begin
    pesquisaGeneroItem();
    exibeInformacoesGeneroItem(string_auxiliar);
  end;

  if Sender is TSpeedButton and ((Sender as TSpeedButton).Name = 'btPesqNCM') then
  begin
    pesquisaNCM();
    exibeInformacoesNCM(string_auxiliar);
  end;

  if Sender is TSpeedButton and ((Sender as TSpeedButton).Name = 'bt_pesq_modelo_notaFiscal') then
  begin
    pesquisaModeloNotaFiscal();
    exibeInformacoesModeloNotaFiscal(string_auxiliar);
  end;

  if Sender is TSpeedButton and ((Sender as TSpeedButton).Name = 'btPesqSituacaoDocFiscal') then
  begin
    pesquisaSituacaoDocumentoFiscal();
    exibeInformacoesSituacaoDocumentoFiscal(string_auxiliar);
  end;

  if Sender is TSpeedButton and ((Sender as TSpeedButton).Name = 'bt_pesq_cst') then
  begin
    pesquisaCST();
    exibeInformacoesCST(string_auxiliar);
  end;

  if Sender is TSpeedButton and ((Sender as TSpeedButton).Name = 'btPesqCstPisCofins') then
  begin
    pesquisaCSTPisCofins();
    exibeInformacoesCSTPisCofins(string_auxiliar);
  end;

  if Sender is TSpeedButton and ((Sender as TSpeedButton).Name = 'btPesqCstSaida') then
  begin
    pesquisaCST();
    exibeInformacoesCST_saida(string_auxiliar);
  end;

  if Sender is TSpeedButton and ((Sender as TSpeedButton).Name = 'btPesqCstTransferencias') then
  begin
    pesquisaCST();
    exibeInformacoesCSTTransferencias(string_auxiliar);
  end;

  if Sender is TSpeedButton and ((Sender as TSpeedButton).Name = 'btPesqCstDevolucoes') then
  begin
    pesquisaCST();
    exibeInformacoesCSTDevolucoes(string_auxiliar);
  end;

  if Sender is TSpeedButton and ((Sender as TSpeedButton).Name = 'bt_pesq_usuarios') then
  begin
    pesquisaUsuarios();
    exibeInformacoesUsuario(string_auxiliar);
  end;

  if Sender is TSpeedButton and ((Sender as TSpeedButton).Name = 'bt_pesq_historico') then
  begin
    pesquisaHistorico();
  end;

  if Sender is TSpeedButton and ((Sender as TSpeedButton).Name = 'bt_pesq_cidade') then
  begin
    pesquisaCidade();
  end;

  if Sender is TSpeedButton and ((Sender as TSpeedButton).Name = 'bt_pesq_estado') then
  begin
    pesquisaEstado;
  end;

  if Sender is TSpeedButton and ((Sender as TSpeedButton).Name = 'bt_pesq_centro_custo') then
  begin
    pesquisaCentroDeCusto();
  end;

  if Sender is TSpeedButton and ((Sender as TSpeedButton).Name = 'bt_pesq_grupo') then
  begin
    pesquisaGrupo();
  end;

  if Sender is TadvGlassButton and ((Sender as TadvGlassButton).Name = 'bt_pesq_grupo') then
  begin
    pesquisaGrupo();
  end;

  if Sender is TSpeedButton and ((Sender as TSpeedButton).Name = 'bt_pesq_item_estoque_cod') then
  begin
    pesquisaItemEstoque();
    exibeInformacoesItemEstoque(string_auxiliar, 1);
  end;

  if Sender is TSpeedButton and ((Sender as TSpeedButton).Name = 'btPesqSubmateria') then
  begin
    pesquisaSubProduto();
    ExibeInformacoesSubProduto(string_auxiliar);
  end;

  if Sender is TSpeedButton and ((Sender as TSpeedButton).Name = 'btPesqTipoBaixa') then
  begin
    pesquisaTipoBaixaEstoque;
    exibeInformacoesTipoBaixaEstoque(string_auxiliar);
  end;

  if Sender is TSpeedButton and ((Sender as TSpeedButton).Name = 'bt_pesq_item_estoque_barras') then
  begin
    pesquisaItemEstoque();
    exibeInformacoesItemEstoque(string_auxiliar2, 2);
  end;

  if Sender is TSpeedButton and ((Sender as TSpeedButton).Name = 'bt_pesq_un_entrada') then
  begin
    pesquisaUnidadeEntrada();
  end;

  if Sender is TSpeedButton and ((Sender as TSpeedButton).Name = 'bt_pesq_un_saida') then
  begin
    pesquisaUnidadeSaida();
  end;

  if Sender is TSpeedButton and ((Sender as TSpeedButton).Name = 'btPesqSaborPizza') then
  begin
    pesquisaSaborPizza();
  end;

//   nomeEdit :=  trim(copy((sender as TSpeedButton).Name,0,14));
//   btPesqCodPizzaBbro
  if (Sender is TSpeedButton) and (trim(copy((Sender as TSpeedButton).Name, 0, 14)) = 'btPesqCodPizza') then
  begin
    moduloVenda := trim(copy((Sender as TSpeedButton).Name, 15, 1));
    tamanhoPizza := trim(copy((Sender as TSpeedButton).Name, 16, 3));
    pesquisaProdutoPizza(tamanhoPizza, moduloVenda);
  end;

  if Sender is TSpeedButton and ((Sender as TSpeedButton).Name = 'btPesqUnFracao') then
  begin
    pesquisaUnidadeDeFracao();
  end;

  if Sender is TSpeedButton and ((Sender as TSpeedButton).Name = 'btPesqUnPadrao') then
  begin
    pesquisaUnidadePadrao();
  end;

  if Sender is TSpeedButton and ((Sender as TSpeedButton).Name = 'bt_pesq_garcon') then
  begin
    pesquisaGarcon();
  end;

  if Sender is TSpeedButton and ((Sender as TSpeedButton).Name = 'btPesqPromoter') then
  begin
    pesquisaPromoter();
  end;

  if Sender is TSpeedButton and ((Sender as TSpeedButton).Name = 'btPesqDepartamento') then
  begin
    pesquisaDepartamento();
  end;

  if Sender is TSpeedButton and ((Sender as TSpeedButton).Name = 'btPesqGuarnicao') then
  begin

  end;

  if Sender is TSpeedButton and ((Sender as TSpeedButton).Name = 'bt_pesq_entregador') then
  begin
    pesquisaEntregador();
  end;

  if Sender is TSpeedButton and ((Sender as TSpeedButton).Name = 'bt_pesq_metre') then
  begin
    pesquisaMetre();
  end;

  if Sender is TSpeedButton and ((Sender as TSpeedButton).Name = 'bt_pesq_cliente') then
  begin
    pesquisaCliente();
    exibeInformacoesClienteFaturamento(string_auxiliar);
  end;

  if Sender is TSpeedButton and ((Sender as TSpeedButton).Name = 'bt_pesq_cliente_reduzido') then
  begin
    pesquisaClienteReduzido();
  end;

  if Sender is TSpeedButton and ((Sender as TSpeedButton).Name = 'bt_pesq_mini_printer') then
  begin
    pesquisaMiniPrinter();
  end;

  if Sender is TSpeedButton and ((Sender as TSpeedButton).Name = 'btPesqProdutoCodBarras') then
  begin
    string_aux_cod_barras := '';
    pesquisaProdutosCardapio();
    if trim(string_auxiliar) <> '' then
    begin
      if verificaExistenciaProduto(string_aux_cod_barras, 2) then
        exibeInformacoesProduto(string_aux_cod_barras, 2);
    end;
  end;

  if Sender is TSpeedButton and ((Sender as TSpeedButton).Name = 'btPesqProdutos') then
  begin
    for I := 0 to ComponentCount - 1 do
    begin
      if (components[I].Name = 'ckbCodSistema') then
      begin
        if (components[I] as TRadioButton).Name = 'ckbCodSistema' then
        begin
          if ((components[I] as TRadioButton).Checked = false) then
            (components[I] as TRadioButton).Checked := true;
        end;
      end;
    end;

    pesquisaProdutosGeral();

  end;

  if Sender is TJvTransparentButton and ((Sender as TJvTransparentButton).Name = 'btClonarFichaTecnica') then
  begin
    PesquisaProdutoCloneFichaTecnica;
  end;

  if Sender is TSpeedButton and ((Sender as TSpeedButton).Name = 'btPesqAliquota') then
  begin
    pesquisaAliquota();
  end;

  if Sender is TSpeedButton and ((Sender as TSpeedButton).Name = 'btPesqFormaPagto') then
  begin
    pesquisaFormaPagto();
  end;

  if Sender is TSpeedButton and ((Sender as TSpeedButton).Name = 'btPesqLoja') then
  begin
    pesquisaLojas();
  end;

  if Sender is TSpeedButton and ((Sender as TSpeedButton).Name = 'btPesqClienteDelivery') then
  begin
    pesquisaClienteDelivery();
  end;

end;

function Tfrm_modelo_vazio.verificaExistenciaItemEstoque(cod_item: string; campo: integer): boolean;
var
  q: TIBquery;
begin
  q := TIBquery.create(self);
  q.database := dm.dbrestaurante;
  q.transaction := dm.transacao;

  q.active := false;
  q.sql.clear;
  q.sql.add('select * from produtos where cod_produto=' + Quotedstr(cod_item) + ' and compra=1');
  q.Active := true;
  q.active := true;
  result := not q.isEmpty;

  FreeAndNil(q);
end;

function Tfrm_modelo_vazio.verificaExistenciaSaborPizza(codSabor: string): boolean;
var
  q: TIBquery;
begin
  q := TIBquery.create(self);
  q.database := dm.dbrestaurante;
  q.transaction := dm.transacao;

  q.active := false;
  q.sql.clear;
  q.sql.add('select * from sabores_pizza where codigo=' + Quotedstr(codSabor));
  q.Active := true;
  q.active := true;
  result := not q.isEmpty;
  FreeAndNil(q);
end;

function Tfrm_modelo_vazio.verificaExistenciaSubmateria(cod_item: string; campo: integer): boolean;
var
  q: TIBquery;
begin
  q := TIBquery.create(self);
  q.database := dm.dbrestaurante;
  q.transaction := dm.transacao;

  q.active := false;
  q.sql.clear;
  if campo = 1 then
    q.sql.add('select * from produtos where submateria=1 and cod_produto=' + Quotedstr(cod_item))
  else
    q.sql.add('select * from produtos where submateria=1 and cod_barras=' + Quotedstr(cod_item));

  q.Active := true;
  q.active := true;
  result := not q.isEmpty;

  FreeAndNil(q);
end;

function Tfrm_modelo_vazio.verificaExistenciaTipoBaixaEstoque(codTipo: string): boolean;
var
  q: TIBquery;
begin
  q := TIBquery.create(self);
  q.database := dm.dbrestaurante;
  q.transaction := dm.transacao;

  q.active := false;
  q.sql.clear;
  q.sql.add('select * from tipos_baixa where cod_tipo=' + Quotedstr(codTipo));
  q.Active := true;
  q.active := true;
  result := not q.isEmpty;
  FreeAndNil(q);
end;

function Tfrm_modelo_vazio.verificaExistenciaContaApagar(codConta: string): boolean;
var
  q: TIBquery;
begin
  q := TIBquery.create(self);
  q.database := dm.dbrestaurante;
  q.transaction := dm.transacao;

  q.active := false;
  q.sql.clear;
  q.sql.add('select * from contas_a_pagar where codigo=' + Quotedstr(codConta));
  q.Active := true;
  q.active := true;
  result := not q.isEmpty;
  FreeAndNil(q);
end;

function Tfrm_modelo_vazio.getStatusContaApagar(codConta: string): smallint;
var
  q: TIBquery;
begin
  q := TIBquery.create(self);
  q.database := dm.dbrestaurante;
  q.transaction := dm.transacao;

  q.active := false;
  q.sql.clear;
  q.sql.add('select * from contas_a_pagar where codigo=' + Quotedstr(codConta));
  q.Active := true;
  q.active := true;
  result := q.FieldByName('status').Value;

  FreeAndNil(q);
end;

function Tfrm_modelo_vazio.getEstoqueAtualItemEstoque(cod_item: string): double;
var
  q: TIBquery;
begin
  q := TIBquery.create(self);
  q.database := dm.dbrestaurante;
  q.transaction := dm.transacao;

  q.active := false;
  q.sql.clear;
  q.sql.add('select estoque_total from v_itens_estoque where cod_item=' + Quotedstr(cod_item));
  q.Active := true;
  q.active := true;
  result := q.fieldbyname('estoque_total').value;
  FreeAndNil(q);
end;

function Tfrm_modelo_vazio.getCodUnidadeEntradaItemEstoque(cod_item: string): string;
var
  q: TIBquery;
begin
  q := TIBquery.create(self);
  q.database := dm.dbrestaurante;
  q.transaction := dm.transacao;

  q.active := false;
  q.sql.clear;
  q.sql.add('select cod_un_entrada from v_itens_estoque where cod_item=' + Quotedstr(cod_item));
  q.Active := true;
  q.active := true;
  result := q.fieldbyname('cod_un_entrada').value;
  FreeAndNil(q);
end;

function Tfrm_modelo_vazio.getCodEntradaNotaFiscal(codFornecedor: string; numeroNota: string): string;
var
  q: TIBQuery;
begin

  numeroNota := formatFloat('000000000000000', StrToInt(numeroNota));
  codFornecedor := formatFloat('0000', StrToInt(codFornecedor));
  q := TIBQuery.Create(self);
  q.Database := dm.dbrestaurante;
  q.Transaction := dm.transacao;
  q.Active := false;
  q.sql.add(' select * from entradas where cod_fornecedor=' + QuotedStr(codFornecedor) + ' and numero_nota=' + Quotedstr(numeroNota));
  q.Active := true;
  result := q.fieldbyname('cod_entrada').value;

  q.Active := false;
  FreeAndNil(q);
end;

function Tfrm_modelo_vazio.getCodEntradaNotaFiscalSaida(numeroNota: string): string;
var
  q: TIBQuery;
begin
  q := TIBQuery.Create(self);
  q.Database := dm.dbrestaurante;
  q.Transaction := dm.transacao;
  q.Active := false;
  q.sql.add(' select * from saidas where numero_nota=' + Quotedstr(formatFloat('000000000000000', StrToFloat(numeroNota))));
  q.Active := true;
  result := q.fieldbyname('cod_saida').value;

  q.Active := false;
  FreeAndNil(q);
end;

function Tfrm_modelo_vazio.verificaExistenciaClienteDelivery(codCli: string): boolean;
var
  q: TIBquery;
begin
  q := TIBquery.create(self);
  q.database := dm.dbrestaurante;
  q.transaction := dm.transacao;

  q.active := false;
  q.sql.clear;
  q.sql.add('select codigo from clientes_delivery where codigo=' + Quotedstr(codCli));
  q.Active := true;

  q.active := true;
  result := not q.isEmpty;
  FreeAndNil(q);
end;

function Tfrm_modelo_vazio.verificaExistenciaClienteDeliveryPorTelefone(telefone: string): boolean;
var
  q: TIBquery;
  ts: TIBTransaction;
begin

  ts := TIBTransaction.Create(nil);
  ts.Params.Add('read_committed');
  ts.Params.Add('rec_version');
  ts.Params.Add('nowait');
  ts.DefaultDatabase := dm.dbrestaurante;
  ts.Active := true;

  q := TIBQuery.create(self);
  q.Database := dm.dbrestaurante;
  q.Transaction := ts;
  q.Active := false;

  try
    q.active := false;
    q.sql.clear;
    q.sql.add('select codigo from clientes_delivery where telefone=' + Quotedstr(telefone) + ' or celular=' + Quotedstr(telefone));
    q.Active := true;
    result := not q.isEmpty;
  finally
    q.Active := false;
    FreeAndNil(q);

    ts.Active := false;
    FreeAndNil(ts);
  end;

  FreeAndNil(q);
end;

function Tfrm_modelo_vazio.getCodClienteDeliveryPorTelefone(telefone: string): string;
var
  q: TIBquery;
begin
  q := TIBquery.create(self);
  q.database := dm.dbrestaurante;
  q.transaction := dm.transacao;

  q.active := false;
  q.sql.clear;
  q.sql.add('select codigo from clientes_delivery where telefone=' + Quotedstr(telefone) + ' or celular=' + Quotedstr(telefone));
  q.Active := true;
  result := q.fieldbyname('codigo').value;
  FreeAndNil(q);
end;

function Tfrm_modelo_vazio.verificaExistenciaGrupoFonecedor(cod_grupo_fornecedor: string): boolean;
var
  q: TIBquery;
begin
  q := TIBquery.create(self);
  q.database := dm.dbrestaurante;
  q.transaction := dm.transacao;

  q.active := false;
  q.sql.clear;
  q.sql.add(' select  gf.codigo from grupo_fornecedor gf where gf.codigo=' + Quotedstr(cod_grupo_fornecedor));
  q.active := true;
  result := not q.isEmpty;
  FreeAndNil(q);
end;

function Tfrm_modelo_vazio.verificaExistenciaCidade(cod_cidade: string): boolean;
var
  q: TIBquery;
begin
  q := TIBquery.create(self);
  q.database := dm.dbrestaurante;
  q.transaction := dm.transacao;

  q.active := false;
  q.sql.clear;
  q.sql.add(' select c.cod_cidade from cidade c where cod_cidade=' + Quotedstr(cod_cidade));
  q.active := true;
  result := not q.isEmpty;

  FreeAndNil(q);
end;

function Tfrm_modelo_vazio.verificaExistenciaEstado(cod_estado: string): boolean;
var
  q: TIBquery;
begin
  q := TIBquery.create(self);
  q.database := dm.dbrestaurante;
  q.transaction := dm.transacao;

  q.active := false;
  q.sql.clear;
  q.sql.add(' select e.codigo from estado e where e.codigo=' + Quotedstr(cod_estado));
  q.active := true;
  result := not q.isEmpty;

  FreeAndNil(q);
end;

function Tfrm_modelo_vazio.verificaExistenciaFornecedor(cod_fornecedor: string): boolean;
var
  q: TIBquery;
begin
  q := TIBquery.create(self);
  q.database := dm.dbrestaurante;
  q.transaction := dm.transacao;

  q.active := false;
  q.sql.clear;
  q.sql.add(' select f.cod_fornecedor from fornecedor f where f.cod_fornecedor=' + Quotedstr(cod_fornecedor));
  q.active := true;
  result := not q.isEmpty;
  FreeAndNil(q);
end;

function Tfrm_modelo_vazio.getCNPJFornecedor(cod_fornecedor: string): string;
var
  q: TIBquery;
begin
  q := TIBquery.create(self);
  q.database := dm.dbrestaurante;
  q.transaction := dm.transacao;

  q.active := false;
  q.sql.clear;
  q.sql.add(' select f.CGC_CPF from fornecedor f where f.cod_fornecedor=' + Quotedstr(cod_fornecedor));
  q.active := true;
  result := trim(q.fieldbyname('CGC_CPF').Value);
  FreeAndNil(q);
end;

function Tfrm_modelo_vazio.getCodFornecedorViaCNPJ(cnpj: string): string;
var
  q: TIBquery;
begin
  q := TIBquery.create(self);
  q.database := dm.dbrestaurante;
  q.transaction := dm.transacao;

  q.active := false;
  q.sql.clear;
  q.sql.add(' select f.cod_fornecedor from fornecedor f where  f.CGC_CPF=' + Quotedstr(cnpj));
  q.active := true;

  if q.IsEmpty then
  begin
    ShowMessage('Fornecedor com este cnpj não consta na base');
    result := trim(q.fieldbyname('cod_fornecedor').Value);
  end
  else
  begin
    result := trim(q.fieldbyname('cod_fornecedor').Value);

  end;
  FreeAndNil(q);
end;

function Tfrm_modelo_vazio.verificaExistenciaProdutoCodigosEntrada(cod_fornecedor: string; cod_produto: string): Boolean;
var
  q: TIBquery;
begin
  q := TIBquery.create(self);
  q.database := dm.dbrestaurante;
  q.transaction := dm.transacao;

  q.active := false;
  q.sql.clear;
  q.sql.add(' select cod_prod_sistema  from codigos_entrada_fornecedor where cod_prod_fornecedor=' + Quotedstr(cod_produto) + ' and cod_fornecedor=' + Quotedstr(cod_fornecedor));
  q.active := true;
  if q.IsEmpty then
    Result := false
  else
    Result := true;

  FreeAndNil(q);
end;

function Tfrm_modelo_vazio.verificaExistenciaFornecedorCNPJ(cnpjFornecedor: string): boolean;
var
  q: TIBquery;
begin
  q := TIBquery.create(self);
  q.database := dm.dbrestaurante;
  q.transaction := dm.transacao;

  q.active := false;
  q.sql.clear;
  q.sql.add(' select f.cod_fornecedor from fornecedor f where f.CGC_CPF=' + Quotedstr(trim(cnpjFornecedor)));
  q.active := true;
  result := not q.isEmpty;
  FreeAndNil(q);
end;

function Tfrm_modelo_vazio.verificaExistenciaBairro(codBairro: string): boolean;
var
  q: TIBquery;
begin
  q := TIBquery.create(self);
  q.database := dm.dbrestaurante;
  q.transaction := dm.transacao;

  q.active := false;
  q.sql.clear;
  q.sql.add(' select * from bairro where codigo=' + codBairro);
  q.active := true;
  result := not q.isEmpty;
  FreeAndNil(q);
end;

function Tfrm_modelo_vazio.verificaExistenciaGrupo(cod_grupo: string): boolean;
var
  q: TIBquery;
begin
  q := TIBquery.create(self);
  q.database := dm.dbrestaurante;
  q.transaction := dm.transacao;

  q.active := false;
  q.sql.clear;
  q.sql.add(' select g.cod_grupo from grupos g where g.cod_grupo=' + Quotedstr(cod_grupo));
  q.active := true;

  result := not q.isEmpty;
  FreeAndNil(q);
end;

function Tfrm_modelo_vazio.verificaExistenciaGrupoRD(codGrupoRD: string): boolean;
var
  q: TIBquery;
begin
  q := TIBquery.create(self);
  q.database := dm.dbrestaurante;
  q.transaction := dm.transacao;

  q.active := false;
  q.sql.clear;
  q.sql.add(' select g.cod_grupo from grupos_rd g where g.cod_grupo=' + Quotedstr(codGrupoRD));
  q.active := true;

  result := not q.isEmpty;
  FreeAndNil(q);
end;

function Tfrm_modelo_vazio.verificaExistenciaMiniPrinter(cod_miniPrinter: string): boolean;
var
  q: TIBquery;
begin
  q := TIBquery.create(self);
  q.database := dm.dbrestaurante;
  q.transaction := dm.transacao;

  q.active := false;
  q.sql.clear;
  q.sql.add(' select * from miniprinters where cod_miniprinter=' + Quotedstr(cod_miniPrinter));
  q.active := true;
  result := not q.isEmpty;

  FreeAndNil(q);
end;

function Tfrm_modelo_vazio.verificaExistenciaPedidoDelivery(codPedido: string): boolean;
var
  q: TIBquery;
begin
  q := TIBquery.create(self);
  q.database := dm.dbrestaurante;
  q.transaction := dm.transacao;

  q.active := false;
  q.sql.clear;
  q.sql.add(' select * from pedidos_delivery where codigo=' + Quotedstr(codPedido));
  q.active := true;
  result := not q.isEmpty;

  FreeAndNil(q);
end;

function Tfrm_modelo_vazio.verificaStatusPedidoDelivery(codPedido: string): smallint;
var
  q: TIBquery;
begin
  q := TIBquery.create(self);
  q.database := dm.dbrestaurante;
  q.transaction := dm.transacao;

  q.active := false;
  q.sql.clear;
  q.sql.add(' select * from pedidos_delivery where codigo=' + Quotedstr(codPedido));
  q.active := true;
  result := q.fieldbyname('status').value;
  q.active := false;
  FreeAndNil(q);
end;

procedure Tfrm_modelo_vazio.bloqueiaMesa(mesa: string);
var
  ts: TIBTransaction;
  qryBloqMesa: TIBQuery;
begin
  ts := TIBTransaction.Create(self);
  ts.DefaultDatabase := dm.dbrestaurante;
  ts.Active := false;
  ts.Active := true;

  qryBloqMesa := TIBQuery.Create(Self);
  qryBloqMesa.Database := dm.dbrestaurante;
  qryBloqMesa.Transaction := ts;
  qryBloqMesa.Active := false;

  try
    try
      qryBloqMesa.Active := false;
      qryBloqMesa.Sql.Clear;
      qryBloqMesa.SQL.Add('execute procedure bloqueia_mesa(' + Quotedstr(mesa) + ',' + QuotedStr(codigo_usuario) + ')');
      ////dm.adicionalog('Bloqueia a mesa ' + mesa);
       //////dm.adicionalog(qryBloqMesa.SQL.Text);
      qryBloqMesa.ExecSQL;
      ts.Commit;
    finally
//       qryBloqMesa.Active := false;
      FreeAndNil(qryBloqMesa);
      ts.Active := false;
      FreeAndNil(ts);
    end;
  except
    on E: Exception do
    begin
      ////dm.adicionalog('Ocorreu erro ao bloquear a mesa:  ' + E.Message);
    end;
  end;

end;

function Tfrm_modelo_vazio.verificaMesaTemExtrato(mesa: string): boolean;
var
  q: TIBquery;
begin
  q := TIBquery.create(self);
  q.database := dm.dbrestaurante;
  q.transaction := dm.transacao;

  q.sql.clear;
  q.sql.add('select * from extratos_emitidos where mesa=' + Quotedstr(mesa));
  q.Active := true;
  result := not q.IsEmpty;

  FreeAndNil(q);
end;

function Tfrm_modelo_vazio.getEstadoCartao(cartao: string): integer;
var
  q: TIBquery;
begin
  q := TIBquery.create(self);
  q.database := dm.dbrestaurante;
  q.transaction := dm.transacao;

  q.sql.clear;
  q.sql.add('select status,cod_cli from cartoes where cod_cartao=' + Quotedstr(cartao));
  q.Active := true;

  case q.FieldByName('status').Value of
    0:
      begin
        result := 0;
      end;
    1:
      begin
//     dm.exibe_painel_erro('Este(a) cartão não pode mais ser utilizado no dia corrente.','Ok');
        Result := 1;
      end;
    2:
      begin
//     dm.exibe_painel_erro('Cartão BLOQUEADO para uso!','OK');
        Result := 2;
      end;
    3:
      begin
//     dm.exibe_painel_erro('Cartão não efetuou check-in!','OK');
        Result := 3;
      end;
  end;
  FreeAndNil(q);
end;

function Tfrm_modelo_vazio.verificaStatusCartao(cartao: string): boolean;
var
  q: TIBquery;
begin
  q := TIBquery.create(self);
  q.database := dm.dbrestaurante;
  q.transaction := dm.transacao;

  q.sql.clear;
  q.sql.add('select status,cod_cli from cartoes where cod_cartao=' + Quotedstr(cartao));
  q.Active := true;
  Result := false;

  case q.FieldByName('status').Value of
    0:
      begin
        Result := true
      end;
    1:
      begin
        dm.exibe_painel_erro('CARTÃO JÁ FOI PAGO!', 'Ok');
        Result := false;
      end;
    2:
      begin
        dm.exibe_painel_erro('CARTÃO  BLOQUEADO POR EXTRAVIOO' + #13#10 + ' CONTACTAR A GERÊNCIA!', 'OK');
        Result := false;
      end;
    3:
      begin
        dm.exibe_painel_erro('CARTÃO NÃO EFETUOU CHECK-IN (ENTRADA)', 'OK');
        Result := false;
      end;
  end;
  FreeAndNil(q);
end;

function Tfrm_modelo_vazio.verificaStatusCartaoParaLiberacao(cartao: string): boolean;
var
  q: TIBquery;
begin
  q := TIBquery.create(self);
  q.database := dm.dbrestaurante;
  q.transaction := dm.transacao;

  q.sql.clear;
  q.sql.add('select status,cod_cli from cartoes where cod_cartao=' + Quotedstr(cartao));
  q.Active := true;
  Result := false;

  try
    begin

      case q.FieldByName('status').Value of
        0:
          begin
            Result := false;
          end;
        1:
          begin
            Result := true;
          end;
        2:
          begin
            Result := false;
          end;
        3:
          begin
            Result := false;
          end;
      end;
    end;
  except
    begin
      showmessage('Erro');
    end;
  end;

  FreeAndNil(q);
end;

function Tfrm_modelo_vazio.verificaStatusCartaoNoCheckin(cartao: string): boolean;
var
  q: TIBquery;
begin
  q := TIBquery.create(self);
  q.database := dm.dbrestaurante;
  q.transaction := dm.transacao;

  q.sql.clear;
  q.sql.add('select status,cod_cli from cartoes where cod_cartao=' + Quotedstr(cartao));
  q.Active := true;

  Result := false;

  case q.FieldByName('status').Value of
    0:
      begin
        dm.exibe_painel_erro('CARTÃO JÁ ESTÁ EM USO!', 'Ok');
        Result := false;
      end;
    1:
      begin
        dm.exibe_painel_erro('CARTÃO JÁ FOI UTILIZADO E PAGO!', 'Ok');
        Result := false;
      end;
    2:
      begin
        dm.exibe_painel_erro('CARTÃO BLOQUEADO POR EXTRAVIO ' + #13#10 + ' CONTACTAR A GERÊNCIA!', 'OK');
        Result := false;
      end;
    3:
      begin
        Result := true;
      end;
  end;

  FreeAndNil(q);
end;

function Tfrm_modelo_vazio.verificaSeCartaoEstaSendoUtilizado(cartao: string): boolean;
var
  q: TIBquery;
begin
  q := TIBquery.create(self);
  q.database := dm.dbrestaurante;
  q.transaction := dm.transacao;

  q.sql.clear;
  q.sql.add('select cod_cli from cartoes where cod_cartao=' + Quotedstr(cartao));
  q.Active := true;

  if (q.FieldByName('cod_cli').IsNull) then
  begin
    Result := false;
  end
  else
    result := true;

  FreeAndNil(q);
end;

function Tfrm_modelo_vazio.verificaEquivalenciaUnidades(cod_un1: string; cod_un2: string): boolean;
var
  q, q1: TIBquery;
begin
  q := TIBquery.create(self);
  q.database := dm.dbrestaurante;
  q.transaction := dm.transacao;
  q.SQL.Clear;
  q.sql.add('select * from unidades where cod_unidade=' + QUotedstr(cod_un1));
  q.active := true;

  q1 := TIBquery.create(self);
  q1.database := dm.dbrestaurante;
  q1.transaction := dm.transacao;
  q1.SQL.Clear;
  q1.sql.add('select * from unidades where cod_unidade=' + QUotedstr(cod_un2));
  q1.active := true;

  if (q.FieldByName('cod_padrao').value <> q1.FieldByName('cod_padrao').value) then
    result := false
  else
    result := true;

  FreeAndNil(q);
end;

function Tfrm_modelo_vazio.verificaProdutoRequerObservacao(cod_produto: string): boolean;
var
  q: TIBquery;
begin
  q := TIBquery.create(self);
  q.database := dm.dbrestaurante;
  q.transaction := dm.transacao;

  q.active := false;
  q.sql.clear;
  q.sql.add(' select cod_produto, obs_lancamento from produtos  ');
  q.sql.add(' where  cod_produto=' + QuotedStr(cod_produto));
  q.active := true;
  if (q.FieldByName('obs_lancamento').Value = 0) then
    result := false
  else
    result := true;

  FreeAndNil(q);
end;

function Tfrm_modelo_vazio.verificaSeProdutoLeQuantidadeDaBalanca(codigo: string; tipoCodigo: smallint): boolean;
var
  q: TIBquery;
begin
  q := TIBquery.create(self);
  q.database := dm.dbrestaurante;
  q.transaction := dm.transacao;

  q.active := false;
  q.sql.clear;
  q.sql.add(' select cod_produto, balanca from produtos  ');
  if (tipoCodigo = 1) then
    q.sql.add(' where  cod_produto=' + QuotedStr(codigo))
  else
    q.sql.add(' where  cod_barras=' + QuotedStr(codigo));

  q.active := true;
  if (q.FieldByName('balanca').Value = 0) then
    result := false
  else
    result := true;

  FreeAndNil(q);

end;

function Tfrm_modelo_vazio.getBalancaLeitura(codigo: string; tipoCodigo: smallint): smallint;
var
  q: TIBquery;
begin
  q := TIBquery.create(self);
  q.database := dm.dbrestaurante;
  q.transaction := dm.transacao;

  q.active := false;
  q.sql.clear;
  q.sql.add(' select cod_produto, BALANCA_LEITURA from produtos  ');
  if (tipoCodigo = 1) then
    q.sql.add(' where  cod_produto=' + QuotedStr(codigo))
  else
    q.sql.add(' where  cod_barras=' + QuotedStr(codigo));

  q.Active := true;
  result := q.fieldbyname('BALANCA_LEITURA').value;
  FreeAndNil(q);

end;

function Tfrm_modelo_vazio.verificaSeProdutoEhPizza(codigo: string; tipoCodigo: smallint): boolean;
var
  q: TIBquery;
begin
  q := TIBquery.create(self);
  q.database := dm.dbrestaurante;
  q.transaction := dm.transacao;

  q.active := false;
  q.sql.clear;
  q.sql.add(' select cod_produto, pizza from produtos  ');
  if (tipoCodigo = 1) then
    q.sql.add(' where  cod_produto=' + QuotedStr(codigo))
  else
    q.sql.add(' where  cod_barras=' + QuotedStr(codigo));

  q.active := true;
  if (q.FieldByName('pizza').Value = 0) then
    result := false
  else
    result := true;

  FreeAndNil(q);

end;

function Tfrm_modelo_vazio.verificaSeProdutoRequerObservacao(codigo: string; tipoCodigo: smallint): boolean;
var
  q: TIBquery;
begin
  q := TIBquery.create(self);
  q.database := dm.dbrestaurante;
  q.transaction := dm.transacao;

  q.active := false;
  q.sql.clear;
  q.sql.add(' select cod_produto, requer_observacao from produtos  ');
  if (tipoCodigo = 1) then
    q.sql.add(' where  cod_produto=' + QuotedStr(codigo))
  else
    q.sql.add(' where  cod_barras=' + QuotedStr(codigo));

  q.active := true;
  if (q.FieldByName('requer_observacao').Value = 0) then
    result := false
  else
    result := true;

  FreeAndNil(q);
end;

function Tfrm_modelo_vazio.verificaSeProdutoTemAdicionaisFixos(ACodProduto: string): Boolean;
var
  LSQL: TStringList;
  LMemTable: TFDMemTable;
begin
  Result := false;
  LSQL := TStringList.Create;
  LMemTable := TFDMemTable.Create(self);

  try
    try
      LSQL.add(' select coalesce(count(*),0) as qtd                                ');
      LSQL.add('    from produtos_grupos_adicionais pa                             ');
      LSQL.add('       inner join grupos_adicionais ad on ( ad.id = pa.id_grupo)   ');
      LSQL.add('   where ad.tipo=2                                                 ');
      LSQL.add('     and ad.cod_produto =:vpCodProduto                             ');
      LSQL.Text := StringReplace(LSQL.Text, ':vpCodProduto', ACodProduto, [rfReplaceAll, rfIgnoreCase]);
      dm.getMemTable(LMemTable, LSQL.Text);
      if LMemTable.FieldByName('qtd').Value > 0 then
        Result := true;

    except
      on E: Exception do
      begin
        dm.exibe_painel_erro('Erro ao verificar se produto possui adicionais fixos! ' + sLineBreak + 'Erro: ' + E.Message, 'Ok', mtError);
      end;
    end;
  finally
    FreeAndNil(LSQL);
    freeAndNil(LMemTable);

  end;

end;

function Tfrm_modelo_vazio.getValorPizza(codigo: string; tipoCodigo: integer; tipoVenda: integer): double;
var
  q: TIBquery;
  tamanho: string;
  maisCaro: double;
  codigoPizzaMaisCara: string;
  valorTemp: double;
  totalSabores: double;
  fatorCorrecaoPreco: double;
  proporcao: double;
  LProduto: Produto.TProduto;
  LCodProduto: string;
begin
  q := TIBquery.create(self);
  q.database := dm.dbrestaurante;
  q.transaction := dm.transacao;

  LProduto := Produto.TProduto.Create;

  try
    try

      q.active := false;
      q.sql.clear;
      q.sql.add(' select cod_produto, tam_pizza from produtos  ');
      if (tipoCodigo = 1) then
        q.sql.add(' where  cod_produto=' + QuotedStr(codigo))
      else
        q.sql.add(' where  cod_barras=' + QuotedStr(codigo));

      q.active := true;
      tamanho := q.fieldbyname('tam_pizza').value;
      if tipoVenda = 1 then
        tamanho := q.fieldbyname('tam_pizza').value + 'BALCAO'
      else
        tamanho := q.fieldbyname('tam_pizza').value + 'DELIVERY';

      maisCaro := 0;
      totalSabores := 0;

      dm.tbSaboresPizzaTemp.First;

      if (pizzaValorProporcional = false) then
      begin
        while not dm.tbSaboresPizzaTemp.Eof do
        begin
          q.Active := false;
          q.sql.clear;
          q.sql.add('select * from sabores_pizza where codigo=' + Quotedstr(dm.tbSaboresPizzaTempcodigo.Value));
          q.Active := true;

          LCodProduto := q.FieldByName(tamanho).Value;
          dm.getDadosProduto(TeCodProduto, LCodProduto, LProduto);
          valorTemp := LProduto.Preco;

          if (valorTemp > maisCaro) then
          begin
            maisCaro := valorTemp;
            totalSabores := maisCaro;
          end;
          dm.tbSaboresPizzaTemp.Next;
        end;

      end;

      dm.tbSaboresPizzaTemp.First;
      while not dm.tbSaboresPizzaTemp.Eof do
      begin
        q.Active := false;
        q.sql.clear;
        q.sql.add('select * from sabores_pizza where codigo=' + Quotedstr(dm.tbSaboresPizzaTempcodigo.Value));
        q.Active := true;
        dm.tbSaboresPizzaTemp.Edit;

        if (pizzaValorProporcional = true) then
        begin
          LCodProduto := q.FieldByName(tamanho).Value;
          dm.getDadosProduto(TeCodProduto, LCodProduto, LProduto);
          valorTemp := LProduto.Preco;
          dm.tbSaboresPizzaTempvalorSabor.Value := valorTemp;
          valorTemp := RoundABNT((valorTemp * dm.tbSaboresPizzaTempproporcao.Value), 2);
          totalSabores := valorTemp + totalSabores;
        end
        else
        begin
          dm.tbSaboresPizzaTempvalorSabor.Value := maisCaro;
        end;

        dm.tbSaboresPizzaTempcodProduto.Value := q.FieldByName(tamanho).Value;
        dm.tbSaboresPizzaTemp.Post;
        dm.tbSaboresPizzaTemp.Next;
      end;

      Result := totalSabores;
    except
      on E: Exception do
      begin
        ShowRealDialog(Self, tmErro, 'Erro', E.Message);
      end;

    end;
  finally
    q.Active := false;
    FreeAndNil(LProduto);
    FreeAndNil(q);
  end;

end;

function Tfrm_modelo_vazio.verificaProdutoRequerInformacaoSabor(cod_produto: string): boolean;
var
  q: TIBquery;
begin
  q := TIBquery.create(self);
  q.database := dm.dbrestaurante;
  q.transaction := dm.transacao;

  q.active := false;
  q.sql.clear;
  q.sql.add(' select cod_produto, informar_sabor from produtos  ');
  q.sql.add(' where  cod_produto=' + QuotedStr(cod_produto));
  q.active := true;
  if (q.FieldByName('informar_sabor').Value = 0) then
    result := false
  else
    result := true;

  FreeAndNil(q);

end;

function Tfrm_modelo_vazio.verificaExistenciaHistorico(cod_historico: string): boolean;
var
  q: TIBquery;
begin
  q := TIBquery.create(self);
  q.database := dm.dbrestaurante;
  q.transaction := dm.transacao;

  q.active := false;
  q.sql.clear;
  q.sql.add(' select h.cod_historico from historico_caixa h where h.cod_historico=' + Quotedstr(cod_historico));
  q.active := true;

  result := not q.isEmpty;
  FreeAndNil(q);
end;

function Tfrm_modelo_vazio.verificaSeCaixaEstaAberto(codCaixa: string): boolean;
var
  q: TIBquery;
begin
  q := TIBquery.create(self);
  q.database := dm.dbrestaurante;
  q.transaction := dm.transacao;

  q.active := false;
  q.sql.clear;
  q.sql.add(' select * from caixas where codigo=' + Quotedstr(codCaixa));
  q.active := true;

  if q.IsEmpty then
    Result := false
  else
  begin
    if q.FieldByName('status').value = 1 then
      result := true
    else
      result := false;
  end;

  FreeAndNil(q);
end;

function Tfrm_modelo_vazio.verificaSeCaixaCobraServico(codCaixa: string): boolean;
begin

  dm.tb_parametros.Active := true;

  if (dm.tb_parametrosCOBRA_SERVICO.Value = 0) then
    Result := False
  else
    Result := True;

end;

function Tfrm_modelo_vazio.verificaExistenciaFormaPagto(cod_forma: string): boolean;
var
  q: TIBquery;
begin
  q := TIBquery.create(self);
  q.database := dm.dbrestaurante;
  q.transaction := dm.transacao;

  q.active := false;
  q.sql.clear;
  q.sql.add(' select * from formas_pagamento where cod_forma=' + Quotedstr(cod_forma));
  q.active := true;
  result := not q.isEmpty;

  FreeAndNil(q);
end;

function Tfrm_modelo_vazio.getCodigoRegistradorFormaPagamento(cod_forma: string): string;
var
  q: TIBquery;
begin
  q := TIBquery.create(self);
  q.database := dm.dbrestaurante;
  q.transaction := dm.transacao;

  q.active := false;
  q.sql.clear;
  q.sql.add(' select rp from formas_pagamento where cod_forma=' + Quotedstr(cod_forma));
  q.active := true;
  result := q.fieldbyname('rp').value;

  FreeAndNil(q);
end;

function Tfrm_modelo_vazio.verificaExistenciaLoja(codLoja: string): boolean;
var
  q: TIBquery;
begin
  q := TIBquery.create(self);
  q.database := dm.dbrestaurante;
  q.transaction := dm.transacao;

  q.active := false;
  q.sql.clear;
  q.sql.add(' select * from empresas_grupo where codigo=' + Quotedstr(codLoja));
  q.active := true;
  result := not q.isEmpty;
  FreeAndNil(q);
end;

function Tfrm_modelo_vazio.verificaExistenciaTipoDeCliente(cod_tipo_cliente: string): boolean;
var
  q: TIBquery;
begin
  q := TIBquery.create(self);
  q.database := dm.dbrestaurante;
  q.transaction := dm.transacao;

  q.active := false;
  q.sql.clear;
  q.sql.add(' select * from tipos_cliente where cod_tipo=' + Quotedstr(cod_tipo_cliente));
  q.active := true;

  result := not q.isEmpty;
  FreeAndNil(q);
end;

function Tfrm_modelo_vazio.verificaExistenciaCliente(cod_cliente: string): boolean;
var
  q: TIBquery;
begin
  q := TIBquery.create(self);
  q.database := dm.dbrestaurante;
  q.transaction := dm.transacao;

  q.active := false;
  q.sql.clear;
  q.sql.add(' select * from clientes where cod_cli=' + Quotedstr(cod_cliente));
  q.active := true;
  result := not q.isEmpty;

  FreeAndNil(q);
end;

function Tfrm_modelo_vazio.verificaExistenciaClienteRG(rg: string): boolean;
var
  q: TIBquery;
begin
  q := TIBquery.create(self);
  q.database := dm.dbrestaurante;
  q.transaction := dm.transacao;

  q.active := false;
  q.sql.clear;
  q.sql.add(' select * from clientes where rg=' + Quotedstr(rg));
  q.active := true;
  result := not q.isEmpty;

  FreeAndNil(q);
end;

function Tfrm_modelo_vazio.verificaClienteAtivo(cod_cliente: string): boolean;
var
  q: TIBquery;
begin
  q := TIBquery.create(self);
  q.database := dm.dbrestaurante;
  q.transaction := dm.transacao;

  q.active := false;
  q.sql.clear;
  q.sql.add(' select * from clientes where cod_cli=' + Quotedstr(cod_cliente));
  q.active := true;

  if (q.fieldbyname('situacao').Value = 1) then
    result := true
  else
    result := false;

  FreeAndNil(q);
end;

function Tfrm_modelo_vazio.verificaClienteTemCredito(cod_cliente: string; valor_pleiteado: double): boolean;
var
  q: TIBquery;
  total_debitos: double;
begin
  q := TIBquery.create(self);
  q.database := dm.dbrestaurante;
  q.transaction := dm.transacao;

  q.active := false;
  q.sql.clear;
  q.sql.add(' select sum(valor_fatura) as total from faturas where cod_cli=' + Quotedstr(cod_cliente) + ' and status=0');
  q.active := true;

  if (q.IsEmpty = false) then
    if q.fieldbyname('total').Value = null then
      total_debitos := 0
    else
      total_debitos := q.fieldbyname('total').Value
  else
    total_debitos := 0;

  q.active := false;
  q.sql.clear;
  q.sql.add(' select credito from clientes where cod_cli=' + QUotedstr(cod_cliente));
  q.active := true;

  if ((total_debitos + valor_pleiteado) > q.fieldbyname('credito').value) then
    Result := false
  else
    Result := true;

  FreeAndNil(q);
end;

function Tfrm_modelo_vazio.verificaFormaPagamentoFaturada(cod_forma: string): boolean;
var
  q: TIBquery;
  total_debitos: double;
begin
  q := TIBquery.create(self);
  q.database := dm.dbrestaurante;
  q.transaction := dm.transacao;

  q.active := false;
  q.sql.clear;
  q.sql.add(' select tipo from formas_pagamento=' + Quotedstr(cod_forma));
  q.active := true;

  if q.FieldByName('tipo').Value = 2 then
    Result := true
  else
    Result := false;

  FreeAndNil(q);
end;

function Tfrm_modelo_vazio.verificaExistenciaMetre(cod_garcon: string): boolean;
var
  q: TIBquery;
begin
  q := TIBquery.create(self);
  q.database := dm.dbrestaurante;
  q.transaction := dm.transacao;

  q.active := false;
  q.sql.clear;
  q.sql.add(' select cod_garcon from garcons where cod_garcon=' + Quotedstr(cod_garcon) + ' and metre=1');
  q.active := true;

  if q.isEmpty then
    Result := false
  else
    Result := true;
  FreeAndNil(q);
end;

function Tfrm_modelo_vazio.verificaExistenciaGarconMetre(cod_garcon: string): boolean;
var
  q: TIBquery;
begin
  q := TIBquery.create(self);
  q.database := dm.dbrestaurante;
  q.transaction := dm.transacao;

  q.active := false;
  q.sql.clear;
  q.sql.add(' select cod_garcon from garcons where cod_garcon=' + Quotedstr(cod_garcon) + ' and cod_garcon <>' + Quotedstr('000'));
  q.active := true;

  result := not q.isEmpty;
  FreeAndNil(q);
end;

function Tfrm_modelo_vazio.verificaExistenciaGrupoTouch(codGrupo: string): boolean;
var
  q: TIBquery;
begin
  q := TIBquery.create(self);
  q.database := dm.dbrestaurante;
  q.transaction := dm.transacao;

  q.active := false;
  q.sql.clear;
  q.sql.add(' select * from grupos_touch where codigo=' + Quotedstr(codGrupo));
  q.active := true;

  result := not q.isEmpty;
  FreeAndNil(q);
end;

function Tfrm_modelo_vazio.verificaExistenciaPromoter(codPromoter: string): boolean;
var
  q: TIBquery;
begin
  q := TIBquery.create(self);
  q.database := dm.dbrestaurante;
  q.transaction := dm.transacao;

  q.active := false;
  q.sql.clear;
  q.sql.add(' select cod_promoter from promoters where cod_promoter=' + Quotedstr(codPromoter));
  q.active := true;

  result := not q.isEmpty;
  FreeAndNil(q);
end;

function Tfrm_modelo_vazio.verificaExistenciaDepartamento(codDepartamento: string): boolean;
var
  q: TIBquery;
begin
  q := TIBquery.create(self);
  q.database := dm.dbrestaurante;
  q.transaction := dm.transacao;

  q.active := false;
  q.sql.clear;
  q.sql.add(' select codigo from departamentos where codigo=' + codDepartamento);
  q.active := true;

  result := not q.isEmpty;
  FreeAndNil(q);
end;

function Tfrm_modelo_vazio.verificaExistenciaGuarnicao(codGuarnicao: string): boolean;
var
  q: TIBquery;
begin
  q := TIBquery.create(self);
  q.database := dm.dbrestaurante;
  q.transaction := dm.transacao;

  q.active := false;
  q.sql.clear;
  q.sql.add(' select codigo from guarnicoes where codigo=' + Quotedstr(codGuarnicao));
  q.active := true;

  result := not q.isEmpty;
  FreeAndNil(q);
end;

function Tfrm_modelo_vazio.verificaExistenciaEntregador(codEntregador: string): boolean;
var
  q: TIBquery;
begin
  q := TIBquery.create(self);
  q.database := dm.dbrestaurante;
  q.transaction := dm.transacao;

  q.active := false;
  q.sql.clear;
  q.sql.add(' select codigo from entregadores where codigo=' + Quotedstr(codEntregador));
  q.active := true;

  result := not q.isEmpty;
  FreeAndNil(q);
end;

function Tfrm_modelo_vazio.verificaExistenciaTipoSangria(codTipo: string): boolean;
var
  q: TIBquery;
begin
  q := TIBquery.create(self);
  q.database := dm.dbrestaurante;
  q.transaction := dm.transacao;

  q.active := false;
  q.sql.clear;
  q.sql.add(' select * from tipos_sangria where codigo=' + Quotedstr(codTipo));
  q.active := true;

  result := not q.isEmpty;
  FreeAndNil(q);
end;

function Tfrm_modelo_vazio.verificaExistenciaMotivoEstorno(codMotivo: string): boolean;
var
  q: TIBquery;
begin
  q := TIBquery.create(self);
  q.database := dm.dbrestaurante;
  q.transaction := dm.transacao;

  q.active := false;
  q.sql.clear;
  q.sql.add(' select * from motivos_estornos where codigo=' + Quotedstr(codMotivo));
  q.active := true;

  result := not q.isEmpty;
  FreeAndNil(q);
end;

function Tfrm_modelo_vazio.verificaExistenciaObservacaoPreparo(codObs: string): boolean;
var
  q: TIBquery;
begin
  q := TIBquery.create(self);
  q.database := dm.dbrestaurante;
  q.transaction := dm.transacao;

  q.active := false;
  q.sql.clear;
  q.sql.add(' select * from observacoes_padrao where cod_obs=' + Quotedstr(codObs));
  q.active := true;

  result := not q.isEmpty;
  FreeAndNil(q);
end;

function Tfrm_modelo_vazio.verificaExistenciaTipoDeBaixa(codTipo: string): boolean;
var
  q: TIBquery;
begin
  q := TIBquery.create(self);
  q.database := dm.dbrestaurante;
  q.transaction := dm.transacao;

  q.active := false;
  q.sql.clear;
  q.sql.add(' select * from tipos_baixa  where cod_tipo=' + Quotedstr(codTipo));
  q.active := true;

  result := not q.isEmpty;
  FreeAndNil(q);
end;

function Tfrm_modelo_vazio.verificaExistenciaUnidade(cod_unidade: string): boolean;
var
  q: TIBquery;
begin
  q := TIBquery.create(self);
  q.database := dm.dbrestaurante;
  q.transaction := dm.transacao;

  q.active := false;
  q.sql.clear;
  q.sql.add(' select cod_unidade from unidades where cod_unidade=' + Quotedstr(cod_unidade));
  q.active := true;

  result := not q.isEmpty;
  FreeAndNil(q);
end;

function Tfrm_modelo_vazio.verificaExistenciaCentroDeCusto(cod_c_custo: string): boolean;
var
  q: TIBquery;
begin
  q := TIBquery.create(self);
  q.database := dm.dbrestaurante;
  q.transaction := dm.transacao;

  q.active := false;
  q.sql.clear;
  q.sql.add(' select  c.cod_conta from plano_contas_financeiro c  where c.cod_conta=' + Quotedstr(cod_c_custo));
  q.active := true;
  result := not q.isEmpty;

  FreeAndNil(q);
end;

function Tfrm_modelo_vazio.verificaCentroDeCustoAnalitico(cod_c_custo: string): boolean;
begin
  if Length(cod_c_custo) < 6 then
    result := false
  else
    Result := true;
end;

procedure Tfrm_modelo_vazio.Edit1Exit(Sender: TObject);
var
  auxiliar: string;
  moduloVenda: string;
  tamanhoPizza: string;
begin
  if Sender is TCustomEdit then
  begin
    (Sender as TCustomEdit).Brush.Color := clWhite;
    (Sender as TCustomEdit).Repaint;
  end;

  if Sender is Tdbgrid then
  begin
    (Sender as TDBGrid).Color := clWhite;
    (Sender as TDBGrid).Repaint;
  end;

  if Sender is TcxLookupComboBox then
  begin
    (Sender as TcxLookupComboBox).DroppedDown := false;
    (Sender as TcxLookupComboBox).Style.Color := cor_ao_sair;
  end;

  if Sender is TCustomEdit and ((Sender as TCustomEdit).Name = 'edChaveNFE') then
  begin
    if ((Sender is TCustomEdit and (trim((Sender as TCustomEdit).text) = ''))) then
    begin
      Exit;
    end
    else
    begin

      if (ValidarChaveNFe((Sender as TCustomEdit).text) = false) then
      begin
        ShowMessage('Chave da NF-E informada não é válida!');
        (Sender as TCustomEdit).Clear;
        (Sender as TCustomEdit).SelectAll;
        (Sender as TCustomEdit).SetFocus;
      end;
    end;

  end;

  if Sender is TCustomEdit and ((Sender as TCustomEdit).Name = 'edMesa') then
  begin
    if ((Sender is TCustomEdit and (trim((Sender as TCustomEdit).text) = ''))) then
      Exit;

    try
      begin
        auxiliar := FormatFloat('0000', StrToFloat((Sender as TCustomEdit).text));
        (Sender as TCustomEdit).text := auxiliar;
      end;

    except
      begin
        ShowMessage('Número da mesa inválido!');
        (Sender as TCustomEdit).Clear;
        (Sender as TCustomEdit).SetFocus;
        exit;
      end;
    end;
  end;

  if ((Sender is TDBEdit and ((Sender as TDBEdit).Name = 'ed_cod_grupo_fornecedor')) or (Sender is TEdit and ((Sender as TEdit).Name = 'ed_cod_grupo_fornecedor'))) then
  begin
    if ((Sender is TDBEdit and (trim((Sender as TDBEdit).text) = '')) or (Sender is TEdit and (trim((Sender as TEdit).text) = ''))) then
      exit
    else
    begin
      if (Sender is TDBEdit) then
        auxiliar := (Sender as TDBEdit).text
      else
        auxiliar := (Sender as TEdit).text;

      try
        auxiliar := FormatFloat('0000', StrToFloat(auxiliar));
      except
        begin
          showmessage('Código de grupo de fornecedor inválido!');
          if (Sender is TDBEdit) then
            (Sender as TDBEdit).SetFocus
          else
            (Sender as TEdit).SetFocus;
          exit;
        end;
      end;
    end;

    if (Sender is TDBEdit) then
      (Sender as TDBEdit).Text := auxiliar
    else
      (Sender as TEdit).Text := auxiliar;

    if verificaExistenciaGrupoFonecedor(auxiliar) then
      exibeInformacoes('ed_cod_grupo_fornecedor', 'ed_desc_grupo_fornecedor', 'grupo_fornecedor', 'codigo,descricao', 'codigo', auxiliar, 1)
    else
    begin
      showmessage('Código de grupo de fornecedor inválido!');
      if (Sender is TDBEdit) then
        (Sender as TDBEdit).SetFocus
      else
        (Sender as TEdit).SetFocus;
      exit;

    end;

  end;

  if ((Sender is TCustomEdit and ((Sender as TCustomEdit).Name = 'ed_cod_fornecedor'))) then
  begin
    if ((Sender is TCustomEdit and (trim((Sender as TCustomEdit).text) = ''))) then
      exit;

    auxiliar := (Sender as TCustomEdit).text;
    try
      auxiliar := FormatFloat('0000', StrToFloat(auxiliar));
    except
      begin
        showmessage('Código de fornecedor !!');
        (Sender as TCustomEdit).SetFocus;
        exit;
      end;
    end;
    (Sender as TCustomEdit).Text := auxiliar;

    if (verificaExistenciaFornecedor(trim((Sender as TCustomEdit).Text)) = false) then
    begin
      showmessage('Código de fornecedor não existe!');
      (Sender as TCustomEdit).SetFocus;
      exit;
    end
    else
    begin
      exibeInformacoesFornecedor(trim((Sender as TCustomEdit).Text));
    end;
  end;

  if (Sender is TCustomEdit) and (trim(copy((Sender as TCustomEdit).Name, 0, 10)) = 'edCodPizza') then
  begin
    moduloVenda := copy((Sender as TCustomEdit).Name, 11, 1);
    tamanhoPizza := copy((Sender as TCustomEdit).Name, 12, 3);

    if ((Sender is TCustomEdit and (trim((Sender as TCustomEdit).text) = ''))) then
      exit;

    auxiliar := (Sender as TCustomEdit).text;
    try
      auxiliar := FormatFloat('00000', StrToFloat(auxiliar));
    except
      begin
        showmessage('Código de produto inválido!');
        (Sender as TCustomEdit).SetFocus;
        exit;
      end;
    end;
    (Sender as TCustomEdit).Text := auxiliar;

    if (verificaExistenciaProduto(trim((Sender as TCustomEdit).Text), 1) = false) then
    begin
      showmessage('Código de produto não existe!');
      (Sender as TCustomEdit).SetFocus;
      exit;
    end
    else
    begin
      if verificaSeProdutoEhPizza(trim((Sender as TCustomEdit).text), 1) then
      begin
        exibeInformacoesProdutoPizza(trim((Sender as TCustomEdit).text), tamanhoPizza, moduloVenda);
      end
      else
      begin

        if MessageDlg('O produto informado não é uma pizza. Deseja que o sistema ajuste-o automaticamente agora ?', mtConfirmation, [MbYes, mbNo], 0) = Mryes then
        begin
          dm.qryauxiliar.Active := false;
          dm.qryauxiliar.SQL.Clear;
          dm.qryauxiliar.SQL.Add('update produtos set pizza=1 where cod_produto=' + Quotedstr(trim((Sender as TCustomEdit).text)));
          dm.qryauxiliar.ExecSQL;
        end
        else
        begin
          (Sender as TCustomEdit).SetFocus;
          exit;
        end;
      end;
    end;
  end;

  if ((Sender is TCustomEdit and ((Sender as TCustomEdit).Name = 'edCodBairro'))) then
  begin
    if ((Sender is TCustomEdit and (trim((Sender as TCustomEdit).text) = ''))) then
      exit;

    auxiliar := (Sender as TCustomEdit).text;
    try
      auxiliar := Inttostr(strToInt(auxiliar));
    except
      begin
        showmessage('Código de Bairro Inválido');
        (Sender as TCustomEdit).SetFocus;
        exit;
      end;
    end;
    (Sender as TCustomEdit).Text := auxiliar;

    if (verificaExistenciaBairro(trim((Sender as TCustomEdit).Text)) = false) then
    begin
      showmessage('Código de bairro inexistente');
      (Sender as TCustomEdit).SetFocus;
      exit;
    end
    else
    begin
      exibeInformacoesBairro((Sender as TCustomEdit).Text);
    end;
  end;

  if ((Sender is TCustomEdit and ((Sender as TCustomEdit).Name = 'ed_cod_tipo_documento'))) then
  begin

    if trim((Sender as TCustomEdit).text) = '' then
      exit;

    auxiliar := (Sender as TCustomEdit).text;
    try
      auxiliar := FormatFloat('000', StrToFloat(auxiliar));
    except
      begin
        showmessage('Código de tipo de documento inválido!');
        (Sender as TCustomEdit).SetFocus;
        exit;
      end;
    end;
    (Sender as TCustomEdit).Text := auxiliar;

    if (verificaExistenciaTipoDocumento(trim((Sender as TCustomEdit).Text)) = false) then
    begin
      showmessage('Código de tipo de documento não existe!');
      (Sender as TCustomEdit).SetFocus;
      exit;
    end
    else
    begin
      exibeInformacoesTiposDocumento(trim((Sender as TCustomEdit).Text));
    end;
  end;

  if ((Sender is TCustomEdit and ((Sender as TCustomEdit).Name = 'ed_cod_tipo_entrada'))) then
  begin
    if trim((Sender as TCustomEdit).text) = '' then
      exit;

    auxiliar := (Sender as TCustomEdit).text;
    try
      auxiliar := FormatFloat('000', StrToFloat(auxiliar));
    except
      begin
        showmessage('Código de tipo de entrada inválido!');
        (Sender as TCustomEdit).SetFocus;
        exit;
      end;
    end;
    (Sender as TCustomEdit).Text := auxiliar;

    if (verificaExistenciaTipoEntrada(trim((Sender as TCustomEdit).Text)) = false) then
    begin
      showmessage('Código de tipo de entrada  não existe!');
      (Sender as TCustomEdit).SetFocus;
      exit;
    end
    else
    begin
      exibeInformacoesTiposEntrada(trim((Sender as TCustomEdit).Text));
    end;
  end;

  if ((Sender is TCustomEdit and ((Sender as TCustomEdit).Name = 'ed_cefop_entradas'))) then
  begin
    if trim((Sender as TCustomEdit).text) = '' then
      exit;

    auxiliar := (Sender as TCustomEdit).text;
    try
      auxiliar := FormatFloat('0000', StrToFloat(auxiliar));
    except
      begin
        showmessage('CFOP inválido!');
        (Sender as TCustomEdit).SetFocus;
        exit;
      end;
    end;
    (Sender as TCustomEdit).Text := auxiliar;

    if (verificaExistenciaCFOP(trim((Sender as TCustomEdit).Text)) = false) then
    begin
      showmessage('CFOP informado  não existe!');
      (Sender as TCustomEdit).SetFocus;
      exit;
    end
    else
    begin
      exibeInformacoesCFOPEntrada(trim((Sender as TCustomEdit).Text));
    end;
  end;

  if ((Sender is TCustomEdit and ((Sender as TCustomEdit).Name = 'ed_cefop_saidas'))) then
  begin
    if trim((Sender as TCustomEdit).text) = '' then
      exit;

    auxiliar := (Sender as TCustomEdit).text;
    try
      auxiliar := FormatFloat('0000', StrToFloat(auxiliar));
    except
      begin
        showmessage('CFOP inválido!');
        (Sender as TCustomEdit).SetFocus;
        exit;
      end;
    end;
    (Sender as TCustomEdit).Text := auxiliar;

    if (verificaExistenciaCFOP(trim((Sender as TCustomEdit).Text)) = false) then
    begin
      showmessage('CFOP informado  não existe!');
      (Sender as TCustomEdit).SetFocus;
      exit;
    end
    else
    begin
      exibeInformacoesCFOPSaida(trim((Sender as TCustomEdit).Text));
    end;
  end;

  if ((Sender is TCustomEdit and ((Sender as TCustomEdit).Name = 'ed_cfop'))) then
  begin
    if trim((Sender as TCustomEdit).text) = '' then
      exit;

    auxiliar := (Sender as TCustomEdit).text;
    try
      auxiliar := FormatFloat('0000', StrToFloat(auxiliar));
    except
      begin
        showmessage('CFOP inválido!');
        (Sender as TCustomEdit).SetFocus;
        exit;
      end;
    end;
    (Sender as TCustomEdit).Text := auxiliar;

    if (verificaExistenciaCFOP(trim((Sender as TCustomEdit).Text)) = false) then
    begin
      showmessage('CFOP informado  não existe!');
      (Sender as TCustomEdit).SetFocus;
      exit;
    end
    else
    begin
      exibeInformacoesCFOP(trim((Sender as TCustomEdit).Text));
    end;
  end;

  if ((Sender is TCustomEdit and ((Sender as TCustomEdit).Name = 'edCfopTransferencia'))) then
  begin
    if trim((Sender as TCustomEdit).text) = '' then
      exit;

    auxiliar := (Sender as TCustomEdit).text;
    try
      auxiliar := FormatFloat('0000', StrToFloat(auxiliar));
    except
      begin
        showmessage('CFOP de transferência inválido!');
        (Sender as TCustomEdit).SetFocus;
        exit;
      end;
    end;
    (Sender as TCustomEdit).Text := auxiliar;

    if (verificaExistenciaCFOP(trim((Sender as TCustomEdit).Text)) = false) then
    begin
      showmessage('CFOP de transferência informado  não existe!');
      (Sender as TCustomEdit).SetFocus;
      exit;
    end
    else
    begin
      exibeInformacoesCFOPTransferencia(trim((Sender as TCustomEdit).Text));
    end;
  end;

  if ((Sender is TCustomEdit and ((Sender as TCustomEdit).Name = 'edCfopDevolucao'))) then
  begin
    if trim((Sender as TCustomEdit).text) = '' then
      exit;

    auxiliar := (Sender as TCustomEdit).text;
    try
      auxiliar := FormatFloat('0000', StrToFloat(auxiliar));
    except
      begin
        showmessage('CFOP de devolução inválido!');
        (Sender as TCustomEdit).SetFocus;
        exit;
      end;
    end;
    (Sender as TCustomEdit).Text := auxiliar;

    if (verificaExistenciaCFOP(trim((Sender as TCustomEdit).Text)) = false) then
    begin
      showmessage('CFOP de devolução informado não existe!');
      (Sender as TCustomEdit).SetFocus;
      exit;
    end
    else
    begin
      exibeInformacoesCFOPDevolucao(trim((Sender as TCustomEdit).Text));
    end;
  end;

  if ((Sender is TCustomEdit and ((Sender as TCustomEdit).Name = 'edCodTipoItemSped'))) then
  begin
    if trim((Sender as TCustomEdit).text) = '' then
      exit;

    auxiliar := (Sender as TCustomEdit).text;
    try
      auxiliar := FormatFloat('00', StrToFloat(auxiliar));
    except
      begin
        showmessage('Tipo de ítem inválido!');
        (Sender as TCustomEdit).SetFocus;
        exit;
      end;
    end;
    (Sender as TCustomEdit).Text := auxiliar;

    if (verificaExistenciaTipoItemSPED(trim((Sender as TCustomEdit).Text)) = false) then
    begin
      showmessage('Tipo de ítem não existe!');
      (Sender as TCustomEdit).SetFocus;
      exit;
    end
    else
    begin
      exibeInformacoesTipoItemSPED(trim((Sender as TCustomEdit).Text));
    end;
  end;

  if ((Sender is TCustomEdit and ((Sender as TCustomEdit).Name = 'edCodNCM'))) then
  begin
    if trim((Sender as TCustomEdit).text) = '' then
      exit;

    if (verificaExistenciaNCM(trim((Sender as TCustomEdit).Text)) = false) then
    begin
      showmessage('NCM informado não existe');
      (Sender as TCustomEdit).Clear;

      (Sender as TCustomEdit).SetFocus;
      exit;
    end
    else
    begin
      exibeInformacoesNCM(trim((Sender as TCustomEdit).Text));
    end;
  end;

  if ((Sender is TCustomEdit and ((Sender as TCustomEdit).Name = 'edCodGeneroItem'))) then
  begin
    if trim((Sender as TCustomEdit).text) = '' then
      exit;

    auxiliar := (Sender as TCustomEdit).text;
    try
      auxiliar := FormatFloat('00', StrToFloat(auxiliar));
    except
      begin
        showmessage('Gênero de ítem inválido');
        (Sender as TCustomEdit).SetFocus;
        (Sender as TCustomEdit).clear;
        exit;
      end;
    end;
    (Sender as TCustomEdit).Text := auxiliar;

    if (verificaExistenciaGeneroItem(trim((Sender as TCustomEdit).Text)) = false) then
    begin
      showmessage('Gênero de ítem informado não existe');
      (Sender as TCustomEdit).SetFocus;
      (Sender as TCustomEdit).clear;
      exit;
    end
    else
    begin
      exibeInformacoesGeneroItem(trim((Sender as TCustomEdit).Text));
    end;
  end;

  if ((Sender is TCustomEdit and ((Sender as TCustomEdit).Name = 'ed_cod_modelo_nota_fiscal'))) then
  begin
    if trim((Sender as TCustomEdit).text) = '' then
      exit;

    auxiliar := (Sender as TCustomEdit).text;

    try
      auxiliar := FormatFloat('00', StrToFloat(auxiliar));
    except
      begin
         //   showmessage('Código de Modelo de Nota Fiscal inválido!');
//            (sender as TCustomEdit).SetFocus;
  //          exit;
      end;
    end;
    (Sender as TCustomEdit).Text := auxiliar;

    if (verificaExistenciaModeloNotaFiscal(trim((Sender as TCustomEdit).Text)) = false) then
    begin
      showmessage('Código de Modelo de Nota Fiscal inválido!');
      (Sender as TCustomEdit).SetFocus;
      exit;
    end
    else
    begin
      exibeInformacoesModeloNotaFiscal(trim((Sender as TCustomEdit).Text));
    end;
  end;

  if ((Sender is TCustomEdit and ((Sender as TCustomEdit).Name = 'edCodSituacaoDocFiscal'))) then
  begin
    if trim((Sender as TCustomEdit).text) = '' then
      exit;

    auxiliar := (Sender as TCustomEdit).text;
    try
      auxiliar := FormatFloat('00', StrToFloat(auxiliar));
    except
      begin
        showmessage('Código de situação de documento fiscal inválido!');
        (Sender as TCustomEdit).SetFocus;
        exit;
      end;
    end;
    (Sender as TCustomEdit).Text := auxiliar;

    if (verificaExistenciaSituacaoDocumentoFiscal(trim((Sender as TCustomEdit).Text)) = false) then
    begin
      showmessage('Código de situação de documento fiscal inválido!');
      (Sender as TCustomEdit).SetFocus;
      exit;
    end
    else
    begin
      exibeInformacoesSituacaoDocumentoFiscal(trim((Sender as TCustomEdit).Text));
    end;
  end;

  if ((Sender is TCustomEdit and ((Sender as TCustomEdit).Name = 'ed_cst'))) then
  begin
    if trim((Sender as TCustomEdit).text) = '' then
      exit;

    auxiliar := (Sender as TCustomEdit).text;
    try
      auxiliar := FormatFloat('000', StrToFloat(auxiliar));
    except
      begin
        showmessage('CST inválido!');
        (Sender as TCustomEdit).SetFocus;
        exit;
      end;
    end;
    (Sender as TCustomEdit).Text := auxiliar;

    if (verificaExistenciaCST(trim((Sender as TCustomEdit).Text)) = false) then
    begin
      showmessage('CST inválido!');
      (Sender as TCustomEdit).SetFocus;
      exit;
    end
    else
    begin
      exibeInformacoesCST(trim((Sender as TCustomEdit).Text));
    end;
  end;

  if ((Sender is TCustomEdit and ((Sender as TCustomEdit).Name = 'edCstSaida'))) then
  begin
    if trim((Sender as TCustomEdit).text) = '' then
      exit;

    auxiliar := (Sender as TCustomEdit).text;
    try
      auxiliar := FormatFloat('000', StrToFloat(auxiliar));
    except
      begin
        showmessage('CST de saída inválido!');
        (Sender as TCustomEdit).SetFocus;
        exit;
      end;
    end;
    (Sender as TCustomEdit).Text := auxiliar;

    if (verificaExistenciaCST(trim((Sender as TCustomEdit).Text)) = false) then
    begin
      showmessage('CST de saída inválido!');
      (Sender as TCustomEdit).SetFocus;
      exit;
    end
    else
    begin
      exibeInformacoesCST_saida(trim((Sender as TCustomEdit).Text));
    end;
  end;

  if ((Sender is TCustomEdit and ((Sender as TCustomEdit).Name = 'edCstTransferencia'))) then
  begin
    if trim((Sender as TCustomEdit).text) = '' then
      exit;

    auxiliar := (Sender as TCustomEdit).text;
    try
      auxiliar := FormatFloat('000', StrToFloat(auxiliar));
    except
      begin
        showmessage('CST de transferência inválido!');
        (Sender as TCustomEdit).SetFocus;
        exit;
      end;
    end;
    (Sender as TCustomEdit).Text := auxiliar;

    if (verificaExistenciaCST(trim((Sender as TCustomEdit).Text)) = false) then
    begin
      showmessage('CST de transferência inválido!');
      (Sender as TCustomEdit).SetFocus;
      exit;
    end
    else
    begin
      exibeInformacoesCSTTransferencias(trim((Sender as TCustomEdit).Text));
    end;
  end;

  if ((Sender is TCustomEdit and ((Sender as TCustomEdit).Name = 'edCstDevolucao'))) then
  begin
    if trim((Sender as TCustomEdit).text) = '' then
      exit;

    auxiliar := (Sender as TCustomEdit).text;
    try
      auxiliar := FormatFloat('000', StrToFloat(auxiliar));
    except
      begin
        showmessage('CST de devolução inválido!');
        (Sender as TCustomEdit).SetFocus;
        exit;
      end;
    end;
    (Sender as TCustomEdit).Text := auxiliar;

    if (verificaExistenciaCST(trim((Sender as TCustomEdit).Text)) = false) then
    begin
      showmessage('CST de devolução inválido!');
      (Sender as TCustomEdit).SetFocus;
      exit;
    end
    else
    begin
      exibeInformacoesCSTDevolucoes(trim((Sender as TCustomEdit).Text));
    end;
  end;

  if ((Sender is TCustomEdit and ((Sender as TCustomEdit).Name = 'ed_cod_usuario'))) then
  begin

    if ((Sender is TCustomEdit and (trim((Sender as TCustomEdit).text) = ''))) then
      exit;

    auxiliar := (Sender as TCustomEdit).text;
    try
      auxiliar := FormatFloat('00', StrToFloat(auxiliar));
    except
      begin
        showmessage('Código de usuário inválido!');
        (Sender as TCustomEdit).SetFocus;
        exit;
      end;
    end;
    (Sender as TCustomEdit).Text := auxiliar;

    if (verificaExistenciaUsuario(trim((Sender as TCustomEdit).Text)) = false) then
    begin
      showmessage('Código de usuário  não existe!');
      (Sender as TCustomEdit).SetFocus;
      exit;
    end
    else
    begin
      exibeInformacoesUsuario(trim((Sender as TCustomEdit).Text));
    end;
  end;

  if ((Sender is TDBEdit and ((Sender as TDBEdit).Name = 'ed_cod_historico')) or (Sender is TEdit and ((Sender as TEdit).Name = 'ed_cod_historico'))) then
  begin

    if ((Sender is TDBEdit and (trim((Sender as TDBEdit).text) = '')) or (Sender is TEdit and (trim((Sender as TEdit).text) = ''))) then
      exit
    else
    begin
      if (Sender is TDBEdit) then
        auxiliar := (Sender as TDBEdit).text
      else
        auxiliar := (Sender as TEdit).text;

      try
        auxiliar := FormatFloat('000', StrToFloat(auxiliar));
      except
        begin
          showmessage('Código de histórico de caixa inválido!!');
          if (Sender is TDBEdit) then
            (Sender as TDBEdit).SetFocus
          else
            (Sender as TEdit).SetFocus;
          exit;
        end;
      end;
    end;

    if (Sender is TDBEdit) then
      (Sender as TDBEdit).Text := auxiliar
    else
      (Sender as TEdit).Text := auxiliar;

    if verificaExistenciaHistorico(auxiliar) then
      exibeInformacoes('ed_cod_historico', 'ed_desc_historico', 'historico_caixa', 'cod_historico,descricao', 'cod_historico', auxiliar, 1)
    else
    begin
      showmessage('Código de histórico inválido!');
      if (Sender is TDBEdit) then
        (Sender as TDBEdit).SetFocus
      else
        (Sender as TEdit).SetFocus;
      exit;
    end;
  end;

  if ((Sender is TDBEdit and ((Sender as TDBEdit).Name = 'ed_cod_centro_custo')) or (Sender is TEdit and ((Sender as TEdit).Name = 'ed_cod_centro_custo'))) then
  begin

    if ((Sender is TDBEdit and (trim((Sender as TDBEdit).text) = '')) or (Sender is TEdit and (trim((Sender as TEdit).text) = ''))) then
      exit
    else
    begin
      if (Sender is TDBEdit) then
        auxiliar := (Sender as TDBEdit).text
      else
        auxiliar := (Sender as TEdit).text;

      try
        FormatFloat('000', StrToFloat(auxiliar));
      except
        begin
          showmessage('Código de centro de custo inválido!!');
          if (Sender is TDBEdit) then
            (Sender as TDBEdit).SetFocus
          else
            (Sender as TEdit).SetFocus;
          exit;
        end;
      end;
    end;

    if verificaExistenciaCentroDeCusto(auxiliar) then
      exibeInformacoesCentroCusto(auxiliar)
    else
    begin
      showmessage('Código de centro de custo inválido!!');
      if (Sender is TDBEdit) then
        (Sender as TDBEdit).SetFocus
      else
        (Sender as TEdit).SetFocus;
      exit;
    end;
  end;

  if ((Sender is TDBEdit and ((Sender as TDBEdit).Name = 'ed_cod_cidade')) or (Sender is TEdit and ((Sender as TEdit).Name = 'ed_cod_cidade'))) then
  begin

    if ((Sender is TDBEdit and (trim((Sender as TDBEdit).text) = '')) or (Sender is TEdit and (trim((Sender as TEdit).text) = ''))) then
      exit
    else
    begin
      if (Sender is TDBEdit) then
        auxiliar := (Sender as TDBEdit).text
      else
        auxiliar := (Sender as TEdit).text;

      try
        begin
          auxiliar := FormatFloat('00000', StrToFloat(auxiliar));
        end;

      except
        begin
          showmessage('Código de cidade inválido!');
          if (Sender is TDBEdit) then
            (Sender as TDBEdit).SetFocus
          else
            (Sender as TEdit).SetFocus;
          exit;
        end;
      end;
    end;

    if (Sender is TDBEdit) then
      (Sender as TDBEdit).Text := auxiliar
    else
      (Sender as TEdit).Text := auxiliar;

    if verificaExistenciaCidade(auxiliar) then
      exibeInformacoes('ed_cod_cidade', 'ed_nome_cidade', 'cidade', 'cod_cidade,nome', 'cod_cidade', auxiliar, 1)
    else
    begin
      showmessage('Código de cidade inválido!');
      if (Sender is TDBEdit) then
        (Sender as TDBEdit).SetFocus
      else
        (Sender as TEdit).SetFocus;
      exit;

    end;
  end;

  if ((Sender is TCustomEdit and ((Sender as TCustomEdit).Name = 'edCodPromoter'))) then
  begin

    if ((Sender is TCustomEdit and (trim((Sender as TCustomEdit).text) = ''))) then
      exit
    else
    begin
      auxiliar := (Sender as TCustomEdit).text;
      try
        auxiliar := FormatFloat('000', StrToFloat(auxiliar));
      except
        begin
          showmessage('Código de promoter inválido!!');
          (Sender as TCustomEdit).SetFocus;
          exit;
        end;
      end;
    end;
    (Sender as TCustomEdit).Text := auxiliar;

    if (verificaExistenciaPromoter(trim((Sender as TCustomEdit).Text)) = false) then
    begin
      showmessage('Código de promoter inexistente!');
      (Sender as TCustomEdit).SetFocus;
      exit;
    end
    else
    begin
      exibeInformacoesPromoter(trim((Sender as TCustomEdit).Text));
    end;
  end;

  if ((Sender is TCustomEdit and ((Sender as TCustomEdit).Name = 'ed_cod_garcon'))) then
  begin

    if ((Sender is TCustomEdit and (trim((Sender as TCustomEdit).text) = ''))) then
      exit
    else
    begin
      auxiliar := (Sender as TCustomEdit).text;
      try
        auxiliar := FormatFloat('000', StrToFloat(auxiliar));
      except
        begin
          showmessage('Código de garçon inválido!!');
          (Sender as TCustomEdit).SetFocus;
          exit;
        end;
      end;
    end;
    (Sender as TCustomEdit).Text := auxiliar;

    if (verificaExistenciaGarconMetre(trim((Sender as TCustomEdit).Text)) = false) then
    begin
      showmessage('Código de garçon inexistente!');
      (Sender as TCustomEdit).SetFocus;
      exit;
    end
    else
    begin
      exibeInformacoesGarcons(trim((Sender as TCustomEdit).Text));
    end;
  end;

  if ((Sender is TCustomEdit and ((Sender as TCustomEdit).Name = 'edCodDepartamento'))) then
  begin

    if ((Sender is TCustomEdit and (trim((Sender as TCustomEdit).text) = ''))) then
      exit
    else
    begin
      auxiliar := (Sender as TCustomEdit).text;
      try
        auxiliar := Inttostr(StrToInt(auxiliar));
      except
        begin
          showmessage('Código de departamento inválido!');
          (Sender as TCustomEdit).SetFocus;
          exit;
        end;
      end;
    end;
    (Sender as TCustomEdit).Text := auxiliar;

    if (verificaExistenciaDepartamento(trim((Sender as TCustomEdit).Text)) = false) then
    begin
      showmessage('Código de departamento inexistente');
      (Sender as TCustomEdit).SetFocus;
      exit;
    end
    else
    begin
      exibeInformacoesDepartamento(trim((Sender as TCustomEdit).Text));
    end;
  end;

  if ((Sender is TCustomEdit and ((Sender as TCustomEdit).Name = 'edCodGuarnicao'))) then
  begin

    if ((Sender is TCustomEdit and (trim((Sender as TCustomEdit).text) = ''))) then
      exit
    else
    begin
      auxiliar := (Sender as TCustomEdit).text;
      try
        auxiliar := FormatFloat('00', StrToFloat(auxiliar));
      except
        begin
          showmessage('Código de Guarnição inválido!');
          (Sender as TCustomEdit).SetFocus;
          exit;
        end;
      end;

    end;

    (Sender as TCustomEdit).Text := auxiliar;

    if (verificaExistenciaGuarnicao(trim((Sender as TCustomEdit).Text)) = false) then
    begin
      showmessage('Código de Guarnição inexistente!');
      (Sender as TCustomEdit).SetFocus;
      exit;
    end
    else
    begin
      exibeInformacoesGuarnicao(trim((Sender as TCustomEdit).Text));
    end;
  end;

  if ((Sender is TCustomEdit and ((Sender as TCustomEdit).Name = 'edCodGrupoTouch'))) then
  begin

    if ((Sender is TCustomEdit and (trim((Sender as TCustomEdit).text) = ''))) then
      exit
    else
    begin
      auxiliar := (Sender as TCustomEdit).text;
      try
        auxiliar := FormatFloat('00', StrToFloat(auxiliar));
      except
        begin
          showmessage('Código de grupo touch inválido!');
          (Sender as TCustomEdit).SetFocus;
          exit;
        end;
      end;

    end;

    (Sender as TCustomEdit).Text := auxiliar;

    if (verificaExistenciaGrupoTouch(trim((Sender as TCustomEdit).Text)) = false) then
    begin
      showmessage('Código de grupo touch inexistente!');
      (Sender as TCustomEdit).SetFocus;
      exit;
    end
    else
    begin
      exibeInformacoesGuarnicao(trim((Sender as TCustomEdit).Text));
    end;
  end;

  if ((Sender is TCustomEdit and ((Sender as TCustomEdit).Name = 'edCodEntregador'))) then
  begin

    if ((Sender is TCustomEdit and (trim((Sender as TCustomEdit).text) = ''))) then
      exit
    else
    begin
      auxiliar := (Sender as TCustomEdit).text;
      try
        auxiliar := FormatFloat('000', StrToFloat(auxiliar));
      except
        begin
          showmessage('Código de entregador invalido!');
          (Sender as TCustomEdit).SetFocus;
          exit;
        end;
      end;
    end;
    (Sender as TCustomEdit).Text := auxiliar;

    if (verificaExistenciaEntregador(trim((Sender as TCustomEdit).Text)) = false) then
    begin
      showmessage('Código de entregador invalido');
      (Sender as TCustomEdit).SetFocus;
      exit;
    end
    else
    begin
      exibeInformacoesEntregador(trim((Sender as TCustomEdit).Text));
    end;
  end;

  if ((Sender is TCustomEdit and ((Sender as TCustomEdit).Name = 'ed_cod_grupo'))) then
  begin

    if ((Sender is TCustomEdit and (trim((Sender as TCustomEdit).text) = ''))) then
      exit;

    if (verificaExistenciaGrupo(trim((Sender as TCustomEdit).Text)) = false) then
    begin
      showmessage('Código de grupo inexistente!');
      (Sender as TCustomEdit).SetFocus;
      exit;
    end
    else
    begin
      exibeInformacoesGrupos(trim((Sender as TCustomEdit).Text));
    end;
  end;

  if ((Sender is TCustomEdit and ((Sender as TCustomEdit).Name = 'edCodGrupoRD'))) then
  begin

    if ((Sender is TCustomEdit and (trim((Sender as TCustomEdit).text) = ''))) then
      exit;

    if (verificaExistenciaGrupoRD(trim((Sender as TCustomEdit).Text)) = false) then
    begin
      showmessage('Grupo do RD inexistente!');
      (Sender as TCustomEdit).SetFocus;
      exit;
    end
    else
    begin
      exibeInformacoesGruposRD(trim((Sender as TCustomEdit).Text));
    end;
  end;

  if ((Sender is TCustomEdit and ((Sender as TCustomEdit).Name = 'ed_cod_estado'))) then
  begin

    if ((Sender is TCustomEdit and (trim((Sender as TCustomEdit).text) = ''))) then
      exit;

    if (verificaExistenciaEstado(trim((Sender as TCustomEdit).Text)) = false) then
    begin
      showmessage('Código de estado inválido');
      (Sender as TCustomEdit).SetFocus;
      exit;
    end
    else
    begin
      exibeInformacoesEstado(trim((Sender as TCustomEdit).Text));
    end;
  end;

  if ((Sender is TCustomEdit and ((Sender as TCustomEdit).Name = 'ed_cod_mini_printer'))) then
  begin

    if ((Sender is TCustomEdit and (trim((Sender as TCustomEdit).text) = ''))) then
      (Sender as TCustomEdit).Text := '001';

    auxiliar := (Sender as TCustomEdit).text;
    try
      auxiliar := FormatFloat('000', StrToFloat(auxiliar));
    except
      begin
        showmessage('Código de mini printer inválido!!');
        (Sender as TCustomEdit).SetFocus;
        exit;
      end;
    end;
    (Sender as TCustomEdit).Text := auxiliar;

    if (verificaExistenciaMiniPrinter(trim((Sender as TCustomEdit).Text)) = false) then
    begin
      showmessage('Código de mini printer não existe!');
      (Sender as TCustomEdit).SetFocus;
      exit;
    end
    else
    begin
      exibeInformacoes('ed_cod_mini_printer', 'ed_desc_mini_printer', 'miniprinters', 'cod_miniprinter,descricao', 'cod_miniprinter', auxiliar, 1)
    end;
  end;

  if ((Sender is TCustomEdit and ((Sender as TCustomEdit).Name = 'ed_cod_un_entrada'))) then
  begin
    if ((Sender is TCustomEdit and (trim((Sender as TCustomEdit).text) = ''))) then
    begin
      (Sender as TCustomEdit).Text := '01';
      (Sender as TCustomEdit).SelectAll;

    end;

    auxiliar := (Sender as TCustomEdit).text;
    try
      auxiliar := FormatFloat('00', StrToFloat(auxiliar));
    except
      begin
        showmessage('Código de unidade de entrada inválido!');
        (Sender as TCustomEdit).SetFocus;
        exit;
      end;
    end;
    (Sender as TCustomEdit).Text := auxiliar;

    if (verificaExistenciaUnidade(trim((Sender as TCustomEdit).Text)) = false) then
    begin
      showmessage('Código de unidade não existe!');
      (Sender as TCustomEdit).SetFocus;
      exit;
    end
    else
    begin
      exibeInformacoesUnidadeEntrada((Sender as TCustomEdit).Text);

    end;
  end;

  if ((Sender is TCustomEdit and ((Sender as TCustomEdit).Name = 'ed_cod_un_saida'))) then
  begin
    if ((Sender is TCustomEdit and (trim((Sender as TCustomEdit).text) = ''))) then
    begin
      (Sender as TCustomEdit).Text := '01';
      (Sender as TCustomEdit).SelectAll;
    end;

    auxiliar := (Sender as TCustomEdit).text;
    try
      auxiliar := FormatFloat('00', StrToFloat(auxiliar));
    except
      begin
        showmessage('Código de unidade de saída inválido!');
        (Sender as TCustomEdit).SetFocus;
        exit;
      end;
    end;
    (Sender as TCustomEdit).Text := auxiliar;

    if (verificaExistenciaUnidade(trim((Sender as TCustomEdit).Text)) = false) then
    begin
      showmessage('Código de unidade não existe!');
      (Sender as TCustomEdit).SetFocus;
      exit;
    end
    else
    begin
      exibeInformacoesUnidadeSaida((Sender as TCustomEdit).Text);

    end;
  end;

  if ((Sender is TCustomEdit and ((Sender as TCustomEdit).Name = 'edCodSaborPizza'))) then
  begin
    if ((Sender is TCustomEdit and (trim((Sender as TCustomEdit).text) = ''))) then
      exit;

    auxiliar := (Sender as TCustomEdit).text;
    try
      auxiliar := FormatFloat('000', StrToFloat(auxiliar));
    except
      begin
        showmessage('Código de sabor de pizza inválido!');
        (Sender as TCustomEdit).SetFocus;
        exit;
      end;
    end;
    (Sender as TCustomEdit).Text := auxiliar;

    if (verificaExistenciaSaborPizza(trim((Sender as TCustomEdit).Text)) = false) then
    begin
      showmessage('Código de sabor de pizza não existe!');
      (Sender as TCustomEdit).SetFocus;
      exit;
    end
    else
    begin
      exibeInformacoesSaborPizza((Sender as TCustomEdit).Text);

    end;
  end;

  if ((Sender is TCustomEdit and ((Sender as TCustomEdit).Name = 'edCodUnFracao'))) then
  begin
    if ((Sender is TCustomEdit and (trim((Sender as TCustomEdit).text) = ''))) then
    begin
      (Sender as TCustomEdit).Text := '01';
      (Sender as TCustomEdit).SelectAll;
    end;

    auxiliar := (Sender as TCustomEdit).text;
    try
      auxiliar := FormatFloat('00', StrToFloat(auxiliar));
    except
      begin
        showmessage('Código de unidade de fração inválido!');
        (Sender as TCustomEdit).SetFocus;
        exit;
      end;
    end;
    (Sender as TCustomEdit).Text := auxiliar;

    if (verificaExistenciaUnidade(trim((Sender as TCustomEdit).Text)) = false) then
    begin
      showmessage('Código de unidade de não existe!');
      (Sender as TCustomEdit).SetFocus;
      exit;
    end
    else
    begin
      exibeInformacoesUnidadeDeFracao((Sender as TCustomEdit).Text);
    end;
  end;

  if ((Sender is TCustomEdit and ((Sender as TCustomEdit).Name = 'ed_cod_item'))) then
  begin

    if ((Sender is TCustomEdit and (trim((Sender as TCustomEdit).text) = ''))) then
      exit;

    try
      (Sender as TCustomEdit).text := FormatFloat('00000', StrToFloat((Sender as TCustomEdit).text));
    except
      showmessage('ERRO');
    end;

    if (verificaExistenciaItemEstoque(trim((Sender as TCustomEdit).Text), 1) = false) then
    begin
      showmessage('Código de ítem não existe!');
      (Sender as TCustomEdit).SetFocus;
      exit;
    end
    else
    begin
      exibeInformacoesItemEstoque(trim((Sender as TCustomEdit).Text), 1);
    end;
  end;

  if ((Sender is TCustomEdit and ((Sender as TCustomEdit).Name = 'ed_cod_item_saida'))) then
  begin

    if ((Sender is TCustomEdit and (trim((Sender as TCustomEdit).text) = ''))) then
      exit;

    try
      (Sender as TCustomEdit).text := FormatFloat('00000', StrToFloat((Sender as TCustomEdit).text));
    except
      showmessage('ERRO');
    end;

    if (verificaExistenciaProduto(trim((Sender as TCustomEdit).Text), 1) = false) then
    begin
      showmessage('Código de ítem não existe !');
      (Sender as TCustomEdit).SetFocus;
      exit;
    end
    else
    begin
      exibeInformacoesItemSaida(trim((Sender as TCustomEdit).Text), 1);
    end;
  end;

  if ((Sender is TCustomEdit and ((Sender as TCustomEdit).Name = 'edCodSubmateria'))) then
  begin

    if ((Sender is TCustomEdit and (trim((Sender as TCustomEdit).text) = ''))) then
      exit;

    try
      (Sender as TCustomEdit).text := FormatFloat('00000', StrToFloat((Sender as TCustomEdit).text));
    except
      showmessage('ERRO');
    end;

    if (verificaExistenciaSubmateria(trim((Sender as TCustomEdit).Text), 1) = false) then
    begin
      showmessage('O código da Submatéria-prima informada não existe!');
      (Sender as TCustomEdit).SetFocus;
      exit;
    end
    else
    begin
      ExibeInformacoesSubProduto(trim((Sender as TCustomEdit).Text));
    end;
  end;

  if ((Sender is TCustomEdit and ((Sender as TCustomEdit).Name = 'edCodTipoBaixaEstoque'))) then
  begin

    if ((Sender is TCustomEdit and (trim((Sender as TCustomEdit).text) = ''))) then
      exit;

    try
      (Sender as TCustomEdit).text := FormatFloat('000', StrToFloat((Sender as TCustomEdit).text));
    except
      showmessage('ERRO');
    end;

    if (verificaExistenciaTipoBaixaEstoque(trim((Sender as TCustomEdit).Text)) = false) then
    begin
      showmessage('Tipo de baixa informado não existe!');
      (Sender as TCustomEdit).SetFocus;
      (Sender as TCustomEdit).clear;
      exit;
    end
    else
    begin
      exibeInformacoesTipoBaixaEstoque(trim((Sender as TCustomEdit).Text));
    end;
  end;

  if ((Sender is TCustomEdit and ((Sender as TCustomEdit).Name = 'ed_cod_barras_item'))) then
  begin

    if ((Sender is TCustomEdit and (trim((Sender as TCustomEdit).text) = ''))) then
      exit;

    if (verificaExistenciaItemEstoque(trim((Sender as TCustomEdit).Text), 2) = false) then
    begin
      showmessage('Código de ítem não existe!');
      (Sender as TCustomEdit).SetFocus;
      exit;
    end
    else
    begin
      exibeInformacoesItemEstoque(trim((Sender as TCustomEdit).Text), 2);
    end;

  end;

  if Sender is TCustomEdit and ((Sender as TCustomEdit).Name = 'ed_cod_cliente') then
  begin
    if (trim((Sender as TCustomEdit).Text) = '') then
      exit;
    try
      (Sender as TCustomEdit).Text := FormatFloat('000000', StrToFloat((Sender as TCustomEdit).Text));
    except
      begin
        dm.exibe_painel_erro('Código de cliente inválido!', '');
        exit;
      end;
    end;

    if (verificaExistenciaCliente(trim((Sender as TCustomEdit).Text)) = false) then
    begin
      dm.exibe_painel_erro('Cliente inexistente!', '');
      exit;
    end
    else
    begin
      exibeInformacoesClienteFaturamento((Sender as TCustomEdit).text);
    end;
  end;

  if ((Sender is TCustomEdit and ((Sender as TCustomEdit).Name = 'edCodAliquota'))) then
  begin
    if ((Sender is TCustomEdit and (trim((Sender as TCustomEdit).text) = ''))) then
      exit;

    auxiliar := (Sender as TCustomEdit).text;
    try
      auxiliar := FormatFloat('00', StrToFloat(auxiliar));
    except
      begin
        showmessage('Código de alíquota inválido!');
        (Sender as TCustomEdit).SetFocus;
        exit;
      end;
    end;
    (Sender as TCustomEdit).Text := auxiliar;

    if (verificaExistenciaAliquota(trim((Sender as TCustomEdit).Text)) = false) then
    begin
      showmessage('Código de alíquota não existe!');
      (Sender as TCustomEdit).SetFocus;
      exit;
    end
    else
    begin
      exibeInformacoesAliquota((Sender as TCustomEdit).Text);
    end;
  end;

  if ((Sender is TCustomEdit and ((Sender as TCustomEdit).Name = 'edCodLoja'))) then
  begin
{      if((sender is TCustomEdit and ( trim( (sender as TCustomEdit).text)='')) ) then
      (sender as TCustomEdit).Text:='001';}

    if ((Sender is TCustomEdit and (trim((Sender as TCustomEdit).text) = ''))) then
      exit;

    auxiliar := (Sender as TCustomEdit).text;
    try
      auxiliar := FormatFloat('0000', StrToFloat(auxiliar));
    except
      begin
        showmessage('Código de loja inválido!');
        (Sender as TCustomEdit).SetFocus;
        exit;
      end;
    end;
    (Sender as TCustomEdit).Text := auxiliar;

    if (verificaExistenciaLoja(trim((Sender as TCustomEdit).Text)) = false) then
    begin
      showmessage('Código de loja inexistente');
      (Sender as TCustomEdit).SetFocus;
      exit;
    end
    else
    begin
      exibeInformacoesLoja((Sender as TCustomEdit).Text);

    end;
  end;

  if ((Sender is TCustomEdit and ((Sender as TCustomEdit).Name = 'edCodCliDelivery'))) then
  begin
    if ((Sender as TCustomEdit).text = '') then
    begin
      Exit;
    end;

    auxiliar := (Sender as TCustomEdit).text;
    try
      auxiliar := FormatFloat('00000', StrToFloat(auxiliar));
    except
      begin
        showmessage('Código de Cliente!');
        (Sender as TCustomEdit).SetFocus;
        exit;
      end;
    end;
    (Sender as TCustomEdit).Text := auxiliar;

    if (verificaExistenciaClienteDelivery(trim((Sender as TCustomEdit).Text)) = false) then
    begin
      showmessage('Código de cliente inexistente');
      (Sender as TCustomEdit).SetFocus;
      exit;
    end
    else
    begin
      exibeInformacoesClienteDelivery((Sender as TCustomEdit).Text);

    end;
  end;
end;

function Tfrm_modelo_vazio.verificaExistenciaRecebimentosParciais(mesa: string): boolean;
var
  q: TIBQuery;
begin

  q := TIBQuery.Create(self);
  q.Database := dm.dbrestaurante;
  q.Transaction := dm.transacao;
  q.Active := false;
  q.SQL.clear;

  q.sql.add('select * from recebimentos_parciais where mesa=' + Quotedstr(mesa));
  q.active := true;

  if q.IsEmpty then
    result := true
  else
    result := false;

  FreeAndNil(q);
end;

function Tfrm_modelo_vazio.verificaExistenciaFatura(cod_fatura: string): boolean;
var
  q: TIBQuery;
begin
  q := TIBQuery.Create(self);
  q.Database := dm.dbrestaurante;
  q.Transaction := dm.transacao;
  q.Active := false;
  q.SQL.clear;

  q.sql.add('select * from faturas where cod_fatura=' + Quotedstr(cod_fatura));
  q.active := true;

  if q.IsEmpty then
    result := false
  else
    result := true;

  FreeAndNil(q);
end;

function Tfrm_modelo_vazio.verificaExistenciaTipoDocumento(cod_tipo_documento: string): boolean;
var
  q: TIBQuery;
begin
  q := TIBQuery.Create(self);
  q.Database := dm.dbrestaurante;
  q.Transaction := dm.transacao;
  q.Active := false;
  q.SQL.clear;
  q.sql.add('select * from tipos_documento where cod_tipo_doc=' + QUotedstr(cod_tipo_documento));
  q.active := true;

  if q.IsEmpty then
    result := false
  else
    result := true;

  FreeAndNil(q);
end;

function Tfrm_modelo_vazio.verificaExistenciaTipoEntrada(cod_tipo_entrada: string): boolean;
var
  q: TIBQuery;
begin
  q := TIBQuery.Create(self);
  q.Database := dm.dbrestaurante;
  q.Transaction := dm.transacao;
  q.Active := false;
  q.SQL.clear;
  q.sql.add('select * from tipos_entrada where cod_tipo_entrada=' + QUotedstr(cod_tipo_entrada));
  q.active := true;

  if q.IsEmpty then
    result := false
  else
    result := true;

  FreeAndNil(q);
end;

function Tfrm_modelo_vazio.verificaExistenciaEntrada(cod_entrada: string): boolean;
var
  q: TIBQuery;
begin
  q := TIBQuery.Create(self);
  q.Database := dm.dbrestaurante;
  q.Transaction := dm.transacao;
  q.Active := false;
  q.SQL.clear;
  q.sql.add('select * from entradas where cod_entrada=' + QUotedstr(cod_entrada));
  q.active := true;

  if q.IsEmpty then
    result := false
  else
    result := true;

  FreeAndNil(q);
end;

function Tfrm_modelo_vazio.verificaExistenciaSaida(cod_saida: string): boolean;
var
  q: TIBQuery;
begin
  q := TIBQuery.Create(self);
  q.Database := dm.dbrestaurante;
  q.Transaction := dm.transacao;
  q.Active := false;
  q.SQL.clear;
  q.sql.add('select * from saidas where cod_saida=' + QUotedstr(cod_saida));
  q.active := true;

  if q.IsEmpty then
    result := false
  else
    result := true;

  FreeAndNil(q);
end;

function Tfrm_modelo_vazio.verificaExistenciaReceita(codReceita: string): boolean;
var
  q: TIBQuery;
begin
  q := TIBQuery.Create(self);
  q.Database := dm.dbrestaurante;
  q.Transaction := dm.transacao;
  q.Active := false;
  q.SQL.clear;
  q.sql.add('select * from receitas where cod_receita=' + QUotedstr(codReceita));
  q.active := true;

  if q.IsEmpty then
    result := false
  else
    result := true;

  FreeAndNil(q);
end;

function Tfrm_modelo_vazio.verificaExistenciaUsuario(cod_usuario: string): boolean;
var
  q: TIBQuery;
begin
  q := TIBQuery.Create(self);
  q.Database := dm.dbrestaurante;
  q.Transaction := dm.transacao;
  q.Active := false;
  q.SQL.clear;
  q.sql.add('select * from usuarios where cod_usuario=' + QUotedstr(cod_usuario));
  q.active := true;

  if q.IsEmpty then
    result := false
  else
    result := true;

  FreeAndNil(q);
end;

function Tfrm_modelo_vazio.verificaSeProdutoPodeSerVendido(codProduto: string; tipo: smallint): boolean;
var
  q: TIBQuery;
begin
  q := TIBQuery.Create(self);
  q.Database := dm.dbrestaurante;
  q.Transaction := dm.transacao;
  q.Active := false;
  q.SQL.clear;
  if (tipo = 1) then
    q.sql.add('select vende from produtos where cod_produto=' + QUotedstr(codProduto))
  else
    q.sql.add('select vende from produtos where cod_barras=' + QUotedstr(codProduto));
  q.active := true;

  if q.FieldByName('vende').Value = 1 then
    Result := true
  else
    Result := false;

  FreeAndNil(q);
end;

function Tfrm_modelo_vazio.verificaExistenciaProduto(codProduto: string; tipo: smallint): boolean;
var
  q: TIBQuery;
begin
  q := TIBQuery.Create(self);
  q.Database := dm.dbrestaurante;
  q.Transaction := dm.transacao;
  q.Active := false;
  q.SQL.clear;

  if (tipo = 1) then
  begin
    q.sql.add('select cod_produto from produtos where cod_produto=' + QUotedstr(codProduto));
    q.sql.add(' union all ');
    q.sql.add(' select cod_produto from produtos_tabela_precos where codigo=' + codProduto)
  end
  else
  begin
    q.sql.add('select cod_produto from produtos where cod_barras=' + QUotedstr(codProduto));
    q.sql.add(' union all ');
    q.sql.add(' select cod_produto from produtos_tabela_precos where codigo=' + codProduto);
  end;
  q.active := true;

  if q.IsEmpty then
    result := false
  else
    result := true;
  FreeAndNil(q);
end;

function Tfrm_modelo_vazio.getDescricaoProduto(codProduto: string; tipo: smallint): string;
var
  q: TIBQuery;
begin

  q := TIBQuery.Create(self);
  q.Database := dm.dbrestaurante;
  q.Transaction := dm.transacao;
  q.Active := false;
  q.SQL.clear;

  if ((Length(codProduto) = 13) or (Length(codProduto) = 8)) then
  begin
    if (tipo = 1) then
      q.sql.add('select descricao from produtos where cod_produto=' + QUotedstr(codProduto))
    else
      q.sql.add('select descricao from produtos where cod_barras=' + QUotedstr(codProduto));
    q.active := true;
  end
  else
  begin
    if (StrToInt(codProduto) < 50000) then
    begin
      if (tipo = 1) then
        q.sql.add('select descricao from produtos where cod_produto=' + QUotedstr(codProduto))
      else
        q.sql.add('select descricao from produtos where cod_barras=' + QUotedstr(codProduto));
      q.active := true;
    end
    else
    begin
      q.sql.add('  select  tb.prefixo||' + Quotedstr(' ') + '||p.descricao as descricao ');
      q.sql.add('      from produtos_tabela_precos  pt');
      q.sql.add('      inner join produtos p on (p.cod_produto = pt.cod_produto)');
      q.sql.add('      inner join tabelas_preco tb on (tb.codigo = pt.cod_tabela )');
      q.sql.add('  where pt.codigo=' + Quotedstr(codProduto));
      dm.adicionaLog(q.SQL.text);
      q.active := true;
    end;
  end;

         {

  if ( (StrToInt(codProduto) < 50000) or ( Length(codProduto) = 13 )  ) then
  begin
    if (tipo = 1)
     then
       q.sql.add('select descricao from produtos where cod_produto='+QUotedstr(codProduto))
    else
       q.sql.add('select descricao from produtos where cod_barras='+QUotedstr(codProduto));
     q.active:=true;
  end
 else
  begin
    q.sql.add('  select  tb.prefixo||'+Quotedstr(' ')+ '||p.descricao as descricao ');
    q.sql.add('      from produtos_tabela_precos  pt');
    q.sql.add('      inner join produtos p on (p.cod_produto = pt.cod_produto)');
    q.sql.add('      inner join tabelas_preco tb on (tb.codigo = pt.cod_tabela )');
    q.sql.add('  where pt.codigo='+codProduto);
     q.active:=true;
  end;

  }
  result := q.fieldbyname('descricao').Value;
  FreeAndNil(q);
end;

function Tfrm_modelo_vazio.getUnidadeMedidaECF(codProduto: string; tipo: smallint): string;
var
  q: TIBQuery;
begin
  q := TIBQuery.Create(self);
  q.Database := dm.dbrestaurante;
  q.Transaction := dm.transacao;
  q.Active := false;
  q.SQL.clear;
  if (tipo = 1) then
    q.sql.add('select UN_ECF from produtos where cod_produto=' + QUotedstr(codProduto))
  else
    q.sql.add('select UN_ECF from produtos where cod_barras=' + QUotedstr(codProduto));
  q.active := true;

  result := q.fieldbyname('UN_ECF').Value;
  FreeAndNil(q);
end;

function Tfrm_modelo_vazio.verificaExistenciaCFOP(CFOP: string): boolean;
var
  q: TIBQuery;
begin
  q := TIBQuery.Create(self);
  q.Database := dm.dbrestaurante;
  q.Transaction := dm.transacao;
  q.Active := false;
  q.SQL.clear;
  q.sql.add('select * from cfop where codigo=' + QUotedstr(CFOP));
  q.active := true;

  if q.IsEmpty then
    result := false
  else
    result := true;
  FreeAndNil(q);
end;

function Tfrm_modelo_vazio.getTipoCFOP(CFOP: string): integer;
var
  q: TIBQuery;
begin
  q := TIBQuery.Create(self);
  q.Database := dm.dbrestaurante;
  q.Transaction := dm.transacao;
  q.Active := false;
  q.SQL.clear;
  q.sql.add('select tipo from cfop where codigo=' + QUotedstr(CFOP));
  q.active := true;
  result := q.fieldbyname('tipo').value;

end;

function Tfrm_modelo_vazio.verificaExistenciaTipoItemSPED(codigo: string): boolean;
var
  q: TIBQuery;
begin
  q := TIBQuery.Create(self);
  q.Database := dm.dbrestaurante;
  q.Transaction := dm.transacao;
  q.Active := false;
  q.SQL.clear;
  q.sql.add('select * from tipos_item_sped where cod_tipo=' + QUotedstr(codigo));
  q.active := true;

  if q.IsEmpty then
    result := false
  else
    result := true;
  FreeAndNil(q);
end;

function Tfrm_modelo_vazio.verificaExistenciaNCM(codigo: string): boolean;
var
  q: TIBQuery;
begin
  q := TIBQuery.Create(self);
  q.Database := dm.dbrestaurante;
  q.Transaction := dm.transacao;
  q.Active := false;
  q.SQL.clear;
  q.sql.add('select ncm,descricao from ncm where ncm=' + QUotedstr(codigo));
  q.active := true;

  if q.IsEmpty then
    result := false
  else
    result := true;
  FreeAndNil(q);
end;

function Tfrm_modelo_vazio.verificaExistenciaGeneroItem(codigo: string): boolean;
var
  q: TIBQuery;
begin
  q := TIBQuery.Create(self);
  q.Database := dm.dbrestaurante;
  q.Transaction := dm.transacao;
  q.Active := false;
  q.SQL.clear;
  q.sql.add('select codigo,descricao from genero_item where codigo=' + QUotedstr(codigo));
  q.active := true;

  if q.IsEmpty then
    result := false
  else
    result := true;
  FreeAndNil(q);
end;

function Tfrm_modelo_vazio.verificaExistenciaModeloNotaFiscal(codModelo: string): boolean;
var
  q: TIBQuery;
begin
  q := TIBQuery.Create(self);
  q.Database := dm.dbrestaurante;
  q.Transaction := dm.transacao;
  q.Active := false;
  q.SQL.clear;
  q.sql.add('select * from modelos_nf where codigo=' + QUotedstr(codModelo));
  q.active := true;

  if q.IsEmpty then
    result := false
  else
    result := true;
  FreeAndNil(q);
end;

function Tfrm_modelo_vazio.verificaExistenciaSituacaoDocumentoFiscal(codSituacao: string): boolean;
var
  q: TIBQuery;
begin
  q := TIBQuery.Create(self);
  q.Database := dm.dbrestaurante;
  q.Transaction := dm.transacao;
  q.Active := false;
  q.SQL.clear;
  q.sql.add(' select cod_situacao, descricao from situacao_documento where cod_situacao=' + QUotedstr(codSituacao));
  q.active := true;

  if q.IsEmpty then
    result := false
  else
    result := true;
  FreeAndNil(q);
end;

function Tfrm_modelo_vazio.verificaExistenciaCST(CST: string): boolean;
var
  q: TIBQuery;
begin
  q := TIBQuery.Create(self);
  q.Database := dm.dbrestaurante;
  q.Transaction := dm.transacao;
  q.Active := false;
  q.SQL.clear;
  q.sql.add('select * from CST where CST=' + QUotedstr(CST));
  q.active := true;

  if q.IsEmpty then
    result := false
  else
    result := true;
  FreeAndNil(q);
end;

function Tfrm_modelo_vazio.verificaExistenciaCSTPISCofins(CST: string): boolean;
var
  q: TIBQuery;
begin
  q := TIBQuery.Create(self);
  q.Database := dm.dbrestaurante;
  q.Transaction := dm.transacao;
  q.Active := false;
  q.SQL.clear;
  q.sql.add('select * from CST_PIS_COFINS where CST=' + QUotedstr(CST));
  q.active := true;

  if q.IsEmpty then
    result := false
  else
    result := true;
  FreeAndNil(q);
end;

function Tfrm_modelo_vazio.verificaSeProdutoVendeFracionado(codProduto: string; tipo: smallint): boolean;
var
  q: TIBQuery;
begin
  q := TIBQuery.Create(self);
  q.Database := dm.dbrestaurante;
  q.Transaction := dm.transacao;
  q.Active := false;
  q.SQL.clear;
  if (tipo = 1) then
    q.sql.add('select * from produtos where cod_produto=' + QUotedstr(codProduto))
  else
    q.sql.add('select * from produtos where cod_barras=' + QUotedstr(codProduto));
  q.active := true;

  if q.FieldByName('fracionado').Value = 0 then
    result := false
  else
    result := true;

  FreeAndNil(q);
end;

function Tfrm_modelo_vazio.verificaSeProdutoCalculaQtde(codProduto: string; tipo: smallint): boolean;
var
  q: TIBQuery;
begin
  q := TIBQuery.Create(self);
  q.Database := dm.dbrestaurante;
  q.Transaction := dm.transacao;
  q.Active := false;
  q.SQL.clear;
  if (tipo = 1) then
    q.sql.add('select * from produtos where cod_produto=' + QUotedstr(codProduto))
  else
    q.sql.add('select * from produtos where cod_barras=' + QUotedstr(codProduto));
  q.active := true;

  if q.FieldByName('calcula_qtde').Value = 0 then
    result := false
  else
    result := true;

  FreeAndNil(q);
end;

function Tfrm_modelo_vazio.getNomeGarcon(cod_garcon: string): string;
var
  q: TIBquery;
begin
  q := TIBquery.create(self);
  q.database := dm.dbrestaurante;
  q.transaction := dm.transacao;

  q.active := false;
  q.sql.clear;
  q.sql.add(' select apelido from garcons where cod_garcon=' + Quotedstr(cod_garcon));
  q.active := true;

  result := q.fieldbyname('apelido').value;

  FreeAndNil(q);
end;

function Tfrm_modelo_vazio.getNumeroECFEmUso(numero_serie: string): string;
var
  q: TIBquery;
begin
  q := TIBquery.create(self);
  q.database := dm.dbrestaurante;
  q.transaction := dm.transacao;

  q.active := false;
  q.sql.clear;
  q.sql.add(' select * from impressoras_fiscais where num_serie=' + Quotedstr(numero_serie));
  q.active := true;

  if q.IsEmpty then
  begin
    showmessage('Impressora fiscal não localizada na tabela de impressoras fiscais!');
  end
  else
  begin
    result := q.fieldbyname('NUMORDEM').value;
  end;

  FreeAndNil(q);
end;

procedure Tfrm_modelo_vazio.SelecionaECFEmUso(numero_serie: string);
begin

end;

function Tfrm_modelo_vazio.verificaExistenciaArquivoAuxiliarPAF(caminhoArquivoAuxiliar: string): boolean;
begin

// showmessage('Caminho do arquivo: '+caminhoArquivoAuxiliar);
  if not (FileExists(caminhoArquivoAuxiliar)) then
  begin
    dm.exibe_painel_erro('O Arquivo auxliliar do PAF-ECF não foi encontrado.' + #13#10#13#10 + ' Não é possível emitir documentos fiscais!' + #13#10 + 'Entre em contato com a Real Softwares (71) 9988-2928', 'Ok');
    result := false;
    exit;
  end;

  result := true;
end;

function Tfrm_modelo_vazio.getValorTxEntregaBairro(codBairro: string): double;
var
  q: TIBquery;
begin
  q := TIBquery.create(self);
  q.database := dm.dbrestaurante;
  q.transaction := dm.translog;

  q.Active := false;
  q.sql.clear;
  q.sql.add('select txEntrega from bairro where codigo=' + codBairro);
  q.Active := true;
  result := q.FieldByName('txEntrega').Value;

  q.Active := false;
  FreeAndNil(q);
end;

function Tfrm_modelo_vazio.getValorTxEntregaPedido(codPedido: string): double;
var
  q: TIBquery;
begin
  q := TIBquery.create(self);
  q.database := dm.dbrestaurante;
  q.transaction := dm.transacao;

  q.Active := false;
  q.sql.clear;
  q.sql.add('select valor_entrega from pedidos_delivery where codigo=' + QUotedstr(codPedido));
  q.Active := true;
  result := q.FieldByName('valor_entrega').Value;

  q.Active := false;
  FreeAndNil(q);
end;

{
function Tfrm_modelo_vazio.getValorProduto(ACodProduto: string) : double;
var
  LCampoConsulta: string;
var
  q: TIBQuery;
begin
  q := TIBQuery.Create(self);
  q.Database := dm.dbrestaurante;
  q.Transaction := dm.transacao;
  q.Active := false;
  q.SQL.clear;

  try
    try


     LCampoConsulta := 'cod_produto';

      if ((Length(ACodProduto) = 13) or (Length(ACodProduto) = 8)) then
      begin
        q.sql.add('select valor_unitario from produtos where :vpCampoConsulta=' + QUotedstr(ACodProduto));
      end
      else
      begin
        if (StrToInt(ACodProduto) < 50000) then
        begin
          if (dm.getTabelaPrecoAtual.codigo = 0) then
          begin
            q.sql.add('select valor_unitario from produtos where :vpCampoConsulta=' + QUotedstr(ACodProduto))
          end
          else
          begin

            q.sql.add('select pt.valor_unitario ');
            q.sql.add(' from   produtos_tabela_precos pt ');
            q.sql.add(' inner join produtos p on (p.cod_produto = pt.cod_produto)');
            q.sql.add('where  pt.cod_tabela=' + Inttostr(dm.getTabelaPrecoAtual.codigo));
            q.sql.add('and p.:vpCampoConsulta=' + QUotedstR(ACodProduto));

          end;
        end
        else
        begin
          q.sql.add('   select pt.valor_unitario   from produtos_tabela_precos pt ');
          q.sql.add('  inner join produtos p on (p.cod_produto = pt.cod_produto) ');
          q.sql.add('  where pt.:vpCampoConsulta=' + ACodProduto);

        end;
      end;

      q.SQL.Text := StringReplace(q.SQL.Text, ':vpCampoConsulta', LCampoConsulta, [rfReplaceAll, rfIgnoreCase]);
      q.active := true;
      result := q.fields[0].Value;
    except
      on E: Exception do
      begin
        dm.exibe_painel_erro('Erro ao buscar preço do produto! ' + sLineBreak + sLineBreak + E.Message, 'Ok');
        dm.adicionaLog('Erro ao buscar preço do produto');
        dm.adicionaLog(q.SQL.Text);
      end;

    end;
  finally
    FreeAndNil(q);

  end;

end;
 }


 {
function Tfrm_modelo_vazio.getValorProdutoTabelaPrecos(codigo: string): double;
var
  q: TIBQuery;
begin
  q := TIBQuery.Create(self);
  q.Database := dm.dbrestaurante;
  q.Transaction := dm.transacao;
  q.Active := false;

  q.sql.add('   select p.valor_unitario   from produtos_tabela_precos pt ');
  q.sql.add('  inner join produtos p on (p.cod_produto = pt.cod_produto) ');
  q.sql.add('  where pt.codigo=' + Quotedstr(codigo));
  q.active := true;
  result := q.fields[0].Value;
  FreeAndNil(q);
end;
}

function Tfrm_modelo_vazio.verificaProdutoDigitaPreco(codBarrasProduto: string): boolean;
var
  q: TIBQuery;
begin
  q := TIBQuery.Create(self);
  q.Database := dm.dbrestaurante;
  q.Transaction := dm.transacao;
  q.Active := false;
  q.SQL.clear;
  q.sql.add('select * from produtos where cod_barras=' + QUotedstr(codBarrasProduto));
  q.active := true;

  if (q.FieldByName('preco_digitado').value = 0) then
    result := false
  else
    result := true;

  FreeAndNil(q);
end;

function Tfrm_modelo_vazio.verificaFaturaBaixada(cod_fatura: string): boolean;
var
  q: TIBQuery;
begin
  q := TIBQuery.Create(self);
  q.Database := dm.dbrestaurante;
  q.Transaction := dm.transacao;
  q.Active := false;
  q.SQL.clear;

  q.sql.add('select * from faturas where cod_fatura=' + Quotedstr(cod_fatura));
  q.active := true;

  if q.FieldByName('status').Value = 1 then
    result := true
  else
    result := false;

  FreeAndNil(q);
end;

function Tfrm_modelo_vazio.getPrazoCliente(cod_cliente: string): integer;
var
  q: TIBQuery;
begin

  q := TIBQuery.Create(self);
  q.Database := dm.dbrestaurante;
  q.Transaction := dm.transacao;
  q.Active := false;
  q.SQL.clear;
  q.sql.add('select * from clientes where cod_cli =' + Quotedstr(cod_cliente));
  q.Active := true;

  result := q.fieldbyname('prazo_pagamento').value;
  FreeAndNil(q);
end;

function Tfrm_modelo_vazio.getNomeCliente(codCliente: string): string;
var
  q: TIBQuery;
begin
  q := TIBQuery.Create(self);
  q.Database := dm.dbrestaurante;
  q.Transaction := dm.transacao;
  q.Active := false;
  q.SQL.clear;
  q.sql.add('select razao_social from clientes where cod_cli =' + Quotedstr(codCliente));
  q.Active := true;
  result := q.fieldbyname('razao_social').value;
  FreeAndNil(q);
end;

function Tfrm_modelo_vazio.getEnderecoCliente(codCliente: string): string;
var
  q: TIBQuery;
begin
  q := TIBQuery.Create(self);
  q.Database := dm.dbrestaurante;
  q.Transaction := dm.transacao;
  q.Active := false;
  q.SQL.clear;
  q.sql.add('select endereco from clientes where cod_cli =' + Quotedstr(codCliente));
  q.Active := true;
  result := q.fieldbyname('endereco').value;
  FreeAndNil(q);
end;

function Tfrm_modelo_vazio.getTelefoneCliente(codCliente: string): string;
var
  q: TIBQuery;
begin
  q := TIBQuery.Create(self);
  q.Database := dm.dbrestaurante;
  q.Transaction := dm.transacao;
  q.Active := false;
  q.SQL.clear;
  q.sql.add('select razao_social from clientes where cod_cli =' + Quotedstr(codCliente));
  q.Active := true;
  result := q.fieldbyname('razao_social').value;
  FreeAndNil(q);
end;

function Tfrm_modelo_vazio.getCodClienteUsandoCartao(cartao: string): string;
var
  qryInformacoesCliente: TIBQuery;
begin
  qryInformacoesCliente := TIBQuery.create(self);
  qryInformacoesCliente.Database := dm.dbrestaurante;
  qryInformacoesCliente.Transaction := dm.transacao;
  qryInformacoesCliente.Active := false;
  qryInformacoesCliente.sql.clear;
  qryInformacoesCliente.SQL.Add('select c.cod_cartao,c.cod_cli,cl.razao_social    from cartoes c ');
  qryInformacoesCliente.SQL.Add('   inner join clientes cl on (cl.cod_cli = c.cod_cli) ');
  qryInformacoesCliente.SQL.Add('   where c.cod_cartao=' + QuotedStr(cartao));
  qryInformacoesCliente.Active := true;
  if (qryInformacoesCliente.FieldByName('cod_cli').value <> null) then
  begin
    result := qryInformacoesCliente.FieldByName('cod_cli').value;
//        nomeCliente := qryInformacoesCliente.FieldByName('razao_social').value;
  end
  else
  begin
    result := '';
  end;

  qryInformacoesCliente.Active := false;
  FreeAndNil(qryInformacoesCliente);
end;

function Tfrm_modelo_vazio.getNomeClienteUsandoCartao(cartao: string): string;
var
  qryInformacoesCliente: TIBQuery;
begin
  qryInformacoesCliente := TIBQuery.create(self);
  qryInformacoesCliente.Database := dm.dbrestaurante;
  qryInformacoesCliente.Transaction := dm.transacao;
  qryInformacoesCliente.Active := false;
  qryInformacoesCliente.sql.clear;
  qryInformacoesCliente.SQL.Add('select c.cod_cartao,c.cod_cli,cl.razao_social    from cartoes c ');
  qryInformacoesCliente.SQL.Add('   inner join clientes cl on (cl.cod_cli = c.cod_cli) ');
  qryInformacoesCliente.SQL.Add('   where c.cod_cartao=' + QuotedStr(cartao));
  qryInformacoesCliente.Active := true;
  if (qryInformacoesCliente.FieldByName('cod_cli').value <> null) then
  begin
    result := qryInformacoesCliente.FieldByName('razao_social').value;
  end
  else
  begin
    result := '';
  end;

  qryInformacoesCliente.Active := false;
  FreeAndNil(qryInformacoesCliente);
end;

function Tfrm_modelo_vazio.getParametroUnidade(cod_unidade: string): double;
var
  q: TIBQuery;
begin
  q := TIBQuery.Create(self);
  q.Database := dm.dbrestaurante;
  q.Transaction := dm.transacao;
  q.Active := false;

  q.sql.clear;
  q.sql.add('select * from unidades where cod_unidade=' + QUotedstr(cod_unidade));
  q.active := true;
  result := q.fieldbyname('parametro').Value;
  FreeAndNil(q);
end;

function Tfrm_modelo_vazio.getUnidadeEntradaItem(cod_item: string): string;
var
  q: TIBQuery;
begin
  q := TIBQuery.Create(self);
  q.Database := dm.dbrestaurante;
  q.Transaction := dm.transacao;
  q.Active := false;
  q.sql.clear;

  q.sql.add('select unidade_entrada from produtos where cod_produto=' + Quotedstr(cod_item));
  q.active := true;
  result := q.fieldbyname('unidade_entrada').Value;
  FreeAndNil(q);
end;

procedure Tfrm_modelo_vazio.setTipoNotaFiscalSaida(tipo: smallint);
begin
  tipoNotaFiscalSaida := tipo;

end;

function Tfrm_modelo_vazio.getCodOperadorCaixa(codCaixa: string): string;
var
  q: TIBquery;
begin
  q := TIBquery.create(self);
  q.database := dm.dbrestaurante;
  q.transaction := dm.transacao;

  q.active := false;
  q.sql.clear;
  q.sql.add(' select * from caixas where codigo=' + Quotedstr(codCaixa));
  q.active := true;

  result := q.fieldbyname('cod_usuario').value;
  FreeAndNil(q);
end;

function Tfrm_modelo_vazio.getNomeOperadorCaixa(codCaixa: string): string;
var
  q: TIBquery;
begin
  q := TIBquery.create(self);
  q.database := dm.dbrestaurante;
  q.transaction := dm.transacao;

  q.active := false;
  q.sql.clear;
  q.sql.add(' select * from caixas where codigo=' + Quotedstr(codCaixa));
  q.active := true;

  result := q.fieldbyname('nome_usuario').value;
  FreeAndNil(q);
end;

function Tfrm_modelo_vazio.getDataSistemaCaixa(codCaixa: string): Tdate;
var
  q: TIBquery;
begin
  q := TIBquery.create(self);
  q.database := dm.dbrestaurante;
  q.transaction := dm.transacao;

  q.active := false;
  q.sql.clear;
  q.sql.add(' select data_sistema from caixas where codigo=' + Quotedstr(codCaixa));
  q.active := true;

  result := q.fieldbyname('data_sistema').value;
  FreeAndNil(q);
end;

function Tfrm_modelo_vazio.getTotalSuprimentosCaixa(codCaixa: string): Double;
var
  q: TIBquery;
begin

  q := TIBquery.create(self);
  q.database := dm.dbrestaurante;
  q.transaction := dm.transacao;

  q.active := false;
  q.sql.clear;
  q.sql.add(' select sum(valor) as total_suprimentos from suprimentos where cod_caixa=' + Quotedstr(codCaixa));
  q.active := true;

  if ((q.FieldByName('total_suprimentos').value = 0) or (q.FieldByName('total_suprimentos').value = NULL)) then
    Result := 0
  else
    result := q.fieldbyname('total_suprimentos').value;

  FreeAndNil(q);
end;

function Tfrm_modelo_vazio.getTotalSangriasCaixa(codCaixa: string): Double;
var
  q: TIBquery;
begin
  q := TIBquery.create(self);
  q.database := dm.dbrestaurante;
  q.transaction := dm.transacao;

  q.active := false;
  q.sql.clear;
  q.sql.add(' select sum(valor) as total_sangrias from  sangrias where cod_caixa=' + Quotedstr(codCaixa));
  q.active := true;

  if ((q.FieldByName('total_sangrias').value = 0) or (q.FieldByName('total_sangrias').value = NULL)) then
    Result := 0
  else
    result := q.fieldbyname('total_sangrias').value;

  FreeAndNil(q);
end;

function Tfrm_modelo_vazio.getTotalPendurasRecebidasCaixa(codCaixa: string): Double;
var
  q: TIBquery;
begin
  q := TIBquery.create(self);
  q.database := dm.dbrestaurante;
  q.transaction := dm.transacao;

  q.active := false;
  q.sql.clear;
  q.sql.add(' select sum(valor) as total_penduras from  recebimentos_fatura  where cod_caixa=' + Quotedstr(codCaixa));
  q.active := true;

  if ((q.FieldByName('total_penduras').value = 0) or (q.FieldByName('total_penduras').value = NULL)) then
    Result := 0
  else
    result := q.fieldbyname('total_penduras').value;

  FreeAndNil(q);
end;

function Tfrm_modelo_vazio.getTotalTaxaServicoCaixa(codCaixa: string): Double;
var
  q: TIBquery;
begin
  q := TIBquery.create(self);
  q.database := dm.dbrestaurante;
  q.transaction := dm.transacao;

  q.active := false;
  q.sql.clear;
  q.sql.add(' select sum(valor_txserv) as total_taxa from vendas where cod_caixa=' + Quotedstr(codCaixa));
  q.active := true;

  if ((q.FieldByName('total_taxa').value = 0) or (q.FieldByName('total_taxa').value = null)) then
    Result := 0
  else
    result := q.fieldbyname('total_taxa').value;

  FreeAndNil(q);
end;

function Tfrm_modelo_vazio.getValorProdutosMesa(mesa: string): double;
var
  q: TIBquery;
begin
  q := TIBquery.create(self);
  q.database := dm.dbrestaurante;
  q.transaction := dm.transacao;

  q.active := false;
  q.sql.clear;
  q.sql.add('select * from rodapeextrato3(' + Quotedstr(mesa) + ',' + dm.TrocaVirgPPto(Floattostr(percentualTaxaServico)) + ')');
  q.active := true;

  if ((q.FieldByName('VALORBRUTO').value = 0) or (q.FieldByName('VALORBRUTO').value = null)) then
    Result := 0
  else
    result := q.fieldbyname('VALORBRUTO').value;
  FreeAndNil(q);

end;

procedure Tfrm_modelo_vazio.clickControlCurvyExecute(Sender: TObject);
begin

  if (Sender is TCurvyEdit) then
  begin
    if ((Sender as TCurvyEdit).Name = 'edCodFormaPagamento') then
    begin
      pesquisaFormaPagto();
    end;
  end;

end;

procedure Tfrm_modelo_vazio.pesquisaFormaPagamento(Sender: TObject);
begin
  case AnsiIndexStr((Sender as TComponent).Name, ['edCodFormaPagamento', 'TCurvyEdit', 'TEdit']) of
    0:
      begin
        pesquisaFormaPagamento(Sender);
      end;
    1:
      begin
        pesquisaFormaPagamento(Sender);
      end;
  end;
end;

function Tfrm_modelo_vazio.validaQuantidade(Sender: TObject): boolean;
var
  quantidade: string;
begin
  case AnsiIndexStr((Sender.ClassName), ['TEdit', 'TCurvyEdit', 'TEdit']) of
    0:
      begin
        quantidade := (Sender as TEdit).Text;
      end;
    1:
      begin
        quantidade := (Sender as TCurvyEdit).Text;
      end;
  end;

  try
    StrToFloat(quantidade);
  except
    Result := false;
    exit;
  end;

  if StrToFloat(quantidade) <= 0 then
  begin
    Result := false;
    exit;
  end;

  Result := true;
end;

function Tfrm_modelo_vazio.validaValorPagamento(Sender: TObject): boolean;
var
  valor: string;
begin
  case AnsiIndexStr((Sender.ClassName), ['TEdit', 'TCurvyEdit', 'TEdit']) of
    0:
      begin
        valor := (Sender as TEdit).Text;
      end;
    1:
      begin
        valor := (Sender as TCurvyEdit).Text;
      end;
  end;

  try
    StrToFloat(valor);
  except
    Result := false;
    exit;
  end;

  if StrToFloat(valor) <= 0 then
  begin
    Result := false;
    exit;
  end;

  Result := true;
end;

procedure Tfrm_modelo_vazio.actExitFormaPagamentoExecute(Sender: TObject);
var
  edCodForma: TComponent;
  codigo: string;
begin

  edCodForma := FindComponent('edCodFormaPagamento');

  if edCodForma <> nil then
  begin
    case AnsiIndexStr((edCodForma.ClassName), ['TEdit', 'TCurvyEdit', 'TEdit']) of
      0:
        begin
          codigo := (edCodForma as TEdit).Text;
        end;
      1:
        begin
          codigo := (edCodForma as TCurvyEdit).Text;
        end;
    end;

    if (trim(codigo) <> '') then
    begin
      try
        codigo := FormatFloat('000', StrToFloat(codigo));
        if (dm.tbFormasPagamento.Locate('cod_forma', codigo, []) = true) then
        begin
          exibeInformacoesFormaDePagamento(codigo);
        end
        else
          raise Exception.Create('EFormaPagamentoInvalida');
      except
        dm.exibe_painel_erro('Código de forma de pagamento inválido!', 'Ok');
        (Sender as TWinControl).SetFocus;
        exit;
      end;
    end;

  end;
end;

function Tfrm_modelo_vazio.getHoraAberturaCaixa(codCaixa: string): Ttime;
var
  q: TIBquery;
begin
  q := TIBquery.create(self);
  q.database := dm.dbrestaurante;
  q.transaction := dm.transacao;

  q.active := false;
  q.sql.clear;
  q.sql.add(' select * from caixas where codigo=' + Quotedstr(codCaixa));
  q.active := true;

  result := q.fieldbyname('hora_abertura').value;
  FreeAndNil(q);
end;

function Tfrm_modelo_vazio.getHoraFechamentoCaixa(codCaixa: string): Ttime;
var
  q: TIBquery;
begin
  q := TIBquery.create(self);
  q.database := dm.dbrestaurante;
  q.transaction := dm.transacao;

  q.active := false;
  q.sql.clear;
  q.sql.add(' select * from caixas where codigo=' + Quotedstr(codCaixa));
  q.active := true;

  result := q.fieldbyname('hora_fechamento').value;
  FreeAndNil(q);
end;

procedure Tfrm_modelo_vazio.exibeInformacoes(componenteChavePesquisa: string; componenteRecebeRetorno: string; tabela: string; campos: string; cp_pesq: string; param_pesq: string; cp_ret: integer);
var
  i: integer;
begin

  for i := 0 to ComponentCount - 1 do
  begin
    if (components[i].Name = componenteChavePesquisa) then
      if (Components[i].ClassType = TCustomEdit) then
        param_pesq := (components[i] as TCustomEdit).text

  end;

  for i := 0 to ComponentCount - 1 do
  begin
    if (components[i].Name = componenteRecebeRetorno) then
      if (Components[i].ClassType = TEdit) then
        (components[i] as Tedit).text := dm.retornaCampoQQTabela(tabela, campos, cp_pesq, param_pesq, cp_ret)
      else
        (components[i] as Tdbedit).text := dm.retornaCampoQQTabela(tabela, campos, cp_pesq, param_pesq, cp_ret);
  end;
end;

procedure Tfrm_modelo_vazio.Edit1Enter(Sender: TObject);
begin

  if Sender is TCustomEdit then
  begin
    (Sender as TCustomEdit).Brush.Color := $00FFE6B0;
    (Sender as TCustomEdit).Repaint;
    (Sender as TCustomEdit).SelectAll;

  end;

  if Sender is TEdit then
  begin
    (Sender as TEdit).Brush.Color := $00FFE6B0;
    (Sender as TEdit).Repaint;
    (Sender as TEdit).SelectAll;

  end;

  if Sender is TDBEdit then
  begin
    (Sender as TDBEdit).Brush.Color := $00FFE6B0;
    (Sender as TDBEdit).Repaint;
    (Sender as TDBEdit).SelectAll;

  end;

  if Sender is TDBEdit then
  begin
    (Sender as TDBEdit).Brush.Color := $00FFE6B0;
    ;
    (Sender as TDBEdit).Repaint;
    (Sender as TDBEdit).SelectAll;
  end;

  if Sender is TComboBox then
  begin
    (Sender as TComboBox).DroppedDown := true;
    sendmessage((Sender as TComboBox).Handle, CB_SHOWDROPDOWN, 1, 0);
    (Sender as TComboBox).Color := cor_ao_entrar;
  end;

  if Sender is TDBLookupComboBox then
  begin
    (Sender as TcxLookupComboBox).Properties.IncrementalSearch := false;
    (Sender as TDBLookupComboBox).DropDown;
    sendmessage((Sender as TDBLookupComboBox).Handle, CB_SHOWDROPDOWN, 1, 0);
    (Sender as TDBLookupComboBox).Color := cor_ao_entrar;
  end;

  if Sender is Tdbgrid then
  begin
    (Sender as TDBGrid).Color := $00FFE6B0;
    (Sender as TDBGrid).Repaint;
  end;

  if Sender is TcxLookupComboBox then
  begin
    (Sender as TcxLookupComboBox).DroppedDown := true;
    sendmessage((Sender as TcxLookupComboBox).Handle, CB_SHOWDROPDOWN, 1, 0);
    (Sender as TcxLookupComboBox).Style.Color := cor_ao_entrar;
  end;

end;

function Tfrm_modelo_vazio.verificaSeItemEhSubmateria(cod_item_estoque: string): boolean;
var
  q: TIBQuery;
  i: integer;
begin

  q := TIBQuery.Create(self);
  q.Database := dm.dbrestaurante;
  q.Transaction := dm.transacao;
  q.Active := false;

  q.sql.clear;
  q.sql.add(' select submateria from produtos where cod_produto=' + Quotedstr(cod_item_estoque));
  q.Active := true;

  if q.FieldByName('submateria').Value = 1 then
    Result := true
  else
    Result := false;

  q.Active := false;
  FreeAndNil(q);
end;

procedure Tfrm_modelo_vazio.exibeInformacoesItemEstoque(cod_item_estoque: string; campo: integer);
var
  q: TIBQuery;
  i: integer;
begin

  q := TIBQuery.Create(self);

  q.Database := dm.dbrestaurante;
  q.Transaction := dm.transacao;
  q.Active := false;

  q.sql.clear;
  q.sql.clear;
  q.sql.add(' select  it.* , gp.descricao as desc_grupo,');
  q.sql.add('   un.descricao as desc_unidade,  un.parametro, (it.estoque_liquido / un.parametro) as estoque,un2.descricao as descUnidadeFracao, vit.fracao_estoque,');
  q.sql.add('   udf_replace(cast(vit.estoque_inteiro as varchar(12)),' + Quotedstr('.') + ',' + Quotedstr(',') + ')||' + Quotedstr('     ') + '||vit.descricao_entrada||' + Quotedstr('  +  ') + '||cast(vit.fracao_estoque   as varchar(12))  ||' + Quotedstr('     ') + '||vit.descricao_fracao as estoqueComFracao,');
  q.sql.add('   udf_replace(udf_copy(cast(vit.estoque_total as varchar(15)),0,6),' + Quotedstr('.') + ',' + Quotedstr(',') + ')||' + Quotedstr('     ') + '||vit.descricao_entrada as estoqueSemFracao ');
  q.sql.add('    from produtos it');
  q.sql.add('   inner join v_itens_estoque vit on (vit.cod_item = it.cod_produto)');
  q.sql.add('   inner join grupos gp on (gp.cod_grupo = it.cod_grupo)');
  q.sql.add('   inner join unidades un on (un.cod_unidade = it.unidade_entrada)');
  q.sql.add('   inner join unidades un2 on (un2.cod_unidade = it.cod_unidade_fracao)');
  q.sql.add(' where it.cod_produto=' + Quotedstr(cod_item_estoque));
  q.Active := true;

  if q.IsEmpty then
    exit;

  for i := 0 to ComponentCount - 1 do
  begin
    if (components[i].Name = 'ed_cod_item') then
      (components[i] as TCustomEdit).text := q.fieldbyname('cod_produto').value;

    if (components[i].Name = 'ed_cod_item_saida') then
      (components[i] as TCustomEdit).text := q.fieldbyname('cod_produto').value;

    if (components[i].Name = 'ed_cod_barras_item') then
      (components[i] as TCustomEdit).text := q.fieldbyname('barras').Value;

    if (components[i].Name = 'ed_desc_item') then
      (components[i] as TCustomEdit).text := q.fieldbyname('descricao').Value;

    if (components[i].Name = 'ed_estoque_item') then
      (components[i] as TCustomEdit).text := FormatFloat('#0.000', q.fieldbyname('estoque').Value);

    if (components[i].Name = 'edEstoqueCompletoItem') then
    begin
      if (q.fieldbyname('unidade_entrada').Value = q.fieldbyname('cod_unidade_fracao').Value) then  // se as unidades de entrada e fracao forem iguais, não mostra fração
        (components[i] as TCustomEdit).text := q.fieldbyname('estoqueSemFracao').Value
      else if q.FieldByName('fracao_Estoque').Value > 0 then
        (components[i] as TCustomEdit).text := q.fieldbyname('estoqueComFracao').Value
      else
        (components[i] as TCustomEdit).text := q.fieldbyname('estoqueSemFracao').Value
    end;

    if (components[i].Name = 'ed_cod_unidade_item') then
      (components[i] as TCustomEdit).text := q.fieldbyname('unidade_entrada').Value;

    if (components[i].Name = 'ed_unidade_item') then
      (components[i] as TCustomEdit).text := q.fieldbyname('desc_unidade').Value;

    if (components[i].Name = 'ed_cod_un_entrada') then
      (components[i] as TCustomEdit).text := q.fieldbyname('unidade_entrada').Value;

    if (components[i].Name = 'ed_desc_un_entrada') then
      (components[i] as TCustomEdit).text := q.fieldbyname('desc_unidade').Value;

    if (components[i].Name = 'ed_ultima_compra_item') then
      (components[i] as TCustomEdit).text := FormatDateTime('DD/MM/YYY', q.fieldbyname('DATA_ULTIMA_REPOSICAO').Value);

    if (components[i].Name = 'ed_sigla_un_item') then
      (components[i] as TCustomEdit).text := q.fieldbyname('SIGLA_NOTA').Value;

    if (components[i].Name = 'ed_cfop_item') then
      (components[i] as TCustomEdit).text := q.fieldbyname('cfop').Value;

    if (components[i].Name = 'ed_cst_item') then
      (components[i] as TCustomEdit).text := q.fieldbyname('cst').Value;

    if (components[i].Name = 'ed_cfop_saida_item') then
      (components[i] as TCustomEdit).text := q.fieldbyname('cfop_saida').Value;

    if (components[i].Name = 'ed_cst_saida_item') then
      (components[i] as TCustomEdit).text := q.fieldbyname('cst_saida').Value;

    if (components[i].Name = 'edNCMITEM') then
      (components[i] as TCustomEdit).text := q.fieldbyname('NCM').Value;

    if (components[i].Name = 'EDIAliquotaICMSSAIDAITEM') then
      (components[i] as TCustomEdit).text := Floattostr(q.fieldbyname('aliquotaICMS').Value);

  end;
  FreeAndNil(q);
end;

procedure Tfrm_modelo_vazio.exibeInformacoesItemSaida(cod_item_estoque: string; campo: integer);
var
  q: TIBQuery;
  i: integer;
begin

  q := TIBQuery.Create(self);
  q.Database := dm.dbrestaurante;
  q.Transaction := dm.transacao;
  q.Active := false;

  case tipoNotaFiscalSaida of
    0:
      begin

        q.sql.clear;
        q.sql.add('  select  it.*, al.percentual_icms as aliquotaICMS, gp.descricao as desc_grupo, ');
        q.sql.add('    cf.codigo as cfop_usar, cf.descricao as descricaoCFOP, ');
        q.sql.add('    ct.cst as cst_usar, ct.descricao as descricaoCST ');
        q.sql.add('     from produtos it ');
        q.sql.add('    inner join aliquotas al on (al.cod_aliquota =it.cod_aliquota) ');
        q.sql.add('    inner join grupos gp on (gp.cod_grupo = it.cod_grupo) ');
        q.sql.add('    inner join cfop cf  on (cf.codigo = it.cfop_saida) ');
        q.sql.add('    inner join cst ct on (ct.cst = it.cst_saida) ');
        q.sql.add(' where it.cod_produto=' + Quotedstr(cod_item_estoque));
      end;

    1:
      begin
        q.sql.clear;
        q.sql.add('  select  it.*, al.percentual_icms as aliquotaICMS, gp.descricao as desc_grupo, ');
        q.sql.add('    cf.codigo as cfop_usar, cf.descricao as descricaoCFOP, ');
        q.sql.add('    ct.cst as cst_usar, ct.descricao as descricaoCST ');
        q.sql.add('     from produtos it ');
        q.sql.add('    inner join aliquotas al on (al.cod_aliquota =it.cod_aliquota) ');
        q.sql.add('    inner join grupos gp on (gp.cod_grupo = it.cod_grupo) ');
        q.sql.add('    inner join cfop cf  on (cf.codigo = it.cfop_devolucao) ');
        q.sql.add('    inner join cst ct on (ct.cst = it.cst_devolucao)       ');
        q.sql.add(' where it.cod_produto=' + Quotedstr(cod_item_estoque));

      end;

    2:
      begin
        q.sql.clear;
        q.sql.add('  select  it.*, al.percentual_icms as aliquotaICMS, gp.descricao as desc_grupo, ');
        q.sql.add('    cf.codigo as cfop_usar, cf.descricao as descricaoCFOP, ');
        q.sql.add('    ct.cst as cst_usar, ct.descricao as descricaoCST ');
        q.sql.add('     from produtos it ');
        q.sql.add('    inner join aliquotas al on (al.cod_aliquota =it.cod_aliquota) ');
        q.sql.add('    inner join grupos gp on (gp.cod_grupo = it.cod_grupo) ');
        q.sql.add('    inner join cfop cf  on (cf.codigo = it.cfop_transferencias) ');
        q.sql.add('    inner join cst ct on (ct.cst = it.cst_transferencias) ');
        q.sql.add(' where it.cod_produto=' + Quotedstr(cod_item_estoque));
      end;
  end;

  q.Active := True;

  if q.IsEmpty then
    exit;

  for i := 0 to ComponentCount - 1 do
  begin
    if (components[i].Name = 'ed_cod_item') then
      (components[i] as TCustomEdit).text := q.fieldbyname('cod_produto').value;

    if (components[i].Name = 'ed_cod_item_saida') then
      (components[i] as TCustomEdit).text := q.fieldbyname('cod_produto').value;

    if (components[i].Name = 'ed_cod_barras_item') then
      (components[i] as TCustomEdit).text := q.fieldbyname('barras').Value;

    if (components[i].Name = 'ed_desc_item') then
      (components[i] as TCustomEdit).text := q.fieldbyname('descricao').Value;

    if (components[i].Name = 'ed_estoque_item') then
      (components[i] as TCustomEdit).text := FormatFloat('#0.000', q.fieldbyname('estoque').Value);

    if (components[i].Name = 'edEstoqueCompletoItem') then
    begin
      if (q.fieldbyname('unidade_entrada').Value = q.fieldbyname('cod_unidade_fracao').Value) then  // se as unidades de entrada e fracao forem iguais, não mostra fração
        (components[i] as TCustomEdit).text := q.fieldbyname('estoqueSemFracao').Value
      else if q.FieldByName('fracao_Estoque').Value > 0 then
        (components[i] as TCustomEdit).text := q.fieldbyname('estoqueComFracao').Value
      else
        (components[i] as TCustomEdit).text := q.fieldbyname('estoqueSemFracao').Value
    end;

    if (components[i].Name = 'ed_cod_unidade_item') then
      (components[i] as TCustomEdit).text := q.fieldbyname('unidade_entrada').Value;

    if (components[i].Name = 'ed_unidade_item') then
      (components[i] as TCustomEdit).text := q.fieldbyname('desc_unidade').Value;

    if (components[i].Name = 'ed_ultima_compra_item') then
      (components[i] as TCustomEdit).text := FormatDateTime('DD/MM/YYY', q.fieldbyname('DATA_ULTIMA_REPOSICAO').Value);

    if (components[i].Name = 'ed_sigla_un_item') then
      (components[i] as TCustomEdit).text := q.fieldbyname('SIGLA_NOTA').Value;

    if (components[i].Name = 'ed_cfop_item') then
      (components[i] as TCustomEdit).text := q.fieldbyname('cfop').Value;

    if (components[i].Name = 'ed_cst_item') then
      (components[i] as TCustomEdit).text := q.fieldbyname('cst').Value;

    if (components[i].Name = 'ed_cfop_saida_item') then
      (components[i] as TCustomEdit).text := q.fieldbyname('cfop_usar').Value;

    if (components[i].Name = 'ed_cst_saida_item') then
      (components[i] as TCustomEdit).text := q.fieldbyname('cst_usar').Value;

    if (components[i].Name = 'edNCMITEM') then
      (components[i] as TCustomEdit).text := q.fieldbyname('NCM').Value;

    if (components[i].Name = 'EDIAliquotaICMSSAIDAITEM') then
      (components[i] as TCurrencyEdit).Value := q.fieldbyname('aliquotaICMS').Value;

    if (components[i].Name = 'EDIpreco') then
      (components[i] as TCurrencyEdit).Value := q.fieldbyname('valor_unitario').Value;

  end;

  FreeAndNil(q);
end;

procedure Tfrm_modelo_vazio.ExibeInformacoesSubProduto(ACodProduto: string);
var
  LSQL: TStringList;
  LTbAux: TFDMemTable;
  I: integer;
begin
  LTbAux := TFDMemTable.Create(nil);
  LSQL := TstringList.create;

  try
    try

      LSQL.add(' select p.cod_produto,p.unidade_entrada,                               ');
      LSQL.add('        p.descricao,                                                       ');
      LSQL.add('        g.descricao as descGrupo,                                          ');
      LSQL.add('        p.rendimento,                                                      ');
      LSQL.add('        udf_roundabnt((p.estoque_liquido / u.parametro),3) as EstoqueAtual,');
      LSQL.add('        u.descricao as descUnidade, u.sigla as siglaUnidade                ');
      LSQL.add('    from produtos p                                                        ');
      LSQL.add('      inner join grupos   g on (g.cod_grupo = p.cod_grupo)                 ');
      LSQL.add('      inner join unidades u on (u.cod_unidade = p.unidade_entrada)         ');
      LSQL.add('    where p.cod_produto  =' + QuotedStr(ACodProduto));
      dm.getMemTable(LTbAux, LSQL.text);

      if LTbAux.IsEmpty then
        exit;

      for I := 0 to ComponentCount - 1 do
      begin
        if (components[I].Name = 'edCodSubmateria') then
          (components[I] as TCustomEdit).text := LTbAux.FieldByName('cod_produto').Value;

        if (components[I].Name = 'edDescricaoSubmateria') then
          (components[I] as TCustomEdit).text := LTbAux.FieldByName('descricao').Value;

        if (components[I].Name = 'edEstoqueSubproduto') then
          (components[I] as TCustomEdit).text := LTbAux.FieldByName('EstoqueAtual').AsString + ' ' + LTbAux.FieldByName('siglaUnidade').AsString;

        if (components[I].Name = 'edRendimentoSubproduto') then
          (components[I] as TCustomEdit).text := LTbAux.FieldByName('rendimento').AsString + ' ' + LTbAux.FieldByName('siglaUnidade').AsString;

        if (components[I].Name = 'edCodUnidadeSubmateria') then
          (components[I] as TCustomEdit).text := LTbAux.FieldByName('unidade_entrada').Value;

        if (components[I].Name = 'edDescUnidadeSubmateria') then
          (components[I] as TCustomEdit).text := LTbAux.FieldByName('descUnidade').Value;

        if (components[I].Name = 'edSiglaUnSubmateria') then
          (components[I] as TCustomEdit).text := LTbAux.FieldByName('siglaUnidade').AsString
      end;

    except
      on E: Exception do
      begin
        dm.exibe_painel_erro('Erro ao buscar informações do subproduto ' + E.Message, 'Ok');
        raise Exception.Create('Erro ao buscar informações do subproduto');
      end;
    end;
  finally
    FreeAndNil(LSQL);
    LTbAux.Active := false;
    FreeAndNil(LTbAux);
  end;

end;

procedure Tfrm_modelo_vazio.exibeInformacoesTipoBaixaEstoque(codTipo: string);
var
  q: TIBQuery;
  i: integer;
  estoque: string;
begin

  q := TIBQuery.Create(self);
  q.Database := dm.dbrestaurante;
  q.Transaction := dm.transacao;
  q.Active := false;
  q.SQL.Clear;
  q.SQL.Add('select * from tipos_baixa where cod_tipo=' + Quotedstr(codTipo));
  q.Active := true;

  if q.IsEmpty = false then
  begin
    for i := 0 to ComponentCount - 1 do
    begin
      if (components[i].Name = 'edCodTipoBaixaEstoque') then
        (components[i] as TCustomEdit).text := q.fieldbyname('cod_tipo').value;

      if (components[i].Name = 'edDescricaoTipoBaixaEstoque') then
        (components[i] as TCustomEdit).text := q.fieldbyname('descricao').value;
    end;
  end;

  q.Active := false;
  FreeAndNil(q);
end;

procedure Tfrm_modelo_vazio.exibeInformacoesUnidadeEntrada(cod_unidade_entrada: string);
var
  q: TIBQuery;
  i: integer;
begin
  q := TIBQuery.Create(self);
  q.Database := dm.dbrestaurante;
  q.Transaction := dm.transacao;
  q.Active := false;

  q.Active := false;
  q.sql.clear;
  q.sql.add('select * from unidades where cod_unidade=' + Quotedstr(cod_unidade_entrada));
  q.Active := true;
  if q.IsEmpty then
    exit;

  for i := 0 to ComponentCount - 1 do
  begin
    if (components[i].Name = 'ed_cod_un_entrada') then
      (components[i] as TCustomEdit).text := q.fieldbyname('cod_unidade').value;

    if (components[i].Name = 'ed_desc_un_entrada') then
      (components[i] as TCustomEdit).text := q.fieldbyname('descricao').Value;
  end;
  FreeAndNil(q);
end;

procedure Tfrm_modelo_vazio.exibeInformacoesUnidadeSaida(cod_unidade_saida: string);
var
  q: TIBQuery;
  i: integer;
begin
  q := TIBQuery.Create(self);
  q.Database := dm.dbrestaurante;
  q.Transaction := dm.transacao;
  q.Active := false;

  q.Active := false;
  q.sql.clear;
  q.sql.add('select * from unidades where cod_unidade=' + Quotedstr(cod_unidade_saida));
  q.Active := true;
  if q.IsEmpty then
    exit;

  for i := 0 to ComponentCount - 1 do
  begin
    if (components[i].Name = 'ed_cod_un_saida') then
      (components[i] as TCustomEdit).text := q.fieldbyname('cod_unidade').value;

    if (components[i].Name = 'ed_desc_un_saida') then
      (components[i] as TCustomEdit).text := q.fieldbyname('descricao').Value;
  end;
  FreeAndNil(q);
end;

procedure Tfrm_modelo_vazio.exibeInformacoesSaborPizza(codSabor: string);
var
  q: TIBQuery;
  i: integer;
begin
  q := TIBQuery.Create(self);
  q.Database := dm.dbrestaurante;
  q.Transaction := dm.transacao;
  q.Active := false;

  q.active := false;
  q.sql.clear;
  q.sql.add('select * from sabores_pizza where codigo=' + Quotedstr(codSabor));
  q.active := true;
  if q.IsEmpty then
    exit;

  for i := 0 to ComponentCount - 1 do
  begin
    if (components[i].Name = 'edCodSaborPizza') then
      (components[i] as TCustomEdit).text := q.fieldbyname('codigo').value;

    if (components[i].Name = 'edDescSaborPizza') then
      (components[i] as TCustomEdit).text := q.fieldbyname('descricao').Value;
  end;
  FreeAndNil(q);
end;

procedure Tfrm_modelo_vazio.exibeInformacoesUnidadeDeFracao(codUnFracao: string);
var
  q: TIBQuery;
  i: integer;
begin
  q := TIBQuery.Create(self);
  q.Database := dm.dbrestaurante;
  q.Transaction := dm.transacao;
  q.Active := false;

  q.Active := false;
  q.sql.clear;
  q.sql.add('select * from unidades where cod_unidade=' + Quotedstr(codUnFracao));
  q.Active := true;
  if q.IsEmpty then
    exit;

  for i := 0 to ComponentCount - 1 do
  begin
    if (components[i].Name = 'edCodUnFracao') then
      (components[i] as TCustomEdit).text := q.fieldbyname('cod_unidade').value;

    if (components[i].Name = 'edDescUnFracao') then
      (components[i] as TCustomEdit).text := q.fieldbyname('descricao').Value;
  end;

  FreeAndNil(q);
end;

procedure Tfrm_modelo_vazio.exibeInformacoesAliquota(codAliquota: string);
var
  q: TIBQuery;
  i: integer;
begin
  q := TIBQuery.Create(self);
  q.Database := dm.dbrestaurante;
  q.Transaction := dm.transacao;
  q.Active := false;

  q.Active := false;
  q.sql.clear;
  q.sql.add('select * from aliquotas where cod_aliquota=' + Quotedstr(codAliquota));
  q.Active := true;
  if q.IsEmpty then
    exit;

  for i := 0 to ComponentCount - 1 do
  begin
    if (components[i].Name = 'edCodAliquota') then
      (components[i] as TCustomEdit).text := q.fieldbyname('cod_aliquota').value;

    if (components[i].Name = 'edDescAliquota') then
      (components[i] as TCustomEdit).text := q.fieldbyname('descricao').Value;
  end;

  FreeAndNil(q);
end;

procedure Tfrm_modelo_vazio.exibeInformacoesFormaDePagamento(codForma: string);
var
  q: TIBQuery;
  i: integer;
  edCodForma: TComponent;
  edDescricaoForma: TComponent;
begin

  q := TIBQuery.Create(self);
  q.Database := dm.dbrestaurante;
  q.Transaction := dm.transacao;
  q.Active := false;

  q.Active := false;
  q.sql.clear;
  q.sql.add('select cod_forma, descricao from formas_pagamento where cod_forma=' + Quotedstr(codForma));
  q.Active := true;

  edCodForma := FindComponent('edCodFormaPagamento');

  edDescricaoForma := FindComponent('edDescricaoForma');
  edDescricaoForma := FindComponent('edDescricaoForma');

  if edCodForma <> nil then
  begin
    case AnsiIndexStr((edCodForma.ClassName), ['TEdit', 'TCurvyEdit', 'TEdit']) of
      0:
        begin
          (edCodForma as TEdit).Text := q.fields[0].Value;
        end;
      1:
        begin
          (edCodForma as TCurvyEdit).Text := q.fields[0].Value;
        end;
    end;
  end;

  if edDescricaoForma <> nil then
  begin
    case AnsiIndexStr((edDescricaoForma.ClassName), ['TEdit', 'TCurvyEdit', 'TEdit']) of
      0:
        begin
          (edDescricaoForma as TEdit).Text := q.fields[1].Value;
        end;
      1:
        begin
          (edDescricaoForma as TCurvyEdit).Text := q.fields[1].Value;
        end;
    end;
  end;

end;

procedure Tfrm_modelo_vazio.exibeInformacoesLoja(codLoja: string);
var
  q: TIBQuery;
  i: integer;
begin
  q := TIBQuery.Create(self);
  q.Database := dm.dbrestaurante;
  q.Transaction := dm.transacao;
  q.Active := false;

  q.Active := false;
  q.sql.clear;
  q.sql.add('select * from empresas_grupo where codigo=' + Quotedstr(codLoja));
  q.Active := true;
  if q.IsEmpty then
    exit;

  for i := 0 to ComponentCount - 1 do
  begin
    if (components[i].Name = 'edCodLoja') then
      (components[i] as TCustomEdit).text := q.fieldbyname('codigo').value;

    if (components[i].Name = 'edDescLoja') then
      (components[i] as TCustomEdit).text := q.fieldbyname('descricao').Value;

    if (components[i].Name = 'edCodFornecedorLoja') then
      (components[i] as TCustomEdit).text := q.fieldbyname('cod_tab_fornecedor').Value;

  end;

  FreeAndNil(q);
end;

function Tfrm_modelo_vazio.getAliasEmpresaGrupo(codEmpresa: string): string;
var
  q: TIBQuery;
  i: integer;
begin
  q := TIBQuery.Create(self);
  q.Database := dm.dbrestaurante;
  q.Transaction := dm.transacao;
  q.Active := false;

  q.Active := false;
  q.sql.clear;
  q.sql.add('select * from empresas_grupo where codigo=' + Quotedstr(codEmpresa));
  q.Active := true;

  Result := q.fieldbyname('alias').Value;
  FreeAndNil(q);
end;

procedure Tfrm_modelo_vazio.exibeInformacoesClienteDelivery(codCli: string);
var
  q: TIBQuery;
  i: integer;
begin
  q := TIBQuery.Create(self);
  q.Database := dm.dbrestaurante;
  q.Transaction := dm.transacao;
  q.Active := false;

  q.Active := false;
  q.sql.clear;
  q.sql.add('select * from clientes_delivery where codigo=' + Quotedstr(codCli));
  q.Active := true;
  if q.IsEmpty then
    exit;

  for i := 0 to ComponentCount - 1 do
  begin
    if (components[i].Name = 'edCodCliDelivery') then
      (components[i] as TCustomEdit).text := q.fieldbyname('codigo').value;

    if (components[i].Name = 'edNomeClienteDelivery') then
      (components[i] as TCustomEdit).text := q.fieldbyname('nome').Value;
  end;

  FreeAndNil(q);
end;

procedure Tfrm_modelo_vazio.exibeInformacoesClienteFaturamento(codCli: string);
var
  q: TIBQuery;
  q2: TIBQuery;
  i: integer;
  totalUtilizadoLimite: double;
begin

  q := TIBQuery.Create(self);
  q.Database := dm.dbrestaurante;
  q.Transaction := dm.transacao;
  q.Active := false;

  q2 := TIBQuery.Create(self);
  q2.Database := dm.dbrestaurante;
  q2.Transaction := dm.transacao;
  q2.Active := false;

  q.Active := false;
  q.sql.clear;
  q.sql.add('select cl.* from clientes cl where cl.cod_cli=' + Quotedstr(codCli));
  q.Active := true;
  if q.IsEmpty then
  begin
    FreeAndNil(q2);
    FreeAndNil(q);
    exit;
  end;

  q2.Active := false;
  q2.SQL.Clear;
  q2.SQL.Add('select sum(valor_fatura) as limiteUtilizado from faturas where cod_cli=' + Quotedstr(codCli) + ' and status=0');
  q2.active := true;

  if q2.fieldbyname('limiteUtilizado').Value = null then
    totalUtilizadoLimite := 0
  else
    totalUtilizadoLimite := q2.fieldbyname('limiteUtilizado').Value;

  for i := 0 to ComponentCount - 1 do
  begin
    if (components[i].Name = 'ed_cod_cliente') then
      (components[i] as TCustomEdit).text := q.fieldbyname('cod_cli').value;

    if (components[i].Name = 'ed_desc_cliente') then
      (components[i] as TCustomEdit).text := q.fieldbyname('razao_social').Value;

    if (components[i].Name = 'edLimiteTotalClienteFaturado') then
      (components[i] as TCurrencyEdit).value := q.fieldbyname('credito').Value;

    if (components[i].Name = 'edLimiteUtilizadolClienteFaturado') then
      (components[i] as TCurrencyEdit).value := totalUtilizadoLimite;

    if (components[i].Name = 'edLimiteLivreClienteFaturado') then
      (components[i] as TCurrencyEdit).value := q.fieldbyname('credito').Value - totalUtilizadoLimite;

  end;

  FreeAndNil(q2);
  FreeAndNil(q);
end;

procedure Tfrm_modelo_vazio.exibeInformacoesClienteBoateRG(rgCliente: string);
var
  q: TIBQuery;
  i: integer;
begin
  q := TIBQuery.Create(self);
  q.Database := dm.dbrestaurante;
  q.Transaction := dm.transacao;
  q.Active := false;

  q.Active := false;
  q.sql.clear;
  q.sql.add('select cli.cod_cli,cli.razao_social from clientes cli where cli.rg=' + Quotedstr(rgCliente));
  q.Active := true;
  if q.IsEmpty then
    exit;

  for i := 0 to ComponentCount - 1 do
  begin
    if (components[i].Name = 'edCodCliBoate') then
      (components[i] as TCustomEdit).text := q.fieldbyname('cod_cli').value;

    if (components[i].Name = 'edNomeClienteBoate') then
      (components[i] as TCustomEdit).text := q.fieldbyname('razao_social').Value;
  end;

  FreeAndNil(q);
end;

procedure Tfrm_modelo_vazio.exibeInformacoesFornecedor(cod_fornecedor: string);
var
  q: TIBQuery;
  i: integer;
begin
  q := TIBQuery.Create(self);
  q.Database := dm.dbrestaurante;
  q.Transaction := dm.transacao;
  q.Active := false;

  q.Active := false;
  q.sql.clear;

  q.sql.add(' select f.*,  c.nome as NomeCidade, e.nome as NomeEstado, e.sigla UF  from fornecedor f');
  q.sql.add('   inner join cidade c on (c.cod_cidade = f.cod_cidade)');
  q.sql.add('   inner join estado e on (e.codigo = f.cod_estado)');
  q.sql.add(' where f.cod_fornecedor=' + Quotedstr(cod_fornecedor));

  q.Active := true;
  if q.IsEmpty then
    exit;

  for i := 0 to ComponentCount - 1 do
  begin
    if (components[i].Name = 'ed_cod_fornecedor') then
    begin

      (components[i] as TCustomEdit).text := q.fieldbyname('cod_fornecedor').value;
    end;

    if (components[i].Name = 'ed_razao_social_fornecedor') then
      (components[i] as TCustomEdit).text := q.fieldbyname('razao_social').Value;

    if (components[i].Name = 'ed_nome_fantasia_fornecedor') then
      (components[i] as TCustomEdit).text := q.fieldbyname('nome_fantasia').Value;

    if (components[i].Name = 'ed_cnpj_fornecedor') then
      (components[i] as TCustomEdit).text := q.fieldbyname('CGC_CPF').Value;

    if (components[i].Name = 'ed_cidade_fornecedor') then
      (components[i] as TCustomEdit).text := q.fieldbyname('NomeCidade').Value;

    if (components[i].Name = 'ed_uf_fornecedor') then
      (components[i] as TCustomEdit).text := q.fieldbyname('uf').Value;

  end;

  FreeAndNil(q);
end;

procedure Tfrm_modelo_vazio.exibeInformacoesFornecedorCNPJ(CNPJfornecedor: string);
var
  q: TIBQuery;
  i: integer;
begin
  q := TIBQuery.Create(self);
  q.Database := dm.dbrestaurante;
  q.Transaction := dm.transacao;
  q.Active := false;

  q.Active := false;
  q.sql.clear;

  q.sql.add(' select f.*,  c.nome as NomeCidade, e.nome as NomeEstado, e.sigla UF  from fornecedor f');
  q.sql.add('   inner join cidade c on (c.cod_cidade = f.cod_cidade)');
  q.sql.add('   inner join estado e on (e.codigo = f.cod_estado)');
  q.sql.add(' where f.CGC_CPF=' + Quotedstr(CNPJfornecedor));

  q.Active := true;
  if q.IsEmpty then
    exit;

  for i := 0 to ComponentCount - 1 do
  begin
    if (components[i].Name = 'ed_cod_fornecedor') then
    begin

      (components[i] as TCustomEdit).text := q.fieldbyname('cod_fornecedor').value;
    end;

    if (components[i].Name = 'ed_razao_social_fornecedor') then
      (components[i] as TCustomEdit).text := q.fieldbyname('razao_social').Value;

    if (components[i].Name = 'ed_nome_fantasia_fornecedor') then
      (components[i] as TCustomEdit).text := q.fieldbyname('nome_fantasia').Value;

    if (components[i].Name = 'ed_cnpj_fornecedor') then
      (components[i] as TCustomEdit).text := q.fieldbyname('CGC_CPF').Value;

    if (components[i].Name = 'ed_ie_fornecedor') then
      (components[i] as TCustomEdit).text := q.fieldbyname('INSCRICAO_ESTADUAL').Value;

    if (components[i].Name = 'ed_cidade_fornecedor') then
      (components[i] as TCustomEdit).text := q.fieldbyname('NomeCidade').Value;

    if (components[i].Name = 'ed_uf_fornecedor') then
      (components[i] as TCustomEdit).text := q.fieldbyname('uf').Value;

  end;

  FreeAndNil(q);
end;

procedure Tfrm_modelo_vazio.exibeInformacoesBairro(codBairro: string);
var
  q: TIBQuery;
  i: integer;
begin
  q := TIBQuery.Create(self);
  q.Database := dm.dbrestaurante;
  q.Transaction := dm.transacao;
  q.Active := false;

  q.Active := false;
  q.sql.clear;
  q.sql.add(' select * from bairro where codigo=' + codBairro);

  q.Active := true;
  if q.IsEmpty then
    exit;

  for i := 0 to ComponentCount - 1 do
  begin
    if (components[i].Name = 'edCodBairro') then
      (components[i] as TCustomEdit).text := Inttostr(q.fieldbyname('codigo').value);

    if (components[i].Name = 'edDescBairro') then
      (components[i] as TCustomEdit).text := q.fieldbyname('descricao').Value;

  end;

  FreeAndNil(q);

end;

procedure Tfrm_modelo_vazio.exibeInformacoesTiposDocumento(cod_tipo_doc: string);
var
  q: TIBQuery;
  i: integer;
begin
  q := TIBQuery.Create(self);
  q.Database := dm.dbrestaurante;
  q.Transaction := dm.transacao;
  q.Active := false;

  q.Active := false;
  q.sql.clear;
  q.sql.add('select * from tipos_documento where cod_tipo_doc=' + Quotedstr(cod_tipo_doc));
  q.Active := true;
  if q.IsEmpty then
    exit;

  for i := 0 to ComponentCount - 1 do
  begin
    if (components[i].Name = 'ed_cod_tipo_documento') then
      (components[i] as TCustomEdit).text := q.fieldbyname('cod_tipo_doc').value;

    if (components[i].Name = 'ed_desc_tipo_documento') then
      (components[i] as TCustomEdit).text := q.fieldbyname('descricao').Value;
  end;

  FreeAndNil(q);

end;

procedure Tfrm_modelo_vazio.exibeInformacoesTiposEntrada(cod_tipo_entrada: string);
var
  q: TIBQuery;
  i: integer;
begin
  q := TIBQuery.Create(self);
  q.Database := dm.dbrestaurante;
  q.Transaction := dm.transacao;
  q.Active := false;

  q.Active := false;
  q.sql.clear;
  q.sql.add('select * from tipos_entrada where cod_tipo_entrada=' + Quotedstr(cod_tipo_entrada));
  q.Active := true;
  if q.IsEmpty then
    exit;

  for i := 0 to ComponentCount - 1 do
  begin
    if (components[i].Name = 'ed_cod_tipo_entrada') then
      (components[i] as TCustomEdit).text := q.fieldbyname('cod_tipo_entrada').value;

    if (components[i].Name = 'ed_desc_tipo_entrada') then
      (components[i] as TCustomEdit).text := q.fieldbyname('descricao').Value;
  end;

  FreeAndNil(q);

end;

procedure Tfrm_modelo_vazio.exibeInformacoesCFOPEntrada(CFOP: string);
var
  q: TIBQuery;
  i: integer;
begin
  q := TIBQuery.Create(self);
  q.Database := dm.dbrestaurante;
  q.Transaction := dm.transacao;
  q.Active := false;

  q.Active := false;
  q.sql.clear;
  q.sql.add('select *  from CFOP where codigo=' + Quotedstr(CFOP));
  q.Active := true;
  if q.IsEmpty then
    exit;

  for i := 0 to ComponentCount - 1 do
  begin
    if (components[i].Name = 'ed_cefop_entradas') then
      (components[i] as TCustomEdit).text := q.fieldbyname('codigo').value;

    if (components[i].Name = 'ed_descricao_cfop_entradas') then
      (components[i] as TCustomEdit).text := q.fieldbyname('descricao').Value;
  end;
  FreeAndNil(q);
end;

procedure Tfrm_modelo_vazio.exibeInformacoesCFOPTransferencia(CFOP: string);
var
  q: TIBQuery;
  i: integer;
begin
  q := TIBQuery.Create(self);
  q.Database := dm.dbrestaurante;
  q.Transaction := dm.transacao;
  q.Active := false;

  q.Active := false;
  q.sql.clear;
  q.sql.add('select *  from CFOP where codigo=' + Quotedstr(CFOP));
  q.Active := true;
  if q.IsEmpty then
    exit;

  for i := 0 to ComponentCount - 1 do
  begin
    if (components[i].Name = 'edCfopTransferencia') then
      (components[i] as TCustomEdit).text := q.fieldbyname('codigo').value;

    if (components[i].Name = 'edDescCFOPTransferencia') then
      (components[i] as TCustomEdit).text := q.fieldbyname('descricao').Value;
  end;
  FreeAndNil(q);
end;

procedure Tfrm_modelo_vazio.exibeInformacoesCFOPDevolucao(CFOP: string);
var
  q: TIBQuery;
  i: integer;
begin
  q := TIBQuery.Create(self);
  q.Database := dm.dbrestaurante;
  q.Transaction := dm.transacao;
  q.Active := false;

  q.Active := false;
  q.sql.clear;
  q.sql.add('select *  from CFOP where codigo=' + Quotedstr(CFOP));
  q.Active := true;
  if q.IsEmpty then
    exit;

  for i := 0 to ComponentCount - 1 do
  begin
    if (components[i].Name = 'edCfopDevolucao') then
      (components[i] as TCustomEdit).text := q.fieldbyname('codigo').value;

    if (components[i].Name = 'edDescCFOPDevolucao') then
      (components[i] as TCustomEdit).text := q.fieldbyname('descricao').Value;
  end;
  FreeAndNil(q);
end;

procedure Tfrm_modelo_vazio.exibeInformacoesCFOPSaida(CFOP: string);
var
  q: TIBQuery;
  i: integer;
begin
  q := TIBQuery.Create(self);
  q.Database := dm.dbrestaurante;
  q.Transaction := dm.transacao;
  q.Active := false;

  q.Active := false;
  q.sql.clear;
  q.sql.add('select *  from CFOP where codigo=' + Quotedstr(CFOP));
  q.Active := true;
  if q.IsEmpty then
    exit;

  for i := 0 to ComponentCount - 1 do
  begin
    if (components[i].Name = 'ed_cefop_saidas') then
      (components[i] as TCustomEdit).text := q.fieldbyname('codigo').value;

    if (components[i].Name = 'ed_descricao_cfop_saidas') then
      (components[i] as TCustomEdit).text := q.fieldbyname('descricao').Value;
  end;

  FreeAndNil(q);

end;

procedure Tfrm_modelo_vazio.exibeInformacoesCFOP(CFOP: string);
var
  q: TIBQuery;
  i: integer;
begin
  q := TIBQuery.Create(self);
  q.Database := dm.dbrestaurante;
  q.Transaction := dm.transacao;
  q.Active := false;

  q.Active := false;
  q.sql.clear;
  q.sql.add('select *  from CFOP where codigo=' + Quotedstr(CFOP));
  q.Active := true;
  if q.IsEmpty then
    exit;

  for i := 0 to ComponentCount - 1 do
  begin
    if (components[i].Name = 'ed_cfop') then
      (components[i] as TCustomEdit).text := q.fieldbyname('codigo').value;

    if (components[i].Name = 'ed_descricao_cfop') then
      (components[i] as TCustomEdit).text := q.fieldbyname('descricao').Value;
  end;

  FreeAndNil(q);

end;

procedure Tfrm_modelo_vazio.exibeInformacoesTipoItemSPED(codigo: string);
var
  q: TIBQuery;
  i: integer;
begin
  q := TIBQuery.Create(self);
  q.Database := dm.dbrestaurante;
  q.Transaction := dm.transacao;
  q.Active := false;

  q.Active := false;
  q.sql.clear;
  q.sql.add('select *  from tipos_item_sped where cod_tipo=' + Quotedstr(codigo));
  q.Active := true;
  if q.IsEmpty then
    exit;

  for i := 0 to ComponentCount - 1 do
  begin
    if (components[i].Name = 'edCodTipoItemSped') then
      (components[i] as TCustomEdit).text := q.fieldbyname('cod_tipo').value;

    if (components[i].Name = 'edDescTipoItemSped') then
      (components[i] as TCustomEdit).text := q.fieldbyname('descricao').Value;
  end;
  FreeAndNil(q);
end;

procedure Tfrm_modelo_vazio.exibeInformacoesNCM(codigo: string);
var
  q: TIBQuery;
  i: integer;
begin
  q := TIBQuery.Create(self);
  q.Database := dm.dbrestaurante;
  q.Transaction := dm.transacao;
  q.Active := false;

  q.Active := false;
  q.sql.clear;
  q.sql.add('select ncm,descricao from ncm where ncm=' + Quotedstr(codigo));
  q.Active := true;
  if q.IsEmpty then
    exit;

  for i := 0 to ComponentCount - 1 do
  begin
    if (components[i].Name = 'edCodNCM') then
      (components[i] as TCustomEdit).text := q.fieldbyname('ncm').value;

    if (components[i].Name = 'edDescNCM') then
      (components[i] as TCustomEdit).text := q.fieldbyname('descricao').Value;
  end;
  FreeAndNil(q);
end;

procedure Tfrm_modelo_vazio.exibeInformacoesGeneroItem(codigo: string);
var
  q: TIBQuery;
  i: integer;
begin
  q := TIBQuery.Create(self);
  q.Database := dm.dbrestaurante;
  q.Transaction := dm.transacao;
  q.Active := false;

  q.Active := false;
  q.sql.clear;
  q.sql.add('select codigo,descricao from genero_item where codigo=' + Quotedstr(codigo));
  q.Active := true;
  if q.IsEmpty then
    exit;

  for i := 0 to ComponentCount - 1 do
  begin
    if (components[i].Name = 'edCodGeneroItem') then
      (components[i] as TCustomEdit).text := q.fieldbyname('codigo').value;

    if (components[i].Name = 'edDescGeneroItem') then
      (components[i] as TCustomEdit).text := q.fieldbyname('descricao').Value;
  end;
  FreeAndNil(q);
end;

procedure Tfrm_modelo_vazio.exibeInformacoesModeloNotaFiscal(codModeloNota: string);
var
  q: TIBQuery;
  i: integer;
begin
  q := TIBQuery.Create(self);
  q.Database := dm.dbrestaurante;
  q.Transaction := dm.transacao;
  q.Active := false;

  q.Active := false;
  q.sql.clear;
  q.sql.add('select *  from modelos_nf where codigo=' + Quotedstr(codModeloNota));
  q.Active := true;
  if q.IsEmpty then
    exit;

  for i := 0 to ComponentCount - 1 do
  begin
    if (components[i].Name = 'ed_cod_modelo_nota_fiscal') then
      (components[i] as TCustomEdit).text := q.fieldbyname('codigo').value;

    if (components[i].Name = 'ed_descricao_modelo_nota_fiscal') then
      (components[i] as TCustomEdit).text := q.fieldbyname('descricao').Value;
  end;

  FreeAndNil(q);
end;

procedure Tfrm_modelo_vazio.exibeInformacoesSituacaoDocumentoFiscal(codSituacao: string);
var
  q: TIBQuery;
  i: integer;
begin
  q := TIBQuery.Create(self);
  q.Database := dm.dbrestaurante;
  q.Transaction := dm.transacao;
  q.Active := false;

  q.Active := false;
  q.sql.clear;
  q.sql.add(' select cod_situacao, descricao from situacao_documento where cod_situacao=' + QUotedstr(codSituacao));
  q.Active := true;
  if q.IsEmpty then
    exit;

  for i := 0 to ComponentCount - 1 do
  begin

    if (components[i].Name = 'edCodSituacaoDocFiscal') then
      (components[i] as TCustomEdit).text := q.fieldbyname('cod_situacao').value;

    if (components[i].Name = 'edDescSituacaoDocFiscal') then
      (components[i] as TCustomEdit).text := q.fieldbyname('descricao').Value;

  end;

  FreeAndNil(q);
end;

procedure Tfrm_modelo_vazio.exibeInformacoesCST(CST: string);
var
  q: TIBQuery;
  i: integer;
begin
  q := TIBQuery.Create(self);
  q.Database := dm.dbrestaurante;
  q.Transaction := dm.transacao;
  q.Active := false;

  q.Active := false;
  q.sql.clear;
  q.sql.add('select *  from CST where CST=' + Quotedstr(CST));
  q.Active := true;
  if q.IsEmpty then
    exit;

  for i := 0 to ComponentCount - 1 do
  begin
    if (components[i].Name = 'ed_cst') then
      (components[i] as TCustomEdit).text := q.fieldbyname('cst').value;

    if (components[i].Name = 'ed_descricao_cst') then
      (components[i] as TCustomEdit).text := q.fieldbyname('descricao').Value;
  end;

  FreeAndNil(q);
end;

procedure Tfrm_modelo_vazio.exibeInformacoesCST_saida(CST: string);
var
  q: TIBQuery;
  i: integer;
begin
  q := TIBQuery.Create(self);
  q.Database := dm.dbrestaurante;
  q.Transaction := dm.transacao;
  q.Active := false;

  q.Active := false;
  q.sql.clear;
  q.sql.add('select *  from CST where CST=' + Quotedstr(CST));
  q.Active := true;
  if q.IsEmpty then
    exit;

  for i := 0 to ComponentCount - 1 do
  begin
    if (components[i].Name = 'edCstSaida') then
      (components[i] as TCustomEdit).text := q.fieldbyname('cst').value;

    if (components[i].Name = 'ed_desc_cst_saida') then
      (components[i] as TCustomEdit).text := q.fieldbyname('descricao').Value;
  end;

  FreeAndNil(q);
end;

procedure Tfrm_modelo_vazio.exibeInformacoesCSTTransferencias(CST: string);
var
  q: TIBQuery;
  i: integer;
begin
  q := TIBQuery.Create(self);
  q.Database := dm.dbrestaurante;
  q.Transaction := dm.transacao;
  q.Active := false;

  q.Active := false;
  q.sql.clear;
  q.sql.add('select *  from CST where CST=' + Quotedstr(CST));
  q.Active := true;
  if q.IsEmpty then
    exit;

  for i := 0 to ComponentCount - 1 do
  begin
    if (components[i].Name = 'edCstTransferencia') then
      (components[i] as TCustomEdit).text := q.fieldbyname('cst').value;

    if (components[i].Name = 'edDescCstTransferencia') then
      (components[i] as TCustomEdit).text := q.fieldbyname('descricao').Value;
  end;

  FreeAndNil(q);
end;

procedure Tfrm_modelo_vazio.exibeInformacoesCSTDevolucoes(CST: string);
var
  q: TIBQuery;
  i: integer;
begin
  q := TIBQuery.Create(self);
  q.Database := dm.dbrestaurante;
  q.Transaction := dm.transacao;
  q.Active := false;

  q.Active := false;
  q.sql.clear;
  q.sql.add('select *  from CST where CST=' + Quotedstr(CST));
  q.Active := true;
  if q.IsEmpty then
    exit;

  for i := 0 to ComponentCount - 1 do
  begin
    if (components[i].Name = 'edCstDevolucao') then
      (components[i] as TCustomEdit).text := q.fieldbyname('cst').value;

    if (components[i].Name = 'edDescCstDevolucao') then
      (components[i] as TCustomEdit).text := q.fieldbyname('descricao').Value;
  end;

  FreeAndNil(q);
end;

procedure Tfrm_modelo_vazio.exibeInformacoesCSTPisCofins(CST: string);
var
  q: TIBQuery;
  i: integer;
begin
  q := TIBQuery.Create(self);
  q.Database := dm.dbrestaurante;
  q.Transaction := dm.transacao;
  q.Active := false;

  q.Active := false;
  q.sql.clear;
  q.sql.add('select *  from CST_PIS_COFINS where CST=' + Quotedstr(CST));
  q.Active := true;
  if q.IsEmpty then
    exit;

  for i := 0 to ComponentCount - 1 do
  begin
    if (components[i].Name = 'edCstPisCofins') then
      (components[i] as TCustomEdit).text := q.fieldbyname('cst').value;

    if (components[i].Name = 'edDescCstPIS') then
      (components[i] as TCustomEdit).text := q.fieldbyname('descricao').Value;
  end;

  FreeAndNil(q);
end;

procedure Tfrm_modelo_vazio.exibeInformacoesEstado(cod_estado: string);
var
  q: TIBQuery;
  i: integer;
begin
  q := TIBQuery.Create(self);
  q.Database := dm.dbrestaurante;
  q.Transaction := dm.transacao;
  q.Active := false;

  q.Active := false;
  q.sql.clear;
  q.sql.add('select * from estado where codigo=' + Quotedstr(cod_estado));
  q.Active := true;
  if q.IsEmpty then
    exit;

  for i := 0 to ComponentCount - 1 do
  begin
    if (components[i].Name = 'ed_cod_estado') then
      (components[i] as TCustomEdit).text := q.fieldbyname('codigo').value;

    if (components[i].Name = 'ed_nome_estado') then
      (components[i] as TCustomEdit).text := q.fieldbyname('nome').Value;

    if (components[i].Name = 'ed_uf_estado') then
      (components[i] as TCustomEdit).text := q.fieldbyname('sigla').Value;
  end;

  FreeAndNil(q);
end;

function Tfrm_modelo_vazio.getUFEstado(cod_estado: string): string;
var
  q: TIBQuery;
  i: integer;
begin
  q := TIBQuery.Create(self);
  q.Database := dm.dbrestaurante;
  q.Transaction := dm.transacao;
  q.Active := false;

  q.Active := false;
  q.sql.clear;
  q.sql.add('select * from estado where codigo=' + Quotedstr(cod_estado));
  q.Active := true;

  result := q.fieldbyname('SIGLA').value;
  FreeAndNil(q);
end;

function Tfrm_modelo_vazio.getCodEstadoUF(UF: string): string;
var
  q: TIBQuery;
  i: integer;
begin
  q := TIBQuery.Create(self);
  q.Database := dm.dbrestaurante;
  q.Transaction := dm.transacao;
  q.Active := false;

  q.Active := false;
  q.sql.clear;
  q.sql.add('select codigo from estado where sigla=' + Quotedstr(UF));
  q.Active := true;
  result := q.fieldbyname('codigo').value;
  FreeAndNil(q);
end;

procedure Tfrm_modelo_vazio.exibeInformacoesEntregador(codEntregador: string);
var
  q: TIBQuery;
  i: integer;
begin
  q := TIBQuery.Create(self);
  q.Database := dm.dbrestaurante;
  q.Transaction := dm.transacao;
  q.Active := false;

  q.Active := false;
  q.sql.clear;
  q.sql.add('select * from entregadores where codigo=' + Quotedstr(codEntregador));
  q.Active := true;
  if q.IsEmpty then
    exit;

  for i := 0 to ComponentCount - 1 do
  begin
    if (components[i].Name = 'edCodEntregador') then
      (components[i] as TCustomEdit).text := q.fieldbyname('codigo').value;

    if (components[i].Name = 'edNomeEntregador') then
      (components[i] as TCustomEdit).text := q.fieldbyname('nome_entregador').Value;
  end;
  FreeAndNil(q);
end;

procedure Tfrm_modelo_vazio.exibeInformacoesGarcons(codGarcon: string);
var
  q: TIBQuery;
  i: integer;
begin
  q := TIBQuery.Create(self);
  q.Database := dm.dbrestaurante;
  q.Transaction := dm.transacao;
  q.Active := false;

  q.Active := false;
  q.sql.clear;
  q.sql.add('select * from garcons where cod_garcon=' + Quotedstr(codGarcon));
  q.Active := true;
  if q.IsEmpty then
    exit;

  for i := 0 to ComponentCount - 1 do
  begin

    if (components[i].Name = 'ed_cod_garcon') then
      (components[i] as TCustomEdit).text := q.fieldbyname('cod_garcon').value;

    if (components[i].Name = 'ed_nome_garcon') then
      (components[i] as TCustomEdit).text := q.fieldbyname('apelido').Value;

  end;
  FreeAndNil(q);
end;

procedure Tfrm_modelo_vazio.exibeInformacoesPromoter(codPromoter: string);
var
  q: TIBQuery;
  i: integer;
begin
  q := TIBQuery.Create(self);
  q.Database := dm.dbrestaurante;
  q.Transaction := dm.transacao;
  q.Active := false;

  q.Active := false;
  q.sql.clear;
  q.sql.add('select * from promoters where cod_promote=' + Quotedstr(codPromoter));
  q.Active := true;
  if q.IsEmpty then
    exit;

  for i := 0 to ComponentCount - 1 do
  begin

    if (components[i].Name = 'edCodPromoter') then
      (components[i] as TCustomEdit).text := q.fieldbyname('cod_promoter').value;

    if (components[i].Name = 'edNomePromoter') then
      (components[i] as TCustomEdit).text := q.fieldbyname('nome').Value;

  end;
  FreeAndNil(q);
end;

procedure Tfrm_modelo_vazio.exibeInformacoesDepartamento(codDepartamento: string);
var
  q: TIBQuery;
  i: integer;
begin
  q := TIBQuery.Create(self);
  q.Database := dm.dbrestaurante;
  q.Transaction := dm.transacao;
  q.Active := false;

  q.Active := false;
  q.sql.clear;
  q.sql.add('select * from departamentos where codigo=' + Quotedstr(codDepartamento));
  q.Active := true;
  if q.IsEmpty then
    exit;

  for i := 0 to ComponentCount - 1 do
  begin

    if (components[i].Name = 'edCodDepartamento') then
      (components[i] as TCustomEdit).text := Inttostr(q.fieldbyname('codigo').value);

    if (components[i].Name = 'edDescDepartamento') then
      (components[i] as TCustomEdit).text := q.fieldbyname('descricao').Value;
  end;
  FreeAndNil(q);
end;

procedure Tfrm_modelo_vazio.exibeInformacoesGuarnicao(codGuarnicao: string);
var
  q: TIBQuery;
  i: integer;
begin
  q := TIBQuery.Create(self);
  q.Database := dm.dbrestaurante;
  q.Transaction := dm.transacao;
  q.Active := false;

  q.Active := false;
  q.sql.clear;
  q.sql.add('select * from guarnicoes where codigo=' + Quotedstr(codGuarnicao));
  q.Active := true;
  if q.IsEmpty then
    exit;

  for i := 0 to ComponentCount - 1 do
  begin

    if (components[i].Name = 'edCodGuarnicao') then
      (components[i] as TCustomEdit).text := q.fieldbyname('codigo').value;

    if (components[i].Name = 'edDescGuarnicao') then
      (components[i] as TCustomEdit).text := q.fieldbyname('descricao').Value;
  end;
  FreeAndNil(q);
end;

procedure Tfrm_modelo_vazio.exibeInformacoesGrupoTouch(codGrupoTouch: string);
var
  q: TIBQuery;
  i: integer;
begin
  q := TIBQuery.Create(self);
  q.Database := dm.dbrestaurante;
  q.Transaction := dm.transacao;
  q.Active := false;

  q.Active := false;
  q.sql.clear;
  q.sql.add('select * from grupos_touch where codigo=' + Quotedstr(codGrupoTouch) + ' and codigo <> ' + Quotedstr('00'));
  q.Active := true;
  if q.IsEmpty then
    exit;

  for i := 0 to ComponentCount - 1 do
  begin

    if (components[i].Name = 'edCodGrupoTouch') then
      (components[i] as TCustomEdit).text := q.fieldbyname('codigo').value;

    if (components[i].Name = 'edDescGrupoTouch') then
      (components[i] as TCustomEdit).text := q.fieldbyname('descricao').Value;
  end;
  FreeAndNil(q);
end;

procedure Tfrm_modelo_vazio.exibeInformacoesCentroCusto(codConta: string);
var
  q: TIBQuery;
  i: integer;
begin
  q := TIBQuery.Create(self);
  q.Database := dm.dbrestaurante;
  q.Transaction := dm.transacao;
  q.Active := false;

  q.Active := false;
  q.sql.clear;
  q.sql.add('select * from plano_contas_financeiro where cod_conta=' + Quotedstr(codConta));
  q.Active := true;
  if q.IsEmpty then
    exit;

  for i := 0 to ComponentCount - 1 do
  begin
    if (components[i].Name = 'ed_cod_centro_custo') then
      (components[i] as TCustomEdit).text := q.fieldbyname('cod_conta').value;

    if (components[i].Name = 'ed_desc_c_custo') then
      (components[i] as TCustomEdit).text := q.fieldbyname('descricao').Value;
  end;

  FreeAndNil(q);

end;

procedure Tfrm_modelo_vazio.exibeInformacoesGrupos(codGrupo: string);
var
  q: TIBQuery;
  i: integer;
begin
  q := TIBQuery.Create(self);
  q.Database := dm.dbrestaurante;
  q.Transaction := dm.transacao;
  q.Active := false;

  q.Active := false;
  q.sql.clear;
  q.sql.add('select * from grupos where cod_grupo=' + Quotedstr(codGrupo));
  q.Active := true;
  if q.IsEmpty then
    exit;

  for i := 0 to ComponentCount - 1 do
  begin
    if (components[i].Name = 'ed_cod_cod_grupo') then
      (components[i] as TCustomEdit).text := q.fieldbyname('cod_grupo').value;

    if (components[i].Name = 'ed_desc_grupo') then
      (components[i] as TCustomEdit).text := q.fieldbyname('descricao').Value;
  end;

  FreeAndNil(q);

end;

procedure Tfrm_modelo_vazio.exibeInformacoesGruposRD(codGrupoRD: string);
var
  q: TIBQuery;
  i: integer;
begin
  q := TIBQuery.Create(self);
  q.Database := dm.dbrestaurante;
  q.Transaction := dm.transacao;
  q.Active := false;

  q.Active := false;
  q.sql.clear;
  q.sql.add('select * from grupos_rd where cod_grupo=' + Quotedstr(codGrupoRD));
  q.Active := true;
  if q.IsEmpty then
    exit;

  for i := 0 to ComponentCount - 1 do
  begin
    if (components[i].Name = 'edCodGrupoRD') then
      (components[i] as TCustomEdit).text := q.fieldbyname('cod_grupo').value;

    if (components[i].Name = 'edDescGrupoRD') then
      (components[i] as TCustomEdit).text := q.fieldbyname('descricao').Value;
  end;

  FreeAndNil(q);

end;

function Tfrm_modelo_vazio.getPermissaoDeTroco(codForma: string): boolean;
var
  q: TIBQuery;
begin
  q := TIBQuery.Create(self);
  q.Database := dm.dbrestaurante;
  q.Transaction := dm.transacao;
  q.Active := false;

  q.sql.Clear;
  q.sql.add('select * from formas_pagamento where cod_forma=' + Quotedstr(codForma));
  q.Active := true;

  if (q.FieldByName('permite_troco').Value = 0) then
    Result := false
  else
    Result := true;
  FreeAndNil(q);
end;

function Tfrm_modelo_vazio.getTipoTEFFormaPagato(codForma: string): smallint;
var
  q: TIBQuery;
begin
  q := TIBQuery.Create(self);
  q.Database := dm.dbrestaurante;
  q.Transaction := dm.transacao;
  q.Active := false;

  q.sql.Clear;
  q.sql.add('select TEF from formas_pagamento where cod_forma=' + Quotedstr(codForma));
  q.Active := true;
  Result := q.fieldbyname('TEF').Value;
  FreeAndNil(q);
end;

function Tfrm_modelo_vazio.iniciarOperacaoComTEF(): boolean;
var
  retorno: smallint;
  mensagem: string;
begin

  if (VerificaConexaoInternet = false) then
  begin
    mensagem := 'Serviço indisponível. Por favor verifique a sua conexão com a internet!';
    Result := false;
    exit;
  end;
//  retorno :=    dm.clienteCappta.IniciarMultiCartoes(9);

  case retorno of
    0:
      result := true;
    1:
      mensagem := 'Não autenticado/Alguma das informações fornecidas para autenticação não é válida';
    2:
      mensagem := 'CapptaGpPlus está sendo inicializado';
    3:
      mensagem := 'Erro interno no CapptaGpPlus';
    4:
      mensagem := '	Erro na comunicação entre a CappAPI e o CapptaGpPlus';
    5:
      mensagem := 'Ocorre quando qualquer operação é realizada sem que se tenha finalizado o último pagamento';
  end;

  if retorno <> 0 then
  begin
    exibe_painel_erro(mensagem, 'Ok');
    Result := false;
  end
  else
  begin
    Result := true;
  end;

end;

{
procedure Tfrm_modelo_vazio.ConfirmaOperacaoTEFCappta();
begin
  frm_principal.memoPagamentosTEF.Lines.SaveToFile('c:\restaurante\extrato.dat');
  dm.imprimeTexoMiniPrinter();
  dm.clienteCappta.ConfirmarPagamentos();

end;
   }
function Tfrm_modelo_vazio.getCodNovoProduto(): string;
var
  q: TIBQuery;
  codigo: integer;
begin
  q := TIBQuery.Create(self);
  q.Database := dm.dbrestaurante;
  q.Transaction := dm.transacao;
  q.Active := false;

  q.SQL.Clear;
  q.SQL.add('select first 1 codigo from codigos_livres where livre=0 order by codigo');
  q.Active := true;
  codigo := q.fieldbyname('codigo').value;

  q.SQL.Clear;
  q.SQL.add('update codigos_livres set livre=1 where codigo=' + IntToStr(codigo));
  q.ExecSQL;
  FreeAndNil(q);

  result := FormatFloat('00000', codigo);
end;

function Tfrm_modelo_vazio.getCodProduto(codBarrasProduto: string): string;
var
  q: TIBQuery;
begin
  q := TIBQuery.Create(self);
  q.Database := dm.dbrestaurante;
  q.Transaction := dm.transacao;
  q.Active := false;

  if ((Length(codBarrasProduto) >= 6) and (Length(codBarrasProduto) <= 13)) then
  begin
    q.SQL.Clear;
    q.SQL.add('select cod_produto from produtos where cod_barras=' + Quotedstr(codBarrasProduto));
    q.Active := true;
    result := q.fieldbyname('cod_produto').value;
  end
  else
  begin

    if ((StrToInt(codBarrasProduto) < 50000)) then
    begin
      q.SQL.Clear;
      q.SQL.add('select cod_produto from produtos where cod_barras=' + Quotedstr(codBarrasProduto));
      q.Active := true;
      result := q.fieldbyname('cod_produto').value;
    end
    else
    begin
      q.SQL.Clear;
      q.SQL.add('select cod_produto from PRODUTOS_TABELA_PRECOS where codigo =' + codBarrasProduto);
      q.Active := true;

      if q.IsEmpty then
      begin
        q.SQL.Clear;
        q.SQL.add('select cod_produto from produtos where cod_barras=' + Quotedstr(codBarrasProduto));
        q.Active := true;
      end;
      result := q.fieldbyname('cod_produto').value;
    end;

  end;

  FreeAndNil(q);
end;

function Tfrm_modelo_vazio.getCodProdutoTabelaPrecos(codigo: string): string;
var
  q: TIBQuery;
begin
  q := TIBQuery.Create(self);
  q.Database := dm.dbrestaurante;
  q.Transaction := dm.transacao;
  q.Active := false;

  q.SQL.Clear;
  q.SQL.add('select cod_produto from PRODUTOS_TABELA_PRECOS where coigo=' + Quotedstr(codigo));
  q.Active := true;
  result := q.fieldbyname('cod_produto').value;

  FreeAndNil(q);
end;

function Tfrm_modelo_vazio.getCodMiniPrinterProduto(codBarrasProduto: string): string;
var
  q: TIBQuery;
begin
  q := TIBQuery.Create(self);
  q.Database := dm.dbrestaurante;
  q.Transaction := dm.transacao;
  q.Active := false;

  q.SQL.Clear;
  q.SQL.add('select cod_miniprinter from produtos where cod_barras=' + Quotedstr(codBarrasProduto));
  q.Active := true;
  result := q.fieldbyname('cod_miniprinter').value;
  ////dm.adicionalog('Impressora de produção do produto ' + codBarrasProduto + ' é a impressora ' + Result);
  FreeAndNil(q);
end;

procedure Tfrm_modelo_vazio.exibeInformacoesUsuario(cod_usuario: string);
var
  q: TIBQuery;
  i: integer;
begin
  q := TIBQuery.Create(self);
  q.Database := dm.dbrestaurante;
  q.Transaction := dm.transacao;
  q.Active := false;

  q.Active := false;
  q.sql.clear;
  q.sql.add('select * from usuarios where cod_usuario=' + Quotedstr(cod_usuario));
  q.Active := true;
  if q.IsEmpty then
    exit;

  for i := 0 to ComponentCount - 1 do
  begin
    if (components[i].Name = 'ed_cod_usuario') then
      (components[i] as TCustomEdit).text := q.fieldbyname('cod_usuario').value;

    if (components[i].Name = 'ed_login_usuario') then
      (components[i] as TCustomEdit).text := q.fieldbyname('login').Value;

    if (components[i].Name = 'ed_nome_completo_usuario') then
      (components[i] as TCustomEdit).text := q.fieldbyname('nome_usuario').Value;
  end;

  FreeAndNil(q);

end;

function Tfrm_modelo_vazio.verificaExistenciaReg60A(codReg: string): boolean;
var
  q: TIBQuery;
  i: integer;
begin
  q := TIBQuery.Create(self);
  q.Database := dm.dbrestaurante;
  q.Transaction := dm.transacao;
  q.Active := false;

  q.Active := false;
  q.sql.clear;
  q.sql.add('select * from reg60A where cod_reg=' + Quotedstr(codReg));
  q.Active := true;

  result := not q.IsEmpty;
  FreeAndNil(q);

end;

function Tfrm_modelo_vazio.verificaExistenciaReg60M(codReg: string): boolean;
var
  q: TIBQuery;
  i: integer;
begin
  q := TIBQuery.Create(self);
  q.Database := dm.dbrestaurante;
  q.Transaction := dm.transacao;
  q.Active := false;

  q.Active := false;
  q.sql.clear;
  q.sql.add('select * from reg60M where cod_reg=' + Quotedstr(codReg));
  q.Active := true;

  result := not q.IsEmpty;

  FreeAndNil(q);

end;

function Tfrm_modelo_vazio.verificaExistenciaAliquota(codAliquota: string): boolean;
var
  q: TIBQuery;
begin
  q := TIBQuery.Create(self);
  q.Database := dm.dbrestaurante;
  q.Transaction := dm.transacao;
  q.Active := false;

  q.Active := false;
  q.sql.clear;
  q.sql.add('select * from aliquotas where cod_aliquota=' + Quotedstr(codAliquota));
  q.Active := true;

  result := not q.IsEmpty;

  FreeAndNil(q);
end;

function Tfrm_modelo_vazio.verificaExistenciaFormaDePagamento(codForma: string): boolean;
var
  q: TIBQuery;
begin
  q := TIBQuery.Create(self);
  q.Database := dm.dbrestaurante;
  q.Transaction := dm.transacao;
  q.Active := false;

  q.Active := false;
  q.sql.clear;
  q.sql.add('select * from  formas_pagamento where cod_forma=' + Quotedstr(codForma));
  q.Active := true;

  result := not q.IsEmpty;

  FreeAndNil(q);
end;

function Tfrm_modelo_vazio.getDescricaoFormaPagamento(codForma: string): string;
var
  q: TIBQuery;
begin
  q := TIBQuery.Create(self);
  q.Database := dm.dbrestaurante;
  q.Transaction := dm.transacao;
  q.Active := false;

  q.Active := false;
  q.sql.clear;
  q.sql.add('select descricao from  formas_pagamento where cod_forma=' + Quotedstr(codForma));
  q.Active := true;

  result := q.fieldbyname('descricao').value;

  FreeAndNil(q);
end;

function Tfrm_modelo_vazio.verificaExistenciaCartao(cartao: string): boolean;
var
  q: TIBQuery;
begin
  q := TIBQuery.Create(self);
  q.Database := dm.dbrestaurante;
  q.Transaction := dm.transacao;
  q.Active := false;

  q.Active := false;
  q.sql.clear;
  q.sql.add('select * from cartoes where cod_cartao=' + Quotedstr(cartao));
  q.Active := true;
  result := not q.IsEmpty;
  FreeAndNil(q);
end;

function Tfrm_modelo_vazio.verificaSeCartaoCobraServico(cartao: string): boolean;
var
  q: TIBQuery;
begin
  q := TIBQuery.Create(self);
  q.Database := dm.dbrestaurante;
  q.Transaction := dm.transacao;
  q.Active := false;

  q.Active := false;
  q.sql.clear;
  q.sql.add('select * from cartoes where cod_cartao=' + Quotedstr(cartao));
  q.Active := true;

  if ((q.FieldByName('cobrar_servico').value = 1) or (q.IsEmpty)) then
    result := true
  else
    result := false;

  q.Active := false;
  FreeAndNil(q);
end;

procedure Tfrm_modelo_vazio.exibeInformacoesProduto(codProduto: string; tipo: integer);
var
  ts: TIBTransaction;
  q: TIBQuery;
  i: integer;
  edCodProduto, edCodBarrasProduto, edDescricaoProduto, edCodGrupoProduto, edDescGrupoProduto, edValorUnitarioProduto, lbDescricaoProduto, lbValorUnitarioProduto: TComponent;
  filtro: string;
begin
  ts := TIBTransaction.Create(self);
  ts.DefaultDatabase := dm.dbrestaurante;
  ts.Active := true;

  q := TIBQuery.Create(self);
  q.Database := dm.dbrestaurante;
  q.Transaction := ts;

  q.Active := false;
  q.Active := false;
  q.sql.clear;

  try

    case tipo of
      1:
        filtro := 'p.cod_produto';
      2:
        filtro := 'p.cod_barras';
    end;

    case dm.getTabelaPrecoAtual.codigo of
      0:
        begin
          q.sql.add('select p.cod_produto, p.cod_barras, p.descricao, p.valor_unitario, p.cod_grupo, ');
          q.sql.add('       g.descricao as descricao_grupo from produtos p ');
          q.sql.add('   inner join grupos g on (g.cod_grupo = p.cod_grupo) ');
          q.SQL.Add(' where ' + filtro + '=' + Quotedstr(codProduto));
          q.Active := true;
        end;
    else
      begin
        q.sql.add('select p.cod_produto, p.cod_barras, p.descricao, tab.valor_unitario , p.cod_grupo, ');
        q.sql.add('       g.descricao as descricao_grupo from produtos p ');
        q.sql.add('   inner join grupos g on (g.cod_grupo = p.cod_grupo) ');
        q.sql.add('   inner join produtos_tabela_precos tab on (tab.cod_produto = p.cod_produto) ');
        q.sql.add('   where tab.cod_tabela =' + Inttostr(dm.getTabelaPrecoAtual.codigo));
        q.SQL.Add('  and ' + filtro + '=' + Quotedstr(codProduto));
        q.Active := true;
      end;
    end;

    if q.IsEmpty = false then
    begin
      edCodProduto := self.FindComponent('edCodProduto');
      edCodBarrasProduto := self.FindComponent('edCodBarrasProduto');
      edDescricaoProduto := self.FindComponent('edDescricaoProduto');
      edCodGrupoProduto := self.FindComponent('edCodGrupoProduto');
      edDescGrupoProduto := self.FindComponent('edDescGrupoProduto');
      edValorUnitarioProduto := self.FindComponent('edValorUnitarioProduto');
      lbDescricaoProduto := self.FindComponent('lbDescricaoProduto');
      lbValorUnitarioProduto := self.FindComponent('lbValorUnitarioProduto');

      if edCodProduto <> nil then
        case AnsiIndexStr((edCodProduto.ClassName), ['TCustomEdit', 'TCurvyEdit', 'TEdit']) of
          0:
            begin
              (edCodProduto as TEdit).Text := q.fieldbyname('cod_produto').value;
            end;
          1:
            begin
              (edCodProduto as TCurvyEdit).Text := q.fieldbyname('cod_produto').value;
            end;

          2:
            begin
              (edCodProduto as TEdit).Text := q.fieldbyname('cod_produto').value;
            end;

        end;

      if edCodBarrasProduto <> nil then
        case AnsiIndexStr((edCodBarrasProduto.ClassName), ['TCustomEdit', 'TCurvyEdit', 'TEdit']) of
          0:
            begin
              (edCodBarrasProduto as TEdit).Text := q.fieldbyname('cod_barras').value;
            end;
          1:
            begin
              (edCodBarrasProduto as TCurvyEdit).Text := q.fieldbyname('cod_barras').value;
            end;

          2:
            begin
              (edCodBarrasProduto as TEdit).Text := q.fieldbyname('cod_barras').value;
            end;
        end;

      if edDescricaoProduto <> nil then
        case AnsiIndexStr((edDescricaoProduto.ClassName), ['TCustomEdit', 'TCurvyEdit', 'TEdit']) of
          0:
            begin
              (edDescricaoProduto as TEdit).Text := q.fieldbyname('descricao').value;
            end;
          1:
            begin
              (edDescricaoProduto as TCurvyEdit).Text := q.fieldbyname('descricao').value;
            end;

          2:
            begin
              (edDescricaoProduto as TEdit).Text := q.fieldbyname('descricao').value;
            end;

        end;

      if edCodGrupoProduto <> nil then
        case AnsiIndexStr((edCodGrupoProduto.ClassName), ['TCustomEdit', 'TCurvyEdit', 'TEdit']) of
          0:
            begin
              (edCodGrupoProduto as TEdit).Text := q.fieldbyname('cod_grupo').value;
            end;
          1:
            begin
              (edCodGrupoProduto as TCurvyEdit).Text := q.fieldbyname('cod_grupo').value;
            end;
          2:
            begin
              (edCodGrupoProduto as TEdit).Text := q.fieldbyname('cod_grupo').value;
            end;

        end;

      if edDescGrupoProduto <> nil then
        case AnsiIndexStr((edDescGrupoProduto.ClassName), ['TCustomEdit', 'TCurvyEdit', 'TEdit']) of
          0:
            begin
              (edDescGrupoProduto as TEdit).Text := q.fieldbyname('descricao_grupo').value;
            end;
          1:
            begin
              (edDescGrupoProduto as TCurvyEdit).Text := q.fieldbyname('descricao_grupo').value;
            end;

          2:
            begin
              (edDescGrupoProduto as TEdit).Text := q.fieldbyname('descricao_grupo').value;
            end;
        end;

      if edValorUnitarioProduto <> nil then
        case AnsiIndexStr((edValorUnitarioProduto.ClassName), ['TCustomEdit', 'TCurvyEdit', 'TEdit']) of
          0:
            begin
              (edValorUnitarioProduto as TEdit).Text := FormatFloat('###,###,##0.00', q.fieldbyname('valor_unitario').Value);
            end;
          1:
            begin
              (edValorUnitarioProduto as TCurvyEdit).Text := FormatFloat('###,###,##0.00', q.fieldbyname('valor_unitario').Value);
            end;
          2:
            begin
              (edValorUnitarioProduto as TEdit).Text := FormatFloat('###,###,##0.00', q.fieldbyname('valor_unitario').Value);
            end;

        end;

      if lbDescricaoProduto <> nil then
        case AnsiIndexStr((lbDescricaoProduto.ClassName), ['TCustomLabel']) of
          0:
            begin
              (lbDescricaoProduto as TCustomLabel).Caption := q.fieldbyname('descricao').value;
              (lbDescricaoProduto as TCustomLabel).Visible := true;
            end;
        end;

      if lbValorUnitarioProduto <> nil then
        case AnsiIndexStr((lbValorUnitarioProduto.ClassName), ['TCustomLabel']) of
          0:
            begin
              (lbValorUnitarioProduto as TCustomLabel).caption := FormatFloat('###,###,##0.00', q.fieldbyname('valor_unitario').Value);
              (lbValorUnitarioProduto as TCustomLabel).Visible := true;
            end;
        end;

    end
    else
    begin
      exibe_painel_erro('Produto não disponível na tabela: ( ' + dm.getTabelaPrecoAtual.descricao + ')', 'Ok');
    end;
  finally
    ts.Active := false;
    FreeAndNil(ts);
    q.Active := false;
    FreeAndNil(q);
  end;
end;

procedure Tfrm_modelo_vazio.exibeInformacoesProdutoPizza(codProdutoPizza: string; tamanhoPizza: string; moduloVenda: string);
var
  q: TIBQuery;
  i: integer;
  md: string;
  tam: string;
begin
  q := TIBQuery.Create(self);
  q.Database := dm.dbrestaurante;
  q.Transaction := dm.transacao;
  q.Active := false;

  if moduloVenda = 'D' then
    md := 'delivery'
  else
    md := 'balcao';

  if tamanhoPizza = 'bro' then
    tam := 'B';

  if tamanhoPizza = 'peq' then
    tam := 'P';

  if tamanhoPizza = 'med' then
    tam := 'M';

  if tamanhoPizza = 'gde' then
    tam := 'G';

  if tamanhoPizza = 'fam' then
    tam := 'F';

  q.Active := false;
  q.sql.clear;
  q.sql.add('select * from v_produtos where cod_produto=' + Quotedstr(codProdutoPizza));
  q.Active := true;

  if q.IsEmpty then
    exit;

  for i := 0 to ComponentCount - 1 do
  begin
    if (components[i].Name = 'edCodPizza' + moduloVenda + tamanhoPizza) then
      (components[i] as TCustomEdit).text := q.fieldbyname('cod_produto').value;

    if (components[i].Name = 'edDescPizza' + moduloVenda + tamanhoPizza) then
      (components[i] as TCustomEdit).text := q.fieldbyname('descricao').value;

    if (components[i].Name = 'edPrecoPizza' + moduloVenda + tamanhoPizza) then
      (components[i] as TCustomEdit).text := q.fieldbyname('valor_unitario').Value;
  end;

  if ((dm.qrySaboresPizza.State = dsInsert) or (dm.qrySaboresPizza.State = dsEdit)) then
  begin
    dm.qrySaboresPizza.FieldByName('preco' + tam + md).Value := q.fieldbyname('valor_unitario').Value;
    dm.qrySaboresPizza.FieldByName(tam + md).Value := q.fieldbyname('cod_produto').Value;

  end;

  FreeAndNil(q);
end;

function Tfrm_modelo_vazio.verificaSeNumeroInteiro(numero: double): boolean;
begin
  try
    numero := StrToInt(floattostr(numero));
  except
    begin
      result := false;
      exit;
    end;
  end;
  result := true;
end;

function Tfrm_modelo_vazio.verificaSeClienteEstaNaCasa(codCliente: string): boolean;
var
  q: TIBQuery;
begin
  q := TIBQuery.Create(self);
  q.Database := dm.dbrestaurante;
  q.Transaction := dm.transacao;
  q.Active := false;

  q.Active := false;
  q.sql.clear;
  q.sql.add('select * from cartoes where cod_cli=' + Quotedstr(codCliente));
  q.Active := true;
  result := not q.IsEmpty;

  FreeAndNil(q);
end;

function Tfrm_modelo_vazio.verificaSeExisteCouvertNaConta(mesa: string): boolean;
var
  q: TIBQuery;
begin
  q := TIBQuery.Create(self);
  q.Database := dm.dbrestaurante;
  q.Transaction := dm.transacao;
  q.Active := false;
  q.sql.add('select mv.cod_produto   from movimento_mesa   mv');
  q.sql.add('where mv.cod_produto  in (select cod_produto from produtos p where p.couvert=1)');
  q.sql.add('  and mv.cod_mesa=' + QuotedStr(mesa));
  q.Active := true;
  result := not q.isempty;

  q.Active := false;
  FreeAndNil(q);
end;

function Tfrm_modelo_vazio.verificaNotaFiscalJaFoiLancada(codFornecedor: string; numeroNota: string; modeloNota: string): boolean;
var
  q: TIBQuery;
begin
  numeroNota := FormatFloat('000000000000000', StrToInt(numeroNota));
  codFornecedor := FormatFloat('0000', StrToInt(codFornecedor));
  q := TIBQuery.Create(self);
  q.Database := dm.dbrestaurante;
  q.Transaction := dm.transacao;
  q.Active := false;

  if (trim(modeloNota) = '') then
    q.sql.add(' select * from entradas where cod_fornecedor=' + QuotedStr(codFornecedor) + ' and numero_nota=' + Quotedstr(numeroNota))
  else
    q.sql.add(' select * from entradas where cod_fornecedor=' + QuotedStr(codFornecedor) + ' and numero_nota=' + Quotedstr(numeroNota) + ' and modelo_nota=' + Quotedstr(modeloNota));

  q.Active := true;
  result := not q.isempty;

  q.Active := false;
  FreeAndNil(q);
end;

function Tfrm_modelo_vazio.verificaNotaFiscalSaidaJaFoiLancada(numeroNota: string; modelo: string): boolean;
var
  q: TIBQuery;
begin
  q := TIBQuery.Create(self);
  q.Database := dm.dbrestaurante;
  q.Transaction := dm.transacao;

  q.Active := false;
  q.sql.add(' select * from saidas where numero_nota=' + Quotedstr(formatFloat('000000000000000', StrToFloat(numeroNota))) + ' and modelo_nota=' + Quotedstr(modelo));
  q.Active := true;

  if q.IsEmpty then
    result := false
  else
    Result := true;
  q.Active := false;
  FreeAndNil(q);
end;

function Tfrm_modelo_vazio.verificaNotaFiscalConsumidorJaFoiLancada(numeroNota: string): boolean;
var
  q: TIBQuery;
begin
  q := TIBQuery.Create(self);
  q.Database := dm.dbrestaurante;
  q.Transaction := dm.transacao;
  q.Active := false;
  q.sql.add(' select * from notas_consumidor where codigo=' + Quotedstr(numeroNota));
  q.Active := true;
  result := not q.isempty;
  q.Active := false;
  FreeAndNil(q);
end;

function Tfrm_modelo_vazio.verificaExistenciaNotaTransportadora(codigoEntrada: string): boolean;
var
  q: TIBQuery;
begin
  q := TIBQuery.Create(self);
  q.Database := dm.dbrestaurante;
  q.Transaction := dm.transacao;
  q.Active := false;
  q.sql.add(' select * from notas_transporte where codigo=' + Quotedstr(codigoEntrada));
  q.Active := true;
  result := not q.isempty;
  q.Active := false;
  FreeAndNil(q);
end;

function Tfrm_modelo_vazio.verificaDatas(data_inicial: string; data_final: string): boolean;
begin
  try
    StrToDate(data_inicial)
  except
    begin
      showmessage('Data inicial inválida!');
      Result := false;
      exit;
    end;
  end;

  try
    StrToDate(data_final)
  except
    begin
      showmessage('Data final inválida!');
      Result := false;
      exit;
    end;
  end;

  if (StrToDate(data_inicial) > StrToDate(data_final)) then
  begin
    ShowMessage('Intervalo de datas inválido!');
    Result := false;
    exit;
  end;

  data_inicial := Quotedstr(FormatDateTime('DD.MM.YYY', StrTodate(data_inicial)));
  data_final := Quotedstr(FormatDateTime('DD.MM.YYY', StrTodate(data_final)));

  Result := true;
end;

procedure Tfrm_modelo_vazio.FormActivate(Sender: TObject);
begin

  Self.SetFocus;
end;

procedure Tfrm_modelo_vazio.Edit1Change(Sender: TObject);
var
  i: integer;
begin
  if ((Sender is TCustomEdit and ((Sender as TCustomEdit).Name = 'ed_cod_fornecedor'))) then
    if ((Sender is TCustomEdit and (trim((Sender as TCustomEdit).text) = ''))) then
    begin
      for i := 0 to ComponentCount - 1 do
      begin
        if (components[i].Name = 'ed_cod_fornecedor') then
          (components[i] as TCustomEdit).Clear;

        if (components[i].Name = 'ed_razao_social_fornecedor') then
          (components[i] as TCustomEdit).Clear;

        if (components[i].Name = 'ed_nome_fantasia_fornecedor') then
          (components[i] as TCustomEdit).Clear;
      end;
    end;

  if ((Sender is TCustomEdit and ((Sender as TCustomEdit).Name = 'edCodTipoBaixaEstoque'))) then
    if ((Sender is TCustomEdit and (trim((Sender as TCustomEdit).text) = ''))) then
    begin
      for i := 0 to ComponentCount - 1 do
      begin
        if (components[i].Name = 'edCodTipoBaixaEstoque') then
          (components[i] as TCustomEdit).Clear;

        if (components[i].Name = 'edDescricaoTipoBaixaEstoque') then
          (components[i] as TCustomEdit).Clear;
      end;
    end;

  if ((Sender is TCustomEdit and ((Sender as TCustomEdit).Name = 'ed_cod_tipo_documento'))) then
    if ((Sender is TCustomEdit and (trim((Sender as TCustomEdit).text) = ''))) then
    begin
      for i := 0 to ComponentCount - 1 do
      begin
        if (components[i].Name = 'ed_cod_tipo_documento') then
          (components[i] as TCustomEdit).Clear;

        if (components[i].Name = 'ed_desc_tipo_documento') then
          (components[i] as TCustomEdit).Clear;
      end;
    end;

  if ((Sender is TCustomEdit and ((Sender as TCustomEdit).Name = 'ed_cod_tipo_entrada'))) then
    if ((Sender is TCustomEdit and (trim((Sender as TCustomEdit).text) = ''))) then
    begin
      for i := 0 to ComponentCount - 1 do
      begin
        if (components[i].Name = 'ed_cod_tipo_entrada') then
          (components[i] as TCustomEdit).Clear;

        if (components[i].Name = 'ed_desc_tipo_entrada') then
          (components[i] as TCustomEdit).Clear;
      end;
    end;

  if ((Sender is TCustomEdit and ((Sender as TCustomEdit).Name = 'edCodBairro'))) then
    if ((Sender is TCustomEdit and (trim((Sender as TCustomEdit).text) = ''))) then
    begin
      for i := 0 to ComponentCount - 1 do
      begin
        if (components[i].Name = 'edCodBairro') then
          (components[i] as TCustomEdit).Clear;

        if (components[i].Name = 'edDescBairro') then
          (components[i] as TCustomEdit).Clear;
      end;
    end;

  if ((Sender is TCustomEdit and ((Sender as TCustomEdit).Name = 'ed_cod_grupo'))) then
    if ((Sender is TCustomEdit and (trim((Sender as TCustomEdit).text) = ''))) then
    begin
      for i := 0 to ComponentCount - 1 do
      begin
        if (components[i].Name = 'ed_cod_grupo') then
          (components[i] as TCustomEdit).Clear;

        if (components[i].Name = 'ed_desc_grupo') then
          (components[i] as TCustomEdit).Clear;
      end;
    end;

  if ((Sender is TCustomEdit and ((Sender as TCustomEdit).Name = 'edCodFormaPagamento'))) then
    if ((Sender is TCustomEdit and (trim((Sender as TCustomEdit).text) = ''))) then
    begin
      for i := 0 to ComponentCount - 1 do
      begin
        if (components[i].Name = 'edCodFormaPagamento') then
          (components[i] as TCustomEdit).Clear;

        if (components[i].Name = 'edDescFormaPagto') then
          (components[i] as TCustomEdit).Clear;
      end;
    end;

  if ((Sender is TCustomEdit and ((Sender as TCustomEdit).Name = 'ed_cod_item'))) then
    if ((Sender is TCustomEdit and (trim((Sender as TCustomEdit).text) = ''))) then
    begin
      for i := 0 to ComponentCount - 1 do
      begin
        if (components[i].Name = 'ed_cod_item') then
          (components[i] as TCustomEdit).Clear;

        if (components[i].Name = 'ed_desc_item') then
          (components[i] as TCustomEdit).Clear;
      end;
    end;

  if ((Sender is TCustomEdit and ((Sender as TCustomEdit).Name = 'edCodEntregador'))) then
    if ((Sender is TCustomEdit and (trim((Sender as TCustomEdit).text) = ''))) then
    begin
      for i := 0 to ComponentCount - 1 do
      begin
        if (components[i].Name = 'edCodEntregador') then
          (components[i] as TCustomEdit).Clear;

        if (components[i].Name = 'edNomeEntregador') then
          (components[i] as TCustomEdit).Clear;
      end;
    end;

  if ((Sender is TCustomEdit and ((Sender as TCustomEdit).Name = 'ed_cod_usuario'))) then
    if ((Sender is TCustomEdit and (trim((Sender as TCustomEdit).text) = ''))) then
    begin
      for i := 0 to ComponentCount - 1 do
      begin
        if (components[i].Name = 'ed_cod_usuario') then
          (components[i] as TCustomEdit).Clear;

        if (components[i].Name = 'ed_nome_completo_usuario') then
          (components[i] as TCustomEdit).Clear;
      end;
    end;

  if ((Sender is TCustomEdit and ((Sender as TCustomEdit).Name = 'edCodProduto'))) then
    if ((Sender is TCustomEdit and (trim((Sender as TCustomEdit).text) = ''))) then
    begin
      for i := 0 to ComponentCount - 1 do
      begin
        if (components[i].Name = 'edCodProduto') then
          (components[i] as TCustomEdit).Clear;

        if (components[i].Name = 'ed_desc_produto') then
          (components[i] as TCustomEdit).Clear;
      end;
    end;
end;

procedure Tfrm_modelo_vazio.FormCreate(Sender: TObject);
begin
  Position := poScreenCenter;
  AddExportMenuToGrids(self);
end;

procedure Tfrm_modelo_vazio.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  dm.qry_consultas.Close;
end;

procedure Tfrm_modelo_vazio.copiaValoresComponentes();
var
  i: integer;
  q: TIBQuery;
begin
  q := TIBQuery.Create(self);
  q.Database := dm.dbrestaurante;
  q.Transaction := dm.transacao;
  q.Active := false;

  q.SQL.clear;
  q.SQL.add('delete from componentes_form where estacao=' + IntToStr(numeroEstacao));
  q.execsql;
  for i := 0 to ComponentCount - 1 do
  begin
    if components[i] is TCustomEdit then
    begin
      q.SQL.clear;
      if components[i] is TCurrencyEdit then
      begin

        q.SQL.Add('insert into componentes_form (nome_componente,valor_propriedade,estacao) values (' + Quotedstr(((components[i] as TCustomEdit).Name)) + ',' + Quotedstr(CurrToStr(FloatToCurr(((components[i] as TCurrencyEdit).value)))) + ',' + IntToStr(numeroEstacao) + ')');
        q.ExecSQL;
      end;

      if components[i] is TDBedit then
      begin
        q.SQL.Add('insert into componentes_form (nome_componente,valor_propriedade,estacao) values (' + Quotedstr(((components[i] as TCustomEdit).Name)) + ',' + Quotedstr(((components[i] as TCustomEdit).text)) + ',' + IntToStr(numeroEstacao) + ')');
        q.ExecSQL;
      end;
    end
  end;
  q.SQL.add('delete from componentes_form where estacao=' + IntToStr(numeroEstacao));
  dm.transacao.Commit;
  dm.transacao.Active := false;
  dm.transacao.Active := true;
  FreeAndNil(q);
end;

procedure Tfrm_modelo_vazio.retornaValoresComponentes();
var
  i: integer;
  q: TIBQuery;
begin
  q := TIBQuery.Create(self);
  q.Database := dm.dbrestaurante;
  q.Transaction := dm.transacao;
  q.Active := false;

  for i := 0 to ComponentCount - 1 do
  begin
    q.SQL.clear;
    q.SQL.add('select *  from componentes_form where estacao=' + IntToStr(numeroEstacao) + ' and nome_componente=' + Quotedstr((components[i] as TComponent).name));
    q.Active := true;

    if components[i] is TCustomEdit then
    begin
      if components[i] is TCurrencyEdit then
      begin
        (components[i] as TCurrencyEdit).value := StrToCurr(q.fieldbyname('valor_propriedade').Value);
      end;

      if components[i] is TDBedit then
      begin
        (components[i] as TDBEdit).text := q.fieldbyname('valor_propriedade').Value;
      end;
    end
  end;
  FreeAndNil(q);
end;

function Tfrm_modelo_vazio.getPastaSistemaWindows: string;
var
  Buffer: array[0..144] of Char;
begin
  GetSystemDirectory(Buffer, 144);
  Result := StrPas(Buffer);
end;

function Tfrm_modelo_vazio.Converte(cmd: string): string;
var
  A: Integer;
begin
  Result := '';
  for A := 1 to length(cmd) do
  begin
    if not (cmd[A] in ['A'..'Z', 'a'..'z', '0'..'9', ' ', '.', ',', '/', '?', '<', '>', ';', ':', ']', '[', '{', '}', '\', '|', '=', '+', '-', '_', ')', '(', '*', '&', '^', '%', '$', '#', '@', '!', '~', ']']) then
      Result := Result + '#' + IntToStr(ord(cmd[A])) + ' '
    else
      Result := Result + cmd[A] + ' ';
  end;
end;

procedure Tfrm_modelo_vazio.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin

  if Key = vk_escape then
  begin
    if Sender is TForm and ((Sender as TForm).Name <> 'frm_principal') then
      close;
  end;
end;

procedure Tfrm_modelo_vazio.edCodPizzaExecute(Sender: TObject);
var
  moduloVenda, tamanhoPizza: string;
begin
  moduloVenda := copy((Sender as TCustomEdit).Name, 11, 1);
  tamanhoPizza := copy((Sender as TCustomEdit).Name, 12, 3);
  pesquisaProdutoPizza(tamanhoPizza, moduloVenda);
end;

procedure Tfrm_modelo_vazio.imprimirBorderoContasApagar(codConta: string);
begin
  dm_relatorios.qryBorderoContasPagar.Active := false;
  dm_relatorios.qryBorderoContasPagar.SQL.clear;
  dm_relatorios.qryBorderoContasPagar.SQL.add(' select r.codigo as CodigoConta, r.data_entrada,r.data_vencimento,r.descricaoconta, ');
  dm_relatorios.qryBorderoContasPagar.SQL.add('        r.valorconta, r.NUMERO_NOTA_FISCAL, f.razao_social,pf.descricao as descContaFinanceiro ,eg.descricao as descEmpresa ');
  dm_relatorios.qryBorderoContasPagar.SQL.add('        from r_contas_a_pagar   r ');
  dm_relatorios.qryBorderoContasPagar.SQL.add('          inner join fornecedor f  on  (f.cod_fornecedor = r.cod_fornecedor) ');
  dm_relatorios.qryBorderoContasPagar.SQL.add('          inner join plano_contas_financeiro pf on (pf.cod_conta = r.cod_conta) ');
  dm_relatorios.qryBorderoContasPagar.SQL.add('          inner join empresas_grupo eg on (eg.codigo = r.cod_emp_grupo) ');
  dm_relatorios.qryBorderoContasPagar.SQL.add(' where r.codigo=' + Quotedstr(codConta));
  dm_relatorios.qryBorderoContasPagar.Active := true;
  dm_relatorios.qryParcelasContasApagar.Active := true;

  dm_relatorios.rpt.LoadFromFile(patchAplicacao + 'relatorios\borderoContaApagar.fr3', true);
  dm_relatorios.rpt.ShowReport(true);
  dm_relatorios.qryBorderoContasPagar.Active := false;
end;

function Tfrm_modelo_vazio.ValidarChaveNFe(const ChaveNFe: string): boolean;
const
  PESO: array[0..43] of Integer = (4, 3, 2, 9, 8, 7, 6, 5, 4, 3, 2, 9, 8, 7, 6, 5, 4, 3, 2, 9, 8, 7, 6, 5, 4, 3, 2, 9, 8, 7, 6, 5, 4, 3, 2, 9, 8, 7, 6, 5, 4, 3, 2, 0);
var
  Retorno: boolean;
  aChave: array[0..43] of Char;
  Soma: Integer;
  Verif: Integer;
  I: Integer;
begin
  Retorno := false;
  try
    try
      if not Length(ChaveNFe) = 44 then
        raise Exception.Create('');

      StrPCopy(aChave, StringReplace(ChaveNFe, ' ', '', [rfReplaceAll]));
      Soma := 0;
      for I := Low(aChave) to High(aChave) do
        Soma := Soma + (StrToInt(aChave[I]) * PESO[I]);

      if Soma = 0 then
        raise Exception.Create('');

      Soma := Soma - (11 * (Trunc(Soma / 11)));
      if (Soma = 0) or (Soma = 1) then
        Verif := 0
      else
        Verif := 11 - Soma;

      Retorno := Verif = StrToInt(aChave[43]);
    except
      Retorno := false;
    end;
  finally
    Result := Retorno;
  end;
end;

function Tfrm_modelo_vazio.verificaSeUsaCodGarcon(): boolean;
begin
  dm.tb_parametros.Active := true;
  if (dm.tb_parametrosUSA_COD_GARCON.Value = 0) then
    result := false
  else
    result := true;

end;

function Tfrm_modelo_vazio.verificaSeCobraServico(): boolean;
begin
  dm.tb_parametros.Active := true;
  if (dm.tb_parametrosCOBRA_SERVICO.Value = 0) then
    result := false
  else
    result := true;

end;

function Tfrm_modelo_vazio.VerificaConexaoInternet: boolean;
var
  flags: DWORD;
begin

  result := InternetCheckConnection('http://www.google.com.br/', 1, 0);

end;

procedure Tfrm_modelo_vazio.ACTF2edCfopDevolucaoExecute(Sender: TObject);
begin
  pesquisaCFOP(0);
  exibeInformacoesCFOPDevolucao(string_auxiliar);
end;

procedure Tfrm_modelo_vazio.ACTF2edCfopTransferenciaExecute(Sender: TObject);
begin
  pesquisaCFOP(0);
  exibeInformacoesCFOPTransferencia(string_auxiliar);
end;

procedure Tfrm_modelo_vazio.ACTF2edCodAliquotaExecute(Sender: TObject);
begin
  pesquisaAliquota();
end;

procedure Tfrm_modelo_vazio.ACTF2edCodBairroExecute(Sender: TObject);
begin
  pesquisaBairro();
  exibeInformacoesBairro(string_auxiliar);
end;

procedure Tfrm_modelo_vazio.ACTF2edCodBarrasProdutoExecute(Sender: TObject);
begin
  string_aux_cod_barras := '';

  pesquisaProdutosCardapio();
  if Trim(string_aux_cod_barras) <> '' then
  begin
    if verificaExistenciaProduto(string_aux_cod_barras, 2) then
      exibeInformacoesProduto(string_aux_cod_barras, 2);
  end;
end;

procedure Tfrm_modelo_vazio.ACTF2edCodCliDeliveryExecute(Sender: TObject);
begin
  pesquisaClienteDelivery();
end;

procedure Tfrm_modelo_vazio.ACTF2edCodDepartamentoExecute(Sender: TObject);
begin
  pesquisaDepartamento;
end;

procedure Tfrm_modelo_vazio.ACTF2edCodEntregadorExecute(Sender: TObject);
begin
  pesquisaEntregador();
end;

procedure Tfrm_modelo_vazio.ACTF2edCodFormaPagamentoExecute(Sender: TObject);
begin
  pesquisaFormaPagto();
end;

procedure Tfrm_modelo_vazio.ACTF2edCodGeneroItemExecute(Sender: TObject);
begin
  pesquisaGeneroItem();
  exibeInformacoesGeneroItem(string_auxiliar);
end;

procedure Tfrm_modelo_vazio.ACTF2edCodGrupoTouchExecute(Sender: TObject);
begin
  pesquisaGrupoTouch;
end;

procedure Tfrm_modelo_vazio.ACTF2edCodLojaExecute(Sender: TObject);
begin
  pesquisaLojas;
end;

procedure Tfrm_modelo_vazio.ACTF2edCodNCMExecute(Sender: TObject);
begin
  pesquisaNCM;
  exibeInformacoesNCM(string_auxiliar);
end;

procedure Tfrm_modelo_vazio.ACTF2edCodProdutoExecute(Sender: TObject);
begin
  pesquisaProdutosGeral();
end;

procedure Tfrm_modelo_vazio.ACTF2edCodPromoterExecute(Sender: TObject);
begin
  pesquisaPromoter();
end;

procedure Tfrm_modelo_vazio.ACTF2edCodSaborPizzaExecute(Sender: TObject);
begin
  pesquisaSaborPizza();
end;

procedure Tfrm_modelo_vazio.ACTF2edCodSituacaoDocFiscalExecute(Sender: TObject);
begin
  pesquisaSituacaoDocumentoFiscal();
  exibeInformacoesSituacaoDocumentoFiscal(string_auxiliar);
end;

procedure Tfrm_modelo_vazio.ACTF2edCodSubmateriaExecute(Sender: TObject);
begin
  pesquisaSubProduto();
  ExibeInformacoesSubProduto(string_auxiliar);
end;

procedure Tfrm_modelo_vazio.ACTF2edCodTipoBaixaEstoqueExecute(Sender: TObject);
begin
  pesquisaTipoBaixaEstoque();
  exibeInformacoesTipoBaixaEstoque(string_auxiliar);
end;

procedure Tfrm_modelo_vazio.ACTF2edCodTipoItemSpedExecute(Sender: TObject);
begin
  pesquisaTipoItemSPED;
  exibeInformacoesTipoItemSPED(string_auxiliar);
end;

procedure Tfrm_modelo_vazio.ACTF2edCodUnFracaoExecute(Sender: TObject);
begin
  pesquisaUnidadeDeFracao();
end;

procedure Tfrm_modelo_vazio.ACTF2edCodUnPadraoExecute(Sender: TObject);
begin
  pesquisaUnidadePadrao();
end;

procedure Tfrm_modelo_vazio.ACTF2edCstDevolucaoExecute(Sender: TObject);
begin
  pesquisaCST;
  exibeInformacoesCSTDevolucoes(string_auxiliar);
end;

procedure Tfrm_modelo_vazio.ACTF2edCstPisCofinsExecute(Sender: TObject);
begin
  pesquisaCSTPisCofins;
  exibeInformacoesCSTPisCofins(string_auxiliar);
end;

procedure Tfrm_modelo_vazio.ACTF2edCstSaidaExecute(Sender: TObject);
begin
  pesquisaCST;
  exibeInformacoesCST_saida(string_auxiliar);
end;

procedure Tfrm_modelo_vazio.ACTF2edCstTransferenciaExecute(Sender: TObject);
begin
  pesquisaCST;
  exibeInformacoesCSTTransferencias(string_auxiliar);
end;

procedure Tfrm_modelo_vazio.ACTF2edRgClienteExecute(Sender: TObject);
begin
  pesquisaClienteReduzido();
end;

procedure Tfrm_modelo_vazio.ACTF2edTelClienteDeliveryExecute(Sender: TObject);
begin
  case evento of
    1:
      pesquisaClienteDelivery;
  end;
end;

procedure Tfrm_modelo_vazio.ACTF2ed_cefop_entradasExecute(Sender: TObject);
begin
  pesquisaCFOP(1);
  exibeInformacoesCFOPEntrada(string_auxiliar);
end;

procedure Tfrm_modelo_vazio.ACTF2ed_cefop_saidasExecute(Sender: TObject);
begin
  pesquisaCFOP(2);
  exibeInformacoesCFOPSaida(string_auxiliar);
end;

procedure Tfrm_modelo_vazio.ACTF2ed_cfopExecute(Sender: TObject);
begin
  pesquisaCFOP(0);
  exibeInformacoesCFOP(string_auxiliar);
end;

procedure Tfrm_modelo_vazio.ACTF2ed_cod_barras_itemExecute(Sender: TObject);
begin
  pesquisaItemEstoque();
  exibeInformacoesItemEstoque(string_auxiliar2, 2);
end;

procedure Tfrm_modelo_vazio.ACTF2ed_cod_centro_custoExecute(Sender: TObject);
begin
  pesquisaCentroDeCusto();
end;

procedure Tfrm_modelo_vazio.ACTF2ed_cod_cidadeExecute(Sender: TObject);
begin
  pesquisaCidade();
end;

procedure Tfrm_modelo_vazio.ACTF2ed_cod_clienteExecute(Sender: TObject);
begin
  pesquisaCliente();
  exibeInformacoesClienteFaturamento(string_auxiliar);
end;

procedure Tfrm_modelo_vazio.ACTF2ed_cod_cliente_reduzidoExecute(Sender: TObject);
begin
  pesquisaClienteReduzido();
end;

procedure Tfrm_modelo_vazio.ACTF2ed_cod_estadoExecute(Sender: TObject);
begin
  pesquisaEstado;
end;

procedure Tfrm_modelo_vazio.ACTF2ed_cod_fornecedorExecute(Sender: TObject);
begin
  pesquisaFornecedor();
  exibeInformacoesFornecedor(string_auxiliar);
end;

procedure Tfrm_modelo_vazio.ACTF2ed_cod_garconExecute(Sender: TObject);
begin
  pesquisaGarcon();
end;

procedure Tfrm_modelo_vazio.ACTF2ed_cod_grupoExecute(Sender: TObject);
begin
  pesquisaGrupo();
end;

procedure Tfrm_modelo_vazio.ACTF2ed_cod_grupo_fornecedorExecute(Sender: TObject);
begin
  pesquisaGrupoFornecedor();
end;

procedure Tfrm_modelo_vazio.ACTF2ed_cod_historicoExecute(Sender: TObject);
begin
  pesquisaHistorico();
end;

procedure Tfrm_modelo_vazio.ACTF2ed_cod_itemExecute(Sender: TObject);
begin
  pesquisaItemEstoque();
  exibeInformacoesItemEstoque(string_auxiliar, 1);
end;

procedure Tfrm_modelo_vazio.ACTF2ed_cod_item_saidaExecute(Sender: TObject);
begin
  pesquisaProdutosGeral();
  exibeInformacoesItemSaida(string_auxiliar, 1);
end;

procedure Tfrm_modelo_vazio.ACTF2ed_cod_metreExecute(Sender: TObject);
begin
  pesquisaMetre();
end;

procedure Tfrm_modelo_vazio.ACTF2ed_cod_mini_printerExecute(Sender: TObject);
begin
  pesquisaMiniPrinter();
end;

procedure Tfrm_modelo_vazio.ACTF2ed_cod_modelo_nota_fiscalExecute(Sender: TObject);
begin
  pesquisaModeloNotaFiscal();
  exibeInformacoesModeloNotaFiscal(string_auxiliar);
end;

procedure Tfrm_modelo_vazio.ACTF2ed_cod_tipo_clienteExecute(Sender: TObject);
begin
  pesquisaTipoDeCliente();
end;

procedure Tfrm_modelo_vazio.ACTF2ed_cod_tipo_documentoExecute(Sender: TObject);
begin
  pesquisaTiposDocumento();
  exibeInformacoesTiposDocumento(string_auxiliar);
end;

procedure Tfrm_modelo_vazio.ACTF2ed_cod_tipo_entradaExecute(Sender: TObject);
begin
  pesquisaTiposEntrada();
  exibeInformacoesTiposEntrada(string_auxiliar);
end;

procedure Tfrm_modelo_vazio.ACTF2ed_cod_un_entradaExecute(Sender: TObject);
begin
  pesquisaUnidadeEntrada();
end;

procedure Tfrm_modelo_vazio.ACTF2ed_cod_un_saidaExecute(Sender: TObject);
begin
  pesquisaUnidadeSaida();
end;

procedure Tfrm_modelo_vazio.ACTF2ed_cod_usuarioExecute(Sender: TObject);
begin
  pesquisaUsuarios();
  exibeInformacoesUsuario(string_auxiliar);
end;

procedure Tfrm_modelo_vazio.ACTF2ed_cstExecute(Sender: TObject);
begin
  pesquisaCST;
  exibeInformacoesCST(string_auxiliar);
end;

procedure Tfrm_modelo_vazio.AtualizaLabelsTabelaPreco();
var
  lb: TLabel;
begin
  lb := TLabel(FindComponent('lbDescTabelaPreco'));
  lb.Caption := dm.getTabelaPrecoAtual.descricao;
end;

function Tfrm_modelo_vazio.KeyIsDown(const Key: integer): boolean;
begin
  Result := GetKeyState(Key) and 128 > 0;
end;

function Tfrm_modelo_vazio.verificaValidadeDatas(ADataInicial: TDate; ADataFinal: TDate): boolean;
begin

  if (ADataInicial > ADataFinal) then
  begin
    showmessage('Período inválido!!  Data inicial não pode ser maior que a data final !');
    result := false;
    exit;
  end;
  result := true;

end;

procedure Tfrm_modelo_vazio.configuraOpcoesData(ARDEscolhido: TRadioButton; AEdDataInicial, AEdDataFinal: TAdvDateTimePicker; AComboMes, AComboAno: TCombobox);
var
  LNomeRadioSelecionado: string;
  LAnoAtual, LMesAtual: string;
begin
  LAnoAtual := FormatDateTime('YYY', Now);
  LMesAtual := FormatDateTime('MM', Now);

  LNomeRadioSelecionado := (ARDEscolhido as TRadioButton).Name;
  case AnsiIndexStr((LNomeRadioSelecionado), ['rdMesAtual', 'rdMesAnterior', 'rdMesSelecionado', 'rdAnoAtual', 'rdEscolherPeriodo']) of
    0:
      begin
        AEdDataInicial.Date := StartOfTheMonth(now);
        AEdDataFinal.Date := EndOfTheMonth(now);
        if Assigned(findComponent('pgNaoExibir')) then
          (FindComponent('pgNaoExibir') as TJvStandardPage).Show;
      end;
    1:
      begin
        AEdDataInicial.Date := StartOfTheMonth(IncMonth(Now, -1));
        AEdDataFinal.Date := EndOfTheMonth(IncMonth(Now, -1));
        if Assigned(findComponent('pgNaoExibir')) then
          (FindComponent('pgNaoExibir') as TJvStandardPage).Show;
      end;
    2:
      begin
        AComboMes.ItemIndex := MonthOf(Now) - 1;
        AComboAno.ItemIndex := 10;
        configuraDataSelecaoPorMes(AComboMes, AComboAno, AEdDataInicial, AEdDataFinal);
        if Assigned(findComponent('pgSelecaoMes')) then
          (FindComponent('pgSelecaoMes') as TJvStandardPage).Show;
      end;
    3:
      begin
        AEdDataInicial.Date := StartOfTheYear(Now);
        AEdDataFinal.Date := EndOfTheYear(now);
        if Assigned(findComponent('pgNaoExibir')) then
          (FindComponent('pgNaoExibir') as TJvStandardPage).Show;

      end;
    4:
      begin
        AEdDataInicial.Date := StartOfTheMonth(now);
        AEdDataFinal.Date := EndOfTheMonth(now);
        if Assigned(findComponent('pgSelecaoPeriodo')) then
          (FindComponent('pgSelecaoPeriodo') as TJvStandardPage).Show;
      end;

  end;
end;

procedure Tfrm_modelo_vazio.configuraDataSelecaoPorMes(AComboMes, AComboAno: TComboBox; AEdDataInicial, AEdDataFinal: TAdvDateTimePicker);
var
  LAno, LMes: string;
begin
  LAno := AComboAno.Items[AComboAno.ItemIndex];
  LMes := FormatFloat('00', AComboMes.ItemIndex + 1);

  AEdDataInicial.Date := StartOfTheMonth(StrToDate('01/' + LMes + '/' + LAno));
  AEdDataFinal.Date := EndOfTheMonth(StrToDate('01/' + LMes + '/' + LAno));
end;

procedure Tfrm_modelo_vazio.FindGridViews(Grid: TcxGrid; ViewList: TList);
begin

end;

function Tfrm_modelo_vazio.FindMenuItem(Items: TMenuItem; Caption: string): TMenuItem;
var
  i: Integer;
begin
  Result := nil;
  for i := 0 to Items.Count - 1 do
  begin
    if CompareText(Items[i].Caption, Caption) = 0 then
    begin
      Result := Items[i];
      Break;
    end;
  end;
end;

function Tfrm_modelo_vazio.FindParentGrid(GridView: TcxGridDBTableView): TcxGrid;
begin

end;

procedure Tfrm_modelo_vazio.GridOnEnter(Sender: TObject);
begin
  cxGridTrabalho := (Sender as TCXGrid);
//  if Assigned(FOnEnterAnonymous) then
  //  FOnEnterAnonymous(Sender);
end;

procedure Tfrm_modelo_vazio.AddExportMenuToGrids(AForm: TForm);
var
  i: Integer;
  Component: TComponent;
  Grid: TcxGrid;
  PopupMenu: TPopupMenu;
  ExportMenuItem, SubItem: TMenuItem;
begin
  // Percorre todos os componentes do formulário
  for i := 0 to AForm.ComponentCount - 1 do
  begin
    Component := AForm.Components[i];

    // Verifica se o componente é um TcxGrid
    if Component is TcxGrid then
    begin
      Grid := TcxGrid(Component);
      Grid.OnEnter := GridOnEnter;

      // Se o grid não tem popup menu, cria um
      if not Assigned(Grid.PopupMenu) then
      begin
        PopupMenu := TPopupMenu.Create(AForm);
        Grid.PopupMenu := PopupMenu;
      end
      else
        PopupMenu := TPopupMenu(Grid.PopupMenu);

      // Verifica se o menu de exportação já existe
      if not Assigned(FindMenuItem(PopupMenu.Items, 'Exportar dados')) then
      begin
        // Cria o item principal "Exportar dados"
        cxGridTrabalho := Grid;
        ExportMenuItem := TMenuItem.Create(PopupMenu);
        ExportMenuItem.Caption := '-';
        PopupMenu.Items.Add(ExportMenuItem);

        ExportMenuItem := TMenuItem.Create(PopupMenu);
        ExportMenuItem.Caption := 'Exportar dados';
        PopupMenu.Items.Add(ExportMenuItem);

        // Cria subitem Excel
        SubItem := TMenuItem.Create(PopupMenu);
        SubItem.Caption := 'Excel';
        SubItem.OnClick := tmExportarExcelClick;
        SubItem.Tag := Integer(Grid); // Armazena referência ao Grid
        ExportMenuItem.Add(SubItem);

        // Cria subitem HTML
        SubItem := TMenuItem.Create(PopupMenu);
        SubItem.Caption := 'HTML';
        SubItem.OnClick := tmExportarHTMLClick;
        SubItem.Tag := Integer(Grid);
        ExportMenuItem.Add(SubItem);

        // Cria subitem CSV
        SubItem := TMenuItem.Create(PopupMenu);
        SubItem.Caption := 'CSV';
        SubItem.OnClick := tmExportarCSVClick;
        SubItem.Tag := Integer(Grid);
        ExportMenuItem.Add(SubItem);

        // Cria subitem XML
        SubItem := TMenuItem.Create(PopupMenu);
        SubItem.Caption := 'XML';
        SubItem.OnClick := tmExportarXMLClick;
        SubItem.Tag := Integer(Grid);
        ExportMenuItem.Add(SubItem);

        // Cria subitem XML
        SubItem := TMenuItem.Create(PopupMenu);
        SubItem.Caption := 'TXT';
        SubItem.OnClick := tmExportarTXTClick;
        SubItem.Tag := Integer(Grid);
        ExportMenuItem.Add(SubItem);

      end;
    end;
  end;
end;

procedure Tfrm_modelo_vazio.tmExportarCSVClick(Sender: TObject);
begin
  dm.ExportarCXGrid(cxGridTrabalho, TExpCSV);
end;

procedure Tfrm_modelo_vazio.tmExportarHTMLClick(Sender: TObject);
begin
  dm.ExportarCXGrid(cxGridTrabalho, TExpHTML);
end;

procedure Tfrm_modelo_vazio.tmExportarExcelClick(Sender: TObject);
begin
  dm.ExportarCXGrid(cxGridTrabalho, TExpXLSX);
end;

procedure Tfrm_modelo_vazio.tmExportarXMLClick(Sender: TObject);
begin
  dm.ExportarCXGrid(cxGridTrabalho, TExpXML);
end;

procedure Tfrm_modelo_vazio.tmExportarTXTClick(Sender: TObject);
begin
  dm.ExportarCXGrid(cxGridTrabalho, TExpTXT);
end;

function Tfrm_modelo_vazio.ClonarItemMenu(const Src: TMenuItem; const DestOwner: TComponent): TMenuItem;
var
  I: Integer;
  Child: TMenuItem;
begin
  Result := TMenuItem.Create(DestOwner);

  // Se o item de origem usa Action, basta reapontar a mesma Action
  Result.Action := Src.Action;

  // Se não houver Action, copie manualmente as propriedades relevantes
  if Result.Action = nil then
  begin
    Result.Caption := Src.Caption;
    Result.ShortCut := Src.ShortCut;
    Result.ImageIndex := Src.ImageIndex;
    Result.Checked := Src.Checked;
    Result.RadioItem := Src.RadioItem;
    Result.Enabled := Src.Enabled;
    Result.Visible := Src.Visible;
    Result.Hint := Src.Hint;
    Result.Tag := Src.Tag;
    Result.Break := Src.Break;
    Result.Default := Src.Default;
    Result.AutoHotkeys := Src.AutoHotkeys;
    Result.AutoLineReduction := Src.AutoLineReduction;
    Result.OnClick := Src.OnClick; // mantém event handler
  end;

  // Clona os subitens recursivamente
  for I := 0 to Src.Count - 1 do
  begin
    Child := ClonarItemMenu(Src.Items[I], DestOwner);
    Result.Add(Child);
  end;
end;

procedure Tfrm_modelo_vazio.CopiarPopupMenuItens(const Source, Dest: TPopupMenu);
begin
  // Versão "atalho": limpa destino por padrão
  CopiarPopupMenuItens(Source, Dest, True);
end;

procedure Tfrm_modelo_vazio.CopiarPopupMenuItens(const Source, Dest: TPopupMenu; ClearDest: Boolean);
var
  I: Integer;
  Novo: TMenuItem;
begin
  if (Source = nil) or (Dest = nil) then
    Exit;

  if ClearDest then
    Dest.Items.Clear;

  // Opcional: compartilhar a mesma ImageList do Source
  if Source.Images <> nil then
    Dest.Images := Source.Images;

  // Clona os itens de primeiro nível
  for I := 0 to Source.Items.Count - 1 do
  begin
    Novo := ClonarItemMenu(Source.Items[I], Dest); // Owner = menu de destino
    Dest.Items.Add(Novo);
  end;
end;

end.

