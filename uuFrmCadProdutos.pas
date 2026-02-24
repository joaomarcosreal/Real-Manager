unit uuFrmCadProdutos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  RealFramework, uuRealDialog, acbrutil, System.Generics.Collections, Dialogs,
  StdCtrls, ExtCtrls, Buttons, Grids, System.Types, System.StrUtils, DBGrids,
  ComCtrls, Mask, ImgList, CheckLst, uu_modelo_vazio, Data.DB, Vcl.Menus,
  ibx.Ibquery, DBCtrls, RxCurrEdit, uuDMCadProdutos, cxGraphics, cxControls,
  cxMaskEdit, cxDBLookupComboBox, cxLookAndFeels, cxLookAndFeelPainters,
  cxContainer, cxEdit, System.ImageList, cxTextEdit, cxDropDownEdit,
  cxLookupEdit, cxDBLookupEdit, RxToolEdit, JvExControls, JvButton,
  JvTransparentButton, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Comp.DataSet, FireDAC.Comp.Client, PngSpeedButton;

type
  TfrmCadProdutos = class(Tfrm_modelo_vazio)
    pic_dialog: TOpenDialog;
    ImageList1: TImageList;
    Panel1: TPanel;
    bt_gravar: TBitBtn;
    bt_cancelar: TBitBtn;
    bt_sair: TBitBtn;
    PopupMenu1: TPopupMenu;
    Excluirdaficha1: TMenuItem;
    PageControl1: TPageControl;
    TabSheet7: TTabSheet;
    rdTamanhoPizza: TRadioGroup;
    ckbPizza: TCheckBox;
    edPrecoPizzaBT: TCurrencyEdit;
    edPrecoPizzaPQ: TCurrencyEdit;
    edPrecoPizzaMD: TCurrencyEdit;
    edPrecoPizzaGD: TCurrencyEdit;
    edPrecoPizzaFM: TCurrencyEdit;
    Label51: TLabel;
    memoSabores: TMemo;
    BitBtn5: TBitBtn;
    TabSheet10: TTabSheet;
    BitBtn6: TBitBtn;
    pnInformacoesGerais: TPanel;
    Label3: TLabel;
    Label2: TLabel;
    bt_pesq_grupo: TSpeedButton;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label4: TLabel;
    Panel3: TPanel;
    ed_desc_grupo: TEdit;
    ed_descricao_produto: TEdit;
    ed_preco: TCurrencyEdit;
    ed_cod_grupo: TEdit;
    edParametroContabil: TCurrencyEdit;
    cbGrupoTouch: TcxLookupComboBox;
    cbLocalImpressao: TcxLookupComboBox;
    GroupBox1: TGroupBox;
    Label8: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    Label7: TLabel;
    Label14: TLabel;
    Label27: TLabel;
    cbAliquotaICMS: TcxLookupComboBox;
    edReducaoBase: TCurrencyEdit;
    ed_cefop_saidas: TEdit;
    edCstSaida: TEdit;
    edCest: TEdit;
    un_ecf: TEdit;
    bt_novo: TBitBtn;
    DBGrid1: TDBGrid;
    PopupMenu2: TPopupMenu;
    Adicionarclone1: TMenuItem;
    Excluirselecionado1: TMenuItem;
    TabSheet1: TTabSheet;
    Panel2: TPanel;
    Panel4: TPanel;
    bt_pesq_item_estoque_cod: TSpeedButton;
    Label17: TLabel;
    Label22: TLabel;
    Label5: TLabel;
    Panel5: TPanel;
    Label10: TLabel;
    ed_desc_item: TEdit;
    ed_cod_un_entrada: TEdit;
    ed_cod_item: TEdit;
    ed_qtd_item: TCurrencyEdit;
    btAdicionarFichaTecnica: TBitBtn;
    cbUnidadeFichaTecnica: TcxLookupComboBox;
    Panel6: TPanel;
    dbg_ficha_tec: TDBGrid;
    Panel7: TPanel;
    memoInstrucoesPreparo: TMemo;
    Label6: TLabel;
    btClonarFichaTecnica: TJvTransparentButton;
    E1: TMenuItem;
    TabSheet2: TTabSheet;
    ckbIncideServico: TCheckBox;
    ckbPrecoVariavel: TCheckBox;
    ckbVendaFracionada: TCheckBox;
    ckbCalculaQtde: TCheckBox;
    ckbImprimeFichaFF: TCheckBox;
    ckbCouvert: TCheckBox;
    ckbRequerObs: TCheckBox;
    ckbBalanca: TCheckBox;
    TabSheet3: TTabSheet;
    GroupBox4: TGroupBox;
    Label12: TLabel;
    btPesqTipoItemSped: TSpeedButton;
    Label15: TLabel;
    btPesqGeneroItem: TSpeedButton;
    edCodTipoItemSped: TEdit;
    edCodGeneroItem: TEdit;
    rdIPPT: TRadioGroup;
    rdIAT: TRadioGroup;
    TabSheet4: TTabSheet;
    GroupBox2: TGroupBox;
    Label28: TLabel;
    Label29: TLabel;
    edAliquotaPis: TCurrencyEdit;
    edCstPisCofins: TEdit;
    GroupBox3: TGroupBox;
    Label33: TLabel;
    Label34: TLabel;
    edCstPIS: TEdit;
    edAliquotaCofins: TCurrencyEdit;
    edLucroMax: TCurrencyEdit;
    Label36: TLabel;
    edImpostos: TCurrencyEdit;
    Label37: TLabel;
    edOutrasTaxas: TCurrencyEdit;
    Label39: TLabel;
    edMaoObra: TCurrencyEdit;
    Label40: TLabel;
    edValidade: TCurrencyEdit;
    Label43: TLabel;
    TabSheet5: TTabSheet;
    pnInformacoesEstoque: TPanel;
    Label31: TLabel;
    Label32: TLabel;
    Label35: TLabel;
    Label38: TLabel;
    Label16: TLabel;
    Label11: TLabel;
    edValorCompra: TCurrencyEdit;
    edEstoqueAtual: TCurrencyEdit;
    edEstoqueMax: TCurrencyEdit;
    edEstoqueMin: TCurrencyEdit;
    cbUnidadeEntrada: TcxLookupComboBox;
    edPercPerda: TCurrencyEdit;
    ckbAbateFicha: TCheckBox;
    pnTitulo: TPanel;
    lbTitulo: TLabel;
    PngSpeedButton1: TPngSpeedButton;
    edRendimento: TCurrencyEdit;
    Label45: TLabel;
    edCodNCM: TEdit;
    Label26: TLabel;
    edComissao: TCurrencyEdit;
    Label9: TLabel;
    GroupBox5: TGroupBox;
    ckbCompra: TCheckBox;
    ckbVende: TCheckBox;
    ckbSubProduto: TCheckBox;
    Label13: TLabel;
    pn_informacoes_item: TPanel;
    pnDescarte: TPanel;
    ed_cod_barras: TEdit;
    Label18: TLabel;
    edCodProduto: TEdit;
    btPesqProdutos: TSpeedButton;
    Label1: TLabel;
    function controla_botoes(botao: TBitBtn): boolean;
    function ConfiguraCampos: boolean;
    function Verifica_validade_item: boolean;
    function adicionar_produto: boolean;
    function verificar_validade: boolean;
    function validacaoDeVenda: boolean;
    function validacaoDeEstoque: boolean;
    function gravar_informacoes: boolean;
    procedure limpa_edits;
    procedure gravar_itens_produtos;
    procedure pesquisar_produto(tipo: integer);
    procedure pesquisa_unidade;
    procedure retornaInformacoesGerais();
    procedure retornaInformacoesDeVenda();
    procedure buscaFichaTecnica();
    procedure edCodBarrasProdutoKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure edCodProdutoExit(Sender: TObject);
    procedure bt_adicionarClick(Sender: TObject);
    procedure bt_sairClick(Sender: TObject);
    procedure edCodProdutoEnter(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure bt_pesq_ccClick(Sender: TObject);
    procedure bt_novoClick(Sender: TObject);
    procedure bt_alterarClick(Sender: TObject);
    procedure bt_excluirClick(Sender: TObject);
    procedure bt_gravarClick(Sender: TObject);
    procedure bt_cancelarClick(Sender: TObject);
    procedure ckbBalancaClick(Sender: TObject);
    procedure ed_cod_mini_printerExit(Sender: TObject);
    procedure btAdicionarFichaTecnicaClick(Sender: TObject);
    procedure Excluirdaficha1Click(Sender: TObject);
    procedure edDescTipoItemSpedKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure setCodItemCadastrado(codigo: string);
    procedure edDescricaoCloneKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure btPesqProdutosClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure Edit1KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure ckbSubProdutoClick(Sender: TObject);
    procedure Adicionarclone1Click(Sender: TObject);
    procedure Excluirselecionado1Click(Sender: TObject);
    procedure btClonarFichaTecnicaClick(Sender: TObject);
    procedure E1Click(Sender: TObject);
  private
    procedure ClonarFicha(ACodProdutoOrigem: string);
    { Private declarations }
  public
    { Public declarations }
    codigoItemEstoqueCadastrado: string;
  end;

var
  frmCadProdutos: TfrmCadProdutos;
  oquefazer: integer;
  calcula_inverso: boolean;
  codigo_item: string;
  ultimoCodigo: string;

implementation

uses
  uu_data_module, uu_frm_principal, uu_cs_produtos, uu_cs_c_custo,
  uu_cs_unidades, uu_cad_itens_estoque;

{$R *.dfm}


procedure TfrmCadProdutos.E1Click(Sender: TObject);
begin
  inherited;
  if (ShowRealDialog(frmCadProdutos, tmConfirmacao, 'Confirme', 'Excluir todos os ítens da ficha técnica ?') = teSim) then
  begin
    dm.composicoes_temp.Active := false;
    dm.composicoes_temp.Active := true;
  end;

end;

function TfrmCadProdutos.ConfiguraCampos: boolean;
var
  novo_produto: string;
begin

  limpa_edits();
  dm.composicoes_temp.EmptyTable;
  dm.composicoes_temp.Active := false;
  dm.composicoes_temp.Active := true;

  ckbSubProduto.Checked := false;

  edEstoqueAtual.value := 0;
  edEstoqueMax.Value := 20;
  edEstoqueMin.value := 10;
  edValorCompra.Value := 1;
  edRendimento.Value := 1;
  edPercPerda.Value := 0;
  ed_preco.Value := 0;
  edComissao.Value := 0;
  edLucroMax.Value := 0;
  edImpostos.Value := 0;
  edOutrasTaxas.Value := 0;
  edMaoObra.Value := 0;
  edValidade.Value := 3;

  cbAliquotaICMS.Text := '01';
  edReducaoBase.Value := 0;
  edCodTipoItemSped.Text := '00';
  ed_cefop_saidas.Text := '5405';
  edCstSaida.Text := '060';
  edCstPisCofins.Text := '01';
  edCest.Text := '';
  edCodNCM.Text := '';

  un_ecf.Text := 'UN';
  cbUnidadeEntrada.EditValue := '10';
  cbGrupoTouch.EditValue := '01';
  cbLocalImpressao.EditValue := '001';
  cbAliquotaICMS.EditValue := '01';
  cbGrupoTouch.EditValue := '00';

  edValorCompra.Value := 1;
  edEstoqueAtual.Value := 0;
  edEstoqueMax.Value := 20;
  edEstoqueMin.Value := 10;
  edReducaoBase.Value := 0;

  ckbImprimeFichaFF.Checked := false;
  ckbCompra.Checked := true;
  ckbVende.Checked := true;
  ckbIncideServico.Checked := true;
  ckbPrecoVariavel.Checked := false;
  ckbVendaFracionada.Checked := false;
  ckbCalculaQtde.Checked := false;
  ckbCouvert.Checked := false;
  ckbRequerObs.Checked := false;
  ckbBalanca.Checked := false;
  ckbAbateFicha.Checked := true;
  memoInstrucoesPreparo.Clear;

end;

procedure TfrmCadProdutos.edCodBarrasProdutoKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin

  if Key = vk_return then
  begin
    if not ((Sender is TMemo) or (Sender is Tdbgrid)) then
      Perform(WM_NEXTDLGCTL, 0, 0)
  end;

  if Key = vk_delete then
  begin
    if ((Sender is TDBGrid and ((Sender as TDBGrid).Name = 'dbg_ficha_tec'))) then
    begin
      if MessageDlg('Confirma exclusão ?', mtConfirmation, [mbYes, MbNo], 0) = Mryes then
      begin
        dm.composicoes_temp.Delete;
      end;
    end;

  end;

  if Key = vk_escape then
  begin
    bt_cancelar.Click;
  end;

  if Key = vk_f6 then
  begin
    bt_gravar.Click;
  end;

end;

procedure TfrmCadProdutos.edCodProdutoExit(Sender: TObject);
var
  retorno: string;
  filtro: string;
begin

  if Sender is Tedit and ((Sender as Tedit).Name = 'edCodProduto') then
  begin
    if trim(edCodProduto.Text) = '' then
      exit;

    try
      begin
        edCodProduto.Text := FormatFloat('00000', StrToFloat(edCodProduto.Text));
      end;
    except
      begin
        showmessage('Código inválido!');
        edCodProduto.Clear;
        edCodProduto.SetFocus;
        exit;
      end;
    end;



    if (verificaExistenciaProduto(edCodProduto.Text, 1) = true) then
    begin
      retornaInformacoesGerais();
      if oquefazer <> 3 then
      begin
        ed_descricao_produto.SetFocus;
      end
    end
    else
    begin
      ShowMessage('Código de produto inexistente');
      edCodProduto.clear;
      edCodProduto.SetFocus;
      exit;
    end;
  end;

end;

function TfrmCadProdutos.verifica_validade_item: boolean;
begin
  // Verifica item
 /////////////////////////////////////////////////////////
 {

  try
    StrToFloat(ed_cod_item.Text);
  except
    begin
      showmessage('Código do itém é !');
      ed_cod_item.SetFocus;
      Result:=false;
      exit;
    end;
  end;
    ed_cod_item.Text:=formatfloat('00000',StrToFloat(ed_cod_item.text));
    dm.qryauxiliar.Active:=false;
    dm.qryauxiliar.SQL.clear;
    dm.qryauxiliar.sql.add('select * from itens_estoque where cod_item='+Quotedstr(ed_codigo_item.text));
    dm.qryauxiliar.Active:=true;
    if dm.qryauxiliar.IsEmpty then
    begin
      showmessage('O item informado não existe!');
      Result:=false;
      ed_codigo_item.SetFocus;
      ed_codigo_item.Clear;
      exit;
    end;
 ////////////////////////////////////////////////////////////////////////

    try
      StrToFloat(ed_qtde_item.Text);
    except
       begin
         showmessage('Quantidade de ítem inválida!');
         Result:=false;
         ed_qtde_item.Clear;
         exit;
       end;
    end;


    if StrToFloat(ed_qtde_item.Text) <=0 then
    begin
      ShowMessage('Quantidade do ítem não pode ser menor ou igual a zero!');
      Result:=false;

      exit;
    end;
    }
  Result := true;

end;

procedure TfrmCadProdutos.Adicionarclone1Click(Sender: TObject);
begin
  inherited;
  dmCadProduto.tbClonesTemp.append;
end;

function TfrmCadProdutos.adicionar_produto: boolean;
begin

  if dm.composicoes_temp.Locate('cod_item', ed_cod_item.Text, []) then
  begin
    if MessageDlg('O ítem informado já consta na composição do produto. Deseja atualizar o valor para este ítem ?', mtConfirmation, [mbYes, mbno], 0) = mryes then
    begin
      dm.composicoes_temp.Delete;
    end
    else
    begin
      ed_cod_item.Clear;
      ed_desc_item.Clear;
      dbg_ficha_tec.Refresh;
      ed_qtd_item.clear;
      ed_cod_item.SetFocus;
      exit;
    end;
  end;
  dm.composicoes_temp.Append;
  dm.composicoes_tempcod_produto.Value := edCodProduto.Text;
  dm.composicoes_tempcod_item.Value := ed_cod_item.text;
  dm.composicoes_tempquantidade.Value := ed_qtd_item.Value;
  dm.composicoes_tempdescricao_item.Text := ed_desc_item.Text;
  dm.composicoes_tempUnidade.Text := cbUnidadeFichaTecnica.EditValue;
  dm.composicoes_tempdes_unidade.Text := cbUnidadeFichaTecnica.Text;

  dm.composicoes_temp.Post;
  dm.composicoes_temp.Refresh;
  dm.composicoes_temp.Refresh;
  ed_cod_item.Clear;
  ed_desc_item.Clear;
  dbg_ficha_tec.Refresh;
  ed_cod_item.SetFocus;
  ed_qtd_item.Clear;
end;

procedure TfrmCadProdutos.btClonarFichaTecnicaClick(Sender: TObject);
begin
  inherited;
  botao_pesquisaClick(btClonarFichaTecnica);
  if string_auxiliar <> '' then
  begin
    if (ShowRealDialog(frmCadProdutos, tmConfirmacao, 'Confirme', 'Confirma o clone da ficha ?') = teSim) then
    begin
      ClonarFicha(Trim(string_auxiliar));
    end;

  end;
end;

procedure TfrmCadProdutos.ClonarFicha(ACodProdutoOrigem: string);
var
  LSQL: Tstringlist;
  LMemTb: TFDMemTable;
begin
  LSQL := Tstringlist.Create;
  LMemTb := TFDMemTable.Create(nil);
  dm.composicoes_temp.DisableControls;

  try

    LSQL.add(' select cp.cod_produto_baixa, p.descricao,                              ');
    LSQL.add('        (cp.quantidade / u.parametro) as quantidade,                    ');
    LSQL.add('         cp.unidade as cod_unidade, u.descricao as descricao_unidade    ');
    LSQL.add('   from composicoes_produto cp                                          ');
    LSQL.add('     inner join produtos p on (p.cod_produto = cp.cod_produto_baixa)    ');
    LSQL.add('     inner join unidades u on (u.cod_unidade = cp.unidade)              ');
    LSQL.add('   where cp.cod_produto=' + Quotedstr(ACodProdutoOrigem));
    dm.getMemTable(LMemTb, LSQL.Text);

    LMemTb.first;

    while not LMemTb.eof do
    begin
      ed_cod_item.Text := LMemTb.FieldByName('cod_produto_baixa').value;
      ed_desc_item.text := LMemTb.FieldByName('descricao').value;
      cbUnidadeFichaTecnica.EditValue := LMemTb.FieldByName('cod_unidade').value;
      ed_qtd_item.Value := LMemTb.FieldByName('quantidade').value;
      btAdicionarFichaTecnica.Click;
      LMemTb.Next;
    end;

    ed_cod_item.Text := '';
    ed_desc_item.text := '';
    cbUnidadeFichaTecnica.EditValue := '01';
    ed_qtd_item.Value := 0;

  finally
    dm.composicoes_temp.EnableControls;
    LMemTb.Active := false;
    FreeAndNil(LSQL);
    FreeAndNil(LMemTb);
  end;
end;

procedure TfrmCadProdutos.btPesqProdutosClick(Sender: TObject);
begin
  inherited;
  botao_pesquisaClick(btPesqProdutos);
  if string_auxiliar <> '' then
  begin
    edCodProduto.OnExit(edCodProduto);
  end;
end;

procedure TfrmCadProdutos.bt_adicionarClick(Sender: TObject);
begin
  if Verifica_validade_item = true then
  begin
    adicionar_produto;
  end;
end;

procedure TfrmCadProdutos.bt_sairClick(Sender: TObject);
begin
  close;
end;

function TfrmCadProdutos.verificar_validade: boolean;
begin

  try
    ed_cod_grupo.Text := formatfloat('000', StrToFloat(ed_cod_grupo.Text));
  except
    begin
      ShowMessage('Código do grupo de produto inválido!');
      ed_cod_grupo.SetFocus;
      ed_cod_grupo.Clear;
      Result := false;
      exit;
    end;
  end;
  dm.qryauxiliar.Active := false;
  dm.qryauxiliar.SQL.Clear;
  dm.qryauxiliar.SQL.add('select * from grupos where cod_grupo=' + Quotedstr(ed_cod_grupo.Text));
  dm.qryauxiliar.Active := true;
  if dm.qryauxiliar.IsEmpty then
  begin
    ShowMessage('Não existe grupo cadastrado com o código informado!');
    ed_cod_grupo.clear;
    ed_desc_grupo.clear;
    ed_cod_grupo.setfocus;
    Result := false;
    exit;
  end;

  if length(trim(ed_cod_grupo.text)) < 6 then
  begin
    showmessage('O grupo selecionado não é um grupo-filho. Selecione uma ramificação no menor nível do grupo escolhido');
    ed_cod_grupo.clear;
    ed_desc_grupo.clear;
    ed_cod_grupo.setfocus;
    Result := false;
    exit;
  end;

  if trim(ed_descricao_produto.Text) = '' then
  begin
    showmessage('Digite a descrição do produto!');
    ed_descricao_produto.SetFocus;
    Result := false;
    exit;
  end;

  if (verificaExistenciaTipoItemSPED(edCodTipoItemSped.Text) = false) then
  begin
    showmessage('Código do tipo de ítem inválido!');
    edCodTipoItemSped.Clear;
    edCodTipoItemSped.SetFocus;
    Result := false;
    exit;
  end;

  Result := validacaoDeVenda();
  if Result = false then
    exit
  else
    result := true;

  Result := validacaoDeEstoque;
  if Result = false then
    exit
  else
    result := true;

end;

function TfrmCadProdutos.validacaoDeEstoque: boolean;
begin

  if (edEstoqueMax.Value <= 0) then
  begin
    Showmessage('Estoque máximo deve ser superior a zero');
    edEstoqueMax.SetFocus;
    result := false;
    exit;
  end;

  if (edEstoqueMin.Value <= 0) then
  begin
    Showmessage('Estoque mínimo deve ser superior a zero');
    edEstoqueMin.SetFocus;
    result := false;
    exit;
  end;

  result := true;
end;

function TfrmCadProdutos.validacaoDeVenda: boolean;
begin

{ if trim(ed_cod_barras.text) = '' then
  begin
   ShowMessage('Digite o código do produto');
   ed_cod_barras.SetFocus;
   ed_cod_barras.Clear;
   Result:=false;
   exit;
  end;
 }

  result := true;

  if trim(ed_cod_barras.text) <> '' then
  begin
    try
      begin
        ed_cod_barras.Text := FormatFloat('00000', StrToFloat(ed_cod_barras.Text));
      end;
    except
    end;

    dm.qryauxiliar.active := false;
    dm.qryauxiliar.sql.clear;
    dm.qryauxiliar.sql.add('select * from produtos where cod_barras=' + Quotedstr(ed_cod_barras.Text) + ' and cod_produto <> ' + Quotedstr(edCodProduto.Text));
    dm.qryauxiliar.Active := true;
    if (oquefazer = 1) or (oquefazer = 2) then
    begin
      if dm.qryauxiliar.IsEmpty = false then
      begin
        showmessage('O seguinte produto já ocupa o código acima digitado:   ' + dm.qryauxiliar.FieldByName('descricao').value);
        result := false;
        Exit;
      end;
    end;
  end;

  if ed_preco.Value < 0 then
  begin
    ShowMessage('Preco de produto inválido!');
    ed_preco.Clear;
    ed_preco.SetFocus;
    Result := false;
    Exit;
  end;

  if (verificaExistenciaCFOP(ed_cefop_saidas.Text) = false) then
  begin
    ShowMessage('CFOP de saída inválida!');
    ed_cefop_saidas.SetFocus;
    ed_cefop_saidas.clear;
    Result := false;
    Exit;
  end;

  if (verificaExistenciaCST(edCstSaida.Text) = false) then
  begin
    ShowMessage('Situação tributária  de saída inválida!');

    edCstSaida.SetFocus;
    edCstSaida.clear;
    Result := false;
    Exit;
  end;

  if (verificaExistenciaCSTPISCofins(edCstPisCofins.Text) = false) then
  begin
    ShowMessage('Situação tributária  do PIS / COFINS inválida!');
    edCstPisCofins.SetFocus;
    edCstPisCofins.clear;
    Result := false;
    Exit;
  end;

  if (trim(un_ecf.Text) = '') then
  begin
    ShowMessage('Unidade de impressão no ECF inválida!');
    un_ecf.Clear;
    un_ecf.SetFocus;
    Result := false;
    exit;
  end;

end;

function TfrmCadProdutos.gravar_informacoes: boolean;
var
  cod_produto, cod_grupo, descricao, cod_aliquota, reducaoBaseIcms, preco, preco2: string;
  data_cadastro, data_u_venda, numero_vendas, caminho_foto, observacao, cod_barras: string;
  lucro_maximo, impostos, outrasTaxas, maoDeObra, validade, lucro_minimo, obs_lancamento, tempo_preparo, cod_miniPrinter, vendeFracionado, pizza, tamanho_pizza, produtoBalanca, precoDigitado, informarSabor, controlaEstoque, comissionado, incideServico, couvert, valorComissao: string;
  descricaoReduzida: string;
  parametroContabil: string;
  custoDigitado: string;
  calculaQtde: string;
  impBalcao: string;
  impMesas: string;
  impDeliver: string;
  compra, vende, cod_tipo_item, cod_genero_item, cod_ncm, cest, ippt, iat: string;
  unidadeCompra, unidadeFracao, precoCompra, estoqueAtual, rendimento, perda, estoqueMaximo, estoqueMinimo: string;
  cfopTransferencia, cstTransferencia, cfopDevolucao, cstDevolucao: string;
  cstPisCofins, aliquotaPis, aliquotaCofins, requerObservacao, imprimeFicha: string;
  cfopEntrada, cstEntrada: string;
  cfopSaida, cstSaida, unEcf, subMateria: string;
  codGrupoTouch, descricaoTouch: string;
  abateFicha: string;
  Modo_preparo: string;
begin

  if ckbCompra.Checked then
    compra := '1'
  else
    compra := '0';

  if ckbVende.Checked then
    vende := '1'
  else
    vende := '0';

  cfopEntrada := '1102';
  cstEntrada := '000';
  cfopTransferencia := '5102';
  cstTransferencia := '000';

  cod_produto := Quotedstr(edCodProduto.Text);
  cod_grupo := quotedstr(ed_cod_grupo.Text);
  descricao := QuotedStr(trim(ed_descricao_produto.Text));
  descricaoReduzida := '';
  cod_aliquota := Quotedstr(cbAliquotaICMS.EditValue);
  reducaoBaseIcms := Quotedstr(dm.TrocaVirgPPto(Floattostr(edReducaoBase.Value)));
  preco := Quotedstr(dm.TrocaVirgPPto(Floattostr(ed_preco.Value)));
  lucro_maximo := Quotedstr(dm.TrocaVirgPPto(Floattostr(edLucroMax.Value)));
  impostos := Quotedstr(dm.TrocaVirgPPto(Floattostr(edImpostos.Value)));
  outrasTaxas := Quotedstr(dm.TrocaVirgPPto(Floattostr(edOutrasTaxas.Value)));
  maoDeObra := Quotedstr(dm.TrocaVirgPPto(Floattostr(edMaoObra.Value)));
  validade := FloatToStr(edValidade.Value);
  Modo_preparo := Quotedstr(memoInstrucoesPreparo.Lines.Text);

  preco2 := '0';
//  caminho_foto:=QuotedStr('c:\restaurante\imagens\semfoto.jpg');

  cod_miniPrinter := Quotedstr(cbLocalImpressao.EditValue);
  if ckbVendaFracionada.Checked = True then
    vendeFracionado := '1'
  else
    vendeFracionado := '0';

  if ckbSubProduto.Checked = True then
    subMateria := '1'
  else
    subMateria := '0';

  if ckbAbateFicha.Checked = true then
    abateFicha := '1'
  else
    abateFicha := '0';

  if ckbPizza.Checked = true then
    pizza := '1'
  else
    pizza := '0';

  case rdTamanhoPizza.ItemIndex of
    0:
      tamanho_pizza := Quotedstr('B');
    1:
      tamanho_pizza := Quotedstr('P');
    2:
      tamanho_pizza := Quotedstr('M');
    3:
      tamanho_pizza := Quotedstr('G');
    4:
      tamanho_pizza := Quotedstr('F');
  end;

  if ckbBalanca.Checked = true then
    produtoBalanca := '1'
  else
    produtoBalanca := '0';

  if ckbPrecoVariavel.Checked then
    precoDigitado := '1'
  else
    precoDigitado := '0';

  if ckbIncideServico.Checked then
    incideServico := '1'
  else
    incideServico := '0';

  if ckbCouvert.Checked then
    couvert := '1'
  else
    couvert := '0';

  if ckbCalculaQtde.Checked then
    calculaQtde := '1'
  else
    calculaQtde := '0';

  impBalcao := '1';
  impDeliver := '1';
  impMesas := '1';

  if ckbRequerObs.Checked then
    requerObservacao := '1'
  else
    requerObservacao := '0';

  if ckbImprimeFichaFF.Checked then
    imprimeFicha := '1'
  else
    imprimeFicha := '0';

  cod_tipo_item := Quotedstr(edCodTipoItemSped.Text);
  cod_genero_item := Quotedstr(edCodGeneroItem.Text);
  cod_ncm := Quotedstr(edCodNCM.Text);
  cest := Quotedstr(edCest.Text);

  if rdIPPT.ItemIndex = 0 then
    ippt := '0'
  else
    ippt := '1';

  if rdIAT.ItemIndex = 0 then
    iat := '0'
  else
    iat := '1';

  parametroContabil := edParametroContabil.Text;
  if strToFloat(parametroContabil) <= 0 then
    parametroContabil := '1';

  parametroContabil := dm.TrocaVirgPPto(edParametroContabil.Text);

  valorComissao := dm.TrocaVirgPPto(Floattostr(edComissao.value));
  custoDigitado := '0';

  unidadeCompra := Quotedstr(cbUnidadeEntrada.EditValue);
  unidadeFracao :=Quotedstr(cbUnidadeEntrada.EditValue);
  precoCompra := Quotedstr(dm.TrocaVirgPPto(Floattostr(edValorCompra.Value)));
  rendimento := Quotedstr(dm.TrocaVirgPPto(Floattostr(edRendimento.Value)));
  perda := Quotedstr(dm.TrocaVirgPPto(Floattostr(edPercPerda.Value)));

  estoqueMaximo := Quotedstr(dm.TrocaVirgPPto(Floattostr(edEstoqueMax.Value)));
  estoqueMinimo := Quotedstr(dm.TrocaVirgPPto(Floattostr(edEstoqueMin.Value)));
  cfopSaida := Quotedstr(ed_cefop_saidas.Text);
  cstSaida := QuotedStr(edCstSaida.Text);

  cstTransferencia := '000';
  cfopDevolucao := '5102';
  cstDevolucao := '000';
  cstPisCofins := Quotedstr(edCstPisCofins.Text);
  aliquotaPis := Quotedstr(dm.TrocaVirgPPto(Floattostr(edAliquotaPis.Value)));
  aliquotaCofins := Quotedstr(dm.TrocaVirgPPto(Floattostr(edAliquotaCofins.Value)));
  unEcf := Quotedstr(un_ecf.Text);

  codGrupoTouch := Quotedstr(cbGrupoTouch.EditValue);
  caminho_foto := Quotedstr('');

  case oquefazer of
    1:
      begin
        edCodProduto.Text := dm.geraCodigo('G_PRODUTOS', 5);
        cod_produto := Quotedstr(edCodProduto.Text);

        if StrToInt(vende) = 0 then
          cod_barras := Quotedstr('')
        else
        begin
          if trim(ed_cod_barras.Text) = '' then
            cod_barras := cod_produto
          else
            cod_barras := Quotedstr(Trim(ed_cod_barras.Text));
        end;

        string_auxiliar := edCodProduto.Text;
        ultimoCodigo := cod_produto;
        dm.qryauxiliar.Active := false;
        dm.qryauxiliar.SQL.Clear;
        dm.qryauxiliar.sql.add('insert into produtos (cod_produto,cod_grupo,descricao,');
        dm.qryauxiliar.sql.add('valor_unitario,valor_unitario_02,lucro_maximo,impostos,outras_taxas,mao_obra,validade, cod_aliquota, REDUCAO_BASE_ICMS, caminho_foto,cod_barras,');
        dm.qryauxiliar.sql.add('data_cadastro,ultima_venda,cod_miniprinter,fracionado,pizza,tam_pizza,balanca,abate_ficha, ');
        dm.qryauxiliar.sql.add('preco_digitado,rendimento, perc_perda, incide_servico,couvert,valor_comissao,descricao_reduzida,parametro_contagem,custodigitado,requer_observacao, imprimir_ficha, calcula_qtde,imp_balcao,imp_mesas,imp_delivery,');
        dm.qryauxiliar.sql.add('compra,vende,cod_tipo_item,cod_genero,ncm,cest,ippt,iat,');
        dm.qryauxiliar.sql.add('valor_custo,quantidade_maxima,quantidade_minima,unidade_entrada,cod_unidade_fracao,cfop,cst,cfop_saida,cst_saida,un_ecf,submateria,');
        dm.qryauxiliar.SQL.add('CFOP_TRANSFERENCIAS,CST_TRANSFERENCIAS,CFOP_DEVOLUCAO,CST_DEVOLUCAO,CST_PIS_COFINS,ALIQ_PIS,ALIQ_COFINS,cod_grupo_touch,modo_preparo');

        dm.qryauxiliar.sql.add(') values (');
        dm.qryauxiliar.sql.add('' + cod_produto + ',');
        dm.qryauxiliar.sql.add('' + cod_grupo + ',');
        dm.qryauxiliar.sql.add('' + descricao + ',');
        dm.qryauxiliar.sql.add('' + preco + ',');
        dm.qryauxiliar.sql.add('' + preco2 + ',');
        dm.qryauxiliar.sql.add('' + lucro_maximo + ',');
        dm.qryauxiliar.sql.add('' + impostos + ',');
        dm.qryauxiliar.sql.add('' + outrasTaxas + ',');
        dm.qryauxiliar.sql.add('' + maoDeObra + ',');
        dm.qryauxiliar.sql.add('' + validade + ',');
        dm.qryauxiliar.sql.add('' + cod_aliquota + ',');
        dm.qryauxiliar.sql.add('' + reducaoBaseIcms + ',');
        dm.qryauxiliar.sql.add('' + caminho_foto + ',');
        dm.qryauxiliar.sql.add('' + cod_barras + ',');
        dm.qryauxiliar.sql.add('' + Quotedstr(FormatDateTime('DD.MM.YYY', data_do_sistema)) + ',');
        dm.qryauxiliar.sql.add('' + Quotedstr(FormatDateTime('DD.MM.YYY', data_do_sistema)) + ',');
        dm.qryauxiliar.sql.add('' + cod_miniPrinter + ',');
        dm.qryauxiliar.sql.add('' + vendeFracionado + ',');
        dm.qryauxiliar.sql.add('' + pizza + ',');
        dm.qryauxiliar.sql.add('' + tamanho_pizza + ',');
        dm.qryauxiliar.sql.add('' + produtoBalanca + ',');
        dm.qryauxiliar.sql.add('' + abateFicha + ',');
        dm.qryauxiliar.sql.add('' + precoDigitado + ',');
        dm.qryauxiliar.sql.add('' + rendimento + ',');
        dm.qryauxiliar.sql.add('' + perda + ',');
        dm.qryauxiliar.sql.add('' + incideServico + ',');
        dm.qryauxiliar.sql.add('' + couvert + ',');
        dm.qryauxiliar.sql.add('' + valorComissao + ',');
        dm.qryauxiliar.sql.add('' + descricaoReduzida + ',');
        dm.qryauxiliar.sql.add('' + parametroContabil + ',');
        dm.qryauxiliar.sql.add('' + custoDigitado + ',');

        dm.qryauxiliar.sql.add('' + requerObservacao + ',');
        dm.qryauxiliar.sql.add('' + imprimeFicha + ',');
        dm.qryauxiliar.sql.add('' + calculaQtde + ',');
        dm.qryauxiliar.sql.add('' + impBalcao + ',');
        dm.qryauxiliar.sql.add('' + impMesas + ',');
        dm.qryauxiliar.sql.add('' + impDeliver + ',');
        dm.qryauxiliar.sql.add('' + compra + ',');
        dm.qryauxiliar.sql.add('' + vende + ',');
        dm.qryauxiliar.sql.add('' + cod_tipo_item + ',');
        dm.qryauxiliar.sql.add('' + cod_genero_item + ',');
        dm.qryauxiliar.sql.add('' + cod_ncm + ',');
        dm.qryauxiliar.sql.add('' + cest + ',');
        dm.qryauxiliar.sql.add('' + ippt + ',');
        dm.qryauxiliar.sql.add('' + iat + ',');
        dm.qryauxiliar.sql.add('' + precoCompra + ',');
        dm.qryauxiliar.sql.add('' + estoqueMaximo + ',');
        dm.qryauxiliar.sql.add('' + estoqueMinimo + ',');
        dm.qryauxiliar.sql.add('' + unidadeCompra + ',');
        dm.qryauxiliar.sql.add('' + unidadeFracao + ',');

        dm.qryauxiliar.sql.add('' + cfopEntrada + ',');
        dm.qryauxiliar.sql.add('' + cstEntrada + ',');
        dm.qryauxiliar.sql.add('' + cfopSaida + ',');
        dm.qryauxiliar.sql.add('' + cstSaida + ',');
        dm.qryauxiliar.sql.add('' + unEcf + ',');
        dm.qryauxiliar.sql.add('' + subMateria + ',');
        dm.qryauxiliar.sql.add('' + cfopTransferencia + ',');
        dm.qryauxiliar.sql.add('' + cstTransferencia + ',');
        dm.qryauxiliar.sql.add('' + cfopDevolucao + ',');
        dm.qryauxiliar.sql.add('' + cstDevolucao + ',');
        dm.qryauxiliar.sql.add('' + cstPisCofins + ',');
        dm.qryauxiliar.sql.add('' + aliquotaPis + ',');
        dm.qryauxiliar.sql.add('' + aliquotaCofins + ',');
        dm.qryauxiliar.sql.add('' + codGrupoTouch + ',');
        dm.qryauxiliar.sql.add('' + Modo_preparo + ')');

        try
          begin
            dm.qryauxiliar.ExecSQL;
            Result := true;
          end;
        except
          begin

            dm.cria_log_de_erros(dm.qryauxiliar.sql, 'Cadastro de Produtos ', 'Erro incluir produto ', codigo_usuario);
            Result := false;
            exit;
          end;
        end;
        gravar_itens_produtos;

      end;

    2:
      begin
        cod_barras := ed_cod_barras.Text;
        string_auxiliar := edCodProduto.Text;
        dm.qryauxiliar.Active := false;
        dm.qryauxiliar.SQL.Clear;
        dm.qryauxiliar.SQL.add('update produtos set ');
        dm.qryauxiliar.sql.add('cod_grupo=' + cod_grupo + ',');
        dm.qryauxiliar.sql.add('descricao=' + descricao + ',');
        dm.qryauxiliar.sql.add('valor_unitario=' + preco + ',');
        dm.qryauxiliar.sql.add('valor_unitario_02=' + preco2 + ',');
        dm.qryauxiliar.sql.add('lucro_maximo=' + lucro_maximo + ',');
        dm.qryauxiliar.sql.add('impostos=' + impostos + ',');
        dm.qryauxiliar.sql.add('outras_taxas=' + outrasTaxas + ',');
        dm.qryauxiliar.sql.add('mao_obra=' + maoDeObra + ',');
        dm.qryauxiliar.sql.add('validade=' + validade + ',');
        dm.qryauxiliar.sql.add('cod_aliquota=' + cod_aliquota + ',');
        dm.qryauxiliar.sql.add('REDUCAO_BASE_ICMS=' + reducaoBaseIcms + ',');
        dm.qryauxiliar.sql.add('caminho_foto=' + caminho_foto + ',');
        dm.qryauxiliar.sql.add('cod_barras=' + Quotedstr(cod_barras) + ',');
        dm.qryauxiliar.sql.add('cod_miniPrinter=' + cod_miniPrinter + ',');
        dm.qryauxiliar.sql.add('fracionado=' + vendeFracionado + ',');
        dm.qryauxiliar.sql.add('pizza=' + pizza + ',');
        dm.qryauxiliar.sql.add('tam_pizza=' + tamanho_pizza + ',');
        dm.qryauxiliar.sql.add('balanca=' + produtoBalanca + ',');
        dm.qryauxiliar.sql.add('abate_ficha=' + abateFicha + ',');

        dm.qryauxiliar.sql.add('preco_digitado=' + precoDigitado + ',');
        dm.qryauxiliar.sql.add('incide_servico=' + incideServico + ',');
        dm.qryauxiliar.sql.add('couvert=' + couvert + ',');
        dm.qryauxiliar.sql.add('valor_comissao=' + valorComissao + ',');
        dm.qryauxiliar.sql.add('descricao_reduzida=' + descricaoReduzida + ',');
        dm.qryauxiliar.sql.add('parametro_contagem=' + parametroContabil + ',');
        dm.qryauxiliar.sql.add('custodigitado=' + custoDigitado + ',');
        dm.qryauxiliar.sql.add('rendimento=' + rendimento + ',');
        dm.qryauxiliar.sql.add('perc_perda=' + perda + ',');

        dm.qryauxiliar.sql.add('requer_observacao=' + requerObservacao + ',');
        dm.qryauxiliar.sql.add('imprimir_ficha=' + imprimeFicha + ',');

        dm.qryauxiliar.sql.add('calcula_qtde=' + calculaQtde + ',');
        dm.qryauxiliar.sql.add('imp_balcao=' + impBalcao + ',');
        dm.qryauxiliar.sql.add('imp_mesas=' + impMesas + ',');
        dm.qryauxiliar.sql.add('imp_delivery=' + impDeliver + ',');
        dm.qryauxiliar.sql.add('compra=' + compra + ',');
        dm.qryauxiliar.sql.add('vende=' + vende + ',');
        dm.qryauxiliar.sql.add('cod_tipo_item=' + cod_tipo_item + ',');
        dm.qryauxiliar.sql.add('cod_genero=' + cod_genero_item + ',');
        dm.qryauxiliar.sql.add('ncm=' + cod_ncm + ',');
        dm.qryauxiliar.sql.add('cest=' + cest + ',');
        dm.qryauxiliar.sql.add('ippt=' + ippt + ',');
        dm.qryauxiliar.sql.add('iat=' + iat + ',');
        dm.qryauxiliar.sql.add('valor_custo=' + precoCompra + ',');
        dm.qryauxiliar.sql.add('quantidade_maxima=' + estoqueMaximo + ',');
        dm.qryauxiliar.sql.add('quantidade_minima=' + estoqueMinimo + ',');
        dm.qryauxiliar.sql.add('unidade_entrada=' + unidadeCompra + ',');
        dm.qryauxiliar.sql.add('cod_unidade_fracao=' + unidadeFracao + ',');
        dm.qryauxiliar.sql.add('cfop_saida=' + cfopSaida + ',');
        dm.qryauxiliar.sql.add('cst_saida=' + cstSaida + ',');
        dm.qryauxiliar.sql.add('un_ecf=' + unEcf + ',');
        if edEstoqueAtual.Value = 0 then
          dm.qryauxiliar.sql.add('estoque_liquido=0' + ',');

        dm.qryauxiliar.sql.add('submateria=' + subMateria + ',');
        dm.qryauxiliar.sql.add('CFOP_TRANSFERENCIAS=' + cfopTransferencia + ',');
        dm.qryauxiliar.sql.add('CST_TRANSFERENCIAS=' + cstTransferencia + ',');
        dm.qryauxiliar.sql.add('CFOP_DEVOLUCAO=' + cfopDevolucao + ',');
        dm.qryauxiliar.sql.add('CST_DEVOLUCAO=' + cstDevolucao + ',');
        dm.qryauxiliar.sql.add('CST_PIS_COFINS=' + cstPisCofins + ',');
        dm.qryauxiliar.sql.add('ALIQ_PIS=' + aliquotaPis + ',');
        dm.qryauxiliar.sql.add('ALIQ_COFINS=' + aliquotaCofins + ',');
        dm.qryauxiliar.sql.add('COD_GRUPO_TOUCH=' + codGrupoTouch + ',');
        dm.qryauxiliar.sql.add('modo_preparo=' + Modo_preparo + '');

        dm.qryauxiliar.sql.add(' where cod_produto=' + cod_produto);

        try
          begin

            dm.qryauxiliar.ExecSQL;
            Result := true;
          end;
        except
          begin
            dm.cria_log_de_erros(dm.qryauxiliar.sql, 'Cadastro de Produtos ', 'Erro alterar produto ', codigo_usuario);
            Result := false;
            exit;
          end;

        end;

        gravar_itens_produtos;

      end;

    3:
      begin

        if MessageDlg('Confirma exclusão do produto  ?', mtConfirmation, [mbYes, mbno], 0) = Mryes then
        begin
          dm.qryauxiliar.Active := false;
          dm.qryauxiliar.sql.clear;
          dm.qryauxiliar.sql.add('delete from composicoes_produto where cod_produto=' + cod_produto);
          try
            begin
              dm.qryauxiliar.ExecSQL;
              Result := true;
            end;
          except
            begin
              dm.cria_log_de_erros(dm.qryauxiliar.sql, 'Cadastro de Produtos ', 'Erro excluir composições de produto ', codigo_usuario);
              Result := false;
              exit;
            end;
          end;

          dm.qryauxiliar.Active := false;
          dm.qryauxiliar.SQL.Clear;
          dm.qryauxiliar.SQL.add('delete from produtos where cod_produto=' + cod_produto);
          try
            begin
              dm.qryauxiliar.ExecSQL;
              Result := true;
            end;

          except
            begin

              dm.cria_log_de_erros(dm.qryauxiliar.sql, 'Cadastro de Produtos ', 'Erro ao excluir produto ', codigo_usuario);
              Result := false;
              exit;
            end;
          end;

        end;

      end;

  end;

  case oquefazer of
//   1: showmessage('Produto Cadastrado com sucesso!');
    2:
      showmessage('Produto alterado com sucesso!');
    3:
      showmessage('Produto excluído com sucesso!');
  end

end;

procedure TfrmCadProdutos.gravar_itens_produtos;
var
  parametro, quantidade: double;
  parametro_saida: double;
begin

  parametro := 0;
  quantidade := 0;
  dm.qryauxiliar.Active := false;
  dm.qryauxiliar.sql.clear;
  dm.qryauxiliar.SQL.add('delete from composicoes_produto where cod_produto=' + quotedstr(edCodProduto.Text));
  dm.qryauxiliar.ExecSQL;
  dm.composicoes_temp.First;
  while not dm.composicoes_temp.Eof do
  begin
    dm.qry_consultas.Active := false;
    dm.qry_consultas.sql.clear;
    dm.qry_consultas.SQL.Add('select * from unidades where cod_unidade=' + Quotedstr(dm.composicoes_tempUnidade.Value));
    dm.qry_consultas.Active := true;
    parametro := dm.qry_consultas.fieldbyname('parametro').Value;
    quantidade := dm.composicoes_tempquantidade.Value * dm.qry_consultas.fieldbyname('parametro').Value;
    dm.qryauxiliar.Active := false;
    dm.qryauxiliar.SQL.clear;

    dm.qryauxiliar.SQL.Add('insert into composicoes_produto (cod_produto,cod_produto_baixa,quantidade,cod_c_custo,unidade) values (');
    dm.qryauxiliar.SQL.Add('' + Quotedstr(edCodProduto.Text) + ',');
    dm.qryauxiliar.SQL.Add('' + QuotedStr(dm.composicoes_tempcod_item.Value) + ',');
    dm.qryauxiliar.SQL.Add('' + Quotedstr(dm.TrocaVirgPPto(FloatToStr(quantidade))) + ',');
    dm.qryauxiliar.SQL.Add('' + QuotedStr(dm.composicoes_tempcod_c_custo.Value) + ',');
    dm.qryauxiliar.SQL.Add('' + QuotedStr(dm.composicoes_tempUnidade.Value) + ')');

    try
      begin
        dm.qryauxiliar.ExecSQL;
      end;
    except
      begin
        dm.cria_log_de_erros(dm.qryauxiliar.sql, 'Cadastro de Produtos ', 'Erro incluir ítem produto final em composição ', codigo_usuario);
        exit;
      end;
    end;
    dm.composicoes_temp.Next;
  end;
end;

procedure TfrmCadProdutos.edCodProdutoEnter(Sender: TObject);
begin

  if Sender is Tedit and ((Sender as Tedit).Name = 'edCodProduto') then
  begin

  end;

  if Sender is TCustomEdit and ((Sender as TCustomEdit).Name = 'ed_qtde_item') then
  begin
    (Sender as TCustomEdit).SelectAll;
  end;

end;

procedure TfrmCadProdutos.FormActivate(Sender: TObject);
begin
  bt_cancelar.Click;

  bt_novo.SetFocus;
end;

procedure TfrmCadProdutos.FormCreate(Sender: TObject);
begin
  inherited;
  dmCadProduto := TdmCadProduto.Create(self);
  dmCadProduto.qryUnidadeEntrada.Active := true;
  dmCadProduto.qryGruposTouch.active := true;
  dmCadProduto.qryMiniPrinters.Active := true;
  dmCadProduto.qryAliquotas.Active := true;

end;

procedure TfrmCadProdutos.FormDestroy(Sender: TObject);
begin
  inherited;
  FreeAndNil(dmCadProduto);

end;

procedure TfrmCadProdutos.retornaInformacoesGerais();
begin
  dm.qryauxiliar.Active := false;
  dm.qryauxiliar.sql.Clear;
  dm.qryauxiliar.sql.add('select p.*, coalesce(p.modo_preparo,' + Quotedstr('') + ') as preparo,');
  dm.qryauxiliar.sql.add('       g.descricao as descricaoGrupo,');
  dm.qryauxiliar.sql.add('       tpi.descricao as descricaoItemSped,');
  dm.qryauxiliar.sql.add('      coalesce((p.estoque_liquido / un.parametro),0) as estoque_atual');
  dm.qryauxiliar.sql.add('       from produtos p');
  dm.qryauxiliar.sql.add('         inner join grupos g on (g.cod_grupo = p.cod_grupo)');
  dm.qryauxiliar.SQL.Add('            inner join unidades un on ( un.cod_unidade = p.unidade_entrada)');
  dm.qryauxiliar.sql.add('         inner join tipos_item_sped tpi on (tpi.cod_tipo = p.cod_tipo_item)');
  dm.qryauxiliar.sql.add('   where p.cod_produto=' + Quotedstr(edCodProduto.Text));
  dm.qryauxiliar.Active := true;

  edCodProduto.Text := dm.qryauxiliar.fieldbyname('cod_produto').value;
  ed_descricao_produto.Text := dm.qryauxiliar.fieldbyname('descricao').value;
  memoInstrucoesPreparo.Lines.Text := dm.qryauxiliar.fieldbyname('preparo').value;

  try
    ed_cod_grupo.Text := dm.qryauxiliar.fieldbyname('cod_grupo').value;
  except
  end;

  try
    ed_desc_grupo.Text := dm.qryauxiliar.fieldbyname('descricaoGrupo').value;
  except
  end;

  try
    edCodTipoItemSped.Text := dm.qryauxiliar.fieldbyname('cod_tipo_item').value;
  except
    edCodTipoItemSped.Text := '00';
  end;

  try
    edCodGeneroItem.Text := dm.qryauxiliar.fieldbyname('cod_genero').value;
  except
  end;

  try
    edCodNCM.Text := dm.qryauxiliar.fieldbyname('NCM').value;
  except
  end;

  try
    edCest.Text := dm.qryauxiliar.fieldbyname('cest').value;
  except
  end;

  try
    edCstPisCofins.Text := dm.qryauxiliar.fieldbyname('CST_PIS_COFINS').value;
  except
    edCstPisCofins.Text := '01';
  end;

  try
    edAliquotaPis.Value := dm.qryauxiliar.fieldbyname('ALIQ_PIS').value;
  except
    edAliquotaPis.Value := 0;
  end;

  try
    edReducaoBase.Value := dm.qryauxiliar.fieldbyname('REDUCAO_BASE_ICMS').value;
  except
    edReducaoBase.Value := 0;
  end;

  try
    edAliquotaCofins.Value := dm.qryauxiliar.fieldbyname('ALIQ_COFINS').value;
  except
    edAliquotaCofins.Value := 0;
  end;

  if dm.qryauxiliar.fieldbyname('ippt').value = 0 then
    rdIPPT.ItemIndex := 0
  else
    rdIPPT.ItemIndex := 1;

  if dm.qryauxiliar.fieldbyname('iat').value = 0 then
    rdIAT.ItemIndex := 0
  else
    rdIAT.ItemIndex := 1;

  if dm.qryauxiliar.fieldbyname('pizza').value = 0 then
    ckbPizza.Checked := false
  else
    ckbPizza.Checked := true;

  if dm.qryauxiliar.fieldbyname('requer_observacao').value = 0 then
    ckbRequerObs.Checked := false
  else
    ckbRequerObs.Checked := true;

  if dm.qryauxiliar.fieldbyname('imprimir_ficha').value = 0 then
    ckbImprimeFichaFF.Checked := false
  else
    ckbImprimeFichaFF.Checked := true;

  if dm.qryauxiliar.fieldbyname('tam_pizza').value = 'B' then
    rdTamanhoPizza.ItemIndex := 0;
  if dm.qryauxiliar.fieldbyname('tam_pizza').value = 'P' then
    rdTamanhoPizza.ItemIndex := 1;
  if dm.qryauxiliar.fieldbyname('tam_pizza').value = 'M' then
    rdTamanhoPizza.ItemIndex := 2;
  if dm.qryauxiliar.fieldbyname('tam_pizza').value = 'G' then
    rdTamanhoPizza.ItemIndex := 3;
  if dm.qryauxiliar.fieldbyname('tam_pizza').value = 'F' then
    rdTamanhoPizza.ItemIndex := 4;

  if dm.qryauxiliar.fieldbyname('compra').value = 1 then
    ckbCompra.Checked := true
  else
    ckbCompra.Checked := false;

  if dm.qryauxiliar.fieldbyname('vende').value = 1 then
    ckbVende.Checked := true
  else
    ckbVende.Checked := false;

  if dm.qryauxiliar.fieldbyname('SUBMATERIA').value = 1 then
    ckbSubProduto.Checked := true
  else
    ckbSubProduto.Checked := false;

  try
    cbUnidadeEntrada.EditValue := dm.qryauxiliar.fieldbyname('unidade_entrada').value;
  except
    cbUnidadeEntrada.EditValue := '10';
  end;


  try
    edValorCompra.Value := dm.qryauxiliar.fieldbyname('valor_custo').value;
  except
    edValorCompra.Value := 1;
  end;

  try
    edRendimento.Value := dm.qryauxiliar.fieldbyname('rendimento').value;
  except
    edRendimento.Value := 1;
  end;

  try
    edPercPerda.Value := dm.qryauxiliar.fieldbyname('perc_perda').value;
  except
    edPercPerda.Value := 0;
  end;

  try

    edEstoqueAtual.Value := dm.qryauxiliar.fieldbyname('estoque_atual').value;
  except
    edEstoqueAtual.Value := 0;
  end;

  try
    edEstoqueMax.Value := dm.qryauxiliar.fieldbyname('quantidade_maxima').value;
  except
    edEstoqueMax.Value := 20;
  end;

  try
    edEstoqueMin.Value := dm.qryauxiliar.fieldbyname('quantidade_minima').value;
  except
    edEstoqueMin.Value := 10;
  end;

  try
    edValidade.Value := dm.qryauxiliar.fieldbyname('validade').value;
  except
    edValidade.Value := 3;
  end;

  buscaFichaTecnica();

  retornaInformacoesDeVenda();

end;

procedure TfrmCadProdutos.retornaInformacoesDeVenda();
begin

  dm.qryauxiliar.Active := false;
  dm.qryauxiliar.sql.Clear;
  dm.qryauxiliar.sql.add('select p.*, ');
  dm.qryauxiliar.sql.add('       g.descricao as descricaoGrupo,');
  dm.qryauxiliar.sql.add('       tpi.descricao as descricaoItemSped,');
  dm.qryauxiliar.sql.add('       mp.descricao as descricaoMiniprinter,');
  dm.qryauxiliar.sql.add('       al.descricao as descricaoAliquota,');
  dm.qryauxiliar.sql.add('       cf.descricao as descricaoCFOPSaida,');
  dm.qryauxiliar.sql.add('       c2.descricao as descricaoCSTSaida');
  dm.qryauxiliar.sql.add('       from produtos p');
  dm.qryauxiliar.sql.add('         inner join grupos g on (g.cod_grupo = p.cod_grupo)');
  dm.qryauxiliar.sql.add('         inner join tipos_item_sped tpi on (tpi.cod_tipo = p.cod_tipo_item)');
  dm.qryauxiliar.sql.add('         inner join miniprinters mp on (mp.cod_miniprinter = p.cod_miniprinter)');
  dm.qryauxiliar.sql.add('         inner join aliquotas al on (al.cod_aliquota = p.cod_aliquota)');
  dm.qryauxiliar.sql.add('         inner join cfop cf on (cf.codigo = p.cfop_saida)');
  dm.qryauxiliar.sql.add('         inner join cst c2 on (c2.cst = p.cst_saida)');

  dm.qryauxiliar.sql.add('   where p.cod_produto=' + Quotedstr(edCodProduto.Text));
  dm.qryauxiliar.Active := true;



   // Parâmetros para produtos de venda
  try
    cbLocalImpressao.EditValue := dm.qryauxiliar.fieldbyname('cod_miniprinter').value;
  except
  end;

  try
    cbAliquotaICMS.EditValue := dm.qryauxiliar.fieldbyname('cod_aliquota').value;
  except
  end;

  try
    ed_preco.value := dm.qryauxiliar.fieldbyname('valor_unitario').value;
  except
    ed_preco.Value := 0;
  end;

  try
    edLucroMax.value := dm.qryauxiliar.fieldbyname('lucro_maximo').value;
  except
    edLucroMax.Value := 0;
  end;

  try
    edImpostos.value := dm.qryauxiliar.fieldbyname('impostos').value;
  except
    edImpostos.Value := 0;
  end;

  try
    edOutrasTaxas.value := dm.qryauxiliar.fieldbyname('outras_taxas').value;
  except
    edOutrasTaxas.Value := 0;
  end;

  try
    ed_cod_barras.Text := dm.qryauxiliar.fieldbyname('cod_barras').value;
  except
  end;
  try
    edParametroContabil.Text := FormatFloat('#0.00', dm.qryauxiliar.fieldbyname('parametro_contagem').value);
  except
  end;
  try
    edComissao.Text := FormatFloat('#0.00', dm.qryauxiliar.fieldbyname('valor_comissao').value);
  except
  end;
  try
    ed_cefop_saidas.Text := dm.qryauxiliar.fieldbyname('cfop_saida').value;
  except
  end;
  try
    edCstSaida.Text := dm.qryauxiliar.fieldbyname('cst_saida').value;
  except
  end;
  try

    un_ecf.Text := dm.qryauxiliar.fieldbyname('un_ecf').value;
  except
  end;

  if dm.qryauxiliar.fieldbyname('fracionado').value = 1 then
    ckbVendaFracionada.Checked := true
  else
    ckbVendaFracionada.Checked := false;

  if dm.qryauxiliar.fieldbyname('balanca').value = 1 then
    ckbBalanca.Checked := true
  else
    ckbBalanca.Checked := false;

  if dm.qryauxiliar.fieldbyname('abate_ficha').value = 1 then
    ckbAbateFicha.Checked := true
  else
    ckbAbateFicha.Checked := false;

  if dm.qryauxiliar.fieldbyname('preco_digitado').value = 1 then
    ckbPrecoVariavel.Checked := true
  else
    ckbPrecoVariavel.Checked := false;

  if dm.qryauxiliar.fieldbyname('incide_servico').value = 1 then
    ckbIncideServico.Checked := true
  else
    ckbIncideServico.Checked := false;

  if dm.qryauxiliar.fieldbyname('couvert').value = 1 then
    ckbCouvert.Checked := true
  else
    ckbCouvert.Checked := false;

  if dm.qryauxiliar.fieldbyname('calcula_qtde').value = 1 then
    ckbCalculaQtde.Checked := true
  else
    ckbCalculaQtde.Checked := false;

  if (dm.qryauxiliar.fieldbyname('COD_GRUPO_TOUCH').value <> NULL) and ((dm.qryauxiliar.fieldbyname('COD_GRUPO_TOUCH').value <> '')) then
  begin
    cbGrupoTouch.EditValue := dm.qryauxiliar.fieldbyname('COD_GRUPO_TOUCH').value;
  end;

end;

procedure TfrmCadProdutos.buscaFichaTecnica();
begin
     //Busca ficha técnica.
  dm.composicoes_temp.EmptyTable;
  dm.qryauxiliar2.Active := false;
  dm.qryauxiliar2.SQL.Clear;
  dm.qryauxiliar2.SQL.add('       select cp.*, p.descricao,  ');
  dm.qryauxiliar2.SQL.add('         (cp.quantidade / un.parametro) as quantidadeReal,');
  dm.qryauxiliar2.SQL.add('         un.descricao  as desc_unidade');
  dm.qryauxiliar2.SQL.add('         from composicoes_produto cp');
  dm.qryauxiliar2.SQL.add('         inner join unidades un on (un.cod_unidade = cp.unidade)');
  dm.qryauxiliar2.SQL.add('         inner join produtos p on (p.cod_produto = cp.cod_produto_baixa)');
  dm.qryauxiliar2.sql.add('         where cp.cod_produto=' + Quotedstr(edCodProduto.Text));
  dm.qryauxiliar2.SQL.add('         order by cp.cod_produto_baixa');
  dm.qryauxiliar2.Active := true;
  dm.qryauxiliar2.First;

  while not dm.qryauxiliar2.Eof do
  begin
    dm.composicoes_temp.Append;
    dm.composicoes_tempcod_item.value := dm.qryauxiliar2.fieldbyname('cod_produto_baixa').value;
    dm.composicoes_tempcod_produto.value := dm.qryauxiliar2.fieldbyname('cod_produto').value;
    dm.composicoes_tempquantidade.Value := dm.qryauxiliar2.fieldbyname('quantidadeReal').value;
    dm.composicoes_tempdes_unidade.Value := dm.qryauxiliar2.fieldbyname('desc_unidade').value;
    dm.composicoes_tempUnidade.Value := dm.qryauxiliar2.fieldbyname('unidade').value;
    dm.composicoes_tempdescricao_item.Value := dm.qryauxiliar2.fieldbyname('descricao').value;
    dm.composicoes_temp.Post;
    dm.composicoes_temp.Refresh;
    dm.qryauxiliar2.Next;
  end;

end;

procedure TfrmCadProdutos.pesquisar_produto(tipo: integer);
begin
  dm.qry_consultas.Active := false;
  dm.qry_consultas.SQL.Clear;
  if tipo = 1 then
    dm.qry_consultas.SQL.add('select * from produtos ')
  else
    dm.qry_consultas.SQL.add('select * from produtos where acompanhamento=1');
  dm.qry_consultas.Active := true;

  if dm.qry_consultas.IsEmpty then
  begin
    if tipo = 1 then
      ShowMessage('Não existem produtos cadastrados!')
    else
      ShowMessage('Não existem acompanhamentos cadastrados!');
    bt_cancelar.Click;
    exit;
  end
  else
  begin
    Application.CreateForm(Tfrm_consulta_produtos, frm_consulta_produtos);
    tipo_consulta := tipo;
    frm_consulta_produtos.ShowModal;
    frm_consulta_produtos.Free;
  end;
end;

procedure TfrmCadProdutos.bt_pesq_ccClick(Sender: TObject);
begin
  Application.CreateForm(Tfrm_cs_c_custo, frm_cs_c_custo);
  frm_cs_c_custo.showmodal;
  frm_cs_c_custo.free;
end;

procedure TfrmCadProdutos.bt_novoClick(Sender: TObject);
begin
  controla_botoes(bt_novo);
  oquefazer := 1;
  pn_informacoes_item.Enabled := true;
  edCodProduto.Enabled := false;
  ed_cod_barras.SetFocus;

  ConfiguraCampos;
end;

procedure TfrmCadProdutos.bt_alterarClick(Sender: TObject);
begin
  oquefazer := 2;
  controla_botoes(bt_alterar);
  pn_informacoes_item.Enabled := true;
  edCodProduto.Enabled := true;
  edCodProduto.SetFocus;

end;

procedure TfrmCadProdutos.bt_excluirClick(Sender: TObject);
begin
  controla_botoes(bt_excluir);
  oquefazer := 3;
  pn_informacoes_item.Enabled := true;
  edCodProduto.Enabled := true;
  edCodProduto.SetFocus;
end;

procedure TfrmCadProdutos.bt_gravarClick(Sender: TObject);
begin

  if oquefazer = 3 then
  begin
    controla_botoes(bt_gravar);
    dm.transacao.Active := true;
    gravar_informacoes;
    dm.transacao.Commit;
    bt_cancelar.Click;
  end
  else
  begin

    if verificar_validade then
    begin
      controla_botoes(bt_gravar);
      dm.transacao.Active := true;
      gravar_informacoes;
      dm.transacao.Commit;
      dm.recriarTabelasDePreco;
      bt_cancelar.Click;
    end;
  end;

end;

procedure TfrmCadProdutos.bt_cancelarClick(Sender: TObject);
begin
  controla_botoes(bt_cancelar);
  edCodProduto.clear;

  ConfiguraCampos();

  bt_novo.SetFocus;
end;

procedure TfrmCadProdutos.pesquisa_unidade;
begin
  dm.qry_consultas.Active := false;
  dm.qry_consultas.SQL.Clear;
  dm.qry_consultas.sql.add('select descricao,sigla,parametro,cod_unidade from unidades');
  dm.qry_consultas.Active := true;
  if dm.qry_consultas.IsEmpty then
  begin
    ShowMessage('Não existe unidades cadadastradas. Não é possível continuar.');
    bt_cancelar.Click;
    string_auxiliar := '';
    exit;
  end;
  Application.CreateForm(Tfrm_cs_unidades, frm_cs_unidades);
  frm_cs_unidades.ShowModal;
  frm_cs_unidades.free;

end;

procedure TfrmCadProdutos.limpa_edits;
var
  i: Integer;
begin
  for i := 0 to ComponentCount - 1 do
  begin

    if Components[i] is TEdit then
    begin
      case TEdit(Components[i]).Tag of
        0:
          TEdit(Components[i]).Text := '';
        1:
          TEdit(Components[i]).Text := '0';
        2:
          TEdit(Components[i]).Text := '0,00';
        3:
          TEdit(Components[i]).Text := '0,000';
      end;
    end;

    if Components[i] is TMaskEdit then
    begin
      TMaskEdit(Components[i]).clear;
    end;

    if Components[i] is TRadioGroup then
    begin
      TRadioGroup(Components[i]).itemindex := 0;
    end;





//    if Components[i] is TMemo then
  //    TMemo(Components[i]).Clear;

    if Components[i] is TImage then
      TImage(Components[i]).Picture := NIL;

    if Components[i] is TPageControl then
      TPageControl(Components[i]).ActivePageIndex := 0;

    if Components[i] is TCheckListBox then
      TCheckListBox(Components[i]).Clear;

    if Components[i] is TComboBox then
      TComboBox(Components[i]).Text := '';
  end;

end;

procedure TfrmCadProdutos.ckbBalancaClick(Sender: TObject);
begin
  inherited;
  if (ckbBalanca.Checked = true) then
  begin
    ckbVendaFracionada.Checked := true;
  end
  else
  begin
    ckbVendaFracionada.Checked := ckbVendaFracionada.Checked;
  end;

end;

procedure TfrmCadProdutos.ckbSubProdutoClick(Sender: TObject);
begin
  inherited;
  if ckbSubProduto.Checked then
  begin
    ckbCompra.Checked := true;
  end
  else
  begin
    ckbCompra.Enabled := true;
  end;

end;

procedure TfrmCadProdutos.ed_cod_mini_printerExit(Sender: TObject);
var
  auxiliar: string;
begin
  inherited;
  if ((Sender is TCustomEdit and ((Sender as TCustomEdit).Name = 'ed_cod_mini_printer'))) then
  begin
    if ((Sender is TCustomEdit and (trim((Sender as TCustomEdit).text) = ''))) then
      (Sender as TCustomEdit).Text := '001';

    auxiliar := (Sender as TCustomEdit).text;
    try
      auxiliar := FormatFloat('000', StrToFloat(auxiliar));
    except
      begin
        showmessage('Código de mini printer inválido!!');
        (Sender as TCustomEdit).SetFocus;
        exit;
      end;
    end;
    (Sender as TCustomEdit).Text := auxiliar;

    if (verificaExistenciaMiniPrinter(trim((Sender as TCustomEdit).Text)) = false) then
    begin
      showmessage('Código de mini printer não existe!');
      (Sender as TCustomEdit).SetFocus;
      exit;
    end
    else
    begin
      exibeInformacoes('ed_cod_mini_printer', 'ed_desc_mini_printer', 'miniprinters', 'cod_miniprinter,descricao', 'cod_miniprinter', auxiliar, 1)
    end;

  end;
end;

procedure TfrmCadProdutos.btAdicionarFichaTecnicaClick(Sender: TObject);
begin
  inherited;
  if Verifica_validade_item = true then
  begin
    adicionar_produto;
  end;

end;

procedure TfrmCadProdutos.Excluirdaficha1Click(Sender: TObject);
var
  q: TIBQuery;
  formato, str: string;
begin

  q := TIBquery.create(self);
  q.Database := dm.dbrestaurante;
  q.Transaction := dm.transacao;
  dm.transacao.Active := false;
  dm.transacao.Active := true;
  try
    if (ShowRealDialog(frmCadProdutos, tmConfirmacao, 'Confirme', 'Confirma exclusão do ítem da ficha técnica ?') = teSim) then
    begin
      q.Active := false;
      q.SQL.clear;
      q.SQL.Add('delete from composicoes_produto where cod_produto=' + Quotedstr(dm.composicoes_tempcod_produto.Value) + ' and cod_produto_baixa=' + Quotedstr(dm.composicoes_tempcod_item.Value));
      q.ExecSQL;
      dm.transacao.Commit;
      dm.composicoes_temp.Delete;
    end;
  finally
    FreeAndNil(q);
  end;

end;

procedure TfrmCadProdutos.Excluirselecionado1Click(Sender: TObject);
begin
  inherited;
  if dmCadProduto.tbClonesTemp.IsEmpty = false then
    dmCadProduto.tbClonesTemp.delete;
end;

procedure TfrmCadProdutos.edDescTipoItemSpedKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  inherited;
  if Key = vk_f11 then
  begin
    if Sender is TCustomEdit and ((Sender as TCustomEdit).Name = 'ed_cod_item') then
    begin

      setCodItemCadastrado('');
      Application.CreateForm(Tfrm_cad_itens_estoque, frm_cad_itens_estoque);
      frm_cad_itens_estoque.setaVeioDoCadastro();
      frm_cad_itens_estoque.setCodgrupoDescricao(self.ed_cod_grupo.Text, self.ed_descricao_produto.Text);
      frm_cad_itens_estoque.ShowModal;
      frm_cad_itens_estoque.free;
      dm.transacao.Active := false;
      dm.transacao.Active := true;
      dm.composicoes_temp.Active := true;
      ed_cod_item.Text := codigoItemEstoqueCadastrado;

    end;
  end;

end;

procedure TfrmCadProdutos.Edit1KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  inherited;
  if Sender is TCustomEdit and ((Sender as TCustomEdit).Name = 'edCodProduto') then
  begin

    if string_auxiliar <> '' then
    begin
      edCodProduto.OnExit(edCodProduto);
    end;
  end;

end;

procedure TfrmCadProdutos.setCodItemCadastrado(codigo: string);
begin
  codigoItemEstoqueCadastrado := codigo;
end;

procedure TfrmCadProdutos.edDescricaoCloneKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin

  inherited;
  if Key = vk_return then
  begin
    if Sender is TCheckBox and ((Sender as TCheckBox).Name = 'ckbPizza') then
      bt_gravar.SetFocus;

  end;

end;

procedure TfrmCadProdutos.BitBtn4Click(Sender: TObject);
var
  i: integer;
  codigoGrupo: string;
  codSabor: string;
  codBT, codPQ, codMD, codGD, codFM: string;
  precoBT, precoPQ, precoMD, precoGD, precoFM: Double;
  ncm, cfop, cst, cest, aliquota: string;
begin
  inherited;
  codBT := Quotedstr('');
  codPQ := Quotedstr('');
  codMD := Quotedstr('');
  codGD := Quotedstr('');
  codFM := Quotedstr('');

  try
    ed_cod_grupo.Text := formatfloat('000', StrToFloat(ed_cod_grupo.Text));
  except
    begin
      ShowMessage('Código do grupo de produto inválido!');
      ed_cod_grupo.SetFocus;
      ed_cod_grupo.Clear;

      exit;
    end;
  end;
  dm.qryauxiliar.Active := false;
  dm.qryauxiliar.SQL.Clear;
  dm.qryauxiliar.SQL.add('select * from grupos where cod_grupo=' + Quotedstr(ed_cod_grupo.Text));
  dm.qryauxiliar.Active := true;
  if dm.qryauxiliar.IsEmpty then
  begin
    ShowMessage('Não existe grupo cadastrado com o código informado!');
    ed_cod_grupo.clear;
    ed_desc_grupo.clear;
    ed_cod_grupo.setfocus;

    exit;
  end;

  if length(trim(ed_cod_grupo.text)) < 6 then
  begin
    showmessage('O grupo selecionado não é um grupo-filho. Selecione uma ramificação no menor nível do grupo escolhido');
    ed_cod_grupo.clear;
    ed_desc_grupo.clear;
    ed_cod_grupo.setfocus;

    exit;
  end;

  codigoGrupo := ed_cod_grupo.Text;
  precoBT := EDprecoPizzaBT.Value;
  precoPQ := edPrecoPizzaPQ.Value;
  precoMD := edPrecoPizzaMD.Value;
  precoGD := edPrecoPizzaGD.Value;
  precoFM := edPrecoPizzaFM.Value;

  ncm := edCodNCM.Text;
  cfop := ed_cefop_saidas.Text;
  cest := edCest.Text;
  cst := edCstSaida.Text;
  aliquota := cbAliquotaICMS.EditValue;

  for i := 0 to memoSabores.Lines.Count - 1 do
  begin
    if (trim(memoSabores.Lines[i]) <> '') then
    begin

      if (precoBT > 0) then
      begin
             //Broto
        bt_novo.Click;
        ed_cod_grupo.Text := codigoGrupo;
        cbGrupoTouch.EditValue := '01';
        ckbVende.Checked := true;
        ed_descricao_produto.Text := 'PIZZA ' + memoSabores.Lines[i];
        ed_descricao_produto.Text := ed_descricao_produto.Text + ' BT';
        ckbPizza.Checked := true;
        rdTamanhoPizza.ItemIndex := 0;
        ed_preco.Value := precoBT;
        bt_gravar.Click;
        codBT := ultimoCodigo;
      end;

      if (precoPQ > 0) then
      begin
             //PEQUENA
        bt_novo.Click;
        edCodNCM.Text := ncm;
        ed_cefop_saidas.Text := cfop;
        edCest.Text := cest;
        edCstSaida.Text := cst;
        cbAliquotaICMS.EditValue := aliquota;

        ed_cod_grupo.Text := codigoGrupo;
        cbGrupoTouch.EditValue := '01';
        ckbVende.Checked := true;
        ed_descricao_produto.Text := 'PIZZA ' + memoSabores.Lines[i];
        ed_descricao_produto.Text := ed_descricao_produto.Text + ' PQ';
        ckbPizza.Checked := true;
        rdTamanhoPizza.ItemIndex := 1;
        ed_preco.Value := precoPQ;
        bt_gravar.Click;
        codPQ := ultimoCodigo;
      end;

      if (precoMD > 0) then
      begin
             //MEDIA
        bt_novo.Click;
        edCodNCM.Text := ncm;
        ed_cefop_saidas.Text := cfop;
        edCest.Text := cest;
        edCstSaida.Text := cst;
        cbAliquotaICMS.EditValue := aliquota;

        ed_cod_grupo.Text := codigoGrupo;
        cbGrupoTouch.EditValue := '01';
        ckbVende.Checked := true;
        ed_descricao_produto.Text := 'PIZZA ' + memoSabores.Lines[i];
        ed_descricao_produto.Text := ed_descricao_produto.Text + ' MD';
        ckbPizza.Checked := true;
        rdTamanhoPizza.ItemIndex := 2;
        ed_preco.Value := precoMD;
        bt_gravar.Click;
        codMD := ultimoCodigo;
      end;

      if (precoGD > 0) then
      begin
            //GRANDE
        bt_novo.Click;
        edCodNCM.Text := ncm;
        ed_cefop_saidas.Text := cfop;
        edCest.Text := cest;
        edCstSaida.Text := cst;
        cbAliquotaICMS.EditValue := aliquota;
        ed_cod_grupo.Text := codigoGrupo;
        cbGrupoTouch.EditValue := '01';
        ckbVende.Checked := true;
        ed_descricao_produto.Text := 'PIZZA ' + memoSabores.Lines[i];
        ed_descricao_produto.Text := ed_descricao_produto.Text + ' GD';
        ckbPizza.Checked := true;
        rdTamanhoPizza.ItemIndex := 3;
        ed_preco.Value := precoGD;
        bt_gravar.Click;
        codGD := ultimoCodigo;
      end;

      if (precoFM > 0) then
      begin
           //FAMILIA
        bt_novo.Click;
        edCodNCM.Text := ncm;
        ed_cefop_saidas.Text := cfop;
        edCest.Text := cest;
        edCstSaida.Text := cst;
        cbAliquotaICMS.EditValue := aliquota;
        ed_cod_grupo.Text := codigoGrupo;
        cbGrupoTouch.EditValue := '01';
        ckbVende.Checked := true;
        ed_descricao_produto.Text := 'PIZZA ' + memoSabores.Lines[i];
        ed_descricao_produto.Text := ed_descricao_produto.Text + ' FM';
        ckbPizza.Checked := true;
        rdTamanhoPizza.ItemIndex := 4;
        ed_preco.Value := precoFM;
        bt_gravar.Click;
        codFM := ultimoCodigo;
             ///
      end;

      codSabor := dm.geraCodigo('G_SABORES_PIZZA', 3);
      dm.qryauxiliar.Active := false;
      dm.qryauxiliar.SQL.Clear;
      dm.qryauxiliar.SQL.Add('insert into sabores_pizza (codigo,descricao,');
      dm.qryauxiliar.SQL.Add(' BBALCAO,BDELIVERY,PBALCAO,PDELIVERY,MBALCAO,MDELIVERY,');
      dm.qryauxiliar.SQL.Add(' GBALCAO,GDELIVERY,FBALCAO,FDELIVERY) VALUES (');
      DM.qryauxiliar.SQL.Add('' + QUOTEDSTR(codSabor) + ',');
      DM.qryauxiliar.SQL.Add('' + QUOTEDSTR(UpperCase(memoSabores.Lines[i])) + ',');
      DM.qryauxiliar.SQL.Add('' + (codBT) + ',');
      DM.qryauxiliar.SQL.Add('' + (codBT) + ',');
      DM.qryauxiliar.SQL.Add('' + (codPQ) + ',');
      DM.qryauxiliar.SQL.Add('' + (codPQ) + ',');
      DM.qryauxiliar.SQL.Add('' + (codMD) + ',');
      DM.qryauxiliar.SQL.Add('' + (codMD) + ',');
      DM.qryauxiliar.SQL.Add('' + (codGD) + ',');
      DM.qryauxiliar.SQL.Add('' + (codGD) + ',');
      DM.qryauxiliar.SQL.Add('' + (codFM) + ',');
      DM.qryauxiliar.SQL.Add('' + (codFM) + ')');
          //////dm.adicionalog(dm.qryauxiliar.SQL.Text);
      dm.qryauxiliar.ExecSQL;
      dm.transacao.Commit;
    end;

  end;

  Showmessage('Sabor(es) cadastrado(s)!');
  Close;
end;

procedure TfrmCadProdutos.BitBtn6Click(Sender: TObject);
var
  sqlClone: string;
  codigoProduto: string;
  precoClone: string;
  codBarrasClone: string;
  DescricaoClone: string;
  LListaSQL: TList<string>;
begin
  inherited;

  LListaSQL := TList<string>.create;
  try

    try
      if (dmCadProduto.tbClonesTemp.IsEmpty = false) then
      begin

        dmCadProduto.tbClonesTemp.first;
        while not dmCadProduto.tbClonesTemp.eof do
        begin
          codigoProduto := dm.geraCodigo('G_PRODUTOS', 5);
          codBarrasClone := codigoProduto;
          DescricaoClone := UpperCase(dmCadProduto.tbClonesTempDescricao.Value);
          precoClone := dm.TrocaVirgPPto(Floattostr(dmCadProduto.tbClonesTempvalor.Value));

          sqlClone := 'INSERT INTO PRODUTOS (COD_PRODUTO,COD_BARRAS, DESCRICAO,DESCRICAO_REDUZIDA, VALOR_UNITARIO, DATA_CADASTRO, ULTIMA_VENDA,' + '       NUMERO_VENDAS, COD_ALIQUOTA, CAMINHO_FOTO,  ACOMPANHAMENTO,' + '       PERMITE_ACOMPANHAMENTO, ACOMPANHAMENTOS_FIXOS, NUMERO_ACOMPANHAMENTOS,' + '       LUCRO_MAXIMO, LUCRO_MINIMO, PRODUTO_FINAL, ITEM_ASSOCIADO, COD_GRUPO,' + '       CARDAPIO, TEMPO, OBS_LANCAMENTO, COD_MINIPRINTER, PARAMETRO_CONTAGEM,' +
            '       BALANCA, FRACIONADO, PRECO_DIGITADO, INFORMAR_SABOR, COMISSIONADO,' + '       VALOR_COMISSAO, INCIDE_SERVICO, COUVERT, CUSTODIGITADO,' + '       CALCULA_QTDE, PIZZA, TAM_PIZZA, IMP_DELIVERY, IMP_MESAS, IMP_BALCAO, COMPRA,' + '       VENDE, COD_TIPO_ITEM, COD_GENERO, NCM, IPPT, IAT, DATA_ULTIMA_REPOSICAO,' + '       VALOR_CUSTO, QUANTIDADE_MAXIMA, QUANTIDADE_MINIMA, ESTOQUE_LIQUIDO, UNIDADE_ENTRADA,' + '       COD_UNIDADE_FRACAO,CEST,CFOP, CST, CFOP_SAIDA, CST_SAIDA, UN_ECF, SUBMATERIA,'
            + '       CFOP_TRANSFERENCIAS, CST_TRANSFERENCIAS, CFOP_DEVOLUCAO, CST_DEVOLUCAO, ' + '       CST_PIS_COFINS, ALIQ_PIS, ALIQ_COFINS, ESTOQUE_VISIVEL, QTD_GUARNICOES,' + '       GUARNICOES_FIXAS, COD_GRUPO_TOUCH, REQUER_OBSERVACAO, imprimir_ficha, ' + '       COD_GRUPO_APURACAO, RENDIMENTO,perc_perda, BALANCA_LEITURA, VALOR_UNITARIO_02,' + '        REDUCAO_BASE_ICMS)' + '      select' + '       ' + Quotedstr(codigoProduto) + ',' + '       ' + Quotedstr(codBarrasClone) + ',' + QuotedStr(DescricaoClone)
            + ',' + QuotedStr('') + ',' + precoClone + ', DATA_CADASTRO, ULTIMA_VENDA,' + '       NUMERO_VENDAS, COD_ALIQUOTA, CAMINHO_FOTO , ACOMPANHAMENTO,' + '       PERMITE_ACOMPANHAMENTO, ACOMPANHAMENTOS_FIXOS, NUMERO_ACOMPANHAMENTOS,' + '       LUCRO_MAXIMO, LUCRO_MINIMO, PRODUTO_FINAL, ITEM_ASSOCIADO, COD_GRUPO,' + '       CARDAPIO, TEMPO, OBS_LANCAMENTO, COD_MINIPRINTER, PARAMETRO_CONTAGEM,' + '       BALANCA, FRACIONADO, PRECO_DIGITADO, INFORMAR_SABOR, COMISSIONADO,' +
            '       VALOR_COMISSAO, INCIDE_SERVICO, COUVERT, CUSTODIGITADO,' + '       CALCULA_QTDE, PIZZA, TAM_PIZZA, IMP_DELIVERY, IMP_MESAS, IMP_BALCAO, COMPRA,' + '       VENDE, COD_TIPO_ITEM, COD_GENERO, NCM, IPPT, IAT, DATA_ULTIMA_REPOSICAO,' + '       VALOR_CUSTO, QUANTIDADE_MAXIMA, QUANTIDADE_MINIMA, ESTOQUE_LIQUIDO, UNIDADE_ENTRADA,' + '       COD_UNIDADE_FRACAO,CEST, CFOP, CST, CFOP_SAIDA, CST_SAIDA, UN_ECF, SUBMATERIA,' +
            '       CFOP_TRANSFERENCIAS, CST_TRANSFERENCIAS, CFOP_DEVOLUCAO,  CST_DEVOLUCAO,' + '       CST_PIS_COFINS, ALIQ_PIS, ALIQ_COFINS, ESTOQUE_VISIVEL, QTD_GUARNICOES,' + '       GUARNICOES_FIXAS, COD_GRUPO_TOUCH, REQUER_OBSERVACAO,imprimir_ficha, ' + '       COD_GRUPO_APURACAO, RENDIMENTO, perc_perda, BALANCA_LEITURA, VALOR_UNITARIO_02,' + '       REDUCAO_BASE_ICMS from produtos p ';

          sqlClone := sqlClone + 'where p.cod_produto=' + Quotedstr(edCodProduto.Text);

          LListaSQL.Add(sqlClone + ';');
          dmCadProduto.tbClonesTemp.Next;
        end;

        dm.ExecutaBlocoDeInstrucoes(LListaSQL, 10);
        ShowRealDialog(frm_principal, tmSucesso, 'Sucesso', 'Clones gerados com sucesso!');
        dmCadProduto.tbClonesTemp.active := false;
        dmCadProduto.tbClonesTemp.active := true;
      end
      else
      begin
        showRealDialog(frm_principal, tmErro, 'Erro', 'Nenhum clone na lista!', 22, false);
      end;

    except
      on E: Exception do
      begin
        showRealDialog(frm_principal, tmErro, 'Erro', 'Erro ao gerar clones!' + sLineBreak + sLineBreak + e.Message, 22, false);
      end;

    end;

  finally
    FreeAndNil(LListaSQL);
  end;
end;

end.

