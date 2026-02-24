unit uuBaixasManuais;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  uu_modelo_Vazio, Advglassbutton, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls,
  Data.DB, AdvDateTimePicker, cxGraphics, cxControls, cxDBLookupEdit,
  cxDBLookupComboBox, cxStyles, cxDataStorage, cxGridLevel, cxClasses,
  cxGridDBTableView, cxGrid, CurvyControls, uuDMInventarios, JvValidateEdit,
  Vcl.Menus, uu_data_module, uu_frm_principal, cxLookAndFeels,
  cxLookAndFeelPainters, cxCustomData, cxEdit, cxNavigator,
  cxDBData, cxContainer, Vcl.ComCtrls, cxTextEdit, cxMaskEdit,
  cxDropDownEdit, cxGridCustomTableView, cxGridTableView,
  cxGridCustomView, JvExStdCtrls, JvEdit, JvActionsEngine, JvControlActions,
  Vcl.ActnList, System.Actions, cxFilter, cxData, dxDateRanges,
  dxScrollbarAnnotations, cxLookupEdit;

type
  TfrmBaixasManuais = class(Tfrm_modelo_vazio)
    frmCorpo: TPanel;
    frmTopo: TPanel;
    Panel1: TPanel;
    Label8: TLabel;
    Label10: TLabel;
    Label1: TLabel;
    Panel3: TPanel;
    Label3: TLabel;
    AdvGlassButton1: TAdvGlassButton;
    AdvGlassButton3: TAdvGlassButton;
    Label4: TLabel;
    AdvGlassButton2: TAdvGlassButton;
    edDataBaixa: TAdvDateTimePicker;
    cbHistoricoBaixaEstoque: TcxLookupComboBox;
    edEstoqueApurado: TJvValidateEdit;
    Label2: TLabel;
    memoObservacoes: TMemo;
    PopupMenu1: TPopupMenu;
    E1: TMenuItem;
    Label12: TLabel;
    ed_cod_item: TEdit;
    bt_pesq_item_estoque_cod: TSpeedButton;
    Panel2: TPanel;
    ed_desc_item: TEdit;
    Label5: TLabel;
    gdProdutosBaixaDBTableView1: TcxGridDBTableView;
    gdProdutosBaixaLevel1: TcxGridLevel;
    gdProdutosBaixa: TcxGrid;
    gdProdutosBaixaDBTableView1COD_PRODUTO: TcxGridDBColumn;
    gdProdutosBaixaDBTableView1DESCRICAO: TcxGridDBColumn;
    gdProdutosBaixaDBTableView1QTDE_APURADA: TcxGridDBColumn;
    gdProdutosBaixaDBTableView1CUSTO: TcxGridDBColumn;
    gdProdutosBaixaDBTableView1TOTAL_ESTOQUE: TcxGridDBColumn;
    cxStyleRepository1: TcxStyleRepository;
    cxStyle1: TcxStyle;
    cxStyleRepository2: TcxStyleRepository;
    cxStyle2: TcxStyle;
    cbUnidadeMedidaBaixa: TcxLookupComboBox;
    Label6: TLabel;
    Label7: TLabel;
    gdProdutosBaixaDBTableView1DescUnBaixa: TcxGridDBColumn;
    procedure FormDestroy(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure AdvGlassButton3Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure AdvGlassButton2Click(Sender: TObject);
    procedure Edit1KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure E1Click(Sender: TObject);
    procedure AdvGlassButton1Click(Sender: TObject);
    procedure Edit1Enter(Sender: TObject);
    procedure bt_pesq_grupoClick(Sender: TObject);
  private
    function verificaValidadeLancamento: boolean;
    procedure buscaUnidadesMedidaProduto(codProduto: string);
    procedure adicionarProdutoBaixa;
    procedure SalvarBaixa;
    function verificaValidadeBaixa: boolean;



    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmBaixasManuais: TfrmBaixasManuais;

implementation

{$R *.dfm}

procedure TfrmBaixasManuais.AdvGlassButton1Click(Sender: TObject);
begin
  inherited;
  if verificaValidadeBaixa then
    SalvarBaixa();
end;

function TfrmBaixasManuais.verificaValidadeBaixa: boolean;
begin

  if dmInventarios.tbItensBaixaTemp.RecordCount <= 0 then
  begin
    ShowMessage('Nenhum produto adicionado!');
    result := false;
    exit;
  end;

  if edDataBaixa.Date < (data_do_sistema - 3) then
  begin
    showmessage('Data da baixa não pode ser menor do que a data do sistema em mais de 3 dias');
    result := false;
    exit;
  end;

  result := true;
end;

procedure TfrmBaixasManuais.AdvGlassButton2Click(Sender: TObject);
begin
  inherited;

  if verificaValidadeLancamento then
  begin
    adicionarProdutoBaixa();
//     edValorUnitario.Value := 0;
    edEstoqueApurado.Value := 0;
    ed_desc_item.Clear;
    ed_cod_item.Clear;
    ed_cod_item.SetFocus;
  end;
end;

procedure TfrmBaixasManuais.AdvGlassButton3Click(Sender: TObject);
begin
  inherited;
  close;
end;

procedure TfrmBaixasManuais.bt_pesq_grupoClick(Sender: TObject);
begin
  inherited;
  showmessage(string_auxiliar);
end;

procedure TfrmBaixasManuais.E1Click(Sender: TObject);
begin
  inherited;
  if (MessageDlg('Confirma exclusão do produto ?', mtConfirmation, [mbYes, mbNo], 0) = MrYes) then
  begin
    gdProdutosBaixaDBTableView1.DataController.DeleteFocused;
//      dmInventarios.calculaTotaisInventario(lbTotalSobras,lbTotalFaltas, lbTotalInventarios);

  end;

end;

procedure TfrmBaixasManuais.buscaUnidadesMedidaProduto(codProduto: string);
begin
  dmInventarios.qryUnidadesMedidaProduto.Active := false;
  dmInventarios.qryUnidadesMedidaProduto.ParamByName('codProduto').Value := codProduto;
  dmInventarios.qryUnidadesMedidaProduto.Active := true;
  cbUnidadeMedidaBaixa.EditValue := dmInventarios.qryUnidadesMedidaProduto.fieldbyname('cod_unidade').value;

end;

procedure TfrmBaixasManuais.Edit1Enter(Sender: TObject);
begin
  inherited;
  if Sender is TcxLookupComboBox then
  begin
    if ((Sender as TcxLookupComboBox).Name = 'cbProdutoEstoque') then
    begin
      (Sender as TcxLookupComboBox).SelectAll;
    end;
  end;

  if Sender is TCustomEdit then
  begin
    if ((Sender as TCustomEdit).Name = 'edEstoqueApurado') then
    begin
      dmInventarios.qryCsProdutos.Locate('COD_PRODUTO', ed_cod_item.Text);
      buscaUnidadesMedidaProduto(ed_cod_item.Text);
      edEstoqueApurado.Value := 0;
//        edValorUnitario.value   := dmInventarios.qryCsProdutos.FieldByName('valor_custo').Value;
    end;
  end;

end;

procedure TfrmBaixasManuais.adicionarProdutoBaixa();
begin

  dmInventarios.qryUnidadesMedidaProduto.Locate('COD_UNIDADE', cbUnidadeMedidaBaixa.EditValue);
  dmInventarios.tbItensBaixaTemp.Append;
  dmInventarios.tbItensBaixaTempCOD_PRODUTO.Value := dmInventarios.qryCsProdutosCOD_PRODUTO.Value;
  dmInventarios.tbItensBaixaTempDESCRICAO.Value := dmInventarios.qryCsProdutosDESCRICAO.Value;
  dmInventarios.tbItensBaixaTempCOD_UNIDADE_BAIXA.Value := dmInventarios.qryUnidadesMedidaProdutoCOD_UNIDADE.Value;
  dmInventarios.tbItensBaixaTempDESC_UNIDADE_BAIXA.Value := dmInventarios.qryUnidadesMedidaProdutoDESCRICAO.Value;
  dmInventarios.tbItensBaixaTempQTDE_APURADA.Value := edEstoqueApurado.Value;
  dmInventarios.tbItensBaixaTempCUSTO.Value := dmInventarios.qryCsProdutosVALOR_CUSTO.Value;

  dmInventarios.tbItensBaixaTempTOTAL_ESTOQUE.Value := dmInventarios.tbItensBaixaTempQTDE_APURADA.Value * dmInventarios.tbItensBaixaTempCUSTO.Value;
  dmInventarios.tbItensBaixaTemp.Post;

end;

function TfrmBaixasManuais.verificaValidadeLancamento(): boolean;
begin
  if edEstoqueApurado.Value < 0 then
  begin
    showmessage('Quantidade da baixa não pode ser negativa ou igual a zero ');
    result := false;
    exit;
  end;
  result := true;
end;

procedure TfrmBaixasManuais.SalvarBaixa();
var
  codigoBaixa: LargeInt;
  idItemBaixa: LargeInt;
  codItemIventario: integer;
  qtdeBaixa: double;
begin

  try
    try
      codigoBaixa := dm.geraID('G_BAIXAS_ESTOQUE');

      dmInventarios.tbItensBaixaTemp.First;
      while not dmInventarios.tbItensBaixaTemp.eof do
      begin

        codItemIventario := dm.geraID('g_id_itens_baixas_estoque');
        qtdeBaixa := dmInventarios.getParametroUnidade(dmInventarios.tbItensBaixaTempCOD_UNIDADE_BAIXA.Value) * dmInventarios.tbItensBaixaTempQTDE_APURADA.Value;
        dmInventarios.qryItensBaixaEstoque.active := true;
        dmInventarios.qryItensBaixaEstoque.Append;
        dmInventarios.qryItensBaixaEstoqueCOD_BAIXA.Value := formatfloat('000000', codigoBaixa);
        dmInventarios.qryItensBaixaEstoqueID.value := codItemIventario;
        dmInventarios.qryItensBaixaEstoqueCOD_ORIGEM.Value := 1;
        dmInventarios.qryItensBaixaEstoqueCOD_TIPO.Value := cbHistoricoBaixaEstoque.EditValue;
        dmInventarios.qryItensBaixaEstoqueCOD_ITEM.Value := dmInventarios.tbItensBaixaTempCOD_PRODUTO.Value;
        dmInventarios.qryItensBaixaEstoqueCOD_UNIDADE.Value := dmInventarios.tbItensBaixaTempCOD_UNIDADE_BAIXA.Value;
        dmInventarios.qryItensBaixaEstoqueQUANTIDADE.Value := qtdeBaixa;
        dmInventarios.qryItensBaixaEstoqueCUSTO_UNITARIO_ITEM.Value := dmInventarios.tbItensBaixaTempCUSTO.Value;
        dmInventarios.qryItensBaixaEstoqueDATA.Value := edDataBaixa.Date;
        dmInventarios.qryItensBaixaEstoqueHORA.Value := Now;
        dmInventarios.qryItensBaixaEstoqueOBSERVACOES.Value := memoObservacoes.Lines.Text;
        dmInventarios.qryItensBaixaEstoqueUSUARIO.Value := nome_usuario;
        dmInventarios.qryItensBaixaEstoqueESTOQUE_ANTERIOR.Value := dmInventarios.getEstoqueAtualProduto(dmInventarios.tbItensBaixaTempCOD_PRODUTO.Value);
        dmInventarios.qryItensBaixaEstoqueESTOQUE_ATUALIZADO.Value := dmInventarios.qryItensBaixaEstoqueESTOQUE_ANTERIOR.Value - qtdeBaixa;
        dmInventarios.qryItensBaixaEstoque.Post;

        dmInventarios.AtualizaEstoqueProduto(dmInventarios.tbItensBaixaTempCOD_PRODUTO.Value, qtdeBaixa);
        dmInventarios.tbItensBaixaTemp.Next;
      end;
      Showmessage('Baixa de estoque efetuada!');
      close;

    finally
      dmInventarios.qryCsProdutos.Active := false;
      dmInventarios.qryCsProdutos.Active := true;
    end;
  except
    on E: Exception do
    begin
      dm.exibe_painel_erro('Erro ao gravar o inventário! ' + E.Message, 'Ok');
      ////dm.adicionalog('Erro ao gravar o inventário' +E.Message);
      exit;
    end;
  end;

end;

procedure TfrmBaixasManuais.Edit1KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
var
  codigo: string;
begin
  inherited;
  if Key = VK_RETURN then
  begin

    if Sender is TcxLookupComboBox then
    begin
      codigo := (Sender as TcxLookupComboBox).Properties.ListSource.DataSet.FieldByName((Sender as TcxLookupComboBox).Properties.KeyFieldNames).Value;
      (Sender as TcxLookupComboBox).EditValue := codigo;
    end;
  end;

end;

procedure TfrmBaixasManuais.FormActivate(Sender: TObject);
begin
  inherited;
  edDataBaixa.Date := now;
  edDataBaixa.SetFocus;
end;

procedure TfrmBaixasManuais.FormCreate(Sender: TObject);
begin
  inherited;
  dmInventarios := TdmInventarios.Create(self);
  dmInventarios.tbItensBaixaTemp.Active := false;
  dmInventarios.tbItensBaixaTemp.Active := true;
  dmInventarios.qryHistoricosBaixaEstoque.Active := false;
  dmInventarios.qryHistoricosBaixaEstoque.Active := true;
  cbHistoricoBaixaEstoque.EditValue := dmInventarios.qryHistoricosBaixaEstoque.fieldbyname('cod_tipo').Value;
  edDataBaixa.Date := now;

end;

procedure TfrmBaixasManuais.FormDestroy(Sender: TObject);
begin
  inherited;
  FreeAndNil(dmInventarios);
end;

end.

