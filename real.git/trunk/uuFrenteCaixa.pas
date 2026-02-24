unit uuFrenteCaixa;
interface
uses
  Windows,
  Messages,
  SysUtils,                                                            
  uu_modelo_Vazio, ImgList, Controls, ACBrBase, ACBrCalculadora, ExtCtrls,
  StdCtrls, JvExStdCtrls, JvButton, JvCtrls, ComCtrls, JvExComCtrls,
  JvComCtrls, JvGradient,   Mask,
   Classes, JvExControls, JvTransparentButton,
  variants,
  Graphics,


  Forms,
  Dialogs,




  Buttons,
  Grids,
  DBGrids,
  







  db,
  RXCtrls,
  Menus, ibquery,
  dxStatusBar,
   Shader, RxGIF,
   JvExExtCtrls, JvPanel,

  JvFormAutoSize, JvItemsPanel, jpeg, RXClock,
  JvLabel, System.ImageList, RxToolEdit, RxCurrEdit, AdvPanel, dxGDIPlusClasses,
  CurvyControls, Vcl.AppEvnts;

type

  TfrmFrenteCaixa = class(Tfrm_modelo_vazio)
    memo_codigos_formas: TMemo;
    Panel2: TPanel;
    lb_hora: TLabel;
    Timer1: TTimer;
    ACBrCalculadora1: TACBrCalculadora;
    pnMovimentoMesa: TPanel;
    lb_cod_produto: TLabel;
    pnQtde: TPanel;
    Label6: TLabel;
    Label2: TLabel;
    Label13: TLabel;
    Label12: TLabel;
    Label1: TLabel;
    ed_quantidade: TCurrencyEdit;
    edValorUnitario: TCurrencyEdit;
    edTotalProduto: TCurrencyEdit;
    pnDescricaoProduto: TPanel;
    Label3: TLabel;
    ed_descricao_produto: Tedit;
    pnMovimento: TPanel;
    pnBotoes: TPanel;
    Label4: TLabel;
    pnSubtotal: TPanel;
    Label7: TLabel;
    ed_total_conta: TCurrencyEdit;
    Label17: TLabel;
    btFecharConta: TJvTransparentButton;
    B20002003: TJvTransparentButton;
    btOperacoesCaixa: TJvTransparentButton;
    Panel16: TPanel;
    pnGrupos: TPanel;
    Label9: TLabel;
    pgGrupos: TJvPageControl;
    TabSheet1: TTabSheet;
    btgp1: TJvImgBtn;
    btgp2: TJvImgBtn;
    btgp3: TJvImgBtn;
    btgp4: TJvImgBtn;
    btgp5: TJvImgBtn;
    btgp6: TJvImgBtn;
    pnProdutos: TPanel;
    Label16: TLabel;
    pgProdutos: TJvPageControl;
    TabSheet6: TTabSheet;
    btpd01: TJvImgBtn;
    btpd02: TJvImgBtn;
    btpd03: TJvImgBtn;
    btpd04: TJvImgBtn;
    btpd05: TJvImgBtn;
    btpd06: TJvImgBtn;
    btpd07: TJvImgBtn;
    btpd08: TJvImgBtn;
    btpd09: TJvImgBtn;
    btpd10: TJvImgBtn;
    btpd11: TJvImgBtn;
    btpd12: TJvImgBtn;
    btpd13: TJvImgBtn;
    btpd14: TJvImgBtn;
    btpd15: TJvImgBtn;
    btpd16: TJvImgBtn;
    btpd17: TJvImgBtn;
    btpd18: TJvImgBtn;
    btpd19: TJvImgBtn;
    btpd20: TJvImgBtn;
    btpd21: TJvImgBtn;
    btpd22: TJvImgBtn;
    btpd23: TJvImgBtn;
    btpd24: TJvImgBtn;
    btpd25: TJvImgBtn;
    btpd26: TJvImgBtn;
    btpd27: TJvImgBtn;
    btpd28: TJvImgBtn;
    btpd29: TJvImgBtn;
    btpd30: TJvImgBtn;
    TabSheet7: TTabSheet;
    btpd37: TJvImgBtn;
    JvImgBtn38: TJvImgBtn;
    JvImgBtn39: TJvImgBtn;
    JvImgBtn40: TJvImgBtn;
    JvImgBtn41: TJvImgBtn;
    JvImgBtn42: TJvImgBtn;
    JvImgBtn43: TJvImgBtn;
    JvImgBtn44: TJvImgBtn;
    JvImgBtn45: TJvImgBtn;
    JvImgBtn46: TJvImgBtn;
    JvImgBtn47: TJvImgBtn;
    JvImgBtn48: TJvImgBtn;
    JvImgBtn49: TJvImgBtn;
    JvImgBtn50: TJvImgBtn;
    JvImgBtn51: TJvImgBtn;
    JvImgBtn52: TJvImgBtn;
    JvImgBtn53: TJvImgBtn;
    JvImgBtn54: TJvImgBtn;
    JvImgBtn55: TJvImgBtn;
    JvImgBtn56: TJvImgBtn;
    JvImgBtn57: TJvImgBtn;
    JvImgBtn58: TJvImgBtn;
    JvImgBtn59: TJvImgBtn;
    JvImgBtn60: TJvImgBtn;
    JvImgBtn61: TJvImgBtn;
    JvImgBtn62: TJvImgBtn;
    JvImgBtn63: TJvImgBtn;
    JvImgBtn64: TJvImgBtn;
    JvImgBtn65: TJvImgBtn;
    JvImgBtn66: TJvImgBtn;
    JvImgBtn67: TJvImgBtn;
    JvImgBtn68: TJvImgBtn;
    JvImgBtn69: TJvImgBtn;
    JvImgBtn70: TJvImgBtn;
    JvImgBtn71: TJvImgBtn;
    JvImgBtn72: TJvImgBtn;
    TabSheet8: TTabSheet;
    JvImgBtn73: TJvImgBtn;
    JvImgBtn74: TJvImgBtn;
    JvImgBtn75: TJvImgBtn;
    JvImgBtn76: TJvImgBtn;
    JvImgBtn77: TJvImgBtn;
    JvImgBtn78: TJvImgBtn;
    JvImgBtn79: TJvImgBtn;
    JvImgBtn80: TJvImgBtn;
    JvImgBtn81: TJvImgBtn;
    JvImgBtn82: TJvImgBtn;
    JvImgBtn83: TJvImgBtn;
    JvImgBtn84: TJvImgBtn;
    JvImgBtn85: TJvImgBtn;
    JvImgBtn86: TJvImgBtn;
    JvImgBtn87: TJvImgBtn;
    JvImgBtn88: TJvImgBtn;
    JvImgBtn89: TJvImgBtn;
    JvImgBtn90: TJvImgBtn;
    JvImgBtn91: TJvImgBtn;
    JvImgBtn92: TJvImgBtn;
    JvImgBtn93: TJvImgBtn;
    JvImgBtn94: TJvImgBtn;
    JvImgBtn95: TJvImgBtn;
    JvImgBtn96: TJvImgBtn;
    JvImgBtn97: TJvImgBtn;
    JvImgBtn98: TJvImgBtn;
    JvImgBtn99: TJvImgBtn;
    JvImgBtn100: TJvImgBtn;
    JvImgBtn101: TJvImgBtn;
    JvImgBtn102: TJvImgBtn;
    JvImgBtn103: TJvImgBtn;
    JvImgBtn104: TJvImgBtn;
    JvImgBtn105: TJvImgBtn;
    JvImgBtn106: TJvImgBtn;
    JvImgBtn107: TJvImgBtn;
    JvImgBtn108: TJvImgBtn;
    TabSheet9: TTabSheet;
    JvImgBtn109: TJvImgBtn;
    JvImgBtn110: TJvImgBtn;
    JvImgBtn111: TJvImgBtn;
    JvImgBtn112: TJvImgBtn;
    JvImgBtn113: TJvImgBtn;
    JvImgBtn114: TJvImgBtn;
    JvImgBtn115: TJvImgBtn;
    JvImgBtn116: TJvImgBtn;
    JvImgBtn117: TJvImgBtn;
    JvImgBtn118: TJvImgBtn;
    JvImgBtn119: TJvImgBtn;
    JvImgBtn120: TJvImgBtn;
    JvImgBtn121: TJvImgBtn;
    JvImgBtn122: TJvImgBtn;
    JvImgBtn123: TJvImgBtn;
    JvImgBtn124: TJvImgBtn;
    JvImgBtn125: TJvImgBtn;
    JvImgBtn126: TJvImgBtn;
    JvImgBtn127: TJvImgBtn;
    JvImgBtn128: TJvImgBtn;
    JvImgBtn129: TJvImgBtn;
    JvImgBtn130: TJvImgBtn;
    JvImgBtn131: TJvImgBtn;
    JvImgBtn132: TJvImgBtn;
    JvImgBtn133: TJvImgBtn;
    JvImgBtn134: TJvImgBtn;
    JvImgBtn135: TJvImgBtn;
    JvImgBtn136: TJvImgBtn;
    JvImgBtn137: TJvImgBtn;
    JvImgBtn138: TJvImgBtn;
    JvImgBtn139: TJvImgBtn;
    JvImgBtn140: TJvImgBtn;
    JvImgBtn141: TJvImgBtn;
    JvImgBtn142: TJvImgBtn;
    JvImgBtn143: TJvImgBtn;
    JvImgBtn144: TJvImgBtn;
    TabSheet10: TTabSheet;
    JvImgBtn145: TJvImgBtn;
    JvImgBtn146: TJvImgBtn;
    JvImgBtn147: TJvImgBtn;
    JvImgBtn148: TJvImgBtn;
    JvImgBtn149: TJvImgBtn;
    JvImgBtn150: TJvImgBtn;
    JvImgBtn151: TJvImgBtn;
    JvImgBtn152: TJvImgBtn;
    JvImgBtn153: TJvImgBtn;
    JvImgBtn154: TJvImgBtn;
    JvImgBtn155: TJvImgBtn;
    JvImgBtn156: TJvImgBtn;
    JvImgBtn157: TJvImgBtn;
    JvImgBtn158: TJvImgBtn;
    JvImgBtn159: TJvImgBtn;
    JvImgBtn160: TJvImgBtn;
    JvImgBtn161: TJvImgBtn;
    JvImgBtn162: TJvImgBtn;
    JvImgBtn163: TJvImgBtn;
    JvImgBtn164: TJvImgBtn;
    JvImgBtn165: TJvImgBtn;
    JvImgBtn166: TJvImgBtn;
    JvImgBtn167: TJvImgBtn;
    JvImgBtn168: TJvImgBtn;
    JvImgBtn169: TJvImgBtn;
    JvImgBtn170: TJvImgBtn;
    JvImgBtn171: TJvImgBtn;
    JvImgBtn172: TJvImgBtn;
    JvImgBtn173: TJvImgBtn;
    TabSheet11: TTabSheet;
    JvImgBtn181: TJvImgBtn;
    JvImgBtn182: TJvImgBtn;
    JvImgBtn183: TJvImgBtn;
    JvImgBtn184: TJvImgBtn;
    JvImgBtn185: TJvImgBtn;
    JvImgBtn186: TJvImgBtn;
    JvImgBtn187: TJvImgBtn;
    JvImgBtn188: TJvImgBtn;
    JvImgBtn189: TJvImgBtn;
    JvImgBtn190: TJvImgBtn;
    JvImgBtn191: TJvImgBtn;
    JvImgBtn192: TJvImgBtn;
    JvImgBtn193: TJvImgBtn;
    JvImgBtn194: TJvImgBtn;
    JvImgBtn195: TJvImgBtn;
    JvImgBtn196: TJvImgBtn;
    JvImgBtn197: TJvImgBtn;
    JvImgBtn198: TJvImgBtn;
    JvImgBtn199: TJvImgBtn;
    JvImgBtn200: TJvImgBtn;
    JvImgBtn201: TJvImgBtn;
    JvImgBtn202: TJvImgBtn;
    JvImgBtn203: TJvImgBtn;
    JvImgBtn204: TJvImgBtn;
    JvImgBtn205: TJvImgBtn;
    JvImgBtn206: TJvImgBtn;
    JvImgBtn207: TJvImgBtn;
    JvImgBtn208: TJvImgBtn;
    JvImgBtn209: TJvImgBtn;
    JvImgBtn210: TJvImgBtn;
    JvImgBtn211: TJvImgBtn;
    JvImgBtn212: TJvImgBtn;
    JvImgBtn213: TJvImgBtn;
    JvImgBtn214: TJvImgBtn;
    JvImgBtn215: TJvImgBtn;
    JvImgBtn216: TJvImgBtn;
    TabSheet12: TTabSheet;
    JvImgBtn217: TJvImgBtn;
    JvImgBtn218: TJvImgBtn;
    JvImgBtn219: TJvImgBtn;
    JvImgBtn220: TJvImgBtn;
    JvImgBtn221: TJvImgBtn;
    JvImgBtn222: TJvImgBtn;
    JvImgBtn223: TJvImgBtn;
    JvImgBtn224: TJvImgBtn;
    JvImgBtn225: TJvImgBtn;
    JvImgBtn226: TJvImgBtn;
    JvImgBtn227: TJvImgBtn;
    JvImgBtn228: TJvImgBtn;
    JvImgBtn229: TJvImgBtn;
    JvImgBtn230: TJvImgBtn;
    JvImgBtn231: TJvImgBtn;
    JvImgBtn232: TJvImgBtn;
    JvImgBtn233: TJvImgBtn;
    JvImgBtn234: TJvImgBtn;
    JvImgBtn235: TJvImgBtn;
    JvImgBtn236: TJvImgBtn;
    JvImgBtn237: TJvImgBtn;
    JvImgBtn238: TJvImgBtn;
    JvImgBtn239: TJvImgBtn;
    JvImgBtn240: TJvImgBtn;
    JvImgBtn241: TJvImgBtn;
    JvImgBtn242: TJvImgBtn;
    JvImgBtn243: TJvImgBtn;
    JvImgBtn244: TJvImgBtn;
    JvImgBtn245: TJvImgBtn;
    JvImgBtn246: TJvImgBtn;
    JvImgBtn247: TJvImgBtn;
    JvImgBtn248: TJvImgBtn;
    JvImgBtn249: TJvImgBtn;
    JvImgBtn250: TJvImgBtn;
    JvImgBtn251: TJvImgBtn;
    JvImgBtn252: TJvImgBtn;
    TabSheet13: TTabSheet;
    JvImgBtn253: TJvImgBtn;
    JvImgBtn254: TJvImgBtn;
    JvImgBtn255: TJvImgBtn;
    JvImgBtn256: TJvImgBtn;
    JvImgBtn257: TJvImgBtn;
    JvImgBtn258: TJvImgBtn;
    JvImgBtn259: TJvImgBtn;
    JvImgBtn260: TJvImgBtn;
    JvImgBtn261: TJvImgBtn;
    JvImgBtn262: TJvImgBtn;
    JvImgBtn263: TJvImgBtn;
    JvImgBtn264: TJvImgBtn;
    JvImgBtn265: TJvImgBtn;
    JvImgBtn266: TJvImgBtn;
    JvImgBtn267: TJvImgBtn;
    JvImgBtn268: TJvImgBtn;
    JvImgBtn269: TJvImgBtn;
    JvImgBtn270: TJvImgBtn;
    JvImgBtn271: TJvImgBtn;
    JvImgBtn272: TJvImgBtn;
    JvImgBtn273: TJvImgBtn;
    JvImgBtn274: TJvImgBtn;
    JvImgBtn275: TJvImgBtn;
    JvImgBtn276: TJvImgBtn;
    JvImgBtn277: TJvImgBtn;
    JvImgBtn278: TJvImgBtn;
    JvImgBtn279: TJvImgBtn;
    JvImgBtn280: TJvImgBtn;
    JvImgBtn281: TJvImgBtn;
    JvImgBtn282: TJvImgBtn;
    JvImgBtn283: TJvImgBtn;
    JvImgBtn284: TJvImgBtn;
    JvImgBtn285: TJvImgBtn;
    JvImgBtn286: TJvImgBtn;
    JvImgBtn287: TJvImgBtn;
    JvImgBtn288: TJvImgBtn;
    TabSheet14: TTabSheet;
    JvImgBtn289: TJvImgBtn;
    JvImgBtn290: TJvImgBtn;
    JvImgBtn291: TJvImgBtn;
    JvImgBtn292: TJvImgBtn;
    JvImgBtn293: TJvImgBtn;
    JvImgBtn294: TJvImgBtn;
    JvImgBtn295: TJvImgBtn;
    JvImgBtn296: TJvImgBtn;
    JvImgBtn297: TJvImgBtn;
    JvImgBtn298: TJvImgBtn;
    JvImgBtn299: TJvImgBtn;
    JvImgBtn300: TJvImgBtn;
    JvImgBtn301: TJvImgBtn;
    JvImgBtn302: TJvImgBtn;
    JvImgBtn303: TJvImgBtn;
    JvImgBtn304: TJvImgBtn;
    JvImgBtn305: TJvImgBtn;
    JvImgBtn306: TJvImgBtn;
    JvImgBtn307: TJvImgBtn;
    JvImgBtn308: TJvImgBtn;
    JvImgBtn309: TJvImgBtn;
    JvImgBtn310: TJvImgBtn;
    JvImgBtn311: TJvImgBtn;
    JvImgBtn312: TJvImgBtn;
    JvImgBtn313: TJvImgBtn;
    JvImgBtn314: TJvImgBtn;
    JvImgBtn315: TJvImgBtn;
    JvImgBtn316: TJvImgBtn;
    JvImgBtn317: TJvImgBtn;
    JvImgBtn318: TJvImgBtn;
    JvImgBtn319: TJvImgBtn;
    JvImgBtn320: TJvImgBtn;
    JvImgBtn321: TJvImgBtn;
    JvImgBtn322: TJvImgBtn;
    JvImgBtn323: TJvImgBtn;
    JvImgBtn324: TJvImgBtn;
    TabSheet15: TTabSheet;
    JvImgBtn325: TJvImgBtn;
    JvImgBtn326: TJvImgBtn;
    JvImgBtn327: TJvImgBtn;
    JvImgBtn328: TJvImgBtn;
    JvImgBtn329: TJvImgBtn;
    JvImgBtn330: TJvImgBtn;
    JvImgBtn331: TJvImgBtn;
    JvImgBtn332: TJvImgBtn;
    JvImgBtn333: TJvImgBtn;
    JvImgBtn334: TJvImgBtn;
    JvImgBtn335: TJvImgBtn;
    JvImgBtn336: TJvImgBtn;
    JvImgBtn337: TJvImgBtn;
    JvImgBtn338: TJvImgBtn;
    JvImgBtn339: TJvImgBtn;
    JvImgBtn340: TJvImgBtn;
    JvImgBtn341: TJvImgBtn;
    JvImgBtn342: TJvImgBtn;
    JvImgBtn343: TJvImgBtn;
    JvImgBtn344: TJvImgBtn;
    JvImgBtn345: TJvImgBtn;
    JvImgBtn346: TJvImgBtn;
    JvImgBtn347: TJvImgBtn;
    JvImgBtn348: TJvImgBtn;
    JvImgBtn349: TJvImgBtn;
    JvImgBtn350: TJvImgBtn;
    JvImgBtn351: TJvImgBtn;
    JvImgBtn352: TJvImgBtn;
    JvImgBtn353: TJvImgBtn;
    JvImgBtn354: TJvImgBtn;
    JvImgBtn355: TJvImgBtn;
    JvImgBtn356: TJvImgBtn;
    JvImgBtn357: TJvImgBtn;
    JvImgBtn358: TJvImgBtn;
    JvImgBtn359: TJvImgBtn;
    JvImgBtn360: TJvImgBtn;
    TabSheet16: TTabSheet;
    JvImgBtn361: TJvImgBtn;
    JvImgBtn362: TJvImgBtn;
    JvImgBtn363: TJvImgBtn;
    JvImgBtn364: TJvImgBtn;
    JvImgBtn365: TJvImgBtn;
    JvImgBtn366: TJvImgBtn;
    JvImgBtn367: TJvImgBtn;
    JvImgBtn368: TJvImgBtn;
    JvImgBtn369: TJvImgBtn;
    JvImgBtn370: TJvImgBtn;
    JvImgBtn371: TJvImgBtn;
    JvImgBtn372: TJvImgBtn;
    JvImgBtn373: TJvImgBtn;
    JvImgBtn374: TJvImgBtn;
    JvImgBtn375: TJvImgBtn;
    JvImgBtn376: TJvImgBtn;
    JvImgBtn377: TJvImgBtn;
    JvImgBtn378: TJvImgBtn;
    JvImgBtn379: TJvImgBtn;
    JvImgBtn380: TJvImgBtn;
    JvImgBtn381: TJvImgBtn;
    JvImgBtn382: TJvImgBtn;
    JvImgBtn383: TJvImgBtn;
    JvImgBtn384: TJvImgBtn;
    JvImgBtn385: TJvImgBtn;
    JvImgBtn386: TJvImgBtn;
    JvImgBtn387: TJvImgBtn;
    JvImgBtn388: TJvImgBtn;
    JvImgBtn389: TJvImgBtn;
    JvImgBtn390: TJvImgBtn;
    JvImgBtn391: TJvImgBtn;
    JvImgBtn392: TJvImgBtn;
    JvImgBtn393: TJvImgBtn;
    JvImgBtn394: TJvImgBtn;
    JvImgBtn395: TJvImgBtn;
    JvImgBtn396: TJvImgBtn;
    TabSheet17: TTabSheet;
    JvImgBtn397: TJvImgBtn;
    JvImgBtn398: TJvImgBtn;
    JvImgBtn399: TJvImgBtn;
    JvImgBtn400: TJvImgBtn;
    JvImgBtn401: TJvImgBtn;
    JvImgBtn402: TJvImgBtn;
    JvImgBtn403: TJvImgBtn;
    JvImgBtn404: TJvImgBtn;
    JvImgBtn405: TJvImgBtn;
    JvImgBtn406: TJvImgBtn;
    JvImgBtn407: TJvImgBtn;
    JvImgBtn408: TJvImgBtn;
    JvImgBtn409: TJvImgBtn;
    JvImgBtn410: TJvImgBtn;
    JvImgBtn411: TJvImgBtn;
    JvImgBtn412: TJvImgBtn;
    JvImgBtn413: TJvImgBtn;
    JvImgBtn414: TJvImgBtn;
    JvImgBtn415: TJvImgBtn;
    JvImgBtn416: TJvImgBtn;
    JvImgBtn417: TJvImgBtn;
    JvImgBtn418: TJvImgBtn;
    JvImgBtn419: TJvImgBtn;
    JvImgBtn420: TJvImgBtn;
    JvImgBtn421: TJvImgBtn;
    JvImgBtn422: TJvImgBtn;
    JvImgBtn423: TJvImgBtn;
    JvImgBtn424: TJvImgBtn;
    JvImgBtn425: TJvImgBtn;
    JvImgBtn426: TJvImgBtn;
    JvImgBtn427: TJvImgBtn;
    JvImgBtn428: TJvImgBtn;
    JvImgBtn429: TJvImgBtn;
    JvImgBtn430: TJvImgBtn;
    JvImgBtn431: TJvImgBtn;
    JvImgBtn432: TJvImgBtn;
    TabSheet18: TTabSheet;
    JvImgBtn433: TJvImgBtn;
    JvImgBtn434: TJvImgBtn;
    JvImgBtn435: TJvImgBtn;
    JvImgBtn436: TJvImgBtn;
    JvImgBtn437: TJvImgBtn;
    JvImgBtn438: TJvImgBtn;
    JvImgBtn439: TJvImgBtn;
    JvImgBtn440: TJvImgBtn;
    JvImgBtn441: TJvImgBtn;
    JvImgBtn442: TJvImgBtn;
    JvImgBtn443: TJvImgBtn;
    JvImgBtn444: TJvImgBtn;
    JvImgBtn445: TJvImgBtn;
    JvImgBtn446: TJvImgBtn;
    JvImgBtn447: TJvImgBtn;
    JvImgBtn448: TJvImgBtn;
    JvImgBtn449: TJvImgBtn;
    JvImgBtn450: TJvImgBtn;
    JvImgBtn451: TJvImgBtn;
    JvImgBtn452: TJvImgBtn;
    JvImgBtn453: TJvImgBtn;
    JvImgBtn454: TJvImgBtn;
    JvImgBtn455: TJvImgBtn;
    JvImgBtn456: TJvImgBtn;
    JvImgBtn457: TJvImgBtn;
    JvImgBtn458: TJvImgBtn;
    JvImgBtn459: TJvImgBtn;
    JvImgBtn460: TJvImgBtn;
    JvImgBtn461: TJvImgBtn;
    JvImgBtn462: TJvImgBtn;
    JvImgBtn463: TJvImgBtn;
    JvImgBtn464: TJvImgBtn;
    JvImgBtn465: TJvImgBtn;
    JvImgBtn466: TJvImgBtn;
    JvImgBtn467: TJvImgBtn;
    JvImgBtn468: TJvImgBtn;
    TabSheet19: TTabSheet;
    JvImgBtn469: TJvImgBtn;
    JvImgBtn470: TJvImgBtn;
    JvImgBtn471: TJvImgBtn;
    JvImgBtn472: TJvImgBtn;
    JvImgBtn473: TJvImgBtn;
    JvImgBtn474: TJvImgBtn;
    JvImgBtn475: TJvImgBtn;
    JvImgBtn476: TJvImgBtn;
    JvImgBtn477: TJvImgBtn;
    JvImgBtn478: TJvImgBtn;
    JvImgBtn479: TJvImgBtn;
    JvImgBtn480: TJvImgBtn;
    JvImgBtn481: TJvImgBtn;
    JvImgBtn482: TJvImgBtn;
    JvImgBtn483: TJvImgBtn;
    JvImgBtn484: TJvImgBtn;
    JvImgBtn485: TJvImgBtn;
    JvImgBtn486: TJvImgBtn;
    JvImgBtn487: TJvImgBtn;
    JvImgBtn488: TJvImgBtn;
    JvImgBtn489: TJvImgBtn;
    JvImgBtn490: TJvImgBtn;
    JvImgBtn491: TJvImgBtn;
    JvImgBtn492: TJvImgBtn;
    JvImgBtn493: TJvImgBtn;
    JvImgBtn494: TJvImgBtn;
    JvImgBtn495: TJvImgBtn;
    JvImgBtn496: TJvImgBtn;
    JvImgBtn497: TJvImgBtn;
    JvImgBtn498: TJvImgBtn;
    JvImgBtn499: TJvImgBtn;
    JvImgBtn500: TJvImgBtn;
    JvImgBtn501: TJvImgBtn;
    JvImgBtn502: TJvImgBtn;
    JvImgBtn503: TJvImgBtn;
    JvImgBtn504: TJvImgBtn;
    TabSheet20: TTabSheet;
    JvImgBtn505: TJvImgBtn;
    JvImgBtn506: TJvImgBtn;
    JvImgBtn507: TJvImgBtn;
    JvImgBtn508: TJvImgBtn;
    JvImgBtn509: TJvImgBtn;
    JvImgBtn510: TJvImgBtn;
    JvImgBtn511: TJvImgBtn;
    JvImgBtn512: TJvImgBtn;
    JvImgBtn513: TJvImgBtn;
    JvImgBtn514: TJvImgBtn;
    JvImgBtn515: TJvImgBtn;
    JvImgBtn516: TJvImgBtn;
    JvImgBtn517: TJvImgBtn;
    JvImgBtn518: TJvImgBtn;
    JvImgBtn519: TJvImgBtn;
    JvImgBtn520: TJvImgBtn;
    JvImgBtn521: TJvImgBtn;
    JvImgBtn522: TJvImgBtn;
    JvImgBtn523: TJvImgBtn;
    JvImgBtn524: TJvImgBtn;
    JvImgBtn525: TJvImgBtn;
    JvImgBtn526: TJvImgBtn;
    JvImgBtn527: TJvImgBtn;
    JvImgBtn528: TJvImgBtn;
    JvImgBtn529: TJvImgBtn;
    JvImgBtn530: TJvImgBtn;
    JvImgBtn531: TJvImgBtn;
    JvImgBtn532: TJvImgBtn;
    JvImgBtn533: TJvImgBtn;
    JvImgBtn534: TJvImgBtn;
    JvImgBtn535: TJvImgBtn;
    JvImgBtn536: TJvImgBtn;
    JvImgBtn537: TJvImgBtn;
    JvImgBtn538: TJvImgBtn;
    JvImgBtn539: TJvImgBtn;
    JvImgBtn540: TJvImgBtn;
    TabSheet21: TTabSheet;
    JvImgBtn541: TJvImgBtn;
    JvImgBtn542: TJvImgBtn;
    JvImgBtn543: TJvImgBtn;
    JvImgBtn544: TJvImgBtn;
    JvImgBtn545: TJvImgBtn;
    JvImgBtn546: TJvImgBtn;
    JvImgBtn547: TJvImgBtn;
    JvImgBtn548: TJvImgBtn;
    JvImgBtn549: TJvImgBtn;
    JvImgBtn550: TJvImgBtn;
    JvImgBtn551: TJvImgBtn;
    JvImgBtn552: TJvImgBtn;
    JvImgBtn553: TJvImgBtn;
    JvImgBtn554: TJvImgBtn;
    JvImgBtn555: TJvImgBtn;
    JvImgBtn556: TJvImgBtn;
    JvImgBtn557: TJvImgBtn;
    JvImgBtn558: TJvImgBtn;
    JvImgBtn559: TJvImgBtn;
    JvImgBtn560: TJvImgBtn;
    JvImgBtn561: TJvImgBtn;
    JvImgBtn562: TJvImgBtn;
    JvImgBtn563: TJvImgBtn;
    JvImgBtn564: TJvImgBtn;
    JvImgBtn565: TJvImgBtn;
    JvImgBtn566: TJvImgBtn;
    JvImgBtn567: TJvImgBtn;
    JvImgBtn568: TJvImgBtn;
    JvImgBtn569: TJvImgBtn;
    JvImgBtn570: TJvImgBtn;
    JvImgBtn571: TJvImgBtn;
    JvImgBtn572: TJvImgBtn;
    JvImgBtn573: TJvImgBtn;
    JvImgBtn574: TJvImgBtn;
    JvImgBtn575: TJvImgBtn;
    JvImgBtn576: TJvImgBtn;
    TabSheet22: TTabSheet;
    JvImgBtn577: TJvImgBtn;
    JvImgBtn578: TJvImgBtn;
    JvImgBtn579: TJvImgBtn;
    JvImgBtn580: TJvImgBtn;
    JvImgBtn581: TJvImgBtn;
    JvImgBtn582: TJvImgBtn;
    JvImgBtn583: TJvImgBtn;
    JvImgBtn584: TJvImgBtn;
    JvImgBtn585: TJvImgBtn;
    JvImgBtn586: TJvImgBtn;
    JvImgBtn587: TJvImgBtn;
    JvImgBtn588: TJvImgBtn;
    JvImgBtn589: TJvImgBtn;
    JvImgBtn590: TJvImgBtn;
    JvImgBtn591: TJvImgBtn;
    JvImgBtn592: TJvImgBtn;
    JvImgBtn593: TJvImgBtn;
    JvImgBtn594: TJvImgBtn;
    JvImgBtn595: TJvImgBtn;
    JvImgBtn596: TJvImgBtn;
    JvImgBtn597: TJvImgBtn;
    JvImgBtn598: TJvImgBtn;
    JvImgBtn599: TJvImgBtn;
    JvImgBtn600: TJvImgBtn;
    JvImgBtn601: TJvImgBtn;
    JvImgBtn602: TJvImgBtn;
    JvImgBtn603: TJvImgBtn;
    JvImgBtn604: TJvImgBtn;
    JvImgBtn605: TJvImgBtn;
    JvImgBtn606: TJvImgBtn;
    JvImgBtn607: TJvImgBtn;
    JvImgBtn608: TJvImgBtn;
    JvImgBtn609: TJvImgBtn;
    JvImgBtn610: TJvImgBtn;
    JvImgBtn611: TJvImgBtn;
    JvImgBtn612: TJvImgBtn;
    TabSheet23: TTabSheet;
    JvImgBtn613: TJvImgBtn;
    JvImgBtn614: TJvImgBtn;
    JvImgBtn615: TJvImgBtn;
    JvImgBtn616: TJvImgBtn;
    JvImgBtn617: TJvImgBtn;
    JvImgBtn618: TJvImgBtn;
    JvImgBtn619: TJvImgBtn;
    JvImgBtn620: TJvImgBtn;
    JvImgBtn621: TJvImgBtn;
    JvImgBtn622: TJvImgBtn;
    JvImgBtn623: TJvImgBtn;
    JvImgBtn624: TJvImgBtn;
    JvImgBtn625: TJvImgBtn;
    JvImgBtn626: TJvImgBtn;
    JvImgBtn627: TJvImgBtn;
    JvImgBtn628: TJvImgBtn;
    JvImgBtn629: TJvImgBtn;
    JvImgBtn630: TJvImgBtn;
    JvImgBtn631: TJvImgBtn;
    JvImgBtn632: TJvImgBtn;
    JvImgBtn633: TJvImgBtn;
    JvImgBtn634: TJvImgBtn;
    JvImgBtn635: TJvImgBtn;
    JvImgBtn636: TJvImgBtn;
    JvImgBtn637: TJvImgBtn;
    JvImgBtn638: TJvImgBtn;
    JvImgBtn639: TJvImgBtn;
    JvImgBtn640: TJvImgBtn;
    JvImgBtn641: TJvImgBtn;
    JvImgBtn642: TJvImgBtn;
    JvImgBtn643: TJvImgBtn;
    JvImgBtn644: TJvImgBtn;
    JvImgBtn645: TJvImgBtn;
    JvImgBtn646: TJvImgBtn;
    JvImgBtn647: TJvImgBtn;
    JvImgBtn648: TJvImgBtn;
    TabSheet24: TTabSheet;
    JvImgBtn649: TJvImgBtn;
    JvImgBtn650: TJvImgBtn;
    JvImgBtn651: TJvImgBtn;
    JvImgBtn652: TJvImgBtn;
    JvImgBtn653: TJvImgBtn;
    JvImgBtn654: TJvImgBtn;
    JvImgBtn655: TJvImgBtn;
    JvImgBtn656: TJvImgBtn;
    JvImgBtn657: TJvImgBtn;
    JvImgBtn658: TJvImgBtn;
    JvImgBtn659: TJvImgBtn;
    JvImgBtn660: TJvImgBtn;
    JvImgBtn661: TJvImgBtn;
    JvImgBtn662: TJvImgBtn;
    JvImgBtn663: TJvImgBtn;
    JvImgBtn664: TJvImgBtn;
    JvImgBtn665: TJvImgBtn;
    JvImgBtn666: TJvImgBtn;
    JvImgBtn667: TJvImgBtn;
    JvImgBtn668: TJvImgBtn;
    JvImgBtn669: TJvImgBtn;
    JvImgBtn670: TJvImgBtn;
    JvImgBtn671: TJvImgBtn;
    JvImgBtn672: TJvImgBtn;
    JvImgBtn673: TJvImgBtn;
    JvImgBtn674: TJvImgBtn;
    JvImgBtn675: TJvImgBtn;
    JvImgBtn676: TJvImgBtn;
    JvImgBtn677: TJvImgBtn;
    JvImgBtn678: TJvImgBtn;
    JvImgBtn679: TJvImgBtn;
    JvImgBtn680: TJvImgBtn;
    JvImgBtn681: TJvImgBtn;
    JvImgBtn682: TJvImgBtn;
    JvImgBtn683: TJvImgBtn;
    JvImgBtn684: TJvImgBtn;
    TabSheet25: TTabSheet;
    JvImgBtn685: TJvImgBtn;
    JvImgBtn686: TJvImgBtn;
    JvImgBtn687: TJvImgBtn;
    JvImgBtn688: TJvImgBtn;
    JvImgBtn689: TJvImgBtn;
    JvImgBtn690: TJvImgBtn;
    JvImgBtn691: TJvImgBtn;
    JvImgBtn692: TJvImgBtn;
    JvImgBtn693: TJvImgBtn;
    JvImgBtn694: TJvImgBtn;
    JvImgBtn695: TJvImgBtn;
    JvImgBtn696: TJvImgBtn;
    JvImgBtn697: TJvImgBtn;
    JvImgBtn698: TJvImgBtn;
    JvImgBtn699: TJvImgBtn;
    JvImgBtn700: TJvImgBtn;
    JvImgBtn701: TJvImgBtn;
    JvImgBtn702: TJvImgBtn;
    JvImgBtn703: TJvImgBtn;
    JvImgBtn704: TJvImgBtn;
    JvImgBtn705: TJvImgBtn;
    JvImgBtn706: TJvImgBtn;
    JvImgBtn707: TJvImgBtn;
    JvImgBtn708: TJvImgBtn;
    JvImgBtn709: TJvImgBtn;
    JvImgBtn710: TJvImgBtn;
    JvImgBtn711: TJvImgBtn;
    JvImgBtn712: TJvImgBtn;
    JvImgBtn713: TJvImgBtn;
    JvImgBtn714: TJvImgBtn;
    JvImgBtn715: TJvImgBtn;
    JvImgBtn716: TJvImgBtn;
    JvImgBtn717: TJvImgBtn;
    JvImgBtn718: TJvImgBtn;
    JvImgBtn719: TJvImgBtn;
    JvImgBtn720: TJvImgBtn;
    TabSheet26: TTabSheet;
    JvImgBtn721: TJvImgBtn;
    JvImgBtn722: TJvImgBtn;
    JvImgBtn723: TJvImgBtn;
    JvImgBtn724: TJvImgBtn;
    JvImgBtn725: TJvImgBtn;
    JvImgBtn726: TJvImgBtn;
    JvImgBtn727: TJvImgBtn;
    JvImgBtn728: TJvImgBtn;
    JvImgBtn729: TJvImgBtn;
    JvImgBtn730: TJvImgBtn;
    JvImgBtn731: TJvImgBtn;
    JvImgBtn732: TJvImgBtn;
    JvImgBtn733: TJvImgBtn;
    JvImgBtn734: TJvImgBtn;
    JvImgBtn735: TJvImgBtn;
    JvImgBtn736: TJvImgBtn;
    JvImgBtn737: TJvImgBtn;
    JvImgBtn738: TJvImgBtn;
    JvImgBtn739: TJvImgBtn;
    JvImgBtn740: TJvImgBtn;
    JvImgBtn741: TJvImgBtn;
    JvImgBtn742: TJvImgBtn;
    JvImgBtn743: TJvImgBtn;
    JvImgBtn744: TJvImgBtn;
    JvImgBtn745: TJvImgBtn;
    JvImgBtn746: TJvImgBtn;
    JvImgBtn747: TJvImgBtn;
    JvImgBtn748: TJvImgBtn;
    JvImgBtn749: TJvImgBtn;
    JvImgBtn750: TJvImgBtn;
    JvImgBtn751: TJvImgBtn;
    JvImgBtn752: TJvImgBtn;
    JvImgBtn753: TJvImgBtn;
    JvImgBtn754: TJvImgBtn;
    JvImgBtn755: TJvImgBtn;
    JvImgBtn756: TJvImgBtn;
    TabSheet27: TTabSheet;
    JvImgBtn757: TJvImgBtn;
    JvImgBtn758: TJvImgBtn;
    JvImgBtn759: TJvImgBtn;
    JvImgBtn760: TJvImgBtn;
    JvImgBtn761: TJvImgBtn;
    JvImgBtn762: TJvImgBtn;
    JvImgBtn763: TJvImgBtn;
    JvImgBtn764: TJvImgBtn;
    JvImgBtn765: TJvImgBtn;
    JvImgBtn766: TJvImgBtn;
    JvImgBtn767: TJvImgBtn;
    JvImgBtn768: TJvImgBtn;
    JvImgBtn769: TJvImgBtn;
    JvImgBtn770: TJvImgBtn;
    JvImgBtn771: TJvImgBtn;
    JvImgBtn772: TJvImgBtn;
    JvImgBtn773: TJvImgBtn;
    JvImgBtn774: TJvImgBtn;
    JvImgBtn775: TJvImgBtn;
    JvImgBtn776: TJvImgBtn;
    JvImgBtn777: TJvImgBtn;
    JvImgBtn778: TJvImgBtn;
    JvImgBtn779: TJvImgBtn;
    JvImgBtn780: TJvImgBtn;
    JvImgBtn781: TJvImgBtn;
    JvImgBtn782: TJvImgBtn;
    JvImgBtn783: TJvImgBtn;
    JvImgBtn784: TJvImgBtn;
    JvImgBtn785: TJvImgBtn;
    JvImgBtn786: TJvImgBtn;
    JvImgBtn787: TJvImgBtn;
    JvImgBtn788: TJvImgBtn;
    JvImgBtn789: TJvImgBtn;
    JvImgBtn790: TJvImgBtn;
    JvImgBtn791: TJvImgBtn;
    JvImgBtn792: TJvImgBtn;
    TabSheet28: TTabSheet;
    JvImgBtn793: TJvImgBtn;
    JvImgBtn794: TJvImgBtn;
    JvImgBtn795: TJvImgBtn;
    JvImgBtn796: TJvImgBtn;
    JvImgBtn797: TJvImgBtn;
    JvImgBtn798: TJvImgBtn;
    JvImgBtn799: TJvImgBtn;
    JvImgBtn800: TJvImgBtn;
    JvImgBtn801: TJvImgBtn;
    JvImgBtn802: TJvImgBtn;
    JvImgBtn803: TJvImgBtn;
    JvImgBtn804: TJvImgBtn;
    JvImgBtn805: TJvImgBtn;
    JvImgBtn806: TJvImgBtn;
    JvImgBtn807: TJvImgBtn;
    JvImgBtn808: TJvImgBtn;
    JvImgBtn809: TJvImgBtn;
    JvImgBtn810: TJvImgBtn;
    JvImgBtn811: TJvImgBtn;
    JvImgBtn812: TJvImgBtn;
    JvImgBtn813: TJvImgBtn;
    JvImgBtn814: TJvImgBtn;
    JvImgBtn815: TJvImgBtn;
    JvImgBtn816: TJvImgBtn;
    JvImgBtn817: TJvImgBtn;
    JvImgBtn818: TJvImgBtn;
    JvImgBtn819: TJvImgBtn;
    JvImgBtn820: TJvImgBtn;
    JvImgBtn821: TJvImgBtn;
    JvImgBtn822: TJvImgBtn;
    JvImgBtn823: TJvImgBtn;
    JvImgBtn824: TJvImgBtn;
    JvImgBtn825: TJvImgBtn;
    JvImgBtn826: TJvImgBtn;
    JvImgBtn827: TJvImgBtn;
    JvImgBtn828: TJvImgBtn;
    TabSheet29: TTabSheet;
    JvImgBtn829: TJvImgBtn;
    JvImgBtn830: TJvImgBtn;
    JvImgBtn831: TJvImgBtn;
    JvImgBtn832: TJvImgBtn;
    JvImgBtn833: TJvImgBtn;
    JvImgBtn834: TJvImgBtn;
    JvImgBtn835: TJvImgBtn;
    JvImgBtn836: TJvImgBtn;
    JvImgBtn837: TJvImgBtn;
    JvImgBtn838: TJvImgBtn;
    JvImgBtn839: TJvImgBtn;
    JvImgBtn840: TJvImgBtn;
    JvImgBtn841: TJvImgBtn;
    JvImgBtn842: TJvImgBtn;
    JvImgBtn843: TJvImgBtn;
    JvImgBtn844: TJvImgBtn;
    JvImgBtn845: TJvImgBtn;
    JvImgBtn846: TJvImgBtn;
    JvImgBtn847: TJvImgBtn;
    JvImgBtn848: TJvImgBtn;
    JvImgBtn849: TJvImgBtn;
    JvImgBtn850: TJvImgBtn;
    JvImgBtn851: TJvImgBtn;
    JvImgBtn852: TJvImgBtn;
    JvImgBtn853: TJvImgBtn;
    JvImgBtn854: TJvImgBtn;
    JvImgBtn855: TJvImgBtn;
    JvImgBtn856: TJvImgBtn;
    JvImgBtn857: TJvImgBtn;
    JvImgBtn858: TJvImgBtn;
    JvImgBtn859: TJvImgBtn;
    JvImgBtn860: TJvImgBtn;
    JvImgBtn861: TJvImgBtn;
    JvImgBtn862: TJvImgBtn;
    JvImgBtn863: TJvImgBtn;
    JvImgBtn864: TJvImgBtn;
    TabSheet30: TTabSheet;
    JvImgBtn865: TJvImgBtn;
    JvImgBtn866: TJvImgBtn;
    JvImgBtn867: TJvImgBtn;
    JvImgBtn868: TJvImgBtn;
    JvImgBtn869: TJvImgBtn;
    JvImgBtn870: TJvImgBtn;
    JvImgBtn871: TJvImgBtn;
    JvImgBtn872: TJvImgBtn;
    JvImgBtn873: TJvImgBtn;
    JvImgBtn874: TJvImgBtn;
    JvImgBtn875: TJvImgBtn;
    JvImgBtn876: TJvImgBtn;
    JvImgBtn877: TJvImgBtn;
    JvImgBtn878: TJvImgBtn;
    JvImgBtn879: TJvImgBtn;
    JvImgBtn880: TJvImgBtn;
    JvImgBtn881: TJvImgBtn;
    JvImgBtn882: TJvImgBtn;
    JvImgBtn883: TJvImgBtn;
    JvImgBtn884: TJvImgBtn;
    JvImgBtn885: TJvImgBtn;
    JvImgBtn886: TJvImgBtn;
    JvImgBtn887: TJvImgBtn;
    JvImgBtn888: TJvImgBtn;
    JvImgBtn889: TJvImgBtn;
    JvImgBtn890: TJvImgBtn;
    JvImgBtn891: TJvImgBtn;
    JvImgBtn892: TJvImgBtn;
    JvImgBtn893: TJvImgBtn;
    JvImgBtn894: TJvImgBtn;
    JvImgBtn895: TJvImgBtn;
    JvImgBtn896: TJvImgBtn;
    JvImgBtn897: TJvImgBtn;
    JvImgBtn898: TJvImgBtn;
    JvImgBtn899: TJvImgBtn;
    JvImgBtn900: TJvImgBtn;
    TabSheet31: TTabSheet;
    JvImgBtn901: TJvImgBtn;
    JvImgBtn902: TJvImgBtn;
    JvImgBtn903: TJvImgBtn;
    JvImgBtn904: TJvImgBtn;
    JvImgBtn905: TJvImgBtn;
    JvImgBtn906: TJvImgBtn;
    JvImgBtn907: TJvImgBtn;
    JvImgBtn908: TJvImgBtn;
    JvImgBtn909: TJvImgBtn;
    JvImgBtn910: TJvImgBtn;
    JvImgBtn911: TJvImgBtn;
    JvImgBtn912: TJvImgBtn;
    JvImgBtn913: TJvImgBtn;
    JvImgBtn914: TJvImgBtn;
    JvImgBtn915: TJvImgBtn;
    JvImgBtn916: TJvImgBtn;
    JvImgBtn917: TJvImgBtn;
    JvImgBtn918: TJvImgBtn;
    JvImgBtn919: TJvImgBtn;
    JvImgBtn920: TJvImgBtn;
    JvImgBtn921: TJvImgBtn;
    JvImgBtn922: TJvImgBtn;
    JvImgBtn923: TJvImgBtn;
    JvImgBtn924: TJvImgBtn;
    JvImgBtn925: TJvImgBtn;
    JvImgBtn926: TJvImgBtn;
    JvImgBtn927: TJvImgBtn;
    JvImgBtn928: TJvImgBtn;
    JvImgBtn929: TJvImgBtn;
    JvImgBtn930: TJvImgBtn;
    JvImgBtn931: TJvImgBtn;
    JvImgBtn932: TJvImgBtn;
    JvImgBtn933: TJvImgBtn;
    JvImgBtn934: TJvImgBtn;
    JvImgBtn935: TJvImgBtn;
    JvImgBtn936: TJvImgBtn;
    TabSheet32: TTabSheet;
    JvImgBtn937: TJvImgBtn;
    JvImgBtn938: TJvImgBtn;
    JvImgBtn939: TJvImgBtn;
    JvImgBtn940: TJvImgBtn;
    JvImgBtn941: TJvImgBtn;
    JvImgBtn942: TJvImgBtn;
    JvImgBtn943: TJvImgBtn;
    JvImgBtn944: TJvImgBtn;
    JvImgBtn945: TJvImgBtn;
    JvImgBtn946: TJvImgBtn;
    JvImgBtn947: TJvImgBtn;
    JvImgBtn948: TJvImgBtn;
    JvImgBtn949: TJvImgBtn;
    JvImgBtn950: TJvImgBtn;
    JvImgBtn951: TJvImgBtn;
    JvImgBtn952: TJvImgBtn;
    JvImgBtn953: TJvImgBtn;
    JvImgBtn954: TJvImgBtn;
    JvImgBtn955: TJvImgBtn;
    JvImgBtn956: TJvImgBtn;
    JvImgBtn957: TJvImgBtn;
    JvImgBtn958: TJvImgBtn;
    JvImgBtn959: TJvImgBtn;
    JvImgBtn960: TJvImgBtn;
    JvImgBtn961: TJvImgBtn;
    JvImgBtn962: TJvImgBtn;
    JvImgBtn963: TJvImgBtn;
    JvImgBtn964: TJvImgBtn;
    JvImgBtn965: TJvImgBtn;
    JvImgBtn966: TJvImgBtn;
    JvImgBtn967: TJvImgBtn;
    JvImgBtn968: TJvImgBtn;
    JvImgBtn969: TJvImgBtn;
    JvImgBtn970: TJvImgBtn;
    JvImgBtn971: TJvImgBtn;
    JvImgBtn972: TJvImgBtn;
    TabSheet33: TTabSheet;
    JvImgBtn973: TJvImgBtn;
    JvImgBtn974: TJvImgBtn;
    JvImgBtn975: TJvImgBtn;
    JvImgBtn976: TJvImgBtn;
    JvImgBtn977: TJvImgBtn;
    JvImgBtn978: TJvImgBtn;
    JvImgBtn979: TJvImgBtn;
    JvImgBtn980: TJvImgBtn;
    JvImgBtn981: TJvImgBtn;
    JvImgBtn982: TJvImgBtn;
    JvImgBtn983: TJvImgBtn;
    JvImgBtn984: TJvImgBtn;
    JvImgBtn985: TJvImgBtn;
    JvImgBtn986: TJvImgBtn;
    JvImgBtn987: TJvImgBtn;
    JvImgBtn988: TJvImgBtn;
    JvImgBtn989: TJvImgBtn;
    JvImgBtn990: TJvImgBtn;
    JvImgBtn991: TJvImgBtn;
    JvImgBtn992: TJvImgBtn;
    JvImgBtn993: TJvImgBtn;
    JvImgBtn994: TJvImgBtn;
    JvImgBtn995: TJvImgBtn;
    JvImgBtn996: TJvImgBtn;
    JvImgBtn997: TJvImgBtn;
    JvImgBtn998: TJvImgBtn;
    JvImgBtn999: TJvImgBtn;
    JvImgBtn1000: TJvImgBtn;
    JvImgBtn1001: TJvImgBtn;
    JvImgBtn1002: TJvImgBtn;
    JvImgBtn1003: TJvImgBtn;
    JvImgBtn1004: TJvImgBtn;
    JvImgBtn1005: TJvImgBtn;
    JvImgBtn1006: TJvImgBtn;
    JvImgBtn1007: TJvImgBtn;
    JvImgBtn1008: TJvImgBtn;
    TabSheet34: TTabSheet;
    JvImgBtn1009: TJvImgBtn;
    JvImgBtn1010: TJvImgBtn;
    JvImgBtn1011: TJvImgBtn;
    JvImgBtn1012: TJvImgBtn;
    JvImgBtn1013: TJvImgBtn;
    JvImgBtn1014: TJvImgBtn;
    JvImgBtn1015: TJvImgBtn;
    JvImgBtn1016: TJvImgBtn;
    JvImgBtn1017: TJvImgBtn;
    JvImgBtn1018: TJvImgBtn;
    JvImgBtn1019: TJvImgBtn;
    JvImgBtn1020: TJvImgBtn;
    JvImgBtn1021: TJvImgBtn;
    JvImgBtn1022: TJvImgBtn;
    JvImgBtn1023: TJvImgBtn;
    JvImgBtn1024: TJvImgBtn;
    JvImgBtn1025: TJvImgBtn;
    JvImgBtn1026: TJvImgBtn;
    JvImgBtn1027: TJvImgBtn;
    JvImgBtn1028: TJvImgBtn;
    JvImgBtn1029: TJvImgBtn;
    JvImgBtn1030: TJvImgBtn;
    JvImgBtn1031: TJvImgBtn;
    JvImgBtn1032: TJvImgBtn;
    JvImgBtn1033: TJvImgBtn;
    JvImgBtn1034: TJvImgBtn;
    JvImgBtn1035: TJvImgBtn;
    JvImgBtn1036: TJvImgBtn;
    JvImgBtn1037: TJvImgBtn;
    JvImgBtn1038: TJvImgBtn;
    JvImgBtn1039: TJvImgBtn;
    JvImgBtn1040: TJvImgBtn;
    JvImgBtn1041: TJvImgBtn;
    JvImgBtn1042: TJvImgBtn;
    JvImgBtn1043: TJvImgBtn;
    JvImgBtn1044: TJvImgBtn;
    TabSheet35: TTabSheet;
    JvImgBtn1045: TJvImgBtn;
    JvImgBtn1046: TJvImgBtn;
    JvImgBtn1047: TJvImgBtn;
    JvImgBtn1048: TJvImgBtn;
    JvImgBtn1049: TJvImgBtn;
    JvImgBtn1050: TJvImgBtn;
    JvImgBtn1051: TJvImgBtn;
    JvImgBtn1052: TJvImgBtn;
    JvImgBtn1053: TJvImgBtn;
    JvImgBtn1054: TJvImgBtn;
    JvImgBtn1055: TJvImgBtn;
    JvImgBtn1056: TJvImgBtn;
    JvImgBtn1057: TJvImgBtn;
    JvImgBtn1058: TJvImgBtn;
    JvImgBtn1059: TJvImgBtn;
    JvImgBtn1060: TJvImgBtn;
    JvImgBtn1061: TJvImgBtn;
    JvImgBtn1062: TJvImgBtn;
    JvImgBtn1063: TJvImgBtn;
    JvImgBtn1064: TJvImgBtn;
    JvImgBtn1065: TJvImgBtn;
    JvImgBtn1066: TJvImgBtn;
    JvImgBtn1067: TJvImgBtn;
    JvImgBtn1068: TJvImgBtn;
    JvImgBtn1069: TJvImgBtn;
    JvImgBtn1070: TJvImgBtn;
    JvImgBtn1071: TJvImgBtn;
    JvImgBtn1072: TJvImgBtn;
    JvImgBtn1073: TJvImgBtn;
    JvImgBtn1074: TJvImgBtn;
    JvImgBtn1075: TJvImgBtn;
    JvImgBtn1076: TJvImgBtn;
    JvImgBtn1077: TJvImgBtn;
    JvImgBtn1078: TJvImgBtn;
    JvImgBtn1079: TJvImgBtn;
    JvImgBtn1080: TJvImgBtn;
    TabSheet36: TTabSheet;
    JvImgBtn1081: TJvImgBtn;
    JvImgBtn1082: TJvImgBtn;
    JvImgBtn1083: TJvImgBtn;
    JvImgBtn1084: TJvImgBtn;
    JvImgBtn1085: TJvImgBtn;
    JvImgBtn1086: TJvImgBtn;
    JvImgBtn1087: TJvImgBtn;
    JvImgBtn1088: TJvImgBtn;
    JvImgBtn1089: TJvImgBtn;
    JvImgBtn1090: TJvImgBtn;
    JvImgBtn1091: TJvImgBtn;
    JvImgBtn1092: TJvImgBtn;
    JvImgBtn1093: TJvImgBtn;
    JvImgBtn1094: TJvImgBtn;
    JvImgBtn1095: TJvImgBtn;
    JvImgBtn1096: TJvImgBtn;
    JvImgBtn1097: TJvImgBtn;
    JvImgBtn1098: TJvImgBtn;
    JvImgBtn1099: TJvImgBtn;
    JvImgBtn1100: TJvImgBtn;
    JvImgBtn1101: TJvImgBtn;
    JvImgBtn1102: TJvImgBtn;
    JvImgBtn1103: TJvImgBtn;
    JvImgBtn1104: TJvImgBtn;
    JvImgBtn1105: TJvImgBtn;
    JvImgBtn1106: TJvImgBtn;
    JvImgBtn1107: TJvImgBtn;
    JvImgBtn1108: TJvImgBtn;
    JvImgBtn1109: TJvImgBtn;
    JvImgBtn1110: TJvImgBtn;
    JvImgBtn1111: TJvImgBtn;
    JvImgBtn1112: TJvImgBtn;
    JvImgBtn1113: TJvImgBtn;
    JvImgBtn1114: TJvImgBtn;
    JvImgBtn1115: TJvImgBtn;
    JvImgBtn1116: TJvImgBtn;
    TabSheet37: TTabSheet;
    JvImgBtn1117: TJvImgBtn;
    JvImgBtn1118: TJvImgBtn;
    JvImgBtn1119: TJvImgBtn;
    JvImgBtn1120: TJvImgBtn;
    JvImgBtn1121: TJvImgBtn;
    JvImgBtn1122: TJvImgBtn;
    JvImgBtn1123: TJvImgBtn;
    JvImgBtn1124: TJvImgBtn;
    JvImgBtn1125: TJvImgBtn;
    JvImgBtn1126: TJvImgBtn;
    JvImgBtn1127: TJvImgBtn;
    JvImgBtn1128: TJvImgBtn;
    JvImgBtn1129: TJvImgBtn;
    JvImgBtn1130: TJvImgBtn;
    JvImgBtn1131: TJvImgBtn;
    JvImgBtn1132: TJvImgBtn;
    JvImgBtn1133: TJvImgBtn;
    JvImgBtn1134: TJvImgBtn;
    JvImgBtn1135: TJvImgBtn;
    JvImgBtn1136: TJvImgBtn;
    JvImgBtn1137: TJvImgBtn;
    JvImgBtn1138: TJvImgBtn;
    JvImgBtn1139: TJvImgBtn;
    JvImgBtn1140: TJvImgBtn;
    JvImgBtn1141: TJvImgBtn;
    JvImgBtn1142: TJvImgBtn;
    JvImgBtn1143: TJvImgBtn;
    JvImgBtn1144: TJvImgBtn;
    JvImgBtn1145: TJvImgBtn;
    JvImgBtn1146: TJvImgBtn;
    JvImgBtn1147: TJvImgBtn;
    JvImgBtn1148: TJvImgBtn;
    JvImgBtn1149: TJvImgBtn;
    JvImgBtn1150: TJvImgBtn;
    JvImgBtn1151: TJvImgBtn;
    JvImgBtn1152: TJvImgBtn;
    TabSheet38: TTabSheet;
    JvImgBtn1153: TJvImgBtn;
    JvImgBtn1154: TJvImgBtn;
    JvImgBtn1155: TJvImgBtn;
    JvImgBtn1156: TJvImgBtn;
    JvImgBtn1157: TJvImgBtn;
    JvImgBtn1158: TJvImgBtn;
    JvImgBtn1159: TJvImgBtn;
    JvImgBtn1160: TJvImgBtn;
    JvImgBtn1161: TJvImgBtn;
    JvImgBtn1162: TJvImgBtn;
    JvImgBtn1163: TJvImgBtn;
    JvImgBtn1164: TJvImgBtn;
    JvImgBtn1165: TJvImgBtn;
    JvImgBtn1166: TJvImgBtn;
    JvImgBtn1167: TJvImgBtn;
    JvImgBtn1168: TJvImgBtn;
    JvImgBtn1169: TJvImgBtn;
    JvImgBtn1170: TJvImgBtn;
    JvImgBtn1171: TJvImgBtn;
    JvImgBtn1172: TJvImgBtn;
    JvImgBtn1173: TJvImgBtn;
    JvImgBtn1174: TJvImgBtn;
    JvImgBtn1175: TJvImgBtn;
    JvImgBtn1176: TJvImgBtn;
    JvImgBtn1177: TJvImgBtn;
    JvImgBtn1178: TJvImgBtn;
    JvImgBtn1179: TJvImgBtn;
    JvImgBtn1180: TJvImgBtn;
    JvImgBtn1181: TJvImgBtn;
    JvImgBtn1182: TJvImgBtn;
    JvImgBtn1183: TJvImgBtn;
    JvImgBtn1184: TJvImgBtn;
    JvImgBtn1185: TJvImgBtn;
    JvImgBtn1186: TJvImgBtn;
    JvImgBtn1187: TJvImgBtn;
    JvImgBtn1188: TJvImgBtn;
    TabSheet39: TTabSheet;
    JvImgBtn1189: TJvImgBtn;
    JvImgBtn1190: TJvImgBtn;
    JvImgBtn1191: TJvImgBtn;
    JvImgBtn1192: TJvImgBtn;
    JvImgBtn1193: TJvImgBtn;
    JvImgBtn1194: TJvImgBtn;
    JvImgBtn1195: TJvImgBtn;
    JvImgBtn1196: TJvImgBtn;
    JvImgBtn1197: TJvImgBtn;
    JvImgBtn1198: TJvImgBtn;
    JvImgBtn1199: TJvImgBtn;
    JvImgBtn1200: TJvImgBtn;
    JvImgBtn1201: TJvImgBtn;
    JvImgBtn1202: TJvImgBtn;
    JvImgBtn1203: TJvImgBtn;
    JvImgBtn1204: TJvImgBtn;
    JvImgBtn1205: TJvImgBtn;
    JvImgBtn1206: TJvImgBtn;
    JvImgBtn1207: TJvImgBtn;
    JvImgBtn1208: TJvImgBtn;
    JvImgBtn1209: TJvImgBtn;
    JvImgBtn1210: TJvImgBtn;
    JvImgBtn1211: TJvImgBtn;
    JvImgBtn1212: TJvImgBtn;
    JvImgBtn1213: TJvImgBtn;
    JvImgBtn1214: TJvImgBtn;
    JvImgBtn1215: TJvImgBtn;
    JvImgBtn1216: TJvImgBtn;
    JvImgBtn1217: TJvImgBtn;
    JvImgBtn1218: TJvImgBtn;
    JvImgBtn1219: TJvImgBtn;
    JvImgBtn1220: TJvImgBtn;
    JvImgBtn1221: TJvImgBtn;
    JvImgBtn1222: TJvImgBtn;
    JvImgBtn1223: TJvImgBtn;
    JvImgBtn1224: TJvImgBtn;
    TabSheet40: TTabSheet;
    JvImgBtn1225: TJvImgBtn;
    JvImgBtn1226: TJvImgBtn;
    JvImgBtn1227: TJvImgBtn;
    JvImgBtn1228: TJvImgBtn;
    JvImgBtn1229: TJvImgBtn;
    JvImgBtn1230: TJvImgBtn;
    JvImgBtn1231: TJvImgBtn;
    JvImgBtn1232: TJvImgBtn;
    JvImgBtn1233: TJvImgBtn;
    JvImgBtn1234: TJvImgBtn;
    JvImgBtn1235: TJvImgBtn;
    JvImgBtn1236: TJvImgBtn;
    JvImgBtn1237: TJvImgBtn;
    JvImgBtn1238: TJvImgBtn;
    JvImgBtn1239: TJvImgBtn;
    JvImgBtn1240: TJvImgBtn;
    JvImgBtn1241: TJvImgBtn;
    JvImgBtn1242: TJvImgBtn;
    JvImgBtn1243: TJvImgBtn;
    JvImgBtn1244: TJvImgBtn;
    JvImgBtn1245: TJvImgBtn;
    JvImgBtn1246: TJvImgBtn;
    JvImgBtn1247: TJvImgBtn;
    JvImgBtn1248: TJvImgBtn;
    JvImgBtn1249: TJvImgBtn;
    JvImgBtn1250: TJvImgBtn;
    JvImgBtn1251: TJvImgBtn;
    JvImgBtn1252: TJvImgBtn;
    JvImgBtn1253: TJvImgBtn;
    JvImgBtn1254: TJvImgBtn;
    JvImgBtn1255: TJvImgBtn;
    JvImgBtn1256: TJvImgBtn;
    JvImgBtn1257: TJvImgBtn;
    JvImgBtn1258: TJvImgBtn;
    JvImgBtn1259: TJvImgBtn;
    JvImgBtn1260: TJvImgBtn;
    btpd36: TJvImgBtn;
    btpd35: TJvImgBtn;
    btpd34: TJvImgBtn;
    btpd33: TJvImgBtn;
    btpd32: TJvImgBtn;
    btpd31: TJvImgBtn;
    btgp7: TJvImgBtn;
    btgp8: TJvImgBtn;
    btgp9: TJvImgBtn;
    btgp10: TJvImgBtn;
    btgp11: TJvImgBtn;
    btgp12: TJvImgBtn;
    btgp13: TJvImgBtn;
    btgp14: TJvImgBtn;
    btgp15: TJvImgBtn;
    btgp16: TJvImgBtn;
    JvImgBtn174: TJvImgBtn;
    TabSheet2: TTabSheet;
    btgp17: TJvImgBtn;
    btgp18: TJvImgBtn;
    btgp19: TJvImgBtn;
    btgp20: TJvImgBtn;
    btgp21: TJvImgBtn;
    btgp22: TJvImgBtn;
    btgp23: TJvImgBtn;
    btgp24: TJvImgBtn;
    btgp25: TJvImgBtn;
    btgp26: TJvImgBtn;
    btgp27: TJvImgBtn;
    btgp28: TJvImgBtn;
    btgp29: TJvImgBtn;
    btgp30: TJvImgBtn;
    btgp31: TJvImgBtn;
    btgp32: TJvImgBtn;
    SpeedButton5: TJvImgBtn;
    SpeedButton4: TJvImgBtn;
    SpeedButton1: TJvImgBtn;
    SpeedButton2: TJvImgBtn;
    ImageList1: TImageList;
    JvTransparentButton2: TJvTransparentButton;
    painelProdutos: TAdvPanel;
    lbOrdem: TLabel;
    lbDescricaoProduto: TLabel;
    lbQuantidadeProduto: TLabel;
    lbX: TLabel;
    lbValorUnitarioProduto: TLabel;
    lbTotalProduto: TLabel;
    lblabelTotal: TLabel;
    btObsProduto: TImage;
    btDeleteProduto: TImage;
    shapeLinha: TShape;
    SpeedButton3: TSpeedButton;
    Image1: TImage;
    Image2: TImage;
    pnScroll: TPanel;
    ScrollBox1: TScrollBox;
    btAcessoDelivery: TJvTransparentButton;
    CurvyPanel1: TCurvyPanel;
    ed_cod_produto: TEdit;
    Label5: TLabel;
    procedure mudaCaptionsBotoes();
    procedure criaBotoesTouch();
    procedure ed_numero_mesaExit(Sender: TObject);
    function busca_movimento_da_mesa: boolean;

    function pesquisar_produto: boolean;
    function verifica_validade_lancamento: boolean;
    function adicionar_produto_conta(mesa : string; enviar_impressao : boolean ): boolean;
    function pesquisa_produto: boolean;

    procedure l(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure FormActivate(Sender: TObject);
    procedure ed_numero_mesaEnter(Sender: TObject);
    procedure B20002002Click(Sender: TObject);
    procedure DBGrid1DrawDataCell(Sender: TObject; const Rect: TRect; Field: TField; State: TGridDrawState);
    procedure timerInativacaoPedidosTimer(Sender: TObject);
    procedure bt_pesq_produtoClick(Sender: TObject);
    procedure B20002001KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);

    procedure  adicionaProdutoLista(idProduto : Largeint);


    procedure recriaMemo();
    procedure limpaMesaPDV();
    procedure B300010040Click(Sender: TObject);
    procedure verificar_permissoes;
    procedure voltar_mesa;
    procedure B20002014Click(Sender: TObject);
    procedure D30001011Exit(Sender: TObject);
    procedure D30001011MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);

    procedure apagaItemMovimento(qtde: double; codMotivo : string; descricaoMotivo: string; obs : string);

    procedure B30001007Click(Sender: TObject);

    procedure fecharConta();

    procedure efetuar_lancamento;
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);

    procedure ed_numero_mesaChange(Sender: TObject);
    procedure ed_cod_produtoChange(Sender: TObject);
    procedure ed_quantidadeChange(Sender: TObject);

    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure timerAtualizaTelaMesasTimer(Sender: TObject);
    function  verifica_movimento: boolean;

    procedure enter_botao(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure btCalculadoraClick(Sender: TObject);
    procedure B20001003Click(Sender: TObject);
    procedure CancelamentodeProduto1Click(Sender: TObject);

    procedure gravarEstornoMesa(mesa : string);
    procedure muda_acao(tipo : integer);

    procedure pisca1Timer(Sender: TObject);
    procedure pisca2Timer(Sender: TObject);
    procedure pnExpedicaoClick(Sender: TObject);
    procedure imgAtencaoClick(Sender: TObject);
    procedure Image1Click(Sender: TObject);
    procedure lbPedidosClick(Sender: TObject);
    procedure Label12Click(Sender: TObject);
    procedure AtualizarPedidos();
    procedure btMapaMesasClick(Sender: TObject);
    procedure btMenuFiscalClick(Sender: TObject);
    procedure btOpCaixaClick(Sender: TObject);
    procedure timerPedidosTimer(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure JvGradient1Click(Sender: TObject);
    procedure MakeRounded(Control: TWinControl);
    procedure FormCreate(Sender: TObject);


    procedure btpd011Click(Sender: TObject);




    procedure SpeedButton6Click(Sender: TObject);
    procedure SpeedButton7Click(Sender: TObject);
    procedure SpeedButton10Click(Sender: TObject);
    procedure SpeedButton9Click(Sender: TObject);



    procedure SpeedButton11Click(Sender: TObject);

    procedure btsairClick(Sender: TObject);



    procedure btFecharContaClick(Sender: TObject);
    procedure JvTransparentButton2Click(Sender: TObject);
    procedure B20002003Click(Sender: TObject);
    procedure btOperacoesCaixaClick(Sender: TObject);
    procedure JvTransparentButton6Click(Sender: TObject);
    procedure btConsultarProdutosClick(Sender: TObject);
    procedure btgp1Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure JvTransparentButton1Click(Sender: TObject);
    function  lerPesoDaBalanca(codProduto : string) : boolean;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btObsProdutoClick(Sender: TObject);
    procedure btDeleteProdutoClick(Sender: TObject);
    procedure Image2Click(Sender: TObject);
    procedure btAcessoDeliveryClick(Sender: TObject);
    procedure ed_cod_produtoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);


  private
    { Private declarations }
    modo_exibicao: integer;
    paginaAtual : integer;
    paginasGrupoCriadas : integer;
    numeroMesaPdv : string;
    codigoGarconPdv : string;
    quantidadeLancamento : Double ;
    MyHandle : THandle;
    HandleMaeFocus : THandle;
    HandleFilhaFocus : THandle;
    function VerificaProblemaNegativo: boolean;
    procedure apagarItemLista(id: integer);
    procedure ApplicationMessage(var Msg: TMsg; var Handled: Boolean);
    procedure getDadosProduto(codProduto: string);

    //0 normal
    //1 resumido

  public
    { Public declarations }
   tipo_caixa_atual : integer;
   desistirCancelamento : Boolean;
    permiteFecharForm : boolean;

  end;





var
  frmFrenteCaixa: TfrmFrenteCaixa;
  tx_serv: double;
  pagina :TScrollbox;
  tipo_botao : integer;
  selecionado : string;
  total_mesas : integer;
  resumido : boolean;


implementation

uses uu_data_module,
  uu_cs_produtos,
  uu_frm_principal,
  
  uu_transferir_item,
  uu_transferir_mesa,
  uu_cs_garcons,
  uu_encerramento,
  uu_extrato,
  uu_recebimentos_parciais,

  uu_confirma_extrato, uu_obs_lancamento_caixa, 
  
  uuPrincipalDelivery, uuSelecaoCouvert, uuSelecaoSaboresPizza,
  uuExpedicaoDelivery, uuMapaMesas, uuMenuFiscal,
  uuOperacoesCaixa,
  uu_caixa_restaurante, uuSenhaGarcon, uuLeCartaoLancamento,
  uuLancamentosSalao, Math, uuCancelaItemPDV, uuDigitaPesoManualmente;
{$R *.dfm}

procedure TfrmFrenteCaixa.ed_numero_mesaExit(Sender: TObject);
var
 qtdeCalculada : double;
begin

    if sender is TDBGrid then
  begin
    (sender as TDBGrid).Color := clWhite;
  end;




  if ((sender is Tedit and ((sender as Tedit).Name = 'ed_cod_produto'))  ) then
  begin
   if (trim(ed_cod_produto.Text) = '') then exit;

   if trim(ed_quantidade.text) = ''  then ed_quantidade.text:='1';



    try
      begin
        StrToInt(ed_cod_produto.Text);
        ed_cod_produto.Text := FormatFloat('00000', strtofloat(ed_cod_produto.Text));
      end;
    except
      begin
      end;
    end;

    dm.qryauxiliar.Active := false;
    dm.qryauxiliar.SQL.Clear;
    dm.qryauxiliar.SQL.Add('select * from produtos where cod_barras=' + Quotedstr(ed_cod_produto.Text));
    dm.qryauxiliar.Active := true;

    if dm.qryauxiliar.IsEmpty then
    begin
      dm.exibe_painel_erro('O código informado não pertence a um produto cadastrado!','Continuar');

      ed_cod_produto.SetFocus;
      ed_cod_produto.Clear;
      exit;
    end;

    lb_cod_produto.Caption := dm.qryauxiliar.fieldbyname('cod_produto').value;
    ed_descricao_produto.Text :=  dm.centralizar(dm.qryauxiliar.fieldbyname('descricao').value,30);
    edValorUnitario.Value := dm.qryauxiliar.fieldbyname('valor_unitario').value;


    if ( verificaProdutoDigitaPreco(ed_cod_produto.Text) = true) then
     begin
     // Tratar esse caso aqui pro PDV
     end

    else
     begin



     end;



  end;


  if ((sender is Tedit and ((sender as Tedit).Name = 'ed_quantidade'))) then
  begin
     IF  (trim(ed_quantidade.text) = '') THEN exit;


      efetuar_lancamento();


  end;


end;



function TfrmFrenteCaixa.busca_movimento_da_mesa: boolean;
var
  valor_bruto: double;
  valor_tx_serv: double;
  valorDescontos : double;
  Marcado : TBooleanField;
  qtde : string;

begin


  dm.transacao.Active := false;
  dm.transacao.Active := true;
  percentualTaxaServico:= 0;


  dm.qry_movimento_mesa.Active := false;
  dm.qry_movimento_mesa.sql.clear;
  dm.qry_movimento_mesa.SQL.Add('select mv.cod_mesa,pr.cod_barras,');
  dm.qry_movimento_mesa.sql.Add(' mv.cod_produto,pr.cod_produto,');
  dm.qry_movimento_mesa.sql.Add(' pr.descricao,mv.quantidade as quantidade, pr.un_ecf,');
  dm.qry_movimento_mesa.sql.Add('mv.valor_unitario,');
  dm.qry_movimento_mesa.sql.add('udf_roundabnt((mv.valor_unitario * mv.quantidade),2) as total');
  dm.qry_movimento_mesa.sql.Add(',mv.comanda, mv.cod_garcon, g.apelido,u.login,mv.hora_lancamento, mv.estado,mv.cod_movimento, mv.desconto,id,impresso,observacoes,sabores,obs_paf,cancelado');
  dm.qry_movimento_mesa.SQL.Add('  from movimento_mesa mv ');
  dm.qry_movimento_mesa.sql.Add('  inner join produtos pr on (pr.cod_produto=mv.cod_produto)');
  dm.qry_movimento_mesa.sql.add('  inner join garcons g on (g.cod_garcon=mv.cod_garcon) ');
  dm.qry_movimento_mesa.SQL.add('  inner join usuarios u on (u.cod_usuario=mv.cod_usuario)');
  dm.qry_movimento_mesa.SQL.add('  where cancelado=0 and  mv.cod_mesa=' + Quotedstr(numeroMesaPdv) + ' order by mv.cod_movimento');
  dm.qry_movimento_mesa.Active := true;



  valor_bruto := 0;
  valor_tx_serv := 0;
  valorDescontos :=0;


  dm.qry_movimento_mesa.First;

  dm.qry_movimento_mesa.FetchAll;


  dm.qryauxiliar.Active:=FALSE;
  dm.qryauxiliar.sql.clear;
  dm.qryauxiliar.SQL.add('select * from rodapeextrato2('+Quotedstr(numeroMesaPdv)+','+dm.TrocaVirgPPto(Floattostr(percentualTaxaServico))+')');
  dm.qryauxiliar.Active:=true;

  if ( dm.qryauxiliar.IsEmpty  = false )then
   begin
  if tipo_caixa_atual = 1 then
     begin
        ed_total_conta.Value := dm.qryauxiliar.fieldbyname('VALORBRUTO').Value;
     end
    else
     begin
        ed_total_conta.Value := dm.qryauxiliar.fieldbyname('VALORTOTAL').Value;
     end;

   end
  else
   begin
     ed_total_conta.Value;
   end;




end;


procedure TfrmFrenteCaixa.apagarItemLista(id : integer);
var
x: integer;
cp : TWinControl;
begin

     for x:= 0 to ScrollBox1.ComponentCount -1  do
       begin
        cp := TWinControl(  ScrollBox1.Components[x]);
        if ( (cp.Tag = id) and (cp.ClassName ='TPanel')) then
         begin
          cp.Visible := false;
//          FreeAndNil(cp);
          exit;
         end;
       end;

  //     ScrollBox1.Refresh;
//       ScrollBox1.Repaint;

end;

procedure TfrmFrenteCaixa.recriaMemo();
 var qtde : string;
 x: integer;
 cp : TComponent;



begin
  dm.qry_movimento_mesa.First;
  dm.qry_movimento_mesa.FetchAll;

  ScrollBox1 := TScrollBox( pnScroll.FindComponent('ScrollBox1'));
  if ScrollBox1 <> nil then
   begin
     FreeAndNil(ScrollBox1);
   end;

  ScrollBox1 := TScrollBox.Create(pnScroll  );
  ScrollBox1.Name := 'ScrollBox1';
  ScrollBox1.Parent := pnScroll;
   ScrollBox1.Left := 0;
  ScrollBox1.Top := 0;
  ScrollBox1.Width := 360;
  ScrollBox1.Height := 489;
  ScrollBox1.TabOrder := 0;
  ScrollBox1.HorzScrollBar.Visible := false;
  ScrollBox1.VertScrollBar.Visible := true;
  ScrollBox1.VertScrollBar.ParentColor := false;
  ScrollBox1.VertScrollBar.Color := clWhite;


 dm.qry_movimento_mesa.First;
 dm.qry_movimento_mesa.FetchAll;

  while not dm.qry_movimento_mesa.Eof do
  begin
     qtde := FormatFloat('###,###,##0.000 ',dm.qry_movimento_mesa.fieldbyname('quantidade').Value);
     qtde := qtde + dm.qry_movimento_mesa.fieldbyname('un_ecf').Value +' X ';
     adicionaProdutoLista(dm.qry_movimento_mesa.fieldbyname('id').Value);
     dm.qry_movimento_mesa.Next;
  end;
end;


function TfrmFrenteCaixa.pesquisar_produto: boolean;
begin
  dm.qry_consultas.Active := false;
  dm.qry_consultas.SQL.Clear;
  dm.qry_consultas.SQL.add('select * from produtos ');
  dm.qry_consultas.Active := true;

  if dm.qry_consultas.IsEmpty then
  begin
    dm.exibe_painel_erro('Não existem produtos cadastrados!','Ok');
    exit;
  end
  else
  begin
    Application.CreateForm(Tfrm_consulta_produtos, frm_consulta_produtos);
    frm_consulta_produtos.ShowModal;
    ed_cod_produto.Text := string_aux_cod_barras;
    frm_consulta_produtos.Free;
  end;
end;

function TfrmFrenteCaixa.verifica_validade_lancamento: boolean;
begin
  result:=true;


  try
    StrToFloat(ed_quantidade.Text);
  except
    begin
      dm.exibe_painel_erro('Quantidade inválida','Ok');
      ed_quantidade.Clear;
      ed_quantidade.SetFocus;
      exit;
    end;
  end;


  if not (verificaSeProdutoVendeFracionado(ed_cod_produto.Text,2) )then
  begin
    try
      strToInt(ed_quantidade.Text);
    except
     begin
       dm.exibe_painel_erro('O produto informado não pode ser vendido fracionadamente','Ok');
       ed_quantidade.clear;
       ed_quantidade.SetFocus;
       Result:=false;
       exit;
     end;
    end;
  end;



  dm.qryauxiliar.Active := false;
  dm.qryauxiliar.SQL.Clear;  
  dm.qryauxiliar.SQL.Add('select * from produtos where cod_barras=' + Quotedstr(trim(ed_cod_produto.Text)));
  dm.qryauxiliar.Active := true;

  if dm.qryauxiliar.IsEmpty then
  begin
    dm.exibe_painel_erro('Produto não cadastrado!','Ok');
    ed_cod_produto.SetFocus;
    ed_cod_produto.Clear;
    Result := false;
    exit;
  end;



  if ( StrToFloat(ed_quantidade.Text) >= 5 ) then
   begin
     if dm.painelDePergunta(#13#10+'  A quantidade informada é considerada alta!'+#13#10+#13#10+'    Tem certeza que deseja lançar '+FormatFloat('#0.000',StrToFloat(ed_quantidade.Text))+'  '+ed_descricao_produto.Text+' nesta conta ?',20) then
       begin
         Result :=true;
       end
     else
       begin
         Result:=false;
         ed_quantidade.SetFocus;
         exit;
       end;
   end;









  Result := true;
end;

function TfrmFrenteCaixa.adicionar_produto_conta(mesa : string; enviar_impressao : boolean ): boolean;
var
  codigo_lancamento: string;
  observacoesProducao, saboresProducao : string;
  idMovimentoMesa : Largeint;
  codProdutoPizza : string;
  ct,qtdeProduto : integer;
begin

 if (ed_quantidade.Value <=0) then
  begin
    ed_quantidade.Value := 1;
    dm.adicionaLog('Ocorreu o problema da quantidade');
  end;

 frm_principal.obsSaborPizza:='';
 if ( verificaSeProdutoEhPizza(ed_cod_produto.Text,2) = true) then
  begin
   frm_principal.obsSaborPizza:='';
   dm.tbSaboresPizzaTemp.Active:=false;
   dm.tbSaboresPizzaTemp.EmptyTable;
   Application.CreateForm(TfrmSelecaoSaboresPizza,frmSelecaoSaboresPizza);
   frmSelecaoSaboresPizza.ShowModal;
   frmSelecaoSaboresPizza.Free;


   edValorUnitario.Value   :=  getValorPizza  (ed_cod_produto.Text,2,1);


  end;




  saboresProducao:='';

 if ( verificaSeProdutoEhPizza(ed_cod_produto.Text,2) = true) then
  begin
    dm.tbSaboresPizzaTemp.First;
    while not dm.tbSaboresPizzaTemp.Eof do
     begin
       saboresProducao:= saboresProducao+dm.tbSaboresPizzaTemptamanho.Value+' '+dm.tbSaboresPizzaTempdescricao.value+#10#13;
       dm.tbSaboresPizzaTemp.Next;
     end;
     observacoesProducao:=  frm_principal.obsSaborPizza;
  end
 else
  begin
   observacoesProducao := '';


    if (StrToInt(dm.LeIni(1,'CAIXA','observacaoLancamento')) = 1) then
     begin

       if ( verificaSeProdutoRequerObservacao(ed_cod_produto.Text,2) = true) then
        begin

           if dm.painelDePergunta(#13#10+'  INFORMAR OBSERVAÇÕES ?'+#13#10+#13#10,25) then
             begin
              Application.CreateForm(Tfrm_obs_lancamento_caixa, frm_obs_lancamento_caixa);
              frm_obs_lancamento_caixa.ShowModal;
              frm_obs_lancamento_caixa.free;
             end;
        end;
     end;

     observacoesProducao := strObsProduto + frm_principal.tipoMassaPizza;



  end;






  permiteFecharForm := false;
  idMovimentoMesa:=  strToInt(dm.geraCodigo('G_MOVIMENTO_MESA',15));
  dm.qryauxiliar.active := false;
  dm.qryauxiliar.SQL.clear;
  dm.qryauxiliar.sql.add('select max(cod_movimento)as novo_cod from movimento_mesa where cod_mesa=' + QuotedStr(mesa));
  dm.qryauxiliar.Active := true;

  if ((dm.qryauxiliar.IsEmpty) or (dm.qryauxiliar.fieldbyname('novo_cod').IsNull)) then
  begin
    codigo_lancamento := '1';
    codigo_lancamento := FormatFloat('0000', Strtofloat(codigo_lancamento));
  end
  else
  begin
    codigo_lancamento := VarToStr(dm.qryauxiliar.fieldbyname('novo_cod').value);
    codigo_lancamento := IntToStr(StrToInt(codigo_lancamento) + 1);
    codigo_lancamento := FormatFloat('0000', Strtofloat(codigo_lancamento));
  end;




 if (ed_quantidade.Value <=0) then
  begin
    ed_quantidade.Value := 1;
    dm.adicionaLog('Ocorreu o problema da quantidade');
  end;


  dm.qryauxiliar.Active := false;
  dm.qryauxiliar.SQL.clear;
  dm.qryauxiliar.sql.add('insert into movimento_mesa (cod_mesa,cod_garcon,cod_produto,quantidade,comanda,cod_movimento,');
  dm.qryauxiliar.sql.add('numero_caixa,cod_usuario,valor_unitario,id,observacoes,sabores) values (');
  dm.qryauxiliar.sql.add('' + QuotedStr(mesa) + ',');
  dm.qryauxiliar.sql.add('' + QuotedStr(codigoGarconPDV) + ',');

  dm.qryauxiliar.sql.add('' + QuotedStr(lb_cod_produto.Caption) + ',');

  dm.qryauxiliar.sql.add('' + DM.TrocaVirgPPto(ed_quantidade.text) + ',');
  dm.qryauxiliar.sql.add('' +QuotedStr('') + ',');
  dm.qryauxiliar.sql.add('' + Quotedstr(codigo_lancamento) + ',');
  dm.qryauxiliar.sql.add('' + Quotedstr(numero_caixa) + ',');
  dm.qryauxiliar.sql.add('' + Quotedstr(codigo_usuario) + ',');

  dm.qryauxiliar.SQL.Add('' + dm.TrocaVirgPPto(FloatToStr(edValorUnitario.Value))+',');
  dm.qryauxiliar.SQL.add(IntToStr(idMovimentoMesa)+ ',');
  dm.qryauxiliar.sql.add('' + Quotedstr('') + ',');
  dm.qryauxiliar.sql.add('' + Quotedstr('') + ')');


  try
    begin
      dm.adicionaLog(dm.qryauxiliar.SQL.Text); 
      dm.qryauxiliar.ExecSQL;
      Result := true;
    end;
  except
    begin
      dm.cria_log_de_erros(dm.qryauxiliar.sql, 'Caixa - Restaurante ', 'Erro ao lançar produto no movimento da mesa ', codigo_usuario);
      Result := false;
      exit;
    end;
  end;

  if (dm.tbSaboresPizzaTemp.IsEmpty = False ) then
   begin
     dm.qryauxiliar.Active := False;
     dm.qryauxiliar.sql.Clear;
     dm.tbSaboresPizzaTemp.First;

     while not dm.tbSaboresPizzaTemp.Eof do
      begin
       dm.qryauxiliar.Active := false;
       dm.qryauxiliar.SQL.clear;
       dm.qryauxiliar.SQL.Add('insert into SABORES_PIZZA_MOVIMENTO_MESA (COD_MESA,ID_MOV_MESA,COD_PRODUTO,COD_SABOR,QUANTIDADE,VALOR_UNITARIO_SABOR,PROPORCAO,DESCRICAO) values (');
       dm.qryauxiliar.sql.add('' + QuotedStr(mesa) + ',');
       dm.qryauxiliar.SQL.add(IntToStr(idMovimentoMesa)+ ',');
       dm.qryauxiliar.SQL.add(Quotedstr(dm.tbSaboresPizzaTempcodProduto.Value)+',');
       dm.qryauxiliar.SQL.add(Quotedstr(dm.tbSaboresPizzaTempcodigo.Value)+',');
       dm.qryauxiliar.sql.add('' + DM.TrocaVirgPPto(Floattostr(dm.tbSaboresPizzaTempproporcao.Value) ) + ',');
       dm.qryauxiliar.sql.add('' + DM.TrocaVirgPPto(Floattostr(dm.tbSaboresPizzaTempvalorSabor.Value) ) + ',');
       dm.qryauxiliar.SQL.add(Quotedstr(dm.tbSaboresPizzaTemptamanho.Value)+',');
       dm.qryauxiliar.SQL.add(Quotedstr(dm.tbSaboresPizzaTempdescricao.Value)+')');
       dm.qryauxiliar.ExecSQL;
       dm.tbSaboresPizzaTemp.Next;
      end;

   end;



  dm.tbSaboresPizzaTemp.Active:=false;
  dm.tbSaboresPizzaTemp.EmptyTable;



  if enviar_impressao then
   begin

    if mesa <> dm.getCodMesaBalcao then
     begin
      if ( (dm.verificaProdutoImprimeLocalProducao(lb_cod_produto.Caption))  and (dm.verificaProdutoImprimeMesas(lb_cod_produto.Caption ) ))   then
       begin
          dm.enviaProdutoParaFilaImpressao(codigoGarconPDV,lb_cod_produto.Caption, mesa, StrToFloat(ed_quantidade.Text),observacoesProducao,saboresProducao,'1',-1,IntToStr(idMovimentoMesa),'');
       end;
     end
    else
     begin
      if ( (dm.verificaProdutoImprimeLocalProducao(lb_cod_produto.Caption))  and (dm.verificaProdutoImprimeBalcao(lb_cod_produto.Caption ) ))   then
       begin
          if verificaSeNumeroInteiro(StrToFloat(ed_quantidade.Text)) then
            begin
             qtdeProduto :=  strToInt(ed_quantidade.Text);
             for ct := 1 to qtdeProduto do
              begin
                dm.enviaProdutoParaFilaImpressao(codigoGarconPDV, ed_cod_produto.Text  , mesa, 1 ,observacoesProducao,saboresProducao,'1',-1,IntToStr(idMovimentoMesa),'');

              end;

            end
          else
           begin
             dm.enviaProdutoParaFilaImpressao(codigoGarconPDV,lb_cod_produto.Caption , mesa, StrToFloat(ed_quantidade.Text),observacoesProducao,saboresProducao,'1',-1,IntToStr(idMovimentoMesa),'');
           end;

       end;
     end;
     strObsProduto:='';
   end;



  if dm.transacao.Active = false then dm.transacao.Active := true;
  dm.transacao.Commit;


  busca_movimento_da_mesa;

  ed_cod_produto.Clear;
  strObsProduto :='';
  observacoesProducao  :='';
  ed_descricao_produto.Clear;
  ed_quantidade.Text := '1';
  edValorUnitario.Value :=0;
  edTotalProduto.Value :=0;




end;

procedure TfrmFrenteCaixa.l(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin  if (Column.Field.FieldName = 'TOTAL') then
  begin
    {         DBGrid1.Canvas.Brush.Color:= clRed;
             DBGrid1.Canvas.Font.Style:=[fsbold];
             DBGrid1.Canvas.Font.Color:= clWhite;
             DBGrid1.Canvas.FillRect(Rect);
             DBGrid1.DefaultDrawColumnCell(Rect, DataCol, Column, State);
             }
  end;

end;

procedure TfrmFrenteCaixa.FormActivate(Sender: TObject);
var
pn1 : TPanel;
OldValue : LongBool;

begin

  //dm.desabilitaCltrAltDel();

  permiteFecharForm := false;
  Self.top:=0;
  self.Left :=0;


// MakeRounded(pnCalculadora);

// MakeRounded(pnMenuFiscal);

 MakeRounded(pnMovimentoMesa);
// MakeRounded(pnRodape);
 MakeRounded(pnBotoes );


 MakeRounded(pnQtde);
 MakeRounded(pnDescricaoProduto);
 MakeRounded(ed_descricao_produto);
 MakeRounded(ed_quantidade);
 MakeRounded(edValorUnitario);
 MakeRounded(edTotalProduto);
 MakeRounded(ed_cod_produto);
 MakeRounded(pnSubtotal);
 MakeRounded(ed_total_conta  );
 MakeRounded(panel16 );
 MakeRounded(pnGrupos);
// MakeRounded(JvImgBtn1); 

 MakeRounded(pnMovimento);
 MakeRounded(pnProdutos);
//  MakeRounded(pnNomeEmpresa);

  resumido := false;
  muda_acao(1);
  AtualizarPedidos();


  mudaCaptionsBotoes();
  setCaption('Caixa');
  frmFrenteCaixa.Top := 0;
  if (StrToInt(dm.LeIni(2, 'CAIXA', 'comanda_numerada')) = 0) then
  begin
//    numeroMesaPdv:='';
  end;



  if trim(numeroMesaPdv) <> '' then
  begin
    busca_movimento_da_mesa;
    ed_cod_produto.SetFocus;
    if tipo_caixa_atual = 2 then

  end;


  busca_movimento_da_mesa();
  recriaMemo();

end;

procedure TfrmFrenteCaixa.ed_numero_mesaEnter(Sender: TObject);
begin

  if sender is Tedit and (((sender as Tedit).Name = 'ed_cod_produto')) then
  begin

    ed_cod_produto.SelectAll;






  end;


end;

procedure TfrmFrenteCaixa.B20002002Click(Sender: TObject);
var
  linha: integer;
  valor_total: double;
begin

  if (dm.verificaPermissaoAcao((sender as TBitBtn).Name) = true) then
    fecharConta();

end;




procedure TfrmFrenteCaixa.DBGrid1DrawDataCell(Sender: TObject; const Rect: TRect; Field: TField; State: TGridDrawState);
begin

  {
   if gdSelected in State then
   begin
     With (Sender as TDbGrid).Canvas do
     begin
       Brush.Color := clRed;
       FillRect(Rect);
     end;
   end;
   (Sender as TDBGrid).DefaultDrawDataCell(Rect, Field, State);

 }

  if gdSelected in State then
  begin
    with (Sender as TDbGrid).Canvas do
    begin
      Brush.Color := clRed;
      FillRect(Rect);
    end;
  end;
  (Sender as TDBGrid).DefaultDrawDataCell(Rect, Field, State);

end;

procedure TfrmFrenteCaixa.timerInativacaoPedidosTimer(Sender: TObject);
begin
 if (dm.verificaMesaBalcao(numeroMesaPdv) = false ) then
 begin
   dm.ImprimeFilaDeImpressao(false,'',1); 
 end;

end;

function TfrmFrenteCaixa.pesquisa_produto: boolean;
begin
  dm.qry_consultas.Active := false;
  dm.qry_consultas.SQL.Clear;
  dm.qry_consultas.SQL.add('select * from produtos ');
  dm.qry_consultas.Active := true;

  if dm.qry_consultas.IsEmpty then
  begin
   dm.exibe_painel_erro('Não existem produtos cadastrados!','Ok');

    exit;
  end
  else
  begin
    Application.CreateForm(Tfrm_consulta_produtos, frm_consulta_produtos);
    frm_consulta_produtos.ShowModal;
    ed_cod_produto.Text := string_aux_cod_barras;
    frm_consulta_produtos.Free;

    getDadosProduto(ed_cod_produto.Text);

  end;
end;

procedure TfrmFrenteCaixa.bt_pesq_produtoClick(Sender: TObject);
begin
  pesquisa_produto;
end;

procedure TfrmFrenteCaixa.B20002001KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin

  if (( key = vk_escape) and (dm.verificaMesaBalcao(numeroMesaPdv) = false)) then
  begin
    dm.qry_movimento_mesa.Active := false;
    ed_cod_produto.clear;
    ed_descricao_produto.Clear;

    ed_total_conta.Text := '0,00';

    voltar_mesa;
  end
 else
    voltar_mesa;
end;                      




procedure TfrmFrenteCaixa.B300010040Click(Sender: TObject);
begin
   if dm.painelDePergunta(#13#10+'  Confirma cancelamento do produto ?'+#13#10+#13#10,22) then
    begin
      dm.qrymax.Active := false;
      dm.qrymax.SQL.Clear;
      dm.qrymax.SQL.Add('delete from movimento_mesa where cod_mesa=' + quotedstr(numeroMesaPdv) + ' and cod_movimento=' + Quotedstr(dm.qry_movimento_mesa.fieldbyname('cod_movimento').value));
      dm.qrymax.ExecSQL;
      if dm.transacao.Active = false then dm.transacao.Active := true;
      dm.transacao.Commit;
      busca_movimento_da_mesa;
    end

end;

procedure TfrmFrenteCaixa.verificar_permissoes;
var
  modulo, submodulo: string;
  x: integer;
begin
  x := 0;
  while x < ComponentCount - 1 do
  begin
    {
      if  Components[x].ClassName='TBitBtn'
        then
          begin
             modulo:=Trim(copy(TBitBtn(Components[x]).Name,2,5));
             submodulo:=Trim(copy(TBitBtn(Components[x]).Name,7,15));
             if dm.verifica_permissao(modulo,submodulo,codigo_usuario,false)=false
             then
               TBitBtn(Components[x]).Enabled:=false
             else
               TBitBtn(Components[x]).Enabled:=true;
          end;
     }
    if Components[x].ClassName = 'TDBGrid' then
    begin
      modulo := Trim(copy(TDBGrid(Components[x]).Name, 2, 5));
      submodulo := Trim(copy(TDBGrid(Components[x]).Name, 7, 15));
      if dm.verifica_permissao(modulo, submodulo, codigo_usuario, false) = false then
      begin
        TDBGrid(Components[x]).Visible := false;

//        rdg_modo_visualizacao.Visible:=false;
//        fundo_caixa.Visible := true;
//        fundo_caixa.Picture.LoadFromFile(dm.LeIni(2, 'IMAGENS', 'fundo_caixa'));
      end
      else
        TDBGrid(Components[x]).Visible := true;

    end;

    if Components[x].ClassName = 'TGroupBox' then
    begin
      modulo := Trim(copy(TGroupBox(Components[x]).Name, 2, 5));
      submodulo := Trim(copy(TGroupBox(Components[x]).Name, 7, 15));
      if dm.verifica_permissao(modulo, submodulo, codigo_usuario, false) = false then
      begin
        TGroupBox(Components[x]).Visible := false;
      end
      else
        TGroupBox(Components[x]).Visible := true;
    end;

    x := x + 1;
  end;
end;

procedure TfrmFrenteCaixa.voltar_mesa;
begin
//  alternarTipoCaixa(tipo ;
  resumido := false;
  ed_cod_produto.Clear;
  ed_descricao_produto.clear;
  ed_quantidade.Clear;
  dm.qry_movimento_mesa.Active := false;


  ed_total_conta.Value := 0;



end;

procedure TfrmFrenteCaixa.B20002014Click(Sender: TObject);
begin
  if (dm.verificaPermissaoAcao((sender as TBitBtn).Name) = true) then
  begin
  end;

  // voltar_mesa;
end;

procedure TfrmFrenteCaixa.D30001011Exit(Sender: TObject);
begin
  if sender is TDBGrid then
  begin
    (sender as TDBGrid).Color := clWhite;
  end;

end;

procedure TfrmFrenteCaixa.apagaItemMovimento(qtde: double; codMotivo : string; descricaoMotivo: string; obs : string);
var
  result: string;
  qtd_restante: double;
  total_registros: integer;
  q : TIBQuery;
  impCancelamentoLocalProducao : boolean;
  idProduto : integer;
begin

  q := TIBQuery.Create(self);
  q.Database := dm.dbrestaurante;
  q.Transaction := dm.transacao;
  q.Active:=false;
  q.SQL.clear;
  dm.transacao.Active := true;




  if verifica_movimento then
  begin
   if dm.painelDePergunta(#13#10+'  Confirma cancelamento do produto ?'+#13#10+#13#10,22) then
    begin
      idProduto := dm.qry_movimento_mesa.fieldbyname('ID').value;

      impCancelamentoLocalProducao:=false;
      dm.gravarEstornoDeItem(numeroMesaPdv,codMotivo,descricaoMotivo, dm.qry_movimento_mesa.fieldbyname('cod_barras').value,dm.qry_movimento_mesa.fieldbyname('descricao').value,qtde,(dm.qry_movimento_mesa.fieldbyname('valor_unitario').value),obs,impCancelamentoLocalProducao,'','',
      dm.qry_movimento_mesa.fieldbyname('ID').value );
      q.Active:=false;
      q.sql.clear;
      q.SQL.add('delete from fila_de_impressao where id_movimento_mesa='+IntTostr(dm.qry_movimento_mesa.fieldbyname('id').value) );
      q.ExecSQL;

      q.Active:=false;
      q.sql.clear;
      q.SQL.add('delete from movimento_mesa where id='+IntTostr(dm.qry_movimento_mesa.fieldbyname('id').value) );
      q.ExecSQL;

      dm.transacao.Commit;
      apagarItemLista(idProduto);
    end;
  end;


  busca_movimento_da_mesa();
  q.Active:=false;
  FreeAndNil(q);


end;

procedure TfrmFrenteCaixa.D30001011MouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
{  if ((dm.qry_movimento_mesa.Active) and (dm.qry_movimento_mesa.IsEmpty = false) and (resumido = false )) then
  begin
    try
      begin
        D30001011.Hint := 'Garçon: ' + dm.qry_movimento_mesa.fieldbyname('apelido').Value +
          #13 + 'Comanda: ' + dm.qry_movimento_mesa.fieldbyname('comanda').AsString +
          #13 + 'Produto: ' + dm.qry_movimento_mesa.fieldbyname('descricao').AsString +
          #13 + 'Quantidade: ' + FormatFloat('###,###,##0.000',dm.qry_movimento_mesa.fieldbyname('quantidade').Value) +
          #13 + 'Lançado por: ' + dm.qry_movimento_mesa.fieldbyname('login').AsString + ' às ' + FormatDateTime('HH:MM:SS', dm.qry_movimento_mesa.fieldbyname('hora_lancamento').value)+
          #13+#13 + 'Sabores :'+#13+ dm.qry_movimento_mesa.fieldbyname('sabores').AsString+
          #13+#13+ 'Obs :'+#13+ dm.qry_movimento_mesa.fieldbyname('observacoes').AsString;

      end;
    except
    end;           end;
    }
end;



procedure TfrmFrenteCaixa.B30001007Click(Sender: TObject);
begin
//  Application.CreateForm(TfrmDescontoItem,frmDescontoItem);
//  frmDescontoItem.showmodal;
//  frmDescontoItem.free;
//  busca_movimento_da_mesa();

{
  if( trim(numeroMesaPdv) = dm.getCodMesaBalcao ) then exit;
  if (dm.verificaPermissaoAcao((sender as TBitBtn).Name) = true) then
  begin
    if MessageDlg('Confirma cancelamento do último cupom fiscal ?', mtconfirmation, [mbYes, mbNo], 0) = mryes then
    begin
      dm.cancela_cupom_fiscal(marca_impressora_fiscal, modelo_impressora_fiscal);
    end;
  end;
  }

end;






procedure TfrmFrenteCaixa.FormKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin


  if key = vk_f2 then
  begin
    pesquisa_produto;
  end;


  if ( key = 123 ) then
   begin
     ed_cod_produto.clear;

   end;

   if ( key = VK_F4 ) then
    begin
      btFecharConta.click;
    end;



   if ( key = VK_F5 ) then
    begin
      B20002003.Click;
    end;

   if ( key = VK_F6 ) then
    begin
      btOperacoesCaixa.Click;
    end;



   if ( key = VK_F8 ) then
    begin
//      btCalculadora.Click;
    end;

   if ( key = VK_F9 ) then
    begin
//      btGaveta.Click;
    end;



   if ( key = VK_F10 ) then
    begin
//      btMenuFiscal.Click;
    end;






end;

procedure TfrmFrenteCaixa.efetuar_lancamento;
begin
   if dm.transacao.Active = false then dm.transacao.Active := true;
   dm.transacao.Commit;
   adicionar_produto_conta(numeroMesaPdv,true);
   
  end;







procedure  TfrmFrenteCaixa.gravarEstornoMesa(mesa : string);
var
 q : TIBQuery;
 totalMesa : double;
 codEstorno : string;
begin

  q := TIBquery.create(self);
  q.Database := dm.dbrestaurante;
  q.Transaction := dm.transacao;
  q.Active:=false;

  codEstorno := dm.geraCodigo('G_ESTORNOS_MESA',5);
  totalMesa :=  getValorProdutosMesa(mesa);
  q.SQL.Add('insert into estornos_mesa (codigo,mesa,total_mesa,cod_caixa,hora,COD_USUARIO_AUTORIZOU,NOME_USUARIO_AUTORIZOU) values(');
  q.SQL.Add(''+Quotedstr(codEstorno)+',');
  q.SQL.add(''+Quotedstr(mesa)+',');
  q.sql.add(''+dm.TrocaVirgPPto(FloatToStr(totalMesa))+',');
  q.SQL.add(''+Quotedstr(ultimoCaixaAberto)+',');
  q.SQL.Add(''+Quotedstr(FormatDateTime('hh:mm:ss',Time))+',');
  q.sql.add(QuotedStr(codigo_usuario_responsavel)+',');
  q.sql.add(QuotedStr(nome_usuario_responsavel)+')');



  try
   begin
    q.ExecSQL;
   end
  except
   begin
     ShowMessage('Erro ao logar o estorno de mesa!');
     frm_principal.memo_avisos.Lines := q.SQL;
   end;
  end;

  q.Active:=false;
  q.SQL.clear;
  q.sql.add('insert into produtos_estornos_mesa(COD_ESTORNO,COD_PRODUTO,COD_BARRAS,');
  q.sql.add('       DESCRICAO, QUANTIDADE,VALOR_UNITARIO,TOTAL)');
  q.sql.add('       select '+QuotedStr(codEstorno)+',mv.cod_produto,cod_barras,p.descricao,mv.quantidade,mv.valor_unitario,(mv.valor_unitario * mv.quantidade)');
  q.sql.add('       from movimento_mesa mv');
  q.sql.add('       inner join produtos p on (p.cod_produto = mv.cod_produto)');
  q.sql.add('       where mv.cod_mesa='+Quotedstr(mesa));
  try
   begin
    q.ExecSQL;
   end
  except
   begin
     ShowMessage('Erro gravar os produtos estornados da mesa');
     frm_principal.memo_avisos.Lines := q.SQL;
   end;
  end;

  {
  if ( StrToInt(dm.LeIni(1,'TRANSFERENCIA_DE_MESA','imprime_comprovante')) = 1)   then
   begin
     dm.imprimeComprovanteTransferenciaMesa(origem,destino,codTransferencia,totalMesaOrigem,totalMesaDestino);
   end;
   }

  if dm.transacao.Active = false then dm.transacao.Active:=true;
  dm.transacao.Commit;

  q.Active:=false;
  FreeAndNil(q);
end;


procedure TfrmFrenteCaixa.ed_numero_mesaChange(Sender: TObject);
begin
  inherited;
  if (    ((trim(numeroMesaPdv) ='b') ) or  ((trim(numeroMesaPdv) ='B') ) )  then
  begin
//    B20001002.Click;
  end;

end;

procedure TfrmFrenteCaixa.ed_cod_produtoChange(Sender: TObject);
var
 qtde : integer;
 codProduto : string;
 valorTotal : string;
 valor  : double;
 quantidade   : double;
 precoUnitario : double;
//
 tipoCodBarras : integer;
 strPreco : string;
 qtdeCalculada : double;
 codProdutoLido : string;

begin
  inherited;

if ( (trim(ed_cod_produto.Text) ='010101') ) then
  begin
   if tipo_cupom = 1 then
    muda_acao(2)
   else
    muda_acao(1);

  end;


end;



procedure TfrmFrenteCaixa.getDadosProduto(codProduto : string);
begin
    lb_cod_produto.Caption     := getCodProduto(codProduto);
    ed_descricao_produto.Text  := dm.centralizar(getDescricaoProduto(codProduto,2)  ,30);
    edValorUnitario.Value      := getValorProduto(codProduto,2);
    ed_quantidade.Value        := quantidadeLancamento;
    edTotalProduto.Value       := edValorUnitario.Value  * ed_quantidade.Value;

end;

procedure TfrmFrenteCaixa.ed_cod_produtoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
  var
   posicaoAsterisco : SmallInt ;
   multiplicador : string;
   valorTotalInStore : string;
   codProduto : string;
   unidadeMedida : string;
   qtde : string;
begin


  if key = vk_return then
  begin
   if copy(Trim(ed_cod_produto.Text),0,1) ='*' then
    begin
      try
       ed_quantidade.value :=  StrToFloat(copy(Trim(ed_cod_produto.Text),2,5));
       ed_cod_produto.Text := '';
       ed_cod_produto.SetFocus;
      except
         exibe_painel_erro('Quantidade digitada é inválida!','Ok');
         exit;
      end;

      exit;
    end

    else
     begin
      quantidadeLancamento := ed_quantidade.Value;
      codProduto :=ed_cod_produto.Text;
     end;

     if ( Length(codProduto) = 13 ) then
      begin

      // Verifica se é um produto IN store. Todos que começam com o número 2
      // são produtos etiquetados na casa.

       if ( trim(Copy(codProduto,0,1) ) ='2') then
        begin
           // Produto in store
           valorTotalInStore :=trim(Copy(codProduto,7,6)); // Pega o valor total na etiqueta
           Insert(',',valorTotalInStore,5);
           codProduto := trim(Copy(codProduto,2,4));      // Pega o código do produto3

           try
             codProduto := FormatFloat('00000',StrToFloat(codProduto));
           except
              begin
                dm.exibe_painel_erro('Código de produto in store inválido!','Ok');
                Exit;
              end;
           end;

           try
              StrToFloat(valorTotalInStore);
            except
               begin
                 dm.exibe_painel_erro('Valor total de produto in store lido na etiqueta é inválido! '+valorTotalInStore,'Ok');

                 ed_cod_produto.clear;
                 exit;
               end;
           end;

           if (verificaExistenciaProduto(codProduto,2) = False) then
            begin
              dm.exibe_painel_erro('Produto não cadastrado!','Ok');
              ed_cod_produto.clear;
              exit;
            end
           else
            begin
               // se o produtoe está cadastrado, faz o cálculo da quantidade.
                quantidadeLancamento :=  StrToFloat(valorTotalInStore) /  getValorProduto(codProduto,2);
                quantidadeLancamento :=  RoundTo(quantidadeLancamento,-3);
            end;

        end
       else
        begin
          // Produto de terceiros

        end;


      end
     else
      begin
        // Produtos que não possuem EAN 13 (código de barras c/ 13 digitos)

           try
             codProduto := FormatFloat('00000',StrToFloat(codProduto));
             ed_cod_produto.Text := FormatFloat('00000',StrToFloat(codProduto));

           except
              begin
               dm.exibe_painel_erro('Código de produto inválido!','Ok');
                Exit;
              end;
           end;





      end;

    // Aqui começa o tratamento comum a todos os produtos.


    if (verificaExistenciaProduto(codProduto,2) = False) then
     begin
       dm.exibe_painel_erro('Produto não cadastrado no sistema!','Ok');
       ed_cod_produto.clear;
       exit;
     end;





    lb_cod_produto.Caption     := getCodProduto(codProduto);
    ed_descricao_produto.Text  := dm.centralizar(getDescricaoProduto(codProduto,2)  ,30);
    edValorUnitario.Value      := getValorProduto(codProduto,2);
    ed_quantidade.Value        := quantidadeLancamento;
    edTotalProduto.Value       := edValorUnitario.Value  * ed_quantidade.Value;
    unidadeMedida              := getUnidadeMedidaECF(codProduto,2);







     adicionar_produto_conta(numeroMesaPdv,dm.verificaProdutoImprimeLocalProducao(lb_cod_produto.Caption)    );
    edTotalProduto.Value       := edValorUnitario.Value  * ed_quantidade.Value;
     dm.qry_movimento_mesa.Last;

     qtde := FormatFloat('###,###,##0.000 ',ed_quantidade.Value );


     adicionaProdutoLista(dm.qry_movimento_mesa.FieldByName('id').Value);










     ed_cod_produto.Clear;
     ed_cod_produto.SetFocus;

  end;





  if ((key = vk_f4)) then
  begin

//    B20002002.Click;

  end;

  if ((key = vk_delete) or (key = VK_F5)) then
  begin

//    B20002003.Click;
  end;

  if ((key = vk_f6)) then
  begin
//    B20002014.Click;
  end;

  if ((key = vk_f7)) then
  begin
//    B20002005.Click;
  end;

  if ((key = vk_f8)) then
  begin
//    B30001007.Click;
  end;



  if ((key = vk_f9)) then
  begin
//    B20002006.click;
  end;

  if ((key = vk_f10)) then
  begin
//    B20002004.Click;
  end;

  if ((key = vk_f11)) then
  begin
//    B20002007.click;
  end;

end;

procedure TfrmFrenteCaixa.ed_quantidadeChange(Sender: TObject);
var
 qtde : integer;
 codProduto : string;
 valorTotal : string;
 valor  : double;
 quantidade   : double;
 precoUnitario : double;

begin
  if( Length(trim(ed_quantidade.text)) = 13) then
   begin
    codProduto:=copy(ed_quantidade.Text,2,4);
    valorTotal:=copy(ed_quantidade.Text,8,5);
    valorTotal:=copy(valorTotal,0,3)+','+copy(valorTotal,4,4);
    valorTotal:=FloatTostr(strToFloat(valorTotal));
    valor := StrToFLoat(valorTotal);
    codProduto   := FormatFloat('00000',StrTOFloat(codProduto));
    ed_cod_produto.Text := codProduto;
    precoUnitario :=  getValorProduto(codProduto,2);
    quantidade    :=  (valor / precoUnitario);
    ed_cod_produto.Text:= codProduto;
    ed_quantidade.Text:= FormatFloat('###,###,##0.000 ',quantidade);
    ed_quantidade.SetFocus;
   end; 
end;




procedure TfrmFrenteCaixa.mudaCaptionsBotoes();
begin
{B20002001.Caption := 'Imprimir'+#10+'Pré-Conta'+#10+'(F3)';
B20002002.Caption := 'Receber'+#10+'Conta'+#10+'(F4)';
B20002003.Caption := 'Cancelar'+#10+'ítem'+#10+'(F5)';
B20002014.Caption := 'Liberar'+#10+'Veículo'+#10+'(F6)';
B20002005.Caption := 'Estornar'+#10+'Mesa'+#10+'(F7)';
B20002006.Caption := 'Transferir'#10+'Mesa'+#10+'(F9)';
B20002004.Caption := 'Transferir'#10+'ítem'+#10+'(F10)';
B20002007.Caption  := 'Receb.'#10+'Parciais'+#10+'(F11)';
B20001002.Caption := 'Venda'+#10+'Balcão'+#10+'(B)';
B20001003.Caption :=  'Delivery'+#10+''+'(ctrl+D)';
btOpCaixa.Caption :=  'Funções do'+#10+'caixa'+#10+''+'(ctrl+S)';
btMapaMesas.Caption := 'Mapa de'+#10+' mesas'+#10+'(ctrl+M)'+'';
btMenuFiscal.Caption := 'Menu '+#10+'Fiscal'+'';


btCalculadora.caption := 'Calculadora'+#10+''+'(ctrl+C)';
 }

end;













procedure TfrmFrenteCaixa.FormKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;

//  timerAtualizaTelaMesas .Enabled:=false;
//  timerAtualizaTelaMesas .Enabled:=true;


end;

procedure TfrmFrenteCaixa.timerAtualizaTelaMesasTimer(Sender: TObject);
begin
  inherited;
//  AtualizarListaMesas();
end;






procedure TfrmFrenteCaixa.enter_botao(Sender: TObject);
begin
   numeroMesaPdv:=(sender as TBitBtn).Caption;
end;






procedure TfrmFrenteCaixa.Timer1Timer(Sender: TObject);
begin
  inherited;
//  dxStatusBar1.Panels[3].Text:= FormatDateTime('HH:MM:SS',time);
end;

procedure TfrmFrenteCaixa.btAcessoDeliveryClick(Sender: TObject);
begin
  inherited;

 if verifica_movimento = false then
       begin
       if dm.verificaPermissaoAcao('I20001003') = true then
        begin
          Application.createForm(TfrmExpedicaoDelivery, frmExpedicaoDelivery);
          frmExpedicaoDelivery.showmodal();
          frmExpedicaoDelivery.free;

        end;
       end
     else
      begin
        dm.exibe_painel_erro('ENCERRE A VENDA EM ANDAMENTO ANTES DE MUDAR DE MÓDULO!','OK');
        frm_principal.TrocarOperador := false;
         frmFrenteCaixa.permiteFecharForm := false;
        exit;
      end;

end;

procedure TfrmFrenteCaixa.btCalculadoraClick(Sender: TObject);
begin
  inherited;
  ACBrCalculadora1.Execute;
end;

procedure TfrmFrenteCaixa.B20001003Click(Sender: TObject);
begin
  inherited;
 if (dm.verificaPermissaoAcao((sender as TBitBtn).Name) = true) then
 begin
  Application.CreateForm(TfrmPrincipalDelivery,frmPrincipalDelivery);
  frmPrincipalDelivery.showmodal;
  frmPrincipalDelivery.free;

 end;

end;

procedure TfrmFrenteCaixa.CancelamentodeProduto1Click(
  Sender: TObject);
begin
  inherited;
//  B20002003.Click;
end;


procedure TfrmFrenteCaixa.muda_acao(tipo : integer);
begin
  case tipo of
    1: begin
         tipo_cupom:=1;
//         dxstatusbar1.Panels[0].text:=nome_fantasia;
         edTotalProduto.Font.Color := clWhite;
       end;
    2: begin
         tipo_cupom:=2;
//         dxstatusbar1.Panels[0].text:=razao_social;
         edTotalProduto.Font.Color := clRed;
       end;

  end;
  ed_cod_produto.Clear;
end;



procedure TfrmFrenteCaixa.pisca1Timer(Sender: TObject);
begin
  inherited;
//    pisca1.Enabled:=false;
//    pisca2.Enabled:=true;

end;

procedure TfrmFrenteCaixa.pisca2Timer(Sender: TObject);
begin
  inherited;
//    pisca2.Enabled:=false;
//    pisca1.Enabled:=true;

end;

procedure TfrmFrenteCaixa.pnExpedicaoClick(Sender: TObject);
begin
  inherited;
  Application.CreateForm(TfrmExpedicaoDelivery,frmExpedicaoDelivery);
  frmExpedicaoDelivery.ShowModal;
  frmExpedicaoDelivery.Free;
end;

procedure TfrmFrenteCaixa.imgAtencaoClick(Sender: TObject);
begin
  inherited;
  pnExpedicaoClick(sender); 
end;

procedure TfrmFrenteCaixa.Image1Click(Sender: TObject);
begin
  inherited;
  ScrollBox1.VertScrollBar.Position := ScrollBox1.VertScrollBar.Position + 480;
end;

procedure TfrmFrenteCaixa.Image2Click(Sender: TObject);
begin
  inherited;
  ScrollBox1.VertScrollBar.Position := ScrollBox1.VertScrollBar.Position - 480;
end;

procedure TfrmFrenteCaixa.lbPedidosClick(Sender: TObject);
begin
  inherited;
  pnExpedicaoClick(sender); 
end;

procedure TfrmFrenteCaixa.Label12Click(Sender: TObject);
begin
  inherited;
  pnExpedicaoClick(sender); 
end;


procedure TfrmFrenteCaixa.AtualizarPedidos();
var
 qryMontaMesas : TIBquery;
begin
  qryMontaMesas:=TIBquery.create(frmFrenteCaixa);
  qryMontaMesas.database:=dm.dbrestaurante;
  qryMontaMesas.transaction:=dm.transacaoAuxiliar;
  qryMontaMesas.Active:=False;
  qryMontaMesas.SQL.Clear;


  dm.transacaoAuxiliar.Active:=false;
  dm.transacaoAuxiliar.Active:=true;

   qryMontaMesas.Active:=false;
   qryMontaMesas.sql.clear;
   qryMontaMesas.sql.add('select  count(*) as total from pedidos_expedicao_delivery where status_pedido=0');
   qryMontaMesas.Active:=true;

   if qryMontaMesas.FieldByName('total').Value = 0 then
    begin
//     pnExpedicao.Visible:=false;
//     pisca1.Enabled:=false;
//     pisca2.Enabled:=false;
    end
   else
    begin
//     lbPedidos.Caption:= inttostr(qryMontaMesas.FieldByName('total').Value)+ ' PEDIDO(S)';
//     pisca1.Enabled:=true;
//     pnExpedicao.Visible:=true;
    end;
   dm.transacaoAuxiliar.Active:=false;

end;



procedure TfrmFrenteCaixa.btMapaMesasClick(Sender: TObject);
begin
  inherited;
  Application.CreateForm(TfrmMapaMesas,frmMapaMesas);
  frmMapaMesas.showmodal;
  frmMapaMesas.Free;
  numeroMesaPdv := string_auxiliar;
  busca_movimento_da_mesa;


end;

procedure TfrmFrenteCaixa.btMenuFiscalClick(Sender: TObject);
begin
  inherited;
  Application.CreateForm(TfrmMenuFiscal,frmMenuFiscal);
  frmMenuFiscal.ShowModal;
  frmMenuFiscal.free;
end;

procedure TfrmFrenteCaixa.btObsProdutoClick(Sender: TObject);
var
  idProduto : integer;
begin
  inherited;
  dm.qry_movimento_mesa.Active := true;
  dm.qry_movimento_mesa.Locate('id',VarArrayOf([TImage(Sender).Tag]),[loCaseInsensitive]);
  idProduto := TImage(Sender).Tag;
  strObsProduto :='';
  Application.CreateForm(Tfrm_obs_lancamento_caixa, frm_obs_lancamento_caixa);
  frm_obs_lancamento_caixa.memo_obs_complementar.Clear;
  frm_obs_lancamento_caixa.memo_obs_complementar.Lines.Add( dm.qry_movimento_mesa.FieldByName('observacoes').Value);
  frm_obs_lancamento_caixa.ShowModal;
  frm_obs_lancamento_caixa.free;
  dm.atualizaObservacoesProduto(idProduto,strObsProduto);
  dm.qry_movimento_mesa.Active := true;

  strObsProduto :='';
end;

procedure TfrmFrenteCaixa.btOpCaixaClick(Sender: TObject);
begin
  inherited;
  Application.CreateForm(TfrmOperacoesDeCaixa,frmOperacoesDeCaixa);
  frmOperacoesDeCaixa.ShowModal;
  frmOperacoesDeCaixa.free;

  if (verificaSeCaixaEstaAberto(ultimoCaixaAberto) = false) then
   begin
//    close;
   end;

end;

procedure TfrmFrenteCaixa.timerPedidosTimer(Sender: TObject);
begin
  inherited;
  AtualizarPedidos();
end;

procedure TfrmFrenteCaixa.SpeedButton1Click(Sender: TObject);
begin
  inherited;

  if dm.qryMapaMesasSalao.Active then
   begin
    dm.qryMapaMesasSalao.Prior;
    dm.qryMapaMesasSalao.Prior;
    dm.qryMapaMesasSalao.Prior;
    dm.qryMapaMesasSalao.Prior;
    dm.qryMapaMesasSalao.Prior;
    dm.qryMapaMesasSalao.Prior;
    dm.qryMapaMesasSalao.Prior;
    dm.qryMapaMesasSalao.Prior;
    dm.qryMapaMesasSalao.Prior;
    dm.qryMapaMesasSalao.Prior;
    dm.qryMapaMesasSalao.Prior;    
   end;

  

end;

procedure TfrmFrenteCaixa.JvGradient1Click(Sender: TObject);
begin
  inherited;
  dm.qry_movimento_mesa.Next;
end;


procedure TfrmFrenteCaixa.MakeRounded(Control: TWinControl);
var
R: TRect;
Rgn: HRGN;
begin
with Control do
 begin
 R := ClientRect;
 rgn := CreateRoundRectRgn(R.Left, R.Top, R.Right, R.Bottom, 20, 20);
 Perform(EM_GETRECT, 0, lParam(@r));
 InflateRect(r, - 5, - 5);
 Perform(EM_SETRECTNP, 0, lParam(@r));
 SetWindowRgn(Handle, rgn, True);
 Invalidate;
 end;
end;



procedure TfrmFrenteCaixa.FormCreate(Sender: TObject);
var
 btn : TJvImgBtn;
 topBtn : integer;
 x,x2: integer;
 nm : string;

 pagina : TComponent;
begin
  inherited;
  Self.top:=0;
  self.left:=0;
  numeroMesaPdv:=mesaBalcao;
  codigoGarconPdv:='000';
  criaBotoesTouch();
//  limpaMesaPDV;


end;



procedure TfrmFrenteCaixa.criaBotoesTouch();
var
btn : TJvImgBtn;
 topBtn : integer;
 x,x2: integer;
 nm : string;
 pagina2 : TComponent;
begin

  paginasGrupoCriadas := 0;

  dm.qryauxiliar.Active := false;
  dm.qryauxiliar.SQL.clear;


  dm.qryauxiliar.sql.add(' select * from grupos_touch gt where gt.codigo in ');
  dm.qryauxiliar.sql.add('  ( select distinct p.cod_grupo_touch  from produtos p ');
  dm.qryauxiliar.sql.add('     where p.vende =1) ');
  dm.qryauxiliar.sql.add('     order by ordem');
  dm.qryauxiliar.Active := true;
  dm.qryauxiliar.FetchAll;
  x:=0;

  paginaAtual := 1;
   while ( (x < ComponentCount-1) and (dm.qryauxiliar.Eof = false) ) do
  begin
    if  Components[x].ClassName='TJvImgBtn' then
     begin
          paginasGrupoCriadas := paginasGrupoCriadas + 1;
          MakeRounded((components[x] as TJvImgBtn));
           if  (Trim(copy( (components[x] as TJvImgBtn).Name ,0,4))  = 'btgp') then
            begin
             (components[x] as TJvImgBtn).Caption := dm.qryauxiliar.fieldbyname('descricao').Value;
             (components[x] as TJvImgBtn).Visible := true;
             (components[x] as TJvImgBtn).onClick :=  btgp1Click;



             dm.qryauxiliar2.Active := false;
             dm.qryauxiliar2.SQL.Clear;

             dm.qryauxiliar2.SQL.add('select p.cod_produto, p.cod_barras, p.cod_grupo_touch, p.descricao_touch, p.descricao, p.valor_unitario  from produtos p ');
             dm.qryauxiliar2.SQL.add(' where p.vende=1 and  (p.cod_grupo_touch='+Quotedstr(dm.qryauxiliar.fieldbyname('codigo').Value)+') and (p.cod_grupo_touch is not null) and (p.cod_grupo_touch  <> '+Quotedstr('')+')');



              case ( StrToInt(dm.LeIni(2,'SALAO','ordemProdutosLancamento')  )) of

               0: begin
                     dm.qryauxiliar2.SQL.Add(' order by p.cod_barras,p.descricao');
                  end;

               1: begin
                     dm.qryauxiliar2.SQL.Add(' order by p.cod_barras,p.descricao');
                  end;


               2: begin
                     dm.qryauxiliar2.SQL.Add(' order by p.descricao');
                  end;

               3: begin
                     dm.qryauxiliar2.SQL.Add(' order by p.descricao_touch');
                  end;
             end;






             dm.qryauxiliar2.Active := true;
             dm.qryauxiliar2.First;




             case  paginaAtual of
              1: pagina2 := TabSheet6;
              2: pagina2 := TabSheet7;
              3: pagina2 := TabSheet8;
              4: pagina2 := TabSheet9;
              5: pagina2 := TabSheet10;
              6: pagina2 := TabSheet11;
              7: pagina2 := TabSheet12;
              8: pagina2 := TabSheet13;
              9: pagina2 := TabSheet14;
              10: pagina2 := TabSheet15;
              11: pagina2 := TabSheet16;
              12: pagina2 := TabSheet17;
              13: pagina2 := TabSheet18;
              14: pagina2 := TabSheet19;
              15: pagina2 := TabSheet20;
              16: pagina2 := TabSheet21;
              17: pagina2 := TabSheet22;
              18: pagina2 := TabSheet23;
              19: pagina2 := TabSheet24;
              20: pagina2 := TabSheet25;
              21: pagina2 := TabSheet26;
              22: pagina2 := TabSheet27;
              23: pagina2 := TabSheet28;
              24: pagina2 := TabSheet29;
              25: pagina2 := TabSheet30;
              26: pagina2 := TabSheet31;
              27: pagina2 := TabSheet32;
              28: pagina2 := TabSheet33;
              29: pagina2 := TabSheet34;
              30: pagina2 := TabSheet35;
              31: pagina2 := TabSheet36;
              32: pagina2 := TabSheet37;
              33: pagina2 := TabSheet38;
              34: pagina2 := TabSheet39;
              35: pagina2 := TabSheet40;
             end;

             x2:=0;
             while ( (x2 < ComponentCount -1) and (dm.qryauxiliar2.Eof = false) ) do
               begin
                if  Components[x2].ClassName='TJvImgBtn' then
                 begin
                      if (Components[x2].GetParentComponent = pagina2 ) then
                       begin
                         MakeRounded((components[x2] as TJvImgBtn));
                         (components[x2] as TJvImgBtn).Name := 'pdt'+dm.qryauxiliar2.fieldbyname('cod_barras').Value;
                         (components[x2] as TJvImgBtn).Font.Size := 9;
                         (components[x2] as TJvImgBtn).Font.Color := clBlack;
                         (components[x2] as TJvImgBtn).Font.Name := 'Arial';
                         (components[x2] as TJvImgBtn).Font.Style := [];
//                         (components[x2] as TJvImgBtn).Caption :=dm.qryauxiliar2.fieldbyname('cod_produto').Value+#13#10+dm.qryauxiliar2.fieldbyname('descricao').Value;
                         if ( trim(dm.qryauxiliar2.fieldbyname('descricao_touch').Value) = '') then
                            begin
                              if ( dm.qryauxiliar2.fieldbyname('valor_unitario').value > 0 ) then
                               begin
                                 (components[x2] as TJvImgBtn).Caption := dm.qryauxiliar2.fieldbyname('descricao').Value+chr(13) +
                                  FormatFloat('R$ ###,###,##0.00 ',dm.qryauxiliar2.fieldbyname('valor_unitario').value )
                               end
                              else
                               begin
                                 (components[x2] as TJvImgBtn).Caption := dm.qryauxiliar2.fieldbyname('descricao').Value;
                               end;


                            end
                         else
                           begin
                              if ( dm.qryauxiliar2.fieldbyname('valor_unitario').value > 0 ) then
                               begin
                                (components[x2] as TJvImgBtn).Caption := dm.qryauxiliar2.fieldbyname('descricao_touch').Value+chr(13)+
                                FormatFloat('R$ ###,###,##0.00 ',dm.qryauxiliar2.fieldbyname('valor_unitario').value );
                               end
                              else
                               begin
                                (components[x2] as TJvImgBtn).Caption := dm.qryauxiliar2.fieldbyname('descricao_touch').Value;



                               end;
                           end;
                         (components[x2] as TJvImgBtn).OnClick := btpd011Click;
                         (components[x2] as TJvImgBtn).Visible := true;


                         dm.qryauxiliar2.Next;
                       end;
                end;

                x2:= x2+1;
            end;
             paginaAtual := paginaAtual + 1;

             dm.qryauxiliar.Next;
     end;




   end;
   x:= x+1;
 end;

end;

procedure TfrmFrenteCaixa.btpd011Click(Sender: TObject);
var
x : integer;
k : word;
sf : TShiftState;
begin
  inherited;
  k := VK_RETURN;

  x:=0;
   while ( (x < ComponentCount -1)) do
      begin
        if ( Components[x] is TEdit  ) and     ( (Components[x]as TEdit).Name='ed_cod_produto' ) then
          begin
             (Components[x] as TEdit).Text :=  Trim( copy((sender as TJvImgBtn).Name,4,10));
             {

             if ( verificaSeProdutoEhPizza(ed_cod_produto.Text,2) = false) then
             begin
              if dm.painelDePergunta(#13#10+'  INFORMAR OBSERVAÇÕES ?'+#13#10+#13#10,25) then
               begin
                  Application.CreateForm(Tfrm_obs_lancamento_caixa, frm_obs_lancamento_caixa);
                  frm_obs_lancamento_caixa.ShowModal;
                  frm_obs_lancamento_caixa.free;
               end;
             end;
              }


              if (verificaSeProdutoLeQuantidadeDaBalanca(ed_cod_produto.Text,2) = false) then
               begin
                ed_numero_mesaExit(ed_cod_produto);
                ed_cod_produtoKeyDown  (ed_cod_produto,k,sf);
               // ed_numero_mesaExit(ed_quantidade );
               end
              else
               begin
                 if ( lerPesoDaBalanca(ed_cod_produto.Text)  = true) then
                  begin
                    ed_numero_mesaExit(ed_cod_produto);
                    ed_cod_produtoKeyDown(ed_cod_produto,k,sf);
                  end
                 else
                  begin
                    string_auxiliar := 'N';
                    Application.CreateForm(Tfrm_confirma_extrato, frm_confirma_extrato);
                    frm_confirma_extrato.setTitulo('Confirmação');
                    frm_confirma_extrato.setMensagem('Deseja digitar o peso manualmente ?',16);
                    frm_confirma_extrato.ShowModal;
                    frm_confirma_extrato.free;
                    pesoLidoBalanca := '0';
                    if string_auxiliar = 'S' then
                     begin
                      if dm.verificaPermissaoAcao('I20001012') = true then
                      begin
                        Application.CreateForm(TfrmDigitaPesoManualmente, frmDigitaPesoManualmente);
                        frmDigitaPesoManualmente.ShowModal;
                        frmDigitaPesoManualmente.Free;

                        if (StrToFloat(pesoLidoBalanca) <=0) then
                         begin
                           exibe_painel_erro('Peso digitado é inválido','Ok');
                           exit;
                         end
                        else
                         begin
                           ed_quantidade.Value  := StrToFloat(pesoLidoBalanca);
                           ed_cod_produto.SetFocus ;
                           ed_numero_mesaExit(ed_cod_produto);
                           ed_cod_produtoKeyDown(ed_cod_produto,k,sf);
                         end;
                      end;
                     end
                    else
                      begin
                       pesoLidoBalanca := '0';
                       Exit;
                      end;
                  end;


               end;
              ed_quantidade.Value := 1;

          end;
        x:= x+1;
      end;

end;


function TfrmFrenteCaixa.lerPesoDaBalanca(codProduto : string) : boolean;
begin
 Result := false;
          sucessoLeituraPeso := false;


          case getBalancaLeitura(codProduto,2) of
           1: begin
                try
                 begin
                 frm_principal.balanca.Ativar;

                 end;
                except
                  begin
                    dm.exibe_painel_erro('Erro ao conectar à balança 01 . Verifique a porta ou cabo de conexão!','Continuar');
                    Result := false;
                  end;
                end;

                Try
                  begin
                    frm_principal.balanca.LePeso(200);
                     ed_quantidade.Value  := StrToFloat(pesoLidoBalanca);
                    frm_principal.balanca.Desativar;
                  end;
                except
                  on E : Exception  do
                    begin
                     exibe_painel_erro(E.Message,'');
                     Result := false;
                    exit;
                   end;
                end;
              end;


           2: begin
                try
               frm_principal.balanca2.Ativar;
                except
                  begin
                    dm.exibe_painel_erro('Erro ao conectar à balança 02 . Verifique a porta ou cabo de conexão!','Continuar');
                    Result := false;
                  end;
                end;

                Try
                  begin
                     frm_principal.balanca2.LePeso(200);

                     ed_quantidade.value := StrToFloat(pesoLidoBalanca);
                    frm_principal.balanca2.Desativar;
                  end;
                except
                 on E : Exception  do
                  begin
                   exibe_painel_erro(E.Message,'');
                   Result := false;
                   exit;
                  end;
                end;
              end;

          end;

 if ed_quantidade.Value <= 0 then
  begin
    exibe_painel_erro('Peso negativo na balança!','Ok'); 
  end;

 if sucessoLeituraPeso then
  Result := true
 else
  Result := false;
end;


procedure TfrmFrenteCaixa.btgp1Click(Sender: TObject);
var
 indice: integer;
begin
  inherited;
  indice := StrToInt(Trim( copy((sender as TJvImgBtn).Name,5,5)));
  pgProdutos.ActivePageIndex:=indice-1;
end;


procedure TfrmFrenteCaixa.SpeedButton6Click(Sender: TObject);
begin
  inherited;

  dm.qry_movimento_mesa.First;
{
  dm.qry_movimento_mesa.Prior;
  dm.qry_movimento_mesa.Prior;
  dm.qry_movimento_mesa.Prior;
  dm.qry_movimento_mesa.Prior;
  dm.qry_movimento_mesa.Prior;
  dm.qry_movimento_mesa.Prior;
  dm.qry_movimento_mesa.Prior;
  dm.qry_movimento_mesa.Prior;
  dm.qry_movimento_mesa.Prior;
  dm.qry_movimento_mesa.Prior;
  dm.qry_movimento_mesa.Prior;
  dm.qry_movimento_mesa.Prior;
 }

end;

procedure TfrmFrenteCaixa.SpeedButton7Click(Sender: TObject);
begin
  inherited;

  dm.qry_movimento_mesa.Last;
     {
  dm.qry_movimento_mesa.next;
  dm.qry_movimento_mesa.next;
  dm.qry_movimento_mesa.next;
  dm.qry_movimento_mesa.next;
  dm.qry_movimento_mesa.next;
  dm.qry_movimento_mesa.next;
  dm.qry_movimento_mesa.next;
  dm.qry_movimento_mesa.next;
  dm.qry_movimento_mesa.next;
  dm.qry_movimento_mesa.next;
  dm.qry_movimento_mesa.next;}


end;

procedure TfrmFrenteCaixa.SpeedButton10Click(Sender: TObject);
begin
  inherited;

  dm.qry_movimento_mesa.Prior;

end;

procedure TfrmFrenteCaixa.SpeedButton9Click(Sender: TObject);
begin
  inherited;

  dm.qry_movimento_mesa.next;

end;



procedure TfrmFrenteCaixa.SpeedButton11Click(Sender: TObject);
begin
  inherited;
  if dm.qryMapaMesasSalao.Active then
   begin
    dm.qryMapaMesasSalao.Next;
    dm.qryMapaMesasSalao.Next;
    dm.qryMapaMesasSalao.Next;
    dm.qryMapaMesasSalao.Next;
    dm.qryMapaMesasSalao.Next;
    dm.qryMapaMesasSalao.Next;
    dm.qryMapaMesasSalao.Next;
    dm.qryMapaMesasSalao.Next;
    dm.qryMapaMesasSalao.Next;
    dm.qryMapaMesasSalao.Next;
    dm.qryMapaMesasSalao.Next;    

   end;

end;


procedure TfrmFrenteCaixa.btsairClick(Sender: TObject);
begin
  inherited;
  if MessageDlg(' Deseja mesmo sair do sistema ?',mtConfirmation,[MbYes,mbNo],0) = Mryes then
   begin
      application.Terminate;
   end;

end;



function TfrmFrenteCaixa.verifica_movimento: boolean;
begin
  dm.qry_movimento_mesa.Active := True;

  if dm.qry_movimento_mesa.IsEmpty then
  begin
    Result := false;
    exit;
  end;

  Result := true;
end;

function TfrmFrenteCaixa.VerificaProblemaNegativo: boolean;
begin

  dm.qryauxiliar.Active := false;
  dm.qryauxiliar.SQL.Clear;
  dm.qryauxiliar.SQL.Add(' select * from movimento_mesa mv where mv.cod_mesa=' + Quotedstr(numeroMesaPdv) + ' and  mv.quantidade < 0');
  dm.qryauxiliar.Active := true;
  dm.qryauxiliar.FetchAll;

  if dm.qryauxiliar.IsEmpty = false  then
   begin
    dm.exibe_painel_erro('Ocorreu um erro. Existe um ou mais produtos em quantidade negativa. Verifique o problema e entre em contato com a Real Softwares','Continuar');
    dm.adicionaLog('Ocorreu o problema do número negativo');
    Result := true;
   end
  else
   begin
     Result := false;
   end;

  dm.qryauxiliar.Active := false;

end;



procedure TfrmFrenteCaixa.adicionaProdutoLista(idProduto : largeInt);
var




  AdvPanel1: Tpanel;
 lbDescricaoProduto1 : TLabel;
 lbQuantidadeProduto1: TLabel;
 lbValorUnitarioProduto1: TLabel;
 lbX1: TLabel;
 lbTotalProduto1: TLabel;
 btDeleteProduto1: TImage;
 shapeLinha1: TShape;
 btObsProduto1: TImage;
 posicao : integer;
 x: integer;
 cp : TComponent;
 lbOrdem1: TLabel;




begin
  inherited;


      AdvPanel1                := TPanel.Create(ScrollBox1);



      AdvPanel1.Name := 'MOVTOpanProd'+ Inttostr(idProduto);
      AdvPanel1.Align := alTop;
      AdvPanel1.Parent := ScrollBox1;
      AdvPanel1.Left := 0;
      AdvPanel1.Top := 5000;
      AdvPanel1.Width := 320;
      AdvPanel1.Height := 60;
      AdvPanel1.BevelOuter := bvNone;
      AdvPanel1.BorderStyle := bsNone;
      AdvPanel1.Color := clWhite;
      AdvPanel1.ParentFont := False;
      AdvPanel1.TabOrder := 0;
      AdvPanel1.UseDockManager := True;
      AdvPanel1.Caption :='';


      AdvPanel1.DoubleBuffered := True;

      AdvPanel1.Visible := true;
      AdvPanel1.Tag := idProduto;


      lbOrdem1                 := TLabel.Create(AdvPanel1);
      lbDescricaoProduto1      := TLabel.Create(AdvPanel1);
      lbQuantidadeProduto1     := TLabel.Create(AdvPanel1);
      lbValorUnitarioProduto1  := TLabel.Create(AdvPanel1);
      lbTotalProduto1          := TLabel.Create(AdvPanel1);
      shapeLinha1              := TShape.Create(AdvPanel1);
      btObsProduto1            := TImage.Create(AdvPanel1);
      btDeleteProduto1         := TImage.Create(AdvPanel1);
      lbX1                     := TLabel.Create(AdvPanel1);




      lbOrdem1.Name := 'MOVTOlbOrdem'+ Inttostr(idProduto);
      lbOrdem1.Parent := AdvPanel1;
      lbOrdem1.Left := 2;
      lbOrdem1.Top := 0;
      lbOrdem1.Width := 24;
      lbOrdem1.Height := 18;
      lbOrdem1.Caption := formatfloat('000', dm.qry_movimento_mesa.recno);
      lbOrdem1.Color := clBtnFace;
      lbOrdem1.ParentColor := False;
      lbOrdem1.ParentFont := False;
      lbOrdem1.Transparent := True;
      lbOrdem1.Font := lbOrdem.Font;
      lbOrdem1.tag := idProduto;


      lbDescricaoProduto1.Name := 'MOVTOlbDescricaoProduto'+ Inttostr(idProduto);
      lbDescricaoProduto1.Parent := AdvPanel1;
      lbDescricaoProduto1.Left := 30;
      lbDescricaoProduto1.Top := 0;
      lbDescricaoProduto1.Width := 233;
      lbDescricaoProduto1.Height := 18;
      lbDescricaoProduto1.Caption :=  dm.qry_movimento_mesa.fieldbyname('descricao').Value;
      lbDescricaoProduto1.Color := clBtnFace;
      lbDescricaoProduto1.ParentColor := False;
      lbDescricaoProduto1.ParentFont := False;
      lbDescricaoProduto1.Transparent := True;
      lbDescricaoProduto1.Font := lbDescricaoProduto.Font;
      lbDescricaoProduto1.Tag := idProduto;



      lbQuantidadeProduto1.Name := 'MOVTOlbQuantidadeProduto'+ Inttostr(idProduto);
      lbQuantidadeProduto1.Parent := AdvPanel1;
      lbQuantidadeProduto1.Left := 138;
      lbQuantidadeProduto1.Top := 17;
      lbQuantidadeProduto1.Width := 40;
      lbQuantidadeProduto1.Height := 18;
      lbQuantidadeProduto1.Caption := FormatFloat('###,###,##0.000 ',dm.qry_movimento_mesa.fieldbyname('quantidade').Value);
      lbQuantidadeProduto1.Color := clBtnFace;
      lbQuantidadeProduto1.ParentColor := False;
      lbQuantidadeProduto1.ParentFont := False;
      lbQuantidadeProduto1.Transparent := True;
      lbQuantidadeProduto1.Font := lbQuantidadeProduto.Font;
      lbQuantidadeProduto1.Tag := idProduto;


      lbValorUnitarioProduto1.Name := 'MOVTOlbValorUnitarioProduto'+ Inttostr(idProduto);
      lbValorUnitarioProduto1.Parent := AdvPanel1;
      lbValorUnitarioProduto1.Left := 221;
      lbValorUnitarioProduto1.Top := 17;
      lbValorUnitarioProduto1.Width := 86;
      lbValorUnitarioProduto1.Height := 18;
      lbValorUnitarioProduto1.Caption := FormatFloat('R$ ###,###,##0.00 ',dm.qry_movimento_mesa.fieldbyname('valor_unitario').Value);
      lbValorUnitarioProduto1.Color := clBtnFace;
      lbValorUnitarioProduto1.ParentColor := False;
      lbValorUnitarioProduto1.ParentFont := False;
      lbValorUnitarioProduto1.Transparent := True;
      lbValorUnitarioProduto1.Font := lbValorUnitarioProduto.Font;
      lbValorUnitarioProduto1.Tag := idProduto;


      lbX1.Name := 'MOVTOlbX'+ Inttostr(idProduto);
      lbX1.Parent := AdvPanel1;
      lbX1.Left := 201;
      lbX1.Top := 12;
      lbX1.Width := 11;
      lbX1.Height := 18;
      lbX1.Caption := 'X';
      lbX1.Color := clBtnFace;
      lbX1.ParentColor := False;
      lbX1.ParentFont := False;
      lbX1.Transparent := True;
      lbX1.Font := lbX.Font;
      lbX1.Tag := idProduto;



      lbTotalProduto1.Name := 'MOVTOlbTotalProduto'+ Inttostr(idProduto);
      lbTotalProduto1.Parent :=  AdvPanel1;
      lbTotalProduto1.Left := 191;
      lbTotalProduto1.Top := 34;
      lbTotalProduto1.Width := 118;
      lbTotalProduto1.Height := 24;
      lbTotalProduto1.Caption := FormatFloat('R$ ###,###,##0.00 ',dm.qry_movimento_mesa.fieldbyname('total').Value);
      lbTotalProduto1.Color := 4099549;
      lbTotalProduto1.ParentColor := False;
      lbTotalProduto1.ParentFont := False;
      lbTotalProduto1.Transparent := True;
      lbTotalProduto1.Font :=  lbTotalProduto.Font;
      lbTotalProduto1.Tag := idProduto;




      btDeleteProduto1.Name := 'MOVTObtDeleteProduto'+ Inttostr(idProduto);
      btDeleteProduto1.Parent :=  AdvPanel1;
      btDeleteProduto1.Left := 47;
      btDeleteProduto1.Top := 17;
      btDeleteProduto1.Width := 38;
      btDeleteProduto1.Height := 38;
      btDeleteProduto1.Stretch := True;
      btDeleteProduto1.Picture := btDeleteProduto.Picture;
      btDeleteProduto1.Tag := idProduto;
      btDeleteProduto1.OnClick := btDeleteProduto.OnClick;



      btObsProduto1.Name := 'MOVTObtObsProduto'+ Inttostr(idProduto);
      btObsProduto1.Parent := AdvPanel1;
      btObsProduto1.Left := 3;
      btObsProduto1.Top := 17;
      btObsProduto1.Width := 38;
      btObsProduto1.Height := 38;
      btObsProduto1.Picture := btObsProduto.Picture;
      btObsProduto1.Stretch := True;
      btObsProduto1.Tag := idProduto;
      btObsProduto1.OnClick := btObsProduto.OnClick;


      shapeLinha1.Name := 'MOVTOshapeLinha'+ Inttostr(idProduto);
      shapeLinha1.Parent := AdvPanel1;
      shapeLinha1.Left := 0;
      shapeLinha1.Top := 55;
      shapeLinha1.Width := 316;
      shapeLinha1.Height := 1;
      shapeLinha1.Align := alBottom;
      shapeLinha1.Tag :=idProduto;
      ScrollBox1.VertScrollBar.Position := 5000;
end;


procedure TfrmFrenteCaixa.fecharConta();
begin
  if verifica_movimento then
  else
   begin
    dm.exibe_painel_erro('Não há produtos registrados!','Ok');
    exit;
   end;

  if VerificaProblemaNegativo  then
   begin
    exit;
   end;


  Application.CreateForm(Tfrm_encerramento, frm_encerramento);
  frm_encerramento.lb_mesa.Caption := numeroMesaPdv;
  frm_encerramento.ShowModal;
  frm_encerramento.free;

  voltar_mesa;
  busca_movimento_da_mesa;
  recriaMemo;
  muda_acao(1);


end;


procedure TfrmFrenteCaixa.limpaMesaPDV();
begin
  dm.qryauxiliar.Active := false;
  dm.qryauxiliar.sql.clear;
  dm.qryauxiliar.sql.add('delete from movimento_mesa where cod_mesa='+Quotedstr(numeroMesaPdv));
  dm.qryauxiliar.ExecSQL;


    if dm.transacao.Active = false then dm.transacao.Active := true;
  dm.transacao.Commit;

//  Memo1.Lines.Clear;
  ed_quantidade.value:=0;
  ed_total_conta.Value := 0;
  edValorUnitario.Value := 0;
  edTotalProduto.Value := 0;





end;


procedure TfrmFrenteCaixa.btFecharContaClick(Sender: TObject);
begin
  inherited;
  fecharConta();
//  dm.CancelaNotasPendentes();
//  dm.CancelaNotasPendentesPorSubstituicao();
end;

procedure TfrmFrenteCaixa.JvTransparentButton2Click(Sender: TObject);
begin
  inherited;

   if verifica_movimento = false then
     begin
       voltarParaCaixa :=2;
       Application.CreateForm(Tfrm_caixa_restaurante , frm_caixa_restaurante);
       frm_caixa_restaurante.ShowModal;
       frm_caixa_restaurante.Free;
     end
   else
    begin
      dm.exibe_painel_erro('ENCERRE A VENDA EM ANDAMENTO ANTES DE MUDAR DE MÓDULO!','OK');
      frm_principal.sairDoSistema  := false;
      frm_principal.TrocarOperador := false;
    end;

end;

procedure TfrmFrenteCaixa.B20002003Click(Sender: TObject);
var
 idProduto : integer;
begin
  inherited;
  permiteFecharForm := false;
if   (dm.verificaPermissaoAcao((sender as TJvTransparentButton ).Name) = true) then
 begin


      if verifica_movimento then
       begin
              idProduto :=dm.qry_movimento_mesa.FieldByName('id').Value;
             desistirCancelamento := true;

            TFloatField(dm.qry_movimento_mesa.Fields[5]).DisplayFormat := '###,###,##0.000';
            TFloatField(dm.qry_movimento_mesa.Fields[7]).DisplayFormat := 'R$ ###,###,##0.00';
            TFloatField(dm.qry_movimento_mesa.Fields[8]).DisplayFormat := 'R$ ###,###,##0.00';
            Application.CreateForm(TfrmCancelaItemPDV,frmCancelaItemPDV);
            frmCancelaItemPDV.showmodal;
            frmCancelaItemPDV.free;


            if (desistirCancelamento = false) then
             begin
               apagaItemMovimento(dm.qry_movimento_mesa.FieldByName('quantidade').Value,'0','0','');

    //          recriaMemo();
         end;
       end;
 end;
end;

procedure TfrmFrenteCaixa.btOperacoesCaixaClick(Sender: TObject);
begin
  inherited;
    permiteFecharForm := false;
     if verifica_movimento = false then
       begin
        Application.CreateForm(TfrmOperacoesDeCaixa,frmOperacoesDeCaixa);
        frmOperacoesDeCaixa.ShowModal;
        frmOperacoesDeCaixa.free;
       end
     else
      begin
        dm.exibe_painel_erro('ENCERRE A VENDA EM ANDAMENTO ANTES DE MUDAR DE MÓDULO!','OK');
        frm_principal.TrocarOperador := false;
         frmFrenteCaixa.permiteFecharForm := false;
        exit;
      end;


  if ( (verificaSeCaixaEstaAberto(ultimoCaixaAberto) = false) or (frm_principal.TrocarOperador = true) or (frm_principal.sairDoSistema = true ) )  then
   begin
     if verifica_movimento = false then
       begin
         frmFrenteCaixa.permiteFecharForm := true;
         Close;
       end
     else
      begin
        dm.exibe_painel_erro('ENCERRE A VENDA EM ANDAMENTO ANTES DE MUDAR DE MÓDULO!','OK');
        frm_principal.TrocarOperador := false;
      end;

    close;
   end;
end;

procedure TfrmFrenteCaixa.JvTransparentButton6Click(Sender: TObject);
begin
  inherited;
  Application.CreateForm(TfrmMenuFiscal,frmMenuFiscal);
  frmMenuFiscal.ShowModal;
  frmMenuFiscal.free;
end;

procedure TfrmFrenteCaixa.btConsultarProdutosClick(Sender: TObject);
begin
  inherited;
  pesquisa_produto;
end;


procedure TfrmFrenteCaixa.btDeleteProdutoClick(Sender: TObject);
var
 idProduto : integer;
begin
  inherited;
  permiteFecharForm := false;
if   (dm.verificaPermissaoAcao('B20002003') = true) then
 begin
   idProduto := TImage(Sender).Tag;
   dm.qry_movimento_mesa.Active := true;
   dm.qry_movimento_mesa.Locate('id',VarArrayOf([idProduto]),[loCaseInsensitive]);
   apagaItemMovimento(dm.qry_movimento_mesa.FieldByName('quantidade').Value,'0','0','');
 end;

end;

procedure TfrmFrenteCaixa.SpeedButton4Click(Sender: TObject);
begin

  inherited;
  if  pgGrupos.ActivePageIndex > 0 then
  pgGrupos.ActivePageIndex :=   pgGrupos.ActivePageIndex -1;
end;

procedure TfrmFrenteCaixa.SpeedButton5Click(Sender: TObject);
var
 qtdPg : string;
begin
  inherited;
   qtdPg :=   Floattostr( (paginaAtual-1) / 15);
 try

   StrToInt(qtdPg);
  except
   qtdPg := Inttostr(( (paginaAtual-1) div 15) +1 )
  end;

  if pgGrupos.ActivePageIndex <  StrToInt(qtdPg) -1  then
   begin

     pgGrupos.ActivePageIndex :=   pgGrupos.ActivePageIndex + 1;
   end;
end;

procedure TfrmFrenteCaixa.JvTransparentButton1Click(Sender: TObject);
begin
  inherited;


   if verifica_movimento = false then
     begin
      Application.CreateForm(TfrmMenuFiscal,frmMenuFiscal);
      frmMenuFiscal.ShowModal;
      frmMenuFiscal.free;

     end
   else
    begin
      dm.exibe_painel_erro('ENCERRE A VENDA EM ANDAMENTO ANTES DE MUDAR DE MÓDULO!','OK');
      frm_principal.sairDoSistema  := false;
      frm_principal.TrocarOperador := false;
      exit;

    end;


end;

procedure TfrmFrenteCaixa.FormClose(Sender: TObject;
  var Action: TCloseAction);
var
 OldValue : LongBool;
begin
  inherited;
   if permiteFecharForm = false then
    begin
     dm.exibe_painel_erro('Não é possível fechar este módulo desta forma. Acesse o menu de operações para sair','Ok');
     Action:=CaNone;
    end
   else
    begin
//     dm.desabilitaCltrAltDel();

    end;
end;


procedure TfrmFrenteCaixa.ApplicationMessage(var Msg: TMsg; var Handled: Boolean);
begin

end;

end.






