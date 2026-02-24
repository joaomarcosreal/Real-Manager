unit uuLancamentosSalao;
interface
uses
  Windows,
  Messages,
  SysUtils,
  variants,
  StdCtrls,
  Classes,
  Graphics,
  Controls,
  Forms,
  Dialogs,
  ExtCtrls,acbrutil,
  
  Buttons,
  Grids,
  DBGrids,
  
  Mask,
  
  
  ComCtrls,
  db,
  RXCtrls,
  Menus,uu_modelo_vazio, ibquery,
  dxStatusBar, ACBrBase,
  ACBrCalculadora, Shader, RxGIF, AdvTouchKeyboard, JvExControls, JvButton,
  JvTransparentButton, JvGradient, JvExExtCtrls, JvPanel,
  JvExStdCtrls, JvCtrls, JvArrowButton, JvDBLookup, JvComponentBase,
  JvFormAutoSize, JvItemsPanel, JvExComCtrls, JvComCtrls, RxToolEdit, RxCurrEdit;

type

  TfrmLancamentosSalao = class(Tfrm_modelo_vazio)
    memo_codigos_formas: TMemo;
    Panel2: TPanel;
    lb_hora: TLabel;
    pnMovimentoMesa: TPanel;
    Timer1: TTimer;
    lb_cod_produto: TLabel;
    pn_garcon: TPanel;
    ed_cod_garcon: Tedit;
    pn_mesa: TPanel;
    Label21: TLabel;
    ed_numero_mesa: Tedit;
    pn_produto: TPanel;
    Label2: TLabel;
    Label3: TLabel;
    bt_peq_produto: TSpeedButton;
    Label5: TLabel;
    ed_cod_produto: Tedit;
    Panel5: TPanel;
    ed_descricao_produto: Tedit;
    ed_valor_produto: Tedit;
    pnQtde: TPanel;
    ed_quantidade: Tedit;
    Label6: TLabel;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    lbGarcon: TLabel;
    pnTeclado: TPanel;
    AdvTouchKeyboard1: TAdvTouchKeyboard;
    pnProdutosTouch: TPanel;
    Panel7: TPanel;
    pgGrupos: TJvPageControl;
    TabSheet1: TTabSheet;
    btgp1: TJvImgBtn;
    btgp2: TJvImgBtn;
    btgp3: TJvImgBtn;
    btgp4: TJvImgBtn;
    btgp5: TJvImgBtn;
    btgp6: TJvImgBtn;
    btgp7: TJvImgBtn;
    TabSheet2: TTabSheet;
    btgp8: TJvImgBtn;
    btgp9: TJvImgBtn;
    btgp10: TJvImgBtn;
    btgp11: TJvImgBtn;
    btgp12: TJvImgBtn;
    btgp13: TJvImgBtn;
    btgp14: TJvImgBtn;
    TabSheet3: TTabSheet;
    btgp15: TJvImgBtn;
    btgp16: TJvImgBtn;
    btgp17: TJvImgBtn;
    btgp18: TJvImgBtn;
    btgp19: TJvImgBtn;
    btgp20: TJvImgBtn;
    btgp21: TJvImgBtn;
    TabSheet4: TTabSheet;
    btgp22: TJvImgBtn;
    btgp23: TJvImgBtn;
    btgp24: TJvImgBtn;
    btgp25: TJvImgBtn;
    btgp26: TJvImgBtn;
    btgp27: TJvImgBtn;
    btgp28: TJvImgBtn;
    TabSheet5: TTabSheet;
    btgp29: TJvImgBtn;
    btgp30: TJvImgBtn;
    btgp31: TJvImgBtn;
    btgp32: TJvImgBtn;
    btgp33: TJvImgBtn;
    btgp34: TJvImgBtn;
    btgp35: TJvImgBtn;
    SpeedButton5: TSpeedButton;
    SpeedButton4: TSpeedButton;
    pgProdutos: TJvPageControl;
    TabSheet6: TTabSheet;
    TabSheet7: TTabSheet;
    TabSheet8: TTabSheet;
    TabSheet9: TTabSheet;
    TabSheet10: TTabSheet;
    TabSheet11: TTabSheet;
    TabSheet12: TTabSheet;
    TabSheet13: TTabSheet;
    TabSheet14: TTabSheet;
    TabSheet15: TTabSheet;
    TabSheet16: TTabSheet;
    TabSheet17: TTabSheet;
    TabSheet18: TTabSheet;
    TabSheet19: TTabSheet;
    TabSheet20: TTabSheet;
    TabSheet21: TTabSheet;
    TabSheet22: TTabSheet;
    TabSheet23: TTabSheet;
    TabSheet24: TTabSheet;
    TabSheet25: TTabSheet;
    TabSheet26: TTabSheet;
    TabSheet27: TTabSheet;
    TabSheet28: TTabSheet;
    TabSheet29: TTabSheet;
    TabSheet30: TTabSheet;
    TabSheet31: TTabSheet;
    TabSheet32: TTabSheet;
    TabSheet33: TTabSheet;
    TabSheet34: TTabSheet;
    TabSheet35: TTabSheet;
    TabSheet36: TTabSheet;
    TabSheet37: TTabSheet;
    TabSheet38: TTabSheet;
    TabSheet39: TTabSheet;
    TabSheet40: TTabSheet;
    pnBotesProdutos: TPanel;
    btConfirmaLancamentos: TSpeedButton;
    btEstornaProduto: TSpeedButton;
    SpeedButton8: TSpeedButton;
    JvImgBtn53: TJvImgBtn;
    JvImgBtn54: TJvImgBtn;
    JvImgBtn55: TJvImgBtn;
    JvImgBtn56: TJvImgBtn;
    JvImgBtn60: TJvImgBtn;
    JvImgBtn59: TJvImgBtn;
    JvImgBtn58: TJvImgBtn;
    JvImgBtn57: TJvImgBtn;
    JvImgBtn61: TJvImgBtn;
    JvImgBtn62: TJvImgBtn;
    JvImgBtn63: TJvImgBtn;
    JvImgBtn64: TJvImgBtn;
    JvImgBtn68: TJvImgBtn;
    JvImgBtn67: TJvImgBtn;
    JvImgBtn66: TJvImgBtn;
    JvImgBtn65: TJvImgBtn;
    JvImgBtn69: TJvImgBtn;
    JvImgBtn70: TJvImgBtn;
    JvImgBtn71: TJvImgBtn;
    JvImgBtn72: TJvImgBtn;
    JvImgBtn76: TJvImgBtn;
    JvImgBtn75: TJvImgBtn;
    JvImgBtn74: TJvImgBtn;
    JvImgBtn73: TJvImgBtn;
    JvImgBtn77: TJvImgBtn;
    JvImgBtn78: TJvImgBtn;
    JvImgBtn79: TJvImgBtn;
    JvImgBtn80: TJvImgBtn;
    JvImgBtn25: TJvImgBtn;
    JvImgBtn26: TJvImgBtn;
    JvImgBtn27: TJvImgBtn;
    JvImgBtn28: TJvImgBtn;
    JvImgBtn29: TJvImgBtn;
    JvImgBtn30: TJvImgBtn;
    JvImgBtn31: TJvImgBtn;
    JvImgBtn32: TJvImgBtn;
    JvImgBtn33: TJvImgBtn;
    JvImgBtn34: TJvImgBtn;
    JvImgBtn35: TJvImgBtn;
    JvImgBtn36: TJvImgBtn;
    JvImgBtn37: TJvImgBtn;
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
    btpd011: TJvImgBtn;
    btpd012: TJvImgBtn;
    btpd013: TJvImgBtn;
    btpd014: TJvImgBtn;
    JvImgBtn1: TJvImgBtn;
    JvImgBtn2: TJvImgBtn;
    JvImgBtn3: TJvImgBtn;
    JvImgBtn4: TJvImgBtn;
    JvImgBtn5: TJvImgBtn;
    JvImgBtn6: TJvImgBtn;
    JvImgBtn7: TJvImgBtn;
    JvImgBtn8: TJvImgBtn;
    JvImgBtn9: TJvImgBtn;
    JvImgBtn10: TJvImgBtn;
    JvImgBtn11: TJvImgBtn;
    JvImgBtn12: TJvImgBtn;
    JvImgBtn13: TJvImgBtn;
    JvImgBtn14: TJvImgBtn;
    JvImgBtn15: TJvImgBtn;
    JvImgBtn16: TJvImgBtn;
    JvImgBtn17: TJvImgBtn;
    JvImgBtn18: TJvImgBtn;
    JvImgBtn19: TJvImgBtn;
    JvImgBtn20: TJvImgBtn;
    JvImgBtn21: TJvImgBtn;
    JvImgBtn22: TJvImgBtn;
    JvImgBtn23: TJvImgBtn;
    JvImgBtn24: TJvImgBtn;
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
    JvImgBtn174: TJvImgBtn;
    JvImgBtn175: TJvImgBtn;
    JvImgBtn176: TJvImgBtn;
    JvImgBtn177: TJvImgBtn;
    JvImgBtn178: TJvImgBtn;
    JvImgBtn179: TJvImgBtn;
    JvImgBtn180: TJvImgBtn;
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
    JvImgBtn973: TJvImgBtn;
    JvImgBtn974: TJvImgBtn;
    JvImgBtn975: TJvImgBtn;
    JvImgBtn976: TJvImgBtn;
    pnProdutosMesa: TPanel;
    Panel1: TPanel;
    D30001011: TDBGrid;
    btResumir: TSpeedButton;
    SpeedButton6: TSpeedButton;
    SpeedButton10: TSpeedButton;
    SpeedButton9: TSpeedButton;
    SpeedButton7: TSpeedButton;
    Panel3: TPanel;
    Label10: TLabel;
    lbTxServ: TLabel;
    Label4: TLabel;
    ed_valor_bruto: TCurrencyEdit;
    ed_total_tx_serv: TCurrencyEdit;
    ed_total_conta: TCurrencyEdit;
    pnMapaMesas: TPanel;
    DBGrid1: TDBGrid;
    imgMapa: TImage;
    pnFuncoesMesa: TPanel;
    SpeedButton1: TSpeedButton;
    SpeedButton11: TSpeedButton;
    xB20002001: TJvTransparentButton;
    B20002001: TJvTransparentButton;
    JvTransparentButton2: TJvTransparentButton;
    pnInfoMesas: TPanel;
    edQtdMesas: TEdit;
    edMesasPagto: TEdit;
    edLixo: TEdit;
    brReabre: TJvTransparentButton;
    procedure mudaCaptionsBotoes();
    procedure alternarTipoCaixa(tipo : integer);
    procedure ed_numero_mesaExit(Sender: TObject);
    function busca_movimento_da_mesa: boolean;
    function informacoes_garcon: boolean;
    function pesquisar_produto: boolean;
    function verifica_validade_lancamento: boolean;
    function adicionar_produto_conta(mesa : string; enviar_impressao : boolean ): boolean;
    function pesquisa_produto: boolean;
    function gravar_tx_serv: boolean;

    procedure ed_numero_mesaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
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
    procedure pesquisaGarcons();

    procedure B20002001Click(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure B20002006Click(Sender: TObject);
    procedure B20002004Click(Sender: TObject);
    procedure B20002007Click(Sender: TObject);
    function verifica_movimento: boolean;
    procedure B300010040Click(Sender: TObject);
    procedure verificar_permissoes;
    procedure voltar_mesa;
    procedure B20002014Click(Sender: TObject);
    procedure D30001011Exit(Sender: TObject);
    procedure D30001011MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure D30001011DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);

    procedure transferirMesa();
    procedure transferirItem();
    procedure apagaItemMovimento(qtde: double; codMotivo : string; descricaoMotivo: string; obs : string);

    procedure B30001007Click(Sender: TObject);
    procedure B30001001KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure emitirExtrato(variasMesas : boolean);
    procedure fecharConta();
    procedure B20001002Click(Sender: TObject);
    procedure efetuar_lancamento;
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure B20002005Click(Sender: TObject);
    procedure ed_numero_mesaChange(Sender: TObject);
    procedure ed_cod_produtoChange(Sender: TObject);
    procedure ed_quantidadeChange(Sender: TObject);
    procedure lancarCouvertAutomatico(mesa : string);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure timerAtualizaTelaMesasTimer(Sender: TObject);


    procedure enter_botao(Sender: TObject);
    procedure FuncaoBtnClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure btCalculadoraClick(Sender: TObject);
    procedure B20001003Click(Sender: TObject);
    procedure CancelamentodeProduto1Click(Sender: TObject);
    procedure RANSFERNCIA1Click(Sender: TObject);
    procedure gravarEstornoMesa(mesa : string);
    procedure muda_acao(tipo : integer);
    procedure ed_cod_garconChange(Sender: TObject);
    procedure pisca1Timer(Sender: TObject);
    procedure pisca2Timer(Sender: TObject);
    procedure pnExpedicaoClick(Sender: TObject);
    procedure imgAtencaoClick(Sender: TObject);
    procedure Image1Click(Sender: TObject);
    procedure lbPedidosClick(Sender: TObject);
    procedure Label12Click(Sender: TObject);

    procedure btMapaMesasClick(Sender: TObject);
    procedure btMenuFiscalClick(Sender: TObject);
    procedure btOpCaixaClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure bt_peq_produtoClick(Sender: TObject);
    procedure JvGradient1Click(Sender: TObject);
    procedure MakeRounded(Control: TWinControl);
    procedure FormCreate(Sender: TObject);
    procedure criaBotoesTouch();    
    procedure SpeedButton4Click(Sender: TObject);
    procedure btgp1Click(Sender: TObject);
    procedure btpd011Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure btConfirmaLancamentosClick(Sender: TObject);
    procedure SpeedButton8Click(Sender: TObject);
    procedure SpeedButton6Click(Sender: TObject);
    procedure SpeedButton7Click(Sender: TObject);
    procedure SpeedButton10Click(Sender: TObject);
    procedure SpeedButton9Click(Sender: TObject);
    procedure btResumirClick(Sender: TObject);
    procedure btEstornaProdutoClick(Sender: TObject);
    procedure mostraMapaMesas();
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure SpeedButton11Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure JvTransparentButton2Click(Sender: TObject);
    procedure DBGrid1ColEnter(Sender: TObject);
    procedure TransparentButton7Click(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure JvTransparentButton1Click(Sender: TObject);
    procedure brReabreClick(Sender: TObject);

//    procedure AdvTouchKeyboard1DrawKey(Sender: TObject;
//      Key: TAdvTouchKeyItem; Canvas: TCanvas; Down: Boolean; Rect: TRect;

//      var DefaultDraw: Boolean);



  private
    { Private declarations }
    modo_exibicao: integer;
    paginaAtual : integer;
    guidSeqImpressao : string;

    //0 normal
    //1 resumido

  public
    { Public declarations }
   tipo_caixa_atual : integer;

  end;





var
  frmLancamentosSalao: TfrmLancamentosSalao;
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
  uu_cancela_item_restaurante;
{$R *.dfm}

procedure TfrmLancamentosSalao.ed_numero_mesaExit(Sender: TObject);
var
 qtdeCalculada : double;
begin

  if sender is TDBGrid then
  begin
    (sender as TDBGrid).Color := clWhite;
  end;

 if ((sender is Tedit and ((sender as Tedit).Name = 'ed_numero_mesa')) and (Trim(ed_numero_mesa.text) <> '')) then
  begin
   guidSeqImpressao := RandomName(8);
   btResumir.Click;

   pnMapaMesas.Visible := false;
//   pnFuncoesMesa.Visible := false;
   pnProdutosMesa .Visible := true;
//   pnTeclado.Top := 146;
//   pnTeclado.Left := 424;
   pnInfoMesas.Visible := false;


   ed_numero_mesa.Text:= dm.removeCaracteres(ed_numero_mesa.Text);
   dm.transacao.Active:=true;
   dm.transacao.Active:=false;
   dm.transacao.Active:=true;

   if trim(ed_quantidade.text) = ''  then     ed_quantidade.text:='1';

    try
      begin
        if trim(ed_numero_mesa.Text) = '' then
        begin
          ed_numero_mesa.Clear;
          ed_numero_mesa.SetFocus;
          exit;
        end
        else
        begin
          ed_numero_mesa.Text := formatfloat('0000', Strtofloat(ed_numero_mesa.Text));
          ed_numero_mesa.Text := formatfloat('0000', Strtofloat(ed_numero_mesa.Text));


          
          if( (trim(ed_numero_mesa.Text) <> dm.getCodMesaBalcao()) )   then
          begin
            //ed_cod_garcon.Text := dm.getCodGarconAbriuMesa(ed_numero_mesa.Text);
          end;



        end;
      end;
    except
      begin
        showmessage('Número de mesa inválido!');
        ed_numero_mesa.Clear;
        ed_numero_mesa.SetFocus;
        exit;
      end;
    end;


    if (trim (ed_numero_mesa.Text) = '0000') then
     begin
        showmessage('Número de mesa inválido!');
        ed_numero_mesa.Clear;
        ed_numero_mesa.SetFocus;
        exit;
     end;


    //    foto.Picture.LoadFromFile(dm.LeIni(2,'IMAGENS','caixa_aguardando'));

    //Ponto de verificacao se usa cartao
    if ( (dm.verificaSeFuncionaComoBoate = true) and (ed_numero_mesa.Text <> dm.getCodMesaBalcao() ) )   then
     begin
       if (verificaStatusCartao(ed_numero_mesa.Text) = false ) then
         begin
           ed_numero_mesa.clear;
           ed_numero_mesa.SetFocus;
           exit;
         end;
     end;







    if (dm.verificaseExisteMovimentoMesa(ed_numero_mesa.Text) = false) then
     begin
       dm.apagaExtratosEmitidos(ed_numero_mesa.Text);
       dm.ApagaAberturaDaMesa(ed_numero_mesa.text);
       if dm.transacao.Active = false then dm.transacao.Active:=true;
       dm.transacao.Commit;
     end;



    if (   (dm.verificaExtratosEmitidos(ed_numero_mesa.text) = true)  and  (StrToInt(dm.LeIni(2, 'CAIXA', 'checar_mesa_aberta')) = 1) and (dm.verificaMesaBalcao(ed_numero_mesa.Text) = false)   )  then
     begin
      string_auxiliar := 'N';
      Application.CreateForm(Tfrm_confirma_extrato, frm_confirma_extrato);
      frm_confirma_extrato.setTitulo('Confirmação');
      frm_confirma_extrato.setMensagem('A mesa informada encontra-se aguardando pagamento!! '+#13#10+#13#10+' Deseja continuar ?',12);
      frm_confirma_extrato.ShowModal;
      frm_confirma_extrato.free;
      if string_auxiliar = 'S' then
       begin
         busca_movimento_da_mesa();
       end
      else
       begin
         ed_numero_mesa.Clear;
         ed_numero_mesa.SetFocus();
       end;
     end
    else
     begin
      busca_movimento_da_mesa;
     end;

  end
 else
  begin



  end;

  if ((sender is Tedit and ((sender as Tedit).Name = 'ed_cod_garcon')) and (trim(ed_cod_garcon.text) <> '')) then
  begin
    if triM( (sender as Tedit).Text) = '' then exit;


    try
      ed_cod_garcon.Text := FormatFloat('000', strtofloat(ed_cod_garcon.Text));
    except
      begin
        ShowMessage('Código de garçon inválido!');
        ed_cod_garcon.clear;
        ed_cod_garcon.SetFocus;
        exit;
      end;
    end;

     if ( dm.getCodMesaBalcao = trim(ed_cod_garcon.Text) )
     then
      begin
        ShowMessage('Código de garçon inválido!');
        ed_cod_garcon.clear;
        ed_cod_garcon.SetFocus;
           exit;
      end;
    informacoes_garcon;
  end;

  if ( (sender is Tedit and ((sender as Tedit).Name = 'ed_cod_garcon')) ) then
  begin
   if  (dm.getCodGarconMesaBalcao = ed_cod_garcon.Text) then
   begin
        ShowMessage('Código de garçon inválido!');
        ed_cod_garcon.clear;
        ed_cod_garcon.SetFocus;
         exit;

   end;

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
      ShowMessage('O código informado não pertence a um produto cadastrado!');
      ed_cod_produto.SetFocus;
      ed_cod_produto.Clear;
      exit;
    end;
    lb_cod_produto.Caption := dm.qryauxiliar.fieldbyname('cod_produto').value;
    ed_descricao_produto.Text := dm.qryauxiliar.fieldbyname('descricao').value;
    ed_valor_produto.Text := FormatFloat('#0.00,', dm.qryauxiliar.fieldbyname('valor_unitario').value);
    try
      //       foto.picture.LoadFromFile(dm.qryauxiliar.fieldbyname('caminho_foto').value);
    except
      begin
        ShowMessage('Caminho de imagem incorreto! Favor alterar a imagem do produto no cadastro de produtos.');
        try
          //           foto.picture.LoadFromFile(dm.LeIni(2,'IMAGENS','sem_foto'));
        except
        end;
      end;
    end;


 //    lb_preco.Visible := true;
//    descricao_prod.Visible := true;
//    descricao_prod.Caption := dm.qryauxiliar.fieldbyname('descricao').value;
//    lb_preco.Caption := FormatFloat('R$ #0.00,', dm.qryauxiliar.fieldbyname('valor_unitario').value);





{     if ( verificaProdutoDigitaPreco(ed_cod_produto.Text) = true) then
     begin

      ed_valor_produto.Clear;
      ed_valor_produto.Enabled:=true;
      ed_valor_produto.ReadOnly:=false;
      Application.CreateForm(TfrmLerPesoRestauranteBarras,frmLerPesoRestauranteBarras);
      frmLerPesoRestauranteBarras.ShowModal;
      frmLerPesoRestauranteBarras.Free;
      qtdeCalculada:=0;
      qtdeCalculada:= StrToFloat(ed_valor_produto.Text)   /  getValorProduto(ed_cod_produto.Text,2);
      ed_quantidade.text := FormatFloat('#0.00000',qtdeCalculada);
      efetuar_lancamento;
     end
     }


    if ( verificaProdutoDigitaPreco(ed_cod_produto.Text) = true) then
     begin
      ed_valor_produto.Clear;
      ed_valor_produto.Enabled:=true;
      ed_valor_produto.ReadOnly:=false;
      ed_valor_produto.SetFocus;
     end

    else
     begin
      ed_valor_produto.Enabled:=false;
      ed_valor_produto.ReadOnly:=true;
      ed_quantidade.ReadOnly := false;


      if (verificaSeProdutoLeQuantidadeDaBalanca(ed_cod_produto.Text,2) = true) then
        begin
          sucessoLeituraPeso := true;


          case getBalancaLeitura(ed_cod_produto.Text,2) of
           1: begin

                 try
                   begin
                     frm_principal.balanca.Ativar;

                   end;
                  except
                   begin
                    dm.exibe_painel_erro('Erro ao conectar à balança 01 . Verifique a porta ou cabo de conexão!','Continuar');
                   end;
                  end;


                dm.adicionaLog('Tenta ler o peso na balança 1');
                Try
                  begin
                     frm_principal.balanca.LePeso(200);
                     dm.adicionaLog('Leu o peso '+pesoLidoBalanca);
                     ed_quantidade.Text := pesoLidoBalanca;
                     frm_principal.balanca.Desativar;
                  end;
                except
                  begin
                   dm.adicionaLog('Erro ao ler o peso na balança 1');
                   ed_cod_produto.SetFocus;
                   exit;
                  end;
                end;
              end;


           2: begin
                try
                  frm_principal.balanca2.Ativar;
                except
                  begin
                    dm.exibe_painel_erro('Erro ao conectar à balança. Verifique a porta ou cabo de conexão!','Continuar');
                  end;
                end;

                Try
                  begin
                     frm_principal.balanca2.LePeso(200);

                     ed_quantidade.Text := pesoLidoBalanca;
                     frm_principal.balanca2.Desativar;
                  end;
                except
                  begin
                   ed_cod_produto.SetFocus;
                   exit;
                  end;
                end;
              end;



          end;





{
          ed_quantidade.Text := '0,234';
          pesoLidoBalanca := '0,234';
          sucessoLeituraPeso := true;
 }


          if sucessoLeituraPeso = true then
            begin

            if strToFloat(pesoLidoBalanca) <= 0 then
              begin
               dm.exibe_painel_erro('Erro ao fazer leitura do peso!','Continuar');
               sucessoLeituraPeso :=false;
               ed_descricao_produto.Clear;
               ed_quantidade.Clear;
               ed_cod_produto.Clear;
               ed_cod_produto.SetFocus;
               exit;
             end
            else
             begin
              dm.efetuaAberturaDaMesa(ed_numero_mesa.text);
              adicionar_produto_conta(ed_numero_mesa.Text,    ( (dm.verificaProdutoImprimeLocalProducao(lb_cod_produto.Caption))  and (dm.verificaProdutoImprimeMesas(lb_cod_produto.Caption ) ) ) );
              exit;
             end;

            end
          else
            begin
             ed_descricao_produto.Clear;
             ed_cod_produto.Clear;
             ed_cod_produto.SetFocus;
             exit;
            end;
          frm_principal.balanca.Desativar;
        end;

      ed_quantidade.SetFocus;
     end;


  end;

if ((sender is Tedit and ((sender as Tedit).Name = 'ed_valor_produto'))) then
  begin
    try
      StrToFloat(ed_valor_produto.Text);
    except
      begin
        showmessage('Valor do produto inválido!');
        ed_valor_produto.SetFocus;
        ed_valor_produto.clear;
        exit;
      end;
    end;

    if ( StrToFloat(ed_valor_produto.Text) <= 0 ) then
    begin
        showmessage('Valor do produto inválido!!');
        ed_valor_produto.SetFocus;
        ed_valor_produto.clear;
        exit;
    end;

    if (verificaSeProdutoCalculaQtde(ed_cod_produto.text,2) ) then
     begin
       qtdeCalculada:=0;
       qtdeCalculada:= StrToFloat(ed_valor_produto.Text)   /  getValorProduto(ed_cod_produto.Text,2);
       ed_quantidade.text := FormatFloat('#0.00000',qtdeCalculada);
       efetuar_lancamento;
     end;


    if (  ((sender as Tedit).Name = 'ed_quantidade'))  then
    begin
      efetuar_lancamento();
    end;

  end;


  if ((sender is Tedit and ((sender as Tedit).Name = 'ed_quantidade'))) then
  begin
     IF  (trim(ed_quantidade.text) = '') THEN exit;


   if (verificaSeUsaCodGarcon = False) then
    begin
      ed_cod_garcon.text:=dm.getCodGarconMesaBalcao();
//      ed_cod_garcon.Visible:=false;
      //pn_garcon.Visible:=FALSE;

      lbGarcon.Visible := false;
      ed_cod_garcon.Visible := false;
    end;


    try
      StrToFloat(ed_quantidade.Text);
    except
      begin
        showmessage('Quantidade inválida!');
        ed_quantidade.SetFocus;
        ed_quantidade.clear;
        exit;
      end;
    end;

    if ( StrToFloat(ed_quantidade.Text) <= 0 ) then
    begin
        showmessage('Quantidade inválida!');
        ed_quantidade.SetFocus;
        ed_quantidade.clear;
        exit;

    end;

      efetuar_lancamento();


  end;


end;

function TfrmLancamentosSalao.busca_movimento_da_mesa: boolean;
var
  valor_bruto: double;
  valor_tx_serv: double;
  valorDescontos : double;
  Marcado : TBooleanField;
begin
        
  if ( trim(ed_numero_mesa.Text) = '' ) then exit;
  ed_numero_mesa.Text := Formatfloat('0000', StrToFloat(ed_numero_mesa.text));
  dm.transacao.Active := false;
  dm.transacao.Active := true;


/// Verificação de cobrança de taxa de serviço.

    // Verifica se o atual caixa aberto cobra taxa de serviço.
    if (verificaSeCobraServico = false ) then  // Se não cobrar, zera o valor do percentual
     begin
      percentualTaxaServico:=0
     end
    else
      begin
      // Se cobrar, verifica se a mesa em questão cobra taxa de servico

        If verificaSeCartaoCobraServico(ed_numero_mesa.Text) then
         begin
            percentualTaxaServico:= StrToFloat(dm.LeIni(2,'TAXA_SERVICO','percentual'));
         end
        else
         begin
           percentualTaxaServico:= 0;
         end;
      end;

  // Fim da verificação de cobrança de taxa de serviço.
////////////////////////////////////////////////////////







  if (resumido = false ) then
  begin
    dm.qry_movimento_mesa.Active := false;
    dm.qry_movimento_mesa.sql.clear;
    dm.qry_movimento_mesa.SQL.Add('select mv.cod_mesa,pr.cod_barras,');
    dm.qry_movimento_mesa.sql.Add(' mv.cod_produto,pr.cod_produto,');
    dm.qry_movimento_mesa.sql.Add(' pr.descricao,mv.quantidade as quantidade,');
    dm.qry_movimento_mesa.sql.Add('mv.valor_unitario,');
    if (arredondamento = 1 ) then
     dm.qry_movimento_mesa.sql.add('udf_truncdec((mv.valor_unitario * mv.quantidade),3) as total')
    else
     dm.qry_movimento_mesa.sql.add('udf_rounddec((mv.valor_unitario * mv.quantidade),3) as total ');



    dm.qry_movimento_mesa.sql.Add(',mv.comanda, mv.cod_garcon, g.apelido,u.login,mv.hora_lancamento, mv.estado,mv.cod_movimento, mv.desconto,id,impresso,observacoes,sabores,obs_paf,cancelado');
    dm.qry_movimento_mesa.SQL.Add('  from movimento_mesa mv ');
    dm.qry_movimento_mesa.sql.Add('  inner join produtos pr on (pr.cod_produto=mv.cod_produto)');
    dm.qry_movimento_mesa.sql.add('  inner join garcons g on (g.cod_garcon=mv.cod_garcon) ');
    dm.qry_movimento_mesa.SQL.add('  inner join usuarios u on (u.cod_usuario=mv.cod_usuario)');
    dm.qry_movimento_mesa.SQL.add('  where cancelado=0 and  mv.cod_mesa=' + Quotedstr(ed_numero_mesa.Text) + ' order by mv.cod_movimento');
    dm.qry_movimento_mesa.Active := true;

{
    D30001011.Columns[0].Width :=200;
    D30001011.Columns[1].Width :=20;
    D30001011.Columns[2].Width :=105;
 }

    D30001011.Columns[0].Width :=200;
    D30001011.Columns[1].Width :=40;
    D30001011.Columns[2].Width :=85;
//    TFloatField(dm.qry_movimento_mesa.Fields[3]).DisplayFormat := '#0.000';



    TFloatField(dm.qry_movimento_mesa.Fields[5]).DisplayFormat := '#0.000';
    TFloatField(dm.qry_movimento_mesa.Fields[7]).DisplayFormat := 'R$ ###,###,##0.00';
{
    TFloatField(dm.qry_movimento_mesa.Fields[5]).DisplayFormat := '###,###,##0.00';
    TFloatField(dm.qry_movimento_mesa.Fields[6]).DisplayFormat := 'R$ ###,###,##0.00';


    D30001011.Columns[0].Visible := false;
    D30001011.Columns[1].Title.Caption := 'Cód.';
    D30001011.Columns[1].Width := 45;
    D30001011.Columns[1].visible := false;
    D30001011.Columns[2].Visible := false;
    D30001011.Columns[3].Visible := false;
    D30001011.Columns[4].Title.Caption := 'Nome do Produto';
    D30001011.Columns[4].Width := 200;
    D30001011.Columns[5].Title.Caption := 'Qde';
    D30001011.Columns[5].Width := 150;

//    D30001011.Columns[6].Title.Caption := 'Preço';
//    D30001011.Columns[6].Width := 60;
    D30001011.Columns[6].Visible := false;


  //  D30001011.Columns[7].Title.Caption := 'Total';
//    D30001011.Columns[7].Width := 90;
    D30001011.Columns[7].Visible  := false;
    D30001011.Columns[8].Visible  := false;
    D30001011.Columns[9].Visible  := false;
    D30001011.Columns[10].Visible := false;
    D30001011.Columns[10].Visible := false;
    D30001011.Columns[11].Visible := false;
    D30001011.Columns[12].Visible := false;
    D30001011.Columns[13].Visible := false;
    D30001011.Columns[14].Visible := false;
    D30001011.Columns[15].Visible := false;
    D30001011.Columns[16].Visible := false;
    D30001011.Columns[17].Visible := false;
    D30001011.Columns[18].Visible := false;
    D30001011.Columns[19].Visible := false;
    D30001011.Columns[20].Visible := false;
//    D30001011.Columns[20].Title.Caption := 'Observação';
//    D30001011.Columns[20].Width := 155;
    D30001011.Columns[21].Visible := false;

          }
  end
  else
  begin
    dm.qry_movimento_mesa.Active := false;
    dm.qry_movimento_mesa.sql.clear;
    dm.qry_movimento_mesa.sql.add('select mv.cod_produto,p.cod_barras,p.descricao,sum(mv.quantidade)as quantidade,sum(MV.valor_unitario * mv.quantidade) as total , sum(mv.desconto) as desconto  from movimento_mesa mv');
    dm.qry_movimento_mesa.sql.add('inner join produtos p on (p.cod_produto = mv.cod_produto)');
    dm.qry_movimento_mesa.sql.add(' where mv.cod_mesa=' + Quotedstr(ed_numero_mesa.Text)+' and mv.cancelado <> 1');
    dm.qry_movimento_mesa.sql.add('group by mv.cod_produto,p.cod_barras,p.descricao,mv.valor_unitario');
    dm.qry_movimento_mesa.sql.add('order by mv.cod_produto');
    dm.qry_movimento_mesa.Active := true;

//    TFloatField(dm.qry_movimento_mesa.Fields[3]).DisplayFormat := 'R$ ###,###,##0.00';
//    TFloatField(dm.qry_movimento_mesa.Fields[3]).DisplayFormat := '###,###,##0.000';
//    D30001011.Columns[4].Visible := true;
//    D30001011.Columns[1].Width :=150;
//     D30001011.Columns[0].Width :=250;

    D30001011.Columns[0].Width :=200;
    D30001011.Columns[1].Width :=40;
    D30001011.Columns[2].Width :=85;
    TFloatField(dm.qry_movimento_mesa.Fields[3]).DisplayFormat := '#0.000';
    TFloatField(dm.qry_movimento_mesa.Fields[4]).DisplayFormat := 'R$ ###,###,##0.00';


  //  TFloatField(dm.qry_movimento_mesa.Fields[4]).DisplayFormat := 'R$ ###,###,##0.00';
    TFloatField(dm.qry_movimento_mesa.Fields[5]).DisplayFormat := 'R$ ###,###,##0.00';
  {
    D30001011.Columns[0].Visible := false;
    D30001011.Columns[1].Title.Caption := 'Cód.';
    D30001011.Columns[1].Visible := true;
    D30001011.Columns[1].Width := 45;
    D30001011.Columns[1].visible := false;


    D30001011.Columns[2].Title.Caption := 'Nome do produto';
    D30001011.Columns[2].Width := 200;



    D30001011.Columns[3].Title.Caption := 'Quantidade';
    D30001011.Columns[3].Visible := true;
    D30001011.Columns[3].Width := 70;


//    D30001011.Columns[4].Title.Caption := 'Preço';
//    D30001011.Columns[4].Width := 70;
    D30001011.Columns[4].visible := false;



    D30001011.Columns[5].Title.Caption := 'Desconto';
    D30001011.Columns[5].Width := 70;
    D30001011.Columns[5].visible := false;

    }

  end;
  valor_bruto := 0;
  valor_tx_serv := 0;
  valorDescontos :=0;
  ed_total_tx_serv.Value := 0;
  ed_valor_bruto.Value :=   0;
  ed_total_conta.Value := 0;

  dm.qry_movimento_mesa.First;

  if ( dm.qry_movimento_mesa.IsEmpty = false) then
   begin
      dm.qryauxiliar.Active:=FALSE;
      dm.qryauxiliar.sql.clear;
      dm.qryauxiliar.SQL.add('select * from rodapeextrato2('+Quotedstr(ed_numero_mesa.text)+','+dm.TrocaVirgPPto(Floattostr(percentualTaxaServico))+')');
      dm.qryauxiliar.Active:=true;

      if tipo_caixa_atual = 1 then
       begin
          ed_total_tx_serv.Value := 0;
          ed_valor_bruto.Value :=   dm.qryauxiliar.fieldbyname('VALORBRUTO').Value;
          ed_total_conta.Value := dm.qryauxiliar.fieldbyname('VALORBRUTO').Value;
       end
      else
       begin
          ed_total_tx_serv.Value := dm.qryauxiliar.fieldbyname('VALORTXSERV').Value;
          ed_valor_bruto.Value :=   dm.qryauxiliar.fieldbyname('VALORBRUTO').Value;
          ed_total_conta.Value := dm.qryauxiliar.fieldbyname('VALORTOTAL').Value;
       end;
   end;






end;

function TfrmLancamentosSalao.informacoes_garcon: boolean;
begin
  dm.qry_consultas.Active := false;
  dm.qry_consultas.sql.clear;
  dm.qry_consultas.sql.add('select * from garcons where cod_garcon=' + Quotedstr(ed_cod_garcon.text));
  dm.qry_consultas.Active := true;
  if dm.qry_consultas.IsEmpty then
  begin
    ShowMessage('Não existe garçon cadastrado com o código informado!');
    ed_cod_garcon.setfocus;
    ed_cod_garcon.clear;
    exit;
  end
  else
  begin

    //     ed_nome_garcon.Text:=dm.qry_consultas.fieldbyname('apelido').value;

  end;

end;

procedure TfrmLancamentosSalao.ed_numero_mesaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = vk_return then
  begin
    if not ((sender is TMemo) or (sender is Tdbgrid)) then
     begin
       if (sender is Tedit) and (((sender as Tedit).Name = 'ed_cod_produto') ) then
        begin
          if (trim(ed_cod_produto.Text) = '') then
           ed_numero_mesa.SetFocus
          else
            Perform(WM_NEXTDLGCTL, 0, 0)
        end
       else
        begin
          Perform(WM_NEXTDLGCTL, 0, 0)
        end;
     end;


  end;


    if ( (key = vk_escape) and (dm.verificaMesaBalcao(ed_numero_mesa.Text) = true)  )then
  begin
    if (sender is Tedit) and (((sender as Tedit).Name = 'ed_cod_produto') ) then
     begin
      if ( (dm.verificaseExisteMovimentoMesaBalcao() = true) ) then
       begin
         dm.exibe_painel_erro('A venda balcão ainda não foi encerrada!','Prosseguir...');
         exit;
       end
      else
       begin
//         Close;
       end;
     end
    else
      begin
            if (sender is Tedit) and (((sender as Tedit).Name = 'ed_quantidade') ) then
              ed_cod_produto.SetFocus;

      end;
  end;



  if key = vk_escape then
  begin
    if (sender is Tedit) and (((sender as Tedit).Name = 'ed_cod_produto') or ((sender as Tedit).Name = 'ed_numero_comanda') or ((sender as Tedit).Name = 'ed_quantidade')) then
    begin
      ed_cod_produto.clear;
      ed_descricao_produto.Clear;
      ed_valor_produto.Clear;
      ed_quantidade.clear;
      ed_numero_mesa.SetFocus;
      exit;
    end;
  end;

  if key = vk_escape then
  begin
    if (sender is TDBGrid) and (((sender as TDBGrid).Name = 'D30001011')) then
    begin
      if( trim(ed_numero_mesa.Text) <> dm.getCodMesaBalcao() ) then
       begin
        voltar_mesa;
       end
      else
       begin
         ed_cod_produto.SetFocus();
       end;
    end;
  end;

  if key = vk_escape then
  begin
    if ((sender is Tedit and ((sender as Tedit).Name <> 'ed_numero_mesa')) or (sender is TDBGrid and ((sender as TDBGrid).Name = 'DBGrid1'))) then
    begin
     if( trim(ed_numero_mesa.Text) <> dm.getCodMesaBalcao() ) then
       begin
        dm.qry_movimento_mesa.Active := false;
        ed_cod_produto.clear;
        ed_descricao_produto.Clear;
        ed_valor_produto.Clear;
        ed_quantidade.clear;
        ed_cod_garcon.clear;
        //      ed_nome_garcon.Clear;
        ed_valor_bruto.Text := '0,00';
        //      ed_total_taxa.Text:='0,00';
        ed_total_conta.Text := '0,00';
        ed_numero_mesa.Clear;
        ed_numero_mesa.SetFocus;
        //      foto.Picture.LoadFromFile(dm.LeIni(2,'IMAGENS','caixa_livre'));
//        lb_preco.Visible := true;
//        descricao_prod.Visible := true;
//        lb_preco.Visible := false;
//        descricao_prod.Visible := false;
       end;
    end;
    if sender is Tedit and ((sender as Tedit).Name = 'ed_numero_mesa') then
    begin
      if ( StrToInt(dm.LeIni(2,'CAIXA','estacaoLancamentoSalao') ) =1 ) then
       begin

       end
      else
       begin
//        Close
       end;
    end;

  end;

  if key = vk_f2 then
  begin
    if sender is Tedit and ((sender as Tedit).Name = 'ed_cod_produto') then
      pesquisa_produto;

    if sender is Tedit and ((sender as Tedit).Name = 'ed_cod_garcon') then
      pesquisaGarcons;
  end;

  if key = vk_f3 then
  begin
    if sender is TDBGrid and ((sender as TDBGrid).Name = 'DBGrid1') then
    begin
      Application.CreateForm(Tfrm_transferir_item, frm_transferir_item);
      frm_transferir_item.ShowModal;
      frm_transferir_item.Free;
      busca_movimento_da_mesa;
    end;
  end;

  if key = vk_f12 then
  begin
    D30001011.SetFocus;
    D30001011.Columns[2].Showing;
    D30001011.SelectedIndex := 2;
  end;

  if ((key = vk_f3)) then
  begin
//    B20002001.Click;
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

function TfrmLancamentosSalao.pesquisar_produto: boolean;
begin
  dm.qry_consultas.Active := false;
  dm.qry_consultas.SQL.Clear;
  dm.qry_consultas.SQL.add('select * from produtos ');
  dm.qry_consultas.Active := true;

  if dm.qry_consultas.IsEmpty then
  begin
    ShowMessage('Não existem produtos cadastrados!');
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

function TfrmLancamentosSalao.verifica_validade_lancamento: boolean;
begin
  result:=true;

  if ( (dm.verificaExtratosEmitidos(ed_numero_mesa.text) = true) and (dm.verificaseExisteMovimentoMesa(ed_numero_mesa.Text)) and (dm.verificaMesaBalcao(ed_numero_mesa.Text) = false))   then
  begin
    //Alterar isto de mesa para reabrir
    dm.exibe_painel_erro('Mesa já foi fechada!!'+#13#10+#13#10+'Solicite reabertura da mesa no caixa.','Ok');
    ed_numero_mesa.SetFocus;
    result:=false;
    exit;

  end;

  try
    begin
      ed_numero_mesa.Text := formatfloat('0000', Strtofloat(ed_numero_mesa.Text));
    end;
  except
    begin
      showmessage('Número de mesa inválido!');
      ed_numero_mesa.Clear;
      ed_numero_mesa.SetFocus;
      Result := false;
      exit;
    end;
  end;

  try
    ed_cod_garcon.Text := FormatFloat('000', strtofloat(ed_cod_garcon.Text));
  except
    begin
      ShowMessage('Código de garçon inválido!');
      ed_cod_garcon.clear;
      ed_cod_garcon.SetFocus;
      Result := false;
      exit;
    end;
  end;

  try
    StrToFloat(ed_quantidade.Text);
  except
    begin
      ShowMessage('Quantidade Inválida!');
      ed_quantidade.Clear;
      ed_quantidade.SetFocus;
      exit;
    end;
  end;

  try
    //  ed_cod_produto.Text:=FormatFloat('00000',strtofloat(ed_cod_produto.Text));
  except
    begin
      showmessage('Código de produto inválido!');
      ed_cod_produto.SetFocus;
      ed_cod_produto.Clear;
      Result := false;
      exit;
    end;
  end;

  if not (verificaSeProdutoVendeFracionado(ed_cod_produto.Text,2) )then
  begin
    try
      strToInt(ed_quantidade.Text);
    except
     begin
       ShowMessage('O produto informado não pode ser vendido francionado!');
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
    ShowMessage('O código informado não pertence a um produto cadastrado!');
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

function TfrmLancamentosSalao.adicionar_produto_conta(mesa : string; enviar_impressao : boolean ): boolean;
var
  codigo_lancamento: string;
  observacoesProducao, saboresProducao : string;
  idMovimentoMesa : Largeint;
  codProdutoPizza : string;
  ct,qtdeProduto : integer;
  totalProporcaoPizza : Double;
  impresso : smallint;
  seqImpressao : string;
begin

 strObsProduto :='';
 frm_principal.tipoMassaPizza := '';
 if ( verificaSeProdutoEhPizza(ed_cod_produto.Text,2) = true) then
  begin
   frm_principal.obsSaborPizza:='';
   frm_principal.tipoMassaPizza := '';
   dm.tbSaboresPizzaTemp.Active:=false;
   dm.tbSaboresPizzaTemp.EmptyTable;
   Application.CreateForm(TfrmSelecaoSaboresPizza,frmSelecaoSaboresPizza);
   frmSelecaoSaboresPizza.ShowModal;
   frmSelecaoSaboresPizza.Free;

   if ( trim(frm_principal.tipoMassaPizza) ='CANCELAR') then
    begin
      ed_cod_produto.Clear;
      ed_quantidade.Clear;
      ed_cod_garcon.Clear;
      ed_numero_mesa.SetFocus;
      result := false;
      exit;
    end;


   // Selecionar o valor da pizza escolhida baseado na mais cara
//   codProdutoPizza         :=  getCodPizzaMaisCara(ed_cod_produto.Text,2,1);
//   lb_cod_produto.Caption  :=  codProdutoPizza;
//   ed_valor_produto.Text  :=   FormatFloat('###,###,##0.00',getValorProduto(codProdutoPizza,1));

   //Seleciona o valor proporcional aos sabores da pizza
   ed_valor_produto.Text  :=   FormatFloat('###,###,##0.00',getValorPizza(ed_cod_produto.Text,2,1 ));


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
     observacoesProducao:=  frm_principal.obsSaborPizza + #13#10+frm_principal.tipoMassaPizza;
  end
 else
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


     observacoesProducao := strObsProduto + frm_principal.tipoMassaPizza;


  end;




  frm_principal.tipoMassaPizza := '';


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

  if (verificaSeUsaCodGarcon = False) then
  begin
    ed_cod_garcon.text:=dm.getCodGarconMesaBalcao();
  end;



  if enviar_impressao then
   begin

    if ed_numero_mesa.Text <> dm.getCodMesaBalcao then
     begin
       seqImpressao :=guidSeqImpressao;
       impresso :=0;
     end
    else
     begin
       seqImpressao := '';
       impresso :=0;
     end;

   end
  else
    begin
       seqImpressao := '';
       impresso :=1;
    end;


  dm.qryauxiliar.Active := false;
  dm.qryauxiliar.SQL.clear;
  dm.qryauxiliar.sql.add('insert into movimento_mesa (cod_mesa,cod_garcon,cod_produto,quantidade,comanda,cod_movimento,');
  dm.qryauxiliar.sql.add('numero_caixa,cod_usuario,valor_unitario,id,observacoes,sabores,seq_impressao,impresso) values (');
  dm.qryauxiliar.sql.add('' + QuotedStr(mesa) + ',');
  dm.qryauxiliar.sql.add('' + QuotedStr(ed_cod_garcon.Text) + ',');

  dm.qryauxiliar.sql.add('' + QuotedStr(lb_cod_produto.Caption) + ',');

  dm.qryauxiliar.sql.add('' + DM.TrocaVirgPPto(ed_quantidade.text) + ',');
  dm.qryauxiliar.sql.add('' +QuotedStr('') + ',');
  dm.qryauxiliar.sql.add('' + Quotedstr(codigo_lancamento) + ',');
  dm.qryauxiliar.sql.add('' + Quotedstr(numero_caixa) + ',');
  dm.qryauxiliar.sql.add('' + Quotedstr(codigo_usuario) + ',');

   if (verificaSeProdutoCalculaQtde(ed_cod_produto.text,2) ) then
     begin
       ed_valor_produto.Text :=  FormatFloat('#0.00',getValorProduto(ed_cod_produto.Text,2));
       dm.qryauxiliar.SQL.Add('' + dm.TrocaVirgPPto(ed_valor_produto.Text)+',');
     end
   else
    dm.qryauxiliar.SQL.Add('' + dm.TrocaVirgPPto(ed_valor_produto.Text)+',');
    dm.qryauxiliar.SQL.add(IntToStr(idMovimentoMesa)+ ',');
    dm.qryauxiliar.sql.add('' + Quotedstr(observacoesProducao) + ',');
    dm.qryauxiliar.sql.add('' + Quotedstr(saboresProducao) + ',');
    dm.qryauxiliar.sql.add('' + Quotedstr(seqImpressao) + ',');
    dm.qryauxiliar.sql.add('' +Inttostr(impresso) + ')');


  try
    begin
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
     totalProporcaoPizza :=0;

     while not dm.tbSaboresPizzaTemp.Eof do
      begin
      totalProporcaoPizza := StrToFloat(ed_quantidade.Text) *  dm.tbSaboresPizzaTempproporcao.Value;
       dm.qryauxiliar.Active := false;
       dm.qryauxiliar.SQL.clear;
       dm.qryauxiliar.SQL.Add('insert into SABORES_PIZZA_MOVIMENTO_MESA (COD_MESA,ID_MOV_MESA,COD_PRODUTO,COD_SABOR,QUANTIDADE,VALOR_UNITARIO_SABOR,PROPORCAO,DESCRICAO) values (');
       dm.qryauxiliar.sql.add('' + QuotedStr(mesa) + ','); 
       dm.qryauxiliar.SQL.add(IntToStr(idMovimentoMesa)+ ',');
       dm.qryauxiliar.SQL.add(Quotedstr(dm.tbSaboresPizzaTempcodProduto.Value)+',');
       dm.qryauxiliar.SQL.add(Quotedstr(dm.tbSaboresPizzaTempcodigo.Value)+',');
       dm.qryauxiliar.sql.add('' + DM.TrocaVirgPPto(Floattostr(totalProporcaoPizza) ) + ',');
       dm.qryauxiliar.sql.add('' + DM.TrocaVirgPPto(Floattostr(dm.tbSaboresPizzaTempvalorSabor.Value) ) + ',');
       dm.qryauxiliar.SQL.add(Quotedstr(dm.tbSaboresPizzaTemptamanho.Value)+',');
       dm.qryauxiliar.SQL.add(Quotedstr(dm.tbSaboresPizzaTempdescricao.Value)+')');
       dm.qryauxiliar.ExecSQL;
       dm.tbSaboresPizzaTemp.Next;
      end;

   end;
  

  dm.tbSaboresPizzaTemp.Active:=false;
  dm.tbSaboresPizzaTemp.EmptyTable;

    {

  if enviar_impressao then
   begin

    if ed_numero_mesa.Text <> dm.getCodMesaBalcao then
     begin
      if ( (dm.verificaProdutoImprimeLocalProducao(lb_cod_produto.Caption))  and (dm.verificaProdutoImprimeMesas(lb_cod_produto.Caption ) ))   then
       begin
          dm.enviaProdutoParaFilaImpressao(ed_cod_garcon.Text,ed_cod_produto.Text , mesa, StrToFloat(ed_quantidade.Text),observacoesProducao,saboresProducao,'1',-1,IntToStr(idMovimentoMesa),'');
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
                dm.enviaProdutoParaFilaImpressao(ed_cod_garcon.Text,ed_cod_produto.Text , mesa, 1 ,observacoesProducao,saboresProducao,'1',-1,IntToStr(idMovimentoMesa),'');
                
              end;

            end
          else
           begin
             dm.enviaProdutoParaFilaImpressao(ed_cod_garcon.Text,ed_cod_produto.Text , mesa, StrToFloat(ed_quantidade.Text),observacoesProducao,saboresProducao,'1',-1,IntToStr(idMovimentoMesa),'');
           end;

       end;
     end;
     strObsProduto:='';
   end;
      }


  if dm.transacao.Active = false then dm.transacao.Active := true;
  dm.transacao.Commit;

 resumido := false;
  busca_movimento_da_mesa;

  ed_cod_produto.Clear;
  ed_valor_produto.clear;
  ed_descricao_produto.clear;
  ed_quantidade.clear;

  if (StrToInt(dm.LeIni(2, 'CAIXA', 'voltar_cursor')) = 2) then
    ed_numero_mesa.SetFocus
  else
    ed_cod_produto.SetFocus;

  //  foto.Picture.LoadFromFile(dm.LeIni(2,'IMAGENS','caixa_aguardando'));
end;

procedure TfrmLancamentosSalao.l(Sender: TObject;
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

procedure TfrmLancamentosSalao.FormActivate(Sender: TObject);
var
pn1 : TPanel;
begin
xB20002001.Caption:= 'Receber conta';
  Self.top:=0;
  self.Left :=0;

  
 MakeRounded(Panel1);
 MakeRounded(Panel3);
// MakeRounded(Panel4);
 MakeRounded(pn_mesa);
 MakeRounded(pn_produto);
 MakeRounded(pnQtde);
 MakeRounded(pn_garcon);
 MakeRounded(pnBotesProdutos);
 MakeRounded(pnTeclado);
 MakeRounded(pnMapaMesas);
 MakeRounded(pnFuncoesMesa);


// MakeRounded(pnTouch);
 btConfirmaLancamentos.Caption := 'Confirma'+#13#10+'lançamentos';
 btEstornaProduto.Caption :=  'Cancela '#13#10'produto';
 btResumir.Caption := 'R'#13#10+'E'#13#10+'S'#13#10+'U'#13#10+'M'#13#10+'E';

 // MakeRounded(ed_numero_mesa);

   //Self.Width:=586;
  //Self.Height:=800;
  //self.Left:=1;
  resumido := false;
  muda_acao(1);


//  dxStatusBar1.Panels[1].Text:='Data do Sistema: '+FormatDateTime('DD/MM/YY',data_do_sistema);
//  dxStatusBar1.Panels[2].Text:=nome_usuario;
  mudaCaptionsBotoes();
  setCaption('Caixa');
  frmLancamentosSalao.Top := 0;
  if (StrToInt(dm.LeIni(2, 'CAIXA', 'comanda_numerada')) = 0) then
  begin
//    ed_numero_mesa.Text:='';
  end;


  if trim(ed_numero_mesa.Text) <> '' then
  begin
    busca_movimento_da_mesa;
    ed_cod_produto.SetFocus;
    if tipo_caixa_atual = 2 then
    ed_numero_mesa.SetFocus;
  end
  else
   BEGIN
    alternarTipoCaixa(voltarParaCaixa);
   end;


  if (verificaSeUsaCodGarcon = False) then
    begin
      ed_cod_garcon.text:=dm.getCodGarconMesaBalcao();
//      ed_cod_garcon.Visible:=false;

        lbGarcon.Visible := false;
        ed_cod_garcon.Visible := false;


//      pn_garcon.Visible:=FALSE;
//      pn_produto.Left:=80;
  //    pn_produto.Width:=929;
    end;



end;

procedure TfrmLancamentosSalao.ed_numero_mesaEnter(Sender: TObject);
begin
  if sender is Tedit and (((sender as Tedit).Name = 'ed_numero_mesa')) then
  begin

    if (dm.verificaMesaBalcao(ed_numero_mesa.Text) = false ) then
    begin
      if guidSeqImpressao <> '' then
       begin
         dm.imprimePedidoProducao(guidSeqImpressao);
         guidSeqImpressao:='';
       end;
    end;

    ed_numero_mesa.Clear;
    ed_cod_garcon.Clear;
    pnProdutosTouch.Visible := false;
    pnTeclado.Visible := true;
    pnFuncoesMesa.Visible := true;
    pnTeclado.Top := 193;
    pnTeclado.Left := 442;
    voltar_mesa;
    mostraMapaMesas();
    pnInfoMesas.Visible := true;

{

    Application.CreateForm(TfrmSenhaGarcon,frmSenhaGarcon);
    frmSenhaGarcon.Top :=    frmLancamentosSalao.top  + 100;
    frmSenhaGarcon.left :=   frmLancamentosSalao.Left  + 400;
    frmSenhaGarcon.showmodal;
    frmSenhaGarcon.free;

}


    // Parametrizar tudo isso
    IF (StrToInt(dm.LeIni(2,'SALAO','usaLeitorBarrasCartao') ) = 1 ) then
     begin
      ed_numero_mesa.ReadOnly := true;
      ed_cod_garcon.ReadOnly := true;
      Application.CreateForm(TfrmLeCartaoLancamento, frmLeCartaoLancamento);
      frmLeCartaoLancamento.ShowModal;
      frmLeCartaoLancamento.Free;
      ed_numero_mesa.Text := string_auxiliar;
      ed_cod_produto.SetFocus;
      ed_cod_garcon.Text := dm.getCodGarconMesaBalcao;
     end;




  end;


  if sender is Tedit and (((sender as Tedit).Name = 'ed_cod_garcon')) then
  begin

    if (trim(ed_numero_mesa.text) = '') then
     begin
       ShowMessage('Número de mesa inválido!');
       ed_numero_mesa.SetFocus;
       exit;
     end;

    ed_cod_garcon.SelectAll;

  end;


  if sender is Tedit and (((sender as Tedit).Name = 'ed_cod_produto')) then
  begin

    if (trim(ed_numero_mesa.text) = '') then
     begin
       ShowMessage('Número de mesa inválido!');
       ed_numero_mesa.SetFocus;
       exit;
     end;

    ed_cod_produto.SelectAll;
    pnMapaMesas.Visible := false;
    pnProdutosMesa.Visible := true;    



    if (StrToInt(dm.LeIni(1,'SALAO','painelDefault')) = 1) then
     begin
       pnTeclado.Visible := true;
     end
    else
     begin


      pnProdutosTouch.Visible := true;
      pgGrupos.ActivePageIndex:=0;
      pgProdutos.ActivePageIndex:=0;
      pnTeclado.Visible := false;
      btgp1.Click;
      ed_quantidade.Text := '1';
     end;

  end;


  if sender is TDBGrid then
  begin
    (sender as TDBGrid).Color := cor_foco_edit;
  end;

end;

procedure TfrmLancamentosSalao.B20002002Click(Sender: TObject);
var
  linha: integer;
  valor_total: double;
begin

  if (dm.verificaPermissaoAcao((sender as TBitBtn).Name) = true) then
    fecharConta();

end;



procedure TfrmLancamentosSalao.fecharConta();
begin
 if verifica_movimento then
  else
   begin
    dm.exibe_painel_erro('Não há produtos registrados!','Ok');
    exit;
   end;
  Application.CreateForm(Tfrm_encerramento, frm_encerramento);
  frm_encerramento.lb_mesa.Caption := ed_numero_mesa.Text;
  frm_encerramento.ShowModal;
  frm_encerramento.free;

  voltar_mesa;
  busca_movimento_da_mesa;
//  recriaMemo;
  muda_acao(1);


end;

procedure TfrmLancamentosSalao.DBGrid1DrawDataCell(Sender: TObject; const Rect: TRect; Field: TField; State: TGridDrawState);
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

procedure TfrmLancamentosSalao.timerInativacaoPedidosTimer(Sender: TObject);
begin
 if (dm.verificaMesaBalcao(ed_numero_mesa.Text) = false ) then
 begin
   dm.ImprimeFilaDeImpressao(false,'',1); 
 end;

end;

function TfrmLancamentosSalao.pesquisa_produto: boolean;
begin
  dm.qry_consultas.Active := false;
  dm.qry_consultas.SQL.Clear;
  dm.qry_consultas.SQL.add('select * from produtos ');
  dm.qry_consultas.Active := true;

  if dm.qry_consultas.IsEmpty then
  begin
    ShowMessage('Não existem produtos cadastrados!');
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

procedure TfrmLancamentosSalao.bt_pesq_produtoClick(Sender: TObject);
begin
  pesquisa_produto;
end;


function TfrmLancamentosSalao.gravar_tx_serv: boolean;
var
  total_vendas_garcon: double;
  percentual_vendido: double;
begin
  percentual_vendido := 0;
  tx_serv := 0;
  dm.qryauxiliar3.Active := false;
  dm.qryauxiliar3.sql.clear;
  dm.qryauxiliar3.sql.add('select * from garcons order by cod_garcon');
  dm.qryauxiliar3.active := true;
  dm.qryauxiliar3.first;
  while not dm.qryauxiliar3.eof do
  begin
    total_vendas_garcon := 0;
    tx_serv := 0;
    dm.qryauxiliar2.Active := false;
    dm.qryauxiliar2.sql.Clear;
    dm.qryauxiliar2.SQL.add('select movimento_mesa.cod_mesa,movimento_mesa.cod_movimento,movimento_mesa.cod_produto,produtos.cod_produto,produtos.descricao,movimento_mesa.quantidade,produtos.valor_unitario,movimento_mesa.comanda,movimento_mesa.cod_garcon');
    dm.qryauxiliar2.sql.add('  from movimento_mesa,produtos where ');
    dm.qryauxiliar2.sql.add('  produtos.cod_produto=movimento_mesa.cod_produto and movimento_mesa.cod_mesa=' + QuotedStr(ed_numero_mesa.Text) + '  and movimento_mesa.cod_garcon=' + QuotedStr(dm.qryauxiliar3.fieldbyname('cod_garcon').value));
    dm.qryauxiliar2.Active := true;
    dm.qryauxiliar2.first;
    while not dm.qryauxiliar2.eof do
    begin
      total_vendas_garcon := (dm.qryauxiliar2.fieldbyname('quantidade').value * dm.qryauxiliar2.fieldbyname('valor_unitario').value) + total_vendas_garcon;
      dm.qryauxiliar2.Next;
    end;
    percentual_vendido := total_vendas_garcon * 100;
    percentual_vendido := percentual_vendido / ed_valor_bruto.Value;
    tx_serv := ed_total_tx_serv.Value * percentual_vendido;
    tx_serv := tx_serv / 100;

    if percentual_vendido > 0 then
    begin
      dm.qryauxiliar.Active := false;
      dm.qryauxiliar.SQL.clear;
      dm.qryauxiliar.SQL.add('insert into taxa_servico (cod_garcon,data_venda,total_venda,total_vendido,valor_taxa) values (');
         dm.qryauxiliar.sql.add('' + QuotedStr(dm.qryauxiliar3.fieldbyname('cod_garcon').value) + ',');
      dm.qryauxiliar.sql.add('' + Quotedstr(FormatDateTime('DD.MM.YYY', data_do_sistema)) + ',');
      dm.qryauxiliar.sql.add('' + dm.TrocaVirgPPto(Floattostr(ed_valor_bruto.value)) + ',');
      dm.qryauxiliar.sql.add('' + dm.TrocaVirgPPto(Floattostr(total_vendas_garcon)) + ',');
      dm.qryauxiliar.sql.add('' + dm.TrocaVirgPPto(Floattostr(tx_serv)) + ')');
      try
        begin
          dm.qryauxiliar.ExecSQL;
        end;
      except
        begin
          ShowMessage('Ocorreu um erro no sistema!  Um log de erros foi criado no formato DATA+HORA na pasta logs do Sistema. Abra o arquivo e envio por fax ou email para a Real Systems');
          dm.cria_log_de_erros(dm.qryauxiliar.sql, 'Módulo de caixa', 'Erro ao gravar taxa de serviço', codigo_usuario);
          Result := false;
          exit;
        end;
      end;

    end;

    dm.qryauxiliar3.Next;
  end;
  Result := true;

end;

procedure TfrmLancamentosSalao.B20002001KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin

  if (( key = vk_escape) and (dm.verificaMesaBalcao(ed_numero_mesa.Text) = false)) then
  begin
    dm.qry_movimento_mesa.Active := false;
    ed_cod_produto.clear;
    ed_descricao_produto.Clear;
    ed_valor_produto.Clear;
    ed_quantidade.clear;
    ed_cod_garcon.clear;
    ed_total_conta.Text := '0,00';
    ed_numero_mesa.Clear;
    ed_numero_mesa.SetFocus;
    voltar_mesa;
  end
 else
    voltar_mesa;
end;                      

procedure TfrmLancamentosSalao.pesquisaGarcons();
begin
  dm.qry_consultas.Active := false;
  dm.qry_consultas.SQL.Clear;
  dm.qry_consultas.sql.add('select * from garcons order by apelido');
  dm.qry_consultas.Active := true;
  if dm.qry_consultas.IsEmpty then
  begin
    ShowMessage('Não existem garçons cadastrados!');
    exit;
  end
  else
  begin
    Application.CreateForm(Tfrm_cs_garcons, frm_cs_garcons);
    frm_cs_garcons.ShowModal;
    frm_cs_garcons.free;
    ed_cod_garcon.Text := string_auxiliar;

  end;

end;

procedure TfrmLancamentosSalao.B20002001Click(Sender: TObject);
begin

//  if( trim(ed_numero_mesa.Text) = dm.getCodMesaBalcao ) then exit;

  if (dm.verificaPermissaoAcao((sender as TBitBtn).Name) = true) then
   begin
    if ( trim(ed_numero_mesa.Text) = '' ) then
     begin
       emitirExtrato(true);
     end
    else
    begin
      if (dm.verificaExtratosEmitidos(ed_numero_mesa.text) = true) then
       begin
        string_auxiliar := 'N';
        Application.CreateForm(Tfrm_confirma_extrato, frm_confirma_extrato);
        frm_confirma_extrato.setTitulo('Confirmação de extrato');
        frm_confirma_extrato.setMensagem('Já foi emitido um extrato da mesa informada!! '+#13#10+#13#10+' Deseja continuar ?',12);
        frm_confirma_extrato.ShowModal;
        frm_confirma_extrato.free;
        if string_auxiliar = 'S' then
          emitirExtrato(false);

        string_auxiliar := '';
       end
      else
       emitirExtrato(false);
    end;

   end;

//  voltar_mesa;
  busca_movimento_da_mesa;
  if ( dm.verificaMesaBalcao(ed_numero_mesa.Text) = false ) then
   begin
    ed_cod_garcon.Clear;
    ed_numero_mesa.clear;
    ed_numero_mesa.SetFocus;
   end; 
end;

procedure TfrmLancamentosSalao.emitirExtrato(variasMesas : boolean);
begin

  if (variasMesas = true) then
   begin
    Application.CreateForm(Tfrm_extrato, frm_extrato);
    frm_extrato.pn_fiscal.Visible := false;
    //frm_extrato.lb_mesa.Caption := ed_numero_mesa.Text;
    frm_extrato.showmodal;
    frm_extrato.free;
   end
  else
   begin
    if verifica_movimento then
     begin
       Application.CreateForm(Tfrm_extrato, frm_extrato);
       frm_extrato.pn_fiscal.Visible := true;
       frm_extrato.lb_mesa.Caption := ed_numero_mesa.Text;
       frm_extrato.showmodal;
       frm_extrato.free;
     end;
   end;




  busca_movimento_da_mesa;
  voltar_mesa;

end;

procedure TfrmLancamentosSalao.DBGrid1CellClick(Column: TColumn);
begin

  D30001011.SetFocus;

end;

procedure TfrmLancamentosSalao.B20002006Click(Sender: TObject);
var
 emiteExtratoAntes : integer;
begin

  if trim(ed_numero_mesa.Text) = '' then
   begin
     Showmessage('Número de mesa inválido');
     ed_numero_mesa.SetFocus;
     ed_numero_mesa.clear;
   end;

  try
    ed_numero_mesa.Text := FormatFloat('0000',StrToFloat(ed_numero_mesa.Text));
  except
   begin
     Showmessage('Número de mesa inválido');
     ed_numero_mesa.SetFocus;
     ed_numero_mesa.clear;
     Exit;

   end;
  end;

  If (verificaMesaTemExtrato(ed_numero_mesa.text) = true) then
   begin
     dm.exibe_painel_erro('Mesa encontra-se fechada. Reabra a mesa para prosseguir com a transferência.','tecle enter para continuar...');
     exit;
   end;




   if( trim(ed_numero_mesa.Text) = dm.getCodMesaBalcao ) then exit;
  if (dm.verificaPermissaoAcao((sender as TBitBtn).Name) = true) then
        transferirMesa;


end;

procedure TfrmLancamentosSalao.transferirMesa();
begin
//  if verifica_movimento then
//  else
//    exit;
  Application.CreateForm(Tfrm_transferir_mesa, frm_transferir_mesa);
  frm_transferir_mesa.ShowModal;
  frm_transferir_mesa.Free;
  busca_movimento_da_mesa;

  dm.qry_movimento_mesa.Active := false;
  ed_cod_produto.clear;
  ed_descricao_produto.Clear;
  ed_valor_produto.Clear;
  ed_quantidade.clear;
  ed_cod_garcon.clear;
  //      ed_nome_garcon.Clear;
  //ed_total_taxa.Text:='0,00';
  ed_numero_mesa.Clear;
  ed_numero_mesa.SetFocus;
  voltar_mesa;

end;

procedure TfrmLancamentosSalao.B20002004Click(Sender: TObject);
begin
  if( trim(ed_numero_mesa.Text) = dm.getCodMesaBalcao ) then exit;
  if (dm.verificaPermissaoAcao((sender as TBitBtn).Name) = true) then
    if (resumido = false) then
     begin
      if (dm.qry_movimento_mesa.FieldByName('cancelado').Value = 0) then
       begin
         transferirItem()
       end
      else
        begin
          MessageDlg('Não é possível transferir um produto que já foi cancelado!', mtError, [mbOK], 0);
        end;
     end
    else
    begin
      showmessage('Selecione o modo de visualização analítico e marque o lançamento a ser trasnferido!');
    end;

end;

procedure TfrmLancamentosSalao.transferirItem();
begin

  if verifica_movimento then
  else
    exit;

  Application.Createform(Tfrm_transferir_item, frm_transferir_item);
  frm_transferir_item.lbDescricaoProduto.Caption:=dm.qry_movimento_mesa.FieldByName('descricao').Value;
  frm_transferir_item.lbQtde.Caption := FormatFloat('#0.000',dm.qry_movimento_mesa.FieldByName('quantidade').Value);

  frm_transferir_item.ShowModal;
  frm_transferir_item.free;
  busca_movimento_da_mesa;
  voltar_mesa;
  busca_movimento_da_mesa();
  ed_numero_mesa.SetFocus();
  D30001011.SetFocus;
end;

procedure TfrmLancamentosSalao.B20002007Click(Sender: TObject);
begin

  if( trim(ed_numero_mesa.Text) = dm.getCodMesaBalcao ) then exit;
  if (dm.verificaPermissaoAcao((sender as TBitBtn).Name) = true) then
  begin
     if verifica_movimento then
    else
      exit;
    Application.CreateForm(Tfrm_recebimento_parcial, frm_recebimento_parcial);
    frm_recebimento_parcial.lb_mesa.Caption := ed_numero_mesa.Text;
    frm_recebimento_parcial.showmodal;
    frm_recebimento_parcial.Free;
    busca_movimento_da_mesa;
    voltar_mesa;
  end;

end;

function TfrmLancamentosSalao.verifica_movimento: boolean;
begin
  try
    begin
      ed_numero_mesa.Text := FormatFloat('0000', StrToFloat(ed_numero_mesa.Text));
    end;
  except
    showmessage('Número de mesa inválido!');
    ed_numero_mesa.Clear;
    ed_numero_mesa.SetFocus;
    result := false;
    exit;
  end;


  // Tenho que alterar esta parte para deixar as versões compatíveis

  if dm.qry_movimento_mesa.IsEmpty then
  begin
    ShowMessage('Mesa sem movimento');
    Result := false;
    exit;
  end;

  Result := true;
end;

procedure TfrmLancamentosSalao.B300010040Click(Sender: TObject);
begin
  if verifica_movimento then
  begin


   if dm.painelDePergunta(#13#10+'  Confirma cancelamento do produto ?'+#13#10+#13#10,22) then
    begin
      dm.qrymax.Active := false;
      dm.qrymax.SQL.Clear;
      dm.qrymax.SQL.Add('delete from movimento_mesa where cod_mesa=' + quotedstr(ed_numero_mesa.Text) + ' and cod_movimento=' + Quotedstr(dm.qry_movimento_mesa.fieldbyname('cod_movimento').value));
      dm.qrymax.ExecSQL;
      if dm.transacao.Active = false then dm.transacao.Active := true;
      dm.transacao.Commit;
      busca_movimento_da_mesa;
    end
  end
  else
    exit;

end;

procedure TfrmLancamentosSalao.verificar_permissoes;
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

procedure TfrmLancamentosSalao.voltar_mesa;
begin
//  alternarTipoCaixa(tipo ;
  resumido := false;
  ed_cod_produto.Clear;
  ed_descricao_produto.clear;
  ed_quantidade.Clear;
//  ed_numero_mesa.Clear;
//ed_cod_garcon.Clear;
  if (dm.verificaMesaBalcao(ed_numero_mesa.Text) = false) then
  begin
    ed_numero_mesa.SetFocus;
  end;
  //  foto.Picture.LoadFromFile(dm.LeIni(2,'IMAGENS','caixa_aguardando'));
  dm.qry_movimento_mesa.Active := false;
  ed_valor_bruto.Value := 0;
  ed_total_tx_serv.Value := 0;
  ed_total_conta.Value := 0;



end;

procedure TfrmLancamentosSalao.B20002014Click(Sender: TObject);
begin
  if (dm.verificaPermissaoAcao((sender as TBitBtn).Name) = true) then
  begin

  end;

  // voltar_mesa;
end;

procedure TfrmLancamentosSalao.D30001011Exit(Sender: TObject);
begin
  if sender is TDBGrid then
  begin
    (sender as TDBGrid).Color := clWhite;
  end;

end;

procedure TfrmLancamentosSalao.apagaItemMovimento(qtde: double; codMotivo : string; descricaoMotivo: string; obs : string);
var
  result: string;
  qtd_restante: double;
  total_registros: integer;
  q : TIBQuery;
  impCancelamentoLocalProducao : boolean;
begin

  q := TIBQuery.Create(self);
  q.Database := dm.dbrestaurante;
  q.Transaction := dm.transacao;
  q.Active:=false;
  q.SQL.clear;




  if verifica_movimento then
  begin
   if dm.painelDePergunta(#13#10+'  Confirma cancelamento do produto ?'+#13#10+#13#10,22) then
    begin

      if resumido = false  then
       begin
          if dm.qry_movimento_mesa.FieldByName('impresso').Value = 0 then
            begin
             impCancelamentoLocalProducao:=false
            end
          else
            begin
             impCancelamentoLocalProducao:=true;
             dm.gravarEstornoDeItem(ed_numero_mesa.Text,codMotivo,descricaoMotivo, dm.qry_movimento_mesa.fieldbyname('cod_barras').value,dm.qry_movimento_mesa.fieldbyname('descricao').value,qtde,(dm.qry_movimento_mesa.fieldbyname('valor_unitario').value),obs,impCancelamentoLocalProducao,'','',
             dm.qry_movimento_mesa.fieldbyname('ID').value );
            end;
       end;

   if (resumido = false ) then // Faz a deleção/atualização de quantidade do ítem no modo analítico
       begin
          dm.qrymax.Active := false;
          dm.qrymax.SQL.Clear;
          if ((dm.qry_movimento_mesa.fieldbyname('quantidade').value = 1) or ((dm.qry_movimento_mesa.fieldbyname('quantidade').value - qtde) = 0)) then
           begin
             if (dm.qry_movimento_mesa.fieldbyname('impresso').value = 1) then
              begin
                dm.qrymax.sql.add('update movimento_mesa set cancelado=1,obs_paf='+Quotedstr('   CANCELADO   ')+'  where cod_mesa=' + quotedstr(ed_numero_mesa.Text) + ' and cod_movimento=' + Quotedstr(dm.qry_movimento_mesa.fieldbyname('cod_movimento').value));
                q.Active:=false;
                q.sql.clear;
              end
             else
              begin
                dm.qrymax.sql.add('delete from movimento_mesa where cod_mesa=' + quotedstr(ed_numero_mesa.Text) + ' and cod_movimento=' + Quotedstr(dm.qry_movimento_mesa.fieldbyname('cod_movimento').value));
                q.Active:=false;
                q.sql.clear;

              end;

             q.SQL.add('delete from fila_de_impressao where id_movimento_mesa='+IntTostr(dm.qry_movimento_mesa.fieldbyname('id').value) );
             q.ExecSQL;
           end
          else
            begin
             // comecei a alteração por aqui

             qtd_restante := dm.qry_movimento_mesa.fieldbyname('quantidade').value - qtde;
             if (qtd_restante = 0) then
              begin
                dm.qrymax.Active := false;
                dm.qrymax.sql.Clear;
                dm.qrymax.sql.add('update movimento_mesa set cancelado=1,obs_paf='+Quotedstr('   CANCELADO   ')+'  where cod_mesa=' + quotedstr(ed_numero_mesa.Text) + ' and cod_movimento=' + Quotedstr(dm.qry_movimento_mesa.fieldbyname('cod_movimento').value));
                dm.qrymax.ExecSQL;
                q.Active:=false;
                q.sql.clear;
                q.SQL.add('delete from fila_de_impressao where id_movimento_mesa='+IntTostr(dm.qry_movimento_mesa.fieldbyname('id').value) );
                q.ExecSQL;
              end
             else
               begin
                 dm.qrymax.Active := false;
                 dm.qrymax.SQL.clear;
                 dm.qrymax.SQL.Add('select mv.cod_mesa,mv.cod_movimento,');
                 dm.qrymax.sql.Add(' mv.cod_produto,pr.cod_produto,pr.cod_barras,');
                 dm.qrymax.sql.Add('mv.quantidade as quantidade,mv.valor_unitario,');
                 dm.qrymax.sql.Add('mv.comanda,');
                 dm.qrymax.sql.Add('mv.cod_garcon ');
                 dm.qrymax.SQL.Add('  from movimento_mesa mv ');
                 dm.qrymax.sql.Add('  inner join produtos pr on (pr.cod_produto=mv.cod_produto)');
                 dm.qrymax.sql.add('  inner join garcons g on (g.cod_garcon=mv.cod_garcon) ');
                 dm.qrymax.sql.add('  where mv.cod_mesa='+Quotedstr(ed_numero_mesa.Text)+' and mv.cod_produto='+Quotedstr(dm.qry_movimento_mesa.fieldbyname('cod_produto').value)+' order by mv.hora_lancamento');
                 dm.qrymax.Active:=true;
                 ed_cod_garcon.Text     := dm.qrymax.fieldbyname('cod_garcon').value;
                 ed_cod_produto.Text    := dm.qrymax.fieldbyname('cod_barras').value;
                 ed_valor_produto.text  := FormatFloat('#0.00',dm.qrymax.fieldbyname('valor_unitario').value);
                 ed_quantidade.Text     := FormatFloat('#0.00',qtd_restante);
                 lb_cod_produto.Caption := dm.qrymax.fieldbyname('cod_produto').value;
                 dm.qrymax.Active := false;
                 dm.qrymax.sql.Clear;
                 dm.qrymax.sql.add('update movimento_mesa set cancelado=1,obs_paf='+Quotedstr('   CANCELADO   ')+'  where cod_mesa=' + quotedstr(ed_numero_mesa.Text) + ' and cod_movimento=' + Quotedstr(dm.qry_movimento_mesa.fieldbyname('cod_movimento').value));
                 dm.qrymax.ExecSQL;
                 adicionar_produto_conta(ed_numero_mesa.Text, false);
               end;
            end;
             // terminei por aqui

          dm.qrymax.ExecSQL;
          if dm.transacao.Active = false then dm.transacao.Active := true;
            dm.transacao.Commit;
            busca_movimento_da_mesa;
       end
   else
      begin
        qtd_restante := dm.qry_movimento_mesa.fieldbyname('quantidade').value - qtde;
        if (qtd_restante = 0) then
          begin
           dm.qrymax.Active := false;
           dm.qrymax.sql.Clear;
           dm.qrymax.sql.add('delete from movimento_mesa where cod_mesa=' + QuotedStr(ed_numero_mesa.text) + ' and cod_produto='+Quotedstr(dm.qry_movimento_mesa.fieldbyname('cod_produto').value));
           dm.qrymax.ExecSQL;

           q.Active:=false;
           q.sql.clear;
           q.SQL.add('delete from fila_de_impressao where id_movimento_mesa='+IntTostr(dm.qry_movimento_mesa.fieldbyname('id').value) );
           q.ExecSQL;
          end
        else
          begin
           dm.qrymax.Active := false;
           dm.qrymax.SQL.clear;
           dm.qrymax.SQL.Add('select mv.cod_mesa,mv.cod_movimento,');
           dm.qrymax.sql.Add(' mv.cod_produto,pr.cod_produto,pr.cod_barras,');
           dm.qrymax.sql.Add('mv.quantidade as quantidade,mv.valor_unitario,');
           dm.qrymax.sql.Add('mv.comanda,');
           dm.qrymax.sql.Add('mv.cod_garcon ');
           dm.qrymax.SQL.Add('  from movimento_mesa mv ');
           dm.qrymax.sql.Add('  inner join produtos pr on (pr.cod_produto=mv.cod_produto)');
           dm.qrymax.sql.add('  inner join garcons g on (g.cod_garcon=mv.cod_garcon) ');
           dm.qrymax.sql.add('  where mv.cod_mesa='+Quotedstr(ed_numero_mesa.Text)+' and mv.cod_produto='+Quotedstr(dm.qry_movimento_mesa.fieldbyname('cod_produto').value)+' order by mv.hora_lancamento');
           dm.qrymax.Active:=true;


           ed_cod_garcon.Text     := dm.qrymax.fieldbyname('cod_garcon').value;
           ed_cod_produto.Text    := dm.qrymax.fieldbyname('cod_barras').value;
           ed_valor_produto.text  := FormatFloat('#0.00',dm.qrymax.fieldbyname('valor_unitario').value);

           ed_quantidade.Text     := FormatFloat('#0.00',qtd_restante);
           lb_cod_produto.Caption := dm.qrymax.fieldbyname('cod_produto').value;

           dm.qrymax.Active := false;
           dm.qrymax.sql.Clear;
           dm.qrymax.sql.add('delete from movimento_mesa where cod_mesa=' + QuotedStr(ed_numero_mesa.text) + ' and cod_produto=' +Quotedstr(dm.qry_movimento_mesa.fieldbyname('cod_produto').value));
           dm.qrymax.ExecSQL;

              adicionar_produto_conta(ed_numero_mesa.Text, false);
          end;

           dm.transacao.Commit;
      end
    end;
  end

  else
    exit;
  busca_movimento_da_mesa();
  D30001011.SetFocus;

  q.Active:=false;
  FreeAndNil(q);
end;

procedure TfrmLancamentosSalao.D30001011MouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  if ((dm.qry_movimento_mesa.Active) and (dm.qry_movimento_mesa.IsEmpty = false) and (resumido = false )) then
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

end;


procedure TfrmLancamentosSalao.D30001011DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);


var
holdColor: TColor;
ss : string;
begin
//ShowScrollBar(D30001011.Handle,SB_VERT,False);
//ShowScrollBar(D30001011.Handle,SB_HORZ,False);

holdColor := D30001011.Canvas.Brush.Color;
 if resumido = false then
 begin

 end;

  //OPção para dbgrid zebrado
    if State = [] then
     begin
       if dm.qry_movimento_mesa.RecNo mod 2 = 1 then
        D30001011.Canvas.Brush.Color := clmoneygreen
       else
         D30001011.Canvas.Brush.Color := clWhite;
      end;
      D30001011.DefaultDrawColumnCell(Rect, DataCol, Column, State);



  if Column.FieldName = 'TOTAL' then
   begin
     D30001011.DefaultDrawColumnCell(Rect, DataCol, Column, State);
   end;

  if Column.FieldName = 'OBS_PAF' then
   begin
     if ( trim(copy(trim(Column.Field.AsString),0,7)) = 'TRANSF.' ) then
      begin
        D30001011.Canvas.Brush.Color := clGreen;
        D30001011.Canvas.Font.Color := clWhite;
        D30001011.DefaultDrawColumnCell(Rect, DataCol, Column, State);
      end
     else
       begin
         if ( trim(copy(trim(Column.Field.AsString),0,7)) = 'CANCELA' ) then
          begin
            D30001011.Canvas.Brush.Color := clRed;
            D30001011.Canvas.Font.Color := clWhite;
            D30001011.DefaultDrawColumnCell(Rect, DataCol, Column, State);
          end
      end;
   end;



  if Column.FieldName = 'DESCRICAO' then
   begin
     if resumido = false then
      begin
         if (dm.qry_movimento_mesa.FieldByName('impresso').Value = 0) then
          begin
            D30001011.Canvas.Brush.Color := clRed;
            D30001011.Canvas.Font.Color := clWhite;
            D30001011.DefaultDrawColumnCell(Rect, DataCol, Column, State);
          end
      end
     else
       begin

      end;
   end;




  if Column.FieldName = 'COD_BARRAS' then
   begin
     if resumido = false  then
      begin
        if (dm.qry_movimento_mesa.FieldByName('impresso').Value = 0) then
         begin
           D30001011.Canvas.Brush.Color := clRed;
           D30001011.Canvas.Font.Color := clWhite;
           D30001011.DefaultDrawColumnCell(Rect, DataCol, Column, State);
         end
      end
     else
       begin

      end;
   end;

  if Column.FieldName = 'QUANTIDADE' then
   begin
     if resumido = false then
      begin
         if (dm.qry_movimento_mesa.FieldByName('impresso').Value = 0) then
          begin
            D30001011.Canvas.Brush.Color := clRed;
            D30001011.Canvas.Font.Color := clWhite;
            D30001011.DefaultDrawColumnCell(Rect, DataCol, Column, State);
          end
      end


     else
       begin

      end;
   end;

  if Column.FieldName = 'VALOR_UNITARIO' then
   begin
     if resumido = false then
      begin
         if (dm.qry_movimento_mesa.FieldByName('impresso').Value = 0) then
          begin
            D30001011.Canvas.Brush.Color := clRed;
            D30001011.Canvas.Font.Color := clWhite;
            D30001011.DefaultDrawColumnCell(Rect, DataCol, Column, State);
          end
      end
     else
       begin

      end;
   end;



if gdSelected in State then
with (Sender as TDBGrid).Canvas do
begin
 if Column.FieldName = 'descricao' then
   begin
     Brush.Color:=clYellow; //aqui é definida a cor do fundo
     TDbGrid(Sender).Canvas.font.Color:= clBlack;
      FillRect(Rect);
   end;
end;

TDbGrid(Sender).DefaultDrawDataCell(Rect, TDbGrid(Sender).columns[datacol].field, State);

end;


procedure TfrmLancamentosSalao.B30001007Click(Sender: TObject);
begin
//  Application.CreateForm(TfrmDescontoItem,frmDescontoItem);
//  frmDescontoItem.showmodal;
//  frmDescontoItem.free;
//  busca_movimento_da_mesa();

{
  if( trim(ed_numero_mesa.Text) = dm.getCodMesaBalcao ) then exit;
  if (dm.verificaPermissaoAcao((sender as TBitBtn).Name) = true) then
  begin
    if MessageDlg('Confirma cancelamento do último cupom fiscal ?', mtconfirmation, [mbYes, mbNo], 0) = mryes then
    begin
      dm.cancela_cupom_fiscal(marca_impressora_fiscal, modelo_impressora_fiscal);
    end;
  end;
  }

end;


procedure TfrmLancamentosSalao.B30001001KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if key = vk_escape then
    ed_numero_mesa.SetFocus;
end;


procedure TfrmLancamentosSalao.B20001002Click(Sender: TObject);
begin
{
 if (dm.verificaPermissaoAcao((sender as TBitBtn).Name) = true) then
 begin
  if tipo_caixa_atual = 1 then
    alternarTipoCaixa(2)
  else
   alternarTipoCaixa(1)
 }
 
{  if (dm.verificaPermissaoAcao((sender as TBitBtn).Name) = true) then
  begin
    Application.CreateForm(Tfrm_abertura_dia, frm_abertura_dia);
    frm_abertura_dia.tipo_suprimento := 1;
    frm_abertura_dia.ShowModal;
    frm_abertura_dia.free;
  end;
 }
end;


procedure TfrmLancamentosSalao.FormKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin





  if (Key = 145) then
  begin
      Perform(Wm_NextDlgCtl,1,0)
  end;


  if (Shift = [ssCtrl]) and (Key = 65) then
  begin
    if resumido = false then
      resumido := true
    else
      resumido :=  false;
  end;

{  if (Shift = [ssCtrl]) and (Key =  key_r ) then
  begin
    dm.apagaExtratosEmitidos(ed_numero_mesa.text);
    showmessage('Mesa Reaberta!');
  end;
 }

  if (Shift = [ssCtrl]) and (Key = 80) then
  begin
  END;

  if (Shift = [ssCtrl]) and (Key = 71) then
  begin
    dm.AbreGaveta(1,1);
  end;


  if (Shift = [ssCtrl]) and (Key = 77) then
  begin
//    btMapaMesas.Click;
  end;


  if (Shift = [ssCtrl]) and (Key = 79) then
  begin

          Application.CreateForm(Tfrm_obs_lancamento_caixa, frm_obs_lancamento_caixa);
           frm_obs_lancamento_caixa.ShowModal;
           frm_obs_lancamento_caixa.free;
  END;


  if (key = 122) then
   begin
     Application.Terminate;

   end;


 if (Shift = [ssCtrl]) and (Key = 83) then
  begin
//     btOpCaixa.Click;
  END;


  
  if (key = 123) then
   begin
     Application.CreateForm(Tfrm_obs_lancamento_caixa, frm_obs_lancamento_caixa);
     frm_obs_lancamento_caixa.ShowModal;
     frm_obs_lancamento_caixa.free;
   end;


if (Shift = [ssCtrl]) and (Key = 67) then
  begin
//    btCalculadora.Click;
  END;


if (Shift = [ssCtrl]) and (Key = 68) then
  begin
//    B20001003.Click;
  END;






end;

procedure TfrmLancamentosSalao.efetuar_lancamento;
begin
  if dm.transacao.Active = false then dm.transacao.Active := true;
  dm.transacao.Commit;



   if verifica_validade_lancamento then
  begin
    if ( (dm.verificaseExisteMovimentoMesa(ed_numero_mesa.Text) = false) and (dm.verificaSeAMesaFoiAberta(ed_numero_mesa.text)=false) )
      then
       begin
         
         dm.efetuaAberturaDaMesa(ed_numero_mesa.text);
       end;

    adicionar_produto_conta(ed_numero_mesa.Text,true);
//    lb_preco.Visible := false;
//    descricao_prod.Visible := false;
  end;

end;

procedure TfrmLancamentosSalao.B20002005Click(Sender: TObject);
begin
  if( trim(ed_numero_mesa.Text) = dm.getCodMesaBalcao ) then exit;
  if (dm.verificaPermissaoAcao((sender as TBitBtn).Name) = true) then
  begin
    if (dm.verificaExtratosEmitidos(ed_numero_mesa.text) = false) then
     begin
      dm.exibe_painel_erro('É necessária a emissão de extrato para esta operação ','');
      exit;
     end
    else
      begin
        gravarEstornoMesa(ed_numero_mesa.Text); 
        dm.estornarMesaInteira(marca_impressora_nao_fiscal_01, modelo_impressora_nao_fiscal_01, ed_numero_mesa.Text,ed_valor_bruto.Value);
      end;
  end;

end;




procedure  TfrmLancamentosSalao.gravarEstornoMesa(mesa : string);
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





procedure TfrmLancamentosSalao.alternarTipoCaixa(tipo : integer);
begin

  if (tipo = 1) then
   begin

    ed_numero_mesa.Text:= dm.getCodMesaBalcao();
    ed_cod_garcon.Text:=  dm.getCodGarconMesaBalcao();
//    B30001002.enabled:=true;
//    B30001016.enabled:=false;
//    B30001007.enabled:=false;
//    B30001008.enabled:=false;
//    B30001009.enabled:=false;
//    B30001010.enabled:=false;
    pn_mesa.Visible:=false;
    pn_garcon.Visible:=false;
//     pn_produto.Left := 165;
//    B20001002.Caption:='Venda'+#10+'em Mesa'+#10+'(B)';
    ed_cod_produto.SetFocus;
    tipo_caixa_atual:=tipo;
    busca_movimento_da_mesa();    
   end
  else
   begin
    if ( (dm.verificaseExisteMovimentoMesaBalcao() = true) and (dm.verificaMesaBalcao(ed_numero_mesa.Text)) ) then
     begin

       dm.exibe_painel_erro('A venda balcão ainda não foi encerrada!','Prosseguir...');
       ed_numero_mesa.Text:= dm.getCodMesaBalcao();
       ed_cod_garcon.Text:=  dm.getCodGarconMesaBalcao();
//       B30001002.enabled:=false;
//       B30001016.enabled:=false;
//       B30001007.enabled:=false;
//       B30001008.enabled:=false;
//       B30001009.enabled:=false;
//       B30001010.enabled:=false;

       pn_mesa.Visible:=false;
       pn_garcon.Visible:=false;

//       B20001002.Caption:='Venda'+#10+'em Mesa'+#10+'(B)';
//       B20001002.Enabled:=false;
       ed_cod_produto.SetFocus;
       tipo_caixa_atual:=tipo;
        busca_movimento_da_mesa();
       Exit;
     end
    else
     begin
//      B20001002.Caption:='Venda'+#10+'Balcão'+#10+'(B)';
      ed_numero_mesa.Text:='';
      ed_cod_garcon.Text:= '';
      pn_mesa.Visible:=true;
//      pn_garcon.Visible:=true;

    if (verificaSeUsaCodGarcon = False) then
      begin
        ed_cod_garcon.text:=dm.getCodGarconMesaBalcao();
        lbGarcon.Visible := false;
        ed_cod_garcon.Visible := false;



  //      ed_cod_garcon.Visible:=false;
//        pn_garcon.Visible:=FALSE;
//        pn_produto.Left:=80;
//        pn_produto.Width:=929;
      end
     else
      begin
        ed_cod_garcon.text:='';
        ed_cod_garcon.Visible:=true;
//        pn_garcon.Visible:=true;
//        pn_produto.Left:=160;
  //    pn_produto.Width:=853;
      end;




//      B30001002.enabled:=true;
//      B30001016.enabled:=true;
//      B30001007.enabled:=true;
//      B30001008.enabled:=true;
//      B30001009.enabled:=true;
//      B30001010.enabled:=true;

       ed_numero_mesa.SetFocus;
      tipo_caixa_atual:=tipo;
     end;
   end;
end;
procedure TfrmLancamentosSalao.ed_numero_mesaChange(Sender: TObject);
begin
  inherited;
  if (    ((trim(ed_numero_mesa.Text) ='b') ) or  ((trim(ed_numero_mesa.Text) ='B') ) )  then
  begin
//    B20001002.Click;
  end;

end;

procedure TfrmLancamentosSalao.ed_cod_produtoChange(Sender: TObject);
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
   ed_cod_garcon.Clear;
  end;

  if (    ((trim(ed_cod_produto.Text) ='b') ) or  ((trim(ed_cod_produto.Text) ='B') ) )  then
  begin
    ed_cod_produto.Clear;
//    B20001002.Click;
  end;

{  CASO LEIA O PESO POR CÓDIGO DE BARRAS

  tipoCodBarras :=1;
  if( Length(trim(ed_cod_produto.text)) = 13) then
   begin
      case tipoCodBarras of
       1: begin

            codProdutoLido := copy(ed_cod_produto.text,2,5);

            strPreco := copy(ed_cod_produto.text,8,6);
            strPreco := IntToStr(StrToInt(strPreco));
            strPreco := copy(strPreco,0,Length(strPreco)-1);



            case Length(strPreco) of
             3: begin
                  strPreco := copy(strPreco,0,1)+','+copy(strPreco,2,2);
                end;

             4: begin
                  strPreco := copy(strPreco,0,2)+','+copy(strPreco,3,2);
                end;

             5: begin
                  strPreco := copy(strPreco,0,3)+','+copy(strPreco,4,2);
                end;
            end;

            ed_cod_produto.Text := FormatFloat('00000',StrToFloat(codProdutoLido));

            ed_valor_produto.Text := strPreco;
            qtdeCalculada:=0;
            qtdeCalculada:= StrToFloat(ed_valor_produto.Text)   /  getValorProduto(ed_cod_produto.Text,2);
            ed_quantidade.text := FormatFloat('#0.00000',qtdeCalculada);
            ed_quantidade.SetFocus;
            efetuar_lancamento;
          end;

       2: begin
            if( Length(trim(ed_cod_produto.text)) = 13) then
             begin
               codProduto:=copy(ed_cod_produto.Text,2,4);
               valorTotal:=copy(ed_cod_produto.Text,8,5);
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
      end;
   end;

 }


end;

procedure TfrmLancamentosSalao.ed_quantidadeChange(Sender: TObject);
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



procedure TfrmLancamentosSalao.lancarCouvertAutomatico(mesa : string);
var
 codCouvert : string;
begin
   codCouvert := dm.getCodCouvertAutomatico(0,mesa);
   lb_cod_produto.Caption:= getCodProduto(codCouvert);
   if ( dm.verificaSeProdutoEstaNaConta(lb_cod_produto.Caption,mesa) = false) then
    begin
      ed_cod_produto.Text:= codCouvert;
      ed_cod_garcon.Text:= dm.getCodGarconMesaBalcao;
      ed_quantidade.Text:='1';
      ed_valor_produto.Text:= Floattostr(getValorProduto(ed_cod_produto.Text,2));
      adicionar_produto_conta(mesa,false);
    end;
end;


procedure TfrmLancamentosSalao.mudaCaptionsBotoes();
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













procedure TfrmLancamentosSalao.FormKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
//  timerAtualizaTelaMesas .Enabled:=false;
//  timerAtualizaTelaMesas .Enabled:=true;
end;

procedure TfrmLancamentosSalao.timerAtualizaTelaMesasTimer(Sender: TObject);
begin
  inherited;
//  AtualizarListaMesas();
end;






procedure TfrmLancamentosSalao.enter_botao(Sender: TObject);
begin
   ed_numero_mesa.text:=(sender as TBitBtn).Caption;
end;


procedure TfrmLancamentosSalao.FuncaoBtnClick(Sender: TObject);
var
 pt : Tpoint;
begin
   ed_numero_mesa.Text:= (Sender as TBitBtn).Caption;
   ed_numero_mesa.Text:= dm.removeCaracteres(ed_numero_mesa.Text);
   dm.transacao.Active:=true;
   dm.transacao.Active:=false;
   dm.transacao.Active:=true;

   if trim(ed_quantidade.text) = ''  then     ed_quantidade.text:='1';
    try
      begin
        if trim(ed_numero_mesa.Text) = '' then
        begin
          ed_numero_mesa.Clear;
          ed_numero_mesa.SetFocus;
          exit;
        end
        else
        begin
          ed_numero_mesa.Text := formatfloat('0000', Strtofloat(ed_numero_mesa.Text));
          ed_numero_mesa.Text := formatfloat('0000', Strtofloat(ed_numero_mesa.Text));

          if( (trim(ed_numero_mesa.Text) <> dm.getCodMesaBalcao())  )   then
          begin
            ed_cod_garcon.Text := dm.getCodGarconAbriuMesa(ed_numero_mesa.Text);
            ed_cod_garcon.SetFocus;
          end;

        end;
      end;
    except
      begin
        showmessage('Número de mesa inválido!');
        ed_numero_mesa.Clear;
        ed_numero_mesa.SetFocus;
        exit;
      end;
    end;
    //    foto.Picture.LoadFromFile(dm.LeIni(2,'IMAGENS','caixa_aguardando'));

    //Ponto de verificacao se usa cartao

    if (dm.verificaSeFuncionaComoBoate = true) then
     begin
       if (verificaStatusCartao(ed_numero_mesa.Text) = false ) then
         begin
           ed_numero_mesa.clear;
           ed_numero_mesa.SetFocus;
           exit;
         end;
     end;


    if ( dm.verificaSeMesaTemMovimento(ed_numero_mesa.Text) =false) then
     begin
      if (StrToInt(dm.LeIni(1, 'COUVERT', 'lancarAutomaticamente')) = 1) then
       begin
          if (MessageDlg('Mesa sem movimento. Deseja lançar couvert assim mesmo ?',mtConfirmation,[mbYes,mbNo],0) = mrYes )then
            begin
              lancarCouvertAutomatico(ed_numero_mesa.Text);
              dm.efetuaAberturaDaMesa(ed_numero_mesa.text);
            end
       end
      else
        begin
//          showmessage('Mesa sem movimento');
        end
     end
    else
     begin
     if (StrToInt(dm.LeIni(1, 'COUVERT', 'lancarAutomaticamente')) = 1) then
       begin
        lancarCouvertAutomatico(ed_numero_mesa.Text);
        dm.efetuaAberturaDaMesa(ed_numero_mesa.text);
       end;
     end;


    if (dm.verificaseExisteMovimentoMesa(ed_numero_mesa.Text) = false) then
     begin
       dm.apagaExtratosEmitidos(ed_numero_mesa.Text);
       dm.ApagaAberturaDaMesa(ed_numero_mesa.text);
       if dm.transacao.Active = false then dm.transacao.Active:=true;
       dm.transacao.Commit;
     end;



    if (   (dm.verificaExtratosEmitidos(ed_numero_mesa.text) = true)  and  (StrToInt(dm.LeIni(2, 'CAIXA', 'checar_mesa_aberta')) = 1) and (dm.verificaMesaBalcao(ed_numero_mesa.Text) = false)   )  then
     begin
      string_auxiliar := 'N';
      Application.CreateForm(Tfrm_confirma_extrato, frm_confirma_extrato);
      frm_confirma_extrato.setTitulo('Confirmação');
      frm_confirma_extrato.setMensagem('A mesa informada encontra-se aguardando pagamento!! '+#13#10+#13#10+' Deseja continuar ?',12);
      frm_confirma_extrato.ShowModal;
      frm_confirma_extrato.free;
      if string_auxiliar = 'S' then
       begin
         busca_movimento_da_mesa();
       end
      else
       begin
         ed_numero_mesa.Clear;
         ed_numero_mesa.SetFocus();
       end;
     end
    else
     begin
      busca_movimento_da_mesa;
     end;


end;




procedure TfrmLancamentosSalao.Timer1Timer(Sender: TObject);
begin
  inherited;
//  dxStatusBar1.Panels[3].Text:= FormatDateTime('HH:MM:SS',time);
end;

procedure TfrmLancamentosSalao.btCalculadoraClick(Sender: TObject);
begin
  inherited;
//  ACBrCalculadora1.Execute;
end;

procedure TfrmLancamentosSalao.B20001003Click(Sender: TObject);
begin
  inherited;
 if (dm.verificaPermissaoAcao((sender as TBitBtn).Name) = true) then
 begin
  Application.CreateForm(TfrmPrincipalDelivery,frmPrincipalDelivery);
  frmPrincipalDelivery.showmodal;
  frmPrincipalDelivery.free;

 end;

end;

procedure TfrmLancamentosSalao.CancelamentodeProduto1Click(
  Sender: TObject);
begin
  inherited;
//  B20002003.Click;
end;

procedure TfrmLancamentosSalao.RANSFERNCIA1Click(Sender: TObject);
begin
  inherited;
//  B20002004.Click;
end;

procedure TfrmLancamentosSalao.muda_acao(tipo : integer);
begin
  case tipo of
    1: begin
         tipo_cupom:=1;
//         dxstatusbar1.Panels[0].text:=nome_fantasia;
       end;
    2: begin
         tipo_cupom:=2;
//         dxstatusbar1.Panels[0].text:=razao_social;
       end;
  end;
  ed_cod_produto.Clear;
end;


procedure TfrmLancamentosSalao.ed_cod_garconChange(Sender: TObject);
begin
  inherited;
  if ( (trim(ed_cod_garcon.Text) ='010101') or (trim(ed_cod_produto.Text) ='010101') ) then
  begin
   if tipo_cupom = 1 then
    muda_acao(2)
   else
    muda_acao(1);
   ed_cod_garcon.Clear;
  end;

end;

procedure TfrmLancamentosSalao.pisca1Timer(Sender: TObject);
begin
  inherited;
//    pisca1.Enabled:=false;
//    pisca2.Enabled:=true;

end;

procedure TfrmLancamentosSalao.pisca2Timer(Sender: TObject);
begin
  inherited;
//    pisca2.Enabled:=false;
//    pisca1.Enabled:=true;

end;

procedure TfrmLancamentosSalao.pnExpedicaoClick(Sender: TObject);
begin
  inherited;
  Application.CreateForm(TfrmExpedicaoDelivery,frmExpedicaoDelivery);
  frmExpedicaoDelivery.ShowModal;
  frmExpedicaoDelivery.Free;
end;

procedure TfrmLancamentosSalao.imgAtencaoClick(Sender: TObject);
begin
  inherited;
  pnExpedicaoClick(sender); 
end;

procedure TfrmLancamentosSalao.Image1Click(Sender: TObject);
begin
  inherited;
  pnExpedicaoClick(sender); 
end;

procedure TfrmLancamentosSalao.lbPedidosClick(Sender: TObject);
begin
  inherited;
  pnExpedicaoClick(sender); 
end;

procedure TfrmLancamentosSalao.Label12Click(Sender: TObject);
begin
  inherited;
  pnExpedicaoClick(sender); 
end;





procedure TfrmLancamentosSalao.btMapaMesasClick(Sender: TObject);
begin
  inherited;
  Application.CreateForm(TfrmMapaMesas,frmMapaMesas);
  frmMapaMesas.showmodal;
  frmMapaMesas.Free;
  ed_numero_mesa.Text := string_auxiliar;
  busca_movimento_da_mesa;


end;

procedure TfrmLancamentosSalao.btMenuFiscalClick(Sender: TObject);
begin
  inherited;
  Application.CreateForm(TfrmMenuFiscal,frmMenuFiscal);
  frmMenuFiscal.ShowModal;
  frmMenuFiscal.free; 
end;

procedure TfrmLancamentosSalao.btOpCaixaClick(Sender: TObject);
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

procedure TfrmLancamentosSalao.SpeedButton1Click(Sender: TObject);
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

procedure TfrmLancamentosSalao.bt_peq_produtoClick(Sender: TObject);
begin
  inherited;
  pesquisar_produto;
end;

procedure TfrmLancamentosSalao.JvGradient1Click(Sender: TObject);
begin
  inherited;
  dm.qry_movimento_mesa.Next;
end;


procedure TfrmLancamentosSalao.MakeRounded(Control: TWinControl);
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



procedure TfrmLancamentosSalao.FormCreate(Sender: TObject);


begin
  inherited;
  Self.top:=0;
  self.left:=0;
  if (StrToInt(dm.LeIni(2,'SALAO','mostrarCodigoGarcon')) =0) then
   begin
     ed_cod_garcon.PasswordChar :='*';

   end;

   criaBotoesTouch();

end;

procedure TfrmLancamentosSalao.criaBotoesTouch();
var
btn : TJvImgBtn;
 topBtn : integer;
 x,x2: integer;
 nm : string;
  pagina : TComponent;
begin

  dm.qryauxiliar.Active := false;
  dm.qryauxiliar.SQL.clear;

  dm.qryauxiliar.sql.add(' select * from grupos_touch gt where gt.codigo <> '+QuotedstR('00')+' and gt.codigo in ');
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

           if  (Trim(copy( (components[x] as TJvImgBtn).Name ,0,4))  = 'btgp') then
            begin
             (components[x] as TJvImgBtn).Caption := dm.qryauxiliar.fieldbyname('descricao').Value;
             (components[x] as TJvImgBtn).Visible := true;
             (components[x] as TJvImgBtn).onClick :=  btgp1Click;



             dm.qryauxiliar2.Active := false;
             dm.qryauxiliar2.SQL.Clear;
             dm.qryauxiliar2.SQL.add('select p.cod_produto, p.cod_barras, p.cod_grupo_touch, p.descricao_touch, p.descricao  from produtos p ');
             dm.qryauxiliar2.SQL.add(' where p.vende=1 and p.cod_grupo_touch <> '+Quotedstr('00')+' and   (p.cod_grupo_touch='+Quotedstr(dm.qryauxiliar.fieldbyname('codigo').Value)+') and (p.cod_grupo_touch is not null) and (p.cod_grupo_touch  <> '+Quotedstr('')+')');




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
              1: pagina := TabSheet6;
              2: pagina := TabSheet7;
              3: pagina := TabSheet8;
              4: pagina := TabSheet9;
              5: pagina := TabSheet10;
              6: pagina := TabSheet11;
              7: pagina := TabSheet12;
              8: pagina := TabSheet13;
              9: pagina := TabSheet14;
              10: pagina := TabSheet15;
              11: pagina := TabSheet16;
              12: pagina := TabSheet17;
              13: pagina := TabSheet18;
              14: pagina := TabSheet19;
              15: pagina := TabSheet20;
              16: pagina := TabSheet21;
              17: pagina := TabSheet22;
              18: pagina := TabSheet23;
              19: pagina := TabSheet24;
              20: pagina := TabSheet25;
              21: pagina := TabSheet26;
              22: pagina := TabSheet27;
              23: pagina := TabSheet28;
              24: pagina := TabSheet29;
              25: pagina := TabSheet30;
              26: pagina := TabSheet31;
              27: pagina := TabSheet32;
              28: pagina := TabSheet33;
              29: pagina := TabSheet34;
              30: pagina := TabSheet35;
              31: pagina := TabSheet36;
              32: pagina := TabSheet37;
              33: pagina := TabSheet38;
              34: pagina := TabSheet39;
              35: pagina := TabSheet40;
             end;

             x2:=0;
             while ( (x2 < ComponentCount -1) and (dm.qryauxiliar2.Eof = false) ) do
               begin
                if  Components[x2].ClassName='TJvImgBtn' then
                 begin
                      if (Components[x2].GetParentComponent = pagina ) then
                       begin
                         (components[x2] as TJvImgBtn).Name := 'pdt'+dm.qryauxiliar2.fieldbyname('cod_barras').Value;
//                         (components[x2] as TJvImgBtn).Caption :=dm.qryauxiliar2.fieldbyname('cod_produto').Value+#13#10+dm.qryauxiliar2.fieldbyname('descricao').Value;
                         if ( trim(dm.qryauxiliar2.fieldbyname('descricao_touch').Value) = '') then
                             (components[x2] as TJvImgBtn).Caption := dm.qryauxiliar2.fieldbyname('descricao').Value
                         else
                             (components[x2] as TJvImgBtn).Caption := dm.qryauxiliar2.fieldbyname('descricao_touch').Value;
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

procedure TfrmLancamentosSalao.SpeedButton4Click(Sender: TObject);
begin
  inherited;
  if  pgGrupos.ActivePageIndex > 0 then
  pgGrupos.ActivePageIndex :=   pgGrupos.ActivePageIndex -1;
end;

procedure TfrmLancamentosSalao.btgp1Click(Sender: TObject);
var
 indice: integer;
begin
  inherited;
  indice := StrToInt(Trim( copy((sender as TJvImgBtn).Name,5,5)));
  pgProdutos.ActivePageIndex:=indice-1;
end;

procedure TfrmLancamentosSalao.btpd011Click(Sender: TObject);
var
x : integer;
begin
  inherited;
  x:=0;
   while ( (x < ComponentCount -1)) do
      begin
        if ( Components[x] is Tedit  ) and     ( (Components[x]as Tedit).Name='ed_cod_produto' ) then
          begin
             (Components[x] as Tedit).Text :=  Trim( copy((sender as TJvImgBtn).Name,4,10));
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
                ed_numero_mesaExit(ed_quantidade );
               end
              else
               begin
                ed_numero_mesaExit(ed_cod_produto);
               end;

          end;
        x:= x+1;
      end;

end;

procedure TfrmLancamentosSalao.SpeedButton2Click(Sender: TObject);
var
x : integer;
valor : integer;
begin
  inherited;
  x:=0;
   while ( (x < ComponentCount -1)) do
      begin
        if ( Components[x] is Tedit  ) and     ( (Components[x]as Tedit).Name='ed_quantidade' ) then
          begin

              try
               begin
                 valor := strToInt((Components[x] as Tedit).Text  );
                 valor:= valor +1;
               end;
              except
               valor := 1;
              end;

             (Components[x] as Tedit).Text :=  IntToStr(valor);
          end;
        x:= x+1;
      end;

end;
procedure TfrmLancamentosSalao.SpeedButton5Click(Sender: TObject);
var
 qtdPg : string;
begin
  inherited;
   qtdPg :=   Floattostr( (paginaAtual-1) / 7);
 try                        
 
   StrToInt(qtdPg);
  except
   qtdPg := Inttostr(( (paginaAtual-1) div 7) +1 )
  end;

  if pgGrupos.ActivePageIndex <  StrToInt(qtdPg) -1  then
     pgGrupos.ActivePageIndex :=   pgGrupos.ActivePageIndex + 1;
end;

procedure TfrmLancamentosSalao.btConfirmaLancamentosClick(Sender: TObject);
begin
  inherited;
  ed_numero_mesa.SetFocus;
end;

procedure TfrmLancamentosSalao.SpeedButton8Click(Sender: TObject);
begin
  inherited;
  pnProdutosTouch.Visible := false;
  pnTeclado.Visible := true;
end;

procedure TfrmLancamentosSalao.SpeedButton6Click(Sender: TObject);
begin
  inherited;
  D30001011.SetFocus;
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

procedure TfrmLancamentosSalao.SpeedButton7Click(Sender: TObject);
begin
  inherited;
  D30001011.SetFocus;
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

procedure TfrmLancamentosSalao.SpeedButton10Click(Sender: TObject);
begin
  inherited;
  D30001011.SetFocus;
  dm.qry_movimento_mesa.Prior;

end;

procedure TfrmLancamentosSalao.SpeedButton9Click(Sender: TObject);
begin
  inherited;
  D30001011.SetFocus;
  dm.qry_movimento_mesa.next;

end;

procedure TfrmLancamentosSalao.btResumirClick(Sender: TObject);
begin
  inherited;
  if resumido = true then
   begin
    btResumir.Caption := 'R'#13#10+'E'#13#10+'S'#13#10+'U'#13#10+'M'#13#10+'E';
    resumido := false;
   end
  else
   begin
    btResumir.Caption := 'D'#13#10+'E'#13#10+'T'#13#10+'A'#13#10+'L'#13#10+'H'#13#10+'A';
    resumido := true;
   end;



  busca_movimento_da_mesa
end;


procedure TfrmLancamentosSalao.btEstornaProdutoClick(Sender: TObject);
var
  result: string;
  permite: boolean;

begin



 dm.qry_movimento_mesa.Last;
//  if   (dm.verificaPermissaoAcao((sender as TBitBtn).Name) = true) then
 if (dm.qry_movimento_mesa.FieldByName('impresso').Value = 1) then
  begin
    dm.exibe_painel_erro('Não é possível cancelar um ítem que já foi confirmado.'+#13#10+#13#10+' Para cancelar este produto. Solicite o cancelamento ao operador do  caixa.','Ok');
    exit;
  end
 else
   begin


    apagaItemMovimento(dm.qry_movimento_mesa.FieldByName('quantidade').Value,'0','0','');
   end;


end;


procedure TfrmLancamentosSalao.mostraMapaMesas();
begin
  pnMapaMesas.Visible := true;
  pnProdutosMesa.Visible := false;
  dm.transacao.Active :=false;
  dm.transacao.Active := true;


  dm.qryauxiliar.Active := false;
  dm.qryauxiliar.SQL.Clear;
  dm.qryauxiliar.SQL.Add(' select count(*) from (select distinct cod_mesa from movimento_mesa) ');
  dm.qryauxiliar.SQL.Add('  union all ');
  dm.qryauxiliar.SQL.Add(' select count(*) from extratos_emitidos et ');
  dm.qryauxiliar.SQL.Add('   where et.mesa in (select distinct cod_mesa from movimento_mesa) ');
  dm.qryauxiliar.Active := true;

  edQtdMesas.Text   := Inttostr(dm.qryauxiliar.fieldbyname('count').AsInteger) + ' MESAS';
  DM.qryauxiliar.Next;
  edMesasPagto.Text :=   Inttostr(dm.qryauxiliar.fieldbyname('count').AsInteger)+' EM PAGAMENTO';
  dm.qryauxiliar.Active := false;
  
  dm.qryMapaMesasSalao.Active := false;
  dm.qryMapaMesasSalao.SQL.Clear;
  dm.qryMapaMesasSalao.SQL.Add('select * from mapa_mesas where m1 <> '+Quotedstr(''));
  dm.qryMapaMesasSalao.Active := true;
  dm.qryMapaMesasSalao.First;
end;



procedure TfrmLancamentosSalao.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);

var Bitmap:
TBitmap;

begin
  inherited;


if  dm.qryMapaMesasSalao.Fields[Column.index].Value <> '' then
 begin
  try
   begin

    if ( (dm.qryMapaMesasSalao.Fields[Column.index].Value <> null) and (dm.qryMapaMesasSalao.Fields[Column.index].Value <> '')) then
     begin
        if (verificaMesaTemExtrato(dm.qryMapaMesasSalao.Fields[Column.index].Value)) then
         begin
           imgMapa.Picture.LoadFromFile(patchAplicacao+'imagens\conta.bmp');
         end
        else
         begin
          imgMapa.Picture.LoadFromFile(patchAplicacao+'imagens\livre2.bmp');

          dm.qryauxiliar.Active := false;
          dm.qryauxiliar.SQL.clear;
          dm.qryauxiliar.SQL.Add('SELECT MINUTOS from tempo_mesa('+Quotedstr(dm.qryMapaMesasSalao.Fields[Column.index].Value)+')');
          dm.qryauxiliar.Active := True;




          if dm.qryauxiliar.FieldByName('minutos').Value >=   StrToInt(dm.LeIni(2,'PARAMETROS','tempoAvisoMapa')) then
           begin
             imgMapa.Picture.LoadFromFile(patchAplicacao+'imagens\alarme.bmp');
           end;



         end;

         Bitmap := imgMapa.Picture.Bitmap;
         imgMapa.Canvas.Font.Size := 12;
         imgMapa.Canvas.TextOut(18, 60, dm.qryMapaMesasSalao.Fields[Column.index].Value );
          with TDBGrid(Sender) do
          begin
           Canvas.Draw((Rect.Right - Rect.Left - Bitmap.Width) div 2 + Rect.Left,
           (Rect.Bottom - Rect.Top - Bitmap.Height) div 2 + Rect.Top, Bitmap);
          end;
     end;
   end;
  except
   begin
//    ShowMessage('');
   end;
  end;
 end;


end;

procedure TfrmLancamentosSalao.SpeedButton11Click(Sender: TObject);
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

procedure TfrmLancamentosSalao.SpeedButton3Click(Sender: TObject);
var
x : integer;
valor : integer;
begin
  inherited;
  x:=0;
   while ( (x < ComponentCount -1)) do
      begin
        if ( Components[x] is Tedit  ) and     ( (Components[x]as Tedit).Name='ed_quantidade' ) then
          begin

              try
               begin
                 valor := strToInt((Components[x] as Tedit).Text  );
                 valor:= valor -1;

                 if (valor <= 0) then
                  valor:=1;



               end;
              except
               valor := 1;
              end;

             (Components[x] as Tedit).Text :=  IntToStr(valor);
          end;
        x:= x+1;
      end;

end;

procedure TfrmLancamentosSalao.JvTransparentButton2Click(Sender: TObject);
begin
  inherited;

begin
if   (dm.verificaPermissaoAcao('I20002003') ) then
    begin
      if resumido  = true then
       begin
            application.CreateForm(Tfrm_cancela_item_restaurante, frm_cancela_item_restaurante);
            frm_cancela_item_restaurante.lbDescricaoProduto.Caption:=dm.qry_movimento_mesa.FieldByName('descricao').Value;
              if( (dm.qry_movimento_mesa.FieldByName('quantidade').Value = 1) or (frm_modelo_vazio.verificaSeNumeroInteiro(dm.qry_movimento_mesa.FieldByName('quantidade').Value)=false) )    then
                begin
                  frm_cancela_item_restaurante.edQuantidade.Value:=dm.qry_movimento_mesa.FieldByName('quantidade').Value;
                  frm_cancela_item_restaurante.edQuantidade.Enabled:=false;
                end
              else
                 begin

                 end;
            frm_cancela_item_restaurante.ShowModal;
            frm_cancela_item_restaurante.Free;


          end
      else
        begin
          Showmessage('Não é possível realizar cancelamentos no modo de visualização resumida '+#13+' A legislação do PAF-ECF ICMS 06/08 não permite tal operação.');
          exit;
        end;
    end;

   busca_movimento_da_mesa();
end;
end;

procedure TfrmLancamentosSalao.DBGrid1ColEnter(Sender: TObject);
begin
  inherited;


 if ( (dm.qryMapaMesasSalao.Fields[DBGrid1.selectedIndex].Value <> null) and (dm.qryMapaMesasSalao.Fields[DBGrid1.selectedIndex].Value <> '')) then
  begin
     ed_numero_mesa.Text := dm.qryMapaMesasSalao.Fields[DBGrid1.selectedIndex].Value;
  end;
end;

procedure TfrmLancamentosSalao.TransparentButton7Click(Sender: TObject);
begin
  inherited;

  if (dm.verificaPermissaoAcao('B20002002') = true) then
   begin
      if (verificaSeCaixaEstaAberto(ultimoCaixaAberto) = true) then
       begin
         fecharConta();
       end
      else
       begin
         exibe_painel_erro('O CAIXA ENCONTRA-SE FECHADO!','OK'); 
       end;



   end;
  {
 if dm.qryMapaMesasSalao.Active  then
  begin
   if ( (dm.qryMapaMesasSalao.Fields[DBGrid1.selectedIndex].Value <> null) and (dm.qryMapaMesasSalao.Fields[DBGrid1.selectedIndex].Value <> '')) then
    begin
       ed_numero_mesa.Text := dm.qryMapaMesasSalao.Fields[DBGrid1.selectedIndex].Value;
       busca_movimento_da_mesa;
       ed_numero_mesaExit(ed_numero_mesa);
       ed_cod_garcon.SetFocus();
    end;
  end;
   }


end;

procedure TfrmLancamentosSalao.DBGrid1DblClick(Sender: TObject);
begin
  inherited;
 if dm.qryMapaMesasSalao.Active  then
  begin
   if ( (dm.qryMapaMesasSalao.Fields[DBGrid1.selectedIndex].Value <> null) and (dm.qryMapaMesasSalao.Fields[DBGrid1.selectedIndex].Value <> '')) then
    begin
       ed_numero_mesa.Text := dm.qryMapaMesasSalao.Fields[DBGrid1.selectedIndex].Value;
       busca_movimento_da_mesa;
       ed_numero_mesaExit(ed_numero_mesa);


    if (verificaSeUsaCodGarcon = False) then 
      begin
        ed_cod_garcon.text:=dm.getCodGarconMesaBalcao();
        lbGarcon.Visible := false;
        ed_cod_garcon.Visible := false;
        ed_cod_produto.SetFocus;
      end
     else
      begin
        ed_cod_garcon.SetFocus();
      end;


    end;
  end;

end;

procedure TfrmLancamentosSalao.JvTransparentButton1Click(Sender: TObject);
begin
  inherited;

  if (dm.verificaPermissaoAcao((sender as TJvTransparentButton).Name) = true) then
   begin
    if ( trim(ed_numero_mesa.Text) = '' ) then
     begin
       emitirExtrato(true);
     end
    else
    begin
      if (dm.verificaExtratosEmitidos(ed_numero_mesa.text) = true) then
       begin
        string_auxiliar := 'N';
        Application.CreateForm(Tfrm_confirma_extrato, frm_confirma_extrato);
        frm_confirma_extrato.setTitulo('Confirmação de extrato');
        frm_confirma_extrato.setMensagem('Já foi emitido um extrato da mesa informada!! '+#13#10+#13#10+' Deseja continuar ?',12);
        frm_confirma_extrato.ShowModal;
        frm_confirma_extrato.free;
        if string_auxiliar = 'S' then
          emitirExtrato(false);

        string_auxiliar := '';
       end
      else
       emitirExtrato(false);
    end;

   end;

//  voltar_mesa;
  busca_movimento_da_mesa;
  if ( dm.verificaMesaBalcao(ed_numero_mesa.Text) = false ) then
   begin
    ed_cod_garcon.Clear;
    ed_numero_mesa.clear;
    ed_numero_mesa.SetFocus;
   end;




end;

procedure TfrmLancamentosSalao.brReabreClick(Sender: TObject);
begin
  inherited;
  if dm.verificaPermissaoAcao('I20002013') = true then
   begin
    dm.apagaExtratosEmitidos(ed_numero_mesa.text);
    dm.exibe_painel_erro('Mesa / Cartão  reaberto!','Ok'); 

   end;
end;

end.

procedure TfrmLancamentosSalao.AdvTouchKeyboard1DrawKey(Sender: TObject;
  Key: TAdvTouchKeyItem; Canvas: TCanvas; Down: Boolean; Rect: TRect;
  var DefaultDraw: Boolean);
begin
  inherited;

end;





