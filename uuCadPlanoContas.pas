unit uuCadPlanoContas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uu_modelo_Vazio, Vcl.Menus,
  JvActionsEngine, JvControlActions, Vcl.ActnList, System.Actions, Vcl.StdCtrls,
  Vcl.Buttons, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit, cxNavigator,
  dxDateRanges, dxScrollbarAnnotations, Data.DB, cxDBData, cxClasses, Vcl.Mask,
  RxToolEdit, RxCurrEdit, cxGridLevel, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGridCustomView, cxGrid, AdvGlassButton, Vcl.ExtCtrls,
  JvPageList, JvExControls;

type
  TfrmCadPlanoContas = class(Tfrm_modelo_vazio)
    JvPageList1: TJvPageList;
    pgListagem: TJvStandardPage;
    Panel3: TPanel;
    AdvGlassButton3: TAdvGlassButton;
    AdvGlassButton4: TAdvGlassButton;
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1DBTableView1COD_UNIDADE: TcxGridDBColumn;
    cxGrid1DBTableView1DESCRICAO: TcxGridDBColumn;
    cxGrid1DBTableView1SIGLA: TcxGridDBColumn;
    cxGrid1DBTableView1PARAMETRO: TcxGridDBColumn;
    cxGrid1Level1: TcxGridLevel;
    Panel1: TPanel;
    pgCadastro: TJvStandardPage;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    edDescricao: TEdit;
    edSigla: TEdit;
    edValor: TCurrencyEdit;
    Panel2: TPanel;
    btVoltar: TAdvGlassButton;
    AdvGlassButton1: TAdvGlassButton;
    Panel4: TPanel;
    Label2: TLabel;
    cxStyleRepository1: TcxStyleRepository;
    cxStyle1: TcxStyle;
    cxStyle2: TcxStyle;
    PopupMenu1: TPopupMenu;
    Alterarunidade1: TMenuItem;
    Label1: TLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadPlanoContas: TfrmCadPlanoContas;

implementation

{$R *.dfm}

end.
