unit uu_obs_lancamento_caixa;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uu_modelo_vazio, StdCtrls, ExtCtrls, Buttons, ibx.IBquery,
  Grids, DBGrids, JvCtrls,
  ComCtrls, JvComCtrls, JvExStdCtrls, JvButton, JvExComCtrls, JvActionsEngine,
  JvControlActions, Vcl.ActnList, System.Actions, AdvSmoothTouchKeyBoard,
  Vcl.Menus;

type
  Tfrm_obs_lancamento_caixa = class(Tfrm_modelo_vazio)
    Panel2: TPanel;
    memo_obs: TMemo;
    memo_obs_complementar: TMemo;
    bt_selecionar: TBitBtn;
    btTecladoVirtual: TSpeedButton;
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
    SpeedButton5: TSpeedButton;
    SpeedButton4: TSpeedButton;
    btgp8: TJvImgBtn;
    TabSheet2: TTabSheet;
    btgp9: TJvImgBtn;
    btgp10: TJvImgBtn;
    btgp11: TJvImgBtn;
    btgp12: TJvImgBtn;
    btgp13: TJvImgBtn;     
    btgp14: TJvImgBtn;
    btgp15: TJvImgBtn;
    btgp16: TJvImgBtn;
    TabSheet3: TTabSheet;
    btgp17: TJvImgBtn;
    btgp18: TJvImgBtn;
    btgp19: TJvImgBtn;
    btgp20: TJvImgBtn;
    btgp21: TJvImgBtn;
    btgp22: TJvImgBtn;
    btgp23: TJvImgBtn;
    btgp24: TJvImgBtn;
    pgProdutos: TJvPageControl;
    TabSheet6: TTabSheet;
    Panel1: TPanel;
    btOb1: TJvImgBtn;
    btOb2: TJvImgBtn;
    btOb3: TJvImgBtn;
    btOb4: TJvImgBtn;
    btOb5: TJvImgBtn;
    btOb6: TJvImgBtn;
    btOb7: TJvImgBtn;
    btOb8: TJvImgBtn;
    btOb9: TJvImgBtn;
    btOb10: TJvImgBtn;
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
    JvImgBtn53: TJvImgBtn;
    JvImgBtn54: TJvImgBtn;
    JvImgBtn361: TJvImgBtn;
    JvImgBtn362: TJvImgBtn;
    JvImgBtn363: TJvImgBtn;
    JvImgBtn364: TJvImgBtn;
    JvImgBtn365: TJvImgBtn;
    JvImgBtn366: TJvImgBtn;
    JvImgBtn367: TJvImgBtn;
    JvImgBtn368: TJvImgBtn;
    JvImgBtn369: TJvImgBtn;
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
    pnTeclado: TPanel;
    btFecharTeclado: TSpeedButton;
    AdvSmoothTouchKeyBoard1: TAdvSmoothTouchKeyBoard;
    procedure criarSelecao();
    procedure bt_selecionarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormActivate(Sender: TObject);
    procedure memo_obsKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure criarObservacoes();
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton27Click(Sender: TObject);
    procedure SpeedButton28Click(Sender: TObject);
    procedure SpeedButton29Click(Sender: TObject);
    procedure SpeedButton37Click(Sender: TObject);
    procedure SpeedButton38Click(Sender: TObject);
    procedure DBGrid2DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure SpeedButton30Click(Sender: TObject);
        procedure DBGrid3DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure memo_obs_complementarDblClick(Sender: TObject);
    procedure btFecharTecladoClick(Sender: TObject);
    procedure SpeedButton40Click(Sender: TObject);
    procedure criaGruposObs();
    procedure adicionaObs(Sender: TObject);

    procedure btgp1Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure btOb1Click(Sender: TObject);


  private
    { Private declarations }
    paginaAtual : integer;
  public
    { Public declarations }
  end;

var
  frm_obs_lancamento_caixa: Tfrm_obs_lancamento_caixa;
    tecladoAberto : boolean;
implementation

uses uu_frm_principal, uu_data_module;

{$R *.dfm}

procedure Tfrm_obs_lancamento_caixa.bt_selecionarClick(Sender: TObject);
var
ct : integer;
begin
  inherited;

  for ct:= 0 to memo_obs_complementar .Lines.Count  do
   begin
     frm_principal.obsLancamento  := frm_principal.obsLancamento+memo_obs_complementar .lines[ct];
   end;

  criarSelecao;

  strObsProduto:='';
  strObsProduto:= memo_obs.Lines.Text + frm_principal.obsLancamento;
  strObsProduto:= StrUpper(pchar(strObsProduto));

  Close;
end;

procedure Tfrm_obs_lancamento_caixa.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
//   strObsProduto:= me01
    memo_obs.Lines.Text;
   strObsProduto:= StrUpper(pchar(strObsProduto));
end;

procedure Tfrm_obs_lancamento_caixa.FormActivate(Sender: TObject);
begin

  inherited;

  criaGruposObs();


//  btFecharTeclado.Caption :='Fechar '+#10+'o'+#10+'Teclado'+#10+' virtual';
//  btTecladoVirtual.Caption := 'Teclado '+#13#10+'virtual';
  strObsProduto := '';
  frm_principal.obsSaborPizza:='';
  frm_principal.obsLancamento:='';


  dm.qryCsObservacoes.Active := false;
  dm.qryCsObservacoes.sql.Clear;
  dm.qryCsObservacoes.SQL.add(' select * from observacoes_padrao order by descricao');
  dm.qryCsObservacoes.Active := true;
  dm.qryCsObservacoes.First;

  dm.tbObservacoesTemp.EmptyTable;
  dm.tbObservacoesTemp.Active := true;


//  criarObservacoes;
//  memo_obs.SetFocus;

end;

procedure Tfrm_obs_lancamento_caixa.memo_obsKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  IF KEY = VK_RETURN THEN bt_selecionar.Click
end;


procedure Tfrm_obs_lancamento_caixa.criarObservacoes();
var
 q : TIBquery;
 ckb : TCheckBox;
 top_c, left_c : integer;
 qtBt : integer;
 letraAnterior : string;
begin
 q := TIBquery.create(self);
 q.database:= dm.dbrestaurante;
 q.transaction:= dm.transacao;
{
 q.Active:=false;
 q.sql.clear;
 q.sql.add('select * from observacoes_padrao order by descricao');
 q.Active:=true;
 top_c:=1;
 left_c:=2;
 qtBt:=0;
 ckb0.Destroy;
 ckb0.Free;
 ScrollBox1.Repaint;

 letraAnterior :=Copy(q.fieldbyname('descricao').value,0,1);
 while not q.Eof do
 begin

     if (Copy(q.fieldbyname('descricao').value,0,1) <> letraAnterior) then
     begin
       letraAnterior :=Copy(q.fieldbyname('descricao').value,0,1);
       top_c:= top_c +35;
       ScrollBox1.Repaint;
       Self.Repaint;

     end;


    ckb := TCheckBox.Create(Self);
    CKB.Parent := ScrollBox1;
    ckb.Name:=  'ckb'+Inttostr(qtBt);
    CKB.Left := left_c;
    CKB.Top := top_c;
    ckb.OnEnter:= Edit1.OnEnter;
    ckb.OnExit:= Edit1.OnExit;
    ckb.Color:=clWhite;

    ckb.OnClick := ckb0.OnClick;
    Font.Charset := DEFAULT_CHARSET;

    Font.Height := -25;
    Font.Name := 'MS Sans Serif';
    Font.Style := [];
    ParentFont := False;
    ParentColor := False;
    CKB.Width := 265;
    CKB.Height := 18;
    ckb.Caption:= q.fieldbyname('descricao').value;
    Self.Repaint;





    if (top_c >= 460) then
     begin
      top_c:=1;
      left_c:=left_c+ 270;
     end
    else
     begin
      top_c:=top_c+37;
     end;
    qtBt:=qtBt+1;
    q.Next;


 end;

 q.Active:=false;
 FreeAndNil(q);

 }

end;

procedure Tfrm_obs_lancamento_caixa.criarSelecao();
var
 i : integer;
 obs : string;
begin
  memo_obs.Clear;


  dm.tbObservacoesTemp.First;
  while not dm.tbObservacoesTemp.Eof do
   begin
      obs:=obs+dm.tbObservacoesTempdescricao.Value + ',';
      dm.tbObservacoesTemp.Next;
   end;
   memo_obs.Lines.add(obs);
   frm_principal.obsSaborPizza := frm_principal.obsSaborPizza+obs+frm_principal.obsLancamento;
end;

procedure Tfrm_obs_lancamento_caixa.SpeedButton1Click(Sender: TObject);
var
 str : string;
begin
  inherited;
  if  sender is TSpeedButton  then
   begin
      str:= ((sender as TSpeedButton ).Caption);
   end;
  dm.qryCsObservacoes.Active := false;
  dm.qryCsObservacoes.SQL.Clear;
  dm.qryCsObservacoes.SQL.add('select * from observacoes_padrao where descricao like '+Quotedstr(str+'%'));
  dm.qryCsObservacoes.SQL.add(' order by descricao');
  dm.qryCsObservacoes.Active:=true;

end;

procedure Tfrm_obs_lancamento_caixa.SpeedButton27Click(Sender: TObject);
begin
  inherited;
  dm.qryCsObservacoes.Active := false;
  dm.qryCsObservacoes.SQL.Clear;
  dm.qryCsObservacoes.SQL.add('select * from observacoes_padrao where descricao like '+Quotedstr('%'+'COM'+'%'));
  dm.qryCsObservacoes.SQL.add('OR descricao like '+Quotedstr('%'+'C/'+'%'));
  dm.qryCsObservacoes.SQL.add(' order by descricao');
  dm.qryCsObservacoes.Active:=true;

end;

procedure Tfrm_obs_lancamento_caixa.SpeedButton28Click(Sender: TObject);
begin
  inherited;
  dm.qryCsObservacoes.Active := false;
  dm.qryCsObservacoes.SQL.Clear;
  dm.qryCsObservacoes.SQL.add('select * from observacoes_padrao where descricao like '+Quotedstr('%'+'SEM'+'%'));
  dm.qryCsObservacoes.SQL.add('OR descricao like '+Quotedstr('%'+'S/'+'%'));
  dm.qryCsObservacoes.SQL.add(' order by descricao');
  dm.qryCsObservacoes.Active:=true;

end;

procedure Tfrm_obs_lancamento_caixa.SpeedButton29Click(Sender: TObject);
begin
  inherited;
  dm.qryCsObservacoes.Active := false;
  dm.qryCsObservacoes.SQL.Clear;
  dm.qryCsObservacoes.SQL.add('select * from observacoes_padrao where descricao like '+Quotedstr('%'+'ADICIONAR'+'%'));
  dm.qryCsObservacoes.SQL.add('OR descricao like '+Quotedstr('%'+'ADD'+'%'));
  dm.qryCsObservacoes.SQL.add('OR descricao like '+Quotedstr('%'+'AD.'+'%'));
  dm.qryCsObservacoes.SQL.add(' order by descricao');
  dm.qryCsObservacoes.Active:=true;

end;

procedure Tfrm_obs_lancamento_caixa.SpeedButton37Click(Sender: TObject);
begin
  inherited;
  dm.qryCsObservacoes.Prior;
  dm.qryCsObservacoes.Prior;
  dm.qryCsObservacoes.Prior;
  dm.qryCsObservacoes.Prior;
  dm.qryCsObservacoes.Prior;
  dm.qryCsObservacoes.Prior;
  dm.qryCsObservacoes.Prior;
  dm.qryCsObservacoes.Prior;
  dm.qryCsObservacoes.Prior;
  dm.qryCsObservacoes.Prior;
  dm.qryCsObservacoes.Prior;
  dm.qryCsObservacoes.Prior;
  
end;


procedure Tfrm_obs_lancamento_caixa.SpeedButton38Click(Sender: TObject);
begin
  inherited;
  dm.qryCsObservacoes.Next;
  dm.qryCsObservacoes.Next;
  dm.qryCsObservacoes.Next;
  dm.qryCsObservacoes.Next;
  dm.qryCsObservacoes.Next;
  dm.qryCsObservacoes.Next;
  dm.qryCsObservacoes.Next;
  dm.qryCsObservacoes.Next;
  dm.qryCsObservacoes.Next;
  dm.qryCsObservacoes.Next;
  dm.qryCsObservacoes.Next;
  dm.qryCsObservacoes.Next;
  
end;

procedure Tfrm_obs_lancamento_caixa.DBGrid2DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  inherited;


if odd(dm.qryCsObservacoes.RecNo) then
 begin
//   DBGrid2.Canvas.Brush.Color:= clSkyBlue;
//   DBGrid2.Font.Color := clWhite;
 end
else
 begin
//01
//  DBGrid2.Canvas.Brush.Color:= clwhite;
//DBGrid2.Font.Color := clBlack;
 end;

TDbGrid(Sender).Canvas.font.Color:= clBlack;
TDbGrid(Sender).DefaultDrawDataCell(Rect, TDbGrid(Sender).columns[datacol].field, State);


TDbGrid(Sender).Canvas.font.Color:= clBlack; //aqui é definida a cor da fonte


if gdSelected in State then
with (Sender as TDBGrid).Canvas do
begin
  Brush.Color:=clRed; //aqui é definida a cor do fundo
  Font.Color := clWhite;
  Font.Size :=   Font.Size + 2;
  Font.Style:= [fsbold];
  FillRect(Rect);
end;

TDbGrid(Sender).DefaultDrawDataCell(Rect, TDbGrid(Sender).columns[datacol].field, State);

end;

procedure Tfrm_obs_lancamento_caixa.SpeedButton30Click(Sender: TObject);
begin
  inherited;
  dm.qryCsObservacoes.Active := false;
  dm.qryCsObservacoes.SQL.Clear;
  dm.qryCsObservacoes.SQL.add('select * from observacoes_padrao ');
  dm.qryCsObservacoes.SQL.add(' order by descricao');
  dm.qryCsObservacoes.Active:=true;

end;

procedure Tfrm_obs_lancamento_caixa.adicionaObs(Sender: TObject);
var
x : integer;
achou : Boolean;

begin
  inherited;
  x:=0;
  achou := false;
                                  
  if not dm.tbObservacoesTemp.Locate('descricao',((sender as TJvImgBtn).Caption) ,[]) then
   begin
    dm.tbObservacoesTemp.Append;
    dm.tbObservacoesTempdescricao.Value:=  ((sender as TJvImgBtn).Caption);
    dm.tbObservacoesTemp.Post;
     while ( (x < ComponentCount-1) and (achou= False)  ) do
     begin
      if  Components[x].ClassName='TJvImgBtn' then
       begin
         if  (Trim(copy( (components[x] as TJvImgBtn).Name ,0,4))  = 'btOb') then
          begin
           if ( (components[x] as TJvImgBtn).Visible  = False) then
            begin
             (components[x] as TJvImgBtn).Caption :=  ((sender as TJvImgBtn).Caption);
             (components[x] as TJvImgBtn).Visible := True;
             achou := true;
            end;
          end;
       end;
      x:= x + 1;
     end;
   end;

end;

procedure Tfrm_obs_lancamento_caixa.DBGrid3DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  inherited;


if odd(dm.tbObservacoesTemp.RecNo) then
 begin
//   DBGrid3.Canvas.Brush.Color:= clSkyBlue;
 end
else
 begin
//  DBGrid3.Canvas.Brush.Color:= clwhite;
//DBGrid2.Font.Color := clBlack;
 end;

TDbGrid(Sender).Canvas.font.Color:= clBlack;
TDbGrid(Sender).DefaultDrawDataCell(Rect, TDbGrid(Sender).columns[datacol].field, State);
TDbGrid(Sender).Canvas.font.Color:= clBlack; //aqui é definida a cor da fonte


if gdSelected in State then
with (Sender as TDBGrid).Canvas do
begin
  Brush.Color:=clRed; //aqui é definida a cor do fundo
  Font.Color := clWhite;
  Font.Size :=   Font.Size + 2;
  Font.Style:= [fsbold];
  FillRect(Rect);
end;

TDbGrid(Sender).DefaultDrawDataCell(Rect, TDbGrid(Sender).columns[datacol].field, State);

end;

procedure Tfrm_obs_lancamento_caixa.memo_obs_complementarDblClick(
  Sender: TObject);
begin
  inherited;
  memo_obs_complementar.SetFocus;

  if not tecladoAberto then
   begin
    pnTeclado.Top := 50;
    pnTeclado.Left := 24;
    pnTeclado.Visible := true;
    tecladoAberto :=true;
   end
  else
   begin
    pnTeclado.Visible := false;
    tecladoAberto := false;
   end;

end;

procedure Tfrm_obs_lancamento_caixa.btFecharTecladoClick(Sender: TObject);
begin
  inherited;

  pnTeclado.Visible :=false;
  tecladoAberto:=false;

end;

procedure Tfrm_obs_lancamento_caixa.SpeedButton40Click(Sender: TObject);
begin
  inherited;
  if MessageDlg('Apagar observação ?',mtInformation,[mbYes,mbNo],0) = mrYes then
     dm.tbObservacoesTemp.Delete;
end;




procedure Tfrm_obs_lancamento_caixa.criaGruposObs();
var
  x,x2 : integer;
 pagina : TComponent;
begin
  dm.qryauxiliar.Active := false;
  dm.qryauxiliar.SQL.clear;
  dm.qryauxiliar.sql.add('select * from grupos_observacao');
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

             dm.qryauxiliar2.Active := false;
             dm.qryauxiliar2.SQL.Clear;
             dm.qryauxiliar2.SQL.add(' select obs.cod_obs, obs.descricao  from observacoes_padrao obs ');
             dm.qryauxiliar2.SQL.add('     where obs.cod_grupo_obs ='+Quotedstr(dm.qryauxiliar.fieldbyname('codigo').value));
             dm.qryauxiliar2.SQL.add('     order by obs.descricao ');
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
             end;

             x2:=0;
             while ( (x2 < ComponentCount -1) and (dm.qryauxiliar2.Eof = false) ) do
               begin
                if  Components[x2].ClassName='TJvImgBtn' then
                 begin
                      if (Components[x2].GetParentComponent = pagina ) then
                       begin
                         (components[x2] as TJvImgBtn).Name := 'pdt'+dm.qryauxiliar2.fieldbyname('cod_obs').Value;
                         (components[x2] as TJvImgBtn).Caption := dm.qryauxiliar2.fieldbyname('descricao').Value;
//01
//                         (components[x2] as TJvImgBtn).OnClick := adicionaObs(sender);
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
     x := x + 1;

   end;

end;




procedure Tfrm_obs_lancamento_caixa.btgp1Click(Sender: TObject);
var
 indice: integer;
begin
  inherited;

inherited;
  indice := StrToInt(Trim( copy((sender as TJvImgBtn).Name,5,5)));
  pgProdutos.ActivePageIndex:=indice-1;
end;

procedure Tfrm_obs_lancamento_caixa.SpeedButton4Click(Sender: TObject);
begin
  inherited;
  if  pgGrupos.ActivePageIndex > 0 then
  pgGrupos.ActivePageIndex :=   pgGrupos.ActivePageIndex -1;

end;

procedure Tfrm_obs_lancamento_caixa.SpeedButton5Click(Sender: TObject);
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

procedure Tfrm_obs_lancamento_caixa.btOb1Click(Sender: TObject);
begin
  inherited;
  dm.tbObservacoesTemp.Locate('descricao',((sender as TJvImgBtn).Caption) ,[]);
  dm.tbObservacoesTemp.delete;
  (sender as TJvImgBtn).Visible := False;


end;

end.

