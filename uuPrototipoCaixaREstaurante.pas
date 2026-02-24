unit uuPrototipoCaixaREstaurante;

interface

uses
  Windows, ACBrUtil, Messages, SysUtils, variants, StdCtrls, Classes, Graphics,
  Produto, Vcl.Clipbrd, System.Generics.Collections, TransferenciaItem,
  cxTextEdit, Controls, Forms, Dialogs, ExtCtrls, Buttons, Grids, DBGrids,
  uu_cs_produtos, uu_frm_principal, uu_transferir_item, uu_transferir_mesa,
  uu_cs_garcons, uu_encerramento, uu_extrato, uu_recebimentos_parciais, StrUtils,
  uu_cancela_item_restaurante, uu_obs_lancamento_caixa, uuSelecaoSaboresPizza,
  uuExpedicaoDelivery, uuOperacoesCaixa, uu_modelo_Vazio, Data.DB, cxGraphics,
  cxControls, Vcl.Menus, ACBrCalculadora, Vcl.DBCGrids, RxCurrEdit, Math,
  RealFramework, acbrBal, ibx.ibquery, dxGDIPlusClasses, uuExtratoDiversasMesas,
  JvPageList, JvExControls, JvValidateEdit, AdvOfficeImage, PngSpeedButton,
  cxStyles, cxDataStorage, cxGridLevel, cxGridCustomTableView, cxGridDBTableView,
  cxGridCustomView, cxGrid, cxClasses, dxCustomHint, cxHint, cxLookAndFeels,
  cxLookAndFeelPainters, cxEdit, cxNavigator, cxDBData, cxCurrencyEdit,
  dxScreenTip, ACBrBase, cxGridTableView, JvExStdCtrls, JvEdit, System.ImageList,
  Vcl.ImgList, cxImageList, cxCheckBox, RxLookup, AdvGlassButton, Vcl.DBCtrls,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error,
  FireDAC.DatS, FireDAC.Comp.DataSet, FireDAC.Comp.Client, JvExExtCtrls, JvShape,
  cxContainer, cxImage, Vcl.ExtDlgs, cxCustomData, cxFilter, cxData,
  dxDateRanges, dxScrollbarAnnotations;

type
  TcxViewInfoAcess = class(TcxGridTableDataCellViewInfo);

  TcxPainterAccess = class(TcxGridTableDataCellPainter);

  TOpcaoMenu = (TOpMenu, TOTransferenciaItem, TOCancelamentoItem, TOFotoCliente);

type
  Tfrm_caixa_restaurante = class(Tfrm_modelo_vazio)
    memo_codigos_formas: TMemo;
    Panel2: TPanel;
    lb_hora: TLabel;
    Timer1: TTimer;
    PopupMenu1: TPopupMenu;
    CancelamentodeProduto1: TMenuItem;
    RANSFERNCIA1: TMenuItem;
    pisca1: TTimer;
    pisca2: TTimer;
    Label11: TLabel;
    imgMapa: TImage;
    cxStyleRepository1: TcxStyleRepository;
    cxStyle2: TcxStyle;
    cxStyle1: TcxStyle;
    cxHintStyleController1: TcxHintStyleController;
    timerHint: TTimer;
    cxImageList1: TcxImageList;
    panelPrincipal: TPanel;
    ACBrCalculadora1: TACBrCalculadora;
    imgMesa: TImage;
    Selecionartodos1: TMenuItem;
    N1: TMenuItem;
    Removerseleodeetodos1: TMenuItem;
    N2: TMenuItem;
    Receberlanamentosdestepedido1: TMenuItem;
    pgListPrincipal: TJvPageList;
    pgCombos: TJvStandardPage;
    Panel13: TPanel;
    pnPrincipalCombos: TPanel;
    Panel19: TPanel;
    pnTopoGrupos: TPanel;
    Panel20: TPanel;
    Panel22: TPanel;
    DBCtrlGrid2: TDBCtrlGrid;
    Panel23: TPanel;
    DBText5: TDBText;
    DBText6: TDBText;
    Panel24: TPanel;
    Panel25: TPanel;
    Panel26: TPanel;
    pnGruposAdicionais: TPanel;
    pnTitulo: TPanel;
    lbTituloGrupoCompo: TLabel;
    btSom: TPngSpeedButton;
    pnDataHora: TPanel;
    pgPrincipal: TJvStandardPage;
    frm_caixa_restaurante: TPanel;
    pnFundoPrincipal: TPanel;
    Panel5: TPanel;
    pnPgListMovimento: TPanel;
    pgLista: TJvPageList;
    pgMovimentoMesa: TJvStandardPage;
    lb_cod_produto: TLabel;
    Panel3: TPanel;
    Panel11: TPanel;
    Panel14: TPanel;
    Panel1: TPanel;
    Panel15: TPanel;
    Panel16: TPanel;
    Panel12: TPanel;
    pgListGridMovimento: TJvPageList;
    pgMovimentoDetalhado: TJvStandardPage;
    btPreConta: TPngSpeedButton;
    btCancelarItem: TPngSpeedButton;
    btReceberConta: TPngSpeedButton;
    btTransferirMesa: TPngSpeedButton;
    btTransferirItem: TPngSpeedButton;
    btReabrirMesa: TPngSpeedButton;
    btRecebimentosParciais: TPngSpeedButton;
    btDelivery: TPngSpeedButton;
    btFuncoesDoCaixa: TPngSpeedButton;
    pgMapaMesas: TJvStandardPage;
    Panel6: TPanel;
    Panel7: TPanel;
    AdvOfficeImage1: TAdvOfficeImage;
    Label4: TLabel;
    ed_valor_bruto: TJvValidateEdit;
    Panel8: TPanel;
    AdvOfficeImage2: TAdvOfficeImage;
    Label7: TLabel;
    ed_total_tx_serv: TJvValidateEdit;
    Panel9: TPanel;
    AdvOfficeImage3: TAdvOfficeImage;
    Label8: TLabel;
    ed_total_desconto: TJvValidateEdit;
    Panel10: TPanel;
    Label9: TLabel;
    AdvOfficeImage9: TAdvOfficeImage;
    ed_total_pago: TJvValidateEdit;
    Panel21: TPanel;
    AdvOfficeImage4: TAdvOfficeImage;
    Label10: TLabel;
    ed_total_conta: TJvValidateEdit;
    Panel28: TPanel;
    Panel27: TPanel;
    pnMenu: TPanel;
    Panel29: TPanel;
    pnModoVisualizacao: TPanel;
    rdg_modo_visualizacao: TRadioGroup;
    cxGrid1: TcxGrid;
    tbViewDetalhado: TcxGridDBTableView;
    tbViewDetalhadoSelecionado: TcxGridDBColumn;
    tbViewDetalhadoCOD_BARRAS: TcxGridDBColumn;
    tbViewDetalhadoDESCRICAO: TcxGridDBColumn;
    tbViewDetalhadoQUANTIDADE: TcxGridDBColumn;
    tbViewDetalhadoVALOR_UNITARIO: TcxGridDBColumn;
    tbViewDetalhadoDESCONTO: TcxGridDBColumn;
    tbViewDetalhadoTOTAL: TcxGridDBColumn;
    tbViewDetalhadoNomeCliente: TcxGridDBColumn;
    tbViewDetalhadoOBSERVACOES: TcxGridDBColumn;
    tbViewDetalhadoColumn1: TcxGridDBColumn;
    tbViewDetalhadoColumnPago: TcxGridDBColumn;
    tbViewResumido: TcxGridDBTableView;
    cxGridDBColumn12: TcxGridDBColumn;
    cxGridDBColumn13: TcxGridDBColumn;
    cxGridDBColumn14: TcxGridDBColumn;
    cxGridDBColumn15: TcxGridDBColumn;
    cxGridDBColumn16: TcxGridDBColumn;
    cxGridDBTableView1Column17: TcxGridDBColumn;
    lvDetalhado: TcxGridLevel;
    lvResumido: TcxGridLevel;
    pgListOpcoes: TJvPageList;
    pgMenu: TJvStandardPage;
    pgTransferirItens: TJvStandardPage;
    Panel30: TPanel;
    lbTitulo: TLabel;
    pnTransferirItem: TPanel;
    Panel31: TPanel;
    Panel32: TPanel;
    Panel33: TPanel;
    Panel34: TPanel;
    Panel35: TPanel;
    Label6: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    edMesaDestino: TEdit;
    cmbMotivoTransferenciaItem: TRxDBLookupCombo;
    memoObsTransferenciaItem: TMemo;
    Panel36: TPanel;
    AdvGlassButton1: TAdvGlassButton;
    AdvGlassButton3: TAdvGlassButton;
    pnTopo: TPanel;
    lbQuantidade: TLabel;
    pn_mesa: TPanel;
    Label15: TLabel;
    edNumeroMesa: TEdit;
    pn_garcon: TPanel;
    Label1: TLabel;
    edCodGarcon: TEdit;
    pnCodProduto: TPanel;
    Label2: TLabel;
    edCodProduto: TEdit;
    edQuantidade: TEdit;
    pnDadosProduto: TPanel;
    Label3: TLabel;
    Label5: TLabel;
    ed_descricao_produto: TEdit;
    ed_valor_produto: TEdit;
    Panel17: TPanel;
    lbNomeEmpresa: TLabel;
    AdvOfficeImage6: TAdvOfficeImage;
    AdvOfficeImage10: TAdvOfficeImage;
    lbDataSistema: TLabel;
    lbHora: TLabel;
    AdvOfficeImage11: TAdvOfficeImage;
    lbNomeUsuario: TLabel;
    lbQtdMesas: TLabel;
    lbMesasPagto: TLabel;
    PngSpeedButton1: TPngSpeedButton;
    Panel4: TPanel;
    Panel37: TPanel;
    C1: TMenuItem;
    pgFotoCliente: TJvStandardPage;
    Panel18: TPanel;
    Label14: TLabel;
    Panel38: TPanel;
    imgFotoCliente: TcxImage;
    AdvGlassButton2: TAdvGlassButton;
    AdvGlassButton4: TAdvGlassButton;
    Exibirimagemcapturada1: TMenuItem;
    AdvGlassButton5: TAdvGlassButton;
    saveDialog: TSavePictureDialog;
    pnMovimentoMesa: TPanel;
    DBCtrlGrid1: TDBCtrlGrid;
    N3: TMenuItem;
    s1: TMenuItem;
    C2: TMenuItem;
    C3: TMenuItem;
    ckbMesasPagamento: TCheckBox;
    S2: TMenuItem;
    A1: TMenuItem;
    N4: TMenuItem;
    stlNomes: TcxStyle;
    stlNomesODD: TcxStyle;
    popClientesPorNome: TPopupMenu;
    E1: TMenuItem;
    stlHeaderClientes: TcxStyle;
    popOpcoesListaClientes: TPopupMenu;
    J1: TMenuItem;
    A2: TMenuItem;
    pgListaClientes: TJvStandardPage;
    pnListaClientes: TPanel;
    Panel41: TPanel;
    Label16: TLabel;
    Panel39: TPanel;
    btOcultarLista: TAdvGlassButton;
    Panel40: TPanel;
    Label17: TLabel;
    edNomeCliente: TEdit;
    Panel42: TPanel;
    cxGrid2: TcxGrid;
    cxGrid2DBTableView1: TcxGridDBTableView;
    cxGrid2DBTableView1SEL: TcxGridDBColumn;
    cxGrid2DBTableView1NOME_CLIENTE: TcxGridDBColumn;
    cxGrid2DBTableView1MESA: TcxGridDBColumn;
    cxGrid2DBTableView1GUID_CLIENTE: TcxGridDBColumn;
    cxGrid2DBTableView1COD_CLIENTE: TcxGridDBColumn;
    cxGrid2Level1: TcxGridLevel;
    procedure A1Click(Sender: TObject);
    procedure A2Click(Sender: TObject);
    procedure edNumeroMesaExit(Sender: TObject);
    function busca_movimento_da_mesa: boolean;
    function informacoes_garcon: boolean;
    function pesquisar_produto: boolean;
    function verifica_validade_lancamento: boolean;
    function pesquisa_produto: boolean;
    function gravar_tx_serv: boolean;
    procedure edNumeroMesaKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure FormActivate(Sender: TObject);
    procedure edNumeroMesaEnter(Sender: TObject);
    procedure DBGrid1DrawDataCell(Sender: TObject; const Rect: TRect; Field: TField; State: TGridDrawState);
    procedure bt_pesq_produtoClick(Sender: TObject);
    procedure B20002001KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure pesquisaGarcons();
    procedure btPreContaClick(Sender: TObject);
    procedure btTransferirMesaClick(Sender: TObject);
    procedure btTransferirItemClick(Sender: TObject);
    procedure btRecebimentosParciaisClick(Sender: TObject);
    function verifica_movimento: boolean;
    procedure B300010040Click(Sender: TObject);
    procedure verificar_permissoes;
    procedure voltar_mesa;
    procedure B20002014Click(Sender: TObject);
    procedure transferirMesa();
    procedure transferirItem();
    procedure btCancelarItemClick(Sender: TObject);
    procedure B30001001KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure emitirExtrato(variasMesas: boolean);
    procedure fecharConta();
    procedure rdg_modo_visualizacaoClick(Sender: TObject);
    procedure efetuar_lancamento;
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure edNumeroMesaChange(Sender: TObject);
    procedure edCodProdutoChange(Sender: TObject);
    procedure edQuantidadeChange(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure timerAtualizaTelaMesasTimer(Sender: TObject);
    procedure enter_botao(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure btCalculadoraClick(Sender: TObject);
    procedure btDeliveryClick(Sender: TObject);
    procedure CancelamentodeProduto1Click(Sender: TObject);
    procedure RANSFERNCIA1Click(Sender: TObject);
    procedure gravarEstornoMesa(mesa: string);
    procedure muda_acao(tipo: integer);
    procedure pisca1Timer(Sender: TObject);
    procedure pisca2Timer(Sender: TObject);
    procedure pnExpedicaoClick(Sender: TObject);
    procedure imgAtencaoClick(Sender: TObject);
    procedure btFuncoesDoCaixaClick(Sender: TObject);
    procedure mostraMapaMesas();
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure timerAtualizaMesasTimer(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btReabrirMesaClick(Sender: TObject);
    procedure edCodGarconChange(Sender: TObject);
    procedure DBCtrlGrid1PaintPanel(DBCtrlGrid: TDBCtrlGrid; Index: Integer);
    procedure imgMesaMouseEnter(Sender: TObject);
    procedure DBText2Click(Sender: TObject);
    procedure imgMesaClick(Sender: TObject);
    procedure DBCtrlGrid1Click(Sender: TObject);
    procedure tbViewDetalhadoCustomDrawCell(Sender: TcxCustomGridTableView; ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
    procedure tbViewDetalhadoMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
    procedure timerHintTimer(Sender: TObject);
    procedure cxGridDBTableView1KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure tbViewDetalhadoKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure DBCtrlGrid1KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure ed_valor_produtoExit(Sender: TObject);
    procedure edQuantidadeKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure edQuantidadeEnter(Sender: TObject);
    procedure Edit1Exit(Sender: TObject);
    procedure tbViewDetalhadoColumnPagoCustomDrawCell(Sender: TcxCustomGridTableView; ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
    procedure tbViewDetalhadoColumnPagoGetDataText(Sender: TcxCustomGridTableItem; ARecordIndex: Integer; var AText: string);
    procedure tbViewDetalhadoColumnPagoGetDisplayText(Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord; var AText: string);
    procedure btSairClick(Sender: TObject);
    procedure AdvGlassButton3Click(Sender: TObject);
    procedure AdvGlassButton1Click(Sender: TObject);
    procedure Selecionartodos1Click(Sender: TObject);
    procedure Removerseleodeetodos1Click(Sender: TObject);
    procedure Receberlanamentosdestepedido1Click(Sender: TObject);
    procedure btSomClick(Sender: TObject);
    procedure DBText5Click(Sender: TObject);
    procedure Panel23Click(Sender: TObject);
    procedure tbViewDetalhadoEditKeyDown(Sender: TcxCustomGridTableView; AItem: TcxCustomGridTableItem; AEdit: TcxCustomEdit; var Key: Word; Shift: TShiftState);
    procedure PngSpeedButton1Click(Sender: TObject);
    procedure btReceberContaClick(Sender: TObject);
    procedure C1Click(Sender: TObject);
    procedure AdvGlassButton4Click(Sender: TObject);
    procedure Exibirimagemcapturada1Click(Sender: TObject);
    procedure AdvGlassButton5Click(Sender: TObject);
    procedure AdvGlassButton2Click(Sender: TObject);
    procedure btOcultarListaClick(Sender: TObject);
    procedure btn_peq_produtoClick(Sender: TObject);
    procedure C3Click(Sender: TObject);
    procedure ckbMesasPagamentoClick(Sender: TObject);
    procedure cxGrid2DBTableView1KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure E1Click(Sender: TObject);
    procedure edNomeClienteChange(Sender: TObject);
    procedure J1Click(Sender: TObject);
    procedure s1Click(Sender: TObject);
    procedure S2Click(Sender: TObject);
  private
    { Private declarations }
    modo_exibicao: integer;
    podeAtualizar: Boolean;
    FGuidSeqImpressao: string;
    FHintDisplayed: Boolean;
    FGridRecord: TcxCustomGridRecord;
    FItem: TcxCustomGridTableItem;
    procedure OnExitCodGarcon;
    procedure OnexitCodProduto;
    procedure ClearEdits;
    procedure OnExitQuantidade;
    procedure validaQuantidade;
    procedure exibeOpcaoDoMenu(Aopcao: TOpcaoMenu);
    procedure TransferirItens;
    procedure LimpaDadosTransferenciaItem;
    procedure SelecionarTodosOsItens(ASelecionar: Boolean);
    procedure ClickSelecaoGrupoCombo(Sender: TObject);
    procedure LancarAdicionaisFixos(ACodProduto: string; AIDCombo: Integer);
    function adicionar_produto_conta(mesa: string; enviar_impressao: boolean; idCombo: Integer; AItemAdicional: boolean): boolean;
    procedure selecionaItemcombo;
    procedure lancarProdutosCombo;
    procedure EstornarMesa;
    procedure IniciaRecebimentoDeConta;
    function VerificaSeMesaTemPedidosDeIntegracao: boolean;
    procedure ImprimirMovimentoMesaPDF;
    procedure SepararContaCoClienteSelecionado;
    procedure FiltrarClientesPorNome(ANome: string);
    procedure AbrirListaDeClientes;
    procedure JuntarContaClientesSelecionados;
    procedure JuntarClientesSelecionados;
    procedure SelecionaCliente;







    //0 normal
    //1 resumido

  public
    { Public declarations }
    tipo_caixa_atual: integer;
    procedure apagaItemMovimento(AQuantidade: double; ACodMotivo, ADescricaoMotivo, AObs: string);
  end;

var
  frm_caixa_restaurante: Tfrm_caixa_restaurante;
  tx_serv: double;
  pagina: TScrollbox;
  tipo_botao: integer;
  selecionado: string;
  total_mesas: integer;
  quantidadeLancamento: Double;
  LDesativarPerguntaPreContaEmitida: boolean;

implementation


{$R *.dfm}

uses
  uu_data_module, uuDigitaPesoManualmente, uuDmRelatorios, uuMudaNomeCliente;

procedure Tfrm_caixa_restaurante.A1Click(Sender: TObject);
begin
  Application.CreateForm(TfrmMudaNomeCliente, frmMudaNomeCliente);
  frmMudaNomeCliente.showmodal;
  frmMudaNomeCliente.Free;
  busca_movimento_da_mesa;

end;

procedure Tfrm_caixa_restaurante.A2Click(Sender: TObject);
begin
  edNumeroMesa.Text := dm.memTbClientesMesa.FieldByName('mesa').Value;
  dm.memTbClientesMesa.Active := false;
  pgMovimentoDetalhado.Show;
  busca_movimento_da_mesa;

end;

procedure Tfrm_caixa_restaurante.edNumeroMesaExit(Sender: TObject);
var
  qtdeCalculada: double;
begin

  if (trim(edNumeroMesa.Text) = '') then
    Exit;

  try
    try
      StrToInt(edNumeroMesa.Text);
      edNumeroMesa.Text := Formatfloat('0000', StrToFloat(edNumeroMesa.text));
    except
      showRealDialog(frm_principal, tmErro, 'Erro', 'Número de mesa inválido!', 22, false);
      edNumeroMesa.clear;
      edNumeroMesa.setfocus;
      exit;
    end;

    if StrToInt(edNumeroMesa.Text) > 9999 then
    begin
      showRealDialog(frm_principal, tmErro, 'Erro', 'Número de mesa inválido!', 22, false);
      edNumeroMesa.clear;
      edNumeroMesa.setfocus;
      exit;
    end;

    FGuidSeqImpressao := RandomName(8);
    pgMovimentoMesa.Show;
    btCancelarItem.Enabled := true;
    btTransferirItem.Enabled := true;
    btRecebimentosParciais.Enabled := true;
    btReceberConta.Enabled := true;

    podeAtualizar := false;
    edNumeroMesa.Text := dm.removeCaracteres(edNumeroMesa.Text);
    dm.transacao.Active := false;
    dm.transacao.Active := true;
    edQuantidade.text := '1';

    if trim(edNumeroMesa.Text) = '' then
    begin
      edNumeroMesa.Clear;
      edNumeroMesa.SetFocus;
      exit;
    end;

    if (dm.verificaseExisteMovimentoMesa(edNumeroMesa.Text) = false) then
    begin
      dm.apagaExtratosEmitidos(edNumeroMesa.Text);
      dm.ApagaAberturaDaMesa(edNumeroMesa.text);
      if dm.transacao.Active = false then
        dm.transacao.Active := true;
      dm.transacao.Commit;
    end
    else
    begin
      if (StrToInt(dm.LeIni(2, 'SALAO', 'estacaoLancamentoSalao')) = 0) then
        edCodGarcon.Text := dm.getCodGarconAbriuMesa(edNumeroMesa.Text);
    end;

    busca_movimento_da_mesa;

    if (dm.verificaExtratosEmitidos(edNumeroMesa.text) = true) then
    begin
      if (LDesativarPerguntaPreContaEmitida = true) then
      begin
        if (ShowRealDialog(Self, tmConfirmacao, 'Atenção', 'Uma pré-conta dessa mesa já foi emitida. ' + sLineBreak + sLineBreak + 'Deseja continuar ?', 22, true) = teSim) then
        begin
          if (edCodGarcon.Visible) then
          begin
            edCodGarcon.SelectAll;
            edCodGarcon.SetFocus;
          end
          else
          begin
            edCodProduto.SelectAll;
            edCodProduto.SetFocus;
          end;
        end
        else
        begin
          ClearEdits;
          edNumeroMesa.SetFocus;
        end;
      end;

    end;

  finally

  end;

end;

function Tfrm_caixa_restaurante.busca_movimento_da_mesa: boolean;
var
  valor_bruto: double;
  valor_tx_serv: double;
  valorDescontos: double;
  Marcado: TBooleanField;
  LSQL: TStringList;
begin

  ed_total_tx_serv.Value := 0;
  ed_valor_bruto.Value := 0;
  ed_total_pago.value := 0;
  ed_total_desconto.Value := 0;
  ed_total_conta.Value := 0;

  dm.tbMovimentoMesa.Active := false;
  LSQL := TStringList.Create;
  LSQL.Clear;

  try
    try
      if (trim(edNumeroMesa.Text) = '') then
        exit;

      dm.InsereChavesMovimento(numero_caixa, edNumeroMesa.Text);
      edNumeroMesa.Text := Formatfloat('0000', StrToFloat(edNumeroMesa.text));
      if (rdg_modo_visualizacao.ItemIndex = 0) then
      begin
        pgListGridMovimento.ActivePage := pgMovimentoDetalhado;
        LSQL.Add('select 0 as selecionado, mv.cod_mesa,pr.cod_barras,pr.un_ecf,');
        LSQL.Add(' mv.cod_produto,pr.cod_produto,');
        LSQL.Add('pr.descricao,mv.quantidade as quantidade,');
        LSQL.Add('mv.valor_unitario,');
        LSQL.add(' udf_roundabnt((mv.valor_unitario * mv.quantidade),2)   as total');
        LSQL.Add(',mv.comanda, mv.cod_garcon, g.apelido,u.login,mv.hora_lancamento, mv.estado,mv.cod_movimento, mv.desconto,id,impresso,observacoes,sabores,obs_paf,cancelado,mv.tipo_massa,coalesce(mv.nome_cliente,' + Quotedstr('') + ') as nome_cliente,coalesce(mv.pago,0) as pago, coalesce(guid_pagamento,' + Quotedstr('') + ') as guid_pagamento,');
        LSQL.add(' coalesce(guid_order,' + Quotedstr('') + ') as guid_order,');
        LSQL.add(' coalesce(guid_lancamento,' + Quotedstr('') + ') as guid_lancamento,');
        LSQL.add(' coalesce(guid_imagem,' + Quotedstr('') + ') as guid_imagem,');
        LSQL.add(' coalesce(mv.cod_cliente,' + Quotedstr('') + ') as cod_cliente ');
        LSQL.Add('  from movimento_mesa mv ');
        LSQL.Add('  inner join produtos pr on (pr.cod_produto=mv.cod_produto)');
        LSQL.add('  inner join garcons g on (g.cod_garcon=mv.cod_garcon) ');
        LSQL.add('  inner join usuarios u on (u.cod_usuario=mv.cod_usuario)');
        LSQL.add('  where mv.cod_mesa=' + Quotedstr(edNumeroMesa.Text) + ' order by mv.id');
        cxGrid1.ActiveLevel := lvDetalhado;
      end
      else
      begin
        LSQL.add(' select  mv.cod_produto,p.cod_barras,p.descricao,                             ');
        LSQL.add(' 		sum(mv.quantidade)as quantidade,                                          ');
        LSQL.add(' 		MV.valor_unitario as valor_unitario,                                      ');
        LSQL.add(' 		sum(mv.desconto) as desconto,                                             ');
        LSQL.add(' 		udf_roundabnt(sum(mv.valor_unitario * mv.quantidade),2)   as total        ');
        LSQL.add('                                                                              ');
        LSQL.add(' 		   from movimento_mesa mv                                                 ');
        LSQL.add(' inner join produtos p on (p.cod_produto = mv.cod_produto)                    ');
        LSQL.add('  where mv.cod_mesa=' + Quotedstr(edNumeroMesa.Text) + ' and mv.cancelado <> 1  ');
        LSQL.add(' group by mv.cod_produto,p.cod_barras,p.descricao,mv.valor_unitario           ');
        LSQL.add(' order by mv.cod_produto');
        cxGrid1.ActiveLevel := lvResumido;

      end;

      dm.adicionaLog(LSQL.Text);
      dm.getMemTable(dm.tbMovimentoMesa, LSQL.Text);
      dm.qryauxiliar.Active := FALSE;
      dm.qryauxiliar.sql.clear;
      dm.qryauxiliar.SQL.add('select *  from rodapeextrato3(' + Quotedstr(edNumeroMesa.text) + ',' + dm.TrocaVirgPPto(Floattostr(percentualTaxaServico)) + ')');
      dm.qryauxiliar.Active := true;

      if (dm.tbMovimentoMesa.IsEmpty = false) then
      begin
        ed_total_tx_serv.Value := dm.qryauxiliar.fieldbyname('VALORTXSERV').Value;
        ed_valor_bruto.Value := dm.qryauxiliar.fieldbyname('VALORBRUTO').Value;
        ed_total_pago.Value := dm.qryauxiliar.fieldbyname('VALORPAGO').Value;
        ed_total_desconto.Value := dm.qryauxiliar.fieldbyname('VALORTOTALDESCONTO').Value;
        ed_total_conta.Value := dm.qryauxiliar.fieldbyname('VALORTOTAL').Value;
      end;

    except
      on E: Exception do
      begin
        showRealDialog(frm_principal, tmErro, 'Erro', 'Erro ao buscar o movimento da mesa!' + sLineBreak + sLineBreak + E.Message, 22, false);
        edNumeroMesa.setfocus;
        edNumeroMesa.clear;
      end;

    end;
  finally
    dm.qryauxiliar.Active := false;
    FreeAndNil(LSQL);
    ;
  end;

end;

function Tfrm_caixa_restaurante.informacoes_garcon: boolean;
begin
  dm.qry_consultas.Active := false;
  dm.qry_consultas.sql.clear;
  dm.qry_consultas.sql.add('select * from garcons where cod_garcon=' + Quotedstr(edCodGarcon.text));
  dm.qry_consultas.Active := true;
  if dm.qry_consultas.IsEmpty then
  begin

    showRealDialog(frm_principal, tmAviso, 'Informação', 'Não existe garçon cadastrado com o código informado!', 22, false);
    edCodGarcon.setfocus;
    edCodGarcon.clear;
    exit;
  end
  else
  begin

    //     ed_nome_garcon.Text:=dm.qry_consultas.fieldbyname('apelido').value;

  end;

end;

procedure Tfrm_caixa_restaurante.ClearEdits;
begin
  edNumeroMesa.clear;
  edCodProduto.clear;
  ed_descricao_produto.Clear;
  ed_valor_produto.Clear;
  edQuantidade.clear;
  edCodGarcon.Clear;
end;

procedure Tfrm_caixa_restaurante.edNumeroMesaKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
var
  posicaoAsterisco: SmallInt;
  multiplicador: string;
  valorTotalInStore: string;
  codProduto: string;
  unidadeMedida: string;
  qtde: string;
begin

  if Key = vk_return then
  begin
    Perform(WM_NEXTDLGCTL, 0, 0);
  end;

  if Key = vk_escape then
  begin
    ClearEdits;
    edNumeroMesa.SetFocus;
  end;

  if Key = vk_escape then
  begin
    if ((Sender is Tedit and ((Sender as Tedit).Name <> 'edNumeroMesa')) or (Sender is TDBGrid and ((Sender as TDBGrid).Name = 'DBGrid1'))) then
    begin
      if (trim(edNumeroMesa.Text) <> dm.getCodMesaBalcao()) then
      begin
        dm.tbMovimentoMesa.Active := false;
        ClearEdits;
      end;
    end;

    if Sender is Tedit and ((Sender as Tedit).Name = 'edNumeroMesa') then
    begin
      Close;
    end;

  end;

  if Key = vk_f2 then
  begin
    podeAtualizar := false;

    if Sender is Tedit and ((Sender as Tedit).Name = 'edCodProduto') then
      pesquisa_produto;
    if (StrToInt(dm.LeIni(2, 'SALAO', 'estacaoLancamentoSalao')) = 0) then
    begin
      if Sender is Tedit and ((Sender as Tedit).Name = 'edCodGarcon') then
        pesquisaGarcons;
    end;

  end;

  if ((Key = vk_f3)) then
  begin
    btPreConta.Click;
  end;

  if ((Key = vk_f4)) then
  begin
    btReceberConta.Click;
  end;

  if ((Key = vk_f5)) then
  begin
    EstornarMesa;
  end;

  if ((Key = vk_delete)) then
  begin
    btCancelarItem.Click;
  end;

  if ((Key = vk_f6)) then
  begin
    btTransferirMesa.Click;
  end;

  if ((Key = vk_f7)) then
  begin
    btTransferirItem.Click;
  end;

  if ((Key = vk_f8)) then
  begin
    btRecebimentosParciais.Click;
  end;

  if ((Key = vk_f9)) then
  begin
    btReabrirMesa.Click;
  end;

  if ((Key = vk_f10)) then
  begin
    btDelivery.Click;
  end;

  if ((Key = vk_f11)) then
  begin
    btFuncoesDoCaixa.Click;
  end;

end;

function Tfrm_caixa_restaurante.pesquisar_produto: boolean;
begin
  dm.qry_consultas.Active := false;
  dm.qry_consultas.SQL.Clear;
  dm.qry_consultas.SQL.add('select * from produtos ');
  dm.qry_consultas.Active := true;

  if dm.qry_consultas.IsEmpty then
  begin

    showRealDialog(frm_principal, tmAviso, 'Informação', 'Não existem produtos cadastrados!', 22, false);
    exit;
  end
  else
  begin
    Application.CreateForm(Tfrm_consulta_produtos, frm_consulta_produtos);
    frm_consulta_produtos.ShowModal;
    edCodProduto.Text := string_aux_cod_barras;
    frm_consulta_produtos.Free;
  end;
end;

function Tfrm_caixa_restaurante.verifica_validade_lancamento: boolean;
begin
  result := true;

  if ((dm.verificaExtratosEmitidos(edNumeroMesa.text) = true) and (dm.verificaseExisteMovimentoMesa(edNumeroMesa.Text)) and (dm.verificaMesaBalcao(edNumeroMesa.Text) = false)) then
  begin

    if (ShowRealDialog(Self, tmConfirmacao, 'Confirme', 'Mesa aguardando pagamento. Deseja reabrir ?') = teSim) then
    begin
      dm.apagaExtratosEmitidos(edNumeroMesa.Text);
    end
    else
    begin
      result := false;
      edNumeroMesa.SetFocus;
      exit;
    end;
  end;

  try
    begin
      edNumeroMesa.Text := formatfloat('0000', Strtofloat(edNumeroMesa.Text));
    end;
  except
    begin

      showRealDialog(frm_principal, tmAviso, 'Informação', 'Número de mesa inválido!', 22, false);

      edNumeroMesa.Clear;
      edNumeroMesa.SetFocus;
      Result := false;
      exit;
    end;
  end;

  try
    edCodGarcon.Text := FormatFloat('000', strtofloat(edCodGarcon.Text));
  except
    begin

      showRealDialog(frm_principal, tmAviso, 'Informação', 'Código de garçon inválido!', 22, false);
      edCodGarcon.clear;
      edCodGarcon.SetFocus;
      Result := false;
      exit;
    end;
  end;

  try
    //  edCodProduto.Text:=FormatFloat('00000',strtofloat(edCodProduto.Text));
  except
    begin

      showRealDialog(frm_principal, tmAviso, 'Informação', 'Código de produto inválido!', 22, false);
      edCodProduto.SetFocus;
      edCodProduto.Clear;
      Result := false;
      exit;
    end;
  end;

  if (frac(StrToFloat(edQuantidade.Text)) > 0) then
  begin
    if (verificaSeProdutoVendeFracionado(edCodProduto.Text, 2) = false) then
    begin

      showRealDialog(frm_principal, tmAviso, 'Informação', 'O produto informado não pode ser vendido fracionado!', 22, false);

      edQuantidade.clear;
      edQuantidade.SetFocus;
      Result := false;
      exit;
    end;

  end;

  dm.qryauxiliar.Active := false;
  dm.qryauxiliar.SQL.Clear;
  dm.qryauxiliar.SQL.Add('select * from produtos where cod_barras=' + Quotedstr(trim(edCodProduto.Text)));
  dm.qryauxiliar.Active := true;

  if dm.qryauxiliar.IsEmpty then
  begin

    showRealDialog(frm_principal, tmAviso, 'Informação', 'O código informado não pertence a um produto cadastrado!', 22, false);
    edCodProduto.SetFocus;
    edCodProduto.Clear;
    Result := false;
    exit;
  end;

  if (StrToFloat(edQuantidade.Text) >= 5) then
  begin

    if quantidadeLancamento > 1000 then
    begin
      showRealDialog(frm_principal, tmerro, 'Quantidade muito alta!', 'A quantidade que você está lançamento é muito alta.' + sLineBreak + 'Verifique e corrija o problema!', 22, false);
      quantidadeLancamento := 1;
      edQuantidade.Text := '';
      edQuantidade.SetFocus;
      Exit;
    end
    else
    begin

      if (ShowRealDialog(Self, tmConfirmacao, 'Confirme', 'A quantidade informada é considerada alta!' + #13#10 + #13#10 + '    Tem certeza que deseja lançar ' + FormatFloat('#0.000', StrToFloat(edQuantidade.Text)) + '  ' + ed_descricao_produto.Text + ' nesta conta ?') = teSim) then
      begin
        Result := true;
      end
      else
      begin
        Result := false;
        edQuantidade.SetFocus;
        exit;
      end;
    end;

  end;

  Result := true;
end;

procedure Tfrm_caixa_restaurante.selecionaItemcombo();
var
  codProduto, unidadeMedida, qtde: string;
  idGrupoClicado: longint;
begin
  inherited;
  idGrupoClicado := dm.qryProdutosAdicionais.FieldByName('id_grupo').Value;
  if (dm.tbGruposCombo.Locate('id_grupo_adicional', idGrupoClicado, [])) then
  begin
    dm.tbGruposCombo.Edit;
    dm.tbGruposCombo.FieldByName('codProdutoSelecionado').Value := dm.qryProdutosAdicionaisCOD_PRODUTO.Value;
    dm.tbGruposCombo.FieldByName('valorProdutoSelecionado').Value := dm.qryProdutosAdicionaisVALOR.AsFloat;
    dm.tbGruposCombo.Post;
  end;

  dm.tbGruposCombo.Next;
  dm.criaGruposCombo(lb_cod_produto.Caption, pnGruposAdicionais, dm.tbGruposCombo.FieldByName('id_grupo_adicional').Value, ClickSelecaoGrupoCombo);

  dm.tbGruposCombo.Last;
  if (dm.tbGruposCombo.FieldByName('id_grupo_adicional').Value = idGrupoClicado) then
  begin
    if dm.verificaSeTodosGruposComboForamSelecionados then
    begin
      lancarProdutosCombo;
      pgMovimentoDetalhado.Show;
    end;
  end     {

  codGrupoComboAtual := codGrupoComboAtual + 1;
  }
end;

procedure Tfrm_caixa_restaurante.lancarProdutosCombo();
var
  codProduto: string;
  qtdeProdutoCombo: double;
  IDCombo: string;
  LNumeroMesa: string;
begin
  LNumeroMesa := edNumeroMesa.Text;

  IDCombo := dm.geraCodigo('G_ID_COMBOS_VENDIDOS', 10);
  adicionar_produto_conta(LNumeroMesa, dm.verificaProdutoImprimeLocalProducao(lb_cod_produto.Caption), StrToInt(IDCombo), True);
  LancarAdicionaisFixos(lb_cod_produto.Caption, StrToInt(IDCombo));
  dm.tbGruposCombo.First;

  while not dm.tbGruposCombo.Eof do
  begin
    codProduto := dm.tbGruposCombo.FieldByName('codProdutoSelecionado').Value;
    lb_cod_produto.Caption := codProduto;
    ed_descricao_produto.Text := getDescricaoProduto(codProduto, 1);
    ed_valor_produto.Text := Floattostr(dm.tbGruposCombo.FieldByName('valorProdutoSelecionado').Value);
    //edQtdMesas.Text := '1';
    adicionar_produto_conta(LNumeroMesa, dm.verificaProdutoImprimeLocalProducao(lb_cod_produto.Caption), StrToInt(IDCombo), true);
    dm.tbGruposCombo.Next;
  end;

end;

function Tfrm_caixa_restaurante.adicionar_produto_conta(mesa: string; enviar_impressao: boolean; idCombo: LongInt; AItemAdicional: boolean): boolean;
var
  codigo_lancamento: string;
  observacoesProducao, saboresProducao: string;
  idMovimentoMesa: Largeint;
  codProdutoPizza: string;
  ct, qtdeProduto: integer;
  IDSaborPizza: string;
begin

  frm_principal.obsSaborPizza := '';
  observacoesProducao := '';
  frm_principal.tipoMassaPizza := '';

  if (StrToFloat(edQuantidade.Text) <= 0) then
  begin
    edQuantidade.text := '1';
  end;

  if ((verificaSeProdutoEhPizza(lb_cod_produto.Caption, 1) = true) and (AItemAdicional = false)) then
  begin
    frm_principal.obsSaborPizza := '';
    dm.tbSaboresPizzaTemp.Active := false;
    dm.tbSaboresPizzaTemp.EmptyTable;
    Application.CreateForm(TfrmSelecaoSaboresPizza, frmSelecaoSaboresPizza);
    frmSelecaoSaboresPizza.ShowModal;
    frmSelecaoSaboresPizza.Free;
    ed_valor_produto.Text := Floattostr(getValorPizza(lb_cod_produto.Caption, 1, 1));
  end;

  saboresProducao := '';

  if ((verificaSeProdutoEhPizza(lb_cod_produto.Caption, 1) = true) and (AItemAdicional = false)) then
  begin
    dm.tbSaboresPizzaTemp.First;
    while not dm.tbSaboresPizzaTemp.Eof do
    begin
      saboresProducao := saboresProducao + dm.tbSaboresPizzaTemptamanho.Value + ' ' + dm.tbSaboresPizzaTempdescricao.value + #10#13;
      dm.tbSaboresPizzaTemp.Next;
    end;
    observacoesProducao := frm_principal.obsSaborPizza;
  end
  else
  begin
    observacoesProducao := '';

    if (StrToInt(dm.LeIni(1, 'CAIXA', 'observacaoLancamento')) = 1) then
    begin

      if ((verificaSeProdutoRequerObservacao(lb_cod_produto.Caption, 1) = true) and (AItemAdicional = false)) then
      begin

        if (ShowRealDialog(Self, tmConfirmacao, 'Confirme', 'Informar observações ?') = teSim) then
        begin
          Application.CreateForm(Tfrm_obs_lancamento_caixa, frm_obs_lancamento_caixa);
          frm_obs_lancamento_caixa.ShowModal;
          frm_obs_lancamento_caixa.free;
        end;

      end;
    end;

    observacoesProducao := strObsProduto + frm_principal.tipoMassaPizza;

  end;

  idMovimentoMesa := strToInt(dm.geraCodigo('G_MOVIMENTO_MESA', 15));
  dm.qryauxiliar.Active := false;
  dm.qryauxiliar.SQL.clear;
  dm.qryauxiliar.sql.add('insert into movimento_mesa (cod_mesa,cod_garcon,cod_produto,quantidade,comanda,cod_movimento,');
  dm.qryauxiliar.sql.add('numero_caixa,cod_usuario,valor_unitario,id,observacoes,sabores,seq_impressao,impresso,id_combo) values (');
  dm.qryauxiliar.sql.add('' + QuotedStr(mesa) + ',');
  dm.qryauxiliar.sql.add('' + QuotedStr(edCodGarcon.Text) + ',');
  dm.qryauxiliar.sql.add('' + QuotedStr(lb_cod_produto.Caption) + ',');
  dm.qryauxiliar.sql.add('' + DM.TrocaVirgPPto(edQuantidade.text) + ',');
  dm.qryauxiliar.sql.add('' + QuotedStr('') + ',');
  dm.qryauxiliar.sql.add('' + Quotedstr(codigo_lancamento) + ',');
  dm.qryauxiliar.sql.add('' + Quotedstr(numero_caixa) + ',');
  dm.qryauxiliar.sql.add('' + Quotedstr(codigo_usuario) + ',');
  dm.qryauxiliar.SQL.Add('' + dm.removeVirgula(dm.TrocaVirgPPto(ed_valor_produto.Text)) + ',');
  dm.qryauxiliar.SQL.add(IntToStr(idMovimentoMesa) + ',');
  dm.qryauxiliar.sql.add('' + Quotedstr(observacoesProducao) + ',');
  dm.qryauxiliar.sql.add('' + Quotedstr(saboresProducao) + ',');
  dm.qryauxiliar.sql.add('' + Quotedstr(FGuidSeqImpressao) + ',0,');
  dm.qryauxiliar.sql.add('' + IntToStr(idCombo) + ')');
  dm.adicionalog(dm.qryauxiliar.SQL.Text);

  try
    begin
      //////dm.adicionalog(dm.qryauxiliar.SQL.Text);
      dm.qryauxiliar.ExecSQL;
      Result := true;
    end;
  except
    begin
      dm.cria_log_de_erros(dm.qryauxiliar.sql, 'Caixa - Restaurante ', 'Erro ao lançar produto no movimento da mesa ', codigo_usuario);
      Result := false;
      exit;
    end;
  end;

  if (dm.tbSaboresPizzaTemp.IsEmpty = False) then
  begin
    dm.qryauxiliar.Active := False;
    dm.qryauxiliar.sql.Clear;
    dm.tbSaboresPizzaTemp.First;

    while not dm.tbSaboresPizzaTemp.Eof do
    begin
      dm.qryauxiliar.Active := false;
      dm.qryauxiliar.SQL.clear;
      IDSaborPizza := Inttostr(StrToInt(dm.geraCodigo('G_ID_SABORES_PIZZA_MOV_MESA', 10)));
      dm.qryauxiliar.SQL.Add('insert into SABORES_PIZZA_MOVIMENTO_MESA (ID,COD_MESA,ID_MOV_MESA,COD_PRODUTO,COD_SABOR,QUANTIDADE,VALOR_UNITARIO_SABOR,PROPORCAO,DESCRICAO) values (');
      dm.qryauxiliar.sql.add('' + (IDSaborPizza) + ',');
      dm.qryauxiliar.sql.add('' + QuotedStr(mesa) + ',');
      dm.qryauxiliar.SQL.add(IntToStr(idMovimentoMesa) + ',');
      dm.qryauxiliar.SQL.add(Quotedstr(dm.tbSaboresPizzaTempcodProduto.Value) + ',');
      dm.qryauxiliar.SQL.add(Quotedstr(dm.tbSaboresPizzaTempcodigo.Value) + ',');
      dm.qryauxiliar.sql.add('' + DM.TrocaVirgPPto(Floattostr(dm.tbSaboresPizzaTempproporcao.Value)) + ',');
      dm.qryauxiliar.sql.add('' + DM.TrocaVirgPPto(Floattostr(dm.tbSaboresPizzaTempvalorSabor.Value)) + ',');
      dm.qryauxiliar.SQL.add(Quotedstr(dm.tbSaboresPizzaTemptamanho.Value) + ',');
      dm.qryauxiliar.SQL.add(Quotedstr(dm.tbSaboresPizzaTempdescricao.Value) + ')');
      dm.qryauxiliar.ExecSQL;
      dm.tbSaboresPizzaTemp.Next;
    end;

  end;

  dm.tbSaboresPizzaTemp.Active := false;
  dm.tbSaboresPizzaTemp.EmptyTable;

  if dm.transacao.Active = false then
    dm.transacao.Active := true;
  dm.transacao.Commit;

  busca_movimento_da_mesa;
  edCodProduto.Clear;
  strObsProduto := '';
  observacoesProducao := '';
  ed_descricao_produto.Clear;
  edQuantidade.Text := '1';
  ed_valor_produto.Text := '0';
end;

procedure Tfrm_caixa_restaurante.DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
var
  Bitmap: TBitmap;
begin

end;

procedure Tfrm_caixa_restaurante.FormActivate(Sender: TObject);
var
  pn1: TPanel;
begin
  exibeOpcaoDoMenu(TOpMenu);
  muda_acao(1);
  lbDataSistema.Caption := FormatDateTime('DD/MM/YY', data_do_sistema);
  lbNomeUsuario.Caption := nome_usuario;
  //lbNumeroEstacao.Caption := numero_caixa;
  busca_movimento_da_mesa;
  edNumeroMesa.SetFocus;

end;

procedure Tfrm_caixa_restaurante.edNumeroMesaEnter(Sender: TObject);
begin
  podeAtualizar := false;

  if Sender is Tedit and (((Sender as Tedit).Name = 'edNumeroMesa')) then
  begin
    dm.qryauxiliar.Active := false;
    if (dm.verificaMesaBalcao(edNumeroMesa.Text) = false) then
    begin
      if FGuidSeqImpressao <> '' then
      begin
        dm.imprimePedidoProducao(FGuidSeqImpressao);
        FGuidSeqImpressao := '';
      end;
    end;

    edNumeroMesa.Clear;
    edCodGarcon.Clear;
    voltar_mesa;
    podeAtualizar := true;
    mostraMapaMesas();

  end;
end;

procedure Tfrm_caixa_restaurante.IniciaRecebimentoDeConta();
var
  linha: integer;
  valor_total: double;
begin
  podeAtualizar := false;
  if (dm.verificaPermissaoAcao('B20002002', true, true) = true) then
    fecharConta();

end;

procedure Tfrm_caixa_restaurante.fecharConta();
var
  temExtratoEmitido: boolean;
begin
  if verifica_movimento then

  else
    exit;

  temExtratoEmitido := false;

  temExtratoEmitido := verificaMesaTemExtrato(edNumeroMesa.text);

  if (StrToInt(dm.leini(2, 'ENCERRAMENTO', 'verificar_extrato_antes')) = 1) then
  begin
    if temExtratoEmitido = false then
    begin
      dm.exibe_painel_erro('Ainda não foi emitido nenhuma pré-conta para a mesa selecionada!', '');
      exit;
    end;
  end
  else
  begin
    if temExtratoEmitido = false then
      bloqueiaMesa(edNumeroMesa.Text);

  end;

  Application.CreateForm(Tfrm_encerramento, frm_encerramento);
  frm_encerramento.lb_mesa.Caption := edNumeroMesa.Text;
  frm_encerramento.setTipoVenda(1);
  frm_encerramento.ShowModal;
  frm_encerramento.free;

  voltar_mesa;
  busca_movimento_da_mesa;
  muda_acao(1);

  if (dm.verificaMesaBalcao(edNumeroMesa.Text) = false) then
  begin
    edCodGarcon.Clear;
    edNumeroMesa.clear;
    edNumeroMesa.SetFocus;
  end;

end;

procedure Tfrm_caixa_restaurante.DBGrid1DrawDataCell(Sender: TObject; const Rect: TRect; Field: TField; State: TGridDrawState);
begin

  {
   if gdSelected in State then
   begin
     With (Sender as TDbGrid).Canvas do
     begin
       Brush.Color := clRed;
       FillRect(Rect);
     end;
   end;
   (Sender as TDBGrid).DefaultDrawDataCell(Rect, Field, State);

 }

  if gdSelected in State then
  begin
    with (Sender as TDbGrid).Canvas do
    begin
      Brush.Color := clRed;
      FillRect(Rect);
    end;
  end;
  (Sender as TDBGrid).DefaultDrawDataCell(Rect, Field, State);

end;

procedure Tfrm_caixa_restaurante.DBText2Click(Sender: TObject);
begin
  inherited;
  ShowScrollBar(DBCtrlGrid1.Handle, SB_VERT, False); //Remove barra Vertical
end;

procedure Tfrm_caixa_restaurante.DBText5Click(Sender: TObject);
begin
  inherited;
  selecionaItemcombo;
end;

function Tfrm_caixa_restaurante.pesquisa_produto: boolean;
begin
  dm.qry_consultas.Active := false;
  dm.qry_consultas.SQL.Clear;
  dm.qry_consultas.SQL.add('select * from produtos ');
  dm.qry_consultas.Active := true;

  if dm.qry_consultas.IsEmpty then
  begin

    showRealDialog(frm_principal, tmAviso, 'Informação', 'Não existem produtos cadastrados!', 22, false);
    exit;
  end
  else
  begin
    Application.CreateForm(Tfrm_consulta_produtos, frm_consulta_produtos);
    frm_consulta_produtos.ShowModal;
    edCodProduto.Text := string_aux_cod_barras;
    frm_consulta_produtos.Free;
  end;
end;

procedure Tfrm_caixa_restaurante.bt_pesq_produtoClick(Sender: TObject);
begin
  pesquisa_produto;
end;

function Tfrm_caixa_restaurante.gravar_tx_serv: boolean;
var
  total_vendas_garcon: double;
  percentual_vendido: double;
begin
  percentual_vendido := 0;
  tx_serv := 0;
  dm.qryauxiliar3.Active := false;
  dm.qryauxiliar3.sql.clear;
  dm.qryauxiliar3.sql.add('select * from garcons order by cod_garcon');
  dm.qryauxiliar3.active := true;
  dm.qryauxiliar3.first;
  while not dm.qryauxiliar3.eof do
  begin
    total_vendas_garcon := 0;
    tx_serv := 0;
    dm.qryauxiliar2.Active := false;
    dm.qryauxiliar2.sql.Clear;
    dm.qryauxiliar2.SQL.add('select movimento_mesa.cod_mesa,movimento_mesa.cod_movimento,movimento_mesa.cod_produto,produtos.cod_produto,produtos.descricao,movimento_mesa.quantidade,produtos.valor_unitario,movimento_mesa.comanda,movimento_mesa.cod_garcon');
    dm.qryauxiliar2.sql.add('  from movimento_mesa,produtos where ');
    dm.qryauxiliar2.sql.add('  produtos.cod_produto=movimento_mesa.cod_produto and movimento_mesa.cod_mesa=' + QuotedStr(edNumeroMesa.Text) + '  and movimento_mesa.cod_garcon=' + QuotedStr(dm.qryauxiliar3.fieldbyname('cod_garcon').value));
    dm.qryauxiliar2.Active := true;
    dm.qryauxiliar2.first;
    while not dm.qryauxiliar2.eof do
    begin
      total_vendas_garcon := (dm.qryauxiliar2.fieldbyname('quantidade').value * dm.qryauxiliar2.fieldbyname('valor_unitario').value) + total_vendas_garcon;
      dm.qryauxiliar2.Next;
    end;
    percentual_vendido := total_vendas_garcon * 100;
    percentual_vendido := percentual_vendido / ed_valor_bruto.Value;
    tx_serv := ed_total_tx_serv.Value * percentual_vendido;
    tx_serv := tx_serv / 100;

    if percentual_vendido > 0 then
    begin
      dm.qryauxiliar.Active := false;
      dm.qryauxiliar.SQL.clear;
      dm.qryauxiliar.SQL.add('insert into taxa_servico (cod_garcon,data_venda,total_venda,total_vendido,valor_taxa) values (');
      dm.qryauxiliar.sql.add('' + QuotedStr(dm.qryauxiliar3.fieldbyname('cod_garcon').value) + ',');
      dm.qryauxiliar.sql.add('' + Quotedstr(FormatDateTime('DD.MM.YYY', data_do_sistema)) + ',');
      dm.qryauxiliar.sql.add('' + dm.TrocaVirgPPto(Floattostr(ed_valor_bruto.value)) + ',');
      dm.qryauxiliar.sql.add('' + dm.TrocaVirgPPto(Floattostr(total_vendas_garcon)) + ',');
      dm.qryauxiliar.sql.add('' + dm.TrocaVirgPPto(Floattostr(tx_serv)) + ')');
      try
        begin
          dm.qryauxiliar.ExecSQL;
        end;
      except
        begin
          ShowMessage('Ocorreu um erro no sistema!  Um log de erros foi criado no formato DATA+HORA na pasta logs do Sistema. Abra o arquivo e envio por fax ou email para a Real Systems');
          dm.cria_log_de_erros(dm.qryauxiliar.sql, 'Módulo de caixa', 'Erro ao gravar taxa de serviço', codigo_usuario);
          Result := false;
          exit;
        end;
      end;

    end;

    dm.qryauxiliar3.Next;
  end;
  Result := true;

end;

procedure Tfrm_caixa_restaurante.B20002001KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin

  if ((Key = vk_escape) and (dm.verificaMesaBalcao(edNumeroMesa.Text) = false)) then
  begin
    dm.tbMovimentoMesa.Active := false;
    edCodProduto.clear;
    ed_descricao_produto.Clear;
    ed_valor_produto.Clear;
    edQuantidade.clear;
    edCodGarcon.clear;
    ed_total_conta.Text := '0,00';
    edNumeroMesa.Clear;
    edNumeroMesa.SetFocus;
    voltar_mesa;
  end
  else
    voltar_mesa;
end;

procedure Tfrm_caixa_restaurante.pesquisaGarcons();
begin
  dm.qry_consultas.Active := false;
  dm.qry_consultas.SQL.Clear;
  dm.qry_consultas.sql.add('select * from garcons order by apelido');
  dm.qry_consultas.Active := true;
  if dm.qry_consultas.IsEmpty then
  begin

    showRealDialog(frm_principal, tmAviso, 'Aviso', 'Não existem garçons cadastrados!', 22, false);
    exit;
  end
  else
  begin
    Application.CreateForm(Tfrm_cs_garcons, frm_cs_garcons);
    frm_cs_garcons.ShowModal;
    frm_cs_garcons.free;
    edCodGarcon.Text := string_auxiliar;

  end;

end;

procedure Tfrm_caixa_restaurante.btPreContaClick(Sender: TObject);
begin

  try
    try

      podeAtualizar := false;

      if (dm.verificaPermissaoAcao('B20002001', true, true) = true) then
      begin
        if (trim(edNumeroMesa.Text) = '') then
        begin
          dm.InsereChavesMovimento(numero_caixa, edNumeroMesa.Text);
          emitirExtrato(true);
        end
        else
        begin
          if (dm.verificaExtratosEmitidos(edNumeroMesa.text) = true) then
          begin

            if (ShowRealDialog(Self, tmConfirmacao, 'Atenção', 'Uma pré-conta dessa mesa já foi emitida. ' + sLineBreak + sLineBreak + 'Deseja continuar ?') = teSim) then
            begin
              emitirExtrato(false);
            end;

          end
          else
            emitirExtrato(false);
        end;

      end;

      busca_movimento_da_mesa;
      if (dm.verificaMesaBalcao(edNumeroMesa.Text) = false) then
      begin
        edCodGarcon.Clear;
        edNumeroMesa.clear;
        edNumeroMesa.SetFocus;
      end;

    except
      on E: Exception do
      begin
        raise Exception.Create(E.Message);
      end;

    end;
  finally

  end;

end;

procedure Tfrm_caixa_restaurante.emitirExtrato(variasMesas: boolean);
begin

  if (variasMesas = true) then
  begin
    Application.CreateForm(TfrmExtratoDiversasMesas, frmExtratoDiversasMesas);
    frmExtratoDiversasMesas.ShowModal;
    frmExtratoDiversasMesas.Free;

  end
  else
  begin
    if verifica_movimento then
    begin
      Application.CreateForm(Tfrm_extrato, frm_extrato);
      frm_extrato.pn_fiscal.Visible := true;
      frm_extrato.lb_mesa.Caption := edNumeroMesa.Text;
      frm_extrato.showmodal;
      frm_extrato.free;
    end;
  end;

  busca_movimento_da_mesa;
  voltar_mesa;

end;

procedure Tfrm_caixa_restaurante.DBCtrlGrid1Click(Sender: TObject);
var
  mesa: string;
begin
  inherited;
  mesa := dm.qryMapaMesasSalao.FieldByName('mesa_saida').Value;
  edNumeroMesa.SetFocus;
  edNumeroMesa.Text := mesa;

  if (edCodGarcon.Visible = True) then
    edCodGarcon.SetFocus
  else
    edCodProduto.SetFocus;

end;

procedure Tfrm_caixa_restaurante.DBCtrlGrid1KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  inherited;
  if Key = VK_ESCAPE then
  begin
    edNumeroMesa.SetFocus;
  end;
end;

procedure Tfrm_caixa_restaurante.DBCtrlGrid1PaintPanel(DBCtrlGrid: TDBCtrlGrid; Index: Integer);
begin
  inherited;
  if (dm.qryMapaMesasSalao.IsEmpty = false) then
  begin
    imgMesa.Tag := strToInt(dm.qryMapaMesasSalao.FieldByName('mesa_saida').Value);
    imgMesa.Picture := nil;
    case dm.qryMapaMesasSalao.FieldByName('extratos_emitidos').Value of
      -1:
        begin
          imgMesa.picture.LoadFromFile(patchAplicacao + 'imagens\mesaSemConsumir.png');
        end;
      0:
        begin
          imgMesa.picture.LoadFromFile(patchAplicacao + 'imagens\mesaConsumindo.png');

        end;
    else
      begin
        imgMesa.picture.LoadFromFile(patchAplicacao + 'imagens\mesaAguardandoPagamento.png');

      end;

    end;

    DBCtrlGrid1.Canvas.Draw(10, 0, imgMesa.Picture.Graphic);
    DBCtrlGrid1.Canvas.Pen.Color := clBlack;
    DBCtrlGrid1.Canvas.Font.Size := 14;
    DBCtrlGrid1.Canvas.TextOut(22, 66, dm.qryMapaMesasSalao.FieldByName('mesa_saida').Value);
    imgMapa.Repaint;

  end;

end;

procedure Tfrm_caixa_restaurante.btTransferirMesaClick(Sender: TObject);
var
  emiteExtratoAntes: integer;
begin
  podeAtualizar := false;
  if (dm.verificaPermissaoAcao('B20002006', true, true) = true) then
    transferirMesa;

  edNumeroMesa.OnEnter(edNumeroMesa);
end;

procedure Tfrm_caixa_restaurante.transferirMesa();
begin
//  if verifica_movimento then
//  else
//    exit;
  Application.CreateForm(Tfrm_transferir_mesa, frm_transferir_mesa);
  frm_transferir_mesa.ShowModal;
  frm_transferir_mesa.Free;
  busca_movimento_da_mesa;

  dm.tbMovimentoMesa.Active := false;
  edCodProduto.clear;
  ed_descricao_produto.Clear;
  ed_valor_produto.Clear;
  edQuantidade.clear;
  edCodGarcon.clear;
  //      ed_nome_garcon.Clear;
  //ed_total_taxa.Text:='0,00';
  edNumeroMesa.Clear;
  edNumeroMesa.SetFocus;
  voltar_mesa;

end;

procedure Tfrm_caixa_restaurante.btTransferirItemClick(Sender: TObject);
begin
  podeAtualizar := false;
  if (trim(edNumeroMesa.Text) = dm.getCodMesaBalcao) then
    exit;
  if (dm.verificaPermissaoAcao('B20002004', true, true) = true) then
    if (rdg_modo_visualizacao.ItemIndex = 0) then
    begin

      if (dm.verificaItenSelecionadosMovimentoMesa = true) then
      begin
        exibeOpcaoDoMenu(TOTransferenciaItem);
        edMesaDestino.SetFocus;
      end
      else
      begin
        showRealDialog(frm_principal, tmAviso, 'Atenção', 'Nenhum item foi selecionado para transferir!', 22, false);
      end;

    {
      if (dm.tbMovimentoMesa.FieldByName('cancelado').Value = 0) then
      begin
        transferirItem()
      end
      else
      begin

        showRealDialog(frm_principal, tmErro, 'Informação', 'Não é possível transferir um produto que já foi cancelado!', 22, false);

      end;
      }
    end
    else
    begin

      showRealDialog(frm_principal, tmAviso, 'Informação', 'Selecione o modo de visualização analítico e marque o lançamento a ser trasnferido!', 22, false);

    end;

end;

procedure Tfrm_caixa_restaurante.transferirItem();
begin

  if verifica_movimento then

  else
    exit;

  Application.Createform(Tfrm_transferir_item, frm_transferir_item);
//  frm_transferir_item.lbDescricaoProduto.Caption := dm.tbMovimentoMesa.FieldByName('descricao').Value;
//  frm_transferir_item.lbQtde.Caption := FormatFloat('#0.000', dm.tbMovimentoMesa.FieldByName('quantidade').Value);

  frm_transferir_item.ShowModal;
  frm_transferir_item.free;
  busca_movimento_da_mesa;
  voltar_mesa;
  busca_movimento_da_mesa();
  edNumeroMesa.SetFocus();
//  D30001011.SetFocus;
end;

function Tfrm_caixa_restaurante.VerificaSeMesaTemPedidosDeIntegracao(): boolean;
begin

  result := false;
  if rdg_modo_visualizacao.ItemIndex = 1 then
  begin
    rdg_modo_visualizacao.ItemIndex := 0;
    busca_movimento_da_mesa;
  end;
  dm.tbMovimentoMesa.first;
  while ((not dm.tbMovimentoMesa.Eof) and (result = false)) do
  begin
    if dm.tbMovimentoMesa.FieldByName('GUID_LANCAMENTO').value <> '' then
    begin
      Result := true;

    end;
    dm.tbMovimentoMesa.Next;
  end;

end;

procedure Tfrm_caixa_restaurante.btReceberContaClick(Sender: TObject);
var
  LMSG: TStringList;
begin
  if (StrToInt(dm.LeIni(2, 'SALAO', 'estacaoLancamentoSalao')) = 0) then
  begin

    LMSG := Tstringlist.Create;

    try
//      if (VerificaSeMesaTemPedidosDeIntegracao = false) then
      if True = true then
      begin
        IniciaRecebimentoDeConta;
      end
      else
      begin
        LMSG.clear;
        LMSG.add('Pedidos feitos em plataformas de pedidos devem ser recebidos de forma individual. ');
        LMSG.add('Selecione o ítem que deseja receber, clique com o botão direito do mouse e use a opção: Receber lançamentos desse pedido');
        showRealDialog(frm_principal, tmAviso, 'Atenção', LMSG.Text, 16, false);
      end;

    finally
      FreeAndNil(LMSG);
    end;
  end
  else
  begin
    showRealDialog(frm_principal, tmErro, 'Erro', 'Operação não permitida nesta estação!', 20, false);
  end;
end;

procedure Tfrm_caixa_restaurante.btRecebimentosParciaisClick(Sender: TObject);
begin

  if (StrToInt(dm.LeIni(2, 'SALAO', 'estacaoLancamentoSalao')) = 0) then
  begin

    podeAtualizar := false;
    if (trim(edNumeroMesa.Text) = dm.getCodMesaBalcao) then
      exit;
    if (dm.verificaPermissaoAcao('B20002007', true, true) = true) then
    begin
      if verifica_movimento then

      else
        exit;
      Application.CreateForm(Tfrm_recebimento_parcial, frm_recebimento_parcial);
      frm_recebimento_parcial.lb_mesa.Caption := edNumeroMesa.Text;
      frm_recebimento_parcial.showmodal;
      frm_recebimento_parcial.Free;
      busca_movimento_da_mesa;
      voltar_mesa;
    end;
  end
  else
  begin
    showRealDialog(frm_principal, tmErro, 'Erro', 'Operação não permitida nesta estação!', 20, false);
  end;

end;

procedure Tfrm_caixa_restaurante.btSairClick(Sender: TObject);
begin
  inherited;
  close;
end;

procedure Tfrm_caixa_restaurante.btSomClick(Sender: TObject);
begin
  inherited;
  pgPrincipal.Show;
  pgMovimentoDetalhado.Show;
end;

function Tfrm_caixa_restaurante.verifica_movimento: boolean;
var
  mesaTemMovimento: boolean;
begin
  try
    begin
      edNumeroMesa.Text := FormatFloat('0000', StrToFloat(edNumeroMesa.Text));
    end;
  except

    showRealDialog(frm_principal, tmAviso, 'Informação', 'Número de mesa inválido!', 22, false);
    edNumeroMesa.Clear;
    edNumeroMesa.SetFocus;
    result := false;
    exit;
  end;


  // Tenho que alterar esta parte para deixar as versões compatíveis


  mesaTemMovimento := not dm.tbMovimentoMesa.IsEmpty;

  if mesaTemMovimento = false then
  begin
    dm.exibe_painel_erro('Mesa sem movimento', 'Ok');
    Result := false;
    exit;
  end;

  Result := true;
end;

procedure Tfrm_caixa_restaurante.B300010040Click(Sender: TObject);
begin
  if verifica_movimento then
  begin

    if (ShowRealDialog(Self, tmConfirmacao, 'Atenção', 'Confirma cancelamento do ítem selecionado ?', 22, true) = teSim) then
    begin
      dm.qrymax.Active := false;
      dm.qrymax.SQL.Clear;
      dm.qrymax.SQL.Add('delete from movimento_mesa where cod_mesa=' + quotedstr(edNumeroMesa.Text) + ' and cod_movimento=' + Quotedstr(dm.tbMovimentoMesa.fieldbyname('cod_movimento').value));
      dm.qrymax.ExecSQL;
      if dm.transacao.Active = false then
        dm.transacao.Active := true;
      dm.transacao.Commit;
      busca_movimento_da_mesa;
    end
  end
  else
    exit;

end;

procedure Tfrm_caixa_restaurante.verificar_permissoes;
var
  modulo, submodulo: string;
  x: integer;
begin
  x := 0;
  while x < ComponentCount - 1 do
  begin
    {
      if  Components[x].ClassName='TBitBtn'
        then
          begin
             modulo:=Trim(copy(TBitBtn(Components[x]).Name,2,5));
             submodulo:=Trim(copy(TBitBtn(Components[x]).Name,7,15));
             if dm.verifica_permissao(modulo,submodulo,codigo_usuario,false)=false
             then
               TBitBtn(Components[x]).Enabled:=false
             else
               TBitBtn(Components[x]).Enabled:=true;
          end;
     }
    if Components[x].ClassName = 'TDBGrid' then
    begin
      modulo := Trim(copy(TDBGrid(Components[x]).Name, 2, 5));
      submodulo := Trim(copy(TDBGrid(Components[x]).Name, 7, 15));
      if dm.verifica_permissao(modulo, submodulo, codigo_usuario, false) = false then
      begin
        TDBGrid(Components[x]).Visible := false;

        rdg_modo_visualizacao.Visible := false;
//        fundo_caixa.Visible := true;
//        fundo_caixa.Picture.LoadFromFile(dm.LeIni(2, 'IMAGENS', 'fundo_caixa'));
      end
      else
        TDBGrid(Components[x]).Visible := true;

    end;

    if Components[x].ClassName = 'TGroupBox' then
    begin
      modulo := Trim(copy(TGroupBox(Components[x]).Name, 2, 5));
      submodulo := Trim(copy(TGroupBox(Components[x]).Name, 7, 15));
      if dm.verifica_permissao(modulo, submodulo, codigo_usuario, false) = false then
      begin
        TGroupBox(Components[x]).Visible := false;
      end
      else
        TGroupBox(Components[x]).Visible := true;
    end;

    x := x + 1;
  end;
end;

procedure Tfrm_caixa_restaurante.voltar_mesa;
begin

  rdg_modo_visualizacao.ItemIndex := 0;
  edCodProduto.Clear;
  ed_descricao_produto.clear;
  edQuantidade.Clear;

  if (dm.verificaMesaBalcao(edNumeroMesa.Text) = false) then
  begin
    edNumeroMesa.SetFocus;
  end;
  //  foto.Picture.LoadFromFile(dm.LeIni(2,'IMAGENS','caixa_aguardando'));
  dm.tbMovimentoMesa.Active := false;
  ed_valor_bruto.Value := 0;
  ed_total_tx_serv.Value := 0;
  ed_total_conta.Value := 0;

end;

procedure Tfrm_caixa_restaurante.B20002014Click(Sender: TObject);
begin
  podeAtualizar := false;
  if (dm.verificaPermissaoAcao((Sender as TBitBtn).Name, true, true) = true) then
  begin
  end;

  // voltar_mesa;
end;

procedure Tfrm_caixa_restaurante.AdvGlassButton1Click(Sender: TObject);
begin
  inherited;
  try
    try
      TransferirItens;
      ShowRealDialog(frm_principal, tmSucesso, 'Transfência efetuada', 'Transferência efetuada com sucesso!');
      busca_movimento_da_mesa;
      exibeOpcaoDoMenu(TOpMenu);
    except
      on E: Exception do
      begin
        ShowRealDialog(frm_principal, tmAviso, 'Erro', 'Erro ao processar transferência de ítens! ' + sLineBreak + sLineBreak + E.Message);
      end;

    end;
  finally

  end;
end;

procedure Tfrm_caixa_restaurante.AdvGlassButton2Click(Sender: TObject);
begin
  inherited;
  ImprimirMovimentoMesaPDF();
end;

procedure Tfrm_caixa_restaurante.ImprimirMovimentoMesaPDF();
begin
  dRelatorios.setPeriodoRelatorio('Movimento da mesa ' + edNumeroMesa.text);
  dRelatorios.rpt.LoadFromFile(patchAplicacao + '\relatorios\relMovimentoMesa.fr3');
  dRelatorios.LoadPicture('fotoCliente', imgFotoCliente);
  dRelatorios.rpt.PrepareReport(true);
  dRelatorios.rpt.ShowPreparedReport;
end;

procedure Tfrm_caixa_restaurante.SepararContaCoClienteSelecionado();
var
  LMesaDestino: string;
  Key: Word;
begin
  inherited;
  Key := vk_return;
  try
    try
      if rdg_modo_visualizacao.ItemIndex = 1 then
      begin
        rdg_modo_visualizacao.ItemIndex := 0;
        busca_movimento_da_mesa;
      end;

      if (Trim(dm.tbMovimentoMesa.FieldByName('nome_cliente').Value) <> '') then
      begin

        LMesaDestino := dm.BuscaMesaDestinoRecebimentoIndividual;
        if (ShowRealDialog(Self, tmConfirmacao, 'Atenção', 'O sistema irá transferir os lançamentos ligados a este pagamento para a mesa ' + LMesaDestino + sLineBreak + sLineBreak + 'Deseja continuar ?', 22, true) = teSim) then
        begin
          dm.SepararContaCliente(dm.tbMovimentoMesa.FieldByName('cod_mesa').Value, LMesaDestino, dm.tbMovimentoMesa.FieldByName('nome_cliente').Value);
          edNumeroMesa.Text := LMesaDestino;

          if (ShowRealDialog(Self, tmConfirmacao, 'Confirme', 'Separação da conta efetuada com sucesso  na mesa ' + LMesaDestino + sLineBreak + sLineBreak + 'Deseja emitir pré-conta ?', 16, true) = teSim) then
          begin
            edNumeroMesa.SetFocus;
            edNumeroMesa.Text := LMesaDestino;
            edNumeroMesa.OnKeyDown(edNumeroMesa, Key, []);
            btPreConta.Click;
          end;

          if (ShowRealDialog(Self, tmConfirmacao, 'Confirme', 'Deseja receber essa conta agora ?', 16, true) = teSim) then
          begin
            edNumeroMesa.SetFocus;
            edNumeroMesa.Text := LMesaDestino;
            edNumeroMesa.OnKeyDown(edNumeroMesa, Key, []);
            btReceberConta.Click;
          end
          else
          begin
            edNumeroMesa.SetFocus;
            edNumeroMesa.Text := LMesaDestino;
            edNumeroMesa.OnKeyDown(edNumeroMesa, Key, []);
          end;

        end;

      end
      else
      begin
        showRealDialog(frm_principal, tmErro, 'Erro', 'Não existe pagamento associado ao lançamento selecionado!', 22, false);
      end;

    except
      on E: Exception do
      begin
        showRealDialog(frm_principal, tmErro, 'Erro', 'Erro ao tentar transferir os lançamentos!' + sLineBreak + sLineBreak + E.Message, 22, false);
      end;

    end;
  finally

  end;

end;

procedure Tfrm_caixa_restaurante.Receberlanamentosdestepedido1Click(Sender: TObject);
var
  LMesaDestino: string;
begin
  inherited;
  try
    try
      if rdg_modo_visualizacao.ItemIndex = 1 then
      begin
        rdg_modo_visualizacao.ItemIndex := 0;
        busca_movimento_da_mesa;
      end;

      if (Trim(dm.tbMovimentoMesa.FieldByName('guid_pagamento').Value) <> '') then
      begin

        LMesaDestino := dm.BuscaMesaDestinoRecebimentoIndividual;
        if (ShowRealDialog(Self, tmConfirmacao, 'Atenção', 'O sistema irá transferir os lançamentos ligados a este pagamento para a mesa ' + LMesaDestino + sLineBreak + sLineBreak + 'Deseja continuar ?', 22, true) = teSim) then
        begin
          dm.RecebePedidosLancamentoIndividual(LMesaDestino);
          edNumeroMesa.Text := LMesaDestino;
          busca_movimento_da_mesa;
          IniciaRecebimentoDeConta;
        end;

      end
      else
      begin
        showRealDialog(frm_principal, tmErro, 'Erro', 'Não existe pagamento associado ao lançamento selecionado!', 22, false);
      end;

    except
      on E: Exception do
      begin
        showRealDialog(frm_principal, tmErro, 'Erro', 'Erro ao tentar transferir os lançamentos!' + sLineBreak + sLineBreak + E.Message, 22, false);
      end;

    end;
  finally

  end;

end;

procedure Tfrm_caixa_restaurante.TransferirItens();
var
  LTransferencia: TTransferenciaItem;
begin

  LTransferencia := TTransferenciaItem.Create;

  try
    try

      dm.ValidaParametrosTransferenciaItem(edNumeroMesa.Text, edMesaDestino.Text);
      LTransferencia.MesaOrigem := edNumeroMesa.Text;
      LTransferencia.MesaDestino := edMesaDestino.Text;
      LTransferencia.CodMOtivo := cmbMotivoTransferenciaItem.KeyValue;
      LTransferencia.Observacao := memoObsTransferenciaItem.Lines.Text;
      dm.TransfereProdutosSelecionados(LTransferencia);
      if (StrToInt(dm.LeIni(2, 'TRANSFERENCIA_DE_ITEM', 'imprime_comprovante')) = 1) then
        dm.ImprimeTransferenciaProdutos(LTransferencia);
      LimpaDadosTransferenciaItem;

    except
      on E: Exception do
      begin
        showRealDialog(frm_principal, tmErro, 'Erro', E.message, 22, false);
      end;
    end;
  finally
    FreeAndNil(LTransferencia);

  end;
end;

procedure Tfrm_caixa_restaurante.LimpaDadosTransferenciaItem();
begin
  edMesaDestino.Text := '';
  cmbMotivoTransferenciaItem.KeyValue := '001';
  memoObsTransferenciaItem.Lines.Clear;
end;

procedure Tfrm_caixa_restaurante.AdvGlassButton3Click(Sender: TObject);
begin
  inherited;
  LimpaDadosTransferenciaItem;
  exibeOpcaoDoMenu(TOpMenu);
end;

procedure Tfrm_caixa_restaurante.AdvGlassButton4Click(Sender: TObject);
begin
  inherited;
  exibeOpcaoDoMenu(TOpMenu);
end;

procedure Tfrm_caixa_restaurante.AdvGlassButton5Click(Sender: TObject);
var
  LCaminhoImagem: string;
begin
  inherited;

  try
    try
      saveDialog.Execute;
      LCaminhoImagem := saveDialog.FileName;
      imgFotoCliente.Picture.SaveToFile(LCaminhoImagem + '.jpg');
      ShowRealDialog(frm_principal, tmSucesso, 'Sucesso!', 'Imagem salva com sucesso!', 22);
    except
      on E: Exception do
      begin
        ShowRealDialog(frm_principal, tmErro, 'Erro!', 'Ocorreu o seguinte erro ao salvar: ' + sLineBreak + E.message, 20);
      end;

    end;

  finally

  end;

end;

{
procedure Tfrm_caixa_restaurante.apagaItemMovimento(codMotivo: string; descricaoMotivo: string; obs: string);
var
  impCancelamentoLocalProducao: boolean;
begin

  if verifica_movimento then
  begin
    if (ShowRealDialog(Self, tmConfirmacao, 'Confirme', 'Confirma cancelamento do ítem selecionado ?') = teSim) then
    begin

      if rdg_modo_visualizacao.ItemIndex = 0 then
      begin
        if dm.tbMovimentoMesa.FieldByName('impresso').Value = 0 then
        begin
          impCancelamentoLocalProducao := false
        end
        else
        begin
          impCancelamentoLocalProducao := true;
          dm.gravarEstornoDeItem(edNumeroMesa.Text, codMotivo, descricaoMotivo, dm.tbMovimentoMesa.fieldbyname('cod_barras').value, dm.tbMovimentoMesa.fieldbyname('descricao').value, dm.tbMovimentoMesa.fieldbyname('quantidade').value, (dm.tbMovimentoMesa.fieldbyname('valor_unitario').value), obs, impCancelamentoLocalProducao, '', '', dm.tbMovimentoMesa.fieldbyname('id').value);
        end;
      end;

      if (rdg_modo_visualizacao.ItemIndex = 0) then // Faz a deleção/atualização de quantidade do ítem no modo analítico
      begin
        dm.executaSQL('delete from movimento_mesa where id=' + IntToStr(dm.tbMovimentoMesa.fieldbyname('id').value));

      end
    end;
  end;

  exit;
  busca_movimento_da_mesa();
end;
 }

procedure Tfrm_caixa_restaurante.apagaItemMovimento(AQuantidade: double; ACodMotivo: string; ADescricaoMotivo: string; AObs: string);
var
  LQuantidadeRestante: double;
  LQuantidadeTotal: double;
  impCancelamentoLocalProducao: boolean;
  idMovimentoMesa: integer;
  LListaSQL: TList<string>;
  LSQL: TStringList;
begin

  LListaSQL := TList<string>.Create;
  LSQL := TStringList.Create;

  try
    try

      if verifica_movimento then
      begin
        if (ShowRealDialog(Self, tmConfirmacao, 'Atenção', 'Confirma cancelamento do ítem ?', 22, true) = teSim) then
        begin
          LQuantidadeTotal := dm.tbMovimentoMesa.fieldbyname('quantidade').value;
          LQuantidadeRestante := LQuantidadeTotal - AQuantidade;

          impCancelamentoLocalProducao := IntToBol(dm.tbMovimentoMesa.FieldByName('impresso').Value);

          if (LQuantidadeRestante = 0) then
          begin
            LSQL.clear;
            LSQL.add('delete from movimento_mesa ms where  ms.id=' + IntTostr(dm.tbMovimentoMesa.fieldbyname('id').value));
            LListaSQL.add(LSQL.text + ';');
          end
          else
          begin
            AObs := AObs + sLineBreak + 'Qtde ' + Floattostr(AQuantidade) + ' / ' + Floattostr(LQuantidadeTotal);
            dm.qrymax.Active := false;
            dm.qrymax.sql.Clear;
            LSQL.clear;
            LSQL.add(' update movimento_mesa ms set ms.quantidade=' + dm.TrocaVirgPPto(FormatFloat('#0.00', LQuantidadeRestante)) + ' where  ms.id=' + IntTostr(dm.tbMovimentoMesa.fieldbyname('id').value));
            LListaSQL.add(LSQL.text + ';');
          end;

          if (impCancelamentoLocalProducao = true) then
          begin
            dm.gravarEstornoDeItem(edNumeroMesa.Text, ACodMotivo, ADescricaoMotivo, dm.tbMovimentoMesa.fieldbyname('cod_barras').value, dm.tbMovimentoMesa.fieldbyname('descricao').value, AQuantidade, (dm.tbMovimentoMesa.fieldbyname('valor_unitario').value), AObs, impCancelamentoLocalProducao, '', '', dm.tbMovimentoMesa.fieldbyname('id').value);
          end;
          dm.ExecutaBlocoDeInstrucoes(LListaSQL, 100);
          busca_movimento_da_mesa;
        end;

      end

    except
      on E: Exception do
      begin
        showRealDialog(frm_principal, tmErro, 'Erro', 'Erro ao cancelar lançamento!' + sLineBreak + sLineBreak + E.Message, 22, false);
      end;

    end;
  finally
    FreeAndNil(LSQL);
    FreeAndNil(LListaSQL);
  end;

end;

procedure Tfrm_caixa_restaurante.btCancelarItemClick(Sender: TObject);
var
  result: string;
  permite: boolean;
  qtde: real;
  id: integer;
begin

  podeAtualizar := false;
  if rdg_modo_visualizacao.ItemIndex = 0 then
  begin
    if (dm.tbMovimentoMesa.FieldByName('impresso').Value = 1) then
    begin
      if (dm.verificaPermissaoAcao('B20002003', true, true) = true) then
      begin

        id := dm.tbMovimentoMesa.FieldByName('id').Value;
        qtde := dm.tbMovimentoMesa.FieldByName('quantidade').Value;

        application.CreateForm(Tfrm_cancela_item_restaurante, frm_cancela_item_restaurante);
        frm_cancela_item_restaurante.lbDescricaoProduto.Caption := dm.tbMovimentoMesa.FieldByName('descricao').Value;
        if ((qtde = 1) or (Frac(qtde) > 0)) then
        begin
          frm_cancela_item_restaurante.edQuantidade.Value := qtde;
          frm_cancela_item_restaurante.edQuantidade.Enabled := false;
        end
        else
        begin

        end;

        frm_cancela_item_restaurante.ShowModal;
        frm_cancela_item_restaurante.Free;

      end;



    {
      if (trim(dm.tbMovimentoMesa.FieldByName('guid_lancamento').Value) = '') then
      begin

      end
      else
      begin
        showRealDialog(frm_principal, tmAviso, 'Atenção!!', 'Não é possível cancelar lançamentos efetuados em plataformas parceiras.' + sLineBreak + ' Faça o cancelamento diretamente no app utilizado.', 20, false);
      end;
      }

    end
    else
    begin
      apagaItemMovimento(dm.tbMovimentoMesa.FieldByName('quantidade').Value, '0', '0', '');
    end;
  end
  else
  begin
    showRealDialog(frm_principal, tmErro, 'Erro', 'Não é possível realizar cancelamentos no modo de visualização resumida!', 22, false);
    exit;
  end;
  busca_movimento_da_mesa();
end;

procedure Tfrm_caixa_restaurante.B30001001KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Key = vk_escape then
    edNumeroMesa.SetFocus;
end;

procedure Tfrm_caixa_restaurante.rdg_modo_visualizacaoClick(Sender: TObject);
begin
  busca_movimento_da_mesa();
end;

procedure Tfrm_caixa_restaurante.Removerseleodeetodos1Click(Sender: TObject);
begin
  inherited;
  SelecionarTodosOsItens(false);
end;

procedure Tfrm_caixa_restaurante.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin

  if (Shift = [ssCtrl]) and (Key = 65) then
  begin
    if rdg_modo_visualizacao.ItemIndex = 0 then
      rdg_modo_visualizacao.ItemIndex := 1
    else
      rdg_modo_visualizacao.ItemIndex := 0;
  end;

  if (Shift = [ssCtrl]) and (Key = 80) then
  begin
  end;

  if (Shift = [ssCtrl]) and (Key = 79) then
  begin

    Application.CreateForm(Tfrm_obs_lancamento_caixa, frm_obs_lancamento_caixa);
    frm_obs_lancamento_caixa.ShowModal;
    frm_obs_lancamento_caixa.free;
  end;

  if (Shift = [ssCtrl]) and (Key = 67) then
  begin

  end;

end;

procedure Tfrm_caixa_restaurante.ClickSelecaoGrupoCombo(Sender: TObject);
var
  posicaoCodigo: Integer;
  codGrupo: string;
begin
  posicaoCodigo := Pos('_', ((Sender) as TComponent).Name);
  posicaoCodigo := posicaoCodigo + 1;
  codGrupo := trim(copy(((Sender) as TComponent).Name, posicaoCodigo, 5));
  dm.criaGruposCombo(lb_cod_produto.Caption, pnGruposAdicionais, StrToInt(codGrupo), ClickSelecaoGrupoCombo);

end;

procedure Tfrm_caixa_restaurante.LancarAdicionaisFixos(ACodProduto: string; AIDCombo: LongInt);
var
  LSQL: TStringList;
  LTbAdicionaisFixos: TFDmemtable;
  LNumeroMesa: string;
begin
  LSQL := TStringList.Create;
  LTbAdicionaisFixos := TFDMemTable.Create(self);
  LNumeroMesa := edNumeroMesa.Text;
  try
    try
      LSQL.add('  select pa.cod_produto,pa.qtd, pa.valor,p.descricao, p.un_ecf, p.cod_miniprinter,  ');
      LSQL.add('   case                                                                 ');
      LSQL.add('    when p.cod_miniprinter = ' + QuotedStr('001') + ' then 0 ');
      LSQL.add('    else                                                                ');
      LSQL.add('     1                                                                  ');
      LSQL.add('   end as imprimeProducao                                               ');
      LSQL.add('    from produtos_grupos_adicionais pa                                  ');
      LSQL.add('       inner join grupos_adicionais ad on ( ad.id = pa.id_grupo)        ');
      LSQL.add('       inner join produtos p on (p.cod_produto = pa.cod_produto)        ');
      LSQL.add('   where ad.tipo=2                                                      ');
      LSQL.add('     and ad.cod_produto =:vpCodProduto                                  ');
      LSQL.Text := StringReplace(LSQL.Text, ':vpCodProduto', ACodProduto, [rfReplaceAll, rfIgnoreCase]);
      dm.getMemTable(LTbAdicionaisFixos, LSQL.Text);

      LTbAdicionaisFixos.First;
      while not LTbAdicionaisFixos.Eof do
      begin
        lb_cod_produto.Caption := LTbAdicionaisFixos.FieldByName('cod_produto').Value;
        ed_descricao_produto.Text := LTbAdicionaisFixos.FieldByName('descricao').Value;
        ed_valor_produto.Text := Floattostr(LTbAdicionaisFixos.FieldByName('valor').Value);
        edQuantidade.Text := Floattostr(LTbAdicionaisFixos.FieldByName('qtd').Value);
        adicionar_produto_conta(LNumeroMesa, IntToBol(LTbAdicionaisFixos.FieldByName('imprimeProducao').Value), AIDCombo, true);
        LTbAdicionaisFixos.Next;
      end;

    except
      on E: Exception do
      begin
        dm.exibe_painel_erro('Erro ao lançar adicionais fixos!' + sLineBreak + sLineBreak + E.Message, 'Ok', mtError);
      end;

    end;
  finally
    FreeAndNil(LSQL);
    LTbAdicionaisFixos.Active := false;
    FreeAndNil(LTbAdicionaisFixos);
    ;
  end;
end;

procedure Tfrm_caixa_restaurante.efetuar_lancamento;
var
  LIDCombo: LongInt;
  LProdutoTemAdicionaisFixos: Boolean;
  LNumeroMesa: string;
begin
  try
    try

      if dm.transacao.Active = false then
        dm.transacao.Active := true;
      dm.transacao.Commit;

      if verifica_validade_lancamento then
      begin
        LNumeroMesa := trim(edNumeroMesa.Text);
        if dm.criaGruposCombo(lb_cod_produto.Caption, pnGruposAdicionais, 0, ClickSelecaoGrupoCombo) then
        begin
          pgCombos.Show;
        end
        else
        begin

          LIDCombo := 0;
          LProdutoTemAdicionaisFixos := verificaSeProdutoTemAdicionaisFixos(lb_cod_produto.Caption);
          if LProdutoTemAdicionaisFixos = true then
          begin
            LIDCombo := StrtoInt(dm.geraCodigo('G_ID_COMBOS_VENDIDOS', 10));
            adicionar_produto_conta(LNumeroMesa, dm.verificaProdutoImprimeLocalProducao(lb_cod_produto.Caption), LIDCombo, true);
            LancarAdicionaisFixos(lb_cod_produto.Caption, LIDCombo);

          end
          else
          begin
            adicionar_produto_conta(LNumeroMesa, dm.verificaProdutoImprimeLocalProducao(lb_cod_produto.Caption), LIDCombo, false);
          end;

          edCodProduto.Clear;
          edCodProduto.SetFocus;
        end;

      end;

    except
      on E: Exception do
      begin
        showRealDialog(frm_principal, tmErro, 'Erro', 'Erro ao realizar lançamento!' + sLineBreak + sLineBreak + E.Message, 22, false);
      end;
    end;
  finally
    pnDadosProduto.Enabled := false;
    ed_valor_produto.ReadOnly := true;
  end;

end;

procedure Tfrm_caixa_restaurante.gravarEstornoMesa(mesa: string);
var
  q: TIBQuery;
  totalMesa: double;
  codEstorno: string;
begin

  q := TIBquery.create(self);
  q.Database := dm.dbrestaurante;
  q.Transaction := dm.transacao;
  q.Active := false;

  codEstorno := dm.geraCodigo('G_ESTORNOS_MESA', 5);
  totalMesa := getValorProdutosMesa(mesa);
  q.SQL.Add('insert into estornos_mesa (codigo,mesa,total_mesa,cod_caixa,hora,COD_USUARIO_AUTORIZOU,NOME_USUARIO_AUTORIZOU,cod_empresa) values(');
  q.SQL.Add('' + Quotedstr(codEstorno) + ',');
  q.SQL.add('' + Quotedstr(mesa) + ',');
  q.sql.add('' + dm.TrocaVirgPPto(FloatToStr(totalMesa)) + ',');
  q.SQL.add('' + Quotedstr(ultimoCaixaAberto) + ',');
  q.SQL.Add('' + Quotedstr(FormatDateTime('hh:mm:ss', Time)) + ',');
  q.sql.add(QuotedStr(codigo_usuario_responsavel) + ',');
  q.sql.add(QuotedStr(nome_usuario_responsavel) + ',');
  q.SQL.Add('' + Quotedstr(codEmpresa) + ')');

  try
    begin
      q.ExecSQL;
    end
  except
    begin
      ShowMessage('Erro ao logar o estorno de mesa!');

    end;
  end;

  q.Active := false;
  q.SQL.clear;
  q.sql.add('insert into produtos_estornos_mesa(COD_ESTORNO,COD_PRODUTO,COD_BARRAS,');
  q.sql.add('       DESCRICAO, QUANTIDADE,VALOR_UNITARIO,TOTAL)');
  q.sql.add('       select ' + QuotedStr(codEstorno) + ',mv.cod_produto,cod_barras,p.descricao,mv.quantidade,mv.valor_unitario,(mv.valor_unitario * mv.quantidade)');
  q.sql.add('       from movimento_mesa mv');
  q.sql.add('       inner join produtos p on (p.cod_produto = mv.cod_produto)');
  q.sql.add('       where mv.cod_mesa=' + Quotedstr(mesa));
  try
    begin
      q.ExecSQL;
    end
  except
    begin
      ShowMessage('Erro gravar os produtos estornados da mesa');

    end;
  end;

  {
  if ( StrToInt(dm.LeIni(1,'TRANSFERENCIA_DE_MESA','imprime_comprovante')) = 1)   then
   begin
     dm.imprimeComprovanteTransferenciaMesa(origem,destino,codTransferencia,totalMesaOrigem,totalMesaDestino);
   end;
   }

  if dm.transacao.Active = false then
    dm.transacao.Active := true;
  dm.transacao.Commit;

  q.Active := false;
  FreeAndNil(q);
end;

procedure Tfrm_caixa_restaurante.edNumeroMesaChange(Sender: TObject);
begin
  inherited;
  if (((trim(edNumeroMesa.Text) = 'b')) or ((trim(edNumeroMesa.Text) = 'B'))) then
  begin
//    B20001002.Click;
  end;

end;

procedure Tfrm_caixa_restaurante.edCodProdutoChange(Sender: TObject);
begin
  inherited;

  if ((trim(edCodProduto.Text) = '010101') and (StrToInt(dm.LeIni(1, 'CAIXA', 'licenciado')) = 1)) then
  begin
    if tipo_cupom = 1 then
      muda_acao(2)
    else
      muda_acao(1);
    edCodProduto.Clear;
  end;

end;

procedure Tfrm_caixa_restaurante.edQuantidadeChange(Sender: TObject);
var
  qtde: integer;
  LCodProduto: string;
  LProduto: Produto.TProduto;
  valorTotal: string;
  LValor: double;
  LQuantidade, qtdeCalculada: double;
  precoUnitario: double;
begin
  LProduto := Produto.TProduto.Create();

  try
    try
      if (Length(trim(edQuantidade.text)) = 13) then
      begin
        LCodProduto := copy(edQuantidade.Text, 2, 4);
        valorTotal := copy(edQuantidade.Text, 8, 5);
        valorTotal := copy(valorTotal, 0, 3) + ',' + copy(valorTotal, 4, 4);
        valorTotal := FloatTostr(strToFloat(valorTotal));
        LValor := StrToFLoat(valorTotal);
        LCodProduto := FormatFloat('00000', StrTOFloat(LCodProduto));
        edCodProduto.Text := LCodProduto;
        LQuantidade := (LValor / LProduto.Preco);
        edCodProduto.Text := LCodProduto;
        edQuantidade.Text := FormatFloat('###,###,##0.000 ', LQuantidade);
        edQuantidade.SetFocus;
      end;

      dm.getDadosProduto(TeCodBarras, LCodProduto, LProduto);
      if LProduto.Vende = false then
        raise Exception.Create('O produto selecionado está desabilitado para venda!');
    except
      on E: Exception do
      begin
        showRealDialog(frm_principal, tmErro, 'Erro', E.Message, 22, false);
      end;

    end;

  finally
    FreeAndNil(LProduto);
  end;

end;

procedure Tfrm_caixa_restaurante.ed_valor_produtoExit(Sender: TObject);
var
  qtdeCalculada: double;
  LProduto: Produto.TProduto;
  LCodProduto: string;
begin
  inherited;
  LProduto := Produto.TProduto.Create;
  LCodProduto := edCodProduto.text;

  try
    try
      dm.getDadosProduto(TeCodBarras, LCodProduto, LProduto);

      if LProduto.Vende = false then
        raise Exception.Create('O produto selecionado está desabilitado para venda!');

      try
        StrToFloat(ed_valor_produto.Text);
      except
        raise Exception.Create('Valor do produto inválido!');
      end;

      if (StrToFloat(ed_valor_produto.Text) <= 0) then
        raise Exception.Create('Valor do produto inválido!');

      if (verificaSeProdutoCalculaQtde(edCodProduto.text, 2)) then
      begin
        qtdeCalculada := 0;
        qtdeCalculada := StrToFloat(ed_valor_produto.Text) / LProduto.Preco;
        edQuantidade.text := FormatFloat('#0.00000', qtdeCalculada);
        efetuar_lancamento;
      end;

      if (((Sender as Tedit).Name = 'edQuantidade')) then
      begin
        efetuar_lancamento();
      end;

      pnDadosProduto.Enabled := false;
      ed_valor_bruto.ReadOnly := true;
      edQuantidade.SetFocus;

    except
      on E: Exception do
      begin
        showRealDialog(frm_principal, tmErro, 'Erro', 'Erro ao lançar produto!' + sLineBreak + sLineBreak + E.Message, 22, false);
      end;

    end;

  finally
    FreeAndNil(LProduto);
  end;

end;

procedure Tfrm_caixa_restaurante.FormKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
//  timerAtualizaTelaMesas .Enabled:=false;
//  timerAtualizaTelaMesas .Enabled:=true;
end;

procedure Tfrm_caixa_restaurante.timerAtualizaTelaMesasTimer(Sender: TObject);
begin
  inherited;
//  AtualizarListaMesas();
end;

procedure Tfrm_caixa_restaurante.timerHintTimer(Sender: TObject);
begin
  inherited;
  timerHint.Enabled := False;
  cxHintStyleController1.HideHint;
  Application.ProcessMessages;
  FHintDisplayed := False;
end;

procedure Tfrm_caixa_restaurante.enter_botao(Sender: TObject);
begin
  edNumeroMesa.text := (Sender as TBitBtn).Caption;
end;

procedure Tfrm_caixa_restaurante.Timer1Timer(Sender: TObject);
begin
  inherited;
  lbHora.Caption := FormatDateTime('HH:MM:SS', time);
end;

procedure Tfrm_caixa_restaurante.btCalculadoraClick(Sender: TObject);
begin
  inherited;
  ACBrCalculadora1.Execute;
end;

procedure Tfrm_caixa_restaurante.btDeliveryClick(Sender: TObject);
begin
  inherited;
  if (StrToInt(dm.LeIni(2, 'SALAO', 'estacaoLancamentoSalao')) = 0) then
  begin

    podeAtualizar := false;
    if (dm.verificaPermissaoAcao('I20001003', true, true) = true) then
    begin
      Application.createForm(TfrmExpedicaoDelivery, frmExpedicaoDelivery);
      frmExpedicaoDelivery.showmodal();
      frmExpedicaoDelivery.free;
    end;
  end
  else
  begin
    showRealDialog(frm_principal, tmErro, 'Erro', 'Operação não permitida nesta estação!', 20, false);
  end;

end;

procedure Tfrm_caixa_restaurante.C1Click(Sender: TObject);
var
  LStr: TStringList;
begin
  inherited;
  LStr := TStringList.Create;
  try
    try
      LStr.Add('Id do lançamento : ' + dm.tbMovimentoMesa.FieldByName('guid_lancamento').value);
      LStr.Add('Id do Pagamento : ' + dm.tbMovimentoMesa.FieldByName('guid_pagamento').value);
      LStr.Add('Id do Pedido : ' + dm.tbMovimentoMesa.FieldByName('guid_order').value);
      Clipboard.AsText := LStr.Text;
      showRealDialog(frm_principal, tmSucesso, 'Sucesso', 'Informações de integração copiadas para a área de transferência!', 18, false);

    except
      on E: Exception do
      begin
        showRealDialog(frm_principal, tmErro, 'Erro!', 'Erro ao copiar dados de integração de APPS.' + sLineBreak + 'Erro: ' + e.Message, 15, false);
      end;
    end;
  finally
    FreeAndNil(LStr);
  end;
end;

procedure Tfrm_caixa_restaurante.CancelamentodeProduto1Click(Sender: TObject);
begin
  inherited;
  btCancelarItem.Click;

end;

procedure Tfrm_caixa_restaurante.tbViewDetalhadoColumnPagoCustomDrawCell(Sender: TcxCustomGridTableView; ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
var
  APainter: TcxPainterAccess;
begin
  inherited;

  if ((dm.tbMovimentoMesa.IsEmpty = false) and (rdg_modo_visualizacao.ItemIndex = 0)) then
  begin

  end;

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

      case AnsiIndexStr(UpperCase((AViewInfo.GridRecord.Values[tbViewDetalhadoColumnPago.Index])), ['0', '1']) of
        0:
          begin
            with AViewInfo.ClientBounds do
              cxImageList1.Draw(ACanvas.Canvas, Left + 1, Top + 1, 3);
//            AViewInfo.GridRecord.Values[tbViewDetalhadoColumn5.Index] := '.';

          end;
        1:
          begin
            with AViewInfo.ClientBounds do
              cxImageList1.Draw(ACanvas.Canvas, Left + 1, Top + 1, 0);
  //        AViewInfo.GridRecord.Values[tbViewDetalhadoColumn5.Index] := '.';
          end;

      end;

   //   if AViewInfo.GridRecord.Values[tbViewDetalhadoColumn5.Index] then


    finally
      Free;
    end;
  end;
  ADone := True;
  ;
end;

procedure Tfrm_caixa_restaurante.tbViewDetalhadoColumnPagoGetDataText(Sender: TcxCustomGridTableItem; ARecordIndex: Integer; var AText: string);
begin
  inherited;
  AText := '';
end;

procedure Tfrm_caixa_restaurante.tbViewDetalhadoColumnPagoGetDisplayText(Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord; var AText: string);
begin
  inherited;
  AText := '';
end;

procedure Tfrm_caixa_restaurante.tbViewDetalhadoCustomDrawCell(Sender: TcxCustomGridTableView; ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
begin
  inherited;
  if AViewInfo.GridRecord.Selected then
  begin
    ACanvas.Brush.Color := 12615680;
    ACanvas.Font.Color := clWhite;
  end;
end;

procedure Tfrm_caixa_restaurante.tbViewDetalhadoEditKeyDown(Sender: TcxCustomGridTableView; AItem: TcxCustomGridTableItem; AEdit: TcxCustomEdit; var Key: Word; Shift: TShiftState);
begin
  inherited;
  if Key = VK_DELETE then
  begin
    btCancelarItem.Click;
  end;
end;

procedure Tfrm_caixa_restaurante.tbViewDetalhadoKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  inherited;

  if Key = VK_ESCAPE then
  begin
    edNumeroMesa.SetFocus;
  end;

  if ((Key = vk_f3)) then
  begin
    btPreConta.Click;
  end;

  if ((Key = vk_f4)) then
  begin
    btReceberConta.Click;
  end;

  if ((Key = vk_f5)) then
  begin
    EstornarMesa;
  end;

  if ((Key = vk_delete)) then
  begin
    btCancelarItem.Click;
  end;

  if ((Key = vk_f6)) then
  begin
    btTransferirMesa.Click;
  end;

  if ((Key = vk_f7)) then
  begin
    btTransferirItem.Click;
  end;

  if ((Key = vk_f8)) then
  begin
    btRecebimentosParciais.Click;
  end;

  if ((Key = vk_f9)) then
  begin
    btReabrirMesa.Click;
  end;

  if ((Key = vk_f10)) then
  begin
    btDelivery.Click;
  end;

  if ((Key = vk_f11)) then
  begin
    btFuncoesDoCaixa.Click;
  end;

  if Key = 32 then
  begin
    dm.SelecionaItemMovimentoMesa();
  end;


end;

procedure Tfrm_caixa_restaurante.tbViewDetalhadoMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
var
  AHitTest: TcxCustomGridHitTest;
  AHint: string;
  AView: TcxGridDBTableView;
  ACellRect: TRect;
  APoint: TPoint;
begin
  inherited;

  if ((dm.tbMovimentoMesa.Active) and (dm.tbMovimentoMesa.IsEmpty = false) and (rdg_modo_visualizacao.ItemIndex = 0)) then
  begin
    try
      begin
        cxGrid1.Hint := 'Garçon: ' + dm.tbMovimentoMesa.fieldbyname('apelido').Value + #13 + 'ID: ' + dm.tbMovimentoMesa.fieldbyname('ID').AsString + #13 + 'Produto: ' + dm.tbMovimentoMesa.fieldbyname('descricao').AsString + #13 + 'Quantidade: ' + FormatFloat('###,###,##0.000', dm.tbMovimentoMesa.fieldbyname('quantidade').Value) + #13 + 'Lançado por: ' + dm.tbMovimentoMesa.fieldbyname('login').AsString + ' em ' + FormatDateTime('DD/MM/YYY', dm.tbMovimentoMesa.fieldbyname('hora_lancamento').value) + ' - ' + FormatDateTime('HH:MM:SS', dm.tbMovimentoMesa.fieldbyname('hora_lancamento').value) + #13 + #13 + 'Sabores :' + #13 + dm.tbMovimentoMesa.fieldbyname('sabores').AsString + #13 + #13 + 'Obs :' + #13 + dm.tbMovimentoMesa.fieldbyname('observacoes').AsString;
        cxGrid1.ShowHint := true;

      end;
    except
    end;
  end;

end;

procedure Tfrm_caixa_restaurante.cxGridDBTableView1KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  inherited;
  if Key = VK_ESCAPE then
  begin
    edNumeroMesa.SetFocus;
  end;

  if Key = VK_F3 then
  begin
    btPreConta.Click;
  end;

end;

procedure Tfrm_caixa_restaurante.RANSFERNCIA1Click(Sender: TObject);
begin
  inherited;
  btTransferirItem.Click;
end;

procedure Tfrm_caixa_restaurante.muda_acao(tipo: integer);
begin
  case tipo of
    1:
      begin
        tipo_cupom := 1;
        lbNomeEmpresa.Caption := nome_fantasia;

      end;
    2:
      begin
        tipo_cupom := 2;
        lbNomeEmpresa.Caption := razao_social;
      end;
  end;
  edCodProduto.Clear;
end;

procedure Tfrm_caixa_restaurante.pisca1Timer(Sender: TObject);
begin
  inherited;
  pisca1.Enabled := false;
  pisca2.Enabled := true;

end;

procedure Tfrm_caixa_restaurante.pisca2Timer(Sender: TObject);
begin
  inherited;

  pisca2.Enabled := false;
  pisca1.Enabled := true;

end;

procedure Tfrm_caixa_restaurante.pnExpedicaoClick(Sender: TObject);
begin
  inherited;
  Application.CreateForm(TfrmExpedicaoDelivery, frmExpedicaoDelivery);
  frmExpedicaoDelivery.ShowModal;
  frmExpedicaoDelivery.Free;
end;

procedure Tfrm_caixa_restaurante.PngSpeedButton1Click(Sender: TObject);
begin
  inherited;
  if (StrToInt(dm.LeIni(2, 'SALAO', 'estacaoLancamentoSalao')) = 0) then
  begin

    EstornarMesa;
  end
  else
  begin
    showRealDialog(frm_principal, tmErro, 'Erro', 'Operação não permitida nesta estação!', 20, false);
  end;
end;

procedure Tfrm_caixa_restaurante.imgAtencaoClick(Sender: TObject);
begin
  inherited;
  pnExpedicaoClick(Sender);
end;

procedure Tfrm_caixa_restaurante.imgMesaClick(Sender: TObject);
begin
  inherited;

  if (dm.qryMapaMesasSalao.IsEmpty = false) then
  begin

    edNumeroMesa.SetFocus;
    edNumeroMesa.Text := FormatFloat('0000', imgMesa.Tag);
    if (edCodGarcon.Visible = True) then
      edCodGarcon.SetFocus
    else
      edCodProduto.SetFocus;

  end;
  ShowScrollBar(DBCtrlGrid1.Handle, SB_VERT, False); //Remove barra Vertical
end;

procedure Tfrm_caixa_restaurante.imgMesaMouseEnter(Sender: TObject);
begin
  inherited;

  imgMesa.Picture := nil;
  case dm.qryMapaMesasSalao.FieldByName('extratos_emitidos').Value of
    -1:
      begin
        imgMesa.picture.LoadFromFile(patchAplicacao + 'imagens\mesaSemConsumir.png');
//           imgMesa.Picture := imgListMesa.Items[2];

      end;
    0:
      begin
        imgMesa.picture.LoadFromFile(patchAplicacao + 'imagens\mesaConsumindo.png');
          // imgMesa.Picture := imgListMesa.Items[0];
      end;
  else
    begin
      imgMesa.picture.LoadFromFile(patchAplicacao + 'imagens\mesaAguardandoPagamento.png');
          // imgMesa.Picture := imgListMesa.Items[1];
    end;

  end;

  imgMapa.Repaint;

end;

procedure Tfrm_caixa_restaurante.btFuncoesDoCaixaClick(Sender: TObject);
begin
  inherited;
  if (StrToInt(dm.LeIni(2, 'SALAO', 'estacaoLancamentoSalao')) = 0) then
  begin
    podeAtualizar := false;
    Application.CreateForm(TfrmOperacoesDeCaixa, frmOperacoesDeCaixa);
    frmOperacoesDeCaixa.ShowModal;
    frmOperacoesDeCaixa.free;

    if (verificaSeCaixaEstaAberto(ultimoCaixaAberto) = false) then
    begin
      close;
    end;
  end
  else
  begin
    showRealDialog(frm_principal, tmErro, 'Erro', 'Operação não permitida nesta estação!', 20, false);
  end;

end;

procedure Tfrm_caixa_restaurante.btn_peq_produtoClick(Sender: TObject);
begin
  inherited;
  pesquisar_produto();
end;

procedure Tfrm_caixa_restaurante.mostraMapaMesas();
begin
  pgMapaMesas.Show;
  btCancelarItem.Enabled := false;
  btTransferirItem.Enabled := false;
//  btCancelarMesa.Enabled := false;
  btRecebimentosParciais.Enabled := false;
  btReceberConta.Enabled := false;

  dm.transacao.Active := false;
  dm.transacao.Active := true;
  dm.qryMapaMesasSalao.Active := false;
  dm.qryMapaMesasSalao.SQL.Clear;
  DBCtrlGrid1.Visible := false;

  if ckbMesasPagamento.Checked then
  begin
    dm.qryMapaMesasSalao.SQL.Add(' select * from R_MAPA_MESAS(' + Quotedstr('') + ',10) r');
    dm.qryMapaMesasSalao.SQL.Add(' where r.mesa_saida in ');
    dm.qryMapaMesasSalao.SQL.Add('      (select distinct ms.cod_mesa from movimento_mesa ms where ms.pago=1) ');
  end
  else
  begin
    dm.qryMapaMesasSalao.SQL.Add('select * from R_MAPA_MESAS(' + Quotedstr('') + ',10)');
  end;

  dm.qryMapaMesasSalao.Active := true;
  lbQtdMesas.Visible := false;
  lbMesasPagto.Visible := false;

  if (dm.qryMapaMesasSalao.IsEmpty = false) then
  begin
    lbQtdMesas.Visible := true;
    lbMesasPagto.Visible := true;

    DBCtrlGrid1.Visible := true;
    dm.qryMapaMesasSalao.last;
    lbQtdMesas.Caption := Inttostr(dm.qryMapaMesasSalao.fieldbyname('qtdMesas').AsInteger) + ' mesa(s) abertas';
    lbMesasPagto.Caption := Inttostr(dm.qryMapaMesasSalao.fieldbyname('qtdMesasPagamento').AsInteger) + '  mesa(s) em pagto.';
    dm.qryMapaMesasSalao.first;
    ShowScrollBar(DBCtrlGrid1.Handle, SB_VERT, False); //Remove barra Vertical
  end;
end;

procedure Tfrm_caixa_restaurante.SpeedButton2Click(Sender: TObject);
begin
  inherited;

  SendMessage(DBCtrlGrid1.Handle, WM_VSCROLL, SB_PAGEUP, 0);
  ShowScrollBar(DBCtrlGrid1.Handle, SB_VERT, False);

end;

procedure Tfrm_caixa_restaurante.Selecionartodos1Click(Sender: TObject);
begin
  inherited;
  SelecionarTodosOsItens(True);
end;

procedure Tfrm_caixa_restaurante.SelecionarTodosOsItens(ASelecionar: Boolean);
var
  LOperacao: string;
begin
  inherited;

  if ASelecionar then
    LOperacao := 'selecionar'
  else
    LOperacao := 'remeover seleção de';

  try
    try
      dm.SelecionaTodosOsItensMovimentoMesa(ASelecionar);
    except
      on E: Exception do
      begin
        showRealDialog(frm_principal, tmErro, 'Erro', 'Erro ao ' + LOperacao + ' todos os ítens!' + sLineBreak + sLineBreak + E.Message, 22, false);
      end;

    end;
  finally

  end;

end;

procedure Tfrm_caixa_restaurante.SpeedButton1Click(Sender: TObject);
begin
  inherited;

  SendMessage(DBCtrlGrid1.Handle, WM_VSCROLL, SB_PAGEDOWN, 0);
  ShowScrollBar(DBCtrlGrid1.Handle, SB_VERT, False);

end;

procedure Tfrm_caixa_restaurante.timerAtualizaMesasTimer(Sender: TObject);
begin
  inherited;
//  if podeAtualizar then
 //   mostraMapaMesas();
end;

procedure Tfrm_caixa_restaurante.FormCreate(Sender: TObject);
begin
  inherited;
  if (StrToInt(dm.LeIni(2, 'SALAO', 'mostrarCodigoGarcon')) = 0) then
  begin
    edCodGarcon.PasswordChar := '*';
  end;

end;

procedure Tfrm_caixa_restaurante.exibeOpcaoDoMenu(Aopcao: TOpcaoMenu);
begin
  case Aopcao of
    TOpMenu:
      begin
        pnPgListMovimento.Enabled := true;
        pnMenu.Width := 0;
      end;
    TOTransferenciaItem:
      begin
//        pnPgListMovimento.Enabled := false;
        pnMenu.Width := 400;
        dm.qryMotivosEstorno.Active := True;
        cmbMotivoTransferenciaItem.KeyValue := '001';
        pgTransferirItens.Show;
      end;

    TOFotoCliente:
      begin
        pnMenu.Width := 400;
        pgFotoCliente.show;
      end;

    TOCancelamentoItem:
      begin
//       pnMenu.Width := 90;
  //     pgMenu.Show;

      end;
  end;

end;

procedure Tfrm_caixa_restaurante.Exibirimagemcapturada1Click(Sender: TObject);
var
  LBase64Imagem: string;
  LGuidImagem: string;
begin
  inherited;
  try
    LGuidImagem := trim(dm.tbMovimentoMesa.FieldByName('guid_imagem').value);
    if (LGuidImagem = '') then
    begin
      showRealDialog(frm_principal, tmErro, 'Erro', 'Não há imagem capturada para esse lançamento!', 22, false);
    end
    else
    begin
      LBase64Imagem := dm.getBase64FromImageServer(LGuidImagem);
      if (trim(LBase64Imagem) <> '') then
      begin
        exibeOpcaoDoMenu(TOFotoCliente);
        dm.DisplayBase64ImageIncxImage(imgFotoCliente, LBase64Imagem);
      end
      else
      begin
        showRealDialog(frm_principal, tmErro, 'Erro', 'Não há imagem capturada para esse lançamento!', 22, false);
      end;
    end;
  except
    on E: Exception do
    begin
      showRealDialog(frm_principal, tmErro, 'Erro', 'Ocorreu um erro ao exibir a foto!' + sLineBreak + E.message, 16, false);
    end;

  end;

end;

procedure Tfrm_caixa_restaurante.EstornarMesa();
begin
  inherited;
  podeAtualizar := false;

  if (trim(edNumeroMesa.Text) = dm.getCodMesaBalcao) then
    exit;
  if (dm.verificaPermissaoAcao('B20002005', true, true) = true) then
  begin
    if (dm.verificaExtratosEmitidos(edNumeroMesa.text) = false) then
    begin
      dm.exibe_painel_erro('É necessária a emissão de extrato para esta operação ', '');
      exit;
    end
    else
    begin
      if (ShowRealDialog(Self, tmConfirmacao, 'Atenção', 'Confirma o estorno da mesa ?', 22, true) = teSim) then
      begin
        gravarEstornoMesa(edNumeroMesa.Text);
        dm.estornarMesaInteira(marca_impressora_nao_fiscal_01, modelo_impressora_nao_fiscal_01, edNumeroMesa.Text, ed_valor_bruto.Value);
        edNumeroMesa.SetFocus;
      end;

    end;
  end;

end;

procedure Tfrm_caixa_restaurante.btReabrirMesaClick(Sender: TObject);
begin
  inherited;

  if (dm.verificaPermissaoAcao('B20002020', true, true) = true) then
  begin

    showRealDialog(frm_principal, tmSucesso, 'Aviso', 'Mesa reaberta!', 22, false);
    dm.apagaExtratosEmitidos(edNumeroMesa.Text);
  end;

end;

procedure Tfrm_caixa_restaurante.edCodGarconChange(Sender: TObject);
begin
  inherited;
  if ((trim(edCodGarcon.Text) = '010101') and (StrToInt(dm.LeIni(1, 'CAIXA', 'licenciado')) = 1)) then
  begin
    if tipo_cupom = 1 then
      muda_acao(2)
    else
      muda_acao(1);
    edCodGarcon.Clear;
  end;
end;

procedure Tfrm_caixa_restaurante.edQuantidadeEnter(Sender: TObject);
begin
  inherited;
  if (Sender is TEdit) then
    (Sender as TEdit).SelectAll;

end;

procedure Tfrm_caixa_restaurante.validaQuantidade;
begin
  try
    try
      StrToFloat(edQuantidade.Text);

      if StrToFloat(edQuantidade.Text) <= 0 then
        raise Exception.Create('Quantidade inválida!');

      if StrToFloat(edQuantidade.Text) > 5000 then
        raise Exception.Create('Quantidade inválida!');

    except
      on E: Exception do
      begin
        raise Exception.Create('Quantidade inválida!');
      end;

    end;
  finally

  end;
end;

procedure Tfrm_caixa_restaurante.OnExitQuantidade;
begin
  try
    try

      if ((trim(edQuantidade.text) = '') or (trim(edCodProduto.text) = '')) then
      begin
        lb_cod_produto.caption := '';
        edQuantidade.text := '';
        edCodProduto.SetFocus;
        exit;
      end;

      validaQuantidade;
      efetuar_lancamento();

    except
      on E: Exception do
      begin
        showRealDialog(frm_principal, tmErro, 'Erro', 'Quantidade inválida!', 22, false);
        edQuantidade.Clear;
        edQuantidade.SetFocus;
      end;
    end;

  finally

  end;

end;

procedure Tfrm_caixa_restaurante.Panel23Click(Sender: TObject);
begin
  inherited;
  selecionaItemcombo;
end;

procedure Tfrm_caixa_restaurante.Edit1Exit(Sender: TObject);
var
  LNomeEdit: string;
begin
  inherited;

  if (Sender is TEdit) then
    LNomeEdit := (Sender as Tedit).Name;

  case AnsiIndexStr(LNomeEdit, ['edCodGarcon', 'edCodProduto', 'edQuantidade']) of
    0:
      OnExitCodGarcon;
    1:
      begin
        if (trim(edCodProduto.text) <> '') then
          OnexitCodProduto;
      end;
    2:
      OnExitQuantidade;
  end;

end;

procedure Tfrm_caixa_restaurante.OnExitCodGarcon();
begin
  if (trim(edCodGarcon.Text) = '') then
    Exit;

  try
    try
      edCodGarcon.Text := FormatFloat('000', strtofloat(edCodGarcon.Text));
      informacoes_garcon;
    except
      on E: Exception do
      begin
        raise Exception.Create('Código de garçom inválido!');
        edCodGarcon.Clear;
        edCodGarcon.SetFocus;
      end;
    end;
  finally

  end;

end;

procedure Tfrm_caixa_restaurante.OnexitCodProduto();
var
  LProdutoVendeFracionado: Boolean;
  LProdutoLeBalanca: boolean;
  LProduto: Produto.TProduto;
  LCodProduto: string;
begin
  LProduto := Produto.TProduto.Create();

  try
    try

      if (trim(edCodProduto.Text) = '') then
      begin
        edNumeroMesa.SetFocus;
        exit;
      end;

      if trim(edQuantidade.text) = '' then
        edQuantidade.text := '1';

      try
        begin
          StrToInt(edCodProduto.Text);
          edCodProduto.Text := FormatFloat('00000', strtofloat(edCodProduto.Text));
        end;
      except
        begin
        end;
      end;

      LCodProduto := edCodProduto.Text;
      dm.getDadosProduto(TeCodBarras, LCodProduto, LProduto);

      if LProduto.Vende = false then
        raise Exception.Create('O produto selecionado está desabilitado para venda!');

      dm.qryauxiliar.Active := false;
      dm.qryauxiliar.SQL.Clear;
      dm.qryauxiliar.SQL.Add('select * from produtos where cod_barras=' + Quotedstr(edCodProduto.Text));
      dm.qryauxiliar.Active := true;

      lb_cod_produto.Caption := dm.qryauxiliar.fieldbyname('cod_produto').value;
      ed_descricao_produto.Text := dm.qryauxiliar.fieldbyname('descricao').value;
      ed_valor_produto.Text := FormatFloat('#0.00,', dm.qryauxiliar.fieldbyname('valor_unitario').value);

      if (verificaProdutoDigitaPreco(edCodProduto.Text) = true) then
      begin

        ed_valor_produto.Clear;
        ed_valor_produto.Enabled := true;
        ed_valor_produto.ReadOnly := false;
        pnDadosProduto.Enabled := True;
        ed_valor_produto.SetFocus;
      end
      else
      begin
        ed_valor_produto.ReadOnly := true;
        edQuantidade.ReadOnly := false;

        if (verificaSeProdutoLeQuantidadeDaBalanca(edCodProduto.Text, 2) = true) then
        begin
          sucessoLeituraPeso := true;

          try
            begin
              dm.balanca.LePeso(200);
              edQuantidade.Text := pesoLidoBalanca;
            end;
          except
            begin
              sucessoLeituraPeso := false;
              pesoLidoBalanca := '0';
            end;
          end;

          if sucessoLeituraPeso = true then
          begin

            if strToFloat(pesoLidoBalanca) <= 0 then
            begin
              dm.exibe_painel_erro('Erro ao fazer leitura do peso!', 'Continuar');
              sucessoLeituraPeso := false;
              ed_descricao_produto.Clear;
              edQuantidade.Clear;
              edCodProduto.Clear;
              edCodProduto.SetFocus;
              exit;
            end
            else
            begin
              if (verificaSeUsaCodGarcon = False) then
              begin
                edCodGarcon.text := dm.getCodGarconMesaBalcao();
              end;
              if verifica_validade_lancamento then
              begin
                OnExitQuantidade;
//            adicionar_produto_conta(edNumeroMesa.Text, ((dm.verificaProdutoImprimeLocalProducao(lb_cod_produto.Caption)) and (dm.verificaProdutoImprimeMesas(lb_cod_produto.Caption))));
                exit;
              end;
            end;

          end
          else
          begin
            string_auxiliar := 'N';

            pesoLidoBalanca := '0';
            if (ShowRealDialog(Self, tmConfirmacao, 'Confirme', 'Ocorreu um erro na leitura da balança. ' + sLineBreak + 'Deseja digitar o peso manualmente ?') = teSim) then
            begin
              if dm.verificaPermissaoAcao('I20001012', true, true) = true then
              begin
                Application.CreateForm(TfrmDigitaPesoManualmente, frmDigitaPesoManualmente);
                frmDigitaPesoManualmente.ShowModal;
                frmDigitaPesoManualmente.Free;

                if (StrToFloat(pesoLidoBalanca) <= 0) then
                begin
                  exibe_painel_erro('Peso digitado é inválido', 'Ok');
                  edCodProduto.SetFocus;
                  exit;
                end
                else
                begin
                  edquantidade.Text := pesoLidoBalanca;
                end;
              end;
            end
            else
            begin
              pesoLidoBalanca := '0';
              edCodProduto.Clear;
              edCodProduto.SetFocus;
              Exit;
            end;

          end;
          dm.balanca.Desativar;
        end;

        edQuantidade.SetFocus;
      end;
    except
      on E: Exception do
      begin
        ShowRealDialog(Self, tmErro, 'Erro', E.Message);
        edCodProduto.Clear;
        edCodProduto.SetFocus;
        Exit;
      end;

    end;

  finally

    FreeAndNil(LProduto);
  end;
end;

procedure Tfrm_caixa_restaurante.edQuantidadeKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
var
  posicaoAsterisco: SmallInt;
  multiplicador: string;
  valorTotalInStore: string;
  LCodProduto: string;
  LProduto: Produto.TProduto;
  LIsProdutoInstore: boolean;
  unidadeMedida: string;
  qtde: string;
begin

  LProduto := Produto.TProduto.Create;

  try
    try

      if Key = VK_RETURN then
      begin
        if (trim(edCodProduto.Text) = '') then
        begin
          edNumeroMesa.SetFocus;
          exit;
        end;

        if ((Length(LCodProduto) >= 6) and (Length(LCodProduto) <= 13)) then
        begin
          if (trim(Copy(LCodProduto, 0, 1)) = '2') then
          begin
                       // Produto in store
            valorTotalInStore := trim(Copy(LCodProduto, 7, 6)); // Pega o valor total na etiqueta
            Insert(',', valorTotalInStore, 5);
            LCodProduto := trim(Copy(LCodProduto, 2, 4));      // Pega o código do produto3

            try
              LCodProduto := FormatFloat('00000', StrToFloat(LCodProduto));
            except
              raise Exception.Create('Código de produto in store inválido');
            end;

            try
              StrToFloat(valorTotalInStore);
            except
              raise Exception.Create('Valor total de produto in store lido na etiqueta é inválido! ' + valorTotalInStore);
            end;

          end
          else
          begin
                      // Produto de terceiros
            quantidadeLancamento := StrToFloat(edQuantidade.Text);
            if quantidadeLancamento > 1000 then
            begin
              showRealDialog(frm_principal, tmerro, 'Quantidade muito alta!', 'A quantidade que você está lançamento é muito alta.' + sLineBreak + 'Verifique e corrija o problema!', 22, false);
              quantidadeLancamento := 1;
              edQuantidade.Text := '';
              edQuantidade.SetFocus;
              Exit;
            end;

          end;
          dm.getDadosProduto(TeCodBarras, LCodProduto, LProduto);

          if not LProduto.vende then
            raise Exception.Create('O produto informado está desabilitado para venda!');

          if LIsProdutoInstore then
          begin
            quantidadeLancamento := StrToFloat(valorTotalInStore) / LProduto.preco;
            quantidadeLancamento := RoundTo(quantidadeLancamento, -3);
          end;

          lb_cod_produto.Caption := LProduto.codigo;
          ed_descricao_produto.Text := LProduto.Descricao;
          edQuantidade.Text := FormatFloat('#0.000', quantidadeLancamento);
          ed_valor_produto.Text := FormatFloat('#0.00,', LProduto.Preco);
          OnExitQuantidade;
          dm.tbMovimentoMesa.Last;
        end
        else
        begin
          Perform(WM_NEXTDLGCTL, 0, 0)
        end;

      end;

      if Key = VK_ESCAPE then
      begin
        edQuantidade.text := '';
        edCodProduto.SetFocus;
      end;

    except
      on E: Exception do
      begin
        showRealDialog(frm_principal, tmErro, 'Erro', E.Message, 22, false);
      end;

    end;

  finally
    FreeAndNil(LProduto);
  end;

end;

procedure Tfrm_caixa_restaurante.s1Click(Sender: TObject);
var
  LIDPedido: string;
begin
  if (dm.verificaPermissaoAcao('B20002021', true, true) = true) then
  begin
    try
      LIDPedido := Trim(dm.tbMovimentoMesa.FieldByName('guid_order').Value);
      if trim(LIDPedido) <> '' then
      begin
        if (ShowRealDialog(Self, tmConfirmacaoPorPIN, 'Atenção', 'Uma pré-conta dessa mesa já foi emitida. ' + sLineBreak + sLineBreak + 'Deseja continuar ?', 22, true) = teSim) then
        begin
          dm.ForcarReintegracao(LIDPedido);
          ShowRealDialog(frm_principal, tmSucesso, 'Efetuado!', 'Solicitação de reintegração efetuada!');
        end;
      end
      else
      begin
        showRealDialog(frm_principal, tmAviso, '', 'Este pedido não foi originado através de aplicativos integrados!', 22, false);
      end;
    except
      on E: exception do
      begin
        showRealDialog(frm_principal, tmErro, 'Erro', 'Erro ao reintegrar: ' + E.Message, 22, false);
      end;
    end;

  end;
end;

procedure Tfrm_caixa_restaurante.C3Click(Sender: TObject);
var
  LIDPagamento: string;
  LJson: string;
begin

  try
    try

      LIDPagamento := Trim(dm.tbMovimentoMesa.FieldByName('guid_pagamento').Value);
      LJson := dm.GetJsonPagamentoIntegracao(LIDPagamento);
      Clipboard.AsText := LJson;
      ShowRealDialog(frm_principal, tmSucesso, 'Copiado', 'JSON do pagamento copiado para a área de transferência!');
    except
      on E: Exception do
      begin
        showRealDialog(frm_principal, tmErro, 'Erro', 'Erro ao copiar o json: ' + E.message, 22, false);
      end;
    end;
  finally

  end;

end;

procedure Tfrm_caixa_restaurante.ckbMesasPagamentoClick(Sender: TObject);
begin
  mostraMapaMesas;
end;

procedure Tfrm_caixa_restaurante.E1Click(Sender: TObject);
begin
  AbrirListaDeClientes;
end;

procedure Tfrm_caixa_restaurante.AbrirListaDeClientes;
begin
  edNomeCliente.Text := '';
  FiltrarClientesPorNome('');
  pgListaClientes.Show;
  edNomeCliente.setfocus;

end;

procedure Tfrm_caixa_restaurante.btOcultarListaClick(Sender: TObject);
begin
  dm.memTbClientesMesa.active := false;
  pgMapaMesas.Show;
end;

procedure Tfrm_caixa_restaurante.cxGrid2DBTableView1KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Key = 32 then
    SelecionaCliente;
end;

procedure Tfrm_caixa_restaurante.SelecionaCliente;
var
  LValor: integer;
begin

  if dm.memTbClientesMesa.IsEmpty = false then
  begin

    LValor := dm.memTbClientesMesa.FieldByName('sel').Value;

    dm.memTbClientesMesa.Edit;
    if LValor = 0 then
      LValor := 1
    else
      LValor := 0;

    dm.memTbClientesMesa.FieldByName('sel').Value := LValor;
    dm.memTbClientesMesa.post;

  end;
end;

procedure Tfrm_caixa_restaurante.edNomeClienteChange(Sender: TObject);
begin
  FiltrarClientesPorNome(edNomeCliente.TEXT);
end;

procedure Tfrm_caixa_restaurante.FiltrarClientesPorNome(ANome: string);
var
  LSQL: TStringlist;
begin
  LSQL := TStringList.Create;

  try
    try
      dm.memTbClientesMesa.active := false;
      LSQL.add(' select  distinct coalesce(ms.nome_cliente,' + Quotedstr('') + ') as nome_cliente, ');
      LSQL.add('  coalesce(ms.guid_cliente,' + Quotedstr('') + ') as guid_cliente,');
      LSQL.add('  coalesce(ms.cod_cliente,' + Quotedstr('') + ') as cod_cliente,');
      LSQL.add('   0 as sel, ms.cod_mesa as mesa ');
      LSQL.add(' from movimento_mesa ms ');
      LSQL.add(' where ms.nome_cliente like ' + Quotedstr('%' + ANome + '%') + ' or ms.cod_mesa like ' + Quotedstr('%' + ANome + '%'));
      LSQL.add(' order by ms.nome_cliente ');
      dm.getMemTable(dm.memTbClientesMesa, LSQL.text);

    except
      on E: Exception do
      begin
        showRealDialog(frm_principal, tmErro, 'Erro', 'Ocorreu um erro ao listar os clientes: ' + e.Message, 22, false);
      end;

    end;
  finally
    FreeAndNil(LSQL);
  end;

end;

procedure Tfrm_caixa_restaurante.J1Click(Sender: TObject);
begin
  JuntarClientesSelecionados;
end;

procedure Tfrm_caixa_restaurante.JuntarClientesSelecionados();
var
  LMesaDestino: string;
  LSQL: TStringlist;
  LMensagem: string;
  LListaSQL: TList<string>;
  Key: Word;
begin
  LListaSQL := TList<string>.Create;
  LSQL := TStringList.Create;
  LMesaDestino := dm.BuscaMesaDestinoRecebimentoIndividual;
  LSQL := TStringList.Create;
  LMensagem := 'As contas dos clientes ';
  Key := VK_RETURN;
  LDesativarPerguntaPreContaEmitida := true;

  try
    try
      dm.memTbClientesMesa.DisableControls;
      dm.memTbClientesMesa.First;
      while not dm.memTbClientesMesa.eof do
      begin
        if dm.memTbClientesMesa.FieldByName('sel').Value = 1 then
        begin
          LSQL.clear;
          LSQL.add(' update movimento_mesa ms set ms.cod_mesa =' + Quotedstr(LMesaDestino));
          LSQL.add(' where coalesce(ms.guid_cliente,' + Quotedstr('') + ') =' + Quotedstr(dm.memTbClientesMesa.FieldByName('guid_cliente').Value));
          LSQL.add(' and   coalesce(ms.cod_cliente,' + Quotedstr('') + ') =' + Quotedstr(dm.memTbClientesMesa.FieldByName('cod_cliente').Value));
          LSQL.add(' and   coalesce(ms.nome_cliente,' + Quotedstr('') + ') =' + Quotedstr(dm.memTbClientesMesa.FieldByName('nome_cliente').Value));
          LSQL.add(' and ms.cod_mesa =' + Quotedstr(dm.memTbClientesMesa.FieldByName('mesa').Value) + ';');
          LMensagem := LMensagem + dm.memTbClientesMesa.FieldByName('nome_cliente').Value + ',';
          LListaSQL.add(LSQL.text);
        end;
        dm.memTbClientesMesa.Next;
      end;

      LMensagem := LMensagem + sLineBreak + sLineBreak + ' serão transferidos para a mesa ' + LMesaDestino;
      LMensagem := LMensagem + sLineBreak + sLineBreak + 'Você tem certeza ?';

      if (ShowRealDialog(Self, tmConfirmacao, 'Atenção', LMensagem, 16, true) = teSim) then
      begin
        dm.ExecutaBlocoDeInstrucoes(LListaSQL, 100);
        btOcultarLista.Click;

        if (ShowRealDialog(Self, tmConfirmacao, 'Confirme', 'Agrupamento realizado na mesa ' + LMesaDestino + sLineBreak + sLineBreak + 'Deseja emitir pré-conta ?', 16, true) = teSim) then
        begin
          edNumeroMesa.SetFocus;
          edNumeroMesa.Text := LMesaDestino;
          edNumeroMesa.OnKeyDown(edNumeroMesa, Key, []);
          btPreConta.Click;
        end;

        if (ShowRealDialog(Self, tmConfirmacao, 'Confirme', 'Deseja receber essa conta agora ?', 16, true) = teSim) then
        begin
          edNumeroMesa.SetFocus;
          edNumeroMesa.Text := LMesaDestino;
          edNumeroMesa.OnKeyDown(edNumeroMesa, Key, []);
          btReceberConta.Click;
        end
        else
        begin
          edNumeroMesa.SetFocus;
          edNumeroMesa.Text := LMesaDestino;
          edNumeroMesa.OnKeyDown(edNumeroMesa, Key, []);
        end;
      end;

    except
      on E: Exception do
      begin
        showRealDialog(frm_principal, tmErro, 'Erro', 'Erro ao juntar os clientes: ' + e.Message, 22, false);
      end;

    end;
  finally
    FreeAndNil(LSQL);
    FreeAndNil(LListaSQL);
    LDesativarPerguntaPreContaEmitida := false;
    dm.memTbClientesMesa.enableControls;
  end;

end;

procedure Tfrm_caixa_restaurante.JuntarContaClientesSelecionados;
begin

end;

procedure Tfrm_caixa_restaurante.S2Click(Sender: TObject);
begin
  SepararContaCoClienteSelecionado;
end;

end.

