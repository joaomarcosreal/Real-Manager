unit uuPedidoDelivery;

interface

uses
  Windows, Messages, SysUtils, Variants, IBX.IBDatabase, ACBrUtil, Classes,
  Produto, graphics, IBX.IBQuery, RealFramework, System.Generics.Collections,
  Controls, Forms, Dialogs, uu_modelo_Vazio, StdCtrls, ExtCtrls, Buttons,
  pcnConversao, System.Math, cxLabel, cxControls, FireDAC.Comp.Client,
  frameworkMobile, DB, cxGridCustomTableView, cxGridDBTableView, cxGrid, Grids,
  DBGrids, ComCtrls, RxMemDS, Menus, cxGraphics, AdvPanel, dxGDIPlusClasses,
  CurvyControls, JvTabBar, JvPageList, JvExControls, cxCheckBox, JvDBGrid,
  uuDMPedidoDelivery, JvMenus, Vcl.AppEvnts, AdvGlassButton, JvValidateEdit,
  PngSpeedButton, AdvOfficeImage, ACBrValidador, Vcl.DBCGrids, cxStyles,
  cxDataStorage, cxGridLevel, cxClasses, AdvDateTimePicker, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, cxNavigator, cxDBData,
  cxCurrencyEdit, cxGridTableView, cxGridCustomView, JvExDBGrids, JvExStdCtrls,
  JvEdit, JvActionsEngine, JvControlActions, Vcl.ActnList, System.Actions,
  cxTextEdit, cxMaskEdit, cxDropDownEdit, cxCheckComboBox, JvComponentBase,
  JvBalloonHint, cxCustomData, cxFilter, cxData, dxDateRanges,
  dxScrollbarAnnotations, ACBrBase, System.ImageList, Vcl.ImgList, cxLookupEdit,
  cxDBLookupEdit, cxDBLookupComboBox, JvDBLookup, JvLabel, Vcl.Mask, RxToolEdit,
  RxCurrEdit;

type
  TfrmPedidosDelivery = class(Tfrm_modelo_vazio)
    ImageList1: TImageList;
    PopMovimento: TPopupMenu;
    Excluir1: TMenuItem;
    Image4: TImage;
    Label29: TLabel;
    Label30: TLabel;
    Label31: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    popObservacoes: TJvPopupMenu;
    Excluirobservao1: TMenuItem;
    ApplicationEvents1: TApplicationEvents;
    popCopiarPedido: TPopupMenu;
    Copiarestepedido1: TMenuItem;
    ACBrValidador1: TACBrValidador;
    pgControle: TJvPageList;
    pgPedido: TJvStandardPage;
    pgConsultaCliente: TJvStandardPage;
    Panel2: TPanel;
    Label28: TLabel;
    lbHora: TLabel;
    Panel15: TPanel;
    Panel16: TPanel;
    Panel17: TPanel;
    rdTipoConsultaCliente: TRadioGroup;
    cxStyleRepository1: TcxStyleRepository;
    cxStyle2: TcxStyle;
    cxStyle1: TcxStyle;
    AdvGlassButton1: TAdvGlassButton;
    gridConsultaClientes: TcxGrid;
    gridConsultaClientesDBTableView1: TcxGridDBTableView;
    gridConsultaClientesDBTableView1Column1: TcxGridDBColumn;
    gridConsultaClientesDBTableView1Column2: TcxGridDBColumn;
    gridConsultaClientesDBTableView1Column3: TcxGridDBColumn;
    gridConsultaClientesDBTableView1Column4: TcxGridDBColumn;
    gridConsultaClientesDBTableView1Column5: TcxGridDBColumn;
    gridConsultaClientesLevel1: TcxGridLevel;
    pnFiltrosPesquisa: TPanel;
    lbNomeCliente: TLabel;
    edNomeClienteConsulta: TEdit;
    edEnderecoConsultaCliente: TEdit;
    lbEnderecoCliente: TLabel;
    lbEnderecoBairro: TLabel;
    edEnderecoConsultaBairro: TEdit;
    cxStyleRepository2: TcxStyleRepository;
    cxStyle3: TcxStyle;
    cxStyle4: TcxStyle;
    PanelPedidoDelivery: TPanel;
    pnTitulo: TPanel;
    lbTitulo: TLabel;
    pnLadoDireito: TPanel;
    pgListOpcoesMenu: TJvPageList;
    pgDesconto: TJvStandardPage;
    rdPercentual: TRadioButton;
    rdValor: TRadioButton;
    edValorDesconto: TJvValidateEdit;
    btAplicardesconto: TAdvGlassButton;
    pgTabelaPreco: TJvStandardPage;
    Panel23: TPanel;
    Label26: TLabel;
    Label27: TLabel;
    DBCtrlGrid1: TDBCtrlGrid;
    pgFormasPagto: TJvStandardPage;
    pnLadoEsquerdo: TPanel;
    pnTopo: TPanel;
    btPesqCliente: TSpeedButton;
    Label37: TLabel;
    Panel3: TPanel;
    Shape1: TShape;
    Label36: TLabel;
    edTelClienteDelivery: TEdit;
    edCodbairro: TEdit;
    edCodClienteDelivery: TEdit;
    Panel20: TPanel;
    Label38: TLabel;
    Label43: TLabel;
    Label44: TLabel;
    Label40: TLabel;
    edNomeCliente: TEdit;
    edTelClienteConsulta: TEdit;
    edCelularCliente: TEdit;
    edBairroCliente: TEdit;
    Panel21: TPanel;
    Label46: TLabel;
    edEnderecoCliente: TEdit;
    pnProduto: TPanel;
    btPesqProdutoCodBarras: TSpeedButton;
    Label35: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    Label5: TLabel;
    Label3: TLabel;
    edQuantidade: TEdit;
    edCodBarrasProduto: TEdit;
    edCodProduto: TEdit;
    Panel6: TPanel;
    edValorUnitarioProduto: TEdit;
    edDescricaoProduto: TEdit;
    Panel27: TPanel;
    pgListMovimentoProdutos: TJvPageList;
    pgResumoProdutos: TJvStandardPage;
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxgrdbclmnGrid1DBTableView1COD_BARRAS: TcxGridDBColumn;
    cxgrdbclmnGrid1DBTableView1DESCRICAO: TcxGridDBColumn;
    cxgrdbclmnGrid1DBTableView1QUANTIDADE: TcxGridDBColumn;
    cxgrdbclmnGrid1DBTableView1VALOR_UNITARIO: TcxGridDBColumn;
    cxgrdbclmnGrid1DBTableView1TOTAL: TcxGridDBColumn;
    cxGrid1Level1: TcxGridLevel;
    pgProdutosPedido: TJvStandardPage;
    cxGrid2: TcxGrid;
    tbViewDetalhado: TcxGridDBTableView;
    tbViewDetalhadoCOD_BARRAS: TcxGridDBColumn;
    tbViewDetalhadoDESCRICAO: TcxGridDBColumn;
    tbViewDetalhadoQuantidade: TcxGridDBColumn;
    tbViewDetalhadoVALOR_UNITARIO: TcxGridDBColumn;
    tbViewDetalhadoDESCONTO: TcxGridDBColumn;
    tbViewDetalhadoTOTAL: TcxGridDBColumn;
    tbViewDetalhadoOBSERVACOES: TcxGridDBColumn;
    lvDetalhado: TcxGridLevel;
    Panel7: TPanel;
    Label17: TLabel;
    popFormasPagamento: TPopupMenu;
    E1: TMenuItem;
    edComplementoCliente: TEdit;
    Label47: TLabel;
    pnFormasPagamentox: TPanel;
    Panel5: TPanel;
    Panel19: TPanel;
    Panel34: TPanel;
    Label7: TLabel;
    Label11: TLabel;
    edCpf: TEdit;
    edNomeClienteNota: TEdit;
    Panel12: TPanel;
    Shape2: TShape;
    Label14: TLabel;
    pnPagamentos: TPanel;
    Panel22: TPanel;
    Shape5: TShape;
    Label19: TLabel;
    Panel24: TPanel;
    Panel26: TPanel;
    Panel13: TPanel;
    Label23: TLabel;
    Label22: TLabel;
    edCodFormaPagamento: TcxLookupComboBox;
    edValorForma: TEdit;
    pgObsClientes: TJvStandardPage;
    Label8: TLabel;
    Image1: TImage;
    JvDBGrid1: TJvDBGrid;
    edNovaObservacao: TCurvyEdit;
    ckbAlertaPedidos: TcxCheckBox;
    ckbImprimeProducao: TcxCheckBox;
    pgUltimosPedidos: TJvStandardPage;
    cxLabel10: TcxLabel;
    cxLabel11: TcxLabel;
    DBGrid2: TDBGrid;
    dbgItensPedido: TDBGrid;
    Panel9: TPanel;
    JvLabel1: TJvLabel;
    lbNomeTabelaEmUso: TLabel;
    Panel18: TPanel;
    Label6: TLabel;
    AdvGlassButton2: TAdvGlassButton;
    pgAgendamento: TJvStandardPage;
    Panel48: TPanel;
    Label10: TLabel;
    AdvGlassButton3: TAdvGlassButton;
    AdvGlassButton4: TAdvGlassButton;
    Panel49: TPanel;
    Label15: TLabel;
    cxLabel1: TcxLabel;
    Panel43: TPanel;
    btDesconto: TPngSpeedButton;
    btPedidosAnteriores: TPngSpeedButton;
    btObsDoCliente: TPngSpeedButton;
    Panel40: TPanel;
    Panel14: TPanel;
    btGravar: TPngSpeedButton;
    btSair: TPngSpeedButton;
    Panel35: TPanel;
    PngSpeedButton2: TPngSpeedButton;
    pgObservacoesLancamento: TJvStandardPage;
    Panel42: TPanel;
    Label4: TLabel;
    E2: TMenuItem;
    Panel1: TPanel;
    lbDescTabelaPreco: TLabel;
    Label33: TLabel;
    Panel8: TPanel;
    Panel36: TPanel;
    Label16: TLabel;
    Label18: TLabel;
    edDataEntrega: TAdvDateTimePicker;
    edHoraEntrega: TAdvDateTimePicker;
    cbkRetiraBalcao: TCheckBox;
    cbkEntrega: TCheckBox;
    Panel10: TPanel;
    AdvGlassButton6: TAdvGlassButton;
    Panel29: TPanel;
    Panel30: TPanel;
    Label21: TLabel;
    AdvOfficeImage2: TAdvOfficeImage;
    ed_valor_bruto: TJvValidateEdit;
    Panel31: TPanel;
    Label39: TLabel;
    AdvOfficeImage3: TAdvOfficeImage;
    ed_total_tx_serv: TJvValidateEdit;
    Panel33: TPanel;
    Label42: TLabel;
    AdvOfficeImage1: TAdvOfficeImage;
    edTotalDescontos: TJvValidateEdit;
    Panel11: TPanel;
    Label9: TLabel;
    AdvOfficeImage5: TAdvOfficeImage;
    ed_total_conta: TJvValidateEdit;
    Panel46: TPanel;
    Panel28: TPanel;
    DBGrid1: TDBGrid;
    Panel25: TPanel;
    Panel44: TPanel;
    edTroco: TJvValidateEdit;
    ed_total_pago: TJvValidateEdit;
    Panel45: TPanel;
    Label25: TLabel;
    Label24: TLabel;
    Panel47: TPanel;
    ckbPedidoCobradoEntregador: TCheckBox;
    Panel4: TPanel;
    memoObsLancamento: TMemo;
    Label20: TLabel;
    pnAlteracaoPrecoProduto: TPanel;
    lbAlterarPreco: TLabel;
    pnConfirmarAlteracao: TPanel;
    AdvGlassButton5: TAdvGlassButton;
    edPrecoAlteracaoProduto: TCurrencyEdit;
    pgImportarMesa: TJvStandardPage;
    Panel32: TPanel;
    Label32: TLabel;
    Panel37: TPanel;
    Label34: TLabel;
    Panel38: TPanel;
    AdvGlassButton7: TAdvGlassButton;
    cbMesaImportar: TcxLookupComboBox;
    I1: TMenuItem;
    N1: TMenuItem;
    procedure Edit1Exit(Sender: TObject);
    procedure btSairClick(Sender: TObject);
    procedure D30001011DrawDataCell(Sender: TObject; const Rect: TRect; Field: TField; State: TGridDrawState);
    procedure btGravarClick(Sender: TObject);
    procedure btNovoKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure DBGrid4DrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBGrid2DrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure cbkEntregaClick(Sender: TObject);
    procedure cbkRetiraBalcaoClick(Sender: TObject);
    procedure btObsProdutoClick(Sender: TObject);
    procedure CurvyPanel1MouseEnter(Sender: TObject);
    procedure CurvyPanel1MouseLeave(Sender: TObject);
    procedure Image3MouseEnter(Sender: TObject);
    procedure Image3MouseLeave(Sender: TObject);
    procedure Image1Click(Sender: TObject);
    procedure memoObsItemExit(Sender: TObject);
    procedure edCodFormaPagamentoExit(Sender: TObject);
    procedure edQuantidadeExit(Sender: TObject);
    procedure edValorFormaExit(Sender: TObject);
    procedure btDeleteProdutoClick(Sender: TObject);
    procedure Edit1Enter(Sender: TObject);
    procedure Excluirobservao1Click(Sender: TObject);
    procedure JvDBGrid2CellClick(Column: TColumn);
    procedure dbgItensPedidoCellClick(Column: TColumn);
    procedure btPesqClienteClick(Sender: TObject);
    procedure ScrollBox1DragOver(Sender, Source: TObject; X, Y: Integer; State: TDragState; var Accept: Boolean);
    procedure ScrollBox1DragDrop(Sender, Source: TObject; X, Y: Integer);
    procedure Copiarestepedido1Click(Sender: TObject);
    procedure btAplicardescontoClick(Sender: TObject);
    procedure edValorDescontoKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure cxLookupComboBox1Click(Sender: TObject);
    procedure DBCtrlGrid1PaintPanel(DBCtrlGrid: TDBCtrlGrid; Index: Integer);
    procedure DBCtrlGrid1Click(Sender: TObject);
    procedure edCodBarrasProdutoChange(Sender: TObject);
    procedure btMudaTabelaPrecoClick(Sender: TObject);
    procedure edNomeClienteConsultaKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure gridConsultaClientesDBTableView1CellDblClick(Sender: TcxCustomGridTableView; ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton; AShift: TShiftState; var AHandled: Boolean);
    procedure AdvGlassButton1Click(Sender: TObject);
    procedure AdvGlassButton2Click(Sender: TObject);
    procedure AdvGlassButton5Click(Sender: TObject);
    procedure AdvGlassButton6Click(Sender: TObject);
    procedure AdvGlassButton7Click(Sender: TObject);
    procedure btAgendamentoClick(Sender: TObject);
    procedure btDescontoClick(Sender: TObject);
    procedure btObsDoClienteClick(Sender: TObject);
    procedure edTelClienteDeliveryKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure edNomeClienteConsultaChange(Sender: TObject);
    procedure gridConsultaClientesDBTableView1CustomDrawCell(Sender: TcxCustomGridTableView; ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
    procedure gridConsultaClientesDBTableView1KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure rdTipoConsultaClienteClick(Sender: TObject);
    procedure DBGrid2CellClick(Column: TColumn);
    procedure E1Click(Sender: TObject);
    procedure edCodBarrasProdutoExit(Sender: TObject);
    procedure edCodFormaPagamentoEnter(Sender: TObject);
    procedure edCodFormaPagamentoKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure edCodFormaPagamentoPropertiesCloseUp(Sender: TObject);
    procedure Excluir1Click(Sender: TObject);
    procedure btPedidosAnterioresClick(Sender: TObject);
    procedure ckbPedidoCobradoEntregadorClick(Sender: TObject);
    procedure E2Click(Sender: TObject);
    procedure H1Click(Sender: TObject);
    procedure I1Click(Sender: TObject);
    procedure lbDescTabelaPrecoClick(Sender: TObject);
    procedure PngSpeedButton2Click(Sender: TObject);
    procedure tbViewDetalhadoDblClick(Sender: TObject);
    procedure tbViewDetalhadoEditKeyDown(Sender: TcxCustomGridTableView; AItem: TcxCustomGridTableItem; AEdit: TcxCustomEdit; var Key: Word; Shift: TShiftState);
  private
    { Private declarations }
    LDesativaPerguntaPagamentoEntregador: Boolean;
    retornoForma: Boolean;
    valorForma: double;
    ObsDiverso: string;
    codDiverso: string;
    entradaDoForm: Boolean;
    codPedidoSelecionado: string;
    alterouProdutos: Boolean;
    PedidoPlataformaSelecionado: TPedidoPlataforma;
    idPedidoIntegracao: largeint;
    PodeFecharFormulario: Boolean;
    procedure controla_botoes(botao: TbitBtn);
    function verifica_validade_lancamento: Boolean;

    procedure limpaCampos();
    procedure bloqueiaPaineis();
    procedure desbloqueiaPaineis();
    function verificaValidadeForma(cod_forma: string): Boolean;
    procedure calcula_valores(Sender: TObject);
    function getObsDiversa(): string;
    function getCodDiverso(): string;
    function getRetornoForma(): Boolean;
    procedure gravarInformacoes();
    function verificaValidadeEncerramento(): Boolean;
    function verificaPossibilidadeDeTroco(troco: double): Boolean;
    procedure registraFormaPagto(cod_forma, descricao_forma, valor: string);
    procedure adicionar_pagamento(cod_diverso, obs, cod_forma, descricao_forma, valor: string);
    procedure apagaItemMovimento(id: Integer);
    procedure atualizaListaObservacoesCliente(ACodCliente: string);
    procedure NovoPedido;
    function validarCPFCliente: Boolean;
    procedure BuscaInformacoesProduto(codProduto: string);
    procedure gravarPagamentos(codigoPedido: string; ATransacao: TIBTransaction);
    procedure getDadosPedidoPlataforma;
    procedure gravarAlteracoesAntes(codAlteracao, codigoPedido: string; tipoAlteracao: smallint; ts: TIBTransaction);
    procedure gravarAlteracoesPos(codAlteracao, codigoPedido: string; tipoAlteracao: smallint; ts: TIBTransaction);
    procedure gravaItensDoPedido(AcodigoPedido: string; LTransacao: TIBTransaction);
    procedure gravaSaboresPizzaPedido(AcodigoPedido: string; LTransacao: TIBTransaction);
    procedure apagarPedido(codPedido: string; ts: TIBTransaction);
    procedure retornaInformacoesPedido(ACodPedido: string);
    procedure retornaItensDoPedido(ACodPedido: string);
    procedure retornaSaboresPizzaSelecionados(ACodPedido: string);
    procedure retornaFormasDePagamentoDoPedido(ACodPedido: string);
    procedure retornaDadosDoPedido(ACodPedido: string);
    procedure retornaDadosClienteDelivery(ATelefone, ACodCliente: string);
    procedure mostraTabelaPreco;
    procedure gravaDadosDoPedido(AcodigoPedido: string; AStatusPedido, ARetiraBalcao, AIsentarEntrega, AAlterado: Integer; ts: TIBTransaction);
    procedure selecionaCliente;
    procedure finalizaThreads(Sender: TObject);
    procedure abreCadastroClientes;
    procedure finalizaConsultaClientes(Sender: TObject);
    procedure adicionarProdutosPedidoPlataforma(APedido: TPedidoPlataforma);
    procedure getPagamentosPedidoPlataforma(APedido: TPedidoPlataforma);
    function getCodProduto(ACodigoPDV: string): string;
    procedure confirmaIntegracaoPedidoPlataforma(APedido: TPedidoPlataforma);

    procedure ExibeModoResumidoMovimentoProdutos;
    procedure AtualizaValoresPorTabelaPreco(ATabela: Integer);
    procedure BuscaMovimento;
    procedure AtualizaTotalDePagamentos;
    procedure ExcluirProdutoDoPedido(AID: LongInt);
    procedure ExcluirPagamentos(ATodos: Boolean);
    procedure AbrirSelecaoDeTabelaDePrecos;
    procedure IncluirObservacaoCliente(ACodCliente, AObservacao: string);
    procedure AdicionarProduto(AProduto: Produto.TProduto);
    procedure validarAlteracaoLancamento;
    procedure ValidarImportacaoDeMesa;
  public
    { Public declarations }
    soperadoraCartao, snumeroCartao, svalidadeCartao, scodigoCartao: string;
    procedure setCodDiverso(cod_diverso: string);
    procedure setRetornoForma(ret: Boolean);
    procedure setObsDiversa(obs: string);
    function getValorFormaPagamento(): double;
    procedure setCodPedidoSelecionado(codPedido: string);
    function getCodPedidoSelecionado(): string;
    procedure setEvento(ev: smallint);
    procedure setPedidoPlataformaAtual(APedido: TPedidoPlataforma);
  end;

var
  frmPedidosDelivery: TfrmPedidosDelivery;
  limpouPagamentos: Boolean;
  LMensagemAtencaoEntregador: string;

implementation

uses
  uu_data_module, uu_obs_lancamento_caixa, uu_frm_principal,
  uu_pagamento_faturado, uu_cad_clientes_delivery, uuSelecaoSaboresPizza,
  ObsClienteDeliveryModel, uuSelecionaTabelaPrecos;

{$R *.dfm}

procedure TfrmPedidosDelivery.Edit1Enter(Sender: TObject);
begin
  inherited;

  if ((Sender is TEdit) and ((Sender as TEdit).Name = 'edTelClienteDelivery')) then
  begin
    pgListOpcoesMenu.ActivePageIndex := 0;
    pgProdutosPedido.Show;
  end;

  if ((Sender is TEdit) and ((Sender as TEdit).Name = 'edCodBarrasProduto')) then
    pgProdutosPedido.Show;

  if ((Sender is TEdit) and ((Sender as TEdit).Name = 'edQuantidade')) then
    pgProdutosPedido.Show;

end;

procedure TfrmPedidosDelivery.BuscaInformacoesProduto(codProduto: string);
begin
  if (verificaExistenciaProduto(codProduto, 2) = false) then
  begin
    ShowMessage('O código informado não pertence a um produto cadastrado!');
    edCodBarrasProduto.SetFocus;
    edCodBarrasProduto.text := '';
    ;
    exit;
  end;

  if (verificaSeProdutoPodeSerVendido(codProduto, 2) = false) then
  begin
    ShowMessage('O produto informado está desabilitado para venda!');
    edCodBarrasProduto.SetFocus;
    edCodBarrasProduto.text := '';
    ;
    exit;
  end;
  exibeInformacoesProduto(codProduto, 2);

end;

procedure TfrmPedidosDelivery.ExibeModoResumidoMovimentoProdutos();
var
  LSQL: TStringList;
  LTbAux: TFDMemTable;
begin
  LTbAux := TFDMemTable.Create(Self);
  LSQL := TStringList.Create;

  try
    try
      LSQL.add(' select  ms.cod_produto, p.cod_barras, p.descricao,                             ');
      LSQL.add('         ms.valor_unitario,                                                     ');
      LSQL.add('         udf_roundabnt(sum( ms.quantidade * ms.valor_unitario),3) as total,     ');
      LSQL.add('          udf_roundabnt(sum(ms.quantidade),3) as quantidade                     ');
      LSQL.add('       from movimento_mesa ms                                                   ');
      LSQL.add('          inner join produtos p on (p.cod_produto = ms.cod_produto)             ');
      LSQL.add('         where ms.cod_mesa=' + Quotedstr(mesaDelivery));
      LSQL.add('         group by ms.cod_produto, p.cod_barras, p.descricao,  ms.valor_unitario ');
      dm.getMemTable(dmPedidoDelivery.tbMovimentoResumido, LSQL.text);
      pgResumoProdutos.Show;

    except
      on E: Exception do
      begin
        dm.exibe_painel_erro('Erro ao exibir o modo resumido ', 'Ok');
        dm.adicionaLog('Erro ao exibir o modo resumido');
        dm.adicionaLog(LSQL.text);

      end;
    end;
  finally
    FreeAndNil(LSQL);
    LTbAux.Active := false;
    FreeAndNil(LTbAux);
  end;
end;

procedure TfrmPedidosDelivery.Edit1Exit(Sender: TObject);
var
  codProduto: string;
begin
  inherited;

  if (Sender is TEdit and ((Sender as TEdit).Name = 'edTelClienteDelivery') and (evento = 1)) then
  begin
    if Trim(edTelClienteDelivery.text) = '' then
    begin
      exit;
    end;
    try
      FormatFloat('00000', StrToFloat(edTelClienteDelivery.text));
    except
      begin
        ShowMessage('Telefone inválido!');
        edTelClienteDelivery.text := '';
        ;
        edTelClienteDelivery.SetFocus;
        exit;
      end;
    end;

    if (verificaExistenciaClienteDeliveryPorTelefone(Trim(edTelClienteDelivery.text)) = true) then
    begin
      desbloqueiaPaineis();
      retornaDadosClienteDelivery(edTelClienteDelivery.text, '');
    end
    else
    begin
      if (MessageDlg('Cliente não cadastrado, deseja cadastrar agora ?', mtConfirmation, [mbYes, mbNo], 0) = MrYes) then
      begin
        Application.createForm(TfrmCadClientesDelivery, frmCadClientesDelivery);
        frmCadClientesDelivery.setEvento(1);
        frmCadClientesDelivery.setCodCliente(edTelClienteDelivery.text);
        frmCadClientesDelivery.ShowModal;
        frmCadClientesDelivery.free;
        edTelClienteDelivery.SetFocus;

      end
      else
      begin

      end;
    end;
  end
  else
  begin
    if evento = 4 then
    begin
      if (Trim(edTelClienteDelivery.text) = '') then
        exit;

      try
        edTelClienteDelivery.text := FormatFloat('00000000', StrToFloat(edTelClienteDelivery.text));
      except

        ShowRealDialog(Self, tmErro, 'Erro', 'Código de pedido inválido');
        edTelClienteDelivery.SetFocus;
        exit;
      end;

      if verificaExistenciaPedidoDelivery(edTelClienteDelivery.text) then
      begin
        retornaDadosDoPedido(edTelClienteDelivery.text);
        btGravar.Visible := false;
        alterouProdutos := false;
      end
      else
      begin
        ShowRealDialog(Self, tmErro, 'Erro', 'Código de pedido inválido');
        edTelClienteDelivery.SetFocus;
        exit;
      end;
    end;

  end;

end;

procedure TfrmPedidosDelivery.retornaDadosClienteDelivery(ATelefone: string; ACodCliente: string);
var
  ts: TIBTransaction;
  q: TIBQuery;
  msgPedidoExistente: string;
begin

  ts := TIBTransaction.Create(nil);
  ts.Params.add('read_committed');
  ts.Params.add('rec_version');
  ts.Params.add('nowait');
  ts.DefaultDatabase := dm.dbrestaurante;
  ts.Active := false;
  ts.Active := true;

  q := TIBQuery.Create(Self);
  q.Database := dm.dbrestaurante;
  q.Transaction := ts;
  q.Active := false;
  q.SQL.Clear;

  try
    try
      q.SQL.add('  select c.codigo as cod_cliente, coalesce(nome,' + Quotedstr('') + ') as nome, ');
      q.SQL.add('       b.codigo as codBairro, coalesce(b.descricao,' + Quotedstr('') + ') as descBairro, ');
      q.SQL.add('       coalesce(c.endereco,' + Quotedstr('') + ') as endereco,  coalesce(c.complemento,' + Quotedstr('') + ') as complemento, ');
      q.SQL.add('       coalesce(c.referencia1,' + Quotedstr('') + ') as referencia1, coalesce(c.referencia2,' + Quotedstr('') + ') as referencia2, ');
      q.SQL.add('       coalesce(c.telefone,' + Quotedstr('') + ') as telefone,');
      q.SQL.add('       coalesce(c.celular,' + Quotedstr('') + ') as celular,c.dt_nascimento, ');
      q.SQL.add('       b.codigo as codBairro ');
      q.SQL.add('        from clientes_delivery c ');
      q.SQL.add('          inner join bairro b  on (b.codigo = c.cod_bairro) ');

      if (Trim(ATelefone) <> '') then
        q.SQL.add(' where c.telefone=' + Quotedstr(ATelefone) + ' or c.celular=' + Quotedstr(ATelefone))
      else
        q.SQL.add(' where c.codigo=' + Quotedstr(ACodCliente));

      q.Active := true;

      if (evento = 1) then
      begin
        ed_total_tx_serv.value := getValorTxEntregaBairro(q.fieldbyname('codBairro').value);
        edTelClienteDelivery.text := q.fieldbyname('telefone').value;
      end;

      if Assigned(PedidoPlataformaSelecionado) then
      begin
        if (PedidoPlataformaSelecionado.ResponsavelEntrega = true) then
        begin
          ed_total_tx_serv.value := PedidoPlataformaSelecionado.TaxaDeEntrega;
        end
        else
        begin
          ed_total_tx_serv.value := 0;
        end;
      end;

      edCodClienteDelivery.text := q.fieldbyname('cod_cliente').value;
      edNomeCliente.text := q.fieldbyname('nome').value;
      edBairroCliente.text := q.fieldbyname('descBairro').value;
      edEnderecoCliente.text := q.fieldbyname('endereco').value;
      edComplementoCliente.text := q.fieldbyname('complemento').value + ', ' + q.fieldbyname('referencia1').value + ',' + q.fieldbyname('referencia2').value;
      edCelularCliente.text := q.fieldbyname('celular').value;

      edCodbairro.text := q.fieldbyname('codBairro').value;
      dmPedidoDelivery.BuscaUltimosPedidos(edCodClienteDelivery.text);
      atualizaListaObservacoesCliente(edCodClienteDelivery.text);

      if cbkEntrega.Checked then
      begin
        ed_total_tx_serv.value := 0;
      end;

      if (cbkRetiraBalcao.Checked) then
      begin
        ed_total_tx_serv.value := 0;
      end;

      BuscaMovimento;
      calcula_valores(edValorForma);

      if (evento = 1) then
      begin
        q.Active := false;
        q.SQL.Clear;
        q.SQL.add('select p.codigo, p.hora_lancamento, p.valor_total from pedidos_delivery p where p.data=' + Quotedstr(FormatDateTime('DD.MM.YYY', data_do_sistema)));
        q.SQL.add(' and p.cod_cliente=' + Quotedstr(edCodClienteDelivery.text));
        /// ///dm.adicionalog(q.SQL.Text);
        q.Active := true;
        q.FetchAll;

        if (q.IsEmpty = false) then
        begin
          msgPedidoExistente := sLineBreak + 'Já existe um pedido desse cliente lançado na data corrente. Verifique se esse pedido já foi lançado para não haver duplicação!!';
          msgPedidoExistente := msgPedidoExistente + sLineBreak + sLineBreak;
          msgPedidoExistente := msgPedidoExistente + 'Pedido nº' + q.fieldbyname('codigo').value + sLineBreak;
          msgPedidoExistente := msgPedidoExistente + 'Hora:....:' + q.fieldbyname('hora_lancamento').AsString + sLineBreak;
          msgPedidoExistente := msgPedidoExistente + 'Valor....:' + q.fieldbyname('valor_total').AsString + sLineBreak + sLineBreak;
          msgPedidoExistente := msgPedidoExistente + 'Deseja continuar ?';

          if (ShowRealDialog(Self, tmConfirmacaoPorPIN, 'Confirme', msgPedidoExistente, 16) = teSim) then
          begin

          end
          else
          begin
            q.Active := false;
            ts.Active := false;
            close;
          end;
        end;
      end;

    except

      ShowRealDialog(Self, tmErro, 'Erro', 'Erro ao retornar dados do cliente!');

    end;

  finally
    q.Active := false;
    ts.Active := false;
    FreeAndNil(q);
    FreeAndNil(ts);
  end;
end;

procedure TfrmPedidosDelivery.retornaInformacoesPedido(ACodPedido: string);
var
  q: TIBQuery;
  ts: TIBTransaction;
begin
  ts := TIBTransaction.Create(nil);
  ts.Params.add('read_committed');
  ts.Params.add('rec_version');
  ts.Params.add('nowait');
  ts.DefaultDatabase := dm.dbrestaurante;
  ts.Active := false;
  ts.Active := true;

  q := TIBQuery.Create(Self);
  q.Database := dm.dbrestaurante;
  q.Transaction := ts;
  limpouPagamentos := false;

  try
    try
      q.SQL.add(' select p.codigo, coalesce(p.cpf_nota,' + Quotedstr('') + ') as cpf_nota, coalesce(p.retira_balcao,0) as retira_balcao, coalesce(p.isentar_entrega,0) as isentar_entrega, p.DATA_HORA_ENTREGA,');
      q.SQL.add('        coalesce(p.nome_nota,' + Quotedstr('') + ') as nome_nota, p.valor_entrega,p.valor_desconto, p.valor_total,p.tabela_preco,');
      q.SQL.add('       c.codigo as cod_cliente, coalesce(nome,' + Quotedstr('') + ') as nome,                                                 ');
      q.SQL.add('      b.codigo as codBairro, coalesce(b.descricao,' + Quotedstr('') + ') as descBairro,                                       ');
      q.SQL.add('      coalesce(c.endereco,' + Quotedstr('') + ') as endereco,  coalesce(c.complemento,' + Quotedstr('') + ') as complemento,      ');
      q.SQL.add('      coalesce(c.referencia1,' + Quotedstr('') + ') as referencia1, coalesce(c.referencia2,' + Quotedstr('') + ') as referencia2, ');
      q.SQL.add('      coalesce(c.celular,' + Quotedstr('') + ' ) as celular,c.dt_nascimento,                                                  ');
      q.SQL.add('      b.codigo as codBairro, coalesce(ID_PEDIDO_INTEGRACAO,0) as ID_PEDIDO_INTEGRACAO                                     ');
      q.SQL.add('                                                                                                                          ');
      q.SQL.add(' from pedidos_delivery p                                                                                                  ');
      q.SQL.add('  inner join clientes_delivery c on (c.codigo = p.cod_cliente)                                                            ');
      q.SQL.add('  inner join bairro   b on (b.codigo = c.cod_bairro)                                                                      ');
      q.SQL.add(' where p.codigo=' + Quotedstr(ACodPedido));
      q.Active := true;

      dm.setTabelaPrecoAtual(q.fieldbyname('tabela_preco').value);
      AtualizaLabelsTabelaPreco();

      if (q.fieldbyname('DATA_HORA_ENTREGA').value <> null) then
      begin
        edDataEntrega.Date := q.fieldbyname('DATA_HORA_ENTREGA').value;
        edHoraEntrega.time := StrToTime(FormatDateTime('HH:MM:SS', q.fieldbyname('DATA_HORA_ENTREGA').value));
      end
      else
      begin
        edDataEntrega.Date := now;
        edHoraEntrega.time := now;
      end;

      edCodClienteDelivery.text := q.fieldbyname('cod_cliente').value;
      edCpf.text := q.fieldbyname('cpf_nota').value;
      edNomeClienteNota.text := q.fieldbyname('nome_nota').value;
      ed_total_tx_serv.value := q.fieldbyname('valor_entrega').value;
      edTotalDescontos.value := q.fieldbyname('valor_desconto').value;
      ed_total_conta.value := q.fieldbyname('valor_total').value;
      idPedidoIntegracao := q.fieldbyname('ID_PEDIDO_INTEGRACAO').value;

      retornaDadosClienteDelivery('', edCodClienteDelivery.text);

      if (q.fieldbyname('RETIRA_BALCAO').value = 1) then
      begin
        ed_total_tx_serv.value := 0;
        cbkRetiraBalcao.Checked := true;
      end
      else
      begin
        ed_total_tx_serv.value := q.fieldbyname('valor_entrega').value;
        cbkRetiraBalcao.Checked := false;
      end;

      if (q.fieldbyname('isentar_entrega').value = 1) then
      begin
        cbkEntrega.Checked := true;
        ed_total_tx_serv.value := 0;
      end
      else
      begin
        cbkEntrega.Checked := false;
      end;

    except
      on E: Exception do
      begin
        raise Exception.Create('Erro ao buscar informações do pedido! ' + sLineBreak + E.Message);
      end;

    end;
  finally
    q.Active := false;
    FreeAndNil(q);

    ts.Active := false;
    FreeAndNil(ts);
  end;
end;

procedure TfrmPedidosDelivery.ScrollBox1DragDrop(Sender, Source: TObject; X, Y: Integer);
var
  codPedido: string;
begin

  codPedido := dmPedidoDelivery.qryUltimosPedidos.fieldbyname('CODIGO').value;
  dmPedidoDelivery.copiarPedido(codPedido, numero_caixa, codigo_usuario, mesaDelivery);
  AtualizaLabelsTabelaPreco();
  BuscaMovimento;

end;

procedure TfrmPedidosDelivery.ScrollBox1DragOver(Sender, Source: TObject; X, Y: Integer; State: TDragState; var Accept: Boolean);
begin
  inherited;
  if (Source is TJvDBGrid) then
    Accept := true;
end;

procedure TfrmPedidosDelivery.btSairClick(Sender: TObject);
begin
  close;

end;

function TfrmPedidosDelivery.verifica_validade_lancamento: Boolean;
begin
  result := true;

  if (Trim(edCodBarrasProduto.text) = '') then
  begin

    ShowRealDialog(Self, tmErro, 'Erro', 'Código de produto inválido');
    edCodBarrasProduto.SetFocus;
    result := false;
    exit;
  end;

  try
    StrToFloat(edQuantidade.text);
  except
    begin

      ShowRealDialog(Self, tmErro, 'Erro', 'Quantidade inválida!');
      edQuantidade.text := '';
      ;
      edQuantidade.SetFocus;
      exit;
    end;
  end;

  if (StrToFloat(edQuantidade.text) <= 0) then
  begin
    dm.exibe_painel_erro('Quantidade inválida!', 'Ok');
    edQuantidade.text := '';
    ;
    edQuantidade.SetFocus;
    exit;
  end;

  if (verificaExistenciaProduto(edCodBarrasProduto.text, 2) = false) then
  begin

    ShowRealDialog(Self, tmErro, 'Erro', 'Código de produto inválido');
    edCodBarrasProduto.SetFocus;
    edCodBarrasProduto.text := '';
    ;
    result := false;
    exit;
  end;

  if (verificaSeProdutoPodeSerVendido(edCodBarrasProduto.text, 2) = false) then
  begin

    ShowRealDialog(Self, tmErro, 'Erro', 'Produto desabilitado para venda!');

    edCodBarrasProduto.SetFocus;
    edCodBarrasProduto.text := '';
    ;
    result := false;
    exit;
  end;

  if not (verificaSeProdutoVendeFracionado(edCodBarrasProduto.text, 2)) then
  begin
    try

      StrToInt(edQuantidade.text);
    except
      begin
        dm.exibe_painel_erro('Este produto não pode ser vendido de forma fracionada!', 'Ok');
        edQuantidade.text := '';
        ;
        edQuantidade.SetFocus;
        result := false;
        exit;
      end;
    end;

  end;

  result := true;
end;

procedure TfrmPedidosDelivery.adicionarProdutosPedidoPlataforma(APedido: TPedidoPlataforma);
var
  LSQL: TStringList;
  ctProdutos: Integer;
  idMovimentoMesa: largeint;
  idSaborMovimentoMesa: largeint;
  LSabor: TSaborPizzaPlataforma;
  I: Integer;
  LListaInstrucoes: TList<string>;
  LsaboresDescricao: string;
  SQLProdutoPedido: string;
  SQLSaboresPizza: string;
  LString: string;
begin

  LSQL := TStringList.Create;
  LListaInstrucoes := TList<string>.Create;

  try
    try
      for ctProdutos := 0 to APedido.Produtos.Count - 1 do
      begin

        idMovimentoMesa := StrToInt(dm.geraCodigo('G_MOVIMENTO_MESA', 15));
        LSQL.Clear;
        LSQL.add('insert into movimento_mesa (cod_mesa,cod_garcon,cod_produto,quantidade,');
        LSQL.add('numero_caixa,cod_usuario,valor_unitario,id,observacoes,sabores,tipo_massa,PRODUTO_PRINCIPAL, tabela_preco) values (');
        LSQL.add('' + Quotedstr(mesaDelivery) + ',');
        LSQL.add('' + Quotedstr(garcomDelivery) + ',');
        LSQL.add('' + Quotedstr(getCodProduto(APedido.Produtos[ctProdutos].CodigoPDV)) + ',');
        LSQL.add('' + dm.TrocaVirgPPto(FloatToStr(APedido.Produtos[ctProdutos].quantidade)) + ',');
        LSQL.add('' + Quotedstr(numero_caixa) + ',');
        LSQL.add('' + Quotedstr(codigo_usuario) + ',');
        LSQL.add('' + dm.TrocaVirgPPto(FloatToStr(APedido.Produtos[ctProdutos].preco)) + ',');
        LSQL.add(IntToStr(idMovimentoMesa) + ',');
        LSQL.add('' + Quotedstr(APedido.Produtos[ctProdutos].ObservacaoPreparo) + ',');
        LSQL.add('' + Quotedstr(':vpSabores') + ',');
        LSQL.add('' + Quotedstr('') + ',');
        LSQL.add(IntToStr(APedido.Produtos[ctProdutos].IDProdutoPai) + ',');
        LSQL.add(IntToStr(APedido.Plataforma.CodTabelaPreco) + ');');






        // dm.executaSQL(LSQL.Text);

        if APedido.Produtos[ctProdutos].pizza then
        begin
          LsaboresDescricao := '';
          for I := 0 to APedido.Produtos[ctProdutos].SaboresPizza.Count - 1 do
          begin
            LSabor := APedido.Produtos[ctProdutos].SaboresPizza[I];
            LsaboresDescricao := LsaboresDescricao + sLineBreak + LSabor.proporcao + ' ' + LSabor.Descricao;
          end;

          LSQL.text := StringReplace(LSQL.text, ':vpSabores', LsaboresDescricao, [rfReplaceAll, rfIgnoreCase]);
          LListaInstrucoes.add(LSQL.text);

          for I := 0 to APedido.Produtos[ctProdutos].SaboresPizza.Count - 1 do
          begin
            idSaborMovimentoMesa := StrToInt(dm.geraCodigo('G_ID_SABORES_PIZZA_MOV_MESA', 15));
            LSabor := APedido.Produtos[ctProdutos].SaboresPizza[I];

            LSQL.Clear;
            LSQL.add('insert into SABORES_PIZZA_MOVIMENTO_MESA(id, cod_produto, cod_sabor,');
            LSQL.add(' valor_unitario_sabor,quantidade, id_mov_mesa, proporcao, descricao, cod_mesa) values (');
            LSQL.add(IntToStr(idSaborMovimentoMesa) + ',');
            LSQL.add('' + Quotedstr(LSabor.codProduto) + ',');
            LSQL.add('' + Quotedstr(LSabor.codSabor) + ',');
            LSQL.add('' + dm.TrocaVirgPPto(FloatToStr(LSabor.valorUnitario)) + ',');
            LSQL.add('' + dm.TrocaVirgPPto(FloatToStr(LSabor.quantidade)) + ',');
            LSQL.add(IntToStr(idMovimentoMesa) + ',');
            LSQL.add('' + Quotedstr(LSabor.proporcao) + ',');
            LSQL.add('' + Quotedstr(LSabor.Descricao) + ',');
            LSQL.add('' + Quotedstr(mesaDelivery) + ');');
            LListaInstrucoes.add(LSQL.text);
          end;
        end
        else
        begin
          LSQL.text := StringReplace(LSQL.text, ':vpSabores', '', [rfReplaceAll, rfIgnoreCase]);
          LListaInstrucoes.add(LSQL.text);
        end;

      end;

      dm.ExecutaBlocoDeInstrucoes(LListaInstrucoes, 50);

    except
      on E: Exception do
      begin

        ShowRealDialog(Self, tmErro, 'Erro', 'Erro ao lançar os produtos do pedido da plataforma! ' + sLineBreak + sLineBreak + E.Message);
        raise Exception.Create('Ocorreu um erro!');
      end;

    end;

  finally
    LListaInstrucoes.Clear;
    FreeAndNil(LListaInstrucoes);
    LSQL.Clear;
    FreeAndNil(LSQL);
  end;

end;

function TfrmPedidosDelivery.getCodProduto(ACodigoPDV: string): string;
var
  tbAux: TFDMemTable;
begin
  tbAux := TFDMemTable.Create(Self);
  try
    try
      dm.getMemTable(tbAux, 'select cod_produto from produtos p where p.vende=1 and p.cod_barras=' + Quotedstr(ACodigoPDV));
      result := tbAux.fieldbyname('cod_produto').value;
    except
      on E: Exception do
      begin

        ShowRealDialog(Self, tmErro, 'Erro', 'Erro ao buscar o código do produto de um dos produtos do pedido!' + sLineBreak + sLineBreak + 'Cod: ' + ACodigoPDV);
        dm.adicionaLog('Erro ao buscar o código do produto ' + E.Message);
        raise Exception.Create('Ocorreu um erro!');
      end;

    end;
  finally
    tbAux.Active := false;
    FreeAndNil(tbAux);
  end;

end;

procedure TfrmPedidosDelivery.getPagamentosPedidoPlataforma(APedido: TPedidoPlataforma);
var
  ctPagamentos: Integer;
  valorForma: double;
begin

  if (PedidoPlataformaSelecionado.ResponsavelEntrega = true) then
  begin
    if Assigned(PedidoPlataformaSelecionado) then
      ed_total_tx_serv.value := PedidoPlataformaSelecionado.TaxaDeEntrega;
  end
  else
  begin
    ed_total_tx_serv.value := 0;
  end;

  try
    for ctPagamentos := 0 to APedido.Pagamentos.Count - 1 do
    begin
      valorForma := PedidoPlataformaSelecionado.Pagamentos[ctPagamentos].valor;

      if (PedidoPlataformaSelecionado.ResponsavelEntrega = false) then
      // abate o valor da entrega para não dar troco
      begin
        if ctPagamentos = 0 then
        begin
          valorForma := valorForma - PedidoPlataformaSelecionado.TaxaDeEntrega;
        end
      end;

      adicionar_pagamento('', '', PedidoPlataformaSelecionado.Pagamentos[ctPagamentos].CodigoPDV, PedidoPlataformaSelecionado.Pagamentos[ctPagamentos].Descricao, FloatToStr(valorForma));

    end;
  except
    on E: Exception do
    begin

      ShowRealDialog(Self, tmErro, 'Erro', 'Erro ao retornar formas de pagamento do pedido da plataforma' + sLineBreak + sLineBreak + E.Message);
      /// /dm.adicionalog('Erro ao retornar formas de pagamento do pedido da plataforma' + sLineBreak + sLineBreak + E.Message);
      raise Exception.Create('Erro ao capturar formas do pedido da plataforma');
    end;

  end;

end;

procedure TfrmPedidosDelivery.AdicionarProduto(AProduto: Produto.TProduto);
var
  codigo_lancamento: string;
  observacoesProducao, saboresProducao: string;
  tipoMassa: string;
  idMovimentoMesa: largeint;
  codProdutoPizza: string;
  totalProporcaoPizza: double;
  IDSaborPizza: string;
begin

  alterouProdutos := true;
  idMovimentoMesa := StrToInt(dm.geraCodigo('G_MOVIMENTO_MESA', 15));

  if AProduto.RequerObservacao then
  begin
    if (ShowRealDialog(Self, tmConfirmacao, 'Confirme', 'Informar observações ?') = teSim) then
    begin
      Application.CreateForm(Tfrm_obs_lancamento_caixa, frm_obs_lancamento_caixa);
      frm_obs_lancamento_caixa.ShowModal;
      frm_obs_lancamento_caixa.free;
      observacoesProducao := frm_principal.tipoMassaPizza;

    end;
  end;

  if (verificaSeProdutoEhPizza(edCodBarrasProduto.text, 2) = true) then
  begin
    frm_principal.obsSaborPizza := '';
    frm_principal.obsLancamento := '';
    dm.tbSaboresPizzaTemp.Active := false;
    dm.tbSaboresPizzaTemp.EmptyTable;
    Application.createForm(TfrmSelecaoSaboresPizza, frmSelecaoSaboresPizza);
    frmSelecaoSaboresPizza.ShowModal;
    frmSelecaoSaboresPizza.free;

    // Seleciona o valor  da pizza. Para cobrar proporcional, o último parametro da funcao de ve ser  true;
    edValorUnitarioProduto.text := FormatFloat('###,###,##0.00', getValorPizza(edCodBarrasProduto.text, 2, 2));

  end;

  saboresProducao := '';
  tipoMassa := '';

  if (verificaSeProdutoEhPizza(edCodBarrasProduto.text, 2) = true) then
  begin
    dm.tbSaboresPizzaTemp.First;
    while not dm.tbSaboresPizzaTemp.Eof do
    begin
      saboresProducao := saboresProducao + dm.tbSaboresPizzaTemptamanho.value + ' ' + dm.tbSaboresPizzaTempdescricao.value + #10#13;
      dm.tbSaboresPizzaTemp.Next;
    end;
    observacoesProducao := frm_principal.obsSaborPizza;
    tipoMassa := frm_principal.tipoMassaPizza;
  end
  else
  begin
    observacoesProducao := strObsProduto;
    tipoMassa := '';
  end;

  dm.qryauxiliar.Active := false;
  dm.qryauxiliar.SQL.text := '';
  ;
  dm.qryauxiliar.SQL.add('insert into movimento_mesa (cod_mesa,cod_garcon,cod_produto,quantidade,');
  dm.qryauxiliar.SQL.add('numero_caixa,cod_usuario,valor_unitario,id,observacoes,sabores,tipo_massa, produto_principal, tabela_preco) values (');
  dm.qryauxiliar.SQL.add('' + Quotedstr(mesaDelivery) + ',');
  dm.qryauxiliar.SQL.add('' + Quotedstr(garcomDelivery) + ',');
  dm.qryauxiliar.SQL.add('' + Quotedstr(edCodProduto.text) + ',');
  dm.qryauxiliar.SQL.add('' + dm.TrocaVirgPPto(edQuantidade.text) + ',');
  dm.qryauxiliar.SQL.add('' + Quotedstr(numero_caixa) + ',');
  dm.qryauxiliar.SQL.add('' + Quotedstr(codigo_usuario) + ',');
  dm.qryauxiliar.SQL.add('' + dm.TrocaVirgPPto(edValorUnitarioProduto.text) + ',');
  dm.qryauxiliar.SQL.add(IntToStr(idMovimentoMesa) + ',');
  dm.qryauxiliar.SQL.add('' + Quotedstr(observacoesProducao) + ',');
  dm.qryauxiliar.SQL.add('' + Quotedstr(saboresProducao) + ',');
  dm.qryauxiliar.SQL.add('' + Quotedstr(tipoMassa) + ',1,');
  dm.qryauxiliar.SQL.add(IntToStr(dm.getTabelaPrecoAtual.codigo) + ')');

  try
    begin
      dm.qryauxiliar.ExecSQL;
    end;
  except
    begin
      dm.cria_log_de_erros(dm.qryauxiliar.SQL, 'Caixa - Restaurante ', 'Erro ao lançar produto no movimento da mesa ', codigo_usuario);
      exit;
    end;
  end;

  if (dm.tbSaboresPizzaTemp.IsEmpty = false) then
  begin
    dm.qryauxiliar.Active := false;
    dm.qryauxiliar.SQL.text := '';
    ;
    dm.tbSaboresPizzaTemp.First;
    totalProporcaoPizza := 0;

    while not dm.tbSaboresPizzaTemp.Eof do
    begin
      totalProporcaoPizza := StrToFloat(edQuantidade.text) * dm.tbSaboresPizzaTempproporcao.value;
      dm.qryauxiliar.Active := false;
      dm.qryauxiliar.SQL.text := '';
      ;
      IDSaborPizza := IntToStr(StrToInt(dm.geraCodigo('G_ID_SABORES_PIZZA_MOV_MESA', 10)));
      dm.qryauxiliar.SQL.add('insert into SABORES_PIZZA_MOVIMENTO_MESA (ID,COD_MESA,ID_MOV_MESA,COD_PRODUTO,COD_SABOR,QUANTIDADE,VALOR_UNITARIO_SABOR,PROPORCAO,DESCRICAO) values (');
      dm.qryauxiliar.SQL.add('' + (IDSaborPizza) + ',');
      dm.qryauxiliar.SQL.add('' + Quotedstr(mesaDelivery) + ',');
      dm.qryauxiliar.SQL.add(IntToStr(idMovimentoMesa) + ',');
      dm.qryauxiliar.SQL.add(Quotedstr(dm.tbSaboresPizzaTempcodProduto.value) + ',');
      dm.qryauxiliar.SQL.add(Quotedstr(dm.tbSaboresPizzaTempcodigo.value) + ',');
      dm.qryauxiliar.SQL.add('' + dm.TrocaVirgPPto(FloatToStr(totalProporcaoPizza)) + ',');
      dm.qryauxiliar.SQL.add('' + dm.TrocaVirgPPto(FloatToStr(dm.tbSaboresPizzaTempvalorSabor.value)) + ',');
      dm.qryauxiliar.SQL.add(Quotedstr(dm.tbSaboresPizzaTemptamanho.value) + ',');
      dm.qryauxiliar.SQL.add(Quotedstr(dm.tbSaboresPizzaTempdescricao.value) + ')');
      dm.qryauxiliar.ExecSQL;
      dm.tbSaboresPizzaTemp.Next;
    end;

  end;

  dm.tbSaboresPizzaTemp.Active := false;
  dm.tbSaboresPizzaTemp.EmptyTable;
  strObsProduto := '';

  if dm.transacao.Active = false then
    dm.transacao.Active := true;
  dm.transacao.Commit;

  BuscaMovimento;
  edCodBarrasProduto.text := '';
  ;
  edValorUnitarioProduto.text := '';
  ;
  edDescricaoProduto.text := '';
  ;
  edQuantidade.text := '';
  ;
  edCodBarrasProduto.SetFocus;
  edQuantidade.text := '1';
end;

procedure TfrmPedidosDelivery.BuscaMovimento;
var
  qtde: string;
  X: Integer;
  cp: TComponent;
  LQryConsulta: TIBQuery;
  LTransacao: TIBTransaction;
  LSQL: TStringList;
begin

  LTransacao := TIBTransaction.Create(nil);
  LTransacao.Params.add('read_committed');
  LTransacao.Params.add('rec_version');
  LTransacao.Params.add('nowait');

  LTransacao.DefaultDatabase := dm.dbrestaurante;
  LTransacao.Active := false;
  LTransacao.Active := true;
  LQryConsulta := TIBQuery.Create(nil);
  LQryConsulta.Database := dm.dbrestaurante;
  LQryConsulta.Transaction := LTransacao;

  LSQL := TStringList.Create;

  try

    dm.InsereChavesMovimento(numero_caixa, mesaDelivery);
    LSQL.add('select 0 as selecionado, mv.cod_mesa,pr.cod_barras,pr.un_ecf,');
    LSQL.add(' mv.cod_produto,pr.cod_produto,');
    LSQL.add('pr.descricao || ASCII_CHAR(13) || ASCII_CHAR(10) || trim(mv.sabores) as descricao ,mv.quantidade as quantidade,');
    LSQL.add('mv.valor_unitario,');
    LSQL.add(' udf_roundabnt((mv.valor_unitario * mv.quantidade),2)   as total');
    LSQL.add(',mv.comanda, mv.cod_garcon, g.apelido,u.login,mv.hora_lancamento, mv.estado,mv.cod_movimento, mv.desconto,id,impresso,observacoes,sabores,obs_paf,cancelado,mv.tipo_massa,coalesce(mv.nome_cliente,' + Quotedstr('') + ') as nome_cliente,coalesce(mv.pago,0) as pago, coalesce(guid_pagamento,' + Quotedstr('') + ') as guid_pagamento,');
    LSQL.add(' coalesce(guid_order,' + Quotedstr('') + ') as guid_order,');
    LSQL.add(' coalesce(guid_lancamento,' + Quotedstr('') + ') as guid_lancamento,');
    LSQL.add(' coalesce(guid_imagem,' + Quotedstr('') + ') as guid_imagem');

    LSQL.add('  from movimento_mesa mv ');
    LSQL.add('  inner join produtos pr on (pr.cod_produto=mv.cod_produto)');
    LSQL.add('  inner join garcons g on (g.cod_garcon=mv.cod_garcon) ');
    LSQL.add('  inner join usuarios u on (u.cod_usuario=mv.cod_usuario)');
    LSQL.add('  where mv.cod_mesa=' + Quotedstr(mesaDelivery) + ' order by mv.id');
    dm.getMemTable(dm.tbMovimentoMesa, LSQL.text);
    dm.adicionaLog(LSQL.text);

    LQryConsulta.Active := false;
    LQryConsulta.SQL.add('select * from rodapeextrato3(' + Quotedstr(mesaDelivery) + ',0)');
    LQryConsulta.Active := true;
    LQryConsulta.FetchAll;

    if (LQryConsulta.IsEmpty = false) then
    begin
      ed_valor_bruto.value := LQryConsulta.fieldbyname('VALORBRUTO').value;
      edTotalDescontos.value := LQryConsulta.fieldbyname('VALORTOTALDESCONTO').value;
      ed_total_conta.value := LQryConsulta.fieldbyname('VALORTOTAL').value + ed_total_tx_serv.value;
    end;
  finally
    LQryConsulta.Active := false;
    LTransacao.Active := false;
    FreeAndNil(LQryConsulta);
    FreeAndNil(LTransacao);
    FreeAndNil(LSQL);
  end;

end;

procedure TfrmPedidosDelivery.D30001011DrawDataCell(Sender: TObject; const Rect: TRect; Field: TField; State: TGridDrawState);
begin
  inherited;
  if gdFocused in State then
    with (Sender as TDBGrid).Canvas do
    begin

      Brush.Color := clRed;
      FillRect(Rect);
      TextOut(Rect.Left, Rect.Top, Field.AsString);
    end;
end;

procedure TfrmPedidosDelivery.controla_botoes(botao: TbitBtn);
begin

  if ((evento = 1) or (evento = 2) or (evento = 3)) then
  begin

    // btSair.Enabled:=false;
    pnTopo.Enabled := true;
    edTelClienteDelivery.SetFocus;
    pgListOpcoesMenu.ActivePageIndex := 0;

  end;

  { if botao=btGravar then
    begin
    btGravar.Enabled:=false;
    btSair.Enabled:=true;
    end;
  }

end;

procedure TfrmPedidosDelivery.Copiarestepedido1Click(Sender: TObject);
var
  codPedido: string;
begin

  codPedido := dmPedidoDelivery.qryUltimosPedidos.fieldbyname('codigo').value;
  dmPedidoDelivery.copiarPedido(codPedido, numero_caixa, codigo_usuario, mesaDelivery);
  alterouProdutos := true;
  AtualizaLabelsTabelaPreco();
  BuscaMovimento;
  AtualizaValoresPorTabelaPreco(dm.getTabelaPrecoAtual.codigo);

end;

procedure TfrmPedidosDelivery.CurvyPanel1MouseEnter(Sender: TObject);
begin
  inherited;
  (Sender as TPanel).Color := clSkyBlue;

end;

procedure TfrmPedidosDelivery.CurvyPanel1MouseLeave(Sender: TObject);
begin
  inherited;
  (Sender as TPanel).Color := clWhite;
end;

procedure TfrmPedidosDelivery.cxLookupComboBox1Click(Sender: TObject);
begin
  inherited;
  ShowMessage('');
end;

procedure TfrmPedidosDelivery.NovoPedido();
begin
  dm.atualizaDataDoSistema();
  ckbPedidoCobradoEntregador.visible := true;
  ckbPedidoCobradoEntregador.Checked := false;
  frm_principal.obsLancamento := '';
  LMensagemAtencaoEntregador := '';
  evento := 1;
  limpouPagamentos := false;

  dm.tbSaboresPizzaTemp.Active := false;
  dm.tbSaboresPizzaTemp.EmptyTable;
  frm_principal.obsSaborPizza := '';
  frm_principal.obsLancamento := '';
  cbkEntrega.Checked := false;
  cbkRetiraBalcao.Checked := false;
  dmPedidoDelivery.tbFormasPagamentoTemp.Active := false;
  dmPedidoDelivery.tbFormasPagamentoTemp.Active := true;
  edDataEntrega.Date := now;
  edHoraEntrega.time := now;

end;

procedure TfrmPedidosDelivery.btGravarClick(Sender: TObject);
begin
  if verificaValidadeEncerramento then
  begin
    edCodFormaPagamento.DroppedDown := false;
    edCodFormaPagamento.Visible := false;
    if (ShowRealDialog(Self, tmConfirmacao, 'Confirme', 'Deseja salvar o pedido ?', 16) = teSim) then
    begin
      btGravar.Enabled := false;
      gravarInformacoes();
      PodeFecharFormulario := true;

      inherited;
    end;
    edCodFormaPagamento.Visible := true;
  end;
end;

procedure TfrmPedidosDelivery.btMudaTabelaPrecoClick(Sender: TObject);
begin
  inherited;
  mostraTabelaPreco();
end;

procedure TfrmPedidosDelivery.btDeleteProdutoClick(Sender: TObject);
var
  idProduto: Integer;
begin
  inherited;
  idProduto := TImage(Sender).Tag;
  dm.qryMovimentoMesa.Active := true;
  apagaItemMovimento(idProduto);
  alterouProdutos := true;
end;

procedure TfrmPedidosDelivery.apagaItemMovimento(id: Integer);
var
  q: TIBQuery;
  ts: TIBTransaction;
begin

  ts := TIBTransaction.Create(Self);
  q := TIBQuery.Create(Self);
  try
    try
      ts.Name := RandomName(8);
      ts.DefaultDatabase := dm.dbrestaurante;
      ts.Active := false;
      ts.Active := true;

      q.Database := dm.dbrestaurante;
      q.Transaction := ts;
      q.Active := false;
      q.SQL.Clear;

      if (ShowRealDialog(Self, tmConfirmacao, 'Confirme', 'Confirma cancelamento do produto ?') = teSim) then
      begin

        q.Active := false;
        q.SQL.Clear;
        q.SQL.add('delete from movimento_mesa where id=' + IntToStr(id));
        q.ExecSQL;
        ts.Commit;
        BuscaMovimento;
      end;

    except
      on E: Exception do
      begin
        raise Exception.Create(E.Message);
        ts.Rollback;
      end;

    end;
  finally
    ts.Active := false;
    FreeAndNil(ts);
    FreeAndNil(q);
  end;

end;

procedure TfrmPedidosDelivery.limpaCampos();
begin
  edTelClienteDelivery.text := '';
  ;
  edNomeCliente.text := '';
  ;
  edEnderecoCliente.text := '';
  ;
  edBairroCliente.text := '';
  ;
  edComplementoCliente.text := '';
  ;

  edCodBarrasProduto.text := '';
  ;
  edCodProduto.text := '';
  ;
  edQuantidade.text := '';
  ;
  edCodClienteDelivery.text := '';
  ;
  // edCodFormaPagamento.text := '';;
  // edDescFormaPagto.text := '';;
  edValorForma.text := '';
  ;

  ed_valor_bruto.value := 0;
  ed_total_tx_serv.value := 0;
  ed_total_pago.value := 0;
  edTroco.value := 0;
  ed_total_conta.value := 0;
  edValorDesconto.value := 0;
  edTotalDescontos.value := 0;

  // edDataEntrega.text := '';;
  // edHoraEntrega.text := '';;
  cbkEntrega.Checked := false;

  dm.LimpaInformacoesDaMesa(mesaDelivery, numero_caixa);

  dm.tbSaboresPizzaTemp.Active := false;
  dm.tbSaboresPizzaTemp.EmptyTable;
  frm_principal.obsSaborPizza := '';
  frm_principal.obsLancamento := '';

end;

procedure TfrmPedidosDelivery.desbloqueiaPaineis();
begin
  pnTopo.Enabled := true;
  // pnMovimentoMesa.Enabled:=true;
  pnProduto.Enabled := true;
  // pnUltimosPedidos.Enabled:=true;

end;

procedure TfrmPedidosDelivery.edCodBarrasProdutoChange(Sender: TObject);
begin
  inherited;
  if Trim(UpperCase(edCodBarrasProduto.text)) = 'T' then
  begin
    edCodBarrasProduto.text := '';
    mostraTabelaPreco();
  end;
end;

procedure TfrmPedidosDelivery.mostraTabelaPreco();
begin
  {
    if btMudaTabelaPreco.Visible = true then
    begin
    if (dm.verificaPermissaoAcao('B20003010', true, true) = true) then
    begin
    //      dmPedidoDelivery.qryTabelaDePrecos.Active := true;
    pgTabelaPreco.Show;
    end;

    end;
  }
end;

procedure TfrmPedidosDelivery.edCodFormaPagamentoExit(Sender: TObject);
begin
  inherited;
  // pgProdutosPedido.Show;
  // actExitFormaPagamentoExecute(Sender);

end;

procedure TfrmPedidosDelivery.bloqueiaPaineis();
begin
  pnTopo.Enabled := false;
  // pnMovimentoMesa.Enabled:=false;
  pnProduto.Enabled := false;
  // pnUltimosPedidos.Enabled:=false;

end;

function TfrmPedidosDelivery.verificaValidadeForma(cod_forma: string): Boolean;
begin
  try
    cod_forma := FormatFloat('00', StrToFloat(cod_forma))
  except
    begin
      ShowMessage('Código de forma de pagamento inválido!');
      // edCodFormaPagamento.text := '';;
      // edCodFormaPagamento.SetFocus;
      result := false;
      exit;
    end;
  end;

  if ((ed_total_pago.value) >= (ed_total_conta.value)) then
  begin

    ShowRealDialog(Self, tmErro, 'Erro', 'Valor pago já excedeu o total da conta!');
    result := false;
    exit;
  end;
  result := true;
end;

procedure TfrmPedidosDelivery.rdTipoConsultaClienteClick(Sender: TObject);
begin
  inherited;

  case rdTipoConsultaCliente.ItemIndex of
    0:
      begin
        lbNomeCliente.Caption := 'Nome do cliente';
        lbEnderecoCliente.Visible := true;
        lbEnderecoBairro.Visible := true;

        edEnderecoConsultaBairro.Visible := true;
        edEnderecoConsultaCliente.Visible := true;
        edEnderecoConsultaBairro.Visible := true;
      end;

    1:
      begin
        lbNomeCliente.Caption := 'Telefone';
        lbEnderecoCliente.Visible := false;
        lbEnderecoBairro.Visible := false;

        edEnderecoConsultaBairro.Visible := false;
        edEnderecoConsultaCliente.Visible := false;
        edEnderecoConsultaBairro.Visible := false;
      end;

    2:
      begin
        lbNomeCliente.Caption := 'Celular';
        lbEnderecoCliente.Visible := false;
        edEnderecoConsultaBairro.Visible := false;
        edEnderecoConsultaCliente.Visible := false;
        edEnderecoConsultaBairro.Visible := false;

      end;

  end;

end;

procedure TfrmPedidosDelivery.registraFormaPagto(cod_forma: string; descricao_forma: string; valor: string);
var
  tipoForma: Integer;
begin
  if (verificaValidadeForma(cod_forma) = true) then
  begin

    setRetornoForma(false);

    tipoForma := dm.verificaTipoFormaPagamento(cod_forma);
    if (tipoForma <> 1) then
    begin
      case tipoForma of
        2:
          begin



            // Registra Fatura  - Abre tela de consulta de clientes para informar o cliente

            if ((evento = 1) or (limpouPagamentos = true)) then
            begin
              setCodDiverso('');
              setObsDiversa('');
              Application.createForm(Tfrm_pagamento_faturado, frm_pagamento_faturado);
              frm_pagamento_faturado.localOrigem := 2;
              frm_pagamento_faturado.ShowModal;
              frm_pagamento_faturado.free;

              if (getRetornoForma() = true) then
              begin
                adicionar_pagamento(getCodDiverso, getObsDiversa, cod_forma, descricao_forma, valor);
              end
              else
              begin
                setCodDiverso('');
                setObsDiversa('');
              end;
            end
            else
            begin

              adicionar_pagamento(getCodDiverso, getObsDiversa, cod_forma, descricao_forma, valor);
            end;

          end;

      end;

    end
    else
    begin
      adicionar_pagamento('', '', cod_forma, descricao_forma, valor);
    end;

    calcula_valores(edValorForma);
  end;

end;

procedure TfrmPedidosDelivery.setRetornoForma(ret: Boolean);
begin
  Self.retornoForma := ret;
end;

function TfrmPedidosDelivery.getRetornoForma(): Boolean;
begin
  result := Self.retornoForma;

end;

function TfrmPedidosDelivery.getValorFormaPagamento(): double;
begin
  valorForma := StrToFloat(edValorForma.text);
  result := valorForma;
end;

procedure TfrmPedidosDelivery.setCodDiverso(cod_diverso: string);
begin
  Self.codDiverso := cod_diverso;
end;

procedure TfrmPedidosDelivery.setCodPedidoSelecionado(codPedido: string);
begin
  codPedidoSelecionado := codPedido;
end;

procedure TfrmPedidosDelivery.setEvento(ev: smallint);
begin
  Self.evento := ev;
end;

function TfrmPedidosDelivery.getCodDiverso(): string;
begin
  result := Self.codDiverso;
end;

function TfrmPedidosDelivery.getCodPedidoSelecionado: string;
begin
  result := codPedidoSelecionado;
end;

procedure TfrmPedidosDelivery.getDadosPedidoPlataforma;
begin

  if Assigned(PedidoPlataformaSelecionado) then
  begin
    pnTopo.Enabled := false;
    edCodBarrasProduto.SetFocus;
    dm.setTabelaPrecoAtual(PedidoPlataformaSelecionado.Plataforma.CodTabelaPreco);
    retornaDadosClienteDelivery('', FormatFloat('00000', PedidoPlataformaSelecionado.codClienteSistema));
    adicionarProdutosPedidoPlataforma(PedidoPlataformaSelecionado);
    BuscaMovimento;
    getPagamentosPedidoPlataforma(PedidoPlataformaSelecionado);

    BuscaMovimento;
    calcula_valores(edValorForma);
    alterouProdutos := true;
    idPedidoIntegracao := PedidoPlataformaSelecionado.idPedido;
    cbkRetiraBalcao.Enabled := false;
    cbkEntrega.Enabled := false;
    edCpf.text := PedidoPlataformaSelecionado.CPFCliente;

    if (PedidoPlataformaSelecionado.ValorPagamentoPendente > 0) then
    begin
      LDesativaPerguntaPagamentoEntregador := true;
      ckbPedidoCobradoEntregador.visible := true;
      ckbPedidoCobradoEntregador.Checked := true;
      ckbPedidoCobradoEntregador.Enabled := false;
    //  LMensagemAtencaoEntregador := 'COBRAR DO CLIENTE' + sLineBreak + ' O  VALOR DE ' + sLineBreak;
//      LMensagemAtencaoEntregador := LMensagemAtencaoEntregador + 'R$ ' + FormatFloat('###,###,##0.00', PedidoPlataformaSelecionado.ValorPagamentoPendente);
    end
    else
    begin
      ckbPedidoCobradoEntregador.visible := false;
      ckbPedidoCobradoEntregador.Checked := false;
    end;

    if PedidoPlataformaSelecionado.retirarNoLocal then
    begin
      cbkRetiraBalcao.Checked := true;
      cbkEntrega.Checked := true;

    end
    else
    begin
      cbkRetiraBalcao.Checked := false;
      cbkEntrega.Checked := false;
    end;

    if PedidoPlataformaSelecionado.Desconto > 0 then
    begin
      rdValor.Checked := true;
      edValorDesconto.value := PedidoPlataformaSelecionado.Desconto;
      btAplicardesconto.Click;
    end;

    edCodBarrasProduto.SetFocus;
  end
  else
  begin
    edTelClienteDelivery.SetFocus;
  end;

end;

procedure TfrmPedidosDelivery.setObsDiversa(obs: string);
begin
  Self.ObsDiverso := obs;
end;

procedure TfrmPedidosDelivery.setPedidoPlataformaAtual(APedido: TPedidoPlataforma);
begin
  PedidoPlataformaSelecionado := APedido;
end;

function TfrmPedidosDelivery.getObsDiversa(): string;
begin
  result := Self.ObsDiverso;
end;

procedure TfrmPedidosDelivery.adicionar_pagamento(cod_diverso: string; obs: string; cod_forma: string; descricao_forma: string; valor: string);
var
  q: TIBQuery;
  rp: string;
begin
  q := TIBQuery.Create(Self);
  q.Database := dm.dbrestaurante;
  q.Transaction := dm.transacao;
  q.Active := false;
  q.SQL.text := '';
  ;
  q.SQL.add('select rp from formas_pagamento where cod_forma=' + Quotedstr(cod_forma));
  q.Active := true;
  rp := q.fieldbyname('rp').value;
  q.Active := false;
  FreeAndNil(q);

  if not dmPedidoDelivery.tbFormasPagamentoTemp.Locate('codForma', cod_forma, []) then
  begin
    dmPedidoDelivery.tbFormasPagamentoTemp.Append;
    dmPedidoDelivery.tbFormasPagamentoTempcodForma.value := cod_forma;
    dmPedidoDelivery.tbFormasPagamentoTempdescricaoForma.value := descricao_forma;
    dmPedidoDelivery.tbFormasPagamentoTempvalorForma.value := StrToFloat(valor);
    dmPedidoDelivery.tbFormasPagamentoTemprp.value := rp;
    dmPedidoDelivery.tbFormasPagamentoTempcodCliFaturamento.value := cod_diverso;
    dmPedidoDelivery.tbFormasPagamentoTempobsFaturamento.value := obs;

    dmPedidoDelivery.tbFormasPagamentoTemp.Post;

  end
  else
  begin
    dmPedidoDelivery.tbFormasPagamentoTemp.Edit;
    dmPedidoDelivery.tbFormasPagamentoTempvalorForma.value := dmPedidoDelivery.tbFormasPagamentoTempvalorForma.value + StrToFloat(valor);
    dmPedidoDelivery.tbFormasPagamentoTemp.Post;
  end;

  // memo_cod_diversos_formas_pgto.Lines.Add(getCodDiverso);
  // memo_obs_diversas.Lines.Add(getObsDiversa);
  // setObsDiversa('');
  // setCodDiverso('');

  ed_total_pago.value := StrToFloat(valor) + ed_total_pago.value;
  // ed_valor_troco.Value:=ed_total_pago.Value-ed_total_conta.value;
  // edCodFormaPagamento .text := '';;
  // edDescFormaPagto.text := '';;
  edCodFormaPagamento.SetFocus;
  edValorForma.text := FormatFloat('#0.00', ed_total_conta.value - ed_total_pago.value);

end;

procedure TfrmPedidosDelivery.AdvGlassButton1Click(Sender: TObject);
begin
  inherited;
  edTelClienteDelivery.text := '';
  edNomeClienteConsulta.text := '';
  dmPedidoDelivery.tbCsClientesDelivery.Active := false;
  pgPedido.Show;
  edTelClienteDelivery.SetFocus;

end;

procedure TfrmPedidosDelivery.btAplicardescontoClick(Sender: TObject);
var
  qtdItens: Integer;
  descontoMaximo: double;
  LQryConsulta: TIBQuery;
  LTransacao: TIBTransaction;
  valorDescontoCalculado: double;
  tipoDesconto: smallint;
begin
  inherited;

  LTransacao := TIBTransaction.Create(nil);
  LTransacao.Params.add('read_committed');
  LTransacao.Params.add('rec_version');
  LTransacao.Params.add('nowait');

  LTransacao.DefaultDatabase := dm.dbrestaurante;
  LTransacao.Active := false;
  LTransacao.Active := true;

  LQryConsulta := TIBQuery.Create(Self);
  LQryConsulta.Database := dm.dbrestaurante;
  LQryConsulta.Transaction := LTransacao;
  LQryConsulta.Database := dm.dbrestaurante;
  LQryConsulta.Transaction := LTransacao;
  LQryConsulta.Active := false;
  LQryConsulta.SQL.Clear;

  try
    try
      LQryConsulta.SQL.add('select count(*) as ct  from movimento_mesa ms where ms.cod_mesa=' + Quotedstr(mesaDelivery));
      LQryConsulta.Active := true;
      LQryConsulta.FetchAll;
      qtdItens := LQryConsulta.fieldbyname('ct').value;
      descontoMaximo := ed_valor_bruto.value - 0.01;
      if (edValorDesconto.value < 0) then
      begin
        raise Exception.Create('Desconto não pode ser negativo!');

      end;

      if rdPercentual.Checked then
      begin
        tipoDesconto := 0;
        valorDescontoCalculado := RoundABNT(((ed_valor_bruto.value * edValorDesconto.value) / 100), 2);
      end
      else
      begin
        tipoDesconto := 1;
        valorDescontoCalculado := edValorDesconto.value;
      end;

      if valorDescontoCalculado > descontoMaximo then
      begin
        raise Exception.Create('Valor máximo de desconto para essa venda não pode ultrapassar ' + FormatFloat('R$ ###,###,##0.00 ', descontoMaximo));
      end;

      LQryConsulta.Active := false;
      LQryConsulta.SQL.Clear;
      LQryConsulta.SQL.add('execute procedure distribui_descontos(' + Quotedstr(mesaDelivery) + ',' + IntToStr(tipoDesconto) + ',' + dm.TrocaVirgPPto(FloatToStr(edValorDesconto.value)) + ')');

      LQryConsulta.ExecSQL;
      LTransacao.Commit;
      pgFormasPagto.Show;

      BuscaMovimento;
      calcula_valores(Self);
      edCodFormaPagamento.SetFocus;

    except
      on E: Exception do
      begin
        raise Exception.Create('Erro ao executar desconto! ' + E.Message);
        edValorDesconto.SetFocus;
        edValorDesconto.SelectAll;
      end;
    end;

  finally
    LQryConsulta.Active := false;
    FreeAndNil(LQryConsulta);
    FreeAndNil(LTransacao);
  end;
end;

procedure TfrmPedidosDelivery.calcula_valores(Sender: TObject);
begin

  if (ed_total_pago.value - ed_total_conta.value) > 0 then
    edTroco.value := ed_total_pago.value - ed_total_conta.value;

  if ed_total_pago.value < ed_total_conta.value then
    edValorForma.text := FormatFloat('#0.00', ed_total_conta.value - ed_total_pago.value)
  else
  begin
    edValorForma.text := '0,00';
  end;

end;

procedure TfrmPedidosDelivery.cbkEntregaClick(Sender: TObject);
begin
  inherited;

  if cbkEntrega.Checked = false then
    ed_total_tx_serv.value := getValorTxEntregaBairro(edCodbairro.text)
  else
  begin
    if (dm.verificaPermissaoAcao('B20003007', true, true) = true) then
    begin
      ed_total_tx_serv.value := 0;
    end
    else
    begin
      cbkEntrega.Checked := false;
      ed_total_tx_serv.value := getValorTxEntregaBairro(edCodbairro.text);
    end;
  end;

  BuscaMovimento;
  calcula_valores(Sender);
end;

procedure TfrmPedidosDelivery.cbkRetiraBalcaoClick(Sender: TObject);
begin
  inherited;

  if cbkRetiraBalcao.Checked then
  begin
    cbkEntrega.Enabled := false;
    cbkEntrega.Checked := true;
    ed_total_tx_serv.value := 0;
  end
  else
  begin
    cbkEntrega.Enabled := true;
    cbkEntrega.Checked := false;
    ed_total_tx_serv.value := getValorTxEntregaBairro(edCodbairro.text);
  end;

  BuscaMovimento;
  calcula_valores(Sender);

end;

procedure TfrmPedidosDelivery.gravarAlteracoesAntes(codAlteracao: string; codigoPedido: string; tipoAlteracao: smallint; ts: TIBTransaction);
var
  q: TIBQuery;
  Pagamentos: string;
begin

  q := TIBQuery.Create(Self);
  q.Database := dm.dbrestaurante;
  q.Transaction := ts;
  q.Active := false;

  try
    try
      dmPedidoDelivery.tbFormasPagamentoTemp.First;
      while not (dmPedidoDelivery.tbFormasPagamentoTemp.Eof) do
      begin
        Pagamentos := Pagamentos + dmPedidoDelivery.tbFormasPagamentoTempdescricaoForma.value + ': ' + FormatFloat('R$ ###,###,##0.00 ', dmPedidoDelivery.tbFormasPagamentoTempvalorForma.value) + ' ';

        dmPedidoDelivery.tbFormasPagamentoTemp.Next;
      end;

      q.SQL.text := '';
      ;
      q.SQL.add(' insert into PEDIDOS_DELIVERY_ALTERACAO (codigo, cod_pedido,cod_cliente,cod_caixa, ');
      q.SQL.add('  cod_usuario, cod_usuario_autorizou, valor_total,numero_caixa,tipo_alteracao,usuario_operador,usuario_autorizador,pagamentos ) values (');
      q.SQL.add('' + Quotedstr(codAlteracao) + ',');
      q.SQL.add('' + Quotedstr(codigoPedido) + ',');
      q.SQL.add('' + Quotedstr(edCodClienteDelivery.text) + ',');
      q.SQL.add('' + Quotedstr(ultimoCaixaAberto) + ',');
      q.SQL.add('' + Quotedstr(codigo_usuario) + ',');
      q.SQL.add('' + Quotedstr(codigo_usuario_responsavel) + ',');
      q.SQL.add('' + dm.TrocaVirgPPto(FloatToStr(ed_total_conta.value)) + ',');
      q.SQL.add('' + Quotedstr(numero_caixa) + ',');
      q.SQL.add('' + IntToStr(tipoAlteracao) + ',');
      q.SQL.add('' + Quotedstr(nome_usuario) + ',');
      q.SQL.add('' + Quotedstr(nome_usuario_responsavel) + ',');
      q.SQL.add('' + Quotedstr(Pagamentos) + ')');
      q.ExecSQL;

      if (tipoAlteracao = 1) then
      begin
        q.Active := false;
        q.SQL.text := '';
        ;
        q.SQL.add('  insert into it_ped_del_antes_alt (cod_alteracao,cod_produto,quantidade,valor_unitario) ');
        q.SQL.add('            select ' + Quotedstr(codAlteracao) + ',' + ' mv.cod_produto,mv.quantidade,mv.valor_unitario  ');
        q.SQL.add('                                       from movimento_mesa mv where mv.cod_mesa=' + Quotedstr(mesaDelivery));
        q.ExecSQL;
      end
      else
      begin
        q.SQL.text := '';
        ;
        q.SQL.add('  insert into it_ped_del_antes_alt (cod_alteracao,cod_produto,quantidade,valor_unitario) ');
        q.SQL.add('   select ' + Quotedstr(codAlteracao) + ',' + ' it.cod_produto, it.quantidade,it.valor_unitario ');
        q.SQL.add(' from itens_pedido_delivery  it where it.cod_pedido=' + Quotedstr(codigoPedido));
        q.ExecSQL;
      end;
    except

      ShowRealDialog(Self, tmErro, 'Erro', 'Erro ao gravar o log de alteração do pedido');
    end;
  finally
    q.Active := false;
    FreeAndNil(q);
  end;

end;

procedure TfrmPedidosDelivery.gravarAlteracoesPos(codAlteracao: string; codigoPedido: string; tipoAlteracao: smallint; ts: TIBTransaction);
var
  q: TIBQuery;
  MyClass: TComponent;
begin

  q := TIBQuery.Create(Self);
  q.Database := dm.dbrestaurante;
  q.Transaction := ts;
  q.Active := false;

  try
    try
      q.SQL.text := '';
      ;
      q.SQL.add('  insert into it_ped_del_pos_alt (cod_alteracao,cod_produto,quantidade,valor_unitario) ');
      q.SQL.add('   select ' + Quotedstr(codAlteracao) + ',' + ' it.cod_produto, it.quantidade,it.valor_unitario ');
      q.SQL.add(' from itens_pedido_delivery  it where it.cod_pedido=' + Quotedstr(codigoPedido));
      q.ExecSQL;
    except

      ShowRealDialog(Self, tmErro, 'Erro', 'Erro ao gravar log de alterações pós');
    end;
  finally
    q.Active := false;
    FreeAndNil(q);
  end;

end;

procedure TfrmPedidosDelivery.gravarInformacoes();
var
  codigoPedido: string;
  ts: TIBTransaction;
  q: TIBQuery;
  aprovarPedido: Boolean;
  statusPedido: smallint;
  alterado: smallint;
  retiraBalcao: smallint;
  IsentarEntrega: smallint;
  cobrarEntrega: smallint;
  via: smallint;
  codAlteracaoPedido: string;
  ThreadInclusao: TThread;
  ThreadExclusao: TThread;
  LValorCobrancaEntregador: Currency;
begin

  ts := TIBTransaction.Create(Self);
  ts.DefaultDatabase := dm.dbrestaurante;
  ts.Active := true;

  q := TIBQuery.Create(Self);
  q.Database := dm.dbrestaurante;
  q.Transaction := ts;
  q.Active := false;

  try
    LValorCobrancaEntregador := 0;
    try
      if cbkRetiraBalcao.Checked then
        retiraBalcao := 1
      else
        retiraBalcao := 0;

      if cbkEntrega.Checked then
      begin
        IsentarEntrega := 1;
      end
      else
      begin
        IsentarEntrega := 0;
      end;

      if (evento = 1) then
      begin
        codigoPedido := dm.geraCodigo('G_PEDIDOS_DELIVERY', 8);
        alterado := 0;
      end
      else
      begin
        codigoPedido := edTelClienteDelivery.text;
        alterado := 1;
      end;

      codAlteracaoPedido := dm.geraCodigo('G_ALT_PEDIDOS_DELIVERY', 10);
      gravarAlteracoesAntes(codAlteracaoPedido, codigoPedido, evento, ts);

      if ckbPedidoCobradoEntregador.checked then
      begin
        if (Assigned(PedidoPlataformaSelecionado) and (PedidoPlataformaSelecionado.ValorPagamentoPendente > 0)) then
          LValorCobrancaEntregador := PedidoPlataformaSelecionado.ValorPagamentoPendente
        else
          LValorCobrancaEntregador := ed_total_conta.Value;

        LMensagemAtencaoEntregador := 'COBRAR DO CLIENTE' + sLineBreak + ' O  VALOR DE ' + sLineBreak;
        LMensagemAtencaoEntregador := LMensagemAtencaoEntregador + ' ' + CurrToStr(LValorCobrancaEntregador);
      end;

      if evento <> 3 then
      begin
        // apagarPedido(codigoPedido, ts);
        statusPedido := 1;
        gravaDadosDoPedido(codigoPedido, statusPedido, retiraBalcao, IsentarEntrega, alterado, ts);
        gravaItensDoPedido(codigoPedido, ts);
        gravaSaboresPizzaPedido(codigoPedido, ts);
        gravarPagamentos(codigoPedido, ts);
        gravarAlteracoesPos(codAlteracaoPedido, codigoPedido, evento, ts);
        ts.Commit;

        ThreadInclusao := TThread.CreateAnonymousThread(
          procedure()
          begin
            try
              dm.imprimeComprovanteDelivery(codigoPedido, evento, LMensagemAtencaoEntregador);
              if (alterouProdutos) then
              begin
                /// /dm.adicionalog('Vai chamar a função de impressão dos pedidos');
                dm.imprimePedidoDeliveryNaProducao(codigoPedido, evento);
              end;
              dm.LimpaInformacoesDaMesa(mesaDelivery, numero_caixa);
              q.Active := false;
              FreeAndNil(q);
              ts.Active := false;
              FreeAndNil(ts);
            finally

            end;

          end);

        ThreadInclusao.FreeOnTerminate := true;
        ThreadInclusao.OnTerminate := finalizaThreads;
        ThreadInclusao.Start;
      end
      else
      begin
        ThreadExclusao := TThread.CreateAnonymousThread(
          procedure()
          begin
            try
              gravarAlteracoesPos(codAlteracaoPedido, codigoPedido, evento, ts);
              dm.imprimeComprovanteDelivery(codigoPedido, evento, LMensagemAtencaoEntregador);
              dm.imprimePedidoDeliveryNaProducao(codigoPedido, evento);
              apagarPedido(codigoPedido, ts);
              ts.Commit;
              dm.LimpaInformacoesDaMesa(mesaDelivery, numero_caixa);
              q.Active := false;
              FreeAndNil(q);
              ts.Active := false;
              FreeAndNil(ts);

            finally

            end;
          end);
        ThreadExclusao.FreeOnTerminate := true;
        ThreadExclusao.OnTerminate := finalizaThreads;
        ThreadExclusao.Start;
      end;
    except

      ShowRealDialog(Self, tmErro, 'Erro', 'Erro ao gravar o pedido!');

      ts.Rollback;
      exit;
    end;
  finally
  end;
end;

procedure TfrmPedidosDelivery.finalizaThreads(Sender: TObject);
begin
  case evento of
    1:
      begin

        ShowRealDialog(Self, tmSucesso, 'Pedido incluído', 'O pedido foi incluído com sucesso!');
        if Assigned(PedidoPlataformaSelecionado) then
          confirmaIntegracaoPedidoPlataforma(PedidoPlataformaSelecionado);
      end;

    2:
      begin
        ShowRealDialog(Self, tmSucesso, 'Pedido alterado', 'O pedido foi alterado com sucesso!');

      end;

    3:
      begin
        ShowRealDialog(Self, tmSucesso, 'Pedido excluído', 'O pedido foi excluído com sucesso!');
      end;
  end;

  close();

end;

procedure TfrmPedidosDelivery.confirmaIntegracaoPedidoPlataforma(APedido: TPedidoPlataforma);
begin
  try
    APedido.StatusIntegracaoAtual := 1;
    dm.executaSQL('update integracoes_pedidos p set p.status_integracao_sistema=1 where p.id =' + IntToStr(APedido.idPedido));
  finally

  end;
end;

procedure TfrmPedidosDelivery.gravaSaboresPizzaPedido(AcodigoPedido: string; LTransacao: TIBTransaction);
var
  q: TIBQuery;
begin
  q := TIBQuery.Create(Self);
  q.Database := dm.dbrestaurante;
  q.Transaction := LTransacao;

  try
    try
      q.SQL.Clear;
      q.SQL.add('delete from sabores_pizza_pedido_delivery sb where sb.cod_pedido=' + Quotedstr(AcodigoPedido));
      q.ExecSQL;

      q.Active := false;
      q.SQL.text := '';
      ;
      q.SQL.add('       insert into sabores_pizza_pedido_delivery  (id,cod_pedido, cod_mesa,cod_produto, cod_sabor, valor_unitario_sabor,  ');
      q.SQL.add('          quantidade,id_mov_mesa,proporcao,descricao,desconto)');
      q.SQL.add('           select id,' + Quotedstr(AcodigoPedido) + ',sb.cod_mesa, sb.cod_produto, sb.cod_sabor, sb.valor_unitario_sabor, sb.quantidade,sb.id_mov_mesa,');
      q.SQL.add('                          sb.proporcao,sb.descricao,sb.desconto');
      q.SQL.add('             from sabores_pizza_movimento_mesa  sb');
      q.SQL.add('                    where  sb.cod_mesa=' + Quotedstr(mesaDelivery) + ' ');
      /// /dm.adicionalog('Insere sabores de pizza :' + q.SQL.Text);
      q.ExecSQL;
    except
      on E: Exception do
      begin

        ShowRealDialog(Self, tmErro, 'Erro', 'Erro ao gravar sabores das pizzas do Pedido ' + sLineBreak + sLineBreak + E.Message);
        /// /dm.adicionalog('Erro ao gravar os sabores. '+E.Message);
        raise Exception.Create('Erro ao gravar os sabores!');
      end;

    end;
  finally
    q.Active := false;
    FreeAndNil(q);
  end;
end;

procedure TfrmPedidosDelivery.gridConsultaClientesDBTableView1CellDblClick(Sender: TcxCustomGridTableView; ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton; AShift: TShiftState; var AHandled: Boolean);
begin
  inherited;
  selecionaCliente();

end;

procedure TfrmPedidosDelivery.gridConsultaClientesDBTableView1CustomDrawCell(Sender: TcxCustomGridTableView; ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
begin
  inherited;
  if AViewInfo.GridRecord.Selected then
  begin
    ACanvas.Brush.Color := 12615680;
    ACanvas.Font.Color := clWhite;
  end;
end;

procedure TfrmPedidosDelivery.selecionaCliente();
begin
  if (dmPedidoDelivery.tbCsClientesDelivery.IsEmpty = false) then
  begin
    edTelClienteDelivery.text := dmPedidoDelivery.tbCsClientesDelivery.fieldbyname('telefone').value;
    // retornaDadosClienteDelivery('',dmPedidoDelivery.tbCsClientesDelivery.FieldByName('codigo').Value);
    dmPedidoDelivery.tbCsClientesDelivery.Active := false;
    edNomeClienteConsulta.text := '';
    pgPedido.Show;
    edTelClienteDelivery.SetFocus;
    // edCodBarrasProduto.SetFocus;
  end;

end;

procedure TfrmPedidosDelivery.gridConsultaClientesDBTableView1KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  inherited;
  if Key = VK_RETURN then
  begin
    selecionaCliente();
  end;
end;

procedure TfrmPedidosDelivery.gravaItensDoPedido(AcodigoPedido: string; LTransacao: TIBTransaction);
var
  q: TIBQuery;
begin
  q := TIBQuery.Create(Self);
  q.Database := dm.dbrestaurante;
  q.Transaction := LTransacao;

  try
    try

      q.Active := false;
      q.SQL.Clear;
      q.SQL.add('delete from itens_pedido_delivery it where it.cod_pedido=' + Quotedstr(AcodigoPedido));
      q.ExecSQL;

      q.Active := false;
      q.SQL.Clear;
      q.SQL.add(' insert into itens_pedido_delivery  (cod_pedido,cod_produto,cod_garcon,numero_caixa,');
      q.SQL.add('                                       quantidade, total, cod_usuario, hora_lancamento,');
      q.SQL.add('                                       hora_entrega, estado, desconto, valor_unitario, obs, id,impresso,observacoes,sabores,tipo_massa,tabela_preco,produto_principal)');
      q.SQL.add('            select ' + Quotedstr(AcodigoPedido) + ',mv.cod_produto,mv.cod_garcon,mv.numero_caixa,');
      q.SQL.add('                                      mv.quantidade, mv.total, mv.cod_usuario, mv.hora_lancamento,');
      q.SQL.add('                                       mv.hora_entrega, mv.estado, mv.desconto, mv.valor_unitario, mv.obs,mv.id,mv.impresso,mv.observacoes,mv.sabores,tipo_massa,tabela_preco,produto_principal');
      q.SQL.add('                                       from movimento_mesa mv where mv.cod_mesa=' + Quotedstr(mesaDelivery));
      dm.adicionalog('Insere ítens do pedido :' + q.SQL.Text);
      q.ExecSQL;

    except
      on E: Exception do
      begin
        ShowRealDialog(Self, tmErro, 'Erro', 'Erro ao gravar ítens do pedido!');
        dm.adicionaLog('Erro ao gravar ítens do pedido' + sLineBreak + E.Message);
      end;

    end;
  finally
    q.Active := false;
    FreeAndNil(q);
  end;
end;

procedure TfrmPedidosDelivery.gravaDadosDoPedido(AcodigoPedido: string; AStatusPedido, ARetiraBalcao, AIsentarEntrega, AAlterado: Integer; ts: TIBTransaction);
var
  q: TIBQuery;
begin
  q := TIBQuery.Create(Self);
  q.Database := dm.dbrestaurante;
  q.Transaction := ts;

  try
    try
      q.SQL.add('update or insert into pedidos_delivery (  CODIGO,COD_EMPRESA,COD_CLIENTE,DATA,DATA_HORA_ENTREGA,VALOR_BRUTO,VALOR_DESCONTO,VALOR_ENTREGA,');
      q.SQL.add('VALOR_TOTAL,TOTAL_PAGO,VALOR_TROCO,COD_USUARIO,NUMERO_CAIXA,COD_CAIXA,status,alterado,retira_balcao,isentar_entrega,cpf_nota,nome_nota, tabela_preco,ID_PEDIDO_INTEGRACAO )  values (');
      q.SQL.add('' + Quotedstr(AcodigoPedido) + ',');
      q.SQL.add('' + Quotedstr(codEmpresa) + ',');
      q.SQL.add('' + Quotedstr(edCodClienteDelivery.text) + ',');
      q.SQL.add('' + Quotedstr(FormatDateTime('DD.MM.YYY', data_do_sistema)) + ',');
      q.SQL.add('' + Quotedstr(FormatDateTime('DD.MM.YYY', edDataEntrega.Date) + ' ' + FormatDateTime('HH:MM', edHoraEntrega.time)) + ',');
      q.SQL.add('' + dm.TrocaVirgPPto(FloatToStr(ed_valor_bruto.value)) + ',');
      q.SQL.add('' + dm.TrocaVirgPPto(FloatToStr(edTotalDescontos.value)) + ',');
      q.SQL.add('' + dm.TrocaVirgPPto(FloatToStr(ed_total_tx_serv.value)) + ',');
      q.SQL.add('' + dm.TrocaVirgPPto(FloatToStr(ed_total_conta.value)) + ',');
      q.SQL.add('' + dm.TrocaVirgPPto(FloatToStr(ed_total_pago.value)) + ',');
      q.SQL.add('' + dm.TrocaVirgPPto(FloatToStr(ed_total_pago.value - ed_total_conta.value)) + ',');
      q.SQL.add('' + Quotedstr(codigo_usuario) + ',');
      q.SQL.add('' + Quotedstr(numero_caixa) + ',');
      q.SQL.add('' + Quotedstr(ultimoCaixaAberto) + ',' + IntToStr(AStatusPedido) + ',' + IntToStr(AAlterado) + ',' + IntToStr(ARetiraBalcao) + ',' + IntToStr(AIsentarEntrega) + ',');
      q.SQL.add('' + Quotedstr(edCpf.text) + ',');
      q.SQL.add('' + Quotedstr(edNomeClienteNota.text) + ',');
      q.SQL.add(IntToStr(dm.getTabelaPrecoAtual.codigo) + ',');
      q.SQL.add(IntToStr(idPedidoIntegracao) + ')');
      q.ExecSQL;

    except
      ShowRealDialog(Self, tmErro, 'Erro', 'Você não tem permissão para acessar esta funcionalidade');
    end;
  finally
    q.Active := false;
    FreeAndNil(q);
  end;

end;

function TfrmPedidosDelivery.verificaPossibilidadeDeTroco(troco: double): Boolean;
var
  linhas, linhaAtual: Integer;
  totalFormasPermitidas: double;
begin
  totalFormasPermitidas := 0;
  dmPedidoDelivery.tbFormasPagamentoTemp.First;
  while not (dmPedidoDelivery.tbFormasPagamentoTemp.Eof) do
  begin
    if (getPermissaoDeTroco(dmPedidoDelivery.tbFormasPagamentoTempcodForma.value) = true) then
      totalFormasPermitidas := totalFormasPermitidas + dmPedidoDelivery.tbFormasPagamentoTempvalorForma.value;
    dmPedidoDelivery.tbFormasPagamentoTemp.Next;
  end;

  if ((totalFormasPermitidas - troco) >= 0) then
    result := true
  else
    result := false;
end;

function TfrmPedidosDelivery.verificaValidadeEncerramento(): Boolean;
begin

  if evento = 1 then
  begin
    if (verificaExistenciaClienteDeliveryPorTelefone(edTelClienteDelivery.text) = false) then
    begin

      ShowRealDialog(Self, tmErro, 'Erro', 'Cliente inexistente');
      edTelClienteDelivery.SetFocus;
      result := false;
      exit;
    end;
  end;

  dm.qryauxiliar.Active := false;
  dm.qryauxiliar.SQL.text := '';
  ;
  dm.qryauxiliar.SQL.add('select mv.cod_mesa');
  dm.qryauxiliar.SQL.add('  from movimento_mesa mv ');
  dm.qryauxiliar.SQL.add('  where mv.cod_mesa=' + Quotedstr(mesaDelivery));
  dm.qryauxiliar.Active := true;

  if dm.qryauxiliar.IsEmpty then
  begin
    dm.exibe_painel_erro('Nenhum produto registrado!', 'Tecle enter para continuar...');
    // edCodBarrasProduto.SetFocus;
    result := false;
    exit;
  end;

  if evento = 2 then
  begin
    if (verificaExistenciaPedidoDelivery(edTelClienteDelivery.text) = false) then
    begin
      dm.exibe_painel_erro('Pedido inexistente!', 'Tecle enter para continuar...');
      edTelClienteDelivery.SetFocus;
      result := false;
      exit;
    end;
  end;

  if (ed_total_conta.value < 0) then
  begin
    dm.exibe_painel_erro('Não é possível cadastrar um pedido com preço ZERO!', 'Tecle enter para continuar...');
    edCodProduto.SetFocus;
    result := false;
    exit;
  end;

  if (dmPedidoDelivery.tbFormasPagamentoTemp.IsEmpty) then
  begin
    dm.exibe_painel_erro('Nenhuma forma de pagamento foi informada!', 'Tecle enter para continuar...');
    result := false;
    exit;
  end;

  if ed_total_pago.value < ed_total_conta.value then
  begin
    dm.exibe_painel_erro('Valor pago é inferior ao total da conta', 'Tecle enter para continuar...');
    calcula_valores(ed_total_conta);
    edCodFormaPagamento.SetFocus;
    result := false;
    exit;
  end;

  if (verificaPossibilidadeDeTroco((ed_total_pago.value - ed_total_conta.value)) = false) then
  begin

    dm.exibe_painel_erro('O encerramento não pode ser efetuado pois não há valor suficiente para o troco da venda nas formas de pagamento especificadas (O REPIQUE NÃO É PERMITIDO)!', 'OK');
    result := false;
    exit;
  end;

  if (edValorDesconto.value < 0) then
  begin
    ShowMessage('Valor do desconto é inválido!');
    edValorDesconto.value := 0;
    result := false;
    exit;
  end;

  if (ed_valor_bruto.value - edTotalDescontos.value) <= 0 then
  begin
    ShowMessage('Valor do desconto não pode ser superior ao valor bruto do pedido!');
    result := false;
    exit;
  end;

  if Trim(edCpf.text) <> '' then
  begin
    if validarCPFCliente() = false then
    begin
      result := false;
      exit;
    end;
  end;

  if (evento <> 3) then
  begin
    try

      if (StrToDateTime(FormatDateTime('DD/MM/YYY', edDataEntrega.Date)) < Date) then
      begin
        raise Exception.Create('EDataAgendamentoInvalida');
      end;
    except
      on E: Exception do
      begin
        dm.exibe_painel_erro('Data do agendamento não pode ser retroativa (menor que a data/hora atual)', 'Ok');
        // pgAgendamento.Show;
        result := false;
      end;
    end;
  end;

  result := true;
end;

procedure TfrmPedidosDelivery.gravarPagamentos(codigoPedido: string; ATransacao: TIBTransaction);
var
  valor_recebido: double;
  q: TIBQuery;
begin

  q := TIBQuery.Create(Self);
  q.Database := dm.dbrestaurante;
  q.Transaction := ATransacao;
  q.Active := false;

  try
    q.Active := false;
    q.SQL.Clear;
    q.SQL.add(' delete from recebimentos_delivery where cod_pedido=' + Quotedstr(codigoPedido));
    q.ExecSQL;
    q.Active := false;
    q.SQL.Clear;

    dmPedidoDelivery.tbFormasPagamentoTemp.First;
    while not dmPedidoDelivery.tbFormasPagamentoTemp.Eof do
    begin
      valor_recebido := 0;
      valor_recebido := dmPedidoDelivery.tbFormasPagamentoTempvalorForma.value;

      q.Active := false;
      q.SQL.text := '';
      ;
      q.SQL.add('insert into recebimentos_delivery (cod_pedido,cod_forma,valor,data,cod_usuario,numero_caixa,processado, ');
      q.SQL.add('cod_caixa,operadoracartao,numerocartao,validadecartao,codigocartao,cod_cli_faturamento, obs_faturamento) values (');
      q.SQL.add('' + Quotedstr(codigoPedido) + ',');
      q.SQL.add('' + Quotedstr(dmPedidoDelivery.tbFormasPagamentoTempcodForma.value) + ',');
      q.SQL.add('' + dm.TrocaVirgPPto(FloatToStr(valor_recebido)) + ',');
      q.SQL.add('' + Quotedstr(FormatDateTime('DD.MM.YYY', data_do_sistema)) + ',');
      q.SQL.add('' + Quotedstr(getCodOperadorCaixa(ultimoCaixaAberto)) + ',');
      q.SQL.add('' + Quotedstr(numero_caixa) + ',0,');
      q.SQL.add('' + Quotedstr(ultimoCaixaAberto) + ',');
      q.SQL.add('' + Quotedstr(dmPedidoDelivery.tbFormasPagamentoTempoperadoraCartao.value) + ',');
      q.SQL.add('' + Quotedstr(dmPedidoDelivery.tbFormasPagamentoTempnumeroCartao.value) + ',');
      q.SQL.add('' + Quotedstr(dmPedidoDelivery.tbFormasPagamentoTempvalidadeCartao.value) + ',');
      q.SQL.add('' + Quotedstr(dmPedidoDelivery.tbFormasPagamentoTempcodigoCartao.value) + ',');
      q.SQL.add('' + Quotedstr(dmPedidoDelivery.tbFormasPagamentoTempcodCliFaturamento.value) + ',');
      q.SQL.add('' + Quotedstr(dmPedidoDelivery.tbFormasPagamentoTempobsFaturamento.value) + ')');

      try
        begin
          /// /dm.adicionalog('Grava forma de pagamento do pedido ' + codigoPedido);
          /// ///dm.adicionalog(q.SQL.Text);
          q.ExecSQL;
        end;

      except
        begin
          ShowMessage('Ocorreu um erro no sistema!  Um log de erros foi criado no formato DATA+HORA na pasta logs do Sistema. Abra o arquivo e envio por fax ou email para a Real Systems');
          dm.cria_log_de_erros(q.SQL, 'Módulo de caixa', 'Erro ao gravar forma de pagamento', codigo_usuario);
          exit;
        end;
      end;
      dmPedidoDelivery.tbFormasPagamentoTemp.Next;
    end;
  finally
    q.Active := false;
    FreeAndNil(q);

  end;

end;

procedure TfrmPedidosDelivery.Image3MouseEnter(Sender: TObject);
var
  ct: Integer;
  pt: Tcontrol;
begin
  inherited;

  if not (Sender is TPanel) then
  begin
    pt := (Sender as Tcontrol).Parent;
  end
  else
  begin
    pt := (Sender as Tcontrol);
  end;

  (pt as TPanel).Color := clSkyBlue;

end;

procedure TfrmPedidosDelivery.Image3MouseLeave(Sender: TObject);
var
  ct: Integer;
  pt: Tcontrol;
  data: TDate;
begin
  inherited;

  if not (Sender is TPanel) then
  begin
    pt := (Sender as Tcontrol).Parent;
  end
  else
  begin
    pt := (Sender as Tcontrol);
  end;

  (pt as TPanel).Color := clWhite;

end;

procedure TfrmPedidosDelivery.Image1Click(Sender: TObject);
var
  LObs: TObsClienteDelivery;
begin
  inherited;
  {
    LObs := TObsClienteDelivery.Create;
    LObs.codCliente := edCodClienteDelivery.Text;
    LObs.observacao := edNovaObservacao.Text;
    LObs.alertaPedidos := ckbAlertaPedidos.Checked;
    LObs.imprimirNaProducao := ckbImprimeProducao.Checked;

    try
    LObs.cadastrar;
    edNovaObservacao.text := '';
    ckbAlertaPedidos.Checked := false;
    ckbImprimeProducao.Checked := false;
    ShowMessage('Observação cadastrada com sucesso!');
    finally
    FreeAndNil(LObs);
    end;

    atualizaListaObservacoesCliente(edCodClienteDelivery.Text);
  }
end;

procedure TfrmPedidosDelivery.apagarPedido(codPedido: string; ts: TIBTransaction);
var
  codigoPedido: string;
var
  q: TIBQuery;
begin

  q := TIBQuery.Create(nil);
  q.Database := dm.dbrestaurante;
  q.Transaction := ts;

  try
    try

      q.Active := false;
      q.SQL.Clear;
      q.SQL.add('delete from pedidos_delivery where codigo=' + Quotedstr(codPedido));
      q.ExecSQL;

      q.SQL.Clear;
      q.SQL.add('delete from itens_pedido_delivery where cod_pedido=' + Quotedstr(codPedido));
      q.ExecSQL;

      q.SQL.Clear;
      q.SQL.add('delete from recebimentos_delivery where cod_pedido=' + Quotedstr(codPedido));
      q.ExecSQL;

      q.SQL.Clear;
      q.SQL.add(' delete from sabores_pizza_pedido_delivery sb where sb.cod_pedido =' + Quotedstr(codPedido));
      q.ExecSQL;

    except
      on E: Exception do
      begin
        dm.exibe_painel_erro('Erro ao apagar pedido! ' + E.Message, 'Ok');
        /// /dm.adicionalog(E.Message);
      end;
    end;

  finally
    q.Active := false;
    FreeAndNil(q);
  end;

end;

procedure TfrmPedidosDelivery.retornaDadosDoPedido(ACodPedido: string);
begin
  try
    try

      dm.LimpaInformacoesDaMesa(mesaDelivery, numero_caixa);
      dm.ApagarItensDoPedidoDoMovimento(ACodPedido);

      retornaInformacoesPedido(ACodPedido);
      retornaItensDoPedido(ACodPedido);
      BuscaMovimento;
      retornaFormasDePagamentoDoPedido(ACodPedido);

      desbloqueiaPaineis;

      if (evento = 2) then
      begin
        desbloqueiaPaineis;
        // edCodBarrasProduto.setfocus;
      end
      else
      begin
        bloqueiaPaineis;
        // btGravar.SetFocus;
      end;

      if ((evento = 2) or (evento = 3)) then
      begin
        if (verificaStatusPedidoDelivery(ACodPedido) = 3) then
        begin
          dm.exibe_painel_erro('Este pedido não pode ser alterado e nem excluído, pois já foi recebido!', 'enter para continuar...');
          bloqueiaPaineis;
          btGravar.Enabled := false;
        end;
      end;
    except
      on E: Exception do
      begin
        dm.exibe_painel_erro(E.Message, 'Ok');
      end;
    end;

  finally

  end;

end;

procedure TfrmPedidosDelivery.retornaFormasDePagamentoDoPedido(ACodPedido: string);
var
  q: TIBQuery;
  ts: TIBTransaction;
  valor: string;
begin

  ts := TIBTransaction.Create(nil);
  ts.Params.add('read_committed');
  ts.Params.add('rec_version');
  ts.Params.add('nowait');
  ts.DefaultDatabase := dm.dbrestaurante;
  ts.Active := false;
  ts.Active := true;

  q := TIBQuery.Create(Self);
  q.Database := dm.dbrestaurante;
  q.Transaction := ts;

  try
    try

      dmPedidoDelivery.tbFormasPagamentoTemp.Active := false;
      dmPedidoDelivery.tbFormasPagamentoTemp.Active := true;
      q.Active := false;
      q.SQL.text := '';
      ;
      q.SQL.add('select r.*,f.descricao from recebimentos_delivery r ');
      q.SQL.add(' inner join formas_pagamento f on (f.cod_forma = r.cod_forma)');
      q.SQL.add('where r.cod_pedido=' + Quotedstr(ACodPedido));
      q.SQL.add(' order by r.cod_forma');
      q.Active := true;
      q.First;

      while not q.Eof do
      begin
        setCodDiverso(q.fieldbyname('cod_cli_faturamento').value);
        setObsDiversa(q.fieldbyname('obs_faturamento').value);

        valor := FormatFloat('#0.00', q.fieldbyname('valor').value);
        registraFormaPagto(q.fieldbyname('cod_forma').value, q.fieldbyname('descricao').value, valor);
        calcula_valores(ed_total_conta);
        q.Next;
      end;
    except
      dm.exibe_painel_erro('Erro ao retornar formas de pagametno do pedido!', 'Ok');
      ts.Rollback;
    end;
  finally
    q.Active := false;
    FreeAndNil(q);

    ts.Active := false;
    FreeAndNil(ts);
  end;

end;

procedure TfrmPedidosDelivery.retornaItensDoPedido(ACodPedido: string);
var
  q: TIBQuery;
  ts: TIBTransaction;
begin

  ts := TIBTransaction.Create(nil);
  ts.Params.add('read_committed');
  ts.Params.add('rec_version');
  ts.Params.add('nowait');
  ts.DefaultDatabase := dm.dbrestaurante;

  q := TIBQuery.Create(Self);
  q.Database := dm.dbrestaurante;
  q.Transaction := ts;

  try
    dm.LimpaInformacoesDaMesa(mesaDelivery, numero_caixa);
    ts.Active := false;
    ts.Active := true;
    q.Active := false;
    q.SQL.text := '';

    q.SQL.add(' insert into movimento_mesa  (cod_mesa,cod_produto,cod_garcon,cod_movimento,numero_caixa,');
    q.SQL.add('                                       quantidade, total, cod_usuario, hora_lancamento,');
    q.SQL.add('                                       hora_entrega, estado, desconto, valor_unitario, obs, id,impresso,observacoes,sabores,tipo_massa,tabela_preco)');
    q.SQL.add('            select ' + Quotedstr(mesaDelivery) + ',mv.cod_produto,mv.cod_garcon,mv.cod_movimento,mv.numero_caixa, ');
    q.SQL.add('                                      mv.quantidade, mv.total, mv.cod_usuario, mv.hora_lancamento,');
    q.SQL.add('                                       mv.hora_entrega, mv.estado, mv.desconto, mv.valor_unitario, mv.obs,mv.id,mv.impresso,mv.observacoes,mv.sabores,tipo_massa,tabela_preco');
    q.SQL.add('                                       from itens_pedido_delivery mv where mv.cod_pedido=' + Quotedstr(ACodPedido));

    try
      begin
        /// ///dm.adicionalog(q.SQL.Text);
        q.ExecSQL;
        ts.Commit;

        retornaSaboresPizzaSelecionados(ACodPedido);
      end;
    except
      on E: Exception do
      begin
        dm.exibe_painel_erro('Erro ao  gravar itens do pedido do delivery na tabela de movimento' + sLineBreak + sLineBreak + E.Message, 'Ok');
        ts.Rollback;
      end;

    end

  finally
    q.Active := false;
    FreeAndNil(q);

    ts.Active := false;
    FreeAndNil(ts);
  end;
end;

procedure TfrmPedidosDelivery.retornaSaboresPizzaSelecionados(ACodPedido: string);
var
  q: TIBQuery;
  ts: TIBTransaction;
begin
  ts := TIBTransaction.Create(nil);
  ts.Params.add('read_committed');
  ts.Params.add('rec_version');
  ts.Params.add('nowait');
  ts.DefaultDatabase := dm.dbrestaurante;
  ts.Active := false;
  ts.Active := true;

  q := TIBQuery.Create(Self);
  q.Database := dm.dbrestaurante;
  q.Transaction := ts;

  try
    try
      begin
        q.Active := false;
        q.SQL.Clear;
        q.SQL.add('insert into sabores_pizza_movimento_mesa ');
        q.SQL.add('          (ID,cod_mesa, cod_produto, cod_sabor, valor_unitario_sabor, quantidade,id_mov_mesa,');
        q.SQL.add('                          proporcao,descricao,desconto)');
        q.SQL.add('  select sp.id,' + Quotedstr(mesaDelivery) + ',sp.cod_produto, sp.cod_sabor, sp.valor_unitario_sabor, sp.quantidade,sp.id_mov_mesa,');
        q.SQL.add('                          sp.proporcao,sp.descricao,sp.desconto');
        q.SQL.add('             from sabores_pizza_pedido_delivery   sp');
        q.SQL.add('                    where  sp.cod_pedido=' + Quotedstr(ACodPedido));
        q.ExecSQL;
        ts.Commit;

      end;
    except
      /// ///dm.adicionalog(q.SQL.Text);
      dm.cria_log_de_erros(q.SQL, 'Caixa - Restaurante ', 'Erro ao  gravar sabores da pizza do pedido do delivery ', codigo_usuario);
      dm.exibe_painel_erro('Erro ao  gravar sabores da pizza do pedido do delivery ', 'Ok');
      ts.Rollback;
    end;
  finally
    q.Active := false;
    FreeAndNil(q);

    ts.Active := false;
    FreeAndNil(ts);
  end;

end;

procedure TfrmPedidosDelivery.btNovoKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  inherited;
  if Key = vk_escape then
    btSair.Click;
end;

procedure TfrmPedidosDelivery.btObsProdutoClick(Sender: TObject);
var
  idProduto: Integer;
begin
  inherited;
  dm.qryMovimentoMesa.Active := true;
  dm.qryMovimentoMesa.Locate('id', VarArrayOf([TImage(Sender).Tag]), [loCaseInsensitive]);
  idProduto := TImage(Sender).Tag;
  strObsProduto := '';
  Application.createForm(Tfrm_obs_lancamento_caixa, frm_obs_lancamento_caixa);
  frm_obs_lancamento_caixa.memo_obs_complementar.text := '';
  ;
  frm_obs_lancamento_caixa.memo_obs_complementar.Lines.add(dm.qryMovimentoMesa.fieldbyname('observacoes').value);
  frm_obs_lancamento_caixa.ShowModal;
  frm_obs_lancamento_caixa.free;
  dm.atualizaObservacoesProduto(idProduto, strObsProduto);
  // atualizaMovimento;
  calcula_valores(Sender);

  strObsProduto := '';
end;

procedure TfrmPedidosDelivery.btPesqClienteClick(Sender: TObject);
begin
  inherited;
  if evento = 1 then
  begin
    begin
      edTelClienteDelivery.text := '';
      pgConsultaCliente.Show;
      edNomeClienteConsulta.SetFocus;
    end;

    if (Trim(edTelClienteDelivery.text) <> '') then
      Edit1Exit(edTelClienteDelivery);

  end;
end;

procedure TfrmPedidosDelivery.DBGrid4DrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  inherited;
  {
    if qUltimosPedidos.RecNo mod 2 = 1 then
    DBGrid4.Canvas.Brush.Color := clBlue
    else
    DBGrid4.Canvas.Brush.Color := clWhite;

    DBGrid4.DefaultDrawColumnCell(Rect, DataCol, Column, State); }

  TDBGrid(Sender).Canvas.Font.Color := clBlack;
  TDBGrid(Sender).DefaultDrawDataCell(Rect, TDBGrid(Sender).columns[DataCol].Field, State);
  {
    if gdSelected in State then
    with (Sender as TDBGrid).Canvas do
    begin
    Brush.Color := clmoneygreen;
    FillRect(Rect);
    Font.Style := [fsbold]
    end;
  }

end;

procedure TfrmPedidosDelivery.DBGrid2CellClick(Column: TColumn);
begin
  inherited;
  dmPedidoDelivery.buscaItensDoPedidoDelivery();
end;

procedure TfrmPedidosDelivery.DBGrid2DrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  inherited;
  {
    if odd(dm.QryUltimosPedidosDelivery.RecNo) then
    DBGrid2.Canvas.Brush.Color:= clWhite
    else
    DBGrid2.Canvas.Brush.Color:= $00EBC4A4;

    TDbGrid(Sender).Canvas.font.Color:= clBlack;

    if gdSelected in State then
    with (Sender as TDBGrid).Canvas do
    begin
    Brush.Color := clmoneygreen;
    FillRect(Rect);
    Font.Style := [fsbold]
    end;

    TDbGrid(Sender).DefaultDrawDataCell(Rect, TDbGrid(Sender).columns[datacol].field, State);
  }
end;

procedure TfrmPedidosDelivery.DBCtrlGrid1Click(Sender: TObject);
begin
  inherited;
  //dm.setTabelaPrecoAtual(dmPedidoDelivery.tbTabelaDePrecos.fieldbyname('CODIGO').value);

end;

procedure TfrmPedidosDelivery.AtualizaValoresPorTabelaPreco(ATabela: Integer);
begin
  AtualizaLabelsTabelaPreco();
  dm.modificaTabelaDePrecoItensLancados(mesaDelivery, ATabela);
  dm.AtualizaPrecosSaboresPizzaTabelaPrecos(mesaDelivery, ATabela);
  BuscaMovimento;
  calcula_valores(Self);
  pgFormasPagto.Show;
  edCodBarrasProduto.SetFocus;
end;

procedure TfrmPedidosDelivery.DBCtrlGrid1PaintPanel(DBCtrlGrid: TDBCtrlGrid; Index: Integer);
begin
  inherited;
  DBCtrlGrid1.Canvas.TextOut(2, 0, IntToStr(dmPedidoDelivery.tbTabelaDePrecos.fieldbyname('CODIGO').value));
  DBCtrlGrid1.Canvas.Font.Size := 18;
  DBCtrlGrid1.Canvas.TextOut(0, 30, PadCenter(dmPedidoDelivery.tbTabelaDePrecos.fieldbyname('descricao').value, 60, ' '));
end;

procedure TfrmPedidosDelivery.memoObsItemExit(Sender: TObject);
begin
  inherited;
  dm.atualizaObservacoesProduto((Sender as TMemo).Tag, (Sender as TMemo).Lines.text);
  BuscaMovimento;
  calcula_valores(Sender);
  strObsProduto := '';
  alterouProdutos := true;

end;

procedure TfrmPedidosDelivery.JvDBGrid2CellClick(Column: TColumn);
begin
  inherited;
  dmPedidoDelivery.buscaItensDoPedidoDelivery();
end;

procedure TfrmPedidosDelivery.dbgItensPedidoCellClick(Column: TColumn);
begin
  inherited;
  if ((dmPedidoDelivery.qryItensUltimosPedidos.Active) and (dmPedidoDelivery.qryItensUltimosPedidos.IsEmpty = false)) then
  begin
    dbgItensPedido.Hint := 'Sabores: ' + dmPedidoDelivery.qryItensUltimosPedidos.fieldbyname('SABORES').Value + sLineBreak + sLineBreak + 'Obs: ' + dmPedidoDelivery.qryItensUltimosPedidos.FieldByName('OBSERVACOES').Value;
  end;
end;

procedure TfrmPedidosDelivery.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  if PodeFecharFormulario then
  begin
    dm.LimpaInformacoesDaMesa(mesaDelivery, numero_caixa);
    Action := caFree;
  end
  else
  begin
    Action := caNone;
    if (ShowRealDialog(frmPedidosDelivery, tmConfirmacao, 'Confirme', 'O pedido atual está em andamento.' + sLineBreak + 'Deseja mesmo cancelar ?') = teSim) then
    begin
      Action := caFree;
    end;
  end;
end;

procedure TfrmPedidosDelivery.edNomeClienteConsultaChange(Sender: TObject);
var
  // LSQL : TStringList;
  ThreadConsultaClients: TThread;
  SQL: string;
begin
  inherited;

  try
    if ((Length(edNomeClienteConsulta.text) >= 3) or (Length(edEnderecoConsultaCliente.text) >= 3) or (Length(edEnderecoConsultaBairro.text) >= 3)) then
    begin

      dmPedidoDelivery.tbCsClientesDelivery.Active := false;
      dmPedidoDelivery.tbCsClientesDelivery.DisableControls;

      {
        gridConsultaClientesDBTableView1.DataController.DataSource  := nil;
        gridConsultaClientesDBTableView1.OnCellDblClick := nil;
        gridConsultaClientesDBTableView1.OnKeyDown := nil;
        gridConsultaClientesDBTableView1.OnCustomDrawCell := nil;
        gridConsultaClientes.BeginUpdate;
        {
        ThreadConsultaClients := TThread.CreateAnonymousThread(
        procedure ()
        begin
      }

      SQL := ' select cd.codigo, cd.nome, cd.telefone, cd.celular,' + '        b.descricao as descBairro,cd.endereco' + '        from clientes_delivery cd' + '   inner join bairro b on (b.codigo = cd.cod_bairro)';
      case rdTipoConsultaCliente.ItemIndex of
        0:
          begin
            SQL := SQL + '    where cd.nome like ' + Quotedstr(edNomeClienteConsulta.text + '%');
            SQL := SQL + '    and cd.endereco like ' + Quotedstr('%' + edEnderecoConsultaCliente.text + '%');
            SQL := SQL + '    and b.descricao like ' + Quotedstr(edEnderecoConsultaBairro.text + '%');
          end;
        1:
          SQL := SQL + '    where cd.telefone like ' + Quotedstr(edNomeClienteConsulta.text + '%');
        2:
          SQL := SQL + '    where cd.celular like ' + Quotedstr(edNomeClienteConsulta.text + '%');
      end;

      dmPedidoDelivery.tbCsClientesDelivery.enablecontrols;
      dm.getMemTable(dmPedidoDelivery.tbCsClientesDelivery, SQL);
      {
        end);

        ThreadConsultaClients.FreeOnTerminate := true;
        ThreadConsultaClients.OnTerminate := finalizaConsultaClientes;
        ThreadConsultaClients.Start; }
    end
  finally

  end;
end;

procedure TfrmPedidosDelivery.finalizaConsultaClientes(Sender: TObject);
begin
  // gridConsultaClientes.EndUpdate;
  // gridConsultaClientesDBTableView1.DataController.DataSource  := dmPedidoDelivery.dsConsultaClientes;
  // DBGrid1.DataSource := dmPedidoDelivery.dsConsultaClientes;
  dmPedidoDelivery.tbCsClientesDelivery.enablecontrols;

end;

procedure TfrmPedidosDelivery.edNomeClienteConsultaKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
var
  LSQL: TStringList;
  ThreadConsulta: TThread;
begin
  inherited;
  LSQL := TStringList.Create;
  try
    if Key = VK_RETURN then
    begin
      if (dmPedidoDelivery.tbCsClientesDelivery.RecordCount >= 0) then
        selecionaCliente
      else
      begin
        edNomeClienteConsulta.SetFocus;
      end;
    end
    else
    begin

      if ((Key = VK_UP) or (Key = VK_DOWN)) then
      begin
        if Key = VK_UP then
        begin
          dmPedidoDelivery.tbCsClientesDelivery.Prior;

        end;

        if Key = VK_DOWN then
        begin
          dmPedidoDelivery.tbCsClientesDelivery.Next;

        end;
      end
      else
      begin
        if Key = vk_escape then
        begin
          pgPedido.Show;
        end
        else
        begin
          if Key = vk_f2 then
          begin
            if rdTipoConsultaCliente.ItemIndex < 4 then
              rdTipoConsultaCliente.ItemIndex := rdTipoConsultaCliente.ItemIndex + 1
            else
              rdTipoConsultaCliente.ItemIndex := 0;
          end;

        end;
      end;
    end;
  finally
    FreeAndNil(LSQL);
  end;
end;

procedure TfrmPedidosDelivery.edQuantidadeExit(Sender: TObject);
var
  LProduto: Produto.TProduto;
begin
  inherited;

  LProduto := Produto.TProduto.Create;
  try

    pgListOpcoesMenu.ActivePageIndex := 0;
    if (Trim(edQuantidade.text) = '') then
    begin
      edCodFormaPagamento.SetFocus;
    end
    else
    begin
      if (validaQuantidade(Sender) = false) then
      begin
        ShowMessage('Quantidade inválida!');
        edQuantidade.text := '';
        edQuantidade.SetFocus;
        exit;
      end
      else
      begin
        dm.getDadosProduto(TeCodBarras, edCodBarrasProduto.Text, LProduto);
        if verifica_validade_lancamento then
        begin
          AdicionarProduto(LProduto);
          calcula_valores(Sender);
        end;
      end;

    end;

  finally
    FreeAndNil(LProduto);
  end;

end;

procedure TfrmPedidosDelivery.edTelClienteDeliveryKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin

  if Key = VK_RETURN then
  begin
    Perform(WM_NEXTDLGCTL, 0, 0)
  end;

  if Key = vk_f2 then
  begin
    if evento = 1 then
    begin
      edTelClienteDelivery.text := '';
      pgConsultaCliente.Show;
      edNomeClienteConsulta.SetFocus;
    end;
  end;

  if Key = vk_f3 then
  begin
    // abreCadastroClientes();
  end;

end;

procedure TfrmPedidosDelivery.abreCadastroClientes();
begin
  string_auxiliar := '';
  Application.createForm(TfrmCadClientesDelivery, frmCadClientesDelivery);
  frmCadClientesDelivery.setEvento(2);
  frmCadClientesDelivery.setCodCliente(getcodClienteDeliveryPorTelefone(edTelClienteDelivery.text));
  frmCadClientesDelivery.ShowModal;
  frmCadClientesDelivery.free;
  edTelClienteDelivery.SetFocus;
  BuscaMovimento;
  edCodBarrasProduto.SetFocus;
end;

procedure TfrmPedidosDelivery.AdvGlassButton2Click(Sender: TObject);
begin
  inherited;
  pgFormasPagto.show;

end;

procedure TfrmPedidosDelivery.AdvGlassButton5Click(Sender: TObject);
var
  LIDLancamento: LongInt;
begin
  inherited;
  try
    try
      validarAlteracaoLancamento;
      alterouProdutos := true;
      LIDLancamento := dm.tbMovimentoMesa.FieldByName('id').Value;
      dm.executaSQL('update movimento_mesa ms set ms.valor_unitario=' + dm.TrocaVirgPPto(FloatToStr(edPrecoAlteracaoProduto.value)) + ', ms.observacoes =' + Quotedstr(trim(memoObsLancamento.lines.Text)) + ' where id=' + Inttostr(LIDLancamento));
    except
      on E: Exception do
      begin
        ShowRealDialog(Self, tmErro, 'Erro', 'Erro ao atualizar observações! ' + sLineBreak + sLineBreak + E.Message);
      end;
    end;
  finally
    pnLadoEsquerdo.Enabled := true;
    pgFormasPagto.Show;
    BuscaMovimento;
    calcula_valores(edValorForma);
  end;
end;

procedure TfrmPedidosDelivery.validarAlteracaoLancamento;
begin
  if pnAlteracaoPrecoProduto.Visible = true then
  begin

    if edPrecoAlteracaoProduto.Value < 0 then
    begin
      edPrecoAlteracaoProduto.SetFocus;
      raise Exception.Create('Preço de alteração inválido!');
    end;

    if edPrecoAlteracaoProduto.Value = 0 then
    begin
      if (ShowRealDialog(Self, tmConfirmacaoPorPIN, 'Confirme', 'Você tem certeza que deseja zerar o valor deste produto?', 16) = teSim) then
      begin

      end
      else
        raise Exception.Create('Preço de alteração inválido!');
    end;
  end;

end;

procedure TfrmPedidosDelivery.edValorDescontoKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  inherited;
  if Key = VK_RETURN then
  begin
    btAplicardesconto.Click;
  end;
end;

procedure TfrmPedidosDelivery.edValorFormaExit(Sender: TObject);
begin
  inherited;
  if (Trim(edValorForma.text) <> '') then
  begin
    if validaValorPagamento(Sender) then
    begin

      registraFormaPagto(edCodFormaPagamento.EditValue, edCodFormaPagamento.text, FormatFloat('#0.00', StrToFloat(edValorForma.text)));
      if ed_total_pago.value >= ed_total_conta.value then
      begin
        btGravar.Click;

        // edCodFormaPagamento.Text := '';
        pgProdutosPedido.Show;

      end
      else
      begin
        // edCodFormaPagamento.Text := '';
        edCodFormaPagamento.SetFocus;
      end;

    end
    else
    begin
      ShowMessage('Valor da forma de pagamento é inválido!');
      edValorForma.text := '';
      edValorForma.SetFocus;
    end;
  end
  else
  begin
    pgProdutosPedido.Show;
  end;
end;

procedure TfrmPedidosDelivery.Excluirobservao1Click(Sender: TObject);
var
  LObs: TObsClienteDelivery;
begin
  inherited;
  LObs := TObsClienteDelivery.Create;
  LObs.codObs := dmPedidoDelivery.tbObservacoesClientes.fieldbyname('codigo').value;
  try
    LObs.excluir;
  finally
    FreeAndNil(LObs);
  end;

  atualizaListaObservacoesCliente(edCodClienteDelivery.text);
end;

procedure TfrmPedidosDelivery.FormCreate(Sender: TObject);
begin
  inherited;
  LDesativaPerguntaPagamentoEntregador := false;
  btDesconto.caption := 'Aplicar ' + sLineBreak + 'desconto';
  btPedidosAnteriores.Caption := 'Pedidos ' + sLineBreak + ' anteriores';
  btObsDoCliente.Caption := 'Obs. ' + sLineBreak + 'do cliente';
  //btMudaTabelaPreco.Caption := 'Tabelas ' + sLineBreak + ' de preços';

  PodeFecharFormulario := false;
  idPedidoIntegracao := 0;
  dmPedidoDelivery := TdmPedidoDelivery.Create(Self);
  dm.LimpaInformacoesDaMesa(mesaDelivery, numero_caixa);
  BuscaMovimento;

  entradaDoForm := false;
  alterouProdutos := false;
  dm.SetTabelaPrecoPadrao();
  AtualizaLabelsTabelaPreco();

  {
    if tabPrecoDelivery then
    begin
    pgTabelaPreco.Visible := false;
    btMudaTabelaPreco.Visible := false;
    end
    else
    begin
    pgTabelaPreco.Visible := true;
    btMudaTabelaPreco.Visible := true;
    end;

  }

  pgPedido.Show;
  pgProdutosPedido.Show;
  evento := 1;
end;

procedure TfrmPedidosDelivery.FormActivate(Sender: TObject);
begin
  inherited;

  PodeFecharFormulario := false;

  // Label8.Caption := dm.BuscaTroca(Label8.Caption, ' ', LineBreak);
  if (entradaDoForm = false) then
  begin
    entradaDoForm := true;
    limpouPagamentos := false;
    dm.LimpaInformacoesDaMesa(mesaDelivery, numero_caixa);
    pgFormasPagto.Show;
  end;

  if evento = 1 then
  begin
    limpouPagamentos := false;
    NovoPedido();
    getDadosPedidoPlataforma;

  end
  else
  begin

    entradaDoForm := true;
    limpouPagamentos := false;
    case evento of
      2:
        begin
          controla_botoes(nil);
          edTelClienteDelivery.text := getCodPedidoSelecionado();
          retornaDadosDoPedido(edTelClienteDelivery.text);

          alterouProdutos := false;

        end;

      3:
        begin
          controla_botoes(nil);
          edTelClienteDelivery.text := getCodPedidoSelecionado();
          retornaDadosDoPedido(edTelClienteDelivery.text);

          alterouProdutos := true;
        end;

      4:
        begin

          controla_botoes(nil);
          // edTelClienteDelivery.Text := getCodPedidoSelecionado();
          // retornaDadosDoPedido(edTelClienteDelivery.Text);
          // btGravar.Enabled  := false;
          alterouProdutos := false;
        end;

    end;

  end;

end;

procedure TfrmPedidosDelivery.FormDestroy(Sender: TObject);
begin
  inherited;
  dm.SetTabelaPrecoPadrao();
  FreeAndNil(dmPedidoDelivery);

end;

procedure TfrmPedidosDelivery.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if pgControle.ActivePage = pgPedido then
  begin
    inherited;

    if (Key = vk_f3) then
    begin
      abreCadastroClientes();
    end;

    if ((ssCtrl in Shift) and (Key = 82)) then
    begin
      if (pgListMovimentoProdutos.ActivePageIndex <> 1) then
      begin
        pgProdutosPedido.Show;
      end
      else
      begin
        pgResumoProdutos.Show;
        ExibeModoResumidoMovimentoProdutos;
      end;
    end;

  end
  else
  begin
    if Key = vk_escape then
    begin
      pgPedido.Show;
      edTelClienteDelivery.SetFocus;
    end;
  end;

  if (Key = vk_f12) then
  begin
    AbrirSelecaoDeTabelaDePrecos;
    Key := 0;
  end;
end;

procedure TfrmPedidosDelivery.AbrirSelecaoDeTabelaDePrecos();
begin

  if dm.verificaPermissaoAcao('I20003010', true, true) = true then
  begin

    Application.CreateForm(TfrmSelecionaTabelaPrecos, frmSelecionaTabelaPrecos);
    frmSelecionaTabelaPrecos.ShowModal;
    frmSelecionaTabelaPrecos.free;
    AtualizaLabelsTabelaPreco;
    AtualizaValoresPorTabelaPreco(dm.getTabelaPrecoAtual.codigo);

  end;

end;

procedure TfrmPedidosDelivery.AdvGlassButton6Click(Sender: TObject);
begin
  inherited;
  try
    IncluirObservacaoCliente(edCodClienteDelivery.Text, edNovaObservacao.text);
    atualizaListaObservacoesCliente(edCodClienteDelivery.Text);
    ShowRealDialog(Self, tmSucesso, 'Sucesso', 'Observação cadastrada com sucesso!');

  except
    on E: Exception do
    begin
      ShowRealDialog(Self, tmErro, 'Erro', 'Erro ao incluir observações: ' + E.Message);
    end;
  end;

end;

procedure TfrmPedidosDelivery.AdvGlassButton7Click(Sender: TObject);
var
  LMesaSelecionada: string;
begin
  inherited;
  try
    try
      ValidarImportacaoDeMesa;
      LMesaSelecionada := cbMesaImportar.EditValue;
      if (ShowRealDialog(Self, tmConfirmacaoPorPIN, 'Confirme', 'Você tem certeza que deseja importar o movimento da mesa? A mesa será limpa após o procedimento.', 16) = teSim) then
      begin
        dm.executaSQL('update movimento_mesa ms set ms.cod_mesa=' + Quotedstr(mesaDelivery) + ' where ms.cod_mesa =' + Quotedstr(LMesaSelecionada));
      end;

    except
      on E: Exception do
      begin
        ShowRealDialog(Self, tmErro, 'Erro', 'Erro Importar movimento de mesa! ' + sLineBreak + sLineBreak + E.Message);
      end;
    end;
  finally

    pnLadoEsquerdo.Enabled := true;
    pgFormasPagto.Show;
    BuscaMovimento;
    calcula_valores(edValorForma);
  end;
end;

procedure TfrmPedidosDelivery.ValidarImportacaoDeMesa;
begin
  if cbMesaImportar.EditValue = null then
    raise Exception.Create('Mesa de importação inválida!');

  try
    StrtoInt(cbMesaImportar.EditValue)
  except
    begin
      raise Exception.Create('Mesa de importação inválida!');
    end;
  end;

end;

procedure TfrmPedidosDelivery.atualizaListaObservacoesCliente(ACodCliente: string);
var
  LSQL: TStringList;
begin

  LSQL := TStringList.Create;

  try

    LSQL.Clear;
    LSQL.add('  select obs.codigo, obs.data, obs.observacao ');
    LSQL.add('            from OBS_CLIENTES_DELIVERY obs ');
    LSQL.add('             where cod_cli=' + Quotedstr(ACodCliente));
    LSQL.add('    order by obs.data desc ');
    dm.getMemTable(dmPedidoDelivery.tbObservacoesClientes, LSQL.text);
    // JvDBGrid1.Refresh;

    if dmPedidoDelivery.tbObservacoesClientes.IsEmpty then
    begin
      Excluirobservao1.Enabled := false;
    end
    else
    begin
      Excluirobservao1.Enabled := true;
//      pgListOpcoesMenu.ActivePageIndex := 1;

      if evento <> 3 then
      begin
        dmPedidoDelivery.tbObservacoesClientes.First;
        while not dmPedidoDelivery.tbObservacoesClientes.Eof do
        begin
          ShowRealDialog(Self, tmAviso, 'Atenção!', dmPedidoDelivery.tbObservacoesClientes.fieldbyname('observacao').value);
          dmPedidoDelivery.tbObservacoesClientes.Next;
        end;
      end;

    end;

  finally
    FreeAndNil(LSQL);
  end;

end;

procedure TfrmPedidosDelivery.E1Click(Sender: TObject);
begin
  ExcluirPagamentos(false);
end;

procedure TfrmPedidosDelivery.ExcluirPagamentos(ATodos: Boolean);
var
  LMensagem: string;
begin
  inherited;
  if ATodos = True then
    LMensagem := 'Excluir todos os pagamentos?'
  else
    LMensagem := 'Excluir pagamento selecionado?';

  if dmPedidoDelivery.tbFormasPagamentoTemp.IsEmpty = false then
    if (ShowRealDialog(Self, tmConfirmacao, 'Confirma', LMensagem, 16) = teSim) then
    begin
      if ATodos = True then
      begin
        dmPedidoDelivery.tbFormasPagamentoTemp.active := false;
        dmPedidoDelivery.tbFormasPagamentoTemp.active := true;
      end
      else
        dmPedidoDelivery.tbFormasPagamentoTemp.Delete;

      AtualizaTotalDePagamentos;
      calcula_valores(edValorForma);
    end
end;

procedure TfrmPedidosDelivery.AtualizaTotalDePagamentos;
begin
  dmPedidoDelivery.tbFormasPagamentoTemp.First;
  ed_total_pago.value := 0;

  while not dmPedidoDelivery.tbFormasPagamentoTemp.Eof do
  begin
    ed_total_pago.value := ed_total_pago.value + dmPedidoDelivery.tbFormasPagamentoTempvalorForma.value;
    dmPedidoDelivery.tbFormasPagamentoTemp.Next;
  end;

  {
    while not dmPedidoDelivery.tbFormasPagamento.eof do
    begin
    ed_total_pago.value := ed_total_pago.value + dmPedidoDelivery.tbFormasPagamentoTempvalorForma.value;
    dmPedidoDelivery.tbFormasPagamento.next;
    end; }
end;

procedure TfrmPedidosDelivery.btAgendamentoClick(Sender: TObject);
begin
  inherited;
  pgAgendamento.show;
end;

procedure TfrmPedidosDelivery.btDescontoClick(Sender: TObject);
begin
  inherited;
  if (dm.verificaPermissaoAcao('B20002016', true, true) = true) then
  begin
    pgListOpcoesMenu.ActivePage := pgDesconto;
    edValorDesconto.SelectAll;
    edValorDesconto.SetFocus;
  end;

end;

procedure TfrmPedidosDelivery.btObsDoClienteClick(Sender: TObject);
begin
  inherited;
  pgObsClientes.Show;
end;

procedure TfrmPedidosDelivery.edCodBarrasProdutoExit(Sender: TObject);
var
  LCodProduto: string;
  LProduto: Produto.TProduto;
  LIsProdutoInstore: Boolean;
  LValorTotalInStore: string;
  LQuantidadeLancamento: double;
begin
  inherited;
  Edit1Exit(Sender);

  LCodProduto := edCodBarrasProduto.text;
  if ((Trim(LCodProduto) = '')) then
  begin
    edQuantidade.text := '';
    exit;
  end;

  LProduto := Produto.TProduto.Create;
  try
    try

      if (StrIsNumber(LCodProduto) = false) then
      begin

        ShowRealDialog(Self, tmErro, 'Erro', 'Código do produto inválido!');
        edCodBarrasProduto.SelectAll;
        edCodBarrasProduto.SetFocus;
        exit;
      end;

      if ((Length(LCodProduto) >= 6) and (Length(LCodProduto) <= 13)) then
      begin

        // Verifica se é um produto IN store. Todos que começam com o número 2
        // são produtos etiquetados na casa.

        if ((Trim(Copy(LCodProduto, 0, 1)) = '2')) then
        begin
          // Produto in store
          LIsProdutoInstore := true;
          dm.ACBrInStore1.Codificacao := dm.LeIni(2, 'BALANCA', 'codificacao');
          dm.ACBrInStore1.Desmembrar(LCodProduto);
          LValorTotalInStore := FloatToStr(dm.ACBrInStore1.Total);
          LCodProduto := dm.ACBrInStore1.codigo;

          try
            LCodProduto := FormatFloat('00000', StrToFloat(LCodProduto));
            edCodBarrasProduto.Text := LCodProduto;
          except
            raise Exception.Create('Código de produto in store inválido!');
          end;

          try
            StrToFloat(LValorTotalInStore);
          except
            raise Exception.Create('Valor total de produto in store lido na etiqueta é inválido! ' + LValorTotalInStore);

          end;

        end;
      end
      else
      begin

        edQuantidade.text := '1';
        try
          LCodProduto := FormatFloat('00000', StrToFloat(LCodProduto));
          edCodBarrasProduto.text := FormatFloat('00000', StrToFloat(LCodProduto));
        except
          raise Exception.Create('Código de produto inválido!');
        end;

      end;

      dm.getDadosProduto(TeCodBarras, LCodProduto, LProduto);
      if LProduto.Vende = false then
        raise Exception.Create('O produto selecionado está desabilitado para venda!');

      edDescricaoProduto.text := LProduto.Descricao;
      edValorUnitarioProduto.text := FloatToStr(LProduto.preco);
      edCodProduto.text := LProduto.codigo;

      if LIsProdutoInstore then
      begin
        LQuantidadeLancamento := StrToFloat(LValorTotalInStore) / LProduto.preco;
        LQuantidadeLancamento := RoundTo(LQuantidadeLancamento, -3);
        edQuantidade.text := FormatFloat('#0.000', LQuantidadeLancamento);

        if verifica_validade_lancamento then
        begin
          AdicionarProduto(LProduto);
          calcula_valores(Sender);
          exit;
        end;
      end;

    except
      on E: Exception do
      begin
        ShowRealDialog(Self, tmErro, 'Erro', E.Message);
        edCodBarrasProduto.SelectAll;
        edCodBarrasProduto.SetFocus;
      end;
    end;
  finally
    FreeAndNil(LProduto);
  end;

end;

procedure TfrmPedidosDelivery.edCodFormaPagamentoEnter(Sender: TObject);
begin
//  inherited;
  if TcxLookupComboBox(Sender).Properties.ListSource.DataSet.Active and (TcxLookupComboBox(Sender).Properties.ListSource.DataSet.RecordCount > 0) then
  begin
    TcxLookupComboBox(Sender).DroppedDown := true;
  end;
end;

procedure TfrmPedidosDelivery.edCodFormaPagamentoKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin

  if edCodFormaPagamento.DroppedDown = false then
  begin
    if Key = VK_RETURN then // Verifica se a tecla é o Enter
    begin

      edValorForma.SetFocus;
    end;
  end;
end;

procedure TfrmPedidosDelivery.edCodFormaPagamentoPropertiesCloseUp(Sender: TObject);
begin
  inherited;
  TcxLookupComboBox(Sender).PostEditValue;
end;

procedure TfrmPedidosDelivery.Excluir1Click(Sender: TObject);
var
  LIDLancamento: LongInt;
begin
  inherited;
  if (dm.tbMovimentoMesa.IsEmpty = false) then
  begin
    if (ShowRealDialog(Self, tmConfirmacao, 'Confirme', 'Confirma a exclusão do pedido?', 16) = teSim) then
    begin
      LIDLancamento := dm.tbMovimentoMesa.fieldbyname('id').value;
      ExcluirProdutoDoPedido(LIDLancamento);
      BuscaMovimento;
      calcula_valores(self);
    end;
  end;
end;

procedure TfrmPedidosDelivery.ExcluirProdutoDoPedido(AID: LongInt);
var
  LSQL: TStringList;
  LTbAux: TFDMemTable;
begin
  LTbAux := TFDMemTable.Create(Self);
  LSQL := TStringList.Create;

  try
    try
      LSQL.add(' delete from movimento_mesa ms where ms.id=' + INttostr(AID));
      dm.executaSQL(LSQL.Text);

    except
      on E: Exception do
      begin
        ShowRealDialog(Self, tmErro, 'Erro', 'Erro ao excluir o produto!');
      end;
    end;
  finally
    FreeAndNil(LSQL);
    LTbAux.Active := false;
    FreeAndNil(LTbAux);
  end;
end;

procedure TfrmPedidosDelivery.btPedidosAnterioresClick(Sender: TObject);
begin
  inherited;
  pgUltimosPedidos.Show;

end;

procedure TfrmPedidosDelivery.ckbPedidoCobradoEntregadorClick(Sender: TObject);
var
  LMsg: string;
begin
  inherited;
  if (LDesativaPerguntaPagamentoEntregador = false) then
  begin
    LMsg := 'Ao ativar essa opção, será impresso no comprovante do entregador uma mensagem informando que o pedido deverá ser cobrado na entrega.' + sLineBreak + 'Você tem certeza disso ?';
    if ckbPedidoCobradoEntregador.Checked then
    begin
      if (ShowRealDialog(Self, tmConfirmacaoPorPIN, 'Confirme', LMsg, 18) = teSim) then
        ckbPedidoCobradoEntregador.checked := true
      else
        ckbPedidoCobradoEntregador.checked := false;
    end;
  end
  else
  begin
    ckbPedidoCobradoEntregador.checked := true
  end;

end;

procedure TfrmPedidosDelivery.E2Click(Sender: TObject);
begin
  inherited;
  if (dm.tbMovimentoMesa.IsEmpty = false) then
  begin
    try

      if (dm.verificaPermissaoAcao('B20003012', false, false) = true) then
        pnAlteracaoPrecoProduto.Visible := true
      else
        pnAlteracaoPrecoProduto.Visible := false;

      memoObsLancamento.Lines.clear;
      memoObsLancamento.Lines.add(dm.tbMovimentoMesa.FieldByName('observacoes').value);
      edPrecoAlteracaoProduto.Value := dm.tbMovimentoMesa.FieldByName('valor_unitario').value;
      pnLadoEsquerdo.Enabled := false;
      pgObservacoesLancamento.Show;
    except
      pnLadoEsquerdo.Enabled := true;
      pgFormasPagto.Show;
    end;
  end;
end;

procedure TfrmPedidosDelivery.H1Click(Sender: TObject);
begin
  inherited;
  dm.tbMovimentoMesa.edit;
end;

procedure TfrmPedidosDelivery.I1Click(Sender: TObject);
begin
  inherited;
  if (dm.verificaPermissaoAcao('B20003013', true, true) = true) then
  begin
    pgImportarMesa.Show;
    cbMesaImportar.SetFocus;
  end;
end;

procedure TfrmPedidosDelivery.lbDescTabelaPrecoClick(Sender: TObject);
begin
  inherited;
  AbrirSelecaoDeTabelaDePrecos;
end;

procedure TfrmPedidosDelivery.PngSpeedButton2Click(Sender: TObject);
begin
  inherited;
  ExcluirPagamentos(true);
end;

procedure TfrmPedidosDelivery.tbViewDetalhadoDblClick(Sender: TObject);
begin
  inherited;
  E2Click(Sender);
end;

procedure TfrmPedidosDelivery.tbViewDetalhadoEditKeyDown(Sender: TcxCustomGridTableView; AItem: TcxCustomGridTableItem; AEdit: TcxCustomEdit; var Key: Word; Shift: TShiftState);
begin
  inherited;

  if Key = VK_DELETE then
  begin
    Excluir1.Click;
    Key := 0;
  end;

end;

function TfrmPedidosDelivery.validarCPFCliente(): Boolean;
begin
  result := false;

  if Trim(edCpf.text) <> '' then
  begin
    if ((Length(Trim(edCpf.text)) = 11) or (Length(Trim(edCpf.text)) = 14)) then
    begin
      if Length(Trim(edCpf.text)) = 11 then
      begin
        ACBrValidador1.TipoDocto := docCPF;
        ACBrValidador1.Documento := Trim(edCpf.text);
        if ACBrValidador1.Validar = false then
        begin
          // pgCPFNota.Show;
          dm.exibe_painel_erro('CPF INVÁLIDO!', 'Ok');
          edCpf.SetFocus;
          exit;
        end;
      end;

      if Length(Trim(edCpf.text)) = 14 then
      begin
        ACBrValidador1.TipoDocto := docCNPJ;
        ACBrValidador1.Documento := Trim(edCpf.text);
        if ACBrValidador1.Validar = false then
        begin
          // pgCPFNota.Show;
          dm.exibe_painel_erro('CNPJ INVÁLIDO!', 'Ok');
          edCpf.SetFocus;
          exit;
        end;
      end;
    end
    else
    begin
      // pgCPFNota.Show;
      dm.exibe_painel_erro('Número do CPF OU CNPJ documento inválido', 'Ok');
      edCpf.SetFocus;
      exit;
    end;
  end
  else
  begin
    edCpf.text := '';
    edNomeCliente.text := '';
  end;

  result := true;
end;

procedure TfrmPedidosDelivery.IncluirObservacaoCliente(ACodCliente: string; AObservacao: string);
var
  LCodigo: string;
  LSQL: TStringList;
begin

  LSQL := TStringlist.Create;

  try
    try
      LCodigo := Inttostr(StrToInt(dm.geraCodigo('G_OBS_CLIENTES_DELIVERY', 5)));
      LSQL.add('insert into obs_clientes_delivery (codigo,cod_cli,data,observacao,alerta) values (');
      LSQL.add('' + LCodigo + ',');
      LSQL.add('' + Quotedstr(ACodCliente) + ',');
      LSQL.add('' + Quotedstr(FormatDateTime('DD.MM.YYY', data_do_sistema)) + ',');
      LSQL.add('' + Quotedstr(AObservacao) + ',');
      if ckbAlertaPedidos.Checked = true then
        LSQL.add('1)')
      else
        LSQL.add('0)');

      dm.executaSQL(LSQL.Text);
    except
      on E: Exception do
      begin
        raise Exception.Create(E.message);
      end;

    end;

  finally
    FreeAndNil(LSQL);
  end;

end;

end.

