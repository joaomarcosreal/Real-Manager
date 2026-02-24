unit uuSelecionaTabelaPrecos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  uu_modelo_Vazio, Vcl.Menus, JvActionsEngine, JvControlActions, Vcl.ActnList,
  System.Actions, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls, cxGraphics,
  cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxStyles,
  cxDataStorage, cxEdit, cxNavigator,
  Data.DB, cxDBData, cxGridLevel, cxClasses,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxGrid, AdvGlassButton, cxCustomData, cxFilter, cxData, dxDateRanges,
  dxScrollbarAnnotations;

type
  TfrmSelecionaTabelaPrecos = class(Tfrm_modelo_vazio)
    pnTitulo: TPanel;
    lbTitulo: TLabel;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1DESCRICAO: TcxGridDBColumn;
    cxStyleRepository1: TcxStyleRepository;
    cxStyle2: TcxStyle;
    stlRegistro: TcxStyle;
    Panel2: TPanel;
    bt_cancelar: TAdvGlassButton;
    bt_selecionar: TAdvGlassButton;
    procedure FormCreate(Sender: TObject);
    procedure bt_cancelarClick(Sender: TObject);
    procedure bt_selecionarClick(Sender: TObject);
    procedure cxGrid1DBTableView1CellDblClick(Sender: TcxCustomGridTableView; ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton; AShift: TShiftState; var AHandled: Boolean);
    procedure cxGrid1DBTableView1FocusedRecordChanged(Sender: TcxCustomGridTableView; APrevFocusedRecord, AFocusedRecord: TcxCustomGridRecord; ANewItemRecordFocusingChanged: Boolean);
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    { Private declarations }
    LPodeFecharJanela: boolean;
  public
    { Public declarations }
  end;

var
  frmSelecionaTabelaPrecos: TfrmSelecionaTabelaPrecos;

implementation

uses
  uu_data_module;

{$R *.dfm}

procedure TfrmSelecionaTabelaPrecos.FormCreate(Sender: TObject);
begin
  inherited;
  dm.qryTabelasDePrecos.Active := false;
  dm.qryTabelasDePrecos.sql.Clear;
  dm.qryTabelasDePrecos.sql.add('select * from tabelas_preco where ativa=1');
  dm.qryTabelasDePrecos.Active := true;

  LPodeFecharJanela := false;
end;

procedure TfrmSelecionaTabelaPrecos.bt_cancelarClick(Sender: TObject);
begin
  inherited;
  LPodeFecharJanela := true;
  close;
end;

procedure TfrmSelecionaTabelaPrecos.bt_selecionarClick(Sender: TObject);
begin
  inherited;
  dm.setTabelaPrecoAtual(dm.qryTabelasDePrecos.fieldbyname('codigo').value);
  LPodeFecharJanela := true;
  close;
end;

procedure TfrmSelecionaTabelaPrecos.cxGrid1DBTableView1CellDblClick(Sender: TcxCustomGridTableView; ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton; AShift: TShiftState; var AHandled: Boolean);
begin
  inherited;
  bt_selecionar.Click;
end;

procedure TfrmSelecionaTabelaPrecos.cxGrid1DBTableView1FocusedRecordChanged(Sender: TcxCustomGridTableView; APrevFocusedRecord, AFocusedRecord: TcxCustomGridRecord; ANewItemRecordFocusingChanged: Boolean);
begin
  inherited;
  if AFocusedRecord <> nil then
  begin

  end;
end;

procedure TfrmSelecionaTabelaPrecos.FormActivate(Sender: TObject);
begin
  inherited;
  cxGrid1.SetFocus;
end;

procedure TfrmSelecionaTabelaPrecos.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  dm.qryTabelasDePrecos.Active := false;
end;

procedure TfrmSelecionaTabelaPrecos.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  inherited;
  CanClose := LPodeFecharJanela;
end;

procedure TfrmSelecionaTabelaPrecos.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  inherited;
  if Key = VK_RETURN then
  begin
    bt_selecionar.Click;
  end;
end;

end.

