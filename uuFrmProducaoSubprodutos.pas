unit uuFrmProducaoSubprodutos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uu_modelo_Vazio, cxGraphics, cxControls,

  JvDBGrid, AdvGlassButton,
  AdvDateTimePicker, Vcl.StdCtrls, Vcl.ExtCtrls,
  cxDBLookupComboBox, JvPageList,
  JvExControls,
  Vcl.Buttons,
  cxGridLevel,
  cxGridDBTableView, cxClasses, cxGrid,
  JvValidateEdit, cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit,
  Data.DB, cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage, cxNavigator,
  dxDateRanges, cxDBData, cxGridCustomTableView, cxGridTableView,
  cxGridCustomView, JvExStdCtrls, JvEdit, Vcl.Grids, Vcl.DBGrids, JvExDBGrids,
  Vcl.ComCtrls, cxTextEdit, cxMaskEdit, cxDropDownEdit, cxLookupEdit,
  cxDBLookupEdit, JvActionsEngine, JvControlActions, Vcl.ActnList,
  System.Actions;

type
  TfrmProducaoSubProdutos = class(Tfrm_modelo_vazio)
    JvPageList1: TJvPageList;
    pgListagem: TJvStandardPage;
    Panel1: TPanel;
    Label1: TLabel;
    Label14: TLabel;
    pgCadastro: TJvStandardPage;
    frmTopo: TPanel;
    Label8: TLabel;
    Label15: TLabel;
    cbHistoricoInventario: TcxLookupComboBox;
    RadioGroup1: TRadioGroup;
    RadioGroup2: TRadioGroup;
    Panel6: TPanel;
    Label13: TLabel;
    ed_desc_item: TEdit;
    Panel2: TPanel;
    Label2: TLabel;
    Label3: TLabel;
    edDataInicial: TAdvDateTimePicker;
    edDataFinal: TAdvDateTimePicker;
    Panel4: TPanel;
    bt_pesq_item_estoque_cod: TSpeedButton;
    Label5: TLabel;
    ed_cod_item: TEdit;
    RadioGroup3: TRadioGroup;
    Panel5: TPanel;
    bt_pesq_grupo: TSpeedButton;
    Label6: TLabel;
    ed_cod_grupo: TEdit;
    Panel7: TPanel;
    Label12: TLabel;
    ed_desc_grupo: TEdit;
    btPequisaInventarios: TAdvGlassButton;
    frmCorpo: TPanel;
    Label4: TLabel;
    JvDBGrid1: TJvDBGrid;
    AdvGlassButton4: TAdvGlassButton;
    btImprimirInventario: TAdvGlassButton;
    AdvGlassButton3: TAdvGlassButton;
    Panel3: TPanel;
    Label7: TLabel;
    Label9: TLabel;
    Panel8: TPanel;
    Label10: TLabel;
    Label11: TLabel;
    Label16: TLabel;
    edDataProducao: TAdvDateTimePicker;
    cbHistoricoProducao: TcxLookupComboBox;
    memoObservacoes: TMemo;
    Panel9: TPanel;
    Label17: TLabel;
    Label18: TLabel;
    Label20: TLabel;
    SpeedButton1: TSpeedButton;
    Label21: TLabel;
    AdvGlassButton2: TAdvGlassButton;
    edEstoqueApurado: TJvValidateEdit;
    Edit2: TEdit;
    Panel10: TPanel;
    Edit3: TEdit;
    gdProdutosInventario: TcxGrid;
    gdProdutosInventarioDBTableView1: TcxGridDBTableView;
    gdProdutosInventarioDBTableView1COD_PRODUTO: TcxGridDBColumn;
    gdProdutosInventarioDBTableView1DESCRICAO: TcxGridDBColumn;
    gdProdutosInventarioDBTableView1QTDE_SISTEMA: TcxGridDBColumn;
    gdProdutosInventarioDBTableView1Column1: TcxGridDBColumn;
    gdProdutosInventarioDBTableView1QTDE_APURADA: TcxGridDBColumn;
    gdProdutosInventarioDBTableView1CUSTO: TcxGridDBColumn;
    gdProdutosInventarioDBTableView1AJUSTE: TcxGridDBColumn;
    gdProdutosInventarioDBTableView1VALOR_AJUSTE: TcxGridDBColumn;
    gdProdutosInventarioDBTableView1TOTAL_ESTOQUE: TcxGridDBColumn;
    gdProdutosInventarioLevel1: TcxGridLevel;
    AdvGlassButton1: TAdvGlassButton;
    AdvGlassButton5: TAdvGlassButton;
    procedure AdvGlassButton3Click(Sender: TObject);
    procedure AdvGlassButton4Click(Sender: TObject);
  private
    procedure NovaProducao;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmProducaoSubProdutos: TfrmProducaoSubProdutos;

implementation



{$R *.dfm}

procedure TfrmProducaoSubProdutos.AdvGlassButton3Click(Sender: TObject);
begin
  inherited;
  close;
end;

procedure TfrmProducaoSubProdutos.AdvGlassButton4Click(Sender: TObject);
begin
  inherited;
  NovaProducao;
end;


procedure TfrmProducaoSubProdutos.NovaProducao;
begin
  pgCadastro.Show;

end;

end.
