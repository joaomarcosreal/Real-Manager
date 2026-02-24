unit uu_produtos;

interface

uses
  Windows, Messages, SysUtils, Variants, RealFramework, Classes, Graphics,
  uuConfirmaAgrupamentoProduto, Clipbrd, uuRelFichasTecnicas, Controls, Forms,
  System.Generics.Collections, Dialogs, StdCtrls, ExtCtrls, Buttons, Grids,
  System.Types, DBGrids, ComCtrls, Mask, ImgList, CheckLst, uu_modelo_vazio,
  Data.DB, Vcl.Menus, ibx.Ibquery, DBCtrls, RxCurrEdit, uuDMCadProdutos,
  cxGraphics, cxControls, cxMaskEdit, cxDBLookupComboBox, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, System.ImageList, cxTextEdit,
  cxDropDownEdit, cxLookupEdit, cxDBLookupEdit, RxToolEdit, PngSpeedButton,
  cxStyles, cxDataStorage, cxNavigator, cxDBData, cxCheckBox, cxCurrencyEdit,
  cxGridLevel, cxGridCustomTableView, cxGridTableView, cxGridBandedTableView,
  cxGridDBBandedTableView, cxClasses, cxGridCustomView, cxGrid, JvPageList,
  JvExControls, AdvGlassButton, cxGridDBTableView, dxBarBuiltInMenu,
  cxGridCustomPopupMenu, cxGridPopupMenu, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, cxCustomData, cxFilter, cxData, dxDateRanges,
  dxScrollbarAnnotations;

type
  Tfrm_produtos = class(Tfrm_modelo_vazio)
    pic_dialog: TOpenDialog;
    ImageList1: TImageList;
    PopupMenu1: TPopupMenu;
    Excluirdaficha1: TMenuItem;
    pgPrincipalForm: TJvPageList;
    pgListagem: TJvStandardPage;
    Panel1: TPanel;
    btSalvar: TPngSpeedButton;
    btSair: TPngSpeedButton;
    btNovo: TPngSpeedButton;
    Panel7: TPanel;
    Label1: TLabel;
    PngSpeedButton8: TPngSpeedButton;
    Panel32: TPanel;
    Panel33: TPanel;
    Panel34: TPanel;
    Label48: TLabel;
    Shape7: TShape;
    edParamentroListagemProdutos: TEdit;
    Panel35: TPanel;
    cxGrid1: TcxGrid;
    gridListagem: TcxGridDBBandedTableView;
    gridListagemSELECIONADO: TcxGridDBBandedColumn;
    gridListagemVENDE: TcxGridDBBandedColumn;
    gridListagemCOMPRA: TcxGridDBBandedColumn;
    gridListagemCOD_PRODUTO: TcxGridDBBandedColumn;
    gridListagemDESCRICAO: TcxGridDBBandedColumn;
    gridListagemGRUPO: TcxGridDBBandedColumn;
    gridListagemVALOR_UNITARIO: TcxGridDBBandedColumn;
    gridListagemGRUPOTOUCH: TcxGridDBBandedColumn;
    gridListagemVALOR_CUSTO: TcxGridDBBandedColumn;
    gridListagemQUANTIDADE_MAXIMA: TcxGridDBBandedColumn;
    gridListagemQUANTIDADE_MINIMA: TcxGridDBBandedColumn;
    gridListagemCOD_BARRAS: TcxGridDBBandedColumn;
    gridListagemRENDIMENTO: TcxGridDBBandedColumn;
    gridListagemNCM: TcxGridDBBandedColumn;
    gridListagemCEST: TcxGridDBBandedColumn;
    gridListagemCFOP_SAIDA: TcxGridDBBandedColumn;
    gridListagemCST_SAIDA: TcxGridDBBandedColumn;
    gridListagemPERC_PERDA: TcxGridDBBandedColumn;
    cxGrid1Level1: TcxGridLevel;
    pgControle: TJvStandardPage;
    pglControle: TJvPageList;
    pgCadastro: TJvStandardPage;
    pgFichaTecnica: TJvStandardPage;
    Panel48: TPanel;
    Label82: TLabel;
    PngSpeedButton3: TPngSpeedButton;
    Panel49: TPanel;
    Panel50: TPanel;
    Panel51: TPanel;
    Label83: TLabel;
    Label84: TLabel;
    Label85: TLabel;
    Label86: TLabel;
    btNovoPedido: TPngSpeedButton;
    PngSpeedButton4: TPngSpeedButton;
    cbInsumoAdicionar: TcxLookupComboBox;
    cxLookupComboBox7: TcxLookupComboBox;
    edQuantidadeFichaTecnica: TCurrencyEdit;
    DBGrid1: TDBGrid;
    GroupBox6: TGroupBox;
    Image1: TImage;
    Panel52: TPanel;
    Panel53: TPanel;
    Panel54: TPanel;
    Label87: TLabel;
    Label88: TLabel;
    CurrencyEdit13: TCurrencyEdit;
    Panel55: TPanel;
    Label89: TLabel;
    Memo1: TMemo;
    Panel56: TPanel;
    lbNomeProdutoFichaTecnica: TLabel;
    Panel57: TPanel;
    pgOutros: TJvStandardPage;
    Panel58: TPanel;
    Panel59: TPanel;
    Panel60: TPanel;
    Panel61: TPanel;
    Panel62: TPanel;
    btSalvarCadastro: TPngSpeedButton;
    PngSpeedButton10: TPngSpeedButton;
    PngSpeedButton11: TPngSpeedButton;
    pnCadastro: TPanel;
    pnDadosBasicosProduto: TPanel;
    Panel14: TPanel;
    pnOutrasInformaceos: TPanel;
    Panel9: TPanel;
    Shape3: TShape;
    Label39: TLabel;
    pnDisponibilidade: TPanel;
    Panel12: TPanel;
    Shape2: TShape;
    Label37: TLabel;
    Label3: TLabel;
    Label19: TLabel;
    Label2: TLabel;
    Label18: TLabel;
    bt_pesq_grupo: TSpeedButton;
    Label21: TLabel;
    Label4: TLabel;
    Label9: TLabel;
    Label40: TLabel;
    Label43: TLabel;
    Label44: TLabel;
    Panel11: TPanel;
    Shape1: TShape;
    Label34: TLabel;
    Panel3: TPanel;
    Label23: TLabel;
    ed_desc_grupo: TEdit;
    pnTitulo: TPanel;
    lbTitulo: TLabel;
    pnInformacoesGerais: TPanel;
    Label20: TLabel;
    edParametroContabil: TCurrencyEdit;
    Panel13: TPanel;
    Shape4: TShape;
    Label36: TLabel;
    Panel19: TPanel;
    Panel20: TPanel;
    pnCodigosFiscais: TPanel;
    Label14: TLabel;
    Label26: TLabel;
    Label7: TLabel;
    Label6: TLabel;
    Label8: TLabel;
    Panel18: TPanel;
    pnICMS: TPanel;
    Label24: TLabel;
    Label25: TLabel;
    Panel16: TPanel;
    pnPis: TPanel;
    Label28: TLabel;
    Label29: TLabel;
    Panel22: TPanel;
    pnConfins: TPanel;
    Label13: TLabel;
    Label27: TLabel;
    Panel25: TPanel;
    edAliquotaCofins: TCurrencyEdit;
    edCstPIS: TEdit;
    pnSPED: TPanel;
    btPesqTipoItemSped: TSpeedButton;
    Label12: TLabel;
    btPesqGeneroItem: TSpeedButton;
    Label15: TLabel;
    Panel27: TPanel;
    edCodTipoItemSped: TEdit;
    edCodGeneroItem: TEdit;
    Panel28: TPanel;
    Panel29: TPanel;
    Panel30: TPanel;
    Panel31: TPanel;
    ed_cod_barras: TEdit;
    ed_descricao_produto: TEdit;
    ed_preco: TCurrencyEdit;
    ed_cod_grupo: TEdit;
    cbGrupoTouch: TcxLookupComboBox;
    cbLocalImpressao: TcxLookupComboBox;
    edComissao: TCurrencyEdit;
    edMaoObra: TCurrencyEdit;
    edValidade: TCurrencyEdit;
    cbContaGerencial: TcxLookupComboBox;
    rdIPPT: TRadioGroup;
    rdIAT: TRadioGroup;
    ckbCompra: TCheckBox;
    ckbVende: TCheckBox;
    ckbSubProduto: TCheckBox;
    ed_cefop_saidas: TEdit;
    edCstSaida: TEdit;
    edCodNCM: TEdit;
    edCest: TEdit;
    un_ecf: TEdit;
    cbAliquotaICMS: TcxLookupComboBox;
    edReducaoBase: TCurrencyEdit;
    edAliquotaPis: TCurrencyEdit;
    edCstPisCofins: TEdit;
    pnInformacoesBasicas: TPanel;
    Panel2: TPanel;
    pnFichaTecnica: TPanel;
    Panel5: TPanel;
    Shape6: TShape;
    Label42: TLabel;
    Panel6: TPanel;
    dbg_ficha_tec: TDBGrid;
    Panel4: TPanel;
    bt_pesq_item_estoque_cod: TSpeedButton;
    Label17: TLabel;
    Label22: TLabel;
    Label5: TLabel;
    Panel8: TPanel;
    Label10: TLabel;
    ed_desc_item: TEdit;
    ed_cod_un_entrada: TEdit;
    ed_cod_item: TEdit;
    ed_qtd_item: TCurrencyEdit;
    BitBtn1: TBitBtn;
    cbUnidadeFichaTecnica: TcxLookupComboBox;
    pnInformacoesEstoque: TPanel;
    Label31: TLabel;
    Label32: TLabel;
    Label35: TLabel;
    Label38: TLabel;
    Label16: TLabel;
    Label11: TLabel;
    Label45: TLabel;
    Label30: TLabel;
    Label33: TLabel;
    Panel24: TPanel;
    Shape5: TShape;
    Label41: TLabel;
    ckbRequerObs: TCheckBox;
    ckbBalanca: TCheckBox;
    ckbVendaFracionada: TCheckBox;
    ckbImprimeFichaFF: TCheckBox;
    ckbPrecoVariavel: TCheckBox;
    ckbIncideServico: TCheckBox;
    ckbCalculaQtde: TCheckBox;
    ckbCouvert: TCheckBox;
    cbUnidadeEntrada: TcxLookupComboBox;
    edEstoqueMax: TCurrencyEdit;
    edEstoqueMin: TCurrencyEdit;
    edValorCompra: TCurrencyEdit;
    CurrencyEdit1: TCurrencyEdit;
    edPercPerda: TCurrencyEdit;
    edEstoqueAtual: TCurrencyEdit;
    edRendimento: TCurrencyEdit;
    cxLookupComboBox1: TcxLookupComboBox;
    ckbAbateFicha: TCheckBox;
    pgClones: TJvStandardPage;
    cxStyleRepository1: TcxStyleRepository;
    cxStyle2: TcxStyle;
    cxStyle1: TcxStyle;
    pmMenuListagemProdutos: TPopupMenu;
    cxPopClones: TcxGridPopupMenu;
    Editarproduto1: TMenuItem;
    Clonaresteproduto1: TMenuItem;
    Excluiresteproduto1: TMenuItem;
    N1: TMenuItem;
    Visualizarfichastcnicasdoprodutoouqueocontenham1: TMenuItem;
    N2: TMenuItem;
    Desativaresteproduto1: TMenuItem;
    Desativarapenasparavenda1: TMenuItem;
    N3: TMenuItem;
    Desativarapenasparacompra1: TMenuItem;
    AtivarprodutoCompraevenda1: TMenuItem;
    Ativarapenasparacompra1: TMenuItem;
    Ativarapenasparavenda1: TMenuItem;
    gridListagemFichaTec: TcxGridDBBandedColumn;
    N4: TMenuItem;
    C1: TMenuItem;
    F1: TMenuItem;
    N5: TMenuItem;
    E1: TMenuItem;
    cxGridPopupMenu2: TcxGridPopupMenu;
    popClones: TPopupMenu;
    A1: TMenuItem;
    N6: TMenuItem;
    A2: TMenuItem;
    pgOpcoesClone: TJvPageList;
    pgDadosClone: TJvStandardPage;
    pgAdicionarEmLote: TJvStandardPage;
    cxGrid2: TcxGrid;
    gridClones: TcxGridDBTableView;
    cxgrdbclmnListagemProdutosDescricao: TcxGridDBColumn;
    cxgrdbclmnListagemProdutosvalor: TcxGridDBColumn;
    cxgrdbclmnGrid2DBTableView1CodBarras: TcxGridDBColumn;
    cxGrid2Level1: TcxGridLevel;
    Panel10: TPanel;
    lbCloneProdutoTitulo: TLabel;
    Panel15: TPanel;
    Panel17: TPanel;
    Label47: TLabel;
    Panel21: TPanel;
    Label49: TLabel;
    Label50: TLabel;
    Label51: TLabel;
    edDescricaoClone: TEdit;
    edPrecoVendaClone: TCurrencyEdit;
    edCodigoBarrasClone: TEdit;
    btAdicionarClone: TAdvGlassButton;
    Panel23: TPanel;
    btSalvarClones: TPngSpeedButton;
    btSairClones: TPngSpeedButton;
    Panel26: TPanel;
    lbNomeProdutoClone: TLabel;
    Label46: TLabel;
    Panel36: TPanel;
    Label52: TLabel;
    Panel37: TPanel;
    Panel38: TPanel;
    Panel39: TPanel;
    Panel40: TPanel;
    Panel41: TPanel;
    Panel42: TPanel;
    Panel43: TPanel;
    Panel44: TPanel;
    Label53: TLabel;
    Label54: TLabel;
    Label55: TLabel;
    memoClonesDescricao: TMemo;
    memoClonesPreco: TMemo;
    memoClonesCodBarras: TMemo;
    PngSpeedButton1: TPngSpeedButton;
    PngSpeedButton2: TPngSpeedButton;
    edPrefixo: TEdit;
    rdPrefixo: TRadioButton;
    rdSufixo: TRadioButton;
    SpeedButton1: TSpeedButton;
    A3: TMenuItem;
    procedure A2Click(Sender: TObject);
    procedure A3Click(Sender: TObject);
    function ConfiguraCampos: boolean;
    function Verifica_validade_item: boolean;
    function adicionar_produto: boolean;
    procedure Ativarapenasparacompra1Click(Sender: TObject);
    procedure Ativarapenasparavenda1Click(Sender: TObject);
    procedure AtivarprodutoCompraevenda1Click(Sender: TObject);
    function verificar_validade: boolean;
    function validacaoDeVenda: boolean;
    function validacaoDeEstoque: boolean;
    function SalvarInformacoes: boolean;
    procedure limpa_edits;
    procedure pesquisar_produto(tipo: integer);
    procedure pesquisa_unidade;
    procedure retornaInformacoesGerais();
    procedure retornaInformacoesDeVenda();
    procedure buscaFichaTecnica();
    procedure edCodBarrasProdutoKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure bt_adicionarClick(Sender: TObject);
    procedure bt_sairClick(Sender: TObject);
    procedure edCodProdutoEnter(Sender: TObject);
    procedure bt_pesq_ccClick(Sender: TObject);
    procedure ckbBalancaClick(Sender: TObject);
    procedure ed_cod_mini_printerExit(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure Excluirdaficha1Click(Sender: TObject);
    procedure edDescTipoItemSpedKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure setCodItemCadastrado(codigo: string);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure ckbSubProdutoClick(Sender: TObject);
    procedure edParamentroListagemProdutosKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btSairClick(Sender: TObject);
    procedure gridListagemCellDblClick(Sender: TcxCustomGridTableView; ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton; AShift: TShiftState; var AHandled: Boolean);
    procedure Editarcadastro1Click(Sender: TObject);
    procedure btSalvarCadastroClick(Sender: TObject);
    procedure btNovoClick(Sender: TObject);
    procedure PngSpeedButton10Click(Sender: TObject);
    procedure PngSpeedButton8Click(Sender: TObject);
    procedure btAdicionarCloneClick(Sender: TObject);
    procedure Clonaresteproduto1Click(Sender: TObject);
    procedure edCodigoBarrasCloneKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure btSalvarClonesClick(Sender: TObject);
    procedure C1Click(Sender: TObject);
    procedure cbContaGerencialKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure Desativarapenasparacompra1Click(Sender: TObject);
    procedure Desativarapenasparavenda1Click(Sender: TObject);
    procedure Desativaresteproduto1Click(Sender: TObject);
    procedure E1Click(Sender: TObject);
    procedure Editarproduto1Click(Sender: TObject);
    procedure Excluiresteproduto1Click(Sender: TObject);
    procedure Visualizarfichastcnicasdoprodutoouqueocontenham1Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure gridListagemCellClick(Sender: TcxCustomGridTableView; ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton; AShift: TShiftState; var AHandled: Boolean);
    procedure gridListagemKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure PngSpeedButton1Click(Sender: TObject);
    procedure PngSpeedButton2Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
  private
    { Private declarations }
    LPodeFecharTela: Boolean;
    LCodProdutoSelecionado: string;
    LAbrirCadastroProdutoSelecionado: boolean;
    LNovoProdutoEditandoFicha: boolean;
    LCodUltimoProdutoSalvo: string;
    LConsultaVeioDoCadastro: Boolean;
    LTipoOperacaoCadastro: TTipoOperacaoCRUD;

    procedure EditarCadastroSelecionado;
    procedure CancelarEdicaoProduto;
    procedure SalvarFichaTecnica(AListaSQL: TList<string>);
    procedure ValidaDadosDoClone;
    procedure AbrirPaginaDeClones(LNomeProduto: string);
    procedure CancelarAdicaoDeCLones;
    procedure InserirClone(ACodBarras, ADescricao: string; AValorUnitario: Double);
    function GetSQLGeracaoClones: string;
    procedure GerarClonesDoProduto(ACodigoProdutoReferencia: string);
    procedure ConfirmarGeracaoDeCLones;
    procedure ValidarDados;
    procedure ConfirmaExclusaoDeProduto(ACodProduto: string);
    procedure AtivarOuDesativar(AOpcao: integer);
    procedure AdicionarClonesEmLote;
    function LimparValor(const AValor: string): string;
    procedure SelecionaProduto;

  public
    { Public declarations }
    codigoItemEstoqueCadastrado: string;
    procedure FiltrarConsultaProdutos(AParametro: string);
    procedure setCodProdutoSelecionado(ACodigo: string);
    procedure setAbriCadastroSelecionado;

  end;

var
  frm_produtos: Tfrm_produtos;
  oquefazer: integer;
  calcula_inverso: boolean;
  codigo_item: string;
  ultimoCodigo: string;

implementation

uses
  uu_data_module, uu_frm_principal, uu_cs_produtos, uu_cs_c_custo,
  uu_cs_unidades, uu_cad_itens_estoque;

{$R *.dfm}

procedure Tfrm_produtos.A2Click(Sender: TObject);
begin
  pgAdicionarEmLote.Show;
end;

procedure Tfrm_produtos.A3Click(Sender: TObject);
begin
  try
    dmCadProduto.tbListagemProdutos.Filter := 'selecionado = 1';
    dmCadProduto.tbListagemProdutos.Filtered := true;

    if dmCadProduto.tbListagemProdutos.RecordCount >= 2 then
    begin
      application.CreateForm(TfrmConfirmacaoAgrupamentoProdutos, frmConfirmacaoAgrupamentoProdutos);
      frmConfirmacaoAgrupamentoProdutos.ShowModal;
      frmConfirmacaoAgrupamentoProdutos.Free;

    end
    else
    begin
      ShowRealDialog(frm_principal, tmErro, 'Erro', 'Não há produtos selecionados!', 22, true);
    end;

  finally
    dmCadProduto.tbListagemProdutos.Filter := '';
    FiltrarConsultaProdutos(edParamentroListagemProdutos.Text);
    dmCadProduto.tbListagemProdutos.Filtered := false;
  end;

end;

procedure Tfrm_produtos.Clonaresteproduto1Click(Sender: TObject);
begin
  inherited;
  LCodProdutoSelecionado := dmCadProduto.tbListagemProdutos.Fieldbyname('cod_produto').value;
  AbrirPaginaDeClones(dmCadProduto.tbListagemProdutos.Fieldbyname('descricao').value);
end;

function Tfrm_produtos.ConfiguraCampos: boolean;
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
  edMaoObra.Value := 0;
  edValidade.Value := 3;

  cbContaGerencial.EditValue := '000000';
  cbAliquotaICMS.Text := '01';
  edReducaoBase.Value := 0;
  edCodTipoItemSped.Text := '00';
  ed_cefop_saidas.Text := '5102';
  edCstSaida.Text := '000';
  edCstPisCofins.Text := '01';
  edCest.Text := '';
  edCodNCM.Text := '21069090';
  cbAliquotaICMS.EditValue := '08';

  un_ecf.Text := 'UN';
  cbUnidadeEntrada.EditValue := '10';

  cbGrupoTouch.EditValue := '01';
  cbLocalImpressao.EditValue := '001';
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
  dm.composicoes_temp.active := false;
  dm.composicoes_temp.active := true;
end;

procedure Tfrm_produtos.gridListagemCellDblClick(Sender: TcxCustomGridTableView; ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton; AShift: TShiftState; var AHandled: Boolean);
begin
  inherited;
  LCodProdutoSelecionado := dmCadProduto.tbListagemProdutos.FieldByName('cod_produto').Value;
  EditarCadastroSelecionado();

end;

procedure Tfrm_produtos.Editarcadastro1Click(Sender: TObject);
begin
  inherited;
  EditarCadastroSelecionado();
end;

procedure Tfrm_produtos.EditarCadastroSelecionado();
begin
  oquefazer := 2;

  retornaInformacoesGerais;
  pgControle.Show;
  ed_descricao_produto.SetFocus;

end;

procedure Tfrm_produtos.edCodBarrasProdutoKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin

  if Key = vk_return then
  begin
    if not ((Sender is TMemo) or (Sender is Tdbgrid)) then
    begin
      Perform(WM_NEXTDLGCTL, 0, 0);
      Key := 0;
    end;
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

end;

procedure Tfrm_produtos.edCodigoBarrasCloneKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  inherited;
  if Key = vk_return then
  begin
    btAdicionarClone.click;
  end;
end;

function Tfrm_produtos.verifica_validade_item: boolean;
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

function Tfrm_produtos.adicionar_produto: boolean;
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
  dm.composicoes_tempcod_produto.Value := LCodProdutoSelecionado;
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

procedure Tfrm_produtos.bt_adicionarClick(Sender: TObject);
begin
  if Verifica_validade_item = true then
  begin
    adicionar_produto;
  end;
end;

procedure Tfrm_produtos.bt_sairClick(Sender: TObject);
begin
  close;
end;

function Tfrm_produtos.verificar_validade: boolean;
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

function Tfrm_produtos.validacaoDeEstoque: boolean;
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

function Tfrm_produtos.validacaoDeVenda: boolean;
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
    dm.qryauxiliar.sql.add('select * from produtos where cod_barras=' + Quotedstr(ed_cod_barras.Text) + ' and cod_produto <> ' + Quotedstr(LCodProdutoSelecionado));
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

procedure Tfrm_produtos.ValidarDados();
var
  LDummyInteiro: LongInt;
  CFOP_SUBSTITUICAO: array of string;
begin
  CFOP_SUBSTITUICAO := ['5403', '5405', '6403', '6405', '6404', '5154', '6154'];

  if trim(ed_descricao_produto.Text) = '' then
    raise Exception.Create('Descrição do produto não é válida!');

  if ed_preco.Value < 0 then
    raise Exception.Create('Valor do produto é inválido!');

  if length(trim(ed_cod_grupo.Text)) <> 6 then
    raise Exception.Create('Código do grupo é inválido!');

  if length(triM(ed_cefop_saidas.Text)) <> 4 then
    raise Exception.Create('CFOP para operações de venda é inválido!');

  if Length(trim(edCstSaida.Text)) <> 3 then
    raise Exception.Create('CST de ICMS nas operações de venda é inválido. Este campo possui 3 dígitos!');

  if Length(trim(edCodNcm.Text)) <> 8 then
    raise Exception.Create('NCM é inválido. Este campo deve possuir 8 dígitos!');

  if dm.CFOPIsSubstituicaoTributaria(ed_cefop_saidas.text) then
  begin
    if Length(trim(edCEst.Text)) <> 7 then
      raise Exception.Create('CEST é inválido. Este campo deve possuir 7 dígitos!');

    if (dm.CSTICMSIsSubstituicaoTributariaCST(copy(trim(edCstSaida.Text), 2, 3)) = false) then
      raise Exception.Create('Você informou um CFOP de venda para produtos sujeitos à substituição tributária, porém o CST de ICMS informado não é um CST de substituição tributária.  (10, 30, 60, 70, 90)');

    if not TryStrToInt(edCEst.Text, LDummyInteiro) then
      raise Exception.Create('CEST é inválido. Este campo deve possuir 7 dígitos!');
  end
  else
  begin
    if (dm.CSTICMSIsSubstituicaoTributariaCST(copy(trim(edCstSaida.Text), 2, 3)) = true) then
      raise Exception.Create('Você informou um CFOP de venda para produtos que não são sujeitos à substituição tributária. Informe um CST de ICMS de acordo com a classificação correta!');

    if Length(trim(edCEst.Text)) <> 0 then
      raise Exception.Create('CEST só deve ser informado para produtos sujeitos à substituição tributária!');

  end;


 // Trata números

  if not TryStrToInt(ed_cod_grupo.text, LDummyInteiro) then
    raise Exception.Create('Código do grupo é inválido!');

  if not TryStrToInt(ed_cefop_saidas.Text, LDummyInteiro) then
    raise Exception.Create('CFOP para operações de venda é inválido!');

  if not TryStrToInt(edCstSaida.Text, LDummyInteiro) then
    raise Exception.Create('CST de ICMS nas operações de venda é inválido. Este campo possui 3 dígitos!');

  if not TryStrToInt(edCodNcm.Text, LDummyInteiro) then
    raise Exception.Create('NCM é inválido. Este campo deve possuir 8 dígitos!');

  if ((cbContaGerencial.EditValue = null)) then
    raise Exception.Create('Grupo gerencial inválido! Selecione um grupo gerencial analítico. (6 dígitos. Ex: 1.01.005)');

  if (Length(trim(cbContaGerencial.EditValue)) <> 6) then
    raise Exception.Create('Grupo gerencial inválido! Selecione um grupo gerencial analítico. (6 dígitos. Ex: 1.01.005)');

end;

function Tfrm_produtos.SalvarInformacoes: boolean;
var
  cod_grupo, descricao, cod_aliquota, reducaoBaseIcms, preco, preco2: string;
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
  LCodPlanoDeContas: string;
  LSQL: TStringList;
  LMensagemCadastro: string;
  LListaSQL: TList<string>;
begin
  LSQL := TStringList.Create();
  LListaSQL := TList<string>.Create;

  try
    try
      LSQL.clear;

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
      cod_grupo := quotedstr(ed_cod_grupo.Text);
      descricao := QuotedStr(trim(ed_descricao_produto.Text));
      descricaoReduzida := Quotedstr(trim(''));
      cod_aliquota := Quotedstr(cbAliquotaICMS.EditValue);
      reducaoBaseIcms := Quotedstr(dm.TrocaVirgPPto(Floattostr(edReducaoBase.Value)));
      preco := Quotedstr(dm.TrocaVirgPPto(Floattostr(ed_preco.Value)));
      lucro_maximo := Quotedstr('0');
      impostos := Quotedstr('0');
      outrasTaxas := Quotedstr('0');
      maoDeObra := Quotedstr(dm.TrocaVirgPPto(Floattostr(edMaoObra.Value)));
      validade := FloatToStr(edValidade.Value);

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
      unidadeFracao := Quotedstr(cbUnidadeEntrada.EditValue);
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
      LCodPlanoDeContas := QuotedStr(cbContaGerencial.EditValue);

      case oquefazer of
        1:
          begin
            LMensagemCadastro := 'Produto cadastrado com sucesso!';

            LCodProdutoSelecionado := dm.geraCodigo('G_PRODUTOS', 5);
            LCodUltimoProdutoSalvo := LCodProdutoSelecionado;
            LCodProdutoSelecionado := Quotedstr(LCodProdutoSelecionado);

            if StrToInt(vende) = 0 then
              cod_barras := Quotedstr('')
            else
            begin
              if trim(ed_cod_barras.Text) = '' then
                cod_barras := LCodProdutoSelecionado
              else
                cod_barras := Quotedstr(Trim(ed_cod_barras.Text));
            end;

            string_auxiliar := LCodProdutoSelecionado;
            ultimoCodigo := LCodProdutoSelecionado;

            LSQL.Add('insert into produtos (cod_produto,cod_grupo,descricao,');
            LSQL.Add('valor_unitario,valor_unitario_02,lucro_maximo,impostos,outras_taxas,mao_obra,validade, cod_aliquota, REDUCAO_BASE_ICMS, caminho_foto,cod_barras,');
            LSQL.Add('data_cadastro,ultima_venda,cod_miniprinter,fracionado,balanca,abate_ficha, ');
            LSQL.Add('preco_digitado,rendimento, perc_perda, incide_servico,couvert,valor_comissao,descricao_reduzida,parametro_contagem,custodigitado,requer_observacao, imprimir_ficha, calcula_qtde,imp_balcao,imp_mesas,imp_delivery,');
            LSQL.Add('compra,vende,cod_tipo_item,cod_genero,ncm,cest,ippt,iat,');
            LSQL.Add('valor_custo,quantidade_maxima,quantidade_minima,unidade_entrada,cod_unidade_fracao,cfop,cst,cfop_saida,cst_saida,un_ecf,submateria,');
            LSQL.Add('CFOP_TRANSFERENCIAS,CST_TRANSFERENCIAS,CFOP_DEVOLUCAO,CST_DEVOLUCAO,CST_PIS_COFINS,ALIQ_PIS,ALIQ_COFINS,cod_grupo_touch,COD_PLANO_CONTAS');

            LSQL.Add(') values (');
            LSQL.Add('' + LCodProdutoSelecionado + ',');
            LSQL.Add('' + cod_grupo + ',');
            LSQL.Add('' + descricao + ',');
            LSQL.Add('' + preco + ',');
            LSQL.Add('' + preco2 + ',');
            LSQL.Add('' + lucro_maximo + ',');
            LSQL.Add('' + impostos + ',');
            LSQL.Add('' + outrasTaxas + ',');
            LSQL.Add('' + maoDeObra + ',');
            LSQL.Add('' + validade + ',');
            LSQL.Add('' + cod_aliquota + ',');
            LSQL.Add('' + reducaoBaseIcms + ',');
            LSQL.Add('' + caminho_foto + ',');
            LSQL.Add('' + cod_barras + ',');
            LSQL.Add('' + Quotedstr(FormatDateTime('DD.MM.YYY', data_do_sistema)) + ',');
            LSQL.Add('' + Quotedstr(FormatDateTime('DD.MM.YYY', data_do_sistema)) + ',');
            LSQL.Add('' + cod_miniPrinter + ',');
            LSQL.Add('' + vendeFracionado + ',');
            LSQL.Add('' + produtoBalanca + ',');
            LSQL.Add('' + abateFicha + ',');
            LSQL.Add('' + precoDigitado + ',');
            LSQL.Add('' + rendimento + ',');
            LSQL.Add('' + perda + ',');
            LSQL.Add('' + incideServico + ',');
            LSQL.Add('' + couvert + ',');
            LSQL.Add('' + valorComissao + ',');
            LSQL.Add('' + descricaoReduzida + ',');
            LSQL.Add('' + parametroContabil + ',');
            LSQL.Add('' + custoDigitado + ',');
            LSQL.Add('' + requerObservacao + ',');
            LSQL.Add('' + imprimeFicha + ',');
            LSQL.Add('' + calculaQtde + ',');
            LSQL.Add('' + impBalcao + ',');
            LSQL.Add('' + impMesas + ',');
            LSQL.Add('' + impDeliver + ',');
            LSQL.Add('' + compra + ',');
            LSQL.Add('' + vende + ',');
            LSQL.Add('' + cod_tipo_item + ',');
            LSQL.Add('' + cod_genero_item + ',');
            LSQL.Add('' + cod_ncm + ',');
            LSQL.Add('' + cest + ',');
            LSQL.Add('' + ippt + ',');
            LSQL.Add('' + iat + ',');
            LSQL.Add('' + precoCompra + ',');
            LSQL.Add('' + estoqueMaximo + ',');
            LSQL.Add('' + estoqueMinimo + ',');
            LSQL.Add('' + unidadeCompra + ',');
            LSQL.Add('' + unidadeFracao + ',');

            LSQL.Add('' + cfopEntrada + ',');
            LSQL.Add('' + cstEntrada + ',');
            LSQL.Add('' + cfopSaida + ',');
            LSQL.Add('' + cstSaida + ',');
            LSQL.Add('' + unEcf + ',');
            LSQL.Add('' + subMateria + ',');
            LSQL.Add('' + cfopTransferencia + ',');
            LSQL.Add('' + cstTransferencia + ',');
            LSQL.Add('' + cfopDevolucao + ',');
            LSQL.Add('' + cstDevolucao + ',');
            LSQL.Add('' + cstPisCofins + ',');
            LSQL.Add('' + aliquotaPis + ',');
            LSQL.Add('' + aliquotaCofins + ',');
            LSQL.Add('' + codGrupoTouch + ',');
            LSQL.Add('' + LCodPlanoDeContas + ');');
            LListaSQL.Add(LSQL.text);
          end;
        2:
          begin
            LMensagemCadastro := 'Produto alterado com sucesso!';
            cod_barras := ed_cod_barras.Text;
            string_auxiliar := LCodProdutoSelecionado;
            dm.qryauxiliar.Active := false;
            dm.qryauxiliar.SQL.Clear;
            LSQL.Add('update produtos set ');
            LSQL.Add('cod_grupo=' + cod_grupo + ',');
            LSQL.Add('descricao=' + descricao + ',');
            LSQL.Add('valor_unitario=' + preco + ',');
            LSQL.Add('valor_unitario_02=' + preco2 + ',');
            LSQL.Add('lucro_maximo=' + lucro_maximo + ',');
            LSQL.Add('impostos=' + impostos + ',');
            LSQL.Add('outras_taxas=' + outrasTaxas + ',');
            LSQL.Add('mao_obra=' + maoDeObra + ',');
            LSQL.Add('validade=' + validade + ',');
            LSQL.Add('cod_aliquota=' + cod_aliquota + ',');
            LSQL.Add('REDUCAO_BASE_ICMS=' + reducaoBaseIcms + ',');
            LSQL.Add('caminho_foto=' + caminho_foto + ',');
            LSQL.Add('cod_barras=' + Quotedstr(cod_barras) + ',');
            LSQL.Add('cod_miniPrinter=' + cod_miniPrinter + ',');
            LSQL.Add('fracionado=' + vendeFracionado + ',');
            LSQL.Add('balanca=' + produtoBalanca + ',');
            LSQL.Add('abate_ficha=' + abateFicha + ',');

            LSQL.Add('preco_digitado=' + precoDigitado + ',');
            LSQL.Add('incide_servico=' + incideServico + ',');
            LSQL.Add('couvert=' + couvert + ',');
            LSQL.Add('valor_comissao=' + valorComissao + ',');
            LSQL.Add('descricao_reduzida=' + descricaoReduzida + ',');
            LSQL.Add('parametro_contagem=' + parametroContabil + ',');
            LSQL.Add('custodigitado=' + custoDigitado + ',');
            LSQL.Add('rendimento=' + rendimento + ',');
            LSQL.Add('perc_perda=' + perda + ',');

            LSQL.Add('requer_observacao=' + requerObservacao + ',');
            LSQL.Add('imprimir_ficha=' + imprimeFicha + ',');

            LSQL.Add('calcula_qtde=' + calculaQtde + ',');
            LSQL.Add('imp_balcao=' + impBalcao + ',');
            LSQL.Add('imp_mesas=' + impMesas + ',');
            LSQL.Add('imp_delivery=' + impDeliver + ',');
            LSQL.Add('compra=' + compra + ',');
            LSQL.Add('vende=' + vende + ',');
            LSQL.Add('cod_tipo_item=' + cod_tipo_item + ',');
            LSQL.Add('cod_genero=' + cod_genero_item + ',');
            LSQL.Add('ncm=' + cod_ncm + ',');
            LSQL.Add('cest=' + cest + ',');
            LSQL.Add('ippt=' + ippt + ',');
            LSQL.Add('iat=' + iat + ',');
            LSQL.Add('valor_custo=' + precoCompra + ',');
            LSQL.Add('quantidade_maxima=' + estoqueMaximo + ',');
            LSQL.Add('quantidade_minima=' + estoqueMinimo + ',');
            LSQL.Add('unidade_entrada=' + unidadeCompra + ',');
            LSQL.Add('cod_unidade_fracao=' + unidadeFracao + ',');
            LSQL.Add('cfop_saida=' + cfopSaida + ',');
            LSQL.Add('cst_saida=' + cstSaida + ',');
            LSQL.Add('un_ecf=' + unEcf + ',');
            if edEstoqueAtual.Value = 0 then
              LSQL.Add('estoque_liquido=0' + ',');

            LSQL.Add('submateria=' + subMateria + ',');
            LSQL.Add('CFOP_TRANSFERENCIAS=' + cfopTransferencia + ',');
            LSQL.Add('CST_TRANSFERENCIAS=' + cstTransferencia + ',');
            LSQL.Add('CFOP_DEVOLUCAO=' + cfopDevolucao + ',');
            LSQL.Add('CST_DEVOLUCAO=' + cstDevolucao + ',');
            LSQL.Add('CST_PIS_COFINS=' + cstPisCofins + ',');
            LSQL.Add('ALIQ_PIS=' + aliquotaPis + ',');
            LSQL.Add('ALIQ_COFINS=' + aliquotaCofins + ',');
            LSQL.Add('COD_GRUPO_TOUCH=' + codGrupoTouch + ',');
            LSQL.Add('COD_PLANO_CONTAS=' + LCodPlanoDeContas + '');
            LSQL.Add(' where cod_produto=' + Quotedstr(LCodProdutoSelecionado) + ';');
            LListaSQL.Add(LSQL.text);
          end;
      end;
      SalvarFichaTecnica(LListaSQL);
      dm.ExecutaBlocoDeInstrucoes(LListaSQL, 150);
      if LNovoProdutoEditandoFicha = false then
        ShowRealDialog(frm_principal, tmSucesso, 'Sucesso', LMensagemCadastro, 22, true);
    except
      on E: Exception do
      begin
        ShowRealDialog(frm_principal, tmErro, 'Erro', 'Erro ao cadastrar produto!' + sLineBreak + sLineBreak + 'Erro: ' + E.Message, 22, true);
      end;
    end;

  finally
    FreeAndNil(LSQL);
    FreeAndNil(LListaSQL);
    CancelarEdicaoProduto;
  end;

end;

procedure Tfrm_produtos.setCodProdutoSelecionado(ACodigo: string);
begin
  LCodProdutoSelecionado := ACodigo;
end;

procedure Tfrm_produtos.setAbriCadastroSelecionado;
begin
  LAbrirCadastroProdutoSelecionado := true;
end;

procedure Tfrm_produtos.SalvarFichaTecnica(AListaSQL: TList<string>);
var
  parametro, quantidade: double;
  parametro_saida: double;
  LSQL: TStringList;
begin

  parametro := 0;
  quantidade := 0;
  LSQL := TStringList.Create();
  try
    try

      AListaSQL.Add('delete from composicoes_produto where cod_produto=' + quotedstr(LCodProdutoSelecionado) + ';');
      dm.composicoes_temp.First;
      while not dm.composicoes_temp.Eof do
      begin
        LSQL.Clear;
        dm.qry_consultas.Active := false;
        dm.qry_consultas.sql.clear;
        dm.qry_consultas.SQL.Add('select * from unidades where cod_unidade=' + Quotedstr(dm.composicoes_tempUnidade.Value));
        dm.qry_consultas.Active := true;
        parametro := dm.qry_consultas.fieldbyname('parametro').Value;
        quantidade := dm.composicoes_tempquantidade.Value * dm.qry_consultas.fieldbyname('parametro').Value;

        LSQL.Add('insert into composicoes_produto (cod_produto,cod_produto_baixa,quantidade,cod_c_custo,unidade) values (');
        LSQL.Add('' + Quotedstr(LCodProdutoSelecionado) + ',');
        LSQL.Add('' + QuotedStr(dm.composicoes_tempcod_item.Value) + ',');
        LSQL.Add('' + Quotedstr(dm.TrocaVirgPPto(FloatToStr(quantidade))) + ',');
        LSQL.Add('' + QuotedStr(dm.composicoes_tempcod_c_custo.Value) + ',');
        LSQL.Add('' + QuotedStr(dm.composicoes_tempUnidade.Value) + ');');
        AListaSQL.add(LSQL.text);
        dm.composicoes_temp.Next;
      end;

    except
      on E: Exception do
      begin
        raise Exception.Create('Erro ao salvar ficha técnica!' + sLineBreak + E.Message);
      end;
    end;
  finally
    FreeAndNil(LSQL);
  end;

end;

procedure Tfrm_produtos.edCodProdutoEnter(Sender: TObject);
begin

  if Sender is Tedit and ((Sender as Tedit).Name = 'edCodProduto') then
  begin

  end;

  if Sender is TCustomEdit and ((Sender as TCustomEdit).Name = 'ed_qtde_item') then
  begin
    (Sender as TCustomEdit).SelectAll;
  end;

end;

procedure Tfrm_produtos.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  inherited;
  CanClose := LPodeFecharTela;
end;

procedure Tfrm_produtos.FormCreate(Sender: TObject);
begin
  inherited;
  LAbrirCadastroProdutoSelecionado := false;
  LPodeFecharTela := true;
  dmCadProduto := TdmCadProduto.Create(self);
  LConsultaVeioDoCadastro := true;
  dmCadProduto.OpenDatasets;
  FiltrarConsultaProdutos('');
  pgPrincipalForm.show;
  pgListagem.show;
end;

procedure Tfrm_produtos.FormDestroy(Sender: TObject);
begin
  inherited;
  FreeAndNil(dmCadProduto);

end;

procedure Tfrm_produtos.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  inherited;

  if (Key = Ord('S')) and (ssCtrl in Shift) then
  begin
    Clipboard.AsText := dmCadProduto.tbListagemProdutos.Fieldbyname('cod_produto').value;
  end;
end;

procedure Tfrm_produtos.AbrirPaginaDeClones(LNomeProduto: string);
begin
  LPodeFecharTela := false;
  lbNomeProdutoClone.Caption := 'Clonando o produto: ' + LNomeProduto;
  dmCadProduto.tbClonesTemp.active := false;
  DMCadProduto.tbClonesTemp.active := True;
  pgClones.show;
  EdDescricaoClone.SetFocus;
end;

procedure Tfrm_produtos.Ativarapenasparacompra1Click(Sender: TObject);
begin

  AtivarOuDesativar(5);
end;

procedure Tfrm_produtos.Ativarapenasparavenda1Click(Sender: TObject);
begin
  AtivarOuDesativar(6);
end;

procedure Tfrm_produtos.retornaInformacoesGerais();
begin
  LNovoProdutoEditandoFicha := False;
  dm.qryauxiliar.Active := false;
  dm.qryauxiliar.sql.Clear;
  dm.qryauxiliar.sql.add('select p.*, ');
  dm.qryauxiliar.sql.add('       g.descricao as descricaoGrupo,');
  dm.qryauxiliar.sql.add('       tpi.descricao as descricaoItemSped,');
  dm.qryauxiliar.sql.add('      coalesce((p.estoque_liquido / un.parametro),0) as estoque_atual');
  dm.qryauxiliar.sql.add('       from produtos p');
  dm.qryauxiliar.sql.add('         inner join grupos g on (g.cod_grupo = p.cod_grupo)');
  dm.qryauxiliar.SQL.Add('            inner join unidades un on ( un.cod_unidade = p.unidade_entrada)');
  dm.qryauxiliar.sql.add('         inner join tipos_item_sped tpi on (tpi.cod_tipo = p.cod_tipo_item)');
  dm.qryauxiliar.sql.add('   where p.cod_produto=' + Quotedstr(LCodProdutoSelecionado));
  dm.adicionaLog(dm.qryauxiliar.sql.Text);
  dm.qryauxiliar.Active := true;

  LCodProdutoSelecionado := dm.qryauxiliar.fieldbyname('cod_produto').value;
  ed_descricao_produto.Text := dm.qryauxiliar.fieldbyname('descricao').value;
//  edDescricaoReduzida.Text := dm.qryauxiliar.fieldbyname('descricao_reduzida').value;

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

  if dm.qryauxiliar.fieldbyname('requer_observacao').value = 0 then
    ckbRequerObs.Checked := false
  else
    ckbRequerObs.Checked := true;

  if dm.qryauxiliar.fieldbyname('imprimir_ficha').value = 0 then
    ckbImprimeFichaFF.Checked := false
  else
    ckbImprimeFichaFF.Checked := true;

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

  try
    cbContaGerencial.EditValue := dm.qryauxiliar.fieldbyname('COD_PLANO_CONTAS').value;
  except
    cbContaGerencial.EditValue := '101001';
  end;

  buscaFichaTecnica();

  retornaInformacoesDeVenda();

end;

procedure Tfrm_produtos.retornaInformacoesDeVenda();
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

  dm.qryauxiliar.sql.add('   where p.cod_produto=' + Quotedstr(LCodProdutoSelecionado));
  dm.adicionaLog(dm.qryauxiliar.sql.Text);
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

procedure Tfrm_produtos.buscaFichaTecnica();
begin
     //Busca ficha técnica.
  dm.composicoes_temp.active := false;
  dm.composicoes_temp.active := true;
  dm.qryauxiliar2.Active := false;
  dm.qryauxiliar2.SQL.Clear;
  dm.qryauxiliar2.SQL.add('       select cp.*, p.descricao,  ');
  dm.qryauxiliar2.SQL.add('         (cp.quantidade / un.parametro) as quantidadeReal,');
  dm.qryauxiliar2.SQL.add('         un.descricao  as desc_unidade');
  dm.qryauxiliar2.SQL.add('         from composicoes_produto cp');
  dm.qryauxiliar2.SQL.add('         inner join unidades un on (un.cod_unidade = cp.unidade)');
  dm.qryauxiliar2.SQL.add('         inner join produtos p on (p.cod_produto = cp.cod_produto_baixa)');
  dm.qryauxiliar2.sql.add('         where cp.cod_produto=' + Quotedstr(LCodProdutoSelecionado));
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

procedure Tfrm_produtos.pesquisar_produto(tipo: integer);
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

procedure Tfrm_produtos.bt_pesq_ccClick(Sender: TObject);
begin
  Application.CreateForm(Tfrm_cs_c_custo, frm_cs_c_custo);
  frm_cs_c_custo.showmodal;
  frm_cs_c_custo.free;
end;

procedure Tfrm_produtos.pesquisa_unidade;
begin
  dm.qry_consultas.Active := false;
  dm.qry_consultas.SQL.Clear;
  dm.qry_consultas.sql.add('select descricao,sigla,parametro,cod_unidade from unidades');
  dm.qry_consultas.Active := true;
  if dm.qry_consultas.IsEmpty then
  begin
    ShowMessage('Não existe unidades cadadastradas. Não é possível continuar.');

    string_auxiliar := '';
    exit;
  end;
  Application.CreateForm(Tfrm_cs_unidades, frm_cs_unidades);
  frm_cs_unidades.ShowModal;
  frm_cs_unidades.free;

end;

procedure Tfrm_produtos.PngSpeedButton10Click(Sender: TObject);
begin
  inherited;
  if (ShowRealDialog(frm_principal, tmConfirmacao, 'Confirme', 'Tem certeza que deseja abandonar o cadastro?', 22, true) = teSim) then
  begin
    CancelarAdicaoDeCLones;
  end;
end;

procedure Tfrm_produtos.CancelarAdicaoDeCLones();
begin
  LCodProdutoSelecionado := '';
  pgListagem.Show;
  dmCadProduto.tbClonesTemp.active := false;
  FiltrarConsultaProdutos(edParamentroListagemProdutos.Text);

end;

procedure Tfrm_produtos.btSalvarCadastroClick(Sender: TObject);
begin
  inherited;
  try
    try
      ValidarDados();
      SalvarInformacoes();
    except
      on E: Exception do
      begin
        ShowRealDialog(frm_principal, tmErro, 'Erro', E.Message, 22, true);
      end;

    end;
  finally

  end;

end;

procedure Tfrm_produtos.PngSpeedButton8Click(Sender: TObject);
begin
  inherited;
  btSair.click;
end;

procedure Tfrm_produtos.CancelarEdicaoProduto();
begin
  if LNovoProdutoEditandoFicha = false then
  begin
    LCodProdutoSelecionado := '';
    pgListagem.Show;
    dm.composicoes_temp.Active := false;
    FiltrarConsultaProdutos(edParamentroListagemProdutos.Text);
  end;

end;

procedure Tfrm_produtos.btNovoClick(Sender: TObject);
begin
  inherited;
  oquefazer := 1;
  limpa_edits;
  ConfiguraCampos();
  pgControle.show;
  ed_descricao_produto.setfocus;

end;

procedure Tfrm_produtos.btSairClick(Sender: TObject);
begin
  inherited;
  LPodeFecharTela := true;
  close;
end;

procedure Tfrm_produtos.limpa_edits;
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
      TImage(Components[i]).Picture := nil;

    if Components[i] is TPageControl then
      TPageControl(Components[i]).ActivePageIndex := 0;

    if Components[i] is TCheckListBox then
      TCheckListBox(Components[i]).Clear;

    if Components[i] is TComboBox then
      TComboBox(Components[i]).Text := '';
  end;

end;

procedure Tfrm_produtos.ckbBalancaClick(Sender: TObject);
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

procedure Tfrm_produtos.ckbSubProdutoClick(Sender: TObject);
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

procedure Tfrm_produtos.ed_cod_mini_printerExit(Sender: TObject);
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

procedure Tfrm_produtos.btAdicionarCloneClick(Sender: TObject);
begin
  inherited;

  try

    try
      ValidaDadosDoClone();
      InserirClone(edCodigoBarrasClone.text, edDescricaoClone.text, edPrecoVendaClone.value);
      edCodigoBarrasClone.text := '';
      edDescricaoClone.text := '';
      edPrecoVendaClone.value := 0;
      if pgClones.PageIndex = 0 then
        edDescricaoClone.setfocus;
    except
      on E: Exception do
      begin
        ShowRealDialog(frm_principal, tmErro, 'Erro', E.Message, 16, true);
      end;
    end;
  finally

  end;

end;

procedure Tfrm_produtos.btSalvarClonesClick(Sender: TObject);
begin
  inherited;

  ConfirmarGeracaoDeCLones;
end;

procedure Tfrm_produtos.ConfirmarGeracaoDeCLones;
begin
  try
    try
      btSalvarClones.enabled := False;
      if (ShowRealDialog(frm_principal, tmConfirmacao, 'Confirme', 'Confirma a clonagem de produtos?', 19, true) = teSim) then
      begin
        GerarClonesDoProduto(LCodProdutoSelecionado);
        ShowRealDialog(frm_principal, tmSucesso, 'Sucesso', 'Clones gerados com sucesso!', 19, true);
        CancelarAdicaoDeCLones;
      end;
    except
      on E: Exception do
      begin
        ShowRealDialog(frm_principal, tmErro, 'Erro', E.Message, 19, true);
      end;
    end;
  finally
    btSalvarClones.enabled := true;
  end;
end;

procedure Tfrm_produtos.GerarClonesDoProduto(ACodigoProdutoReferencia: string);
var
  LListaSQL: TList<string>;
  LSQL: TStringList;
  LCodigoNovoClone: string;
  LDescricaoProdutoClone, LValorUnitarioClone, LCodBarrasClone: string;
begin
  LListaSQL := TList<string>.Create;
  LSQL := TStringList.Create;
  LListaSQL.Clear;

  try
    try
      if dmCadProduto.tbClonesTemp.IsEmpty then
        raise Exception.Create('Nenhum produto adicionado à lista de clones');

      dmCadProduto.tbClonesTemp.First;
      while not dmCadProduto.tbClonesTemp.eof do
      begin
        LCodigoNovoClone := dm.geraCodigo('G_PRODUTOS', 5);
        LDescricaoProdutoClone := dmCadProduto.tbClonesTempDescricao.value;
        LValorUnitarioClone := dm.TrocaVirgPPto(Floattostr(dmCadProduto.tbClonesTempValor.value));
        LCodBarrasClone := dmCadProduto.tbClonesTempCodBarras.Value;

        if trim(LCodBarrasClone) = '' then
          LCodBarrasClone := LCodigoNovoClone;

        LSQL.clear;
        LSQL.text := GetSQLGeracaoClones();
        LSQL.text := StringReplace(LSQL.text, ':LCodigoProduto', Quotedstr(LCodigoNovoClone), [rfReplaceAll]);
        LSQL.text := StringReplace(LSQL.text, ':LDescricaoProduto', Quotedstr(LDescricaoProdutoClone), [rfReplaceAll]);
        LSQL.text := StringReplace(LSQL.text, ':LValorUnitario', Quotedstr(LValorUnitarioClone), [rfReplaceAll]);
        LSQL.text := StringReplace(LSQL.text, ':LCodigoBarras', Quotedstr(LCodBarrasClone), [rfReplaceAll]);
        LSQL.text := StringReplace(LSQL.text, ':LCodProdutoReferencia', Quotedstr(ACodigoProdutoReferencia), [rfReplaceAll]);

        LListaSQL.add(LSQL.text);
        dmCadProduto.tbClonesTemp.next;
      end;
      dm.ExecutaBlocoDeInstrucoes(LListaSQL, 150);

    except
      on E: Exception do
      begin
        raise Exception.Create(E.Message);
      end;

    end;
  finally
    FreeAndNil(LSQL);
    FreeAndNil(LListaSQL);
  end;
end;

function Tfrm_produtos.GetSQLGeracaoClones(): string;
var
  LSQL: TStringList;
begin
  LSQL := TStringList.Create;
  try
    LSQL.add('insert into produtos');
    LSQL.add('(');
    LSQL.add('cod_produto, ');
    LSQL.add('descricao,');
    LSQL.add('valor_unitario,');
    LSQL.add('data_cadastro,');
    LSQL.add('ultima_venda,');
    LSQL.add('NUMERO_VENDAS, ');
    LSQL.add('COD_ALIQUOTA,');
    LSQL.add('CAMINHO_FOTO,');
    LSQL.add('cod_barras,');
    LSQL.add('ACOMPANHAMENTO,');
    LSQL.add('PERMITE_ACOMPANHAMENTO,');
    LSQL.add('ACOMPANHAMENTOS_FIXOS, ');
    LSQL.add('NUMERO_ACOMPANHAMENTOS,');
    LSQL.add('LUCRO_MAXIMO,');
    LSQL.add('LUCRO_MINIMO,');
    LSQL.add('PRODUTO_FINAL, ');
    LSQL.add('ITEM_ASSOCIADO,');
    LSQL.add('COD_GRUPO, ');
    LSQL.add('CARDAPIO,');
    LSQL.add('TEMPO, ');
    LSQL.add('OBS_LANCAMENTO,');
    LSQL.add('COD_MINIPRINTER, ');
    LSQL.add('PARAMETRO_CONTAGEM,');
    LSQL.add('BALANCA, ');
    LSQL.add('FRACIONADO,');
    LSQL.add('PRECO_DIGITADO,');
    LSQL.add('INFORMAR_SABOR,');
    LSQL.add('COMISSIONADO,');
    LSQL.add('VALOR_COMISSAO,');
    LSQL.add('DESCRICAO_REDUZIDA,');
    LSQL.add('INCIDE_SERVICO,');
    LSQL.add('COUVERT, ');
    LSQL.add('CUSTODIGITADO, ');
    LSQL.add('CALCULA_QTDE,');
    LSQL.add('PIZZA, ');
    LSQL.add('TAM_PIZZA, ');
    LSQL.add('IMP_DELIVERY,');
    LSQL.add('IMP_MESAS, ');
    LSQL.add('IMP_BALCAO,');
    LSQL.add('COMPRA,');
    LSQL.add('VENDE, ');
    LSQL.add('COD_TIPO_ITEM, ');
    LSQL.add('COD_GENERO,');
    LSQL.add('NCM, ');
    LSQL.add('IPPT,');
    LSQL.add('IAT, ');
    LSQL.add('DATA_ULTIMA_REPOSICAO, ');
    LSQL.add('VALOR_CUSTO, ');
    LSQL.add('QUANTIDADE_MAXIMA, ');
    LSQL.add('QUANTIDADE_MINIMA, ');
    LSQL.add('ESTOQUE_LIQUIDO, ');
    LSQL.add('UNIDADE_ENTRADA, ');
    LSQL.add('COD_UNIDADE_FRACAO,');
    LSQL.add('CFOP,');
    LSQL.add('CST, ');
    LSQL.add('CFOP_SAIDA,');
    LSQL.add('CST_SAIDA, ');
    LSQL.add('UN_ECF,');
    LSQL.add('SUBMATERIA,');
    LSQL.add('CFOP_TRANSFERENCIAS, ');
    LSQL.add('CST_TRANSFERENCIAS,');
    LSQL.add('CFOP_DEVOLUCAO,');
    LSQL.add('CST_DEVOLUCAO, ');
    LSQL.add('CST_PIS_COFINS,');
    LSQL.add('ALIQ_PIS,');
    LSQL.add('ALIQ_COFINS, ');
    LSQL.add('ESTOQUE_VISIVEL, ');
    LSQL.add('QTD_GUARNICOES,');
    LSQL.add('GUARNICOES_FIXAS,');
    LSQL.add('COD_GRUPO_TOUCH, ');
    LSQL.add('DESCRICAO_TOUCH, ');
    LSQL.add('REQUER_OBSERVACAO, ');
    LSQL.add('COD_GRUPO_APURACAO,');
    LSQL.add('RENDIMENTO,');
    LSQL.add('BALANCA_LEITURA, ');
    LSQL.add('VALOR_UNITARIO_02, ');
    LSQL.add('CEST,');
    LSQL.add('REDUCAO_BASE_ICMS, ');
    LSQL.add('IMPRIMIR_FICHA,');
    LSQL.add('PERC_PERDA,');
    LSQL.add('IMPOSTOS,');
    LSQL.add('OUTRAS_TAXAS,');
    LSQL.add('MAO_OBRA,');
    LSQL.add('ABATE_FICHA, ');
    LSQL.add('VALIDADE,');
    LSQL.add('MODO_PREPARO,');
    LSQL.add('COD_FORNECEDOR,');
    LSQL.add('COD_PLANO_CONTAS)');

    LSQL.add('select ');
    LSQL.add(':LCodigoProduto, ');
    LSQL.add(':LDescricaoProduto,');
    LSQL.add(':LValorUnitario,');
    LSQL.add('current_date, ');
    LSQL.add('current_date,');
    LSQL.add('clone.NUMERO_VENDAS, ');
    LSQL.add('clone.COD_ALIQUOTA,');
    LSQL.add('clone.CAMINHO_FOTO,');
    LSQL.add(':LCodigoBarras,');
    LSQL.add('clone.ACOMPANHAMENTO,');
    LSQL.add('clone.PERMITE_ACOMPANHAMENTO,');
    LSQL.add('clone.ACOMPANHAMENTOS_FIXOS, ');
    LSQL.add('clone.NUMERO_ACOMPANHAMENTOS,');
    LSQL.add('clone.LUCRO_MAXIMO,');
    LSQL.add('clone.LUCRO_MINIMO,');
    LSQL.add('clone.PRODUTO_FINAL, ');
    LSQL.add('clone.ITEM_ASSOCIADO,');
    LSQL.add('clone.COD_GRUPO, ');
    LSQL.add('clone.CARDAPIO,');
    LSQL.add('clone.TEMPO, ');
    LSQL.add('clone.OBS_LANCAMENTO,');
    LSQL.add('clone.COD_MINIPRINTER, ');
    LSQL.add('clone.PARAMETRO_CONTAGEM,');
    LSQL.add('clone.BALANCA, ');
    LSQL.add('clone.FRACIONADO,');
    LSQL.add('clone.PRECO_DIGITADO,');
    LSQL.add('clone.INFORMAR_SABOR,');
    LSQL.add('clone.COMISSIONADO,');
    LSQL.add('clone.VALOR_COMISSAO,');
    LSQL.add('clone.DESCRICAO_REDUZIDA,');
    LSQL.add('clone.INCIDE_SERVICO,');
    LSQL.add('clone.COUVERT, ');
    LSQL.add('clone.CUSTODIGITADO, ');
    LSQL.add('clone.CALCULA_QTDE,');
    LSQL.add('clone.PIZZA, ');
    LSQL.add('clone.TAM_PIZZA, ');
    LSQL.add('clone.IMP_DELIVERY,');
    LSQL.add('clone.IMP_MESAS, ');
    LSQL.add('clone.IMP_BALCAO,');
    LSQL.add('clone.COMPRA,');
    LSQL.add('clone.VENDE, ');
    LSQL.add('clone.COD_TIPO_ITEM, ');
    LSQL.add('clone.COD_GENERO,');
    LSQL.add('clone.NCM, ');
    LSQL.add('clone.IPPT,');
    LSQL.add('clone.IAT, ');
    LSQL.add('clone.DATA_ULTIMA_REPOSICAO, ');
    LSQL.add('clone.VALOR_CUSTO, ');
    LSQL.add('clone.QUANTIDADE_MAXIMA, ');
    LSQL.add('clone.QUANTIDADE_MINIMA, ');
    LSQL.add('0,');
    LSQL.add('clone.UNIDADE_ENTRADA, ');
    LSQL.add('clone.COD_UNIDADE_FRACAO,');
    LSQL.add('clone.CFOP,');
    LSQL.add('clone.CST, ');
    LSQL.add('clone.CFOP_SAIDA,');
    LSQL.add('clone.CST_SAIDA, ');
    LSQL.add('clone.UN_ECF,');
    LSQL.add('clone.SUBMATERIA,');
    LSQL.add('clone.CFOP_TRANSFERENCIAS, ');
    LSQL.add('clone.CST_TRANSFERENCIAS,');
    LSQL.add('clone.CFOP_DEVOLUCAO,');
    LSQL.add('clone.CST_DEVOLUCAO, ');
    LSQL.add('clone.CST_PIS_COFINS,');
    LSQL.add('clone.ALIQ_PIS,');
    LSQL.add('clone.ALIQ_COFINS, ');
    LSQL.add('clone.ESTOQUE_VISIVEL, ');
    LSQL.add('clone.QTD_GUARNICOES,');
    LSQL.add('clone.GUARNICOES_FIXAS,');
    LSQL.add('clone.COD_GRUPO_TOUCH, ');
    LSQL.add('clone.DESCRICAO_TOUCH, ');
    LSQL.add('clone.REQUER_OBSERVACAO, ');
    LSQL.add('clone.COD_GRUPO_APURACAO,');
    LSQL.add('0,');
    LSQL.add('clone.BALANCA_LEITURA, ');
    LSQL.add('clone.VALOR_UNITARIO_02, ');
    LSQL.add('clone.CEST,');
    LSQL.add('clone.REDUCAO_BASE_ICMS, ');
    LSQL.add('clone.IMPRIMIR_FICHA,');
    LSQL.add('0,');
    LSQL.add('clone.IMPOSTOS,');
    LSQL.add('clone.OUTRAS_TAXAS,');
    LSQL.add('clone.MAO_OBRA,');
    LSQL.add('clone.ABATE_FICHA, ');
    LSQL.add('clone.VALIDADE,');
    LSQL.add('clone.MODO_PREPARO,');
    LSQL.add('clone.COD_FORNECEDOR, ');
    LSQL.add('clone.COD_PLANO_CONTAS');
    LSQL.add(' from produtos clone ');
    LSQL.add(' where clone.cod_produto=:LCodProdutoReferencia;');
    result := LSQL.text;

  finally
    FreeAndNil(LSQL);
  end;
end;

procedure Tfrm_produtos.BitBtn1Click(Sender: TObject);
begin
  inherited;

  try
    if Verifica_validade_item = true then
    begin
      if oquefazer = 1 then
      begin
        if (ShowRealDialog(frm_principal, tmConfirmacao, 'Confirme', 'O produto atual ainda não foi salvo. É necessário salvá-lo antes de editar a sua ficha técnica.' + sLineBreak + sLineBreak + ' Deseja salvar agora e editar a ficha em sequência?', 22, true) = teSim) then
        begin
          LNovoProdutoEditandoFicha := True;
          btSalvarCadastro.Click;
          LCodProdutoSelecionado := LCodUltimoProdutoSalvo;
          EditarCadastroSelecionado;
          LNovoProdutoEditandoFicha := false;
          adicionar_produto;
        end;
      end
      else
      begin
        adicionar_produto;
      end;
    end;
  except
    on E: Exception do
    begin
      ShowRealDialog(frm_principal, tmErro, 'Erro', 'Erro ao realizar operação. Verifique se o produto foi corretamente cadastrado para continuar!', 22, true);
      LNovoProdutoEditandoFicha := false;
      CancelarEdicaoProduto;
    end;
  end;

end;

procedure Tfrm_produtos.InserirClone(ACodBarras, ADescricao: string; AValorUnitario: Double);
begin
  if not dmCadProduto.tbClonesTemp.active then
    dmCadProduto.tbClonesTemp.Active := true;
  dmCadProduto.tbClonesTemp.append;
  dmCadProduto.tbClonesTempDescricao.value := ADescricao;
  dmCadProduto.tbClonesTempValor.value := AValorUnitario;
  dmCadProduto.tbClonesTempCodBarras.Value := ACodBarras;
  dmCadProduto.tbClonesTemp.post;
end;

procedure Tfrm_produtos.ValidaDadosDoClone();
begin
  if trim(edDescricaoClone.text) = '' then
    raise Exception.Create('Descrição do clone inválida!');

  if edPrecoVendaClone.Value < 0 then
    raise Exception.Create('Valor do clone é inválido!');

  if (Trim(edCodigoBarrasClone.text) <> '') then
  begin
{
    try
      StrToInt(edCodigoBarrasClone.text);
    except
      raise Exception.create('Código de barras do clone é inválido!');
    end;
    }

    {
    if Length(Trim(edCodigoBarrasClone.text)) <= 10 then
    begin
      raise Exception.create('Código deb arras precisa ter mais de 10 caracteres. Para produtos que não possuem código de barras válido, favor deixar o campo em branco!');
    end;
    }

  end;

end;

procedure Tfrm_produtos.Excluirdaficha1Click(Sender: TObject);
var
  q: TIBQuery;
  formato, str: string;
begin

  q := TIBquery.create(self);
  q.Database := dm.dbrestaurante;
  q.Transaction := dm.transacao;

  dm.transacao.Active := false;
  dm.transacao.Active := true;

  q.Active := false;
  q.SQL.clear;
  q.SQL.Add('delete from composicoes_produto where cod_produto=' + Quotedstr(dm.composicoes_tempcod_produto.Value) + ' and cod_produto_baixa=' + Quotedstr(dm.composicoes_tempcod_item.Value));
  q.ExecSQL;
  dm.transacao.Commit;
  dm.composicoes_temp.Delete;

  FreeAndNil(q);

end;

procedure Tfrm_produtos.edDescTipoItemSpedKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
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

procedure Tfrm_produtos.edParamentroListagemProdutosKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  inherited;
  SystemParametersInfo(SPI_SETBEEP, 0, 0, SPIF_SENDCHANGE);
  if Key = VK_RETURN then
  begin

    FiltrarConsultaProdutos(edParamentroListagemProdutos.Text);
    Key := 0;

  end;
end;

procedure Tfrm_produtos.setCodItemCadastrado(codigo: string);
begin
  codigoItemEstoqueCadastrado := codigo;
end;

procedure Tfrm_produtos.SelecionaProduto;
var
  LValor: integer;
begin
  if dmCadProduto.tbListagemProdutos.IsEmpty = false then
  begin
    LValor := dmCadProduto.tbListagemProdutos.FieldByName('selecionado').Value;

    dmCadProduto.tbListagemProdutos.Edit;
    if LValor = 0 then
      LValor := 1
    else
      LValor := 0;

    dmCadProduto.tbListagemProdutos.FieldByName('selecionado').Value := LValor;
    dmCadProduto.tbListagemProdutos.Post;
  end;
end;

procedure Tfrm_produtos.FiltrarConsultaProdutos(AParametro: string);
var
  LSQL: TStringlist;
begin

  LSQL := TStringList.Create;
  LSQL.Clear;
  try
    try
      LSQL.add(' select                                                             ');
      LSQL.add('   0 as selecionado,                                                ');
      LSQL.add('   p.cod_produto,                                                   ');
      LSQL.add('   p.descricao,                                                     ');
      LSQL.add('   p.compra,                                                        ');
      LSQL.add('   p.vende,                                                         ');
      LSQL.add('   p.valor_unitario,                                                ');
      LSQL.add('   g.descricao as grupo,                                            ');
      LSQL.add('   gt.descricao as grupoTouch,                                      ');
      LSQL.add('   p.valor_custo,                                                   ');
      LSQL.add('   P.quantidade_maxima,                                             ');
      LSQL.add('   P.quantidade_minima,                                            ');
      LSQL.add('   p.cod_barras,                                                    ');
      LSQL.add('   P.rendimento,                                                    ');
      LSQL.add('   p.ncm,                                                           ');
      LSQL.add('   p.cest,                                                          ');
      LSQL.add('   p.cfop_saida,                                                    ');
      LSQL.add('   p.cst_saida,                                                     ');
      LSQL.add('   p.perc_perda,                                                    ');
      LSQL.add('  ( select count(*) from composicoes_produto cp where cp.cod_produto = p.cod_produto), ');
      LSQL.add('     case  ( select count(*) from composicoes_produto cp where cp.cod_produto = p.cod_produto)');
      LSQL.add('       when 0 then ' + QUotedstr('Não'));
      LSQL.add('       else  ' + Quotedstr('Sim'));
      LSQL.add('     end fichaTecnica');
      LSQL.add('  from produtos p                                                   ');
      LSQL.add('    inner join grupos g on (g.cod_grupo = p.cod_grupo)              ');
      LSQL.add('    left join grupos_touch gt on (gt.cod_grupo = p.cod_grupo_touch) ');
      LSQL.add('   where p.descricao  like ' + Quotedstr('%' + AParametro + '%'));
      LSQL.add('     or p.cod_produto like ' + Quotedstr('%' + AParametro + '%'));
      LSQL.add('     or p.cod_barras  like ' + Quotedstr('%' + AParametro + '%'));
      LSQL.add('  order by p.descricao');
      dm.getMemTable(dmCadProduto.tbListagemProdutos, LSQL.Text);

    except
      on E: Exception do
      begin
        ShowRealDialog(frm_principal, tmErro, 'Erro ao consultar produtos!', 'Ocorreu o seguinte erro ao consultar: ' + sLineBreak + sLineBreak + E.Message);
      end;

    end;
  finally
    FreeAndNil(LSQL);
  end;
end;

procedure Tfrm_produtos.ConfirmaExclusaoDeProduto(ACodProduto: string);
begin

  try
    try

      if dm.verificaPossibilidadeExclusaoDoProduto(ACodProduto) then
      begin
        if (ShowRealDialog(frm_principal, tmConfirmacaoPorPIN, 'Confirme', 'Tem certeza que deseja excluir este produto?', 22, true) = teSim) then
        begin
          dm.ExcluirProduto(ACodProduto);
          ShowRealDialog(frm_principal, tmSucesso, 'Sucesso', 'Produto excluído com sucesso!', 22, true);
          FiltrarConsultaProdutos(edParamentroListagemProdutos.Text);
        end;
      end;
    except
      on E: Exception do
      begin
        ShowRealDialog(frm_principal, tmErro, 'Erro', E.Message, 22, true);
      end;
    end;

  finally

  end;

end;

procedure Tfrm_produtos.Desativaresteproduto1Click(Sender: TObject);
begin
  AtivarOuDesativar(1);
end;

procedure Tfrm_produtos.AtivarOuDesativar(AOpcao: integer);
begin
  LCodProdutoSelecionado := dmCadProduto.tbListagemProdutos.FieldByName('cod_produto').Value;
  dm.AtivarOuDesativarProduto(LCodProdutoSelecionado, AOpcao);
  FiltrarConsultaProdutos(edParamentroListagemProdutos.Text);

end;

procedure Tfrm_produtos.AtivarprodutoCompraevenda1Click(Sender: TObject);
begin
  AtivarOuDesativar(4);
end;

procedure Tfrm_produtos.C1Click(Sender: TObject);
begin
  Clipboard.AsText := dmCadProduto.tbListagemProdutos.Fieldbyname('cod_produto').value;
end;

procedure Tfrm_produtos.cbContaGerencialKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if cbContaGerencial.DroppedDown = false then
  begin
    if Key = VK_RETURN then // Verifica se a tecla é o Enter
    begin
      Perform(WM_NEXTDLGCTL, 0, 0);
    end;
  end
end;

procedure Tfrm_produtos.Desativarapenasparacompra1Click(Sender: TObject);
begin
  AtivarOuDesativar(2);
end;

procedure Tfrm_produtos.Desativarapenasparavenda1Click(Sender: TObject);
begin

  AtivarOuDesativar(3);
end;

procedure Tfrm_produtos.E1Click(Sender: TObject);
var
  LMEmTable: TFDMemTable;
  LMensagem: string;
begin
  LMEmTable := TFDMemTable.Create(self);
  try
    try
      dm.getMemTable(LMEmTable, 'select * from procura_erros');
    except

    end;
    dm.getMemTable(LMEmTable, ' select ef.cod_produto, p.descricao from erros_ficha_tecnica ef  inner join produtos p on (P.cod_produto = ef.cod_produto)');
    if LMEmTable.IsEmpty then
      ShowRealDialog(frm_principal, tmSucesso, 'Fichas ok', 'Nenhum erro de ficha encontrado!', 22, true)
    else
    begin
      LMensagem := 'O produto abaixo ou componentes da sua ficha possui erros! ' + sLineBreak + 'Código: ' + LMEmTable.Fieldbyname('cod_produto').value + sLineBreak + 'Descrição: ' + LMEmTable.Fieldbyname('descricao').value;
      showRealDialog(frm_principal, tmErro, 'Erro detectado', LMensagem, 18, true)
    end;

  finally
    FreeAndNil(LMEmTable);
  end;

end;

procedure Tfrm_produtos.Editarproduto1Click(Sender: TObject);
begin
  LCodProdutoSelecionado := dmCadProduto.tbListagemProdutos.FieldByName('cod_produto').Value;
  EditarCadastroSelecionado();

end;

procedure Tfrm_produtos.Excluiresteproduto1Click(Sender: TObject);
begin
  LCodProdutoSelecionado := dmCadProduto.tbListagemProdutos.FieldByName('cod_produto').Value;
  ConfirmaExclusaoDeProduto(LCodProdutoSelecionado);

end;

procedure Tfrm_produtos.gridListagemCellClick(Sender: TcxCustomGridTableView; ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton; AShift: TShiftState; var AHandled: Boolean);
begin
  if ACellViewInfo.Item = gridListagemSELECIONADO then
  begin
    SelecionaProduto;
  end;
  Clipboard.AsText := dmCadProduto.tbListagemProdutos.Fieldbyname('cod_barras').value;
end;

procedure Tfrm_produtos.AdicionarClonesEmLote();
var
  LContador: integer;
  LQtdClonesLote: integer;
  LDescricaoClone, LCodigoBarras: string;
  LPrecoClone: Double;
begin
  LQtdClonesLote := memoClonesDescricao.Lines.Count - 1;
  for LContador := 0 to LQtdClonesLote do
  begin
    if (trim(memoClonesDescricao.Lines[LContador]) <> '') then
    begin
      edDescricaoClone.Text := memoClonesDescricao.Lines[LContador];
      edCodigoBarrasClone.Text := memoClonesCodBarras.Lines[LContador];
      edPrecoVendaClone.Value := StrToFloat(LimparValor(memoClonesPreco.Lines[LContador]));
      btAdicionarClone.Click;
    end;
  end;
  pgDadosClone.Show;

end;

procedure Tfrm_produtos.FormShow(Sender: TObject);
begin
  if ((trim(LCodProdutoSelecionado) <> '') and (LAbrirCadastroProdutoSelecionado = true)) then
  begin
    EditarCadastroSelecionado;
  end;

end;

procedure Tfrm_produtos.gridListagemKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Key = 32 then
    SelecionaProduto;
end;

function Tfrm_produtos.LimparValor(const AValor: string): string;
var
  temp: string;
begin
  // Remove o "R$"
  temp := StringReplace(AValor, 'R$', '', [rfReplaceAll]);
  // Remove espaços
  temp := StringReplace(temp, ' ', '', [rfReplaceAll]);
  // Remove o ponto
  temp := StringReplace(temp, '.', '', [rfReplaceAll]);

  // Se quiser, pode aplicar Trim para eliminar
  // espaços extras no início/fim, se existirem
  temp := Trim(temp);

  Result := temp;
end;

procedure Tfrm_produtos.PngSpeedButton1Click(Sender: TObject);
begin
  AdicionarClonesEmLote;
end;

procedure Tfrm_produtos.PngSpeedButton2Click(Sender: TObject);
begin
  pgDadosClone.Show;
end;

procedure Tfrm_produtos.SpeedButton1Click(Sender: TObject);
begin
  dmCadProduto.tbClonesTemp.First;
  while not dmCadProduto.tbClonesTemp.eof do
  begin
    dmCadProduto.tbClonesTemp.Edit;
    if rdPrefixo.Checked then
      dmCadProduto.tbClonesTempDescricao.Text := trim(edPrefixo.Text) + ' ' + dmCadProduto.tbClonesTempDescricao.Text
    else
      dmCadProduto.tbClonesTempDescricao.Text := dmCadProduto.tbClonesTempDescricao.Text + ' ' + edPrefixo.Text;
    dmCadProduto.tbClonesTemp.post;
    dmCadProduto.tbClonesTemp.Next;
  end;
  dmCadProduto.tbClonesTemp.First;
end;

procedure Tfrm_produtos.Visualizarfichastcnicasdoprodutoouqueocontenham1Click(Sender: TObject);
begin
  LCodProdutoSelecionado := dmCadProduto.tbListagemProdutos.FieldByName('cod_produto').Value;
  Application.CreateForm(TfrmRelFichasTecnicas, frmRelFichasTecnicas);
  frmRelFichasTecnicas.SetCodProdutoSelecionado(LCodProdutoSelecionado);
  frmRelFichasTecnicas.ShowModal;
  frmRelFichasTecnicas.Free;
end;

end.

