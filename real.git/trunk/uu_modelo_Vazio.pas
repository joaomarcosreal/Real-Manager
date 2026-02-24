

unit uu_modelo_vazio;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,dateutils,
  Dialogs, StdCtrls, ExtCtrls,mask,dbctrls, Buttons, DB, IBCustomDataSet,
  IBQuery, DBGrids, wininet,CurvyControls, ACBrUtil,RxCurrEdit,
  System.Actions,StrUtils , Vcl.ActnList, IBX.IBScript, Vcl.DialogMessage,
  cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxContainer,
  cxEdit, cxTextEdit, cxMaskEdit, cxDropDownEdit, cxLookupEdit, cxDBLookupEdit,
  cxDBLookupComboBox;

type
  Tfrm_modelo_vazio = class(TForm)
    Edit1: TEdit;
    botao_pesquisa: TSpeedButton;
    cliques: TActionList;
    actPesquisaFormaPagamento: TControlAction;
    actExitFormaPagamento: TAction;
    procedure Edit1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
      procedure exibe_painel_erro(mensagem : string; captionBotao: string);
    procedure botao_pesquisaClick(Sender: TObject);
    procedure Edit1Exit(Sender: TObject);
    procedure Edit1Enter(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    function dialogConfirmacao(titulo : string ; mensagem : string; fonte : integer) : boolean;
    function ValidarChaveNFe(const ChaveNFe: string):boolean;

    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);

    function iniciarOperacaoComTEF() : boolean;
    function VerificaConexaoInternet: boolean;
    procedure clickControlCurvyExecute(Sender: TObject);
    procedure pesquisaFormaPagamento(Sender: TObject);
    procedure actExitFormaPagamentoExecute(Sender: TObject);
    function validaValorPagamento(Sender: TObject): boolean;
    function validaQuantidade(Sender: TObject): boolean;
    procedure bloqueiaMesa(mesa: string);
    function KeyIsDown(const Key: integer): boolean;
    function verificaSeProdutoPodeSerVendido(codProduto: string;
      tipo: smallint): boolean;


  strict protected
      evento : integer;

  private




    { Private declarations }





  public
    { Public declarations }

    procedure exibeInformacoes(componenteChavePesquisa : string; componenteRecebeRetorno : string;  tabela : string;
          campos : string;cp_pesq: string; param_pesq: string; cp_ret : integer);


    // Procedimentos de chamadas para pesquisa
   procedure setTipoNotaFiscalSaida( tipo : smallint);
    procedure setCaption (caption : string);
    procedure pesquisaGrupo();
    procedure pesquisaGrupoRD;
    procedure pesquisaFornecedor;
    procedure pesquisaGrupoFornecedor;
    procedure pesquisaHistorico;
    procedure pesquisaCidade;
    procedure pesquisaEstado();
    procedure pesquisaCentroDeCusto;
    procedure pesquisaItemEstoque;
    procedure pesquisaSubMateria();    
    procedure pesquisaUnidadeEntrada;
    procedure pesquisaUnidadeSaida;
    procedure pesquisaSaborPizza;    
    procedure pesquisaUnidadeDeFracao;
    procedure pesquisaUnidadePadrao;
    procedure pesquisaGarcon();
    procedure pesquisaPromoter;
    procedure pesquisaDepartamento();
    procedure pesquisaGuarnicao();        
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
    function  verificaExistenciaClienteDeliveryPorTelefone(telefone : string) : boolean;
    procedure pesquisaMiniPrinter();
    procedure pesquisaTiposDocumento();
    procedure pesquisaBairro();

    procedure pesquisaTiposEntrada();
    procedure pesquisaCFOP(tipo : integer);
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
    procedure pesquisaProdutoPizza(tamanhoPizza : string ;moduloVenda : string);        
    procedure pesquisaReg60M();
    procedure pesquisaAliquota();    


    // Funções de verificação de existência
    function verificaDatas(data_inicial : string; data_final : string) : boolean;
    function  verificaSeNumeroInteiro(numero : double) : boolean;
    function  verificaExistenciaProdutoCodigosEntrada(cod_fornecedor : string; cod_produto : string) : Boolean;
    function  verificaExistenciaGrupo(cod_grupo : string) : boolean;
    function  verificaExistenciaGrupoRD(codGrupoRD : string) : boolean;
    function  verificaExistenciaBairro(codBairro : string) : boolean;
    function  verificaExistenciaMiniPrinter(cod_miniPrinter : string) : boolean;
    function  verificaExistenciaPedidoDelivery(codPedido : string) : boolean;
    function  verificaStatusPedidoDelivery(codPedido : string) : smallint;
    function  verificaExistenciaCidade(cod_cidade : string) : boolean;
    function  verificaExistenciaEstado(cod_estado : string) : boolean;
    function  verificaExistenciaFornecedor(cod_fornecedor : string) : boolean;
    function  verificaExistenciaFornecedorCNPJ(cnpjFornecedor : string) : boolean;    
    function  verificaSeCaixaEstaAberto(codCaixa : string) : boolean;
    function  verificaSeCaixaCobraServico(codCaixa : string) : boolean;
    function  verificaExistenciaHistorico(cod_historico : string) : boolean;
    function  verificaExistenciaCentroDeCusto(cod_c_custo : string) : boolean;
    function  verificaExistenciaGrupoFonecedor(cod_grupo_fornecedor : string) : boolean;
    function  verificaExistenciaSaborPizza(codSabor : string) : boolean;
    function  verificaExistenciaItemEstoque(cod_item : string; campo: integer) : boolean;
    function  verificaExistenciaSubmateria(cod_item : string; campo: integer) : boolean;

    function  verificaExistenciaTipoBaixaEstoque(codTipo : string) : boolean;
    function  verificaExistenciaContaApagar(codConta : string) : boolean;
    function  getStatusContaApagar(codConta : string) : smallint;
    function  getAliasEmpresaGrupo(codEmpresa: string) : string;

    function  verificaExistenciaClienteDelivery(codCli : string) : boolean;
    function  verificaEquivalenciaUnidades(cod_un1: string; cod_un2 : string) : boolean;
    function  verificaExistenciaUnidade(cod_unidade : string) : boolean;
    function  verificaExistenciaGarconMetre(cod_garcon : string) : boolean;
    function  verificaExistenciaGrupoTouch(codGrupo : string) : boolean;    
    function  verificaExistenciaPromoter(codPromoter : string) : boolean;
    function  verificaExistenciaDepartamento(codDepartamento : string) : boolean;
    function  verificaExistenciaGuarnicao(codGuarnicao : string) : boolean;    
    function  verificaExistenciaEntregador(codEntregador : string) : boolean;
    function  verificaExistenciaMetre(cod_garcon : string) : boolean;
    function  verificaExistenciaTipoSangria(codTipo : string) : boolean;
    function  verificaExistenciaMotivoEstorno(codMotivo : string) : boolean;
    function  verificaExistenciaObservacaoPreparo(codObs: string) : boolean;
    function  verificaExistenciaTipoDeBaixa(codTipo: string) : boolean;
    function  verificaExistenciaFormaPagto(cod_forma : string) : boolean;
    function  getDescricaoFormaPagamento(codForma : string) : string;
    function  getCodigoRegistradorFormaPagamento(cod_forma : string) :  string;
    function  verificaExistenciaLoja(codLoja : string) : boolean;
    function  verificaExistenciaTipoDeCliente(cod_tipo_cliente : string) : boolean;
    function  verificaExistenciaCliente(cod_cliente : string) : boolean;
    function  verificaExistenciaClienteRG(rg : string) : boolean;    
    function  verificaExistenciaTipoDocumento(cod_tipo_documento : string) : boolean;
    function  verificaExistenciaTipoEntrada(cod_tipo_entrada : string) : boolean;
    function  verificaExistenciaCFOP(CFOP : string ) : boolean;
    function  verificaExistenciaTipoItemSPED(codigo : string ) : boolean;
    function  verificaExistenciaNCM(codigo : string ) : boolean;
    function  verificaExistenciaGeneroItem(codigo : string ) : boolean;        
    function  verificaExistenciaModeloNotaFiscal(codModelo : string ) : boolean;
    function  verificaExistenciaSituacaoDocumentoFiscal(codSituacao : string ) : boolean;

    function  verificaExistenciaCST(CST : string ) : boolean;
    function  verificaExistenciaCSTPISCofins(CST : string ) : boolean;    
    function  verificaExistenciaEntrada(cod_entrada : string) : boolean;
    function  verificaExistenciaSaida(cod_saida : string) : boolean;
    function  verificaExistenciaReceita(codReceita : string) : boolean;
    function  verificaExistenciaUsuario(cod_usuario : string) : boolean;
    function  verificaExistenciaProduto(codProduto : string ; tipo : smallint) : boolean;
    function  verificaSeProdutoVendeFracionado(codProduto : string ; tipo : smallint) : boolean;
    function  verificaSeProdutoCalculaQtde(codProduto : string ; tipo : smallint) : boolean;
    function  verificaSeProdutoLeQuantidadeDaBalanca(codigo : string; tipoCodigo : smallint) : boolean;
    function  getBalancaLeitura(codigo : string; tipoCodigo : smallint) : smallint;
    function  verificaSeProdutoEhPizza(codigo : string; tipoCodigo : smallint) : boolean;
    function verificaSeProdutoRequerObservacao(codigo : string; tipoCodigo : smallint) : boolean;

    function  verificaProdutoDigitaPreco(codBarrasProduto : string) : boolean;
    function  verificaExistenciaReg60A(codReg : string) : boolean;
    function  verificaExistenciaReg60M(codReg : string) : boolean;
    function  verificaExistenciaAliquota(codAliquota : string) : boolean;
    function  verificaExistenciaFormaDePagamento(codForma : string) : boolean;
    function  verificaExistenciaCartao(cartao: string) : boolean;
    function  verificaSeCartaoCobraServico(cartao: string) : boolean;    


    // Funções de outras verificações
    function  verificaExistenciaRecebimentosParciais(mesa : string) : boolean;
    function  verificaExistenciaFatura(cod_fatura : string) : boolean;
    function  verificaClienteAtivo(cod_cliente : string) : boolean;
    function  verificaFormaPagamentoFaturada(cod_forma  : string) : boolean;
    function  verificaFormaPagamentoSolicitaDados(cod_forma : string) : boolean;
    function  verificaClienteTemCredito(cod_cliente : string; valor_pleiteado : double) : boolean;
    function  verificaCentroDeCustoAnalitico(cod_c_custo : string) : boolean;
    function  verificaProdutoRequerObservacao(cod_produto: string) : boolean;
    function  verificaProdutoRequerInformacaoSabor(cod_produto: string) : boolean;
    function  verificaFaturaBaixada(cod_fatura : string) : boolean;
    function  verificaMesaTemExtrato(mesa : string) : boolean;
    function  getEstadoCartao(cartao : string) : integer;
    function  verificaStatusCartao(cartao : string) : boolean;
    function  verificaStatusCartaoParaLiberacao(cartao : string) : boolean;
    function  verificaStatusCartaoNoCheckin(cartao : string) : boolean;
    function  verificaSeCartaoEstaSendoUtilizado(cartao : string) : boolean;    
    function  verificaSeClienteEstaNaCasa(codCliente : string) : boolean;
    function  verificaSeExisteCouvertNaConta(mesa  : string) : boolean;
    function  verificaNotaFiscalJaFoiLancada(codFornecedor : string; numeroNota : string; modeloNota : string) : boolean;
    function  verificaNotaFiscalSaidaJaFoiLancada(numeroNota : string ; modelo : string) : boolean;    
    function  verificaNotaFiscalConsumidorJaFoiLancada(numeroNota : string) : boolean;
    function  verificaExistenciaNotaTransportadora(codigoEntrada : string) : boolean;            
     function verificaSeUsaCodGarcon() : Boolean;
     function verificaSeCobraServico() : boolean;

    //Getters
    function  getCNPJFornecedor(cod_fornecedor : string) : string;
    function  getCodFornecedorViaCNPJ(cnpj : string) : string;

    function  getCodOperadorCaixa(codCaixa : string) : string;
    function  getHoraAberturaCaixa(codCaixa : string) : TTime;
    function  getHoraFechamentoCaixa(codCaixa : string) : Ttime;
    function  getNomeOperadorCaixa(codCaixa : string) : string;
    function  getDataSistemaCaixa(codCaixa : string) : Tdate;
    function  getTotalSuprimentosCaixa(codCaixa : string) : double;
    function  getTotalSangriasCaixa(codCaixa : string) : Double;
    function  getTotalPendurasRecebidasCaixa(codCaixa : string) : Double;    
    function  getTotalTaxaServicoCaixa(codCaixa : string) : Double;
    function  getValorProdutosMesa(mesa : string) : double;
    function  getQtdePessoasMesa(mesa : string) : integer;
    procedure AtualizaQtdePessoasMesa(mesa : string ; qtdePessoas : string);


    function getValorPizza(codigo : string ; tipoCodigo : integer; tipoVenda : integer) : double;



    function  getPrazoCliente(cod_cliente : string) :  integer;
    function  getNomeCliente(codCliente : string) :  string;
    function  getEnderecoCliente(codCliente : string) :  string;    
    function  getTelefoneCliente(codCliente : string) :  string;
    function  getNomeClienteUsandoCartao(cartao : string) : string;    
    function  getCodClienteUsandoCartao(cartao : string) : string;
    function  getParametroUnidade(cod_unidade : string) : double;
    function  getUnidadeEntradaItem (cod_item : string) : string;
    function  getPermissaoDeTroco(codForma : string) : boolean;
    function  getTipoTEFFormaPagato(codForma : string) : smallint;

//    function  efetuaPagamentoTEFCappta(tipoOperacao : smallint; valorDaOperacao : double ) : boolean;
//    function   iterarOperacaoTEFCappta() : boolean;
 //   procedure exibeMensagemTef( mensagem : string ; tipoMensagem : smallint);
//    procedure requisicaoParametrosCappta(requisicaoParametros: IRequisicaoParametro);
//    procedure  ConfirmaOperacaoTEFCappta();

    function  getCodProduto(codBarrasProduto : string) : string;
    function  getDescricaoProduto(codProduto : string ; tipo : smallint) :string;
    function  getUnidadeMedidaECF(codProduto : string ; tipo : smallint) : string;
    function  getCodNovoProduto() : string;
    function  getDescricaoReduzidaProduto(codBarrasProduto : string) : string;
    function  getCodMiniPrinterProduto(codBarrasProduto : string) : string;
    function  getValorProduto(codProduto : string ; tipo : smallint) : double;
    function  getNomeGarcon(cod_garcon : string) : string;
    function  getTipoCFOP(CFOP : string ) : integer;


    // Validações PAF-ECF
    function  getNumeroECFEmUso(numero_serie : string) : string;
    procedure SelecionaECFEmUso(numero_serie : string);
    function  verificaExistenciaArquivoAuxiliarPAF(caminhoArquivoAuxiliar : string) : boolean;
    function validacaoArquivoAuxiliarPaf(caminhoArquivoAuxiliar : string) : boolean;

    Function  getPastaSistemaWindows : String;
    function  Converte(cmd: String): String;

    function  getValorTxEntregaBairro(codBairro : string) : double;
    function  getValorTxEntregaPedido(codPedido : string) : double;
    function  getEstoqueAtualItemEstoque(cod_item : string) : double;
    function  getCodUnidadeEntradaItemEstoque(cod_item : string) : string;
    function  getCodEntradaNotaFiscal(codFornecedor : string; numeroNota : string) : string;
    function  getCodEntradaNotaFiscalSaida(numeroNota : string) : string;    
    function  getcodClienteDeliveryPorTelefone(telefone : string) : string;

    // Procedimentos de exibição de informações de consulta
    function verificaSeItemEhSubmateria(cod_item_estoque : string) : boolean;


    procedure exibeInformacoesItemEstoque(cod_item_estoque : string; campo : integer);
    procedure exibeInformacoesItemSaida(cod_item_estoque : string; campo : integer);
    procedure exibeInformacoesSubMateria(cod_item_estoque : string; campo : integer);
    procedure exibeInformacoesTipoBaixaEstoque(codTipo : string);

    procedure exibeInformacoesUnidadeEntrada(cod_unidade_entrada : string);
    procedure exibeInformacoesUnidadeSaida(cod_unidade_saida : string);
    procedure exibeInformacoesSaborPizza(codSabor : string);

    procedure exibeInformacoesUnidadeDeFracao(codUnFracao : string);
    procedure exibeInformacoesFornecedor(cod_fornecedor : string);
    procedure exibeInformacoesFornecedorCNPJ(CNPJfornecedor : string);
    procedure exibeInformacoesBairro(codBairro : string);
    procedure exibeInformacoesTiposDocumento(cod_tipo_doc : string);
    procedure exibeInformacoesTiposEntrada(cod_tipo_entrada : string);
    procedure exibeInformacoesCFOP(CFOP : string);
    procedure exibeInformacoesTipoItemSPED(codigo : string);
    procedure exibeInformacoesNCM(codigo : string);
    procedure exibeInformacoesGeneroItem(codigo : string);
    procedure exibeInformacoesCFOPEntrada(CFOP : string);
    procedure exibeInformacoesCFOPSaida(CFOP : string);
    procedure exibeInformacoesCFOPDevolucao(CFOP : string);
    procedure exibeInformacoesCFOPTransferencia(CFOP : string);



    procedure exibeInformacoesModeloNotaFiscal(codModeloNota : string);
    procedure exibeInformacoesSituacaoDocumentoFiscal(codSituacao : string);    
    procedure exibeInformacoesCST(CST : string);
    procedure exibeInformacoesCSTPisCofins(CST : string);
    procedure exibeInformacoesCST_saida(CST : string);
    procedure exibeInformacoesCSTDevolucoes(CST : string);
    procedure exibeInformacoesCSTTransferencias(CST : string);


    procedure exibeInformacoesUsuario(cod_usuario : string);
    procedure exibeInformacoesProduto(codProduto : string; tipo: integer);
    procedure exibeInformacoesProdutoPizza(codProdutoPizza : string; tamanhoPizza : string; moduloVenda : string);
    procedure exibeInformacoesAliquota(codAliquota : string);
    procedure exibeInformacoesFormaDePagamento(codForma : string);
    procedure exibeInformacoesLoja(codLoja: string);
    procedure exibeInformacoesClienteFaturamento(codCli : string );
    procedure exibeInformacoesClienteDelivery(codCli : string);
    procedure exibeInformacoesClienteBoateRG(rgCliente : string);
    procedure exibeInformacoesGarcons(codGarcon : string);
    procedure exibeInformacoesPromoter(codPromoter : string);
    procedure exibeInformacoesDepartamento(codDepartamento : string);
    procedure exibeInformacoesGuarnicao(codGuarnicao : string);
    procedure exibeInformacoesGrupoTouch(codGrupoTouch : string);
    procedure exibeInformacoesEntregador(codEntregador : string);
    procedure exibeInformacoesGrupos(codGrupo: string);
    procedure exibeInformacoesGruposRD(codGrupoRD: string);    
    procedure exibeInformacoesCentroCusto(codConta: string);
    procedure exibeInformacoesEstado(cod_estado : string);
    function getUFEstado(cod_estado : string) : string;
   function   getCodEstadoUF(UF : string) : string;



    procedure imprimirBorderoContasApagar(codConta : string);


    procedure copiaValoresComponentes();
    procedure retornaValoresComponentes();
  end;

 var
  frm_modelo_vazio : Tfrm_modelo_vazio;
  tipoNotaFiscalSaida : SmallInt;




implementation

uses uu_cs_historicos, uu_cs_grupos_fornecedores, uu_frm_principal,
  uu_cs_cidades, uu_data_module, uu_cs_fornecedores,
  uu_cs_item_estoque, uu_cs_unidades, uu_cs_garcons,
  uu_cs_formas_pagto, uu_cs_tipos_cliente, uu_cs_clientes,
  uu_cs_mini_printer, uu_cs_tipos_documentos, uu_cs_tipos_entrada,
  uu_cs_usuarios, uu_cs_entradas, uu_cs_produtos,
  uu_cs_reg60A, uu_cs_aliquotas, uu_cs_clientes_reduzido,
  uuPesquisaClientesDelivery, uSelecionaGrupo, uuCsTiposSangria,
  uuCsMotivosEstorno, uuCsObservacoesPreparo, uuCsTiposBaixaEstoque,
  uu_cs_estados, uuCsCFOP, uuCsModeloNotaFiscal, uuCsCST, uuCsBairros,
  uuCsEntregradores, uucsSubmaterias, uucsSaboresPizza, uuPesqTipoItemSped,
  uuCsNCM, uuCsGeneroItemSPED, uuCsProdutosGeral, uuCsPlanoContas,
  uuCsNotasSaida, uuCsCSTPISCofins, uuManutencaoContasApagar, uuCsLojas,
  uu_confirma_extrato, UU_DM_RELATORIOS,
  uuCsDepartamentos, uuCsPromoters, uuCsGuarnicoes, uuCsSituacaoDocumento,
  uuCsGruposTouch, uu_manutencao_grupos, uuConsultaGruposRD, uuMensagemTEF,
  IBX.IBDatabase;

{$R *.dfm}

procedure Tfrm_modelo_vazio.Edit1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
 i : integer;
 nomeEdit : string;
 tamanhoPizza : string;
 moduloVenda : string;

begin


 if Key = VK_RETURN then
  begin
    if   ((sender is TMemo)) then
      begin
       if (trim( (sender as TMemo).Lines[0]+(sender as TMemo).Lines[1] + (sender as TMemo).Lines[2] + (sender as TMemo).Lines[3]) ='') then
        begin
          Perform(WM_NEXTDLGCTL,0,0)
        end
      end
    else
       begin
         Perform(WM_NEXTDLGCTL,0,0)
       end


  end;



 if key = vk_escape then Close;




 if key = vk_f2 then
 begin
    if  sender is TCustomEdit and ((sender as TCustomEdit).Name='ed_cod_grupo_fornecedor') then
    begin
      pesquisaGrupoFornecedor();
    end;

    if  sender is TCustomEdit and ((sender as TCustomEdit).Name='ed_cod_fornecedor') then
    begin
      pesquisaFornecedor();
      exibeInformacoesFornecedor(string_auxiliar);
    end;

    if  sender is TCustomEdit and ((sender as TCustomEdit).Name='edCodBairro') then
    begin
      pesquisaBairro();
      exibeInformacoesBairro(string_auxiliar);
    end;



    if  sender is TCustomEdit and ((sender as TCustomEdit).Name='ed_cod_tipo_documento') then
    begin
      pesquisaTiposDocumento();
      exibeInformacoesTiposDocumento(string_auxiliar);
    end;






    if  sender is TCustomEdit and ((sender as TCustomEdit).Name='ed_cod_tipo_entrada') then
    begin
      pesquisaTiposEntrada();
      exibeInformacoesTiposEntrada(string_auxiliar);
    end;

    if  sender is TCustomEdit and ((sender as TCustomEdit).Name='ed_cod_tipo_entrada') then
    begin
      pesquisaTiposEntrada();
      exibeInformacoesTiposEntrada(string_auxiliar);
    end;

    if  sender is TCustomEdit and ((sender as TCustomEdit).Name='ed_cfop') then   // Pesquisa todas as CFOPS
    begin
     pesquisaCFOP(0);
     exibeInformacoesCFOP(string_auxiliar);
    end;

    if  sender is TCustomEdit and ((sender as TCustomEdit).Name='edCfopTransferencia') then   // Pesquisa todas as CFOPS
    begin
     pesquisaCFOP(0);
     exibeInformacoesCFOPTransferencia(string_auxiliar);
    end;


    if  sender is TCustomEdit and ((sender as TCustomEdit).Name='edCfopDevolucao') then   // Pesquisa todas as CFOPS
    begin
     pesquisaCFOP(0);
     exibeInformacoesCFOPDevolucao(string_auxiliar);
    end;


    if  sender is TCustomEdit and ((sender as TCustomEdit).Name='edCodTipoItemSped') then 
    begin
     pesquisaTipoItemSPED;
     exibeInformacoesTipoItemSPED(string_auxiliar);
    end;

    if  sender is TCustomEdit and ((sender as TCustomEdit).Name='edCodNCM') then
    begin
     pesquisaNCM;
     exibeInformacoesNCM(string_auxiliar);
    end;

    if  sender is TCustomEdit and ((sender as TCustomEdit).Name='edCodGeneroItem') then
    begin
     pesquisaGeneroItem();
     exibeInformacoesGeneroItem(string_auxiliar);
    end;



    if  sender is TCustomEdit and ((sender as TCustomEdit).Name='ed_cefop_entradas') then // Pesquisa apenas CFOP de entrada
    begin
      pesquisaCFOP(1);
      exibeInformacoesCFOPEntrada(string_auxiliar);
    end;



    if  sender is TCustomEdit and ((sender as TCustomEdit).Name='ed_cefop_saidas') then // Pesquisa apenas CFOP de saidas
    begin
     pesquisaCFOP(2);
     exibeInformacoesCFOPSaida(string_auxiliar);
    end;


    if  sender is TCustomEdit and ((sender as TCustomEdit).Name='ed_cod_modelo_nota_fiscal') then
    begin
      pesquisaModeloNotaFiscal();
      exibeInformacoesModeloNotaFiscal(string_auxiliar);
    end;


    if  sender is TCustomEdit and ((sender as TCustomEdit).Name='edCodSituacaoDocFiscal') then
    begin
      pesquisaSituacaoDocumentoFiscal();
      exibeInformacoesSituacaoDocumentoFiscal(string_auxiliar);
    end;


   if  sender is TCustomEdit and ((sender as TCustomEdit).Name='ed_cst') then
    begin
      pesquisaCST;
      exibeInformacoesCST(string_auxiliar);
    end;

   if  sender is TCustomEdit and ((sender as TCustomEdit).Name='edCstSaida') then
    begin
      pesquisaCST;
      exibeInformacoesCST_saida(string_auxiliar);
    end;


   if  sender is TCustomEdit and ((sender as TCustomEdit).Name='edCstTransferencia') then
    begin
      pesquisaCST;
      exibeInformacoesCSTTransferencias(string_auxiliar);
    end;

   if  sender is TCustomEdit and ((sender as TCustomEdit).Name='edCstDevolucao') then
    begin
      pesquisaCST;
      exibeInformacoesCSTDevolucoes(string_auxiliar);
    end;


   if  sender is TCustomEdit and ((sender as TCustomEdit).Name='edCstPisCofins') then
    begin
      pesquisaCSTPisCofins;
      exibeInformacoesCSTPisCofins(string_auxiliar);
    end;



    if  sender is TCustomEdit and ((sender as TCustomEdit).Name='ed_cod_usuario') then
    begin
      pesquisaUsuarios();
      exibeInformacoesUsuario(string_auxiliar);
    end;


   if  sender is TCustomEdit and ((sender as TCustomEdit).Name='ed_cod_grupo') then
    begin
      pesquisaGrupo();
    end;

   if  sender is TCustomEdit and ((sender as TCustomEdit).Name='edCodGrupoRD') then
    begin
      pesquisaGrupoRD ();
    end;


 if  sender is TCustomEdit and ((sender as TCustomEdit).Name='ed_cod_historico') then
    begin
      pesquisaHistorico();
    end;


 if  sender is TCustomEdit and ((sender as TCustomEdit).Name='ed_cod_cidade') then
    begin
      pesquisaCidade();
    end;

 if  sender is TCustomEdit and ((sender as TCustomEdit).Name='edCodGrupoTouch') then
    begin
      pesquisaGrupoTouch;
    end;



 if  sender is TCustomEdit and ((sender as TCustomEdit).Name='ed_cod_estado') then
    begin
      pesquisaEstado;
    end;


 if  sender is TCustomEdit and ((sender as TCustomEdit).Name='ed_cod_centro_custo') then
    begin
      pesquisaCentroDeCusto();
    end;


 if  sender is TCustomEdit and ((sender as TCustomEdit).Name='ed_cod_item') then
    begin
      pesquisaItemEstoque();
      exibeInformacoesItemEstoque(string_auxiliar,1);
    end;

 if  sender is TCustomEdit and ((sender as TCustomEdit).Name='ed_cod_item_saida') then
   begin
    pesquisaProdutosGeral();
    exibeInformacoesItemSaida(string_auxiliar,1);
   end;



 if  sender is TCustomEdit and ((sender as TCustomEdit).Name='edCodSubmateria') then
    begin
      pesquisaSubMateria();
      exibeInformacoesSubMateria(string_auxiliar,1);
    end;


    if  sender is TCustomEdit and ((sender as TCustomEdit).Name='edCodTipoBaixaEstoque') then
    begin
      pesquisaTipoBaixaEstoque();
      exibeInformacoesTipoBaixaEstoque(string_auxiliar);

    end;





 if  sender is TCustomEdit and ((sender as TCustomEdit).Name='ed_cod_barras_item') then
    begin
      pesquisaItemEstoque();
      exibeInformacoesItemEstoque(string_auxiliar2,2);
    end;


 if  sender is TCustomEdit and ((sender as TCustomEdit).Name='ed_cod_un_entrada') then
    begin
      pesquisaUnidadeEntrada();
    end;

 if  sender is TCustomEdit and ((sender as TCustomEdit).Name='ed_cod_un_saida') then
    begin
      pesquisaUnidadeSaida();
    end;





 if  sender is TCustomEdit and ((sender as TCustomEdit).Name='edCodSaborPizza') then
    begin
      pesquisaSaborPizza();
    end;


 if  sender is TCustomEdit and ((sender as TCustomEdit).Name='edCodUnFracao') then
    begin
      pesquisaUnidadeDeFracao();
    end;


 if  sender is TCustomEdit and ((sender as TCustomEdit).Name='edCodUnPadrao') then
    begin
      pesquisaUnidadePadrao();
    end;


 if  sender is TCustomEdit and ((sender as TCustomEdit).Name='ed_cod_garcon') then
    begin
      pesquisaGarcon();
    end;


 if  sender is TCustomEdit and ((sender as TCustomEdit).Name='edCodPromoter') then
    begin
      pesquisaPromoter ();
    end;


 if  sender is TCustomEdit and ((sender as TCustomEdit).Name='edCodDepartamento') then
    begin
      pesquisaDepartamento;
    end;


 if  sender is TCustomEdit and ((sender as TCustomEdit).Name='edCodGuarnicao') then
    begin
      pesquisaGuarnicao;
    end;



 if  sender is TCustomEdit and ((sender as TCustomEdit).Name='ed_cod_metre') then
    begin
      pesquisaMetre();
    end;

 if  sender is TCustomEdit and ((sender as TCustomEdit).Name='ed_cod_tipo_cliente') then
    begin
      pesquisaTipoDeCliente();
    end;


 if  sender is TCustomEdit and ((sender as TCustomEdit).Name='ed_cod_cliente') then
    begin
      pesquisaCliente();
      exibeInformacoesClienteFaturamento(string_auxiliar);
    end;

 if  sender is TCustomEdit and ((sender as TCustomEdit).Name='ed_cod_cliente_reduzido') then
    begin
      pesquisaClienteReduzido ();
    end;

 if  sender is TCustomEdit and ((sender as TCustomEdit).Name='edRgCliente') then
    begin
      pesquisaClienteReduzido ();
    end;

 if  sender is TCustomEdit and ((sender as TCustomEdit).Name='ed_cod_mini_printer') then
   begin
      pesquisaMiniPrinter();
    end;

 if  (sender is TWinControl  and ((sender as TWinControl).Name='edTelClienteDelivery')) then
   begin
      case evento  of
       1: pesquisaClienteDelivery;
      end;

    end;



 if  sender is TWinControl and ((sender as TWinControl).Name='edCodBarrasProduto') then
   begin
     string_aux_cod_barras:='';
     pesquisaProdutosCardapio();
     if verificaExistenciaProduto(string_aux_cod_barras,2) then
         exibeInformacoesProduto(string_aux_cod_barras,2);
    end;

 if  sender is TWinControl and ((sender as TWinControl).Name='edCodProduto') then
   begin
    pesquisaProdutosGeral();
   end;




 if  (sender is TCustomEdit ) and (    trim(copy((sender as TCustomEdit).Name,0,10)) = 'edCodPizza')     then
   begin
    moduloVenda := copy((sender as TCustomEdit).Name,11,1);
    tamanhoPizza := copy((sender as TCustomEdit).Name,12,3);
    pesquisaProdutoPizza(tamanhoPizza,moduloVenda);
   end;

    if  sender is TCustomEdit and ((sender as TCustomEdit).Name='edCodAliquota') then
      begin
        pesquisaAliquota();
      end;


    if ((sender as Twincontrol).Name='edCodFormaPagamento') then
     begin
       pesquisaFormaPagto();
     end;

    if  sender is TCustomEdit and ((sender as TCustomEdit).Name='edCodLoja') then
     begin
       pesquisaLojas;
     end;

    if  sender is TCustomEdit and ((sender as TCustomEdit).Name='edCodCliDelivery') then
     begin
       pesquisaClienteDelivery();
     end;



  if  sender is TCustomEdit and ((sender as TCustomEdit).Name='edCodEntregador') then
     begin
       pesquisaEntregador;
     end;





 end;



end;


procedure Tfrm_modelo_vazio.pesquisaReg60M();
var
 i : integer;
begin
  Application.CreateForm(TfrmCsReg60A, frmCsReg60A);
  frmCsReg60A.ShowModal;
  frmCsReg60A.Free;

    For  i:=0 to ComponentCount-1 do
    begin
      if (components[i].Name = 'ed_cod_reg60a') then
         (components[i] as TCustomEdit).text:=string_auxiliar;

        if (components[i].Name = 'ed_cod_reg60a') then
             (components[i] as TCustomEdit).text:=string_auxiliar2;
    End;

end;

procedure Tfrm_modelo_vazio.exibe_painel_erro(mensagem : string; captionBotao: string);
begin

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
 i : integer;
begin
  Application.CreateForm(TfrmCsAliquotas, frmCsAliquotas);
  frmCsAliquotas.ShowModal;
  frmCsAliquotas.Free;

    For  i:=0 to ComponentCount-1 do
    begin
      if (components[i].Name = 'edCodAliquota') then
         (components[i] as TCustomEdit).text:=string_auxiliar;


        if (components[i].Name = 'edDescAliquota') then
             (components[i] as TCustomEdit).text:=string_auxiliar2;
    End;

end;

procedure Tfrm_modelo_vazio.pesquisaGrupoFornecedor;
var
 i : integer;
begin
   Application.CreateForm(Tfrm_cs_grupos_fornecedores,frm_cs_grupos_fornecedores);
   frm_cs_grupos_fornecedores.showmodal;
   frm_cs_grupos_fornecedores.Free;
   For  i:=0 to ComponentCount-1 do
    begin
      if (components[i].Name = 'ed_cod_grupo_fornecedor') then
         (components[i] as TCustomEdit).text:=string_auxiliar;


        if (components[i].Name = 'ed_desc_grupo_fornecedor') then
             (components[i] as TCustomEdit).text:=string_auxiliar2;
    End;
end;

procedure Tfrm_modelo_vazio.pesquisaGrupo;
var
 i : integer;
begin
   Application.CreateForm(TfrmSelecionaGrupo,frmSelecionaGrupo);
   frmSelecionaGrupo.showmodal;
   frmSelecionaGrupo.Free;
   For  i:=0 to ComponentCount-1 do
    begin
      if (components[i].Name = 'ed_cod_grupo') then
         (components[i] as TCustomEdit).text:=string_auxiliar;


        if (components[i].Name = 'ed_desc_grupo') then
             (components[i] as TCustomEdit).text:=string_auxiliar2;
    End;
end;



procedure Tfrm_modelo_vazio.pesquisaGrupoRD;
var
 i : integer;
begin

   Application.CreateForm(TfrmConsultaGruposRD ,frmConsultaGruposRD);
   frmConsultaGruposRD.showmodal;
   frmConsultaGruposRD.Free;
   For  i:=0 to ComponentCount-1 do
    begin
      if (components[i].Name = 'edCodGrupoRD') then
         (components[i] as TCustomEdit).text:=string_auxiliar;


        if (components[i].Name = 'edDescGrupoRD') then
             (components[i] as TCustomEdit).text:=string_auxiliar2;
    End;


end;



procedure Tfrm_modelo_vazio.pesquisaFornecedor;
var
 i : integer;
begin
   Application.CreateForm(Tfrm_cs_fornecedores,frm_cs_fornecedores);
   frm_cs_fornecedores.showmodal;
   frm_cs_fornecedores.Free;
end;


procedure Tfrm_modelo_vazio.pesquisaHistorico;
var
 i : integer;
begin
  Application.CreateForm(Tfrm_cs_historicos_caixa,frm_cs_historicos_caixa);
  frm_cs_historicos_caixa.showmodal;
  frm_cs_historicos_caixa.Free;

   For  i:=0 to ComponentCount-1 do
    begin
      if (components[i].Name = 'ed_cod_historico') then
         (components[i] as TCustomEdit).text:=string_auxiliar;


        if (components[i].Name = 'ed_desc_historico') then
             (components[i] as TCustomEdit).text:=string_auxiliar2
    End;
end;


procedure Tfrm_modelo_vazio.pesquisaCidade;
var
 i : integer;
begin
  Application.CreateForm(Tfrm_cs_cidades,frm_cs_cidades);
  frm_cs_cidades.showmodal;
  frm_cs_cidades.Free;

   For  i:=0 to ComponentCount-1 do
    begin
      if (components[i].Name = 'ed_cod_cidade') then
         (components[i] as TCustomEdit).text:=string_auxiliar;


        if (components[i].Name = 'ed_nome_cidade') then
             (components[i] as TCustomEdit).text:=string_auxiliar2
    End;
end;


procedure Tfrm_modelo_vazio.pesquisaEstado();
var
 i : integer;
begin
  Application.CreateForm(TfrmCsEstados, frmCsEstados );
  frmCsEstados.ShowModal;
  frmCsEstados.free;

   For  i:=0 to ComponentCount-1 do
    begin
      if (components[i].Name = 'ed_cod_estado') then
         (components[i] as TCustomEdit).text:=string_auxiliar;

        if (components[i].Name = 'ed_nome_estado') then
             (components[i] as TCustomEdit).text:=string_auxiliar2
    End;
end;



procedure Tfrm_modelo_vazio.pesquisaCentroDeCusto;
var
 I : integer;
begin

 Application.CreateForm(Tfrm_cs_contas,frm_cs_contas);
 frm_cs_contas.showmodal;
 frm_cs_contas.Free;

   For  i:=0 to ComponentCount-1 do
    begin
      if (components[i].Name = 'ed_cod_centro_custo') then
         (components[i] as TCustomEdit).text:=string_auxiliar;


        if (components[i].Name = 'ed_desc_c_custo') then
           (components[i] as TCustomEdit).text:=string_auxiliar2
    End;

end;

procedure Tfrm_modelo_vazio.pesquisaUnidadeEntrada;
var
 I : integer;
begin

 Application.CreateForm(Tfrm_cs_unidades,frm_cs_unidades);
 frm_cs_unidades.showmodal;
 frm_cs_unidades.Free;

   For  i:=0 to ComponentCount-1 do
    begin
      if (components[i].Name = 'ed_cod_un_entrada') then
         (components[i] as TCustomEdit).text:=string_auxiliar;


        if (components[i].Name = 'ed_desc_un_entrada') then
           (components[i] as TCustomEdit).text:=string_auxiliar2
    End;

end;

procedure Tfrm_modelo_vazio.pesquisaGarcon;
var
 I : integer;
begin

 Application.CreateForm(Tfrm_cs_garcons,frm_cs_garcons);
 frm_cs_garcons.setTipoPesquisa(0);
 frm_cs_garcons.showmodal;
 frm_cs_garcons.Free;

   For  i:=0 to ComponentCount-1 do
    begin
      if (components[i].Name = 'ed_cod_garcon') then
         (components[i] as TCustomEdit).text:=string_auxiliar;


        if (components[i].Name = 'ed_nome_garcon') then
           (components[i] as TCustomEdit).text:=string_auxiliar2
    End;
end;




procedure Tfrm_modelo_vazio.pesquisaPromoter;
var
 I : integer;
begin
 Application.CreateForm(TfrmCsPromoters,frmCsPromoters);
 frmCsPromoters.showmodal;
 frmCsPromoters.Free;

   For  i:=0 to ComponentCount-1 do
    begin
      if (components[i].Name = 'edCodPromoter') then
         (components[i] as TCustomEdit).text:=string_auxiliar;


        if (components[i].Name = 'edNomePromoter') then
           (components[i] as TCustomEdit).text:=string_auxiliar2
    End;
end;




procedure Tfrm_modelo_vazio.pesquisaDepartamento();
var
 I : integer;
begin

 Application.CreateForm(TfrmCsDepartamentos,frmCsDepartamentos);
 frmCsDepartamentos.showmodal;
 frmCsDepartamentos.Free;

   For  i:=0 to ComponentCount-1 do
    begin
      if (components[i].Name = 'edCodDepartamento') then
         (components[i] as TCustomEdit).text:=string_auxiliar;


        if (components[i].Name = 'edDescDepartamento') then
           (components[i] as TCustomEdit).text:=string_auxiliar2
    End;
end;


procedure Tfrm_modelo_vazio.pesquisaGuarnicao();
var
 I : integer;
begin

 Application.CreateForm(TfrmCsGuarnicoes,frmCsGuarnicoes);
 frmCsGuarnicoes.showmodal;
 frmCsGuarnicoes.Free;

   For  i:=0 to ComponentCount-1 do
    begin
      if (components[i].Name = 'edCodGuarnicao') then
         (components[i] as TCustomEdit).text:=string_auxiliar;


        if (components[i].Name = 'edDescGuarnicao') then
           (components[i] as TCustomEdit).text:=string_auxiliar2
    End;
end;


procedure Tfrm_modelo_vazio.pesquisaTipoItemSPED;
var
 I : integer;
begin

  Application.CreateForm(TfrmPesqTipoItemSPED,frmPesqTipoItemSPED);
  frmPesqTipoItemSPED.showmodal;
  frmPesqTipoItemSPED.free;

 For  i:=0 to ComponentCount-1 do
    begin
      if (components[i].Name = 'edCodTipoItemSped') then
         (components[i] as TCustomEdit).text:= string_auxiliar;

      if (components[i].Name = 'edDescTipoItemSped') then
         (components[i] as TCustomEdit).text:= string_auxiliar2;
    End;
end;


procedure Tfrm_modelo_vazio.pesquisaNCM;
var
 I : integer;
begin

  Application.CreateForm(TfrmCsNCM,frmCsNCM);
  frmCsNCM.showmodal;
  frmCsNCM.free;

 For  i:=0 to ComponentCount-1 do
    begin
      if (components[i].Name = 'edCodNCM') then
         (components[i] as TCustomEdit).text:= string_auxiliar;

      if (components[i].Name = 'edDescNCM') then
         (components[i] as TCustomEdit).text:= string_auxiliar2;
    End;
end;



procedure Tfrm_modelo_vazio.pesquisaGeneroItem;
var
 I : integer;
begin

  Application.CreateForm(TfrmCsGeneroItemSPED,frmCsGeneroItemSPED);
  frmCsGeneroItemSPED.showmodal;
  frmCsGeneroItemSPED.free;

 For  i:=0 to ComponentCount-1 do
    begin
      if (components[i].Name = 'edCodGeneroItem') then
         (components[i] as TCustomEdit).text:= string_auxiliar;

      if (components[i].Name = 'edDescGeneroItem') then
         (components[i] as TCustomEdit).text:= string_auxiliar2;
    End;
end;



procedure Tfrm_modelo_vazio.pesquisaFormaPagto();
var
 I : integer;
 edCodForma        : TComponent;
 edDescricaoForma  : TComponent;
begin

 Application.CreateForm(Tfrm_cs_formas_pagto,frm_cs_formas_pagto);
 frm_cs_formas_pagto.showmodal;
 frm_cs_formas_pagto.Free;

 edCodForma        := self.FindComponent('edCodFormaPagamento');
 edDescricaoForma  := self.FindComponent('edDescricaoForma');

  if edCodForma <> nil then
   begin
    case AnsiIndexStr((edCodForma.ClassName), ['TEdit', 'TCurvyEdit']) of
      0 : begin
            (edCodForma as TEdit).Text := string_auxiliar;
          end;
      1 : begin
           (edCodForma as TCurvyEdit).Text := string_auxiliar;
          end;
    end;
   end;


  if edDescricaoForma <> nil then
   begin

    case AnsiIndexStr((edDescricaoForma.ClassName), ['TEdit', 'TCurvyEdit']) of
      0 : begin
            (edDescricaoForma as TEdit).Text := string_auxiliar2;
          end;
      1 : begin
           (edDescricaoForma as TCurvyEdit).Text := string_auxiliar2;
          end;
    end;
   end;

end;


procedure Tfrm_modelo_vazio.pesquisaLojas();
var
 I : integer;
begin

 Application.CreateForm(TfrmCsLojas, frmCsLojas);
 frmCsLojas.ShowModal;
 frmCsLojas.free;

   For  i:=0 to ComponentCount-1 do
    begin
      if (components[i].Name = 'edCodLoja') then
         (components[i] as TCustomEdit).text:=string_auxiliar;


        if (components[i].Name = 'edDescLoja') then
           (components[i] as TCustomEdit).text:=string_auxiliar2
    End;
end;


procedure Tfrm_modelo_vazio.pesquisaTipoDeCliente();
var
 I : integer;
begin

 Application.CreateForm(Tfrm_cs_tipos_cliente,frm_cs_tipos_cliente);
 frm_cs_tipos_cliente.showmodal;
 frm_cs_tipos_cliente.Free;

   For  i:=0 to ComponentCount-1 do
    begin
      if (components[i].Name = 'ed_cod_tipo_cliente') then
         (components[i] as TCustomEdit).text:=string_auxiliar;


        if (components[i].Name = 'ed_desc_tipo_cliente') then
           (components[i] as TCustomEdit).text:=string_auxiliar2
    End;
end;



procedure Tfrm_modelo_vazio.pesquisaCliente();
var
 I : integer;
begin

 Application.CreateForm(Tfrm_cs_clientes,frm_cs_clientes);
 frm_cs_clientes.showmodal;
 frm_cs_clientes.Free;
end;


procedure Tfrm_modelo_vazio.pesquisaClienteReduzido();
var
 I : integer;
begin

 Application.CreateForm(TfrmPesquisaClienteReduzido,frmPesquisaClienteReduzido);
 frmPesquisaClienteReduzido.ShowModal;
 frmPesquisaClienteReduzido.Free;

   For  i:=0 to ComponentCount-1 do
    begin
      if (components[i].Name = 'ed_cod_cliente') then
         (components[i] as TCustomEdit).text:=string_auxiliar;


         if (components[i].Name = 'edRgCliente') then
           (components[i] as TCustomEdit).text:=string_auxiliar2


    End;
end;


procedure Tfrm_modelo_vazio.pesquisaClienteDelivery();
var
 I : integer;
 edCodCliDelivery        : TComponent;
 edTelClienteDelivery    : TComponent;
 edNomeClienteDelivery   : TComponent;


begin
 string_auxiliar:='';
 string_auxiliar3 :='';
 string_auxiliar2 :='';


 Application.CreateForm(TfrmPesquisaClienteDelivery ,frmPesquisaClienteDelivery);
 frmPesquisaClienteDelivery.ShowModal;
 frmPesquisaClienteDelivery.Free;

 edCodCliDelivery        := self.FindComponent('edCodCliDelivery');
 edNomeClienteDelivery   := self.FindComponent('edNomeClienteDelivery');
 edTelClienteDelivery    := self.FindComponent('edTelClienteDelivery');


if edCodCliDelivery <> nil then
   begin
    case AnsiIndexStr((edCodCliDelivery.ClassName), ['TEdit', 'TCurvyEdit']) of
      0 : begin
            (edCodCliDelivery as TEdit).Text := string_auxiliar;
          end;
      1 : begin
           (edCodCliDelivery as TCurvyEdit).Text := string_auxiliar;
          end;
    end;
   end;


if edNomeClienteDelivery <> nil then
   begin
    case AnsiIndexStr((edNomeClienteDelivery.ClassName), ['TEdit', 'TCurvyEdit']) of
      0 : begin
            (edNomeClienteDelivery as TEdit).Text := string_auxiliar2;
          end;
      1 : begin
           (edNomeClienteDelivery as TCurvyEdit).Text := string_auxiliar2;
          end;
    end;
   end;



if edTelClienteDelivery <> nil then
   begin
    case AnsiIndexStr((edTelClienteDelivery.ClassName), ['TEdit', 'TCurvyEdit']) of
      0 : begin
            (edTelClienteDelivery as TEdit).Text := string_auxiliar3;
          end;
      1 : begin
           (edTelClienteDelivery as TCurvyEdit).Text := string_auxiliar3;
          end;
    end;
   end;

end;








procedure Tfrm_modelo_vazio.pesquisaMiniPrinter();
var
 I : integer;
begin

 Application.CreateForm(Tfrm_cs_miniprinters,frm_cs_miniprinters);
 frm_cs_miniprinters.showmodal;
 frm_cs_miniprinters.Free;

   For  i:=0 to ComponentCount-1 do
    begin
      if (components[i].Name = 'ed_cod_mini_printer') then
         (components[i] as TCustomEdit).text:=string_auxiliar;


        if (components[i].Name = 'ed_desc_mini_printer') then
           (components[i] as TCustomEdit).text:=string_auxiliar2
    End;
end;

procedure Tfrm_modelo_vazio.pesquisaTiposDocumento();
var
 I : integer;
begin

 Application.CreateForm(Tfrm_cs_tipos_documentos,frm_cs_tipos_documentos);
 frm_cs_tipos_documentos.showmodal;
 frm_cs_tipos_documentos.Free;
end;


procedure Tfrm_modelo_vazio.pesquisaBairro();
var
 I : integer;
begin

 Application.CreateForm(TfrmCsBairros, frmCsBairros);
 frmCsBairros.showmodal;
 frmCsBairros.free;
end;


procedure Tfrm_modelo_vazio.pesquisaTiposEntrada();
var
 I : integer;
begin

 Application.CreateForm(Tfrm_cs_tipos_entrada,frm_cs_tipos_entrada);
 frm_cs_tipos_entrada.showmodal;
 frm_cs_tipos_entrada.Free;
end;


procedure Tfrm_modelo_vazio.pesquisaCFOP(tipo : integer);
begin
  Application.CreateForm(TfrmCsCFOP, frmCsCFOP);
  frmCsCFOP.tipoCFOP:=tipo;
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
  Application.CreateForm(TfrmCsCST,frmCsCST);
  frmCsCST.showmodal;
  frmCsCST.free;
end;


procedure Tfrm_modelo_vazio.pesquisaCSTPisCofins();
begin
  Application.CreateForm(TfrmCsCSTPISCOFINS,frmCsCSTPISCOFINS);
  frmCsCSTPISCOFINS.showmodal;
  frmCsCSTPISCOFINS.free;
end;




procedure Tfrm_modelo_vazio.pesquisaSaidas();
var
 I : integer;
begin
 Application.CreateForm(TfrmCsNotasSaida,frmCsNotasSaida);
 frmCsNotasSaida.showmodal;
 frmCsNotasSaida.Free;
end;




procedure Tfrm_modelo_vazio.pesquisaEntradas();
begin
 Application.CreateForm(Tfrm_cs_entradas,frm_cs_entradas);
 frm_cs_entradas.showmodal;
 frm_cs_entradas.Free;
end;

procedure Tfrm_modelo_vazio.consultaContasAPagar();
begin
end;


procedure Tfrm_modelo_vazio.pesquisaUsuarios();
var
 I : integer;
begin
 Application.CreateForm(Tfrm_cs_usuarios,frm_cs_usuarios);
 frm_cs_usuarios.showmodal;
 frm_cs_usuarios.Free;
end;

procedure Tfrm_modelo_vazio.pesquisaProdutosCardapio();
var
 I : integer;
begin
 Application.CreateForm(Tfrm_consulta_produtos, frm_consulta_produtos);
 frm_consulta_produtos.ShowModal;
 frm_consulta_produtos.free;
end;

procedure Tfrm_modelo_vazio.pesquisaProdutosGeral();
var
 I : integer;
begin

 Application.CreateForm(TfrmCsProdutosGeral,frmCsProdutosGeral);
 frmCsProdutosGeral.showmodal;
 frmCsProdutosGeral.Free;

   For  i:=0 to ComponentCount-1 do
    begin
      if (components[i].Name = 'edCodProduto') then
         (components[i] as TCustomEdit).text:=string_auxiliar;

      if (components[i].Name = 'ed_cod_item_saida') then
         (components[i] as TCustomEdit).text:=string_auxiliar;

    End;


end;



procedure Tfrm_modelo_vazio.pesquisaProdutoPizza(tamanhoPizza : string ; moduloVenda : string);
var
 I : integer;
begin

 Application.CreateForm(Tfrm_consulta_produtos,frm_consulta_produtos);
 frm_consulta_produtos.showmodal;
 frm_consulta_produtos.Free;
 exibeInformacoesProdutoPizza(string_auxiliar,tamanhoPizza,moduloVenda);


end;













procedure Tfrm_modelo_vazio.pesquisaMetreGarcon;
var
 I : integer;
begin

 Application.CreateForm(Tfrm_cs_garcons,frm_cs_garcons);
 frm_cs_garcons.setTipoPesquisa(0);
 frm_cs_garcons.showmodal;
 frm_cs_garcons.Free;

   For  i:=0 to ComponentCount-1 do
    begin
      if (components[i].Name = 'ed_cod_garcon') then
         (components[i] as TCustomEdit).text:=string_auxiliar;


        if (components[i].Name = 'ed_nome_garcon') then
           (components[i] as TCustomEdit).text:=string_auxiliar2
    End;
end;


procedure Tfrm_modelo_vazio.pesquisaEntregador();
var
 I : integer;
begin

 Application.CreateForm(TfrmCsEntregadores ,frmCsEntregadores);
 frmCsEntregadores.showmodal;
 frmCsEntregadores.Free;

   For  i:=0 to ComponentCount-1 do
    begin
      if (components[i].Name = 'edCodEntregador') then
         (components[i] as TCustomEdit).text:=string_auxiliar;


        if (components[i].Name = 'edNomeEntregador') then
           (components[i] as TCustomEdit).text:=string_auxiliar2
    End;
end;


procedure Tfrm_modelo_vazio.pesquisaTipoSangria;
var
 I : integer;
begin
 string_auxiliar:='';
 Application.CreateForm(TfrmCsTiposSangria ,frmCsTiposSangria );
 frmCsTiposSangria.setTipoPesquisa(0);
 frmCsTiposSangria.showmodal;
 frmCsTiposSangria .Free;

   For  i:=0 to ComponentCount-1 do
    begin
      if (components[i].Name = 'edCodTipoSangria') then
         (components[i] as TCustomEdit).text:=string_auxiliar;

      if (components[i].Name = 'ed_Codigo') then
         (components[i] as TCustomEdit).text:=string_auxiliar;

        if (components[i].Name = 'edDescricaoTIpoSangria') then
           (components[i] as TCustomEdit).text:=string_auxiliar2
    End;
end;


procedure Tfrm_modelo_vazio.pesquisaMotivoEstorno();
var
 I : integer;
begin
 string_auxiliar:='';
 Application.CreateForm(TfrmCsMotivosEstorno ,frmCsMotivosEstorno );
 frmCsMotivosEstorno.setTipoPesquisa(0);
 frmCsMotivosEstorno.showmodal;
 frmCsMotivosEstorno .Free;

   For  i:=0 to ComponentCount-1 do
    begin
      if (components[i].Name = 'edCodMotivoEstorno') then
         (components[i] as TCustomEdit).text:=string_auxiliar;
      if (components[i].Name = 'ed_Codigo') then
         (components[i] as TCustomEdit).text:=string_auxiliar;


        if (components[i].Name = 'edDescricaoMotivoEstorno') then
           (components[i] as TCustomEdit).text:=string_auxiliar2
    End;
end;


procedure Tfrm_modelo_vazio.pesquisaObsPreparo();
var
 I : integer;
begin
 string_auxiliar:='';
 Application.CreateForm(TfrmCsObservacoesPreparo ,frmCsObservacoesPreparo );
 frmCsObservacoesPreparo.setTipoPesquisa(0);
 frmCsObservacoesPreparo.showmodal;
 frmCsObservacoesPreparo .Free;

   For  i:=0 to ComponentCount-1 do
    begin
      if (components[i].Name = 'edCodObsPreparo') then
         (components[i] as TCustomEdit).text:=string_auxiliar;
      if (components[i].Name = 'ed_codigo') then
         (components[i] as TCustomEdit).text:=string_auxiliar;


        if (components[i].Name = 'edDescricaoObsPreparo') then
           (components[i] as TCustomEdit).text:=string_auxiliar2
    End;
end;





procedure Tfrm_modelo_vazio.pesquisaGrupoTouch();
var
 I : integer;
begin
 string_auxiliar:='';
 Application.CreateForm(TfrmCsGruposTouch  ,frmCsGruposTouch );
 frmCsGruposTouch.showmodal;
 frmCsGruposTouch.Free;

   For  i:=0 to ComponentCount-1 do
    begin
      if (components[i].Name = 'edCodGrupoTouch') then
         (components[i] as TCustomEdit).text:=string_auxiliar;
      if (components[i].Name = 'ed_codigo') then
         (components[i] as TCustomEdit).text:=string_auxiliar;


        if (components[i].Name = 'edDescGrupoTouch') then
           (components[i] as TCustomEdit).text:=string_auxiliar2
    End;
end;



procedure Tfrm_modelo_vazio.pesquisaTipoBaixaEstoque();
var
 I : integer;
begin
 string_auxiliar:='';
 Application.CreateForm(TfrmCsTiposBaixaEstoque ,frmCsTiposBaixaEstoque);
 frmCsTiposBaixaEstoque.setTipoPesquisa(0);
 frmCsTiposBaixaEstoque.showmodal;
 frmCsTiposBaixaEstoque.Free;
end;




procedure Tfrm_modelo_vazio.pesquisaMetre;
var
 I : integer;
begin

 Application.CreateForm(Tfrm_cs_garcons,frm_cs_garcons);
 frm_cs_garcons.setTipoPesquisa(1);
 frm_cs_garcons.showmodal;
 frm_cs_garcons.Free;

   For  i:=0 to ComponentCount-1 do
    begin
      if (components[i].Name = 'ed_cod_metre') then
         (components[i] as TCustomEdit).text:=string_auxiliar;


        if (components[i].Name = 'ed_nome_metre') then
           (components[i] as TCustomEdit).text:=string_auxiliar2
    End;
end;



procedure Tfrm_modelo_vazio.pesquisaUnidadeSaida;
var
 I : integer;
begin

 Application.CreateForm(Tfrm_cs_unidades,frm_cs_unidades);
 frm_cs_unidades.showmodal;
 frm_cs_unidades.Free;

   For  i:=0 to ComponentCount-1 do
    begin
      if (components[i].Name = 'ed_cod_un_saida') then
         (components[i] as TCustomEdit).text:=string_auxiliar;


        if (components[i].Name = 'ed_desc_un_saida') then
           (components[i] as TCustomEdit).text:=string_auxiliar2
    End;
end;

procedure Tfrm_modelo_vazio.pesquisaSaborPizza;
var
 I : integer;
begin

 Application.CreateForm(TfrmCsSaboresPizza,frmCsSaboresPizza);
 frmCsSaboresPizza.showmodal;
 frmCsSaboresPizza.Free;

   For  i:=0 to ComponentCount-1 do
    begin
      if (components[i].Name = 'edCodSaborPizza') then
         (components[i] as TCustomEdit).text:=string_auxiliar;


        if (components[i].Name = 'edDescSaborPizza') then
           (components[i] as TCustomEdit).text:=string_auxiliar2
    End;

end;



procedure Tfrm_modelo_vazio.pesquisaUnidadeDeFracao;
var
 I : integer;
begin

 Application.CreateForm(Tfrm_cs_unidades,frm_cs_unidades);
 frm_cs_unidades.showmodal;
 frm_cs_unidades.Free;

   For  i:=0 to ComponentCount-1 do
    begin
      if (components[i].Name = 'edCodUnFracao') then
         (components[i] as TCustomEdit).text:=string_auxiliar;


        if (components[i].Name = 'edDescUnFracao') then
           (components[i] as TCustomEdit).text:=string_auxiliar2
    End;

end;


procedure Tfrm_modelo_vazio.pesquisaUnidadePadrao;
var
 I : integer;
begin

 Application.CreateForm(Tfrm_cs_unidades,frm_cs_unidades);
 frm_cs_unidades.showmodal;
 frm_cs_unidades.Free;

   For  i:=0 to ComponentCount-1 do
    begin
      if (components[i].Name = 'edCodUnPadrao') then
         (components[i] as TCustomEdit).text:=string_auxiliar;


        if (components[i].Name = 'edDescUnPadrao') then
           (components[i] as TCustomEdit).text:=string_auxiliar2
    End;

end;



procedure Tfrm_modelo_vazio.pesquisaItemEstoque;
var
 I : integer;
begin
 Application.CreateForm(Tfrm_cs_itens,frm_cs_itens);
 frm_cs_itens.showmodal;
 frm_cs_itens.Free;
end;


procedure Tfrm_modelo_vazio.pesquisaSubMateria();
var
 I : integer;
begin
 Application.CreateForm(TfrmCsSubMaterias,frmCsSubMaterias);
 frmCsSubMaterias.ShowModal;
 frmCsSubMaterias.free;
end;



procedure Tfrm_modelo_vazio.botao_pesquisaClick(Sender: TObject);
var
 I : integer;
 nomeEdit : string;
 tamanhoPizza : string;
 moduloVenda : string;
 
begin






 if  sender is TSpeedButton and ((sender as TSpeedButton ).Name='bt_pesq_cod_grupo_fornecedor') then
    begin
      pesquisaGrupoFornecedor();
    end;


 if  sender is TSpeedButton and ((sender as TSpeedButton ).Name='btPesqGrupoTouch') then
    begin
      pesquisaGrupoTouch();
    end;



 if  sender is TSpeedButton and ((sender as TSpeedButton ).Name='bt_pesq_fornecedor') then
    begin
      pesquisaFornecedor();
      exibeInformacoesFornecedor(string_auxiliar);
    end;

 if  sender is TSpeedButton and ((sender as TSpeedButton ).Name='bt_pesq_bairro') then
    begin
      pesquisaBairro();
      exibeInformacoesBairro(string_auxiliar);
    end;


 if  sender is TSpeedButton and ((sender as TSpeedButton ).Name='bt_pesq_tipos_documento') then
    begin
      pesquisaTiposDocumento();
      exibeInformacoesTiposDocumento(string_auxiliar);
    end;

 if  sender is TSpeedButton and ((sender as TSpeedButton ).Name='bt_pesq_tipos_entrada') then
    begin
      pesquisaTiposEntrada();
      exibeInformacoesTiposEntrada(string_auxiliar);
    end;

 if  sender is TSpeedButton and ((sender as TSpeedButton ).Name='bt_pesq_cfop_entrada') then
    begin
      pesquisaCFOP(1);
      exibeInformacoesCFOPEntrada(string_auxiliar);
    end;


 if  sender is TSpeedButton and ((sender as TSpeedButton ).Name='bt_pesq_cfop_saida') then
    begin
      pesquisaCFOP(1);
      exibeInformacoesCFOPSaida(string_auxiliar);
    end;

 if  sender is TSpeedButton and ((sender as TSpeedButton ).Name='btPesqCfopTransferencia') then
    begin
      pesquisaCFOP(1);
      exibeInformacoesCFOPTransferencia(string_auxiliar);
    end;

 if  sender is TSpeedButton and ((sender as TSpeedButton ).Name='btPesqCFOPDevolucao') then
    begin
      pesquisaCFOP(1);
      exibeInformacoesCFOPDevolucao(string_auxiliar);
    end;



 if  sender is TSpeedButton and ((sender as TSpeedButton ).Name='bt_pesq_cfop') then
    begin
      pesquisaCFOP(0);
      exibeInformacoesCFOP(string_auxiliar);
    end;

 if  sender is TSpeedButton and ((sender as TSpeedButton ).Name='btPesqTipoItemSped') then
    begin
     pesquisaTipoItemSPED();
     exibeInformacoesTipoItemSPED(string_auxiliar);
    end;

 if  sender is TSpeedButton and ((sender as TSpeedButton ).Name='btPesqGeneroItem') then
    begin
     pesquisaGeneroItem();
     exibeInformacoesGeneroItem(string_auxiliar);
    end;



 if  sender is TSpeedButton and ((sender as TSpeedButton ).Name='btPesqNCM') then
    begin
     pesquisaNCM();
     exibeInformacoesNCM(string_auxiliar);
    end;



 if  sender is TSpeedButton and ((sender as TSpeedButton ).Name='bt_pesq_modelo_notaFiscal') then
    begin
      pesquisaModeloNotaFiscal();
      exibeInformacoesModeloNotaFiscal(string_auxiliar);
    end;


 if  sender is TSpeedButton and ((sender as TSpeedButton ).Name='btPesqSituacaoDocFiscal') then
    begin
      pesquisaSituacaoDocumentoFiscal();
      exibeInformacoesSituacaoDocumentoFiscal(string_auxiliar);
    end;


 if  sender is TSpeedButton and ((sender as TSpeedButton ).Name='bt_pesq_cst') then
    begin
      pesquisaCST();
      exibeInformacoesCST(string_auxiliar);
    end;

 if  sender is TSpeedButton and ((sender as TSpeedButton ).Name='btPesqCstPisCofins') then
    begin
      pesquisaCSTPisCofins();
      exibeInformacoesCSTPisCofins(string_auxiliar);
    end;



 if  sender is TSpeedButton and ((sender as TSpeedButton ).Name='btPesqCstSaida') then
    begin
      pesquisaCST();
      exibeInformacoesCST_saida(string_auxiliar);
    end;


 if  sender is TSpeedButton and ((sender as TSpeedButton ).Name='btPesqCstTransferencias') then
    begin
      pesquisaCST();
      exibeInformacoesCSTTransferencias(string_auxiliar);
    end;

 if  sender is TSpeedButton and ((sender as TSpeedButton ).Name='btPesqCstDevolucoes') then
    begin
      pesquisaCST();
      exibeInformacoesCSTDevolucoes(string_auxiliar);
    end;



 if  sender is TSpeedButton and ((sender as TSpeedButton ).Name='bt_pesq_usuarios') then
    begin
      pesquisaUsuarios();
      exibeInformacoesUsuario(string_auxiliar);
    end;


 if  sender is TSpeedButton and ((sender as TSpeedButton ).Name='bt_pesq_historico') then
    begin
      pesquisaHistorico();
    end;


 if  sender is TSpeedButton and ((sender as TSpeedButton ).Name='bt_pesq_cidade') then
    begin
      pesquisaCidade();
    end;

 if  sender is TSpeedButton and ((sender as TSpeedButton ).Name='bt_pesq_estado') then
    begin
      pesquisaEstado;
    end;


 if  sender is TSpeedButton and ((sender as TSpeedButton ).Name='bt_pesq_centro_custo') then
    begin
      pesquisaCentroDeCusto();
    end;

 if  sender is TSpeedButton and ((sender as TSpeedButton ).Name='bt_pesq_grupo') then
    begin
      pesquisaGrupo();
    end;

 if  sender is TSpeedButton and ((sender as TSpeedButton ).Name='bt_pesq_item_estoque_cod') then
    begin
      pesquisaItemEstoque();
      exibeInformacoesItemEstoque(string_auxiliar,1);
    end;

 if  sender is TSpeedButton and ((sender as TSpeedButton ).Name='btPesqSubmateria') then
    begin
      pesquisaSubMateria();
      exibeInformacoesSubMateria(string_auxiliar,1);
    end;

 if  sender is TSpeedButton and ((sender as TSpeedButton ).Name='btPesqTipoBaixa') then
    begin
      pesquisaTipoBaixaEstoque;
      exibeInformacoesTipoBaixaEstoque(string_auxiliar);
    end;





 if  sender is TSpeedButton and ((sender as TSpeedButton ).Name='bt_pesq_item_estoque_barras') then
    begin
      pesquisaItemEstoque();
      exibeInformacoesItemEstoque(string_auxiliar2,2);
    end;


 if  sender is TSpeedButton and ((sender as TSpeedButton ).Name='bt_pesq_un_entrada') then
    begin
      pesquisaUnidadeEntrada();
    end;

  if  sender is TSpeedButton and ((sender as TSpeedButton ).Name='bt_pesq_un_saida') then
    begin
      pesquisaUnidadeSaida();
    end;


  if  sender is TSpeedButton and ((sender as TSpeedButton ).Name='btPesqSaborPizza') then
    begin
      pesquisaSaborPizza();
    end;

//   nomeEdit :=  trim(copy((sender as TSpeedButton).Name,0,14));
//   btPesqCodPizzaBbro
 if  (sender is TSpeedButton ) and (    trim(copy((sender as TSpeedButton).Name,0,14)) = 'btPesqCodPizza')     then
   begin
     moduloVenda :=  trim(copy((sender as TSpeedButton).Name,15,1));
     tamanhoPizza := trim(copy((sender as TSpeedButton).Name,16,3));
     pesquisaProdutoPizza(tamanhoPizza,moduloVenda);
   end;




  if  sender is TSpeedButton and ((sender as TSpeedButton ).Name='btPesqUnFracao') then
    begin
      pesquisaUnidadeDeFracao();
    end;

  if  sender is TSpeedButton and ((sender as TSpeedButton ).Name='btPesqUnPadrao') then
    begin
      pesquisaUnidadePadrao();
    end;

 if  sender is TSpeedButton and ((sender as TSpeedButton ).Name='bt_pesq_garcon') then
    begin
      pesquisaGarcon();
    end;

 if  sender is TSpeedButton and ((sender as TSpeedButton ).Name='btPesqPromoter') then
    begin
      pesquisaPromoter();
    end;


 if  sender is TSpeedButton and ((sender as TSpeedButton ).Name='btPesqDepartamento') then
    begin
      pesquisaDepartamento();
    end;

 if  sender is TSpeedButton and ((sender as TSpeedButton ).Name='btPesqGuarnicao') then
    begin
      pesquisaGuarnicao();
    end;

 if  sender is TSpeedButton and ((sender as TSpeedButton ).Name='bt_pesq_entregador') then
    begin
      pesquisaEntregador();
    end;




  if  sender is TSpeedButton and ((sender as TSpeedButton ).Name='bt_pesq_metre') then
    begin
      pesquisaMetre();
    end;


  if  sender is TSpeedButton and ((sender as TSpeedButton ).Name='bt_pesq_cliente') then
    begin
      pesquisaCliente();
      exibeInformacoesClienteFaturamento(string_auxiliar);
    end;

  if  sender is TSpeedButton and ((sender as TSpeedButton ).Name='bt_pesq_cliente_reduzido') then
    begin
      pesquisaClienteReduzido();
    end;


  if  sender is TSpeedButton and ((sender as TSpeedButton ).Name='bt_pesq_mini_printer') then
    begin
      pesquisaMiniPrinter();
    end;

  if  sender is TSpeedButton and ((sender as TSpeedButton ).Name='btPesqProdutoCodBarras') then
    begin
     string_aux_cod_barras:='';
     pesquisaProdutosCardapio();
     if verificaExistenciaProduto(string_aux_cod_barras,2) then
         exibeInformacoesProduto(string_aux_cod_barras,2);
    end;


  if  sender is TSpeedButton and ((sender as TSpeedButton ).Name='btPesqProdutos') then
    begin
     For  i:=0 to ComponentCount-1 do
      begin
        if (components[i].Name = 'ckbCodSistema') then
         begin
           if (components[i] as TRadioButton).Name ='ckbCodSistema' then
            begin
              if ( (components[i] as TRadioButton).Checked = false) then
                (components[i] as TRadioButton).Checked := true;
            end;
         end;
      end;

      pesquisaProdutosGeral();

    end;


  if  sender is TSpeedButton and ((sender as TSpeedButton ).Name='btPesqAliquota') then
    begin
      pesquisaAliquota();
    end;

  if  sender is TSpeedButton and ((sender as TSpeedButton ).Name='btPesqFormaPagto') then
    begin
      pesquisaFormaPagto();
    end;

  if  sender is TSpeedButton and ((sender as TSpeedButton ).Name='btPesqLoja') then
    begin
      pesquisaLojas();
    end;


 if  sender is TSpeedButton and ((sender as TSpeedButton ).Name='btPesqClienteDelivery') then
    begin
      pesquisaClienteDelivery();
    end;


end;

function Tfrm_modelo_vazio.verificaExistenciaItemEstoque(cod_item : string; campo: integer) : boolean;
var
 q : TIBquery;
begin
 q := TIBquery.create(self);
 q.database:= dm.dbrestaurante;
 q.transaction:= dm.transacao;

 q.active:=false;
 q.sql.clear;
 q.sql.add('select * from produtos where cod_produto='+Quotedstr(cod_item)+' and compra=1');
 q.Active:=true;
 q.active:=true;
 result := not q.isEmpty;

 FreeAndNil(q);
end;



function Tfrm_modelo_vazio.verificaExistenciaSaborPizza(codSabor : string) : boolean;
var
 q : TIBquery;
begin
 q := TIBquery.create(self);
 q.database:= dm.dbrestaurante;
 q.transaction:= dm.transacao;

 q.active:=false;
 q.sql.clear;
 q.sql.add('select * from sabores_pizza where codigo='+Quotedstr(codSabor));
 q.Active:=true;
 q.active:=true;
 result := not q.isEmpty;
 FreeAndNil(q);
end;



function Tfrm_modelo_vazio.verificaExistenciaSubmateria(cod_item : string; campo: integer) : boolean;
var
 q : TIBquery;
begin
 q := TIBquery.create(self);
 q.database:= dm.dbrestaurante;
 q.transaction:= dm.transacao;

 q.active:=false;
 q.sql.clear;
 if campo = 1 then
   q.sql.add('select * from produtos where submateria=1 and cod_produto='+Quotedstr(cod_item))
 else
   q.sql.add('select * from produtos where submateria=1 and cod_barras='+Quotedstr(cod_item));

 q.Active:=true;
 q.active:=true;
 result := not q.isEmpty;

 FreeAndNil(q);
end;


function Tfrm_modelo_vazio.verificaExistenciaTipoBaixaEstoque(codTipo : string) : boolean;
var
 q : TIBquery;
begin
 q := TIBquery.create(self);
 q.database:= dm.dbrestaurante;
 q.transaction:= dm.transacao;

 q.active:=false;
 q.sql.clear;
 q.sql.add('select * from tipos_baixa where cod_tipo='+Quotedstr(codTipo));
 q.Active:=true;
 q.active:=true;
 result := not q.isEmpty;
 FreeAndNil(q);
end;




function Tfrm_modelo_vazio.verificaExistenciaContaApagar(codConta : string) : boolean;
var
 q : TIBquery;
begin
 q := TIBquery.create(self);
 q.database:= dm.dbrestaurante;
 q.transaction:= dm.transacao;

 q.active:=false;
 q.sql.clear;
 q.sql.add('select * from contas_a_pagar where codigo='+Quotedstr(codConta));
 q.Active:=true;
 q.active:=true;
 result := not q.isEmpty;
 FreeAndNil(q);
end;





function Tfrm_modelo_vazio.getStatusContaApagar(codConta : string) : smallint;
var
 q : TIBquery;
begin
 q := TIBquery.create(self);
 q.database:= dm.dbrestaurante;
 q.transaction:= dm.transacao;

 q.active:=false;
 q.sql.clear;
 q.sql.add('select * from contas_a_pagar where codigo='+Quotedstr(codConta));
 q.Active:=true;
 q.active:=true;
 result :=  q.FieldByName('status').Value ;


 FreeAndNil(q);
end;


function Tfrm_modelo_vazio.getEstoqueAtualItemEstoque(cod_item : string) : double;
var
 q : TIBquery;
begin
 q := TIBquery.create(self);
 q.database:= dm.dbrestaurante;
 q.transaction:= dm.transacao;

 q.active:=false;
 q.sql.clear;
 q.sql.add('select estoque_total from v_itens_estoque where cod_item='+Quotedstr(cod_item));
 q.Active:=true;
 q.active:=true;
 result := q.fieldbyname('estoque_total').value;
 FreeAndNil(q);
end;


function Tfrm_modelo_vazio.getCodUnidadeEntradaItemEstoque(cod_item : string) : string;
var
 q : TIBquery;
begin
 q := TIBquery.create(self);
 q.database:= dm.dbrestaurante;
 q.transaction:= dm.transacao;

 q.active:=false;
 q.sql.clear;
 q.sql.add('select cod_un_entrada from v_itens_estoque where cod_item='+Quotedstr(cod_item));
 q.Active:=true;
 q.active:=true;
 result := q.fieldbyname('cod_un_entrada').value;
 FreeAndNil(q);
end;



function Tfrm_modelo_vazio.getCodEntradaNotaFiscal(codFornecedor : string; numeroNota : string) : string;
var
 q : TIBQuery;
begin

  numeroNota    := formatFloat('000000000000000',StrToInt(numeroNota));
  codFornecedor := formatFloat('0000',StrToInt(codFornecedor));
  q := TIBQuery.Create(self);
  q.Database := dm.dbrestaurante;
  q.Transaction := dm.transacao;
  q.Active:=false;
  q.sql.add(' select * from entradas where cod_fornecedor='+QuotedStr(codFornecedor) +' and numero_nota='+Quotedstr(numeroNota));
  q.Active:=true;
  result := q.fieldbyname('cod_entrada').value;

  q.Active:=false;
  FreeAndNil(q); 
end;


function Tfrm_modelo_vazio.getCodEntradaNotaFiscalSaida(numeroNota : string) : string;
var
 q : TIBQuery;
begin
  q := TIBQuery.Create(self);
  q.Database := dm.dbrestaurante;
  q.Transaction := dm.transacao;
  q.Active:=false;
  q.sql.add(' select * from saidas where numero_nota='+Quotedstr(formatFloat('000000000000000',StrToFloat(numeroNota))));
  q.Active:=true;
  result := q.fieldbyname('cod_saida').value;

  q.Active:=false;
  FreeAndNil(q); 
end;





function Tfrm_modelo_vazio.verificaExistenciaClienteDelivery(codCli : string) : boolean;
var
 q : TIBquery;
begin
 q := TIBquery.create(self);
 q.database:= dm.dbrestaurante;
 q.transaction:= dm.transacao;

 q.active:=false;
 q.sql.clear;
 q.sql.add('select codigo from clientes_delivery where codigo='+Quotedstr(codCli));
 q.Active:=true;

 q.active:=true;
 result := not q.isEmpty;
 FreeAndNil(q);
end;


function Tfrm_modelo_vazio.verificaExistenciaClienteDeliveryPorTelefone(telefone : string) : boolean;
var
 q : TIBquery;
begin
 q := TIBquery.create(self);
 q.database:= dm.dbrestaurante;
 q.transaction:= dm.transacao;

 q.active:=false;
 q.sql.clear;
 q.sql.add('select codigo from clientes_delivery where telefone='+Quotedstr(telefone)+' or celular='+Quotedstr(telefone));
 q.Active:=true;

 q.active:=true;
 result := not q.isEmpty;
 FreeAndNil(q);
end;


function Tfrm_modelo_vazio.getCodClienteDeliveryPorTelefone(telefone : string) : string;
var
 q : TIBquery;
begin
 q := TIBquery.create(self);
 q.database:= dm.dbrestaurante;
 q.transaction:= dm.transacao;

 q.active:=false;
 q.sql.clear;
 q.sql.add('select codigo from clientes_delivery where telefone='+Quotedstr(telefone)+' or celular='+Quotedstr(telefone));
 q.Active:=true;
 result := q.fieldbyname('codigo').value;
 FreeAndNil(q);
end;





function Tfrm_modelo_vazio.verificaExistenciaGrupoFonecedor(cod_grupo_fornecedor : string) : boolean;
var
 q : TIBquery;
begin
 q := TIBquery.create(self);
 q.database:= dm.dbrestaurante;
 q.transaction:= dm.transacao;

 q.active:=false;
 q.sql.clear;
 q.sql.add(' select  gf.codigo from grupo_fornecedor gf where gf.codigo='+Quotedstr(cod_grupo_fornecedor));
 q.active:=true;
 result := not q.isEmpty;
 FreeAndNil(q); 
end;

function Tfrm_modelo_vazio.verificaExistenciaCidade(cod_cidade : string) : boolean;
var
 q : TIBquery;
begin
 q := TIBquery.create(self);
 q.database:= dm.dbrestaurante;
 q.transaction:= dm.transacao;

 q.active:=false;
 q.sql.clear;
 q.sql.add(' select c.cod_cidade from cidade c where cod_cidade='+Quotedstr(cod_cidade));
 q.active:=true;
 result := not q.isEmpty;

 FreeAndNil(q); 
end;

function Tfrm_modelo_vazio.verificaExistenciaEstado(cod_estado : string) : boolean;
var
 q : TIBquery;
begin
 q := TIBquery.create(self);
 q.database:= dm.dbrestaurante;
 q.transaction:= dm.transacao;

 q.active:=false;
 q.sql.clear;
 q.sql.add(' select e.codigo from estado e where e.codigo='+Quotedstr(cod_estado));
 q.active:=true;
 result := not q.isEmpty;

 FreeAndNil(q); 
end;



function Tfrm_modelo_vazio.verificaExistenciaFornecedor(cod_fornecedor : string) : boolean;
var
 q : TIBquery;
begin
 q := TIBquery.create(self);
 q.database:= dm.dbrestaurante;
 q.transaction:= dm.transacao;

 q.active:=false;
 q.sql.clear;
 q.sql.add(' select f.cod_fornecedor from fornecedor f where f.cod_fornecedor='+Quotedstr(cod_fornecedor));
   q.active:=true;
 result := not q.isEmpty;
 FreeAndNil(q);
end;



function Tfrm_modelo_vazio.getCNPJFornecedor(cod_fornecedor : string) : string;
var
 q : TIBquery;
begin
 q := TIBquery.create(self);
 q.database:= dm.dbrestaurante;
 q.transaction:= dm.transacao;

 q.active:=false;
 q.sql.clear;
 q.sql.add(' select f.CGC_CPF from fornecedor f where f.cod_fornecedor='+Quotedstr(cod_fornecedor));
   q.active:=true;
 result := trim(q.fieldbyname('CGC_CPF').Value);
 FreeAndNil(q);
end;


function Tfrm_modelo_vazio.getCodFornecedorViaCNPJ(cnpj : string) : string;
var
 q : TIBquery;
begin
 q := TIBquery.create(self);
 q.database:= dm.dbrestaurante;
 q.transaction:= dm.transacao;

 q.active:=false;
 q.sql.clear;
 q.sql.add(' select f.cod_fornecedor from fornecedor f where  f.CGC_CPF='+Quotedstr(cnpj));
 q.active:=true;

 if q.IsEmpty  then
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




function Tfrm_modelo_vazio.verificaExistenciaProdutoCodigosEntrada(cod_fornecedor : string; cod_produto : string) : Boolean;
var
 q : TIBquery;
begin
 q := TIBquery.create(self);
 q.database:= dm.dbrestaurante;
 q.transaction:= dm.transacao;

 q.active:=false;
 q.sql.clear;
 q.sql.add(' select cod_prod_sistema  from codigos_entrada_fornecedor where cod_prod_fornecedor='+Quotedstr(cod_produto)+' and cod_fornecedor='+Quotedstr(cod_fornecedor));
 q.active:=true;
 if q.IsEmpty then
  Result := false
 else
  Result := true;


 FreeAndNil(q);
end;

















function Tfrm_modelo_vazio.verificaExistenciaFornecedorCNPJ(cnpjFornecedor : string) : boolean;
var
 q : TIBquery;
begin
 q := TIBquery.create(self);
 q.database:= dm.dbrestaurante;
 q.transaction:= dm.transacao;

 q.active:=false;
 q.sql.clear;
 q.sql.add(' select f.cod_fornecedor from fornecedor f where f.CGC_CPF='+Quotedstr(trim(cnpjFornecedor)));
 q.active:=true;
 result := not q.isEmpty;
 FreeAndNil(q);
end;




function Tfrm_modelo_vazio.verificaExistenciaBairro(codBairro : string) : boolean;
var
 q : TIBquery;
begin
 q := TIBquery.create(self);
 q.database:= dm.dbrestaurante;
 q.transaction:= dm.transacao;

 q.active:=false;
 q.sql.clear;
 q.sql.add(' select * from bairro where codigo='+codBairro);
   q.active:=true;
 result := not q.isEmpty;
 FreeAndNil(q);
end;



function Tfrm_modelo_vazio.verificaExistenciaGrupo(cod_grupo : string) : boolean;
var
 q : TIBquery;
begin
 q := TIBquery.create(self);
 q.database:= dm.dbrestaurante;
 q.transaction:= dm.transacao;

 q.active:=false;
 q.sql.clear;
 q.sql.add(' select g.cod_grupo from grupos g where g.cod_grupo='+Quotedstr(cod_grupo));
   q.active:=true;

 result := not q.isEmpty;
 FreeAndNil(q);
end;



function Tfrm_modelo_vazio.verificaExistenciaGrupoRD(codGrupoRD : string) : boolean;
var
 q : TIBquery;
begin
 q := TIBquery.create(self);
 q.database:= dm.dbrestaurante;
 q.transaction:= dm.transacao;

 q.active:=false;
 q.sql.clear;
 q.sql.add(' select g.cod_grupo from grupos_rd g where g.cod_grupo='+Quotedstr(codGrupoRD));
   q.active:=true;

 result := not q.isEmpty;
 FreeAndNil(q);
end;





function Tfrm_modelo_vazio.verificaExistenciaMiniPrinter(cod_miniPrinter : string) : boolean;
var
 q : TIBquery;
begin
 q := TIBquery.create(self);
 q.database:= dm.dbrestaurante;
 q.transaction:= dm.transacao;

 q.active:=false;
 q.sql.clear;
 q.sql.add(' select * from miniprinters where cod_miniprinter='+Quotedstr(cod_miniPrinter));
 q.active:=true;
 result := not q.isEmpty;

 FreeAndNil(q); 
end;

function Tfrm_modelo_vazio.verificaExistenciaPedidoDelivery(codPedido : string) : boolean;
var
 q : TIBquery;
begin
 q := TIBquery.create(self);
 q.database:= dm.dbrestaurante;
 q.transaction:= dm.transacao;

 q.active:=false;
 q.sql.clear;
 q.sql.add(' select * from pedidos_delivery where codigo='+Quotedstr(codPedido));
 q.active:=true;
 result := not q.isEmpty;

 FreeAndNil(q);
end;


function Tfrm_modelo_vazio.verificaStatusPedidoDelivery(codPedido : string) : smallint;
var
 q : TIBquery;
begin
 q := TIBquery.create(self);
 q.database:= dm.dbrestaurante;
 q.transaction:= dm.transacao;

 q.active:=false;
 q.sql.clear;
 q.sql.add(' select * from pedidos_delivery where codigo='+Quotedstr(codPedido));
 q.active:=true;
 result := q.fieldbyname('status').value;

 FreeAndNil(q);
end;


procedure Tfrm_modelo_vazio.bloqueiaMesa(mesa : string);
var
  ts: TIBTransaction;
  qryBloqMesa : TIBQuery;

begin
  ts      :=   TIBTransaction.Create(self);
  ts.DefaultDatabase   :=  dm.dbrestaurante;
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
       qryBloqMesa.SQL.Add('execute procedure bloqueia_mesa('+Quotedstr(mesa)+','+QuotedStr(codigo_usuario)+')');
       dm.adicionaLog('Bloqueia a mesa '+mesa);
       dm.adicionaLog(qryBloqMesa.SQL.Text);
       qryBloqMesa.ExecSQL;
       ts.Commit;
     finally
//       qryBloqMesa.Active := false;
       FreeAndNil(qryBloqMesa);
       ts.Active := false;
       FreeAndNil(ts);
     end;
  except
    on E : Exception  do
            begin
                dm.adicionaLog('Ocorreu erro ao bloquear a mesa:  '+E.Message);
            end;
  end;

end;


function Tfrm_modelo_vazio.verificaMesaTemExtrato(mesa : string) : boolean;
var
 q : TIBquery;
begin
 q := TIBquery.create(self);
 q.database:= dm.dbrestaurante;
 q.transaction:= dm.transacao;

 q.sql.clear;
 q.sql.add('select * from extratos_emitidos where mesa='+Quotedstr(mesa));
 q.Active:=true;
 result:= not q.IsEmpty;

 FreeAndNil(q);
end;



function Tfrm_modelo_vazio.getEstadoCartao(cartao : string) : integer;
var
 q : TIBquery;
begin
 q := TIBquery.create(self);
 q.database:= dm.dbrestaurante;
 q.transaction:= dm.transacao;

 q.sql.clear;
 q.sql.add('select status,cod_cli from cartoes where cod_cartao='+Quotedstr(cartao));
 q.Active:=true;


  case q.FieldByName('status').Value of
  0 : begin
        result:=0;
      end;
  1: begin
//     dm.exibe_painel_erro('Este(a) cartão não pode mais ser utilizado no dia corrente.','Ok');
       Result:=1;
     end;
  2: begin
//     dm.exibe_painel_erro('Cartão BLOQUEADO para uso!','OK');
       Result:=2;
     end;
  3: begin
//     dm.exibe_painel_erro('Cartão não efetuou check-in!','OK');
       Result:=3;
     end;
 end;
 FreeAndNil(q);
end;





function Tfrm_modelo_vazio.verificaStatusCartao(cartao : string) : boolean;
var
 q : TIBquery;
begin
 q := TIBquery.create(self);
 q.database:= dm.dbrestaurante;
 q.transaction:= dm.transacao;

 q.sql.clear;
 q.sql.add('select status,cod_cli from cartoes where cod_cartao='+Quotedstr(cartao));
 q.Active:=true;
 Result:=false;

 case q.FieldByName('status').Value of
  0 : begin
        Result:=true
      end;
  1: begin
       dm.exibe_painel_erro('CARTÃO JÁ FOI PAGO!','Ok');
       Result:=false;
     end;
  2: begin
       dm.exibe_painel_erro('CARTÃO  BLOQUEADO POR EXTRAVIOO'+#13#10+' CONTACTAR A GERÊNCIA!','OK');
       Result:=false;
     end;
  3: begin
       dm.exibe_painel_erro('CARTÃO NÃO EFETUOU CHECK-IN (ENTRADA)','OK');
       Result:=false;
     end;
 end;
 FreeAndNil(q);
end;


function Tfrm_modelo_vazio.verificaStatusCartaoParaLiberacao(cartao : string) : boolean;
var
 q : TIBquery;
begin
 q := TIBquery.create(self);
 q.database:= dm.dbrestaurante;
 q.transaction:= dm.transacao;

 q.sql.clear;
 q.sql.add('select status,cod_cli from cartoes where cod_cartao='+Quotedstr(cartao));
 q.Active:=true;
 Result:=false;

 try
  begin


 case q.FieldByName('status').Value of
  0 : begin
        Result:=false;
      end;
  1: begin
       Result:=true;
     end;
  2: begin
       Result:=false;
     end;
  3: begin
       Result:=false;
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



function Tfrm_modelo_vazio.verificaStatusCartaoNoCheckin(cartao : string) : boolean;
var
 q : TIBquery;
begin
 q := TIBquery.create(self);
 q.database:= dm.dbrestaurante;
 q.transaction:= dm.transacao;

 q.sql.clear;
 q.sql.add('select status,cod_cli from cartoes where cod_cartao='+Quotedstr(cartao));
 q.Active:=true;

 Result:=false;

 case q.FieldByName('status').Value of
  0 : begin
       dm.exibe_painel_erro('CARTÃO JÁ ESTÁ EM USO!','Ok');
       Result:=false;
      end;
  1: begin
       dm.exibe_painel_erro('CARTÃO JÁ FOI UTILIZADO E PAGO!','Ok');
       Result:=false;
     end;
  2: begin
       dm.exibe_painel_erro('CARTÃO BLOQUEADO POR EXTRAVIO '+#13#10+' CONTACTAR A GERÊNCIA!','OK');
       Result:=false;
     end;    
  3: begin
       Result:=true;
    end;
 end;

 FreeAndNil(q); 
end;



function Tfrm_modelo_vazio.verificaSeCartaoEstaSendoUtilizado(cartao : string) : boolean;
var
 q : TIBquery;
begin
 q := TIBquery.create(self);
 q.database:= dm.dbrestaurante;
 q.transaction:= dm.transacao;

 q.sql.clear;
 q.sql.add('select cod_cli from cartoes where cod_cartao='+Quotedstr(cartao));
 q.Active:=true;

 if (q.FieldByName('cod_cli').IsNull) then
  begin
    Result:=false;
  end
 else
   result:=true;

 FreeAndNil(q); 
end;



function Tfrm_modelo_vazio.verificaEquivalenciaUnidades(cod_un1: string; cod_un2 : string) : boolean;
var
 q,q1 : TIBquery;
begin
 q := TIBquery.create(self);
 q.database:= dm.dbrestaurante;
 q.transaction:= dm.transacao;
 q.SQL.Clear;
 q.sql.add('select * from unidades where cod_unidade='+QUotedstr(cod_un1));
 q.active:=true;

 q1 := TIBquery.create(self);
 q1.database:= dm.dbrestaurante;
 q1.transaction:= dm.transacao;
 q1.SQL.Clear;
 q1.sql.add('select * from unidades where cod_unidade='+QUotedstr(cod_un2));
 q1.active:=true;

 if ( q.FieldByName('cod_padrao').value <>  q1.FieldByName('cod_padrao').value) then
  result:=false
 else
  result:=true;

 FreeAndNil(q); 
end;


function Tfrm_modelo_vazio.verificaProdutoRequerObservacao(cod_produto: string) : boolean;
var
 q : TIBquery;
begin
 q := TIBquery.create(self);
 q.database:= dm.dbrestaurante;
 q.transaction:= dm.transacao;

 q.active:=false;
 q.sql.clear;
 q.sql.add(' select cod_produto, obs_lancamento from produtos  ');
 q.sql.add(' where  cod_produto='+QuotedStr(cod_produto));
 q.active:=true;
 if (q.FieldByName('obs_lancamento').Value =0 ) then
  result:=false
 else
  result:=true;

 FreeAndNil(q); 
end;


function Tfrm_modelo_vazio.verificaSeProdutoLeQuantidadeDaBalanca(codigo : string; tipoCodigo : smallint) : boolean;
var
 q : TIBquery;
begin
 q := TIBquery.create(self);
 q.database:= dm.dbrestaurante;
 q.transaction:= dm.transacao;

 q.active:=false;
 q.sql.clear;
 q.sql.add(' select cod_produto, balanca from produtos  ');
 if (tipoCodigo = 1 ) then
   q.sql.add(' where  cod_produto='+QuotedStr(codigo))
 else
   q.sql.add(' where  cod_barras='+QuotedStr(codigo));

 q.active:=true;
 if (q.FieldByName('balanca').Value =0 ) then
  result:=false
 else
  result:=true;

 FreeAndNil(q);  

end;


function Tfrm_modelo_vazio.getBalancaLeitura(codigo : string; tipoCodigo : smallint) : smallint;
var
 q : TIBquery;
begin
 q := TIBquery.create(self);
 q.database:= dm.dbrestaurante;
 q.transaction:= dm.transacao;

 q.active:=false;
 q.sql.clear;
 q.sql.add(' select cod_produto, BALANCA_LEITURA from produtos  ');
 if (tipoCodigo = 1 ) then
   q.sql.add(' where  cod_produto='+QuotedStr(codigo))
 else
   q.sql.add(' where  cod_barras='+QuotedStr(codigo));

 q.Active:=true;
 result := q.fieldbyname('BALANCA_LEITURA').value;
 FreeAndNil(q);

end;



function Tfrm_modelo_vazio.verificaSeProdutoEhPizza(codigo : string; tipoCodigo : smallint) : boolean;
var
 q : TIBquery;
begin
 q := TIBquery.create(self);
 q.database:= dm.dbrestaurante;
 q.transaction:= dm.transacao;

 q.active:=false;
 q.sql.clear;
 q.sql.add(' select cod_produto, pizza from produtos  ');
 if (tipoCodigo = 1 ) then
   q.sql.add(' where  cod_produto='+QuotedStr(codigo))
 else
   q.sql.add(' where  cod_barras='+QuotedStr(codigo));

 q.active:=true;
 if (q.FieldByName('pizza').Value =0 ) then
  result:=false
 else
  result:=true;

 FreeAndNil(q);

end;





function Tfrm_modelo_vazio.verificaSeProdutoRequerObservacao(codigo : string; tipoCodigo : smallint) : boolean;
var
 q : TIBquery;
begin
 q := TIBquery.create(self);
 q.database:= dm.dbrestaurante;
 q.transaction:= dm.transacao;

 q.active:=false;
 q.sql.clear;
 q.sql.add(' select cod_produto, requer_observacao from produtos  ');
 if (tipoCodigo = 1 ) then
   q.sql.add(' where  cod_produto='+QuotedStr(codigo))
 else
   q.sql.add(' where  cod_barras='+QuotedStr(codigo));

 q.active:=true;
 if (q.FieldByName('requer_observacao').Value =0 ) then
  result:=false
 else
  result:=true;

 FreeAndNil(q);

end;










function Tfrm_modelo_vazio.getValorPizza(codigo : string ; tipoCodigo : integer; tipoVenda : integer) : double;
var
 q : TIBquery;
 tamanho : string;
 maisCaro : double;
 codigoPizzaMaisCara : string;
 valorTemp : double;
 totalSabores : double;
 fatorCorrecaoPreco : double;
 proporcao : double;
begin
 q := TIBquery.create(self);
 q.database:= dm.dbrestaurante;
 q.transaction:= dm.transacao;

 q.active:=false;
 q.sql.clear;
 q.sql.add(' select cod_produto, tam_pizza from produtos  ');
 if (tipoCodigo = 1 ) then
   q.sql.add(' where  cod_produto='+QuotedStr(codigo))
 else
   q.sql.add(' where  cod_barras='+QuotedStr(codigo));

 q.active:=true;
 tamanho:= q.fieldbyname('tam_pizza').value;

 if tipoVenda = 1 then
    tamanho:= q.fieldbyname('tam_pizza').value+'BALCAO'
 else
    tamanho:= q.fieldbyname('tam_pizza').value+'DELIVERY';


 maisCaro := 0;
 totalSabores := 0;

 dm.tbSaboresPizzaTemp.First;

 if ( pizzaValorProporcional = false ) then
  begin
    while not dm.tbSaboresPizzaTemp.Eof do
     begin
        q.Active:=false;
        q.sql.clear;
        q.sql.add('select * from sabores_pizza where codigo='+Quotedstr(dm.tbSaboresPizzaTempcodigo.Value));
        q.Active:=true;

        valorTemp    :=getValorProduto(q.FieldByName(tamanho).Value,1);
        if (valorTemp > maisCaro) then
          begin
            maisCaro     := valorTemp;
            totalSabores := maisCaro;
          end;
        dm.tbSaboresPizzaTemp.Next;
     end;
         {
     proporcao := (1 / dm.tbSaboresPizzaTemp.RecordCount);
     fatorCorrecaoPreco :=  maisCaro - (proporcao *  maisCaro);
     fatorCorrecaoPreco := fatorCorrecaoPreco  / proporcao;
     maisCaro := (maisCaro * proporcao) + (fatorCorrecaoPreco * proporcao);
     maisCaro := RoundABNT(maisCaro,2);
     totalSabores := maisCaro * proporcao;
          }

  end;

  dm.tbSaboresPizzaTemp.First;
 while not dm.tbSaboresPizzaTemp.Eof do
  begin
    q.Active:=false;
    q.sql.clear;
    q.sql.add('select * from sabores_pizza where codigo='+Quotedstr(dm.tbSaboresPizzaTempcodigo.Value));
    q.Active:=true;
    dm.tbSaboresPizzaTemp.Edit;

    if ( pizzaValorProporcional  = true )  then
       begin
         valorTemp :=  getValorProduto(q.FieldByName(tamanho).Value,1);
         dm.tbSaboresPizzaTempvalorSabor.Value        := valorTemp;
         valorTemp :=  RoundABNT( (valorTemp * dm.tbSaboresPizzaTempproporcao.Value), 2);
         totalSabores := valorTemp + totalSabores;
       end
    else
     begin
        dm.tbSaboresPizzaTempvalorSabor.Value        := maisCaro;
     end;


    dm.tbSaboresPizzaTempcodProduto.Value        :=  q.FieldByName(tamanho).Value;
    dm.tbSaboresPizzaTemp.Post;
    dm.tbSaboresPizzaTemp.Next;
  end;



 q.Active:=false;
 FreeAndNil(q);

 Result := totalSabores;
end;




function Tfrm_modelo_vazio.verificaProdutoRequerInformacaoSabor(cod_produto: string) : boolean;
var
 q : TIBquery;
begin
 q := TIBquery.create(self);
 q.database:= dm.dbrestaurante;
 q.transaction:= dm.transacao;

 q.active:=false;
 q.sql.clear;
 q.sql.add(' select cod_produto, informar_sabor from produtos  ');
 q.sql.add(' where  cod_produto='+QuotedStr(cod_produto));
 q.active:=true;
 if (q.FieldByName('informar_sabor').Value =0 ) then
  result:=false
 else
  result:=true;

  FreeAndNil(q); 

end;



function Tfrm_modelo_vazio.verificaExistenciaHistorico(cod_historico : string) : boolean;
var
 q : TIBquery;
begin
 q := TIBquery.create(self);
 q.database:= dm.dbrestaurante;
 q.transaction:= dm.transacao;

 q.active:=false;
 q.sql.clear;
 q.sql.add(' select h.cod_historico from historico_caixa h where h.cod_historico='+Quotedstr(cod_historico));
 q.active:=true;

 result := not q.isEmpty;
 FreeAndNil(q); 
end;



function  Tfrm_modelo_vazio.verificaSeCaixaEstaAberto(codCaixa : string) : boolean;
var
 q : TIBquery;
begin
 q := TIBquery.create(self);
 q.database:= dm.dbrestaurante;
 q.transaction:= dm.transacao;

 q.active:=false;
 q.sql.clear;
 q.sql.add(' select * from caixas where codigo='+Quotedstr(codCaixa));
 q.active:=true;

 if q.IsEmpty then
   Result:=false
 else
  begin
   if q.FieldByName('status').value = 1 then
    result:=true
   else
    result:=false;
  end;

 FreeAndNil(q);
end;




function  Tfrm_modelo_vazio.verificaSeCaixaCobraServico(codCaixa : string) : boolean;

begin


 dm.tb_parametros.Active := true;

 if ( dm.tb_parametrosCOBRA_SERVICO.Value = 0) then
  Result := False
 else
  Result:=True;



end;






function  Tfrm_modelo_vazio.verificaExistenciaFormaPagto(cod_forma : string) : boolean;
var
 q : TIBquery;
begin
 q := TIBquery.create(self);
 q.database:= dm.dbrestaurante;
 q.transaction:= dm.transacao;

 q.active:=false;
 q.sql.clear;
 q.sql.add(' select * from formas_pagamento where cod_forma='+Quotedstr(cod_forma));
 q.active:=true;
 result := not q.isEmpty;

 FreeAndNil(q);
end;

function  Tfrm_modelo_vazio.getCodigoRegistradorFormaPagamento(cod_forma : string) :  string;
var
 q : TIBquery;
begin
 q := TIBquery.create(self);
 q.database:= dm.dbrestaurante;
 q.transaction:= dm.transacao;

 q.active:=false;
 q.sql.clear;
 q.sql.add(' select rp from formas_pagamento where cod_forma='+Quotedstr(cod_forma));
 q.active:=true;
 result := q.fieldbyname('rp').value;

 FreeAndNil(q);
end;

function  Tfrm_modelo_vazio.verificaExistenciaLoja(codLoja : string) : boolean;
var
 q : TIBquery;
begin
 q := TIBquery.create(self);
 q.database:= dm.dbrestaurante;
 q.transaction:= dm.transacao;

 q.active:=false;
 q.sql.clear;
 q.sql.add(' select * from empresas_grupo where codigo='+Quotedstr(codLoja));
 q.active:=true;
 result := not q.isEmpty;   
 FreeAndNil(q);
end;


function  Tfrm_modelo_vazio.verificaExistenciaTipoDeCliente(cod_tipo_cliente : string) : boolean;
var
 q : TIBquery;
begin
 q := TIBquery.create(self);
 q.database:= dm.dbrestaurante;
 q.transaction:= dm.transacao;

 q.active:=false;
 q.sql.clear;
 q.sql.add(' select * from tipos_cliente where cod_tipo='+Quotedstr(cod_tipo_cliente));
 q.active:=true;

 result := not q.isEmpty;
 FreeAndNil(q);
end;


function  Tfrm_modelo_vazio.verificaExistenciaCliente(cod_cliente : string) : boolean;
var
 q : TIBquery;
begin
 q := TIBquery.create(self);
 q.database:= dm.dbrestaurante;
 q.transaction:= dm.transacao;

 q.active:=false;
 q.sql.clear;
 q.sql.add(' select * from clientes where cod_cli='+Quotedstr(cod_cliente));
 q.active:=true;
 result := not q.isEmpty;

 FreeAndNil(q); 
end;



function  Tfrm_modelo_vazio.verificaExistenciaClienteRG(rg : string) : boolean;
var
 q : TIBquery;
begin
 q := TIBquery.create(self);
 q.database:= dm.dbrestaurante;
 q.transaction:= dm.transacao;

 q.active:=false;
 q.sql.clear;
 q.sql.add(' select * from clientes where rg='+Quotedstr(rg));
 q.active:=true;
 result := not q.isEmpty;

 FreeAndNil(q); 
end;





function  Tfrm_modelo_vazio.verificaClienteAtivo(cod_cliente : string) : boolean;
var
 q : TIBquery;
begin
 q := TIBquery.create(self);
 q.database:= dm.dbrestaurante;
 q.transaction:= dm.transacao;

 q.active:=false;
 q.sql.clear;
 q.sql.add(' select * from clientes where cod_cli='+Quotedstr(cod_cliente));
 q.active:=true;

 if ( q.fieldbyname('situacao').Value = 1 ) then
   result:=true
 else
   result:=false;

 FreeAndNil(q); 
end;

function  Tfrm_modelo_vazio.verificaClienteTemCredito(cod_cliente : string; valor_pleiteado : double) : boolean;
var
 q : TIBquery;
 total_debitos : double;
begin
 q := TIBquery.create(self);
 q.database:= dm.dbrestaurante;
 q.transaction:= dm.transacao;

 q.active:=false;
 q.sql.clear;
 q.sql.add(' select sum(valor_fatura) as total from faturas where cod_cli='+Quotedstr(cod_cliente)+' and status=0');
 q.active:=true;

 if (q.IsEmpty = false) then
   if q.fieldbyname('total').Value = null then
    total_debitos:=0
   else
   total_debitos:=q.fieldbyname('total').Value
 else
   total_debitos:=0;

 q.active:=false;
 q.sql.clear;
 q.sql.add(' select credito from clientes where cod_cli='+QUotedstr(cod_cliente));
 q.active:=true;

 if ( (total_debitos + valor_pleiteado) > q.fieldbyname('credito').value ) then
   Result:=false
 else
   Result:=true;

 FreeAndNil(q); 
end;






function Tfrm_modelo_vazio.verificaFormaPagamentoFaturada(cod_forma : string) : boolean;
var
 q : TIBquery;
 total_debitos : double;
begin
 q := TIBquery.create(self);
 q.database:= dm.dbrestaurante;
 q.transaction:= dm.transacao;

 q.active:=false;
 q.sql.clear;
 q.sql.add(' select tipo from formas_pagamento='+Quotedstr(cod_forma));
 q.active:=true;

 if q.FieldByName('tipo').Value = 2 then
   Result:=true
 else
   Result:=false;

 FreeAndNil(q); 
end;

function Tfrm_modelo_vazio.verificaFormaPagamentoSolicitaDados(cod_forma : string) : boolean;
var
 q : TIBquery;
 total_debitos : double;
begin
 q := TIBquery.create(self);
 q.database:= dm.dbrestaurante;
 q.transaction:= dm.transacao;
 

 q.active:=false;
 q.sql.clear;
 q.sql.add(' select SOLICITAR_DADOS_CARTAO from formas_pagamento where cod_forma='+Quotedstr(cod_forma));
 q.active:=true;

 if q.FieldByName('SOLICITAR_DADOS_CARTAO').Value = 1 then
   Result:=true
 else
   Result:=false;

 FreeAndNil(q); 
end;






function  Tfrm_modelo_vazio.verificaExistenciaMetre(cod_garcon : string) : boolean;
var
 q : TIBquery;
begin
 q := TIBquery.create(self);
 q.database:= dm.dbrestaurante;
 q.transaction:= dm.transacao;

 q.active:=false;
 q.sql.clear;
 q.sql.add(' select cod_garcon from garcons where cod_garcon='+Quotedstr(cod_garcon)+' and metre=1');
 q.active:=true;

 if q.isEmpty then Result:=false else Result:=true;
 FreeAndNil(q); 
end;

function  Tfrm_modelo_vazio.verificaExistenciaGarconMetre(cod_garcon : string) : boolean;
var
 q : TIBquery;
begin
 q := TIBquery.create(self);
 q.database:= dm.dbrestaurante;
 q.transaction:= dm.transacao;

 q.active:=false;
 q.sql.clear;
 q.sql.add(' select cod_garcon from garcons where cod_garcon='+Quotedstr(cod_garcon)+' and cod_garcon <>'+Quotedstr('000'));
 q.active:=true;

 result := not q.isEmpty;
 FreeAndNil(q);
end;



function  Tfrm_modelo_vazio.verificaExistenciaGrupoTouch(codGrupo : string) : boolean;
var
 q : TIBquery;
begin
 q := TIBquery.create(self);
 q.database:= dm.dbrestaurante;
 q.transaction:= dm.transacao;

 q.active:=false;
 q.sql.clear;
 q.sql.add(' select * from grupos_touch where codigo='+Quotedstr(codGrupo));
 q.active:=true;

 result := not q.isEmpty;
 FreeAndNil(q);
end;



function  Tfrm_modelo_vazio.verificaExistenciaPromoter(codPromoter : string) : boolean;
var
 q : TIBquery;
begin
 q := TIBquery.create(self);
 q.database:= dm.dbrestaurante;
 q.transaction:= dm.transacao;

 q.active:=false;
 q.sql.clear;
 q.sql.add(' select cod_promoter from promoters where cod_promoter='+Quotedstr(codPromoter));
 q.active:=true;

 result := not q.isEmpty;
 FreeAndNil(q);
end;



function  Tfrm_modelo_vazio.verificaExistenciaDepartamento(codDepartamento : string) : boolean;
var
 q : TIBquery;
begin
 q := TIBquery.create(self);
 q.database:= dm.dbrestaurante;
 q.transaction:= dm.transacao;

 q.active:=false;
 q.sql.clear;
 q.sql.add(' select codigo from departamentos where codigo='+codDepartamento);
 q.active:=true;

 result := not q.isEmpty;
 FreeAndNil(q);
end;



function  Tfrm_modelo_vazio.verificaExistenciaGuarnicao(codGuarnicao : string) : boolean;
var
 q : TIBquery;
begin
 q := TIBquery.create(self);
 q.database:= dm.dbrestaurante;
 q.transaction:= dm.transacao;

 q.active:=false;
 q.sql.clear;
 q.sql.add(' select codigo from guarnicoes where codigo='+Quotedstr(codGuarnicao));
 q.active:=true;

 result := not q.isEmpty;
 FreeAndNil(q);
end;




function  Tfrm_modelo_vazio.verificaExistenciaEntregador(codEntregador : string) : boolean;
var
 q : TIBquery;
begin
 q := TIBquery.create(self);
 q.database:= dm.dbrestaurante;
 q.transaction:= dm.transacao;

 q.active:=false;
 q.sql.clear;
 q.sql.add(' select codigo from entregadores where codigo='+Quotedstr(codEntregador));
 q.active:=true;

 result := not q.isEmpty;
 FreeAndNil(q);
end;






function  Tfrm_modelo_vazio.verificaExistenciaTipoSangria(codTipo : string) : boolean;
var
 q : TIBquery;
begin
 q := TIBquery.create(self);
 q.database:= dm.dbrestaurante;
 q.transaction:= dm.transacao;

 q.active:=false;
 q.sql.clear;
 q.sql.add(' select * from tipos_sangria where codigo='+Quotedstr(codTipo));
 q.active:=true;

 result := not q.isEmpty;
 FreeAndNil(q); 
end;

function  Tfrm_modelo_vazio.verificaExistenciaMotivoEstorno(codMotivo : string) : boolean;
var
 q : TIBquery;
begin
 q := TIBquery.create(self);
 q.database:= dm.dbrestaurante;
 q.transaction:= dm.transacao;

 q.active:=false;
 q.sql.clear;
 q.sql.add(' select * from motivos_estornos where codigo='+Quotedstr(codMotivo));
 q.active:=true;

 result := not q.isEmpty;
 FreeAndNil(q);
end;



function  Tfrm_modelo_vazio.verificaExistenciaObservacaoPreparo(codObs: string) : boolean;
var
 q : TIBquery;
begin
 q := TIBquery.create(self);
 q.database:= dm.dbrestaurante;
 q.transaction:= dm.transacao;

 q.active:=false;
 q.sql.clear;
 q.sql.add(' select * from observacoes_padrao where cod_obs='+Quotedstr(codObs));
 q.active:=true;

 result := not q.isEmpty;
 FreeAndNil(q);
end;


function  Tfrm_modelo_vazio.verificaExistenciaTipoDeBaixa(codTipo: string) : boolean;
var
 q : TIBquery;
begin
 q := TIBquery.create(self);
 q.database:= dm.dbrestaurante;
 q.transaction:= dm.transacao;

 q.active:=false;
 q.sql.clear;
 q.sql.add(' select * from tipos_baixa  where cod_tipo='+Quotedstr(codTipo));
 q.active:=true;

 result := not q.isEmpty;
 FreeAndNil(q);
end;







function Tfrm_modelo_vazio.verificaExistenciaUnidade(cod_unidade : string) : boolean;
var
 q : TIBquery;
begin
 q := TIBquery.create(self);
 q.database:= dm.dbrestaurante;
 q.transaction:= dm.transacao;

 q.active:=false;
 q.sql.clear;
 q.sql.add(' select cod_unidade from unidades where cod_unidade='+Quotedstr(cod_unidade));
 q.active:=true;

 result := not q.isEmpty;
 FreeAndNil(q); 
end;

function Tfrm_modelo_vazio.verificaExistenciaCentroDeCusto(cod_c_custo : string) : boolean;
var
 q : TIBquery;
begin
 q := TIBquery.create(self);
 q.database:= dm.dbrestaurante;
 q.transaction:= dm.transacao;

 q.active:=false;
 q.sql.clear;
 q.sql.add(' select  c.cod_conta from plano_contas_financeiro c  where c.cod_conta='+Quotedstr(cod_c_custo));
 q.active:=true;
 result := not q.isEmpty;

 FreeAndNil(q); 
end;

function  Tfrm_modelo_vazio.verificaCentroDeCustoAnalitico(cod_c_custo : string) : boolean;
begin
  if  Length(cod_c_custo) < 6 then
   result:=false
  else
   Result:=true;
end;
procedure Tfrm_modelo_vazio.Edit1Exit(Sender: TObject);
var
 auxiliar : string;
 moduloVenda : string;
 tamanhoPizza : string;

begin
  if sender is TCustomEdit then
   begin
      (sender as TCustomEdit).Brush.Color := clWhite;
      (sender as TCustomEdit).Repaint;
   end;


  if sender is Tdbgrid then
   begin
     (sender as TDBGrid).Color := clWhite;
     (sender as TDBGrid).Repaint;
   end;


  if sender is TcxLookupComboBox  then
    begin
      (sender as TcxLookupComboBox).DroppedDown  := false;
      (sender as TcxLookupComboBox).Style.Color := cor_ao_sair;
    end;



  if  sender is TCustomEdit and ((sender as TCustomEdit).Name='edChaveNFE') then
   begin
     if((sender is TCustomEdit and ( trim( (sender as TCustomEdit).text)='')) ) then
       begin
          Exit;
       end
     else
      begin


        if (ValidarChaveNFe( (sender as TCustomEdit).text) = false) then
         begin
           ShowMessage('Chave da NF-E informada não é válida!');
           (sender as TCustomEdit).Clear;
           (sender as TCustomEdit).SelectAll;
           (sender as TCustomEdit).SetFocus;
         end;
      end;

   end;




 if  sender is TCustomEdit and ((sender as TCustomEdit).Name='edMesa') then
 begin
   if((sender is TCustomEdit and ( trim( (sender as TCustomEdit).text)='')) ) then
          Exit;

  try
    begin
      auxiliar:=FormatFloat('0000',StrToFloat( (sender as TCustomEdit).text  ));
      (sender as TCustomEdit).text := auxiliar;
    end;

  except
   begin
     ShowMessage('Número da mesa inválido!');
    (sender as TCustomEdit).Clear;
    (sender as TCustomEdit).SetFocus;
     exit;
   end;
  end;
 end;




 if (    (sender is TDBEdit and ((sender as TDBEdit).Name='ed_cod_grupo_fornecedor'))
 or (sender is TEdit and ((sender as TEdit).Name='ed_cod_grupo_fornecedor')) )then
    begin
      if((sender is TDBEdit and ( trim( (sender as TDBEdit).text)=''))    or (sender is TEdit and ( trim( (sender as TEdit).text)=''))   ) then
       exit
      else
        begin
          if  (Sender is TDBEdit) then
             auxiliar:=(sender as TDBEdit).text
          else
             auxiliar:=(sender as TEdit).text;

          try
             auxiliar:=FormatFloat('0000',StrToFloat(auxiliar));
          except
           begin
            showmessage('Código de grupo de fornecedor inválido!');
            if  (Sender is TDBEdit) then
                (sender as TDBEdit).SetFocus
            else
               (sender as TEdit).SetFocus;
            exit;
           end;
          end;
        end;

        if (Sender is TDBEdit) then
           (sender as TDBEdit).Text:=auxiliar
        else
           (sender as TEdit).Text:=auxiliar;


      if verificaExistenciaGrupoFonecedor(auxiliar) then
         exibeInformacoes('ed_cod_grupo_fornecedor','ed_desc_grupo_fornecedor',
         'grupo_fornecedor','codigo,descricao','codigo',auxiliar,1)
      else
        begin
            showmessage('Código de grupo de fornecedor inválido!');
            if  (Sender is TDBEdit) then
                (sender as TDBEdit).SetFocus
            else
               (sender as TEdit).SetFocus;
            exit;

        end;

    end;


 if ( (sender is TCustomEdit and ((sender as TCustomEdit).Name='ed_cod_fornecedor'))) then
    begin
      if((sender is TCustomEdit and ( trim( (sender as TCustomEdit).text)='')) ) then exit;

         auxiliar:=(sender as TCustomEdit).text;
          try
           auxiliar:=FormatFloat('0000',StrToFloat(auxiliar));
          except
           begin
            showmessage('Código de fornecedor !!');
            (sender as TCustomEdit).SetFocus;
            exit;
           end;
          end;
          (sender as TCustomEdit).Text:=auxiliar;

          if (verificaExistenciaFornecedor(trim((sender as TCustomEdit).Text)) = false) then
           begin
              showmessage('Código de fornecedor não existe!');
             (sender as TCustomEdit).SetFocus;
             exit;
           end
          else
           begin
             exibeInformacoesFornecedor(trim((sender as TCustomEdit).Text));
           end;
    end;









  if  (sender is TCustomEdit ) and (    trim(copy((sender as TCustomEdit).Name,0,10)) = 'edCodPizza')     then
    begin
      moduloVenda := copy((sender as TCustomEdit).Name,11,1);
      tamanhoPizza := copy((sender as TCustomEdit).Name,12,3);

      if((sender is TCustomEdit and ( trim( (sender as TCustomEdit).text)='')) ) then exit;

         auxiliar:=(sender as TCustomEdit).text;
          try
           auxiliar:=FormatFloat('00000',StrToFloat(auxiliar));
          except
           begin
            showmessage('Código de produto inválido!');
            (sender as TCustomEdit).SetFocus;
            exit;
           end;
          end;
          (sender as TCustomEdit).Text:=auxiliar;

          if (verificaExistenciaProduto(trim((sender as TCustomEdit).Text),1) = false) then
           begin
             showmessage('Código de produto não existe!');
             (sender as TCustomEdit).SetFocus;
             exit;
           end
          else
           begin
             if verificaSeProdutoEhPizza(trim( (sender as TCustomEdit).text),1) then
              begin
                exibeInformacoesProdutoPizza(trim( (sender as TCustomEdit).text),tamanhoPizza,moduloVenda);
              end
             else
               begin

                if MessageDlg('O produto informado não é uma pizza. Deseja que o sistema ajuste-o automaticamente agora ?',mtConfirmation,[MbYes,mbNo],0) = Mryes then
                 begin
                  dm.qryauxiliar.Active := false;
                  dm.qryauxiliar.SQL.Clear;
                  dm.qryauxiliar.SQL.Add('update produtos set pizza=1 where cod_produto='+Quotedstr(trim( (sender as TCustomEdit).text)));
                  dm.qryauxiliar.ExecSQL;
                 end
                else
                 begin
                  (sender as TCustomEdit).SetFocus;
                   exit;
                 end;
               end;
           end;
    end;









  if ( (sender is TCustomEdit and ((sender as TCustomEdit).Name='edCodBairro'))) then
    begin
      if((sender is TCustomEdit and ( trim( (sender as TCustomEdit).text)='')) ) then exit;

         auxiliar:=(sender as TCustomEdit).text;
          try
           auxiliar:=Inttostr(strToInt(auxiliar));
          except
           begin
            showmessage('Código de Bairro Inválido');
            (sender as TCustomEdit).SetFocus;
            exit;
           end;
          end;
          (sender as TCustomEdit).Text:=auxiliar;

          if (verificaExistenciaBairro(trim((sender as TCustomEdit).Text)) = false) then
           begin
              showmessage('Código de bairro inexistente');
             (sender as TCustomEdit).SetFocus;
             exit;
           end
          else
           begin
             exibeInformacoesBairro( (sender as TCustomEdit).Text );
           end;
    end; 





 if ( (sender is TCustomEdit and ((sender as TCustomEdit).Name='ed_cod_tipo_documento'))) then
    begin

         if trim ((sender as TCustomEdit).text) ='' then exit;


         auxiliar:=(sender as TCustomEdit).text;
          try
           auxiliar:=FormatFloat('000',StrToFloat(auxiliar));
          except
           begin
            showmessage('Código de tipo de documento inválido!');
            (sender as TCustomEdit).SetFocus;
            exit;
           end;
          end;
          (sender as TCustomEdit).Text:=auxiliar;

          if (verificaExistenciaTipoDocumento(trim((sender as TCustomEdit).Text)) = false) then
           begin
              showmessage('Código de tipo de documento não existe!');
             (sender as TCustomEdit).SetFocus;
             exit;
           end
          else
           begin
             exibeInformacoesTiposDocumento(trim((sender as TCustomEdit).Text));
           end;
    end;


 if ( (sender is TCustomEdit and ((sender as TCustomEdit).Name='ed_cod_tipo_entrada'))) then
    begin
         if trim ((sender as TCustomEdit).text) ='' then exit;

         auxiliar:=(sender as TCustomEdit).text;
          try
           auxiliar:=FormatFloat('000',StrToFloat(auxiliar));
          except
           begin
            showmessage('Código de tipo de entrada inválido!');
            (sender as TCustomEdit).SetFocus;
            exit;
           end;
          end;
          (sender as TCustomEdit).Text:=auxiliar;

          if (verificaExistenciaTipoEntrada(trim((sender as TCustomEdit).Text)) = false) then
           begin
              showmessage('Código de tipo de entrada  não existe!');
             (sender as TCustomEdit).SetFocus;
             exit;
           end
          else
           begin
             exibeInformacoesTiposEntrada(trim((sender as TCustomEdit).Text));
           end;
    end;


 if ( (sender is TCustomEdit and ((sender as TCustomEdit).Name='ed_cefop_entradas'))) then
    begin
         if trim ((sender as TCustomEdit).text) ='' then exit;

         auxiliar:=(sender as TCustomEdit).text;
          try
           auxiliar:=FormatFloat('0000',StrToFloat(auxiliar));
          except
           begin
            showmessage('CFOP inválido!');
            (sender as TCustomEdit).SetFocus;
            exit;
           end;
          end;
          (sender as TCustomEdit).Text:=auxiliar;

          if (verificaExistenciaCFOP(trim((sender as TCustomEdit).Text)) = false) then
           begin
              showmessage('CFOP informado  não existe!');
             (sender as TCustomEdit).SetFocus;
             exit;
           end
          else
           begin
             exibeInformacoesCFOPEntrada(trim((sender as TCustomEdit).Text));
           end;
    end;





 if ( (sender is TCustomEdit and ((sender as TCustomEdit).Name='ed_cefop_saidas'))) then
    begin
         if trim ((sender as TCustomEdit).text) ='' then exit;

         auxiliar:=(sender as TCustomEdit).text;
          try
           auxiliar:=FormatFloat('0000',StrToFloat(auxiliar));
          except
           begin
            showmessage('CFOP inválido!');
            (sender as TCustomEdit).SetFocus;
            exit;
           end;
          end;
          (sender as TCustomEdit).Text:=auxiliar;

          if (verificaExistenciaCFOP(trim((sender as TCustomEdit).Text)) = false) then
           begin
              showmessage('CFOP informado  não existe!');
             (sender as TCustomEdit).SetFocus;
             exit;
           end
          else
           begin
             exibeInformacoesCFOPSaida(trim((sender as TCustomEdit).Text));
           end;
    end;








 if ( (sender is TCustomEdit and ((sender as TCustomEdit).Name='ed_cfop'))) then
    begin
         if trim ((sender as TCustomEdit).text) ='' then exit;

         auxiliar:=(sender as TCustomEdit).text;
          try
           auxiliar:=FormatFloat('0000',StrToFloat(auxiliar));
          except
           begin
            showmessage('CFOP inválido!');
            (sender as TCustomEdit).SetFocus;
            exit;
           end;
          end;
          (sender as TCustomEdit).Text:=auxiliar;

          if (verificaExistenciaCFOP(trim((sender as TCustomEdit).Text)) = false) then
           begin
              showmessage('CFOP informado  não existe!');
             (sender as TCustomEdit).SetFocus;
             exit;
           end
          else
           begin
             exibeInformacoesCFOP(trim((sender as TCustomEdit).Text));
           end;
    end;


 if ( (sender is TCustomEdit and ((sender as TCustomEdit).Name='edCfopTransferencia'))) then
    begin
         if trim ((sender as TCustomEdit).text) ='' then exit;

         auxiliar:=(sender as TCustomEdit).text;
          try
           auxiliar:=FormatFloat('0000',StrToFloat(auxiliar));
          except
           begin
            showmessage('CFOP de transferência inválido!');
            (sender as TCustomEdit).SetFocus;
            exit;
           end;
          end;
          (sender as TCustomEdit).Text:=auxiliar;

          if (verificaExistenciaCFOP(trim((sender as TCustomEdit).Text)) = false) then
           begin
              showmessage('CFOP de transferência informado  não existe!');
             (sender as TCustomEdit).SetFocus;
             exit;
           end
          else
           begin
             exibeInformacoesCFOPTransferencia(trim((sender as TCustomEdit).Text));
           end;
    end;




 if ( (sender is TCustomEdit and ((sender as TCustomEdit).Name='edCfopDevolucao'))) then
    begin
         if trim ((sender as TCustomEdit).text) ='' then exit;

         auxiliar:=(sender as TCustomEdit).text;
          try
           auxiliar:=FormatFloat('0000',StrToFloat(auxiliar));
          except
           begin
            showmessage('CFOP de devolução inválido!');
            (sender as TCustomEdit).SetFocus;
            exit;
           end;
          end;
          (sender as TCustomEdit).Text:=auxiliar;

          if (verificaExistenciaCFOP(trim((sender as TCustomEdit).Text)) = false) then
           begin
              showmessage('CFOP de devolução informado não existe!');
             (sender as TCustomEdit).SetFocus;
             exit;
           end
          else
           begin
             exibeInformacoesCFOPDevolucao(trim((sender as TCustomEdit).Text));
           end;
    end;





 if ( (sender is TCustomEdit and ((sender as TCustomEdit).Name='edCodTipoItemSped'))) then
    begin
         if trim ((sender as TCustomEdit).text) ='' then exit;

         auxiliar:=(sender as TCustomEdit).text;
          try
           auxiliar:=FormatFloat('00',StrToFloat(auxiliar));
          except
           begin
            showmessage('Tipo de ítem inválido!');
            (sender as TCustomEdit).SetFocus;
            exit;
           end;
          end;
          (sender
          as TCustomEdit).Text:=auxiliar;

          if (verificaExistenciaTipoItemSPED(trim((sender as TCustomEdit).Text)) = false) then
           begin
              showmessage('Tipo de ítem não existe!');
             (sender as TCustomEdit).SetFocus;
             exit;
           end
          else
           begin
             exibeInformacoesTipoItemSPED(trim((sender as TCustomEdit).Text));
           end;
    end;



 if ( (sender is TCustomEdit and ((sender as TCustomEdit).Name='edCodNCM'))) then
    begin
         if trim ((sender as TCustomEdit).text) ='' then exit;

          if (verificaExistenciaNCM(trim((sender as TCustomEdit).Text)) = false) then
           begin
              showmessage('NCM informado não existe');
             (sender as TCustomEdit).SetFocus;
             exit;
           end
          else
           begin
             exibeInformacoesNCM(trim((sender as TCustomEdit).Text));
           end;
    end;



 if ( (sender is TCustomEdit and ((sender as TCustomEdit).Name='edCodGeneroItem'))) then
    begin
         if trim ((sender as TCustomEdit).text) ='' then exit;

         auxiliar:=(sender as TCustomEdit).text;
          try
           auxiliar:=FormatFloat('00',StrToFloat(auxiliar));
          except
           begin
             showmessage('Gênero de ítem inválido');
            (sender as TCustomEdit).SetFocus;
            (sender as TCustomEdit).clear;
            exit;
           end;
          end;
          (sender  as TCustomEdit).Text:=auxiliar;



          if (verificaExistenciaGeneroItem(trim((sender as TCustomEdit).Text)) = false) then
           begin
              showmessage('Gênero de ítem informado não existe');
              (sender as TCustomEdit).SetFocus;
              (sender as TCustomEdit).clear;
              exit;
           end
          else
           begin
             exibeInformacoesGeneroItem(trim((sender as TCustomEdit).Text));
           end;
    end;





 if ( (sender is TCustomEdit and ((sender as TCustomEdit).Name='ed_cod_modelo_nota_fiscal'))) then
    begin
         if trim ((sender as TCustomEdit).text) ='' then exit;

         auxiliar:=(sender as TCustomEdit).text;

          try
           auxiliar:=FormatFloat('00',StrToFloat(auxiliar));
          except
           begin
         //   showmessage('Código de Modelo de Nota Fiscal inválido!');
//            (sender as TCustomEdit).SetFocus;
  //          exit;
           end;
          end;
          (sender as TCustomEdit).Text:=auxiliar;




          if (verificaExistenciaModeloNotaFiscal(trim((sender as TCustomEdit).Text)) = false) then
           begin
              showmessage('Código de Modelo de Nota Fiscal inválido!');
             (sender as TCustomEdit).SetFocus;
             exit;
           end
          else
           begin
             exibeInformacoesModeloNotaFiscal(trim((sender as TCustomEdit).Text));
           end;
    end;



 if ( (sender is TCustomEdit and ((sender as TCustomEdit).Name='edCodSituacaoDocFiscal'))) then
    begin
         if trim ((sender as TCustomEdit).text) ='' then exit;

         auxiliar:=(sender as TCustomEdit).text;
          try
           auxiliar:=FormatFloat('00',StrToFloat(auxiliar));
          except
           begin
            showmessage('Código de situação de documento fiscal inválido!');
            (sender as TCustomEdit).SetFocus;
            exit;
           end;
          end;
          (sender as TCustomEdit).Text:=auxiliar;

          if (verificaExistenciaSituacaoDocumentoFiscal(trim((sender as TCustomEdit).Text)) = false) then
           begin
             showmessage('Código de situação de documento fiscal inválido!');
             (sender as TCustomEdit).SetFocus;
             exit;
           end
          else
           begin
             exibeInformacoesSituacaoDocumentoFiscal(trim((sender as TCustomEdit).Text));
           end;
    end;




 if ( (sender is TCustomEdit and ((sender as TCustomEdit).Name='ed_cst'))) then
    begin
         if trim ((sender as TCustomEdit).text) ='' then exit;

         auxiliar:=(sender as TCustomEdit).text;
          try
           auxiliar:=FormatFloat('000',StrToFloat(auxiliar));
          except
           begin
            showmessage('CST inválido!');
            (sender as TCustomEdit).SetFocus;
            exit;
           end;
          end;
          (sender as TCustomEdit).Text:=auxiliar;

          if (verificaExistenciaCST(trim((sender as TCustomEdit).Text)) = false) then
           begin
              showmessage('CST inválido!');
             (sender as TCustomEdit).SetFocus;
             exit;
           end
          else
           begin
             exibeInformacoesCST(trim((sender as TCustomEdit).Text));
           end;
    end;



 if ( (sender is TCustomEdit and ((sender as TCustomEdit).Name='edCstSaida'))) then
    begin
         if trim ((sender as TCustomEdit).text) ='' then exit;

         auxiliar:=(sender as TCustomEdit).text;
          try
           auxiliar:=FormatFloat('000',StrToFloat(auxiliar));
          except
           begin
            showmessage('CST de saída inválido!');
            (sender as TCustomEdit).SetFocus;
            exit;
           end;
          end;
          (sender as TCustomEdit).Text:=auxiliar;

          if (verificaExistenciaCST(trim((sender as TCustomEdit).Text)) = false) then
           begin
              showmessage('CST de saída inválido!');
             (sender as TCustomEdit).SetFocus;
             exit;
           end
          else
           begin
             exibeInformacoesCST_saida(trim((sender as TCustomEdit).Text));
           end;
    end;




 if ( (sender is TCustomEdit and ((sender as TCustomEdit).Name='edCstTransferencia'))) then
    begin
         if trim ((sender as TCustomEdit).text) ='' then exit;

         auxiliar:=(sender as TCustomEdit).text;
          try
           auxiliar:=FormatFloat('000',StrToFloat(auxiliar));
          except
           begin
            showmessage('CST de transferência inválido!');
            (sender as TCustomEdit).SetFocus;
            exit;
           end;
          end;
          (sender as TCustomEdit).Text:=auxiliar;

          if (verificaExistenciaCST(trim((sender as TCustomEdit).Text)) = false) then
           begin
              showmessage('CST de transferência inválido!');
             (sender as TCustomEdit).SetFocus;
             exit;
           end
          else
           begin
             exibeInformacoesCSTTransferencias(trim((sender as TCustomEdit).Text));
           end;
    end;





 if ( (sender is TCustomEdit and ((sender as TCustomEdit).Name='edCstDevolucao'))) then
    begin
         if trim ((sender as TCustomEdit).text) ='' then exit;

         auxiliar:=(sender as TCustomEdit).text;
          try
           auxiliar:=FormatFloat('000',StrToFloat(auxiliar));
          except
           begin
            showmessage('CST de devolução inválido!');
            (sender as TCustomEdit).SetFocus;
            exit;
           end;
          end;
          (sender as TCustomEdit).Text:=auxiliar;

          if (verificaExistenciaCST(trim((sender as TCustomEdit).Text)) = false) then
           begin
              showmessage('CST de devolução inválido!');
             (sender as TCustomEdit).SetFocus;
             exit;
           end
          else
           begin
             exibeInformacoesCSTDevolucoes(trim((sender as TCustomEdit).Text));
           end;
    end;







 if ( (sender is TCustomEdit and ((sender as TCustomEdit).Name='ed_cod_usuario'))) then
    begin

      if((sender is TCustomEdit and ( trim( (sender as TCustomEdit).text)='')) ) then exit;

         auxiliar:=(sender as TCustomEdit).text;
          try
           auxiliar:=FormatFloat('00',StrToFloat(auxiliar));
          except
           begin
            showmessage('Código de usuário inválido!');
            (sender as TCustomEdit).SetFocus;
            exit;
           end;
          end;
          (sender as TCustomEdit).Text:=auxiliar;

          if (verificaExistenciaUsuario(trim((sender as TCustomEdit).Text)) = false) then
           begin
              showmessage('Código de usuário  não existe!');
             (sender as TCustomEdit).SetFocus;
             exit;
           end
          else
           begin
             exibeInformacoesUsuario(trim((sender as TCustomEdit).Text));
           end;
    end;





 if (    (sender is TDBEdit and ((sender as TDBEdit).Name='ed_cod_historico'))
 or (sender is TEdit and ((sender as TEdit).Name='ed_cod_historico')) )then
    begin

      if((sender is TDBEdit and ( trim( (sender as TDBEdit).text)=''))    or (sender is TEdit and ( trim( (sender as TEdit).text)=''))   ) then
       exit
      else
        begin
          if  (Sender is TDBEdit) then
             auxiliar:=(sender as TDBEdit).text
          else
             auxiliar:=(sender as TEdit).text;

          try
             auxiliar:=FormatFloat('000',StrToFloat(auxiliar));
          except
           begin
            showmessage('Código de histórico de caixa inválido!!');
            if  (Sender is TDBEdit) then
                (sender as TDBEdit).SetFocus
            else
               (sender as TEdit).SetFocus;
            exit;
           end;
          end;
        end;

        if (Sender is TDBEdit) then
           (sender as TDBEdit).Text:=auxiliar
        else
           (sender as TEdit).Text:=auxiliar;


      if verificaExistenciaHistorico(auxiliar) then
         exibeInformacoes('ed_cod_historico','ed_desc_historico',
         'historico_caixa','cod_historico,descricao','cod_historico',auxiliar,1)
      else
        begin
            showmessage('Código de histórico inválido!');
            if  (Sender is TDBEdit) then
                (sender as TDBEdit).SetFocus
            else
               (sender as TEdit).SetFocus;
            exit;
        end;
    end;


 if (    (sender is TDBEdit and ((sender as TDBEdit).Name='ed_cod_centro_custo'))
 or (sender is TEdit and ((sender as TEdit).Name='ed_cod_centro_custo')) )then
    begin

      if((sender is TDBEdit and ( trim( (sender as TDBEdit).text)=''))    or (sender is TEdit and ( trim( (sender as TEdit).text)=''))   ) then
       exit
      else
        begin
          if  (Sender is TDBEdit) then

               auxiliar:=(sender as TDBEdit).text

          else
             auxiliar:=(sender as TEdit).text;

          try
            FormatFloat('000',StrToFloat(auxiliar));
          except
           begin
            showmessage('Código de centro de custo inválido!!');
            if  (Sender is TDBEdit) then
                (sender as TDBEdit).SetFocus
            else
               (sender as TEdit).SetFocus;
            exit;
           end;
          end;
        end;


      if verificaExistenciaCentroDeCusto(auxiliar) then
        exibeInformacoesCentroCusto(auxiliar)


      else
        begin
            showmessage('Código de centro de custo inválido!!');
            if  (Sender is TDBEdit) then
                (sender as TDBEdit).SetFocus
            else
               (sender as TEdit).SetFocus;
            exit;
        end;
    end;


 if (    (sender is TDBEdit and ((sender as TDBEdit).Name='ed_cod_cidade'))
 or (sender is TEdit and ((sender as TEdit).Name='ed_cod_cidade')) )then
    begin

      if((sender is TDBEdit and ( trim( (sender as TDBEdit).text)=''))    or (sender is TEdit and ( trim( (sender as TEdit).text)=''))   ) then
       exit
      else
        begin
          if  (Sender is TDBEdit) then
             auxiliar:=(sender as TDBEdit).text
          else
             auxiliar:=(sender as TEdit).text;

          try
           begin
            auxiliar:=FormatFloat('00000',StrToFloat(auxiliar));
           end;

          except
           begin
            showmessage('Código de cidade inválido!');
            if  (Sender is TDBEdit) then
                (sender as TDBEdit).SetFocus
            else
               (sender as TEdit).SetFocus;
            exit;
           end;
          end;
        end;

        if (Sender is TDBEdit) then
           (sender as TDBEdit).Text:=auxiliar
        else
           (sender as TEdit).Text:=auxiliar;

      if verificaExistenciaCidade(auxiliar) then
         exibeInformacoes('ed_cod_cidade','ed_nome_cidade',
         'cidade','cod_cidade,nome','cod_cidade',auxiliar,1)
      else
        begin
              showmessage('Código de cidade inválido!');
            if  (Sender is TDBEdit) then
                (sender as TDBEdit).SetFocus
            else
               (sender as TEdit).SetFocus;
            exit;

        end;
    end;



 if ( (sender is TCustomEdit and ((sender as TCustomEdit).Name='edCodPromoter'))) then
    begin

      if((sender is TCustomEdit and ( trim( (sender as TCustomEdit).text)='')) ) then
       exit
      else
        begin
             auxiliar:=(sender as TCustomEdit).text;
          try
             auxiliar:=FormatFloat('000',StrToFloat(auxiliar));
          except
           begin
            showmessage('Código de promoter inválido!!');
            (sender as TCustomEdit).SetFocus;
            exit;
           end;
          end;
        end;
       (sender as TCustomEdit).Text:=auxiliar;

       if (verificaExistenciaPromoter( trim((sender as TCustomEdit).Text)) = false) then
        begin
          showmessage('Código de promoter inexistente!');
          (sender as TCustomEdit).SetFocus;
          exit;
        end
          else
       begin
         exibeInformacoesPromoter(trim((sender as TCustomEdit).Text));
       end;
    end;





 if ( (sender is TCustomEdit and ((sender as TCustomEdit).Name='ed_cod_garcon'))) then
    begin

      if((sender is TCustomEdit and ( trim( (sender as TCustomEdit).text)='')) ) then
       exit
      else
        begin
             auxiliar:=(sender as TCustomEdit).text;
          try
             auxiliar:=FormatFloat('000',StrToFloat(auxiliar));
          except
           begin
            showmessage('Código de garçon inválido!!');
            (sender as TCustomEdit).SetFocus;
            exit;
           end;
          end;
        end;
       (sender as TCustomEdit).Text:=auxiliar;

       if (verificaExistenciaGarconMetre( trim((sender as TCustomEdit).Text)) = false) then
        begin
          showmessage('Código de garçon inexistente!');
          (sender as TCustomEdit).SetFocus;
          exit;
        end
          else
       begin
         exibeInformacoesGarcons(trim((sender as TCustomEdit).Text));
       end;
    end;




 if ( (sender is TCustomEdit and ((sender as TCustomEdit).Name='edCodDepartamento'))) then
    begin

      if((sender is TCustomEdit and ( trim( (sender as TCustomEdit).text)='')) ) then
       exit
      else
        begin
             auxiliar:=(sender as TCustomEdit).text;
          try
             auxiliar:= Inttostr(StrToInt(auxiliar));
          except
           begin
            showmessage('Código de departamento inválido!');
            (sender as TCustomEdit).SetFocus;
            exit;
           end;
          end;
        end;
       (sender as TCustomEdit).Text:=auxiliar;

       if (verificaExistenciaDepartamento( trim((sender as TCustomEdit).Text)) = false) then
        begin
          showmessage('Código de departamento inexistente');
          (sender as TCustomEdit).SetFocus;
          exit;
        end
          else
       begin
         exibeInformacoesDepartamento(trim((sender as TCustomEdit).Text));
       end;
    end;



 if ( (sender is TCustomEdit and ((sender as TCustomEdit).Name='edCodGuarnicao'))) then
    begin

      if((sender is TCustomEdit and ( trim( (sender as TCustomEdit).text)='')) ) then
       exit
      else
        begin
           auxiliar:=(sender as TCustomEdit).text;
          try
             auxiliar:=FormatFloat('00',StrToFloat(auxiliar));
          except
           begin
            showmessage('Código de Guarnição inválido!');
            (sender as TCustomEdit).SetFocus;
            exit;
           end;
          end;

        end;


       (sender as TCustomEdit).Text:=auxiliar;

       if (verificaExistenciaGuarnicao( trim((sender as TCustomEdit).Text)) = false) then
        begin
            showmessage('Código de Guarnição inexistente!');
          (sender as TCustomEdit).SetFocus;
          exit;
        end
          else
       begin
         exibeInformacoesGuarnicao(trim((sender as TCustomEdit).Text));
       end;
    end;


 if ( (sender is TCustomEdit and ((sender as TCustomEdit).Name='edCodGrupoTouch'))) then
    begin

      if((sender is TCustomEdit and ( trim( (sender as TCustomEdit).text)='')) ) then
       exit
      else
        begin
           auxiliar:=(sender as TCustomEdit).text;
          try
             auxiliar:=FormatFloat('00',StrToFloat(auxiliar));
          except
           begin
            showmessage('Código de grupo touch inválido!');
            (sender as TCustomEdit).SetFocus;
            exit;
           end;
          end;

        end;


       (sender as TCustomEdit).Text:=auxiliar;

       if (verificaExistenciaGrupoTouch(trim((sender as TCustomEdit).Text)) = false) then
        begin
            showmessage('Código de grupo touch inexistente!');
          (sender as TCustomEdit).SetFocus;
          exit;
        end
          else
       begin
         exibeInformacoesGuarnicao(trim((sender as TCustomEdit).Text));
       end;
    end;







 if ( (sender is TCustomEdit and ((sender as TCustomEdit).Name='edCodEntregador'))) then
    begin

      if((sender is TCustomEdit and ( trim( (sender as TCustomEdit).text)='')) ) then
       exit
      else
        begin
             auxiliar:=(sender as TCustomEdit).text;
          try
             auxiliar:=FormatFloat('000',StrToFloat(auxiliar));
          except
           begin
            showmessage('Código de entregador invalido!');
            (sender as TCustomEdit).SetFocus;
            exit;
           end;
          end;
        end;
       (sender as TCustomEdit).Text:=auxiliar;

       if (verificaExistenciaEntregador( trim((sender as TCustomEdit).Text)) = false) then
        begin
          showmessage('Código de entregador invalido');
          (sender as TCustomEdit).SetFocus;
          exit;
        end
          else
       begin
         exibeInformacoesEntregador (trim((sender as TCustomEdit).Text));
       end;
    end;


 if ( (sender is TCustomEdit and ((sender as TCustomEdit).Name='ed_cod_grupo'))) then
    begin

      if((sender is TCustomEdit and ( trim( (sender as TCustomEdit).text)='')) ) then
       exit;

      if (verificaExistenciaGrupo( trim((sender as TCustomEdit).Text)) = false) then
       begin
        showmessage('Código de grupo inexistente!');
        (sender as TCustomEdit).SetFocus;
        exit;
       end
      else
       begin
        exibeInformacoesGrupos(trim((sender as TCustomEdit).Text));
       end;
    end;



if ( (sender is TCustomEdit and ((sender as TCustomEdit).Name='edCodGrupoRD'))) then
    begin

      if((sender is TCustomEdit and ( trim( (sender as TCustomEdit).text)='')) ) then
       exit;

      if (verificaExistenciaGrupoRD( trim((sender as TCustomEdit).Text)) = false) then
       begin
        showmessage('Grupo do RD inexistente!');
        (sender as TCustomEdit).SetFocus;
        exit;
       end
      else
       begin
        exibeInformacoesGruposRD(trim((sender as TCustomEdit).Text));
       end;
    end;






 if ( (sender is TCustomEdit and ((sender as TCustomEdit).Name='ed_cod_estado'))) then
    begin

      if((sender is TCustomEdit and ( trim( (sender as TCustomEdit).text)='')) ) then
       exit;

      if (verificaExistenciaEstado( trim((sender as TCustomEdit).Text)) = false) then
       begin
        showmessage('Código de estado inválido');
        (sender as TCustomEdit).SetFocus;
        exit;
       end
      else
       begin
        exibeInformacoesEstado(trim((sender as TCustomEdit).Text));
       end;
    end;



 if ( (sender is TCustomEdit and ((sender as TCustomEdit).Name='ed_cod_mini_printer'))) then
    begin

      if((sender is TCustomEdit and ( trim( (sender as TCustomEdit).text)='')) ) then
      (sender as TCustomEdit).Text:='001';

             auxiliar:=(sender as TCustomEdit).text;
          try
             auxiliar:=FormatFloat('000',StrToFloat(auxiliar));
          except
           begin
            showmessage('Código de mini printer inválido!!');
            (sender as TCustomEdit).SetFocus;
            exit;
           end;
          end;
          (sender as TCustomEdit).Text:=auxiliar;

          if (verificaExistenciaMiniPrinter( trim((sender as TCustomEdit).Text)) = false) then
           begin
              showmessage('Código de mini printer não existe!');
             (sender as TCustomEdit).SetFocus;
             exit;
           end
          else
           begin
             exibeInformacoes('ed_cod_mini_printer','ed_desc_mini_printer',
             'miniprinters','cod_miniprinter,descricao','cod_miniprinter',auxiliar,1)
           end;
    end;



 if ( (sender is TCustomEdit and ((sender as TCustomEdit).Name='ed_cod_un_entrada'))  ) then
    begin
      if((sender is TCustomEdit and ( trim( (sender as TCustomEdit).text)='')) ) then
       begin
        (sender as TCustomEdit).Text:='01';
        (sender as TCustomEdit).SelectAll;

       end;

             auxiliar:=(sender as TCustomEdit).text;
          try
             auxiliar:=FormatFloat('00',StrToFloat(auxiliar));
          except
           begin
            showmessage('Código de unidade de entrada inválido!');
            (sender as TCustomEdit).SetFocus;
            exit;
           end;
          end;
          (sender as TCustomEdit).Text:=auxiliar;

          if (verificaExistenciaUnidade( trim((sender as TCustomEdit).Text)) = false) then
           begin
              showmessage('Código de unidade não existe!');
             (sender as TCustomEdit).SetFocus;
             exit;
           end
          else
           begin
             exibeInformacoesUnidadeEntrada(  (sender as TCustomEdit).Text);

           end;
    end;



 if ( (sender is TCustomEdit and ((sender as TCustomEdit).Name='ed_cod_un_saida'))  ) then
    begin
      if((sender is TCustomEdit and ( trim( (sender as TCustomEdit).text)='')) ) then
       begin
        (sender as TCustomEdit).Text:='01';
        (sender as TCustomEdit).SelectAll;
       end;

             auxiliar:=(sender as TCustomEdit).text;
          try
             auxiliar:=FormatFloat('00',StrToFloat(auxiliar));
          except
           begin
            showmessage('Código de unidade de saída inválido!');
            (sender as TCustomEdit).SetFocus;
            exit;
           end;
          end;
          (sender as TCustomEdit).Text:=auxiliar;

          if (verificaExistenciaUnidade( trim((sender as TCustomEdit).Text)) = false) then
           begin
              showmessage('Código de unidade não existe!');
             (sender as TCustomEdit).SetFocus;
             exit;
           end
          else
           begin
             exibeInformacoesUnidadeSaida((sender as TCustomEdit).Text);

           end;
    end;


 if ( (sender is TCustomEdit and ((sender as TCustomEdit).Name='edCodSaborPizza'))  ) then
    begin
      if((sender is TCustomEdit and ( trim( (sender as TCustomEdit).text)='')) ) then
       exit;

         auxiliar:=(sender as TCustomEdit).text;
          try
             auxiliar:=FormatFloat('000',StrToFloat(auxiliar));
          except
           begin
            showmessage('Código de sabor de pizza inválido!');
            (sender as TCustomEdit).SetFocus;
            exit;
           end;
          end;
          (sender as TCustomEdit).Text:=auxiliar;

          if (verificaExistenciaSaborPizza( trim((sender as TCustomEdit).Text)) = false) then
           begin
              showmessage('Código de sabor de pizza não existe!');
             (sender as TCustomEdit).SetFocus;
             exit;
           end
          else
           begin
             exibeInformacoesSaborPizza((sender as TCustomEdit).Text);

           end;
    end;




 if ( (sender is TCustomEdit and ((sender as TCustomEdit).Name='edCodUnFracao'))  ) then
    begin
      if((sender is TCustomEdit and ( trim( (sender as TCustomEdit).text)='')) ) then
      begin
        (sender as TCustomEdit).Text:='01';
        (sender as TCustomEdit).SelectAll;
      end;

             auxiliar:=(sender as TCustomEdit).text;
          try
             auxiliar:=FormatFloat('00',StrToFloat(auxiliar));
          except
           begin
            showmessage('Código de unidade de fração inválido!');
            (sender as TCustomEdit).SetFocus;
            exit;
           end;
          end;
          (sender as TCustomEdit).Text:=auxiliar;

          if (verificaExistenciaUnidade( trim((sender as TCustomEdit).Text)) = false) then
           begin
              showmessage('Código de unidade de não existe!');
             (sender as TCustomEdit).SetFocus;
             exit;
           end
          else
           begin
             exibeInformacoesUnidadeDeFracao(  (sender as TCustomEdit).Text); 
           end;
    end;








 if ( (sender is TCustomEdit and ((sender as TCustomEdit).Name='ed_cod_item'))  ) then
    begin

      if((sender is TCustomEdit and ( trim( (sender as TCustomEdit).text)='')) ) then exit;

          try
            (sender as TCustomEdit).text:=FormatFloat('00000',StrToFloat( (sender as TCustomEdit).text));
          except
            showmessage('ERRO');
          end;

          if (verificaExistenciaItemEstoque( trim((sender as TCustomEdit).Text),1) = false) then
           begin
              showmessage('Código de ítem não existe!');
              (sender as TCustomEdit).SetFocus;
               exit;
           end
          else
           begin
             exibeInformacoesItemEstoque(trim((sender as TCustomEdit).Text),1);
           end;
    end;





 if ( (sender is TCustomEdit and ((sender as TCustomEdit).Name='ed_cod_item_saida'))  ) then
    begin

      if((sender is TCustomEdit and ( trim( (sender as TCustomEdit).text)='')) ) then exit;

          try
            (sender as TCustomEdit).text:=FormatFloat('00000',StrToFloat( (sender as TCustomEdit).text));
          except
            showmessage('ERRO');
          end;

        if (verificaExistenciaProduto(trim((sender as TCustomEdit).Text),1) = false) then
           begin
              showmessage('Código de ítem não existe !');
              (sender as TCustomEdit).SetFocus;
               exit;
           end
          else
           begin
             exibeInformacoesItemSaida(trim((sender as TCustomEdit).Text),1);
           end;
    end;







 if ( (sender is TCustomEdit and ((sender as TCustomEdit).Name='edCodSubmateria'))  ) then
    begin

      if((sender is TCustomEdit and ( trim( (sender as TCustomEdit).text)='')) ) then exit;

          try
            (sender as TCustomEdit).text:=FormatFloat('00000',StrToFloat( (sender as TCustomEdit).text));
          except
            showmessage('ERRO');
          end;

          if (verificaExistenciaSubmateria( trim((sender as TCustomEdit).Text),1) = false) then
           begin
              showmessage('O código da Submatéria-prima informada não existe!');
              (sender as TCustomEdit).SetFocus;
               exit;
           end
          else
           begin
             exibeInformacoesSubMateria(trim((sender as TCustomEdit).Text),1);
           end;
    end;




 if ( (sender is TCustomEdit and ((sender as TCustomEdit).Name='edCodTipoBaixaEstoque'))  ) then
    begin

      if((sender is TCustomEdit and ( trim( (sender as TCustomEdit).text)='')) ) then exit;

          try
            (sender as TCustomEdit).text:=FormatFloat('000',StrToFloat( (sender as TCustomEdit).text));
          except
            showmessage('ERRO');
          end;

          if (verificaExistenciaTipoBaixaEstoque( trim((sender as TCustomEdit).Text)) = false) then
           begin
              showmessage('Tipo de baixa informado não existe!');
              (sender as TCustomEdit).SetFocus;
              (sender as TCustomEdit).clear;
               exit;
           end
          else
           begin
             exibeInformacoesTipoBaixaEstoque(trim((sender as TCustomEdit).Text));
           end;
    end;       



 if ( (sender is TCustomEdit and ((sender as TCustomEdit).Name='ed_cod_barras_item'))  ) then
    begin

      if((sender is TCustomEdit and ( trim( (sender as TCustomEdit).text)='')) ) then exit;

          if (verificaExistenciaItemEstoque( trim((sender as TCustomEdit).Text),2) = false) then
           begin
              showmessage('Código de ítem não existe!');
              (sender as TCustomEdit).SetFocus;
               exit;
           end
          else
           begin
             exibeInformacoesItemEstoque(trim((sender as TCustomEdit).Text),2);
           end;

    end;


  if  sender is TCustomEdit and ((sender as TCustomEdit).Name='ed_cod_cliente') then
    begin
        if ( trim((sender as TCustomEdit).Text) = '') then exit;
     try
      (sender as TCustomEdit).Text := FormatFloat('000000',StrToFloat( (sender as TCustomEdit).Text));
     except
      begin
        dm.exibe_painel_erro('Código de cliente inválido!','');
        exit;
      end;
     end;

     if (verificaExistenciaCliente( trim((sender as TCustomEdit).Text)) = false) then
      begin
       dm.exibe_painel_erro('Cliente inexistente!','');
       exit;
      end
     else
      begin
        exibeInformacoesClienteFaturamento ( (sender as TCustomEdit).text );
      end;
    END;





if ( (sender is TCustomEdit and ((sender as TCustomEdit).Name='edCodAliquota'))  ) then
    begin
      if((sender is TCustomEdit and ( trim( (sender as TCustomEdit).text)='')) ) then
       exit;

             auxiliar:=(sender as TCustomEdit).text;
          try
             auxiliar:=FormatFloat('00',StrToFloat(auxiliar));
          except
           begin
            showmessage('Código de alíquota inválido!');
            (sender as TCustomEdit).SetFocus;
            exit;
           end;
          end;
          (sender as TCustomEdit).Text:=auxiliar;

          if (verificaExistenciaAliquota( trim((sender as TCustomEdit).Text)) = false) then
           begin
              showmessage('Código de alíquota não existe!');
             (sender as TCustomEdit).SetFocus;
             exit;
           end
          else
           begin
             exibeInformacoesAliquota(  (sender as TCustomEdit).Text);
           end;
    end;











if ( (sender is TCustomEdit and ((sender as TCustomEdit).Name='edCodLoja'))  ) then
    begin
{      if((sender is TCustomEdit and ( trim( (sender as TCustomEdit).text)='')) ) then
      (sender as TCustomEdit).Text:='001';}

        if((sender is TCustomEdit and ( trim( (sender as TCustomEdit).text)='')) ) then
          exit;


             auxiliar:=(sender as TCustomEdit).text;
          try
             auxiliar:=FormatFloat('0000',StrToFloat(auxiliar));
          except
           begin
            showmessage('Código de loja inválido!');
            (sender as TCustomEdit).SetFocus;
            exit;
           end;
          end;
          (sender as TCustomEdit).Text:=auxiliar;

          if (verificaExistenciaLoja( trim((sender as TCustomEdit).Text)) = false) then
           begin
              showmessage('Código de loja inexistente');
             (sender as TCustomEdit).SetFocus;
             exit;
           end
          else
           begin
             exibeInformacoesLoja(  (sender as TCustomEdit).Text);

           end;
    end;



if ( (sender is TCustomEdit and ((sender as TCustomEdit).Name='edCodCliDelivery'))  ) then
    begin
          if ( (sender as TCustomEdit).text = '') then
           begin
             Exit;
           end;

          auxiliar:=(sender as TCustomEdit).text;
          try
             auxiliar:=FormatFloat('00000',StrToFloat(auxiliar));
          except
           begin
            showmessage('Código de Cliente!');
            (sender as TCustomEdit).SetFocus;
            exit;
           end;
          end;
          (sender as TCustomEdit).Text:=auxiliar;

          if (verificaExistenciaClienteDelivery( trim((sender as TCustomEdit).Text)) = false) then
           begin
              showmessage('Código de cliente inexistente');
             (sender as TCustomEdit).SetFocus;
             exit;
           end
          else
           begin
             exibeInformacoesClienteDelivery (  (sender as TCustomEdit).Text);

           end;
    end;   
end;


function Tfrm_modelo_vazio.verificaExistenciaRecebimentosParciais(mesa : string) : boolean;
var
 q : TIBQuery;
begin

  q := TIBQuery.Create(self);
  q.Database := dm.dbrestaurante;
  q.Transaction := dm.transacao;
  q.Active:=false;
  q.SQL.clear;

  q.sql.add('select * from recebimentos_parciais where mesa='+Quotedstr(mesa));
  q.active:=true;

  if q.IsEmpty then
   result:=true
  else
   result:=false;

  FreeAndNil(q); 
end;

function Tfrm_modelo_vazio.verificaExistenciaFatura(cod_fatura : string) : boolean;
var
 q : TIBQuery;
begin
  q := TIBQuery.Create(self);
  q.Database := dm.dbrestaurante;
  q.Transaction := dm.transacao;
  q.Active:=false;
  q.SQL.clear;

  q.sql.add('select * from faturas where cod_fatura='+Quotedstr(cod_fatura));
  q.active:=true;

  if q.IsEmpty then
   result:=false
  else
   result:=true;

   FreeAndNil(q); 
end;

function Tfrm_modelo_vazio.verificaExistenciaTipoDocumento(cod_tipo_documento : string) : boolean;
var
 q : TIBQuery;
begin
  q := TIBQuery.Create(self);
  q.Database := dm.dbrestaurante;
  q.Transaction := dm.transacao;
  q.Active:=false;
  q.SQL.clear;
  q.sql.add('select * from tipos_documento where cod_tipo_doc='+QUotedstr(cod_tipo_documento));
  q.active:=true;

  if q.IsEmpty then
   result:=false
  else
   result:=true;

  FreeAndNil(q);  
end;

function Tfrm_modelo_vazio.verificaExistenciaTipoEntrada(cod_tipo_entrada : string) : boolean;
var
 q : TIBQuery;
begin
  q := TIBQuery.Create(self);
  q.Database := dm.dbrestaurante;
  q.Transaction := dm.transacao;
  q.Active:=false;
  q.SQL.clear;
  q.sql.add('select * from tipos_entrada where cod_tipo_entrada='+QUotedstr(cod_tipo_entrada));
  q.active:=true;

  if q.IsEmpty then
   result:=false
  else
   result:=true;

  FreeAndNil(q); 
end;


function Tfrm_modelo_vazio.verificaExistenciaEntrada(cod_entrada : string) : boolean;
var
 q : TIBQuery;
begin
  q := TIBQuery.Create(self);
  q.Database := dm.dbrestaurante;
  q.Transaction := dm.transacao;
  q.Active:=false;
  q.SQL.clear;
  q.sql.add('select * from entradas where cod_entrada='+QUotedstr(cod_entrada));
  q.active:=true;

  if q.IsEmpty then
   result:=false
  else
   result:=true;

  FreeAndNil(q);
end;



function Tfrm_modelo_vazio.verificaExistenciaSaida(cod_saida : string) : boolean;
var
 q : TIBQuery;
begin
  q := TIBQuery.Create(self);
  q.Database := dm.dbrestaurante;
  q.Transaction := dm.transacao;
  q.Active:=false;
  q.SQL.clear;
  q.sql.add('select * from saidas where cod_saida='+QUotedstr(cod_saida));
  q.active:=true;

  if q.IsEmpty then
   result:=false
  else
   result:=true;

  FreeAndNil(q);
end;




function Tfrm_modelo_vazio.verificaExistenciaReceita(codReceita : string) : boolean;
var
 q : TIBQuery;
begin
  q := TIBQuery.Create(self);
  q.Database := dm.dbrestaurante;
  q.Transaction := dm.transacao;
  q.Active:=false;
  q.SQL.clear;
  q.sql.add('select * from receitas where cod_receita='+QUotedstr(codReceita));
  q.active:=true;

  if q.IsEmpty then
   result:=false
  else
   result:=true;

  FreeAndNil(q); 
end;

function Tfrm_modelo_vazio.verificaExistenciaUsuario(cod_usuario : string) : boolean;
var
 q : TIBQuery;
begin
  q := TIBQuery.Create(self);
  q.Database := dm.dbrestaurante;
  q.Transaction := dm.transacao;
  q.Active:=false;
  q.SQL.clear;
  q.sql.add('select * from usuarios where cod_usuario='+QUotedstr(cod_usuario));
  q.active:=true;

  if q.IsEmpty then
   result:=false
  else
   result:=true;

  FreeAndNil(q);
end;



function Tfrm_modelo_vazio.verificaSeProdutoPodeSerVendido(codProduto : string ; tipo : smallint) : boolean;
var
 q : TIBQuery;
begin
  q := TIBQuery.Create(self);
  q.Database := dm.dbrestaurante;
  q.Transaction := dm.transacao;
  q.Active:=false;
  q.SQL.clear;
  if (tipo = 1)
   then
     q.sql.add('select vende from produtos where cod_produto='+QUotedstr(codProduto))
  else
     q.sql.add('select vende from produtos where cod_barras='+QUotedstr(codProduto));
   q.active:=true;

  if q.FieldByName('vende').Value = 1  then
    Result := true
  else
    Result := false;



  FreeAndNil(q);
end;



function Tfrm_modelo_vazio.verificaExistenciaProduto(codProduto : string ; tipo : smallint) : boolean;
var
 q : TIBQuery;
begin
  q := TIBQuery.Create(self);
  q.Database := dm.dbrestaurante;
  q.Transaction := dm.transacao;
  q.Active:=false;
  q.SQL.clear;
  if (tipo = 1)
   then
     q.sql.add('select * from produtos where cod_produto='+QUotedstr(codProduto))
  else
     q.sql.add('select * from produtos where cod_barras='+QUotedstr(codProduto));
   q.active:=true;


  if q.IsEmpty then
   result:=false
  else
   result:=true;
  FreeAndNil(q);
end;

function Tfrm_modelo_vazio.getDescricaoProduto(codProduto : string ; tipo : smallint) : string;
var
 q : TIBQuery;
begin
  q := TIBQuery.Create(self);
  q.Database := dm.dbrestaurante;
  q.Transaction := dm.transacao;
  q.Active:=false;
  q.SQL.clear;
  if (tipo = 1)
   then
     q.sql.add('select descricao from produtos where cod_produto='+QUotedstr(codProduto))
  else
     q.sql.add('select descricao from produtos where cod_barras='+QUotedstr(codProduto));
   q.active:=true;

   result:= q.fieldbyname('descricao').Value;
   FreeAndNil(q);
end;


function Tfrm_modelo_vazio.getUnidadeMedidaECF(codProduto : string ; tipo : smallint) : string;
var
 q : TIBQuery;
begin
  q := TIBQuery.Create(self);
  q.Database := dm.dbrestaurante;
  q.Transaction := dm.transacao;
  q.Active:=false;
  q.SQL.clear;
  if (tipo = 1)
   then
     q.sql.add('select UN_ECF from produtos where cod_produto='+QUotedstr(codProduto))
  else
     q.sql.add('select UN_ECF from produtos where cod_barras='+QUotedstr(codProduto));
   q.active:=true;

   result:= q.fieldbyname('UN_ECF').Value;
   FreeAndNil(q);
end;








function Tfrm_modelo_vazio.verificaExistenciaCFOP(CFOP : string ) : boolean;
var
 q : TIBQuery;
begin
  q := TIBQuery.Create(self);
  q.Database := dm.dbrestaurante;
  q.Transaction := dm.transacao;
  q.Active:=false;
  q.SQL.clear;
  q.sql.add('select * from cfop where codigo='+QUotedstr(CFOP));
  q.active:=true;

  if q.IsEmpty then
   result:=false
  else
   result:=true;  
  FreeAndNil(q);
end;



function Tfrm_modelo_vazio.getTipoCFOP(CFOP : string ) : integer;
var
 q : TIBQuery;
begin
  q := TIBQuery.Create(self);
  q.Database := dm.dbrestaurante;
  q.Transaction := dm.transacao;
  q.Active:=false;
  q.SQL.clear;
  q.sql.add('select tipo from cfop where codigo='+QUotedstr(CFOP));
  q.active:=true;
  result := q.fieldbyname('tipo').value;

end;



function Tfrm_modelo_vazio.verificaExistenciaTipoItemSPED(codigo : string ) : boolean;
var
 q : TIBQuery;
begin
  q := TIBQuery.Create(self);
  q.Database := dm.dbrestaurante;
  q.Transaction := dm.transacao;
  q.Active:=false;
  q.SQL.clear;
  q.sql.add('select * from tipos_item_sped where cod_tipo='+QUotedstr(codigo));
  q.active:=true;

  if q.IsEmpty then
   result:=false
  else
   result:=true;
  FreeAndNil(q);
end;



function Tfrm_modelo_vazio.verificaExistenciaNCM(codigo : string ) : boolean;
var
 q : TIBQuery;
begin
  q := TIBQuery.Create(self);
  q.Database := dm.dbrestaurante;
  q.Transaction := dm.transacao;
  q.Active:=false;
  q.SQL.clear;
  q.sql.add('select ncm,descricao from ncm where ncm='+QUotedstr(codigo));
  q.active:=true;

  if q.IsEmpty then
   result:=false
  else
   result:=true;
  FreeAndNil(q);
end;


function Tfrm_modelo_vazio.verificaExistenciaGeneroItem(codigo : string ) : boolean;
var
 q : TIBQuery;
begin
  q := TIBQuery.Create(self);
  q.Database := dm.dbrestaurante;
  q.Transaction := dm.transacao;
  q.Active:=false;
  q.SQL.clear;
  q.sql.add('select codigo,descricao from genero_item where codigo='+QUotedstr(codigo));
  q.active:=true;

  if q.IsEmpty then
   result:=false
  else
   result:=true;
  FreeAndNil(q);
end;


function Tfrm_modelo_vazio.verificaExistenciaModeloNotaFiscal(codModelo : string ) : boolean;
var
 q : TIBQuery;
begin
  q := TIBQuery.Create(self);
  q.Database := dm.dbrestaurante;
  q.Transaction := dm.transacao;
  q.Active:=false;
  q.SQL.clear;
  q.sql.add('select * from modelos_nf where codigo='+QUotedstr(codModelo));
  q.active:=true;

  if q.IsEmpty then
   result:=false
  else
   result:=true;
  FreeAndNil(q);
end;


function Tfrm_modelo_vazio.verificaExistenciaSituacaoDocumentoFiscal(codSituacao : string ) : boolean;
var
 q : TIBQuery;
begin
  q := TIBQuery.Create(self);
  q.Database := dm.dbrestaurante;
  q.Transaction := dm.transacao;
  q.Active:=false;
  q.SQL.clear;
  q.sql.add(' select cod_situacao, descricao from situacao_documento where cod_situacao='+QUotedstr(codSituacao));
  q.active:=true;

  if q.IsEmpty then
   result:=false
  else
   result:=true;
  FreeAndNil(q);
end;


function Tfrm_modelo_vazio.verificaExistenciaCST(CST : string ) : boolean;
var
 q : TIBQuery;
begin
  q := TIBQuery.Create(self);
  q.Database := dm.dbrestaurante;
  q.Transaction := dm.transacao;
  q.Active:=false;
  q.SQL.clear;
  q.sql.add('select * from CST where CST='+QUotedstr(CST));
  q.active:=true;

  if q.IsEmpty then
   result:=false
  else
   result:=true;
  FreeAndNil(q);
end;

function Tfrm_modelo_vazio.verificaExistenciaCSTPISCofins(CST : string ) : boolean;
var
 q : TIBQuery;
begin
  q := TIBQuery.Create(self);
  q.Database := dm.dbrestaurante;
  q.Transaction := dm.transacao;
  q.Active:=false;
  q.SQL.clear;
  q.sql.add('select * from CST_PIS_COFINS where CST='+QUotedstr(CST));
  q.active:=true;

  if q.IsEmpty then
   result:=false
  else
   result:=true;
  FreeAndNil(q);
end;






function  Tfrm_modelo_vazio.verificaSeProdutoVendeFracionado(codProduto : string ; tipo : smallint) : boolean;
var
 q : TIBQuery;
begin
  q := TIBQuery.Create(self);
  q.Database := dm.dbrestaurante;
  q.Transaction := dm.transacao;
  q.Active:=false;
  q.SQL.clear;
  if (tipo = 1)
   then
     q.sql.add('select * from produtos where cod_produto='+QUotedstr(codProduto))
  else
     q.sql.add('select * from produtos where cod_barras='+QUotedstr(codProduto));
   q.active:=true;


  if q.FieldByName('fracionado').Value = 0 then
   result:=false
  else
   result:=true;

  FreeAndNil(q);
end;

function  Tfrm_modelo_vazio.verificaSeProdutoCalculaQtde(codProduto : string ; tipo : smallint) : boolean;
var
 q : TIBQuery;
begin
  q := TIBQuery.Create(self);
  q.Database := dm.dbrestaurante;
  q.Transaction := dm.transacao;
  q.Active:=false;
  q.SQL.clear;
  if (tipo = 1)
   then
     q.sql.add('select * from produtos where cod_produto='+QUotedstr(codProduto))
  else
     q.sql.add('select * from produtos where cod_barras='+QUotedstr(codProduto));
   q.active:=true;


  if q.FieldByName('calcula_qtde').Value = 0 then
   result:=false
  else
   result:=true;

  FreeAndNil(q); 
end;










function  Tfrm_modelo_vazio.getNomeGarcon(cod_garcon : string) : string;
var
 q : TIBquery;
begin
 q := TIBquery.create(self);
 q.database:= dm.dbrestaurante;
 q.transaction:= dm.transacao;

 q.active:=false;
 q.sql.clear;
 q.sql.add(' select apelido from garcons where cod_garcon='+Quotedstr(cod_garcon));
 q.active:=true;

 result:= q.fieldbyname('apelido').value;

 FreeAndNil(q);
end;

function  Tfrm_modelo_vazio.getNumeroECFEmUso(numero_serie : string) : string;
var
 q : TIBquery;
begin
 q := TIBquery.create(self);
 q.database:= dm.dbrestaurante;
 q.transaction:= dm.transacao;

 q.active:=false;
 q.sql.clear;
 q.sql.add(' select * from impressoras_fiscais where num_serie='+Quotedstr(numero_serie));
 q.active:=true;



  if q.IsEmpty then
   begin
    showmessage('Impressora fiscal não localizada na tabela de impressoras fiscais!');
   end
  else
   begin
     result:= q.fieldbyname('NUMORDEM').value;
   end;






 FreeAndNil(q);
end;


procedure  Tfrm_modelo_vazio.SelecionaECFEmUso(numero_serie : string);
begin
 dm.qryEcfEmUso.Active := false;
 dm.qryEcfEmUso.sql.clear;
 dm.qryEcfEmUso.sql.add(' select * from impressoras_fiscais where num_serie='+Quotedstr(numero_serie));
 dm.qryEcfEmUso.active:=true;

 if dm.qryEcfEmUso.IsEmpty then
  begin
    showmessage('Impressora fiscal não localizada na tabela de impressoras fiscais!');
  end;

end;

function Tfrm_modelo_vazio.verificaExistenciaArquivoAuxiliarPAF(caminhoArquivoAuxiliar : string) : boolean;
begin

// showmessage('Caminho do arquivo: '+caminhoArquivoAuxiliar);
  if not (FileExists(caminhoArquivoAuxiliar)) then
    begin
      dm.exibe_painel_erro('O Arquivo auxliliar do PAF-ECF não foi encontrado.'+#13#10#13#10+' Não é possível emitir documentos fiscais!'+#13#10+'Entre em contato com a Real Softwares (71) 9988-2928' ,'Ok');
      result:=false;
      exit;
    end;

  result:= true;
end;

function Tfrm_modelo_vazio.validacaoArquivoAuxiliarPaf(caminhoArquivoAuxiliar : string) : boolean;
var
 gtECFAtual,gtEcfArquivo : double;
 erroACC : integer;
 numeroSerie : string;
begin

result:=false;

  if (not verificaExistenciaArquivoAuxiliarPAF(caminhoArquivoAuxiliar) ) then
    begin
      result:=false;
      exit;
    end;

   // Dados da software house


{  frm_principal.AAC.NomeArquivoAux := caminhoArquivoAuxiliar;
  frm_principal.AAC.AbrirArquivo;
  frm_principal.AAC.SalvarArquivo;

 }




  num_serie_ecf  := frm_principal.ECF.NumSerie;
  numeroECFEmUso := getNumeroECFEmUso(num_serie_ecf);
  SelecionaECFEmUso(num_serie_ecf);


//  ecfArquivoAuxiliar :=  frm_principal.AAC.AchaECF(num_serie_ecf);


// if ecfArquivoAuxiliar  = nil then
//   begin
//    dm.exibe_painel_erro('Número de série do ECF em uso não foi encontrado no Arquivo Auxiliar do PAF-ECF.'+#13#10#13#10+' Não é possível emitir documentos fiscais!'+#13#10+'Entre em contato com a Real Softwares (71) 9988-2928' ,'Ok');
//    result := false;
//    exit;
//   end;

// Alterar aqui, apagar quando reativar
result:=true;
exit;
///


 gtEcfArquivo :=ecfArquivoAuxiliar.ValorGT;

 gtECFAtual   := frm_principal.ECF.GrandeTotal;



 SelecionaECFEmUso(num_serie_ecf);

 dm.qryEcfEmUso.Active :=true;

 numeroSerie := dm.qryEcfEmUso.fieldbyname('NUM_SERIE').Value;

//  showmessage('peguei o numero de série :'+numeroSerie);
  erroACC := frm_principal.ECF.AAC.VerificarGTECF(numeroSerie,gtECFAtual);

 case erroACC of
  -2 : begin
//         dm.exibe_painel_erro('Grande Total do ECF em uso não coincide com o valor armazenado no arquivo auxiliar'+#13#10#13#10+'ECF        : '+FormatFloat('R$ ###,###,##0.00',frm_principal.ECF.GrandeTotal)+#13#10+' Arq. Aux: '+FormatFloat('R$ ###,###,##0.00',gtEcfArquivo)+#13#10#13#10+' Não é possível emitir documentos fiscais!'+#13#10+'Entre em contato com a Real Softwares (71) 9988-2928' ,'Ok');
//         result := false;
//         exit;
           result := true;
       end;

  -1 : begin
         dm.exibe_painel_erro('Número de série do ECF em uso não foi encontrado no Arquivo Auxiliar do PAF-ECF.'+#13#10#13#10+' Não é possível emitir documentos fiscais!'+#13#10+'Entre em contato com a Real Softwares (71) 9988-2928' ,'Ok');
         result:= false;
         exit;
       end;

  0  : begin

       end;
 end;

 Result := true;
end;



function  Tfrm_modelo_vazio.getValorTxEntregaBairro(codBairro : string) : double;
var
 q : TIBquery;
begin
 q := TIBquery.create(self);
 q.database:= dm.dbrestaurante;
 q.transaction:= dm.translog;



 q.Active:=false;
 q.sql.clear;
 q.sql.add('select txEntrega from bairro where codigo='+codBairro);
 q.Active:=true;
 result:= q.FieldByName('txEntrega').Value;

 q.Active:=false;
 FreeAndNil(q); 
end;


function  Tfrm_modelo_vazio.getValorTxEntregaPedido(codPedido : string) : double;
var
 q : TIBquery;
begin
 q := TIBquery.create(self);
 q.database:= dm.dbrestaurante;
 q.transaction:= dm.transacao;

 q.Active:=false;
 q.sql.clear;
 q.sql.add('select valor_entrega from pedidos_delivery where codigo='+QUotedstr(codPedido));
 q.Active:=true;
 result:= q.FieldByName('valor_entrega').Value;

 q.Active:=false;
 FreeAndNil(q); 
end;


function Tfrm_modelo_vazio.getValorProduto(codProduto : string ; tipo : smallint) : double;
var
 q : TIBQuery;
begin
  q := TIBQuery.Create(self);
  q.Database := dm.dbrestaurante;
  q.Transaction := dm.transacao;
  q.Active:=false;

  q.SQL.clear;
  if (tipo = 1)
   then
     q.sql.add('select valor_unitario from produtos where cod_produto='+QUotedstr(codProduto))
  else
     q.sql.add('select valor_unitario from produtos where cod_barras='+QUotedstr(codProduto));
     
   q.active:=true;
   result:= q.fields[0].Value;
  FreeAndNil(q);
end;





function Tfrm_modelo_vazio.verificaProdutoDigitaPreco(codBarrasProduto : string) : boolean;
var
 q : TIBQuery;
begin
  q := TIBQuery.Create(self);
  q.Database := dm.dbrestaurante;
  q.Transaction := dm.transacao;
  q.Active:=false;
  q.SQL.clear;
  q.sql.add('select * from produtos where cod_barras='+QUotedstr(codBarrasProduto));
  q.active:=true;

  if (q.FieldByName('preco_digitado').value  =0) then
   result:=false
  else
   result:=true;

  FreeAndNil(q);
end;


function Tfrm_modelo_vazio.verificaFaturaBaixada(cod_fatura : string) : boolean;
var
 q : TIBQuery;
begin
  q := TIBQuery.Create(self);
  q.Database := dm.dbrestaurante;
  q.Transaction := dm.transacao;
  q.Active:=false;
  q.SQL.clear;

  q.sql.add('select * from faturas where cod_fatura='+Quotedstr(cod_fatura));
  q.active:=true;

  if q.FieldByName('status').Value = 1 then
   result:=true
  else
   result:=false;

  FreeAndNil(q); 
end;



function Tfrm_modelo_vazio.getPrazoCliente(cod_cliente : string) :  integer;
var
 q : TIBQuery;
begin

  q := TIBQuery.Create(self);
  q.Database := dm.dbrestaurante;
  q.Transaction := dm.transacao;
  q.Active:=false;
  q.SQL.clear;
  q.sql.add('select * from clientes where cod_cli ='+Quotedstr(cod_cliente));
  q.Active:=true;

  result := q.fieldbyname('prazo_pagamento').value;
  FreeAndNil(q);
end;


function Tfrm_modelo_vazio.getNomeCliente(codCliente : string) :  string;
var
 q : TIBQuery;
begin
  q := TIBQuery.Create(self);
  q.Database := dm.dbrestaurante;
  q.Transaction := dm.transacao;
  q.Active:=false;
  q.SQL.clear;
  q.sql.add('select razao_social from clientes where cod_cli ='+Quotedstr(codCliente));
  q.Active:=true;
  result := q.fieldbyname('razao_social').value;
  FreeAndNil(q);
end;



function Tfrm_modelo_vazio.getEnderecoCliente(codCliente : string) :  string;
var
 q : TIBQuery;
begin
  q := TIBQuery.Create(self);
  q.Database := dm.dbrestaurante;
  q.Transaction := dm.transacao;
  q.Active:=false;
  q.SQL.clear;
  q.sql.add('select endereco from clientes where cod_cli ='+Quotedstr(codCliente));
  q.Active:=true;
  result := q.fieldbyname('endereco').value;
  FreeAndNil(q);
end;






function Tfrm_modelo_vazio.getTelefoneCliente(codCliente : string) :  string;
var
 q : TIBQuery;
begin
  q := TIBQuery.Create(self);
  q.Database := dm.dbrestaurante;
  q.Transaction := dm.transacao;
  q.Active:=false;
  q.SQL.clear;
  q.sql.add('select razao_social from clientes where cod_cli ='+Quotedstr(codCliente));
  q.Active:=true;
  result := q.fieldbyname('razao_social').value;
  FreeAndNil(q);
end;



function Tfrm_modelo_vazio.getCodClienteUsandoCartao(cartao : string) : string;
var
 qryInformacoesCliente : TIBQuery;
begin
    qryInformacoesCliente :=  TIBQuery.create(self);
    qryInformacoesCliente.Database := dm.dbrestaurante;
    qryInformacoesCliente.Transaction := dm.transacao;
    qryInformacoesCliente.Active:=false;
    qryInformacoesCliente.sql.clear;
    qryInformacoesCliente.SQL.Add('select c.cod_cartao,c.cod_cli,cl.razao_social    from cartoes c ');
    qryInformacoesCliente.SQL.Add('   inner join clientes cl on (cl.cod_cli = c.cod_cli) ');
    qryInformacoesCliente.SQL.Add('   where c.cod_cartao='+QuotedStr(cartao));
    qryInformacoesCliente.Active:=true;
    if (qryInformacoesCliente.FieldByName('cod_cli').value  <> null) then
      begin
        result:= qryInformacoesCliente.FieldByName('cod_cli').value;
//        nomeCliente := qryInformacoesCliente.FieldByName('razao_social').value;
      end
    else
      begin
        result := '';
      end;

    qryInformacoesCliente.Active:=false;
    FreeAndNil(qryInformacoesCliente);
end;


function Tfrm_modelo_vazio.getNomeClienteUsandoCartao(cartao : string) : string;
var
 qryInformacoesCliente : TIBQuery;
begin
    qryInformacoesCliente :=  TIBQuery.create(self);
    qryInformacoesCliente.Database := dm.dbrestaurante;
    qryInformacoesCliente.Transaction := dm.transacao;
    qryInformacoesCliente.Active:=false;
    qryInformacoesCliente.sql.clear;
    qryInformacoesCliente.SQL.Add('select c.cod_cartao,c.cod_cli,cl.razao_social    from cartoes c ');
    qryInformacoesCliente.SQL.Add('   inner join clientes cl on (cl.cod_cli = c.cod_cli) ');
    qryInformacoesCliente.SQL.Add('   where c.cod_cartao='+QuotedStr(cartao));
    qryInformacoesCliente.Active:=true;
    if (qryInformacoesCliente.FieldByName('cod_cli').value  <> null) then
      begin
        result := qryInformacoesCliente.FieldByName('razao_social').value;
      end
    else
      begin
        result := '';
      end;

    qryInformacoesCliente.Active:=false;
    FreeAndNil(qryInformacoesCliente);
end;



function Tfrm_modelo_vazio.getParametroUnidade(cod_unidade : string) : double;
var
 q : TIBQuery;
begin
  q := TIBQuery.Create(self);
  q.Database := dm.dbrestaurante;
  q.Transaction := dm.transacao;
  q.Active:=false;

  q.sql.clear;
  q.sql.add('select * from unidades where cod_unidade='+QUotedstr(cod_unidade));
  q.active:=true;
  result:= q.fieldbyname('parametro').Value;
  FreeAndNil(q); 
end;

function  Tfrm_modelo_vazio.getUnidadeEntradaItem (cod_item : string) : string;
var
 q : TIBQuery;
begin
  q := TIBQuery.Create(self);
  q.Database := dm.dbrestaurante;
  q.Transaction := dm.transacao;
  q.Active:=false;
  q.sql.clear;

  q.sql.add('select unidade_entrada from produtos where cod_produto='+Quotedstr(cod_item));
  q.active:=true;
  result:= q.fieldbyname('unidade_entrada').Value;
  FreeAndNil(q);
end;


procedure Tfrm_modelo_vazio.setTipoNotaFiscalSaida( tipo : smallint);
begin
  tipoNotaFiscalSaida := tipo;

end;



function Tfrm_modelo_vazio.getCodOperadorCaixa(codCaixa : string) : string;
var
 q : TIBquery;
begin
 q := TIBquery.create(self);
 q.database:= dm.dbrestaurante;
 q.transaction:= dm.transacao;

 q.active:=false;
 q.sql.clear;
 q.sql.add(' select * from caixas where codigo='+Quotedstr(codCaixa));
 q.active:=true;

 result := q.fieldbyname('cod_usuario').value;
 FreeAndNil(q);
end;


function Tfrm_modelo_vazio.getNomeOperadorCaixa(codCaixa : string) : string;
var
 q : TIBquery;
begin
 q := TIBquery.create(self);
 q.database:= dm.dbrestaurante;
 q.transaction:= dm.transacao;

 q.active:=false;
 q.sql.clear;
 q.sql.add(' select * from caixas where codigo='+Quotedstr(codCaixa));
 q.active:=true;

 result := q.fieldbyname('nome_usuario').value;
 FreeAndNil(q);
end;

function Tfrm_modelo_vazio.getDataSistemaCaixa(codCaixa : string) : Tdate;
var
 q : TIBquery;
begin
 q := TIBquery.create(self);
 q.database:= dm.dbrestaurante;
 q.transaction:= dm.transacao;

 q.active:=false;
 q.sql.clear;
 q.sql.add(' select data_sistema from caixas where codigo='+Quotedstr(codCaixa));
 q.active:=true;

 result := q.fieldbyname('data_sistema').value;
 FreeAndNil(q);
end;

function Tfrm_modelo_vazio.getTotalSuprimentosCaixa(codCaixa : string) : Double;
var
 q : TIBquery;
begin

 q := TIBquery.create(self);
 q.database:= dm.dbrestaurante;
 q.transaction:= dm.transacao;

 q.active:=false;
 q.sql.clear;
 q.sql.add(' select sum(valor) as total_suprimentos from suprimentos where cod_caixa='+Quotedstr(codCaixa));
 q.active:=true;

 if ( (q.FieldByName('total_suprimentos').value =0) or (q.FieldByName('total_suprimentos').value =NULL) )  then
  Result:=0
 else
 result := q.fieldbyname('total_suprimentos').value;

 FreeAndNil(q);
end;


function Tfrm_modelo_vazio.getTotalSangriasCaixa(codCaixa : string) : Double;
var
 q : TIBquery;
begin
 q := TIBquery.create(self);
 q.database:= dm.dbrestaurante;
 q.transaction:= dm.transacao;

 q.active:=false;
 q.sql.clear;
 q.sql.add(' select sum(valor) as total_sangrias from  sangrias where cod_caixa='+Quotedstr(codCaixa));
 q.active:=true;

 if ( (q.FieldByName('total_sangrias').value =0) or (q.FieldByName('total_sangrias').value =NULL) )  then
  Result:=0
 else
 result := q.fieldbyname('total_sangrias').value;

 FreeAndNil(q);
end;




function Tfrm_modelo_vazio.getTotalPendurasRecebidasCaixa(codCaixa : string) : Double;
var
 q : TIBquery;
begin
 q := TIBquery.create(self);
 q.database:= dm.dbrestaurante;
 q.transaction:= dm.transacao;

 q.active:=false;
 q.sql.clear;
 q.sql.add(' select sum(valor) as total_penduras from  recebimentos_fatura  where cod_caixa='+Quotedstr(codCaixa));
 q.active:=true;

 if ( (q.FieldByName('total_penduras').value =0) or (q.FieldByName('total_penduras').value =NULL) )  then
  Result:=0
 else
 result := q.fieldbyname('total_penduras').value;

 FreeAndNil(q);
end;






function Tfrm_modelo_vazio.getTotalTaxaServicoCaixa(codCaixa : string) : Double;
var
 q : TIBquery;
begin
 q := TIBquery.create(self);
 q.database:= dm.dbrestaurante;
 q.transaction:= dm.transacao;

 q.active:=false;
 q.sql.clear;
 q.sql.add(' select sum(valor_txserv) as total_taxa from vendas where cod_caixa='+Quotedstr(codCaixa));
 q.active:=true;

 if ( ( q.FieldByName('total_taxa').value =0) or (q.FieldByName('total_taxa').value = null)   ) then
  Result:=0
 else
 result := q.fieldbyname('total_taxa').value;

 FreeAndNil(q);
end;


function  Tfrm_modelo_vazio.getValorProdutosMesa(mesa : string) : double;
var
 q : TIBquery;
begin
 q := TIBquery.create(self);
 q.database:= dm.dbrestaurante;
 q.transaction:= dm.transacao;

 q.active:=false;
 q.sql.clear;
 q.sql.add('select * from rodapeextrato2('+Quotedstr(mesa)+','+dm.TrocaVirgPPto(Floattostr(percentualTaxaServico))+')');
 q.active:=true;

 if ( ( q.FieldByName('VALORBRUTO').value =0) or (q.FieldByName('VALORBRUTO').value = null)   ) then
  Result:=0
 else
 result := q.fieldbyname('VALORBRUTO').value;
 FreeAndNil(q);


end;

function Tfrm_modelo_vazio.getQtdePessoasMesa(mesa : string) : integer;
var
  Q : TIBQuery;
begin
  q := TIBQuery.Create(self);
  q.Database := dm.dbrestaurante;
  q.Transaction := dm.transacao;
  q.Active:=false;
  q.SQL.clear;

  q.SQL.Add('select qtd_pessoas from informacoes_mesa where mesa='+Quotedstr(mesa));
  q.Active:=true;

  if q.IsEmpty = false then
     result:= q.fieldbyname('qtd_pessoas').value
  else
   result:=1;

  q.Active:=false;
  FreeAndNil(q);
end;





procedure Tfrm_modelo_vazio.clickControlCurvyExecute(Sender: TObject);
begin
  if (Sender is TCurvyEdit) then
   begin
     if ( (sender as TCurvyEdit).Name = 'edCodFormaPagamento' ) then
      begin
        pesquisaFormaPagto();
      end;
   end;



end;

procedure Tfrm_modelo_vazio.pesquisaFormaPagamento(Sender: TObject);
begin
    case AnsiIndexStr( (sender as TComponent).Name , ['edCodFormaPagamento', 'TCurvyEdit']) of
      0 : begin
            pesquisaFormaPagamento(Sender);
          end;
      1 : begin
           pesquisaFormaPagamento(Sender);
          end;
    end;
end;


function Tfrm_modelo_vazio.validaQuantidade(Sender: TObject) : boolean;
var
 quantidade : string;
begin
    case AnsiIndexStr((Sender.ClassName), ['TEdit', 'TCurvyEdit']) of
      0 : begin
           quantidade  :=   (Sender as TEdit).Text;
          end;
      1 : begin
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


function Tfrm_modelo_vazio.validaValorPagamento(Sender: TObject) : boolean;
var
 valor : string;
begin
    case AnsiIndexStr((Sender.ClassName), ['TEdit', 'TCurvyEdit']) of
      0 : begin
           valor  :=   (Sender as TEdit).Text;
          end;
      1 : begin
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
 edCodForma        : TComponent;
 codigo : string;
begin


  edCodForma        := FindComponent('edCodFormaPagamento');

  if edCodForma <> nil then
   begin
    case AnsiIndexStr((edCodForma.ClassName), ['TEdit', 'TCurvyEdit']) of
      0 : begin
           codigo :=   (edCodForma as TEdit).Text;
          end;
      1 : begin
           codigo := (edCodForma as TCurvyEdit).Text;
          end;
    end;

    if(  trim(codigo) <> '' ) then
     begin
      try
        codigo := FormatFloat('000',StrToFloat(codigo));
       except
         Showmessage('Código da forma de pagamento é inválido!');
         (Sender as TWinControl).SetFocus;
         exit;
       end;

      if (verificaExistenciaFormaPagto(codigo) = false) then
       begin
          showmessage('Código de forma de pagamento inexistente');
          (Sender as TWinControl).SetFocus;
          exit;
       end
      else
       begin
         exibeInformacoesFormaDePagamento(codigo);
       end;
     end;

   end;
end;

procedure Tfrm_modelo_vazio.AtualizaQtdePessoasMesa(mesa : string ; qtdePessoas : string);
var
  Q : TIBQuery;
begin
  q := TIBQuery.Create(self);
  q.Database := dm.dbrestaurante;
  q.Transaction := dm.transacao;
  q.Active:=false;
  q.SQL.clear;

  q.SQL.Add('update informacoes_mesa set qtd_pessoas='+qtdePessoas+' where mesa='+Quotedstr(mesa));
  q.ExecSQL;

  dm.transacao.Commit;
  dm.transacao.Active:=false;
  dm.transacao.Active:=true;
  FreeAndNil(q);
end;

function Tfrm_modelo_vazio.getHoraAberturaCaixa(codCaixa : string) : Ttime;
var
 q : TIBquery;
begin
 q := TIBquery.create(self);
 q.database:= dm.dbrestaurante;
 q.transaction:= dm.transacao;

 q.active:=false;
 q.sql.clear;
 q.sql.add(' select * from caixas where codigo='+Quotedstr(codCaixa));
 q.active:=true;

 result := q.fieldbyname('hora_abertura').value;
 FreeAndNil(q);
end;



function Tfrm_modelo_vazio.getHoraFechamentoCaixa(codCaixa : string) : Ttime;
var
 q : TIBquery;
begin
 q := TIBquery.create(self);
 q.database:= dm.dbrestaurante;
 q.transaction:= dm.transacao;

 q.active:=false;
 q.sql.clear;
 q.sql.add(' select * from caixas where codigo='+Quotedstr(codCaixa));
 q.active:=true;

 result := q.fieldbyname('hora_fechamento').value;
 FreeAndNil(q);
end;






procedure Tfrm_modelo_vazio.exibeInformacoes(componenteChavePesquisa : string; componenteRecebeRetorno : string;  tabela : string;
          campos : string;cp_pesq: string; param_pesq: string; cp_ret : integer);
var
 i : integer;
begin

 For  i:=0 to ComponentCount-1 do
  begin
    if (components[i].Name = componenteChavePesquisa ) then
      if (Components[i].ClassType = TCustomEdit) then
        param_pesq:=(components[i] as TCustomEdit).text

  End;

 For  i:=0 to ComponentCount-1 do
  begin
    if (components[i].Name = componenteRecebeRetorno ) then
      if (Components[i].ClassType = TEdit) then
         (components[i] as Tedit).text:= dm.retornaCampoQQTabela(tabela,campos,cp_pesq,param_pesq,cp_ret)
      else
         (components[i] as Tdbedit).text:=dm.retornaCampoQQTabela(tabela,campos,cp_pesq,param_pesq,cp_ret);
  End;
end;


procedure Tfrm_modelo_vazio.setCaption (caption : string);
begin
  self.caption:= caption;
end;

procedure Tfrm_modelo_vazio.Edit1Enter(Sender: TObject);
begin

  if sender is TCustomEdit then
   begin
        (sender as TCustomEdit).Brush.Color := clMoneyGreen;
      (sender as TCustomEdit).Repaint;
      (sender as TCustomEdit).SelectAll;

   end;

  if sender is TEdit then
   begin
      (sender as TEdit).Brush.Color := clMoneyGreen;
      (sender as TEdit).Repaint;
      (sender as TEdit).SelectAll;

   end;

  if sender is TDBEdit then
   begin
      (sender as TDBEdit).Brush.Color := clMoneyGreen;
      (sender as TDBEdit).Repaint;
      (sender as TDBEdit).SelectAll;

   end;

  if sender is TDBEdit then
   begin
      (sender as TDBEdit).Brush.Color := clMoneyGreen;
      (sender as TDBEdit).Repaint;
      (sender as TDBEdit).SelectAll;
   end;



  if  sender is TComboBox then
  begin
   (sender as TComboBox).DroppedDown:=true;
    sendmessage( (sender as TComboBox).Handle,CB_SHOWDROPDOWN,1,0);
   (sender as TComboBox).Color := cor_ao_entrar;
  end;

  if  sender is TDBLookupComboBox then
  begin
   (sender as TcxLookupComboBox).Properties.IncrementalSearch := false;
   (sender as TDBLookupComboBox).DropDown;
    sendmessage( (sender as TDBLookupComboBox).Handle,CB_SHOWDROPDOWN,1,0);
   (sender as TDBLookupComboBox).Color := cor_ao_entrar;
  end;

  if sender is Tdbgrid then
   begin
     (sender as TDBGrid).Color := clMoneyGreen;
     (sender as TDBGrid).Repaint;
   end;

   if sender is TcxLookupComboBox  then
    begin
     (sender as TcxLookupComboBox).DroppedDown  := true;
      sendmessage( (sender as TcxLookupComboBox).Handle,CB_SHOWDROPDOWN,1,0);
      (sender as TcxLookupComboBox).Style.Color := cor_ao_entrar;
    end;


end;




function Tfrm_modelo_vazio.verificaSeItemEhSubmateria(cod_item_estoque : string) : boolean;
var
 q : TIBQuery;
 i :  integer;
begin

  q := TIBQuery.Create(self);
  q.Database := dm.dbrestaurante;
  q.Transaction := dm.transacao;
  q.Active:=false;

  q.sql.clear;
  q.sql.add(' select submateria from produtos where cod_produto='+Quotedstr(cod_item_estoque));
  q.Active:=true;

  if q.FieldByName('submateria').Value = 1 then
    Result:=true
  else
    Result:=false;

   q.Active:=false;
   FreeAndNil(q); 
end;



procedure Tfrm_modelo_vazio.exibeInformacoesItemEstoque(cod_item_estoque : string; campo : integer);
var
 q : TIBQuery;
 i :  integer;
begin


  q := TIBQuery.Create(self);

  q.Database := dm.dbrestaurante;
  q.Transaction := dm.transacao;
  q.Active:=false;


  q.sql.clear;
  q.sql.clear;
  q.sql.add(' select  it.* , gp.descricao as desc_grupo,');
  q.sql.add('   un.descricao as desc_unidade,  un.parametro, (it.estoque_liquido / un.parametro) as estoque,un2.descricao as descUnidadeFracao, vit.fracao_estoque,');
  q.sql.add('   udf_replace(cast(vit.estoque_inteiro as varchar(12)),'+Quotedstr('.')+','+Quotedstr(',')+')||'+Quotedstr('     ')+'||vit.descricao_entrada||'+Quotedstr('  +  ')+'||cast(vit.fracao_estoque   as varchar(12))  ||'+Quotedstr('     ')+'||vit.descricao_fracao as estoqueComFracao,');
  q.sql.add('   udf_replace(udf_copy(cast(vit.estoque_total as varchar(15)),0,6),'+Quotedstr('.')+','+Quotedstr(',')+')||'+Quotedstr('     ')+'||vit.descricao_entrada as estoqueSemFracao ');
  q.sql.add('    from produtos it');
  q.sql.add('   inner join v_itens_estoque vit on (vit.cod_item = it.cod_produto)');
  q.sql.add('   inner join grupos gp on (gp.cod_grupo = it.cod_grupo)');
  q.sql.add('   inner join unidades un on (un.cod_unidade = it.unidade_entrada)');
  q.sql.add('   inner join unidades un2 on (un2.cod_unidade = it.cod_unidade_fracao)');
  q.sql.add(' where it.cod_produto='+Quotedstr(cod_item_estoque));
  q.Active:=true;


  if q.IsEmpty then exit;


   For  i:=0 to ComponentCount-1 do
    begin
      if (components[i].Name = 'ed_cod_item') then
         (components[i] as TCustomEdit).text:= q.fieldbyname('cod_produto').value;

      if (components[i].Name = 'ed_cod_item_saida') then
         (components[i] as TCustomEdit).text:= q.fieldbyname('cod_produto').value;


      if (components[i].Name = 'ed_cod_barras_item') then
         (components[i] as TCustomEdit).text:= q.fieldbyname('barras').Value;


      if (components[i].Name = 'ed_desc_item') then
         (components[i] as TCustomEdit).text:= q.fieldbyname('descricao').Value;

      if (components[i].Name = 'ed_estoque_item') then
         (components[i] as TCustomEdit).text:=FormatFloat('#0.000',q.fieldbyname('estoque').Value);

      if (components[i].Name = 'edEstoqueCompletoItem') then
        begin
          if ( q.fieldbyname('unidade_entrada').Value = q.fieldbyname('cod_unidade_fracao').Value) then  // se as unidades de entrada e fracao forem iguais, não mostra fração
            (components[i] as TCustomEdit).text:=q.fieldbyname('estoqueSemFracao').Value
          else
            if q.FieldByName('fracao_Estoque').Value > 0 then
               (components[i] as TCustomEdit).text:=q.fieldbyname('estoqueComFracao').Value
            else
               (components[i] as TCustomEdit).text:=q.fieldbyname('estoqueSemFracao').Value
        end;



      if (components[i].Name = 'ed_cod_unidade_item') then
         (components[i] as TCustomEdit).text:= q.fieldbyname('unidade_entrada').Value;

      if (components[i].Name = 'ed_unidade_item') then
         (components[i] as TCustomEdit).text:= q.fieldbyname('desc_unidade').Value;


      if (components[i].Name = 'ed_cod_un_entrada') then
         (components[i] as TCustomEdit).text:= q.fieldbyname('unidade_entrada').Value;

      if (components[i].Name = 'ed_desc_un_entrada') then
         (components[i] as TCustomEdit).text:= q.fieldbyname('desc_unidade').Value;



      if (components[i].Name = 'ed_ultima_compra_item') then
         (components[i] as TCustomEdit).text:= FormatDateTime('DD/MM/YYY',q.fieldbyname('DATA_ULTIMA_REPOSICAO').Value);

      if (components[i].Name = 'ed_sigla_un_item') then
         (components[i] as TCustomEdit).text:= q.fieldbyname('SIGLA_NOTA').Value;

      if (components[i].Name = 'ed_cfop_item') then
         (components[i] as TCustomEdit).text:= q.fieldbyname('cfop').Value;

      if (components[i].Name = 'ed_cst_item') then
         (components[i] as TCustomEdit).text:= q.fieldbyname('cst').Value;


      if (components[i].Name = 'ed_cfop_saida_item') then
         (components[i] as TCustomEdit).text:= q.fieldbyname('cfop_saida').Value;

      if (components[i].Name = 'ed_cst_saida_item') then
         (components[i] as TCustomEdit).text:= q.fieldbyname('cst_saida').Value;


      if (components[i].Name = 'edNCMITEM') then
         (components[i] as TCustomEdit).text:= q.fieldbyname('NCM').Value;

      if (components[i].Name = 'EDIAliquotaICMSSAIDAITEM') then
         (components[i] as TCustomEdit).text:=  Floattostr(q.fieldbyname('aliquotaICMS').Value);

    End;
    FreeAndNil(q);
end;





procedure Tfrm_modelo_vazio.exibeInformacoesItemSaida(cod_item_estoque : string; campo : integer);
var
 q : TIBQuery;
 i :  integer;
begin



  q := TIBQuery.Create(self);
  q.Database := dm.dbrestaurante;
  q.Transaction := dm.transacao;
  q.Active:=false;


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
        q.sql.add(' where it.cod_produto='+Quotedstr(cod_item_estoque));
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
        q.sql.add(' where it.cod_produto='+Quotedstr(cod_item_estoque));

     end;

   2: begin
        q.sql.clear;
        q.sql.add('  select  it.*, al.percentual_icms as aliquotaICMS, gp.descricao as desc_grupo, ');
        q.sql.add('    cf.codigo as cfop_usar, cf.descricao as descricaoCFOP, ');
        q.sql.add('    ct.cst as cst_usar, ct.descricao as descricaoCST ');
        q.sql.add('     from produtos it ');
        q.sql.add('    inner join aliquotas al on (al.cod_aliquota =it.cod_aliquota) ');
        q.sql.add('    inner join grupos gp on (gp.cod_grupo = it.cod_grupo) ');
        q.sql.add('    inner join cfop cf  on (cf.codigo = it.cfop_transferencias) ');
        q.sql.add('    inner join cst ct on (ct.cst = it.cst_transferencias) ');
        q.sql.add(' where it.cod_produto='+Quotedstr(cod_item_estoque));
      end;
  end;

  q.Active := True;

 





  if q.IsEmpty then exit;


   For  i:=0 to ComponentCount-1 do
    begin
      if (components[i].Name = 'ed_cod_item') then
         (components[i] as TCustomEdit).text:= q.fieldbyname('cod_produto').value;

      if (components[i].Name = 'ed_cod_item_saida') then
         (components[i] as TCustomEdit).text:= q.fieldbyname('cod_produto').value;


      if (components[i].Name = 'ed_cod_barras_item') then
         (components[i] as TCustomEdit).text:= q.fieldbyname('barras').Value;


      if (components[i].Name = 'ed_desc_item') then
         (components[i] as TCustomEdit).text:= q.fieldbyname('descricao').Value;

      if (components[i].Name = 'ed_estoque_item') then
         (components[i] as TCustomEdit).text:=FormatFloat('#0.000',q.fieldbyname('estoque').Value);

      if (components[i].Name = 'edEstoqueCompletoItem') then
        begin
          if ( q.fieldbyname('unidade_entrada').Value = q.fieldbyname('cod_unidade_fracao').Value) then  // se as unidades de entrada e fracao forem iguais, não mostra fração
            (components[i] as TCustomEdit).text:=q.fieldbyname('estoqueSemFracao').Value
          else
            if q.FieldByName('fracao_Estoque').Value > 0 then
               (components[i] as TCustomEdit).text:=q.fieldbyname('estoqueComFracao').Value
            else
               (components[i] as TCustomEdit).text:=q.fieldbyname('estoqueSemFracao').Value
        end;



      if (components[i].Name = 'ed_cod_unidade_item') then
         (components[i] as TCustomEdit).text:= q.fieldbyname('unidade_entrada').Value;

      if (components[i].Name = 'ed_unidade_item') then
         (components[i] as TCustomEdit).text:= q.fieldbyname('desc_unidade').Value;

      if (components[i].Name = 'ed_ultima_compra_item') then
         (components[i] as TCustomEdit).text:= FormatDateTime('DD/MM/YYY',q.fieldbyname('DATA_ULTIMA_REPOSICAO').Value);

      if (components[i].Name = 'ed_sigla_un_item') then
         (components[i] as TCustomEdit).text:= q.fieldbyname('SIGLA_NOTA').Value;

      if (components[i].Name = 'ed_cfop_item') then
         (components[i] as TCustomEdit).text:= q.fieldbyname('cfop').Value;

      if (components[i].Name = 'ed_cst_item') then
         (components[i] as TCustomEdit).text:= q.fieldbyname('cst').Value;


      if (components[i].Name = 'ed_cfop_saida_item') then
         (components[i] as TCustomEdit).text:= q.fieldbyname('cfop_usar').Value;

      if (components[i].Name = 'ed_cst_saida_item') then
         (components[i] as TCustomEdit).text:= q.fieldbyname('cst_usar').Value;


      if (components[i].Name = 'edNCMITEM') then
         (components[i] as TCustomEdit).text:= q.fieldbyname('NCM').Value;

      if (components[i].Name = 'EDIAliquotaICMSSAIDAITEM') then
         (components[i] as TCurrencyEdit).Value := q.fieldbyname('aliquotaICMS').Value;

      if (components[i].Name = 'EDIpreco') then
         (components[i] as TCurrencyEdit).Value := q.fieldbyname('valor_unitario').Value;


    End;

    FreeAndNil(q);
end;







procedure Tfrm_modelo_vazio.exibeInformacoesSubMateria(cod_item_estoque : string; campo : integer);
var
 q : TIBQuery;
 i :  integer;
 estoque : string;
begin

  q := TIBQuery.Create(self);
  q.Database := dm.dbrestaurante;
  q.Transaction := dm.transacao;
  q.Active:=false;

  q.sql.clear;
  q.sql.add(' select  it.* , gp.descricao as desc_grupo,  un.descricao as desc_unidade,  un.parametro, (it.estoque_liquido / un.parametro) as estoque,un2.descricao as descUnidadeFracao,');
  q.sql.add('   udf_replace(cast(vit.estoque_inteiro as varchar(7)),'+Quotedstr('.')+','+Quotedstr(',')+')||'+Quotedstr('     ')+'||vit.descricao_entrada||'+Quotedstr('  +  ')+'||cast(vit.fracao_estoque   as varchar(7))  ||'+Quotedstr('     ')+'||vit.descricao_fracao as estoqueComFracao,');
  q.sql.add('   udf_replace(udf_copy(cast(vit.estoque_total as varchar(10)),0,6),'+Quotedstr('.')+','+Quotedstr(',')+')||'+Quotedstr('     ')+'||vit.descricao_entrada as estoqueSemFracao ');

  q.sql.add('   from produtos it');
  q.sql.add('   inner join v_itens_estoque vit on (vit.cod_item = it.cod_produto)');
  q.sql.add('   inner join grupos gp on (gp.cod_grupo = it.cod_grupo)');
  q.sql.add('   inner join unidades un on (un.cod_unidade = it.unidade_entrada)');
  q.sql.add('   inner join unidades un2 on (un2.cod_unidade = it.cod_unidade_fracao)');




  if campo = 1 then
    q.sql.add(' where it.cod_produto='+Quotedstr(cod_item_estoque))
  else
    q.sql.add(' where it.cod_barras='+Quotedstr(cod_item_estoque));

  dm.adicionaLog(q.SQL.Text);
  q.Active:=true;




  if q.IsEmpty then exit;


   For  i:=0 to ComponentCount-1 do
    begin
      if (components[i].Name = 'edCodSubmateria') then
         (components[i] as TCustomEdit).text:= q.fieldbyname('cod_produto').value;

      if (components[i].Name = 'edCodBarrasSubmateria') then
         (components[i] as TCustomEdit).text:= q.fieldbyname('barras').Value;


      if (components[i].Name = 'edDescricaoSubmateria') then
         (components[i] as TCustomEdit).text:= q.fieldbyname('descricao').Value;



      if (components[i].Name = 'edEstoqueSubmateria') then
        begin
         if ( q.fieldbyname('unidade_entrada').Value = q.fieldbyname('cod_unidade_fracao').Value) then  // se as unidades de entrada e fracao forem iguais, não mostra fração
            (components[i] as TCustomEdit).text:=q.fieldbyname('estoqueSemFracao').Value
        else
           (components[i] as TCustomEdit).text:=q.fieldbyname('estoqueComFracao').Value;


        end;

      if (components[i].Name = 'edCodUnidadeSubmateria') then
         (components[i] as TCustomEdit).text:= q.fieldbyname('unidade_entrada').Value;

      if (components[i].Name = 'edDescUnidadeSubmateria') then
         (components[i] as TCustomEdit).text:= q.fieldbyname('desc_unidade').Value;

      if (components[i].Name = 'edUltimaCompraSubmateria') then
         (components[i] as TCustomEdit).text:= FormatDateTime('DD/MM/YYY',q.fieldbyname('DATA_ULTIMA_REPOSICAO').Value);

      if (components[i].Name = 'edSiglaUnSubmateria') then
         (components[i] as TCustomEdit).text:= q.fieldbyname('SIGLA_NOTA').Value;

      if (components[i].Name = 'edCfopSubmateria') then
         (components[i] as TCustomEdit).text:= q.fieldbyname('cfop').Value;

      if (components[i].Name = 'ed_cst_item') then
         (components[i] as TCustomEdit).text:= q.fieldbyname('cst').Value;



    End;

    FreeAndNil(q); 
end;




procedure Tfrm_modelo_vazio.exibeInformacoesTipoBaixaEstoque(codTipo : string);
var
 q : TIBQuery;
 i :  integer;
 estoque : string;
begin

  q := TIBQuery.Create(self);
  q.Database := dm.dbrestaurante;
  q.Transaction := dm.transacao;
  q.Active:=false;
  q.SQL.Clear;
  q.SQL.Add('select * from tipos_baixa where cod_tipo='+Quotedstr(codtipo));
  q.Active:=true;

  if q.IsEmpty = false then
   begin
     For  i:=0 to ComponentCount-1 do
      begin
        if (components[i].Name = 'edCodTipoBaixaEstoque') then
           (components[i] as TCustomEdit).text:= q.fieldbyname('cod_tipo').value;

          if (components[i].Name = 'edDescricaoTipoBaixaEstoque') then
             (components[i] as TCustomEdit).text:= q.fieldbyname('descricao').value;
      End;
   end;

   q.Active:=false;
   FreeAndNil(q);
end;



procedure Tfrm_modelo_vazio.exibeInformacoesUnidadeEntrada(cod_unidade_entrada : string);
var
 q : TIBQuery;
 i :  integer;
begin
  q := TIBQuery.Create(self);
  q.Database := dm.dbrestaurante;
  q.Transaction := dm.transacao;
  q.Active:=false;


  q.Active:=false;
  q.sql.clear;
  q.sql.add('select * from unidades where cod_unidade='+Quotedstr(cod_unidade_entrada));
  q.Active:=true;
  if q.IsEmpty then exit;

 For  i:=0 to ComponentCount-1 do
    begin
      if (components[i].Name = 'ed_cod_un_entrada') then
         (components[i] as TCustomEdit).text:= q.fieldbyname('cod_unidade').value;

      if (components[i].Name = 'ed_desc_un_entrada') then
         (components[i] as TCustomEdit).text:= q.fieldbyname('descricao').Value;
    End;
  FreeAndNil(q);
end;


procedure Tfrm_modelo_vazio.exibeInformacoesUnidadeSaida(cod_unidade_saida : string);
var
 q : TIBQuery;
 i :  integer;
begin
  q := TIBQuery.Create(self);
  q.Database := dm.dbrestaurante;
  q.Transaction := dm.transacao;
  q.Active:=false;


  q.Active:=false;
  q.sql.clear;
  q.sql.add('select * from unidades where cod_unidade='+Quotedstr(cod_unidade_saida));
  q.Active:=true;
  if q.IsEmpty then exit;

 For  i:=0 to ComponentCount-1 do
    begin
      if (components[i].Name = 'ed_cod_un_saida') then
         (components[i] as TCustomEdit).text:= q.fieldbyname('cod_unidade').value;

      if (components[i].Name = 'ed_desc_un_saida') then
         (components[i] as TCustomEdit).text:= q.fieldbyname('descricao').Value;
    End;
    FreeAndNil(q); 
end;


procedure Tfrm_modelo_vazio.exibeInformacoesSaborPizza(codSabor : string);
var
 q : TIBQuery;
 i :  integer;
begin
  q := TIBQuery.Create(self);
  q.Database := dm.dbrestaurante;
  q.Transaction := dm.transacao;
  q.Active:=false;


 q.active:=false;
 q.sql.clear;
 q.sql.add('select * from sabores_pizza where codigo='+Quotedstr(codSabor));
 q.active:=true;
  if q.IsEmpty then exit;

 For  i:=0 to ComponentCount-1 do
    begin
      if (components[i].Name = 'edCodSaborPizza') then
         (components[i] as TCustomEdit).text:= q.fieldbyname('codigo').value;

      if (components[i].Name = 'edDescSaborPizza') then
         (components[i] as TCustomEdit).text:= q.fieldbyname('descricao').Value;
    End;
    FreeAndNil(q);
end;



procedure Tfrm_modelo_vazio.exibeInformacoesUnidadeDeFracao(codUnFracao : string);
var
 q : TIBQuery;
 i :  integer;
begin
  q := TIBQuery.Create(self);
  q.Database := dm.dbrestaurante;
  q.Transaction := dm.transacao;
  q.Active:=false;


  q.Active:=false;
  q.sql.clear;
  q.sql.add('select * from unidades where cod_unidade='+Quotedstr(codUnFracao));
  q.Active:=true;
  if q.IsEmpty then exit;

 For  i:=0 to ComponentCount-1 do
    begin
      if (components[i].Name = 'edCodUnFracao') then
         (components[i] as TCustomEdit).text:= q.fieldbyname('cod_unidade').value;

      if (components[i].Name = 'edDescUnFracao') then
         (components[i] as TCustomEdit).text:= q.fieldbyname('descricao').Value;
    End;

 FreeAndNil(q); 
end;



procedure Tfrm_modelo_vazio.exibeInformacoesAliquota(codAliquota : string);
var
 q : TIBQuery;
 i :  integer;
begin
  q := TIBQuery.Create(self);
  q.Database := dm.dbrestaurante;
  q.Transaction := dm.transacao;
  q.Active:=false;


  q.Active:=false;
  q.sql.clear;
  q.sql.add('select * from aliquotas where cod_aliquota='+Quotedstr(codAliquota));
  q.Active:=true;
  if q.IsEmpty then exit;

 For  i:=0 to ComponentCount-1 do
    begin
      if (components[i].Name = 'edCodAliquota') then
         (components[i] as TCustomEdit).text:= q.fieldbyname('cod_aliquota').value;

      if (components[i].Name = 'edDescAliquota') then
         (components[i] as TCustomEdit).text:= q.fieldbyname('descricao').Value;
    End;

    FreeAndNil(q); 
end;



procedure Tfrm_modelo_vazio.exibeInformacoesFormaDePagamento(codForma : string);
var
 q : TIBQuery;
 i :  integer;
 edCodForma        : TComponent;
 edDescricaoForma  : TComponent;
begin


  q := TIBQuery.Create(self);
  q.Database := dm.dbrestaurante;
  q.Transaction := dm.transacao;
  q.Active:=false;


  q.Active:=false;
  q.sql.clear;
  q.sql.add('select cod_forma, descricao from formas_pagamento where cod_forma='+Quotedstr(codForma));
  q.Active:=true;


 edCodForma        := FindComponent('edCodFormaPagamento');
 edDescricaoForma  := FindComponent('edDescricaoForma');

  if edCodForma <> nil then
   begin
    case AnsiIndexStr((edCodForma.ClassName), ['TEdit', 'TCurvyEdit']) of
      0 : begin
            (edCodForma as TEdit).Text := q.fields[0].Value;
          end;
      1 : begin
           (edCodForma as TCurvyEdit).Text := q.fields[0].Value;
          end;
    end;
   end;


  if edDescricaoForma  <> nil then
   begin
    case AnsiIndexStr((edDescricaoForma.ClassName), ['TEdit', 'TCurvyEdit']) of
      0 : begin
            (edDescricaoForma  as TEdit).Text := q.fields[1].Value;
          end;
      1 : begin
           (edDescricaoForma as TCurvyEdit).Text := q.fields[1].Value;
          end;
    end;
   end;


end;


procedure Tfrm_modelo_vazio.exibeInformacoesLoja(codLoja: string);
var
 q : TIBQuery;
 i :  integer;
begin
  q := TIBQuery.Create(self);
  q.Database := dm.dbrestaurante;
  q.Transaction := dm.transacao;
  q.Active:=false;


  q.Active:=false;
  q.sql.clear;
  q.sql.add('select * from empresas_grupo where codigo='+Quotedstr(codLoja));
  q.Active:=true;
  if q.IsEmpty then exit;

 For  i:=0 to ComponentCount-1 do
    begin
      if (components[i].Name = 'edCodLoja') then
         (components[i] as TCustomEdit).text:= q.fieldbyname('codigo').value;

      if (components[i].Name = 'edDescLoja') then
         (components[i] as TCustomEdit).text:= q.fieldbyname('descricao').Value;

      if (components[i].Name = 'edCodFornecedorLoja') then
         (components[i] as TCustomEdit).text:= q.fieldbyname('cod_tab_fornecedor').Value;

    End;

    FreeAndNil(q);
end;





function Tfrm_modelo_vazio.getAliasEmpresaGrupo(codEmpresa: string) : string;
var
 q : TIBQuery;
 i :  integer;
begin
  q := TIBQuery.Create(self);
  q.Database := dm.dbrestaurante;
  q.Transaction := dm.transacao;
  q.Active:=false;


  q.Active:=false;
  q.sql.clear;
  q.sql.add('select * from empresas_grupo where codigo='+Quotedstr(codEmpresa));
  q.Active:=true;

  Result := q.fieldbyname('alias').Value;
    FreeAndNil(q);
end;



procedure Tfrm_modelo_vazio.exibeInformacoesClienteDelivery(codCli : string);
var
 q : TIBQuery;
 i :  integer;
begin
  q := TIBQuery.Create(self);
  q.Database := dm.dbrestaurante;
  q.Transaction := dm.transacao;
  q.Active:=false;


  q.Active:=false;
  q.sql.clear;
  q.sql.add('select * from clientes_delivery where codigo='+Quotedstr(codCli));
  q.Active:=true;
  if q.IsEmpty then exit;

 For  i:=0 to ComponentCount-1 do
    begin
      if (components[i].Name = 'edCodCliDelivery') then
         (components[i] as TCustomEdit).text:= q.fieldbyname('codigo').value;

      if (components[i].Name = 'edNomeClienteDelivery') then
         (components[i] as TCustomEdit).text:= q.fieldbyname('nome').Value;
    End;

    FreeAndNil(q);
end;


procedure Tfrm_modelo_vazio.exibeInformacoesClienteFaturamento(codCli : string );
var
 q : TIBQuery;
 q2 : TIBQuery;
 i :  integer;
 totalUtilizadoLimite : double;
begin

  q := TIBQuery.Create(self);
  q.Database := dm.dbrestaurante;
  q.Transaction := dm.transacao;
  q.Active:=false;


  q2 := TIBQuery.Create(self);
  q2.Database := dm.dbrestaurante;
  q2.Transaction := dm.transacao;
  q2.Active:=false;


  q.Active:=false;
  q.sql.clear;
  q.sql.add('select cl.* from clientes cl where cl.cod_cli='+Quotedstr(codCli));
  q.Active:=true;
  if q.IsEmpty then
   begin
     FreeAndNil(q2);
     FreeAndNil(q);
     exit;
   end;


  q2.Active :=false;
  q2.SQL.Clear;
  q2.SQL.Add('select sum(valor_fatura) as limiteUtilizado from faturas where cod_cli='+Quotedstr(codCli)+' and status=0');
  q2.active:=true;

  if q2.fieldbyname('limiteUtilizado').Value = null then
     totalUtilizadoLimite :=0
  else
    totalUtilizadoLimite := q2.fieldbyname('limiteUtilizado').Value;


 For  i:=0 to ComponentCount-1 do
    begin
      if (components[i].Name = 'ed_cod_cliente') then
         (components[i] as TCustomEdit).text:= q.fieldbyname('cod_cli').value;

      if (components[i].Name = 'ed_desc_cliente') then
         (components[i] as TCustomEdit).text:= q.fieldbyname('razao_social').Value;

      if (components[i].Name = 'edLimiteTotalClienteFaturado') then
         (components[i] as TCurrencyEdit).value := q.fieldbyname('credito').Value;

      if (components[i].Name = 'edLimiteUtilizadolClienteFaturado') then
         (components[i] as TCurrencyEdit).value := totalUtilizadoLimite;

      if (components[i].Name = 'edLimiteLivreClienteFaturado') then
         (components[i] as TCurrencyEdit).value := q.fieldbyname('credito').Value - totalUtilizadoLimite;



    End;

    FreeAndNil(q2);
    FreeAndNil(q);
end;



procedure Tfrm_modelo_vazio.exibeInformacoesClienteBoateRG(rgCliente : string);
var
 q : TIBQuery;
 i :  integer;
begin
  q := TIBQuery.Create(self);
  q.Database := dm.dbrestaurante;
  q.Transaction := dm.transacao;
  q.Active:=false;


  q.Active:=false;
  q.sql.clear;
  q.sql.add('select cli.cod_cli,cli.razao_social from clientes cli where cli.rg='+Quotedstr(rgCliente));
  q.Active:=true;
  if q.IsEmpty then exit;

 For  i:=0 to ComponentCount-1 do
    begin
      if (components[i].Name = 'edCodCliBoate') then
         (components[i] as TCustomEdit).text:= q.fieldbyname('cod_cli').value;

      if (components[i].Name = 'edNomeClienteBoate') then
         (components[i] as TCustomEdit).text:= q.fieldbyname('razao_social').Value;
    End;

    FreeAndNil(q);
end;



















procedure Tfrm_modelo_vazio.exibeInformacoesFornecedor(cod_fornecedor : string);
var
 q : TIBQuery;
 i :  integer;
begin
  q := TIBQuery.Create(self);
  q.Database := dm.dbrestaurante;
  q.Transaction := dm.transacao;
  q.Active:=false;


  q.Active:=false;
  q.sql.clear;


  q.sql.add(' select f.*,  c.nome as NomeCidade, e.nome as NomeEstado, e.sigla UF  from fornecedor f');
  q.sql.add('   inner join cidade c on (c.cod_cidade = f.cod_cidade)');
  q.sql.add('   inner join estado e on (e.codigo = f.cod_estado)');
  q.sql.add(' where f.cod_fornecedor='+Quotedstr(cod_fornecedor));

  q.Active:=true;
  if q.IsEmpty then exit;

 For  i:=0 to ComponentCount-1 do
    begin
      if (components[i].Name = 'ed_cod_fornecedor') then
        begin

         (components[i] as TCustomEdit).text:= q.fieldbyname('cod_fornecedor').value;
         end;

      if (components[i].Name = 'ed_razao_social_fornecedor') then
         (components[i] as TCustomEdit).text:= q.fieldbyname('razao_social').Value;

      if (components[i].Name = 'ed_nome_fantasia_fornecedor') then
         (components[i] as TCustomEdit).text:= q.fieldbyname('nome_fantasia').Value;

      if (components[i].Name = 'ed_cnpj_fornecedor') then
         (components[i] as TCustomEdit).text:= q.fieldbyname('CGC_CPF').Value;


      if (components[i].Name = 'ed_cidade_fornecedor') then
         (components[i] as TCustomEdit).text:= q.fieldbyname('NomeCidade').Value;

      if (components[i].Name = 'ed_uf_fornecedor') then
         (components[i] as TCustomEdit).text:= q.fieldbyname('uf').Value;

    End;

    FreeAndNil(q);
end;




procedure Tfrm_modelo_vazio.exibeInformacoesFornecedorCNPJ(CNPJfornecedor : string);
var
 q : TIBQuery;
 i :  integer;
begin
  q := TIBQuery.Create(self);
  q.Database := dm.dbrestaurante;
  q.Transaction := dm.transacao;
  q.Active:=false;


  q.Active:=false;
  q.sql.clear;


  q.sql.add(' select f.*,  c.nome as NomeCidade, e.nome as NomeEstado, e.sigla UF  from fornecedor f');
  q.sql.add('   inner join cidade c on (c.cod_cidade = f.cod_cidade)');
  q.sql.add('   inner join estado e on (e.codigo = f.cod_estado)');
  q.sql.add(' where f.CGC_CPF='+Quotedstr(CNPJfornecedor));

  q.Active:=true;
  if q.IsEmpty then exit;

 For  i:=0 to ComponentCount-1 do
    begin
      if (components[i].Name = 'ed_cod_fornecedor') then
        begin

         (components[i] as TCustomEdit).text:= q.fieldbyname('cod_fornecedor').value;
         end;

      if (components[i].Name = 'ed_razao_social_fornecedor') then
         (components[i] as TCustomEdit).text:= q.fieldbyname('razao_social').Value;

      if (components[i].Name = 'ed_nome_fantasia_fornecedor') then
         (components[i] as TCustomEdit).text:= q.fieldbyname('nome_fantasia').Value;

      if (components[i].Name = 'ed_cnpj_fornecedor') then
         (components[i] as TCustomEdit).text:= q.fieldbyname('CGC_CPF').Value;

      if (components[i].Name = 'ed_ie_fornecedor') then
         (components[i] as TCustomEdit).text:= q.fieldbyname('INSCRICAO_ESTADUAL').Value;

      if (components[i].Name = 'ed_cidade_fornecedor') then
         (components[i] as TCustomEdit).text:= q.fieldbyname('NomeCidade').Value;

      if (components[i].Name = 'ed_uf_fornecedor') then
         (components[i] as TCustomEdit).text:= q.fieldbyname('uf').Value;

    End;

    FreeAndNil(q);
end;



procedure Tfrm_modelo_vazio.exibeInformacoesBairro(codBairro : string);
var
 q : TIBQuery;
 i :  integer;
begin
  q := TIBQuery.Create(self);
  q.Database := dm.dbrestaurante;
  q.Transaction := dm.transacao;
  q.Active:=false;


  q.Active:=false;
  q.sql.clear;
  q.sql.add(' select * from bairro where codigo='+codBairro);

  q.Active:=true;
  if q.IsEmpty then exit;

 For  i:=0 to ComponentCount-1 do
    begin
      if (components[i].Name = 'edCodBairro') then
         (components[i] as TCustomEdit).text:= Inttostr(q.fieldbyname('codigo').value);

      if (components[i].Name = 'edDescBairro') then
         (components[i] as TCustomEdit).text:= q.fieldbyname('descricao').Value;

    End;

    FreeAndNil(q);



end;


procedure Tfrm_modelo_vazio.exibeInformacoesTiposDocumento(cod_tipo_doc : string);
var
 q : TIBQuery;
 i :  integer;
begin
  q := TIBQuery.Create(self);
  q.Database := dm.dbrestaurante;
  q.Transaction := dm.transacao;
  q.Active:=false;


  q.Active:=false;
  q.sql.clear;
  q.sql.add('select * from tipos_documento where cod_tipo_doc='+Quotedstr(cod_tipo_doc));
  q.Active:=true;
  if q.IsEmpty then exit;

 For  i:=0 to ComponentCount-1 do
    begin
      if (components[i].Name = 'ed_cod_tipo_documento') then
         (components[i] as TCustomEdit).text:= q.fieldbyname('cod_tipo_doc').value;

      if (components[i].Name = 'ed_desc_tipo_documento') then
         (components[i] as TCustomEdit).text:= q.fieldbyname('descricao').Value;
    End;

    FreeAndNil(q);

end;

procedure Tfrm_modelo_vazio.exibeInformacoesTiposEntrada(cod_tipo_entrada : string);
var
 q : TIBQuery;
 i :  integer;
begin
  q := TIBQuery.Create(self);
  q.Database := dm.dbrestaurante;
  q.Transaction := dm.transacao;
  q.Active:=false;


  q.Active:=false;
  q.sql.clear;
  q.sql.add('select * from tipos_entrada where cod_tipo_entrada='+Quotedstr(cod_tipo_entrada));
  q.Active:=true;
  if q.IsEmpty then exit;

 For  i:=0 to ComponentCount-1 do
    begin
      if (components[i].Name = 'ed_cod_tipo_entrada') then
         (components[i] as TCustomEdit).text:= q.fieldbyname('cod_tipo_entrada').value;

      if (components[i].Name = 'ed_desc_tipo_entrada') then
         (components[i] as TCustomEdit).text:= q.fieldbyname('descricao').Value;
    End;

    FreeAndNil(q);

end;


procedure Tfrm_modelo_vazio.exibeInformacoesCFOPEntrada(CFOP : string);
var
 q : TIBQuery;
 i :  integer;
begin
  q := TIBQuery.Create(self);
  q.Database := dm.dbrestaurante;
  q.Transaction := dm.transacao;
  q.Active:=false;


  q.Active:=false;
  q.sql.clear;
  q.sql.add('select *  from CFOP where codigo='+Quotedstr(cfop));
  q.Active:=true;
  if q.IsEmpty then exit;

 For  i:=0 to ComponentCount-1 do
    begin
      if (components[i].Name = 'ed_cefop_entradas') then
         (components[i] as TCustomEdit).text:= q.fieldbyname('codigo').value;

      if (components[i].Name = 'ed_descricao_cfop_entradas') then
         (components[i] as TCustomEdit).text:= q.fieldbyname('descricao').Value;
    End;
    FreeAndNil(q);
end;


procedure Tfrm_modelo_vazio.exibeInformacoesCFOPTransferencia(CFOP : string);
var
 q : TIBQuery;
 i :  integer;
begin
  q := TIBQuery.Create(self);
  q.Database := dm.dbrestaurante;
  q.Transaction := dm.transacao;
  q.Active:=false;


  q.Active:=false;
  q.sql.clear;
  q.sql.add('select *  from CFOP where codigo='+Quotedstr(cfop));
  q.Active:=true;
  if q.IsEmpty then exit;

 For  i:=0 to ComponentCount-1 do
    begin
      if (components[i].Name = 'edCfopTransferencia') then
         (components[i] as TCustomEdit).text:= q.fieldbyname('codigo').value;

      if (components[i].Name = 'edDescCFOPTransferencia') then
         (components[i] as TCustomEdit).text:= q.fieldbyname('descricao').Value;
    End;
    FreeAndNil(q);
end;


procedure Tfrm_modelo_vazio.exibeInformacoesCFOPDevolucao(CFOP : string);
var
 q : TIBQuery;
 i :  integer;
begin
  q := TIBQuery.Create(self);
  q.Database := dm.dbrestaurante;
  q.Transaction := dm.transacao;
  q.Active:=false;


  q.Active:=false;
  q.sql.clear;
  q.sql.add('select *  from CFOP where codigo='+Quotedstr(cfop));
  q.Active:=true;
  if q.IsEmpty then exit;

 For  i:=0 to ComponentCount-1 do
    begin
      if (components[i].Name = 'edCfopDevolucao') then
         (components[i] as TCustomEdit).text:= q.fieldbyname('codigo').value;

      if (components[i].Name = 'edDescCFOPDevolucao') then
         (components[i] as TCustomEdit).text:= q.fieldbyname('descricao').Value;
    End;
    FreeAndNil(q);
end;









procedure Tfrm_modelo_vazio.exibeInformacoesCFOPSaida(CFOP : string);
var
 q : TIBQuery;
 i :  integer;
begin
  q := TIBQuery.Create(self);
  q.Database := dm.dbrestaurante;
  q.Transaction := dm.transacao;
  q.Active:=false;


  q.Active:=false;
  q.sql.clear;
  q.sql.add('select *  from CFOP where codigo='+Quotedstr(cfop));
  q.Active:=true;
  if q.IsEmpty then exit;

 For  i:=0 to ComponentCount-1 do
    begin
      if (components[i].Name = 'ed_cefop_saidas') then
         (components[i] as TCustomEdit).text:= q.fieldbyname('codigo').value;

      if (components[i].Name = 'ed_descricao_cfop_saidas') then
         (components[i] as TCustomEdit).text:= q.fieldbyname('descricao').Value;
    End;

    FreeAndNil(q);

end;


procedure Tfrm_modelo_vazio.exibeInformacoesCFOP(CFOP : string);
var
 q : TIBQuery;
 i :  integer;
begin
  q := TIBQuery.Create(self);
  q.Database := dm.dbrestaurante;
  q.Transaction := dm.transacao;
  q.Active:=false;


  q.Active:=false;
  q.sql.clear;
  q.sql.add('select *  from CFOP where codigo='+Quotedstr(cfop));
  q.Active:=true;
  if q.IsEmpty then exit;

 For  i:=0 to ComponentCount-1 do
    begin
      if (components[i].Name = 'ed_cfop') then
         (components[i] as TCustomEdit).text:= q.fieldbyname('codigo').value;

      if (components[i].Name = 'ed_descricao_cfop') then
         (components[i] as TCustomEdit).text:= q.fieldbyname('descricao').Value;
    End;

    FreeAndNil(q);

end;



procedure Tfrm_modelo_vazio.exibeInformacoesTipoItemSPED(codigo : string);
var
 q : TIBQuery;
 i :  integer;
begin
  q := TIBQuery.Create(self);
  q.Database := dm.dbrestaurante;
  q.Transaction := dm.transacao;
  q.Active:=false;


  q.Active:=false;
  q.sql.clear;
  q.sql.add('select *  from tipos_item_sped where cod_tipo='+Quotedstr(codigo));
  q.Active:=true;
  if q.IsEmpty then exit;

 For  i:=0 to ComponentCount-1 do
    begin
      if (components[i].Name = 'edCodTipoItemSped') then
         (components[i] as TCustomEdit).text:= q.fieldbyname('cod_tipo').value;

      if (components[i].Name = 'edDescTipoItemSped') then
         (components[i] as TCustomEdit).text:= q.fieldbyname('descricao').Value;
    End;
    FreeAndNil(q);
end;


procedure Tfrm_modelo_vazio.exibeInformacoesNCM(codigo : string);
var
 q : TIBQuery;
 i :  integer;
begin
  q := TIBQuery.Create(self);
  q.Database := dm.dbrestaurante;
  q.Transaction := dm.transacao;
  q.Active:=false;


  q.Active:=false;
  q.sql.clear;
  q.sql.add('select ncm,descricao from ncm where ncm='+Quotedstr(codigo));
  q.Active:=true;
  if q.IsEmpty then exit;

 For  i:=0 to ComponentCount-1 do
    begin
      if (components[i].Name = 'edCodNCM') then
         (components[i] as TCustomEdit).text:= q.fieldbyname('ncm').value;

      if (components[i].Name = 'edDescNCM') then
         (components[i] as TCustomEdit).text:= q.fieldbyname('descricao').Value;
    End;
    FreeAndNil(q);
end;



procedure Tfrm_modelo_vazio.exibeInformacoesGeneroItem(codigo : string);
var
 q : TIBQuery;
 i :  integer;
begin
  q := TIBQuery.Create(self);
  q.Database := dm.dbrestaurante;
  q.Transaction := dm.transacao;
  q.Active:=false;


  q.Active:=false;
  q.sql.clear;
  q.sql.add('select codigo,descricao from genero_item where codigo='+Quotedstr(codigo));
  q.Active:=true;
  if q.IsEmpty then exit;

 For  i:=0 to ComponentCount-1 do
    begin
      if (components[i].Name = 'edCodGeneroItem') then
         (components[i] as TCustomEdit).text:= q.fieldbyname('codigo').value;

      if (components[i].Name = 'edDescGeneroItem') then
         (components[i] as TCustomEdit).text:= q.fieldbyname('descricao').Value;
    End;
    FreeAndNil(q);
end;





procedure Tfrm_modelo_vazio.exibeInformacoesModeloNotaFiscal(codModeloNota : string);
var
 q : TIBQuery;
 i :  integer;
begin
  q := TIBQuery.Create(self);
  q.Database := dm.dbrestaurante;
  q.Transaction := dm.transacao;
  q.Active:=false;


  q.Active:=false;
  q.sql.clear;
  q.sql.add('select *  from modelos_nf where codigo='+Quotedstr(codModeloNota));
  q.Active:=true;
  if q.IsEmpty then exit;

 For  i:=0 to ComponentCount-1 do
    begin
      if (components[i].Name = 'ed_cod_modelo_nota_fiscal') then
         (components[i] as TCustomEdit).text:= q.fieldbyname('codigo').value;

      if (components[i].Name = 'ed_descricao_modelo_nota_fiscal') then
         (components[i] as TCustomEdit).text:= q.fieldbyname('descricao').Value;
    End;

    FreeAndNil(q);
end;




procedure Tfrm_modelo_vazio.exibeInformacoesSituacaoDocumentoFiscal(codSituacao : string);
var
 q : TIBQuery;
 i :  integer;
begin
  q := TIBQuery.Create(self);
  q.Database := dm.dbrestaurante;
  q.Transaction := dm.transacao;
  q.Active:=false;


  q.Active:=false;
  q.sql.clear;
  q.sql.add(' select cod_situacao, descricao from situacao_documento where cod_situacao='+QUotedstr(codSituacao));
  q.Active:=true;
  if q.IsEmpty then exit;

 For  i:=0 to ComponentCount-1 do
    begin
    
      if (components[i].Name = 'edCodSituacaoDocFiscal') then
         (components[i] as TCustomEdit).text:= q.fieldbyname('cod_situacao').value;



      if (components[i].Name = 'edDescSituacaoDocFiscal') then
         (components[i] as TCustomEdit).text:= q.fieldbyname('descricao').Value;


    End;

    FreeAndNil(q);
end;




procedure Tfrm_modelo_vazio.exibeInformacoesCST(CST : string);
var
 q : TIBQuery;
 i :  integer;
begin
  q := TIBQuery.Create(self);
  q.Database := dm.dbrestaurante;
  q.Transaction := dm.transacao;
  q.Active:=false;


  q.Active:=false;
  q.sql.clear;
  q.sql.add('select *  from CST where CST='+Quotedstr(CST));
  q.Active:=true;
  if q.IsEmpty then exit;

 For  i:=0 to ComponentCount-1 do
    begin
      if (components[i].Name = 'ed_cst') then
         (components[i] as TCustomEdit).text:= q.fieldbyname('cst').value;

      if (components[i].Name = 'ed_descricao_cst') then
         (components[i] as TCustomEdit).text:= q.fieldbyname('descricao').Value;
    End;

    FreeAndNil(q);
end;



procedure Tfrm_modelo_vazio.exibeInformacoesCST_saida(CST : string);
var
 q : TIBQuery;
 i :  integer;
begin
  q := TIBQuery.Create(self);
  q.Database := dm.dbrestaurante;
  q.Transaction := dm.transacao;
  q.Active:=false;


  q.Active:=false;
  q.sql.clear;
  q.sql.add('select *  from CST where CST='+Quotedstr(CST));
  q.Active:=true;
  if q.IsEmpty then exit;

 For  i:=0 to ComponentCount-1 do
    begin
      if (components[i].Name = 'edCstSaida') then
         (components[i] as TCustomEdit).text:= q.fieldbyname('cst').value;

      if (components[i].Name = 'ed_desc_cst_saida') then
         (components[i] as TCustomEdit).text:= q.fieldbyname('descricao').Value;
    End;

    FreeAndNil(q);
end;



procedure Tfrm_modelo_vazio.exibeInformacoesCSTTransferencias(CST : string);
var
 q : TIBQuery;
 i :  integer;
begin
  q := TIBQuery.Create(self);
  q.Database := dm.dbrestaurante;
  q.Transaction := dm.transacao;
  q.Active:=false;


  q.Active:=false;
  q.sql.clear;
  q.sql.add('select *  from CST where CST='+Quotedstr(CST));
  q.Active:=true;
  if q.IsEmpty then exit;

 For  i:=0 to ComponentCount-1 do
    begin
      if (components[i].Name = 'edCstTransferencia') then
         (components[i] as TCustomEdit).text:= q.fieldbyname('cst').value;

      if (components[i].Name = 'edDescCstTransferencia') then
         (components[i] as TCustomEdit).text:= q.fieldbyname('descricao').Value;
    End;

    FreeAndNil(q);
end;



procedure Tfrm_modelo_vazio.exibeInformacoesCSTDevolucoes(CST : string);
var
 q : TIBQuery;
 i :  integer;
begin
  q := TIBQuery.Create(self);
  q.Database := dm.dbrestaurante;
  q.Transaction := dm.transacao;
  q.Active:=false;


  q.Active:=false;
  q.sql.clear;
  q.sql.add('select *  from CST where CST='+Quotedstr(CST));
  q.Active:=true;
  if q.IsEmpty then exit;

 For  i:=0 to ComponentCount-1 do
    begin
      if (components[i].Name = 'edCstDevolucao') then
         (components[i] as TCustomEdit).text:= q.fieldbyname('cst').value;

      if (components[i].Name = 'edDescCstDevolucao') then
         (components[i] as TCustomEdit).text:= q.fieldbyname('descricao').Value;
    End;

    FreeAndNil(q);
end;



procedure Tfrm_modelo_vazio.exibeInformacoesCSTPisCofins(CST : string);
var
 q : TIBQuery;
 i :  integer;
begin
  q := TIBQuery.Create(self);
  q.Database := dm.dbrestaurante;
  q.Transaction := dm.transacao;
  q.Active:=false;


  q.Active:=false;
  q.sql.clear;
  q.sql.add('select *  from CST_PIS_COFINS where CST='+Quotedstr(CST));
  q.Active:=true;
  if q.IsEmpty then exit;

 For  i:=0 to ComponentCount-1 do
    begin
      if (components[i].Name = 'edCstPisCofins') then
         (components[i] as TCustomEdit).text:= q.fieldbyname('cst').value;

      if (components[i].Name = 'edDescCstPIS') then
         (components[i] as TCustomEdit).text:= q.fieldbyname('descricao').Value;
    End;

    FreeAndNil(q);
end;





procedure Tfrm_modelo_vazio.exibeInformacoesEstado(cod_estado : string);
var
 q : TIBQuery;
 i :  integer;
begin
  q := TIBQuery.Create(self);
  q.Database := dm.dbrestaurante;
  q.Transaction := dm.transacao;
  q.Active:=false;


  q.Active:=false;
  q.sql.clear;
  q.sql.add('select * from estado where codigo='+Quotedstr(cod_estado));
  q.Active:=true;
  if q.IsEmpty then exit;

 For  i:=0 to ComponentCount-1 do
    begin
      if (components[i].Name = 'ed_cod_estado') then
         (components[i] as TCustomEdit).text:= q.fieldbyname('codigo').value;

      if (components[i].Name = 'ed_nome_estado') then
         (components[i] as TCustomEdit).text:= q.fieldbyname('nome').Value;

      if (components[i].Name = 'ed_uf_estado') then
         (components[i] as TCustomEdit).text:= q.fieldbyname('sigla').Value;
    End;

    FreeAndNil(q);
end;




function Tfrm_modelo_vazio.getUFEstado(cod_estado : string) : string;
var
 q : TIBQuery;
 i :  integer;
begin
  q := TIBQuery.Create(self);
  q.Database := dm.dbrestaurante;
  q.Transaction := dm.transacao;
  q.Active:=false;


  q.Active:=false;
  q.sql.clear;
  q.sql.add('select * from estado where codigo='+Quotedstr(cod_estado));
  q.Active:=true;

  result := q.fieldbyname('SIGLA').value;
  FreeAndNil(q);
end;






function Tfrm_modelo_vazio.getCodEstadoUF(UF : string) : string;
var
 q : TIBQuery;
 i :  integer;
begin
  q := TIBQuery.Create(self);
  q.Database := dm.dbrestaurante;
  q.Transaction := dm.transacao;
  q.Active:=false;

  q.Active:=false;
  q.sql.clear;
  q.sql.add('select codigo from estado where sigla='+Quotedstr(uf));
  q.Active:=true;
  result:= q.fieldbyname('codigo').value;
  FreeAndNil(q);
end;






procedure Tfrm_modelo_vazio.exibeInformacoesEntregador(codEntregador : string);
var
 q : TIBQuery;
 i :  integer;
begin
  q := TIBQuery.Create(self);
  q.Database := dm.dbrestaurante;
  q.Transaction := dm.transacao;
  q.Active:=false;


  q.Active:=false;
  q.sql.clear;
  q.sql.add('select * from entregadores where codigo='+Quotedstr(codEntregador));
  q.Active:=true;
  if q.IsEmpty then exit;

 For  i:=0 to ComponentCount-1 do
    begin
      if (components[i].Name = 'edCodEntregador') then
         (components[i] as TCustomEdit).text:= q.fieldbyname('codigo').value;

      if (components[i].Name = 'edNomeEntregador') then
         (components[i] as TCustomEdit).text:= q.fieldbyname('nome_entregador').Value;
    End;
 FreeAndNil(q);
end;


procedure Tfrm_modelo_vazio.exibeInformacoesGarcons(codGarcon : string);
var
 q : TIBQuery;
 i :  integer;
begin
  q := TIBQuery.Create(self);
  q.Database := dm.dbrestaurante;
  q.Transaction := dm.transacao;
  q.Active:=false;


  q.Active:=false;
  q.sql.clear;
  q.sql.add('select * from garcons where cod_garcon='+Quotedstr(codGarcon));
  q.Active:=true;
  if q.IsEmpty then exit;

 For  i:=0 to ComponentCount-1 do
    begin

      if (components[i].Name = 'ed_cod_garcon') then
         (components[i] as TCustomEdit).text:= q.fieldbyname('cod_garcon').value;

      if (components[i].Name = 'ed_nome_garcon') then
         (components[i] as TCustomEdit).text:= q.fieldbyname('apelido').Value;

    End;
 FreeAndNil(q);
end;



procedure Tfrm_modelo_vazio.exibeInformacoesPromoter(codPromoter : string);
var
 q : TIBQuery;
 i :  integer;
begin
  q := TIBQuery.Create(self);
  q.Database := dm.dbrestaurante;
  q.Transaction := dm.transacao;
  q.Active:=false;


  q.Active:=false;
  q.sql.clear;
  q.sql.add('select * from promoters where cod_promote='+Quotedstr(codPromoter));
  q.Active:=true;
  if q.IsEmpty then exit;

 For  i:=0 to ComponentCount-1 do
    begin

      if (components[i].Name = 'edCodPromoter') then
         (components[i] as TCustomEdit).text:= q.fieldbyname('cod_promoter').value;

      if (components[i].Name = 'edNomePromoter') then
         (components[i] as TCustomEdit).text:= q.fieldbyname('nome').Value;

    End;
 FreeAndNil(q);
end;


procedure Tfrm_modelo_vazio.exibeInformacoesDepartamento(codDepartamento : string);
var
 q : TIBQuery;
 i :  integer;
begin
  q := TIBQuery.Create(self);
  q.Database := dm.dbrestaurante;
  q.Transaction := dm.transacao;
  q.Active:=false;


  q.Active:=false;
  q.sql.clear;
  q.sql.add('select * from departamentos where codigo='+Quotedstr(codDepartamento));
  q.Active:=true;
  if q.IsEmpty then exit;

 For  i:=0 to ComponentCount-1 do
    begin

      if (components[i].Name = 'edCodDepartamento') then
         (components[i] as TCustomEdit).text:= Inttostr(q.fieldbyname('codigo').value);

      if (components[i].Name = 'edDescDepartamento') then
         (components[i] as TCustomEdit).text:= q.fieldbyname('descricao').Value;
    End;
 FreeAndNil(q);
end;



procedure Tfrm_modelo_vazio.exibeInformacoesGuarnicao(codGuarnicao : string);
var
 q : TIBQuery;
 i :  integer;
begin
  q := TIBQuery.Create(self);
  q.Database := dm.dbrestaurante;
  q.Transaction := dm.transacao;
  q.Active:=false;


  q.Active:=false;
  q.sql.clear;
  q.sql.add('select * from guarnicoes where codigo='+Quotedstr(codGuarnicao));
  q.Active:=true;
  if q.IsEmpty then exit;

 For  i:=0 to ComponentCount-1 do
    begin

      if (components[i].Name = 'edCodGuarnicao') then
         (components[i] as TCustomEdit).text:= q.fieldbyname('codigo').value;

      if (components[i].Name = 'edDescGuarnicao') then
         (components[i] as TCustomEdit).text:= q.fieldbyname('descricao').Value;
    End;
 FreeAndNil(q);
end;




procedure Tfrm_modelo_vazio.exibeInformacoesGrupoTouch(codGrupoTouch : string);
var
 q : TIBQuery;
 i :  integer;
begin
  q := TIBQuery.Create(self);
  q.Database := dm.dbrestaurante;
  q.Transaction := dm.transacao;
  q.Active:=false;


  q.Active:=false;
  q.sql.clear;
  q.sql.add('select * from grupos_touch where codigo='+Quotedstr(codGrupoTouch));
  q.Active:=true;
  if q.IsEmpty then exit;

 For  i:=0 to ComponentCount-1 do
    begin

      if (components[i].Name = 'edCodGrupoTouch') then
         (components[i] as TCustomEdit).text:= q.fieldbyname('codigo').value;

      if (components[i].Name = 'edDescGrupoTouch') then
         (components[i] as TCustomEdit).text:= q.fieldbyname('descricao').Value;
    End;
 FreeAndNil(q);
end;




procedure Tfrm_modelo_vazio.exibeInformacoesCentroCusto(codConta: string);
var
 q : TIBQuery;
 i :  integer;
begin
  q := TIBQuery.Create(self);
  q.Database := dm.dbrestaurante;
  q.Transaction := dm.transacao;
  q.Active:=false;


  q.Active:=false;
  q.sql.clear;
  q.sql.add('select * from plano_contas_financeiro where cod_conta='+Quotedstr(codConta));
  q.Active:=true;
  if q.IsEmpty then exit;

 For  i:=0 to ComponentCount-1 do
    begin
      if (components[i].Name = 'ed_cod_centro_custo') then
         (components[i] as TCustomEdit).text:= q.fieldbyname('cod_conta').value;

      if (components[i].Name = 'ed_desc_c_custo') then
         (components[i] as TCustomEdit).text:= q.fieldbyname('descricao').Value;
    End;

  FreeAndNil(q);

end;


procedure Tfrm_modelo_vazio.exibeInformacoesGrupos(codGrupo: string);
var
 q : TIBQuery;
 i :  integer;
begin
  q := TIBQuery.Create(self);
  q.Database := dm.dbrestaurante;
  q.Transaction := dm.transacao;
  q.Active:=false;


  q.Active:=false;
  q.sql.clear;
  q.sql.add('select * from grupos where cod_grupo='+Quotedstr(codGrupo));
  q.Active:=true;
  if q.IsEmpty then exit;

 For  i:=0 to ComponentCount-1 do
    begin
      if (components[i].Name = 'ed_cod_cod_grupo') then
         (components[i] as TCustomEdit).text:= q.fieldbyname('cod_grupo').value;

      if (components[i].Name = 'ed_desc_grupo') then
         (components[i] as TCustomEdit).text:= q.fieldbyname('descricao').Value;
    End;

  FreeAndNil(q);

end;


procedure Tfrm_modelo_vazio.exibeInformacoesGruposRD(codGrupoRD: string);
var
 q : TIBQuery;
 i :  integer;
begin
  q := TIBQuery.Create(self);
  q.Database := dm.dbrestaurante;
  q.Transaction := dm.transacao;
  q.Active:=false;


  q.Active:=false;
  q.sql.clear;
  q.sql.add('select * from grupos_rd where cod_grupo='+Quotedstr(codGrupoRD));
  q.Active:=true;
  if q.IsEmpty then exit;

 For  i:=0 to ComponentCount-1 do
    begin
      if (components[i].Name = 'edCodGrupoRD') then
         (components[i] as TCustomEdit).text:= q.fieldbyname('cod_grupo').value;

      if (components[i].Name = 'edDescGrupoRD') then
         (components[i] as TCustomEdit).text:= q.fieldbyname('descricao').Value;
    End;

  FreeAndNil(q);

end;




function  Tfrm_modelo_vazio.getPermissaoDeTroco(codForma : string) : boolean;
var
 q : TIBQuery;
begin
  q := TIBQuery.Create(self);
  q.Database := dm.dbrestaurante;
  q.Transaction := dm.transacao;
  q.Active:=false;

  q.sql.Clear;
  q.sql.add('select * from formas_pagamento where cod_forma='+Quotedstr(codForma));
  q.Active:=true;

  if ( q.FieldByName('permite_troco').Value = 0) then
    Result:=false
  else
    Result:=true;
  FreeAndNil(q);
end;


function  Tfrm_modelo_vazio.getTipoTEFFormaPagato(codForma : string) : smallint;
var
 q : TIBQuery;
begin
  q := TIBQuery.Create(self);
  q.Database := dm.dbrestaurante;
  q.Transaction := dm.transacao;
  q.Active:=false;

  q.sql.Clear;
  q.sql.add('select transacao_tef from formas_pagamento where cod_forma='+Quotedstr(codForma));
  q.Active:=true;
  Result:=  q.fieldbyname('transacao_tef').Value;
  FreeAndNil(q);
end;
        {
function  Tfrm_modelo_vazio.efetuaPagamentoTEFCappta(tipoOperacao : smallint; valorDaOperacao : double ) : boolean;
var
 detalhesPagamentoCredito : DetalhesCredito ;
 resultadoOperacaoPagto : integer;
 mensagem : string;
begin

  if  (VerificaConexaoInternet = false) then
   begin
    mensagem :='Serviço indisponível. Por favor verifique a sua conexão com a internet!';
    Result := false;
    exit;
   end;



  case tipoOperacao of
   1: begin
        // se for operação de débito
        resultadoOperacaoPagto:= dm.clienteCappta.PagamentoDebito(valorDaOperacao);
      end;
   2: begin
        detalhesPagamentoCredito := CoDetalhesCredito.Create();
        detalhesPagamentoCredito.TransacaoParcelada := false;
        detalhesPagamentoCredito.QuantidadeParcelas := 1;
        detalhesPagamentoCredito.TipoParcelamento   :=  1;
         resultadoOperacaoPagto := dm.clienteCappta.PagamentoCredito(valorDaOperacao,detalhesPagamentoCredito);

      end;

   3: begin

      end;

  end;

  if resultadoOperacaoPagto <> 0 then
    begin
      result := false;

      case resultadoOperacaoPagto of
       1: begin
            mensagem:= 'Não autenticado/Alguma das informações fornecidas para autenticação não é válida';
          end;
       2: begin
            mensagem:= ' CapptaGpPlus está sendo inicializado';
          end;

       3: begin
            mensagem :='Formato da requisição recebida pelo CapptaGpPlus é inválido';
          end;

       4: begin
            mensagem :='Operação cancelada pelo operador';
          end;

       5: begin
            mensagem := 'Pagamento não autorizado/pendente/não encontrado';
          end;

       6: begin
            mensagem:= 'Pagamento ou cancelamento negados pela rede adquirente ou falta de conexão com internet';
          end;
       7: begin
           mensagem:= 'Erro interno no CapptaGpPlus';
          end;
       8: begin
            mensagem:= 'Erro na comunicação entre a CappAPI e o CapptaGpPlus';
          end;
      end;

      exit;
    end
  else
    begin
     result := iterarOperacaoTEFCappta();
    end;

end;


function Tfrm_modelo_vazio.iterarOperacaoTEFCappta() : boolean;
var
  iteracaoTef: IIteracaoTef;
  tipoOperacaoAtual: Integer;
  operacaoFinalizada : boolean;
  respostaOperacaoAprovada : IRespostaOperacaoAprovada;
  msgExibir : string;
begin
  operacaoFinalizada := false;
  Application.CreateForm(TfrmMensagemTEF, frmMensagemTEF);
  frmMensagemTEF.Show;

 Repeat

    iteracaoTef := dm.clienteCappta.IterarOperacaoTef();
    tipoOperacaoAtual := iteracaoTef.Get_TipoIteracao;


    case tipoOperacaoAtual of
     1: begin
          respostaOperacaoAprovada := (iteracaoTef as IRespostaOperacaoAprovada);
          frm_principal.memoPagamentosTEF.Lines.Add(RemoveString('"',   AnsiToUtf8(respostaOperacaoAprovada.CupomCliente)));
          frm_principal.memoPagamentosTEF.lines.Add(' ');
          frm_principal.memoPagamentosTEF.lines.Add(' ');
          frm_principal.memoPagamentosTEF.lines.Add(' ');
          frm_principal.memoPagamentosTEF.lines.Add(' ');
          frm_principal.memoPagamentosTEF.lines.Add('</corte_parcial>');
          frm_principal.memoPagamentosTEF.Lines.Add(RemoveString('"', AnsiToUtf8(respostaOperacaoAprovada.CupomLojista)));
          frm_principal.memoPagamentosTEF.lines.Add(' ');
          frm_principal.memoPagamentosTEF.lines.Add(' ');
          frm_principal.memoPagamentosTEF.lines.Add(' ');
          frm_principal.memoPagamentosTEF.lines.Add(' ');
          frm_principal.memoPagamentosTEF.lines.Add('</corte_parcial>');







        end;

     2: begin
         exibeMensagemTef('Operação cancelada pelo usuário',1);
         Sleep(2000);
        end;

     3: begin
          msgExibir :=  dm.AnsiToUtf8 ((iteracaoTef as IMensagem).Descricao);
          exibeMensagemTef(msgExibir,1);
          Sleep(500);
        end;

     4: begin
          requisicaoParametrosCappta(iteracaoTef as IRequisicaoParametro);
        end;
    end;



//    if tipoOperacaoAtual = 2 then ExibirDadosOperacaoRecusada(iteracaoTef as IRespostaOperacaoRecusada);
///    if tipoOperacaoAtual = 1 then
//    begin
//       ExibirDadosOperacaoAprovada(iteracaoTef as IRespostaOperacaoAprovada);
//       FinalizarPagamento();
//    end;




    if ( (tipoOperacaoAtual = 1) or (tipoOperacaoAtual = 2) ) then
    begin
     operacaoFinalizada := true;

    end;

    Until operacaoFinalizada = true;

    frmMensagemTEF.Close;
    frmMensagemTEF.Free;

    if tipoOperacaoAtual = 1 then
      result := true
    else
      result := false;

end;


procedure Tfrm_modelo_vazio.exibeMensagemTef( mensagem : string ; tipoMensagem : smallint);
begin
  // se tipoMensagem =1 só exibe mensagem
  // Se tipoMensagem = 2 Requisita confirmação
  // Se tipoMensagem = 3 Requisita digitação de parametro
  frmMensagemTEF.edParametro.Clear;
  frmMensagemTEF.memoMsg.Lines.Clear;
  frmMensagemTEF.memoInformacoesCartao.Lines.Clear;

  case tipoMensagem of
   1: begin
       frmMensagemTEF.memoMsg.Lines.Add(mensagem);
       frmMensagemTEF.pnSimNao.Visible := false;
       frmMensagemTEF.tecladoTouch.Visible := false;
      end;

   2: begin
       frmMensagemTEF.memoMsg.Lines.Add(mensagem);
       frmMensagemTEF.pnSimNao.Visible := true;
       frmMensagemTEF.tecladoTouch.Visible := false;
      end;

   3: begin
       frmMensagemTEF.memoInformacoesCartao.Lines.Add(mensagem);
       frmMensagemTEF.pnSimNao.Visible := false;
       frmMensagemTEF.tecladoTouch.Visible := true;
       frmMensagemTEF.edParametro.SetFocus;
      end;
  end;
  Application.ProcessMessages;
  frmMensagemTEF.Repaint;
end;


procedure Tfrm_modelo_vazio.requisicaoParametrosCappta(requisicaoParametros: IRequisicaoParametro);
var

  mensagemConvertida: string;
  acao: integer;
  msgErroCHip : string;
  msgDigiteCartaoCredito: string;
  msgValidadeCartao : string;
  msgCancelarOperacaoCredito : string;
  msgDadosIncorretos : string;
  mensagemExibir : string;
  tipoRequisicao : integer;

begin

   tipoRequisicao :=0;   // Se = 1 (Confirmação tipo SIM / nÃO)  , Se = 2 (Parâmetro digitável)
   dm.parametroRecebidoCappta := '';

   msgErroCHip                := 'CAPPTA CARTOES '#$D#$A'Erro no processamento do chip'#$D#$A'Deseja tentar novamente? (1-Sim 0-NÃ£o)';
   msgDigiteCartaoCredito     := 'Cartao Credito '#$D#$A'Digite o Cartao ';
   msgValidadeCartao          := 'Cartao Credito '#$D#$A'Data de Validade [MMAA] ';
   msgCancelarOperacaoCredito := 'Cartao Credito '#$D#$A'Operacao Cancelada? 1-Sim 0-Nao ';
   msgDadosIncorretos         := 'CAPPTA CARTOES '#$D#$A'A cadeia de caracteres de entrada nÃ£o estava em um formato correto.'#$D#$A'Deseja tentar novamente? (1-Sim 0-NÃ£o)';


   mensagemConvertida := AnsiToUtf8(requisicaoParametros.Get_Mensagem);

   if (mensagemConvertida = msgErroCHip) then
     begin
       mensagemExibir :=   'Erro no processamento do Chip.'+#13#10+#13#10+'Tentar novamente ?';
       tipoRequisicao := 1;
     end;
   if (mensagemConvertida = msgDadosIncorretos ) then
     begin
       mensagemExibir :=   'Parâmetros em formato incorreto!'+#13#10+#13#10+'Tentar novamente ?';
       tipoRequisicao := 1;
     end;



   if (mensagemConvertida = msgCancelarOperacaoCredito ) then
     begin
       mensagemExibir :=   'OPERAÇÃO DE CRÉDITO'+#13#10+#13#10+'Cornfirma cancelamento ?';
       tipoRequisicao := 1;
     end;

   if (mensagemConvertida  = msgDigiteCartaoCredito) then
    begin
      mensagemExibir := 'OPERAÇÃO DE CRÉDITO'+#13#10+#13#10+'Digite o número do cartão:';
      tipoRequisicao :=2;
    end;

   if (mensagemConvertida  = msgValidadeCartao) then
    begin
      mensagemExibir := 'VALIDADE DO CARTÃO'+#13#10+#13#10+'Digite a validade. Formato: MMAA';
      tipoRequisicao :=2;
    end;



   if (tipoRequisicao = 1) then
    begin
      dm.tentarNovamenteCappta :=3;
      exibeMensagemTef(mensagemExibir,2);
      while dm.tentarNovamenteCappta = 3 do
       begin
         Application.ProcessMessages;
       end;

      if (dm.tentarNovamenteCappta = 0 ) then
        begin
          // Se não desejar tentar novamente...
         dm.parametroRecebidoCappta  := '0';
         acao :=2;
        end
      else
       begin
        dm.parametroRecebidoCappta  := '1';
        acao :=1;
       end;;
    end
   else
    begin
     dm.parametroRecebidoCappta:='';
     exibeMensagemTef(mensagemExibir,3);
      while (trim(dm.parametroRecebidoCappta)='')  do
       begin
         Application.ProcessMessages;
       end;

     if (trim(dm.parametroRecebidoCappta) ='CancelarTEF') then
      begin
       acao := 2;
       dm.parametroRecebidoCappta := ' ';
      end
     else
      begin
       acao := 1;
      end;

    end;

 {
    frm

    parametro := InputBox('Sample API COM', mensagemConvertida, '');

    if Length(parametro) = 0 then
    begin
       acao := 2;
       parametro := ' ';
    end
    else begin acao := 1; end;

    dm.clienteCappta.EnviarParametro(dm.parametroRecebidoCappta , acao);

end;
     }

function  Tfrm_modelo_vazio.iniciarOperacaoComTEF() : boolean;
var
 retorno : smallint;
 mensagem : string;
begin

  if  (VerificaConexaoInternet = false) then
   begin
    mensagem :='Serviço indisponível. Por favor verifique a sua conexão com a internet!';
    Result := false;
    exit;
   end;
//  retorno :=    dm.clienteCappta.IniciarMultiCartoes(9);

  case retorno of
   0: result:= true;
   1: mensagem := 'Não autenticado/Alguma das informações fornecidas para autenticação não é válida';
   2: mensagem := 'CapptaGpPlus está sendo inicializado';
   3: mensagem := 'Erro interno no CapptaGpPlus';
   4: mensagem := '	Erro na comunicação entre a CappAPI e o CapptaGpPlus';
   5: mensagem := 'Ocorre quando qualquer operação é realizada sem que se tenha finalizado o último pagamento';
 end;


  if retorno <> 0 then
    begin
      exibe_painel_erro(mensagem,'Ok');
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
function Tfrm_modelo_vazio.getCodNovoProduto() : string;
var
 q : TIBQuery;
 codigo : integer;
begin
  q := TIBQuery.Create(self);
  q.Database := dm.dbrestaurante;
  q.Transaction := dm.transacao;
  q.Active:=false;

  q.SQL.Clear;
  q.SQL.add('select first 1 codigo from codigos_livres where livre=0 order by codigo');
  q.Active:=true;
  codigo:= q.fieldbyname('codigo').value;

  q.SQL.Clear;
  q.SQL.add('update codigos_livres set livre=1 where codigo='+IntToStr(codigo));
  q.ExecSQL;
  FreeAndNil(q);

  result:= FormatFloat('00000',codigo);
end;

function Tfrm_modelo_vazio.getCodProduto(codBarrasProduto : string) : string;
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

  FreeAndNil(q); 
end;



function Tfrm_modelo_vazio.getDescricaoReduzidaProduto(codBarrasProduto : string) : string;
var
 q : TIBQuery;
begin
  q := TIBQuery.Create(self);
  q.Database := dm.dbrestaurante;
  q.Transaction := dm.transacao;
  q.Active:=false;

  q.SQL.Clear;
  q.SQL.add('select descricao_reduzida from produtos where cod_barras='+Quotedstr(codBarrasProduto));
  q.Active:=true;
  result:= q.fieldbyname('descricao_reduzida').value;
  FreeAndNil(q); 
end;


function Tfrm_modelo_vazio.getCodMiniPrinterProduto(codBarrasProduto : string) : string;
var
 q : TIBQuery;
begin
    q := TIBQuery.Create(self);
  q.Database := dm.dbrestaurante;
  q.Transaction := dm.transacao;
  q.Active:=false;

  q.SQL.Clear;
  q.SQL.add('select cod_miniprinter from produtos where cod_barras='+Quotedstr(codBarrasProduto));
  q.Active:=true;
  result:= q.fieldbyname('cod_miniprinter').value;
  FreeAndNil(q);
end;



procedure Tfrm_modelo_vazio.exibeInformacoesUsuario(cod_usuario : string);
var
 q : TIBQuery;
 i :  integer;
begin
  q := TIBQuery.Create(self);
  q.Database := dm.dbrestaurante;
  q.Transaction := dm.transacao;
  q.Active:=false;


  q.Active:=false;
  q.sql.clear;
  q.sql.add('select * from usuarios where cod_usuario='+Quotedstr(cod_usuario));
  q.Active:=true;
  if q.IsEmpty then exit;

 For  i:=0 to ComponentCount-1 do
    begin
      if (components[i].Name = 'ed_cod_usuario') then
         (components[i] as TCustomEdit).text:= q.fieldbyname('cod_usuario').value;

      if (components[i].Name = 'ed_login_usuario') then
         (components[i] as TCustomEdit).text:= q.fieldbyname('login').Value;

      if (components[i].Name = 'ed_nome_completo_usuario') then
         (components[i] as TCustomEdit).text:= q.fieldbyname('nome_usuario').Value;
    End;

  FreeAndNil(q); 

end;


function Tfrm_modelo_vazio.verificaExistenciaReg60A(codReg : string) : boolean;
var
 q : TIBQuery;
 i :  integer;
begin
    q := TIBQuery.Create(self);
  q.Database := dm.dbrestaurante;
  q.Transaction := dm.transacao;
  q.Active:=false;

  q.Active:=false;
  q.sql.clear;
  q.sql.add('select * from reg60A where cod_reg='+Quotedstr(codReg));
  q.Active:=true;

  result:= not q.IsEmpty;
  FreeAndNil(q); 

end;


function Tfrm_modelo_vazio.verificaExistenciaReg60M(codReg : string) : boolean;
var
 q : TIBQuery;
 i :  integer;
begin
    q := TIBQuery.Create(self);
  q.Database := dm.dbrestaurante;
  q.Transaction := dm.transacao;
  q.Active:=false;

  q.Active:=false;
  q.sql.clear;
  q.sql.add('select * from reg60M where cod_reg='+Quotedstr(codReg));
  q.Active:=true;

  result:= not q.IsEmpty;

  FreeAndNil(q); 

end;



function Tfrm_modelo_vazio.verificaExistenciaAliquota(codAliquota : string) : boolean;
var
 q : TIBQuery;
begin
    q := TIBQuery.Create(self);
  q.Database := dm.dbrestaurante;
  q.Transaction := dm.transacao;
  q.Active:=false;

  q.Active:=false;
  q.sql.clear;
  q.sql.add('select * from aliquotas where cod_aliquota='+Quotedstr(codAliquota));
  q.Active:=true;

  result:= not q.IsEmpty;

  FreeAndNil(q); 
end;


function Tfrm_modelo_vazio.verificaExistenciaFormaDePagamento(codForma : string) : boolean;
var
 q : TIBQuery;
begin
    q := TIBQuery.Create(self);
  q.Database := dm.dbrestaurante;
  q.Transaction := dm.transacao;
  q.Active:=false;

  q.Active:=false;
  q.sql.clear;
  q.sql.add('select * from  formas_pagamento where cod_forma='+Quotedstr(codForma));
  q.Active:=true;

  result:= not q.IsEmpty;

  FreeAndNil(q);
end;


function Tfrm_modelo_vazio.getDescricaoFormaPagamento(codForma : string) : string;
var
 q : TIBQuery;
begin
    q := TIBQuery.Create(self);
  q.Database := dm.dbrestaurante;
  q.Transaction := dm.transacao;
  q.Active:=false;

  q.Active:=false;
  q.sql.clear;
  q.sql.add('select descricao from  formas_pagamento where cod_forma='+Quotedstr(codForma));
  q.Active:=true;

  result:= q.fieldbyname('descricao').value;


  FreeAndNil(q); 
end;


function Tfrm_modelo_vazio.verificaExistenciaCartao(cartao: string) : boolean;
var
 q : TIBQuery;
begin
  q := TIBQuery.Create(self);
  q.Database := dm.dbrestaurante;
  q.Transaction := dm.transacao;
  q.Active:=false;

  q.Active:=false;
  q.sql.clear;
  q.sql.add('select * from cartoes where cod_cartao='+Quotedstr(cartao));
  q.Active:=true;
  result:= not q.IsEmpty;
  FreeAndNil(q); 
end;




function Tfrm_modelo_vazio.verificaSeCartaoCobraServico(cartao: string) : boolean;
var
 q : TIBQuery;
begin
  q := TIBQuery.Create(self);
  q.Database := dm.dbrestaurante;
  q.Transaction := dm.transacao;
  q.Active:=false;

  q.Active:=false;
  q.sql.clear;
  q.sql.add('select * from cartoes where cod_cartao='+Quotedstr(cartao));
  q.Active:=true;

  if (  ( q.FieldByName('cobrar_servico').value = 1 )  or (q.IsEmpty ) )  then
    result:=true
  else
   result:=false;

  q.Active:=false;
  FreeAndNil(q); 
end;







procedure Tfrm_modelo_vazio.exibeInformacoesProduto(codProduto : string; tipo: integer);
var
 q : TIBQuery;
 i :  integer;
begin
  q := TIBQuery.Create(self);
  q.Database := dm.dbrestaurante;
  q.Transaction := dm.transacao;
  q.Active:=false;


  q.Active:=false;
  q.sql.clear;
  if (tipo = 1) then
    q.sql.add('select * from v_produtos where cod_produto='+Quotedstr(codProduto))
  else
    q.sql.add('select * from v_produtos where cod_barras='+Quotedstr(codProduto));

  q.Active:=true;
  if q.IsEmpty then exit;

 For  i:=0 to ComponentCount-1 do
    begin
      if (components[i] is TCustomEdit) then
        begin
          if (components[i].Name = 'edCodProduto') then
             (components[i] as TCustomEdit).text:= q.fieldbyname('cod_produto').value;

          if (components[i].Name = 'edCodBarrasProduto') then
             (components[i] as TCustomEdit).text:= q.fieldbyname('cod_barras').value;

          if (components[i].Name = 'edDescricaoProduto') then
             (components[i] as TCustomEdit).text:= q.fieldbyname('descricao').value;

          if (components[i].Name = 'edCodGrupoProduto') then
             (components[i] as TCustomEdit).text:= q.fieldbyname('cod_grupo').value;

          if (components[i].Name = 'edDescGrupoProduto') then
             (components[i] as TCustomEdit).text:= q.fieldbyname('descricao_grupo').value;

          if (components[i].Name = 'edValorUnitarioProduto') then
             (components[i] as TCustomEdit).text:= FormatFloat('###,###,##0.00',q.fieldbyname('valor_unitario').Value);


        end;


      if (components[i] is TcurvyEdit ) then
        begin
          if (components[i].Name = 'edCodProduto') then
             (components[i] as TcurvyEdit).text:= q.fieldbyname('cod_produto').value;

          if (components[i].Name = 'edCodBarrasProduto') then
             (components[i] as TcurvyEdit).text:= q.fieldbyname('cod_barras').value;

          if (components[i].Name = 'edDescricaoProduto') then
             (components[i] as TcurvyEdit).text:= q.fieldbyname('descricao').value;

          if (components[i].Name = 'edCodGrupoProduto') then
             (components[i] as TcurvyEdit).text:= q.fieldbyname('cod_grupo').value;

          if (components[i].Name = 'edDescGrupoProduto') then
             (components[i] as TcurvyEdit).text:= q.fieldbyname('descricao_grupo').value;

          if (components[i].Name = 'edValorUnitarioProduto') then
             (components[i] as TcurvyEdit).text:= FormatFloat('###,###,##0.00',q.fieldbyname('valor_unitario').Value);


        end;

          if (components[i].Name = 'lbDescricaoProduto') then
           begin
             (components[i] as TCustomLabel).caption:= q.fieldbyname('descricao').value;
             (components[i] as TCustomLabel).Visible:=true;
           end;


          if (components[i].Name = 'lbValorUnitarioProduto') then
           begin
             (components[i] as TCustomLabel).caption:= FormatFloat('R$ ###,###,##0.00',q.fieldbyname('valor_unitario').Value);
             (components[i] as TCustomLabel).Visible:=true;
           end;

    End;

    FreeAndNil(q);
end;




procedure Tfrm_modelo_vazio.exibeInformacoesProdutoPizza(codProdutoPizza : string; tamanhoPizza : string; moduloVenda : string);
var
 q : TIBQuery;
 i :  integer;
 md : string;
 tam : string;
begin
  q := TIBQuery.Create(self);
  q.Database := dm.dbrestaurante;
  q.Transaction := dm.transacao;
  q.Active:=false;

  if moduloVenda  ='D' then
    md := 'delivery'
  else
   md := 'balcao';

  if tamanhoPizza ='bro' then
    tam:='B';

  if tamanhoPizza ='peq' then
    tam:='P';

  if tamanhoPizza ='med' then
    tam:='M';

  if tamanhoPizza ='gde' then
    tam:='G';

  if tamanhoPizza ='fam' then
    tam:='F';



  q.Active:=false;
  q.sql.clear;
  q.sql.add('select * from v_produtos where cod_produto='+Quotedstr(codProdutoPizza));
  q.Active:=true;


  if q.IsEmpty then exit;

   For  i:=0 to ComponentCount-1 do
      begin
        if (components[i].Name = 'edCodPizza'+moduloVenda+tamanhoPizza) then
           (components[i] as TCustomEdit).text:= q.fieldbyname('cod_produto').value;

        if (components[i].Name = 'edDescPizza'+moduloVenda+tamanhoPizza) then
           (components[i] as TCustomEdit).text:= q.fieldbyname('descricao').value;

        if (components[i].Name = 'edPrecoPizza'+moduloVenda+tamanhoPizza) then
           (components[i] as TCustomEdit).text:= q.fieldbyname('valor_unitario').Value;
   end;


   if ((dm.qrySaboresPizza.State = dsInsert) or (dm.qrySaboresPizza.State = dsEdit) ) then
     begin
       dm.qrySaboresPizza.FieldByName('preco'+tam+md).Value :=  q.fieldbyname('valor_unitario').Value;
       dm.qrySaboresPizza.FieldByName(tam+md).Value :=  q.fieldbyname('cod_produto').Value;
             

     end;

    FreeAndNil(q);
end;




function Tfrm_modelo_vazio.verificaSeNumeroInteiro(numero : double) : boolean;
begin
 try
  numero := StrToInt(floattostr(numero));
 except
  begin
    result:=false;
    exit;
  end;
 end;
  result:=true;
end;


function Tfrm_modelo_vazio.verificaSeClienteEstaNaCasa(codCliente : string) : boolean;
var
 q : TIBQuery;
begin
    q := TIBQuery.Create(self);
  q.Database := dm.dbrestaurante;
  q.Transaction := dm.transacao;
  q.Active:=false;

  q.Active:=false;
  q.sql.clear;
  q.sql.add('select * from cartoes where cod_cli='+Quotedstr(codCliente));
  q.Active:=true;
  result:= not q.IsEmpty;

  FreeAndNil(q);
end;

function Tfrm_modelo_vazio.verificaSeExisteCouvertNaConta(mesa  : string) : boolean;
var
 q : TIBQuery;
begin
  q := TIBQuery.Create(self);
  q.Database := dm.dbrestaurante;
  q.Transaction := dm.transacao;
  q.Active:=false;
  q.sql.add('select mv.cod_produto   from movimento_mesa   mv');
  q.sql.add('where mv.cod_produto  in (select cod_produto from produtos p where p.couvert=1)');
  q.sql.add('  and mv.cod_mesa='+QuotedStr(mesa));
  q.Active:=true;
  result := not q.isempty;

  q.Active:=false;
  FreeAndNil(q); 
end;


function Tfrm_modelo_vazio.verificaNotaFiscalJaFoiLancada(codFornecedor : string; numeroNota : string ; modeloNota : string) : boolean;
var
 q : TIBQuery;
begin
  numeroNota    := FormatFloat('000000000000000',StrToInt(numeroNota));
  codFornecedor := FormatFloat('0000',StrToInt(codFornecedor));
  q := TIBQuery.Create(self);
  q.Database := dm.dbrestaurante;
  q.Transaction := dm.transacao;
  q.Active:=false;

  if ( trim(modeloNota) = '' ) then
    q.sql.add(' select * from entradas where cod_fornecedor='+QuotedStr(codFornecedor) +' and numero_nota='+Quotedstr(numeroNota))
  else
    q.sql.add(' select * from entradas where cod_fornecedor='+QuotedStr(codFornecedor) +' and numero_nota='+Quotedstr(numeroNota)+' and modelo_nota='+Quotedstr(modeloNota) );

  q.Active:=true;
  result := not q.isempty;

  q.Active:=false;
  FreeAndNil(q); 
end;


function Tfrm_modelo_vazio.verificaNotaFiscalSaidaJaFoiLancada(numeroNota : string; modelo :string) : boolean;
var
 q : TIBQuery;
begin
  q := TIBQuery.Create(self);
  q.Database := dm.dbrestaurante;
  q.Transaction := dm.transacao;

  q.Active:=false;
  q.sql.add(' select * from saidas where numero_nota='+Quotedstr(formatFloat('000000000000000',StrToFloat(numeroNota)))+' and modelo_nota='+Quotedstr(modelo) );
  q.Active:=true;


  if q.IsEmpty then
   result:=false
  else
    Result :=true;
  q.Active:=false;
  FreeAndNil(q); 
end;


function Tfrm_modelo_vazio.verificaNotaFiscalConsumidorJaFoiLancada(numeroNota : string) : boolean;
var
 q : TIBQuery;
begin
  q := TIBQuery.Create(self);
  q.Database := dm.dbrestaurante;
  q.Transaction := dm.transacao;
  q.Active:=false;
  q.sql.add(' select * from notas_consumidor where codigo='+Quotedstr(numeroNota));
  q.Active:=true;
  result := not q.isempty;
  q.Active:=false;
  FreeAndNil(q); 
end;

function Tfrm_modelo_vazio.verificaExistenciaNotaTransportadora(codigoEntrada : string) : boolean;
var
 q : TIBQuery;
begin
  q := TIBQuery.Create(self);
  q.Database := dm.dbrestaurante;
  q.Transaction := dm.transacao;
  q.Active:=false;
  q.sql.add(' select * from notas_transporte where codigo='+Quotedstr(codigoEntrada));
  q.Active:=true;
  result := not q.isempty;
  q.Active:=false;
  FreeAndNil(q); 
end;





function Tfrm_modelo_vazio.verificaDatas(data_inicial : string; data_final : string) : boolean;
begin
 try
   StrToDate(data_inicial)
 except
  begin
    showmessage('Data inicial inválida!');
    Result:=false;
    exit;
  end;
 end;

 try
   StrToDate(data_final)
 except
  begin
    showmessage('Data final inválida!');
    Result:=false;
    exit;
  end;
 end;


 if (StrToDate(data_inicial) > StrToDate(data_final)) then
  begin
    ShowMessage('Intervalo de datas inválido!');
    Result:=false;
    exit;
  end;


 data_Inicial:=Quotedstr(FormatDateTime('DD.MM.YYY',StrTodate(data_inicial)));
 data_Final:=Quotedstr(FormatDateTime('DD.MM.YYY',StrTodate(data_final)));

 Result:=true;
end;



procedure Tfrm_modelo_vazio.FormActivate(Sender: TObject);
begin

    Self.SetFocus;
end;

procedure Tfrm_modelo_vazio.Edit1Change(Sender: TObject);
var
i : integer;

begin
 if ( (sender is TCustomEdit and ((sender as TCustomEdit).Name='ed_cod_fornecedor'))) then
    if((sender is TCustomEdit and ( trim( (sender as TCustomEdit).text)='')) ) then
     begin
        For  i:=0 to ComponentCount-1 do
         begin
           if (components[i].Name = 'ed_cod_fornecedor') then
             (components[i] as TCustomEdit).Clear;

           if (components[i].Name = 'ed_razao_social_fornecedor') then
             (components[i] as TCustomEdit).Clear;

           if (components[i].Name = 'ed_nome_fantasia_fornecedor') then
             (components[i] as TCustomEdit).Clear;
         End;
     end;

 if ( (sender is TCustomEdit and ((sender as TCustomEdit).Name='edCodTipoBaixaEstoque'))) then
    if((sender is TCustomEdit and ( trim( (sender as TCustomEdit).text)='')) ) then
     begin
        For  i:=0 to ComponentCount-1 do
         begin
           if (components[i].Name = 'edCodTipoBaixaEstoque') then
             (components[i] as TCustomEdit).Clear;

           if (components[i].Name = 'edDescricaoTipoBaixaEstoque') then
             (components[i] as TCustomEdit).Clear;
         End;
     end;



 if ( (sender is TCustomEdit and ((sender as TCustomEdit).Name='ed_cod_tipo_documento'))) then
    if((sender is TCustomEdit and ( trim( (sender as TCustomEdit).text)='')) ) then
     begin
        For  i:=0 to ComponentCount-1 do
         begin
           if (components[i].Name = 'ed_cod_tipo_documento') then
             (components[i] as TCustomEdit).Clear;

           if (components[i].Name = 'ed_desc_tipo_documento') then
             (components[i] as TCustomEdit).Clear;
         End;
     end;


 if ( (sender is TCustomEdit and ((sender as TCustomEdit).Name='ed_cod_tipo_entrada'))) then
    if((sender is TCustomEdit and ( trim( (sender as TCustomEdit).text)='')) ) then
     begin
        For  i:=0 to ComponentCount-1 do
         begin
           if (components[i].Name = 'ed_cod_tipo_entrada') then
             (components[i] as TCustomEdit).Clear;

           if (components[i].Name = 'ed_desc_tipo_entrada') then
             (components[i] as TCustomEdit).Clear;
         End;
     end;



 if ( (sender is TCustomEdit and ((sender as TCustomEdit).Name='edCodBairro'))) then
    if((sender is TCustomEdit and ( trim( (sender as TCustomEdit).text)='')) ) then
     begin
        For  i:=0 to ComponentCount-1 do
         begin
           if (components[i].Name = 'edCodBairro') then
             (components[i] as TCustomEdit).Clear;

           if (components[i].Name = 'edDescBairro') then
             (components[i] as TCustomEdit).Clear;
         End;
     end;





 if ( (sender is TCustomEdit and ((sender as TCustomEdit).Name='ed_cod_grupo'))) then
    if((sender is TCustomEdit and ( trim( (sender as TCustomEdit).text)='')) ) then
     begin
        For  i:=0 to ComponentCount-1 do
         begin
           if (components[i].Name = 'ed_cod_grupo') then
             (components[i] as TCustomEdit).Clear;

           if (components[i].Name = 'ed_desc_grupo') then
             (components[i] as TCustomEdit).Clear;
         End;
     end;


 if ( (sender is TCustomEdit and ((sender as TCustomEdit).Name='edCodFormaPagamento'))) then
    if((sender is TCustomEdit and ( trim( (sender as TCustomEdit).text)='')) ) then
     begin
        For  i:=0 to ComponentCount-1 do
         begin
           if (components[i].Name = 'edCodFormaPagamento') then
             (components[i] as TCustomEdit).Clear;

           if (components[i].Name = 'edDescFormaPagto') then
             (components[i] as TCustomEdit).Clear;
         End;
     end;


 if ( (sender is TCustomEdit and ((sender as TCustomEdit).Name='ed_cod_item'))) then
    if((sender is TCustomEdit and ( trim( (sender as TCustomEdit).text)='')) ) then
     begin
        For  i:=0 to ComponentCount-1 do
         begin
           if (components[i].Name = 'ed_cod_item') then
             (components[i] as TCustomEdit).Clear;

           if (components[i].Name = 'ed_desc_item') then
             (components[i] as TCustomEdit).Clear;
         End;
     end;

 if ( (sender is TCustomEdit and ((sender as TCustomEdit).Name='edCodEntregador'))) then
    if((sender is TCustomEdit and ( trim( (sender as TCustomEdit).text)='')) ) then
     begin
        For  i:=0 to ComponentCount-1 do
         begin
           if (components[i].Name = 'edCodEntregador') then
             (components[i] as TCustomEdit).Clear;

           if (components[i].Name = 'edNomeEntregador') then
             (components[i] as TCustomEdit).Clear;
         End;
     end;



 if ( (sender is TCustomEdit and ((sender as TCustomEdit).Name='ed_cod_usuario'))) then
    if((sender is TCustomEdit and ( trim( (sender as TCustomEdit).text)='')) ) then
     begin
        For  i:=0 to ComponentCount-1 do
         begin
           if (components[i].Name = 'ed_cod_usuario') then
             (components[i] as TCustomEdit).Clear;

           if (components[i].Name = 'ed_nome_completo_usuario') then
             (components[i] as TCustomEdit).Clear;
         End;
     end;


end;

procedure Tfrm_modelo_vazio.FormCreate(Sender: TObject);
begin
Position := poScreenCenter;
end;

procedure Tfrm_modelo_vazio.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  dm.qry_consultas.Close;
end;

procedure Tfrm_modelo_vazio.copiaValoresComponentes();
var
 i : integer;
 q : TIBQuery;
begin
  q := TIBQuery.Create(self);
  q.Database := dm.dbrestaurante;
  q.Transaction := dm.transacao;
  q.Active:=false;

  q.SQL.clear;
  q.SQL.add('delete from componentes_form where estacao='+IntToStr(numeroEstacao));
  q.execsql;
    For  i:=0 to ComponentCount-1 do
    begin
       if components[i] is TCustomEdit then
        begin
          q.SQL.clear;
          if components[i] is TCurrencyEdit then
          begin


           q.SQL.Add('insert into componentes_form (nome_componente,valor_propriedade,estacao) values ('+Quotedstr(((components[i] as TCustomEdit).Name))+','+Quotedstr( CurrToStr(FloatToCurr(((components[i] as TCurrencyEdit).value))))+','+IntToStr(numeroEstacao)+')');
           q.ExecSQL;
          end;

          if components[i] is TDBedit then
          begin
           q.SQL.Add('insert into componentes_form (nome_componente,valor_propriedade,estacao) values ('+Quotedstr(((components[i] as TCustomEdit).Name))+','+Quotedstr(((components[i] as TCustomEdit).text))+','+IntToStr(numeroEstacao)+')');
           q.ExecSQL;
          end;
        end
    end;
  q.SQL.add('delete from componentes_form where estacao='+IntToStr(numeroEstacao));
  dm.transacao.Commit;
  dm.transacao.Active:=false;
  dm.transacao.Active:=true;
  FreeAndNil(q);
end;





procedure Tfrm_modelo_vazio.retornaValoresComponentes();
var
 i : integer;
 q : TIBQuery;
begin
  q := TIBQuery.Create(self);
  q.Database := dm.dbrestaurante;
  q.Transaction := dm.transacao;
  q.Active:=false;

    For  i:=0 to ComponentCount-1 do
    begin
      q.SQL.clear;
      q.SQL.add('select *  from componentes_form where estacao='+IntToStr(numeroEstacao)+' and nome_componente='+Quotedstr( (components[i] as TComponent).name ) );
      q.Active:=true;

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



Function Tfrm_modelo_vazio.getPastaSistemaWindows : String;
Var
Buffer : Array[0..144] of Char;
Begin
GetSystemDirectory(Buffer,144);
Result := StrPas(Buffer);
End;



function Tfrm_modelo_vazio.Converte(cmd: String): String;
var A : Integer ;
begin
  Result := '' ;
  For A := 1 to length( cmd ) do
  begin
     if not (cmd[A] in ['A'..'Z','a'..'z','0'..'9',
                        ' ','.',',','/','?','<','>',';',':',']','[','{','}',
                        '\','|','=','+','-','_',')','(','*','&','^','%','$',
                        '#','@','!','~',']' ]) then
        Result := Result + '#' + IntToStr(ord( cmd[A] )) + ' '
     else
        Result := Result + cmd[A] + ' ';
  end ;
end;





procedure Tfrm_modelo_vazio.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin


  if key = vk_escape then
  begin
    if  sender is TForm and ((sender as TForm).Name <> 'frm_principal') then
      close;
  end;
end;


function Tfrm_modelo_vazio.dialogConfirmacao(titulo : string ;mensagem : string; fonte : integer) : boolean;
begin
  string_auxiliar := 'N';
  Application.CreateForm(Tfrm_confirma_extrato, frm_confirma_extrato);
  frm_confirma_extrato.setTitulo(titulo);
  frm_confirma_extrato.setMensagem(mensagem,fonte);
  frm_confirma_extrato.ShowModal;
  frm_confirma_extrato.free;

  if string_auxiliar = 'N' then
   result:=false
  else
   result:=true;

end;


procedure Tfrm_modelo_vazio.imprimirBorderoContasApagar(codConta : string);
begin
  dm_relatorios.qryBorderoContasPagar.Active :=false;
  dm_relatorios.qryBorderoContasPagar.SQL.clear;
  dm_relatorios.qryBorderoContasPagar.SQL.add(' select r.codigo as CodigoConta, r.data_entrada,r.data_vencimento,r.descricaoconta, ');
  dm_relatorios.qryBorderoContasPagar.SQL.add('        r.valorconta, r.NUMERO_NOTA_FISCAL, f.razao_social,pf.descricao as descContaFinanceiro ,eg.descricao as descEmpresa ');
  dm_relatorios.qryBorderoContasPagar.SQL.add('        from r_contas_a_pagar   r ');
  dm_relatorios.qryBorderoContasPagar.SQL.add('          inner join fornecedor f  on  (f.cod_fornecedor = r.cod_fornecedor) ');
  dm_relatorios.qryBorderoContasPagar.SQL.add('          inner join plano_contas_financeiro pf on (pf.cod_conta = r.cod_conta) ');
  dm_relatorios.qryBorderoContasPagar.SQL.add('          inner join empresas_grupo eg on (eg.codigo = r.cod_emp_grupo) ');
  dm_relatorios.qryBorderoContasPagar.SQL.add(' where r.codigo='+Quotedstr(codConta));
  dm_relatorios.qryBorderoContasPagar.Active :=true;
  dm_relatorios.qryParcelasContasApagar.Active :=true;

  dm_relatorios.rpt.LoadFromFile(patchAplicacao+'relatorios\borderoContaApagar.fr3',true);
  dm_relatorios.rpt.ShowReport(true);
  dm_relatorios.qryBorderoContasPagar.Active := false;
end;




function Tfrm_modelo_vazio.ValidarChaveNFe(const ChaveNFe: string):boolean;
	const
	  PESO : Array[0..43] of Integer = (4, 3, 2, 9, 8, 7, 6, 5, 4, 3, 2, 9, 8, 7, 6, 5, 4, 3, 2, 9, 8, 7, 6, 5, 4, 3, 2, 9, 8, 7, 6, 5, 4, 3, 2, 9, 8, 7, 6, 5, 4, 3, 2, 0);
	var
	  Retorno : boolean;
	  aChave  : Array[0..43] of Char;
	  Soma    : Integer;
	  Verif   : Integer;
	  I       : Integer;
	begin
	  Retorno := false;
	  try
	    try
	      if not Length(ChaveNFe) = 44 then
	        raise Exception.Create('');
	 
	      StrPCopy(aChave,StringReplace(ChaveNFe,' ', '',[rfReplaceAll]));
	      Soma := 0;
	      for I := Low(aChave) to High(aChave) do
	        Soma := Soma + (StrToInt(aChave[i]) * PESO[i]);
	 
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





function Tfrm_modelo_vazio .verificaSeUsaCodGarcon() : boolean;
 begin
  dm.tb_parametros.Active := true;
  if (dm.tb_parametrosUSA_COD_GARCON.Value = 0) then
    result := false
  else
    result := true;


 end;



function Tfrm_modelo_vazio .verificaSeCobraServico() : boolean;
 begin
  dm.tb_parametros.Active := true;
  if (dm.tb_parametrosCOBRA_SERVICO.Value = 0) then
    result := false
  else
    result := true;


 end;


function Tfrm_modelo_vazio.VerificaConexaoInternet: boolean;
var
 flags : DWORD;
begin

    result := InternetCheckConnection('http://www.google.com.br/', 1, 0);


end;



function Tfrm_modelo_vazio.KeyIsDown(const Key: integer): boolean;
begin
  Result := GetKeyState(Key) and 128 > 0;
end;
end.










