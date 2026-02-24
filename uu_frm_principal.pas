unit uu_frm_principal;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, variants, Forms,
  TlHelp32, RealFramework, uuDisponibilidadeVenda, IBX.IBQuery, uuDRE, dxCore,
  uuRelDREComparativo, cxGridStrs, Dialogs, Menus, ExtCtrls, StdCtrls,
  pcnConversaoNFE, pcnConversao, SHDocVw, ACBrUtil, uu_modelo_Vazio,
  cxFilterControlStrs, dxNavBarConsts, JvComponentBase, JvComputerInfoEx,
  ACBrExtenso, ACBrBase, ACBrValidador, Vcl.onguard, AdvMenus, Vcl.Buttons,
  PngSpeedButton, dxGDIPlusClasses, AdvOfficeImage, Vcl.OleCtrls,
  cxGridPopupMenuConsts, cxEditConsts, ACBrPAFClass, ACBrEAD, AdvOfficeStatusBar,
  jpeg, uhpi, math, RTTI, DB, IniFiles, ACBrNFe, JvExControls, IBX.IBDatabase,
  uuRelRankingClientesDelivery, uuRelComprasRefCruzada, uuExpedicaoDelivery,
  uuCadBairros, uu_cad_clientes_delivery, uuExportaXMLNFCE,
  uuControleInventarios, uuFrmRelRepasseEntregadores, uuFrmIntegracoesBairro,
  ogutil, JvBalloonHint, JvAppInst;

type
  TAux_item = class
  public
    total_item: integer;
    total_monetario: real;
  end;

type
  Tfrm_principal = class(Tfrm_modelo_vazio)
    memoFormatacaoDelivery: TMemo;
    MainMenu1: TAdvMainMenu;
    I10000000: TMenuItem;
    I10001000: TMenuItem;
    I10004000: TMenuItem;
    I10003000: TMenuItem;
    I10006000: TMenuItem;
    fghfg: TMenuItem;
    I10008000: TMenuItem;
    I10009000: TMenuItem;
    I10013000: TMenuItem;
    I10013001: TMenuItem;
    I10013005: TMenuItem;
    N1: TMenuItem;
    Nmenu_sair: TMenuItem;
    I40002001: TMenuItem;
    I20001008: TMenuItem;
    I20000000: TMenuItem;
    I20001001: TMenuItem;
    I20001002: TMenuItem;
    I99000000: TMenuItem;
    I99000001c1: TMenuItem;
    I10010000: TMenuItem;
    I20001004: TMenuItem;
    timerVerificaLicenca: TTimer;
    I10012000: TMenuItem;
    I20001003: TMenuItem;
    I10011000: TMenuItem;
    I40005001: TMenuItem;
    I40000000: TMenuItem;
    I60000000: TMenuItem;
    USURIOS1: TMenuItem;
    I60011001: TMenuItem;
    I60010001: TMenuItem;
    I60009001: TMenuItem;
    I60008001: TMenuItem;
    I60007001: TMenuItem;
    I60006001: TMenuItem;
    I60004000: TMenuItem;
    I60003001: TMenuItem;
    I60002000: TMenuItem;
    I60002002: TMenuItem;
    I60002001: TMenuItem;
    I60001000: TMenuItem;
    I60001002: TMenuItem;
    I60001001: TMenuItem;
    I10021000: TMenuItem;
    I10018000: TMenuItem;
    I70000000: TMenuItem;
    I70005000: TMenuItem;
    I70004000: TMenuItem;
    I70002030: TMenuItem;
    I70003000: TMenuItem;
    I70002000: TMenuItem;
    I70002001: TMenuItem;
    I70002003: TMenuItem;
    I70002002: TMenuItem;
    I70003001: TMenuItem;
    I70005001: TMenuItem;
    I70020000: TMenuItem;
    I70020001: TMenuItem;
    verificaAlteracaoRelogio: TTimer;
    I70006000: TMenuItem;
    I70006001: TMenuItem;
    I70007000: TMenuItem;
    I70007001: TMenuItem;
    I70007002: TMenuItem;
    I70008000: TMenuItem;
    I70008001: TMenuItem;
    I10014000: TMenuItem;
    I70007003: TMenuItem;
    I10015000: TMenuItem;
    I70005002: TMenuItem;
    I70002010: TMenuItem;
    N3: TMenuItem;
    I70002031: TMenuItem;
    I70005003: TMenuItem;
    I10016000: TMenuItem;
    I60004001: TMenuItem;
    I60004002: TMenuItem;
    memo_avisos: TMemo;
    I10017000: TMenuItem;
    I70009000: TMenuItem;
    I70009001: TMenuItem;
    I70020002: TMenuItem;
    I10018001: TMenuItem;
    I70010000: TMenuItem;
    I70010015: TMenuItem;
    I70010020: TMenuItem;
    I70010021: TMenuItem;
    I70009002: TMenuItem;
    I70011000: TMenuItem;
    I70011001: TMenuItem;
    I70011002: TMenuItem;
    I70011003: TMenuItem;
    I80000000: TMenuItem;
    I70006002: TMenuItem;
    I70006003: TMenuItem;
    I60012001: TMenuItem;
    timePanelLicenca: TTimer;
    I70012001: TMenuItem;
    I10019000: TMenuItem;
    I10020000: TMenuItem;
    validador: TACBrValidador;
    I70004002: TMenuItem;
    I40006001: TMenuItem;
    I70013000: TMenuItem;
    I70013001: TMenuItem;
    memoChavePrivada: TMemo;
    memoChavePublica: TMemo;
    I70003002: TMenuItem;
    I40007001: TMenuItem;
    I70020003: TMenuItem;
    WBResposta: TWebBrowser;
    I10004001: TMenuItem;
    I10004004: TMenuItem;
    I70013002: TMenuItem;
    I70007004: TMenuItem;
    memo1: TMemo;
    memoPagamentosTEF: TMemo;
    I70004004: TMenuItem;
    I70003003: TMenuItem;
    I70007005: TMenuItem;
    I70002005: TMenuItem;
    I70020004: TMenuItem;
    I40008001: TMenuItem;
    I70020005: TMenuItem;
    I10004005: TMenuItem;
    I70004001: TMenuItem;
    escreveExtenso: TACBrExtenso;
    memoObsMiniprinter: TMemo;
    Panel2: TPanel;
    lbNomeEmpresa: TLabel;
    lbIpLocal: TLabel;
    lbNumeroEstacao: TLabel;
    lbIpDoServidor: TLabel;
    lbNumeroLicenca: TLabel;
    lbVersao: TLabel;
    lbNomeUsuario: TLabel;
    imgFundo: TImage;
    Panel3: TPanel;
    Label4: TLabel;
    PngSpeedButton1: TPngSpeedButton;
    PngSpeedButton2: TPngSpeedButton;
    PngSpeedButton3: TPngSpeedButton;
    PngSpeedButton4: TPngSpeedButton;
    I70007006: TMenuItem;
    I70003004: TMenuItem;
    I99000002: TMenuItem;
    I10016001: TMenuItem;
    I10016002: TMenuItem;
    I60004003: TMenuItem;
    I70008005: TMenuItem;
    I70004005: TMenuItem;
    I70002006: TMenuItem;
    N4: TMenuItem;
    I60004004: TMenuItem;
    C1: TMenuItem;
    I99000003: TMenuItem;
    lbDescricaoEmpresa: TLabel;
    PngSpeedButton5: TPngSpeedButton;
    PngSpeedButton6: TPngSpeedButton;
    I20001015: TMenuItem;
    estes1: TMenuItem;
    I10002001: TMenuItem;
    Panel1: TPanel;
    lbDataDoSistema: TLabel;
    Label1: TLabel;
    Image1: TImage;
    Panel4: TPanel;
    Panel5: TPanel;
    Image2: TImage;
    lbCaptionCertificado: TLabel;
    lbDiasExpiracaoCertificado: TLabel;
    Panel6: TPanel;
    pnLicenca: TPanel;
    imgLicenca: TImage;
    Label2: TLabel;
    lbDataExpiracaoSerial: TLabel;
    Panel7: TPanel;
    AdvOfficeImage2: TAdvOfficeImage;
    Image3: TImage;
    Image4: TImage;
    Image5: TImage;
    Image6: TImage;
    AdvOfficeImage1: TAdvOfficeImage;
    infoPC: TJvComputerInfoEx;
    I70014000: TMenuItem;
    I70014001: TMenuItem;
    JvAppInstances1: TJvAppInstances;
    C2: TMenuItem;
    OgMakeKeys1: TOgMakeKeys;
    D1: TMenuItem;
    function SerialNum(FDrive: string): string;
    function busca_parametros: boolean;
    function testeSerialValido(): boolean;
    procedure I20001001Click(Sender: TObject);
    procedure I10003000Click(Sender: TObject);
    procedure Nmenu_sairClick(Sender: TObject);
    procedure permissoes_do_menu;
    procedure I10008000Click(Sender: TObject);
    function conexao_banco: boolean;
    procedure abreModuloDeCaixa();
    procedure ProcessarEncerramentoDoDia;
    procedure I20001008Click(Sender: TObject);
    procedure I10013001Click(Sender: TObject);
    procedure I10013005Click(Sender: TObject);
    procedure I40002001Click(Sender: TObject);
    procedure eClick(Sender: TObject);
    procedure I20004001Click(Sender: TObject);
    procedure inicia;
    procedure FormActivate(Sender: TObject);
    procedure I99000001c1Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure I10009000Click(Sender: TObject);
    procedure fClick(Sender: TObject);
    procedure I20002013Click(Sender: TObject);
    procedure I50002001Click(Sender: TObject);
    procedure I10009001Click(Sender: TObject);
    procedure I10009002Click(Sender: TObject);

    procedure I10002001Click(Sender: TObject);
    procedure LoadXML(RetWS: string; MyWebBrowser: TWebBrowser);
    procedure I30003000Click(Sender: TObject);
    procedure I10006000Click(Sender: TObject);
    procedure ytytyttyClick(Sender: TObject);

    procedure I30002001Click(Sender: TObject);
    function validaDataDoSistema(): boolean;
    function DifHora(Inicio, Fim: string): string;
    procedure I20001002Click(Sender: TObject);
    procedure I10005000Click(Sender: TObject);
    procedure AdvToolButton4Click(Sender: TObject);
    procedure AdvToolButton13Click(Sender: TObject);
    procedure AdvToolButton6Click(Sender: TObject);
    procedure AdvToolButton5Click(Sender: TObject);
    procedure AdvToolButton7Click(Sender: TObject);
    procedure I10010000Click(Sender: TObject);
    procedure serialChangeCode(Sender: TObject; Code: TCode);
    procedure serialChecked(Sender: TObject; Status: TCodeStatus);
    procedure serialGetKey(Sender: TObject; var Key: TKey);
    procedure serialGetCode(Sender: TObject; var Code: TCode);
    procedure serialGetModifier(Sender: TObject; var Value: Integer);
    procedure testaLicencaEserial(primeira: boolean);
    procedure timerVerificaLicencaTimer(Sender: TObject);
    procedure I10012000Click(Sender: TObject);
    procedure I20001003Click(Sender: TObject);
    procedure I60003001Click(Sender: TObject);
    procedure I60006001Click(Sender: TObject);
    procedure I60007001Click(Sender: TObject);
    procedure I60008001Click(Sender: TObject);
    procedure I60009001Click(Sender: TObject);
    procedure I60010001Click(Sender: TObject);
    procedure I60011001Click(Sender: TObject);
    procedure I60001001Click(Sender: TObject);
    procedure I60001002Click(Sender: TObject);
    procedure I60002001Click(Sender: TObject);
    procedure I70002030Click(Sender: TObject);
    procedure I70002001Click(Sender: TObject);
    procedure I70002002Click(Sender: TObject);
    procedure I70002003Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure I70004001Click(Sender: TObject);
    procedure I70005001Click(Sender: TObject);
    procedure I70003001Click(Sender: TObject);
    procedure verificaTentativaDeBurlarSistema();
    procedure verificaAlteracaoRelogioTimer(Sender: TObject);
    procedure I70006001Click(Sender: TObject);
    procedure I70007001Click(Sender: TObject);
    procedure I70007002Click(Sender: TObject);
    procedure I70008001Click(Sender: TObject);
    procedure I10014000Click(Sender: TObject);
    procedure I70007003Click(Sender: TObject);
    procedure I10015000Click(Sender: TObject);
    procedure I40005001Click(Sender: TObject);
    procedure I70005002Click(Sender: TObject);
    procedure I70002010Click(Sender: TObject);
    procedure I70002031Click(Sender: TObject);
    procedure I70005003Click(Sender: TObject);
    procedure I60004001Click(Sender: TObject);
    procedure I60004002Click(Sender: TObject);
    function GeraMD5PAFECF: string;
    procedure AACGetChave(var Chave: string);
    procedure I10017000Click(Sender: TObject);
    procedure I70020002Click(Sender: TObject);
    procedure I10018001Click(Sender: TObject);
    procedure I50000002Click(Sender: TObject);
    procedure I70009002Click(Sender: TObject);
    procedure I70011001Click(Sender: TObject);
    procedure I70011002Click(Sender: TObject);
    procedure I70011003Click(Sender: TObject);
    procedure I70006002Click(Sender: TObject);
    procedure I70006003Click(Sender: TObject);
    procedure I60012001Click(Sender: TObject);
    procedure timePanelLicencaTimer(Sender: TObject);
    procedure I70012001Click(Sender: TObject);
    procedure ecfMsgPoucoPapel(Sender: TObject);
    procedure I10019000Click(Sender: TObject);
    procedure I70004002Click(Sender: TObject);
    procedure I70013001Click(Sender: TObject);
    procedure eadGetChavePrivada(var Chave: string);
    procedure eadGetChavePublica(var Chave: string);
    procedure I70003002Click(Sender: TObject);
    procedure I40007001Click(Sender: TObject);
    function ChecaForm(aForm: Tform): Boolean;
    procedure I70020003Click(Sender: TObject);
    procedure I10004001Click(Sender: TObject);
    procedure I10004004Click(Sender: TObject);
    procedure I80002004Click(Sender: TObject);
    procedure I80002002Click(Sender: TObject);
    procedure ACBrBAL1LePeso(Peso: Double; Resposta: string);
    procedure I70007004Click(Sender: TObject);
    procedure I70004004Click(Sender: TObject);
    procedure ApplicationEvents1Exception(Sender: TObject; E: Exception);
    procedure I40006001Click(Sender: TObject);
    procedure I70003003Click(Sender: TObject);
    procedure I70007005Click(Sender: TObject);
    procedure I70002005Click(Sender: TObject);
    procedure I10021000Click(Sender: TObject);
    procedure I10022000Click(Sender: TObject);
    procedure I70020004Click(Sender: TObject);
    procedure I40008001Click(Sender: TObject);
    procedure I70020005Click(Sender: TObject);
    procedure I10004005Click(Sender: TObject);
    procedure pnSalaoClick(Sender: TObject);
    procedure PngSpeedButton1Click(Sender: TObject);
    procedure PngSpeedButton2Click(Sender: TObject);
    procedure PngSpeedButton3Click(Sender: TObject);
    procedure PngSpeedButton4Click(Sender: TObject);
    procedure PngSpeedButton5Click(Sender: TObject);
    procedure imgLicencaClick(Sender: TObject);
    procedure I70007006Click(Sender: TObject);
    procedure I70003004Click(Sender: TObject);
    procedure I99000002Click(Sender: TObject);
    procedure I10016002Click(Sender: TObject);
    procedure I10016001Click(Sender: TObject);
    procedure I60004003Click(Sender: TObject);
    procedure I70008005Click(Sender: TObject);
    procedure I70004005Click(Sender: TObject);
    procedure I70002006Click(Sender: TObject);
    procedure I60004004Click(Sender: TObject);
    procedure C1Click(Sender: TObject);
    procedure I99000003Click(Sender: TObject);
    procedure PngSpeedButton6Click(Sender: TObject);
    procedure I20001015Click(Sender: TObject);
    procedure estes1Click(Sender: TObject);
    procedure I10001000Click(Sender: TObject);
    procedure I80002005Click(Sender: TObject);
    procedure I70014001Click(Sender: TObject);
    procedure JvAppInstances1Rejected(Sender: TObject);
    procedure C2Click(Sender: TObject);
    procedure I80000000Click(Sender: TObject);
  private
    { Private declarations }
    BDConectado: boolean;
    nfe55VendaAtual: boolean;
    procedure pegarValoresRTTIObj(objeto: TObject);
    procedure geraModificadorSerial;
    procedure AtivaTesteDeLicenca(Sender: TObject);
    function validaLoginUsuario: boolean;
    procedure logonUsuario;
    function KillProcess(const ExeFileName: string): Boolean;
  public

   { Public declarations }

    local_banco, usuario, senha, porta_bd, servidor_bd: string;
    MyMsg: LongInt;
    TrocarOperador: boolean;
    sairDoSistema: boolean;
    oquefazer_itens: integer;
    oquefazer_fornecedores: integer;
    oquefazer_cotacoes: integer;
    cod_cotacao: string;
    obsSaborPizza: string;
    obsLancamento: string;
    tipoMassaPizza: string;
    procedure MyShowHint(var HintStr: string; var CanShow: Boolean; var HintInfo: THintInfo);
    procedure setNFE55VendaAtual(emitirNFE55: boolean);
    function getNFE55VendaAtual(): boolean;
  end;

const
  CKey: TKey = ($2A, $C2, $09, $1A, $C3, $5D, $28, $7C, $84, $5E, $0A, $8C, $F1, $0F, $BF, $3D);

var
  frm_principal: Tfrm_principal;
  cor_foco_edit: Tcolor;
  cor_botao: Tcolor;
  cor_foco_botao: Tcolor;
  iniciado: boolean;
  voltarParaCaixa: smallint;
  mesaDelivery: string;
  mesaBalcao: string;
  garcomDelivery: string;
  garcomBalcao: string;
  pizzaValorProporcional: Boolean;
  retorno_consulta: array[1..10] of string;
  respostaPergunta: boolean;
  codigo_usuario: string;
  nome_usuario: string;
  numeroECFEmUso: string;
  num_serie_ecf: string;
  MD5_APLICATIVO: string;
  ecfArquivoAuxiliar: TACBrAACECF;
  caminhoMGV5: string;
  pesoLidoBalanca: string;
  sucessoLeituraPeso: boolean;
  respostaLeituraBalanca: string;
  nome_completo_usuario: string;
  codigo_usuario_responsavel: string;
  nome_usuario_responsavel: string;
  nome_comp_usuario_responsavel: string;
  LInformacoesComplementaresNFE: string;




   //Parametros de taxa de servico

  percentualTaxaServico: Double;
  selecionarCobrancaNaAberturaDoCaixa: smallint;
  patchAplicacao: string;
  patchXMLEntradas: string;
  caminhoArquivoAuxiliarPAF: string;
  caminhoArquivoExtrato: string;
  localDeEmissaoDeExtrato: smallint;
  localDeEmissaoEncerramento: smallint;
  codRelatorioGerencialExtrato: smallint;
  indiceRelatorioGerencialExtrato: smallint;
  imprimirTaxaServicoNoExtrato: smallint;
  linhaExtrato: string;
  formatoCabecalhoExtrato: string;
  formatoCabecalhoExtratoLayout2Linha1: string;
  formatoCabecalhoExtratoLayout2Linha2: string;
  formatoRodapeExtrato: string;
  formatoLinhaTotalizador: string;
  formatoLinhaTotalizadorGeral: string;
  alinhamentoDireitaTotal: integer;
  alinhamentoDireitaTotalGeral: integer;
  nfceSincrona: boolean;
  nfeSincrona: boolean;
  valorMaxNFCESemCPF: double;
  data_do_sistema: Tdate;
  creditoNasEntradas: boolean;
  simplesNacional: boolean;
  destacaImpostoNFCE: boolean;
  aliquotaIBPT: double;
  qtdViasSangria: smallint;
  numeroEstacao: integer;
  imagem_c_livre: string;
  imagem_c_aguardando: string;
  imagem_n_disponivel: string;
  string_auxiliar: string;
  string_auxiliar2: string;
  string_auxiliar3: string;
  strObsProduto: string;
  cnpj, razao_social, nome_fantasia, codEmpresa, descricaoEmpresa: string;
  modificadorDoDisco: string;
  codPedidoBalcaoAtual: string;
  imprimeObsComprovanteDelivery: boolean;
  imprimeDadosPlataformaComprovanteDelivery, imprimeDadosPlataformaProducaoDelivery: Boolean;
  msg_promo_delivery, msg_promo_conta: string;
  logoComprovantes: string;
  tabPrecoDelivery: boolean;
  ComprovanteDeliveryAgrupado: boolean;
  identificaClienteBalcao: boolean;
  imprimeEnderecoNaProducaoDelivery: boolean;
  zerarICMSnasEntradas: integer;
  alterarUnidadeNasentradas: integer;
  tipo_cob_couvert: integer;
  Iretorno: integer;
  tipo_impressora: integer;
  tipo_comprovante: integer;
  viasComprovanteDelivery: integer;
  //Parâmetros da Impressora Fiscal
  impressora_fiscal_instalada: integer;
  marca_impressora_fiscal: integer;
  modelo_impressora_fiscal: integer;
  portaDaImpressoraFiscal: string;
  fabricanteBalanca: string;
  portaDaBalanca: string;
  velocidadeBalanca: string;
  bitsDadosBalanca: string;
  paridadeBalanca: string;
  stopBitsBalanca: string;
  fluxoBalanca: string;
  fabricanteBalanca2: string;
  portaDaBalanca2: string;
  velocidadeBalanca2: string;
  bitsDadosBalanca2: string;
  paridadeBalanca2: string;
  stopBitsBalanca2: string;
  fluxoBalanca2: string;
  codigoSuprimento: string;
  codigoSangria: string;
  usarAcbr: integer;
  qtdColunasNormalECF: integer;
  qtdColunasExpandidoECF: integer;
  arredondamento: integer;
  nomeClienteCupom, enderecoClienteCupomFiscal, cpfClienteCupomFiscal: string;

  //Parametros de gaveta
  gavetaInstalada: integer;
  marcaGaveta: integer;
  modeloGaveta: integer;
  portaGaveta: integer;



  //Parâmetros da Impressora não fiscal 01
  impressora_nao_fiscal_01_instalada: integer;
  marca_impressora_nao_fiscal_01: integer;
  modelo_impressora_nao_fiscal_01: integer;
  porta_impressora_nao_fiscal_01: string;

  //Parâmetros da Impressora não fiscal 02
  impressora_nao_fiscal_02_instalada: integer;
  marca_impressora_nao_fiscal_02: integer;
  modelo_impressora_nao_fiscal_02: integer;
  porta_impressora_nao_fiscal_02: string;
  gravado: boolean;
  tipo_cupom: integer;
  numero_caixa: string;
  ultimoCaixaAberto: string;
  string_aux_cod_barras: string;
  ultima_venda: string;
  encerrar_dia: boolean;
  coluna: integer;
  linha: integer;


  //Parametros de COuvert
  cobraCOuvert: smallint;  // identifica se a casa cobra couvert artístico
  lancaCouvertAutomaticamente: smallint; // Identifica se o sistema deve lançar o couvert automaticamente ou exibir janela para o usuário.
  lancaCouvertNoCheckin: smallint;  // Identifica se o couvert será lançado na rotina de checkin


  // Parametros da Licença

  licenca: string;
  diasExpiracaoSistema: integer;
  registrarSistema: boolean;
  sistemaRegistrado: boolean;
  licencaValida: boolean;

implementation

uses
  uu_data_module, uu_produtos, uu_cad_usuarios, uu_cad_garcons, uu_troca_senha,
  uu_cad_formas_pagamento, uu_confirma_encerramento, uu_cad_grupos,
  uu_leitura_mem_fiscal, UU_DM_RELATORIOS, uu_cad_contas, uu_cad_historico,
  uu_cad_itens_estoque, uu_cad_fornecedor, uu_cad_clientes, uuCadUnidades,
  uuCadClientesReduzido, uuLiberarCliente, uuAberturaCaixa, uuPrincipalDelivery,
  uListagemProdutos, uu_rel_produtosPeriodo, uuRelAniversariantes,
  uuRelConsumoClientesNaCasa, uuCadTiposSangria, uuRelatorioPedidosDelivery,
  uuRelContatoEstrategicoDelivery, uuLogTouch, uuRegistroSistema,
  uuCadMotivoCancelamento, uuCadObservacoesPreparo, uuCadTiposBaixaEstoque,
  uuDmRelatorios, uu_listagem_fornecedores, uu_listagem_itens_estoque,
  uu_relatorio_estoque, uu_rel_compras_por_fornecedor, uu_rel_compras_por_grupo,
  uu_rel_compras_por_Item, uuRelatorioCaixa, uu_rel_producao_Garcons,
  uuRelFaturamento, uuCadEntregadores, uuGerarSpedFiscal,
  uuRelPedidosPorEntregador, uuControleCartoes, uuRelClientesBoateData,
  uuRelatorioBaixasManuais, uuRelatorioEstoqueReposicao, uuCadSaboresPizza,
  uuCadCidade, uuRelNotasVendaConsumidor, uuRelConferenciaLivroEntradas,
  uuSaidasNotaFiscal, uu_rel_notas_saida_fornecedor,
  uuRelFaturasAbertasPorFaturamento, uuRelFaturasAbertasPorVencimento,
  uRelFaturasAbertasDetalhada, uuRelProducaoGarconsSintetico, uuRelTaxaServico,
  uuCadGruposTouch, uuRelEstatisticoPeriodo, uuRelResCaixaTurno,
  uuEntradasAvulsas, uuFrenteCaixa, uu_encerramento, uuRelApuracaoGrupos,
  uuPainelAguarde, uuProjecaoVendas, uuListagemLancamentosRD,
  uuRelAuditoriaPedidos, uuManutencaoContasApagar, uuRelProdutosVariosPeriodos,
  uuRelCancelamentoProdutos, uuGeraArquivoBalanca, uuParametrosSistema,
  uuBaixasManuais, uuRelSangrias, uuFrmErrosInutilizacao,
  uuFrmReajusteSaboresPizza, uuListagemTabelasPreco, uuRelFaturamentoPorOperador,
  uuRelCurvaABCProdutosVendidos, uuRelCurvaABCProdutosComprados,
  uuRelFichasTecnicas, uuRelFaturamentoComparativoMensal, uufrmTestes,
  uuProducaoSubProdutos, uuRelRakingProdutos, uuRelRecebimentosCartoes,
  uuReimpressaoDanfeNFCE, uuTestes, uuPrototipoCaixaREstaurante,
  uuRelInsumosProducao, uuConfiguracoesReplicacao, uuManifestacaoNFE,
  uuContasAPagarEntradas, uuFrmDRE;




{$R *.dfm}

function Tfrm_principal.busca_parametros: boolean;
var
  vAux: string;
begin
  dm.atualizaDataDoSistema();
  patchAplicacao := ExtractFilePath(Application.ExeName);
  if dm.tb_parametrosCREDITO_ENTRADAS.Value = 0 then
    creditoNasEntradas := false
  else
    creditoNasEntradas := true;

  if (dm.tb_parametrosREGIME_TRIBUTACAO.Value = 1) then // se a empresa for optante do simples nacional
  begin
    simplesNacional := true;
    if (dm.tb_parametrosIMPOSTO_SIMP_NAC_NFCE.Value = 1) then
      destacaImpostoNFCE := true
    else
      destacaImpostoNFCE := false;

  end
  else
  begin
    simplesNacional := false;
  end;

  if dm.tb_parametrosIMP_DADOS_PLATAFORMA_COMP_DELIV.Value = 1 then
    imprimeDadosPlataformaComprovanteDelivery := true
  else
    imprimeDadosPlataformaComprovanteDelivery := false;

  if dm.tb_parametrosIMP_DADOS_PLATAFORMA_PRODUCAO.Value = 1 then
    imprimeDadosPlataformaProducaoDelivery := true
  else
    imprimeDadosPlataformaProducaoDelivery := False;

  if dm.tb_parametrosPIZZA_MAIS_CARA.Value = 1 then
    pizzaValorProporcional := false
  else
    pizzaValorProporcional := true;

  aliquotaIBPT := dm.tb_parametrosALIQ_IBPT.Value;

  zerarICMSnasEntradas := dm.tb_parametrosZERAR_ICMS_ENTRADAS.Value;
  alterarUnidadeNasentradas := dm.tb_parametrosALTERAR_UN_NAS_ENTRADAS.value;

  if dm.tb_parametrosIMP_ENDERECO_CLIENTE_PRODUCAO.Value = 1 then
    imprimeEnderecoNaProducaoDelivery := true
  else
    imprimeEnderecoNaProducaoDelivery := false;

  numeroEstacao := StrToInt(dm.LeIni(2, 'BANCO_DE_DADOS', 'ESTACAO'));
  if numeroEstacao = 0 then
  begin
    ShowMessage('Número da estação incorreto!');
    application.terminate;
  end;

  qtdViasSangria := dm.tb_parametrosQTD_VIAS_SANGRIA.Value;
  razao_social := dm.tb_parametros.Fieldbyname('razao_social').value;
  nome_fantasia := dm.tb_parametros.Fieldbyname('nome_fantasia').value;
  descricaoEmpresa := dm.tb_parametros.Fieldbyname('descricao_empresa').value;

  if dm.tb_parametros.Fieldbyname('MSG_PROMO_DELIVERY').value <> null then
  begin

    msg_promo_delivery := StringReplace(dm.tb_parametros.Fieldbyname('MSG_PROMO_DELIVERY').value, '\', sLineBreak, [rfReplaceAll]);
    if trim(msg_promo_delivery) <> '' then
    begin
      if dm.tb_parametrosMSG_DELIVERY_GD.Value = 1 then
        msg_promo_delivery := '<e>' + msg_promo_delivery + '</e>';

      if dm.tb_parametrosMSG_DELIVERY_DESTAQUE.Value = 1 then
        msg_promo_delivery := '<in>' + msg_promo_delivery + '</in>';
    end;

//    dm.danfeESCPos.msgDelivery := msg_promo_delivery;
  end;

  if (dm.tb_parametros.Fieldbyname('IMPRIME_OBS_COMPROVANTE_DELIV').value <> null) and (dm.tb_parametros.Fieldbyname('IMPRIME_OBS_COMPROVANTE_DELIV').value = 1) then
  begin
    imprimeObsComprovanteDelivery := true;
  end;

  if dm.tb_parametros.Fieldbyname('TAB_PRECOS_DELIVERY').value <> 1 then
  begin
    tabPrecoDelivery := true;
  end;

  if dm.tb_parametros.Fieldbyname('COMPROVANTE_DELIVERY_AGRUPADO').value = 1 then
    ComprovanteDeliveryAgrupado := true
  else
    ComprovanteDeliveryAgrupado := false;

  if dm.tb_parametros.Fieldbyname('IDENTIFICA_CLIENTE_BALCAO').value = 1 then
    identificaClienteBalcao := true
  else
    identificaClienteBalcao := false;

  if dm.tb_parametros.Fieldbyname('MSG_PROMO_CONTA').value <> null then
  begin
    msg_promo_conta := StringReplace(dm.tb_parametros.Fieldbyname('MSG_PROMO_CONTA').value, '\', sLineBreak, [rfReplaceAll]);
    if trim(msg_promo_conta) <> '' then
    begin
      if dm.tb_parametrosMSG_CONTA_GD.Value = 1 then
        msg_promo_conta := '<e>' + msg_promo_conta + '</e>';

      if dm.tb_parametrosMSG_CONTA_DESTAQUE.Value = 1 then
        msg_promo_conta := '<in>' + msg_promo_conta + '</in>';
    end;
  end;

  if ((dm.tb_parametros.Fieldbyname('logo_comprovantes').value <> null) and (trim(dm.tb_parametros.Fieldbyname('logo_comprovantes').value) <> '')) then
  begin
    logoComprovantes := patchAplicacao + '\imagens\' + dm.tb_parametros.Fieldbyname('logo_comprovantes').value;
    dm.danfeESCPos.Logo := logoComprovantes;
    ////dm.adicionalog('Arquivo de logo: ' + logoComprovantes);
  end
  else
  begin
    ////dm.adicionalog('Arquivo de logo não encontrado!');
  end;

  cnpj := dm.tb_parametros.Fieldbyname('cnpj').value;
  codEmpresa := dm.tb_parametros.Fieldbyname('cod_empresa').value;

  if dm.tb_parametrosTIPO_ENVIO_NFCE.Value = 1 then
    nfceSincrona := true
  else
    nfceSincrona := true;

  if dm.tb_parametrosTIPO_ENVIO_NFE.Value = 1 then
    nfeSincrona := true
  else
    nfeSincrona := false;

  if dm.tb_parametrosTIPO_ENVIO_NFCE.Value <> null then
  begin
    if dm.tb_parametrosMAX_NFCE_SEM_CPF.Value > 0 then
      valorMaxNFCESemCPF := dm.tb_parametrosMAX_NFCE_SEM_CPF.Value
    else
      valorMaxNFCESemCPF := 10000;
  end
  else
    valorMaxNFCESemCPF := 10000;

  vAux := FloatToStr(dm.tb_parametrosAGUARDA_CONSULTA_RET_NFCE.Value * 1000);
  dm.ACBrNFe1.Configuracoes.WebServices.AguardarConsultaRet := StrToInt(vAux);
  dm.ACBrNFe1.Configuracoes.WebServices.Tentativas := dm.tb_parametrosTENTATIVAS_CONSULTA_RET_NFCE.Value;

  vAux := FloatToStr(dm.tb_parametrosINTERVALO_TENTATIVAS_NFCE.Value * 1000);
  dm.ACBrNFe1.Configuracoes.WebServices.IntervaloTentativas := StrToInt(vAux);

  vAux := floattostr(dm.tb_parametrosTIMEOUT_RET_NFCE.Value * 1000);
  dm.ACBrNFe1.Configuracoes.WebServices.TimeOut := StrToInt(vAux);



  // Parametros de extrato
  patchXMLEntradas := dm.LeIni(2, 'XML_ENTRADAS', 'pastaXML');
  caminhoArquivoExtrato := patchAplicacao + '\extrato.dat';
  localDeEmissaoDeExtrato := StrToInt(dm.LeIni(1, 'extrato', 'localDeEmissaoDeExtrato'));
  localDeEmissaoEncerramento := StrToInt(dm.LeIni(1, 'encerramento', 'localDeEmissaoDeEncerramento'));
  codRelatorioGerencialExtrato := StrToInt(dm.LeIni(1, 'extrato', 'codRelatorioGerencialExtrato'));
  indiceRelatorioGerencialExtrato := StrToInt(dm.LeIni(1, 'extrato', 'indiceRelatorioGerencialExtrato'));

  imprimirTaxaServicoNoExtrato := StrToInt(dm.LeIni(1, 'extrato', 'imprimirTaxaServicoNoExtrato'));
  linhaExtrato := dm.LeIni(2, 'extrato', 'linhaExtrato');
  formatoCabecalhoExtrato := dm.LeIni(2, 'extrato', 'formatoCabecalhoExtrato');
  formatoCabecalhoExtratoLayout2Linha1 := dm.LeIni(2, 'extrato', 'formatoCabecalhoExtratoLayout2Linha1');
  formatoCabecalhoExtratoLayout2Linha2 := dm.LeIni(2, 'extrato', 'formatoCabecalhoExtratoLayout2Linha2');

  formatoRodapeExtrato := dm.LeIni(2, 'extrato', 'formatoRodapeExtrato');
  formatoLinhaTotalizador := dm.LeIni(2, 'extrato', 'formatoLinhaTotalizador');
  formatoLinhaTotalizadorGeral := dm.LeIni(2, 'extrato', 'formatoLinhaTotalizadorGeral');

  alinhamentoDireitaTotal := StrToInt(dm.LeIni(1, 'extrato', 'alinhamentoDireitaTotal'));
  alinhamentoDireitaTotalGeral := StrToInt(dm.LeIni(1, 'extrato', 'alinhamentoDireitaTotalGeral'));
  layoutExtrato := StrToInt(dm.LeIni(1, 'extrato', 'layout'));



  // Busca os parâmetros da impressora fiscal


  impressora_fiscal_instalada := StrToInt(dm.LeIni(1, 'IMPRESSORA_FISCAL', 'instalada'));
  marca_impressora_fiscal := StrToInt(dm.LeIni(1, 'IMPRESSORA_FISCAL', 'marca'));
  modelo_impressora_fiscal := StrToInt(dm.LeIni(1, 'IMPRESSORA_FISCAL', 'modelo'));

  portaDaImpressoraFiscal := dm.LeIni(2, 'IMPRESSORA_FISCAL', 'porta');
  codigoSuprimento := dm.LeIni(2, 'IMPRESSORA_FISCAL', 'codigoSuprimento');
  codigoSangria := dm.LeIni(2, 'IMPRESSORA_FISCAL', 'codigoSangria');
  usarAcbr := StrToInt(dm.LeIni(1, 'IMPRESSORA_FISCAL', 'usarAcbr'));
  qtdColunasNormalECF := StrToInt(dm.LeIni(1, 'IMPRESSORA_FISCAL', 'qtdColunasNormalECF'));
  qtdColunasExpandidoECF := StrToInt(dm.LeIni(1, 'IMPRESSORA_FISCAL', 'qtdColunasExpandidoECF'));
  arredondamento := StrToInt(dm.LeIni(1, 'IMPRESSORA_FISCAL', 'arredondamento'));


  // Busca parâmetros da impressora não fiscal 01
  impressora_nao_fiscal_01_instalada := StrToInt(dm.LeIni(1, 'IMPRESSORA_NAO_FISCAL_01', 'instalada'));
  marca_impressora_nao_fiscal_01 := StrToInt(dm.LeIni(1, 'IMPRESSORA_NAO_FISCAL_01', 'marca'));
  modelo_impressora_nao_fiscal_01 := StrToInt(dm.LeIni(1, 'IMPRESSORA_NAO_FISCAL_01', 'modelo'));
  porta_impressora_nao_fiscal_01 := dm.LeIni(2, 'IMPRESSORA_NAO_FISCAL_01', 'porta');

  // Busca parâmetros da impressora não fiscal 02
  impressora_nao_fiscal_02_instalada := StrToInt(dm.LeIni(1, 'IMPRESSORA_NAO_FISCAL_02', 'instalada'));
  marca_impressora_nao_fiscal_02 := StrToInt(dm.LeIni(1, 'IMPRESSORA_NAO_FISCAL_02', 'marca'));
  modelo_impressora_nao_fiscal_02 := StrToInt(dm.LeIni(1, 'IMPRESSORA_NAO_FISCAL_02', 'modelo'));
  porta_impressora_nao_fiscal_02 := dm.LeIni(2, 'IMPRESSORA_NAO_FISCAL_02', 'porta');

  gavetaInstalada := StrToInt(dm.LeIni(1, 'GAVETA', 'instalada'));
  portaGaveta := StrToInt(dm.LeIni(1, 'GAVETA', 'porta'));

  fabricanteBalanca := dm.LeIni(2, 'BALANCA', 'fabricante');
  portaDaBalanca := dm.LeIni(2, 'BALANCA', 'porta');
  velocidadeBalanca := dm.LeIni(2, 'BALANCA', 'velocidade');
  paridadeBalanca := dm.LeIni(2, 'BALANCA', 'paridade');
  bitsDadosBalanca := dm.LeIni(2, 'BALANCA', 'bitsDados');
  stopBitsBalanca := dm.LeIni(2, 'BALANCA', 'stopBits');
  fluxoBalanca := dm.LeIni(2, 'BALANCA', 'fluxo');

  fabricanteBalanca2 := dm.LeIni(2, 'BALANCA_02', 'fabricante');
  portaDaBalanca2 := dm.LeIni(2, 'BALANCA_02', 'porta');
  velocidadeBalanca2 := dm.LeIni(2, 'BALANCA_02', 'velocidade');
  paridadeBalanca2 := dm.LeIni(2, 'BALANCA_02', 'paridade');
  bitsDadosBalanca2 := dm.LeIni(2, 'BALANCA_02', 'bitsDados');
  stopBitsBalanca2 := dm.LeIni(2, 'BALANCA_02', 'stopBits');
  fluxoBalanca2 := dm.LeIni(2, 'BALANCA_02', 'fluxo');

  caminhoMGV5 := dm.LeIni(2, 'BALANCA', 'caminhoMGV5');

  portaDaBalanca2 := dm.LeIni(2, 'BALANCA_02', 'porta');
  velocidadeBalanca2 := dm.LeIni(2, 'BALANCA_02', 'velocidade');

  viasComprovanteDelivery := StrtoInt(dm.LeIni(1, 'EXTRATO', 'viasComprovanteDelivery'));

  tipo_comprovante := StrtoInt(dm.LeIni(1, 'ENCERRAMENTO', 'tipo_comprovante'));
  numero_caixa := dm.LeIni(1, 'CAIXA', 'numero');
  numero_caixa := FormatFloat('000', strtofloat(numero_caixa));
  tipo_impressora := StrToint(dm.LeIni(1, 'ENCERRAMENTO', 'impressora_fiscal'));
  ultimoCaixaAberto := dm.LeIni(2, 'CAIXA', 'ultimoCodigo');



  //Busca os parâmetros de couvert
  cobraCouvert := StrToint(dm.LeIni(1, 'COUVERT', 'cobraCouvert'));                           // identifica se a casa cobra couvert artístico
  lancaCouvertAutomaticamente := StrToint(dm.LeIni(1, 'COUVERT', 'lancarAutomaticamente'));   // identifica se a casa cobra couvert artístico
  lancaCouvertNoCheckin := StrToint(dm.LeIni(1, 'COUVERT', 'lancarCouvertNoCheckin'));   // identifica se a casa cobra couvert artístico
  //Busca os parâmetros de taxa de servico
  percentualTaxaServico := 0;

  percentualTaxaServico := StrToFloat(dm.LeIni(2, 'TAXA_SERVICO', 'percentual'));
  selecionarCobrancaNaAberturaDoCaixa := StrToint(dm.LeIni(1, 'TAXA_SERVICO', 'selecionarCobrancaNaAberturaDoCaixa'));

  if (StrToint(dm.LeIni(1, 'TAXA_SERVICO', 'cobraTaxaServico')) = 0) then
  begin
    percentualTaxaServico := 0;
    selecionarCobrancaNaAberturaDoCaixa := 0;
  end;

  /// Outros parametros
  garcomDelivery := dm.getCodGarconMesaDelivery();
  mesaDelivery := dm.getCodMesaDelivery();
  mesaBalcao := dm.getCodMesaBalcao();
  garcomBalcao := dm.getCodGarconMesaBalcao();
  if dm.tb_parametrosINF_COMP_NFE.Value <> null then
    LInformacoesComplementaresNFE := dm.tb_parametrosINF_COMP_NFE.Value;


  //busca parametros de licença
  licenca := dm.LeIni(2, 'BANCO_DE_DADOS', 'registro_' + codEmpresa);

  lbNomeEmpresa.Caption := razao_social;
  lbNomeEmpresa.Caption := razao_social;
  lbNomeUsuario.Caption := nome_usuario;
  lbDescricaoEmpresa.Caption := descricaoEmpresa;
  lbVersao.Caption := dm.ExeInfo1.FileVersion;
  lbIpDoServidor.Caption := servidor_bd;
  lbIpLocal.Caption := infoPC.Identification.IPAddress;
  lbNumeroEstacao.Caption := formatfloat('000', numeroEstacao);
  // Mudar essa variável na chamada da função de emissão de NFCE
  dm.parametrizaAcbrNFE(moNFe, false, true);

  lbNumeroLicenca.Caption := dm.decriptografa(licenca, '1320');
  lbDataDoSistema.Caption := FormatDateTime('DD/MM/YY', data_do_sistema);

  if dm.diasExpiracaoCertificado >= 0 then
  begin
    if dm.diasExpiracaoCertificado > 0 then
      lbDiasExpiracaoCertificado.Caption := inttostr(dm.diasExpiracaoCertificado) + ' dias'
    else
    begin
      lbCaptionCertificado.Caption := 'Seu certificado está';
      lbDiasExpiracaoCertificado.Caption := 'Expirado';
//       lbDiasExpiracaoCertificado := inttostr(dm.diasExpiracaoCertificado)
    end;

  end
  else
  begin
    lbDiasExpiracaoCertificado.Visible := false;
    lbCaptionCertificado.Caption := 'Certificado digital não instalado.';
    lbDiasExpiracaoCertificado.Visible := false;
  end;

end;

procedure Tfrm_principal.LoadXML(RetWS: string; MyWebBrowser: TWebBrowser);
begin
  ACBrUtil.WriteToTXT(PathWithDelim(ExtractFileDir(application.ExeName)) + 'temp.xml', ACBrUtil.ConverteXMLtoUTF8(RetWS), False, False);
  MyWebBrowser.Navigate(PathWithDelim(ExtractFileDir(application.ExeName)) + 'temp.xml');
end;

function Tfrm_principal.testeSerialValido(): boolean;
var
  status: TCodeStatus;
begin
{
  status := frm_principal.serial.CheckCode(true);
  if status = ogValidCode then
  begin
    frm_principal.serial.Decrease;
    diasExpiracaoSistema := frm_principal.serial.GetValue;
    result := true;
  end
  else
  begin
    result := false;
  end;
  }
end;

procedure Tfrm_principal.I20001001Click(Sender: TObject);
begin

  if (StrToInt(dm.LeIni(2, 'SALAO', 'estacaoLancamentoSalao')) = 0) then
  begin
    TrocarOperador := false;
    dm.qryErrosInutilizacao.Active := true;
    dm.qryErrosInutilizacao.FetchAll;
    if dm.qryErrosInutilizacao.RecordCount > 0 then
    begin
      dm.exibe_painel_erro('Foram detectados erros de inutilização. À seguir serão exibidos os erros e este erros devem devem ser enviados à Real Softwares com urgência', 'Confirmo ciência');
      Application.Createform(TfrmErrosInutilizacao, frmErrosInutilizacao);
      frmErrosInutilizacao.ShowModal;
      frmErrosInutilizacao.Free;
    end;
    dm.qryErrosInutilizacao.Active := true;

    if (verificaSeCaixaEstaAberto(ultimoCaixaAberto) = false) then
    begin

      if (dm.verificaNotasContingencia = true) then
      begin
        dm.exibe_painel_erro('Existem NFC-e(s) em contingência pendentes de envio. '#13#10#13#10 + ' ', 'Ok');

      end;

      if (frm_principal.validaDataDoSistema() = true) then
      begin
        Application.CreateForm(TfrmAberturaCaixa, frmAberturaCaixa);
        frmAberturaCaixa.ShowModal;
        FreeAndNil(frmAberturaCaixa);
      end;

      if (verificaSeCaixaEstaAberto(ultimoCaixaAberto) = true) then
      begin
        abreModuloDeCaixa();
      end;

    end
    else
    begin
      abreModuloDeCaixa();

    end;

    if (sairDoSistema = true) then
    begin
      Application.Terminate;
    end;

    if (TrocarOperador = true) then
    begin
      inicia();
    end;
  end
  else
  begin
    Application.CreateForm(Tfrm_caixa_restaurante, frm_caixa_restaurante);
    frm_caixa_restaurante.ShowModal;
    frm_caixa_restaurante.Free;
  end;

end;

procedure Tfrm_principal.abreModuloDeCaixa();
begin

  voltarParaCaixa := 2;

  case StrToInt(dm.leini(2, 'CAIXA', 'tipo_caixa')) of
    1:
      begin
        if dm.verificaPermissaoAcao('I20001002', true, true) = true then
        begin
          Application.CreateForm(TfrmFrenteCaixa, frmFrenteCaixa);
          frmFrenteCaixa.ShowModal;
          frmFrenteCaixa.Free;
        end;
      end;

    2:
      begin

        if dm.verificaPermissaoAcao('I20001001', true, true) = true then
        begin
          Application.CreateForm(Tfrm_caixa_restaurante, frm_caixa_restaurante);
          frm_caixa_restaurante.ShowModal;
          frm_caixa_restaurante.Free;
        end;

      end;
  end;

end;

procedure Tfrm_principal.I10003000Click(Sender: TObject);
begin
  Application.CreateForm(Tfrm_cad_grupos, frm_cad_grupos);
  frm_cad_grupos.showmodal;
  frm_cad_grupos.free;
end;

procedure Tfrm_principal.I70002006Click(Sender: TObject);
begin
  inherited;
  Application.CreateForm(TfrmRelCurvaABCProdutosComprados, frmRelCurvaABCProdutosComprados);
  frmRelCurvaABCProdutosComprados.ShowModal;
  frmRelCurvaABCProdutosComprados.Free;
end;

procedure Tfrm_principal.I70014001Click(Sender: TObject);
begin
  inherited;
  application.CreateForm(TfrmRelInsumosProducao, frmRelInsumosProducao);
  frmRelInsumosProducao.showmodal;
  frmRelInsumosProducao.free;
end;

procedure Tfrm_principal.Nmenu_sairClick(Sender: TObject);
begin

  Application.Terminate;
end;

procedure Tfrm_principal.permissoes_do_menu;
var
  total_itens, item_atual: integer;
  total_c1, atualc1, totalc2, atualc2: integer;
  modulo, submodulo: string;
  nome: string;
  x: integer;
  segundos: integer;
  ts: TIBTransaction;
  q: TIBQuery;
  modelo: SmallInt;
  permite: boolean;
  ThdPermissoes: TThread;
  visivel: boolean;
begin
  ts := TIBTransaction.Create(self);
  ts.DefaultDatabase := dm.dbrestaurante;
  ts.Active := false;
  ts.Active := true;

  q := TIBQuery.Create(Self);
  q.Database := dm.dbrestaurante;
  q.Transaction := ts;
  ////dm.adicionalog('Inicia teste de permissoes do menu');

  try
    q.SQL.Clear;
    q.SQL.Add('select * from permissoes where cod_usuario=' + Quotedstr(codigo_usuario));
    q.Active := true;
    q.FetchAll;

    x := 0;
    ThdPermissoes := TThread.CreateAnonymousThread(
      procedure
      begin
        while x < frm_principal.ComponentCount - 1 do
        begin

          if frm_principal.Components[x].ClassName = 'TMenuItem' then
          begin
            visivel := false;
            modulo := Trim(copy(TMenuItem(frm_principal.Components[x]).Name, 2, 5));
            submodulo := Trim(copy(TMenuItem(frm_principal.Components[x]).Name, 7, 15));
            nome := TMenuItem(frm_principal.Components[x]).Name;

            if trim(codigo_usuario) = '001' then
              visivel := true
            else
            begin

              if ((q.Locate('cod_modulo;cod_mod', VarArrayOf([modulo, submodulo]), [loCaseInsensitive, loPartialKey])) and (copy(nome, 0, 1) <> 'N')) then
                if q.FieldByName('permite').Value = 1 then
                begin
                  visivel := true;
                end
                else
                begin
                  visivel := false;
                end
            end;
          end;
          ThdPermissoes.Synchronize(ThdPermissoes,
            procedure
            begin
              if frm_principal.Components[x].ClassName = 'TMenuItem' then
                TMenuItem(frm_principal.Components[x]).Visible := visivel;
            end);
          x := x + 1;
        end;

        q.Active := false;
        FreeAndNil(q);
        ts.Active := false;
        FreeAndNil(ts);

      end);

    ThdPermissoes.FreeOnTerminate := true;

    ThdPermissoes.Start;

  finally

  end;
end;

procedure Tfrm_principal.PngSpeedButton1Click(Sender: TObject);
begin
  inherited;
  I20001001.Click;
end;

procedure Tfrm_principal.PngSpeedButton2Click(Sender: TObject);
begin
  inherited;
  begin
    I20001003.Click;
  end;

end;

procedure Tfrm_principal.PngSpeedButton3Click(Sender: TObject);
begin
  inherited;
  I20001008.Click;
end;

procedure Tfrm_principal.PngSpeedButton4Click(Sender: TObject);
begin
  inherited;
  I10013005.Click;
end;

procedure Tfrm_principal.PngSpeedButton5Click(Sender: TObject);
begin
  inherited;

  if (ShowRealDialog(Self, tmConfirmacao, 'Confirme', 'Deseja mesmo sair do sistema ?') = teSim) then
    Application.Terminate;

end;

procedure Tfrm_principal.PngSpeedButton6Click(Sender: TObject);
begin
  inherited;
  logonUsuario;
end;

procedure Tfrm_principal.pnSalaoClick(Sender: TObject);
begin
  inherited;
  I20001004.Click;
end;

procedure Tfrm_principal.I70007006Click(Sender: TObject);
begin
  inherited;
  Application.CreateForm(TfrmRelRepasseEntregadores, frmRelRepasseEntregadores);
  frmRelRepasseEntregadores.showmodal;
  frmRelRepasseEntregadores.Free;
end;

procedure Tfrm_principal.I10008000Click(Sender: TObject);
begin
  Application.CreateForm(TfrmCadGarcons, frmCadGarcons);
  frmCadGarcons.showmodal;
  frmCadGarcons.free;
end;

function Tfrm_principal.conexao_banco: boolean;
var
  tentativaAtual: smallint;
begin
  dm.dbrestaurante.Connected := False;
  dm.dbrestaurante.IdleTimer := 1000;

  Servidor_BD := dm.LeIni(2, 'BANCO_DE_DADOS', 'servidor');
  Porta_BD := dm.LeIni(2, 'BANCO_DE_DADOS', 'porta');
  local_banco := dm.LeIni(2, 'BANCO_DE_DADOS', 'local_bd');
  usuario := dm.LeIni(2, 'BANCO_DE_DADOS', 'usuario');
  senha := dm.LeIni(2, 'BANCO_DE_DADOS', 'senha');

  dm.dbrestaurante.DatabaseName := Servidor_BD + '/' + porta_bd + ':' + local_banco;
  ////dm.adicionalog('Caminho do banco ' + local_banco);
  dm.dbrestaurante.Params.Values['user_name'] := usuario;
  dm.dbrestaurante.Params.Values['password'] := senha;

  BDConectado := false;
  dm.dbrestaurante.Connected := false;
  Application.CreateForm(TfrmPainelAguarde, frmPainelAguarde);
  frmPainelAguarde.Show;

  tentativaAtual := 1;
  while ((tentativaAtual <= 10) and (BDConectado = false)) do
  begin
    frmPainelAguarde.lbTentativas.Caption := IntToStr(tentativaAtual) + ' / 10';
    Application.ProcessMessages();
    Sleep(600);
    Application.ProcessMessages();

    try
      begin
        dm.dbrestaurante.Connected := True;
        BDConectado := true;
      end;
    except
      begin
      end;
    end;
    tentativaAtual := tentativaAtual + 1;
  end;

  frmPainelAguarde.Free;
  if BDConectado then
  begin

    dm.dbrestaurante.IdleTimer := 0;

    try
      dm.FDRestaurante.Params.Clear;
      dm.FDRestaurante.Params.Add('DriverID=' + 'FB');
      dm.FDRestaurante.Params.Add('Server=' + Servidor_BD);
      dm.FDRestaurante.Params.Add('Port=' + Porta_BD);
      dm.FDRestaurante.Params.Add('Database=' + local_banco);
      dm.FDRestaurante.Params.Add('User_Name=' + usuario);
      dm.FDRestaurante.Params.Add('Password=' + senha);
      dm.FDRestaurante.Params.Add('Protocol=TCPIP');
      dm.FDRestaurante.DriverName := 'FB';
      dm.FDRestaurante.LoginPrompt := FALSE;
      dm.FDRestaurante.UpdateOptions.CountUpdatedRecords := False;
      dm.qryEmpresas.Active := True;

    except
      showmessage('Erro ao abrir conexão com o Firedac!');
    end;

    result := true
  end
  else
  begin
    dm.exibe_painel_erro('O Sistema não conseguiu se conectar ao banco de dados.' + LineBreak + 'Se você estiver no servidor, verifique se o serviço do Firebird está ativo.' + LineBreak + 'Se estiver em uma estação, siga o passos: ' + LineBreak + ' 1º Verifique as configurações de rede e se o firewall no servidor do banco de dados está bloqueando o firebird.' + LineBreak + ' 2º Verifique os cabos de rede e faça um teste de ping para o ip do servidor.' + LineBreak + ' 3º Verifique o LOG do sistema para obter informações da tentativa de conexão.', 'Fechar o sistema');
    ////dm.adicionalog('O sistema não conseguiu se conectar ao banco.');
    result := false;
  end;
end;

procedure Tfrm_principal.I99000003Click(Sender: TObject);
begin
  inherited;
  Application.CreateForm(TfrmSincronizarBase, frmSincronizarBase);
  frmSincronizarBase.ShowModal;
  frmSincronizarBase.Free;
end;

procedure Tfrm_principal.I60004003Click(Sender: TObject);
begin
  inherited;
  Application.CreateForm(TfrmListagemTabelasPreco, frmListagemTabelasPreco);
  frmListagemTabelasPreco.ShowModal;
  frmListagemTabelasPreco.Free;
end;

procedure Tfrm_principal.ProcessarEncerramentoDoDia;
var
  ArqMov: string;
  LSQL: TStringList;
begin
  LSQL := TStringList.Create;
  try

    try
      begin
        LSQL := LSQL.Create;
        LSQL.Add('execute block as begin ');
        LSQL.Add(' update cartoes set status=3,cod_cli=null,cod_movimentacao=null where status <> 2;');
        LSQL.Add(' delete from fila_de_impressao;');
        LSQL.Add(' EXECUTE STATEMENT ' + Quotedstr('ALTER SEQUENCE G_FILA_IMPRESSAO RESTART WITH 0') + ' ; ');
        LSQL.Add(' EXECUTE STATEMENT ' + Quotedstr('ALTER SEQUENCE G_PEDIDOS_BALCAO RESTART WITH 0') + ' ; ');
        LSQL.Add(' delete from movimento_mesa where cancelado=1;');
        LSQL.Add(' delete from informacoes_mesa where mesa not in (select cod_mesa from movimento_mesa);');
        LSQL.Add(' update parametros p  SET p.data_sistema = current_date where p.cod_empresa =' + Quotedstr(codEmpresa) + ';');
        LSQL.add(' delete from extratos_emitidos et where et.mesa not in (select distinct ms.cod_mesa  from movimento_mesa ms);');
        LSQL.Add(dm.GetSQLExcluirPedidosDeIntegracaoAntigos());
        LSQL.Add('end');
        dm.executaSQL(LSQL.text);
        ShowRealDialog(frm_principal, tmSucesso, 'Sucesso!', 'Encerramentodo dia efetuado com sucesso!', 22);
      end;
    except
      on E: Exception do
      begin
        ShowRealDialog(frm_principal, tmErro, 'Ocorreu  um erro', 'Erro ao processar encerramento do dia. Verifique o arquivo de LOG mara mais informações.' + sLineBreak + sLineBreak + E.Message, 20);
        dm.adicionaLog(LSQL.Text);
      end;
    end;
  finally
    FreeAndNil(LSQL);
    dm.transacao.Active := false;
    dm.transacao.Active := true;
    busca_parametros;
  end;

end;

procedure Tfrm_principal.estes1Click(Sender: TObject);
begin
  inherited;

  Application.CreateForm(TfrmTestes, frmTestes);
  frmTestes.ShowModal;
  frmTestes.Free;

end;

procedure Tfrm_principal.I60004004Click(Sender: TObject);
begin
  inherited;
  Application.CreateForm(TfrmRelFichasTecnicas, frmRelFichasTecnicas);
  frmRelFichasTecnicas.ShowModal;
  frmRelFichasTecnicas.Free;
end;

procedure Tfrm_principal.I70008005Click(Sender: TObject);
begin
  inherited;
  Application.CreateForm(TfrmRelFaturamentoPorOperador, frmRelFaturamentoPorOperador);
  frmRelFaturamentoPorOperador.ShowModal;
  frmRelFaturamentoPorOperador.Free;
end;

procedure Tfrm_principal.I70020004Click(Sender: TObject);
begin
  inherited;
  Application.CreateForm(TfrmExportaXMLNfce, frmExportaXMLNfce);
  frmExportaXMLNfce.ShowModal;
  frmExportaXMLNfce.Free;
end;

procedure Tfrm_principal.I70020005Click(Sender: TObject);
begin
  dm_relatorios.qryRelParametrosFiscais.Active := false;
  dm_relatorios.qryRelParametrosFiscais.Active := true;
  dm.adicionaLog(dm_relatorios.qryRelParametrosFiscais.SQL.Text);
  dm_relatorios.rpt.LoadFromFile(patchAplicacao + 'relatorios\relParametrosFiscais.fr3', true);
  dm_relatorios.rpt.PrepareReport(true);
  dm_relatorios.rpt.ShowReport(true);

end;

procedure Tfrm_principal.I70003003Click(Sender: TObject);
begin
  inherited;
  Application.CreateForm(TfrmRelCancelamentosProdutos, frmRelCancelamentosProdutos);
  frmRelCancelamentosProdutos.showmodal;
  frmRelCancelamentosProdutos.free;
end;

procedure Tfrm_principal.I20001008Click(Sender: TObject);
begin
  encerrar_dia := false;

  if (StrToInt(dm.LeIni(2, 'CAIXA', 'permiteEncerrarDia')) = 0) then
  begin
    dm.exibe_painel_erro('Não é possível encerrar o dia nesta estação. Proceda com o encerramento do dia no servidor!', 'Ok');
    exit;
  end;

  if (verificaSeCaixaEstaAberto(ultimoCaixaAberto) = true) then
  begin
    showmessage('Não é possível encerrar o dia pois o caixa se encontra aberto!');
    exit;
  end
  else
  begin
    dm.qryauxiliar.Active := false;
    dm.qryauxiliar.SQL.clear;
    dm.qryauxiliar.sql.add('select * from vendas where data=' + Quotedstr(FormatDateTime('DD.MM.YY', data_do_sistema)));
    dm.qryauxiliar.active := true;
    if not dm.qryauxiliar.IsEmpty then
    begin
      if (ShowRealDialog(Self, tmConfirmacao, 'Confirme', 'Confirma encerramento do dia ?  a data atual é :' + DateToStr(data_do_sistema)) = teSim) then
      begin
        ProcessarEncerramentoDoDia;
        inicia;
      end
    end
    else
    begin
      Application.CreateForm(Tfrm_confirma_encerramento, frm_confirma_encerramento);
      frm_confirma_encerramento.ShowModal;
      frm_confirma_encerramento.Free;

      if encerrar_dia then
      begin
        ProcessarEncerramentoDoDia;
        inicia;
      end;

    end;
  end;
end;

procedure Tfrm_principal.I10013001Click(Sender: TObject);
begin
  Application.createform(Tfrm_cad_usuarios, frm_cad_usuarios);
  frm_cad_usuarios.showmodal;
  frm_cad_usuarios.free;
  permissoes_do_menu;

end;

procedure Tfrm_principal.I10013005Click(Sender: TObject);
begin
  Application.CreateForm(Tfrm_troca_senha, frm_troca_senha);
  frm_troca_senha.ShowModal;
  frm_troca_senha.free;
end;

procedure Tfrm_principal.I40002001Click(Sender: TObject);
begin

  Application.CreateForm(TfrmBaixasManuais, frmBaixasManuais);
  frmBaixasManuais.ShowModal;
  frmBaixasManuais.Free;

 {
 Application.CreateForm(TfrmControleBaixas, frmControleBaixas);
 frmControleBaixas.ShowModal;
 frmControleBaixas.Free;
 }
end;

procedure Tfrm_principal.eClick(Sender: TObject);
begin
  Application.Createform(Tfrm_formas_pagto, frm_formas_pagto);
  frm_formas_pagto.ShowModal;
  frm_formas_pagto.free;
end;

procedure Tfrm_principal.I20004001Click(Sender: TObject);
begin
  if dm.LeIni(2, 'CAIXA', 'status') = '1' then
  begin
    showmessage('Não é póssivel abrir o caixa, pois o mesmo já se encontra aberto!!');
    exit;
  end
  else
  begin
    Application.CreateForm(TfrmAberturaCaixa, frmAberturaCaixa);
    frmAberturaCaixa.ShowModal;
    FreeAndNil(frmAberturaCaixa);
  end;
end;

function Tfrm_principal.validaLoginUsuario: boolean;
begin
  Result := False;
  Application.CreateForm(TfrmLoginTouch, frmLoginTouch);
  frmLoginTouch.setTipoOperacao(tLoginInicial);
  frmLoginTouch.ShowModal;
  Result := frmLoginTouch.getStatusValidacaoSenha();
  frmLoginTouch.free;
end;

procedure Tfrm_principal.inicia;
begin
  registrarSistema := false;
  sistemaRegistrado := false;
  TrocarOperador := false;
  sairDoSistema := false;
  Application.HintColor := clYellow;
  Application.HintHidePause := 500000;
  cor_foco_edit := clMoneyGreen;


//  Image1.Picture.LoadFromFile(dm.leini(2,'parametros','logo_principal'));

  dm.dbrestaurante.Connected := false;
  if conexao_banco = false then
  begin
    Application.Terminate;
  end;

  logonUsuario;
end;

function Tfrm_principal.KillProcess(const ExeFileName: string): Boolean;
var
  ContinueLoop: BOOL;
  FSnapshotHandle: THandle;
  FProcessEntry32: TProcessEntry32;
begin
  Result := False;
  FSnapshotHandle := CreateToolhelp32Snapshot(TH32CS_SNAPPROCESS, 0);
  FProcessEntry32.dwSize := SizeOf(FProcessEntry32);
  ContinueLoop := Process32First(FSnapshotHandle, FProcessEntry32);
  while Integer(ContinueLoop) <> 0 do
  begin
    if ((UpperCase(ExtractFileName(FProcessEntry32.szExeFile)) = UpperCase(ExeFileName)) or (UpperCase(FProcessEntry32.szExeFile) = UpperCase(ExeFileName))) then
      Result := TerminateProcess(OpenProcess(PROCESS_TERMINATE, BOOL(0), FProcessEntry32.th32ProcessID), 0);
    ContinueLoop := Process32Next(FSnapshotHandle, FProcessEntry32);
  end;
  CloseHandle(FSnapshotHandle);
end;

procedure Tfrm_principal.JvAppInstances1Rejected(Sender: TObject);
begin
  inherited;
  showRealDialog(frm_principal, tmAviso, 'Erro', 'Já existe uma instância da Aplicação sendo executada!', 22, false);

  if (ShowRealDialog(frm_principal, tmConfirmacao, 'Confirme', 'Deseja encerrar todas as instâncias do sistema sendo executadas ?') = teSim) then
  begin
    KillProcess('realrest.exe');
  end;

end;

procedure Tfrm_principal.logonUsuario();
begin

  try
    if validaLoginUsuario then
    begin
      lbNomeEmpresa.Caption := razao_social;
      busca_parametros;
      lbNomeUsuario.Caption := nome_usuario;
      permissoes_do_menu;

      geraModificadorSerial();
      verificaAlteracaoRelogio.Enabled := true;
      dm.configuraBalancas();

      if (StrToInt(dm.LeIni(2, 'SALAO', 'estacaoLancamentoSalao')) = 1) then
      begin
        if (StrToInt(dm.LeIni(2, 'SALAO', 'modulo')) = 1) then
          I20001004.Click
        else
          I20001001.click;

      end;

    end
    else
      Application.terminate;
  finally

  end;

end;

procedure Tfrm_principal.testaLicencaEserial(primeira: boolean);
var
  l: string;
  HashValue: Longint;
  Code: TCode;
  resultado: string;
begin
{
  exit;
  try
    try
      if trim(modificadorDoDisco) <> '' then
      begin

        serial.CheckCode(true);
        if primeira then
        begin
          try
            licenca := dm.decriptografa(licenca, '1320');
          except
            begin
              Application.CreateForm(TfrmLicenca, frmLicenca);
              frmLicenca.showmodal;
              timerVerificaLicenca.Enabled := false;
              frmLicenca.Free;
              Application.Terminate;
            end;
          end;
        end;

        HexToBuffer(licenca, Code, SizeOf(Code));
    //desabilitei geração de licença pelo cnpj
        if GetSpecialCodeValue(cKey, Code) <> StringHashElf(cnpj + serial.Modifier) then
        begin
          Application.CreateForm(TfrmLicenca, frmLicenca);
          timerVerificaLicenca.Enabled := false;
          frmLicenca.showmodal;
          frmLicenca.Free;
          Application.Terminate;
        end
        else
        begin
          serial.CheckCode(true);
          if (testeSerialValido = false) then
          begin
            Application.CreateForm(TfrmSistemaBloqueado, frmSistemaBloqueado);
            frmSistemaBloqueado.showmodal;
            frmSistemaBloqueado.free;
            if (registrarSistema = true) then
            begin
              Application.CreateForm(TfrmRegistroSistema, frmRegistroSistema);
              frmRegistroSistema.ShowModal;
              frmRegistroSistema.Free;
              if sistemaRegistrado = false then
              begin
                dm.exibe_painel_erro('O registro do sistema foi cancelado! O Sistema será encerrado e permanecerá bloqueado', 'continuar...');
                Application.Terminate;
              end;
            end
          end
          else
          begin

            lbDataExpiracaoSerial.Caption := FormatDateTime('DD/MM/YYY', date + diasExpiracaoSistema);
            if diasExpiracaoSistema <= 6 then
            begin
              lbDataExpiracaoSerial.Font.Color := clRed;
              timePanelLicenca.Enabled := true;
            end
            else
            begin
              timePanelLicenca.Enabled := false;
            end;

            if (diasExpiracaoSistema <= 3) then
            begin
              registrarSistema := false;
              Application.CreateForm(TfrmAvisoExpiracao, frmAvisoExpiracao);
              if diasExpiracaoSistema > 0 then
              begin
                if diasExpiracaoSistema > 1 then
                  frmAvisoExpiracao.lbExpiracao.Caption := Inttostr(diasExpiracaoSistema) + ' DIAS'
                else
                begin
                  frmAvisoExpiracao.lbaviso.caption := 'Sua licença expira';
                  frmAvisoExpiracao.lbExpiracao.Caption := 'AMANHÃ';
                  frmAvisoExpiracao.lbaviso1.Visible := false;

                end;
              end
              else
              begin
                frmAvisoExpiracao.lbaviso.caption := 'Sua licença expira';
                frmAvisoExpiracao.lbExpiracao.Caption := 'HOJE';
                frmAvisoExpiracao.lbaviso1.Visible := false;
              end;
              frmAvisoExpiracao.ShowModal;
              frmAvisoExpiracao.free;
              if (registrarSistema = true) then
              begin
                Application.CreateForm(TfrmRegistroSistema, frmRegistroSistema);
                timerVerificaLicenca.Enabled := false;
                frmRegistroSistema.ShowModal;
                frmRegistroSistema.Free;
                timerVerificaLicenca.Enabled := true;
              end;
            end;
          end;
        end;
      end;
    except
      on E: Exception do
      begin
        ShowRealDialog(Self, tmErro, 'Erro', 'Erro ao verificar dados de licença!' + sLineBreak + SlineBreak + E.message);
      end;

    end;
  finally

  end;

 }
  ////dm.adicionalog('Finaliza verificação de licença');
end;

procedure Tfrm_principal.FormActivate(Sender: TObject);
begin
  if (iniciado = false) then
  begin
    inicia;
    if (usarAcbr = 1) then
    begin
      MD5_APLICATIVO := GeraMD5PAFECF();
    end;
    iniciado := true;
  end;
  ////dm.adicionalog('Inicou tudo no formulario principal');
end;

function GetStateK(Key: integer): boolean;
begin
  Result := Odd(GetKeyState(Key));
end;

procedure Tfrm_principal.I99000001c1Click(Sender: TObject);
begin
  Application.CreateForm(TfrmParametrosSistema, frmParametrosSistema);
  frmParametrosSistema.ShowModal;
  frmParametrosSistema.Free;
end;

procedure Tfrm_principal.I70003004Click(Sender: TObject);
begin
  inherited;
  Application.CreateForm(TfrmRelSangrias, frmRelSangrias);
  frmRelSangrias.ShowModal;
  frmRelSangrias.Free;
end;

procedure Tfrm_principal.BitBtn6Click(Sender: TObject);
begin
  if MessageDlg('Confirma saída do sistema ?', mtConfirmation, [MbYes, mbNo], 0) = Mryes then
    Application.Terminate;
end;

procedure Tfrm_principal.I10009000Click(Sender: TObject);
begin
  Application.CreateForm(TfrmCadTiposBaixaEstoque, frmCadTiposBaixaEstoque);
  frmCadTiposBaixaEstoque.ShowModal;
  frmCadTiposBaixaEstoque.free;
end;

function Tfrm_principal.SerialNum(FDrive: string): string;
var
  Serial: DWord;
  DirLen, Flags: DWord;
  DLabel: array[0..11] of Char;
begin
  try
    GetVolumeInformation(PChar(FDrive + ':\'), DLabel, 12, @Serial, DirLen, Flags, nil, 0);
    Result := IntToHex(Serial, 8);
  except
    Result := '';
  end;
end;

procedure Tfrm_principal.setNFE55VendaAtual(emitirNFE55: boolean);
begin
  nfe55VendaAtual := emitirNFE55;

end;

procedure Tfrm_principal.fClick(Sender: TObject);
begin
  Application.CreateForm(TfrmCadMotivosCancelamento, frmCadMotivosCancelamento);
  frmCadMotivosCancelamento.ShowModal;
  frmCadMotivosCancelamento.free;
end;

procedure Tfrm_principal.I20002013Click(Sender: TObject);
begin
  Application.createform(Tfrm_leitura_mem_fiscal_data, frm_leitura_mem_fiscal_data);
  frm_leitura_mem_fiscal_data.ShowModal;
  frm_leitura_mem_fiscal_data.free;
end;

procedure Tfrm_principal.I50002001Click(Sender: TObject);
begin
  dm.qryauxiliar.Active := false;
  dm.qryauxiliar.sql.clear;
  dm.qryauxiliar.sql.add('select * from listagem_grupos(' + Quotedstr('000') + ',1,0)');
  dm.qryauxiliar.active := true;
end;

{

procedure Tfrm_principal.Button2Click(Sender: TObject);
var
 str : string;
 ret : integer;
 TipoRegistro,Arquivo,Ano,RazaoSocial,Endereco,Numero,Complemento,Bairro,Cidade,CEP,Telefone,Fax,contato,mes : string;
 vlr_unit : double;
begin
  adoq.Active:=false;
  adoq.SQL.clear;
  adoq.SQL.add('select * from REGISTRO_60R');
  adoq.Active:=true;
  adoq.First;

  while not adoq.Eof do
  begin
    dm.qryauxiliar.Active:=false;
    dm.qryauxiliar.SQL.clear;
    dm.qryauxiliar.SQL.add(' insert into registro_60r (cod_produto,descricao,qtde,acumulado,aliquota,valor_unitario,valor_custo,estoque_liquido) values( ');
    dm.qryauxiliar.SQL.add(''+Quotedstr(FormatFloat('00000',adoq.fieldbyname('cod_produto').AsFloat)));
    dm.qryauxiliar.sql.add(','+quotedstr(adoq.fieldbyname('descricao').value));
    dm.qryauxiliar.sql.add(','+dm.TrocaVirgPPto(Floattostr(adoq.fieldbyname('qtde').value)));
    dm.qryauxiliar.sql.add(','+dm.TrocaVirgPPto(Floattostr(adoq.fieldbyname('acumulado').value)));
    dm.qryauxiliar.SQL.add(','+Quotedstr(adoq.fieldbyname('aliquota').Value));
    dm.qryauxiliar.sql.add(','+dm.TrocaVirgPPto(Floattostr(adoq.fieldbyname('acumulado').value / adoq.fieldbyname('qtde').value)));
    dm.qryauxiliar.sql.add(','+dm.TrocaVirgPPto(Floattostr( (adoq.fieldbyname('acumulado').value / adoq.fieldbyname('qtde').value) * 0.2 )));
    Randomize;
    dm.qryauxiliar.sql.add(','+dm.TrocaVirgPPto(Floattostr(randomRange(23,328)))+')');

    dm.qryauxiliar.ExecSQL;
    adoq.Next;
  end;

  adoq.Active:=false;
  adoq.SQL.Clear;
  adoq.SQL.add('select * from REGISTRO_60A');
  adoq.active:=true;
  adoq.First;

  while not adoq.Eof do
  begin
   dm.qryauxiliar.Active:=false;
   dm.qryauxiliar.SQL.clear;
   dm.qryauxiliar.sql.add('insert into REG60A (data,num_serie,aliquota,valor_acumulado) values (');
   dm.qryauxiliar.SQL.add(''+Quotedstr(FormatDateTime('DD.MM.YYY',adoq.fieldbyname('data').Value)));
   dm.qryauxiliar.SQL.add(','+Quotedstr(adoq.fieldbyname('num_serie').Value));
   dm.qryauxiliar.SQL.add(','+Quotedstr(adoq.fieldbyname('aliquota').Value));
   dm.qryauxiliar.sql.add(','+dm.TrocaVirgPPto(Floattostr(adoq.fieldbyname('valor_acumulado').AsFloat))+')');
   dm.qryauxiliar.ExecSQL;
   adoq.Next;
  end;

  adoq.Active:=false;
  adoq.SQL.Clear;
  adoq.SQL.add('select * from registro_60M');
  adoq.Active:=true;
  adoq.First;

  while not adoq.Eof do
  begin
    dm.qryauxiliar.Active:=false;
    dm.qryauxiliar.SQL.clear;
    dm.qryauxiliar.SQL.Add('insert into REG60M(data,num_serie,coo_ini,coo_fim,cont_z,co_rein_op,venda_bruta,tot_geral) values (');
    dm.qryauxiliar.SQL.add(''+Quotedstr(FormatDateTime('DD.MM.YYY',adoq.fieldbyname('data').Value)));
    dm.qryauxiliar.SQL.add(','+Quotedstr(adoq.fieldbyname('NUM_SERIE').Value));
    dm.qryauxiliar.SQL.add(','+Quotedstr(adoq.fieldbyname('COO_INI').Value));
    dm.qryauxiliar.SQL.add(','+Quotedstr(adoq.fieldbyname('COO_FIM').Value));
    dm.qryauxiliar.SQL.add(','+Quotedstr(adoq.fieldbyname('CONT_Z').Value));
    dm.qryauxiliar.SQL.add(','+Quotedstr(adoq.fieldbyname('CO_REIN_OP').Value));
    dm.qryauxiliar.sql.add(','+dm.TrocaVirgPPto(Floattostr(adoq.fieldbyname('venda_bruta').AsFloat)));
    dm.qryauxiliar.sql.add(','+dm.TrocaVirgPPto(Floattostr(adoq.fieldbyname('tot_geral').AsFloat))+')');
    dm.qryauxiliar.ExecSQL;
    adoq.next;
  end;

  showmessage(dm.dbrestaurante.DatabaseName);
  showmessage('completo');

  dm.transacao.Commit;


end;
 }

procedure Tfrm_principal.I10009001Click(Sender: TObject);
begin
  Application.CreateForm(Tfrm_cad_historico_caixa, frm_cad_historico_caixa);
  frm_cad_historico_caixa.ShowModal;
  frm_cad_historico_caixa.free;
end;

procedure Tfrm_principal.I10009002Click(Sender: TObject);
begin
  Application.CreateForm(Tfrm_cad_contas, frm_cad_contas);
  frm_cad_contas.ShowModal;
  frm_cad_contas.free;
end;

procedure Tfrm_principal.I10001000Click(Sender: TObject);
begin
  inherited;
  Application.CreateForm(TfrmCadFornecedores, frmCadFornecedores);
  frmCadFornecedores.ShowModal;
  frmCadFornecedores.free;
end;

procedure Tfrm_principal.I10002001Click(Sender: TObject);
begin
  Application.CreateForm(Tfrm_cad_clientes, frm_cad_clientes);
  frm_cad_clientes.showmodal;
  frm_cad_clientes.free;
end;

procedure Tfrm_principal.I30003000Click(Sender: TObject);
begin

  if dm.LeIni(2, 'CAIXA', 'status') = '0' then
  begin
    showmessage('O caixa ainda não foi aberto! Efetue a abertura do caixa para ter acesso a este módulo!');
    exit;
  end
  else
  begin
    application.CreateForm(tfrm_caixa_restaurante, frm_caixa_restaurante);
    frm_caixa_restaurante.ShowModal;
    frm_caixa_restaurante.free;
  end;

end;

procedure Tfrm_principal.I40006001Click(Sender: TObject);
begin
  inherited;
  Application.CreateForm(TfrmManifestacao, frmManifestacao);
  frmManifestacao.ShowModal;
  frmManifestacao.Free;

end;

procedure Tfrm_principal.I10006000Click(Sender: TObject);
begin
  Application.CreateForm(TfrmCadUnidades, frmCadUnidades);
  frmCadUnidades.showmodal;
  frmCadUnidades.free;

end;

procedure Tfrm_principal.ytytyttyClick(Sender: TObject);
begin
  Application.CreateForm(TfrmCadastroClientesReduzido, frmCadastroClientesReduzido);
  frmCadastroClientesReduzido.showmodal;
  frmCadastroClientesReduzido.free;

end;

procedure Tfrm_principal.I30002001Click(Sender: TObject);
begin
  Application.CreateForm(TfrmLiberarCliente, frmLiberarCliente);
  frmLiberarCliente.ShowModal;
  frmLiberarCliente.Free;

end;

function Tfrm_principal.DifHora(Inicio, Fim: string): string;
{Retorna a diferença entre duas horas}
var
  FIni, FFim: TDateTime;
begin
  FIni := StrTotime(Inicio);
  FFim := StrToTime(Fim);
  if (Inicio > Fim) then
  begin
    Result := TimeToStr((StrTotime('23:59:59') - FIni) + FFim)
  end
  else
  begin
    Result := TimeToStr(FFim - FIni);
  end;
end;

procedure Tfrm_principal.I80002005Click(Sender: TObject);
begin
  inherited;
  ;
end;

procedure Tfrm_principal.I20001002Click(Sender: TObject);
begin

  if (verificaSeCaixaEstaAberto(ultimoCaixaAberto) = false) then
  begin
    Application.CreateForm(TfrmAberturaCaixa, frmAberturaCaixa);
    frmAberturaCaixa.ShowModal;
    FreeAndNil(frmAberturaCaixa);

    if (verificaSeCaixaEstaAberto(ultimoCaixaAberto) = true) then
    begin
      dm.tb_parametros.Active := true;
      voltarParaCaixa := 2;
      Application.CreateForm(Tfrm_caixa_restaurante, frm_caixa_restaurante);
      frm_caixa_restaurante.ShowModal;
      frm_caixa_restaurante.Free;

    end;
  end
  else
  begin
    voltarParaCaixa := 2;
    Application.CreateForm(Tfrm_caixa_restaurante, frm_caixa_restaurante);
    frm_caixa_restaurante.ShowModal;
    frm_caixa_restaurante.Free;
  end;

end;

procedure Tfrm_principal.I10005000Click(Sender: TObject);
begin
  dm.qryProjecaoDespesasRD.Active := true;
  Application.CreateForm(Tfrm_cad_itens_estoque, frm_cad_itens_estoque);
  frm_cad_itens_estoque.ShowModal;
  frm_cad_itens_estoque.free;
end;

procedure Tfrm_principal.AdvToolButton4Click(Sender: TObject);
begin
  if dm.verificaPermissaoAcao('I20001004', true, true) = true then
  begin
    I20001004.Click;
  end;
end;

procedure Tfrm_principal.AdvToolButton13Click(Sender: TObject);
begin

  if dm.verificaPermissaoAcao('I10008000', true, true) = true then
  begin
    I10006000.Click;
  end;
end;

procedure Tfrm_principal.AdvToolButton6Click(Sender: TObject);
begin
  if dm.verificaPermissaoAcao('I30001001', true, true) = true then
  begin
//   I30001001.Click;
  end;
end;

procedure Tfrm_principal.AdvToolButton5Click(Sender: TObject);
begin
  if dm.verificaPermissaoAcao('I30002001', true, true) = true then
  begin
//   I30002001.Click;
  end;

end;

procedure Tfrm_principal.AdvToolButton7Click(Sender: TObject);
begin
  Nmenu_sair.Click;
end;

procedure Tfrm_principal.I10010000Click(Sender: TObject);
begin
  inherited;
  Application.CreateForm(TfrmCadTiposSangria, frmCadTiposSangria);
  frmCadTiposSangria.showmodal;
  frmCadTiposSangria.free;
end;

procedure Tfrm_principal.serialChangeCode(Sender: TObject; Code: TCode);
var
  s: string;
begin
  s := BufferToHex(Code, SizeOf(Code));
  dm.gravaini('BANCO_DE_DADOS', 'release_' + codEmpresa, dm.criptografa(s, '1320'));
end;

procedure Tfrm_principal.serialChecked(Sender: TObject; Status: TCodeStatus);
var
  S: string;
begin

{  case Status of
    ogValidCode    : S := 'Valid Code - Days remaining: ' + IntToStr(serial.GetValue);
    ogInvalidCode  : S := 'Invalid release code';
    ogPastEndDate  : S := 'Date has expired';
    ogDayCountUsed : S := 'Zero days of use remaining';
  else
    S := 'Unknown error';
  end;
  showmessage(s);
  }
end;

procedure Tfrm_principal.serialGetKey(Sender: TObject; var Key: TKey);
begin
  inherited;
  Key := CKey;
end;

procedure Tfrm_principal.serialGetCode(Sender: TObject; var Code: TCode);
var
  Ini: TIniFile;
  serial: string;
begin
  serial := dm.LeIni(2, 'BANCO_DE_DADOS', 'release_' + codEmpresa);
  try
    serial := dm.decriptografa(serial, '1320');
  except
    begin
      serial := '';
    end;
  end;
  HexToBuffer(serial, Code, SizeOf(Code));
//    statusbar.Panels[5].Text:='Código Atual: '+serial;
end;

procedure Tfrm_principal.serialGetModifier(Sender: TObject; var Value: Integer);
begin

  if (trim(modificadorDoDisco) <> '') then
  begin
    Value := StrToInt(modificadorDoDisco);
  end;

end;

procedure Tfrm_principal.geraModificadorSerial;
var
  diskInformation: THPI;
  serialDoDisco: string;
  letraDoDisco: string;
  disco: Char;
  myThread: TThread;
  inicio: TDateTime;
begin
  myThread := TThread.CreateAnonymousThread(
    procedure()
    begin

      inicio := now;
      letraDoDisco := copy(patchAplicacao, 0, 1);
      disco := letraDoDisco[1];
      serialDoDisco := '';
      modificadorDoDisco := IntToStr(OgMakeKeys1.GenerateStringModifier(serialNum(letraDoDisco)));

    end);
  myThread.OnTerminate := AtivaTesteDeLicenca;
  myThread.FreeOnTerminate := true;
  myThread.start();
end;

procedure Tfrm_principal.AtivaTesteDeLicenca(Sender: TObject);
begin
  testaLicencaEserial(true);
  timerVerificaLicenca.Enabled := true;
end;

procedure Tfrm_principal.timerVerificaLicencaTimer(Sender: TObject);
begin
  inherited;
  testaLicencaEserial(false);
end;

procedure Tfrm_principal.I10012000Click(Sender: TObject);
begin
  inherited;
  Application.CreateForm(TfrmCadObsPreparo, frmCadObsPreparo);
  frmCadObsPreparo.showmodal;
  frmCadObsPreparo.free;
end;

procedure Tfrm_principal.I20001003Click(Sender: TObject);
begin
  inherited;
  if (verificaSeCaixaEstaAberto(ultimoCaixaAberto) = false) then
  begin
    Application.CreateForm(TfrmAberturaCaixa, frmAberturaCaixa);
    frmAberturaCaixa.ShowModal;
    FreeAndNil(frmAberturaCaixa);
    tipo_cupom := 1;

    if (verificaSeCaixaEstaAberto(ultimoCaixaAberto) = true) then
    begin
      Application.createForm(TfrmExpedicaoDelivery, frmExpedicaoDelivery);
      frmExpedicaoDelivery.showmodal();
      frmExpedicaoDelivery.free;
    end;
  end
  else
  begin
    Application.createForm(TfrmExpedicaoDelivery, frmExpedicaoDelivery);
    frmExpedicaoDelivery.showmodal();
    frmExpedicaoDelivery.free;
    frmPrincipalDelivery.free;
  end;

end;

procedure Tfrm_principal.I60003001Click(Sender: TObject);
begin
  inherited;
  dm.transacao.Active := false;
  dm.transacao.Active := true;
  dRelatorios.qryParametros.Active := true;
  dRelatorios.qryProdutos.Active := false;
  dRelatorios.qryProdutos.SQL.clear;
  dRelatorios.qryProdutos.SQL.clear;
  dRelatorios.qryProdutos.sql.add('select vp.*, al.percentagem,al.descricao as desc_aliquota,mp.descricao as miniprinter from v_produtos vp');
  dRelatorios.qryProdutos.sql.add(' inner join aliquotas al on (al.cod_aliquota = vp.cod_aliquota)');
  dRelatorios.qryProdutos.sql.add('inner join miniprinters mp on (mp.cod_miniprinter  = vp.cod_mini_printer)');
  dRelatorios.qryProdutos.sql.add(' order by cod_g_raiz,cod_g_pai,cod_grupo');
  dRelatorios.rpt.LoadFromFile(patchAplicacao + 'relatorios\ListagemGrupos.fr3', true);
  dRelatorios.qryProdutos.Active := true;
  dRelatorios.rpt.ShowReport(true);
  dRelatorios.qryProdutos.Active := false;

end;

procedure Tfrm_principal.I60006001Click(Sender: TObject);
begin
  inherited;
  dm.transacao.Active := false;
  dm.transacao.Active := true;
  dRelatorios.qryParametros.Active := true;
  dRelatorios.qryUnidades.Active := false;
  dRelatorios.qryUnidades.SQL.clear;
  dRelatorios.qryUnidades.SQL.clear;
  dRelatorios.qryUnidades.sql.add('select * from unidades order by cod_unidade');
  dRelatorios.rpt.LoadFromFile(patchAplicacao + 'relatorios\ListagemUnidades.fr3', true);
  dRelatorios.qryUnidades.Active := true;
  dRelatorios.rpt.ShowReport(true);
  dRelatorios.qryUnidades.Active := false;
  dm.transacao.Active := true;
end;

procedure Tfrm_principal.I60007001Click(Sender: TObject);
begin
  inherited;
  dm.transacao.Active := false;
  dm.transacao.Active := true;
  dRelatorios.qryParametros.Active := true;
  dRelatorios.qryGarcons.Active := false;
  dRelatorios.qryGarcons.SQL.clear;
  dRelatorios.qryGarcons.SQL.clear;
  dRelatorios.qryGarcons.sql.add('select * from garcons order by cod_garcon');
  dRelatorios.rpt.LoadFromFile(patchAplicacao + 'relatorios\ListagemGarcons.fr3', true);
  dRelatorios.qryGarcons.Active := true;
  dRelatorios.rpt.ShowReport(true);
  dRelatorios.qryGarcons.Active := false;

end;

procedure Tfrm_principal.I60008001Click(Sender: TObject);
begin
  inherited;
  dm.transacao.Active := false;
  dm.transacao.Active := true;
  dRelatorios.qryParametros.Active := true;
  dRelatorios.qryTiposBaixa.Active := false;
  dRelatorios.qryTiposBaixa.SQL.clear;
  dRelatorios.qryTiposBaixa.SQL.clear;
  dRelatorios.qryTiposBaixa.sql.add('select * from tipos_baixa order by cod_tipo');
  dRelatorios.rpt.LoadFromFile(patchAplicacao + 'relatorios\ListagemTipoBaixas.fr3', true);
  dRelatorios.qryTiposBaixa.Active := true;
  dRelatorios.rpt.ShowReport(true);
  dRelatorios.qryTiposBaixa.Active := false;

end;

procedure Tfrm_principal.I60009001Click(Sender: TObject);
begin
  inherited;
  dm.transacao.Active := false;
  dm.transacao.Active := true;
  dRelatorios.qryTiposSangria.Active := false;
  dRelatorios.qryTiposSangria.SQL.clear;
  dRelatorios.qryTiposSangria.SQL.clear;
  dRelatorios.qryTiposSangria.sql.add('select * from tipos_sangria order by codigo');

  dRelatorios.rpt.LoadFromFile(patchAplicacao + 'relatorios\ListagemTiposSangria.fr3', true);
  dRelatorios.qryTiposSangria.Active := true;
  dRelatorios.rpt.ShowReport(true);
  dRelatorios.qryTiposSangria.Active := false;

end;

procedure Tfrm_principal.I60010001Click(Sender: TObject);
begin
  inherited;
  dm.transacao.Active := false;
  dm.transacao.Active := true;
  dRelatorios.qryMotivosEstorno.Active := false;
  dRelatorios.qryMotivosEstorno.SQL.clear;
  dRelatorios.qryMotivosEstorno.SQL.clear;
  dRelatorios.qryMotivosEstorno.sql.add('select * from motivos_estornos order by codigo');
  dRelatorios.rpt.LoadFromFile(patchAplicacao + 'relatorios\ListagemMotivosEstornos.fr3', true);
  dRelatorios.qryMotivosEstorno.Active := true;
  dRelatorios.rpt.ShowReport(true);
  dRelatorios.qryMotivosEstorno.Active := false;

end;

procedure Tfrm_principal.I60011001Click(Sender: TObject);
begin
  inherited;
  dm.transacao.Active := false;
  dm.transacao.Active := true;
  dRelatorios.qryObsPreparo.Active := false;
  dRelatorios.qryObsPreparo.SQL.clear;
  dRelatorios.qryObsPreparo.SQL.clear;
  dRelatorios.qryObsPreparo.sql.add('select * from observacoes_padrao order by descricao');
  dRelatorios.rpt.LoadFromFile(patchAplicacao + 'relatorios\ListagemObsPreparo.fr3', true);
  dRelatorios.qryObsPreparo.Active := true;
  dRelatorios.rpt.ShowReport(true);
  dRelatorios.qryObsPreparo.Active := false;

end;

procedure Tfrm_principal.I60001001Click(Sender: TObject);
begin
  inherited;
  Application.CreateForm(TfrmListagemFornecedores, frmListagemFornecedores);
  frmListagemFornecedores.showmodal;
  frmListagemFornecedores.Free;
end;

procedure Tfrm_principal.I60001002Click(Sender: TObject);
begin
  inherited;
  dm.transacao.Active := false;
  dm.transacao.Active := true;
  dRelatorios.qryParametros.Active := true;
  dRelatorios.qryGruposFornecedor.Active := false;
  dRelatorios.qryGruposFornecedor.SQL.clear;
  dRelatorios.qryGruposFornecedor.SQL.clear;
  dRelatorios.qryGruposFornecedor.sql.add('select * from grupo_fornecedor order by codigo');
  dRelatorios.rpt.LoadFromFile(patchAplicacao + 'relatorios\ListagemGruposFornecedor.fr3', true);
  dRelatorios.qryGruposFornecedor.Active := true;
  dRelatorios.rpt.ShowReport(true);
  dRelatorios.qryGruposFornecedor.Active := false;

end;

procedure Tfrm_principal.I60002001Click(Sender: TObject);
begin
  inherited;
  Application.CreateForm(TfrmRelAniversariantes, frmRelAniversariantes);
  frmRelAniversariantes.showmodal;
  frmRelAniversariantes.free;

end;

procedure Tfrm_principal.I70002030Click(Sender: TObject);
begin
  inherited;
  Application.CreateForm(TfrmRelatorioEstoqueConferencia, frmRelatorioEstoqueConferencia);
  frmRelatorioEstoqueConferencia.showmodal;
  frmRelatorioEstoqueConferencia.free;
end;

procedure Tfrm_principal.I70002001Click(Sender: TObject);
begin
  inherited;
  Application.CreateForm(TfrmRelEntradasPorFornecedor, frmRelEntradasPorFornecedor);
  frmRelEntradasPorFornecedor.ShowModal;
  frmRelEntradasPorFornecedor.free;
end;

procedure Tfrm_principal.I70002002Click(Sender: TObject);
begin
  inherited;
  Application.CreateForm(TfrmRelEntradasPorGrupo, frmRelEntradasPorGrupo);
  frmRelEntradasPorGrupo.showmodal;
  frmRelEntradasPorGrupo.free;

end;

procedure Tfrm_principal.I70002003Click(Sender: TObject);
begin
  inherited;
  Application.CreateForm(TfrmRelEntradasPorItem, frmRelEntradasPorItem);
  frmRelEntradasPorItem.showmodal;
  frmRelEntradasPorItem.free;

end;

procedure Tfrm_principal.FormCreate(Sender: TObject);
var
  FileName: pchar;
  HMutex: THandle;
begin
  inherited;
  cxSetResourceString(@scxGridGroupByBoxCaption, 'Arraste o título da coluna que deseja agrupar para esta caixa');
  cxSetResourceString(@scxGridNoDataInfoText, 'Sem dados para exibir!');
  cxSetResourceString(@scxGridFilterIsEmpty, '<A condição do filtro está vazia>');
  cxSetResourceString(@cxSDatePopupToday, 'Hoje');
  cxSetResourceString(@cxSDatePopupClear, 'Limpar');
  cxSetResourceString(@cxSDatePopupNow, 'Agora');
  cxSetResourceString(@cxSDatePopupOK, 'OK');
  cxSetResourceString(@cxSDateError, 'Data incorreta!');

  dxResourceStringsRepository.NotifyListeners;

  modificadorDoDisco := '';
  nfe55VendaAtual := false;

  patchAplicacao := ExtractFilePath(Application.ExeName);
  iniciado := false;
  Application.OnShowHint := MyShowHint;
//  showmessage(patchAplicacao);
  imgFundo.picture.LoadFromFile(patchAplicacao + 'imagens\fundo.png');
  {

  FileName := PChar(patchAplicacao + 'realrest.exe');

  HMutex := CreateMutex(nil, False, pCHAR('REAL MANAGER'));
  if WaitForSingleObject(HMutex, 0) = wait_TimeOut then
  begin
//    Application.MessageBox('O Sistema já está sendo executado!', 'Houve um Erro!', mb_Ok);
    Application.Terminate;
    exit;
  end;
   }
end;

procedure Tfrm_principal.I70004001Click(Sender: TObject);
begin

  Application.CreateForm(TfrmRelProdutosPeriodo, frmRelProdutosPeriodo);
  frmRelProdutosPeriodo.ShowModal;
  frmRelProdutosPeriodo.free;
end;

procedure Tfrm_principal.I70005001Click(Sender: TObject);
begin
  inherited;
  Application.CreateForm(TfrmConsumoClientesNaCasa, frmConsumoClientesNaCasa);
  frmConsumoClientesNaCasa.showmodal;
  frmConsumoClientesNaCasa.free;
end;

procedure Tfrm_principal.I70003001Click(Sender: TObject);
begin
  inherited;
  Application.CreateForm(TfrmRelatorioCaixa, frmRelatorioCaixa);
  frmRelatorioCaixa.showmodal;
  frmRelatorioCaixa.free;

end;

procedure Tfrm_principal.verificaTentativaDeBurlarSistema();
var
  qryVerificaALteracaoRelogio: TIBQuery;
begin
  inherited;

  dm.transacaoAuxiliar.Active := false;
  dm.transacaoAuxiliar.Active := true;
  qryVerificaALteracaoRelogio := TIBquery.create(frm_principal);
  qryVerificaALteracaoRelogio.database := dm.dbrestaurante;
  qryVerificaALteracaoRelogio.transaction := dm.transacaoAuxiliar;
  qryVerificaALteracaoRelogio.Active := False;

  qryVerificaALteracaoRelogio.Active := false;
  qryVerificaALteracaoRelogio.sql.clear;
  qryVerificaALteracaoRelogio.SQL.add('select ultimahora,current_timestamp as hora_atual from parametros');
  qryVerificaALteracaoRelogio.Active := true;

  if (qryVerificaALteracaoRelogio.FieldByName('ultimahora').Value > qryVerificaALteracaoRelogio.FieldByName('hora_atual').Value) then
  begin
      // Houve tentativa de burlar o serial.

{    if Serial.GetValue = 1 then
    begin
      verificaAlteracaoRelogio.Enabled := false;
      dm.gravaini('BANCO_DE_DADOS', 'RELEASE_' + codEmpresa, '');
      testaLicencaEserial(false);

    end;
 }
  end
  else
  begin
    qryVerificaALteracaoRelogio.Active := false;
    qryVerificaALteracaoRelogio.SQL.Clear;
    qryVerificaALteracaoRelogio.SQL.Add('update parametros set ultimahora=current_timestamp');
    qryVerificaALteracaoRelogio.ExecSQL;
    if dm.transacaoAuxiliar.Active = false then
      dm.transacaoAuxiliar.Active := true;
    dm.transacaoAuxiliar.Commit;
    verificaAlteracaoRelogio.Enabled := true;
  end;

  qryVerificaALteracaoRelogio.Active := false;
  FreeAndNil(qryVerificaALteracaoRelogio);
end;

procedure Tfrm_principal.verificaAlteracaoRelogioTimer(Sender: TObject);
begin
  inherited;
//  verificaTentativaDeBurlarSistema();

end;

procedure Tfrm_principal.I70006001Click(Sender: TObject);
begin
  inherited;
  Application.CreateForm(TfrmRelProducaoGarcons, frmRelProducaoGarcons);
  frmRelProducaoGarcons.ShowModal;
  frmRelProducaoGarcons.free;

end;

procedure Tfrm_principal.I70007001Click(Sender: TObject);
begin
  inherited;
  Application.CreateForm(TfrmRelPedidosDeliveryPorCliente, frmRelPedidosDeliveryPorCliente);
  frmRelPedidosDeliveryPorCliente.showmodal;
  frmRelPedidosDeliveryPorCliente.free;

end;

procedure Tfrm_principal.I70007002Click(Sender: TObject);
begin
  inherited;
  Application.CreateForm(TfrmRelContatoEstrategicoDelivery, frmRelContatoEstrategicoDelivery);
  frmRelContatoEstrategicoDelivery.showmodal;
  frmRelContatoEstrategicoDelivery.free;
end;

procedure Tfrm_principal.I70008001Click(Sender: TObject);
begin
  inherited;
  Application.CreateForm(TfrmRelatorioFaturamentoDiarioPeriodoAnalitico, frmRelatorioFaturamentoDiarioPeriodoAnalitico);
  frmRelatorioFaturamentoDiarioPeriodoAnalitico.ShowModal;
  frmRelatorioFaturamentoDiarioPeriodoAnalitico.Free;
end;

procedure Tfrm_principal.MyShowHint(var HintStr: string; var CanShow: Boolean; var HintInfo: THintInfo);
var
  i: integer;
begin
  for i := 0 to Application.ComponentCount - 1 do
    if Application.Components[i] is THintWindow then
      with THintWindow(Application.Components[i]).Canvas do
      begin
//Font.Name := ''''''''Arial'''''''';
        Font.Size := 16;
        Font.Style := [fsBold];
        HintInfo.HintColor := clYellow;

      end;
end;

procedure Tfrm_principal.I10014000Click(Sender: TObject);
begin
  inherited;
  Application.CreateForm(TfrmCadEntregadores, frmCadEntregadores);
  frmCadEntregadores.showmodal;
  frmCadEntregadores.free;

end;

procedure Tfrm_principal.I70007003Click(Sender: TObject);
begin
  inherited;
  Application.CreateForm(TfrmRelPedidosEntregador, frmRelPedidosEntregador);
  frmRelPedidosEntregador.ShowModal;
  frmRelPedidosEntregador.Free;
end;

procedure Tfrm_principal.I10015000Click(Sender: TObject);
begin
  inherited;
  Application.CreateForm(TfrmControleCartoes, frmControleCartoes);
  frmControleCartoes.ShowModal;
  frmControleCartoes.free;
end;

procedure Tfrm_principal.I40005001Click(Sender: TObject);
begin
  inherited;
  Application.CreateForm(TfrmProducaoSubProdutos, frmProducaoSubProdutos);
  frmProducaoSubProdutos.ShowModal;
  frmProducaoSubProdutos.free;
end;

procedure Tfrm_principal.I70005002Click(Sender: TObject);
begin
  inherited;
  Application.CreateForm(TfrmRelatorioclientesData, frmRelatorioclientesData);
  frmRelatorioclientesData.ShowModal;
  frmRelatorioclientesData.Free;
end;

procedure Tfrm_principal.I70002005Click(Sender: TObject);
begin
  inherited;
  Application.CreateForm(TfrmRelComprasRefCruzada, frmRelComprasRefCruzada);
  frmRelComprasRefCruzada.ShowModal;
  frmRelComprasRefCruzada.Free;
end;

procedure Tfrm_principal.I70002010Click(Sender: TObject);
begin
  inherited;
  Application.CreateForm(TfrmRelatorioBaixasManuais, frmRelatorioBaixasManuais);
  frmRelatorioBaixasManuais.ShowModal;
  frmRelatorioBaixasManuais.Free;

end;

procedure Tfrm_principal.I70002031Click(Sender: TObject);
begin
  inherited;
  Application.CreateForm(TfrmRelatorioEstoqueReposicao, frmRelatorioEstoqueReposicao);
  frmRelatorioEstoqueReposicao.showmodal;
  frmRelatorioEstoqueReposicao.Free;
end;

procedure Tfrm_principal.I70005003Click(Sender: TObject);
begin
  inherited;
  Application.CreateForm(TfrmRelAniversariantes, frmRelAniversariantes);
  frmRelAniversariantes.showmodal;
  frmRelAniversariantes.free;

end;

procedure Tfrm_principal.I10016001Click(Sender: TObject);
begin
  inherited;
  Application.CreateForm(TfrmCadSaboresPizza, frmCadSaboresPizza);
  frmCadSaboresPizza.showmodal;
  frmCadSaboresPizza.Free;
end;

procedure Tfrm_principal.I10016002Click(Sender: TObject);
begin
  inherited;
  Application.CreateForm(TfrmReajusteSaboresPizza, frmReajusteSaboresPizza);
  frmReajusteSaboresPizza.ShowModal;
  frmReajusteSaboresPizza.Free;
end;

procedure Tfrm_principal.I60004001Click(Sender: TObject);
begin
  inherited;
  Application.CreateForm(TfrmListagemProdutos, frmListagemProdutos);
  frmListagemProdutos.ShowModal;
  frmListagemProdutos.free;

end;

procedure Tfrm_principal.I60004002Click(Sender: TObject);
begin
  inherited;
  Application.CreateForm(TfrmListagemItensEstoque, frmListagemItensEstoque);
  frmListagemItensEstoque.showmodal;
  frmListagemItensEstoque.free;
end;

procedure Tfrm_principal.I20001015Click(Sender: TObject);
begin
  inherited;
  Application.CreateForm(TfrmGerenciamentoVendasCaixa, frmGerenciamentoVendasCaixa);
  frmGerenciamentoVendasCaixa.Showmodal;
  frmGerenciamentoVendasCaixa.Free;
end;

function Tfrm_principal.GeraMD5PAFECF: string;
var
  Arquivo: TextFile;
  NomeArq, ArqTexto, aMD5: string;
  F: TSearchRec;
  Ret: Integer;
  formato: string;
  stringArquivo: string;
begin

  formato := '############################################################************************************************************************************************************************';
  Result := '';
  try
    // Apaga arquivo anterior
    ArqTexto := ExtractFilePath(Application.ExeName) + 'ArqMD5.txt';

    if FileExists(ArqTexto) then
      DeleteFile(ArqTexto);

    // cria o arquivo TXT na mesma pasta do sistema

    AssignFile(Arquivo, ArqTexto);
    ReWrite(Arquivo);

    // lista todos os arquivo exe da pasta do aplicativo e gera o MF5

    Ret := FindFirst(ExtractFilePath(Application.ExeName) + '\*.exe', faAnyFile, F);
    try
      while Ret = 0 do
      begin
        if F.Attr and faDirectory <> faDirectory then
        begin
          NomeArq := ExtractFilePath(Application.ExeName) + '\' + F.Name;
          NomeArq := ExtractFilePath(Application.ExeName) + '\' + F.Name;
          aMD5 := dm.EAD.CalcularHashArquivo(NomeArq, dgstMD5);
          stringArquivo := formato;
          stringArquivo := dm.organizarCupom(stringArquivo, F.Name, '#');
          stringArquivo := dm.organizarCupom(stringArquivo, aMD5, '*');
          WriteLn(Arquivo, stringArquivo);
        end;
        Ret := FindNext(F);
      end;

    finally
      FindClose(F);
    end;

    Ret := FindFirst(ExtractFilePath(Application.ExeName) + '\*.dll', faAnyFile, F);
    try
      while Ret = 0 do
      begin
        if F.Attr and faDirectory <> faDirectory then
        begin
          NomeArq := ExtractFilePath(Application.ExeName) + '\' + F.Name;
          aMD5 := dm.EAD.CalcularHashArquivo(NomeArq, dgstMD5);
          stringArquivo := formato;
          stringArquivo := dm.organizarCupom(stringArquivo, F.Name, '#');
          stringArquivo := dm.organizarCupom(stringArquivo, aMD5, '*');
          WriteLn(Arquivo, stringArquivo);
        end;
        Ret := FindNext(F);
      end;

    finally
      FindClose(F);
    end;

    Closefile(Arquivo);
    // gera MD5 do arquivo texto

  finally
    result := dm.EAD.CalcularHashArquivo(ArqTexto, dgstMD5);
  end;

end;

function Tfrm_principal.getNFE55VendaAtual(): boolean;
begin
  Result := nfe55VendaAtual;

end;

procedure Tfrm_principal.AACGetChave(var Chave: string);
begin
  inherited;
  Chave := '1234';
end;

procedure Tfrm_principal.I10017000Click(Sender: TObject);
begin
  inherited;
  Application.CreateForm(TfrmCadCidade, frmCadCidade);
  frmCadCidade.showmodal;
  frmCadCidade.free;
end;

procedure Tfrm_principal.I70020002Click(Sender: TObject);
begin
  inherited;
  Application.CreateForm(TfrmGerarSpedFiscal, frmGerarSpedFiscal);
  frmGerarSpedFiscal.ShowModal;
  frmGerarSpedFiscal.Free;
end;

procedure Tfrm_principal.I10018001Click(Sender: TObject);
begin
  inherited;
  Application.CreateForm(Tfrm_cad_contas, frm_cad_contas);
  frm_cad_contas.ShowModal;
  frm_cad_contas.Free;
end;

procedure Tfrm_principal.I50000002Click(Sender: TObject);
begin
  inherited;
  Application.CreateForm(Tfrm_saidas, frm_Saidas);
  frm_Saidas.ShowModal;
  frm_Saidas.free;
end;

procedure Tfrm_principal.I70009002Click(Sender: TObject);
begin
  inherited;
  Application.CreateForm(TfrmRelSaidasPorFornecedor, frmRelSaidasPorFornecedor);
  frmRelSaidasPorFornecedor.ShowModal;
  frmRelSaidasPorFornecedor.Free;
end;

procedure Tfrm_principal.I70011001Click(Sender: TObject);
begin
  inherited;
  Application.CreateForm(TfrmRelFaturasAbertasPorFaturamento, frmRelFaturasAbertasPorFaturamento);
  frmRelFaturasAbertasPorFaturamento.showmodal;
  frmRelFaturasAbertasPorFaturamento.free;
end;

procedure Tfrm_principal.I70011002Click(Sender: TObject);
begin
  inherited;
  Application.CreateForm(TfrmRelFaturasAbertasPorVencimento, frmRelFaturasAbertasPorVencimento);
  frmRelFaturasAbertasPorVencimento.showmodal;
  frmRelFaturasAbertasPorVencimento.free;
end;

procedure Tfrm_principal.I70011003Click(Sender: TObject);
begin
  inherited;
  Application.CreateForm(TfrmRelFaturasAbertasDetalhada, frmRelFaturasAbertasDetalhada);
  frmRelFaturasAbertasDetalhada.showmodal;
  frmRelFaturasAbertasDetalhada.free;
end;

procedure Tfrm_principal.I70006002Click(Sender: TObject);
begin
  inherited;
  Application.CreateForm(TfrmRelProducaoGarconsSintetico, frmRelProducaoGarconsSintetico);
  frmRelProducaoGarconsSintetico.ShowModal;
  frmRelProducaoGarconsSintetico.Free;

end;

procedure Tfrm_principal.I70006003Click(Sender: TObject);
begin
  inherited;
  Application.CreateForm(TfrmRelTaxaServico, frmRelTaxaServico);
  frmRelTaxaServico.ShowModal;
  frmRelTaxaServico.Free;
end;

procedure Tfrm_principal.I60012001Click(Sender: TObject);
begin
  inherited;
  dm.transacao.Active := false;
  dm.transacao.Active := true;
  dm_relatorios.qryPlanoContas.Active := false;
  dm_relatorios.qryPlanoContas.sql.clear;

  dm_relatorios.qryPlanoContas.sql.add(' select rp.cod_conta,rp.cod_formatado,rp.descricao, p_pai.cod_conta as contaPai,p_pai.cod_formatado as codPaiFormatado,p_pai.descricao as descricaoPai,p_raiz.cod_conta as contaRaiz, ');
  dm_relatorios.qryPlanoContas.sql.add('        p_raiz.cod_formatado codRaizFormatado, p_raiz.descricao as descricaoRaiz   from r_plano_contas rp');
  dm_relatorios.qryPlanoContas.sql.add('   inner join     r_plano_contas  p_raiz on (p_raiz.cod_conta = rp.cod_conta_raiz)');
  dm_relatorios.qryPlanoContas.sql.add('  left join       r_plano_contas  p_pai on (p_pai.cod_conta = rp.cod_conta_pai)');
  dm_relatorios.qryPlanoContas.sql.add('   where udf_len(rp.cod_conta) = 6');
  dm_relatorios.qryPlanoContas.sql.add(' order by rp.cod_conta');
  dm_relatorios.qryPlanoContas.Active := true;
  dm_Relatorios.rpt.LoadFromFile(patchAplicacao + 'relatorios\ListagemPlanoContasFinanceiro.fr3', true);
  dm_relatorios.rpt.ShowReport(true);
  dm_relatorios.qryPlanoContas.Active := false;

end;

procedure Tfrm_principal.timePanelLicencaTimer(Sender: TObject);
begin

  inherited;
  if lbDataExpiracaoSerial.Font.Color = clWhite then
  begin
    pnLicenca.Color := clYellow;
    lbDataExpiracaoSerial.Font.Color := clBlack;
  end
  else
  begin
    pnLicenca.Color := clRed;
    lbDataExpiracaoSerial.Font.Color := clWhite;
  end;

  timePanelLicenca.Enabled := false;
  timePanelLicenca.Enabled := true;
end;

procedure Tfrm_principal.I70012001Click(Sender: TObject);
begin
  inherited;
  dm.transacao.Active := false;
  dm.transacao.Active := true;
  dm_relatorios.qryConsumoAtualMesas.Active := false;
  dm_relatorios.qryConsumoAtualMesas.SQL.Clear;
  dm_relatorios.qryConsumoAtualMesas.sql.add(' select * from consumo_atual_mesas order by mesa ');
  dm_relatorios.qryConsumoAtualMesas.Active := true;
  dm_relatorios.rpt.LoadFromFile(patchAplicacao + 'relatorios\RelConsumoAtualMesas.fr3', true);
  dm_relatorios.setPeriodoRelatorio('Data: ' + FormatDateTime('DD/MM/YYY', data_do_sistema));
  dm_relatorios.rpt.ShowReport(true);
  dm_relatorios.qryConsumoAtualMesas.Active := false;

end;

procedure Tfrm_principal.ecfMsgPoucoPapel(Sender: TObject);
begin
  inherited;

  if ChecaForm(frm_encerramento) then
  begin
    frm_encerramento.exibirMensagemInformacao('POUCO PAPEL', 4000, 18, false);
  end
  else
  begin
    exibe_painel_erro('Pouco papel na impressora fiscal...', 'Continuar');

  end;

end;

procedure Tfrm_principal.I10019000Click(Sender: TObject);
begin
  inherited;
  Application.CreateForm(TfrmCadGruposTouch, frmCadGruposTouch);
  frmCadGruposTouch.showmodal;
  frmCadGruposTouch.Free;
end;

procedure Tfrm_principal.I70004002Click(Sender: TObject);
begin
  inherited;
  Application.CreateForm(TfrmRelRankingProdutos, frmRelRankingProdutos);
  frmRelRankingProdutos.ShowModal;
  frmRelRankingProdutos.Free;
end;

procedure Tfrm_principal.I70013001Click(Sender: TObject);
begin
  inherited;
  Application.CreateForm(TfrmRelEstatisticoPeriodo, frmRelEstatisticoPeriodo);
  frmRelEstatisticoPeriodo.showmodal;
  frmRelEstatisticoPeriodo.free;
end;

procedure Tfrm_principal.eadGetChavePrivada(var Chave: string);
begin
  inherited;
  Chave := memoChavePrivada.Lines.Text;
end;

procedure Tfrm_principal.eadGetChavePublica(var Chave: string);
begin
  inherited;
  Chave := memoChavePublica.Lines.Text;
end;

procedure Tfrm_principal.I70003002Click(Sender: TObject);
begin
  inherited;
  Application.CreateForm(TfrmRelResCaixaTurno, frmRelResCaixaTurno);
  frmRelResCaixaTurno.showmodal;
  frmRelResCaixaTurno.free;
end;

procedure Tfrm_principal.I40007001Click(Sender: TObject);
begin
  inherited;
  Application.CreateForm(TfrmEntradasAvulsas, frmEntradasAvulsas);
  frmEntradasAvulsas.showmodal;
  frmEntradasAvulsas.Free;
end;

procedure Tfrm_principal.I99000002Click(Sender: TObject);
begin
  inherited;

  Application.CreateForm(TfrmConfigIntegracoes, frmConfigIntegracoes);
  frmConfigIntegracoes.ShowModal;
  frmConfigIntegracoes.free;

end;

procedure Tfrm_principal.I70004005Click(Sender: TObject);
begin
  inherited;
  Application.CreateForm(TfrmRelCurvaABCProdutosVendidos, frmRelCurvaABCProdutosVendidos);
  frmRelCurvaABCProdutosVendidos.ShowModal;
  frmRelCurvaABCProdutosVendidos.Free;
end;

procedure Tfrm_principal.C1Click(Sender: TObject);
begin
  inherited;
  Application.CreateForm(TfrmRelFaturamentoComparativoMensal, frmRelFaturamentoComparativoMensal);
  frmRelFaturamentoComparativoMensal.ShowModal;
  frmRelFaturamentoComparativoMensal.Free;
end;

procedure Tfrm_principal.C2Click(Sender: TObject);
begin
  inherited;
  Application.createform(TfrmConfiguracaoReplicacao, frmConfiguracaoReplicacao);
  frmConfiguracaoReplicacao.showmodal;
  frmConfiguracaoReplicacao.free;
end;

function Tfrm_principal.ChecaForm(aForm: Tform): Boolean;
var
  I: Integer;
begin
  ChecaForm := false;
  for I := 0 to Screen.FormCount - 1 do
    if Screen.Forms[I] = aForm then
    begin
      ChecaForm := true;
      Break;
    end;
end;

procedure Tfrm_principal.I70020003Click(Sender: TObject);
begin
  inherited;
  Application.CreateForm(TfrmRealApuracaoGrupos, frmRealApuracaoGrupos);
  frmRealApuracaoGrupos.showmodal;
  frmRealApuracaoGrupos.free;
end;

procedure Tfrm_principal.I10004001Click(Sender: TObject);
begin
  inherited;
  Application.CreateForm(Tfrm_produtos, frm_produtos);
  frm_produtos.ShowModal;
  frm_produtos.free;
end;

procedure Tfrm_principal.I10004004Click(Sender: TObject);
begin
  inherited;
  Application.CreateForm(TfrmDisponibilidadeVenda, frmDisponibilidadeVenda);
  frmDisponibilidadeVenda.ShowModal;
  frmDisponibilidadeVenda.Free;

end;

procedure Tfrm_principal.I10004005Click(Sender: TObject);
begin
  inherited;
  Application.CreateForm(TfrmGerarArquivoCargaBalanca, frmGerarArquivoCargaBalanca);
  frmGerarArquivoCargaBalanca.ShowModal;
  frmGerarArquivoCargaBalanca.Free;
end;

function Tfrm_principal.validaDataDoSistema(): boolean;
var
  estado: string;
  DataEcf: Tdate;
begin

  DataEcf := Date;
  if DataEcf <> data_do_sistema then
  begin
    exibe_painel_erro('DATA DO COMPUTADOR  DIVERGE DA DATA DO SISTEMA.  NÃO É POSSÍVEL ABRIR O CAIXA. VERIFIQUE A DATA DO SISTEMA E TENTE NOVAMENTE!', 'OK');
    result := false;
    exit;
  end;

  result := true;
end;

procedure Tfrm_principal.I80002004Click(Sender: TObject);
begin
  inherited;
//  Application.CreateForm(TfrmProjecaoDespesasRD, frmProjecaoDespesasRD);
//  frmProjecaoDespesasRD.ShowModal;
//  frmProjecaoDespesasRD.Free;  [

  Application.CreateForm(TFrmDRE, FrmDRE);
  FrmDRE.ShowModal;
  FrmDRE.Free;

end;

procedure Tfrm_principal.I80002002Click(Sender: TObject);
begin
  inherited;
  Application.CreateForm(TfrmRelLancamentosRD, frmRelLancamentosRD);
  frmRelLancamentosRD.showmodal;
  frmRelLancamentosRD.Free;
end;

procedure Tfrm_principal.imgLicencaClick(Sender: TObject);
begin
  inherited;
  Application.CreateForm(TfrmRegistroSistema, frmRegistroSistema);
  frmRegistroSistema.ShowModal;
  frmRegistroSistema.Free;
  testaLicencaEserial(false);
end;

procedure Tfrm_principal.ACBrBAL1LePeso(Peso: Double; Resposta: string);
begin
  inherited;
  showmessage(formatFloat('##0.000', Peso));
end;

procedure Tfrm_principal.I70007004Click(Sender: TObject);
begin
  inherited;
  application.CreateForm(TfrmRelAuditoriaPedidos, frmRelAuditoriaPedidos);
  frmRelAuditoriaPedidos.showmodal;
  frmRelAuditoriaPedidos.free;
end;

procedure Tfrm_principal.I70007005Click(Sender: TObject);
begin
  inherited;
  Application.CreateForm(TfrmRankingClientesDelivery, frmRankingClientesDelivery);
  frmRankingClientesDelivery.ShowModal;
  frmRankingClientesDelivery.Free;
end;

procedure Tfrm_principal.I70004004Click(Sender: TObject);
begin
  inherited;

  Application.CreateForm(TfrmRelProdutosVariosPeriodos, frmRelProdutosVariosPeriodos);
  frmRelProdutosVariosPeriodos.ShowModal;
  frmRelProdutosVariosPeriodos.Free;

end;

procedure Tfrm_principal.ApplicationEvents1Exception(Sender: TObject; E: Exception);
begin
  inherited;
 {
  ExceptionManager.Handle(E);
  EExceptionManager.ExceptionManager.ShowLastExceptionData;
  ShowRealDialog(self, tmErro, 'Erro', E.Message);
  dm.adicionalog('Tipo : E.ClassName ' + '  ' + E.Message);

  if (E.ClassName = 'EIBInterBaseError') then
  begin
    if ((Pos('Unable to complete network request', E.Message) > 0) or (Pos('connection lost to database', E.Message) > 0) or (Pos('unavailable database', E.Message) > 0)) then
    begin

      if iniciado = false then
      begin
        BDConectado := conexao_banco();

        if (BDConectado = false) then
        begin
          ////dm.adicionalog('O sistema não conseguiu se reconectar ao bando de dados...');
          Application.Terminate;
        end
        else
        begin
          ////dm.adicionalog('O sistema se conectou ao banco de dados com sucesso!');
        end;
      end
      else
      begin
        dm.exibe_painel_erro('O sistema foi desconectado do banco de dados. Por favor, verifique as conexões e abra o sistema novamente.', 'Fechar o sistema');
        Application.Terminate();
      end;
    end
    else
    begin
      exibe_painel_erro('Erro: ' + E.Message, 'Clique aqui para continuar');
    end;

  end
  else
  begin
    exibe_painel_erro('Erro: ' + E.Message, 'Clique aqui para continuar');

  end;
    }
end;

procedure Tfrm_principal.I10021000Click(Sender: TObject);
begin
  inherited;
  Application.CreateForm(TfrmCadBairros, frmCadBairros);
  frmCadBairros.ShowModal;
  frmCadBairros.Free;
end;

procedure Tfrm_principal.I10022000Click(Sender: TObject);
begin
  inherited;
  Application.CreateForm(TfrmCadClientesDelivery, frmCadClientesDelivery);
  frmCadClientesDelivery.ShowModal;
  frmCadClientesDelivery.Free;
end;

procedure Tfrm_principal.I40008001Click(Sender: TObject);
begin
  inherited;
  Application.CreateForm(TfrmControleInventarios, frmControleInventarios);
  frmControleInventarios.ShowModal;
  frmControleInventarios.Free;
end;

procedure Tfrm_principal.I80000000Click(Sender: TObject);
begin
  Application.CreateForm(TfrmManutencaoContasApagar, frmManutencaoContasApagar);
  frmManutencaoContasApagar.showmodal;
  frmManutencaoContasApagar.free
end;

procedure Tfrm_principal.pegarValoresRTTIObj(objeto: TObject);
var
  fldRtti: TRttiField;
  typRtti: TRttiType;
  ctxRtti: TRttiContext;
begin
  ctxRtti := TRttiContext.create;
  try
    typRtti := ctxRtti.GetType(objeto.ClassType);

    for fldRtti in typRtti.GetFields do
    begin
      if fldRtti.GetValue(objeto).IsObject then
        pegarValoresRTTIObj(fldRtti.GetValue(objeto).AsObject)
      else
      begin
        ////dm.adicionalog((objeto.ClassName + '-' + fldRtti.Name + 'Tipo : ' + fldRtti.FieldType.ToString + '  =' + fldRtti.GetValue(objeto).ToString));
      end
    end;
  finally
    ctxRtti.Free;
  end;
end;

end.

