unit uuExpedicaoDelivery;

interface

uses
  Windows, ClipBrd, System.Generics.Collections, Messages, SysUtils, Variants,
  System.JSON.Types, IBX.IBQuery, Classes, Graphics, RealFramework,
  Alcinoe.JSONDoc, Controls, Forms, REST.Types, rest.client, IBX.IBDatabase,
  cxGridStrs, System.StrUtils, Dialogs, uu_modelo_Vazio, StdCtrls, Buttons,
  ExtCtrls, synautil, FireDAC.Comp.Client, frameworkMobile, System.Character,
  Menus, Mask, Data.DB, RxToolEdit, System.JSON, System.DateUtils,
  uuPedidoDelivery, AdvOfficeImage, PngSpeedButton, ACBrUtil, JvPageList,
  JvExControls, uuDMExpedicaoDelivery, Vcl.DBCGrids, htmlhint, cxClasses, cxHint,
  dxCore, dxCoreClasses, cxGraphics, dxGDIPlusClasses, dxRichEdit.Types,
  dxRichEdit.Dialogs.EventArgs, cxControls, cxStyles, cxDataStorage, cxDBData,
  cxGridCustomTableView, cxGridDBTableView, cxGridLevel, cxGridCustomView,
  cxGrid, Vcl.ImgList, cxImageList, cxTextEdit, CurvyControls, Vcl.Samples.Spin,
  JvWavePlayer, IdSSLOpenSSL, Vcl.ComCtrls, JvDateTimePicker, cxLookAndFeels,
  cxLookAndFeelPainters, cxEdit, cxNavigator, cxCurrencyEdit, cxMaskEdit,
  dxScreenTip, IdIOHandler, IdIOHandlerStack, IdSSL, JvComponentBase,
  dxCustomHint, cxGridTableView, JvExComCtrls, JvActionsEngine, JvControlActions,
  Vcl.ActnList, System.Actions, cxContainer, cxCheckBox, cxCustomData, cxFilter,
  cxData, dxDateRanges, dxScrollbarAnnotations, IdBaseComponent, IdComponent,
  IdIOHandlerSocket, System.ImageList;

type
  TcxViewInfoAcess = class(TcxGridTableDataCellViewInfo);

  TcxPainterAccess = class(TcxGridTableDataCellPainter);

  TfrmExpedicaoDelivery = class(Tfrm_modelo_vazio)
    pnPrincipal: TPanel;
    tmAtualizaPedidosExpedicao: TTimer;
    PopupMenu1: TPopupMenu;
    SAIDADOPEDIDO1: TMenuItem;
    RECEBEPEDIDO1: TMenuItem;
    Alteraropedido1: TMenuItem;
    EXCLUIROPEDIDO1: TMenuItem;
    N1: TMenuItem;
    timerHora: TTimer;
    HTMLHint1: THTMLHint;
    cxHintStyleController1: TcxHintStyleController;
    cxStyleRepository1: TcxStyleRepository;
    cxStyle2: TcxStyle;
    cxStyle1: TcxStyle;
    cxImageList1: TcxImageList;
    Label6: TLabel;
    timerDesabilitaHint: TTimer;
    cxStyle3: TcxStyle;
    Label5: TLabel;
    Label8: TLabel;
    cxStyle4: TcxStyle;
    cxStyle5: TcxStyle;
    PngSpeedButton1: TPngSpeedButton;
    timerTempoPreparo: TTimer;
    tmPoling: TTimer;
    PopupMenu2: TPopupMenu;
    itCienciaCancelamento: TMenuItem;
    MenuItem1: TMenuItem;
    C2: TMenuItem;
    tmAlertaPedidosPlataforma: TTimer;
    IdSSLIOHandlerSocketOpenSSL1: TIdSSLIOHandlerSocketOpenSSL;
    plControle: TJvPageList;
    pgExpedicao: TJvStandardPage;
    pnPrincipalExpedicao: TPanel;
    pgEntregadores: TJvStandardPage;
    dbgEntregadores: TDBCtrlGrid;
    pnFiltrosExpedicao: TPanel;
    btFiltraPedidos: TPngSpeedButton;
    Label3: TLabel;
    Label1: TLabel;
    btNovoPedido: TPngSpeedButton;
    btClientes: TPngSpeedButton;
    btBairros: TPngSpeedButton;
    btConsultarPedido: TPngSpeedButton;
    Label7: TLabel;
    btPedidosPlataforma: TPngSpeedButton;
    RadioGroup1: TRadioGroup;
    rdTipoEntrega: TRadioGroup;
    rdFiltro: TRadioGroup;
    rdpOrdem: TRadioGroup;
    edDataEntrega: TDateEdit;
    edHoraInicial: TMaskEdit;
    edHoraFinal: TMaskEdit;
    rdExibePedidos: TRadioGroup;
    edNomeCliente: TCurvyEdit;
    Panel6: TPanel;
    Label9: TLabel;
    PngSpeedButton2: TPngSpeedButton;
    spinTempo: TSpinEdit;
    pgPedidosPlataformas: TJvStandardPage;
    pgLocalizacaoCliente: TJvStandardPage;
    pnWebView: TPanel;
    Panel18: TPanel;
    PngSpeedButton3: TPngSpeedButton;
    PngSpeedButton4: TPngSpeedButton;
    PngSpeedButton5: TPngSpeedButton;
    PngSpeedButton6: TPngSpeedButton;
    pnDadosLocalizacao: TPanel;
    lbLocalizacaoCliente: TLabel;
    lbNomeClienteLocalizacao: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    pgAssociacaoCliente: TJvStandardPage;
    pnAssociacaoCliente: TPanel;
    Panel20: TPanel;
    Panel26: TPanel;
    Label22: TLabel;
    lbNomeClienteAssociacao: TLabel;
    Panel28: TPanel;
    Label24: TLabel;
    lbBairroClienteAssociacao: TLabel;
    Panel29: TPanel;
    Label26: TLabel;
    lbEnderecoClienteAssociacao: TLabel;
    Panel31: TPanel;
    Label30: TLabel;
    Panel30: TPanel;
    pnFiltrosPesquisa: TPanel;
    Label28: TLabel;
    Label29: TLabel;
    lbEnderecoBairro: TLabel;
    edNomeClienteConsulta: TCurvyEdit;
    edEnderecoConsultaCliente: TCurvyEdit;
    edEnderecoConsultaBairro: TCurvyEdit;
    Panel32: TPanel;
    gridConsultaClientes: TcxGrid;
    gridConsultaClientesDBTableView1: TcxGridDBTableView;
    gridConsultaClientesDBTableView1Column1: TcxGridDBColumn;
    gridConsultaClientesDBTableView1Column2: TcxGridDBColumn;
    gridConsultaClientesDBTableView1Column3: TcxGridDBColumn;
    gridConsultaClientesDBTableView1Column4: TcxGridDBColumn;
    gridConsultaClientesDBTableView1Column5: TcxGridDBColumn;
    gridConsultaClientesLevel1: TcxGridLevel;
    Panel33: TPanel;
    Label23: TLabel;
    lbNumeroPedidoAssociacao: TLabel;
    PngSpeedButton9: TPngSpeedButton;
    PngSpeedButton10: TPngSpeedButton;
    btAssociarCliente: TPngSpeedButton;
    btClienteSemCadastro: TPngSpeedButton;
    edNumeroConsultaAssociacao: TCurvyEdit;
    Label25: TLabel;
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1DBTableView1Column1: TcxGridDBColumn;
    cxGrid1DBTableView1Column2: TcxGridDBColumn;
    cxGrid1DBTableView1Column3: TcxGridDBColumn;
    cxGrid1DBTableView1Column4: TcxGridDBColumn;
    cxGrid1DBTableView1Column8: TcxGridDBColumn;
    cxGrid1DBTableView1Column10: TcxGridDBColumn;
    cxGrid1DBTableView1Column5: TcxGridDBColumn;
    cxGrid1DBTableView1Column6: TcxGridDBColumn;
    cxGrid1DBTableView1Column11: TcxGridDBColumn;
    cxGrid1DBTableView1Column9: TcxGridDBColumn;
    cxGrid1DBTableView1Column7: TcxGridDBColumn;
    cxGrid1DBTableView1Column13: TcxGridDBColumn;
    cxGrid1DBTableView1Column14: TcxGridDBColumn;
    cxGrid1DBTableView1Column12: TcxGridDBColumn;
    cxGrid1DBTableView1Column15: TcxGridDBColumn;
    cxGrid1DBTableView1Column16: TcxGridDBColumn;
    cxGrid1DBTableView1Column17: TcxGridDBColumn;
    cxGrid1Level1: TcxGridLevel;
    cxStyleRepository2: TcxStyleRepository;
    cxStyle6: TcxStyle;
    cxStyle7: TcxStyle;
    stConfirmada: TcxStyle;
    stCancelada: TcxStyle;
    stCiencia: TcxStyle;
    stSemManifesto: TcxStyle;
    stNaoRealizada: TcxStyle;
    cxImageListPedidosPlataforma: TcxImageList;
    gridConsultaClientesDBTableView1Column6: TcxGridDBColumn;
    Panel1: TPanel;
    PngSpeedButton11: TPngSpeedButton;
    pnl1: TPanel;
    pnl2: TPanel;
    pnl3: TPanel;
    pnl4: TPanel;
    Panel4: TPanel;
    Label27: TLabel;
    lblNumeroPedidoEntregadores: TLabel;
    Panel2: TPanel;
    Label31: TLabel;
    lblNomeClienteEntregadores: TLabel;
    Panel5: TPanel;
    Label32: TLabel;
    lblEnderecoEntregadores: TLabel;
    Panel27: TPanel;
    Label33: TLabel;
    lblBairroEntregadores: TLabel;
    lbObsClienteAssociacao: TEdit;
    SeiLa: TcxGridDBColumn;
    player: TJvWavePlayer;
    F1: TMenuItem;
    JvStandardPage1: TJvStandardPage;
    pnTitulo: TPanel;
    lbTitulo: TLabel;
    lbDataSistema: TLabel;
    lbHora: TLabel;
    Panel35: TPanel;
    Label4: TLabel;
    Panel19: TPanel;
    Label12: TLabel;
    btAtualizarLista: TPngSpeedButton;
    edDataPedidosPlataforma: TJvDateTimePicker;
    ckbApenasNaoLancados: TcxCheckBox;
    pnPedidos: TPanel;
    gridPlataformas: TcxGrid;
    gridPlataformasDBTableView1: TcxGridDBTableView;
    gridPlataformasDBTableView1Column4: TcxGridDBColumn;
    gridPlataformasDBTableView1Column2: TcxGridDBColumn;
    gridPlataformasDBTableView1Column7: TcxGridDBColumn;
    gridPlataformasDBTableView1Column11: TcxGridDBColumn;
    gridPlataformasDBTableView1Column1: TcxGridDBColumn;
    gridPlataformasDBTableView1Column3: TcxGridDBColumn;
    cancelado: TcxGridDBColumn;
    confirmado: TcxGridDBColumn;
    colStatusInt: TcxGridDBColumn;
    clienteAssociado: TcxGridDBColumn;
    StatusIntegracaoSistema: TcxGridDBColumn;
    gridPlataformasLevel1: TcxGridLevel;
    itConfirmarPedido: TPngSpeedButton;
    itRejeitarPedido: TPngSpeedButton;
    pnRodapeExpedicao: TPanel;
    lbNomeUsuario: TLabel;
    AdvOfficeImage1: TAdvOfficeImage;
    lbNumeroEstacao: TLabel;
    AdvOfficeImage2: TAdvOfficeImage;
    Panel3: TPanel;
    pnDadosDoPedido: TPanel;
    pnProdutosPedido: TPanel;
    pnCabecalhoProdutos: TPanel;
    Label13: TLabel;
    Panel8: TPanel;
    Label17: TLabel;
    Panel13: TPanel;
    Panel14: TPanel;
    Label18: TLabel;
    Panel16: TPanel;
    Panel11: TPanel;
    Panel9: TPanel;
    pnItens: TPanel;
    scrollPedidos: TScrollBox;
    pnItemPedido: TPanel;
    pnNomeProduto: TPanel;
    lbNomeProduto: TLabel;
    pnQtdProduto: TPanel;
    lbQtdProduto: TLabel;
    pnTotalProduto: TPanel;
    lbTotalProduto: TLabel;
    pnPrecoProduto: TPanel;
    lbPrecoProduto: TLabel;
    pnDadosDoCliente: TPanel;
    Panel7: TPanel;
    lbNumeroPedidoCliente: TLabel;
    Label21: TLabel;
    pnClienteNovo: TPanel;
    imgParaRetirada: TImage;
    Label11: TLabel;
    lbBairro: TLabel;
    lbNomeCliente: TLabel;
    Label2: TLabel;
    Label37: TLabel;
    lbEnderecoCliente: TLabel;
    Label15: TLabel;
    lbObservacoesEntrega: TLabel;
    lbNomeLoja: TLabel;
    Label14: TLabel;
    PngSpeedButton7: TPngSpeedButton;
    PngSpeedButton12: TPngSpeedButton;
    PngSpeedButton13: TPngSpeedButton;
    Panel15: TPanel;
    Panel10: TPanel;
    Shape2: TShape;
    Panel17: TPanel;
    Label35: TLabel;
    Panel12: TPanel;
    Shape3: TShape;
    lbTotalPedidosGeral: TLabel;
    lbQtdPedidosGeral: TLabel;
    Panel21: TPanel;
    Label38: TLabel;
    Panel22: TPanel;
    Panel23: TPanel;
    Shape4: TShape;
    lbTotalPedidosAbertos: TLabel;
    lbQtdPedidosAbertos: TLabel;
    Panel24: TPanel;
    Label40: TLabel;
    Panel25: TPanel;
    Panel34: TPanel;
    Shape1: TShape;
    lbTotalPedidosRecebidos: TLabel;
    lbQtdPedidosRecebidos: TLabel;
    Panel36: TPanel;
    Label42: TLabel;
    lbTempoMedio: TLabel;
    PngSpeedButton14: TPngSpeedButton;
    PngSpeedButton8: TPngSpeedButton;
    procedure btSairClick(Sender: TObject);
    procedure filtraPedidos();
    procedure FormActivate(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure tmAtualizaPedidosExpedicaoTimer(Sender: TObject);
    procedure rdFiltroClick(Sender: TObject);
    procedure rdpOrdemClick(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure SAIDADOPEDIDO1Click(Sender: TObject);
    procedure RECEBEPEDIDO1Click(Sender: TObject);
    procedure muda_acao(tipo: Integer);
    procedure lbTituloDblClick(Sender: TObject);
    procedure rdTipoEntregaClick(Sender: TObject);
    procedure btFiltraPedidosClick(Sender: TObject);
    procedure Alteraropedido1Click(Sender: TObject);
    procedure btNovoPedidoClick(Sender: TObject);
    procedure btClientesClick(Sender: TObject);
    procedure btBairrosClick(Sender: TObject);
    procedure btConsultarPedidoClick(Sender: TObject);
    procedure timerHoraTimer(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure dbgEntregadoresClick(Sender: TObject);
    procedure dbgEntregadoresPaintPanel(DBCtrlGrid: TDBCtrlGrid; Index: Integer);
    procedure cxGrid1DBTableView1Column5CustomDrawCell(Sender: TcxCustomGridTableView; ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
    procedure cxGrid1DBTableView1DblClick(Sender: TObject);
    procedure cxGrid1DBTableView1Column11CustomDrawCell(Sender: TcxCustomGridTableView; ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
    procedure cxGrid1DBTableView1CellClick(Sender: TcxCustomGridTableView; ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton; AShift: TShiftState; var AHandled: Boolean);
    procedure edNomeClienteChange(Sender: TObject);
    procedure timerDesabilitaHintTimer(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cxGrid1DBTableView1Column5StylesGetContentStyle(Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord; AItem: TcxCustomGridTableItem; var AStyle: TcxStyle);
    procedure timerTempoPreparoTimer(Sender: TObject);
    procedure tmPolingTimer(Sender: TObject);
    procedure pgPedidosPlataformasShow(Sender: TObject);
    procedure gridPlataformasDBTableView1CellClick(Sender: TcxCustomGridTableView; ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton; AShift: TShiftState; var AHandled: Boolean);
    procedure itConfirmarPedidoClick(Sender: TObject);
    procedure itRejeitarPedidoClick(Sender: TObject);
    procedure tmAlertaPedidosPlataformaTimer(Sender: TObject);
    procedure btSomClick(Sender: TObject);
    procedure btPedidosPlataformaClick(Sender: TObject);
    procedure btVoltarClick(Sender: TObject);
    procedure itCienciaCancelamentoClick(Sender: TObject);
    procedure edNomeClienteConsultaChange(Sender: TObject);
    procedure EXCLUIROPEDIDO1Click(Sender: TObject);
    procedure gridConsultaClientesDBTableView1CellClick(Sender: TcxCustomGridTableView; ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton; AShift: TShiftState; var AHandled: Boolean);
    procedure btAssociarClienteClick(Sender: TObject);
    procedure PngSpeedButton2Click(Sender: TObject);
    procedure btClienteSemCadastroClick(Sender: TObject);
    procedure pgPedidosExpedicaoHide(Sender: TObject);
    procedure pgEntregadoresShow(Sender: TObject);
    procedure pgExpedicaoShow(Sender: TObject);
    procedure pgAssociacaoClienteShow(Sender: TObject);
    procedure pgExpedicaoHide(Sender: TObject);
    procedure pgPedidosPlataformasHide(Sender: TObject);
    procedure gridPlataformasDBTableView1StylesGetContentStyle(Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord; AItem: TcxCustomGridTableItem; var AStyle: TcxStyle);
    procedure gridPlataformasDBTableView1Column2CustomDrawCell(Sender: TcxCustomGridTableView; ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
    procedure gridPlataformasDBTableView1KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure gridPlataformasDBTableView1KeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure ckbOrdemClick(Sender: TObject);
    procedure ckbNaoAssociadosClick(Sender: TObject);
    procedure edDataPedidosPlataformaChange(Sender: TObject);
    procedure C2Click(Sender: TObject);
    procedure lbObsClienteAssociacaoChange(Sender: TObject);
    procedure PngSpeedButton7Click(Sender: TObject);
    procedure PngSpeedButton5Click(Sender: TObject);
    procedure PngSpeedButton6Click(Sender: TObject);
    procedure PngSpeedButton4Click(Sender: TObject);
    procedure PngSpeedButton3Click(Sender: TObject);
    procedure btAtualizarListaClick(Sender: TObject);
    procedure F1Click(Sender: TObject);
    procedure ckbApenasNaoLancadosClick(Sender: TObject);
    procedure PngSpeedButton11Click(Sender: TObject);
    procedure PngSpeedButton13Click(Sender: TObject);
    procedure PngSpeedButton14Click(Sender: TObject);
    procedure PngSpeedButton8Click(Sender: TObject);
  private
      { Private declarations }

    fecharAplicacao: Boolean;
    qtdItensCriados: Double;
    ComponentesDestruir: TStringList;
    tocandoMusica: Boolean;
    TokenIfood: string;
    LXPollingMerchant: string;
    ExpiracaoToken: TDateTime;
    PedidoPlataformaSelecionado: TPedidoPlataforma;
    CodigoClienteSelecionadoAsssociacao: string;
    codSelecionado: Integer;
    pgPedidosPlataformaAtiva: Boolean;

    LPoolingDesativado: boolean;

    procedure retornaDadosDoPedido(codPedido: string);
    procedure FinalizaFiltro(Sender: TObject);
    procedure AtualizaListaPedidosPlataformas;
    procedure mostraDetalhesPedido(IDPedido: LargeInt);
    procedure destruirListaComponentes;
    procedure criaPainelPedido(AIdentificador: string; AItemPlataforma: TProdutoPlataforma; ATipo: SmallInt);
    procedure mostraFormasPagamento(AIDPedido: Integer);
    procedure pararMusica;
    procedure ExecutaPollingIfood;
    procedure CienciaDoCancelamento(AIDPedido: largeint);
    procedure mostrarProdutosDoPedido(AIDPedido: largeint);
    procedure configuraBotoesDeIntegracaoPlataforma;
    procedure ProcessaConfirmacaoDoPedido(APedido: TPedidoPlataforma);
    procedure AbrirTelaDeIntegracaoDoCliente(APedido: TPedidoPlataforma);
    procedure selecionarRegistroPedidoPlataforma;
    function verificaSubtotalDoPedido: boolean;
    function verificaSeBairroDoPedidoEstaAssociado: Boolean;
    function verificaSePedidoPodeSerIntegrado: boolean;
    procedure NovoPedido(APedido: TPedidoPlataforma);
    procedure scrollTbPedidos(DataSet: TDataset);
    procedure DespachaPedidoPlataforma;
    procedure gerarMapaLocalizacaoCliente;
    function geraEnderecoClienteGMAPS: string;
    procedure gerarRotaEntregaPedido;
    function geraEnderecoLocal: string;
    procedure ReceberPedido(ACodigo: string);
    procedure DespacharPedidoIfood(AIDPedidoPlataforma: string);
    procedure RefreshAccessToken;
    procedure ConfirmarPedidoIfood(APedido: TPedidoPlataforma);
//    procedure getStatusLojaIfood;
    procedure CancelamentoPedidoIFood(APedido: TPedidoPlataforma; ACodigoCancelamento, AObservacoes: string);
    procedure AvisarPedidoProntoIFood(APedido: TPedidoPlataforma);
    procedure RefreshTokenValidate;
    procedure ExecutaPolling;
    procedure ReprocessarPedido(AidPedido: integer);
    procedure ConfirmarPedidoPrefiroDelivery(APedido: TPedidoPlataforma);
    function VerificaCodigosDeIntegracao: boolean;
    procedure EscondeLabelsTotais;
  public
     { Public declarations }
  end;

var
  frmExpedicaoDelivery: TfrmExpedicaoDelivery;

implementation

uses
  uu_data_module, uu_frm_principal, uu_encerramento, uu_cad_clientes_delivery,
  uuCadBairros, uuFrmIntegracoesBairro, uuFrmMotivoCancelamentoPlataformas,
  uuCorrecaoCodigosIntegracaoI;

{$R *.dfm}

procedure TfrmExpedicaoDelivery.btSairClick(Sender: TObject);
begin
  inherited;
  Close;
end;

procedure TfrmExpedicaoDelivery.btSomClick(Sender: TObject);
begin
{
  inherited;
  tmAlertaPedidosPlataforma.Enabled := False;
  if btSom.Tag = 1 then
  begin
    btSom.Tag := 0;
    btSom.PngImage.LoadFromFile(ApplicationPath + '\imagens\SomDesligado70.png');
    pararMusica();
    player.FileName := ApplicationPath + 'sons\somDesligado.wav';
  end
  else
  begin
    btSom.Tag := 1;
    btSom.PngImage.LoadFromFile(ApplicationPath + '\imagens\SomLigado70.png');
    player.FileName := ApplicationPath + 'sons\somLigado.wav';
    player.loop := False;
  end;
  player.play;

  tmAlertaPedidosPlataforma.Enabled := True;
 }
end;

procedure TfrmExpedicaoDelivery.ckbApenasNaoLancadosClick(Sender: TObject);
begin
  inherited;
  btAtualizarLista.Click;
end;

procedure TfrmExpedicaoDelivery.cxGrid1DBTableView1CellClick(Sender: TcxCustomGridTableView; ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton; AShift: TShiftState; var AHandled: Boolean);
var
  q: TIBQuery;
  hint: string;
  formatacao: string;
  tamStr: Integer;
  codPedido: string;
begin
  inherited;

  if dmExpedicaoDelivery.tbExpedicaoDelivery.IsEmpty = False then
  begin
    codPedido := dmExpedicaoDelivery.tbExpedicaoDelivery.fieldbyname('codigo').value;
    q := TIBQuery.create(Self);
    q.Database := dm.dbrestaurante;
    q.Transaction := dm.transacao;
    q.Active := False;
    q.SQL.clear;
    q.sql.Add('select r.*,f.descricao from recebimentos_delivery r ');
    q.sql.add(' inner join formas_pagamento f on (f.cod_forma = r.cod_forma)');
    q.SQL.add('where r.cod_pedido=' + QuotedStr(codPedido));
    q.sql.add(' order by r.cod_forma');
    q.Active := True;
    q.first;

    hint := 'Pedido ' + dmExpedicaoDelivery.tbExpedicaoDelivery.fieldbyname('codigo').value + #13 + #13 + 'Formas de Pagamento : ';
    q.first;
    while not q.Eof do
    begin
      hint := hint + #13;
      formatacao := formatoRodapeExtrato;
      formatacao := dm.organizarCupom(formatacao, q.Fieldbyname('descricao').value, '#');
      formatacao := dm.organizarCupom(formatacao, '', '*');
      formatacao := dm.organizarCupom(formatacao, '', '%');
      tamStr := alinhamentoDireitaTotal - Length(Trim(formatacao));
      formatacao := Trim(formatacao) + dm.alinha_valor_a_direita(tamStr, FormatFloat('R$ ###,###,##0.00 ', (q.Fieldbyname('valor').value)));

      hint := hint + formatacao;
      if (Trim(q.fieldbyname('numerocartao').value) <> '') then
      begin
        hint := hint + #13 + '   Operadora: ' + q.fieldbyname('operadoracartao').value;
        hint := hint + #13 + '   Nº cartão: ' + q.fieldbyname('numerocartao').value;
        hint := hint + #13 + '   Validade : ' + q.fieldbyname('validadecartao').value;
        hint := hint + #13 + '   Cod. Seg.: ' + q.fieldbyname('codigocartao').value;
      end;
      q.next;
    end;

    hint := hint + #13#13#13 + 'Endereço: ' + Trim(dmExpedicaoDelivery.tbExpedicaoDelivery.fieldbyname('endereco').value);
    hint := hint + #13 + 'Bairro:   ' + Trim(dmExpedicaoDelivery.tbExpedicaoDelivery.fieldbyname('descbairro').value);

    q.Active := False;
    q.SQL.Clear;
    q.sql.add('   select it.cod_produto, p.cod_barras, p.descricao, it.quantidade, ');
    q.sql.add('          it.valor_unitario, it.sabores, it.observacoes, ');
    q.sql.add('           udf_roundabnt( (it.valor_unitario  * it.quantidade ),2) as total ');
    q.sql.add('              from itens_pedido_delivery it ');
    q.sql.add('                 inner join produtos p on (p.cod_produto  = it.cod_produto)  ');
    q.sql.add('          where it.cod_pedido=' + QuotedStr(codPedido) + ' order by it.id');
    q.Active := True;
    hint := hint + sLineBreak;
    hint := hint + sLineBreak + '------------------------------------------------------';
    hint := hint + sLineBreak + '                   ITENS DO PEDIDO                    ';
    hint := hint + sLineBreak + '------------------------------------------------------' + sLineBreak;
    q.First;

    while not q.Eof do
    begin

      hint := hint + FormatFloat('#0.000', q.FieldByName('quantidade').Value) + '---' + q.FieldByName('descricao').Value;
      if (q.FieldByName('observacoes').Value <> '') then
      begin
        hint := hint + sLineBreak + 'Obs: ' + ReplaceString(q.FieldByName('observacoes').Value, sLineBreak, ' / ') + '';
      end;
      hint := hint + sLineBreak + '------------------------------------------------------' + sLineBreak;
      q.Next;
    end;

    cxGrid1.Hint := hint;
    cxGrid1.ShowHint := True;
    q.Active := False;
    FreeAndNil(q);
    timerDesabilitaHint.Enabled := True;
  end;

end;

procedure TfrmExpedicaoDelivery.cxGrid1DBTableView1Column11CustomDrawCell(Sender: TcxCustomGridTableView; ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
var
  APainter: TcxPainterAccess;
begin

  if dmExpedicaoDelivery.tbExpedicaoDelivery.IsEmpty then
    Exit;

  if not (AViewInfo.EditViewInfo is TcxCustomTextEditViewInfo) then
    Exit;

  APainter := TcxPainterAccess(TcxViewInfoAcess(AViewInfo).GetPainterClass.Create(ACanvas, AViewInfo));
  with APainter do
  begin
    try
      with TcxCustomTextEditViewInfo(AViewInfo.EditViewInfo).TextRect do
        Left := Left + cxImageList1.Width + 1;

      DrawContent;
      DrawBorders;

      case AnsiIndexStr(UpperCase((AViewInfo.GridRecord.Values[cxGrid1DBTableView1Column15.Index])), ['IFD', 'UBR', 'RAP', 'TBP']) of
        0:
          begin
            with AViewInfo.ClientBounds do
              cxImageList1.Draw(ACanvas.Canvas, Left + 1, Top + 1, 4);

          end;
        1:
          begin
            with AViewInfo.ClientBounds do
              cxImageList1.Draw(ACanvas.Canvas, Left + 1, Top + 1, 5);

          end;

        2:
          begin
            with AViewInfo.ClientBounds do
              cxImageList1.Draw(ACanvas.Canvas, Left + 1, Top + 1, 6);

          end;

        3:
          begin
            with AViewInfo.ClientBounds do
              cxImageList1.Draw(ACanvas.Canvas, Left + 1, Top + 1, 7);

          end;

      end;

    finally
      Free;
    end;
  end;
  ADone := True;
end;

procedure TfrmExpedicaoDelivery.cxGrid1DBTableView1Column5CustomDrawCell(Sender: TcxCustomGridTableView; ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
var
  APainter: TcxPainterAccess;
begin

  if dmExpedicaoDelivery.tbExpedicaoDelivery.IsEmpty then
    Exit;

  if not (AViewInfo.EditViewInfo is TcxCustomTextEditViewInfo) then
    Exit;

  APainter := TcxPainterAccess(TcxViewInfoAcess(AViewInfo).GetPainterClass.Create(ACanvas, AViewInfo));
  with APainter do
  begin
    try
      with TcxCustomTextEditViewInfo(AViewInfo.EditViewInfo).TextRect do
        Left := Left + cxImageList1.Width + 1;

      DrawContent;
      DrawBorders;

      case AViewInfo.GridRecord.Values[cxGrid1DBTableView1Column14.Index] of
        0:
          begin
            with AViewInfo.ClientBounds do
              cxImageList1.Draw(ACanvas.Canvas, Left + 1, Top + 1, 0);

          end;
        1:
          begin
            with AViewInfo.ClientBounds do
              cxImageList1.Draw(ACanvas.Canvas, Left + 1, Top + 1, 1);

          end;

        2:
          begin
            with AViewInfo.ClientBounds do
              cxImageList1.Draw(ACanvas.Canvas, Left + 1, Top + 1, 2);
          end;

        3:
          begin
            with AViewInfo.ClientBounds do
              cxImageList1.Draw(ACanvas.Canvas, Left + 1, Top + 1, 3);
          end;

      end;

    finally
      Free;
    end;
  end;
  ADone := True;

end;

procedure TfrmExpedicaoDelivery.cxGrid1DBTableView1Column5StylesGetContentStyle(Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord; AItem: TcxCustomGridTableItem; var AStyle: TcxStyle);
var
  AColumn: TcxGridDBColumn;
begin
  if dmExpedicaoDelivery.tbExpedicaoDelivery.IsEmpty = False then
  begin
    if (AItem as TcxGridDBColumn).DataBinding.FieldName = 'STATUS_PREPARO' then
    begin
      if ARecord.Values[16] = 2 then
      begin
        AStyle := cxStyle3;
      end;

      if ARecord.Values[16] = 1 then
      begin
        if ARecord.Values[17] >= spinTempo.value then
          AStyle := cxStyle4
        else
        begin
          if (((ARecord.Values[17] * 100) / spinTempo.Value) >= 80) then
          begin
            AStyle := cxStyle5;
          end;
        end;

      end;
    end;
  end;

end;

procedure TfrmExpedicaoDelivery.cxGrid1DBTableView1DblClick(Sender: TObject);
begin
  inherited;
  if dmExpedicaoDelivery.tbExpedicaoDelivery.FieldByName('status').Value = 1 then
  begin
    SAIDADOPEDIDO1.Click;
  end
  else
  begin
    RECEBEPEDIDO1.Click;
  end;

end;

procedure TfrmExpedicaoDelivery.dbgEntregadoresClick(Sender: TObject);
begin
  inherited;
  dmExpedicaoDelivery.EfetuaSaidaDoPedido(dmExpedicaoDelivery.tbExpedicaoDelivery.FieldByName('codigo').Value, dmExpedicaoDelivery.tbEntregadores.FieldByName('codigo').Value, dmExpedicaoDelivery.tbEntregadores.FieldByName('nome_entregador').Value);

  if (dmExpedicaoDelivery.tbExpedicaoDelivery.FieldByName('ID_PEDIDO_INTEGRACAO').Value <> 0) then
  begin
    if (StrToInt(dm.LeIni(2, 'INTEGRADOR_IFOOD', 'DESABILITAR_DEPACHO_AUTOMATICO')) = 0) then
      DespachaPedidoPlataforma;
  end;

  pgExpedicao.Show;
  tmAtualizaPedidosExpedicao.Enabled := True;
end;

procedure TfrmExpedicaoDelivery.DespachaPedidoPlataforma;
begin
  PedidoPlataformaSelecionado.idPedido := dmExpedicaoDelivery.tbExpedicaoDelivery.FieldByName('ID_PEDIDO_INTEGRACAO').Value;

  dm.getDadosDoPedido(PedidoPlataformaSelecionado);

  if (dmExpedicaoDelivery.tbExpedicaoDelivery.FieldByName('retira_balcao').Value = 1) then
  begin
    case PedidoPlataformaSelecionado.Plataforma.id of
      1:
        begin

          AvisarPedidoProntoIFood(PedidoPlataformaSelecionado);

        end;
    end;

  end
  else
  begin

    case PedidoPlataformaSelecionado.Plataforma.id of
      1:
        begin
          DespacharPedidoIfood(PedidoPlataformaSelecionado.idPedidoPlataforma);
        end;
    end;

  end;
end;

procedure TfrmExpedicaoDelivery.DespacharPedidoIfood(AIDPedidoPlataforma: string);
var
  LJsonRetorno: TStringList;
  LJsonALC: TALJSONNodeA;
  LData, LHora, LDataHora: string;
  LHeaders: Tstringlist;
  LBody: TStringList;
  LURLParam: string;
begin

  LJsonRetorno := TStringList.Create;
  LJsonALC := TALJSONDocumentA.Create;
  LHeaders := TStringList.Create;
  LHeaders.NameValueSeparator := '=';
  LBody := TStringList.Create;
  LBody.NameValueSeparator := '=';

  try
    try
      RefreshTokenValidate;
      dm.adicionaLog('(Despachar) O Token atual é : ' + sLineBreak + TokenIfood);
      LHeaders.Add('Authorization=Bearer ' + TokenIfood);
      LURLParam := AIDPedidoPlataforma;

      if dmExpedicaoDelivery.HTTPRequest(teDispatchIFood, LURLParam, LHeaders, LBody, LJsonRetorno, 3, 3, ctAPPLICATION_JSON) then
      begin

      end
      else
      begin
        LJsonRetorno.Text := dmExpedicaoDelivery.trataJsonInicial(LJsonRetorno.Text);
        dm.adicionaLog('Erro ao despachar o pedido no ifood');
        dm.adicionaLog('Headers : ' + LHeaders.Text);
        dm.adicionaLog('Body: ' + LBody.text);
        dm.adicionaLog(LJsonRetorno.Text);
        raise Exception.Create('Erro ao despachar o pedido no ifood');
      end;

    except
      on E: Exception do
      begin
        LJsonRetorno.Text := dmExpedicaoDelivery.trataJsonInicial(LJsonRetorno.Text);
        dm.adicionaLog('Erro ao despachar o pedido no ifood');
        dm.adicionaLog('Headers : ' + LHeaders.Text);
        dm.adicionaLog('Body: ' + LBody.text);
        dm.adicionaLog(LJsonRetorno.Text);
        raise Exception.Create('Erro ao despachar o pedido no ifood!' + E.Message);
      end;

    end;
  finally
    FreeAndNil(LJsonALC);
    FreeAndNil(LJsonRetorno);
    FreeAndNil(LHeaders);
    FreeAndNil(LBody);
  end;
end;

procedure TfrmExpedicaoDelivery.AvisarPedidoProntoIFood(APedido: TPedidoPlataforma);
var
  LJsonRetorno: TStringList;
  LJsonALC: TALJSONNodeA;
  LData, LHora, LDataHora: string;
  LHeaders: TStringList;
  LBody: Tstringlist;
  LURLParam: string;
  LRota: TTipoRota;
begin
  RefreshTokenValidate;
  LJsonRetorno := TStringList.Create;
  LJsonALC := TALJSONDocumentA.Create;
  LHeaders := TStringList.Create;
  LHeaders.NameValueSeparator := '=';

  LBody := TStringList.Create;
  LBody.NameValueSeparator := '=';

  if Now >= ExpiracaoToken then
  begin
    RefreshAccessToken;
  end;

  try
    try
      LHeaders.Add('Authorization=Bearer ' + TokenIfood);
      LURLParam := APedido.idPedidoPlataforma;

      if APedido.retirarNoLocal then
        LRota := teReadyToPickUP
      else
        LRota := teDispatchIFood;

      if dmExpedicaoDelivery.HTTPRequest(LRota, LURLParam, LHeaders, LBody, LJsonRetorno, 3, 3, ctAPPLICATION_JSON) then
      begin

      end
      else
      begin
        RefreshAccessToken;
        LJsonRetorno.Text := dmExpedicaoDelivery.trataJsonInicial(LJsonRetorno.Text);
        dm.adicionaLog('Erro ao marcar pedido como pronto para retirada no ifood!');
        dm.adicionaLog(LJsonRetorno.Text);

        raise Exception.Create('Erro ao marcar pedido como pronto para retirada no ifood!');
      end;

    except
      on E: Exception do
      begin
        RefreshAccessToken;
        dm.adicionaLog('Erro ao marcar pedido como pronto para retirada no ifood!');
        dm.adicionaLog(LJsonRetorno.Text);
        raise Exception.Create('Erro ao marcar pedido como pronto para retirada no ifood!' + E.Message);
      end;

    end;
  finally
    FreeAndNil(LJsonALC);
    FreeAndNil(LJsonRetorno);
    FreeAndNil(LBody);
    FreeAndNil(LHeaders);

  end;
end;

procedure TfrmExpedicaoDelivery.dbgEntregadoresPaintPanel(DBCtrlGrid: TDBCtrlGrid; Index: Integer);
begin
  inherited;
  dbgEntregadores.Canvas.Font.Size := 15;
  dbgEntregadores.Canvas.TextOut(0, 28, PadCenter(dmExpedicaoDelivery.tbEntregadores.FieldByName('nome_entregador').Value, 25, ' '));

end;

procedure TfrmExpedicaoDelivery.filtraPedidos();
var
  bookmark: TBookmark;
  LSQL: TStringList;
  SQL: string;
begin
  inherited;

  if ((dmExpedicaoDelivery.tbExpedicaoDelivery.IsEmpty = False) and (dmExpedicaoDelivery.tbExpedicaoDelivery.RecordCount > 0)) then
    codSelecionado := dmExpedicaoDelivery.tbExpedicaoDelivery.FieldByName('codInteiro').Value;
  btFiltraPedidos.Enabled := False;

  cxGrid1DBTableView1.DataController.DataSource := nil;

  cxGrid1.BeginUpdate();
  dmExpedicaoDelivery.tbExpedicaoDelivery.DisableControls;

  try
    try
      LSQL := TStringList.Create;
      LSQL.clear;
      LSQL.add(' SELECT  cast(p.codigo as bigint) as codInteiro, coalesce(cast(ip.id_reduzido_plataforma as varchar(6)),' + Quotedstr('-') + ') as idPlataforma,');
      LSQL.add('      p.codigo,p.cod_cliente,                                                                                                 ');
      LSQL.add('      P.valor_bruto,                                                                                                          ');
      LSQL.add('      P.valor_desconto,                                                                                                       ');
      LSQL.add('      P.valor_entrega,                                                                                                        ');
      LSQL.add('      p.valor_total, coalesce(ID_PEDIDO_INTEGRACAO,0) as ID_PEDIDO_INTEGRACAO,                                                 ');
      LSQL.add('       p.hora, c.nome,c.telefone,                                                                                             ');
      LSQL.add('      c.endereco, b.descricao as descBairro,                                                                                  ');
      LSQL.add('      hora_lancamento,hora_saida,nome_entregador,                                                                             ');
      LSQL.add('      p.retira_balcao,data_hora_entrega,                                                                                      ');
      LSQL.add('      CAST(p.data_hora_entrega AS TIME) AS hora_agendada,                                                                     ');
      LSQL.add('      status,                                                                                                                 ');
      LSQL.add('      u.login  as usuario,        tp.prefixo, tp.descricao as DescTabelaPreco,                                                ');
      LSQL.add('      CASE                                                                                                                    ');
      LSQL.add('        when   (p.status=0) then  ' + QuotedStr('Aguardando'));
      LSQL.add('        when   (p.status=1)  then ' + QuotedStr('Em preparo'));
      LSQL.add('        when   (p.status=2)  then ' + QuotedStr('Saiu com  ') + '||p.nome_entregador');
      LSQL.add('        when   (p.status=3)  then ' + QuotedStr('Recebido'));
      LSQL.add('      end as STATUS_PREPARO,                                                                                                  ');
      LSQL.add('                                                                                                                              ');

      LSQL.add('      CASE coalesce(p.nome_entregador,' + QuotedStr('0') + ')');
      LSQL.add('       WHEN  ' + QuotedStr('0') + ' THEN');
      LSQL.add('        udf_minutesbetween(p.hora_lancamento,current_timestamp) ||' + QuotedStr(' min'));
      LSQL.add('       else                                                                                                                   ');
      LSQL.add('         udf_minutesbetween( p.hora_saida,current_timestamp) ||' + QuotedStr(' min'));
      LSQL.add('      end as tempo,                                                                                                            ');

      LSQL.add('      CASE coalesce(p.nome_entregador,' + QuotedStr('0') + ')');
      LSQL.add('       WHEN  ' + QuotedStr('0') + ' THEN');
      LSQL.add('        udf_minutesbetween(p.hora_lancamento,current_timestamp) ');
      LSQL.add('       else                                                                                                                   ');
      LSQL.add('         udf_minutesbetween( p.hora_saida,current_timestamp)');
      LSQL.add('      end as minutos                                                                                                            ');

      LSQL.add('                                                                                                                              ');
      LSQL.add('                                                                                                                              ');
      LSQL.add('      FROM pedidos_delivery  p                                                                                                ');
      LSQL.add('      INNER JOIN clientes_delivery c ON (c.codigo = p.cod_cliente)                                                            ');
      LSQL.add('      INNER JOIN bairro b ON (b.codigo = c.cod_bairro)                                                                        ');
      LSQL.add('      INNER JOIN USUARIOS u on (u.cod_usuario = p.cod_usuario)                                                                ');
      LSQL.add('      inner join tabelas_preco tp on (tp.codigo = p.tabela_preco)                                                             ');
      LSQL.add('left join integracoes_pedidos ip on (ip.id = p.id_pedido_integracao)');
      case rdExibePedidos.ItemIndex of
        0:
          LSQL.add('      WHERE p.status in (0,1,2) ');
        1:
          LSQL.add('      WHERE p.status =0 ');
        2:
          LSQL.add('      WHERE p.status =1 ');
        3:
          LSQL.add('      WHERE p.status =2 ');
        4:
          LSQL.add('      WHERE p.status =3 ');
        5:
          LSQL.add('      WHERE p.status <> -1');
      end;

      if Trim(edNomeCliente.Text) <> '' then
      begin
        LSQL.add(' and ( c.nome like ' + QuotedStr(edNomeCliente.Text + '%') + ' or b.descricao like ' + QuotedStr(edNomeCliente.Text + '%') + ') ');
      end;

      case rdFiltro.ItemIndex of
        0:
          begin
            LSQL.add(' and data_hora_entrega between ');
            LSQL.add('' + QuotedStr(FormatDateTime('DD.MM.YYY', data_do_sistema) + ' ' + FormatDateTime('HH:MM', StrToTime(edHoraInicial.TEXT))) + ' and ');
            LSQL.add('' + QuotedStr(FormatDateTime('DD.MM.YYY', data_do_sistema) + ' ' + FormatDateTime('HH:MM', StrToTime(edHoraFinal.TEXT))) + '  ');
          end;

        1:
          begin
            LSQL.add(' and data_hora_entrega between   ');
            LSQL.add('' + QuotedStr(FormatDateTime('DD.MM.YYY', edDataEntrega.Date) + ' ' + FormatDateTime('HH:MM', StrToTime(edHoraInicial.TEXT))) + ' and ');
            LSQL.add('' + QuotedStr(FormatDateTime('DD.MM.YYY', edDataEntrega.Date) + ' ' + FormatDateTime('HH:MM', StrToTime(edHoraFinal.TEXT))) + '  ');
          end;

        2:
          begin

          end;
      end;

      case rdTipoEntrega.ItemIndex of
        1:
          begin
            LSQL.add(' and retira_balcao = 1');
          end;

        2:
          begin
            LSQL.add(' and retira_balcao = 0');
          end;
      end;

      case rdpOrdem.ItemIndex of
        0:
          begin
            LSQL.adD(' order by codigo');
          end;

        1:
          begin
            LSQL.adD(' order by nome');
          end;

        2:
          begin
            LSQL.adD(' order by nome_entregador');
          end;

        3:
          begin
            LSQL.adD(' order by tempo asc');
          end;

        4:
          begin
            LSQL.adD(' order by tempo desc');
          end;
      end;

      SQL := LSQL.Text;
      dm.adicionalog(LSQL.Text);
      dm.getMemTable(dmExpedicaoDelivery.tbExpedicaoDelivery, SQL);
    except
      on E: Exception do
      begin
        dm.exibe_painel_erro('Erro ao trazer os pedidos da expedição!' + sLineBreak + sLineBreak + E.Message, 'Ok');
        ////dm.adicionalog('Erro ao trazer os pedidos da expedição!' + sLineBreak + sLineBreak + E.Message);
      end;

    end;
  finally
    FreeAndNil(LSQL);
  end;

  FinalizaFiltro(self);

end;

procedure TfrmExpedicaoDelivery.FinalizaFiltro(sender: TObject);
var
  LSQL: TStringList;
  memTable: TFDMemTable;
begin

  LSQL := TStringList.Create;
  memTable := TFDMemTable.Create(Self);
  cxGrid1DBTableView1.DataController.DataSource := dmExpedicaoDelivery.dsQryExpedicaoDElivery;
  cxGrid1.EndUpdate;
  dmExpedicaoDelivery.tbExpedicaoDelivery.EnableControls;
  btFiltraPedidos.Enabled := True;

  try
    LSQL.Clear;
    LSQL.Add(' select count(*) as qtde, coalesce  (sum(ped.valor_total),0) as total              ');
    LSQL.Add('      from pedidos_delivery ped where ped.status < 3 and ped.data=' + QuotedStr(FormatDateTime('DD.MM.YYY', data_do_sistema)));
    LSQL.Add(' union all                                                                         ');
    LSQL.Add(' select count(*) as qtde, coalesce  (sum(ped.valor_total),0) as total              ');
    LSQL.Add('      from pedidos_delivery ped where ped.status = 3 and ped.data=' + QuotedStr(FormatDateTime('DD.MM.YYY', data_do_sistema)));
    LSQL.Add('  union all                                                                        ');
    LSQL.Add(' select count(*) as qtde, coalesce  (sum(ped.valor_total),0) as total              ');
    LSQL.Add('      from pedidos_delivery ped where ped.data=' + QuotedStr(FormatDateTime('DD.MM.YYY', data_do_sistema)));
    dm.getMemTable(memTable, LSQL.Text);

    lbQtdPedidosAbertos.Caption := ' ' + IntToStr(dmExpedicaoDelivery.tbExpedicaoDelivery.RecordCount);
    lbQtdPedidosAbertos.Caption := IntToStr(memTable.FieldByName('qtde').Value);
    lbTotalPedidosAbertos.Caption := FormatFloat('R$ ###,###,##0.00 ', memTable.FieldByName('total').Value);
    memTable.Next;

    lbQtdPedidosRecebidos.Caption := ' ' + IntToStr(memTable.FieldByName('qtde').Value);
    lbTotalPedidosRecebidos.Caption := FormatFloat('R$ ###,###,##0.00 ', memTable.FieldByName('total').Value);
    memTable.Next;

    lbQtdPedidosGeral.Caption := ' ' + IntToStr(memTable.FieldByName('qtde').Value);
    lbTotalPedidosGeral.Caption := FormatFloat('R$ ###,###,##0.00 ', memTable.FieldByName('total').Value);
    memTable.Active := False;
    dmExpedicaoDelivery.tbExpedicaoDelivery.Locate('codInteiro', codSelecionado, []);

    dm.getMemTable(memTable, 'select coalesce(p.tempo_prep_delivery,25) as tempo  from parametros p');
    spinTempo.Value := memTable.FieldByName('tempo').Value;

    LSQL.Clear;
    LSQL.Add(' select coalesce(avg( udf_minutesbetween(p.hora_lancamento, p.hora_saida)),0) as tempoMedio ');
    LSQL.Add('      from pedidos_delivery p ');
    LSQL.Add('       where p.data  =' + QuotedStr(FormatDateTime('DD.MM.YYY', data_do_sistema)));
    LSQL.Add(' and    p.status >=2 ');
    dm.getMemTable(memTable, LSQL.Text);
    lbTempoMedio.caption := IntToStr(memTable.FieldByName('tempoMedio').Value) + ' minutos';
    lbTempoMedio.Transparent := True;

    if (memTable.FieldByName('tempoMedio').Value > spinTempo.Value) then
    begin
      timerTempoPreparo.Enabled := True;

    end
    else
      timerTempoPreparo.Enabled := False;

  finally
    FreeAndNil(LSQL);
    memTable.Active := False;
    FreeAndNil(memTable);
  end;
end;

procedure TfrmExpedicaoDelivery.retornaDadosDoPedido(codPedido: string);
var
  codigoPedido: string;
var
  LQryConsulta: TIBQuery;
  Ltransacao: TIBTransaction;
begin

  Ltransacao := TIBTransaction.Create(nil);
  Ltransacao.Params.Add('read_committed');
  Ltransacao.Params.Add('rec_version');
  Ltransacao.Params.Add('nowait');

  Ltransacao.DefaultDatabase := dm.dbrestaurante;
  Ltransacao.Active := False;
  Ltransacao.Active := True;
  LQryConsulta := TIBQuery.Create(nil);
  LQryConsulta.Database := dm.dbrestaurante;
  LQryConsulta.Transaction := Ltransacao;

  try
    try
      LQryConsulta.sql.Clear;
      LQryConsulta.sql.add(' insert into movimento_mesa  (cod_mesa,id,cod_produto,cod_garcon,cod_movimento,numero_caixa,');
      LQryConsulta.sql.add('                                       quantidade, total, cod_usuario, hora_lancamento,');
      LQryConsulta.sql.add('                                       hora_entrega, estado, desconto, valor_unitario, obs)');
      LQryConsulta.sql.add('            select ' + QuotedStr(mesaDelivery) + ',mv.id,mv.cod_produto,mv.cod_garcon,mv.cod_movimento,mv.numero_caixa,');
      LQryConsulta.sql.add('                                      mv.quantidade, mv.total, mv.cod_usuario, mv.hora_lancamento,');
      LQryConsulta.sql.add('                                       mv.hora_entrega, mv.estado, mv.desconto, mv.valor_unitario, mv.obs');
      LQryConsulta.sql.add('                                       from itens_pedido_delivery mv where mv.cod_pedido=' + QuotedStr(codPedido));
      ////dm.adicionalog(LQryConsulta.SQL.Text);
      try
        begin
          LQryConsulta.ExecSQL;
        end;
      except
        begin
          dm.cria_log_de_erros(LQryConsulta.sql, 'Caixa - Restaurante ', 'Erro ao  gravar itens do pedido do delivery ', codigo_usuario);
          Exit;
        end;
      end;

      LQryConsulta.Active := False;
      LQryConsulta.SQL.clear;
      LQryConsulta.SQL.Add('        insert into sabores_pizza_movimento_mesa  (id,cod_mesa, cod_produto, cod_sabor, valor_unitario_sabor,  ');
      LQryConsulta.SQL.Add('           quantidade,id_mov_mesa,proporcao,descricao,desconto) ');
      LQryConsulta.SQL.Add('            select id,sb.cod_mesa  , sb.cod_produto, sb.cod_sabor, sb.valor_unitario_sabor, sb.quantidade,sb.id_mov_mesa, ');
      LQryConsulta.SQL.Add('                           sb.proporcao,sb.descricao,sb.desconto ');
      LQryConsulta.SQL.Add('              from sabores_pizza_pedido_delivery   sb ');
      LQryConsulta.SQL.Add('                     where  sb.cod_pedido =' + QuotedStr(codPedido));
      dm.adicionaLog(LQryConsulta.sql.Text);
      LQryConsulta.ExecSQL;

      LQryConsulta.Active := False;
      LQryConsulta.SQL.clear;
      LQryConsulta.sql.Add('  insert into recebimento_parcial (mesa,cod_forma,valor,cod_usuario, cod_cli_faturamento, obs_faturamento)');
      LQryConsulta.sql.Add('      select ' + QuotedStr(mesaDelivery) + ',  rd.cod_forma, rd.valor, rd.cod_usuario, rd.cod_cli_faturamento, rd.obs_faturamento   from  recebimentos_delivery rd ');
      LQryConsulta.sql.add('      where rd.cod_pedido=' + QuotedStr(codPedido));
      dm.adicionaLog(LQryConsulta.sql.Text);

      LQryConsulta.ExecSQL;
      Ltransacao.Commit;

    except
      on E: Exception do
      begin
        dm.exibe_painel_erro('Erro ao retornar os dados do pedido para a tabela de movimento!', 'Ok');
      end;
    end;

  finally
    LQryConsulta.Active := False;
    Ltransacao.Active := False;
    FreeAndNil(LQryConsulta);
    FreeAndNil(Ltransacao);
  end;

  dm.transacao.Commit;
  dm.transacao.Active := False;
  dm.transacao.Active := True;

end;

procedure TfrmExpedicaoDelivery.FormActivate(Sender: TObject);
begin
  inherited;
  LPoolingDesativado := false;
  edDataEntrega.Date := data_do_sistema;
  edDataPedidosPlataforma.Date := Date;
  edHoraInicial.Text := '00:00';
  edHoraFinal.Text := '23:59';
  tmAtualizaPedidosExpedicao.Enabled := True;
//  frmExpedicaoDelivery.Top := 0;
  muda_acao(1);

  lbNomeUsuario.Caption := nome_completo_usuario;
  lbNumeroEstacao.Caption := numero_caixa;
  lbDataSistema.Caption := FormatDateTime('DD/MM/YY', data_do_sistema);
  EscondeLabelsTotais;

  if (dm.verificaPermissaoAcao('B20003008', False, False) = True) then
  begin
    lbQtdPedidosAbertos.Visible := True;
    lbQtdPedidosRecebidos.Visible := True;
    lbQtdPedidosGeral.Visible := True;

  end;

  if (dm.verificaPermissaoAcao('B20003009', False, False) = True) then
  begin

    lbTotalPedidosAbertos.Visible := True;
    lbTotalPedidosRecebidos.Visible := True;
    lbTotalPedidosGeral.Visible := True;
  end;

  pgExpedicao.Show;
  btFiltraPedidos.Click;

end;

procedure TfrmExpedicaoDelivery.EscondeLabelsTotais;
begin

  lbQtdPedidosAbertos.Visible := false;
  lbQtdPedidosRecebidos.Visible := false;
  lbQtdPedidosGeral.Visible := false;

  lbTotalPedidosAbertos.Visible := false;
  lbTotalPedidosRecebidos.Visible := false;
  lbTotalPedidosGeral.Visible := false;
end;

procedure TfrmExpedicaoDelivery.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;

  if plControle.ActivePage <> pgExpedicao then
    Action := caNone;

  if btFiltraPedidos.Enabled = False then
    Action := caNone;

  FreeAndNil(scrollPedidos);
end;

procedure TfrmExpedicaoDelivery.FormCreate(Sender: TObject);
begin
  inherited;
  pgPedidosPlataformaAtiva := False;
  PedidoPlataformaSelecionado := TPedidoPlataforma.Create;
  Application.CreateForm(TdmExpedicaoDelivery, dmExpedicaoDelivery);
  cxSetResourceString(@scxGridGroupByBoxCaption, 'Arraste o título da coluna que deseja agrupar para esta caixa');
  cxSetResourceString(@scxGridNoDataInfoText, 'Sem dados para exibir!');
  tmAlertaPedidosPlataforma.Enabled := true;
  //WebView1.BrowserFolder := ExtractFilePath(Application.ExeName) + 'edge\';

  lbNomeCliente.caption := '';
  lbEnderecoCliente.caption := '';
  lbObservacoesEntrega.caption := '';
  lbNumeroPedidoCliente.Caption := '';
  lbNomeLoja.caption := '';
  lbBairro.caption := '';
end;

procedure TfrmExpedicaoDelivery.FormDestroy(Sender: TObject);
begin
  inherited;
  tmPoling.Enabled := False;
  tmAtualizaPedidosExpedicao.Enabled := False;
  tmAlertaPedidosPlataforma.Enabled := False;

  FreeAndNil(PedidoPlataformaSelecionado);
  FreeAndNil(dmExpedicaoDelivery);
end;

procedure TfrmExpedicaoDelivery.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  inherited;
  if Key = VK_ESCAPE then
    Close;
  if Key = VK_F5 then
  begin
    filtraPedidos;
  end;

  if Key = VK_F1 then
  begin
    btNovoPedido.Click;
  end;

  if Key = VK_F2 then
  begin
    btClientes.Click;
  end;

  if Key = VK_F3 then
  begin
    btBairros.Click;
  end;

  if Key = VK_F4 then
  begin
    btConsultarPedido.Click;
  end;

end;

procedure TfrmExpedicaoDelivery.gridConsultaClientesDBTableView1CellClick(Sender: TcxCustomGridTableView; ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton; AShift: TShiftState; var AHandled: Boolean);
begin
  inherited;
  CodigoClienteSelecionadoAsssociacao := dmExpedicaoDelivery.tbCsClientesDelivery.FieldByName('codigo').Value;
end;

procedure TfrmExpedicaoDelivery.gridPlataformasDBTableView1CellClick(Sender: TcxCustomGridTableView; ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton; AShift: TShiftState; var AHandled: Boolean);
begin
  selecionarRegistroPedidoPlataforma();
end;

procedure TfrmExpedicaoDelivery.selecionarRegistroPedidoPlataforma();
begin
  if Assigned(PedidoPlataformaSelecionado) then
    FreeAndNil(PedidoPlataformaSelecionado);

  PedidoPlataformaSelecionado := TPedidoPlataforma.Create;

  tmPoling.Enabled := False;
  PedidoPlataformaSelecionado.idPedido := dmExpedicaoDelivery.tbPolling.FieldByName('id').Value;
  dm.getDadosDoPedido(PedidoPlataformaSelecionado);
  configuraBotoesDeIntegracaoPlataforma;
  mostraDetalhesPedido(PedidoPlataformaSelecionado.idPedido);
  verificaSePedidoPodeSerIntegrado();
//  AtualizaListaPedidosPlataformas;
  tmPoling.Enabled := true;

end;

function TfrmExpedicaoDelivery.verificaSubtotalDoPedido: boolean;
begin
  Result := true;
  if dm.verificaSubtotalPedidoPlataforma(PedidoPlataformaSelecionado) = False then
  begin
    dm.exibe_painel_erro('A soma dos produtos do pedido diferem do subtotal do pedido! ' + sLineBreak + sLineBreak + ' Verifique os códigos dos produtos associados no site da plataforma. ', 'Ok');
    result := false;
  end;

end;

function TfrmExpedicaoDelivery.verificaSeBairroDoPedidoEstaAssociado(): Boolean;
var
  LStatusTMAtualizaPedidos, LStatusTMTempoPreparo, LStatusTMAlertaPedidos, LStatusTMPolling: Boolean;
begin
  result := true;
  if PedidoPlataformaSelecionado.CodBairroSistema = 0 then
  begin
//    dm.exibe_painel_erro('Bairro do cliente não está associado nas configurações de integração!', 'Ok');

    LStatusTMAtualizaPedidos := tmAtualizaPedidosExpedicao.Enabled;
    LStatusTMTempoPreparo := timerTempoPreparo.Enabled;
    LStatusTMAlertaPedidos := tmAlertaPedidosPlataforma.Enabled;
    LStatusTMPolling := tmPoling.Enabled;

    tmAtualizaPedidosExpedicao.Enabled := False;
    timerTempoPreparo.Enabled := false;
    tmAlertaPedidosPlataforma.Enabled := false;
    tmPoling.Enabled := false;

    if (ShowRealDialog(Self, tmConfirmacao, 'Confirme', 'O bairro do cliente não está associado a nenhum bairro cadastrado no sistema.' + sLineBreak + sLineBreak + 'Deseja abrir as configurações de integração ?', 16) = teSim) then
    begin

      if (dm.verificaPermissaoAcao('I99000002', False, true) = True) then
      begin
        Application.CreateForm(TfrmConfigIntegracoes, frmConfigIntegracoes);
        frmConfigIntegracoes.ShowModal;
        frmConfigIntegracoes.free;
      end;
    end;

    tmAtualizaPedidosExpedicao.Enabled := LStatusTMAtualizaPedidos;
    timerTempoPreparo.Enabled := LStatusTMTempoPreparo;
    tmAlertaPedidosPlataforma.Enabled := LStatusTMAlertaPedidos;
    tmPoling.Enabled := LStatusTMPolling;
    Result := false;
  end;
end;

function TfrmExpedicaoDelivery.verificaSePedidoPodeSerIntegrado(): boolean;
begin
  result := true;

  if VerificaCodigosDeIntegracao = false then
  begin
    ShowRealDialog(frm_principal, tmAviso, 'Erro de integração.', 'O sistema detectou produtos sem código de integração válidos nesse pedido. Corrija-os na tela a seguir!');
    Application.CreateForm(TfrmCorrecaoCodigosIntegracao, frmCorrecaoCodigosIntegracao);
    frmCorrecaoCodigosIntegracao.setPage(0, PedidoPlataformaSelecionado.idPedido, '');
    frmCorrecaoCodigosIntegracao.showmodal;
    frmCorrecaoCodigosIntegracao.free;
    Result := False;
    exit;
  end;

  if verificaSubtotalDoPedido = False then
  begin
    Result := False;
    exit;
  end;

  if verificaSeBairroDoPedidoEstaAssociado = false then
  begin
    Result := False;
    exit;
  end;

end;

function TfrmExpedicaoDelivery.VerificaCodigosDeIntegracao(): boolean;
var
  LSQL: TStringList;
begin
  LSQL := TStringList.Create;

  try
    LSQL.Add('select pd.id, ip.nome, pd.cod_produto, pd.quantidade, pd.preco,pd.total_item');
    LSQL.Add(' from integracoes_produtos_pedido pd');
    LSQL.Add(' left join integracoes_produtos ip on (ip.id = pd.id_produto)');
    LSQL.Add(' where pd.id_pedido=' + Inttostr(PedidoPlataformaSelecionado.idPedido));
    LSQL.Add(' and (pd.cod_produto = ' + Quotedstr('') + ' or ');
    LSQL.Add(' pd.cod_produto not in (select cod_barras from produtos p) ');
    LSQL.Add(' and pd.cod_produto not in (' + Quotedstr('OBS') + ',' + Quotedstr('IGNORAR') + '))');

    dm.adicionaLog(LSQL.text);
    dm.getMemTable(dmExpedicaoDelivery.tbCorrecaoCodigos, LSQL.Text);
    result := dmExpedicaoDelivery.tbCorrecaoCodigos.isempty;

  finally
    FreeAndNil(LSQL);
  end;
end;

procedure TfrmExpedicaoDelivery.gridPlataformasDBTableView1Column2CustomDrawCell(Sender: TcxCustomGridTableView; ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
var
  APainter: TcxPainterAccess;
begin

  if dmExpedicaoDelivery.tbPolling.IsEmpty then
    Exit;

  if not (AViewInfo.EditViewInfo is TcxCustomTextEditViewInfo) then
    Exit;

  APainter := TcxPainterAccess(TcxViewInfoAcess(AViewInfo).GetPainterClass.Create(ACanvas, AViewInfo));
  with APainter do
  begin
    try
      with TcxCustomTextEditViewInfo(AViewInfo.EditViewInfo).TextRect do
        Left := Left + cxImageList1.Width + 1;

      DrawContent;
      DrawBorders;

      case AViewInfo.GridRecord.Values[colStatusInt.Index] of
        0:
          begin
            if AViewInfo.GridRecord.Values[confirmado.Index] = 0 then
            begin
              with AViewInfo.ClientBounds do
                cxImageListPedidosPlataforma.Draw(ACanvas.Canvas, Left + 1, Top + 1, 0);
            end
            else
            begin
              with AViewInfo.ClientBounds do
                cxImageListPedidosPlataforma.Draw(ACanvas.Canvas, Left + 1, Top + 1, 1);
            end;

          end;
        1:
          begin
            with AViewInfo.ClientBounds do
              cxImageListPedidosPlataforma.Draw(ACanvas.Canvas, Left + 1, Top + 1, 1);

          end;

        2:
          begin
            with AViewInfo.ClientBounds do
              cxImageListPedidosPlataforma.Draw(ACanvas.Canvas, Left + 1, Top + 1, 2);
          end;

        3:
          begin
            with AViewInfo.ClientBounds do
              cxImageListPedidosPlataforma.Draw(ACanvas.Canvas, Left + 1, Top + 1, 3);
          end;

        4:
          begin
            with AViewInfo.ClientBounds do
              cxImageListPedidosPlataforma.Draw(ACanvas.Canvas, Left + 1, Top + 1, 4);
          end;

        5:
          begin
            with AViewInfo.ClientBounds do
              cxImageListPedidosPlataforma.Draw(ACanvas.Canvas, Left + 1, Top + 1, 4);
          end;

      end;

    finally
      Free;
    end;
  end;
  ADone := True;

end;

procedure TfrmExpedicaoDelivery.gridPlataformasDBTableView1KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  inherited;
  selecionarRegistroPedidoPlataforma();
end;

procedure TfrmExpedicaoDelivery.gridPlataformasDBTableView1KeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  inherited;
  selecionarRegistroPedidoPlataforma();
end;

procedure TfrmExpedicaoDelivery.gridPlataformasDBTableView1StylesGetContentStyle(Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord; AItem: TcxCustomGridTableItem; var AStyle: TcxStyle);
begin
  inherited;
  if dmExpedicaoDelivery.tbPolling.IsEmpty = False then
  begin

    case AnsiIndexStr(UpperCase((IntToStr(ARecord.Values[cancelado.Index]))), ['0', '1']) of
      1:
        AStyle := stCancelada;
    end;

    case AnsiIndexStr(UpperCase((IntToStr(ARecord.Values[StatusIntegracaoSistema.Index]))), ['0', '1']) of
      1:
        AStyle := stConfirmada;
    end;

  end;

end;

procedure TfrmExpedicaoDelivery.ckbNaoAssociadosClick(Sender: TObject);
begin
  inherited;
  AtualizaListaPedidosPlataformas;
end;

procedure TfrmExpedicaoDelivery.ckbOrdemClick(Sender: TObject);
begin
  inherited;
  AtualizaListaPedidosPlataformas;
end;

procedure TfrmExpedicaoDelivery.configuraBotoesDeIntegracaoPlataforma();
var
  pedidoConfirmadoNaPlataforma, pedidoCanceladoNaPlataforma: Boolean;
  StatusDeIntegracaoNoSistema: SmallInt;
begin
  inherited;
  itCienciaCancelamento.Visible := False;
  itConfirmarPedido.Visible := False;
  itRejeitarPedido.Visible := False;
  itCienciaCancelamento.Visible := False;

  pedidoConfirmadoNaPlataforma := False;
  pedidoCanceladoNaPlataforma := False;
  pedidoConfirmadoNaPlataforma := StrToBool(IntToStr(dmExpedicaoDelivery.tbPolling.FieldByName('confirmado').Value));
  pedidoCanceladoNaPlataforma := StrToBool(IntToStr(dmExpedicaoDelivery.tbPolling.FieldByName('cancelado').Value));
  StatusDeIntegracaoNoSistema := dmExpedicaoDelivery.tbPolling.FieldByName('STATUS_INTEGRACAO_SISTEMA').Value;

  if ((pedidoConfirmadoNaPlataforma = False) and (pedidoCanceladoNaPlataforma = False)) then
  begin
    itConfirmarPedido.Visible := True;
    itRejeitarPedido.Visible := false;
  end
  else
  begin
    if (pedidoCanceladoNaPlataforma = True) then
    begin
      itRejeitarPedido.Visible := False;
      itConfirmarPedido.Visible := False;
      itCienciaCancelamento.Visible := True;
    end
    else
    begin
      if (pedidoConfirmadoNaPlataforma = True) then
      begin
        if (StatusDeIntegracaoNoSistema = 0) then
        begin
          itConfirmarPedido.Visible := True;
          itRejeitarPedido.Visible := false;
        end
        else
        begin
          itConfirmarPedido.Visible := False;
          itRejeitarPedido.Visible := false;
        end
      end;
    end;
  end;
end;

procedure TfrmExpedicaoDelivery.itCienciaCancelamentoClick(Sender: TObject);
begin
  inherited;
  CienciaDoCancelamento(dmExpedicaoDelivery.tbPolling.FieldByName('id').Value);
end;

procedure TfrmExpedicaoDelivery.itConfirmarPedidoClick(Sender: TObject);
begin
  inherited;
  try

    if PedidoPlataformaSelecionado.StatusIntegracaoAtual = 0 then
    begin
      try
        ProcessaConfirmacaoDoPedido(PedidoPlataformaSelecionado);
      finally

      end;
    end
    else
    begin
      ShowRealDialog(self, tmAviso, 'Pedido já integrado', 'Este pedido já foi lançado!');
    end;

  finally

  end;

end;

procedure TfrmExpedicaoDelivery.ProcessaConfirmacaoDoPedido(APedido: TPedidoPlataforma);
var
  LSQL: TStringList;
  tbAux: TFDMemTable;
begin

  LSQL := TStringList.Create;
  tbAux := TFDMemTable.Create(Self);

  try

    try

      if APedido.confirmado = False then
      begin
        case APedido.Plataforma.id of
          1:
            begin
              dm.adicionaLog('Vai confirmar o pedido no ifood...');
              ConfirmarPedidoIfood(APedido);
              dm.adicionaLog('Confirmou o pedido no ifood');
              dm.getDadosDoPedido(APedido);
            end;
          2:
            begin
              ConfirmarPedidoPrefiroDelivery(APedido);
            end;

        end;

      end;

      if ((APedido.confirmado = True) and (APedido.cancelado = False) and (APedido.clienteIntegrado = False)) then
      begin

        if (APedido.bairroIntegrado = False) then
        begin
          dm.exibe_painel_erro('Bairro do cliente ainda não foi integrado na plataforma. Verifique as configurações de integração!', 'Ok');
          Exit;
        end;

        AbrirTelaDeIntegracaoDoCliente(APedido);
      end
      else
      begin
        if APedido.retirarNoLocal = false then
          dmExpedicaoDelivery.AtualizaCadastroDoCLiente(APedido);

        if (APedido.cancelado = True) then
        begin
          dm.exibe_painel_erro('Pedido já foi cancelado e não pode ser integrado!', 'Ok');
          Exit;
        end;

        if (APedido.confirmado = False) then
        begin
          dm.exibe_painel_erro('Pedindo ainda não foi confirmado na plataforma de integração!', 'Ok');
          Exit;
        end;

        if verificaSePedidoPodeSerIntegrado = false then
          exit;
//        ShowMessage('Verificação Ok. Cliente já associado! Falta apenas integrar o pedido.');
        NovoPedido(PedidoPlataformaSelecionado);
        AtualizaListaPedidosPlataformas;

      end;
    except
      on E: Exception do
      begin
        dm.exibe_painel_erro('Ocorreu um erro processamento da integração do pedido!' + sLineBreak + sLineBreak + E.Message, 'Ok');
        raise Exception.Create('Error Message');

      end
    end;
  finally
    tbAux.Close;
    FreeAndNil(LSQL);
    FreeAndNil(tbAux);
    itConfirmarPedido.visible := false;
    itRejeitarPedido.Visible := False;

  end

end;

procedure TfrmExpedicaoDelivery.AbrirTelaDeIntegracaoDoCliente(APedido: TPedidoPlataforma);
var
  LSQL: TStringList;
  StrSplit: TStringList;
  tbAux: TFDMemTable;
  primeiroNomeCliente: string;
  SegundaPalavraEndereco: string;
  numeroEndereco: string;
  i: Integer;
begin

  LSQL := TStringList.Create;
  tbAux := TFDMemTable.Create(Self);
  StrSplit := TStringList.Create;

  try

    try
      LSQL.Clear;
      LSQL.Add('Atenção');

      LSQL.Add('O cliente selecionado não possui cadastro associado ao sistema.');
      LSQL.Add(' Na tela a seguir o sistema apresentará sugestões de associação de cadastro,');
      LSQL.Add('permitindo que você altere os dados da consulta como quiser.');
      LSQL.Add(sLineBreak);
      LSQL.Add(' Se preferir não associar o cliente, clique no botão "Cliente sem cadastro" ');
      LSQL.Add(' e o sistema realizará o cadastro automatico do cliente');
      dm.exibe_painel_erro(LSQL.Text, 'Entendi a informação');

      edNomeClienteConsulta.Text := '';
      edEnderecoConsultaBairro.Text := '';
      edEnderecoConsultaCliente.Text := '';
      edNumeroConsultaAssociacao.Text := '';
      CodigoClienteSelecionadoAsssociacao := '';

      StrSplit.Clear;
      StrSplit.Delimiter := ' ';
      StrSplit.StrictDelimiter := True;
      StrSplit.DelimitedText := lbNomeCliente.Caption;
      primeiroNomeCliente := StrSplit[0];

      StrSplit.Clear;
      StrSplit.Delimiter := ' ';
      StrSplit.StrictDelimiter := True;
      StrSplit.DelimitedText := lbEnderecoCliente.Caption;
      if StrSplit.count > 1 then
        SegundaPalavraEndereco := RemoveString(',', StrSplit[1]);

      for i := 0 to StrSplit.Count - 1 do
      begin
        if StrIsNumber(StrSplit[i]) then
          numeroEndereco := StrSplit[i];
      end;

      edNomeClienteConsulta.Text := primeiroNomeCliente;
      edEnderecoConsultaCliente.text := SegundaPalavraEndereco;
      edEnderecoConsultaBairro.Text := APedido.NomeBairroSistema;
      edNumeroConsultaAssociacao.Text := numeroEndereco;
      pgAssociacaoCliente.Show;

    except
      on E: Exception do
      begin
        dm.exibe_painel_erro('Erro ao chamar tela de integração do cliente!' + sLineBreak + sLineBreak + E.Message, 'Ok');
        raise Exception.Create(e.Message);
      end
    end;
  finally
    tbAux.Close;
    FreeAndNil(LSQL);
    FreeAndNil(StrSplit);
    FreeAndNil(tbAux);
  end

end;

procedure TfrmExpedicaoDelivery.C2Click(Sender: TObject);
var
  LJson: string;
begin
  LJson := dmExpedicaoDelivery.tbPolling.FieldByName('json_pedido').Value;
//  LJson := dm.FormatJSON(LJson);
  Clipboard.AsText := LJson;
  Application.CreateForm(TfrmCorrecaoCodigosIntegracao, frmCorrecaoCodigosIntegracao);
  frmCorrecaoCodigosIntegracao.setPage(1, PedidoPlataformaSelecionado.idPedido, LJson);
  frmCorrecaoCodigosIntegracao.showmodal;
  frmCorrecaoCodigosIntegracao.free;
//  ShowRealDialog(frm_principal, tmSucesso, 'Sucesso', 'JSON copiado para a área de trabalho!');
end;


    {
procedure TfrmExpedicaoDelivery.getStatusLojaIfood();
var
  LJsonRetorno: TStringList;
  LJsonALC: TALJSONDocumentA;
  LData, LHora, LDataHora: string;
  LHeaders: TScWebHeaderCollection;
  LBody: string;
  LURLParam: string;
  LStatusLoja: string;
  LMensagem: string;
begin

  LJsonRetorno := TStringList.Create;
  LJsonALC := TALJSONDocumentA.Create(false);
  LHeaders := TScWebHeaderCollection.Create;
  LBody := '';

  try
    try
      LHeaders.Add('Authorization', 'Bearer ' + TokenIfood);
//      LHeaders.Add('merchantId ', LXPollingMerchant);
      LURLParam := LXPollingMerchant;

      if dmExpedicaoDelivery.HTTPRequest(teStatusIfood, LURLParam, LHeaders, LBody, LJsonRetorno) then
      begin
        LJsonALC.LoadFromJSONString(dmExpedicaoDelivery.trataJsonInicial(LJsonRetorno.text));
        LStatusLoja := trim(LJsonALC.childnodes['RES'].childnodes[0].childnodes['state'].text);
        LMensagem := trim(LJsonALC.childnodes['RES'].childnodes[0].childnodes['message'].childnodes['title'].text);
        LMensagem := LMensagem + ' ( ' + (LJsonALC.childnodes['RES'].childnodes[0].childnodes['message'].childnodes['subtitle'].text) + ' )';
        if LStatusLoja = 'OK' then
        begin
          lbStatusIfood.caption := 'IFood - Loja aberta';
          spStatusIfood.brush.Color := clLime;
        end
        else
        begin
          lbStatusIfood.caption := 'IFood - ' + LMensagem;
          spStatusIfood.brush.Color := clRed;
        end;

      end
      else
      begin
        lbStatusIfood.caption := 'IFood - ' + LMensagem;
        spStatusIfood.brush.Color := clRed;
      end;

    except
      on E: Exception do
      begin
        lbStatusIfood.caption := 'IFood - (Erro ao obter status da loja)';
        spStatusIfood.brush.Color := clRed;
      end;

    end;
  finally
    FreeAndNil(LJsonALC);
    FreeAndNil(LJsonRetorno);
    FreeAndNil(LHeaders);
  end;
end;
   }

procedure TfrmExpedicaoDelivery.CienciaDoCancelamento(AIDPedido: largeint);
begin
  dm.executaSQL('update INTEGRACOES_PEDIDOS set ciencia_cancelamento=1, cancelado=1 where id=' + IntToStr(AIDPedido));
  pararMusica();
end;

procedure TfrmExpedicaoDelivery.CancelamentoPedidoIFood(APedido: TPedidoPlataforma; ACodigoCancelamento: string; AObservacoes: string);
var
  LJsonRetorno: TStringList;
  LJsonALC: TALJSONNodeA;
  LData, LHora, LDataHora: string;
  LHeaders: TStringList;
  LBody: TStringList;
  LURLParam: string;
begin

  LJsonRetorno := TStringList.Create;
  LJsonALC := TALJSONDocumentA.Create;

  LBody := TStringList.Create;
  LBody.NameValueSeparator := '=';

  LHeaders := TStringList.Create;
  LHeaders.NameValueSeparator := '=';

  LBody.Add('[{"reason": ":vpObs",  "cancellationCode": ":vpCancelCode" }]');

  try
    try
      LHeaders.Add('Authorization=Bearer ' + TokenIfood);
      LURLParam := APedido.idPedidoPlataforma;
      LBody.Text := StringReplace(LBody.text, ':vpObs', AObservacoes, [rfReplaceAll, rfIgnoreCase]);
      LBody.Text := StringReplace(LBody.text, ':vpCancelCode', ACodigoCancelamento, [rfReplaceAll, rfIgnoreCase]);

      if dmExpedicaoDelivery.HTTPRequest(teCancelOrderIfood, LURLParam, LHeaders, LBody, LJsonRetorno, 4, 4, ctAPPLICATION_JSON) then
      begin
//        dm.executaSQL('update integracoes_pedidos p set p.confirmado=1 where p.id=' + IntToStr(APedido.idPedido));
      end
      else
      begin
        LJsonRetorno.Text := dmExpedicaoDelivery.trataJsonInicial(LJsonRetorno.Text);
        dm.adicionaLog('Erro ao cancelar o pedido no ifood');
        dm.adicionaLog(LJsonRetorno.Text);
        raise Exception.Create('Erro ao cancelar o pedido no ifood!');
      end;

    except
      on E: Exception do
      begin
        //AddLogErros('Erro ao requisitar json do pedido! ' + sLineBreak + 'Id do Evento: ' + AOrder.IDPlataforma + sLineBreak + 'Erro: ' + E.Message);
        raise Exception.Create('Erro ao cancelar o pedido no ifood!' + E.Message);
      end;

    end;
  finally
    FreeAndNil(LJsonALC);
    FreeAndNil(LJsonRetorno);
    FreeAndNil(LHeaders);
    FreeAndNil(LBody);
  end;
end;

procedure TfrmExpedicaoDelivery.ConfirmarPedidoPrefiroDelivery(APedido: TPedidoPlataforma);
var
  LJsonRetorno: TStringList;
  LJsonALC: TALJSONNodeA;
  LData, LHora, LDataHora: string;
  LHeaders: TStringList;
  LBody: TStringList;
  LURLParam: string;
begin

  LJsonRetorno := TStringList.Create;
  LJsonALC := TALJSONDocumentA.Create;

  LBody := TStringList.Create;
  LBody.NameValueSeparator := '=';

  LHeaders := TStringList.Create;
  LHeaders.NameValueSeparator := '=';

  try
    try

      APedido.confirmado := True;
      dm.executaSQL('update integracoes_pedidos p set p.confirmado=1 where p.id=' + IntToStr(APedido.idPedido));

    except
      on E: Exception do
      begin
        //AddLogErros('Erro ao requisitar json do pedido! ' + sLineBreak + 'Id do Evento: ' + AOrder.IDPlataforma + sLineBreak + 'Erro: ' + E.Message);
        raise Exception.Create('Erro ao aceitar o pedido do ifood!!' + E.Message);
      end;

    end;
  finally
    FreeAndNil(LJsonALC);
    FreeAndNil(LJsonRetorno);
    FreeAndNil(LHeaders);
    FreeAndNil(LBody);
  end;
end;

procedure TfrmExpedicaoDelivery.ConfirmarPedidoIfood(APedido: TPedidoPlataforma);
var
  LJsonRetorno: TStringList;
  LJsonALC: TALJSONNodeA;
  LData, LHora, LDataHora: string;
  LHeaders: TStringList;
  LBody: TStringList;
  LURLParam: string;
begin

  LJsonRetorno := TStringList.Create;
  LJsonALC := TALJSONDocumentA.Create;

  LBody := TStringList.Create;
  LBody.NameValueSeparator := '=';

  LHeaders := TStringList.Create;
  LHeaders.NameValueSeparator := '=';

  if Now >= ExpiracaoToken then
  begin
    RefreshAccessToken;
  end;

  try
    try
      LHeaders.Add('Authorization=Bearer ' + TokenIfood);

      LURLParam := APedido.idPedidoPlataforma;

      if dmExpedicaoDelivery.HTTPRequest(teConfirmOrderIfood, LURLParam, LHeaders, LBody, LJsonRetorno, 3, 3, ctAPPLICATION_JSON) then
      begin
        APedido.confirmado := True;
        dm.executaSQL('update integracoes_pedidos p set p.confirmado=1 where p.id=' + IntToStr(APedido.idPedido));
      end
      else
      begin
        APedido.confirmado := false;
        LJsonRetorno.Text := dmExpedicaoDelivery.trataJsonInicial(LJsonRetorno.Text);
        RefreshAccessToken;
        dm.adicionaLog('Erro ao confirmar o pedido');
        dm.adicionaLog(LJsonRetorno.Text);
        dm.adicionaLog('Erro ao aceitar o pedido do ifood');
        dm.adicionaLog(LJsonRetorno.Text);
        raise Exception.Create('Erro ao aceitar o pedido do ifood!');
      end;

    except
      on E: Exception do
      begin
        //AddLogErros('Erro ao requisitar json do pedido! ' + sLineBreak + 'Id do Evento: ' + AOrder.IDPlataforma + sLineBreak + 'Erro: ' + E.Message);
        raise Exception.Create('Erro ao aceitar o pedido do ifood!!' + E.Message);
      end;

    end;
  finally
    FreeAndNil(LJsonALC);
    FreeAndNil(LJsonRetorno);
    FreeAndNil(LHeaders);
    FreeAndNil(LBody);
  end;
end;

procedure TfrmExpedicaoDelivery.itRejeitarPedidoClick(Sender: TObject);
begin
  inherited;
  {
  application.CreateForm(TfrmConfirmaCancelamentoPlataformas, frmConfirmaCancelamentoPlataformas);
  frmConfirmaCancelamentoPlataformas.showmodal;
  frmConfirmaCancelamentoPlataformas.Free;

  if (trim(string_auxiliar) <> '') then
  begin
    if (ShowRealDialog(Self, tmConfirmacao, 'Confirme', 'Tem certeza que deseja solicitar o cancelamento ?', 16) = teSim) then
    begin
      CancelamentoPedidoIFood(PedidoPlataformaSelecionado, string_auxiliar, string_auxiliar2);
    end
  end;

  pararMusica();
  }
end;

procedure TfrmExpedicaoDelivery.tmAlertaPedidosPlataformaTimer(Sender: TObject);
var
  tbAux: TFDMemTable;
  LSQL: TStringList;
  qtdeAlertas: Integer;
  alertaVoz: Boolean;
begin

  alertaVoz := True;
  qtdeAlertas := 0;

  tbAux := TFDMemTable.Create(Self);
  LSQL := TStringList.Create;

  try
    try
      tocandoMusica := False;
      player.Stop;
      LSQL.Clear;
      LSQL.Add('select coalesce(count(*),0) as qtde from INTEGRACOES_PEDIDOS p where confirmado=0 and cancelado=0');
      LSQL.add(' and udf_minutesbetween(p.hora_pedido_plataforma,current_timestamp)<=7');
      dm.getMemTable(tbAux, LSQL.Text);
      qtdeAlertas := tbAux.FieldByName('qtde').Value;

      if qtdeAlertas > 0 then
      begin
        player.FileName := ApplicationPath + 'sons\pedidoNovo.wav';
        tocandoMusica := True;
        if pgPedidosPlataformaAtiva = True then
          AtualizaListaPedidosPlataformas;
      end;

      if tocandoMusica = False then
      begin
        LSQL.Clear;
        LSQL.Add('select coalesce(count(*),0) as qtde from INTEGRACOES_PEDIDOS p where confirmado=0 and cancelado=1 and ciencia_cancelamento=0');
        LSQL.add(' and udf_minutesbetween(p.hora_pedido_plataforma,current_timestamp)<=10');
        dm.getMemTable(tbAux, LSQL.Text);
        qtdeAlertas := tbAux.FieldByName('qtde').Value;

        if qtdeAlertas > 0 then
        begin
          player.FileName := ApplicationPath + 'sons\PedidoCancelado.wav';
          tocandoMusica := True;
          if pgPedidosPlataformaAtiva = True then
            AtualizaListaPedidosPlataformas;
        end;
      end;

      case qtdeAlertas of
        0:
          btPedidosPlataforma.PngImage.LoadFromFile(ApplicationPath + '\imagens\cloudPlataforma.png');
        1:
          btPedidosPlataforma.PngImage.LoadFromFile(ApplicationPath + '\imagens\cloudPlataforma1.png');
        2:
          btPedidosPlataforma.PngImage.LoadFromFile(ApplicationPath + '\imagens\cloudPlataforma2.png');
        3:
          btPedidosPlataforma.PngImage.LoadFromFile(ApplicationPath + '\imagens\cloudPlataforma3.png');
        4:
          btPedidosPlataforma.PngImage.LoadFromFile(ApplicationPath + '\imagens\cloudPlataforma4.png');
        5:
          btPedidosPlataforma.PngImage.LoadFromFile(ApplicationPath + '\imagens\cloudPlataforma5.png')      else
        btPedidosPlataforma.PngImage.LoadFromFile(ApplicationPath + '\imagens\cloudPlataforma6.png');
      end;

      btPedidosPlataforma.Repaint;
      btPedidosPlataforma.Refresh;
             {
      if ((btSom.Tag = 1) and (qtdeAlertas > 0)) then
      begin
        tocandoMusica := True;
        player.Play;
      end
      else
      begin
        player.Stop;
        tocandoMusica := False;
      end;
              }
    except
      on E: Exception do
      begin
      end;
    end;
  finally
    tbAux.Active := False;
    FreeAndNil(tbAux);
    FreeAndNil(LSQL);
  end;

end;

procedure TfrmExpedicaoDelivery.tmAtualizaPedidosExpedicaoTimer(Sender: TObject);
begin
  inherited;

  btFiltraPedidos.Click;
  tmAtualizaPedidosExpedicao.Enabled := False;
  tmAtualizaPedidosExpedicao.Enabled := True;
end;

procedure TfrmExpedicaoDelivery.ExecutaPolling;
begin
  try
    if dm.tb_parametrosINTEGRACAO_PLATAFORMAS.Value = 1 then
    begin
      ExecutaPollingIfood;
    end;
  finally

  end;

end;

procedure TfrmExpedicaoDelivery.tmPolingTimer(Sender: TObject);
begin
  try
    if (LPoolingDesativado = false) then
      ExecutaPolling;
  finally

  end;

end;

procedure TfrmExpedicaoDelivery.pararMusica;
begin
  player.Stop;
  tocandoMusica := False;
end;

procedure TfrmExpedicaoDelivery.timerDesabilitaHintTimer(Sender: TObject);
begin
  inherited;
  cxGrid1.ShowHint := False;
  cxGrid1.Hint := '';
  timerDesabilitaHint.Enabled := False;
end;

procedure TfrmExpedicaoDelivery.timerHoraTimer(Sender: TObject);
begin
  inherited;
  lbHora.Caption := FormatDateTime('HH:MM:SS', Now);
end;

procedure TfrmExpedicaoDelivery.RefreshTokenValidate();
var
  tbAux: TFDMemTable;
begin
  tbAux := TFDMemTable.Create(Self);

  try
    try
      dm.getMemTable(tbAux, 'select coalesce(token,' + Quotedstr('') + ') as token,coalesce(X_POLLING_MERCHANT,' + QuotedStr('') + ') as merchant , expiracao_token from integracoes_empresa where codigo=1');
      LXPollingMerchant := tbAux.FieldByName('merchant').Value;
      if tbAux.FieldByName('token').Value = '' then
      begin
        ExpiracaoToken := Now;

      end
      else
      begin
        TokenIfood := tbAux.FieldByName('token').Value;
        LXPollingMerchant := tbAux.FieldByName('merchant').Value;
        ExpiracaoToken := tbAux.FieldByName('expiracao_token').Value;
      end;

      if Now >= ExpiracaoToken then
      begin
        RefreshAccessToken;
      end;

      dm.adicionaLog('(Refresh) O token atual é ' + TokenIfood);
    except
      on E: Exception do
      begin
        dm.adicionaLog('Erro ao fazer refresh do token validate ' + E.Message);
      end;

    end;

  finally
    tbAux.Close;
    FreeAndNil(tbAux);
  end;

end;

procedure TfrmExpedicaoDelivery.ExecutaPollingIfood();
var
  tbAux: TFDMemTable;
begin

  try
    tbAux := TFDMemTable.Create(Self);
    dm.getMemTable(tbAux, 'select coalesce(token,' + Quotedstr('') + ') as token,coalesce(X_POLLING_MERCHANT,' + QuotedStr('') + ') as merchant , expiracao_token from integracoes_empresa where codigo=1');

    if tbAux.IsEmpty = false then
    begin
      LXPollingMerchant := tbAux.FieldByName('merchant').Value;

      if tbAux.FieldByName('token').Value = '' then
      begin
        ExpiracaoToken := Now;
      end
      else
      begin
        TokenIfood := tbAux.FieldByName('token').Value;
        LXPollingMerchant := tbAux.FieldByName('merchant').Value;
        ExpiracaoToken := tbAux.FieldByName('expiracao_token').Value;
      end;

      if Now >= ExpiracaoToken then
      begin
        RefreshAccessToken;
      end;

      if pgPedidosPlataformaAtiva = True then
      begin
        AtualizaListaPedidosPlataformas;
      end;
    end;

  finally
    tbAux.Close;
    FreeAndNil(tbAux);
  end;

end;

procedure TfrmExpedicaoDelivery.F1Click(Sender: TObject);
begin
  inherited;
  ReprocessarPedido(PedidoPlataformaSelecionado.idPedido);
end;

procedure TfrmExpedicaoDelivery.ReprocessarPedido(AidPedido: integer);
var
  LSQL: TStringList;
begin
  LSQL := Tstringlist.Create;
  try
    try
      LSQL.add(' update integracoes_pedidos p set p.json_processado=0  ');
      LSQL.add(' where p.id=' + Inttostr(AidPedido));
      dm.executaSQL(LSQL.Text);
      ShowRealDialog(self, tmSucesso, 'Reprocessamento efetuado', 'Reprocessamento efetuado com sucesso!');
    except
      on E: Exception do
      begin
        ShowRealDialog(self, tmErro, 'Erro ao reprocessar', 'Erro ao reprocessar o pedido! ' + sLineBreak + E.Message);
      end;

    end;

  finally
    FreeAndNil(LSQL);
  end;

end;

procedure TfrmExpedicaoDelivery.scrollTbPedidos(DataSet: TDataset);
begin
  selecionarRegistroPedidoPlataforma;
end;

procedure TfrmExpedicaoDelivery.AtualizaListaPedidosPlataformas();
var
  LSQL: TStringList;
  idSelecionado: LargeInt;
begin
//  itConfirmarPedido.Visible := false;
//  itRejeitarPedido.Visible := False;
  btAtualizarLista.Enabled := false;

  idSelecionado := 0;
  dmExpedicaoDelivery.tbPolling.AfterScroll := nil;
  ;

  if (dmExpedicaoDelivery.tbPolling.IsEmpty = False) then
  begin
    idSelecionado := dmExpedicaoDelivery.tbPolling.FieldByName('id').Value;
  end;

  LSQL := TStringList.Create;
  LSQL.Clear;
  LSQL.add(' select p.*,im.nome as NomeLoja,                                                                        ');
  LSQL.add('   case p.tipo_entrega                                                                                  ');
  LSQL.add('     when 0 then ' + QuotedStr('DELIVERY'));
  LSQL.add('     WHEN 1 THEN ' + QuotedStr('RETIRAR'));
  LSQL.add('    END tipoEntrega,                                                                                    ');
  LSQL.add('                                                                                                        ');
  LSQL.add('   case p.responsavel_entrega                                                                           ');
  LSQL.add('     when 1 then ' + QuotedStr('IFOOD'));
  LSQL.add('     WHEN 0 THEN ' + QuotedStr('RESTAURANTE'));
  LSQL.add('    END ResponsavelEntrega,');
  LSQL.ADD('   case tp.descricao             ');
  LSQL.ADD('       when ' + QuotedStr('Novo') + ' then 0  ');
  LSQL.ADD('       when ' + QuotedStr('Confirmado') + ' then 1  ');
  LSQL.ADD('       when ' + QuotedStr('Cancelado') + ' then 2  ');
  LSQL.ADD('       when ' + QuotedStr('Saiu') + ' then 3  ');
  LSQL.ADD('       when ' + QuotedStr('Concluído') + ' then 4  ');
  LSQL.ADD('       when ' + QuotedStr('Entregue') + ' then 5  ');
  LSQL.ADD('   end StatusPedidoInt,          ');
  LSQL.add('       tp.descricao,ic.nome,ic.cod_cliente_sistema, ic.qtd_pedidos, eb.nome as bairro, ed.endereco_completo, ed.latitude, ');
  LSQL.add('       ed.longitude, cd.nome as nomeCidade,es.nome as NomeEstado, coalesce(p.STATUS_INTEGRACAO_SISTEMA,0) as STATUS_INTEGRACAO, ');
  LSQL.add('       coalesce(IC.cod_cliente_sistema,0) as cliente_integrado');
  LSQL.add('          from integracoes_pedidos p                                                                    ');
  LSQL.add('             inner join integracoes_clientes      ic on (ic.id = p.id_cliente)           ');
  LSQL.add('             inner join integracoes_tipos_evento  tp on (tp.nome_evento = p.evento_mais_recente)        ');
  LSQL.add('             inner join integracoes_enderecos     ed on (ed.id = p.id_endereco)                         ');
  LSQL.add('             inner join integracoes_logradouros   el on (el.id = ed.id_logradouro)                      ');
  LSQL.add('             inner join integracoes_bairro        eb on (eb.id = el.id_bairro)                          ');
  LSQL.add('             inner join integracoes_cidade        cd on (cd.id = eb.id_cidade)                          ');
  LSQL.add('             inner join integracoes_estado        es on (es.id = cd.id_estado)                          ');
  LSQL.add('             inner join INTEGRACOES_MERCHANTS     im on (im.id = p.id_merchant)                          ');
  LSQL.add('             where cast(hora_pedido_plataforma as date)=' + QuotedStr(FormatDateTime('DD.MM.YYY', edDataPedidosPlataforma.Date)));
  if ckbApenasNaoLancados.Checked then
  begin
    LSQL.Add(' and  p.status_integracao_sistema =0');
  end;

{
  if ckbNaoAssociados.Checked   then
    LSQL.Add(' and coalesce(IC.cod_cliente_sistema,0) = 0 ');

  LSQL.add(' order by ');
  if ckbOrdem.Checked  then
   begin
    LSQL.Add(' ic.qtd_pedidos desc');
    LSQL.Add(',');
   end;
 }
  LSQL.Add(' order by p.id desc');

  try
    dm.adicionalog(LSQL.Text);
    dm.getMemTable(dmExpedicaoDelivery.tbPolling, LSQL.Text);

  finally
    FreeAndNil(LSQL);
    btAtualizarLista.Enabled := true;
  end;

  if idSelecionado <> 0 then
  begin
    dmExpedicaoDelivery.tbPolling.Locate('id', VarArrayOf([idSelecionado]), [loCaseInsensitive, loPartialKey]);
  end;

  dmExpedicaoDelivery.tbPolling.AfterScroll := scrollTbPedidos;
  dmExpedicaoDelivery.tbPolling.EnableControls;
  gridPlataformasDBTableView1.DataController.DataSource := dmExpedicaoDelivery.dsPolling;
  gridPlataformas.EndUpdate;

  if dmExpedicaoDelivery.tbPolling.IsEmpty then
  begin
    itConfirmarPedido.Visible := false;
    itRejeitarPedido.Visible := false;
  end
  else
  begin
    itConfirmarPedido.Visible := true;
    itRejeitarPedido.Visible := false;

  end;

end;

procedure TfrmExpedicaoDelivery.timerTempoPreparoTimer(Sender: TObject);
begin
  inherited;
  timerTempoPreparo.Enabled := False;
  if lbTempoMedio.Transparent = True then
  begin
    lbTempoMedio.Color := clRed;
    lbTempoMedio.Transparent := False
  end
  else
    lbTempoMedio.Transparent := True;

  timerTempoPreparo.Enabled := True;
end;

procedure TfrmExpedicaoDelivery.rdFiltroClick(Sender: TObject);
begin
  inherited;
  edHoraInicial.Text := '00:00';
  edHoraFinal.Text := '23:59';

  btFiltraPedidos.Click;
end;

procedure TfrmExpedicaoDelivery.rdpOrdemClick(Sender: TObject);
begin
  inherited;
  btFiltraPedidos.Click;
end;

procedure TfrmExpedicaoDelivery.BitBtn3Click(Sender: TObject);
begin
  inherited;
  filtraPedidos();
end;

procedure TfrmExpedicaoDelivery.edDataPedidosPlataformaChange(Sender: TObject);
begin
  inherited;
  AtualizaListaPedidosPlataformas;
end;

procedure TfrmExpedicaoDelivery.edNomeClienteChange(Sender: TObject);
begin
  inherited;
  btFiltraPedidos.Click;
end;

procedure TfrmExpedicaoDelivery.edNomeClienteConsultaChange(Sender: TObject);
var
  SQL: string;
begin
  if ((Length(edNomeClienteConsulta.Text) >= 3) or (Length(edEnderecoConsultaCliente.Text) >= 3) or (Length(edEnderecoConsultaBairro.Text) >= 3)) then
  begin
    dmExpedicaoDelivery.tbCsClientesDelivery.Active := False;
    dmExpedicaoDelivery.tbCsClientesDelivery.DisableControls;

    SQL := ' select cd.codigo, cd.nome, cd.telefone, cd.celular,' + '        b.descricao as descBairro,cd.endereco, cd.complemento' + '        from clientes_delivery cd' + '   inner join bairro b on (b.codigo = cd.cod_bairro)';

    SQL := SQL + '    where cd.nome like ' + QuotedStr(edNomeClienteConsulta.Text + '%');
    SQL := SQL + '    and cd.endereco like ' + QuotedStr('%' + edEnderecoConsultaCliente.Text + '%');
    SQL := SQL + '    and cd.endereco like ' + QuotedStr('%' + edNumeroConsultaAssociacao.Text + '%');
    SQL := SQL + '    and b.descricao like ' + QuotedStr(edEnderecoConsultaBairro.Text + '%');

    dmExpedicaoDelivery.tbCsClientesDelivery.enablecontrols;
    dm.getMemTable(dmExpedicaoDelivery.tbCsClientesDelivery, SQL);

  end
end;

procedure TfrmExpedicaoDelivery.EXCLUIROPEDIDO1Click(Sender: TObject);
begin

  timerTempoPreparo.Enabled := False;
  if dmExpedicaoDelivery.tbExpedicaoDelivery.fieldbyname('status').value = 3 then
  begin
    dm.exibe_painel_erro('Pedido já foi recebido. Não é possível ser manipulado!', 'Ok');
    Exit;
  end;

  {
  If (dm.verificaPermissaoAcao('B20003002', True, True) = True) Then
  Begin
    Application.CreateForm(TfrmPedidosDelivery, frmPedidosDelivery);
    frmPedidosDelivery.setCodPedidoSelecionado(dmExpedicaoDelivery.tbExpedicaoDelivery.fieldbyname('codigo').value);
    frmPedidosDelivery.setEvento(3);
    frmPedidosDelivery.ShowModal;
    frmPedidosDelivery.Free;
    btFiltraPedidos.Click;
  End;


  timerTempoPreparo.Enabled := False;
  If dmExpedicaoDelivery.tbExpedicaoDelivery.fieldbyname('status').value = 3 Then
  Begin
    dm.exibe_painel_erro('Pedido já foi recebido. Não é possível ser manipulado!', 'Ok');
    Exit;
  End;
}
  if (dm.verificaPermissaoAcao('B20003002', True, True) = True) then
  begin
    Application.CreateForm(TfrmPedidosDelivery, frmPedidosDelivery);
    frmPedidosDelivery.setCodPedidoSelecionado(dmExpedicaoDelivery.tbExpedicaoDelivery.fieldbyname('codigo').value);
    frmPedidosDelivery.setEvento(3);
    frmPedidosDelivery.ShowModal;
    frmPedidosDelivery.Free;
    btFiltraPedidos.Click;
  end

end;

procedure TfrmExpedicaoDelivery.Alteraropedido1Click(Sender: TObject);
begin

  timerTempoPreparo.Enabled := False;
  if dmExpedicaoDelivery.tbExpedicaoDelivery.fieldbyname('status').value = 3 then
  begin
    dm.exibe_painel_erro('Pedido já foi recebido. Não é possível ser alterado!', 'Ok');
  end;

  if (dm.verificaPermissaoAcao('B20003001', True, True) = True) then
  begin
    Application.CreateForm(TfrmPedidosDelivery, frmPedidosDelivery);
    frmPedidosDelivery.setCodPedidoSelecionado(dmExpedicaoDelivery.tbExpedicaoDelivery.fieldbyname('codigo').value);
    frmPedidosDelivery.setEvento(2);
    frmPedidosDelivery.ShowModal;
    frmPedidosDelivery.Free;
    dm.LimpaInformacoesDaMesa(mesaDelivery, numero_caixa);
    btFiltraPedidos.Click;
  end;

end;

procedure TfrmExpedicaoDelivery.SAIDADOPEDIDO1Click(Sender: TObject);
begin
  inherited;
  if dmExpedicaoDelivery.tbExpedicaoDelivery.fieldbyname('status').value = 3 then
  begin
    dm.exibe_painel_erro('Pedido já foi recebido. Não é possível ser manipulado!', 'Ok');
    Exit;
  end;

  lblNumeroPedidoEntregadores.Caption := IntToStr(dmExpedicaoDelivery.tbExpedicaoDelivery.fieldbyname('codInteiro').value);
  lblNomeClienteEntregadores.Caption := dmExpedicaoDelivery.tbExpedicaoDelivery.fieldbyname('nome').value;
  lblBairroEntregadores.Caption := dmExpedicaoDelivery.tbExpedicaoDelivery.fieldbyname('descBairro').value;
  lblEnderecoEntregadores.Caption := dmExpedicaoDelivery.tbExpedicaoDelivery.fieldbyname('endereco').value;

  tmAtualizaPedidosExpedicao.Enabled := False;
  pgEntregadores.Show;

end;

procedure TfrmExpedicaoDelivery.RECEBEPEDIDO1Click(Sender: TObject);
var
  codigo: string;
begin
  inherited;

  timerTempoPreparo.Enabled := False;
  if dmExpedicaoDelivery.tbExpedicaoDelivery.fieldbyname('status').value = 3 then
  begin
    dm.exibe_painel_erro('Pedido já foi recebido. Não é possível ser manipulado!', 'Ok');
    Exit;
  end;

  if (StrToInt(dm.LeIni(2, 'CAIXA', 'permiteEncerrarContas')) = 0) then
  begin
    ShowMessage('Não é possível encerrar contas nesta estação!');
  end
  else
  begin
    codigo := dmExpedicaoDelivery.tbExpedicaoDelivery.fieldbyname('codigo').value;

    if (dmExpedicaoDelivery.tbExpedicaoDelivery.FieldByName('status').Value = 2) then
    begin
      ReceberPedido(codigo);
    end
    else
    begin
      if (StrToInt(dm.LeIni(2, 'CAIXA', 'desabilitaSaidaObrigatoriaDelivery')) = 0) then
      begin
        dm.exibe_painel_erro('Ainda não foi feita a saída deste pedido.' + sLineBreak + sLineBreak + 'O recebimento só é possível após a saída do pedido por um entregador.', 'Ok');
      end
      else
      begin
         // faz a saída automática do pedido
        dmExpedicaoDelivery.EfetuaSaidaDoPedido(codigo, '001', 'BALCAO');
        ReceberPedido(codigo);
      end;

    end;

    tmAtualizaPedidosExpedicao.Enabled := True;
    btFiltraPedidos.Click;
  end;
  dm.LimpaInformacoesDaMesa(mesaDelivery, numero_caixa);
  muda_acao(1);
end;

procedure TfrmExpedicaoDelivery.ReceberPedido(ACodigo: string);
begin
  try
    try
      dm.LimpaInformacoesDaMesa(mesaDelivery, numero_caixa);
      dm.ApagarItensDoPedidoDoMovimento(ACodigo);
      retornaDadosDoPedido(ACodigo);
      dm.InsereChavesMovimento(numero_caixa, mesaDelivery);
      Application.CreateForm(Tfrm_encerramento, frm_encerramento);
      frm_encerramento.setTipoVenda(3);
      tmAtualizaPedidosExpedicao.Enabled := False;
      timerHora.Enabled := False;
      frm_encerramento.lb_mesa.caption := mesaDelivery;
      frm_encerramento.setCodPedidoDelivery(ACodigo);
      frm_encerramento.showmodal;
      frm_encerramento.free;
      timerHora.Enabled := True;
    except
      on E: Exception do
      begin
        dm.exibe_painel_erro(E.Message, 'OK');
      end;
    end;
  finally

  end;

end;

procedure TfrmExpedicaoDelivery.muda_acao(tipo: Integer);
begin

  case tipo of
    1:
      begin
        tipo_cupom := 1;
        lbTitulo.Font.Color := clWhite;
      end;
    2:
      begin
        tipo_cupom := 2;
        lbTitulo.Font.Color := clRed;
      end;
  end;

end;

procedure TfrmExpedicaoDelivery.pgAssociacaoClienteShow(Sender: TObject);
begin
  inherited;
  lbTitulo.Caption := 'Asssociação de clientes';
end;

procedure TfrmExpedicaoDelivery.pgEntregadoresShow(Sender: TObject);
begin
  inherited;
  lbTitulo.Caption := 'Selecione o entregador para o pedido';
end;

procedure TfrmExpedicaoDelivery.pgExpedicaoHide(Sender: TObject);
begin
  inherited;
  tmAtualizaPedidosExpedicao.Enabled := False;
end;

procedure TfrmExpedicaoDelivery.pgExpedicaoShow(Sender: TObject);
begin
  inherited;
  lbTitulo.Caption := 'Expedição de Pedidos';
  itConfirmarPedido.Visible := false;
  itRejeitarPedido.Visible := false;

  tmAtualizaPedidosExpedicao.Enabled := True;
  timerTempoPreparo.Enabled := True;

  btFiltraPedidos.Click;
end;

procedure TfrmExpedicaoDelivery.pgPedidosExpedicaoHide(Sender: TObject);
begin
  inherited;
  tmAtualizaPedidosExpedicao.Enabled := False;
end;

procedure TfrmExpedicaoDelivery.pgPedidosPlataformasHide(Sender: TObject);
begin
  inherited;
  pgPedidosPlataformaAtiva := False;
  tmPoling.Enabled := False;
//  edDataPedidosPlataforma.Visible := false;

end;

procedure TfrmExpedicaoDelivery.pgPedidosPlataformasShow(Sender: TObject);
begin
  inherited;
  ExecutaPolling;
  lbTitulo.Caption := 'Pedidos nas plataformas online';
  pgPedidosPlataformaAtiva := True;
  AtualizaListaPedidosPlataformas;
  edDataPedidosPlataforma.Visible := true;


//  dmExpedicaoDelivery.tbPolling.First;

end;

procedure TfrmExpedicaoDelivery.btAssociarClienteClick(Sender: TObject);
begin
  inherited;
  if CodigoClienteSelecionadoAsssociacao <> '' then
  begin
    if (PedidoPlataformaSelecionado.clienteIntegrado = False) then
    begin
      pgPedidosPlataformas.Show;
      dmExpedicaoDelivery.AssociarCliente(PedidoPlataformaSelecionado, CodigoClienteSelecionadoAsssociacao);
      NovoPedido(PedidoPlataformaSelecionado);

    end
    else
    begin
      pgPedidosPlataformas.Show;

      if (PedidoPlataformaSelecionado.retirarNoLocal = False) then
        dmExpedicaoDelivery.AtualizaCadastroDoCLiente(PedidoPlataformaSelecionado);

      NovoPedido(PedidoPlataformaSelecionado);
      AtualizaListaPedidosPlataformas;
    end;

  end
  else
  begin
    dm.exibe_painel_erro('Selecione o cliente que deseja fazer a associação!', 'Ok');
  end;
end;

procedure TfrmExpedicaoDelivery.btAtualizarListaClick(Sender: TObject);
begin
  inherited;
  AtualizaListaPedidosPlataformas;
end;

procedure TfrmExpedicaoDelivery.PngSpeedButton13Click(Sender: TObject);
begin
  inherited;
  close;
end;

procedure TfrmExpedicaoDelivery.PngSpeedButton2Click(Sender: TObject);
begin
  inherited;
  if (dm.verificaPermissaoAcao('B20003011', True, True) = True) then
  begin
    try
      dm.executaSQL('update parametros p set p.tempo_prep_delivery=' + IntToStr(spinTempo.Value));
      btFiltraPedidos.Click;
    except
      dm.exibe_painel_erro('Erro ao mudar tempo de preparo!', 'Ok');
    end;
  end;
end;

procedure TfrmExpedicaoDelivery.PngSpeedButton3Click(Sender: TObject);
begin
  inherited;
  pgPedidosPlataformas.Show;
end;

procedure TfrmExpedicaoDelivery.PngSpeedButton4Click(Sender: TObject);
var
  texto: string;
begin

  texto := PadCenter('*ATENÇÃO*', 50, '.') + sLineBreak;
  texto := texto + '*Cliente:* ' + lbNomeClienteLocalizacao.Caption + sLineBreak;
  texto := texto + '*Endereço:* ' + lbLocalizacaoCliente.Caption + sLineBreak + sLineBreak;

  texto := texto + '*Link da rota abaixo*' + sLineBreak + sLineBreak;
//  texto := texto + WebView1.Uri;
  Clipboard.AsText := texto;

end;

procedure TfrmExpedicaoDelivery.PngSpeedButton5Click(Sender: TObject);
begin
  inherited;
  gerarMapaLocalizacaoCliente;
end;

procedure TfrmExpedicaoDelivery.PngSpeedButton6Click(Sender: TObject);
begin
  inherited;
  gerarRotaEntregaPedido;
end;

procedure TfrmExpedicaoDelivery.PngSpeedButton7Click(Sender: TObject);
begin
  inherited;
  Close;

  {
  if dmExpedicaoDelivery.tbPolling.IsEmpty = false then
  begin
    gerarMapaLocalizacaoCliente();
    pgLocalizacaoCliente.Show;
  end
  else
    showmessage('Nenhum registro selecionado!');
   }
end;

procedure TfrmExpedicaoDelivery.btVoltarClick(Sender: TObject);
begin
  inherited;
  pgExpedicao.Show;
end;

procedure TfrmExpedicaoDelivery.lbObsClienteAssociacaoChange(Sender: TObject);
begin
  inherited;
  PedidoPlataformaSelecionado.Complemento := lbObsClienteAssociacao.Text;
end;

procedure TfrmExpedicaoDelivery.lbTituloDblClick(Sender: TObject);
begin
  inherited;
  if (StrToInt(dm.LeIni(1, 'CAIXA', 'licenciado')) = 1) then
  begin
    if tipo_cupom = 1 then
      muda_acao(2)
    else
      muda_acao(1);
  end;
end;

procedure TfrmExpedicaoDelivery.rdTipoEntregaClick(Sender: TObject);
begin
  inherited;
  btFiltraPedidos.Click;
end;

procedure TfrmExpedicaoDelivery.btFiltraPedidosClick(Sender: TObject);
begin
  inherited;
  if btFiltraPedidos.Enabled then
    filtraPedidos;
end;

procedure TfrmExpedicaoDelivery.btNovoPedidoClick(Sender: TObject);
begin
  inherited;
  pgExpedicao.Show;
  NovoPedido(nil);
  tmAtualizaPedidosExpedicao.Enabled := True;
  timerTempoPreparo.Enabled := True;
  btFiltraPedidos.Click;

end;

procedure TfrmExpedicaoDelivery.NovoPedido(APedido: TPedidoPlataforma);
begin
  try
    itConfirmarPedido.Visible := false;
    LPoolingDesativado := true;
    timerTempoPreparo.Enabled := False;
    tmAlertaPedidosPlataforma.Enabled := false;
    dmExpedicaoDelivery.tbExpedicaoDelivery.Active := False;
    tmAtualizaPedidosExpedicao.Enabled := False;

    Application.CreateForm(TfrmPedidosDelivery, frmPedidosDelivery);
    frmPedidosDelivery.setEvento(1);
    if Assigned(APedido) then
      frmPedidosDelivery.setPedidoPlataformaAtual(APedido);

    frmPedidosDelivery.ShowModal;
    frmPedidosDelivery.Free;
    tmAlertaPedidosPlataforma.Enabled := true;

  finally
    LPoolingDesativado := false;
  end;
//  btFiltraPedidos.Click;
end;

procedure TfrmExpedicaoDelivery.btPedidosPlataformaClick(Sender: TObject);
begin
  inherited;
  pgPedidosPlataformas.Show;
end;

procedure TfrmExpedicaoDelivery.btConsultarPedidoClick(Sender: TObject);
begin
  inherited;
  timerTempoPreparo.Enabled := False;
  tmAtualizaPedidosExpedicao.Enabled := False;
  Application.CreateForm(TfrmPedidosDelivery, frmPedidosDelivery);
  frmPedidosDelivery.setEvento(4);
  frmPedidosDelivery.ShowModal;
  frmPedidosDelivery.Free;

  tmAtualizaPedidosExpedicao.Enabled := True;
  btFiltraPedidos.Click;
end;

procedure TfrmExpedicaoDelivery.btClientesClick(Sender: TObject);
begin
  inherited;
  timerTempoPreparo.Enabled := False;
  tmAtualizaPedidosExpedicao.Enabled := False;
  Application.CreateForm(TfrmCadClientesDelivery, frmCadClientesDelivery);
  frmCadClientesDelivery.ShowModal;
  frmCadClientesDelivery.Free;
  tmAtualizaPedidosExpedicao.Enabled := True;
  btFiltraPedidos.Click;
end;

procedure TfrmExpedicaoDelivery.btClienteSemCadastroClick(Sender: TObject);
begin
  inherited;
  pgPedidosPlataformas.Show;
  dmExpedicaoDelivery.CadastraNovoCliente(PedidoPlataformaSelecionado);
  NovoPedido(PedidoPlataformaSelecionado);
  AtualizaListaPedidosPlataformas;
end;

procedure TfrmExpedicaoDelivery.btBairrosClick(Sender: TObject);
begin
  inherited;
  tmAtualizaPedidosExpedicao.Enabled := False;
  Application.CreateForm(TfrmCadBairros, frmCadBairros);
  frmCadBairros.ShowModal;
  frmCadBairros.Free;
  tmAtualizaPedidosExpedicao.Enabled := True;
end;

procedure TfrmExpedicaoDelivery.destruirListaComponentes();
var
  I: Integer;
  cp: TComponent;
begin
  if Assigned(ComponentesDestruir) then
  begin
    for I := 0 to ComponentesDestruir.Count - 1 do
    begin
      cp := FindComponent(ComponentesDestruir[I]);
      FreeAndNil(cp);
    end;
    FreeAndNil(ComponentesDestruir);
  end;
end;

procedure TfrmExpedicaoDelivery.criaPainelPedido(AIdentificador: string; AItemPlataforma: TProdutoPlataforma; ATipo: SmallInt);
var
  pnItemPedido: TPanel;
  pnNomeProduto: TPanel;
  lbNomeProduto: TLabel;
  pnQtdProduto: TPanel;
  lbQtdProduto: TLabel;
  pnTotalProduto: TPanel;
  lbTotalProduto: TLabel;
  pnPrecoProduto: TPanel;
  lbPrecoProduto: TLabel;
  fonte: Integer;
  memo: TMemo;
begin
  AIdentificador := RandomName(10);
  scrollPedidos.HorzScrollBar.Visible := True;
  fonte := 11;

  pnItemPedido := TPanel.Create(Self);
  pnNomeProduto := TPanel.Create(Self);
  lbNomeProduto := TLabel.Create(Self);
  pnQtdProduto := TPanel.Create(Self);
  lbQtdProduto := TLabel.Create(Self);
  pnTotalProduto := TPanel.Create(Self);
  lbTotalProduto := TLabel.Create(Self);
  pnPrecoProduto := TPanel.Create(Self);
  lbPrecoProduto := TLabel.Create(Self);

  pnItemPedido.Name := 'pnItemPedido' + AIdentificador;
  pnNomeProduto.Name := 'pnNomeProduto' + AIdentificador;
  lbNomeProduto.Name := 'lbNomeProduto' + AIdentificador;
  pnQtdProduto.Name := 'pnQtdProduto' + AIdentificador;
  lbQtdProduto.Name := 'lbQtdProduto' + AIdentificador;

  pnTotalProduto.Name := 'pnTotalProduto' + AIdentificador;
  lbTotalProduto.Name := 'lbTotalProduto' + AIdentificador;
  pnPrecoProduto.Name := 'pnPrecoProduto' + AIdentificador;
  lbPrecoProduto.Name := 'lbPrecoProduto' + AIdentificador;

  ComponentesDestruir.add('pnItemPedido' + AIdentificador);
  ComponentesDestruir.add('pnNomeProduto' + AIdentificador);
  ComponentesDestruir.add('lbNomeProduto' + AIdentificador);
  ComponentesDestruir.add('pnQtdProduto' + AIdentificador);
  ComponentesDestruir.add('lbQtdProduto' + AIdentificador);
  ComponentesDestruir.add('Panel31' + AIdentificador);
  ComponentesDestruir.add('pnTotalProduto' + AIdentificador);
  ComponentesDestruir.add('lbTotalProduto' + AIdentificador);
  ComponentesDestruir.add('pnPrecoProduto' + AIdentificador);
  ComponentesDestruir.add('lbPrecoProduto' + AIdentificador);
  ComponentesDestruir.add('Panel10' + AIdentificador);
  ComponentesDestruir.add('Panel12' + AIdentificador);

  pnNomeProduto.Caption := '';
  pnQtdProduto.Caption := '';
  pnPrecoProduto.Caption := '';
  pnTotalProduto.Caption := '';

  scrollPedidos.BevelOuter := bvNone;
  scrollPedidos.BevelInner := bvNone;
  scrollPedidos.HorzScrollBar.Visible := False;
  pnItemPedido.Parent := scrollPedidos;
  pnItemPedido.Left := 0;
  pnItemPedido.Top := 2;
  pnItemPedido.Width := 585;
  pnItemPedido.Height := 18;
  pnItemPedido.BevelOuter := bvNone;

  pnItemPedido.ParentBackground := False;
  pnItemPedido.ParentFont := False;
  pnItemPedido.TabOrder := 0;
  pnItemPedido.Visible := False;
  pnItemPedido.Color := clWhite;

  pnNomeProduto.Parent := pnItemPedido;
  pnNomeProduto.Left := 0;
  pnNomeProduto.Top := 0;
  pnNomeProduto.Width := 280;
  pnNomeProduto.Height := 18;
  pnNomeProduto.Align := alLeft;
  pnNomeProduto.BevelOuter := bvNone;
  pnNomeProduto.Color := clWhite;
  pnNomeProduto.ParentBackground := False;
  pnNomeProduto.ParentFont := False;
  pnNomeProduto.TabOrder := 0;

  lbNomeProduto.Parent := pnNomeProduto;
  lbNomeProduto.Left := 0;
  lbNomeProduto.Top := 0;
  lbNomeProduto.Width := 280;
  lbNomeProduto.Height := 18;
  lbNomeProduto.Align := alClient;
  lbNomeProduto.Caption := 'Arroz branco';
  lbNomeProduto.ParentFont := False;
  lbNomeProduto.Layout := tlCenter;

  pnQtdProduto.Parent := pnItemPedido;
  pnQtdProduto.Left := 280;
  pnQtdProduto.Top := 0;
  pnQtdProduto.Width := 73;
  pnQtdProduto.Height := 18;
  pnQtdProduto.Align := alLeft;
  pnQtdProduto.BevelOuter := bvNone;
  pnQtdProduto.Color := clWhite;
  pnQtdProduto.ParentBackground := False;
  pnQtdProduto.ParentFont := False;
  pnQtdProduto.TabOrder := 1;

  lbQtdProduto.Parent := pnQtdProduto;
  lbQtdProduto.Left := 2;
  lbQtdProduto.Top := 0;
  lbQtdProduto.Width := 71;
  lbQtdProduto.Height := 18;
  lbQtdProduto.Align := alClient;
  lbQtdProduto.Alignment := taCenter;
  lbQtdProduto.Caption := '1';
  lbQtdProduto.ParentFont := False;
  lbQtdProduto.Layout := tlCenter;

  pnTotalProduto.Parent := pnItemPedido;
  pnTotalProduto.Left := 443;
  pnTotalProduto.Top := 0;
  pnTotalProduto.Width := 95;
  pnTotalProduto.Height := 18;
  pnTotalProduto.Align := alClient;
  pnTotalProduto.BevelOuter := bvNone;
  pnTotalProduto.Color := clWhite;
  pnTotalProduto.ParentBackground := False;
  pnTotalProduto.ParentFont := False;
  pnTotalProduto.TabOrder := 2;

  lbTotalProduto.Parent := pnTotalProduto;
  lbTotalProduto.Left := 0;
  lbTotalProduto.Top := 0;
  lbTotalProduto.Width := 100;
  lbTotalProduto.Height := 18;
  lbTotalProduto.Align := alLeft;

  lbTotalProduto.Alignment := taRightJustify;
  lbTotalProduto.Caption := 'R$ 25,34';
  lbTotalProduto.ParentFont := False;
  lbTotalProduto.Layout := tlCenter;

  pnPrecoProduto.Parent := pnItemPedido;
  pnPrecoProduto.Left := 353;
  pnPrecoProduto.Top := 0;
  pnPrecoProduto.Width := 90;
  pnPrecoProduto.Height := 18;
  pnPrecoProduto.Align := alLeft;
  pnPrecoProduto.BevelOuter := bvNone;
  pnPrecoProduto.Color := clWhite;
  pnPrecoProduto.ParentBackground := False;
  pnPrecoProduto.ParentFont := False;
  pnPrecoProduto.TabOrder := 3;

  lbPrecoProduto.Parent := pnPrecoProduto;
  lbPrecoProduto.Left := 2;
  lbPrecoProduto.Top := 0;
  lbPrecoProduto.Width := 86;
  lbPrecoProduto.Height := 18;
  lbPrecoProduto.Align := alClient;
  lbPrecoProduto.Alignment := taRightJustify;
  lbPrecoProduto.Caption := 'R$ 25,34';
  lbPrecoProduto.ParentFont := False;
  lbPrecoProduto.Layout := tlCenter;

  lbNomeProduto.Font.Size := fonte;
  lbQtdProduto.Font.Size := fonte;
  lbTotalProduto.Font.Size := fonte;
  lbPrecoProduto.Font.Size := fonte;

  if qtdItensCriados = 0 then
    pnItemPedido.Top := 0
  else
    pnItemPedido.Top := Trunc(qtdItensCriados * 18);

  case ATipo of
    1:
      begin
        lbNomeProduto.Caption := ' ' + AItemPlataforma.Nome;
        lbNomeProduto.Font.Style := [fsBold];
        lbQtdProduto.Font.Style := [fsBold];
        lbPrecoProduto.Font.Style := [fsBold];
        lbTotalProduto.Font.Style := [fsBold];
        lbTotalProduto.Caption := '   ' + FormatFloat('R$ #0.00', AItemPlataforma.total);
        lbQtdProduto.Caption := FormatFloat('#0.00', AItemPlataforma.Quantidade);
        lbPrecoProduto.Caption := FormatFloat('R$ #0.00', AItemPlataforma.preco);
        qtdItensCriados := qtdItensCriados + 1;

      end;

    2:
      begin
        lbNomeProduto.Caption := '   *' + AItemPlataforma.Nome;
        lbQtdProduto.Caption := FormatFloat('#0.00', AItemPlataforma.Quantidade);
        lbPrecoProduto.Caption := FormatFloat('R$ #0.00', AItemPlataforma.preco);
        lbTotalProduto.Caption := '';
        qtdItensCriados := qtdItensCriados + 1;
      end;

    3:
      begin
        lbNomeProduto.WordWrap := True;
        lbNomeProduto.AutoSize := False;
        lbNomeProduto.Font.Size := fonte - 2;
        lbNomeProduto.Font.Color := clRed;
        lbNomeProduto.Font.Style := [fsBold];
        pnPrecoProduto.Visible := False;
        lbQtdProduto.Visible := False;
        lbTotalProduto.Visible := False;
        pnNomeProduto.Width := pnItemPedido.Width;
        lbNomeProduto.Align := alNone;
        lbNomeProduto.Left := lbNomeProduto.Left + 20;
        lbNomeProduto.Width := pnItemPedido.Width - 50;

   //     If Length(Trim(AItemPlataforma.ObservacaoPreparo)) >= 60 Then
     //   Begin
        pnItemPedido.Height := pnItemPedido.Height * 3;
        pnNomeProduto.Height := pnItemPedido.Height;
        lbNomeProduto.Height := pnNomeProduto.Height;
        lbNomeProduto.WordWrap := True;
        qtdItensCriados := qtdItensCriados + 3;
       // End
//        Else
//        Begin
//          qtdItensCriados := qtdItensCriados + 1;
//        End;
        if AItemPlataforma.pizza then
          lbNomeProduto.Caption := AItemPlataforma.saboresPizzaDescricao
        else
          lbNomeProduto.Caption := AItemPlataforma.ObservacaoPreparo

      end;

    4:
      begin
        pnNomeProduto.Visible := True;
        pnNomeProduto.Align := alClient;
        lbNomeProduto.Alignment := taCenter;
        pnNomeProduto.Height := pnNomeProduto.Height;
        lbNomeProduto.Font.Style := [fsBold];
        lbNomeProduto.Caption := '    ' + AItemPlataforma.Nome;

        pnQtdProduto.Visible := False;
        pnPrecoProduto.Visible := False;
        pnTotalProduto.Visible := False;
        qtdItensCriados := qtdItensCriados + 1;

      end;
    5:
      begin
        pnNomeProduto.Visible := True;
        lbNomeProduto.Caption := '       ' + AItemPlataforma.Nome;
        ;

        if AItemPlataforma.preco < 0 then
        begin
          lbNomeProduto.Font.Color := clRed;
          lbTotalProduto.Font.Color := clRed;
        end;

        lbNomeProduto.Align := alClient;
        pnNomeProduto.Width := pnNomeProduto.Width + pnQtdProduto.Width;
        pnNomeProduto.Left := pnQtdProduto.Left;
        lbNomeProduto.Font.Style := [fsBold];

        pnQtdProduto.Visible := False;

        lbTotalProduto.Caption := '  ' + FormatFloat('R$ #0.00', AItemPlataforma.preco);
        lbTotalProduto.Alignment := taRightJustify;
        lbTotalProduto.Font.Style := [fsBold];

        lbPrecoProduto.Caption := '';

        lbPrecoProduto.Caption := '';
        qtdItensCriados := qtdItensCriados + 1;
      end;

    6:
      begin
        pnNomeProduto.Visible := True;
        lbNomeProduto.Caption := PadRight(AItemPlataforma.Nome, 50, ' ');

        lbTotalProduto.Font.Style := [fsBold];
        lbNomeProduto.Font.Style := [fsBold];

        if AItemPlataforma.preco < 0 then
        begin
          lbNomeProduto.Font.Color := clRed;
          lbTotalProduto.Font.Color := clRed;
        end;

        lbNomeProduto.Align := alClient;
        pnNomeProduto.Width := pnNomeProduto.Width + pnQtdProduto.Width;
        pnNomeProduto.Left := pnQtdProduto.Left;

        pnQtdProduto.Visible := False;

        lbTotalProduto.Caption := '  ' + FormatFloat('R$ #0.00', AItemPlataforma.preco);
        lbTotalProduto.Alignment := taRightJustify;

        lbPrecoProduto.Caption := '';

        lbPrecoProduto.Caption := '';
        qtdItensCriados := qtdItensCriados + 1;
      end;

    7:
      begin
        pnNomeProduto.Visible := True;
        pnNomeProduto.Align := alClient;
        lbNomeProduto.Alignment := taCenter;
        pnNomeProduto.Height := pnNomeProduto.Height;
        lbNomeProduto.Font.Style := [fsBold];
        lbNomeProduto.Font.Color := $00C08000;
        pnItemPedido.Alignment := taLeftJustify;
        pnItemPedido.Font.Color := clBlack;
        pnItemPedido.Caption := '---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------';
        pnItemPedido.Height := 3;
        pnNomeProduto.Visible := False;
        pnQtdProduto.Visible := False;
        pnPrecoProduto.Visible := False;
        pnTotalProduto.Visible := False;
        qtdItensCriados := qtdItensCriados + 1;

      end;

  end;

  pnItemPedido.Visible := True;

end;

procedure TfrmExpedicaoDelivery.mostraDetalhesPedido(IDPedido: LargeInt);
var
  tbAux: TFDMemTable;
  LSQL: TStringList;
begin

  qtdItensCriados := 0;
  if scrollPedidos <> nil then
  begin

    FreeAndNil(scrollPedidos);
  end;
  destruirListaComponentes;
  ComponentesDestruir := TStringList.Create;

  scrollPedidos := TScrollBox.Create(Self);
  scrollPedidos.Visible := False;

  tbAux := TFDMemTable.Create(Self);

  LSQL := TStringList.Create;

  scrollPedidos.Name := 'scrollPedidos';
  scrollPedidos.Parent := pnItens;
  scrollPedidos.Left := 0;
  scrollPedidos.Top := 0;
  scrollPedidos.Width := 545;
  scrollPedidos.Height := 184;
  scrollPedidos.Align := alClient;
  scrollPedidos.TabOrder := 0;
  scrollPedidos.Color := clWhite;
  scrollPedidos.Visible := False;

  try

    mostrarProdutosDoPedido(IDPedido);
    mostraFormasPagamento(IDPedido);

    if PedidoPlataformaSelecionado.retirarNoLocal then
      imgParaRetirada.visible := true
    else
      imgParaRetirada.visible := false;

    lbNomeCliente.Caption := dmExpedicaoDelivery.tbPolling.fieldbyname('nome').value;
    lbEnderecoCliente.Caption := dmExpedicaoDelivery.tbPolling.fieldbyname('endereco_completo').value;
    lbBairro.Caption := dmExpedicaoDelivery.tbPolling.fieldbyname('bairro').value;
    lbNomeLoja.Caption := dmExpedicaoDelivery.tbPolling.fieldbyname('NomeLoja').value;
    lbNumeroPedidoCliente.Caption := IntToStr(dmExpedicaoDelivery.tbPolling.fieldbyname('qtd_pedidos').value) + 'º pedido do cliente';
    lbObservacoesEntrega.Caption := PedidoPlataformaSelecionado.Complemento;

    lbNomeClienteAssociacao.caption := lbNomeCliente.caption;
    lbEnderecoClienteAssociacao.caption := lbEnderecoCliente.caption;
    lbBairroClienteAssociacao.caption := lbBairro.caption;
    lbObsClienteAssociacao.Text := lbObservacoesEntrega.caption;
    lbNumeroPedidoAssociacao.caption := lbNumeroPedidoCliente.caption;

    if dmExpedicaoDelivery.tbPolling.fieldbyname('qtd_pedidos').value = 1 then
      pnClienteNovo.Visible := True
    else
      pnClienteNovo.Visible := False;

  finally
    FreeAndNil(tbAux);
    FreeAndNil(LSQL);

    scrollPedidos.Visible := True;
  end;
end;

procedure TfrmExpedicaoDelivery.mostrarProdutosDoPedido(AIDPedido: largeint);
var
  LSQL: TStringList;
  tbAux: TFDMemTable;
  Produto: TProdutoPlataforma;
  observacaoProduto: string;
  tipoPainel: SmallInt;
  i: integer;
begin

  LSQL := TStringList.Create;
  tbAux := TFDMemTable.Create(Self);
//  Produto := TProdutoPlataforma.Create;

  try

    try
      for i := 0 to PedidoPlataformaSelecionado.Produtos.Count - 1 do
      begin

        Produto := PedidoPlataformaSelecionado.Produtos.Items[i];

      {
        Produto.Nome := PedidoPlataformaSelecionado.Produtos[i].Nome;
        Produto.Quantidade := PedidoPlataformaSelecionado.Produtos[i].quantidade;
        Produto.preco := PedidoPlataformaSelecionado.Produtos[i].preco;
        Produto.total := PedidoPlataformaSelecionado.Produtos[i].total;
        if Produto.pizza then
          Produto.ObservacaoPreparo := UpperCase(PedidoPlataformaSelecionado.Produtos[i].ObservacaoPreparo) + ' ---' + UpperCase(PedidoPlataformaSelecionado.Produtos[i].ObservacaoPreparo)
        else
          Produto.ObservacaoPreparo := UpperCase(PedidoPlataformaSelecionado.Produtos[i].ObservacaoPreparo);
            }
        tipoPainel := 1;
        criaPainelPedido('aaa', Produto, tipoPainel);

        if (Trim(Produto.ObservacaoPreparo) <> '') or (Trim(Produto.saboresPizzaDescricao) <> '') then
          criaPainelPedido('xadas', Produto, 3);

      end;

    except
      on E: Exception do
      begin
      end
    end;
  finally
    tbAux.Close;
    FreeAndNil(LSQL);
    FreeAndNil(tbAux);
//    FreeAndNil(Produto);

  end

end;

procedure TfrmExpedicaoDelivery.mostraFormasPagamento(AIDPedido: LongInt);
var
  tbAux: TFDMemTable;
  LSQL: TStringList;
  Produto: TProdutoPlataforma;
  ctPagamentos: integer;
begin
  LSQL := TStringList.Create;
  tbAux := TFDMemTable.Create(Self);
  Produto := TProdutoPlataforma.Create;

  try

    criaPainelPedido('xyz', Produto, 7);
    LSQL.Clear;
    LSQL.Add(' select coalesce(p.subtotal_pedido,0) as subtotal, coalesce(p.desconto,0) as desconto, coalesce(p.total_pedido,0) as total, ');
    LSQL.Add('  coalesce(p.VALOR_TAXA_ENTREGA,0) as entrega from integracoes_pedidos p');
    LSQL.Add('      where p.id= ' + IntToStr(AIDPedido));
    dm.getMemTable(tbAux, LSQL.Text);
    Produto.Nome := '';
    Produto.preco := 0;
    Produto.total := 0;
    Produto.Nome := PadLeftA(PadRightA('Subtotal', 35, ' '), 50);
    Produto.preco := tbAux.FieldByName('subtotal').Value;
    criaPainelPedido('xyz', Produto, 6);

    if tbAux.FieldByName('entrega').Value <> 0 then
    begin
      Produto.Nome := '';
      Produto.preco := 0;
      Produto.total := 0;
      Produto.Nome := PadLeftA(PadRightA('Tx. entrega', 35, ' '), 50);
      Produto.preco := tbAux.FieldByName('entrega').Value;
      criaPainelPedido('xyz', Produto, 6);
    end;

    if tbAux.FieldByName('desconto').Value <> 0 then
    begin
      Produto.Nome := '';
      Produto.preco := 0;
      Produto.total := 0;
      Produto.Nome := PadLeftA(PadRightA('Desconto restaurante', 35, ' '), 50);
      Produto.preco := tbAux.FieldByName('desconto').Value *  - 1;
      criaPainelPedido('xyz', Produto, 6);
    end;

    if tbAux.FieldByName('total').Value <> 0 then
    begin
      Produto.Nome := '';
      Produto.preco := 0;
      Produto.total := 0;
      Produto.Nome := PadLeftA(PadRightA('Total', 35, ' '), 50);
      Produto.preco := tbAux.FieldByName('total').Value;
      criaPainelPedido('xyz', Produto, 6);
    end;

    Produto.Nome := '';
    Produto.preco := 0;
    Produto.total := 0;
    criaPainelPedido('2323232', Produto, 7);
    Produto.Nome := 'Formas de pagamento';
    criaPainelPedido('DescricaoForma', Produto, 4);
    Produto.Nome := '';
    criaPainelPedido('123123', Produto, 7);

    for ctPagamentos := 0 to PedidoPlataformaSelecionado.Pagamentos.Count - 1 do
    begin
      Produto.Nome := '';
      Produto.preco := 0;
      Produto.total := 0;
      Produto.Nome := PedidoPlataformaSelecionado.Pagamentos[ctPagamentos].descricao;
      Produto.preco := PedidoPlataformaSelecionado.Pagamentos[ctPagamentos].valor;
      criaPainelPedido('123231', Produto, 6);
    end;

  finally
    FreeAndNil(tbAux);
    FreeAndNil(LSQL);
    FreeAndNil(Produto);
  end;

end;

procedure TfrmExpedicaoDelivery.RefreshAccessToken;
var
  LJsonRetorno: TStringList;
  LJsonALC: TALJSONNodeA;
  LData, LHora, LDataHora: string;
  LHeaders: TStringList;
  LBody: Tstringlist;
  LURLParam: string;
  LUserCode: string;
  LauthorizationCodeVerifier: string;
  LAutorizationCode: string;
  LAcessToken, LRefreshToken: string;
  LExpiracaoAccessToken, LExpiracaoRefreshToken: TDateTime;
  LSQL: TStringList;
  LMemTable: TFDMemTable;
begin

  LJsonRetorno := TStringList.Create;
  LJsonALC := TALJSONDocumentA.Create;
  LHeaders := TStringList.Create;
  LHeaders.NameValueSeparator := '=';

  LBody := TStringList.Create;
  LBody.NameValueSeparator := '=';

  LSQL := TStringlist.Create;
  LMemTable := TFDMemTable.Create(self);

  try
    try
      dm.getMemTable(LMemTable, 'select refresh_token from integracoes_empresa where codigo=1');
      LRefreshToken := LMemTable.Fields[0].Value;
      LMemTable.active := false;

      LAutorizationCode := dmExpedicaoDelivery.getValorParametro('AUTH_CODE');
      LauthorizationCodeVerifier := dmExpedicaoDelivery.getValorParametro('CODE_VERIF');

      LBody.add('grantType=refresh_token');
      LBody.add('clientId=' + ClientIDIfood);
      LBody.add('clientSecret=' + ClientSecretIfood);
      LBody.add('refreshToken=' + LRefreshToken);

      if dmExpedicaoDelivery.HTTPRequest(teGetUserTokens, LURLParam, LHeaders, LBody, LJsonRetorno, 5, 5, ctAPPLICATION_X_WWW_FORM_URLENCODED) then
      begin
        LExpiracaoAccessToken := IncSecond(now, 10800);
        LExpiracaoRefreshToken := IncSecond(now, 604800);

        LJsonRetorno.Text := dmExpedicaoDelivery.trataJsonInicial(LJsonRetorno.Text);
        LJsonALC.LoadFromJSONString(LJsonRetorno.Text, []);
        LAcessToken := Trim(LJsonALC.childnodes['RES'].childnodes['accessToken'].text);
        LRefreshToken := Trim(LJsonALC.childnodes['RES'].childnodes['refreshToken'].text);
        ExpiracaoToken := LExpiracaoAccessToken;
        TokenIfood := LAcessToken;

        LSQL.add('update INTEGRACOES_EMPRESA set token=' + Quotedstr(LAcessToken) + ',');
        LSQL.add(' REFRESH_TOKEN=' + Quotedstr(LRefreshToken) + ',');
        LSQL.add('  EXPIRACAO_TOKEN=' + QUotedstr(formatDateTime('DD.MM.YYY HH:MM:SS', LExpiracaoAccessToken)) + ',');
        LSQL.add('  EXPIRACAO_REFRESH_TOKEN=' + QUotedstr(formatDateTime('DD.MM.YYY HH:MM:SS', LExpiracaoRefreshToken)) + ' where codigo=1');
        dm.executaSQL(LSQL.Text);
        dmExpedicaoDelivery.AtualizaTabelaDeParametros;
      end
      else
      begin
        raise Exception.Create('Erro ao requisitar credenciais do app ');
      end;

    except
      on E: Exception do
      begin
        //AddLogErros('Erro ao requisitar json do pedido! ' + sLineBreak + 'Id do Evento: ' + AOrder.IDPlataforma + sLineBreak + 'Erro: ' + E.Message);
        raise Exception.Create('Erro ao requisitar json do pedido!' + E.Message);
      end;

    end;
  finally
    FreeAndNil(LJsonALC);
    FreeAndNil(LJsonRetorno);
    FreeAndNil(LHeaders);
    FreeAndNil(LBody);
    FreeAndNil(LSQL);
    FreeAndNil(LMemTable);
  end;
end;

procedure TfrmExpedicaoDelivery.gerarMapaLocalizacaoCliente();
var
  latitude, longitude: string;
  urlBase: string;
  urlChamada: string;
  strEndereco: string;
  EnderecoList: TStringList;
  i: integer;
  MyClass: TComponent;
begin
  urlBase := 'https://www.google.com.br/maps/place/';
  EnderecoList := TStringList.Create;

   {
   urlBase :='https://www.google.com/maps/search/?api=1&query=#latcliente,#longcliente';
   latitude  := ServerMethodDM.TrocaVirgPPto(Floattostr(DMCompartilhado.tbPolling.fieldbyname('latitude').value));
   longitude := ServerMethodDM.TrocaVirgPPto(Floattostr(DMCompartilhado.tbPolling.fieldbyname('longitude').value));




   urlChamada := urlBase;
   urlChamada:= StringReplace(urlChamada ,'#latcliente',latitude   ,[rfReplaceAll, rfIgnoreCase]);
   urlChamada:= StringReplace(urlChamada ,'#longcliente',longitude ,[rfReplaceAll, rfIgnoreCase]);
   }


  try
    urlChamada := urlBase + trim(geraEnderecoClienteGMAPS());
//  criaHtmlDeLocalizacao;
//    WebView1.Active := false;
//    WebView1.Uri := urlChamada;
//    WebView1.Active := true;
//    WebView1.Show;

  finally
    FreeAndNil(EnderecoList);
  end;

end;

function TfrmExpedicaoDelivery.geraEnderecoClienteGMAPS(): string;
var
  strEndereco: string;
  EnderecoList: TStringList;
  i: integer;
  MyClass: TComponent;
begin

  EnderecoList := TStringList.Create;

  try
    strEndereco := dmExpedicaoDelivery.tbPolling.fieldbyname('endereco_completo').value + ' ';
    strEndereco := strEndereco + dmExpedicaoDelivery.tbPolling.fieldbyname('bairro').value + ' ';
    strEndereco := strEndereco + dmExpedicaoDelivery.tbPolling.fieldbyname('nomeCidade').value + ' ';
    strEndereco := strEndereco + dmExpedicaoDelivery.tbPolling.fieldbyname('nomeEstado').value;

    lbLocalizacaoCliente.Caption := UpperCase(strEndereco);
    lbNomeClienteLocalizacao.Caption := UpperCase(lbNomeCliente.Caption);

    EnderecoList.Clear;
    EnderecoList.Delimiter := ' ';
    EnderecoList.StrictDelimiter := true;
    EnderecoList.DelimitedText := strEndereco;

    strEndereco := '.';
    for i := 0 to EnderecoList.Count - 1 do
    begin
      strEndereco := strEndereco + '+' + EnderecoList[i];
    end;
    strEndereco := copy(strEndereco, 1, length(strEndereco) + 3);
    Result := strEndereco;
  finally
    FreeAndNil(EnderecoList);
  end;
end;

procedure TfrmExpedicaoDelivery.gerarRotaEntregaPedido();
var
  latitude, longitude: string;
  urlBase: string;
  urlChamada: string;
  strEndereco: string;
  i: integer;
  MyClass: TComponent;
  enderecoPartida: string;
  enderecoDestino: string;
begin

  try
    urlBase := 'https://www.google.com.br/maps/dir/';

    enderecoPartida := trim(geraEnderecoLocal());
    enderecoDestino := trim(geraEnderecoClienteGMAPS());
    urlChamada := urlBase + enderecoPartida + '/' + enderecoDestino;

//    WebView1.Active := false;
//    WebView1.Uri := urlChamada;
//  WebView1.Active := true;
 //   WebView1.Show;

  finally

  end;

end;

function TfrmExpedicaoDelivery.geraEnderecoLocal(): string;
var
  strEndereco: string;
  EnderecoList: TStringList;
  i: integer;
  MyClass: TComponent;
begin

  EnderecoList := TStringList.Create;

  try
    strEndereco := dmExpedicaoDelivery.getValorParametro('ENDERECO_EMPRES');

    EnderecoList.Clear;
    EnderecoList.Delimiter := ' ';
    EnderecoList.StrictDelimiter := true;
    EnderecoList.DelimitedText := strEndereco;

    strEndereco := '.';
    for i := 0 to EnderecoList.Count - 1 do
    begin
      strEndereco := strEndereco + '+' + EnderecoList[i];
    end;
    strEndereco := copy(strEndereco, 1, length(strEndereco) + 3);
    Result := strEndereco;
  finally
    FreeAndNil(EnderecoList);
  end;
end;

procedure TfrmExpedicaoDelivery.PngSpeedButton11Click(Sender: TObject);
begin
  inherited;
    pgExpedicao.Show;
end;

procedure TfrmExpedicaoDelivery.PngSpeedButton14Click(Sender: TObject);
begin
  inherited;
  pgExpedicao.Show;
end;

procedure TfrmExpedicaoDelivery.PngSpeedButton8Click(Sender: TObject);
begin
  inherited;
  pgExpedicao.Show;
end;

end.

