

unit uu_frm_principal;

interface
uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus,  ExtCtrls, StdCtrls,pcnConversaoNFE, pcnConversao, SHDocVw,ACBrUtil,
  uu_modelo_Vazio, cxGraphics, ACBrCargaBal, acbrDevice, ACBrECF, ACBrValidador,ACBrPAFClass,
  ACBrBAL, ACBrEAD, OnGuard, ACBrGAV, AdvToolBar, AdvToolBarStylers,
  IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient, IdFTP,
  AdvOfficeStatusBar, AdvOfficeStatusBarStylers, AdvMenus,
  ACBrFala, ACBrBase, ACBrExtenso, ImgList, OleCtrls, Buttons, EExceptionManager,
   dxStatusBar, cxControls, jpeg ,midaslib,
  math, AdvToolBtn, RTTI, typinfo,

   DB, IBCustomDataSet,
    IBQuery,

 IniFiles, OgUtil, ACBrPosPrinter,
  ACBrNFeDANFEClass, ACBrNFeDANFeESCPOS, ACBrDFe, ACBrNFe, JvExControls,
  JvGradient, ACBrPAF, ACBrNFeDANFEFR, AppEvnts, IdThreadComponent,
  cxLookAndFeels, cxLookAndFeelPainters, dxSkinsCore, dxSkinBlack, dxSkinBlue,
  dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide,
  dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinFoggy,
  dxSkinGlassOceans, dxSkinHighContrast, dxSkiniMaginary, dxSkinLilian,
  dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMetropolis,
  dxSkinMetropolisDark, dxSkinMoneyTwins, dxSkinOffice2007Black,
  dxSkinOffice2007Blue, dxSkinOffice2007Green, dxSkinOffice2007Pink,
  dxSkinOffice2007Silver, dxSkinOffice2010Black, dxSkinOffice2010Blue,
  dxSkinOffice2010Silver, dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray,
  dxSkinOffice2013White, dxSkinOffice2016Colorful, dxSkinOffice2016Dark,
  dxSkinPumpkin, dxSkinSeven, dxSkinSevenClassic, dxSkinSharp, dxSkinSharpPlus,
  dxSkinSilver, dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008,
  dxSkinTheAsphaltWorld, dxSkinsDefaultPainters, dxSkinValentine,
  dxSkinVisualStudio2013Blue, dxSkinVisualStudio2013Dark,
  dxSkinVisualStudio2013Light, dxSkinVS2010, dxSkinWhiteprint,
  dxSkinXmas2008Blue, dxSkinsdxStatusBarPainter, System.ImageList, Vcl.ComCtrls,
  IBX.IBDatabase, uuCancelaNFCEChave, uuRelRankingClientesDelivery, PaisModel,
  PaisDAO, uuRelComprasRefCruzada, uuExpedicaoDelivery, uuCadBairros,
  uu_cad_clientes_delivery, uuInventario, uuExportaXMLNFCE;

 




  type TAux_item =class
    public

    total_item:  integer;
    total_monetario : real;
  end;


type
  Tfrm_principal = class(Tfrm_modelo_vazio)

    Image1: TImage;
    ImageList1: TImageList;
    escreveExtenso: TACBrExtenso;
    ACBrFala1: TACBrFala;
    timerInformacoes: TTimer;
    memoFormatacaoDelivery: TMemo;
    MainMenu1: TAdvMainMenu;
    I10000000: TMenuItem;
    I10001000: TMenuItem;
    I10001001: TMenuItem;
    I10001004: TMenuItem;
    I10002000: TMenuItem;
    I10002001: TMenuItem;
    I10002004: TMenuItem;
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
    menu_sair: TMenuItem;
    I40001001: TMenuItem;
    I40002001: TMenuItem;
    I20001008: TMenuItem;
    I20000000: TMenuItem;
    I20001001: TMenuItem;
    I20001002: TMenuItem;
    I30001001: TMenuItem;
    I30002001: TMenuItem;
    ffddI60000000: TMenuItem;
    fdfdI60001000: TMenuItem;
    fdfdI60001001: TMenuItem;
    ImageList2: TImageList;
    AdvOfficeStatusBarOfficeStyler1: TAdvOfficeStatusBarOfficeStyler;
    fdfdImportaesdedados1: TMenuItem;
    fdfdImportardadosMDCi1: TMenuItem;
    ACBrGAV1: TACBrGAV;
    I10010000: TMenuItem;
    I20001004: TMenuItem;
    serial: TOgDaysCode;
    OgMakeKeys1: TOgMakeKeys;
    timerVerificaLicenca: TTimer;


    I10012000: TMenuItem;
    I20001003: TMenuItem;
    I30000000: TMenuItem;
    I10011000: TMenuItem;
    I30003001: TMenuItem;
    I40005001: TMenuItem;
    I40000000: TMenuItem;
    I50000000: TMenuItem;
    GRFICOS1: TMenuItem;
    I50000001: TMenuItem;
    I50000002: TMenuItem;
    FLUXODECAIXA1: TMenuItem;
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
    LISTAGEMDEBAIRROS1: TMenuItem;
    LISTAGEMDEALQUOTAS1: TMenuItem;
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
    I70008002: TMenuItem;
    I70008003: TMenuItem;
    I70008004: TMenuItem;
    I10014000: TMenuItem;
    I70007003: TMenuItem;
    I10015000: TMenuItem;
    I70005002: TMenuItem;
    I70002004: TMenuItem;
    I70002010: TMenuItem;
    N3: TMenuItem;
    I70002031: TMenuItem;
    I70002032: TMenuItem;
    I70005003: TMenuItem;
    I10016000: TMenuItem;
    I60004001: TMenuItem;
    I60004002: TMenuItem;
    ead: TACBrEAD;
    memoObsMiniprinter: TMemo;
    memo_avisos: TMemo;
    I10017000: TMenuItem;
    dxStatusBar1: TdxStatusBar;
    I70009000: TMenuItem;
    I70009001: TMenuItem;
    I40004001: TMenuItem;
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
    I80001000: TMenuItem;
    I80001001: TMenuItem;
    I80001005: TMenuItem;
    I80002000: TMenuItem;
    I80002001: TMenuItem;
    I80002002: TMenuItem;
    I70006002: TMenuItem;
    I70006003: TMenuItem;
    I60012001: TMenuItem;
    dxStatusBar1Container4: TdxStatusBarContainerControl;
    timePanelLicenca: TTimer;
    pnLicenca: TPanel;
    btLicenca: TSpeedButton;
    I70012001: TMenuItem;
    I40003000: TMenuItem;
    I40003001: TMenuItem;
    I40003005: TMenuItem;
    I10019000: TMenuItem;
    I10020000: TMenuItem;
    validador: TACBrValidador;
    I70004002: TMenuItem;
    I40006001: TMenuItem;
    I70013000: TMenuItem;
    I70013001: TMenuItem;
    ecf: TACBrECF;
    memoChavePrivada: TMemo;
    memoChavePublica: TMemo;
    I70003002: TMenuItem;
    I40007001: TMenuItem;
    I70020003: TMenuItem;
    ed1: TEdit;
    Button1: TButton;
    MemoResp: TMemo;
    MemoDados: TMemo;
    memoRespWS: TMemo;
    WBResposta: TWebBrowser;
    Button3: TButton;
    I10004001: TMenuItem;
    I10004004: TMenuItem;
    Panel1: TPanel;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    SpeedButton5: TSpeedButton;
    balanca: TACBrBAL;
    balanca2: TACBrBAL;
    Button5: TButton;
    Button6: TButton;
    Button8: TButton;
    Button11: TButton;
    ACBrPAF: TACBrPAF;
    I80002003: TMenuItem;
    memodif: TMemo;
    Button2: TButton;
    I70013002: TMenuItem;
    pnECF: TPanel;
    lbECF: TLabel;
    I70004003: TMenuItem;
    I70007004: TMenuItem;
    memo1: TMemo;
    memoPagamentosTEF: TMemo;
    I70004004: TMenuItem;
    ApplicationEvents1: TApplicationEvents;
    memoSabores: TMemo;
    I70003003: TMenuItem;
    FaturamentoporHora1: TMenuItem;
    ProgressBar1: TProgressBar;
    Button4: TButton;
    QRYdOIDA: TIBQuery;
    lbNomeEmpresa: TLabel;
    I70007005: TMenuItem;
    I70002005: TMenuItem;
    timerCancelaNotasComErro: TTimer;
    I10022000: TMenuItem;
    I70020004: TMenuItem;
    Function SerialNum(FDrive:String) :String;
    function busca_parametros : boolean;
    function testeSerialValido() : boolean;    
    procedure consertaXMLBSB();
    procedure ConsertaXMLNozu();    
    procedure I20001001Click(Sender: TObject);
    procedure I10003000Click(Sender: TObject);
    procedure menu_sairClick(Sender: TObject);
    procedure permissoes_do_menu;
    procedure I10008000Click(Sender: TObject);
    function conexao_banco: boolean;
    procedure ssClick(Sender: TObject);
    procedure abreModuloDeCaixa();
    procedure encerramento_do_dia;
    procedure I20001008Click(Sender: TObject);
    procedure I10013001Click(Sender: TObject);
    procedure I10013005Click(Sender: TObject);
    procedure I40002001Click(Sender: TObject);
    procedure eClick(Sender: TObject);
    procedure I20004001Click(Sender: TObject);
    procedure inicia;

    procedure iniciarECF();
    procedure leituraX();
    procedure ReducaoZ();
    procedure FormActivate(Sender: TObject);
    procedure fdfdI60001000Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure HJGHG342Click(Sender: TObject);
    procedure I10009000Click(Sender: TObject);



    procedure fClick(Sender: TObject);
    procedure I20002013Click(Sender: TObject);
    procedure I50002001Click(Sender: TObject);
    procedure I10009001Click(Sender: TObject);
    procedure I10001004Click(Sender: TObject);
    procedure I10009002Click(Sender: TObject);
    procedure I10001001Click(Sender: TObject);
    procedure I10002004Click(Sender: TObject);
    procedure I10002001Click(Sender: TObject);
    procedure LoadXML(RetWS: String; MyWebBrowser: TWebBrowser);
    procedure I40001001Click(Sender: TObject);

    procedure I30003000Click(Sender: TObject);
    procedure I40005002Click(Sender: TObject);
    procedure I40005003Click(Sender: TObject);
    procedure I10006000Click(Sender: TObject);


    procedure ytytyttyClick(Sender: TObject);
    procedure I30001001Click(Sender: TObject);
    procedure I30002001Click(Sender: TObject);
    procedure ecf1MsgPoucoPapel(Sender: TObject);
    procedure programaFormasPGTO;
    function validaDataDoSistema() : boolean;
    procedure timerInformacoesTimer(Sender: TObject);
    function  DifHora(Inicio,Fim : String):String;
    procedure I20001002Click(Sender: TObject);
    procedure I10005000Click(Sender: TObject);
    procedure AdvToolButton1Click(Sender: TObject);
    procedure AdvToolButton4Click(Sender: TObject);
    procedure AdvToolButton13Click(Sender: TObject);
    procedure AdvToolButton6Click(Sender: TObject);
    procedure AdvToolButton5Click(Sender: TObject);
    procedure AdvToolButton7Click(Sender: TObject);
    procedure I10010000Click(Sender: TObject);
    procedure I20001004Click(Sender: TObject);


    procedure serialChangeCode(Sender: TObject; Code: TCode);
    procedure serialChecked(Sender: TObject; Status: TCodeStatus);
    procedure serialGetKey(Sender: TObject; var Key: TKey);
    procedure serialGetCode(Sender: TObject; var Code: TCode);
    procedure serialGetModifier(Sender: TObject; var Value: Integer);
    procedure testaLicencaEserial(primeira : boolean);
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
    procedure I70008002Click(Sender: TObject);
    procedure I70008003Click(Sender: TObject);
    procedure I70008004Click(Sender: TObject);
    procedure I10014000Click(Sender: TObject);
        procedure I70007003Click(Sender: TObject);
    procedure I10015000Click(Sender: TObject);
    procedure I40005001Click(Sender: TObject);
    procedure I70005002Click(Sender: TObject);
    procedure I70002004Click(Sender: TObject);
    procedure I70002010Click(Sender: TObject);
    procedure I70002031Click(Sender: TObject);
    procedure I70005003Click(Sender: TObject);
    procedure I10016000Click(Sender: TObject);
        procedure I60004001Click(Sender: TObject);
    procedure I60004002Click(Sender: TObject);
    function  GeraMD5PAFECF: String;
    procedure AACGetChave(var Chave: String);
    procedure I10017000Click(Sender: TObject);

    procedure I50000001Click(Sender: TObject);
    procedure I70009001Click(Sender: TObject);
    procedure I40004001Click(Sender: TObject);
    procedure I70020002Click(Sender: TObject);
    procedure I10018001Click(Sender: TObject);
    procedure I70010015Click(Sender: TObject);
    procedure I70010020Click(Sender: TObject);
    procedure I50000002Click(Sender: TObject);
    procedure I70009002Click(Sender: TObject);
    procedure I70011001Click(Sender: TObject);
    procedure I70011002Click(Sender: TObject);
    procedure I70011003Click(Sender: TObject);
    procedure I80001001Click(Sender: TObject);
    procedure I70006002Click(Sender: TObject);
    procedure I70006003Click(Sender: TObject);
    procedure I80001005Click(Sender: TObject);
    procedure I60012001Click(Sender: TObject);
    procedure btLicencaClick(Sender: TObject);
    procedure timePanelLicencaTimer(Sender: TObject);
    procedure I70012001Click(Sender: TObject);
    procedure I40003001Click(Sender: TObject);
    procedure ecfMsgPoucoPapel(Sender: TObject);
    procedure I10019000Click(Sender: TObject);
    procedure I10020000Click(Sender: TObject);
    procedure I70004002Click(Sender: TObject);
    procedure I70013001Click(Sender: TObject);
    procedure eadGetChavePrivada(var Chave: String);
    procedure eadGetChavePublica(var Chave: String);
    procedure I70003002Click(Sender: TObject);
    procedure I40007001Click(Sender: TObject);

    function ChecaForm(aForm: Tform): Boolean;
    procedure balanca2LePeso(Peso: Double; Resposta: String);
    procedure I70020003Click(Sender: TObject);


    procedure Button1Click(Sender: TObject);
    procedure I10004001Click(Sender: TObject);
    procedure I10004004Click(Sender: TObject);

    procedure SpeedButton5Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);

    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button8Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure Button11Click(Sender: TObject);
    procedure I80002002Click(Sender: TObject);
    procedure I80002001Click(Sender: TObject);
    procedure I80002003Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure ACBrBAL1LePeso(Peso: Double; Resposta: String);
    procedure Button4Click(Sender: TObject);



    procedure I70004003Click(Sender: TObject);
    procedure I70007004Click(Sender: TObject);
    procedure I70004004Click(Sender: TObject);
    procedure ApplicationEvents1Exception(Sender: TObject; E: Exception);
    procedure I40006001Click(Sender: TObject);
    procedure balancaLePeso(Peso: Double; Resposta: AnsiString);
    procedure I70003003Click(Sender: TObject);
    procedure I70007005Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure I70002005Click(Sender: TObject);
    procedure I10021000Click(Sender: TObject);
    procedure I10022000Click(Sender: TObject);
    procedure I70020004Click(Sender: TObject);
    


  private
    { Private declarations }
    BDConectado : boolean;
    nfe55VendaAtual : boolean;
    procedure pegarValoresRTTIObj(objeto: TObject);



  public

   { Public declarations }


     MyMsg: LongInt;
     TrocarOperador : boolean;
     sairDoSistema  : boolean;
     oquefazer_itens : integer;
     oquefazer_fornecedores : integer;
     oquefazer_cotacoes : integer;
     cod_cotacao        :   string;
     obsSaborPizza : string;
     obsLancamento : string;
     tipoMassaPizza : string;

    procedure MyShowHint(var HintStr: string;
    var CanShow: Boolean;
    var HintInfo: THintInfo);

    procedure setNFE55VendaAtual(emitirNFE55 : boolean);
    function getNFE55VendaAtual(): boolean;



  end;


     const
     CKey : TKey = ($2A,$C2,$09,$1A,$C3,$5D,$28,$7C,$84,$5E,$0A,$8C,$F1,$0F,$BF,$3D);


var

  frm_principal: Tfrm_principal;
  cor_foco_edit : Tcolor;
  cor_botao : Tcolor;
  cor_foco_botao : Tcolor;

  iniciado : boolean;

  voltarParaCaixa : smallint;
  mesaDelivery : string;
  mesaBalcao   : string;
  garcomDelivery : string;
  garcomBalcao   : string;
  pizzaValorProporcional : Boolean;

  retorno_consulta : array[1..10] of string;


  respostaPergunta : boolean;
  codigo_usuario : string;
  nome_usuario: string;
  numeroECFEmUso : string;
  num_serie_ecf : string;
  MD5_APLICATIVO : string;
  ecfArquivoAuxiliar : TACBrAACECF;

  caminhoMGV5 : string;
  pesoLidoBalanca : string;
  sucessoLeituraPeso : boolean;
  respostaLeituraBalanca : string;

  nome_completo_usuario : string;

  codigo_usuario_responsavel : string;
  nome_usuario_responsavel : string;
  nome_comp_usuario_responsavel : string;




   //Parametros de taxa de servico

   percentualTaxaServico : Double;
   selecionarCobrancaNaAberturaDoCaixa : smallint;




  patchAplicacao : string;
  patchXMLEntradas : string;
  caminhoArquivoAuxiliarPAF : string;
  caminhoArquivoExtrato : string;
  localDeEmissaoDeExtrato : smallint;
  localDeEmissaoEncerramento : smallint;
  codRelatorioGerencialExtrato : smallint;
  indiceRelatorioGerencialExtrato :smallint;

  imprimirTaxaServicoNoExtrato  : smallint;
  linhaExtrato : string;
  formatoCabecalhoExtrato : string;
  formatoCabecalhoExtratoLayout2Linha1 : string;
  formatoCabecalhoExtratoLayout2Linha2 : string;
  formatoRodapeExtrato : string;
  formatoLinhaTotalizador : string;
  formatoLinhaTotalizadorGeral : string;

  alinhamentoDireitaTotal : integer;
  alinhamentoDireitaTotalGeral : integer;


  nfceSincrona : boolean;
  nfeSincrona : boolean;
  valorMaxNFCESemCPF : double;

  data_do_sistema : Tdate;
  creditoNasEntradas : boolean;
  simplesNacional : boolean;
  destacaImpostoNFCE : boolean;
  aliquotaIBPT : double;
  qtdViasSangria : smallint;
  numeroEstacao : integer;
  imagem_c_livre : string;
  imagem_c_aguardando : string;
  imagem_n_disponivel: string;
  string_auxiliar    :   string;
  string_auxiliar2   :   string;
  string_auxiliar3   :   string;
  strObsProduto      : string;

  senha_correta : boolean;
  cnpj,razao_social,nome_fantasia,codEmpresa : string;

  msg_promo_delivery, msg_promo_conta : string;


  zerarICMSnasEntradas : integer;
  alterarUnidadeNasentradas : integer;

  tipo_cob_couvert : integer;
  Iretorno           :   integer;
  tipo_impressora : integer;

  tipo_comprovante : integer;
  viasComprovanteDelivery : integer;
  //Parâmetros da Impressora Fiscal
  impressora_fiscal_instalada : integer;
  marca_impressora_fiscal : integer;
  modelo_impressora_fiscal : integer;
  portaDaImpressoraFiscal : string;

  fabricanteBalanca :string;
  portaDaBalanca    : string;
  velocidadeBalanca : string;
  bitsDadosBalanca  : string;
  paridadeBalanca   : string;
  stopBitsBalanca   : string;
  fluxoBalanca      : string;

  fabricanteBalanca2 :string;
  portaDaBalanca2    : string;
  velocidadeBalanca2 : string;
  bitsDadosBalanca2  : string;
  paridadeBalanca2   : string;
  stopBitsBalanca2   : string;
  fluxoBalanca2      : string;

  codigoSuprimento :  string;
  codigoSangria    :  string;
  usarAcbr : integer;
  qtdColunasNormalECF : integer;
  qtdColunasExpandidoECF : integer;
  arredondamento : integer;
  nomeClienteCupom,enderecoClienteCupomFiscal,cpfClienteCupomFiscal : string;

  //Parametros de gaveta
  gavetaInstalada : integer;
  marcaGaveta     : integer;
  modeloGaveta    : integer;
  portaGaveta     : integer;



  //Parâmetros da Impressora não fiscal 01
  impressora_nao_fiscal_01_instalada : integer;
  marca_impressora_nao_fiscal_01 : integer;
  modelo_impressora_nao_fiscal_01 : integer;
  porta_impressora_nao_fiscal_01 : string;

  //Parâmetros da Impressora não fiscal 02
  impressora_nao_fiscal_02_instalada : integer;
  marca_impressora_nao_fiscal_02 : integer;
  modelo_impressora_nao_fiscal_02 : integer;
  porta_impressora_nao_fiscal_02 : string;
  gravado : boolean;
  tipo_cupom : integer;


  numero_caixa : string;
  ultimoCaixaAberto  :   string;
   string_aux_cod_barras : string;
  ultima_venda : string;

  encerrar_dia : boolean;
  coluna : integer;
  linha  : integer;


  //Parametros de COuvert
  cobraCOuvert : smallint;  // identifica se a casa cobra couvert artístico
  lancaCouvertAutomaticamente : smallint; // Identifica se o sistema deve lançar o couvert automaticamente ou exibir janela para o usuário.
  lancaCouvertNoCheckin : smallint;  // Identifica se o couvert será lançado na rotina de checkin


  // Parametros da Licença

  licenca : string;
  diasExpiracaoSistema : integer;
  registrarSistema : boolean;
  sistemaRegistrado : boolean;
  licencaValida : boolean;
  


implementation





uses  uu_data_module,  uu_produtos,
  uu_rel_prod_vendidos,
  uu_cad_usuarios, 
  uu_cad_garcons, 
  
   uu_troca_senha, 
   uu_cad_formas_pagamento,
  uu_caixa_restaurante,
  uu_confirma_encerramento, 
  uu_rel_gastos, uu_baixas_manuais,
   
  uu_cad_grupos,
  uu_leitura_mem_fiscal, UU_DM_RELATORIOS, 
  uu_cad_contas, uu_cad_historico,
  uu_cad_itens_estoque, 
  uu_cad_fornecedor, uu_cad_grupos_fornecedores, uu_cad_clientes,
  uu_cad_tipo_cliente,
   
  uu_entradas, 
  uu_cad_reg60A, uu_cad_reg60M,
  uuCadUnidades,
  
  uuCadClientesReduzido, uuLiberarCliente, uuAberturaCaixa,
  uuPrincipalDelivery,

  uListagemProdutos, uu_rel_produtosPeriodo,
  uuRelAniversariantes, uuRelConsumoClientesNaCasa, 
  uuCadTiposSangria, uuRelatorioPedidosDelivery,
  uuRelContatoEstrategicoDelivery, uuLogTouch,
  uuRegistroSistema, uuSistemaBloqueado, uuAvisoExpiracao, uuLicenca,
  uuCadMotivoCancelamento, uuCadObservacoesPreparo,
  uuCadTiposBaixaEstoque, uuDmRelatorios, uu_listagem_fornecedores,
  uu_listagem_itens_estoque, uu_relatorio_estoque,
  uu_rel_compras_por_fornecedor, uu_rel_compras_por_grupo,
  uu_rel_compras_por_Item, uuRelatorioCaixa, uu_rel_producao_Garcons,
  uuRelFaturamento, uuRelFaturamentoDiarioSintetico,
  uuRelFaturamentoMensalPeriodoAnalitico,
  uuRelFaturamentoMensalPeriodoSintetico, 
  uuCadEntregadores, uuGerarSpedFiscal, uuRelPedidosPorEntregador,
  UUentradaClientes, uuControleCartoes, uuTransformacaoSubmateria,
  uuRelClientesBoateData, uu_rel_compras_por_cfop,
  uuRelatorioBaixasManuais, uuRelatorioEstoqueReposicao, uuCadSaboresPizza,
  uuCadCidade, uuCadNotasConsumidor, uuRelNotasVendaConsumidor,
  uuCadNotasTransportadora, uuRelNotasFrete,
  uuRelConferenciaLivroEntradas,
  uuSaidasNotaFiscal, uu_rel_notas_saida_fornecedor,
  uuRelFaturasAbertasPorFaturamento, uuRelFaturasAbertasPorVencimento,
  uRelFaturasAbertasDetalhada, 
  uuLancamentoContasAPagar, uuRelProducaoGarconsSintetico,
  uuRelTaxaServico, uuRequisicaoEstoque, 
  uuLancamentosSalao, uuCadGruposTouch, uuCadGuarnicoes, 
  uuCapturaXMLNFE, uuRelRankingProdutos,
  uuRelEstatisticoPeriodo, uuRelResCaixaTurno,
  uuEntradasAvulsas, uuFrenteCaixa, uu_encerramento,
  uuProjecaoDespesas, uuRelApuracaoGrupos, 
  uuMenuFiscal, ACBrNFeWebServices, uuPainelAguarde, uuEnvioContingencia,
  uuSelecionaProdutosVendidos, pcnNFe,
  ACBrNFeNotasFiscais, uuLancamentosRD, uuProjecaoVendas,
  uuListagemLancamentosRD, uuMensagemTEF, uuRelProdutosCSTPIS,
  uuRelAuditoriaPedidos, uuReimpressaoDanfeNFCE, uuManutencaoContasApagar,
  uuRelProdutosVariosPeriodos, uuExportaXMLEntradas, uuEmissaoNFEEncerramento,
  uuRelCancelamentoProdutos, uuConsultaInfSat, ObsClienteDeliveryModel;



{$R *.dfm}



function Tfrm_principal.busca_parametros : boolean;
var
 vAux : string;
begin
  dm.atualizaDataDoSistema();
  patchAplicacao := ExtractFilePath( Application.ExeName );
  if dm.tb_parametrosCREDITO_ENTRADAS.Value = 0 then
   creditoNasEntradas := false
  else
   creditoNasEntradas := true;

  if (dm.tb_parametrosREGIME_TRIBUTACAO.Value = 1 ) then // se a empresa for optante do simples nacional
   begin
     simplesNacional := true;
      if (dm.tb_parametrosIMPOSTO_SIMP_NAC_NFCE.Value = 1 ) then
       destacaImpostoNFCE := true
      else
       destacaImpostoNFCE := false;

   end
  else
   begin
    simplesNacional := false;
   end;


  if dm.tb_parametrosPIZZA_MAIS_CARA.Value  = 1  then
    pizzaValorProporcional := false
  else
    pizzaValorProporcional := true;

  aliquotaIBPT := dm.tb_parametrosALIQ_IBPT.Value;





  zerarICMSnasEntradas:= dm.tb_parametrosZERAR_ICMS_ENTRADAS.Value;
  alterarUnidadeNasentradas := dm.tb_parametrosALTERAR_UN_NAS_ENTRADAS.value;


  numeroEstacao:= StrToInt(dm.LeIni(2,'BANCO_DE_DADOS','ESTACAO'));
  if numeroEstacao = 0 then
   begin
    ShowMessage('Número da estação incorreto!');
    application.terminate;
   end;



  qtdViasSangria := dm.tb_parametrosQTD_VIAS_SANGRIA.Value;
  razao_social:= dm.tb_parametros.Fieldbyname('razao_social').value;
  nome_fantasia:= dm.tb_parametros.Fieldbyname('nome_fantasia').value;

  if dm.tb_parametros.Fieldbyname('MSG_PROMO_DELIVERY').value <>  null then
    msg_promo_delivery := dm.tb_parametros.Fieldbyname('MSG_PROMO_DELIVERY').value;

  if dm.tb_parametros.Fieldbyname('MSG_PROMO_CONTA').value <>  null then
  msg_promo_conta    := dm.tb_parametros.Fieldbyname('MSG_PROMO_CONTA').value;

  cnpj := dm.tb_parametros.Fieldbyname('cnpj').value;
  codEmpresa := dm.tb_parametros.Fieldbyname('cod_empresa').value;

  if dm.tb_parametrosTIPO_ENVIO_NFCE.Value =1  then
   nfceSincrona := true
  else
   nfceSincrona := true;

  if dm.tb_parametrosTIPO_ENVIO_NFE.Value =1  then
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
  dm.ACBrNFe1.Configuracoes.WebServices.AguardarConsultaRet   :=  StrToInt(vAux);
  dm.ACBrNFe1.Configuracoes.WebServices.Tentativas            := dm.tb_parametrosTENTATIVAS_CONSULTA_RET_NFCE.Value;

  vAux := FloatToStr(dm.tb_parametrosINTERVALO_TENTATIVAS_NFCE.Value * 1000);
  dm.ACBrNFe1.Configuracoes.WebServices.IntervaloTentativas   := StrToInt(vAux);

  vAux := floattostr(dm.tb_parametrosTIMEOUT_RET_NFCE.Value * 1000);
  dm.ACBrNFe1.Configuracoes.WebServices.TimeOut               :=  StrToInt(vAux);



  // Parametros de extrato
  patchXMLEntradas                :=  dm.LeIni(2,'XML_ENTRADAS','pastaXML');
  caminhoArquivoExtrato           :=  dm.LeIni(2,'extrato','caminhoArquivoExtrato');
  localDeEmissaoDeExtrato         :=  StrToInt(dm.LeIni(1,'extrato','localDeEmissaoDeExtrato'));
  localDeEmissaoEncerramento      :=  StrToInt(dm.LeIni(1,'encerramento','localDeEmissaoDeEncerramento'));
  codRelatorioGerencialExtrato    :=  StrToInt(dm.LeIni(1,'extrato','codRelatorioGerencialExtrato'));
  indiceRelatorioGerencialExtrato :=  StrToInt(dm.LeIni(1,'extrato','indiceRelatorioGerencialExtrato'));

  imprimirTaxaServicoNoExtrato  :=  StrToInt(dm.LeIni(1,'extrato','imprimirTaxaServicoNoExtrato'));
  linhaExtrato                  :=  dm.LeIni(2,'extrato','linhaExtrato');
  formatoCabecalhoExtrato       :=  dm.LeIni(2,'extrato','formatoCabecalhoExtrato');
  formatoCabecalhoExtratoLayout2Linha1 := dm.LeIni(2,'extrato','formatoCabecalhoExtratoLayout2Linha1');
  formatoCabecalhoExtratoLayout2Linha2  := dm.LeIni(2,'extrato','formatoCabecalhoExtratoLayout2Linha2');

  formatoRodapeExtrato          :=  dm.LeIni(2,'extrato','formatoRodapeExtrato');
  formatoLinhaTotalizador       :=  dm.LeIni(2,'extrato','formatoLinhaTotalizador');
  formatoLinhaTotalizadorGeral       :=  dm.LeIni(2,'extrato','formatoLinhaTotalizadorGeral');

  alinhamentoDireitaTotal          :=  StrToInt(dm.LeIni(1,'extrato','alinhamentoDireitaTotal'));
  alinhamentoDireitaTotalGeral     :=  StrToInt(dm.LeIni(1,'extrato','alinhamentoDireitaTotalGeral'));
  layoutExtrato :=  StrToInt(dm.LeIni(1,'extrato','layout'));



  // Busca os parâmetros da impressora fiscal


  impressora_fiscal_instalada:=StrToInt(dm.LeIni(1,'IMPRESSORA_FISCAL','instalada'));
  marca_impressora_fiscal:=StrToInt(dm.LeIni(1,'IMPRESSORA_FISCAL','marca'));
  modelo_impressora_fiscal:=StrToInt(dm.LeIni(1,'IMPRESSORA_FISCAL','modelo'));

  portaDaImpressoraFiscal:=dm.LeIni(2,'IMPRESSORA_FISCAL','porta');
  codigoSuprimento := dm.LeIni(2,'IMPRESSORA_FISCAL','codigoSuprimento');
  codigoSangria    := dm.LeIni(2,'IMPRESSORA_FISCAL','codigoSangria');
  usarAcbr := StrToInt(dm.LeIni(1,'IMPRESSORA_FISCAL','usarAcbr'));
  qtdColunasNormalECF     := StrToInt(dm.LeIni(1,'IMPRESSORA_FISCAL','qtdColunasNormalECF'));
  qtdColunasExpandidoECF  := StrToInt(dm.LeIni(1,'IMPRESSORA_FISCAL','qtdColunasExpandidoECF'));



  //se arredondamento=1  realiza truncamento, se =2  realiza arredondamento.
  // Ex.   o número 14.637 em trucamento vai para 14.63
  //       "              " em arredondamento vai para 14.64

  // Ex.   o número 14.633 em trucamento vai para 14.63
  //       "              " em arredondamento vai para 14.63



  arredondamento          := StrToInt(dm.LeIni(1,'IMPRESSORA_FISCAL','arredondamento'));


  // Busca parâmetros da impressora não fiscal 01
  impressora_nao_fiscal_01_instalada:=StrToInt(dm.LeIni(1,'IMPRESSORA_NAO_FISCAL_01','instalada'));
  marca_impressora_nao_fiscal_01:=StrToInt(dm.LeIni(1,'IMPRESSORA_NAO_FISCAL_01','marca'));
  modelo_impressora_nao_fiscal_01:=StrToInt(dm.LeIni(1,'IMPRESSORA_NAO_FISCAL_01','modelo'));
  porta_impressora_nao_fiscal_01:=dm.LeIni(2,'IMPRESSORA_NAO_FISCAL_01','porta');

  // Busca parâmetros da impressora não fiscal 02
  impressora_nao_fiscal_02_instalada:=StrToInt(dm.LeIni(1,'IMPRESSORA_NAO_FISCAL_02','instalada'));
  marca_impressora_nao_fiscal_02:=StrToInt(dm.LeIni(1,'IMPRESSORA_NAO_FISCAL_02','marca'));
  modelo_impressora_nao_fiscal_02:=StrToInt(dm.LeIni(1,'IMPRESSORA_NAO_FISCAL_02','modelo'));
  porta_impressora_nao_fiscal_02:=dm.LeIni(2,'IMPRESSORA_NAO_FISCAL_02','porta');




  gavetaInstalada:=  StrToInt(dm.LeIni(1,'GAVETA','instalada'));
  portaGaveta := StrToInt(dm.LeIni(1,'GAVETA','porta'));

  fabricanteBalanca   := dm.LeIni(2,'BALANCA','fabricante');
  portaDaBalanca      := dm.LeIni(2,'BALANCA','porta');
  velocidadeBalanca   := dm.LeIni(2,'BALANCA','velocidade');
  paridadeBalanca     := dm.LeIni(2,'BALANCA','paridade');
  bitsDadosBalanca    := dm.LeIni(2,'BALANCA','bitsDados');
  stopBitsBalanca     := dm.LeIni(2,'BALANCA','stopBits');
  fluxoBalanca        := dm.LeIni(2,'BALANCA','fluxo');

  fabricanteBalanca2   := dm.LeIni(2,'BALANCA_02','fabricante');
  portaDaBalanca2      := dm.LeIni(2,'BALANCA_02','porta');
  velocidadeBalanca2   := dm.LeIni(2,'BALANCA_02','velocidade');
  paridadeBalanca2     := dm.LeIni(2,'BALANCA_02','paridade');
  bitsDadosBalanca2    := dm.LeIni(2,'BALANCA_02','bitsDados');
  stopBitsBalanca2     := dm.LeIni(2,'BALANCA_02','stopBits');
  fluxoBalanca2        := dm.LeIni(2,'BALANCA_02','fluxo');


  caminhoMGV5:= dm.LeIni(2,'BALANCA','caminhoMGV5');

  portaDaBalanca2:=dm.LeIni(2,'BALANCA_02','porta');
  velocidadeBalanca2 :=dm.LeIni(2,'BALANCA_02','velocidade');


  viasComprovanteDelivery:=StrtoInt(dm.LeIni(1,'EXTRATO','viasComprovanteDelivery'));

  tipo_comprovante:=StrtoInt(dm.LeIni(1,'ENCERRAMENTO','tipo_comprovante'));
  numero_caixa:=dm.LeIni(1,'CAIXA','numero');
  numero_caixa:=FormatFloat('000',strtofloat(numero_caixa));
  tipo_impressora:=StrToint(dm.LeIni(1,'ENCERRAMENTO','impressora_fiscal'));
  ultimoCaixaAberto :=   dm.LeIni(2,'CAIXA','ultimoCodigo');



  //Busca os parâmetros de couvert
  cobraCouvert:= StrToint(dm.LeIni(1,'COUVERT','cobraCouvert'));                           // identifica se a casa cobra couvert artístico
  lancaCouvertAutomaticamente:= StrToint(dm.LeIni(1,'COUVERT','lancarAutomaticamente'));   // identifica se a casa cobra couvert artístico
  lancaCouvertNoCheckin :=   StrToint(dm.LeIni(1,'COUVERT','lancarCouvertNoCheckin'));   // identifica se a casa cobra couvert artístico



  //Busca os parâmetros de taxa de servico
  percentualTaxaServico:=0;

  percentualTaxaServico:=StrToFloat(dm.LeIni(2,'TAXA_SERVICO','percentual'));
  selecionarCobrancaNaAberturaDoCaixa := StrToint(dm.LeIni(1,'TAXA_SERVICO','selecionarCobrancaNaAberturaDoCaixa'));

  if ( StrToint(dm.LeIni(1,'TAXA_SERVICO','cobraTaxaServico'))  = 0) then
   begin
     percentualTaxaServico:=0;
     selecionarCobrancaNaAberturaDoCaixa:=0;
   end;

  /// Outros parametros
  garcomDelivery := dm.getCodGarconMesaDelivery();
  mesaDelivery :=   dm.getCodMesaDelivery();
  mesaBalcao   :=   dm.getCodMesaBalcao();
  garcomBalcao :=   dm.getCodGarconMesaBalcao();

  //busca parametros de licença
  licenca:= dm.LeIni(2,'BANCO_DE_DADOS','registro');

  lbNomeEmpresa.Caption := razao_social;
  dxstatusbar1.Panels[0].text:=razao_social;
  dxStatusBar1.Panels[2].Text:=nome_usuario;
  dxStatusBar1.Panels[3].Text :='Versão '+dm.ExeInfo1.FileVersion;






  // Mudar essa variável na chamada da função de emissão de NFCE


{



  StatusBar.Panels[0].Text:=razao_social;
  StatusBar.Panels[1].Text :='CNPJ: '+ dm.FormataCNPJ(cnpj);
  StatusBar.Panels[2].Text :='Estação: '+ FormatFloat('000',numeroEstacao);
  StatusBar.Panels[4].Text :='Movimento de: '+ FormatDateTime('DD/MM/YY',data_do_sistema);
  StatusBar.Panels[5].Text :='Usuário: '+nome_usuario;
 }




end;






procedure Tfrm_principal.LoadXML(RetWS: String; MyWebBrowser: TWebBrowser);
begin
  ACBrUtil.WriteToTXT( PathWithDelim(ExtractFileDir(application.ExeName))+'temp.xml',
                        ACBrUtil.ConverteXMLtoUTF8( RetWS ), False, False);
  MyWebBrowser.Navigate(PathWithDelim(ExtractFileDir(application.ExeName))+'temp.xml');
end;


function Tfrm_principal.testeSerialValido() : boolean;
var
 status :TCodeStatus;
begin
  status := frm_principal.serial.CheckCode(true);
  if status = ogValidCode then
   begin
    frm_principal.serial.Decrease;
    diasExpiracaoSistema := frm_principal.serial.GetValue;
    result:=true;
   end
  else
   begin
     result:=false;
   end;
end;




procedure Tfrm_principal.I20001001Click(Sender: TObject);
begin
   TrocarOperador := false;

    if  ( StrToInt(dm.LeIni(1,'IMPRESSORA_FISCAL','instalada')) = 1 ) then
       begin
        if  (validacaoArquivoAuxiliarPaf(caminhoArquivoAuxiliarPAF) = false) then
         begin
           exit;
         end;

       end;



   if (verificaSeCaixaEstaAberto(ultimoCaixaAberto) = false) then
     begin

      if (dm.verificaNotasContingencia = true) then
       begin
        dm.exibe_painel_erro('Existem NFC-e(s) em contingência pendentes de envio. '#13#10#13#10+' ','Ok');

       end;

      IF (frm_principal.validaDataDoSistema () = true) then
        begin
         Application.CreateForm(TfrmAberturaCaixa,frmAberturaCaixa);
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



  if (sairDoSistema = true ) then
   begin
     Application.Terminate;
   end;

  if (TrocarOperador = true) then
   begin
     inicia();
   end;


end;






procedure Tfrm_principal.abreModuloDeCaixa();
begin

 voltarParaCaixa := 2;


   case StrToInt(dm.leini(2,'CAIXA','tipo_caixa')) of
    1 : begin
         if dm.verificaPermissaoAcao('I20001002') = true then
          begin
           Application.CreateForm(TfrmFrenteCaixa , frmFrenteCaixa);
           frmFrenteCaixa.ShowModal;
           frmFrenteCaixa.Free;
          end;
        end;

    2:  begin

         if dm.verificaPermissaoAcao('I20001001') = true then
          begin
           Application.CreateForm(Tfrm_caixa_restaurante , frm_caixa_restaurante);
           frm_caixa_restaurante.ShowModal;
           frm_caixa_restaurante.Free;
          end;

        end;
   end;



end;






procedure Tfrm_principal.I10003000Click(Sender: TObject);
begin
 Application.CreateForm(Tfrm_cad_grupos,frm_cad_grupos);
 frm_cad_grupos.showmodal;
 frm_cad_grupos.free;
end;

procedure Tfrm_principal.menu_sairClick(Sender: TObject);
begin

  Application.Terminate;
end;




procedure Tfrm_principal.permissoes_do_menu;
var
 total_itens,item_atual: integer;
 total_c1,atualc1,totalc2,atualc2 : integer;
 modulo,submodulo : string;
 nome : string;
 x : integer;

begin
   x:=0;
   while x < ComponentCount-1 do
   begin
    if  Components[x].ClassName='TMenuItem'
      then
        begin
           modulo:=Trim(copy(TMenuItem(Components[x]).Name,2,5));
           submodulo:=Trim(copy(TMenuItem(Components[x]).Name,7,15));
           nome:=TMenuItem(Components[x]).Name;

           if dm.verifica_permissao(modulo,submodulo,codigo_usuario,false)=false then
              begin
               if (  (nome = 'menu_sair') or (nome='encerra') or (nome='enc') or ( copy(nome,0,1)='N' )) then
                 TMenuItem(Components[x]).Visible:=true
                else
                TMenuItem(Components[x]).Visible:=false
              end

             else
               TMenuItem(Components[x]).Visible:=true
        end;
    x:=x+1;
   end;
end;

procedure Tfrm_principal.I10008000Click(Sender: TObject);
begin
  Application.CreateForm(TfrmCadGarcons,frmCadGarcons);
  frmCadGarcons.showmodal;
  frmCadGarcons.free;
end;








function Tfrm_principal.conexao_banco : boolean;
var
 local_banco,usuario,senha, porta_bd, servidor_bd : string;
 tentativaAtual : smallint;
begin
  dm.dbrestaurante.Connected := False;
  dm.adicionaLog('Iniciando conexão com o banco de dados...');
  dm.dbrestaurante.IdleTimer :=1000;

  Servidor_BD  :=  dm.LeIni(2,'BANCO_DE_DADOS','servidor');
  Porta_BD     :=  dm.LeIni(2,'BANCO_DE_DADOS','porta');
  local_banco:=    dm.LeIni(2,'BANCO_DE_DADOS','local_bd');
  usuario:=        dm.LeIni(2,'BANCO_DE_DADOS','usuario');
  senha:=          dm.LeIni(2,'BANCO_DE_DADOS','senha');



  dm.dbrestaurante.DatabaseName:=local_banco;
  dm.adicionaLog('Caminho do banco '+local_banco);
  dm.dbrestaurante.Params.Values['user_name']:=usuario;
  dm.dbrestaurante.Params.Values['password']:=senha;


  BDConectado := false;
  dm.dbrestaurante.Connected := false;
  Application.CreateForm(TfrmPainelAguarde, frmPainelAguarde);
  frmPainelAguarde.Memo1.Lines.Clear;
  frmPainelAguarde.Show;
  frmPainelAguarde.Timer1.Enabled := False;
  frmPainelAguarde.Timer2.Enabled := False;
  frmPainelAguarde.timerFechar.Enabled := false;


  dm.adicionaLog('Inicia tentativa de conexao ao banco de dados...');
  tentativaAtual :=1;
  while ( (tentativaAtual <=10) and (BDConectado = false) )  do
   begin

    frmPainelAguarde.Memo1.Lines.Clear;
    frmPainelAguarde.Memo1.Lines.Add('Tentando conectar ao banco de dados...');
    frmPainelAguarde.Memo1.Lines.Add('Tentativa '+IntToStr(tentativaAtual ) +' / 10...');
    Application.ProcessMessages();
    Sleep(2000);
    Application.ProcessMessages();

    try
      begin
        dm.dbrestaurante.Connected := True;
        BDConectado := true;
      end;
     except
       begin
         frmPainelAguarde.Memo1.Lines.Add('Falha na tentativa '+IntToStr(tentativaAtual));
         dm.adicionaLog('Falha na tentativa '+IntToStr(tentativaAtual)+' de conectar ao banco de dados');
       end;
     end;
     tentativaAtual := tentativaAtual + 1;
   end;

     frmPainelAguarde.Free;
   if BDConectado  then
    begin
     dm.adicionaLog('O sistema se conectou ao banco após '+Inttostr(tentativaAtual)+' tentativas');
     dm.dbrestaurante.IdleTimer :=0;


     try
       dm.FDRestaurante.Params.Clear;
       dm.FDRestaurante.Params.Add('DriverID=' + 'FB');
       dm.FDRestaurante.Params.Add('Server=' + Servidor_BD);
       dm.FDRestaurante.Params.Add('Port=' + Porta_BD);
       dm.FDRestaurante.Params.Add('Database=' + local_banco);
       dm.FDRestaurante.Params.Add('User_Name=' + usuario);
       dm.FDRestaurante.Params.Add('Password=' + senha);
       dm.FDRestaurante.Params.Add('Protocol=TCPIP');
       dm.FDRestaurante.DriverName  := 'FB';
       dm.FDRestaurante.LoginPrompt := FALSE;
       dm.FDRestaurante.UpdateOptions.CountUpdatedRecords := False;
       dm.adicionaLog('Conexão firedac efetuada!');
     except
       showmessage('Erro ao abrir conexão com o Firedac!');
     end;




     result := true
    end
   else
    begin
       dm.exibe_painel_erro('O Sistema não conseguiu se conectar ao banco de dados.'+LineBreak+
       'Se você estiver no servidor, verifique se o serviço do Firebird está ativo.'+LineBreak+
       'Se estiver em uma estação, siga o passos: '+LineBreak+
       ' 1º Verifique as configurações de rede e se o firewall no servidor do banco de dados está bloqueando o firebird.'+LineBreak+
       ' 2º Verifique os cabos de rede e faça um teste de ping para o ip do servidor.'+LineBreak+
       ' 3º Verifique o LOG do sistema para obter informações da tentativa de conexão.','Fechar o sistema');
     dm.adicionaLog('O sistema não conseguiu se conectar ao banco.');
     result :=false;
    end;
end;

procedure Tfrm_principal.ssClick(Sender: TObject);
begin
  Application.CreateForm(Tfrm_rel_prod_vendidos_a,frm_rel_prod_vendidos_a);
  frm_rel_prod_vendidos_a.showmodal;
  frm_rel_prod_vendidos_a.free;

end;

procedure Tfrm_principal.encerramento_do_dia;
var
ArqMov : string;
begin


//  if (dm.verificaSeFuncionaComoBoate = true) then
//   begin
     dm.transacao.Active:=false;
     dm.transacao.Active:=true;
     dm.qryauxiliar.Active :=false;
     dm.qryauxiliar.SQL.Clear;
     dm.qryauxiliar.SQL.Add('update cartoes set status=3,cod_cli=null,cod_movimentacao=null where status <> 2');
     dm.qryauxiliar.ExecSQL;
     dm.transacao.Commit;
//   end;


  dm.qryauxiliar.SQL.Clear;
  dm.qryauxiliar.SQL.Add('delete from fila_de_impressao');
  dm.qryauxiliar.ExecSQL;

  dm.qryauxiliar.SQL.Clear;
  dm.qryauxiliar.SQL.Add('SET GENERATOR G_FILA_IMPRESSAO TO 0');
  dm.qryauxiliar.ExecSQL;



  dm.qryauxiliar.SQL.Clear;
  dm.qryauxiliar.SQL.Add('SET GENERATOR G_PEDIDOS_BALCAO TO 0');
  dm.qryauxiliar.ExecSQL;

  dm.qryauxiliar.SQL.Clear;
  dm.qryauxiliar.SQL.Add('delete from movimento_mesa where cancelado=1');
  dm.qryauxiliar.ExecSQL;

  dm.qryauxiliar.SQL.Clear;
  dm.qryauxiliar.SQL.Add('delete from informacoes_mesa where mesa not in (select cod_mesa from movimento_mesa)');
  dm.qryauxiliar.ExecSQL;

  


  try
    begin
       dm.qryauxiliar.ExecSQL;
    end;
  except
    begin
      ShowMessage('Ocorreu um erro no sistema!  Um log de erros foi criado no formato DATA+HORA na pasta logs do Sistema. Abra o arquivo e envio por fax ou email para a Real Systems');
      dm.cria_log_de_erros(dm.qryauxiliar.sql,'Módulo de caixa','Erro ao mudar o status de cartao',getCodOperadorCaixa(ultimoCaixaAberto) );
      exit;
    end;
  end;


  dm.qryauxiliar.Active := false;
  dm.qryauxiliar.SQL.Clear;
  dm.qryauxiliar.SQL.Add(' select '+Quotedstr(cnpj)+' as CNPJ, v.data_so,v.hora,v.numero_caixa,v.cod_venda,v.valor_total  from vendas v ');
  dm.qryauxiliar.SQL.Add('   where imp=0');
  dm.qryauxiliar.SQL.Add(' order by v.cod_venda');
  dm.adicionaLog(dm.qryauxiliar.SQL.text);
  dm.qryauxiliar.Active := true;

  ArqMov :=patchAplicacao+'\EXP_VENDAS\VENDAS_'+FormatDateTime('YYYMMDD',data_do_sistema)+formatDateTime('HHMMSS',time)  +'.XML';
  try
   dm.ExpXML(dm.qryauxiliar,ArqMov);
  except
    begin
      dm.adicionaLog('Erro ao gerar arquivo XML de exportação de vendas');
    end;
  end;

  dm.qryauxiliar.Active := false;
  dm.qryauxiliar.SQL.Clear;
  dm.qryauxiliar.SQL.Add(' update vendas v set v.imp=1 where imp=0');
  dm.qryauxiliar.ExecSQL;



  dm.tb_parametros.Active:=true;
  dm.tb_parametros.Edit;
  data_do_sistema:=date;
  dm.tb_parametros.FieldByName('data_sistema').value:=data_do_sistema;
  dm.tb_parametros.Post;



  dm.transacao.Commit;
  dm.transacao.Active:=false;
  dm.transacao.Active:=true;
  dm.tb_parametros.Active:=true;
  busca_parametros;

end;

procedure Tfrm_principal.I70020004Click(Sender: TObject);
begin
  inherited;
  Application.CreateForm(TfrmExportaXMLNfce, frmExportaXMLNfce);
  frmExportaXMLNfce.ShowModal;
  frmExportaXMLNfce.Free;
end;

procedure Tfrm_principal.I70003003Click(Sender: TObject);
  begin
    inherited;
    Application.CreateForm(TfrmRelCancelamentosProdutos,frmRelCancelamentosProdutos);
    frmRelCancelamentosProdutos.showmodal;
    frmRelCancelamentosProdutos.free;
  end;

  procedure Tfrm_principal.I20001008Click(Sender: TObject);
  begin
    encerrar_dia:=false;


    if ( StrToInt(dm.LeIni(2,'CAIXA','permiteEncerrarDia')) = 0  ) then
     begin
       dm.exibe_painel_erro('Não é possível encerrar o dia nesta estação. Proceda com o encerramento do dia no servidor!','Ok');
       exit;
     end;
//


  if (  StrToInt(dm.LeIni(2,'NFCE','verificaContingenciaEncerramentoDia'))  = 1 ) then
  begin

    if (dm.verificaNotasContingencia = true) then
   begin
    dm.exibe_painel_erro('Existem notas fiscais em contingência. Envie as notas antes de prosseguir em todos os caixas '#13#10#13#10+' ','Ok');
    Application.CreateForm(TfrmEnvioContingencia, frmEnvioContingencia);
    frmEnvioContingencia.ShowModal;
    frmEnvioContingencia.free;
    exit;
   end;


  end;

  if (dm.verificaExistenciaNotasPendentesCancelamento ) then
   begin
      dm.exibe_painel_erro('Existem notas fiscais pendentes de cancelamento por erro de conexão.'+sLineBreak+
       'O sistema tentará fazer o cancelamento automático.' +sLineBreak+
       'Certifique-se que o computador esteja conectado à internet, pois do contrário o processo não será efetuado.'+sLineBreak+
       ' e não será possível encerrar o dia!','Ok');
      dm.CancelaNotasPendentes();
      dm.CancelaNotasPendentesPorSubstituicao ();
   end;






  if (verificaSeCaixaEstaAberto(ultimoCaixaAberto) = true) then
   begin
    showmessage('Não é possível encerrar o dia pois o caixa se encontra aberto!');
    exit;
   end
  else
   begin
     dm.qryauxiliar.Active:=false;
     dm.qryauxiliar.SQL.clear;
     dm.qryauxiliar.sql.add('select * from vendas where data='+Quotedstr(FormatDateTime('DD.MM.YY',data_do_sistema)));
     dm.qryauxiliar.active:=true;
     if not dm.qryauxiliar.IsEmpty then
      begin
        if MessageDlg('Confirma encerramento do dia ?  a data atual é :'+DateToStr(data_do_sistema),mtConfirmation,[mbYes,mbno],0)= Mryes then
         begin
           encerramento_do_dia;
           inicia;
         end
      end
     else
      begin
        Application.CreateForm(Tfrm_confirma_encerramento,frm_confirma_encerramento);
        frm_confirma_encerramento.ShowModal;
        frm_confirma_encerramento.Free;

        if encerrar_dia then
         begin
           encerramento_do_dia;
           inicia;
         end;

      end;
   end;
end;

procedure Tfrm_principal.I10013001Click(Sender: TObject);
begin
  Application.createform(Tfrm_cad_usuarios,frm_cad_usuarios);
  frm_cad_usuarios.showmodal;
  frm_cad_usuarios.free;
  permissoes_do_menu;

end;

procedure Tfrm_principal.I10013005Click(Sender: TObject);
begin
  Application.CreateForm(Tfrm_troca_senha,frm_troca_senha);
  frm_troca_senha.ShowModal;
  frm_troca_senha.free;
end;

procedure Tfrm_principal.I40002001Click(Sender: TObject);
begin
  Application.CreateForm(Tfrm_baixa_manual,frm_baixa_manual);
  frm_baixa_manual.ShowModal;
  frm_baixa_manual.Free;
end;

procedure Tfrm_principal.eClick(Sender: TObject);
begin
  Application.Createform(Tfrm_formas_pagto, frm_formas_pagto);
  frm_formas_pagto.ShowModal;
  frm_formas_pagto.free;
end;

procedure Tfrm_principal.I20004001Click(Sender: TObject);
begin
    if dm.LeIni(2,'CAIXA','status') = '1' then
   begin
    showmessage('Não é póssivel abrir o caixa, pois o mesmo já se encontra aberto!!');
    exit;
   end
  else
   begin
     Application.CreateForm(TfrmAberturaCaixa,frmAberturaCaixa);
     frmAberturaCaixa.ShowModal;
     FreeAndNil(frmAberturaCaixa);
  end;
end;
procedure Tfrm_principal.inicia;
begin
  registrarSistema:=false;
  sistemaRegistrado:=false;
  TrocarOperador := false;
  sairDoSistema := false;
  Application.HintColor:=clYellow;
  Application.HintHidePause:=500000;
  dm.deletaDadosREgistroECF;


//  Image1.Picture.LoadFromFile(dm.leini(2,'parametros','logo_principal'));

  dm.dbrestaurante.Connected:=false;
  If conexao_banco = false then
  begin
    Application.Terminate;
  end;



  senha_correta:=false;
  cor_foco_edit:=clMoneyGreen;

  Application.CreateForm(TfrmLoginTouch ,frmLoginTouch);
  frmLoginTouch.tipo_teste:=0;
  frmLoginTouch.ShowModal;
  frmLoginTouch.free;





  if (senha_correta = true) then
   begin

     busca_parametros;
     permissoes_do_menu;
//     skindata1.UpdateSkinControl(frm_principal);

     testaLicencaEserial(true);
     timerVerificaLicenca.Enabled:=true;
     verificaAlteracaoRelogio.Enabled:=true;
     dm.configuraBalancas();
     dm.parametrizaAcbrNFE(moNFe,false,true);



     if ( StrToInt(dm.LeIni(2,'SALAO','estacaoLancamentoSalao') ) =1 ) then
     begin

      if ( StrToInt(dm.LeIni(2,'SALAO','modulo') ) =1 ) then
        I20001004.Click
      else
       I30002001.Click;
     end;
   end
  else
    begin
      Application.terminate;
    end;





{
  pnECF.Visible := true;
  lbECF .Caption := 'Iniciando comunicação'+#13#10+'com o provedor de TEF'+#13#10+#13#10+#13#10+'Por favor, aguarde....';
  Application.ProcessMessages;
  Sleep(4000);
  if (dm.autenticaComTEFCappta() = false ) then
   begin
    pnECF.Visible := true;
    lbECF.Caption := ' Falha na autenticão'+#13#10+#13#10+' com o provedor de TEF! '+#13#10+#13#10+' Verifique o problema e reinicie o sistema.';
    sleep(3000);
    pnECF.Visible := false;

   end
  else
   begin
    pnECF.Visible := true;
    lbECF.Caption := 'Autenticação'+#13+' com  TEF realizada. '+#13#10+#13#10+' Iniciando o sistema...';
    pnECF.Repaint;
    Application.ProcessMessages;
    sleep(4000);
    pnECF.Visible := false;

   end;

 }


end;







procedure Tfrm_principal.testaLicencaEserial(primeira : boolean);
var
 l : string;
  HashValue : Longint;
  Code : TCode;
  resultado : string;

begin
  serial.CheckCode(true);

 if primeira then
 begin
  try
    licenca:= dm.decriptografa(licenca,'1320');
  except
   begin
     Application.CreateForm(TfrmLicenca, frmLicenca);
     frmLicenca.showmodal;
     frmLicenca.Free;
     Application.Terminate;
   end;
  end;
 end;


  HexToBuffer(licenca, Code, SizeOf(Code));
  if GetSpecialCodeValue(cKey, Code) <> StringHashElf(cnpj + serial.Modifier ) then
   begin
     Application.CreateForm(TfrmLicenca, frmLicenca);
     frmLicenca.showmodal;
     frmLicenca.Free;
     Application.Terminate;
   end
  else
   begin
     serial.CheckCode(true);
     if(testeSerialValido = false) then
      begin
        Application.CreateForm(TfrmSistemaBloqueado,frmSistemaBloqueado);
        frmSistemaBloqueado.showmodal;
        frmSistemaBloqueado.free;
        if (registrarSistema = true) then
         begin
           Application.CreateForm(TfrmRegistroSistema, frmRegistroSistema);
           frmRegistroSistema.ShowModal;
           frmRegistroSistema.Free;
           if sistemaRegistrado = false then
            begin
              dm.exibe_painel_erro('O registro do sistema foi cancelado! O Sistema será encerrado e permanecerá bloqueado','continuar...');
              Application.Terminate;
            end;
         end
      end
        else
          Begin

            btLicenca.Caption := 'Expira em: '+FormatDateTime('DD/MM/YYY',date+diasExpiracaoSistema);
            if diasExpiracaoSistema <= 6 then
             begin
               timePanelLicenca.Enabled:=true;
             end
            else
              begin
               timePanelLicenca.Enabled:=false;
              end;

              

            if (diasExpiracaoSistema <= 3) then
             begin
               registrarSistema:=false;
               Application.CreateForm(TfrmAvisoExpiracao,frmAvisoExpiracao);
               if diasExpiracaoSistema > 0 then
               begin
                 if diasExpiracaoSistema > 1 then
                  frmAvisoExpiracao.lbExpiracao.Caption:=Inttostr(diasExpiracaoSistema)+' DIAS'
                 else
                  begin
                   frmAvisoExpiracao.lbaviso.caption:='Sua licença expira';
                   frmAvisoExpiracao.lbExpiracao.Caption:='AMANHÃ';
                   frmAvisoExpiracao.lbaviso1.Visible:=false;

                  end;
               end
               else
                 begin
                   frmAvisoExpiracao.lbaviso.caption:='Sua licença expira';
                   frmAvisoExpiracao.lbExpiracao.Caption:='HOJE';
                   frmAvisoExpiracao.lbaviso1.Visible:=false;
                 end;
               frmAvisoExpiracao.ShowModal;
               frmAvisoExpiracao.free;
               if (registrarSistema = true) then
                begin
                  Application.CreateForm(TfrmRegistroSistema, frmRegistroSistema);
                  frmRegistroSistema.ShowModal;
                  frmRegistroSistema.Free;
                end;
             end;
          end;
   end;
end;

procedure Tfrm_principal.FormActivate(Sender: TObject);
begin
  if (iniciado = false) then
 begin
  inicia;
   if (usarAcbr = 1 ) then
    begin
     MD5_APLICATIVO:= GeraMD5PAFECF();
//      iniciarECF();
//   WinExec(pchar('C:\Arquivos de programas\Firebird\Firebird_2_1\bin\gbak.exe -g -b -z -v -l c:\restaurante\restaurante.gdb c:\restaurante\copia.gbk -user sysdba -password masterkey'),0);
  end;
  iniciado:=true;
 end;
end;



procedure Tfrm_principal.iniciarECF();
var                     
 estado : TACBrECFEstado;
novoECF : TACBrAACECF;                             
begin

frm_principal.Enabled:=false;

if ( ( impressora_fiscal_instalada =1) and (usarAcbr=1) )then
begin
 caminhoArquivoAuxiliarPAF := getPastaSistemaWindows+'\AX'+cnpj+'.txt';
 if ( verificaExistenciaArquivoAuxiliarPAF(caminhoArquivoAuxiliarPAF) = false ) then
  begin
    frm_principal.Enabled := true;
    exit;
  end
 else
  begin
//    AAC.NomeArquivoAux := caminhoArquivoAuxiliarPAF;
  end;


 pnECF.Visible:=true;
 frm_principal.ECF.Desativar;
 frm_principal.ecf.Porta  := portaDaImpressoraFiscal;


  case marca_impressora_fiscal of
   1: begin
        ECF.Modelo := ecfBematech;
      end;
   2: begin
        ECF.Modelo := ecfDaruma;
      end;

   3: begin
        ECF.Modelo := ecfFiscNET;
      end;

   4: begin
        ECF.Modelo := ecfEpson;
      end;

  end;

       try
        begin
         frm_principal.ECF.Desativar;
         frm_principal.ECF.Ativar;
         try
          Estado := frm_principal.ecf.Estado;
         except
           begin
             frm_principal.enabled:=true;
             dm.exibe_painel_erro('Erro ao consultar O estado do ECF','');
           end;
         end;
         if estado <> estLivre then
          begin
            if estado = estRequerZ then
             begin
               lbECF.Caption:='Gerando dados do sintegra e emitindo Z....';
               ReducaoZ;
               sleep(3000);
             end
            else
             frm_principal.ECF.CorrigeEstadoErro;
          end;


         lbECF.Caption:='Iniciada, capturando variáveis....';
         sleep(3000);
        end;
       except
         begin
            frm_principal.enabled:=true;
            pnECF.Visible:=false;
            dm.exibe_painel_erro('Erro ao  inicializar ECF. Feche o sistema e reinicie o ECF (Ligar e desligar o ECF)','continuar..');
            exit;
         end;
       end;

       try
         begin
           frm_principal.ecf.CarregaAliquotas;
           frm_principal.ecf.CarregaFormasPagamento;
           frm_principal.ecf.CarregaComprovantesNaoFiscais;
           frm_principal.ecf.CarregaUnidadesMedida;

           pnECF.Caption:='Variáveis capturadas, finalizando inicialização...';
           sleep(4000);
        end;
       except
        begin
          frm_principal.enabled:=true;
          pnECF.Visible:=false;
          dm.exibe_painel_erro('Erro ao carregar variáveis do ECF','...');
          exit;
        end;


       end;


   try
     Estado := frm_principal.ecf.Estado;
   except
    begin
       frm_principal.enabled:=true;
       dm.exibe_painel_erro('Erro ao consultar O estado do ECF','');
    end;
   end;


 if  estado <> estLivre  then
  begin
    if estado <> estNaoInicializada then
     begin
       frm_principal.enabled:=true;
       dm.exibe_painel_erro('Não é possível continuar, estado do ECF: ','');
       exit;
     end
    else
     begin
       frm_principal.enabled:=true;
       dm.exibe_painel_erro('O ECF encontra-se desativado, para reativar pressione enter.','Reativar ECF');

       try
        begin
         frm_principal.ECF.Desativar;
         frm_principal.ECF.Ativar;
        end;
       except
         begin
            frm_principal.enabled:=true;
            dm.exibe_painel_erro('Erro ao reativar o ECF. Feche o sistema e desligue/ligue o ECF','continuar..');
            exit;
         end;
       end;

       try
         begin
           frm_principal.ecf.CarregaAliquotas;
           frm_principal.ecf.CarregaFormasPagamento;
           frm_principal.ecf.CarregaComprovantesNaoFiscais;
           frm_principal.ecf.CarregaUnidadesMedida;
        end;
       except
        begin
          frm_principal.enabled:=true;
          dm.exibe_painel_erro('Erro ao carregar variáveis do ECF','...');
          exit;
        end;
       end;
     end;
  end;
  frm_principal.enabled:=true;
//  programaFormasPGTO;
  pnECF.Visible :=false;



  dm.qryDadosPAF.Active:= false;
  dm.qryDadosPAF.Active:= true;
//  AAC.NomeArquivoAux := caminhoArquivoAuxiliarPAF;
//  showmessage(caminhoArquivoAuxiliarPAF);

//  frm_principal.aac.AbrirArquivo;

{
  frm_principal.AAC.IdentPAF.Empresa.RazaoSocial   :=     dm.qryDadosPAFNOME_EMPRESA.value;
  frm_principal.AAC.IdentPAF.Empresa.CNPJ          :=     dm.qryDadosPAFCNPJ.Value;
  frm_principal.AAC.IdentPAF.Empresa.IE            :=     dm.qryDadosPAFINSCRICAO_ESTADUAL.Value;
  frm_principal.AAC.IdentPAF.Empresa.IM            :=     dm.qryDadosPAFINSCRICAO_MUNICIPAL.Value;
  frm_principal.AAC.IdentPAF.Paf.Nome              :=     dm.qryDadosPAFNOME_PAF.Value;
  frm_principal.AAC.IdentPAF.Paf.Versao            :=     dm.qryDadosPAFVERSAO_PAF.Value;
  frm_principal.AAC.IdentPAF.Paf.PrincipalExe.Nome :=    'realrest.exe';
  frm_principal.AAC.IdentPAF.Paf.PrincipalExe.MD5  :=     MD5_APLICATIVO;

  frm_principal.AAC.SalvarArquivo;
 }

  dm.qryDadosPAF.Active:=true;
  dm.qryDadosPAF.Edit;
  dm.qryDadosPAFMD5_PAF.Value := MD5_APLICATIVO;
  dm.qryDadosPAF.Post;
  dm.dbrestaurante.ApplyUpdates([dm.qryDadosPAF]);
  dm.qryDadosPAF.Active:= true;

  frm_principal.ecf.IdentificaPAF('MD5: '+  MD5_APLICATIVO ,'Aplicativo: '+ dm.qryDadosPAFNOME_PAF.Value+' '+  dm.qryDadosPAFVERSAO_PAF.Value);


  validacaoArquivoAuxiliarPaf(caminhoArquivoAuxiliarPAF);




  
end

else
 begin
   pnECF.Visible :=true;
   frm_principal.enabled:=true;
   pnECF.Caption := 'ECF NÃO INSTALADO!!';
   timerInformacoes.Interval :=2000;
   timerInformacoes.Enabled:=false;
   timerInformacoes.Enabled:=true;
 end;

end;

Function GetStateK (Key: integer): boolean;
begin
Result := Odd (GetKeyState (Key));
end;


procedure Tfrm_principal.fdfdI60001000Click(Sender: TObject);
begin
{  Application.CreateForm(Tfrm_manutencao,frm_manutencao);
  frm_manutencao.showmodal;
  frm_manutencao.free; }
end;

procedure Tfrm_principal.BitBtn6Click(Sender: TObject);
begin
 if MessageDlg('Confirma saída do sistema ?',mtConfirmation,[MbYes,mbNo],0) = Mryes then
 Application.Terminate;
end;


procedure Tfrm_principal.HJGHG342Click(Sender: TObject);
begin
 Application.CreateForm(Tfrm_rel_gasto_diario,frm_rel_gasto_diario);
 frm_rel_gasto_diario.showmodal;
 frm_rel_gasto_diario.free;
end;


procedure Tfrm_principal.I10009000Click(Sender: TObject);
begin
  Application.CreateForm(TfrmCadTiposBaixaEstoque,frmCadTiposBaixaEstoque);
  frmCadTiposBaixaEstoque.ShowModal;
  frmCadTiposBaixaEstoque.free;
end;



Function Tfrm_principal.SerialNum(FDrive:String) :String;
Var
  Serial:DWord;
  DirLen,Flags: DWord;
  DLabel : Array[0..11] of Char;
begin
  Try
   GetVolumeInformation(PChar(FDrive+':\'),dLabel,12,@Serial,DirLen,Flags,nil,0);
  Result := IntToHex(Serial,8);
  Except Result :='';
end;
end;




procedure Tfrm_principal.setNFE55VendaAtual(emitirNFE55: boolean);
begin
  nfe55VendaAtual := emitirNFE55;

end;

procedure Tfrm_principal.fClick(Sender: TObject);
begin
  Application.CreateForm(TfrmCadMotivosCancelamento,frmCadMotivosCancelamento);
  frmCadMotivosCancelamento.ShowModal;
  frmCadMotivosCancelamento.free;
end;

procedure Tfrm_principal.I20002013Click(Sender: TObject);
begin
  Application.createform(Tfrm_leitura_mem_fiscal_data,frm_leitura_mem_fiscal_data);
  frm_leitura_mem_fiscal_data.ShowModal;
  frm_leitura_mem_fiscal_data.free;
end;

procedure Tfrm_principal.I50002001Click(Sender: TObject);
begin
  dm.qryauxiliar.Active:=false;
  dm.qryauxiliar.sql.clear;
  dm.qryauxiliar.sql.add('select * from listagem_grupos('+Quotedstr('000')+',1,0)');
  dm.qryauxiliar.active:=true;
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

procedure Tfrm_principal.I10001004Click(Sender: TObject);
begin
  Application.CreateForm(Tfrm_cad_grupos_fornecedores, frm_cad_grupos_fornecedores);
  frm_cad_grupos_fornecedores.ShowModal;
  frm_cad_grupos_fornecedores.Free;
end;

procedure Tfrm_principal.I10009002Click(Sender: TObject);
begin
  Application.CreateForm(Tfrm_cad_contas,frm_cad_contas);
  frm_cad_contas.ShowModal;
  frm_cad_contas.free;
end;

procedure Tfrm_principal.I10001001Click(Sender: TObject);
begin
  Application.CreateForm(Tfrm_cad_fornecedor,frm_cad_fornecedor);
  frm_cad_fornecedor.ShowModal;
  frm_cad_fornecedor.free;
end;


procedure Tfrm_principal.I10002004Click(Sender: TObject);
begin
  Application.CreateForm(Tfrm_cad_tipo_cliente, frm_cad_tipo_cliente);
  frm_cad_tipo_cliente.ShowModal;
  frm_cad_tipo_cliente.Free;

end;

procedure Tfrm_principal.I10002001Click(Sender: TObject);
begin
  Application.CreateForm(Tfrm_cad_clientes,frm_cad_clientes);
  frm_cad_clientes.showmodal;
  frm_cad_clientes.free;
end;









procedure Tfrm_principal.I40001001Click(Sender: TObject);
begin
  Application.CreateForm(Tfrm_entradas,frm_entradas);
  frm_entradas.ShowModal;
  frm_entradas.free;
end;


procedure Tfrm_principal.I30003000Click(Sender: TObject);
begin

 if dm.LeIni(2,'CAIXA','status') = '0' then
   begin
    showmessage('O caixa ainda não foi aberto! Efetue a abertura do caixa para ter acesso a este módulo!');
    exit;
   end
  else
   begin
     application.CreateForm(tfrm_caixa_restaurante,frm_caixa_restaurante);
     frm_caixa_restaurante.ShowModal;
     frm_caixa_restaurante.free;
   end;

end;

procedure Tfrm_principal.I40005002Click(Sender: TObject);
begin
  Application.CreateForm(TfrmCadReg60A,frmCadReg60A);
  frmCadReg60A.showmodal;
  frmCadReg60A.free;
end;

procedure Tfrm_principal.I40005003Click(Sender: TObject);
begin
  Application.CreateForm(TfrmCadReg60M,frmCadReg60M);
  frmCadReg60M.showmodal;
  frmCadReg60M.Free;
end;

procedure Tfrm_principal.I40006001Click(Sender: TObject);
begin
  inherited;
  Application.CreateForm(TfrmCapturaXMLNFE,frmCapturaXMLNFE);
  frmCapturaXMLNFE.ShowModal;
  frmCapturaXMLNFE.Free;
end;

procedure Tfrm_principal.I10006000Click(Sender: TObject);
begin
  Application.CreateForm(TfrmCadUnidades,frmCadUnidades);
  frmCadUnidades.showmodal;
  frmCadUnidades.free;

end;



procedure Tfrm_principal.ytytyttyClick(Sender: TObject);
begin
   Application.CreateForm(TfrmCadastroClientesReduzido,frmCadastroClientesReduzido);
   frmCadastroClientesReduzido.showmodal;
   frmCadastroClientesReduzido.free;


end;

procedure Tfrm_principal.I30001001Click(Sender: TObject);
begin

 if (dm.verificaSeRecebeCouvertEntrada = true) then
  begin
    if (verificaSeCaixaEstaAberto(ultimoCaixaAberto) = false) then
      begin
        Application.CreateForm(TfrmAberturaCaixa,frmAberturaCaixa);
        frmAberturaCaixa.ShowModal;
        FreeAndNil(frmAberturaCaixa);
        if (verificaSeCaixaEstaAberto(ultimoCaixaAberto) = true) then
         begin
           dm.tb_parametros.Active :=true;
           Application.CreateForm(TfrmEntradaClientes, frmEntradaClientes);
           frmEntradaClientes.showmodal;
           frmEntradaClientes.free;
         end;
      end
    else
     begin
       Application.CreateForm(TfrmEntradaClientes, frmEntradaClientes);
       frmEntradaClientes.showmodal;
       frmEntradaClientes.free;
     end;

  end
 else
  begin
    Application.CreateForm(TfrmEntradaClientes, frmEntradaClientes);
    frmEntradaClientes.showmodal;
    frmEntradaClientes.free;
  end;


end;

procedure Tfrm_principal.I30002001Click(Sender: TObject);
begin
 Application.CreateForm(TfrmLiberarCliente, frmLiberarCliente);
 frmLiberarCliente.ShowModal ;
 frmLiberarCliente.Free;

end;

procedure Tfrm_principal.ecf1MsgPoucoPapel(Sender: TObject);
begin
   Self.Top := self.Top;


//  dm.exibe_painel_erro('Pouco papel','');
end;

procedure Tfrm_principal.timerInformacoesTimer(Sender: TObject);
begin
  pnECF.Visible :=false;
end;

procedure Tfrm_principal.leituraX();
var
 estado : string;
begin
try
  Estado := Estados[ frm_principal.ecf.Estado ];
 begin

   ecf.leiturax();
 end;
except
 begin
   dm.exibe_painel_erro('Erro ao efetuar Leitura x'+#10+'Estado do ECF: '+estado,'Continuar...');
 end;
end;
end;

procedure Tfrm_principal.ReducaoZ();
var
 estado : string;
 resposta : string;
 OldTimeOut: Integer;
begin

  OldTimeOut := ecf.TimeOut;
  InputQuery('Confirmação de Redução Z','Digite SIM em letras maiúsculas  para confirmar a redução Z.'+#10+'O ECF ficará bloqueado até o próximo dia fiscal (Caso a Redução Z já tenha sido efetuada) e não será possível a emissão de cupons fiscais nem encerramento de contas.'+#10+#10+' Deseja mesmo continuar ? ',resposta);
  if trim(resposta) ='SIM' then
  begin
     if MessageDlg('Tem certeza ?',mtConfirmation,[mbYes,mbNo],0) = Mryes then
      begin
        Estado := Estados[ frm_principal.ecf.Estado ];
        try
          dm.gerarDadosRegistro60MECF();
          ecf.TimeOut := 600;
          ECF.ReducaoZ();
          ecf.TimeOut := OldTimeOut;

          except

          end;


        end;



     end;


end;
function Tfrm_principal.DifHora(Inicio,Fim : String):String;
{Retorna a diferença entre duas horas}
var
  FIni,FFim : TDateTime;
begin
Fini := StrTotime(Inicio);
FFim := StrToTime(Fim);
If (Inicio > Fim) then
    begin
    Result := TimeToStr((StrTotime('23:59:59')-Fini)+FFim)
    end
else
   begin
   Result := TimeToStr(FFim-Fini);
   end;
end;

procedure Tfrm_principal.I20001002Click(Sender: TObject);
begin


    if  ( StrToInt(dm.LeIni(1,'IMPRESSORA_FISCAL','instalada')) = 1 ) then
     begin
      if  (validacaoArquivoAuxiliarPaf(caminhoArquivoAuxiliarPAF) = false) then
       begin
         exit;
       end;
     end;



 if (verificaSeCaixaEstaAberto(ultimoCaixaAberto) = false) then
   begin
    Application.CreateForm(TfrmAberturaCaixa,frmAberturaCaixa);
    frmAberturaCaixa.ShowModal;
    FreeAndNil(frmAberturaCaixa);

 if (verificaSeCaixaEstaAberto(ultimoCaixaAberto) = true) then
     begin
     dm.tb_parametros.Active :=true;
     voltarParaCaixa :=2;
     Application.CreateForm(Tfrm_caixa_restaurante , frm_caixa_restaurante);
     frm_caixa_restaurante.ShowModal;
     frm_caixa_restaurante.Free;

     end;
   end
 else
   begin
     voltarParaCaixa :=2;
     Application.CreateForm(Tfrm_caixa_restaurante, frm_caixa_restaurante);
     frm_caixa_restaurante.ShowModal;
     frm_caixa_restaurante.Free;
   end;


   
end;

procedure Tfrm_principal.I10005000Click(Sender: TObject);
begin
  Application.CreateForm(Tfrm_cad_itens_estoque, frm_cad_itens_estoque);
  frm_cad_itens_estoque.ShowModal;
  frm_cad_itens_estoque.free;
end;

procedure Tfrm_principal.AdvToolButton1Click(Sender: TObject);
begin

  dm.qryProjecaoDespesasRD.Active := true;
  Application.CreateForm(TfrmProjecaoDespesasRD,frmProjecaoDespesasRD);
  frmProjecaoDespesasRD.ShowModal;
  frmProjecaoDespesasRD.free;
end;

procedure Tfrm_principal.AdvToolButton4Click(Sender: TObject);
begin
  if dm.verificaPermissaoAcao('I20001004') = true then
  begin
    I20001004.Click;
  end;
end;

procedure Tfrm_principal.AdvToolButton13Click(Sender: TObject);
begin


if dm.verificaPermissaoAcao('I10008000') = true then
 begin
  I10006000.Click;
 end;
end;

procedure Tfrm_principal.AdvToolButton6Click(Sender: TObject);
begin
if dm.verificaPermissaoAcao('I30001001') = true then
 begin
   I30001001.Click;
 end;
end;

procedure Tfrm_principal.AdvToolButton5Click(Sender: TObject);
begin
if dm.verificaPermissaoAcao('I30002001') = true then
 begin
   I30002001.Click;
 end;

end;

procedure Tfrm_principal.AdvToolButton7Click(Sender: TObject);
begin
  menu_sair.Click;
end;





procedure Tfrm_principal.programaFormasPGTO;
var
 q                : TIBQuery;
 bo : boolean;
 descricao : string;
 rp : string;
begin

 q := TIBQuery.Create(self);
 q.Database := dm.dbrestaurante;
 q.Transaction := dm.transacao;
 q.Active:=false;
 q.sql.clear;

 q.Active:=false;
 q.SQL.add('select * from formas_pagamento');
 q.Active:=true;

 while not q.Eof do
 begin
  descricao :=q.FieldByName('descricao').value;
  bo:=false;
  rp:=q.FieldByName('rp').value;
  try
    ECF.ProgramaFormaPagamento(descricao,bo,rp);
  except
  end;
  q.Next;
 end;                   

end;



procedure Tfrm_principal.I10010000Click(Sender: TObject);
begin
  inherited;
   Application.CreateForm(TfrmCadTiposSangria, frmCadTiposSangria);
   frmCadTiposSangria.showmodal;
   frmCadTiposSangria.free;
end;



procedure Tfrm_principal.I20001004Click(Sender: TObject);
begin
  inherited;
  tipo_cupom:=1;
  Application.CreateForm(TfrmLancamentosSalao, frmLancamentosSalao);
  frmLancamentosSalao.ShowModal;
  frmLancamentosSalao.Free;

end;

procedure Tfrm_principal.serialChangeCode(Sender: TObject;
  Code: TCode);
var
  s    : string;
begin
    s := BufferToHex(Code, SizeOf(Code));
    dm.gravaini('BANCO_DE_DADOS','release',dm.criptografa(s,'1320'));
end;
procedure Tfrm_principal.serialChecked(Sender: TObject;
  Status: TCodeStatus);
var
  S : string;
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

procedure Tfrm_principal.serialGetCode(Sender: TObject;
  var Code: TCode);
var
  Ini : TIniFile;
  serial   : string;
begin
    serial := dm.LeIni(2,'BANCO_DE_DADOS','release');
    try
      serial:=dm.decriptografa(serial,'1320');
    except
     begin
       serial:='';
     end;
    end;
    HexToBuffer(serial, Code, SizeOf(Code));
//    statusbar.Panels[5].Text:='Código Atual: '+serial;

end;
procedure Tfrm_principal.serialGetModifier(Sender: TObject;
  var Value: Integer);
begin
  value:=OgMakeKeys1.GenerateMachineModifier();
end;



procedure Tfrm_principal.timerVerificaLicencaTimer(Sender: TObject);
begin
  inherited;
    testaLicencaEserial(false);


end;

procedure Tfrm_principal.I10012000Click(Sender: TObject);
begin
  inherited;
  Application.CreateForm(TfrmCadObsPreparo,frmCadObsPreparo);
  frmCadObsPreparo.showmodal;
  frmCadObsPreparo.free;
end;

procedure Tfrm_principal.I20001003Click(Sender: TObject);
begin
  inherited;
     if (verificaSeCaixaEstaAberto(ultimoCaixaAberto) = false) then
       begin
        Application.CreateForm(TfrmAberturaCaixa,frmAberturaCaixa);
        frmAberturaCaixa.ShowModal;
        FreeAndNil(frmAberturaCaixa);
        tipo_cupom :=1;

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
        frmExpedicaoDelivery.free;           frmPrincipalDelivery.free;
       end;



end;


procedure Tfrm_principal.I60003001Click(Sender: TObject);
begin
  inherited;
  dm.transacao.Active:=false;
  dm.transacao.Active:=true;
  dRelatorios.qryParametros.Active:=true;
  dRelatorios.qryProdutos.Active:=false;
  dRelatorios.qryProdutos.SQL.clear;
  dRelatorios.qryProdutos.SQL.clear;
  dRelatorios.qryProdutos.sql.add('select vp.*, al.percentagem,al.descricao as desc_aliquota,mp.descricao as miniprinter from v_produtos vp');
  dRelatorios.qryProdutos.sql.add(' inner join aliquotas al on (al.cod_aliquota = vp.cod_aliquota)');
  dRelatorios.qryProdutos.sql.add('inner join miniprinters mp on (mp.cod_miniprinter  = vp.cod_mini_printer)');
  dRelatorios.qryProdutos.sql.add(' order by cod_g_raiz,cod_g_pai,cod_grupo');
  dRelatorios.rpt.LoadFromFile(patchAplicacao+'relatorios\ListagemGrupos.fr3',true);
  dRelatorios.qryProdutos.Active:=true;
  dRelatorios.rpt.ShowReport(true);
  dRelatorios.qryProdutos.Active:=false;

end;

procedure Tfrm_principal.I60006001Click(Sender: TObject);
begin
  inherited;
  dm.transacao.Active:=false;
  dm.transacao.Active:=true;
  dRelatorios.qryParametros.Active:=true;
  dRelatorios.qryUnidades.Active:=false;
  dRelatorios.qryUnidades.SQL.clear;
  dRelatorios.qryUnidades.SQL.clear;
  dRelatorios.qryUnidades.sql.add('select * from unidades order by cod_unidade');
  dRelatorios.rpt.LoadFromFile(patchAplicacao+'relatorios\ListagemUnidades.fr3',true);
  dRelatorios.qryUnidades.Active:=true;
  dRelatorios.rpt.ShowReport(true);
  dRelatorios.qryUnidades.Active:=false;

end;

procedure Tfrm_principal.I60007001Click(Sender: TObject);
begin
  inherited;
  dm.transacao.Active:=false;
  dm.transacao.Active:=true;
  dRelatorios.qryParametros.Active:=true;
  dRelatorios.qryGarcons.Active:=false;
  dRelatorios.qryGarcons.SQL.clear;
  dRelatorios.qryGarcons.SQL.clear;
  dRelatorios.qryGarcons.sql.add('select * from garcons order by cod_garcon');
  dRelatorios.rpt.LoadFromFile(patchAplicacao+'relatorios\ListagemGarcons.fr3',true);
  dRelatorios.qryGarcons.Active:=true;
  dRelatorios.rpt.ShowReport(true);
  dRelatorios.qryGarcons.Active:=false;

end;

procedure Tfrm_principal.I60008001Click(Sender: TObject);
begin
  inherited;
  dm.transacao.Active:=false;
  dm.transacao.Active:=true;
  dRelatorios.qryParametros.Active:=true;
  dRelatorios.qryTiposBaixa.Active:=false;
  dRelatorios.qryTiposBaixa.SQL.clear;
  dRelatorios.qryTiposBaixa.SQL.clear;
  dRelatorios.qryTiposBaixa.sql.add('select * from tipos_baixa order by cod_tipo');
  dRelatorios.rpt.LoadFromFile(patchAplicacao+'relatorios\ListagemTipoBaixas.fr3',true);
  dRelatorios.qryTiposBaixa.Active:=true;
  dRelatorios.rpt.ShowReport(true);
  dRelatorios.qryTiposBaixa.Active:=false;

end;

procedure Tfrm_principal.I60009001Click(Sender: TObject);
begin
  inherited;
  dm.transacao.Active:=false;
  dm.transacao.Active:=true;
  dRelatorios.qryTiposSangria.Active:=false;
  dRelatorios.qryTiposSangria.SQL.clear;
  dRelatorios.qryTiposSangria.SQL.clear;
  dRelatorios.qryTiposSangria.sql.add('select * from tipos_sangria order by codigo');

  dRelatorios.rpt.LoadFromFile(patchAplicacao+'relatorios\ListagemTiposSangria.fr3',true);
  dRelatorios.qryTiposSangria.Active:=true;
  dRelatorios.rpt.ShowReport(true);
  dRelatorios.qryTiposSangria.Active:=false;

end;

procedure Tfrm_principal.I60010001Click(Sender: TObject);
begin
  inherited;
  dm.transacao.Active:=false;
  dm.transacao.Active:=true;
  dRelatorios.qryMotivosEstorno.Active:=false;
  dRelatorios.qryMotivosEstorno.SQL.clear;
  dRelatorios.qryMotivosEstorno.SQL.clear;
  dRelatorios.qryMotivosEstorno.sql.add('select * from motivos_estornos order by codigo');
  dRelatorios.rpt.LoadFromFile(patchAplicacao+'relatorios\ListagemMotivosEstornos.fr3',true);
  dRelatorios.qryMotivosEstorno.Active:=true;
  dRelatorios.rpt.ShowReport(true);
  dRelatorios.qryMotivosEstorno.Active:=false;

end;

procedure Tfrm_principal.I60011001Click(Sender: TObject);
begin
  inherited;
  dm.transacao.Active:=false;
  dm.transacao.Active:=true;
  dRelatorios.qryObsPreparo.Active:=false;
  dRelatorios.qryObsPreparo.SQL.clear;
  dRelatorios.qryObsPreparo.SQL.clear;
  dRelatorios.qryObsPreparo.sql.add('select * from observacoes_padrao order by descricao');
  dRelatorios.rpt.LoadFromFile(patchAplicacao+'relatorios\ListagemObsPreparo.fr3',true);
  dRelatorios.qryObsPreparo.Active:=true;
  dRelatorios.rpt.ShowReport(true);
  dRelatorios.qryObsPreparo.Active:=false;

end;

procedure Tfrm_principal.I60001001Click(Sender: TObject);
begin
  inherited;
  Application.CreateForm(TfrmListagemFornecedores,frmListagemFornecedores);
  frmListagemFornecedores.showmodal;
  frmListagemFornecedores.Free; 
end;

procedure Tfrm_principal.I60001002Click(Sender: TObject);
begin
  inherited;
 dm.transacao.Active:=false;
  dm.transacao.Active:=true;
  dRelatorios.qryParametros.Active:=true;
  dRelatorios.qryGruposFornecedor.Active:=false;
  dRelatorios.qryGruposFornecedor.SQL.clear;
  dRelatorios.qryGruposFornecedor.SQL.clear;
  dRelatorios.qryGruposFornecedor.sql.add('select * from grupo_fornecedor order by codigo');
  dRelatorios.rpt.LoadFromFile(patchAplicacao+'relatorios\ListagemGruposFornecedor.fr3',true);
  dRelatorios.qryGruposFornecedor.Active:=true;
  dRelatorios.rpt.ShowReport(true);
  dRelatorios.qryGruposFornecedor.Active:=false;

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
  Application.CreateForm(TfrmRelatorioEstoqueConferencia ,frmRelatorioEstoqueConferencia);
  frmRelatorioEstoqueConferencia.showmodal;
  frmRelatorioEstoqueConferencia.free;
end;

procedure Tfrm_principal.I70002001Click(Sender: TObject);
begin
  inherited;
  Application.CreateForm(TfrmRelEntradasPorFornecedor,frmRelEntradasPorFornecedor);
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
  Application.CreateForm(TfrmRelEntradasPorItem,frmRelEntradasPorItem);
  frmRelEntradasPorItem.showmodal;
  frmRelEntradasPorItem.free;

end;



procedure Tfrm_principal.FormCreate(Sender: TObject);
var
FileName : pchar;
HMutex: THandle;
begin
  inherited;

  nfe55VendaAtual := false;



   patchAplicacao := ExtractFilePath( Application.ExeName );
  iniciado :=false;
  Application.OnShowHint := MyShowHint;
//  showmessage(patchAplicacao);
  Image1.picture.LoadFromFile(patchAplicacao+'imagens\fundo.jpg');

 FileName := PChar(patchAplicacao+'realrest.exe');


  HMutex:= CreateMutex(nil, False, pCHAR('REAL MANAGER')  );
  if WaitForSingleObject(HMutex, 0) = wait_TimeOut then
  begin
//    Application.MessageBox('O Sistema já está sendo executado!', 'Houve um Erro!', mb_Ok);
    Application.Terminate;
    exit;
  end;

end;

procedure Tfrm_principal.I70004001Click(Sender: TObject);
begin
  inherited;

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
 qryVerificaALteracaoRelogio : TIBQuery;
begin
  inherited;

  dm.transacaoAuxiliar.Active:=false;
  dm.transacaoAuxiliar.Active:=true;
  qryVerificaALteracaoRelogio:=TIBquery.create(frm_principal);
  qryVerificaALteracaoRelogio.database:=dm.dbrestaurante;
  qryVerificaALteracaoRelogio.transaction:=dm.transacaoAuxiliar;
  qryVerificaALteracaoRelogio.Active:=False;

  qryVerificaALteracaoRelogio.Active:=false;
  qryVerificaALteracaoRelogio.sql.clear;
  qryVerificaALteracaoRelogio.SQL.add('select ultimahora,current_timestamp as hora_atual from parametros');
  qryVerificaALteracaoRelogio.Active:=true;


  if (qryVerificaALteracaoRelogio.FieldByName('ultimahora').Value > qryVerificaALteracaoRelogio.FieldByName('hora_atual').Value ) then
   begin
      // Houve tentativa de burlar o serial.
      if serial.GetValue = 1 then
       begin
          verificaAlteracaoRelogio.Enabled:=false;
          dm.gravaini('BANCO_DE_DADOS','RELEASE','');
          testaLicencaEserial(false);

       end;

   end
  else
   begin
     qryVerificaALteracaoRelogio.Active:=false;
     qryVerificaALteracaoRelogio.SQL.Clear;
     qryVerificaALteracaoRelogio.SQL.Add('update parametros set ultimahora=current_timestamp');
     qryVerificaALteracaoRelogio.ExecSQL;
     if dm.transacaoAuxiliar.Active = false then dm.transacaoAuxiliar.Active:=true;
     dm.transacaoAuxiliar.Commit;
     verificaAlteracaoRelogio.Enabled:=true;
   end;


   qryVerificaALteracaoRelogio.Active:=false;
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
  Application.CreateForm(TfrmRelProducaoGarcons,frmRelProducaoGarcons);
  frmRelProducaoGarcons.ShowModal;
  frmRelProducaoGarcons.free;

end;

procedure Tfrm_principal.I70007001Click(Sender: TObject);
begin
  inherited;
  Application.CreateForm(TfrmRelPedidosDeliveryPorCliente,frmRelPedidosDeliveryPorCliente);
  frmRelPedidosDeliveryPorCliente.showmodal;
  frmRelPedidosDeliveryPorCliente.free;

end;

procedure Tfrm_principal.I70007002Click(Sender: TObject);
begin
  inherited;
  Application.CreateForm(TfrmRelContatoEstrategicoDelivery,frmRelContatoEstrategicoDelivery);
  frmRelContatoEstrategicoDelivery.showmodal;
  frmRelContatoEstrategicoDelivery.free;
end;

procedure Tfrm_principal.I70008001Click(Sender: TObject);
begin
  inherited;
  Application.CreateForm(TfrmRelatorioFaturamentoDiarioPeriodoAnalitico,frmRelatorioFaturamentoDiarioPeriodoAnalitico);
  frmRelatorioFaturamentoDiarioPeriodoAnalitico.ShowModal;
  frmRelatorioFaturamentoDiarioPeriodoAnalitico.Free;
end;

procedure Tfrm_principal.I70008002Click(Sender: TObject);
begin
  inherited;
  Application.CreateForm(TfrmRelatorioFaturamentoDiarioSintetico,frmRelatorioFaturamentoDiarioSintetico);
  frmRelatorioFaturamentoDiarioSintetico.showmodal;
  frmRelatorioFaturamentoDiarioSintetico.free;
end;

procedure Tfrm_principal.I70008003Click(Sender: TObject);
begin
  inherited;
  Application.CreateForm(TfrmFaturamentoMensalPeriodoAnalitico,frmFaturamentoMensalPeriodoAnalitico);
  frmFaturamentoMensalPeriodoAnalitico.showmodal;
  frmFaturamentoMensalPeriodoAnalitico.free;
end;

procedure Tfrm_principal.I70008004Click(Sender: TObject);
begin
  inherited;
  Application.CreateForm(TfrmFaturamentoMensalPeriodoSintetico,frmFaturamentoMensalPeriodoSintetico);
  frmFaturamentoMensalPeriodoSintetico.showmodal;
  frmFaturamentoMensalPeriodoSintetico.free;
end;



procedure Tfrm_principal.MyShowHint(var HintStr: string;
var CanShow: Boolean;
var HintInfo: THintInfo);
var i : integer;
begin
for i := 0 to Application.ComponentCount - 1 do
if Application.Components[i] is THintWindow then
with THintWindow(Application.Components[i]).Canvas do
begin
//Font.Name := ''''''''Arial'''''''';
Font.Size := 18;
Font.Style := [fsBold];
HintInfo.HintColor := clYellow;
end;
end;



procedure Tfrm_principal.I10014000Click(Sender: TObject);
begin
  inherited;
  Application.CreateForm(TfrmCadEntregadores,frmCadEntregadores);
  frmCadEntregadores.showmodal;
  frmCadEntregadores.free;

end;




procedure Tfrm_principal.I70007003Click(Sender: TObject);
begin
  inherited;
  Application.CreateForm(TfrmRelPedidosEntregador,frmRelPedidosEntregador);
  frmRelPedidosEntregador.ShowModal;
  frmRelPedidosEntregador.Free;
end;

procedure Tfrm_principal.I10015000Click(Sender: TObject);
begin
  inherited;
  Application.CreateForm(TfrmControleCartoes,frmControleCartoes);
  frmControleCartoes.ShowModal;
  frmControleCartoes.free;
end;

procedure Tfrm_principal.I40005001Click(Sender: TObject);
begin
  inherited;
   Application.CreateForm(TfrmTransformacoesSubmateria,frmTransformacoesSubmateria);
   frmTransformacoesSubmateria.ShowModal;
   frmTransformacoesSubmateria.Free;
end;

procedure Tfrm_principal.I70005002Click(Sender: TObject);
begin
  inherited;
  Application.CreateForm(TfrmRelatorioclientesData,frmRelatorioclientesData);
  frmRelatorioclientesData.ShowModal;
  frmRelatorioclientesData.Free;
end;

procedure Tfrm_principal.I70002004Click(Sender: TObject);
begin
  inherited;
  Application.CreateForm(TfrmRelatorioComprasPorCFOP,frmRelatorioComprasPorCFOP);
  frmRelatorioComprasPorCFOP.showmodal;
  frmRelatorioComprasPorCFOP.Free; 
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
  Application.CreateForm(TfrmRelatorioBaixasManuais,frmRelatorioBaixasManuais);
  frmRelatorioBaixasManuais.ShowModal;
  frmRelatorioBaixasManuais.Free;
   
end;

procedure Tfrm_principal.I70002031Click(Sender: TObject);
begin
  inherited;
  Application.CreateForm(TfrmRelatorioEstoqueReposicao,frmRelatorioEstoqueReposicao);
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

procedure Tfrm_principal.I10016000Click(Sender: TObject);
begin
  inherited;
  Application.CreateForm(TfrmCadSaboresPizza,frmCadSaboresPizza);
  frmCadSaboresPizza.showmodal;
  frmCadSaboresPizza.Free;
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

function Tfrm_principal.GeraMD5PAFECF: String;
var Arquivo : TextFile;
    NomeArq, ArqTexto, aMD5 : String;
    F: TSearchRec;
    Ret: Integer;
    formato : string;
    stringArquivo : string;

begin

  formato:='############################################################************************************************************************************************************************';
  Result := '';
  try
    // Apaga arquivo anterior
    ArqTexto := ExtractFilePath(Application.ExeName)+'ArqMD5.txt';

    if FileExists(ArqTexto) then
       DeleteFile(ArqTexto);

    // cria o arquivo TXT na mesma pasta do sistema

    AssignFile(Arquivo,ArqTexto);
    ReWrite(Arquivo);

    // lista todos os arquivo exe da pasta do aplicativo e gera o MF5

    Ret := FindFirst(ExtractFilePath(Application.ExeName)+'\*.exe', faAnyFile, F);
    try
      while Ret = 0 do
      begin
        if F.Attr and faDirectory <> faDirectory then
        begin
          NomeArq := ExtractFilePath(Application.ExeName)+'\'+F.Name;
          NomeArq := ExtractFilePath(Application.ExeName)+'\'+F.Name;
          aMD5    := EAD.CalcularHashArquivo(NomeArq,dgstMD5 );
          stringArquivo:= formato;
          stringArquivo := dm.organizarCupom(stringArquivo,f.Name,'#');
          stringArquivo := dm.organizarCupom(stringArquivo,aMD5,'*');
          WriteLn(Arquivo,stringArquivo);
        end;
        Ret := FindNext(F);
      end;

    finally
      FindClose(F);
    end;


    Ret := FindFirst(ExtractFilePath(Application.ExeName)+'\*.dll', faAnyFile, F);
    try
      while Ret = 0 do
      begin
        if F.Attr and faDirectory <> faDirectory then
        begin
          NomeArq := ExtractFilePath(Application.ExeName)+'\'+F.Name;
          aMD5    := EAD.CalcularHashArquivo(NomeArq,dgstMD5 );
          stringArquivo:= formato;
          stringArquivo := dm.organizarCupom(stringArquivo,f.Name,'#');
          stringArquivo := dm.organizarCupom(stringArquivo,aMD5,'*');
          WriteLn(Arquivo,stringArquivo);
        end;
        Ret := FindNext(F);
      end;

    finally
      FindClose(F);
    end;

    Closefile(Arquivo);
    // gera MD5 do arquivo texto

  finally
      result := EAD.CalcularHashArquivo(ArqTexto,dgstMD5 );
  end;  

end;



function  Tfrm_principal.getNFE55VendaAtual() : boolean;
begin
  Result := nfe55VendaAtual;

end;

procedure Tfrm_principal.AACGetChave(var Chave: String);
begin
  inherited;
  Chave :='1234';
end;

procedure Tfrm_principal.I10017000Click(Sender: TObject);
begin
  inherited;
  Application.CreateForm(TfrmCadCidade,frmCadCidade);
  frmCadCidade.showmodal;
  frmCadCidade.free;
end;



procedure Tfrm_principal.I50000001Click(Sender: TObject);
begin
  inherited;
  Application.CreateForm(TfrmCadNotasConsumidor,frmCadNotasConsumidor);
  frmCadNotasConsumidor.ShowModal;
  frmCadNotasConsumidor.Free;
end;

procedure Tfrm_principal.I70009001Click(
  Sender: TObject);
begin
  inherited;
  Application.CreateForm(TfrmRelatorioNotasConsumidor,frmRelatorioNotasConsumidor);
  frmRelatorioNotasConsumidor.ShowModal;
  frmRelatorioNotasConsumidor.Free;
end;

procedure Tfrm_principal.I40004001Click(Sender: TObject);
begin
  inherited;
  application.CreateForm(TfrmCadNotasTransporte,frmCadNotasTransporte);
  frmCadNotasTransporte.showmodal;
  frmCadNotasTransporte.free;
end;

procedure Tfrm_principal.I70020002Click(Sender: TObject);
begin
  inherited;
  Application.CreateForm(TfrmGerarSpedFiscal,frmGerarSpedFiscal);
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

procedure Tfrm_principal.I70010015Click(Sender: TObject);
begin
  inherited;
  Application.CreateForm(TfrmRelNotasFrete,frmRelNotasFrete);
  frmRelNotasFrete.showmodal;
  frmRelNotasFrete.free; 
end;

procedure Tfrm_principal.I70010020Click(Sender: TObject);
begin
  inherited;
  Application.CreateForm(TfrmRelConfLivrosEntradaXSistema,frmRelConfLivrosEntradaXSistema);
  frmRelConfLivrosEntradaXSistema.showmodal;
  frmRelConfLivrosEntradaXSistema.free;
end;

procedure Tfrm_principal.I50000002Click(Sender: TObject);
begin
  inherited;
  Application.CreateForm(Tfrm_saidas,frm_Saidas);
  frm_Saidas.ShowModal;
  frm_Saidas.free;
end;

procedure Tfrm_principal.I70009002Click(Sender: TObject);
begin
  inherited;
  Application.CreateForm(TfrmRelSaidasPorFornecedor,frmRelSaidasPorFornecedor);
  frmRelSaidasPorFornecedor.ShowModal;
  frmRelSaidasPorFornecedor.Free;
end;

procedure Tfrm_principal.I70011001Click(Sender: TObject);
begin
  inherited;
  Application.CreateForm(TfrmRelFaturasAbertasPorFaturamento,frmRelFaturasAbertasPorFaturamento);
  frmRelFaturasAbertasPorFaturamento.showmodal;
  frmRelFaturasAbertasPorFaturamento.free;
end;

procedure Tfrm_principal.I70011002Click(Sender: TObject);
begin
  inherited;
  Application.CreateForm(TfrmRelFaturasAbertasPorVencimento,frmRelFaturasAbertasPorVencimento);
  frmRelFaturasAbertasPorVencimento.showmodal;
  frmRelFaturasAbertasPorVencimento.free;
end;

procedure Tfrm_principal.I70011003Click(Sender: TObject);
begin
  inherited;
  Application.CreateForm(TfrmRelFaturasAbertasDetalhada,frmRelFaturasAbertasDetalhada);
  frmRelFaturasAbertasDetalhada.showmodal;
  frmRelFaturasAbertasDetalhada.free;
end;

procedure Tfrm_principal.I80001001Click(Sender: TObject);
begin
  inherited;
  Application.CreateForm(TfrmLancamentoContasApagar, frmLancamentoContasApagar);
  frmLancamentoContasApagar.ShowModal;
  frmLancamentoContasApagar.Free;
end;

procedure Tfrm_principal.I70006002Click(Sender: TObject);
begin
  inherited;
  Application.CreateForm(TfrmRelProducaoGarconsSintetico,frmRelProducaoGarconsSintetico);
  frmRelProducaoGarconsSintetico.ShowModal;
  frmRelProducaoGarconsSintetico.Free;

end;

procedure Tfrm_principal.I70006003Click(Sender: TObject);
begin
  inherited;
  Application.CreateForm(TfrmRelTaxaServico,frmRelTaxaServico);
  frmRelTaxaServico.ShowModal;
  frmRelTaxaServico.Free;
end;

procedure Tfrm_principal.I80001005Click(Sender: TObject);
begin
  inherited;
   Application.CreateForm(TfrmManutencaoContasApagar,frmManutencaoContasApagar);
  frmManutencaoContasApagar.showmodal;
  frmManutencaoContasApagar.free

end;

procedure Tfrm_principal.I60012001Click(Sender: TObject);
begin
  inherited;
  dm.transacao.Active:=false;
  dm.transacao.Active:=true;
  dm_relatorios.qryPlanoContas.Active := false;
  dm_relatorios.qryPlanoContas.sql.clear;

  dm_relatorios.qryPlanoContas.sql.add(' select rp.cod_conta,rp.cod_formatado,rp.descricao, p_pai.cod_conta as contaPai,p_pai.cod_formatado as codPaiFormatado,p_pai.descricao as descricaoPai,p_raiz.cod_conta as contaRaiz, ');
  dm_relatorios.qryPlanoContas.sql.add('        p_raiz.cod_formatado codRaizFormatado, p_raiz.descricao as descricaoRaiz   from r_plano_contas rp');
  dm_relatorios.qryPlanoContas.sql.add('   inner join     r_plano_contas  p_raiz on (p_raiz.cod_conta = rp.cod_conta_raiz)');
  dm_relatorios.qryPlanoContas.sql.add('  left join       r_plano_contas  p_pai on (p_pai.cod_conta = rp.cod_conta_pai)');
  dm_relatorios.qryPlanoContas.sql.add('   where udf_len(rp.cod_conta) = 6');
  dm_relatorios.qryPlanoContas.sql.add(' order by rp.cod_conta');
  dm_relatorios.qryPlanoContas.Active :=true;
  dm_Relatorios.rpt.LoadFromFile(patchAplicacao+'relatorios\ListagemPlanoContasFinanceiro.fr3',true);
  dm_relatorios.rpt.ShowReport(true);
  dm_relatorios.qryPlanoContas.Active:=false;




end;

procedure Tfrm_principal.btLicencaClick(Sender: TObject);
begin
  inherited;
  Application.CreateForm(TfrmRegistroSistema, frmRegistroSistema);
  frmRegistroSistema.ShowModal;
  frmRegistroSistema.Free;
  testaLicencaEserial(false);

end;

procedure Tfrm_principal.timePanelLicencaTimer(Sender: TObject);
begin
  inherited;
  if btLicenca.Font.Color = clWhite then
    begin
      pnLicenca.Color := clYellow;
      btLicenca.Font.Color := clBlack;
    end
  else
   begin
     pnLicenca.Color := clRed;
     btLicenca.Font.Color := clWhite;
   end;

  timePanelLicenca.Enabled :=false;
  timePanelLicenca.Enabled :=true;
end;

procedure Tfrm_principal.I70012001Click(Sender: TObject);
begin
  inherited;
  dm.transacao.Active :=false;
  dm.transacao.Active :=true;
  dm_relatorios.qryConsumoAtualMesas.Active := false;
  dm_relatorios.qryConsumoAtualMesas.SQL.Clear;
  dm_relatorios.qryConsumoAtualMesas.sql.add(' select * from consumo_atual_mesas order by mesa ');
  dm_relatorios.qryConsumoAtualMesas.Active :=true;
  dm_relatorios.rpt.LoadFromFile(patchAplicacao+'relatorios\RelConsumoAtualMesas.fr3',true);
  dm_relatorios.setPeriodoRelatorio('Data: '+FormatDateTime('DD/MM/YYY',data_do_sistema));
  dm_relatorios.rpt.ShowReport(true);
  dm_relatorios.qryConsumoAtualMesas.Active :=false;

end;






procedure Tfrm_principal.I40003001Click(Sender: TObject);
begin
  inherited;
  Application.CreateForm(TfrmRequisicaoEstoque, frmRequisicaoEstoque);
  frmRequisicaoEstoque.ShowModal;
  frmRequisicaoEstoque.Free; 
end;

procedure Tfrm_principal.ecfMsgPoucoPapel(Sender: TObject);
begin
  inherited;

  if ChecaForm(frm_encerramento) then
   begin
     frm_encerramento.exibirMensagemInformacao('POUCO PAPEL',4000,18, false);
   end
  else
   begin
     exibe_painel_erro('Pouco papel na impressora fiscal...','Continuar');

   end;




end;

procedure Tfrm_principal.I10019000Click(Sender: TObject);
begin
  inherited;
  Application.CreateForm(TfrmCadGruposTouch, frmCadGruposTouch);
  frmCadGruposTouch.showmodal;
  frmCadGruposTouch.Free;
end;

procedure Tfrm_principal.I10020000Click(Sender: TObject);
begin
  inherited;
  Application.CreateForm(TfrmCadGuarnicoes, frmCadGuarnicoes);
  frmCadGuarnicoes.ShowModal;
  frmCadGuarnicoes.Free;

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
  Application.CreateForm(TfrmRelEstatisticoPeriodo,frmRelEstatisticoPeriodo);
  frmRelEstatisticoPeriodo.showmodal;
  frmRelEstatisticoPeriodo.free;
end;

procedure Tfrm_principal.eadGetChavePrivada(var Chave: String);
begin
  inherited;
  chave := memoChavePrivada.Lines.Text;
end;

procedure Tfrm_principal.eadGetChavePublica(var Chave: String);
begin
  inherited;
  Chave := memoChavePublica.Lines.Text;
end;

procedure Tfrm_principal.I70003002Click(Sender: TObject);
begin
  inherited;
   Application.CreateForm(TfrmRelResCaixaTurno,frmRelResCaixaTurno);
   frmRelResCaixaTurno.showmodal;
   frmRelResCaixaTurno.free;
end;

procedure Tfrm_principal.I40007001Click(Sender: TObject);
begin
  inherited;
 Application.CreateForm(TfrmEntradasAvulsas,frmEntradasAvulsas);
  frmEntradasAvulsas.showmodal;
  frmEntradasAvulsas.Free;
end;


function Tfrm_principal.ChecaForm(aForm: Tform): Boolean;
var 
I:Integer;
begin 
    ChecaForm := false; 
    for I := 0 to Screen.FormCount -1 do 
    if Screen.Forms[i] = aForm then 
    begin
    ChecaForm := true; 
    Break; 
    end; 
end;





procedure Tfrm_principal.balanca2LePeso(Peso: Double; Resposta: String);
var
 valid : integer;
begin
  inherited;

   pesoLidoBalanca          := formatFloat('##0.000', Peso );
   respostaLeituraBalanca   := Converte( Resposta ) ;

   if Peso > 0 then
     begin
       sucessoLeituraPeso := true;
     end
   else
    begin
      valid := Trunc(balanca2.UltimoPesoLido);
      case valid of
         0 :
               begin
                dm.exibe_painel_erro('TimeOut !'+sLineBreak+'Coloque o produto sobre a Balança!','Continuar');
                sucessoLeituraPeso := false;
               end;
        -1 :
               begin
                 dm.exibe_painel_erro('Peso Instavel ! ' +sLineBreak+'Tente Nova Leitura','Continuar');
                 sucessoLeituraPeso := false;
               end;
        -2 :
               begin
                 dm.exibe_painel_erro('Peso Negativo !','Continuar');
                 sucessoLeituraPeso := false;
               end;
       -10 :
               begin
                dm.exibe_painel_erro('Sobrepeso !','Continuar');
                sucessoLeituraPeso := false;
               end;
      end;
    end ;
end;

procedure Tfrm_principal.balancaLePeso(Peso: Double; Resposta: AnsiString);
var
 valid : integer;
begin
  inherited;
//   showmessage(formatFloat('##0.000', Peso ));
   pesoLidoBalanca          := formatFloat('##0.000', Peso );
   respostaLeituraBalanca   := Converte( Resposta ) ;

   dm.adicionaLog('Peso lido na funcao :'+pesoLidoBalanca);

   if Peso > 0 then
     begin
       sucessoLeituraPeso := true;
     end
   else
    begin
     valid := Trunc(balanca.UltimoPesoLido);
      case valid of
         0 :
               begin
                dm.exibe_painel_erro('TimeOut !'+sLineBreak+'Coloque o produto sobre a Balança!','Continuar');
                sucessoLeituraPeso := false;
               end;
        -1 :
               begin
                 dm.exibe_painel_erro('Peso Instavel ! ' +sLineBreak+'Tente Nova Leitura','Continuar');
                 sucessoLeituraPeso := false;
               end;
        -2 :
               begin
                 dm.exibe_painel_erro('Peso Negativo !','Continuar');
                 sucessoLeituraPeso := false;
               end;
       -10 :
               begin
                dm.exibe_painel_erro('Sobrepeso !','Continuar');
                sucessoLeituraPeso := false;
               end;
      end;
    end ;
end;


procedure Tfrm_principal.I70020003Click(
  Sender: TObject);
begin
  inherited;
  Application.CreateForm(TfrmRealApuracaoGrupos,frmRealApuracaoGrupos);
  frmRealApuracaoGrupos.showmodal;
  frmRealApuracaoGrupos.free;
end;


procedure Tfrm_principal.Button1Click(Sender: TObject);
var
 lsMemo : integer;
 lAtual : integer;
 cooFinal,COOInicial : string;
 dataMovimento : TDate;
 contadorZ : String;
 totGeral,NumSerie : string;
 vendaBruta : string;
 totCancelamento, totDesconto, codigo: string;
 tot07 : string;
 tot12 : string;
 tot17 : string;
 tot25 : string;
 tot27 : string;
 tot04 : string;
 totSubst : string;
 totIsento : string;
 totNtrib : string;
 q : TIBquery;
begin
  inherited;
  q := TIBQuery.Create(Self);
 q.Database:= dm.dbrestaurante;
 q.Transaction:= dm.transacao;
 NumSerie :='BE050772800700003301';

  memo_avisos.Lines.Clear;
  memo_avisos.Lines.LoadFromFile('c:\mem3.txt');
  lsMemo := memo_avisos.Lines.Count;

  lAtual := 0;
  cooFinal:='325379';

  while lAtual <= memo_avisos.Lines.Count do
   begin
     if ( (trim(memo_avisos.Lines[lAtual]) = 'REDUÇÃO Z') and (trim(memo_avisos.Lines[lAtual+ 1]) <> 'SEM MOVIMENTO FISCAL')  ) then
      begin
       try
        begin
             COOInicial := Inttostr(StrToInt(cooFinal)+1);
           cooFinal := copy(memo_avisos.Lines[lAtual-1],43,10);
           lAtual := lAtual +1;
           dataMovimento := StrToDate(copy(trim(memo_avisos.Lines[lAtual]),19,10));
           lAtual := lAtual + 4;
           contadorZ := FormatFloat('0000',     StrToInt(copy(trim(memo_avisos.Lines[lAtual]),45,10))-1);
           lAtual := lAtual + 8;
           totGeral := trim(dm.TrocaVirgPPto(dm.removePonto(copy(trim(memo_avisos.Lines[lAtual]),28,30))));
           lAtual := lAtual +1;
           vendaBruta := trim(dm.TrocaVirgPPto(dm.removePonto(copy(trim(memo_avisos.Lines[lAtual]),28,30))));
           lAtual := lAtual +1;
           totCancelamento  := trim(dm.TrocaVirgPPto(dm.removePonto(copy(trim(memo_avisos.Lines[lAtual]),28,30))));
           lAtual := lAtual +1;
           totDesconto  := trim(dm.TrocaVirgPPto(dm.removePonto(copy(trim(memo_avisos.Lines[lAtual]),28,30))));

           lAtual := lAtual + 10;

           tot07 :=  trim(dm.TrocaVirgPPto(dm.removePonto(copy(trim(memo_avisos.Lines[lAtual]),13,20))));
           lAtual := lAtual +1;
           tot12 :=  trim(dm.TrocaVirgPPto(dm.removePonto(copy(trim(memo_avisos.Lines[lAtual]),13,20))));
           lAtual := lAtual +1;
           tot17 :=  trim(dm.TrocaVirgPPto(dm.removePonto(copy(trim(memo_avisos.Lines[lAtual]),13,20))));
           lAtual := lAtual +1;
           tot25 :=  trim(dm.TrocaVirgPPto(dm.removePonto(copy(trim(memo_avisos.Lines[lAtual]),13,20))));
           lAtual := lAtual +1;
           tot27 :=  trim(dm.TrocaVirgPPto(dm.removePonto(copy(trim(memo_avisos.Lines[lAtual]),13,20))));
           lAtual := lAtual +1;
           tot04 :=  trim(dm.TrocaVirgPPto(dm.removePonto(copy(trim(memo_avisos.Lines[lAtual]),13,20))));
//           tot04:= '0';
         // Quando tiver 4% somar 4, quando não tiver, somar 3
           lAtual := lAtual +4;
           totSubst  :=  trim(dm.TrocaVirgPPto(dm.removePonto(copy(trim(memo_avisos.Lines[lAtual]),31,20))));
           lAtual := lAtual +1;
           totIsento  :=  trim(dm.TrocaVirgPPto(dm.removePonto(copy(trim(memo_avisos.Lines[lAtual]),31,20))));
           lAtual := lAtual +1;
           totNtrib  :=  trim(dm.TrocaVirgPPto(dm.removePonto(copy(trim(memo_avisos.Lines[lAtual]),31,20))));
           lAtual := lAtual +1;
        end;
       except
        begin
          dm.exibe_painel_erro('Erro lendo a linha '+Inttostr(lAtual)+' '+memo_avisos.Lines[lAtual],'');
          exit;
        end;
       end;
         codigo :=dm.geraCodigo('G_REG60M',8);
         q.Active:=false;
         q.SQL.Clear;
         q.sql.add('insert into reg60M (cod_reg,data,num_serie,num_ord,modelo,coo_ini,coo_fim,cont_z,co_rein_op,');
         q.sql.add('venda_bruta,tot_geral) values (');
         q.sql.add(QuotedStr(codigo)+',');
         q.sql.add(Quotedstr(FormatDateTime('DD.MM.YYY',dataMovimento))+',');
         q.sql.add(QuotedStr(NumSerie)+',');
         q.sql.add(QuotedStr(FormatFloat('000',StrToFloat('3')))+',');
         q.sql.add(QuotedStr('2D')+',');
         q.sql.add(QuotedStr(COOInicial)+',');
         q.sql.add(QuotedStr(cooFinal)+',');
         q.sql.add(QuotedStr(contadorZ)+',');
         q.sql.add(QuotedStr(FormatFloat('000',StrToFloat('3')))+',');
         q.sql.add(vendaBruta+',');
         q.sql.add(totGeral+')');
         q.ExecSQL;


         // Grava Cancelamentos..
         q.Active:=false;
         q.SQL.Clear;
         codigo :=dm.geraCodigo('G_REG60A',8);
         q.sql.add('insert into REG60A (cod_reg,data,num_serie,valor_acumulado,aliquota) values (');
         q.sql.add(''+Quotedstr(codigo)+',');
         q.sql.add(Quotedstr(FormatDateTime('DD.MM.YYY',dataMovimento))+',');
         q.sql.add(QuotedStr(NumSerie)+',');
         q.sql.add(totCancelamento +',');
         q.sql.add(QuotedStr('CANC')+')');
         q.ExecSQL;

         // Grava descontos
         q.Active:=false;
         q.SQL.Clear;
         codigo :=dm.geraCodigo('G_REG60A',8);
         q.sql.add('insert into REG60A (cod_reg,data,num_serie,valor_acumulado,aliquota) values (');
         q.sql.add(''+Quotedstr(codigo)+',');
         q.sql.add(Quotedstr(FormatDateTime('DD.MM.YYY',dataMovimento))+',');
         q.sql.add(QuotedStr(NumSerie)+',');
         q.sql.add(totDesconto+',');
         q.sql.add(QuotedStr('DESC')+')');
         q.ExecSQL;

          // Grava Acresimos
         q.Active:=false;
         q.SQL.Clear;
         codigo :=dm.geraCodigo('G_REG60A',8);
         q.sql.add('insert into REG60A (cod_reg,data,num_serie,valor_acumulado,aliquota) values (');
         q.sql.add(''+Quotedstr(codigo)+',');
         q.sql.add(Quotedstr(FormatDateTime('DD.MM.YYY',dataMovimento))+',');
         q.sql.add(QuotedStr(NumSerie)+',');
         q.sql.add('0'+',');
         q.sql.add(QuotedStr('ACRE')+')');
         q.ExecSQL;


          // Grava substituição
         q.Active:=false;
         q.SQL.Clear;
         codigo :=dm.geraCodigo('G_REG60A',8);
         q.sql.add('insert into REG60A (cod_reg,data,num_serie,valor_acumulado,aliquota) values (');
         q.sql.add(''+Quotedstr(codigo)+',');
         q.sql.add(Quotedstr(FormatDateTime('DD.MM.YYY',dataMovimento))+',');
         q.sql.add(QuotedStr(NumSerie)+',');
         q.sql.add(totSubst+',');
         q.sql.add(QuotedStr('F')+')');
         q.ExecSQL;

           // Grava isencao
         q.Active:=false;
         q.SQL.Clear;
         codigo :=dm.geraCodigo('G_REG60A',8);
         q.sql.add('insert into REG60A (cod_reg,data,num_serie,valor_acumulado,aliquota) values (');
         q.sql.add(''+Quotedstr(codigo)+',');
         q.sql.add(Quotedstr(FormatDateTime('DD.MM.YYY',dataMovimento))+',');
         q.sql.add(QuotedStr(NumSerie)+',');
         q.sql.add(totIsento+',');
         q.sql.add(QuotedStr('I')+')');
         q.ExecSQL;

           // Grava nao tributado
         q.Active:=false;
         q.SQL.Clear;
         codigo :=dm.geraCodigo('G_REG60A',8);
         q.sql.add('insert into REG60A (cod_reg,data,num_serie,valor_acumulado,aliquota) values (');
         q.sql.add(''+Quotedstr(codigo)+',');
         q.sql.add(Quotedstr(FormatDateTime('DD.MM.YYY',dataMovimento))+',');
         q.sql.add(QuotedStr(NumSerie)+',');
         q.sql.add(totNtrib+',');
         q.sql.add(QuotedStr('N')+')');
         q.ExecSQL;



           // Total 7
         q.Active:=false;
         q.SQL.Clear;
         codigo :=dm.geraCodigo('G_REG60A',8);
         q.sql.add('insert into REG60A (cod_reg,data,num_serie,valor_acumulado,aliquota) values (');
         q.sql.add(''+Quotedstr(codigo)+',');
         q.sql.add(Quotedstr(FormatDateTime('DD.MM.YYY',dataMovimento))+',');
         q.sql.add(QuotedStr(NumSerie)+',');
         q.sql.add(tot07  +',');
         q.sql.add(QuotedStr('0700')+')');
         q.ExecSQL;


           // Total 12
         q.Active:=false;
         q.SQL.Clear;
         codigo :=dm.geraCodigo('G_REG60A',8);
         q.sql.add('insert into REG60A (cod_reg,data,num_serie,valor_acumulado,aliquota) values (');
         q.sql.add(''+Quotedstr(codigo)+',');
         q.sql.add(Quotedstr(FormatDateTime('DD.MM.YYY',dataMovimento))+',');
         q.sql.add(QuotedStr(NumSerie)+',');
         q.sql.add(tot12   +',');
         q.sql.add(QuotedStr('1200')+')');
         q.ExecSQL;

           // Total 17
         q.Active:=false;
         q.SQL.Clear;
         codigo :=dm.geraCodigo('G_REG60A',8);
         q.sql.add('insert into REG60A (cod_reg,data,num_serie,valor_acumulado,aliquota) values (');
         q.sql.add(''+Quotedstr(codigo)+',');
         q.sql.add(Quotedstr(FormatDateTime('DD.MM.YYY',dataMovimento))+',');
         q.sql.add(QuotedStr(NumSerie)+',');
         q.sql.add(tot17    +',');
         q.sql.add(QuotedStr('1700')+')');
         q.ExecSQL;


           // Total 25
         q.Active:=false;
         q.SQL.Clear;
         codigo :=dm.geraCodigo('G_REG60A',8);
         q.sql.add('insert into REG60A (cod_reg,data,num_serie,valor_acumulado,aliquota) values (');
         q.sql.add(''+Quotedstr(codigo)+',');
         q.sql.add(Quotedstr(FormatDateTime('DD.MM.YYY',dataMovimento))+',');
         q.sql.add(QuotedStr(NumSerie)+',');
         q.sql.add(tot25    +',');
         q.sql.add(QuotedStr('2500')+')');
         q.ExecSQL;



           // Total 27
         q.Active:=false;
         q.SQL.Clear;
         codigo :=dm.geraCodigo('G_REG60A',8);
         q.sql.add('insert into REG60A (cod_reg,data,num_serie,valor_acumulado,aliquota) values (');
         q.sql.add(''+Quotedstr(codigo)+',');
         q.sql.add(Quotedstr(FormatDateTime('DD.MM.YYY',dataMovimento))+',');
         q.sql.add(QuotedStr(NumSerie)+',');
         q.sql.add(tot27     +',');
         q.sql.add(QuotedStr('2700')+')');
         q.ExecSQL;



           // Total 4
         q.Active:=false;
         q.SQL.Clear;
         codigo :=dm.geraCodigo('G_REG60A',8);
         q.sql.add('insert into REG60A (cod_reg,data,num_serie,valor_acumulado,aliquota) values (');
         q.sql.add(''+Quotedstr(codigo)+',');
         q.sql.add(Quotedstr(FormatDateTime('DD.MM.YYY',dataMovimento))+',');
         q.sql.add(QuotedStr(NumSerie)+',');
         q.sql.add(tot04   +',');
         q.sql.add(QuotedStr('0400')+')');
         q.ExecSQL;





      end;

      lAtual := lAtual + 1;
   end;

   dm.transacao.Commit;
   q.Active:=false;
   FreeAndNil(q);

end;


procedure Tfrm_principal.consertaXMLBSB();
var
 caminhoMes : string;
 caminhoArqOriginal : string;
 diretorioMes : string;
 totalPagamentosNota : Double;
 qtdPagamentos : smallint;
 pgtoAtual : smallint;
 diferenca : double;
 totalItensNota : real;
 qtdItensNota   : integer;
 itemAtual : integer;
 aux,aux2 : string;
 linhaAtualMemo : integer;

 quantidade, valorUnitario, totalProduto : real;
 totalDouble : double;

 codProduto : string;
 baseICMS, valorImposto,totalImposto : double;



begin
  inherited;
{
   dm.qryauxiliar.Active := false;
   dm.qryauxiliar.Active := false;
   dm.qryauxiliar.sql.clear;

   dm.qryauxiliar.sql.add(' select * from vendas v where v.protocolo_nfce <> '+Quotedstr(''));
   dm.qryauxiliar.SQL.add(' and v.data_so between '+QuotedStr('01.01.2016')+' and '+Quotedstr('31.01.2016'));
   dm.qryauxiliar.SQL.add(' and v.chave_nfce='+Quotedstr('53160123239603000146657030000017979000000011'));
   dm.qryauxiliar.Active := true;
   dm.qryauxiliar.First;
 }

   for linhaAtualMemo := 0 to (memo_avisos.Lines.count - 1)  do
    begin
      dm.ACBrNFe1.NotasFiscais.Clear;
      dm.ACBrNFe1.NotasFiscais.LoadFromFile(memo_avisos.Lines[linhaAtualMemo]);
      qtdItensNota := dm.ACBrNFe1.NotasFiscais[0].NFe.Det.Count;


      totalItensNota :=0;
      totalImposto := 0;
      baseICMS := 0;
       for itemAtual := 0 to qtdItensNota -1 do
        begin

         codProduto :=         dm.ACBrNFe1.NotasFiscais[0].NFe.Det[itemAtual].Prod.cProd;
         dm.qryauxiliar.Active  := false;
         dm.qryauxiliar.sql.clear;
         dm.qryauxiliar.sql.add(' select p.cod_produto, p.cod_aliquota, al.percentual_icms   from produtos p ');
         dm.qryauxiliar.sql.add('  inner join aliquotas al on (al.cod_aliquota = p.cod_aliquota)  ');
         dm.qryauxiliar.sql.add('  where p.cod_barras='+QuotedStr(codProduto));
         dm.qryauxiliar.Active := true;

         if   dm.qryauxiliar.fieldbyname('percentual_icms').Value  > 0 then
          begin
            valorImposto := RoundABNT (  ((dm.ACBrNFe1.NotasFiscais[0].NFe.Det[itemAtual].Prod.vProd  * dm.qryauxiliar.fieldbyname('percentual_icms').Value) /100),2);

            dm.ACBrNFe1.NotasFiscais[0].NFe.Det[itemAtual].Imposto.ICMS.vBC    := dm.ACBrNFe1.NotasFiscais[0].NFe.Det[itemAtual].Prod.vProd;
            dm.ACBrNFe1.NotasFiscais[0].NFe.Det[itemAtual].Imposto.ICMS.vICMS  := valorImposto;
            dm.ACBrNFe1.NotasFiscais[0].NFe.Det[itemAtual].Imposto.ICMS.pICMS   := dm.qryauxiliar.fieldbyname('percentual_icms').Value;

            baseICMS :=  baseICMS + dm.ACBrNFe1.NotasFiscais[0].NFe.Det[itemAtual].Prod.vProd;
            totalImposto := totalImposto + valorImposto;
          end;



        end;

        dm.ACBrNFe1.NotasFiscais[0].NFe.Total.ICMSTot.vBC   := baseICMS;
        dm.ACBrNFe1.NotasFiscais[0].NFe.Total.ICMSTot.vICMS := totalImposto;

        dm.ACBrNFe1.NotasFiscais.GerarNFe;
        dm.ACBrNFe1.NotasFiscais[0].GravarXML(copy(dm.ACBrNFe1.NotasFiscais[0].NFe.infNFe.ID,4,60)+'.xml','c:\novosmarco');




//       showmessage(floattostr(totalDouble));


    end;

    showmessage('Correção finalizada!');


{

  while not dm.qryauxiliar.Eof do
   begin
     caminhoArqOriginal := dm.LeIni(2,'NFCE','caminhoArquivosXML')+'\'+dm.qryauxiliar.fieldbyname('chave_nfce').Value+'.xml';
     diretorioMes       := dm.LeIni(2,'NFCE','caminhoArquivosXML')+'\'+FormatDateTime('YYYMM',dm.qryauxiliar.fieldbyname('data_so').value  );
     caminhoMes         := diretorioMes  +'\'+dm.qryauxiliar.fieldbyname('chave_nfce').Value+'.xml';



     if not FileExists(caminhoMes) then
      begin

        memo_avisos.Lines.Add(DateToStr(dm.qryauxiliar.fieldbyname('data').value) +' - '+dm.qryauxiliar.fieldbyname('chave_nfce').Value);
        dm.qryauxiliar2.Active := false;
        dm.qryauxiliar2.SQL.clear;
        dm.qryauxiliar2.SQL.add('update vendas v set v.arq=0 where v.chave_nfce='+QUotedstr(dm.qryauxiliar.fieldbyname('chave_nfce').Value));
        dm.qryauxiliar2.ExecSQL;

      end
     else
      begin



        totalPagamentosNota := 0;
        qtdPagamentos :=  dm.ACBrNFe1.NotasFiscais[0].NFe.pag.Count;

        for pgtoAtual := 0 to qtdPagamentos -1 do
         begin
           totalPagamentosNota := totalPagamentosNota + dm.ACBrNFe1.NotasFiscais[0].NFe.pag[pgtoAtual].vPag;

         end;

        if StrToFloat(varTOstr(totalPagamentosNota)) <> StrToFloat(VarToStr(dm.ACBrNFe1.NotasFiscais[0].NFe.Total.ICMSTot.vNF)) then
         begin
            // se o total de pagamentos for menor, adiciona
            if StrToFloat(varTOstr(totalPagamentosNota)) < StrToFloat(VarToStr(dm.ACBrNFe1.NotasFiscais[0].NFe.Total.ICMSTot.vNF)) then
               begin
                  diferenca :=  StrToFloat(VarToStr(dm.ACBrNFe1.NotasFiscais[0].NFe.Total.ICMSTot.vNF)) - StrToFloat(varTOstr(totalPagamentosNota));
                  dm.ACBrNFe1.NotasFiscais[0].NFe.pag[0].vPag :=  dm.ACBrNFe1.NotasFiscais[0].NFe.pag[0].vPag + diferenca;
               end
            else
               begin
                 // Se for maior, retira
                 diferenca :=   StrToFloat(varTOstr(totalPagamentosNota)) - StrToFloat(VarToStr(dm.ACBrNFe1.NotasFiscais[0].NFe.Total.ICMSTot.vNF));
                 dm.ACBrNFe1.NotasFiscais[0].NFe.pag[0].vPag :=  dm.ACBrNFe1.NotasFiscais[0].NFe.pag[0].vPag - diferenca;
               end;

           memo_avisos.Lines.Add(DateToStr(dm.qryauxiliar.fieldbyname('data').value) +' - '+dm.qryauxiliar.fieldbyname('chave_nfce').Value+' '+FloatToStr(diferenca) )  ;
          dm.ACBrNFe1.NotasFiscais.GerarNFe;
          dm.ACBrNFe1.NotasFiscais[0].GravarXML(copy(dm.ACBrNFe1.NotasFiscais[0].NFe.infNFe.ID,4,60)+'.xml','c:\novosjaneiro');

         end;




        dm.qryauxiliar2.Active := false;
        dm.qryauxiliar2.SQL.clear;
        dm.qryauxiliar2.SQL.add('update vendas v set v.arq=1 where v.chave_nfce='+QUotedstr(dm.qryauxiliar.fieldbyname('chave_nfce').Value));
        dm.qryauxiliar2.ExecSQL;


      end;


     dm.qryauxiliar.Next;
   end;

   dm.transacao.Commit;

//   showmessage('Acabou!');
 }
end;




procedure Tfrm_principal.ConsertaXMLNozu();
var
 caminhoMes : string;
 caminhoArqOriginal : string;
 diretorioMes : string;
 totalPagamentosNota : Double;
 qtdPagamentos : smallint;
 pgtoAtual : smallint;
 diferenca : double;
 totalItensNota : real;
 qtdItensNota   : integer;
 itemAtual : integer;
 aux,aux2 : string;
 linhaAtualMemo : integer;

 quantidade, valorUnitario, totalProduto : real;
 totalDouble : double;

 codProduto : string;
 baseICMS, valorImposto,totalImposto : double;



begin
  inherited;
   dm.qryauxiliar.Active := false;
   dm.qryauxiliar.Active := false;
   dm.qryauxiliar.sql.clear;

   dm.qryauxiliar.sql.add(' select * from vendas v where v.protocolo_nfce = '+Quotedstr('CONTINGENCIA'));
   dm.qryauxiliar.Active := true;
   dm.qryauxiliar.First;


   while not dm.qryauxiliar.eof do
    begin
      dm.ACBrNFe1.NotasFiscais.Clear;
      dm.ACBrNFe1.NotasFiscais.LoadFromFile('C:\restaurante\XML_SAIDAS\NFCE\CONTINGENCIA\201603\'+dm.qryauxiliar.fieldbyname('chave_nfce').Value+'.xml');
      dm.ACBrNFe1.NotasFiscais[0].NFe.pag[0].vPag :=  dm.ACBrNFe1.NotasFiscais[0].NFe.Total.ICMSTot.vNF;
      dm.ACBrNFe1.NotasFiscais.GerarNFe;
      dm.ACBrNFe1.NotasFiscais[0].GravarXML(copy(dm.ACBrNFe1.NotasFiscais[0].NFe.infNFe.ID,4,60)+'.xml','c:\novosnozu');
      dm.qryauxiliar.Next;
    end;


end;


procedure Tfrm_principal.I10004001Click(Sender: TObject);
begin
  inherited;

  Application.CreateForm(Tfrm_produtos,frm_produtos);
  frm_produtos.ShowModal;
  frm_produtos.free;

end;

procedure Tfrm_principal.I10004004Click(Sender: TObject);
begin
  inherited;
  Application.CreateForm(TfrmSelecionaProdutosVendidos, frmSelecionaProdutosVendidos);
  frmSelecionaProdutosVendidos.ShowModal;
  frmSelecionaProdutosVendidos.Free;

end;


procedure Tfrm_principal.SpeedButton5Click(Sender: TObject);
begin
  inherited;
 Application.CreateForm(TfrmMenuFiscal,frmMenuFiscal);
  frmMenuFiscal.ShowModal;
  frmMenuFiscal.free;
end;

procedure Tfrm_principal.SpeedButton2Click(Sender: TObject);
begin
  inherited;

if dm.verificaPermissaoAcao('I20001003') = true then
 begin
   I20001003.Click;
 end;
end;

procedure Tfrm_principal.SpeedButton4Click(Sender: TObject);
begin
  inherited;
  I20001008.Click;
end;

procedure Tfrm_principal.SpeedButton3Click(Sender: TObject);
begin
  inherited;
  I20001004.Click;
end;

procedure Tfrm_principal.Button5Click(Sender: TObject);
begin
  inherited;
//   memo_avisos.Visible := true;
   dm.ListarArquivos('C:\restaurante\XML_SAIDAS\NFCE\ENVIADAS\201512',false,memo_avisos.Lines);
end;

procedure Tfrm_principal.Button6Click(Sender: TObject);
var
 linhaAtual : integer;
 chave : string;
 mesArquivo : string;
begin
  inherited;

  linhaAtual := 0;

  for linhaAtual:= 0 to memo_avisos.lines.count -1  do
   begin
//     chave := copy(memo_avisos.Lines[linhaAtual],0,44);
     chave := memo_avisos.Lines[linhaAtual];
//     showmessage(chave);
     if trim(chave) <> '' then
      begin
        {
        dm.qryauxiliar.Active := false;
        dm.qryauxiliar.sql.clear;
        dm.qryauxiliar.sql.Add(' select * from vendas v  where chave_nfce='+Quotedstr(chave));
        dm.qryauxiliar.SQL.add(' and v.data between '+QuotedStr('01.12.2015')+' and '+Quotedstr('31.12.2015'));
        dm.qryauxiliar.SQL.add(' and v.numero_caixa='+Quotedstr('001'));
        dm.qryauxiliar.Active := true;
               }

         dm.ACBrNFe1.NotasFiscais.Clear;
         dm.ACBrNFe1.NotasFiscais.LoadFromFile(chave);
         mesArquivo := FormatDateTime('YYYMM',dm.ACBrNFe1.NotasFiscais[0].NFe.Ide.dEmi);

          if ( mesArquivo <> '201512' ) then
           begin
            Memo1.Lines.Add(chave);
            DeleteFile(chave);
            //dm.ACBrNFe1.NotasFiscais.Clear;
            //dm.ACBrNFe1.NotasFiscais.LoadFromFile(caminhoNFE,false);

           end;


      end;
   end;

end;

procedure Tfrm_principal.Button8Click(Sender: TObject);
var
 linhaAtual : integer;
 chave : string;
 mesArquivo : string;
begin
  inherited;

  linhaAtual := 0;

  for linhaAtual:= 0 to memo_avisos.lines.count -1  do
   begin
//     chave := copy(memo_avisos.Lines[linhaAtual],0,44);
     chave := memo_avisos.Lines[linhaAtual];
//     showmessage(chave);
     if trim(chave) <> '' then
      begin
         dm.ACBrNFe1.NotasFiscais.Clear;
         dm.ACBrNFe1.NotasFiscais.LoadFromFile(chave);

        dm.qryauxiliar.Active := false;
        dm.qryauxiliar.sql.clear;
        dm.qryauxiliar.sql.Add(' select * from vendas v  where chave_nfce='+Quotedstr( copy(dm.ACBrNFe1.NotasFiscais[0].NFe.infNFe.ID,4,60)  ));
        dm.qryauxiliar.SQL.add(' and v.data between '+QuotedStr('01.12.2015')+' and '+Quotedstr('31.12.2015'));
        dm.qryauxiliar.SQL.add(' and v.numero_caixa='+Quotedstr('003'));
        dm.qryauxiliar.Active := true;

        if dm.qryauxiliar.IsEmpty then
         begin
           DeleteFile(chave); 
           Memo1.Lines.Add( copy(dm.ACBrNFe1.NotasFiscais[0].NFe.infNFe.ID,4,60) );
           memo1.Visible := true;
         end;


      end;
   end;

end;

procedure Tfrm_principal.SpeedButton1Click(Sender: TObject);
begin
  inherited;
  I20001001.Click;
end;

function Tfrm_principal.validaDataDoSistema() : boolean;
var
 estado :string;
 DataEcf : Tdate;
begin

  IF (impressora_fiscal_instalada= 1) THEN
   begin
     dataEcf := StrToDate(FormatDateTime('DD/MM/YYY',frm_principal.ecf.DataHora));


     if dataEcf <> data_do_sistema  then
      begin
       exibe_painel_erro('DATA DO ECF DIVERGE DA DATA DO SISTEMA.  NÃO É POSSÍVEL ABRIR O CAIXA. VERIFIQUE A DATA DO SISTEMA E TENTE NOVAMENTE!','OK');
       result:= false;
       exit;
      end;
   end
  else
   begin
     DataEcf := Date;
     if dataEcf <> data_do_sistema  then
      begin
       exibe_painel_erro('DATA DO COMPUTADOR  DIVERGE DA DATA DO SISTEMA.  NÃO É POSSÍVEL ABRIR O CAIXA. VERIFIQUE A DATA DO SISTEMA E TENTE NOVAMENTE!','OK');
       result:= false;
       exit;
      end;
   end;
   result := true;
end;


procedure Tfrm_principal.Button11Click(Sender: TObject);
begin

  dm.gravarEventoNFE('29160122839426000176650010000000251000000014','saporraxml',now);


end;

procedure Tfrm_principal.I80002002Click(Sender: TObject);
begin
  inherited;
  Application.CreateForm(TfrmProjecaoDespesasRD, frmProjecaoDespesasRD );
  frmProjecaoDespesasRD.ShowModal;
  frmProjecaoDespesasRD.Free;
end;

procedure Tfrm_principal.I80002001Click(Sender: TObject);
begin
  inherited;
  Application.CreateForm(TfrmRelLancamentosRD, frmRelLancamentosRD);
  frmRelLancamentosRD.showmodal;
  frmRelLancamentosRD.Free;  
end;

procedure Tfrm_principal.I80002003Click(Sender: TObject);
begin
  inherited;
  dm.qryProjecaoReceitaRD.Active := true;
  Application.CreateForm(TfrmProjecaoVendas, frmProjecaoVendas);
  frmProjecaoVendas.ShowModal;
  frmProjecaoVendas.Free;

end;

procedure Tfrm_principal.Button2Click(Sender: TObject);
begin
  inherited;
  Application.CreateForm(TfrmInventario, frmInventario);
  frmInventario.ShowModal;
  frmInventario.Free;

end;

procedure Tfrm_principal.Button3Click(Sender: TObject);
var
 LPaisTemp : TPais;
 LPaisTempDAO : TPaisDAO;
begin
  inherited;



{
  LPaisTemp     := TPais.Create;
  LPaisTempDAO  := TPaisDAO.Create;

  try
     LPaisTemp.Codigo := '1058';
     if ( LPaisTempDAO.getDados(LPaisTemp) = true ) then
      begin
        showmessage('O nome do país é '+LPaisTemp.Nome);
      end;

  finally
     FreeAndNil(LPaisTemp);
     FreeAndNil(LPaisTempDAO);
  end;
 }

end;

procedure Tfrm_principal.ACBrBAL1LePeso(Peso: Double; Resposta: String);
begin
  inherited;
   showmessage(formatFloat('##0.000', Peso ));
end;

procedure Tfrm_principal.Button4Click(Sender: TObject);
var
 criptografada : string;
 xmlDoc : string;
 obsCliente : TObsClienteDelivery;
 campos : string;
 memo  :  TStrings;
begin
  inherited;

  campos := '';
  memo := TStringList.Create;
  memo.Clear;

  dm.qryEstrutura.Params[0].Value := 'VENDAS';
  dm.qryEstrutura.Active := true;
  dm.qryEstrutura.First;


  while not dm.qryEstrutura.Eof do
   begin
    campos := campos + dm.qryEstrutura.FieldByName('FIELD_NAME').Value+',';
    memo.Add('declare variable R_'+trim(dm.qryEstrutura.FieldByName('FIELD_NAME').Value)+' '+trim(dm.qryEstrutura.FieldByName('FIELD_TYPE').Value)+';');
    dm.qryEstrutura.Next;
   end;

   memo.Add('begin');
   memo.Add(' ');
   memo.Add(' ');

  dm.qryEstrutura.First;

  while not dm.qryEstrutura.Eof do
   begin
    campos := campos + dm.qryEstrutura.FieldByName('FIELD_NAME').Value+',';
    memo.Add(padright (' R_'+trim(dm.qryEstrutura.FieldByName('FIELD_NAME').Value),40,' ')+' = new.'+trim(dm.qryEstrutura.FieldByName('FIELD_NAME').Value)+';');
    dm.qryEstrutura.Next;
   end;


   dm.adicionaLog(memo.Text);

end;

procedure Tfrm_principal.I70004003Click(Sender: TObject);
begin
  inherited;
  Application.CreateForm(tfrmRelProdutosCSTPis,frmRelProdutosCSTPis);
  frmRelProdutosCSTPis.showmodal;
  frmRelProdutosCSTPis.free; 
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

  Application.CreateForm(TfrmRelProdutosVariosPeriodos,frmRelProdutosVariosPeriodos);
  frmRelProdutosVariosPeriodos.ShowModal;
  frmRelProdutosVariosPeriodos.Free;

end;

procedure Tfrm_principal.ApplicationEvents1Exception(Sender: TObject;
  E: Exception);

begin
  inherited;
    ExceptionManager.Handle(E);

//  EExceptionManager.ExceptionManager.ShowLastExceptionData;

  dm.adicionaLog('Tipo : E.ClassName '+'  '+E.Message);





  if (E.ClassName = 'EIBInterBaseError' ) then
   begin
      if  (  (Pos('Unable to complete network request',E.Message) > 0  ) or (Pos('connection lost to database',E.Message) > 0) or (Pos('unavailable database',E.Message) > 0)  ) then
      begin

         if iniciado = false then
           begin
             BDConectado := conexao_banco();

             if (BDConectado = false) then
              begin
                dm.adicionaLog('O sistema não conseguiu se reconectar ao bando de dados...');
                Application.Terminate;
              end
             else
              begin
                dm.adicionaLog('O sistema se conectou ao banco de dados com sucesso!');
              end;
           end
         else
          begin
            dm.exibe_painel_erro('O sistema foi desconectado do banco de dados. Por favor, verifique as conexões e abra o sistema novamente.','Fechar o sistema');
            Application.Terminate();
          end;
       end
      else
       begin
         exibe_painel_erro ('Erro: '+ E.Message,'Clique aqui para continuar');
       end;

   end

  else
   begin
     exibe_painel_erro ('Erro: '+ E.Message,'Clique aqui para continuar');
   end;

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

procedure  Tfrm_principal.pegarValoresRTTIObj(objeto: TObject);
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
        dm.adicionaLog((objeto.ClassName + '-' + fldRtti.Name +'Tipo : '+ fldRtti.FieldType.ToString  + '  =' + fldRtti.GetValue(objeto).ToString ));


    end;
  finally
    ctxRtti.Free;
  end;
end;


end.
