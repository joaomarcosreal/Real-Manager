unit uuAssociaProdutoFornecedor;

interface

uses
  Windows, Messages, pcnConversaoNFe, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, Dialogs, uu_modelo_Vazio, StdCtrls, DBCtrls, ExtCtrls,
  Buttons, IBX.IBQuery, ibx.ibdatabase, RxCurrEdit, RxToolEdit, JvActionsEngine,
  JvControlActions, Vcl.ActnList, System.Actions, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxStyles, cxDataStorage, cxEdit,
  cxNavigator, Data.DB, cxDBData, Vcl.Menus, cxClasses, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid, Vcl.Mask;

type
  TfrmAssociaProdutoFornecedor = class(Tfrm_modelo_vazio)
    Panel2: TPanel;
    ed_cod_item: TEdit;
    Label9: TLabel;
    bt_pesq_item_estoque_cod: TSpeedButton;
    Panel5: TPanel;
    ed_desc_item: TEdit;
    Label7: TLabel;
    Label8: TLabel;
    Label10: TLabel;
    ed_unidade_item: TEdit;
    Label12: TLabel;
    edCfopEntrada: TEdit;
    edCSTEntrada: TEdit;
    lbl1: TLabel;
    edtFatorConversao: TCurrencyEdit;
    pnl1: TPanel;
    lbl2: TLabel;
    pnl2: TPanel;
    btn1: TBitBtn;
    btn2: TBitBtn;
    pnl3: TPanel;
    shp1: TShape;
    lbl4: TLabel;
    pnl4: TPanel;
    lbl5: TLabel;
    lbl7: TLabel;
    lbl8: TLabel;
    lbl9: TLabel;
    lbl10: TLabel;
    lbl3: TLabel;
    edtCodProdFornecedor: TEdit;
    edtDescProdFornecedor: TEdit;
    edtCFOPFornecedor: TEdit;
    edtCSTFornecedor: TEdit;
    edtNCMFornecedor: TEdit;
    edtNomeFornecedor: TEdit;
    edtCnpjFornecedor: TEdit;
    btn3: TSpeedButton;
    rg1: TRadioGroup;
    edtQtdeComercial: TCurrencyEdit;
    lbl11: TLabel;
    lbl12: TLabel;
    edtUnidadeComercial: TEdit;
    edtPrecoComercial: TCurrencyEdit;
    lbl6: TLabel;
    edtQtdeTributada: TCurrencyEdit;
    lbl13: TLabel;
    edtUnidadeTributada: TEdit;
    lbl14: TLabel;
    edtPrecoTributada: TCurrencyEdit;
    lbl15: TLabel;
    rg2: TRadioGroup;
    SpeedButton1: TSpeedButton;
    procedure btn2Click(Sender: TObject);
    function verificaValidadeLancamentoItemCompra(): boolean;
    procedure btn1Click(Sender: TObject);
    procedure btn3Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
  private
    { Private declarations }
    LChaveUltimaNotaFiscal: string;
    LXMLNotaCarregada: string;
    procedure ExibirXMLNotaCarregada;
    procedure CarregarNFE(AXML: string);
    procedure ExibirDadosProduto;

  public
    { Public declarations }
  end;

var
  frmAssociaProdutoFornecedor: TfrmAssociaProdutoFornecedor;

implementation

uses
  uu_produtos, uu_data_module, uu_frm_principal;

{$R *.dfm}

procedure TfrmAssociaProdutoFornecedor.FormCreate(Sender: TObject);
begin
  inherited;
  LChaveUltimaNotaFiscal := dm.qryComparaProdutosNFEULTIMA_CHAVE.Value;
  LXMLNotaCarregada := dm.getXMLNFEDestinada(LChaveUltimaNotaFiscal);
  CarregarNFE(LXMLNotaCarregada);
end;

procedure TfrmAssociaProdutoFornecedor.ExibirDadosProduto();
begin

end;

procedure TfrmAssociaProdutoFornecedor.CarregarNFE(AXML: string);
begin
  dm.parametrizaAcbrNFE(moNFe, False, false);
  dm.ACBrNFe1.NotasFiscais.Clear;
  dm.ACBrNFe1.NotasFiscais.LoadFromString(AXML);
end;

procedure TfrmAssociaProdutoFornecedor.ExibirXMLNotaCarregada;
begin
  dm.parametrizaAcbrNFE(moNFe, False, false);
  dm.ACBrNFe1.NotasFiscais.Clear;
  dm.ACBrNFe1.NotasFiscais.LoadFromString(LXMLNotaCarregada);
  dm.ACBrNFe1.NotasFiscais.Imprimir;
end;

procedure TfrmAssociaProdutoFornecedor.btn2Click(Sender: TObject);
begin
  inherited;
  close;
end;

function TfrmAssociaProdutoFornecedor.verificaValidadeLancamentoItemCompra(): boolean;
var
  cfop: string;
begin
  if verificaExistenciaItemEstoque(ed_cod_item.Text, 1) = false then
  begin
    showmessage('Código de ítem informado não existe!');
    ed_cod_item.Clear;
    result := false;
    exit;
  end;

  if (edtFatorConversao.Value <= 0) then
  begin
    Showmessage('Fator de conversão deve ser superior a zero!');
    edtFatorConversao.SetFocus;
    result := false;
    exit;
  end;

  if (verificaExistenciaCFOP(edCfopEntrada.Text) = false) then
  begin
    showmessage('Código Fiscal de Operação do ítem não é válido!');
    edCfopEntrada.SetFocus;
    result := false;
    exit;
  end;

  cfop := copy(edCfopEntrada.Text, 0, 1);
  if (cfop <> '1') and (cfop <> '2') and (cfop <> '3') then
  begin
    showmessage('CFOP informado não é um CFOP de entrada');
    edCfopEntrada.SetFocus;
    result := false;
    exit;
  end;

  if (verificaExistenciaCST(edCSTEntrada.Text) = false) then
  begin
    showmessage('Código da situação tributária do ítem não é válido!');
    edCSTEntrada.SetFocus;
    result := false;
    exit;
  end;

  Result := true;
end;

procedure TfrmAssociaProdutoFornecedor.btn1Click(Sender: TObject);
begin
  inherited;
  if verificaValidadeLancamentoItemCompra then
  begin
    dm.qryauxiliar.Active := false;
    dm.qryauxiliar.SQL.Clear;

    dm.qryauxiliar.sql.Add('update compara_produtos_nfe cp');
    dm.qryauxiliar.sql.Add('  set ');
    dm.qryauxiliar.sql.Add('  cp.cod_produto_interno =' + Quotedstr(ed_cod_item.Text) + ' ,');
    dm.qryauxiliar.sql.Add('  cp.cfop_entrada =' + Quotedstr(edCfopEntrada.Text) + ' ,');
    dm.qryauxiliar.sql.Add('  cp.cst_entrada =' + Quotedstr(edCSTEntrada.Text) + ' ,');
    dm.qryauxiliar.sql.Add('  cp.operacao =' + IntToStr(1) + ',');
    dm.qryauxiliar.sql.Add('  cp.fator_conversao =' + dm.TrocaVirgPPto(FloatToStr(edtFatorConversao.Value)) + ' ');

    dm.qryauxiliar.sql.Add('  where cp.cnpj_fornecedor =' + QuotedStr(edtCnpjFornecedor.Text));
    dm.qryauxiliar.sql.Add('   and cp.cod_prod_fornecedor =' + QuotedStr(edtCodProdFornecedor.Text));
    dm.qryauxiliar.ExecSQL;
    dm.transacao.Commit;
    dm.transacao.Active := false;
    dm.transacao.Active := true;
    showmessage('Atualização de associação realizada!');
    close;

  end;

end;

procedure TfrmAssociaProdutoFornecedor.btn3Click(Sender: TObject);
var
  LChaveNFE: string;
begin
  inherited;
  LChaveNFE := dm.qryComparaProdutosNFEULTIMA_CHAVE.Value;
  dm.VisualizarDanfeCompra(LChaveNFE);

end;

procedure TfrmAssociaProdutoFornecedor.FormActivate(Sender: TObject);
begin
  inherited;
  edCfopEntrada.Text := '1102';
  edCstEntrada.text := '000';

end;

procedure TfrmAssociaProdutoFornecedor.SpeedButton1Click(Sender: TObject);
begin
  inherited;
  Application.CreateForm(Tfrm_produtos, frm_produtos);
  frm_produtos.ShowModal;
  frm_produtos.free;
  dm.transacao.Active := false;
  dm.transacao.Active := true;
  ed_cod_item.Text := string_auxiliar;
  ed_cod_item.SetFocus;
end;

end.

